@ contest AI macro research


	.macro score score
	.byte 0x00
	.byte \score
	.endm

@ turn (AKA "Appeal No.")

	.macro get_turn
	.byte 0x01
	.endm

	.macro if_turn_less_than param, addr
	.byte 0x02
	.byte \param
	.4byte \addr
	.endm

	.macro if_turn_more_than param, addr
	.byte 0x03
	.byte \param
	.4byte \addr
	.endm

	.macro if_turn_eq param, addr
	.byte 0x04
	.byte \param
	.4byte \addr
	.endm

	.macro if_turn_not_eq param, addr
	.byte 0x05
	.byte \param
	.4byte \addr
	.endm

@ audience excitement

	.macro get_excitement
	.byte 0x06
	.endm

	.macro if_excitement_less_than param, addr
	.byte 0x07
	.byte \param
	.4byte \addr
	.endm

	.macro if_excitement_more_than param, addr
	.byte 0x08
	.byte \param
	.4byte \addr
	.endm

	.macro if_excitement_eq param, addr
	.byte 0x09
	.byte \param
	.4byte \addr
	.endm

	.macro if_excitement_not_eq param, addr
	.byte 0x0A
	.byte \param
	.4byte \addr
	.endm

@ the order that the user goes in the current turn

	.macro get_user_order
	.byte 0x0B
	.endm

	.macro if_user_order_less_than param addr
	.byte 0x0C
	.byte \param
	.4byte \addr
	.endm

	.macro if_user_order_more_than param addr
	.byte 0x0D
	.byte \param
	.4byte \addr
	.endm

	.macro if_user_order_eq param addr
	.byte 0x0E
	.byte \param
	.4byte \addr
	.endm

	.macro if_user_order_not_eq param addr
	.byte 0x0F
	.byte \param
	.4byte \addr
	.endm

@ user condition

	.macro get_user_condition
	.byte 0x10
	.endm

	.macro if_user_condition_less_than param, addr
	.byte 0x11
	.byte \param
	.4byte \addr
	.endm

	.macro if_user_condition_more_than param, addr
	.byte 0x12
	.byte \param
	.4byte \addr
	.endm

	.macro if_user_condition_eq param, addr
	.byte 0x13
	.byte \param
	.4byte \addr
	.endm

	.macro if_user_condition_not_eq param, addr
	.byte 0x14
	.byte \param
	.4byte \addr
	.endm

@ 15
@ 16
@ 17
@ 18
@ 19
@ 1A
@ 1B
@ 1C
@ 1D
@ 1E

@ contest type

	.macro get_contest_type
	.byte 0x1F
	.endm

	.macro if_contest_type_eq param, addr
	.byte 0x20
	.byte \param
	.4byte \addr
	.endm

	.macro if_contest_type_not_eq param, addr
	.byte 0x21
	.byte \param
	.4byte \addr
	.endm

@ move excitement (change in excitement due to move)

	.macro get_move_excitement
	.byte 0x22
	.endm

	.macro if_move_excitement_less_than param, addr
	.byte 0x23
	.byte \param
	.4byte \addr
	.endm

	.macro if_move_excitement_more_than param, addr
	.byte 0x24
	.byte \param
	.4byte \addr
	.endm

	.macro if_move_excitement_eq param, addr
	.byte 0x25
	.byte \param
	.4byte \addr
	.endm

	.macro if_move_excitement_not_eq param, addr
	.byte 0x26
	.byte \param
	.4byte \addr
	.endm

@ move effect

	.macro get_effect
	.byte 0x27
	.endm

	.macro if_effect_eq param, addr
	.byte 0x28
	.byte \param
	.4byte \addr
	.endm

	.macro if_effect_not_eq param, addr
	.byte 0x29
	.byte \param
	.4byte \addr
	.endm

@ move effect type

	.macro get_effect_type
	.byte 0x2A
	.endm

	.macro if_effect_type_eq param, addr
	.byte 0x2B
	.byte \param
	.4byte \addr
	.endm

	.macro if_effect_type_not_eq param, addr
	.byte 0x2C
	.byte \param
	.4byte \addr
	.endm

@ whether the current move is the most appealing in the user's moveset

	.macro check_most_appealing_move
	.byte 0x2D
	.endm

	.macro if_most_appealing_move addr
	.byte 0x2E
	.4byte \addr
	.endm

@ 2F
@ 30
@ 31
@ 32
@ 33
@ 34
@ 35
@ 36
@ 37
@ 38
@ 39
@ 3A
@ 3B
@ 3C

	.macro contest_3D param addr
	.byte 0x3D
	.byte \param
	.4byte \addr
	.endm

	.macro if_move_used_count_eq param addr
	.byte 0x3E
	.byte \param
	.4byte \addr
	.endm

	.macro contest_3F param addr
	.byte 0x3F
	.byte \param
	.4byte \addr
	.endm

@ 40
@ 41

	.macro contest_42 addr
	.byte 0x42
	.4byte \addr
	.endm

@ 43
@ 44

	.macro contest_45 addr
	.byte 0x45
	.4byte \addr
	.endm

@ 46

	.macro contest_47 addr
	.byte 0x47
	.4byte \addr
	.endm

@ 48
@ 49
@ 4A
@ 4B

	.macro contest_4C param1 param2 addr
	.byte 0x4C
	.byte \param1
	.byte \param2
	.4byte \addr
	.endm

@ 4D
@ 4E
@ 4F
@ 50

	.macro contest_51 param1 param2 addr
	.byte 0x51
	.byte \param1
	.byte \param2
	.4byte \addr
	.endm

@ 52
@ 53

	.macro contest_54 param addr
	.byte 0x54
	.byte \param
	.4byte \addr
	.endm

	.macro contest_55 param addr
	.byte 0x55
	.byte \param
	.4byte \addr
	.endm

@ 56
@ 57

	.macro contest_58 param addr
	.byte 0x58
	.byte \param
	.4byte \addr
	.endm

@ 59
@ 5A
@ 5B
@ 5C
@ 5D
@ 5E
@ 5F
@ 60
@ 61
@ 62
@ 63
@ 64
@ 65
@ 66
@ 67
@ 68
@ 69
@ 6A
@ 6B
@ 6C
@ 6D
@ 6E
@ 6F
@ 70
@ 71
@ 72
@ 73
@ 74
@ 75
@ 76
@ 77
@ 78
@ 79
@ 7A
@ 7B
@ 7C

	.macro if_random param addr
	.byte 0x7D
	.byte \param
	.4byte \addr
	.endm

@ 7E

	.macro contest_7F addr
	.byte 0x7F
	.4byte \addr
	.endm

	.macro contest_80 addr
	.byte 0x80
	.4byte \addr
	.endm

	.macro end
	.byte 0x81
	.endm

	.macro check_user_has_exciting_move
	.byte 0x82
	.endm

	.macro if_user_has_exciting_move addr
	.byte 0x83
	.4byte \addr
	.endm

	.macro if_user_doesnt_have_exciting_move addr
	.byte 0x84
	.4byte \addr
	.endm

@ 85
@ 86

	.macro if_effect_in_user_moveset param addr
	.byte 0x87
	.2byte \param
	.4byte \addr
	.endm
