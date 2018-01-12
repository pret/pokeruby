#include "constants/battle_constants.h"
#include "constants/items.h"
#include "constants/songs.h"
	.include "include/macros.inc"
	.include "include/macros/battle_script.inc"
	.include "constants/constants.inc"
	.include "constants/battle_script_constants.inc"

	.section script_data, "aw", %progbits

	.align 2
gBattlescriptsForBallThrow:: @ 81D9E48
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_SafariBallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow
	.4byte BattleScript_BallThrow

gBattlescriptsForUsingItem:: @ 81D9E7C
	.4byte BattleScript_PlayerUsesItem
	.4byte BattleScript_OpponentUsesHealItem
	.4byte BattleScript_OpponentUsesHealItem
	.4byte BattleScript_OpponentUsesStatusCureItem
	.4byte BattleScript_OpponentUsesXItem
	.4byte BattleScript_OpponentUsesGuardSpecs

gBattlescriptsForRunningByItem:: @ 81D9E94
	.4byte BattleScript_RunByUsingItem

gBattlescriptsForSafariActions:: @ 81D9E98
	.4byte BattleScript_ActionWatchesCarefully
	.4byte BattleScript_ActionGetNear
	.4byte BattleScript_ActionThrowPokeblock
	.4byte BattleScript_1DA00A

BattleScript_BallThrow: @ 81D9EA8
	jumpifhalfword COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_WALLY_TUTORIAL, BattleScript_BallThrowByWally
	printstring BATTLE_TEXT_Used1
	handleballthrow

BattleScript_BallThrowByWally: @ 81D9EB8
	printstring BATTLE_TEXT_TutorialUsed
	handleballthrow

BattleScript_SafariBallThrow: @ 81D9EBC
	printstring BATTLE_TEXT_Used1
	updatestatusicon USER
	handleballthrow

BattleScript_SuccessBallThrow:: @ 81D9EC2
	jumpifhalfword EQUAL, gLastUsedItem, ITEM_SAFARI_BALL, BattleScript_PrintCaughtMonInfo
	incrementgamestat 11

BattleScript_PrintCaughtMonInfo: @ 81D9ED0
	printstring BATTLE_TEXT_BallCaught1
	trysetcaughtmondexflags BattleScript_TryNicknameCaughtMon
	printstring BATTLE_TEXT_AddedToDex
	waitstate
	setbyte gBattleCommunication, 0
	displaydexinfo

BattleScript_TryNicknameCaughtMon: @ 81D9EE3
	printstring BATTLE_TEXT_GiveNickname
	waitstate
	setbyte gBattleCommunication, 0
	trygivecaughtmonnick BattleScript_GiveCaughtMonEnd
	printstring BATTLE_TEXT_SentToPC
	waitmessage 64

BattleScript_GiveCaughtMonEnd: @ 81D9EF8
	givecaughtmon
	setbyte gBattleOutcome, BATTLE_CAUGHT
	finishturn

BattleScript_WallyBallThrow:: @ 81D9F00
	printstring BATTLE_TEXT_BallCaught2
	setbyte gBattleOutcome, BATTLE_CAUGHT
	finishturn

BattleScript_ShakeBallThrow:: @ 81D9F0A
	printfromtable gBallEscapeStringIds
	waitmessage 64
	jumpifbyte NO_COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_SAFARI, BattleScript_ShakeBallThrowEnd
	jumpifbyte NOT_EQUAL, gNumSafariBalls, 0, BattleScript_ShakeBallThrowEnd
	printstring BATTLE_TEXT_SafariOver
	waitmessage 64
	setbyte gBattleOutcome, BATTLE_OUT_OF_BALLS

BattleScript_ShakeBallThrowEnd: @ 81D9F34
	finishaction

BattleScript_TrainerBallBlock:: @ 81D9F35
	waitmessage 64
	printstring BATTLE_TEXT_BlockBall
	waitmessage 64
	printstring BATTLE_TEXT_DontBeAThief
	waitmessage 64
	finishaction

BattleScript_PlayerUsesItem: @ 81D9F45
	setbyte sMOVEEND_STATE, 15
	moveend 1, 0
	end

BattleScript_OpponentUsesHealItem: @ 81D9F4F
	pause 48
	playse SE_KAIFUKU
	printstring BATTLE_TEXT_Used2
	waitmessage 64
	useitemonopponent
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_RestoredHealth
	waitmessage 64
	updatestatusicon USER
	setbyte sMOVEEND_STATE, 15
	moveend 1, 0
	finishaction

BattleScript_OpponentUsesStatusCureItem: @ 81D9F7B
	pause 48
	playse SE_KAIFUKU
	printstring BATTLE_TEXT_Used2
	waitmessage 64
	useitemonopponent
	printfromtable gTrainerItemCuredStatusStringIds
	waitmessage 64
	updatestatusicon USER
	setbyte sMOVEEND_STATE, 15
	moveend 1, 0
	finishaction

BattleScript_OpponentUsesXItem: @ 81D9F9C
	pause 48
	playse SE_KAIFUKU
	printstring BATTLE_TEXT_Used2
	waitmessage 64
	useitemonopponent
	printfromtable gStatUpStringIds
	waitmessage 64
	setbyte sMOVEEND_STATE, 15
	moveend 1, 0
	finishaction

BattleScript_OpponentUsesGuardSpecs: @ 81D9FBB
	pause 48
	playse SE_KAIFUKU
	printstring BATTLE_TEXT_Used2
	waitmessage 64
	useitemonopponent
	printfromtable gMistUsedStringIds
	waitmessage 64
	setbyte sMOVEEND_STATE, 15
	moveend 1, 0
	finishaction

BattleScript_RunByUsingItem: @ 81D9FDA
	playse SE_NIGERU
	setbyte gBattleOutcome, BATTLE_RAN
	finishturn

BattleScript_ActionWatchesCarefully: @ 81D9FE4
	printstring BATTLE_TEXT_WatchingCarefully
	waitmessage 64
	end2

BattleScript_ActionGetNear: @ 81D9FEB
	printfromtable gSafariGetNearStringIds
	waitmessage 64
	end2

BattleScript_ActionThrowPokeblock: @ 81D9FF4
	printstring BATTLE_TEXT_ThrewBlock
	waitmessage 64
	playanimation USER, B_ANIM_POKEBLOCK_THROW, 0x0
	printfromtable gSafariPokeblockResultStringIds
	waitmessage 64
	end2

BattleScript_1DA00A: @ 81DA00A
	printstring 2
	waitmessage 64
	returnatktoball
	waitstate
	trainerslidein TARGET
	waitstate
	printstring BATTLE_TEXT_WallyBall
	waitmessage 64
	end2
