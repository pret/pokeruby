LittlerootTown_BrendansHouse_2F_EventScript_1B6950:: @ 81B6950
LittlerootTown_MaysHouse_2F_EventScript_1B6950:: @ 81B6950
	setvar 0x4092, 5
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6956:: @ 81B6956
LittlerootTown_MaysHouse_1F_EventScript_1B6956:: @ 81B6956
	msgbox LittlerootTown_BrendansHouse_1F_Text_172429, 4
	move 0x8004, LittlerootTown_BrendansHouse_1F_Movement_1A0839
	waitmove 0
	compare 0x8005, 0
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B699F
	compare 0x8005, 1
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B69AA
	msgbox LittlerootTown_BrendansHouse_1F_Text_172453, 4
	closebutton
	setvar 0x4092, 4
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B69B5
	move 0x8004, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	waitmove 0
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B699F:: @ 81B699F
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A0843
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B69AA:: @ 81B69AA
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_Movement_1B69B5:: @ 81B69B5
	step_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B69B7:: @ 81B69B7
LittlerootTown_MaysHouse_1F_EventScript_1B69B7:: @ 81B69B7
	msgbox LittlerootTown_BrendansHouse_1F_Text_172531, 4
	closebutton
	move 0x8004, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CDC
	waitmove 0
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B69D3:: @ 81B69D3
	lockall
	setvar 0x8004, 0
	jump LittlerootTown_BrendansHouse_2F_EventScript_1B69EB
	end

LittlerootTown_MaysHouse_2F_EventScript_1B69DF:: @ 81B69DF
	lockall
	setvar 0x8004, 1
	jump LittlerootTown_MaysHouse_2F_EventScript_1B69EB
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B69EB:: @ 81B69EB
LittlerootTown_MaysHouse_2F_EventScript_1B69EB:: @ 81B69EB
	checkflag 81
	jumpif FLAG_IS_SET, LittlerootTown_BrendansHouse_2F_EventScript_1B6A91
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E18, 4
	call LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B
	pause 30
	setvar 0x4092, 6
	setflag 81
	setflag 754
	setflag 755
	checkgender
	compare RESULT, 0
	callif EQUAL, LittlerootTown_BrendansHouse_2F_EventScript_1B6A31
	compare RESULT, 1
	callif EQUAL, LittlerootTown_BrendansHouse_2F_EventScript_1B6A61
	playsfx 9
	disappear 0x8008
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B6A31:: @ 81B6A31
	setvar 0x8008, 14
	reappear 0x8008
	move 0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AA2
	waitmove 0
	move 255, LittlerootTown_BrendansHouse_2F_Movement_1A0843
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E4C, 4
	closebutton
	move 0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AA9
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_1B6A61:: @ 81B6A61
	setvar 0x8008, 14
	reappear 0x8008
	move 0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AAD
	waitmove 0
	move 255, LittlerootTown_BrendansHouse_2F_Movement_1A083F
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_2F_Text_172E4C, 4
	closebutton
	move 0x8008, LittlerootTown_BrendansHouse_2F_Movement_1B6AB4
	waitmove 0
	return

LittlerootTown_BrendansHouse_2F_EventScript_1B6A91:: @ 81B6A91
	inccounter GAME_STAT_CHECKED_CLOCK
	fadescreen 1
	special 155
	waitstate
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_1B6A9B:: @ 81B6A9B
	fadescreen 1
	special 154
	waitstate
	return

LittlerootTown_BrendansHouse_2F_Movement_1B6AA2:: @ 81B6AA2
	step_13
	step_down
	step_27
	step_14
	step_13
	step_left
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AA9:: @ 81B6AA9
	step_right
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AAD:: @ 81B6AAD
	step_13
	step_down
	step_28
	step_14
	step_13
	step_right
	step_end

LittlerootTown_BrendansHouse_2F_Movement_1B6AB4:: @ 81B6AB4
	step_left
	step_up
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6AB8:: @ 81B6AB8
LittlerootTown_MaysHouse_1F_EventScript_1B6AB8:: @ 81B6AB8
	setvar 0x4092, 7
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6ABF:: @ 81B6ABF
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1A0843
	waitmove 0
	call LittlerootTown_BrendansHouse_1F_EventScript_1B6B9D
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CCC
	waitmove 0
	playmusic 453, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725C9, 4
	closebutton
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1B6BDB
	waitmove 0
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6CD2
	waitmove 0
	call LittlerootTown_BrendansHouse_1F_EventScript_1B6BBE
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A083F
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725FE, 4
	msgbox LittlerootTown_BrendansHouse_1F_Text_172644, 4
	closebutton
	setvar 0x4001, 1
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1B6BE1
	waitmove 0
	jump LittlerootTown_BrendansHouse_1F_EventScript_1B6AB8
	end

LittlerootTown_MaysHouse_1F_EventScript_1B6B2E:: @ 81B6B2E
	move 0x8005, LittlerootTown_MaysHouse_1F_Movement_1A083F
	waitmove 0
	call LittlerootTown_MaysHouse_1F_EventScript_1B6B9D
	move 255, LittlerootTown_MaysHouse_1F_Movement_1B6CD4
	waitmove 0
	playmusic 453, 0
	msgbox LittlerootTown_MaysHouse_1F_Text_1725C9, 4
	closebutton
	move 0x8005, LittlerootTown_MaysHouse_1F_Movement_1B6BDE
	waitmove 0
	move 255, LittlerootTown_MaysHouse_1F_Movement_1B6CDA
	waitmove 0
	call LittlerootTown_MaysHouse_1F_EventScript_1B6BBE
	move 255, LittlerootTown_MaysHouse_1F_Movement_1A0843
	waitmove 0
	msgbox LittlerootTown_MaysHouse_1F_Text_1725FE, 4
	msgbox LittlerootTown_MaysHouse_1F_Text_172644, 4
	closebutton
	setvar 0x4001, 1
	move 0x8005, LittlerootTown_MaysHouse_1F_Movement_1B6BE5
	waitmove 0
	jump LittlerootTown_MaysHouse_1F_EventScript_1B6AB8
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6B9D:: @ 81B6B9D
LittlerootTown_MaysHouse_1F_EventScript_1B6B9D:: @ 81B6B9D
	playsfx 21
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1A0833
	waitmove 0
	move 0x8005, LittlerootTown_BrendansHouse_1F_Movement_1A0835
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_1725A3, 4
	closebutton
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6BBE:: @ 81B6BBE
LittlerootTown_MaysHouse_1F_EventScript_1B6BBE:: @ 81B6BBE
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1A0841
	waitmove 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_172841, 4
	fadedefault
	special 62
	setflag 2096
	pause 35
	return

LittlerootTown_BrendansHouse_1F_Movement_1B6BDB:: @ 81B6BDB
	step_left
	step_28
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6BDE:: @ 81B6BDE
	step_right
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6BE1:: @ 81B6BE1
	step_left
	step_down
	step_28
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6BE5:: @ 81B6BE5
	step_right
	step_down
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6BE9:: @ 81B6BE9
LittlerootTown_MaysHouse_1F_EventScript_1B6BE9:: @ 81B6BE9
	lock
	faceplayer
	compare 0x4082, 4
	jumpif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6C33
	compare 0x408c, 4
	jumpif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6C33
	checkflag 2059
	jumpif FLAG_IS_SET, LittlerootTown_BrendansHouse_1F_EventScript_1B6C3D
	checkflag 82
	jumpif FLAG_IS_SET, LittlerootTown_BrendansHouse_1F_EventScript_1B6C72
	compare 0x4001, 1
	jumpif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6C80
	compare 0x4092, 7
	jumpif GREATER_THAN_OR_EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6C9C
	msgbox LittlerootTown_BrendansHouse_1F_Text_172429, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C33:: @ 81B6C33
	msgbox LittlerootTown_BrendansHouse_1F_Text_172BBC, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C3D:: @ 81B6C3D
	checkflag 133
	jumpif FLAG_IS_SET, LittlerootTown_BrendansHouse_1F_EventScript_1B6C72
	msgbox LittlerootTown_BrendansHouse_1F_Text_172782, 4
	giveitem ITEM_AMULET_COIN
	compare RESULT, 0
	jumpif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1A029B
	msgbox LittlerootTown_BrendansHouse_1F_Text_1727CD, 4
	setflag 133
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C72:: @ 81B6C72
	msgbox LittlerootTown_BrendansHouse_1F_Text_172717, 4
	jump LittlerootTown_BrendansHouse_1F_EventScript_1B6C8A
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C80:: @ 81B6C80
	msgbox LittlerootTown_BrendansHouse_1F_Text_1726D2, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C8A:: @ 81B6C8A
	closebutton
	call LittlerootTown_BrendansHouse_1F_EventScript_1A02CA
	inccounter GAME_STAT_RESTED_AT_HOME
	msgbox LittlerootTown_BrendansHouse_1F_Text_17276B, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6C9C:: @ 81B6C9C
	msgbox LittlerootTown_BrendansHouse_1F_Text_1726E7, 4
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CA6:: @ 81B6CA6
LittlerootTown_MaysHouse_1F_EventScript_1B6CA6:: @ 81B6CA6
	lock
	faceplayer
	checksound
	pokecry SPECIES_MACHOKE, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_17281D, 4
	waitpokecry
	release
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CB9:: @ 81B6CB9
LittlerootTown_MaysHouse_1F_EventScript_1B6CB9:: @ 81B6CB9
	lock
	faceplayer
	checksound
	pokecry SPECIES_MACHOKE, 0
	msgbox LittlerootTown_BrendansHouse_1F_Text_172831, 4
	waitpokecry
	release
	end

LittlerootTown_BrendansHouse_1F_Movement_1B6CCC:: @ 81B6CCC
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6CD2:: @ 81B6CD2
	step_left
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6CD4:: @ 81B6CD4
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

LittlerootTown_MaysHouse_1F_Movement_1B6CDA:: @ 81B6CDA
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6CDC:: @ 81B6CDC
	step_up
	step_end

LittlerootTown_BrendansHouse_1F_EventScript_1B6CDE:: @ 81B6CDE
LittlerootTown_MaysHouse_1F_EventScript_1B6CDE:: @ 81B6CDE
	lockall
	checkgender
	compare RESULT, 0
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6DAD
	compare RESULT, 1
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6DBD
	compare 0x8008, 0
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6E1D
	compare 0x8008, 1
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6E28
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1A0839
	waitmove 0
	playsfx 21
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1A0833
	waitmove 0
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1A0835
	waitmove 0
	pause 20
	compare 0x8008, 0
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6DCD
	compare 0x8008, 1
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6DD8
	msgbox LittlerootTown_BrendansHouse_1F_Text_17298B, 4
	giveitem ITEM_SS_TICKET
	msgbox LittlerootTown_BrendansHouse_1F_Text_172A7D, 4
	closebutton
	compare 0x8008, 0
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6DE3
	compare 0x8008, 1
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6DEE
	msgbox LittlerootTown_BrendansHouse_1F_Text_172B5E, 4
	closebutton
	compare 0x8008, 0
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6DF9
	compare 0x8008, 1
	callif EQUAL, LittlerootTown_BrendansHouse_1F_EventScript_1B6E0B
	playsfx 8
	disappear 0x8009
	setflag 291
	setvar 0x4082, 4
	setvar 0x408c, 4
	releaseall
	end

LittlerootTown_BrendansHouse_1F_EventScript_1B6DAD:: @ 81B6DAD
	setvar 0x8008, 0
	setvar 0x8009, 5
	setvar 0x800a, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DBD:: @ 81B6DBD
	setvar 0x8008, 1
	setvar 0x8009, 5
	setvar 0x800a, 1
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DCD:: @ 81B6DCD
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E33
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DD8:: @ 81B6DD8
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E36
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DE3:: @ 81B6DE3
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E39
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DEE:: @ 81B6DEE
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E3B
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6DF9:: @ 81B6DF9
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E4F
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E3D
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E0B:: @ 81B6E0B
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E4F
	move 0x8009, LittlerootTown_BrendansHouse_1F_Movement_1B6E43
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E1D:: @ 81B6E1D
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E49
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_EventScript_1B6E28:: @ 81B6E28
	move 255, LittlerootTown_BrendansHouse_1F_Movement_1B6E54
	waitmove 0
	return

LittlerootTown_BrendansHouse_1F_Movement_1B6E33:: @ 81B6E33
	step_right
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E36:: @ 81B6E36
	step_left
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E39:: @ 81B6E39
	step_left
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E3B:: @ 81B6E3B
	step_right
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E3D:: @ 81B6E3D
	step_down
	step_right
	step_right
	step_down
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E43:: @ 81B6E43
	step_down
	step_left
	step_left
	step_down
	step_13
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E49:: @ 81B6E49
	step_14
	step_down
	step_down
	step_down
	step_27
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E4F:: @ 81B6E4F
	step_14
	step_14
	step_14
	step_25
	step_end

LittlerootTown_BrendansHouse_1F_Movement_1B6E54:: @ 81B6E54
	step_14
	step_down
	step_down
	step_down
	step_28
	step_end
