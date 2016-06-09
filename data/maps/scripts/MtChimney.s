MtChimney_MapScripts:: @ 815CF7C
	map_script 5, MtChimney_MapScript1_15CF92
	map_script 3, MtChimney_MapScript1_15CF87
	.byte 0

MtChimney_MapScript1_15CF87:: @ 815CF87
	setvar 0x40bd, 1
	call MtChimney_EventScript_1A0196
	end

MtChimney_MapScript1_15CF92:: @ 815CF92
	tileeffect 1
	end

MtChimney_EventScript_15CF95:: @ 815CF95
	lock
	faceplayer
	showmoney 0, 0
	snop
	loadptr 0, MtChimney_Text_195760
	callstd 5
	compare RESULT, 0
	jumpeq MtChimney_EventScript_15D00B
	checkmoney 0xc8, 0
	compare RESULT, 0
	jumpeq MtChimney_EventScript_15D018
	loadptr 0, MtChimney_Text_1957A9
	callstd 4
	checkitemspace ITEM_LAVA_COOKIE, 1
	compare RESULT, 1
	callif 1, MtChimney_EventScript_15D000
	setorcopyvar 0x8000, 0x26
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq MtChimney_EventScript_15CFF3
	hidemoney 0, 0
	release
	end

MtChimney_EventScript_15CFF3:: @ 815CFF3
	loadptr 0, MtChimney_Text_1A0CC2
	callstd 4
	hidemoney 0, 0
	release
	end

MtChimney_EventScript_15D000:: @ 815D000
	paymoney 0xc8, 0
	updatemoney 0, 0
	snop
	return

MtChimney_EventScript_15D00B:: @ 815D00B
	loadptr 0, MtChimney_Text_1957F7
	callstd 4
	hidemoney 0, 0
	release
	end

MtChimney_EventScript_15D018:: @ 815D018
	loadptr 0, MtChimney_Text_1957BA
	callstd 4
	hidemoney 0, 0
	release
	end

MtChimney_Movement_15D025:: @ 815D025
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_end

MtChimney_Movement_15D02D:: @ 815D02D
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

MtChimney_Movement_15D036:: @ 815D036
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

MtChimney_Movement_15D03E:: @ 815D03E
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

	.incbin "baserom.gba", 0x15d048, 0xad

MtChimney_EventScript_15D0F5:: @ 815D0F5
	loadptr 0, MtChimney_Text_1B40EA
	callstd 3
	end

MtChimney_EventScript_15D0FE:: @ 815D0FE
	loadptr 0, MtChimney_Text_1B4128
	callstd 3
	end

MtChimney_EventScript_15D107:: @ 815D107
	loadptr 0, MtChimney_Text_1B416E
	callstd 3
	end

MtChimney_EventScript_15D110:: @ 815D110
	trainerbattle 0, 597, 0, MtChimney_Text_1B3B36, MtChimney_Text_1B3BB8
	loadptr 0, MtChimney_Text_1B3C07
	callstd 6
	end

MtChimney_EventScript_15D127:: @ 815D127
	trainerbattle 0, 579, 0, MtChimney_Text_1B3C96, MtChimney_Text_1B3D1E
	loadptr 0, MtChimney_Text_1B3D3D
	callstd 6
	end

MtChimney_EventScript_15D13E:: @ 815D13E
	loadptr 0, MtChimney_Text_1B3D9A
	callstd 3
	end

	.incbin "baserom.gba", 0x15d147, 0x9

MtChimney_EventScript_15D150:: @ 815D150
	loadptr 0, MtChimney_Text_1B3DF5
	callstd 3
	end

MtChimney_EventScript_15D159:: @ 815D159
	loadptr 0, MtChimney_Text_1B3E1F
	callstd 3
	end

MtChimney_EventScript_15D162:: @ 815D162
	loadptr 0, MtChimney_Text_1B3E7A
	callstd 3
	end

MtChimney_EventScript_15D16B:: @ 815D16B
	loadptr 0, MtChimney_Text_1B3EBA
	callstd 3
	end

MtChimney_EventScript_15D174:: @ 815D174
	loadptr 0, MtChimney_Text_1B41B0
	callstd 3
	end

MtChimney_EventScript_15D17D:: @ 815D17D
	lockall
	checkflag 139
	jumpif 0, MtChimney_EventScript_15D1D0
	checkflag 115
	jumpeq MtChimney_EventScript_15D1C6
	loadptr 0, MtChimney_Text_195870
	callstd 5
	compare RESULT, 0
	jumpeq MtChimney_EventScript_15D1BC
	loadptr 0, MtChimney_Text_1958C6
	callstd 4
	setorcopyvar 0x8000, 0x118
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 115
	releaseall
	end

MtChimney_EventScript_15D1BC:: @ 815D1BC
	loadptr 0, MtChimney_Text_1958FC
	callstd 4
	releaseall
	end

MtChimney_EventScript_15D1C6:: @ 815D1C6
	loadptr 0, MtChimney_Text_195920
	callstd 4
	releaseall
	end

MtChimney_EventScript_15D1D0:: @ 815D1D0
	loadptr 0, MtChimney_Text_195806
	callstd 4
	releaseall
	end

MtChimney_EventScript_15D1DA:: @ 815D1DA
	loadptr 0, MtChimney_Text_19595C
	callstd 3
	end

MtChimney_EventScript_15D1E3:: @ 815D1E3
	trainerbattle 0, 313, 0, MtChimney_Text_19597F, MtChimney_Text_1959D8
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq MtChimney_EventScript_15D20A
	loadptr 0, MtChimney_Text_195A04
	callstd 6
	end

MtChimney_EventScript_15D20A:: @ 815D20A
	trainerbattle 5, 313, 0, MtChimney_Text_195A45, MtChimney_Text_195AAD
	loadptr 0, MtChimney_Text_195AD9
	callstd 6
	end

MtChimney_EventScript_15D221:: @ 815D221
	trainerbattle 0, 124, 0, MtChimney_Text_195B1C, MtChimney_Text_195B5F
	loadptr 0, MtChimney_Text_195B84
	callstd 6
	end

MtChimney_EventScript_15D238:: @ 815D238
	trainerbattle 0, 125, 0, MtChimney_Text_195BB2, MtChimney_Text_195BF9
	loadptr 0, MtChimney_Text_195C31
	callstd 6
	end

MtChimney_EventScript_15D24F:: @ 815D24F
	trainerbattle 0, 126, 0, MtChimney_Text_195CD8, MtChimney_Text_195D2F
	loadptr 0, MtChimney_Text_195D5C
	callstd 6
	end

