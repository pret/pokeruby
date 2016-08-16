	.macro random_goto__high_param_likely param addr
	.byte 0x00
	.byte \param
	.4byte \addr
	.endm
	
@ 01 random_goto__low_param_likely
@ 02 random_goto__1_in_256_chance
@ 03 random_goto__255_in_256_chance

	.macro viability_score score
	.byte 0x04
	.byte \score
	.endm
	
	.macro jump_if_health_percentage_lt target percent addr
	.byte 0x05
	.byte \target
	.byte \percent
	.4byte \addr
	.endm
	
	.macro jump_if_health_percentage_ge target percent addr
	.byte 0x06
	.byte \target
	.byte \percent
	.4byte \addr
	.endm
	
	.macro jump_if_health_percentage_eq target percent addr
	.byte 0x07
	.byte \target
	.byte \percent
	.4byte \addr
	.endm
	
@ 08 jump_if_health_percentage_ne
@ 09 jump_if_any_status1_bit
@ 0A jump_if_no_status1_bit
	
	.macro jump_if_any_status2_bit param mask addr
	.byte 0x0B
	.byte \param
	.4byte \mask
	.4byte \addr
	.endm
	
@ 0C jump_if_no_status2_bit
@ 0D jump_if_any_status3_bit
@ 0E jump_if_no_status3_bit
@ 0F jump_if_any_status4_bit
@ 10 jump_if_no_status4_bit
@ 11 jump_if__8_lt_8
@ 12 jump_if__8_gt_8
	
	.macro jump_if__8_eq param addr
	.byte 0x13
	.byte \param
	.4byte \addr
	.endm

@ 14 jump_if__8_ne_8
@ 15 jump_if__8_lt_32
@ 16 jump_if__8_gt_32
@ 17 jump_if__8_eq_32
@ 18 jump_if__8_ne_32
	
	.macro jump_if_move_id_eq move param
	.byte 0x19
	.2byte \move
	.2byte \param
	.endm
	
	.macro jump_if_move_id_ne move param
	.byte 0x1A
	.2byte \move
	.2byte \param
	.endm
	
@ 1B jump_if__8_in_list_8
@ 1C jump_if__8_not_in_list_8
@ 1D jump_if__8_in_list_16
@ 1E jump_if__8_not_in_list_16
@ 1F jump_if_attacker_has_any_damaging_moves
@ 20 jump_if_attacker_has_no_damaging_moves
	
	.macro get_battle_turn_counter param addr
	.byte 0x21
	.2byte \param
	.4byte \addr
	.endm
	
@ 22 get_some_type
@ 23 move_get_power__2_8
	
	.macro is_most_powerful_move param addr
	.byte 0x24
	.2byte \param
	.4byte \addr
	.endm
	
@ 25 get_move_to_execute_B
@ 26 jump_if__8_ne_2
@ 27 jump_if__8_eq_2
@ 28 jump_if_move_would_hit_first
@ 29 jump_if_move_would_hit_second
@ 2A ai_unk2A
@ 2B ai_unk2B

	.macro count_alive_pokemon_on_team param1 param2 addr
	.byte 0x2C
	.byte \param1
	.2byte \param2
	.4byte \addr
	.endm

@ 2D get_move_id__8
	
	.macro move_get_move_script_id param1 addr1 addr2  param2 param3 addr3
	.byte 0x2E
	.byte \param1
	.4byte \addr1
	.4byte \addr2
	.byte \param2
	.byte \param3
	.4byte \addr3
	.endm

	.macro get_ability ability
	.byte 0x2F
	.byte \ability
	.endm
	
@ 30 simulate_damage_muliplier_four_times
@ 31 simulate_damage_bonus_jump_if_eq
@ 32 ai_unk32
@ 33 ai_unk33
@ 34 jump_if_any_party_member_has_status_ailment_32
@ 35 jump_if_no_party_member_has_status_ailment_32_BUGGED
@ 36 get_weather__8

	.macro jump_if_move_id_eq_8 byte address
	.byte 0x37
	.byte \byte
	.4byte \address
	.endm
	
	.macro jump_if_move_id_ne_8 byte address
	.byte 0x38
	.byte \byte
	.4byte \address
	.endm

@ 37 jump_if_move_id_eq_8
@ 38 jump_if_move_id_ne_8
@ 39 jump_if_stat_buff_lt
@ 3A jump_if_stat_buff_gt
@ 3B jump_if_stat_buff_eq
@ 3C jump_if_stat_buff_ne

	.macro determine_move_damage_jump_if_fatal address byte
	.byte 0x3D
	.4byte \address
	.byte \byte
	.endm
	
@ 3D determine_move_damage_jump_if_fatal
@ 3E determine_move_damage_jump_if_not_fatal
@ 3F jump_if_has_move
@ 40 jump_if_hasnt_move

	.macro jump_if_move_with_same_movescript_in_either_0_2_history_or_1_3_moveset param1 param2 addr
	.byte 0x41
	.byte \param1
	.byte \param2
	.4byte \addr
	.endm

@ 42 jump_if_move_with_same_movescript_in_neither_0_2_history_nor_1_3_moveset
@ 43 is_moveset_restricted
@ 44 jump_if_or_if_not_current_move_in_encore

	.macro f10_or_b1011
	.byte 0x45
	.endm

	.macro jump_random_unknown addr
	.byte 0x46
	.4byte \addr
	.endm

	.macro f10_or_b1101
	.byte 0x47
	.endm

@ 45 f10_or_b1011
@ 46 jump_random_unknown
@ 47 f10_or_b1101
@ 48 get_held_item_x12__8
@ 49 pokemon_species_get_gender_info

	.macro enter_battle_countdown_get_state param1 param2 addr
	.byte 0x4A
	.byte \param1
	.2byte \param2
	.4byte \addr
	.endm

@ 4B stockpile_get_num_uses
@ 4C is_double_battle
@ 4D get_dp08_item__8
@ 4E move_get_type__8
@ 4F move_get_power__8_8
@ 50 move_get_move_script_id__8
@ 51 get_protect_endure_activity
@ 52 ai_unk52
@ 53 ai_unk53
@ 54 ai_unk54
@ 55 ai_unk55
@ 56 ai_unk56
@ 57 ai_unk57
@ 58 call

	.macro ai_jump addr
	.byte 0x59
	.4byte \addr
	.endm

	.macro ai_ret
	.byte 0x5A
	.endm
	
@ 5B compare_attacker_defender_levels
@ 5C jump_if_taunt_turns_ne_0
@ 5D jump_if_taunt_turns_eq_0
