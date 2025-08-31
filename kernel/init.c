#include <kernel/led.h>
#include <kernel/console.h>
#include <kernel/vm.h>
#include <kernel/uart.h>
#include <kernel/utils.h>
#include <kernel/kalloc.h>
#include <kernel/monitor.h>
#include <proc.h>
#include <kernel/timer.h>

//starts executing c code here
//init is in ASM code

void kernel_main(void) {
    kalloc_init(ALLOCATABLE_MEMORY_START,
                KERNEL_BASE + INITIAL_MEMORY_SIZE);
    vm_init();
    proc_init();
    console_init();
#ifdef AARCH_32
#elif AARCH_64
	int el = get_el();
	printk("\n----- Exception level: EL%d -----\n", el);
#endif

	/* Interrupts */
	printk("Initializing IRQs...");
	irq_vector_init();
	printk("Done\n");
	printk("Enabling IRQ controllers...");
	enable_interrupt_controller();
	printk("Done\n");
	printk("Enabling IRQs...");
	irq_enable();
	printk("Done\n");
	printk("Initializing LED...");
	led_init(LED_PIN);
	printk("Done\n");
    kalloc_init(KERNEL_BASE + INITIAL_MEMORY_SIZE,
                KERNEL_BASE + TOTAL_MEMORY_SIZE);
    {
        struct Process *proc = proc_create();
        proc_load_program(proc, 0);
        scheduler_init();
        schedule();
    }
}

