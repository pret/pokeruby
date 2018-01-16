#include "constants/moves.h"

enum
{
    BATTLE_TEXT_UnknownString = 12,
    BATTLE_TEXT_GainExpPoints,
    BATTLE_TEXT_GrewLevel,
    BATTLE_TEXT_LearnedMove,
    BATTLE_TEXT_TryingToLearnMove,
    BATTLE_TEXT_CantLearnMore,
    BATTLE_TEXT_DeleteMove,
    BATTLE_TEXT_DeletedMove,
    BATTLE_TEXT_StopLearning,
    BATTLE_TEXT_DidNotLearn,
    BATTLE_TEXT_LearnedMove2,
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_ProtectedItself,
    BATTLE_TEXT_StatNoHigher,
    BATTLE_TEXT_AvoidedDamage,
    BATTLE_TEXT_DoesntAffect,
    BATTLE_TEXT_AttackingFainted,
    BATTLE_TEXT_DefendingFainted,
    BATTLE_TEXT_WinningPrize,
    BATTLE_TEXT_OutOfUsablePoke,
    BATTLE_TEXT_WhitedOut,
    BATTLE_TEXT_PreventEscape,
    BATTLE_TEXT_HitMulti,
    BATTLE_TEXT_FellAsleep,
    BATTLE_TEXT_MadeAsleep,
    BATTLE_TEXT_DefendingAsleep,
    BATTLE_TEXT_AttackingAsleep,
    BATTLE_TEXT_WasntAffected,
    BATTLE_TEXT_Poisoned,
    BATTLE_TEXT_Poisoned2,
    BATTLE_TEXT_PoisonHurt,
    BATTLE_TEXT_AlreadyPoisoned,
    BATTLE_TEXT_BadlyPoisoned,
    BATTLE_TEXT_EnergyDrained,
    BATTLE_TEXT_Burned,
    BATTLE_TEXT_Burned2,
    BATTLE_TEXT_BurnHurt,
    BATTLE_TEXT_Frozen,
    BATTLE_TEXT_Frozen2,
    BATTLE_TEXT_FrozenSolid,
    BATTLE_TEXT_DefendingDefrosted,
    BATTLE_TEXT_AttackingDefrosted,
    BATTLE_TEXT_Defrosted,
    BATTLE_TEXT_Paralyzed,
    BATTLE_TEXT_Paralyzed2,
    BATTLE_TEXT_Paralyzed3,
    BATTLE_TEXT_AlreadyParalyzed,
    BATTLE_TEXT_ParalysisHealed,
    BATTLE_TEXT_DreamEaten,
    BATTLE_TEXT_AttackingStatNoHigher,
    BATTLE_TEXT_DefendingStatNoHigher,
    BATTLE_TEXT_StoppedWorking,
    BATTLE_TEXT_StoppedWorking2,
    BATTLE_TEXT_Confused,
    BATTLE_TEXT_ConfusionSnapOut,
    BATTLE_TEXT_BecameConfused,
    BATTLE_TEXT_AlreadyConfused,
    BATTLE_TEXT_FellLove,
    BATTLE_TEXT_InLoveWith,
    BATTLE_TEXT_ImmobilizedBy,
    BATTLE_TEXT_BlownAway,
    BATTLE_TEXT_TypeTransform,
    BATTLE_TEXT_Flinched,
    BATTLE_TEXT_RegainedHealth,
    BATTLE_TEXT_HPFull,
    BATTLE_TEXT_RaisedSpDef,
    BATTLE_TEXT_RaisedDefense,
    BATTLE_TEXT_CoveredVeil,
    BATTLE_TEXT_SafeguardActive,
    BATTLE_TEXT_SafeguardFaded,
    BATTLE_TEXT_WentToSleep,
    BATTLE_TEXT_SpeltHealthy,
    BATTLE_TEXT_WhipWhirlwind,
    BATTLE_TEXT_TookSunlight,
    BATTLE_TEXT_LoweredHead,
    BATTLE_TEXT_IsGlowing,
    BATTLE_TEXT_FlewHigh,
    BATTLE_TEXT_DugHole,
    BATTLE_TEXT_SqueezedBind,
    BATTLE_TEXT_TrappedVortex,
    BATTLE_TEXT_Wrapped,
    BATTLE_TEXT_Clamped,
    BATTLE_TEXT_HurtBy,
    BATTLE_TEXT_FreedFrom,
    BATTLE_TEXT_KeptGoingCrash,
    BATTLE_TEXT_MistShroud,
    BATTLE_TEXT_MistProtect,
    BATTLE_TEXT_GetPumped,
    BATTLE_TEXT_HitRecoil,
    BATTLE_TEXT_ProtectedItself2,
    BATTLE_TEXT_SandBuffeted,
    BATTLE_TEXT_HailStricken,
    BATTLE_TEXT_WasSeeded,
    BATTLE_TEXT_EvadedAttack,
    BATTLE_TEXT_HealthSapped,
    BATTLE_TEXT_FastAsleep,
    BATTLE_TEXT_WokeUp,
    BATTLE_TEXT_UproarAwake,
    BATTLE_TEXT_UproarWoke,
    BATTLE_TEXT_UproarCaused,
    BATTLE_TEXT_UproarMaking,
    BATTLE_TEXT_CalmedDown,
    BATTLE_TEXT_UproarCantSleep,
    BATTLE_TEXT_Stockpiled,
    BATTLE_TEXT_StockpiledCant,
    BATTLE_TEXT_UproarCantSleep2,
    BATTLE_TEXT_UproarKeptAwake,
    BATTLE_TEXT_StayedAwake,
    BATTLE_TEXT_StoringEnergy,
    BATTLE_TEXT_UnleashedEnergy,
    BATTLE_TEXT_FatigueConfuse,
    BATTLE_TEXT_PickedUpYen,
    BATTLE_TEXT_Unaffected,
    BATTLE_TEXT_Transformed,
    BATTLE_TEXT_SubMade,
    BATTLE_TEXT_SubAlready,
    BATTLE_TEXT_SubTookDamage,
    BATTLE_TEXT_SubFaded,
    BATTLE_TEXT_MustRecharge,
    BATTLE_TEXT_RageBuilding,
    BATTLE_TEXT_MoveWasDisabled,
    BATTLE_TEXT_MoveIsDisabled,
    BATTLE_TEXT_DisabledNoMore,
    BATTLE_TEXT_EncoreGot,
    BATTLE_TEXT_EncoreEnded,
    BATTLE_TEXT_TookAim,
    BATTLE_TEXT_SketchedMove,
    BATTLE_TEXT_DestinyBondTake,
    BATTLE_TEXT_DestinyBondTaken,
    BATTLE_TEXT_ReducedBy,
    BATTLE_TEXT_StoleSomething,
    BATTLE_TEXT_CantEscapeNow,
    BATTLE_TEXT_NightmareStart,
    BATTLE_TEXT_NightmareLock,
    BATTLE_TEXT_CurseLay,
    BATTLE_TEXT_CurseAfflict,
    BATTLE_TEXT_SpikesScattered,
    BATTLE_TEXT_SpikesHurt,
    BATTLE_TEXT_IdentifiedPoke,
    BATTLE_TEXT_PerishSongFell,
    BATTLE_TEXT_BracedItself,
    BATTLE_TEXT_EnduredHit,
    BATTLE_TEXT_MagnitudeCount,
    BATTLE_TEXT_CutHPMaxATK,
    BATTLE_TEXT_CopyStatChanges,
    BATTLE_TEXT_GotFreeFrom,
    BATTLE_TEXT_LeechShed,
    BATTLE_TEXT_SpikesBlownAway,
    BATTLE_TEXT_FledBattle,
    BATTLE_TEXT_ForesawAttack,
    BATTLE_TEXT_TookAttack,
    BATTLE_TEXT_PokeAttack,
    BATTLE_TEXT_CenterAttention,
    BATTLE_TEXT_ChargingPower,
    BATTLE_TEXT_NaturePower,
    BATTLE_TEXT_StatusNormal,
    BATTLE_TEXT_NoMovesLeft,
    BATTLE_TEXT_TormentSubject,
    BATTLE_TEXT_TormentNoUse,
    BATTLE_TEXT_TightenFocus,
    BATTLE_TEXT_TauntFell,
    BATTLE_TEXT_TauntNoUse,
    BATTLE_TEXT_ReadyToHelp,
    BATTLE_TEXT_SwitchedItems,
    BATTLE_TEXT_CopiedObject,
    BATTLE_TEXT_WishMade,
    BATTLE_TEXT_WishTrue,
    BATTLE_TEXT_PlantedRoots,
    BATTLE_TEXT_AbsorbNutrients,
    BATTLE_TEXT_AnchoredItself,
    BATTLE_TEXT_DrowsyMade,
    BATTLE_TEXT_KnockedOffItem,
    BATTLE_TEXT_AbilitySwap,
    BATTLE_TEXT_SealedMove,
    BATTLE_TEXT_SealedNoUse,
    BATTLE_TEXT_GrudgeBear,
    BATTLE_TEXT_GrudgeLosePP,
    BATTLE_TEXT_ShroudedItself,
    BATTLE_TEXT_MagicCoatBounce,
    BATTLE_TEXT_AwaitMove,
    BATTLE_TEXT_SnatchedMove,
    BATTLE_TEXT_RainMade,
    BATTLE_TEXT_SpeedRisen,
    BATTLE_TEXT_ProtectedBy,
    BATTLE_TEXT_PreventedBy,
    BATTLE_TEXT_HPRestoredUsing,
    BATTLE_TEXT_MadeType,
    BATTLE_TEXT_PreventedPara,
    BATTLE_TEXT_PreventedRomance,
    BATTLE_TEXT_PreventedPoison,
    BATTLE_TEXT_PreventedConfusion,
    BATTLE_TEXT_RaisedFirePower,
    BATTLE_TEXT_AnchorsItself,
    BATTLE_TEXT_CutsAttack,
    BATTLE_TEXT_PreventedStatLoss,
    BATTLE_TEXT_HurtOther,
    BATTLE_TEXT_Traced,
    BATTLE_TEXT_Sharply,
    BATTLE_TEXT_Rose,
    BATTLE_TEXT_Harshly,
    BATTLE_TEXT_Fell,
    BATTLE_TEXT_UnknownString7,
    BATTLE_TEXT_UnknownString3,
    BATTLE_TEXT_UnknownString5,
    BATTLE_TEXT_UnknownString6,
    BATTLE_TEXT_Critical,
    BATTLE_TEXT_GrandSlam,
    BATTLE_TEXT_MoveForget123,
    BATTLE_TEXT_MoveForgetAnd,
    BATTLE_TEXT_NotEffective,
    BATTLE_TEXT_SuperEffective,
    BATTLE_TEXT_GotAwaySafely,
    BATTLE_TEXT_FledWild,
    BATTLE_TEXT_NoRunning,
    BATTLE_TEXT_CantEscape2,
    BATTLE_TEXT_BirchDontLeaveMe,
    BATTLE_TEXT_Nothing,
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_HurtItself,
    BATTLE_TEXT_MirrorFail,
    BATTLE_TEXT_RainStart,
    BATTLE_TEXT_PourStart,
    BATTLE_TEXT_RainCont1,
    BATTLE_TEXT_PourCont,
    BATTLE_TEXT_RainStop,
    BATTLE_TEXT_SandBrewed,
    BATTLE_TEXT_SandRages,
    BATTLE_TEXT_SandSubsided,
    BATTLE_TEXT_SunBright,
    BATTLE_TEXT_SunStrong,
    BATTLE_TEXT_SunFaded,
    BATTLE_TEXT_HailStart,
    BATTLE_TEXT_HailCont,
    BATTLE_TEXT_HailStop,
    BATTLE_TEXT_SpitUpFail,
    BATTLE_TEXT_SwallowFail,
    BATTLE_TEXT_WindHeatWave,
    BATTLE_TEXT_StatElim,
    BATTLE_TEXT_CoinScatter,
    BATTLE_TEXT_SubWeak,
    BATTLE_TEXT_PainSplit,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_PerishSong,
    BATTLE_TEXT_NoPP1,
    BATTLE_TEXT_NoPP2,
    BATTLE_TEXT_Used1,
    BATTLE_TEXT_TutorialUsed,
    BATTLE_TEXT_BlockBall,
    BATTLE_TEXT_DontBeAThief,
    BATTLE_TEXT_DodgeBall,
    BATTLE_TEXT_MissPoke,
    BATTLE_TEXT_BallBrokeOhNo,
    BATTLE_TEXT_BallBrokeAppeared,
    BATTLE_TEXT_BallBrokeAlmost,
    BATTLE_TEXT_BallBrokeSoClose,
    BATTLE_TEXT_BallCaught1,
    BATTLE_TEXT_BallCaught2,
    BATTLE_TEXT_GiveNickname,
    BATTLE_TEXT_SentToPC,
    BATTLE_TEXT_AddedToDex,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Sandstorm,
    BATTLE_TEXT_CantEscape,
    BATTLE_TEXT_IgnoredOrdersSLP,
    BATTLE_TEXT_IgnoredOrders,
    BATTLE_TEXT_BeganNap,
    BATTLE_TEXT_LoafingAround,
    BATTLE_TEXT_WontObey,
    BATTLE_TEXT_TurnedAway,
    BATTLE_TEXT_NotNotice,
    BATTLE_TEXT_WillSwitch,
    BATTLE_TEXT_CreptCloser,
    BATTLE_TEXT_CantGetCloser,
    BATTLE_TEXT_WatchingCarefully,
    BATTLE_TEXT_CuriousAbout,
    BATTLE_TEXT_EnthralledBy,
    BATTLE_TEXT_IgnoredThing,
    BATTLE_TEXT_ThrewBlock,
    BATTLE_TEXT_SafariOver,
    BATTLE_TEXT_CuredParalysis,
    BATTLE_TEXT_CuredPoison,
    BATTLE_TEXT_CuredBurn,
    BATTLE_TEXT_CuredFreeze,
    BATTLE_TEXT_CuredSleep,
    BATTLE_TEXT_CuredConfusion,
    BATTLE_TEXT_CuredStatus,
    BATTLE_TEXT_RestoredHealth,
    BATTLE_TEXT_RestoredPP,
    BATTLE_TEXT_RestoredStatus,
    BATTLE_TEXT_RestoredHPLittle,
    BATTLE_TEXT_ChoiceBand,
    BATTLE_TEXT_FocusSash,
    BATTLE_TEXT_Terminator2,
    BATTLE_TEXT_PreventedBurn,
    BATTLE_TEXT_BlocksOther,
    BATTLE_TEXT_RestoredHPByItem,
    BATTLE_TEXT_WhipSandstorm,
    BATTLE_TEXT_PreventedLoss,
    BATTLE_TEXT_InfatuatedPoke,
    BATTLE_TEXT_MadeIneffective,
    BATTLE_TEXT_CuredProblem,
    BATTLE_TEXT_OozeSuckup,
    BATTLE_TEXT_Transformed2,
    BATTLE_TEXT_ElecWeakened,
    BATTLE_TEXT_FireWeakened,
    BATTLE_TEXT_HidUnderwater,
    BATTLE_TEXT_SprangUp,
    BATTLE_TEXT_CantForgetHM,
    BATTLE_TEXT_FoundOne,
    BATTLE_TEXT_PlayerDefeatedTrainer2,
    BATTLE_TEXT_SoothingAroma,
    BATTLE_TEXT_CantUseItems,
    BATTLE_TEXT_UnknownString2,
    BATTLE_TEXT_UnknownString4,
    BATTLE_TEXT_HustleUse,
    BATTLE_TEXT_MadeUseless,
    BATTLE_TEXT_SandTombTrapped,
    BATTLE_TEXT_Terminator,
    BATTLE_TEXT_BoostedExp,
    BATTLE_TEXT_SunIntensified,
    BATTLE_TEXT_GroundMoveNegate,
    BATTLE_TEXT_WallyBall,
    BATTLE_TEXT_TookAttack2,
    BATTLE_TEXT_ChoseDestiny,
    BATTLE_TEXT_LostFocus,
    BATTLE_TEXT_UseNext,
    BATTLE_TEXT_FledUsingItem,
    BATTLE_TEXT_FledUsingOther,
    BATTLE_TEXT_DraggedOut,
    BATTLE_TEXT_PreventedOther,
    BATTLE_TEXT_NormalizedStatus,
    BATTLE_TEXT_Used2,
    BATTLE_TEXT_BoxFull,
    BATTLE_TEXT_AvoidedAttack,
    BATTLE_TEXT_MadeIneffective2,
    BATTLE_TEXT_PreventedFlinching,
    BATTLE_TEXT_AlreadyBurned,
    BATTLE_TEXT_StatNoLower,
    BATTLE_TEXT_BlocksOther2,
    BATTLE_TEXT_WoreOff,
    BATTLE_TEXT_RaisedDefenseLittle,
    BATTLE_TEXT_RaisedSpDefLittle,
    BATTLE_TEXT_BrokeWall,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_CuredOfProblem,
    BATTLE_TEXT_AttackingCantEscape,
    BATTLE_TEXT_Obtained1,
    BATTLE_TEXT_Obtained2,
    BATTLE_TEXT_Obtained3,
    BATTLE_TEXT_NoEffect,
    BATTLE_TEXT_NoEffectOn,
};

const u8 BattleText_UnknownString[] = _("{STRING 33}");
const u8 BattleText_GainExpPoints[] = _("{STRING 0} erhält{PLAYER}\n{STRING 42} E-Punkte!\p");
const u8 BattleText_Terminator[] = _("");
const u8 BattleText_BoostedExp[] = _(" spezielle");
const u8 BattleText_GrewLevel[] = _("{STRING 0} erreicht\nLv. {PLAYER}!{UNKNOWN_A}\p");
const u8 BattleText_LearnedMove[] = _("{STRING 0} erlernt\n{PLAYER}!{UNKNOWN_A}\p");
const u8 BattleText_TryingToLearnMove[] = _("{STRING 0} versucht,\n{PLAYER} zu lernen.\p");
const u8 BattleText_CantLearnMore[] = _("Aber {STRING 0} kann nicht\nmehr als vier Attacken erlernen.\p");
const u8 BattleText_DeleteMove[] = _("Soll eine Attacke zu Gunsten von\n{PLAYER} vergessen werden?");
const u8 BattleText_DeletedMove[] = _("{STRING 0} hat\n{PLAYER} vergessen!\p");
const u8 BattleText_StopLearning[] = _("{PAUSE 32}{PLAYER}\nnicht erlernen?");
const u8 BattleText_DidNotLearn[] = _("{STRING 0} hat {PLAYER}\nnicht erlernt.\p");
const u8 BattleText_UseNext[] = _("Nächstes POKéMON einsetzen?");
const u8 BattleText_AttackMissed[] = _("Attacke von {EVIL_LEGENDARY}\nging daneben!");
const u8 BattleText_ProtectedItself[] = _("{GOOD_LEGENDARY}\nschützt sich selbst!");
const u8 BattleText_AvoidedDamage[] = _("{GOOD_LEGENDARY} vermeidet\nSchaden mit {STRING 22}!");
const u8 BattleText_GroundMoveNegate[] = _("{GOOD_LEGENDARY} wehrt BODEN-\nAttacken mit {STRING 22} ab!");
const u8 BattleText_AvoidedAttack[] = _("{GOOD_LEGENDARY} wehrt die\nAttacke ab!");
const u8 BattleText_DoesntAffect[] = _("Es hat keine Wirkung auf\n{GOOD_LEGENDARY}...");
const u8 BattleText_AttackingFainted[] = _("{EVIL_LEGENDARY}\nwurde besiegt!\p");
const u8 BattleText_DefendingFainted[] = _("{GOOD_LEGENDARY}\nwurde besiegt!\p");
const u8 BattleText_WinningPrize[] = _("{STRING 32} gewinnt ¥{STRING 0}!\p");
const u8 BattleText_OutOfUsablePoke[] = _("{STRING 32} hat kein\nkampffähiges POKéMON mehr!\p");
const u8 BattleText_WhitedOut[] = _("{STRING 32} fällt in Ohnmacht!{PAUSE_UNTIL_PRESS}");
const u8 BattleText_PreventEscape[] = _("{STRING 16} verhindert\neine Flucht mit {STRING 23}!\p");
const u8 BattleText_CantEscape[] = _("Flucht unmöglich!\p");
const u8 BattleText_AttackingCantEscape[] = _("{EVIL_LEGENDARY}\nkann nicht fliehen!");
const u8 BattleText_HitMulti[] = _("{STRING 0}-mal getroffen!");
const u8 BattleText_FellAsleep[] = _("{STRING 14}\nist eingeschlafen!");
const u8 BattleText_MadeAsleep[] = _("{STRING 23} von\n{STRING 16} lässt\l{STRING 14} einschlafen!");
const u8 BattleText_DefendingAsleep[] = _("{GOOD_LEGENDARY} schläft\nbereits!");
const u8 BattleText_AttackingAsleep[] = _("{EVIL_LEGENDARY} schläft\nbereits!");
const u8 BattleText_WasntAffected[] = _("{GOOD_LEGENDARY}\nist unversehrt!");
const u8 BattleText_Poisoned[] = _("{STRING 14}\nwurde vergiftet!");
const u8 BattleText_Poisoned2[] = _("{STRING 23} von\n{STRING 16} vergiftete\l{STRING 14}!");
const u8 BattleText_PoisonHurt[] = _("{EVIL_LEGENDARY} wurde durch\nGift verletzt!");
const u8 BattleText_AlreadyPoisoned[] = _("{GOOD_LEGENDARY} ist bereits\nvergiftet.");
const u8 BattleText_BadlyPoisoned[] = _("{STRING 14} wurde schwer\nvergiftet!");
const u8 BattleText_EnergyDrained[] = _("{GOOD_LEGENDARY} wurde\nEnergie abgesaugt!");
const u8 BattleText_Burned[] = _("{STRING 14} brennt!");
const u8 BattleText_Burned2[] = _("{STRING 23} von\n{STRING 16} verbrennt\l{STRING 14}!");
const u8 BattleText_BurnHurt[] = _("Die Verbrennung schadet\n{EVIL_LEGENDARY}!");
const u8 BattleText_AlreadyBurned[] = _("{GOOD_LEGENDARY} brennt\nbereits.");
const u8 BattleText_Frozen[] = _("{STRING 14} erstarrt\nzu Eis!");
const u8 BattleText_Frozen2[] = _("{STRING 14} wurde durch\n{STRING 23} von\l{STRING 16} eingefroren!");
const u8 BattleText_FrozenSolid[] = _("{EVIL_LEGENDARY} ist\neingefroren!");
const u8 BattleText_DefendingDefrosted[] = _("{GOOD_LEGENDARY} wurde\naufgetaut!");
const u8 BattleText_AttackingDefrosted[] = _("{EVIL_LEGENDARY} wurde\naufgetaut!");
const u8 BattleText_Defrosted[] = _("{EVIL_LEGENDARY} wurde\ndurch {STRING 17} aufgetaut!");
const u8 BattleText_Paralyzed[] = _("{STRING 14} ist\nparalysiert! Es greift\leventuell nicht an!");
const u8 BattleText_Paralyzed2[] = _("{STRING 23} von\n{STRING 16} paralysierte\p{STRING 14}!\nEs greift eventuell nicht an!");
const u8 BattleText_Paralyzed3[] = _("{EVIL_LEGENDARY} ist\nparalysiert! Es kann\lnicht angreifen!");
const u8 BattleText_AlreadyParalyzed[] = _("{GOOD_LEGENDARY} ist\nbereits paralysiert!");
const u8 BattleText_ParalysisHealed[] = _("{GOOD_LEGENDARY} wurde von der\nParalyse geheilt!");
const u8 BattleText_DreamEaten[] = _("Der Traum von {GOOD_LEGENDARY}\nwurde gefressen!");
const u8 BattleText_AttackingStatNoHigher[] = _("{STRING 0} von\n{EVIL_LEGENDARY} kann nicht\lmehr erhöht werden!");
const u8 BattleText_DefendingStatNoHigher[] = _("{STRING 0} von\n{GOOD_LEGENDARY} kann nicht\lweiter gesenkt werden!");
const u8 BattleText_StoppedWorking[] = _("{STRING 0} in deinem Team\nfunktioniert nicht mehr!");
const u8 BattleText_StoppedWorking2[] = _("{STRING 0} des Gegners\nfunktioniert nicht mehr!");
const u8 BattleText_Confused[] = _("{EVIL_LEGENDARY} ist\nverwirrt!");
const u8 BattleText_ConfusionSnapOut[] = _("{EVIL_LEGENDARY} ist nicht\nmehr verwirrt!");
const u8 BattleText_BecameConfused[] = _("{STRING 14} wurde\nverwirrt!");
const u8 BattleText_AlreadyConfused[] = _("{GOOD_LEGENDARY} ist\nbereits verwirrt!");
const u8 BattleText_FellLove[] = _("{GOOD_LEGENDARY}\nhat sich verliebt!");
const u8 BattleText_InLoveWith[] = _("{EVIL_LEGENDARY} hat sich in\n{STRING 16} verliebt!");
const u8 BattleText_ImmobilizedBy[] = _("{EVIL_LEGENDARY} ist starr\nvor Liebe!");
const u8 BattleText_BlownAway[] = _("{GOOD_LEGENDARY} wurde\nweggeweht!");
const u8 BattleText_TypeTransform[] = _("{EVIL_LEGENDARY} verwandelt\nsich zu Typ {STRING 0}!");
const u8 BattleText_Flinched[] = _("{EVIL_LEGENDARY} schreckt\nzurück!");
const u8 BattleText_RegainedHealth[] = _("{GOOD_LEGENDARY} erholt sich!");
const u8 BattleText_HPFull[] = _("{GOOD_LEGENDARY} hat alle KP!");
const u8 BattleText_RaisedSpDef[] = _("{STRING 17} von\n{STRING 38} erhöht\ldie SP. VER.");
const u8 BattleText_RaisedSpDefLittle[] = _("Die SP. VER. wird etwas durch\n{STRING 17} von\l{STRING 38} erhöht.");
const u8 BattleText_RaisedDefense[] = _("{STRING 17} von\n{STRING 38}\lerhöht die VERTEIDIGUNG!");
const u8 BattleText_RaisedDefenseLittle[] = _("{STRING 17} von\n{STRING 38}\lerhöht etwas die VERTEIDIGUNG!");
const u8 BattleText_CoveredVeil[] = _("{STRING 38} wird von\neinem Schleier umhüllt!");
const u8 BattleText_SafeguardActive[] = _("{GOOD_LEGENDARY} wird durch\nBODYGUARD geschützt!");
const u8 BattleText_SafeguardFaded[] = _("BODYGUARD von\n{STRING 40} lässt nach!");
const u8 BattleText_WentToSleep[] = _("{EVIL_LEGENDARY} ist\neingeschlafen!");
const u8 BattleText_SpeltHealthy[] = _("{EVIL_LEGENDARY} schläft und\nerholt sich!");
const u8 BattleText_WhipWhirlwind[] = _("{EVIL_LEGENDARY} entfacht\neinen Wirbelwind!");
const u8 BattleText_TookSunlight[] = _("{EVIL_LEGENDARY} absorbiert\nSonnenlicht!");
const u8 BattleText_LoweredHead[] = _("{EVIL_LEGENDARY} zieht seinen\nKopf ein!");
const u8 BattleText_IsGlowing[] = _("{EVIL_LEGENDARY} leuchtet!");
const u8 BattleText_FlewHigh[] = _("{EVIL_LEGENDARY} fliegt\nhoch empor!");
const u8 BattleText_DugHole[] = _("{EVIL_LEGENDARY} gräbt sich\nein!");
const u8 BattleText_HidUnderwater[] = _("{EVIL_LEGENDARY} taucht\nunter!");
const u8 BattleText_SprangUp[] = _("{EVIL_LEGENDARY} springt auf!");
const u8 BattleText_SqueezedBind[] = _("{EVIL_LEGENDARY} setzt bei\n{GOOD_LEGENDARY}\lKLAMMERGRIFF ein!");
const u8 BattleText_TrappedVortex[] = _("{GOOD_LEGENDARY} wurde in\neinem Strudel gefangen!");
const u8 BattleText_SandTombTrapped[] = _("{GOOD_LEGENDARY} wurde durch\nSANDGRAB gefangen!");
const u8 BattleText_Wrapped[] = _("{GOOD_LEGENDARY} wurde von\n{EVIL_LEGENDARY} umWICKELt!");
const u8 BattleText_Clamped[] = _("{GOOD_LEGENDARY} wurde von\n{EVIL_LEGENDARY} geSCHNAPPT!");
const u8 BattleText_HurtBy[] = _("{EVIL_LEGENDARY} wurde durch\n{STRING 0} verletzt!");
const u8 BattleText_FreedFrom[] = _("{EVIL_LEGENDARY} wurde von\n{STRING 0} befreit!");
const u8 BattleText_KeptGoingCrash[] = _("{EVIL_LEGENDARY} macht weiter\nund bricht zusammen!");
const u8 BattleText_MistShroud[] = _("{STRING 38} wird in\nWEISSNEBEL gehüllt!");
const u8 BattleText_MistProtect[] = _("{STRING 16} wird durch\nWEISSNEBEL geschützt!");
const u8 BattleText_GetPumped[] = _("{EVIL_LEGENDARY} pumpt\nsich auf!");
const u8 BattleText_HitRecoil[] = _("{EVIL_LEGENDARY} wurde vom\nRückstoß getroffen!");
const u8 BattleText_ProtectedItself2[] = _("{EVIL_LEGENDARY} schützt\nsich selbst!");
const u8 BattleText_SandBuffeted[] = _("{EVIL_LEGENDARY} wird vom\nSandsturm getroffen!");
const u8 BattleText_HailStricken[] = _("{EVIL_LEGENDARY} wird vom\nHAGELSTURM getroffen!");
const u8 BattleText_WoreOff[] = _("{STRING 0} von\n{STRING 36} lässt nach!");
const u8 BattleText_WasSeeded[] = _("{GOOD_LEGENDARY} wurde\nbepflanzt!");
const u8 BattleText_EvadedAttack[] = _("{GOOD_LEGENDARY} ist\nausgewichen!");
const u8 BattleText_HealthSapped[] = _("EGELSAMEN schadet\n{EVIL_LEGENDARY}!");
const u8 BattleText_FastAsleep[] = _("{EVIL_LEGENDARY} schläft tief\nund fest.");
const u8 BattleText_WokeUp[] = _("{EVIL_LEGENDARY} ist\naufgewacht!");
const u8 BattleText_UproarAwake[] = _("AUFRUHR von {STRING 16}\nhält es wach!");
const u8 BattleText_UproarWoke[] = _("{EVIL_LEGENDARY} wird durch\nAUFRUHR wach!");
const u8 BattleText_UproarCaused[] = _("{EVIL_LEGENDARY} verursacht\nAUFRUHR!");
const u8 BattleText_UproarMaking[] = _("{EVIL_LEGENDARY} macht\neinen AUFRUHR!");
const u8 BattleText_CalmedDown[] = _("{EVIL_LEGENDARY}\nberuhigt sich.");
const u8 BattleText_UproarCantSleep[] = _("{GOOD_LEGENDARY} kann bei dem\nAUFRUHR nicht schlafen!");
const u8 BattleText_Stockpiled[] = _("{EVIL_LEGENDARY} HORTET\n{STRING 0}!");
const u8 BattleText_StockpiledCant[] = _("{EVIL_LEGENDARY} kann nicht\nweiter HORTEN!");
const u8 BattleText_UproarCantSleep2[] = _("{GOOD_LEGENDARY} kann bei dem\nAUFRUHR nicht schlafen!");
const u8 BattleText_UproarKeptAwake[] = _("Aber der AUFRUHR hält\n{GOOD_LEGENDARY} wach!");
const u8 BattleText_StayedAwake[] = _("{GOOD_LEGENDARY} hält sich mit\n{STRING 22} wach!");
const u8 BattleText_StoringEnergy[] = _("{EVIL_LEGENDARY} speichert\nEnergie!");
const u8 BattleText_UnleashedEnergy[] = _("{EVIL_LEGENDARY} erzeugt\nEnergie!");
const u8 BattleText_FatigueConfuse[] = _("{EVIL_LEGENDARY} ist vor\nErschöpfung verwirrt!");
const u8 BattleText_PickedUpYen[] = _("{STRING 32} hebt\n¥{STRING 0} auf!\p");
const u8 BattleText_Unaffected[] = _("{GOOD_LEGENDARY} ist\nunversehrt!");
const u8 BattleText_Transformed[] = _("{EVIL_LEGENDARY} verwandelt\nsich in {STRING 0}!");
const u8 BattleText_SubMade[] = _("{EVIL_LEGENDARY} setzt einen\nDELEGATOR ein!");
const u8 BattleText_SubAlready[] = _("{EVIL_LEGENDARY} hat bereits\neinen DELEGATOR!");
const u8 BattleText_SubTookDamage[] = _("Der DELEGATOR steckt den\nSchlag für {GOOD_LEGENDARY}\lein!\p");
const u8 BattleText_SubFaded[] = _("DELEGATOR von\n{GOOD_LEGENDARY} lässt nach!\p");
const u8 BattleText_MustRecharge[] = _("{EVIL_LEGENDARY} muss sich\nwieder aufladen!");
const u8 BattleText_RageBuilding[] = _("{GOOD_LEGENDARY} verfällt in\nRASEREI!");
const u8 BattleText_MoveWasDisabled[] = _("{STRING 0} von\n{GOOD_LEGENDARY}\lwurde blockiert!");
const u8 BattleText_DisabledNoMore[] = _("{EVIL_LEGENDARY} ist nicht\nmehr blockiert!");
const u8 BattleText_EncoreGot[] = _("{GOOD_LEGENDARY} gibt\neine ZUGABE!");
const u8 BattleText_EncoreEnded[] = _("ZUGABE von {EVIL_LEGENDARY}\nist beendet!");
const u8 BattleText_TookAim[] = _("{EVIL_LEGENDARY} zielt\nauf {GOOD_LEGENDARY}!");
const u8 BattleText_SketchedMove[] = _("{EVIL_LEGENDARY} setzt\nNACHAHMER bei {STRING 0} ein!");
const u8 BattleText_DestinyBondTake[] = _("{EVIL_LEGENDARY} versucht den\nGegner mit sich zu nehmen!");
const u8 BattleText_DestinyBondTaken[] = _("{GOOD_LEGENDARY} nimmt\n{EVIL_LEGENDARY} mit sich!");
const u8 BattleText_ReducedBy[] = _("{STRING 0} von\n{GOOD_LEGENDARY} wird um\l{PLAYER} reduziert!");
const u8 BattleText_StoleSomething[] = _("{EVIL_LEGENDARY} stiehlt\n{STRING 19} von\l{GOOD_LEGENDARY}!");
const u8 BattleText_CantEscapeNow[] = _("{GOOD_LEGENDARY} kann\nnicht fliehen!");
const u8 BattleText_NightmareStart[] = _("{GOOD_LEGENDARY} bekommt\nNACHTMAHR!");
const u8 BattleText_NightmareLock[] = _("{EVIL_LEGENDARY} ist in\nNACHTMAHR gefangen!");
const u8 BattleText_CurseLay[] = _("{EVIL_LEGENDARY} nimmt einen\nTeil seiner KP und legt einen\lFLUCH auf {GOOD_LEGENDARY}!");
const u8 BattleText_CurseAfflict[] = _("{EVIL_LEGENDARY} wurde durch\nFLUCH verletzt!");
const u8 BattleText_SpikesScattered[] = _("POKéMON-Team von {STRING 37}\nverteilt STACHELN um sich!");
const u8 BattleText_SpikesHurt[] = _("{STRING 16} wurde durch\nSTACHLER verletzt!");
const u8 BattleText_IdentifiedPoke[] = _("{EVIL_LEGENDARY} erkennt\n{GOOD_LEGENDARY}!");
const u8 BattleText_PerishSongFell[] = _("ABGESANG von {EVIL_LEGENDARY}\nsteht bei {STRING 0}!");
const u8 BattleText_BracedItself[] = _("{EVIL_LEGENDARY} macht sich\nbereit!");
const u8 BattleText_EnduredHit[] = _("{GOOD_LEGENDARY} setzt\nAUSDAUER ein!");
const u8 BattleText_MagnitudeCount[] = _("INTENSITÄT {STRING 0}!");
const u8 BattleText_CutHPMaxATK[] = _("{EVIL_LEGENDARY} nutzt seine\nKP und hebt den ANGR-Wert!");
const u8 BattleText_CopyStatChanges[] = _("{EVIL_LEGENDARY} kopiert die\nStatusveränderungen\lvon {GOOD_LEGENDARY}!");
const u8 BattleText_GotFreeFrom[] = _("{EVIL_LEGENDARY} befreit\nsich von {STRING 0}\lvon {GOOD_LEGENDARY}!");
const u8 BattleText_LeechShed[] = _("{EVIL_LEGENDARY} befreit sich\nvon EGELSAMEN!");
const u8 BattleText_SpikesBlownAway[] = _("{EVIL_LEGENDARY} blies den\nSTACHLER weg!");
const u8 BattleText_FledBattle[] = _("{EVIL_LEGENDARY} ist\ngeflüchtet!");
const u8 BattleText_ForesawAttack[] = _("{EVIL_LEGENDARY} sah eine\nAttacke voraus!");
const u8 BattleText_TookAttack[] = _("{GOOD_LEGENDARY} wurde von\nder Attacke {STRING 0} getroffen!");
const u8 BattleText_ChoseDestiny[] = _("{EVIL_LEGENDARY} wählte\n{STRING 17} als Vorhersehung aus!");
const u8 BattleText_PokeAttack[] = _("Angriff von {STRING 0}!");
const u8 BattleText_CenterAttention[] = _("{EVIL_LEGENDARY} zieht alle\nAufmerksamkeit auf sich!");
const u8 BattleText_ChargingPower[] = _("{EVIL_LEGENDARY} lädt\nsich auf!");
const u8 BattleText_NaturePower[] = _("NATUR-KRAFT wurde zu\n{STRING 17}!");
const u8 BattleText_StatusNormal[] = _("Status von {EVIL_LEGENDARY}\nwird normal!");
const u8 BattleText_TormentSubject[] = _("{GOOD_LEGENDARY} wird von\nFOLTERKNECHT unterworfen!");
const u8 BattleText_TightenFocus[] = _("{EVIL_LEGENDARY} verstärkt\nseinen Fokus!");
const u8 BattleText_TauntFell[] = _("{GOOD_LEGENDARY} fällt auf\nVERHÖHNER herein!");
const u8 BattleText_ReadyToHelp[] = _("{EVIL_LEGENDARY} will\n{GOOD_LEGENDARY} helfen!");
const u8 BattleText_SwitchedItems[] = _("{EVIL_LEGENDARY} tauscht\nItems mit anderem PKMN!");
const u8 BattleText_Obtained1[] = _("{EVIL_LEGENDARY} erhält\n{STRING 0}.");
const u8 BattleText_Obtained2[] = _("{GOOD_LEGENDARY} erhält\n{PLAYER}.");
const u8 BattleText_Obtained3[] = _("{EVIL_LEGENDARY} erhält\n{STRING 0}.\p{GOOD_LEGENDARY} erhält\n{PLAYER}.");
const u8 BattleText_CopiedObject[] = _("{EVIL_LEGENDARY}\nkopiert {STRING 22} von\l{GOOD_LEGENDARY}!");
const u8 BattleText_WishMade[] = _("{EVIL_LEGENDARY} spricht einen\nWUNSCHTRAUM aus!");
const u8 BattleText_WishTrue[] = _("WUNSCHTRAUM von\n{STRING 0} erfüllt sich!");
const u8 BattleText_PlantedRoots[] = _("{EVIL_LEGENDARY} pflanzt seine\nWurzeln!");
const u8 BattleText_AbsorbNutrients[] = _("{EVIL_LEGENDARY} nimmt über\nseine Wurzeln Nährstoffe auf!");
const u8 BattleText_AnchoredItself[] = _("{GOOD_LEGENDARY}\nverankert sich mit seinen Wurzeln!");
const u8 BattleText_DrowsyMade[] = _("{EVIL_LEGENDARY} macht\n{GOOD_LEGENDARY} schläfrig!");
const u8 BattleText_KnockedOffItem[] = _("{EVIL_LEGENDARY}\nentreißt {STRING 19} von\l{GOOD_LEGENDARY}!");
const u8 BattleText_AbilitySwap[] = _("{EVIL_LEGENDARY} tauscht die\nFähigkeiten mit einem PKMN!");
const u8 BattleText_SealedMove[] = _("{EVIL_LEGENDARY} versiegelt\ndie Attacke/n des Gegners!");
const u8 BattleText_GrudgeBear[] = _("{EVIL_LEGENDARY} möchte, dass\nder Gegner ein NACHSPIEL erträgt!");
const u8 BattleText_GrudgeLosePP[] = _("{STRING 0} von\n{EVIL_LEGENDARY} hat aufgrund\lvon NACHSPIEL alle AP verloren!");
const u8 BattleText_ShroudedItself[] = _("{EVIL_LEGENDARY} verhüllt sich\nselbst in {STRING 17}!");
const u8 BattleText_MagicCoatBounce[] = _("{STRING 17} von\n{EVIL_LEGENDARY} prallte am\lMAGIEMANTEL ab!");
const u8 BattleText_AwaitMove[] = _("{EVIL_LEGENDARY} wartet auf\neine gegnerische Attacke!");
const u8 BattleText_SnatchedMove[] = _("{GOOD_LEGENDARY} ÜBERNAHM\nAttacke von {STRING 16}!");
const u8 BattleText_ElecWeakened[] = _("Die Stärke der Elektrizität\nwurde geschwächt!");
const u8 BattleText_FireWeakened[] = _("Die Stärke des Feuers\nwurde geschwächt!");
const u8 BattleText_FoundOne[] = _("{EVIL_LEGENDARY} hat 1\n{STRING 19} gefunden!");
const u8 BattleText_SoothingAroma[] = _("Ein wohltuendes Aroma\nbreitet sich aus!");
const u8 BattleText_CantUseItems[] = _("Hier können Items nicht eingesetzt\nwerden.{PAUSE 64}");
const u8 BattleText_UnknownString2[] = _("Für {STRING 16} war\n{STRING 19} {STRING 0}");
const u8 BattleText_HustleUse[] = _("{STRING 16} setzt\n{STRING 19} ein, um zu drängeln!");
const u8 BattleText_LostFocus[] = _("{EVIL_LEGENDARY} hat seinen\nFokus verloren und kann\lnicht angreifen!");
const u8 BattleText_DraggedOut[] = _("{GOOD_LEGENDARY} wurde\nauserwählt!\p");
const u8 BattleText_BrokeWall[] = _("Die Mauer brach zusammen!");
const u8 BattleText_NoEffect[] = _("Es ist wirkungslos!");
const u8 BattleText_NoMovesLeft[] = _("{STRING 15} hat keine\nAttacken mehr übrig!\p");
const u8 BattleText_MoveIsDisabled[] = _("{STRING 17} von\n{STRING 15} ist blockiert!\p");
const u8 BattleText_TormentNoUse[] = _("{STRING 15} kann\naufgrund von FOLTERKNECHT\pdie Attacke nicht 2-mal\nhintereinander einsetzen!");
const u8 BattleText_TauntNoUse[] = _("{STRING 15} kann\n{STRING 17} nach VERHÖHNER\lnicht einsetzen!\p");
const u8 BattleText_SealedNoUse[] = _("{STRING 15} kann die ver-\nsiegelte Attacke {STRING 17}\lnicht einsetzen!\p");
const u8 BattleText_RainMade[] = _("{STRING 23} von\n{STRING 16} lässt\les regnen!");
const u8 BattleText_SpeedRisen[] = _("{STRING 23} von\n{STRING 16} erhöht\lseine INIT.!");
const u8 BattleText_ProtectedBy[] = _("{GOOD_LEGENDARY} wurde durch\n{STRING 22} geschützt!");
const u8 BattleText_PreventedBy[] = _("{STRING 22} von\n{GOOD_LEGENDARY} hindert\p{EVIL_LEGENDARY} daran,\n{STRING 17} einzusetzen!");
const u8 BattleText_HPRestoredUsing[] = _("{GOOD_LEGENDARY} füllt KP mit\nHilfe von {STRING 22} auf!");
const u8 BattleText_MadeUseless[] = _("{STRING 22} von\n{GOOD_LEGENDARY} hebt die\lWirkung von {STRING 17} auf!");
const u8 BattleText_MadeType[] = _("{STRING 22} von\n{GOOD_LEGENDARY} macht es zu\leinem {STRING 0}-Typ!");
const u8 BattleText_PreventedPara[] = _("{STRING 22} von\n{STRING 14} verhindert\leine Paralyse!");
const u8 BattleText_PreventedRomance[] = _("{STRING 22} von\n{GOOD_LEGENDARY} verhindert\leine Romanze!");
const u8 BattleText_PreventedPoison[] = _("{STRING 22} von\n{STRING 14} verhindert\leine Vergiftung!");
const u8 BattleText_PreventedConfusion[] = _("{STRING 22} von\n{GOOD_LEGENDARY} verhindert\lVerwirrung!");
const u8 BattleText_RaisedFirePower[] = _("{STRING 22} von\n{GOOD_LEGENDARY} erhöht die\lFEUER-Kraft!");
const u8 BattleText_AnchorsItself[] = _("{GOOD_LEGENDARY} verankert\nsich mit Hilfe von {STRING 22}!");
const u8 BattleText_CutsAttack[] = _("{STRING 23} von\n{STRING 16} vermindert\lANGRIFF von {GOOD_LEGENDARY}!");
const u8 BattleText_PreventedStatLoss[] = _("{STRING 23} von\n{STRING 16} verhindert\lStatusveränderungen!");
const u8 BattleText_HurtOther[] = _("{STRING 22} von\n{GOOD_LEGENDARY} verletzt\l{EVIL_LEGENDARY}!");
const u8 BattleText_Traced[] = _("FÄHRTE von\n{STRING 16}\perkennt {PLAYER}\nvon {STRING 0}!");
const u8 BattleText_PreventedBurn[] = _("{STRING 24} von\n{STRING 14} verhindert\lVerbrennung!");
const u8 BattleText_BlocksOther[] = _("{STRING 22} von\n{GOOD_LEGENDARY} blockiert\l{STRING 17}!");
const u8 BattleText_BlocksOther2[] = _("{STRING 23} von\n{STRING 16} blockiert\l{STRING 17}!");
const u8 BattleText_RestoredHPByItem[] = _("{STRING 21} von\n{EVIL_LEGENDARY} füllt\leinige KP auf!");
const u8 BattleText_WhipSandstorm[] = _("{STRING 23} von\n{STRING 16} entfacht\leinen Sandsturm!");
const u8 BattleText_SunIntensified[] = _("{STRING 23} von\n{STRING 16} intensiviert\ldie Sonnenstrahlen!");
const u8 BattleText_PreventedLoss[] = _("{STRING 23} von\n{STRING 16} verhindert \lden Verlust von {STRING 0}!");
const u8 BattleText_InfatuatedPoke[] = _("{EVIL_LEGENDARY} ist vernarrt\nin {STRING 22} von\l{GOOD_LEGENDARY}!");
const u8 BattleText_MadeIneffective[] = _("{STRING 22} von\n{GOOD_LEGENDARY} macht\l{STRING 17} wirkungslos!");
const u8 BattleText_CuredProblem[] = _("{STRING 23} von\n{STRING 16} heilte sein\lProblem mit {STRING 0}!");
const u8 BattleText_OozeSuckup[] = _("Es saugte\nKLOAKENSOSSE auf!");
const u8 BattleText_Transformed2[] = _("{STRING 16}\nverwandelte sich!");
const u8 BattleText_TookAttack2[] = _("{STRING 22} von\n{GOOD_LEGENDARY} übernahm\lden Angriff!");
const u8 BattleText_PreventedSwitch[] = _("{STRING 20} von\n{STRING 0} verhindert\pWechsel!\p");
const u8 BattleText_PreventedOther[] = _("{STRING 22} von\n{GOOD_LEGENDARY} macht\p{STRING 0} von\n{STRING 16} wirkungslos!");
const u8 BattleText_MadeIneffective2[] = _("{STRING 23} von\n{STRING 16} machte\les wirkungslos!");
const u8 BattleText_PreventedFlinching[] = _("{STRING 24} von\n{STRING 14} verhindert\lein Zurückschrecken!");
const u8 BattleText_PreventedOther2[] = _("{STRING 21} von\n{EVIL_LEGENDARY} macht\p{STRING 22} von\n{GOOD_LEGENDARY} wirkungslos!");
const u8 BattleText_CuredOfProblem[] = _("{STRING 23} von\n{STRING 16} heilte sein\lProblem mit {STRING 0}!");
const u8 BattleText_NoEffectOn[] = _("{STRING 23} von\n{STRING 16} hat keine\lWirkung auf {STRING 14}!");
const u8 BattleText_Sharply[] = _("steigt stark!");
const u8 BattleText_Rose[] = _("steigt.");
const u8 BattleText_Harshly[] = _("sinkt stark!");
const u8 BattleText_Fell[] = _("sinkt.");
const u8 BattleText_UnknownString7[] = _("{STRING 0} von\n{EVIL_LEGENDARY} {PLAYER}");
const u8 BattleText_UnknownString3[] = _("{STRING 0} von\n{GOOD_LEGENDARY} {PLAYER}");
const u8 BattleText_UnknownString4[] = _("{STRING 19}: {STRING 0} von\n{STRING 16} {PLAYER}");
const u8 BattleText_UnknownString5[] = _("{STRING 0} von\n{EVIL_LEGENDARY} {PLAYER}");
const u8 BattleText_UnknownString6[] = _("{STRING 0} von\n{GOOD_LEGENDARY} {PLAYER}");
const u8 BattleText_StatNoHigher[] = _("Status von {EVIL_LEGENDARY}\nkann nicht weiter erhöht werden!");
const u8 BattleText_StatNoLower[] = _("Status von {GOOD_LEGENDARY}\nkann nicht weiter sinken!");
const u8 BattleText_Critical[] = _("Ein Volltreffer!");
const u8 BattleText_GrandSlam[] = _("Ein K.O.-Treffer!");
const u8 BattleText_MoveForget123[] = _("{PAUSE 32}1, {PAUSE 15}2 und...{PAUSE 15} ...{PAUSE 15} ...{PAUSE 15}\n{PAUSE 15}{PLAY_SE 0x38 0x00}Schwupp!\p");
const u8 BattleText_MoveForgetAnd[] = _("Und...\p");
const u8 BattleText_CantForgetHM[] = _("VM-Attacken können jetzt \nnicht vergessen werden.\p");
const u8 BattleText_NotEffective[] = _("Das ist nicht sehr effektiv...");
const u8 BattleText_SuperEffective[] = _("Das ist sehr effektiv!");
const u8 BattleText_GotAwaySafely[] = _("{PLAY_SE 0x11 0x00}Du bist entkommen!\p");
const u8 BattleText_FledUsingItem[] = _("{PLAY_SE 0x11 0x00}{EVIL_LEGENDARY} floh\ndurch Einsatz von {STRING 19}!\p");
const u8 BattleText_FledUsingOther[] = _("{PLAY_SE 0x11 0x00}{EVIL_LEGENDARY} floh\ndurch Einsatz von {STRING 21}!\p");
const u8 BattleText_FledWild[] = _("{PLAY_SE 0x11 0x00}Wildes {STRING 0} floh!");
const u8 BattleText_PlayerDefeatedTrainer[] = _("Spieler besiegte\n{STRING 29}!");
const u8 BattleText_PlayerDefeatedTrainers[] = _("Spieler besiegte\n{STRING 30} und {STRING 29}!");
const u8 BattleText_PlayerLostTrainer[] = _("Spieler verlor gegen\n{STRING 29}!");
const u8 BattleText_PlayerLostTrainers[] = _("Spieler verlor gegen\n{STRING 30} und {STRING 29}!");
const u8 BattleText_PlayerTiedTrainer[] = _("Patt zwischen Spieler und\n{STRING 29}!");
const u8 BattleText_PlayerTiedTrainers[] = _("Patt zwischen Spieler, {STRING 30}\nund {STRING 29}!");
const u8 BattleText_FledSingle[] = _("{PLAY_SE 0x11 0x00}{STRING 29} floh!");
const u8 BattleText_FledDouble[] = _("{PLAY_SE 0x11 0x00}{STRING 29} und\n{STRING 30} flohen!");
const u8 BattleText_NoRunning[] = _("Du kannst aus TRAINER-Kämpfen\nnicht fliehen!\p");
const u8 BattleText_CantEscape2[] = _("Flucht unmöglich!\p");
const u8 BattleText_BirchDontLeaveMe[] = _("PROF. BIRK: Du... Du kannst mich doch\nnicht einfach im Stich lassen!\p");
const u8 BattleText_Nothing[] = _("Nichts geschieht!");
const u8 BattleText_Failed[] = _("Es schlug fehl!");
const u8 BattleText_HurtItself[] = _("Es hat sich vor Verwirrung\nselbst verletzt!");
const u8 BattleText_MirrorFail[] = _("Der SPIEGELTRICK schlug fehl!");
const u8 BattleText_RainStart[] = _("Es fängt an zu regnen!");
const u8 BattleText_PourStart[] = _("Ein Wolkenbruch!");
const u8 BattleText_RainCont1[] = _("Es regnet weiter.");
const u8 BattleText_PourCont[] = _("Der Wolkenbruch hält an.");
const u8 BattleText_RainStop[] = _("Es hat aufgehört zu regnen.");
const u8 BattleText_SandBrewed[] = _("Ein Sandsturm kommt auf!");
const u8 BattleText_SandRages[] = _("Der Sandsturm tobt.");
const u8 BattleText_SandSubsided[] = _("Der Sandsturm legt sich.");
const u8 BattleText_SunBright[] = _("Das Sonnenlicht wird stärker!");
const u8 BattleText_SunStrong[] = _("Gleißendes Sonnenlicht!");
const u8 BattleText_SunFaded[] = _("Das Sonnenlicht lässt nach!");
const u8 BattleText_HailStart[] = _("Es fängt an zu hageln!");
const u8 BattleText_HailCont[] = _("Es hagelt!");
const u8 BattleText_HailStop[] = _("Es hat aufgehört zu hageln.");
const u8 BattleText_SpitUpFail[] = _("Aber es konnte nichts\nENTFESSELN!");
const u8 BattleText_SwallowFail[] = _("Aber es konnte nichts\nVERZEHREN!");
const u8 BattleText_WindHeatWave[] = _("Der Wind wurde zu einer\nHITZEWELLE!");
const u8 BattleText_StatElim[] = _("Alle Statusveränderungen wurden\nentfernt!");
const u8 BattleText_CoinScatter[] = _("Es liegen überall Münzen verstreut!");
const u8 BattleText_SubWeak[] = _("Zu schwach, um einen DELEGATOR\neinzusetzen!");
const u8 BattleText_PainSplit[] = _("Die Kontrahenten teilen\nihr Leid!");
const u8 BattleText_BellChime[] = _("Eine Glocke läutet!");
const u8 BattleText_PerishSong[] = _("Alle betroffenen POKéMON werden\nin 3 Runden K.O. gehen!");
const u8 BattleText_NoPP1[] = _("Es sind keine AP mehr für\ndiese Attacke übrig!\p");
const u8 BattleText_NoPP2[] = _("Aber es waren keine AP mehr\nfür diese Attacke übrig!");
const u8 BattleText_IgnoredOrdersSLP[] = _("{EVIL_LEGENDARY} ignoriert die\nBefehle. Es schläft!");
const u8 BattleText_IgnoredOrders[] = _("{EVIL_LEGENDARY} ignoriert den\nBefehl!");
const u8 BattleText_BeganNap[] = _("{EVIL_LEGENDARY} macht\nein Nickerchen!");
const u8 BattleText_LoafingAround[] = _("{EVIL_LEGENDARY} faulenzt!");
const u8 BattleText_WontObey[] = _("{EVIL_LEGENDARY} ist\nungehorsam!");
const u8 BattleText_TurnedAway[] = _("{EVIL_LEGENDARY} wendet\nsich ab!");
const u8 BattleText_NotNotice[] = _("{EVIL_LEGENDARY} gibt vor,\nnichts zu bemerken!");
const u8 BattleText_WillSwitch[] = _("Als Nächstes wird {PLAYER} von\n{STRING 25} {STRING 26} eingesetzt.\pWird {STRING 32} das\nPOKéMON wechseln?");
const u8 BattleText_LearnedMove2[] = _("{EVIL_LEGENDARY} hat\n{STRING 0} gelernt!");
const u8 BattleText_PlayerDefeatedTrainer2[] = _("Spieler besiegte\n{STRING 25} {STRING 26}!\p");
const u8 BattleText_CreptCloser[] = _("{STRING 32} schleicht sich näher an\n{STR_VAR_2} heran!");
const u8 BattleText_CantGetCloser[] = _("{STRING 32} kann nicht näher herangehen!");
const u8 BattleText_WatchingCarefully[] = _("{STR_VAR_2} beobachtet\nalles aufmerksam!");
const u8 BattleText_CuriousAbout[] = _("{STR_VAR_2} ist\nneugierig auf {STRING 0}!");
const u8 BattleText_EnthralledBy[] = _("{STR_VAR_2} ist begeistert\nvon {STRING 0}!");
const u8 BattleText_IgnoredThing[] = _("{STR_VAR_2} ignoriert\n{STRING 0} völlig!");
const u8 BattleText_ThrewBlock[] = _("{STRING 32} wirft {STR_VAR_2} einen\n{POKEBLOCK} zu!");
const u8 BattleText_SafariOver[] = _("{PLAY_SE 0x49 0x00}ANSAGE: Du hast keine\nSAFARIBÄLLE mehr! Game over!\p");
const u8 BattleText_WildAppeared1[] = _("Ein wildes {STR_VAR_2} erscheint!\p");
const u8 BattleText_WildAppeared2[] = _("Ein wildes {STR_VAR_2} erscheint!\p");
const u8 BattleText_WildAppeared3[] = _("Ein wildes {STR_VAR_2} erscheint!{PAUSE 127}");
const u8 BattleText_WildDoubleAppeared[] = _("Ein wildes {KUN} und\nein wildes {STR_VAR_2} erscheinen!\p");
const u8 BattleText_SingleWantToBattle1[] = _("Eine Herausforderung von\n{STRING 25} {STRING 26}!\p");
const u8 BattleText_SingleWantToBattle2[] = _("Eine Herausforderung von\n{STRING 29}!");
const u8 BattleText_DoubleWantToBattle[] = _("{STRING 29} und {STRING 30}\nmöchten kämpfen!");
const u8 BattleText_SentOutSingle1[] = _("{STR_VAR_2} wird von\n{STRING 25} {STRING 26} in den\lKampf geschickt!");
const u8 BattleText_SentOutDouble1[] = _("{STR_VAR_2} und {KUN}\nwerden von\p{STRING 25} {STRING 26}\nin den Kampf geschickt!");
const u8 BattleText_SentOutSingle2[] = _("{STRING 0} wird von\n{STRING 25} {STRING 26}\lin den Kampf geschickt!");
const u8 BattleText_SentOutSingle3[] = _("{STRING 29} schickt\n{STR_VAR_2} in den Kampf!");
const u8 BattleText_SentOutDouble2[] = _("{STRING 29} schickt\n{STR_VAR_2} und {KUN}!");
const u8 BattleText_SentOutDouble3[] = _("{STRING 29} schickt\n{VERSION}!\p{STRING 30} schickt\n{GOOD_TEAM}!");
const u8 BattleText_SentOutSingle4[] = _("{STRING 29} schickt\n{STRING 0}!");
const u8 BattleText_SentOutSingle5[] = _("{STRING 31} schickt\n{STRING 0}!");
const u8 BattleText_SentOutSingle6[] = _("Los! {STR_VAR_1}!");
const u8 BattleText_SentOutDouble4[] = _("Los! {STR_VAR_1} und\n{STR_VAR_3}!");
const u8 BattleText_SentOutSingle7[] = _("Los! {STRING 0}!");
const u8 BattleText_SentOutSingle8[] = _("Du schaffst es! {STRING 0}!");
const u8 BattleText_SentOutSingle9[] = _("Streng dich an, {STRING 0}!");
const u8 BattleText_SentOutSingle10[] = _("Mach es fertig!\nLos, {STRING 0}!");
const u8 BattleText_SentOutSingle11[] = _("{STRING 28} schickt\n{EVIL_TEAM}!\pLos! {RIVAL}!");
const u8 BattleText_ComeBackSingle1[] = _("{STRING 0}, genug!\nKomm zurück!");
const u8 BattleText_ComeBackSingle2[] = _("{STRING 0}, komm zurück!");
const u8 BattleText_ComeBackSingle3[] = _("{STRING 0}, O.K.!\nKomm zurück!");
const u8 BattleText_ComeBackSingle4[] = _("{STRING 0}, gut!\nKomm zurück!");
const u8 BattleText_WithdrewPoke1[] = _("{STRING 0} wurde\nvon {STRING 25} {STRING 26}\lzurückgerufen!");
const u8 BattleText_WithdrewPoke2[] = _("{STRING 29} ruft\n{STRING 0} zurück!");
const u8 BattleText_WithdrewPoke3[] = _("{STRING 31} ruft\n{STRING 0} zurück!");
const u8 BattleText_Wild[] = _(" (Wild)");
const u8 BattleText_Foe[] = _(" (Gegner)");
const u8 BattleText_Foe2[] = _("Gegner");
const u8 BattleText_Ally[] = _("Anwender");
const u8 BattleText_Foe3[] = _("Gegner");
const u8 BattleText_Ally2[] = _("Anwender");
const u8 BattleText_Foe4[] = _("Gegner");
const u8 BattleText_Ally3[] = _("Anwender");
const u8 BattleText_OpponentUsedMove[] = _("{EVIL_LEGENDARY} setzt\n{PLAYER} ein!");
const u8 BattleText_Exclamation2[] = _("");
const u8 BattleText_Exclamation3[] = _("");
const u8 BattleText_Exclamation4[] = _("");
const u8 BattleText_Exclamation5[] = _("");
const u8 BattleText_Exclamation[] = _("");
const u8 BattleStatText_HP[] = _("KP");
const u8 BattleStatText_Attack[] = _("ANGRIFF");
const u8 BattleStatText_Defense[] = _("VERT.");
const u8 BattleStatText_Speed[] = _("INIT.");
const u8 BattleStatText_SpAtk[] = _("SP.ANG.");
const u8 BattleStatText_SpDef[] = _("SP.VER.");
const u8 BattleStatText_Accuracy[] = _("GENAUIGKEIT");
const u8 BattleStatText_Evasion[] = _("FLUCHTWERT");
const u8 ContestStatText_TooSpicy[] = _("zu scharf!");
const u8 ContestStatText_TooDry[] = _("zu trocken!");
const u8 ContestStatText_TooSweet[] = _("zu süß!");
const u8 ContestStatText_TooBitter[] = _("zu bitter!");
const u8 ContestStatText_TooSour[] = _("zu sauer!");
const u8 BattleText_Used1[] = _("{STRING 32} setzt\n{STRING 19} ein!");
const u8 BattleText_TutorialUsed[] = _("HEIKO setzt\n{STRING 19} ein!");
const u8 BattleText_Used2[] = _("{STRING 19} wird von\n{STRING 25} {STRING 26} eingesetzt!");
const u8 BattleText_BlockBall[] = _("Der TRAINER hat den BALL abgeblockt!");
const u8 BattleText_DontBeAThief[] = _("Sei kein Dieb!");
const u8 BattleText_DodgeBall[] = _("Es ist dem BALL ausgewichen! Dieses\nPOKéMON kann nicht gefangen werden!");
const u8 BattleText_MissPoke[] = _("Du hast das POKéMON verfehlt!");
const u8 BattleText_BallBrokeOhNo[] = _("Mist!\nDas POKéMON hat sich befreit!");
const u8 BattleText_BallBrokeAppeared[] = _("Oh!\nFast hätte es geklappt!");
const u8 BattleText_BallBrokeAlmost[] = _("Mist!\nDas war knapp!");
const u8 BattleText_BallBrokeSoClose[] = _("Verflixt!\nEs hätte beinahe geklappt!");
const u8 BattleText_BallCaught1[] = _("Toll!\n{STR_VAR_2} wurde gefangen!{UNKNOWN_A}{PLAY_BGM 0x60 0x01}\p");
const u8 BattleText_BallCaught2[] = _("Toll!\n{STR_VAR_2} wurde gefangen!{UNKNOWN_A}{PLAY_BGM 0x60 0x01}{PAUSE 127}");
const u8 BattleText_GiveNickname[] = _("Möchtest du dem {STR_VAR_2}\neinen Spitznamen geben?");
const u8 BattleText_SentToPC[] = _("{STR_VAR_2} wurde auf\n{STRING 35} PC übertragen.");
const u8 BattleText_Someone[] = _("einen");
const u8 BattleText_Lanette[] = _("LANETTES");
const u8 BattleText_AddedToDex[] = _("Für {STR_VAR_2} wurde ein Eintrag\nim POKéDEX angelegt.\p");
const u8 BattleText_Raining[] = _("Es regnet.");
const u8 BattleText_Sandstorm[] = _("Ein Sandsturm tobt.");
const u8 BattleText_BoxFull[] = _("Die BOXEN sind voll!\nDu kannst keines mehr fangen!\p");
const u8 BattleText_EnigmaBerry[] = _("ENIGMABEERE");
const u8 BattleText_Berry[] = _("{STR_VAR_1}BEERE");
const u8 BattleText_CuredParalysis[] = _("{STRING 19} von\n{STRING 16}\lheilte die Paralyse!");
const u8 BattleText_CuredPoison[] = _("{STRING 19} von\n{STRING 16}\lheilte die Vergiftung!");
const u8 BattleText_CuredBurn[] = _("{STRING 19} von\n{STRING 16}\lheilte die Verbrennung!");
const u8 BattleText_CuredFreeze[] = _("{STRING 19} von\n{STRING 16} taute es auf!");
const u8 BattleText_CuredSleep[] = _("{STRING 19} von\n{STRING 16} \lweckte es auf!");
const u8 BattleText_CuredConfusion[] = _("{STRING 19} von\n{STRING 16}\lhebt die Verwirrung auf!");
const u8 BattleText_CuredStatus[] = _("{STRING 19} von\n{STRING 16} \lheilte sein {STRING 0}-Problem!");
const u8 BattleText_NormalizedStatus[] = _("{STRING 19} von\n{STRING 16} normalisierte\lseine Statuswerte!");
const u8 BattleText_RestoredHealth[] = _("{STRING 19} füllte\nKP von {STRING 16} auf!");
const u8 BattleText_RestoredPP[] = _("{STRING 19} von\n{STRING 16} füllte AP von\l{STRING 0} auf!");
const u8 BattleText_RestoredStatus[] = _("{STRING 19} von\n{STRING 16}\pstellte seine\nStatuswerte wieder her!");
const u8 BattleText_RestoredHPLittle[] = _("{STRING 19} von\n{STRING 16}\lfüllte einige KP auf!");
const u8 BattleText_ChoiceBand[] = _("{STRING 19} erlaubt\nnur den Einsatz von {STRING 17}!\p");
const u8 BattleText_FocusSash[] = _("{GOOD_LEGENDARY} hält\nmit Hilfe von\l{STRING 19} durch!");
const u8 BattleText_Terminator2[] = _("");
const u8 BattleText_WallyBall[] = _("Nun muss man einen BALL werfen, oder?\nIch... Ich werde mein Bestes geben!");
const u8 BattleText_StartEvo[] = _("Hey?\n{STR_VAR_1} entwickelt sich!");
const u8 BattleText_FinishEvo[] = _("Glückwunsch! Dein {STR_VAR_1}\nwurde zu {STR_VAR_2}!{UNKNOWN_A}\p");
const u8 BattleText_StopEvo[] = _("Hm? Die Entwicklung\nwurde abgebrochen!\p");
const u8 BattleText_OtherMenu[] = _("Was soll\n{STRING 15} tun?");
const u8 BattleText_PlayerMenu[] = _("Was wird {STRING 32}\ntun?");
const u8 BattleText_WallyMenu[] = _("Was wird\nHEIKO tun?");
const u8 BattleText_LinkStandby[] = _("{PAUSE 16}Verbindung...");
const u8 BattleText_MenuOptions[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}KAMPF{CLEAR_TO 46}BEUTEL\nPOKéMON{CLEAR_TO 46}FLUCHT");
const u8 BattleText_MenuOptionsSafari[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}BALL{CLEAR_TO 46}{POKEBLOCK}\nNÄHER{CLEAR_TO 46}FLUCHT");
const u8 BattleText_PP[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}AP\nTYP/");
const u8 BattleText_Format[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}");
const u8 BattleText_ForgetMove[] = _("{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}{PALETTE 5}Welche Attacke soll vergessen werden?");
const u8 BattleText_YesNo[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Ja\nNein");
const u8 BattleText_SwitchWhich[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}\nWohin?");
const u8 BattleText_Format2[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}");
const u8 BattleText_RightArrow[] = _("{RIGHT_ARROW}");
const u8 BattleText_Plus[] = _("+");
const u8 BattleText_Dash[] = _("-");
const u8 BattleText_HP[] = _("KP     ");
const u8 BattleText_Attack[] = _("ANGR. ");
const u8 BattleText_Defense[] = _("VERT.");
const u8 BattleText_SpAtk[] = _("SP.ANG.");
const u8 BattleText_SpDef[] = _("SP.VER.");
const u8 BattleText_SafariBalls[] = _("{HIGHLIGHT RED}SAFARIBÄLLE");
const u8 BattleText_SafariBallsLeft[] = _("{HIGHLIGHT RED}Übrig: ");
const u8 BattleText_HighlightRed[] = _("{HIGHLIGHT RED}");
const u8 BattleText_Sleep[] = _("Schlaf");
const u8 BattleText_PoisonStatus[] = _("Gift");
const u8 BattleText_Burn[] = _("Verbrennung");
const u8 BattleText_Paralysis[] = _("Paralyse");
const u8 BattleText_IceStatus[] = _("Eis");
const u8 BattleText_Confusion[] = _("Verwirrung");
const u8 BattleText_Love[] = _("Liebe");
const u8 BattleText_Format3[] = _(" und ");
const u8 BattleText_Format4[] = _(", ");
const u8 BattleText_Format5[] = _(" ");
const u8 BattleText_Format6[] = _("\l");
const u8 BattleText_Format7[] = _("\n");
const u8 BattleText_Format8[] = _("sind");
const u8 BattleText_Format9[] = _("sind");
const u8 gBadEggNickname[] = _("Schl. EI");
const u8 BattleText_Wally[] = _("HEIKO");
const u8 BattleText_Win[] = _("{HIGHLIGHT TRANSPARENT}Sieg");
const u8 BattleText_Loss[] = _("{HIGHLIGHT TRANSPARENT}Ndrl.");
const u8 BattleText_Tie[] = _("{HIGHLIGHT TRANSPARENT}Patt");
const u8 BattleText_Format10[] = _(" ist");
const u8 BattleText_Format11[] = _("");
const u8 BattleText_Normal[] = _("eine NORMALE Att.");
const u8 BattleText_Fighting[] = _("eine KAMPF-Att.");
const u8 BattleText_Flying[] = _("eine FLUG-Att.");
const u8 BattleText_Poison[] = _("eine GIFT-Att.");
const u8 BattleText_Ground[] = _("eine BODEN-Att.");
const u8 BattleText_Rock[] = _("eine GESTEINS-Att.");
const u8 BattleText_Bug[] = _("eine KÄFER-Att.");
const u8 BattleText_Ghost[] = _("eine GEIST-Att.");
const u8 BattleText_Steel[] = _("eine STAHL-Att.");
const u8 BattleText_Typeless[] = _("eine ???-Attacke");
const u8 BattleText_Fire[] = _("eine FEUER-Att.");
const u8 BattleText_Water[] = _("eine WASSER-Att.");
const u8 BattleText_Grass[] = _("eine PFLANZEN-Att.");
const u8 BattleText_Electric[] = _("eine ELEKTRO-Att.");
const u8 BattleText_Psychic[] = _("eine PSYCHO-Att.");
const u8 BattleText_Ice[] = _("eine EIS-Att.");
const u8 BattleText_Dragon[] = _("eine DRACHEN-Att.");
const u8 BattleText_Dark[] = _("eine UNLICHT-Att.");

const u8 *const gUnknown_08400F58[] =
{
    BattleStatText_HP,
    BattleStatText_Attack,
    BattleStatText_Defense,
    BattleStatText_Speed,
    BattleStatText_SpAtk,
    BattleStatText_SpDef,
    BattleStatText_Accuracy,
    BattleStatText_Evasion,
};

const u8 *const gUnknown_08400F78[] =
{
    ContestStatText_TooSpicy,
    ContestStatText_TooDry,
    ContestStatText_TooSweet,
    ContestStatText_TooBitter,
    ContestStatText_TooSour,
};

const u8 *const gBattleStringsTable[] =
{
    BattleText_UnknownString,
    BattleText_GainExpPoints,
    BattleText_GrewLevel,
    BattleText_LearnedMove,
    BattleText_TryingToLearnMove,
    BattleText_CantLearnMore,
    BattleText_DeleteMove,
    BattleText_DeletedMove,
    BattleText_StopLearning,
    BattleText_DidNotLearn,
    BattleText_LearnedMove2,
    BattleText_AttackMissed,
    BattleText_ProtectedItself,
    BattleText_StatNoHigher,
    BattleText_AvoidedDamage,
    BattleText_DoesntAffect,
    BattleText_AttackingFainted,
    BattleText_DefendingFainted,
    BattleText_WinningPrize,
    BattleText_OutOfUsablePoke,
    BattleText_WhitedOut,
    BattleText_PreventEscape,
    BattleText_HitMulti,
    BattleText_FellAsleep,
    BattleText_MadeAsleep,
    BattleText_DefendingAsleep,
    BattleText_AttackingAsleep,
    BattleText_WasntAffected,
    BattleText_Poisoned,
    BattleText_Poisoned2,
    BattleText_PoisonHurt,
    BattleText_AlreadyPoisoned,
    BattleText_BadlyPoisoned,
    BattleText_EnergyDrained,
    BattleText_Burned,
    BattleText_Burned2,
    BattleText_BurnHurt,
    BattleText_Frozen,
    BattleText_Frozen2,
    BattleText_FrozenSolid,
    BattleText_DefendingDefrosted,
    BattleText_AttackingDefrosted,
    BattleText_Defrosted,
    BattleText_Paralyzed,
    BattleText_Paralyzed2,
    BattleText_Paralyzed3,
    BattleText_AlreadyParalyzed,
    BattleText_ParalysisHealed,
    BattleText_DreamEaten,
    BattleText_AttackingStatNoHigher,
    BattleText_DefendingStatNoHigher,
    BattleText_StoppedWorking,
    BattleText_StoppedWorking2,
    BattleText_Confused,
    BattleText_ConfusionSnapOut,
    BattleText_BecameConfused,
    BattleText_AlreadyConfused,
    BattleText_FellLove,
    BattleText_InLoveWith,
    BattleText_ImmobilizedBy,
    BattleText_BlownAway,
    BattleText_TypeTransform,
    BattleText_Flinched,
    BattleText_RegainedHealth,
    BattleText_HPFull,
    BattleText_RaisedSpDef,
    BattleText_RaisedDefense,
    BattleText_CoveredVeil,
    BattleText_SafeguardActive,
    BattleText_SafeguardFaded,
    BattleText_WentToSleep,
    BattleText_SpeltHealthy,
    BattleText_WhipWhirlwind,
    BattleText_TookSunlight,
    BattleText_LoweredHead,
    BattleText_IsGlowing,
    BattleText_FlewHigh,
    BattleText_DugHole,
    BattleText_SqueezedBind,
    BattleText_TrappedVortex,
    BattleText_Wrapped,
    BattleText_Clamped,
    BattleText_HurtBy,
    BattleText_FreedFrom,
    BattleText_KeptGoingCrash,
    BattleText_MistShroud,
    BattleText_MistProtect,
    BattleText_GetPumped,
    BattleText_HitRecoil,
    BattleText_ProtectedItself2,
    BattleText_SandBuffeted,
    BattleText_HailStricken,
    BattleText_WasSeeded,
    BattleText_EvadedAttack,
    BattleText_HealthSapped,
    BattleText_FastAsleep,
    BattleText_WokeUp,
    BattleText_UproarAwake,
    BattleText_UproarWoke,
    BattleText_UproarCaused,
    BattleText_UproarMaking,
    BattleText_CalmedDown,
    BattleText_UproarCantSleep,
    BattleText_Stockpiled,
    BattleText_StockpiledCant,
    BattleText_UproarCantSleep2,
    BattleText_UproarKeptAwake,
    BattleText_StayedAwake,
    BattleText_StoringEnergy,
    BattleText_UnleashedEnergy,
    BattleText_FatigueConfuse,
    BattleText_PickedUpYen,
    BattleText_Unaffected,
    BattleText_Transformed,
    BattleText_SubMade,
    BattleText_SubAlready,
    BattleText_SubTookDamage,
    BattleText_SubFaded,
    BattleText_MustRecharge,
    BattleText_RageBuilding,
    BattleText_MoveWasDisabled,
    BattleText_MoveIsDisabled,
    BattleText_DisabledNoMore,
    BattleText_EncoreGot,
    BattleText_EncoreEnded,
    BattleText_TookAim,
    BattleText_SketchedMove,
    BattleText_DestinyBondTake,
    BattleText_DestinyBondTaken,
    BattleText_ReducedBy,
    BattleText_StoleSomething,
    BattleText_CantEscapeNow,
    BattleText_NightmareStart,
    BattleText_NightmareLock,
    BattleText_CurseLay,
    BattleText_CurseAfflict,
    BattleText_SpikesScattered,
    BattleText_SpikesHurt,
    BattleText_IdentifiedPoke,
    BattleText_PerishSongFell,
    BattleText_BracedItself,
    BattleText_EnduredHit,
    BattleText_MagnitudeCount,
    BattleText_CutHPMaxATK,
    BattleText_CopyStatChanges,
    BattleText_GotFreeFrom,
    BattleText_LeechShed,
    BattleText_SpikesBlownAway,
    BattleText_FledBattle,
    BattleText_ForesawAttack,
    BattleText_TookAttack,
    BattleText_PokeAttack,
    BattleText_CenterAttention,
    BattleText_ChargingPower,
    BattleText_NaturePower,
    BattleText_StatusNormal,
    BattleText_NoMovesLeft,
    BattleText_TormentSubject,
    BattleText_TormentNoUse,
    BattleText_TightenFocus,
    BattleText_TauntFell,
    BattleText_TauntNoUse,
    BattleText_ReadyToHelp,
    BattleText_SwitchedItems,
    BattleText_CopiedObject,
    BattleText_WishMade,
    BattleText_WishTrue,
    BattleText_PlantedRoots,
    BattleText_AbsorbNutrients,
    BattleText_AnchoredItself,
    BattleText_DrowsyMade,
    BattleText_KnockedOffItem,
    BattleText_AbilitySwap,
    BattleText_SealedMove,
    BattleText_SealedNoUse,
    BattleText_GrudgeBear,
    BattleText_GrudgeLosePP,
    BattleText_ShroudedItself,
    BattleText_MagicCoatBounce,
    BattleText_AwaitMove,
    BattleText_SnatchedMove,
    BattleText_RainMade,
    BattleText_SpeedRisen,
    BattleText_ProtectedBy,
    BattleText_PreventedBy,
    BattleText_HPRestoredUsing,
    BattleText_MadeType,
    BattleText_PreventedPara,
    BattleText_PreventedRomance,
    BattleText_PreventedPoison,
    BattleText_PreventedConfusion,
    BattleText_RaisedFirePower,
    BattleText_AnchorsItself,
    BattleText_CutsAttack,
    BattleText_PreventedStatLoss,
    BattleText_HurtOther,
    BattleText_Traced,
    BattleText_Sharply,
    BattleText_Rose,
    BattleText_Harshly,
    BattleText_Fell,
    BattleText_UnknownString7,
    BattleText_UnknownString3,
    BattleText_UnknownString5,
    BattleText_UnknownString6,
    BattleText_Critical,
    BattleText_GrandSlam,
    BattleText_MoveForget123,
    BattleText_MoveForgetAnd,
    BattleText_NotEffective,
    BattleText_SuperEffective,
    BattleText_GotAwaySafely,
    BattleText_FledWild,
    BattleText_NoRunning,
    BattleText_CantEscape2,
    BattleText_BirchDontLeaveMe,
    BattleText_Nothing,
    BattleText_Failed,
    BattleText_HurtItself,
    BattleText_MirrorFail,
    BattleText_RainStart,
    BattleText_PourStart,
    BattleText_RainCont1,
    BattleText_PourCont,
    BattleText_RainStop,
    BattleText_SandBrewed,
    BattleText_SandRages,
    BattleText_SandSubsided,
    BattleText_SunBright,
    BattleText_SunStrong,
    BattleText_SunFaded,
    BattleText_HailStart,
    BattleText_HailCont,
    BattleText_HailStop,
    BattleText_SpitUpFail,
    BattleText_SwallowFail,
    BattleText_WindHeatWave,
    BattleText_StatElim,
    BattleText_CoinScatter,
    BattleText_SubWeak,
    BattleText_PainSplit,
    BattleText_BellChime,
    BattleText_PerishSong,
    BattleText_NoPP1,
    BattleText_NoPP2,
    BattleText_Used1,
    BattleText_TutorialUsed,
    BattleText_BlockBall,
    BattleText_DontBeAThief,
    BattleText_DodgeBall,
    BattleText_MissPoke,
    BattleText_BallBrokeOhNo,
    BattleText_BallBrokeAppeared,
    BattleText_BallBrokeAlmost,
    BattleText_BallBrokeSoClose,
    BattleText_BallCaught1,
    BattleText_BallCaught2,
    BattleText_GiveNickname,
    BattleText_SentToPC,
    BattleText_AddedToDex,
    BattleText_Raining,
    BattleText_Sandstorm,
    BattleText_CantEscape,
    BattleText_IgnoredOrdersSLP,
    BattleText_IgnoredOrders,
    BattleText_BeganNap,
    BattleText_LoafingAround,
    BattleText_WontObey,
    BattleText_TurnedAway,
    BattleText_NotNotice,
    BattleText_WillSwitch,
    BattleText_CreptCloser,
    BattleText_CantGetCloser,
    BattleText_WatchingCarefully,
    BattleText_CuriousAbout,
    BattleText_EnthralledBy,
    BattleText_IgnoredThing,
    BattleText_ThrewBlock,
    BattleText_SafariOver,
    BattleText_CuredParalysis,
    BattleText_CuredPoison,
    BattleText_CuredBurn,
    BattleText_CuredFreeze,
    BattleText_CuredSleep,
    BattleText_CuredConfusion,
    BattleText_CuredStatus,
    BattleText_RestoredHealth,
    BattleText_RestoredPP,
    BattleText_RestoredStatus,
    BattleText_RestoredHPLittle,
    BattleText_ChoiceBand,
    BattleText_FocusSash,
    BattleText_Terminator2,
    BattleText_PreventedBurn,
    BattleText_BlocksOther,
    BattleText_RestoredHPByItem,
    BattleText_WhipSandstorm,
    BattleText_PreventedLoss,
    BattleText_InfatuatedPoke,
    BattleText_MadeIneffective,
    BattleText_CuredProblem,
    BattleText_OozeSuckup,
    BattleText_Transformed2,
    BattleText_ElecWeakened,
    BattleText_FireWeakened,
    BattleText_HidUnderwater,
    BattleText_SprangUp,
    BattleText_CantForgetHM,
    BattleText_FoundOne,
    BattleText_PlayerDefeatedTrainer2,
    BattleText_SoothingAroma,
    BattleText_CantUseItems,
    BattleText_UnknownString2,
    BattleText_UnknownString4,
    BattleText_HustleUse,
    BattleText_MadeUseless,
    BattleText_SandTombTrapped,
    BattleText_Terminator,
    BattleText_BoostedExp,
    BattleText_SunIntensified,
    BattleText_GroundMoveNegate,
    BattleText_WallyBall,
    BattleText_TookAttack2,
    BattleText_ChoseDestiny,
    BattleText_LostFocus,
    BattleText_UseNext,
    BattleText_FledUsingItem,
    BattleText_FledUsingOther,
    BattleText_DraggedOut,
    BattleText_PreventedOther,
    BattleText_NormalizedStatus,
    BattleText_Used2,
    BattleText_BoxFull,
    BattleText_AvoidedAttack,
    BattleText_MadeIneffective2,
    BattleText_PreventedFlinching,
    BattleText_AlreadyBurned,
    BattleText_StatNoLower,
    BattleText_BlocksOther2,
    BattleText_WoreOff,
    BattleText_RaisedDefenseLittle,
    BattleText_RaisedSpDefLittle,
    BattleText_BrokeWall,
    BattleText_PreventedOther2,
    BattleText_CuredOfProblem,
    BattleText_AttackingCantEscape,
    BattleText_Obtained1,
    BattleText_Obtained2,
    BattleText_Obtained3,
    BattleText_NoEffect,
    BattleText_NoEffectOn,
};

// below are lists of battle string enums and NOT pointers to the strings.
const u16 gMissStringIds[] =
{
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_ProtectedItself,
    BATTLE_TEXT_AvoidedAttack,
    BATTLE_TEXT_AvoidedDamage,
    BATTLE_TEXT_GroundMoveNegate,
};

const u16 gNoEscapeStringIds[] =
{
    BATTLE_TEXT_CantEscape2,
    BATTLE_TEXT_BirchDontLeaveMe,
    BATTLE_TEXT_PreventEscape,
    BATTLE_TEXT_CantEscape,
    BATTLE_TEXT_AttackingCantEscape,
};

const u16 gMoveWeatherChangeStringIds[] =
{
    BATTLE_TEXT_RainStart,
    BATTLE_TEXT_PourStart,
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_SandBrewed,
    BATTLE_TEXT_SunBright,
    BATTLE_TEXT_HailStart,
};

const u16 gSandStormHailContinuesStringIds[] =
{
    BATTLE_TEXT_SandRages,
    BATTLE_TEXT_HailCont,
};

const u16 gSandStormHailDmgStringIds[] =
{
    BATTLE_TEXT_SandBuffeted,
    BATTLE_TEXT_HailStricken,
};

const u16 gSandStormHailEndStringIds[] =
{
    BATTLE_TEXT_SandSubsided,
    BATTLE_TEXT_HailStop,
};

const u16 gRainContinuesStringIds[] =
{
    BATTLE_TEXT_RainCont1,
    BATTLE_TEXT_PourCont,
    BATTLE_TEXT_RainStop,
};

const u16 gProtectLikeUsedStringIds[] =
{
    BATTLE_TEXT_ProtectedItself2,
    BATTLE_TEXT_BracedItself,
    BATTLE_TEXT_Failed,
};

const u16 gReflectLightScreenSafeguardStringIds[] =
{
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_RaisedDefense,
    BATTLE_TEXT_RaisedDefenseLittle,
    BATTLE_TEXT_RaisedSpDef,
    BATTLE_TEXT_RaisedSpDefLittle,
    BATTLE_TEXT_CoveredVeil,
};

const u16 gLeechSeedStringIds[] =
{
    BATTLE_TEXT_WasSeeded,
    BATTLE_TEXT_EvadedAttack,
    BATTLE_TEXT_DoesntAffect,
    BATTLE_TEXT_HealthSapped,
    BATTLE_TEXT_OozeSuckup,
};

const u16 gRestUsedStringIds[] =
{
    BATTLE_TEXT_WentToSleep,
    BATTLE_TEXT_SpeltHealthy,
};

const u16 gUproarOverTurnStringIds[] =
{
    BATTLE_TEXT_UproarMaking,
    BATTLE_TEXT_CalmedDown,
};

const u16 gStockpileUsedStringIds[] =
{
    BATTLE_TEXT_Stockpiled,
    BATTLE_TEXT_StockpiledCant,
};

const u16 gWokeUpStringIds[] =
{
    BATTLE_TEXT_WokeUp,
    BATTLE_TEXT_UproarWoke,
};

const u16 gSwallowFailStringIds[] =
{
    BATTLE_TEXT_SwallowFail,
    BATTLE_TEXT_HPFull,
};

const u16 gUproarAwakeStringIds[] =
{
    BATTLE_TEXT_UproarCantSleep2,
    BATTLE_TEXT_UproarKeptAwake,
    BATTLE_TEXT_StayedAwake,
};

const u16 gStatUpStringIds[] =
{
    BATTLE_TEXT_UnknownString7,
    BATTLE_TEXT_UnknownString3,
    BATTLE_TEXT_AttackingStatNoHigher,
    BATTLE_TEXT_Terminator2,
    BATTLE_TEXT_UnknownString4,
    BATTLE_TEXT_HustleUse,
};

const u16 gStatDownStringIds[] =
{
    BATTLE_TEXT_UnknownString5,
    BATTLE_TEXT_UnknownString6,
    BATTLE_TEXT_DefendingStatNoHigher,
    BATTLE_TEXT_Terminator2,
};

const u16 gFirstTurnOfTwoStringIds[] =
{
    BATTLE_TEXT_WhipWhirlwind,
    BATTLE_TEXT_TookSunlight,
    BATTLE_TEXT_LoweredHead,
    BATTLE_TEXT_IsGlowing,
    BATTLE_TEXT_FlewHigh,
    BATTLE_TEXT_DugHole,
    BATTLE_TEXT_HidUnderwater,
    BATTLE_TEXT_SprangUp,
};

const u16 gWrappedStringIds[] =
{
    BATTLE_TEXT_SqueezedBind, 
    BATTLE_TEXT_Wrapped, 
    BATTLE_TEXT_TrappedVortex, 
    BATTLE_TEXT_Clamped, 
    BATTLE_TEXT_TrappedVortex, 
    BATTLE_TEXT_SandTombTrapped, 
};

const u16 gMistUsedStringIds[] =
{
    BATTLE_TEXT_MistShroud,
    BATTLE_TEXT_Failed,
};

const u16 gFocusEnergyUsedStringIds[] =
{
    BATTLE_TEXT_GetPumped,
    BATTLE_TEXT_Failed,
};

const u16 gTransformUsedStringIds[] =
{
    BATTLE_TEXT_Transformed,
    BATTLE_TEXT_Failed,
};

const u16 gSubsituteUsedStringIds[] =
{
    BATTLE_TEXT_SubMade,
    BATTLE_TEXT_SubWeak,
};

const u16 gGotPoisonedStringIds[] =
{
    BATTLE_TEXT_Poisoned,
    BATTLE_TEXT_Poisoned2,
};

const u16 gGotParalyzedStringIds[] =
{
    BATTLE_TEXT_Paralyzed,
    BATTLE_TEXT_Paralyzed2,
};

const u16 gFellAsleepStringIds[] =
{
    BATTLE_TEXT_FellAsleep,
    BATTLE_TEXT_MadeAsleep,
};

const u16 gGotBurnedStringIds[] =
{
    BATTLE_TEXT_Burned,
    BATTLE_TEXT_Burned2,
};

const u16 gGotFrozenStringIds[] =
{
    BATTLE_TEXT_Frozen,
    BATTLE_TEXT_Frozen2,
};

const u16 gGotDefrostedStringIds[] =
{
    BATTLE_TEXT_AttackingDefrosted,
    BATTLE_TEXT_Defrosted,
};

const u16 gKOFailedStringIds[] =
{
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_Unaffected,
    BATTLE_TEXT_FellLove,
    BATTLE_TEXT_InfatuatedPoke,
};

const u16 gLeechSeedDrainStringIds[] =
{
    BATTLE_TEXT_EnergyDrained,
    BATTLE_TEXT_OozeSuckup,
};

const u16 gSportsUsedStringIds[] =
{
    BATTLE_TEXT_ElecWeakened,
    BATTLE_TEXT_FireWeakened,
};

const u16 gPartyStatusHealStringIds[] =
{
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_SoothingAroma,
};

const u16 gFutureMoveUsedStringIds[] =
{
    BATTLE_TEXT_ForesawAttack,
    BATTLE_TEXT_ChoseDestiny,
};

const u16 gBallEscapeStringIds[] =
{
    BATTLE_TEXT_BallBrokeOhNo,
    BATTLE_TEXT_BallBrokeAppeared,
    BATTLE_TEXT_BallBrokeAlmost,
    BATTLE_TEXT_BallBrokeSoClose,
};

const u16 gWeatherContinuesStringIds[] =
{
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Sandstorm,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_SunStrong,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
};

const u16 gInobedientStringIds[] =
{
    BATTLE_TEXT_LoafingAround, 
    BATTLE_TEXT_WontObey, 
    BATTLE_TEXT_TurnedAway, 
    BATTLE_TEXT_NotNotice, 
};

const u16 gSafariGetNearStringIds[] =
{
    BATTLE_TEXT_CreptCloser,
    BATTLE_TEXT_CantGetCloser,
};

const u16 gSafariPokeblockResultStringIds[] =
{
    BATTLE_TEXT_CuriousAbout,
    BATTLE_TEXT_EnthralledBy,
    BATTLE_TEXT_IgnoredThing,
};

const u16 gTrainerItemCuredStatusStringIds[] =
{
    BATTLE_TEXT_CuredConfusion,
    BATTLE_TEXT_CuredParalysis,
    BATTLE_TEXT_CuredFreeze,
    BATTLE_TEXT_CuredBurn,
    BATTLE_TEXT_CuredPoison,
    BATTLE_TEXT_CuredSleep,
};

const u16 gBerryEffectStringIds[] =
{
    BATTLE_TEXT_CuredStatus,
    BATTLE_TEXT_NormalizedStatus,
};

const u16 gBRNPreventionStringIds[] =
{
    BATTLE_TEXT_PreventedBurn,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 gPRLZPreventionStringIds[] =
{
    BATTLE_TEXT_PreventedPara,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 gPSNPreventionStringIds[] =
{
    BATTLE_TEXT_PreventedPoison,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 gItemSwapStringIds[] =
{
    BATTLE_TEXT_Obtained1,
    BATTLE_TEXT_Obtained2,
    BATTLE_TEXT_Obtained3,
};

const u16 gFlashFireStringIds[] =
{
    BATTLE_TEXT_RaisedFirePower,
    BATTLE_TEXT_MadeIneffective,
};

const u16 gTrappingMoves[] =
{
    MOVE_BIND,
    MOVE_WRAP,
    MOVE_FIRE_SPIN,
    MOVE_CLAMP,
    MOVE_WHIRLPOOL,
    MOVE_SAND_TOMB,
    0xFFFF,
};

const u8 *const gUnknown_0840165C[] =
{
    BattleText_HP,
    BattleText_SpAtk,
    BattleText_Attack,
    BattleText_SpDef,
    BattleText_Defense,
    BattleStatText_Speed,
};

const u8 *const gUnknown_08401674[] =
{
    BattleText_Normal,
    BattleText_Fighting,
    BattleText_Flying,
    BattleText_Poison,
    BattleText_Ground,
    BattleText_Rock,
    BattleText_Bug,
    BattleText_Ghost,
    BattleText_Steel,
    BattleText_Typeless,
    BattleText_Fire,
    BattleText_Water,
    BattleText_Grass,
    BattleText_Electric,
    BattleText_Psychic,
    BattleText_Ice,
    BattleText_Dragon,
    BattleText_Dark,
};
