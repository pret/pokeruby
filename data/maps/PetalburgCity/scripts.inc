PetalburgCity_MapScripts:: @ 814B70C
	map_script MAP_SCRIPT_ON_TRANSITION, PetalburgCity_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, PetalburgCity_OnFrame
	.byte 0

PetalburgCity_OnTransition:: @ 814B717
	setflag FLAG_VISITED_PETALBURG_CITY
	compare VAR_PETALBURG_STATE, 0
	call_if_eq PetalburgCity_EventScript_MoveGymBoyToWestEntrance
	compare VAR_PETALBURG_STATE, 2
	call_if_eq PetalburgCity_EventScript_DisableMapMusic
	end

PetalburgCity_EventScript_MoveGymBoyToWestEntrance:: @ 814B731
	setobjectxyperm 9, 5, 11
	return

PetalburgCity_EventScript_DisableMapMusic:: @ 814B739
	savebgm MUS_FOLLOW_ME
	return

PetalburgCity_OnFrame:: @ 814B73D
	map_script_2 VAR_PETALBURG_STATE, 2, PetalburgCity_EventScript_WallyTutorial
	.2byte 0

PetalburgCity_EventScript_WallyTutorial:: @ 814B747
	lockall
	setflag FLAG_HIDE_MAP_NAME_POPUP
	special SavePlayerParty
	special PutZigzagoonInPlayerParty
	applymovement 2, PetalburgCity_Movement_WallyTutorialWally
	applymovement LOCALID_PLAYER, PetalburgCity_Movement_WallyTutorialPlayer
	waitmovement 0
	msgbox Route102_Text_WatchMeCatchPokemon, MSGBOX_DEFAULT
	special ScrSpecial_StartWallyTutorialBattle
	waitstate
	msgbox Route102_Text_WallyIDidIt, MSGBOX_DEFAULT
	applymovement 2, Common_Movement_WalkInPlaceFastestLeft, MAP_PETALBURG_CITY
	@ Local id and map num were swapped here (0, 0, 2 vs 2, 0, 0). Fixed to waitmovement 2, MAP_PETALBURG_CITY in Emerald
	waitmovement 0, MAP_MAUVILLE_CITY
	msgbox Route102_Text_LetsGoBack, MSGBOX_DEFAULT
	closemessage
	clearflag FLAG_HIDE_MAP_NAME_POPUP
	setvar VAR_PETALBURG_STATE, 3
	fadedefaultbgm
	clearflag FLAG_DONT_TRANSITION_MUSIC
	special LoadPlayerParty
	setvar VAR_PETALBURG_GYM_STATE, 1
	warp MAP_PETALBURG_CITY_GYM, 255, 4, 108
	waitstate
	releaseall
	end

PetalburgCity_EventScript_Boy:: @ 814B7AC
	lock
	faceplayer
	msgbox PetalburgCity_Text_WaterReflection, MSGBOX_DEFAULT
	closemessage
	applymovement 3, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

PetalburgCity_EventScript_WallysMom:: @ 814B7C3
	msgbox PetalburgCity_Text_WhereIsWally, MSGBOX_NPC
	end

PetalburgCity_Movement_WallyTutorialPlayer:: @ 814B7CC
	delay_8
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_in_place_fastest_right
	step_end

PetalburgCity_Movement_WallyTutorialWally:: @ 814B7ED
	delay_8
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_right
	delay_16
	walk_in_place_fastest_up
	delay_16
	delay_16
	walk_in_place_fastest_right
	step_end

PetalburgCity_EventScript_GymSign:: @ 814B812
	msgbox PetalburgCity_Text_GymSign, MSGBOX_SIGN
	end

PetalburgCity_EventScript_CitySign:: @ 814B81B
	msgbox PetalburgCity_Text_CitySign, MSGBOX_SIGN
	end

PetalburgCity_EventScript_Gentleman:: @ 814B824
	msgbox PetalburgCity_Text_FullPartyExplanation, MSGBOX_NPC
	end

PetalburgCity_EventScript_WallyHouseSign:: @ 814B82D
	msgbox PetalburgCity_Text_WallyHouseSign, MSGBOX_SIGN
	end

PetalburgCity_EventScript_ShowGymToPlayer0:: @ 814B836
	lockall
	setvar VAR_0x8008, 0
	goto PetalburgCity_EventScript_ShowGymToPlayer
	end

PetalburgCity_EventScript_ShowGymToPlayer1:: @ 814B842
	lockall
	setvar VAR_0x8008, 1
	goto PetalburgCity_EventScript_ShowGymToPlayer
	end

PetalburgCity_EventScript_ShowGymToPlayer2:: @ 814B84E
	lockall
	setvar VAR_0x8008, 2
	goto PetalburgCity_EventScript_ShowGymToPlayer
	end

PetalburgCity_EventScript_ShowGymToPlayer3:: @ 814B85A
	lockall
	setvar VAR_0x8008, 3
	goto PetalburgCity_EventScript_ShowGymToPlayer
	end

PetalburgCity_EventScript_ShowGymToPlayer:: @ 814B866
	applymovement 9, Common_Movement_FacePlayer
	waitmovement 0
	playbgm MUS_FOLLOW_ME, FALSE
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_EventScript_BoyApproachPlayer0
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_EventScript_BoyApproachPlayer1
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_EventScript_BoyApproachPlayer2
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_EventScript_BoyApproachPlayer3
	msgbox PetalburgCity_Text_AreYouRookieTrainer, MSGBOX_DEFAULT
	closemessage
	compare VAR_0x8008, 0
	call_if_eq PetalburgCity_EventScript_LeadPlayerToGym0
	compare VAR_0x8008, 1
	call_if_eq PetalburgCity_EventScript_LeadPlayerToGym1
	compare VAR_0x8008, 2
	call_if_eq PetalburgCity_EventScript_LeadPlayerToGym2
	compare VAR_0x8008, 3
	call_if_eq PetalburgCity_EventScript_LeadPlayerToGym3
	msgbox PetalburgCity_Text_ThisIsPetalburgGym, MSGBOX_DEFAULT
	applymovement 9, Common_Movement_WalkInPlaceFastestRight
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	msgbox PetalburgCity_Text_ThisIsGymSign, MSGBOX_DEFAULT
	closemessage
	applymovement 9, PetalburgCity_Movement_BoyWalkAway
	waitmovement 0
	fadedefaultbgm
	releaseall
	end

PetalburgCity_EventScript_BoyApproachPlayer0:: @ 814B91B
	applymovement 9, PetalburgCity_Movement_BoyApproachPlayer0
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

PetalburgCity_EventScript_BoyApproachPlayer1:: @ 814B930
	applymovement 9, PetalburgCity_Movement_BoyApproachPlayer1
	waitmovement 0
	return

PetalburgCity_EventScript_BoyApproachPlayer2:: @ 814B93B
	applymovement 9, PetalburgCity_Movement_BoyApproachPlayer2
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_EventScript_BoyApproachPlayer3:: @ 814B950
	applymovement 9, PetalburgCity_Movement_BoyApproachPlayer3
	waitmovement 0
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

PetalburgCity_EventScript_LeadPlayerToGym0:: @ 814B965
	applymovement 9, PetalburgCity_Movement_BoyWalkToGym0
	applymovement LOCALID_PLAYER, PetalburgCity_Movement_PlayerWalkToGym0
	waitmovement 0
	return

PetalburgCity_EventScript_LeadPlayerToGym1:: @ 814B977
	applymovement 9, PetalburgCity_Movement_BoyWalkToGym1
	applymovement LOCALID_PLAYER, PetalburgCity_Movement_PlayerWalkToGym1
	waitmovement 0
	return

PetalburgCity_EventScript_LeadPlayerToGym2:: @ 814B989
	applymovement 9, PetalburgCity_Movement_BoyWalkToGym2
	applymovement LOCALID_PLAYER, PetalburgCity_Movement_PlayerWalkToGym2
	waitmovement 0
	return

PetalburgCity_EventScript_LeadPlayerToGym3:: @ 814B99B
	applymovement 9, PetalburgCity_Movement_BoyWalkToGym3
	applymovement LOCALID_PLAYER, PetalburgCity_Movement_PlayerWalkToGym3
	waitmovement 0
	return

@ 814B9AD
	delay_16
	delay_16
	delay_16
	step_end

PetalburgCity_Movement_BoyApproachPlayer0:: @ 814B9B1
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

PetalburgCity_Movement_BoyApproachPlayer1:: @ 814B9B6
	walk_right
	walk_right
	step_end

PetalburgCity_Movement_BoyApproachPlayer2:: @ 814B9B9
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_down
	step_end

PetalburgCity_Movement_BoyApproachPlayer3:: @ 814B9BE
	walk_down
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_down
	step_end

PetalburgCity_Movement_BoyWalkToGym0:: @ 814B9C4
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_right
	walk_in_place_fastest_up
	step_end

PetalburgCity_Movement_BoyWalkToGym1:: @ 814B9CF
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_right
	walk_in_place_fastest_up
	step_end

PetalburgCity_Movement_BoyWalkToGym2:: @ 814B9DD
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_right
	walk_in_place_fastest_up
	step_end

PetalburgCity_Movement_BoyWalkToGym3:: @ 814B9E8
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	walk_right
	walk_in_place_fastest_up
	step_end

PetalburgCity_Movement_BoyWalkAway:: @ 814B9F4
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

PetalburgCity_Movement_PlayerWalkToGym0:: @ 814BA01
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	step_end

PetalburgCity_Movement_PlayerWalkToGym1:: @ 814BA0B
	delay_16
	delay_16
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	step_end

PetalburgCity_Movement_PlayerWalkToGym2:: @ 814BA18
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	step_end

PetalburgCity_Movement_PlayerWalkToGym3:: @ 814BA22
	walk_up
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_up
	walk_up
	step_end

PetalburgCity_EventScript_GymBoy:: @ 814BA2D
	msgbox PetalburgCity_Text_AreYouRookieTrainer, MSGBOX_NPC
	end
