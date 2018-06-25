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
const u8 BattleText_GainExpPoints[] = _("{STRING 0} gained{STRING 1}\n{STRING 42} EXP. Points!\p");
const u8 BattleText_Terminator[] = _("");
const u8 BattleText_BoostedExp[] = _(" a boosted");
const u8 BattleText_GrewLevel[] = _("{STRING 0} grew to\nLV. {STRING 1}!{UNKNOWN_A}\p");
const u8 BattleText_LearnedMove[] = _("{STRING 0} learned\n{STRING 1}!{UNKNOWN_A}\p");
const u8 BattleText_TryingToLearnMove[] = _("{STRING 0} is trying to\nlearn {STRING 1}.\p");
const u8 BattleText_CantLearnMore[] = _("But, {STRING 0} can’t learn\nmore than four moves.\p");
const u8 BattleText_DeleteMove[] = _("Delete a move to make\nroom for {STRING 1}?");
const u8 BattleText_DeletedMove[] = _("{STRING 0} forgot\n{STRING 1}.\p");
const u8 BattleText_StopLearning[] = _("{PAUSE 32}Stop learning\n{STRING 1}?");
const u8 BattleText_DidNotLearn[] = _("{STRING 0} did not learn\n{STRING 1}.\p");
const u8 BattleText_UseNext[] = _("Use next POKéMON?");
const u8 BattleText_AttackMissed[] = _("{ATTACKING_MON}’s\nattack missed!");
const u8 BattleText_ProtectedItself[] = _("{DEFENDING_MON}\nprotected itself!");
const u8 BattleText_AvoidedDamage[] = _("{DEFENDING_MON} avoided\ndamage with {STRING 22}!");
const u8 BattleText_GroundMoveNegate[] = _("{DEFENDING_MON} makes GROUND\nmoves miss with {STRING 22}!");
const u8 BattleText_AvoidedAttack[] = _("{DEFENDING_MON} avoided\nthe attack!");
const u8 BattleText_DoesntAffect[] = _("It doesn’t affect\n{DEFENDING_MON}...");
const u8 BattleText_AttackingFainted[] = _("{ATTACKING_MON}\nfainted!\p");
const u8 BattleText_DefendingFainted[] = _("{DEFENDING_MON}\nfainted!\p");
const u8 BattleText_WinningPrize[] = _("{STRING 32} got ¥{STRING 0}\nfor winning!\p");
const u8 BattleText_OutOfUsablePoke[] = _("{STRING 32} is out of\nuseable POKéMON!\p");
const u8 BattleText_WhitedOut[] = _("{STRING 32} whited out!{PAUSE_UNTIL_PRESS}");
const u8 BattleText_PreventEscape[] = _("{STRING 16} prevents\nescape with {STRING 23}!\p");
const u8 BattleText_CantEscape[] = _("Can’t escape!\p");
const u8 BattleText_AttackingCantEscape[] = _("{ATTACKING_MON}\ncan’t escape!");
const u8 BattleText_HitMulti[] = _("Hit {STRING 0} time(s)!");
const u8 BattleText_FellAsleep[] = _("{STRING 14}\nfell asleep!");
const u8 BattleText_MadeAsleep[] = _("{STRING 16}’s {STRING 23}\nmade {STRING 14} sleep!");
const u8 BattleText_DefendingAsleep[] = _("{DEFENDING_MON} is\nalready asleep!");
const u8 BattleText_AttackingAsleep[] = _("{ATTACKING_MON} is\nalready asleep!");
const u8 BattleText_WasntAffected[] = _("{DEFENDING_MON}\nwasn’t affected!");
const u8 BattleText_Poisoned[] = _("{STRING 14}\nwas poisoned!");
const u8 BattleText_Poisoned2[] = _("{STRING 16}’s {STRING 23}\npoisoned {STRING 14}!");
const u8 BattleText_PoisonHurt[] = _("{ATTACKING_MON} is hurt\nby poison!");
const u8 BattleText_AlreadyPoisoned[] = _("{DEFENDING_MON} is already\npoisoned.");
const u8 BattleText_BadlyPoisoned[] = _("{STRING 14} is badly\npoisoned!");
const u8 BattleText_EnergyDrained[] = _("{DEFENDING_MON} had its\nenergy drained!");
const u8 BattleText_Burned[] = _("{STRING 14} was burned!");
const u8 BattleText_Burned2[] = _("{STRING 16}’s {STRING 23}\nburned {STRING 14}!");
const u8 BattleText_BurnHurt[] = _("{ATTACKING_MON} is hurt\nby its burn!");
const u8 BattleText_AlreadyBurned[] = _("{DEFENDING_MON} already\nhas a burn.");
const u8 BattleText_Frozen[] = _("{STRING 14} was\nfrozen solid!");
const u8 BattleText_Frozen2[] = _("{STRING 16}’s {STRING 23}\nfroze {STRING 14} solid!");
const u8 BattleText_FrozenSolid[] = _("{ATTACKING_MON} is\nfrozen solid!");
const u8 BattleText_DefendingDefrosted[] = _("{DEFENDING_MON} was\ndefrosted!");
const u8 BattleText_AttackingDefrosted[] = _("{ATTACKING_MON} was\ndefrosted!");
const u8 BattleText_Defrosted[] = _("{ATTACKING_MON} was\ndefrosted by {STRING 17}!");
const u8 BattleText_Paralyzed[] = _("{STRING 14} is paralyzed!\nIt may be unable to move!");
const u8 BattleText_Paralyzed2[] = _("{STRING 16}’s {STRING 23}\nparalyzed {STRING 14}!\lIt may be unable to move!");
const u8 BattleText_Paralyzed3[] = _("{ATTACKING_MON} is paralyzed!\nIt can’t move!");
const u8 BattleText_AlreadyParalyzed[] = _("{DEFENDING_MON} is\nalready paralyzed!");
const u8 BattleText_ParalysisHealed[] = _("{DEFENDING_MON} was\nhealed of paralysis!");
const u8 BattleText_DreamEaten[] = _("{DEFENDING_MON}’s\ndream was eaten!");
const u8 BattleText_AttackingStatNoHigher[] = _("{ATTACKING_MON}’s {STRING 0}\nwon’t go higher!");
const u8 BattleText_DefendingStatNoHigher[] = _("{DEFENDING_MON}’s {STRING 0}\nwon’t go lower!");
const u8 BattleText_StoppedWorking[] = _("Your team’s {STRING 0}\nstopped working!");
const u8 BattleText_StoppedWorking2[] = _("The foe’s {STRING 0}\nstopped working!");
const u8 BattleText_Confused[] = _("{ATTACKING_MON} is\nconfused!");
const u8 BattleText_ConfusionSnapOut[] = _("{ATTACKING_MON} snapped\nout of confusion!");
const u8 BattleText_BecameConfused[] = _("{STRING 14} became\nconfused!");
const u8 BattleText_AlreadyConfused[] = _("{DEFENDING_MON} is\nalready confused!");
const u8 BattleText_FellLove[] = _("{DEFENDING_MON}\nfell in love!");
const u8 BattleText_InLoveWith[] = _("{ATTACKING_MON} is in love\nwith {STRING 16}!");
const u8 BattleText_ImmobilizedBy[] = _("{ATTACKING_MON} is\nimmobilized by love!");
const u8 BattleText_BlownAway[] = _("{DEFENDING_MON} was\nblown away!");
const u8 BattleText_TypeTransform[] = _("{ATTACKING_MON} transformed\ninto the {STRING 0} type!");
const u8 BattleText_Flinched[] = _("{ATTACKING_MON} flinched!");
const u8 BattleText_RegainedHealth[] = _("{DEFENDING_MON} regained\nhealth!");
const u8 BattleText_HPFull[] = _("{DEFENDING_MON}’s\nHP is full!");
const u8 BattleText_RaisedSpDef[] = _("{STRING 38}’s {STRING 17}\nraised SP. DEF!");
const u8 BattleText_RaisedSpDefLittle[] = _("{STRING 38}’s {STRING 17}\nraised SP. DEF a little!");
const u8 BattleText_RaisedDefense[] = _("{STRING 38}’s {STRING 17}\nraised DEFENSE!");
const u8 BattleText_RaisedDefenseLittle[] = _("{STRING 38}’s {STRING 17}\nraised DEFENSE a little!");
const u8 BattleText_CoveredVeil[] = _("{STRING 38} is covered\nby a veil!");
const u8 BattleText_SafeguardActive[] = _("{DEFENDING_MON} is protected\nby SAFEGUARD!");
const u8 BattleText_SafeguardFaded[] = _("{STRING 40}’s SAFEGUARD\nfaded!");
const u8 BattleText_WentToSleep[] = _("{ATTACKING_MON} went\nto sleep!");
const u8 BattleText_SpeltHealthy[] = _("{ATTACKING_MON} slept and\nbecame healthy!");
const u8 BattleText_WhipWhirlwind[] = _("{ATTACKING_MON} whipped\nup a whirlwind!");
const u8 BattleText_TookSunlight[] = _("{ATTACKING_MON} took\nin sunlight!");
const u8 BattleText_LoweredHead[] = _("{ATTACKING_MON} lowered\nits head!");
const u8 BattleText_IsGlowing[] = _("{ATTACKING_MON} is glowing!");
const u8 BattleText_FlewHigh[] = _("{ATTACKING_MON} flew\nup high!");
const u8 BattleText_DugHole[] = _("{ATTACKING_MON} dug a hole!");
const u8 BattleText_HidUnderwater[] = _("{ATTACKING_MON} hid\nunderwater!");
const u8 BattleText_SprangUp[] = _("{ATTACKING_MON} sprang up!");
const u8 BattleText_SqueezedBind[] = _("{DEFENDING_MON} was squeezed by\n{ATTACKING_MON}’s BIND!");
const u8 BattleText_TrappedVortex[] = _("{DEFENDING_MON} was trapped\nin the vortex!");
const u8 BattleText_SandTombTrapped[] = _("{DEFENDING_MON} was trapped\nby SAND TOMB!");
const u8 BattleText_Wrapped[] = _("{DEFENDING_MON} was WRAPPED by\n{ATTACKING_MON}!");
const u8 BattleText_Clamped[] = _("{ATTACKING_MON} CLAMPED\n{DEFENDING_MON}!");
const u8 BattleText_HurtBy[] = _("{ATTACKING_MON} is hurt\nby {STRING 0}!");
const u8 BattleText_FreedFrom[] = _("{ATTACKING_MON} was freed\nfrom {STRING 0}!");
const u8 BattleText_KeptGoingCrash[] = _("{ATTACKING_MON} kept going\nand crashed!");
const u8 BattleText_MistShroud[] = _("{STRING 38} became\nshrouded in MIST!");
const u8 BattleText_MistProtect[] = _("{STRING 16} is protected\nby MIST!");
const u8 BattleText_GetPumped[] = _("{ATTACKING_MON} is getting\npumped!");
const u8 BattleText_HitRecoil[] = _("{ATTACKING_MON} is hit\nwith recoil!");
const u8 BattleText_ProtectedItself2[] = _("{ATTACKING_MON} protected\nitself!");
const u8 BattleText_SandBuffeted[] = _("{ATTACKING_MON} is buffeted\nby the sandstorm!");
const u8 BattleText_HailStricken[] = _("{ATTACKING_MON} is stricken\nby HAIL!");
const u8 BattleText_WoreOff[] = _("{STRING 36}’s {STRING 0}\nwore off!");
const u8 BattleText_WasSeeded[] = _("{DEFENDING_MON} was seeded!");
const u8 BattleText_EvadedAttack[] = _("{DEFENDING_MON} evaded\nthe attack!");
const u8 BattleText_HealthSapped[] = _("{ATTACKING_MON}’s health is\nsapped by LEECH SEED!");
const u8 BattleText_FastAsleep[] = _("{ATTACKING_MON} is fast\nasleep.");
const u8 BattleText_WokeUp[] = _("{ATTACKING_MON} woke up!");
const u8 BattleText_UproarAwake[] = _("But {STRING 16}’s UPROAR\nkept it awake!");
const u8 BattleText_UproarWoke[] = _("{ATTACKING_MON} woke up\nin the UPROAR!");
const u8 BattleText_UproarCaused[] = _("{ATTACKING_MON} caused\nan UPROAR!");
const u8 BattleText_UproarMaking[] = _("{ATTACKING_MON} is making\nan UPROAR!");
const u8 BattleText_CalmedDown[] = _("{ATTACKING_MON} calmed down.");
const u8 BattleText_UproarCantSleep[] = _("But {DEFENDING_MON} can’t\nsleep in an UPROAR!");
const u8 BattleText_Stockpiled[] = _("{ATTACKING_MON} STOCKPILED\n{STRING 0}!");
const u8 BattleText_StockpiledCant[] = _("{ATTACKING_MON} can’t\nSTOCKPILE any more!");
const u8 BattleText_UproarCantSleep2[] = _("But {DEFENDING_MON} can’t\nsleep in an UPROAR!");
const u8 BattleText_UproarKeptAwake[] = _("But the UPROAR kept\n{DEFENDING_MON} awake!");
const u8 BattleText_StayedAwake[] = _("{DEFENDING_MON} stayed awake\nusing its {STRING 22}!");
const u8 BattleText_StoringEnergy[] = _("{ATTACKING_MON} is storing\nenergy!");
const u8 BattleText_UnleashedEnergy[] = _("{ATTACKING_MON} unleashed\nenergy!");
const u8 BattleText_FatigueConfuse[] = _("{ATTACKING_MON} became\nconfused out of fatigue!");
const u8 BattleText_PickedUpYen[] = _("{STRING 32} picked up\n¥{STRING 0}!\p");
const u8 BattleText_Unaffected[] = _("{DEFENDING_MON} is\nunaffected!");
const u8 BattleText_Transformed[] = _("{ATTACKING_MON} transformed\ninto {STRING 0}!");
const u8 BattleText_SubMade[] = _("{ATTACKING_MON} made\na SUBSTITUTE!");
const u8 BattleText_SubAlready[] = _("{ATTACKING_MON} already\nhas a SUBSTITUTE!");
const u8 BattleText_SubTookDamage[] = _("The SUBSTITUTE took damage\nfor {DEFENDING_MON}!\p");
const u8 BattleText_SubFaded[] = _("{DEFENDING_MON}’s\nSUBSTITUTE faded!\p");
const u8 BattleText_MustRecharge[] = _("{ATTACKING_MON} must\nrecharge!");
const u8 BattleText_RageBuilding[] = _("{DEFENDING_MON}’s RAGE\nis building!");
const u8 BattleText_MoveWasDisabled[] = _("{DEFENDING_MON}’s {STRING 0}\nwas disabled!");
const u8 BattleText_DisabledNoMore[] = _("{ATTACKING_MON} is disabled\nno more!");
const u8 BattleText_EncoreGot[] = _("{DEFENDING_MON} got\nan ENCORE!");
const u8 BattleText_EncoreEnded[] = _("{ATTACKING_MON}’s ENCORE\nended!");
const u8 BattleText_TookAim[] = _("{ATTACKING_MON} took aim\nat {DEFENDING_MON}!");
const u8 BattleText_SketchedMove[] = _("{ATTACKING_MON} SKETCHED\n{STRING 0}!");
const u8 BattleText_DestinyBondTake[] = _("{ATTACKING_MON} is trying\nto take its foe with it!");
const u8 BattleText_DestinyBondTaken[] = _("{DEFENDING_MON} took\n{ATTACKING_MON} with it!");
const u8 BattleText_ReducedBy[] = _("Reduced {DEFENDING_MON}’s\n{STRING 0} by {STRING 1}!");
const u8 BattleText_StoleSomething[] = _("{ATTACKING_MON} stole\n{DEFENDING_MON}’s {STRING 19}!");
const u8 BattleText_CantEscapeNow[] = _("{DEFENDING_MON} can’t\nescape now!");
const u8 BattleText_NightmareStart[] = _("{DEFENDING_MON} fell into\na NIGHTMARE!");
const u8 BattleText_NightmareLock[] = _("{ATTACKING_MON} is locked\nin a NIGHTMARE!");
const u8 BattleText_CurseLay[] = _("{ATTACKING_MON} cut its own HP\nand laid a CURSE on\l{DEFENDING_MON}!");
const u8 BattleText_CurseAfflict[] = _("{ATTACKING_MON} is afflicted\nby the CURSE!");
const u8 BattleText_SpikesScattered[] = _("{STRING 37} POKéMON team had SPIKES\nscattered around it!");
const u8 BattleText_SpikesHurt[] = _("{STRING 16} is hurt\nby SPIKES!");
const u8 BattleText_IdentifiedPoke[] = _("{ATTACKING_MON} identified\n{DEFENDING_MON}!");
const u8 BattleText_PerishSongFell[] = _("{ATTACKING_MON}’s PERISH count\nfell to {STRING 0}!");
const u8 BattleText_BracedItself[] = _("{ATTACKING_MON} braced\nitself!");
const u8 BattleText_EnduredHit[] = _("{DEFENDING_MON} ENDURED\nthe hit!");
const u8 BattleText_MagnitudeCount[] = _("MAGNITUDE {STRING 0}!");
const u8 BattleText_CutHPMaxATK[] = _("{ATTACKING_MON} cut its own HP\nand maximized ATTACK!");
const u8 BattleText_CopyStatChanges[] = _("{ATTACKING_MON} copied\n{DEFENDING_MON}’s stat changes!");
const u8 BattleText_GotFreeFrom[] = _("{ATTACKING_MON} got free of\n{DEFENDING_MON}’s {STRING 0}!");
const u8 BattleText_LeechShed[] = _("{ATTACKING_MON} shed\nLEECH SEED!");
const u8 BattleText_SpikesBlownAway[] = _("{ATTACKING_MON} blew away\nSPIKES!");
const u8 BattleText_FledBattle[] = _("{ATTACKING_MON} fled from\nbattle!");
const u8 BattleText_ForesawAttack[] = _("{ATTACKING_MON} foresaw\nan attack!");
const u8 BattleText_TookAttack[] = _("{DEFENDING_MON} took\n{STRING 0}’s attack!");
const u8 BattleText_ChoseDestiny[] = _("{ATTACKING_MON} chose\n{STRING 17} as its destiny!");
const u8 BattleText_PokeAttack[] = _("{STRING 0}’s attack!");
const u8 BattleText_CenterAttention[] = _("{ATTACKING_MON} became the\ncenter of attention!");
const u8 BattleText_ChargingPower[] = _("{ATTACKING_MON} began\ncharging power!");
const u8 BattleText_NaturePower[] = _("NATURE POWER turned into\n{STRING 17}!");
const u8 BattleText_StatusNormal[] = _("{ATTACKING_MON}’s status\nreturned to normal!");
const u8 BattleText_TormentSubject[] = _("{DEFENDING_MON} was subjected\nto TORMENT!");
const u8 BattleText_TightenFocus[] = _("{ATTACKING_MON} is tightening\nits focus!");
const u8 BattleText_TauntFell[] = _("{DEFENDING_MON} fell for\nthe TAUNT!");
const u8 BattleText_ReadyToHelp[] = _("{ATTACKING_MON} is ready to\nhelp {DEFENDING_MON}!");
const u8 BattleText_SwitchedItems[] = _("{ATTACKING_MON} switched\nitems with its opponent!");
const u8 BattleText_Obtained1[] = _("{ATTACKING_MON} obtained\n{STRING 0}.");
const u8 BattleText_Obtained2[] = _("{DEFENDING_MON} obtained\n{STRING 1}.");
const u8 BattleText_Obtained3[] = _("{ATTACKING_MON} obtained\n{STRING 0}.\p{DEFENDING_MON} obtained\n{STRING 1}.");
const u8 BattleText_CopiedObject[] = _("{ATTACKING_MON} copied\n{DEFENDING_MON}’s {STRING 22}!");
const u8 BattleText_WishMade[] = _("{ATTACKING_MON} made a WISH!");
const u8 BattleText_WishTrue[] = _("{STRING 0}’s WISH\ncame true!");
const u8 BattleText_PlantedRoots[] = _("{ATTACKING_MON} planted its roots!");
const u8 BattleText_AbsorbNutrients[] = _("{ATTACKING_MON} absorbed\nnutrients with its roots!");
const u8 BattleText_AnchoredItself[] = _("{DEFENDING_MON} anchored\nitself with its roots!");
const u8 BattleText_DrowsyMade[] = _("{ATTACKING_MON} made\n{DEFENDING_MON} drowsy!");
const u8 BattleText_KnockedOffItem[] = _("{ATTACKING_MON} knocked off\n{DEFENDING_MON}’s {STRING 19}!");
const u8 BattleText_AbilitySwap[] = _("{ATTACKING_MON} swapped abilities\nwith its opponent!");
const u8 BattleText_SealedMove[] = _("{ATTACKING_MON} sealed the\nopponent’s move(s)!");
const u8 BattleText_GrudgeBear[] = _("{ATTACKING_MON} wants the\nopponent to bear a GRUDGE!");
const u8 BattleText_GrudgeLosePP[] = _("{ATTACKING_MON}’s {STRING 0}\nlost all its PP due to\lthe GRUDGE!");
const u8 BattleText_ShroudedItself[] = _("{ATTACKING_MON} shrouded\nitself in {STRING 17}!");
const u8 BattleText_MagicCoatBounce[] = _("{ATTACKING_MON}’s {STRING 17}\nwas bounced back by MAGIC COAT!");
const u8 BattleText_AwaitMove[] = _("{ATTACKING_MON} awaits its foe\nto make a move!");
const u8 BattleText_SnatchedMove[] = _("{DEFENDING_MON} SNATCHED\n{STRING 16}’s move!");
const u8 BattleText_ElecWeakened[] = _("Electricity’s power was\nweakened!");
const u8 BattleText_FireWeakened[] = _("Fire’s power was\nweakened!");
const u8 BattleText_FoundOne[] = _("{ATTACKING_MON} found\none {STRING 19}!");
const u8 BattleText_SoothingAroma[] = _("A soothing aroma wafted\nthrough the area!");
const u8 BattleText_CantUseItems[] = _("Items can’t be used now.{PAUSE 64}");
const u8 BattleText_UnknownString2[] = _("For {STRING 16},\n{STRING 19} {STRING 0}");
const u8 BattleText_HustleUse[] = _("{STRING 16} used\n{STRING 19} to hustle!");
const u8 BattleText_LostFocus[] = _("{ATTACKING_MON} lost its\nfocus and couldn’t move!");
const u8 BattleText_DraggedOut[] = _("{DEFENDING_MON} was\ndragged out!\p");
const u8 BattleText_BrokeWall[] = _("The wall shattered!");
const u8 BattleText_NoEffect[] = _("But it had no effect!");
const u8 BattleText_NoMovesLeft[] = _("{STRING 15} has no\nmoves left!\p");
const u8 BattleText_MoveIsDisabled[] = _("{STRING 15}’s {STRING 17}\nis disabled!\p");
const u8 BattleText_TormentNoUse[] = _("{STRING 15} can’t use the same\nmove twice in a row due to the TORMENT!\p");
const u8 BattleText_TauntNoUse[] = _("{STRING 15} can’t use\n{STRING 17} after the TAUNT!\p");
const u8 BattleText_SealedNoUse[] = _("{STRING 15} can’t use the\nsealed {STRING 17}!\p");
const u8 BattleText_RainMade[] = _("{STRING 16}’s {STRING 23}\nmade it rain!");
const u8 BattleText_SpeedRisen[] = _("{STRING 16}’s {STRING 23}\nraised its SPEED!");
const u8 BattleText_ProtectedBy[] = _("{DEFENDING_MON} was protected\nby {STRING 22}!");
const u8 BattleText_PreventedBy[] = _("{DEFENDING_MON}’s {STRING 22}\nprevents {ATTACKING_MON}\lfrom using {STRING 17}!");
const u8 BattleText_HPRestoredUsing[] = _("{DEFENDING_MON} restored HP\nusing its {STRING 22}!");
const u8 BattleText_MadeUseless[] = _("{DEFENDING_MON}’s {STRING 22}\nmade {STRING 17} useless!");
const u8 BattleText_MadeType[] = _("{DEFENDING_MON}’s {STRING 22}\nmade it the {STRING 0} type!");
const u8 BattleText_PreventedPara[] = _("{STRING 14}’s {STRING 22}\nprevents paralysis!");
const u8 BattleText_PreventedRomance[] = _("{DEFENDING_MON}’s {STRING 22}\nprevents romance!");
const u8 BattleText_PreventedPoison[] = _("{STRING 14}’s {STRING 22}\nprevents poisoning!");
const u8 BattleText_PreventedConfusion[] = _("{DEFENDING_MON}’s {STRING 22}\nprevents confusion!");
const u8 BattleText_RaisedFirePower[] = _("{DEFENDING_MON}’s {STRING 22}\nraised its FIRE power!");
const u8 BattleText_AnchorsItself[] = _("{DEFENDING_MON} anchors\nitself with {STRING 22}!");
const u8 BattleText_CutsAttack[] = _("{STRING 16}’s {STRING 23}\ncuts {DEFENDING_MON}’s ATTACK!");
const u8 BattleText_PreventedStatLoss[] = _("{STRING 16}’s {STRING 23}\nprevents stat loss!");
const u8 BattleText_HurtOther[] = _("{DEFENDING_MON}’s {STRING 22}\nhurt {ATTACKING_MON}!");
const u8 BattleText_Traced[] = _("{STRING 16} TRACED\n{STRING 0}’s {STRING 1}!");
const u8 BattleText_PreventedBurn[] = _("{STRING 14}’s {STRING 24}\nprevents burns!");
const u8 BattleText_BlocksOther[] = _("{DEFENDING_MON}’s {STRING 22}\nblocks {STRING 17}!");
const u8 BattleText_BlocksOther2[] = _("{STRING 16}’s {STRING 23}\nblocks {STRING 17}!");
const u8 BattleText_RestoredHPByItem[] = _("{ATTACKING_MON}’s {STRING 21}\nrestored some HP!");
const u8 BattleText_WhipSandstorm[] = _("{STRING 16}’s {STRING 23}\nwhipped up a sandstorm!");
const u8 BattleText_SunIntensified[] = _("{STRING 16}’s {STRING 23}\nintensified the sun’s rays!");
const u8 BattleText_PreventedLoss[] = _("{STRING 16}’s {STRING 23}\nprevents {STRING 0} loss!");
const u8 BattleText_InfatuatedPoke[] = _("{DEFENDING_MON}’s {STRING 22}\ninfatuated {ATTACKING_MON}!");
const u8 BattleText_MadeIneffective[] = _("{DEFENDING_MON}’s {STRING 22}\nmade {STRING 17} ineffective!");
const u8 BattleText_CuredProblem[] = _("{STRING 16}’s {STRING 23}\ncured its {STRING 0} problem!");
const u8 BattleText_OozeSuckup[] = _("It sucked up the\nLIQUID OOZE!");
const u8 BattleText_Transformed2[] = _("{STRING 16} transformed!");
const u8 BattleText_TookAttack2[] = _("{DEFENDING_MON}’s {STRING 22}\ntook the attack!");
const u8 BattleText_PreventedSwitch[] = _("{STRING 0}’s {STRING 20}\nprevents switching!\p");
const u8 BattleText_PreventedOther[] = _("{DEFENDING_MON}’s {STRING 22}\nprevented {STRING 16}’s\l{STRING 0} from working!");
const u8 BattleText_MadeIneffective2[] = _("{STRING 16}’s {STRING 23}\nmade it ineffective!");
const u8 BattleText_PreventedFlinching[] = _("{STRING 14}’s {STRING 24}\nprevents flinching!");
const u8 BattleText_PreventedOther2[] = _("{ATTACKING_MON}’s {STRING 21}\nprevents {DEFENDING_MON}’s\l{STRING 22} from working!");
const u8 BattleText_CuredOfProblem[] = _("{STRING 16}’s {STRING 23}\ncured its {STRING 0} problem!");
const u8 BattleText_NoEffectOn[] = _("{STRING 16}’s {STRING 23}\nhad no effect on {STRING 14}!");
const u8 BattleText_Sharply[] = _("sharply ");
const u8 BattleText_Rose[] = _("rose!");
const u8 BattleText_Harshly[] = _("harshly ");
const u8 BattleText_Fell[] = _("fell!");
const u8 BattleText_UnknownString7[] = _("{ATTACKING_MON}’s {STRING 0}\n{STRING 1}");
const u8 BattleText_UnknownString3[] = _("{DEFENDING_MON}’s {STRING 0}\n{STRING 1}");
const u8 BattleText_UnknownString4[] = _("Using {STRING 19}, the {STRING 0}\nof {STRING 16} {STRING 1}");
const u8 BattleText_UnknownString5[] = _("{ATTACKING_MON}’s {STRING 0}\n{STRING 1}");
const u8 BattleText_UnknownString6[] = _("{DEFENDING_MON}’s {STRING 0}\n{STRING 1}");
const u8 BattleText_StatNoHigher[] = _("{ATTACKING_MON}’s stats won’t\ngo any higher!");
const u8 BattleText_StatNoLower[] = _("{DEFENDING_MON}’s stats won’t\ngo any lower!");
const u8 BattleText_Critical[] = _("A critical hit!");
const u8 BattleText_GrandSlam[] = _("It’s a one-hit KO!");
const u8 BattleText_MoveForget123[] = _("{PAUSE 32}1, {PAUSE 15}2 and...{PAUSE 15} ...{PAUSE 15} ...{PAUSE 15}\n{PAUSE 15}{PLAY_SE SE_KON}Poof!\p");
const u8 BattleText_MoveForgetAnd[] = _("And...\p");
const u8 BattleText_CantForgetHM[] = _("HM moves can’t be\nforgotten now.\p");
const u8 BattleText_NotEffective[] = _("It’s not very effective...");
const u8 BattleText_SuperEffective[] = _("It’s super effective!");
const u8 BattleText_GotAwaySafely[] = _("{PLAY_SE SE_NIGERU}Got away safely!\p");
const u8 BattleText_FledUsingItem[] = _("{PLAY_SE SE_NIGERU}{ATTACKING_MON} fled\nusing its {STRING 19}!\p");
const u8 BattleText_FledUsingOther[] = _("{PLAY_SE SE_NIGERU}{ATTACKING_MON} fled\nusing {STRING 21}!\p");
const u8 BattleText_FledWild[] = _("{PLAY_SE SE_NIGERU}Wild {STRING 0} fled!");
const u8 BattleText_PlayerDefeatedTrainer[] = _("Player defeated\n{STRING 29}!");
const u8 BattleText_PlayerDefeatedTrainers[] = _("Player beat {STRING 30}\nand {STRING 29}!");
const u8 BattleText_PlayerLostTrainer[] = _("Player lost against\n{STRING 29}!");
const u8 BattleText_PlayerLostTrainers[] = _("Player lost to {STRING 30}\nand {STRING 29}!");
const u8 BattleText_PlayerTiedTrainer[] = _("Player tied against\n{STRING 29}!");
const u8 BattleText_PlayerTiedTrainers[] = _("Player tied against {STRING 30}\nand {STRING 29}!");
const u8 BattleText_FledSingle[] = _("{PLAY_SE SE_NIGERU}{STRING 29} fled!");
const u8 BattleText_FledDouble[] = _("{PLAY_SE SE_NIGERU}{STRING 29} and\n{STRING 30} fled!");
const u8 BattleText_NoRunning[] = _("No! There’s no running\nfrom a TRAINER battle!\p");
const u8 BattleText_CantEscape2[] = _("Can’t escape!\p");
const u8 BattleText_BirchDontLeaveMe[] = _("PROF. BIRCH: D-don’t leave\nme here like this!\p");
const u8 BattleText_Nothing[] = _("But nothing happened!");
const u8 BattleText_Failed[] = _("But it failed!");
const u8 BattleText_HurtItself[] = _("It hurt itself in its\nconfusion!");
const u8 BattleText_MirrorFail[] = _("The MIRROR MOVE failed!");
const u8 BattleText_RainStart[] = _("It started to rain!");
const u8 BattleText_PourStart[] = _("A downpour started!");
const u8 BattleText_RainCont1[] = _("Rain continues to fall.");
const u8 BattleText_PourCont[] = _("The downpour continues.");
const u8 BattleText_RainStop[] = _("The rain stopped.");
const u8 BattleText_SandBrewed[] = _("A sandstorm brewed!");
const u8 BattleText_SandRages[] = _("The sandstorm rages.");
const u8 BattleText_SandSubsided[] = _("The sandstorm subsided.");
const u8 BattleText_SunBright[] = _("The sunlight got bright!");
const u8 BattleText_SunStrong[] = _("The sunlight is strong.");
const u8 BattleText_SunFaded[] = _("The sunlight faded.");
const u8 BattleText_HailStart[] = _("It started to hail!");
const u8 BattleText_HailCont[] = _("Hail continues to fall.");
const u8 BattleText_HailStop[] = _("The hail  stopped.");
const u8 BattleText_SpitUpFail[] = _("But it failed to SPIT UP\na thing!");
const u8 BattleText_SwallowFail[] = _("But it failed to SWALLOW\na thing!");
const u8 BattleText_WindHeatWave[] = _("The wind turned into a\nHEAT WAVE!");
const u8 BattleText_StatElim[] = _("All stat changes were\neliminated!");
const u8 BattleText_CoinScatter[] = _("Coins scattered everywhere!");
const u8 BattleText_SubWeak[] = _("It was too weak to make\na SUBSTITUTE!");
const u8 BattleText_PainSplit[] = _("The battlers shared\ntheir pain!");
const u8 BattleText_BellChime[] = _("A bell chimed!");
const u8 BattleText_PerishSong[] = _("All affected POKéMON will\nfaint in 3 turns!");
const u8 BattleText_NoPP1[] = _("There’s no PP left for\nthis move!\p");
const u8 BattleText_NoPP2[] = _("But there was no PP left\nfor the move!");
const u8 BattleText_IgnoredOrdersSLP[] = _("{ATTACKING_MON} ignored\norders while asleep!");
const u8 BattleText_IgnoredOrders[] = _("{ATTACKING_MON} ignored\norders!");
const u8 BattleText_BeganNap[] = _("{ATTACKING_MON} began to nap!");
const u8 BattleText_LoafingAround[] = _("{ATTACKING_MON} is\nloafing around!");
const u8 BattleText_WontObey[] = _("{ATTACKING_MON} won’t\nobey!");
const u8 BattleText_TurnedAway[] = _("{ATTACKING_MON} turned away!");
const u8 BattleText_NotNotice[] = _("{ATTACKING_MON} pretended\nto not notice!");
const u8 BattleText_WillSwitch[] = _("{STRING 25} {STRING 26} is\nabout to use {STRING 1}.\pWill {STRING 32} change\nPOKéMON?");
const u8 BattleText_LearnedMove2[] = _("{ATTACKING_MON} learned\n{STRING 0}!");
const u8 BattleText_PlayerDefeatedTrainer2[] = _("Player defeated\n{STRING 25} {STRING 26}!\p");
const u8 BattleText_CreptCloser[] = _("{STRING 32} crept closer to\n{STRING 3}!");
const u8 BattleText_CantGetCloser[] = _("{STRING 32} can’t get any closer!");
const u8 BattleText_WatchingCarefully[] = _("{STRING 3} is watching\ncarefully!");
const u8 BattleText_CuriousAbout[] = _("{STRING 3} is curious about\nthe {STRING 0}!");
const u8 BattleText_EnthralledBy[] = _("{STRING 3} is enthralled by\nthe {STRING 0}!");
const u8 BattleText_IgnoredThing[] = _("{STRING 3} completely ignored\nthe {STRING 0}!");
const u8 BattleText_ThrewBlock[] = _("{STRING 32} threw a {POKEBLOCK}\nat the {STRING 3}!");
const u8 BattleText_SafariOver[] = _("{PLAY_SE SE_PINPON}ANNOUNCER: You’re out of\nSAFARI BALLS! Game over!\p");
const u8 BattleText_WildAppeared1[] = _("Wild {STRING 3} appeared!\p");
const u8 BattleText_WildAppeared2[] = _("Wild {STRING 3} appeared!\p");
const u8 BattleText_WildAppeared3[] = _("Wild {STRING 3} appeared!{PAUSE 127}");
const u8 BattleText_WildDoubleAppeared[] = _("Wild {STRING 5} and\n{STRING 3} appeared!\p");
const u8 BattleText_SingleWantToBattle1[] = _("{STRING 25} {STRING 26}\nwould like to battle!\p");
const u8 BattleText_SingleWantToBattle2[] = _("{STRING 29}\nwants to battle!");
const u8 BattleText_DoubleWantToBattle[] = _("{STRING 29} and {STRING 30}\nwant to battle!");
const u8 BattleText_SentOutSingle1[] = _("{STRING 25} {STRING 26} sent\nout {STRING 3}!");
const u8 BattleText_SentOutDouble1[] = _("{STRING 25} {STRING 26} sent\nout {STRING 3} and {STRING 5}!");
const u8 BattleText_SentOutSingle2[] = _("{STRING 25} {STRING 26} sent\nout {STRING 0}!");
const u8 BattleText_SentOutSingle3[] = _("{STRING 29} sent\nout {STRING 3}!");
const u8 BattleText_SentOutDouble2[] = _("{STRING 29} sent out\n{STRING 3} and {STRING 5}!");
const u8 BattleText_SentOutDouble3[] = _("{STRING 29} sent out\n{STRING 7}!\p{STRING 30} sent out\n{STRING 9}!");
const u8 BattleText_SentOutSingle4[] = _("{STRING 29} sent out\n{STRING 0}!");
const u8 BattleText_SentOutSingle5[] = _("{STRING 31} sent out\n{STRING 0}!");
const u8 BattleText_SentOutSingle6[] = _("Go! {STRING 2}!");
const u8 BattleText_SentOutDouble4[] = _("Go! {STRING 2} and\n{STRING 4}!");
const u8 BattleText_SentOutSingle7[] = _("Go! {STRING 0}!");
const u8 BattleText_SentOutSingle8[] = _("Do it! {STRING 0}!");
const u8 BattleText_SentOutSingle9[] = _("Go for it, {STRING 0}!");
const u8 BattleText_SentOutSingle10[] = _("Your foe’s weak!\nGet’m, {STRING 0}!");
const u8 BattleText_SentOutSingle11[] = _("{STRING 28} sent out\n{STRING 8}!\pGo! {STRING 6}!");
const u8 BattleText_ComeBackSingle1[] = _("{STRING 0}, that’s enough!\nCome back!");
const u8 BattleText_ComeBackSingle2[] = _("{STRING 0}, come back!");
const u8 BattleText_ComeBackSingle3[] = _("{STRING 0}, OK!\nCome back!");
const u8 BattleText_ComeBackSingle4[] = _("{STRING 0}, good!\nCome back!");
const u8 BattleText_WithdrewPoke1[] = _("{STRING 25} {STRING 26}\nwithdrew {STRING 0}!");
const u8 BattleText_WithdrewPoke2[] = _("{STRING 29} withdrew\n{STRING 0}!");
const u8 BattleText_WithdrewPoke3[] = _("{STRING 31} withdrew\n{STRING 0}!");
const u8 BattleText_Wild[] = _("Wild ");
const u8 BattleText_Foe[] = _("Foe ");
const u8 BattleText_Foe2[] = _("Foe ");
const u8 BattleText_Ally[] = _("Ally ");
const u8 BattleText_Foe3[] = _("Foe ");
const u8 BattleText_Ally2[] = _("Ally ");
const u8 BattleText_Foe4[] = _("Foe ");
const u8 BattleText_Ally3[] = _("Ally ");
const u8 BattleText_OpponentUsedMove[] = _("{ATTACKING_MON} used\n{STRING 1}");
const u8 BattleText_Exclamation2[] = _("!");
const u8 BattleText_Exclamation3[] = _("!");
const u8 BattleText_Exclamation4[] = _("!");
const u8 BattleText_Exclamation5[] = _("!");
const u8 BattleText_Exclamation[] = _("!");
const u8 BattleStatText_HP[] = _("HP");
const u8 BattleStatText_Attack[] = _("ATTACK");
const u8 BattleStatText_Defense[] = _("DEFENSE");
const u8 BattleStatText_Speed[] = _("SPEED");
const u8 BattleStatText_SpAtk[] = _("SP. ATK");
const u8 BattleStatText_SpDef[] = _("SP. DEF");
const u8 BattleStatText_Accuracy[] = _("accuracy");
const u8 BattleStatText_Evasion[] = _("evasiveness");
const u8 ContestStatText_TooSpicy[] = _("was too spicy!");
const u8 ContestStatText_TooDry[] = _("was too dry!");
const u8 ContestStatText_TooSweet[] = _("was too sweet!");
const u8 ContestStatText_TooBitter[] = _("was too bitter!");
const u8 ContestStatText_TooSour[] = _("was too sour!");
const u8 BattleText_Used1[] = _("{STRING 32} used\n{STRING 19}!");
const u8 BattleText_TutorialUsed[] = _("WALLY used\n{STRING 19}!");
const u8 BattleText_Used2[] = _("{STRING 25} {STRING 26}\nused {STRING 19}!");
const u8 BattleText_BlockBall[] = _("The TRAINER blocked the BALL!");
const u8 BattleText_DontBeAThief[] = _("Don’t be a thief!");
const u8 BattleText_DodgeBall[] = _("It dodged the thrown BALL!\nThis POKéMON can’t be caught!");
const u8 BattleText_MissPoke[] = _("You missed the POKéMON!");
const u8 BattleText_BallBrokeOhNo[] = _("Oh, no!\nThe POKéMON broke free!");
const u8 BattleText_BallBrokeAppeared[] = _("Aww!\nIt appeared to be caught!");
const u8 BattleText_BallBrokeAlmost[] = _("Aargh!\nAlmost had it!");
const u8 BattleText_BallBrokeSoClose[] = _("Shoot!\nIt was so close, too!");
const u8 BattleText_BallCaught1[] = _("Gotcha!\n{STRING 3} was caught!{UNKNOWN_A}{PLAY_BGM MUS_KACHI22}\p");
const u8 BattleText_BallCaught2[] = _("Gotcha!\n{STRING 3} was caught!{UNKNOWN_A}{PLAY_BGM MUS_KACHI22}{PAUSE 127}");
const u8 BattleText_GiveNickname[] = _("Give a nickname to the\ncaptured {STRING 3}?");
const u8 BattleText_SentToPC[] = _("{STRING 3} was sent to\n{STRING 35} PC.");
const u8 BattleText_Someone[] = _("someone’s");
const u8 BattleText_Lanette[] = _("LANETTE’s");
const u8 BattleText_AddedToDex[] = _("{STRING 3}’s data was\nadded to the POKéDEX.\p");
const u8 BattleText_Raining[] = _("It is raining.");
const u8 BattleText_Sandstorm[] = _("A sandstorm is raging.");
const u8 BattleText_BoxFull[] = _("The BOX is full!\nYou can’t catch any more!\p");
const u8 BattleText_EnigmaBerry[] = _("ENIGMA BERRY");
const u8 BattleText_Berry[] = _(" BERRY");
const u8 BattleText_CuredParalysis[] = _("{STRING 16}’s {STRING 19}\ncured paralysis!");
const u8 BattleText_CuredPoison[] = _("{STRING 16}’s {STRING 19}\ncured poison!");
const u8 BattleText_CuredBurn[] = _("{STRING 16}’s {STRING 19}\nhealed its burn!");
const u8 BattleText_CuredFreeze[] = _("{STRING 16}’s {STRING 19}\ndefrosted it!");
const u8 BattleText_CuredSleep[] = _("{STRING 16}’s {STRING 19}\nwoke it from its sleep!");
const u8 BattleText_CuredConfusion[] = _("{STRING 16}’s {STRING 19}\nsnapped it out of confusion!");
const u8 BattleText_CuredStatus[] = _("{STRING 16}’s {STRING 19}\ncured its {STRING 0} problem!");
const u8 BattleText_NormalizedStatus[] = _("{STRING 16}’s {STRING 19}\nnormalized its status!");
const u8 BattleText_RestoredHealth[] = _("{STRING 16}’s {STRING 19}\nrestored health!");
const u8 BattleText_RestoredPP[] = _("{STRING 16}’s {STRING 19}\nrestored {STRING 0}’s PP!");
const u8 BattleText_RestoredStatus[] = _("{STRING 16}’s {STRING 19}\nrestored its status!");
const u8 BattleText_RestoredHPLittle[] = _("{STRING 16}’s {STRING 19}\nrestored its HP a little!");
const u8 BattleText_ChoiceBand[] = _("{STRING 19} allows the\nuse of only {STRING 17}!\p");
const u8 BattleText_FocusSash[] = _("{DEFENDING_MON} hung on\nusing its {STRING 19}!");
const u8 BattleText_Terminator2[] = _("");
const u8 BattleText_WallyBall[] = _("You throw a BALL now, right?\nI... I’ll do my best!");
const u8 BattleText_StartEvo[] = _("What?\n{STRING 2} is evolving!");
const u8 BattleText_FinishEvo[] = _("Congratulations! Your {STRING 2}\nevolved into {STRING 3}!{UNKNOWN_A}\p");
const u8 BattleText_StopEvo[] = _("Huh? {STRING 2}\nstopped evolving!\p");
const u8 BattleText_OtherMenu[] = _("What should\n{STRING 15} do?");
const u8 BattleText_PlayerMenu[] = _("What will\n{STRING 32} do?");
const u8 BattleText_WallyMenu[] = _("What will\nWALLY do?");
const u8 BattleText_LinkStandby[] = _("{PAUSE 16}Link standby...");
const u8 BattleText_MenuOptions[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}FIGHT{CLEAR_TO 0x2E}BAG\nPOKéMON{CLEAR_TO 0x2E}RUN");
const u8 BattleText_MenuOptionsSafari[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}BALL{CLEAR_TO 0x2E}{POKEBLOCK}\nGO NEAR{CLEAR_TO 0x2E}RUN");
const u8 BattleText_PP[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}PP\nTYPE/");
const u8 BattleText_Format[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}"); // cant think of a better name
const u8 BattleText_ForgetMove[] = _("{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}{PALETTE 5}Which move should\nbe forgotten?");
const u8 BattleText_YesNo[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Yes\nNo");
const u8 BattleText_SwitchWhich[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Switch\nwhich?");
const u8 BattleText_Format2[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}");
const u8 BattleText_RightArrow[] = _("{RIGHT_ARROW}");
const u8 BattleText_Plus[] = _("+");
const u8 BattleText_Dash[] = _("-");
const u8 BattleText_HP[] = _("HP     ");
const u8 BattleText_Attack[] = _("ATTACK ");
const u8 BattleText_Defense[] = _("DEFENSE");
const u8 BattleText_SpAtk[] = _("SP. ATK");
const u8 BattleText_SpDef[] = _("SP. DEF");
const u8 BattleText_SafariBalls[] = _("{HIGHLIGHT RED}SAFARI BALLS");
const u8 BattleText_SafariBallsLeft[] = _("{HIGHLIGHT RED}Left: ");
const u8 BattleText_HighlightRed[] = _("{HIGHLIGHT RED}");
const u8 BattleText_Sleep[] = _("sleep");
const u8 BattleText_PoisonStatus[] = _("poison");
const u8 BattleText_Burn[] = _("burn");
const u8 BattleText_Paralysis[] = _("paralysis");
const u8 BattleText_IceStatus[] = _("ice");
const u8 BattleText_Confusion[] = _("confusion");
const u8 BattleText_Love[] = _("love");
const u8 BattleText_Format3[] = _(" and ");
const u8 BattleText_Format4[] = _(", ");
const u8 BattleText_Format5[] = _(" ");
const u8 BattleText_Format6[] = _("\l");
const u8 BattleText_Format7[] = _("\n");
const u8 BattleText_Format8[] = _("are");
const u8 BattleText_Format9[] = _("are");
const u8 gBadEggNickname[] = _("Bad EGG"); // 8400E3A
const u8 BattleText_Wally[] = _("WALLY");
const u8 BattleText_Win[] = _("{HIGHLIGHT TRANSPARENT}Win"); // 8400E48
const u8 BattleText_Loss[] = _("{HIGHLIGHT TRANSPARENT}Loss"); // 8400E4F
const u8 BattleText_Tie[] = _("{HIGHLIGHT TRANSPARENT}Tie"); // 8400E57
const u8 BattleText_Format10[] = _(" is");
const u8 BattleText_Format11[] = _("’s");
const u8 BattleText_Normal[] = _("a NORMAL move");
const u8 BattleText_Fighting[] = _("a FIGHTING move");
const u8 BattleText_Flying[] = _("a FLYING move");
const u8 BattleText_Poison[] = _("a POISON move");
const u8 BattleText_Ground[] = _("a GROUND move");
const u8 BattleText_Rock[] = _("a ROCK move");
const u8 BattleText_Bug[] = _("a BUG move");
const u8 BattleText_Ghost[] = _("a GHOST move");
const u8 BattleText_Steel[] = _("a STEEL move");
const u8 BattleText_Typeless[] = _("a ??? move");
const u8 BattleText_Fire[] = _("a FIRE move");
const u8 BattleText_Water[] = _("a WATER move");
const u8 BattleText_Grass[] = _("a GRASS move");
const u8 BattleText_Electric[] = _("an ELECTRIC move");
const u8 BattleText_Psychic[] = _("a PSYCHIC move");
const u8 BattleText_Ice[] = _("an ICE move");
const u8 BattleText_Dragon[] = _("a DRAGON move");
const u8 BattleText_Dark[] = _("a DARK move");

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
