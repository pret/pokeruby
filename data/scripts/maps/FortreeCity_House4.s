FortreeCity_House4_MapScripts:: @ 815817E
	.byte 0

FortreeCity_House4_EventScript_15817F:: @ 815817F
	msgbox FortreeCity_House4_Text_1867AF, 2
	end

FortreeCity_House4_EventScript_158188:: @ 8158188
	lockall
	checkflag 223
	jumpeq FortreeCity_House4_EventScript_158204
	checkflag 224
	jumpeq FortreeCity_House4_EventScript_1581D6
	checkflag 222
	jumpeq FortreeCity_House4_EventScript_1581C2
	msgbox FortreeCity_House4_Text_186835, 4
	closebutton
	setflag 222
	clearflag 934
	move 3, FortreeCity_House4_Movement_158218
	waitmove 0
	disappear 3
	releaseall
	end

FortreeCity_House4_EventScript_1581C2:: @ 81581C2
	move LAST_TALKED, FortreeCity_House4_Movement_1A0839
	waitmove 0
	msgbox FortreeCity_House4_Text_18684E, 4
	releaseall
	end

FortreeCity_House4_EventScript_1581D6:: @ 81581D6
	move LAST_TALKED, FortreeCity_House4_Movement_1A0839
	waitmove 0
	msgbox FortreeCity_House4_Text_186881, 4
	giveitem ITEM_MENTAL_HERB
	compare RESULT, 0
	jumpeq FortreeCity_House4_EventScript_1A029B
	setflag 223
	releaseall
	end

FortreeCity_House4_EventScript_158204:: @ 8158204
	move LAST_TALKED, FortreeCity_House4_Movement_1A0839
	waitmove 0
	msgbox FortreeCity_House4_Text_186924, 4
	releaseall
	end

FortreeCity_House4_Movement_158218:: @ 8158218
	step_15
	step_15
	step_18
	step_25
	step_13
	step_end

FortreeCity_House4_EventScript_15821E:: @ 815821E
	lock
	faceplayer
	checksound
	pokecry SPECIES_WINGULL, 0
	msgbox FortreeCity_House4_Text_18695C, 4
	waitpokecry
	release
	end

