	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GiveSpecialRibbonToParty
GiveSpecialRibbonToParty: @ 80C5C38
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r7, 0
	add r4, sp, 0x8
	movs r0, 0x1
	strb r0, [r4]
	ldr r1, _080C5CC0 @ =gUnknown_083D188E
	mov r0, sp
	movs r2, 0x7
	bl memcpy
	mov r8, r4
	cmp r6, 0xA
	bhi _080C5CB2
	cmp r5, 0x40
	bhi _080C5CB2
	ldr r0, _080C5CC4 @ =gSaveBlock1
	ldr r1, _080C5CC8 @ =0x00003110
	adds r0, r1
	adds r0, r6, r0
	strb r5, [r0]
	movs r5, 0
_080C5C70:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080C5CCC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080C5CA2
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080C5CA2
	mov r1, sp
	adds r0, r1, r6
	ldrb r1, [r0]
	adds r0, r4, 0
	mov r2, r8
	bl SetMonData
	movs r7, 0x1
_080C5CA2:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080C5C70
	cmp r7, 0
	beq _080C5CB2
	ldr r0, _080C5CD0 @ =0x0000083b
	bl FlagSet
_080C5CB2:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5CC0: .4byte gUnknown_083D188E
_080C5CC4: .4byte gSaveBlock1
_080C5CC8: .4byte 0x00003110
_080C5CCC: .4byte gPlayerParty
_080C5CD0: .4byte 0x0000083b
	thumb_func_end GiveSpecialRibbonToParty

	.align 2, 0 @ Don't pad with nop.
