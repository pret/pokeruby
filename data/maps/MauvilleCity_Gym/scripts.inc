MauvilleCity_Gym_MapScripts:: @ 8156450
	map_script MAP_SCRIPT_ON_LOAD, MauvilleCity_Gym_OnLoad
	.byte 0

MauvilleCity_Gym_OnLoad:: @ 8156456
	goto_if_set FLAG_DEFEATED_MAUVILLE_GYM, MauvilleCity_Gym_EventScript_DeactivatePuzzle
	switch VAR_MAUVILLE_GYM_STATE
	case 0, MauvilleCity_Gym_EventScript_UpdateBarriers
	case 1, MauvilleCity_Gym_EventScript_Switch1Pressed
	case 2, MauvilleCity_Gym_EventScript_Switch2Pressed
	case 3, MauvilleCity_Gym_EventScript_Switch3Pressed
	end

MauvilleCity_Gym_EventScript_UpdateBarriers:: @ 8156491
	goto_if_set FLAG_MAUVILLE_GYM_BARRIERS_STATE, MauvilleCity_Gym_EventScript_SetAltBarriers
	end

MauvilleCity_Gym_EventScript_SetAltBarriers:: @ 815649B
	setmetatile 4, 7, METATILE_MauvilleGym_GreenBeamH1_Off, 0
	setmetatile 4, 8, METATILE_MauvilleGym_GreenBeamH3_Off, 0
	setmetatile 5, 7, METATILE_MauvilleGym_GreenBeamH2_Off, 0
	setmetatile 5, 8, METATILE_MauvilleGym_GreenBeamH4_Off, 0
	setmetatile 3, 8, METATILE_MauvilleGym_PoleBottom_On, 1
	setmetatile 3, 9, METATILE_MauvilleGym_FloorTile, 0
	setmetatile 3, 10, METATILE_MauvilleGym_PoleTop_Off, 0
	setmetatile 1, 10, METATILE_MauvilleGym_RedBeamH1_On, 0
	setmetatile 1, 11, METATILE_MauvilleGym_RedBeamH3_On, 1
	setmetatile 2, 10, METATILE_MauvilleGym_RedBeamH2_On, 0
	setmetatile 2, 11, METATILE_MauvilleGym_RedBeamH4_On, 1
	setmetatile 4, 10, METATILE_MauvilleGym_RedBeamH1_On, 0
	setmetatile 4, 11, METATILE_MauvilleGym_RedBeamH3_On, 1
	setmetatile 5, 10, METATILE_MauvilleGym_RedBeamH2_On, 0
	setmetatile 5, 11, METATILE_MauvilleGym_RedBeamH4_On, 1
	setmetatile 6, 11, METATILE_MauvilleGym_PoleBottom_On, 1
	setmetatile 6, 12, METATILE_MauvilleGym_FloorTile, 0
	setmetatile 6, 13, METATILE_MauvilleGym_PoleTop_Off, 0
	setmetatile 3, 11, METATILE_MauvilleGym_RedBeamV1_On, 1
	setmetatile 3, 12, METATILE_MauvilleGym_RedBeamV2_On, 1
	setmetatile 3, 13, METATILE_MauvilleGym_PoleTop_On, 1
	setmetatile 4, 13, METATILE_MauvilleGym_GreenBeamH1_Off, 0
	setmetatile 4, 14, METATILE_MauvilleGym_GreenBeamH3_Off, 0
	setmetatile 5, 13, METATILE_MauvilleGym_GreenBeamH2_Off, 0
	setmetatile 5, 14, METATILE_MauvilleGym_GreenBeamH4_Off, 0
	end

MauvilleCity_Gym_EventScript_Switch1Pressed:: @ 815657D
	setvar VAR_0x8004, 0
	special MauvilleGymSpecial1
	goto MauvilleCity_Gym_EventScript_UpdateBarriers
	end

MauvilleCity_Gym_EventScript_Switch2Pressed:: @ 815658B
	setvar VAR_0x8004, 1
	special MauvilleGymSpecial1
	goto MauvilleCity_Gym_EventScript_UpdateBarriers
	end

MauvilleCity_Gym_EventScript_Switch3Pressed:: @ 8156599
	setvar VAR_0x8004, 2
	special MauvilleGymSpecial1
	goto MauvilleCity_Gym_EventScript_UpdateBarriers
	end

MauvilleCity_Gym_EventScript_DeactivatePuzzle:: @ 81565A7
	special MauvilleGymSpecial3
	end

MauvilleCity_Gym_EventScript_Wattson:: @ 81565AB
	trainerbattle_single TRAINER_WATTSON, MauvilleCity_Gym_Text_WattsonIntro, MauvilleCity_Gym_Text_WattsonDefeat, MauvilleCity_Gym_EventScript_WattsonDefeated, NO_MUSIC
	goto_if_unset FLAG_RECEIVED_TM_SHOCK_WAVE, MauvilleCity_Gym_EventScript_GiveShockWave
	compare VAR_NEW_MAUVILLE_STATE, 2
	goto_if_eq MauvilleCity_Gym_EventScript_CompletedNewMauville
	msgbox MauvilleCity_Gym_Text_WattsonPostBattle, MSGBOX_DEFAULT
	release
	end

MauvilleCity_Gym_EventScript_WattsonDefeated:: @ 81565DB
	message MauvilleCity_Gym_Text_ReceivedDynamoBadge
	waitmessage
	call Common_EventScript_PlayGymBadgeFanfare
	msgbox MauvilleCity_Gym_Text_ExplainDynamoBadgeTakeThis, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_MAUVILLE_GYM
	setflag FLAG_BADGE03_GET
	addvar VAR_PETALBURG_GYM_STATE, 1
	compare VAR_PETALBURG_GYM_STATE, 6
	call_if_eq Common_EventScript_ReadyPetalburgGymForBattle
	setvar VAR_0x8008, 3
	call Common_EventScript_SetGymTrainers
	special MauvilleGymSpecial3
	special DrawWholeMapView
	playse SE_UNLOCK
	goto MauvilleCity_Gym_EventScript_GiveShockWave
	end

MauvilleCity_Gym_EventScript_GiveShockWave:: @ 815661D
	giveitem ITEM_TM34_SHOCK_WAVE
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	msgbox MauvilleCity_Gym_Text_ExplainShockWave, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_TM_SHOCK_WAVE
	release
	end

MauvilleCity_Gym_EventScript_CompletedNewMauville:: @ 8156641
	msgbox MauvilleCity_Gym_Text_WattsonGoForthAndEndeavor, MSGBOX_DEFAULT
	release
	end

MauvilleCity_Gym_EventScript_Switch1:: @ 815664B
	lockall
	goto_if_set FLAG_DEFEATED_MAUVILLE_GYM, MauvilleCity_Gym_EventScript_SwitchDoNothing
	compare VAR_MAUVILLE_GYM_STATE, 1
	goto_if_eq MauvilleCity_Gym_EventScript_SwitchDoNothing
	setvar VAR_MAUVILLE_GYM_STATE, 1
	setvar VAR_0x8004, 0
	goto MauvilleCity_Gym_EventScript_PressFloorSwitch
	end

MauvilleCity_Gym_EventScript_Switch2:: @ 8156670
	lockall
	goto_if_set FLAG_DEFEATED_MAUVILLE_GYM, MauvilleCity_Gym_EventScript_SwitchDoNothing
	compare VAR_MAUVILLE_GYM_STATE, 2
	goto_if_eq MauvilleCity_Gym_EventScript_SwitchDoNothing
	setvar VAR_MAUVILLE_GYM_STATE, 2
	setvar VAR_0x8004, 1
	goto MauvilleCity_Gym_EventScript_PressFloorSwitch
	end

MauvilleCity_Gym_EventScript_Switch3:: @ 8156695
	lockall
	goto_if_set FLAG_DEFEATED_MAUVILLE_GYM, MauvilleCity_Gym_EventScript_SwitchDoNothing
	compare VAR_MAUVILLE_GYM_STATE, 3
	goto_if_eq MauvilleCity_Gym_EventScript_SwitchDoNothing
	setvar VAR_MAUVILLE_GYM_STATE, 3
	setvar VAR_0x8004, 2
	goto MauvilleCity_Gym_EventScript_PressFloorSwitch
	end

MauvilleCity_Gym_EventScript_PressFloorSwitch:: @ 81566BA
	special MauvilleGymSpecial2
	special MauvilleGymSpecial1
	special DrawWholeMapView
	playse SE_UNLOCK
	goto_if_set FLAG_MAUVILLE_GYM_BARRIERS_STATE, MauvilleCity_Gym_EventScript_ClearBarriersAltState
	goto_if_unset FLAG_MAUVILLE_GYM_BARRIERS_STATE, MauvilleCity_Gym_EventScript_SetBarriersAltState
	releaseall
	end

MauvilleCity_Gym_EventScript_SwitchDoNothing:: @ 81566DA
	releaseall
	end

MauvilleCity_Gym_EventScript_SetBarriersAltState:: @ 81566DC
	setflag FLAG_MAUVILLE_GYM_BARRIERS_STATE
	releaseall
	end

MauvilleCity_Gym_EventScript_ClearBarriersAltState:: @ 81566E1
	clearflag FLAG_MAUVILLE_GYM_BARRIERS_STATE
	releaseall
	end

MauvilleCity_Gym_EventScript_Kirk:: @ 81566E6
	trainerbattle_single TRAINER_KIRK, MauvilleCity_Gym_Text_KirkIntro, MauvilleCity_Gym_Text_KirkDefeat
	msgbox MauvilleCity_Gym_Text_KirkPostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_Shawn:: @ 81566FD
	trainerbattle_single TRAINER_SHAWN, MauvilleCity_Gym_Text_ShawnIntro, MauvilleCity_Gym_Text_ShawnDefeat
	msgbox MauvilleCity_Gym_Text_ShawnPostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_Ben:: @ 8156714
	trainerbattle_single TRAINER_BEN, MauvilleCity_Gym_Text_BenIntro, MauvilleCity_Gym_Text_BenDefeat
	msgbox MauvilleCity_Gym_Text_BenPostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_Vivian:: @ 815672B
	trainerbattle_single TRAINER_VIVIAN, MauvilleCity_Gym_Text_VivianIntro, MauvilleCity_Gym_Text_VivianDefeat
	msgbox MauvilleCity_Gym_Text_VivianPostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_GymGuide:: @ 8156742
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_MAUVILLE_GYM, MauvilleCity_Gym_EventScript_GymGuidePostVictory
	msgbox MauvilleCity_Gym_Text_GymGuideAdvice, MSGBOX_DEFAULT
	release
	end

MauvilleCity_Gym_EventScript_GymGuidePostVictory:: @ 8156757
	msgbox MauvilleCity_Gym_Text_GymGuidePostVictory, MSGBOX_DEFAULT
	release
	end

MauvilleCity_Gym_EventScript_LeftGymStatue:: @ 8156761
	lockall
	goto_if_set FLAG_BADGE03_GET, MauvilleCity_Gym_EventScript_GymStatueCertified
	goto MauvilleCity_Gym_EventScript_GymStatue
	end

MauvilleCity_Gym_EventScript_RightGymStatue:: @ 8156771
	lockall
	goto_if_set FLAG_BADGE03_GET, MauvilleCity_Gym_EventScript_GymStatueCertified
	goto MauvilleCity_Gym_EventScript_GymStatue
	end

MauvilleCity_Gym_EventScript_GymStatueCertified:: @ 8156781
	msgbox MauvilleCity_Gym_Text_GymStatueCertified, MSGBOX_DEFAULT
	releaseall
	end

MauvilleCity_Gym_EventScript_GymStatue:: @ 815678B
	msgbox MauvilleCity_Gym_Text_GymStatue, MSGBOX_DEFAULT
	releaseall
	end
