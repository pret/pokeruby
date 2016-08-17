	.macro if_random percent, address
	.byte 0x00
	.byte \percent
	.4byte \address
	.endm

	.macro if_not_random percent, address
	.byte 0x01
	.byte \percent
	.4byte \address
	.endm

	.macro if_random_1 address
	.byte 0x02
	.4byte \address
	.endm

	.macro if_not_random_1 address
	.byte 0x03
	.4byte \address
	.endm

	.macro score score
	.byte 0x04
	.byte \score
	.endm

	.macro if_hp_less_than target, percent, address
	.byte 0x05
	.byte \target
	.byte \percent
	.4byte \address
	.endm

	.macro if_hp_more_than target, percent, address
	.byte 0x06
	.byte \target
	.byte \percent
	.4byte \address
	.endm

	.macro if_hp_equal target, percent, address
	.byte 0x07
	.byte \target
	.byte \percent
	.4byte \address
	.endm

	.macro if_hp_not_equal target, percent, address
	.byte 0x08
	.byte \target
	.byte \percent
	.4byte \address
	.endm

	.macro if_status target, status, address
	.byte 0x09
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro if_not_status target, status, address
	.byte 0x0a
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro if_any_status2 target, status, address
	.byte 0x0b
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro if_no_status2 target, status, address
	.byte 0x0c
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro if_any_status3 target, status, address
	.byte 0x0d
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro if_no_status3 target, status, address
	.byte 0x0e
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro if_any_status4 target, status, address
	.byte 0x0f
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro if_no_status4 target, status, address
	.byte 0x10
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro if_less_than value, address
	.byte 0x11
	.byte \value
	.4byte \address
	.endm

	.macro if_more_than value, address
	.byte 0x12
	.byte \value
	.4byte \address
	.endm

	.macro if_equal value, address
	.byte 0x13
	.byte \value
	.4byte \address
	.endm

	.macro if_not_equal value, address
	.byte 0x14
	.byte \value
	.4byte \address
	.endm

	.macro if_less_than_32 value, address
	.byte 0x15
	.4byte \value
	.4byte \address
	.endm

	.macro if_more_than_32 value, address
	.byte 0x16
	.4byte \value
	.4byte \address
	.endm

	.macro if_equal_32 value, address
	.byte 0x17
	.4byte \value
	.4byte \address
	.endm

	.macro if_not_equal_32 value, address
	.byte 0x18
	.4byte \value
	.4byte \address
	.endm

	.macro if_move move, address
	.byte 0x19
	.2byte \move
	.4byte \address
	.endm

	.macro if_not_move move, address
	.byte 0x1a
	.2byte \move
	.4byte \address
	.endm

	.macro if_in list, address
	.byte 0x1b
	.4byte \list
	.4byte \address
	.endm

	.macro if_not_in list, address
	.byte 0x1c
	.4byte \list
	.4byte \address
	.endm

	.macro if_in2 list, address
	.byte 0x1d
	.4byte \list
	.4byte \address
	.endm

	.macro if_not_in2 list, address
	.byte 0x1e
	.4byte \list
	.4byte \address
	.endm

	.macro if_user_can_damage address
	.byte 0x1f
	.4byte \address
	.endm

	.macro if_user_cant_damage address
	.byte 0x20
	.4byte \address
	.endm

	.macro get_turn_count 
	.byte 0x21
	.endm

	.macro ai_22 byte
	.byte 0x22
	.byte \byte
	.endm

	.macro ai_23 
	.byte 0x23
	.endm

	.macro is_most_powerful_move 
	.byte 0x24
	.endm

	.macro ai_25 target
	.byte 0x25
	.byte \target
	.endm

	.macro if_type type, address
	.byte 0x26
	.byte \type
	.4byte \address
	.endm

	.macro ai_27 
	.byte 0x27
	.endm

	.macro if_would_go_first target, address
	.byte 0x28
	.byte \target
	.4byte \address
	.endm

	.macro if_would_not_go_first target, address
	.byte 0x29
	.byte \target
	.4byte \address
	.endm

	.macro ai_2a 
	.byte 0x2a
	.endm

	.macro ai_2b 
	.byte 0x2b
	.endm

	.macro count_alive_pokemon target
	.byte 0x2c
	.byte \target
	.endm

	.macro ai_2d 
	.byte 0x2d
	.endm

	.macro ai_2e 
	.byte 0x2e
	.endm

	.macro get_ability target
	.byte 0x2f
	.byte \target
	.endm

	.macro ai_30 
	.byte 0x30
	.endm

	.macro if_damage_bonus value, address
	.byte 0x31
	.byte \value
	.4byte \address
	.endm

	.macro ai_32 
	.byte 0x32
	.endm

	.macro ai_33 
	.byte 0x33
	.endm

	.macro ai_34 target, status, address
	.byte 0x34
	.byte \target
	.4byte \status
	.4byte \address
	.endm

	.macro ai_35 
	.byte 0x35
	.endm

	.macro get_weather 
	.byte 0x36
	.endm

	.macro if_effect byte, address
	.byte 0x37
	.byte \byte
	.4byte \address
	.endm

	.macro if_not_effect byte, address
	.byte 0x38
	.byte \byte
	.4byte \address
	.endm

	.macro if_stat_level_less_than target, stat, level, address
	.byte 0x39
	.byte \target
	.byte \stat
	.byte \level
	.4byte \address
	.endm

	.macro if_stat_level_more_than target, stat, level, address
	.byte 0x3a
	.byte \target
	.byte \stat
	.byte \level
	.4byte \address
	.endm

	.macro if_stat_level_equal target, stat, level, address
	.byte 0x3b
	.byte \target
	.byte \stat
	.byte \level
	.4byte \address
	.endm

	.macro if_stat_level_not_equal target, stat, level, address
	.byte 0x3c
	.byte \target
	.byte \stat
	.byte \level
	.4byte \address
	.endm

	.macro if_can_faint address
	.byte 0x3d
	.4byte \address
	.endm

	.macro if_cant_faint address
	.byte 0x3e
	.4byte \address
	.endm

	.macro if_has_move 
	.byte 0x3f
	.endm

	.macro if_dont_have_move 
	.byte 0x40
	.endm

	.macro if_similar_move byte, byte2, address
	.byte 0x41
	.byte \byte
	.byte \byte2
	.4byte \address
	.endm

	.macro if_no_similar_move byte, byte2, address
	.byte 0x42
	.byte \byte
	.byte \byte2
	.4byte \address
	.endm

	.macro ai_43 
	.byte 0x43
	.endm

	.macro if_encored address
	.byte 0x44
	.4byte \address
	.endm

	.macro ai_45 
	.byte 0x45
	.endm

	.macro ai_46 address
	.byte 0x46
	.4byte \address
	.endm

	.macro ai_47 
	.byte 0x47
	.endm

	.macro ai_48 target
	.byte 0x48
	.byte \target
	.endm

	.macro get_gender target
	.byte 0x49
	.byte \target
	.endm

	.macro ai_4a byte, word, address
	.byte 0x4a
	.byte \byte
	.2byte \word
	.4byte \address
	.endm

	.macro get_stockpile_count target
	.byte 0x4b
	.byte \target
	.endm

	.macro is_double_battle 
	.byte 0x4c
	.endm

	.macro get_item target
	.byte 0x4d
	.byte \target
	.endm

	.macro get_move_type 
	.byte 0x4e
	.endm

	.macro get_move_power 
	.byte 0x4f
	.endm

	.macro get_move_effect 
	.byte 0x50
	.endm

	.macro get_protect_count target
	.byte 0x51
	.byte \target
	.endm

	.macro ai_52 
	.byte 0x52
	.endm

	.macro ai_53 
	.byte 0x53
	.endm

	.macro ai_54 
	.byte 0x54
	.endm

	.macro ai_55 
	.byte 0x55
	.endm

	.macro ai_56 
	.byte 0x56
	.endm

	.macro ai_57 
	.byte 0x57
	.endm

	.macro call address
	.byte 0x58
	.4byte \address
	.endm

	.macro jump address
	.byte 0x59
	.4byte \address
	.endm

	.macro end 
	.byte 0x5a
	.endm

	.macro ai_5b param addr
	.byte 0x5b
	.byte \param
	.4byte \addr
	.endm

	.macro if_taunted address
	.byte 0x5c
	.4byte \address
	.endm

	.macro if_not_taunted address
	.byte 0x5d
	.4byte \address
	.endm
