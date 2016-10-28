	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8093110
sub_8093110: @ 8093110
	push {lr}
	bl sub_80932AC
	ldr r0, _08093128 @ =sub_8093174
	bl SetMainCallback2
	ldr r0, _0809312C @ =0x02000000
	adds r0, 0x9C
	movs r1, 0x2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08093128: .4byte sub_8093174
_0809312C: .4byte 0x02000000
	thumb_func_end sub_8093110

	thumb_func_start sub_8093130
sub_8093130: @ 8093130
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80932E4
	ldr r0, _08093164 @ =sub_8093174
	bl SetMainCallback2
	ldr r2, _08093168 @ =0x02000000
	ldr r3, _0809316C @ =gLinkPlayers
	ldr r0, _08093170 @ =gLinkPlayerMapObjects
	lsls r4, 2
	adds r4, r0
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x1A]
	adds r2, 0x9C
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093164: .4byte sub_8093174
_08093168: .4byte 0x02000000
_0809316C: .4byte gLinkPlayers
_08093170: .4byte gLinkPlayerMapObjects
	thumb_func_end sub_8093130

	thumb_func_start sub_8093174
sub_8093174: @ 8093174
	push {lr}
	ldr r0, _0809318C @ =gMain
	ldr r1, _08093190 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bhi _08093232
	lsls r0, 2
	ldr r1, _08093194 @ =_08093198
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809318C: .4byte gMain
_08093190: .4byte 0x0000043c
_08093194: .4byte _08093198
	.align 2, 0
_08093198:
	.4byte _080931BC
	.4byte _080931C6
	.4byte _080931CC
	.4byte _080931D2
	.4byte _080931DC
	.4byte _080931EC
	.4byte _08093200
	.4byte _08093206
	.4byte _08093220
_080931BC:
	bl sub_8093534
	bl sub_8093688
	b _0809320A
_080931C6:
	bl sub_8093598
	b _0809320A
_080931CC:
	bl sub_80935EC
	b _0809320A
_080931D2:
	bl sub_8093610
	bl sub_80937A4
	b _0809320A
_080931DC:
	bl sub_80937BC
	ldr r1, _080931F8 @ =gMain
	ldr r0, _080931FC @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080931EC:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _08093232
	b _0809320A
	.align 2, 0
_080931F8: .4byte gMain
_080931FC: .4byte 0x0000043c
_08093200:
	bl sub_80937F0
	b _0809320A
_08093206:
	bl sub_80937D8
_0809320A:
	ldr r1, _08093218 @ =gMain
	ldr r0, _0809321C @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08093232
	.align 2, 0
_08093218: .4byte gMain
_0809321C: .4byte 0x0000043c
_08093220:
	bl nullsub_15
	bl sub_8093800
	bl sub_8093550
	ldr r0, _08093238 @ =sub_809323C
	bl SetMainCallback2
_08093232:
	pop {r0}
	bx r0
	.align 2, 0
_08093238: .4byte sub_809323C
	thumb_func_end sub_8093174

	thumb_func_start sub_809323C
sub_809323C: @ 809323C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_809323C

	thumb_func_start sub_8093254
sub_8093254: @ 8093254
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r2, _0809329C @ =0x02000000
	ldrb r0, [r2, 0x6]
	adds r0, 0x1
	strb r0, [r2, 0x6]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _0809327E
	movs r0, 0
	strb r0, [r2, 0x6]
	ldrb r0, [r2, 0x5]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2, 0x5]
_0809327E:
	ldrb r0, [r2, 0x4]
	cmp r0, 0
	beq _08093298
	ldr r1, _080932A0 @ =0x040000d4
	ldr r0, _080932A4 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080932A8 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_08093298:
	pop {r0}
	bx r0
	.align 2, 0
_0809329C: .4byte 0x02000000
_080932A0: .4byte 0x040000d4
_080932A4: .4byte gUnknown_03004DE0
_080932A8: .4byte 0x800000a0
	thumb_func_end sub_8093254

	thumb_func_start sub_80932AC
sub_80932AC: @ 80932AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080932DC @ =nullsub_60
	movs r1, 0xFF
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080932E0 @ =gTasks
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	adds r0, 0xC
	adds r1, r4, 0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080932DC: .4byte nullsub_60
_080932E0: .4byte gTasks
	thumb_func_end sub_80932AC

	thumb_func_start sub_80932E4
sub_80932E4: @ 80932E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0809331C @ =nullsub_60
	movs r1, 0xFF
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08093320 @ =gTasks
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	strh r4, [r0, 0xA]
	adds r0, 0xC
	adds r1, r5, 0
	bl StoreWordInTwoHalfwords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809331C: .4byte nullsub_60
_08093320: .4byte gTasks
	thumb_func_end sub_80932E4

	thumb_func_start sub_8093324
sub_8093324: @ 8093324
	push {r4,r5,lr}
	ldr r0, _0809336C @ =nullsub_60
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08093370 @ =gTasks
	adds r4, r1, r0
	ldr r5, _08093374 @ =0x02000000
	ldrh r0, [r4, 0x8]
	strb r0, [r5, 0x1]
	adds r0, r4, 0
	adds r0, 0xC
	adds r1, r5, 0
	adds r1, 0x60
	bl LoadWordFromTwoHalfwords
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	beq _0809337C
	ldr r2, _08093378 @ =gUnknown_0202FFC0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	adds r1, r2
	adds r0, r5, 0
	adds r0, 0x64
	movs r2, 0x38
	bl memcpy
	b _08093384
	.align 2, 0
_0809336C: .4byte nullsub_60
_08093370: .4byte gTasks
_08093374: .4byte 0x02000000
_08093378: .4byte gUnknown_0202FFC0
_0809337C:
	adds r0, r5, 0
	adds r0, 0x64
	bl sub_8093390
_08093384:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8093324

	thumb_func_start nullsub_60
nullsub_60: @ 809338C
	bx lr
	thumb_func_end nullsub_60

	thumb_func_start sub_8093390
sub_8093390: @ 8093390
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _080934A4 @ =gSaveBlock2
	ldrb r0, [r6, 0x8]
	strb r0, [r5]
	ldrh r0, [r6, 0xE]
	strh r0, [r5, 0x10]
	ldrb r0, [r6, 0x10]
	strh r0, [r5, 0x12]
	movs r0, 0x1
	bl sub_8053108
	adds r4, r0, 0
	movs r0, 0xA
	bl sub_8053108
	cmp r0, 0
	bne _080933B6
	movs r4, 0
_080933B6:
	lsrs r0, r4, 16
	strh r0, [r5, 0x6]
	lsrs r0, r4, 8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x8]
	ands r4, r1
	strh r4, [r5, 0xA]
	ldr r0, _080934A8 @ =0x00000801
	bl FlagGet
	strb r0, [r5, 0x2]
	bl sub_8090FC0
	strb r0, [r5, 0x3]
	bl GetPokedexSeenCount
	strh r0, [r5, 0xC]
	ldrb r1, [r6, 0xB]
	lsls r1, 8
	ldrb r0, [r6, 0xA]
	orrs r0, r1
	strh r0, [r5, 0xE]
	ldr r7, _080934AC @ =0x0000270f
	movs r0, 0x17
	adds r1, r7, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x14]
	movs r0, 0x18
	adds r1, r7, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x16]
	ldr r1, _080934B0 @ =0x000003e7
	movs r0, 0x23
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x1C]
	ldr r4, _080934B4 @ =0x0000ffff
	movs r0, 0x22
	adds r1, r4, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x1E]
	movs r0, 0x15
	adds r1, r4, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x20]
	movs r1, 0xAE
	lsls r1, 3
	adds r0, r6, r1
	ldrh r0, [r0]
	strh r0, [r5, 0x18]
	ldr r2, _080934B8 @ =0x00000572
	adds r1, r6, r2
	ldrh r1, [r1]
	strh r1, [r5, 0x1A]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	bls _08093436
	strh r7, [r5, 0x18]
_08093436:
	ldrh r0, [r5, 0x1A]
	cmp r0, r7
	bls _0809343E
	strh r7, [r5, 0x1A]
_0809343E:
	movs r4, 0
	bl sub_80C4D50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _0809344E
	movs r4, 0x1
_0809344E:
	strb r4, [r5, 0x4]
	ldr r0, _080934BC @ =gSaveBlock1
	movs r2, 0x92
	lsls r2, 3
	adds r1, r0, r2
	ldr r1, [r1]
	str r1, [r5, 0x24]
	movs r2, 0
	adds r6, r5, 0
	adds r6, 0x30
	adds r3, r5, 0
	adds r3, 0x28
	ldr r1, _080934C0 @ =0x00002b1c
	adds r4, r0, r1
_0809346A:
	lsls r0, r2, 1
	adds r1, r3, r0
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0809346A
	movs r2, 0
	adds r3, r6, 0
	ldr r4, _080934A4 @ =gSaveBlock2
_08093484:
	adds r1, r3, r2
	adds r0, r2, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _08093484
	adds r0, r5, 0
	bl sub_80934F4
	strb r0, [r5, 0x1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080934A4: .4byte gSaveBlock2
_080934A8: .4byte 0x00000801
_080934AC: .4byte 0x0000270f
_080934B0: .4byte 0x000003e7
_080934B4: .4byte 0x0000ffff
_080934B8: .4byte 0x00000572
_080934BC: .4byte gSaveBlock1
_080934C0: .4byte 0x00002b1c
	thumb_func_end sub_8093390

	thumb_func_start sub_80934C4
sub_80934C4: @ 80934C4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080934D8 @ =gUnknown_0202FFC0
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_080934D8: .4byte gUnknown_0202FFC0
	thumb_func_end sub_80934C4

	thumb_func_start sav12_xor_get_clamped_above
sav12_xor_get_clamped_above: @ 80934DC
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl sub_8053108
	cmp r0, r4
	bls _080934EE
	adds r0, r4, 0
_080934EE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sav12_xor_get_clamped_above

	thumb_func_start sub_80934F4
sub_80934F4: @ 80934F4
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldrh r0, [r1, 0x6]
	cmp r0, 0
	bne _08093506
	ldr r0, [r1, 0x8]
	cmp r0, 0
	beq _08093508
_08093506:
	movs r2, 0x1
_08093508:
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _08093514
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08093514:
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x31
	bls _08093520
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08093520:
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0809352C
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0809352C:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80934F4

	thumb_func_start sub_8093534
sub_8093534: @ 8093534
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	thumb_func_end sub_8093534

	thumb_func_start sub_8093550
sub_8093550: @ 8093550
	push {r4,lr}
	ldr r0, _08093588 @ =sub_8093254
	bl SetVBlankCallback
	ldr r3, _0809358C @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08093590 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08093594 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x18
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093588: .4byte sub_8093254
_0809358C: .4byte 0x04000208
_08093590: .4byte 0x04000200
_08093594: .4byte REG_DISPSTAT
	thumb_func_end sub_8093550

	thumb_func_start sub_8093598
sub_8093598: @ 8093598
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0x80
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	ldr r1, _080935E4 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080935E8 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080935B6:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _080935B6
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080935E4: .4byte 0x040000d4
_080935E8: .4byte 0x81000800
	thumb_func_end sub_8093598

	thumb_func_start sub_80935EC
sub_80935EC: @ 80935EC
	sub sp, 0x4
	movs r2, 0xE0
	lsls r2, 19
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08093608 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0809360C @ =0x81000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_08093608: .4byte 0x040000d4
_0809360C: .4byte 0x81000200
	thumb_func_end sub_80935EC

	thumb_func_start sub_8093610
sub_8093610: @ 8093610
	push {r4,r5,lr}
	ldr r5, _08093664 @ =REG_BG0CNT
	movs r1, 0
	strh r1, [r5]
	ldr r2, _08093668 @ =REG_BG1CNT
	strh r1, [r2]
	ldr r3, _0809366C @ =REG_BG2CNT
	strh r1, [r3]
	ldr r4, _08093670 @ =REG_BG3CNT
	strh r1, [r4]
	ldr r0, _08093674 @ =REG_BG0HOFS
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08093678 @ =0x00001e08
	adds r0, r1, 0
	strh r0, [r5]
	ldr r1, _0809367C @ =0x00000801
	adds r0, r1, 0
	strh r0, [r2]
	ldr r1, _08093680 @ =0x00000902
	adds r0, r1, 0
	strh r0, [r3]
	ldr r1, _08093684 @ =0x00000a03
	adds r0, r1, 0
	strh r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093664: .4byte REG_BG0CNT
_08093668: .4byte REG_BG1CNT
_0809366C: .4byte REG_BG2CNT
_08093670: .4byte REG_BG3CNT
_08093674: .4byte REG_BG0HOFS
_08093678: .4byte 0x00001e08
_0809367C: .4byte 0x00000801
_08093680: .4byte 0x00000902
_08093684: .4byte 0x00000a03
	thumb_func_end sub_8093610

	thumb_func_start sub_8093688
sub_8093688: @ 8093688
	push {r4-r6,lr}
	bl sub_8093324
	ldr r2, _080936D0 @ =0x02000000
	movs r1, 0
	strb r1, [r2]
	strb r1, [r2, 0x3]
	strb r1, [r2, 0x4]
	adds r0, r2, 0
	adds r0, 0x65
	ldrb r0, [r0]
	strb r0, [r2, 0x2]
	strb r1, [r2, 0x5]
	strb r1, [r2, 0x6]
	movs r4, 0
	adds r6, r2, 0
	adds r6, 0x20
	adds r5, r2, 0
	adds r5, 0x8C
_080936AE:
	lsls r0, r4, 4
	adds r0, r6
	lsls r1, r4, 1
	adds r1, r5, r1
	ldrh r1, [r1]
	bl sub_80EB3FC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080936AE
	bl sub_80936D4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080936D0: .4byte 0x02000000
	thumb_func_end sub_8093688

	thumb_func_start sub_80936D4
sub_80936D4: @ 80936D4
	push {r4-r6,lr}
	ldr r4, _08093798 @ =0x02000000
	movs r0, 0
	strb r0, [r4, 0x7]
	strb r0, [r4, 0x8]
	strb r0, [r4, 0x9]
	strb r0, [r4, 0xA]
	strb r0, [r4, 0xB]
	strb r0, [r4, 0xC]
	strb r0, [r4, 0xD]
	adds r0, r4, 0
	adds r0, 0xE
	movs r1, 0
	movs r2, 0x8
	bl memset
	adds r0, r4, 0
	adds r0, 0x66
	ldrb r0, [r0]
	cmp r0, 0
	beq _08093704
	ldrb r0, [r4, 0x7]
	adds r0, 0x1
	strb r0, [r4, 0x7]
_08093704:
	adds r0, r4, 0
	adds r0, 0x6A
	ldrh r0, [r0]
	cmp r0, 0
	bne _08093714
	ldr r0, [r4, 0x6C]
	cmp r0, 0
	beq _0809371A
_08093714:
	ldrb r0, [r4, 0x8]
	adds r0, 0x1
	strb r0, [r4, 0x8]
_0809371A:
	ldr r1, _08093798 @ =0x02000000
	ldr r0, [r1, 0x78]
	cmp r0, 0
	beq _08093728
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
_08093728:
	ldr r0, [r1, 0x7C]
	cmp r0, 0
	beq _08093734
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
_08093734:
	adds r0, r1, 0
	adds r0, 0x80
	ldrh r0, [r0]
	cmp r0, 0
	beq _08093744
	ldrb r0, [r1, 0xB]
	adds r0, 0x1
	strb r0, [r1, 0xB]
_08093744:
	adds r0, r1, 0
	adds r0, 0x82
	ldrh r0, [r0]
	cmp r0, 0
	beq _08093754
	ldrb r0, [r1, 0xC]
	adds r0, 0x1
	strb r0, [r1, 0xC]
_08093754:
	adds r0, r1, 0
	adds r0, 0x84
	ldrh r0, [r0]
	cmp r0, 0
	beq _08093764
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
	strb r0, [r1, 0xD]
_08093764:
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08093792
	movs r5, 0
	ldr r4, _0809379C @ =0x00000807
	adds r6, r1, 0
	adds r6, 0xE
_08093772:
	lsls r0, r4, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08093788
	adds r1, r5, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08093788:
	adds r4, 0x1
	adds r5, 0x1
	ldr r0, _080937A0 @ =0x0000080e
	cmp r4, r0
	bls _08093772
_08093792:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093798: .4byte 0x02000000
_0809379C: .4byte 0x00000807
_080937A0: .4byte 0x0000080e
	thumb_func_end sub_80936D4

	thumb_func_start sub_80937A4
sub_80937A4: @ 80937A4
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	pop {r0}
	bx r0
	thumb_func_end sub_80937A4

	thumb_func_start sub_80937BC
sub_80937BC: @ 80937BC
	push {r4,lr}
	ldr r4, _080937D4 @ =gWindowConfig_81E6DC4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl MultistepInitMenuWindowBegin
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080937D4: .4byte gWindowConfig_81E6DC4
	thumb_func_end sub_80937BC

	thumb_func_start sub_80937D8
sub_80937D8: @ 80937D8
	push {lr}
	bl sub_8093E04
	bl sub_8093E28
	bl sub_8093F64
	bl sub_8093DAC
	pop {r0}
	bx r0
	thumb_func_end sub_80937D8

	thumb_func_start sub_80937F0
sub_80937F0: @ 80937F0
	push {lr}
	bl sub_8093EF8
	pop {r0}
	bx r0
	thumb_func_end sub_80937F0

	thumb_func_start nullsub_15
nullsub_15: @ 80937FC
	bx lr
	thumb_func_end nullsub_15

	thumb_func_start sub_8093800
sub_8093800: @ 8093800
	push {lr}
	bl sub_809380C
	pop {r0}
	bx r0
	thumb_func_end sub_8093800

	thumb_func_start sub_809380C
sub_809380C: @ 809380C
	push {r4,lr}
	ldr r4, _08093828 @ =sub_809382C
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093828: .4byte sub_809382C
	thumb_func_end sub_809380C

	thumb_func_start sub_809382C
sub_809382C: @ 809382C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _08093858 @ =gUnknown_083B5EBC
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r6, _0809385C @ =0x02000000
	ldr r5, _08093860 @ =gTasks
_0809383E:
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r4, r5
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0809383E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093858: .4byte gUnknown_083B5EBC
_0809385C: .4byte 0x02000000
_08093860: .4byte gTasks
	thumb_func_end sub_809382C

	thumb_func_start sub_8093864
sub_8093864: @ 8093864
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, _080938A0 @ =0x02000000
	ldr r2, _080938A4 @ =gSaveBlock2
	ldrb r1, [r2, 0x11]
	movs r0, 0x1
	ands r0, r1
	movs r5, 0
	strb r0, [r4, 0x5]
	ldrb r0, [r2, 0x12]
	strb r0, [r4, 0x6]
	bl sub_80939A4
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080938A0: .4byte 0x02000000
_080938A4: .4byte gSaveBlock2
	thumb_func_end sub_8093864

	thumb_func_start sub_80938A8
sub_80938A8: @ 80938A8
	push {lr}
	ldr r0, _080938C4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080938BE
	ldr r1, _080938C8 @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080938BE:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080938C4: .4byte gPaletteFade
_080938C8: .4byte 0x02000000
	thumb_func_end sub_80938A8

	thumb_func_start sub_80938CC
sub_80938CC: @ 80938CC
	push {lr}
	ldr r0, _080938E4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080938EC
	ldr r1, _080938E8 @ =0x02000000
	movs r0, 0x5
	strb r0, [r1]
	movs r0, 0x1
	b _08093914
	.align 2, 0
_080938E4: .4byte gMain
_080938E8: .4byte 0x02000000
_080938EC:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08093912
	ldr r2, _08093900 @ =0x02000000
	ldrb r1, [r2, 0x3]
	cmp r1, 0
	beq _08093904
	movs r0, 0x5
	b _0809390C
	.align 2, 0
_08093900: .4byte 0x02000000
_08093904:
	movs r0, 0x1
	eors r0, r1
	strb r0, [r2, 0x3]
	movs r0, 0x3
_0809390C:
	strb r0, [r2]
	movs r0, 0x1
	b _08093914
_08093912:
	movs r0, 0
_08093914:
	pop {r1}
	bx r1
	thumb_func_end sub_80938CC

	thumb_func_start sub_8093918
sub_8093918: @ 8093918
	push {lr}
	bl sub_8093A28
	movs r0, 0x36
	bl PlaySE
	ldr r1, _08093934 @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093934: .4byte 0x02000000
	thumb_func_end sub_8093918

	thumb_func_start sub_8093938
sub_8093938: @ 8093938
	push {lr}
	bl sub_8093A48
	lsls r0, 24
	cmp r0, 0
	beq _0809394A
	ldr r1, _08093950 @ =0x02000000
	movs r0, 0x2
	strb r0, [r1]
_0809394A:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093950: .4byte 0x02000000
	thumb_func_end sub_8093938

	thumb_func_start sub_8093954
sub_8093954: @ 8093954
	push {lr}
	sub sp, 0x4
	bl sub_80939C0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0809397C @ =0x02000000
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_0809397C: .4byte 0x02000000
	thumb_func_end sub_8093954

	thumb_func_start sub_8093980
sub_8093980: @ 8093980
	push {lr}
	ldr r0, _0809399C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08093996
	ldr r0, _080939A0 @ =0x02000000
	ldr r0, [r0, 0x60]
	bl SetMainCallback2
_08093996:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0809399C: .4byte gPaletteFade
_080939A0: .4byte 0x02000000
	thumb_func_end sub_8093980

	thumb_func_start sub_80939A4
sub_80939A4: @ 80939A4
	push {lr}
	ldr r0, _080939B8 @ =sub_80939DC
	movs r1, 0
	bl CreateTask
	ldr r0, _080939BC @ =gWindowConfig_81E6DC4
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_080939B8: .4byte sub_80939DC
_080939BC: .4byte gWindowConfig_81E6DC4
	thumb_func_end sub_80939A4

	thumb_func_start sub_80939C0
sub_80939C0: @ 80939C0
	push {lr}
	ldr r0, _080939D8 @ =sub_80939DC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080939D4
	bl DestroyTask
_080939D4:
	pop {r0}
	bx r0
	.align 2, 0
_080939D8: .4byte sub_80939DC
	thumb_func_end sub_80939C0

	thumb_func_start sub_80939DC
sub_80939DC: @ 80939DC
	push {lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08093A20 @ =gTasks
	adds r2, r1, r0
	ldr r0, _08093A24 @ =0x02000000
	ldrb r1, [r0, 0x5]
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r1, r0
	beq _08093A04
	strh r1, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r2, 0x8]
_08093A04:
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	mov r0, sp
	bl sub_8094250
	mov r0, sp
	movs r1, 0xA
	movs r2, 0xC
	bl MenuPrint
	add sp, 0x20
	pop {r0}
	bx r0
	.align 2, 0
_08093A20: .4byte gTasks
_08093A24: .4byte 0x02000000
	thumb_func_end sub_80939DC

	thumb_func_start sub_8093A28
sub_8093A28: @ 8093A28
	push {r4,lr}
	ldr r4, _08093A44 @ =sub_8093A68
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093A44: .4byte sub_8093A68
	thumb_func_end sub_8093A28

	thumb_func_start sub_8093A48
sub_8093A48: @ 8093A48
	push {lr}
	ldr r0, _08093A5C @ =sub_8093A68
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08093A60
	movs r0, 0
	b _08093A62
	.align 2, 0
_08093A5C: .4byte sub_8093A68
_08093A60:
	movs r0, 0x1
_08093A62:
	pop {r1}
	bx r1
	thumb_func_end sub_8093A48

	thumb_func_start sub_8093A68
sub_8093A68: @ 8093A68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08093A98 @ =gUnknown_083B5ED8
	ldr r2, _08093A9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08093A7A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08093A7A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093A98: .4byte gUnknown_083B5ED8
_08093A9C: .4byte gTasks
	thumb_func_end sub_8093A68

	thumb_func_start sub_8093AA0
sub_8093AA0: @ 8093AA0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08093AE0 @ =0x02000000
	movs r1, 0
	strb r1, [r0, 0x4]
	bl dp12_8087EA4
	movs r1, 0
	ldr r0, _08093AE4 @ =gUnknown_03004DE0
	ldr r2, _08093AE8 @ =0x0000fffc
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
_08093ABA:
	strh r2, [r0]
	adds r0, 0x2
	adds r1, 0x1
	cmp r1, 0x9F
	bls _08093ABA
	ldr r0, _08093AEC @ =sub_8093D7C
	bl SetHBlankCallback
	ldr r1, _08093AE0 @ =0x02000000
	movs r0, 0x1
	strb r0, [r1, 0x4]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093AE0: .4byte 0x02000000
_08093AE4: .4byte gUnknown_03004DE0
_08093AE8: .4byte 0x0000fffc
_08093AEC: .4byte sub_8093D7C
	thumb_func_end sub_8093AA0

	thumb_func_start sub_8093AF0
sub_8093AF0: @ 8093AF0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	ldr r1, _08093BFC @ =0x02000000
	movs r0, 0
	strb r0, [r1, 0x4]
	mov r2, r8
	ldrh r0, [r2, 0xA]
	adds r0, 0x3
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	ble _08093B18
	movs r0, 0x4F
	strh r0, [r2, 0xA]
_08093B18:
	mov r4, r8
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r0, 0xA0
	subs r0, r7
	mov r9, r0
	subs r4, r0, r7
	negs r0, r7
	lsls r6, r0, 16
	movs r0, 0xA0
	lsls r0, 16
	adds r1, r4, 0
	bl __udivsi3
	adds r5, r0, 0
	ldr r1, _08093C00 @ =0xffff0000
	adds r5, r1
	adds r0, r5, 0
	muls r0, r4
	adds r0, r6
	mov r10, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl __udivsi3
	str r0, [sp]
	lsls r5, 1
	movs r3, 0
	cmp r3, r7
	bcs _08093B74
	ldr r2, _08093C04 @ =gUnknown_03004DE0
	mov r12, r2
	ldr r0, _08093C08 @ =0x0000fffc
	adds r4, r0, 0
_08093B5C:
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, r0, 1
	add r1, r12
	subs r2, r4, r0
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, r7
	bcc _08093B5C
_08093B74:
	lsls r2, r3, 16
	mov r1, r9
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r4, r10
	lsrs r7, r4, 16
	cmp r2, r0
	bge _08093BAE
	ldr r0, _08093C04 @ =gUnknown_03004DE0
	mov r9, r0
	ldr r4, _08093C08 @ =0x0000fffc
	mov r12, r4
	adds r4, r1, 0
_08093B8E:
	lsrs r1, r6, 16
	adds r6, r5
	ldr r0, [sp]
	subs r5, r0
	asrs r2, 16
	lsls r0, r2, 1
	add r0, r9
	add r1, r12
	strh r1, [r0]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, r4
	blt _08093B8E
_08093BAE:
	adds r1, r7, 0
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x9F
	bgt _08093BD4
	ldr r4, _08093C04 @ =gUnknown_03004DE0
	ldr r0, _08093C08 @ =0x0000fffc
	adds r2, r1, r0
_08093BBE:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r4
	strh r2, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	cmp r1, 0x9F
	ble _08093BBE
_08093BD4:
	movs r0, 0x1
	ldr r1, _08093BFC @ =0x02000000
	strb r0, [r1, 0x4]
	mov r2, r8
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	cmp r0, 0x4A
	ble _08093BEA
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08093BEA:
	movs r0, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08093BFC: .4byte 0x02000000
_08093C00: .4byte 0xffff0000
_08093C04: .4byte gUnknown_03004DE0
_08093C08: .4byte 0x0000fffc
	thumb_func_end sub_8093AF0

	thumb_func_start sub_8093C0C
sub_8093C0C: @ 8093C0C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80939C0
	bl sub_8093DAC
	ldr r0, _08093C34 @ =0x02000000
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	bne _08093C24
	bl sub_80939A4
_08093C24:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093C34: .4byte 0x02000000
	thumb_func_end sub_8093C0C

	thumb_func_start sub_8093C38
sub_8093C38: @ 8093C38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	ldr r1, _08093D40 @ =0x02000000
	movs r2, 0
	strb r2, [r1, 0x4]
	ldrh r0, [r0, 0xA]
	subs r0, 0x3
	mov r3, r8
	strh r0, [r3, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _08093C5C
	strh r2, [r3, 0xA]
_08093C5C:
	mov r4, r8
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r0, 0xA0
	subs r0, r7
	mov r9, r0
	subs r4, r0, r7
	negs r0, r7
	lsls r6, r0, 16
	movs r0, 0xA0
	lsls r0, 16
	adds r1, r4, 0
	bl __udivsi3
	adds r5, r0, 0
	ldr r1, _08093D44 @ =0xffff0000
	adds r5, r1
	adds r0, r5, 0
	muls r0, r4
	adds r0, r6
	mov r10, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl __udivsi3
	str r0, [sp]
	lsrs r5, 1
	movs r3, 0
	cmp r3, r7
	bcs _08093CB8
	ldr r2, _08093D48 @ =gUnknown_03004DE0
	mov r12, r2
	ldr r0, _08093D4C @ =0x0000fffc
	adds r4, r0, 0
_08093CA0:
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, r0, 1
	add r1, r12
	subs r2, r4, r0
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, r7
	bcc _08093CA0
_08093CB8:
	lsls r2, r3, 16
	mov r1, r9
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r4, r10
	lsrs r7, r4, 16
	cmp r2, r0
	bge _08093CF2
	ldr r0, _08093D48 @ =gUnknown_03004DE0
	mov r9, r0
	ldr r3, _08093D4C @ =0x0000fffc
	mov r12, r3
	adds r4, r1, 0
_08093CD2:
	lsrs r1, r6, 16
	adds r6, r5
	ldr r0, [sp]
	adds r5, r0
	asrs r2, 16
	lsls r0, r2, 1
	add r0, r9
	add r1, r12
	strh r1, [r0]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, r4
	blt _08093CD2
_08093CF2:
	adds r1, r7, 0
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x9F
	bgt _08093D18
	ldr r4, _08093D48 @ =gUnknown_03004DE0
	ldr r0, _08093D4C @ =0x0000fffc
	adds r2, r1, r0
_08093D02:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r4
	strh r2, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	cmp r1, 0x9F
	ble _08093D02
_08093D18:
	movs r0, 0x1
	ldr r1, _08093D40 @ =0x02000000
	strb r0, [r1, 0x4]
	mov r2, r8
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bgt _08093D2E
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08093D2E:
	movs r0, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08093D40: .4byte 0x02000000
_08093D44: .4byte 0xffff0000
_08093D48: .4byte gUnknown_03004DE0
_08093D4C: .4byte 0x0000fffc
	thumb_func_end sub_8093C38

	thumb_func_start sub_8093D50
sub_8093D50: @ 8093D50
	push {lr}
	ldr r1, _08093D74 @ =0x02000000
	movs r0, 0
	strb r0, [r1, 0x4]
	bl SetHBlankCallback
	bl sub_8093E04
	ldr r0, _08093D78 @ =sub_8093A68
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093D74: .4byte 0x02000000
_08093D78: .4byte sub_8093A68
	thumb_func_end sub_8093D50

	thumb_func_start sub_8093D7C
sub_8093D7C: @ 8093D7C
	ldr r1, _08093DA0 @ =gUnknown_03004DE0
	ldr r0, _08093DA4 @ =REG_VCOUNT
	ldrh r2, [r0]
	movs r0, 0xFF
	ands r0, r2
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08093DA8 @ =REG_BG0VOFS
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_08093DA0: .4byte gUnknown_03004DE0
_08093DA4: .4byte REG_VCOUNT
_08093DA8: .4byte REG_BG0VOFS
	thumb_func_end sub_8093D7C

	thumb_func_start sub_8093DAC
sub_8093DAC: @ 8093DAC
	push {lr}
	ldr r0, _08093DBC @ =0x02000000
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	beq _08093DC0
	bl sub_8093DEC
	b _08093DC4
	.align 2, 0
_08093DBC: .4byte 0x02000000
_08093DC0:
	bl sub_8093DC8
_08093DC4:
	pop {r0}
	bx r0
	thumb_func_end sub_8093DAC

	thumb_func_start sub_8093DC8
sub_8093DC8: @ 8093DC8
	push {lr}
	bl MenuZeroFillScreen
	bl sub_80940E4
	bl sub_8093F14
	bl sub_8093F80
	bl sub_8093FD0
	bl sub_8094038
	bl sub_8094140
	pop {r0}
	bx r0
	thumb_func_end sub_8093DC8

	thumb_func_start sub_8093DEC
sub_8093DEC: @ 8093DEC
	push {lr}
	bl MenuZeroFillScreen
	bl sub_80940E4
	bl sub_8093F48
	bl sub_8094188
	pop {r0}
	bx r0
	thumb_func_end sub_8093DEC

	thumb_func_start sub_8093E04
sub_8093E04: @ 8093E04
	ldr r0, _08093E20 @ =REG_BG0VOFS
	ldr r2, _08093E24 @ =0x0000fffc
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	movs r2, 0
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08093E20: .4byte REG_BG0VOFS
_08093E24: .4byte 0x0000fffc
	thumb_func_end sub_8093E04

	thumb_func_start sub_8093E28
sub_8093E28: @ 8093E28
	push {r4-r7,lr}
	bl sub_8093EA0
	ldr r0, _08093E84 @ =gUnknown_083B5F6C
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r3, _08093E88 @ =gMenuTrainerCard_Gfx
	movs r4, 0xC0
	lsls r4, 19
	movs r5, 0xA4
	lsls r5, 5
	ldr r1, _08093E8C @ =0x040000d4
	ldr r6, _08093E90 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08093E4E:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08093E4E
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08093E94 @ =gBadgesTiles
	ldr r2, _08093E98 @ =0x06001480
	ldr r0, _08093E8C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08093E9C @ =0x80000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093E84: .4byte gUnknown_083B5F6C
_08093E88: .4byte gMenuTrainerCard_Gfx
_08093E8C: .4byte 0x040000d4
_08093E90: .4byte 0x80000800
_08093E94: .4byte gBadgesTiles
_08093E98: .4byte 0x06001480
_08093E9C: .4byte 0x80000200
	thumb_func_end sub_8093E28

	thumb_func_start sub_8093EA0
sub_8093EA0: @ 8093EA0
	push {r4,lr}
	ldr r1, _08093EE4 @ =gUnknown_083B5EF8
	ldr r4, _08093EE8 @ =0x02000000
	ldrb r0, [r4, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08093EEC @ =gBadgesPalette
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08093EF0 @ =gUnknown_083B5F4C
	movs r1, 0x40
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x64
	ldrb r0, [r4]
	cmp r0, 0
	beq _08093EDC
	ldr r0, _08093EF4 @ =gUnknown_083B5F0C
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
_08093EDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093EE4: .4byte gUnknown_083B5EF8
_08093EE8: .4byte 0x02000000
_08093EEC: .4byte gBadgesPalette
_08093EF0: .4byte gUnknown_083B5F4C
_08093EF4: .4byte gUnknown_083B5F0C
	thumb_func_end sub_8093EA0

	thumb_func_start sub_8093EF8
sub_8093EF8: @ 8093EF8
	push {lr}
	ldr r0, _08093F0C @ =0x02000000
	adds r0, 0x64
	ldrb r0, [r0]
	ldr r2, _08093F10 @ =0x06001880
	movs r1, 0x50
	bl LoadTrainerGfx_TrainerCard
	pop {r0}
	bx r0
	.align 2, 0
_08093F0C: .4byte 0x02000000
_08093F10: .4byte 0x06001880
	thumb_func_end sub_8093EF8

	thumb_func_start sub_8093F14
sub_8093F14: @ 8093F14
	push {lr}
	sub sp, 0x8
	ldr r0, _08093F3C @ =gUnknown_083B5EEC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _08093F40 @ =0x02000000
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, _08093F44 @ =0x06004800
	movs r2, 0xA0
	lsls r2, 1
	bl CpuFastSet
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08093F3C: .4byte gUnknown_083B5EEC
_08093F40: .4byte 0x02000000
_08093F44: .4byte 0x06004800
	thumb_func_end sub_8093F14

	thumb_func_start sub_8093F48
sub_8093F48: @ 8093F48
	push {lr}
	ldr r0, _08093F5C @ =gUnknown_08E8CFC0
	ldr r1, _08093F60 @ =0x06004800
	movs r2, 0xA0
	lsls r2, 1
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_08093F5C: .4byte gUnknown_08E8CFC0
_08093F60: .4byte 0x06004800
	thumb_func_end sub_8093F48

	thumb_func_start sub_8093F64
sub_8093F64: @ 8093F64
	push {lr}
	ldr r0, _08093F78 @ =gUnknown_08E8D9C0
	ldr r1, _08093F7C @ =0x06005000
	movs r2, 0xA0
	lsls r2, 1
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_08093F78: .4byte gUnknown_08E8D9C0
_08093F7C: .4byte 0x06005000
	thumb_func_end sub_8093F64

	thumb_func_start sub_8093F80
sub_8093F80: @ 8093F80
	push {r4-r7,lr}
	movs r5, 0xC4
	ldr r7, _08093FCC @ =0x06004000
	movs r1, 0x5
	movs r0, 0xA0
	lsls r0, 7
	adds r6, r0, 0
_08093F8E:
	movs r0, 0x13
	lsls r3, r1, 16
	asrs r4, r3, 11
_08093F94:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	adds r1, r7
	adds r0, r5, 0
	orrs r0, r6
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1A
	ble _08093F94
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _08093F8E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093FCC: .4byte 0x06004000
	thumb_func_end sub_8093F80

	thumb_func_start sub_8093FD0
sub_8093FD0: @ 8093FD0
	push {r4-r6,lr}
	ldr r4, _0809402C @ =0x06004000
	movs r2, 0xF
	ldr r0, _08094030 @ =0x02000000
	ldrb r0, [r0, 0x2]
	adds r0, 0xF
	cmp r2, r0
	bge _08094002
	movs r6, 0xC0
	lsls r6, 1
	ldr r1, _08094034 @ =0x0000408f
	adds r5, r1, 0
	adds r3, r0, 0
_08093FEA:
	lsls r1, r2, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r4
	adds r0, r6
	strh r5, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r2, r1, 16
	asrs r1, 16
	cmp r1, r3
	blt _08093FEA
_08094002:
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, 0x12
	bgt _08094024
	movs r3, 0xC0
	lsls r3, 1
	movs r2, 0
_08094010:
	asrs r0, r1, 16
	lsls r1, r0, 1
	adds r1, r4
	adds r1, r3
	strh r2, [r1]
	adds r0, 0x1
	lsls r1, r0, 16
	asrs r0, r1, 16
	cmp r0, 0x12
	ble _08094010
_08094024:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809402C: .4byte 0x06004000
_08094030: .4byte 0x02000000
_08094034: .4byte 0x0000408f
	thumb_func_end sub_8093FD0

	thumb_func_start sub_8094038
sub_8094038: @ 8094038
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r1, _080940D0 @ =0x02000000
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080940C2
	ldr r0, _080940D4 @ =0x06004000
	mov r9, r0
	movs r0, 0
	movs r2, 0x4
	adds r1, 0xE
	mov r8, r1
	ldr r7, _080940D8 @ =gUnknown_083B5F8C
	movs r1, 0xC0
	lsls r1, 6
	adds r6, r1, 0
	adds r1, r7, 0x6
	mov r12, r1
_08094060:
	lsls r0, 16
	asrs r4, r0, 16
	mov r1, r8
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r5, r2, 16
	cmp r0, 0
	beq _080940AE
	asrs r1, r5, 15
	add r1, r9
	movs r2, 0xF0
	lsls r2, 2
	adds r3, r1, r2
	lsls r2, r4, 3
	adds r0, r2, r7
	ldrh r0, [r0]
	orrs r0, r6
	strh r0, [r3]
	ldr r0, _080940DC @ =0x000003c2
	adds r3, r1, r0
	adds r0, r7, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	orrs r0, r6
	strh r0, [r3]
	movs r0, 0x80
	lsls r0, 3
	adds r3, r1, r0
	adds r0, r7, 0x4
	adds r0, r2, r0
	ldrh r0, [r0]
	orrs r0, r6
	strh r0, [r3]
	ldr r0, _080940E0 @ =0x00000402
	adds r1, r0
	add r2, r12
	ldrh r0, [r2]
	orrs r0, r6
	strh r0, [r1]
_080940AE:
	adds r1, r4, 0x1
	lsls r1, 16
	movs r2, 0xC0
	lsls r2, 10
	adds r0, r5, r2
	lsrs r2, r0, 16
	lsrs r0, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	ble _08094060
_080940C2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080940D0: .4byte 0x02000000
_080940D4: .4byte 0x06004000
_080940D8: .4byte gUnknown_083B5F8C
_080940DC: .4byte 0x000003c2
_080940E0: .4byte 0x00000402
	thumb_func_end sub_8094038

	thumb_func_start sub_80940E4
sub_80940E4: @ 80940E4
	push {r4,lr}
	movs r2, 0
	ldr r1, _08094108 @ =0x06004000
	movs r4, 0
	ldr r3, _0809410C @ =0x000003ff
_080940EE:
	strh r4, [r1]
	lsls r0, r2, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	adds r1, 0x2
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r3
	ble _080940EE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094108: .4byte 0x06004000
_0809410C: .4byte 0x000003ff
	thumb_func_end sub_80940E4

	thumb_func_start sub_8094110
sub_8094110: @ 8094110
	push {r4-r6,lr}
	ldr r6, _0809413C @ =0x06004800
	movs r2, 0x3
	movs r5, 0xA0
	lsls r5, 2
	movs r3, 0x1
	movs r4, 0xB0
	lsls r4, 2
_08094120:
	lsls r0, r2, 1
	adds r0, r6
	adds r1, r0, r5
	strh r3, [r1]
	adds r0, r4
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x10
	bls _08094120
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809413C: .4byte 0x06004800
	thumb_func_end sub_8094110

	thumb_func_start sub_8094140
sub_8094140: @ 8094140
	push {r4,r5,lr}
	ldr r0, _0809417C @ =gWindowConfig_81E6DC4
	bl BasicInitMenuWindow
	ldr r4, _08094180 @ =gStringVar1
	ldr r5, _08094184 @ =0x02000094
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringCopy
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl ConvertInternationalString
	adds r0, r4, 0
	movs r1, 0x7
	movs r2, 0x5
	bl MenuPrint
	bl sub_80941D8
	bl sub_8094200
	bl sub_8094218
	bl sub_809429C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809417C: .4byte gWindowConfig_81E6DC4
_08094180: .4byte gStringVar1
_08094184: .4byte 0x02000094
	thumb_func_end sub_8094140

	thumb_func_start sub_8094188
sub_8094188: @ 8094188
	push {lr}
	ldr r0, _080941D0 @ =gWindowConfig_81E6DC4
	bl BasicInitMenuWindow
	bl sub_80942F8
	bl sub_8094334
	bl sub_80943C4
	bl sub_8094428
	bl sub_8094498
	bl sub_80944E8
	bl sub_8094538
	ldr r0, _080941D4 @ =gWindowConfig_81E6DE0
	bl BasicInitMenuWindow
	bl sub_8094354
	bl sub_80943E4
	bl sub_8094448
	bl sub_80944B8
	bl sub_8094508
	bl sub_8094558
	pop {r0}
	bx r0
	.align 2, 0
_080941D0: .4byte gWindowConfig_81E6DC4
_080941D4: .4byte gWindowConfig_81E6DE0
	thumb_func_end sub_8094188

	thumb_func_start sub_80941D8
sub_80941D8: @ 80941D8
	push {lr}
	sub sp, 0x8
	ldr r0, _080941FC @ =0x02000000
	adds r0, 0x72
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x14
	movs r2, 0x2
	bl MenuPrint
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080941FC: .4byte 0x02000000
	thumb_func_end sub_80941D8

	thumb_func_start sub_8094200
sub_8094200: @ 8094200
	push {lr}
	ldr r0, _08094214 @ =0x02000000
	adds r0, 0x88
	ldr r0, [r0]
	movs r1, 0x10
	movs r2, 0x8
	bl sub_80B7AEC
	pop {r0}
	bx r0
	.align 2, 0
_08094214: .4byte 0x02000000
	thumb_func_end sub_8094200

	thumb_func_start sub_8094218
sub_8094218: @ 8094218
	push {lr}
	sub sp, 0x10
	ldr r1, _0809422C @ =0x02000000
	ldrb r0, [r1, 0x7]
	cmp r0, 0
	bne _08094230
	bl sub_8094110
	b _0809424A
	.align 2, 0
_0809422C: .4byte 0x02000000
_08094230:
	adds r0, r1, 0
	adds r0, 0x70
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x10
	movs r2, 0xA
	bl MenuPrint_RightAligned
_0809424A:
	add sp, 0x10
	pop {r0}
	bx r0
	thumb_func_end sub_8094218

	thumb_func_start sub_8094250
sub_8094250: @ 8094250
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	ldr r0, _08094294 @ =gSaveBlock2
	ldrh r4, [r0, 0xE]
	ldrb r2, [r0, 0x10]
	ldr r1, _08094298 @ =0x02000000
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _08094272
	adds r0, r1, 0
	adds r0, 0x74
	ldrh r4, [r0]
	adds r0, 0x2
	ldrh r2, [r0]
_08094272:
	lsls r3, 16
	asrs r3, 16
	mov r0, sp
	adds r1, r4, 0
	bl FormatPlayTime
	adds r0, r5, 0
	mov r1, sp
	movs r2, 0x30
	movs r3, 0x1
	bl sub_8072C74
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094294: .4byte gSaveBlock2
_08094298: .4byte 0x02000000
	thumb_func_end sub_8094250

	thumb_func_start sub_809429C
sub_809429C: @ 809429C
	push {r4-r6,lr}
	ldr r6, _080942F0 @ =0x02000000
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _080942EA
	ldr r0, _080942F4 @ =gStringVar1
	adds r1, r6, 0
	adds r1, 0x20
	bl StringCopy
	movs r5, 0
	strb r5, [r0]
	adds r0, 0x1
	adds r1, r6, 0
	adds r1, 0x30
	bl StringCopy
	ldr r4, _080942F4 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xE
	bl MenuPrint
	adds r1, r6, 0
	adds r1, 0x40
	adds r0, r4, 0
	bl StringCopy
	strb r5, [r0]
	adds r0, 0x1
	adds r1, r6, 0
	adds r1, 0x50
	bl StringCopy
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x10
	bl MenuPrint
_080942EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080942F0: .4byte 0x02000000
_080942F4: .4byte gStringVar1
	thumb_func_end sub_809429C

	thumb_func_start sub_80942F8
sub_80942F8: @ 80942F8
	push {r4,r5,lr}
	ldr r4, _08094328 @ =gStringVar1
	ldr r5, _0809432C @ =0x02000094
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringCopy
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r1, _08094330 @ =gOtherText_TrainersTrainerCard
	adds r0, r4, 0
	bl StringAppend
	adds r0, r4, 0
	movs r1, 0x1C
	movs r2, 0x2
	bl MenuPrint_RightAligned
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094328: .4byte gStringVar1
_0809432C: .4byte 0x02000094
_08094330: .4byte gOtherText_TrainersTrainerCard
	thumb_func_end sub_80942F8

	thumb_func_start sub_8094334
sub_8094334: @ 8094334
	push {lr}
	ldr r0, _0809434C @ =0x02000000
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _08094348
	ldr r0, _08094350 @ =gOtherText_FirstHOF
	movs r1, 0x3
	movs r2, 0x5
	bl MenuPrint
_08094348:
	pop {r0}
	bx r0
	.align 2, 0
_0809434C: .4byte 0x02000000
_08094350: .4byte gOtherText_FirstHOF
	thumb_func_end sub_8094334

	thumb_func_start sub_8094354
sub_8094354: @ 8094354
	push {r4,r5,lr}
	ldr r5, _080943B8 @ =0x02000000
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	beq _080943B0
	ldr r2, _080943BC @ =gStringVar1
	adds r0, r5, 0
	adds r0, 0x6A
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	ldr r4, _080943C0 @ =gUnknown_083B5EF4
	adds r1, r4, 0
	bl StringCopy
	adds r2, r0, 0
	adds r0, r5, 0
	adds r0, 0x6C
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	adds r1, r4, 0
	bl StringCopy
	adds r2, r0, 0
	adds r0, r5, 0
	adds r0, 0x6E
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080943BC @ =gStringVar1
	movs r1, 0x1C
	movs r2, 0x5
	bl MenuPrint_RightAligned
_080943B0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080943B8: .4byte 0x02000000
_080943BC: .4byte gStringVar1
_080943C0: .4byte gUnknown_083B5EF4
	thumb_func_end sub_8094354

	thumb_func_start sub_80943C4
sub_80943C4: @ 80943C4
	push {lr}
	ldr r0, _080943DC @ =0x02000000
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _080943D8
	ldr r0, _080943E0 @ =gOtherText_LinkCableBattles
	movs r1, 0x3
	movs r2, 0x7
	bl MenuPrint
_080943D8:
	pop {r0}
	bx r0
	.align 2, 0
_080943DC: .4byte 0x02000000
_080943E0: .4byte gOtherText_LinkCableBattles
	thumb_func_end sub_80943C4

	thumb_func_start sub_80943E4
sub_80943E4: @ 80943E4
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _08094424 @ =0x02000000
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _0809441C
	adds r0, r4, 0
	adds r0, 0x78
	ldrh r1, [r0]
	mov r0, sp
	bl ConvertIntToDecimalString
	mov r0, sp
	movs r1, 0x16
	movs r2, 0x7
	bl MenuPrint_RightAligned
	adds r0, r4, 0
	adds r0, 0x7A
	ldrh r1, [r0]
	mov r0, sp
	bl ConvertIntToDecimalString
	mov r0, sp
	movs r1, 0x1C
	movs r2, 0x7
	bl MenuPrint_RightAligned
_0809441C:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094424: .4byte 0x02000000
	thumb_func_end sub_80943E4

	thumb_func_start sub_8094428
sub_8094428: @ 8094428
	push {lr}
	ldr r0, _08094440 @ =0x02000000
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _0809443C
	ldr r0, _08094444 @ =gOtherText_BattleTowerWinRecord
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
_0809443C:
	pop {r0}
	bx r0
	.align 2, 0
_08094440: .4byte 0x02000000
_08094444: .4byte gOtherText_BattleTowerWinRecord
	thumb_func_end sub_8094428

	thumb_func_start sub_8094448
sub_8094448: @ 8094448
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _08094494 @ =0x02000000
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _0809448C
	adds r0, r4, 0
	adds r0, 0x7C
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	mov r0, sp
	movs r1, 0x70
	movs r2, 0x78
	movs r3, 0
	bl MenuPrint_PixelCoords
	adds r0, r4, 0
	adds r0, 0x7E
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	mov r0, sp
	movs r1, 0x95
	movs r2, 0x78
	movs r3, 0
	bl MenuPrint_PixelCoords
_0809448C:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094494: .4byte 0x02000000
	thumb_func_end sub_8094448

	thumb_func_start sub_8094498
sub_8094498: @ 8094498
	push {lr}
	ldr r0, _080944B0 @ =0x02000000
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	beq _080944AC
	ldr r0, _080944B4 @ =gOtherText_ContestRecord
	movs r1, 0x3
	movs r2, 0xD
	bl MenuPrint
_080944AC:
	pop {r0}
	bx r0
	.align 2, 0
_080944B0: .4byte 0x02000000
_080944B4: .4byte gOtherText_ContestRecord
	thumb_func_end sub_8094498

	thumb_func_start sub_80944B8
sub_80944B8: @ 80944B8
	push {lr}
	sub sp, 0x8
	ldr r1, _080944E4 @ =0x02000000
	ldrb r0, [r1, 0xB]
	cmp r0, 0
	beq _080944DE
	adds r0, r1, 0
	adds r0, 0x80
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x1C
	movs r2, 0xD
	bl MenuPrint_RightAligned
_080944DE:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080944E4: .4byte 0x02000000
	thumb_func_end sub_80944B8

	thumb_func_start sub_80944E8
sub_80944E8: @ 80944E8
	push {lr}
	ldr r0, _08094500 @ =0x02000000
	ldrb r0, [r0, 0xC]
	cmp r0, 0
	beq _080944FC
	ldr r0, _08094504 @ =gOtherText_MixingRecord
	movs r1, 0x3
	movs r2, 0xB
	bl MenuPrint
_080944FC:
	pop {r0}
	bx r0
	.align 2, 0
_08094500: .4byte 0x02000000
_08094504: .4byte gOtherText_MixingRecord
	thumb_func_end sub_80944E8

	thumb_func_start sub_8094508
sub_8094508: @ 8094508
	push {lr}
	sub sp, 0x8
	ldr r1, _08094534 @ =0x02000000
	ldrb r0, [r1, 0xC]
	cmp r0, 0
	beq _0809452E
	adds r0, r1, 0
	adds r0, 0x82
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x1C
	movs r2, 0xB
	bl MenuPrint_RightAligned
_0809452E:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08094534: .4byte 0x02000000
	thumb_func_end sub_8094508

	thumb_func_start sub_8094538
sub_8094538: @ 8094538
	push {lr}
	ldr r0, _08094550 @ =0x02000000
	ldrb r0, [r0, 0xD]
	cmp r0, 0
	beq _0809454C
	ldr r0, _08094554 @ =gOtherText_TradeRecord
	movs r1, 0x3
	movs r2, 0x9
	bl MenuPrint
_0809454C:
	pop {r0}
	bx r0
	.align 2, 0
_08094550: .4byte 0x02000000
_08094554: .4byte gOtherText_TradeRecord
	thumb_func_end sub_8094538

	thumb_func_start sub_8094558
sub_8094558: @ 8094558
	push {lr}
	sub sp, 0x8
	ldr r1, _08094584 @ =0x02000000
	ldrb r0, [r1, 0xD]
	cmp r0, 0
	beq _0809457E
	adds r0, r1, 0
	adds r0, 0x84
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x1C
	movs r2, 0x9
	bl MenuPrint_RightAligned
_0809457E:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08094584: .4byte 0x02000000
	thumb_func_end sub_8094558

	thumb_func_start unref_sub_8094588
unref_sub_8094588: @ 8094588
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r2, r1, 16
	ldr r4, _080945B4 @ =gOtherText_Boy
	ldr r0, _080945B8 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _0809459E
	ldr r4, _080945BC @ =gOtherText_Girl
_0809459E:
	lsls r1, r3, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080945B4: .4byte gOtherText_Boy
_080945B8: .4byte gSaveBlock2
_080945BC: .4byte gOtherText_Girl
	thumb_func_end unref_sub_8094588

	.align 2, 0 @ Don't pad with nop.
