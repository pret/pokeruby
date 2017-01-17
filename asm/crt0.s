	.include "constants/gba_constants.inc"

	.syntax unified

	.global Start

	.text

	.arm

Start: @ 8000000
	b Init

	.include "asm/rom_header.inc"

@ 80000C0
	.word 0

	.global GPIOPortData
GPIOPortData: @ 80000C4
	.hword 0

	.global GPIOPortDirection
GPIOPortDirection: @ 80000C6
	.hword 0

	.global GPIOPortReadEnable
GPIOPortReadEnable: @ 80000C8
	.hword 0

	.space 6

Unk1:
	.fill 48, 1, 0xff
	.4byte 2
	.4byte 5
	.ascii "pokemon ruby version"
    .space 12
	.4byte gMonFrontPicTable
	.4byte gMonBackPicTable
	.4byte gMonPaletteTable
	.4byte gMonShinyPaletteTable
	.4byte gMonIconTable
	.4byte gMonIconPaletteIndices
	.4byte gMonIconPaletteTable
	.4byte gSpeciesNames
	.4byte gMoveNames
	.4byte gDecorations
    .byte 0x20,0x12,   0,   0,0x40,0x13,   0,   0
    .byte 0x18,   0,   0,   0,0x38,   9,   0,   0
    .byte 0x8C,0x3A,   0,   0,0x46,   0,   0,   0
    .byte 0x36,   8,   0,   0,0x4C,   8,   0,   0
    .byte 0x82,   1,   0,   0,   7, 0xA, 0xA, 0xA
    .byte  0xC, 0xC,   6, 0xC,   6,0x10,0x12, 0xC
    .byte  0xF, 0xB,   1,   8, 0xC,   0,   0,   0
    .byte 0x90,   8,   0,   0,0xC0,0x3A,   0,   0
    .byte 0x34,   2,   0,   0,0x38,   2,   0,   0
    .byte    9,   0,   0,   0, 0xA,   0,   0,   0
    .byte    0,   0,   0,   0,   8,   0,   0,   0
    .byte 0x56,   5,   0,   0,0x57,   5,   0,   0
    .byte 0x2F,0x31,   0,   0,0x1B,0x31,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte    0,   0,   0,   0,   0,   0,   0,   0
    .byte 0xFF,0xFF,0xFF,0xFF

	.arm
	.align 2, 0
	.global Init
Init: @ 80000D0
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

	.align 2, 0
sp_sys: .word IWRAM_END - 0x1a0
sp_irq: .word IWRAM_END - 0x60

	.arm
	.align 2, 0
	.global IntrMain
IntrMain: @ 800010C
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
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER3
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_HBLANK
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_VBLANK
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_VCOUNT
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER0
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER1
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_TIMER2
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA0
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA1
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA2
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_DMA3
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_KEYPAD
	bne IntrMain_FoundIntr
	add r12, r12, 0x4
	ands r0, r1, INTR_FLAG_GAMEPAK
	strbne r0, [r3, OFFSET_REG_SOUNDCNT_X - 0x200]
IntrMain_Loop:
	bne IntrMain_Loop
IntrMain_FoundIntr:
	strh r0, [r3, OFFSET_REG_IF - 0x200]
	mov r1, INTR_FLAG_SERIAL | INTR_FLAG_TIMER3 | INTR_FLAG_HBLANK
	bic r2, r2, r0
	and r1, r1, r2
	strh r1, [r3, OFFSET_REG_IE - 0x200]
	mrs r3, cpsr
	bic r3, r3, PSR_I_BIT | PSR_F_BIT | PSR_MODE_MASK
	orr r3, r3, PSR_SYS_MODE
	msr cpsr_cf, r3
	ldr r1, =gIntrTable
	add r1, r1, r12
	ldr r0, [r1]
	stmdb sp!, {lr}
	adr lr, IntrMain_RetAddr
	bx r0
IntrMain_RetAddr:
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

	.align 2, 0 @ Don't pad with nop.
