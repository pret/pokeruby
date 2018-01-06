LittlerootTown_BrendansHouse_2F_MapScripts:: @ 81527A4
	map_script 3, LittlerootTown_BrendansHouse_2F_MapScript1_1527AF
	map_script 4, LittlerootTown_BrendansHouse_2F_MapScript2_1527DA
	.byte 0

LittlerootTown_BrendansHouse_2F_MapScript1_1527AF:: @ 81527AF
	call_if_unset FLAG_DEFEATED_RIVAL_ROUTE103, LittlerootTown_BrendansHouse_2F_EventScript_1527CE
	compare VAR_LITTLEROOT_INTRO_STATE, 4
	call_if_eq LittlerootTown_BrendansHouse_2F_EventScript_1B6950
	call LittlerootTown_BrendansHouse_2F_EventScript_1A2F3D
	setvar VAR_0x4089, 0
	end

LittlerootTown_BrendansHouse_2F_EventScript_1527CE:: @ 81527CE
	setobjectxyperm 1, 1, 2
	setobjectmovementtype 1, 7
	return

LittlerootTown_BrendansHouse_2F_MapScript2_1527DA:: @ 81527DA
	map_script_2 VAR_0x4089, 0, LittlerootTown_BrendansHouse_2F_EventScript_1527E4
	.2byte 0

LittlerootTown_BrendansHouse_2F_EventScript_1527E4:: @ 81527E4
	checkplayergender
	compare RESULT, 0
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_1A2F68
	end

@ 81527F1
	lockall
	checkplayergender
	compare RESULT, 0
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_15280A
	compare RESULT, 1
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152814
	end

LittlerootTown_BrendansHouse_2F_EventScript_15280A:: @ 815280A
	msgbox UnknownString_8172F31, 4
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152814:: @ 8152814
	msgbox UnknownString_8173A76, 4
	releaseall
	end

gUnknown_0815281E:: @ 815281E

LittlerootTown_BrendansHouse_2F_EventScript_15281E:: @ 815281E
	lockall
	checkplayergender
	compare RESULT, 0
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_152837
	compare RESULT, 1
	goto_if_eq LittlerootTown_BrendansHouse_2F_EventScript_15285D
	end

LittlerootTown_BrendansHouse_2F_EventScript_152837:: @ 8152837
	setvar VAR_SPECIAL_4, 1
	special DoPCTurnOnEffect
	playse SE_PC_ON
	msgbox LittlerootTown_BrendansHouse_2F_Text_1A10D6, 4
	special BedroomPC
	waitstate
	releaseall
	end

gBrendanHouse_TurnPCOff:: @ 8152850
	setvar VAR_SPECIAL_4, 1
	playse SE_PC_OFF
	special DoPCTurnOffEffect
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_15285D:: @ 815285D
	msgbox LittlerootTown_BrendansHouse_2F_Text_1A100C, 4
	releaseall
	end

LittlerootTown_BrendansHouse_2F_EventScript_152867:: @ 8152867
LittlerootTown_MaysHouse_2F_EventScript_152867:: @ 8152867
	msgbox LittlerootTown_BrendansHouse_2F_Text_172F9A, 3
	end

LittlerootTown_BrendansHouse_2F_EventScript_152870:: @ 8152870
LittlerootTown_MaysHouse_2F_EventScript_152870:: @ 8152870
	msgbox LittlerootTown_BrendansHouse_2F_Text_17306C, 3
	end
