VictoryRoad_1F_MapScripts:: @ 815DE83
	map_script MAP_SCRIPT_ON_TRANSITION, VictoryRoad_1F_OnTransition
	.byte 0

VictoryRoad_1F_OnTransition:: @ 815DE89
	call_if_set FLAG_DEFEATED_WALLY_VICTORY_ROAD, VictoryRoad_1F_EventScript_HideWally
	end

VictoryRoad_1F_EventScript_HideWally:: @ 815DE93
	setflag FLAG_HIDE_WALLY_BATTLE_VICTORY_ROAD
	return

VictoryRoad_1F_EventScript_WallyTrigger0:: @ 815DE97
	lockall
	addobject 4
	applymovement 4, VictoryRoad_1F_Movement_WallyApproachPlayer0
	waitmovement 0
	goto VictoryRoad_1F_EventScript_WallyApproachPlayer
	end

VictoryRoad_1F_EventScript_WallyTrigger1:: @ 815DEAB
	lockall
	addobject 4
	applymovement 4, VictoryRoad_1F_Movement_WallyApproachPlayer1
	waitmovement 0
	goto VictoryRoad_1F_EventScript_WallyApproachPlayer
	end

VictoryRoad_1F_EventScript_WallyTrigger2:: @ 815DEBF
	lockall
	addobject 4
	applymovement 4, VictoryRoad_1F_Movement_WallyApproachPlayer2
	waitmovement 0
	goto VictoryRoad_1F_EventScript_WallyApproachPlayer
	end

VictoryRoad_1F_EventScript_WallyApproachPlayer:: @ 815DED3
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	msgbox VictoryRoad_1F_Text_WallyNotGoingToLoseAnymore, MSGBOX_DEFAULT
	trainerbattle_no_intro TRAINER_WALLY_1, VictoryRoad_1F_Text_WallyEntranceDefeat
	msgbox VictoryRoad_1F_Text_WallyPostEntranceBattle, MSGBOX_DEFAULT
	clearflag FLAG_HIDE_WALLY_BATTLE_VICTORY_ROAD
	moveobjectoffscreen 4
	setflag FLAG_DEFEATED_WALLY_VICTORY_ROAD
	setvar VAR_VICTORY_ROAD_1F_STATE, 1
	releaseall
	end

VictoryRoad_1F_Movement_WallyApproachPlayer0:: @ 815DF07
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	step_end

VictoryRoad_1F_Movement_WallyApproachPlayer1:: @ 815DF13
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	step_end

VictoryRoad_1F_Movement_WallyApproachPlayer2:: @ 815DF1E
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	step_end

VictoryRoad_1F_EventScript_WallyRematchPostBattle:: @ 815DF28
	msgbox VictoryRoad_1F_Text_WallyPostEntranceBattle, MSGBOX_NPC
	end

VictoryRoad_1F_EventScript_Wally:: @ 815DF31
	trainerbattle_single TRAINER_WALLY_3, VictoryRoad_1F_Text_WallyIntro, VictoryRoad_1F_Text_WallyDefeat
	specialvar VAR_RESULT, ShouldTryRematchBattle
	compare VAR_RESULT, 1
	goto_if_eq VictoryRoad_1F_EventScript_WallyRematch
	msgbox VictoryRoad_1F_Text_WallyPostBattle, MSGBOX_AUTOCLOSE
	end

VictoryRoad_1F_EventScript_WallyRematch:: @ 815DF58
	trainerbattle_rematch TRAINER_WALLY_3, VictoryRoad_1F_Text_WallyIntro, VictoryRoad_1F_Text_WallyDefeat
	msgbox VictoryRoad_1F_Text_WallyPostBattle, MSGBOX_AUTOCLOSE
	end

VictoryRoad_1F_EventScript_Edgar:: @ 815DF6F
	trainerbattle_single TRAINER_EDGAR, VictoryRoad_1F_Text_EdgarIntro, VictoryRoad_1F_Text_EdgarDefeat
	msgbox VictoryRoad_1F_Text_EdgarPostBattle, MSGBOX_AUTOCLOSE
	end

VictoryRoad_1F_EventScript_Albert:: @ 815DF86
	trainerbattle_single TRAINER_ALBERT, VictoryRoad_1F_Text_AlbertIntro, VictoryRoad_1F_Text_AlbertDefeat
	msgbox VictoryRoad_1F_Text_AlbertPostBattle, MSGBOX_AUTOCLOSE
	end

VictoryRoad_1F_EventScript_Hope:: @ 815DF9D
	trainerbattle_single TRAINER_HOPE, VictoryRoad_1F_Text_HopeIntro, VictoryRoad_1F_Text_HopeDefeat
	msgbox VictoryRoad_1F_Text_HopePostBattle, MSGBOX_AUTOCLOSE
	end
