Route116_MapScripts:: @ 8150A31
	map_script 3, Route116_MapScript1_150A37
	.byte 0

Route116_MapScript1_150A37:: @ 8150A37
	call_if_set FLAG_RECOVERED_DEVON_GOODS, Route116_EventScript_150A41
	end

Route116_EventScript_150A41:: @ 8150A41
	setobjectxyperm 21, 41, 10
	return

Route116_EventScript_150A49:: @ 8150A49
	lock
	faceplayer
	goto_if_set FLAG_RECOVERED_DEVON_GOODS, Route116_EventScript_150A67
	goto_if_set FLAG_DEVON_GOODS_STOLEN, Route116_EventScript_150A71
	msgbox Route116_Text_1703CF, 4
	release
	end

Route116_EventScript_150A67:: @ 8150A67
	msgbox Route116_Text_170556, 4
	release
	end

Route116_EventScript_150A71:: @ 8150A71
	msgbox Route116_Text_1703F7, 4
	release
	end

Route116_EventScript_150A7B:: @ 8150A7B
	lock
	faceplayer
	goto_if_set FLAG_MET_DEVON_EMPLOYEE, Route116_EventScript_150B04
	msgbox Route116_Text_1705AE, 4
	goto Route116_EventScript_150A94
	end

Route116_EventScript_150A94:: @ 8150A94
	setflag FLAG_MET_DEVON_EMPLOYEE
	giveitem_std ITEM_REPEAT_BALL
	compare RESULT, 0
	goto_if_eq Route116_EventScript_150B12
	msgbox Route116_Text_1707B8, 4
	closemessage
	compare FACING, 2
	call_if_eq Route116_EventScript_150AEE
	compare FACING, 1
	call_if_eq Route116_EventScript_150AEE
	compare FACING, 3
	call_if_eq Route116_EventScript_150AEE
	compare FACING, 4
	call_if_eq Route116_EventScript_150AF9
	removeobject LAST_TALKED
	clearflag FLAG_HIDE_EMPLOYEE_DEVON_CORP_3F
	setflag FLAG_RECEIVED_REPEAT_BALL
	release
	end

Route116_EventScript_150AEE:: @ 8150AEE
	applymovement LAST_TALKED, Route116_Movement_150B1C
	waitmovement 0
	return

Route116_EventScript_150AF9:: @ 8150AF9
	applymovement LAST_TALKED, Route116_Movement_150B25
	waitmovement 0
	return

Route116_EventScript_150B04:: @ 8150B04
	msgbox Route116_Text_170865, 4
	goto Route116_EventScript_150A94
	end

Route116_EventScript_150B12:: @ 8150B12
	msgbox Route116_Text_17082A, 4
	release
	end

Route116_Movement_150B1C:: @ 8150B1C
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

Route116_Movement_150B25:: @ 8150B25
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

Route116_EventScript_150B30:: @ 8150B30
	msgbox Route116_Text_170A46, 3
	end

Route116_EventScript_150B39:: @ 8150B39
	msgbox Route116_Text_170A60, 3
	end

Route116_EventScript_150B42:: @ 8150B42
	msgbox Route116_Text_170AB8, 3
	end

Route116_EventScript_150B4B:: @ 8150B4B
	msgbox Route116_Text_170ACE, 3
	end

Route116_EventScript_150B54:: @ 8150B54
	msgbox Route116_Text_170B7D, 3
	end

Route116_EventScript_150B5D:: @ 8150B5D
	lock
	faceplayer
	msgbox Route116_Text_17032A, 4
	setvar VAR_ROUTE116_STATE, 2
	release
	end

Route116_EventScript_150B6E:: @ 8150B6E
	lockall
	applymovement 11, Route116_Movement_1A0843
	applymovement 255, Route116_Movement_1A083F
	waitmovement 0
	msgbox Route116_Text_17032A, 4
	setvar VAR_ROUTE116_STATE, 2
	releaseall
	end

Route116_EventScript_150B8F:: @ 8150B8F
	lock
	faceplayer
	checkitem ITEM_BLACK_GLASSES, 1
	compare RESULT, 1
	goto_if_eq Route116_EventScript_150BCA
	specialvar RESULT, FoundBlackGlasses
	compare RESULT, 1
	goto_if_eq Route116_EventScript_150BBB
	msgbox Route116_Text_1708EE, 4
	release
	end

Route116_EventScript_150BBB:: @ 8150BBB
	msgbox Route116_Text_1709B7, 4
	closemessage
	goto Route116_EventScript_150C03
	end

Route116_EventScript_150BCA:: @ 8150BCA
	msgbox Route116_Text_1708EE, 4
	msgbox Route116_Text_170921, 4
	specialvar RESULT, FoundBlackGlasses
	compare RESULT, 1
	goto_if_eq Route116_EventScript_150BF4
	msgbox Route116_Text_170A03, 4
	release
	end

Route116_EventScript_150BF4:: @ 8150BF4
	msgbox Route116_Text_17094D, 4
	closemessage
	goto Route116_EventScript_150C03
	end

Route116_EventScript_150C03:: @ 8150C03
	delay 20
	compare FACING, 2
	call_if_eq Route116_EventScript_150C37
	compare FACING, 1
	call_if_eq Route116_EventScript_150C37
	compare FACING, 3
	call_if_eq Route116_EventScript_150C37
	compare FACING, 4
	call_if_eq Route116_EventScript_150C42
	removeobject LAST_TALKED
	release
	end

Route116_EventScript_150C37:: @ 8150C37
	applymovement LAST_TALKED, Route116_Movement_150C4D
	waitmovement 0
	return

Route116_EventScript_150C42:: @ 8150C42
	applymovement LAST_TALKED, Route116_Movement_150C57
	waitmovement 0
	return

Route116_Movement_150C4D:: @ 8150C4D
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

Route116_Movement_150C57:: @ 8150C57
	walk_up
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	end_movement

Route116_EventScript_150C62:: @ 8150C62
	trainerbattle 0, TRAINER_JOEY, 0, Route116_Text_1BD02B, Route116_Text_1BD04C
	msgbox Route116_Text_1BD078, 6
	end

Route116_EventScript_150C79:: @ 8150C79
	trainerbattle 0, TRAINER_JOSE, 0, Route116_Text_1BD0AF, Route116_Text_1BD0D7
	msgbox Route116_Text_1BD0F4, 6
	end

Route116_EventScript_150C90:: @ 8150C90
	trainerbattle 0, TRAINER_JERRY_1, 0, Route116_Text_1BD1C0, Route116_Text_1BD21A
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route116_EventScript_150CB7
	msgbox Route116_Text_1BD248, 6
	end

Route116_EventScript_150CB7:: @ 8150CB7
	trainerbattle 5, TRAINER_JERRY_1, 0, Route116_Text_1BD2A5, Route116_Text_1BD2FE
	msgbox Route116_Text_1BD31A, 6
	end

Route116_EventScript_150CCE:: @ 8150CCE
	trainerbattle 0, TRAINER_CLARK, 0, Route116_Text_1BCF79, Route116_Text_1BCFBB
	msgbox Route116_Text_1BCFE3, 6
	end

Route116_EventScript_150CE5:: @ 8150CE5
	trainerbattle 0, TRAINER_JANICE, 0, Route116_Text_1BD131, Route116_Text_1BD165
	msgbox Route116_Text_1BD180, 6
	end

Route116_EventScript_150CFC:: @ 8150CFC
	trainerbattle 0, TRAINER_KAREN_1, 0, Route116_Text_1BD377, Route116_Text_1BD3AC
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route116_EventScript_150D23
	msgbox Route116_Text_1BD3C3, 6
	end

Route116_EventScript_150D23:: @ 8150D23
	trainerbattle 5, TRAINER_KAREN_1, 0, Route116_Text_1BD405, Route116_Text_1BD44A
	msgbox Route116_Text_1BD466, 6
	end
