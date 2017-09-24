DewfordTown_Hall_MapScripts:: @ 8153292
	.byte 0

DewfordTown_Hall_EventScript_153293:: @ 8153293
	lock
	faceplayer
	call DewfordTown_Hall_EventScript_1A0102
	special sub_80FA5E4
	compare_var_to_imm RESULT, 1
	goto_if_eq DewfordTown_Hall_EventScript_1532B2
	msgbox DewfordTown_Hall_Text_1754C9, 4
	release
	end

DewfordTown_Hall_EventScript_1532B2:: @ 81532B2
	msgbox DewfordTown_Hall_Text_175528, 4
	release
	end

DewfordTown_Hall_EventScript_1532BC:: @ 81532BC
	lock
	faceplayer
	call DewfordTown_Hall_EventScript_1A0102
	msgbox DewfordTown_Hall_Text_17559E, 4
	release
	end

DewfordTown_Hall_EventScript_1532CD:: @ 81532CD
	lock
	faceplayer
	call DewfordTown_Hall_EventScript_1A0102
	special sub_80EB83C
	msgbox DewfordTown_Hall_Text_1755F9, 5
	compare_var_to_imm RESULT, 1
	goto_if_eq DewfordTown_Hall_EventScript_1532F6
	compare_var_to_imm RESULT, 0
	goto_if_eq DewfordTown_Hall_EventScript_153300
	end

DewfordTown_Hall_EventScript_1532F6:: @ 81532F6
	msgbox DewfordTown_Hall_Text_175664, 4
	release
	end

DewfordTown_Hall_EventScript_153300:: @ 8153300
	msgbox DewfordTown_Hall_Text_1756B7, 4
	release
	end

DewfordTown_Hall_EventScript_15330A:: @ 815330A
	lock
	faceplayer
	call DewfordTown_Hall_EventScript_1A0102
	msgbox DewfordTown_Hall_Text_17570D, 4
	closebutton
	move 4, DewfordTown_Hall_Movement_1A0841
	waitmove 0
	release
	end

DewfordTown_Hall_EventScript_153326:: @ 8153326
	lock
	faceplayer
	call DewfordTown_Hall_EventScript_1A0102
	msgbox DewfordTown_Hall_Text_17574C, 4
	closebutton
	move 5, DewfordTown_Hall_Movement_1A0841
	waitmove 0
	release
	end

DewfordTown_Hall_EventScript_153342:: @ 8153342
	lock
	faceplayer
	call DewfordTown_Hall_EventScript_1A0102
	msgbox DewfordTown_Hall_Text_175779, 4
	release
	end

DewfordTown_Hall_EventScript_153353:: @ 8153353
	lockall
	call DewfordTown_Hall_EventScript_1A0102
	msgbox DewfordTown_Hall_Text_175842, 4
	releaseall
	end

DewfordTown_Hall_EventScript_153363:: @ 8153363
	lockall
	call DewfordTown_Hall_EventScript_1A0102
	special sub_80FA648
	switch RESULT
	case 0, DewfordTown_Hall_EventScript_1533CA
	case 4, DewfordTown_Hall_EventScript_1533CA
	case 1, DewfordTown_Hall_EventScript_1533D4
	case 5, DewfordTown_Hall_EventScript_1533CA
	case 2, DewfordTown_Hall_EventScript_1533DE
	case 6, DewfordTown_Hall_EventScript_1533DE
	case 3, DewfordTown_Hall_EventScript_1533E8
	case 7, DewfordTown_Hall_EventScript_1533DE
	end

DewfordTown_Hall_EventScript_1533CA:: @ 81533CA
	msgbox DewfordTown_Hall_Text_1758C4, 4
	releaseall
	end

DewfordTown_Hall_EventScript_1533D4:: @ 81533D4
	msgbox DewfordTown_Hall_Text_1758E0, 4
	releaseall
	end

DewfordTown_Hall_EventScript_1533DE:: @ 81533DE
	msgbox DewfordTown_Hall_Text_1758FB, 4
	releaseall
	end

DewfordTown_Hall_EventScript_1533E8:: @ 81533E8
	msgbox DewfordTown_Hall_Text_175916, 4
	releaseall
	end

DewfordTown_Hall_EventScript_1533F2:: @ 81533F2
	lockall
	setvar 0x8008, 0
	goto DewfordTown_Hall_EventScript_15340A
	end

DewfordTown_Hall_EventScript_1533FE:: @ 81533FE
	lockall
	setvar 0x8008, 1
	goto DewfordTown_Hall_EventScript_15340A
	end

DewfordTown_Hall_EventScript_15340A:: @ 815340A
	call DewfordTown_Hall_EventScript_1A0102
	special sub_80FA648
	switch RESULT
	case 0, DewfordTown_Hall_EventScript_153470
	case 1, DewfordTown_Hall_EventScript_153470
	case 2, DewfordTown_Hall_EventScript_15348C
	case 3, DewfordTown_Hall_EventScript_15348C
	case 4, DewfordTown_Hall_EventScript_1534A8
	case 5, DewfordTown_Hall_EventScript_1534A8
	case 6, DewfordTown_Hall_EventScript_1534C4
	case 7, DewfordTown_Hall_EventScript_1534E0
	end

DewfordTown_Hall_EventScript_153470:: @ 8153470
	call DewfordTown_Hall_EventScript_1534FD
	msgbox DewfordTown_Hall_Text_175935, 4
	call DewfordTown_Hall_EventScript_153535
	msgbox DewfordTown_Hall_Text_1759A1, 4
	releaseall
	end

DewfordTown_Hall_EventScript_15348C:: @ 815348C
	call DewfordTown_Hall_EventScript_1534FD
	msgbox DewfordTown_Hall_Text_175A5C, 4
	call DewfordTown_Hall_EventScript_153535
	msgbox DewfordTown_Hall_Text_175AD9, 4
	releaseall
	end

DewfordTown_Hall_EventScript_1534A8:: @ 81534A8
	call DewfordTown_Hall_EventScript_1534FD
	msgbox DewfordTown_Hall_Text_175B46, 4
	call DewfordTown_Hall_EventScript_153535
	msgbox DewfordTown_Hall_Text_175BA7, 4
	releaseall
	end

DewfordTown_Hall_EventScript_1534C4:: @ 81534C4
	call DewfordTown_Hall_EventScript_1534FD
	msgbox DewfordTown_Hall_Text_175C41, 4
	call DewfordTown_Hall_EventScript_153535
	msgbox DewfordTown_Hall_Text_175CC2, 4
	releaseall
	end

DewfordTown_Hall_EventScript_1534E0:: @ 81534E0
	call DewfordTown_Hall_EventScript_1534FD
	msgbox DewfordTown_Hall_Text_175D6B, 4
	call DewfordTown_Hall_EventScript_153535
	msgbox DewfordTown_Hall_Text_175DC3, 4
	releaseall
	end

DewfordTown_Hall_EventScript_1534FC:: @ 81534FC
	return

DewfordTown_Hall_EventScript_1534FD:: @ 81534FD
	move 8, DewfordTown_Hall_Movement_153599
	waitmove 0
	compare_var_to_imm 0x8008, 0
	goto_if_eq DewfordTown_Hall_EventScript_15351E
	compare_var_to_imm 0x8008, 1
	goto_if_eq DewfordTown_Hall_EventScript_153534
	end

DewfordTown_Hall_EventScript_15351E:: @ 815351E
	compare_var_to_imm FACING, 4
	goto_if_eq DewfordTown_Hall_EventScript_1534FC
	move 255, DewfordTown_Hall_Movement_1A0843
	waitmove 0
	return

DewfordTown_Hall_EventScript_153534:: @ 8153534
	return

DewfordTown_Hall_EventScript_153535:: @ 8153535
	move 7, DewfordTown_Hall_Movement_15359B
	waitmove 0
	compare_var_to_imm 0x8008, 0
	goto_if_eq DewfordTown_Hall_EventScript_153556
	compare_var_to_imm 0x8008, 1
	goto_if_eq DewfordTown_Hall_EventScript_153583
	end

DewfordTown_Hall_EventScript_153556:: @ 8153556
	compare_var_to_imm FACING, 2
	call_if 1, DewfordTown_Hall_EventScript_15356D
	compare_var_to_imm FACING, 1
	call_if 1, DewfordTown_Hall_EventScript_153578
	return

DewfordTown_Hall_EventScript_15356D:: @ 815356D
	move 255, DewfordTown_Hall_Movement_1A0841
	waitmove 0
	return

DewfordTown_Hall_EventScript_153578:: @ 8153578
	move 255, DewfordTown_Hall_Movement_1A0845
	waitmove 0
	return

DewfordTown_Hall_EventScript_153583:: @ 8153583
	compare_var_to_imm FACING, 3
	goto_if_eq DewfordTown_Hall_EventScript_1534FC
	move 255, DewfordTown_Hall_Movement_1A083F
	waitmove 0
	return

DewfordTown_Hall_Movement_153599:: @ 8153599
	step_1f
	step_end

DewfordTown_Hall_Movement_15359B:: @ 815359B
	step_20
	step_end

DewfordTown_Hall_EventScript_15359D:: @ 815359D
	lock
	faceplayer
	call DewfordTown_Hall_EventScript_1A0102
	checkflag 230
	goto_if_eq DewfordTown_Hall_EventScript_1535D1
	msgbox DewfordTown_Hall_Text_175E13, 4
	giveitem ITEM_TM36
	compare_var_to_imm RESULT, 0
	goto_if_eq DewfordTown_Hall_EventScript_1A029B
	setflag 230
	release
	end

DewfordTown_Hall_EventScript_1535D1:: @ 81535D1
	msgbox DewfordTown_Hall_Text_175EBE, 4
	release
	end
