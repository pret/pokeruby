	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gBattleTransitionTable_Wild:: @ 839ACF8
	.byte  8,  9,  5, 10,  0, 10,  7,  6

gBattleTransitionTable_Trainer:: @ 839AD00
	.byte  4, 11,  2,  3,  0, 10,  1,  6

	.align 2
gTrainerBattleSpecs_0:: @ 839AD08
	.4byte gTrainerBattleMode, 0
	.4byte gTrainerBattleOpponent, 1
	.4byte gTrainerMapObjectLocalId, 1
	.4byte gTrainerIntroSpeech, 2
	.4byte gTrainerDefeatSpeech, 2
	.4byte gTrainerVictorySpeech, 5
	.4byte gTrainerCannotBattleSpeech, 5
	.4byte gTrainerBattleEndScript, 5
	.4byte gTrainerBattleScriptReturnAddress, 6

	.align 2
gTrainerBattleSpecs_1:: @ 839AD50
	.4byte gTrainerBattleMode, 0
	.4byte gTrainerBattleOpponent, 1
	.4byte gTrainerMapObjectLocalId, 1
	.4byte gTrainerIntroSpeech, 2
	.4byte gTrainerDefeatSpeech, 2
	.4byte gTrainerVictorySpeech, 5
	.4byte gTrainerCannotBattleSpeech, 5
	.4byte gTrainerBattleEndScript, 2
	.4byte gTrainerBattleScriptReturnAddress, 6

	.align 2
gTrainerBattleSpecs_2:: @ 839AD98
	.4byte gTrainerBattleMode, 0
	.4byte gTrainerBattleOpponent, 1
	.4byte gTrainerMapObjectLocalId, 1
	.4byte gTrainerIntroSpeech, 2
	.4byte gTrainerDefeatSpeech, 2
	.4byte gTrainerVictorySpeech, 5
	.4byte gTrainerCannotBattleSpeech, 2
	.4byte gTrainerBattleEndScript, 5
	.4byte gTrainerBattleScriptReturnAddress, 6

	.align 2
gTrainerBattleSpecs_3:: @ 839ADE0
	.4byte gTrainerBattleMode, 0
	.4byte gTrainerBattleOpponent, 1
	.4byte gTrainerMapObjectLocalId, 1
	.4byte gTrainerIntroSpeech, 5
	.4byte gTrainerDefeatSpeech, 2
	.4byte gTrainerVictorySpeech, 5
	.4byte gTrainerCannotBattleSpeech, 5
	.4byte gTrainerBattleEndScript, 5
	.4byte gTrainerBattleScriptReturnAddress, 6

	.align 2
gTrainerBattleSpecs_4:: @ 839AE28
	.4byte gTrainerBattleMode, 0
	.4byte gTrainerBattleOpponent, 1
	.4byte gTrainerMapObjectLocalId, 1
	.4byte gTrainerIntroSpeech, 2
	.4byte gTrainerDefeatSpeech, 2
	.4byte gTrainerVictorySpeech, 5
	.4byte gTrainerCannotBattleSpeech, 2
	.4byte gTrainerBattleEndScript, 2
	.4byte gTrainerBattleScriptReturnAddress, 6

@ 839AE70
	.include "data/trainer_eye_trainers.inc"

	.align 2
gBadgeFlags:: @ 839B1F0
	.2byte 0x0807, 0x0808, 0x0809, 0x080a, 0x080b, 0x080c, 0x080d, 0x080e
