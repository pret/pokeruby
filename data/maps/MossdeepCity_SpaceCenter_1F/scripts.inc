MossdeepCity_SpaceCenter_1F_MapScripts:: @ 815AB8A
	.byte 0

MossdeepCity_SpaceCenter_1F_EventScript_15AB8B:: @ 815AB8B
	lock
	faceplayer
	dotimebasedevents
	specialvar VAR_RESULT, GetWeekCount
	buffernumberstring 0, VAR_RESULT
	compare VAR_RESULT, 0
	call_if_eq MossdeepCity_SpaceCenter_1F_EventScript_15ABBA
	compare VAR_RESULT, 1
	call_if_ge MossdeepCity_SpaceCenter_1F_EventScript_15ABC3
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

MossdeepCity_SpaceCenter_1F_EventScript_15ABBA:: @ 815ABBA
	msgbox MossdeepCity_SpaceCenter_1F_Text_18E1F3, MSGBOX_DEFAULT
	return

MossdeepCity_SpaceCenter_1F_EventScript_15ABC3:: @ 815ABC3
	msgbox MossdeepCity_SpaceCenter_1F_Text_18E214, MSGBOX_DEFAULT
	return

MossdeepCity_SpaceCenter_1F_EventScript_15ABCC:: @ 815ABCC
	msgbox MossdeepCity_SpaceCenter_1F_Text_18E251, MSGBOX_NPC
	end

MossdeepCity_SpaceCenter_1F_EventScript_15ABD5:: @ 815ABD5
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_SUN_STONE_MOSSDEEP, MossdeepCity_SpaceCenter_1F_EventScript_15AC0C
	msgbox MossdeepCity_SpaceCenter_1F_Text_18E335, MSGBOX_DEFAULT
	giveitem ITEM_SUN_STONE
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_SUN_STONE_MOSSDEEP
	msgbox MossdeepCity_SpaceCenter_1F_Text_18E39B, MSGBOX_DEFAULT
	release
	end

MossdeepCity_SpaceCenter_1F_EventScript_15AC0C:: @ 815AC0C
	msgbox MossdeepCity_SpaceCenter_1F_Text_18E39B, MSGBOX_DEFAULT
	release
	end

MossdeepCity_SpaceCenter_1F_EventScript_15AC16:: @ 815AC16
	msgbox MossdeepCity_SpaceCenter_1F_Text_18E3E5, MSGBOX_NPC
	end

MossdeepCity_SpaceCenter_1F_EventScript_15AC1F:: @ 815AC1F
	lock
	faceplayer
	msgbox MossdeepCity_SpaceCenter_1F_Text_18E427, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end
