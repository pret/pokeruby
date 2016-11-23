	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_805A000
sub_805A000: @ 805A000
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	ldr r5, _0805A064 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r5, 0x6]
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A05C
	movs r0, 0xA
	bl PlaySE
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806084C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0805A05C
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldr r0, _0805A068 @ =sub_8059FB4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A05C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A064: .4byte gPlayerAvatar
_0805A068: .4byte sub_8059FB4
	thumb_func_end sub_805A000

	thumb_func_start sub_805A06C
sub_805A06C: @ 805A06C
	push {r4,lr}
	ldr r4, _0805A088 @ =sub_805A08C
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A088: .4byte sub_805A08C
	thumb_func_end sub_805A06C

	thumb_func_start sub_805A08C
sub_805A08C: @ 805A08C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A0C8 @ =gUnknown_0830FC98
	ldr r2, _0805A0CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A09E:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _0805A0D0 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805A0D4 @ =gMapObjects
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _0805A09E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A0C8: .4byte gUnknown_0830FC98
_0805A0CC: .4byte gTasks
_0805A0D0: .4byte gPlayerAvatar
_0805A0D4: .4byte gMapObjects
	thumb_func_end sub_805A08C

	thumb_func_start sub_805A0D8
sub_805A0D8: @ 805A0D8
	push {lr}
	ldrh r2, [r0, 0x8]
	adds r2, 0x1
	strh r2, [r0, 0x8]
	ldrb r1, [r1, 0x18]
	lsrs r1, 4
	strh r1, [r0, 0xA]
	ldr r1, _0805A0FC @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	bl ScriptContext2_Enable
	movs r0, 0x2D
	bl PlaySE
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0805A0FC: .4byte gPlayerAvatar
	thumb_func_end sub_805A0D8

	thumb_func_start sub_805A100
sub_805A100: @ 805A100
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805A174 @ =gUnknown_0830FCA8
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A168
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	subs r0, 0x1
	add r0, sp
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r4, 0xA]
	cmp r6, r0
	bne _0805A146
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805A146:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _0805A168
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0805A168
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805A168:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A174: .4byte gUnknown_0830FCA8
	thumb_func_end sub_805A100

	thumb_func_start sub_805A178
sub_805A178: @ 805A178
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _0805A1B4 @ =gUnknown_0830FCAC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A1A8
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x1
	strh r0, [r5, 0x8]
_0805A1A8:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A1B4: .4byte gUnknown_0830FCAC
	thumb_func_end sub_805A178

	thumb_func_start sub_805A1B8
sub_805A1B8: @ 805A1B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A1FC
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	bl ScriptContext2_Disable
	ldr r1, _0805A204 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	ldr r0, _0805A208 @ =sub_805A08C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A1FC:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A204: .4byte gPlayerAvatar
_0805A208: .4byte sub_805A08C
	thumb_func_end sub_805A1B8

	thumb_func_start sub_805A20C
sub_805A20C: @ 805A20C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	bl sav1_reset_battle_music_maybe
	bl sub_8053F84
	ldr r2, _0805A258 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x6]
	ldr r5, _0805A25C @ =taskFF_0805D1D4
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A260 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A258: .4byte gPlayerAvatar
_0805A25C: .4byte taskFF_0805D1D4
_0805A260: .4byte gTasks
	thumb_func_end sub_805A20C

	thumb_func_start taskFF_0805D1D4
taskFF_0805D1D4: @ 805A264
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0805A2C0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A2C4 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0805A290
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A2B8
_0805A290:
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_8127ED0
	ldr r0, _0805A2C8 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_80608D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldr r0, _0805A2CC @ =sub_805A2D0
	str r0, [r4]
_0805A2B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A2C0: .4byte gPlayerAvatar
_0805A2C4: .4byte gMapObjects
_0805A2C8: .4byte gTasks
_0805A2CC: .4byte sub_805A2D0
	thumb_func_end taskFF_0805D1D4

	thumb_func_start sub_805A2D0
sub_805A2D0: @ 805A2D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0805A33C @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A340 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A336
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0
	strb r0, [r6, 0x6]
	bl ScriptContext2_Disable
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A344 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyTask
_0805A336:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A33C: .4byte gPlayerAvatar
_0805A340: .4byte gMapObjects
_0805A344: .4byte gSprites
	thumb_func_end sub_805A2D0

	thumb_func_start StartFishing
StartFishing: @ 805A348
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0805A374 @ =sub_805A37C
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A378 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x26]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A374: .4byte sub_805A37C
_0805A378: .4byte gTasks
	thumb_func_end StartFishing

	thumb_func_start sub_805A37C
sub_805A37C: @ 805A37C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A3AC @ =gUnknown_0830FCB4
	ldr r2, _0805A3B0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A38E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0805A38E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A3AC: .4byte gUnknown_0830FCB4
_0805A3B0: .4byte gTasks
	thumb_func_end sub_805A37C

	thumb_func_start sub_805A3B4
sub_805A3B4: @ 805A3B4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0805A3D0 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A3D0: .4byte gPlayerAvatar
	thumb_func_end sub_805A3B4

	thumb_func_start fish1
fish1: @ 805A3D4
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	ldr r1, _0805A45C @ =gUnknown_0830FCF4
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _0805A460 @ =gUnknown_0830FCFA
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r5, 0x20]
	bl Random
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	lsls r1, 1
	mov r2, sp
	adds r6, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r6]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldr r3, _0805A464 @ =gMapObjects
	ldr r2, _0805A468 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	strh r0, [r5, 0x24]
	ldrb r0, [r2, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r3
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r0, [r4, 0x1]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8059C3C
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A45C: .4byte gUnknown_0830FCF4
_0805A460: .4byte gUnknown_0830FCFA
_0805A464: .4byte gMapObjects
_0805A468: .4byte gPlayerAvatar
	thumb_func_end fish1

	thumb_func_start fish2
fish2: @ 805A46C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _0805A488
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805A488:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish2

	thumb_func_start fish3
fish3: @ 805A490
	push {r4,lr}
	adds r4, r0, 0
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0805A4C4
	adds r0, r1, 0x4
	strh r0, [r4, 0xE]
_0805A4C4:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	ble _0805A4D0
	movs r0, 0xA
	strh r0, [r4, 0xE]
_0805A4D0:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish3

	thumb_func_start fish4
fish4: @ 805A4D8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0805A514 @ =gUnknown_0830FD00
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl sub_805A954
	ldrh r0, [r4, 0xA]
	adds r2, r0, 0x1
	strh r2, [r4, 0xA]
	ldr r0, _0805A518 @ =gMain
	ldrh r0, [r0, 0x2E]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805A51C
	movs r0, 0xB
	strh r0, [r4, 0x8]
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0805A50E
	movs r0, 0xC
	strh r0, [r4, 0x8]
_0805A50E:
	movs r0, 0x1
	b _0805A564
	.align 2, 0
_0805A514: .4byte gUnknown_0830FD00
_0805A518: .4byte gMain
_0805A51C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0805A562
	strh r1, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _0805A54E
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	ldrh r2, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0805A548
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0805A548:
	adds r0, r2, 0x1
	strh r0, [r4, 0x20]
	b _0805A562
_0805A54E:
	adds r1, r2, 0x4
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	movs r2, 0xF
	bl MenuPrint
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805A562:
	movs r0, 0
_0805A564:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish4

	thumb_func_start party_menu_update_status_condition_object
party_menu_update_status_condition_object: @ 805A56C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl GetFishingWildMonListHeader
	lsls r0, 24
	cmp r0, 0
	beq _0805A590
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805A596
_0805A590:
	movs r0, 0xB
	strh r0, [r4, 0x8]
	b _0805A5BC
_0805A596:
	ldr r0, _0805A5C4 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A5C8 @ =gSprites
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FE08
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805A5BC:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A5C4: .4byte gPlayerAvatar
_0805A5C8: .4byte gSprites
	thumb_func_end party_menu_update_status_condition_object

	thumb_func_start sub_805A5CC
sub_805A5CC: @ 805A5CC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldr r0, _0805A5F0 @ =gOtherText_OhABite
	movs r1, 0x4
	movs r2, 0x11
	bl MenuPrint
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A5F0: .4byte gOtherText_OhABite
	thumb_func_end sub_805A5CC

	thumb_func_start fish7
fish7: @ 805A5F4
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _0805A628 @ =gUnknown_0830FD02
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	bl sub_805A954
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0805A62C
	movs r0, 0xC
	b _0805A63C
	.align 2, 0
_0805A628: .4byte gUnknown_0830FD02
_0805A62C:
	ldr r0, _0805A648 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805A63E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
_0805A63C:
	strh r0, [r4, 0x8]
_0805A63E:
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A648: .4byte gMain
	thumb_func_end fish7

	thumb_func_start fish8
fish8: @ 805A64C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _0805A6B0 @ =gUnknown_0830FD08
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	bl sub_805A954
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805A6A2
	cmp r1, 0x1
	bgt _0805A6A6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	movs r3, 0x20
	ldrsh r2, [r4, r3]
	lsls r2, 1
	movs r3, 0x26
	ldrsh r1, [r4, r3]
	lsls r1, 2
	adds r2, r1
	mov r3, sp
	adds r1, r3, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805A6A6
_0805A6A2:
	movs r0, 0x3
	strh r0, [r4, 0x8]
_0805A6A6:
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A6B0: .4byte gUnknown_0830FD08
	thumb_func_end fish8

	thumb_func_start sub_805A6B4
sub_805A6B4: @ 805A6B4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldr r0, _0805A6D8 @ =gOtherText_PokeOnHook
	bl sub_8072044
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A6D8: .4byte gOtherText_PokeOnHook
	thumb_func_end sub_805A6B4

	thumb_func_start sub_805A6DC
sub_805A6DC: @ 805A6DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805A780
	bl sub_805A954
	movs r0, 0xA
	ldrsh r6, [r5, r0]
	cmp r6, 0
	bne _0805A780
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805A778
	ldr r7, _0805A76C @ =gPlayerAvatar
	ldrb r0, [r7, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r1, _0805A770 @ =gMapObjects
	mov r8, r1
	add r4, r8
	ldrh r1, [r5, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	ldrb r1, [r7]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805A746
	ldrb r0, [r7, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_8127F28
_0805A746:
	ldr r2, _0805A774 @ =gSprites
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x24]
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x26]
	bl MenuZeroFillScreen
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _0805A7A8
	.align 2, 0
_0805A76C: .4byte gPlayerAvatar
_0805A770: .4byte gMapObjects
_0805A774: .4byte gSprites
_0805A778:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0805A7A8
_0805A780:
	ldr r1, _0805A7B4 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	ldrh r0, [r5, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl FishingWildEncounter
	movs r0, 0x1
	bl sub_80BE97C
	ldr r0, _0805A7B8 @ =sub_805A37C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A7A8:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805A7B4: .4byte gPlayerAvatar
_0805A7B8: .4byte sub_805A37C
	thumb_func_end sub_805A6DC

	thumb_func_start sub_805A7BC
sub_805A7BC: @ 805A7BC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_805A954
	ldr r0, _0805A7FC @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A800 @ =gSprites
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FDF8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0805A804 @ =gOtherText_NotEvenANibble
	bl sub_8072044
	movs r0, 0xD
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A7FC: .4byte gPlayerAvatar
_0805A800: .4byte gSprites
_0805A804: .4byte gOtherText_NotEvenANibble
	thumb_func_end sub_805A7BC

	thumb_func_start sub_805A808
sub_805A808: @ 805A808
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_805A954
	ldr r0, _0805A84C @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A850 @ =gSprites
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FDF8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0805A854 @ =gOtherText_ItGotAway
	bl sub_8072044
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A84C: .4byte gPlayerAvatar
_0805A850: .4byte gSprites
_0805A854: .4byte gOtherText_ItGotAway
	thumb_func_end sub_805A808

	thumb_func_start fishD
fishD: @ 805A858
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fishD

	thumb_func_start sub_805A874
sub_805A874: @ 805A874
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	bl sub_805A954
	ldr r7, _0805A908 @ =gSprites
	ldr r5, _0805A90C @ =gPlayerAvatar
	ldrb r0, [r5, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3F
	ldrb r0, [r1]
	lsls r0, 27
	cmp r0, 0
	bge _0805A8FA
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A910 @ =gMapObjects
	mov r8, r0
	add r4, r8
	ldrh r1, [r6, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805A8DA
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_8127F28
_0805A8DA:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r2, 0
	strh r2, [r0, 0x24]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0805A8FA:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805A908: .4byte gSprites
_0805A90C: .4byte gPlayerAvatar
_0805A910: .4byte gMapObjects
	thumb_func_end sub_805A874

	thumb_func_start fishF
fishF: @ 805A914
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805A946
	ldr r1, _0805A94C @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl sub_806451C
	bl MenuZeroFillScreen
	movs r0, 0
	bl sub_80BE97C
	ldr r0, _0805A950 @ =sub_805A37C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A946:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0805A94C: .4byte gPlayerAvatar
_0805A950: .4byte sub_805A37C
	thumb_func_end fishF

	thumb_func_start sub_805A954
sub_805A954: @ 805A954
	push {r4-r7,lr}
	ldr r0, _0805AA40 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805AA44 @ =gSprites
	adds r4, r0, r1
	adds r0, r4, 0
	bl AnimateSprite
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r5, [r0]
	movs r0, 0x2A
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r5, 2
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r7, 0x1
	negs r7, r7
	cmp r0, r7
	beq _0805A9C6
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r1, r12
	ldrb r0, [r1]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0805A9CC
_0805A9C6:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805A9CC:
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrb r5, [r0]
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0805A9FE
	movs r0, 0x8
	strh r0, [r4, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805A9FE
	ldr r0, _0805AA48 @ =0x0000fff8
	strh r0, [r4, 0x24]
_0805A9FE:
	cmp r5, 0x5
	bne _0805AA06
	ldr r0, _0805AA48 @ =0x0000fff8
	strh r0, [r4, 0x26]
_0805AA06:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0805AA16
	movs r0, 0x8
	strh r0, [r4, 0x26]
_0805AA16:
	ldr r3, _0805AA40 @ =gPlayerAvatar
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805AA3A
	ldr r2, _0805AA4C @ =gMapObjects
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1A]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0x1
	bl sub_8127F28
_0805AA3A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA40: .4byte gPlayerAvatar
_0805AA44: .4byte gSprites
_0805AA48: .4byte 0x0000fff8
_0805AA4C: .4byte gMapObjects
	thumb_func_end sub_805A954

	.align 2, 0 @ Don't pad with nop.
