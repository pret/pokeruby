PetalburgWoods_MapScripts:: @ 815CC9C
	map_script 3, PetalburgWoods_MapScript1_15CCA2
	.byte 0

PetalburgWoods_MapScript1_15CCA2:: @ 815CCA2
	call PetalburgWoods_EventScript_1A0196
	end

PetalburgWoods_EventScript_15CCA8:: @ 815CCA8
	lockall
	call PetalburgWoods_EventScript_15CDE6
	applymovement 4, PetalburgWoods_Movement_15CE89
	waitmovement 0
	msgbox PetalburgWoods_Text_194D92, 4
	closemessage
	playbgm MUS_EVIL_TEAM, FALSE
	applymovement 3, PetalburgWoods_Movement_15CEC3
	waitmovement 0
	msgbox PetalburgWoods_Text_194DED, 4
	closemessage
	applymovement 3, PetalburgWoods_Movement_15CEB0
	waitmovement 0
	applymovement 4, PetalburgWoods_Movement_1A0841
	waitmovement 0
	msgbox PetalburgWoods_Text_194E6B, 4
	closemessage
	applymovement 4, PetalburgWoods_Movement_15CE9E
	waitmovement 0
	msgbox PetalburgWoods_Text_194E9A, 4
	applymovement 3, PetalburgWoods_Movement_15CEC8
	waitmovement 0
	msgbox PetalburgWoods_Text_194EE8, 4
	trainerbattle 3, TRAINER_PETALBURG_WOODS_GRUNT, 0, PetalburgWoods_Text_194F83
	applymovement 3, PetalburgWoods_Movement_15CEB3
	waitmovement 0
	call PetalburgWoods_EventScript_15CDFA
	applymovement 4, PetalburgWoods_Movement_15CE80
	waitmovement 0
	goto PetalburgWoods_EventScript_15CE69
	end

PetalburgWoods_EventScript_15CD42:: @ 815CD42
	lockall
	call PetalburgWoods_EventScript_15CDE6
	applymovement 4, PetalburgWoods_Movement_15CE8E
	waitmovement 0
	applymovement 255, PetalburgWoods_Movement_1A083F
	waitmovement 0
	msgbox PetalburgWoods_Text_194D92, 4
	closemessage
	playbgm MUS_EVIL_TEAM, FALSE
	applymovement 3, PetalburgWoods_Movement_15CEC3
	waitmovement 0
	msgbox PetalburgWoods_Text_194DED, 4
	closemessage
	applymovement 3, PetalburgWoods_Movement_15CEBF
	waitmovement 0
	applymovement 4, PetalburgWoods_Movement_1A0841
	waitmovement 0
	msgbox PetalburgWoods_Text_194E6B, 4
	closemessage
	applymovement 4, PetalburgWoods_Movement_15CEA4
	waitmovement 0
	msgbox PetalburgWoods_Text_194E9A, 4
	applymovement 255, PetalburgWoods_Movement_1A0841
	waitmovement 0
	msgbox PetalburgWoods_Text_194EE8, 4
	trainerbattle 3, TRAINER_PETALBURG_WOODS_GRUNT, 0, PetalburgWoods_Text_194F83
	applymovement 3, PetalburgWoods_Movement_15CEB3
	waitmovement 0
	call PetalburgWoods_EventScript_15CDFA
	applymovement 4, PetalburgWoods_Movement_15CE95
	waitmovement 0
	goto PetalburgWoods_EventScript_15CE69
	end

PetalburgWoods_EventScript_15CDE6:: @ 815CDE6
	applymovement 4, PetalburgWoods_Movement_15CE73
	waitmovement 0
	msgbox PetalburgWoods_Text_194D71, 4
	closemessage
	return

PetalburgWoods_EventScript_15CDFA:: @ 815CDFA
	msgbox PetalburgWoods_Text_194FA4, 4
	closemessage
	applymovement 3, PetalburgWoods_Movement_15CEB7
	waitmovement 0
	removeobject 3
	applymovement 255, PetalburgWoods_Movement_1A0845
	waitmovement 0
	msgbox PetalburgWoods_Text_19507E, 4
	giveitem_std ITEM_GREAT_BALL
	compare RESULT, 0
	goto_if_eq PetalburgWoods_EventScript_15CE3F
	goto PetalburgWoods_EventScript_15CE4D
	end

PetalburgWoods_EventScript_15CE3F:: @ 815CE3F
	msgbox PetalburgWoods_Text_195182, 4
	goto PetalburgWoods_EventScript_15CE4D
	end

PetalburgWoods_EventScript_15CE4D:: @ 815CE4D
	msgbox PetalburgWoods_Text_19510A, 4
	applymovement 4, PetalburgWoods_Movement_15CEA8
	waitmovement 0
	msgbox PetalburgWoods_Text_195153, 4
	closemessage
	return

PetalburgWoods_EventScript_15CE69:: @ 815CE69
	removeobject 4
	setvar VAR_PETALBURG_WOODS_STATE, 1
	releaseall
	end

PetalburgWoods_Movement_15CE73:: @ 815CE73
	face_up
	delay_16
	face_right
	delay_16
	face_left
	delay_16
	face_down
	delay_16
	face_right
	delay_16
	face_up
	delay_16
	end_movement

PetalburgWoods_Movement_15CE80:: @ 815CE80
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement

PetalburgWoods_Movement_15CE89:: @ 815CE89
	delay_16
	face_player
	walk_down
	walk_down
	end_movement

PetalburgWoods_Movement_15CE8E:: @ 815CE8E
	delay_16
	face_player
	walk_down
	walk_down
	walk_down
	walk_in_place_fastest_right
	end_movement

PetalburgWoods_Movement_15CE95:: @ 815CE95
	walk_fast_left
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	end_movement

PetalburgWoods_Movement_15CE9E:: @ 815CE9E
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_in_place_fastest_up
	end_movement

PetalburgWoods_Movement_15CEA4:: @ 815CEA4
	walk_fast_down
	walk_fast_right
	walk_in_place_fastest_up
	end_movement

PetalburgWoods_Movement_15CEA8:: @ 815CEA8
	walk_in_place_fastest_down
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	face_up
	end_movement

PetalburgWoods_Movement_15CEB0:: @ 815CEB0
	walk_fast_down
	walk_fast_down
	end_movement

PetalburgWoods_Movement_15CEB3:: @ 815CEB3
	lock_facing_direction
	walk_up
	unlock_facing_direction
	end_movement

PetalburgWoods_Movement_15CEB7:: @ 815CEB7
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	delay_16
	delay_16
	end_movement

PetalburgWoods_Movement_15CEBF:: @ 815CEBF
	walk_fast_down
	walk_fast_down
	walk_fast_down
	end_movement

PetalburgWoods_Movement_15CEC3:: @ 815CEC3
	walk_down
	walk_down
	delay_16
	delay_16
	end_movement

PetalburgWoods_Movement_15CEC8:: @ 815CEC8
	walk_down
	end_movement

PetalburgWoods_EventScript_15CECA:: @ 815CECA
	msgbox PetalburgWoods_Text_1953AC, 2
	end

PetalburgWoods_EventScript_15CED3:: @ 815CED3
	msgbox PetalburgWoods_Text_19542B, 2
	end

PetalburgWoods_EventScript_15CEDC:: @ 815CEDC
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_MIRACLE_SEED, PetalburgWoods_EventScript_15CF0B
	msgbox PetalburgWoods_Text_19549E, 4
	giveitem_std ITEM_MIRACLE_SEED
	compare RESULT, 0
	goto_if_eq PetalburgWoods_EventScript_1A029B
	setflag FLAG_RECEIVED_MIRACLE_SEED
	release
	end

PetalburgWoods_EventScript_15CF0B:: @ 815CF0B
	msgbox PetalburgWoods_Text_195503, 4
	release
	end

PetalburgWoods_EventScript_15CF15:: @ 815CF15
	msgbox PetalburgWoods_Text_1955B0, 3
	end

PetalburgWoods_EventScript_15CF1E:: @ 815CF1E
	msgbox PetalburgWoods_Text_1956A6, 3
	end

PetalburgWoods_EventScript_15CF27:: @ 815CF27
	trainerbattle 0, TRAINER_LYLE, 0, PetalburgWoods_Text_1951BE, PetalburgWoods_Text_195202
	msgbox PetalburgWoods_Text_195232, 6
	end

PetalburgWoods_EventScript_15CF3E:: @ 815CF3E
	trainerbattle 0, TRAINER_JAMES_1, 0, PetalburgWoods_Text_19526A, PetalburgWoods_Text_1952AE
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq PetalburgWoods_EventScript_15CF65
	msgbox PetalburgWoods_Text_1952CC, 6
	end

PetalburgWoods_EventScript_15CF65:: @ 815CF65
	trainerbattle 5, TRAINER_JAMES_1, 0, PetalburgWoods_Text_195306, PetalburgWoods_Text_195338
	msgbox PetalburgWoods_Text_195356, 6
	end
