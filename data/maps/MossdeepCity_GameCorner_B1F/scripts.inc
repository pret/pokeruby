MossdeepCity_GameCorner_B1F_MapScripts:: @ 815AE55
	map_script MAP_SCRIPT_ON_TRANSITION, MossdeepCity_GameCorner_B1F_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, MossdeepCity_GameCorner_B1F_OnFrame
	.byte 0

MossdeepCity_GameCorner_B1F_OnTransition:: @ 815AE60
	special SetEReaderTrainerGfxId
	end

MossdeepCity_GameCorner_B1F_OnFrame:: @ 815AE64
	map_script_2 VAR_TEMP_1, 0, MossdeepCity_GameCorner_B1F_EventScript_15AE6E
	.2byte 0

MossdeepCity_GameCorner_B1F_EventScript_15AE6E:: @ 815AE6E
	lockall
	applymovement LOCALID_PLAYER, MossdeepCity_GameCorner_B1F_Movement_15AEF9
	waitmovement 0
	special PrintEReaderTrainerGreeting
	msgbox gStringVar4, MSGBOX_DEFAULT
	closemessage
	setvar VAR_0x8004, 2
	setvar VAR_0x8005, 0
	special StartSpecialBattle
	waitstate
	compare VAR_RESULT, 3
	call_if_eq MossdeepCity_GameCorner_B1F_EventScript_15AED5
	compare VAR_RESULT, 1
	call_if_eq MossdeepCity_GameCorner_B1F_EventScript_15AEE3
	compare VAR_RESULT, 2
	call_if_eq MossdeepCity_GameCorner_B1F_EventScript_15AEEE
	closemessage
	special ScrSpecial_HealPlayerParty
	applymovement LOCALID_PLAYER, MossdeepCity_GameCorner_B1F_Movement_15AEFF
	waitmovement 0
	special LoadPlayerParty
	setvar VAR_TEMP_1, 1
	warp MAP_MOSSDEEP_CITY_GAME_CORNER_1F, 255, 3, 1
	waitstate
	releaseall
	end

MossdeepCity_GameCorner_B1F_EventScript_15AED5:: @ 815AED5
	setvar VAR_GAME_CORNER_STATE, 3
	msgbox MossdeepCity_GameCorner_B1F_Text_MatchEndedUpDraw, MSGBOX_DEFAULT
	return

MossdeepCity_GameCorner_B1F_EventScript_15AEE3:: @ 815AEE3
	setvar VAR_GAME_CORNER_STATE, 1
	special ShowFieldMessageStringVar4
	waitmessage
	waitbuttonpress
	return

MossdeepCity_GameCorner_B1F_EventScript_15AEEE:: @ 815AEEE
	setvar VAR_GAME_CORNER_STATE, 2
	special ShowFieldMessageStringVar4
	waitmessage
	waitbuttonpress
	return

MossdeepCity_GameCorner_B1F_Movement_15AEF9:: @ 815AEF9
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	step_end

MossdeepCity_GameCorner_B1F_Movement_15AEFF:: @ 815AEFF
	walk_left
	walk_left
	walk_up
	walk_up
	walk_up
	walk_up
	delay_8
	step_end
