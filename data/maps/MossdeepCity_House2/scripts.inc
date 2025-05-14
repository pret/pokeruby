MossdeepCity_House2_MapScripts:: @ 815A868
	.byte 0

MossdeepCity_House2_EventScript_Man:: @ 815A869
	msgbox MossdeepCity_House2_Text_SisterMailsBoyfriendInFortree, MSGBOX_NPC
	end

MossdeepCity_House2_EventScript_Twin:: @ 815A872
	msgbox MossdeepCity_House2_Text_PokemonCarriesMailBackAndForth, MSGBOX_NPC
	end

MossdeepCity_House2_EventScript_Wingull:: @ 815A87B
	lock
	faceplayer
	waitse
	playmoncry SPECIES_WINGULL, 0
	msgbox MossdeepCity_House2_Text_Wingull, MSGBOX_DEFAULT
	waitmoncry
	closemessage
	setflag FLAG_WINGULL_DELIVERED_MAIL
	clearflag FLAG_HIDE_WINGULL_FORTREE_HOUSE
	compare VAR_FACING, 2
	call_if_eq MossdeepCity_House2_EventScript_WingullExitNorth
	compare VAR_FACING, 3
	call_if_eq MossdeepCity_House2_EventScript_WingullExitWest
	removeobject 3
	release
	end

MossdeepCity_House2_EventScript_WingullExitNorth:: @ 815A8AE
	applymovement 3, MossdeepCity_House2_Movement_WingullExitNorth
	waitmovement 0
	return

MossdeepCity_House2_EventScript_WingullExitWest:: @ 815A8B9
	applymovement 3, MossdeepCity_House2_Movement_WingullExitEast
	waitmovement 0
	return

MossdeepCity_House2_Movement_WingullExitNorth:: @ 815A8C4
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_down
	delay_8
	step_end

MossdeepCity_House2_Movement_WingullExitEast:: @ 815A8CB
	walk_fast_down
	walk_fast_down
	walk_fast_down
	delay_8
	step_end
