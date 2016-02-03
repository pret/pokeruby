RomBase: ; 8000000
	b Init

	.include "asm/rom_header.s"

; 80000C0
	.4byte 0

GPIOPortData: ; 80000C4
	.2byte 0

GPIOPortDirection: ; 80000C6
	.2byte 0

GPIOPortReadEnable: ; 80000C8
	.2byte 0

	.rept 6
	.byte 0
	.endr

	.arm
	.align 2
	.globl Init
Init: ; 80000D0
	mov r0, PSR_IRQ_MODE
	msr cpsr_cf, r0
	ldr sp, sp_irq
	mov r0, PSR_SYS_MODE
	msr cpsr_cf, r0
	ldr sp, sp_sys
	ldr r1, =INTR_VECTOR
	adr r0, IntrMain
	str r0, [r1]
	ldr r1, =AgbMain
	mov lr, pc
	bx r1
	b Init

	.align 2
sp_sys: .4byte IWRAM_END - 0x1a0
sp_irq: .4byte IWRAM_END - 0x60

	.arm
	.align 2
	.globl IntrMain
IntrMain: ; 800010C
	mov r3, REG_BASE
	add r3, r3, 0x200
	ldr r2, [r3, OFFSET_REG_IE - 0x200]
	ldrh r1, [r3, OFFSET_REG_IME - 0x200]
	mrs r0, spsr
	stmdb sp!, {r0-r3,lr}
	mov r0, 1
	strh r0, [r3, OFFSET_REG_IME - 0x200]
	and r1, r2, r2, lsr 16
	mov r12, 0
	ands r0, r1, INTR_FLAG_SERIAL
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER3
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_HBLANK
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_VBLANK
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_VCOUNT
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER0
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER1
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER2
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA0
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA1
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA2
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA3
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_KEYPAD
	bne $foundInterrupt
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_GAMEPAK
	strbne r0, [r3, OFFSET_REG_SOUNDCNT_X - 0x200]
$loop:
	bne $loop
$foundInterrupt:
	strh r0, [r3, OFFSET_REG_IF - 0x200]
	mov r1, INTR_FLAG_SERIAL | INTR_FLAG_TIMER3 | INTR_FLAG_HBLANK
	bic r2, r2, r0
	and r1, r1, r2
	strh r1, [r3, OFFSET_REG_IE - 0x200]
	mrs r3, cpsr
	bic r3, r3, PSR_I_BIT | PSR_F_BIT | PSR_MODE_MASK
	orr r3, r3, PSR_SYS_MODE
	msr cpsr_cf, r3
	ldr r1, =0x03001BC0
	add r1, r1, r12
	ldr r0, [r1]
	stmdb sp!, {lr}
	adr lr, $retAddr
	bx r0
$retAddr:
	ldmia sp!, {lr}
	mrs r3, cpsr
	bic r3, r3, PSR_I_BIT | PSR_F_BIT | PSR_MODE_MASK
	orr r3, r3, PSR_I_BIT | PSR_IRQ_MODE
	msr cpsr_cf, r3
	ldmia sp!, {r0-r3,lr}
	strh r2, [r3, OFFSET_REG_IE - 0x200]
	strh r1, [r3, OFFSET_REG_IME - 0x200]
	msr spsr_cf, r0
	bx lr

	.pool
