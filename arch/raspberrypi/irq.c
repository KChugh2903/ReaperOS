#include <irq.h>
#include <vm.h>
#include <lib/string.h>
#include <klib.h>

#define PIC MMIO_P2V(0x20000000)
#define PIC_STATUS 0x81
#define PIC_INT_ENABLE 0x84

void enable_irq_line(int line) {
    PIC[PIC_INT_ENABLE] = (1 << line);
}

void get_pending_irqs(bool *result) {
    int i = 0;
    unsigned int irq_status = PIC[PIC_STATUS];
    memset(result, 0, IRQ_COUNT * sizeof(bool));
    for (i = 0; i < 32; i++) {
        if (irq_status & (1U << i)) {
            result[i] = true;
        }
    }
};