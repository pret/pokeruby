MossdeepCity_StevensHouse_MapScripts:: @ 815A9C5
	map_script 1, MossdeepCity_StevensHouse_MapScript1_15A9D5
	map_script 3, MossdeepCity_StevensHouse_MapScript1_15A9E9
	map_script 2, MossdeepCity_StevensHouse_MapScript2_15AA01
	.byte 0

MossdeepCity_StevensHouse_MapScript1_15A9D5:: @ 815A9D5
	call_if_unset FLAG_SYS_GAME_CLEAR, MossdeepCity_StevensHouse_EventScript_15A9DF
	end

MossdeepCity_StevensHouse_EventScript_15A9DF:: @ 815A9DF
	setmetatile 6, 4, 753, 1
	return

MossdeepCity_StevensHouse_MapScript1_15A9E9:: @ 815A9E9
	compare VAR_STEVENS_HOUSE_STATE, 1
	call_if_eq MossdeepCity_StevensHouse_EventScript_15A9F5
	end

MossdeepCity_StevensHouse_EventScript_15A9F5:: @ 815A9F5
	setobjectxyperm 1, 6, 5
	setobjectmovementtype 1, 7
	return

MossdeepCity_StevensHouse_MapScript2_15AA01:: @ 815AA01
	map_script_2 VAR_STEVENS_HOUSE_STATE, 0, MossdeepCity_StevensHouse_EventScript_15AA0B
	.2byte 0

MossdeepCity_StevensHouse_EventScript_15AA0B:: @ 815AA0B
	lockall
	applymovement 1, MossdeepCity_StevensHouse_Movement_1A083F
	waitmovement 0
	playse SE_PIN
	applymovement 1, MossdeepCity_StevensHouse_Movement_1A0833
	waitmovement 0
	applymovement 1, MossdeepCity_StevensHouse_Movement_1A0835
	waitmovement 0
	applymovement 1, MossdeepCity_StevensHouse_Movement_15AA6E
	waitmovement 0
	msgbox MossdeepCity_StevensHouse_Text_18DA77, 4
	giveitem_std ITEM_HM08_DIVE
	setflag FLAG_RECEIVED_HM08
	setflag FLAG_OMIT_DIVE_FROM_STEVEN_LETTER
	msgbox MossdeepCity_StevensHouse_Text_18DB22, 4
	closemessage
	delay 20
	applymovement 1, MossdeepCity_StevensHouse_Movement_15AA76
	waitmovement 0
	setvar VAR_STEVENS_HOUSE_STATE, 1
	releaseall
	end

MossdeepCity_StevensHouse_Movement_15AA6E:: @ 815AA6E
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_down
	end_movement

MossdeepCity_StevensHouse_Movement_15AA76:: @ 815AA76
	walk_up
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	end_movement

MossdeepCity_StevensHouse_EventScript_15AA7C:: @ 815AA7C
	lockall
	msgbox MossdeepCity_StevensHouse_Text_18DD12, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq MossdeepCity_StevensHouse_EventScript_15AAE6
	getpartysize
	compare RESULT, 6
	goto_if_eq MossdeepCity_StevensHouse_EventScript_15AADC
	copyvar VAR_SPECIAL_4, RESULT
	removeobject 2
	playfanfare MUS_FANFA4
	message MossdeepCity_StevensHouse_Text_18DD61
	waitfanfare
	waitmessage
	givemon SPECIES_BELDUM, 5, ITEM_NONE, 0x0, 0x0, 0
	bufferspeciesname 1, SPECIES_BELDUM
	msgbox MossdeepCity_StevensHouse_Text_1A1102, MSGBOX_YESNO
	compare RESULT, YES
	call_if_eq MossdeepCity_StevensHouse_EventScript_1A0678
	setflag FLAG_HIDE_BELDUM_BALL_STEVENS_HOUSE
	setflag FLAG_RECEIVED_BELDUM
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_15AADC:: @ 815AADC
	msgbox MossdeepCity_StevensHouse_Text_18DD77, 4
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_15AAE6:: @ 815AAE6
	msgbox MossdeepCity_StevensHouse_Text_18DD9E, 4
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_15AAF0:: @ 815AAF0
	msgbox MossdeepCity_StevensHouse_Text_18E0A3, 3
	end

MossdeepCity_StevensHouse_EventScript_15AAF9:: @ 815AAF9
	msgbox MossdeepCity_StevensHouse_Text_18DC25, 2
	end

MossdeepCity_StevensHouse_EventScript_15AB02:: @ 815AB02
	lockall
	goto_if_set FLAG_OMIT_DIVE_FROM_STEVEN_LETTER, MossdeepCity_StevensHouse_EventScript_15AB16
	msgbox MossdeepCity_StevensHouse_Text_18DF1A, 4
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_15AB16:: @ 815AB16
	msgbox MossdeepCity_StevensHouse_Text_18DDC2, 4
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_15AB20:: @ 815AB20
	giveitem_std ITEM_HM08_DIVE, 1, 1
	setflag FLAG_RECEIVED_HM08
	end
