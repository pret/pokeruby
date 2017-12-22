	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B2C4C
sub_80B2C4C: @ 80B2C4C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r0, 0x2
	beq _080B2C6E
	cmp r0, 0x2
	ble _080B2C66
	cmp r0, 0x3
	beq _080B2CA0
	b _080B2CD4
_080B2C66:
	cmp r2, 0
	blt _080B2CD4
	adds r0, r2, 0
	b _080B2D16
_080B2C6E:
	cmp r1, 0
	beq _080B2C98
	movs r2, 0x4
	ldr r0, _080B2C9C @ =gSaveBlock1 + 0x2DFC
	adds r4, r0, 0
	adds r4, 0x60
	adds r3, r0, 0
	adds r3, 0x80
_080B2C7E:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r6}
	stm r1!, {r5,r6}
	subs r4, 0x20
	subs r3, 0x20
	subs r2, 0x1
	cmp r2, 0x2
	bgt _080B2C7E
_080B2C98:
	movs r0, 0x2
	b _080B2D16
	.align 2, 0
_080B2C9C: .4byte gSaveBlock1 + 0x2DFC
_080B2CA0:
	cmp r1, 0
	beq _080B2CCA
	movs r2, 0x7
	ldr r0, _080B2CD0 @ =gSaveBlock1 + 0x2DFC
	adds r4, r0, 0
	adds r4, 0xC0
	adds r3, r0, 0
	adds r3, 0xE0
_080B2CB0:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r7}
	stm r1!, {r5,r7}
	subs r4, 0x20
	subs r3, 0x20
	subs r2, 0x1
	cmp r2, 0x5
	bgt _080B2CB0
_080B2CCA:
	movs r0, 0x5
	b _080B2D16
	.align 2, 0
_080B2CD0: .4byte gSaveBlock1 + 0x2DFC
_080B2CD4:
	ldr r0, _080B2CE8 @ =gScriptContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080B2D14
	lsls r0, 2
	ldr r1, _080B2CEC @ =_080B2CF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2CE8: .4byte gScriptContestCategory
_080B2CEC: .4byte _080B2CF0
	.align 2, 0
_080B2CF0:
	.4byte _080B2D04
	.4byte _080B2D08
	.4byte _080B2D0C
	.4byte _080B2D10
	.4byte _080B2D14
_080B2D04:
	movs r0, 0x8
	b _080B2D16
_080B2D08:
	movs r0, 0x9
	b _080B2D16
_080B2D0C:
	movs r0, 0xA
	b _080B2D16
_080B2D10:
	movs r0, 0xB
	b _080B2D16
_080B2D14:
	movs r0, 0xC
_080B2D16:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B2C4C

	thumb_func_start sub_80B2D1C
sub_80B2D1C: @ 80B2D1C
	push {r4-r7,lr}
	ldr r0, _080B2D48 @ =gSaveBlock1
	ldr r4, _080B2D4C @ =gUnknown_083CC5D0
	ldr r1, _080B2D50 @ =0x00002dfc
	adds r3, r0, r1
	movs r2, 0x7
_080B2D28:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r6}
	stm r1!, {r5,r6}
	adds r4, 0x20
	adds r3, 0x20
	subs r2, 0x1
	cmp r2, 0
	bge _080B2D28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2D48: .4byte gSaveBlock1
_080B2D4C: .4byte gUnknown_083CC5D0
_080B2D50: .4byte 0x00002dfc
	thumb_func_end sub_80B2D1C

	.align 2, 0 @ Don't pad with nop.
