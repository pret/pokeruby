DewfordTown_MapScripts:: @ 814DFF8
	map_script 3, DewfordTown_MapScript1_14DFFE
	.byte 0

DewfordTown_MapScript1_14DFFE:: @ 814DFFE
	setflag 2065
	end

DewfordTown_EventScript_14E002:: @ 814E002
	lock
	faceplayer
	checkflag 189
	goto_if 0, DewfordTown_EventScript_14E076
	message DewfordTown_Text_16B522
	waittext
	multichoicedef 21, 6, 0, 2, 0
	switch RESULT
	case 0, DewfordTown_EventScript_14E04B
	case 1, DewfordTown_EventScript_14E05B
	case 2, DewfordTown_EventScript_14E06B
	case 127, DewfordTown_EventScript_14E06B
	end

DewfordTown_EventScript_14E04B:: @ 814E04B
	msgbox DewfordTown_Text_16B57D, 4
	closebutton
	goto DewfordTown_EventScript_14E151
	release
	end

DewfordTown_EventScript_14E05B:: @ 814E05B
	msgbox DewfordTown_Text_16B5D2, 4
	closebutton
	goto DewfordTown_EventScript_14E1D8
	release
	end

DewfordTown_EventScript_14E06B:: @ 814E06B
	msgbox DewfordTown_Text_16B627, 4
	closebutton
	release
	end

DewfordTown_EventScript_14E076:: @ 814E076
	msgbox DewfordTown_Text_16B3BC, 5
	compare RESULT, 1
	goto_if_eq DewfordTown_EventScript_14E093
	msgbox DewfordTown_Text_16B471, 4
	release
	end

DewfordTown_EventScript_14E093:: @ 814E093
	msgbox DewfordTown_Text_16B417, 4
	closebutton
	goto DewfordTown_EventScript_14E151
	end

DewfordTown_EventScript_14E0A2:: @ 814E0A2
	msgbox DewfordTown_Text_16B23B, 2
	end

DewfordTown_EventScript_14E0AB:: @ 814E0AB
	msgbox DewfordTown_Text_16B2A7, 3
	end

DewfordTown_EventScript_14E0B4:: @ 814E0B4
	msgbox DewfordTown_Text_16B2D5, 3
	end

DewfordTown_EventScript_14E0BD:: @ 814E0BD
	msgbox DewfordTown_Text_16B317, 3
	end

DewfordTown_EventScript_14E0C6:: @ 814E0C6
	lock
	faceplayer
	checkflag 257
	goto_if_eq DewfordTown_EventScript_14E11B
	msgbox DewfordTown_Text_16B665, 5
	compare RESULT, 1
	goto_if_eq DewfordTown_EventScript_14E0F0
	compare RESULT, 0
	goto_if_eq DewfordTown_EventScript_14E111
	end

DewfordTown_EventScript_14E0F0:: @ 814E0F0
	msgbox DewfordTown_Text_16B6A8, 4
	giveitem ITEM_OLD_ROD
	setflag 257
	msgbox DewfordTown_Text_16B6F9, 4
	release
	end

DewfordTown_EventScript_14E111:: @ 814E111
	msgbox DewfordTown_Text_16B828, 4
	release
	end

DewfordTown_EventScript_14E11B:: @ 814E11B
	message DewfordTown_Text_16B84E
	waittext
	multichoice 20, 8, 50, 1
	compare RESULT, 0
	goto_if_eq DewfordTown_EventScript_14E13D
	compare RESULT, 1
	goto_if_eq DewfordTown_EventScript_14E147
	end

DewfordTown_EventScript_14E13D:: @ 814E13D
	msgbox DewfordTown_Text_16B866, 4
	release
	end

DewfordTown_EventScript_14E147:: @ 814E147
	msgbox DewfordTown_Text_16B89A, 4
	release
	end

DewfordTown_EventScript_14E151:: @ 814E151
	call DewfordTown_EventScript_1A010C
	spritelevelup 2, 0, 11, 0
	spritelevelup 255, 0, 11, 0
	applymovement 2, DewfordTown_Movement_14E40E
	waitmovement 0
	disappear 2
	applymovement 255, DewfordTown_Movement_14E402
	waitmovement 0
	spriteinvisible 255, 0, 11
	call DewfordTown_EventScript_1A02E7
	applymovement 4, DewfordTown_Movement_14E293
	applymovement 255, DewfordTown_Movement_14E293
	waitmovement 0
	spritevisible 255, 0, 19
	call DewfordTown_EventScript_1A02EF
	applymovement 255, DewfordTown_Movement_14E405
	waitmovement 0
	spritevisible 255, 0, 19
	clearflag 739
	clearflag 881
	clearflag 742
	setflag 743
	spriteinvisible 4, 0, 11
	setvar 0x408e, 2
	restorespritelevel 255, 0, 11
	warp Route104_MrBrineysHouse, 255, 5, 4
	copyvar 0x4096, 0x8008
	waitstate
	release
	end

DewfordTown_EventScript_14E1D8:: @ 814E1D8
	call DewfordTown_EventScript_1A010C
	spritelevelup 2, 0, 11, 0
	spritelevelup 255, 0, 11, 1
	applymovement 2, DewfordTown_Movement_14E40E
	waitmovement 0
	disappear 2
	applymovement 255, DewfordTown_Movement_14E402
	waitmovement 0
	spriteinvisible 255, 0, 11
	call DewfordTown_EventScript_1A02E7
	applymovement 4, DewfordTown_Movement_14E356
	applymovement 255, DewfordTown_Movement_14E356
	waitmovement 0
	call DewfordTown_EventScript_1A02EF
	spritevisible 255, 0, 24
	applymovement 255, DewfordTown_Movement_14E409
	waitmovement 0
	movespriteperm 2, 21, 26
	reappear 2
	spritelevelup 2, 0, 24, 0
	applymovement 2, DewfordTown_Movement_14E410
	waitmovement 0
	clearflag 741
	reappear 1
	clearflag 744
	setflag 743
	spriteinvisible 4, 0, 11
	checkflag 149
	call_if 0, DewfordTown_EventScript_14E281
	checkflag 149
	call_if 1, DewfordTown_EventScript_14E28A
	closebutton
	copyvar 0x4096, 0x8008
	restorespritelevel 255, 0, 11
	restorespritelevel 2, 0, 24
	moveoffscreen 2
	release
	end

DewfordTown_EventScript_14E281:: @ 814E281
	msgbox DewfordTown_Text_16E080, 4
	return

DewfordTown_EventScript_14E28A:: @ 814E28A
	msgbox DewfordTown_Text_16E1FA, 4
	return

DewfordTown_Movement_14E293:: @ 814E293
	step_up
	step_up
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_up
	step_up
	step_left
	step_left
	step_17
	step_17
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
	step_17
	step_17
	step_17
	step_17
	step_16
	step_16
	step_16
	step_16
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_16
	step_16
	step_16
	step_16
	step_17
	step_17
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_2f
	step_17
	step_17
	step_16
	step_16
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_16
	step_16
	step_16
	step_16
	step_up
	step_up
	step_up
	step_up
	step_end

DewfordTown_Movement_14E356:: @ 814E356
	step_right
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
	step_16
	step_16
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_2e
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_end

DewfordTown_Movement_14E402:: @ 814E402
	step_right
	step_up
	step_end

DewfordTown_Movement_14E405:: @ 814E405
	step_up
	step_up
	step_up
	step_end

DewfordTown_Movement_14E409:: @ 814E409
	step_up
	step_up
	step_up
	step_25
	step_end

DewfordTown_Movement_14E40E:: @ 814E40E
	step_up
	step_end

DewfordTown_Movement_14E410:: @ 814E410
	step_up
	step_up
	step_end

DewfordTown_EventScript_14E413:: @ 814E413
	lock
	faceplayer
	call DewfordTown_EventScript_1A0102
	msgbox DewfordTown_Text_16B9CE, 5
	compare RESULT, 1
	goto_if_eq DewfordTown_EventScript_14E439
	compare RESULT, 0
	goto_if_eq DewfordTown_EventScript_14E443
	end

DewfordTown_EventScript_14E439:: @ 814E439
	msgbox DewfordTown_Text_16BD37, 4
	release
	end

DewfordTown_EventScript_14E443:: @ 814E443
	msgbox DewfordTown_Text_16BADC, 4
	setvar 0x8004, 9
	call DewfordTown_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, 1
	goto_if_eq DewfordTown_EventScript_14E46E
	compare RESULT, 0
	goto_if_eq DewfordTown_EventScript_14E485
	end

DewfordTown_EventScript_14E46E:: @ 814E46E
	inccounter GAME_STAT_STARTED_TRENDS
	compare 0x8004, 0
	goto_if_eq DewfordTown_EventScript_14E48F
	msgbox DewfordTown_Text_16BB44, 4
	release
	end

DewfordTown_EventScript_14E485:: @ 814E485
	msgbox DewfordTown_Text_16BCE9, 4
	release
	end

DewfordTown_EventScript_14E48F:: @ 814E48F
	msgbox DewfordTown_Text_16BCA2, 4
	release
	end

@ 814E499
	msgbox DewfordTown_Text_16BD79, 4
	release
	end
