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
	jump_if_move_id_eq_8 1, 0x081dab44
	jump_if_move_id_eq_8 3, 0x081dab60
	jump_if_move_id_eq_8 7, 0x081dab7a
	jump_if_move_id_eq_8 8, 0x081dabd8
	jump_if_move_id_eq_8 9, 0x081dabec
	jump_if_move_id_eq_8 10, 0x081dac70
	jump_if_move_id_eq_8 11, 0x081dacab
	jump_if_move_id_eq_8 12, 0x081dad11
	jump_if_move_id_eq_8 13, 0x081dad27
	jump_if_move_id_eq_8 14, 0x081dad62
	jump_if_move_id_eq_8 15, 0x081dadc8
	jump_if_move_id_eq_8 16, 0x081dade2
	jump_if_move_id_eq_8 17, 0x081dae7c
	jump_if_move_id_eq_8 18, 0x081daeac
	jump_if_move_id_eq_8 19, 0x081daefe
	jump_if_move_id_eq_8 20, 0x081daf35
	jump_if_move_id_eq_8 21, 0x081daf4b
	jump_if_move_id_eq_8 22, 0x081daf9f
	jump_if_move_id_eq_8 23, 0x081dafc0
	jump_if_move_id_eq_8 24, 0x081db054
	jump_if_move_id_eq_8 25, 0x081db075
	jump_if_move_id_eq_8 26, 0x081db138
	jump_if_move_id_eq_8 28, 0x081db142
	jump_if_move_id_eq_8 30, 0x081db17a
	jump_if_move_id_eq_8 32, 0x081db1ab
	jump_if_move_id_eq_8 33, 0x081db204
	jump_if_move_id_eq_8 35, 0x081db243
	jump_if_move_id_eq_8 37, 0x081db272
	jump_if_move_id_eq_8 38, 0x081db2d2
	jump_if_move_id_eq_8 39, 0x081dba6d
	jump_if_move_id_eq_8 40, 0x081db2d3
	jump_if_move_id_eq_8 42, 0x081db2dd
	jump_if_move_id_eq_8 43, 0x081db313
	jump_if_move_id_eq_8 49, 0x081db342
	jump_if_move_id_eq_8 50, 0x081dac70
	jump_if_move_id_eq_8 51, 0x081dacab
	jump_if_move_id_eq_8 52, 0x081dad11
	jump_if_move_id_eq_8 53, 0x081dad27
	jump_if_move_id_eq_8 54, 0x081dad62
	jump_if_move_id_eq_8 55, 0x081dadc8
	jump_if_move_id_eq_8 56, 0x081dade2
	jump_if_move_id_eq_8 58, 0x081daeac
	jump_if_move_id_eq_8 59, 0x081daefe
	jump_if_move_id_eq_8 60, 0x081daf35
	jump_if_move_id_eq_8 61, 0x081daf4b
	jump_if_move_id_eq_8 62, 0x081daf9f
	jump_if_move_id_eq_8 63, 0x081dafc0
	jump_if_move_id_eq_8 64, 0x081db054
	jump_if_move_id_eq_8 65, 0x081db364
	jump_if_move_id_eq_8 66, 0x081db394
	jump_if_move_id_eq_8 67, 0x081db3a5
	jump_if_move_id_eq_8 70, 0x081daf1f
	jump_if_move_id_eq_8 75, 0x081dba6d
	jump_if_move_id_eq_8 78, 0x081db3c2
	jump_if_move_id_eq_8 79, 0x081db3e5
	jump_if_move_id_eq_8 80, 0x081db47b
	jump_if_move_id_eq_8 84, 0x081db204
	jump_if_move_id_eq_8 86, 0x081db4a3
	jump_if_move_id_eq_8 89, 0x081db4c2
	jump_if_move_id_eq_8 90, 0x081db563
	jump_if_move_id_eq_8 91, 0x081db5cb
	jump_if_move_id_eq_8 92, 0x081db5f7
	jump_if_move_id_eq_8 94, 0x081db5fa
	jump_if_move_id_eq_8 97, 0x081db603
	jump_if_move_id_eq_8 98, 0x081db606
	jump_if_move_id_eq_8 99, 0x081db63c
	jump_if_move_id_eq_8 102, 0x081db681
	jump_if_move_id_eq_8 105, 0x081db698
	jump_if_move_id_eq_8 106, 0x081db2dd
	jump_if_move_id_eq_8 108, 0x081dade2
	jump_if_move_id_eq_8 109, 0x081db6bb
	jump_if_move_id_eq_8 111, 0x081db70a
	jump_if_move_id_eq_8 113, 0x081db7cb
	jump_if_move_id_eq_8 116, 0x081db7f9
	jump_if_move_id_eq_8 127, 0x081db817
	jump_if_move_id_eq_8 128, 0x081db8b3
	jump_if_move_id_eq_8 132, 0x081db191
	jump_if_move_id_eq_8 133, 0x081db191
	jump_if_move_id_eq_8 134, 0x081db191
	jump_if_move_id_eq_8 136, 0x081db8e9
	jump_if_move_id_eq_8 137, 0x081db928
	jump_if_move_id_eq_8 142, 0x081db951
	jump_if_move_id_eq_8 143, 0x081db960
	jump_if_move_id_eq_8 144, 0x081db9cd
	jump_if_move_id_eq_8 145, 0x081dba6d
	jump_if_move_id_eq_8 151, 0x081dba6d
	jump_if_move_id_eq_8 155, 0x081dba91
	jump_if_move_id_eq_8 157, 0x081db1ab
	jump_if_move_id_eq_8 158, 0x081dbb1b
	jump_if_move_id_eq_8 161, 0x081dbb1e
	jump_if_move_id_eq_8 162, 0x081db1ab
	jump_if_move_id_eq_8 164, 0x081dbb2f
	jump_if_move_id_eq_8 166, 0x081db33a
	jump_if_move_id_eq_8 168, 0x081dab7a
	jump_if_move_id_eq_8 169, 0x081dbb58
	jump_if_move_id_eq_8 170, 0x081dbb65
	jump_if_move_id_eq_8 171, 0x081dbbb4
	jump_if_move_id_eq_8 177, 0x081dbbc6
	jump_if_move_id_eq_8 178, 0x081dbc11
	jump_if_move_id_eq_8 182, 0x081dbc48
	jump_if_move_id_eq_8 183, 0x081dbc78
	jump_if_move_id_eq_8 184, 0x081dbcab
	jump_if_move_id_eq_8 185, 0x081dbcca
	jump_if_move_id_eq_8 186, 0x081dbcf8
	jump_if_move_id_eq_8 188, 0x081dbd0a
	jump_if_move_id_eq_8 189, 0x081dbd22
	jump_if_move_id_eq_8 190, 0x081dbd4e
	jump_if_move_id_eq_8 191, 0x081dbc11
	jump_if_move_id_eq_8 192, 0x081dbd76
	jump_if_move_id_eq_8 193, 0x081dbd87
	jump_if_move_id_eq_8 195, 0x081dbd96
	jump_if_move_id_eq_8 200, 0x081db313
	jump_if_move_id_eq_8 201, 0x081dbe00
	jump_if_move_id_eq_8 204, 0x081dbe26
	jump_if_move_id_eq_8 205, 0x081daefe
	jump_if_move_id_eq_8 206, 0x081dad62
	jump_if_move_id_eq_8 208, 0x081dacab
	jump_if_move_id_eq_8 209, 0x081db313
	jump_if_move_id_eq_8 210, 0x081dbe4e
	jump_if_move_id_eq_8 211, 0x081dad62
	jump_if_move_id_eq_8 212, 0x081dbe74
	ai_ret
	.incbin "baserom.gba", 0x001dab44, 0x1353

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
