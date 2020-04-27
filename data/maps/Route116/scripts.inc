Route116_MapScripts:: @ 8150A31
	map_script MAP_SCRIPT_ON_TRANSITION, Route116_MapScript1_150A37
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
	msgbox Route116_Text_1703CF, MSGBOX_DEFAULT
	release
	end

Route116_EventScript_150A67:: @ 8150A67
	msgbox Route116_Text_170556, MSGBOX_DEFAULT
	release
	end

Route116_EventScript_150A71:: @ 8150A71
	msgbox Route116_Text_1703F7, MSGBOX_DEFAULT
	release
	end

Route116_EventScript_150A7B:: @ 8150A7B
	lock
	faceplayer
	goto_if_set FLAG_MET_DEVON_EMPLOYEE, Route116_EventScript_150B04
	msgbox Route116_Text_1705AE, MSGBOX_DEFAULT
	goto Route116_EventScript_150A94
	end

Route116_EventScript_150A94:: @ 8150A94
	setflag FLAG_MET_DEVON_EMPLOYEE
	giveitem ITEM_REPEAT_BALL
	compare VAR_RESULT, 0
	goto_if_eq Route116_EventScript_150B12
	msgbox Route116_Text_1707B8, MSGBOX_DEFAULT
	closemessage
	compare VAR_FACING, 2
	call_if_eq Route116_EventScript_150AEE
	compare VAR_FACING, 1
	call_if_eq Route116_EventScript_150AEE
	compare VAR_FACING, 3
	call_if_eq Route116_EventScript_150AEE
	compare VAR_FACING, 4
	call_if_eq Route116_EventScript_150AF9
	removeobject VAR_LAST_TALKED
	clearflag FLAG_HIDE_EMPLOYEE_DEVON_CORP_3F
	setflag FLAG_RECEIVED_REPEAT_BALL
	release
	end

Route116_EventScript_150AEE:: @ 8150AEE
	applymovement VAR_LAST_TALKED, Route116_Movement_150B1C
	waitmovement 0
	return

Route116_EventScript_150AF9:: @ 8150AF9
	applymovement VAR_LAST_TALKED, Route116_Movement_150B25
	waitmovement 0
	return

Route116_EventScript_150B04:: @ 8150B04
	msgbox Route116_Text_170865, MSGBOX_DEFAULT
	goto Route116_EventScript_150A94
	end

Route116_EventScript_150B12:: @ 8150B12
	msgbox Route116_Text_17082A, MSGBOX_DEFAULT
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
	step_end

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
	step_end

Route116_EventScript_150B30:: @ 8150B30
	msgbox Route116_Text_170A46, MSGBOX_SIGN
	end

Route116_EventScript_150B39:: @ 8150B39
	msgbox Route116_Text_170A60, MSGBOX_SIGN
	end

Route116_EventScript_150B42:: @ 8150B42
	msgbox Route116_Text_170AB8, MSGBOX_SIGN
	end

Route116_EventScript_150B4B:: @ 8150B4B
	msgbox Route116_Text_170ACE, MSGBOX_SIGN
	end

Route116_EventScript_150B54:: @ 8150B54
	msgbox Route116_Text_170B7D, MSGBOX_SIGN
	end

Route116_EventScript_150B5D:: @ 8150B5D
	lock
	faceplayer
	msgbox Route116_Text_17032A, MSGBOX_DEFAULT
	setvar VAR_ROUTE116_STATE, 2
	release
	end

Route116_EventScript_150B6E:: @ 8150B6E
	lockall
	applymovement 11, Common_Movement_WalkInPlaceFastestRight
	applymovement 255, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox Route116_Text_17032A, MSGBOX_DEFAULT
	setvar VAR_ROUTE116_STATE, 2
	releaseall
	end

Route116_EventScript_150B8F:: @ 8150B8F
	lock
	faceplayer
	checkitem ITEM_BLACK_GLASSES, 1
	compare VAR_RESULT, 1
	goto_if_eq Route116_EventScript_150BCA
	specialvar VAR_RESULT, FoundBlackGlasses
	compare VAR_RESULT, 1
	goto_if_eq Route116_EventScript_150BBB
	msgbox Route116_Text_1708EE, MSGBOX_DEFAULT
	release
	end

Route116_EventScript_150BBB:: @ 8150BBB
	msgbox Route116_Text_1709B7, MSGBOX_DEFAULT
	closemessage
	goto Route116_EventScript_150C03
	end

Route116_EventScript_150BCA:: @ 8150BCA
	msgbox Route116_Text_1708EE, MSGBOX_DEFAULT
	msgbox Route116_Text_170921, MSGBOX_DEFAULT
	specialvar VAR_RESULT, FoundBlackGlasses
	compare VAR_RESULT, 1
	goto_if_eq Route116_EventScript_150BF4
	msgbox Route116_Text_170A03, MSGBOX_DEFAULT
	release
	end

Route116_EventScript_150BF4:: @ 8150BF4
	msgbox Route116_Text_17094D, MSGBOX_DEFAULT
	closemessage
	goto Route116_EventScript_150C03
	end

Route116_EventScript_150C03:: @ 8150C03
	delay 20
	compare VAR_FACING, 2
	call_if_eq Route116_EventScript_150C37
	compare VAR_FACING, 1
	call_if_eq Route116_EventScript_150C37
	compare VAR_FACING, 3
	call_if_eq Route116_EventScript_150C37
	compare VAR_FACING, 4
	call_if_eq Route116_EventScript_150C42
	removeobject VAR_LAST_TALKED
	release
	end

Route116_EventScript_150C37:: @ 8150C37
	applymovement VAR_LAST_TALKED, Route116_Movement_150C4D
	waitmovement 0
	return

Route116_EventScript_150C42:: @ 8150C42
	applymovement VAR_LAST_TALKED, Route116_Movement_150C57
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
	step_end

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
	step_end

Route116_EventScript_150C62:: @ 8150C62
	trainerbattle_single TRAINER_JOEY, Route116_Text_1BD02B, Route116_Text_1BD04C
	msgbox Route116_Text_1BD078, MSGBOX_AUTOCLOSE
	end

Route116_EventScript_150C79:: @ 8150C79
	trainerbattle_single TRAINER_JOSE, Route116_Text_1BD0AF, Route116_Text_1BD0D7
	msgbox Route116_Text_1BD0F4, MSGBOX_AUTOCLOSE
	end

Route116_EventScript_150C90:: @ 8150C90
	trainerbattle_single TRAINER_JERRY_1, Route116_Text_1BD1C0, Route116_Text_1BD21A
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route116_EventScript_150CB7
	msgbox Route116_Text_1BD248, MSGBOX_AUTOCLOSE
	end

Route116_EventScript_150CB7:: @ 8150CB7
	trainerbattle_rematch TRAINER_JERRY_1, Route116_Text_1BD2A5, Route116_Text_1BD2FE
	msgbox Route116_Text_1BD31A, MSGBOX_AUTOCLOSE
	end

Route116_EventScript_150CCE:: @ 8150CCE
	trainerbattle_single TRAINER_CLARK, Route116_Text_1BCF79, Route116_Text_1BCFBB
	msgbox Route116_Text_1BCFE3, MSGBOX_AUTOCLOSE
	end

Route116_EventScript_150CE5:: @ 8150CE5
	trainerbattle_single TRAINER_JANICE, Route116_Text_1BD131, Route116_Text_1BD165
	msgbox Route116_Text_1BD180, MSGBOX_AUTOCLOSE
	end

Route116_EventScript_150CFC:: @ 8150CFC
	trainerbattle_single TRAINER_KAREN_1, Route116_Text_1BD377, Route116_Text_1BD3AC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq Route116_EventScript_150D23
	msgbox Route116_Text_1BD3C3, MSGBOX_AUTOCLOSE
	end

Route116_EventScript_150D23:: @ 8150D23
	trainerbattle_rematch TRAINER_KAREN_1, Route116_Text_1BD405, Route116_Text_1BD44A
	msgbox Route116_Text_1BD466, MSGBOX_AUTOCLOSE
	end
