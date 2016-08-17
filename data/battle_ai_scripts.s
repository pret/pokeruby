	.include "asm/macros.s"
	.include "constants/constants.s"

	.section script_data, "aw", %progbits
	
@ 0	won't use moves that have no or a negative effect (CheckForBadMove)
@ 1	will actually create some difference in viability scores based on basic calculations (CheckViability)
@ 2	starts understanding things like type effectiveness, damage and fainting (CheckTypeAndDamage)
@ 3	with a chance of about 3/10, some status moves will get priority on the first turn (TryForStatusMove)
@ 4	with a chance of about 5/10, move effects in this list will get priority (TryForMoveEffect):
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
@ 5	with a chance of about 4/10, non-damaging moves will get priority (TryForNonDamagingMove)
@ 6	if there are other pokes left on the ai's team, with a chance of a bit more than 6/10 it will give priority to non-damaging moves. chance raises to a bit more than 9/10 if the user (possibly also its ally) has baton pass
@ (TryForNonDamagingMoveWhenThreatened)
@ 7	nop (AI_nop)
@ 8	ai will start looking at health percentages and decide using moves based on that (CheckForMovesWhenThreatened)
@ 9	broken/unfinished, does nothing (AI_unknown)
@ 10-28	nop (AI_nop2)
@ 29	roamer; will attempt to flee on the first turn (RoamingLogic)
@ 30	safari (SafariLogic)
@ 31	unused; will flee on 20% health and lower (Unused_WildRunningLogic)

@ applies to the incbin directly below.

	.align 2
gUnknown_081DA01C:: @ 81DA01C
	.4byte CheckForBadMove
	.4byte CheckViability
	.4byte CheckTypeAndDamage
	.4byte TryForStatusMove
	.4byte TryForMoveEffect
	.4byte TryForNonDamagingMove
	.4byte TryForNonDamagingMoveWhenThreatened
	.4byte AI_nop
	.4byte TryMovesWhenThreatened
	.4byte AI_unknown
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte AI_nop2
	.4byte RoamingLogic
	.4byte SafariLogic
	.4byte Unused_WildRunningLogic

CheckForBadMove::
	.incbin "baserom.gba", 0x001da09c, 0x7B0

Unknown_081DA84C::
	viability_score 0xFF
	ai_ret
AI_viabilityFE_081DA84C:
	viability_score 0xFE
	ai_ret
AI_viabilityFD_081DA84C:
	viability_score 0xFD
	ai_ret
AI_viabilityFB_081DA84C:
	viability_score 0xFB
	ai_ret
AI_viabilityF8_081DA84C:
	viability_score 0xF8
	ai_ret
AI_viabilityF6_081DA84C:
	viability_score 0xF6
	ai_ret
AI_viabilityF4_081DA84C:
	viability_score 0xF4
	ai_ret
AI_viability01_081DA84C:
	viability_score 0x01
	ai_ret
AI_viability02_081DA84C:
	viability_score 0x02
	ai_ret
AI_viability03_081DA84C:
	viability_score 0x03
	ai_ret
AI_viability05_081DA84C:
	viability_score 0x05
	ai_ret

CheckViability::
	jump_if_move_id_eq_8 1, AI_movejump1_081DA86D
	jump_if_move_id_eq_8 3, AI_movejump3_081DAB60
	jump_if_move_id_eq_8 7, AI_movejump7_081DAB7A
	jump_if_move_id_eq_8 8, AI_movejump8_081DABD8
	jump_if_move_id_eq_8 9, AI_movejump9_081DABEC
	jump_if_move_id_eq_8 10, AI_movejump10_081DAC70
	jump_if_move_id_eq_8 11, AI_movejump11_081DACAB
	jump_if_move_id_eq_8 12, AI_movejump12_081DAD11
	jump_if_move_id_eq_8 13, AI_movejump13_081DAD27
	jump_if_move_id_eq_8 14, AI_movejump14_081DAD62
	jump_if_move_id_eq_8 15, AI_movejump15_081DADC8
	jump_if_move_id_eq_8 16, AI_movejump16_081DADE2
	jump_if_move_id_eq_8 17, AI_movejump17_081DAE7C
	jump_if_move_id_eq_8 18, AI_movejump18_081DAEAC
	jump_if_move_id_eq_8 19, AI_movejump19_081DAEFE
	jump_if_move_id_eq_8 20, AI_movejump20_081DAF35
	jump_if_move_id_eq_8 21, AI_movejump21_081DAF4B
	jump_if_move_id_eq_8 22, AI_movejump22_081DAF9F
	jump_if_move_id_eq_8 23, AI_movejump23_081DAFC0
	jump_if_move_id_eq_8 24, AI_movejump24_081DB054
	jump_if_move_id_eq_8 25, AI_movejump25_081DB075
	jump_if_move_id_eq_8 26, AI_movejump26_081DB138
	jump_if_move_id_eq_8 28, AI_movejump28_081DB142
	jump_if_move_id_eq_8 30, AI_movejump30_081DB17A
	jump_if_move_id_eq_8 32, AI_movejump32_081DB1AB
	jump_if_move_id_eq_8 33, AI_movejump33_081DB204
	jump_if_move_id_eq_8 35, AI_movejump35_081DB243
	jump_if_move_id_eq_8 37, AI_movejump37_081DB272
	jump_if_move_id_eq_8 38, AI_movejump38_081DB2D2
	jump_if_move_id_eq_8 39, AI_movejump39_081DBA6D
	jump_if_move_id_eq_8 40, AI_movejump40_081DB2D3
	jump_if_move_id_eq_8 42, AI_movejump42_081DB2DD
	jump_if_move_id_eq_8 43, AI_movejump43_081DB313
	jump_if_move_id_eq_8 49, AI_movejump49_081DB342
	jump_if_move_id_eq_8 50, AI_movejump10_081DAC70
	jump_if_move_id_eq_8 51, AI_movejump11_081DACAB
	jump_if_move_id_eq_8 52, AI_movejump12_081DAD11
	jump_if_move_id_eq_8 53, AI_movejump13_081DAD27
	jump_if_move_id_eq_8 54, AI_movejump14_081DAD62
	jump_if_move_id_eq_8 55, AI_movejump15_081DADC8
	jump_if_move_id_eq_8 56, AI_movejump16_081DADE2
	jump_if_move_id_eq_8 58, AI_movejump18_081DAEAC
	jump_if_move_id_eq_8 59, AI_movejump19_081DAEFE
	jump_if_move_id_eq_8 60, AI_movejump20_081DAF35
	jump_if_move_id_eq_8 61, AI_movejump21_081DAF4B
	jump_if_move_id_eq_8 62, AI_movejump22_081DAF9F
	jump_if_move_id_eq_8 63, AI_movejump23_081DAFC0
	jump_if_move_id_eq_8 64, AI_movejump24_081DB054
	jump_if_move_id_eq_8 65, AI_movejump65_081DB364
	jump_if_move_id_eq_8 66, AI_movejump66_081DB394
	jump_if_move_id_eq_8 67, AI_movejump67_081DB3A5
	jump_if_move_id_eq_8 70, AI_movejump70_081DAF1F
	jump_if_move_id_eq_8 75, AI_movejump39_081DBA6D
	jump_if_move_id_eq_8 78, AI_movejump78_081DB3C2
	jump_if_move_id_eq_8 79, AI_movejump79_081DB3E5
	jump_if_move_id_eq_8 80, AI_movejump80_081DB47B
	jump_if_move_id_eq_8 84, AI_movejump33_081DB204
	jump_if_move_id_eq_8 86, AI_movejump86_081DB4A3
	jump_if_move_id_eq_8 89, AI_movejump89_081DB4C2
	jump_if_move_id_eq_8 90, AI_movejump90_081DB563
	jump_if_move_id_eq_8 91, AI_movejump91_081DB5CB
	jump_if_move_id_eq_8 92, AI_movejump92_081DB5F7
	jump_if_move_id_eq_8 94, AI_movejump94_081DB5FA
	jump_if_move_id_eq_8 97, AI_movejump97_081DB603
	jump_if_move_id_eq_8 98, AI_movejump98_081DB606
	jump_if_move_id_eq_8 99, AI_movejump99_081DB63C
	jump_if_move_id_eq_8 102, AI_movejump102_081DB681
	jump_if_move_id_eq_8 105, AI_movejump105_081DB698
	jump_if_move_id_eq_8 106, AI_movejump42_081DB2DD
	jump_if_move_id_eq_8 108, AI_movejump16_081DADE2
	jump_if_move_id_eq_8 109, AI_movejump109_081DB6BB
	jump_if_move_id_eq_8 111, AI_movejump111_081DB70A
	jump_if_move_id_eq_8 113, AI_movejump113_081DB7CB
	jump_if_move_id_eq_8 116, AI_movejump116_081DB7F9
	jump_if_move_id_eq_8 127, AI_movejump127_081DB817
	jump_if_move_id_eq_8 128, AI_movejump128_081DB8B3
	jump_if_move_id_eq_8 132, AI_movejump132_081DB191
	jump_if_move_id_eq_8 133, AI_movejump132_081DB191
	jump_if_move_id_eq_8 134, AI_movejump132_081DB191
	jump_if_move_id_eq_8 136, AI_movejump136_081DB8E9
	jump_if_move_id_eq_8 137, AI_movejump137_081DB928
	jump_if_move_id_eq_8 142, AI_movejump142_081DB951
	jump_if_move_id_eq_8 143, AI_movejump143_081DB960
	jump_if_move_id_eq_8 144, AI_movejump144_081DB9CD
	jump_if_move_id_eq_8 145, AI_movejump39_081DBA6D
	jump_if_move_id_eq_8 151, AI_movejump39_081DBA6D
	jump_if_move_id_eq_8 155, AI_movejump155_081DBA91
	jump_if_move_id_eq_8 157, AI_movejump32_081DB1AB
	jump_if_move_id_eq_8 158, AI_movejump158_081DBB1B
	jump_if_move_id_eq_8 161, AI_movejump161_081DBB1E
	jump_if_move_id_eq_8 162, AI_movejump32_081DB1AB
	jump_if_move_id_eq_8 164, AI_movejump164_081DBB2F
	jump_if_move_id_eq_8 166, AI_movejump166_081DB33A
	jump_if_move_id_eq_8 168, AI_movejump7_081DAB7A
	jump_if_move_id_eq_8 169, AI_movejump169_081DBB58
	jump_if_move_id_eq_8 170, AI_movejump170_081DBB65
	jump_if_move_id_eq_8 171, AI_movejump171_081DBBB4
	jump_if_move_id_eq_8 177, AI_movejump177_081DBBC6
	jump_if_move_id_eq_8 178, AI_movejump178_081DBC11
	jump_if_move_id_eq_8 182, AI_movejump182_081DBC48
	jump_if_move_id_eq_8 183, AI_movejump183_081DBC78
	jump_if_move_id_eq_8 184, AI_movejump184_081DBCAB
	jump_if_move_id_eq_8 185, AI_movejump185_081DBCCA
	jump_if_move_id_eq_8 186, AI_movejump186_081DBCF8
	jump_if_move_id_eq_8 188, AI_movejump188_081DBD0A
	jump_if_move_id_eq_8 189, AI_movejump189_081DBD22
	jump_if_move_id_eq_8 190, AI_movejump190_081DBD4E
	jump_if_move_id_eq_8 191, AI_movejump178_081DBC11
	jump_if_move_id_eq_8 192, AI_movejump192_081DBD76
	jump_if_move_id_eq_8 193, AI_movejump193_081DBD87
	jump_if_move_id_eq_8 195, AI_movejump195_081DBD96
	jump_if_move_id_eq_8 200, AI_movejump43_081DB313
	jump_if_move_id_eq_8 201, AI_movejump201_081DBE00
	jump_if_move_id_eq_8 204, AI_movejump204_081DBE26
	jump_if_move_id_eq_8 205, AI_movejump19_081DAEFE
	jump_if_move_id_eq_8 206, AI_movejump14_081DAD62
	jump_if_move_id_eq_8 208, AI_movejump11_081DACAB
	jump_if_move_id_eq_8 209, AI_movejump43_081DB313
	jump_if_move_id_eq_8 210, AI_movejump210_081DBE4E
	jump_if_move_id_eq_8 211, AI_movejump14_081DAD62
	jump_if_move_id_eq_8 212, AI_movejump212_081DBE74
	ai_ret
AI_movejump1_081DA86D:
	jump_if_move_with_same_movescript_in_either_0_2_history_or_1_3_moveset 0x00 0x08 AI_highparam_move1
	jump_if_move_with_same_movescript_in_either_0_2_history_or_1_3_moveset 0x00 0x6B AI_highparam_move1
	ai_jump AI_ret_move1
AI_highparam_move1:
	random_goto__high_param_likely 0x80 AI_ret_move1
	viability_score 0x01
AI_ret_move1:
	ai_ret
AI_movejump3_081DAB60:
	simulate_damage_bonus_jump_if_eq 0x14 AI_highparam_move3
	simulate_damage_bonus_jump_if_eq 0x0A AI_highparam_move3
	ai_jump AI_ret_move3
AI_highparam_move3:
	random_goto__high_param_likely 0x32 AI_ret_move3
	viability_score 0xFD
AI_ret_move3:
	ai_ret
AI_movejump7_081DAB7A:
	jump_if_stat_buff_lt 0x00 0x07 0x07 AI_healthcheck_move7
	viability_score 0xFF
	jump_if_stat_buff_lt 0x00 0x07 0x0A AI_healthcheck_move7
	random_goto__high_param_likely 0x80 AI_healthcheck_move7
	viability_score 0xFF
AI_healthcheck_move7:
	jump_if_health_percentage_lt 0x01 0x50 AI_healthcheck2_move7
	jump_if_move_would_hit_first 0x01 AI_healthcheck2_move7
	random_goto__high_param_likely 0x32 AI_ret_move7
	ai_jump AI_viabilityFD_081DA84C
AI_healthcheck2_move7:
	jump_if_health_percentage_ge 0x01 0x32 AI_highparam_move7
	random_goto__high_param_likely 0x80 AI_healthcheck3_move7
	viability_score 0x01
AI_healthcheck3_move7:
	jump_if_health_percentage_ge 0x01 0x1E AI_ret_move7
	random_goto__high_param_likely 0x32 AI_ret_move7
	viability_score 0x01
	ai_jump AI_ret_move7
AI_highparam_move7:
	random_goto__high_param_likely 0x32 AI_ret_move7
	viability_score 0xFF
AI_ret_move7:
	ai_ret
AI_movejump8_081DABD8:
	simulate_damage_bonus_jump_if_eq 0x0A AI_viability_move8
	simulate_damage_bonus_jump_if_eq 0x14 AI_viability_move8
	ai_jump AI_ret_move8
AI_viability_move8:
	viability_score 0xFF
AI_ret_move8:
	ai_ret

AI_movejump9_081DABEC:
	jump_if_move_would_hit_first 0x01 AI_moveexec_081DABEC
	get_move_to_execute_B 0x00
	jump_if__8_not_in_list_16 AI_movedata_081DABEC AI_moveexec_081DABEC
	random_goto__high_param_likely 0x80 AI_ret_081DABEC
	viability_score 0x02
	ai_jump AI_ret_081DABEC
AI_moveexec_081DABEC:
	get_move_to_execute_B 0x00
	jump_if__8_in_list_16 AI_movedata_081DABEC AI_ret_081DABEC
	random_goto__high_param_likely 0x50 AI_ret_081DABEC
	viability_score 0xFF
AI_ret_081DABEC:
	ai_ret

	.align 2
AI_movedata_081DABEC: @ these are moves. label later, no move constants
	.2byte MOVE_SLEEP_POWDER
	.2byte MOVE_LOVELY_KISS
	.2byte MOVE_SPORE
	.2byte MOVE_HYPNOSIS
	.2byte MOVE_SING
	.2byte MOVE_GRASS_WHISTLE
	.2byte MOVE_SHADOW_PUNCH
	.2byte MOVE_SAND_ATTACK
	.2byte MOVE_SMOKESCREEN
	.2byte MOVE_TOXIC
	.2byte MOVE_GUILLOTINE
	.2byte MOVE_HORN_DRILL
	.2byte MOVE_FISSURE
	.2byte MOVE_SHEER_COLD
	.2byte MOVE_CROSS_CHOP
	.2byte MOVE_AEROBLAST
	.2byte MOVE_CONFUSE_RAY
	.2byte MOVE_SWEET_KISS
	.2byte MOVE_SCREECH
	.2byte MOVE_COTTON_SPORE
	.2byte MOVE_SCARY_FACE
	.2byte MOVE_FAKE_TEARS
	.2byte MOVE_METAL_SOUND
	.2byte MOVE_THUNDER_WAVE
	.2byte MOVE_GLARE
	.2byte MOVE_POISON_POWDER
	.2byte MOVE_SHADOW_BALL
	.2byte MOVE_DYNAMIC_PUNCH
	.2byte MOVE_HYPER_BEAM
	.2byte MOVE_EXTREME_SPEED
	.2byte MOVE_THIEF
	.2byte MOVE_COVET
	.2byte MOVE_ATTRACT
	.2byte MOVE_SWAGGER
	.2byte MOVE_TORMENT
	.2byte MOVE_FLATTER
	.2byte MOVE_TRICK
	.2byte MOVE_SUPERPOWER
	.2byte MOVE_SKILL_SWAP
	.2byte 0xFFFF @ terminator

AI_movejump10_081DAC70:
	jump_if_stat_buff_lt 0x01 0x01 0x09 AI_healthcheck_move10
	random_goto__high_param_likely 0x64 AI_healthcheck2_move10
	viability_score 0xFF
	ai_jump AI_healthcheck2_move10
AI_healthcheck_move10:
	jump_if_health_percentage_ne 0x01 0x64 AI_healthcheck2_move10
	random_goto__high_param_likely 0x80 AI_healthcheck2_move10
	viability_score 0x02
AI_healthcheck2_move10:
	jump_if_health_percentage_ge 0x01 0x46 AI_ret_move10
	jump_if_health_percentage_lt 0x01 0x28 AI_viability_move10
	random_goto__high_param_likely 0x28 AI_ret_move10
AI_viability_move10:
	viability_score 0xFE
AI_ret_move10:
	ai_ret

AI_movejump11_081DACAB:
	jump_if_stat_buff_lt 0x01 0x02 0x09 AI_healthcheck_move11
	random_goto__high_param_likely 0x64 AI_healthcheck2_move11
	viability_score 0xFF
	ai_jump AI_healthcheck2_move11
AI_healthcheck_move11:
	jump_if_health_percentage_ne 0x01 0x64 AI_healthcheck2_move11
	random_goto__high_param_likely 0x80 AI_healthcheck2_move11
	viability_score 0x02
AI_healthcheck2_move11:
	jump_if_health_percentage_lt 0x01 0x46 AI_healthcheck3_move11
	random_goto__high_param_likely 0xC8 AI_ret_move11
AI_healthcheck3_move11:
	jump_if_health_percentage_lt 0x01 0x28 AI_viability_move11
	get_move_to_execute_B 0x00
	move_get_power__8_8 
	jump_if__8_eq 0x00 AI_highparam_move11
	get_move_to_execute_B 0x00
	move_get_type__8 
	jump_if__8_not_in_list_8 AI_data_move11 AI_viability_move11
	random_goto__high_param_likely 0x3C AI_ret_move11
AI_highparam_move11:
	random_goto__high_param_likely 0x3C AI_ret_move11
AI_viability_move11:
	viability_score 0xFE
AI_ret_move11:
	ai_ret
AI_data_move11:
	.byte 0x00, 0x01, 0x03, 0x04, 0x02, 0x05, 0x06, 0x07, 0x08
	.byte 0xFF

AI_movejump12_081DAD11:
	.incbin "baserom.gba", 0x001dad11, 0x16
AI_movejump13_081DAD27:
	.incbin "baserom.gba", 0x001dad27, 0x3B
AI_movejump14_081DAD62:
	.incbin "baserom.gba", 0x001dad62, 0x66
AI_movejump15_081DADC8:
	.incbin "baserom.gba", 0x001dadc8, 0x1A

AI_movejump16_081DADE2:
	.incbin "baserom.gba", 0x001dade2, 0x9A
AI_movejump17_081DAE7C:
	.incbin "baserom.gba", 0x001dae7c, 0x30
AI_movejump18_081DAEAC:
	.incbin "baserom.gba", 0x001daeac, 0x52
AI_movejump19_081DAEFE:
	.incbin "baserom.gba", 0x001daefe, 0x21
AI_movejump70_081DAF1F:
	.incbin "baserom.gba", 0x001daf1f, 0x16
AI_movejump20_081DAF35:
	.incbin "baserom.gba", 0x001daf35, 0x16
AI_movejump21_081DAF4B:
	.incbin "baserom.gba", 0x001daf4b, 0x54
AI_movejump22_081DAF9F:
	.incbin "baserom.gba", 0x001daf9f, 0x21

AI_movejump23_081DAFC0:
	.incbin "baserom.gba", 0x001dafc0, 0x94
AI_movejump24_081DB054:
	.incbin "baserom.gba", 0x001db054, 0x21
AI_movejump25_081DB075:
	.incbin "baserom.gba", 0x001db075, 0xC3
AI_movejump26_081DB138:
	.incbin "baserom.gba", 0x001db138, 0xA
AI_movejump28_081DB142:
	.incbin "baserom.gba", 0x001db142, 0x38
AI_movejump30_081DB17A:
	.incbin "baserom.gba", 0x001db17a, 0x17
AI_movejump132_081DB191:
	.incbin "baserom.gba", 0x001db191, 0x1A
AI_movejump32_081DB1AB:
	.incbin "baserom.gba", 0x001db1ab, 0x59

AI_movejump33_081DB204:
	.incbin "baserom.gba", 0x001db204, 0x3F
AI_movejump35_081DB243:
	.incbin "baserom.gba", 0x001db243, 0x2F
AI_movejump37_081DB272:
	.incbin "baserom.gba", 0x001db272, 0x60
AI_movejump38_081DB2D2:
	.incbin "baserom.gba", 0x001db2d2, 0x1
AI_movejump40_081DB2D3:
	.incbin "baserom.gba", 0x001db2d3, 0xA
AI_movejump42_081DB2DD:
	.incbin "baserom.gba", 0x001db2dd, 0x36
AI_movejump43_081DB313:
	.incbin "baserom.gba", 0x001db313, 0x27
AI_movejump166_081DB33A:
	.incbin "baserom.gba", 0x001db33a, 0x8

AI_movejump49_081DB342:
	.incbin "baserom.gba", 0x001db342, 0x22
AI_movejump65_081DB364:
	.incbin "baserom.gba", 0x001db364, 0x30
AI_movejump66_081DB394:
	.incbin "baserom.gba", 0x001db394, 0x11
AI_movejump67_081DB3A5:
	.incbin "baserom.gba", 0x001db3a5, 0x1D
AI_movejump78_081DB3C2:
	.incbin "baserom.gba", 0x001db3c2, 0x23
AI_movejump79_081DB3E5:
	.incbin "baserom.gba", 0x001db3e5, 0x96
AI_movejump80_081DB47B:
	.incbin "baserom.gba", 0x001db47b, 0x28
AI_movejump86_081DB4A3:
	.incbin "baserom.gba", 0x001db4a3, 0x1F

AI_movejump89_081DB4C2:
	.incbin "baserom.gba", 0x001db4c2, 0xA1
AI_movejump90_081DB563:
	.incbin "baserom.gba", 0x001db563, 0x68
AI_movejump91_081DB5CB:
	.incbin "baserom.gba", 0x001db5cb, 0x2C
AI_movejump92_081DB5F7:
	.incbin "baserom.gba", 0x001db5f7, 0x3
AI_movejump94_081DB5FA:
	.incbin "baserom.gba", 0x001db5fa, 0x9
AI_movejump97_081DB603:
	.incbin "baserom.gba", 0x001db603, 0x3
AI_movejump98_081DB606:
	.incbin "baserom.gba", 0x001db606, 0x36
AI_movejump99_081DB63C:
	.incbin "baserom.gba", 0x001db63c, 0x45

AI_movejump102_081DB681:
	.incbin "baserom.gba", 0x001db681, 0x17
AI_movejump105_081DB698:
	.incbin "baserom.gba", 0x001db698, 0x23
AI_movejump109_081DB6BB:
	.incbin "baserom.gba", 0x001db6bb, 0x4F
AI_movejump111_081DB70A:
	.incbin "baserom.gba", 0x001db70a, 0xC1
AI_movejump113_081DB7CB:
	.incbin "baserom.gba", 0x001db7cb, 0x2E
AI_movejump116_081DB7F9:
	.incbin "baserom.gba", 0x001db7f9, 0x1E
AI_movejump127_081DB817:
	.incbin "baserom.gba", 0x001db817, 0x9C
AI_movejump128_081DB8B3:
	.incbin "baserom.gba", 0x001db8b3, 0x36

AI_movejump136_081DB8E9:
	.incbin "baserom.gba", 0x001db8e9, 0x3F
AI_movejump137_081DB928:
	.incbin "baserom.gba", 0x001db928, 0x29
AI_movejump142_081DB951:
	.incbin "baserom.gba", 0x001db951, 0xF
AI_movejump143_081DB960:
	.incbin "baserom.gba", 0x001db960, 0x6D
AI_movejump144_081DB9CD:
	.incbin "baserom.gba", 0x001db9cd, 0xA0
AI_movejump39_081DBA6D:
	.incbin "baserom.gba", 0x001dba6d, 0x24
AI_movejump155_081DBA91:
	.incbin "baserom.gba", 0x001dba91, 0x8A
AI_movejump158_081DBB1B:
	.incbin "baserom.gba", 0x001dbb1b, 0x3

AI_movejump161_081DBB1E:
	.incbin "baserom.gba", 0x001dbb1e, 0x11
AI_movejump164_081DBB2F:
	.incbin "baserom.gba", 0x001dbb2f, 0x29
AI_movejump169_081DBB58:
	.incbin "baserom.gba", 0x001dbb58, 0xD
AI_movejump170_081DBB65:
	.incbin "baserom.gba", 0x001dbb65, 0x4F
AI_movejump171_081DBBB4:
	.incbin "baserom.gba", 0x001dbbb4, 0x12
AI_movejump177_081DBBC6:
	.incbin "baserom.gba", 0x001dbbc6, 0x4B
AI_movejump178_081DBC11:
	.incbin "baserom.gba", 0x001dbc11, 0x37
AI_movejump182_081DBC48:
	.incbin "baserom.gba", 0x001dbc48, 0x30

AI_movejump183_081DBC78:
	.incbin "baserom.gba", 0x001dbc78, 0x33
AI_movejump184_081DBCAB:
	.incbin "baserom.gba", 0x001dbcab, 0x1F
AI_movejump185_081DBCCA:
	.incbin "baserom.gba", 0x001dbcca, 0x2E
AI_movejump186_081DBCF8:
	.incbin "baserom.gba", 0x001dbcf8, 0x12
AI_movejump188_081DBD0A:
	.incbin "baserom.gba", 0x001dbd0a, 0x18
AI_movejump189_081DBD22:
	.incbin "baserom.gba", 0x001dbd22, 0x2C
AI_movejump190_081DBD4E:
	.incbin "baserom.gba", 0x001dbd4e, 0x28
AI_movejump192_081DBD76:
	.incbin "baserom.gba", 0x001dbd76, 0x11

AI_movejump193_081DBD87:
	.incbin "baserom.gba", 0x001dbd87, 0xF
AI_movejump195_081DBD96:
	.incbin "baserom.gba", 0x001dbd96, 0x6A
AI_movejump201_081DBE00:
	.incbin "baserom.gba", 0x001dbe00, 0x26
AI_movejump204_081DBE26:
	.incbin "baserom.gba", 0x001dbe26, 0x28
AI_movejump210_081DBE4E:
	.incbin "baserom.gba", 0x001dbe4e, 0x26
AI_movejump212_081DBE74:
	.incbin "baserom.gba", 0x001dbe74, 0x23

CheckTypeAndDamage::
	determine_move_damage_jump_if_fatal AI_jump1_081DBE97
	is_most_powerful_move
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

TryForStatusMove::
	get_battle_turn_counter
	jump_if__8_ne_8 0x00 AI_ret_081DBEB5
	move_get_move_script_id
	jump_if__8_not_in_list_8 AI_data_081DBEB5, AI_ret_081DBEB5
	random_goto__high_param_likely 0x50, AI_ret_081DBEB5
	viability_score 0x02
AI_ret_081DBEB5:
	ai_ret
AI_data_081DBEB5:
	.byte 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18
	.byte 0x1E, 0x23, 0x36, 0x2F, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x3A, 0x3B
	.byte 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42, 0x43, 0x4F, 0x54, 0x6C, 0x6D, 0x76, 0xD5
	.byte 0xBB, 0x9C, 0xA5, 0xA6, 0xA7, 0xB5, 0xC0, 0xC7, 0xCD, 0xCE, 0xD0, 0xD3, 0xD5, 0xFF

TryForNonDamagingMove::
	is_most_powerful_move
	jump_if__8_ne_8 0x00 AI_ret_081DBF07
	random_goto__high_param_likely 0x64, AI_ret_081DBF07
	viability_score 0x02
AI_ret_081DBF07:
	ai_ret

TryForMoveEffect::
	move_get_move_script_id
	jump_if__8_not_in_list_8 AI_data_081DBF17, AI_ret_081DBF17
	random_goto__high_param_likely 0x80, AI_ret_081DBF17
	viability_score 0x02
AI_ret_081DBF17:
	ai_ret
AI_data_081DBF17:
	.byte 0x01, 0x07, 0x09, 0x26, 0x2B, 0x31, 0x53, 0x58, 0x59, 0x62
	.byte 0x76, 0x78, 0x7A, 0x8C, 0x8E, 0x90, 0xAA, 0xB9, 0xC7
	.byte 0xFF

TryForNonDamagingMoveWhenThreatened::
	count_alive_pokemon_on_team 0x01
	jump_if__8_eq 0x00 AI_ret_081DBF3E
	is_most_powerful_move
	jump_if__8_ne_8 0x00 AI_ret_081DBF3E
	jump_if_move_with_same_movescript_in_either_0_2_history_or_1_3_moveset 0x01, 0x7F, AI_ranhigh_081DBF3E
	random_goto__high_param_likely 0x50, AI_ret_081DBF17
AI_ranhigh_081DBF3E:
	random_goto__high_param_likely 0x14, AI_ret_081DBF17
	viability_score 0x03
AI_ret_081DBF3E:
	ai_ret

AI_nop:: @ dummied out maybe?
	ai_ret

TryMovesWhenThreatened::
	jump_if_health_percentage_ge 0x01 0x46 AI_moveget_081DBF64
	jump_if_health_percentage_ge 0x01 0x1E AI_moveget2_081DBF64
	move_get_move_script_id
	jump_if__8_in_list_8 AI_data3_081DBF64 AI_highparam_081DBF64
	ai_jump AI_jumphealth_081DBF64
AI_moveget_081DBF64:
	move_get_move_script_id
	jump_if__8_in_list_8 AI_data1_081DBF64 AI_highparam_081DBF64
	ai_jump AI_jumphealth_081DBF64
AI_moveget2_081DBF64:
	move_get_move_script_id
	jump_if__8_in_list_8 AI_data2_081DBF64 AI_highparam_081DBF64
	ai_jump AI_jumphealth_081DBF64
AI_highparam_081DBF64:
	random_goto__high_param_likely 0x32 AI_jumphealth_081DBF64
	viability_score 0xFE
AI_jumphealth_081DBF64:
	jump_if_health_percentage_ge 0x00 0x46 AI_moveget3_081DBF64
	jump_if_health_percentage_ge 0x00 0x1E AI_moveget4_081DBF64
	move_get_move_script_id
	jump_if__8_in_list_8 AI_data6_081DBF64 AI_highparam2_081DBF64
	ai_jump AI_ret_081DBF64
AI_moveget3_081DBF64:
	move_get_move_script_id
	jump_if__8_in_list_8 AI_data4_081DBF64 AI_highparam2_081DBF64
	ai_jump AI_ret_081DBF64
AI_moveget4_081DBF64:
	move_get_move_script_id
	jump_if__8_in_list_8 AI_data5_081DBF64 AI_highparam2_081DBF64
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

AI_unknown::
	jump_if_move_id_ne_8 0x89, AI_ret_081DC0B9
	jump_if__8_eq 0x00, AI_ret_081DC0B9
	enter_battle_countdown_get_state 0x01
	jump_if__8_eq 0x00, AI_ret_081DC0B9
	viability_score 0x05
AI_ret_081DC0B9:
	ai_ret

RoamingLogic::
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

SafariLogic::
	jump_random_unknown AI_bitmask_081DC0FE
	f10_or_b1101
AI_bitmask_081DC0FE:
	f10_or_b1011

Unused_WildRunningLogic::
	jump_if_health_percentage_eq 0x00, 0x14, AI_bitmask_081DC105
	jump_if_health_percentage_lt 0x00, 0x14, AI_bitmask_081DC105
	ai_ret
AI_bitmask_081DC105:
	f10_or_b1011

AI_nop2::
	ai_ret
