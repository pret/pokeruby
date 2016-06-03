	.global gUnknown_083FE4F4
gUnknown_083FE4F4: @ 83FE4F4
	.4byte 0x0811e3e5 @ not text pointers. graphics maybe?
	.4byte 0x0811ec05
	.4byte 0x0811ec11
	.4byte 0x0811f665
	.4byte 0x0811f6d9
	.4byte 0x0811f7f5
	.4byte 0x0811f9d1
	.4byte 0x0811fae5
	.4byte 0x0811fc31
	.4byte 0x0811fc3d
	.4byte 0x0811fce9
	.4byte 0x0811fdcd
	.4byte 0x0811fdd9
	.4byte 0x0811fde5
	.4byte 0x0811fdf1
	.4byte 0x0811fdfd
	.4byte 0x08120095
	.4byte 0x081200f9
	.4byte 0x08120105
	.4byte 0x08120111
	.4byte 0x0812011d
	.4byte 0x08120129
	.4byte 0x08120135
	.4byte 0x08120141
	.4byte 0x0812014d
	.4byte 0x0812023d
	.4byte 0x08120249
	.4byte 0x081202bd
	.4byte 0x08120325
	.4byte 0x08120331
	.4byte 0x0812033d
	.4byte 0x08120349
	.4byte 0x08120355
	.4byte 0x08120361
	.4byte 0x0812036d
	.4byte 0x08120379
	.4byte 0x08120385
	.4byte 0x08120391
	.4byte 0x081203ad
	.4byte 0x081203e5
	.4byte 0x081203fd
	.4byte 0x08120425
	.4byte 0x08120495
	.4byte 0x081204a1
	.4byte 0x081204e5
	.4byte 0x08120515
	.4byte 0x08120555
	.4byte 0x08120589
	.4byte 0x08120829
	.4byte 0x08120921
	.4byte 0x0812096d
	.4byte 0x08120979
	.4byte 0x081209d9
	.4byte 0x08120a41
	.4byte 0x08120a4d
	.4byte 0x08120a59
	.4byte 0x08120aa5
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
BattleText_TrappedBy:
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

	.global gUnknown_083FEE5D
gUnknown_083FEE5D: @ 83FEE5D
BattleText_MistShroud:
	.string "{STRING 38} became\nshrouded in MIST!$"
BattleText_MistProtect:
	.string "{STRING 16} is protected\nby MIST!$"

	.global gUnknown_083FEE92
gUnknown_083FEE92: @ 83FEE92
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

	.global gUnknown_083FFCCA
gUnknown_083FFCCA: @ 83FFCCA
BattleText_SwitchPrevented:
	.string "{STRING 0}’s {STRING 20}\nprevents switching!\p$"
BattleText_OtherPrevented:
	.string "{DEFENDING_MON}’s {STRING 22}\nprevented {STRING 16}’s\l{STRING 0} from working!$"
BattleText_MadeIneffective2:
	.string "{STRING 16}’s {STRING 23}\nmade it ineffective!$"
BattleText_FlinchPrevented:
	.string "{STRING 14}’s {STRING 24}\nprevents flinching!$"
BattleText_OtherPrevented2:
	.string "{ATTACKING_MON}’s {STRING 21}\nprevents {DEFENDING_MON}’s\l{STRING 22} from working!$"
BattleText_CuredOfProblem:
	.string "{STRING 16}’s {STRING 23}\ncured its {STRING 0} problem!$"
BattleText_NoEffectOn:
	.string "{STRING 16}’s {STRING 23}\nhad no effect on {STRING 14}!$"
BattleText_Sharply:
	.string "sharply $"

	.global gUnknown_083FFDB3
gUnknown_083FFDB3: @ 83FFDB3
BattleText_Rose:
	.string "rose!$"
BattleText_Harshly:
	.string "harshly $"
BattleText_Fell:
	.string "fell!$"
BattleText_UnknownString7:
	.string "{ATTACKING_MON}’s {STRING 0}\n{STRING 1}$"

	.global gUnknown_083FFDD3
gUnknown_083FFDD3: @ 83FFDD3
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

	.global gUnknown_083FFEFC
gUnknown_083FFEFC: @ 83FFEFC
BattleText_GotAwaySafely:
	.string "{PLAY_SE SE_NIGERU}Got away safely!\p$"
BattleText_FledUsingItem:
	.string "{PLAY_SE SE_NIGERU}{ATTACKING_MON} fled\nusing its {STRING 19}!\p$"
BattleText_FledUsingOther:
	.string "{PLAY_SE SE_NIGERU}{ATTACKING_MON} fled\nusing {STRING 21}!\p$"
BattleText_FledWild:
	.string "{PLAY_SE SE_NIGERU}Wild {STRING 0} fled!$"

	.global gUnknown_083FFF56
gUnknown_083FFF56: @ 83FFF56
BattleText_PlayerDefeatedTrainer:
	.string "Player defeated\n{STRING 29}!$"

	.global gUnknown_083FFF6A
gUnknown_083FFF6A: @ 83FFF6A
BattleText_PlayerDefeatedTrainers:
	.string "Player beat {STRING 30}\nand {STRING 29}!$"

	.global gUnknown_083FFF81
gUnknown_083FFF81: @ 83FFF81
BattleText_PlayerLostTrainer:
	.string "Player lost against\n{STRING 29}!$"

	.global gUnknown_083FFF99
gUnknown_083FFF99: @ 83FFF99
BattleText_PlayerLostTrainers:
	.string "Player lost to {STRING 30}\nand {STRING 29}!$"

	.global gUnknown_083FFFB3
gUnknown_083FFFB3: @ 83FFFB3
BattleText_PlayerTiedTrainer:
	.string "Player tied against\n{STRING 29}!$"

	.global gUnknown_083FFFCB
gUnknown_083FFFCB: @ 83FFFCB
BattleText_PlayerTiedTrainers:
	.string "Player tied against {STRING 30}\nand {STRING 29}!$"

	.global gUnknown_083FFFEA
gUnknown_083FFFEA: @ 83FFFEA
BattleText_FledSingle:
	.string "{PLAY_SE SE_NIGERU}{STRING 29} fled!$"

	.global gUnknown_083FFFF7
gUnknown_083FFFF7: @ 83FFFF7
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
BattleText_DefeatedTrainer:
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

	.global gUnknown_08400555
gUnknown_08400555: @ 8400555
BattleText_WildAppeared1:
	.string "Wild {STRING 3} appeared!\p$"

	.global gUnknown_08400568
gUnknown_08400568: @ 8400568
BattleText_WildAppeared2:
	.string "Wild {STRING 3} appeared!\p$"

	.global gUnknown_0840057B
gUnknown_0840057B: @ 840057B
BattleText_WildAppeared3:
	.string "Wild {STRING 3} appeared!{PAUSE 127}$"

	.global gUnknown_08400590
gUnknown_08400590: @ 8400590
BattleText_WildDoubleAppeared:
	.string "Wild {STRING 5} and\n{STRING 3} appeared!\p$"

	.global gUnknown_084005AA
gUnknown_084005AA: @ 84005AA
BattleText_SingleWantToBattle1:
	.string "{STRING 25} {STRING 26}\nwould like to battle!\p$"

	.global gUnknown_084005C7
gUnknown_084005C7: @ 84005C7
BattleText_SingleWantToBattle2:
	.string "{STRING 29}\nwants to battle!$"

	.global gUnknown_084005DB
gUnknown_084005DB: @ 84005DB
BattleText_DoubleWantToBattle:
	.string "{STRING 29} and {STRING 30}\nwant to battle!$"

	.global gUnknown_084005F5
gUnknown_084005F5: @ 84005F5
BattleText_SentOutSingle1:
	.string "{STRING 25} {STRING 26} sent\nout {STRING 3}!$"

	.global gUnknown_08400608
gUnknown_08400608: @ 8400608
BattleText_SentOutDouble1:
	.string "{STRING 25} {STRING 26} sent\nout {STRING 3} and {STRING 5}!$"

	.global gUnknown_08400622
gUnknown_08400622: @ 8400622
BattleText_SentOutSingle2:
	.string "{STRING 25} {STRING 26} sent\nout {STRING 0}!$"

	.global gUnknown_08400635
gUnknown_08400635: @ 8400635
BattleText_SentOutSingle3:
	.string "{STRING 29} sent\nout {STRING 3}!$"

	.global gUnknown_08400645
gUnknown_08400645: @ 8400645
BattleText_SentOutDouble2:
	.string "{STRING 29} sent out\n{STRING 3} and {STRING 5}!$"

	.global gUnknown_0840065C
gUnknown_0840065C: @ 840065C
BattleText_SentOutDouble3:
	.string "{STRING 29} sent out\n{STRING 7}!\p{STRING 30} sent out\n{STRING 9}!$"

	.global gUnknown_0840067C
gUnknown_0840067C: @ 840067C
BattleText_SentOutSingle4:
	.string "{STRING 29} sent out\n{STRING 0}!$"

	.global gUnknown_0840068C
gUnknown_0840068C: @ 840068C
BattleText_SentOutSingle5:
	.string "{STRING 31} sent out\n{STRING 0}!$"

	.global gUnknown_0840069C
gUnknown_0840069C: @ 840069C
BattleText_SentOutSingle6:
	.string "Go! {STRING 2}!$"

	.global gUnknown_084006A4
gUnknown_084006A4: @ 84006A4
BattleText_SentOutDouble4:
	.string "Go! {STRING 2} and\n{STRING 4}!$"

	.global gUnknown_084006B3
gUnknown_084006B3: @ 84006B3
BattleText_SentOutSingle7:
	.string "Go! {STRING 0}!$"

	.global gUnknown_084006BB
gUnknown_084006BB: @ 84006BB
BattleText_SentOutSingle8:
	.string "Do it! {STRING 0}!$"

	.global gUnknown_084006C6
gUnknown_084006C6: @ 84006C6
BattleText_SentOutSingle9:
	.string "Go for it, {STRING 0}!$"

	.global gUnknown_084006D5
gUnknown_084006D5: @ 84006D5
BattleText_SentOutSingle10:
	.string "Your foe’s weak!\nGet’m, {STRING 0}!$"

	.global gUnknown_084006F1
gUnknown_084006F1: @ 84006F1
BattleText_SentOutSingle11:
	.string "{STRING 28} sent out\n{STRING 8}!\pGo! {STRING 6}!$"

	.global gUnknown_08400709
gUnknown_08400709: @ 8400709
BattleText_ComeBackSingle1:
	.string "{STRING 0}, that’s enough!\nCome back!$"

	.global gUnknown_08400727
gUnknown_08400727: @ 8400727
BattleText_ComeBackSingle2:
	.string "{STRING 0}, come back!$"

	.global gUnknown_08400736
gUnknown_08400736: @ 8400736
BattleText_ComeBackSingle3:
	.string "{STRING 0}, OK!\nCome back!$"

	.global gUnknown_08400749
gUnknown_08400749: @ 8400749
BattleText_ComeBackSingle4:
	.string "{STRING 0}, good!\nCome back!$"

	.global gUnknown_0840075E
gUnknown_0840075E: @ 840075E
BattleText_WithdrewPoke1:
	.string "{STRING 25} {STRING 26}\nwithdrew {STRING 0}!$"

	.global gUnknown_08400771
gUnknown_08400771: @ 8400771
BattleText_WithdrewPoke2:
	.string "{STRING 29} withdrew\n{STRING 0}!$"

	.global gUnknown_08400781
gUnknown_08400781: @ 8400781
BattleText_WithdrewPoke3:
	.string "{STRING 31} withdrew\n{STRING 0}!$"

	.global gUnknown_08400791
gUnknown_08400791: @ 8400791
BattleText_Wild:
	.string "Wild $"

	.global gUnknown_08400797
gUnknown_08400797: @ 8400797
BattleText_Foe:
	.string "Foe $"

	.global gUnknown_0840079C
gUnknown_0840079C: @ 840079C
BattleText_Foe2:
	.string "Foe $"

	.global gUnknown_084007A1
gUnknown_084007A1: @ 84007A1
BattleText_Ally:
	.string "Ally $"

	.global gUnknown_084007A7
gUnknown_084007A7: @ 84007A7
BattleText_Foe3:
	.string "Foe $"

	.global gUnknown_084007AC
gUnknown_084007AC: @ 84007AC
BattleText_Ally2:
	.string "Ally $"

	.global gUnknown_084007B2
gUnknown_084007B2: @ 84007B2
BattleText_Foe4:
	.string "Foe $"

	.global gUnknown_084007B7
gUnknown_084007B7: @ 84007B7
BattleText_Ally3:
	.string "Ally $"

	.global gUnknown_084007BD
gUnknown_084007BD: @ 84007BD
BattleText_OpponentUsedMove:
	.string "{ATTACKING_MON} used\n{STRING 1}$"

	.global gUnknown_084007C8
gUnknown_084007C8: @ 84007C8
BattleText_Exclamation2: @ out of order but whatever
	.string "!$"

	.global gUnknown_084007CA
gUnknown_084007CA: @ 84007CA
BattleText_Exclamation3:
	.string "!$"

	.global gUnknown_084007CC
gUnknown_084007CC: @ 84007CC
BattleText_Exclamation4:
	.string "!$"

	.global gUnknown_084007CE
gUnknown_084007CE: @ 84007CE
BattleText_Exclamation5:
	.string "!$"

	.global gUnknown_084007D0
gUnknown_084007D0: @ 84007D0
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

	.global gUnknown_084009ED
gUnknown_084009ED: @ 84009ED
BattleText_Someone:
	.string "someone’s$"

	.global gUnknown_084009F7
gUnknown_084009F7: @ 84009F7
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

	.global gUnknown_08400A78
gUnknown_08400A78: @ 8400A78
BattleText_EnigmaBerry:
	.string "ENIGMA BERRY$"

	.global gUnknown_08400A85
gUnknown_08400A85: @ 8400A85
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

	.global gUnknown_08400C4A
gUnknown_08400C4A: @ 8400C4A
BattleText_StartEvo:
	.string "What?\n{STRING 2} is evolving!$"

	.global gUnknown_08400C60
gUnknown_08400C60: @ 8400C60
BattleText_FinishEvo:
	.string "Congratulations! Your {STRING 2}\nevolved into {STRING 3}!{UNKNOWN_A}\p$"

	.global gUnknown_08400C8D
gUnknown_08400C8D: @ 8400C8D
BattleText_StopEvo:
	.string "Huh? {STRING 2}\nstopped evolving!\p$"

	.global gUnknown_08400CA8
gUnknown_08400CA8: @ 8400CA8
BattleText_OtherMenu:
	.string "What should\n{STRING 15} do?$"

	.global gUnknown_08400CBB
gUnknown_08400CBB: @ 8400CBB
BattleText_PlayerMenu:
	.string "What will\n{STRING 32} do?$"

	.global gUnknown_08400CCC
gUnknown_08400CCC: @ 8400CCC
BattleText_WallyMenu:
	.string "What will\nWALLY do?$"

	.global gUnknown_08400CE0
gUnknown_08400CE0: @ 8400CE0
BattleText_LinkStandby:
	.string "{PAUSE 16}Link standby...$"

	.global gUnknown_08400CF3
gUnknown_08400CF3: @ 8400CF3
BattleText_MenuOptions:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}FIGHT{CLEAR_TO 0x2E}BAG\nPOKéMON{CLEAR_TO 0x2E}RUN$"

	.global gUnknown_08400D15
gUnknown_08400D15: @ 8400D15
BattleText_MenuOptionsSafari:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}BALL{CLEAR_TO 0x2E}{POKEBLOCK}\nGO NEAR{CLEAR_TO 0x2E}RUN$"

	.global gUnknown_08400D38
gUnknown_08400D38: @ 8400D38
BattleText_PP:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}PP\nTYPE/$"

	.global gUnknown_08400D49
gUnknown_08400D49: @ 8400D49
BattleText_Format: @ cant think of a better name
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}$"

	.global gUnknown_08400D52
gUnknown_08400D52: @ 8400D52
BattleText_ForgetMove:
	.string "{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}{PALETTE 5}Which move should\nbe forgotten?$"

	.global gUnknown_08400D7A
gUnknown_08400D7A: @ 8400D7A
BattleText_YesNo:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Yes\nNo$"

	.global gUnknown_08400D89
gUnknown_08400D89: @ 8400D89
BattleText_SwitchWhich:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}Switch\nwhich?$"

	.global gUnknown_08400D9F
gUnknown_08400D9F: @ 8400D9F
BattleText_Format2:
	.string "{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}$"
BattleText_RightArrow:
	.string "{RIGHT_ARROW}$"

	.global gUnknown_08400DAA
gUnknown_08400DAA: @ 8400DAA
BattleText_Plus:
	.string "+$"

	.global gUnknown_08400DAC
gUnknown_08400DAC: @ 8400DAC
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

	.global gUnknown_08400DD6
gUnknown_08400DD6: @ 8400DD6
BattleText_SafariBalls:
	.string "{HIGHLIGHT RED}SAFARI BALLS$"

	.global gUnknown_08400DE6
gUnknown_08400DE6: @ 8400DE6
BattleText_SafariBallsLeft:
	.string "{HIGHLIGHT RED}Left: $"

	.global gUnknown_08400DF0
gUnknown_08400DF0: @ 8400DF0
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

	.global gUnknown_08400E23
gUnknown_08400E23: @ 8400E23
BattleText_Format3:
	.string " and $"

	.global gUnknown_08400E29
gUnknown_08400E29: @ 8400E29
BattleText_Format4:
	.string ", $"

	.global gUnknown_08400E2C
gUnknown_08400E2C: @ 8400E2C
BattleText_Format5:
	.string " $"

	.global gUnknown_08400E2E
gUnknown_08400E2E: @ 8400E2E
BattleText_Format6:
	.string "\l$"

	.global gUnknown_08400E30
gUnknown_08400E30: @ 8400E30
BattleText_Format7:
	.string "\n$"

	.global gUnknown_08400E32
gUnknown_08400E32: @ 8400E32
BattleText_Format8:
	.string "are$"

	.global gUnknown_08400E36
gUnknown_08400E36: @ 8400E36
BattleText_Format9:
	.string "are$"

	.global gUnknown_08400E3A
gUnknown_08400E3A: @ 8400E3A
BattleText_BadEGG:
	.string "Bad EGG$"

	.global gUnknown_08400E42
gUnknown_08400E42: @ 8400E42
BattleText_Wally:
	.string "WALLY$"

	.global gUnknown_08400E48
gUnknown_08400E48: @ 8400E48
BattleText_Win:
	.string "{HIGHLIGHT TRANSPARENT}Win$"

	.global gUnknown_08400E4F
gUnknown_08400E4F: @ 8400E4F
BattleText_Loss:
	.string "{HIGHLIGHT TRANSPARENT}Loss$"

	.global gUnknown_08400E57
gUnknown_08400E57: @ 8400E57
BattleText_Tie:
	.string "{HIGHLIGHT TRANSPARENT}Tie$"

	.global gUnknown_08400E5E
gUnknown_08400E5E: @ 8400E5E
BattleText_Format10:
	.string " is$"

	.global gUnknown_08400E62
gUnknown_08400E62: @ 8400E62
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
	.global gUnknown_08400F58
gUnknown_08400F58: @ 8400F58
	.4byte BattleStatText_HP
	.4byte BattleStatText_Attack
	.4byte BattleStatText_Defense
	.4byte BattleStatText_Speed
	.4byte BattleStatText_SpAtk
	.4byte BattleStatText_SpDef
	.4byte BattleStatText_Accuracy
	.4byte BattleStatText_Evasion

	.global gUnknown_08400F78
gUnknown_08400F78: @ 8400F78
	.4byte ContestStatText_TooSpicy
	.4byte ContestStatText_TooDry
	.4byte ContestStatText_TooSweet
	.4byte ContestStatText_TooBitter
	.4byte ContestStatText_TooSour

	.global gUnknown_08400F8C
gUnknown_08400F8C: @ 8400F8C
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
	.4byte 0x083fe6e1
	.4byte 0x083fe6f5
	.4byte 0x083ffe0e
	.4byte 0x083fe70a
	.4byte 0x083fe760
	.4byte 0x083fe778
	.4byte 0x083fe785
	.4byte 0x083fe792
	.4byte 0x083fe7ab
	.4byte 0x083fe7ca
	.4byte 0x083fe7db
	.4byte 0x083fe818
	.4byte 0x083fe828
	.4byte 0x083fe838
	.4byte 0x083fe84f
	.4byte 0x083fe865
	.4byte 0x083fe87b
	.4byte 0x083fe88f
	.4byte 0x083fe8a0
	.4byte 0x083fe8b5
	.4byte 0x083fe8cb
	.4byte 0x083fe8e3
	.4byte 0x083fe8f9
	.4byte 0x083fe914
	.4byte 0x083fe923
	.4byte 0x083fe936
	.4byte 0x083fe965
	.4byte 0x083fe97a
	.4byte 0x083fe992
	.4byte 0x083fe9a6
	.4byte 0x083fe9b8
	.4byte 0x083fe9ca
	.4byte 0x083fe9e2
	.4byte 0x083fea0d
	.4byte 0x083fea3d
	.4byte 0x083fea5d
	.4byte 0x083fea76
	.4byte 0x083fea92
	.4byte 0x083feaa8
	.4byte 0x083feac1
	.4byte 0x083fead9
	.4byte 0x083feaf9
	.4byte 0x083feb17
	.4byte 0x083feb27
	.4byte 0x083feb44
	.4byte 0x083feb58
	.4byte 0x083feb70
	.4byte 0x083feb81
	.4byte 0x083feb98
	.4byte 0x083febb3
	.4byte 0x083febc6
	.4byte 0x083febe7
	.4byte 0x083febf4
	.4byte 0x083fec08
	.4byte 0x083fec19
	.4byte 0x083fec52
	.4byte 0x083fec8b
	.4byte 0x083feca4
	.4byte 0x083fecc2
	.4byte 0x083fecd8
	.4byte 0x083fecea
	.4byte 0x083fed07
	.4byte 0x083fed22
	.4byte 0x083fed37
	.4byte 0x083fed4c
	.4byte 0x083fed5b
	.4byte 0x083fed6c
	.4byte 0x083fed9c
	.4byte 0x083fedba
	.4byte 0x083fedf5
	.4byte 0x083fee0b
	.4byte 0x083fee1a
	.4byte 0x083fee2c
	.4byte 0x083fee42
	.4byte 0x083fee5d
	.4byte 0x083fee79
	.4byte 0x083fee92
	.4byte 0x083feea8
	.4byte 0x083feebf
	.4byte 0x083feed4
	.4byte 0x083feef5
	.4byte 0x083fef1f
	.4byte 0x083fef2e
	.4byte 0x083fef44
	.4byte 0x083fef69
	.4byte 0x083fef7c
	.4byte 0x083fef88
	.4byte 0x083fefa7
	.4byte 0x083fefc1
	.4byte 0x083fefd6
	.4byte 0x083fefee
	.4byte 0x083feffe
	.4byte 0x083ff01f
	.4byte 0x083ff031
	.4byte 0x083ff04e
	.4byte 0x083ff06f
	.4byte 0x083ff08d
	.4byte 0x083ff0ab
	.4byte 0x083ff0c1
	.4byte 0x083ff0d6
	.4byte 0x083ff0f9
	.4byte 0x083ff10c
	.4byte 0x083ff11e
	.4byte 0x083ff136
	.4byte 0x083ff14c
	.4byte 0x083ff169
	.4byte 0x083ff18d
	.4byte 0x083ff1a5
	.4byte 0x083ff1b7
	.4byte 0x083ff1ce
	.4byte 0x083ff927
	.4byte 0x083ff1e4
	.4byte 0x083ff1fc
	.4byte 0x083ff20e
	.4byte 0x083ff221
	.4byte 0x083ff234
	.4byte 0x083ff244
	.4byte 0x083ff26a
	.4byte 0x083ff27e
	.4byte 0x083ff295
	.4byte 0x083ff2a7
	.4byte 0x083ff2bc
	.4byte 0x083ff2d6
	.4byte 0x083ff2f3
	.4byte 0x083ff31d
	.4byte 0x083ff33b
	.4byte 0x083ff36b
	.4byte 0x083ff381
	.4byte 0x083ff393
	.4byte 0x083ff3b1
	.4byte 0x083ff3c3
	.4byte 0x083ff3d7
	.4byte 0x083ff3e5
	.4byte 0x083ff40d
	.4byte 0x083ff42a
	.4byte 0x083ff442
	.4byte 0x083ff456
	.4byte 0x083ff46b
	.4byte 0x083ff480
	.4byte 0x083ff496
	.4byte 0x083ff4c7
	.4byte 0x083ff4d4
	.4byte 0x083ff4f7
	.4byte 0x083ff510
	.4byte 0x083ff52d
	.4byte 0x083ff910
	.4byte 0x083ff54d
	.4byte 0x083ff93d
	.4byte 0x083ff56a
	.4byte 0x083ff586
	.4byte 0x083ff97c
	.4byte 0x083ff59d
	.4byte 0x083ff5b5
	.4byte 0x083ff61a
	.4byte 0x083ff62d
	.4byte 0x083ff63d
	.4byte 0x083ff652
	.4byte 0x083ff668
	.4byte 0x083ff68e
	.4byte 0x083ff6b1
	.4byte 0x083ff6c4
	.4byte 0x083ff6dc
	.4byte 0x083ff704
	.4byte 0x083ff99e
	.4byte 0x083ff726
	.4byte 0x083ff74e
	.4byte 0x083ff779
	.4byte 0x083ff793
	.4byte 0x083ff7bb
	.4byte 0x083ff7dd
	.4byte 0x083ff9bb
	.4byte 0x083ff9d1
	.4byte 0x083ff9eb
	.4byte 0x083ffa03
	.4byte 0x083ffa26
	.4byte 0x083ffa5c
	.4byte 0x083ffa79
	.4byte 0x083ffa95
	.4byte 0x083ffaaf
	.4byte 0x083ffacb
	.4byte 0x083ffae7
	.4byte 0x083ffb06
	.4byte 0x083ffb21
	.4byte 0x083ffb3b
	.4byte 0x083ffb57
	.4byte 0x083ffb68
	.4byte 0x083ffdaa
	.4byte 0x083ffdb3
	.4byte 0x083ffdb9
	.4byte 0x083ffdc2
	.4byte 0x083ffdc8
	.4byte 0x083ffdd3
	.4byte 0x083ffdf8
	.4byte 0x083ffe03
	.4byte 0x083ffe4d
	.4byte 0x083ffe5d
	.4byte 0x083ffe70
	.4byte 0x083ffea1
	.4byte 0x083ffecb
	.4byte 0x083ffee6
	.4byte 0x083ffefc
	.4byte 0x083fff44
	.4byte 0x0840000b
	.4byte 0x0840003a
	.4byte 0x08400049
	.4byte 0x08400078
	.4byte 0x0840008e
	.4byte 0x0840009d
	.4byte 0x084000be
	.4byte 0x084000d6
	.4byte 0x084000ea
	.4byte 0x084000fe
	.4byte 0x08400116
	.4byte 0x0840012e
	.4byte 0x08400140
	.4byte 0x08400154
	.4byte 0x08400169
	.4byte 0x08400181
	.4byte 0x0840019a
	.4byte 0x084001b2
	.4byte 0x084001c6
	.4byte 0x084001da
	.4byte 0x084001f2
	.4byte 0x08400205
	.4byte 0x08400227
	.4byte 0x08400249
	.4byte 0x0840026b
	.4byte 0x0840028d
	.4byte 0x084002a9
	.4byte 0x084002cf
	.4byte 0x084002ef
	.4byte 0x084002fe
	.4byte 0x0840032a
	.4byte 0x0840034d
	.4byte 0x08400858
	.4byte 0x08400864
	.4byte 0x08400882
	.4byte 0x084008a0
	.4byte 0x084008b2
	.4byte 0x084008eb
	.4byte 0x08400903
	.4byte 0x08400923
	.4byte 0x08400942
	.4byte 0x08400958
	.4byte 0x08400975
	.4byte 0x08400993
	.4byte 0x084009b3
	.4byte 0x084009d7
	.4byte 0x08400a01
	.4byte 0x08400a26
	.4byte 0x08400a35
	.4byte BattleText_CantEscape
	.4byte 0x08400374
	.4byte 0x08400394
	.4byte 0x084003a7
	.4byte 0x084003b8
	.4byte 0x084003ce
	.4byte 0x084003dd
	.4byte 0x084003ed
	.4byte 0x08400409
	.4byte 0x08400462
	.4byte 0x08400479
	.4byte 0x08400492
	.4byte 0x084004ac
	.4byte 0x084004c8
	.4byte 0x084004e4
	.4byte 0x08400502
	.4byte 0x0840051e
	.4byte 0x08400a8c
	.4byte 0x08400aa5
	.4byte 0x08400abb
	.4byte 0x08400ad4
	.4byte 0x08400aea
	.4byte 0x08400b0a
	.4byte 0x08400b2f
	.4byte 0x08400b6c
	.4byte 0x08400b85
	.4byte 0x08400b9f
	.4byte 0x08400bbc
	.4byte 0x08400bde
	.4byte 0x08400bfd
	.4byte 0x08400c16
	.4byte 0x083ffb7b
	.4byte 0x083ffb93
	.4byte 0x083ffbb9
	.4byte 0x083ffbd3
	.4byte 0x083ffc17
	.4byte 0x083ffc31
	.4byte 0x083ffc48
	.4byte 0x083ffc65
	.4byte 0x083ffc83
	.4byte 0x083ffca1
	.4byte 0x083ff7f4
	.4byte 0x083ff816
	.4byte 0x083fed7b
	.4byte 0x083fed8e
	.4byte 0x083ffea9
	.4byte 0x083ff831
	.4byte 0x0840044a
	.4byte 0x083ff842
	.4byte 0x083ff86c
	.4byte 0x083ff888
	.4byte 0x083ffdde
	.4byte 0x083ff896
	.4byte 0x083ffa43
	.4byte 0x083fedd8
	.4byte 0x083fe5f8
	.4byte 0x083fe5f9
	.4byte 0x083ffbf3
	.4byte 0x083fe725
	.4byte 0x08400c17
	.4byte 0x083ffcb1
	.4byte 0x083ff4ab
	.4byte 0x083ff8ac
	.4byte 0x083fe6cf
	.4byte 0x083fff12
	.4byte 0x083fff2d
	.4byte 0x083ff8d1
	.4byte 0x083ffce7
	.4byte 0x08400b4d
	.4byte 0x08400873
	.4byte 0x08400a4c
	.4byte 0x083fe749
	.4byte 0x083ffd0f
	.4byte 0x083ffd2c
	.4byte 0x083fe94e
	.4byte 0x083ffe2e
	.4byte 0x083ffba6
	.4byte 0x083fef0d
	.4byte 0x083fec6a
	.4byte 0x083fec31
	.4byte 0x083ff8e6
	.4byte 0x083ffd48
	.4byte 0x083ffd6f
	.4byte 0x083fe807
	.4byte 0x083ff5da
	.4byte 0x083ff5ea
	.4byte 0x083ff5fa
	.4byte 0x083ff8fa
	.4byte 0x083ffd8d

	.global gUnknown_08401508
gUnknown_08401508: @ 8401508
	.incbin "baserom.gba", 0x00401508, 0x144

	.global gUnknown_0840164C
gUnknown_0840164C: @ 840164C
	.incbin "baserom.gba", 0x0040164c, 0x10

	.global gUnknown_0840165C
gUnknown_0840165C: @ 840165C
	.4byte 0x08400dae
	.4byte 0x08400dc6
	.4byte 0x08400db6
	.4byte 0x08400dce
	.4byte 0x08400dbe
	.4byte 0x084007e4

	.global gUnknown_08401674
gUnknown_08401674: @ 8401674
	.4byte 0x08400e65
	.4byte 0x08400e73
	.4byte 0x08400e83
	.4byte 0x08400e91
	.4byte 0x08400e9f
	.4byte 0x08400ead
	.4byte 0x08400eb9
	.4byte 0x08400ec4
	.4byte 0x08400ed1
	.4byte 0x08400ede
	.4byte 0x08400ee9
	.4byte 0x08400ef5
	.4byte 0x08400f02
	.4byte 0x08400f0f
	.4byte 0x08400f20
	.4byte 0x08400f2f
	.4byte 0x08400f3b
	.4byte 0x08400f49
