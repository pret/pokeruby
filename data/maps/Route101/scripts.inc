Route101_MapScripts:: @ 814E924
	map_script 3, Route101_MapScript1_14E92F
	map_script 2, Route101_MapScript2_14E935
	.byte 0

Route101_MapScript1_14E92F:: @ 814E92F
	call Route101_EventScript_1A02F4
	end

Route101_MapScript2_14E935:: @ 814E935
	map_script_2 VAR_ROUTE101_STATE, 0, Route101_EventScript_14E93F
	.2byte 0

Route101_EventScript_14E93F:: @ 814E93F
	setflag FLAG_SPECIAL_FLAG_0
	setvar VAR_ROUTE101_STATE, 1
	end

Route101_EventScript_14E948:: @ 814E948
	lockall
	playbgm MUS_EVENT0, TRUE
	msgbox Route101_Text_16D10E, 4
	closemessage
	setobjectxy 2, 0, 15
	setobjectxy 4, 0, 16
	applymovement 255, Route101_Movement_14EA2C
	applymovement 2, Route101_Movement_14EA50
	applymovement 4, Route101_Movement_14EA1F
	waitmovement 0
	applymovement 4, Route101_Movement_14EA00
	applymovement 2, Route101_Movement_14EA31
	waitmovement 0
	applymovement 2, Route101_Movement_1A0843
	waitmovement 0
	applymovement 4, Route101_Movement_14EA27
	applymovement 2, Route101_Movement_14EA58
	waitmovement 0
	msgbox Route101_Text_16D119, 4
	closemessage
	setvar VAR_ROUTE101_STATE, 2
	releaseall
	end

Route101_EventScript_14E9B8:: @ 814E9B8
	lockall
	msgbox Route101_Text_16D15E, 4
	closemessage
	applymovement 255, Route101_Movement_14E9FA
	waitmovement 0
	releaseall
	end

Route101_EventScript_14E9CE:: @ 814E9CE
	lockall
	msgbox Route101_Text_16D15E, 4
	closemessage
	applymovement 255, Route101_Movement_14E9FC
	waitmovement 0
	releaseall
	end

Route101_EventScript_14E9E4:: @ 814E9E4
	lockall
	msgbox Route101_Text_16D15E, 4
	closemessage
	applymovement 255, Route101_Movement_14E9FE
	waitmovement 0
	releaseall
	end

Route101_Movement_14E9FA:: @ 814E9FA
	walk_up
	end_movement

Route101_Movement_14E9FC:: @ 814E9FC
	walk_right
	end_movement

Route101_Movement_14E9FE:: @ 814E9FE
	walk_down
	end_movement

Route101_Movement_14EA00:: @ 814EA00
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_left
	end_movement

Route101_Movement_14EA1F:: @ 814EA1F
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	end_movement

@ 814EA26
	end_movement

Route101_Movement_14EA27:: @ 814EA27
	walk_in_place_fast_left
	walk_in_place_fast_left
	walk_in_place_fast_left
	walk_in_place_fast_left
	end_movement

Route101_Movement_14EA2C:: @ 814EA2C
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement

Route101_Movement_14EA31:: @ 814EA31
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_left
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_left
	walk_fast_left
	end_movement

Route101_Movement_14EA50:: @ 814EA50
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	end_movement

@ 814EA57
	end_movement

Route101_Movement_14EA58:: @ 814EA58
	walk_in_place_fast_right
	walk_in_place_fast_right
	walk_in_place_fast_right
	walk_in_place_fast_right
	end_movement

@ 814EA5D
	walk_up
	walk_up
	end_movement

@ 814EA60
	walk_up
	walk_left
	walk_up
	end_movement

Route101_EventScript_14EA64:: @ 814EA64
	msgbox Route101_Text_16D25E, 2
	end

Route101_EventScript_14EA6D:: @ 814EA6D
	msgbox Route101_Text_16D2CB, 2
	end

Route101_EventScript_14EA76:: @ 814EA76
	msgbox Route101_Text_16D349, 3
	end

Route101_EventScript_14EA7F:: @ 814EA7F
	lock
	faceplayer
	setflag FLAG_SYS_POKEMON_GET
	setflag FLAG_RESCUED_BIRCH
	fadescreen 1
	removeobject 4
	setobjectxy 255, 6, 13
	applymovement 255, Route101_Movement_1A083F
	waitmovement 0
	special ScrSpecial_ChooseStarter
	waitstate
	applymovement 2, Route101_Movement_14EAD7
	waitmovement 0
	msgbox Route101_Text_16D191, 4
	special ScrSpecial_HealPlayerParty
	setflag FLAG_HIDE_BIRCH_BATTLE_POOCHYENA
	clearflag FLAG_HIDE_BIRCH_IN_LAB
	setflag FLAG_HIDE_BIRCH_STARTERS_BAG
	setvar VAR_BIRCH_LAB_STATE, 2
	setvar VAR_ROUTE101_STATE, 3
	clearflag FLAG_SPECIAL_FLAG_0
	warp MAP_LITTLEROOT_TOWN_PROFESSOR_BIRCHS_LAB, 255, 6, 5
	waitstate
	release
	end

Route101_Movement_14EAD7:: @ 814EAD7
	walk_right
	end_movement
