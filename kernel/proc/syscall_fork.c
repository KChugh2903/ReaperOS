#include <stdint.h>
#include <kernel/scheduler.h>
#include <kernel/proc.h>
#include <lib/string.h>

int syscall_fork(void) {
    struct Process *child = NULL;
    struct Process *parent = current_process;
    uint32_t i = 0;
    child = proc_create();
    proc_expand_memory(child, parent->heap_size / PAGE_SIZE);
    for (i = 0; i < parent->heap_size; i++) {
        int child_paddr = resolve_physical_address(child->vm, i);
        char *child_ptr = (char *) P2V(child_paddr);
        char *parent_ptr = (char *) i;
        *child_ptr = *parent_ptr;
    }
    memcpy(child->kernel_stack, parent->kernel_stack, PAGE_SIZE);
    memcpy(child->user_stack, parent->user_stack, PAGE_SIZE);
    memcpy(child->context, parent->context, sizeof(child->context));
    child->context[R0] = 0;
    child->state = READY;
    return child->pid;
}