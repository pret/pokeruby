Route101_MapScripts:: @ 814E924
	map_script 3, Route101_MapScript1_14E92F
	map_script 2, Route101_MapScript2_14E935
	.byte 0

Route101_MapScript1_14E92F:: @ 814E92F
	call Route101_EventScript_1A02F4
	end

Route101_MapScript2_14E935:: @ 814E935
	map_script_2 0x4060, 0, Route101_EventScript_14E93F
	.2byte 0

Route101_EventScript_14E93F:: @ 814E93F
	setflag 0x4000
	setvar 0x4060, 1
	end

Route101_EventScript_14E948:: @ 814E948
	lockall
	playbgm 410, 1
	msgbox Route101_Text_16D10E, 4
	closemessage
	setobjectxy 2, 0, 15
	setobjectxy 4, 0, 16
	applymovement 255, Route101_Movement_14EA2C
	applymovement 2, Route101_Movement_14EA50
	applymovement 4, Route101_Movement_14EA1F
	waitmovement 0
	applymovement 4, Route101_Movement_14EA00
	applymovement 2, Route101_Movement_14EA31
	waitmovement 0
	applymovement 2, Route101_Movement_1A0843
	waitmovement 0
	applymovement 4, Route101_Movement_14EA27
	applymovement 2, Route101_Movement_14EA58
	waitmovement 0
	msgbox Route101_Text_16D119, 4
	closemessage
	setvar 0x4060, 2
	releaseall
	end

Route101_EventScript_14E9B8:: @ 814E9B8
	lockall
	msgbox Route101_Text_16D15E, 4
	closemessage
	applymovement 255, Route101_Movement_14E9FA
	waitmovement 0
	releaseall
	end

Route101_EventScript_14E9CE:: @ 814E9CE
	lockall
	msgbox Route101_Text_16D15E, 4
	closemessage
	applymovement 255, Route101_Movement_14E9FC
	waitmovement 0
	releaseall
	end

Route101_EventScript_14E9E4:: @ 814E9E4
	lockall
	msgbox Route101_Text_16D15E, 4
	closemessage
	applymovement 255, Route101_Movement_14E9FE
	waitmovement 0
	releaseall
	end

Route101_Movement_14E9FA:: @ 814E9FA
	step_up
	step_end

Route101_Movement_14E9FC:: @ 814E9FC
	step_right
	step_end

Route101_Movement_14E9FE:: @ 814E9FE
	step_down
	step_end

Route101_Movement_14EA00:: @ 814EA00
	step_16
	step_16
	step_16
	step_18
	step_18
	step_18
	step_15
	step_15
	step_17
	step_17
	step_17
	step_16
	step_16
	step_18
	step_18
	step_18
	step_15
	step_15
	step_17
	step_17
	step_17
	step_16
	step_16
	step_18
	step_18
	step_18
	step_15
	step_15
	step_17
	step_17
	step_end

Route101_Movement_14EA1F:: @ 814EA1F
	step_16
	step_18
	step_18
	step_18
	step_18
	step_16
	step_end

@ 814EA26
	step_end

Route101_Movement_14EA27:: @ 814EA27
	step_23
	step_23
	step_23
	step_23
	step_end

Route101_Movement_14EA2C:: @ 814EA2C
	step_16
	step_16
	step_16
	step_16
	step_end

Route101_Movement_14EA31:: @ 814EA31
	step_16
	step_16
	step_18
	step_18
	step_18
	step_15
	step_15
	step_17
	step_17
	step_17
	step_16
	step_16
	step_18
	step_18
	step_18
	step_15
	step_15
	step_17
	step_17
	step_17
	step_16
	step_16
	step_18
	step_18
	step_18
	step_15
	step_15
	step_17
	step_17
	step_17
	step_end

Route101_Movement_14EA50:: @ 814EA50
	step_18
	step_18
	step_18
	step_18
	step_16
	step_16
	step_end

@ 814EA57
	step_end

Route101_Movement_14EA58:: @ 814EA58
	step_24
	step_24
	step_24
	step_24
	step_end

@ 814EA5D
	step_up
	step_up
	step_end

@ 814EA60
	step_up
	step_left
	step_up
	step_end

Route101_EventScript_14EA64:: @ 814EA64
	msgbox Route101_Text_16D25E, 2
	end

Route101_EventScript_14EA6D:: @ 814EA6D
	msgbox Route101_Text_16D2CB, 2
	end

Route101_EventScript_14EA76:: @ 814EA76
	msgbox Route101_Text_16D349, 3
	end

Route101_EventScript_14EA7F:: @ 814EA7F
	lock
	faceplayer
	setflag 2048
	setflag 82
	fadescreen 1
	removeobject 4
	setobjectxy 255, 6, 13
	applymovement 255, Route101_Movement_1A083F
	waitmovement 0
	special ScrSpecial_ChooseStarter
	waitstate
	applymovement 2, Route101_Movement_14EAD7
	waitmovement 0
	msgbox Route101_Text_16D191, 4
	special ScrSpecial_HealPlayerParty
	setflag 720
	clearflag 721
	setflag 700
	setvar 0x4084, 2
	setvar 0x4060, 3
	clearflag 0x4000
	warp LittlerootTown_ProfessorBirchsLab, 255, 6, 5
	waitstate
	release
	end

Route101_Movement_14EAD7:: @ 814EAD7
	step_right
	step_end
