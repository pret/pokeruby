MossdeepCity_Gym_MapScripts:: @ 815A4D3
	map_script MAP_SCRIPT_ON_LOAD, MossdeepCity_Gym_OnLoad
	.byte 0

MossdeepCity_Gym_OnLoad:: @ 815A4D9
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_1, MossdeepCity_Gym_EventScript_SetSwitch1Metatiles
	goto MossdeepCity_Gym_EventScript_CheckSwitch2
	end

MossdeepCity_Gym_EventScript_CheckSwitch2:: @ 815A4E8
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_2, MossdeepCity_Gym_EventScript_SetSwitch2Metatiles
	goto MossdeepCity_Gym_EventScript_CheckSwitch3
	end

MossdeepCity_Gym_EventScript_CheckSwitch3:: @ 815A4F7
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_3, MossdeepCity_Gym_EventScript_SetSwitch3Metatiles
	goto MossdeepCity_Gym_EventScript_CheckSwitch4
	end

MossdeepCity_Gym_EventScript_CheckSwitch4:: @ 815A506
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_4, MossdeepCity_Gym_EventScript_SetSwitch4Metatiles
	end

MossdeepCity_Gym_EventScript_SetSwitch1Metatiles:: @ 815A510
	setmetatile 5, 5, METATILE_MossdeepGym_RedArrow_Right, 0
	setmetatile 2, 7, METATILE_MossdeepGym_Switch_Down, 1
	goto MossdeepCity_Gym_EventScript_CheckSwitch2
	end

MossdeepCity_Gym_EventScript_SetSwitch2Metatiles:: @ 815A528
	setmetatile 8, 14, METATILE_MossdeepGym_RedArrow_Right, 0
	setmetatile 8, 10, METATILE_MossdeepGym_Switch_Down, 1
	goto MossdeepCity_Gym_EventScript_CheckSwitch3
	end

MossdeepCity_Gym_EventScript_SetSwitch3Metatiles:: @ 815A540
	setmetatile 15, 17, METATILE_MossdeepGym_RedArrow_Left, 0
	setmetatile 17, 15, METATILE_MossdeepGym_Switch_Down, 1
	goto MossdeepCity_Gym_EventScript_CheckSwitch4
	end

MossdeepCity_Gym_EventScript_SetSwitch4Metatiles:: @ 815A558
	setmetatile 1, 23, METATILE_MossdeepGym_RedArrow_Up, 0
	setmetatile 5, 24, METATILE_MossdeepGym_Switch_Down, 1
	end

MossdeepCity_Gym_EventScript_TateAndLiza:: @ 815A56B
	trainerbattle_double TRAINER_TATE_AND_LIZA, MossdeepCity_Gym_Text_TateAndLizaIntro, MossdeepCity_Gym_Text_TateAndLizaDefeat, MossdeepCity_Gym_Text_TateAndLizaNeedTwoMons, MossdeepCity_Gym_EventScript_TateAndLizaDefeated, NO_MUSIC
	goto_if_unset FLAG_RECEIVED_TM_CALM_MIND, MossdeepCity_Gym_EventScript_GiveCalmMind2
	msgbox MossdeepCity_Gym_Text_TateAndLizaPostBattle, MSGBOX_DEFAULT
	release
	end

MossdeepCity_Gym_EventScript_TateAndLizaDefeated:: @ 815A594
	message MossdeepCity_Gym_Text_ReceivedMindBadge
	waitmessage
	call Common_EventScript_PlayGymBadgeFanfare
	msgbox MossdeepCity_Gym_Text_ExplainMindBadgeTakeThis, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_MOSSDEEP_GYM
	setflag FLAG_BADGE07_GET
	clearflag FLAG_HIDE_BRINEY_SLATEPORT_SHIPYARD
	clearflag FLAG_UNKNOWN_393
	setvar VAR_0x8008, 7
	call Common_EventScript_SetGymTrainers
	clearflag FLAG_HIDE_WORKERS_SLATEPORT_HARBOR
	goto MossdeepCity_Gym_EventScript_GiveCalmMind2
	end

MossdeepCity_Gym_EventScript_GiveCalmMind2:: @ 815A5C6
	giveitem ITEM_TM04_CALM_MIND
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	msgbox MossdeepCity_Gym_Text_ExplainCalmMind, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_TM_CALM_MIND
	release
	end

MossdeepCity_Gym_EventScript_Switch1:: @ 815A5EA
	lockall
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_1, MossdeepCity_Gym_EventScript_ClearSwitch1
	setflag FLAG_MOSSDEEP_GYM_SWITCH_1
	applymovement LOCALID_PLAYER, MossdeepCity_Gym_Movement_WaitAfterSwitchUse
	waitmovement 0
	setmetatile 5, 5, METATILE_MossdeepGym_RedArrow_Right, 0
	setmetatile 2, 7, METATILE_MossdeepGym_Switch_Down, 1
	goto MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed
	end

MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed:: @ 815A619
	special DrawWholeMapView
	playse SE_CLICK
	releaseall
	end

MossdeepCity_Gym_EventScript_ClearSwitch1:: @ 815A621
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_1
	applymovement LOCALID_PLAYER, MossdeepCity_Gym_Movement_WaitAfterSwitchUse
	waitmovement 0
	setmetatile 5, 5, METATILE_MossdeepGym_RedArrow_Left, 0
	setmetatile 2, 7, METATILE_MossdeepGym_Switch_Up, 1
	goto MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed
	end

MossdeepCity_Gym_EventScript_Switch2:: @ 815A646
	lockall
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_2, MossdeepCity_Gym_EventScript_ClearSwitch2
	setflag FLAG_MOSSDEEP_GYM_SWITCH_2
	applymovement LOCALID_PLAYER, MossdeepCity_Gym_Movement_WaitAfterSwitchUse
	waitmovement 0
	setmetatile 8, 14, METATILE_MossdeepGym_RedArrow_Right, 0
	setmetatile 8, 10, METATILE_MossdeepGym_Switch_Down, 1
	goto MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed
	end

MossdeepCity_Gym_EventScript_ClearSwitch2:: @ 815A675
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_2
	applymovement LOCALID_PLAYER, MossdeepCity_Gym_Movement_WaitAfterSwitchUse
	waitmovement 0
	setmetatile 8, 14, METATILE_MossdeepGym_RedArrow_Down, 0
	setmetatile 8, 10, METATILE_MossdeepGym_Switch_Up, 1
	goto MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed
	end

MossdeepCity_Gym_EventScript_Switch3:: @ 815A69A
	lockall
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_3, MossdeepCity_Gym_EventScript_ClearSwitch3
	setflag FLAG_MOSSDEEP_GYM_SWITCH_3
	applymovement LOCALID_PLAYER, MossdeepCity_Gym_Movement_WaitAfterSwitchUse
	waitmovement 0
	setmetatile 15, 17, METATILE_MossdeepGym_RedArrow_Left, 0
	setmetatile 17, 15, METATILE_MossdeepGym_Switch_Down, 1
	goto MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed
	end

MossdeepCity_Gym_EventScript_ClearSwitch3:: @ 815A6C9
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_3
	applymovement LOCALID_PLAYER, MossdeepCity_Gym_Movement_WaitAfterSwitchUse
	waitmovement 0
	setmetatile 15, 17, METATILE_MossdeepGym_RedArrow_Right, 0
	setmetatile 17, 15, METATILE_MossdeepGym_Switch_Up, 1
	goto MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed
	end

MossdeepCity_Gym_EventScript_Switch4:: @ 815A6EE
	lockall
	goto_if_set FLAG_MOSSDEEP_GYM_SWITCH_4, MossdeepCity_Gym_EventScript_ClearSwitch4
	setflag FLAG_MOSSDEEP_GYM_SWITCH_4
	applymovement LOCALID_PLAYER, MossdeepCity_Gym_Movement_WaitAfterSwitchUse
	waitmovement 0
	setmetatile 1, 23, METATILE_MossdeepGym_RedArrow_Up, 0
	setmetatile 5, 24, METATILE_MossdeepGym_Switch_Down, 1
	goto MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed
	end

MossdeepCity_Gym_EventScript_ClearSwitch4:: @ 815A71D
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_4
	applymovement LOCALID_PLAYER, MossdeepCity_Gym_Movement_WaitAfterSwitchUse
	waitmovement 0
	setmetatile 1, 23, METATILE_MossdeepGym_RedArrow_Right, 0
	setmetatile 5, 24, METATILE_MossdeepGym_Switch_Up, 1
	goto MossdeepCity_Gym_EventScript_DrawMapAfterSwitchUsed
	end

MossdeepCity_Gym_EventScript_WarpToEntrance:: @ 815A742
	lockall
	warpteleport MAP_MOSSDEEP_CITY_GYM, 255, 14, 29
	waitstate
	releaseall
	end

MossdeepCity_Gym_EventScript_Preston:: @ 815A74E
	trainerbattle_single TRAINER_PRESTON, MossdeepCity_Gym_Text_PrestonIntro, MossdeepCity_Gym_Text_PrestonDefeat
	msgbox MossdeepCity_Gym_Text_PrestonPostBattle, MSGBOX_AUTOCLOSE
	end

MossdeepCity_Gym_EventScript_Virgil:: @ 815A765
	trainerbattle_single TRAINER_VIRGIL, MossdeepCity_Gym_Text_VirgilIntro, MossdeepCity_Gym_Text_VirgilDefeat
	msgbox MossdeepCity_Gym_Text_VirgilPostBattle, MSGBOX_AUTOCLOSE
	end

MossdeepCity_Gym_EventScript_Fritz:: @ 815A77C
	trainerbattle_single TRAINER_FRITZ, MossdeepCity_Gym_Text_FritzIntro, MossdeepCity_Gym_Text_FritzDefeat
	msgbox MossdeepCity_Gym_Text_FritzPostBattle, MSGBOX_AUTOCLOSE
	end

MossdeepCity_Gym_EventScript_Hannah:: @ 815A793
	trainerbattle_single TRAINER_HANNAH, MossdeepCity_Gym_Text_HannahIntro, MossdeepCity_Gym_Text_HannahDefeat
	msgbox MossdeepCity_Gym_Text_HannahPostBattle, MSGBOX_AUTOCLOSE
	end

MossdeepCity_Gym_EventScript_Samantha:: @ 815A7AA
	trainerbattle_single TRAINER_SAMANTHA, MossdeepCity_Gym_Text_SamanthaIntro, MossdeepCity_Gym_Text_SamanthaDefeat
	msgbox MossdeepCity_Gym_Text_SamanthaPostBattle, MSGBOX_AUTOCLOSE
	end

MossdeepCity_Gym_EventScript_Maura:: @ 815A7C1
	trainerbattle_single TRAINER_MAURA, MossdeepCity_Gym_Text_MauraIntro, MossdeepCity_Gym_Text_MauraDefeat
	msgbox MossdeepCity_Gym_Text_MauraPostBattle, MSGBOX_AUTOCLOSE
	end

MossdeepCity_Gym_EventScript_GymGuide:: @ 815A7D8
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_MOSSDEEP_GYM, MossdeepCity_Gym_EventScript_GymGuidePostVictory
	msgbox MossdeepCity_Gym_Text_GymGuideAdvice, MSGBOX_DEFAULT
	release
	end

MossdeepCity_Gym_EventScript_GymGuidePostVictory:: @ 815A7ED
	msgbox MossdeepCity_Gym_Text_GymGuidePostVictory, MSGBOX_DEFAULT
	release
	end

MossdeepCity_Gym_Movement_WaitAfterSwitchUse:: @ 815A7F7
	delay_16
	delay_16
	step_end

MossdeepCity_Gym_EventScript_LeftGymStatue:: @ 815A7FA
	lockall
	goto_if_set FLAG_BADGE07_GET, MossdeepCity_Gym_EventScript_GymStatueCertified
	goto MossdeepCity_Gym_EventScript_GymStatue
	end

MossdeepCity_Gym_EventScript_RightGymStatue:: @ 815A80A
	lockall
	goto_if_set FLAG_BADGE07_GET, MossdeepCity_Gym_EventScript_GymStatueCertified
	goto MossdeepCity_Gym_EventScript_GymStatue
	end

MossdeepCity_Gym_EventScript_GymStatueCertified:: @ 815A81A
	msgbox MossdeepCity_Gym_Text_GymStatueCertified, MSGBOX_DEFAULT
	releaseall
	end

MossdeepCity_Gym_EventScript_GymStatue:: @ 815A824
	msgbox MossdeepCity_Gym_Text_GymStatue, MSGBOX_DEFAULT
	releaseall
	end
