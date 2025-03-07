DewfordTown_Gym_MapScripts:: @ 8153065
	map_script MAP_SCRIPT_ON_TRANSITION, DewfordTown_Gym_OnTransition
	.byte 0

DewfordTown_Gym_OnTransition:: @ 815306B
	call DewfordTown_Gym_EventScript_SetFlashLevel
	end

DewfordTown_Gym_EventScript_SetFlashLevel:: @ 8153071
	goto_if_defeated TRAINER_BRAWLY, DewfordTown_Gym_EventScript_SetLightsOn
	call DewfordTown_Gym_EventScript_CheckHideki
	copyvar VAR_0x8001, VAR_0x8000
	compare VAR_0x8000, 0
	goto_if_eq DewfordTown_Gym_EventScript_SetFlashLevel4
	compare VAR_0x8000, 1
	goto_if_eq DewfordTown_Gym_EventScript_SetFlashLevel3
	compare VAR_0x8000, 2
	goto_if_eq DewfordTown_Gym_EventScript_SetFlashLevel2
	goto DewfordTown_Gym_EventScript_SetFlashLevel1

DewfordTown_Gym_EventScript_SetLightsOn:: @ 81530AA
	setflashradius 0
	return

DewfordTown_Gym_EventScript_SetFlashLevel1:: @ 81530AE
	setflashradius 1
	return

DewfordTown_Gym_EventScript_SetFlashLevel2:: @ 81530B2
	setflashradius 2
	return

DewfordTown_Gym_EventScript_SetFlashLevel3:: @ 81530B6
	setflashradius 3
	return

DewfordTown_Gym_EventScript_SetFlashLevel4:: @ 81530BA
	setflashradius 4
	return

DewfordTown_Gym_EventScript_BrightenRoom:: @ 81530BE
	call DewfordTown_Gym_EventScript_CheckHideki
	nop1
	compare VAR_0x8000, VAR_0x8001
	goto_if_eq DewfordTown_Gym_EventScript_NoLightChange
	copyvar VAR_0x8001, VAR_0x8000
	compare VAR_0x8000, 1
	goto_if_eq DewfordTown_Gym_EventScript_AnimateFlash1Trainers
	compare VAR_0x8000, 2
	goto_if_eq DewfordTown_Gym_EventScript_AnimateFlash2Trainers
	compare VAR_0x8000, 3
	goto_if_eq DewfordTown_Gym_EventScript_AnimateFlash3Trainers

DewfordTown_Gym_EventScript_NoLightChange:: @ 81530F5
	return

DewfordTown_Gym_EventScript_AnimateFlash1Trainers:: @ 81530F6
	playse SE_SWITCH
	animateflash 3
	call DewfordTown_Gym_EventScript_SetFlashLevel
	return

DewfordTown_Gym_EventScript_AnimateFlash2Trainers:: @ 8153101
	playse SE_SWITCH
	animateflash 2
	call DewfordTown_Gym_EventScript_SetFlashLevel
	return

DewfordTown_Gym_EventScript_AnimateFlash3Trainers:: @ 815310C
	playse SE_SWITCH
	animateflash 1
	call DewfordTown_Gym_EventScript_SetFlashLevel
	return

DewfordTown_Gym_EventScript_AnimateFlashFullBrightness:: @ 8153117
	playse SE_SWITCH
	animateflash 0
	call DewfordTown_Gym_EventScript_SetFlashLevel
	return

DewfordTown_Gym_EventScript_CheckHideki:: @ 8153122
	setvar VAR_0x8000, 0
	goto_if_not_defeated TRAINER_HIDEKI, DewfordTown_Gym_EventScript_CheckTessa
	addvar VAR_0x8000, 1

DewfordTown_Gym_EventScript_CheckTessa:: @ 8153135
	goto_if_not_defeated TRAINER_TESSA, DewfordTown_Gym_EventScript_CheckLaura
	addvar VAR_0x8000, 1

DewfordTown_Gym_EventScript_CheckLaura:: @ 8153143
	goto_if_not_defeated TRAINER_LAURA, DewfordTown_Gym_EventScript_StopCountingTrainers
	addvar VAR_0x8000, 1

DewfordTown_Gym_EventScript_StopCountingTrainers:: @ 8153151
	return

DewfordTown_Gym_EventScript_Brawly:: @ 8153152
	trainerbattle_single TRAINER_BRAWLY, DewfordTown_Gym_Text_BrawlyIntro, DewfordTown_Gym_Text_BrawlyDefeat, DewfordTown_Gym_EventScript_BrawlyDefeated, NO_MUSIC
	goto_if_unset FLAG_RECEIVED_TM_BULK_UP, DewfordTown_Gym_EventScript_GiveBulkUp
	msgbox DewfordTown_Gym_Text_BrawlyPostBattle, MSGBOX_DEFAULT
	release
	end

DewfordTown_Gym_EventScript_BrawlyDefeated:: @ 8153177
	call DewfordTown_Gym_EventScript_AnimateFlashFullBrightness
	message DewfordTown_Gym_Text_ReceivedKnuckleBadge
	waitmessage
	call Common_EventScript_PlayGymBadgeFanfare
	msgbox DewfordTown_Gym_Text_KnuckleBadgeInfoTakeThis, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_DEWFORD_GYM
	setflag FLAG_BADGE02_GET
	addvar VAR_PETALBURG_GYM_STATE, 1
	compare VAR_PETALBURG_GYM_STATE, 6
	call_if_eq Common_EventScript_ReadyPetalburgGymForBattle
	setvar VAR_0x8008, 2
	call Common_EventScript_SetGymTrainers
	goto DewfordTown_Gym_EventScript_GiveBulkUp
	end

DewfordTown_Gym_EventScript_GiveBulkUp:: @ 81531B5
	giveitem ITEM_TM08_BULK_UP
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	msgbox DewfordTown_Gym_Text_ExplainBulkUp, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_TM_BULK_UP
	release
	end

DewfordTown_Gym_EventScript_Hideki:: @ 81531D9
	trainerbattle_single TRAINER_HIDEKI, DewfordTown_Gym_Text_HidekiIntro, DewfordTown_Gym_Text_HidekiDefeat, DewfordTown_Gym_EventScript_HidekiBrightenRoom
	msgbox DewfordTown_Gym_Text_HidekiPostBattle, MSGBOX_AUTOCLOSE
	end

DewfordTown_Gym_EventScript_HidekiBrightenRoom:: @ 81531F4
	call DewfordTown_Gym_EventScript_BrightenRoom
	release
	end

DewfordTown_Gym_EventScript_Tessa:: @ 81531FB
	trainerbattle_single TRAINER_TESSA, DewfordTown_Gym_Text_TessaIntro, DewfordTown_Gym_Text_TessaDefeat, DewfordTown_Gym_EventScript_TessaBrightenRoom
	msgbox DewfordTown_Gym_Text_TessaPostBattle, MSGBOX_AUTOCLOSE
	end

DewfordTown_Gym_EventScript_TessaBrightenRoom:: @ 8153216
	call DewfordTown_Gym_EventScript_BrightenRoom
	release
	end

DewfordTown_Gym_EventScript_Laura:: @ 815321D
	trainerbattle_single TRAINER_LAURA, DewfordTown_Gym_Text_LauraIntro, DewfordTown_Gym_Text_LauraDefeat, DewfordTown_Gym_EventScript_LauraBrightenRoom
	msgbox DewfordTown_Gym_Text_LauraPostBattle, MSGBOX_AUTOCLOSE
	end

DewfordTown_Gym_EventScript_LauraBrightenRoom:: @ 8153238
	call DewfordTown_Gym_EventScript_BrightenRoom
	release
	end

DewfordTown_Gym_EventScript_GymGuide:: @ 815323F
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_DEWFORD_GYM, DewfordTown_Gym_EventScript_GymGuidePostVictory
	msgbox DewfordTown_Gym_Text_GymGuideAdvice, MSGBOX_DEFAULT
	release
	end

DewfordTown_Gym_EventScript_GymGuidePostVictory:: @ 8153254
	msgbox DewfordTown_Gym_Text_GymGuidePostVictory, MSGBOX_DEFAULT
	release
	end

DewfordTown_Gym_EventScript_LeftGymStatue:: @ 815325E
	lockall
	goto_if_set FLAG_BADGE02_GET, DewfordTown_Gym_EventScript_GymStatueCertified
	goto DewfordTown_Gym_EventScript_GymStatue
	end

DewfordTown_Gym_EventScript_RightGymStatue:: @ 815326E
	lockall
	goto_if_set FLAG_BADGE02_GET, DewfordTown_Gym_EventScript_GymStatueCertified
	goto DewfordTown_Gym_EventScript_GymStatue
	end

DewfordTown_Gym_EventScript_GymStatueCertified:: @ 815327E
	msgbox DewfordTown_Gym_Text_GymStatueCertified, MSGBOX_DEFAULT
	releaseall
	end

DewfordTown_Gym_EventScript_GymStatue:: @ 8153288
	msgbox DewfordTown_Gym_Text_GymStatue, MSGBOX_DEFAULT
	releaseall
	end
