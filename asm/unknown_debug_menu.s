	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_814A414
unref_sub_814A414: @ 814A414
	push {lr}
	sub sp, 0x8
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r3, _0814A458 @ =gUnknown_0842C29C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x8
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x8
	bl InitMenu
	ldr r1, _0814A45C @ =gCallback_03004AE8
	ldr r0, _0814A460 @ =sub_814A464
	str r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_0814A458: .4byte gUnknown_0842C29C
_0814A45C: .4byte gCallback_03004AE8
_0814A460: .4byte sub_814A464
	thumb_func_end unref_sub_814A414

	thumb_func_start sub_814A464
sub_814A464: @ 814A464
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r0, r2, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _0814A480
	movs r0, 0
	b _0814A4B2
_0814A480:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0814A4AC
	ldr r0, _0814A4A0 @ =gUnknown_02024D1E
	strb r2, [r0]
	ldr r2, _0814A4A4 @ =gCallback_03004AE8
	ldr r0, _0814A4A8 @ =gUnknown_0842C29C
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	movs r0, 0
	b _0814A4B2
	.align 2, 0
_0814A4A0: .4byte gUnknown_02024D1E
_0814A4A4: .4byte gCallback_03004AE8
_0814A4A8: .4byte gUnknown_0842C29C
_0814A4AC:
	bl sub_8071C20
	movs r0, 0x1
_0814A4B2:
	pop {r1}
	bx r1
	thumb_func_end sub_814A464

	thumb_func_start sub_814A4B8
sub_814A4B8: @ 814A4B8
	push {r4,lr}
	ldr r2, _0814A4FC @ =gSaveBlock2
	ldr r1, _0814A500 @ =0x00000556
	adds r0, r2, r1
	movs r1, 0x3
	strb r1, [r0]
	ldr r3, _0814A504 @ =0x00000557
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _0814A508 @ =gUnknown_02024D1E
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r4, _0814A50C @ =0x0000055c
	adds r1, r2, r4
	strh r0, [r1]
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r3, _0814A510 @ =0x0000055e
	adds r1, r2, r3
	strh r0, [r1]
	subs r4, 0x4
	adds r0, r2, r4
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, _0814A514 @ =0x0000055a
	adds r2, r0
	strh r1, [r2]
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A4FC: .4byte gSaveBlock2
_0814A500: .4byte 0x00000556
_0814A504: .4byte 0x00000557
_0814A508: .4byte gUnknown_02024D1E
_0814A50C: .4byte 0x0000055c
_0814A510: .4byte 0x0000055e
_0814A514: .4byte 0x0000055a
	thumb_func_end sub_814A4B8

	.align 2, 0 @ Don't pad with nop.
