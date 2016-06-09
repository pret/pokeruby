Route116_MapScripts:: @ 8150A31
	map_script 3, Route116_MapScript1_150A37
	.byte 0

Route116_MapScript1_150A37:: @ 8150A37
	checkflag 143
	callif 1, Route116_EventScript_150A41
	end

Route116_EventScript_150A41:: @ 8150A41
	movespriteperm 21, 41, 10
	return

Route116_EventScript_150A49:: @ 8150A49
	lock
	faceplayer
	checkflag 143
	jumpeq Route116_EventScript_150A67
	checkflag 142
	jumpeq Route116_EventScript_150A71
	loadptr 0, Route116_Text_1703CF
	callstd 4
	release
	end

Route116_EventScript_150A67:: @ 8150A67
	loadptr 0, Route116_Text_170556
	callstd 4
	release
	end

Route116_EventScript_150A71:: @ 8150A71
	loadptr 0, Route116_Text_1703F7
	callstd 4
	release
	end

Route116_EventScript_150A7B:: @ 8150A7B
	lock
	faceplayer
	checkflag 287
	jumpeq Route116_EventScript_150B04
	loadptr 0, Route116_Text_1705AE
	callstd 4
	jump Route116_EventScript_150A94
	end

Route116_EventScript_150A94:: @ 8150A94
	setflag 287
	setorcopyvar 0x8000, 0x9
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route116_EventScript_150B12
	loadptr 0, Route116_Text_1707B8
	callstd 4
	closebutton
	compare FACING, 2
	callif 1, Route116_EventScript_150AEE
	compare FACING, 1
	callif 1, Route116_EventScript_150AEE
	compare FACING, 3
	callif 1, Route116_EventScript_150AEE
	compare FACING, 4
	callif 1, Route116_EventScript_150AF9
	disappear LAST_TALKED
	clearflag 949
	setflag 256
	release
	end

Route116_EventScript_150AEE:: @ 8150AEE
	move LAST_TALKED, Route116_Movement_150B1C
	waitmove 0
	return

Route116_EventScript_150AF9:: @ 8150AF9
	move LAST_TALKED, Route116_Movement_150B25
	waitmove 0
	return

Route116_EventScript_150B04:: @ 8150B04
	loadptr 0, Route116_Text_170865
	callstd 4
	jump Route116_EventScript_150A94
	end

Route116_EventScript_150B12:: @ 8150B12
	loadptr 0, Route116_Text_17082A
	callstd 4
	release
	end

Route116_Movement_150B1C:: @ 8150B1C
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route116_Movement_150B25:: @ 8150B25
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route116_EventScript_150B30:: @ 8150B30
	loadptr 0, Route116_Text_170A46
	callstd 3
	end

Route116_EventScript_150B39:: @ 8150B39
	loadptr 0, Route116_Text_170A60
	callstd 3
	end

Route116_EventScript_150B42:: @ 8150B42
	loadptr 0, Route116_Text_170AB8
	callstd 3
	end

Route116_EventScript_150B4B:: @ 8150B4B
	loadptr 0, Route116_Text_170ACE
	callstd 3
	end

Route116_EventScript_150B54:: @ 8150B54
	loadptr 0, Route116_Text_170B7D
	callstd 3
	end

Route116_EventScript_150B5D:: @ 8150B5D
	lock
	faceplayer
	loadptr 0, Route116_Text_17032A
	callstd 4
	setvar 0x406f, 2
	release
	end

Route116_EventScript_150B6E:: @ 8150B6E
	lockall
	move 11, Route116_Movement_1A0843
	move 255, Route116_Movement_1A083F
	waitmove 0
	loadptr 0, Route116_Text_17032A
	callstd 4
	setvar 0x406f, 2
	releaseall
	end

Route116_EventScript_150B8F:: @ 8150B8F
	lock
	faceplayer
	checkitem ITEM_BLACK_GLASSES, 1
	compare RESULT, 1
	jumpeq Route116_EventScript_150BCA
	specialval RESULT, 316
	compare RESULT, 1
	jumpeq Route116_EventScript_150BBB
	loadptr 0, Route116_Text_1708EE
	callstd 4
	release
	end

Route116_EventScript_150BBB:: @ 8150BBB
	loadptr 0, Route116_Text_1709B7
	callstd 4
	closebutton
	jump Route116_EventScript_150C03
	end

Route116_EventScript_150BCA:: @ 8150BCA
	loadptr 0, Route116_Text_1708EE
	callstd 4
	loadptr 0, Route116_Text_170921
	callstd 4
	specialval RESULT, 316
	compare RESULT, 1
	jumpeq Route116_EventScript_150BF4
	loadptr 0, Route116_Text_170A03
	callstd 4
	release
	end

Route116_EventScript_150BF4:: @ 8150BF4
	loadptr 0, Route116_Text_17094D
	callstd 4
	closebutton
	jump Route116_EventScript_150C03
	end

Route116_EventScript_150C03:: @ 8150C03
	pause 20
	compare FACING, 2
	callif 1, Route116_EventScript_150C37
	compare FACING, 1
	callif 1, Route116_EventScript_150C37
	compare FACING, 3
	callif 1, Route116_EventScript_150C37
	compare FACING, 4
	callif 1, Route116_EventScript_150C42
	disappear LAST_TALKED
	release
	end

Route116_EventScript_150C37:: @ 8150C37
	move LAST_TALKED, Route116_Movement_150C4D
	waitmove 0
	return

Route116_EventScript_150C42:: @ 8150C42
	move LAST_TALKED, Route116_Movement_150C57
	waitmove 0
	return

Route116_Movement_150C4D:: @ 8150C4D
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route116_Movement_150C57:: @ 8150C57
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route116_EventScript_150C62:: @ 8150C62
	trainerbattle 0, 322, 0, Route116_Text_1BD02B, Route116_Text_1BD04C
	loadptr 0, Route116_Text_1BD078
	callstd 6
	end

Route116_EventScript_150C79:: @ 8150C79
	trainerbattle 0, 617, 0, Route116_Text_1BD0AF, Route116_Text_1BD0D7
	loadptr 0, Route116_Text_1BD0F4
	callstd 6
	end

Route116_EventScript_150C90:: @ 8150C90
	trainerbattle 0, 273, 0, Route116_Text_1BD1C0, Route116_Text_1BD21A
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route116_EventScript_150CB7
	loadptr 0, Route116_Text_1BD248
	callstd 6
	end

Route116_EventScript_150CB7:: @ 8150CB7
	trainerbattle 5, 273, 0, Route116_Text_1BD2A5, Route116_Text_1BD2FE
	loadptr 0, Route116_Text_1BD31A
	callstd 6
	end

Route116_EventScript_150CCE:: @ 8150CCE
	trainerbattle 0, 631, 0, Route116_Text_1BCF79, Route116_Text_1BCFBB
	loadptr 0, Route116_Text_1BCFE3
	callstd 6
	end

Route116_EventScript_150CE5:: @ 8150CE5
	trainerbattle 0, 605, 0, Route116_Text_1BD131, Route116_Text_1BD165
	loadptr 0, Route116_Text_1BD180
	callstd 6
	end

Route116_EventScript_150CFC:: @ 8150CFC
	trainerbattle 0, 280, 0, Route116_Text_1BD377, Route116_Text_1BD3AC
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route116_EventScript_150D23
	loadptr 0, Route116_Text_1BD3C3
	callstd 6
	end

Route116_EventScript_150D23:: @ 8150D23
	trainerbattle 5, 280, 0, Route116_Text_1BD405, Route116_Text_1BD44A
	loadptr 0, Route116_Text_1BD466
	callstd 6
	end

