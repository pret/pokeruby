	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80FA17C
sub_80FA17C: @ 80FA17C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	ldr r7, _080FA1B4 @ =gSaveBlock1
	ldr r0, _080FA1B8 @ =0x00002dd4
	adds r0, r7
	mov r9, r0
	movs r1, 0x1
	mov r8, r1
_080FA192:
	movs r0, 0xA
	bl sub_80EB72C
	lsls r4, r6, 3
	adds r5, r4, r7
	ldr r2, _080FA1BC @ =0x00002dd8
	adds r1, r5, r2
	strh r0, [r1]
	bl Random
	mov r1, r8
	ands r1, r0
	cmp r1, 0
	beq _080FA1C0
	movs r0, 0xC
	b _080FA1C2
	.align 2, 0
_080FA1B4: .4byte gSaveBlock1
_080FA1B8: .4byte 0x00002dd4
_080FA1BC: .4byte 0x00002dd8
_080FA1C0:
	movs r0, 0xD
_080FA1C2:
	bl sub_80EB72C
	ldr r2, _080FA214 @ =0x00002dda
	adds r1, r5, r2
	strh r0, [r1]
	bl Random
	adds r3, r4, r7
	mov r2, r8
	ands r2, r0
	ldr r5, _080FA218 @ =0x00002dd5
	adds r3, r5
	lsls r2, 6
	ldrb r0, [r3]
	movs r5, 0x41
	negs r5, r5
	adds r1, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	mov r1, r9
	adds r0, r4, r1
	bl sub_80FA740
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _080FA192
	ldr r0, _080FA21C @ =gSaveBlock1 + 0x2DD4
	movs r1, 0x5
	movs r2, 0
	bl sub_80FA46C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA214: .4byte 0x00002dda
_080FA218: .4byte 0x00002dd5
_080FA21C: .4byte gSaveBlock1 + 0x2DD4
	thumb_func_end sub_80FA17C

	thumb_func_start sub_80FA220
sub_80FA220: @ 80FA220
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080FA236
	b _080FA34E
_080FA236:
	lsls r0, r1, 2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	mov r10, r0
	movs r1, 0x7F
	mov r9, r1
	movs r2, 0x80
	negs r2, r2
	mov r8, r2
_080FA24A:
	ldr r2, [sp]
	mov r4, r10
	lsls r0, r4, 3
	ldr r1, _080FA28C @ =gSaveBlock1 + 0x2DD4
	adds r5, r0, r1
	ldrb r6, [r5, 0x1]
	movs r0, 0x40
	ands r0, r6
	cmp r0, 0
	bne _080FA2A0
	ldrb r4, [r5]
	lsls r3, r4, 25
	lsrs r1, r3, 25
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r1, r0
	bcc _080FA290
	adds r0, r1, 0
	subs r0, r2
	mov r2, r9
	ands r0, r2
	mov r1, r8
	ands r1, r4
	orrs r1, r0
	strb r1, [r5]
	movs r0, 0x7F
	ands r1, r0
	cmp r1, 0
	bne _080FA336
	movs r0, 0x40
	orrs r0, r6
	b _080FA334
	.align 2, 0
_080FA28C: .4byte gSaveBlock1 + 0x2DD4
_080FA290:
	lsrs r0, r3, 25
	subs r2, r0
	mov r0, r8
	ands r0, r4
	strb r0, [r5]
	movs r0, 0x40
	orrs r0, r6
	strb r0, [r5, 0x1]
_080FA2A0:
	ldrb r7, [r5]
	lsls r0, r7, 25
	lsrs r0, 25
	adds r4, r0, r2
	ldrh r0, [r5]
	lsls r6, r0, 18
	lsls r0, r4, 16
	lsrs r0, 16
	lsrs r1, r6, 25
	cmp r0, r1
	bls _080FA310
	adds r0, r4, 0
	bl __umodsi3
	adds r3, r0, 0
	lsrs r1, r6, 25
	adds r0, r4, 0
	str r3, [sp, 0x4]
	bl __udivsi3
	adds r4, r0, 0
	movs r0, 0x1
	eors r4, r0
	ands r4, r0
	lsls r2, r4, 6
	ldrb r0, [r5, 0x1]
	movs r4, 0x41
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x1]
	movs r1, 0x40
	ands r0, r1
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _080FA2FA
	adds r1, r3, 0
	mov r0, r9
	ands r1, r0
	mov r0, r8
	ands r0, r7
	orrs r0, r1
	strb r0, [r5]
	b _080FA336
_080FA2FA:
	ldrh r0, [r5]
	lsls r0, 18
	lsrs r0, 25
	subs r0, r3
	mov r1, r9
	ands r0, r1
	mov r1, r8
	ands r1, r7
	orrs r1, r0
	strb r1, [r5]
	b _080FA336
_080FA310:
	mov r2, r9
	ands r4, r2
	mov r0, r8
	ands r0, r7
	orrs r0, r4
	strb r0, [r5]
	lsls r0, 25
	ldrh r1, [r5]
	lsls r1, 18
	lsrs r0, 25
	lsrs r1, 25
	cmp r0, r1
	bne _080FA336
	ldrb r0, [r5, 0x1]
	movs r4, 0x41
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
_080FA334:
	strb r0, [r5, 0x1]
_080FA336:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	cmp r0, 0x4
	bls _080FA24A
	ldr r0, _080FA360 @ =gSaveBlock1 + 0x2DD4
	movs r1, 0x5
	movs r2, 0
	bl sub_80FA46C
_080FA34E:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA360: .4byte gSaveBlock1 + 0x2DD4
	thumb_func_end sub_80FA220

	thumb_func_start sub_80FA364
sub_80FA364: @ 80FA364
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0
	str r0, [sp]
	str r1, [sp, 0x4]
	adds r0, r4, 0
	bl sub_80FA7C8
	lsls r0, 24
	cmp r0, 0
	bne _080FA462
	ldr r5, _080FA3B4 @ =0x00000833
	adds r0, r5, 0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080FA3C8
	adds r0, r5, 0
	bl FlagSet
	ldr r0, _080FA3B8 @ =0x00000834
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080FA3C8
	ldr r1, _080FA3BC @ =gSaveBlock1
	ldrh r2, [r4]
	ldr r3, _080FA3C0 @ =0x00002dd8
	adds r0, r1, r3
	strh r2, [r0]
	ldrh r0, [r4, 0x2]
	ldr r2, _080FA3C4 @ =0x00002dda
	adds r1, r2
	strh r0, [r1]
	movs r0, 0x1
	b _080FA464
	.align 2, 0
_080FA3B4: .4byte 0x00000833
_080FA3B8: .4byte 0x00000834
_080FA3BC: .4byte gSaveBlock1
_080FA3C0: .4byte 0x00002dd8
_080FA3C4: .4byte 0x00002dda
_080FA3C8:
	ldrh r1, [r4, 0x2]
	lsls r1, 16
	ldrh r0, [r4]
	orrs r0, r1
	str r0, [sp, 0x4]
	movs r1, 0x80
	lsls r1, 7
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	mov r0, sp
	bl sub_80FA740
	movs r6, 0
_080FA3E4:
	lsls r4, r6, 3
	ldr r5, _080FA444 @ =gSaveBlock1 + 0x2DD4
	adds r1, r4, r5
	mov r0, sp
	movs r2, 0
	bl atk90_changetypestoenemyattacktype
	lsls r0, 24
	adds r7, r4, 0
	cmp r0, 0
	beq _080FA450
	movs r3, 0x4
	ldr r0, _080FA448 @ =0xffffd22c
	adds r0, r5
	mov r12, r0
	cmp r3, r6
	bls _080FA428
	mov r5, r12
	ldr r4, _080FA44C @ =0x00002dd4
_080FA40A:
	lsls r2, r3, 3
	adds r2, r5
	adds r2, r4
	subs r3, 0x1
	lsls r0, r3, 3
	adds r0, r5
	adds r0, r4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsls r3, 16
	lsrs r3, 16
	cmp r3, r6
	bhi _080FA40A
_080FA428:
	mov r3, r12
	adds r2, r7, r3
	ldr r0, _080FA44C @ =0x00002dd4
	adds r2, r0
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0
	cmp r6, 0
	bne _080FA464
	movs r0, 0x1
	b _080FA464
	.align 2, 0
_080FA444: .4byte gSaveBlock1 + 0x2DD4
_080FA448: .4byte 0xffffd22c
_080FA44C: .4byte 0x00002dd4
_080FA450:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _080FA3E4
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	str r0, [r5, 0x20]
	str r1, [r5, 0x24]
_080FA462:
	movs r0, 0
_080FA464:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA364

	thumb_func_start sub_80FA46C
sub_80FA46C: @ 80FA46C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	movs r2, 0
	cmp r2, r7
	bcs _080FA4D4
_080FA488:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r5, r0, 16
	mov r8, r1
	cmp r5, r7
	bcs _080FA4CA
	lsls r0, r2, 3
	mov r1, r9
	adds r6, r1, r0
_080FA49A:
	lsls r0, r5, 3
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, r10
	bl atk90_changetypestoenemyattacktype
	lsls r0, 24
	cmp r0, 0
	beq _080FA4C0
	ldr r2, [r4]
	ldr r3, [r4, 0x4]
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r2, [r6]
	str r3, [r6, 0x4]
_080FA4C0:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r7
	bcc _080FA49A
_080FA4CA:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r2, r0, 16
	cmp r2, r7
	bcc _080FA488
_080FA4D4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FA46C

	thumb_func_start sub_80FA4E4
sub_80FA4E4: @ 80FA4E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r4, 0
	cmp r4, r8
	bcs _080FA520
_080FA500:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080FA554 @ =0x02007800
	adds r0, r1
	adds r1, r4, 0
	muls r1, r5
	adds r1, r6, r1
	movs r2, 0x28
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bcc _080FA500
_080FA520:
	ldr r5, _080FA554 @ =0x02007800
	movs r0, 0x80
	lsls r0, 1
	adds r3, r5, r0
	movs r7, 0
	movs r4, 0
	cmp r4, r8
	bcs _080FA588
_080FA530:
	movs r6, 0
_080FA532:
	adds r0, r5, 0
	adds r1, r7, 0
	str r3, [sp]
	bl sub_80FA828
	lsls r0, 16
	asrs r0, 16
	ldr r3, [sp]
	cmp r0, 0
	bge _080FA558
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	stm r3!, {r0,r1}
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	b _080FA572
	.align 2, 0
_080FA554: .4byte 0x02007800
_080FA558:
	lsls r1, r0, 3
	ldr r0, _080FA5B4 @ =0x02007900
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r1, 25
	ldrb r0, [r5]
	lsls r0, 25
	cmp r1, r0
	bcs _080FA572
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
_080FA572:
	adds r5, 0x8
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _080FA532
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bcc _080FA530
_080FA588:
	ldr r4, _080FA5B4 @ =0x02007900
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x2
	bl sub_80FA46C
	adds r5, r4, 0
	ldr r3, _080FA5B8 @ =gSaveBlock1 + 0x2DD4
	movs r4, 0
_080FA59A:
	ldm r5!, {r0,r1}
	stm r3!, {r0,r1}
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080FA59A
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA5B4: .4byte 0x02007900
_080FA5B8: .4byte gSaveBlock1 + 0x2DD4
	thumb_func_end sub_80FA4E4

	thumb_func_start sub_80FA5BC
sub_80FA5BC: @ 80FA5BC
	push {lr}
	ldr r0, _080FA5D8 @ =gUnknown_0202E8CC
	ldrh r1, [r0]
	lsls r1, 3
	ldr r0, _080FA5DC @ =gSaveBlock1 + 0x2DD4
	adds r1, r0
	ldr r0, _080FA5E0 @ =gStringVar1
	adds r1, 0x4
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertEasyChatWordsToString
	pop {r0}
	bx r0
	.align 2, 0
_080FA5D8: .4byte gUnknown_0202E8CC
_080FA5DC: .4byte gSaveBlock1 + 0x2DD4
_080FA5E0: .4byte gStringVar1
	thumb_func_end sub_80FA5BC

	thumb_func_start sub_80FA5E4
sub_80FA5E4: @ 80FA5E4
	push {r4,lr}
	movs r4, 0
	ldr r3, _080FA630 @ =gSaveBlock1
	ldr r1, _080FA634 @ =0x00002dd4
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, 25
	lsrs r1, 25
	ldr r2, _080FA638 @ =0x00002ddc
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 25
	subs r1, r0
	cmp r1, 0x1
	bgt _080FA626
	ldr r1, _080FA63C @ =0x00002dd5
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080FA626
	ldr r1, _080FA640 @ =0x00002ddd
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	negs r0, r0
	lsrs r4, r0, 31
_080FA626:
	ldr r0, _080FA644 @ =gScriptResult
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA630: .4byte gSaveBlock1
_080FA634: .4byte 0x00002dd4
_080FA638: .4byte 0x00002ddc
_080FA63C: .4byte 0x00002dd5
_080FA640: .4byte 0x00002ddd
_080FA644: .4byte gScriptResult
	thumb_func_end sub_80FA5E4

	thumb_func_start sub_80FA648
sub_80FA648: @ 80FA648
	ldr r2, _080FA664 @ =gScriptResult
	ldr r0, _080FA668 @ =gSaveBlock1
	ldr r3, _080FA66C @ =0x00002dd8
	adds r1, r0, r3
	adds r3, 0x2
	adds r0, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080FA664: .4byte gScriptResult
_080FA668: .4byte gSaveBlock1
_080FA66C: .4byte 0x00002dd8
	thumb_func_end sub_80FA648

	thumb_func_start atk90_changetypestoenemyattacktype
atk90_changetypestoenemyattacktype: @ 80FA670
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r2, 0
	cmp r2, 0x1
	beq _080FA6B6
	cmp r2, 0x1
	bgt _080FA68A
	cmp r2, 0
	beq _080FA690
	b _080FA732
_080FA68A:
	cmp r0, 0x2
	beq _080FA6E2
	b _080FA732
_080FA690:
	ldrb r0, [r3]
	lsls r1, r0, 25
	ldrb r0, [r5]
	lsls r0, 25
	cmp r1, r0
	bhi _080FA72E
	cmp r1, r0
	bcc _080FA6DE
	ldrh r0, [r3]
	lsls r3, r0, 18
	ldrh r0, [r5]
	lsls r2, r0, 18
	lsrs r1, r3, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bhi _080FA72E
	lsrs r1, r3, 25
	lsrs r0, r2, 25
	b _080FA6DA
_080FA6B6:
	ldrh r0, [r3]
	lsls r4, r0, 18
	ldrh r0, [r5]
	lsls r2, r0, 18
	lsrs r1, r4, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bhi _080FA72E
	lsrs r1, r4, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bcc _080FA6DE
	ldrb r0, [r3]
	lsls r1, r0, 25
	ldrb r0, [r5]
	lsls r0, 25
	cmp r1, r0
	bhi _080FA72E
_080FA6DA:
	cmp r1, r0
	bcs _080FA732
_080FA6DE:
	movs r0, 0
	b _080FA73A
_080FA6E2:
	ldrb r0, [r3]
	lsls r1, r0, 25
	ldrb r0, [r5]
	lsls r0, 25
	cmp r1, r0
	bhi _080FA72E
	cmp r1, r0
	bcc _080FA6DE
	ldrh r0, [r3]
	lsls r4, r0, 18
	ldrh r0, [r5]
	lsls r2, r0, 18
	lsrs r1, r4, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bhi _080FA72E
	lsrs r1, r4, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bcc _080FA6DE
	ldrh r1, [r3, 0x2]
	ldrh r0, [r5, 0x2]
	cmp r1, r0
	bhi _080FA72E
	cmp r1, r0
	bcc _080FA6DE
	ldrh r1, [r3, 0x4]
	ldrh r0, [r5, 0x4]
	cmp r1, r0
	bhi _080FA72E
	cmp r1, r0
	bcc _080FA6DE
	ldrh r1, [r3, 0x6]
	ldrh r0, [r5, 0x6]
	cmp r1, r0
	bhi _080FA72E
	cmp r1, r0
	bcc _080FA6DE
_080FA72E:
	movs r0, 0x1
	b _080FA73A
_080FA732:
	bl Random
	movs r1, 0x1
	ands r0, r1
_080FA73A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end atk90_changetypestoenemyattacktype

	thumb_func_start sub_80FA740
sub_80FA740: @ 80FA740
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x62
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x32
	bls _080FA782
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x62
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x50
	bls _080FA782
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x62
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
_080FA782:
	adds r1, r4, 0
	adds r1, 0x1E
	movs r0, 0x7F
	ands r1, r0
	lsls r1, 7
	ldrh r2, [r5]
	ldr r0, _080FA7C4 @ =0xffffc07f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0x1
	bl __modsi3
	adds r0, 0x1E
	movs r1, 0x7F
	ands r0, r1
	ldrb r2, [r5]
	movs r1, 0x80
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	bl Random
	strh r0, [r5, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA7C4: .4byte 0xffffc07f
	thumb_func_end sub_80FA740

	thumb_func_start sub_80FA7C8
sub_80FA7C8: @ 80FA7C8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_080FA7CE:
	lsls r1, r4, 3
	ldr r0, _080FA7E4 @ =gSaveBlock1 + 0x2DD8
	adds r1, r0
	adds r0, r5, 0
	bl sub_80FA7FC
	lsls r0, 24
	cmp r0, 0
	beq _080FA7E8
	movs r0, 0x1
	b _080FA7F4
	.align 2, 0
_080FA7E4: .4byte gSaveBlock1 + 0x2DD8
_080FA7E8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080FA7CE
	movs r0, 0
_080FA7F4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA7C8

	thumb_func_start sub_80FA7FC
sub_80FA7FC: @ 80FA7FC
	push {r4,lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r4, 0
_080FA804:
	ldrh r1, [r3]
	ldrh r0, [r2]
	adds r2, 0x2
	adds r3, 0x2
	cmp r1, r0
	beq _080FA814
	movs r0, 0
	b _080FA820
_080FA814:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080FA804
	movs r0, 0x1
_080FA820:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA7FC

	thumb_func_start sub_80FA828
sub_80FA828: @ 80FA828
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r6, _080FA84C @ =0x02007900
	movs r4, 0
	cmp r4, r5
	bge _080FA862
_080FA838:
	adds r1, r6, 0x4
	adds r0, r7, 0x4
	bl sub_80FA7FC
	lsls r0, 24
	cmp r0, 0
	beq _080FA850
	lsls r0, r4, 16
	asrs r0, 16
	b _080FA866
	.align 2, 0
_080FA84C: .4byte 0x02007900
_080FA850:
	adds r6, 0x8
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, r5
	blt _080FA838
_080FA862:
	movs r0, 0x1
	negs r0, r0
_080FA866:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA828

	.align 2, 0 @ Don't pad with nop.
