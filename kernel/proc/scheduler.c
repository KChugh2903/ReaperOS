/**
 * \ingroup processes
 * @file scheduler.c
 * @brief Implementation of scheduler functions using proc.h interface.
 */

#include <stdint.h>
#include <stddef.h>
#include <kernel/proc.h>
#include <kernel/monitor.h>
#include <kernel/system.h>
#include <kernel/klib.h>
#include <kernel/timer.h>
#include <kernel/vm.h>
#include <kernel/irq.h>

#ifdef AARCH_32
#include <armv6/irq.h>
#elif AARCH_64
#include <armv8-a/irq.h>
#endif

static int round_robin_index;

int nr_processes = 0;

void handle_timer(void) {
    timer_clear_interrupt();
    timer_tick();
}

void scheduler_init(void) {
    round_robin_index = 1;
    timer_set_interval(200000);
    register_interrupt_handler(TIMER_IRQ, handle_timer);
    proc_init();
}

void preempt_disable() {
    if (current_process)
        current_process->context[R0]++; // Using R0 as preempt counter
}

void preempt_enable() {
    if (current_process)
        current_process->context[R0]--;
}

void schedule_tail() {
    preempt_enable();
}

void switch_to(struct Process *next) {
    if (current_process == next)
        return;
    struct Process *prev = current_process;
    current_process = next;
    if (prev && prev->state == RUNNING) {
        prev->state = READY;
    }
    if (next) {
        next->state = RUNNING;
    }
    proc_start(next);
}

/**
 * Function for printing the process table for debugging.
 */
void DEBUG_print_processes(void) {
    for (int i = 0; i < PROCESS_COUNT_MAX; i++) {
        struct Process *proc = &process_table[i];
        if (proc->state != UNUSED) {
            kprintf("--- DEBUG:    %d: pid: %d, state: %d, sp: %x\n", 
                   i, proc->pid, proc->state, proc->context[SP]);
        }
    }
}

/**
 * Core scheduler function.
 * @details Gets called from:
 * - schedule()
 * - timer_tick()
 */
void _schedule(void) {
    preempt_disable();
    int next_idx = -1;
    int highest_priority = -1;
    struct Process *p;
    for (int i = 0; i < PROCESS_COUNT_MAX; i++) {
        int idx = (round_robin_index + i) % PROCESS_COUNT_MAX;
        p = &process_table[idx];

        if (p->state == READY) {
            if (next_idx == -1) {
                next_idx = idx;
                highest_priority = p->pid;
                break; 
            }
        }
    }
    if (next_idx != -1) {
        round_robin_index = (next_idx + 1) % PROCESS_COUNT_MAX;
        kprintf("\nSelected for scheduling process %d (pid: %d)\n", 
               next_idx, process_table[next_idx].pid);
        switch_to(&process_table[next_idx]);
    } else {
        dump_scheduler_status();
        kprintf("PANIC: No ready processes found\n");
        while(1);
    }
    preempt_enable();
}

void schedule(void) {
    if (current_process && current_process->state == RUNNING) {
        current_process->state = READY;
    }
    _schedule();
}

void timer_tick() {
    if (!current_process) {
        return;
    }
    if (current_process->context[R0] > 0) {
        return;
    }

    current_process->state = READY;
    irq_enable();
    _schedule();        /* Call scheduler */
    irq_disable();      /* Disable interrupts */
}

void dump_scheduler_status(void) {
    kprintf("Scheduler Status:\n");
    kprintf("Current process: %s\n", 
           current_process ? "Set" : "NULL");
    kprintf("Round robin index: %d\n", round_robin_index);
    kprintf("Index: ");
    for (int i = 0; i < PROCESS_COUNT_MAX; i++) {
        if (i == round_robin_index) {
            kprintf("v");
        } else {
            kprintf(" ");
        }
    }
    kprintf("\n");
    kprintf("Proc:  ");
    for (int i = 0; i < PROCESS_COUNT_MAX; i++) {
        kprintf("%d", i);
    }
    kprintf("\n");
    kprintf("State: ");
    for (int i = 0; i < PROCESS_COUNT_MAX; i++) {
        kprintf("%d", process_table[i].state);
    }
    kprintf("\n");
    kprintf("PID:   ");
    for (int i = 0; i < PROCESS_COUNT_MAX; i++) {
        if (process_table[i].state != UNUSED) {
            kprintf("%d", process_table[i].pid);
        } else {
            kprintf("-");
        }
    }
    kprintf("\n");
}