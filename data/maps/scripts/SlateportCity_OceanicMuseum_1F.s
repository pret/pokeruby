SlateportCity_OceanicMuseum_1F_MapScripts:: @ 8155ACA
	map_script 3, SlateportCity_OceanicMuseum_1F_MapScript1_155AD0
	.byte 0

SlateportCity_OceanicMuseum_1F_MapScript1_155AD0:: @ 8155AD0
	setvar 0x4010, 120
	setvar 0x4011, 119
	end

SlateportCity_OceanicMuseum_1F_EventScript_155ADB:: @ 8155ADB
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E1DE, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155AE4:: @ 8155AE4
	lockall
	move 255, SlateportCity_OceanicMuseum_1F_Movement_1A083F
	waitmove 0
	jump SlateportCity_OceanicMuseum_1F_EventScript_155B06
	end

SlateportCity_OceanicMuseum_1F_EventScript_155AF5:: @ 8155AF5
	lockall
	move 255, SlateportCity_OceanicMuseum_1F_Movement_1A0843
	waitmove 0
	jump SlateportCity_OceanicMuseum_1F_EventScript_155B06
	end

SlateportCity_OceanicMuseum_1F_EventScript_155B06:: @ 8155B06
	showmoney 0, 0
	snop
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E18D, 5
	compare RESULT, 1
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_155B2D
	closebutton
	hidemoney 0, 0
	move 255, SlateportCity_OceanicMuseum_1F_Movement_155B8D
	waitmove 0
	releaseall
	end

SlateportCity_OceanicMuseum_1F_EventScript_155B2D:: @ 8155B2D
	checkmoney 0x32, 0
	compare RESULT, 0
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_155B5A
	paymoney 0x32, 0
	updatemoney 0, 0
	snop
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E1DE, 4
	setvar 0x40aa, 1
	hidemoney 0, 0
	releaseall
	end

SlateportCity_OceanicMuseum_1F_EventScript_155B5A:: @ 8155B5A
	checkflag 149
	jumpif 0, SlateportCity_OceanicMuseum_1F_EventScript_155B7B
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E1F5, 4
	closebutton
	hidemoney 0, 0
	move 255, SlateportCity_OceanicMuseum_1F_Movement_155B8D
	waitmove 0
	releaseall
	end

SlateportCity_OceanicMuseum_1F_EventScript_155B7B:: @ 8155B7B
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E22D, 4
	setvar 0x40aa, 1
	hidemoney 0, 0
	releaseall
	end

SlateportCity_OceanicMuseum_1F_Movement_155B8D:: @ 8155B8D
	step_down
	step_end

SlateportCity_OceanicMuseum_1F_EventScript_155B8F:: @ 8155B8F
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E2BB, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155B98:: @ 8155B98
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E2E3, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BA1:: @ 8155BA1
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E338, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BAA:: @ 8155BAA
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E36F, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BB3:: @ 8155BB3
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E3A9, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BBC:: @ 8155BBC
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E3ED, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BC5:: @ 8155BC5
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E6C9, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BCE:: @ 8155BCE
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E741, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BD7:: @ 8155BD7
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E7C4, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BE0:: @ 8155BE0
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E892, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BE9:: @ 8155BE9
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E944, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BF2:: @ 8155BF2
	msgbox SlateportCity_OceanicMuseum_1F_Text_17EA19, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155BFB:: @ 8155BFB
	msgbox SlateportCity_OceanicMuseum_1F_Text_17EB0D, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155C04:: @ 8155C04
	msgbox SlateportCity_OceanicMuseum_1F_Text_17EBBC, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155C0D:: @ 8155C0D
	msgbox SlateportCity_OceanicMuseum_1F_Text_17EC98, 3
	end

SlateportCity_OceanicMuseum_1F_EventScript_155C16:: @ 8155C16
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E434, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155C1F:: @ 8155C1F
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E477, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155C28:: @ 8155C28
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E4D7, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155C31:: @ 8155C31
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E540, 2
	end

SlateportCity_OceanicMuseum_1F_EventScript_155C3A:: @ 8155C3A
	lock
	faceplayer
	pause 8
	playsfx 21
	move 13, SlateportCity_OceanicMuseum_1F_Movement_1A0833
	waitmove 0
	move 13, SlateportCity_OceanicMuseum_1F_Movement_1A0835
	waitmove 0
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E582, 4
	giveitem ITEM_TM46
	compare RESULT, 0
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_155CC2
	setflag 269
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E606, 4
	closebutton
	compare FACING, 2
	jumpeq SlateportCity_OceanicMuseum_1F_EventScript_155C98
	compare FACING, 2
	jumpif 5, SlateportCity_OceanicMuseum_1F_EventScript_155CAD
	end

SlateportCity_OceanicMuseum_1F_EventScript_155C98:: @ 8155C98
	move 13, SlateportCity_OceanicMuseum_1F_Movement_155CD3
	waitmove 0
	setflag 965
	playsfx 9
	disappear 13
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_155CAD:: @ 8155CAD
	move 13, SlateportCity_OceanicMuseum_1F_Movement_155CCC
	waitmove 0
	setflag 965
	playsfx 9
	disappear 13
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_155CC2:: @ 8155CC2
	msgbox SlateportCity_OceanicMuseum_1F_Text_17E695, 4
	release
	end

SlateportCity_OceanicMuseum_1F_Movement_155CCC:: @ 8155CCC
	step_00
	step_15
	step_15
	step_15
	step_15
	step_13
	step_end

SlateportCity_OceanicMuseum_1F_Movement_155CD3:: @ 8155CD3
	step_18
	step_15
	step_15
	step_15
	step_15
	step_13
	step_end

