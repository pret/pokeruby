Route104_MrBrineysHouse_MapScripts:: @ 815BCB2
	map_script 3, Route104_MrBrineysHouse_MapScript1_15BCB8
	.byte 0

Route104_MrBrineysHouse_MapScript1_15BCB8:: @ 815BCB8
	setflag FLAG_LANDMARK_MR_BRINEY_HOUSE
	compare VAR_BRINEY_HOUSE_STATE, 1
	call_if_eq Route104_MrBrineysHouse_EventScript_15BCD4
	call_if_set FLAG_RECEIVED_POKENAV, Route104_MrBrineysHouse_EventScript_15BCD0
	end

Route104_MrBrineysHouse_EventScript_15BCD0:: @ 815BCD0
	setflag FLAG_HIDE_RIVAL_RUSTBORO
	return

Route104_MrBrineysHouse_EventScript_15BCD4:: @ 815BCD4
	setobjectxyperm 1, 9, 3
	setobjectmovementtype 1, 50
	setobjectxyperm 2, 9, 6
	setobjectmovementtype 2, 51
	return

Route104_MrBrineysHouse_EventScript_15BCEB:: @ 815BCEB
	lock
	faceplayer
	call_if_unset FLAG_MR_BRINEY_SAILING_INTRO, Route104_MrBrineysHouse_EventScript_15BD0E
	goto_if_unset FLAG_DELIVERED_STEVEN_LETTER, Route104_MrBrineysHouse_EventScript_15BD65
	goto_if_unset FLAG_DELIVERED_DEVON_GOODS, Route104_MrBrineysHouse_EventScript_15BD7E
	goto Route104_MrBrineysHouse_EventScript_15BD32
	end

Route104_MrBrineysHouse_EventScript_15BD0E:: @ 815BD0E
	setflag FLAG_MR_BRINEY_SAILING_INTRO
	msgbox Route104_MrBrineysHouse_Text_191A82, 4
	msgbox Route104_MrBrineysHouse_Text_191AAD, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route104_MrBrineysHouse_EventScript_15BD97
	goto Route104_MrBrineysHouse_EventScript_15BDAB
	end

Route104_MrBrineysHouse_EventScript_15BD32:: @ 815BD32
	message Route104_MrBrineysHouse_Text_191E80
	waitmessage
	multichoicedefault 21, 8, 14, 1, 0
	switch RESULT
	case 0, Route104_MrBrineysHouse_EventScript_15BDAB
	case 1, Route104_MrBrineysHouse_EventScript_15BDA1
	case 127, Route104_MrBrineysHouse_EventScript_15BDA1
	end

Route104_MrBrineysHouse_EventScript_15BD65:: @ 815BD65
	msgbox Route104_MrBrineysHouse_Text_191CC3, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route104_MrBrineysHouse_EventScript_15BD97
	goto Route104_MrBrineysHouse_EventScript_15BDAB
	end

Route104_MrBrineysHouse_EventScript_15BD7E:: @ 815BD7E
	msgbox Route104_MrBrineysHouse_Text_191DA6, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route104_MrBrineysHouse_EventScript_15BD97
	goto Route104_MrBrineysHouse_EventScript_15BDAB
	end

Route104_MrBrineysHouse_EventScript_15BD97:: @ 815BD97
	msgbox Route104_MrBrineysHouse_Text_191C57, 4
	release
	end

Route104_MrBrineysHouse_EventScript_15BDA1:: @ 815BDA1
	msgbox Route104_MrBrineysHouse_Text_191EDB, 4
	release
	end

Route104_MrBrineysHouse_EventScript_15BDAB:: @ 815BDAB
	msgbox Route104_MrBrineysHouse_Text_191BFD, 4
	call Route104_MrBrineysHouse_EventScript_1A010C
	setvar VAR_BOARD_BRINEY_BOAT_ROUTE104_STATE, 1
	clearflag FLAG_HIDE_MR_BRINEY_ROUTE104
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	warp MAP_ROUTE104, 255, 13, 51
	waitstate
	releaseall
	end

Route104_MrBrineysHouse_EventScript_15BDD1:: @ 815BDD1
	lock
	faceplayer
	waitse
	playmoncry SPECIES_WINGULL, 0
	msgbox Route104_MrBrineysHouse_Text_191FB9, 4
	waitmoncry
	release
	end
