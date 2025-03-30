.global save_context_1
save_context_1:
	push {r0-r12, r14}
	mov r14, r0
	push {r1-r12, r14}
	bl get_current_context
	pop {r1-r12, r14}
	cmpeq r0, #0
	beq save_context_return
	push {r1}
	mrs r1, SPSR
	str r1, [r0]
	pop {r1}
	add r0, #4
	str r14, [r0]
	add r0, #8
	stmia r0, {r1-r14}^
	b save_context_return

.global save_context_2
save_context_2:
	push {r0-r12, r14}
	mov r1, r0
	push {r1-r12, r14}
	bl get_current_context
	pop {r1-r12, r14}
	cmpeq r0, #0
	beq save_context_return
	add r0, #8
	str r1, [r0]

save_context_return:
	pop {r0-r12, r14}
	mov pc, lr
	