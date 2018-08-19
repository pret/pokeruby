Route110_MapScripts:: @ 814F900
	map_script 5, Route110_MapScript1_14F910
	map_script 3, Route110_MapScript1_14F914
	map_script 2, Route110_MapScript2_14F933
	.byte 0

Route110_MapScript1_14F910:: @ 814F910
	special UpdateCyclingRoadState
	end

Route110_MapScript1_14F914:: @ 814F914
	call Route110_EventScript_1A0196
	call Route110_EventScript_1A014E
	call Route110_EventScript_1A0172
	compare VAR_CYCLING_CHALLENGE_STATE, 1
	call_if_eq Route110_EventScript_14F92F
	end

Route110_EventScript_14F92F:: @ 814F92F
	savebgm MUS_CYCLING
	return

Route110_MapScript2_14F933:: @ 814F933
	map_script_2 VAR_CYCLING_CHALLENGE_STATE, 1, Route110_EventScript_14F93D
	.2byte 0

Route110_EventScript_14F93D:: @ 814F93D
	special ScrSpecial_BeginCyclingRoadChallenge
	setvar VAR_CYCLING_CHALLENGE_STATE, 2
	return

Route110_EventScript_14F946:: @ 814F946
	lock
	faceplayer
	msgbox Route110_Text_16E6C0, 4
	applymovement LAST_TALKED, Route110_Movement_1A083D
	waitmovement 0
	release
	end

Route110_EventScript_14F95C:: @ 814F95C
	lock
	faceplayer
	msgbox Route110_Text_16E6F2, 4
	applymovement LAST_TALKED, Route110_Movement_1A083D
	waitmovement 0
	release
	end

Route110_EventScript_14F972:: @ 814F972
	lock
	faceplayer
	msgbox Route110_Text_16E729, 4
	applymovement LAST_TALKED, Route110_Movement_1A083D
	waitmovement 0
	release
	end

Route110_EventScript_14F988:: @ 814F988
	lock
	faceplayer
	msgbox Route110_Text_16E76A, 4
	applymovement LAST_TALKED, Route110_Movement_1A083D
	waitmovement 0
	release
	end

Route110_EventScript_14F99E:: @ 814F99E
	msgbox Route110_Text_16EB22, 2
	end

Route110_EventScript_14F9A7:: @ 814F9A7
	msgbox Route110_Text_16EB65, 2
	end

Route110_EventScript_14F9B0:: @ 814F9B0
	msgbox Route110_Text_16EBC9, 2
	end

Route110_EventScript_14F9B9:: @ 814F9B9
	msgbox Route110_Text_16EDC5, 2
	end

Route110_EventScript_14F9C2:: @ 814F9C2
	msgbox Route110_Text_16EE30, 2
	end

Route110_EventScript_14F9CB:: @ 814F9CB
	msgbox Route110_Text_16EE74, 2
	end

Route110_EventScript_14F9D4:: @ 814F9D4
	msgbox Route110_Text_16EEF6, 2
	end

Route110_EventScript_14F9DD:: @ 814F9DD
	msgbox Route110_Text_16F381, 3
	end

Route110_EventScript_14F9E6:: @ 814F9E6
	msgbox Route110_Text_16F39C, 3
	end

Route110_EventScript_14F9EF:: @ 814F9EF
	msgbox Route110_Text_16F3B1, 3
	end

Route110_EventScript_14F9F8:: @ 814F9F8
	msgbox Route110_Text_16F3E9, 3
	end

Route110_EventScript_14FA01:: @ 814FA01
	msgbox Route110_Text_16F3FF, 3
	end

Route110_EventScript_14FA0A:: @ 814FA0A
	msgbox Route110_Text_16F40F, 3
	end

Route110_EventScript_14FA13:: @ 814FA13
	msgbox Route110_Text_16F429, 3
	end

Route110_EventScript_14FA1C:: @ 814FA1C
	msgbox Route110_Text_16F4AE, 3
	end

Route110_EventScript_14FA25:: @ 814FA25
	msgbox Route110_Text_16F4F7, 3
	end

Route110_EventScript_14FA2E:: @ 814FA2E
	lockall
	specialvar RESULT, GetRecordedCyclingRoadResults
	compare RESULT, 0
	goto_if_eq Route110_EventScript_14FA49
	msgbox Route110_Text_16F53A, 4
	releaseall
	end

Route110_EventScript_14FA49:: @ 814FA49
	msgbox Route110_Text_16F57C, 4
	releaseall
	end

Route110_EventScript_14FA53:: @ 814FA53
	lock
	faceplayer
	specialvar RESULT, GetPlayerAvatarBike
	compare RESULT, 1
	goto_if_eq Route110_EventScript_14FA84
	compare VAR_CYCLING_CHALLENGE_STATE, 0
	goto_if_eq Route110_EventScript_14FA7A
	msgbox Route110_Text_16F26A, 4
	release
	end

Route110_EventScript_14FA7A:: @ 814FA7A
	msgbox Route110_Text_16F1D0, 4
	release
	end

Route110_EventScript_14FA84:: @ 814FA84
	msgbox Route110_Text_16F2C4, 4
	release
	end

Route110_EventScript_14FA8E:: @ 814FA8E
	trainerbattle 0, TRAINER_EDWARD, 0, Route110_Text_1BA699, Route110_Text_1BA6D2
	msgbox Route110_Text_1BA6F8, 6
	end

Route110_EventScript_14FAA5:: @ 814FAA5
	trainerbattle 0, TRAINER_JACLYN, 0, Route110_Text_1BA72D, Route110_Text_1BA759
	msgbox Route110_Text_1BA76C, 6
	end

Route110_EventScript_14FABC:: @ 814FABC
	trainerbattle 0, TRAINER_EDWIN_1, 0, Route110_Text_1BA7D2, Route110_Text_1BA803
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route110_EventScript_14FAE3
	msgbox Route110_Text_1BA829, 6
	end

Route110_EventScript_14FAE3:: @ 814FAE3
	trainerbattle 5, TRAINER_EDWIN_1, 0, Route110_Text_1BA877, Route110_Text_1BA8CD
	msgbox Route110_Text_1BA8E9, 6
	end

Route110_EventScript_14FAFA:: @ 814FAFA
	trainerbattle 0, TRAINER_DALE, 0, Route110_Text_1BA913, Route110_Text_1BA93C
	msgbox Route110_Text_1BA94A, 6
	end

Route110_EventScript_14FB11:: @ 814FB11
	trainerbattle 0, TRAINER_JACOB, 0, Route110_Text_1BA22C, Route110_Text_1BA264
	msgbox Route110_Text_1BA27C, 6
	end

Route110_EventScript_14FB28:: @ 814FB28
	trainerbattle 0, TRAINER_ANTHONY, 0, Route110_Text_1BA2D4, Route110_Text_1BA2FC
	msgbox Route110_Text_1BA30C, 6
	end

Route110_EventScript_14FB3F:: @ 814FB3F
	trainerbattle 0, TRAINER_BENJAMIN_1, 0, Route110_Text_1BA352, Route110_Text_1BA379
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route110_EventScript_14FB66
	msgbox Route110_Text_1BA3A5, 6
	end

Route110_EventScript_14FB66:: @ 814FB66
	trainerbattle 5, TRAINER_BENJAMIN_1, 0, Route110_Text_1BA3EF, Route110_Text_1BA432
	msgbox Route110_Text_1BA456, 6
	end

Route110_EventScript_14FB7D:: @ 814FB7D
	trainerbattle 0, TRAINER_JASMINE, 0, Route110_Text_1BA5FF, Route110_Text_1BA63C
	msgbox Route110_Text_1BA65F, 6
	end

Route110_EventScript_14FB94:: @ 814FB94
	trainerbattle 0, TRAINER_ABIGAIL_1, 0, Route110_Text_1BA4A0, Route110_Text_1BA50F
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route110_EventScript_14FBBB
	msgbox Route110_Text_1BA52E, 6
	end

Route110_EventScript_14FBBB:: @ 814FBBB
	trainerbattle 5, TRAINER_ABIGAIL_1, 0, Route110_Text_1BA573, Route110_Text_1BA5A1
	msgbox Route110_Text_1BA5C4, 6
	end

Route110_EventScript_14FBD2:: @ 814FBD2
	trainerbattle 0, TRAINER_ISABEL_1, 0, Route110_Text_1BA990, Route110_Text_1BA9D0
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route110_EventScript_14FBF9
	msgbox Route110_Text_1BA9E9, 6
	end

Route110_EventScript_14FBF9:: @ 814FBF9
	trainerbattle 5, TRAINER_ISABEL_1, 0, Route110_Text_1BAA2D, Route110_Text_1BAA76
	msgbox Route110_Text_1BAA8F, 6
	end

Route110_EventScript_14FC10:: @ 814FC10
	trainerbattle 0, TRAINER_TIMMY, 0, Route110_Text_1BAAC3, Route110_Text_1BAAF7
	msgbox Route110_Text_1BAB19, 6
	end

Route110_EventScript_14FC27:: @ 814FC27
	lockall
	applymovement 21, Route110_Movement_1A0843
	waitmovement 0
	call Route110_EventScript_14FC39
	releaseall
	end

Route110_EventScript_14FC39:: @ 814FC39
	special FinishCyclingRoadChallenge
	msgbox Route110_Text_16EF65, 4
	switch RESULT
	case 10, Route110_EventScript_14FCC3
	case 9, Route110_EventScript_14FCD1
	case 8, Route110_EventScript_14FCD1
	case 7, Route110_EventScript_14FCD1
	case 6, Route110_EventScript_14FCDF
	case 5, Route110_EventScript_14FCDF
	case 4, Route110_EventScript_14FCDF
	case 3, Route110_EventScript_14FCED
	case 2, Route110_EventScript_14FCED
	case 1, Route110_EventScript_14FCED
	case 0, Route110_EventScript_14FCFB
	end

Route110_EventScript_14FCC3:: @ 814FCC3
	msgbox Route110_Text_16EF9F, 4
	goto Route110_EventScript_14FD09
	end

Route110_EventScript_14FCD1:: @ 814FCD1
	msgbox Route110_Text_16F012, 4
	goto Route110_EventScript_14FD09
	end

Route110_EventScript_14FCDF:: @ 814FCDF
	msgbox Route110_Text_16F069, 4
	goto Route110_EventScript_14FD09
	end

Route110_EventScript_14FCED:: @ 814FCED
	msgbox Route110_Text_16F0D0, 4
	goto Route110_EventScript_14FD09
	end

Route110_EventScript_14FCFB:: @ 814FCFB
	msgbox Route110_Text_16F139, 4
	goto Route110_EventScript_14FD09
	end

Route110_EventScript_14FD09:: @ 814FD09
	setvar VAR_CYCLING_CHALLENGE_STATE, 3
	savebgm 0
	fadedefaultbgm
	return

Route110_EventScript_14FD13:: @ 814FD13
	setvar VAR_SPECIAL_8, 1
	goto Route110_EventScript_14FD34
	end

Route110_EventScript_14FD1E:: @ 814FD1E
	setvar VAR_SPECIAL_8, 2
	goto Route110_EventScript_14FD34
	end

Route110_EventScript_14FD29:: @ 814FD29
	setvar VAR_SPECIAL_8, 3
	goto Route110_EventScript_14FD34
	end

Route110_EventScript_14FD34:: @ 814FD34
	lockall
	checkplayergender
	compare RESULT, 0
	call_if_eq Route110_EventScript_14FDA7
	compare RESULT, 1
	call_if_eq Route110_EventScript_14FDAC
	applymovement 28, Route110_Movement_1A0845
	waitmovement 0
	applymovement 28, Route110_Movement_1A0833
	waitmovement 0
	applymovement 28, Route110_Movement_1A0835
	waitmovement 0
	delay 30
	compare VAR_SPECIAL_8, 1
	call_if_eq Route110_EventScript_14FF14
	compare VAR_SPECIAL_8, 2
	call_if_eq Route110_EventScript_14FF1F
	compare VAR_SPECIAL_8, 3
	call_if_eq Route110_EventScript_14FF2A
	checkplayergender
	compare RESULT, 0
	goto_if_eq Route110_EventScript_14FDB1
	compare RESULT, 1
	goto_if_eq Route110_EventScript_14FE2B
	releaseall
	end

Route110_EventScript_14FDA7:: @ 814FDA7
	playbgm MUS_GIRL_SUP, TRUE
	return

Route110_EventScript_14FDAC:: @ 814FDAC
	playbgm MUS_BOY_SUP, TRUE
	return

Route110_EventScript_14FDB1:: @ 814FDB1
	msgbox Route110_Text_16E7A1, 4
	switch VAR_STARTER_MON
	case 0, Route110_EventScript_14FDE0
	case 1, Route110_EventScript_14FDF0
	case 2, Route110_EventScript_14FE00
	end

Route110_EventScript_14FDE0:: @ 814FDE0
	trainerbattle 3, TRAINER_MAY_5, 0, Route110_Text_16E826
	goto Route110_EventScript_14FE10
	end

Route110_EventScript_14FDF0:: @ 814FDF0
	trainerbattle 3, TRAINER_MAY_8, 0, Route110_Text_16E826
	goto Route110_EventScript_14FE10
	end

Route110_EventScript_14FE00:: @ 814FE00
	trainerbattle 3, TRAINER_MAY_2, 0, Route110_Text_16E826
	goto Route110_EventScript_14FE10
	end

Route110_EventScript_14FE10:: @ 814FE10
	msgbox Route110_Text_16E84C, 4
	call Route110_EventScript_14FEA5
	msgbox Route110_Text_16E8B3, 4
	goto Route110_EventScript_14FEB2
	end

Route110_EventScript_14FE2B:: @ 814FE2B
	msgbox Route110_Text_16E99A, 4
	switch VAR_STARTER_MON
	case 0, Route110_EventScript_14FE5A
	case 1, Route110_EventScript_14FE6A
	case 2, Route110_EventScript_14FE7A
	end

Route110_EventScript_14FE5A:: @ 814FE5A
	trainerbattle 3, TRAINER_BRENDAN_5, 0, Route110_Text_16EA0F
	goto Route110_EventScript_14FE8A
	end

Route110_EventScript_14FE6A:: @ 814FE6A
	trainerbattle 3, TRAINER_BRENDAN_8, 0, Route110_Text_16EA0F
	goto Route110_EventScript_14FE8A
	end

Route110_EventScript_14FE7A:: @ 814FE7A
	trainerbattle 3, TRAINER_BRENDAN_2, 0, Route110_Text_16EA0F
	goto Route110_EventScript_14FE8A
	end

Route110_EventScript_14FE8A:: @ 814FE8A
	msgbox Route110_Text_16EA2A, 4
	call Route110_EventScript_14FEA5
	msgbox Route110_Text_16EA7B, 4
	goto Route110_EventScript_14FEB2
	end

Route110_EventScript_14FEA5:: @ 814FEA5
	giveitem_std ITEM_ITEMFINDER
	return

Route110_EventScript_14FEB2:: @ 814FEB2
	closemessage
	compare VAR_SPECIAL_8, 1
	call_if_eq Route110_EventScript_14FF56
	compare VAR_SPECIAL_8, 2
	call_if_eq Route110_EventScript_14FF5E
	compare VAR_SPECIAL_8, 3
	call_if_eq Route110_EventScript_14FF66
	setobjectmovementtype 28, 10
	setobjectmovementtype 29, 10
	removeobject 28
	addobject 29
	delay 45
	compare VAR_SPECIAL_8, 1
	call_if_eq Route110_EventScript_14FF35
	compare VAR_SPECIAL_8, 2
	call_if_eq Route110_EventScript_14FF40
	compare VAR_SPECIAL_8, 3
	call_if_eq Route110_EventScript_14FF4B
	removeobject 29
	setvar VAR_ROUTE110_STATE, 1
	savebgm 0
	fadedefaultbgm
	releaseall
	end

Route110_EventScript_14FF14:: @ 814FF14
	applymovement 28, Route110_Movement_14FF6E
	waitmovement 0
	return

Route110_EventScript_14FF1F:: @ 814FF1F
	applymovement 28, Route110_Movement_14FF72
	waitmovement 0
	return

Route110_EventScript_14FF2A:: @ 814FF2A
	applymovement 28, Route110_Movement_14FF74
	waitmovement 0
	return

Route110_EventScript_14FF35:: @ 814FF35
	applymovement 29, Route110_Movement_14FF78
	waitmovement 0
	return

Route110_EventScript_14FF40:: @ 814FF40
	applymovement 29, Route110_Movement_14FF80
	waitmovement 0
	return

Route110_EventScript_14FF4B:: @ 814FF4B
	applymovement 29, Route110_Movement_14FF89
	waitmovement 0
	return

Route110_EventScript_14FF56:: @ 814FF56
	setobjectxyperm 29, 33, 55
	return

Route110_EventScript_14FF5E:: @ 814FF5E
	setobjectxyperm 29, 34, 55
	return

Route110_EventScript_14FF66:: @ 814FF66
	setobjectxyperm 29, 35, 55
	return

Route110_Movement_14FF6E:: @ 814FF6E
	walk_down
	walk_left
	walk_in_place_fastest_down
	end_movement

Route110_Movement_14FF72:: @ 814FF72
	walk_down
	end_movement

Route110_Movement_14FF74:: @ 814FF74
	walk_down
	walk_right
	walk_in_place_fastest_down
	end_movement

Route110_Movement_14FF78:: @ 814FF78
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement

Route110_Movement_14FF80:: @ 814FF80
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_down
	end_movement

Route110_Movement_14FF89:: @ 814FF89
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement
