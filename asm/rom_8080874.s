	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start palette_bg_faded_fill_black
palette_bg_faded_fill_black: @ 8080874
	push {lr}
	sub sp, 0x4
	ldr r0, _0808088C @ =0x7fff7fff
	str r0, [sp]
	ldr r1, _08080890 @ =gPlttBufferFaded
	ldr r2, _08080894 @ =0x01000100
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
	ldr r1, _080808B0 @ =gPlttBufferFaded
	ldr r2, _080808B4 @ =0x01000100
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
	ldr r0, _080809AC @ =task0A_asap_script_env_2_enable_and_set_ctx_running
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
	ldr r0, _080809C8 @ =task0A_asap_script_env_2_enable_and_set_ctx_running
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
	bl sub_8056EAC
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
	bl sub_8056F08
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
	bl sub_8080918
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
	bl sub_8080918
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
	bl sub_8080918
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
	bl sub_8080918
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
	bl sub_8080918
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
	bl sub_8080918
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
	bl sub_8080918
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
	ldr r1, _08081448 @ =gTasks + 0x8
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
_08081448: .4byte gTasks + 0x8
_0808144C:
	cmp r0, 0x2
	beq _080814D8
	b _080814E2
_08081452:
	ldr r0, _08081478 @ =gUnknown_03004DC0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _0808147C @ =gUnknown_03004DE0
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
	ldr r0, _080814C8 @ =gUnknown_03004DC0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _080814CC @ =gUnknown_03004DE0
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
	ldr r0, _0808150C @ =sub_8081424
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
	ldr r4, _08081530 @ =sub_80814E8
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
	ldr r0, _08081578 @ =sub_8081424
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0808157C @ =gTasks + 0x8
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
_0808157C: .4byte gTasks + 0x8
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
	ldr r1, _080815DC @ =gUnknown_0839ACDC
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
	ldr r4, _08081614 @ =gUnknown_03004DE0
	ldr r1, _08081618 @ =gUnknown_0839ACDC
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
	ldr r2, _08081678 @ =REG_BLDALPHA
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
	ldr r1, _0808169C @ =REG_BLDALPHA
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
	ldr r1, _080816D0 @ =gTasks + 0x8
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x7
	bls _080816C4
	b _08081892
_080816C4:
	lsls r0, 2
	ldr r1, _080816D4 @ =_080816D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080816D0: .4byte gTasks + 0x8
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
	ldr r3, _0808176C @ =REG_BLDCNT
	ldrh r0, [r3]
	strh r0, [r7, 0xE]
	ldr r6, _08081770 @ =REG_BLDALPHA
	ldrh r0, [r6]
	strh r0, [r7, 0x10]
	ldr r5, _08081774 @ =REG_WININ
	ldrh r0, [r5]
	strh r0, [r7, 0x12]
	ldr r4, _08081778 @ =REG_WINOUT
	ldrh r0, [r4]
	strh r0, [r7, 0x14]
	ldrh r1, [r2]
	ldr r0, _0808177C @ =0x0000bfff
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08081780 @ =gUnknown_081E29E8
	ldrh r0, [r3]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r2, _08081784 @ =0x0000070c
	adds r0, r2, 0
	strh r0, [r6]
	movs r0, 0x3F
	strh r0, [r5]
	movs r0, 0x1E
	strh r0, [r4]
	ldr r4, _08081788 @ =gUnknown_03004DE0
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
	ldr r2, _0808178C @ =gUnknown_0839ACEC
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
	ldr r0, _080817D4 @ =sub_8081424
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
	ldr r0, _0808189C @ =gWindowConfig_81E6CE4
	bl LoadFontDefaultPalette
	ldr r1, _080818A0 @ =REG_WIN0H
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
	ldr r0, _080818CC @ =sub_80816A8
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080818D0 @ =gTasks + 0x8
	adds r1, r0
	ldr r0, _080818D4 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080818D8
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _080818F0
	.align 2, 0
_080818CC: .4byte sub_80816A8
_080818D0: .4byte gTasks + 0x8
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
	ldr r0, _0808191C @ =sub_80816A8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08081920 @ =gTasks
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
	ldr r0, _08081938 @ =task50_0807F0C8
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

	.align 2, 0 @ Don't pad with nop.
