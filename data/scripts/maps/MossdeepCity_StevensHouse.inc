MossdeepCity_StevensHouse_MapScripts:: @ 815A9C5
	map_script 1, MossdeepCity_StevensHouse_MapScript1_15A9D5
	map_script 3, MossdeepCity_StevensHouse_MapScript1_15A9E9
	map_script 2, MossdeepCity_StevensHouse_MapScript2_15AA01
	.byte 0

MossdeepCity_StevensHouse_MapScript1_15A9D5:: @ 815A9D5
	checkflag SYS_GAME_CLEAR
	call_if 0, MossdeepCity_StevensHouse_EventScript_15A9DF
	end

MossdeepCity_StevensHouse_EventScript_15A9DF:: @ 815A9DF
	setmaptile 6, 4, 753, 1
	return

MossdeepCity_StevensHouse_MapScript1_15A9E9:: @ 815A9E9
	compare 0x40c6, 1
	call_if 1, MossdeepCity_StevensHouse_EventScript_15A9F5
	end

MossdeepCity_StevensHouse_EventScript_15A9F5:: @ 815A9F5
	setobjectxyperm 1, 6, 5
	setobjectmovementtype 1, 7
	return

MossdeepCity_StevensHouse_MapScript2_15AA01:: @ 815AA01
	map_script_2 0x40c6, 0, MossdeepCity_StevensHouse_EventScript_15AA0B
	.2byte 0

MossdeepCity_StevensHouse_EventScript_15AA0B:: @ 815AA0B
	lockall
	applymovement 1, MossdeepCity_StevensHouse_Movement_1A083F
	waitmovement 0
	playse 21
	applymovement 1, MossdeepCity_StevensHouse_Movement_1A0833
	waitmovement 0
	applymovement 1, MossdeepCity_StevensHouse_Movement_1A0835
	waitmovement 0
	applymovement 1, MossdeepCity_StevensHouse_Movement_15AA6E
	waitmovement 0
	msgbox MossdeepCity_StevensHouse_Text_18DA77, 4
	giveitem ITEM_HM08
	setflag FLAG_RECEIVED_HM08
	setflag FLAG_OMIT_DIVE_FROM_STEVEN_LETTER
	msgbox MossdeepCity_StevensHouse_Text_18DB22, 4
	closemessage
	delay 20
	applymovement 1, MossdeepCity_StevensHouse_Movement_15AA76
	waitmovement 0
	setvar 0x40c6, 1
	releaseall
	end

MossdeepCity_StevensHouse_Movement_15AA6E:: @ 815AA6E
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_25
	step_end

MossdeepCity_StevensHouse_Movement_15AA76:: @ 815AA76
	step_up
	step_right
	step_right
	step_right
	step_26
	step_end

MossdeepCity_StevensHouse_EventScript_15AA7C:: @ 815AA7C
	lockall
	msgbox MossdeepCity_StevensHouse_Text_18DD12, 5
	compare RESULT, 0
	goto_if_eq MossdeepCity_StevensHouse_EventScript_15AAE6
	countpokemon
	compare RESULT, 6
	goto_if_eq MossdeepCity_StevensHouse_EventScript_15AADC
	copyvar 0x8004, RESULT
	removeobject 2
	playfanfare 370
	message MossdeepCity_StevensHouse_Text_18DD61
	waitfanfare
	waitmessage
	givepoke SPECIES_BELDUM, 5, ITEM_NONE, 0x0, 0x0, 0
	getspeciesname 1, SPECIES_BELDUM
	msgbox MossdeepCity_StevensHouse_Text_1A1102, 5
	compare RESULT, 1
	call_if 1, MossdeepCity_StevensHouse_EventScript_1A0678
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
	checkflag FLAG_OMIT_DIVE_FROM_STEVEN_LETTER
	goto_if_eq MossdeepCity_StevensHouse_EventScript_15AB16
	msgbox MossdeepCity_StevensHouse_Text_18DF1A, 4
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_15AB16:: @ 815AB16
	msgbox MossdeepCity_StevensHouse_Text_18DDC2, 4
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_15AB20:: @ 815AB20
	giveitem ITEM_HM08, 1, 1
	setflag FLAG_RECEIVED_HM08
	end
