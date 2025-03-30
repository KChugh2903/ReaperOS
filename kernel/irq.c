#include <irq.h>
#include <klib.h>

interrupt_handler interrupt_handler_vector[IRQ_COUNT] = {0};

void register_interrupt_handler(int interrupt_line, interrupt_handler handler) {
	enable_irq_line(interrupt_line);
	interrupt_handler_vector[interrupt_line] = handler;
}

void dispatch_interrupts(void) {
	interrupt_handler handler = 0;
	bool pending_irqs[IRQ_COUNT];
	int i = 0;
	get_pending_irqs(pending_irqs);
	for (i = 0; i < IRQ_COUNT; i++) {
		if (pending_irqs[i]) {
			handler = interrupt_handler_vector[i];
			if (handler != 0) {
				handler();
            }
		}
    }

}