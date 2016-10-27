	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80F9020
sub_80F9020: @ 80F9020
	push {r4,r5,lr}
	ldr r4, _080F9054 @ =gBG1TilemapBuffer
	movs r5, 0x80
	lsls r5, 4
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	adds r0, r4, r5
	movs r1, 0
	adds r2, r5, 0
	bl memset
	movs r0, 0x80
	lsls r0, 5
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9054: .4byte gBG1TilemapBuffer
	thumb_func_end sub_80F9020

	thumb_func_start sav2_get_text_speed
sav2_get_text_speed: @ 80F9058
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	bl MenuDisplayMessageBox
	cmp r4, 0
	beq _080F907C
	ldr r0, _080F908C @ =gBG1TilemapBuffer
	movs r1, 0x4
	str r1, [sp]
	str r4, [sp, 0x4]
	movs r1, 0x2
	movs r2, 0xF
	movs r3, 0x1A
	bl sub_80A3FA0
_080F907C:
	adds r0, r5, 0
	bl sub_8072044
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F908C: .4byte gBG1TilemapBuffer
	thumb_func_end sav2_get_text_speed

	thumb_func_start sub_80F9090
sub_80F9090: @ 80F9090
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F90AC
	ldr r0, _080F90B4 @ =gUnknown_0300074C
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_080F90AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F90B4: .4byte gUnknown_0300074C
	thumb_func_end sub_80F9090

	thumb_func_start DisplayItemMessageOnField
DisplayItemMessageOnField: @ 80F90B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	adds r1, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r1, 16
	bl sav2_get_text_speed
	ldr r0, _080F90E8 @ =gUnknown_0300074C
	str r5, [r0]
	ldr r1, _080F90EC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080F90F0 @ =sub_80F9090
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F90E8: .4byte gUnknown_0300074C
_080F90EC: .4byte gTasks
_080F90F0: .4byte sub_80F9090
	thumb_func_end DisplayItemMessageOnField

	thumb_func_start Task_CallYesOrNoCallback
Task_CallYesOrNoCallback: @ 80F90F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080F911A
	cmp r1, 0
	bgt _080F9114
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080F9130
	b _080F9140
_080F9114:
	cmp r1, 0x1
	beq _080F9130
	b _080F9140
_080F911A:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080F912C @ =gUnknown_020388C4
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080F9140
	.align 2, 0
_080F912C: .4byte gUnknown_020388C4
_080F9130:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080F9148 @ =gUnknown_020388C4
	ldr r1, [r0, 0x4]
	adds r0, r4, 0
	bl _call_via_r1
_080F9140:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9148: .4byte gUnknown_020388C4
	thumb_func_end Task_CallYesOrNoCallback

	thumb_func_start sub_80F914C
sub_80F914C: @ 80F914C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080F916C @ =gUnknown_020388C4
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r3]
	str r2, [r3, 0x4]
	ldr r2, _080F9170 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080F9174 @ =Task_CallYesOrNoCallback
	str r0, [r1]
	bx lr
	.align 2, 0
_080F916C: .4byte gUnknown_020388C4
_080F9170: .4byte gTasks
_080F9174: .4byte Task_CallYesOrNoCallback
	thumb_func_end sub_80F914C

	thumb_func_start brm_trade_1
brm_trade_1: @ 80F9178
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	ldr r1, _080F91C0 @ =gUnknown_083E5A18
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	cmp r4, 0xFF
	beq _080F91CC
	mov r0, sp
	strb r4, [r0, 0x2]
	ldr r4, _080F91C4 @ =gStringVar4
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringAppend
	mov r1, sp
	ldr r0, _080F91C8 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	strb r0, [r1, 0x2]
	adds r0, r4, 0
	bl StringAppend
	b _080F91D4
	.align 2, 0
_080F91C0: .4byte gUnknown_083E5A18
_080F91C4: .4byte gStringVar4
_080F91C8: .4byte gMenuWindowPtr
_080F91CC:
	ldr r0, _080F91E8 @ =gStringVar4
	adds r1, r5, 0
	bl StringCopy
_080F91D4:
	ldr r0, _080F91E8 @ =gStringVar4
	adds r1, r7, 0
	adds r2, r6, 0
	bl MenuPrint
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F91E8: .4byte gStringVar4
	thumb_func_end brm_trade_1

	thumb_func_start unref_sub_80F91EC
unref_sub_80F91EC: @ 80F91EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	adds r4, r2, 0
	adds r2, r3, 0
	ldr r0, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r6, _080F9234 @ =gStringVar1
	adds r0, r6, 0
	mov r1, r12
	adds r3, r4, 0
	bl ConvertIntToDecimalStringN
	mov r0, r8
	cmp r0, 0xFF
	beq _080F9238
	adds r0, r6, 0
	mov r1, r8
	adds r2, r7, 0
	adds r3, r5, 0
	bl brm_trade_1
	b _080F9242
	.align 2, 0
_080F9234: .4byte gStringVar1
_080F9238:
	adds r0, r6, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl MenuPrint
_080F9242:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80F91EC

	thumb_func_start unref_sub_80F924C
unref_sub_80F924C: @ 80F924C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F9280 @ =gUnknown_083E5A1C
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl brm_trade_1
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F9280: .4byte gUnknown_083E5A1C
	thumb_func_end unref_sub_80F924C

	thumb_func_start sub_80F9284
sub_80F9284: @ 80F9284
	push {lr}
	ldr r0, _080F92A0 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _080F92B6
	ldr r0, _080F92A4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080F92A8
	movs r0, 0x1
	b _080F92B8
	.align 2, 0
_080F92A0: .4byte gSaveBlock2
_080F92A4: .4byte gMain
_080F92A8:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080F92B6
	movs r0, 0x2
	b _080F92B8
_080F92B6:
	movs r0, 0
_080F92B8:
	pop {r1}
	bx r1
	thumb_func_end sub_80F9284

	thumb_func_start sub_80F92BC
sub_80F92BC: @ 80F92BC
	push {lr}
	ldr r0, _080F92D8 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _080F92EE
	ldr r0, _080F92DC @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080F92E0
	movs r0, 0x1
	b _080F92F0
	.align 2, 0
_080F92D8: .4byte gSaveBlock2
_080F92DC: .4byte gMain
_080F92E0:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080F92EE
	movs r0, 0x2
	b _080F92F0
_080F92EE:
	movs r0, 0
_080F92F0:
	pop {r1}
	bx r1
	thumb_func_end sub_80F92BC

	thumb_func_start sub_80F92F4
sub_80F92F4: @ 80F92F4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _080F9314
	ldr r0, _080F930C @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	ldr r0, _080F9310 @ =0x00001919
	cmp r1, r0
	bne _080F9314
	movs r0, 0
	b _080F9316
	.align 2, 0
_080F930C: .4byte gSaveBlock1
_080F9310: .4byte 0x00001919
_080F9314:
	movs r0, 0x1
_080F9316:
	pop {r1}
	bx r1
	thumb_func_end sub_80F92F4

	thumb_func_start sub_80F931C
sub_80F931C: @ 80F931C
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _080F933C
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F933C
	movs r0, 0
	b _080F933E
_080F933C:
	movs r0, 0x1
_080F933E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F931C

	thumb_func_start sub_80F9344
sub_80F9344: @ 80F9344
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	beq _080F9356
	ldr r0, _080F935C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F9360
_080F9356:
	movs r0, 0x1
	b _080F9362
	.align 2, 0
_080F935C: .4byte gReceivedRemoteLinkPlayers
_080F9360:
	movs r0, 0
_080F9362:
	pop {r1}
	bx r1
	thumb_func_end sub_80F9344

	thumb_func_start sub_80F9368
sub_80F9368: @ 80F9368
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0xE
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x14
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _080F9430 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080F9434 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080F93C6:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _080F93C6
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _080F9430 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9430: .4byte 0x040000d4
_080F9434: .4byte 0x81000800
	thumb_func_end sub_80F9368

	thumb_func_start sub_80F9438
sub_80F9438: @ 80F9438
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	thumb_func_end sub_80F9438

	thumb_func_start sub_80F944C
sub_80F944C: @ 80F944C
	push {r4,lr}
	movs r2, 0
	ldr r4, _080F9478 @ =gUnknown_020388C0
	movs r3, 0xFF
_080F9454:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080F9454
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	ldr r0, _080F947C @ =gUnknown_083E5968
	bl LoadSpritePalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9478: .4byte gUnknown_020388C0
_080F947C: .4byte gUnknown_083E5968
	thumb_func_end sub_80F944C

	thumb_func_start sub_80F9480
sub_80F9480: @ 80F9480
	push {r4,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	cmp r2, r1
	bcs _080F949E
	movs r4, 0xFF
_080F9490:
	adds r0, r3, r2
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _080F9490
_080F949E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F9480

	thumb_func_start sub_80F94A4
sub_80F94A4: @ 80F94A4
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 16
	lsrs r1, r2, 16
	lsls r3, 16
	lsrs r2, r3, 16
	cmp r4, 0x5
	bhi _080F94E8
	ldrb r0, [r5]
	cmp r0, 0xFF
	bne _080F94D0
	ldr r0, _080F94F0 @ =gSpriteTemplate_83E5A00
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5]
_080F94D0:
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F94F4 @ =gSprites
	adds r0, r1
	adds r1, r4, 0
	bl StartSpriteAnim
_080F94E8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F94F0: .4byte gSpriteTemplate_83E5A00
_080F94F4: .4byte gSprites
	thumb_func_end sub_80F94A4

	thumb_func_start sub_80F94F8
sub_80F94F8: @ 80F94F8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080F9516
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F951C @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r0, 0xFF
	strb r0, [r4]
_080F9516:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F951C: .4byte gSprites
	thumb_func_end sub_80F94F8

	thumb_func_start sub_80F9520
sub_80F9520: @ 80F9520
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_080F9526:
	adds r0, r5, r4
	bl sub_80F94F8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080F9526
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F9520

	thumb_func_start CreateVerticalScrollIndicators
CreateVerticalScrollIndicators: @ 80F953C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r4, 0x3
	bls _080F9550
	b _080F9790
_080F9550:
	cmp r4, 0x1
	beq _080F95F6
	cmp r4, 0x1
	bgt _080F9564
	cmp r4, 0
	beq _080F9578
	ldr r5, _080F9560 @ =gUnknown_020388C0
	b _080F977A
	.align 2, 0
_080F9560: .4byte gUnknown_020388C0
_080F9564:
	cmp r4, 0x2
	bne _080F956A
	b _080F967C
_080F956A:
	cmp r4, 0x3
	bne _080F9570
	b _080F96F8
_080F9570:
	ldr r5, _080F9574 @ =gUnknown_020388C0
	b _080F977A
	.align 2, 0
_080F9574: .4byte gUnknown_020388C0
_080F9578:
	ldr r0, _080F95D8 @ =gUnknown_020388C0
	ldrb r1, [r0]
	adds r5, r0, 0
	cmp r1, 0xFF
	beq _080F9584
	b _080F977A
_080F9584:
	ldr r0, _080F95DC @ =gSpriteTemplate_83E59D0
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5]
	ldr r3, _080F95E0 @ =gSprites
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080F95E4 @ =0x0000ffff
	strh r1, [r0, 0x32]
	ldrb r0, [r5, 0x1]
	cmp r0, 0xFF
	beq _080F95E8
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x1]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	negs r0, r0
	strh r0, [r1, 0x26]
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x1]
	b _080F9650
	.align 2, 0
_080F95D8: .4byte gUnknown_020388C0
_080F95DC: .4byte gSpriteTemplate_83E59D0
_080F95E0: .4byte gSprites
_080F95E4: .4byte 0x0000ffff
_080F95E8:
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r4, [r0, 0x34]
	b _080F977A
_080F95F6:
	ldr r0, _080F9660 @ =gUnknown_020388C0
	ldrb r1, [r0, 0x1]
	adds r5, r0, 0
	cmp r1, 0xFF
	beq _080F9602
	b _080F977A
_080F9602:
	ldr r0, _080F9664 @ =gSpriteTemplate_83E59D0
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5, 0x1]
	ldr r3, _080F9668 @ =gSprites
	ldrb r1, [r5, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r4, [r0, 0x32]
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _080F966C
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	negs r0, r0
	strh r0, [r1, 0x26]
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5]
_080F9650:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x34]
	strh r0, [r1, 0x34]
	b _080F977A
	.align 2, 0
_080F9660: .4byte gUnknown_020388C0
_080F9664: .4byte gSpriteTemplate_83E59D0
_080F9668: .4byte gSprites
_080F966C:
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strh r0, [r1, 0x34]
	b _080F977A
_080F967C:
	ldr r0, _080F96E4 @ =gUnknown_020388C0
	ldrb r1, [r0, 0x2]
	adds r5, r0, 0
	cmp r1, 0xFF
	bne _080F977A
	ldr r0, _080F96E8 @ =gSpriteTemplate_83E59E8
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5, 0x2]
	ldr r3, _080F96EC @ =gSprites
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080F96F0 @ =0x0000ffff
	strh r1, [r0, 0x2E]
	ldrb r0, [r5, 0x3]
	cmp r0, 0xFF
	beq _080F96F4
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x3]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x3]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x30]
	b _080F9778
	.align 2, 0
_080F96E4: .4byte gUnknown_020388C0
_080F96E8: .4byte gSpriteTemplate_83E59E8
_080F96EC: .4byte gSprites
_080F96F0: .4byte 0x0000ffff
_080F96F4:
	ldrb r0, [r5, 0x2]
	b _080F976E
_080F96F8:
	ldr r0, _080F9760 @ =gUnknown_020388C0
	ldrb r1, [r0, 0x3]
	adds r5, r0, 0
	cmp r1, 0xFF
	bne _080F977A
	ldr r0, _080F9764 @ =gSpriteTemplate_83E59E8
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5, 0x3]
	ldr r3, _080F9768 @ =gSprites
	ldrb r1, [r5, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	beq _080F976C
	ldrb r0, [r5, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x2]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrb r0, [r5, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x2]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x30]
	b _080F9778
	.align 2, 0
_080F9760: .4byte gUnknown_020388C0
_080F9764: .4byte gSpriteTemplate_83E59E8
_080F9768: .4byte gSprites
_080F976C:
	ldrb r0, [r5, 0x3]
_080F976E:
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
_080F9778:
	strh r0, [r1, 0x30]
_080F977A:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F9798 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	ands r1, r4
	bl StartSpriteAnim
_080F9790:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9798: .4byte gSprites
	thumb_func_end CreateVerticalScrollIndicators

	thumb_func_start sub_80F979C
sub_80F979C: @ 80F979C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r2, 0x3
	bhi _080F97D4
	ldr r0, _080F97D8 @ =gUnknown_020388C0
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080F97D4
	ldr r2, _080F97DC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	movs r0, 0x1
	adds r2, r3, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
_080F97D4:
	pop {r0}
	bx r0
	.align 2, 0
_080F97D8: .4byte gUnknown_020388C0
_080F97DC: .4byte gSprites
	thumb_func_end sub_80F979C

	thumb_func_start DestroyVerticalScrollIndicator
DestroyVerticalScrollIndicator: @ 80F97E0
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080F9808
	ldr r0, _080F9810 @ =gUnknown_020388C0
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080F9808
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F9814 @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r0, 0xFF
	strb r0, [r4]
_080F9808:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9810: .4byte gUnknown_020388C0
_080F9814: .4byte gSprites
	thumb_func_end DestroyVerticalScrollIndicator

	thumb_func_start LoadScrollIndicatorPalette
LoadScrollIndicatorPalette: @ 80F9818
	push {lr}
	ldr r0, _080F9824 @ =gUnknown_083E5968
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_080F9824: .4byte gUnknown_083E5968
	thumb_func_end LoadScrollIndicatorPalette

	thumb_func_start BuyMenuFreeMemory
BuyMenuFreeMemory: @ 80F9828
	push {lr}
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end BuyMenuFreeMemory

	thumb_func_start sub_80F9834
sub_80F9834: @ 80F9834
	push {lr}
	adds r2, r0, 0
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080F9848
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
_080F9848:
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080F9858
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
_080F9858:
	ldrh r1, [r2, 0x30]
	adds r1, 0x1
	movs r3, 0
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x2
	ble _080F9870
	strh r3, [r2, 0x30]
_080F9870:
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0x2
	ble _080F987A
	strh r3, [r2, 0x34]
_080F987A:
	movs r0, 0x24
	ldrsh r1, [r2, r0]
	cmp r1, 0x8
	beq _080F988A
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	bne _080F988C
_080F988A:
	strh r3, [r2, 0x24]
_080F988C:
	movs r0, 0x26
	ldrsh r1, [r2, r0]
	cmp r1, 0x8
	beq _080F989C
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	bne _080F98A0
_080F989C:
	movs r0, 0
	strh r0, [r2, 0x26]
_080F98A0:
	pop {r0}
	bx r0
	thumb_func_end sub_80F9834

	thumb_func_start sub_80F98A4
sub_80F98A4: @ 80F98A4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F98D0 @ =gUnknown_020388C0
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _080F98CA
	cmp r1, 0x3
	bhi _080F98CA
	ldr r2, _080F98D4 @ =gSprites
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080F98D8 @ =SpriteCallbackDummy
	str r1, [r0]
_080F98CA:
	pop {r0}
	bx r0
	.align 2, 0
_080F98D0: .4byte gUnknown_020388C0
_080F98D4: .4byte gSprites
_080F98D8: .4byte SpriteCallbackDummy
	thumb_func_end sub_80F98A4

	thumb_func_start sub_80F98DC
sub_80F98DC: @ 80F98DC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F9908 @ =gUnknown_020388C0
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _080F9902
	cmp r1, 0x3
	bhi _080F9902
	ldr r2, _080F990C @ =gSprites
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080F9910 @ =sub_80F9834
	str r1, [r0]
_080F9902:
	pop {r0}
	bx r0
	.align 2, 0
_080F9908: .4byte gUnknown_020388C0
_080F990C: .4byte gSprites
_080F9910: .4byte sub_80F9834
	thumb_func_end sub_80F98DC

	thumb_func_start sub_80F9914
sub_80F9914: @ 80F9914
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F9964 @ =gUnknown_020388C0
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080F995C
	cmp r1, 0x3
	bhi _080F995C
	ldr r3, _080F9968 @ =gSprites
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r2, 0
	strh r2, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x26]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x34]
_080F995C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9964: .4byte gUnknown_020388C0
_080F9968: .4byte gSprites
	thumb_func_end sub_80F9914

	thumb_func_start sub_80F996C
sub_80F996C: @ 80F996C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80F98A4
	adds r0, r4, 0
	bl sub_80F9914
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F996C

	thumb_func_start sub_80F9988
sub_80F9988: @ 80F9988
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r0, _080F99C4 @ =gUnknown_020388C0
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080F99BE
	cmp r2, 0x3
	bhi _080F99BE
	ldr r2, _080F99C8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r3, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_080F99BE:
	pop {r0}
	bx r0
	.align 2, 0
_080F99C4: .4byte gUnknown_020388C0
_080F99C8: .4byte gSprites
	thumb_func_end sub_80F9988

	.align 2, 0 @ Don't pad with nop.
