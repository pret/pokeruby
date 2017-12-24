FallarborTown_House1_MapScripts:: @ 8153BAE
	map_script 3, FallarborTown_House1_MapScript1_153BB4
	.byte 0

FallarborTown_House1_MapScript1_153BB4:: @ 8153BB4
	end

FallarborTown_House1_EventScript_153BB5:: @ 8153BB5
	lock
	faceplayer
	checkflag FLAG_RECEIVED_TM27
	goto_if_eq FallarborTown_House1_EventScript_153C54
	checkitem ITEM_METEORITE, 1
	compare RESULT, 1
	goto_if_eq FallarborTown_House1_EventScript_153BDA
	msgbox FallarborTown_House1_Text_177755, 4
	release
	end

FallarborTown_House1_EventScript_153BDA:: @ 8153BDA
	checkflag FLAG_TEMP_2
	call_if 0, FallarborTown_House1_EventScript_153C2D
	checkflag FLAG_TEMP_2
	call_if 1, FallarborTown_House1_EventScript_153C3E
	compare RESULT, 0
	goto_if_eq FallarborTown_House1_EventScript_153C47
	msgbox FallarborTown_House1_Text_1778C4, 4
	giveitem_std ITEM_TM27
	compare RESULT, 0
	goto_if_eq FallarborTown_House1_EventScript_1A029B
	setvar VAR_SPECIAL_4, 280
	call FallarborTown_House1_EventScript_1A067F
	setflag FLAG_RECEIVED_TM27
	msgbox FallarborTown_House1_Text_177910, 4
	release
	end

FallarborTown_House1_EventScript_153C2D:: @ 8153C2D
	msgbox FallarborTown_House1_Text_177755, 4
	msgbox FallarborTown_House1_Text_17780E, 5
	return

FallarborTown_House1_EventScript_153C3E:: @ 8153C3E
	msgbox FallarborTown_House1_Text_1779B8, 5
	return

FallarborTown_House1_EventScript_153C47:: @ 8153C47
	setflag FLAG_TEMP_2
	msgbox FallarborTown_House1_Text_17797D, 4
	release
	end

FallarborTown_House1_EventScript_153C54:: @ 8153C54
	msgbox FallarborTown_House1_Text_177910, 4
	release
	end

FallarborTown_House1_EventScript_153C5E:: @ 8153C5E
	lock
	faceplayer
	checkflag FLAG_RECEIVED_TM27
	goto_if_eq FallarborTown_House1_EventScript_153C86
	checkflag FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY
	goto_if_eq FallarborTown_House1_EventScript_153C7C
	msgbox FallarborTown_House1_Text_177A2B, 4
	release
	end

FallarborTown_House1_EventScript_153C7C:: @ 8153C7C
	msgbox FallarborTown_House1_Text_177A7C, 4
	release
	end

FallarborTown_House1_EventScript_153C86:: @ 8153C86
	msgbox FallarborTown_House1_Text_177ABB, 4
	release
	end
