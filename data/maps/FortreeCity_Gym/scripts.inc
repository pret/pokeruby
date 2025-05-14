FortreeCity_Gym_MapScripts:: @ 8157ED3
	map_script MAP_SCRIPT_ON_TRANSITION, FortreeCity_Gym_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, FortreeCity_Gym_OnWarp
	.byte 0

FortreeCity_Gym_OnTransition:: @ 8157EDE
	special RotatingGate_InitPuzzle
	end

FortreeCity_Gym_OnWarp:: @ 8157EE2
	map_script_2 VAR_TEMP_0, 16384, FortreeCity_Gym_EventScript_InitRotatingGates
	.2byte 0

FortreeCity_Gym_EventScript_InitRotatingGates:: @ 8157EEC
	special RotatingGate_InitPuzzleAndGraphics
	end

FortreeCity_Gym_EventScript_Winona:: @ 8157EF0
	trainerbattle_single TRAINER_WINONA, FortreeCity_Gym_Text_WinonaIntro, FortreeCity_Gym_Text_WinonaDefeat, FortreeCity_Gym_EventScript_WinonaDefeated, NO_MUSIC
	goto_if_unset FLAG_RECEIVED_TM_AERIAL_ACE, FortreeCity_Gym_EventScript_GiveAerialAce2
	msgbox FortreeCity_Gym_Text_WinonaPostBattle, MSGBOX_DEFAULT
	release
	end

FortreeCity_Gym_EventScript_WinonaDefeated:: @ 8157F15
	message FortreeCity_Gym_Text_ReceivedFeatherBadge
	waitmessage
	call Common_EventScript_PlayGymBadgeFanfare
	msgbox FortreeCity_Gym_Text_ExplainFeatherBadgeTakeThis, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_FORTREE_GYM
	setflag FLAG_BADGE06_GET
	setvar VAR_0x8008, 6
	call Common_EventScript_SetGymTrainers
	goto FortreeCity_Gym_EventScript_GiveAerialAce2
	end

FortreeCity_Gym_EventScript_GiveAerialAce2:: @ 8157F3E
	giveitem ITEM_TM40_AERIAL_ACE
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	msgbox FortreeCity_Gym_Text_ExplainAerialAce, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_TM_AERIAL_ACE
	release
	end

FortreeCity_Gym_EventScript_Jared:: @ 8157F62
	trainerbattle_single TRAINER_JARED, FortreeCity_Gym_Text_JaredIntro, FortreeCity_Gym_Text_JaredDefeat
	msgbox FortreeCity_Gym_Text_JaredPostBattle, MSGBOX_AUTOCLOSE
	end

FortreeCity_Gym_EventScript_Will:: @ 8157F79
	trainerbattle_single TRAINER_WILL, FortreeCity_Gym_Text_WillIntro, FortreeCity_Gym_Text_WillDefeat
	msgbox FortreeCity_Gym_Text_WillPostBattle, MSGBOX_AUTOCLOSE
	end

FortreeCity_Gym_EventScript_Terrell:: @ 8157F90
	trainerbattle_single TRAINER_TERRELL, FortreeCity_Gym_Text_TerrellIntro, FortreeCity_Gym_Text_TerrellDefeat
	msgbox FortreeCity_Gym_Text_TerrellPostBattle, MSGBOX_AUTOCLOSE
	end

FortreeCity_Gym_EventScript_Kylee:: @ 8157FA7
	trainerbattle_single TRAINER_KYLEE, FortreeCity_Gym_Text_KyleeIntro, FortreeCity_Gym_Text_KyleeDefeat
	msgbox FortreeCity_Gym_Text_KyleePostBattle, MSGBOX_AUTOCLOSE
	end

FortreeCity_Gym_EventScript_GymGuide:: @ 8157FBE
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_FORTREE_GYM, FortreeCity_Gym_EventScript_GymGuidePostVictory
	msgbox FortreeCity_Gym_Text_GymGuideAdvice, MSGBOX_DEFAULT
	release
	end

FortreeCity_Gym_EventScript_GymGuidePostVictory:: @ 8157FD3
	msgbox FortreeCity_Gym_Text_GymGuidePostVictory, MSGBOX_DEFAULT
	release
	end

FortreeCity_Gym_EventScript_LeftGymStatue:: @ 8157FDD
	lockall
	goto_if_set FLAG_BADGE06_GET, FortreeCity_Gym_EventScript_GymStatueCertified
	goto FortreeCity_Gym_EventScript_GymStatue
	end

FortreeCity_Gym_EventScript_RightGymStatue:: @ 8157FED
	lockall
	goto_if_set FLAG_BADGE06_GET, FortreeCity_Gym_EventScript_GymStatueCertified
	goto FortreeCity_Gym_EventScript_GymStatue
	end

FortreeCity_Gym_EventScript_GymStatueCertified:: @ 8157FFD
	msgbox FortreeCity_Gym_Text_GymStatueCertified, MSGBOX_DEFAULT
	releaseall
	end

FortreeCity_Gym_EventScript_GymStatue:: @ 8158007
	msgbox FortreeCity_Gym_Text_GymStatue, MSGBOX_DEFAULT
	releaseall
	end
