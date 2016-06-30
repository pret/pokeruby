Route111_EventScript_1A3858:: @ 81A3858
	lock
	faceplayer
	msgbox Route111_Text_1A3520, 5
	compare RESULT, 1
	jumpeq Route111_EventScript_1A3877
	msgbox Route111_Text_1A37B5, 4
	release
	end

Route111_EventScript_1A3877:: @ 81A3877
	giveitem ITEM_TM43
	compare RESULT, 0
	jumpeq Route111_EventScript_1A38D9
	msgbox Route111_Text_1A35C5, 4
	closebutton
	setflag 96
	clearflag 948
	compare FACING, 3
	callif 1, Route111_EventScript_1A38C3
	compare FACING, 4
	callif 1, Route111_EventScript_1A38C3
	compare FACING, 2
	callif 1, Route111_EventScript_1A38CE
	disappear LAST_TALKED
	release
	end

Route111_EventScript_1A38C3:: @ 81A38C3
	move LAST_TALKED, Route111_Movement_1A38E3
	waitmove 0
	return

Route111_EventScript_1A38CE:: @ 81A38CE
	move LAST_TALKED, Route111_Movement_1A38EF
	waitmove 0
	return

Route111_EventScript_1A38D9:: @ 81A38D9
	msgbox Route111_Text_1A37F6, 4
	release
	end

Route111_Movement_1A38E3:: @ 81A38E3
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end

Route111_Movement_1A38EF:: @ 81A38EF
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end
