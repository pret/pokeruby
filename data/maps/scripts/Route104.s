Route104_MapScripts:: @ 814EE8C
	map_script 2, Route104_MapScript2_14EE97
	map_script 3, Route104_MapScript1_14EEA8
	.byte 0

Route104_MapScript2_14EE97:: @ 814EE97
	map_script_2 0x408e, 1, Route104_EventScript_14EEA1
	.2byte 0

Route104_EventScript_14EEA1:: @ 814EEA1
	lockall
	jump Route104_EventScript_14EFD5
	end

Route104_MapScript1_14EEA8:: @ 814EEA8
	call Route104_EventScript_14EEAE
	end

Route104_EventScript_14EEAE:: @ 814EEAE
	checkflag 127
	jumpif 0, Route104_EventScript_14EEC4
	checkflag 2057
	jumpif 0, Route104_EventScript_14EEC4
	clearflag 906
	return

Route104_EventScript_14EEC4:: @ 814EEC4
	setflag 906
	return

Route104_EventScript_14EEC8:: @ 814EEC8
	lock
	faceplayer
	checkflag 246
	jumpeq Route104_EventScript_14EEFF
	loadptr 0, Route104_Text_1C55B9
	callstd 4
	setorcopyvar 0x8000, 0x86
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route104_EventScript_1A029B
	setflag 246
	loadptr 0, Route104_Text_1C5665
	callstd 4
	release
	end

Route104_EventScript_14EEFF:: @ 814EEFF
	loadptr 0, Route104_Text_1C5665
	callstd 4
	release
	end

Route104_EventScript_14EF09:: @ 814EF09
	lock
	faceplayer
	checkflag 279
	jumpeq Route104_EventScript_14EF38
	loadptr 0, Route104_Text_16DD91
	callstd 4
	setorcopyvar 0x8000, 0xb4
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route104_EventScript_1A029B
	setflag 279
	release
	end

Route104_EventScript_14EF38:: @ 814EF38
	loadptr 0, Route104_Text_16DE36
	callstd 4
	release
	end

Route104_EventScript_14EF42:: @ 814EF42
	loadptr 0, Route104_Text_16DA13
	callstd 2
	end

Route104_EventScript_14EF4B:: @ 814EF4B
	loadptr 0, Route104_Text_16DA89
	callstd 3
	end

Route104_EventScript_14EF54:: @ 814EF54
	loadptr 0, Route104_Text_16DEB3
	callstd 3
	end

Route104_EventScript_14EF5D:: @ 814EF5D
	loadptr 0, Route104_Text_16DEC8
	callstd 3
	end

Route104_EventScript_14EF66:: @ 814EF66
	loadptr 0, Route104_Text_16DEE3
	callstd 3
	end

Route104_EventScript_14EF6F:: @ 814EF6F
	loadptr 0, Route104_Text_16DEFD
	callstd 3
	end

Route104_EventScript_14EF78:: @ 814EF78
	loadptr 0, Route104_Text_16DF16
	callstd 3
	end

Route104_EventScript_14EF81:: @ 814EF81
	loadptr 0, Route104_Text_16DAC9
	callstd 2
	end

Route104_EventScript_14EF8A:: @ 814EF8A
	loadptr 0, Route104_Text_16DB5C
	callstd 2
	end

Route104_EventScript_14EF93:: @ 814EF93
	lock
	faceplayer
	checkflag 262
	jumpeq Route104_EventScript_14EFC2
	loadptr 0, Route104_Text_16DC5F
	callstd 4
	setorcopyvar 0x8000, 0x129
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route104_EventScript_1A029B
	setflag 262
	release
	end

Route104_EventScript_14EFC2:: @ 814EFC2
	loadptr 0, Route104_Text_16DD0E
	callstd 4
	release
	end

Route104_EventScript_14EFCC:: @ 814EFCC
	loadptr 0, Route104_Text_16DBC9
	callstd 2
	end

Route104_EventScript_14EFD5:: @ 814EFD5
	spritelevelup 8, 0, 19, 0
	spritelevelup 255, 0, 19, 0
	move 8, Route104_Movement_14F16C
	waitmove 0
	disappear 8
	move 255, Route104_Movement_14F162
	waitmove 0
	spriteinvisible 255, 0, 19
	call Route104_EventScript_1A02E7
	move 7, Route104_Movement_14F09F
	move 255, Route104_Movement_14F09F
	waitmove 0
	move 255, Route104_Movement_14F166
	waitmove 0
	call Route104_EventScript_1A02EF
	spritevisible 255, 0, 11
	move 255, Route104_Movement_14F168
	waitmove 0
	movespriteperm 2, 12, 8
	reappear 2
	spritelevelup 2, 0, 11, 0
	clearflag 740
	move 2, Route104_Movement_14F16F
	waitmove 0
	reappear 4
	clearflag 743
	call Route104_EventScript_1A02EF
	setflag 742
	spriteinvisible 7, 0, 19
	copyvar 0x4096, 0x8008
	restorespritelevel 255, 0, 19
	restorespritelevel 2, 0, 11
	moveoffscreen 2
	setvar 0x408e, 0
	checkflag 189
	jumpif 0, Route104_EventScript_14F08B
	checkflag 189
	jumpeq Route104_EventScript_14F095
	end

Route104_EventScript_14F08B:: @ 814F08B
	loadptr 0, Route104_Text_16B347
	callstd 4
	releaseall
	end

Route104_EventScript_14F095:: @ 814F095
	loadptr 0, Route104_Text_16B4B5
	callstd 4
	releaseall
	end

Route104_Movement_14F09F:: @ 814F09F
	step_down
	step_down
	step_down
	step_down
	step_15
	step_15
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
	step_15
	step_15
	step_15
	step_15
	step_18
	step_18
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_18
	step_18
	step_15
	step_15
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
	step_2d
	step_2d
	step_2d
	step_15
	step_15
	step_15
	step_15
	step_18
	step_18
	step_18
	step_18
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_30
	step_18
	step_18
	step_18
	step_18
	step_right
	step_right
	step_down
	step_down
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_15
	step_down
	step_down
	step_end

Route104_Movement_14F162:: @ 814F162
	step_left
	step_down
	step_down
	step_end

Route104_Movement_14F166:: @ 814F166
	step_down
	step_end

Route104_Movement_14F168:: @ 814F168
	step_down
	step_left
	step_28
	step_end

Route104_Movement_14F16C:: @ 814F16C
	step_down
	step_down
	step_end

Route104_Movement_14F16F:: @ 814F16F
	step_down
	step_27
	step_end

Route104_EventScript_14F172:: @ 814F172
	trainerbattle 0, 337, 0, Route104_Text_1B85EB, Route104_Text_1B8637
	loadptr 0, Route104_Text_1B8680
	callstd 6
	end

Route104_EventScript_14F189:: @ 814F189
	trainerbattle 0, 319, 0, Route104_Text_1B86BE, Route104_Text_1B86E8
	loadptr 0, Route104_Text_1B871C
	callstd 6
	end

Route104_EventScript_14F1A0:: @ 814F1A0
	trainerbattle 0, 604, 0, Route104_Text_1B8770, Route104_Text_1B87A7
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route104_EventScript_14F1C7
	loadptr 0, Route104_Text_1B87C3
	callstd 6
	end

Route104_EventScript_14F1C7:: @ 814F1C7
	trainerbattle 5, 604, 0, Route104_Text_1B8839, Route104_Text_1B8852
	loadptr 0, Route104_Text_1B8872
	callstd 6
	end

Route104_EventScript_14F1DE:: @ 814F1DE
	trainerbattle 0, 136, 0, Route104_Text_1B88D4, Route104_Text_1B8911
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route104_EventScript_14F205
	loadptr 0, Route104_Text_1B8925
	callstd 6
	end

Route104_EventScript_14F205:: @ 814F205
	trainerbattle 5, 136, 0, Route104_Text_1B895E, Route104_Text_1B899E
	loadptr 0, Route104_Text_1B89C0
	callstd 6
	end

Route104_EventScript_14F21C:: @ 814F21C
	trainerbattle 0, 114, 0, Route104_Text_1B8A24, Route104_Text_1B8A61
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route104_EventScript_14F243
	loadptr 0, Route104_Text_1B8A69
	callstd 6
	end

Route104_EventScript_14F243:: @ 814F243
	trainerbattle 5, 114, 0, Route104_Text_1B8AA7, Route104_Text_1B8AD9
	loadptr 0, Route104_Text_1B8B02
	callstd 6
	end

Route104_EventScript_14F25A:: @ 814F25A
	trainerbattle 4, 483, 0, Route104_Text_1B83E9, Route104_Text_1B8414, Route104_Text_1B845C
	special 148
	loadptr 0, Route104_Text_1B842C
	callstd 4
	release
	end

Route104_EventScript_14F279:: @ 814F279
	trainerbattle 4, 483, 0, Route104_Text_1B84DB, Route104_Text_1B850D, Route104_Text_1B8577
	special 148
	loadptr 0, Route104_Text_1B853B
	callstd 4
	release
	end

