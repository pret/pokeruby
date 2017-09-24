BattleTower_Outside_MapScripts:: @ 8160156
	map_script 3, BattleTower_Outside_MapScript1_16015C
	.byte 0

BattleTower_Outside_MapScript1_16015C:: @ 816015C
	setflag 2120
	setvar 0x40bc, 0
	setflag 918
	end

BattleTower_Outside_EventScript_160168:: @ 8160168
	lock
	faceplayer
	msgbox BattleTower_Outside_Text_199D06, 4
	checkitem ITEM_SS_TICKET, 1
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Outside_EventScript_1601C6
	message BattleTower_Outside_Text_199D9D
	waittext
	goto BattleTower_Outside_EventScript_16018E
	end

BattleTower_Outside_EventScript_16018E:: @ 816018E
	multichoicedef 21, 6, 53, 2, 0
	switch RESULT
	case 0, BattleTower_Outside_EventScript_1601D0
	case 1, BattleTower_Outside_EventScript_1601FB
	case 2, BattleTower_Outside_EventScript_160250
	case 127, BattleTower_Outside_EventScript_160250
	end

BattleTower_Outside_EventScript_1601C6:: @ 81601C6
	msgbox BattleTower_Outside_Text_199D40, 4
	release
	end

BattleTower_Outside_EventScript_1601D0:: @ 81601D0
	msgbox BattleTower_Outside_Text_199DF2, 5
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Outside_EventScript_160226
	msgbox BattleTower_Outside_Text_199E4B, 4
	call BattleTower_Outside_EventScript_160232
	warp SlateportCity_Harbor, 255, 8, 11
	waitstate
	release
	end

BattleTower_Outside_EventScript_1601FB:: @ 81601FB
	msgbox BattleTower_Outside_Text_199E0E, 5
	compare_var_to_imm RESULT, 0
	goto_if_eq BattleTower_Outside_EventScript_160226
	msgbox BattleTower_Outside_Text_199E4B, 4
	call BattleTower_Outside_EventScript_160232
	warp LilycoveCity_Harbor, 255, 8, 11
	waitstate
	release
	end

BattleTower_Outside_EventScript_160226:: @ 8160226
	message BattleTower_Outside_Text_199E7A
	waittext
	goto BattleTower_Outside_EventScript_16018E
	end

BattleTower_Outside_EventScript_160232:: @ 8160232
	closebutton
	move LAST_TALKED, BattleTower_Outside_Movement_1A0845
	waitmove 0
	delay 30
	spriteinvisible 5, 26, 4
	setvar 0x8004, 4
	call BattleTower_Outside_EventScript_1A047C
	return

BattleTower_Outside_EventScript_160250:: @ 8160250
	msgbox BattleTower_Outside_Text_199E29, 4
	release
	end

BattleTower_Outside_EventScript_16025A:: @ 816025A
	msgbox BattleTower_Outside_Text_199C6F, 3
	end

BattleTower_Outside_EventScript_160263:: @ 8160263
	msgbox BattleTower_Outside_Text_199CA4, 2
	end

BattleTower_Outside_EventScript_16026C:: @ 816026C
	msgbox BattleTower_Outside_Text_199E9C, 2
	end

BattleTower_Outside_EventScript_160275:: @ 8160275
	msgbox BattleTower_Outside_Text_199ED4, 2
	end
