	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

.equiv ewram_1f000, 0x0201f000

	thumb_func_start sub_8100930
sub_8100930: @ 8100930
	push {r4,r5,lr}
	lsls r0, 24
	ldr r3, _08100998 @ =gUnknown_020391AC
	movs r1, 0
	strb r1, [r3]
	ldrb r2, [r3, 0x1]
	subs r1, 0x4
	ands r1, r2
	movs r4, 0xD
	negs r4, r4
	ands r1, r4
	movs r2, 0x11
	negs r2, r2
	ands r1, r2
	subs r2, 0x10
	ands r1, r2
	strb r1, [r3, 0x1]
	ldr r1, _0810099C @ =gUnknown_083EC900
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0]
	movs r5, 0x3F
	lsls r1, 6
	strb r1, [r3, 0x1]
	ldrh r2, [r3, 0x2]
	ldr r1, _081009A0 @ =0xfffffe00
	ands r1, r2
	strh r1, [r3, 0x2]
	ldrb r2, [r3, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	strb r1, [r3, 0x3]
	ldrb r0, [r0, 0x1]
	lsls r0, 6
	ands r5, r1
	orrs r5, r0
	strb r5, [r3, 0x3]
	ldrh r1, [r3, 0x4]
	ldr r0, _081009A4 @ =0xfffffc00
	ands r0, r1
	strh r0, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	ands r4, r0
	movs r0, 0x4
	orrs r4, r0
	movs r0, 0xF
	ands r4, r0
	strb r4, [r3, 0x5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100998: .4byte gUnknown_020391AC
_0810099C: .4byte gUnknown_083EC900
_081009A0: .4byte 0xfffffe00
_081009A4: .4byte 0xfffffc00
	thumb_func_end sub_8100930

	thumb_func_start sub_81009A8
sub_81009A8: @ 81009A8
	movs r1, 0
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	strh r1, [r0, 0x3A]
	strh r1, [r0, 0x3C]
	ldr r1, _081009BC @ =sub_81009C0
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_081009BC: .4byte sub_81009C0
	thumb_func_end sub_81009A8

	thumb_func_start sub_81009C0
sub_81009C0: @ 81009C0
	push {lr}
	adds r2, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _081009FA
	movs r1, 0x3A
	ldrsh r0, [r2, r1]
	cmp r0, 0xE
	bgt _081009E2
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	b _081009EC
_081009E2:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
_081009EC:
	strb r0, [r3]
	ldrh r0, [r2, 0x3A]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r2, 0x3A]
	b _08100A06
_081009FA:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08100A06:
	pop {r0}
	bx r0
	thumb_func_end sub_81009C0

	thumb_func_start sub_8100A0C
sub_8100A0C: @ 8100A0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8100D38
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08100A44
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08100A3C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _08100A40 @ =sub_8100E70
	str r1, [r0]
	b _08100A50
	.align 2, 0
_08100A3C: .4byte gTasks
_08100A40: .4byte sub_8100E70
_08100A44:
	ldr r1, _08100A58 @ =gSecretBaseText_NoDecorInUse
	ldr r2, _08100A5C @ =sub_80FE428
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_08100A50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100A58: .4byte gSecretBaseText_NoDecorInUse
_08100A5C: .4byte sub_80FE428
	thumb_func_end sub_8100A0C

	thumb_func_start sub_8100A60
sub_8100A60: @ 8100A60
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08100A78 @ =ewram_1f000
	ldr r1, [r3]
	adds r1, r0
	movs r2, 0
	strb r2, [r1]
	ldr r1, [r3, 0x4]
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_08100A78: .4byte ewram_1f000
	thumb_func_end sub_8100A60

	thumb_func_start sub_8100A7C
sub_8100A7C: @ 8100A7C
	push {r4-r6,lr}
	ldr r6, _08100A9C @ =gSpecialVar_0x8005
	movs r0, 0
	strh r0, [r6]
	ldr r2, _08100AA0 @ =gScriptResult
	strh r0, [r2]
	ldr r4, _08100AA4 @ =gSpecialVar_0x8004
	ldr r1, _08100AA8 @ =gUnknown_02039234
	ldrh r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08100AB8
	movs r0, 0x1
	strh r0, [r2]
	b _08100B0A
	.align 2, 0
_08100A9C: .4byte gSpecialVar_0x8005
_08100AA0: .4byte gScriptResult
_08100AA4: .4byte gSpecialVar_0x8004
_08100AA8: .4byte gUnknown_02039234
_08100AAC:
	ldr r1, _08100AB4 @ =gSpecialVar_0x8006
	ldrb r0, [r2]
	strh r0, [r1]
	b _08100B0A
	.align 2, 0
_08100AB4: .4byte gSpecialVar_0x8006
_08100AB8:
	ldr r3, _08100B10 @ =gDecorations
	ldr r2, _08100B14 @ =ewram_1f000
	ldr r1, _08100B18 @ =gUnknown_020391B4
	ldrh r0, [r4]
	lsls r0, 3
	adds r4, r0, r1
	ldrb r1, [r4]
	ldr r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 5
	adds r0, r3
	ldrb r0, [r0, 0x11]
	cmp r0, 0x4
	bne _08100B0A
	ldrh r0, [r4, 0x4]
	strh r0, [r6]
	ldrb r0, [r4]
	bl sub_8100A60
	movs r1, 0
	ldr r0, _08100B1C @ =gMapHeader
	ldr r0, [r0, 0x4]
	ldrb r2, [r0]
	cmp r1, r2
	bcs _08100B0A
	ldr r5, [r0, 0x4]
	ldrh r4, [r6]
	adds r3, r2, 0
_08100AF2:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, r0, r5
	ldrh r0, [r2, 0x14]
	cmp r0, r4
	beq _08100AAC
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bcc _08100AF2
_08100B0A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100B10: .4byte gDecorations
_08100B14: .4byte ewram_1f000
_08100B18: .4byte gUnknown_020391B4
_08100B1C: .4byte gMapHeader
	thumb_func_end sub_8100A7C

	thumb_func_start sub_8100B20
sub_8100B20: @ 8100B20
	push {r4-r6,lr}
	movs r2, 0
	ldr r0, _08100B4C @ =gMapHeader
	ldr r0, [r0, 0x4]
	ldrb r1, [r0]
	cmp r2, r1
	bcs _08100B64
	adds r3, r0, 0
	ldr r5, [r3, 0x4]
	ldr r0, _08100B50 @ =gSpecialVar_0x8004
	ldrh r4, [r0]
	ldr r6, _08100B54 @ =gSpecialVar_0x8005
_08100B38:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r5
	ldrh r0, [r1, 0x14]
	cmp r0, r4
	bne _08100B58
	ldrb r0, [r1]
	strh r0, [r6]
	b _08100B64
	.align 2, 0
_08100B4C: .4byte gMapHeader
_08100B50: .4byte gSpecialVar_0x8004
_08100B54: .4byte gSpecialVar_0x8005
_08100B58:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3]
	cmp r2, r0
	bcc _08100B38
_08100B64:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8100B20

	thumb_func_start sub_8100B6C
sub_8100B6C: @ 8100B6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r7, 0
	b _08100C64
_08100B7C:
	lsls r3, r7, 3
	ldr r0, _08100BE0 @ =gUnknown_020391B4
	adds r4, r3, r0
	ldrb r1, [r4]
	ldr r2, _08100BE4 @ =ewram_1f000
	ldr r0, [r2]
	adds r0, r1
	ldrb r6, [r0]
	lsls r0, r6, 5
	ldr r5, _08100BE8 @ =gDecorations
	adds r0, r5
	ldrb r2, [r0, 0x11]
	ldr r5, _08100BE4 @ =ewram_1f000
	ldr r0, [r5, 0x4]
	adds r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, 4
	mov r9, r1
	movs r5, 0xF
	mov r10, r5
	mov r1, r10
	ands r1, r0
	mov r10, r1
	adds r5, r3, 0
	adds r3, r7, 0x1
	str r3, [sp]
	cmp r2, 0x4
	beq _08100C5E
	cmp r6, 0x29
	bne _08100BD0
	mov r0, r9
	adds r0, 0x7
	adds r1, 0x7
	bl MapGridGetMetatileIdAt
	movs r1, 0xA3
	lsls r1, 2
	cmp r0, r1
	bne _08100BD0
	ldrb r0, [r4, 0x2]
	adds r0, 0x1
	strb r0, [r4, 0x2]
_08100BD0:
	movs r6, 0
	ldr r1, _08100BE0 @ =gUnknown_020391B4
	adds r2, r5, 0
	adds r0, r5, r1
	adds r3, r7, 0x1
	str r3, [sp]
	b _08100C4E
	.align 2, 0
_08100BE0: .4byte gUnknown_020391B4
_08100BE4: .4byte ewram_1f000
_08100BE8: .4byte gDecorations
_08100BEC:
	movs r4, 0
	adds r0, r2, r1
	adds r7, r6, 0x1
	str r7, [sp, 0x4]
	ldrb r0, [r0, 0x1]
	cmp r4, r0
	bcs _08100C42
	ldr r0, _08100C7C @ =gUnknown_020391B4
	adds r0, r5
	mov r8, r0
	subs r1, r6, 0x7
	str r1, [sp, 0x8]
_08100C04:
	adds r0, r4, 0x7
	add r0, r9
	ldr r1, _08100C80 @ =gMapHeader
	ldr r3, [r1]
	mov r7, r10
	subs r2, r7, r6
	ldr r1, [r3]
	muls r2, r1
	mov r7, r9
	adds r1, r7, r4
	adds r1, r2
	ldr r2, [r3, 0xC]
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	movs r3, 0xC0
	lsls r3, 6
	adds r2, r3, 0
	orrs r2, r1
	mov r7, r10
	ldr r3, [sp, 0x8]
	subs r1, r7, r3
	bl MapGridSetMetatileEntryAt
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r7, r8
	ldrb r7, [r7, 0x1]
	cmp r4, r7
	bcc _08100C04
_08100C42:
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r1, _08100C7C @ =gUnknown_020391B4
	adds r2, r5, 0
	adds r0, r5, r1
_08100C4E:
	ldrb r0, [r0, 0x2]
	cmp r6, r0
	bcc _08100BEC
	ldr r2, _08100C7C @ =gUnknown_020391B4
	adds r0, r5, r2
	ldrb r0, [r0]
	bl sub_8100A60
_08100C5E:
	ldr r3, [sp]
	lsls r0, r3, 24
	lsrs r7, r0, 24
_08100C64:
	ldr r0, _08100C84 @ =gUnknown_02039234
	ldrb r0, [r0]
	cmp r7, r0
	bcc _08100B7C
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08100C7C: .4byte gUnknown_020391B4
_08100C80: .4byte gMapHeader
_08100C84: .4byte gUnknown_02039234
	thumb_func_end sub_8100B6C

	thumb_func_start sub_8100C88
sub_8100C88: @ 8100C88
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08100CAC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08100CC4
	cmp r0, 0x1
	bgt _08100CB0
	cmp r0, 0
	beq _08100CBA
	b _08100D24
	.align 2, 0
_08100CAC: .4byte gTasks
_08100CB0:
	cmp r0, 0x2
	beq _08100CF4
	cmp r0, 0x3
	beq _08100D08
	b _08100D24
_08100CBA:
	bl sub_8100B6C
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _08100D24
_08100CC4:
	ldr r0, _08100CEC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08100D24
	bl DrawWholeMapView
	ldr r0, _08100CF0 @ =gUnknown_081A2F8A
	bl ScriptContext1_SetupScript
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x2
	strh r0, [r5, 0xC]
	b _08100D24
	.align 2, 0
_08100CEC: .4byte gPaletteFade
_08100CF0: .4byte gUnknown_081A2F8A
_08100CF4:
	bl ScriptContext2_Enable
	adds r0, r4, 0
	bl sub_80FED90
	bl pal_fill_black
	movs r0, 0x3
	strh r0, [r5, 0xC]
	b _08100D24
_08100D08:
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08100D24
	ldr r0, _08100D2C @ =0x0000ffff
	strh r0, [r5, 0x22]
	ldr r1, _08100D30 @ =gSecretBaseText_DecorReturned
	ldr r2, _08100D34 @ =sub_81010F0
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_08100D24:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100D2C: .4byte 0x0000ffff
_08100D30: .4byte gSecretBaseText_DecorReturned
_08100D34: .4byte sub_81010F0
	thumb_func_end sub_8100C88

	thumb_func_start sub_8100D38
sub_8100D38: @ 8100D38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r0, _08100D68 @ =ewram_1f000
	adds r4, r0, 0
	ldrb r0, [r4, 0x8]
	cmp r2, r0
	bcs _08100D7C
	adds r5, r4, 0
	ldr r1, _08100D6C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r1
_08100D56:
	ldr r0, [r5]
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08100D70
	strh r2, [r1, 0x22]
	movs r0, 0x1
	b _08100D7E
	.align 2, 0
_08100D68: .4byte ewram_1f000
_08100D6C: .4byte gTasks
_08100D70:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r0, [r4, 0x8]
	cmp r2, r0
	bcc _08100D56
_08100D7C:
	movs r0, 0
_08100D7E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8100D38

	thumb_func_start SetUpPuttingAwayDecorationPlayerAvatar
SetUpPuttingAwayDecorationPlayerAvatar: @ 8100D84
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	bl player_get_direction_lower_nybble
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r3, _08100DD8 @ =gUnknown_020391A8
	ldr r2, _08100DDC @ =gSprites
	ldr r4, _08100DE0 @ =gUnknown_03004880
	ldr r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strb r0, [r3]
	bl sub_81016C8
	ldr r0, _08100DE4 @ =gSpriteTemplate_83ECA88
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	str r0, [r4, 0x4]
	ldr r0, _08100DE8 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08100DF0
	ldr r1, _08100DEC @ =SpriteCallbackDummy
	str r0, [sp]
	movs r0, 0xC1
	b _08100DF8
	.align 2, 0
_08100DD8: .4byte gUnknown_020391A8
_08100DDC: .4byte gSprites
_08100DE0: .4byte gUnknown_03004880
_08100DE4: .4byte gSpriteTemplate_83ECA88
_08100DE8: .4byte gSaveBlock2
_08100DEC: .4byte SpriteCallbackDummy
_08100DF0:
	ldr r1, _08100E5C @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC2
_08100DF8:
	movs r2, 0x88
	movs r3, 0x48
	bl AddPseudoFieldObject
	ldr r1, _08100E60 @ =gUnknown_020391A9
	strb r0, [r1]
	ldr r6, _08100E64 @ =gSprites
	ldr r0, _08100E60 @ =gUnknown_020391A9
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x4
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r5, _08100E68 @ =gUnknown_020391A8
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	ldr r0, _08100E6C @ =gUnknown_03004880
	ldr r0, [r0, 0x4]
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x5]
	ands r4, r1
	mov r1, r8
	orrs r4, r1
	strb r4, [r0, 0x5]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100E5C: .4byte SpriteCallbackDummy
_08100E60: .4byte gUnknown_020391A9
_08100E64: .4byte gSprites
_08100E68: .4byte gUnknown_020391A8
_08100E6C: .4byte gUnknown_03004880
	thumb_func_end SetUpPuttingAwayDecorationPlayerAvatar

	thumb_func_start sub_8100E70
sub_8100E70: @ 8100E70
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08100E94 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08100EC4
	cmp r0, 0x1
	bgt _08100E98
	cmp r0, 0
	beq _08100E9E
	b _08100EE6
	.align 2, 0
_08100E94: .4byte gTasks + 0x8
_08100E98:
	cmp r0, 0x2
	beq _08100ED2
	b _08100EE6
_08100E9E:
	ldr r0, _08100EC0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08100EE6
	adds r0, r5, 0
	bl sub_80FF0E0
	movs r0, 0x1
	strh r0, [r4, 0x4]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xA]
	bl sub_8072DEC
	b _08100EE6
	.align 2, 0
_08100EC0: .4byte gPaletteFade
_08100EC4:
	bl SetUpPuttingAwayDecorationPlayerAvatar
	bl pal_fill_black
	movs r0, 0x2
	strh r0, [r4, 0x4]
	b _08100EE6
_08100ED2:
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08100EE6
	strh r0, [r4, 0x18]
	adds r0, r5, 0
	bl sub_8100EEC
_08100EE6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8100E70

	thumb_func_start sub_8100EEC
sub_8100EEC: @ 8100EEC
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r4, _08100F70 @ =gSprites
	ldr r3, _08100F74 @ =gUnknown_020391A8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0
	strh r6, [r0, 0x3C]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08100F78 @ =sub_8101698
	str r1, [r0]
	ldr r2, _08100F7C @ =gUnknown_020391A9
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x88
	strh r1, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x48
	strh r1, [r0, 0x22]
	ldr r1, _08100F80 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x1C]
	ldr r1, _08100F84 @ =sub_8100494
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100F70: .4byte gSprites
_08100F74: .4byte gUnknown_020391A8
_08100F78: .4byte sub_8101698
_08100F7C: .4byte gUnknown_020391A9
_08100F80: .4byte gTasks
_08100F84: .4byte sub_8100494
	thumb_func_end sub_8100EEC

	thumb_func_start sub_8100F88
sub_8100F88: @ 8100F88
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08100FB0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	bl sub_810045C
	adds r0, r4, 0
	bl sub_8101024
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100FB0: .4byte gTasks
	thumb_func_end sub_8100F88

	thumb_func_start sub_8100FB4
sub_8100FB4: @ 8100FB4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0810100C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	bl sub_810045C
	ldr r3, _08101010 @ =gSprites
	ldr r5, _08101014 @ =gUnknown_020391A8
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _08101018 @ =SpriteCallbackDummy
	str r1, [r0]
	ldr r1, _0810101C @ =gSecretBaseText_StopPuttingAwayDecor
	ldr r2, _08101020 @ =sub_810156C
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810100C: .4byte gTasks
_08101010: .4byte gSprites
_08101014: .4byte gUnknown_020391A8
_08101018: .4byte SpriteCallbackDummy
_0810101C: .4byte gSecretBaseText_StopPuttingAwayDecor
_08101020: .4byte sub_810156C
	thumb_func_end sub_8100FB4

	thumb_func_start sub_8101024
sub_8101024: @ 8101024
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8101460
	ldr r0, _08101040 @ =gUnknown_02039234
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810104C
	ldr r1, _08101044 @ =gSecretBaseText_ReturnDecor
	ldr r2, _08101048 @ =sub_8101518
	b _081010B0
	.align 2, 0
_08101040: .4byte gUnknown_02039234
_08101044: .4byte gSecretBaseText_ReturnDecor
_08101048: .4byte sub_8101518
_0810104C:
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	ldr r0, _081010BC @ =gTasks + 0x8
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSecretBasePC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08101082
	adds r0, r4, 0
	bl sub_805738C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081010D4
_08101082:
	ldr r3, _081010C0 @ =gSprites
	ldr r4, _081010C4 @ =gUnknown_020391A8
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _081010C8 @ =SpriteCallbackDummy
	str r1, [r0]
	ldr r1, _081010CC @ =gSecretBaseText_StopPuttingAwayDecor
	ldr r2, _081010D0 @ =sub_810156C
_081010B0:
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _081010E0
	.align 2, 0
_081010BC: .4byte gTasks + 0x8
_081010C0: .4byte gSprites
_081010C4: .4byte gUnknown_020391A8
_081010C8: .4byte SpriteCallbackDummy
_081010CC: .4byte gSecretBaseText_StopPuttingAwayDecor
_081010D0: .4byte sub_810156C
_081010D4:
	ldr r1, _081010E8 @ =gSecretBaseText_NoDecor
	ldr r2, _081010EC @ =sub_81010F0
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_081010E0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081010E8: .4byte gSecretBaseText_NoDecor
_081010EC: .4byte sub_81010F0
	thumb_func_end sub_8101024

	thumb_func_start sub_81010F0
sub_81010F0: @ 81010F0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08101114 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810110A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08101110
_0810110A:
	adds r0, r2, 0
	bl sub_8100EEC
_08101110:
	pop {r0}
	bx r0
	.align 2, 0
_08101114: .4byte gMain
	thumb_func_end sub_81010F0

	thumb_func_start sub_8101118
sub_8101118: @ 8101118
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	ldr r1, _08101130 @ =gDecorations
	lsrs r0, 19
	adds r0, r1
	ldrb r1, [r0, 0x12]
	cmp r1, 0
	bne _08101134
	movs r0, 0x1
	strb r0, [r2, 0x1]
	b _08101192
	.align 2, 0
_08101130: .4byte gDecorations
_08101134:
	cmp r1, 0x1
	bne _08101140
	movs r0, 0x2
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	b _08101194
_08101140:
	cmp r1, 0x2
	bne _0810114C
	movs r0, 0x3
	strb r0, [r2, 0x1]
	movs r0, 0x1
	b _08101192
_0810114C:
	cmp r1, 0x3
	bne _08101154
	movs r0, 0x4
	b _0810118E
_08101154:
	cmp r1, 0x4
	bne _0810115E
	movs r0, 0x2
	strb r0, [r2, 0x1]
	b _08101192
_0810115E:
	cmp r1, 0x5
	bne _08101166
	movs r0, 0x1
	b _0810118E
_08101166:
	cmp r1, 0x6
	bne _08101172
	movs r0, 0x1
	strb r0, [r2, 0x1]
	movs r0, 0x3
	b _08101192
_08101172:
	cmp r1, 0x7
	bne _0810117E
	movs r0, 0x2
	strb r0, [r2, 0x1]
	movs r0, 0x4
	b _08101192
_0810117E:
	cmp r1, 0x8
	bne _08101188
	movs r0, 0x3
	strb r0, [r2, 0x1]
	b _08101192
_08101188:
	cmp r1, 0x9
	bne _08101194
	movs r0, 0x3
_0810118E:
	strb r0, [r2, 0x1]
	movs r0, 0x2
_08101192:
	strb r0, [r2, 0x2]
_08101194:
	pop {r0}
	bx r0
	thumb_func_end sub_8101118

	thumb_func_start sub_8101198
sub_8101198: @ 8101198
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	ldr r5, _081011F0 @ =gSprites
	ldr r6, _081011F4 @ =gUnknown_020391A8
	ldrb r3, [r6]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	adds r2, r5
	adds r2, 0x3E
	ldrb r3, [r2]
	movs r4, 0x4
	orrs r3, r4
	strb r3, [r2]
	ldrb r3, [r6]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	adds r3, r5, 0
	adds r3, 0x1C
	adds r2, r3
	ldr r3, _081011F8 @ =SpriteCallbackDummy
	str r3, [r2]
	ldr r4, _081011FC @ =gUnknown_020391A9
	ldrb r3, [r4]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	adds r2, r5
	lsrs r0, 20
	adds r0, 0x88
	strh r0, [r2, 0x20]
	ldrb r2, [r4]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	lsrs r1, 20
	adds r1, 0x48
	strh r1, [r0, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081011F0: .4byte gSprites
_081011F4: .4byte gUnknown_020391A8
_081011F8: .4byte SpriteCallbackDummy
_081011FC: .4byte gUnknown_020391A9
	thumb_func_end sub_8101198

	thumb_func_start sub_8101200
sub_8101200: @ 8101200
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0810128C @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldrb r0, [r2, 0x8]
	subs r0, 0x7
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r2, 0xA]
	subs r0, 0x7
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _08101290 @ =ewram_1f000
	ldr r0, [r2, 0x4]
	adds r0, r1
	ldrb r0, [r0]
	lsrs r4, r0, 4
	movs r5, 0xF
	ands r5, r0
	ldr r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _0810125A
	adds r0, r4, 0x7
	adds r1, r5, 0x7
	bl MapGridGetMetatileIdAt
	movs r1, 0xA3
	lsls r1, 2
	cmp r0, r1
	bne _0810125A
	ldrb r0, [r6, 0x2]
	subs r0, 0x1
	strb r0, [r6, 0x2]
_0810125A:
	cmp r7, r4
	bcc _08101294
	ldrb r1, [r6, 0x1]
	adds r0, r4, r1
	cmp r7, r0
	bge _08101294
	ldrb r0, [r6, 0x2]
	subs r0, r5, r0
	cmp r8, r0
	ble _08101294
	cmp r8, r5
	bhi _08101294
	subs r0, r7, r4
	adds r0, 0x1
	subs r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	subs r1, r5, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_8101198
	movs r0, 0x1
	b _08101296
	.align 2, 0
_0810128C: .4byte gTasks
_08101290: .4byte ewram_1f000
_08101294:
	movs r0, 0
_08101296:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8101200

	thumb_func_start sub_81012A0
sub_81012A0: @ 81012A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _0810130C @ =ewram_1f000
	ldr r3, _08101310 @ =gUnknown_020391B4
	ldr r0, _08101314 @ =gUnknown_02039234
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r3
	ldrb r1, [r0]
	ldr r0, [r2, 0x4]
	adds r0, r1
	ldrb r0, [r0]
	lsrs r7, r0, 4
	movs r6, 0xF
	ands r6, r0
	movs r5, 0
	ldr r0, _08101318 @ =gSaveBlock1
	mov r8, r0
	mov r9, r3
_081012CA:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldr r2, _0810131C @ =0x00000c24
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, r7
	bne _08101328
	ldr r2, _08101320 @ =0x00000c26
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, r6
	bne _08101328
	ldr r0, _08101324 @ =0x00000c34
	adds r4, r1, r0
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08101328
	ldr r0, _08101314 @ =gUnknown_02039234
	ldrb r0, [r0]
	lsls r0, 3
	add r0, r9
	ldrh r1, [r4]
	strh r1, [r0, 0x4]
	b _08101332
	.align 2, 0
_0810130C: .4byte ewram_1f000
_08101310: .4byte gUnknown_020391B4
_08101314: .4byte gUnknown_02039234
_08101318: .4byte gSaveBlock1
_0810131C: .4byte 0x00000c24
_08101320: .4byte 0x00000c26
_08101324: .4byte 0x00000c34
_08101328:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3F
	bls _081012CA
_08101332:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81012A0

	thumb_func_start sub_8101340
sub_8101340: @ 8101340
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	b _081013A2
_0810134A:
	ldr r0, [r0]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810139C
	ldr r0, _08101390 @ =gDecorations
	ldrb r2, [r1]
	lsls r1, r2, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	bne _0810139C
	ldr r5, _08101394 @ =gUnknown_020391B4
	adds r0, r2, 0
	adds r1, r5, 0
	bl sub_8101118
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r7, 0
	adds r2, r5, 0
	bl sub_8101200
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _0810139C
	strb r6, [r5]
	bl sub_81012A0
	ldr r0, _08101398 @ =gUnknown_02039234
	strb r4, [r0]
	movs r0, 0x1
	b _081013AC
	.align 2, 0
_08101390: .4byte gDecorations
_08101394: .4byte gUnknown_020391B4
_08101398: .4byte gUnknown_02039234
_0810139C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_081013A2:
	ldr r0, _081013B4 @ =ewram_1f000
	ldrb r1, [r0, 0x8]
	cmp r6, r1
	bcc _0810134A
	movs r0, 0
_081013AC:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081013B4: .4byte ewram_1f000
	thumb_func_end sub_8101340

	thumb_func_start sub_81013B8
sub_81013B8: @ 81013B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r4, 0
	ldr r7, _08101450 @ =ewram_1f000
	ldrb r0, [r7, 0x8]
	cmp r4, r0
	bcs _0810143E
	adds r6, r7, 0
	ldr r5, _08101454 @ =gUnknown_02039234
_081013EA:
	ldr r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	ldr r0, [r6, 0x4]
	adds r0, r4
	ldrb r0, [r0]
	lsrs r3, r0, 4
	movs r2, 0xF
	ands r2, r0
	cmp r1, 0
	beq _08101432
	ldr r0, _08101458 @ =gDecorations
	lsls r1, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	bne _08101432
	ldr r0, [sp]
	cmp r0, r3
	bhi _08101432
	cmp r10, r2
	bhi _08101432
	cmp r9, r3
	bcc _08101432
	cmp r8, r2
	bcc _08101432
	ldr r0, _0810145C @ =gUnknown_020391B4
	ldrb r1, [r5]
	lsls r1, 3
	adds r1, r0
	strb r4, [r1]
	bl sub_81012A0
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_08101432:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r7, 0x8]
	cmp r4, r0
	bcc _081013EA
_0810143E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101450: .4byte ewram_1f000
_08101454: .4byte gUnknown_02039234
_08101458: .4byte gDecorations
_0810145C: .4byte gUnknown_020391B4
	thumb_func_end sub_81013B8

	thumb_func_start sub_8101460
sub_8101460: @ 8101460
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _081014B8 @ =gUnknown_02039234
	movs r0, 0
	strb r0, [r4]
	adds r0, r6, 0
	bl sub_8101340
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08101504
	movs r5, 0
	ldr r0, _081014BC @ =ewram_1f000
	ldrb r1, [r0, 0x8]
	cmp r5, r1
	bcs _081014D2
	adds r7, r4, 0
_08101486:
	ldr r0, [r0]
	adds r0, r5
	ldrb r1, [r0]
	cmp r1, 0
	beq _081014C4
	ldr r4, _081014C0 @ =gUnknown_020391B4
	adds r0, r1, 0
	adds r1, r4, 0
	bl sub_8101118
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8101200
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081014C4
	strb r5, [r4]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _081014D2
	.align 2, 0
_081014B8: .4byte gUnknown_02039234
_081014BC: .4byte ewram_1f000
_081014C0: .4byte gUnknown_020391B4
_081014C4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810150C @ =ewram_1f000
	ldrb r1, [r0, 0x8]
	cmp r5, r1
	bcc _08101486
_081014D2:
	ldr r0, _08101510 @ =gUnknown_02039234
	ldrb r0, [r0]
	cmp r0, 0
	beq _08101504
	ldr r0, _0810150C @ =ewram_1f000
	ldr r2, _08101514 @ =gUnknown_020391B4
	ldrb r1, [r2]
	ldr r0, [r0, 0x4]
	adds r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, 4
	movs r3, 0xF
	ands r3, r1
	ldrb r1, [r2, 0x2]
	subs r1, r3, r1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r2, 0x1]
	adds r2, r0
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	bl sub_81013B8
_08101504:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810150C: .4byte ewram_1f000
_08101510: .4byte gUnknown_02039234
_08101514: .4byte gUnknown_020391B4
	thumb_func_end sub_8101460

	thumb_func_start sub_8101518
sub_8101518: @ 8101518
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08101538 @ =gUnknown_083EC9CC
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101538: .4byte gUnknown_083EC9CC
	thumb_func_end sub_8101518

	thumb_func_start sub_810153C
sub_810153C: @ 810153C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08101564 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _08101568 @ =sub_8100C88
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101564: .4byte gTasks
_08101568: .4byte sub_8100C88
	thumb_func_end sub_810153C

	thumb_func_start sub_810156C
sub_810156C: @ 810156C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0810158C @ =gUnknown_083EC9D4
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810158C: .4byte gUnknown_083EC9D4
	thumb_func_end sub_810156C

	thumb_func_start sub_8101590
sub_8101590: @ 8101590
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_81015B0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101590

	thumb_func_start sub_81015B0
sub_81015B0: @ 81015B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _081015D8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _081015DC @ =sub_81015E0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081015D8: .4byte gTasks
_081015DC: .4byte sub_81015E0
	thumb_func_end sub_81015B0

	thumb_func_start sub_81015E0
sub_81015E0: @ 81015E0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08101600 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08101604
	cmp r0, 0x1
	beq _08101620
	b _08101636
	.align 2, 0
_08101600: .4byte gTasks
_08101604:
	ldr r0, _0810161C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08101636
	adds r0, r4, 0
	bl sub_80FF114
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _08101636
	.align 2, 0
_0810161C: .4byte gPaletteFade
_08101620:
	bl sub_81016F4
	ldr r0, _0810163C @ =gUnknown_0300485C
	ldr r1, _08101640 @ =sub_8101678
	str r1, [r0]
	ldr r0, _08101644 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08101636:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810163C: .4byte gUnknown_0300485C
_08101640: .4byte sub_8101678
_08101644: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_81015E0

	thumb_func_start sub_8101648
sub_8101648: @ 8101648
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08101668
	ldr r0, _08101670 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08101674 @ =Task_DecorationPCProcessMenuInput
	str r0, [r1]
_08101668:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101670: .4byte gTasks
_08101674: .4byte Task_DecorationPCProcessMenuInput
	thumb_func_end sub_8101648

	thumb_func_start sub_8101678
sub_8101678: @ 8101678
	push {lr}
	bl pal_fill_black
	bl MenuDisplayMessageBox
	bl sub_80FE220
	ldr r0, _08101694 @ =sub_8101648
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08101694: .4byte sub_8101648
	thumb_func_end sub_8101678

	thumb_func_start sub_8101698
sub_8101698: @ 8101698
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r2, 0x2E]
	cmp r0, 0xF
	ble _081016B8
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _081016C4
_081016B8:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_081016C4:
	pop {r0}
	bx r0
	thumb_func_end sub_8101698

	thumb_func_start sub_81016C8
sub_81016C8: @ 81016C8
	push {lr}
	ldr r0, _081016DC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _081016E4
	ldr r0, _081016E0 @ =gUnknown_083ECA5C
	bl LoadSpritePalette
	b _081016EA
	.align 2, 0
_081016DC: .4byte gSaveBlock2
_081016E0: .4byte gUnknown_083ECA5C
_081016E4:
	ldr r0, _081016F0 @ =gUnknown_083ECA64
	bl LoadSpritePalette
_081016EA:
	pop {r0}
	bx r0
	.align 2, 0
_081016F0: .4byte gUnknown_083ECA64
	thumb_func_end sub_81016C8

	thumb_func_start sub_81016F4
sub_81016F4: @ 81016F4
	push {lr}
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end sub_81016F4

	thumb_func_start sub_8101700
sub_8101700: @ 8101700
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81341D4
	lsls r0, 24
	cmp r0, 0
	bne _08101728
	ldr r1, _08101720 @ =gSecretBaseText_NoDecors
	ldr r2, _08101724 @ =sub_80FE428
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101742
	.align 2, 0
_08101720: .4byte gSecretBaseText_NoDecors
_08101724: .4byte sub_80FE428
_08101728:
	ldr r1, _08101748 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x1E]
	ldr r0, _0810174C @ =gUnknown_020388F6
	strb r2, [r0]
	adds r0, r4, 0
	bl sub_80FE5AC
_08101742:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101748: .4byte gTasks
_0810174C: .4byte gUnknown_020388F6
	thumb_func_end sub_8101700

	thumb_func_start unref_sub_8101750
unref_sub_8101750: @ 8101750
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81341D4
	lsls r0, 24
	cmp r0, 0
	bne _08101778
	ldr r1, _08101770 @ =gSecretBaseText_NoDecors
	ldr r2, _08101774 @ =sub_80FE428
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101792
	.align 2, 0
_08101770: .4byte gSecretBaseText_NoDecors
_08101774: .4byte sub_80FE428
_08101778:
	ldr r1, _08101798 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x2
	strh r1, [r0, 0x1E]
	ldr r0, _0810179C @ =gUnknown_020388F6
	strb r2, [r0]
	adds r0, r4, 0
	bl sub_80FE5AC
_08101792:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101798: .4byte gTasks
_0810179C: .4byte gUnknown_020388F6
	thumb_func_end unref_sub_8101750

	thumb_func_start sub_81017A0
sub_81017A0: @ 81017A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80FEF74
	bl sub_80FED1C
	bl sub_80FEFA4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08101808
	ldr r0, _081017EC @ =gStringVar1
	ldr r1, _081017F0 @ =gUnknown_020388F5
	ldrb r2, [r1]
	ldr r1, _081017F4 @ =gUnknown_020388D0
	ldr r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 5
	ldr r2, _081017F8 @ =gDecorations + 0x1
	adds r1, r2
	bl StringCopy
	ldr r4, _081017FC @ =gStringVar4
	ldr r1, _08101800 @ =gSecretBaseText_WillBeDiscarded
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _08101804 @ =sub_8101824
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101814
	.align 2, 0
_081017EC: .4byte gStringVar1
_081017F0: .4byte gUnknown_020388F5
_081017F4: .4byte gUnknown_020388D0
_081017F8: .4byte gDecorations + 0x1
_081017FC: .4byte gStringVar4
_08101800: .4byte gSecretBaseText_WillBeDiscarded
_08101804: .4byte sub_8101824
_08101808:
	ldr r1, _0810181C @ =gSecretBaseText_DecorInUse
	ldr r2, _08101820 @ =sub_80FEFF4
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_08101814:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810181C: .4byte gSecretBaseText_DecorInUse
_08101820: .4byte sub_80FEFF4
	thumb_func_end sub_81017A0

	thumb_func_start sub_8101824
sub_8101824: @ 8101824
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08101844 @ =gUnknown_083ECAA0
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101844: .4byte gUnknown_083ECAA0
	thumb_func_end sub_8101824

	thumb_func_start sub_8101848
sub_8101848: @ 8101848
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xE
	bl MenuZeroFillWindowRect
	ldr r6, _08101890 @ =gUnknown_020388F5
	ldrb r1, [r6]
	ldr r5, _08101894 @ =gUnknown_020388D0
	ldr r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8109A30
	ldrb r1, [r6]
	ldr r0, [r5]
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	adds r0, r4, 0
	bl sub_80FF098
	ldr r1, _08101898 @ =gSecretBaseText_DecorThrownAway
	ldr r2, _0810189C @ =sub_80FEFF4
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101890: .4byte gUnknown_020388F5
_08101894: .4byte gUnknown_020388D0
_08101898: .4byte gSecretBaseText_DecorThrownAway
_0810189C: .4byte sub_80FEFF4
	thumb_func_end sub_8101848

	.align 2, 0 @ Don't pad with nop.
