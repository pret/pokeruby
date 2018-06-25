#include "constants/abilities.h"
#include "constants/battle_constants.h"
#include "constants/moves.h"
#include "constants/songs.h"
	.include "include/macros.inc"
	.include "include/macros/battle_script.inc"
	.include "constants/constants.inc"
	.include "constants/battle_script_constants.inc"

	.section script_data, "aw", %progbits

gBattleScriptsForMoveEffects:: @ 81D6BBC
	.4byte BattleScript_EffectHit
	.4byte BattleScript_EffectSleep
	.4byte BattleScript_EffectPoisonHit
	.4byte BattleScript_EffectAbsorb
	.4byte BattleScript_EffectBurnHit
	.4byte BattleScript_EffectFreezeHit
	.4byte BattleScript_EffectParalyzeHit
	.4byte BattleScript_EffectExplosion
	.4byte BattleScript_EffectDreamEater
	.4byte BattleScript_EffectMirrorMove
	.4byte BattleScript_EffectAttackUp
	.4byte BattleScript_EffectDefenseUp
	.4byte BattleScript_EffectSpeedUp
	.4byte BattleScript_EffectSpecialAttackUp
	.4byte BattleScript_EffectSpecialDefenseUp
	.4byte BattleScript_EffectAccuracyUp
	.4byte BattleScript_EffectEvasionUp
	.4byte BattleScript_EffectAlwaysHit
	.4byte BattleScript_EffectAttackDown
	.4byte BattleScript_EffectDefenseDown
	.4byte BattleScript_EffectSpeedDown
	.4byte BattleScript_EffectSpecialAttackDown
	.4byte BattleScript_EffectSpecialDefenseDown
	.4byte BattleScript_EffectAccuracyDown
	.4byte BattleScript_EffectEvasionDown
	.4byte BattleScript_EffectHaze
	.4byte BattleScript_EffectBide
	.4byte BattleScript_EffectRampage
	.4byte BattleScript_EffectRoar
	.4byte BattleScript_EffectMultiHit
	.4byte BattleScript_EffectConversion
	.4byte BattleScript_EffectFlinchHit
	.4byte BattleScript_EffectRestoreHp
	.4byte BattleScript_EffectToxic
	.4byte BattleScript_EffectPayDay
	.4byte BattleScript_EffectLightScreen
	.4byte BattleScript_EffectTriAttack
	.4byte BattleScript_EffectRest
	.4byte BattleScript_EffectOHKO
	.4byte BattleScript_EffectRazorWind
	.4byte BattleScript_EffectSuperFang
	.4byte BattleScript_EffectDragonRage
	.4byte BattleScript_EffectTrap
	.4byte BattleScript_EffectHighCritical
	.4byte BattleScript_EffectDoubleHit
	.4byte BattleScript_EffectRecoilIfMiss
	.4byte BattleScript_EffectMist
	.4byte BattleScript_EffectFocusEnergy
	.4byte BattleScript_EffectRecoil
	.4byte BattleScript_EffectConfuse
	.4byte BattleScript_EffectAttackUp2
	.4byte BattleScript_EffectDefenseUp2
	.4byte BattleScript_EffectSpeedUp2
	.4byte BattleScript_EffectSpecialAttackUp2
	.4byte BattleScript_EffectSpecialDefenseUp2
	.4byte BattleScript_EffectAccuracyUp2
	.4byte BattleScript_EffectEvasionUp2
	.4byte BattleScript_EffectTransform
	.4byte BattleScript_EffectAttackDown2
	.4byte BattleScript_EffectDefenseDown2
	.4byte BattleScript_EffectSpeedDown2
	.4byte BattleScript_EffectSpecialAttackDown2
	.4byte BattleScript_EffectSpecialDefenseDown2
	.4byte BattleScript_EffectAccuracyDown2
	.4byte BattleScript_EffectEvasionDown2
	.4byte BattleScript_EffectReflect
	.4byte BattleScript_EffectPoison
	.4byte BattleScript_EffectParalyze
	.4byte BattleScript_EffectAttackDownHit
	.4byte BattleScript_EffectDefenseDownHit
	.4byte BattleScript_EffectSpeedDownHit
	.4byte BattleScript_EffectSpecialAttackDownHit
	.4byte BattleScript_EffectSpecialDefenseDownHit
	.4byte BattleScript_EffectAccuracyDownHit
	.4byte BattleScript_EffectEvasionDownHit
	.4byte BattleScript_EffectSkyAttack
	.4byte BattleScript_EffectConfuseHit
	.4byte BattleScript_EffectTwineedle
	.4byte BattleScript_EffectVitalThrow
	.4byte BattleScript_EffectSubstitute
	.4byte BattleScript_EffectRecharge
	.4byte BattleScript_EffectRage
	.4byte BattleScript_EffectMimic
	.4byte BattleScript_EffectMetronome
	.4byte BattleScript_EffectLeechSeed
	.4byte BattleScript_EffectSplash
	.4byte BattleScript_EffectDisable
	.4byte BattleScript_EffectLevelDamage
	.4byte BattleScript_EffectPsywave
	.4byte BattleScript_EffectCounter
	.4byte BattleScript_EffectEncore
	.4byte BattleScript_EffectPainSplit
	.4byte BattleScript_EffectSnore
	.4byte BattleScript_EffectConversion2
	.4byte BattleScript_EffectLockOn
	.4byte BattleScript_EffectSketch
	.4byte BattleScript_EffectUnused60//Thaw
	.4byte BattleScript_EffectSleepTalk
	.4byte BattleScript_EffectDestinyBond
	.4byte BattleScript_EffectFlail
	.4byte BattleScript_EffectSpite
	.4byte BattleScript_EffectFalseSwipe
	.4byte BattleScript_EffectHealBell
	.4byte BattleScript_EffectQuickAttack
	.4byte BattleScript_EffectTripleKick
	.4byte BattleScript_EffectThief
	.4byte BattleScript_EffectMeanLook
	.4byte BattleScript_EffectNightmare
	.4byte BattleScript_EffectMinimize
	.4byte BattleScript_EffectCurse
	.4byte BattleScript_EffectUnused6E
	.4byte BattleScript_EffectProtect
	.4byte BattleScript_EffectSpikes
	.4byte BattleScript_EffectForesight
	.4byte BattleScript_EffectPerishSong
	.4byte BattleScript_EffectSandstorm
	.4byte BattleScript_EffectEndure
	.4byte BattleScript_EffectRollout
	.4byte BattleScript_EffectSwagger
	.4byte BattleScript_EffectFuryCutter
	.4byte BattleScript_EffectAttract
	.4byte BattleScript_EffectReturn
	.4byte BattleScript_EffectPresent
	.4byte BattleScript_EffectFrustration
	.4byte BattleScript_EffectSafeguard
	.4byte BattleScript_EffectThawHit
	.4byte BattleScript_EffectMagnitude
	.4byte BattleScript_EffectBatonPass
	.4byte BattleScript_EffectPursuit
	.4byte BattleScript_EffectRapidSpin
	.4byte BattleScript_EffectSonicboom
	.4byte BattleScript_EffectUnused83
	.4byte BattleScript_EffectMorningSun
	.4byte BattleScript_EffectSynthesis
	.4byte BattleScript_EffectMoonlight
	.4byte BattleScript_EffectHiddenPower
	.4byte BattleScript_EffectRainDance
	.4byte BattleScript_EffectSunnyDay
	.4byte BattleScript_EffectDefenseUpHit
	.4byte BattleScript_EffectAttackUpHit
	.4byte BattleScript_EffectAllStatsUpHit
	.4byte BattleScript_EffectUnused8D
	.4byte BattleScript_EffectBellyDrum
	.4byte BattleScript_EffectPsychUp
	.4byte BattleScript_EffectMirrorCoat
	.4byte BattleScript_EffectSkullBash
	.4byte BattleScript_EffectTwister
	.4byte BattleScript_EffectEarthquake
	.4byte BattleScript_EffectFutureSight
	.4byte BattleScript_EffectGust
	.4byte BattleScript_EffectStomp
	.4byte BattleScript_EffectSolarbeam
	.4byte BattleScript_EffectThunder
	.4byte BattleScript_EffectTeleport
	.4byte BattleScript_EffectBeatUp
	.4byte BattleScript_EffectSemiInvulnerable
	.4byte BattleScript_EffectDefenseCurl
	.4byte BattleScript_EffectSoftboiled
	.4byte BattleScript_EffectFakeOut
	.4byte BattleScript_EffectUproar
	.4byte BattleScript_EffectStockpile
	.4byte BattleScript_EffectSpitUp
	.4byte BattleScript_EffectSwallow
	.4byte BattleScript_EffectUnusedA3
	.4byte BattleScript_EffectHail
	.4byte BattleScript_EffectTorment
	.4byte BattleScript_EffectFlatter
	.4byte BattleScript_EffectWillOWisp
	.4byte BattleScript_EffectMemento
	.4byte BattleScript_EffectFacade
	.4byte BattleScript_EffectFocusPunch
	.4byte BattleScript_EffectSmellingsalt
	.4byte BattleScript_EffectFollowMe
	.4byte BattleScript_EffectNaturePower
	.4byte BattleScript_EffectCharge
	.4byte BattleScript_EffectTaunt
	.4byte BattleScript_EffectHelpingHand
	.4byte BattleScript_EffectTrick
	.4byte BattleScript_EffectRolePlay
	.4byte BattleScript_EffectWish
	.4byte BattleScript_EffectAssist
	.4byte BattleScript_EffectIngrain
	.4byte BattleScript_EffectSuperpower
	.4byte BattleScript_EffectMagicCoat
	.4byte BattleScript_EffectRecycle
	.4byte BattleScript_EffectRevenge
	.4byte BattleScript_EffectBrickBreak
	.4byte BattleScript_EffectYawn
	.4byte BattleScript_EffectKnockOff
	.4byte BattleScript_EffectEndeavor
	.4byte BattleScript_EffectEruption
	.4byte BattleScript_EffectSkillSwap
	.4byte BattleScript_EffectImprison
	.4byte BattleScript_EffectRefresh
	.4byte BattleScript_EffectGrudge
	.4byte BattleScript_EffectSnatch
	.4byte BattleScript_EffectLowKick
	.4byte BattleScript_EffectSecretPower
	.4byte BattleScript_EffectDoubleEdge
	.4byte BattleScript_EffectTeeterDance
	.4byte BattleScript_EffectBlazeKick
	.4byte BattleScript_EffectMudSport
	.4byte BattleScript_EffectPoisonFang
	.4byte BattleScript_EffectWeatherBall
	.4byte BattleScript_EffectOverheat
	.4byte BattleScript_EffectTickle
	.4byte BattleScript_EffectCosmicPower
	.4byte BattleScript_EffectSkyUppercut
	.4byte BattleScript_EffectBulkUp
	.4byte BattleScript_EffectPoisonTail
	.4byte BattleScript_EffectWaterSport
	.4byte BattleScript_EffectCalmMind
	.4byte BattleScript_EffectDragonDance
	.4byte BattleScript_EffectCamouflage

BattleScript_EffectHit: @ 81D6F14
BattleScript_EffectAccuracyDown2: @ 81D6F14
BattleScript_EffectAccuracyUp2: @ 81D6F14
BattleScript_EffectAccuracyUp: @ 81D6F14
BattleScript_EffectAlwaysHit: @ 81D6F14
BattleScript_EffectEvasionDown2: @ 81D6F14
BattleScript_EffectEvasionDownHit: @ 81D6F14
BattleScript_EffectEvasionUp2: @ 81D6F14
BattleScript_EffectFalseSwipe: @ 81D6F14
BattleScript_EffectHighCritical: @ 81D6F14
BattleScript_EffectHit: @ 81D6F14
BattleScript_EffectPursuit: @ 81D6F14
BattleScript_EffectQuickAttack: @ 81D6F14
BattleScript_EffectSpecialAttackDown2: @ 81D6F14
BattleScript_EffectSpecialAttackDown: @ 81D6F14
BattleScript_EffectSpecialDefenseDown: @ 81D6F14
BattleScript_EffectSpecialDefenseUp: @ 81D6F14
BattleScript_EffectSpeedUp: @ 81D6F14
BattleScript_EffectUnused60: @ 81D6F14
BattleScript_EffectUnused6E: @ 81D6F14
BattleScript_EffectUnused83: @ 81D6F14
BattleScript_EffectUnused8D: @ 81D6F14
BattleScript_EffectUnusedA3: @ 81D6F14
BattleScript_EffectVitalThrow: @ 81D6F14
	jumpifnotmove MOVE_SURF, BattleScript_HitFromAtkCanceler
	jumpifnostatus3 TARGET, STATUS3_UNDERWATER, BattleScript_HitFromAtkCanceler
	orword gHitMarker, HITMARKER_IGNORE_UNDERWATER
	setbyte sDMG_MULTIPLIER, 2

BattleScript_HitFromAtkCanceler: @ 81D6F3A
	attackcanceler

BattleScript_HitFromAccCheck: @ 81D6F3B
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE

BattleScript_HitFromAtkString: @ 81D6F42
	attackstring
	ppreduce

BattleScript_HitFromCritCalc:: @ 81D6F44
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage

BattleScript_HitFromAtkAnimation: @ 81D6F48
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	seteffectwithchance
	tryfaintmon TARGET, FALSE, NULL

BattleScript_MoveEnd:: @ 81D6F62
	setbyte sMOVEEND_STATE, 0
	moveend 0, 0
	end

BattleScript_MakeMoveMissed: @ 81D6F6C
	orbyte gMoveResultFlags, MOVE_RESULT_MISSED

BattleScript_PrintMoveMissed: @ 81D6F72
	attackstring
	ppreduce

BattleScript_MoveMissedPause:: @ 81D6F74
	pause 32

BattleScript_MoveMissed: @ 81D6F77
	effectivenesssound
	resultmessage
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSleep: @ 81D6F81
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus TARGET, SLP, BattleScript_AlreadyAsleep
	jumpifcantmakeasleep BattleScript_CantMakeAsleep
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	attackanimation
	waitanimation
	setmoveeffect EFFECT_SLEEP
	seteffectprimary
	goto BattleScript_MoveEnd

BattleScript_AlreadyAsleep: @ 81D6FC4
	pause 32
	printstring BATTLE_TEXT_DefendingAsleep
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_WasntAffected: @ 81D6FD2
	pause 32
	printstring BATTLE_TEXT_WasntAffected
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_CantMakeAsleep: @ 81D6FE0
	pause 32
	printfromtable gUproarAwakeStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectPoisonHit: @ 81D6FF0
BattleScript_EffectPoisonTail: @ 81D6FF0
	setmoveeffect EFFECT_POISON
	goto BattleScript_EffectHit

BattleScript_EffectAbsorb: @ 81D6FFB
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	negativedamage
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	jumpifability TARGET, ABILITY_LIQUID_OOZE, BattleScript_AbsorbLiquidOoze
	setbyte cMULTISTRING_CHOOSER, 0
	goto BattleScript_AbsorbUpdateHp

BattleScript_AbsorbLiquidOoze: @ 81D7037
	manipulatedamage 0
	setbyte cMULTISTRING_CHOOSER, 1

BattleScript_AbsorbUpdateHp: @ 81D703F
	healthbarupdate USER
	datahpupdate USER
	jumpifmovehadnoeffect BattleScript_AbsorbTryFainting
	printfromtable gLeechSeedDrainStringIds
	waitmessage 64

BattleScript_AbsorbTryFainting: @ 81D7056
	tryfaintmon USER, FALSE, NULL
	tryfaintmon TARGET, FALSE, NULL
	goto BattleScript_MoveEnd

BattleScript_EffectBlazeKick: @ 81D7069
BattleScript_EffectBurnHit: @ 81D7069
	setmoveeffect EFFECT_BURN
	goto BattleScript_EffectHit

BattleScript_EffectFreezeHit: @ 81D7074
	setmoveeffect EFFECT_FREEZE
	goto BattleScript_EffectHit

BattleScript_EffectParalyzeHit: @ 81D707F
	setmoveeffect EFFECT_PARALYSIS
	goto BattleScript_EffectHit

BattleScript_EffectExplosion: @ 81D708A
	attackcanceler
	attackstring
	ppreduce
	faintifabilitynotdamp
	setatkhptozero
	waitstate
	jumpifbyte NO_COMMON_BITS, gMoveResultFlags, MOVE_RESULT_MISSED, BattleScript_1D70A5
	call BattleScript_1D70FB
	goto BattleScript_1D70A7

BattleScript_1D70A5: @ 81D70A5
	attackanimation
	waitanimation

BattleScript_1D70A7: @ 81D70A7
	movevaluescleanup
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage
	accuracycheck BattleScript_1D70E0, ACC_CURR_MOVE
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	tryfaintmon TARGET, FALSE, NULL
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	jumpifnexttargetvalid BattleScript_1D70A7
	tryfaintmon USER, FALSE, NULL
	end

BattleScript_1D70E0: @ 81D70E0
	effectivenesssound
	resultmessage
	waitmessage 64
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	jumpifnexttargetvalid BattleScript_1D70A7
	tryfaintmon USER, FALSE, NULL
	end

BattleScript_1D70FB: @ 81D70FB
	bicbyte gMoveResultFlags, MOVE_RESULT_MISSED
	attackanimation
	waitanimation
	orbyte gMoveResultFlags, MOVE_RESULT_MISSED
	return

BattleScript_EffectDreamEater: @ 81D710A
	attackcanceler
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_1D711F
	jumpifstatus TARGET, SLP, BattleScript_1D7129

BattleScript_1D711F: @ 81D711F
	attackstring
	ppreduce
	waitmessage 64
	goto BattleScript_WasntAffected

BattleScript_1D7129: @ 81D7129
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	negativedamage
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	jumpifmovehadnoeffect BattleScript_DreamEaterTryFaintEnd
	printstring BATTLE_TEXT_DreamEaten
	waitmessage 64

BattleScript_DreamEaterTryFaintEnd: @ 81D7167
	tryfaintmon TARGET, FALSE, NULL
	goto BattleScript_MoveEnd

BattleScript_EffectMirrorMove: @ 81D7173
	attackcanceler
	attackstring
	pause 64
	trymirrormove
	ppreduce
	orbyte gMoveResultFlags, MOVE_RESULT_FAILED
	printstring BATTLE_TEXT_MirrorFail
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectAttackUp: @ 81D718B
	setstatchanger ATTACK, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectDefenseUp: @ 81D7196
	setstatchanger DEFENSE, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpecialAttackUp: @ 81D71A1
	setstatchanger SP_ATTACK, 1, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectEvasionUp: @ 81D71AC
	setstatchanger EVASION, 1, FALSE

BattleScript_EffectStatUp: @ 81D71B2
	attackcanceler

BattleScript_EffectStatUpAfterAtkCanceler: @ 81D71B3
	attackstring
	ppreduce
	statbuffchange AFFECTS_USER | 0x1, BattleScript_StatUpEnd
	jumpifbyte NOT_EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_StatUpAttackAnim
	pause 32
	goto BattleScript_StatUpPrintString

BattleScript_StatUpAttackAnim: @ 81D71CE
	attackanimation
	waitanimation

BattleScript_StatUpDoAnim: @ 81D71D0
	setgraphicalstatchangevalues
	playanimation USER, B_ANIM_STATS_CHANGE, sANIM_ARG1

BattleScript_StatUpPrintString: @ 81D71D8
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_StatUpEnd: @ 81D71E0
	goto BattleScript_MoveEnd

BattleScript_StatUp:: @ 81D71E5
	playanimation 2, B_ANIM_STATS_CHANGE, sANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage 64
	return

BattleScript_EffectAttackDown: @ 81D71F5
	setstatchanger ATTACK, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectDefenseDown: @ 81D7200
	setstatchanger DEFENSE, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpeedDown: @ 81D720B
	setstatchanger SPEED, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectAccuracyDown: @ 81D7216
	setstatchanger ACCURACY, 1, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectEvasionDown: @ 81D7221
	setstatchanger EVASION, 1, TRUE

BattleScript_EffectStatDown: @ 81D7227
	attackcanceler
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailedAtkStringPpReduce
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	statbuffchange 1, BattleScript_StatDownEnd
	jumpifbyte LESS_THAN, cMULTISTRING_CHOOSER, 2, BattleScript_StatDownDoAnim
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 3, BattleScript_StatDownEnd
	pause 32
	goto BattleScript_StatDownPrintString

BattleScript_StatDownDoAnim: @ 81D725F
	attackanimation
	waitanimation
	setgraphicalstatchangevalues
	playanimation TARGET, B_ANIM_STATS_CHANGE, sANIM_ARG1

BattleScript_StatDownPrintString: @ 81D7269
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_StatDownEnd: @ 81D7271
	goto BattleScript_MoveEnd

BattleScript_StatDown:: @ 81D7276
	playanimation 2, B_ANIM_STATS_CHANGE, sANIM_ARG1
	printfromtable gStatDownStringIds
	waitmessage 64
	return

BattleScript_EffectHaze: @ 81D7286
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	normalisebuffs
	printstring BATTLE_TEXT_StatElim
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectBide: @ 81D7297
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_x8000000
	setbide
	goto BattleScript_MoveEnd

BattleScript_EffectRampage: @ 81D72AB
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	jumpifstatus2 USER, STATUS2_MULTIPLETURNS, BattleScript_1D72BF
	ppreduce

BattleScript_1D72BF: @ 81D72BF
	confuseifrepeatingattackends
	goto BattleScript_HitFromCritCalc

BattleScript_EffectRoar: @ 81D72C5
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_SUCTION_CUPS, BattleScript_AbilityPreventsPhasingOut
	jumpifstatus3 TARGET, STATUS3_ROOTED, BattleScript_PrintMonIsRooted
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	accuracycheck BattleScript_MoveMissed, ACC_CURR_MOVE
	forcerandomswitch BattleScript_ButItFailed

BattleScript_EffectMultiHit: @ 81D72ED
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	setmultihitcounter 0
	initmultihitstring
	setbyte sMULTIHIT_EFFECT, 0

BattleScript_MultiHitLoop: @ 81D7300
	jumpifhasnohp USER, BattleScript_MultiHitEnd
	jumpifhasnohp TARGET, BattleScript_MultiHitPrintStrings
	jumpifhalfword EQUAL, gChosenMove, MOVE_SLEEP_TALK, BattleScript_DoMultiHit
	jumpifstatus USER, SLP, BattleScript_MultiHitPrintStrings

BattleScript_DoMultiHit: @ 81D7322
	movevaluescleanup
	copybyte cEFFECT_CHOOSER, sMULTIHIT_EFFECT
	critcalc
	damagecalc
	typecalc
	jumpifmovehadnoeffect BattleScript_MultiHitNoMoreHits
	adjustnormaldamage
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	printstring BATTLE_TEXT_Terminator2
	waitmessage 1
	addbyte sMULTIHIT_STRING + 4, 1
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	jumpifbyte COMMON_BITS, gMoveResultFlags, MOVE_RESULT_FOE_ENDURED, BattleScript_MultiHitPrintStrings
	decrementmultihit BattleScript_MultiHitLoop
	goto BattleScript_MultiHitPrintStrings

BattleScript_MultiHitNoMoreHits: @ 81D7374
	pause 32

BattleScript_MultiHitPrintStrings: @ 81D7377
	resultmessage
	waitmessage 64
	jumpifmovehadnoeffect BattleScript_MultiHitEnd
	copyarray gBattleTextBuff1, sMULTIHIT_STRING, 6
	printstring BATTLE_TEXT_HitMulti
	waitmessage 64

BattleScript_MultiHitEnd: @ 81D7396
	seteffectwithchance
	tryfaintmon TARGET, FALSE, NULL
	setbyte sMOVEEND_STATE, 2
	moveend 1, 0
	setbyte sMOVEEND_STATE, 4
	moveend 0, 0
	end

BattleScript_EffectConversion: @ 81D73B1
	attackcanceler
	attackstring
	ppreduce
	tryconversiontypechange BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TypeTransform
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectFlinchHit: @ 81D73C6
	setmoveeffect EFFECT_FLINCH
	goto BattleScript_EffectHit

BattleScript_EffectRestoreHp: @ 81D73D1
	attackcanceler
	attackstring
	ppreduce
	tryhealhalfhealth BattleScript_AlreadyAtFullHp, 1
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_RegainedHealth
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectToxic: @ 81D73F4
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_IMMUNITY, BattleScript_ImmunityProtected
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus TARGET, PSN, BattleScript_AlreadyPoisoned
	jumpifstatus TARGET, TOX, BattleScript_AlreadyPoisoned
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	jumpiftype TARGET, TYPE_POISON, BattleScript_NotAffected
	jumpiftype TARGET, TYPE_STEEL, BattleScript_NotAffected
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	attackanimation
	waitanimation
	setmoveeffect EFFECT_TOXIC
	seteffectprimary
	resultmessage
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AlreadyPoisoned: @ 81D7455
	pause 64
	printstring BATTLE_TEXT_AlreadyPoisoned
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_ImmunityProtected: @ 81D7463
	copybyte gEffectBank, gBankTarget
	setbyte cMULTISTRING_CHOOSER, 0
	call BattleScript_PSNPrevention
	goto BattleScript_MoveEnd

BattleScript_EffectPayDay: @ 81D747D
	setmoveeffect EFFECT_PAYDAY
	goto BattleScript_EffectHit

BattleScript_EffectLightScreen: @ 81D7488
	attackcanceler
	attackstring
	ppreduce
	setlightscreen
	goto BattleScript_PrintReflectLightScreenSafeguardString

BattleScript_EffectTriAttack: @ 81D7491
	setmoveeffect EFFECT_TRI_ATTACK
	goto BattleScript_EffectHit

BattleScript_EffectRest: @ 81D749C
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus USER, SLP, BattleScript_RestIsAlreadyAsleep
	jumpifcantmakeasleep BattleScript_RestCantSleep
	trysetrest BattleScript_AlreadyAtFullHp
	pause 32
	printfromtable gRestUsedStringIds
	waitmessage 64
	updatestatusicon USER
	waitstate
	goto BattleScript_PresentHealTarget

BattleScript_RestCantSleep: @ 81D74C6
	pause 64
	printfromtable gUproarAwakeStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_RestIsAlreadyAsleep: @ 81D74D6
	pause 32
	printstring BATTLE_TEXT_AttackingAsleep
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectOHKO: @ 81D74E4
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	typecalc
	jumpifmovehadnoeffect BattleScript_HitFromAtkAnimation
	tryKO BattleScript_KOFail
	trysetdestinybondtohappen
	goto BattleScript_HitFromAtkAnimation

BattleScript_KOFail: @ 81D7505
	pause 64
	printfromtable gKOFailedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectRazorWind: @ 81D7515
	jumpifstatus2 USER, STATUS2_MULTIPLETURNS, BattleScript_TwoTurnMovesSecondTurn
	jumpifword COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_TwoTurnMovesSecondTurn
	setbyte sTWOTURN_STRINGID, 0
	call BattleScriptFirstChargingTurn
	goto BattleScript_MoveEnd

BattleScript_TwoTurnMovesSecondTurn: @ 81D753D
	attackcanceler
	setmoveeffect EFFECT_CHARGING
	setbyte sANIM_TURN, 1
	clearstatusfromeffect USER
	orword gHitMarker, HITMARKER_NO_PPDEDUCT
	jumpifnotmove MOVE_SKY_ATTACK, BattleScript_HitFromAccCheck
	setmoveeffect EFFECT_FLINCH
	goto BattleScript_HitFromAccCheck

BattleScriptFirstChargingTurn: @ 81D756C
	attackcanceler
	printstring BATTLE_TEXT_Terminator2
	ppreduce
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_x8000000
	setbyte cEFFECT_CHOOSER, 76
	seteffectprimary
	copybyte cMULTISTRING_CHOOSER, sTWOTURN_STRINGID
	printfromtable gFirstTurnOfTwoStringIds
	waitmessage 64
	return

BattleScript_EffectSuperFang: @ 81D7596
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	typecalc
	bicbyte gMoveResultFlags, MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	damagetohalftargethp
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectDragonRage: @ 81D75AD
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	typecalc
	bicbyte gMoveResultFlags, MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	setword gBattleMoveDamage, 40
	adjustsetdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectTrap: @ 81D75DC
	jumpifnotmove MOVE_WHIRLPOOL, BattleScript_DoWrapEffect
	jumpifnostatus3 TARGET, STATUS3_UNDERWATER, BattleScript_DoWrapEffect
	orword gHitMarker, HITMARKER_IGNORE_UNDERWATER
	setbyte sDMG_MULTIPLIER, 2

BattleScript_DoWrapEffect: @ 81D7602
	setmoveeffect EFFECT_WRAP
	goto BattleScript_EffectHit

BattleScript_EffectDoubleHit: @ 81D760D
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	setmultihitcounter 2
	initmultihitstring
	setbyte sMULTIHIT_EFFECT, 0
	goto BattleScript_MultiHitLoop

BattleScript_EffectRecoilIfMiss: @ 81D7625
	attackcanceler
	accuracycheck BattleScript_MoveMissedDoDamage, ACC_CURR_MOVE
	goto BattleScript_HitFromAtkString

BattleScript_MoveMissedDoDamage: @ 81D7632
	attackstring
	ppreduce
	pause 64
	resultmessage
	waitmessage 64
	jumpifbyte COMMON_BITS, gMoveResultFlags, MOVE_RESULT_DOESNT_AFFECT_FOE, BattleScript_MoveEnd
	printstring BATTLE_TEXT_KeptGoingCrash
	waitmessage 64
	damagecalc
	typecalc
	adjustnormaldamage
	manipulatedamage 1
	bicbyte gMoveResultFlags, MOVE_RESULT_MISSED
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	tryfaintmon USER, FALSE, NULL
	orbyte gMoveResultFlags, MOVE_RESULT_MISSED
	goto BattleScript_MoveEnd

BattleScript_EffectMist: @ 81D7676
	attackcanceler
	attackstring
	ppreduce
	setmist
	attackanimation
	waitanimation
	printfromtable gMistUsedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectFocusEnergy: @ 81D7689
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 USER, STATUS2_FOCUS_ENERGY, BattleScript_ButItFailed
	setfocusenergy
	attackanimation
	waitanimation
	printfromtable gFocusEnergyUsedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectRecoil: @ 81D76A6
	setmoveeffect EFFECT_RECOIL_25 | AFFECTS_USER | CERTAIN
	jumpifnotmove MOVE_STRUGGLE, BattleScript_EffectHit
	incrementgamestat 27
	goto BattleScript_EffectHit

BattleScript_EffectConfuse: @ 81D76BF
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_OWN_TEMPO, BattleScript_OwnTempoPrevents
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus2 TARGET, STATUS2_CONFUSION, BattleScript_AlreadyConfused
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	attackanimation
	waitanimation
	setmoveeffect EFFECT_CONFUSION
	seteffectprimary
	resultmessage
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AlreadyConfused: @ 81D76FE
	pause 32
	printstring BATTLE_TEXT_AlreadyConfused
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectAttackUp2: @ 81D770C
	setstatchanger ATTACK, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectDefenseUp2: @ 81D7717
	setstatchanger DEFENSE, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpeedUp2: @ 81D7722
	setstatchanger SPEED, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpecialAttackUp2: @ 81D772D
	setstatchanger SP_ATTACK, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectSpecialDefenseUp2: @ 81D7738
	setstatchanger SP_DEFENSE, 2, FALSE
	goto BattleScript_EffectStatUp

BattleScript_EffectTransform: @ 81D7743
	attackcanceler
	attackstring
	ppreduce
	transformdataexecution
	attackanimation
	waitanimation
	printfromtable gTransformUsedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectAttackDown2: @ 81D7756
	setstatchanger ATTACK, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectDefenseDown2: @ 81D7761
	setstatchanger DEFENSE, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpeedDown2: @ 81D776C
	setstatchanger SPEED, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectSpecialDefenseDown2: @ 81D7777
	setstatchanger SP_DEFENSE, 2, TRUE
	goto BattleScript_EffectStatDown

BattleScript_EffectReflect: @ 81D7782
	attackcanceler
	attackstring
	ppreduce
	setreflect

BattleScript_PrintReflectLightScreenSafeguardString: @ 81D7786
	attackanimation
	waitanimation
	printfromtable gReflectLightScreenSafeguardStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectPoison: @ 81D7795
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_IMMUNITY, BattleScript_ImmunityProtected
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus TARGET, PSN, BattleScript_AlreadyPoisoned
	jumpifstatus TARGET, TOX, BattleScript_AlreadyPoisoned
	jumpiftype TARGET, TYPE_POISON, BattleScript_NotAffected
	jumpiftype TARGET, TYPE_STEEL, BattleScript_NotAffected
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	attackanimation
	waitanimation
	setmoveeffect EFFECT_POISON
	seteffectprimary
	resultmessage
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectParalyze: @ 81D77F6
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_LIMBER, BattleScript_LimberProtected
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	typecalc
	jumpifmovehadnoeffect BattleScript_ButItFailed
	jumpifstatus TARGET, PAR, BattleScript_AlreadyParalyzed
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	attackanimation
	waitanimation
	setmoveeffect EFFECT_PARALYSIS
	seteffectprimary
	resultmessage
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AlreadyParalyzed: @ 81D784B
	pause 32
	printstring BATTLE_TEXT_AlreadyParalyzed
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_LimberProtected: @ 81D7859
	copybyte gEffectBank, gBankTarget
	setbyte cMULTISTRING_CHOOSER, 0
	call BattleScript_PRLZPrevention
	goto BattleScript_MoveEnd

BattleScript_EffectAttackDownHit: @ 81D7873
	setmoveeffect EFFECT_ATK_MINUS_1
	goto BattleScript_EffectHit

BattleScript_EffectDefenseDownHit: @ 81D787E
	setmoveeffect EFFECT_DEF_MINUS_1
	goto BattleScript_EffectHit

BattleScript_EffectSpeedDownHit: @ 81D7889
	setmoveeffect EFFECT_SPD_MINUS_1
	goto BattleScript_EffectHit

BattleScript_EffectSpecialAttackDownHit: @ 81D7894
	setmoveeffect EFFECT_SP_ATK_MINUS_1
	goto BattleScript_EffectHit

BattleScript_EffectSpecialDefenseDownHit: @ 81D789F
	setmoveeffect EFFECT_SP_DEF_MINUS_1
	goto BattleScript_EffectHit

BattleScript_EffectAccuracyDownHit: @ 81D78AA
	setmoveeffect EFFECT_ACC_MINUS_1
	goto BattleScript_EffectHit

BattleScript_EffectSkyAttack: @ 81D78B5
	jumpifstatus2 USER, STATUS2_MULTIPLETURNS, BattleScript_TwoTurnMovesSecondTurn
	jumpifword COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_TwoTurnMovesSecondTurn
	setbyte sTWOTURN_STRINGID, 3
	call BattleScriptFirstChargingTurn
	goto BattleScript_MoveEnd

BattleScript_EffectConfuseHit: @ 81D78DD
	setmoveeffect EFFECT_CONFUSION
	goto BattleScript_EffectHit

BattleScript_EffectTwineedle: @ 81D78E8
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	setbyte sMULTIHIT_EFFECT, 2
	attackstring
	ppreduce
	setmultihitcounter 2
	initmultihitstring
	goto BattleScript_MultiHitLoop

BattleScript_EffectSubstitute: @ 81D7900
	attackcanceler
	ppreduce
	attackstring
	waitstate
	jumpifstatus2 USER, STATUS2_SUBSTITUTE, BattleScript_AlreadyHasSubstitute
	setsubstitute
	jumpifbyte NOT_EQUAL, cMULTISTRING_CHOOSER, 1, BattleScript_SubstituteAnim
	pause 32
	goto BattleScript_SubstituteString

BattleScript_SubstituteAnim: @ 81D7922
	attackanimation
	waitanimation
	healthbarupdate USER
	datahpupdate USER

BattleScript_SubstituteString: @ 81D7928
	printfromtable gSubsituteUsedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AlreadyHasSubstitute: @ 81D7935
	pause 32
	printstring BATTLE_TEXT_SubAlready
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectRecharge: @ 81D7943
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	setmoveeffect EFFECT_RECHARGE | AFFECTS_USER | CERTAIN
	goto BattleScript_HitFromAtkString

BattleScript_MoveUsedMustRecharge:: @ 81D7956
	printstring BATTLE_TEXT_MustRecharge
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectRage: @ 81D7961
	attackcanceler
	accuracycheck BattleScript_RageMiss, ACC_CURR_MOVE
	setmoveeffect EFFECT_RAGE
	seteffectprimary
	setmoveeffect 0
	goto BattleScript_HitFromAtkString

BattleScript_RageMiss: @ 81D797B
	setmoveeffect EFFECT_RAGE
	clearstatusfromeffect USER
	goto BattleScript_PrintMoveMissed

BattleScript_EffectMimic: @ 81D7988
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	mimicattackcopy BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_LearnedMove2
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectMetronome: @ 81D79AE
	attackcanceler
	attackstring
	pause 32
	attackanimation
	waitanimation
	setbyte sANIM_TURN, 0
	setbyte sANIM_TARGETS_HIT, 0
	metronome

BattleScript_EffectLeechSeed: @ 81D79C2
	attackcanceler
	attackstring
	pause 32
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	accuracycheck BattleScript_DoLeechSeed, ACC_CURR_MOVE

BattleScript_DoLeechSeed: @ 81D79D9
	setseeded
	attackanimation
	waitanimation
	printfromtable gLeechSeedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSplash: @ 81D79E9
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	incrementgamestat 26
	printstring BATTLE_TEXT_Nothing
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectDisable: @ 81D79FB
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	disablelastusedattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_MoveWasDisabled
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectLevelDamage: @ 81D7A17
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	typecalc
	bicbyte gMoveResultFlags, MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	dmgtolevel
	adjustsetdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectPsywave: @ 81D7A2F
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	typecalc
	bicbyte gMoveResultFlags, MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	psywavedamageeffect
	adjustsetdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectCounter: @ 81D7A47
	attackcanceler
	counterdamagecalculator BattleScript_ButItFailedAtkStringPpReduce
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	typecalc2
	adjustsetdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectEncore: @ 81D7A5D
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	trysetencore BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_EncoreGot
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectPainSplit: @ 81D7A79
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	painsplitdmgcalc BattleScript_ButItFailed
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	copyword gBattleMoveDamage, sPAINSPLIT_HP
	healthbarupdate TARGET
	datahpupdate TARGET
	printstring BATTLE_TEXT_PainSplit
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSnore: @ 81D7AB0
	attackcanceler
	jumpifstatus USER, SLP, BattleScript_SnoreIsAsleep
	attackstring
	ppreduce
	goto BattleScript_ButItFailed

BattleScript_SnoreIsAsleep: @ 81D7AC2
	jumpifhalfword EQUAL, gChosenMove, MOVE_SLEEP_TALK, BattleScript_DoSnore
	printstring BATTLE_TEXT_FastAsleep
	waitmessage 64
	statusanimation USER

BattleScript_DoSnore: @ 81D7AD6
	attackstring
	ppreduce
	accuracycheck BattleScript_MoveMissed, ACC_CURR_MOVE
	setmoveeffect EFFECT_FLINCH
	goto BattleScript_HitFromCritCalc

BattleScript_EffectConversion2: @ 81D7AEA
	attackcanceler
	attackstring
	ppreduce
	settypetorandomresistance BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TypeTransform
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectLockOn: @ 81D7AFF
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	setalwayshitflag
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TookAim
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSketch: @ 81D7B21
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	copymovepermanently BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_SketchedMove
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSleepTalk: @ 81D7B40
	attackcanceler
	jumpifstatus USER, SLP, BattleScript_1D7B52
	attackstring
	ppreduce
	goto BattleScript_ButItFailed

BattleScript_1D7B52: @ 81D7B52
	printstring BATTLE_TEXT_FastAsleep
	waitmessage 64
	statusanimation USER
	attackstring
	ppreduce
	orword gHitMarker, HITMARKER_NO_PPDEDUCT
	trychoosesleeptalkmove BattleScript_SleepTalkIsAsleep
	pause 64
	goto BattleScript_ButItFailed

BattleScript_SleepTalkIsAsleep: @ 81D7B72
	attackanimation
	waitanimation
	setbyte sANIM_TURN, 0
	setbyte sANIM_TARGETS_HIT, 0
	jumptorandomattack USER

BattleScript_EffectDestinyBond: @ 81D7B82
	attackcanceler
	attackstring
	ppreduce
	setdestinybond
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_DestinyBondTake
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectFlail: @ 81D7B93
	remaininghptopower
	goto BattleScript_EffectHit

BattleScript_EffectSpite: @ 81D7B99
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	tryspiteppreduce BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_ReducedBy
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectHealBell: @ 81D7BB5
	attackcanceler
	attackstring
	ppreduce
	healpartystatus
	waitstate
	attackanimation
	waitanimation
	printfromtable gPartyStatusHealStringIds
	waitmessage 64
	jumpifnotmove MOVE_HEAL_BELL, BattleScript_PartyHealEnd
	jumpifbyte NO_COMMON_BITS, cMULTISTRING_CHOOSER, 1, BattleScript_CheckHealBellMon2Unaffected
	printstring BATTLE_TEXT_BlocksOther
	waitmessage 64

BattleScript_CheckHealBellMon2Unaffected: @ 81D7BE1
	jumpifbyte NO_COMMON_BITS, cMULTISTRING_CHOOSER, 2, BattleScript_PartyHealEnd
	printstring BATTLE_TEXT_BlocksOther2
	waitmessage 64

BattleScript_PartyHealEnd: @ 81D7BF2
	updatestatusicon ATTACKER_WITH_PARTNER
	waitstate
	goto BattleScript_MoveEnd

BattleScript_EffectTripleKick: @ 81D7BFA
	attackcanceler
	attackstring
	ppreduce
	sethword sTRIPLE_KICK_POWER, 0
	initmultihitstring
	setmultihit 3

BattleScript_TripleKickLoop: @ 81D7C0C
	jumpifhasnohp USER, BattleScript_TripleKickEnd
	jumpifhasnohp TARGET, BattleScript_TripleKickNoMoreHits
	jumpifhalfword EQUAL, gChosenMove, MOVE_SLEEP_TALK, BattleScript_DoTripleKickAttack
	jumpifstatus USER, SLP, BattleScript_TripleKickNoMoreHits

BattleScript_DoTripleKickAttack: @ 81D7C2E
	movevaluescleanup
	accuracycheck BattleScript_TripleKickNoMoreHits, ACC_CURR_MOVE
	addbyte sTRIPLE_KICK_POWER, 10
	addbyte sMULTIHIT_STRING + 4, 1
	copyhword gDynamicBasePower, sTRIPLE_KICK_POWER
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage
	jumpifmovehadnoeffect BattleScript_TripleKickNoMoreHits
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	printstring BATTLE_TEXT_Terminator2
	waitmessage 1
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	jumpifbyte COMMON_BITS, gMoveResultFlags, MOVE_RESULT_FOE_ENDURED, BattleScript_TripleKickPrintStrings
	decrementmultihit BattleScript_TripleKickLoop
	goto BattleScript_TripleKickPrintStrings

BattleScript_TripleKickNoMoreHits: @ 81D7C8D
	pause 32

BattleScript_TripleKickPrintStrings: @ 81D7C90
	resultmessage
	waitmessage 64
	jumpifbyte EQUAL, sMULTIHIT_STRING + 4, 0, BattleScript_TripleKickEnd
	copyarray gBattleTextBuff1,sMULTIHIT_STRING, 6
	printstring BATTLE_TEXT_HitMulti
	waitmessage 64

BattleScript_TripleKickEnd: @ 81D7CAF
	seteffectwithchance
	tryfaintmon TARGET, FALSE, NULL
	setbyte sMOVEEND_STATE, 14
	moveend 0, 0
	end

BattleScript_EffectThief: @ 81D7CC1
	setmoveeffect EFFECT_STEAL_ITEM
	goto BattleScript_EffectHit

BattleScript_EffectMeanLook: @ 81D7CCC
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC
	jumpifstatus2 TARGET, STATUS2_ESCAPE_PREVENTION, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setmoveeffect EFFECT_PREVENT_ESCAPE
	seteffectprimary
	printstring BATTLE_TEXT_CantEscapeNow
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectNightmare: @ 81D7CF4
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus2 TARGET, STATUS2_NIGHTMARE, BattleScript_ButItFailed
	jumpifstatus TARGET, SLP, BattleScript_NightmareWorked
	goto BattleScript_ButItFailed

BattleScript_NightmareWorked: @ 81D7D1A
	attackanimation
	waitanimation
	setmoveeffect EFFECT_NIGHTMARE
	seteffectprimary
	printstring BATTLE_TEXT_NightmareStart
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectMinimize: @ 81D7D2E
	attackcanceler
	setminimize
	setstatchanger EVASION, 1, FALSE
	goto BattleScript_EffectStatUpAfterAtkCanceler

BattleScript_EffectCurse: @ 81D7D3B
	jumpiftype2 USER, TYPE_GHOST, BattleScript_GhostCurse
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, GREATER_THAN, SPEED, 0, BattleScript_CurseTrySpeed
	jumpifstat USER, NOT_EQUAL, ATTACK, 12, BattleScript_CurseTrySpeed
	jumpifstat USER, EQUAL, DEFENSE, 12, BattleScript_ButItFailed

BattleScript_CurseTrySpeed: @ 81D7D60
	copybyte gBankTarget, gBankAttacker
	setbyte sANIM_TURN, 1
	attackanimation
	waitanimation
	setstatchanger SPEED, 1, TRUE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_CurseTryAttack
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_CurseTryAttack: @ 81D7D86
	setstatchanger ATTACK, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_CurseTryDefence
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_CurseTryDefence: @ 81D7D9A
	setstatchanger DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_CurseEnd
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_CurseEnd: @ 81D7DAE
	goto BattleScript_MoveEnd

BattleScript_GhostCurse: @ 81D7DB3
	jumpifbytenotequal gBankAttacker, gBankTarget, BattleScript_DoGhostCurse
	getmovetarget USER

BattleScript_DoGhostCurse: @ 81D7DC4
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	cursetarget BattleScript_ButItFailed
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	setbyte sANIM_TURN, 0
	attackanimation
	waitanimation
	healthbarupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_CurseLay
	waitmessage 64
	tryfaintmon USER, FALSE, NULL
	goto BattleScript_MoveEnd

BattleScript_EffectEndure: @ 81D7DFD
BattleScript_EffectProtect: @ 81D7DFD
	attackcanceler
	attackstring
	ppreduce
	setprotectlike
	attackanimation
	waitanimation
	printfromtable gProtectLikeUsedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSpikes: @ 81D7E10
	attackcanceler
	trysetspikes BattleScript_ButItFailedAtkStringPpReduce
	attackstring
	ppreduce
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_SpikesScattered
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectForesight: @ 81D7E25
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	setforesight
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_IdentifiedPoke
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectPerishSong: @ 81D7E3D
	attackcanceler
	attackstring
	ppreduce
	trysetperishsong BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_PerishSong
	waitmessage 64
	setbyte sBANK, 0

BattleScript_PerishSongLoop: @ 81D7E53
	jumpifability SCRIPTING_BANK, ABILITY_SOUNDPROOF, BattleScript_1D7E73

BattleScript_PerishSongLoopIncrement: @ 81D7E5A
	addbyte sBANK, 1
	jumpifbytenotequal sBANK, gBattlersCount, BattleScript_PerishSongLoop
	goto BattleScript_MoveEnd

BattleScript_1D7E73: @ 81D7E73
	printstring BATTLE_TEXT_BlocksOther2
	waitmessage 64
	goto BattleScript_PerishSongLoopIncrement

BattleScript_EffectSandstorm: @ 81D7E7E
	attackcanceler
	attackstring
	ppreduce
	setsandstorm
	goto BattleScript_MoveWeatherChange

BattleScript_EffectRollout: @ 81D7E87
	attackcanceler
	attackstring
	jumpifstatus2 USER, STATUS2_MULTIPLETURNS, BattleScript_RolloutCheckAccuracy
	ppreduce

BattleScript_RolloutCheckAccuracy: @ 81D7E94
	accuracycheck BattleScript_RolloutHit, ACC_CURR_MOVE

BattleScript_RolloutHit: @ 81D7E9B
	typecalc2
	rolloutdamagecalculation
	goto BattleScript_HitFromCritCalc

BattleScript_EffectSwagger: @ 81D7EA2
	attackcanceler
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_MakeMoveMissed
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	jumpifconfusedandstatmaxed 1, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setstatchanger ATTACK, 2, FALSE
	statbuffchange 1, BattleScript_SwaggerTryConfuse
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_SwaggerTryConfuse
	setgraphicalstatchangevalues
	playanimation TARGET, B_ANIM_STATS_CHANGE, sANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_SwaggerTryConfuse: @ 81D7EE5
	jumpifability TARGET, ABILITY_OWN_TEMPO, BattleScript_OwnTempoPrevents
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	setmoveeffect EFFECT_CONFUSION
	seteffectprimary
	goto BattleScript_MoveEnd

BattleScript_EffectFuryCutter: @ 81D7F00
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_FuryCutterHit, ACC_CURR_MOVE

BattleScript_FuryCutterHit: @ 81D7F0A
	furycuttercalc
	critcalc
	damagecalc
	typecalc
	jumpifmovehadnoeffect BattleScript_FuryCutterHit
	adjustnormaldamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectAttract: @ 81D7F1F
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	tryinfatuating BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_FellLove
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectFrustration: @ 81D7F3B
BattleScript_EffectReturn: @ 81D7F3B
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	happinesstodamagecalculation
	goto BattleScript_HitFromAtkString

BattleScript_EffectPresent: @ 81D7F49
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	typecalc
	presentdamagecalculation

BattleScript_EffectSafeguard: @ 81D7F55
	attackcanceler
	attackstring
	ppreduce
	setsafeguard
	goto BattleScript_PrintReflectLightScreenSafeguardString

BattleScript_EffectThawHit: @ 81D7F5E
	setmoveeffect EFFECT_BURN
	goto BattleScript_EffectHit

BattleScript_EffectMagnitude: @ 81D7F69
	attackcanceler
	attackstring
	ppreduce
	selectfirstvalidtarget
	magnitudedamagecalculation
	pause 32
	printstring BATTLE_TEXT_MagnitudeCount
	waitmessage 64
	goto BattleScript_HitsAllWithUndergroundBonusLoop

BattleScript_EffectBatonPass: @ 81D7F7C
	attackcanceler
	attackstring
	ppreduce
	jumpifcantswitch ATK4F_DONT_CHECK_STATUSES | USER, BattleScript_ButItFailed
	attackanimation
	waitanimation
	openpartyscreen USER, BattleScript_ButItFailed
	switchoutabilities USER
	waitstate
	switchhandleorder USER, 2
	returntoball USER
	getswitchedmondata USER
	switchindataupdate USER
	hpthresholds USER
	printstring 3
	switchinanim USER, 1
	waitstate
	switchineffects USER
	goto BattleScript_MoveEnd

BattleScript_EffectRapidSpin: @ 81D7FA9
	setmoveeffect EFFECT_RAPIDSPIN | CERTAIN
	goto BattleScript_EffectHit

BattleScript_EffectSonicboom: @ 81D7FB4
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	typecalc
	bicbyte gMoveResultFlags, MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	setword gBattleMoveDamage, 20
	adjustsetdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectMoonlight: @ 81D7FE3
BattleScript_EffectMorningSun: @ 81D7FE3
BattleScript_EffectSynthesis: @ 81D7FE3
	attackcanceler
	attackstring
	ppreduce
	recoverbasedonsunlight BattleScript_AlreadyAtFullHp
	goto BattleScript_PresentHealTarget

BattleScript_EffectHiddenPower: @ 81D7FF0
	hiddenpowercalc
	goto BattleScript_EffectHit

BattleScript_EffectRainDance: @ 81D7FF6
	attackcanceler
	attackstring
	ppreduce
	setrain

BattleScript_MoveWeatherChange: @ 81D7FFA
	attackanimation
	waitanimation
	printfromtable gMoveWeatherChangeStringIds
	waitmessage 64
	call BattleScript_WeatherFormChanges
	goto BattleScript_MoveEnd

BattleScript_EffectSunnyDay: @ 81D800E
	attackcanceler
	attackstring
	ppreduce
	setsunny
	goto BattleScript_MoveWeatherChange

BattleScript_EffectDefenseUpHit: @ 81D8017
	setbyte cEFFECT_CHOOSER, 80
	goto BattleScript_EffectHit

BattleScript_EffectAttackUpHit: @ 81D8022
	setbyte cEFFECT_CHOOSER, 79
	goto BattleScript_EffectHit

BattleScript_EffectAllStatsUpHit: @ 81D802D
	setbyte cEFFECT_CHOOSER, 98
	goto BattleScript_EffectHit

BattleScript_EffectBellyDrum: @ 81D8038
	attackcanceler
	attackstring
	ppreduce
	maxattackhalvehp BattleScript_ButItFailed
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	attackanimation
	waitanimation
	healthbarupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_CutHPMaxATK
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectPsychUp: @ 81D805A
	attackcanceler
	attackstring
	ppreduce
	copyfoestats BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_CopyStatChanges
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectMirrorCoat: @ 81D806F
	attackcanceler
	mirrorcoatdamagecalculator BattleScript_ButItFailedAtkStringPpReduce
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	typecalc2
	adjustsetdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectSkullBash: @ 81D8085
	jumpifstatus2 USER, STATUS2_MULTIPLETURNS, BattleScript_TwoTurnMovesSecondTurn
	jumpifword COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_TwoTurnMovesSecondTurn
	setbyte sTWOTURN_STRINGID, 2
	call BattleScriptFirstChargingTurn
	setstatchanger DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_SkullBashEnd
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_SkullBashEnd
	setgraphicalstatchangevalues
	playanimation USER, B_ANIM_STATS_CHANGE, sANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_SkullBashEnd: @ 81D80CF
	goto BattleScript_MoveEnd

BattleScript_EffectTwister: @ 81D80D4
	jumpifnostatus3 TARGET, STATUS3_ON_AIR, BattleScript_FlinchEffect
	orword gHitMarker, HITMARKER_IGNORE_ON_AIR
	setbyte sDMG_MULTIPLIER, 2

BattleScript_FlinchEffect: @ 81D80EE
	setmoveeffect EFFECT_FLINCH
	goto BattleScript_EffectHit

BattleScript_EffectEarthquake: @ 81D80F9
	attackcanceler
	attackstring
	ppreduce
	selectfirstvalidtarget

BattleScript_HitsAllWithUndergroundBonusLoop: @ 81D80FD
	movevaluescleanup
	jumpifnostatus3 TARGET, STATUS3_UNDERGROUND, BattleScript_HitsAllNoUndergroundBonus
	orword gHitMarker, HITMARKER_IGNORE_UNDERGROUND
	setbyte sDMG_MULTIPLIER, 2
	goto BattleScript_DoHitAllWithUndergroundBonus

BattleScript_HitsAllNoUndergroundBonus: @ 81D811D
	bicword gHitMarker, HITMARKER_IGNORE_UNDERGROUND
	setbyte sDMG_MULTIPLIER, 1

BattleScript_DoHitAllWithUndergroundBonus: @ 81D812C
	accuracycheck BattleScript_HitAllWithUndergroundBonusMissed, ACC_CURR_MOVE
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	printstring BATTLE_TEXT_Terminator2
	waitmessage 1
	tryfaintmon TARGET, FALSE, NULL
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	jumpifnexttargetvalid BattleScript_HitsAllWithUndergroundBonusLoop
	end

BattleScript_HitAllWithUndergroundBonusMissed: @ 81D8165
	pause 32
	typecalc
	effectivenesssound
	resultmessage
	waitmessage 64
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	jumpifnexttargetvalid BattleScript_HitsAllWithUndergroundBonusLoop
	end

BattleScript_EffectFutureSight: @ 81D817D
	attackcanceler
	attackstring
	ppreduce
	trysetfutureattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printfromtable gFutureMoveUsedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectGust: @ 81D8194
	jumpifnostatus3 TARGET, STATUS3_ON_AIR, BattleScript_EffectHit
	orword gHitMarker, HITMARKER_IGNORE_ON_AIR
	setbyte sDMG_MULTIPLIER, 2
	goto BattleScript_EffectHit

BattleScript_EffectStomp: @ 81D81B3
	jumpifnostatus3 TARGET, STATUS3_MINIMIZED, BattleScript_FlinchEffect
	setbyte sDMG_MULTIPLIER, 2
	goto BattleScript_FlinchEffect

BattleScript_EffectSolarbeam: @ 81D81C9
	jumpifabilitypresent ABILITY_CLOUD_NINE, BattleScript_SolarbeamDecideTurn
	jumpifabilitypresent ABILITY_AIR_LOCK, BattleScript_SolarbeamDecideTurn
	jumpifhalfword COMMON_BITS, gBattleWeather, 96, BattleScript_SolarbeamOnFirstTurn

BattleScript_SolarbeamDecideTurn: @ 81D81E1
	jumpifstatus2 USER, STATUS2_MULTIPLETURNS, BattleScript_TwoTurnMovesSecondTurn
	jumpifword COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_TwoTurnMovesSecondTurn
	setbyte sTWOTURN_STRINGID, 1
	call BattleScriptFirstChargingTurn
	goto BattleScript_MoveEnd

BattleScript_SolarbeamOnFirstTurn: @ 81D8209
	orword gHitMarker, HITMARKER_x8000000
	setbyte cEFFECT_CHOOSER, 76
	seteffectprimary
	ppreduce
	goto BattleScript_TwoTurnMovesSecondTurn

BattleScript_EffectThunder: @ 81D821F
	setmoveeffect EFFECT_PARALYSIS
	orword gHitMarker, HITMARKER_IGNORE_ON_AIR
	goto BattleScript_EffectHit

BattleScript_EffectTeleport: @ 81D8233
	attackcanceler
	attackstring
	ppreduce
	jumpifbattletype BATTLE_TYPE_TRAINER, BattleScript_ButItFailed
	getifcantrunfrombattle USER
	jumpifbyte EQUAL, gBattleCommunication, 1, BattleScript_ButItFailed
	jumpifbyte EQUAL, gBattleCommunication, 2, BattleScript_PrintAbilityMadeIneffective
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_FledBattle
	waitmessage 64
	setbyte gBattleOutcome, 5
	goto BattleScript_MoveEnd

BattleScript_EffectBeatUp: @ 81D826E
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	pause 32
	ppreduce
	setbyte gBattleCommunication, 0

BattleScript_BeatUpLoop: @ 81D8281
	movevaluescleanup
	trydobeatup BattleScript_BeatUpEnd, BattleScript_ButItFailed
	printstring BATTLE_TEXT_PokeAttack
	critcalc
	jumpifbyte NOT_EQUAL, gCritMultiplier, 2, BattleScript_BeatUpAttack
	manipulatedamage 2

BattleScript_BeatUpAttack: @ 81D829C
	adjustnormaldamage
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	tryfaintmon TARGET, FALSE, NULL
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	goto BattleScript_BeatUpLoop

BattleScript_BeatUpEnd: @ 81D82C4
	end

BattleScript_EffectSemiInvulnerable: @ 81D82C5
	jumpifstatus2 USER, STATUS2_MULTIPLETURNS, BattleScript_SecondTurnSemiInvulnerable
	jumpifword COMMON_BITS, gHitMarker, HITMARKER_NO_ATTACKSTRING, BattleScript_SecondTurnSemiInvulnerable
	jumpifmove MOVE_FLY, BattleScript_FirstTurnFly
	jumpifmove MOVE_DIVE, BattleScript_FirstTurnDive
	jumpifmove MOVE_BOUNCE, BattleScript_FirstTurnBounce
	setbyte sTWOTURN_STRINGID, 5
	goto BattleScript_FirstTurnSemiInvulnerable

BattleScript_FirstTurnBounce: @ 81D830C
	setbyte sTWOTURN_STRINGID, 7
	goto BattleScript_FirstTurnSemiInvulnerable

BattleScript_FirstTurnDive: @ 81D8317
	setbyte sTWOTURN_STRINGID, 6
	goto BattleScript_FirstTurnSemiInvulnerable

BattleScript_FirstTurnFly: @ 81D8322
	setbyte sTWOTURN_STRINGID, 4

BattleScript_FirstTurnSemiInvulnerable: @ 81D8328
	call BattleScriptFirstChargingTurn
	setsemiinvulnerablebit
	goto BattleScript_MoveEnd

BattleScript_SecondTurnSemiInvulnerable: @ 81D8333
	attackcanceler
	setmoveeffect EFFECT_CHARGING
	setbyte sANIM_TURN, 1
	clearstatusfromeffect USER
	orword gHitMarker, HITMARKER_NO_PPDEDUCT
	jumpifnotmove MOVE_BOUNCE, BattleScript_SemiInvulnerableTryHit
	setmoveeffect EFFECT_PARALYSIS

BattleScript_SemiInvulnerableTryHit: @ 81D835D
	accuracycheck BattleScript_SemiInvulnerableMiss, ACC_CURR_MOVE
	clearsemiinvulnerablebit
	goto BattleScript_HitFromAtkString

BattleScript_SemiInvulnerableMiss: @ 81D836A
	clearsemiinvulnerablebit
	goto BattleScript_PrintMoveMissed

BattleScript_EffectDefenseCurl: @ 81D8370
	attackcanceler
	attackstring
	ppreduce
	setdefensecurlbit
	setstatchanger DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_DefenseCurlDoStatUpAnim
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_StatUpPrintString
	attackanimation
	waitanimation

BattleScript_DefenseCurlDoStatUpAnim: @ 81D838D
	goto BattleScript_StatUpDoAnim

BattleScript_EffectSoftboiled: @ 81D8392
	attackcanceler
	attackstring
	ppreduce
	tryhealhalfhealth BattleScript_AlreadyAtFullHp, 0

BattleScript_PresentHealTarget:: @ 81D839B
	attackanimation
	waitanimation
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate TARGET
	datahpupdate TARGET
	printstring BATTLE_TEXT_RegainedHealth
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AlreadyAtFullHp:: @ 81D83B5
	pause 32
	printstring BATTLE_TEXT_HPFull
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectFakeOut: @ 81D83C3
	attackcanceler
	jumpifnotfirstturn BattleScript_ButItFailedAtkStringPpReduce
	setbyte cEFFECT_CHOOSER, 136
	goto BattleScript_EffectHit

BattleScript_ButItFailedAtkStringPpReduce: @ 81D83D4
	attackstring

BattleScript_ButItFailedPpReduce: @ 81D83D5
	ppreduce

BattleScript_ButItFailed:: @ 81D83D6
	pause 32
	orbyte gMoveResultFlags, MOVE_RESULT_FAILED
	resultmessage
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_NotAffected: @ 81D83E8
	pause 32
	orbyte gMoveResultFlags, MOVE_RESULT_DOESNT_AFFECT_FOE
	resultmessage
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectUproar: @ 81D83FA
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	setbyte cEFFECT_CHOOSER, 74
	attackstring
	jumpifstatus2 USER, STATUS2_MULTIPLETURNS, BattleScript_UproarHit
	ppreduce

BattleScript_UproarHit: @ 81D8414
	nop
	goto BattleScript_HitFromCritCalc

BattleScript_EffectStockpile: @ 81D841A
	attackcanceler
	attackstring
	ppreduce
	stockpile
	attackanimation
	waitanimation
	printfromtable gStockpileUsedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSpitUp: @ 81D842D
	attackcanceler
	jumpifbyte EQUAL, gUnknown_02024D1F + 0x5, 1, BattleScript_SpitUpFail
	attackstring
	ppreduce
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	stockpiletobasedamage BattleScript_1D844E
	typecalc
	adjustsetdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_1D844E: @ 81D844E
	pause 32
	printstring BATTLE_TEXT_SpitUpFail
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_SpitUpFail: @ 81D845C
	attackstring
	ppreduce
	pause 64
	stockpiletobasedamage BattleScript_1D844E
	resultmessage
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSwallow: @ 81D846F
	attackcanceler
	attackstring
	ppreduce
	stockpiletohpheal BattleScript_SwallowFail
	goto BattleScript_PresentHealTarget

BattleScript_SwallowFail: @ 81D847C
	pause 32
	printfromtable gSwallowFailStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectHail: @ 81D848C
	attackcanceler
	attackstring
	ppreduce
	sethail
	goto BattleScript_MoveWeatherChange

BattleScript_EffectTorment: @ 81D8495
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	settorment BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TormentSubject
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectFlatter: @ 81D84B1
	attackcanceler
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_MakeMoveMissed
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	jumpifconfusedandstatmaxed 4, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setstatchanger SP_ATTACK, 1, FALSE
	statbuffchange 1, BattleScript_FlatterTryConfuse
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_FlatterTryConfuse
	setgraphicalstatchangevalues
	playanimation TARGET, B_ANIM_STATS_CHANGE, sANIM_ARG1
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_FlatterTryConfuse: @ 81D84F4
	jumpifability TARGET, ABILITY_OWN_TEMPO, BattleScript_OwnTempoPrevents
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	setmoveeffect EFFECT_CONFUSION
	seteffectprimary
	goto BattleScript_MoveEnd

BattleScript_EffectWillOWisp: @ 81D850F
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus TARGET, BRN, BattleScript_AlreadyBurned
	jumpiftype TARGET, TYPE_FIRE, BattleScript_NotAffected
	jumpifability TARGET, ABILITY_WATER_VEIL, BattleScript_WaterVeilPrevents
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	attackanimation
	waitanimation
	setmoveeffect EFFECT_BURN
	seteffectprimary
	goto BattleScript_MoveEnd

BattleScript_WaterVeilPrevents: @ 81D855B
	copybyte gEffectBank, gBankTarget
	setbyte cMULTISTRING_CHOOSER, 0
	call BattleScript_BRNPrevention
	goto BattleScript_MoveEnd

BattleScript_AlreadyBurned: @ 81D8575
	pause 32
	printstring BATTLE_TEXT_AlreadyBurned
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectMemento: @ 81D8583
	attackcanceler
	jumpifbyte EQUAL, gUnknown_02024D1F + 0x5, 1, BattleScript_1D860A
	attackstring
	ppreduce
	jumpifattackandspecialattackcannotfall BattleScript_ButItFailed
	setatkhptozero
	attackanimation
	waitanimation
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_1D85FF
	setbyte sFIELD_1B, 0
	playstatchangeanimation TARGET, 18, 7
	playstatchangeanimation TARGET, 2, 3
	setstatchanger ATTACK, 2, TRUE
	statbuffchange 1, BattleScript_1D85D0
	jumpifbyte GREATER_THAN, cMULTISTRING_CHOOSER, 1, BattleScript_1D85D0
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_1D85D0: @ 81D85D0
	playstatchangeanimation TARGET, 16, 3
	setstatchanger SP_ATTACK, 2, TRUE
	statbuffchange 1, BattleScript_1D85F3
	jumpifbyte GREATER_THAN, cMULTISTRING_CHOOSER, 1, BattleScript_1D85F3
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_1D85F3: @ 81D85F3
	tryfaintmon USER, FALSE, NULL
	goto BattleScript_MoveEnd

BattleScript_1D85FF: @ 81D85FF
	printstring BATTLE_TEXT_NoEffect
	waitmessage 64
	goto BattleScript_1D85F3

BattleScript_1D860A: @ 81D860A
	attackstring
	ppreduce
	jumpifattackandspecialattackcannotfall BattleScript_1D8611

BattleScript_1D8611: @ 81D8611
	setatkhptozero
	pause 64
	effectivenesssound
	resultmessage
	waitmessage 64
	tryfaintmon USER, FALSE, NULL
	goto BattleScript_MoveEnd

BattleScript_EffectFacade: @ 81D8626
	jumpifstatus USER, PSN | BRN | PAR | TOX, BattleScript_FacadeDoubleDmg
	goto BattleScript_EffectHit

BattleScript_FacadeDoubleDmg: @ 81D8635
	setbyte sDMG_MULTIPLIER, 2
	goto BattleScript_EffectHit

BattleScript_EffectFocusPunch: @ 81D8640
	attackcanceler
	jumpifnodamage BattleScript_HitFromAccCheck
	ppreduce
	printstring BATTLE_TEXT_LostFocus
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSmellingsalt: @ 81D8652
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_EffectHit
	setmoveeffect EFFECT_REMOVE_PARALYSIS | CERTAIN
	jumpifstatus TARGET, PAR, BattleScript_SmellingsaltDoubleDmg
	goto BattleScript_EffectHit

BattleScript_SmellingsaltDoubleDmg: @ 81D8671
	setbyte sDMG_MULTIPLIER, 2
	goto BattleScript_EffectHit

BattleScript_EffectFollowMe: @ 81D867C
	attackcanceler
	attackstring
	ppreduce
	setforcedtarget
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_CenterAttention
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectNaturePower: @ 81D868D
	attackcanceler
	attackstring
	pause 32
	callterrainattack
	printstring BATTLE_TEXT_NaturePower
	waitmessage 64
	return

BattleScript_EffectCharge: @ 81D869A
	attackcanceler
	attackstring
	ppreduce
	setcharge
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_ChargingPower
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectTaunt: @ 81D86AB
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	settaunt BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TauntFell
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectHelpingHand: @ 81D86C7
	attackcanceler
	attackstring
	ppreduce
	trysethelpinghand BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_ReadyToHelp
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectTrick: @ 81D86DC
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	tryswapitems BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_SwitchedItems
	waitmessage 64
	printfromtable gItemSwapStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectRolePlay: @ 81D870A
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	trycopyability BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_CopiedObject
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectWish: @ 81D8726
	attackcanceler
	attackstring
	ppreduce
	trywish 0, BattleScript_ButItFailed
	attackanimation
	waitanimation
	goto BattleScript_MoveEnd

BattleScript_EffectAssist: @ 81D8736
	attackcanceler
	attackstring
	assistattackselect BattleScript_ButItFailedPpReduce
	attackanimation
	waitanimation
	setbyte sANIM_TURN, 0
	setbyte sANIM_TARGETS_HIT, 0
	jumptorandomattack USER

BattleScript_EffectIngrain: @ 81D874D
	attackcanceler
	attackstring
	ppreduce
	trysetroots BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_PlantedRoots
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSuperpower: @ 81D8762
	setmoveeffect EFFECT_ATK_DEF_DOWN | AFFECTS_USER | CERTAIN
	goto BattleScript_EffectHit

BattleScript_EffectMagicCoat: @ 81D876D
	attackcanceler
	trysetmagiccoat BattleScript_ButItFailedAtkStringPpReduce
	attackstring
	ppreduce
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_ShroudedItself
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectRecycle: @ 81D8782
	attackcanceler
	attackstring
	ppreduce
	tryrecycleitem BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_FoundOne
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectRevenge: @ 81D8797
	doubledamagedealtifdamaged
	goto BattleScript_EffectHit

BattleScript_EffectBrickBreak: @ 81D879D
	attackcanceler
	accuracycheck BattleScript_PrintMoveMissed, ACC_CURR_MOVE
	attackstring
	ppreduce
	removelightscreenreflect
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage
	jumpifbyte EQUAL, sANIM_TURN, 0, BattleScript_BrickBreakAnim
	bicbyte gMoveResultFlags, 9

BattleScript_BrickBreakAnim: @ 81D87BD
	attackanimation
	waitanimation
	jumpifbyte LESS_THAN, sANIM_TURN, 2, BattleScript_BrickBreakDoHit
	printstring BATTLE_TEXT_BrokeWall
	waitmessage 64

BattleScript_BrickBreakDoHit: @ 81D87D0
	typecalc2
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	seteffectwithchance
	tryfaintmon TARGET, FALSE, NULL
	goto BattleScript_MoveEnd

BattleScript_EffectYawn: @ 81D87EE
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_VITAL_SPIRIT, BattleScript_PrintBankAbilityMadeIneffective
	jumpifability TARGET, ABILITY_INSOMNIA, BattleScript_PrintBankAbilityMadeIneffective
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_ButItFailed
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_SafeguardProtected
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	jumpifcantmakeasleep BattleScript_ButItFailed
	setyawn BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_DrowsyMade
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_PrintBankAbilityMadeIneffective: @ 81D882F
	copybyte sBANK, sBANK_WITH_ABILITY

BattleScript_PrintAbilityMadeIneffective: @ 81D8839
	pause 32
	printstring BATTLE_TEXT_MadeIneffective2
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectKnockOff: @ 81D8847
	setmoveeffect EFFECT_KNOCK_OFF
	goto BattleScript_EffectHit

BattleScript_EffectEndeavor: @ 81D8852
	attackcanceler
	attackstring
	ppreduce
	setdamagetohealthdifference BattleScript_ButItFailed
	copyword gHpDealt, gBattleMoveDamage
	accuracycheck BattleScript_MoveMissed, ACC_CURR_MOVE
	typecalc
	jumpifmovehadnoeffect BattleScript_HitFromAtkAnimation
	bicbyte gMoveResultFlags, MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	copyword gBattleMoveDamage, gHpDealt
	adjustsetdamage
	goto BattleScript_HitFromAtkAnimation

BattleScript_EffectEruption: @ 81D888D
	scaledamagebyhealthratio
	goto BattleScript_EffectHit

BattleScript_EffectSkillSwap: @ 81D8893
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, NO_ACC_CALC_CHECK_LOCK_ON
	tryswapabilities BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_AbilitySwap
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectImprison: @ 81D88AF
	attackcanceler
	attackstring
	ppreduce
	tryimprision BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_SealedMove
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectRefresh: @ 81D88C4
	attackcanceler
	attackstring
	ppreduce
	cureifburnedparalysedorpoisoned BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_StatusNormal
	waitmessage 64
	updatestatusicon USER
	goto BattleScript_MoveEnd

BattleScript_EffectGrudge: @ 81D88DB
	attackcanceler
	attackstring
	ppreduce
	trysetgrudge BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_GrudgeBear
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectSnatch: @ 81D88F0
	attackcanceler
	trysetsnatch BattleScript_ButItFailedAtkStringPpReduce
	attackstring
	ppreduce
	attackanimation
	waitanimation
	pause 32
	printstring BATTLE_TEXT_AwaitMove
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectLowKick: @ 81D8908
	attackcanceler
	attackstring
	ppreduce
	weightdamagecalculation
	accuracycheck BattleScript_MoveMissed, ACC_CURR_MOVE
	goto BattleScript_HitFromCritCalc

BattleScript_EffectSecretPower: @ 81D8918
	getsecretpowereffect
	goto BattleScript_EffectHit

BattleScript_EffectDoubleEdge: @ 81D891E
	setmoveeffect EFFECT_RECOIL_33_PARALYSIS | AFFECTS_USER | CERTAIN
	goto BattleScript_EffectHit

BattleScript_EffectTeeterDance: @ 81D8929
	attackcanceler
	attackstring
	ppreduce
	setbyte gBankTarget, 0

BattleScript_TeeterDanceLoop: @ 81D8932
	movevaluescleanup
	setmoveeffect EFFECT_CONFUSION
	jumpifbyteequal gBankAttacker, gBankTarget, BattleScript_TeeterDanceDoMoveEndIncrement
	jumpifability TARGET, ABILITY_OWN_TEMPO, BattleScript_TeeterDanceLoopIncrement
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_TeeterDanceSubstitutePrevents
	jumpifstatus2 TARGET, STATUS2_CONFUSION, BattleScript_TeeterDanceAlreadyConfused
	accuracycheck BattleScript_TeeterDanceMissed, ACC_CURR_MOVE
	jumpifsideaffecting TARGET, SIDE_STATUS_SAFEGUARD, BattleScript_TeeterDanceSafeguardProtected
	attackanimation
	waitanimation
	seteffectprimary
	resultmessage
	waitmessage 64

BattleScript_TeeterDanceDoMoveEndIncrement: @ 81D8978
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	addbyte gBankTarget, 1
	jumpifbytenotequal gBankTarget, gBattlersCount, BattleScript_TeeterDanceLoop
	end

BattleScript_TeeterDanceLoopIncrement: @ 81D8996
	pause 32
	printstring BATTLE_TEXT_PreventedConfusion
	waitmessage 64
	goto BattleScript_TeeterDanceDoMoveEndIncrement

BattleScript_TeeterDanceSafeguardProtected: @ 81D89A4
	pause 32
	printstring BATTLE_TEXT_SafeguardActive
	waitmessage 64
	goto BattleScript_TeeterDanceDoMoveEndIncrement

BattleScript_TeeterDanceSubstitutePrevents: @ 81D89B2
	pause 32
	printstring BATTLE_TEXT_Failed
	waitmessage 64
	goto BattleScript_TeeterDanceDoMoveEndIncrement

BattleScript_TeeterDanceAlreadyConfused: @ 81D89C0
	pause 32
	printstring BATTLE_TEXT_AlreadyConfused
	waitmessage 64
	goto BattleScript_TeeterDanceDoMoveEndIncrement

BattleScript_TeeterDanceMissed: @ 81D89CE
	resultmessage
	waitmessage 64
	goto BattleScript_TeeterDanceDoMoveEndIncrement

BattleScript_EffectMudSport: @ 81D89D7
BattleScript_EffectWaterSport: @ 81D89D7
	attackcanceler
	attackstring
	ppreduce
	settypebasedhalvers BattleScript_ButItFailed
	attackanimation
	waitanimation
	printfromtable gSportsUsedStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectPoisonFang: @ 81D89EE
	setmoveeffect EFFECT_TOXIC
	goto BattleScript_EffectHit

BattleScript_EffectWeatherBall: @ 81D89F9
	setweatherballtype
	goto BattleScript_EffectHit

BattleScript_EffectOverheat: @ 81D89FF
	setmoveeffect EFFECT_SP_ATK_TWO_DOWN | AFFECTS_USER | CERTAIN
	goto BattleScript_EffectHit

BattleScript_EffectTickle: @ 81D8A0A
	attackcanceler
	attackstring
	ppreduce
	jumpifstat TARGET, GREATER_THAN, ATTACK, 0, BattleScript_TickleDoMoveAnim
	jumpifstat TARGET, EQUAL, DEFENSE, 0, BattleScript_CantLowerMultipleStats

BattleScript_TickleDoMoveAnim: @ 81D8A1F
	accuracycheck BattleScript_ButItFailed, ACC_CURR_MOVE
	attackanimation
	waitanimation
	setbyte sFIELD_1B, 0
	playstatchangeanimation TARGET, 6, 5
	playstatchangeanimation TARGET, 2, 1
	setstatchanger ATTACK, 1, TRUE
	statbuffchange 1, BattleScript_TickleTryLowerDef
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_TickleTryLowerDef
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_TickleTryLowerDef: @ 81D8A55
	playstatchangeanimation TARGET, 4, 1
	setstatchanger DEFENSE, 1, TRUE
	statbuffchange 1, BattleScript_TickleEnd
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_TickleEnd
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_TickleEnd: @ 81D8A78
	goto BattleScript_MoveEnd

BattleScript_CantLowerMultipleStats: @ 81D8A7D
	pause 32
	orbyte gMoveResultFlags, MOVE_RESULT_FAILED
	printstring BATTLE_TEXT_StatNoLower
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectCosmicPower: @ 81D8A91
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, LESS_THAN, DEFENSE, 12, BattleScript_CosmicPowerDoMoveAnim
	jumpifstat USER, EQUAL, SP_DEFENSE, 12, BattleScript_CantRaiseMultipleStats

BattleScript_CosmicPowerDoMoveAnim: @ 81D8AA6
	attackanimation
	waitanimation
	setbyte sFIELD_1B, 0
	playstatchangeanimation USER, 36, 0
	setstatchanger DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_CosmicPowerTrySpDef
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_CosmicPowerTrySpDef
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_CosmicPowerTrySpDef: @ 81D8AD1
	setstatchanger SP_DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_CosmicPowerEnd
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_CosmicPowerEnd
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_CosmicPowerEnd: @ 81D8AF0
	goto BattleScript_MoveEnd

BattleScript_EffectSkyUppercut: @ 81D8AF5
	orword gHitMarker, HITMARKER_IGNORE_ON_AIR
	goto BattleScript_EffectHit

BattleScript_EffectBulkUp: @ 81D8B03
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, LESS_THAN, ATTACK, 12, BattleScript_BulkUpDoMoveAnim
	jumpifstat USER, EQUAL, DEFENSE, 12, BattleScript_CantRaiseMultipleStats

BattleScript_BulkUpDoMoveAnim: @ 81D8B18
	attackanimation
	waitanimation
	setbyte sFIELD_1B, 0
	playstatchangeanimation USER, 6, 0
	setstatchanger ATTACK, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_BulkUpTryDef
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_BulkUpTryDef
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_BulkUpTryDef: @ 81D8B43
	setstatchanger DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_BulkUpEnd
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_BulkUpEnd
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_BulkUpEnd: @ 81D8B62
	goto BattleScript_MoveEnd

BattleScript_EffectCalmMind: @ 81D8B67
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, LESS_THAN, SP_ATTACK, 12, BattleScript_CalmMindDoMoveAnim
	jumpifstat USER, EQUAL, SP_DEFENSE, 12, BattleScript_CantRaiseMultipleStats

BattleScript_CalmMindDoMoveAnim: @ 81D8B7C
	attackanimation
	waitanimation
	setbyte sFIELD_1B, 0
	playstatchangeanimation USER, 48, 0
	setstatchanger SP_ATTACK, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_CalmMindTrySpDef
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_CalmMindTrySpDef
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_CalmMindTrySpDef: @ 81D8BA7
	setstatchanger SP_DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_CalmMindEnd
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_CalmMindEnd
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_CalmMindEnd: @ 81D8BC6
	goto BattleScript_MoveEnd

BattleScript_CantRaiseMultipleStats: @ 81D8BCB
	pause 32
	orbyte gMoveResultFlags, MOVE_RESULT_FAILED
	printstring BATTLE_TEXT_StatNoHigher
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_EffectDragonDance: @ 81D8BDF
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, LESS_THAN, ATTACK, 12, BattleScript_DragonDanceDoMoveAnim
	jumpifstat USER, EQUAL, SPEED, 12, BattleScript_CantRaiseMultipleStats

BattleScript_DragonDanceDoMoveAnim: @ 81D8BF4
	attackanimation
	waitanimation
	setbyte sFIELD_1B, 0
	playstatchangeanimation USER, 10, 0
	setstatchanger ATTACK, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_DragonDanceTrySpeed
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_DragonDanceTrySpeed
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_DragonDanceTrySpeed: @ 81D8C1F
	setstatchanger SPEED, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_DragonDanceEnd
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_DragonDanceEnd
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_DragonDanceEnd: @ 81D8C3E
	goto BattleScript_MoveEnd

BattleScript_EffectCamouflage: @ 81D8C43
	attackcanceler
	attackstring
	ppreduce
	settypetoterrain BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TypeTransform
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_FaintAttacker:: @ 81D8C58
	playfaintcry USER
	pause 64
	dofaintanimation USER
	cleareffectsonfaint USER
	printstring BATTLE_TEXT_AttackingFainted
	return

BattleScript_FaintTarget:: @ 81D8C65
	playfaintcry TARGET
	pause 64
	dofaintanimation TARGET
	cleareffectsonfaint TARGET
	printstring BATTLE_TEXT_DefendingFainted
	return

BattleScript_GiveExp:: @ 81D8C72
	setbyte sGIVEEXP_STATE, 0
	getexp TARGET
	end2

BattleScript_HandleFaintedMon:: @ 81D8C7B
	atk24 BattleScript_1D8D87
	jumpifbyte NOT_EQUAL, gBattleOutcome, 0, BattleScript_FaintedMonEnd
	jumpifbattletype BATTLE_TYPE_TRAINER, BattleScript_FaintedMonTryChooseAnother
	jumpifword NO_COMMON_BITS, gHitMarker, HITMARKER_x400000, BattleScript_FaintedMonTryChooseAnother
	printstring BATTLE_TEXT_UseNext
	setbyte gBattleCommunication, 0
	yesnobox
	jumpifbyte EQUAL, gUnknown_02024D1F, 0, BattleScript_FaintedMonTryChooseAnother
	jumpifplayerran BattleScript_FaintedMonEnd
	printstring BATTLE_TEXT_CantEscape

BattleScript_FaintedMonTryChooseAnother: @ 81D8CC2
	openpartyscreen 3, BattleScript_FaintedMonEnd
	switchhandleorder 3, 2
	jumpifnotbattletype BATTLE_TYPE_TRAINER, BattleScript_FaintedMonChooseAnother
	jumpifbattletype BATTLE_TYPE_LINK, BattleScript_FaintedMonChooseAnother
	jumpifbattletype BATTLE_TYPE_BATTLE_TOWER, BattleScript_FaintedMonChooseAnother
	jumpifbattletype BATTLE_TYPE_DOUBLE, BattleScript_FaintedMonChooseAnother
	jumpifword COMMON_BITS, gHitMarker, HITMARKER_x400000, BattleScript_FaintedMonChooseAnother
	jumpifbyte EQUAL, sBATTLE_STYLE, 1, BattleScript_FaintedMonChooseAnother
	jumpifcantswitch USER, BattleScript_FaintedMonChooseAnother
	printstring BATTLE_TEXT_WillSwitch
	setbyte gBattleCommunication, 0
	yesnobox
	jumpifbyte EQUAL, gUnknown_02024D1F, 1, BattleScript_FaintedMonChooseAnother
	setatktoplayer0
	openpartyscreen 129, BattleScript_FaintedMonChooseAnother
	switchhandleorder USER, 2
	jumpifbyte EQUAL, gBattleCommunication, 6, BattleScript_FaintedMonChooseAnother
	atknameinbuff1
	resetintrimidatetracebits USER
	hpthresholds2 USER
	printstring 2
	switchoutabilities USER
	waitstate
	returnatktoball
	waitstate
	drawpartystatussummary 1
	getswitchedmondata USER
	switchindataupdate USER
	hpthresholds USER
	printstring 3
	atk62 1
	switchinanim USER, 0
	waitstate
	switchineffects USER
	resetsentmonsvalue

BattleScript_FaintedMonChooseAnother: @ 81D8D66
	drawpartystatussummary 3
	getswitchedmondata 3
	switchindataupdate 3
	hpthresholds 3
	printstring 3
	atk62 3
	switchinanim 3, 0
	waitstate
	switchineffects 3
	jumpifbattletype BATTLE_TYPE_DOUBLE, BattleScript_FaintedMonEnd
	cancelallactions

BattleScript_FaintedMonEnd: @ 81D8D86
	end2

BattleScript_1D8D87: @ 81D8D87
	openpartyscreen 5, BattleScript_1D8D8D

BattleScript_1D8D8D: @ 81D8D8D
	switchhandleorder 3, 0
	openpartyscreen 6, BattleScript_1D8DBD
	switchhandleorder 3, 0

BattleScript_1D8D99: @ 81D8D99
	switchhandleorder 3, 2
	drawpartystatussummary 3
	getswitchedmondata 3
	switchindataupdate 3
	hpthresholds 3
	printstring 3
	atk62 3
	switchinanim 3, 0
	waitstate
	switchineffects 5
	jumpifbytenotequal gBank1, gBattlersCount, BattleScript_1D8D99

BattleScript_1D8DBD: @ 81D8DBD
	end2

BattleScript_LocalTrainerBattleWon:: @ 81D8DBE
	printstring BATTLE_TEXT_PlayerDefeatedTrainer2
	trainerslidein 1
	waitstate
	printstring BATTLE_TEXT_UnknownString
	getmoneyreward
	printstring BATTLE_TEXT_WinningPrize
	waitmessage 64

BattleScript_PayDayMoneyAndPickUpItems:: @ 81D8DCE
	givepaydaymoney
	pickup
	end2

BattleScript_LocalBattleLost:: @ 81D8DD1
	jumpifbattletype BATTLE_TYPE_BATTLE_TOWER, BattleScript_LocalBattleLostEnd
	jumpifbattletype BATTLE_TYPE_EREADER_TRAINER, BattleScript_LocalBattleLostEnd
	jumpifhalfword EQUAL, gTrainerBattleOpponent, 1024, BattleScript_LocalBattleLostEnd
	printstring BATTLE_TEXT_OutOfUsablePoke
	waitmessage 64
	printstring BATTLE_TEXT_WhitedOut
	waitmessage 64

BattleScript_LocalBattleLostEnd: @ 81D8E01
	end2

BattleScript_LinkBattleWonOrLost:: @ 81D8E02
	printstring 5
	waitmessage 64
	atk57
	waitmessage 64
	end2

gUnknown_081D8E0D:: @ 81D8E0D
	printstring BATTLE_TEXT_PlayerDefeatedTrainer2
	trainerslidein 1
	waitstate
	end2

BattleScript_SmokeBallEscape:: @ 81D8E14
	playanimation USER, B_ANIM_SMOKEBALL_ESCAPE, NULL
	printstring BATTLE_TEXT_FledUsingItem
	waitmessage 64
	end2

BattleScript_RanAwayUsingMonAbility:: @ 81D8E22
	printstring BATTLE_TEXT_FledUsingOther
	waitmessage 64
	end2

BattleScript_GotAwaySafely:: @ 81D8E29
	printstring BATTLE_TEXT_GotAwaySafely
	waitmessage 64
	end2

BattleScript_WildMonFled:: @ 81D8E30
	printstring BATTLE_TEXT_FledWild
	waitmessage 64
	end2

BattleScript_PrintCantRunFromTrainer:: @ 81D8E37
	printstring BATTLE_TEXT_NoRunning
	end2

BattleScript_PrintFailedToRunString:: @ 81D8E3B
	printfromtable gNoEscapeStringIds
	waitmessage 64
	end2

BattleScript_PrintCantEscapeFromBattle:: @ 81D8E44
	printselectionstringfromtable gNoEscapeStringIds
	endselectionscript

BattleScript_PrintFullBox:: @ 81D8E4A
	printselectionstring BATTLE_TEXT_BoxFull
	endselectionscript

BattleScript_ActionSwitch:: @ 81D8E4E
	hpthresholds2 USER
	printstring 2
	setbyte sDMG_MULTIPLIER, 2
	jumpifbyte COMMON_BITS, gBattleTypeFlags, BATTLE_TYPE_DOUBLE, BattleScript_PursuitSwitchDmgSetMultihit
	setmultihit 1
	goto BattleScript_PursuitSwitchDmgLoop

BattleScript_PursuitSwitchDmgSetMultihit: @ 81D8E6B
	setmultihit 2

BattleScript_PursuitSwitchDmgLoop: @ 81D8E6D
	jumpifnopursuitswitchdmg BattleScript_DoSwitchOut
	atk5f
	trysetdestinybondtohappen
	call BattleScript_PursuitDmgOnSwitchOut
	atk5f

BattleScript_DoSwitchOut: @ 81D8E7A
	decrementmultihit BattleScript_PursuitSwitchDmgLoop
	switchoutabilities USER
	waitstate
	returnatktoball
	waitstate
	drawpartystatussummary 1
	switchhandleorder USER, 1
	getswitchedmondata USER
	switchindataupdate USER
	hpthresholds USER
	printstring 3
	atk62 1
	switchinanim USER, 0
	waitstate
	switchineffects USER
	setbyte sMOVEEND_STATE, 4
	moveend 1, 0
	setbyte sMOVEEND_STATE, 15
	moveend 1, 0
	end2

BattleScript_PursuitDmgOnSwitchOut: @ 81D8EAD
	pause 32
	attackstring
	ppreduce
	critcalc
	damagecalc
	typecalc
	adjustnormaldamage
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	tryfaintmon TARGET, FALSE, NULL
	setbyte sMOVEEND_STATE, 3
	moveend 2, 6
	various TARGET, 4
	jumpifbyte EQUAL, gBattleCommunication, 0, BattleScript_PursuitDmgOnSwitchOutRet
	setbyte sGIVEEXP_STATE, 0
	getexp TARGET

BattleScript_PursuitDmgOnSwitchOutRet: @ 81D8EEE
	return

BattleScript_Pausex20:: @ 81D8EEF
	pause 32
	return

BattleScript_LevelUp:: @ 81D8EF3
	fanfare MUS_FANFA1
	printstring BATTLE_TEXT_GrewLevel 
	setbyte sLVLBOX_STATE, 0
	drawlvlupbox
	handlelearnnewmove BattleScript_LearnedNewMove, BattleScript_LearnMoveReturn, 1
	goto BattleScript_AskToLearnMove

BattleScript_TryLearnMoveLoop: @ 81D8F0F
	handlelearnnewmove BattleScript_LearnedNewMove, BattleScript_LearnMoveReturn, 0

BattleScript_AskToLearnMove: @ 81D8F19
	buffermovetolearn
	printstring BATTLE_TEXT_TryingToLearnMove
	printstring BATTLE_TEXT_CantLearnMore
	printstring BATTLE_TEXT_DeleteMove
	waitstate
	setbyte sLEARNMOVE_STATE, 0
	yesnoboxlearnmove BattleScript_ForgotAndLearnedNewMove
	printstring BATTLE_TEXT_StopLearning
	waitstate
	setbyte sLEARNMOVE_STATE, 0
	yesnoboxstoplearningmove BattleScript_AskToLearnMove
	printstring BATTLE_TEXT_DidNotLearn
	goto BattleScript_TryLearnMoveLoop

BattleScript_ForgotAndLearnedNewMove: @ 81D8F46
	printstring BATTLE_TEXT_MoveForget123
	printstring BATTLE_TEXT_DeletedMove
	printstring BATTLE_TEXT_MoveForgetAnd

BattleScript_LearnedNewMove: @ 81D8F4F
	buffermovetolearn
	fanfare MUS_FANFA1
	printstring BATTLE_TEXT_LearnedMove
	waitmessage 64
	updatechoicemoveonlvlup USER
	goto BattleScript_TryLearnMoveLoop

BattleScript_LearnMoveReturn: @ 81D8F61
	return

BattleScript_RainContinuesOrEnds:: @ 81D8F62
	printfromtable gRainContinuesStringIds
	waitmessage 64
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_RainContinuesOrEndsEnd
	playanimation USER, B_ANIM_RAIN_CONTINUES, NULL

BattleScript_RainContinuesOrEndsEnd: @ 81D8F7C
	end2

BattleScript_DamagingWeatherContinues:: @ 81D8F7D
	printfromtable gSandStormHailContinuesStringIds
	waitmessage 64
	playanimation2 USER, sANIM_ARG1, NULL
	setbyte gBattleCommunication, 0

BattleScript_DamagingWeatherLoop: @ 81D8F95
	copyarraywithindex gBankAttacker, gBanksByTurnOrder, gBattleCommunication, 1
	weatherdamage
	jumpifword EQUAL, gBattleMoveDamage, 0x0, BattleScript_DamagingWeatherLoopIncrement
	printfromtable gSandStormHailDmgStringIds
	waitmessage 64
	orword gHitMarker, HITMARKER_x20 | HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000 | HITMARKER_GRUDGE
	effectivenesssound
	hitanimation USER
	healthbarupdate USER
	datahpupdate USER
	tryfaintmon USER, FALSE, NULL
	atk24 BattleScript_DamagingWeatherLoopIncrement

BattleScript_DamagingWeatherLoopIncrement: @ 81D8FD6
	jumpifbyte NOT_EQUAL, gBattleOutcome, 0, BattleScript_DamagingWeatherContinuesEnd
	addbyte gBattleCommunication, 1
	jumpifbytenotequal gBattleCommunication, gBattlersCount, BattleScript_DamagingWeatherLoop

BattleScript_DamagingWeatherContinuesEnd: @ 81D8FF5
	bicword gHitMarker, HITMARKER_x20 | HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000 | HITMARKER_GRUDGE
	end2

BattleScript_SandStormHailEnds:: @ 81D8FFF
	printfromtable gSandStormHailEndStringIds
	waitmessage 64
	end2

BattleScript_SunlightContinues:: @ 81D9008
	printstring BATTLE_TEXT_SunStrong
	waitmessage 64
	playanimation USER, B_ANIM_SUN_CONTINUES, NULL
	end2

BattleScript_SunlightFaded:: @ 81D9016
	printstring BATTLE_TEXT_SunFaded
	waitmessage 64
	end2

BattleScript_OverworldWeatherStarts:: @ 81D901D
	printfromtable gWeatherContinuesStringIds
	waitmessage 64
	playanimation2 USER, sANIM_ARG1, NULL
	end3

BattleScript_SideStatusWoreOff:: @ 81D9030
	printstring BATTLE_TEXT_WoreOff
	waitmessage 64
	end2

BattleScript_SafeguardProtected: @ 81D9037
	pause 32
	printstring BATTLE_TEXT_SafeguardActive
	waitmessage 64
	end2

BattleScript_SafeguardEnds:: @ 81D9041
	pause 32
	printstring BATTLE_TEXT_SafeguardFaded
	waitmessage 64
	end2

BattleScript_LeechSeedTurnDrain:: @ 81D904B
	playanimation USER, B_ANIM_LEECH_SEED_DRAIN, sANIM_ARG1
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate USER
	datahpupdate USER
	copyword gBattleMoveDamage, gHpDealt
	jumpifability USER, ABILITY_LIQUID_OOZE, BattleScript_LeechSeedTurnPrintLiquidOoze
	manipulatedamage 0
	setbyte cMULTISTRING_CHOOSER, 3
	goto BattleScript_LeechSeedTurnPrintAndUpdateHp

BattleScript_LeechSeedTurnPrintLiquidOoze: @ 81D907D
	setbyte cMULTISTRING_CHOOSER, 4

BattleScript_LeechSeedTurnPrintAndUpdateHp: @ 81D9083
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate TARGET
	datahpupdate TARGET
	printfromtable gLeechSeedStringIds
	waitmessage 64
	tryfaintmon USER, FALSE, NULL
	tryfaintmon TARGET, FALSE, NULL
	end2

BattleScript_BideStoringEnergy:: @ 81D90A7
	printstring BATTLE_TEXT_StoringEnergy
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_BideAttack:: @ 81D90B2
	printstring BATTLE_TEXT_UnleashedEnergy
	waitmessage 64
	accuracycheck BattleScript_MoveMissed, ACC_CURR_MOVE
	typecalc
	bicbyte gMoveResultFlags, MOVE_RESULT_SUPER_EFFECTIVE | MOVE_RESULT_NOT_VERY_EFFECTIVE
	copyword gBattleMoveDamage, sBIDE_DMG
	adjustsetdamage
	setbyte sANIM_TURN, 1
	attackanimation
	waitanimation
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	resultmessage
	waitmessage 64
	tryfaintmon TARGET, FALSE, NULL
	goto BattleScript_MoveEnd

BattleScript_BideNoEnergyToAttack:: @ 81D90F1
	printstring BATTLE_TEXT_UnleashedEnergy
	waitmessage 64
	goto BattleScript_ButItFailed

BattleScript_SuccessForceOut:: @ 81D90FC
	attackanimation
	waitanimation
	switchoutabilities TARGET
	returntoball TARGET
	waitstate
	jumpifbattletype BATTLE_TYPE_TRAINER, BattleScript_TrainerBattleForceOut
	setbyte gBattleOutcome, 5
	finishaction

BattleScript_TrainerBattleForceOut: @ 81D9116
	getswitchedmondata TARGET
	switchindataupdate TARGET
	switchinanim TARGET, 0
	waitstate
	printstring BATTLE_TEXT_DraggedOut
	switchineffects TARGET
	goto BattleScript_MoveEnd

BattleScript_MistProtected:: @ 81D9128
	pause 32
	printstring BATTLE_TEXT_MistProtect
	waitmessage 64
	return

BattleScript_RageIsBuilding:: @ 81D9132
	printstring BATTLE_TEXT_RageBuilding
	waitmessage 64
	return

BattleScript_MoveUsedIsDisabled:: @ 81D9139
	printstring BATTLE_TEXT_MoveIsDisabled
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_MoveSelectionDisabledMove:: @ 81D9144
	printselectionstring BATTLE_TEXT_MoveIsDisabled
	endselectionscript

BattleScript_DisabledNoMore:: @ 81D9148
	printstring BATTLE_TEXT_DisabledNoMore
	waitmessage 64
	end2

BattleScript_EncoredNoMore:: @ 81D914F
	printstring BATTLE_TEXT_EncoreEnded
	waitmessage 64
	end2

BattleScript_DestinyBondTakesLife:: @ 81D9156
	printstring BATTLE_TEXT_DestinyBondTaken
	waitmessage 64
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate USER
	datahpupdate USER
	tryfaintmon USER, FALSE, NULL
	return

BattleScript_SpikesOnAttacker:: @ 81D9171
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate USER
	datahpupdate USER
	call BattleScript_PrintHurtBySpikes
	tryfaintmon USER, FALSE, NULL
	tryfaintmon USER, TRUE, BattleScript_SpikesOnAttackerFainted
	return

BattleScript_SpikesOnAttackerFainted: @ 81D9192
	setbyte sGIVEEXP_STATE, 0
	getexp USER
	goto BattleScript_HandleFaintedMon

BattleScript_SpikesOnTarget:: @ 81D919F
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate TARGET
	datahpupdate TARGET
	call BattleScript_PrintHurtBySpikes
	tryfaintmon TARGET, FALSE, NULL
	tryfaintmon TARGET, TRUE, BattleScript_SpikesOnTargetFainted
	return

BattleScript_SpikesOnTargetFainted: @ 81D91C0
	setbyte sGIVEEXP_STATE, 0
	getexp TARGET
	goto BattleScript_HandleFaintedMon

BattleScript_SpikesOngBank1:: @ 81D91CD
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate 3
	datahpupdate 3
	call BattleScript_PrintHurtBySpikes
	tryfaintmon GBANK_1, FALSE, NULL
	tryfaintmon GBANK_1, TRUE, BattleScript_SpikesOngBank1Fainted
	return

BattleScript_SpikesOngBank1Fainted: @ 81D91EE
	setbyte sGIVEEXP_STATE, 0
	getexp 3
	goto BattleScript_HandleFaintedMon

BattleScript_PrintHurtBySpikes: @ 81D91FB
	printstring BATTLE_TEXT_SpikesHurt
	waitmessage 64
	return

BattleScript_PerishSongHits:: @ 81D9202
	printstring BATTLE_TEXT_PerishSongFell
	waitmessage 64
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate USER
	datahpupdate USER
	tryfaintmon USER, FALSE, NULL
	end2

BattleScript_PerishSongTimerGoesDown:: @ 81D921D
	printstring BATTLE_TEXT_PerishSongFell
	waitmessage 64
	end2

BattleScript_AllStatsUp:: @ 81D9224
	jumpifstat USER, LESS_THAN, ATTACK, 12, BattleScript_AllStatsUpAtk
	jumpifstat USER, LESS_THAN, DEFENSE, 12, BattleScript_AllStatsUpAtk
	jumpifstat USER, LESS_THAN, SPEED, 12, BattleScript_AllStatsUpAtk
	jumpifstat USER, LESS_THAN, SP_ATTACK, 12, BattleScript_AllStatsUpAtk
	jumpifstat USER, EQUAL, SP_DEFENSE, 12, BattleScript_AllStatsUpRet

BattleScript_AllStatsUpAtk: @ 81D9251
	setbyte sFIELD_1B, 0
	playstatchangeanimation USER, 62, 0
	setstatchanger ATTACK, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_AllStatsUpDef
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_AllStatsUpDef: @ 81D926F
	setstatchanger DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_AllStatsUpSpeed
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_AllStatsUpSpeed: @ 81D9283
	setstatchanger SPEED, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_AllStatsUpSpAtk
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_AllStatsUpSpAtk: @ 81D9297
	setstatchanger SP_ATTACK, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_AllStatsUpSpDef
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_AllStatsUpSpDef: @ 81D92AB
	setstatchanger SP_DEFENSE, 1, FALSE
	statbuffchange AFFECTS_USER | 0x1, BattleScript_AllStatsUpRet
	printfromtable gStatUpStringIds
	waitmessage 64

BattleScript_AllStatsUpRet: @ 81D92BF
	return

BattleScript_RapidSpinAway:: @ 81D92C0
	rapidspinfree
	return

BattleScript_WrapFree:: @ 81D92C2
	printstring BATTLE_TEXT_GotFreeFrom
	waitmessage 64
	return

BattleScript_LeechSeedFree:: @ 81D92C9
	printstring BATTLE_TEXT_LeechShed
	waitmessage 64
	return

BattleScript_SpikesFree:: @ 81D92D0
	printstring BATTLE_TEXT_SpikesBlownAway
	waitmessage 64
	return

BattleScript_MonTookFutureAttack:: @ 81D92D7
	printstring BATTLE_TEXT_TookAttack
	waitmessage 64
	jumpifbyte NOT_EQUAL, cMULTISTRING_CHOOSER, 0, BattleScript_CheckDoomDesireMiss
	accuracycheck BattleScript_FutureAttackMiss, 248
	goto BattleScript_FutureAttackAnimate

BattleScript_CheckDoomDesireMiss: @ 81D92F4
	accuracycheck BattleScript_FutureAttackMiss, 353

BattleScript_FutureAttackAnimate: @ 81D92FB
	adjustnormaldamage2
	jumpifbyte NOT_EQUAL, cMULTISTRING_CHOOSER, 0, BattleScript_FutureHitAnimDoomDesire
	playanimation USER, B_ANIM_FUTURE_SIGHT_HIT, NULL
	goto BattleScript_DoFutureAttackHit

BattleScript_FutureHitAnimDoomDesire: @ 81D9313
	playanimation USER, B_ANIM_DOOM_DESIRE_HIT, NULL

BattleScript_DoFutureAttackHit: @ 81D931A
	effectivenesssound
	hitanimation TARGET
	waitstate
	healthbarupdate TARGET
	datahpupdate TARGET
	resultmessage
	waitmessage 64
	tryfaintmon TARGET, FALSE, NULL
	atk24 BattleScript_FutureAttackEnd

BattleScript_FutureAttackEnd: @ 81D9332
	setbyte sMOVEEND_STATE, 0
	moveend 1, 0
	setbyte sMOVEEND_STATE, 8
	moveend 2, 14
	setbyte gMoveResultFlags, 0
	end2

BattleScript_FutureAttackMiss: @ 81D934B
	pause 32
	setbyte gMoveResultFlags, 0
	orbyte gMoveResultFlags, MOVE_RESULT_FAILED
	resultmessage
	waitmessage 64
	setbyte gMoveResultFlags, 0
	end2

BattleScript_NoMovesLeft:: @ 81D9365
	printselectionstring BATTLE_TEXT_NoMovesLeft
	endselectionscript

BattleScript_MoveSelectionNoPP:: @ 81D9369
	printselectionstring BATTLE_TEXT_NoPP1
	endselectionscript

BattleScript_NoPPForMove:: @ 81D936D
	attackstring
	pause 32
	printstring BATTLE_TEXT_NoPP2
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_MoveSelectionTormented:: @ 81D937C
	printselectionstring BATTLE_TEXT_TormentNoUse
	endselectionscript
	printstring BATTLE_TEXT_TormentNoUse
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_MoveSelectionTaunted:: @ 81D938B
	printselectionstring BATTLE_TEXT_TauntNoUse
	endselectionscript

BattleScript_MoveUsedIsTaunted:: @ 81D938F
	printstring BATTLE_TEXT_TauntNoUse
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_WishComesTrue:: @ 81D939A
	trywish 1, BattleScript_WishButFullHp
	playanimation TARGET, B_ANIM_WISH_HEAL, NULL
	printstring BATTLE_TEXT_WishTrue
	waitmessage 64
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate TARGET
	datahpupdate TARGET
	printstring BATTLE_TEXT_RegainedHealth
	waitmessage 64
	end2

BattleScript_WishButFullHp: @ 81D93C1
	printstring BATTLE_TEXT_WishTrue
	waitmessage 64
	pause 32
	printstring BATTLE_TEXT_HPFull
	waitmessage 64
	end2

BattleScript_IngrainTurnHeal:: @ 81D93D1
	playanimation USER, B_ANIM_INGRAIN_HEAL, NULL
	printstring BATTLE_TEXT_AbsorbNutrients
	waitmessage 64
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	end2

BattleScript_PrintMonIsRooted: @ 81D93EC
	pause 32
	printstring BATTLE_TEXT_AnchoredItself
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AtkDefDown:: @ 81D93FA
	setbyte sFIELD_1B, 0
	playstatchangeanimation USER, 6, 13
	playstatchangeanimation USER, 2, 9
	setstatchanger ATTACK, 1, TRUE
	statbuffchange AFFECTS_USER | CERTAIN | 0x1, BattleScript_1D9427
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_1D9427
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_1D9427: @ 81D9427
	playstatchangeanimation USER, 4, 9
	setstatchanger DEFENSE, 1, TRUE
	statbuffchange AFFECTS_USER | CERTAIN | 0x1, BattleScript_1D944A
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_1D944A
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_1D944A: @ 81D944A
	return

BattleScript_KnockedOff:: @ 81D944B
	playanimation TARGET, B_ANIM_ITEM_KNOCKOFF, NULL
	printstring BATTLE_TEXT_KnockedOffItem
	waitmessage 64
	return

BattleScript_MoveUsedIsImprisoned:: @ 81D9459
	printstring BATTLE_TEXT_SealedNoUse
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_MoveSelectionImprisoned:: @ 81D9464
	printselectionstring BATTLE_TEXT_SealedNoUse
	endselectionscript

BattleScript_SelectingImprisionedMoveInPalace:: @ 81D9468
	printstring BATTLE_TEXT_GrudgeLosePP
	waitmessage 64
	return

BattleScript_MagicCoatBounce:: @ 81D946F
	attackstring
	ppreduce
	pause 32
	printstring BATTLE_TEXT_MagicCoatBounce
	waitmessage 64
	orword gHitMarker, HITMARKER_ATTACKSTRING_PRINTED | HITMARKER_NO_PPDEDUCT | HITMARKER_x800000
	setmagiccoattarget USER
	return

BattleScript_SnatchedMove:: @ 81D9487
	attackstring
	ppreduce
	snatchsetbanks
	playanimation TARGET, B_ANIM_SNATCH_MOVE, NULL
	printstring BATTLE_TEXT_SnatchedMove
	waitmessage 64
	orword gHitMarker, HITMARKER_ATTACKSTRING_PRINTED | HITMARKER_NO_PPDEDUCT | HITMARKER_x800000
	atk5f
	return

BattleScript_EnduredMsg:: @ 81D94A2
	printstring BATTLE_TEXT_EnduredHit
	waitmessage 64
	return

BattleScript_OneHitKOMsg:: @ 81D94A9
	printstring BATTLE_TEXT_GrandSlam
	waitmessage 64
	return

BattleScript_SAtkDown2:: @ 81D94B0
	setbyte sFIELD_1B, 0
	playstatchangeanimation USER, 16, 11
	setstatchanger SP_ATTACK, 2, TRUE
	statbuffchange AFFECTS_USER | CERTAIN | 0x1, BattleScript_1D94D9
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 2, BattleScript_1D94D9
	printfromtable gStatDownStringIds
	waitmessage 64

BattleScript_1D94D9: @ 81D94D9
	return

BattleScript_FocusPunchSetUp:: @ 81D94DA
	printstring BATTLE_TEXT_Terminator2
	waitmessage 1
	playanimation USER, B_ANIM_FOCUS_PUNCH_SET_UP, NULL
	printstring BATTLE_TEXT_TightenFocus
	waitmessage 64
	end2

BattleScript_MoveUsedIsAsleep:: @ 81D94EE
	printstring BATTLE_TEXT_FastAsleep
	waitmessage 64
	statusanimation USER
	goto BattleScript_MoveEnd

BattleScript_MoveUsedWokeUp:: @ 81D94FB
	bicword gHitMarker, HITMARKER_x10
	printfromtable gWokeUpStringIds
	waitmessage 64
	updatestatusicon USER
	return

BattleScript_MonWokeUpInUproar:: @ 81D950F
	printstring BATTLE_TEXT_UproarWoke
	waitmessage 64
	updatestatusicon USER
	end2

BattleScript_PoisonTurnDmg:: @ 81D9518
	printstring BATTLE_TEXT_PoisonHurt
	waitmessage 64

BattleScript_DoStatusTurnDmg: @ 81D951E
	statusanimation USER

BattleScript_DoTurnDmg: @ 81D9520
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate USER
	datahpupdate USER
	tryfaintmon USER, FALSE, NULL
	atk24 BattleScript_DoTurnDmgEnd

BattleScript_DoTurnDmgEnd: @ 81D9539
	end2

BattleScript_BurnTurnDmg:: @ 81D953A
	printstring BATTLE_TEXT_BurnHurt
	waitmessage 64
	goto BattleScript_DoStatusTurnDmg

BattleScript_MoveUsedIsFrozen:: @ 81D9545
	printstring BATTLE_TEXT_FrozenSolid
	waitmessage 64
	statusanimation USER
	goto BattleScript_MoveEnd

BattleScript_MoveUsedUnfroze:: @ 81D9552
	printfromtable gGotDefrostedStringIds
	waitmessage 64
	updatestatusicon USER
	return

BattleScript_DefrostedViaFireMove:: @ 81D955D
	printstring BATTLE_TEXT_DefendingDefrosted
	waitmessage 64
	updatestatusicon TARGET
	return

BattleScript_MoveUsedIsParalyzed:: @ 81D9566
	printstring BATTLE_TEXT_Paralyzed3
	waitmessage 64
	statusanimation USER
	goto BattleScript_MoveEnd

BattleScript_MoveUsedFlinched:: @ 81D9573
	printstring BATTLE_TEXT_Flinched
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_PrintUproarOverTurns:: @ 81D957E
	printfromtable gUproarOverTurnStringIds
	waitmessage 64
	end2

BattleScript_ThrashConfuses:: @ 81D9587
	chosenstatus2animation USER, STATUS2_CONFUSION
	printstring BATTLE_TEXT_FatigueConfuse
	waitmessage 64
	end2

BattleScript_MoveUsedIsConfused:: @ 81D9595
	printstring BATTLE_TEXT_Confused
	waitmessage 64
	status2animation USER, STATUS2_CONFUSION
	jumpifbyte EQUAL, cMULTISTRING_CHOOSER, 0, BattleScript_MoveUsedIsConfusedRet

BattleScript_DoSelfConfusionDmg: @ 81D95AC
	cancelmultiturnmoves USER
	adjustnormaldamage2
	printstring BATTLE_TEXT_HurtItself
	waitmessage 64
	effectivenesssound
	hitanimation USER
	waitstate
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate USER
	datahpupdate USER
	tryfaintmon USER, FALSE, NULL
	goto BattleScript_MoveEnd

BattleScript_MoveUsedIsConfusedRet: @ 81D95D3
	return

BattleScript_MoveUsedIsConfusedNoMore:: @ 81D95D4
	printstring BATTLE_TEXT_ConfusionSnapOut
	waitmessage 64
	return

BattleScript_PrintPayDayMoneyString:: @ 81D95DB
	printstring BATTLE_TEXT_PickedUpYen
	waitmessage 64
	return

BattleScript_WrapTurnDmg:: @ 81D95E2
	playanimation USER, B_ANIM_TURN_TRAP, sANIM_ARG1
	printstring BATTLE_TEXT_HurtBy
	waitmessage 64
	goto BattleScript_DoTurnDmg

BattleScript_WrapEnds:: @ 81D95F4
	printstring BATTLE_TEXT_FreedFrom
	waitmessage 64
	end2

BattleScript_MoveUsedIsInLove:: @ 81D95FB
	printstring BATTLE_TEXT_InLoveWith
	waitmessage 64
	status2animation USER, STATUS2_INFATUATION
	return

BattleScript_MoveUsedIsParalyzedCantAttack:: @ 81D9608
	printstring BATTLE_TEXT_ImmobilizedBy
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_NightmareTurnDmg:: @ 81D9613
	printstring BATTLE_TEXT_NightmareLock
	waitmessage 64
	status2animation USER, STATUS2_NIGHTMARE
	goto BattleScript_DoTurnDmg

BattleScript_CurseTurnDmg:: @ 81D9624
	printstring BATTLE_TEXT_CurseAfflict
	waitmessage 64
	status2animation USER, STATUS2_CURSED
	goto BattleScript_DoTurnDmg

BattleScript_TargetPRLZHeal:: @ 81D9635
	printstring BATTLE_TEXT_ParalysisHealed
	waitmessage 64
	updatestatusicon TARGET
	return

BattleScript_MoveEffectSleep:: @ 81D963E
	statusanimation EFFECT_BANK
	printfromtable gFellAsleepStringIds
	waitmessage 64

BattleScript_UpdateEffectStatusIconRet: @ 81D9648
	updatestatusicon EFFECT_BANK
	waitstate
	return

BattleScript_YawnMakesAsleep:: @ 81D964C
	statusanimation EFFECT_BANK
	printstring BATTLE_TEXT_FellAsleep
	waitmessage 64
	updatestatusicon EFFECT_BANK
	waitstate
	makevisible 2
	end2

BattleScript_MoveEffectPoison:: @ 81D965A
	statusanimation EFFECT_BANK
	printfromtable gGotPoisonedStringIds
	waitmessage 64
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectBurn:: @ 81D9669
	statusanimation EFFECT_BANK
	printfromtable gGotBurnedStringIds
	waitmessage 64
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectFreeze:: @ 81D9678
	statusanimation EFFECT_BANK
	printfromtable gGotFrozenStringIds
	waitmessage 64
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectParalysis:: @ 81D9687
	statusanimation EFFECT_BANK
	printfromtable gGotParalyzedStringIds
	waitmessage 64
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectUproar:: @ 81D9696
	printstring BATTLE_TEXT_UproarCaused
	waitmessage 64
	return

BattleScript_MoveEffectToxic:: @ 81D969D
	statusanimation EFFECT_BANK
	printstring BATTLE_TEXT_BadlyPoisoned
	waitmessage 64
	goto BattleScript_UpdateEffectStatusIconRet

BattleScript_MoveEffectPayDay:: @ 81D96AA
	printstring BATTLE_TEXT_CoinScatter
	waitmessage 64
	return

BattleScript_MoveEffectWrap:: @ 81D96B1
	printfromtable gWrappedStringIds
	waitmessage 64
	return

BattleScript_MoveEffectConfusion:: @ 81D96BA
	chosenstatus2animation EFFECT_BANK, STATUS2_CONFUSION
	printstring BATTLE_TEXT_BecameConfused
	waitmessage 64
	return

BattleScript_MoveEffectRecoil33:: @ 81D96C8
	jumpifmove MOVE_STRUGGLE, BattleScript_DoRecoil33
	jumpifability USER, ABILITY_ROCK_HEAD, BattleScript_Recoil33End

BattleScript_DoRecoil33: @ 81D96DB
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_HitRecoil
	waitmessage 64
	tryfaintmon USER, FALSE, NULL

BattleScript_Recoil33End: @ 81D96F5
	return

BattleScript_ItemSteal:: @ 81D96F6
	playanimation TARGET, B_ANIM_ITEM_STEAL, NULL
	printstring BATTLE_TEXT_StoleSomething
	waitmessage 64
	return

BattleScript_DrizzleActivates:: @ 81D9704
	pause 32
	printstring BATTLE_TEXT_RainMade
	waitstate
	playanimation 7, B_ANIM_RAIN_CONTINUES, NULL
	call BattleScript_WeatherFormChanges
	end3

BattleScript_SpeedBoostActivates:: @ 81D9718
	playanimation USER, B_ANIM_STATS_CHANGE, sANIM_ARG1
	printstring BATTLE_TEXT_SpeedRisen
	waitmessage 64
	end3

BattleScript_TraceActivates:: @ 81D9726
	pause 32
	printstring BATTLE_TEXT_Traced
	waitmessage 64
	end3

BattleScript_RainDishActivates:: @ 81D9730
	printstring BATTLE_TEXT_RestoredHPByItem
	waitmessage 64
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	end3

BattleScript_SandstreamActivates:: @ 81D9744
	pause 32
	printstring BATTLE_TEXT_WhipSandstorm
	waitstate
	playanimation 7, B_ANIM_SANDSTORM_CONTINUES, NULL
	call BattleScript_WeatherFormChanges
	end3

BattleScript_ShedSkinActivates:: @ 81D9758
	printstring BATTLE_TEXT_CuredProblem
	waitmessage 64
	updatestatusicon USER
	end3

BattleScript_WeatherFormChanges: @ 81D9761
	setbyte sBANK, 0

BattleScript_WeatherFormChangesLoop: @ 81D9767
	trycastformdatachange
	addbyte sBANK, 1
	jumpifbytenotequal sBANK, gBattlersCount, BattleScript_WeatherFormChangesLoop
	return

BattleScript_CastformChange:: @ 81D977D
	call BattleScript_1D9783
	end3

BattleScript_1D9783: @ 81D9783
	docastformchangeanimation
	waitstate
	printstring BATTLE_TEXT_Transformed2
	waitmessage 64
	return

gUnknown_081D978C:: @ 81D978C
	call BattleScript_1D9792
	end3

BattleScript_1D9792: @ 81D9792
	pause 32

gUnknown_081D9795:: @ 81D9795
	setbyte gBankTarget, 0
	setstatchanger ATTACK, 1, TRUE

BattleScript_1D97A1: @ 81D97A1
	trygetintimidatetarget BattleScript_1D97EF
	jumpifstatus2 TARGET, STATUS2_SUBSTITUTE, BattleScript_1D97E4
	jumpifability TARGET, ABILITY_CLEAR_BODY, BattleScript_1D97F0
	jumpifability TARGET, ABILITY_HYPER_CUTTER, BattleScript_1D97F0
	jumpifability TARGET, ABILITY_WHITE_SMOKE, BattleScript_1D97F0
	statbuffchange 33, BattleScript_1D97E4
	jumpifbyte GREATER_THAN, cMULTISTRING_CHOOSER, 1, BattleScript_1D97E4
	setgraphicalstatchangevalues
	playanimation TARGET, B_ANIM_STATS_CHANGE, sANIM_ARG1
	printstring BATTLE_TEXT_CutsAttack
	waitmessage 64

BattleScript_1D97E4: @ 81D97E4
	addbyte gBankTarget, 1
	goto BattleScript_1D97A1

BattleScript_1D97EF: @ 81D97EF
	return

BattleScript_1D97F0: @ 81D97F0
	pause 32
	printstring BATTLE_TEXT_PreventedOther
	waitmessage 64
	goto BattleScript_1D97E4

BattleScript_DroughtActivates:: @ 81D97FE
	pause 32
	printstring BATTLE_TEXT_SunIntensified
	waitstate
	playanimation 7, B_ANIM_SUN_CONTINUES, NULL
	call BattleScript_WeatherFormChanges
	end3

BattleScript_TookAttack:: @ 81D9812
	attackstring
	pause 32
	printstring BATTLE_TEXT_TookAttack2
	waitmessage 64
	orword gHitMarker, HITMARKER_ATTACKSTRING_PRINTED
	return

BattleScript_SturdyPreventsOHKO:: @ 81D9826
	pause 32
	printstring BATTLE_TEXT_ProtectedBy
	pause 64
	goto BattleScript_MoveEnd

BattleScript_DampStopsExplosion:: @ 81D9834
	pause 32
	printstring BATTLE_TEXT_PreventedBy
	pause 64
	goto BattleScript_MoveEnd

BattleScript_MoveHPDrain_PPLoss:: @ 81D9842
	ppreduce

BattleScript_MoveHPDrain:: @ 81D9843
	attackstring
	pause 32
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate TARGET
	datahpupdate TARGET
	printstring BATTLE_TEXT_HPRestoredUsing
	waitmessage 64
	orbyte gMoveResultFlags, MOVE_RESULT_DOESNT_AFFECT_FOE
	goto BattleScript_MoveEnd

BattleScript_MoveHPDrain_FullHP_PPLoss:: @ 81D9865
	ppreduce

BattleScript_MoveHPDrain_FullHP:: @ 81D9866
	attackstring
	pause 32
	printstring BATTLE_TEXT_MadeUseless
	waitmessage 64
	orbyte gMoveResultFlags, MOVE_RESULT_DOESNT_AFFECT_FOE
	goto BattleScript_MoveEnd

BattleScript_FlashFireBoost_PPLoss:: @ 81D987B
	ppreduce

BattleScript_FlashFireBoost:: @ 81D987C
	attackstring
	pause 32
	printfromtable gFlashFireStringIds
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AbilityPreventsPhasingOut: @ 81D988D
	pause 32
	printstring BATTLE_TEXT_AnchorsItself
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AbilityNoStatLoss:: @ 81D989B
	pause 32
	printstring BATTLE_TEXT_PreventedStatLoss
	waitmessage 64
	return

BattleScript_BRNPrevention:: @ 81D98A5
	pause 32
	printfromtable gBRNPreventionStringIds
	waitmessage 64
	return

BattleScript_PRLZPrevention:: @ 81D98B1
	pause 32
	printfromtable gPRLZPreventionStringIds
	waitmessage 64
	return

BattleScript_PSNPrevention:: @ 81D98BD
	pause 32
	printfromtable gPSNPreventionStringIds
	waitmessage 64
	return

BattleScript_ObliviousPreventsAttraction:: @ 81D98C9
	pause 32
	printstring BATTLE_TEXT_PreventedRomance
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_FlinchPrevention:: @ 81D98D7
	pause 32
	printstring BATTLE_TEXT_PreventedFlinching
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_OwnTempoPrevents: @ 81D98E5
	pause 32
	printstring BATTLE_TEXT_PreventedConfusion
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_SoundproofProtected:: @ 81D98F3
	attackstring
	ppreduce
	pause 32
	printstring BATTLE_TEXT_BlocksOther
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_AbilityNoSpecificStatLoss:: @ 81D9903
	pause 32
	printstring BATTLE_TEXT_PreventedLoss
	waitmessage 64
	setbyte cMULTISTRING_CHOOSER, 3
	return

BattleScript_NoItemSteal:: @ 81D9913
	pause 32
	printstring BATTLE_TEXT_MadeIneffective
	waitmessage 64
	goto BattleScript_MoveEnd

BattleScript_ColorChangeActivates:: @ 81D9921
	printstring BATTLE_TEXT_MadeType
	waitmessage 64
	return

BattleScript_RoughSkinActivates:: @ 81D9928
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_x100000
	healthbarupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_HurtOther
	waitmessage 64
	tryfaintmon USER, FALSE, NULL
	return

BattleScript_CuteCharmActivates:: @ 81D9943
	status2animation USER, STATUS2_INFATUATION
	printstring BATTLE_TEXT_InfatuatedPoke
	waitmessage 64
	return

BattleScript_ApplySecondaryEffect:: @ 81D9950
	waitstate
	seteffectsecondary
	return

BattleScript_SynchronizeActivates:: @ 81D9953
	waitstate
	seteffectprimary
	return

BattleScript_AbilityCuredStatus:: @ 81D9956
	printstring BATTLE_TEXT_CuredOfProblem
	waitmessage 64
	updatestatusicon SCRIPTING_BANK
	return

gUnknown_081D995F:: @ 81D995F
	printstring BATTLE_TEXT_IgnoredOrdersSLP
	waitmessage 64
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	end

BattleScript_IgnoresAndUsesRandomMove:: @ 81D996F
	printstring BATTLE_TEXT_IgnoredOrders
	waitmessage 64
	jumptorandomattack TARGET

BattleScript_MoveUsedLoafingAround:: @ 81D9977
	printfromtable gInobedientStringIds
	waitmessage 64
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	end

BattleScript_IgnoresAndFallsAsleep:: @ 81D9989
	printstring BATTLE_TEXT_BeganNap
	waitmessage 64
	setmoveeffect EFFECT_SLEEP | AFFECTS_USER
	seteffectprimary
	setbyte sMOVEEND_STATE, 0
	moveend 2, 16
	end

gUnknown_081D99A0:: @ 81D99A0
	printstring BATTLE_TEXT_WontObey
	waitmessage 64
	goto BattleScript_DoSelfConfusionDmg

BattleScript_SubstituteFade:: @ 81D99AB
	playanimation TARGET, B_ANIM_SUBSTITUTE_FADE, NULL
	printstring BATTLE_TEXT_SubFaded
	return

BattleScript_BerryCurePrlzEnd2:: @ 81D99B6
	call BattleScript_BerryCureParRet
	end2

BattleScript_BerryCureParRet:: @ 81D99BC
	playanimation 10, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_CuredParalysis
	waitmessage 64
	updatestatusicon SCRIPTING_BANK
	removeitem SCRIPTING_BANK
	return

BattleScript_BerryCurePsnEnd2:: @ 81D99CE
	call BattleScript_BerryCurePsnRet
	end2

BattleScript_BerryCurePsnRet:: @ 81D99D4
	playanimation 10, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_CuredPoison
	waitmessage 64
	updatestatusicon SCRIPTING_BANK
	removeitem SCRIPTING_BANK
	return

BattleScript_BerryCureBrnEnd2:: @ 81D99E6
	call BattleScript_BerryCureBrnRet
	end2

BattleScript_BerryCureBrnRet:: @ 81D99EC
	playanimation 10, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_CuredBurn
	waitmessage 64
	updatestatusicon SCRIPTING_BANK
	removeitem SCRIPTING_BANK
	return

BattleScript_BerryCureFrzEnd2:: @ 81D99FE
	call BattleScript_BerryCureFrzRet
	end2

BattleScript_BerryCureFrzRet:: @ 81D9A04
	playanimation 10, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_CuredFreeze
	waitmessage 64
	updatestatusicon SCRIPTING_BANK
	removeitem SCRIPTING_BANK
	return

BattleScript_BerryCureSlpEnd2:: @ 81D9A16
	call BattleScript_BerryCureSlpRet
	end2

BattleScript_BerryCureSlpRet:: @ 81D9A1C
	playanimation 10, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_CuredSleep
	waitmessage 64
	updatestatusicon SCRIPTING_BANK
	removeitem SCRIPTING_BANK
	return

BattleScript_BerryCureConfusionEnd2:: @ 81D9A2E
	call BattleScript_BerryCureConfusionRet
	end2

BattleScript_BerryCureConfusionRet:: @ 81D9A34
	playanimation 10, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_CuredConfusion
	waitmessage 64
	removeitem SCRIPTING_BANK
	return

BattleScript_BerryCureChosenStatusEnd2:: @ 81D9A44
	call BattleScript_BerryCureChosenStatusRet
	end2

BattleScript_BerryCureChosenStatusRet:: @ 81D9A4A
	playanimation 10, B_ANIM_ITEM_EFFECT, NULL
	printfromtable gBerryEffectStringIds
	waitmessage 64
	updatestatusicon SCRIPTING_BANK
	removeitem SCRIPTING_BANK
	return

BattleScript_WhiteHerbEnd2:: @ 81D9A5E
	call BattleScript_WhiteHerbRet
	end2

BattleScript_WhiteHerbRet:: @ 81D9A64
	playanimation 10, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_RestoredStatus
	waitmessage 64
	removeitem SCRIPTING_BANK
	return

BattleScript_ItemHealHP_RemoveItem:: @ 81D9A74
	playanimation USER, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_RestoredHealth
	waitmessage 64
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	removeitem USER
	end2

BattleScript_BerryPPHealEnd2:: @ 81D9A91
	playanimation USER, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_RestoredPP
	waitmessage 64
	removeitem USER
	end2

BattleScript_ItemHealHP_End2:: @ 81D9AA1
	call BattleScript_ItemHealHP_Ret
	end2

BattleScript_ItemHealHP_Ret:: @ 81D9AA7
	playanimation USER, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_RestoredHPLittle
	waitmessage 64
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	return

BattleScript_MoveSelectionChoiceBanded:: @ 81D9AC2
	printselectionstring BATTLE_TEXT_ChoiceBand
	endselectionscript

BattleScript_HangedOnMsg:: @ 81D9AC6
	playanimation TARGET, B_ANIM_HANGED_ON, NULL
	printstring BATTLE_TEXT_FocusSash
	waitmessage 64
	return

BattleScript_BerryConfuseHealEnd2:: @ 81D9AD4
	playanimation USER, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_RestoredHealth
	waitmessage 64
	orword gHitMarker, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_UnknownString2
	waitmessage 64
	setmoveeffect EFFECT_CONFUSION | AFFECTS_USER
	seteffectprimary
	removeitem USER
	end2

BattleScript_BerryStatRaiseEnd2:: @ 81D9AFE
	playanimation USER, B_ANIM_ITEM_EFFECT, NULL
	statbuffchange AFFECTS_USER | 0x1, BattleScript_1D9B0B

BattleScript_1D9B0B: @ 81D9B0B
	setbyte cMULTISTRING_CHOOSER, 0x4
	call BattleScript_StatUp
	removeitem USER
	end2

BattleScript_BerryFocusEnergyEnd2:: @ 81D9B19
	playanimation USER, B_ANIM_ITEM_EFFECT, NULL
	printstring BATTLE_TEXT_HustleUse
	waitmessage 64
	removeitem USER
	end2

BattleScript_ActionSelectionItemsCantBeUsed:: @ 81D9B29
	printselectionstring BATTLE_TEXT_CantUseItems
	endselectionscript

gUnknown_081D9B2D:: @ 81D9B2D
	printstring BATTLE_TEXT_Terminator2
	return
