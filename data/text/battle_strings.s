	.align 2
gUnknown_083FE4F4:: @ 83FE4F4
	.4byte dp01t_00_3_getattr
	.4byte sub_811EC04
	.4byte sub_811EC10
	.4byte sub_811F664
	.4byte sub_811F6D8
	.4byte sub_811F7F4
	.4byte sub_811F9D0
	.4byte sub_811FAE4
	.4byte sub_811FC30
	.4byte sub_811FC3C
	.4byte sub_811FCE8
	.4byte sub_811FDCC
	.4byte sub_811FDD8
	.4byte sub_811FDE4
	.4byte sub_811FDF0
	.4byte sub_811FDFC
	.4byte sub_8120094
	.4byte sub_81200F8
	.4byte sub_8120104
	.4byte sub_8120110
	.4byte sub_812011C
	.4byte sub_8120128
	.4byte sub_8120134
	.4byte sub_8120140
	.4byte sub_812014C
	.4byte sub_812023C
	.4byte sub_8120248
	.4byte sub_81202BC
	.4byte sub_8120324
	.4byte sub_8120330
	.4byte sub_812033C
	.4byte sub_8120348
	.4byte sub_8120354
	.4byte sub_8120360
	.4byte sub_812036C
	.4byte sub_8120378
	.4byte sub_8120384
	.4byte sub_8120390
	.4byte sub_81203AC
	.4byte sub_81203E4
	.4byte sub_81203FC
	.4byte dp01t_29_3_blink
	.4byte sub_8120494
	.4byte sub_81204A0
	.4byte sub_81204E4
	.4byte sub_8120514
	.4byte dp01t_2E_3_battle_intro
	.4byte sub_8120588
	.4byte dp01t_30_3_80EB11C
	.4byte sub_8120920
	.4byte sub_812096C
	.4byte sub_8120978
	.4byte sub_81209D8
	.4byte sub_8120A40
	.4byte sub_8120A4C
	.4byte sub_8120A58
	.4byte nullsub_75

BattleText_UnknownString:
	.string "{STRING 33}$"
BattleText_GainExpPoints:
	.string "{STRING 0} gained{STRING 1}\n{STRING 42} EXP. Points!\p$"
BattleText_Terminator:
	.string "$"
BattleText_BoostedExp:
	.string " a boosted$"
BattleText_GrewLevel:
	.string "{STRING 0} grew to\nLV. {STRING 1}!{UNKNOWN_A}\p$"
BattleText_LearnedMove:
	.string "{STRING 0} learned\n{STRING 1}!{UNKNOWN_A}\p$"
BattleText_TryingToLearnMove:
	.string "{STRING 0} is trying to\nlearn {STRING 1}.\p$"
BattleText_CantLearnMore:
	.string "But, {STRING 0} can’t learn\nmore than four moves.\p$"
BattleText_DeleteMove:
	.string "Delete a move to make\nroom for {STRING 1}?$"
BattleText_DeletedMove:
	.string "{STRING 0} forgot\n{STRING 1}.\p$"
BattleText_StopLearning:
	.string "{PAUSE 32}Stop learning\n{STRING 1}?$"
BattleText_DidNotLearn:
	.string "{STRING 0} did not learn\n{STRING 1}.\p$"
BattleText_UseNext:
	.string "Use next POKéMON?$"
BattleText_AttackMissed:
	.string "{ATTACKING_MON}’s\nattack missed!$"
BattleText_ProtectedItself:
	.string "{DEFENDING_MON}\nprotected itself!$"
BattleText_AvoidedDamage:
	.string "{DEFENDING_MON} avoided\ndamage with {STRING 22}!$"
BattleText_GroundMoveNegate:
	.string "{DEFENDING_MON} makes GROUND\nmoves miss with {STRING 22}!$"
BattleText_AvoidedAttack:
	.string "{DEFENDING_MON} avoided\nthe attack!$"
BattleText_DoesntAffect:
	.string "It doesn’t affect\n{DEFENDING_MON}...$"
BattleText_AttackingFainted:
	.string "{ATTACKING_MON}\nfainted!\p$"
BattleText_DefendingFainted:
	.string "{DEFENDING_MON}\nfainted!\p$"
BattleText_WinningPrize:
	.string "{STRING 32} got ¥{STRING 0}\nfor winning!\p$"
BattleText_OutOfUsablePoke:
	.string "{STRING 32} is out of\nuseable POKéMON!\p$"
BattleText_WhitedOut:
	.string "{STRING 32} whited out!{PAUSE_UNTIL_PRESS}$"
BattleText_PreventEscape:
	.string "{STRING 16} prevents\nescape with {STRING 23}!\p$"
BattleText_CantEscape:
	.string "Can’t escape!\p$"
BattleText_AttackingCantEscape:
	.string "{ATTACKING_MON}\ncan’t escape!$"
BattleText_HitMulti:
	.string "Hit {STRING 0} time(s)!$"
BattleText_FellAsleep:
	.string "{STRING 14}\nfell asleep!$"
BattleText_MadeAsleep:
	.string "{STRING 16}’s {STRING 23}\nmade {STRING 14} sleep!$"
BattleText_DefendingAsleep:
	.string "{DEFENDING_MON} is\nalready asleep!$"
BattleText_AttackingAsleep:
	.string "{ATTACKING_MON} is\nalready asleep!$"
BattleText_WasntAffected:
	.string "{DEFENDING_MON}\nwasn’t affected!$"
BattleText_Poisoned:
	.string "{STRING 14}\nwas poisoned!$"
BattleText_Poisoned2:
	.string "{STRING 16}’s {STRING 23}\npoisoned {STRING 14}!$"
BattleText_PoisonHurt:
	.string "{ATTACKING_MON} is hurt\nby poison!$"
BattleText_AlreadyPoisoned:
	.string "{DEFENDING_MON} is already\npoisoned.$"
BattleText_BadlyPoisoned:
	.string "{STRING 14} is badly\npoisoned!$"
BattleText_EnergyDrained:
	.string "{DEFENDING_MON} had its\nenergy drained!$"
BattleText_Burned:
	.string "{STRING 14} was burned!$"
BattleText_Burned2:
	.string "{STRING 16}’s {STRING 23}\nburned {STRING 14}!$"
BattleText_BurnHurt:
	.string "{ATTACKING_MON} is hurt\nby its burn!$"
BattleText_AlreadyBurned:
	.string "{DEFENDING_MON} already\nhas a burn.$"
BattleText_Frozen:
	.string "{STRING 14} was\nfrozen solid!$"
BattleText_Frozen2:
	.string "{STRING 16}’s {STRING 23}\nfroze {STRING 14} solid!$"
BattleText_FrozenSolid:
	.string "{ATTACKING_MON} is\nfrozen solid!$"
BattleText_DefendingDefrosted:
	.string "{DEFENDING_MON} was\ndefrosted!$"
BattleText_AttackingDefrosted:
	.string "{ATTACKING_MON} was\ndefrosted!$"
BattleText_Defrosted:
	.string "{ATTACKING_MON} was\ndefrosted by {STRING 17}!$"
BattleText_Paralyzed:
	.string "{STRING 14} is paralyzed!\nIt may be unable to move!$"
BattleText_Paralyzed2:
	.string "{STRING 16}’s {STRING 23}\nparalyzed {STRING 14}!\lIt may be unable to move!$"
BattleText_Paralyzed3:
	.string "{ATTACKING_MON} is paralyzed!\nIt can’t move!$"
BattleText_AlreadyParalyzed:
	.string "{DEFENDING_MON} is\nalready paralyzed!$"
BattleText_ParalysisHealed:
	.string "{DEFENDING_MON} was\nhealed of paralysis!$"
BattleText_DreamEaten:
	.string "{DEFENDING_MON}’s\ndream was eaten!$"
BattleText_AttackingStatNoHigher:
	.string "{ATTACKING_MON}’s {STRING 0}\nwon’t go higher!$"
BattleText_DefendingStatNoHigher:
	.string "{DEFENDING_MON}’s {STRING 0}\nwon’t go lower!$"
BattleText_StoppedWorking:
	.string "Your team’s {STRING 0}\nstopped working!$"
BattleText_StoppedWorking2:
	.string "The foe’s {STRING 0}\nstopped working!$"
BattleText_Confused:
	.string "{ATTACKING_MON} is\nconfused!$"
BattleText_ConfusionSnapOut:
	.string "{ATTACKING_MON} snapped\nout of confusion!$"
BattleText_BecameConfused:
	.string "{STRING 14} became\nconfused!$"
BattleText_AlreadyConfused:
	.string "{DEFENDING_MON} is\nalready confused!$"
BattleText_FellLove:
	.string "{DEFENDING_MON}\nfell in love!$"
BattleText_InLoveWith:
	.string "{ATTACKING_MON} is in love\nwith {STRING 16}!$"
BattleText_ImmobilizedBy:
	.string "{ATTACKING_MON} is\nimmobilized by love!$"
BattleText_BlownAway:
	.string "{DEFENDING_MON} was\nblown away!$"
BattleText_TypeTransform:
	.string "{ATTACKING_MON} transformed\ninto the {STRING 0} type!$"
BattleText_Flinched:
	.string "{ATTACKING_MON} flinched!$"
BattleText_RegainedHealth:
	.string "{DEFENDING_MON} regained\nhealth!$"
BattleText_HPFull:
	.string "{DEFENDING_MON}’s\nHP is full!$"
BattleText_RaisedSpDef:
	.string "{STRING 38}’s {STRING 17}\nraised SP. DEF!$"
BattleText_RaisedSpDefLittle:
	.string "{STRING 38}’s {STRING 17}\nraised SP. DEF a little!$"
BattleText_RaisedDefense:
	.string "{STRING 38}’s {STRING 17}\nraised DEFENSE!$"
BattleText_RaisedDefenseLittle:
	.string "{STRING 38}’s {STRING 17}\nraised DEFENSE a little!$"
BattleText_CoveredVeil:
	.string "{STRING 38} is covered\nby a veil!$"
BattleText_SafeguardActive:
	.string "{DEFENDING_MON} is protected\nby SAFEGUARD!$"
BattleText_SafeguardFaded:
	.string "{STRING 40}’s SAFEGUARD\nfaded!$"
BattleText_WentToSleep:
	.string "{ATTACKING_MON} went\nto sleep!$"
BattleText_SpeltHealthy:
	.string "{ATTACKING_MON} slept and\nbecame healthy!$"
BattleText_WhipWhirlwind:
	.string "{ATTACKING_MON} whipped\nup a whirlwind!$"
BattleText_TookSunlight:
	.string "{ATTACKING_MON} took\nin sunlight!$"
BattleText_LoweredHead:
	.string "{ATTACKING_MON} lowered\nits head!$"
BattleText_IsGlowing:
	.string "{ATTACKING_MON} is glowing!$"
BattleText_FlewHigh:
	.string "{ATTACKING_MON} flew\nup high!$"
BattleText_DugHole:
	.string "{ATTACKING_MON} dug a hole!$"
BattleText_HidUnderwater:
	.string "{ATTACKING_MON} hid\nunderwater!$"
BattleText_SprangUp:
	.string "{ATTACKING_MON} sprang up!$"
BattleText_SqueezedBind:
	.string "{DEFENDING_MON} was squeezed by\n{ATTACKING_MON}’s BIND!$"
BattleText_TrappedVortex:
	.string "{DEFENDING_MON} was trapped\nin the vortex!$"
BattleText_SandTombTrapped:
	.string "{DEFENDING_MON} was trapped\nby SAND TOMB!$"
BattleText_Wrapped:
	.string "{DEFENDING_MON} was WRAPPED by\n{ATTACKING_MON}!$"
BattleText_Clamped:
	.string "{ATTACKING_MON} CLAMPED\n{DEFENDING_MON}!$"
BattleText_HurtBy:
	.string "{ATTACKING_MON} is hurt\nby {STRING 0}!$"
BattleText_FreedFrom:
	.string "{ATTACKING_MON} was freed\nfrom {STRING 0}!$"
BattleText_KeptGoingCrash:
	.string "{ATTACKING_MON} kept going\nand crashed!$"

gUnknown_083FEE5D:: @ 83FEE5D
BattleText_MistShroud:
	.string "{STRING 38} became\nshrouded in MIST!$"
BattleText_MistProtect:
	.string "{STRING 16} is protected\nby MIST!$"

gUnknown_083FEE92:: @ 83FEE92
BattleText_GetPumped:
	.string "{ATTACKING_MON} is getting\npumped!$"
BattleText_HitRecoil:
	.string "{ATTACKING_MON} is hit\nwith recoil!$"
BattleText_ProtectedItself2:
	.string "{ATTACKING_MON} protected\nitself!$"
BattleText_SandBuffeted:
	.string "{ATTACKING_MON} is buffeted\nby the sandstorm!$"
BattleText_HailStricken:
	.string "{ATTACKING_MON} is stricken\nby HAIL!$"
BattleText_WoreOff:
	.string "{STRING 36}’s {STRING 0}\nwore off!$"
BattleText_WasSeeded:
	.string "{DEFENDING_MON} was seeded!$"
BattleText_EvadedAttack:
	.string "{DEFENDING_MON} evaded\nthe attack!$"
BattleText_HealthSapped:
	.string "{ATTACKING_MON}’s health is\nsapped by LEECH SEED!$"
BattleText_FastAsleep:
	.string "{ATTACKING_MON} is fast\nasleep.$"
BattleText_WokeUp:
	.string "{ATTACKING_MON} woke up!$"
BattleText_UproarAwake:
	.string "But {STRING 16}’s UPROAR\nkept it awake!$"
BattleText_UproarWoke:
	.string "{ATTACKING_MON} woke up\nin the UPROAR!$"
BattleText_UproarCaused:
	.string "{ATTACKING_MON} caused\nan UPROAR!$"
BattleText_UproarMaking:
	.string "{ATTACKING_MON} is making\nan UPROAR!$"
BattleText_CalmedDown:
	.string "{ATTACKING_MON} calmed down.$"
BattleText_UproarCantSleep:
	.string "But {DEFENDING_MON} can’t\nsleep in an UPROAR!$"
BattleText_Stockpiled:
	.string "{ATTACKING_MON} STOCKPILED\n{STRING 0}!$"
BattleText_StockpiledCant:
	.string "{ATTACKING_MON} can’t\nSTOCKPILE any more!$"
BattleText_UproarCantSleep2:
	.string "But {DEFENDING_MON} can’t\nsleep in an UPROAR!$"
BattleText_UproarKeptAwake:
	.string "But the UPROAR kept\n{DEFENDING_MON} awake!$"
BattleText_StayedAwake:
	.string "{DEFENDING_MON} stayed awake\nusing its {STRING 22}!$"
BattleText_StoringEnergy:
	.string "{ATTACKING_MON} is storing\nenergy!$"
BattleText_UnleashedEnergy:
	.string "{ATTACKING_MON} unleashed\nenergy!$"
BattleText_FatigueConfuse:
	.string "{ATTACKING_MON} became\nconfused out of fatigue!$"
BattleText_PickedUpYen:
	.string "{STRING 32} picked up\n¥{STRING 0}!\p$"
BattleText_Unaffected:
	.string "{DEFENDING_MON} is\nunaffected!$"
BattleText_Transformed:
	.string "{ATTACKING_MON} transformed\ninto {STRING 0}!$"
BattleText_SubMade:
	.string "{ATTACKING_MON} made\na SUBSTITUTE!$"
BattleText_SubAlready:
	.string "{ATTACKING_MON} already\nhas a SUBSTITUTE!$"
BattleText_SubTookDamage:
	.string "The SUBSTITUTE took damage\nfor {DEFENDING_MON}!\p$"
BattleText_SubFaded:
	.string "{DEFENDING_MON}’s\nSUBSTITUTE faded!\p$"
BattleText_MustRecharge:
	.string "{ATTACKING_MON} must\nrecharge!$"
BattleText_RageBuilding:
	.string "{DEFENDING_MON}’s RAGE\nis building!$"
BattleText_MoveWasDisabled:
	.string "{DEFENDING_MON}’s {STRING 0}\nwas disabled!$"
BattleText_DisabledNoMore:
	.string "{ATTACKING_MON} is disabled\nno more!$"
BattleText_EncoreGot:
	.string "{DEFENDING_MON} got\nan ENCORE!$"
BattleText_EncoreEnded:
	.string "{ATTACKING_MON}’s ENCORE\nended!$"
BattleText_TookAim:
	.string "{ATTACKING_MON} took aim\nat {DEFENDING_MON}!$"
BattleText_SketchedMove:
	.string "{ATTACKING_MON} SKETCHED\n{STRING 0}!$"
BattleText_DestinyBondTake:
	.string "{ATTACKING_MON} is trying\nto take its foe with it!$"
BattleText_DestinyBondTaken:
	.string "{DEFENDING_MON} took\n{ATTACKING_MON} with it!$"
BattleText_ReducedBy:
	.string "Reduced {DEFENDING_MON}’s\n{STRING 0} by {STRING 1}!$"
BattleText_StoleSomething:
	.string "{ATTACKING_MON} stole\n{DEFENDING_MON}’s {STRING 19}!$"
BattleText_CantEscapeNow:
	.string "{DEFENDING_MON} can’t\nescape now!$"
BattleText_NightmareStart:
	.string "{DEFENDING_MON} fell into\na NIGHTMARE!$"
BattleText_NightmareLock:
	.string "{ATTACKING_MON} is locked\nin a NIGHTMARE!$"
BattleText_CurseLay:
	.string "{ATTACKING_MON} cut its own HP\nand laid a CURSE on\l{DEFENDING_MON}!$"
BattleText_CurseAfflict:
	.string "{ATTACKING_MON} is afflicted\nby the CURSE!$"
BattleText_SpikesScattered:
	.string "{STRING 37} POKéMON team had SPIKES\nscattered around it!$"
BattleText_SpikesHurt:
	.string "{STRING 16} is hurt\nby SPIKES!$"
BattleText_IdentifiedPoke:
	.string "{ATTACKING_MON} identified\n{DEFENDING_MON}!$"
BattleText_PerishSongFell:
	.string "{ATTACKING_MON}’s PERISH count\nfell to {STRING 0}!$"
BattleText_BracedItself:
	.string "{ATTACKING_MON} braced\nitself!$"
BattleText_EnduredHit:
	.string "{DEFENDING_MON} ENDURED\nthe hit!$"
BattleText_MagnitudeCount:
	.string "MAGNITUDE {STRING 0}!$"
BattleText_CutHPMaxATK:
	.string "{ATTACKING_MON} cut its own HP\nand maximized ATTACK!$"
BattleText_CopyStatChanges:
	.string "{ATTACKING_MON} copied\n{DEFENDING_MON}’s stat changes!$"
BattleText_GotFreeFrom:
	.string "{ATTACKING_MON} got free of\n{DEFENDING_MON}’s {STRING 0}!$"
BattleText_LeechShed:
	.string "{ATTACKING_MON} shed\nLEECH SEED!$"
BattleText_SpikesBlownAway:
	.string "{ATTACKING_MON} blew away\nSPIKES!$"
BattleText_FledBattle:
	.string "{ATTACKING_MON} fled from\nbattle!$"
BattleText_ForesawAttack:
	.string "{ATTACKING_MON} foresaw\nan attack!$"
BattleText_TookAttack:
	.string "{DEFENDING_MON} took\n{STRING 0}’s attack!$"
BattleText_ChoseDestiny:
	.string "{ATTACKING_MON} chose\n{STRING 17} as its destiny!$"
BattleText_PokeAttack:
	.string "{STRING 0}’s attack!$"
BattleText_CenterAttention:
	.string "{ATTACKING_MON} became the\ncenter of attention!$"
BattleText_ChargingPower:
	.string "{ATTACKING_MON} began\ncharging power!$"
BattleText_NaturePower:
	.string "NATURE POWER turned into\n{STRING 17}!$"
BattleText_StatusNormal:
	.string "{ATTACKING_MON}’s status\nreturned to normal!$"
BattleText_TormentSubject:
	.string "{DEFENDING_MON} was subjected\nto TORMENT!$"
BattleText_TightenFocus:
	.string "{ATTACKING_MON} is tightening\nits focus!$"
BattleText_TauntFell:
	.string "{DEFENDING_MON} fell for\nthe TAUNT!$"
BattleText_ReadyToHelp:
	.string "{ATTACKING_MON} is ready to\nhelp {DEFENDING_MON}!$"
BattleText_SwitchedItems:
	.string "{ATTACKING_MON} switched\nitems with its opponent!$"
BattleText_Obtained1:
	.string "{ATTACKING_MON} obtained\n{STRING 0}.$"
BattleText_Obtained2:
	.string "{DEFENDING_MON} obtained\n{STRING 1}.$"
BattleText_Obtained3:
	.string "{ATTACKING_MON} obtained\n{STRING 0}.\p{DEFENDING_MON} obtained\n{STRING 1}.$"
BattleText_CopiedObject:
	.string "{ATTACKING_MON} copied\n{DEFENDING_MON}’s {STRING 22}!$"
BattleText_WishMade:
	.string "{ATTACKING_MON} made a WISH!$"
BattleText_WishTrue:
	.string "{STRING 0}’s WISH\ncame true!$"
BattleText_PlantedRoots:
	.string "{ATTACKING_MON} planted its roots!$"
BattleText_AbsorbNutrients:
	.string "{ATTACKING_MON} absorbed\nnutrients with its roots!$"
BattleText_AnchoredItself:
	.string "{DEFENDING_MON} anchored\nitself with its roots!$"
BattleText_DrowsyMade:
	.string "{ATTACKING_MON} made\n{DEFENDING_MON} drowsy!$"
BattleText_KnockedOffItem:
	.string "{ATTACKING_MON} knocked off\n{DEFENDING_MON}’s {STRING 19}!$"
BattleText_AbilitySwap:
	.string "{ATTACKING_MON} swapped abilities\nwith its opponent!$"
BattleText_SealedMove:
	.string "{ATTACKING_MON} sealed the\nopponent’s move(s)!$"
BattleText_GrudgeBear:
	.string "{ATTACKING_MON} wants the\nopponent to bear a GRUDGE!$"
BattleText_GrudgeLosePP:
	.string "{ATTACKING_MON}’s {STRING 0}\nlost all its PP due to\lthe GRUDGE!$"
BattleText_ShroudedItself:
	.string "{ATTACKING_MON} shrouded\nitself in {STRING 17}!$"
BattleText_MagicCoatBounce:
	.string "{ATTACKING_MON}’s {STRING 17}\nwas bounced back by MAGIC COAT!$"
BattleText_AwaitMove:
	.string "{ATTACKING_MON} awaits its foe\nto make a move!$"
BattleText_SnatchedMove:
	.string "{DEFENDING_MON} SNATCHED\n{STRING 16}’s move!$"
BattleText_ElecWeakened:
	.string "Electricity’s power was\nweakened!$"
BattleText_FireWeakened:
	.string "Fire’s power was\nweakened!$"
BattleText_FoundOne:
	.string "{ATTACKING_MON} found\none {STRING 19}!$"
BattleText_SoothingAroma:
	.string "A soothing aroma wafted\nthrough the area!$"
BattleText_CantUseItems:
	.string "Items can’t be used now.{PAUSE 64}$"
BattleText_UnknownString2:
	.string "For {STRING 16},\n{STRING 19} {STRING 0}$"
BattleText_HustleUse:
	.string "{STRING 16} used\n{STRING 19} to hustle!$"
BattleText_LostFocus:
	.string "{ATTACKING_MON} lost its\nfocus and couldn’t move!$"
BattleText_DraggedOut:
	.string "{DEFENDING_MON} was\ndragged out!\p$"
BattleText_BrokeWall:
	.string "The wall shattered!$"
BattleText_NoEffect:
	.string "But it had no effect!$"
BattleText_NoMovesLeft:
	.string "{STRING 15} has no\nmoves left!\p$"
BattleText_MoveIsDisabled:
	.string "{STRING 15}’s {STRING 17}\nis disabled!\p$"
BattleText_TormentNoUse:
	.string "{STRING 15} can’t use the same\nmove twice in a row due to the TORMENT!\p$"
BattleText_TauntNoUse:
	.string "{STRING 15} can’t use\n{STRING 17} after the TAUNT!\p$"
BattleText_SealedNoUse:
	.string "{STRING 15} can’t use the\nsealed {STRING 17}!\p$"
BattleText_RainMade:
	.string "{STRING 16}’s {STRING 23}\nmade it rain!$"
BattleText_SpeedRisen:
	.string "{STRING 16}’s {STRING 23}\nraised its SPEED!$"
BattleText_ProtectedBy:
	.string "{DEFENDING_MON} was protected\nby {STRING 22}!$"
BattleText_PreventedBy:
	.string "{DEFENDING_MON}’s {STRING 22}\nprevents {ATTACKING_MON}\lfrom using {STRING 17}!$"
BattleText_HPRestoredUsing:
	.string "{DEFENDING_MON} restored HP\nusing its {STRING 22}!$"
BattleText_MadeUseless:
	.string "{DEFENDING_MON}’s {STRING 22}\nmade {STRING 17} useless!$"
BattleText_MadeType:
	.string "{DEFENDING_MON}’s {STRING 22}\nmade it the {STRING 0} type!$"
BattleText_PreventedPara:
	.string "{STRING 14}’s {STRING 22}\nprevents paralysis!$"
BattleText_PreventedRomance:
	.string "{DEFENDING_MON}’s {STRING 22}\nprevents romance!$"
BattleText_PreventedPoison:
	.string "{STRING 14}’s {STRING 22}\nprevents poisoning!$"
BattleText_PreventedConfusion:
	.string "{DEFENDING_MON}’s {STRING 22}\nprevents confusion!$"
BattleText_RaisedFirePower:
	.string "{DEFENDING_MON}’s {STRING 22}\nraised its FIRE power!$"
BattleText_AnchorsItself:
	.string "{DEFENDING_MON} anchors\nitself with {STRING 22}!$"
BattleText_CutsAttack:
	.string "{STRING 16}’s {STRING 23}\ncuts {DEFENDING_MON}’s ATTACK!$"
BattleText_PreventedStatLoss:
	.string "{STRING 16}’s {STRING 23}\nprevents stat loss!$"
BattleText_HurtOther:
	.string "{DEFENDING_MON}’s {STRING 22}\nhurt {ATTACKING_MON}!$"
BattleText_Traced:
	.string "{STRING 16} TRACED\n{STRING 0}’s {STRING 1}!$"
BattleText_PreventedBurn:
	.string "{STRING 14}’s {STRING 24}\nprevents burns!$"
BattleText_BlocksOther:
	.string "{DEFENDING_MON}’s {STRING 22}\nblocks {STRING 17}!$"
BattleText_BlocksOther2:
	.string "{STRING 16}’s {STRING 23}\nblocks {STRING 17}!$"
BattleText_RestoredHPByItem:
	.string "{ATTACKING_MON}’s {STRING 21}\nrestored some HP!$"
BattleText_WhipSandstorm:
	.string "{STRING 16}’s {STRING 23}\nwhipped up a sandstorm!$"
BattleText_SunIntensified:
	.string "{STRING 16}’s {STRING 23}\nintensified the sun’s rays!$"
BattleText_PreventedLoss:
	.string "{STRING 16}’s {STRING 23}\nprevents {STRING 0} loss!$"
BattleText_InfatuatedPoke:
	.string "{DEFENDING_MON}’s {STRING 22}\ninfatuated {ATTACKING_MON}!$"
BattleText_MadeIneffective:
	.string "{DEFENDING_MON}’s {STRING 22}\nmade {STRING 17} ineffective!$"
BattleText_CuredProblem:
	.string "{STRING 16}’s {STRING 23}\ncured its {STRING 0} problem!$"
BattleText_OozeSuckup:
	.string "It sucked up the\nLIQUID OOZE!$"
BattleText_Transformed2:
	.string "{STRING 16} transformed!$"
BattleText_TookAttack2:
	.string "{DEFENDING_MON}’s {STRING 22}\ntook the attack!$"

gUnknown_083FFCCA:: @ 83FFCCA
BattleText_PreventedSwitch:
	.string "{STRING 0}’s {STRING 20}\nprevents switching!\p$"
BattleText_PreventedOther:
	.string "{DEFENDING_MON}’s {STRING 22}\nprevented {STRING 16}’s\l{STRING 0} from working!$"
BattleText_MadeIneffective2:
	.string "{STRING 16}’s {STRING 23}\nmade it ineffective!$"
BattleText_PreventedFlinching:
	.string "{STRING 14}’s {STRING 24}\nprevents flinching!$"
BattleText_PreventedOther2:
	.string "{ATTACKING_MON}’s {STRING 21}\nprevents {DEFENDING_MON}’s\l{STRING 22} from working!$"
BattleText_CuredOfProblem:
	.string "{STRING 16}’s {STRING 23}\ncured its {STRING 0} problem!$"
BattleText_NoEffectOn:
	.string "{STRING 16}’s {STRING 23}\nhad no effect on {STRING 14}!$"
BattleText_Sharply:
	.string "sharply $"

gUnknown_083FFDB3:: @ 83FFDB3
BattleText_Rose:
	.string "rose!$"
BattleText_Harshly:
	.string "harshly $"
BattleText_Fell:
	.string "fell!$"
BattleText_UnknownString7:
	.string "{ATTACKING_MON}’s {STRING 0}\n{STRING 1}$"

gUnknown_083FFDD3:: @ 83FFDD3
BattleText_UnknownString3:
	.string "{DEFENDING_MON}’s {STRING 0}\n{STRING 1}$"
BattleText_UnknownString4:
	.string "Using {STRING 19}, the {STRING 0}\nof {STRING 16} {STRING 1}$"
BattleText_UnknownString5:
	.string "{ATTACKING_MON}’s {STRING 0}\n{STRING 1}$"
BattleText_UnknownString6:
	.string "{DEFENDING_MON}’s {STRING 0}\n{STRING 1}$"
BattleText_StatNoHigher:
	.string "{ATTACKING_MON}’s stats won’t\ngo any higher!$"
BattleText_StatNoLower:
	.string "{DEFENDING_MON}’s stats won’t\ngo any lower!$"
BattleText_Critical:
	.string "A critical hit!$"
BattleText_GrandSlam:
	.string "It’s a one-hit KO!$"
BattleText_MoveForget123:
	.string "{PAUSE 32}1, {PAUSE 15}2 and...{PAUSE 15} ...{PAUSE 15} ...{PAUSE 15}\n{PAUSE 15}{PLAY_SE SE_KON}Poof!\p$"
BattleText_MoveForgetAnd:
	.string "And...\p$"
BattleText_CantForgetHM:
	.string "HM moves can’t be\nforgotten now.\p$"
BattleText_NotEffective:
	.string "It’s not very effective...$"
BattleText_SuperEffective:
	.string "It’s super effective!$"

gUnknown_083FFEFC:: @ 83FFEFC
BattleText_GotAwaySafely:
	.string "{PLAY_SE SE_NIGERU}Got away safely!\p$"
BattleText_FledUsingItem:
	.string "{PLAY_SE SE_NIGERU}{ATTACKING_MON} fled\nusing its {STRING 19}!\p$"
BattleText_FledUsingOther:
	.string "{PLAY_SE SE_NIGERU}{ATTACKING_MON} fled\nusing {STRING 21}!\p$"
BattleText_FledWild:
	.string "{PLAY_SE SE_NIGERU}Wild {STRING 0} fled!$"

gUnknown_083FFF56:: @ 83FFF56
BattleText_PlayerDefeatedTrainer:
	.string "Player defeated\n{STRING 29}!$"

gUnknown_083FFF6A:: @ 83FFF6A
BattleText_PlayerDefeatedTrainers:
	.string "Player beat {STRING 30}\nand {STRING 29}!$"

gUnknown_083FFF81:: @ 83FFF81
BattleText_PlayerLostTrainer:
	.string "Player lost against\n{STRING 29}!$"

gUnknown_083FFF99:: @ 83FFF99
BattleText_PlayerLostTrainers:
	.string "Player lost to {STRING 30}\nand {STRING 29}!$"

gUnknown_083FFFB3:: @ 83FFFB3
BattleText_PlayerTiedTrainer:
	.string "Player tied against\n{STRING 29}!$"

gUnknown_083FFFCB:: @ 83FFFCB
BattleText_PlayerTiedTrainers:
	.string "Player tied against {STRING 30}\nand {STRING 29}!$"

gUnknown_083FFFEA:: @ 83FFFEA
BattleText_FledSingle:
	.string "{PLAY_SE SE_NIGERU}{STRING 29} fled!$"

gUnknown_083FFFF7:: @ 83FFFF7
BattleText_FledDouble:
	.string "{PLAY_SE SE_NIGERU}{STRING 29} and\n{STRING 30} fled!$"
BattleText_NoRunning:
	.string "No! There’s no running\nfrom a TRAINER battle!\p$"
BattleText_CantEscape2:
	.string "Can’t escape!\p$"
BattleText_BirchDontLeaveMe:
	.string "PROF. BIRCH: D-don’t leave\nme here like this!\p$"
BattleText_Nothing:
	.string "But nothing happened!$"
BattleText_Failed:
	.string "But it failed!$"
BattleText_HurtItself:
	.string "It hurt itself in its\nconfusion!$"
BattleText_MirrorFail:
	.string "The MIRROR MOVE failed!$"
BattleText_RainStart:
	.string "It started to rain!$"
BattleText_PourStart:
	.string "A downpour started!$"
BattleText_RainCont1:
	.string "Rain continues to fall.$"
BattleText_PourCont:
	.string "The downpour continues.$"
BattleText_RainStop:
	.string "The rain stopped.$"
BattleText_SandBrewed:
	.string "A sandstorm brewed!$"
BattleText_SandRages:
	.string "The sandstorm rages.$"
BattleText_SandSubsided:
	.string "The sandstorm subsided.$"
BattleText_SunBright:
	.string "The sunlight got bright!$"
BattleText_SunStrong:
	.string "The sunlight is strong.$"
BattleText_SunFaded:
	.string "The sunlight faded.$"
BattleText_HailStart:
	.string "It started to hail!$"
BattleText_HailCont:
	.string "Hail continues to fall.$"
BattleText_HailStop:
	.string "The hail  stopped.$"
BattleText_SpitUpFail:
	.string "But it failed to SPIT UP\na thing!$"
BattleText_SwallowFail:
	.string "But it failed to SWALLOW\na thing!$"
BattleText_WindHeatWave:
	.string "The wind turned into a\nHEAT WAVE!$"
BattleText_StatElim:
	.string "All stat changes were\neliminated!$"
BattleText_CoinScatter:
	.string "Coins scattered everywhere!$"
BattleText_SubWeak:
	.string "It was too weak to make\na SUBSTITUTE!$"
BattleText_PainSplit:
	.string "The battlers shared\ntheir pain!$"
BattleText_BellChime:
	.string "A bell chimed!$"
BattleText_PerishSong:
	.string "All affected POKéMON will\nfaint in 3 turns!$"
BattleText_NoPP1:
	.string "There’s no PP left for\nthis move!\p$"
BattleText_NoPP2:
	.string "But there was no PP left\nfor the move!$"
BattleText_IgnoredOrdersSLP:
	.string "{ATTACKING_MON} ignored\norders while asleep!$"
BattleText_IgnoredOrders:
	.string "{ATTACKING_MON} ignored\norders!$"
BattleText_BeganNap:
	.string "{ATTACKING_MON} began to nap!$"
BattleText_LoafingAround:
	.string "{ATTACKING_MON} is\nloafing around!$"
BattleText_WontObey:
	.string "{ATTACKING_MON} won’t\nobey!$"
BattleText_TurnedAway:
	.string "{ATTACKING_MON} turned away!$"
BattleText_NotNotice:
	.string "{ATTACKING_MON} pretended\nto not notice!$"
BattleText_WillSwitch:
	.string "{STRING 25} {STRING 26} is\nabout to use {STRING 1}.\pWill {STRING 32} change\nPOKéMON?$"
BattleText_LearnedMove2:
	.string "{ATTACKING_MON} learned\n{STRING 0}!$"
BattleText_PlayerDefeatedTrainer2:
	.string "Player defeated\n{STRING 25} {STRING 26}!\p$"
BattleText_CreptCloser:
	.string "{STRING 32} crept closer to\n{STRING 3}!$"
BattleText_CantGetCloser:
	.string "{STRING 32} can’t get any closer!$"
BattleText_WatchingCarefully:
	.string "{STRING 3} is watching\ncarefully!$"
BattleText_CuriousAbout:
	.string "{STRING 3} is curious about\nthe {STRING 0}!$"
BattleText_EnthralledBy:
	.string "{STRING 3} is enthralled by\nthe {STRING 0}!$"
BattleText_IgnoredThing:
	.string "{STRING 3} completely ignored\nthe {STRING 0}!$"
BattleText_ThrewBlock:
	.string "{STRING 32} threw a {POKEBLOCK}\nat the {STRING 3}!$"
BattleText_SafariOver:
	.string "{PLAY_SE SE_PINPON}ANNOUNCER: You’re out of\nSAFARI BALLS! Game over!\p$"

gUnknown_08400555:: @ 8400555
BattleText_WildAppeared1:
	.string "Wild {STRING 3} appeared!\p$"

gUnknown_08400568:: @ 8400568
BattleText_WildAppeared2:
	.string "Wild {STRING 3} appeared!\p$"

gUnknown_0840057B:: @ 840057B
BattleText_WildAppeared3:
	.string "Wild {STRING 3} appeared!{PAUSE 127}$"

gUnknown_08400590:: @ 8400590
BattleText_WildDoubleAppeared:
	.string "Wild {STRING 5} and\n{STRING 3} appeared!\p$"

gUnknown_084005AA:: @ 84005AA
BattleText_SingleWantToBattle1:
	.string "{STRING 25} {STRING 26}\nwould like to battle!\p$"

gUnknown_084005C7:: @ 84005C7
BattleText_SingleWantToBattle2:
	.string "{STRING 29}\nwants to battle!$"

gUnknown_084005DB:: @ 84005DB
BattleText_DoubleWantToBattle:
	.string "{STRING 29} and {STRING 30}\nwant to battle!$"

gUnknown_084005F5:: @ 84005F5
BattleText_SentOutSingle1:
	.string "{STRING 25} {STRING 26} sent\nout {STRING 3}!$"

gUnknown_08400608:: @ 8400608
BattleText_SentOutDouble1:
	.string "{STRING 25} {STRING 26} sent\nout {STRING 3} and {STRING 5}!$"

gUnknown_08400622:: @ 8400622
BattleText_SentOutSingle2:
	.string "{STRING 25} {STRING 26} sent\nout {STRING 0}!$"

gUnknown_08400635:: @ 8400635
BattleText_SentOutSingle3:
	.string "{STRING 29} sent\nout {STRING 3}!$"

gUnknown_08400645:: @ 8400645
BattleText_SentOutDouble2:
	.string "{STRING 29} sent out\n{STRING 3} and {STRING 5}!$"

gUnknown_0840065C:: @ 840065C
BattleText_SentOutDouble3:
	.string "{STRING 29} sent out\n{STRING 7}!\p{STRING 30} sent out\n{STRING 9}!$"

gUnknown_0840067C:: @ 840067C
BattleText_SentOutSingle4:
	.string "{STRING 29} sent out\n{STRING 0}!$"

gUnknown_0840068C:: @ 840068C
BattleText_SentOutSingle5:
	.string "{STRING 31} sent out\n{STRING 0}!$"

gUnknown_0840069C:: @ 840069C
BattleText_SentOutSingle6:
	.string "Go! {STRING 2}!$"

gUnknown_084006A4:: @ 84006A4
BattleText_SentOutDouble4:
	.string "Go! {STRING 2} and\n{STRING 4}!$"

gUnknown_084006B3:: @ 84006B3
BattleText_SentOutSingle7:
	.string "Go! {STRING 0}!$"

gUnknown_084006BB:: @ 84006BB
BattleText_SentOutSingle8:
	.string "Do it! {STRING 0}!$"

gUnknown_084006C6:: @ 84006C6
BattleText_SentOutSingle9:
	.string "Go for it, {STRING 0}!$"

gUnknown_084006D5:: @ 84006D5
BattleText_SentOutSingle10:
	.string "Your foe’s weak!\nGet’m, {STRING 0}!$"

gUnknown_084006F1:: @ 84006F1
BattleText_SentOutSingle11:
	.string "{STRING 28} sent out\n{STRING 8}!\pGo! {STRING 6}!$"

gUnknown_08400709:: @ 8400709
BattleText_ComeBackSingle1:
	.string "{STRING 0}, that’s enough!\nCome back!$"

gUnknown_08400727:: @ 8400727
BattleText_ComeBackSingle2:
	.string "{STRING 0}, come back!$"

gUnknown_08400736:: @ 8400736
BattleText_ComeBackSingle3:
	.string "{STRING 0}, OK!\nCome back!$"

gUnknown_08400749:: @ 8400749
BattleText_ComeBackSingle4:
	.string "{STRING 0}, good!\nCome back!$"

gUnknown_0840075E:: @ 840075E
BattleText_WithdrewPoke1:
	.string "{STRING 25} {STRING 26}\nwithdrew {STRING 0}!$"

gUnknown_08400771:: @ 8400771
BattleText_WithdrewPoke2:
	.string "{STRING 29} withdrew\n{STRING 0}!$"

gUnknown_08400781:: @ 8400781
BattleText_WithdrewPoke3:
	.string "{STRING 31} withdrew\n{STRING 0}!$"

gUnknown_08400791:: @ 8400791
BattleText_Wild:
	.string "Wild $"

gUnknown_08400797:: @ 8400797
BattleText_Foe:
	.string "Foe $"

gUnknown_0840079C:: @ 840079C
BattleText_Foe2:
	.string "Foe $"

gUnknown_084007A1:: @ 84007A1
BattleText_Ally:
	.string "Ally $"

gUnknown_084007A7:: @ 84007A7
BattleText_Foe3:
	.string "Foe $"

gUnknown_084007AC:: @ 84007AC
BattleText_Ally2:
	.string "Ally $"

gUnknown_084007B2:: @ 84007B2
BattleText_Foe4:
	.string "Foe $"

gUnknown_084007B7:: @ 84007B7
BattleText_Ally3:
	.string "Ally $"

gUnknown_084007BD:: @ 84007BD
BattleText_OpponentUsedMove:
	.string "{ATTACKING_MON} used\n{STRING 1}$"

gUnknown_084007C8:: @ 84007C8
BattleText_Exclamation2: @ out of order but whatever
	.string "!$"

gUnknown_084007CA:: @ 84007CA
BattleText_Exclamation3:
	.string "!$"

gUnknown_084007CC:: @ 84007CC
BattleText_Exclamation4:
	.string "!$"

gUnknown_084007CE:: @ 84007CE
BattleText_Exclamation5:
	.string "!$"

gUnknown_084007D0:: @ 84007D0
BattleText_Exclamation:
	.string "!$"
BattleStatText_HP:
	.string "HP$"
BattleStatText_Attack:
	.string "ATTACK$"
BattleStatText_Defense:
	.string "DEFENSE$"
BattleStatText_Speed:
	.string "SPEED$"
BattleStatText_SpAtk:
	.string "SP. ATK$"
BattleStatText_SpDef:
	.string "SP. DEF$"
BattleStatText_Accuracy:
	.string "accuracy$"
BattleStatText_Evasion:
	.string "evasiveness$"
ContestStatText_TooSpicy:
	.string "was too spicy!$"
ContestStatText_TooDry:
	.string "was too dry!$"
ContestStatText_TooSweet:
	.string "was too sweet!$"
ContestStatText_TooBitter:
	.string "was too bitter!$"
ContestStatText_TooSour:
	.string "was too sour!$"
BattleText_Used1:
	.string "{STRING 32} used\n{STRING 19}!$"
BattleText_TutorialUsed:
	.string "WALLY used\n{STRING 19}!$"
BattleText_Used2:
	.string "{STRING 25} {STRING 26}\nused {STRING 19}!$"
BattleText_BlockBall:
	.string "The TRAINER blocked the BALL!$"
BattleText_DontBeAThief:
	.string "Don’t be a thief!$"
BattleText_DodgeBall:
	.string "It dodged the thrown BALL!\nThis POKéMON can’t be caught!$"
BattleText_MissPoke:
	.string "You missed the POKéMON!$"
BattleText_BallBrokeOhNo:
	.string "Oh, no!\nThe POKéMON broke free!$"
BattleText_BallBrokeAppeared:
	.string "Aww!\nIt appeared to be caught!$"
BattleText_BallBrokeAlmost:
	.string "Aargh!\nAlmost had it!$"
BattleText_BallBrokeSoClose:
	.string "Shoot!\nIt was so close, too!$"
BattleText_BallCaught1:
	.string "Gotcha!\n{STRING 3} was caught!{UNKNOWN_A}{PLAY_BGM BGM_KACHI22}\p$"
BattleText_BallCaught2:
	.string "Gotcha!\n{STRING 3} was caught!{UNKNOWN_A}{PLAY_BGM BGM_KACHI22}{PAUSE 127}$"
BattleText_GiveNickname:
	.string "Give a nickname to the\ncaptured {STRING 3}?$"
BattleText_SentToPC:
	.string "{STRING 3} was sent to\n{STRING 35} PC.$"

gUnknown_084009ED:: @ 84009ED
BattleText_Someone:
	.string "someone’s$"

gUnknown_084009F7:: @ 84009F7
BattleText_Lanette:
	.string "LANETTE’s$"
BattleText_AddedToDex:
	.string "{STRING 3}’s data was\nadded to the POKéDEX.\p$"
BattleText_Raining:
	.string "It is raining.$"
BattleText_Sandstorm:
	.string "A sandstorm is raging.$"
BattleText_BoxFull:
	.string "The BOX is full!\nYou can’t catch any more!\p$"

gUnknown_08400A78:: @ 8400A78
BattleText_EnigmaBerry:
	.string "ENIGMA BERRY$"

gUnknown_08400A85:: @ 8400A85
BattleText_Berry:
	.string " BERRY$"
BattleText_CuredParalysis:
	.string "{STRING 16}’s {STRING 19}\ncured paralysis!$"
BattleText_CuredPoison:
	.string "{STRING 16}’s {STRING 19}\ncured poison!$"
BattleText_CuredBurn:
	.string "{STRING 16}’s {STRING 19}\nhealed its burn!$"
BattleText_CuredFreeze:
	.string "{STRING 16}’s {STRING 19}\ndefrosted it!$"
BattleText_CuredSleep:
	.string "{STRING 16}’s {STRING 19}\nwoke it from its sleep!$"
BattleText_CuredConfusion:
	.string "{STRING 16}’s {STRING 19}\nsnapped it out of confusion!$"
BattleText_CuredStatus:
	.string "{STRING 16}’s {STRING 19}\ncured its {STRING 0} problem!$"
BattleText_NormalizedStatus:
	.string "{STRING 16}’s {STRING 19}\nnormalized its status!$"
BattleText_RestoredHealth:
	.string "{STRING 16}’s {STRING 19}\nrestored health!$"
BattleText_RestoredPP:
	.string "{STRING 16}’s {STRING 19}\nrestored {STRING 0}’s PP!$"
BattleText_RestoredStatus:
	.string "{STRING 16}’s {STRING 19}\nrestored its status!$"
BattleText_RestoredHPLittle:
	.string "{STRING 16}’s {STRING 19}\nrestored its HP a little!$"
BattleText_ChoiceBand:
	.string "{STRING 19} allows the\nuse of only {STRING 17}!\p$"
BattleText_FocusSash:
	.string "{DEFENDING_MON} hung on\nusing its {STRING 19}!$"
BattleText_Terminator2:
	.string "$"
BattleText_WallyBall:
	.string "You throw a BALL now, right?\nI... I’ll do my best!$"

gUnknown_08400C4A:: @ 8400C4A
BattleText_StartEvo:
	.string "What?\n{STRING 2} is evolving!$"

gUnknown_08400C60:: @ 8400C60
BattleText_FinishEvo:
	.string "Congratulations! Your {STRING 2}\nevolved into {STRING 3}!{UNKNOWN_A}\p$"

gUnknown_08400C8D:: @ 8400C8D
BattleText_StopEvo:
	.string "Huh? {STRING 2}\nstopped evolving!\p$"

gUnknown_08400CA8:: @ 8400CA8
BattleText_OtherMenu:
	.string "What should\n{STRING 15} do?$"

gUnknown_08400CBB:: @ 8400CBB
BattleText_PlayerMenu:
	.string "What will\n{STRING 32} do?$"

gUnknown_08400CCC:: @ 8400CCC
BattleText_WallyMenu:
	.string "What will\nWALLY do?$"

gUnknown_08400CE0:: @ 8400CE0
BattleText_LinkStandby:
	.string "{PAUSE 16}Link standby...$"

gUnknown_08400CF3:: @ 8400CF3
BattleText_MenuOptions:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}FIGHT{CLEAR_TO 0x2E}BAG\nPOKéMON{CLEAR_TO 0x2E}RUN$"

gUnknown_08400D15:: @ 8400D15
BattleText_MenuOptionsSafari:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}BALL{CLEAR_TO 0x2E}{POKEBLOCK}\nGO NEAR{CLEAR_TO 0x2E}RUN$"

gUnknown_08400D38:: @ 8400D38
BattleText_PP:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}PP\nTYPE/$"

gUnknown_08400D49:: @ 8400D49
BattleText_Format: @ cant think of a better name
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}$"

gUnknown_08400D52:: @ 8400D52
BattleText_ForgetMove:
	.string "{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}{PALETTE 5}Which move should\nbe forgotten?$"

gUnknown_08400D7A:: @ 8400D7A
BattleText_YesNo:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Yes\nNo$"

gUnknown_08400D89:: @ 8400D89
BattleText_SwitchWhich:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Switch\nwhich?$"

gUnknown_08400D9F:: @ 8400D9F
BattleText_Format2:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}$"
BattleText_RightArrow:
	.string "{RIGHT_ARROW}$"

gUnknown_08400DAA:: @ 8400DAA
BattleText_Plus:
	.string "+$"

gUnknown_08400DAC:: @ 8400DAC
@ someone improve the formatting of this please
BattleText_Dash:
	.string "-$"
BattleText_HP:
	.string "HP     $"
BattleText_Attack:
	.string "ATTACK $"
BattleText_Defense:
	.string "DEFENSE$"
BattleText_SpAtk:
	.string "SP. ATK$"
BattleText_SpDef:
	.string "SP. DEF$"

gUnknown_08400DD6:: @ 8400DD6
BattleText_SafariBalls:
	.string "{HIGHLIGHT RED}SAFARI BALLS$"

gUnknown_08400DE6:: @ 8400DE6
BattleText_SafariBallsLeft:
	.string "{HIGHLIGHT RED}Left: $"

gUnknown_08400DF0:: @ 8400DF0
BattleText_HighlightRed:
	.string "{HIGHLIGHT RED}$"
BattleText_Sleep:
	.string "sleep$"
BattleText_PoisonStatus:
	.string "poison$"
BattleText_Burn:
	.string "burn$"
BattleText_Paralysis:
	.string "paralysis$"
BattleText_IceStatus:
	.string "ice$"
BattleText_Confusion:
	.string "confusion$"
BattleText_Love:
	.string "love$"

gUnknown_08400E23:: @ 8400E23
BattleText_Format3:
	.string " and $"

gUnknown_08400E29:: @ 8400E29
BattleText_Format4:
	.string ", $"

gUnknown_08400E2C:: @ 8400E2C
BattleText_Format5:
	.string " $"

gUnknown_08400E2E:: @ 8400E2E
BattleText_Format6:
	.string "\l$"

gUnknown_08400E30:: @ 8400E30
BattleText_Format7:
	.string "\n$"

gUnknown_08400E32:: @ 8400E32
BattleText_Format8:
	.string "are$"

gUnknown_08400E36:: @ 8400E36
BattleText_Format9:
	.string "are$"

gUnknown_08400E3A:: @ 8400E3A
BattleText_BadEGG:
	.string "Bad EGG$"

gUnknown_08400E42:: @ 8400E42
BattleText_Wally:
	.string "WALLY$"

gUnknown_08400E48:: @ 8400E48
BattleText_Win:
	.string "{HIGHLIGHT TRANSPARENT}Win$"

gUnknown_08400E4F:: @ 8400E4F
BattleText_Loss:
	.string "{HIGHLIGHT TRANSPARENT}Loss$"

gUnknown_08400E57:: @ 8400E57
BattleText_Tie:
	.string "{HIGHLIGHT TRANSPARENT}Tie$"

gUnknown_08400E5E:: @ 8400E5E
BattleText_Format10:
	.string " is$"

gUnknown_08400E62:: @ 8400E62
BattleText_Format11:
	.string "’s$"
BattleText_Normal:
	.string "a NORMAL move$"
BattleText_Fighting:
	.string "a FIGHTING move$"
BattleText_Flying:
	.string "a FLYING move$"
BattleText_Poison:
	.string "a POISON move$"
BattleText_Ground:
	.string "a GROUND move$"
BattleText_Rock:
	.string "a ROCK move$"
BattleText_Bug:
	.string "a BUG move$"
BattleText_Ghost:
	.string "a GHOST move$"
BattleText_Steel:
	.string "a STEEL move$"
BattleText_Typeless:
	.string "a ??? move$"
BattleText_Fire:
	.string "a FIRE move$"
BattleText_Water:
	.string "a WATER move$"
BattleText_Grass:
	.string "a GRASS move$"
BattleText_Electric:
	.string "an ELECTRIC move$"
BattleText_Psychic:
	.string "a PSYCHIC move$"
BattleText_Ice:
	.string "an ICE move$"
BattleText_Dragon:
	.string "a DRAGON move$"
BattleText_Dark:
	.string "a DARK move$"

	.align 2
gUnknown_08400F58:: @ 8400F58
	.4byte BattleStatText_HP
	.4byte BattleStatText_Attack
	.4byte BattleStatText_Defense
	.4byte BattleStatText_Speed
	.4byte BattleStatText_SpAtk
	.4byte BattleStatText_SpDef
	.4byte BattleStatText_Accuracy
	.4byte BattleStatText_Evasion

	.align 2
gUnknown_08400F78:: @ 8400F78
	.4byte ContestStatText_TooSpicy
	.4byte ContestStatText_TooDry
	.4byte ContestStatText_TooSweet
	.4byte ContestStatText_TooBitter
	.4byte ContestStatText_TooSour

	.align 2
gUnknown_08400F8C:: @ 8400F8C
	.4byte BattleText_UnknownString
	.4byte BattleText_GainExpPoints
	.4byte BattleText_GrewLevel
	.4byte BattleText_LearnedMove
	.4byte BattleText_TryingToLearnMove
	.4byte BattleText_CantLearnMore
	.4byte BattleText_DeleteMove
	.4byte BattleText_DeletedMove
	.4byte BattleText_StopLearning
	.4byte BattleText_DidNotLearn
	.4byte BattleText_LearnedMove2
	.4byte BattleText_AttackMissed
	.4byte BattleText_ProtectedItself
	.4byte BattleText_StatNoHigher
	.4byte BattleText_AvoidedDamage
	.4byte BattleText_DoesntAffect
	.4byte BattleText_AttackingFainted
	.4byte BattleText_DefendingFainted
	.4byte BattleText_WinningPrize
	.4byte BattleText_OutOfUsablePoke
	.4byte BattleText_WhitedOut
	.4byte BattleText_PreventEscape
	.4byte BattleText_HitMulti
	.4byte BattleText_FellAsleep
	.4byte BattleText_MadeAsleep
	.4byte BattleText_DefendingAsleep
	.4byte BattleText_AttackingAsleep
	.4byte BattleText_WasntAffected
	.4byte BattleText_Poisoned
	.4byte BattleText_Poisoned2
	.4byte BattleText_PoisonHurt
	.4byte BattleText_AlreadyPoisoned
	.4byte BattleText_BadlyPoisoned
	.4byte BattleText_EnergyDrained
	.4byte BattleText_Burned
	.4byte BattleText_Burned2
	.4byte BattleText_BurnHurt
	.4byte BattleText_Frozen
	.4byte BattleText_Frozen2
	.4byte BattleText_FrozenSolid
	.4byte BattleText_DefendingDefrosted
	.4byte BattleText_AttackingDefrosted
	.4byte BattleText_Defrosted
	.4byte BattleText_Paralyzed
	.4byte BattleText_Paralyzed2
	.4byte BattleText_Paralyzed3
	.4byte BattleText_AlreadyParalyzed
	.4byte BattleText_ParalysisHealed
	.4byte BattleText_DreamEaten
	.4byte BattleText_AttackingStatNoHigher
	.4byte BattleText_DefendingStatNoHigher
	.4byte BattleText_StoppedWorking
	.4byte BattleText_StoppedWorking2
	.4byte BattleText_Confused
	.4byte BattleText_ConfusionSnapOut
	.4byte BattleText_BecameConfused
	.4byte BattleText_AlreadyConfused
	.4byte BattleText_FellLove
	.4byte BattleText_InLoveWith
	.4byte BattleText_ImmobilizedBy
	.4byte BattleText_BlownAway
	.4byte BattleText_TypeTransform
	.4byte BattleText_Flinched
	.4byte BattleText_RegainedHealth
	.4byte BattleText_HPFull
	.4byte BattleText_RaisedSpDef
	.4byte BattleText_RaisedDefense
	.4byte BattleText_CoveredVeil
	.4byte BattleText_SafeguardActive
	.4byte BattleText_SafeguardFaded
	.4byte BattleText_WentToSleep
	.4byte BattleText_SpeltHealthy
	.4byte BattleText_WhipWhirlwind
	.4byte BattleText_TookSunlight
	.4byte BattleText_LoweredHead
	.4byte BattleText_IsGlowing
	.4byte BattleText_FlewHigh
	.4byte BattleText_DugHole
	.4byte BattleText_SqueezedBind
	.4byte BattleText_TrappedVortex
	.4byte BattleText_Wrapped
	.4byte BattleText_Clamped
	.4byte BattleText_HurtBy
	.4byte BattleText_FreedFrom
	.4byte BattleText_KeptGoingCrash
	.4byte BattleText_MistShroud
	.4byte BattleText_MistProtect
	.4byte BattleText_GetPumped
	.4byte BattleText_HitRecoil
	.4byte BattleText_ProtectedItself2
	.4byte BattleText_SandBuffeted
	.4byte BattleText_HailStricken
	.4byte BattleText_WasSeeded
	.4byte BattleText_EvadedAttack
	.4byte BattleText_HealthSapped
	.4byte BattleText_FastAsleep
	.4byte BattleText_WokeUp
	.4byte BattleText_UproarAwake
	.4byte BattleText_UproarWoke
	.4byte BattleText_UproarCaused
	.4byte BattleText_UproarMaking
	.4byte BattleText_CalmedDown
	.4byte BattleText_UproarCantSleep
	.4byte BattleText_Stockpiled
	.4byte BattleText_StockpiledCant
	.4byte BattleText_UproarCantSleep2
	.4byte BattleText_UproarKeptAwake
	.4byte BattleText_StayedAwake
	.4byte BattleText_StoringEnergy
	.4byte BattleText_UnleashedEnergy
	.4byte BattleText_FatigueConfuse
	.4byte BattleText_PickedUpYen
	.4byte BattleText_Unaffected
	.4byte BattleText_Transformed
	.4byte BattleText_SubMade
	.4byte BattleText_SubAlready
	.4byte BattleText_SubTookDamage
	.4byte BattleText_SubFaded
	.4byte BattleText_MustRecharge
	.4byte BattleText_RageBuilding
	.4byte BattleText_MoveWasDisabled
	.4byte BattleText_MoveIsDisabled
	.4byte BattleText_DisabledNoMore
	.4byte BattleText_EncoreGot
	.4byte BattleText_EncoreEnded
	.4byte BattleText_TookAim
	.4byte BattleText_SketchedMove
	.4byte BattleText_DestinyBondTake
	.4byte BattleText_DestinyBondTaken
	.4byte BattleText_ReducedBy
	.4byte BattleText_StoleSomething
	.4byte BattleText_CantEscapeNow
	.4byte BattleText_NightmareStart
	.4byte BattleText_NightmareLock
	.4byte BattleText_CurseLay
	.4byte BattleText_CurseAfflict
	.4byte BattleText_SpikesScattered
	.4byte BattleText_SpikesHurt
	.4byte BattleText_IdentifiedPoke
	.4byte BattleText_PerishSongFell
	.4byte BattleText_BracedItself
	.4byte BattleText_EnduredHit
	.4byte BattleText_MagnitudeCount
	.4byte BattleText_CutHPMaxATK
	.4byte BattleText_CopyStatChanges
	.4byte BattleText_GotFreeFrom
	.4byte BattleText_LeechShed
	.4byte BattleText_SpikesBlownAway
	.4byte BattleText_FledBattle
	.4byte BattleText_ForesawAttack
	.4byte BattleText_TookAttack
	.4byte BattleText_PokeAttack
	.4byte BattleText_CenterAttention
	.4byte BattleText_ChargingPower
	.4byte BattleText_NaturePower
	.4byte BattleText_StatusNormal
	.4byte BattleText_NoMovesLeft
	.4byte BattleText_TormentSubject
	.4byte BattleText_TormentNoUse
	.4byte BattleText_TightenFocus
	.4byte BattleText_TauntFell
	.4byte BattleText_TauntNoUse
	.4byte BattleText_ReadyToHelp
	.4byte BattleText_SwitchedItems
	.4byte BattleText_CopiedObject
	.4byte BattleText_WishMade
	.4byte BattleText_WishTrue
	.4byte BattleText_PlantedRoots
	.4byte BattleText_AbsorbNutrients
	.4byte BattleText_AnchoredItself
	.4byte BattleText_DrowsyMade
	.4byte BattleText_KnockedOffItem
	.4byte BattleText_AbilitySwap
	.4byte BattleText_SealedMove
	.4byte BattleText_SealedNoUse
	.4byte BattleText_GrudgeBear
	.4byte BattleText_GrudgeLosePP
	.4byte BattleText_ShroudedItself
	.4byte BattleText_MagicCoatBounce
	.4byte BattleText_AwaitMove
	.4byte BattleText_SnatchedMove
	.4byte BattleText_RainMade
	.4byte BattleText_SpeedRisen
	.4byte BattleText_ProtectedBy
	.4byte BattleText_PreventedBy
	.4byte BattleText_HPRestoredUsing
	.4byte BattleText_MadeType
	.4byte BattleText_PreventedPara
	.4byte BattleText_PreventedRomance
	.4byte BattleText_PreventedPoison
	.4byte BattleText_PreventedConfusion
	.4byte BattleText_RaisedFirePower
	.4byte BattleText_AnchorsItself
	.4byte BattleText_CutsAttack
	.4byte BattleText_PreventedStatLoss
	.4byte BattleText_HurtOther
	.4byte BattleText_Traced
	.4byte BattleText_Sharply
	.4byte BattleText_Rose
	.4byte BattleText_Harshly
	.4byte BattleText_Fell
	.4byte BattleText_UnknownString7
	.4byte BattleText_UnknownString3
	.4byte BattleText_UnknownString5
	.4byte BattleText_UnknownString6
	.4byte BattleText_Critical
	.4byte BattleText_GrandSlam
	.4byte BattleText_MoveForget123
	.4byte BattleText_MoveForgetAnd
	.4byte BattleText_NotEffective
	.4byte BattleText_SuperEffective
	.4byte BattleText_GotAwaySafely
	.4byte BattleText_FledWild
	.4byte BattleText_NoRunning
	.4byte BattleText_CantEscape2
	.4byte BattleText_BirchDontLeaveMe
	.4byte BattleText_Nothing
	.4byte BattleText_Failed
	.4byte BattleText_HurtItself
	.4byte BattleText_MirrorFail
	.4byte BattleText_RainStart
	.4byte BattleText_PourStart
	.4byte BattleText_RainCont1
	.4byte BattleText_PourCont
	.4byte BattleText_RainStop
	.4byte BattleText_SandBrewed
	.4byte BattleText_SandRages
	.4byte BattleText_SandSubsided
	.4byte BattleText_SunBright
	.4byte BattleText_SunStrong
	.4byte BattleText_SunFaded
	.4byte BattleText_HailStart
	.4byte BattleText_HailCont
	.4byte BattleText_HailStop
	.4byte BattleText_SpitUpFail
	.4byte BattleText_SwallowFail
	.4byte BattleText_WindHeatWave
	.4byte BattleText_StatElim
	.4byte BattleText_CoinScatter
	.4byte BattleText_SubWeak
	.4byte BattleText_PainSplit
	.4byte BattleText_BellChime
	.4byte BattleText_PerishSong
	.4byte BattleText_NoPP1
	.4byte BattleText_NoPP2
	.4byte BattleText_Used1
	.4byte BattleText_TutorialUsed
	.4byte BattleText_BlockBall
	.4byte BattleText_DontBeAThief
	.4byte BattleText_DodgeBall
	.4byte BattleText_MissPoke
	.4byte BattleText_BallBrokeOhNo
	.4byte BattleText_BallBrokeAppeared
	.4byte BattleText_BallBrokeAlmost
	.4byte BattleText_BallBrokeSoClose
	.4byte BattleText_BallCaught1
	.4byte BattleText_BallCaught2
	.4byte BattleText_GiveNickname
	.4byte BattleText_SentToPC
	.4byte BattleText_AddedToDex
	.4byte BattleText_Raining
	.4byte BattleText_Sandstorm
	.4byte BattleText_CantEscape
	.4byte BattleText_IgnoredOrdersSLP
	.4byte BattleText_IgnoredOrders
	.4byte BattleText_BeganNap
	.4byte BattleText_LoafingAround
	.4byte BattleText_WontObey
	.4byte BattleText_TurnedAway
	.4byte BattleText_NotNotice
	.4byte BattleText_WillSwitch
	.4byte BattleText_CreptCloser
	.4byte BattleText_CantGetCloser
	.4byte BattleText_WatchingCarefully
	.4byte BattleText_CuriousAbout
	.4byte BattleText_EnthralledBy
	.4byte BattleText_IgnoredThing
	.4byte BattleText_ThrewBlock
	.4byte BattleText_SafariOver
	.4byte BattleText_CuredParalysis
	.4byte BattleText_CuredPoison
	.4byte BattleText_CuredBurn
	.4byte BattleText_CuredFreeze
	.4byte BattleText_CuredSleep
	.4byte BattleText_CuredConfusion
	.4byte BattleText_CuredStatus
	.4byte BattleText_RestoredHealth
	.4byte BattleText_RestoredPP
	.4byte BattleText_RestoredStatus
	.4byte BattleText_RestoredHPLittle
	.4byte BattleText_ChoiceBand
	.4byte BattleText_FocusSash
	.4byte BattleText_Terminator2 @ terminator?
	.4byte BattleText_PreventedBurn
	.4byte BattleText_BlocksOther
	.4byte BattleText_RestoredHPByItem
	.4byte BattleText_WhipSandstorm
	.4byte BattleText_PreventedLoss
	.4byte BattleText_InfatuatedPoke
	.4byte BattleText_MadeIneffective
	.4byte BattleText_CuredProblem
	.4byte BattleText_OozeSuckup
	.4byte BattleText_Transformed2
	.4byte BattleText_ElecWeakened
	.4byte BattleText_FireWeakened
	.4byte BattleText_HidUnderwater
	.4byte BattleText_SprangUp
	.4byte BattleText_CantForgetHM
	.4byte BattleText_FoundOne
	.4byte BattleText_PlayerDefeatedTrainer2
	.4byte BattleText_SoothingAroma
	.4byte BattleText_CantUseItems
	.4byte BattleText_UnknownString2
	.4byte BattleText_UnknownString4
	.4byte BattleText_HustleUse
	.4byte BattleText_MadeUseless
	.4byte BattleText_SandTombTrapped @ sand tomb
	.4byte BattleText_Terminator
	.4byte BattleText_BoostedExp
	.4byte BattleText_SunIntensified
	.4byte BattleText_GroundMoveNegate
	.4byte BattleText_WallyBall
	.4byte BattleText_TookAttack2
	.4byte BattleText_ChoseDestiny
	.4byte BattleText_LostFocus
	.4byte BattleText_UseNext
	.4byte BattleText_FledUsingItem
	.4byte BattleText_FledUsingOther
	.4byte BattleText_DraggedOut
	.4byte BattleText_PreventedOther
	.4byte BattleText_NormalizedStatus
	.4byte BattleText_Used2
	.4byte BattleText_BoxFull
	.4byte BattleText_AvoidedAttack
	.4byte BattleText_MadeIneffective2
	.4byte BattleText_PreventedFlinching
	.4byte BattleText_AlreadyBurned
	.4byte BattleText_StatNoLower
	.4byte BattleText_BlocksOther2
	.4byte BattleText_WoreOff
	.4byte BattleText_RaisedDefenseLittle
	.4byte BattleText_RaisedSpDefLittle
	.4byte BattleText_BrokeWall
	.4byte BattleText_PreventedOther2
	.4byte BattleText_CuredOfProblem
	.4byte BattleText_AttackingCantEscape
	.4byte BattleText_Obtained1
	.4byte BattleText_Obtained2
	.4byte BattleText_Obtained3
	.4byte BattleText_NoEffect
	.4byte BattleText_NoEffectOn

	.align 1
gUnknown_08401508:: @ 8401508
@ Each entry refers to a text pointer in gUnknown_08400F8C, but the values are offset
@ by 0xc. For example, 0x0017 refers to BattleText_AttackMissed because it is the
@ 11th entry in the pointer table.
	.2byte BATTLE_TEXT_AttackMissed
	.2byte BATTLE_TEXT_ProtectedItself
	.2byte BATTLE_TEXT_AvoidedAttack
	.2byte BATTLE_TEXT_AvoidedDamage
	.2byte BATTLE_TEXT_GroundMoveNegate

BattleTextList_401512:: @ 8401512
	.2byte BATTLE_TEXT_CantEscape2
	.2byte BATTLE_TEXT_BirchDontLeaveMe
	.2byte BATTLE_TEXT_PreventEscape
	.2byte BATTLE_TEXT_CantEscape
	.2byte BATTLE_TEXT_AttackingCantEscape

BattleTextList_40151C:: @ 840151C
	.2byte BATTLE_TEXT_RainStart
	.2byte BATTLE_TEXT_PourStart
	.2byte BATTLE_TEXT_Failed
	.2byte BATTLE_TEXT_SandBrewed
	.2byte BATTLE_TEXT_SunBright
	.2byte BATTLE_TEXT_HailStart

BattleTextList_401528:: @ 8401528
	.2byte BATTLE_TEXT_SandRages
	.2byte BATTLE_TEXT_HailCont

BattleTextList_40152C:: @ 840152C
	.2byte BATTLE_TEXT_SandBuffeted
	.2byte BATTLE_TEXT_HailStricken

BattleTextList_401530:: @ 8401530
	.2byte BATTLE_TEXT_SandSubsided
	.2byte BATTLE_TEXT_HailStop

BattleTextList_401534:: @ 8401534
	.2byte BATTLE_TEXT_RainCont1
	.2byte BATTLE_TEXT_PourCont
	.2byte BATTLE_TEXT_RainStop

BattleTextList_40153A:: @ 840153A
	.2byte BATTLE_TEXT_ProtectedItself2
	.2byte BATTLE_TEXT_BracedItself
	.2byte BATTLE_TEXT_Failed

BattleTextList_401540:: @ 8401540
	.2byte BATTLE_TEXT_Failed
	.2byte BATTLE_TEXT_RaisedDefense
	.2byte BATTLE_TEXT_RaisedDefenseLittle
	.2byte BATTLE_TEXT_RaisedSpDef
	.2byte BATTLE_TEXT_RaisedSpDefLittle
	.2byte BATTLE_TEXT_CoveredVeil

BattleTextList_40154C:: @ 840154C
	.2byte BATTLE_TEXT_WasSeeded
	.2byte BATTLE_TEXT_EvadedAttack
	.2byte BATTLE_TEXT_DoesntAffect
	.2byte BATTLE_TEXT_HealthSapped
	.2byte BATTLE_TEXT_OozeSuckup

BattleTextList_401556:: @ 8401556
	.2byte BATTLE_TEXT_WentToSleep
	.2byte BATTLE_TEXT_SpeltHealthy

BattleTextList_40155A:: @ 840155A
	.2byte BATTLE_TEXT_UproarMaking
	.2byte BATTLE_TEXT_CalmedDown

BattleTextList_40155E:: @ 840155E
	.2byte BATTLE_TEXT_Stockpiled
	.2byte BATTLE_TEXT_StockpiledCant

BattleTextList_401562:: @ 8401562
	.2byte BATTLE_TEXT_WokeUp
	.2byte BATTLE_TEXT_UproarWoke

BattleTextList_401566:: @ 8401566
	.2byte BATTLE_TEXT_SwallowFail
	.2byte BATTLE_TEXT_HPFull

BattleTextList_40156A:: @ 840156A
	.2byte BATTLE_TEXT_UproarCantSleep2
	.2byte BATTLE_TEXT_UproarKeptAwake
	.2byte BATTLE_TEXT_StayedAwake

BattleTextList_401570:: @ 8401570
	.2byte BATTLE_TEXT_UnknownString7
	.2byte BATTLE_TEXT_UnknownString3
	.2byte BATTLE_TEXT_AttackingStatNoHigher
	.2byte BATTLE_TEXT_Terminator2
	.2byte BATTLE_TEXT_UnknownString4
	.2byte BATTLE_TEXT_HustleUse

BattleTextList_40157C:: @ 840157C
	.2byte BATTLE_TEXT_UnknownString5
	.2byte BATTLE_TEXT_UnknownString6
	.2byte BATTLE_TEXT_DefendingStatNoHigher
	.2byte BATTLE_TEXT_Terminator2

BattleTextList_401584:: @ 8401584
	.2byte BATTLE_TEXT_WhipWhirlwind
	.2byte BATTLE_TEXT_TookSunlight
	.2byte BATTLE_TEXT_LoweredHead
	.2byte BATTLE_TEXT_IsGlowing
	.2byte BATTLE_TEXT_FlewHigh
	.2byte BATTLE_TEXT_DugHole
	.2byte BATTLE_TEXT_HidUnderwater
	.2byte BATTLE_TEXT_SprangUp

BattleTextList_401594:: @ 8401594
	.2byte BATTLE_TEXT_SqueezedBind
	.2byte BATTLE_TEXT_Wrapped
	.2byte BATTLE_TEXT_TrappedVortex
	.2byte BATTLE_TEXT_Clamped
	.2byte BATTLE_TEXT_TrappedVortex
	.2byte BATTLE_TEXT_SandTombTrapped

BattleTextList_4015A0:: @ 84015A0
	.2byte BATTLE_TEXT_MistShroud
	.2byte BATTLE_TEXT_Failed

BattleTextList_4015A4:: @ 84015A4
	.2byte BATTLE_TEXT_GetPumped
	.2byte BATTLE_TEXT_Failed

BattleTextList_4015A8:: @ 84015A8
	.2byte BATTLE_TEXT_Transformed
	.2byte BATTLE_TEXT_Failed

BattleTextList_4015AC:: @ 84015AC
	.2byte BATTLE_TEXT_SubMade
	.2byte BATTLE_TEXT_SubWeak

BattleTextList_4015B0:: @ 84015B0
	.2byte BATTLE_TEXT_Poisoned
	.2byte BATTLE_TEXT_Poisoned2

BattleTextList_4015B4:: @ 84015B4
	.2byte BATTLE_TEXT_Paralyzed
	.2byte BATTLE_TEXT_Paralyzed2

BattleTextList_4015B8:: @ 84015B8
	.2byte BATTLE_TEXT_FellAsleep
	.2byte BATTLE_TEXT_MadeAsleep

BattleTextList_4015BC:: @ 84015BC
	.2byte BATTLE_TEXT_Burned
	.2byte BATTLE_TEXT_Burned2

BattleTextList_4015C0:: @ 84015C0
	.2byte BATTLE_TEXT_Frozen
	.2byte BATTLE_TEXT_Frozen2

BattleTextList_4015C4:: @ 84015C4
	.2byte BATTLE_TEXT_AttackingDefrosted
	.2byte BATTLE_TEXT_Defrosted

BattleTextList_4015C8:: @ 84015C8
	.2byte BATTLE_TEXT_AttackMissed
	.2byte BATTLE_TEXT_Unaffected
	.2byte BATTLE_TEXT_FellLove
	.2byte BATTLE_TEXT_InfatuatedPoke

BattleTextList_4015D0:: @ 84015D0
	.2byte BATTLE_TEXT_EnergyDrained
	.2byte BATTLE_TEXT_OozeSuckup

BattleTextList_4015D4:: @ 84015D4
	.2byte BATTLE_TEXT_ElecWeakened
	.2byte BATTLE_TEXT_FireWeakened

BattleTextList_4015D8:: @ 84015D8
	.2byte BATTLE_TEXT_BellChime
	.2byte BATTLE_TEXT_BellChime
	.2byte BATTLE_TEXT_BellChime
	.2byte BATTLE_TEXT_BellChime
	.2byte BATTLE_TEXT_SoothingAroma

BattleTextList_4015E2:: @ 84015E2
	.2byte BATTLE_TEXT_ForesawAttack
	.2byte BATTLE_TEXT_ChoseDestiny

BattleTextList_4015E6:: @ 84015E6
	.2byte BATTLE_TEXT_BallBrokeOhNo
	.2byte BATTLE_TEXT_BallBrokeAppeared
	.2byte BATTLE_TEXT_BallBrokeAlmost
	.2byte BATTLE_TEXT_BallBrokeSoClose

BattleTextList_4015EE:: @ 84015EE
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Sandstorm
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_SunStrong
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining
	.2byte BATTLE_TEXT_Raining

BattleTextList_40160E:: @ 840160E
	.2byte BATTLE_TEXT_LoafingAround
	.2byte BATTLE_TEXT_WontObey
	.2byte BATTLE_TEXT_TurnedAway
	.2byte BATTLE_TEXT_NotNotice

BattleTextList_401616:: @ 8401616
	.2byte BATTLE_TEXT_CreptCloser
	.2byte BATTLE_TEXT_CantGetCloser

BattleTextList_40161A:: @ 840161A
	.2byte BATTLE_TEXT_CuriousAbout
	.2byte BATTLE_TEXT_EnthralledBy
	.2byte BATTLE_TEXT_IgnoredThing

BattleTextList_401620:: @ 8401620
	.2byte BATTLE_TEXT_CuredConfusion
	.2byte BATTLE_TEXT_CuredParalysis
	.2byte BATTLE_TEXT_CuredFreeze
	.2byte BATTLE_TEXT_CuredBurn
	.2byte BATTLE_TEXT_CuredPoison
	.2byte BATTLE_TEXT_CuredSleep

BattleTextList_40162C:: @ 840162C
	.2byte BATTLE_TEXT_CuredStatus
	.2byte BATTLE_TEXT_NormalizedStatus

BattleTextList_401630:: @ 8401630
	.2byte BATTLE_TEXT_PreventedBurn
	.2byte BATTLE_TEXT_PreventedOther2
	.2byte BATTLE_TEXT_NoEffectOn

BattleTextList_401636:: @ 8401636
	.2byte BATTLE_TEXT_PreventedPara
	.2byte BATTLE_TEXT_PreventedOther2
	.2byte BATTLE_TEXT_NoEffectOn

BattleTextList_40163C:: @ 840163C
	.2byte BATTLE_TEXT_PreventedPoison
	.2byte BATTLE_TEXT_PreventedOther2
	.2byte BATTLE_TEXT_NoEffectOn

BattleTextList_401642:: @ 8401642
	.2byte BATTLE_TEXT_Obtained1
	.2byte BATTLE_TEXT_Obtained2
	.2byte BATTLE_TEXT_Obtained3

BattleTextList_401648:: @ 8401648
	.2byte BATTLE_TEXT_RaisedFirePower
	.2byte BATTLE_TEXT_MadeIneffective

gUnknown_0840164C:: @ 840164C
	.2byte BATTLE_TEXT_StopLearning
	.2byte BATTLE_TEXT_FellAsleep
	.2byte BATTLE_TEXT_SpeltHealthy
	.2byte BATTLE_TEXT_SubTookDamage
	.2byte BATTLE_TEXT_CoinScatter
	.2byte BATTLE_TEXT_SandTombTrapped
	.2byte 0xFFFF

	.align 2
gUnknown_0840165C:: @ 840165C
	.4byte BattleText_HP
	.4byte BattleText_SpAtk
	.4byte BattleText_Attack
	.4byte BattleText_SpDef
	.4byte BattleText_Defense
	.4byte BattleStatText_Speed

	.align 2
gUnknown_08401674:: @ 8401674
	.4byte BattleText_Normal
	.4byte BattleText_Fighting
	.4byte BattleText_Flying
	.4byte BattleText_Poison
	.4byte BattleText_Ground
	.4byte BattleText_Rock
	.4byte BattleText_Bug
	.4byte BattleText_Ghost
	.4byte BattleText_Steel
	.4byte BattleText_Typeless
	.4byte BattleText_Fire
	.4byte BattleText_Water
	.4byte BattleText_Grass
	.4byte BattleText_Electric
	.4byte BattleText_Psychic
	.4byte BattleText_Ice
	.4byte BattleText_Dragon
	.4byte BattleText_Dark
