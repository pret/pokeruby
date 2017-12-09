Route104_MrBrineysHouse_MapScripts:: @ 815BCB2
	map_script 3, Route104_MrBrineysHouse_MapScript1_15BCB8
	.byte 0

Route104_MrBrineysHouse_MapScript1_15BCB8:: @ 815BCB8
	setflag 2109
	compare 0x4090, 1
	call_if 1, Route104_MrBrineysHouse_EventScript_15BCD4
	checkflag FLAG_RECEIVED_POKENAV
	call_if 1, Route104_MrBrineysHouse_EventScript_15BCD0
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
	checkflag FLAG_MR_BRINEY_SAILING_INTRO
	call_if 0, Route104_MrBrineysHouse_EventScript_15BD0E
	checkflag FLAG_DELIVERED_STEVEN_LETTER
	goto_if 0, Route104_MrBrineysHouse_EventScript_15BD65
	checkflag FLAG_DELIVERED_DEVON_GOODS
	goto_if 0, Route104_MrBrineysHouse_EventScript_15BD7E
	goto Route104_MrBrineysHouse_EventScript_15BD32
	end

Route104_MrBrineysHouse_EventScript_15BD0E:: @ 815BD0E
	setflag FLAG_MR_BRINEY_SAILING_INTRO
	msgbox Route104_MrBrineysHouse_Text_191A82, 4
	msgbox Route104_MrBrineysHouse_Text_191AAD, 5
	compare RESULT, 0
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
	msgbox Route104_MrBrineysHouse_Text_191CC3, 5
	compare RESULT, 0
	goto_if_eq Route104_MrBrineysHouse_EventScript_15BD97
	goto Route104_MrBrineysHouse_EventScript_15BDAB
	end

Route104_MrBrineysHouse_EventScript_15BD7E:: @ 815BD7E
	msgbox Route104_MrBrineysHouse_Text_191DA6, 5
	compare RESULT, 0
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
	setvar 0x408e, 1
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
	playpokecry SPECIES_WINGULL, 0
	msgbox Route104_MrBrineysHouse_Text_191FB9, 4
	waitpokecry
	release
	end
