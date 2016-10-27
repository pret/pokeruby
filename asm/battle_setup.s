	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start task01_battle_start
task01_battle_start: @ 8081960
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081980 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08081984
	cmp r0, 0x1
	beq _0808199A
	b _080819BA
	.align 2, 0
_08081980: .4byte gTasks + 0x8
_08081984:
	bl FieldPoisonEffectIsRunning
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
	ldr r0, _080819C0 @ =sub_800E7C4
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
	ldr r0, _080819F8 @ =task01_battle_start
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080819FC @ =gTasks
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
	ldr r1, _08081A50 @ =gMain
	ldr r0, _08081A54 @ =sub_8081C8C
	str r0, [r1, 0x8]
	ldr r1, _08081A58 @ =gUnknown_020239F8
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
	ldr r1, _08081A98 @ =gMain
	ldr r0, _08081A9C @ =sub_8081C8C
	str r0, [r1, 0x8]
	ldr r1, _08081AA0 @ =gUnknown_020239F8
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
	ldr r1, _08081AD0 @ =gMain
	ldr r0, _08081AD4 @ =sub_80C824C
	str r0, [r1, 0x8]
	ldr r1, _08081AD8 @ =gUnknown_020239F8
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
	ldr r0, _08081B2C @ =gEnemyParty
	movs r1, 0xC4
	lsls r1, 1
	movs r2, 0x5
	bl CreateMaleMon
	bl ScriptContext2_Enable
	ldr r1, _08081B30 @ =gMain
	ldr r0, _08081B34 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	str r0, [r1, 0x8]
	ldr r1, _08081B38 @ =gUnknown_020239F8
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
	ldr r1, _08081B6C @ =gMain
	ldr r0, _08081B70 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _08081B74 @ =gUnknown_020239F8
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
	ldr r1, _08081BAC @ =gMain
	ldr r0, _08081BB0 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _08081BB4 @ =gUnknown_020239F8
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
	ldr r1, _08081BE8 @ =gMain
	ldr r0, _08081BEC @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _08081BF0 @ =gUnknown_020239F8
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08081BF4 @ =0x000001cf
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
	ldr r1, _08081C20 @ =gMain
	ldr r0, _08081C24 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _08081C28 @ =gUnknown_020239F8
	movs r2, 0xC0
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08081C2C @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08081C34
	ldr r1, _08081C30 @ =0x000001cf
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
	ldr r1, _08081C4C @ =0x000001cf
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
	ldr r1, _08081C80 @ =gMain
	ldr r0, _08081C84 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _08081C88 @ =gUnknown_020239F8
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
	ldr r2, _08081CC0 @ =0x01000100
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _08081CC4 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08081CCC
	ldr r0, _08081CC8 @ =c2_whiteout
	bl SetMainCallback2
	b _08081CD8
	.align 2, 0
_08081CC0: .4byte 0x01000100
_08081CC4: .4byte gUnknown_02024D26
_08081CC8: .4byte c2_whiteout
_08081CCC:
	ldr r0, _08081CE0 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _08081CE4 @ =gUnknown_0300485C
	ldr r0, _08081CE8 @ =sub_8080E44
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
	ldr r2, _08081D20 @ =0x01000100
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _08081D24 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08081D2C
	ldr r0, _08081D28 @ =c2_whiteout
	bl SetMainCallback2
	b _08081D32
	.align 2, 0
_08081D20: .4byte 0x01000100
_08081D24: .4byte gUnknown_02024D26
_08081D28: .4byte c2_whiteout
_08081D2C:
	ldr r0, _08081D38 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
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
	ldr r0, _08081DA4 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	subs r0, 0x1
	cmp r0, 0x8
	bhi _08081E08
	lsls r0, 2
	ldr r1, _08081DA8 @ =_08081DAC
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
	bl MetatileBehavior_IsBridge
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081E62
_08081E5E:
	movs r0, 0x4
	b _08081E86
_08081E62:
	ldr r0, _08081E80 @ =gSaveBlock1
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
	ldr r0, _08081EE0 @ =gMapHeader
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
	ldr r0, _08081F50 @ =gPlayerParty
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
	ldr r5, _08081F88 @ =gTrainers
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
	ldr r0, _08082064 @ =gEnemyParty
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
	ldr r0, _08082068 @ =gBattleTransitionTable_Wild
	lsls r1, r5, 1
	adds r0, 0x1
	b _08082070
	.align 2, 0
_08082064: .4byte gEnemyParty
_08082068: .4byte gBattleTransitionTable_Wild
_0808206C:
	ldr r0, _0808207C @ =gBattleTransitionTable_Wild
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
	ldr r4, _080820AC @ =gTrainerBattleOpponent
	ldrh r1, [r4]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _080820E4
	ldr r1, _080820B0 @ =gTrainers
	ldrh r2, [r4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x1]
	cmp r1, 0x18
	bne _080820E0
	adds r1, r2, 0
	ldr r0, _080820B4 @ =0x00000105
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
	ldr r0, _080820D0 @ =0x00000107
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
	ldr r0, _08082120 @ =gBattleTransitionTable_Trainer
	lsls r1, r6, 1
	adds r0, 0x1
	b _08082128
	.align 2, 0
_08082120: .4byte gBattleTransitionTable_Trainer
_08082124:
	ldr r0, _08082134 @ =gBattleTransitionTable_Trainer
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
	ldr r0, _0808215C @ =gEnemyParty
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
	ldr r0, _0808217C @ =CB2_ChooseStarter
	bl SetMainCallback2
	ldr r1, _08082180 @ =gMain
	ldr r0, _08082184 @ =sub_8082188
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
	ldr r0, _080821CC @ =0x00004023
	bl GetVarPointer
	ldr r2, _080821D0 @ =gScriptResult
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
	bl ScriptGiveMon
	bl ResetTasks
	bl sub_80408BC
	ldr r0, _080821D4 @ =sub_80821D8
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
	ldr r1, _08082218 @ =gUnknown_020239F8
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _0808221C @ =gMain
	ldr r0, _08082220 @ =sub_8082228
	str r0, [r1, 0x8]
	ldr r0, _08082224 @ =sub_800E7C4
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
	ldr r0, _08082238 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
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
	ldr r1, _08082278 @ =gTrainerBattleOpponent
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
	ldr r1, _08082290 @ =_08082294
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
	ldr r0, _080822E8 @ =gTrainerBattleMode
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080822EC @ =gTrainerBattleOpponent
	strh r1, [r0]
	ldr r0, _080822F0 @ =gTrainerMapObjectLocalId
	strh r1, [r0]
	ldr r0, _080822F4 @ =gTrainerIntroSpeech
	movs r1, 0
	str r1, [r0]
	ldr r0, _080822F8 @ =gTrainerDefeatSpeech
	str r1, [r0]
	ldr r0, _080822FC @ =gTrainerVictorySpeech
	str r1, [r0]
	ldr r0, _08082300 @ =gTrainerCannotBattleSpeech
	str r1, [r0]
	ldr r0, _08082304 @ =gTrainerBattleScriptReturnAddress
	str r1, [r0]
	ldr r0, _08082308 @ =gTrainerBattleEndScript
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
	ldr r1, _08082324 @ =_08082328
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
	ldr r0, _080823B8 @ =gTrainerMapObjectLocalId
	ldrh r1, [r0]
	cmp r1, 0
	beq _080823B4
	ldr r0, _080823BC @ =gUnknown_0202E8DE
	strh r1, [r0]
	lsls r0, r1, 24
	lsrs r0, 24
	ldr r2, _080823C0 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl GetFieldObjectIdByLocalIdAndMap
	ldr r1, _080823C4 @ =gSelectedMapObject
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
	ldr r4, _080823F0 @ =gTrainerBattleMode
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
	ldr r1, _080823F4 @ =_080823F8
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
	ldr r0, _08082424 @ =gTrainerBattleSpecs_3
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	ldr r0, _08082428 @ =gUnknown_0819F878
	b _080824B2
	.align 2, 0
_08082424: .4byte gTrainerBattleSpecs_3
_08082428: .4byte gUnknown_0819F878
_0808242C:
	ldr r0, _08082430 @ =gTrainerBattleSpecs_2
	b _0808243E
	.align 2, 0
_08082430: .4byte gTrainerBattleSpecs_2
_08082434:
	ldr r0, _08082438 @ =gTrainerBattleSpecs_1
	b _080824A6
	.align 2, 0
_08082438: .4byte gTrainerBattleSpecs_1
_0808243C:
	ldr r0, _0808244C @ =gTrainerBattleSpecs_4
_0808243E:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _08082450 @ =gUnknown_0819F840
	b _080824B2
	.align 2, 0
_0808244C: .4byte gTrainerBattleSpecs_4
_08082450: .4byte gUnknown_0819F840
_08082454:
	ldr r0, _08082470 @ =gTrainerBattleSpecs_2
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _08082474 @ =gTrainerBattleOpponent
	ldrh r0, [r4]
	bl sub_8082C4C
	strh r0, [r4]
	ldr r0, _08082478 @ =gUnknown_0819F8AE
	b _080824B2
	.align 2, 0
_08082470: .4byte gTrainerBattleSpecs_2
_08082474: .4byte gTrainerBattleOpponent
_08082478: .4byte gUnknown_0819F8AE
_0808247C:
	ldr r0, _08082498 @ =gTrainerBattleSpecs_0
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _0808249C @ =gTrainerBattleOpponent
	ldrh r0, [r4]
	bl sub_8082C4C
	strh r0, [r4]
	ldr r0, _080824A0 @ =gUnknown_0819F887
	b _080824B2
	.align 2, 0
_08082498: .4byte gTrainerBattleSpecs_0
_0808249C: .4byte gTrainerBattleOpponent
_080824A0: .4byte gUnknown_0819F887
_080824A4:
	ldr r0, _080824B8 @ =gTrainerBattleSpecs_0
_080824A6:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _080824BC @ =gUnknown_0819F818
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
	ldr r2, _080824F4 @ =gSelectedMapObject
	strb r0, [r2]
	ldr r4, _080824F8 @ =gUnknown_0202E8DE
	ldr r3, _080824FC @ =gMapObjects
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r0, [r2, 0x8]
	strh r0, [r4]
	adds r1, 0x1
	adds r0, r1, 0
	bl TrainerBattleConfigure
	ldr r0, _08082500 @ =gUnknown_0819F80B
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
	ldr r0, _08082550 @ =gSelectedMapObject
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08082554 @ =gMapObjects
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
	ldr r0, _08082560 @ =gTrainerBattleMode
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
	ldr r1, _08082600 @ =gUnknown_020239F8
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _08082604 @ =gMain
	ldr r0, _08082608 @ =sub_808260C
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
	ldr r0, _08082624 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0808262C
	ldr r0, _08082628 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	b _08082652
	.align 2, 0
_08082624: .4byte gTrainerBattleOpponent
_08082628: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_0808262C:
	ldr r0, _08082640 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082648
	ldr r0, _08082644 @ =c2_whiteout
	bl SetMainCallback2
	b _08082652
	.align 2, 0
_08082640: .4byte gUnknown_02024D26
_08082644: .4byte c2_whiteout
_08082648:
	ldr r0, _08082658 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
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
	ldr r0, _08082674 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0808267C
	ldr r0, _08082678 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	b _080826A6
	.align 2, 0
_08082674: .4byte gTrainerBattleOpponent
_08082678: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_0808267C:
	ldr r0, _08082690 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082698
	ldr r0, _08082694 @ =c2_whiteout
	bl SetMainCallback2
	b _080826A6
	.align 2, 0
_08082690: .4byte gUnknown_02024D26
_08082694: .4byte c2_whiteout
_08082698:
	ldr r0, _080826AC @ =c2_exit_to_overworld_1_continue_scripts_restart_music
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
	ldr r1, _080826CC @ =gUnknown_020239F8
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _080826D0 @ =gMain
	ldr r0, _080826D4 @ =do_choose_name_or_words_screen
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
	ldr r0, _080826F8 @ =gTrainerBattleScriptReturnAddress
	ldr r0, [r0]
	cmp r0, 0
	bne _080826F4
	ldr r0, _080826FC @ =gUnknown_081C6C02
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
	ldr r0, _08082710 @ =gTrainerBattleEndScript
	ldr r0, [r0]
	cmp r0, 0
	bne _0808270C
	ldr r0, _08082714 @ =gUnknown_081C6C02
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
	ldr r0, _08082750 @ =gTrainerBattleMode
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08082802
	cmp r0, 0x8
	beq _08082802
	ldr r0, _08082754 @ =gTrainerBattleOpponent
	ldrh r0, [r0]
	bl sub_803FC58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bhi _080827FC
	lsls r0, 2
	ldr r1, _08082758 @ =_0808275C
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
	ldr r0, _080827A0 @ =0x00000197
	b _080827FE
	.align 2, 0
_080827A0: .4byte 0x00000197
_080827A4:
	ldr r0, _080827A8 @ =0x0000017b
	b _080827FE
	.align 2, 0
_080827A8: .4byte 0x0000017b
_080827AC:
	movs r0, 0xD0
	lsls r0, 1
	b _080827FE
_080827B2:
	ldr r0, _080827B8 @ =0x000001a1
	b _080827FE
	.align 2, 0
_080827B8: .4byte 0x000001a1
_080827BC:
	ldr r0, _080827C0 @ =0x000001a3
	b _080827FE
	.align 2, 0
_080827C0: .4byte 0x000001a3
_080827C4:
	ldr r0, _080827C8 @ =0x000001b9
	b _080827FE
	.align 2, 0
_080827C8: .4byte 0x000001b9
_080827CC:
	ldr r0, _080827D0 @ =0x00000181
	b _080827FE
	.align 2, 0
_080827D0: .4byte 0x00000181
_080827D4:
	ldr r0, _080827D8 @ =0x000001c1
	b _080827FE
	.align 2, 0
_080827D8: .4byte 0x000001c1
_080827DC:
	movs r0, 0xE1
	lsls r0, 1
	b _080827FE
_080827E2:
	ldr r0, _080827E8 @ =0x000001c3
	b _080827FE
	.align 2, 0
_080827E8: .4byte 0x000001c3
_080827EC:
	ldr r0, _080827F0 @ =0x000001c5
	b _080827FE
	.align 2, 0
_080827F0: .4byte 0x000001c5
_080827F4:
	ldr r0, _080827F8 @ =0x0000018d
	b _080827FE
	.align 2, 0
_080827F8: .4byte 0x0000018d
_080827FC:
	ldr r0, _08082808 @ =0x000001a7
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
	ldr r0, _08082818 @ =gOtherText_CancelWithTerminator
_08082814:
	pop {r1}
	bx r1
	.align 2, 0
_08082818: .4byte gOtherText_CancelWithTerminator
	thumb_func_end ReturnEmptyStringIfNull

	thumb_func_start sub_808281C
sub_808281C: @ 808281C
	push {lr}
	ldr r0, _0808282C @ =gTrainerIntroSpeech
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
	ldr r0, _08082844 @ =gTrainerBattleOpponent
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
	ldr r0, _08082864 @ =gTrainerDefeatSpeech
	ldr r0, [r0]
_0808284C:
	ldr r4, _08082868 @ =gStringVar4
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
	ldr r0, _0808287C @ =gTrainerVictorySpeech
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
	ldr r0, _08082890 @ =gTrainerCannotBattleSpeech
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
	ldr r0, _08082968 @ =gSaveBlock1 + 0x97A
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
	ldr r5, _080829D4 @ =gSaveBlock1 + 0x97A
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
	ldr r0, _08082A44 @ =gSaveBlock1
	ldr r2, _08082A48 @ =0x0000097a
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
	ldr r0, _08082A80 @ =gSaveBlock1
	ldr r2, _08082A84 @ =0x0000097a
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
	ldr r0, _08082B08 @ =gSaveBlock1
	ldr r2, _08082B0C @ =0x0000097a
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
	ldr r4, _08082B64 @ =gUnknown_0839B1F0
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
	ldr r0, _08082B94 @ =gSaveBlock1
	ldr r2, _08082B98 @ =0x00000978
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
	ldr r0, _08082BC0 @ =gSaveBlock1
	ldr r1, _08082BC4 @ =0x00000978
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
	ldr r0, _08082C00 @ =gTrainerEyeTrainers
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80828FC
	cmp r0, 0x1
	bne _08082BFA
	ldr r0, _08082C04 @ =gSaveBlock1
	ldr r1, _08082C08 @ =0x00000978
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
	ldr r0, _08082C28 @ =gTrainerEyeTrainers
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
	ldr r0, _08082C48 @ =gTrainerEyeTrainers
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
	ldr r0, _08082C64 @ =gTrainerEyeTrainers
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
	ldr r5, _08082C8C @ =gTrainerEyeTrainers
	ldr r4, _08082C90 @ =gTrainerBattleOpponent
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
	ldr r0, _08082CB0 @ =gTrainerEyeTrainers
	ldr r1, _08082CB4 @ =gTrainerBattleOpponent
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
	ldr r0, _08082CCC @ =gTrainerEyeTrainers
	ldr r1, _08082CD0 @ =gTrainerBattleOpponent
	ldrh r1, [r1]
	bl sub_8082AE4
	bl sub_808257C
	pop {r0}
	bx r0
	.align 2, 0
_08082CCC: .4byte gTrainerEyeTrainers
_08082CD0: .4byte gTrainerBattleOpponent
	thumb_func_end sub_8082CB8

	.align 2, 0 @ Don't pad with nop.
