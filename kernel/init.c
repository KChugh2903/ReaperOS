#include <console.h>
#include <vm.h>
#include <kalloc.h>
#include <monitor.h>
#include <proc.h>
#include <timer.h>

//starts executing c code here
//init is in ASM code

void c_entry(void) {
    kalloc_init(ALLOCATABLE_MEMORY_START,
                KERNEL_BASE + INITIAL_MEMORY_SIZE);
    vm_init();
    proc_init();
    console_init();
    kalloc_init(KERNEL_BASE + INITIAL_MEMORY_SIZE,
                KERNEL_BASE + TOTAL_MEMORY_SIZE);
    {
        struct Process *proc = proc_create();
        proc_load_program(proc, 0);
        scheduler_init();
        schedule();
    }
}

