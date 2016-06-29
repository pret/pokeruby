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
	checksound
	pokecry SPECIES_WINGULL, 0
	msgbox MossdeepCity_House2_Text_18D61E, 4
	waitpokecry
	closebutton
	setflag 224
	clearflag 933
	compare FACING, 2
	callif 1, MossdeepCity_House2_EventScript_15A8AE
	compare FACING, 3
	callif 1, MossdeepCity_House2_EventScript_15A8B9
	disappear 3
	release
	end

MossdeepCity_House2_EventScript_15A8AE:: @ 815A8AE
	move 3, MossdeepCity_House2_Movement_15A8C4
	waitmove 0
	return

MossdeepCity_House2_EventScript_15A8B9:: @ 815A8B9
	move 3, MossdeepCity_House2_Movement_15A8CB
	waitmove 0
	return

MossdeepCity_House2_Movement_15A8C4:: @ 815A8C4
	step_18
	step_15
	step_15
	step_17
	step_15
	step_13
	step_end

MossdeepCity_House2_Movement_15A8CB:: @ 815A8CB
	step_15
	step_15
	step_15
	step_13
	step_end

