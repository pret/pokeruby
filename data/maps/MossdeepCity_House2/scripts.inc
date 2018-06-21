MossdeepCity_House2_MapScripts:: @ 815A868
	.byte 0

MossdeepCity_House2_EventScript_15A869:: @ 815A869
	msgbox MossdeepCity_House2_Text_18D536, 2
	end

MossdeepCity_House2_EventScript_15A872:: @ 815A872
	msgbox MossdeepCity_House2_Text_18D596, 2
	end

MossdeepCity_House2_EventScript_15A87B:: @ 815A87B
	lock
	faceplayer
	waitse
	playmoncry SPECIES_WINGULL, 0
	msgbox MossdeepCity_House2_Text_18D61E, 4
	waitmoncry
	closemessage
	setflag FLAG_WINGULL_DELIVERED_MAIL
	clearflag FLAG_HIDE_WINGULL_FORTREE_HOUSE
	compare FACING, 2
	call_if_eq MossdeepCity_House2_EventScript_15A8AE
	compare FACING, 3
	call_if_eq MossdeepCity_House2_EventScript_15A8B9
	removeobject 3
	release
	end

MossdeepCity_House2_EventScript_15A8AE:: @ 815A8AE
	applymovement 3, MossdeepCity_House2_Movement_15A8C4
	waitmovement 0
	return

MossdeepCity_House2_EventScript_15A8B9:: @ 815A8B9
	applymovement 3, MossdeepCity_House2_Movement_15A8CB
	waitmovement 0
	return

MossdeepCity_House2_Movement_15A8C4:: @ 815A8C4
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_down
	delay_8
	end_movement

MossdeepCity_House2_Movement_15A8CB:: @ 815A8CB
	walk_fast_down
	walk_fast_down
	walk_fast_down
	delay_8
	end_movement
