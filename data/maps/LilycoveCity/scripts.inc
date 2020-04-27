LilycoveCity_MapScripts:: @ 814CA15
	map_script MAP_SCRIPT_ON_TRANSITION, LilycoveCity_MapScript1_14CA20
	map_script MAP_SCRIPT_ON_LOAD, LilycoveCity_MapScript1_14CA3F
	.byte 0

LilycoveCity_MapScript1_14CA20:: @ 814CA20
	setflag FLAG_VISITED_LILYCOVE_CITY
	setvar VAR_LINK_CONTEST_ROOM_STATE, 0
	setflag FLAG_HIDE_CONTEST_REPORTER_LILYCOVE
	call_if_set FLAG_SYS_WEATHER_CTRL, LilycoveCity_EventScript_1A02C1
	call LilycoveCity_EventScript_1A0196
	call LilycoveCity_EventScript_1A014E
	end

LilycoveCity_MapScript1_14CA3F:: @ 814CA3F
	.ifndef SAPPHIRE
	setmetatile 69, 4, METATILE_General_RockWall_WaterBase, 1
	setmetatile 70, 4, METATILE_Lilycove_AquaHideout_Entrance_TopLeft, 1
	setmetatile 71, 4, METATILE_Lilycove_AquaHideout_Entrance_TopMid, 1
	setmetatile 72, 4, METATILE_Lilycove_AquaHideout_Entrance_TopRight, 1
	setmetatile 69, 5, METATILE_General_RockWall_SandBase, 1
	setmetatile 70, 5, METATILE_Lilycove_AquaHideout_Entrance_BottomLeft, 1
	setmetatile 71, 5, METATILE_Lilycove_AquaHideout_Entrance_BottomMid, 0
	setmetatile 72, 5, METATILE_Lilycove_AquaHideout_Entrance_BottomRight, 1
	setmetatile 69, 6, METATILE_General_Shore_BottomMid, 0
	setmetatile 70, 6, METATILE_General_Shore_BottomRight, 0
	setmetatile 71, 6, METATILE_General_CalmWater, 0
	setmetatile 72, 6, METATILE_General_Shore_BottomLeft, 0
	.endif
	call_if_unset FLAG_EVIL_TEAM_ESCAPED_IN_SUBMARINE, LilycoveCity_EventScript_14CABE
	call_if_set FLAG_BADGE07_GET, LilycoveCity_EventScript_14CB2B
	end

LilycoveCity_EventScript_14CABE:: @ 814CABE
	setmetatile 76, 12, METATILE_Lilycove_Wailmer0, 1
	setmetatile 77, 12, METATILE_Lilycove_Wailmer1, 1
	setmetatile 76, 13, METATILE_Lilycove_Wailmer2, 1
	setmetatile 77, 13, METATILE_Lilycove_Wailmer3, 1
	setmetatile 76, 14, METATILE_Lilycove_Wailmer0_Alt, 1
	setmetatile 77, 14, METATILE_Lilycove_Wailmer1_Alt, 1
	setmetatile 76, 15, METATILE_Lilycove_Wailmer2, 1
	setmetatile 77, 15, METATILE_Lilycove_Wailmer3, 1
	setmetatile 77, 16, METATILE_Lilycove_Wailmer0_Alt, 1
	setmetatile 78, 16, METATILE_Lilycove_Wailmer1_Alt, 1
	setmetatile 77, 17, METATILE_Lilycove_Wailmer2, 1
	setmetatile 78, 17, METATILE_Lilycove_Wailmer3, 1
	return

LilycoveCity_EventScript_14CB2B:: @ 814CB2B
	setmetatile 69, 4, METATILE_General_RockWall_WaterBase, 1
	setmetatile 70, 4, METATILE_General_RockWall_WaterBase, 1
	setmetatile 71, 4, METATILE_General_RockWall_WaterBase, 1
	setmetatile 72, 4, METATILE_General_RockWall_WaterBase, 1
	setmetatile 69, 5, METATILE_General_RockWall_SandBase, 1
	setmetatile 70, 5, METATILE_General_RockWall_SandBase, 1
	setmetatile 71, 5, METATILE_General_RockWall_SandBase, 1
	setmetatile 72, 5, METATILE_General_RockWall_SandBase, 1
	return

LilycoveCity_EventScript_14CB74:: @ 814CB74
	lock
	faceplayer
	dotimebasedevents
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_LILYCOVE, LilycoveCity_EventScript_14CBB4
	msgbox LilycoveCity_Text_1C5A7A, MSGBOX_DEFAULT
	random 10
	addvar VAR_RESULT, ITEM_CHERI_BERRY
	giveitem VAR_RESULT
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_EventScript_1A029B
	setflag FLAG_DAILY_RECEIVED_BERRY_LILYCOVE
	msgbox LilycoveCity_Text_1C5B1D, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CBB4:: @ 814CBB4
	msgbox LilycoveCity_Text_1C5B5D, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CBBE:: @ 814CBBE
	msgbox LilycoveCity_Text_1686C9, MSGBOX_NPC
	end

LilycoveCity_EventScript_14CBC7:: @ 814CBC7
	lock
	faceplayer
	goto_if_set FLAG_BADGE07_GET, LilycoveCity_EventScript_14CBDC
	msgbox LilycoveCity_Text_168750, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CBDC:: @ 814CBDC
	msgbox LilycoveCity_Text_168791, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CBE6:: @ 814CBE6
	msgbox LilycoveCity_Text_168819, MSGBOX_NPC
	end

LilycoveCity_EventScript_14CBEF:: @ 814CBEF
	lock
	faceplayer
	goto_if_set FLAG_EVIL_TEAM_ESCAPED_IN_SUBMARINE, LilycoveCity_EventScript_14CC04
	msgbox LilycoveCity_Text_1688C1, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CC04:: @ 814CC04
	msgbox LilycoveCity_Text_168934, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CC0E:: @ 814CC0E
	lock
	faceplayer
	goto_if_set FLAG_EVIL_TEAM_ESCAPED_IN_SUBMARINE, LilycoveCity_EventScript_14CC23
	msgbox LilycoveCity_Text_1689BF, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CC23:: @ 814CC23
	msgbox LilycoveCity_Text_168A55, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CC2D:: @ 814CC2D
	msgbox LilycoveCity_Text_168A8D, MSGBOX_NPC
	end

LilycoveCity_EventScript_14CC36:: @ 814CC36
	msgbox LilycoveCity_Text_168B1F, MSGBOX_SIGN
	end

LilycoveCity_EventScript_14CC3F:: @ 814CC3F
	msgbox LilycoveCity_Text_168B9B, MSGBOX_SIGN
	end

LilycoveCity_EventScript_14CC48:: @ 814CC48
	lock
	faceplayer
	goto_if_set FLAG_BADGE07_GET, LilycoveCity_EventScript_14CC5D
	msgbox LilycoveCity_Text_168C16, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CC5D:: @ 814CC5D
	msgbox LilycoveCity_Text_168D15, MSGBOX_DEFAULT
	release
	end

LilycoveCity_EventScript_14CC67:: @ 814CC67
	msgbox LilycoveCity_Text_168DA9, MSGBOX_SIGN
	end

LilycoveCity_EventScript_14CC70:: @ 814CC70
	msgbox LilycoveCity_Text_168DE1, MSGBOX_SIGN
	end

LilycoveCity_EventScript_14CC79:: @ 814CC79
	msgbox LilycoveCity_Text_168E2F, MSGBOX_SIGN
	end

LilycoveCity_EventScript_14CC82:: @ 814CC82
	lockall
	specialvar VAR_0x8004, sub_80C4D50
	switch VAR_0x8004
	case 0, LilycoveCity_EventScript_14CCA2
	msgbox LilycoveCity_Text_168EA4, MSGBOX_DEFAULT
	releaseall
	end

LilycoveCity_EventScript_14CCA2:: @ 814CCA2
	msgbox LilycoveCity_Text_168E67, MSGBOX_DEFAULT
	releaseall
	end

LilycoveCity_EventScript_14CCAC:: @ 814CCAC
	lockall
	goto_if_set FLAG_SYS_GAME_CLEAR, LilycoveCity_EventScript_14CCC0
	msgbox LilycoveCity_Text_168EDA, MSGBOX_DEFAULT
	releaseall
	end

LilycoveCity_EventScript_14CCC0:: @ 814CCC0
	msgbox LilycoveCity_Text_168F57, MSGBOX_DEFAULT
	releaseall
	end

LilycoveCity_EventScript_14CCCA:: @ 814CCCA
	msgbox LilycoveCity_Text_168FA1, MSGBOX_SIGN
	end

LilycoveCity_EventScript_14CCD3:: @ 814CCD3
	msgbox LilycoveCity_Text_168FF3, MSGBOX_SIGN
	end

LilycoveCity_EventScript_14CCDC:: @ 814CCDC
	msgbox LilycoveCity_Text_169072, MSGBOX_SIGN
	end

LilycoveCity_EventScript_14CCE5:: @ 814CCE5
	lockall
	goto_if_set FLAG_MET_WAILMER_TRAINER, LilycoveCity_EventScript_14CD18
	msgbox LilycoveCity_Text_16864A, MSGBOX_DEFAULT
	applymovement VAR_LAST_TALKED, Common_Movement_FacePlayer
	waitmovement 0
	msgbox LilycoveCity_Text_168675, MSGBOX_DEFAULT
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	setflag FLAG_MET_WAILMER_TRAINER
	releaseall
	end

LilycoveCity_EventScript_14CD18:: @ 814CD18
	msgbox LilycoveCity_Text_16864A, MSGBOX_DEFAULT
	releaseall
	end

LilycoveCity_EventScript_14CD22:: @ 814CD22
	msgbox LilycoveCity_Text_168455, MSGBOX_NPC
	end

LilycoveCity_EventScript_14CD2B:: @ 814CD2B
	msgbox LilycoveCity_Text_1684C2, MSGBOX_NPC
	end

LilycoveCity_EventScript_14CD34:: @ 814CD34
	msgbox LilycoveCity_Text_168573, MSGBOX_NPC
	end

LilycoveCity_EventScript_14CD3D:: @ 814CD3D
	msgbox LilycoveCity_Text_1685EB, MSGBOX_NPC
	end

LilycoveCity_EventScript_14CD46:: @ 814CD46
	lock
	faceplayer
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_EventScript_14CD60
	compare VAR_RESULT, 1
	goto_if_eq LilycoveCity_EventScript_14CDD3
	end

LilycoveCity_EventScript_14CD60:: @ 814CD60
	playbgm MUS_GIRL_SUP, TRUE
	call_if_set FLAG_DECLINED_RIVAL_BATTLE_LILYCOVE, LilycoveCity_EventScript_14CDB0
	call_if_unset FLAG_DECLINED_RIVAL_BATTLE_LILYCOVE, LilycoveCity_EventScript_14CDB9
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_EventScript_14CDC2
	msgbox LilycoveCity_Text_167B94, MSGBOX_DEFAULT
	switch VAR_STARTER_MON
	case 0, LilycoveCity_EventScript_14CE46
	case 1, LilycoveCity_EventScript_14CE56
	case 2, LilycoveCity_EventScript_14CE66
	end

LilycoveCity_EventScript_14CDB0:: @ 814CDB0
	msgbox LilycoveCity_Text_167B55, MSGBOX_YESNO
	return

LilycoveCity_EventScript_14CDB9:: @ 814CDB9
	msgbox LilycoveCity_Text_1679BF, MSGBOX_YESNO
	return

LilycoveCity_EventScript_14CDC2:: @ 814CDC2
	setflag FLAG_DECLINED_RIVAL_BATTLE_LILYCOVE
	msgbox LilycoveCity_Text_167AEB, MSGBOX_DEFAULT
	savebgm 0
	fadedefaultbgm
	release
	end

LilycoveCity_EventScript_14CDD3:: @ 814CDD3
	playbgm MUS_BOY_SUP, TRUE
	call_if_set FLAG_DECLINED_RIVAL_BATTLE_LILYCOVE, LilycoveCity_EventScript_14CE23
	call_if_unset FLAG_DECLINED_RIVAL_BATTLE_LILYCOVE, LilycoveCity_EventScript_14CE2C
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_EventScript_14CE35
	msgbox LilycoveCity_Text_1680A9, MSGBOX_DEFAULT
	switch VAR_STARTER_MON
	case 0, LilycoveCity_EventScript_14CE76
	case 1, LilycoveCity_EventScript_14CE86
	case 2, LilycoveCity_EventScript_14CE96
	end

LilycoveCity_EventScript_14CE23:: @ 814CE23
	msgbox LilycoveCity_Text_168067, MSGBOX_YESNO
	return

LilycoveCity_EventScript_14CE2C:: @ 814CE2C
	msgbox LilycoveCity_Text_167F75, MSGBOX_YESNO
	return

LilycoveCity_EventScript_14CE35:: @ 814CE35
	setflag FLAG_DECLINED_RIVAL_BATTLE_LILYCOVE
	msgbox LilycoveCity_Text_16802C, MSGBOX_DEFAULT
	savebgm 0
	fadedefaultbgm
	release
	end

LilycoveCity_EventScript_14CE46:: @ 814CE46
	trainerbattle_no_intro TRAINER_MAY_11, LilycoveCity_Text_167BD5
	goto LilycoveCity_EventScript_14CEA6
	end

LilycoveCity_EventScript_14CE56:: @ 814CE56
	trainerbattle_no_intro TRAINER_MAY_12, LilycoveCity_Text_167BD5
	goto LilycoveCity_EventScript_14CEA6
	end

LilycoveCity_EventScript_14CE66:: @ 814CE66
	trainerbattle_no_intro TRAINER_MAY_10, LilycoveCity_Text_167BD5
	goto LilycoveCity_EventScript_14CEA6
	end

LilycoveCity_EventScript_14CE76:: @ 814CE76
	trainerbattle_no_intro TRAINER_BRENDAN_11, LilycoveCity_Text_1680E4
	goto LilycoveCity_EventScript_14CF12
	end

LilycoveCity_EventScript_14CE86:: @ 814CE86
	trainerbattle_no_intro TRAINER_BRENDAN_12, LilycoveCity_Text_1680E4
	goto LilycoveCity_EventScript_14CF12
	end

LilycoveCity_EventScript_14CE96:: @ 814CE96
	trainerbattle_no_intro TRAINER_BRENDAN_10, LilycoveCity_Text_1680E4
	goto LilycoveCity_EventScript_14CF12
	end

LilycoveCity_EventScript_14CEA6:: @ 814CEA6
	msgbox LilycoveCity_Text_167C6B, MSGBOX_DEFAULT
	setvar VAR_RESULT, 0
	call_if_set FLAG_BADGE06_GET, LilycoveCity_EventScript_14CEDE
	compare VAR_RESULT, 0
	call_if_eq LilycoveCity_EventScript_14CEEE
	compare VAR_RESULT, 1
	call_if_eq LilycoveCity_EventScript_14CEF7
	clearflag FLAG_HIDE_MAY_UPSTAIRS
	clearflag FLAG_HIDE_MAY_PICHU_DOLL
	goto LilycoveCity_EventScript_14CF6B
	end

LilycoveCity_EventScript_14CEDE:: @ 814CEDE
	goto_if_set FLAG_BADGE08_GET, LilycoveCity_EventScript_14CEE8
	return

LilycoveCity_EventScript_14CEE8:: @ 814CEE8
	setvar VAR_RESULT, 1
	return

LilycoveCity_EventScript_14CEEE:: @ 814CEEE
	msgbox LilycoveCity_Text_167D08, MSGBOX_DEFAULT
	return

LilycoveCity_EventScript_14CEF7:: @ 814CEF7
	goto_if_set FLAG_SYS_GAME_CLEAR, LilycoveCity_EventScript_14CF09
	msgbox LilycoveCity_Text_167DDD, MSGBOX_DEFAULT
	return

LilycoveCity_EventScript_14CF09:: @ 814CF09
	msgbox LilycoveCity_Text_167EAA, MSGBOX_DEFAULT
	return

LilycoveCity_EventScript_14CF12:: @ 814CF12
	msgbox LilycoveCity_Text_168149, MSGBOX_DEFAULT
	setvar VAR_RESULT, 0
	call_if_set FLAG_BADGE06_GET, LilycoveCity_EventScript_14CEDE
	compare VAR_RESULT, 0
	call_if_eq LilycoveCity_EventScript_14CF47
	compare VAR_RESULT, 1
	call_if_eq LilycoveCity_EventScript_14CF50
	clearflag FLAG_HIDE_BRENDAN_UPSTAIRS
	goto LilycoveCity_EventScript_14CF6B
	end

LilycoveCity_EventScript_14CF47:: @ 814CF47
	msgbox LilycoveCity_Text_1681EA, MSGBOX_DEFAULT
	return

LilycoveCity_EventScript_14CF50:: @ 814CF50
	goto_if_set FLAG_SYS_GAME_CLEAR, LilycoveCity_EventScript_14CF62
	msgbox LilycoveCity_Text_168282, MSGBOX_DEFAULT
	return

LilycoveCity_EventScript_14CF62:: @ 814CF62
	msgbox LilycoveCity_Text_16835A, MSGBOX_DEFAULT
	return

LilycoveCity_EventScript_14CF6B:: @ 814CF6B
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 50
	setfieldeffectargument 0, 1
	dofieldeffect FLDEFF_NPCFLY_OUT
	delay 15
	removeobject VAR_LAST_TALKED
	waitfieldeffect FLDEFF_NPCFLY_OUT
	savebgm 0
	fadedefaultbgm
	setflag FLAG_MET_RIVAL_LILYCOVE
	release
	end
