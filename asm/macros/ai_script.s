	.macro random_goto__high_param_likely
	.byte 0x00
	.endm
	
	.macro random_goto__low_param_likely
	.byte 0x01
	.endm
	
	.macro random_goto__1_in_256_chance
	.byte 0x02
	.endm
	
	.macro random_goto__255_in_256_chance
	.byte 0x03
	.endm
	
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
	
	.macro jump_if_health_percentage_ne target percent addr
	.byte 0x08
	.byte \target
	.byte \percent
	.4byte \addr
	.endm
	
	.macro jump_if_any_status1_bit
	.byte 0x09
	.endm
	
	.macro jump_if_no_status1_bit
	.byte 0x0A
	.endm
	
	.macro jump_if_any_status2_bit
	.byte 0x0B
	.endm
	
	.macro jump_if_no_status2_bit
	.byte 0x0C
	.endm
	
	.macro jump_if_any_status3_bit
	.byte 0x0D
	.endm
	
	.macro jump_if_no_status3_bit
	.byte 0x0E
	.endm
	
	.macro jump_if_any_status4_bit
	.byte 0x0F
	.endm
	
	.macro jump_if_no_status4_bit
	.byte 0x10
	.endm
	
	.macro jump_if__8_lt_8 param
	.byte 0x11
	.byte \param
	.endm
	
	.macro jump_if__8_gt param
	.byte 0x12
	.byte \param
	.endm
	
	.macro jump_if__8_eq param addr
	.byte 0x13
	.byte \param
	.4byte \addr
	.endm

	.macro jump_if__8_ne param
	.byte 0x14
	.byte \param
	.endm
	
	.macro jump_if__8_lt param
	.byte 0x15
	.4byte \param
	.endm
	
	.macro jump_if__8_gt2 param
	.byte 0x16
	.4byte \param
	.endm
	
	.macro jump_if__8_eq2 param
	.byte 0x17
	.4byte \param
	.endm
	
	.macro jump_if__8_ne2 param
	.byte 0x18
	.4byte \param
	.endm
	
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
	
	.macro jump_if__8_in_list param
	.byte 0x1B
	.byte \param
	.endm
	
	.macro jump_if__8_not_in_list param
	.byte 0x1C
	.byte \param
	.endm
	
	.macro jump_if__8_in_list2 param
	.byte 0x1D
	.2byte \param
	.endm
	
	.macro jump_if__8_not_in_list2 param
	.byte 0x1E
	.2byte \param
	.endm
	
	.macro jump_if_attacker_has_any_damaging_moves
	.byte 0x1F
	.endm
	
	.macro jump_if_attacker_has_no_damaging_moves
	.byte 0x20
	.endm
	
	.macro get_battle_turn_counter__8
	.byte 0x21
	.endm
	
	.macro get_some_type
	.byte 0x22
	.endm
	
	.macro move_get_power__2 param
	.byte 0x23
	.byte \param
	.endm
	
	.macro is_most_powerful_move move address
	.byte 0x24
	.2byte \move
	.4byte \address
	.endm
	
	.macro get_move_to_execute_B
	.byte 0x25
	.endm
	
	.macro jump_if__8_ne3 move
	.byte 0x26
	.2byte \move
	.endm
	
	.macro jump_if__8_eq3 move
	.byte 0x27
	.2byte \move
	.endm

@ first 40 macros

@ 28 jump_if_move_would_hit_first
@ 29 jump_if_move_would_hit_second
@ 2A ai_unk2A
@ 2B ai_unk2B
@ 2C count_alive_pokemon_on_team
@ 2D get_move_id__8
@ E move_get_move_script_id
@ 2F get_ability
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
@ 41 jump_if_move_with_same_movescript_in_either_0_2_history_or_1_3_moveset
@ 42 jump_if_move_with_same_movescript_in_neither_0_2_history_nor_1_3_moveset
@ 43 is_moveset_restricted
@ 44 jump_if_or_if_not_current_move_in_encore
@ 45 f10_or_b1011
@ 46 jump_random_unknown
@ 47 f10_or_b1101
@ 48 get_held_item_x12__8
@ 49 pokemon_species_get_gender_info
@ 4A enter_battle_countdown_get_state
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
@ 59 jump

	.macro ai_ret
	.byte 0x5A
	.endm
	
@ 5B compare_attacker_defender_levels
@ 5C jump_if_taunt_turns_ne_0
@ 5D jump_if_taunt_turns_eq_0
