Route111_EventScript_1A3858:: @ 81A3858
	lock
	faceplayer
	msgbox Route111_Text_1A3520, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq Route111_EventScript_1A3877
	msgbox Route111_Text_1A37B5, 4
	release
	end

Route111_EventScript_1A3877:: @ 81A3877
	giveitem_std ITEM_TM43_SECRET_POWER
	compare RESULT, 0
	goto_if_eq Route111_EventScript_1A38D9
	msgbox Route111_Text_1A35C5, 4
	closemessage
	setflag FLAG_RECEIVED_SECRET_POWER
	clearflag FLAG_HIDE_TM_SALESMAN_SLATEPORT
	compare FACING, 3
	call_if_eq Route111_EventScript_1A38C3
	compare FACING, 4
	call_if_eq Route111_EventScript_1A38C3
	compare FACING, 2
	call_if_eq Route111_EventScript_1A38CE
	removeobject LAST_TALKED
	release
	end

Route111_EventScript_1A38C3:: @ 81A38C3
	applymovement LAST_TALKED, Route111_Movement_1A38E3
	waitmovement 0
	return

Route111_EventScript_1A38CE:: @ 81A38CE
	applymovement LAST_TALKED, Route111_Movement_1A38EF
	waitmovement 0
	return

Route111_EventScript_1A38D9:: @ 81A38D9
	msgbox Route111_Text_1A37F6, 4
	release
	end

Route111_Movement_1A38E3:: @ 81A38E3
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	end_movement

Route111_Movement_1A38EF:: @ 81A38EF
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	end_movement
