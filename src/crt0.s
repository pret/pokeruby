	.include "constants/gba_constants.inc"
	.include "constants/misc_constants.inc"
	.include "constants/version.inc"

	.syntax unified

	.global Start

	.text

	.arm

Start: @ 8000000
	b Init

	.global RomHeaderNintendoLogo
RomHeaderNintendoLogo:
	.byte 0x24,0xff,0xae,0x51,0x69,0x9a,0xa2,0x21
	.byte 0x3d,0x84,0x82,0x0a,0x84,0xe4,0x09,0xad
	.byte 0x11,0x24,0x8b,0x98,0xc0,0x81,0x7f,0x21
	.byte 0xa3,0x52,0xbe,0x19,0x93,0x09,0xce,0x20
	.byte 0x10,0x46,0x4a,0x4a,0xf8,0x27,0x31,0xec
	.byte 0x58,0xc7,0xe8,0x33,0x82,0xe3,0xce,0xbf
	.byte 0x85,0xf4,0xdf,0x94,0xce,0x4b,0x09,0xc1
	.byte 0x94,0x56,0x8a,0xc0,0x13,0x72,0xa7,0xfc
	.byte 0x9f,0x84,0x4d,0x73,0xa3,0xca,0x9a,0x61
	.byte 0x58,0x97,0xa3,0x27,0xfc,0x03,0x98,0x76
	.byte 0x23,0x1d,0xc7,0x61,0x03,0x04,0xae,0x56
	.byte 0xbf,0x38,0x84,0x00,0x40,0xa7,0x0e,0xfd
	.byte 0xff,0x52,0xfe,0x03,0x6f,0x95,0x30,0xf1
	.byte 0x97,0xfb,0xc0,0x85,0x60,0xd6,0x80,0x25
	.byte 0xa9,0x63,0xbe,0x03,0x01,0x4e,0x38,0xe2
	.byte 0xf9,0xa2,0x34,0xff,0xbb,0x3e,0x03,0x44
	.byte 0x78,0x00,0x90,0xcb,0x88,0x11,0x3a,0x94
	.byte 0x65,0xc0,0x7c,0x63,0x87,0xf0,0x3c,0xaf
	.byte 0xd6,0x25,0xe4,0x8b,0x38,0x0a,0xac,0x72
	.byte 0x21,0xd4,0xf8,0x07

	# These will be set by gbafix

RomHeaderGameTitle:
	.space 12

RomHeaderGameCode:
	.4byte 0

RomHeaderMakerCode:
	.2byte 0

RomHeaderMagic:
	.byte 0x96

RomHeaderMainUnitCode:
	.byte 0

RomHeaderDeviceType:
	.byte 0

RomHeaderReserved1:
	.space 7

RomHeaderSoftwareVersion:
	.byte 0

RomHeaderChecksum:
	.byte 0

RomHeaderReserved2:
	.space 2

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

@ 80000D0

@ TODO: figure out what this data is

	.ifdef GERMAN
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte GAME_VERSION
	.4byte GAME_LANGUAGE
	.ifdef SAPPHIRE
	.ascii "pokemon sapphire version"
	.space 8
	.else
	.ascii "pokemon ruby version"
	.space 12
	.endif
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
	.4byte     0x1220
	.4byte     0x1340
	.4byte       0x18
	.4byte      0x938
	.4byte     0x3A8C
	.4byte       0x46
	.4byte      0x836
	.4byte      0x84C
	.4byte      0x182
	.4byte  0xA0A0A07
	.4byte  0xC060C0C
	.4byte  0xC121006
	.4byte  0x8010B0F
	.4byte        0xC
	.4byte      0x890
	.4byte     0x3AC0
	.4byte      0x234
	.4byte      0x238
	.4byte          9
	.4byte        0xA
	.4byte          0
	.4byte          8
	.4byte      0x556
	.4byte      0x557
	.4byte     0x312F
	.4byte     0x311B
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte          0
	.4byte 0xFFFFFFFF
	.endif

	.arm
	.align 2, 0
	.global Init
Init:
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
IntrMain:
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
