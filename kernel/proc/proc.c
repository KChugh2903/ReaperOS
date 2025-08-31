#include <kernel/vm.h>
#include <kernel/proc.h>
#include <kernel/kalloc.h>
#include <kernel/klib.h>
#include <lib/string.h>
#include <lib/stdio.h>
#include <kernel/system.h>
#include <kernel/types.h>

struct Process process_table[PROCESS_COUNT_MAX];
__attribute__((__aligned__(SECTION_TABLE_ALIGNMENT)))
struct SectionTableEntry process_vm[PROCESS_COUNT_MAX][4096];
struct Process *current_process = NULL;

/* Architecture detection */
static bool is_aarch64_capable(void) {
    uint64_t id_aa64pfr0;
    __asm__ volatile("mrs %0, id_aa64pfr0_el1" : "=r"(id_aa64pfr0));
    return (id_aa64pfr0 & 0xF) == 0x1;  // Check if AArch32 is supported at EL0
}

void proc_init(void) {
    int i;
    for (i = 0; i < PROCESS_COUNT_MAX; i++) {
        process_table[i].state = UNUSED;
        process_table[i].arch_flags = 0;
    }
    current_process = NULL;
}

struct Process *proc_create(void) {
    struct Process *proc = NULL;
    int i;
    int pid = -1;
    struct SectionTableEntry *vm = NULL;
    char *kernel_stack = NULL;
    char *user_stack = NULL;
    
    for (i = 0; i < PROCESS_COUNT_MAX; i++) {
        if (process_table[i].state == UNUSED) {
            pid = i + 1;
            break;
        }
    }
    if (pid == -1) {
        return NULL;
    }
    
    kernel_stack = kalloc();
    user_stack = kalloc();
    vm = process_vm[pid - 1];
    setup_kernel_vm(vm);
    
    map_pages(vm, (struct MemoryMapping) {
        KERNEL_STACK_BOTTOM,
        V2P(kernel_stack),
        V2P(kernel_stack) + PAGE_SIZE,
        AP_RW_R
    });
    map_pages(vm, (struct MemoryMapping) {
        USER_STACK_BOTTOM,
        V2P(user_stack),
        V2P(user_stack) + PAGE_SIZE,
        AP_RW_R
    });
    
    proc = &process_table[pid - 1];
    proc->pid = pid;
    proc->state = CREATED;
    proc->vm = vm;
    proc->heap_size = 0;
    proc->kernel_stack = kernel_stack;
    proc->user_stack = user_stack;
    proc->wait_pid = -1;
    
    proc->arch_flags = PROC_FLAG_AARCH64; 
    proc->tpidr_el0 = 0;
    proc->tpidrro_el0 = 0;
    
    return proc;
}

void proc_free(struct Process *proc) {
    kfree(proc->kernel_stack);
    kfree(proc->user_stack);
    proc_shrink_memory(proc, proc->heap_size / PAGE_SIZE);
    free_vm_page_tables(proc->vm);
    proc->state = UNUSED;
    proc->arch_flags = 0;
}

void proc_expand_memory(struct Process *proc, int page_count) {
    int i = 0;
    for (i = 0; i < page_count; i++) {
        char *page = kalloc();
        memset(page, 0, PAGE_SIZE);
        map_pages(proc->vm, (struct MemoryMapping){
            proc->heap_size,
            V2P(page),
            V2P(page) + PAGE_SIZE,
            AP_RW_RW
        });
        proc->heap_size += PAGE_SIZE;
    }
}

void proc_shrink_memory(struct Process *proc, int page_count) {
    int i = 0; 
    for (i = 0; i < page_count; i++) {
        uint64_t virtual_addr = proc->heap_size - PAGE_SIZE;
        uint64_t physical_addr = resolve_physical_address(proc->vm, virtual_addr);
        uint64_t kernel_addr = P2V(physical_addr);
        kfree((void*) kernel_addr);
        unmap_page(proc->vm, virtual_addr);
        proc->heap_size -= PAGE_SIZE;
        if (proc->heap_size == 0) {
            break;
        }
    }
}

static bool is_elf_aarch32(struct ElfHeader *header) {
    return (header->elf_class == 1 && header->machine == 40);  // EI_CLASS32, EM_ARM
}

static bool is_elf_aarch64(struct ElfHeader *header) {
    return (header->elf_class == ELF_CLASS_64 && header->machine == ELF_MACHINE_AARCH64);
}

bool proc_load(struct Process *proc, char **proc_image, int page_count) {
    int prog_header_offset = 0;
    int prog_header_count = 0;
    int i = 0;
    struct ElfHeader *header = (struct ElfHeader *) proc_image[0];
    bool is_aarch64 = false;
    bool is_aarch32 = false;
    if (header->type != ELFTYPE_EXECUTABLE) {
        return false;
    }
    is_aarch64 = is_elf_aarch64(header);
    is_aarch32 = is_elf_aarch32(header);
    
    if (!is_aarch64 && !is_aarch32) {
        return false; 
    }
    if (is_aarch32 && !is_aarch64_capable()) {
        return false; 
    }
    if (is_aarch64) {
        proc->arch_flags = PROC_FLAG_AARCH64;
    } else {
        proc->arch_flags = PROC_FLAG_AARCH32;
    }
    
    (void) page_count;
    prog_header_offset = header->phoff;
    prog_header_count = header->phnum;
    
    for (i = 0; i < prog_header_count; i++) {
        uint64_t j = 0;
        struct ElfProgramHeader *prog_header = (void *) (proc_image[0] + prog_header_offset);
        while (proc->heap_size < prog_header->vaddr + prog_header->memsz) {
            proc_expand_memory(proc, 1);
        }
        
        for (j = 0; j < prog_header->memsz; j++) {
            uint64_t vaddr = prog_header->vaddr + j;
            uint64_t paddr = resolve_physical_address(proc->vm, vaddr);
            char *ptr = (char *) P2V(paddr);
            uint64_t image_off = prog_header->off + j;
            *ptr = proc_image[image_off / PAGE_SIZE][image_off % PAGE_SIZE];
        }
        prog_header_offset += sizeof(struct ElfProgramHeader);
    }
    
    proc->entry = (entry_function) header->entry;
    proc->state = READY;
    if (proc->arch_flags & PROC_FLAG_AARCH64) {
        proc_init_aarch64_context(proc, (uint64_t)proc->entry, USER_STACK_TOP);
    } else {
        proc_init_aarch32_context(proc, (uint32_t)proc->entry, USER_STACK_BOTTOM + PAGE_SIZE);
    }
    return true;
}

void proc_start(struct Process *proc) {
    current_process = proc;
    set_translation_table_base((uint64_t) V2P(proc->vm));
    if (proc->arch_flags & PROC_FLAG_AARCH64) {
        __asm__ volatile("tlbi vmalle1is");
        __asm__ volatile("dsb sy");
        __asm__ volatile("isb");
    } else {
        __asm__ volatile("mov r4, #0");
        __asm__ volatile("mcr p15, 0, r4, c8, c7, 0");
    }
    
    switch_to_context(proc->context);
}

uint64_t *get_current_context(void) {
    return current_process->context;
}

/* Legacy 32-bit context access for compatibility */
int *get_current_context_32(void) {
    if (current_process && (current_process->arch_flags & PROC_FLAG_AARCH32)) {
        return (int*)current_process->context;
    }
    return NULL;
}

struct Process *proc_get(int pid) {
    if (pid > 0 && pid <= PROCESS_COUNT_MAX) {
        return &process_table[pid - 1];
    } else {
        return NULL;
    }
}

/* Architecture-specific context initialization */

void proc_init_aarch64_context(struct Process *proc, uint64_t entry_point, uint64_t stack_pointer) {
    memset(proc->context, 0, sizeof(proc->context));
    proc->context[SPSR_EL1] = 0x0;  // EL0t, interrupts enabled
    proc->context[ELR_EL1] = entry_point;
    proc->context[SP_EL0] = stack_pointer;
    proc->arch_flags |= PROC_FLAG_AARCH64;
}

void proc_init_aarch32_context(struct Process *proc, uint32_t entry_point, uint32_t stack_pointer) {
    memset(proc->context, 0, sizeof(proc->context));
    proc->context[SPSR_EL1] = 0x10 | (1UL << 4);  // AArch32 user mode + AArch32 execution state
    proc->context[ELR_EL1] = entry_point;
    proc->context[X13] = stack_pointer;  // Map to AArch32 SP
    // Set AArch32 CPSR equivalent in SPSR
    proc->context[SPSR_EL1] = (proc->context[SPSR_EL1] & ~0x1F) | 0x10;  // User mode
    proc->arch_flags |= PROC_FLAG_AARCH32;
}

/* ARMv8-A specific functions with dual architecture support */

void proc_set_exception_level(struct Process *proc, enum ExceptionLevel el) {
    uint64_t spsr = proc->context[SPSR_EL1];
    
    if (proc->arch_flags & PROC_FLAG_AARCH64) {
        // AArch64 exception level setting
        spsr &= ~(0x3UL << 2);
        switch (el) {
            case EL0_USER:
                spsr |= (0x0UL << 2);
                break;
            case EL1_KERNEL:
                spsr |= (0x1UL << 2);
                break;
            case EL2_HYP:
                spsr |= (0x2UL << 2);
                break;
            case EL3_SECURE:
                spsr |= (0x3UL << 2);
                break;
        }
    } else {
        // AArch32 mode setting (mapped to exception levels)
        spsr &= ~0x1F;
        switch (el) {
            case EL0_USER:
                spsr |= 0x10;  // User mode
                break;
            case EL1_KERNEL:
                spsr |= 0x13;  // Supervisor mode
                break;
            case EL2_HYP:
                spsr |= 0x1A;  // Hyp mode
                break;
            case EL3_SECURE:
                spsr |= 0x16;  // Monitor mode
                break;
        }
    }
    proc->context[SPSR_EL1] = spsr;
}

void proc_save_context(struct Process *proc, uint64_t *context) {
    int i;
    for (i = 0; i < CONTEXT_SIZE; i++) {
        proc->context[i] = context[i];
    }
    if (proc->arch_flags & PROC_FLAG_AARCH64) {
        if ((proc->context[SPSR_EL1] & 0xF) == 0) {
            __asm__ volatile("mrs %0, tpidr_el0" : "=r"(proc->tpidr_el0));
            __asm__ volatile("mrs %0, tpidrro_el0" : "=r"(proc->tpidrro_el0));
        }
    }
}

void proc_restore_context(struct Process *proc) {
    set_translation_table_base((uint64_t) V2P(proc->vm));
    if (proc->arch_flags & PROC_FLAG_AARCH64) {
        if ((proc->context[SPSR_EL1] & 0xF) == 0) {
            __asm__ volatile("msr tpidr_el0, %0" :: "r"(proc->tpidr_el0));
            __asm__ volatile("msr tpidrro_el0, %0" :: "r"(proc->tpidrro_el0));
        }
        __asm__ volatile("tlbi vmalle1is");
        __asm__ volatile("dsb sy");
        __asm__ volatile("isb");
    } else {
        __asm__ volatile("mov r4, #0");
        __asm__ volatile("mcr p15, 0, r4, c8, c7, 0");
    }
}

bool proc_is_aarch64(struct Process *proc) {
    return (proc->arch_flags & PROC_FLAG_AARCH64) != 0;
}

bool proc_is_aarch32(struct Process *proc) {
    return (proc->arch_flags & PROC_FLAG_AARCH32) != 0;
}


int syscall_set_thread_area(uint64_t addr) {
    if (current_process == NULL) {
        return -1;
    }
    
    if (current_process->arch_flags & PROC_FLAG_AARCH64) {
        current_process->tpidr_el0 = addr;
        __asm__ volatile("msr tpidr_el0, %0" :: "r"(addr));
        return 0;
    }
    return -1;
}

int syscall_get_thread_area(void) {
    if (current_process == NULL) {
        return -1;
    }
    
    if (current_process->arch_flags & PROC_FLAG_AARCH64) {
        return (int) current_process->tpidr_el0;
    }
    return -1;
}

uint64_t proc_get_register(struct Process *proc, enum ContextItem reg) {
    if (reg < CONTEXT_SIZE) {
        return proc->context[reg];
    }
    return 0;
}

void proc_set_register(struct Process *proc, enum ContextItem reg, uint64_t value) {
    if (reg < CONTEXT_SIZE) {
        if (proc->arch_flags & PROC_FLAG_AARCH32) {
            if (reg >= X0 && reg <= X30) {
                proc->context[reg] = value & 0xFFFFFFFFUL;
            } else {
                proc->context[reg] = value;
            }
        } else {
            proc->context[reg] = value;
        }
    }
}

int proc_convert_to_aarch32(struct Process *proc) {
    if (!is_aarch64_capable()) {
        return -1; 
    }
    if (proc->arch_flags & PROC_FLAG_AARCH32) {
        return 0;  
    }
    uint64_t pc = proc->context[ELR_EL1];
    uint64_t sp = proc->context[SP_EL0];
    uint32_t spsr = (uint32_t)(proc->context[SPSR_EL1] & 0xFFFFFFFF);
    proc_init_aarch32_context(proc, (uint32_t)pc, (uint32_t)sp);
    return 0;
}

int proc_convert_to_aarch64(struct Process *proc) {
    if (proc->arch_flags & PROC_FLAG_AARCH64) {
        return 0;  // Already AArch64
    }
    uint32_t pc = (uint32_t)proc->context[ELR_EL1];
    uint32_t sp = (uint32_t)proc->context[X13]; 
    proc_init_aarch64_context(proc, (uint64_t)pc, (uint64_t)sp);
    return 0;
}


void proc_dump_context(struct Process *proc) {
    int i;
    kprintf("Process %d context (arch: %s):\n", proc->pid, 
           proc_is_aarch64(proc) ? "AArch64" : "AArch32");
    
    if (proc->arch_flags & PROC_FLAG_AARCH64) {
        kprintf("  SPSR_EL1: 0x%016lx\n", proc->context[SPSR_EL1]);
        kprintf("  ELR_EL1:  0x%016lx\n", proc->context[ELR_EL1]);
        kprintf("  SP_EL0:   0x%016lx\n", proc->context[SP_EL0]);
        for (i = X0; i <= X30; i++) {
            kprintf("  X%d: 0x%016lx\n", i - X0, proc->context[i]);
        }
    } else {
        kprintf("  SPSR: 0x%08x\n", (uint32_t)proc->context[SPSR_EL1]);
        kprintf("  PC:   0x%08x\n", (uint32_t)proc->context[ELR_EL1]);
        kprintf("  SP:   0x%08x\n", (uint32_t)proc->context[X13]);
        for (i = X0; i <= X12; i++) {
            kprintf("  R%d: 0x%08x\n", i - X0, (uint32_t)proc->context[i]);
        }
    }
}