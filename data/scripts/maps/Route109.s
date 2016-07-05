Route109_MapScripts:: @ 814F4D2
	.byte 0

Route109_EventScript_14F4D3:: @ 814F4D3
	call Route109_EventScript_1A010C
	spritelevelup 2, 0, 24, 0
	spritelevelup 255, 0, 24, 0
	move 2, Route109_Movement_14F67B
	waitmove 0
	disappear 2
	switch FACING
	case 1, Route109_EventScript_14F518
	case 3, Route109_EventScript_14F538
	case 4, Route109_EventScript_14F528
	end

Route109_EventScript_14F518:: @ 814F518
	move 255, Route109_Movement_14F66D
	waitmove 0
	jump Route109_EventScript_14F548
	end

Route109_EventScript_14F528:: @ 814F528
	move 255, Route109_Movement_14F675
	waitmove 0
	jump Route109_EventScript_14F548
	end

Route109_EventScript_14F538:: @ 814F538
	move 255, Route109_Movement_14F678
	waitmove 0
	jump Route109_EventScript_14F548
	end

Route109_EventScript_14F548:: @ 814F548
	spriteinvisible 255, 0, 24
	call Route109_EventScript_1A02E7
	move 1, Route109_Movement_14F5BF
	move 255, Route109_Movement_14F5BF
	waitmove 0
	call Route109_EventScript_1A02EF
	spritevisible 255, 0, 11
	move 255, Route109_Movement_14F670
	waitmove 0
	reappear 4
	clearflag 743
	movespriteperm 2, 12, 8
	reappear 2
	spritelevelup 2, 0, 11, 0
	move 2, Route109_Movement_14F67D
	waitmove 0
	clearflag 740
	setflag 744
	spriteinvisible 1, 0, 24
	msgbox Route109_Text_16B4B5, 4
	closebutton
	copyvar 0x4096, 0x8008
	restorespritelevel 255, 0, 24
	restorespritelevel 2, 0, 11
	moveoffscreen 2
	release
	end

Route109_Movement_14F5BF:: @ 814F5BF
	step_25
	step_down
	step_down
	step_15
	step_15
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_2d
	step_15
	step_15
	step_17
	step_17
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_17
	step_17
	step_17
	step_17
	step_17
	step_17
	step_17
	step_17
	step_17
	step_left
	step_left
	step_25
	step_end

Route109_Movement_14F66D:: @ 814F66D
	step_down
	step_down
	step_end

Route109_Movement_14F670:: @ 814F670
	step_down
	step_down
	step_left
	step_28
	step_end

Route109_Movement_14F675:: @ 814F675
	step_right
	step_down
	step_end

Route109_Movement_14F678:: @ 814F678
	step_left
	step_down
	step_end

Route109_Movement_14F67B:: @ 814F67B
	step_down
	step_end

Route109_Movement_14F67D:: @ 814F67D
	step_down
	step_27
	step_end

Route109_EventScript_14F680:: @ 814F680
	lock
	faceplayer
	checkflag 149
	jumpif 0, Route109_EventScript_14F691
	jump Route109_EventScript_14F6AF
	end

Route109_EventScript_14F691:: @ 814F691
	message Route109_Text_16E0F9
	msgbox Route109_Text_16E0F9, 5
	compare RESULT, 0
	jumpeq Route109_EventScript_14F6F1
	jump Route109_EventScript_14F6E2
	end

Route109_EventScript_14F6AF:: @ 814F6AF
	message Route109_Text_16E26A
	waittext
	multichoicedef 21, 8, 14, 1, 0
	switch RESULT
	case 0, Route109_EventScript_14F6E2
	case 1, Route109_EventScript_14F6FB
	case 127, Route109_EventScript_14F6FB
	end

Route109_EventScript_14F6E2:: @ 814F6E2
	msgbox Route109_Text_16E159, 4
	closebutton
	jump Route109_EventScript_14F4D3
	end

Route109_EventScript_14F6F1:: @ 814F6F1
	msgbox Route109_Text_16E1B1, 4
	release
	end

Route109_EventScript_14F6FB:: @ 814F6FB
	msgbox Route109_Text_16E2C5, 4
	release
	end

Route109_EventScript_14F705:: @ 814F705
	msgbox Route109_Text_16E307, 2
	end

Route109_EventScript_14F70E:: @ 814F70E
	lock
	faceplayer
	msgbox Route109_Text_16E405, 4
	closebutton
	move LAST_TALKED, Route109_Movement_1A083D
	waitmove 0
	release
	end

Route109_EventScript_14F725:: @ 814F725
	lock
	faceplayer
	special 148
	checkflag 280
	jumpeq Route109_EventScript_14F762
	msgbox Route109_Text_16E433, 4
	giveitem ITEM_SOFT_SAND
	compare RESULT, 0
	jumpeq Route109_EventScript_1A029B
	closebutton
	move LAST_TALKED, Route109_Movement_1A083D
	waitmove 0
	setflag 280
	release
	end

Route109_EventScript_14F762:: @ 814F762
	msgbox Route109_Text_16E446, 4
	move LAST_TALKED, Route109_Movement_1A083D
	waitmove 0
	release
	end

Route109_EventScript_14F776:: @ 814F776
	msgbox Route109_Text_16E35B, 2
	end

Route109_EventScript_14F77F:: @ 814F77F
	msgbox Route109_Text_16E4D5, 2
	end

Route109_EventScript_14F788:: @ 814F788
	lock
	faceplayer
	checksound
	pokecry SPECIES_ZIGZAGOON, 0
	msgbox Route109_Text_16E5CA, 4
	waitpokecry
	release
	end

Route109_EventScript_14F79B:: @ 814F79B
	msgbox Route109_Text_16E5DC, 3
	end

Route109_EventScript_14F7A4:: @ 814F7A4
	msgbox Route109_Text_16E62C, 3
	end

Route109_EventScript_14F7AD:: @ 814F7AD
	trainerbattle 0, 158, 0, Route109_Text_1B9A1C, Route109_Text_1B9A59
	msgbox Route109_Text_1B9A6D, 6
	end

Route109_EventScript_14F7C4:: @ 814F7C4
	trainerbattle 0, 448, 0, Route109_Text_1B9AAD, Route109_Text_1B9AD9
	msgbox Route109_Text_1B9AEB, 6
	end

Route109_EventScript_14F7DB:: @ 814F7DB
	trainerbattle 0, 490, 0, Route109_Text_1B9B11, Route109_Text_1B9B57
	msgbox Route109_Text_1B9B68, 6
	end

Route109_EventScript_14F7F2:: @ 814F7F2
	trainerbattle 0, 491, 0, Route109_Text_1B9B91, Route109_Text_1B9BAE
	msgbox Route109_Text_1B9BD3, 6
	end

Route109_EventScript_14F809:: @ 814F809
	trainerbattle 0, 64, 0, Route109_Text_1B9C23, Route109_Text_1B9C65
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route109_EventScript_14F830
	msgbox Route109_Text_1B9C6E, 6
	end

Route109_EventScript_14F830:: @ 814F830
	trainerbattle 5, 64, 0, Route109_Text_1B9CB3, Route109_Text_1B9CEB
	msgbox Route109_Text_1B9D10, 6
	end

Route109_EventScript_14F847:: @ 814F847
	trainerbattle 0, 57, 0, Route109_Text_1B9D54, Route109_Text_1B9D87
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route109_EventScript_14F86E
	msgbox Route109_Text_1B9D8E, 6
	end

Route109_EventScript_14F86E:: @ 814F86E
	trainerbattle 5, 57, 0, Route109_Text_1B9DD8, Route109_Text_1B9E16
	msgbox Route109_Text_1B9E1D, 6
	end

Route109_EventScript_14F885:: @ 814F885
	trainerbattle 0, 58, 0, Route109_Text_1B9E60, Route109_Text_1B9EA1
	msgbox Route109_Text_1B9ECA, 6
	end

Route109_EventScript_14F89C:: @ 814F89C
	trainerbattle 0, 59, 0, Route109_Text_1B9F07, Route109_Text_1B9F31
	msgbox Route109_Text_1B9F44, 6
	end

Route109_EventScript_14F8B3:: @ 814F8B3
	trainerbattle 0, 345, 0, Route109_Text_1B9F65, Route109_Text_1B9F9C
	msgbox Route109_Text_1B9FB7, 6
	end

Route109_EventScript_14F8CA:: @ 814F8CA
	trainerbattle 4, 680, 0, Route109_Text_1B9FF6, Route109_Text_1BA052, Route109_Text_1BA0BF
	msgbox Route109_Text_1BA069, 6
	end

Route109_EventScript_14F8E5:: @ 814F8E5
	trainerbattle 4, 680, 0, Route109_Text_1BA114, Route109_Text_1BA15F, Route109_Text_1BA1D0
	msgbox Route109_Text_1BA193, 6
	end
