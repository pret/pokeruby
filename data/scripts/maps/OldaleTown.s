OldaleTown_MapScripts:: @ 814DD62
	map_script 3, OldaleTown_MapScript1_14DD68
	.byte 0

OldaleTown_MapScript1_14DD68:: @ 814DD68
	call OldaleTown_EventScript_1A014E
	setflag 2064
	checkflag 116
	callif 0, OldaleTown_EventScript_14DD92
	checkflag 132
	callif 0, OldaleTown_EventScript_14DD9E
	checkflag 116
	callif 1, OldaleTown_EventScript_14DD8C
	end

OldaleTown_EventScript_14DD8C:: @ 814DD8C
	setvar 0x4051, 1
	return

OldaleTown_EventScript_14DD92:: @ 814DD92
	movespriteperm 3, 1, 11
	spritebehave 3, 9
	return

OldaleTown_EventScript_14DD9E:: @ 814DD9E
	movespriteperm 2, 13, 14
	spritebehave 2, 8
	return

OldaleTown_EventScript_14DDAA:: @ 814DDAA
	msgbox OldaleTown_Text_16B20E, 3
	end

OldaleTown_EventScript_14DDB3:: @ 814DDB3
	msgbox OldaleTown_Text_16AEC0, 2
	end

OldaleTown_EventScript_14DDBC:: @ 814DDBC
	lock
	faceplayer
	checkflag 132
	jumpif EQUAL, OldaleTown_EventScript_14DE79
	checkflag 1
	jumpif EQUAL, OldaleTown_EventScript_14DE79
	setflag 1
	playmusic 420, 0
	msgbox OldaleTown_Text_16AEF2, 4
	closebutton
	switch FACING
	case 1, OldaleTown_EventScript_14DE07
	case 2, OldaleTown_EventScript_14DE1E
	case 4, OldaleTown_EventScript_14DE35
	end

OldaleTown_EventScript_14DE07:: @ 814DE07
	move 2, OldaleTown_Movement_14DE97
	move 255, OldaleTown_Movement_14DEC1
	waitmove 0
	jump OldaleTown_EventScript_14DE4C
	end

OldaleTown_EventScript_14DE1E:: @ 814DE1E
	move 2, OldaleTown_Movement_14DEA2
	move 255, OldaleTown_Movement_14DECB
	waitmove 0
	jump OldaleTown_EventScript_14DE4C
	end

OldaleTown_EventScript_14DE35:: @ 814DE35
	move 255, OldaleTown_Movement_14DEB9
	move 2, OldaleTown_Movement_14DE8E
	waitmove 0
	jump OldaleTown_EventScript_14DE4C
	end

OldaleTown_EventScript_14DE4C:: @ 814DE4C
	msgbox OldaleTown_Text_16AF2F, 4
	giveitem ITEM_POTION
	compare RESULT, 0
	jumpif EQUAL, OldaleTown_EventScript_14DE83
	msgbox OldaleTown_Text_16AFE1, 4
	setflag 132
	fadedefault
	release
	end

OldaleTown_EventScript_14DE79:: @ 814DE79
	msgbox OldaleTown_Text_16AFE1, 4
	release
	end

OldaleTown_EventScript_14DE83:: @ 814DE83
	msgbox OldaleTown_Text_1A0CC2, 4
	fadedefault
	release
	end

OldaleTown_Movement_14DE8E:: @ 814DE8E
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_25
	step_end

OldaleTown_Movement_14DE97:: @ 814DE97
	step_left
	step_up
	step_up
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_25
	step_end

OldaleTown_Movement_14DEA2:: @ 814DEA2
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_25
	step_end

@ 814DEAB
	step_up
	step_up
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_13
	step_25
	step_end

OldaleTown_Movement_14DEB9:: @ 814DEB9
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

OldaleTown_Movement_14DEC1:: @ 814DEC1
	step_14
	step_14
	step_14
	step_14
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

OldaleTown_Movement_14DECB:: @ 814DECB
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

@ 814DED3
	step_left
	step_up
	step_up
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_end

OldaleTown_EventScript_14DEDF:: @ 814DEDF
	lock
	faceplayer
	checkflag 116
	jumpif EQUAL, OldaleTown_EventScript_14DF26
	msgbox OldaleTown_Text_16B0CC, 4
	closebutton
	move 3, OldaleTown_Movement_1A083D
	waitmove 0
	release
	end

OldaleTown_EventScript_14DEFF:: @ 814DEFF
	lockall
	move 255, OldaleTown_Movement_14DFEC
	move 3, OldaleTown_Movement_14DFEF
	waitmove 0
	msgbox OldaleTown_Text_16B045, 4
	closebutton
	move 3, OldaleTown_Movement_14DFF5
	waitmove 0
	releaseall
	end

OldaleTown_EventScript_14DF26:: @ 814DF26
	msgbox OldaleTown_Text_16B12A, 4
	release
	end

OldaleTown_EventScript_14DF30:: @ 814DF30
	lockall
	move 4, OldaleTown_Movement_1A0839
	waitmove 0
	jump OldaleTown_EventScript_14DF92
	end

OldaleTown_EventScript_14DF41:: @ 814DF41
	lockall
	move 4, OldaleTown_Movement_14DFDE
	waitmove 0
	move 255, OldaleTown_Movement_1A0843
	waitmove 0
	jump OldaleTown_EventScript_14DF92
	end

OldaleTown_EventScript_14DF5C:: @ 814DF5C
	lockall
	move 4, OldaleTown_Movement_14DFE1
	waitmove 0
	move 255, OldaleTown_Movement_1A0843
	waitmove 0
	jump OldaleTown_EventScript_14DF92
	end

OldaleTown_EventScript_14DF77:: @ 814DF77
	lockall
	move 4, OldaleTown_Movement_14DFE3
	waitmove 0
	move 255, OldaleTown_Movement_1A0843
	waitmove 0
	jump OldaleTown_EventScript_14DF92
	end

OldaleTown_EventScript_14DF92:: @ 814DF92
	checkgender
	compare RESULT, 0
	jumpif EQUAL, OldaleTown_EventScript_14DFAA
	compare RESULT, 1
	jumpif EQUAL, OldaleTown_EventScript_14DFB8
	end

OldaleTown_EventScript_14DFAA:: @ 814DFAA
	msgbox OldaleTown_Text_16B196, 4
	jump OldaleTown_EventScript_14DFC6
	end

OldaleTown_EventScript_14DFB8:: @ 814DFB8
	msgbox OldaleTown_Text_16B1BE, 4
	jump OldaleTown_EventScript_14DFC6
	end

OldaleTown_EventScript_14DFC6:: @ 814DFC6
	closebutton
	move 4, OldaleTown_Movement_14DFE5
	waitmove 0
	disappear 4
	setvar 0x40c7, 2
	setflag 979
	releaseall
	end

OldaleTown_Movement_14DFDE:: @ 814DFDE
	step_left
	step_left
	step_end

OldaleTown_Movement_14DFE1:: @ 814DFE1
	step_left
	step_end

OldaleTown_Movement_14DFE3:: @ 814DFE3
	step_02
	step_end

OldaleTown_Movement_14DFE5:: @ 814DFE5
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

OldaleTown_Movement_14DFEC:: @ 814DFEC
	step_13
	step_right
	step_end

OldaleTown_Movement_14DFEF:: @ 814DFEF
	step_16
	step_27
	step_40
	step_right
	step_41
	step_end

OldaleTown_Movement_14DFF5:: @ 814DFF5
	step_down
	step_left
	step_end
