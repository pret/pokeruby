gUnknown_081A2C51:: @ 81A2C51
	special sub_80BB70C
	special CheckPlayerHasSecretBase
	compare VAR_RESULT, 1
	goto_if_eq AskToMoveSecretBase
	checkpartymove MOVE_SECRET_POWER
	setfieldeffectargument 0, VAR_RESULT
	buffermovename 1, MOVE_SECRET_POWER
	compare VAR_0x8007, 1
	goto_if_eq EventScript_1A2CB0
	compare VAR_0x8007, 2
	goto_if_eq EventScript_1A2CB0
	compare VAR_0x8007, 3
	goto_if_eq EventScript_1A2CB0
	compare VAR_0x8007, 4
	goto_if_eq EventScript_1A2CB0
	compare VAR_0x8007, 5
	goto_if_eq EventScript_1A2D08
	compare VAR_0x8007, 6
	goto_if_eq EventScript_1A2D60
	end

EventScript_1A2CB0:
	lockall
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A2CF1
	bufferpartymonnick 0, VAR_RESULT
	msgbox UnknownString_8198F34, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, MSGBOX_DEFAULT
	closemessage
	dofieldeffect FLDEFF_USE_SECRET_POWER_CAVE
	waitstate
	goto EventScript_1A2CFA
	end

DoSecretBaseCaveFieldEffectScript:: @ 81A2CE6
	lockall
	dofieldeffect FLDEFF_USE_SECRET_POWER_CAVE
	waitstate
	goto EventScript_1A2CFA
	end

EventScript_1A2CF1:
	msgbox UnknownString_8198F10, MSGBOX_SIGN
	end

EventScript_1A2CFA:
	msgbox UnknownString_8198F6E, MSGBOX_DEFAULT
	goto EventScript_1A2DB8
	end

EventScript_1A2D08:
	lockall
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A2D49
	bufferpartymonnick 0, VAR_RESULT
	msgbox UnknownString_81A197B, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, MSGBOX_DEFAULT
	closemessage
	dofieldeffect FLDEFF_USE_SECRET_POWER_TREE
	waitstate
	goto EventScript_1A2D52
	end

DoSecretBaseTreeFieldEffectScript:: @ 81A2D3E
	lockall
	dofieldeffect FLDEFF_USE_SECRET_POWER_TREE
	waitstate
	goto EventScript_1A2D52
	end

EventScript_1A2D49:
	msgbox UnknownString_81A1948, MSGBOX_SIGN
	end

EventScript_1A2D52:
	msgbox UnknownString_81A19C4, MSGBOX_DEFAULT
	goto EventScript_1A2DB8
	end

EventScript_1A2D60:
	lockall
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A2DA1
	bufferpartymonnick 0, VAR_RESULT
	msgbox UnknownString_81A1A4B, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox UsedCutRockSmashText, MSGBOX_DEFAULT
	closemessage
	dofieldeffect FLDEFF_USE_SECRET_POWER_SHRUB
	waitstate
	goto EventScript_1A2DAA
	end

DoSecretBaseShrubFieldEffectScript:: @ 81A2D96
	lockall
	dofieldeffect FLDEFF_USE_SECRET_POWER_SHRUB
	waitstate
	goto EventScript_1A2DAA
	end

EventScript_1A2DA1:
	msgbox UnknownString_81A1A03, MSGBOX_SIGN
	end

EventScript_1A2DAA:
	msgbox UnknownString_81A1AA9, MSGBOX_DEFAULT
	goto EventScript_1A2DB8
	end

EventScript_1A2DB8:
	closemessage
	playse SE_EXIT
	setvar VAR_INIT_SECRET_BASE, 0
	setflag FLAG_DECORATION_1
	special sub_80BB8CC
	special sub_80BBAF0
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 0
	special sub_80BBDD0
	setvar VAR_SECRET_BASE_INITIALIZED, 1
	waitstate
	end

SecretBase_EventScript_FirstEntrance:: @ 81A2DDE
	applymovement OBJ_EVENT_ID_PLAYER, SecretBase_RedCave1_Movement_1A2E11
	waitmovement 0
	setvar VAR_INIT_SECRET_BASE, 1
	msgbox SecretBase_RedCave1_Text_198F89, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SecretBase_RedCave1_EventScript_1A2E08
	closemessage
	playse SE_EXIT
	special sub_80BC440
	end

SecretBase_RedCave1_EventScript_1A2E08:: @ 81A2E08
	closemessage
	setflag FLAG_RECEIVED_SECRET_POWER
	special sub_80BBC78
	waitstate
	end

SecretBase_RedCave1_Movement_1A2E11:: @ 81A2E11
	walk_up
	walk_up
	step_end

gUnknown_081A2E14:: @ 81A2E14
	lockall
	setvar VAR_INIT_SECRET_BASE, 1
	playse SE_EXIT
	special sub_80BC114
	compare VAR_RESULT, 0
	goto_if_eq EventScript_1A2E38
	clearflag FLAG_DECORATION_1
	special sub_80BBAF0
	setvar VAR_SECRET_BASE_INITIALIZED, 0
	waitstate
	end

EventScript_1A2E38:
	setflag FLAG_DECORATION_1
	special sub_80BBAF0
	setvar VAR_SECRET_BASE_INITIALIZED, 0
	waitstate
	end

AskToMoveSecretBase:
	checkpartymove MOVE_SECRET_POWER
	compare VAR_RESULT, 6
	goto_if_eq EventScript_1A2EF7
	setfieldeffectargument 0, VAR_RESULT
	setorcopyvar VAR_0x8004, VAR_RESULT
	lockall
	special GetSecretBaseNearbyMapName
	msgbox UnknownString_81A3C71, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	msgbox SecretBase_Text_AllDecorationsWillBeReturned, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	fadescreen FADE_TO_BLACK
	special MoveSecretBase
	closemessage
	fadescreen FADE_FROM_BLACK
	msgbox UnknownString_81A3CC9, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq EventScript_1A2F3A
	bufferpartymonnick 0, VAR_0x8004
	buffermovename 1, MOVE_SECRET_POWER
	msgbox UsedCutRockSmashText, MSGBOX_DEFAULT
	closemessage
	closemessage
	compare VAR_0x8007, 1
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_0x8007, 2
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_0x8007, 3
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_0x8007, 4
	goto_if_eq DoSecretBaseCaveFieldEffectScript
	compare VAR_0x8007, 5
	goto_if_eq DoSecretBaseTreeFieldEffectScript
	compare VAR_0x8007, 6
	goto_if_eq DoSecretBaseShrubFieldEffectScript
	releaseall
	end

EventScript_1A2EF7::
	compare VAR_0x8007, 1
	goto_if_eq EventScript_1A2CF1
	compare VAR_0x8007, 2
	goto_if_eq EventScript_1A2CF1
	compare VAR_0x8007, 3
	goto_if_eq EventScript_1A2CF1
	compare VAR_0x8007, 4
	goto_if_eq EventScript_1A2CF1
	compare VAR_0x8007, 5
	goto_if_eq EventScript_1A2D49
	compare VAR_0x8007, 6
	goto_if_eq EventScript_1A2DA1
	end

EventScript_1A2F3A::
	closemessage
	releaseall
	end

SecretBase_EventScript_SetDecorationFlags:: @ 81A2F3D
	setflag FLAG_DECORATION_2
	setflag FLAG_DECORATION_3
	setflag FLAG_DECORATION_4
	setflag FLAG_DECORATION_5
	setflag FLAG_DECORATION_6
	setflag FLAG_DECORATION_7
	setflag FLAG_DECORATION_8
	setflag FLAG_DECORATION_9
	setflag FLAG_DECORATION_10
	setflag FLAG_DECORATION_11
	setflag FLAG_DECORATION_12
	setflag FLAG_DECORATION_13
	setflag FLAG_DECORATION_14
	setflag FLAG_DECORATION_15
	return

SecretBase_EventScript_InitDecorations:: @ 81A2F68
	setvar VAR_0x8004, 0
	setvar VAR_0x8005, 0
	special sub_80BBDD0
	setvar VAR_SECRET_BASE_INITIALIZED, 1
	end

gUnknown_081A2F7B:: @ 81A2F7B
	setvar VAR_0x8005, 0
	goto EventScript_1A2F86
	end

EventScript_1A2F86:
	special sub_80FF474
	end

gUnknown_081A2F8A:: @ 81A2F8A
	setvar VAR_0x8004, 0
	goto EventScript_1A2F95
	end

EventScript_1A2F95:
	special sub_8100A7C
	compare VAR_RESULT, 1
	goto_if_eq EventScript_1A2FBF
	addvar VAR_0x8004, 1
	compare VAR_0x8005, 0
	goto_if_eq EventScript_1A2F95
	removeobject VAR_0x8006
	setflag VAR_0x8005
	goto EventScript_1A2F95
	end

EventScript_1A2FBF:
	end

SecretBase_BlueCave1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BlueCave2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BlueCave3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BlueCave4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BrownCave1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BrownCave2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BrownCave3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_BrownCave4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_RedCave1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_RedCave2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_RedCave3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_RedCave4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Shrub1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Shrub2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Shrub3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Shrub4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Tree1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Tree2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Tree3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_Tree4_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_YellowCave1_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_YellowCave2_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_YellowCave3_EventScript_1A2FC0:: @ 81A2FC0
SecretBase_YellowCave4_EventScript_1A2FC0:: @ 81A2FC0
	special sub_80BCE90
	compare VAR_0x8004, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3032
	compare VAR_0x8004, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A30AE
	compare VAR_0x8004, 2
	goto_if_eq SecretBase_RedCave1_EventScript_1A312A
	compare VAR_0x8004, 3
	goto_if_eq SecretBase_RedCave1_EventScript_1A31A6
	compare VAR_0x8004, 4
	goto_if_eq SecretBase_RedCave1_EventScript_1A3222
	compare VAR_0x8004, 5
	goto_if_eq SecretBase_RedCave1_EventScript_1A329E
	compare VAR_0x8004, 6
	goto_if_eq SecretBase_RedCave1_EventScript_1A331A
	compare VAR_0x8004, 7
	goto_if_eq SecretBase_RedCave1_EventScript_1A3396
	compare VAR_0x8004, 8
	goto_if_eq SecretBase_RedCave1_EventScript_1A3412
	compare VAR_0x8004, 9
	goto_if_eq SecretBase_RedCave1_EventScript_1A348E
	end

SecretBase_RedCave1_EventScript_1A3032:: @ 81A3032
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3086
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A30A5
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1AEA, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A308F
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A308F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1B83, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3086:: @ 81A3086
	msgbox SecretBase_RedCave1_Text_1A1C3B, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A308F:: @ 81A308F
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1B97, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A30A5:: @ 81A30A5
	msgbox SecretBase_RedCave1_Text_1A1BF8, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A30AE:: @ 81A30AE
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3102
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3121
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1E67, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A310B
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A310B
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1F04, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3102:: @ 81A3102
	msgbox SecretBase_RedCave1_Text_1A1FBD, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A310B:: @ 81A310B
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1F2E, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3121:: @ 81A3121
	msgbox SecretBase_RedCave1_Text_1A1F88, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A312A:: @ 81A312A
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A317E
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A319D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A218F, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A3187
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3187
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2220, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A317E:: @ 81A317E
	msgbox SecretBase_RedCave1_Text_1A22FA, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3187:: @ 81A3187
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2230, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A319D:: @ 81A319D
	msgbox SecretBase_RedCave1_Text_1A2280, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A31A6:: @ 81A31A6
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A31FA
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3219
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A24E1, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A3203
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3203
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A256F, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A31FA:: @ 81A31FA
	msgbox SecretBase_RedCave1_Text_1A2609, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3203:: @ 81A3203
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A258A, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3219:: @ 81A3219
	msgbox SecretBase_RedCave1_Text_1A25D2, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3222:: @ 81A3222
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3276
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3295
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2830, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A327F
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A327F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A28D7, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3276:: @ 81A3276
	msgbox SecretBase_RedCave1_Text_1A297C, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A327F:: @ 81A327F
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A28F4, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3295:: @ 81A3295
	msgbox SecretBase_RedCave1_Text_1A294D, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A329E:: @ 81A329E
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A32F2
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3311
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A1CB2, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A32FB
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A32FB
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1D48, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A32F2:: @ 81A32F2
	msgbox SecretBase_RedCave1_Text_1A1DF6, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A32FB:: @ 81A32FB
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A1D59, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3311:: @ 81A3311
	msgbox SecretBase_RedCave1_Text_1A1DC0, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A331A:: @ 81A331A
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A336E
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A338D
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2026, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A3377
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A3377
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2095, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A336E:: @ 81A336E
	msgbox SecretBase_RedCave1_Text_1A2147, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3377:: @ 81A3377
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A20AE, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A338D:: @ 81A338D
	msgbox SecretBase_RedCave1_Text_1A2109, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3396:: @ 81A3396
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A33EA
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3409
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A236A, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A33F3
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A33F3
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2405, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A33EA:: @ 81A33EA
	msgbox SecretBase_RedCave1_Text_1A2480, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A33F3:: @ 81A33F3
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2420, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3409:: @ 81A3409
	msgbox SecretBase_RedCave1_Text_1A2446, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3412:: @ 81A3412
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A3466
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3485
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2663, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A346F
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A346F
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2710, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A3466:: @ 81A3466
	msgbox SecretBase_RedCave1_Text_1A27A4, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A346F:: @ 81A346F
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2736, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3485:: @ 81A3485
	msgbox SecretBase_RedCave1_Text_1A276A, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A348E:: @ 81A348E
	goto_if_unset FLAG_SYS_GAME_CLEAR, SecretBase_RedCave1_EventScript_1A34E2
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_RedCave1_EventScript_1A3501
	lock
	faceplayer
	msgbox SecretBase_RedCave1_Text_1A2A13, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_RedCave1_EventScript_1A34EB
	setvar VAR_RESULT, 1
	special sub_80BCE4C
	call Common_EventScript_SaveGame
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_RedCave1_EventScript_1A34EB
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2AE2, MSGBOX_DEFAULT
	goto SecretBase_RedCave1_EventScript_1A350A
	end

SecretBase_RedCave1_EventScript_1A34E2:: @ 81A34E2
	msgbox SecretBase_RedCave1_Text_1A2BA4, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A34EB:: @ 81A34EB
	setvar VAR_RESULT, 0
	special sub_80BCE4C
	erasebox 0, 0, 15, 10
	msgbox SecretBase_RedCave1_Text_1A2AFB, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A3501:: @ 81A3501
	msgbox SecretBase_RedCave1_Text_1A2B69, MSGBOX_NPC
	end

SecretBase_RedCave1_EventScript_1A350A:: @ 81A350A
	special sub_80BCE1C
	setvar VAR_0x8004, 1
	setvar VAR_0x8005, 0
	special StartSpecialBattle
	waitstate
	special ScrSpecial_HealPlayerParty
	release
	end
