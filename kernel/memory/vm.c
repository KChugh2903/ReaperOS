#include <kernel/vm.h>
#include <lib/string.h>
#include <kernel/kalloc.h>
#include <kernel/klib.h>
#include <kernel/system.h>
#include <kernel/types.h>

#include <armv8-a/hardware.h>

static void map_page(struct SectionTableEntry *vm, uint32_t physical, uint32_t virtual, int access_perms);

static struct MemoryMapping kernel_mappings[] = {
    {KERNEL_BASE, 0, V2P(kernel_end), AP_RW_D},
	{MMIO_BASE, MMIO_BASE_PHYSICAL, MMIO_BASE_PHYSICAL + 0x400000, AP_RW_D},
	{INTERRUPT_VECTOR_BASE, 0, PAGE_SIZE, AP_RW_D},
	{ALLOCATABLE_MEMORY_START, V2P(ALLOCATABLE_MEMORY_START),
		TOTAL_MEMORY_SIZE, AP_RW_D}
};

const int kernel_mapping_count = 4;
struct SectionTableEntry *kernel_vm = NULL;

void vm_init(void) {
    kernel_vm = (void*) ROUND_UP(KERNEL_SECTION_TABLE, SECTION_TABLE_ALIGNMENT);
    setup_kernel_vm(kernel_vm);
    //VIPT
    set_translation_table_base((uint32_t) V2P(KERNEL_BASE));
}

void setup_kernel_vm(struct SectionTableEntry *kernel_vm) {
    int i = 0;
    memset(kernel_vm, 0, SECTION_TABLE_SIZE);
    for (i = 0; i < kernel_mapping_count; i++) {
        map_pages(kernel_vm, kernel_mappings[i]);
    }
}

void map_pages(struct SectionTableEntry *vm, struct MemoryMapping mapping) {
    uint32_t physical_curr = 0;
    uint32_t virtual_curr = 0;
    uint32_t virtual_start = ROUND_DOWN(mapping.virtual_address, PAGE_SIZE);
    uint32_t physical_start = ROUND_DOWN(mapping.physical_start, PAGE_SIZE);
    uint32_t physical_end = ROUND_DOWN(mapping.physical_end, PAGE_SIZE);
    virtual_curr = virtual_start;
    for (physical_curr = physical_start; physical_curr != physical_end; physical_curr += PAGE_SIZE) {
        map_page(vm, physical_curr, virtual_curr, mapping.access_permissions);
        virtual_curr += PAGE_SIZE;
    }
}

void free_vm_page_tables(struct SectionTableEntry *vm) {
    int i = 0;
    for (i = 0; i < 4096; i++) {
        if (vm[i].desc_type != 0) {
            void *page_table = (void *) P2V(BASE_TO_PAGE_TABLE(vm[i].base_address));
            kfree1k(page_table);
        }
    }
}

static void map_page(struct SectionTableEntry *vm, uint32_t physical, uint32_t virtual_addr, int access_perms) {
    struct PageTableEntry *page_table = NULL;
    uint32_t section_index = SECTION_INDEX(virtual_addr);
    uint32_t page_index = PAGE_INDEX(virtual_addr);
    if (vm[section_index].desc_type == 0) {
        page_table = kalloc1k();
        memset(page_table, 0, PAGE_TABLE_SIZE);
        vm[section_index].base_address = PAGE_TABLE_TO_BASE(V2P(page_table));
        vm[section_index].desc_type = SECTION_DESC;
        vm[section_index].domain = 0;
    } else {
        page_table = (void *) P2V(BASE_TO_PAGE_TABLE(vm[section_index].base_address));
    }  
    page_table[page_index].desc_type = PAGE_DESC;
    page_table[page_index].bufferable = 0;
    page_table[page_index].cacheable = 0;
    page_table[page_index].access_permissions = access_perms;
    page_table[page_index].base_address = PAGE_TO_BASE(physical);
}

void unmap_page(struct SectionTableEntry *vm, uint32_t virtual_addr) {
    struct PageTableEntry *page_table = NULL;
    uint32_t section_index = SECTION_INDEX(virtual_addr);
    uint32_t page_index = PAGE_INDEX(virtual_addr);
    page_table = (void *) P2V(BASE_TO_PAGE_TABLE(vm[section_index].base_address));
    page_table[page_index].desc_type = 0;
}

uint32_t resolve_physical_address(struct SectionTableEntry *vm, uint32_t virtual) {
    struct SectionTableEntry *section = NULL;
    struct PageTableEntry *page = NULL;
    uint32_t result = 0;
    void *base_addr = 0;
    section = (void *) ((uint32_t) vm | ((virtual >> 20) << 2));
    base_addr = (void *) (section->base_address << 10);
    page = (void *) ((uint32_t) base_addr | ((virtual >> 10) & 0x3FC));
    result = (page->base_address << 12) | (virtual & 0xFFF);
    return result;
}