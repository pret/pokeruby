	.include "asm/macros.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits
	
@ 0	won't use moves that have no or a negative effect
@ 1	will actually create some difference in viability scores based on basic calculations
@ 2	starts understanding things like type effectiveness, damage and fainting
@ 3	with a chance of about 3/10, some status moves will get priority on the first turn (list of move scripts at 081DBAA7)
@ 4	with a chance of about 5/10, move effects in this list will get priority (below list):
@ ----------------------------------------
@ sleep
@ selfdestruct
@ mirror move
@ 1-hit ko
@ high critical hit ratio
@ confuse
@ metronome
@ variable damage
@ counter
@ destiny bond
@ swagger
@ attract
@ present
@ may raise all stats
@ belly drum
@ mirror coat
@ focus punch
@ double damage if user was hurt in same turn
@ confuse all
@ -------------------------------------------
@ 5	with a chance of about 4/10, non-damaging moves will get priority
@ 6	if there are other pokes left on the ai's team, with a chance of a bit more than 6/10 it will give priority to non-damaging moves. chance raises to a bit more than 9/10 if the user (possibly also its ally) has baton pass
@ 7	nop
@ 8	ai will start looking at health percentages and decide using moves based on that
@ 9	broken/unfinished, does nothing
@ 10-28	nop
@ 29	roamer; will attempt to flee on the first turn
@ 30	safari
@ 31	unused; will flee on 20% health and lower

@ applies to the incbin directly below.

	.align 2
gUnknown_081DA01C:: @ 81DA01C
	.4byte Unknown_081DA09C
	.4byte Unknown_081DA86D
	.4byte Unknown_081DBE97
	.4byte Unknown_081DBEB5
	.4byte Unknown_081DBF17
	.4byte Unknown_081DBF07
	.4byte Unknown_081DBF3E
	.4byte Unknown_081DBF63
	.4byte Unknown_081DBF64
	.4byte Unknown_081DC0B9
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC115
	.4byte Unknown_081DC0D0
	.4byte Unknown_081DC0FE
	.4byte Unknown_081DC105

Unknown_081DA09C::
	.incbin "baserom.gba", 0x001da09c, 0x7B0

Unknown_081DA84C::
	viability_score 0xFF
	ai_ret
	viability_score 0xFE
	ai_ret
	viability_score 0xFD
	ai_ret
	viability_score 0xFB
	ai_ret
	viability_score 0xF8
	ai_ret
	viability_score 0xF6
	ai_ret
	viability_score 0xF4
	ai_ret
	viability_score 0x01
	ai_ret
	viability_score 0x02
	ai_ret
	viability_score 0x03
	ai_ret
	viability_score 0x05
	ai_ret

Unknown_081DA86D::
	.incbin "baserom.gba", 0x001da86d, 0x162A

Unknown_081DBE97::
	determine_move_damage_jump_if_fatal AI_jump1_081DBE97, 0x24
	jump_if__8_eq 0x01, Unknown_081DA84C
	ai_ret
AI_jump1_081DBE97:
	jump_if_move_id_eq_8 0x07, AI_ret_081DBE97
	jump_if_move_id_ne_8 0x67, viableScore_04_081DBE97
	viability_score 0x02
viableScore_04_081DBE97:
	viability_score 0x04
AI_ret_081DBE97:
	ai_ret

Unknown_081DBEB5::
	get_battle_turn_counter 0x14, AI_ret_081DBEB5
	move_get_move_script_id 0x1C, AI_data_081DBEB5, AI_ret_081DBEB5
	random_goto__high_param_likely 0x50, AI_ret_081DBEB5
	viability_score 0x02
AI_ret_081DBEB5:
	ai_ret
AI_data_081DBEB5:
	.byte 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18
	.byte 0x1E, 0x23, 0x36, 0x2F, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x3A, 0x3B
	.byte 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42, 0x43, 0x4F, 0x54, 0x6C, 0x6D, 0x76, 0xD5
	.byte 0xBB, 0x9C, 0xA5, 0xA6, 0xA7, 0xB5, 0xC0, 0xC7, 0xCD, 0xCE, 0xD0, 0xD3, 0xD5, 0xFF
Unknown_081DBF07::
	is_most_powerful_move 0x14, AI_ret_081DBF07
	random_goto__high_param_likely 0x64, AI_ret_081DBF07
	viability_score 0x02
AI_ret_081DBF07:
	ai_ret

Unknown_081DBF17::
	move_get_move_script_id 0x1C, AI_data_081DBF17, AI_ret_081DBF17
	random_goto__high_param_likely 0x80, AI_ret_081DBF17
	viability_score 0x02
AI_ret_081DBF17:
	ai_ret
AI_data_081DBF17:
	.byte 0x01, 0x07, 0x09, 0x26, 0x2B, 0x31, 0x53, 0x58, 0x59, 0x62
	.byte 0x76, 0x78, 0x7A, 0x8C, 0x8E, 0x90, 0xAA, 0xB9, 0xC7
	.byte 0xFF

Unknown_081DBF3E::
	count_alive_pokemon_on_team 0x01, 0x13, AI_ret_081DBF3E
	is_most_powerful_move 0x14, AI_ret_081DBF3E
	jump_if_move_with_same_movescript_in_either_0_2_history_or_1_3_moveset 0x01, 0x7F, AI_ranhigh_081DBF3E
	random_goto__high_param_likely 0x50, AI_ret_081DBF17
AI_ranhigh_081DBF3E:
	random_goto__high_param_likely 0x14, AI_ret_081DBF17
	viability_score 0x03
AI_ret_081DBF3E:
	ai_ret

Unknown_081DBF63::
	ai_ret

Unknown_081DBF64::
	jump_if_health_percentage_ge 0x01 0x46 AI_moveget_081DBF64
	jump_if_health_percentage_ge 0x01 0x1E AI_moveget2_081DBF64
	move_get_move_script_id 0x1B AI_data3_081DBF64 AI_highparam_081DBF64
	ai_jump AI_jumphealth_081DBF64
AI_moveget_081DBF64:
	move_get_move_script_id 0x1B AI_data1_081DBF64 AI_highparam_081DBF64
	ai_jump AI_jumphealth_081DBF64
AI_moveget2_081DBF64:
	move_get_move_script_id 0x1B AI_data2_081DBF64 AI_highparam_081DBF64
	ai_jump AI_jumphealth_081DBF64
AI_highparam_081DBF64:
	random_goto__high_param_likely 0x32 AI_jumphealth_081DBF64
	viability_score 0xFE
AI_jumphealth_081DBF64:
	jump_if_health_percentage_ge 0x00 0x46 AI_moveget3_081DBF64
	jump_if_health_percentage_ge 0x00 0x1E AI_moveget4_081DBF64
	move_get_move_script_id 0x1B AI_data6_081DBF64 AI_highparam2_081DBF64
	ai_jump AI_ret_081DBF64
AI_moveget3_081DBF64:
	move_get_move_script_id 0x1B AI_data4_081DBF64 AI_highparam2_081DBF64
	ai_jump AI_ret_081DBF64
AI_moveget4_081DBF64:
	move_get_move_script_id 0x1B AI_data5_081DBF64 AI_highparam2_081DBF64
	ai_jump AI_ret_081DBF64
AI_highparam2_081DBF64:
	random_goto__high_param_likely 0x32 AI_ret_081DBF64
	viability_score 0xFE
AI_ret_081DBF64:
	ai_ret

AI_data1_081DBF64: @ 0x081DBFEB
	.byte 0x07, 0x20, 0x25, 0x62, 0x63, 0x74, 0x84, 0x85, 0x86, 0x9d, 0xa8, 0xc2, 0xcc, 0xff
	
AI_data2_081DBF64: @ 0x081DBFF9
	.byte 0x07, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x1a, 0x1e, 0x23, 0x2e, 0x2f, 0x32, 0x33
	.byte 0x34, 0x35, 0x36, 0x37, 0x38, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x5d, 0x7c, 0x8e, 0xcd, 0xce, 0xd0, 0xd3, 0xd4, 0xff
	
AI_data3_081DBF64: @ 0x081DC024
	.byte 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x1a, 0x1e, 0x23, 0x2e, 0x2f, 0x32, 0x33, 0x34, 0x35, 0x36
	.byte 0x37, 0x38, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x51, 0x5d, 0x5e, 0x7c, 0x8e, 0x8f, 0x90, 0x97, 0xbe, 0xcd, 0xce, 0xd0, 0xd3, 0xd4, 0xff
	
AI_data4_081DBF64: @ 0x081DC054
	.byte 0xff
	
AI_data5_081DBF64: @ 0x081DC055
	.byte 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x2e, 0x2f, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e
	.byte 0x3f, 0x40, 0x42, 0x5b, 0x72, 0x7c, 0xcd, 0xce, 0xd0, 0xd3, 0xd4, 0xff
	
AI_data6_081DBF64: @ 0x081DC07D
	.byte 0x01, 0x07, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x1a, 0x1e, 0x21, 0x23, 0x26, 0x28
	.byte 0x28, 0x2e, 0x2f, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x42, 0x43, 0x5b, 0x5d
	.byte 0x5e, 0x64, 0x72, 0x76, 0x77, 0x78, 0x7c, 0x8f, 0x90, 0xa7, 0xcd, 0xce, 0xd0, 0xd3, 0xd4, 0xff

Unknown_081DC0B9::
	jump_if_move_id_ne_8 0x89, AI_ret_081DC0B9
	jump_if__8_eq 0x00, AI_ret_081DC0B9
	enter_battle_countdown_get_state 0x01, 0x13, AI_ret_081DC0B9
	viability_score 0x05
AI_ret_081DC0B9:
	ai_ret

Unknown_081DC0D0::
	jump_if_any_status2_bit 0x01, 0x0000E000, AI_ret_081DC0D0
	jump_if_any_status2_bit 0x01, 0x04000000, AI_ret_081DC0D0
	get_ability 0x00
	jump_if__8_eq 0x17, AI_ret_081DC0D0
	get_ability 0x01
	jump_if__8_eq 0x1A, AI_bitmask_081DC0D0
	get_ability 0x00
	jump_if__8_eq 0x47, AI_ret_081DC0D0
AI_bitmask_081DC0D0:
	f10_or_b1011
AI_ret_081DC0D0:
	ai_ret

Unknown_081DC0FE::
	jump_random_unknown AI_bitmask_081DC0FE
	f10_or_b1101
AI_bitmask_081DC0FE:
	f10_or_b1011

Unknown_081DC105::
	jump_if_health_percentage_eq 0x00, 0x14, AI_bitmask_081DC105
	jump_if_health_percentage_lt 0x00, 0x14, AI_bitmask_081DC105
	ai_ret
AI_bitmask_081DC105:
	f10_or_b1011

Unknown_081DC115::
	ai_ret
