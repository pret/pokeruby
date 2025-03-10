EverGrandeCity_ChampionsRoom_MapScripts:: @ 815B7AF
	map_script MAP_SCRIPT_ON_TRANSITION, EverGrandeCity_ChampionsRoom_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, EverGrandeCity_ChampionsRoom_OnWarp
	map_script MAP_SCRIPT_ON_FRAME_TABLE, EverGrandeCity_ChampionsRoom_OnFrame
	.byte 0

EverGrandeCity_ChampionsRoom_OnTransition:: @ 815B7BF
	call Common_EventScript_SetupRivalGfxId
	end

EverGrandeCity_ChampionsRoom_OnWarp:: @ 815B7C5
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_ChampionsRoom_EventScript_PlayerTurnNorth
	.2byte 0

EverGrandeCity_ChampionsRoom_EventScript_PlayerTurnNorth:: @ 815B7CF
	turnobject OBJ_EVENT_ID_PLAYER, 2
	end

EverGrandeCity_ChampionsRoom_OnFrame:: @ 815B7D4
	map_script_2 VAR_TEMP_1, 0, EverGrandeCity_ChampionsRoom_EventScript_EnterRoom
	.2byte 0

EverGrandeCity_ChampionsRoom_EventScript_EnterRoom:: @ 815B7DE
	lockall
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkUp4
	waitmovement 0
	delay 40
	applymovement OBJ_EVENT_ID_PLAYER, EverGrandeCity_ChampionsRoom_Movement_PlayerApproachSteven
	waitmovement 0
	setvar VAR_TEMP_1, 1
	goto EverGrandeCity_ChampionsRoom_EventScript_Steven
	releaseall
	end

EverGrandeCity_ChampionsRoom_Movement_PlayerApproachSteven:: @ 815B802
	walk_up
	walk_up
	step_end

EverGrandeCity_ChampionsRoom_EventScript_Steven:: @ 815B805
	playbgm MUS_ENCOUNTER_CHAMPION, FALSE
	msgbox EverGrandeCity_ChampionsRoom_Text_IntroSpeech, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_STEVEN, EverGrandeCity_ChampionsRoom_Text_Defeat
	goto EverGrandeCity_ChampionsRoom_EventScript_Defeated
	end

EverGrandeCity_ChampionsRoom_EventScript_Defeated:: @ 815B821
	playse SE_DOOR
	setmetatile 6, 1, METATILE_EliteFour_OpenDoorChampion_Frame, 0
	setmetatile 6, 2, METATILE_EliteFour_OpenDoorChampion_Opening, 0
	special DrawWholeMapView
	msgbox EverGrandeCity_ChampionsRoom_Text_PostBattleSpeech, MSGBOX_DEFAULT
	closemessage
	playse SE_DOOR
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq EverGrandeCity_ChampionsRoom_EventScript_PlayMayMusic
	compare VAR_RESULT, 1
	call_if_eq EverGrandeCity_ChampionsRoom_EventScript_PlayBrendanMusic
	addobject 2
	call EverGrandeCity_ChampionsRoom_EventScript_RivalApproachPlayer
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq EverGrandeCity_ChampionsRoom_EventScript_MayAdvice
	compare VAR_RESULT, 1
	goto_if_eq EverGrandeCity_ChampionsRoom_EventScript_BrendanAdvice
	end

EverGrandeCity_ChampionsRoom_EventScript_PlayMayMusic:: @ 815B87C
	playbgm MUS_ENCOUNTER_MAY, FALSE
	return

EverGrandeCity_ChampionsRoom_EventScript_PlayBrendanMusic:: @ 815B881
	playbgm MUS_ENCOUNTER_BRENDAN, FALSE
	return

EverGrandeCity_ChampionsRoom_EventScript_MayAdvice:: @ 815B886
	msgbox EverGrandeCity_ChampionsRoom_Text_MayAdvice, MSGBOX_DEFAULT
	delay 40
	playse SE_PIN
	applymovement 2, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 2, Common_Movement_Delay48
	waitmovement 0
	call EverGrandeCity_ChampionsRoom_EventScript_RivalLookBackAndForth
	msgbox EverGrandeCity_ChampionsRoom_Text_MayItsAlreadyOver, MSGBOX_DEFAULT
	goto EverGrandeCity_ChampionsRoom_EventScript_BirchArrivesExitForHoF
	end

EverGrandeCity_ChampionsRoom_EventScript_BrendanAdvice:: @ 815B8BB
	msgbox EverGrandeCity_ChampionsRoom_Text_BrendanAdvice, MSGBOX_DEFAULT
	delay 40
	playse SE_PIN
	applymovement 2, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 2, Common_Movement_Delay48
	waitmovement 0
	call EverGrandeCity_ChampionsRoom_EventScript_RivalLookBackAndForth
	msgbox EverGrandeCity_ChampionsRoom_Text_BrendanYouveWon, MSGBOX_DEFAULT
	goto EverGrandeCity_ChampionsRoom_EventScript_BirchArrivesExitForHoF
	end

EverGrandeCity_ChampionsRoom_EventScript_BirchArrivesExitForHoF:: @ 815B8F0
	closemessage
	addobject 3
	applymovement 3, EverGrandeCity_ChampionsRoom_Movement_BirchArrives
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox EverGrandeCity_ChampionsRoom_Text_BirchArriveRatePokedex, MSGBOX_DEFAULT
	call ProfBirch_EventScript_RatePokedex
	msgbox EverGrandeCity_ChampionsRoom_Text_BirchCongratulations, MSGBOX_DEFAULT
	applymovement 1, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	delay 20
	applymovement 1, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox EverGrandeCity_ChampionsRoom_Text_StevenComeWithMe, MSGBOX_DEFAULT
	closemessage
	delay 30
	applymovement 1, EverGrandeCity_ChampionsRoom_Movement_StevenExitStart
	applymovement OBJ_EVENT_ID_PLAYER, EverGrandeCity_ChampionsRoom_Movement_PlayerExitStart
	applymovement 3, Common_Movement_WalkInPlaceFastestUp
	applymovement 2, EverGrandeCity_ChampionsRoom_Movement_RivalFollows
	waitmovement 0
	delay 20
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox EverGrandeCity_ChampionsRoom_Text_StevenWaitOutside, MSGBOX_DEFAULT
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq EverGrandeCity_ChampionsRoom_EventScript_MayCongratulations
	compare VAR_RESULT, 1
	call_if_eq EverGrandeCity_ChampionsRoom_EventScript_BrendanCongratulations
	closemessage
	applymovement 1, EverGrandeCity_ChampionsRoom_Movement_StevenExit
	applymovement OBJ_EVENT_ID_PLAYER, EverGrandeCity_ChampionsRoom_Movement_PlayerExit
	waitmovement 0
	setflag FLAG_HIDE_PETALBURG_GYM_GUIDE
	warp MAP_EVER_GRANDE_CITY_HALL_OF_FAME, 255, 7, 16
	waitstate
	releaseall
	end

EverGrandeCity_ChampionsRoom_EventScript_MayCongratulations:: @ 815B9AB
	msgbox EverGrandeCity_ChampionsRoom_Text_MayCongratulations, MSGBOX_DEFAULT
	return

EverGrandeCity_ChampionsRoom_EventScript_BrendanCongratulations:: @ 815B9B4
	msgbox EverGrandeCity_ChampionsRoom_Text_BrendanCongratulations, MSGBOX_DEFAULT
	return

EverGrandeCity_ChampionsRoom_EventScript_RivalApproachPlayer:: @ 815B9BD
	applymovement 2, EverGrandeCity_ChampionsRoom_Movement_RivalApproachPlayer
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

EverGrandeCity_ChampionsRoom_EventScript_RivalLookBackAndForth:: @ 815B9D2
	applymovement 2, EverGrandeCity_ChampionsRoom_Movement_RivalLookBackAndForth
	waitmovement 0
	return

EverGrandeCity_ChampionsRoom_Movement_PlayerExitStart:: @ 815B9DD
	walk_up
	walk_up
	step_end

EverGrandeCity_ChampionsRoom_Movement_PlayerExit:: @ 815B9E0
	walk_up
	delay_16
	walk_up
	delay_8
	set_invisible
	step_end

EverGrandeCity_ChampionsRoom_Movement_RivalApproachPlayer:: @ 815B9E6
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_left
	walk_up
	walk_in_place_fastest_right
	step_end

EverGrandeCity_ChampionsRoom_Movement_RivalLookBackAndForth:: @ 815B9EF
	walk_in_place_fastest_up
	delay_16
	walk_in_place_fastest_right
	delay_16
	walk_in_place_fastest_up
	delay_8
	walk_in_place_fastest_right
	delay_16
	step_end

EverGrandeCity_ChampionsRoom_Movement_RivalFollows:: @ 815B9F8
	walk_right
	walk_up
	step_end

EverGrandeCity_ChampionsRoom_Movement_StevenExitStart:: @ 815B9FB
	walk_up
	walk_up
	walk_in_place_fastest_down
	step_end

EverGrandeCity_ChampionsRoom_Movement_StevenExit:: @ 815B9FF
	walk_up
	delay_8
	set_invisible
	step_end

EverGrandeCity_ChampionsRoom_Movement_BirchArrives:: @ 815BA03
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_right
	walk_up
	walk_in_place_fastest_left
	step_end
