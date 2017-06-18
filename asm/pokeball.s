	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8046FBC
sub_8046FBC: @ 8046FBC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	beq _08047056
	cmp r1, 0x5F
	bne _08046FF4
	ldr r0, _08046FEC @ =gUnknown_02024E6D
	movs r1, 0
	strb r1, [r0]
	bl m4aMPlayAllStop
	ldr r0, _08046FF0 @ =0x00000173
	bl PlaySE
	b _08047056
	.align 2, 0
_08046FEC: .4byte gUnknown_02024E6D
_08046FF0: .4byte 0x00000173
_08046FF4:
	ldr r0, _0804705C @ =0x0000013b
	cmp r1, r0
	bne _08047056
	ldr r5, _08047060 @ =gSprites
	ldr r4, _08047064 @ =gUnknown_02024BE0
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r6, 0
	bl DestroySpriteAndFreeResources
	ldr r0, _08047068 @ =gMain
	ldr r1, _0804706C @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08047056
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 2
	ldr r0, _08047070 @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_08047056:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804705C: .4byte 0x0000013b
_08047060: .4byte gSprites
_08047064: .4byte gUnknown_02024BE0
_08047068: .4byte gMain
_0804706C: .4byte 0x0000043d
_08047070: .4byte 0x02017810
	thumb_func_end sub_8046FBC

	thumb_func_start sub_8047074
sub_8047074: @ 8047074
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x19
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x18
	strh r0, [r4, 0x36]
	ldr r0, _080470BC @ =0x0000ffe2
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	strh r0, [r4, 0x6]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080470C0 @ =sub_80470C4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080470BC: .4byte 0x0000ffe2
_080470C0: .4byte sub_80470C4
	thumb_func_end sub_8047074

	thumb_func_start sub_80470C4
sub_80470C4: @ 80470C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldrh r0, [r5, 0x3C]
	movs r1, 0xFF
	mov r8, r1
	lsrs r0, 8
	subs r0, 0x23
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2C
	bhi _080471B8
	ldrh r1, [r5, 0x6]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	bne _08047126
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	adds r6, r1, 0
	ands r6, r0
	ldrh r0, [r5, 0x32]
	adds r7, r1, 0
	ands r7, r0
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r1, 0x3
	bl __divsi3
	movs r1, 0x2
	negs r1, r1
	adds r4, r1, 0
	ands r0, r4
	orrs r6, r0
	strh r6, [r5, 0x30]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r1, 0x3
	bl __divsi3
	ands r0, r4
	orrs r7, r0
	strh r7, [r5, 0x32]
	adds r0, r5, 0
	movs r1, 0x4
	bl StartSpriteAffineAnim
_08047126:
	ldrh r4, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078B5C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x3
	bl __divsi3
	adds r1, r0, 0
	ldrh r0, [r5, 0x3C]
	adds r0, r1
	strh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 24
	mov r2, r8
	ands r0, r2
	movs r2, 0x38
	ldrsh r1, [r5, r2]
	bl Sin
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r5, 0x6]
	adds r0, r1
	strh r0, [r5, 0x6]
	lsls r0, 16
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _08047176
	strh r4, [r5, 0x2E]
	b _0804717E
_08047176:
	lsls r0, r4, 16
	asrs r0, 16
	subs r0, 0x1
	strh r0, [r5, 0x2E]
_0804717E:
	ldrh r0, [r5, 0x3C]
	lsrs r0, 8
	cmp r0, 0x4F
	ble _08047220
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	adds r6, r1, 0
	ands r6, r0
	ldrh r0, [r5, 0x32]
	adds r7, r1, 0
	ands r7, r0
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r1
	movs r1, 0x2
	negs r1, r1
	adds r2, r1, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r5, 0x30]
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	ands r0, r2
	orrs r0, r7
	strh r0, [r5, 0x32]
	b _08047220
_080471B8:
	adds r0, r5, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _08047220
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	ldrb r0, [r5, 0x6]
	strh r0, [r5, 0x3A]
	strh r1, [r5, 0x2E]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08047214
	ldr r0, _0804720C @ =0x02017840
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08047214
	movs r0, 0x3A
	ldrsh r4, [r5, r0]
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08047214
	ldr r0, _08047210 @ =sub_8047230
	b _08047216
	.align 2, 0
_0804720C: .4byte 0x02017840
_08047210: .4byte sub_8047230
_08047214:
	ldr r0, _0804722C @ =sub_8046C78
_08047216:
	str r0, [r5, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
_08047220:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804722C: .4byte sub_8046C78
	thumb_func_end sub_80470C4

	thumb_func_start sub_8047230
sub_8047230: @ 8047230
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _0804724A
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldr r0, _08047250 @ =sub_8046C78
	str r0, [r2, 0x1C]
_0804724A:
	pop {r0}
	bx r0
	.align 2, 0
_08047250: .4byte sub_8046C78
	thumb_func_end sub_8047230

	thumb_func_start sub_8047254
sub_8047254: @ 8047254
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080472A4
	movs r0, 0
	strh r0, [r5, 0x2E]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _080472A0
	ldr r0, _08047298 @ =0x02017840
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080472A0
	movs r0, 0x3A
	ldrsh r4, [r5, r0]
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080472A0
	ldr r0, _0804729C @ =sub_8047230
	b _080472A2
	.align 2, 0
_08047298: .4byte 0x02017840
_0804729C: .4byte sub_8047230
_080472A0:
	ldr r0, _080472AC @ =sub_8046C78
_080472A2:
	str r0, [r5, 0x1C]
_080472A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080472AC: .4byte sub_8046C78
	thumb_func_end sub_8047254

	thumb_func_start sub_80472B0
sub_80472B0: @ 80472B0
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	str r4, [sp]
	bl sub_814086C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80472B0

	thumb_func_start sub_80472D8
sub_80472D8: @ 80472D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80472D8

	thumb_func_start CreatePokeballSprite
CreatePokeballSprite: @ 80472F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	mov r9, r2
	mov r10, r3
	ldr r6, [sp, 0x24]
	ldr r4, [sp, 0x28]
	ldr r0, [sp, 0x2C]
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080473BC @ =gUnknown_0820A92C
	bl LoadCompressedObjectPic
	ldr r0, _080473C0 @ =gUnknown_0820A98C
	bl LoadCompressedObjectPalette
	ldr r0, _080473C4 @ =gSpriteTemplate_820AAB4
	mov r1, r9
	mov r2, r10
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080473C8 @ =gSprites
	mov r8, r3
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r1, r4, r3
	strh r5, [r1, 0x2E]
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	add r2, r8
	ldrh r0, [r2, 0x20]
	strh r0, [r1, 0x38]
	ldrh r0, [r2, 0x22]
	strh r0, [r1, 0x3A]
	mov r0, r9
	strh r0, [r2, 0x20]
	mov r3, r10
	strh r3, [r2, 0x22]
	strh r7, [r1, 0x30]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x32]
	mov r3, sp
	ldrh r3, [r3, 0x30]
	strh r3, [r1, 0x34]
	ldr r3, [sp, 0x30]
	lsrs r0, r3, 16
	strh r0, [r1, 0x36]
	movs r0, 0x3
	ands r6, r0
	lsls r6, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r6
	strb r0, [r1, 0x5]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _080473CC @ =sub_80473D0
	str r0, [r4]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080473BC: .4byte gUnknown_0820A92C
_080473C0: .4byte gUnknown_0820A98C
_080473C4: .4byte gSpriteTemplate_820AAB4
_080473C8: .4byte gSprites
_080473CC: .4byte sub_80473D0
	thumb_func_end CreatePokeballSprite

	thumb_func_start sub_80473D0
sub_80473D0: @ 80473D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldrh r1, [r6, 0x30]
	movs r2, 0x30
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _0804747C
	ldrh r0, [r6, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r6, 0x32]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r4, [r6, 0x34]
	ldrh r0, [r6, 0x36]
	lsls r0, 16
	orrs r4, r0
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804740A
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _0804740C
_0804740A:
	movs r5, 0
_0804740C:
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r6, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r3, r5, 0
	bl sub_80472B0
	movs r0, 0x1
	mov r1, r8
	adds r2, r4, 0
	bl sub_80472D8
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x30]
	ldr r0, _08047474 @ =sub_804748C
	str r0, [r6, 0x1C]
	ldr r0, _08047478 @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	bl AnimateSprite
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r4, 0x30]
	strh r5, [r6, 0x3C]
	b _08047480
	.align 2, 0
_08047474: .4byte sub_804748C
_08047478: .4byte gSprites
_0804747C:
	subs r0, r1, 0x1
	strh r0, [r6, 0x30]
_08047480:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80473D0

	thumb_func_start sub_804748C
sub_804748C: @ 804748C
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r0, 0
	mov r12, r0
	movs r6, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080474B6
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080474B6:
	ldr r0, _08047544 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r5, r1, r0
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080474D8
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r1, 0x1
	mov r12, r1
_080474D8:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r7, 0x20
	ldrsh r1, [r4, r7]
	subs r0, r1
	movs r1, 0x3C
	ldrsh r2, [r4, r1]
	muls r0, r2
	cmp r0, 0
	bge _080474EE
	adds r0, 0x7F
_080474EE:
	asrs r0, 7
	ldrh r7, [r4, 0x20]
	adds r0, r7
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r7, 0x22
	ldrsh r1, [r4, r7]
	subs r0, r1
	muls r0, r2
	cmp r0, 0
	bge _0804750A
	adds r0, 0x7F
_0804750A:
	asrs r0, 7
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r3, [r5, 0x20]
	strh r0, [r5, 0x22]
	ldrh r2, [r4, 0x3C]
	movs r7, 0x3C
	ldrsh r0, [r4, r7]
	cmp r0, 0x7F
	bgt _0804754C
	ldr r1, _08047548 @ =gSineTable
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08047530
	adds r0, 0x7
_08047530:
	asrs r0, 3
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	adds r1, r2, 0x4
	strh r1, [r4, 0x3C]
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	b _0804755A
	.align 2, 0
_08047544: .4byte gSprites
_08047548: .4byte gSineTable
_0804754C:
	ldrh r0, [r4, 0x38]
	strh r0, [r5, 0x20]
	ldrh r0, [r4, 0x3A]
	strh r0, [r5, 0x22]
	strh r6, [r5, 0x24]
	strh r6, [r5, 0x26]
	movs r6, 0x1
_0804755A:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08047578
	mov r2, r12
	cmp r2, 0
	beq _08047578
	cmp r6, 0
	beq _08047578
	adds r0, r4, 0
	bl DestroySpriteAndFreeResources
_08047578:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804748C

	thumb_func_start sub_8047580
sub_8047580: @ 8047580
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	adds r6, r2, 0
	mov r8, r3
	ldr r5, [sp, 0x20]
	ldr r4, [sp, 0x24]
	ldr r0, [sp, 0x28]
	mov r9, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _08047624 @ =gUnknown_0820A92C
	bl LoadCompressedObjectPic
	ldr r0, _08047628 @ =gUnknown_0820A98C
	bl LoadCompressedObjectPalette
	ldr r0, _0804762C @ =gSpriteTemplate_820AAB4
	adds r1, r6, 0
	mov r2, r8
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08047630 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r6
	mov r1, r10
	strh r1, [r2, 0x2E]
	mov r4, r9
	strh r4, [r2, 0x30]
	strh r7, [r2, 0x32]
	mov r1, sp
	ldrh r1, [r1, 0x2C]
	strh r1, [r2, 0x34]
	ldr r4, [sp, 0x2C]
	lsrs r1, r4, 16
	strh r1, [r2, 0x36]
	movs r1, 0x3
	ands r5, r1
	lsls r5, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r5
	strb r1, [r2, 0x5]
	adds r6, 0x1C
	adds r3, r6
	ldr r1, _08047634 @ =sub_8047638
	str r1, [r3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08047624: .4byte gUnknown_0820A92C
_08047628: .4byte gUnknown_0820A98C
_0804762C: .4byte gSpriteTemplate_820AAB4
_08047630: .4byte gSprites
_08047634: .4byte sub_8047638
	thumb_func_end sub_8047580

	thumb_func_start sub_8047638
sub_8047638: @ 8047638
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080476D0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r5, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	orrs r5, r0
	adds r0, r4, 0
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r0, 0
	beq _08047672
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _08047674
_08047672:
	movs r6, 0
_08047674:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r3, r6, 0
	bl sub_80472B0
	movs r0, 0x1
	mov r1, r8
	adds r2, r5, 0
	bl sub_80472D8
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x30]
	ldr r0, _080476C8 @ =sub_80476E0
	str r0, [r4, 0x1C]
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	ldr r0, _080476CC @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	bl AnimateSprite
	strh r5, [r4, 0x30]
	b _080476D4
	.align 2, 0
_080476C8: .4byte sub_80476E0
_080476CC: .4byte gSprites
_080476D0:
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
_080476D4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8047638

	thumb_func_start sub_80476E0
sub_80476E0: @ 80476E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _080476F8
	movs r0, 0x3C
	bl PlaySE
_080476F8:
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08047734 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0804773C
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	strh r0, [r5, 0x38]
	ldr r0, _08047738 @ =sub_8047754
	str r0, [r5, 0x1C]
	b _0804774C
	.align 2, 0
_08047734: .4byte gSprites
_08047738: .4byte sub_8047754
_0804773C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x60
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	negs r0, r0
	asrs r0, 8
	strh r0, [r4, 0x26]
_0804774C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80476E0

	thumb_func_start sub_8047754
sub_8047754: @ 8047754
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08047768
	ldr r0, _0804776C @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_08047768:
	pop {r0}
	bx r0
	.align 2, 0
_0804776C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8047754

	thumb_func_start obj_delete_and_free_associated_resources_
obj_delete_and_free_associated_resources_: @ 8047770
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	thumb_func_end obj_delete_and_free_associated_resources_

	thumb_func_start sub_804777C
sub_804777C: @ 804777C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _080477FC @ =gUnknown_03004340
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08047800 @ =gSprites
	adds r4, r0, r6
	movs r1, 0
	movs r0, 0x5
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r0, 0x73
	strh r0, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldr r0, _08047804 @ =sub_8047830
	str r0, [r4, 0x1C]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080477CA
	ldrh r0, [r4, 0x2E]
	negs r0, r0
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	negs r0, r0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
_080477CA:
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r1, r0, r1
	adds r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080477F4
	ldr r0, _08047808 @ =sub_804780C
	str r0, [r4, 0x1C]
_080477F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080477FC: .4byte gUnknown_03004340
_08047800: .4byte gSprites
_08047804: .4byte sub_8047830
_08047808: .4byte sub_804780C
	thumb_func_end sub_804777C

	thumb_func_start sub_804780C
sub_804780C: @ 804780C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _08047826
	movs r0, 0
	strh r0, [r1, 0x30]
	ldr r0, _0804782C @ =sub_8047830
	str r0, [r1, 0x1C]
_08047826:
	pop {r0}
	bx r0
	.align 2, 0
_0804782C: .4byte sub_8047830
	thumb_func_end sub_804780C

	thumb_func_start sub_8047830
sub_8047830: @ 8047830
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x2E]
	subs r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x26]
	ldrh r1, [r2, 0x30]
	subs r0, r1
	strh r0, [r2, 0x26]
	ldr r0, [r2, 0x24]
	cmp r0, 0
	bne _0804784E
	ldr r0, _08047854 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_0804784E:
	pop {r0}
	bx r0
	.align 2, 0
_08047854: .4byte SpriteCallbackDummy
	thumb_func_end sub_8047830

	thumb_func_start sub_8047858
sub_8047858: @ 8047858
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08047890 @ =oamc_804BEB4
	adds r0, r5, 0
	bl CreateInvisibleSpriteWithCallback
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08047894 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r3, r1, r2
	movs r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _08047898 @ =gUnknown_03004340
	adds r4, r0
	ldrb r0, [r4]
	strh r0, [r3, 0x30]
	adds r2, 0x1C
	adds r1, r2
	str r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047890: .4byte oamc_804BEB4
_08047894: .4byte gSprites
_08047898: .4byte gUnknown_03004340
	thumb_func_end sub_8047858

	thumb_func_start oamc_804BEB4
oamc_804BEB4: @ 804789C
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080478D8 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r0, [r3, 0x2E]
	movs r2, 0
	strh r0, [r1, 0x26]
	ldrh r0, [r3, 0x2E]
	negs r0, r0
	strh r0, [r3, 0x2E]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080478D4
	strh r2, [r1, 0x24]
	strh r2, [r1, 0x26]
	adds r0, r3, 0
	bl DestroySprite
_080478D4:
	pop {r0}
	bx r0
	.align 2, 0
_080478D8: .4byte gSprites
	thumb_func_end oamc_804BEB4

	thumb_func_start sub_80478DC
sub_80478DC: @ 80478DC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08047938 @ =gUnknown_0820A92C
	lsls r6, r4, 3
	adds r5, r6, r0
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _0804793C @ =0xffff0000
	cmp r0, r1
	bne _08047904
	adds r0, r5, 0
	bl LoadCompressedObjectPic
	ldr r0, _08047940 @ =gUnknown_0820A98C
	adds r0, r6, r0
	bl LoadCompressedObjectPalette
_08047904:
	cmp r4, 0x6
	beq _08047930
	cmp r4, 0x6
	blt _08047914
	cmp r4, 0xB
	bgt _08047914
	cmp r4, 0xA
	bge _08047930
_08047914:
	ldr r1, _08047938 @ =gUnknown_0820A92C
	lsls r0, r4, 3
	adds r0, r1
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	adds r1, r0, 0
	lsls r1, 16
	ldr r0, _08047944 @ =gUnknown_08D030D0
	lsrs r1, 11
	ldr r2, _08047948 @ =0x06010100
	adds r1, r2
	bl LZDecompressVram
_08047930:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047938: .4byte gUnknown_0820A92C
_0804793C: .4byte 0xffff0000
_08047940: .4byte gUnknown_0820A98C
_08047944: .4byte gUnknown_08D030D0
_08047948: .4byte 0x06010100
	thumb_func_end sub_80478DC

	thumb_func_start sub_804794C
sub_804794C: @ 804794C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _08047970 @ =gUnknown_0820A92C
	lsrs r4, 21
	adds r0, r4, r0
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldr r0, _08047974 @ =gUnknown_0820A98C
	adds r4, r0
	ldrh r0, [r4, 0x4]
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047970: .4byte gUnknown_0820A92C
_08047974: .4byte gUnknown_0820A98C
	thumb_func_end sub_804794C

	thumb_func_start sub_8047978
sub_8047978: @ 8047978
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080479A4
	ldr r1, _0804799C @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080479A0 @ =gEnemyParty
	b _080479B2
	.align 2, 0
_0804799C: .4byte gUnknown_02024A6A
_080479A0: .4byte gEnemyParty
_080479A4:
	ldr r1, _080479C4 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080479C8 @ =gPlayerParty
_080479B2:
	adds r0, r1
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080479C4: .4byte gUnknown_02024A6A
_080479C8: .4byte gPlayerParty
	thumb_func_end sub_8047978

	.align 2, 0 @ Don't pad with nop.
