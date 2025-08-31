#ifndef PROC_H
#define PROC_H

#include <kernel/vm.h>
#include <kernel/types.h>

typedef void (*entry_function)(void);

#define PROCESS_COUNT_MAX 10

#define CONTEXT_SAVE_SIZE (CONTEXT_SIZE * sizeof(uint64_t))

#define USER_STACK_TOP     0x0000800000000000UL  // Top of user virtual memory
#define USER_HEAP_START    0x0000000000400000UL  // Start of heap
#define USER_CODE_START    0x0000000000010000UL  // Start of code segment
#define KERNEL_STACK_SIZE  0x4000                // 16KB kernel stack per process

#define PROC_FLAG_AARCH64    0x01  
#define PROC_FLAG_AARCH32    0x02  

enum ProcessState {
    UNUSED,
    CREATED,
    SLEEPING,
    READY,
    RUNNING,
    TERMINATED
};

#ifdef AARCH32
enum ContextItem {
    CPSR, RESTART_ADDR,
    R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12,
    SP, LR
};

#else
enum ContextItem {
    SPSR_EL1, ELR_EL1,
    X0, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15,
    X16, X17, X18, X19, X20, X21, X22, X23, X24, X25, X26, X27, X28, X29, X30,
    SP_EL0,
    CONTEXT_SIZE
};
#endif

struct Process {
    enum ProcessState state;
    int pid;
    entry_function entry;
    struct SectionTableEntry *vm;
    uint32_t heap_size;
    char *user_stack;
    char *kernel_stack;
    int context[17];
    int wait_pid;
    int child_return_value;
#ifdef
    /* ARMv8-A specific fields */
    uint64_t tpidr_el0;          // Thread ID register for user space
    uint64_t tpidrro_el0;        // Read-only thread ID registerc
#endif
};

#define ELF_MAGIC 0x464C457FU
#define ELF_CLASS_64 2           // 64-bit architecture
#define ELF_DATA_LSB 1           // Little endian
#define ELF_MACHINE_AARCH64 183  // AArch64 machine type

enum ElfType {
    ELFTYPE_NONE        = 0,
    ELFTYPE_RELOCATABLE = 1,
    ELFTYPE_EXECUTABLE  = 2
};

#ifdef AARCH32
struct ElfHeader {
    uint32_t magic;
    char elf[12];
    uint16_t type;
    uint16_t machine;
    uint32_t version;
    uint32_t entry;
    uint32_t phoff;
    uint32_t shoff;
    uint32_t flags;
    uint16_t ehsize;
    uint16_t phentsize;
    uint16_t phnum;
    uint16_t shentsize;
    uint16_t shnum;
    uint16_t shstrndx;
};

struct ElfProgramHeader {
    uint32_t type;
    uint32_t off;
    uint32_t vaddr;
    uint32_t paddr;
    uint32_t filesz;
    uint32_t memsz;
    uint32_t flags;
    uint32_t align;
};

#else 
struct ElfHeader {
    uint32_t magic;
    uint8_t  elf_class;          // EI_CLASS - 32/64 bit
    uint8_t  data;               // EI_DATA - endianness
    uint8_t  version;            // EI_VERSION
    uint8_t  osabi;              // EI_OSABI
    uint8_t  abiversion;         // EI_ABIVERSION
    uint8_t  pad[7];             // EI_PAD
    uint16_t type;               // Object file type
    uint16_t machine;            // Machine type
    uint32_t version32;          // Object file version
    uint64_t entry;              // Entry point address (64-bit)
    uint64_t phoff;              // Program header offset (64-bit)
    uint64_t shoff;              // Section header offset (64-bit)
    uint32_t flags;              // Processor-specific flags
    uint16_t ehsize;             // ELF header size
    uint16_t phentsize;          // Program header entry size
    uint16_t phnum;              // Number of program header entries
    uint16_t shentsize;          // Section header entry size
    uint16_t shnum;              // Number of section header entries
    uint16_t shstrndx;           // Section header string table index
};

struct ElfProgramHeader {
    uint32_t type;               // Segment type
    uint32_t flags;              // Segment flags
    uint64_t off;                // Segment offset in file (64-bit)
    uint64_t vaddr;              // Virtual address (64-bit)
    uint64_t paddr;              // Physical address (64-bit)
    uint64_t filesz;             // Size in file (64-bit)
    uint64_t memsz;              // Size in memory (64-bit)
    uint64_t align;              // Alignment (64-bit)
};
#endif

/* public symbols */
extern struct Process *current_process;
extern struct Process process_table[PROCESS_COUNT_MAX];

enum ExceptionLevel {
    EL0_USER    = 0,             // User mode
    EL1_KERNEL  = 1,             // Kernel mode
    EL2_HYP     = 2,             // Hypervisor mode
    EL3_SECURE  = 3              // Secure monitor mode
};

/* proc.c */
void proc_init(void);
struct Process *proc_create(void);
void proc_free(struct Process *proc);
void proc_expand_memory(struct Process *proc, int page_count);
void proc_shrink_memory(struct Process *proc, int page_count);
bool proc_load(struct Process *proc, char **proc_image, int page_count);
void proc_start(struct Process *proc);
int *get_current_context(void);
struct Process *proc_get(int pid);

/* ARMv8-A specific functions */
void proc_set_exception_level(struct Process *proc, enum ExceptionLevel el);
void proc_save_context(struct Process *proc, uint64_t *context);
void proc_restore_context(struct Process *proc);
bool proc_is_aarch64(struct Process *proc);

/* scheduler.c */
void scheduler_init(void);
void schedule(void);
void dump_scheduler_status(void);

/* syscall_exec.c */
bool proc_load_program(struct Process *proc, int program_index);

/* system calls */
int syscall_exit(int arg1);
int syscall_getpid(void);
int syscall_fork(void);
int syscall_exec(int id);
int syscall_yield(void);
int syscall_wait(int id);

/* ARMv8-A specific system calls */
int syscall_set_thread_area(uint64_t addr);  // Set thread-local storage
int syscall_get_thread_area(void);           // Get thread-local storage


#endif
