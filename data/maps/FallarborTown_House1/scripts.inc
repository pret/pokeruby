FallarborTown_House1_MapScripts:: @ 8153BAE
	map_script MAP_SCRIPT_ON_TRANSITION, FallarborTown_House1_MapScript1_153BB4
	.byte 0

FallarborTown_House1_MapScript1_153BB4:: @ 8153BB4
	end

FallarborTown_House1_EventScript_153BB5:: @ 8153BB5
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM27, FallarborTown_House1_EventScript_153C54
	checkitem ITEM_METEORITE, 1
	compare VAR_RESULT, 1
	goto_if_eq FallarborTown_House1_EventScript_153BDA
	msgbox FallarborTown_House1_Text_177755, MSGBOX_DEFAULT
	release
	end

FallarborTown_House1_EventScript_153BDA:: @ 8153BDA
	call_if_unset FLAG_TEMP_2, FallarborTown_House1_EventScript_153C2D
	call_if_set FLAG_TEMP_2, FallarborTown_House1_EventScript_153C3E
	compare VAR_RESULT, NO
	goto_if_eq FallarborTown_House1_EventScript_153C47
	msgbox FallarborTown_House1_Text_1778C4, MSGBOX_DEFAULT
	giveitem ITEM_TM27_RETURN
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setvar VAR_0x8004, ITEM_METEORITE
	call Common_EventScript_PlayerHandedOverTheItem
	setflag FLAG_RECEIVED_TM27
	msgbox FallarborTown_House1_Text_177910, MSGBOX_DEFAULT
	release
	end

FallarborTown_House1_EventScript_153C2D:: @ 8153C2D
	msgbox FallarborTown_House1_Text_177755, MSGBOX_DEFAULT
	msgbox FallarborTown_House1_Text_17780E, MSGBOX_YESNO
	return

FallarborTown_House1_EventScript_153C3E:: @ 8153C3E
	msgbox FallarborTown_House1_Text_1779B8, MSGBOX_YESNO
	return

FallarborTown_House1_EventScript_153C47:: @ 8153C47
	setflag FLAG_TEMP_2
	msgbox FallarborTown_House1_Text_17797D, MSGBOX_DEFAULT
	release
	end

FallarborTown_House1_EventScript_153C54:: @ 8153C54
	msgbox FallarborTown_House1_Text_177910, MSGBOX_DEFAULT
	release
	end

FallarborTown_House1_EventScript_153C5E:: @ 8153C5E
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM27, FallarborTown_House1_EventScript_153C86
	goto_if_set FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY, FallarborTown_House1_EventScript_153C7C
	msgbox FallarborTown_House1_Text_177A2B, MSGBOX_DEFAULT
	release
	end

FallarborTown_House1_EventScript_153C7C:: @ 8153C7C
	msgbox FallarborTown_House1_Text_177A7C, MSGBOX_DEFAULT
	release
	end

FallarborTown_House1_EventScript_153C86:: @ 8153C86
	msgbox FallarborTown_House1_Text_177ABB, MSGBOX_DEFAULT
	release
	end
