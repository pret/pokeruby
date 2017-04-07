	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start task_mpl_807DD60
task_mpl_807DD60: @ 80809CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r2, _080809F0 @ =gTasks
	adds r4, r0, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08080A06
	cmp r0, 0x1
	bgt _080809F4
	cmp r0, 0
	beq _080809FA
	b _08080A36
	.align 2, 0
_080809F0: .4byte gTasks
_080809F4:
	cmp r0, 0x2
	beq _08080A24
	b _08080A36
_080809FA:
	bl sub_8083664
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	b _08080A1C
_08080A06:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _08080A36
	bl pal_fill_for_map_transition
_08080A1C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080A36
_08080A24:
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080A36
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_08080A36:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807DD60

	thumb_func_start sub_8080A3C
sub_8080A3C: @ 8080A3C
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl palette_bg_fill_black
	ldr r0, _08080A58 @ =task_mpl_807DD60
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080A58: .4byte task_mpl_807DD60
	thumb_func_end sub_8080A3C

	thumb_func_start sub_8080A5C
sub_8080A5C: @ 8080A5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08080A80 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08080A90
	cmp r0, 0x1
	bgt _08080A84
	cmp r0, 0
	beq _08080A8A
	b _08080ABC
	.align 2, 0
_08080A80: .4byte gTasks
_08080A84:
	cmp r0, 0x2
	beq _08080AA6
	b _08080ABC
_08080A8A:
	bl sub_80084A4
	b _08080A9E
_08080A90:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08080ABC
	bl pal_fill_for_map_transition
_08080A9E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080ABC
_08080AA6:
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080ABC
	bl sub_8007B14
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_08080ABC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8080A5C

	thumb_func_start sub_8080AC4
sub_8080AC4: @ 8080AC4
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl palette_bg_fill_black
	ldr r0, _08080AE0 @ =sub_8080A5C
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080AE0: .4byte sub_8080A5C
	thumb_func_end sub_8080AC4

	thumb_func_start sub_8080AE4
sub_8080AE4: @ 8080AE4
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08080B1C
	ldr r1, _08080B18 @ =sub_8080B9C
	b _08080B2E
	.align 2, 0
_08080B18: .4byte sub_8080B9C
_08080B1C:
	adds r0, r4, 0
	bl MetatileBehavior_IsNonAnimDoor
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08080B40 @ =task_map_chg_seq_0807E2CC
	cmp r0, 0x1
	bne _08080B2E
	ldr r1, _08080B44 @ =task_map_chg_seq_0807E20C
_08080B2E:
	adds r0, r1, 0
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080B40: .4byte task_map_chg_seq_0807E2CC
_08080B44: .4byte task_map_chg_seq_0807E20C
	thumb_func_end sub_8080AE4

	thumb_func_start mapldr_default
mapldr_default: @ 8080B48
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_map_transition
	bl sub_8080AE4
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end mapldr_default

	thumb_func_start sub_8080B60
sub_8080B60: @ 8080B60
	push {lr}
	bl sub_8053E90
	bl pal_fill_black
	bl sub_8080AE4
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_8080B60

	thumb_func_start sub_8080B78
sub_8080B78: @ 8080B78
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_map_transition
	movs r0, 0x2E
	bl PlaySE
	ldr r0, _08080B98 @ =task_map_chg_seq_0807E2CC
	movs r1, 0xA
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08080B98: .4byte task_map_chg_seq_0807E2CC
	thumb_func_end sub_8080B78

	thumb_func_start sub_8080B9C
sub_8080B9C: @ 8080B9C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08080BC8 @ =gTasks
	adds r5, r0, r1
	adds r6, r5, 0
	adds r6, 0xC
	adds r7, r5, 0
	adds r7, 0xE
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _08080CAE
	lsls r0, 2
	ldr r1, _08080BCC @ =_08080BD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080BC8: .4byte gTasks
_08080BCC: .4byte _08080BD0
	.align 2, 0
_08080BD0:
	.4byte _08080BE4
	.4byte _08080C08
	.4byte _08080C40
	.4byte _08080C84
	.4byte _08080CA4
_08080BE4:
	movs r0, 0
	bl sub_8080958
	bl FreezeMapObjects
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl FieldSetDoorOpened
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08080CAE
_08080C08:
	bl sub_8080E70
	cmp r0, 0
	beq _08080CAE
	movs r0, 0x1
	bl sub_8080958
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08080C3C @ =gMapObjects
	adds r0, r1
	movs r1, 0x8
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08080CAE
	.align 2, 0
_08080C3C: .4byte gMapObjects
_08080C40:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _08080CAE
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl FieldAnimateDoorClose
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08080C80 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08080CAE
	.align 2, 0
_08080C80: .4byte gMapObjects
_08080C84:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08080C9A
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _08080CAE
_08080C9A:
	bl UnfreezeMapObjects
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _08080CAE
_08080CA4:
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_08080CAE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8080B9C

	thumb_func_start task_map_chg_seq_0807E20C
task_map_chg_seq_0807E20C: @ 8080CB4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08080CE0 @ =gTasks
	adds r5, r0, r1
	adds r6, r5, 0
	adds r6, 0xC
	adds r7, r5, 0
	adds r7, 0xE
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08080D06
	cmp r0, 0x1
	bgt _08080CE4
	cmp r0, 0
	beq _08080CEE
	b _08080D6E
	.align 2, 0
_08080CE0: .4byte gTasks
_08080CE4:
	cmp r0, 0x2
	beq _08080D50
	cmp r0, 0x3
	beq _08080D64
	b _08080D6E
_08080CEE:
	movs r0, 0
	bl sub_8080958
	bl FreezeMapObjects
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08080D6E
_08080D06:
	bl sub_8080E70
	cmp r0, 0
	beq _08080D6E
	movs r0, 0x1
	bl sub_8080958
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08080D4C @ =gMapObjects
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08080D6E
	.align 2, 0
_08080D4C: .4byte gMapObjects
_08080D50:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _08080D6E
	bl UnfreezeMapObjects
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08080D6E
_08080D64:
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_08080D6E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E20C

	thumb_func_start task_map_chg_seq_0807E2CC
task_map_chg_seq_0807E2CC: @ 8080D74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08080D94 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08080D98
	cmp r0, 0x1
	beq _08080DA8
	b _08080DBE
	.align 2, 0
_08080D94: .4byte gTasks
_08080D98:
	bl FreezeMapObjects
	bl ScriptContext2_Enable
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080DBE
_08080DA8:
	bl sub_8080E70
	cmp r0, 0
	beq _08080DBE
	bl UnfreezeMapObjects
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_08080DBE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E2CC

	thumb_func_start sub_8080DC4
sub_8080DC4: @ 8080DC4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080DE0
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _08080DE8 @ =sub_80712B4
	movs r1, 0x50
	bl CreateTask
_08080DE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080DE8: .4byte sub_80712B4
	thumb_func_end sub_8080DC4

	thumb_func_start atk17_seteffectuser
atk17_seteffectuser: @ 8080DEC
	push {lr}
	bl pal_fill_black
	ldr r0, _08080E00 @ =sub_8080DC4
	bl CreateStartMenuTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08080E00: .4byte sub_8080DC4
	thumb_func_end atk17_seteffectuser

	thumb_func_start task_mpl_807E3C8
task_mpl_807E3C8: @ 8080E04
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080E20
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	bl sub_8064E2C
_08080E20:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807E3C8

	thumb_func_start sub_8080E28
sub_8080E28: @ 8080E28
	push {lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _08080E40 @ =task_mpl_807E3C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080E40: .4byte task_mpl_807E3C8
	thumb_func_end sub_8080E28

	thumb_func_start sub_8080E44
sub_8080E44: @ 8080E44
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _08080E60 @ =task_mpl_807E3C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080E60: .4byte task_mpl_807E3C8
	thumb_func_end sub_8080E44

	thumb_func_start sub_8080E64
sub_8080E64: @ 8080E64
	ldr r0, _08080E6C @ =gPaletteFade
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	bx lr
	.align 2, 0
_08080E6C: .4byte gPaletteFade
	thumb_func_end sub_8080E64

	thumb_func_start sub_8080E70
sub_8080E70: @ 8080E70
	push {lr}
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08080E82
	movs r0, 0
	b _08080E84
_08080E82:
	movs r0, 0x1
_08080E84:
	pop {r1}
	bx r1
	thumb_func_end sub_8080E70

	thumb_func_start sub_8080E88
sub_8080E88: @ 8080E88
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl fade_8080918
	bl PlayRainSoundEffect
	movs r0, 0x9
	bl PlaySE
	ldr r0, _08080EB4 @ =gUnknown_0300485C
	ldr r1, _08080EB8 @ =mapldr_default
	str r1, [r0]
	ldr r0, _08080EBC @ =task0A_fade_n_map_maybe
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080EB4: .4byte gUnknown_0300485C
_08080EB8: .4byte mapldr_default
_08080EBC: .4byte task0A_fade_n_map_maybe
	thumb_func_end sub_8080E88

	thumb_func_start sp13E_warp_to_last_warp
sp13E_warp_to_last_warp: @ 8080EC0
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl fade_8080918
	bl PlayRainSoundEffect
	ldr r0, _08080EE4 @ =gUnknown_0300485C
	ldr r1, _08080EE8 @ =mapldr_default
	str r1, [r0]
	ldr r0, _08080EEC @ =task0A_fade_n_map_maybe
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080EE4: .4byte gUnknown_0300485C
_08080EE8: .4byte mapldr_default
_08080EEC: .4byte task0A_fade_n_map_maybe
	thumb_func_end sp13E_warp_to_last_warp

	thumb_func_start sub_8080EF0
sub_8080EF0: @ 8080EF0
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _08080F08 @ =gUnknown_0300485C
	ldr r1, _08080F0C @ =mapldr_default
	str r1, [r0]
	ldr r0, _08080F10 @ =sub_808115C
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080F08: .4byte gUnknown_0300485C
_08080F0C: .4byte mapldr_default
_08080F10: .4byte sub_808115C
	thumb_func_end sub_8080EF0

	thumb_func_start sp13F_fall_to_last_warp
sp13F_fall_to_last_warp: @ 8080F14
	push {lr}
	bl sp13E_warp_to_last_warp
	ldr r1, _08080F24 @ =gUnknown_0300485C
	ldr r0, _08080F28 @ =sub_8086748
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08080F24: .4byte gUnknown_0300485C
_08080F28: .4byte sub_8086748
	thumb_func_end sp13F_fall_to_last_warp

	thumb_func_start sub_8080F2C
sub_8080F2C: @ 8080F2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	adds r0, r4, 0
	movs r1, 0xA
	bl sub_8086A2C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8080F2C

	thumb_func_start sub_8080F48
sub_8080F48: @ 8080F48
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_80871B8
	pop {r0}
	bx r0
	thumb_func_end sub_8080F48

	thumb_func_start sub_8080F58
sub_8080F58: @ 8080F58
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_8087654
	pop {r0}
	bx r0
	thumb_func_end sub_8080F58

	thumb_func_start sub_8080F68
sub_8080F68: @ 8080F68
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl fade_8080918
	movs r0, 0x2D
	bl PlaySE
	ldr r0, _08080F90 @ =task0A_fade_n_map_maybe
	movs r1, 0xA
	bl CreateTask
	ldr r1, _08080F94 @ =gUnknown_0300485C
	ldr r0, _08080F98 @ =sub_8080B78
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08080F90: .4byte task0A_fade_n_map_maybe
_08080F94: .4byte gUnknown_0300485C
_08080F98: .4byte sub_8080B78
	thumb_func_end sub_8080F68

	thumb_func_start sub_8080F9C
sub_8080F9C: @ 8080F9C
	push {lr}
	bl ScriptContext2_Enable
	bl fade_8080918
	ldr r0, _08080FB8 @ =task0A_fade_n_map_maybe
	movs r1, 0xA
	bl CreateTask
	ldr r1, _08080FBC @ =gUnknown_0300485C
	ldr r0, _08080FC0 @ =sub_80C791C
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08080FB8: .4byte task0A_fade_n_map_maybe
_08080FBC: .4byte gUnknown_0300485C
_08080FC0: .4byte sub_80C791C
	thumb_func_end sub_8080F9C

	thumb_func_start sub_8080FC4
sub_8080FC4: @ 8080FC4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08080FE8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08080FF8
	cmp r0, 0x1
	bgt _08080FEC
	cmp r0, 0
	beq _08080FF2
	b _08081022
	.align 2, 0
_08080FE8: .4byte gTasks
_08080FEC:
	cmp r0, 0x2
	beq _08081012
	b _08081022
_08080FF2:
	bl ScriptContext2_Enable
	b _0808100A
_08080FF8:
	bl sub_8080E64
	cmp r0, 0
	bne _08081022
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _08081022
_0808100A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08081022
_08081012:
	bl warp_in
	ldr r0, _08081028 @ =sub_8054588
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08081022:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081028: .4byte sub_8054588
	thumb_func_end sub_8080FC4

	thumb_func_start sub_808102C
sub_808102C: @ 808102C
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl fade_8080918
	movs r0, 0x9
	bl PlaySE
	ldr r0, _0808104C @ =sub_8080FC4
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0808104C: .4byte sub_8080FC4
	thumb_func_end sub_808102C

	thumb_func_start sub_8081050
sub_8081050: @ 8081050
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081074 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081096
	cmp r0, 0x1
	bgt _08081078
	cmp r0, 0
	beq _0808107E
	b _080810CC
	.align 2, 0
_08081074: .4byte gTasks + 0x8
_08081078:
	cmp r0, 0x2
	beq _080810B4
	b _080810CC
_0808107E:
	bl ClearLinkCallback_2
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl sub_8053FF8
	movs r0, 0x9
	bl PlaySE
	b _080810AC
_08081096:
	bl sub_8080E64
	cmp r0, 0
	bne _080810CC
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _080810CC
	bl sub_800832C
_080810AC:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080810CC
_080810B4:
	ldr r0, _080810D4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080810CC
	bl warp_in
	ldr r0, _080810D8 @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_080810CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080810D4: .4byte gReceivedRemoteLinkPlayers
_080810D8: .4byte CB2_LoadMap
	thumb_func_end sub_8081050

	thumb_func_start sub_80810DC
sub_80810DC: @ 80810DC
	push {lr}
	ldr r0, _080810EC @ =sub_8081050
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080810EC: .4byte sub_8081050
	thumb_func_end sub_80810DC

	thumb_func_start task0A_fade_n_map_maybe
task0A_fade_n_map_maybe: @ 80810F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081114 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081128
	cmp r0, 0x1
	bgt _08081118
	cmp r0, 0
	beq _0808111E
	b _08081152
	.align 2, 0
_08081114: .4byte gTasks
_08081118:
	cmp r0, 0x2
	beq _08081142
	b _08081152
_0808111E:
	bl FreezeMapObjects
	bl ScriptContext2_Enable
	b _0808113A
_08081128:
	bl sub_8080E64
	cmp r0, 0
	bne _08081152
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _08081152
_0808113A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08081152
_08081142:
	bl warp_in
	ldr r0, _08081158 @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08081152:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081158: .4byte CB2_LoadMap
	thumb_func_end task0A_fade_n_map_maybe

	thumb_func_start sub_808115C
sub_808115C: @ 808115C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0808118C @ =gTasks
	adds r5, r1, r0
	adds r4, r5, 0
	adds r4, 0xC
	adds r6, r5, 0
	adds r6, 0xE
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	adds r2, r0, 0
	cmp r1, 0x4
	bls _08081180
	b _080812BC
_08081180:
	lsls r0, r1, 2
	ldr r1, _08081190 @ =_08081194
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808118C: .4byte gTasks
_08081190: .4byte _08081194
	.align 2, 0
_08081194:
	.4byte _080811A8
	.4byte _080811E4
	.4byte _08081240
	.4byte _0808128C
	.4byte _080812A8
_080811A8:
	bl FreezeMapObjects
	adds r0, r4, 0
	adds r1, r6, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl sub_8058790
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl FieldAnimateDoorOpen
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _080812BC
_080811E4:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _080811FA
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _080812BC
_080811FA:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _0808123C @ =gMapObjects
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimActive
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x9
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _080812BC
	.align 2, 0
_0808123C: .4byte gMapObjects
_08081240:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _080812BC
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl FieldAnimateDoorClose
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08081288 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0
	bl sub_8080958
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _080812BC
	.align 2, 0
_08081288: .4byte gMapObjects
_0808128C:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _080812A2
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _080812BC
_080812A2:
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _080812BC
_080812A8:
	bl sub_8053FF8
	bl fade_8080918
	bl PlayRainSoundEffect
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080812C4 @ =task0A_fade_n_map_maybe
	str r0, [r5]
_080812BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080812C4: .4byte task0A_fade_n_map_maybe
	thumb_func_end sub_808115C

	thumb_func_start sub_80812C8
sub_80812C8: @ 80812C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080812EC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081300
	cmp r0, 0x1
	bgt _080812F0
	cmp r0, 0
	beq _080812F6
	b _0808132A
	.align 2, 0
_080812EC: .4byte gTasks
_080812F0:
	cmp r0, 0x2
	beq _0808131A
	b _0808132A
_080812F6:
	bl FreezeMapObjects
	bl ScriptContext2_Enable
	b _08081312
_08081300:
	bl sub_8080E64
	cmp r0, 0
	bne _0808132A
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _0808132A
_08081312:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0808132A
_0808131A:
	bl warp_in
	ldr r0, _08081330 @ =sub_8054534
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0808132A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081330: .4byte sub_8054534
	thumb_func_end sub_80812C8

	thumb_func_start sub_8081334
sub_8081334: @ 8081334
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl fade_8080918
	bl PlayRainSoundEffect
	movs r0, 0x9
	bl PlaySE
	ldr r0, _08081360 @ =gUnknown_0300485C
	ldr r1, _08081364 @ =sub_8080B60
	str r1, [r0]
	ldr r0, _08081368 @ =sub_80812C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081360: .4byte gUnknown_0300485C
_08081364: .4byte sub_8080B60
_08081368: .4byte sub_80812C8
	thumb_func_end sub_8081334
	
	.align 2, 0 @ Don't pad with nop.
