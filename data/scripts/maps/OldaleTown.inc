OldaleTown_MapScripts:: @ 814DD62
	map_script 3, OldaleTown_MapScript1_14DD68
	.byte 0

OldaleTown_MapScript1_14DD68:: @ 814DD68
	call OldaleTown_EventScript_1A014E
	setflag FLAG_VISITED_OLDALE_TOWN
	checkflag FLAG_ADVENTURE_STARTED
	call_if 0, OldaleTown_EventScript_14DD92
	checkflag FLAG_RECEIVED_POTION_OLDALE
	call_if 0, OldaleTown_EventScript_14DD9E
	checkflag FLAG_ADVENTURE_STARTED
	call_if 1, OldaleTown_EventScript_14DD8C
	end

OldaleTown_EventScript_14DD8C:: @ 814DD8C
	setvar VAR_ROUTE102_ACCESSIBLE, 1
	return

OldaleTown_EventScript_14DD92:: @ 814DD92
	setobjectxyperm 3, 1, 11
	setobjectmovementtype 3, 9
	return

OldaleTown_EventScript_14DD9E:: @ 814DD9E
	setobjectxyperm 2, 13, 14
	setobjectmovementtype 2, 8
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
	checkflag FLAG_RECEIVED_POTION_OLDALE
	goto_if_eq OldaleTown_EventScript_14DE79
	checkflag FLAG_TEMP_1
	goto_if_eq OldaleTown_EventScript_14DE79
	setflag FLAG_TEMP_1
	playbgm 420, 0
	msgbox OldaleTown_Text_16AEF2, 4
	closemessage
	switch FACING
	case 1, OldaleTown_EventScript_14DE07
	case 2, OldaleTown_EventScript_14DE1E
	case 4, OldaleTown_EventScript_14DE35
	end

OldaleTown_EventScript_14DE07:: @ 814DE07
	applymovement 2, OldaleTown_Movement_14DE97
	applymovement 255, OldaleTown_Movement_14DEC1
	waitmovement 0
	goto OldaleTown_EventScript_14DE4C
	end

OldaleTown_EventScript_14DE1E:: @ 814DE1E
	applymovement 2, OldaleTown_Movement_14DEA2
	applymovement 255, OldaleTown_Movement_14DECB
	waitmovement 0
	goto OldaleTown_EventScript_14DE4C
	end

OldaleTown_EventScript_14DE35:: @ 814DE35
	applymovement 255, OldaleTown_Movement_14DEB9
	applymovement 2, OldaleTown_Movement_14DE8E
	waitmovement 0
	goto OldaleTown_EventScript_14DE4C
	end

OldaleTown_EventScript_14DE4C:: @ 814DE4C
	msgbox OldaleTown_Text_16AF2F, 4
	giveitem_std ITEM_POTION
	compare RESULT, 0
	goto_if_eq OldaleTown_EventScript_14DE83
	msgbox OldaleTown_Text_16AFE1, 4
	setflag FLAG_RECEIVED_POTION_OLDALE
	fadedefaultbgm
	release
	end

OldaleTown_EventScript_14DE79:: @ 814DE79
	msgbox OldaleTown_Text_16AFE1, 4
	release
	end

OldaleTown_EventScript_14DE83:: @ 814DE83
	msgbox OldaleTown_Text_1A0CC2, 4
	fadedefaultbgm
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
	checkflag FLAG_ADVENTURE_STARTED
	goto_if_eq OldaleTown_EventScript_14DF26
	msgbox OldaleTown_Text_16B0CC, 4
	closemessage
	applymovement 3, OldaleTown_Movement_1A083D
	waitmovement 0
	release
	end

OldaleTown_EventScript_14DEFF:: @ 814DEFF
	lockall
	applymovement 255, OldaleTown_Movement_14DFEC
	applymovement 3, OldaleTown_Movement_14DFEF
	waitmovement 0
	msgbox OldaleTown_Text_16B045, 4
	closemessage
	applymovement 3, OldaleTown_Movement_14DFF5
	waitmovement 0
	releaseall
	end

OldaleTown_EventScript_14DF26:: @ 814DF26
	msgbox OldaleTown_Text_16B12A, 4
	release
	end

OldaleTown_EventScript_14DF30:: @ 814DF30
	lockall
	applymovement 4, OldaleTown_Movement_1A0839
	waitmovement 0
	goto OldaleTown_EventScript_14DF92
	end

OldaleTown_EventScript_14DF41:: @ 814DF41
	lockall
	applymovement 4, OldaleTown_Movement_14DFDE
	waitmovement 0
	applymovement 255, OldaleTown_Movement_1A0843
	waitmovement 0
	goto OldaleTown_EventScript_14DF92
	end

OldaleTown_EventScript_14DF5C:: @ 814DF5C
	lockall
	applymovement 4, OldaleTown_Movement_14DFE1
	waitmovement 0
	applymovement 255, OldaleTown_Movement_1A0843
	waitmovement 0
	goto OldaleTown_EventScript_14DF92
	end

OldaleTown_EventScript_14DF77:: @ 814DF77
	lockall
	applymovement 4, OldaleTown_Movement_14DFE3
	waitmovement 0
	applymovement 255, OldaleTown_Movement_1A0843
	waitmovement 0
	goto OldaleTown_EventScript_14DF92
	end

OldaleTown_EventScript_14DF92:: @ 814DF92
	checkplayergender
	compare RESULT, 0
	goto_if_eq OldaleTown_EventScript_14DFAA
	compare RESULT, 1
	goto_if_eq OldaleTown_EventScript_14DFB8
	end

OldaleTown_EventScript_14DFAA:: @ 814DFAA
	msgbox OldaleTown_Text_16B196, 4
	goto OldaleTown_EventScript_14DFC6
	end

OldaleTown_EventScript_14DFB8:: @ 814DFB8
	msgbox OldaleTown_Text_16B1BE, 4
	goto OldaleTown_EventScript_14DFC6
	end

OldaleTown_EventScript_14DFC6:: @ 814DFC6
	closemessage
	applymovement 4, OldaleTown_Movement_14DFE5
	waitmovement 0
	removeobject 4
	setvar VAR_OLDALE_STATE, 2
	setflag FLAG_HIDE_RIVAL_OLDALE_TOWN
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
