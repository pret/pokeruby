@ contest AI macro research


	.macro score score
	.byte 0x00
	.byte \score
	.endm

@ 01
@ 02
@ 03

	.macro contest_04 param addr
	.byte 0x04
	.byte \param
	.4byte \addr
	.endm

@ 05
@ 06
@ 07
@ 08

	.macro contest_09 param addr
	.byte 0x09
	.byte \param
	.4byte \addr
	.endm

	.macro contest_0A param addr
	.byte 0x0A
	.byte \param
	.4byte \addr
	.endm

@ 0B
@ 0C
@ 0D

	.macro contest_0E param addr
	.byte 0x0E
	.byte \param
	.4byte \addr
	.endm

	.macro contest_0F param addr
	.byte 0x0F
	.byte \param
	.4byte \addr
	.endm

@ 10
@ 11
@ 12

	.macro if_user_condition param addr
	.byte 0x13
	.byte \param
	.4byte \addr
	.endm

@ 14
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
@ 1F

	.macro contest_20 param addr
	.byte 0x20
	.byte \param
	.4byte \addr
	.endm

@ 21
@ 22
	
	.macro contest_23 param addr
	.byte 0x23
	.byte \param
	.4byte \addr
	.endm

@ 24

	.macro contest_25 param addr
	.byte 0x25
	.byte \param
	.4byte \addr
	.endm

@ 26
@ 27
	
	.macro if_effect param addr
	.byte 0x28
	.byte \param
	.4byte \addr
	.endm

	.macro contest_29 param addr
	.byte 0x29
	.byte \param
	.4byte \addr
	.endm

@ 2A
@ 2B
@ 2C
@ 2D
@ 2E
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
	
	.macro contest_3E param addr
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
@ 4C
@ 4D
@ 4E
@ 4F
@ 50
@ 51
@ 52
@ 53
@ 54
@ 55
@ 56
@ 57
@ 58
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
@ 7F

	.macro contest_80 addr
	.byte 0x80
	.4byte \addr
	.endm

	.macro end
	.byte 0x81
	.endm

@ 82

	.macro contest_83 addr
	.byte 0x83
	.4byte \addr
	.endm

@ 84
@ 85
@ 86
	
	.macro contest_87 param addr
	.byte 0x87
	.2byte \param
	.4byte \addr
	.endm

@ 88
@ 89
@ 8A
@ 8B
@ 8C
@ 8D
@ 8E
@ 8F
@ 90
@ 91
@ 92
@ 93
@ 94
@ 95
@ 96
@ 97
@ 98
@ 99
@ 9A
@ 9B
@ 9C
@ 9D
@ 9E
@ 9F

@ adding more if I find more macros greater than 9F.
