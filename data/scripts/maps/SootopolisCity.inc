SootopolisCity_MapScripts:: @ 814D07D
	map_script 1, SootopolisCity_MapScript1_14D08D
	map_script 3, SootopolisCity_MapScript1_14D10D
	map_script 5, SootopolisCity_MapScript1_14D165
	.byte 0

SootopolisCity_MapScript1_14D08D:: @ 814D08D
	call_if_unset FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, SootopolisCity_EventScript_14D0A0
	call_if_set FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, SootopolisCity_EventScript_14D0B1
	end

SootopolisCity_EventScript_14D0A0:: @ 814D0A0
	setobjectxyperm 3, 31, 18
	setmetatile 31, 32, 592, 1
	return

SootopolisCity_EventScript_14D0B1:: @ 814D0B1
	call_if_unset FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_14D0BB
	return

SootopolisCity_EventScript_14D0BB:: @ 814D0BB
	setmetatile 9, 6, 584, 1
	setmetatile 9, 17, 584, 1
	setmetatile 9, 26, 584, 1
	setmetatile 44, 17, 584, 1
	setmetatile 8, 35, 584, 1
	setmetatile 53, 28, 584, 1
	setmetatile 45, 6, 584, 1
	setmetatile 48, 25, 584, 1
	setmetatile 31, 32, 592, 1
	return

SootopolisCity_MapScript1_14D10D:: @ 814D10D
	setflag FLAG_VISITED_SOOTOPOLIS_CITY
	call_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_14D159
	call_if_set FLAG_SYS_WEATHER_CTRL, SootopolisCity_EventScript_14D123
	end

SootopolisCity_EventScript_14D123:: @ 814D123
	call SootopolisCity_EventScript_1A02C1
	setobjectxyperm 1, 29, 19
	setobjectxyperm 2, 33, 19
	compare VAR_SOOTOPOLIS_STATE, 1
	call_if_eq SootopolisCity_EventScript_14D142
	return

SootopolisCity_EventScript_14D142:: @ 814D142
	setobjectxyperm 10, 29, 6
	setobjectmovementtype 10, 10
	setobjectxyperm 5, 30, 6
	setobjectmovementtype 5, 9
	return

SootopolisCity_EventScript_14D159:: @ 814D159
	setobjectxyperm 10, 31, 33
	setobjectmovementtype 10, 8
	return

SootopolisCity_MapScript1_14D165:: @ 814D165
	setdivewarp MAP_UNDERWATER_SOOTOPOLIS_CITY, 255, 9, 6
	end

SootopolisCity_EventScript_14D16E:: @ 814D16E
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_14D183
	msgbox SootopolisCity_Text_1696A4, 4
	release
	end

SootopolisCity_EventScript_14D183:: @ 814D183
	msgbox SootopolisCity_Text_16A455, 4
	release
	end

SootopolisCity_EventScript_14D18D:: @ 814D18D
	msgbox SootopolisCity_Text_16A2B2, 2
	end

SootopolisCity_EventScript_14D196:: @ 814D196
	msgbox SootopolisCity_Text_16A2FB, 2
	end

SootopolisCity_EventScript_14D19F:: @ 814D19F
	lock
	faceplayer
	dodailyevents
	special GetPlayerBigGuyGirlString
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_SOOTOPOLIS, SootopolisCity_EventScript_14D241
	msgbox SootopolisCity_Text_1C63F2, 4
	random 10
	addvar RESULT, 20
	addvar RESULT, ITEM_CHERI_BERRY
	giveitem_std RESULT
	compare RESULT, 0
	goto_if_eq SootopolisCity_EventScript_1A029B
	setflag FLAG_DAILY_RECEIVED_BERRY_SOOTOPOLIS
	msgbox SootopolisCity_Text_1C64D0, 4
	random 2
	compare RESULT, 0
	goto_if_eq SootopolisCity_EventScript_14D1FF
	compare RESULT, 1
	goto_if_eq SootopolisCity_EventScript_14D220
	end

SootopolisCity_EventScript_14D1FF:: @ 814D1FF
	giveitem_std ITEM_FIGY_BERRY
	compare RESULT, 0
	goto_if_eq SootopolisCity_EventScript_1A029B
	msgbox SootopolisCity_Text_1C650B, 4
	release
	end

SootopolisCity_EventScript_14D220:: @ 814D220
	giveitem_std ITEM_IAPAPA_BERRY
	compare RESULT, 0
	goto_if_eq SootopolisCity_EventScript_1A029B
	msgbox SootopolisCity_Text_1C650B, 4
	release
	end

SootopolisCity_EventScript_14D241:: @ 814D241
	msgbox SootopolisCity_Text_1C6540, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SootopolisCity_EventScript_14D25E
	msgbox SootopolisCity_Text_1C6626, 4
	release
	end

SootopolisCity_EventScript_14D25E:: @ 814D25E
	msgbox SootopolisCity_Text_1C65D4, 4
	release
	end

SootopolisCity_EventScript_14D268:: @ 814D268
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_SOOTOPOLIS_GYM, SootopolisCity_EventScript_14D27D
	msgbox SootopolisCity_Text_16A4D6, 4
	release
	end

SootopolisCity_EventScript_14D27D:: @ 814D27D
	msgbox SootopolisCity_Text_16A531, 4
	release
	end

SootopolisCity_EventScript_14D287:: @ 814D287
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_14D29C
	msgbox SootopolisCity_Text_169813, 4
	release
	end

SootopolisCity_EventScript_14D29C:: @ 814D29C
	msgbox SootopolisCity_Text_16A587, 4
	release
	end

SootopolisCity_EventScript_14D2A6:: @ 814D2A6
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_14D2BB
	msgbox SootopolisCity_Text_1698A0, 4
	release
	end

SootopolisCity_EventScript_14D2BB:: @ 814D2BB
	msgbox SootopolisCity_Text_16A614, 4
	release
	end

SootopolisCity_EventScript_14D2C5:: @ 814D2C5
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_14D2DA
	msgbox SootopolisCity_Text_1697A7, 4
	release
	end

SootopolisCity_EventScript_14D2DA:: @ 814D2DA
	msgbox SootopolisCity_Text_16A6AE, 4
	release
	end

SootopolisCity_EventScript_14D2E4:: @ 814D2E4
	msgbox SootopolisCity_Text_16972B, 2
	end

SootopolisCity_EventScript_14D2ED:: @ 814D2ED
	msgbox SootopolisCity_Text_16A6C7, 3
	end

SootopolisCity_EventScript_14D2F6:: @ 814D2F6
	msgbox SootopolisCity_Text_16A711, 3
	end

ClosedSootopolisDoorScript:: @ 814D2FF
	msgbox ClosedSootopolisDoorText, 3
	end

SootopolisCity_EventScript_14D308:: @ 814D308
	lockall
	applymovement 10, SootopolisCity_Movement_1A083F
	applymovement 255, SootopolisCity_Movement_1A0843
	waitmovement 0
	playse SE_PIN
	applymovement 10, SootopolisCity_Movement_1A0833
	waitmovement 0
	applymovement 10, SootopolisCity_Movement_1A0835
	waitmovement 0
	applymovement 10, SootopolisCity_Movement_14D413
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169988, 4
	.else
	msgbox SootopolisCity_Text_169E0F, 4
	.endif
	closemessage
	applymovement 10, SootopolisCity_Movement_14D417
	applymovement 255, SootopolisCity_Movement_14D440
	waitmovement 10
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_1699FD, 4
	.else
	msgbox SootopolisCity_Text_169E82, 4
	.endif
	playse SE_PIN
	applymovement 5, SootopolisCity_Movement_1A0833
	waitmovement 0
	applymovement 5, SootopolisCity_Movement_1A0835
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169AB7, 4
	.else
	msgbox SootopolisCity_Text_169F3C, 4
	.endif
	closemessage
	delay 30
	applymovement 5, SootopolisCity_Movement_14D46A
	applymovement 10, SootopolisCity_Movement_14D41D
	applymovement 255, SootopolisCity_Movement_14D445
	waitmovement 0
	applymovement 5, SootopolisCity_Movement_1A0843
	applymovement 255, SootopolisCity_Movement_1A0843
	waitmovement 0
	delay 30
	applymovement 10, SootopolisCity_Movement_1A0845
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169AE7, 4
	.else
	msgbox SootopolisCity_Text_169F6B, 4
	.endif
	closemessage
	delay 30
	applymovement 5, SootopolisCity_Movement_14D47C
	applymovement 255, SootopolisCity_Movement_14D457
	applymovement 10, SootopolisCity_Movement_14D42D
	waitmovement 0
	applymovement 5, SootopolisCity_Movement_1A083F
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169BC7, 4
	.else
	msgbox SootopolisCity_Text_16A06C, 4
	.endif
	applymovement 255, SootopolisCity_Movement_1A083F
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169C99, 4
	.else
	msgbox SootopolisCity_Text_16A13E, 4
	.endif
	moveobjectoffscreen 5
	setobjectmovementtype 5, 9
	moveobjectoffscreen 10
	setobjectmovementtype 10, 10
	setvar VAR_SOOTOPOLIS_STATE, 2
	releaseall
	end

SootopolisCity_Movement_14D413:: @ 814D413
	walk_left
	walk_left
	walk_left
	end_movement

SootopolisCity_Movement_14D417:: @ 814D417
	walk_right
	walk_right
	walk_right
	walk_up
	walk_in_place_fastest_down
	end_movement

SootopolisCity_Movement_14D41D:: @ 814D41D
	walk_down
	walk_right
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	end_movement

SootopolisCity_Movement_14D42D:: @ 814D42D
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

SootopolisCity_Movement_14D440:: @ 814D440
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

SootopolisCity_Movement_14D445:: @ 814D445
	walk_right
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

SootopolisCity_Movement_14D457:: @ 814D457
	delay_16
	delay_16
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

SootopolisCity_Movement_14D46A:: @ 814D46A
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

SootopolisCity_Movement_14D47C:: @ 814D47C
	delay_16
	delay_16
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	end_movement

SootopolisCity_EventScript_14D48F:: @ 814D48F
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169D37, 2
	.else
	msgbox SootopolisCity_Text_16A1DB, 2
	.endif
	end

SootopolisCity_EventScript_14D498:: @ 814D498
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_14D4AD
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_169DA6, 4
	.else
	msgbox SootopolisCity_Text_16A249, 4
	.endif
	release
	end

SootopolisCity_EventScript_14D4AD:: @ 814D4AD
	msgbox SootopolisCity_Text_16A33E, 4
	closemessage
	applymovement LAST_TALKED, SootopolisCity_Movement_1A0845
	waitmovement 0
	delay 50
	setfieldeffectargument 0, 1
	dofieldeffect FLDEFF_NPCFLY_OUT
	delay 15
	removeobject LAST_TALKED
	waitfieldeffect FLDEFF_NPCFLY_OUT
	release
	end
