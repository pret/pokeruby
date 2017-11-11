	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.include "asm/macros/battle_script.inc"

	.section script_data, "aw", %progbits

gBattleScriptsEffectsTable:: @ 81D6BBC
	.4byte MoveEffect_Hit
	.4byte MoveEffect_Sleep
	.4byte MoveEffect_PoisonHit
	.4byte MoveEffect_Absorb
	.4byte MoveEffect_BurnHit
	.4byte MoveEffect_FreezeHit
	.4byte MoveEffect_ParalyzeHit
	.4byte MoveEffect_Explosion
	.4byte MoveEffect_DreamEater
	.4byte MoveEffect_MirrorMove
	.4byte MoveEffect_AttackUp
	.4byte MoveEffect_DefenseUp
	.4byte MoveEffect_SpeedUp
	.4byte MoveEffect_SpecialAttackUp
	.4byte MoveEffect_SpecialDefenseUp
	.4byte MoveEffect_AccuracyUp
	.4byte MoveEffect_EvasionUp
	.4byte MoveEffect_AlwaysHit
	.4byte MoveEffect_AttackDown
	.4byte MoveEffect_DefenseDown
	.4byte MoveEffect_SpeedDown
	.4byte MoveEffect_SpecialAttackDown
	.4byte MoveEffect_SpecialDefenseDown
	.4byte MoveEffect_AccuracyDown
	.4byte MoveEffect_EvasionDown
	.4byte MoveEffect_Haze
	.4byte MoveEffect_Bide
	.4byte MoveEffect_Rampage
	.4byte MoveEffect_Roar
	.4byte MoveEffect_MultiHit
	.4byte MoveEffect_Conversion
	.4byte MoveEffect_FlinchHit
	.4byte MoveEffect_RestoreHp
	.4byte MoveEffect_Toxic
	.4byte MoveEffect_PayDay
	.4byte MoveEffect_LightScreen
	.4byte MoveEffect_TriAttack
	.4byte MoveEffect_Rest
	.4byte MoveEffect_Ohko
	.4byte MoveEffect_RazorWind
	.4byte MoveEffect_SuperFang
	.4byte MoveEffect_DragonRage
	.4byte MoveEffect_Trap
	.4byte MoveEffect_HighCritical
	.4byte MoveEffect_DoubleHit
	.4byte MoveEffect_RecoilIfMiss
	.4byte MoveEffect_Mist
	.4byte MoveEffect_FocusEnergy
	.4byte MoveEffect_Recoil
	.4byte MoveEffect_Confuse
	.4byte MoveEffect_AttackUp2
	.4byte MoveEffect_DefenseUp2
	.4byte MoveEffect_SpeedUp2
	.4byte MoveEffect_SpecialAttackUp2
	.4byte MoveEffect_SpecialDefenseUp2
	.4byte MoveEffect_AccuracyUp2
	.4byte MoveEffect_EvasionUp2
	.4byte MoveEffect_Transform
	.4byte MoveEffect_AttackDown2
	.4byte MoveEffect_DefenseDown2
	.4byte MoveEffect_SpeedDown2
	.4byte MoveEffect_SpecialAttackDown2
	.4byte MoveEffect_SpecialDefenseDown2
	.4byte MoveEffect_AccuracyDown2
	.4byte MoveEffect_EvasionDown2
	.4byte MoveEffect_Reflect
	.4byte MoveEffect_Poison
	.4byte MoveEffect_Paralyze
	.4byte MoveEffect_AttackDownHit
	.4byte MoveEffect_DefenseDownHit
	.4byte MoveEffect_SpeedDownHit
	.4byte MoveEffect_SpecialAttackDownHit
	.4byte MoveEffect_SpecialDefenseDownHit
	.4byte MoveEffect_AccuracyDownHit
	.4byte MoveEffect_EvasionDownHit
	.4byte MoveEffect_SkyAttack
	.4byte MoveEffect_ConfuseHit
	.4byte MoveEffect_Twineedle
	.4byte MoveEffect_VitalThrow
	.4byte MoveEffect_Substitute
	.4byte MoveEffect_Recharge
	.4byte MoveEffect_Rage
	.4byte MoveEffect_Mimic
	.4byte MoveEffect_Metronome
	.4byte MoveEffect_LeechSeed
	.4byte MoveEffect_Splash
	.4byte MoveEffect_Disable
	.4byte MoveEffect_LevelDamage
	.4byte MoveEffect_Psywave
	.4byte MoveEffect_Counter
	.4byte MoveEffect_Encore
	.4byte MoveEffect_PainSplit
	.4byte MoveEffect_Snore
	.4byte MoveEffect_Conversion2
	.4byte MoveEffect_LockOn
	.4byte MoveEffect_Sketch
	.4byte MoveEffect_Unused60
	.4byte MoveEffect_SleepTalk
	.4byte MoveEffect_DestinyBond
	.4byte MoveEffect_Flail
	.4byte MoveEffect_Spite
	.4byte MoveEffect_FalseSwipe
	.4byte MoveEffect_HealBell
	.4byte MoveEffect_QuickAttack
	.4byte MoveEffect_TripleKick
	.4byte MoveEffect_Thief
	.4byte MoveEffect_MeanLook
	.4byte MoveEffect_Nightmare
	.4byte MoveEffect_Minimize
	.4byte MoveEffect_Curse
	.4byte MoveEffect_Unused6E
	.4byte MoveEffect_Protect
	.4byte MoveEffect_Spikes
	.4byte MoveEffect_Foresight
	.4byte MoveEffect_PerishSong
	.4byte MoveEffect_Sandstorm
	.4byte MoveEffect_Endure
	.4byte MoveEffect_Rollout
	.4byte MoveEffect_Swagger
	.4byte MoveEffect_FuryCutter
	.4byte MoveEffect_Attract
	.4byte MoveEffect_Return
	.4byte MoveEffect_Present
	.4byte MoveEffect_Frustration
	.4byte MoveEffect_Safeguard
	.4byte MoveEffect_ThawHit
	.4byte MoveEffect_Magnitude
	.4byte MoveEffect_BatonPass
	.4byte MoveEffect_Pursuit
	.4byte MoveEffect_RapidSpin
	.4byte MoveEffect_Sonicboom
	.4byte MoveEffect_Unused83
	.4byte MoveEffect_MorningSun
	.4byte MoveEffect_Synthesis
	.4byte MoveEffect_Moonlight
	.4byte MoveEffect_HiddenPower
	.4byte MoveEffect_RainDance
	.4byte MoveEffect_SunnyDay
	.4byte MoveEffect_DefenseUpHit
	.4byte MoveEffect_AttackUpHit
	.4byte MoveEffect_AllStatsUpHit
	.4byte MoveEffect_Unused8D
	.4byte MoveEffect_BellyDrum
	.4byte MoveEffect_PsychUp
	.4byte MoveEffect_MirrorCoat
	.4byte MoveEffect_SkullBash
	.4byte MoveEffect_Twister
	.4byte MoveEffect_Earthquake
	.4byte MoveEffect_FutureSight
	.4byte MoveEffect_Gust
	.4byte MoveEffect_FlinchHit2
	.4byte MoveEffect_Solarbeam
	.4byte MoveEffect_Thunder
	.4byte MoveEffect_Teleport
	.4byte MoveEffect_BeatUp
	.4byte MoveEffect_Fly
	.4byte MoveEffect_DefenseCurl
	.4byte MoveEffect_Softboiled
	.4byte MoveEffect_FakeOut
	.4byte MoveEffect_Uproar
	.4byte MoveEffect_Stockpile
	.4byte MoveEffect_SpitUp
	.4byte MoveEffect_Swallow
	.4byte MoveEffect_UnusedA3
	.4byte MoveEffect_Hail
	.4byte MoveEffect_Torment
	.4byte MoveEffect_Flatter
	.4byte MoveEffect_WillOWisp
	.4byte MoveEffect_Memento
	.4byte MoveEffect_Facade
	.4byte MoveEffect_FocusPunch
	.4byte MoveEffect_Smellingsalt
	.4byte MoveEffect_FollowMe
	.4byte MoveEffect_NaturePower
	.4byte MoveEffect_Charge
	.4byte MoveEffect_Taunt
	.4byte MoveEffect_HelpingHand
	.4byte MoveEffect_Trick
	.4byte MoveEffect_RolePlay
	.4byte MoveEffect_Wish
	.4byte MoveEffect_Assist
	.4byte MoveEffect_Ingrain
	.4byte MoveEffect_Superpower
	.4byte MoveEffect_MagicCoat
	.4byte MoveEffect_Recycle
	.4byte MoveEffect_Revenge
	.4byte MoveEffect_BrickBreak
	.4byte MoveEffect_Yawn
	.4byte MoveEffect_KnockOff
	.4byte MoveEffect_Endeavor
	.4byte MoveEffect_Eruption
	.4byte MoveEffect_SkillSwap
	.4byte MoveEffect_Imprison
	.4byte MoveEffect_Refresh
	.4byte MoveEffect_Grudge
	.4byte MoveEffect_Snatch
	.4byte MoveEffect_LowKick
	.4byte MoveEffect_SecretPower
	.4byte MoveEffect_DoubleEdge
	.4byte MoveEffect_TeeterDance
	.4byte MoveEffect_BlazeKick
	.4byte MoveEffect_MudSport
	.4byte MoveEffect_PoisonFang
	.4byte MoveEffect_WeatherBall
	.4byte MoveEffect_Overheat
	.4byte MoveEffect_Tickle
	.4byte MoveEffect_CosmicPower
	.4byte MoveEffect_SkyUppercut
	.4byte MoveEffect_BulkUp
	.4byte MoveEffect_PoisonTail
	.4byte MoveEffect_WaterSport
	.4byte MoveEffect_CalmMind
	.4byte MoveEffect_DragonDance
	.4byte MoveEffect_Camouflage

BattleScript_1D6F14: @ 81D6F14
MoveEffect_AccuracyDown2: @ 81D6F14
MoveEffect_AccuracyUp2: @ 81D6F14
MoveEffect_AccuracyUp: @ 81D6F14
MoveEffect_AlwaysHit: @ 81D6F14
MoveEffect_EvasionDown2: @ 81D6F14
MoveEffect_EvasionDownHit: @ 81D6F14
MoveEffect_EvasionUp2: @ 81D6F14
MoveEffect_FalseSwipe: @ 81D6F14
MoveEffect_HighCritical: @ 81D6F14
MoveEffect_Hit: @ 81D6F14
MoveEffect_Pursuit: @ 81D6F14
MoveEffect_QuickAttack: @ 81D6F14
MoveEffect_SpecialAttackDown2: @ 81D6F14
MoveEffect_SpecialAttackDown: @ 81D6F14
MoveEffect_SpecialDefenseDown: @ 81D6F14
MoveEffect_SpecialDefenseUp: @ 81D6F14
MoveEffect_SpeedUp: @ 81D6F14
MoveEffect_Unused60: @ 81D6F14
MoveEffect_Unused6E: @ 81D6F14
MoveEffect_Unused83: @ 81D6F14
MoveEffect_Unused8D: @ 81D6F14
MoveEffect_UnusedA3: @ 81D6F14
MoveEffect_VitalThrow: @ 81D6F14
	jumpifhalfword 1, gCurrentMove, 57, BattleScript_1D6F3A
	jumpifspecialstatusflag TARGET, 0x40000, 1, BattleScript_1D6F3A
	orword gHitMarker, 0x40000
	setbyte gSharedMem + 0x1601F, 2

BattleScript_1D6F3A: @ 81D6F3A
	attackcanceler

BattleScript_1D6F3B: @ 81D6F3B
	accuracycheck BattleScript_1D6F72, 0

BattleScript_1D6F42: @ 81D6F42
	attackstring
	ppreduce

BattleScript_1D6F44:: @ 81D6F44
	critcalc
	atk5
	atk6
	atk7

BattleScript_1D6F48: @ 81D6F48
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	seteffectwithchancetarget
	faintpokemon TARGET, 0, 0x0

BattleScript_EndTurn:: @ 81D6F62
	setbyte gSharedMem + 0x1600C, 0
	atk49 0, 0
	end

BattleScript_1D6F6C: @ 81D6F6C
	orbyte gBattleMoveFlags, 1

BattleScript_1D6F72: @ 81D6F72
	attackstring
	ppreduce

BattleScript_1D6F74:: @ 81D6F74
	pause 32

BattleScript_1D6F77: @ 81D6F77
	missmessage
	resultmessage
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Sleep: @ 81D6F81
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus TARGET, SLP, BattleScript_1D6FC4
	jumpifcannotsleep BattleScript_1D6FE0
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	attackanimation
	waitanimation
	setbyte gUnknown_02024D1F + 0x2, 1
	seteffecttarget
	jump BattleScript_EndTurn

BattleScript_1D6FC4: @ 81D6FC4
	pause 32
	printstring BATTLE_TEXT_DefendingAsleep
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D6FD2: @ 81D6FD2
	pause 32
	printstring BATTLE_TEXT_WasntAffected
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D6FE0: @ 81D6FE0
	pause 32
	printfromtable BattleTextList_40156A
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_PoisonHit: @ 81D6FF0
MoveEffect_PoisonTail: @ 81D6FF0
	setbyte gUnknown_02024D1F + 0x2, 2
	jump BattleScript_1D6F14

MoveEffect_Absorb: @ 81D6FFB
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	critcalc
	atk5
	atk6
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	negativedamage
	orword gHitMarker, 0x100
	jumpifability TARGET, ABILITY_LIQUID_OOZE, BattleScript_1D7037
	setbyte gUnknown_02024D1F + 0x4, 0
	jump BattleScript_1D703F

BattleScript_1D7037: @ 81D7037
	manipulatedamage 0
	setbyte gUnknown_02024D1F + 0x4, 1

BattleScript_1D703F: @ 81D703F
	graphicalhpupdate USER
	datahpupdate USER
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_1D7056
	printfromtable BattleTextList_4015D0
	waitmessage 64

BattleScript_1D7056: @ 81D7056
	faintpokemon USER, 0, 0x0
	faintpokemon TARGET, 0, 0x0
	jump BattleScript_EndTurn

MoveEffect_BlazeKick: @ 81D7069
MoveEffect_BurnHit: @ 81D7069
	setbyte gUnknown_02024D1F + 0x2, 3
	jump BattleScript_1D6F14

MoveEffect_FreezeHit: @ 81D7074
	setbyte gUnknown_02024D1F + 0x2, 4
	jump BattleScript_1D6F14

MoveEffect_ParalyzeHit: @ 81D707F
	setbyte gUnknown_02024D1F + 0x2, 5
	jump BattleScript_1D6F14

MoveEffect_Explosion: @ 81D708A
	attackcanceler
	attackstring
	ppreduce
	faintifabilitynotdamp
	setuserhptozero
	waitstateatk
	jumpifbyte 5, gBattleMoveFlags, 1, BattleScript_1D70A5
	callatk BattleScript_1D70FB
	jump BattleScript_1D70A7

BattleScript_1D70A5: @ 81D70A5
	attackanimation
	waitanimation

BattleScript_1D70A7: @ 81D70A7
	atk25
	critcalc
	atk5
	atk6
	atk7
	accuracycheck BattleScript_1D70E0, 0
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	faintpokemon TARGET, 0, 0x0
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	jumpwhiletargetvalid BattleScript_1D70A7
	faintpokemon USER, 0, 0x0
	end

BattleScript_1D70E0: @ 81D70E0
	missmessage
	resultmessage
	waitmessage 64
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	jumpwhiletargetvalid BattleScript_1D70A7
	faintpokemon USER, 0, 0x0
	end

BattleScript_1D70FB: @ 81D70FB
	bicbyte gBattleMoveFlags, 1
	attackanimation
	waitanimation
	orbyte gBattleMoveFlags, 1
	return

MoveEffect_DreamEater: @ 81D710A
	attackcanceler
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_1D711F
	jumpifstatus TARGET, SLP, BattleScript_1D7129

BattleScript_1D711F: @ 81D711F
	attackstring
	ppreduce
	waitmessage 64
	jump BattleScript_1D6FD2

BattleScript_1D7129: @ 81D7129
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	critcalc
	atk5
	atk6
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	negativedamage
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_1D7167
	printstring BATTLE_TEXT_DreamEaten
	waitmessage 64

BattleScript_1D7167: @ 81D7167
	faintpokemon TARGET, 0, 0x0
	jump BattleScript_EndTurn

MoveEffect_MirrorMove: @ 81D7173
	attackcanceler
	attackstring
	pause 64
	jumptolastusedattack
	ppreduce
	orbyte gBattleMoveFlags, 32
	printstring BATTLE_TEXT_MirrorFail
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_AttackUp: @ 81D718B
	setbyte gSharedMem + 0x1601E, 17
	jump BattleScript_1D71B2

MoveEffect_DefenseUp: @ 81D7196
	setbyte gSharedMem + 0x1601E, 18
	jump BattleScript_1D71B2

MoveEffect_SpecialAttackUp: @ 81D71A1
	setbyte gSharedMem + 0x1601E, 20
	jump BattleScript_1D71B2

MoveEffect_EvasionUp: @ 81D71AC
	setbyte gSharedMem + 0x1601E, 23

BattleScript_1D71B2: @ 81D71B2
	attackcanceler

BattleScript_1D71B3: @ 81D71B3
	attackstring
	ppreduce
	statbuffchange 65, BattleScript_1D71E0
	jumpifbyte 1, gUnknown_02024D1F + 0x4, 2, BattleScript_1D71CE
	pause 32
	jump BattleScript_1D71D8

BattleScript_1D71CE: @ 81D71CE
	attackanimation
	waitanimation

BattleScript_1D71D0: @ 81D71D0
	atk47
	playanimation USER, 1, gSharedMem + 0x160A4

BattleScript_1D71D8: @ 81D71D8
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D71E0: @ 81D71E0
	jump BattleScript_EndTurn

BattleScript_StatUp:: @ 81D71E5
	playanimation 2, 1, gSharedMem + 0x160A4
	printfromtable BattleTextList_401570
	waitmessage 64
	return

MoveEffect_AttackDown: @ 81D71F5
	setbyte gSharedMem + 0x1601E, 145
	jump BattleScript_1D7227

MoveEffect_DefenseDown: @ 81D7200
	setbyte gSharedMem + 0x1601E, 146
	jump BattleScript_1D7227

MoveEffect_SpeedDown: @ 81D720B
	setbyte gSharedMem + 0x1601E, 147
	jump BattleScript_1D7227

MoveEffect_AccuracyDown: @ 81D7216
	setbyte gSharedMem + 0x1601E, 150
	jump BattleScript_1D7227

MoveEffect_EvasionDown: @ 81D7221
	setbyte gSharedMem + 0x1601E, 151

BattleScript_1D7227: @ 81D7227
	attackcanceler
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_1D83D4
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	statbuffchange 1, BattleScript_1D7271
	jumpifbyte 3, gUnknown_02024D1F + 0x4, 2, BattleScript_1D725F
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 3, BattleScript_1D7271
	pause 32
	jump BattleScript_1D7269

BattleScript_1D725F: @ 81D725F
	attackanimation
	waitanimation
	atk47
	playanimation TARGET, 1, gSharedMem + 0x160A4

BattleScript_1D7269: @ 81D7269
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D7271: @ 81D7271
	jump BattleScript_EndTurn

BattleScript_StatDown:: @ 81D7276
	playanimation 2, 1, gSharedMem + 0x160A4
	printfromtable BattleTextList_40157C
	waitmessage 64
	return

MoveEffect_Haze: @ 81D7286
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	normalisebuffs
	printstring BATTLE_TEXT_StatElim
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Bide: @ 81D7297
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	orword gHitMarker, 0x8000000
	setbide
	jump BattleScript_EndTurn

MoveEffect_Rampage: @ 81D72AB
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	jumpifsecondarytstatus USER, S_CONTINUE, BattleScript_1D72BF
	ppreduce

BattleScript_1D72BF: @ 81D72BF
	confuseifrepeatingattackends
	jump BattleScript_1D6F44

MoveEffect_Roar: @ 81D72C5
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_SUCTION_CUPS, BattleScript_1D988D
	jumpifspecialstatusflag TARGET, 0x400, 0, BattleScript_1D93EC
	accuracycheck BattleScript_ButItFailed, 65535
	accuracycheck BattleScript_1D6F77, 0
	forcerandomswitch BattleScript_ButItFailed

MoveEffect_MultiHit: @ 81D72ED
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	setloopcounter 0
	atk8e
	setbyte gSharedMem + 0x16112, 0

BattleScript_1D7300: @ 81D7300
	jumpiffainted USER, BattleScript_1D7396
	jumpiffainted TARGET, BattleScript_1D7377
	jumpifhalfword 0, gUnknown_02024BE8, 214, BattleScript_1D7322
	jumpifstatus USER, SLP, BattleScript_1D7377

BattleScript_1D7322: @ 81D7322
	atk25
	copyarray gUnknown_02024D1F + 0x2, gSharedMem + 0x16112, 1
	critcalc
	atk5
	atk6
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_1D7374
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	printstring BATTLE_TEXT_Terminator2
	waitmessage 1
	addbyte gSharedMem + 0x160E4, 1
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	jumpifbyte 4, gBattleMoveFlags, 64, BattleScript_1D7377
	atk27 BattleScript_1D7300
	jump BattleScript_1D7377

BattleScript_1D7374: @ 81D7374
	pause 32

BattleScript_1D7377: @ 81D7377
	resultmessage
	waitmessage 64
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_1D7396
	copyarray gBattleTextBuff1, gSharedMem + 0x160E0, 6
	printstring BATTLE_TEXT_HitMulti
	waitmessage 64

BattleScript_1D7396: @ 81D7396
	seteffectwithchancetarget
	faintpokemon TARGET, 0, 0x0
	setbyte gSharedMem + 0x1600C, 2
	atk49 1, 0
	setbyte gSharedMem + 0x1600C, 4
	atk49 0, 0
	end

MoveEffect_Conversion: @ 81D73B1
	attackcanceler
	attackstring
	ppreduce
	changetypestoenemyattacktype BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TypeTransform
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_FlinchHit: @ 81D73C6
	setbyte gUnknown_02024D1F + 0x2, 8
	jump BattleScript_1D6F14

MoveEffect_RestoreHp: @ 81D73D1
	attackcanceler
	attackstring
	ppreduce
	setdamageasrestorehalfmaxhp BattleScript_1D83B5, 1
	attackanimation
	waitanimation
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_RegainedHealth
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Toxic: @ 81D73F4
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_IMMUNITY, BattleScript_1D7463
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus TARGET, PSN, BattleScript_1D7455
	jumpifstatus TARGET, TOX, BattleScript_1D7455
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	jumpiftype TARGET, TYPE_POISON, BattleScript_1D83E8
	jumpiftype TARGET, TYPE_STEEL, BattleScript_1D83E8
	accuracycheck BattleScript_ButItFailed, 0
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	attackanimation
	waitanimation
	setbyte gUnknown_02024D1F + 0x2, 6
	seteffecttarget
	resultmessage
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D7455: @ 81D7455
	pause 64
	printstring BATTLE_TEXT_AlreadyPoisoned
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D7463: @ 81D7463
	copyarray gEffectBank, gBankTarget, 1
	setbyte gUnknown_02024D1F + 0x4, 0
	callatk BattleScript_PSNPrevention
	jump BattleScript_EndTurn

MoveEffect_PayDay: @ 81D747D
	setbyte gUnknown_02024D1F + 0x2, 11
	jump BattleScript_1D6F14

MoveEffect_LightScreen: @ 81D7488
	attackcanceler
	attackstring
	ppreduce
	setlightscreen
	jump BattleScript_1D7786

MoveEffect_TriAttack: @ 81D7491
	setbyte gUnknown_02024D1F + 0x2, 9
	jump BattleScript_1D6F14

MoveEffect_Rest: @ 81D749C
	attackcanceler
	attackstring
	ppreduce
	jumpifstatus USER, SLP, BattleScript_1D74D6
	jumpifcannotsleep BattleScript_1D74C6
	setrest BattleScript_1D83B5
	pause 32
	printfromtable BattleTextList_401556
	waitmessage 64
	atk98 1
	waitstateatk
	jump BattleScript_1D839B

BattleScript_1D74C6: @ 81D74C6
	pause 64
	printfromtable BattleTextList_40156A
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D74D6: @ 81D74D6
	pause 32
	printstring BATTLE_TEXT_AttackingAsleep
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Ohko: @ 81D74E4
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 65535
	atk6
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_1D6F48
	koplussomethings BattleScript_1D7505
	atkab
	jump BattleScript_1D6F48

BattleScript_1D7505: @ 81D7505
	pause 64
	printfromtable BattleTextList_4015C8
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_RazorWind: @ 81D7515
	jumpifsecondarytstatus USER, S_CONTINUE, BattleScript_1D753D
	jumpifword 4, gHitMarker, 0x200, BattleScript_1D753D
	setbyte gSharedMem + 0x16055, 0
	callatk BattleScript_1D756C
	jump BattleScript_EndTurn

BattleScript_1D753D: @ 81D753D
	attackcanceler
	setbyte gUnknown_02024D1F + 0x2, 12
	setbyte gSharedMem + 0x16002, 1
	clearstatus USER
	orword gHitMarker, 0x800
	jumpifhalfword 1, gCurrentMove, 143, BattleScript_1D6F3B
	setbyte gUnknown_02024D1F + 0x2, 8
	jump BattleScript_1D6F3B

BattleScript_1D756C: @ 81D756C
	attackcanceler
	printstring BATTLE_TEXT_Terminator2
	ppreduce
	attackanimation
	waitanimation
	orword gHitMarker, 0x8000000
	setbyte gUnknown_02024D1F + 0x2, 76
	seteffecttarget
	copyarray gUnknown_02024D1F + 0x4, gSharedMem + 0x16055, 1
	printfromtable BattleTextList_401584
	waitmessage 64
	return

MoveEffect_SuperFang: @ 81D7596
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	atk6
	bicbyte gBattleMoveFlags, 6
	gethalfcurrentenemyhp
	jump BattleScript_1D6F48

MoveEffect_DragonRage: @ 81D75AD
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	atk6
	bicbyte gBattleMoveFlags, 6
	setbyte gBattleMoveDamage, 40
	setbyte gBattleMoveDamage + 0x1, 0
	setbyte gBattleMoveDamage + 0x2, 0
	setbyte gBattleMoveDamage + 0x3, 0
	atk69
	jump BattleScript_1D6F48

MoveEffect_Trap: @ 81D75DC
	jumpifhalfword 1, gCurrentMove, 250, BattleScript_1D7602
	jumpifspecialstatusflag TARGET, 0x40000, 1, BattleScript_1D7602
	orword gHitMarker, 0x40000
	setbyte gSharedMem + 0x1601F, 2

BattleScript_1D7602: @ 81D7602
	setbyte gUnknown_02024D1F + 0x2, 13
	jump BattleScript_1D6F14

MoveEffect_DoubleHit: @ 81D760D
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	setloopcounter 2
	atk8e
	setbyte gSharedMem + 0x16112, 0
	jump BattleScript_1D7300

MoveEffect_RecoilIfMiss: @ 81D7625
	attackcanceler
	accuracycheck BattleScript_1D7632, 0
	jump BattleScript_1D6F42

BattleScript_1D7632: @ 81D7632
	attackstring
	ppreduce
	pause 64
	resultmessage
	waitmessage 64
	jumpifbyte 4, gBattleMoveFlags, 8, BattleScript_EndTurn
	printstring BATTLE_TEXT_KeptGoingCrash
	waitmessage 64
	atk5
	atk6
	atk7
	manipulatedamage 1
	bicbyte gBattleMoveFlags, 1
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	faintpokemon USER, 0, 0x0
	orbyte gBattleMoveFlags, 1
	jump BattleScript_EndTurn

MoveEffect_Mist: @ 81D7676
	attackcanceler
	attackstring
	ppreduce
	setmisteffect
	attackanimation
	waitanimation
	printfromtable BattleTextList_4015A0
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_FocusEnergy: @ 81D7689
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus USER, S_FOCUS_ENERGY, BattleScript_ButItFailed
	setincreasedcriticalchance
	attackanimation
	waitanimation
	printfromtable BattleTextList_4015A4
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Recoil: @ 81D76A6
	setbyte gUnknown_02024D1F + 0x2, 206
	jumpifhalfword 1, gCurrentMove, 165, BattleScript_1D6F14
	atk60 27
	jump BattleScript_1D6F14

MoveEffect_Confuse: @ 81D76BF
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_OWN_TEMPO, BattleScript_1D98E5
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	jumpifsecondarytstatus TARGET, S_CONFUSED, BattleScript_1D76FE
	accuracycheck BattleScript_ButItFailed, 0
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	attackanimation
	waitanimation
	setbyte gUnknown_02024D1F + 0x2, 7
	seteffecttarget
	resultmessage
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D76FE: @ 81D76FE
	pause 32
	printstring BATTLE_TEXT_AlreadyConfused
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_AttackUp2: @ 81D770C
	setbyte gSharedMem + 0x1601E, 33
	jump BattleScript_1D71B2

MoveEffect_DefenseUp2: @ 81D7717
	setbyte gSharedMem + 0x1601E, 34
	jump BattleScript_1D71B2

MoveEffect_SpeedUp2: @ 81D7722
	setbyte gSharedMem + 0x1601E, 35
	jump BattleScript_1D71B2

MoveEffect_SpecialAttackUp2: @ 81D772D
	setbyte gSharedMem + 0x1601E, 36
	jump BattleScript_1D71B2

MoveEffect_SpecialDefenseUp2: @ 81D7738
	setbyte gSharedMem + 0x1601E, 37
	jump BattleScript_1D71B2

MoveEffect_Transform: @ 81D7743
	attackcanceler
	attackstring
	ppreduce
	transformdataexecution
	attackanimation
	waitanimation
	printfromtable BattleTextList_4015A8
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_AttackDown2: @ 81D7756
	setbyte gSharedMem + 0x1601E, 161
	jump BattleScript_1D7227

MoveEffect_DefenseDown2: @ 81D7761
	setbyte gSharedMem + 0x1601E, 162
	jump BattleScript_1D7227

MoveEffect_SpeedDown2: @ 81D776C
	setbyte gSharedMem + 0x1601E, 163
	jump BattleScript_1D7227

MoveEffect_SpecialDefenseDown2: @ 81D7777
	setbyte gSharedMem + 0x1601E, 165
	jump BattleScript_1D7227

MoveEffect_Reflect: @ 81D7782
	attackcanceler
	attackstring
	ppreduce
	setreflect

BattleScript_1D7786: @ 81D7786
	attackanimation
	waitanimation
	printfromtable BattleTextList_401540
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Poison: @ 81D7795
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_IMMUNITY, BattleScript_1D7463
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus TARGET, PSN, BattleScript_1D7455
	jumpifstatus TARGET, TOX, BattleScript_1D7455
	jumpiftype TARGET, TYPE_POISON, BattleScript_1D83E8
	jumpiftype TARGET, TYPE_STEEL, BattleScript_1D83E8
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	attackanimation
	waitanimation
	setbyte gUnknown_02024D1F + 0x2, 2
	seteffecttarget
	resultmessage
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Paralyze: @ 81D77F6
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_LIMBER, BattleScript_1D7859
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	atk6
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_ButItFailed
	jumpifstatus TARGET, PAR, BattleScript_1D784B
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	attackanimation
	waitanimation
	setbyte gUnknown_02024D1F + 0x2, 5
	seteffecttarget
	resultmessage
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D784B: @ 81D784B
	pause 32
	printstring BATTLE_TEXT_AlreadyParalyzed
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D7859: @ 81D7859
	copyarray gEffectBank, gBankTarget, 1
	setbyte gUnknown_02024D1F + 0x4, 0
	callatk BattleScript_PRLZPrevention
	jump BattleScript_EndTurn

MoveEffect_AttackDownHit: @ 81D7873
	setbyte gUnknown_02024D1F + 0x2, 22
	jump BattleScript_1D6F14

MoveEffect_DefenseDownHit: @ 81D787E
	setbyte gUnknown_02024D1F + 0x2, 23
	jump BattleScript_1D6F14

MoveEffect_SpeedDownHit: @ 81D7889
	setbyte gUnknown_02024D1F + 0x2, 24
	jump BattleScript_1D6F14

MoveEffect_SpecialAttackDownHit: @ 81D7894
	setbyte gUnknown_02024D1F + 0x2, 25
	jump BattleScript_1D6F14

MoveEffect_SpecialDefenseDownHit: @ 81D789F
	setbyte gUnknown_02024D1F + 0x2, 26
	jump BattleScript_1D6F14

MoveEffect_AccuracyDownHit: @ 81D78AA
	setbyte gUnknown_02024D1F + 0x2, 27
	jump BattleScript_1D6F14

MoveEffect_SkyAttack: @ 81D78B5
	jumpifsecondarytstatus USER, S_CONTINUE, BattleScript_1D753D
	jumpifword 4, gHitMarker, 0x200, BattleScript_1D753D
	setbyte gSharedMem + 0x16055, 3
	callatk BattleScript_1D756C
	jump BattleScript_EndTurn

MoveEffect_ConfuseHit: @ 81D78DD
	setbyte gUnknown_02024D1F + 0x2, 7
	jump BattleScript_1D6F14

MoveEffect_Twineedle: @ 81D78E8
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	setbyte gSharedMem + 0x16112, 2
	attackstring
	ppreduce
	setloopcounter 2
	atk8e
	jump BattleScript_1D7300

MoveEffect_Substitute: @ 81D7900
	attackcanceler
	ppreduce
	attackstring
	waitstateatk
	jumpifsecondarytstatus USER, S_SUBSTITUTE, BattleScript_1D7935
	setsubstituteeffect
	jumpifbyte 1, gUnknown_02024D1F + 0x4, 1, BattleScript_1D7922
	pause 32
	jump BattleScript_1D7928

BattleScript_1D7922: @ 81D7922
	attackanimation
	waitanimation
	graphicalhpupdate USER
	datahpupdate USER

BattleScript_1D7928: @ 81D7928
	printfromtable BattleTextList_4015AC
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D7935: @ 81D7935
	pause 32
	printstring BATTLE_TEXT_SubAlready
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Recharge: @ 81D7943
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	setbyte gUnknown_02024D1F + 0x2, 221
	jump BattleScript_1D6F42

BattleScript_MoveUsedMustRecharge:: @ 81D7956
	printstring BATTLE_TEXT_MustRecharge
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Rage: @ 81D7961
	attackcanceler
	accuracycheck BattleScript_1D797B, 0
	setbyte gUnknown_02024D1F + 0x2, 30
	seteffecttarget
	setbyte gUnknown_02024D1F + 0x2, 0
	jump BattleScript_1D6F42

BattleScript_1D797B: @ 81D797B
	setbyte gUnknown_02024D1F + 0x2, 30
	clearstatus USER
	jump BattleScript_1D6F72

MoveEffect_Mimic: @ 81D7988
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 65535
	copyattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_LearnedMove2
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Metronome: @ 81D79AE
	attackcanceler
	attackstring
	pause 32
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x16002, 0
	setbyte gSharedMem + 0x160A1, 0
	metronomeeffect

MoveEffect_LeechSeed: @ 81D79C2
	attackcanceler
	attackstring
	pause 32
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	accuracycheck BattleScript_1D79D9, 0

BattleScript_1D79D9: @ 81D79D9
	setleechseed
	attackanimation
	waitanimation
	printfromtable BattleTextList_40154C
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Splash: @ 81D79E9
	attackcanceler
	attackstring
	ppreduce
	attackanimation
	waitanimation
	atk60 26
	printstring BATTLE_TEXT_Nothing
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Disable: @ 81D79FB
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0
	disablelastusedattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_MoveWasDisabled
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_LevelDamage: @ 81D7A17
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	atk6
	bicbyte gBattleMoveFlags, 6
	nightshadedamageeffect
	atk69
	jump BattleScript_1D6F48

MoveEffect_Psywave: @ 81D7A2F
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	atk6
	bicbyte gBattleMoveFlags, 6
	psywavedamageeffect
	atk69
	jump BattleScript_1D6F48

MoveEffect_Counter: @ 81D7A47
	attackcanceler
	counterdamagecalculator BattleScript_1D83D4
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	damagecalc2
	atk69
	jump BattleScript_1D6F48

MoveEffect_Encore: @ 81D7A5D
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	setencore BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_EncoreGot
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_PainSplit: @ 81D7A79
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 65535
	painsplitdamagecalculator BattleScript_ButItFailed
	attackanimation
	waitanimation
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	copyarray gBattleMoveDamage, gSharedMem + 0x16014, 4
	graphicalhpupdate TARGET
	datahpupdate TARGET
	printstring BATTLE_TEXT_PainSplit
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Snore: @ 81D7AB0
	attackcanceler
	jumpifstatus USER, SLP, BattleScript_1D7AC2
	attackstring
	ppreduce
	jump BattleScript_ButItFailed

BattleScript_1D7AC2: @ 81D7AC2
	jumpifhalfword 0, gUnknown_02024BE8, 214, BattleScript_1D7AD6
	printstring BATTLE_TEXT_FastAsleep
	waitmessage 64
	statusanimation USER

BattleScript_1D7AD6: @ 81D7AD6
	attackstring
	ppreduce
	accuracycheck BattleScript_1D6F77, 0
	setbyte gUnknown_02024D1F + 0x2, 8
	jump BattleScript_1D6F44

MoveEffect_Conversion2: @ 81D7AEA
	attackcanceler
	attackstring
	ppreduce
	settypetorandomresistance BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TypeTransform
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_LockOn: @ 81D7AFF
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0
	setalwayshitflag
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TookAim
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Sketch: @ 81D7B21
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	copymovepermanently BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_SketchedMove
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_SleepTalk: @ 81D7B40
	attackcanceler
	jumpifstatus USER, SLP, BattleScript_1D7B52
	attackstring
	ppreduce
	jump BattleScript_ButItFailed

BattleScript_1D7B52: @ 81D7B52
	printstring BATTLE_TEXT_FastAsleep
	waitmessage 64
	statusanimation USER
	attackstring
	ppreduce
	orword gHitMarker, 0x800
	selectrandommovefromusermoves BattleScript_1D7B72
	pause 64
	jump BattleScript_ButItFailed

BattleScript_1D7B72: @ 81D7B72
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x16002, 0
	setbyte gSharedMem + 0x160A1, 0
	jumptoattack USER

MoveEffect_DestinyBond: @ 81D7B82
	attackcanceler
	attackstring
	ppreduce
	destinybondeffect
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_DestinyBondTake
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Flail: @ 81D7B93
	remaininghptopower
	jump BattleScript_1D6F14

MoveEffect_Spite: @ 81D7B99
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0
	reducepprandom BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_ReducedBy
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_HealBell: @ 81D7BB5
	attackcanceler
	attackstring
	ppreduce
	clearstatusifnotsoundproofed
	waitstateatk
	attackanimation
	waitanimation
	printfromtable BattleTextList_4015D8
	waitmessage 64
	jumpifhalfword 1, gCurrentMove, 215, BattleScript_1D7BF2
	jumpifbyte 5, gUnknown_02024D1F + 0x4, 1, BattleScript_1D7BE1
	printstring BATTLE_TEXT_BlocksOther
	waitmessage 64

BattleScript_1D7BE1: @ 81D7BE1
	jumpifbyte 5, gUnknown_02024D1F + 0x4, 2, BattleScript_1D7BF2
	printstring BATTLE_TEXT_BlocksOther2
	waitmessage 64

BattleScript_1D7BF2: @ 81D7BF2
	atk98 4
	waitstateatk
	jump BattleScript_EndTurn

MoveEffect_TripleKick: @ 81D7BFA
	attackcanceler
	attackstring
	ppreduce
	setbyte gSharedMem + 0x160DE, 0
	setbyte gSharedMem + 0x160DF, 0
	atk8e
	atk26 3

BattleScript_1D7C0C: @ 81D7C0C
	jumpiffainted USER, BattleScript_1D7CAF
	jumpiffainted TARGET, BattleScript_1D7C8D
	jumpifhalfword 0, gUnknown_02024BE8, 214, BattleScript_1D7C2E
	jumpifstatus USER, SLP, BattleScript_1D7C8D

BattleScript_1D7C2E: @ 81D7C2E
	atk25
	accuracycheck BattleScript_1D7C8D, 0
	addbyte gSharedMem + 0x160DE, 10
	addbyte gSharedMem + 0x160E4, 1
	copyarray gDynamicBasePower, gSharedMem + 0x160DE, 2
	critcalc
	atk5
	atk6
	atk7
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_1D7C8D
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	printstring BATTLE_TEXT_Terminator2
	waitmessage 1
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	jumpifbyte 4, gBattleMoveFlags, 64, BattleScript_1D7C90
	atk27 BattleScript_1D7C0C
	jump BattleScript_1D7C90

BattleScript_1D7C8D: @ 81D7C8D
	pause 32

BattleScript_1D7C90: @ 81D7C90
	resultmessage
	waitmessage 64
	jumpifbyte 0, gSharedMem + 0x160E4, 0, BattleScript_1D7CAF
	copyarray gBattleTextBuff1, gSharedMem + 0x160E0, 6
	printstring BATTLE_TEXT_HitMulti
	waitmessage 64

BattleScript_1D7CAF: @ 81D7CAF
	seteffectwithchancetarget
	faintpokemon TARGET, 0, 0x0
	setbyte gSharedMem + 0x1600C, 14
	atk49 0, 0
	end

MoveEffect_Thief: @ 81D7CC1
	setbyte gUnknown_02024D1F + 0x2, 31
	jump BattleScript_1D6F14

MoveEffect_MeanLook: @ 81D7CCC
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 65534
	jumpifsecondarytstatus TARGET, S_MEAN_LOOK, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setbyte gUnknown_02024D1F + 0x2, 32
	seteffecttarget
	printstring BATTLE_TEXT_CantEscapeNow
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Nightmare: @ 81D7CF4
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	jumpifsecondarytstatus TARGET, S_NIGHTMARE, BattleScript_ButItFailed
	jumpifstatus TARGET, SLP, BattleScript_1D7D1A
	jump BattleScript_ButItFailed

BattleScript_1D7D1A: @ 81D7D1A
	attackanimation
	waitanimation
	setbyte gUnknown_02024D1F + 0x2, 33
	seteffecttarget
	printstring BATTLE_TEXT_NightmareStart
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Minimize: @ 81D7D2E
	attackcanceler
	setminimize
	setbyte gSharedMem + 0x1601E, 23
	jump BattleScript_1D71B3

MoveEffect_Curse: @ 81D7D3B
	jumpiftype2 USER, TYPE_GHOST, BattleScript_1D7DB3
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, 2, 3, 0, BattleScript_1D7D60
	jumpifstat USER, 1, 1, 12, BattleScript_1D7D60
	jumpifstat USER, 0, 2, 12, BattleScript_ButItFailed

BattleScript_1D7D60: @ 81D7D60
	copyarray gBankTarget, gBankAttacker, 1
	setbyte gSharedMem + 0x16002, 1
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x1601E, 147
	statbuffchange 65, BattleScript_1D7D86
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D7D86: @ 81D7D86
	setbyte gSharedMem + 0x1601E, 17
	statbuffchange 65, BattleScript_1D7D9A
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D7D9A: @ 81D7D9A
	setbyte gSharedMem + 0x1601E, 18
	statbuffchange 65, BattleScript_1D7DAE
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D7DAE: @ 81D7DAE
	jump BattleScript_EndTurn

BattleScript_1D7DB3: @ 81D7DB3
	jumpifarraynotequal gBankAttacker, gBankTarget, 1, BattleScript_1D7DC4
	atk76 USER, 3

BattleScript_1D7DC4: @ 81D7DC4
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	cursetarget BattleScript_ButItFailed
	orword gHitMarker, 0x100
	setbyte gSharedMem + 0x16002, 0
	attackanimation
	waitanimation
	graphicalhpupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_CurseLay
	waitmessage 64
	faintpokemon USER, 0, 0x0
	jump BattleScript_EndTurn

MoveEffect_Endure: @ 81D7DFD
MoveEffect_Protect: @ 81D7DFD
	attackcanceler
	attackstring
	ppreduce
	setprotect
	attackanimation
	waitanimation
	printfromtable BattleTextList_40153A
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Spikes: @ 81D7E10
	attackcanceler
	setspikes BattleScript_1D83D4
	attackstring
	ppreduce
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_SpikesScattered
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Foresight: @ 81D7E25
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	setforesight
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_IdentifiedPoke
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_PerishSong: @ 81D7E3D
	attackcanceler
	attackstring
	ppreduce
	setperishsong BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_PerishSong
	waitmessage 64
	setbyte gSharedMem + 0x16003, 0

BattleScript_1D7E53: @ 81D7E53
	jumpifability 10, ABILITY_SOUNDPROOF, BattleScript_1D7E73

BattleScript_1D7E5A: @ 81D7E5A
	addbyte gSharedMem + 0x16003, 1
	jumpifarraynotequal gSharedMem + 0x16003, gNoOfAllBanks, 1, BattleScript_1D7E53
	jump BattleScript_EndTurn

BattleScript_1D7E73: @ 81D7E73
	printstring BATTLE_TEXT_BlocksOther2
	waitmessage 64
	jump BattleScript_1D7E5A

MoveEffect_Sandstorm: @ 81D7E7E
	attackcanceler
	attackstring
	ppreduce
	setsandstorm
	jump BattleScript_1D7FFA

MoveEffect_Rollout: @ 81D7E87
	attackcanceler
	attackstring
	jumpifsecondarytstatus USER, S_CONTINUE, BattleScript_1D7E94
	ppreduce

BattleScript_1D7E94: @ 81D7E94
	accuracycheck BattleScript_1D7E9B, 0

BattleScript_1D7E9B: @ 81D7E9B
	damagecalc2
	rolloutdamagecalculation
	jump BattleScript_1D6F44

MoveEffect_Swagger: @ 81D7EA2
	attackcanceler
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_1D6F6C
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	jumpifconfusedandattackmaxed 1, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x1601E, 33
	statbuffchange 1, BattleScript_1D7EE5
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D7EE5
	atk47
	playanimation TARGET, 1, gSharedMem + 0x160A4
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D7EE5: @ 81D7EE5
	jumpifability TARGET, ABILITY_OWN_TEMPO, BattleScript_1D98E5
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	setbyte gUnknown_02024D1F + 0x2, 7
	seteffecttarget
	jump BattleScript_EndTurn

MoveEffect_FuryCutter: @ 81D7F00
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_1D7F0A, 0

BattleScript_1D7F0A: @ 81D7F0A
	furycutterdamagecalculation
	critcalc
	atk5
	atk6
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_1D7F0A
	atk7
	jump BattleScript_1D6F48

MoveEffect_Attract: @ 81D7F1F
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0
	tryinfatuatetarget BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_FellLove
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Frustration: @ 81D7F3B
MoveEffect_Return: @ 81D7F3B
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	happinesstodamagecalculation
	jump BattleScript_1D6F42

MoveEffect_Present: @ 81D7F49
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	atk6
	presentdamagecalculation

MoveEffect_Safeguard: @ 81D7F55
	attackcanceler
	attackstring
	ppreduce
	setsafeguard
	jump BattleScript_1D7786

MoveEffect_ThawHit: @ 81D7F5E
	setbyte gUnknown_02024D1F + 0x2, 3
	jump BattleScript_1D6F14

MoveEffect_Magnitude: @ 81D7F69
	attackcanceler
	attackstring
	ppreduce
	selectnexttarget
	magnitudedamagecalculation
	pause 32
	printstring BATTLE_TEXT_MagnitudeCount
	waitmessage 64
	jump BattleScript_1D80FD

MoveEffect_BatonPass: @ 81D7F7C
	attackcanceler
	attackstring
	ppreduce
	jumpifcannotswitch 129, BattleScript_ButItFailed
	attackanimation
	waitanimation
	openpartyscreen USER, BattleScript_ButItFailed
	atke2 USER
	waitstateatk
	atk51 USER, 2
	atk58 USER
	switch1 USER
	switch2 USER
	atk73 USER
	printstring 3
	switch3 USER, 1
	waitstateatk
	atk52 USER
	jump BattleScript_EndTurn

MoveEffect_RapidSpin: @ 81D7FA9
	setbyte gUnknown_02024D1F + 0x2, 163
	jump BattleScript_1D6F14

MoveEffect_Sonicboom: @ 81D7FB4
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	atk6
	bicbyte gBattleMoveFlags, 6
	setbyte gBattleMoveDamage, 20
	setbyte gBattleMoveDamage + 0x1, 0
	setbyte gBattleMoveDamage + 0x2, 0
	setbyte gBattleMoveDamage + 0x3, 0
	atk69
	jump BattleScript_1D6F48

MoveEffect_Moonlight: @ 81D7FE3
MoveEffect_MorningSun: @ 81D7FE3
MoveEffect_Synthesis: @ 81D7FE3
	attackcanceler
	attackstring
	ppreduce
	recoverbasedonsunlight BattleScript_1D83B5
	jump BattleScript_1D839B

MoveEffect_HiddenPower: @ 81D7FF0
	hiddenpowerdamagecalculation
	jump BattleScript_1D6F14

MoveEffect_RainDance: @ 81D7FF6
	attackcanceler
	attackstring
	ppreduce
	setrain

BattleScript_1D7FFA: @ 81D7FFA
	attackanimation
	waitanimation
	printfromtable BattleTextList_40151C
	waitmessage 64
	callatk BattleScript_1D9761
	jump BattleScript_EndTurn

MoveEffect_SunnyDay: @ 81D800E
	attackcanceler
	attackstring
	ppreduce
	setsunny
	jump BattleScript_1D7FFA

MoveEffect_DefenseUpHit: @ 81D8017
	setbyte gUnknown_02024D1F + 0x2, 80
	jump BattleScript_1D6F14

MoveEffect_AttackUpHit: @ 81D8022
	setbyte gUnknown_02024D1F + 0x2, 79
	jump BattleScript_1D6F14

MoveEffect_AllStatsUpHit: @ 81D802D
	setbyte gUnknown_02024D1F + 0x2, 98
	jump BattleScript_1D6F14

MoveEffect_BellyDrum: @ 81D8038
	attackcanceler
	attackstring
	ppreduce
	maxattackhalvehp BattleScript_ButItFailed
	orword gHitMarker, 0x100
	attackanimation
	waitanimation
	graphicalhpupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_CutHPMaxATK
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_PsychUp: @ 81D805A
	attackcanceler
	attackstring
	ppreduce
	copyfoestats BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_CopyStatChanges
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_MirrorCoat: @ 81D806F
	attackcanceler
	mirrorcoatdamagecalculator BattleScript_1D83D4
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	damagecalc2
	atk69
	jump BattleScript_1D6F48

MoveEffect_SkullBash: @ 81D8085
	jumpifsecondarytstatus USER, S_CONTINUE, BattleScript_1D753D
	jumpifword 4, gHitMarker, 0x200, BattleScript_1D753D
	setbyte gSharedMem + 0x16055, 2
	callatk BattleScript_1D756C
	setbyte gSharedMem + 0x1601E, 18
	statbuffchange 65, BattleScript_1D80CF
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D80CF
	atk47
	playanimation USER, 1, gSharedMem + 0x160A4
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D80CF: @ 81D80CF
	jump BattleScript_EndTurn

MoveEffect_Twister: @ 81D80D4
	jumpifspecialstatusflag TARGET, 0x40, 1, BattleScript_1D80EE
	orword gHitMarker, 0x10000
	setbyte gSharedMem + 0x1601F, 2

BattleScript_1D80EE: @ 81D80EE
	setbyte gUnknown_02024D1F + 0x2, 8
	jump BattleScript_1D6F14

MoveEffect_Earthquake: @ 81D80F9
	attackcanceler
	attackstring
	ppreduce
	selectnexttarget

BattleScript_1D80FD: @ 81D80FD
	atk25
	jumpifspecialstatusflag TARGET, 0x80, 1, BattleScript_1D811D
	orword gHitMarker, 0x20000
	setbyte gSharedMem + 0x1601F, 2
	jump BattleScript_1D812C

BattleScript_1D811D: @ 81D811D
	bicword gHitMarker, 0x20000
	setbyte gSharedMem + 0x1601F, 1

BattleScript_1D812C: @ 81D812C
	accuracycheck BattleScript_1D8165, 0
	critcalc
	atk5
	atk6
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	printstring BATTLE_TEXT_Terminator2
	waitmessage 1
	faintpokemon TARGET, 0, 0x0
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	jumpwhiletargetvalid BattleScript_1D80FD
	end

BattleScript_1D8165: @ 81D8165
	pause 32
	atk6
	missmessage
	resultmessage
	waitmessage 64
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	jumpwhiletargetvalid BattleScript_1D80FD
	end

MoveEffect_FutureSight: @ 81D817D
	attackcanceler
	attackstring
	ppreduce
	setfutureattack BattleScript_ButItFailed
	attackanimation
	waitanimation
	printfromtable BattleTextList_4015E2
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Gust: @ 81D8194
	jumpifspecialstatusflag TARGET, 0x40, 1, BattleScript_1D6F14
	orword gHitMarker, 0x10000
	setbyte gSharedMem + 0x1601F, 2
	jump BattleScript_1D6F14

MoveEffect_FlinchHit2: @ 81D81B3
	jumpifspecialstatusflag TARGET, 0x100, 1, BattleScript_1D80EE
	setbyte gSharedMem + 0x1601F, 2
	jump BattleScript_1D80EE

MoveEffect_Solarbeam: @ 81D81C9
	jumpifabilitypresent ABILITY_CLOUD_NINE, BattleScript_1D81E1
	jumpifabilitypresent ABILITY_AIR_LOCK, BattleScript_1D81E1
	jumpifhalfword 4, gBattleWeather, 96, BattleScript_1D8209

BattleScript_1D81E1: @ 81D81E1
	jumpifsecondarytstatus USER, S_CONTINUE, BattleScript_1D753D
	jumpifword 4, gHitMarker, 0x200, BattleScript_1D753D
	setbyte gSharedMem + 0x16055, 1
	callatk BattleScript_1D756C
	jump BattleScript_EndTurn

BattleScript_1D8209: @ 81D8209
	orword gHitMarker, 0x8000000
	setbyte gUnknown_02024D1F + 0x2, 76
	seteffecttarget
	ppreduce
	jump BattleScript_1D753D

MoveEffect_Thunder: @ 81D821F
	setbyte gUnknown_02024D1F + 0x2, 5
	orword gHitMarker, 0x10000
	jump BattleScript_1D6F14

MoveEffect_Teleport: @ 81D8233
	attackcanceler
	attackstring
	ppreduce
	jumpifhalfword 4, gBattleTypeFlags, 8, BattleScript_ButItFailed
	atk76 USER, 2
	jumpifbyte 0, gBattleCommunication, 1, BattleScript_ButItFailed
	jumpifbyte 0, gBattleCommunication, 2, BattleScript_1D8839
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_FledBattle
	waitmessage 64
	setbyte gBattleOutcome, 5
	jump BattleScript_EndTurn

MoveEffect_BeatUp: @ 81D826E
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	pause 32
	ppreduce
	setbyte gBattleCommunication, 0

BattleScript_1D8281: @ 81D8281
	atk25
	beatupcalculation BattleScript_1D82C4, BattleScript_ButItFailed
	printstring BATTLE_TEXT_PokeAttack
	critcalc
	jumpifbyte 1, gCritMultiplier, 2, BattleScript_1D829C
	manipulatedamage 2

BattleScript_1D829C: @ 81D829C
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	faintpokemon TARGET, 0, 0x0
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	jump BattleScript_1D8281

BattleScript_1D82C4: @ 81D82C4
	end

MoveEffect_Fly: @ 81D82C5
	jumpifsecondarytstatus USER, S_CONTINUE, BattleScript_1D8333
	jumpifword 4, gHitMarker, 0x200, BattleScript_1D8333
	jumpifhalfword 0, gCurrentMove, 19, BattleScript_1D8322
	jumpifhalfword 0, gCurrentMove, 291, BattleScript_1D8317
	jumpifhalfword 0, gCurrentMove, 340, BattleScript_1D830C
	setbyte gSharedMem + 0x16055, 5
	jump BattleScript_1D8328

BattleScript_1D830C: @ 81D830C
	setbyte gSharedMem + 0x16055, 7
	jump BattleScript_1D8328

BattleScript_1D8317: @ 81D8317
	setbyte gSharedMem + 0x16055, 6
	jump BattleScript_1D8328

BattleScript_1D8322: @ 81D8322
	setbyte gSharedMem + 0x16055, 4

BattleScript_1D8328: @ 81D8328
	callatk BattleScript_1D756C
	hidepreattack
	jump BattleScript_EndTurn

BattleScript_1D8333: @ 81D8333
	attackcanceler
	setbyte gUnknown_02024D1F + 0x2, 12
	setbyte gSharedMem + 0x16002, 1
	clearstatus USER
	orword gHitMarker, 0x800
	jumpifhalfword 1, gCurrentMove, 340, BattleScript_1D835D
	setbyte gUnknown_02024D1F + 0x2, 5

BattleScript_1D835D: @ 81D835D
	accuracycheck BattleScript_1D836A, 0
	unhidepostattack
	jump BattleScript_1D6F42

BattleScript_1D836A: @ 81D836A
	unhidepostattack
	jump BattleScript_1D6F72

MoveEffect_DefenseCurl: @ 81D8370
	attackcanceler
	attackstring
	ppreduce
	setcurled
	setbyte gSharedMem + 0x1601E, 18
	statbuffchange 65, BattleScript_1D838D
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D71D8
	attackanimation
	waitanimation

BattleScript_1D838D: @ 81D838D
	jump BattleScript_1D71D0

MoveEffect_Softboiled: @ 81D8392
	attackcanceler
	attackstring
	ppreduce
	setdamageasrestorehalfmaxhp BattleScript_1D83B5, 0

BattleScript_1D839B:: @ 81D839B
	attackanimation
	waitanimation
	orword gHitMarker, 0x100
	graphicalhpupdate TARGET
	datahpupdate TARGET
	printstring BATTLE_TEXT_RegainedHealth
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D83B5:: @ 81D83B5
	pause 32
	printstring BATTLE_TEXT_HPFull
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_FakeOut: @ 81D83C3
	attackcanceler
	jumpifnotfirstturn BattleScript_1D83D4
	setbyte gUnknown_02024D1F + 0x2, 136
	jump BattleScript_1D6F14

BattleScript_1D83D4: @ 81D83D4
	attackstring

BattleScript_1D83D5: @ 81D83D5
	ppreduce

BattleScript_ButItFailed:: @ 81D83D6
	pause 32
	orbyte gBattleMoveFlags, 32
	resultmessage
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D83E8: @ 81D83E8
	pause 32
	orbyte gBattleMoveFlags, 8
	resultmessage
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Uproar: @ 81D83FA
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	setbyte gUnknown_02024D1F + 0x2, 74
	attackstring
	jumpifsecondarytstatus USER, S_CONTINUE, BattleScript_1D8414
	ppreduce

BattleScript_1D8414: @ 81D8414
	nop3
	jump BattleScript_1D6F44

MoveEffect_Stockpile: @ 81D841A
	attackcanceler
	attackstring
	ppreduce
	stockpile
	attackanimation
	waitanimation
	printfromtable BattleTextList_40155E
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_SpitUp: @ 81D842D
	attackcanceler
	jumpifbyte 0, gUnknown_02024D1F + 0x5, 1, BattleScript_1D845C
	attackstring
	ppreduce
	accuracycheck BattleScript_1D6F72, 0
	stockpiletobasedamage BattleScript_1D844E
	atk6
	atk69
	jump BattleScript_1D6F48

BattleScript_1D844E: @ 81D844E
	pause 32
	printstring BATTLE_TEXT_SpitUpFail
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D845C: @ 81D845C
	attackstring
	ppreduce
	pause 64
	stockpiletobasedamage BattleScript_1D844E
	resultmessage
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Swallow: @ 81D846F
	attackcanceler
	attackstring
	ppreduce
	stockpiletohprecovery BattleScript_1D847C
	jump BattleScript_1D839B

BattleScript_1D847C: @ 81D847C
	pause 32
	printfromtable BattleTextList_401566
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Hail: @ 81D848C
	attackcanceler
	attackstring
	ppreduce
	sethail
	jump BattleScript_1D7FFA

MoveEffect_Torment: @ 81D8495
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0
	settorment BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TormentSubject
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Flatter: @ 81D84B1
	attackcanceler
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_1D6F6C
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	jumpifconfusedandattackmaxed 4, BattleScript_ButItFailed
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x1601E, 20
	statbuffchange 1, BattleScript_1D84F4
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D84F4
	atk47
	playanimation TARGET, 1, gSharedMem + 0x160A4
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D84F4: @ 81D84F4
	jumpifability TARGET, ABILITY_OWN_TEMPO, BattleScript_1D98E5
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	setbyte gUnknown_02024D1F + 0x2, 7
	seteffecttarget
	jump BattleScript_EndTurn

MoveEffect_WillOWisp: @ 81D850F
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	jumpifstatus TARGET, BRN, BattleScript_1D8575
	jumpiftype TARGET, TYPE_FIRE, BattleScript_1D83E8
	jumpifability TARGET, ABILITY_WATER_VEIL, BattleScript_1D855B
	jumpifstatus TARGET, SLP | PSN | BRN | FRZ | PAR | TOX, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	attackanimation
	waitanimation
	setbyte gUnknown_02024D1F + 0x2, 3
	seteffecttarget
	jump BattleScript_EndTurn

BattleScript_1D855B: @ 81D855B
	copyarray gEffectBank, gBankTarget, 1
	setbyte gUnknown_02024D1F + 0x4, 0
	callatk BattleScript_BRNPrevention
	jump BattleScript_EndTurn

BattleScript_1D8575: @ 81D8575
	pause 32
	printstring BATTLE_TEXT_AlreadyBurned
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Memento: @ 81D8583
	attackcanceler
	jumpifbyte 0, gUnknown_02024D1F + 0x5, 1, BattleScript_1D860A
	attackstring
	ppreduce
	jumpifattackandspecialattackcannotfall BattleScript_ButItFailed
	setuserhptozero
	attackanimation
	waitanimation
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_1D85FF
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation TARGET, 18, 7
	playstatchangeanimation TARGET, 2, 3
	setbyte gSharedMem + 0x1601E, 161
	statbuffchange 1, BattleScript_1D85D0
	jumpifbyte 2, gUnknown_02024D1F + 0x4, 1, BattleScript_1D85D0
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D85D0: @ 81D85D0
	playstatchangeanimation TARGET, 16, 3
	setbyte gSharedMem + 0x1601E, 164
	statbuffchange 1, BattleScript_1D85F3
	jumpifbyte 2, gUnknown_02024D1F + 0x4, 1, BattleScript_1D85F3
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D85F3: @ 81D85F3
	faintpokemon USER, 0, 0x0
	jump BattleScript_EndTurn

BattleScript_1D85FF: @ 81D85FF
	printstring BATTLE_TEXT_NoEffect
	waitmessage 64
	jump BattleScript_1D85F3

BattleScript_1D860A: @ 81D860A
	attackstring
	ppreduce
	jumpifattackandspecialattackcannotfall BattleScript_1D8611

BattleScript_1D8611: @ 81D8611
	setuserhptozero
	pause 64
	missmessage
	resultmessage
	waitmessage 64
	faintpokemon USER, 0, 0x0
	jump BattleScript_EndTurn

MoveEffect_Facade: @ 81D8626
	jumpifstatus USER, PSN | BRN | PAR | TOX, BattleScript_1D8635
	jump BattleScript_1D6F14

BattleScript_1D8635: @ 81D8635
	setbyte gSharedMem + 0x1601F, 2
	jump BattleScript_1D6F14

MoveEffect_FocusPunch: @ 81D8640
	attackcanceler
	jumpifnodamage BattleScript_1D6F3B
	ppreduce
	printstring BATTLE_TEXT_LostFocus
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Smellingsalt: @ 81D8652
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_1D6F14
	setbyte gUnknown_02024D1F + 0x2, 164
	jumpifstatus TARGET, PAR, BattleScript_1D8671
	jump BattleScript_1D6F14

BattleScript_1D8671: @ 81D8671
	setbyte gSharedMem + 0x1601F, 2
	jump BattleScript_1D6F14

MoveEffect_FollowMe: @ 81D867C
	attackcanceler
	attackstring
	ppreduce
	setforcedtarget
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_CenterAttention
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_NaturePower: @ 81D868D
	attackcanceler
	attackstring
	pause 32
	callterrainattack
	printstring BATTLE_TEXT_NaturePower
	waitmessage 64
	return

MoveEffect_Charge: @ 81D869A
	attackcanceler
	attackstring
	ppreduce
	setcharge
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_ChargingPower
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Taunt: @ 81D86AB
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 0
	settaunt BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TauntFell
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_HelpingHand: @ 81D86C7
	attackcanceler
	attackstring
	ppreduce
	sethelpinghand BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_ReadyToHelp
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Trick: @ 81D86DC
	attackcanceler
	attackstring
	ppreduce
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	accuracycheck BattleScript_ButItFailed, 0
	itemswap BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_SwitchedItems
	waitmessage 64
	printfromtable BattleTextList_401642
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_RolePlay: @ 81D870A
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 65535
	copyability BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_CopiedObject
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Wish: @ 81D8726
	attackcanceler
	attackstring
	ppreduce
	atkd4 0, BattleScript_ButItFailed
	attackanimation
	waitanimation
	jump BattleScript_EndTurn

MoveEffect_Assist: @ 81D8736
	attackcanceler
	attackstring
	assistattackselect BattleScript_1D83D5
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x16002, 0
	setbyte gSharedMem + 0x160A1, 0
	jumptoattack USER

MoveEffect_Ingrain: @ 81D874D
	attackcanceler
	attackstring
	ppreduce
	setroots BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_PlantedRoots
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Superpower: @ 81D8762
	setbyte gUnknown_02024D1F + 0x2, 229
	jump BattleScript_1D6F14

MoveEffect_MagicCoat: @ 81D876D
	attackcanceler
	setmagiccoat BattleScript_1D83D4
	attackstring
	ppreduce
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_ShroudedItself
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Recycle: @ 81D8782
	attackcanceler
	attackstring
	ppreduce
	recycleitem BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_FoundOne
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Revenge: @ 81D8797
	doubledamagedealtifdamaged
	jump BattleScript_1D6F14

MoveEffect_BrickBreak: @ 81D879D
	attackcanceler
	accuracycheck BattleScript_1D6F72, 0
	attackstring
	ppreduce
	removereflectlightscreen
	critcalc
	atk5
	atk6
	atk7
	jumpifbyte 0, gSharedMem + 0x16002, 0, BattleScript_1D87BD
	bicbyte gBattleMoveFlags, 9

BattleScript_1D87BD: @ 81D87BD
	attackanimation
	waitanimation
	jumpifbyte 3, gSharedMem + 0x16002, 2, BattleScript_1D87D0
	printstring BATTLE_TEXT_BrokeWall
	waitmessage 64

BattleScript_1D87D0: @ 81D87D0
	damagecalc2
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	seteffectwithchancetarget
	faintpokemon TARGET, 0, 0x0
	jump BattleScript_EndTurn

MoveEffect_Yawn: @ 81D87EE
	attackcanceler
	attackstring
	ppreduce
	jumpifability TARGET, ABILITY_VITAL_SPIRIT, BattleScript_1D882F
	jumpifability TARGET, ABILITY_INSOMNIA, BattleScript_1D882F
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_ButItFailed
	jumpifhalverset TARGET, 32, BattleScript_1D9037
	accuracycheck BattleScript_ButItFailed, 65535
	jumpifcannotsleep BattleScript_ButItFailed
	setyawn BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_DrowsyMade
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D882F: @ 81D882F
	copyarray gSharedMem + 0x16003, gSharedMem + 0x160F8, 1

BattleScript_1D8839: @ 81D8839
	pause 32
	printstring BATTLE_TEXT_MadeIneffective2
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_KnockOff: @ 81D8847
	setbyte gUnknown_02024D1F + 0x2, 54
	jump BattleScript_1D6F14

MoveEffect_Endeavor: @ 81D8852
	attackcanceler
	attackstring
	ppreduce
	setdamagetohealthdifference BattleScript_ButItFailed
	copyarray gHP_dealt, gBattleMoveDamage, 4
	accuracycheck BattleScript_1D6F77, 0
	atk6
	jumpifbyte 4, gBattleMoveFlags, 41, BattleScript_1D6F48
	bicbyte gBattleMoveFlags, 6
	copyarray gBattleMoveDamage, gHP_dealt, 4
	atk69
	jump BattleScript_1D6F48

MoveEffect_Eruption: @ 81D888D
	scaledamagebyhealthratio
	jump BattleScript_1D6F14

MoveEffect_SkillSwap: @ 81D8893
	attackcanceler
	attackstring
	ppreduce
	accuracycheck BattleScript_ButItFailed, 65535
	abilityswap BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_AbilitySwap
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Imprison: @ 81D88AF
	attackcanceler
	attackstring
	ppreduce
	imprisoneffect BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_SealedMove
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Refresh: @ 81D88C4
	attackcanceler
	attackstring
	ppreduce
	cureifburnedparalysedorpoisoned BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_StatusNormal
	waitmessage 64
	atk98 1
	jump BattleScript_EndTurn

MoveEffect_Grudge: @ 81D88DB
	attackcanceler
	attackstring
	ppreduce
	setgrudge BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_GrudgeBear
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_Snatch: @ 81D88F0
	attackcanceler
	setstealstatchange BattleScript_1D83D4
	attackstring
	ppreduce
	attackanimation
	waitanimation
	pause 32
	printstring BATTLE_TEXT_AwaitMove
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_LowKick: @ 81D8908
	attackcanceler
	attackstring
	ppreduce
	weightdamagecalculation
	accuracycheck BattleScript_1D6F77, 0
	jump BattleScript_1D6F44

MoveEffect_SecretPower: @ 81D8918
	naturepowereffect
	jump BattleScript_1D6F14

MoveEffect_DoubleEdge: @ 81D891E
	setbyte gUnknown_02024D1F + 0x2, 230
	jump BattleScript_1D6F14

MoveEffect_TeeterDance: @ 81D8929
	attackcanceler
	attackstring
	ppreduce
	setbyte gBankTarget, 0

BattleScript_1D8932: @ 81D8932
	atk25
	setbyte gUnknown_02024D1F + 0x2, 7
	jumpifarrayequal gBankAttacker, gBankTarget, 1, BattleScript_1D8978
	jumpifability TARGET, ABILITY_OWN_TEMPO, BattleScript_1D8996
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_1D89B2
	jumpifsecondarytstatus TARGET, S_CONFUSED, BattleScript_1D89C0
	accuracycheck BattleScript_1D89CE, 0
	jumpifhalverset TARGET, 32, BattleScript_1D89A4
	attackanimation
	waitanimation
	seteffecttarget
	resultmessage
	waitmessage 64

BattleScript_1D8978: @ 81D8978
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	addbyte gBankTarget, 1
	jumpifarraynotequal gBankTarget, gNoOfAllBanks, 1, BattleScript_1D8932
	end

BattleScript_1D8996: @ 81D8996
	pause 32
	printstring BATTLE_TEXT_PreventedConfusion
	waitmessage 64
	jump BattleScript_1D8978

BattleScript_1D89A4: @ 81D89A4
	pause 32
	printstring BATTLE_TEXT_SafeguardActive
	waitmessage 64
	jump BattleScript_1D8978

BattleScript_1D89B2: @ 81D89B2
	pause 32
	printstring BATTLE_TEXT_Failed
	waitmessage 64
	jump BattleScript_1D8978

BattleScript_1D89C0: @ 81D89C0
	pause 32
	printstring BATTLE_TEXT_AlreadyConfused
	waitmessage 64
	jump BattleScript_1D8978

BattleScript_1D89CE: @ 81D89CE
	resultmessage
	waitmessage 64
	jump BattleScript_1D8978

MoveEffect_MudSport: @ 81D89D7
MoveEffect_WaterSport: @ 81D89D7
	attackcanceler
	attackstring
	ppreduce
	settypebasedhalvers BattleScript_ButItFailed
	attackanimation
	waitanimation
	printfromtable BattleTextList_4015D4
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_PoisonFang: @ 81D89EE
	setbyte gUnknown_02024D1F + 0x2, 6
	jump BattleScript_1D6F14

MoveEffect_WeatherBall: @ 81D89F9
	seteffectbyweather
	jump BattleScript_1D6F14

MoveEffect_Overheat: @ 81D89FF
	setbyte gUnknown_02024D1F + 0x2, 251
	jump BattleScript_1D6F14

MoveEffect_Tickle: @ 81D8A0A
	attackcanceler
	attackstring
	ppreduce
	jumpifstat TARGET, 2, 1, 0, BattleScript_1D8A1F
	jumpifstat TARGET, 0, 2, 0, BattleScript_1D8A7D

BattleScript_1D8A1F: @ 81D8A1F
	accuracycheck BattleScript_ButItFailed, 0
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation TARGET, 6, 5
	playstatchangeanimation TARGET, 2, 1
	setbyte gSharedMem + 0x1601E, 145
	statbuffchange 1, BattleScript_1D8A55
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8A55
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D8A55: @ 81D8A55
	playstatchangeanimation TARGET, 4, 1
	setbyte gSharedMem + 0x1601E, 146
	statbuffchange 1, BattleScript_1D8A78
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8A78
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D8A78: @ 81D8A78
	jump BattleScript_EndTurn

BattleScript_1D8A7D: @ 81D8A7D
	pause 32
	orbyte gBattleMoveFlags, 32
	printstring BATTLE_TEXT_StatNoLower
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_CosmicPower: @ 81D8A91
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, 3, 2, 12, BattleScript_1D8AA6
	jumpifstat USER, 0, 5, 12, BattleScript_1D8BCB

BattleScript_1D8AA6: @ 81D8AA6
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation USER, 36, 0
	setbyte gSharedMem + 0x1601E, 18
	statbuffchange 65, BattleScript_1D8AD1
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8AD1
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D8AD1: @ 81D8AD1
	setbyte gSharedMem + 0x1601E, 21
	statbuffchange 65, BattleScript_1D8AF0
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8AF0
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D8AF0: @ 81D8AF0
	jump BattleScript_EndTurn

MoveEffect_SkyUppercut: @ 81D8AF5
	orword gHitMarker, 0x10000
	jump BattleScript_1D6F14

MoveEffect_BulkUp: @ 81D8B03
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, 3, 1, 12, BattleScript_1D8B18
	jumpifstat USER, 0, 2, 12, BattleScript_1D8BCB

BattleScript_1D8B18: @ 81D8B18
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation USER, 6, 0
	setbyte gSharedMem + 0x1601E, 17
	statbuffchange 65, BattleScript_1D8B43
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8B43
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D8B43: @ 81D8B43
	setbyte gSharedMem + 0x1601E, 18
	statbuffchange 65, BattleScript_1D8B62
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8B62
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D8B62: @ 81D8B62
	jump BattleScript_EndTurn

MoveEffect_CalmMind: @ 81D8B67
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, 3, 4, 12, BattleScript_1D8B7C
	jumpifstat USER, 0, 5, 12, BattleScript_1D8BCB

BattleScript_1D8B7C: @ 81D8B7C
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation USER, 48, 0
	setbyte gSharedMem + 0x1601E, 20
	statbuffchange 65, BattleScript_1D8BA7
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8BA7
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D8BA7: @ 81D8BA7
	setbyte gSharedMem + 0x1601E, 21
	statbuffchange 65, BattleScript_1D8BC6
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8BC6
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D8BC6: @ 81D8BC6
	jump BattleScript_EndTurn

BattleScript_1D8BCB: @ 81D8BCB
	pause 32
	orbyte gBattleMoveFlags, 32
	printstring BATTLE_TEXT_StatNoHigher
	waitmessage 64
	jump BattleScript_EndTurn

MoveEffect_DragonDance: @ 81D8BDF
	attackcanceler
	attackstring
	ppreduce
	jumpifstat USER, 3, 1, 12, BattleScript_1D8BF4
	jumpifstat USER, 0, 3, 12, BattleScript_1D8BCB

BattleScript_1D8BF4: @ 81D8BF4
	attackanimation
	waitanimation
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation USER, 10, 0
	setbyte gSharedMem + 0x1601E, 17
	statbuffchange 65, BattleScript_1D8C1F
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8C1F
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D8C1F: @ 81D8C1F
	setbyte gSharedMem + 0x1601E, 19
	statbuffchange 65, BattleScript_1D8C3E
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8C3E
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D8C3E: @ 81D8C3E
	jump BattleScript_EndTurn

MoveEffect_Camouflage: @ 81D8C43
	attackcanceler
	attackstring
	ppreduce
	settypetoterrain BattleScript_ButItFailed
	attackanimation
	waitanimation
	printstring BATTLE_TEXT_TypeTransform
	waitmessage 64
	jump BattleScript_EndTurn

gUnknown_081D8C58:: @ 81D8C58
	atk56 1
	pause 64
	atk1a 1
	atk1b 1
	printstring BATTLE_TEXT_AttackingFainted
	return

gUnknown_081D8C65:: @ 81D8C65
	atk56 0
	pause 64
	atk1a 0
	atk1b 0
	printstring BATTLE_TEXT_DefendingFainted
	return

gUnknown_081D8C72:: @ 81D8C72
	setbyte gSharedMem + 0x1600F, 0
	atk23 0
	end2

gUnknown_081D8C7B:: @ 81D8C7B
	atk24 BattleScript_1D8D87
	jumpifbyte 1, gBattleOutcome, 0, BattleScript_1D8D86
	jumpifhalfword 4, gBattleTypeFlags, 8, BattleScript_1D8CC2
	jumpifword 5, gHitMarker, 0x400000, BattleScript_1D8CC2
	printstring BATTLE_TEXT_UseNext
	setbyte gBattleCommunication, 0
	atk67
	jumpifbyte 0, gUnknown_02024D1F, 0, BattleScript_1D8CC2
	atk72 BattleScript_1D8D86
	printstring BATTLE_TEXT_CantEscape

BattleScript_1D8CC2: @ 81D8CC2
	openpartyscreen 3, BattleScript_1D8D86
	atk51 3, 2
	jumpifhalfword 5, gBattleTypeFlags, 8, BattleScript_1D8D66
	jumpifhalfword 4, gBattleTypeFlags, 2, BattleScript_1D8D66
	jumpifhalfword 4, gBattleTypeFlags, 256, BattleScript_1D8D66
	jumpifhalfword 4, gBattleTypeFlags, 1, BattleScript_1D8D66
	jumpifword 4, gHitMarker, 0x400000, BattleScript_1D8D66
	jumpifbyte 0, gSharedMem + 0x16084, 1, BattleScript_1D8D66
	jumpifcannotswitch USER, BattleScript_1D8D66
	printstring BATTLE_TEXT_WillSwitch
	setbyte gBattleCommunication, 0
	atk67
	jumpifbyte 0, gUnknown_02024D1F, 1, BattleScript_1D8D66
	atk6e
	openpartyscreen 129, BattleScript_1D8D66
	atk51 USER, 2
	jumpifbyte 0, gBattleCommunication, 6, BattleScript_1D8D66
	atk6b
	atk76 USER, 5
	atk74 1
	printstring 2
	atke2 USER
	waitstateatk
	atk4b
	waitstateatk
	atk61 1
	switch1 USER
	switch2 USER
	atk73 USER
	printstring 3
	atk62 1
	switch3 USER, 0
	waitstateatk
	atk52 USER
	atk6d

BattleScript_1D8D66: @ 81D8D66
	atk61 3
	switch1 3
	switch2 3
	atk73 3
	printstring 3
	atk62 3
	switch3 3, 0
	waitstateatk
	atk52 3
	jumpifhalfword 4, gBattleTypeFlags, 1, BattleScript_1D8D86
	atk68

BattleScript_1D8D86: @ 81D8D86
	end2

BattleScript_1D8D87: @ 81D8D87
	openpartyscreen 5, BattleScript_1D8D8D

BattleScript_1D8D8D: @ 81D8D8D
	atk51 3, 0
	openpartyscreen 6, BattleScript_1D8DBD
	atk51 3, 0

BattleScript_1D8D99: @ 81D8D99
	atk51 3, 2
	atk61 3
	switch1 3
	switch2 3
	atk73 3
	printstring 3
	atk62 3
	switch3 3, 0
	waitstateatk
	atk52 5
	jumpifarraynotequal gBank1, gNoOfAllBanks, 1, BattleScript_1D8D99

BattleScript_1D8DBD: @ 81D8DBD
	end2

gUnknown_081D8DBE:: @ 81D8DBE
	printstring BATTLE_TEXT_PlayerDefeatedTrainer2
	atk53 1
	waitstateatk
	printstring BATTLE_TEXT_UnknownString
	atk5d
	printstring BATTLE_TEXT_WinningPrize
	waitmessage 64

gUnknown_081D8DCE:: @ 81D8DCE
	givemoney
	pickupitemcalculation
	end2

gUnknown_081D8DD1:: @ 81D8DD1
	jumpifhalfword 4, gBattleTypeFlags, 256, BattleScript_1D8E01
	jumpifhalfword 4, gBattleTypeFlags, 2048, BattleScript_1D8E01
	jumpifhalfword 0, gTrainerBattleOpponent, 1024, BattleScript_1D8E01
	printstring BATTLE_TEXT_OutOfUsablePoke
	waitmessage 64
	printstring BATTLE_TEXT_WhitedOut
	waitmessage 64

BattleScript_1D8E01: @ 81D8E01
	end2

gUnknown_081D8E02:: @ 81D8E02
	printstring 5
	waitmessage 64
	atk57
	waitmessage 64
	end2

gUnknown_081D8E0D:: @ 81D8E0D
	printstring BATTLE_TEXT_PlayerDefeatedTrainer2
	atk53 1
	waitstateatk
	end2

gUnknown_081D8E14:: @ 81D8E14
	playanimation USER, 8, 0x0
	printstring BATTLE_TEXT_FledUsingItem
	waitmessage 64
	end2

gUnknown_081D8E22:: @ 81D8E22
	printstring BATTLE_TEXT_FledUsingOther
	waitmessage 64
	end2

gUnknown_081D8E29:: @ 81D8E29
	printstring BATTLE_TEXT_GotAwaySafely
	waitmessage 64
	end2

gUnknown_081D8E30:: @ 81D8E30
	printstring BATTLE_TEXT_FledWild
	waitmessage 64
	end2

gUnknown_081D8E37:: @ 81D8E37
	printstring BATTLE_TEXT_NoRunning
	end2

gUnknown_081D8E3B:: @ 81D8E3B
	printfromtable BattleTextList_401512
	waitmessage 64
	end2

gUnknown_081D8E44:: @ 81D8E44
	printfromtable2 BattleTextList_401512
	atk44

gUnknown_081D8E4A:: @ 81D8E4A
	printstring2 BATTLE_TEXT_BoxFull
	atk44

gUnknown_081D8E4E:: @ 81D8E4E
	atk74 1
	printstring 2
	setbyte gSharedMem + 0x1601F, 2
	jumpifbyte 4, gBattleTypeFlags, 1, BattleScript_1D8E6B
	atk26 1
	jump BattleScript_1D8E6D

BattleScript_1D8E6B: @ 81D8E6B
	atk26 2

BattleScript_1D8E6D: @ 81D8E6D
	atkba BattleScript_1D8E7A
	atk5f
	atkab
	callatk BattleScript_1D8EAD
	atk5f

BattleScript_1D8E7A: @ 81D8E7A
	atk27 BattleScript_1D8E6D
	atke2 USER
	waitstateatk
	atk4b
	waitstateatk
	atk61 1
	atk51 USER, 1
	switch1 USER
	switch2 USER
	atk73 USER
	printstring 3
	atk62 1
	switch3 USER, 0
	waitstateatk
	atk52 USER
	setbyte gSharedMem + 0x1600C, 4
	atk49 1, 0
	setbyte gSharedMem + 0x1600C, 15
	atk49 1, 0
	end2

BattleScript_1D8EAD: @ 81D8EAD
	pause 32
	attackstring
	ppreduce
	critcalc
	atk5
	atk6
	atk7
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	critmessage
	waitmessage 64
	resultmessage
	waitmessage 64
	faintpokemon TARGET, 0, 0x0
	setbyte gSharedMem + 0x1600C, 3
	atk49 2, 6
	atk76 TARGET, 4
	jumpifbyte 0, gBattleCommunication, 0, BattleScript_1D8EEE
	setbyte gSharedMem + 0x1600F, 0
	atk23 0

BattleScript_1D8EEE: @ 81D8EEE
	return

BattleScript_Pausex20:: @ 81D8EEF
	pause 32
	return

BattleScript_LevelUp:: @ 81D8EF3
	atk55 0xe10016f
	attackcanceler
	setbyte gSharedMem + 0x1609C, 0
	atk6c
	checkiflearnmoveinbattle BattleScript_1D8F4F, BattleScript_1D8F61, 1
	jump BattleScript_1D8F19

BattleScript_1D8F0F: @ 81D8F0F
	checkiflearnmoveinbattle BattleScript_1D8F4F, BattleScript_1D8F61, 0

BattleScript_1D8F19: @ 81D8F19
	atk71
	printstring BATTLE_TEXT_TryingToLearnMove
	printstring BATTLE_TEXT_CantLearnMore
	printstring BATTLE_TEXT_DeleteMove
	waitstateatk
	setbyte gSharedMem + 0x1601A, 0
	atk5a BattleScript_1D8F46
	printstring BATTLE_TEXT_StopLearning
	waitstateatk
	setbyte gSharedMem + 0x1601A, 0
	atk5b BattleScript_1D8F19
	printstring BATTLE_TEXT_DidNotLearn
	jump BattleScript_1D8F0F

BattleScript_1D8F46: @ 81D8F46
	printstring BATTLE_TEXT_MoveForget123
	printstring BATTLE_TEXT_DeletedMove
	printstring BATTLE_TEXT_MoveForgetAnd

BattleScript_1D8F4F: @ 81D8F4F
	atk71
	atk55 0xf10016f
	attackcanceler
	waitmessage 64
	atk76 USER, 6
	jump BattleScript_1D8F0F

BattleScript_1D8F61: @ 81D8F61
	return

gUnknown_081D8F62:: @ 81D8F62
	printfromtable BattleTextList_401534
	waitmessage 64
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D8F7C
	playanimation USER, 10, 0x0

BattleScript_1D8F7C: @ 81D8F7C
	end2

gUnknown_081D8F7D:: @ 81D8F7D
	printfromtable BattleTextList_401528
	waitmessage 64
	atk46 1, gSharedMem + 0x160A4, 0x0
	setbyte gBattleCommunication, 0

BattleScript_1D8F95: @ 81D8F95
	atk32 gBankAttacker, gTurnOrder, gBattleCommunication, 1
	weatherdamage
	jumpifword 0, gBattleMoveDamage, 0x0, BattleScript_1D8FD6
	printfromtable BattleTextList_40152C
	waitmessage 64
	orword gHitMarker, 0x1100120
	missmessage
	atk5c USER
	graphicalhpupdate USER
	datahpupdate USER
	faintpokemon USER, 0, 0x0
	atk24 BattleScript_1D8FD6

BattleScript_1D8FD6: @ 81D8FD6
	jumpifbyte 1, gBattleOutcome, 0, BattleScript_1D8FF5
	addbyte gBattleCommunication, 1
	jumpifarraynotequal gBattleCommunication, gNoOfAllBanks, 1, BattleScript_1D8F95

BattleScript_1D8FF5: @ 81D8FF5
	bicword gHitMarker, 0x1100120
	end2

gUnknown_081D8FFF:: @ 81D8FFF
	printfromtable BattleTextList_401530
	waitmessage 64
	end2

gUnknown_081D9008:: @ 81D9008
	printstring BATTLE_TEXT_SunStrong
	waitmessage 64
	playanimation USER, 11, 0x0
	end2

gUnknown_081D9016:: @ 81D9016
	printstring BATTLE_TEXT_SunFaded
	waitmessage 64
	end2

gUnknown_081D901D:: @ 81D901D
	printfromtable BattleTextList_4015EE
	waitmessage 64
	atk46 1, gSharedMem + 0x160A4, 0x0
	end3

gUnknown_081D9030:: @ 81D9030
	printstring BATTLE_TEXT_WoreOff
	waitmessage 64
	end2

BattleScript_1D9037: @ 81D9037
	pause 32
	printstring BATTLE_TEXT_SafeguardActive
	waitmessage 64
	end2

gUnknown_081D9041:: @ 81D9041
	pause 32
	printstring BATTLE_TEXT_SafeguardFaded
	waitmessage 64
	end2

BattleScript_LeechSeedTurnDrain:: @ 81D904B
	playanimation USER, 14, gSharedMem + 0x160A4
	orword gHitMarker, 0x100100
	graphicalhpupdate USER
	datahpupdate USER
	copyarray gBattleMoveDamage, gHP_dealt, 4
	jumpifability USER, ABILITY_LIQUID_OOZE, BattleScript_1D907D
	manipulatedamage 0
	setbyte gUnknown_02024D1F + 0x4, 3
	jump BattleScript_1D9083

BattleScript_1D907D: @ 81D907D
	setbyte gUnknown_02024D1F + 0x4, 4

BattleScript_1D9083: @ 81D9083
	orword gHitMarker, 0x100100
	graphicalhpupdate TARGET
	datahpupdate TARGET
	printfromtable BattleTextList_40154C
	waitmessage 64
	faintpokemon USER, 0, 0x0
	faintpokemon TARGET, 0, 0x0
	end2

BattleScript_BideStoringEnergy:: @ 81D90A7
	printstring BATTLE_TEXT_StoringEnergy
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_BideAttack:: @ 81D90B2
	printstring BATTLE_TEXT_UnleashedEnergy
	waitmessage 64
	accuracycheck BattleScript_1D6F77, 0
	atk6
	bicbyte gBattleMoveFlags, 6
	copyarray gBattleMoveDamage, gSharedMem + 0x16090, 4
	atk69
	setbyte gSharedMem + 0x16002, 1
	attackanimation
	waitanimation
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	resultmessage
	waitmessage 64
	faintpokemon TARGET, 0, 0x0
	jump BattleScript_EndTurn

BattleScript_BideNoEnergyToAttack:: @ 81D90F1
	printstring BATTLE_TEXT_UnleashedEnergy
	waitmessage 64
	jump BattleScript_ButItFailed

gUnknown_081D90FC:: @ 81D90FC
	attackanimation
	waitanimation
	atke2 TARGET
	atk58 TARGET
	waitstateatk
	jumpifhalfword 4, gBattleTypeFlags, 8, BattleScript_1D9116
	setbyte gBattleOutcome, 5
	atkf6

BattleScript_1D9116: @ 81D9116
	switch1 TARGET
	switch2 TARGET
	switch3 TARGET, 0
	waitstateatk
	printstring BATTLE_TEXT_DraggedOut
	atk52 TARGET
	jump BattleScript_EndTurn

BattleScript_MistProtected:: @ 81D9128
	pause 32
	printstring BATTLE_TEXT_MistProtect
	waitmessage 64
	return

gUnknown_081D9132:: @ 81D9132
	printstring BATTLE_TEXT_RageBuilding
	waitmessage 64
	return

BattleScript_MoveUsedIsDisabled:: @ 81D9139
	printstring BATTLE_TEXT_MoveIsDisabled
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_MoveSelectionDisabledMove:: @ 81D9144
	printstring2 BATTLE_TEXT_MoveIsDisabled
	atk44

BattleScript_DisabledNoMore:: @ 81D9148
	printstring BATTLE_TEXT_DisabledNoMore
	waitmessage 64
	end2

BattleScript_EncoredNoMore:: @ 81D914F
	printstring BATTLE_TEXT_EncoreEnded
	waitmessage 64
	end2

gUnknown_081D9156:: @ 81D9156
	printstring BATTLE_TEXT_DestinyBondTaken
	waitmessage 64
	orword gHitMarker, 0x100100
	graphicalhpupdate USER
	datahpupdate USER
	faintpokemon USER, 0, 0x0
	return

gUnknown_081D9171:: @ 81D9171
	orword gHitMarker, 0x100100
	graphicalhpupdate USER
	datahpupdate USER
	callatk BattleScript_1D91FB
	faintpokemon USER, 0, 0x0
	faintpokemon USER, 1, BattleScript_1D9192
	return

BattleScript_1D9192: @ 81D9192
	setbyte gSharedMem + 0x1600F, 0
	atk23 1
	jump gUnknown_081D8C7B

gUnknown_081D919F:: @ 81D919F
	orword gHitMarker, 0x100100
	graphicalhpupdate TARGET
	datahpupdate TARGET
	callatk BattleScript_1D91FB
	faintpokemon TARGET, 0, 0x0
	faintpokemon TARGET, 1, BattleScript_1D91C0
	return

BattleScript_1D91C0: @ 81D91C0
	setbyte gSharedMem + 0x1600F, 0
	atk23 0
	jump gUnknown_081D8C7B

gUnknown_081D91CD:: @ 81D91CD
	orword gHitMarker, 0x100100
	graphicalhpupdate 3
	datahpupdate 3
	callatk BattleScript_1D91FB
	faintpokemon 3, 0, 0x0
	faintpokemon 3, 1, BattleScript_1D91EE
	return

BattleScript_1D91EE: @ 81D91EE
	setbyte gSharedMem + 0x1600F, 0
	atk23 3
	jump gUnknown_081D8C7B

BattleScript_1D91FB: @ 81D91FB
	printstring BATTLE_TEXT_SpikesHurt
	waitmessage 64
	return

BattleScript_PerishSongHits:: @ 81D9202
	printstring BATTLE_TEXT_PerishSongFell
	waitmessage 64
	orword gHitMarker, 0x100100
	graphicalhpupdate USER
	datahpupdate USER
	faintpokemon USER, 0, 0x0
	end2

BattleScript_PerishSongTimerGoesDown:: @ 81D921D
	printstring BATTLE_TEXT_PerishSongFell
	waitmessage 64
	end2

BattleScript_AllStatsUp:: @ 81D9224
	jumpifstat USER, 3, 1, 12, BattleScript_1D9251
	jumpifstat USER, 3, 2, 12, BattleScript_1D9251
	jumpifstat USER, 3, 3, 12, BattleScript_1D9251
	jumpifstat USER, 3, 4, 12, BattleScript_1D9251
	jumpifstat USER, 0, 5, 12, BattleScript_1D92BF

BattleScript_1D9251: @ 81D9251
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation USER, 62, 0
	setbyte gSharedMem + 0x1601E, 17
	statbuffchange 65, BattleScript_1D926F
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D926F: @ 81D926F
	setbyte gSharedMem + 0x1601E, 18
	statbuffchange 65, BattleScript_1D9283
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D9283: @ 81D9283
	setbyte gSharedMem + 0x1601E, 19
	statbuffchange 65, BattleScript_1D9297
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D9297: @ 81D9297
	setbyte gSharedMem + 0x1601E, 20
	statbuffchange 65, BattleScript_1D92AB
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D92AB: @ 81D92AB
	setbyte gSharedMem + 0x1601E, 21
	statbuffchange 65, BattleScript_1D92BF
	printfromtable BattleTextList_401570
	waitmessage 64

BattleScript_1D92BF: @ 81D92BF
	return

BattleScript_RapidSpinAway:: @ 81D92C0
	breakfree
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

BattleScript_FutureSightHits:: @ 81D92D7
	printstring BATTLE_TEXT_TookAttack
	waitmessage 64
	jumpifbyte 1, gUnknown_02024D1F + 0x4, 0, BattleScript_1D92F4
	accuracycheck BattleScript_1D934B, 248
	jump BattleScript_1D92FB

BattleScript_1D92F4: @ 81D92F4
	accuracycheck BattleScript_1D934B, 353

BattleScript_1D92FB: @ 81D92FB
	atk8
	jumpifbyte 1, gUnknown_02024D1F + 0x4, 0, BattleScript_1D9313
	playanimation USER, 18, 0x0
	jump BattleScript_1D931A

BattleScript_1D9313: @ 81D9313
	playanimation USER, 19, 0x0

BattleScript_1D931A: @ 81D931A
	missmessage
	atk5c TARGET
	waitstateatk
	graphicalhpupdate TARGET
	datahpupdate TARGET
	resultmessage
	waitmessage 64
	faintpokemon TARGET, 0, 0x0
	atk24 BattleScript_1D9332

BattleScript_1D9332: @ 81D9332
	setbyte gSharedMem + 0x1600C, 0
	atk49 1, 0
	setbyte gSharedMem + 0x1600C, 8
	atk49 2, 14
	setbyte gBattleMoveFlags, 0
	end2

BattleScript_1D934B: @ 81D934B
	pause 32
	setbyte gBattleMoveFlags, 0
	orbyte gBattleMoveFlags, 32
	resultmessage
	waitmessage 64
	setbyte gBattleMoveFlags, 0
	end2

BattleScript_NoMovesLeft:: @ 81D9365
	printstring2 BATTLE_TEXT_NoMovesLeft
	atk44

BattleScript_MoveSelectionNoPP:: @ 81D9369
	printstring2 BATTLE_TEXT_NoPP1
	atk44

BattleScript_NoPPForMove:: @ 81D936D
	attackstring
	pause 32
	printstring BATTLE_TEXT_NoPP2
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_MoveSelectionTormented:: @ 81D937C
	printstring2 BATTLE_TEXT_TormentNoUse
	atk44
	printstring BATTLE_TEXT_TormentNoUse
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_MoveSelectionTaunted:: @ 81D938B
	printstring2 BATTLE_TEXT_TauntNoUse
	atk44

BattleScript_MoveUsedIsTaunted:: @ 81D938F
	printstring BATTLE_TEXT_TauntNoUse
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_WishComesTrue:: @ 81D939A
	atkd4 1, BattleScript_1D93C1
	playanimation TARGET, 22, 0x0
	printstring BATTLE_TEXT_WishTrue
	waitmessage 64
	orword gHitMarker, 0x100
	graphicalhpupdate TARGET
	datahpupdate TARGET
	printstring BATTLE_TEXT_RegainedHealth
	waitmessage 64
	end2

BattleScript_1D93C1: @ 81D93C1
	printstring BATTLE_TEXT_WishTrue
	waitmessage 64
	pause 32
	printstring BATTLE_TEXT_HPFull
	waitmessage 64
	end2

BattleScript_IngrainTurnHeal:: @ 81D93D1
	playanimation USER, 21, 0x0
	printstring BATTLE_TEXT_AbsorbNutrients
	waitmessage 64
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	end2

BattleScript_1D93EC: @ 81D93EC
	pause 32
	printstring BATTLE_TEXT_AnchoredItself
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_AtkDefDown:: @ 81D93FA
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation USER, 6, 13
	playstatchangeanimation USER, 2, 9
	setbyte gSharedMem + 0x1601E, 145
	statbuffchange 193, BattleScript_1D9427
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D9427
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D9427: @ 81D9427
	playstatchangeanimation USER, 4, 9
	setbyte gSharedMem + 0x1601E, 146
	statbuffchange 193, BattleScript_1D944A
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D944A
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D944A: @ 81D944A
	return

BattleScript_KnockedOff:: @ 81D944B
	playanimation TARGET, 5, 0x0
	printstring BATTLE_TEXT_KnockedOffItem
	waitmessage 64
	return

BattleScript_MoveUsedIsImprisoned:: @ 81D9459
	printstring BATTLE_TEXT_SealedNoUse
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_MoveSelectionImprisoned:: @ 81D9464
	printstring2 BATTLE_TEXT_SealedNoUse
	atk44

gUnknown_081D9468:: @ 81D9468
	printstring BATTLE_TEXT_GrudgeLosePP
	waitmessage 64
	return

BattleScript_MagicCoatBounce:: @ 81D946F
	attackstring
	ppreduce
	pause 32
	printstring BATTLE_TEXT_MagicCoatBounce
	waitmessage 64
	orword gHitMarker, 0x800c00
	atk76 USER, 1
	return

BattleScript_SnatchedMove:: @ 81D9487
	attackstring
	ppreduce
	snatchmove
	playanimation TARGET, 17, 0x0
	printstring BATTLE_TEXT_SnatchedMove
	waitmessage 64
	orword gHitMarker, 0x800c00
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
	setbyte gSharedMem + 0x160DC, 0
	playstatchangeanimation USER, 16, 11
	setbyte gSharedMem + 0x1601E, 164
	statbuffchange 193, BattleScript_1D94D9
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 2, BattleScript_1D94D9
	printfromtable BattleTextList_40157C
	waitmessage 64

BattleScript_1D94D9: @ 81D94D9
	return

gUnknown_081D94DA:: @ 81D94DA
	printstring BATTLE_TEXT_Terminator2
	waitmessage 1
	playanimation USER, 20, 0x0
	printstring BATTLE_TEXT_TightenFocus
	waitmessage 64
	end2

BattleScript_MoveUsedIsAsleep:: @ 81D94EE
	printstring BATTLE_TEXT_FastAsleep
	waitmessage 64
	statusanimation USER
	jump BattleScript_EndTurn

BattleScript_MoveUsedWokeUp:: @ 81D94FB
	bicword gHitMarker, 0x10
	printfromtable BattleTextList_401562
	waitmessage 64
	atk98 1
	return

gUnknown_081D950F:: @ 81D950F
	printstring BATTLE_TEXT_UproarWoke
	waitmessage 64
	atk98 1
	end2

BattleScript_PoisonTurnDmg:: @ 81D9518
	printstring BATTLE_TEXT_PoisonHurt
	waitmessage 64

BattleScript_1D951E: @ 81D951E
	statusanimation USER

BattleScript_1D9520: @ 81D9520
	orword gHitMarker, 0x100100
	graphicalhpupdate USER
	datahpupdate USER
	faintpokemon USER, 0, 0x0
	atk24 BattleScript_1D9539

BattleScript_1D9539: @ 81D9539
	end2

BattleScript_BurnTurnDmg:: @ 81D953A
	printstring BATTLE_TEXT_BurnHurt
	waitmessage 64
	jump BattleScript_1D951E

BattleScript_MoveUsedIsFrozen:: @ 81D9545
	printstring BATTLE_TEXT_FrozenSolid
	waitmessage 64
	statusanimation USER
	jump BattleScript_EndTurn

BattleScript_MoveUsedUnfroze:: @ 81D9552
	printfromtable BattleTextList_4015C4
	waitmessage 64
	atk98 1
	return

gUnknown_081D955D:: @ 81D955D
	printstring BATTLE_TEXT_DefendingDefrosted
	waitmessage 64
	atk98 0
	return

BattleScript_MoveUsedIsParalyzed:: @ 81D9566
	printstring BATTLE_TEXT_Paralyzed3
	waitmessage 64
	statusanimation USER
	jump BattleScript_EndTurn

BattleScript_MoveUsedFlinched:: @ 81D9573
	printstring BATTLE_TEXT_Flinched
	waitmessage 64
	jump BattleScript_EndTurn

gUnknown_081D957E:: @ 81D957E
	printfromtable BattleTextList_40155A
	waitmessage 64
	end2

BattleScript_ThrashConfuses:: @ 81D9587
	atk66 1, 1, S_CONFUSED
	printstring BATTLE_TEXT_FatigueConfuse
	waitmessage 64
	end2

BattleScript_MoveUsedIsConfused:: @ 81D9595
	printstring BATTLE_TEXT_Confused
	waitmessage 64
	atk65 1, 0x7
	jumpifbyte 0, gUnknown_02024D1F + 0x4, 0, BattleScript_1D95D3

BattleScript_1D95AC: @ 81D95AC
	atk76 USER, 0
	atk8
	printstring BATTLE_TEXT_HurtItself
	waitmessage 64
	missmessage
	atk5c USER
	waitstateatk
	orword gHitMarker, 0x100100
	graphicalhpupdate USER
	datahpupdate USER
	faintpokemon USER, 0, 0x0
	jump BattleScript_EndTurn

BattleScript_1D95D3: @ 81D95D3
	return

BattleScript_MoveUsedIsConfusedNoMore:: @ 81D95D4
	printstring BATTLE_TEXT_ConfusionSnapOut
	waitmessage 64
	return

gUnknown_081D95DB:: @ 81D95DB
	printstring BATTLE_TEXT_PickedUpYen
	waitmessage 64
	return

BattleScript_WrapTurnDmg:: @ 81D95E2
	playanimation USER, 6, gSharedMem + 0x160A4
	printstring BATTLE_TEXT_HurtBy
	waitmessage 64
	jump BattleScript_1D9520

BattleScript_WrapEnds:: @ 81D95F4
	printstring BATTLE_TEXT_FreedFrom
	waitmessage 64
	end2

BattleScript_MoveUsedIsInLove:: @ 81D95FB
	printstring BATTLE_TEXT_InLoveWith
	waitmessage 64
	atk65 1, 0xf0000
	return

BattleScript_MoveUsedIsParalyzedCantAttack:: @ 81D9608
	printstring BATTLE_TEXT_ImmobilizedBy
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_NightmareTurnDmg:: @ 81D9613
	printstring BATTLE_TEXT_NightmareLock
	waitmessage 64
	atk65 1, Start
	jump BattleScript_1D9520

BattleScript_CurseTurnDmg:: @ 81D9624
	printstring BATTLE_TEXT_CurseAfflict
	waitmessage 64
	atk65 1, 0x10000000
	jump BattleScript_1D9520

BattleScript_TargetPRLZHeal:: @ 81D9635
	printstring BATTLE_TEXT_ParalysisHealed
	waitmessage 64
	atk98 0
	return

BattleScript_1D963E:: @ 81D963E
	statusanimation 2
	printfromtable BattleTextList_4015B8
	waitmessage 64

BattleScript_1D9648: @ 81D9648
	atk98 2
	waitstateatk
	return

BattleScript_YawnMakesAsleep:: @ 81D964C
	statusanimation 2
	printstring BATTLE_TEXT_FellAsleep
	waitmessage 64
	atk98 2
	waitstateatk
	atk6f 2
	end2

BattleScript_1D965A:: @ 81D965A
	statusanimation 2
	printfromtable BattleTextList_4015B0
	waitmessage 64
	jump BattleScript_1D9648

BattleScript_1D9669:: @ 81D9669
	statusanimation 2
	printfromtable BattleTextList_4015BC
	waitmessage 64
	jump BattleScript_1D9648

BattleScript_1D9678:: @ 81D9678
	statusanimation 2
	printfromtable BattleTextList_4015C0
	waitmessage 64
	jump BattleScript_1D9648

BattleScript_1D9687:: @ 81D9687
	statusanimation 2
	printfromtable BattleTextList_4015B4
	waitmessage 64
	jump BattleScript_1D9648

BattleScript_1D9696:: @ 81D9696
	printstring BATTLE_TEXT_UproarCaused
	waitmessage 64
	return

BattleScript_1D969D:: @ 81D969D
	statusanimation 2
	printstring BATTLE_TEXT_BadlyPoisoned
	waitmessage 64
	jump BattleScript_1D9648

BattleScript_1D96AA:: @ 81D96AA
	printstring BATTLE_TEXT_CoinScatter
	waitmessage 64
	return

BattleScript_1D96B1:: @ 81D96B1
	printfromtable BattleTextList_401594
	waitmessage 64
	return

BattleScript_1D96BA:: @ 81D96BA
	atk66 2, 1, S_CONFUSED
	printstring BATTLE_TEXT_BecameConfused
	waitmessage 64
	return

BattleScript_1D96C8:: @ 81D96C8
	jumpifhalfword 0, gCurrentMove, 165, BattleScript_1D96DB
	jumpifability USER, ABILITY_ROCK_HEAD, BattleScript_1D96F5

BattleScript_1D96DB: @ 81D96DB
	orword gHitMarker, 0x100100
	graphicalhpupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_HitRecoil
	waitmessage 64
	faintpokemon USER, 0, 0x0

BattleScript_1D96F5: @ 81D96F5
	return

BattleScript_ItemSteal:: @ 81D96F6
	playanimation TARGET, 16, 0x0
	printstring BATTLE_TEXT_StoleSomething
	waitmessage 64
	return

BattleScript_DrizzleActivates:: @ 81D9704
	pause 32
	printstring BATTLE_TEXT_RainMade
	waitstateatk
	playanimation 7, 10, 0x0
	callatk BattleScript_1D9761
	end3

BattleScript_SpeedBoostActivates:: @ 81D9718
	playanimation USER, 1, gSharedMem + 0x160A4
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
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	end3

BattleScript_SandstreamActivates:: @ 81D9744
	pause 32
	printstring BATTLE_TEXT_WhipSandstorm
	waitstateatk
	playanimation 7, 12, 0x0
	callatk BattleScript_1D9761
	end3

BattleScript_ShedSkinActivates:: @ 81D9758
	printstring BATTLE_TEXT_CuredProblem
	waitmessage 64
	atk98 1
	end3

BattleScript_1D9761: @ 81D9761
	setbyte gSharedMem + 0x16003, 0

BattleScript_1D9767: @ 81D9767
	castformswitch
	addbyte gSharedMem + 0x16003, 1
	jumpifarraynotequal gSharedMem + 0x16003, gNoOfAllBanks, 1, BattleScript_1D9767
	return

BattleScript_CastformChange:: @ 81D977D
	callatk BattleScript_1D9783
	end3

BattleScript_1D9783: @ 81D9783
	actualcastformswitch
	waitstateatk
	printstring BATTLE_TEXT_Transformed2
	waitmessage 64
	return

gUnknown_081D978C:: @ 81D978C
	callatk BattleScript_1D9792
	end3

BattleScript_1D9792: @ 81D9792
	pause 32

gUnknown_081D9795:: @ 81D9795
	setbyte gBankTarget, 0
	setbyte gSharedMem + 0x1601E, 145

BattleScript_1D97A1: @ 81D97A1
	atke1 BattleScript_1D97EF
	jumpifsecondarytstatus TARGET, S_SUBSTITUTE, BattleScript_1D97E4
	jumpifability TARGET, ABILITY_CLEAR_BODY, BattleScript_1D97F0
	jumpifability TARGET, ABILITY_HYPER_CUTTER, BattleScript_1D97F0
	jumpifability TARGET, ABILITY_WHITE_SMOKE, BattleScript_1D97F0
	statbuffchange 33, BattleScript_1D97E4
	jumpifbyte 2, gUnknown_02024D1F + 0x4, 1, BattleScript_1D97E4
	atk47
	playanimation TARGET, 1, gSharedMem + 0x160A4
	printstring BATTLE_TEXT_CutsAttack
	waitmessage 64

BattleScript_1D97E4: @ 81D97E4
	addbyte gBankTarget, 1
	jump BattleScript_1D97A1

BattleScript_1D97EF: @ 81D97EF
	return

BattleScript_1D97F0: @ 81D97F0
	pause 32
	printstring BATTLE_TEXT_PreventedOther
	waitmessage 64
	jump BattleScript_1D97E4

BattleScript_DroughtActivates:: @ 81D97FE
	pause 32
	printstring BATTLE_TEXT_SunIntensified
	waitstateatk
	playanimation 7, 11, 0x0
	callatk BattleScript_1D9761
	end3

BattleScript_TookAttack:: @ 81D9812
	attackstring
	pause 32
	printstring BATTLE_TEXT_TookAttack2
	waitmessage 64
	orword gHitMarker, 0x400
	return

gUnknown_081D9826:: @ 81D9826
	pause 32
	printstring BATTLE_TEXT_ProtectedBy
	pause 64
	jump BattleScript_EndTurn

gUnknown_081D9834:: @ 81D9834
	pause 32
	printstring BATTLE_TEXT_PreventedBy
	pause 64
	jump BattleScript_EndTurn

BattleScript_MoveHPDrain_PPLoss:: @ 81D9842
	ppreduce

BattleScript_MoveHPDrain:: @ 81D9843
	attackstring
	pause 32
	orword gHitMarker, 0x100
	graphicalhpupdate TARGET
	datahpupdate TARGET
	printstring BATTLE_TEXT_HPRestoredUsing
	waitmessage 64
	orbyte gBattleMoveFlags, 8
	jump BattleScript_EndTurn

BattleScript_MoveHPDrain_FullHP_PPLoss:: @ 81D9865
	ppreduce

BattleScript_MoveHPDrain_FullHP:: @ 81D9866
	attackstring
	pause 32
	printstring BATTLE_TEXT_MadeUseless
	waitmessage 64
	orbyte gBattleMoveFlags, 8
	jump BattleScript_EndTurn

BattleScript_FlashFireBoost_PPLoss:: @ 81D987B
	ppreduce

BattleScript_FlashFireBoost:: @ 81D987C
	attackstring
	pause 32
	printfromtable BattleTextList_401648
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D988D: @ 81D988D
	pause 32
	printstring BATTLE_TEXT_AnchorsItself
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_AbilityNoStatLoss:: @ 81D989B
	pause 32
	printstring BATTLE_TEXT_PreventedStatLoss
	waitmessage 64
	return

BattleScript_BRNPrevention:: @ 81D98A5
	pause 32
	printfromtable BattleTextList_401630
	waitmessage 64
	return

BattleScript_PRLZPrevention:: @ 81D98B1
	pause 32
	printfromtable BattleTextList_401636
	waitmessage 64
	return

BattleScript_PSNPrevention:: @ 81D98BD
	pause 32
	printfromtable BattleTextList_40163C
	waitmessage 64
	return

BattleScript_ObliviousPreventsAttraction:: @ 81D98C9
	pause 32
	printstring BATTLE_TEXT_PreventedRomance
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_FlinchPrevention:: @ 81D98D7
	pause 32
	printstring BATTLE_TEXT_PreventedFlinching
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_1D98E5: @ 81D98E5
	pause 32
	printstring BATTLE_TEXT_PreventedConfusion
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_SoundproofProtected:: @ 81D98F3
	attackstring
	ppreduce
	pause 32
	printstring BATTLE_TEXT_BlocksOther
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_AbilityNoSpecificStatLoss:: @ 81D9903
	pause 32
	printstring BATTLE_TEXT_PreventedLoss
	waitmessage 64
	setbyte gUnknown_02024D1F + 0x4, 3
	return

BattleScript_NoItemSteal:: @ 81D9913
	pause 32
	printstring BATTLE_TEXT_MadeIneffective
	waitmessage 64
	jump BattleScript_EndTurn

BattleScript_ColorChangeActivates:: @ 81D9921
	printstring BATTLE_TEXT_MadeType
	waitmessage 64
	return

BattleScript_RoughSkinActivates:: @ 81D9928
	orword gHitMarker, 0x100100
	graphicalhpupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_HurtOther
	waitmessage 64
	faintpokemon USER, 0, 0x0
	return

BattleScript_CuteCharmActivates:: @ 81D9943
	atk65 1, 0xf0000
	printstring BATTLE_TEXT_InfatuatedPoke
	waitmessage 64
	return

BattleScript_ApplySecondaryEffect:: @ 81D9950
	waitstateatk
	seteffectuser
	return

BattleScript_SynchronizeActivates:: @ 81D9953
	waitstateatk
	seteffecttarget
	return

gUnknown_081D9956:: @ 81D9956
	printstring BATTLE_TEXT_CuredOfProblem
	waitmessage 64
	atk98 10
	return

gUnknown_081D995F:: @ 81D995F
	printstring BATTLE_TEXT_IgnoredOrdersSLP
	waitmessage 64
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	end

gUnknown_081D996F:: @ 81D996F
	printstring BATTLE_TEXT_IgnoredOrders
	waitmessage 64
	jumptoattack TARGET

BattleScript_MoveUsedLoafingAround:: @ 81D9977
	printfromtable BattleTextList_40160E
	waitmessage 64
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	end

gUnknown_081D9989:: @ 81D9989
	printstring BATTLE_TEXT_BeganNap
	waitmessage 64
	setbyte gUnknown_02024D1F + 0x2, 65
	seteffecttarget
	setbyte gSharedMem + 0x1600C, 0
	atk49 2, 16
	end

gUnknown_081D99A0:: @ 81D99A0
	printstring BATTLE_TEXT_WontObey
	waitmessage 64
	jump BattleScript_1D95AC

BattleScript_SubstituteFade:: @ 81D99AB
	playanimation TARGET, 2, 0x0
	printstring BATTLE_TEXT_SubFaded
	return

BattleScript_BerryCurePrlzEnd2:: @ 81D99B6
	callatk BattleScript_BerryCureParRet
	end2

BattleScript_BerryCureParRet:: @ 81D99BC
	playanimation 10, 7, 0x0
	printstring BATTLE_TEXT_CuredParalysis
	waitmessage 64
	atk98 10
	removeitem 10
	return

BattleScript_BerryCurePsnEnd2:: @ 81D99CE
	callatk BattleScript_BerryCurePsnRet
	end2

BattleScript_BerryCurePsnRet:: @ 81D99D4
	playanimation 10, 7, 0x0
	printstring BATTLE_TEXT_CuredPoison
	waitmessage 64
	atk98 10
	removeitem 10
	return

BattleScript_BerryCureBrnEnd2:: @ 81D99E6
	callatk BattleScript_BerryCureBrnRet
	end2

BattleScript_BerryCureBrnRet:: @ 81D99EC
	playanimation 10, 7, 0x0
	printstring BATTLE_TEXT_CuredBurn
	waitmessage 64
	atk98 10
	removeitem 10
	return

BattleScript_BerryCureFrzEnd2:: @ 81D99FE
	callatk BattleScript_BerryCureFrzRet
	end2

BattleScript_BerryCureFrzRet:: @ 81D9A04
	playanimation 10, 7, 0x0
	printstring BATTLE_TEXT_CuredFreeze
	waitmessage 64
	atk98 10
	removeitem 10
	return

BattleScript_BerryCureSlpEnd2:: @ 81D9A16
	callatk BattleScript_BerryCureSlpRet
	end2

BattleScript_BerryCureSlpRet:: @ 81D9A1C
	playanimation 10, 7, 0x0
	printstring BATTLE_TEXT_CuredSleep
	waitmessage 64
	atk98 10
	removeitem 10
	return

BattleScript_BerryCureConfusionEnd2:: @ 81D9A2E
	callatk BattleScript_BerryCureConfusionRet
	end2

BattleScript_BerryCureConfusionRet:: @ 81D9A34
	playanimation 10, 7, 0x0
	printstring BATTLE_TEXT_CuredConfusion
	waitmessage 64
	removeitem 10
	return

gUnknown_081D9A44:: @ 81D9A44
	callatk gUnknown_081D9A4A
	end2

gUnknown_081D9A4A:: @ 81D9A4A
	playanimation 10, 7, 0x0
	printfromtable BattleTextList_40162C
	waitmessage 64
	atk98 10
	removeitem 10
	return

BattleScript_WhiteHerbEnd2:: @ 81D9A5E
	callatk BattleScript_WhiteHerbRet
	end2

BattleScript_WhiteHerbRet:: @ 81D9A64
	playanimation 10, 7, 0x0
	printstring BATTLE_TEXT_RestoredStatus
	waitmessage 64
	removeitem 10
	return

BattleScript_ItemHealHP_RemoveItem:: @ 81D9A74
	playanimation USER, 7, 0x0
	printstring BATTLE_TEXT_RestoredHealth
	waitmessage 64
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	removeitem USER
	end2

BattleScript_BerryPPHealEnd2:: @ 81D9A91
	playanimation USER, 7, 0x0
	printstring BATTLE_TEXT_RestoredPP
	waitmessage 64
	removeitem USER
	end2

BattleScript_ItemHealHP_End2:: @ 81D9AA1
	callatk BattleScript_ItemHealHP_Ret
	end2

BattleScript_ItemHealHP_Ret:: @ 81D9AA7
	playanimation USER, 7, 0x0
	printstring BATTLE_TEXT_RestoredHPLittle
	waitmessage 64
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	return

BattleScript_MoveSelectionChoiceBanded:: @ 81D9AC2
	printstring2 BATTLE_TEXT_ChoiceBand
	atk44

BattleScript_HangedOnMsg:: @ 81D9AC6
	playanimation TARGET, 9, 0x0
	printstring BATTLE_TEXT_FocusSash
	waitmessage 64
	return

BattleScript_BerryConfuseHealEnd2:: @ 81D9AD4
	playanimation USER, 7, 0x0
	printstring BATTLE_TEXT_RestoredHealth
	waitmessage 64
	orword gHitMarker, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_UnknownString2
	waitmessage 64
	setbyte gUnknown_02024D1F + 0x2, 71
	seteffecttarget
	removeitem USER
	end2

BattleScript_BerryStatRaiseEnd2:: @ 81D9AFE
	playanimation USER, 7, 0x0
	statbuffchange 65, BattleScript_1D9B0B

BattleScript_1D9B0B: @ 81D9B0B
	setbyte gUnknown_02024D1F + 0x4, 4
	callatk BattleScript_StatUp
	removeitem USER
	end2

BattleScript_BerryFocusEnergyEnd2:: @ 81D9B19
	playanimation USER, 7, 0x0
	printstring BATTLE_TEXT_HustleUse
	waitmessage 64
	removeitem USER
	end2

gUnknown_081D9B29:: @ 81D9B29
	printstring2 BATTLE_TEXT_CantUseItems
	atk44

gUnknown_081D9B2D:: @ 81D9B2D
	printstring BATTLE_TEXT_Terminator2
	return
