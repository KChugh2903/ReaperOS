#include <kernel/vm.h>
#include <armv8-a/scheduler.h>

.global enable_interrupts
enable_interrupts:
    msr daifclr, #2    // Clear IRQ mask (bit 1 of DAIF)
    ret

.global use_high_interrupts
use_high_interrupts:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    bl read_control_register
    orr x0, x0, #0x2000
    bl set_control_register
    ldp x29, x30, [sp], #16
    ret

.global get_stack_pointer
get_stack_pointer:
    cmp x0, #0
    b.eq get_el0_sp
    cmp x0, #1
    b.eq get_el1_sp
    cmp x0, #2
    b.eq get_el2_sp
    
get_el3_sp:
    mrs x0, sp_el3
    ret
get_el2_sp:
    mrs x0, sp_el2
    ret
get_el1_sp:
    mrs x0, sp_el1
    ret
get_el0_sp:
    mrs x0, sp_el0
    ret

.global read_cpsr
read_cpsr:
    mrs x0, nzcv
    mrs x1, daif
    orr x0, x0, x1, lsl #32
    ret

.global read_fp
read_fp:
    mov x0, x29   
    ret

.global read_cpu_id
read_cpu_id:
    mrs x0, midr_el1   
    ret

.global read_cache_type
read_cache_type:
    mrs x0, ctr_el0     
    ret

.global read_tcm_type
read_tcm_type:
    mov x0, #0
    ret

.global read_tlb_type
read_tlb_type:
    mrs x0, id_aa64mmfr0_el1
    ret

.global read_control_register
read_control_register:
    mrs x0, sctlr_el1   
    ret

.global set_control_register
set_control_register:
    msr sctlr_el1, x0   
    isb               
    ret

.global set_domain_access_control
set_domain_access_control:
    ret

.global set_translation_table_base
set_translation_table_base:
    msr ttbr0_el1, x0   
    isb            
    ret

.global jump_to_high_mem
jump_to_high_mem:
    add x30, x30, #KERNEL_BASE
    ret

.globl switch_to_context
switch_to_context:
	mov x10, #THREAD_CPU_CONTEXT
	add x8, x0, x10	
	mov x9, sp
	/*
	 * All calle-saved registers are stored in the order
	 * they are defined in cpu_context structure.
	 */
	stp x19, x20, [x8], #16
	stp x21, x22, [x8], #16
	stp x23, x24, [x8], #16
	stp x25, x26, [x8], #16
	stp x27, x28, [x8], #16
	/* x29 is saved as fp (frame pointer) */
	/* current stack pointer is saved as sp */
	stp x29, x9,  [x8], #16
	/* x30 (link register that contains function return address), is stored as pc */
	str x30,      [x8]
	/*
	 * Calculate the pointer to the next cpu_context struct
	 * x8: Points to the cpu_context of the next task
	 */
	add x8, x1, x10		/* x8 = &(task_struct + 1) + THREAD_CPU_CONTEXT */
	/*
	 * All calle-saved registers are restored in the order
	 * they are defined in cpu_context structure.
	 * Callee saved registers are restored from the next cpu_context.
	 */
	ldp x19, x20, [x8], #16
	ldp x21, x22, [x8], #16
	ldp x23, x24, [x8], #16
	ldp x25, x26, [x8], #16
	ldp x27, x28, [x8], #16
	ldp x29, x9,  [x8], #16
	ldr x30,      [x8]
	mov sp, x9
	/*
	 * Function returns to the location pointed to by the link register (x30):
	 * - If we are switching to some task for the first time, this will be
	 * 	ret_from_work
	 * - Else, this will be the location, previously saved in the
	 * 	cpu_context by the cpu_switch_to function
	 */
	ret

