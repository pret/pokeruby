PetalburgWoods_MapScripts:: @ 815CC9C
	map_script 3, PetalburgWoods_MapScript1_15CCA2
	.byte 0

PetalburgWoods_MapScript1_15CCA2:: @ 815CCA2
	call PetalburgWoods_EventScript_1A0196
	end

PetalburgWoods_EventScript_15CCA8:: @ 815CCA8
	lockall
	call PetalburgWoods_EventScript_15CDE6
	move 4, PetalburgWoods_Movement_15CE89
	waitmove 0
	msgbox PetalburgWoods_Text_194D92, 4
	closebutton
	playmusic 441, 0
	move 3, PetalburgWoods_Movement_15CEC3
	waitmove 0
	msgbox PetalburgWoods_Text_194DED, 4
	closebutton
	move 3, PetalburgWoods_Movement_15CEB0
	waitmove 0
	move 4, PetalburgWoods_Movement_1A0841
	waitmove 0
	msgbox PetalburgWoods_Text_194E6B, 4
	closebutton
	move 4, PetalburgWoods_Movement_15CE9E
	waitmove 0
	msgbox PetalburgWoods_Text_194E9A, 4
	move 3, PetalburgWoods_Movement_15CEC8
	waitmove 0
	msgbox PetalburgWoods_Text_194EE8, 4
	trainerbattle 3, 575, 0, PetalburgWoods_Text_194F83
	move 3, PetalburgWoods_Movement_15CEB3
	waitmove 0
	call PetalburgWoods_EventScript_15CDFA
	move 4, PetalburgWoods_Movement_15CE80
	waitmove 0
	jump PetalburgWoods_EventScript_15CE69
	end

PetalburgWoods_EventScript_15CD42:: @ 815CD42
	lockall
	call PetalburgWoods_EventScript_15CDE6
	move 4, PetalburgWoods_Movement_15CE8E
	waitmove 0
	move 255, PetalburgWoods_Movement_1A083F
	waitmove 0
	msgbox PetalburgWoods_Text_194D92, 4
	closebutton
	playmusic 441, 0
	move 3, PetalburgWoods_Movement_15CEC3
	waitmove 0
	msgbox PetalburgWoods_Text_194DED, 4
	closebutton
	move 3, PetalburgWoods_Movement_15CEBF
	waitmove 0
	move 4, PetalburgWoods_Movement_1A0841
	waitmove 0
	msgbox PetalburgWoods_Text_194E6B, 4
	closebutton
	move 4, PetalburgWoods_Movement_15CEA4
	waitmove 0
	msgbox PetalburgWoods_Text_194E9A, 4
	move 255, PetalburgWoods_Movement_1A0841
	waitmove 0
	msgbox PetalburgWoods_Text_194EE8, 4
	trainerbattle 3, 575, 0, PetalburgWoods_Text_194F83
	move 3, PetalburgWoods_Movement_15CEB3
	waitmove 0
	call PetalburgWoods_EventScript_15CDFA
	move 4, PetalburgWoods_Movement_15CE95
	waitmove 0
	jump PetalburgWoods_EventScript_15CE69
	end

PetalburgWoods_EventScript_15CDE6:: @ 815CDE6
	move 4, PetalburgWoods_Movement_15CE73
	waitmove 0
	msgbox PetalburgWoods_Text_194D71, 4
	closebutton
	return

PetalburgWoods_EventScript_15CDFA:: @ 815CDFA
	msgbox PetalburgWoods_Text_194FA4, 4
	closebutton
	move 3, PetalburgWoods_Movement_15CEB7
	waitmove 0
	disappear 3
	move 255, PetalburgWoods_Movement_1A0845
	waitmove 0
	msgbox PetalburgWoods_Text_19507E, 4
	giveitem ITEM_GREAT_BALL
	compare RESULT, 0
	jumpeq PetalburgWoods_EventScript_15CE3F
	jump PetalburgWoods_EventScript_15CE4D
	end

PetalburgWoods_EventScript_15CE3F:: @ 815CE3F
	msgbox PetalburgWoods_Text_195182, 4
	jump PetalburgWoods_EventScript_15CE4D
	end

PetalburgWoods_EventScript_15CE4D:: @ 815CE4D
	msgbox PetalburgWoods_Text_19510A, 4
	move 4, PetalburgWoods_Movement_15CEA8
	waitmove 0
	msgbox PetalburgWoods_Text_195153, 4
	closebutton
	return

PetalburgWoods_EventScript_15CE69:: @ 815CE69
	disappear 4
	setvar 0x4098, 1
	releaseall
	end

PetalburgWoods_Movement_15CE73:: @ 815CE73
	step_01
	step_14
	step_03
	step_14
	step_02
	step_14
	step_00
	step_14
	step_03
	step_14
	step_01
	step_14
	step_end

PetalburgWoods_Movement_15CE80:: @ 815CE80
	step_18
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_end

PetalburgWoods_Movement_15CE89:: @ 815CE89
	step_14
	step_3e
	step_down
	step_down
	step_end

PetalburgWoods_Movement_15CE8E:: @ 815CE8E
	step_14
	step_3e
	step_down
	step_down
	step_down
	step_28
	step_end

PetalburgWoods_Movement_15CE95:: @ 815CE95
	step_17
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_end

PetalburgWoods_Movement_15CE9E:: @ 815CE9E
	step_18
	step_15
	step_15
	step_17
	step_26
	step_end

PetalburgWoods_Movement_15CEA4:: @ 815CEA4
	step_15
	step_18
	step_26
	step_end

PetalburgWoods_Movement_15CEA8:: @ 815CEA8
	step_25
	step_14
	step_14
	step_14
	step_14
	step_14
	step_01
	step_end

PetalburgWoods_Movement_15CEB0:: @ 815CEB0
	step_15
	step_15
	step_end

PetalburgWoods_Movement_15CEB3:: @ 815CEB3
	step_40
	step_up
	step_41
	step_end

PetalburgWoods_Movement_15CEB7:: @ 815CEB7
	step_16
	step_16
	step_16
	step_16
	step_16
	step_14
	step_14
	step_end

PetalburgWoods_Movement_15CEBF:: @ 815CEBF
	step_15
	step_15
	step_15
	step_end

PetalburgWoods_Movement_15CEC3:: @ 815CEC3
	step_down
	step_down
	step_14
	step_14
	step_end

PetalburgWoods_Movement_15CEC8:: @ 815CEC8
	step_down
	step_end

PetalburgWoods_EventScript_15CECA:: @ 815CECA
	msgbox PetalburgWoods_Text_1953AC, 2
	end

PetalburgWoods_EventScript_15CED3:: @ 815CED3
	msgbox PetalburgWoods_Text_19542B, 2
	end

PetalburgWoods_EventScript_15CEDC:: @ 815CEDC
	lock
	faceplayer
	checkflag 297
	jumpeq PetalburgWoods_EventScript_15CF0B
	msgbox PetalburgWoods_Text_19549E, 4
	giveitem ITEM_MIRACLE_SEED
	compare RESULT, 0
	jumpeq PetalburgWoods_EventScript_1A029B
	setflag 297
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
	trainerbattle 0, 616, 0, PetalburgWoods_Text_1951BE, PetalburgWoods_Text_195202
	msgbox PetalburgWoods_Text_195232, 6
	end

PetalburgWoods_EventScript_15CF3E:: @ 815CF3E
	trainerbattle 0, 621, 0, PetalburgWoods_Text_19526A, PetalburgWoods_Text_1952AE
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq PetalburgWoods_EventScript_15CF65
	msgbox PetalburgWoods_Text_1952CC, 6
	end

PetalburgWoods_EventScript_15CF65:: @ 815CF65
	trainerbattle 5, 621, 0, PetalburgWoods_Text_195306, PetalburgWoods_Text_195338
	msgbox PetalburgWoods_Text_195356, 6
	end

