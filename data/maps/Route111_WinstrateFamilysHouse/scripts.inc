Route111_WinstrateFamilysHouse_MapScripts:: @ 815BF24
	.byte 0

Route111_WinstrateFamilysHouse_EventScript_15BF25:: @ 815BF25
	lock
	faceplayer
	setvar VAR_0x8008, 2
	msgbox Route111_WinstrateFamilysHouse_Text_191FCE, MSGBOX_DEFAULT
	goto Route111_WinstrateFamilysHouse_EventScript_15BFC4
	end

Route111_WinstrateFamilysHouse_EventScript_15BF3A:: @ 815BF3A
	lock
	faceplayer
	setvar VAR_0x8008, 3
	goto_if_set FLAG_RECEIVED_MACHO_BRACE, Route111_WinstrateFamilysHouse_EventScript_15BF72
	msgbox Route111_WinstrateFamilysHouse_Text_19208A, MSGBOX_DEFAULT
	giveitem ITEM_MACHO_BRACE
	compare VAR_RESULT, 0
	goto_if_eq Route111_WinstrateFamilysHouse_EventScript_1A029B
	setflag FLAG_RECEIVED_MACHO_BRACE
	goto Route111_WinstrateFamilysHouse_EventScript_15BFC4
	end

Route111_WinstrateFamilysHouse_EventScript_15BF72:: @ 815BF72
	msgbox Route111_WinstrateFamilysHouse_Text_19214D, MSGBOX_DEFAULT
	goto Route111_WinstrateFamilysHouse_EventScript_15BFC4
	end

Route111_WinstrateFamilysHouse_EventScript_15BF80:: @ 815BF80
	lock
	faceplayer
	setvar VAR_0x8008, 1
	msgbox Route111_WinstrateFamilysHouse_Text_192190, MSGBOX_DEFAULT
	goto Route111_WinstrateFamilysHouse_EventScript_15BFC4
	end

Route111_WinstrateFamilysHouse_EventScript_15BF95:: @ 815BF95
	lock
	faceplayer
	setvar VAR_0x8008, 4
	goto_if_set FLAG_TEMP_4, Route111_WinstrateFamilysHouse_EventScript_15BFB6
	msgbox Route111_WinstrateFamilysHouse_Text_192219, MSGBOX_DEFAULT
	setflag FLAG_TEMP_4
	goto Route111_WinstrateFamilysHouse_EventScript_15BFC4
	end

Route111_WinstrateFamilysHouse_EventScript_15BFB6:: @ 815BFB6
	msgbox Route111_WinstrateFamilysHouse_Text_192334, MSGBOX_DEFAULT
	goto Route111_WinstrateFamilysHouse_EventScript_15BFC4
	end

Route111_WinstrateFamilysHouse_EventScript_15BFC4:: @ 815BFC4
	closemessage
	applymovement VAR_0x8008, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end
