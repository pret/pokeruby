	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C7754
sub_80C7754: @ 80C7754
	push {r4-r6,lr}
	sub sp, 0xC
	mov r4, sp
	adds r4, 0x5
	mov r5, sp
	adds r5, 0x6
	add r6, sp, 0x8
	add r0, sp, 0x4
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_810D9EC
	lsls r0, 24
	cmp r0, 0
	bne _080C7796
	add r0, sp, 0x4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	movs r3, 0
	ldrsb r3, [r5, r3]
	movs r4, 0
	ldrsb r4, [r6, r4]
	str r4, [sp]
	bl warp1_set
	movs r0, 0x1
	b _080C7798
_080C7796:
	movs r0, 0
_080C7798:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C7754

	thumb_func_start sub_80C77A0
sub_80C77A0: @ 80C77A0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C77CC @ =gTasks + 0x8
	adds r4, r0, r1
	ldr r0, _080C77D0 @ =0x000040b4
	bl GetVarPointer
	adds r6, r0, 0
	ldr r7, _080C77D4 @ =gSaveBlock1 + 0x4
	movs r0, 0
	ldrsh r2, [r4, r0]
	cmp r2, 0x1
	beq _080C77FC
	cmp r2, 0x1
	bgt _080C77D8
	cmp r2, 0
	beq _080C77E2
	b _080C7896
	.align 2, 0
_080C77CC: .4byte gTasks + 0x8
_080C77D0: .4byte 0x000040b4
_080C77D4: .4byte gSaveBlock1 + 0x4
_080C77D8:
	cmp r2, 0x2
	beq _080C783E
	cmp r2, 0x3
	beq _080C7878
	b _080C7896
_080C77E2:
	ldr r0, _080C77F8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C7896
	strh r2, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r4]
	b _080C7896
	.align 2, 0
_080C77F8: .4byte gPaletteFade
_080C77FC:
	ldr r0, _080C7830 @ =gMain
	ldrh r1, [r0, 0x2E]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080C780A
	strh r2, [r4, 0x2]
_080C780A:
	ldrb r1, [r7, 0x1]
	ldrb r2, [r7]
	movs r0, 0xFF
	bl sub_80A212C
	lsls r0, 24
	cmp r0, 0
	beq _080C7896
	movs r0, 0x1
	bl sub_810D9B0
	cmp r0, 0x1
	bne _080C783A
	ldrh r0, [r6]
	cmp r0, 0x2
	bne _080C7834
	movs r0, 0x9
	b _080C7836
	.align 2, 0
_080C7830: .4byte gMain
_080C7834:
	movs r0, 0xA
_080C7836:
	strh r0, [r6]
	b _080C7846
_080C783A:
	movs r0, 0x2
	strh r0, [r4]
_080C783E:
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C784C
_080C7846:
	movs r0, 0x3
	strh r0, [r4]
	b _080C7896
_080C784C:
	ldrh r0, [r6]
	cmp r0, 0x2
	bne _080C7860
	ldrb r1, [r7, 0x1]
	ldrb r2, [r7]
	ldr r3, _080C785C @ =gUnknown_083D295F
	b _080C7866
	.align 2, 0
_080C785C: .4byte gUnknown_083D295F
_080C7860:
	ldrb r1, [r7, 0x1]
	ldrb r2, [r7]
	ldr r3, _080C7874 @ =gUnknown_083D2961
_080C7866:
	movs r0, 0xFF
	bl exec_movement
	movs r0, 0x1
	strh r0, [r4]
	b _080C7896
	.align 2, 0
_080C7874: .4byte gUnknown_083D2961
_080C7878:
	ldr r0, _080C789C @ =0x00004001
	bl FlagReset
	movs r0, 0x80
	lsls r0, 7
	bl FlagReset
	movs r0, 0
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	bl sp13E_warp_to_last_warp
	adds r0, r5, 0
	bl DestroyTask
_080C7896:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C789C: .4byte 0x00004001
	thumb_func_end sub_80C77A0

	thumb_func_start sub_80C78A0
sub_80C78A0: @ 80C78A0
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080C78F4 @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	movs r0, 0x8C
	movs r2, 0x70
	movs r3, 0x50
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C78F8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080C78FC @ =0x000040b4
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _080C7900
	movs r0, 0x4
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	b _080C7912
	.align 2, 0
_080C78F4: .4byte SpriteCallbackDummy
_080C78F8: .4byte gSprites
_080C78FC: .4byte 0x000040b4
_080C7900:
	movs r0, 0x3
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_080C7912:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C78A0

	thumb_func_start sub_80C791C
sub_80C791C: @ 80C791C
	push {lr}
	bl sub_80C78A0
	ldr r2, _080C794C @ =gMapObjects
	ldr r0, _080C7950 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl pal_fill_black
	ldr r0, _080C7954 @ =sub_80C77A0
	movs r1, 0x50
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_080C794C: .4byte gMapObjects
_080C7950: .4byte gPlayerAvatar
_080C7954: .4byte sub_80C77A0
	thumb_func_end sub_80C791C

	thumb_func_start sub_80C7958
sub_80C7958: @ 80C7958
	push {lr}
	ldr r0, _080C7990 @ =0x0000082d
	bl FlagSet
	ldr r0, _080C7994 @ =0x00004001
	bl FlagSet
	movs r0, 0x80
	lsls r0, 7
	bl FlagSet
	ldr r0, _080C7998 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	movs r2, 0x5
	ldrsb r2, [r0, r2]
	movs r3, 0x1
	negs r3, r3
	movs r0, 0
	bl saved_warp2_set
	bl sub_80C7754
	bl sub_8080F9C
	pop {r0}
	bx r0
	.align 2, 0
_080C7990: .4byte 0x0000082d
_080C7994: .4byte 0x00004001
_080C7998: .4byte gSaveBlock1
	thumb_func_end sub_80C7958

	.align 2, 0 @ Don't pad with nop.
