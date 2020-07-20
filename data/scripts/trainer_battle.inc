EventScript_StartTrainerBattle:: @ 819F80B
	lock
	special PlayTrainerEncounterMusic
	special EndTrainerApproach
	waitstate
	goto EventScript_DoTrainerBattle

EventScript_TryDoNormalTrainerBattle:: @ 819F818
	lock
	faceplayer
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	specialvar VAR_RESULT, GetTrainerFlag
	compare VAR_RESULT, 0
	goto_if_ne EventScript_NoNormalTrainerBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	goto EventScript_DoTrainerBattle

EventScript_NoNormalTrainerBattle:
	gotopostbattlescript

EventScript_TryDoDoubleTrainerBattle:: @ 819F840
	lock
	faceplayer
	call EventScript_RevealTrainer
	specialvar VAR_RESULT, GetTrainerFlag
	compare VAR_RESULT, 0
	goto_if_ne EventScript_NoDoubleTrainerBattle
	special HasEnoughMonsForDoubleBattle
	compare VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS
	goto_if_ne EventScript_NotEnoughMonsForDoubleBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	goto EventScript_DoTrainerBattle

EventScript_NotEnoughMonsForDoubleBattle:
	special ScrSpecial_ShowTrainerNonBattlingSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_NoDoubleTrainerBattle:
	gotopostbattlescript

EventScript_DoNoIntroTrainerBattle:: @ 819F878
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	special PlayTrainerEncounterMusic
	trainerbattlebegin
	gotopostbattlescript

EventScript_TryDoRematchBattle:: @ 819F887
	call EventScript_RevealTrainer
	specialvar VAR_RESULT, IsTrainerReadyForRematch
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_NoRematchTrainerBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	special ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	special BattleSetup_StartRematchBattle
	waitstate
	releaseall
	end

EventScript_NoRematchTrainerBattle:
	gotopostbattlescript

EventScript_TryDoDoubleRematchBattle:: @ 819F8AE
	specialvar VAR_RESULT, IsTrainerReadyForRematch
	compare VAR_RESULT, FALSE
	goto_if_eq EventScript_NoDoubleRematchTrainerBattle
	special HasEnoughMonsForDoubleBattle
	compare VAR_RESULT, PLAYER_HAS_TWO_USABLE_MONS
	goto_if_ne EventScript_NotEnoughMonsForDoubleRematchBattle
	special PlayTrainerEncounterMusic
	special SetUpTrainerMovement
	special ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	special BattleSetup_StartRematchBattle
	waitstate
	releaseall
	end

EventScript_NoDoubleRematchTrainerBattle:
	gotopostbattlescript

EventScript_NotEnoughMonsForDoubleRematchBattle:
	special ScrSpecial_ShowTrainerNonBattlingSpeech
	waitmessage
	waitbuttonpress
	release
	end

EventScript_RevealTrainer:
	applymovement VAR_LAST_TALKED, Movement_RevealTrainer
	waitmovement 0
	return

Movement_RevealTrainer::
	reveal_trainer
	step_end

EventScript_DoTrainerBattle:
	special ShowTrainerIntroSpeech
	waitmessage
	waitbuttonpress
	trainerbattlebegin
	specialvar VAR_RESULT, ScrSpecial_GetTrainerBattleMode
	compare VAR_RESULT, TRAINER_BATTLE_SINGLE
	goto_if_eq EventScript_EndTrainerBattle
	compare VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT
	goto_if_eq EventScript_GoToBeatenScript
	compare VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_NO_MUSIC
	goto_if_eq EventScript_GoToBeatenScript
	compare VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE
	goto_if_eq EventScript_GoToBeatenScript
	compare VAR_RESULT, TRAINER_BATTLE_CONTINUE_SCRIPT_DOUBLE_NO_MUSIC
	goto_if_eq EventScript_GoToBeatenScript
EventScript_EndTrainerBattle:
	releaseall
	end

EventScript_GoToBeatenScript:
	gotobeatenscript

Std_MsgboxAutoclose::
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return
