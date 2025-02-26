LavaridgeTown_MapScripts:: @ 814E4A3
	map_script MAP_SCRIPT_ON_TRANSITION, LavaridgeTown_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LavaridgeTown_OnFrame
	.byte 0

LavaridgeTown_OnTransition:: @ 814E4AE
	setflag FLAG_VISITED_LAVARIDGE_TOWN
	call_if_set FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY, LavaridgeTown_EventScript_ShowMtChimneyTrainers
	call Common_EventScript_SetupRivalGfxId
	call Common_EventScript_SetupRivalOnBikeGfxId
	compare VAR_LAVARIDGE_RIVAL_STATE, 2
	call_if_eq LavaridgeTown_EventScript_SetRivalPos
	end

LavaridgeTown_EventScript_SetRivalPos:: @ 814E4D0
	setobjectxyperm 8, 11, 9
	setobjectxyperm 7, 11, 9
	return

LavaridgeTown_EventScript_ShowMtChimneyTrainers:: @ 814E4DF
	clearflag FLAG_HIDE_MT_CHIMNEY_PEOPLE
	return

LavaridgeTown_OnFrame:: @ 814E4E3
	map_script_2 VAR_LAVARIDGE_RIVAL_STATE, 1, LavaridgeTown_EventScript_RivalGiveGoGoggles
	.2byte 0

LavaridgeTown_EventScript_RivalGiveGoGoggles:: @ 814E4ED
	lockall
	setvar VAR_0x8008, 1
	opendoor 12, 15
	waitdooranim
	addobject 8
	applymovement 8, LavaridgeTown_Movement_RivalExitHerbShop
	waitmovement 0
	closedoor 12, 15
	waitdooranim
	applymovement 8, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	applymovement 8, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 8, Common_Movement_Delay48
	waitmovement 0
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LavaridgeTown_EventScript_PlayMayMusic
	compare VAR_RESULT, 1
	call_if_eq LavaridgeTown_EventScript_PlayBrendanMusic
	compare VAR_0x8008, 1
	call_if_eq LavaridgeTown_EventScript_RivalApproachPlayerFromHerbShop
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq LavaridgeTown_EventScript_MayGiveGoGoggles
	compare VAR_RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_BrendanGiveGoGoggles
	end

LavaridgeTown_EventScript_PlayMayMusic:: @ 814E56B
	playbgm MUS_ENCOUNTER_MAY, TRUE
	return

LavaridgeTown_EventScript_PlayBrendanMusic:: @ 814E570
	playbgm MUS_ENCOUNTER_BRENDAN, TRUE
	return

LavaridgeTown_EventScript_14E575:: @ 814E575
	lock
	faceplayer
	setvar VAR_0x8008, 0
	checkplayergender
	compare VAR_RESULT, 0
	call_if_eq LavaridgeTown_EventScript_PlayMayMusic
	compare VAR_RESULT, 1
	call_if_eq LavaridgeTown_EventScript_PlayBrendanMusic
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq LavaridgeTown_EventScript_MayGiveGoGoggles
	compare VAR_RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_BrendanGiveGoGoggles
	end

LavaridgeTown_EventScript_MayGiveGoGoggles:: @ 814E5AB
	msgbox LavaridgeTown_Text_MayNiceBadgesTakeThis, MSGBOX_DEFAULT
	giveitem ITEM_GO_GOGGLES
	setflag FLAG_RECEIVED_GO_GOGGLES
	msgbox LavaridgeTown_Text_MayExplainGoGogglesChallengeDad, MSGBOX_DEFAULT
	goto LavaridgeTown_EventScript_RivalExit
	end

LavaridgeTown_EventScript_BrendanGiveGoGoggles:: @ 814E5D0
	msgbox LavaridgeTown_Text_BrendanNiceBadgesTakeThis, MSGBOX_DEFAULT
	giveitem ITEM_GO_GOGGLES
	setflag FLAG_RECEIVED_GO_GOGGLES
	msgbox LavaridgeTown_Text_BrendanExplainGoGogglesChallengeDad, MSGBOX_DEFAULT
	goto LavaridgeTown_EventScript_RivalExit
	end

LavaridgeTown_EventScript_RivalExit:: @ 814E5F5
	closemessage
	compare VAR_0x8008, 1
	call_if_eq LavaridgeTown_EventScript_14E646
	compare VAR_0x8008, 0
	call_if_eq LavaridgeTown_EventScript_14E64E
	removeobject 8
	addobject 7
	delay 30
	compare VAR_0x8008, 1
	call_if_eq LavaridgeTown_EventScript_RivalExit2
	compare VAR_0x8008, 0
	call_if_eq LavaridgeTown_EventScript_14E6A5
	removeobject 7
	setvar VAR_LAVARIDGE_RIVAL_STATE, 2
	savebgm 0
	fadedefaultbgm
	compare VAR_0x8008, 0
	goto_if_eq LavaridgeTown_EventScript_14E644
	releaseall
	end

LavaridgeTown_EventScript_14E644:: @ 814E644
	release
	end

LavaridgeTown_EventScript_14E646:: @ 814E646
	setobjectxyperm 7, 6, 16
	return

LavaridgeTown_EventScript_14E64E:: @ 814E64E
	compare VAR_FACING, 2
	call_if_eq LavaridgeTown_EventScript_14E67B
	compare VAR_FACING, 1
	call_if_eq LavaridgeTown_EventScript_14E680
	compare VAR_FACING, 3
	call_if_eq LavaridgeTown_EventScript_14E685
	compare VAR_FACING, 4
	call_if_eq LavaridgeTown_EventScript_14E68A
	return

LavaridgeTown_EventScript_14E67B:: @ 814E67B
	setobjectmovementtype 7, 8
	return

LavaridgeTown_EventScript_14E680:: @ 814E680
	setobjectmovementtype 7, 7
	return

LavaridgeTown_EventScript_14E685:: @ 814E685
	setobjectmovementtype 7, 10
	return

LavaridgeTown_EventScript_14E68A:: @ 814E68A
	setobjectmovementtype 7, 9
	return

LavaridgeTown_EventScript_RivalApproachPlayerFromHerbShop:: @ 814E68F
	applymovement 8, LavaridgeTown_Movement_RivalApproachPlayer2
	waitmovement 0
	return

LavaridgeTown_EventScript_RivalExit2:: @ 814E69A
	applymovement 7, LavaridgeTown_Movement_RivalExit2
	waitmovement 0
	return

LavaridgeTown_EventScript_14E6A5:: @ 814E6A5
	compare VAR_FACING, 2
	call_if_eq LavaridgeTown_EventScript_14E6D2
	compare VAR_FACING, 1
	call_if_eq LavaridgeTown_EventScript_14E6D2
	compare VAR_FACING, 3
	call_if_eq LavaridgeTown_EventScript_RivalExit1
	compare VAR_FACING, 4
	call_if_eq LavaridgeTown_EventScript_14E6D2
	return

LavaridgeTown_EventScript_14E6D2:: @ 814E6D2
	applymovement 7, LavaridgeTown_Movement_14E6FA
	waitmovement 0
	return

LavaridgeTown_EventScript_RivalExit1:: @ 814E6DD
	applymovement 7, LavaridgeTown_Movement_RivalExit1
	waitmovement 0
	return

LavaridgeTown_Movement_RivalApproachPlayer2:: @ 814E6E8
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

LavaridgeTown_Movement_RivalExit2:: @ 814E6EF
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	step_end

LavaridgeTown_Movement_14E6FA:: @ 814E6FA
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	step_end

LavaridgeTown_Movement_RivalExit1:: @ 814E703
	walk_fast_down
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	step_end

LavaridgeTown_Movement_RivalExitHerbShop:: @ 814E70E
	walk_down
	step_end

LavaridgeTown_EventScript_HotSpringsTrigger:: @ 814E710
	specialvar VAR_RESULT, GetPlayerFacingDirection
	compare VAR_RESULT, 1
	goto_if_eq LavaridgeTown_EventScript_EnteredHotSprings
	end

LavaridgeTown_EventScript_EnteredHotSprings:: @ 814E721
	incrementgamestat GAME_STAT_ENTERED_HOT_SPRINGS
	end

LavaridgeTown_EventScript_ExpertM:: @ 814E724
	msgbox LavaridgeTown_Text_HotSpringsNeverRunDry, MSGBOX_NPC
	end

LavaridgeTown_EventScript_OldMan:: @ 814E72D
	msgbox LavaridgeTown_Text_PokemonNippedBackside, MSGBOX_SIGN
	end

LavaridgeTown_EventScript_Twin:: @ 814E736
	msgbox LavaridgeTown_Text_BatheInHotSpringsEveryDay, MSGBOX_NPC
	end

LavaridgeTown_EventScript_HotSpringsOldWoman1:: @ 814E73F
	msgbox LavaridgeTown_Text_IfPokemonInHotSprings, MSGBOX_NPC
	end

LavaridgeTown_EventScript_HotSpringsOldWoman2:: @ 814E748
	msgbox LavaridgeTown_Text_HotSpringsClaims, MSGBOX_NPC
	end

LavaridgeTown_EventScript_ExpertF:: @ 814E751
	msgbox LavaridgeTown_Text_OhYouLikeHotSprings, MSGBOX_NPC
	end

LavaridgeTown_EventScript_EggWoman:: @ 814E75A
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_LAVARIDGE_EGG, LavaridgeTown_EventScript_ReceivedEgg
	msgbox LavaridgeTown_Text_HaveEggWillYouTakeIt, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq LavaridgeTown_EventScript_DeclineEgg
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq LavaridgeTown_EventScript_NoRoomForEgg
	msgbox LavaridgeTown_Text_HopeYoullWalkPlentyWithEgg, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_LAVARIDGE_EGG
	playfanfare MUS_OBTAIN_ITEM
	message LavaridgeTown_Text_ReceivedTheEgg
	waitfanfare
	waitmessage
	giveegg SPECIES_WYNAUT
	release
	end

LavaridgeTown_EventScript_ReceivedEgg:: @ 814E79E
	msgbox LavaridgeTown_Text_EverySoOftenEggFoundAtDayCare, MSGBOX_DEFAULT
	release
	end

LavaridgeTown_EventScript_NoRoomForEgg:: @ 814E7A8
	msgbox LavaridgeTown_Text_NoRoomForThisEgg, MSGBOX_DEFAULT
	release
	end

LavaridgeTown_EventScript_DeclineEgg:: @ 814E7B2
	msgbox LavaridgeTown_Text_AsYouWishThen, MSGBOX_DEFAULT
	release
	end

LavaridgeTown_EventScript_TownSign:: @ 814E7BC
	msgbox LavaridgeTown_Text_TownSign, MSGBOX_SIGN
	end

LavaridgeTown_EventScript_GymSign:: @ 814E7C5
	msgbox LavaridgeTown_Text_GymSign, MSGBOX_SIGN
	end

@ 814E7CE
	msgbox LavaridgeTown_Text_HerbShopSign, MSGBOX_SIGN
	end

LavaridgeTown_EventScript_HerbShopSign:: @ 814E7D7
	msgbox LavaridgeTown_Text_HerbShopSign, MSGBOX_SIGN
	end
