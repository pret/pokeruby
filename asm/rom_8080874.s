	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start palette_bg_faded_fill_black
palette_bg_faded_fill_black: @ 8080874
	push {lr}
	sub sp, 0x4
	ldr r0, _0808088C
	str r0, [sp]
	ldr r1, _08080890
	ldr r2, _08080894
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808088C: .4byte 0x7fff7fff
_08080890: .4byte gPlttBufferFaded
_08080894: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_black

	thumb_func_start palette_bg_faded_fill_white
palette_bg_faded_fill_white: @ 8080898
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _080808B0
	ldr r2, _080808B4
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080808B0: .4byte gPlttBufferFaded
_080808B4: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_white

	thumb_func_start pal_fill_for_maplights
pal_fill_for_maplights: @ 80808B8
	push {r4,lr}
	bl get_map_light_from_warp0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sav1_map_get_light_level
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl fade_type_for_given_maplight_pair
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080808E2
	cmp r0, 0x1
	beq _080808F0
	b _080808FC
_080808E2:
	movs r0, 0
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_white
	b _080808FC
_080808F0:
	movs r0, 0x2
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_black
_080808FC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pal_fill_for_maplights

	thumb_func_start pal_fill_black
pal_fill_black: @ 8080904
	push {lr}
	movs r0, 0
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_white
	pop {r0}
	bx r0
	thumb_func_end pal_fill_black

	thumb_func_start sub_8080918
sub_8080918: @ 8080918
	push {r4,lr}
	bl sav1_map_get_light_level
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl warp1_get_mapheader
	ldrb r1, [r0, 0x17]
	adds r0, r4, 0
	bl sub_810CDB8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0808093E
	cmp r0, 0x1
	beq _08080948
	b _08080950
_0808093E:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	b _08080950
_08080948:
	movs r0, 0x3
	movs r1, 0
	bl fade_screen
_08080950:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8080918

	thumb_func_start sub_8080958
sub_8080958: @ 8080958
	push {lr}
	lsls r0, 24
	movs r1, 0
	cmp r0, 0
	bne _08080964
	movs r1, 0x1
_08080964:
	adds r0, r1, 0
	bl sub_8059B88
	pop {r0}
	bx r0
	thumb_func_end sub_8080958

	thumb_func_start task0A_asap_script_env_2_enable_and_set_ctx_running
task0A_asap_script_env_2_enable_and_set_ctx_running: @ 8080970
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080988
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08080988:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task0A_asap_script_env_2_enable_and_set_ctx_running

	thumb_func_start sub_8080990
sub_8080990: @ 8080990
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _080809AC
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080809AC: .4byte task0A_asap_script_env_2_enable_and_set_ctx_running
	thumb_func_end sub_8080990

	thumb_func_start sub_80809B0
sub_80809B0: @ 80809B0
	push {lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _080809C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080809C8: .4byte task0A_asap_script_env_2_enable_and_set_ctx_running
	thumb_func_end sub_80809B0

	thumb_func_start task_mpl_807DD60
task_mpl_807DD60: @ 80809CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r2, _080809F0
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
	bl pal_fill_for_maplights
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
	bl palette_bg_faded_fill_white
	ldr r0, _08080A58
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
	ldr r1, _08080A80
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
	bl pal_fill_for_maplights
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
	bl palette_bg_faded_fill_white
	ldr r0, _08080AE0
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
	bl sub_8056EAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08080B1C
	ldr r1, _08080B18
	b _08080B2E
	.align 2, 0
_08080B18: .4byte sub_8080B9C
_08080B1C:
	adds r0, r4, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08080B40
	cmp r0, 0x1
	bne _08080B2E
	ldr r1, _08080B44
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
	bl pal_fill_for_maplights
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
	bl pal_fill_for_maplights
	movs r0, 0x2E
	bl PlaySE
	ldr r0, _08080B98
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
	ldr r1, _08080BC8
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
	ldr r1, _08080BCC
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
	bl player_bitmagic
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_80586B4
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
	ldr r1, _08080C3C
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
	bl sub_805870C
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
	ldr r1, _08080C80
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
	bl sub_806451C
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
	ldr r1, _08080CE0
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
	bl player_bitmagic
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
	ldr r0, _08080D4C
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
	bl sub_806451C
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
	ldr r1, _08080D94
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
	bl player_bitmagic
	bl ScriptContext2_Enable
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080DBE
_08080DA8:
	bl sub_8080E70
	cmp r0, 0
	beq _08080DBE
	bl sub_806451C
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
	ldr r0, _08080DE8
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
	ldr r0, _08080E00
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
	ldr r0, _08080E40
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
	ldr r0, _08080E60
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080E60: .4byte task_mpl_807E3C8
	thumb_func_end sub_8080E44

	thumb_func_start sub_8080E64
sub_8080E64: @ 8080E64
	ldr r0, _08080E6C
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
	bl sub_8080918
	bl PlayRainSoundEffect
	movs r0, 0x9
	bl PlaySE
	ldr r0, _08080EB4
	ldr r1, _08080EB8
	str r1, [r0]
	ldr r0, _08080EBC
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
	bl sub_8080918
	bl PlayRainSoundEffect
	ldr r0, _08080EE4
	ldr r1, _08080EE8
	str r1, [r0]
	ldr r0, _08080EEC
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
	ldr r0, _08080F08
	ldr r1, _08080F0C
	str r1, [r0]
	ldr r0, _08080F10
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
	ldr r1, _08080F24
	ldr r0, _08080F28
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
	bl sub_8080918
	movs r0, 0x2D
	bl PlaySE
	ldr r0, _08080F90
	movs r1, 0xA
	bl CreateTask
	ldr r1, _08080F94
	ldr r0, _08080F98
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
	bl sub_8080918
	ldr r0, _08080FB8
	movs r1, 0xA
	bl CreateTask
	ldr r1, _08080FBC
	ldr r0, _08080FC0
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
	ldr r1, _08080FE8
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
	ldr r0, _08081028
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
	bl sub_8080918
	movs r0, 0x9
	bl PlaySE
	ldr r0, _0808104C
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
	ldr r1, _08081074
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
_08081074: .4byte gUnknown_03004B28
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
	ldr r0, _080810D4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080810CC
	bl warp_in
	ldr r0, _080810D8
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
	ldr r0, _080810EC
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
	ldr r1, _08081114
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
	bl player_bitmagic
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
	ldr r0, _08081158
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
	ldr r0, _0808118C
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
	ldr r1, _08081190
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
	bl player_bitmagic
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
	bl task_overworld_door_add_if_role_69_for_opening_door_at
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
	ldr r4, _0808123C
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
	bl sub_805870C
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
	ldr r1, _08081288
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
	bl sub_8080918
	bl PlayRainSoundEffect
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080812C4
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
	ldr r1, _080812EC
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
	bl player_bitmagic
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
	ldr r0, _08081330
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
	bl sub_8080918
	bl PlayRainSoundEffect
	movs r0, 0x9
	bl PlaySE
	ldr r0, _08081360
	ldr r1, _08081364
	str r1, [r0]
	ldr r0, _08081368
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081360: .4byte gUnknown_0300485C
_08081364: .4byte sub_8080B60
_08081368: .4byte sub_80812C8
	thumb_func_end sub_8081334

	thumb_func_start sub_808136C
sub_808136C: @ 808136C
	push {lr}
	cmp r1, 0xA0
	bhi _08081394
	cmp r2, 0
	bge _08081378
	movs r2, 0
_08081378:
	cmp r2, 0xFF
	ble _0808137E
	movs r2, 0xFF
_0808137E:
	cmp r3, 0
	bge _08081384
	movs r3, 0
_08081384:
	cmp r3, 0xFF
	ble _0808138A
	movs r3, 0xFF
_0808138A:
	lsls r1, 1
	adds r1, r0
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
_08081394:
	pop {r0}
	bx r0
	thumb_func_end sub_808136C

	thumb_func_start sub_8081398
sub_8081398: @ 8081398
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	mov r10, r1
	mov r9, r2
	adds r6, r3, 0
	mov r8, r6
	movs r7, 0
	cmp r6, 0
	blt _08081414
_080813B4:
	mov r0, r9
	subs r1, r0, r7
	mov r0, r10
	subs r4, r0, r6
	adds r5, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	adds r1, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	subs r1, r0, r6
	mov r0, r10
	subs r4, r0, r7
	adds r5, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	adds r1, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r1, r8
	adds r1, 0x1
	lsls r0, r7, 1
	subs r1, r0
	mov r8, r1
	adds r7, 0x1
	cmp r1, 0
	bge _08081410
	subs r1, r6, 0x1
	lsls r0, r1, 1
	add r8, r0
	adds r6, r1, 0
_08081410:
	cmp r6, r7
	bge _080813B4
_08081414:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8081398

	thumb_func_start sub_8081424
sub_8081424: @ 8081424
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081448
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081480
	cmp r0, 0x1
	bgt _0808144C
	cmp r0, 0
	beq _08081452
	b _080814E2
	.align 2, 0
_08081448: .4byte gUnknown_03004B28
_0808144C:
	cmp r0, 0x2
	beq _080814D8
	b _080814E2
_08081452:
	ldr r0, _08081478
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _0808147C
	adds r0, r1
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_8081398
	movs r0, 0x1
	strh r0, [r4]
	b _080814E2
	.align 2, 0
_08081478: .4byte gUnknown_03004DC0
_0808147C: .4byte gUnknown_03004DE0
_08081480:
	ldr r0, _080814C8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _080814CC
	adds r0, r1
	movs r6, 0x2
	ldrsh r1, [r4, r6]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r6, 0x6
	ldrsh r3, [r4, r6]
	bl sub_8081398
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080814E2
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080814D0
	bl remove_some_task
	movs r0, 0x2
	strh r0, [r4]
	b _080814E2
	.align 2, 0
_080814C8: .4byte gUnknown_03004DC0
_080814CC: .4byte gUnknown_03004DE0
_080814D0:
	adds r0, r5, 0
	bl DestroyTask
	b _080814E2
_080814D8:
	bl dp12_8087EA4
	adds r0, r5, 0
	bl DestroyTask
_080814E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8081424

	thumb_func_start sub_80814E8
sub_80814E8: @ 80814E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808150C
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081504
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081504:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808150C: .4byte sub_8081424
	thumb_func_end sub_80814E8

	thumb_func_start sub_8081510
sub_8081510: @ 8081510
	push {r4,lr}
	ldr r4, _08081530
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081528
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08081528:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081530: .4byte sub_80814E8
	thumb_func_end sub_8081510

	thumb_func_start sub_8081534
sub_8081534: @ 8081534
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x1C]
	ldr r0, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08081578
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0808157C
	adds r1, r0, r1
	strh r5, [r1, 0x6]
	strh r4, [r1, 0x8]
	mov r0, r8
	strh r0, [r1, 0x2]
	mov r0, r9
	strh r0, [r1, 0x4]
	strh r6, [r1, 0xC]
	cmp r5, r4
	bge _08081580
	strh r7, [r1, 0xA]
	b _08081584
	.align 2, 0
_08081578: .4byte sub_8081424
_0808157C: .4byte gUnknown_03004B28
_08081580:
	negs r0, r7
	strh r0, [r1, 0xA]
_08081584:
	adds r0, r2, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8081534

	thumb_func_start sub_8081594
sub_8081594: @ 8081594
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	cmp r4, 0
	bne _080815AE
	movs r5, 0x1
_080815AE:
	ldr r1, _080815DC
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r3, [r0]
	str r5, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x50
	bl sub_8081534
	bl sub_8081510
	bl ScriptContext2_Enable
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080815DC: .4byte gUnknown_0839ACDC
	thumb_func_end sub_8081594

	thumb_func_start sub_80815E0
sub_80815E0: @ 80815E0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0808160E
	ldr r4, _08081614
	ldr r1, _08081618
	lsls r0, 1
	adds r0, r1
	ldrh r3, [r0]
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x50
	bl sub_8081398
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
_0808160E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081614: .4byte gUnknown_03004DE0
_08081618: .4byte gUnknown_0839ACDC
	thumb_func_end sub_80815E0

	thumb_func_start sub_808161C
sub_808161C: @ 808161C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	cmp r0, 0
	bne _0808162A
	movs r1, 0x1F
	b _08081630
_0808162A:
	movs r0, 0xF8
	lsls r0, 7
	adds r1, r0, 0
_08081630:
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	movs r4, 0xF0
	lsls r4, 16
_0808163A:
	lsrs r1, r4, 16
	mov r0, sp
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 9
	adds r4, r0
	adds r5, 0x1
	cmp r5, 0xF
	ble _0808163A
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808161C

	thumb_func_start sub_8081658
sub_8081658: @ 8081658
	push {lr}
	lsls r0, 16
	ldr r2, _08081678
	ldrh r1, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	ldrh r1, [r2]
	lsrs r2, r1, 8
	cmp r0, 0
	beq _0808167C
	cmp r3, 0
	beq _08081686
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _08081686
	.align 2, 0
_08081678: .4byte REG_BLDALPHA
_0808167C:
	cmp r2, 0xF
	bhi _08081686
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08081686:
	ldr r1, _0808169C
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
	cmp r3, 0
	bne _080816A0
	cmp r2, 0x10
	bne _080816A0
	movs r0, 0x1
	b _080816A2
	.align 2, 0
_0808169C: .4byte REG_BLDALPHA
_080816A0:
	movs r0, 0
_080816A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8081658

	thumb_func_start sub_80816A8
sub_80816A8: @ 80816A8
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080816D0
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x7
	bls _080816C4
	b _08081892
_080816C4:
	lsls r0, 2
	ldr r1, _080816D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080816D0: .4byte gUnknown_03004B28
_080816D4: .4byte _080816D8
	.align 2, 0
_080816D8:
	.4byte _080816F8
	.4byte _08081790
	.4byte _080817BC
	.4byte _080817D8
	.4byte _080817EE
	.4byte _08081852
	.4byte _08081818
	.4byte _08081826
_080816F8:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	strh r0, [r7, 0xC]
	ldr r3, _0808176C
	ldrh r0, [r3]
	strh r0, [r7, 0xE]
	ldr r6, _08081770
	ldrh r0, [r6]
	strh r0, [r7, 0x10]
	ldr r5, _08081774
	ldrh r0, [r5]
	strh r0, [r7, 0x12]
	ldr r4, _08081778
	ldrh r0, [r4]
	strh r0, [r7, 0x14]
	ldrh r1, [r2]
	ldr r0, _0808177C
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08081780
	ldrh r0, [r3]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r2, _08081784
	adds r0, r2, 0
	strh r0, [r6]
	movs r0, 0x3F
	strh r0, [r5]
	movs r0, 0x1E
	strh r0, [r4]
	ldr r4, _08081788
	movs r0, 0x4
	ldrsh r1, [r7, r0]
	movs r0, 0x6
	ldrsh r2, [r7, r0]
	adds r0, r4, 0
	movs r3, 0x1
	bl sub_8081398
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r4, r2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
	ldr r2, _0808178C
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
	movs r0, 0x1
	strh r0, [r7]
	b _08081892
	.align 2, 0
_0808176C: .4byte REG_BLDCNT
_08081770: .4byte REG_BLDALPHA
_08081774: .4byte REG_WININ
_08081778: .4byte REG_WINOUT
_0808177C: .4byte 0x0000bfff
_08081780: .4byte gUnknown_081E29E8
_08081784: .4byte 0x0000070c
_08081788: .4byte gUnknown_03004DE0
_0808178C: .4byte gUnknown_0839ACEC
_08081790:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuFillWindowRectWithBlankTile
	ldrb r0, [r7, 0x2]
	bl sub_808161C
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	movs r2, 0x6
	ldrsh r1, [r7, r2]
	movs r2, 0x1
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r3, 0xA0
	bl sub_8081534
	strh r4, [r7]
	b _08081892
_080817BC:
	ldr r0, _080817D4
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081892
	bl EnableBothScriptContexts
	movs r0, 0x3
	strh r0, [r7]
	b _08081892
	.align 2, 0
_080817D4: .4byte sub_8081424
_080817D8:
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0
	strh r0, [r7, 0xA]
	movs r0, 0x4
	strh r0, [r7, 0x8]
	strh r0, [r7]
	b _08081892
_080817EE:
	ldrh r0, [r7, 0x8]
	subs r0, 0x1
	strh r0, [r7, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _08081892
	movs r0, 0x4
	strh r0, [r7, 0x8]
	ldrh r0, [r7, 0xA]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r7, 0xA]
	movs r1, 0x4
	negs r1, r1
	cmp r0, 0
	beq _08081810
	movs r1, 0x4
_08081810:
	movs r0, 0
	bl SetCameraPanning
	b _08081892
_08081818:
	bl InstallCameraPanAheadCallback
	movs r0, 0x8
	strh r0, [r7, 0x8]
	movs r0, 0x7
	strh r0, [r7]
	b _08081892
_08081826:
	ldrh r0, [r7, 0x8]
	subs r0, 0x1
	strh r0, [r7, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _08081892
	movs r0, 0x8
	strh r0, [r7, 0x8]
	ldrh r0, [r7, 0xA]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r7, 0xA]
	ldrh r0, [r7, 0xA]
	bl sub_8081658
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081892
	movs r0, 0x5
	strh r0, [r7]
	b _08081892
_08081852:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _0808189C
	bl LoadFontDefaultPalette
	ldr r1, _080818A0
	movs r0, 0xFF
	strh r0, [r1]
	subs r1, 0x40
	ldrh r0, [r7, 0xC]
	strh r0, [r1]
	adds r1, 0x50
	ldrh r0, [r7, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r7, 0x10]
	strh r0, [r1]
	subs r1, 0xA
	ldrh r0, [r7, 0x12]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r7, 0x14]
	strh r0, [r1]
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081892:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808189C: .4byte gWindowConfig_81E6CE4
_080818A0: .4byte REG_WIN0H
	thumb_func_end sub_80816A8

	thumb_func_start sub_80818A4
sub_80818A4: @ 80818A4
	push {lr}
	ldr r0, _080818CC
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080818D0
	adds r1, r0
	ldr r0, _080818D4
	ldrh r0, [r0]
	cmp r0, 0
	bne _080818D8
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _080818F0
	.align 2, 0
_080818CC: .4byte sub_80816A8
_080818D0: .4byte gUnknown_03004B28
_080818D4: .4byte gScriptResult
_080818D8:
	cmp r0, 0x1
	bne _080818E2
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _080818F0
_080818E2:
	cmp r0, 0x2
	bne _080818EA
	movs r0, 0
	b _080818EC
_080818EA:
	movs r0, 0x1
_080818EC:
	strh r0, [r1, 0x2]
	movs r0, 0x78
_080818F0:
	strh r0, [r1, 0x4]
	movs r0, 0x50
	strh r0, [r1, 0x6]
	pop {r0}
	bx r0
	thumb_func_end sub_80818A4

	thumb_func_start sub_80818FC
sub_80818FC: @ 80818FC
	push {lr}
	ldr r0, _0808191C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08081920
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x6
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0808191C: .4byte sub_80816A8
_08081920: .4byte gTasks
	thumb_func_end sub_80818FC

	thumb_func_start sub_8081924
sub_8081924: @ 8081924
	push {lr}
	bl sub_8054044
	ldr r0, _08081938
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081938: .4byte task50_0807F0C8
	thumb_func_end sub_8081924

	thumb_func_start task50_0807F0C8
task50_0807F0C8: @ 808193C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081958
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08081958:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task50_0807F0C8

	thumb_func_start task01_battle_start
task01_battle_start: @ 8081960
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081980
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08081984
	cmp r0, 0x1
	beq _0808199A
	b _080819BA
	.align 2, 0
_08081980: .4byte gUnknown_03004B28
_08081984:
	bl c3_80A0DD8_is_running
	cmp r0, 0
	bne _080819BA
	ldrb r0, [r4, 0x2]
	bl sub_811AABC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080819BA
_0808199A:
	bl sub_811AAE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080819BA
	ldr r0, _080819C0
	bl SetMainCallback2
	bl prev_quest_postbuffer_cursor_backup_reset
	bl overworld_poison_timer_set
	adds r0, r5, 0
	bl DestroyTask
_080819BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080819C0: .4byte sub_800E7C4
	thumb_func_end task01_battle_start

	thumb_func_start task_add_01_battle_start
task_add_01_battle_start: @ 80819C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _080819F8
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080819FC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	adds r0, r5, 0
	bl current_map_music_set__default_for_battle
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080819F8: .4byte task01_battle_start
_080819FC: .4byte gTasks
	thumb_func_end task_add_01_battle_start

	thumb_func_start sub_8081A00
sub_8081A00: @ 8081A00
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _08081A10
	bl sub_8081AA4
	b _08081A14
_08081A10:
	bl sub_8081A18
_08081A14:
	pop {r0}
	bx r0
	thumb_func_end sub_8081A00

	thumb_func_start sub_8081A18
sub_8081A18: @ 8081A18
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081A50
	ldr r0, _08081A54
	str r0, [r1, 0x8]
	ldr r1, _08081A58
	movs r0, 0
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081A50: .4byte gMain
_08081A54: .4byte sub_8081C8C
_08081A58: .4byte gUnknown_020239F8
	thumb_func_end sub_8081A18

	thumb_func_start sub_8081A5C
sub_8081A5C: @ 8081A5C
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081A98
	ldr r0, _08081A9C
	str r0, [r1, 0x8]
	ldr r1, _08081AA0
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081A98: .4byte gMain
_08081A9C: .4byte sub_8081C8C
_08081AA0: .4byte gUnknown_020239F8
	thumb_func_end sub_8081A5C

	thumb_func_start sub_8081AA4
sub_8081AA4: @ 8081AA4
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081AD0
	ldr r0, _08081AD4
	str r0, [r1, 0x8]
	ldr r1, _08081AD8
	movs r0, 0x80
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	pop {r0}
	bx r0
	.align 2, 0
_08081AD0: .4byte gMain
_08081AD4: .4byte sub_80C824C
_08081AD8: .4byte gUnknown_020239F8
	thumb_func_end sub_8081AA4

	thumb_func_start task_add_01_battle_start_with_music_and_stats
task_add_01_battle_start_with_music_and_stats: @ 8081ADC
	push {lr}
	bl sub_8082080
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x9
	bl sav12_xor_increment
	pop {r0}
	bx r0
	thumb_func_end task_add_01_battle_start_with_music_and_stats

	thumb_func_start sub_8081AFC
sub_8081AFC: @ 8081AFC
	push {lr}
	ldr r0, _08081B2C
	movs r1, 0xC4
	lsls r1, 1
	movs r2, 0x5
	bl CreateMaleMon
	bl ScriptContext2_Enable
	ldr r1, _08081B30
	ldr r0, _08081B34
	str r0, [r1, 0x8]
	ldr r1, _08081B38
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x8
	movs r1, 0
	bl task_add_01_battle_start
	pop {r0}
	bx r0
	.align 2, 0
_08081B2C: .4byte gEnemyParty
_08081B30: .4byte gMain
_08081B34: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08081B38: .4byte gUnknown_020239F8
	thumb_func_end sub_8081AFC

	thumb_func_start sub_8081B3C
sub_8081B3C: @ 8081B3C
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081B6C
	ldr r0, _08081B70
	str r0, [r1, 0x8]
	ldr r1, _08081B74
	movs r0, 0
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081B6C: .4byte gMain
_08081B70: .4byte sub_8081CEC
_08081B74: .4byte gUnknown_020239F8
	thumb_func_end sub_8081B3C

	thumb_func_start sub_8081B78
sub_8081B78: @ 8081B78
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081BAC
	ldr r0, _08081BB0
	str r0, [r1, 0x8]
	ldr r1, _08081BB4
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081BAC: .4byte gMain
_08081BB0: .4byte sub_8081CEC
_08081BB4: .4byte gUnknown_020239F8
	thumb_func_end sub_8081B78

	thumb_func_start sub_8081BB8
sub_8081BB8: @ 8081BB8
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081BE8
	ldr r0, _08081BEC
	str r0, [r1, 0x8]
	ldr r1, _08081BF0
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08081BF4
	movs r0, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081BE8: .4byte gMain
_08081BEC: .4byte sub_8081CEC
_08081BF0: .4byte gUnknown_020239F8
_08081BF4: .4byte 0x000001cf
	thumb_func_end sub_8081BB8

	thumb_func_start sub_8081BF8
sub_8081BF8: @ 8081BF8
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081C20
	ldr r0, _08081C24
	str r0, [r1, 0x8]
	ldr r1, _08081C28
	movs r2, 0xC0
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08081C2C
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08081C34
	ldr r1, _08081C30
	movs r0, 0xB
	bl task_add_01_battle_start
	b _08081C3C
	.align 2, 0
_08081C20: .4byte gMain
_08081C24: .4byte sub_8081CEC
_08081C28: .4byte gUnknown_020239F8
_08081C2C: .4byte gGameVersion
_08081C30: .4byte 0x000001cf
_08081C34:
	ldr r1, _08081C4C
	movs r0, 0x6
	bl task_add_01_battle_start
_08081C3C:
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081C4C: .4byte 0x000001cf
	thumb_func_end sub_8081BF8

	thumb_func_start sub_8081C50
sub_8081C50: @ 8081C50
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081C80
	ldr r0, _08081C84
	str r0, [r1, 0x8]
	ldr r1, _08081C88
	movs r2, 0xC0
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0xE7
	lsls r1, 1
	movs r0, 0xA
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081C80: .4byte gMain
_08081C84: .4byte sub_8081CEC
_08081C88: .4byte gUnknown_020239F8
	thumb_func_end sub_8081C50

	thumb_func_start sub_8081C8C
sub_8081C8C: @ 8081C8C
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _08081CC0
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _08081CC4
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08081CCC
	ldr r0, _08081CC8
	bl SetMainCallback2
	b _08081CD8
	.align 2, 0
_08081CC0: .4byte 0x01000100
_08081CC4: .4byte gUnknown_02024D26
_08081CC8: .4byte c2_whiteout
_08081CCC:
	ldr r0, _08081CE0
	bl SetMainCallback2
	ldr r1, _08081CE4
	ldr r0, _08081CE8
	str r0, [r1]
_08081CD8:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08081CE0: .4byte c2_exit_to_overworld_2_switch
_08081CE4: .4byte gUnknown_0300485C
_08081CE8: .4byte sub_8080E44
	thumb_func_end sub_8081C8C

	thumb_func_start sub_8081CEC
sub_8081CEC: @ 8081CEC
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _08081D20
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _08081D24
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08081D2C
	ldr r0, _08081D28
	bl SetMainCallback2
	b _08081D32
	.align 2, 0
_08081D20: .4byte 0x01000100
_08081D24: .4byte gUnknown_02024D26
_08081D28: .4byte c2_whiteout
_08081D2C:
	ldr r0, _08081D38
	bl SetMainCallback2
_08081D32:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08081D38: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8081CEC

	thumb_func_start sub_8081D3C
sub_8081D3C: @ 8081D3C
	push {r4,r5,lr}
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
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _08081D72
	movs r0, 0
	b _08081E86
_08081D72:
	adds r0, r4, 0
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _08081D82
	movs r0, 0x1
	b _08081E86
_08081D82:
	adds r0, r4, 0
	bl MetatileBehavior_IsSandOrDeepSand
	lsls r0, 24
	cmp r0, 0
	bne _08081E84
	ldr r0, _08081DA4
	ldrb r0, [r0, 0x17]
	subs r0, 0x1
	cmp r0, 0x8
	bhi _08081E08
	lsls r0, 2
	ldr r1, _08081DA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08081DA4: .4byte gMapHeader
_08081DA8: .4byte _08081DAC
	.align 2, 0
_08081DAC:
	.4byte _08081E08
	.4byte _08081E08
	.4byte _08081E08
	.4byte _08081DD0
	.4byte _08081DF4
	.4byte _08081DF8
	.4byte _08081E08
	.4byte _08081DE0
	.4byte _08081DE0
_08081DD0:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80574C4
	lsls r0, 24
	cmp r0, 0
	beq _08081DE4
_08081DE0:
	movs r0, 0x8
	b _08081E86
_08081DE4:
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08081E4C
	movs r0, 0x7
	b _08081E86
_08081DF4:
	movs r0, 0x3
	b _08081E86
_08081DF8:
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08081E5E
	b _08081E7A
_08081E08:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057568
	lsls r0, 24
	cmp r0, 0
	bne _08081E5E
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08081E4C
	adds r0, r4, 0
	bl sub_80574D8
	lsls r0, 24
	cmp r0, 0
	beq _08081E34
	movs r0, 0x6
	b _08081E86
_08081E34:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08081E62
	adds r0, r4, 0
	bl sub_8057450
	lsls r0, 24
	cmp r0, 0
	beq _08081E50
_08081E4C:
	movs r0, 0x5
	b _08081E86
_08081E50:
	adds r0, r4, 0
	bl sub_8057434
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081E62
_08081E5E:
	movs r0, 0x4
	b _08081E86
_08081E62:
	ldr r0, _08081E80
	ldrh r1, [r0, 0x4]
	movs r0, 0xE0
	lsls r0, 5
	cmp r1, r0
	beq _08081E84
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	beq _08081E84
_08081E7A:
	movs r0, 0x9
	b _08081E86
	.align 2, 0
_08081E80: .4byte gSaveBlock1
_08081E84:
	movs r0, 0x2
_08081E86:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8081D3C

	thumb_func_start sub_8081E90
sub_8081E90: @ 8081E90
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
	lsls r0, 16
	lsrs r4, r0, 16
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	cmp r0, 0
	beq _08081EC0
	movs r0, 0x2
	b _08081EEA
_08081EC0:
	lsls r0, r4, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08081EE8
	ldr r0, _08081EE0
	ldrb r0, [r0, 0x17]
	cmp r0, 0x4
	beq _08081EE4
	cmp r0, 0x5
	beq _08081EE8
	movs r0, 0
	b _08081EEA
	.align 2, 0
_08081EE0: .4byte gMapHeader
_08081EE4:
	movs r0, 0x1
	b _08081EEA
_08081EE8:
	movs r0, 0x3
_08081EEA:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8081E90

	thumb_func_start sub_8081EF4
sub_8081EF4: @ 8081EF4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	movs r6, 0
_08081EFE:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08081F50
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08081F42
	cmp r1, 0
	beq _08081F42
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08081F42
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	adds r0, r7, r0
	lsls r0, 24
	lsrs r7, r0, 24
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _08081F48
_08081F42:
	adds r6, 0x1
	cmp r6, 0x5
	ble _08081EFE
_08081F48:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08081F50: .4byte gPlayerParty
	thumb_func_end sub_8081EF4

	thumb_func_start reads_trainer_data_byte0
reads_trainer_data_byte0: @ 8081F54
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r5, _08081F88
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r5
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r4
	bcs _08081F74
	adds r4, r0, 0
_08081F74:
	movs r3, 0
	ldrb r0, [r2]
	cmp r0, 0x1
	beq _08081FBC
	cmp r0, 0x1
	bgt _08081F8C
	cmp r0, 0
	beq _08081F96
	b _0808202C
	.align 2, 0
_08081F88: .4byte gTrainers
_08081F8C:
	cmp r0, 0x2
	beq _08081FE2
	cmp r0, 0x3
	beq _08082008
	b _0808202C
_08081F96:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0808202C
_08081FA4:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08081FA4
	b _0808202C
_08081FBC:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0808202C
_08081FCA:
	lsls r0, r2, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08081FCA
	b _0808202C
_08081FE2:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0808202C
_08081FF0:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08081FF0
	b _0808202C
_08082008:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0808202C
_08082016:
	lsls r0, r2, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08082016
_0808202C:
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end reads_trainer_data_byte0

	thumb_func_start sub_8082034
sub_8082034: @ 8082034
	push {r4,r5,lr}
	bl sub_8081E90
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08082064
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_8081EF4
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0808206C
	ldr r0, _08082068
	lsls r1, r5, 1
	adds r0, 0x1
	b _08082070
	.align 2, 0
_08082064: .4byte gEnemyParty
_08082068: .4byte gBattleTransitionTable_Wild
_0808206C:
	ldr r0, _0808207C
	lsls r1, r5, 1
_08082070:
	adds r1, r0
	ldrb r0, [r1]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808207C: .4byte gBattleTransitionTable_Wild
	thumb_func_end sub_8082034

	thumb_func_start sub_8082080
sub_8082080: @ 8082080
	push {r4-r6,lr}
	ldr r4, _080820AC
	ldrh r1, [r4]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _080820E4
	ldr r1, _080820B0
	ldrh r2, [r4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x1]
	cmp r1, 0x18
	bne _080820E0
	adds r1, r2, 0
	ldr r0, _080820B4
	cmp r1, r0
	bne _080820B8
	movs r0, 0xC
	b _0808212C
	.align 2, 0
_080820AC: .4byte gTrainerBattleOpponent
_080820B0: .4byte gTrainers
_080820B4: .4byte 0x00000105
_080820B8:
	movs r0, 0x83
	lsls r0, 1
	cmp r1, r0
	bne _080820C4
	movs r0, 0xD
	b _0808212C
_080820C4:
	ldr r0, _080820D0
	cmp r1, r0
	bne _080820D4
	movs r0, 0xE
	b _0808212C
	.align 2, 0
_080820D0: .4byte 0x00000107
_080820D4:
	movs r0, 0x84
	lsls r0, 1
	cmp r1, r0
	bne _080820E4
	movs r0, 0xF
	b _0808212C
_080820E0:
	cmp r1, 0x20
	bne _080820E8
_080820E4:
	movs r0, 0x10
	b _0808212C
_080820E8:
	ldrb r0, [r0, 0x18]
	movs r5, 0x1
	cmp r0, 0x1
	bne _080820F2
	movs r5, 0x2
_080820F2:
	bl sub_8081E90
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4]
	adds r1, r5, 0
	bl reads_trainer_data_byte0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_8081EF4
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08082124
	ldr r0, _08082120
	lsls r1, r6, 1
	adds r0, 0x1
	b _08082128
	.align 2, 0
_08082120: .4byte gBattleTransitionTable_Trainer
_08082124:
	ldr r0, _08082134
	lsls r1, r6, 1
_08082128:
	adds r1, r0
	ldrb r0, [r1]
_0808212C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08082134: .4byte gBattleTransitionTable_Trainer
	thumb_func_end sub_8082080

	thumb_func_start sub_8082138
sub_8082138: @ 8082138
	push {r4,lr}
	ldr r0, _0808215C
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_8081EF4
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08082160
	movs r0, 0x3
	b _08082162
	.align 2, 0
_0808215C: .4byte gEnemyParty
_08082160:
	movs r0, 0x4
_08082162:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082138

	thumb_func_start sub_8082168
sub_8082168: @ 8082168
	push {lr}
	ldr r0, _0808217C
	bl SetMainCallback2
	ldr r1, _08082180
	ldr r0, _08082184
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0808217C: .4byte CB2_ChooseStarter
_08082180: .4byte gMain
_08082184: .4byte sub_8082188
	thumb_func_end sub_8082168

	thumb_func_start sub_8082188
sub_8082188: @ 8082188
	push {lr}
	sub sp, 0x8
	ldr r0, _080821CC
	bl GetVarPointer
	ldr r2, _080821D0
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r0, [r2]
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x5
	movs r2, 0
	movs r3, 0
	bl sub_80C5374
	bl ResetTasks
	bl sub_80408BC
	ldr r0, _080821D4
	bl SetMainCallback2
	movs r0, 0
	bl sub_811AAD8
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080821CC: .4byte 0x00004023
_080821D0: .4byte gScriptResult
_080821D4: .4byte sub_80821D8
	thumb_func_end sub_8082188

	thumb_func_start sub_80821D8
sub_80821D8: @ 80821D8
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	bl sub_811AAE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082214
	ldr r1, _08082218
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _0808221C
	ldr r0, _08082220
	str r0, [r1, 0x8]
	ldr r0, _08082224
	bl SetMainCallback2
	bl prev_quest_postbuffer_cursor_backup_reset
	bl overworld_poison_timer_set
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
_08082214:
	pop {r0}
	bx r0
	.align 2, 0
_08082218: .4byte gUnknown_020239F8
_0808221C: .4byte gMain
_08082220: .4byte sub_8082228
_08082224: .4byte sub_800E7C4
	thumb_func_end sub_80821D8

	thumb_func_start sub_8082228
sub_8082228: @ 8082228
	push {lr}
	bl sav1_reset_battle_music_maybe
	ldr r0, _08082238
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08082238: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8082228

	thumb_func_start TrainerBattleLoadArg32
TrainerBattleLoadArg32: @ 808223C
	adds r2, r0, 0
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	orrs r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	orrs r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg32

	thumb_func_start TrainerBattleLoadArg16
TrainerBattleLoadArg16: @ 8082254
	adds r1, r0, 0
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg16

	thumb_func_start TrainerBattleLoadArg8
TrainerBattleLoadArg8: @ 8082260
	ldrb r0, [r0]
	bx lr
	thumb_func_end TrainerBattleLoadArg8

	thumb_func_start trainerflag_opponent
trainerflag_opponent: @ 8082264
	ldr r1, _08082278
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_08082278: .4byte gTrainerBattleOpponent
	thumb_func_end trainerflag_opponent

	thumb_func_start battle_exit_is_player_defeat
battle_exit_is_player_defeat: @ 808227C
	push {lr}
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080822B4
	lsls r0, 2
	ldr r1, _08082290
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082290: .4byte _08082294
	.align 2, 0
_08082294:
	.4byte _080822B4
	.4byte _080822B0
	.4byte _080822B0
	.4byte _080822B4
	.4byte _080822B4
	.4byte _080822B4
	.4byte _080822B4
_080822B0:
	movs r0, 0x1
	b _080822B6
_080822B4:
	movs r0, 0
_080822B6:
	pop {r1}
	bx r1
	thumb_func_end battle_exit_is_player_defeat

	thumb_func_start sub_80822BC
sub_80822BC: @ 80822BC
	ldr r0, _080822E8
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080822EC
	strh r1, [r0]
	ldr r0, _080822F0
	strh r1, [r0]
	ldr r0, _080822F4
	movs r1, 0
	str r1, [r0]
	ldr r0, _080822F8
	str r1, [r0]
	ldr r0, _080822FC
	str r1, [r0]
	ldr r0, _08082300
	str r1, [r0]
	ldr r0, _08082304
	str r1, [r0]
	ldr r0, _08082308
	str r1, [r0]
	bx lr
	.align 2, 0
_080822E8: .4byte gTrainerBattleMode
_080822EC: .4byte gTrainerBattleOpponent
_080822F0: .4byte gTrainerMapObjectLocalId
_080822F4: .4byte gTrainerIntroSpeech
_080822F8: .4byte gTrainerDefeatSpeech
_080822FC: .4byte gTrainerVictorySpeech
_08082300: .4byte gTrainerCannotBattleSpeech
_08082304: .4byte gTrainerBattleScriptReturnAddress
_08082308: .4byte gTrainerBattleEndScript
	thumb_func_end sub_80822BC

	thumb_func_start TrainerBattleLoadArgs
TrainerBattleLoadArgs: @ 808230C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
_08082312:
	ldrb r0, [r4, 0x4]
	cmp r0, 0x6
	bhi _08082384
	lsls r0, 2
	ldr r1, _08082324
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082324: .4byte _08082328
	.align 2, 0
_08082328:
	.4byte _08082344
	.4byte _08082352
	.4byte _08082360
	.4byte _0808236E
	.4byte _08082376
	.4byte _0808237E
	.4byte _08082388
_08082344:
	adds r0, r5, 0
	bl TrainerBattleLoadArg8
	ldr r1, [r4]
	strb r0, [r1]
	adds r5, 0x1
	b _08082384
_08082352:
	adds r0, r5, 0
	bl TrainerBattleLoadArg16
	ldr r1, [r4]
	strh r0, [r1]
	adds r5, 0x2
	b _08082384
_08082360:
	adds r0, r5, 0
	bl TrainerBattleLoadArg32
	ldr r1, [r4]
	str r0, [r1]
	adds r5, 0x4
	b _08082384
_0808236E:
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1]
	b _08082384
_08082376:
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1]
	b _08082384
_0808237E:
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_08082384:
	adds r4, 0x8
	b _08082312
_08082388:
	ldr r0, [r4]
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end TrainerBattleLoadArgs

	thumb_func_start battle_80801F0
battle_80801F0: @ 8082394
	push {lr}
	ldr r0, _080823B8
	ldrh r1, [r0]
	cmp r1, 0
	beq _080823B4
	ldr r0, _080823BC
	strh r1, [r0]
	lsls r0, r1, 24
	lsrs r0, 24
	ldr r2, _080823C0
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl GetFieldObjectIdByLocalIdAndMap
	ldr r1, _080823C4
	strb r0, [r1]
_080823B4:
	pop {r0}
	bx r0
	.align 2, 0
_080823B8: .4byte gTrainerMapObjectLocalId
_080823BC: .4byte gUnknown_0202E8DE
_080823C0: .4byte gSaveBlock1
_080823C4: .4byte gSelectedMapObject
	thumb_func_end battle_80801F0

	thumb_func_start TrainerBattleConfigure
TrainerBattleConfigure: @ 80823C8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80822BC
	ldr r4, _080823F0
	adds r0, r5, 0
	bl TrainerBattleLoadArg8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, 0x1
	cmp r0, 0x7
	bhi _080824A4
	lsls r0, 2
	ldr r1, _080823F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080823F0: .4byte gTrainerBattleMode
_080823F4: .4byte _080823F8
	.align 2, 0
_080823F8:
	.4byte _08082434
	.4byte _08082434
	.4byte _08082418
	.4byte _0808242C
	.4byte _0808247C
	.4byte _0808243C
	.4byte _08082454
	.4byte _0808243C
_08082418:
	ldr r0, _08082424
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	ldr r0, _08082428
	b _080824B2
	.align 2, 0
_08082424: .4byte gTrainerBattleSpecs_3
_08082428: .4byte gUnknown_0819F878
_0808242C:
	ldr r0, _08082430
	b _0808243E
	.align 2, 0
_08082430: .4byte gTrainerBattleSpecs_2
_08082434:
	ldr r0, _08082438
	b _080824A6
	.align 2, 0
_08082438: .4byte gTrainerBattleSpecs_1
_0808243C:
	ldr r0, _0808244C
_0808243E:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _08082450
	b _080824B2
	.align 2, 0
_0808244C: .4byte gTrainerBattleSpecs_4
_08082450: .4byte gUnknown_0819F840
_08082454:
	ldr r0, _08082470
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _08082474
	ldrh r0, [r4]
	bl sub_8082C4C
	strh r0, [r4]
	ldr r0, _08082478
	b _080824B2
	.align 2, 0
_08082470: .4byte gTrainerBattleSpecs_2
_08082474: .4byte gTrainerBattleOpponent
_08082478: .4byte gUnknown_0819F8AE
_0808247C:
	ldr r0, _08082498
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _0808249C
	ldrh r0, [r4]
	bl sub_8082C4C
	strh r0, [r4]
	ldr r0, _080824A0
	b _080824B2
	.align 2, 0
_08082498: .4byte gTrainerBattleSpecs_0
_0808249C: .4byte gTrainerBattleOpponent
_080824A0: .4byte gUnknown_0819F887
_080824A4:
	ldr r0, _080824B8
_080824A6:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _080824BC
_080824B2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080824B8: .4byte gTrainerBattleSpecs_0
_080824BC: .4byte gUnknown_0819F818
	thumb_func_end TrainerBattleConfigure

	thumb_func_start TrainerWantsBattle
TrainerWantsBattle: @ 80824C0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080824F4
	strb r0, [r2]
	ldr r4, _080824F8
	ldr r3, _080824FC
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r0, [r2, 0x8]
	strh r0, [r4]
	adds r1, 0x1
	adds r0, r1, 0
	bl TrainerBattleConfigure
	ldr r0, _08082500
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080824F4: .4byte gSelectedMapObject
_080824F8: .4byte gUnknown_0202E8DE
_080824FC: .4byte gMapObjects
_08082500: .4byte gUnknown_0819F80B
	thumb_func_end TrainerWantsBattle

	thumb_func_start GetTrainerFlagFromScriptPointer
GetTrainerFlagFromScriptPointer: @ 8082504
	push {lr}
	adds r0, 0x2
	bl TrainerBattleLoadArg16
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetTrainerFlagFromScriptPointer

	thumb_func_start sub_8082524
sub_8082524: @ 8082524
	push {r4,lr}
	ldr r0, _08082550
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08082554
	adds r4, r0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082550: .4byte gSelectedMapObject
_08082554: .4byte gMapObjects
	thumb_func_end sub_8082524

	thumb_func_start sub_8082558
sub_8082558: @ 8082558
	ldr r0, _08082560
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08082560: .4byte gTrainerBattleMode
	thumb_func_end sub_8082558

	thumb_func_start sub_8082564
sub_8082564: @ 8082564
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8082564

	thumb_func_start sub_808257C
sub_808257C: @ 808257C
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end sub_808257C

	thumb_func_start unref_sub_8082590
unref_sub_8082590: @ 8082590
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8082590

	thumb_func_start trainer_flag_check
trainer_flag_check: @ 80825A4
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end trainer_flag_check

	thumb_func_start trainer_flag_set
trainer_flag_set: @ 80825BC
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end trainer_flag_set

	thumb_func_start trainer_flag_clear
trainer_flag_clear: @ 80825D0
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagReset
	pop {r0}
	bx r0
	thumb_func_end trainer_flag_clear

	thumb_func_start sub_80825E4
sub_80825E4: @ 80825E4
	push {lr}
	ldr r1, _08082600
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _08082604
	ldr r0, _08082608
	str r0, [r1, 0x8]
	bl task_add_01_battle_start_with_music_and_stats
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_08082600: .4byte gUnknown_020239F8
_08082604: .4byte gMain
_08082608: .4byte sub_808260C
	thumb_func_end sub_80825E4

	thumb_func_start sub_808260C
sub_808260C: @ 808260C
	push {lr}
	ldr r0, _08082624
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0808262C
	ldr r0, _08082628
	bl SetMainCallback2
	b _08082652
	.align 2, 0
_08082624: .4byte gTrainerBattleOpponent
_08082628: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_0808262C:
	ldr r0, _08082640
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082648
	ldr r0, _08082644
	bl SetMainCallback2
	b _08082652
	.align 2, 0
_08082640: .4byte gUnknown_02024D26
_08082644: .4byte c2_whiteout
_08082648:
	ldr r0, _08082658
	bl SetMainCallback2
	bl sub_808257C
_08082652:
	pop {r0}
	bx r0
	.align 2, 0
_08082658: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_808260C

	thumb_func_start do_choose_name_or_words_screen
do_choose_name_or_words_screen: @ 808265C
	push {lr}
	ldr r0, _08082674
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0808267C
	ldr r0, _08082678
	bl SetMainCallback2
	b _080826A6
	.align 2, 0
_08082674: .4byte gTrainerBattleOpponent
_08082678: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_0808267C:
	ldr r0, _08082690
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082698
	ldr r0, _08082694
	bl SetMainCallback2
	b _080826A6
	.align 2, 0
_08082690: .4byte gUnknown_02024D26
_08082694: .4byte c2_whiteout
_08082698:
	ldr r0, _080826AC
	bl SetMainCallback2
	bl sub_808257C
	bl sub_8082CB8
_080826A6:
	pop {r0}
	bx r0
	.align 2, 0
_080826AC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end do_choose_name_or_words_screen

	thumb_func_start sub_80826B0
sub_80826B0: @ 80826B0
	push {lr}
	ldr r1, _080826CC
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _080826D0
	ldr r0, _080826D4
	str r0, [r1, 0x8]
	bl task_add_01_battle_start_with_music_and_stats
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080826CC: .4byte gUnknown_020239F8
_080826D0: .4byte gMain
_080826D4: .4byte do_choose_name_or_words_screen
	thumb_func_end sub_80826B0

	thumb_func_start sub_80826D8
sub_80826D8: @ 80826D8
	push {lr}
	bl sub_808281C
	bl ShowFieldMessage
	pop {r0}
	bx r0
	thumb_func_end sub_80826D8

	thumb_func_start sub_80826E8
sub_80826E8: @ 80826E8
	push {lr}
	ldr r0, _080826F8
	ldr r0, [r0]
	cmp r0, 0
	bne _080826F4
	ldr r0, _080826FC
_080826F4:
	pop {r1}
	bx r1
	.align 2, 0
_080826F8: .4byte gTrainerBattleScriptReturnAddress
_080826FC: .4byte gUnknown_081C6C02
	thumb_func_end sub_80826E8

	thumb_func_start sub_8082700
sub_8082700: @ 8082700
	push {lr}
	ldr r0, _08082710
	ldr r0, [r0]
	cmp r0, 0
	bne _0808270C
	ldr r0, _08082714
_0808270C:
	pop {r1}
	bx r1
	.align 2, 0
_08082710: .4byte gTrainerBattleEndScript
_08082714: .4byte gUnknown_081C6C02
	thumb_func_end sub_8082700

	thumb_func_start sub_8082718
sub_8082718: @ 8082718
	push {lr}
	bl sub_8082880
	bl ShowFieldMessage
	pop {r0}
	bx r0
	thumb_func_end sub_8082718

	thumb_func_start sub_8082728
sub_8082728: @ 8082728
	push {lr}
	ldr r0, _08082750
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08082802
	cmp r0, 0x8
	beq _08082802
	ldr r0, _08082754
	ldrh r0, [r0]
	bl sub_803FC58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bhi _080827FC
	lsls r0, 2
	ldr r1, _08082758
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082750: .4byte gTrainerBattleMode
_08082754: .4byte gTrainerBattleOpponent
_08082758: .4byte _0808275C
	.align 2, 0
_0808275C:
	.4byte _08082794
	.4byte _0808279A
	.4byte _080827A4
	.4byte _080827FC
	.4byte _080827AC
	.4byte _080827B2
	.4byte _080827BC
	.4byte _080827C4
	.4byte _080827CC
	.4byte _080827D4
	.4byte _080827DC
	.4byte _080827E2
	.4byte _080827EC
	.4byte _080827F4
_08082794:
	movs r0, 0xBE
	lsls r0, 1
	b _080827FE
_0808279A:
	ldr r0, _080827A0
	b _080827FE
	.align 2, 0
_080827A0: .4byte 0x00000197
_080827A4:
	ldr r0, _080827A8
	b _080827FE
	.align 2, 0
_080827A8: .4byte 0x0000017b
_080827AC:
	movs r0, 0xD0
	lsls r0, 1
	b _080827FE
_080827B2:
	ldr r0, _080827B8
	b _080827FE
	.align 2, 0
_080827B8: .4byte 0x000001a1
_080827BC:
	ldr r0, _080827C0
	b _080827FE
	.align 2, 0
_080827C0: .4byte 0x000001a3
_080827C4:
	ldr r0, _080827C8
	b _080827FE
	.align 2, 0
_080827C8: .4byte 0x000001b9
_080827CC:
	ldr r0, _080827D0
	b _080827FE
	.align 2, 0
_080827D0: .4byte 0x00000181
_080827D4:
	ldr r0, _080827D8
	b _080827FE
	.align 2, 0
_080827D8: .4byte 0x000001c1
_080827DC:
	movs r0, 0xE1
	lsls r0, 1
	b _080827FE
_080827E2:
	ldr r0, _080827E8
	b _080827FE
	.align 2, 0
_080827E8: .4byte 0x000001c3
_080827EC:
	ldr r0, _080827F0
	b _080827FE
	.align 2, 0
_080827F0: .4byte 0x000001c5
_080827F4:
	ldr r0, _080827F8
	b _080827FE
	.align 2, 0
_080827F8: .4byte 0x0000018d
_080827FC:
	ldr r0, _08082808
_080827FE:
	bl PlayNewMapMusic
_08082802:
	pop {r0}
	bx r0
	.align 2, 0
_08082808: .4byte 0x000001a7
	thumb_func_end sub_8082728

	thumb_func_start ReturnEmptyStringIfNull
ReturnEmptyStringIfNull: @ 808280C
	push {lr}
	cmp r0, 0
	bne _08082814
	ldr r0, _08082818
_08082814:
	pop {r1}
	bx r1
	.align 2, 0
_08082818: .4byte gOtherText_CancelWithTerminator
	thumb_func_end ReturnEmptyStringIfNull

	thumb_func_start sub_808281C
sub_808281C: @ 808281C
	push {lr}
	ldr r0, _0808282C
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_0808282C: .4byte gTrainerIntroSpeech
	thumb_func_end sub_808281C

	thumb_func_start sub_8082830
sub_8082830: @ 8082830
	push {r4,lr}
	ldr r0, _08082844
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08082848
	bl sub_80BCCE8
	b _0808284C
	.align 2, 0
_08082844: .4byte gTrainerBattleOpponent
_08082848:
	ldr r0, _08082864
	ldr r0, [r0]
_0808284C:
	ldr r4, _08082868
	bl ReturnEmptyStringIfNull
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082864: .4byte gTrainerDefeatSpeech
_08082868: .4byte gStringVar4
	thumb_func_end sub_8082830

	thumb_func_start unref_sub_808286C
unref_sub_808286C: @ 808286C
	push {lr}
	ldr r0, _0808287C
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_0808287C: .4byte gTrainerVictorySpeech
	thumb_func_end unref_sub_808286C

	thumb_func_start sub_8082880
sub_8082880: @ 8082880
	push {lr}
	ldr r0, _08082890
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_08082890: .4byte gTrainerCannotBattleSpeech
	thumb_func_end sub_8082880

	thumb_func_start sub_8082894
sub_8082894: @ 8082894
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	adds r2, r0, 0
_0808289E:
	ldrh r0, [r2]
	cmp r0, r1
	bne _080828A8
	adds r0, r3, 0
	b _080828B4
_080828A8:
	adds r2, 0x10
	adds r3, 0x1
	cmp r3, 0x37
	ble _0808289E
	movs r0, 0x1
	negs r0, r0
_080828B4:
	pop {r1}
	bx r1
	thumb_func_end sub_8082894

	thumb_func_start sub_80828B8
sub_80828B8: @ 80828B8
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	adds r2, r0, 0
_080828C2:
	movs r1, 0
	ldrh r0, [r2]
	cmp r0, 0
	beq _080828E8
	movs r3, 0
_080828CC:
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, r5
	bne _080828D8
	adds r0, r4, 0
	b _080828F4
_080828D8:
	adds r3, 0x2
	adds r1, 0x1
	cmp r1, 0x4
	bgt _080828E8
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _080828CC
_080828E8:
	adds r2, 0x10
	adds r4, 0x1
	cmp r4, 0x37
	ble _080828C2
	movs r0, 0x1
	negs r0, r0
_080828F4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80828B8

	thumb_func_start sub_80828FC
sub_80828FC: @ 80828FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	movs r4, 0
	movs r5, 0
	ldr r0, _08082968
	mov r9, r0
_0808291E:
	lsls r0, r5, 4
	adds r2, r0, r7
	ldrh r1, [r2, 0xA]
	adds r6, r0, 0
	adds r0, r5, 0x1
	mov r8, r0
	ldr r0, [sp]
	cmp r1, r0
	bne _08082990
	ldrh r0, [r2, 0xC]
	cmp r0, r10
	bne _08082990
	mov r1, r9
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808298E
	ldrh r0, [r2]
	bl trainer_flag_check
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082990
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bhi _08082990
	movs r4, 0x1
	b _0808296E
	.align 2, 0
_08082968: .4byte gSaveBlock1 + 0x97A
_0808296C:
	adds r4, 0x1
_0808296E:
	cmp r4, 0x4
	bgt _08082988
	adds r0, r6, r7
	lsls r1, r4, 1
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	beq _08082988
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	bne _0808296C
_08082988:
	mov r1, r9
	adds r0, r5, r1
	strb r4, [r0]
_0808298E:
	movs r4, 0x1
_08082990:
	mov r5, r8
	cmp r5, 0x37
	ble _0808291E
	adds r0, r4, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80828FC

	thumb_func_start sub_80829A8
sub_80829A8: @ 80829A8
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldr r5, _080829D4
	adds r3, r0, 0
	adds r3, 0xA
_080829BA:
	ldrh r0, [r3]
	cmp r0, r4
	bne _080829D8
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	bne _080829D8
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _080829D8
	movs r0, 0x1
	b _080829E2
	.align 2, 0
_080829D4: .4byte gSaveBlock1 + 0x97A
_080829D8:
	adds r3, 0x10
	adds r1, 0x1
	cmp r1, 0x37
	ble _080829BA
	movs r0, 0
_080829E2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80829A8

	thumb_func_start sub_80829E8
sub_80829E8: @ 80829E8
	push {r4,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	adds r3, r0, 0
	adds r3, 0xA
_080829F8:
	ldrh r0, [r3]
	cmp r0, r4
	bne _08082A08
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	bne _08082A08
	movs r0, 0x1
	b _08082A12
_08082A08:
	adds r3, 0x10
	adds r1, 0x1
	cmp r1, 0x37
	ble _080829F8
	movs r0, 0
_08082A12:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80829E8

	thumb_func_start sub_8082A18
sub_8082A18: @ 8082A18
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082A4C
	cmp r1, 0x63
	bgt _08082A4C
	ldr r0, _08082A44
	ldr r2, _08082A48
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082A4C
	movs r0, 0x1
	b _08082A4E
	.align 2, 0
_08082A44: .4byte gSaveBlock1
_08082A48: .4byte 0x0000097a
_08082A4C:
	movs r0, 0
_08082A4E:
	pop {r1}
	bx r1
	thumb_func_end sub_8082A18

	thumb_func_start sub_8082A54
sub_8082A54: @ 8082A54
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80828B8
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082A88
	cmp r1, 0x63
	bgt _08082A88
	ldr r0, _08082A80
	ldr r2, _08082A84
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082A88
	movs r0, 0x1
	b _08082A8A
	.align 2, 0
_08082A80: .4byte gSaveBlock1
_08082A84: .4byte 0x0000097a
_08082A88:
	movs r0, 0
_08082A8A:
	pop {r1}
	bx r1
	thumb_func_end sub_8082A54

	thumb_func_start sub_8082A90
sub_8082A90: @ 8082A90
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08082AB8
	movs r0, 0
	b _08082ADE
_08082AAA:
	subs r0, r6, 0x1
	lsls r0, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	b _08082ADE
_08082AB4:
	ldrh r0, [r5]
	b _08082ADE
_08082AB8:
	lsls r0, r1, 4
	adds r7, r4, r0
	movs r6, 0x1
	adds r5, r7, 0x2
	adds r4, r5, 0
_08082AC2:
	ldrh r0, [r4]
	cmp r0, 0
	beq _08082AAA
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _08082AB4
	adds r4, 0x2
	adds r5, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _08082AC2
	ldrh r0, [r7, 0x8]
_08082ADE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8082A90

	thumb_func_start sub_8082AE4
sub_8082AE4: @ 8082AE4
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80828B8
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082B04
	ldr r0, _08082B08
	ldr r2, _08082B0C
	adds r0, r2
	adds r0, r1, r0
	movs r1, 0
	strb r1, [r0]
_08082B04:
	pop {r0}
	bx r0
	.align 2, 0
_08082B08: .4byte gSaveBlock1
_08082B0C: .4byte 0x0000097a
	thumb_func_end sub_8082AE4

	thumb_func_start sub_8082B10
sub_8082B10: @ 8082B10
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082B3A
	lsls r0, r1, 4
	adds r0, r4
	ldrh r0, [r0, 0x2]
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _08082B3A
	movs r0, 0x1
	b _08082B3C
_08082B3A:
	movs r0, 0
_08082B3C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B10

	thumb_func_start sub_8082B44
sub_8082B44: @ 8082B44
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	ldr r4, _08082B64
_08082B4C:
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082B68
	adds r6, 0x1
	cmp r6, 0x4
	ble _08082B68
	movs r0, 0x1
	b _08082B72
	.align 2, 0
_08082B64: .4byte gUnknown_0839B1F0
_08082B68:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	bls _08082B4C
	movs r0, 0
_08082B72:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B44

	thumb_func_start sub_8082B78
sub_8082B78: @ 8082B78
	push {lr}
	bl sub_8082B44
	cmp r0, 0
	beq _08082BA0
	ldr r0, _08082B94
	ldr r2, _08082B98
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0xFE
	bls _08082B9C
	movs r0, 0xFF
	b _08082B9E
	.align 2, 0
_08082B94: .4byte gSaveBlock1
_08082B98: .4byte 0x00000978
_08082B9C:
	adds r0, 0x1
_08082B9E:
	strh r0, [r1]
_08082BA0:
	pop {r0}
	bx r0
	thumb_func_end sub_8082B78

	thumb_func_start sub_8082BA4
sub_8082BA4: @ 8082BA4
	push {lr}
	bl sub_8082B44
	cmp r0, 0
	beq _08082BC8
	ldr r0, _08082BC0
	ldr r1, _08082BC4
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xFE
	bls _08082BC8
	movs r0, 0x1
	b _08082BCA
	.align 2, 0
_08082BC0: .4byte gSaveBlock1
_08082BC4: .4byte 0x00000978
_08082BC8:
	movs r0, 0
_08082BCA:
	pop {r1}
	bx r1
	thumb_func_end sub_8082BA4

	thumb_func_start sub_8082BD0
sub_8082BD0: @ 8082BD0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl sub_8082BA4
	cmp r0, 0
	beq _08082BFA
	ldr r0, _08082C00
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80828FC
	cmp r0, 0x1
	bne _08082BFA
	ldr r0, _08082C04
	ldr r1, _08082C08
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
_08082BFA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082C00: .4byte gTrainerEyeTrainers
_08082C04: .4byte gSaveBlock1
_08082C08: .4byte 0x00000978
	thumb_func_end sub_8082BD0

	thumb_func_start sub_8082C0C
sub_8082C0C: @ 8082C0C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _08082C28
	adds r1, r3, 0
	bl sub_80829A8
	pop {r1}
	bx r1
	.align 2, 0
_08082C28: .4byte gTrainerEyeTrainers
	thumb_func_end sub_8082C0C

	thumb_func_start unref_sub_8082C2C
unref_sub_8082C2C: @ 8082C2C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _08082C48
	adds r1, r3, 0
	bl sub_80829E8
	pop {r1}
	bx r1
	.align 2, 0
_08082C48: .4byte gTrainerEyeTrainers
	thumb_func_end unref_sub_8082C2C

	thumb_func_start sub_8082C4C
sub_8082C4C: @ 8082C4C
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08082C64
	bl sub_8082A90
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08082C64: .4byte gTrainerEyeTrainers
	thumb_func_end sub_8082C4C

	thumb_func_start sub_8082C68
sub_8082C68: @ 8082C68
	push {r4,r5,lr}
	ldr r5, _08082C8C
	ldr r4, _08082C90
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_8082A18
	lsls r0, 24
	cmp r0, 0
	bne _08082C94
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_8082B10
	lsls r0, 24
	lsrs r0, 24
	b _08082C96
	.align 2, 0
_08082C8C: .4byte gTrainerEyeTrainers
_08082C90: .4byte gTrainerBattleOpponent
_08082C94:
	movs r0, 0x1
_08082C96:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082C68

	thumb_func_start sub_8082C9C
sub_8082C9C: @ 8082C9C
	push {lr}
	ldr r0, _08082CB0
	ldr r1, _08082CB4
	ldrh r1, [r1]
	bl sub_8082A54
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08082CB0: .4byte gTrainerEyeTrainers
_08082CB4: .4byte gTrainerBattleOpponent
	thumb_func_end sub_8082C9C

	thumb_func_start sub_8082CB8
sub_8082CB8: @ 8082CB8
	push {lr}
	ldr r0, _08082CCC
	ldr r1, _08082CD0
	ldrh r1, [r1]
	bl sub_8082AE4
	bl sub_808257C
	pop {r0}
	bx r0
	.align 2, 0
_08082CCC: .4byte gTrainerEyeTrainers
_08082CD0: .4byte gTrainerBattleOpponent
	thumb_func_end sub_8082CB8

	thumb_func_start sub_8082CD4
sub_8082CD4: @ 8082CD4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _08082D10
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08082D08
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08082D14
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r6, [r1, 0xA]
	strh r5, [r1, 0xC]
_08082D08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082D10: .4byte sub_8082F20
_08082D14: .4byte gTasks
	thumb_func_end sub_8082CD4

	thumb_func_start sub_8082D18
sub_8082D18: @ 8082D18
	push {lr}
	adds r1, r0, 0
	ldr r0, _08082D44
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x12
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r0, _08082D48
	movs r1, 0x13
	movs r2, 0xB
	movs r3, 0x48
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_08082D44: .4byte gStringVar1
_08082D48: .4byte gOtherText_PLink
	thumb_func_end sub_8082D18

	thumb_func_start sub_8082D4C
sub_8082D4C: @ 8082D4C
	push {lr}
	movs r0, 0x12
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_8082D4C

	thumb_func_start sub_8082D60
sub_8082D60: @ 8082D60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08082D88
	adds r1, r0
	adds r5, r1, 0x6
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r4, r0
	beq _08082D94
	cmp r4, 0x1
	bhi _08082D8C
	bl sub_8082D4C
	b _08082D92
	.align 2, 0
_08082D88: .4byte gUnknown_03004B28
_08082D8C:
	adds r0, r4, 0
	bl sub_8082D18
_08082D92:
	strh r4, [r5]
_08082D94:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8082D60

	thumb_func_start sub_8082D9C
sub_8082D9C: @ 8082D9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08082DEC
	cmp r0, 0x2
	bgt _08082DBC
	cmp r0, 0x1
	beq _08082DC2
	b _08082DEC
_08082DBC:
	cmp r0, 0x3
	beq _08082DE8
	b _08082DEC
_08082DC2:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, r1
	bgt _08082DD6
	cmp r1, r5
	bgt _08082DD6
	movs r0, 0x1
	b _08082DEE
_08082DD6:
	ldr r0, _08082DE4
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	b _08082DEE
	.align 2, 0
_08082DE4: .4byte gStringVar1
_08082DE8:
	movs r0, 0x3
	b _08082DEE
_08082DEC:
	movs r0, 0
_08082DEE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082D9C

	thumb_func_start sub_8082DF4
sub_8082DF4: @ 8082DF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl HasLinkErrorOccurred
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082E0A
	movs r0, 0
	b _08082E1A
_08082E0A:
	ldr r0, _08082E20
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082E24
	str r0, [r1]
	movs r0, 0x1
_08082E1A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082E20: .4byte gTasks
_08082E24: .4byte sub_8083418
	thumb_func_end sub_8082DF4

	thumb_func_start sub_8082E28
sub_8082E28: @ 8082E28
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08082E58
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08082E64
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	bne _08082E64
	ldr r0, _08082E5C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082E60
	str r0, [r1]
	movs r0, 0x1
	b _08082E66
	.align 2, 0
_08082E58: .4byte gMain
_08082E5C: .4byte gTasks
_08082E60: .4byte sub_80833EC
_08082E64:
	movs r0, 0
_08082E66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082E28

	thumb_func_start sub_8082E6C
sub_8082E6C: @ 8082E6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	beq _08082E82
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
_08082E82:
	ldr r0, _08082E94
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08082E98
	movs r0, 0
	b _08082EA8
	.align 2, 0
_08082E94: .4byte gMain
_08082E98:
	ldr r0, _08082EB0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082EB4
	str r0, [r1]
	movs r0, 0x1
_08082EA8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082EB0: .4byte gTasks
_08082EB4: .4byte sub_80833EC
	thumb_func_end sub_8082E6C

	thumb_func_start sub_8082EB8
sub_8082EB8: @ 8082EB8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetSioMultiSI
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082ECE
	movs r0, 0
	b _08082EDE
_08082ECE:
	ldr r0, _08082EE4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082EE8
	str r0, [r1]
	movs r0, 0x1
_08082EDE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082EE4: .4byte gTasks
_08082EE8: .4byte sub_8083418
	thumb_func_end sub_8082EB8

	thumb_func_start unref_sub_8082EEC
unref_sub_8082EEC: @ 8082EEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08082F1C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _08082F16
	movs r0, 0x2
	bl sub_8007E9C
	adds r0, r4, 0
	bl DestroyTask
_08082F16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082F1C: .4byte gTasks
	thumb_func_end unref_sub_8082EEC

	thumb_func_start sub_8082F20
sub_8082F20: @ 8082F20
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08082F48
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08082F4C
	bl OpenLinkTimed
	bl sub_80082EC
	bl ResetLinkPlayers
	b _08082F58
	.align 2, 0
_08082F48: .4byte gUnknown_03004B28
_08082F4C:
	cmp r2, 0x9
	ble _08082F58
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _08082F64
	str r1, [r0]
_08082F58:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082F64: .4byte sub_8082F68
	thumb_func_end sub_8082F20

	thumb_func_start sub_8082F68
sub_8082F68: @ 8082F68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08082FDC
	adds r0, r4, 0
	bl sub_8082E6C
	cmp r0, 0x1
	beq _08082FDC
	cmp r5, 0x1
	bls _08082FDC
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
	ldr r1, _08082FC0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0
	strh r0, [r4, 0xE]
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082FCC
	movs r0, 0x15
	bl PlaySE
	ldr r0, _08082FC4
	bl ShowFieldAutoScrollMessage
	ldr r0, _08082FC8
	b _08082FDA
	.align 2, 0
_08082FC0: .4byte gTasks
_08082FC4: .4byte gUnknown_081A4932
_08082FC8: .4byte sub_8082FEC
_08082FCC:
	movs r0, 0x16
	bl PlaySE
	ldr r0, _08082FE4
	bl ShowFieldAutoScrollMessage
	ldr r0, _08082FE8
_08082FDA:
	str r0, [r4]
_08082FDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082FE4: .4byte gUnknown_081A49B6
_08082FE8: .4byte sub_80831F8
	thumb_func_end sub_8082F68

	thumb_func_start sub_8082FEC
sub_8082FEC: @ 8082FEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _0808302C
	adds r0, r4, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _0808302C
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _0808302C
	bl GetFieldMessageBoxMode
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0808302C
	ldr r0, _08083034
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0xE]
	ldr r0, _08083038
	str r0, [r1]
_0808302C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083034: .4byte gTasks
_08083038: .4byte sub_808303C
	thumb_func_end sub_8082FEC

	thumb_func_start sub_808303C
sub_808303C: @ 808303C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _080830D0
	mov r9, r0
	mov r7, r8
	add r7, r9
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _080830C2
	adds r0, r4, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _080830C2
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080830C2
	adds r6, r5, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8082D60
	ldr r0, _080830D4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080830C2
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r5, r0
	blt _080830C2
	adds r0, r6, 0
	bl sub_80081C8
	bl sub_8082D4C
	ldr r0, _080830D8
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, _080830DC
	bl ShowFieldAutoScrollMessage
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _080830E0
	str r1, [r0]
_080830C2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080830D0: .4byte gUnknown_03004B28
_080830D4: .4byte gMain
_080830D8: .4byte gStringVar1
_080830DC: .4byte gUnknown_081A4975
_080830E0: .4byte sub_80830E4
	thumb_func_end sub_808303C

	thumb_func_start sub_80830E4
sub_80830E4: @ 80830E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r5, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08083178
	adds r0, r5, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _08083178
	adds r0, r5, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _08083178
	bl GetFieldMessageBoxMode
	lsls r0, 24
	cmp r0, 0
	bne _08083178
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08083132
	ldr r0, _08083148
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08083158
_08083132:
	ldr r0, _0808314C
	bl ShowFieldAutoScrollMessage
	ldr r1, _08083150
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083154
	str r1, [r0]
	b _08083178
	.align 2, 0
_08083148: .4byte gMain
_0808314C: .4byte gUnknown_081A4932
_08083150: .4byte gTasks
_08083154: .4byte sub_8082FEC
_08083158:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08083178
	movs r0, 0x5
	bl PlaySE
	bl sub_8007F4C
	ldr r0, _08083180
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083184
	str r0, [r1]
_08083178:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083180: .4byte gTasks
_08083184: .4byte sub_8083188
	thumb_func_end sub_80830E4

	thumb_func_start sub_8083188
sub_8083188: @ 8083188
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080831CC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r7, [r5, 0xA]
	ldrb r6, [r5, 0xC]
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080831EA
	adds r0, r4, 0
	bl sub_8083444
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080831EA
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _080831D4
	ldr r0, _080831D0
	b _080831E8
	.align 2, 0
_080831CC: .4byte gTasks
_080831D0: .4byte sub_8083418
_080831D4:
	ldr r4, _080831F0
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8082D9C
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	beq _080831EA
	ldr r0, _080831F4
_080831E8:
	str r0, [r5]
_080831EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080831F0: .4byte gScriptResult
_080831F4: .4byte sub_8083288
	thumb_func_end sub_8083188

	thumb_func_start sub_80831F8
sub_80831F8: @ 80831F8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08083244
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r7, [r5, 0xA]
	ldrb r6, [r5, 0xC]
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08083270
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _08083270
	ldr r4, _08083248
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8082D9C
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _08083270
	cmp r0, 0x3
	bne _08083250
	bl sub_800832C
	bl HideFieldMessageBox
	ldr r0, _0808324C
	b _0808326E
	.align 2, 0
_08083244: .4byte gTasks
_08083248: .4byte gScriptResult
_0808324C: .4byte sub_80833C4
_08083250:
	bl GetLinkPlayerCount_2
	ldr r4, _08083278
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _0808327C
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_80081C8
	ldr r0, _08083280
	bl sub_8093390
	ldr r0, _08083284
_0808326E:
	str r0, [r5]
_08083270:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083278: .4byte gUnknown_03004864
_0808327C: .4byte gUnknown_03004860
_08083280: .4byte gBlockSendBuffer
_08083284: .4byte sub_8083314
	thumb_func_end sub_80831F8

	thumb_func_start sub_8083288
sub_8083288: @ 8083288
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080832F8
	ldr r0, _080832BC
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _080832C8
	bl sub_800832C
	bl HideFieldMessageBox
	ldr r0, _080832C0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080832C4
	str r0, [r1]
	b _080832F8
	.align 2, 0
_080832BC: .4byte gScriptResult
_080832C0: .4byte gTasks
_080832C4: .4byte sub_80833C4
_080832C8:
	bl GetLinkPlayerCount_2
	ldr r4, _08083300
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _08083304
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_80081C8
	ldr r0, _08083308
	bl sub_8093390
	ldr r1, _0808330C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083310
	str r1, [r0]
	movs r0, 0x2
	bl sub_8007E9C
_080832F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083300: .4byte gUnknown_03004864
_08083304: .4byte gUnknown_03004860
_08083308: .4byte gBlockSendBuffer
_0808330C: .4byte gTasks
_08083310: .4byte sub_8083314
	thumb_func_end sub_8083288

	thumb_func_start sub_8083314
sub_8083314: @ 8083314
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080833B6
	bl GetBlockRecievedStatus
	adds r4, r0, 0
	bl sub_8008198
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080833B6
	movs r4, 0
	ldr r6, _0808333C
	b _0808335A
	.align 2, 0
_0808333C: .4byte gUnknown_0202FFC0
_08083340:
	lsls r1, r4, 8
	ldr r0, _08083394
	adds r1, r0
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 3
	adds r0, r6
	movs r2, 0x38
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0808335A:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08083340
	movs r0, 0
	bl SetSuppressLinkErrorMessage
	bl ResetBlockReceivedFlags
	bl HideFieldMessageBox
	ldr r0, _08083398
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _080833A4
	ldr r0, _0808339C
	ldrh r1, [r0]
	ldr r0, _080833A0
	bl sub_8082D4C
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080833B6
	.align 2, 0
_08083394: .4byte gBlockRecvBuffer
_08083398: .4byte gScriptResult
_0808339C: .4byte gLinkType
_080833A0: .4byte 0x00004411
_080833A4:
	bl sub_800832C
	ldr r0, _080833BC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080833C0
	str r0, [r1]
_080833B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080833BC: .4byte gTasks
_080833C0: .4byte sub_80833C4
	thumb_func_end sub_8083314

	thumb_func_start sub_80833C4
sub_80833C4: @ 80833C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080833E8
	ldrb r0, [r0]
	cmp r0, 0
	bne _080833E0
	bl sub_8082D4C
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_080833E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080833E8: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80833C4

	thumb_func_start sub_80833EC
sub_80833EC: @ 80833EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08083414
	movs r0, 0x5
	strh r0, [r1]
	bl sub_8082D4C
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083414: .4byte gScriptResult
	thumb_func_end sub_80833EC

	thumb_func_start sub_8083418
sub_8083418: @ 8083418
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08083440
	movs r0, 0x6
	strh r0, [r1]
	bl sub_8082D4C
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083440: .4byte gScriptResult
	thumb_func_end sub_8083418

	thumb_func_start sub_8083444
sub_8083444: @ 8083444
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08083468
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 18
	cmp r0, r1
	bgt _0808346C
	movs r0, 0
	b _08083472
	.align 2, 0
_08083468: .4byte gTasks
_0808346C:
	ldr r0, _08083478
	str r0, [r2]
	movs r0, 0x1
_08083472:
	pop {r1}
	bx r1
	.align 2, 0
_08083478: .4byte sub_8083418
	thumb_func_end sub_8083444

	thumb_func_start sub_808347C
sub_808347C: @ 808347C
	push {r4,lr}
	movs r3, 0x2
	movs r2, 0x2
	ldr r0, _08083494
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _080834B0
	cmp r0, 0x2
	bgt _08083498
	cmp r0, 0x1
	beq _0808349E
	b _080834CC
	.align 2, 0
_08083494: .4byte gUnknown_0202E8CC
_08083498:
	cmp r0, 0x5
	beq _080834C0
	b _080834CC
_0808349E:
	movs r3, 0x2
	ldr r1, _080834A8
	ldr r4, _080834AC
	b _080834C8
	.align 2, 0
_080834A8: .4byte gLinkType
_080834AC: .4byte 0x00002233
_080834B0:
	movs r3, 0x2
	ldr r1, _080834B8
	ldr r4, _080834BC
	b _080834C8
	.align 2, 0
_080834B8: .4byte gLinkType
_080834BC: .4byte 0x00002244
_080834C0:
	movs r3, 0x4
	movs r2, 0x4
	ldr r1, _080834DC
	ldr r4, _080834E0
_080834C8:
	adds r0, r4, 0
	strh r0, [r1]
_080834CC:
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_8082CD4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080834DC: .4byte gLinkType
_080834E0: .4byte 0x00002255
	thumb_func_end sub_808347C

	thumb_func_start sub_80834E4
sub_80834E4: @ 80834E4
	push {lr}
	ldr r1, _08083500
	ldr r2, _08083504
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083508
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x2
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083500: .4byte gLinkType
_08083504: .4byte 0x00001133
_08083508: .4byte gUnknown_020239F8
	thumb_func_end sub_80834E4

	thumb_func_start sub_808350C
sub_808350C: @ 808350C
	push {lr}
	ldr r0, _0808352C
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08083530
	ldr r3, _08083534
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08083538
	strh r2, [r0]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_0808352C: .4byte gScriptResult
_08083530: .4byte gLinkType
_08083534: .4byte 0x00003311
_08083538: .4byte gUnknown_020239F8
	thumb_func_end sub_808350C

	thumb_func_start sub_808353C
sub_808353C: @ 808353C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0808355C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08083560
	cmp r0, 0x1
	beq _080835BC
	b _080835CE
	.align 2, 0
_0808355C: .4byte gTasks
_08083560:
	ldr r0, _08083594
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _08083586
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r1, r0
	bge _08083586
	ldr r2, _08083598
_08083578:
	ldrh r4, [r2, 0x1A]
	cmp r4, 0x1
	beq _0808359C
	adds r2, 0x1C
	adds r1, 0x1
	cmp r1, r0
	blt _08083578
_08083586:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080835CE
	.align 2, 0
_08083594: .4byte gScriptResult
_08083598: .4byte gLinkPlayers
_0808359C:
	ldr r1, _080835B4
	movs r0, 0x7
	strh r0, [r1]
	bl sub_8008480
	ldr r1, _080835B8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _080835CE
	.align 2, 0
_080835B4: .4byte gScriptResult
_080835B8: .4byte gTasks
_080835BC:
	ldr r0, _080835D4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080835CE
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_080835CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080835D4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_808353C

	thumb_func_start sub_80835D8
sub_80835D8: @ 80835D8
	push {r4,lr}
	ldr r4, _0808360C
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08083604
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08083610
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
_08083604:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808360C: .4byte sub_808353C
_08083610: .4byte gTasks
	thumb_func_end sub_80835D8

	thumb_func_start sub_8083614
sub_8083614: @ 8083614
	push {lr}
	ldr r1, _08083630
	ldr r2, _08083634
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083638
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083630: .4byte gLinkType
_08083634: .4byte 0x00004411
_08083638: .4byte gUnknown_020239F8
	thumb_func_end sub_8083614

	thumb_func_start sub_808363C
sub_808363C: @ 808363C
	push {lr}
	ldr r1, _08083658
	ldr r2, _0808365C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083660
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x4
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083658: .4byte gLinkType
_0808365C: .4byte 0x00006601
_08083660: .4byte gUnknown_020239F8
	thumb_func_end sub_808363C

	thumb_func_start sub_8083664
sub_8083664: @ 8083664
	push {lr}
	ldr r0, _08083678
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _0808367C
	movs r0, 0xFF
	b _08083700
	.align 2, 0
_08083678: .4byte sub_8083710
_0808367C:
	ldr r0, _08083690
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x4
	bhi _080836F4
	lsls r0, 2
	ldr r1, _08083694
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083690: .4byte gUnknown_0202E8CC
_08083694: .4byte _08083698
	.align 2, 0
_08083698:
	.4byte _080836AC
	.4byte _080836BC
	.4byte _080836DC
	.4byte _080836EC
	.4byte _080836CC
_080836AC:
	ldr r1, _080836B4
	ldr r2, _080836B8
	b _080836F0
	.align 2, 0
_080836B4: .4byte gLinkType
_080836B8: .4byte 0x00002233
_080836BC:
	ldr r1, _080836C4
	ldr r2, _080836C8
	b _080836F0
	.align 2, 0
_080836C4: .4byte gLinkType
_080836C8: .4byte 0x00002244
_080836CC:
	ldr r1, _080836D4
	ldr r2, _080836D8
	b _080836F0
	.align 2, 0
_080836D4: .4byte gLinkType
_080836D8: .4byte 0x00002255
_080836DC:
	ldr r1, _080836E4
	ldr r2, _080836E8
	b _080836F0
	.align 2, 0
_080836E4: .4byte gLinkType
_080836E8: .4byte 0x00001111
_080836EC:
	ldr r1, _08083704
	ldr r2, _08083708
_080836F0:
	adds r0, r2, 0
	strh r0, [r1]
_080836F4:
	ldr r0, _0808370C
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
_08083700:
	pop {r1}
	bx r1
	.align 2, 0
_08083704: .4byte gLinkType
_08083708: .4byte 0x00003322
_0808370C: .4byte sub_8083710
	thumb_func_end sub_8083664

	thumb_func_start sub_8083710
sub_8083710: @ 8083710
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0808373C
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08083744
	bl OpenLink
	bl ResetLinkPlayers
	ldr r0, _08083740
	movs r1, 0x50
	bl CreateTask
	b _08083750
	.align 2, 0
_0808373C: .4byte gUnknown_03004B28
_08083740: .4byte sub_8083C50
_08083744:
	cmp r2, 0x9
	ble _08083750
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _0808375C
	str r1, [r0]
_08083750:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808375C: .4byte sub_8083760
	thumb_func_end sub_8083710

	thumb_func_start sub_8083760
sub_8083760: @ 8083760
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080837A6
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083798
	ldr r0, _08083790
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083794
	b _080837A4
	.align 2, 0
_08083790: .4byte gTasks
_08083794: .4byte sub_80837B4
_08083798:
	ldr r0, _080837AC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080837B0
_080837A4:
	str r0, [r1]
_080837A6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080837AC: .4byte gTasks
_080837B0: .4byte sub_80837EC
	thumb_func_end sub_8083760

	thumb_func_start sub_80837B4
sub_80837B4: @ 80837B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080837DE
	bl sub_8007F4C
	ldr r0, _080837E4
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080837E8
	str r0, [r1]
_080837DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080837E4: .4byte gTasks
_080837E8: .4byte sub_80837EC
	thumb_func_end sub_80837B4

	thumb_func_start sub_80837EC
sub_80837EC: @ 80837EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808381C
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08083814
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083814
	bl sub_800826C
	bl sub_8007B14
	adds r0, r4, 0
	bl DestroyTask
_08083814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808381C: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80837EC

	thumb_func_start sub_8083820
sub_8083820: @ 8083820
	push {lr}
	bl InitSaveDialog
	pop {r0}
	bx r0
	thumb_func_end sub_8083820

	thumb_func_start sub_808382C
sub_808382C: @ 808382C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08083850
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _08083846
	b _08083940
_08083846:
	lsls r0, 2
	ldr r1, _08083854
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083850: .4byte gTasks
_08083854: .4byte _08083858
	.align 2, 0
_08083858:
	.4byte _08083870
	.4byte _08083890
	.4byte _080838A0
	.4byte _080838B0
	.4byte _080838B6
	.4byte _080838CC
_08083870:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08083888
	ldr r2, _0808388C
	adds r0, r2, 0
	strh r0, [r1]
	bl ClearLinkCallback_2
	b _080838BE
	.align 2, 0
_08083888: .4byte gLinkType
_0808388C: .4byte 0x00002211
_08083890:
	ldr r0, _0808389C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	b _080838BA
	.align 2, 0
_0808389C: .4byte gPaletteFade
_080838A0:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08083940
	b _080838BE
_080838B0:
	bl sub_800832C
	b _080838BE
_080838B6:
	ldr r0, _080838C8
	ldrb r0, [r0]
_080838BA:
	cmp r0, 0
	bne _08083940
_080838BE:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08083940
	.align 2, 0
_080838C8: .4byte gReceivedRemoteLinkPlayers
_080838CC:
	ldr r0, _080838E4
	ldr r0, [r0, 0x4]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080838E8
	movs r0, 0xE6
	lsls r0, 1
	bl current_map_music_set__default_for_battle
	b _080838EE
	.align 2, 0
_080838E4: .4byte gLinkPlayers
_080838E8:
	ldr r0, _08083900
	bl current_map_music_set__default_for_battle
_080838EE:
	ldr r0, _08083904
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _08083918
	cmp r0, 0x2
	bgt _08083908
	cmp r0, 0x1
	beq _0808390E
	b _0808392E
	.align 2, 0
_08083900: .4byte 0x000001cb
_08083904: .4byte gUnknown_0202E8CC
_08083908:
	cmp r0, 0x5
	beq _08083924
	b _0808392E
_0808390E:
	ldr r1, _08083914
	movs r0, 0xA
	b _0808392C
	.align 2, 0
_08083914: .4byte gUnknown_020239F8
_08083918:
	ldr r1, _08083920
	movs r0, 0xB
	b _0808392C
	.align 2, 0
_08083920: .4byte gUnknown_020239F8
_08083924:
	bl sub_80C5604
	ldr r1, _08083948
	movs r0, 0x4B
_0808392C:
	strh r0, [r1]
_0808392E:
	ldr r0, _0808394C
	bl SetMainCallback2
	ldr r1, _08083950
	ldr r0, _08083954
	str r0, [r1, 0x8]
	adds r0, r5, 0
	bl DestroyTask
_08083940:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083948: .4byte gUnknown_020239F8
_0808394C: .4byte sub_800E7C4
_08083950: .4byte gMain
_08083954: .4byte sub_8083958
	thumb_func_end sub_808382C

	thumb_func_start sub_8083958
sub_8083958: @ 8083958
	push {lr}
	bl call_map_music_set_to_zero
	bl copy_player_party_from_sav1
	bl copy_bags_and_unk_data_to_save_blocks
	bl sub_810FEFC
	ldr r0, _08083990
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _0808397E
	ldr r0, _08083994
	ldrb r1, [r0]
	movs r0, 0x1
	eors r0, r1
	bl sub_8110290
_0808397E:
	ldr r0, _08083998
	ldr r1, _0808399C
	str r1, [r0, 0x8]
	ldr r0, _080839A0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08083990: .4byte gUnknown_0202E8CC
_08083994: .4byte gUnknown_03004860
_08083998: .4byte gMain
_0808399C: .4byte sub_805465C
_080839A0: .4byte sub_8071B28
	thumb_func_end sub_8083958

	thumb_func_start sub_80839A4
sub_80839A4: @ 80839A4
	push {lr}
	ldr r0, _080839CC
	ldrh r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080839B8
	cmp r1, 0x5
	bne _080839C0
_080839B8:
	bl copy_player_party_from_sav1
	bl copy_bags_and_unk_data_to_save_blocks
_080839C0:
	movs r0, 0x7F
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	pop {r0}
	bx r0
	.align 2, 0
_080839CC: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80839A4

	thumb_func_start sub_80839D0
sub_80839D0: @ 80839D0
	push {lr}
	bl sub_805559C
	pop {r0}
	bx r0
	thumb_func_end sub_80839D0

	thumb_func_start sub_80839DC
sub_80839DC: @ 80839DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08083A00
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08083A20
	cmp r0, 0x1
	bgt _08083A04
	cmp r0, 0
	beq _08083A0E
	b _08083A7E
	.align 2, 0
_08083A00: .4byte gTasks
_08083A04:
	cmp r0, 0x2
	beq _08083A40
	cmp r0, 0x3
	beq _08083A68
	b _08083A7E
_08083A0E:
	ldr r0, _08083A1C
	bl ShowFieldMessage
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08083A7E
	.align 2, 0
_08083A1C: .4byte gUnknown_081A490C
_08083A20:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _08083A7E
	bl sub_8055574
	ldr r0, _08083A3C
	ldrb r0, [r0]
	bl sub_8007270
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08083A7E
	.align 2, 0
_08083A3C: .4byte gUnknown_0202E8CE
_08083A40:
	bl sub_80554F8
	cmp r0, 0x1
	beq _08083A52
	cmp r0, 0x1
	ble _08083A7E
	cmp r0, 0x2
	beq _08083A62
	b _08083A7E
_08083A52:
	bl HideFieldMessageBox
	movs r0, 0
	strh r0, [r5, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
	b _08083A7E
_08083A62:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08083A7E
_08083A68:
	bl sub_8055588
	bl HideFieldMessageBox
	bl MenuZeroFillScreen
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08083A7E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80839DC

	thumb_func_start sub_8083A84
sub_8083A84: @ 8083A84
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08083AA8
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083AA8: .4byte sub_80839DC
	thumb_func_end sub_8083A84

	thumb_func_start sub_8083AAC
sub_8083AAC: @ 8083AAC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08083AD0
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08083AF0
	cmp r0, 0x1
	bgt _08083AD4
	cmp r0, 0
	beq _08083ADE
	b _08083B34
	.align 2, 0
_08083AD0: .4byte gTasks
_08083AD4:
	cmp r0, 0x2
	beq _08083B04
	cmp r0, 0x3
	beq _08083B20
	b _08083B34
_08083ADE:
	bl ScriptContext2_Enable
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl ClearLinkCallback_2
	b _08083B14
_08083AF0:
	ldr r0, _08083B00
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08083B34
	b _08083B14
	.align 2, 0
_08083B00: .4byte gPaletteFade
_08083B04:
	ldr r1, _08083B1C
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	bl m4aMPlayAllStop
	bl sub_800832C
_08083B14:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08083B34
	.align 2, 0
_08083B1C: .4byte gUnknown_020297D8
_08083B20:
	ldr r0, _08083B3C
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083B34
	ldr r0, _08083B40
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08083B34:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083B3C: .4byte gReceivedRemoteLinkPlayers
_08083B40: .4byte sub_8047CD8
	thumb_func_end sub_8083AAC

	thumb_func_start sub_8083B44
sub_8083B44: @ 8083B44
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8083B6C
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8083B44

	thumb_func_start sub_8083B5C
sub_8083B5C: @ 8083B5C
	push {lr}
	ldr r0, _08083B68
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_08083B68: .4byte sub_8083B44
	thumb_func_end sub_8083B5C

	thumb_func_start sub_8083B6C
sub_8083B6C: @ 8083B6C
	push {lr}
	ldr r0, _08083B7C
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08083B7C: .4byte sub_8083AAC
	thumb_func_end sub_8083B6C

	thumb_func_start sub_8083B80
sub_8083B80: @ 8083B80
	push {lr}
	bl sub_8083B6C
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	thumb_func_end sub_8083B80

	thumb_func_start sub_8083B90
sub_8083B90: @ 8083B90
	push {lr}
	ldr r0, _08083BA4
	ldr r2, _08083BA8
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08083BAC
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_08083BA4: .4byte gLinkType
_08083BA8: .4byte 0x00002211
_08083BAC: .4byte sub_808382C
	thumb_func_end sub_8083B90

	thumb_func_start unref_sub_8083BB0
unref_sub_8083BB0: @ 8083BB0
	push {r4,lr}
	ldr r4, _08083BD4
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08083BD8
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083BD4: .4byte sub_80839DC
_08083BD8: .4byte sub_80B9484
	thumb_func_end unref_sub_8083BB0

	thumb_func_start sub_8083BDC
sub_8083BDC: @ 8083BDC
	push {lr}
	ldr r0, _08083BEC
	ldrb r0, [r0]
	ldr r1, _08083BF0
	bl sub_8093130
	pop {r0}
	bx r0
	.align 2, 0
_08083BEC: .4byte gUnknown_0202E8D0
_08083BF0: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8083BDC

	thumb_func_start sub_8083BF4
sub_8083BF4: @ 8083BF4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08083C34
	strh r4, [r0]
	ldr r0, _08083C38
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _08083C3C
	adds r1, r2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80934C4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08083C48
	ldr r0, _08083C40
	ldr r2, _08083C44
	subs r1, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x1
	b _08083C4A
	.align 2, 0
_08083C34: .4byte gUnknown_0202E8D0
_08083C38: .4byte gStringVar1
_08083C3C: .4byte gLinkPlayers + 0x8
_08083C40: .4byte gStringVar2
_08083C44: .4byte gTrainerCardColorNames
_08083C48:
	movs r0, 0
_08083C4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8083BF4

	thumb_func_start sub_8083C50
sub_8083C50: @ 8083C50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08083C98
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 17
	cmp r1, r0
	ble _08083C82
	bl CloseLink
	ldr r0, _08083C9C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08083C82:
	ldr r0, _08083CA0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08083C90
	adds r0, r5, 0
	bl DestroyTask
_08083C90:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083C98: .4byte gTasks
_08083C9C: .4byte CB2_LinkError
_08083CA0: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8083C50

	thumb_func_start sub_8083CA4
sub_8083CA4: @ 8083CA4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08083CC4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083CBC
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08083CBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083CC4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8083CA4

	thumb_func_start unref_sub_8083CC8
unref_sub_8083CC8: @ 8083CC8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800832C
	ldr r1, _08083CE8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083CEC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083CE8: .4byte gTasks
_08083CEC: .4byte sub_8083CA4
	thumb_func_end unref_sub_8083CC8

	thumb_func_start unref_sub_8083CF0
unref_sub_8083CF0: @ 8083CF0
	push {r4-r7,lr}
	ldr r0, _08083D38
	ldr r4, [r0]
	lsls r4, 26
	lsrs r4, 30
	ldr r0, _08083D3C
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, _08083D40
	bl StringAppend
	movs r5, 0
	ldr r0, _08083D44
	movs r6, 0x1
	eors r4, r6
	lsls r4, 1
	adds r7, r4, r0
	movs r4, 0
_08083D14:
	ldrh r0, [r7]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _08083D28
	ldr r1, _08083D48
	adds r1, r4, r1
	ldr r0, _08083D3C
	bl StringAppend
_08083D28:
	adds r4, 0x3
	adds r5, 0x1
	cmp r5, 0x9
	ble _08083D14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083D38: .4byte 0x04000128
_08083D3C: .4byte gUnknown_03004DA0
_08083D40: .4byte gUnknown_0839B24A
_08083D44: .4byte word_3002910
_08083D48: .4byte gUnknown_0839B22C
	thumb_func_end unref_sub_8083CF0

	.align 2, 0 @ Don't pad with nop.
