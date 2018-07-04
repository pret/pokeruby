#define rgb(red, green, blue) (((blue)<<10)|((green)<<5)|(red))

#include "constants/battle_anim.h"
#include "constants/moves.h"
#include "constants/songs.h"
	.include "include/macros.inc"
	.include "include/macros/battle_anim.inc"
	.include "constants/constants.inc"


	.section script_data, "aw", %progbits

gSingingMoves:: @ 81C7160
	.2byte MOVE_SING
	.2byte MOVE_PERISH_SONG
	.2byte MOVE_GRASS_WHISTLE
	.2byte -1

	.align 2
gBattleAnims_Moves:: @ 81C7168
	.4byte Move_POUND
	.4byte Move_POUND
	.4byte Move_KARATE_CHOP
	.4byte Move_DOUBLE_SLAP
	.4byte Move_COMET_PUNCH
	.4byte Move_MEGA_PUNCH
	.4byte Move_PAY_DAY
	.4byte Move_FIRE_PUNCH
	.4byte Move_ICE_PUNCH
	.4byte Move_THUNDER_PUNCH
	.4byte Move_SCRATCH
	.4byte Move_VICE_GRIP
	.4byte Move_GUILLOTINE
	.4byte Move_RAZOR_WIND
	.4byte Move_SWORDS_DANCE
	.4byte Move_CUT
	.4byte Move_GUST
	.4byte Move_WING_ATTACK
	.4byte Move_WHIRLWIND
	.4byte Move_FLY
	.4byte Move_BIND
	.4byte Move_SLAM
	.4byte Move_VINE_WHIP
	.4byte Move_STOMP
	.4byte Move_DOUBLE_KICK
	.4byte Move_MEGA_KICK
	.4byte Move_JUMP_KICK
	.4byte Move_ROLLING_KICK
	.4byte Move_SAND_ATTACK
	.4byte Move_HEADBUTT
	.4byte Move_HORN_ATTACK
	.4byte Move_FURY_ATTACK
	.4byte Move_HORN_DRILL
	.4byte Move_TACKLE
	.4byte Move_BODY_SLAM
	.4byte Move_WRAP
	.4byte Move_TAKE_DOWN
	.4byte Move_THRASH
	.4byte Move_DOUBLE_EDGE
	.4byte Move_TAIL_WHIP
	.4byte Move_POISON_STING
	.4byte Move_TWINEEDLE
	.4byte Move_PIN_MISSILE
	.4byte Move_LEER
	.4byte Move_BITE
	.4byte Move_GROWL
	.4byte Move_ROAR
	.4byte Move_SING
	.4byte Move_SUPERSONIC
	.4byte Move_SONIC_BOOM
	.4byte Move_DISABLE
	.4byte Move_ACID
	.4byte Move_EMBER
	.4byte Move_FLAMETHROWER
	.4byte Move_MIST
	.4byte Move_WATER_GUN
	.4byte Move_HYDRO_PUMP
	.4byte Move_SURF
	.4byte Move_ICE_BEAM
	.4byte Move_BLIZZARD
	.4byte Move_PSYBEAM
	.4byte Move_BUBBLE_BEAM
	.4byte Move_AURORA_BEAM
	.4byte Move_HYPER_BEAM
	.4byte Move_PECK
	.4byte Move_DRILL_PECK
	.4byte Move_SUBMISSION
	.4byte Move_LOW_KICK
	.4byte Move_COUNTER
	.4byte Move_SEISMIC_TOSS
	.4byte Move_STRENGTH
	.4byte Move_ABSORB
	.4byte Move_MEGA_DRAIN
	.4byte Move_LEECH_SEED
	.4byte Move_GROWTH
	.4byte Move_RAZOR_LEAF
	.4byte Move_SOLAR_BEAM
	.4byte Move_POISON_POWDER
	.4byte Move_STUN_SPORE
	.4byte Move_SLEEP_POWDER
	.4byte Move_PETAL_DANCE
	.4byte Move_STRING_SHOT
	.4byte Move_DRAGON_RAGE
	.4byte Move_FIRE_SPIN
	.4byte Move_THUNDER_SHOCK
	.4byte Move_THUNDERBOLT
	.4byte Move_THUNDER_WAVE
	.4byte Move_THUNDER
	.4byte Move_ROCK_THROW
	.4byte Move_EARTHQUAKE
	.4byte Move_FISSURE
	.4byte Move_DIG
	.4byte Move_TOXIC
	.4byte Move_CONFUSION
	.4byte Move_PSYCHIC
	.4byte Move_HYPNOSIS
	.4byte Move_MEDITATE
	.4byte Move_AGILITY
	.4byte Move_QUICK_ATTACK
	.4byte Move_RAGE
	.4byte Move_TELEPORT
	.4byte Move_NIGHT_SHADE
	.4byte Move_MIMIC
	.4byte Move_SCREECH
	.4byte Move_DOUBLE_TEAM
	.4byte Move_RECOVER
	.4byte Move_HARDEN
	.4byte Move_MINIMIZE
	.4byte Move_SMOKESCREEN
	.4byte Move_CONFUSE_RAY
	.4byte Move_WITHDRAW
	.4byte Move_DEFENSE_CURL
	.4byte Move_BARRIER
	.4byte Move_LIGHT_SCREEN
	.4byte Move_HAZE
	.4byte Move_REFLECT
	.4byte Move_FOCUS_ENERGY
	.4byte Move_BIDE
	.4byte Move_METRONOME
	.4byte Move_POUND
	.4byte Move_SELF_DESTRUCT
	.4byte Move_EGG_BOMB
	.4byte Move_LICK
	.4byte Move_SMOG
	.4byte Move_SLUDGE
	.4byte Move_BONE_CLUB
	.4byte Move_FIRE_BLAST
	.4byte Move_WATERFALL
	.4byte Move_CLAMP
	.4byte Move_SWIFT
	.4byte Move_SKULL_BASH
	.4byte Move_SPIKE_CANNON
	.4byte Move_CONSTRICT
	.4byte Move_AMNESIA
	.4byte Move_KINESIS
	.4byte Move_SOFT_BOILED
	.4byte Move_HI_JUMP_KICK
	.4byte Move_GLARE
	.4byte Move_DREAM_EATER
	.4byte Move_POISON_GAS
	.4byte Move_BARRAGE
	.4byte Move_LEECH_LIFE
	.4byte Move_LOVELY_KISS
	.4byte Move_SKY_ATTACK
	.4byte Move_TRANSFORM
	.4byte Move_BUBBLE
	.4byte Move_DIZZY_PUNCH
	.4byte Move_SPORE
	.4byte Move_FLASH
	.4byte Move_PSYWAVE
	.4byte Move_SPLASH
	.4byte Move_ACID_ARMOR
	.4byte Move_CRABHAMMER
	.4byte Move_EXPLOSION
	.4byte Move_FURY_SWIPES
	.4byte Move_BONEMERANG
	.4byte Move_REST
	.4byte Move_ROCK_SLIDE
	.4byte Move_HYPER_FANG
	.4byte Move_SHARPEN
	.4byte Move_CONVERSION
	.4byte Move_TRI_ATTACK
	.4byte Move_SUPER_FANG
	.4byte Move_SLASH
	.4byte Move_SUBSTITUTE
	.4byte Move_STRUGGLE
	.4byte Move_SKETCH
	.4byte Move_TRIPLE_KICK
	.4byte Move_THIEF
	.4byte Move_SPIDER_WEB
	.4byte Move_MIND_READER
	.4byte Move_NIGHTMARE
	.4byte Move_FLAME_WHEEL
	.4byte Move_SNORE
	.4byte Move_CURSE
	.4byte Move_FLAIL
	.4byte Move_CONVERSION_2
	.4byte Move_AEROBLAST
	.4byte Move_COTTON_SPORE
	.4byte Move_REVERSAL
	.4byte Move_SPITE
	.4byte Move_POWDER_SNOW
	.4byte Move_PROTECT
	.4byte Move_MACH_PUNCH
	.4byte Move_SCARY_FACE
	.4byte Move_FAINT_ATTACK
	.4byte Move_SWEET_KISS
	.4byte Move_BELLY_DRUM
	.4byte Move_SLUDGE_BOMB
	.4byte Move_MUD_SLAP
	.4byte Move_OCTAZOOKA
	.4byte Move_SPIKES
	.4byte Move_ZAP_CANNON
	.4byte Move_FORESIGHT
	.4byte Move_DESTINY_BOND
	.4byte Move_PERISH_SONG
	.4byte Move_ICY_WIND
	.4byte Move_DETECT
	.4byte Move_BONE_RUSH
	.4byte Move_LOCK_ON
	.4byte Move_OUTRAGE
	.4byte Move_SANDSTORM
	.4byte Move_GIGA_DRAIN
	.4byte Move_ENDURE
	.4byte Move_CHARM
	.4byte Move_ROLLOUT
	.4byte Move_FALSE_SWIPE
	.4byte Move_SWAGGER
	.4byte Move_MILK_DRINK
	.4byte Move_SPARK
	.4byte Move_FURY_CUTTER
	.4byte Move_STEEL_WING
	.4byte Move_MEAN_LOOK
	.4byte Move_ATTRACT
	.4byte Move_SLEEP_TALK
	.4byte Move_HEAL_BELL
	.4byte Move_RETURN
	.4byte Move_PRESENT
	.4byte Move_FRUSTRATION
	.4byte Move_SAFEGUARD
	.4byte Move_PAIN_SPLIT
	.4byte Move_SACRED_FIRE
	.4byte Move_MAGNITUDE
	.4byte Move_DYNAMIC_PUNCH
	.4byte Move_MEGAHORN
	.4byte Move_DRAGON_BREATH
	.4byte Move_BATON_PASS
	.4byte Move_ENCORE
	.4byte Move_PURSUIT
	.4byte Move_RAPID_SPIN
	.4byte Move_SWEET_SCENT
	.4byte Move_IRON_TAIL
	.4byte Move_METAL_CLAW
	.4byte Move_VITAL_THROW
	.4byte Move_MORNING_SUN
	.4byte Move_SYNTHESIS
	.4byte Move_MOONLIGHT
	.4byte Move_HIDDEN_POWER
	.4byte Move_CROSS_CHOP
	.4byte Move_TWISTER
	.4byte Move_RAIN_DANCE
	.4byte Move_SUNNY_DAY
	.4byte Move_CRUNCH
	.4byte Move_MIRROR_COAT
	.4byte Move_PSYCH_UP
	.4byte Move_EXTREME_SPEED
	.4byte Move_ANCIENT_POWER
	.4byte Move_SHADOW_BALL
	.4byte Move_FUTURE_SIGHT
	.4byte Move_ROCK_SMASH
	.4byte Move_WHIRLPOOL
	.4byte Move_BEAT_UP
	.4byte Move_FAKE_OUT
	.4byte Move_UPROAR
	.4byte Move_STOCKPILE
	.4byte Move_SPIT_UP
	.4byte Move_SWALLOW
	.4byte Move_HEAT_WAVE
	.4byte Move_HAIL
	.4byte Move_TORMENT
	.4byte Move_FLATTER
	.4byte Move_WILL_O_WISP
	.4byte Move_MEMENTO
	.4byte Move_FACADE
	.4byte Move_FOCUS_PUNCH
	.4byte Move_SMELLING_SALT
	.4byte Move_FOLLOW_ME
	.4byte Move_ANCIENT_POWER
	.4byte Move_CHARGE
	.4byte Move_TAUNT
	.4byte Move_HELPING_HAND
	.4byte Move_TRICK
	.4byte Move_ROLE_PLAY
	.4byte Move_WISH
	.4byte Move_ASSIST
	.4byte Move_INGRAIN
	.4byte Move_SUPERPOWER
	.4byte Move_MAGIC_COAT
	.4byte Move_RECYCLE
	.4byte Move_REVENGE
	.4byte Move_BRICK_BREAK
	.4byte Move_YAWN
	.4byte Move_KNOCK_OFF
	.4byte Move_ENDEAVOR
	.4byte Move_ERUPTION
	.4byte Move_SKILL_SWAP
	.4byte Move_IMPRISON
	.4byte Move_REFRESH
	.4byte Move_GRUDGE
	.4byte Move_SNATCH
	.4byte Move_SECRET_POWER
	.4byte Move_DIVE
	.4byte Move_ARM_THRUST
	.4byte Move_CAMOUFLAGE
	.4byte Move_TAIL_GLOW
	.4byte Move_LUSTER_PURGE
	.4byte Move_MIST_BALL
	.4byte Move_FEATHER_DANCE
	.4byte Move_TEETER_DANCE
	.4byte Move_BLAZE_KICK
	.4byte Move_MUD_SPORT
	.4byte Move_ICE_BALL
	.4byte Move_NEEDLE_ARM
	.4byte Move_SLACK_OFF
	.4byte Move_HYPER_VOICE
	.4byte Move_POISON_FANG
	.4byte Move_CRUSH_CLAW
	.4byte Move_BLAST_BURN
	.4byte Move_HYDRO_CANNON
	.4byte Move_METEOR_MASH
	.4byte Move_ASTONISH
	.4byte Move_WEATHER_BALL
	.4byte Move_AROMATHERAPY
	.4byte Move_FAKE_TEARS
	.4byte Move_AIR_CUTTER
	.4byte Move_OVERHEAT
	.4byte Move_ODOR_SLEUTH
	.4byte Move_ROCK_TOMB
	.4byte Move_SILVER_WIND
	.4byte Move_METAL_SOUND
	.4byte Move_GRASS_WHISTLE
	.4byte Move_TICKLE
	.4byte Move_COSMIC_POWER
	.4byte Move_WATER_SPOUT
	.4byte Move_SIGNAL_BEAM
	.4byte Move_SHADOW_PUNCH
	.4byte Move_EXTRASENSORY
	.4byte Move_SKY_UPPERCUT
	.4byte Move_SAND_TOMB
	.4byte Move_SHEER_COLD
	.4byte Move_MUDDY_WATER
	.4byte Move_BULLET_SEED
	.4byte Move_AERIAL_ACE
	.4byte Move_ICICLE_SPEAR
	.4byte Move_IRON_DEFENSE
	.4byte Move_BLOCK
	.4byte Move_HOWL
	.4byte Move_DRAGON_CLAW
	.4byte Move_FRENZY_PLANT
	.4byte Move_BULK_UP
	.4byte Move_BOUNCE
	.4byte Move_MUD_SHOT
	.4byte Move_POISON_TAIL
	.4byte Move_COVET
	.4byte Move_VOLT_TACKLE
	.4byte Move_MAGICAL_LEAF
	.4byte Move_WATER_SPORT
	.4byte Move_CALM_MIND
	.4byte Move_LEAF_BLADE
	.4byte Move_DRAGON_DANCE
	.4byte Move_ROCK_BLAST
	.4byte Move_SHOCK_WAVE
	.4byte Move_WATER_PULSE
	.4byte Move_DOOM_DESIRE
	.4byte Move_PSYCHO_BOOST
	.4byte PoundCopy

	.align 2
gBattleAnims_StatusConditions:: @ 81C76F8
	.4byte StatusCondition_Poison
	.4byte StatusCondition_Confusion
	.4byte StatusCondition_Burn
	.4byte StatusCondition_Love
	.4byte StatusCondition_Sleep
	.4byte StatusCondition_Paralysis
	.4byte StatusCondition_Ice
	.4byte StatusCondition_Curse
	.4byte StatusCondition_Nightmare

	.align 2
gBattleAnims_General:: @ 81C771C
	.4byte General_CastformChange
	.4byte General_StatsChange
	.4byte General_SubstituteFade
	.4byte General_SubstituteAppear
	.4byte General_PokeblockThrow
	.4byte General_ItemKnockoff
	.4byte General_TurnTrap
	.4byte General_ItemEffect
	.4byte General_SmokeballEscape
	.4byte General_HangedOn
	.4byte General_Rain
	.4byte General_Sun
	.4byte General_Sandstorm
	.4byte General_Hail
	.4byte General_LeechSeedDrain
	.4byte General_MonHit
	.4byte General_ItemSteal
	.4byte General_SnatchMove
	.4byte General_FutureSightHit
	.4byte General_DoomDesireHit
	.4byte General_FocusPunchSetUp
	.4byte General_IngrainHeal
	.4byte General_WishHeal

	.align 2
gBattleAnims_Special:: @ 81C7778
	.4byte Special_LevelUp
	.4byte Special_SwitchOutPlayerMon
	.4byte Special_SwitchOutOpponentMon
	.4byte Special_BallThrow
	.4byte Special_SafariBallThrow
	.4byte Special_SubstituteToMon
	.4byte Special_MonToSubstitute

Move_POUND: @ 81C7794
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_DOUBLE_SLAP: @ 81C77C5
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	choosetwoturnanim Move_DOUBLE_SLAP_FirstHit, Move_DOUBLE_SLAP_SecondHit
Move_DOUBLE_SLAP_End:
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W003, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end
Move_DOUBLE_SLAP_FirstHit:
	createsprite gBasicHitSplatSpriteTemplate, 2, -8, 0, 1, 2
	goto Move_DOUBLE_SLAP_End
Move_DOUBLE_SLAP_SecondHit:
	createsprite gBasicHitSplatSpriteTemplate, 2, 8, 0, 1, 2
	goto Move_DOUBLE_SLAP_End

Move_POISON_POWDER: @ 81C7818
	loadspritegfx 10065
	loadspritegfx 10150
	loopsewithpan SE_W077, 63, 10, 6
	createsprite gPoisonPowderParticleSpriteTemplate, 130, -30, -22, 117, 80, 5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, 130, 10, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, 130, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gPoisonPowderParticleSpriteTemplate, 130, -5, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, 130, 5, -22, 117, 96, 5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, 130, 0, -22, 117, 69, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, 130, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gPoisonPowderParticleSpriteTemplate, 130, -15, -22, 117, 112, 5, 2
	createsprite gPoisonPowderParticleSpriteTemplate, 130, 15, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, 130, -10, -22, 117, 96, 7, 2
	createsprite gPoisonPowderParticleSpriteTemplate, 130, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gPoisonPowderParticleSpriteTemplate, 130, -10, -22, 117, 80, -5, 1
	createsprite gPoisonPowderParticleSpriteTemplate, 130, 0, -22, 117, 89, 5, 2
	createsprite gPoisonPowderParticleSpriteTemplate, 130, 20, -22, 117, 112, -8, 2
	createsprite gPoisonPowderParticleSpriteTemplate, 130, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_STUN_SPORE: @ 81C7949
	loadspritegfx 10068
	loopsewithpan SE_W077, 63, 10, 6
	createsprite gStunSporeParticleSpriteTemplate, 130, -30, -22, 117, 80, 5, 1
	createsprite gStunSporeParticleSpriteTemplate, 130, 10, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, 130, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gStunSporeParticleSpriteTemplate, 130, -5, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, 130, 5, -22, 117, 96, 5, 1
	createsprite gStunSporeParticleSpriteTemplate, 130, 0, -22, 117, 69, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, 130, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gStunSporeParticleSpriteTemplate, 130, -15, -22, 117, 112, 5, 2
	createsprite gStunSporeParticleSpriteTemplate, 130, 15, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, 130, -10, -22, 117, 96, 7, 2
	createsprite gStunSporeParticleSpriteTemplate, 130, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gStunSporeParticleSpriteTemplate, 130, -10, -22, 117, 80, -5, 1
	createsprite gStunSporeParticleSpriteTemplate, 130, 0, -22, 117, 89, 5, 2
	createsprite gStunSporeParticleSpriteTemplate, 130, 20, -22, 117, 112, -8, 2
	createsprite gStunSporeParticleSpriteTemplate, 130, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_SLEEP_POWDER: @ 81C7A77
	loadspritegfx 10067
	loopsewithpan SE_W077, 63, 10, 6
	createsprite gSleepPowderParticleSpriteTemplate, 130, -30, -22, 117, 80, 5, 1
	createsprite gSleepPowderParticleSpriteTemplate, 130, 10, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, 130, -25, -22, 117, 112, 5, 3
	delay 15
	createsprite gSleepPowderParticleSpriteTemplate, 130, -5, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, 130, 5, -22, 117, 96, 5, 1
	createsprite gSleepPowderParticleSpriteTemplate, 130, 0, -22, 117, 69, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, 130, -15, -22, 117, 112, 5, 2
	delay 30
	createsprite gSleepPowderParticleSpriteTemplate, 130, -15, -22, 117, 112, 5, 2
	createsprite gSleepPowderParticleSpriteTemplate, 130, 15, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, 130, -10, -22, 117, 96, 7, 2
	createsprite gSleepPowderParticleSpriteTemplate, 130, -5, -22, 117, 90, -8, 0
	delay 20
	createsprite gSleepPowderParticleSpriteTemplate, 130, -10, -22, 117, 80, -5, 1
	createsprite gSleepPowderParticleSpriteTemplate, 130, 0, -22, 117, 89, 5, 2
	createsprite gSleepPowderParticleSpriteTemplate, 130, 20, -22, 117, 112, -8, 2
	createsprite gSleepPowderParticleSpriteTemplate, 130, 5, -22, 117, 80, 5, 1
	waitforvisualfinish
	end

Move_SWIFT: @ 81C7BA5
	loadspritegfx 10174
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, 131, 20, -10, 20, 0, 22, 20, 1
	delay 5
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, 131, 20, -10, 20, 5, 22, -18, 1
	delay 5
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, 131, 20, -10, 20, -10, 22, 15, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 18, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_DEF_PARTNER, 2, 0, 18, 1
	delay 5
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, 131, 20, -10, 20, 0, 22, -20, 1
	delay 5
	playsewithpan SE_W129, 192
	createsprite gSwiftStarSpriteTemplate, 131, 20, -10, 20, 0, 22, 12, 1
	delay 5
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_STRENGTH: @ 81C7C5E
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_ShakeAndSinkMon, 5, ANIM_BANK_ATTACKER, 2, 0, 96, 30
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 4
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_TARGET, 18, 6, 2, 4
	delay 4
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 16, 12, 1, 1
	delay 4
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, -16, -12, 1, 1
	delay 4
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 3, 4, 1, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_TACKLE: @ 81C7CF2
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W004, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_BODY_SLAM: @ 81C7D30
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W036, 192
	createsprite gVerticalDipSpriteTemplate, 2, 6, 1, ANIM_BANK_ATTACKER
	waitforvisualfinish
	delay 11
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 26, 0, 0, 5
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 4, -10, 0, 1, 0
	loopsewithpan SE_W025B, 63, 10, 2
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -28, 0, 0, 3
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 4, 0, 12, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 6
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_SUPERSONIC: @ 81C7DBD
	loadspritegfx 10163
	monbg ANIM_BANK_ATK_PARTNER
	monbgprio_2A ANIM_BANK_ATTACKER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 2, 0, 8, 1
	call Move_SUPERSONIC_CreateWaveSprite
	call Move_SUPERSONIC_CreateWaveSprite
	call Move_SUPERSONIC_CreateWaveSprite
	call Move_SUPERSONIC_CreateWaveSprite
	call Move_SUPERSONIC_CreateWaveSprite
	call Move_SUPERSONIC_CreateWaveSprite
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	end
Move_SUPERSONIC_CreateWaveSprite:
	playsewithpan SE_W048, 192
	createsprite gSupersonicWaveSpriteTemplate, 130, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_SCREECH: @ 81C7E15
	loadspritegfx 10164
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 3, 0, 2, 1
	call Move_SCREECH_CreateWaveSprite
	call Move_SCREECH_CreateWaveSprite
	delay 16
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 2048, 2, 1
	waitforvisualfinish
	end
Move_SCREECH_CreateWaveSprite:
	playsewithpan SE_W103, 192
	createsprite gScreechWaveSpriteTemplate, 130, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_FLAME_WHEEL: @ 81C7E62
	loadspritegfx 10029
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	createsprite gBattleAnimSpriteTemplate_83D9694, 3, 0, 0, 56, 0
	playsewithpan SE_W172, 192
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9694, 3, 0, 0, 56, 4
	playsewithpan SE_W172, 192
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9694, 3, 0, 0, 56, 8
	playsewithpan SE_W172, 192
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9694, 3, 0, 0, 56, 12
	playsewithpan SE_W172, 192
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9694, 3, 0, 0, 56, 16
	playsewithpan SE_W172, 192
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9694, 3, 0, 0, 56, 20
	playsewithpan SE_W172, 192
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9694, 3, 0, 0, 56, 24
	playsewithpan SE_W172, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 24, 0, 0, 6
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 8, 1
	createvisualtask AnimTask_BlendMonInAndOut, 3, ANIM_BANK_TARGET, 31, 12, 1, 1
	playsewithpan SE_W172B, 63
	call _81D11A2
	delay 7
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 9
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Unknown_81C7F4C: @ 81C7F4C
	createsprite gBattleAnimSpriteTemplate_83D9694, 3, 0, 0, 50
	delay 4
	return

Move_PIN_MISSILE: @ 81C7F5C
	loadspritegfx 10161
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W026, 192
	createsprite gPinMissileSpriteTemplate, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gPinMissileSpriteTemplate, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, -8, -8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 2, 1
	delay 9
	createsprite gPinMissileSpriteTemplate, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 2, 1
	delay 14
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_ICICLE_SPEAR: @ 81C8021
	loadspritegfx 10262
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W196, 192
	createsprite gIcicleSpearSpriteTemplate, 2, 20, -8, -8, -8, 20, -32
	delay 15
	createsprite gIcicleSpearSpriteTemplate, 2, 20, -8, 8, 8, 20, -40
	delay 4
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, -8, -8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 2, 1
	delay 9
	createsprite gIcicleSpearSpriteTemplate, 2, 20, -8, 0, 0, 20, -32
	delay 4
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 2, 1
	delay 14
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_TAKE_DOWN: @ 81C80E6
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_WindUpLunge, 5, ANIM_BANK_ATTACKER, -24, 8, 23, 10, 40, 10
	delay 35
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 0, 10, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, 4, -10, 0, 1, 0
	playsewithpan SE_W025B, 63
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -16, 0, 0, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 4, 0, 12, 1
	waitforvisualfinish
	delay 2
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_DOUBLE_EDGE: @ 81C817A
	loadspritegfx 10135
	playsewithpan SE_W129, 192
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 2, 4, 2, 32767, 10, 0, 0
	waitforvisualfinish
	delay 10
	playsewithpan SE_W207, 192
	waitplaysewithpan SE_W207, 192, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 18, 6, 2, 4
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 0, 16, 16, rgb(31, 31, 31)
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 20, 0, 0, 4
	delay 3
	waitforvisualfinish
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, 132, -10, 0, 1, 0
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -32, 0, 0, 3
	waitforvisualfinish
	createvisualtask sub_80A8E04, 2, 8, -256, 0, 0
	createvisualtask sub_80A8E04, 2, 8, -256, 1, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 4, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 4, 0, 12, 1
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 16, 0, rgb(31, 31, 31)
	waitforvisualfinish
	createvisualtask sub_80A8E04, 2, 8, -256, 0, 1
	createvisualtask sub_80A8E04, 2, 8, -256, 1, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 5
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 7
	waitforvisualfinish
	end

Move_POISON_STING: @ 81C828D
	loadspritegfx 10161
	loadspritegfx 10135
	loadspritegfx 10150
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W013B, 192
	createsprite gLinearStingerSpriteTemplate, 130, 20, 0, -8, 0, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 5, 1
	playsewithpan SE_W030, 63
	waitforvisualfinish
	call PoisonBubblesAnim
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_TWINEEDLE: @ 81C82E2
	loadspritegfx 10161
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	loopsewithpan SE_W013B, 192, 6, 2
	createsprite gLinearStingerSpriteTemplate, 130, 10, -4, 0, -4, 20
	createsprite gLinearStingerSpriteTemplate, 130, 20, 12, 10, 12, 20
	delay 20
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 5, 1
	createsprite gBattleAnimSpriteTemplate_83DB4C0, 3, 0, -4, 1, 3
	loopsewithpan SE_W030, 63, 5, 2
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB4C0, 3, 10, 12, 1, 3
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_FIRE_BLAST: @ 81C8355
	loadspritegfx 10029
	createsoundtask sub_812AF30, 144, 145
	call Move_FIRE_BLAST_CreateFireRing
	call Move_FIRE_BLAST_CreateFireRing
	call Move_FIRE_BLAST_CreateFireRing
	delay 24
	createvisualtask sub_80E2A38, 10, 1, 3, 0, 8, 0
	waitforvisualfinish
	delay 19
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 20, 1
	call Move_FIRE_BLAST_CreateFireCross
	delay 3
	call Move_FIRE_BLAST_CreateFireCross
	delay 3
	call Move_FIRE_BLAST_CreateFireCross
	delay 3
	call Move_FIRE_BLAST_CreateFireCross
	delay 3
	call Move_FIRE_BLAST_CreateFireCross
	delay 3
	call Move_FIRE_BLAST_CreateFireCross
	delay 3
	call Move_FIRE_BLAST_CreateFireCross
	delay 3
	call Move_FIRE_BLAST_CreateFireCross
	delay 3
	call Move_FIRE_BLAST_CreateFireCross
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 1, 2, 8, 0, 0
	waitforvisualfinish
	end
Move_FIRE_BLAST_CreateFireRing:
	createsprite gFireRingSpriteTemplate, 130, 0, 0, 0
	createsprite gFireRingSpriteTemplate, 130, 0, 0, 51
	createsprite gFireRingSpriteTemplate, 130, 0, 0, 102
	createsprite gFireRingSpriteTemplate, 130, 0, 0, 153
	createsprite gFireRingSpriteTemplate, 130, 0, 0, 204
	delay 5
	return
Move_FIRE_BLAST_CreateFireCross:
	createsprite gFireCrossSpriteTemplate, 130, 0, 0, 10, 0, -2
	createsprite gFireCrossSpriteTemplate, 130, 0, 0, 13, -2, 0
	createsprite gFireCrossSpriteTemplate, 130, 0, 0, 13, 2, 0
	createsprite gFireCrossSpriteTemplate, 130, 0, 0, 15, -2, 2
	createsprite gFireCrossSpriteTemplate, 130, 0, 0, 15, 2, 2
	return

Move_LEECH_SEED: @ 81C8483
	loadspritegfx 10006
	playsewithpan SE_W077, 192
	createsprite gLeechSeedSpriteTemplate, 130, 15, 0, 0, 24, 35, -32
	delay 8
	playsewithpan SE_W077, 192
	createsprite gLeechSeedSpriteTemplate, 130, 15, 0, -16, 24, 35, -40
	delay 8
	playsewithpan SE_W077, 192
	createsprite gLeechSeedSpriteTemplate, 130, 15, 0, 16, 24, 35, -37
	delay 12
	loopsewithpan SE_W039, 63, 10, 8
	waitforvisualfinish
	end

Move_EMBER: @ 81C84D9
	loadspritegfx 10029
	loopsewithpan SE_W052, 192, 5, 2
	createsprite gEmberSpriteTemplate, 130, 20, 0, -16, 24, 20, 1
	delay 4
	createsprite gEmberSpriteTemplate, 130, 20, 0, 0, 24, 20, 1
	delay 4
	createsprite gEmberSpriteTemplate, 130, 20, 0, 16, 24, 20, 1
	delay 16
	playsewithpan SE_W172, 63
	call Move_EMBER_CreateFlare
	call Move_EMBER_CreateFlare
	call Move_EMBER_CreateFlare
	end
Move_EMBER_CreateFlare:
	createsprite gEmberFlareSpriteTemplate, 130, -24, 24, 24, 24, 20, 1, 1
	delay 4
	return

Move_MEGA_PUNCH: @ 81C854D
	loadspritegfx 10135
	loadspritegfx 10143
	monbg ANIM_BANK_TARGET
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 0, 0, 16, rgb(0, 0, 0)
	setalpha 12, 8
	playsewithpan SE_W025, 63
	createsprite gMegaPunchKickSpriteTemplate, 3, 0, 0, 0, 50
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 7, 32767
	delay 50
	call _81C85E9
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 22, 1
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 0, 32767
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 0, 8, 0, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end
_81C85E9:
	delay 2
	createvisualtask sub_80E4200, 2
	jumpargeq 7, 1, _81C8620
	createvisualtask sub_812C924, 2
	jumpargeq 7, 0, _81C8612
	jumpargeq 7, 1, _81C8619
_81C8611:
	return
_81C8612:
	changebg 4
	goto _81C8611
_81C8619:
	changebg 5
	goto _81C8611
_81C8620:
	changebg 6
	goto _81C8611

Move_MEGA_KICK: @ 81C8627
	loadspritegfx 10135
	loadspritegfx 10143
	monbg ANIM_BANK_TARGET
	delay 2
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 0, 0, 16, rgb(0, 0, 0)
	setalpha 12, 8
	playsewithpan SE_W025, 63
	createsprite gMegaPunchKickSpriteTemplate, 3, 0, 0, 1, 50
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 7, 32767
	delay 50
	playsewithpan SE_W025B, 63
	call _81C85E9
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 22, 1
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 0, 32767
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 0, 8, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	delay 2
	restorebg
	waitbgfadein
	end

Move_COMET_PUNCH: @ 81C86C3
	loadspritegfx 10135
	loadspritegfx 10143
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	choosetwoturnanim Move_COMET_PUNCH_Even, Move_COMET_PUNCH_Odd
Move_COMET_PUNCH_End:
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W004, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end
Move_COMET_PUNCH_Even:
	createsprite gBasicHitSplatSpriteTemplate, 2, -8, -8, 1, 2
	createsprite gFistFootSpriteTemplate, 3, -8, 0, 8, 1, 0
	goto Move_COMET_PUNCH_End
Move_COMET_PUNCH_Odd:
	createsprite gBasicHitSplatSpriteTemplate, 2, 8, -8, 1, 2
	createsprite gFistFootSpriteTemplate, 3, 8, 0, 8, 1, 0
	goto Move_COMET_PUNCH_End

Move_SONIC_BOOM: @ 81C873B
	loadspritegfx 10003
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	call Move_SONIC_BOOM_CreateBlast
	call Move_SONIC_BOOM_CreateBlast
	call Move_SONIC_BOOM_CreateBlast
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 10, 1
	call Move_SONIC_BOOM_CreateHitSplat
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
Move_SONIC_BOOM_CreateBlast:
	playsewithpan SE_W013B, 192
	createsprite gSonicBoomSpriteTemplate, 130, 16, 0, 0, 0, 15
	delay 4
	return
Move_SONIC_BOOM_CreateHitSplat:
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 2
	delay 4
	return

Move_THUNDER_SHOCK: @ 81C879C
	loadspritegfx 10001
	loadspritegfx 10011
	createvisualtask sub_80E2A38, 10, 1, 0, 0, 6, 0
	waitforvisualfinish
	delay 10
	createvisualtask sub_80D681C, 5, 0, -44, 0
	playsewithpan SE_W085, 63
	delay 9
	createvisualtask sub_80E2A38, 10, 4, 0, 0, 13, 0
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 4, 0, 13, 0, 0
	waitforvisualfinish
	delay 20
	call ElectricityEffect
	waitforvisualfinish
	delay 20
	createvisualtask sub_80E2A38, 10, 1, 0, 6, 0, 0
	waitforvisualfinish
	end

Move_THUNDERBOLT: @ 81C880A
	loadspritegfx 10001
	loadspritegfx 10282
	loadspritegfx 10011
	createvisualtask sub_80E2A38, 10, 1, 0, 0, 6, 0
	waitforvisualfinish
	delay 10
	createvisualtask sub_80D681C, 5, 24, -52, 0
	playsewithpan SE_W085, 63
	delay 7
	createvisualtask sub_80D681C, 5, -24, -52, 0
	playsewithpan SE_W085, 63
	delay 7
	createvisualtask sub_80D681C, 5, 0, -60, 1
	playsewithpan SE_W085, 63
	delay 9
	createvisualtask sub_80E2A38, 10, 4, 0, 0, 13, 0
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 4, 0, 13, 0, 0
	waitforvisualfinish
	delay 20
	createsprite gBattleAnimSpriteTemplate_83D98F0, 131, 44, 0, 0, 3
	createsprite gBattleAnimSpriteTemplate_83D9908, 132, 0, 0, 32, 44, 0, 40, 0, -32765
	createsprite gBattleAnimSpriteTemplate_83D9908, 132, 0, 0, 32, 44, 64, 40, 1, -32765
	createsprite gBattleAnimSpriteTemplate_83D9908, 132, 0, 0, 32, 44, 128, 40, 0, -32765
	createsprite gBattleAnimSpriteTemplate_83D9908, 132, 0, 0, 32, 44, 192, 40, 2, -32765
	createsprite gBattleAnimSpriteTemplate_83D9908, 132, 0, 0, 16, 44, 32, 40, 0, -32765
	createsprite gBattleAnimSpriteTemplate_83D9908, 132, 0, 0, 16, 44, 96, 40, 1, -32765
	createsprite gBattleAnimSpriteTemplate_83D9908, 132, 0, 0, 16, 44, 160, 40, 0, -32765
	createsprite gBattleAnimSpriteTemplate_83D9908, 132, 0, 0, 16, 44, 224, 40, 2, -32765
	playsewithpan SE_W063, 63
	delay 0
	createvisualtask sub_80E2A38, 10, 1, 0, 2, 2, 0
	delay 6
	createvisualtask sub_80E2A38, 10, 1, 0, 6, 6, 0
	delay 6
	createvisualtask sub_80E2A38, 10, 1, 0, 2, 2, 0
	delay 6
	createvisualtask sub_80E2A38, 10, 1, 0, 6, 6, 0
	waitforvisualfinish
	delay 20
	waitplaysewithpan SE_W085B, 63, 19
	call ElectricityEffect
	waitforvisualfinish
	delay 20
	createvisualtask sub_80E2A38, 10, 1, 0, 6, 0, 0
	waitforvisualfinish
	end

Move_THUNDER_WAVE: @ 81C89C0
	loadspritegfx 10001
	loadspritegfx 10011
	loadspritegfx 10173
	createvisualtask sub_80E2A38, 10, 1, 0, 0, 6, 0
	waitforvisualfinish
	delay 10
	createvisualtask sub_80D681C, 5, 0, -48, 0
	playsewithpan SE_W086, 63
	delay 20
	loopsewithpan SE_W085B, 63, 10, 4
	createsprite gBattleAnimSpriteTemplate_83D9950, 130, -16, -16
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9950, 130, -16, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9950, 130, -16, 16
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 1, 0, 6, 0, 0
	waitforvisualfinish
	end

Move_BEAT_UP: @ 81C8A2F
	loadspritegfx 10135
	loadspritegfx 10143
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	choosetwoturnanim Move_BEAT_UP_Even, Move_BEAT_UP_Odd
Move_BEAT_UP_End:
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end
Move_BEAT_UP_Even:
	createsprite gBasicHitSplatSpriteTemplate, 130, -20, -20, 1, 2
	createsprite gFistFootSpriteTemplate, 131, -20, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 130, 8, 0, 1, 2
	createsprite gFistFootSpriteTemplate, 131, 8, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	goto Move_BEAT_UP_End
Move_BEAT_UP_Odd:
	createsprite gBasicHitSplatSpriteTemplate, 130, 12, -20, 1, 2
	createsprite gFistFootSpriteTemplate, 131, 12, -12, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 130, -12, 0, 1, 2
	createsprite gFistFootSpriteTemplate, 131, -12, 8, 8, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	goto Move_BEAT_UP_End

Move_STOMP: @ 81C8B2A
	loadspritegfx 10143
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W104, 63
	createsprite gStompFootSpriteTemplate, 3, 0, -32, 15
	delay 19
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, -8, 1, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 4, 9, 1
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_TAIL_WHIP: @ 81C8B71
	loopsewithpan SE_W039, 192, 24, 3
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 12, 4, 2, 3
	waitforvisualfinish
	end

Move_CUT: @ 81C8B8A
	loadspritegfx 10138
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W015, 63
	createsprite gCuttingSliceSpriteTemplate, 2, 40, -32, 0
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	waitforvisualfinish
	end

Move_HIDDEN_POWER: @ 81C8BBC
	loadspritegfx 10217
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, ANIM_BANK_ATTACKER, 0
	waitforvisualfinish
	delay 30
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_BANK_ATTACKER, 20479, 12, 5, 1
	delay 4
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, ANIM_BANK_ATTACKER, 0
	playsewithpan SE_W179, 192
	createsprite gHiddenPowerOrbSpriteTemplate, 2, 26, 0
	createsprite gHiddenPowerOrbSpriteTemplate, 2, 26, 42
	createsprite gHiddenPowerOrbSpriteTemplate, 2, 26, 84
	createsprite gHiddenPowerOrbSpriteTemplate, 2, 26, 126
	createsprite gHiddenPowerOrbSpriteTemplate, 2, 26, 168
	createsprite gHiddenPowerOrbSpriteTemplate, 2, 26, 210
	delay 52
	setarg 7, -1
	playsewithpan SE_W115, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 11, ANIM_BANK_ATTACKER, 0
	createsprite gHiddenPowerOrbScatterSpriteTemplate, 130, 0
	createsprite gHiddenPowerOrbScatterSpriteTemplate, 130, 32
	createsprite gHiddenPowerOrbScatterSpriteTemplate, 130, 64
	createsprite gHiddenPowerOrbScatterSpriteTemplate, 130, 96
	createsprite gHiddenPowerOrbScatterSpriteTemplate, 130, 128
	createsprite gHiddenPowerOrbScatterSpriteTemplate, 130, 160
	createsprite gHiddenPowerOrbScatterSpriteTemplate, 130, 192
	createsprite gHiddenPowerOrbScatterSpriteTemplate, 130, 224
	end

Move_REVERSAL: @ 81C8CA5
	loadspritegfx 10236
	loadspritegfx 10143
	loadspritegfx 10135
	playsewithpan SE_W197, 192
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 3, 32767, 8, 0, 0
	waitforvisualfinish
	delay 30
	createvisualtask sub_80E1F8C, 2, 31, 3, 2, 0, 10, 32767
	delay 10
	playsewithpan SE_W179, 192
	createsprite gBattleAnimSpriteTemplate_8402738, 2, 26, 0
	createsprite gBattleAnimSpriteTemplate_8402738, 2, 26, 42
	createsprite gBattleAnimSpriteTemplate_8402738, 2, 26, 84
	createsprite gBattleAnimSpriteTemplate_8402738, 2, 26, 126
	createsprite gBattleAnimSpriteTemplate_8402738, 2, 26, 168
	createsprite gBattleAnimSpriteTemplate_8402738, 2, 26, 210
	waitforvisualfinish
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	delay 8
	playsewithpan SE_W233B, 63
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 32767, 8, 0, 0
	createsprite gFistFootSpriteTemplate, 132, 0, 0, 10, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 1
	createvisualtask sub_80A9058, 5, 0, 1, 8, 1, 0
	end

Move_PURSUIT: @ 81C8D80
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	fadetobg 1
	waitbgfadein
	delay 0
	setalpha 12, 8
	choosetwoturnanim _81C8D9F, _81C8DC8
_81C8D96:
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	delay 0
	restorebg
	waitbgfadein
	end
_81C8D9F:
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 2
	createvisualtask sub_80A9058, 5, 0, 1, 6, 1, 0
	goto _81C8D96
_81C8DC8:
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 1
	createvisualtask sub_80A9058, 5, 0, 1, 6, 1, 0
	goto _81C8D96

Move_SPIKE_CANNON: @ 81C8DF1
	loadspritegfx 10161
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_WindUpLunge, 5, ANIM_BANK_ATTACKER, -4, 0, 4, 6, 8, 4
	waitforvisualfinish
	loopsewithpan SE_W013B, 192, 5, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 5
	createsprite gLinearStingerSpriteTemplate, 2, 10, -8, -8, -8, 20
	createsprite gLinearStingerSpriteTemplate, 2, 18, 0, 0, 0, 20
	createsprite gLinearStingerSpriteTemplate, 2, 26, 8, 8, 8, 20
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DB4C0, 3, -8, -8, 1, 2
	createsprite gBattleAnimSpriteTemplate_83DB4C0, 3, 0, 0, 1, 2
	createsprite gBattleAnimSpriteTemplate_83DB4C0, 3, 8, 8, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 7, 1
	loopsewithpan SE_W030, 63, 5, 3
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_SWORDS_DANCE: @ 81C8EA4
	loadspritegfx 10005
	monbg ANIM_BANK_ATTACKER
	setalpha 12, 8
	playsewithpan SE_W014, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 16, 6, 1, 4
	createsprite gBattleAnimSpriteTemplate_83D748C, 2, 0, 0
	delay 22
	createvisualtask sub_80E21A8, 2, 10005, 2, 2, 32754, 16, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	blendoff
	delay 1
	end

Move_PSYCH_UP: @ 81C8EEA
	loadspritegfx 10196
	monbg ANIM_BANK_ATK_PARTNER
	createvisualtask sub_80E1F8C, 2, 25, 2, 6, 1, 11, 0
	setalpha 12, 8
	loopsewithpan SE_W060B, 192, 5, 10
	createsprite gBattleAnimSpriteTemplate_83DA690, 2, 0, 0, 0, 0
	createvisualtask AnimTask_SwayMon, 5, 0, 5, 2560, 8, 0
	delay 127
	delay 4
	playsewithpan SE_W060, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, ANIM_BANK_ATTACKER, 1
	createvisualtask sub_80E2A38, 9, 2, 2, 10, 0, 1023
	delay 30
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	waitforvisualfinish
	end

Move_DIZZY_PUNCH: @ 81C8F5C
	loadspritegfx 10073
	loadspritegfx 10143
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	call _81C9077
	createsprite gFistFootSpriteTemplate, 133, 16, 8, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 132, 16, 0, 1, 1
	playsewithpan SE_W004, 63
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, 16, 8, 160, -32
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, 16, 8, -256, -40
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, 16, 8, 128, -16
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, 16, 8, 416, -38
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, 16, 8, -128, -22
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, 16, 8, -384, -31
	delay 10
	call _81C9077
	createsprite gFistFootSpriteTemplate, 133, -16, -8, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 132, -16, -16, 1, 1
	playsewithpan SE_W233B, 63
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, -16, -8, 160, -32
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, -16, -8, -256, -40
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, -16, -8, 128, -16
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, -16, -8, 416, -38
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, -16, -8, -128, -22
	createsprite gBattleAnimSpriteTemplate_83DA088, 131, -16, -8, -384, -31
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end
_81C9077:
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 7, 1
	return

Move_FIRE_SPIN: @ 81C9096
	loadspritegfx 10029
	playsewithpan SE_W221B, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 47, 1
	call _81C90BF
	call _81C90BF
	call _81C90BF
	waitforvisualfinish
	end
_81C90BF:
	createsprite gBattleAnimSpriteTemplate_83DACD0, 130, 0, 28, 528, 30, 13, 50, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 130, 0, 32, 480, 20, 16, -46, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 130, 0, 33, 576, 20, 8, 42, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 130, 0, 31, 400, 25, 11, -42, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 130, 0, 28, 512, 25, 16, 46, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 130, 0, 33, 464, 30, 15, -50, 1
	delay 2
	return

Move_FURY_CUTTER: @ 81C914A
	loadspritegfx 10138
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W013, 63
	createvisualtask UpdateFuryCutterAnimDirection, 2
	jumpargeq 7, 0, _81C91A7
	goto _81C91B9
_81C916A:
	createvisualtask UpdateFuryCutterAnimCount, 2
	jumpargeq 7, 1, _81C918E
	jumpargeq 7, 2, _81C91CB
	jumpargeq 7, 3, _81C91E5
	goto _81C91FF
_81C918E:
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	waitforvisualfinish
	end
_81C91A7:
	createsprite gCuttingSliceSpriteTemplate, 2, 40, -32, 0
	goto _81C916A
_81C91B9:
	createsprite gCuttingSliceSpriteTemplate, 2, 40, -32, 1
	goto _81C916A
_81C91CB:
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 10505, 4, 0, 0
	goto _81C918E
_81C91E5:
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 3, 10505, 4, 0, 0
	goto _81C918E
_81C91FF:
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 3, 10505, 4, 0, 0
	goto _81C918E

Move_SELF_DESTRUCT: @ 81C9219
	loadspritegfx 10198
	createvisualtask sub_80E2A38, 10, 2, 1, 0, 9, 31
	createvisualtask AnimTask_ShakeMon2, 5, 4, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 6, 0, 38, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 6, 0, 38, 1
	call _81C929F
	call _81C929F
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 2, 1, 9, 0, 31
	end
_81C929F:
	playsewithpan SE_W120, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 0, 0, 0, 1
	delay 6
	playsewithpan SE_W120, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 24, -24, 0, 1
	delay 6
	playsewithpan SE_W120, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -16, 16, 0, 1
	delay 6
	playsewithpan SE_W120, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -24, -12, 0, 1
	delay 6
	playsewithpan SE_W120, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 16, 16, 0, 1
	delay 6
	return

Move_SLAM: @ 81C9309
	loadspritegfx 10056
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W004, 192
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 20, 3, 0, 4
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D69DC, 2, 0, 0
	delay 3
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 1
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -12, 10, 0, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 5
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 0, 3, 6, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_VINE_WHIP: @ 81C9391
	loadspritegfx 10287
	playsewithpan SE_W026, 192
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 6
	delay 6
	playsewithpan SE_W010, 63
	createsprite gBattleAnimSpriteTemplate_83D69F4, 130, 0, 0
	delay 6
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 6, 1
	end

Move_DRILL_PECK: @ 81C93C8
	loadspritegfx 10135
	loadspritegfx 10162
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 0
	playsewithpan SE_W029, 192
	waitforvisualfinish
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1
	delay 2
	loopsewithpan SE_W030, 63, 4, 8
	createvisualtask sub_80DB0E8, 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 18, 1
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 2
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 6
	waitforvisualfinish
	end

Move_WATERFALL: @ 81C9421
	loadspritegfx 10148
	loadspritegfx 10155
	loadspritegfx 10141
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 23, 1
	delay 5
	playsewithpan SE_W152, 192
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 10, 10, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, -15, 0, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 20, 10, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 0, -10, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, -10, 15, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 25, 20, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, -20, 20, 25, 0
	delay 4
	playsewithpan SE_W152, 192
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 12, 0, 25, 0
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 5
	delay 6
	call _81C9502
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81C9502:
	playsewithpan SE_W127, 63
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 17, 1
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, 20, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 20
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, 15, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 15
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 15
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, 10, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 10
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 10
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, 5, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 5
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 5
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, 0, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, -5, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, -5
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, -5
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, -10, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, -10
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, -10
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, -15, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, -15
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, -15
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 3, 0, -20, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, -20
	createsprite gBattleAnimSpriteTemplate_83D9360, 4, 0, -20
	return

Move_EXPLOSION: @ 81C9675
	loadspritegfx 10198
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 8, 9, 8474, 8, 0, 8
	createvisualtask AnimTask_ShakeMon2, 5, 4, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 5, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 6, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 7, 8, 0, 40, 1
	createvisualtask AnimTask_ShakeMon2, 5, 8, 8, 0, 40, 1
	call _81C9712
	call _81C9712
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 1, 1, 16, 16, 32767
	delay 50
	createvisualtask sub_80E2A38, 10, 1, 3, 16, 0, 32767
	end
_81C9712:
	playsewithpan SE_W153, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 0, 0, 0, 1
	delay 6
	playsewithpan SE_W153, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 24, -24, 0, 1
	delay 6
	playsewithpan SE_W153, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -16, 16, 0, 1
	delay 6
	playsewithpan SE_W153, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -24, -12, 0, 1
	delay 6
	playsewithpan SE_W153, 192
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 16, 16, 0, 1
	delay 6
	return

Move_DEFENSE_CURL: @ 81C977C
	loadspritegfx 10234
	loopsewithpan SE_W161, 192, 18, 3
	createvisualtask sub_80E0E24, 5, 0, 0
	createvisualtask sub_812D350, 5
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_8402498, 2, 0, 6, 0, 1
	waitforvisualfinish
	createvisualtask sub_80E0E24, 5, 0, 1
	waitforvisualfinish
	end

Move_PROTECT: @ 81C97B5
	loadspritegfx 10280
	monbg ANIM_BANK_ATK_PARTNER
	monbgprio_28 0
	waitplaysewithpan SE_W115, 192, 16
	createsprite gBattleAnimSpriteTemplate_83D6BE8, 2, 24, 0, 90
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	end

Move_DETECT: @ 81C97D2
	loadspritegfx 10071
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 9, rgb(0, 0, 0)
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 2, 1, 0, 9, 32767
	delay 18
	playsewithpan SE_W197, 192
	createsprite gBattleAnimSpriteTemplate_83930F4, 13, 20, -20
	waitforvisualfinish
	delay 10
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 9, 0, rgb(0, 0, 0)
	createvisualtask sub_80E2A38, 10, 2, 2, 9, 0, 32767
	waitforvisualfinish
	end

Move_FRUSTRATION: @ 81C9830
	loadspritegfx 10135
	loadspritegfx 10087
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createvisualtask sub_8079CEC, 1
	jumpargeq 7, 0, _81C9864
	jumpargeq 7, 1, _81C996A
	jumpargeq 7, 2, _81C9A37
	goto _81C9AB3
_81C985F:
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81C9864:
	playsewithpan SE_W082, 192
	createvisualtask AnimTask_ShakeMon2, 5, 0, 1, 0, 15, 1
	createvisualtask sub_80E2A38, 10, 2, 3, 0, 9, 31
	waitforvisualfinish
	delay 20
	playsewithpan SE_W207B, 192
	createsprite gBattleAnimSpriteTemplate_83D7798, 2, 0, 20, -28
	waitforvisualfinish
	playsewithpan SE_W207B, 192
	createsprite gBattleAnimSpriteTemplate_83D7798, 2, 0, 20, -28
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_SwayMon, 5, 0, 16, 6144, 8, 0
	delay 5
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 30, 1
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 3, 24, 8, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 3, -24, -16, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 3, 8, 4, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 3, -16, 19, 1, 0
	playsewithpan SE_W004, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 3, 18, -18, 1, 0
	playsewithpan SE_W004, 63
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 2, 3, 9, 0, 31
	goto _81C985F
_81C996A:
	playsewithpan SE_W082, 192
	createvisualtask AnimTask_ShakeMon2, 5, 0, 1, 0, 15, 1
	createvisualtask sub_80E2A38, 10, 2, 3, 0, 9, 31
	waitforvisualfinish
	delay 20
	playsewithpan SE_W207B, 192
	createsprite gBattleAnimSpriteTemplate_83D7798, 2, 0, 20, -28
	waitforvisualfinish
	delay 5
	createvisualtask sub_812E498, 5
	delay 7
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 8, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	delay 14
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 12, -6, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	delay 14
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, -12, -6, 1, 1
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 2, 3, 9, 0, 31
	goto _81C985F
_81C9A37:
	playsewithpan SE_W207B, 192
	createsprite gBattleAnimSpriteTemplate_83D7798, 2, 0, 20, -28
	waitforvisualfinish
	delay 5
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 4
	delay 6
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 10, 4, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 4
	delay 6
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -4, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	goto _81C985F
_81C9AB3:
	createsprite gBattleAnimSpriteTemplate_8402630, 2, 20, -28
	waitforvisualfinish
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, 2, 10, 2
	delay 12
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 1, 0, 6, 1
	goto _81C985F

Move_SAFEGUARD: @ 81C9AF7
	loadspritegfx 10244
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 8, 8
	playsewithpan SE_W208, 192
	createsprite gBattleAnimSpriteTemplate_83D7D74, 2
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7D74, 2
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7D74, 2
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createvisualtask sub_80E1F8C, 2, 10, 0, 2, 0, 10, 32767
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	end

Move_PAIN_SPLIT: @ 81C9B39
	loadspritegfx 10239
	createsprite gBattleAnimSpriteTemplate_84026F0, 2, -8, -42, 0
	createsprite gBattleAnimSpriteTemplate_84026F0, 130, -8, -42, 1
	delay 10
	playsewithpan SE_W207B, 0
	createvisualtask sub_812EB10, 2, 0, 0
	createvisualtask sub_812EB10, 2, 1, 0
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_84026F0, 2, -24, -42, 0
	createsprite gBattleAnimSpriteTemplate_84026F0, 130, -24, -42, 1
	delay 10
	playsewithpan SE_W207B, 0
	createvisualtask sub_812EB10, 2, 0, 1
	createvisualtask sub_812EB10, 2, 1, 1
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_84026F0, 2, 8, -42, 0
	createsprite gBattleAnimSpriteTemplate_84026F0, 130, 8, -42, 1
	delay 10
	playsewithpan SE_W207B, 0
	createvisualtask sub_812EB10, 2, 0, 2
	createvisualtask sub_812EB10, 2, 1, 2
	end

Move_VICE_GRIP: @ 81C9BE1
	loadspritegfx 10138
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W011, 63
	createsprite gBattleAnimSpriteTemplate_83D769C, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D769C, 2, 1
	delay 9
	createsprite gBasicHitSplatSpriteTemplate, 1, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 5, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_GUILLOTINE: @ 81C9C29
	loadspritegfx 10138
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	fadetobgfromset 12, 13, 14
	waitbgfadein
	playsewithpan SE_W011, 63
	createsprite gBattleAnimSpriteTemplate_83D76DC, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D76DC, 2, 1
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 16, 0
	delay 9
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 23, 1
	delay 46
	createvisualtask AnimTask_ShakeMon2, 5, 1, 4, 0, 8, 1
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 0
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 0, 8, 0, 0
	playsewithpan SE_W013, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end

Move_PAY_DAY: @ 81C9CB5
	loadspritegfx 10100
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W013B, 192
	createsprite gBattleAnimSpriteTemplate_83D75E4, 2, 20, 0, 0, 0, 1152
	waitforvisualfinish
	playsewithpan SE_W006, 63
	createsprite gBasicHitSplatSpriteTemplate, 1, 0, 0, 1, 2
	createsprite gBattleAnimSpriteTemplate_83D75FC, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 1, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_OUTRAGE: @ 81C9D08
	loadspritegfx 10029
	loopsewithpan SE_W082, 192, 8, 3
	createvisualtask sub_80E1F8C, 2, 7, 2, 5, 3, 8, 430
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 12, 6, 5, 4
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 1280, 0, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, -1280, 0, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 0, 1280, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 0, -1280, 3
	delay 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 40, 1
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 1280, 768, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, -1280, 768, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 1280, -768, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, -1280, -768, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 1280, 0, 3
	call _81C9E0F
	call _81C9E0F
	waitforvisualfinish
	end
_81C9E0F:
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, -1280, 0, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 0, 1280, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 0, -1280, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 1280, 768, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, -1280, 768, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, 1280, -768, 3
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DAFCC, 130, 0, 0, 30, -1280, -768, 3
	return

Move_SPARK: @ 81C9EA3
	loadspritegfx 10135
	loadspritegfx 10011
	delay 0
	createvisualtask sub_80E1F8C, 2, 3, -31, 1, 5, 5, 23551
	playsewithpan SE_W085B, 192
	createsprite gBattleAnimSpriteTemplate_83D985C, 0, 32, 24, 190, 12, 0, 1, 0
	delay 0
	createsprite gBattleAnimSpriteTemplate_83D985C, 0, 80, 24, 22, 12, 0, 1, 0
	createsprite gBattleAnimSpriteTemplate_83D985C, 0, 156, 24, 121, 13, 0, 1, 1
	delay 0
	createvisualtask sub_80E1F8C, 2, 3, -31, 1, 0, 0, 23551
	delay 10
	createvisualtask sub_80E1F8C, 2, 3, -31, 1, 5, 5, 23551
	playsewithpan SE_W085B, 192
	createsprite gBattleAnimSpriteTemplate_83D985C, 0, 100, 24, 60, 10, 0, 1, 0
	createsprite gBattleAnimSpriteTemplate_83D985C, 0, 170, 24, 42, 11, 0, 1, 1
	delay 0
	createsprite gBattleAnimSpriteTemplate_83D985C, 0, 238, 24, 165, 10, 0, 1, 1
	delay 0
	createvisualtask sub_80E1F8C, 2, 3, -31, 1, 0, 0, 23551
	delay 20
	createvisualtask sub_80E1F8C, 2, 3, -31, 1, 7, 7, 23551
	playsewithpan SE_W085B, 192
	createsprite gBattleAnimSpriteTemplate_83D9908, 4, 0, 0, 32, 12, 0, 20, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9908, 4, 0, 0, 32, 12, 64, 20, 1, 0
	createsprite gBattleAnimSpriteTemplate_83D9908, 4, 0, 0, 32, 12, 128, 20, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9908, 4, 0, 0, 32, 12, 192, 20, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D9908, 4, 0, 0, 16, 12, 32, 20, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9908, 4, 0, 0, 16, 12, 96, 20, 1, 0
	createsprite gBattleAnimSpriteTemplate_83D9908, 4, 0, 0, 16, 12, 160, 20, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9908, 4, 0, 0, 16, 12, 224, 20, 2, 0
	delay 4
	waitforvisualfinish
	createvisualtask sub_80E1F8C, 2, 3, -31, 1, 0, 0, 23551
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 4
	delay 4
	playsewithpan SE_W063, 63
	createsprite gBasicHitSplatSpriteTemplate, 130, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	createvisualtask sub_80E1F8C, 2, 4, -31, 2, 0, 6, 23551
	call ElectricityEffect
	waitforvisualfinish
	end

Move_ATTRACT: @ 81CA0BA
	loadspritegfx 10216
	loopsewithpan SE_W204, 192, 12, 3
	createvisualtask AnimTask_SwayMon, 5, 0, 12, 4096, 4, 0
	delay 15
	createsprite gBattleAnimSpriteTemplate_83D7AB0, 131, 20, -8
	waitforvisualfinish
	playsewithpan SE_W213, 63
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, 160, -32
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, -256, -40
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, 128, -16
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, 416, -38
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, -128, -22
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, -384, -31
	waitforvisualfinish
	waitplaysewithpan SE_W213B, 0, 15
	createvisualtask sub_80D2100, 5
	createsprite gBattleAnimSpriteTemplate_83D7AE0, 40, 16, 256, 0
	createsprite gBattleAnimSpriteTemplate_83D7AE0, 40, 224, 240, 15
	createsprite gBattleAnimSpriteTemplate_83D7AE0, 40, 126, 272, 30
	createsprite gBattleAnimSpriteTemplate_83D7AE0, 40, 80, 224, 45
	createsprite gBattleAnimSpriteTemplate_83D7AE0, 40, 170, 272, 60
	createsprite gBattleAnimSpriteTemplate_83D7AE0, 40, 40, 256, 75
	createsprite gBattleAnimSpriteTemplate_83D7AE0, 40, 112, 256, 90
	createsprite gBattleAnimSpriteTemplate_83D7AE0, 40, 200, 272, 90
	delay 75
	createvisualtask sub_80E1F8C, 2, 4, 4, 4, 0, 10, 28479
	end

Move_GROWTH: @ 81CA1B3
	call _81CA1C0
	waitforvisualfinish
	call _81CA1C0
	waitforvisualfinish
	end
_81CA1C0:
	createvisualtask sub_80E1F8C, 2, 2, 0, 2, 0, 8, 32767
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -3, -3, 16, ANIM_BANK_ATTACKER, 0
	return

Move_WHIRLWIND: @ 81CA1E9
	loadspritegfx 10162
	createsprite gBattleAnimSpriteTemplate_83DA51C, 2, 0, -8, 1, 60, 0
	createsprite gBattleAnimSpriteTemplate_83DA51C, 2, 0, 0, 1, 60, 1
	createsprite gBattleAnimSpriteTemplate_83DA51C, 2, 0, 8, 1, 60, 2
	createsprite gBattleAnimSpriteTemplate_83DA51C, 2, 0, 16, 1, 60, 3
	createsprite gBattleAnimSpriteTemplate_83DA51C, 2, 0, 24, 1, 60, 4
	createsprite gBattleAnimSpriteTemplate_83DA51C, 2, 0, 32, 1, 60, 0
	delay 5
	loopsewithpan SE_W104, 63, 10, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 15, 1
	delay 29
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_TARGET, 12, 6, 1, 5
	delay 7
	playsewithpan SE_W081, 63
	createvisualtask sub_80A8A80, 5, 1, 8
	waitforvisualfinish
	end

Move_CONFUSE_RAY: @ 81CA291
	loadspritegfx 10013
	monbg ANIM_BANK_DEF_PARTNER
	fadetobg 2
	waitbgfadein
	createvisualtask sub_812B374, 2, -64, 63, 2, 0
	createvisualtask sub_80E2094, 2, 10013, 0, 6, 0, 14, 351
	createsprite gBattleAnimSpriteTemplate_83DAE64, 130, 28, 0, 288
	waitforvisualfinish
	setalpha 8, 8
	playsewithpan SE_W081B, 63
	createsprite gBattleAnimSpriteTemplate_83DAE7C, 130, 0, -16
	waitforvisualfinish
	delay 0
	blendoff
	clearmonbg ANIM_BANK_DEF_PARTNER
	restorebg
	waitbgfadein
	end

Move_LOCK_ON: @ 81CA2E4
	loadspritegfx 10014
	createsprite gBattleAnimSpriteTemplate_83D6DAC, 40
	createsprite gBattleAnimSpriteTemplate_83D6DC4, 40, 1
	createsprite gBattleAnimSpriteTemplate_83D6DC4, 40, 2
	createsprite gBattleAnimSpriteTemplate_83D6DC4, 40, 3
	createsprite gBattleAnimSpriteTemplate_83D6DC4, 40, 4
	delay 120
	setarg 7, -1
	waitforvisualfinish
	end

Move_MEAN_LOOK: @ 81CA31A
	loadspritegfx 10187
	monbg ANIM_BANK_DEF_PARTNER
	playsewithpan SE_W060, 192
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 16, rgb(0, 0, 0)
	loopsewithpan SE_W109, 63, 15, 4
	waitplaysewithpan SE_W043, 63, 85
	createsprite gBattleAnimSpriteTemplate_8402264, 2
	delay 120
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 16, 0, rgb(0, 0, 0)
	delay 30
	clearmonbg ANIM_BANK_DEF_PARTNER
	waitforvisualfinish
	end

Move_ROCK_THROW: @ 81CA35F
	loadspritegfx 10058
	createsprite gBattleAnimSpriteTemplate_83DB428, 130, 6, 1, 15, 1
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 0, 1, 0, 0
	playsewithpan SE_W088, 63
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 19, 1, 10, 0
	playsewithpan SE_W088, 63
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, -23, 2, -10, 0
	playsewithpan SE_W088, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 5, 20, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, -15, 1, -10, 0
	playsewithpan SE_W088, 63
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 23, 2, 10, 0
	playsewithpan SE_W088, 63
	waitforvisualfinish
	end

Move_ROCK_SLIDE: @ 81CA3EB
	loadspritegfx 10058
	monbg ANIM_BANK_DEF_PARTNER
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, 7, 1, 11, 1
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, -5, 1, -5, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 5, 0, 6, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 19, 1, 10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, -23, 2, -10, 1
	playsewithpan SE_W088, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 5, 50, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_DEF_PARTNER, 0, 5, 50, 1
	delay 2
	call _81CA483
	call _81CA483
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end
_81CA483:
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, -20, 0, -10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 28, 1, 10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, -10, 1, -5, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 10, 0, 6, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 24, 1, 10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, -32, 2, -10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, -20, 0, -10, 1
	playsewithpan SE_W088, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC4C, 130, 30, 2, 10, 1
	playsewithpan SE_W088, 63
	delay 2
	return

Move_THIEF: @ 81CA52C
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	delay 1
	fadetobg 1
	waitbgfadein
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	delay 6
	playsewithpan SE_W233, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 1, 0, 8, 1
	waitforvisualfinish
	delay 20
	clearmonbg ANIM_BANK_TARGET
	blendoff
	restorebg
	waitbgfadein
	end

Move_BUBBLE_BEAM: @ 81CA573
	loadspritegfx 10146
	loadspritegfx 10155
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	delay 1
	call _81CA5AD
	createvisualtask AnimTask_SwayMon, 5, 0, 3, 3072, 8, 1
	call _81CA5AD
	call _81CA5AD
	waitforvisualfinish
	call WaterBubbleEffect
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end
_81CA5AD:
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 35, 70, 0, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 20, 40, -10, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 10, -60, 0, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 15, -15, 10, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 30, 10, -10, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 25, -30, 10, 256, 50
	playsewithpan SE_W145, 192
	delay 3
	return

Move_ICY_WIND: @ 81CA650
	loadspritegfx 10141
	loadspritegfx 10142
	monbg ANIM_BANK_DEF_PARTNER
	createvisualtask sub_80E2A38, 10, 11, 4, 0, 4, 0
	fadetobg 15
	waitbgfadeout
	playsewithpan SE_W196, 0
	waitbgfadein
	waitforvisualfinish
	panse_1B SE_W016, 192, 63, 2, 0
	call _81CA6A8
	delay 5
	call _81CA6A8
	playsewithpan SE_W016B, 63
	delay 55
	call Unknown_81D5E0E
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	restorebg
	waitbgfadeout
	createvisualtask sub_80E2A38, 10, 11, 4, 4, 0, 0
	waitbgfadein
	end
_81CA6A8:
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 168, 0, 0, 0, 0, 72, 1
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 168, 0, 10, 0, 10, 72, 1
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 168, 0, -10, 0, -10, 72, 1
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 168, 0, 15, 0, 15, 72, 1
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 168, 0, -5, 0, -5, 72, 1
	return

Move_SMOKESCREEN: @ 81CA710
	loadspritegfx 10016
	loadspritegfx 10017
	playsewithpan SE_W104, 192
	createsprite gBattleAnimSpriteTemplate_84021B0, 130, 20, 0, 0, 0, 35, -25
	waitforvisualfinish
	createvisualtask sub_812C1D0, 2
	delay 2
	playsewithpan SE_W028, 63
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, -12, 104, 0, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, -12, 72, 1, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, -6, 56, 1, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, -6, 88, 0, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, 0, 56, 0, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, 0, 88, 1, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, 6, 72, 0, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, 6, 104, 1, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, 12, 72, 0, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, 12, 56, 1, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, 18, 80, 0, 75
	createsprite gBattleAnimSpriteTemplate_8402198, 132, 0, 18, 72, 1, 75
	waitforvisualfinish
	end

Move_CONVERSION: @ 81CA809
	loadspritegfx 10018
	monbg ANIM_BANK_ATK_PARTNER
	monbgprio_28 0
	setalpha 16, 0
	delay 0
	playsewithpan SE_W129, 192
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, -24, -24
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, -8, -24
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, 8, -24
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, 24, -24
	delay 3
	playsewithpan SE_W129, 192
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, -24, -8
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, -8, -8
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, 8, -8
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, 24, -8
	delay 3
	playsewithpan SE_W129, 192
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, -24, 8
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, -8, 8
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, 8, 8
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, 24, 8
	delay 3
	playsewithpan SE_W129, 192
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, -24, 24
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, -8, 24
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, 8, 24
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6F80, 2, 24, 24
	delay 20
	playsewithpan SE_W112, 192
	createvisualtask sub_80E21A8, 2, 10018, 1, 1, 14335, 12, 0, 0
	delay 6
	createvisualtask sub_80CE108, 5
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	end

Move_CONVERSION_2: @ 81CA91E
	loadspritegfx 10018
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	setalpha 0, 16
	delay 0
	playsewithpan SE_W112, 63
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, -24, -24, 60
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, -8, -24, 65
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, 8, -24, 70
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, 24, -24, 75
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, -24, -8, 80
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, -8, -8, 85
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, 8, -8, 90
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, 24, -8, 95
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, -24, 8, 100
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, -8, 8, 105
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, 8, 8, 110
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, 24, 8, 115
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, -24, 24, 120
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, -8, 24, 125
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, 8, 24, 130
	createsprite gBattleAnimSpriteTemplate_83D6FB0, 2, 24, 24, 135
	createvisualtask sub_80CE210, 5
	delay 60
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	delay 10
	playsewithpan SE_W129, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_ROLLING_KICK: @ 81CAA3A
	loadspritegfx 10143
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 18, 6, 1, 4
	playsewithpan SE_W104, 192
	delay 6
	playsewithpan SE_W104, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 20, 0, 0, 4
	createsprite gBattleAnimSpriteTemplate_83D9FF0, 2, -24, 0, 48, 10, 160, 0
	delay 5
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, -8, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 6, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 1, 8
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_HEADBUTT: @ 81CAABD
	loadspritegfx 10135
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 0
	playsewithpan SE_W029, 192
	waitforvisualfinish
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 6, 1
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 2
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 0, 0, 1, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	end

Move_HORN_ATTACK: @ 81CAB1A
	loadspritegfx 10135
	loadspritegfx 10020
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 0
	playsewithpan SE_W029, 192
	waitforvisualfinish
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D7050, 132, 0, 0, 10
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 2, 0, 4, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 6, 1
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 2
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 0, 0, 1, 1
	playsewithpan SE_W030, 63
	waitforvisualfinish
	end

Move_FURY_ATTACK: @ 81CAB87
	loadspritegfx 10135
	loadspritegfx 10020
	createvisualtask sub_80A8E04, 2, 4, 256, 0, 2
	choosetwoturnanim _81CABB8, _81CABDE
_81CABA5:
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 6, 1
	waitforvisualfinish
	end
_81CABB8:
	createsprite gBattleAnimSpriteTemplate_83D7050, 132, 8, 8, 10
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 0, 0, 1, 1
	playsewithpan SE_W030, 63
	goto _81CABA5
_81CABDE:
	createsprite gBattleAnimSpriteTemplate_83D7050, 132, -8, -8, 10
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 0, 0, 1, 1
	playsewithpan SE_W030, 63
	goto _81CABA5

Move_HORN_DRILL: @ 81CAC04
	loadspritegfx 10135
	loadspritegfx 10020
	jumpifcontest _81CAD6A
	fadetobg 7
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, -2304, 768, 1, -1
_81CAC21:
	waitbgfadein
	setalpha 12, 8
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 0
	playsewithpan SE_W029, 192
	waitforvisualfinish
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D7050, 132, 0, 0, 12
	waitforvisualfinish
	playse SE_BAN
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 10, 0, 40, 1
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 0, 0, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 0, 2, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, -4, 3, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, -8, -5, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 4, -12, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 16, 0, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 5, 18, 1, 3
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, -17, 12, 1, 2
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, -21, -15, 1, 2
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 8, -27, 1, 2
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 32, 0, 1, 2
	playsewithpan SE_W030, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6DE4, 2, 2
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end
_81CAD6A:
	fadetobg 8
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, 2304, 768, 0, -1
	goto _81CAC21

Move_THRASH: @ 81CAD81
	loadspritegfx 10135
	loadspritegfx 10143
	createvisualtask sub_80D0A4C, 2
	createvisualtask sub_80D0AB8, 2
	createsprite gBattleAnimSpriteTemplate_83D9FC0, 131, 1, 10, 0
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 4, 0, 7, 1
	playsewithpan SE_W004, 63
	delay 28
	createsprite gBattleAnimSpriteTemplate_83D9FC0, 131, 1, 10, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 4, 0, 7, 1
	playsewithpan SE_W233B, 63
	delay 28
	createsprite gBattleAnimSpriteTemplate_83D9FC0, 131, 1, 10, 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 8, 0, 16, 1
	playsewithpan SE_W025B, 63
	end

Move_SING: @ 81CAE00
	loadspritegfx 10072
	monbg ANIM_BANK_DEF_PARTNER
	createvisualtask sub_80CEA20, 2
	waitforvisualfinish
	panse_1B SE_W047, 192, 63, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 7, 0, 12
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 6, 1, 12
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 1, 2, 12
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 2, 3, 12
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 0, 12
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 2, 1, 12
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 5, 2, 12
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 6, 3, 12
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 2, 0, 12
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 2, 1, 12
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 1, 2, 12
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 5, 3, 12
	delay 4
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	createvisualtask sub_80CEAD8, 2
	waitforvisualfinish
	end

Move_LOW_KICK: @ 81CAED4
	loadspritegfx 10143
	loadspritegfx 10135
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 20, 0, 0, 4
	createsprite gBattleAnimSpriteTemplate_83D9FF0, 130, -24, 28, 40, 8, 160, 0
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, 130, -8, 8, 1, 2
	createvisualtask sub_80A8E04, 2, 6, 384, 1, 2
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 1, 4
	end

Move_EARTHQUAKE: @ 81CAF31
	createvisualtask sub_80E1864, 5, 5, 10, 50
	createvisualtask sub_80E1864, 5, 4, 10, 50
	playsewithpan SE_W089, 0
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, 0, 14, 32767, 14
	delay 16
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, 0, 14, 32767, 14
	end

Move_FISSURE: @ 81CAF7E
	loadspritegfx 10074
	createvisualtask sub_80E1864, 3, 5, 10, 50
	createvisualtask sub_80E1864, 3, 1, 10, 50
	playsewithpan SE_W089, 63
	delay 8
	call _81CAFFF
	delay 15
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, 0, 14, 32767, 14
	delay 15
	call _81CB050
	delay 15
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, 0, 14, 32767, 14
	delay 15
	call _81CAFFF
	delay 50
	fadetobg 21
	waitbgfadeout
	createvisualtask sub_80E1BB0, 5, 1, 5, -1
	waitbgfadein
	delay 40
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end
_81CAFFF:
	createsprite gDirtPlumeSpriteTemplate, 130, 1, 0, 12, -48, -16, 24
	createsprite gDirtPlumeSpriteTemplate, 130, 1, 0, 16, -16, -10, 24
	createsprite gDirtPlumeSpriteTemplate, 130, 1, 1, 14, -52, -18, 24
	createsprite gDirtPlumeSpriteTemplate, 130, 1, 1, 12, -32, -16, 24
	playsewithpan SE_W091, 63
	return
_81CB050:
	createsprite gDirtPlumeSpriteTemplate, 130, 1, 0, 12, -24, -16, 24
	createsprite gDirtPlumeSpriteTemplate, 130, 1, 0, 16, -38, -10, 24
	createsprite gDirtPlumeSpriteTemplate, 130, 1, 1, 14, -20, -18, 24
	createsprite gDirtPlumeSpriteTemplate, 130, 1, 1, 12, -36, -16, 24
	playsewithpan SE_W091, 63
	return

Move_DIG: @ 81CB0A1
	choosetwoturnanim _81CB0AB, _81CB106
_81CB0AA:
	end
_81CB0AB:
	loadspritegfx 10074
	loadspritegfx 10281
	createsprite gDigDirtMoundSpriteTemplate, 1, 0, 0, 180
	createsprite gDigDirtMoundSpriteTemplate, 1, 0, 1, 180
	monbg_22 0
	delay 1
	createvisualtask sub_80E1244, 2, 0
	delay 6
	call _81CB16A
	call _81CB16A
	call _81CB16A
	call _81CB16A
	call _81CB16A
	waitforvisualfinish
	clearmonbg_23 0
	delay 1
	createvisualtask sub_80E1244, 2, 1
	goto _81CB0AA
_81CB106:
	loadspritegfx 10135
	loadspritegfx 10281
	createvisualtask sub_80E149C, 2, 0
	waitforvisualfinish
	monbg ANIM_BANK_ATTACKER
	createsprite gDigDirtMoundSpriteTemplate, 1, 0, 0, 48
	createsprite gDigDirtMoundSpriteTemplate, 1, 0, 1, 48
	delay 1
	createvisualtask sub_80E149C, 2, 1
	delay 16
	createsprite gBasicHitSplatSpriteTemplate, 2, -8, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 6, 1
	playsewithpan SE_W025B, 192
	clearmonbg ANIM_BANK_ATTACKER
	goto _81CB0AA
_81CB16A:
	createsprite gDirtPlumeSpriteTemplate, 2, 0, 0, 12, 4, -16, 18
	createsprite gDirtPlumeSpriteTemplate, 2, 0, 0, 16, 4, -10, 18
	createsprite gDirtPlumeSpriteTemplate, 2, 0, 1, 14, 4, -18, 18
	createsprite gDirtPlumeSpriteTemplate, 2, 0, 1, 12, 4, -16, 18
	playsewithpan SE_W091, 192
	delay 32
	return

Move_MEDITATE: @ 81CB1BD
	call Unknown_81D61E7
	createvisualtask sub_80DBC94, 2
	playsewithpan SE_W029, 192
	delay 16
	playsewithpan SE_W036, 192
	waitforvisualfinish
	call Unknown_81D61F3
	end

Move_AGILITY: @ 81CB1DA
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 24, 6, 4, 4
	createvisualtask sub_80E2DD8, 2, 0, 4, 7, 10
	playsewithpan SE_W104, 192
	delay 12
	playsewithpan SE_W104, 192
	delay 12
	playsewithpan SE_W104, 192
	delay 12
	playsewithpan SE_W104, 192
	delay 12
	playsewithpan SE_W104, 192
	delay 12
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	delay 1
	end

Move_QUICK_ATTACK: @ 81CB224
	loadspritegfx 10135
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 24, 6, 1, 5
	createvisualtask sub_80E2DD8, 2, 0, 4, 7, 3
	playsewithpan SE_W026, 192
	delay 4
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, 132, 0, 0, 1, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	waitforvisualfinish
	end

Move_RAGE: @ 81CB27C
	loadspritegfx 10135
	loadspritegfx 10087
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 3, ANIM_BANK_ATTACKER, 31, 10, 0, 2
	createsprite gBattleAnimSpriteTemplate_83D7798, 2, 0, -20, -28
	playsewithpan SE_W207B, 192
	delay 20
	createsprite gBattleAnimSpriteTemplate_83D7798, 2, 0, 20, -28
	playsewithpan SE_W207B, 192
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 6
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask sub_80A9058, 2, 1, 1, 10, 1, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	end

Move_TELEPORT: @ 81CB2F2
	call Unknown_81D61E7
	createvisualtask sub_80DBCFC, 2
	playsewithpan SE_W100, 192
	delay 15
	call Unknown_81D61F3
	waitforvisualfinish
	end

Move_DOUBLE_TEAM: @ 81CB30B
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 12, 8
	createvisualtask sub_80CE7E0, 2
	playsewithpan SE_W104, 192
	delay 32
	playsewithpan SE_W104, 192
	delay 24
	playsewithpan SE_W104, 192
	delay 16
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	delay 8
	playsewithpan SE_W104, 192
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	delay 1
	end

Move_MINIMIZE: @ 81CB352
	setalpha 10, 8
	createvisualtask sub_80D0488, 2
	loopsewithpan SE_W107, 192, 34, 3
	waitforvisualfinish
	blendoff
	end

Move_METRONOME: @ 81CB365
	loadspritegfx 10064
	loadspritegfx 10209
	createsprite gBattleAnimSpriteTemplate_83D7220, 11, 0, 100
	playsewithpan SE_W118, 192
	delay 6
	createsprite gBattleAnimSpriteTemplate_83D72C8, 12, 0
	delay 24
	loopsewithpan SE_W039, 192, 22, 3
	waitforvisualfinish
	end

Move_SKULL_BASH: @ 81CB38F
	choosetwoturnanim _81CB399, _81CB3E6
_81CB398:
	end
_81CB399:
	call _81CB3A9
	call _81CB3A9
	waitforvisualfinish
	goto _81CB398
_81CB3A9:
	createsprite gBattleAnimSpriteTemplate_83C2010, 2, 0, -24, 0, 0, 10, 0
	playsewithpan SE_W036, 192
	waitforvisualfinish
	createvisualtask sub_80A8E04, 2, 16, 96, 0, 2
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83C2010, 2, 0, 24, 0, 0, 10, 1
	waitforvisualfinish
	return
_81CB3E6:
	loadspritegfx 10135
	createvisualtask sub_80CDAC8, 2, 0
	playsewithpan SE_W036, 192
	waitforvisualfinish
	playse SE_BAN
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, 0, 14, 32767, 14
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 2, 0, 40, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 10, 0, 40, 1
	createsprite gBattleAnimSpriteTemplate_83DB538, 132, 0, 0, 1, 0
	loopsewithpan SE_W025B, 63, 8, 3
	waitforvisualfinish
	createvisualtask sub_80CDAC8, 2, 1
	goto _81CB398

Move_AMNESIA: @ 81CB455
	loadspritegfx 10093
	call Unknown_81D61E7
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DA88C, 20
	playsewithpan SE_W118, 192
	delay 54
	loopsewithpan SE_W118, 192, 16, 3
	waitforvisualfinish
	call Unknown_81D61F3
	end

Move_KINESIS: @ 81CB479
	loadspritegfx 10075
	loadspritegfx 10097
	playsewithpan SE_W060, 192
	call Unknown_81D61E7
	createsprite gBattleAnimSpriteTemplate_83DA824, 20
	createsprite gBattleAnimSpriteTemplate_83D7450, 19, 32, -8, 0
	createsprite gBattleAnimSpriteTemplate_83D7450, 19, 32, 16, 1
	loopsewithpan SE_W109, 192, 21, 2
	delay 60
	playsewithpan SE_W146, 192
	delay 30
	loopsewithpan SE_W146, 192, 20, 2
	delay 70
	playsewithpan SE_W207B, 192
	waitforvisualfinish
	call Unknown_81D61F3
	end

Move_GLARE: @ 81CB4CA
	loadspritegfx 10248
	loadspritegfx 10218
	createvisualtask sub_81301EC, 5, 0
	playsewithpan SE_W060B, 192
	waitforvisualfinish
	createvisualtask sub_80E2A38, 5, 1, 0, 0, 16, 0
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D7B94, 0, -16, -8
	createsprite gBattleAnimSpriteTemplate_83D7B94, 0, 16, -8
	createvisualtask sub_80D23B4, 5
	playsewithpan SE_W043, 192
	delay 2
	createvisualtask sub_80D60B4, 3, 20, 1, 0
	waitforvisualfinish
	createvisualtask sub_80E2A38, 5, 1, 0, 16, 0, 0
	end

Move_BARRAGE: @ 81CB533
	loadspritegfx 10254
	createvisualtask sub_8130554, 3
	playsewithpan SE_W207, 192
	delay 24
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, 8, 1, 40, 1
	createvisualtask AnimTask_ShakeMon, 3, 1, 0, 4, 20, 1
	createvisualtask AnimTask_ShakeMon, 3, 3, 0, 4, 20, 1
	loopsewithpan SE_W070, 63, 8, 2
	end

Move_SKY_ATTACK: @ 81CB57B
	choosetwoturnanim _81CB585, _81CB68E
_81CB584:
	end
_81CB585:
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 11
	createvisualtask sub_80E3BA4, 5, 7
	jumpargeq 7, 0, _81CB5A0
	goto _81CB617
_81CB5A0:
	createvisualtask sub_80E2A38, 10, 27, 1, 0, 12, 0
	waitforvisualfinish
	delay 12
	createvisualtask sub_80E2A38, 10, 2, 1, 8, 0, 0
	createvisualtask sub_80E1864, 5, 0, 2, 16
	loopsewithpan SE_W287, 192, 4, 8
	createvisualtask sub_80E2A38, 10, 2, 1, 0, 15, 32767
	delay 20
	createvisualtask sub_80E2A38, 10, 2, 1, 15, 0, 32767
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 25, 1, 8, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	goto _81CB584
_81CB617:
	createvisualtask sub_80E2A7C, 10, 1, 1, 0, 12, 0
	waitforvisualfinish
	delay 12
	createvisualtask sub_80E2A38, 10, 2, 1, 8, 0, 0
	createvisualtask sub_80E1864, 5, 0, 2, 16
	playsewithpan SE_W287, 192
	delay 8
	createvisualtask sub_80E2A38, 10, 2, 1, 0, 15, 32767
	delay 20
	createvisualtask sub_80E2A38, 10, 2, 1, 15, 0, 32767
	waitforvisualfinish
	createvisualtask sub_80E2A7C, 10, 4, 1, 8, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	goto _81CB584
_81CB68E:
	loadspritegfx 10135
	loadspritegfx 10284
	call Unknown_81D61FB
	monbg ANIM_BANK_ATTACKER
	createvisualtask sub_80E2A38, 10, 2, 0, 0, 16, 32767
	delay 4
	createvisualtask sub_80DFC24, 5, 0
	waitforvisualfinish
	createvisualtask sub_812B340, 5, 238, -64
	createsprite gBattleAnimSpriteTemplate_83DA65C, 130
	delay 14
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 10, 0, 18, 1
	createvisualtask sub_812B30C, 5, 141, 63
	delay 20
	createvisualtask sub_80DFD24, 5, 1
	delay 2
	createvisualtask sub_80E2A38, 10, 2, 0, 15, 0, 32767
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	call Unknown_81D622B
	goto _81CB584

Move_FLASH: @ 81CB713
	playsewithpan SE_W043, 192
	createvisualtask sub_80E388C, 2
	waitforvisualfinish
	end

Move_SPLASH: @ 81CB720
	createvisualtask sub_80D074C, 2, 0, 3
	delay 8
	loopsewithpan SE_W039, 192, 38, 3
	waitforvisualfinish
	end

Move_ACID_ARMOR: @ 81CB735
	monbg ANIM_BANK_ATTACKER
	setalpha 15, 0
	createvisualtask sub_812F314, 2, 0
	playsewithpan SE_W151, 192
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_BANK_ATTACKER
	delay 1
	end

Move_SHARPEN: @ 81CB74E
	loadspritegfx 10185
	createsprite gBattleAnimSpriteTemplate_83D6EF0, 2
	waitforvisualfinish
	end

Move_SUPER_FANG: @ 81CB75A
	loadspritegfx 10192
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 1, 0, 20, 1
	playsewithpan SE_W082, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 3, 0, 48, 1
	createvisualtask AnimTask_BlendMonInAndOut, 2, ANIM_BANK_ATTACKER, 1247, 12, 4, 1
	waitforvisualfinish
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 4
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7080, 130
	playsewithpan SE_W044, 63
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, 2143, 14, 32767, 14
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 7, 12, 1
	waitforvisualfinish
	blendoff
	end

Move_SLASH: @ 81CB7DB
	loadspritegfx 10183
	createsprite gBattleAnimSpriteTemplate_83D6E38, 130, 1, -8, 0
	playsewithpan SE_W013, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6E38, 130, 1, 8, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 18, 1
	playsewithpan SE_W013, 63
	waitforvisualfinish
	end

Move_STRUGGLE: @ 81CB815
	loadspritegfx 10135
	loadspritegfx 10215
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 3, 0, 12, 4
	createsprite gBattleAnimSpriteTemplate_83D7C90, 2, 0, 0, 2
	createsprite gBattleAnimSpriteTemplate_83D7C90, 2, 0, 1, 2
	loopsewithpan SE_W029, 192, 12, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_SKETCH: @ 81CB87B
	loadspritegfx 10002
	monbg ANIM_BANK_TARGET
	createvisualtask sub_80D0C88, 2
	createsprite gBattleAnimSpriteTemplate_83D77E0, 130
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	createvisualtask sub_80D074C, 2, 0, 2
	loopsewithpan SE_W039, 192, 38, 2
	end

Move_NIGHTMARE: @ 81CB8A3
	fadetobg 2
	waitbgfadein
	jumpifcontest _81CB8CF
	monbg ANIM_BANK_DEF_PARTNER
	createvisualtask sub_80DE1B0, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 40, 1
	playsewithpan SE_W171, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	restorebg
	waitbgfadein
	end
_81CB8CF:
	createvisualtask AnimTask_BlendMonInAndOut, 2, ANIM_BANK_ATTACKER, 32767, 10, 2, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_ATTACKER, 3, 0, 32, 1
	playsewithpan SE_W171, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

Move_FLAIL: @ 81CB8F9
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createvisualtask sub_812E860, 2, 0
	loopsewithpan SE_W029, 192, 8, 2
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 3
	createvisualtask sub_80A9058, 2, 0, 1, 30, 1, 0
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_SPITE: @ 81CB936
	fadetobg 2
	playsewithpan SE_W060, 192
	waitbgfadein
	monbg ANIM_BANK_DEF_PARTNER
	createvisualtask sub_80E1F8C, 2, 2, 2, 6, 0, 8, 32767
	createvisualtask sub_80DE3AC, 2
	loopsewithpan SE_W060, 63, 20, 3
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_BANK_TARGET
	end

Move_MACH_PUNCH: @ 81CB965
	loadspritegfx 10135
	loadspritegfx 10143
	monbg ANIM_BANK_ATK_PARTNER
	createvisualtask sub_80E3B4C, 2
	jumpargeq 7, 1, _81CB9E6
	fadetobg 9
_81CB97E:
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, -2304, 0, 1, -1
	waitbgfadein
	delay 0
	setalpha 9, 8
	createvisualtask sub_807A69C, 2, 28968, 10
	playsewithpan SE_W026, 192
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, 132, 0, 0, 8, 1, 0
	playsewithpan SE_W004, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end
_81CB9E6:
	fadetobg 10
	goto _81CB97E

Move_FORESIGHT: @ 81CB9ED
	loadspritegfx 10258
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 16, 0
	createsprite gBattleAnimSpriteTemplate_8402A24, 130, 1
	delay 17
	loopsewithpan SE_W166, 63, 16, 4
	delay 48
	delay 24
	playsewithpan SE_W166, 63
	delay 10
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_BANK_TARGET, 32767, 12, 2, 1
	playsewithpan SE_W197, 63
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Move_DESTINY_BOND: @ 81CBA2C
	loadspritegfx 10188
	fadetobg 2
	playsewithpan SE_W060, 192
	waitbgfadein
	createvisualtask sub_80DE918, 5, 0, 48
	playsewithpan SE_W109, 192
	delay 48
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 2, 0, 24, 1
	createvisualtask sub_80E2A7C, 2, 6, 1, 0, 12, 30653
	delay 24
	createvisualtask sub_80E2A7C, 2, 6, 1, 12, 0, 30653
	playsewithpan SE_W171, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	blendoff
	clearmonbg 5
	end

Move_ENDURE: @ 81CBA87
	loadspritegfx 10184
	playsewithpan SE_W082, 192
	call EndureFlamesAnim
	delay 8
	createvisualtask sub_80E1F8C, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 32, 1
	call EndureFlamesAnim
	delay 8
	call EndureFlamesAnim
	waitforvisualfinish
	end

EndureFlamesAnim:
	createsprite gBattleAnimSpriteTemplate_EndureFlame, 2, 0, -24, 26, 2
	delay 4
	createsprite gBattleAnimSpriteTemplate_EndureFlame, 2, 0, 14, 28, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_EndureFlame, 2, 0, -5, 10, 2
	delay 4
	createsprite gBattleAnimSpriteTemplate_EndureFlame, 2, 0, 28, 26, 3
	delay 4
	createsprite gBattleAnimSpriteTemplate_EndureFlame, 2, 0, -12, 0, 1
	return

Move_CHARM: @ 81CBB1B
	loadspritegfx 10210
	createvisualtask sub_812E568, 5, 0, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, 0, 20
	playsewithpan SE_W204, 192
	delay 15
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, -20, 20
	playsewithpan SE_W204, 192
	delay 15
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, 20, 20
	playsewithpan SE_W204, 192
	waitforvisualfinish
	end

Move_ROLLOUT: @ 81CBB5E
	loadspritegfx 10135
	loadspritegfx 10074
	loadspritegfx 10058
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask sub_80DD4D4, 2
	waitforvisualfinish
	createvisualtask sub_80A9058, 2, 0, 1, 30, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 4, 0, 0, 1, 2
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_FALSE_SWIPE: @ 81CBB9F
	loadspritegfx 10286
	loadspritegfx 10135
	createsprite gBattleAnimSpriteTemplate_83D6E50, 130
	playsewithpan SE_W233, 63
	delay 16
	createsprite gBattleAnimSpriteTemplate_83D6E68, 130, 0
	playsewithpan SE_W104, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6E68, 130, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6E68, 130, 32
	playsewithpan SE_W104, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6E68, 130, 48
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6E68, 130, 64
	playsewithpan SE_W104, 63
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6E68, 130, 80
	delay 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 6, 1
	createsprite gBasicHitSplatSpriteTemplate, 132, 0, 0, 1, 3
	playsewithpan SE_W004, 63
	end

Move_SWAGGER: @ 81CBC26
	loadspritegfx 10086
	loadspritegfx 10087
	createvisualtask sub_80D08C8, 2
	playsewithpan SE_W207, 192
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D7764, 2
	loopsewithpan SE_W207, 192, 4, 2
	waitforvisualfinish
	delay 24
	createsprite gBattleAnimSpriteTemplate_83D7798, 130, 1, -20, -28
	playsewithpan SE_W207B, 63
	delay 12
	createsprite gBattleAnimSpriteTemplate_83D7798, 130, 1, 20, -28
	playsewithpan SE_W207B, 63
	waitforvisualfinish
	end

Move_MILK_DRINK: @ 81CBC6E
	loadspritegfx 10099
	loadspritegfx 10203
	loadspritegfx 10031
	monbg ANIM_BANK_TARGET
	createsprite gBattleAnimSpriteTemplate_83D6C48, 2
	delay 40
	playsewithpan SE_W152, 192
	delay 12
	playsewithpan SE_W152, 192
	delay 20
	playsewithpan SE_W152, 192
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D7928, 3, 0, 0, 1, 0
	playsewithpan SE_W208, 192
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	call Unknown_81D5F3E
	waitforvisualfinish
	end

Move_MAGNITUDE: @ 81CBCB0
	createvisualtask sub_80E1B88, 2
	waitforvisualfinish
	jumpargeq 15, 0, _81CBCC9
	jumpargeq 15, 1, _81CBCEE
_81CBCC8:
	end
_81CBCC9:
	createvisualtask sub_80E1864, 5, 5, 0, 50
	createvisualtask sub_80E1864, 5, 4, 0, 50
	loopsewithpan SE_W070, 63, 8, 10
	goto _81CBCC8
_81CBCEE:
	createvisualtask sub_80E1864, 5, 5, 0, 50
	createvisualtask sub_80E1864, 5, 4, 0, 50
	loopsewithpan SE_W070, 63, 8, 10
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, 0, 14, 32767, 14
	delay 16
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, 0, 14, 32767, 14
	goto _81CBCC8

Move_RAPID_SPIN: @ 81CBD41
	loadspritegfx 10135
	loadspritegfx 10229
	monbg ANIM_BANK_ATTACKER
	createsprite gBattleAnimSpriteTemplate_84023E8, 2, 0, 0, 32, -32, 40, -2
	createvisualtask sub_812CDC8, 2, 0, 2, 0
	loopsewithpan SE_W013B, 192, 8, 4
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 130, 0, 0, 1, 2
	createvisualtask sub_80A9058, 2, 0, 1, 10, 1, 0
	playsewithpan SE_W003, 63
	waitforvisualfinish
	delay 8
	createvisualtask sub_812CDC8, 2, 0, 2, 1
	loopsewithpan SE_W013B, 192, 8, 4
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	end

Move_MOONLIGHT: @ 81CBDAE
	loadspritegfx 10194
	loadspritegfx 10195
	loadspritegfx 10031
	setalpha 0, 16
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 16, rgb(0, 0, 0)
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D6FC8, 2, 120, 56
	createvisualtask sub_8079670, 3, 0, 16, 16, 0, 1
	playsewithpan SE_W236, 0
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D6FF8, 40, -12, 0
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D6FF8, 40, -24, 0
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D6FF8, 40, 21, 0
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D6FF8, 40, 0, 0
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D6FF8, 40, 10, 0
	delay 20
	createvisualtask sub_80CE3EC, 2
	waitforvisualfinish
	call Unknown_81D5EF5
	waitforvisualfinish
	end

Move_EXTREME_SPEED: @ 81CBE3E
	loadspritegfx 10207
	loadspritegfx 10135
	createvisualtask sub_80E3B4C, 2
	jumpargeq 7, 1, _81CBEF5
	fadetobg 9
_81CBE55:
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, -2304, 0, 1, -1
	waitbgfadein
	createvisualtask sub_80D15A4, 2
	loopsewithpan SE_W013B, 192, 8, 3
	waitforvisualfinish
	delay 1
	createvisualtask sub_80E4300, 2
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	delay 18
	createvisualtask sub_80D1638, 2
	delay 2
	playsewithpan SE_W004, 63
	createsprite gBattleAnimSpriteTemplate_83DB508, 130, 1, 0, -12, 3
	delay 10
	playsewithpan SE_W004, 63
	createsprite gBattleAnimSpriteTemplate_83DB508, 130, 1, 0, 12, 3
	delay 10
	playsewithpan SE_W233B, 63
	createsprite gBattleAnimSpriteTemplate_83DB508, 130, 1, 0, 0, 3
	waitforvisualfinish
	createvisualtask sub_80D18D4, 2
	delay 10
	createvisualtask sub_80D17C4, 2
	loopsewithpan SE_W104, 192, 8, 4
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	clearmonbg ANIM_BANK_TARGET
	blendoff
	delay 1
	setarg 7, 4096
	delay 1
	end
_81CBEF5:
	fadetobg 10
	goto _81CBE55

Move_UPROAR: @ 81CBEFC
	loadspritegfx 10225
	loadspritegfx 10203
	monbg ANIM_BANK_DEF_PARTNER
	createvisualtask sub_80D2CF8, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D79A4, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_W253, 192
	createsprite gBattleAnimSpriteTemplate_83D7CC8, 2, 0, 29, -12, 0
	createsprite gBattleAnimSpriteTemplate_83D7CC8, 2, 0, -12, -29, 1
	delay 16
	createvisualtask sub_80D2CF8, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D79A4, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_W253, 192
	createsprite gBattleAnimSpriteTemplate_83D7CC8, 2, 0, 12, -29, 1
	createsprite gBattleAnimSpriteTemplate_83D7CC8, 2, 0, -29, -12, 0
	delay 16
	createvisualtask sub_80D2CF8, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D79A4, 3, 0, 0, 0, 0, 31, 8
	playsewithpan SE_W253, 192
	createsprite gBattleAnimSpriteTemplate_83D7CC8, 2, 0, 24, -24, 1
	createsprite gBattleAnimSpriteTemplate_83D7CC8, 2, 0, -24, -24, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Move_HEAT_WAVE: @ 81CBFC6
	loadspritegfx 10261
	createvisualtask sub_80E2C60, 5, 10261, 0, 6, 6, 31
	createvisualtask do_boulder_dust, 5, 1
	createvisualtask sub_80D6080, 6, 6, 31
	panse_1B SE_W257, 192, 63, 2, 0
	delay 4
	createvisualtask sub_80D5DDC, 5
	delay 12
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 10, 2304, 96, 1
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 90, 2048, 96, 1
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 50, 2560, 96, 1
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 20, 2304, 96, 1
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 70, 1984, 96, 1
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 0, 2816, 96, 1
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 60, 2560, 96, 1
	end

Move_HAIL: @ 81CC076
	loadspritegfx 10263
	loadspritegfx 10141
	createvisualtask sub_80E2A38, 10, 1, 3, 0, 6, 0
	waitforvisualfinish
	createvisualtask sub_80D8ADC, 5
	loopsewithpan SE_W258, 0, 8, 10
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 1, 3, 6, 0, 0
	end

Move_TORMENT: @ 81CC0AE
	loadspritegfx 10087
	loadspritegfx 10209
	createvisualtask sub_812D008, 2
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 2, ANIM_BANK_TARGET, 31, 10, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D7798, 130, 1, -20, -28
	playsewithpan SE_W207B, 63
	delay 20
	createsprite gBattleAnimSpriteTemplate_83D7798, 130, 1, 20, -28
	playsewithpan SE_W207B, 63
	end

Move_MEMENTO: @ 81CC0F2
	setalpha 0, 16
	delay 1
	createvisualtask sub_80E0918, 2
	delay 1
	createvisualtask sub_80E00EC, 5
	playsewithpan SE_W060, 192
	delay 48
	playsewithpan SE_W060B, 192
	waitforvisualfinish
	createvisualtask sub_80E09C4, 2
	delay 12
	setalpha 0, 16
	delay 1
	monbg_22 1
	createvisualtask sub_80E03BC, 5
	playsewithpan SE_W060, 63
	waitforvisualfinish
	clearmonbg_23 1
	delay 1
	blendoff
	delay 1
	end

Move_FACADE: @ 81CC136
	loadspritegfx 10243
	createvisualtask sub_812FD7C, 2, 0, 3
	createvisualtask sub_812FFE4, 2, 0, 72
	loopsewithpan SE_W207, 192, 24, 3
	end

Move_SMELLING_SALT: @ 81CC156
	loadspritegfx 10247
	loadspritegfx 10255
	createsprite gBattleAnimSpriteTemplate_84029C4, 130, 1, 0, 2
	createsprite gBattleAnimSpriteTemplate_84029C4, 130, 1, 1, 2
	delay 32
	createvisualtask sub_8130918, 3, 1, 2
	loopsewithpan SE_W003, 63, 12, 2
	waitforvisualfinish
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 6, 2
	createsprite gBattleAnimSpriteTemplate_84029F4, 130, 1, 8, 3
	loopsewithpan SE_W207B, 63, 16, 3
	end

Move_FOLLOW_ME: @ 81CC1B1
	loadspritegfx 10064
	createsprite gBattleAnimSpriteTemplate_83D72E0, 2, 0
	playsewithpan SE_W039, 192
	delay 18
	playsewithpan SE_W213, 192
	delay 71
	loopsewithpan SE_W039, 192, 22, 3
	end

Move_CHARGE: @ 81CC1D0
	loadspritegfx 10211
	loadspritegfx 10212
	loadspritegfx 10213
	monbg ANIM_BANK_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 4, rgb(0, 0, 0)
	waitforvisualfinish
	createvisualtask sub_80D6B3C, 2, 0, 60, 2, 12
	playsewithpan SE_W268, 192
	delay 30
	playsewithpan SE_W268, 192
	delay 30
	playsewithpan SE_W268, 192
	createsprite gBattleAnimSpriteTemplate_83D9A6C, 2, 0
	delay 25
	playsewithpan SE_W268, 192
	delay 20
	playsewithpan SE_W268, 192
	delay 15
	playsewithpan SE_W268, 192
	delay 10
	delay 6
	loopsewithpan SE_W268, 192, 6, 5
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D9A9C, 2, 0, 16, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9A9C, 2, 0, -16, -16
	playsewithpan SE_W085B, 192
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 4, 4, 0, rgb(0, 0, 0)
	clearmonbg ANIM_BANK_ATTACKER
	blendoff
	end

Move_TAUNT: @ 81CC26B
	loadspritegfx 10214
	loadspritegfx 10209
	loadspritegfx 10087
	createsprite gBattleAnimSpriteTemplate_83D7220, 11, 0, 45
	playsewithpan SE_W118, 192
	delay 6
	createsprite gBattleAnimSpriteTemplate_83D7358, 12, 0
	delay 4
	loopsewithpan SE_W039, 192, 16, 2
	waitforvisualfinish
	delay 8
	createsprite gBattleAnimSpriteTemplate_83D7798, 130, 1, -20, -28
	playsewithpan SE_W207B, 63
	waitforvisualfinish
	delay 12
	createsprite gBattleAnimSpriteTemplate_83D7798, 130, 1, 20, -28
	playsewithpan SE_W207B, 63
	end

Move_HELPING_HAND: @ 81CC2BF
	loadspritegfx 10247
	createvisualtask sub_8130D20, 5
	createsprite gBattleAnimSpriteTemplate_8402A0C, 40, 0
	createsprite gBattleAnimSpriteTemplate_8402A0C, 40, 1
	delay 19
	playsewithpan SE_W227, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATK_PARTNER, 2, 0, 5, 1
	delay 14
	playsewithpan SE_W227, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATK_PARTNER, 2, 0, 5, 1
	delay 20
	playsewithpan SE_W227, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATK_PARTNER, 3, 0, 10, 1
	createvisualtask AnimTask_BlendMonInAndOut, 2, ANIM_BANK_ATK_PARTNER, 1023, 12, 1, 1
	end

Move_ASSIST: @ 81CC332
	loadspritegfx 10252
	createsprite gBattleAnimSpriteTemplate_8402964, 50, 112, -16, 140, 128, 36
	delay 2
	createsprite gBattleAnimSpriteTemplate_8402964, 50, 208, 128, -16, 48, 36
	playsewithpan SE_W010, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_8402964, 50, -16, 112, 256, -16, 36
	playsewithpan SE_W010, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_8402964, 50, 108, 128, 84, -16, 36
	playsewithpan SE_W010, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_8402964, 50, -16, 56, 256, 56, 36
	playsewithpan SE_W010, 0
	end

Move_SUPERPOWER: @ 81CC3A3
	loadspritegfx 10212
	loadspritegfx 10256
	loadspritegfx 10257
	monbg ANIM_BANK_ATK_PARTNER
	monbgprio_28 0
	setalpha 12, 8
	createsprite gBattleAnimSpriteTemplate_83DA0FC, 130, 0
	playsewithpan SE_W025, 192
	delay 20
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, 4, 1, 180, 1
	createvisualtask sub_812B340, 5, 234, 0
	delay 40
	createsprite gBattleAnimSpriteTemplate_83DA114, 41, 200, 96, 1, 120
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DA114, 41, 20, 248, 4, 112
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DA114, 41, 130, 160, 2, 104
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DA114, 41, 160, 192, 0, 96
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DA114, 41, 60, 288, 3, 88
	delay 74
	createsprite gBattleAnimSpriteTemplate_83DA12C, 131, 0
	playsewithpan SE_W207, 192
	delay 16
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 8, 0, 16, 1
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	delay 1
	end

Move_RECYCLE: @ 81CC45E
	loadspritegfx 10278
	monbg ANIM_BANK_ATTACKER
	setalpha 0, 16
	delay 1
	createsprite gBattleAnimSpriteTemplate_8402B10, 2
	loopsewithpan SE_W036, 192, 24, 3
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_BANK_ATTACKER, 32767, 12, 2, 1
	playsewithpan SE_W036, 192
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_BANK_ATTACKER
	delay 1
	end

Move_BRICK_BREAK: @ 81CC492
	loadspritegfx 10167
	loadspritegfx 10135
	loadspritegfx 10143
	loadspritegfx 10208
	choosetwoturnanim _81CC4A7, _81CC576
_81CC4A7:
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 3, 8
	delay 4
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, 3, -18, -18, 1, 1
	createsprite gFistFootSpriteTemplate, 2, -18, -18, 10, 1, 0
	playsewithpan SE_W233, 63
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 3, 18, 18, 1, 1
	createsprite gFistFootSpriteTemplate, 2, 18, 18, 10, 1, 0
	playsewithpan SE_W233, 63
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, ANIM_BANK_ATTACKER, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 6, rgb(0, 0, 0)
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, 2, 0, 0, 10, 1, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 6, 0, rgb(0, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	end
_81CC576:
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 3, 8
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DA0A0, 3, 1, 0, 0, 90, 10
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, 3, -18, -18, 1, 1
	createsprite gFistFootSpriteTemplate, 2, -18, -18, 10, 1, 0
	playsewithpan SE_W233, 63
	delay 20
	createsprite gHorizontalLungeSpriteTemplate, 2, 3, 8
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 3, 18, 18, 1, 1
	createsprite gFistFootSpriteTemplate, 2, 18, 18, 10, 1, 0
	playsewithpan SE_W233, 63
	delay 20
	createvisualtask AnimTask_WindUpLunge, 2, ANIM_BANK_ATTACKER, -24, 0, 24, 10, 24, 3
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 6, rgb(0, 0, 0)
	delay 37
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, 2, 0, 0, 10, 1, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DA0B8, 2, 1, 0, -8, -12
	createsprite gBattleAnimSpriteTemplate_83DA0B8, 2, 1, 1, 8, -12
	createsprite gBattleAnimSpriteTemplate_83DA0B8, 2, 1, 2, -8, 12
	createsprite gBattleAnimSpriteTemplate_83DA0B8, 2, 1, 3, 8, 12
	playsewithpan SE_W280, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 6, 0, rgb(0, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	end

Move_YAWN: @ 81CC697
	loadspritegfx 10242
	createvisualtask sub_812F724, 2, 0
	playsewithpan SE_W281, 192
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_84027EC, 133, 2
	playsewithpan SE_W255, 192
	delay 4
	createsprite gBattleAnimSpriteTemplate_84027EC, 133, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_84027EC, 133, 0
	waitforvisualfinish
	createvisualtask sub_812F724, 2, 1
	playsewithpan SE_W281, 63
	end

Move_ENDEAVOR: @ 81CC6DA
	loadspritegfx 10243
	loadspritegfx 10135
	createvisualtask sub_812FD7C, 2, 0, 2
	loopsewithpan SE_W039, 192, 24, 2
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_BANK_ATTACKER, 703, 12, 1, 2
	delay 6
	createvisualtask sub_80A9058, 5, 0, 1, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 130, 12, -12, 1, 2
	playsewithpan SE_W003, 63
	delay 24
	createvisualtask sub_80A9058, 5, 0, 1, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 130, -12, 12, 1, 2
	playsewithpan SE_W004, 63
	end

Move_ERUPTION: @ 81CC74F
	loadspritegfx 10201
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 31, 2, 0, 4, rgb(31, 0, 0)
	waitforvisualfinish
	createvisualtask sub_80D5470, 2
	waitplaysewithpan SE_W153, 192, 60
	waitforvisualfinish
	createvisualtask sub_80D5470, 2
	waitplaysewithpan SE_W153, 192, 60
	waitforvisualfinish
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D96F8, 40, 200, -32, 0, 100, 0
	createsprite gBattleAnimSpriteTemplate_83D96F8, 40, 30, -32, 16, 90, 1
	createsprite gBattleAnimSpriteTemplate_83D96F8, 40, 150, -32, 32, 60, 2
	createsprite gBattleAnimSpriteTemplate_83D96F8, 40, 90, -32, 48, 80, 3
	createsprite gBattleAnimSpriteTemplate_83D96F8, 40, 110, -32, 64, 50, 0
	createsprite gBattleAnimSpriteTemplate_83D96F8, 40, 60, -32, 80, 70, 1
	delay 22
	createvisualtask sub_80E1864, 5, 5, 8, 60
	createvisualtask sub_80E1864, 5, 4, 8, 60
	loopsewithpan SE_W088, 63, 16, 12
	delay 80
	createsprite gSimplePaletteBlendSpriteTemplate, 40, 31, 4, 4, 0, rgb(31, 0, 0)
	end

Move_SKILL_SWAP: @ 81CC81C
	loadspritegfx 10251
	call Unknown_81D61E7
	createvisualtask sub_80DC0B0, 3, 1
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_BANK_TARGET, 32767, 12, 3, 1
	loopsewithpan SE_W179, 192, 24, 3
	delay 16
	createvisualtask sub_80DC0B0, 3, 0
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_BANK_ATTACKER, 32767, 12, 3, 1
	waitforvisualfinish
	call Unknown_81D61F3
	end

Move_IMPRISON: @ 81CC867
	loadspritegfx 10249
	loadspritegfx 10250
	call Unknown_81D61E7
	monbg ANIM_BANK_DEF_PARTNER
	createvisualtask sub_80DBE00, 5
	delay 8
	loopsewithpan SE_W030, 192, 8, 5
	waitforvisualfinish
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DA8F4, 5, 0, 40
	createvisualtask sub_80E1864, 5, 4, 1, 10
	playsewithpan SE_W063, 192
	clearmonbg ANIM_BANK_DEF_PARTNER
	call Unknown_81D61F3
	end

Move_GRUDGE: @ 81CC8AA
	loadspritegfx 10253
	monbg ANIM_BANK_ATTACKER
	monbgprio_29
	fadetobg 2
	playsewithpan SE_W060, 192
	waitbgfadein
	createvisualtask sub_80DF1A4, 3
	loopsewithpan SE_W052, 192, 16, 4
	delay 10
	delay 80
	playsewithpan SE_W171, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_BANK_ATTACKER
	end

Move_CAMOUFLAGE: @ 81CC8D2
	monbg ANIM_BANK_ATK_PARTNER
	monbgprio_28 0
	setalpha 16, 0
	createvisualtask sub_80E2B74, 5, 2, 3, 0, 14
	delay 16
	createvisualtask sub_80DFC24, 2, 4
	playsewithpan SE_W185, 192
	waitforvisualfinish
	delay 8
	createvisualtask sub_80E2B74, 5, 2, 0, 0, 0
	waitforvisualfinish
	createvisualtask sub_80DFD24, 2, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_BANK_ATK_PARTNER
	end

Move_TAIL_GLOW: @ 81CC918
	loadspritegfx 10212
	monbg ANIM_BANK_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 4, rgb(0, 0, 0)
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DAC10, 66, 0
	delay 18
	loopsewithpan SE_W234, 192, 16, 6
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 4, 4, 0, rgb(0, 0, 0)
	clearmonbg ANIM_BANK_ATTACKER
	blendoff
	delay 1
	end

Move_LUSTER_PURGE: @ 81CC95B
	loadspritegfx 10267
	loadspritegfx 10135
	fadetobg 3
	waitbgfadeout
	createvisualtask sub_812C624, 5
	waitbgfadein
	monbg ANIM_BANK_ATTACKER
	setalpha 12, 8
	playsewithpan SE_W076, 192
	createsprite gBattleAnimSpriteTemplate_83DA9E0, 41, 0, 0, 0, 0
	delay 20
	createvisualtask sub_80E2A7C, 5, 5, 2, 0, 16, -1
	createvisualtask sub_80E2C60, 5, 10267, 2, 0, 16, -1
	waitforvisualfinish
	createvisualtask sub_80E2C60, 5, 10135, 0, 12, 12, 23552
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 2
	createvisualtask sub_812B30C, 5, 215, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 2
	createvisualtask sub_812B30C, 5, 215, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 2
	createvisualtask sub_812B30C, 5, 215, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 2
	createvisualtask sub_812B30C, 5, 215, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 2
	createvisualtask sub_812B30C, 5, 215, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 2
	createvisualtask sub_812B30C, 5, 215, 63
	waitforvisualfinish
	createvisualtask sub_80E2A7C, 5, 5, 2, 16, 0, -1
	createvisualtask sub_80E1864, 5, 1, 5, 14
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	blendoff
	call Unknown_81D61F3
	end

Move_MIST_BALL: @ 81CCA72
	loadspritegfx 10155
	loadspritegfx 10270
	delay 0
	playsewithpan SE_W081, 192
	createsprite gBattleAnimSpriteTemplate_83D9D80, 128, 0, 0, 0, 0, 30, 0
	waitforvisualfinish
	playsewithpan SE_W028, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 10, 0
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 0, 1, 1, 1, 32279, 16, 32767, 16
	delay 0
	playsewithpan SE_W114, 0
	createvisualtask sub_80D8414, 5
	createvisualtask sub_80E2A38, 10, 4, 3, 0, 16, 32767
	delay 8
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 4, 0, 70, 0
	delay 70
	createvisualtask sub_80E2A38, 10, 4, 2, 16, 0, 32767
	end

Move_FEATHER_DANCE: @ 81CCB01
	loadspritegfx 10270
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_29
	playsewithpan SE_W080, 63
	delay 0
	createsprite gBattleAnimSpriteTemplate_83DA498, 128, 0, -16, 64, 2, 104, 11304, 32, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DA498, 128, 0, -16, 32, 2, 104, 11304, 32, 1
	createsprite gBattleAnimSpriteTemplate_83DA498, 128, 0, -16, 0, 2, 104, 11304, 32, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DA498, 128, 0, -16, 224, 2, 104, 11304, 32, 1
	createsprite gBattleAnimSpriteTemplate_83DA498, 128, 0, -16, 128, 2, 104, 11304, 32, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DA498, 128, 0, -16, 192, 2, 104, 11304, 32, 1
	createsprite gBattleAnimSpriteTemplate_83DA498, 128, 0, -16, 160, 2, 104, 11304, 32, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DA498, 128, 0, -16, 96, 2, 104, 11304, 32, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Move_TEETER_DANCE: @ 81CCBD1
	loadspritegfx 10072
	loadspritegfx 10073
	createvisualtask sub_813219C, 5
	createsprite gBattleAnimSpriteTemplate_83D715C, 2, 0, 16, -2
	playsewithpan SE_W298, 192
	delay 24
	createsprite gBattleAnimSpriteTemplate_83D715C, 2, 0, 0, -2
	playsewithpan SE_W298, 192
	delay 24
	createsprite gBattleAnimSpriteTemplate_83D715C, 2, 0, -16, -2
	playsewithpan SE_W298, 192
	delay 24
	createsprite gBattleAnimSpriteTemplate_83D715C, 2, 1, -8, -2
	playsewithpan SE_W298, 192
	delay 24
	createsprite gBattleAnimSpriteTemplate_83D715C, 2, 2, 8, -2
	playsewithpan SE_W298, 192
	end

Move_MUD_SPORT: @ 81CCC3C
	loadspritegfx 10074
	createvisualtask sub_80D074C, 2, 0, 6
	delay 24
	createsprite gMudSportDirtSpriteTemplate, 130, 0, -4, -16
	createsprite gMudSportDirtSpriteTemplate, 130, 0, 4, -12
	playsewithpan SE_W091, 192
	delay 32
	createsprite gMudSportDirtSpriteTemplate, 130, 0, -3, -12
	createsprite gMudSportDirtSpriteTemplate, 130, 0, 5, -14
	playsewithpan SE_W091, 192
	delay 32
	createsprite gMudSportDirtSpriteTemplate, 130, 0, -5, -18
	createsprite gMudSportDirtSpriteTemplate, 130, 0, 3, -14
	playsewithpan SE_W091, 192
	delay 16
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 220, 60
	waitplaysewithpan SE_W145B, 0, 15
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 60, 100
	waitplaysewithpan SE_W145B, 0, 25
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 140, 55
	waitplaysewithpan SE_W145B, 0, 14
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 180, 50
	waitplaysewithpan SE_W145B, 0, 10
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 20, 90
	waitplaysewithpan SE_W145B, 0, 22
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 90, 90
	waitplaysewithpan SE_W145B, 0, 22
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 160, 60
	waitplaysewithpan SE_W145B, 0, 15
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 30, 90
	waitplaysewithpan SE_W145B, 0, 22
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 120, 60
	waitplaysewithpan SE_W145B, 0, 15
	delay 2
	createsprite gMudSportDirtSpriteTemplate, 130, 1, 200, 40
	waitplaysewithpan SE_W145B, 0, 10
	end

Move_NEEDLE_ARM: @ 81CCD73
	loadspritegfx 10266
	loadspritegfx 10135
	loadspritegfx 10143
	loopsewithpan SE_W030, 63, 2, 16
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 0, -32, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 22, -22, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 30, 0, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 20, 20, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 0, 28, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, -19, 19, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, -27, 0, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, -18, -18, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 0, -25, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 17, -17, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 23, 0, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 0, 16, 16, 16
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 18, 1
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, 132, 0, 0, 8, 1, 0
	playsewithpan SE_W233B, 63
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 1, 0, -24, 10
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 1, 17, -17, 10
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 1, 24, 0, 10
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 1, 17, 17, 10
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 1, 0, 24, 10
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 1, -17, 17, 10
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 1, -24, 0, 10
	createsprite gBattleAnimSpriteTemplate_83D6994, 130, 1, 1, -17, -17, 10
	end

Move_SLACK_OFF: @ 81CCF23
	loadspritegfx 10031
	createvisualtask sub_813257C, 2, 0
	playsewithpan SE_W281, 192
	waitforvisualfinish
	call Unknown_81D5EF5
	waitforvisualfinish
	end

Move_CRUSH_CLAW: @ 81CCF3B
	loadspritegfx 10167
	loadspritegfx 10039
	loadspritegfx 10208
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 18, 1
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, -10, -10, 0
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, -10, 10, 0
	playsewithpan SE_W013, 63
	delay 12
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, 10, -10, 1
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, 10, 10, 1
	playsewithpan SE_W013, 63
	waitforvisualfinish
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_BANK_TARGET
	end

Move_AROMATHERAPY: @ 81CCFAB
	playsewithpan SE_W080, 0
	loadspritegfx 10159
	loadspritegfx 10203
	loadspritegfx 10049
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 1, 0, 0, 7, rgb(13, 31, 12)
	delay 1
	monbg ANIM_BANK_ATTACKER
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D68B8, 0, 24, 16, 0, 2, 2, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D68B8, 66, 64, 24, 0, 3, 1, 1, 0
	createsprite gBattleAnimSpriteTemplate_83D68D0, 0, 16, 24, 0, 2, 1, 0, 0
	delay 20
	createsprite gBattleAnimSpriteTemplate_83D68B8, 66, 48, 12, 0, 4, 3, 1, 0
	createsprite gBattleAnimSpriteTemplate_83D68B8, 0, 100, 16, 0, 3, 2, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D68B8, 0, 74, 24, 180, 3, 2, 0, 0
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D68B8, 66, 80, 30, 0, 4, 1, 1, 0
	createsprite gBattleAnimSpriteTemplate_83D68B8, 0, 128, 12, 0, 3, 3, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D68D0, 0, 90, 16, 0, 2, 1, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 1, 0, 7, 0, rgb(13, 31, 12)
	delay 1
	playsewithpan SE_W287, 192
	createvisualtask sub_81300A4, 2, 1
	waitforvisualfinish
	playsewithpan SE_W234, 192
	createsprite gBattleAnimSpriteTemplate_83D6CA0, 16, -15, 0, 0, 0, 32, 60, 1
	delay 8
	createsprite gBattleAnimSpriteTemplate_83D6CA0, 16, 12, -5, 0, 0, 32, 60, 1
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 43, 3, 10, 0, rgb(13, 31, 12)
	createsprite gBattleAnimSpriteTemplate_83D7974, 16, 0, 0, 0, 1
	waitforvisualfinish
	end

Move_FAKE_TEARS: @ 81CD10D
	loadspritegfx 10155
	loadspritegfx 10209
	loadspritegfx 10072
	createvisualtask sub_80E2C60, 5, 10155, 0, 4, 4, 32108
	waitforvisualfinish
	createvisualtask sub_812E568, 5, 0, 2, 1
	loopsewithpan SE_W039, 192, 12, 4
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DB238, 2, 0, 0
	createsprite gBattleAnimSpriteTemplate_83DB238, 2, 0, 1
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DB238, 2, 0, 2
	createsprite gBattleAnimSpriteTemplate_83DB238, 2, 0, 3
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DB238, 2, 0, 0
	createsprite gBattleAnimSpriteTemplate_83DB238, 2, 0, 1
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DB238, 2, 0, 2
	createsprite gBattleAnimSpriteTemplate_83DB238, 2, 0, 3
	waitforvisualfinish
	end

Move_AIR_CUTTER: @ 81CD19D
	loadspritegfx 10003
	loadspritegfx 10138
	loadspritegfx 10135
	delay 0
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	delay 0
	createvisualtask sub_80CFB04, 2, 32, -24, 1536, 2, 128
	waitforvisualfinish
	playsewithpan SE_W015, 63
	createsprite gBattleAnimSpriteTemplate_83D6B40, 2, 40, -32, 0, 2
	delay 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_DEF_PARTNER, 2, 0, 8, 1
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_BANK_DEF_PARTNER
	delay 0
	end

Move_ODOR_SLEUTH: @ 81CD1FF
	monbg ANIM_BANK_TARGET
	createvisualtask sub_81316F8, 5
	delay 24
	createsprite gHorizontalLungeSpriteTemplate, 2, 3, 4
	playsewithpan SE_W207, 192
	delay 6
	createsprite gHorizontalLungeSpriteTemplate, 2, 3, 4
	playsewithpan SE_W207, 192
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 3, 1, -1, 16, -1, 0
	playsewithpan SE_W043, 192
	end

Move_GRASS_WHISTLE: @ 81CD249
	loadspritegfx 10072
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 4, rgb(18, 31, 12)
	waitforvisualfinish
	createvisualtask sub_80CEA20, 2
	waitforvisualfinish
	panse_1B SE_W320, 192, 63, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 7, 1, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 6, 1, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 1, 1, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 2, 1, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 1, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 2, 1, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 5, 1, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 6, 1, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 2, 1, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 2, 1, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 1, 1, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D7114, 130, 5, 1, 0
	delay 4
	waitforvisualfinish
	createvisualtask sub_80CEAD8, 2
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 4, 4, 0, rgb(18, 31, 12)
	waitforvisualfinish
	end

Move_TICKLE: @ 81CD33C
	loadspritegfx 10218
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 2, 0, 0, 16, rgb(0, 0, 0)
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D7B94, 0, -16, -8
	createsprite gBattleAnimSpriteTemplate_83D7B94, 0, 16, -8
	playsewithpan SE_W197, 192
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 2, 0, 16, 0, rgb(0, 0, 0)
	waitforvisualfinish
	delay 20
	createvisualtask AnimTask_SwayMon, 3, 0, 6, 1280, 3, 0
	delay 12
	createvisualtask sub_812E568, 3, 1, 6, 2
	loopsewithpan SE_W039, 63, 8, 8
	waitforvisualfinish
	end

Move_WATER_SPOUT: @ 81CD3A8
	loadspritegfx 10268
	loadspritegfx 10148
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createvisualtask sub_80D40F4, 5
	playsewithpan SE_W029, 192
	delay 44
	playsewithpan SE_W291, 192
	waitforvisualfinish
	delay 16
	createvisualtask sub_80D45D8, 5
	playsewithpan SE_W057, 63
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_SHADOW_PUNCH: @ 81CD3D6
	loadspritegfx 10135
	loadspritegfx 10143
	fadetobg 2
	waitbgfadein
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 9, 8
	createvisualtask sub_807A69C, 2, 0, 13
	playsewithpan SE_W026, 192
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, 132, 0, 0, 8, 1, 0
	playsewithpan SE_W004, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end

Move_EXTRASENSORY: @ 81CD431
	call Unknown_81D61E7
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_BANK_ATTACKER, 891, 12, 1, 1
	createvisualtask sub_80DC2D4, 5, 0
	playsewithpan SE_W020, 63
	waitforvisualfinish
	createvisualtask AnimTask_BlendMonInAndOut, 5, ANIM_BANK_ATTACKER, 891, 12, 1, 1
	createvisualtask sub_80DC2D4, 5, 1
	playsewithpan SE_W020, 63
	waitforvisualfinish
	createvisualtask sub_80DC4F4, 5, 0
	createvisualtask sub_80DC2D4, 5, 2
	playsewithpan SE_W043, 192
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_BANK_DEF_PARTNER
	call Unknown_81D61F3
	end

Move_AERIAL_ACE: @ 81CD499
	loadspritegfx 10138
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 24, 6, 1, 5
	createvisualtask sub_80E2DD8, 2, 0, 4, 7, 3
	createsprite gCuttingSliceSpriteTemplate, 2, 40, -32, 0
	playsewithpan SE_W013B, 192
	delay 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 10, 1
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 0, 10, 0, 0
	playsewithpan SE_W013, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_IRON_DEFENSE: @ 81CD503
	loopsewithpan SE_REAPOKE, 192, 28, 2
	createvisualtask sub_80E0A4C, 5, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 1, 8, 2, -1, 14, -1, 0
	waitforvisualfinish
	end

Move_BLOCK: @ 81CD52D
	loadspritegfx 10250
	createsprite gBattleAnimSpriteTemplate_8402A6C, 194
	playsewithpan SE_W207, 63
	end

Move_HOWL: @ 81CD53C
	loadspritegfx 10053
	createvisualtask sub_812F724, 2, 0
	delay 12
	call _81CE35E
	createvisualtask sub_812B18C, 2, 0, 3
	waitforvisualfinish
	delay 30
	end

Move_BULK_UP: @ 81CD55E
	loadspritegfx 10086
	createvisualtask sub_80D08C8, 2
	playsewithpan SE_W207, 192
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D7764, 2
	loopsewithpan SE_W207, 192, 4, 2
	waitforvisualfinish
	end

Move_COVET: @ 81CD57C
	loadspritegfx 10210
	loadspritegfx 10224
	createvisualtask sub_812E568, 5, 0, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, 0, 20
	playsewithpan SE_W204, 192
	delay 15
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, -20, 20
	playsewithpan SE_W204, 192
	delay 15
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, 20, 20
	playsewithpan SE_W204, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	loopsewithpan SE_W146, 63, 4, 3
	end

Move_VOLT_TACKLE: @ 81CD5D9
	loadspritegfx 10001
	loadspritegfx 10212
	loadspritegfx 10213
	monbg ANIM_BANK_ATTACKER
	setalpha 12, 8
	createvisualtask sub_80E2A38, 10, 1, 0, 0, 8, 0
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D9AB4, 1
	playsewithpan SE_W268, 192
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	blendoff
	delay 8
	createvisualtask sub_80D700C, 5, 0
	playsewithpan SE_W085, 192
	waitforvisualfinish
	createvisualtask sub_80D700C, 5, 1
	playsewithpan SE_W085, 63
	waitforvisualfinish
	createvisualtask sub_80D700C, 5, 2
	playsewithpan SE_W085, 192
	waitforvisualfinish
	createvisualtask sub_80D700C, 5, 3
	playsewithpan SE_W085, 63
	waitforvisualfinish
	createvisualtask sub_80D700C, 5, 4
	playsewithpan SE_W085, 192
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 10, 0, 18, 1
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D9A9C, 2, 1, 16, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9A9C, 2, 1, -16, -16
	delay 8
	createvisualtask sub_80D6E9C, 5
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 3, 0, 9, 1
	playsewithpan SE_W085B, 192
	createsprite gBattleAnimSpriteTemplate_83D9A9C, 2, 0, 16, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9A9C, 2, 0, -16, -16
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 1, 0, 8, 0, 0
	waitforvisualfinish
	end

Move_WATER_SPORT: @ 81CD6D1
	loadspritegfx 10268
	createvisualtask sub_80D48F4, 5
	delay 8
	playsewithpan SE_W057, 192
	delay 44
	playsewithpan SE_W057, 192
	delay 44
	playsewithpan SE_W057, 192
	delay 44
	panse_1B SE_W057, 192, 63, 2, 0
	end

Move_CALM_MIND: @ 81CD6F7
	loadspritegfx 10203
	monbg ANIM_BANK_ATK_PARTNER
	createvisualtask sub_80E2A7C, 5, 0, 0, 0, 16, 0
	waitforvisualfinish
	createvisualtask sub_80E3BDC, 5, 1
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D795C, 40, 0, 0, 0, 0
	playsewithpan SE_W048, 192
	delay 14
	createsprite gBattleAnimSpriteTemplate_83D795C, 40, 0, 0, 0, 0
	playsewithpan SE_W048, 192
	delay 14
	createsprite gBattleAnimSpriteTemplate_83D795C, 40, 0, 0, 0, 0
	playsewithpan SE_W048, 192
	waitforvisualfinish
	createvisualtask sub_80E3BDC, 5, 0
	waitforvisualfinish
	createvisualtask sub_80E2A7C, 5, 0, 0, 16, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	end

Move_LEAF_BLADE: @ 81CD775
	loadspritegfx 10063
	loadspritegfx 10285
	createvisualtask sub_80CBDF4, 5
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	playsewithpan SE_W015, 63
	delay 50
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	playsewithpan SE_W015, 63
	delay 50
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	playsewithpan SE_W015, 63
	waitforvisualfinish
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	delay 12
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 8, 0, 18, 1
	createsprite gBattleAnimSpriteTemplate_83DB520, 130, 0, 0, 1, 36
	playsewithpan SE_W043, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_DRAGON_DANCE: @ 81CD7F8
	loadspritegfx 10249
	monbg ANIM_BANK_ATTACKER
	monbgprio_28 0
	delay 1
	createvisualtask sub_80DF924, 5
	playsewithpan SE_W100, 192
	delay 8
	createvisualtask sub_80798AC, 5, 10249, 19456, 14, 0, 3
	createsprite gBattleAnimSpriteTemplate_83DB0E8, 2, 0
	createsprite gBattleAnimSpriteTemplate_83DB0E8, 2, 43
	createsprite gBattleAnimSpriteTemplate_83DB0E8, 2, 85
	createsprite gBattleAnimSpriteTemplate_83DB0E8, 2, 128
	createsprite gBattleAnimSpriteTemplate_83DB0E8, 2, 170
	createsprite gBattleAnimSpriteTemplate_83DB0E8, 2, 213
	delay 30
	playsewithpan SE_W100, 192
	delay 30
	playsewithpan SE_W100, 192
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	delay 1
	end

Move_SHOCK_WAVE: @ 81CD867
	loadspritegfx 10211
	loadspritegfx 10212
	loadspritegfx 10001
	loadspritegfx 10037
	monbg ANIM_BANK_ATTACKER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 4, rgb(0, 0, 0)
	waitforvisualfinish
	createvisualtask sub_80D6B3C, 2, 0, 20, 0, 2
	playsewithpan SE_W268, 192
	delay 12
	createsprite gBattleAnimSpriteTemplate_83D9B28, 2
	delay 30
	createvisualtask sub_80D72DC, 5
	delay 12
	waitforvisualfinish
	createvisualtask sub_80D759C, 5
	playsewithpan SE_W161B, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 6, 18, 1
	createvisualtask sub_80E2A38, 5, 1, 3, 16, 0, 32767
	createvisualtask sub_80E2A38, 5, 4, 0, 16, 16, 0
	delay 4
	createvisualtask sub_80E2A38, 5, 4, 0, 0, 0, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	blendoff
	end

Move_HARDEN: @ 81CD909
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask sub_80E0A4C, 5, 0, 0, 0
	waitforvisualfinish
	end

Move_BELLY_DRUM: @ 81CD91E
	loadspritegfx 10072
	loadspritegfx 10193
	createvisualtask sub_80CEA20, 2
	waitforvisualfinish
	call _81CD9EB
	createsprite gBattleAnimSpriteTemplate_83D71A8, 2, 0, 0, 0, 0
	playsewithpan SE_W187, 192
	delay 15
	call _81CD9D0
	createsprite gBattleAnimSpriteTemplate_83D71A8, 2, 1, 1, 1, 0
	playsewithpan SE_W187, 192
	delay 15
	call _81CD9EB
	createsprite gBattleAnimSpriteTemplate_83D71A8, 2, 0, 3, 3, 128
	playsewithpan SE_W187, 192
	delay 7
	call _81CD9D0
	createsprite gBattleAnimSpriteTemplate_83D71A8, 2, 1, 2, 0, 128
	playsewithpan SE_W187, 192
	delay 7
	call _81CD9EB
	createsprite gBattleAnimSpriteTemplate_83D71A8, 2, 0, 1, 1, 0
	playsewithpan SE_W187, 192
	delay 7
	call _81CD9D0
	createsprite gBattleAnimSpriteTemplate_83D71A8, 2, 1, 0, 3, 0
	playsewithpan SE_W187, 192
	waitforvisualfinish
	createvisualtask sub_80CEAD8, 2
	waitforvisualfinish
	end
_81CD9D0:
	createsprite gBattleAnimSpriteTemplate_83D7174, 3, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_ATTACKER, 0, 8, 2, 1
	return
_81CD9EB:
	createsprite gBattleAnimSpriteTemplate_83D7174, 3, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_ATTACKER, 0, 8, 2, 1
	return

Move_MIND_READER: @ 81CDA06
	loadspritegfx 10189
	loadspritegfx 10190
	loadspritegfx 10191
	monbg 4
	playsewithpan SE_W109, 63
	createsprite gBattleAnimSpriteTemplate_84021DC, 5, 0, 0, 1, 0
	createsprite gBattleAnimSpriteTemplate_84021F4, 5
	delay 40
	playsewithpan SE_W043, 63
	createvisualtask sub_80E1F8C, 2, 1, 1, 2, 0, 10, 0
	call _81CDA4D
	waitforvisualfinish
	clearmonbg 4
	end
_81CDA4D:
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 70, 0, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 40, 40, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 10, -60, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, -50, -40, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, -40, 40, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 50, -50, 6
	delay 2
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 50, -30, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 60, 10, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 0, 60, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 0, -40, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, -60, 20, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, -60, -30, 6
	delay 2
	createsprite gBattleAnimSpriteTemplate_840220C, 4, -50, 50, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, -60, 20, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, -40, -40, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 20, -60, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 50, -50, 6
	createsprite gBattleAnimSpriteTemplate_840220C, 4, 35, 40, 6
	delay 2
	return

Move_ICE_PUNCH: @ 81CDB3E
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	loadspritegfx 10141
	loadspritegfx 10135
	loadspritegfx 10143
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 7, rgb(0, 0, 0)
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 9, 32588
	delay 20
	playsewithpan SE_W081, 63
	createsprite gBattleAnimSpriteTemplate_83D9BF8, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D9BF8, 2, 64
	createsprite gBattleAnimSpriteTemplate_83D9BF8, 2, 128
	createsprite gBattleAnimSpriteTemplate_83D9BF8, 2, 192
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D9BE0, 2, 32
	createsprite gBattleAnimSpriteTemplate_83D9BE0, 2, 96
	createsprite gBattleAnimSpriteTemplate_83D9BE0, 2, 160
	createsprite gBattleAnimSpriteTemplate_83D9BE0, 2, 224
	delay 17
	createsprite gFistFootSpriteTemplate, 4, 0, -10, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, -10, 1, 1
	playsewithpan SE_W004, 63
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 3, 1
	waitforvisualfinish
	delay 15
	call Unknown_81D5C36
	delay 5
	createvisualtask sub_80E2A38, 10, 4, 2, 9, 0, 32588
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 0, 7, 0, rgb(0, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_REST: @ 81CDC29
	playsewithpan SE_W173, 192
	loadspritegfx 10228
	createsprite gBattleAnimSpriteTemplate_83D6D94, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gBattleAnimSpriteTemplate_83D6D94, 2, 4, -10, 16, 0, 0
	delay 20
	createsprite gBattleAnimSpriteTemplate_83D6D94, 2, 4, -10, 16, 0, 0
	waitforvisualfinish
	end

Move_CONFUSION: @ 81CDC69
	monbg ANIM_BANK_DEF_PARTNER
	call Unknown_81D61E7
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 10, 1
	createvisualtask sub_80E1F8C, 2, 2, 0, 2, 0, 8, 32767
	waitforvisualfinish
	playsewithpan SE_W048, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_BANK_TARGET, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	delay 1
	call Unknown_81D61F3
	end

Move_PSYCHIC: @ 81CDCCA
	monbg ANIM_BANK_DEF_PARTNER
	call Unknown_81D61E7
	setalpha 8, 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 10, 1
	createvisualtask sub_80E1F8C, 2, 2, 0, 2, 0, 8, 767
	waitforvisualfinish
	loopsewithpan SE_W048, 63, 10, 3
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, ANIM_BANK_TARGET, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	delay 1
	call Unknown_81D61F3
	end

Move_FUTURE_SIGHT: @ 81CDD2D
	goto _81CDD3B
_81CDD32:
	waitforvisualfinish
	delay 1
	call Unknown_81D61F3
	end
_81CDD3B:
	monbg ANIM_BANK_ATK_PARTNER
	playsewithpan SE_W060, 192
	call Unknown_81D61E7
	setalpha 8, 8
	playsewithpan SE_W048, 192
	createvisualtask sub_80E1F8C, 2, 2, 0, 2, 0, 8, 32767
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_BANK_ATTACKER, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	goto _81CDD32

Unknown_81CDD7A: @ 81CDD7A
	monbg ANIM_BANK_DEF_PARTNER
	playsewithpan SE_W060, 192
	call Unknown_81D61E7
	setalpha 8, 8
	playsewithpan SE_W048, 63
	waitplaysewithpan SE_W048, 63, 8
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 4, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 15, ANIM_BANK_TARGET, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 4, 0, 24, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	goto _81CDD32

Move_THUNDER: @ 81CDDCE
	loadspritegfx 10037
	fadetobg 11
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, -256, 0, 1, -1
	waitbgfadein
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 16, rgb(0, 0, 0)
	delay 16
	createvisualtask sub_80E2324, 2, 257, 257, 257
	playsewithpan SE_W086, 63
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 16, -36
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 16, -20
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 16, 12
	delay 20
	createsprite gBattleAnimSpriteTemplate_83D97D0, 134, -16, -32
	playsewithpan SE_W086, 63
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 134, -16, -16
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 134, -16, 16
	playsewithpan SE_W086, 63
	delay 5
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 24, -32
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 24, -16
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 24, 16
	delay 30
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 5
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 0, -32
	playsewithpan SE_W161B, 63
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 0, -16
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 0, 16
	delay 10
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	createvisualtask sub_80D60B4, 2, 30, 3, 1, 0
	delay 2
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, 130, 1, 2, 16, 0, rgb(0, 0, 0)
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end

Move_THUNDER_PUNCH: @ 81CDF28
	loadspritegfx 10135
	loadspritegfx 10143
	loadspritegfx 10037
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 16, rgb(0, 0, 0)
	waitforvisualfinish
	playsewithpan SE_W004, 63
	createsprite gFistFootSpriteTemplate, 132, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 1
	delay 1
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 0, -48
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 2, 0, -16
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 2, 0, 16
	delay 1
	playsewithpan SE_W161B, 63
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 15, 1
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 2
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 16, 0, rgb(0, 0, 0)
	delay 20
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_SACRED_FIRE: @ 81CDFF1
	loadspritegfx 10033
	loadspritegfx 10035
	loopsewithpan SE_W221, 192, 7, 5
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -32, 0, 50, 5, -2, 0
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, -20, -10, 50, 5, -1, -1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 0, -16, 50, 5, 0, -1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 20, -10, 50, 5, 1, -1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, 32, 0, 50, 5, 2, 0
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, 20, 10, 50, 5, 1, 1
	delay 1
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, 0, 16, 50, 5, 0, 1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -20, 10, 50, 5, -1, 1
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	waitforvisualfinish
	playsewithpan SE_W221B, 63
	createsprite gBattleAnimSpriteTemplate_83D9508, 130, -16, 0, 70, 16, 0, 1
	delay 10
	playsewithpan SE_W221B, 63
	createsprite gBattleAnimSpriteTemplate_83D9508, 130, 0, 0, 70, 16, 0, 1
	delay 10
	playsewithpan SE_W221B, 63
	createsprite gBattleAnimSpriteTemplate_83D9508, 130, 16, 0, 80, 16, 0, 1
	delay 1
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	waitforvisualfinish
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 1
	playsewithpan SE_W172B, 63
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, -1, 0
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 0, 1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, -1, -1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 2, 1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 1, -1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, -1, 1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 1, -2
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 3, 1
	waitforvisualfinish
	end

Move_SCRATCH: @ 81CE1D8
	loadspritegfx 10137
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W010, 63
	createsprite gBattleAnimSpriteTemplate_8402180, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	waitforvisualfinish
	end

Move_DRAGON_BREATH: @ 81CE20A
	loadspritegfx 10029
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	loopsewithpan SE_W172, 192, 7, 7
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createvisualtask sub_80E2A38, 10, 4, 1, 0, 9, 31
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 21, 1
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DB044, 130, 0, 0, 0, 0, 20
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 4, 1, 9, 0, 31
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Move_ROAR: @ 81CE31E
	loadspritegfx 10053
	monbg ANIM_BANK_ATTACKER
	monbgprio_28 0
	setalpha 8, 8
	createvisualtask sub_812B18C, 2, 0, 2
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, ANIM_BANK_ATTACKER, 1
	call _81CE35E
	delay 20
	createvisualtask sub_80A8A80, 5, 1, 2
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	blendoff
	waitforvisualfinish
	delay 20
	end
_81CE35E:
	createsprite gBattleAnimSpriteTemplate_8402934, 2, 24, -8, 0
	createsprite gBattleAnimSpriteTemplate_8402934, 2, 24, 0, 2
	createsprite gBattleAnimSpriteTemplate_8402934, 2, 24, 8, 1
	delay 15
	createsprite gBattleAnimSpriteTemplate_8402934, 2, 24, -8, 0
	createsprite gBattleAnimSpriteTemplate_8402934, 2, 24, 0, 2
	createsprite gBattleAnimSpriteTemplate_8402934, 2, 24, 8, 1
	return

Move_GROWL: @ 81CE3AF
	loadspritegfx 10053
	createvisualtask sub_812B18C, 2, 0, 255
	call _81CE35E
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	delay 20
	end

Move_SNORE: @ 81CE3EA
	loadspritegfx 10197
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 8, 8
	call _81CE403
	delay 30
	call _81CE403
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	end
_81CE403:
	playsewithpan SE_W173, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -7, -7, 7, ANIM_BANK_ATTACKER, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 7, 1
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, 6, 1, 14, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D77F8, 2, 0, 0, -42, -38, 24, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D77F8, 2, 0, 0, 0, -42, 24, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D77F8, 2, 0, 0, 42, -38, 24, 0, 0
	return

Move_LIGHT_SCREEN: @ 81CE47A
	loadspritegfx 10070
	loadspritegfx 10166
	setalpha 0, 16
	waitplaysewithpan SE_W115, 192, 15
	createsprite gBattleAnimSpriteTemplate_83DA6A8, 1, 40, 0, 10166
	delay 10
	call _81CE4A1
	waitforvisualfinish
	delay 1
	blendoff
	end
_81CE4A1:
	createsprite gBattleAnimSpriteTemplate_83DA76C, 2, 23, 0, 0, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DA76C, 2, 31, -8, 0, 1
	delay 5
	createsprite gBattleAnimSpriteTemplate_83DA76C, 2, 30, 20, 0, 1
	delay 7
	createsprite gBattleAnimSpriteTemplate_83DA76C, 2, 10, -15, 0, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DA76C, 2, 20, 10, 0, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83DA76C, 2, 10, 18, 0, 1
	return

Move_MIRROR_COAT: @ 81CE506
	loadspritegfx 10070
	loadspritegfx 10168
	setalpha 0, 16
	createsprite gBattleAnimSpriteTemplate_83DA6D8, 1, 40, 0, 10168
	delay 10
	playsewithpan SE_W115, 192
	call _81CE4A1
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_REFLECT: @ 81CE52C
	loadspritegfx 10071
	loadspritegfx 10167
	setalpha 0, 16
	waitplaysewithpan SE_W115, 192, 15
	createsprite gBattleAnimSpriteTemplate_83DA6C0, 1, 40, 0, 10167
	delay 20
	createsprite gBattleAnimSpriteTemplate_83DA73C, 2, 30, 0, 0, 1
	delay 7
	createsprite gBattleAnimSpriteTemplate_83DA73C, 2, 19, -12, 0, 1
	delay 7
	createsprite gBattleAnimSpriteTemplate_83DA73C, 2, 10, 20, 0, 1
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_BARRIER: @ 81CE57F
	loadspritegfx 10169
	setalpha 0, 16
	waitplaysewithpan SE_W112, 192, 15
	createsprite gBattleAnimSpriteTemplate_83DA6F0, 3, 40, 0, 10169
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_BUBBLE: @ 81CE59C
	loadspritegfx 10146
	loadspritegfx 10155
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 15, -15, 10, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 35, 37, 40, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 10, -37, 30, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 30, 10, 15, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 20, 33, 20, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	delay 6
	createsprite gBattleAnimSpriteTemplate_83D9178, 2, 18, 0, 25, -30, 10, 128, 100
	playsewithpan SE_W145, 192
	waitplaysewithpan SE_W145B, 63, 100
	waitforvisualfinish
	call WaterBubbleEffect2
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_SMOG: @ 81CE672
	loadspritegfx 10172
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_29
	setalpha 12, 8
	loopsewithpan SE_W054, 63, 17, 10
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	delay 120
	loopsewithpan SE_W092, 63, 18, 2
	createvisualtask sub_80E1F8C, 2, 4, 2, 2, 0, 12, 26650
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 15, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81CE6D7:
	createsprite gBattleAnimSpriteTemplate_83D9D54, 2, 0, -24, 48, 240, 1, 0
	delay 7
	return

Move_FAINT_ATTACK: @ 81CE6ED
	loadspritegfx 10135
	monbg ANIM_BANK_ATTACKER
	fadetobg 1
	waitbgfadein
	delay 0
	playsewithpan SE_W185, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 18, 6, 1, 3
	createvisualtask sub_80DFC24, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	invisible 0
	delay 1
	createvisualtask sub_80E4300, 2
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 9, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	delay 1
	setarg 7, 4096
	delay 32
	createvisualtask sub_80DFDC0, 2
	monbg ANIM_BANK_ATTACKER
	createvisualtask sub_80DFD24, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	delay 1
	restorebg
	waitbgfadein
	end

Move_SAND_ATTACK: @ 81CE774
	loadspritegfx 10074
	monbg ANIM_BANK_ATK_PARTNER
	monbgprio_28 0
	setalpha 12, 8
	playsewithpan SE_W028, 192
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, -10, 0, 0, 3
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 2
	call Move_SAND_ATTACK_CreateDirtSpray
	call Move_SAND_ATTACK_CreateDirtSpray
	call Move_SAND_ATTACK_CreateDirtSpray
	call Move_SAND_ATTACK_CreateDirtSpray
	call Move_SAND_ATTACK_CreateDirtSpray
	call Move_SAND_ATTACK_CreateDirtSpray
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	end
Move_SAND_ATTACK_CreateDirtSpray:
	createsprite gSandAttackDirtSpriteTemplate, 130, 15, 15, 20, 0, 0
	createsprite gSandAttackDirtSpriteTemplate, 130, 15, 15, 20, 10, 10
	createsprite gSandAttackDirtSpriteTemplate, 130, 15, 15, 20, -10, -10
	createsprite gSandAttackDirtSpriteTemplate, 130, 15, 15, 20, 20, 5
	createsprite gSandAttackDirtSpriteTemplate, 130, 15, 15, 20, -20, -5
	delay 2
	return

Move_MUD_SLAP: @ 81CE81C
	loadspritegfx 10074
	playsewithpan SE_W028, 192
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, -10, 0, 0, 3
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 2
	call Move_MUD_SLAP_CreateMudSpray
	call Move_MUD_SLAP_CreateMudSpray
	call Move_MUD_SLAP_CreateMudSpray
	call Move_MUD_SLAP_CreateMudSpray
	call Move_MUD_SLAP_CreateMudSpray
	call Move_MUD_SLAP_CreateMudSpray
	waitforvisualfinish
	end
Move_MUD_SLAP_CreateMudSpray:
	createsprite gMudSlapDirtSpriteTemplate, 130, 15, 15, 20, 0, 0
	createsprite gMudSlapDirtSpriteTemplate, 130, 15, 15, 20, 10, 5
	createsprite gMudSlapDirtSpriteTemplate, 130, 15, 15, 20, -10, -5
	createsprite gMudSlapDirtSpriteTemplate, 130, 15, 15, 20, 20, 10
	createsprite gMudSlapDirtSpriteTemplate, 130, 15, 15, 20, -20, -10
	delay 2
	return

Move_DRAGON_RAGE: @ 81CE8BA
	loadspritegfx 10029
	loadspritegfx 10035
	playsewithpan SE_W082, 192
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 40, 1
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, 130, 0, 15, 0, 0, 4
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DB0D0, 130, 30, 15, 0, 10, 10
	waitforvisualfinish
	loopsewithpan SE_W172B, 63, 11, 3
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 3, 25, 1
	createsprite gBattleAnimSpriteTemplate_83DB078, 194, 1, 5, 0
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB078, 194, 1, -10, -15
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB078, 130, 1, 0, 25
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB078, 194, 1, 15, 5
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB078, 194, 1, -25, 0
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB078, 130, 1, 30, 30
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB078, 130, 1, -27, 25
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB078, 194, 1, 0, 8
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 194, 0, 0, 4
	waitforvisualfinish
	end

Move_RAIN_DANCE: @ 81CE997
	loadspritegfx 10115
	playsewithpan SE_W240, 192
	createvisualtask sub_80E2A38, 10, 1921, 2, 0, 4, 0
	waitforvisualfinish
	createvisualtask CreateAnimRaindrops, 2, 0, 3, 120
	createvisualtask CreateAnimRaindrops, 2, 0, 3, 120
	delay 120
	delay 30
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 1921, 2, 4, 0, 0
	waitforvisualfinish
	end

Move_BITE: @ 81CE9E2
	loadspritegfx 10139
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W044, 63
	createsprite gBattleAnimSpriteTemplate_83DB1D0, 2, 0, -32, 0, 0, 819, 10
	createsprite gBattleAnimSpriteTemplate_83DB1D0, 2, 0, 32, 4, 0, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 4, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	delay 1
	end

Move_CRUNCH: @ 81CEA40
	loadspritegfx 10139
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	fadetobg 1
	waitbgfadein
	setalpha 12, 8
	playsewithpan SE_W044, 63
	createsprite gBattleAnimSpriteTemplate_83DB1D0, 2, -32, -32, 1, 819, 819, 10
	createsprite gBattleAnimSpriteTemplate_83DB1D0, 2, 32, 32, 5, -819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, 2, -8, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 7, 5, 2
	waitforvisualfinish
	playsewithpan SE_W044, 63
	createsprite gBattleAnimSpriteTemplate_83DB1D0, 2, 32, -32, 7, -819, 819, 10
	createsprite gBattleAnimSpriteTemplate_83DB1D0, 2, -32, 32, 3, 819, -819, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, 2, 8, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 8, 4, 2
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	delay 1
	restorebg
	waitbgfadein
	end

Move_CLAMP: @ 81CEAF0
	loadspritegfx 10145
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W011, 63
	createsprite gBattleAnimSpriteTemplate_83DB1E8, 2, -32, 0, 2, 819, 0, 10
	createsprite gBattleAnimSpriteTemplate_83DB1E8, 2, 32, 0, 6, -819, 0, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 5, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	waitforvisualfinish
	end

Move_ICE_BEAM: @ 81CEB4D
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	loadspritegfx 10141
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 7, rgb(0, 0, 0)
	waitforvisualfinish
	createsoundtask sub_812B058, 183, -64, 63, 4, 4, 0, 10
	createsprite gBattleAnimSpriteTemplate_83D9C3C, 2, 20, 12, 0, 12, 20
	createsprite gBattleAnimSpriteTemplate_83D9C3C, 2, 20, -12, 0, -12, 20
	delay 1
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 4, -31, 0, 7, rgb(0, 20, 31)
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 25, 1
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	createsprite gBattleAnimSpriteTemplate_83D9C24, 2, 20, 0, 0, 0, 11
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9C24, 2, 20, 0, 0, 0, 11
	waitforvisualfinish
	delay 20
	call Unknown_81D5C36
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 4, 5, 7, 0, rgb(0, 20, 31)
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 0, 7, 0, rgb(0, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end
_81CEC4E:
	createsprite gBattleAnimSpriteTemplate_83D9C3C, 2, 20, 12, 0, 12, 20
	createsprite gBattleAnimSpriteTemplate_83D9C3C, 2, 20, -12, 0, -12, 20
	createsprite gBattleAnimSpriteTemplate_83D9C24, 2, 20, 0, 0, 0, 11
	delay 1
	return

Move_WITHDRAW: @ 81CEC84
	playsewithpan SE_W029, 192
	createvisualtask sub_80CF4D8, 5
	waitforvisualfinish
	end

Move_AURORA_BEAM: @ 81CEC91
	loadspritegfx 10140
	fadetobg 20
	waitbgfadein
	playsewithpan SE_W062, 192
	setarg 7, 0
	createvisualtask sub_80D3490, 10, 130
	call _81CED18
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 17, 1
	call _81CED18
	call _81CED18
	call _81CED18
	setarg 7, -1
	createsoundtask sub_812B058, 183, -64, 63, 3, 6, 0, 10
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 40, 1
	call _81CED18
	call _81CED18
	call _81CED18
	call _81CED18
	call _81CED18
	call _81CED18
	waitforvisualfinish
	restorebg
	waitbgfadein
	end
_81CED18:
	createsprite gBattleAnimSpriteTemplate_83D91C4, 130, 20, 0, 0, 0, 17
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D91C4, 130, 20, 0, 0, 0, 17
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D91C4, 130, 20, 0, 0, 0, 17
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D91C4, 130, 20, 0, 0, 0, 17
	delay 1
	return

Move_SOLAR_BEAM: @ 81CED65
	loadspritegfx 10147
	choosetwoturnanim _81CED73, _81CEE70
_81CED71:
	waitforvisualfinish
	end
_81CED73:
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 12, 8
	createvisualtask sub_80E1F8C, 2, 2, 1, 4, 0, 11, 12287
	playsewithpan SE_W025, 192
	call _81CED9D
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	goto _81CED71
_81CED9D:
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 40, 40, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -40, -40, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 0, 40, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 0, -40, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 40, -20, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 40, 20, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -40, -20, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -40, 20, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -20, 30, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 20, -30, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -20, -30, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 20, 30, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -40, 0, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 40, 0, 16
	delay 2
	return
_81CEE70:
	call Unknown_81D6233
	panse_1B SE_W076, 192, 63, 2, 0
	createvisualtask sub_80CA928, 5
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 1
	delay 4
	createvisualtask sub_80E2A38, 10, 4, 1, 0, 10, 1017
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 2
	delay 4
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 65, 1
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 3
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 4
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 5
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 6
	delay 4
	call _81CEF42
	call _81CEF42
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 4, 1, 10, 0, 1017
	call Unknown_81D626D
	goto _81CED71
_81CEF42:
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 2
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 3
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 4
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 5
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D6304, 131, 15, 0, 20, 6
	delay 4
	return

Move_BLIZZARD: @ 81CEFBA
	loadspritegfx 10141
	monbg ANIM_BANK_DEF_PARTNER
	createvisualtask sub_80E3B4C, 2
	jumpargeq 7, 1, _81CF13F
	fadetobg 9
_81CEFD0:
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, -2304, 0, 1, -1
	waitbgfadein
	waitforvisualfinish
	panse_1B SE_W059, 192, 63, 2, 0
	call _81CF00A
	call _81CF00A
	playsewithpan SE_W059B, 63
	waitforvisualfinish
	call Unknown_81D5CBA
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	delay 20
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end
_81CF00A:
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 40, 0, -10, 0, -10, 72, 1
	createsprite gBattleAnimSpriteTemplate_83D9CC0, 40, 0, 0, 0, 0, 80, 0, 0, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 40, 0, -15, 0, -15, 72, 1
	createsprite gBattleAnimSpriteTemplate_83D9CC0, 40, 0, -10, 0, -10, 80, 0, 0, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 40, 0, -5, 0, -5, 72, 1
	createsprite gBattleAnimSpriteTemplate_83D9CC0, 40, 0, 10, 0, 10, 80, 0, 0, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 40, 0, -10, 0, -10, 72, 1
	createsprite gBattleAnimSpriteTemplate_83D9CC0, 40, 0, -20, 0, -20, 80, 0, 0, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 40, 0, -20, 0, -20, 72, 1
	createsprite gBattleAnimSpriteTemplate_83D9CC0, 40, 0, 15, 0, 15, 80, 0, 0, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 40, 0, -15, 0, -15, 72, 1
	createsprite gBattleAnimSpriteTemplate_83D9CC0, 40, 0, -20, 0, -20, 80, 0, 0, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CA8, 40, 0, -25, 0, -25, 72, 1
	createsprite gBattleAnimSpriteTemplate_83D9CC0, 40, 0, 20, 0, 20, 80, 0, 0, 1
	delay 3
	return
_81CF13F:
	fadetobg 10
	goto _81CEFD0

Move_POWDER_SNOW: @ 81CF146
	loadspritegfx 10141
	monbg ANIM_BANK_DEF_PARTNER
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 31, 1, 0, 3, rgb(0, 0, 0)
	waitforvisualfinish
	panse_1B SE_W016, 192, 63, 2, 0
	call _81CF190
	call _81CF190
	playsewithpan SE_W016B, 63
	waitforvisualfinish
	waitsound
	call Unknown_81D5CBA
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	delay 20
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 31, 1, 3, 0, rgb(0, 0, 0)
	end
_81CF190:
	createsprite gBattleAnimSpriteTemplate_83D9CD8, 40, 0, 0, 0, 0, 56, 4, 4, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CD8, 40, 0, -10, 0, -10, 56, 4, 4, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CD8, 40, 0, 10, 0, 10, 56, -4, 3, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CD8, 40, 0, -20, 0, -20, 56, -4, 5, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CD8, 40, 0, 15, 0, 15, 56, 4, 4, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CD8, 40, 0, -20, 0, -20, 56, 4, 4, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9CD8, 40, 0, 20, 0, 20, 56, 4, 4, 1
	delay 3
	return

Move_HYDRO_PUMP: @ 81CF240
	loadspritegfx 10149
	loadspritegfx 10148
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 40, 1
	delay 6
	panse_1B SE_W056, 192, 63, 2, 0
	createvisualtask sub_80D3630, 5, 100
	call _81CF2DF
	call _81CF2DF
	call _81CF2DF
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 37, 1
	call _81CF320
	call _81CF2DF
	call _81CF2DF
	call _81CF320
	call _81CF2DF
	call _81CF2DF
	call _81CF320
	call _81CF2DF
	call _81CF2DF
	call _81CF320
	call _81CF2DF
	call _81CF2DF
	call _81CF320
	delay 1
	delay 1
	call _81CF320
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81CF2DF:
	createsprite gBattleAnimSpriteTemplate_83D91F4, 3, 10, 10, 0, 16
	createsprite gBattleAnimSpriteTemplate_83D91F4, 3, 10, 10, 0, -16
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D91F4, 3, 10, 10, 0, 16
	createsprite gBattleAnimSpriteTemplate_83D91F4, 3, 10, 10, 0, -16
	delay 1
	return
_81CF320:
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 4, 0, 15, 1, 1
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 4, 0, -15, 1, 1
	return

Move_SIGNAL_BEAM: @ 81CF33F
	loadspritegfx 10264
	loadspritegfx 10265
	loadspritegfx 10073
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 25, 1
	delay 6
	panse_1B SE_W062, 192, 63, 1, 0
	createvisualtask sub_80D3630, 5, 100
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 25, 1
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 4, 8, 5, 31, 8, 961, 8
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	waitforvisualfinish
	end
_81CF406:
	createsprite gBattleAnimSpriteTemplate_83D9224, 131, 10, 10, 0, 16
	createsprite gBattleAnimSpriteTemplate_83D923C, 131, 10, 10, 0, -16
	delay 1
	return

Move_ABSORB: @ 81CF427
	loadspritegfx 10147
	loadspritegfx 10031
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 4, rgb(13, 31, 12)
	waitforvisualfinish
	playsewithpan SE_W071, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call _81CF496
	waitforvisualfinish
	delay 15
	call Unknown_81D5EF5
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 4, 0, rgb(13, 31, 12)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81CF496:
	playsewithpan SE_W152, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W152, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W152, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	delay 4
	playsewithpan SE_W152, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, -15, -16, 36
	delay 4
	playsewithpan SE_W152, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W152, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W152, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W152, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 5, -18, -20, 35
	delay 4
	return

Move_MEGA_DRAIN: @ 81CF53F
	loadspritegfx 10147
	loadspritegfx 10031
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 8, rgb(13, 31, 12)
	waitforvisualfinish
	playsewithpan SE_W071, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 1
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call _81CF5AE
	waitforvisualfinish
	delay 15
	call Unknown_81D5EF5
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 8, 0, rgb(13, 31, 12)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81CF5AE:
	playsewithpan SE_W145C, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 5, -18, -20, 35
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, -15, -16, 36
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, -15, -16, 36
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 20, 39
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W145C, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 5, -18, -20, 35
	delay 4
	return

Move_GIGA_DRAIN: @ 81CF6CF
	loadspritegfx 10147
	loadspritegfx 10031
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 12, rgb(13, 31, 12)
	waitforvisualfinish
	playsewithpan SE_W071, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 0
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	delay 3
	call _81CF73E
	waitforvisualfinish
	delay 15
	call Unknown_81D5EF5
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 12, 0, rgb(13, 31, 12)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81CF73E:
	playsewithpan SE_W202, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 5, -18, -40, 35
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W202, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 28, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 40, 39
	delay 4
	playsewithpan SE_W202, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -32, 26
	delay 4
	playsewithpan SE_W202, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, -15, -16, 36
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W202, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, -15, -16, 36
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W202, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -40, 26
	delay 4
	playsewithpan SE_W202, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 36, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W202, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 5, -18, -20, 35
	delay 4
	return

Move_LEECH_LIFE: @ 81CF8D7
	loadspritegfx 10161
	loadspritegfx 10147
	delay 1
	loadspritegfx 10031
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	setalpha 12, 8
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DAB10, 2, -20, 15, 12
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	playsewithpan SE_W071, 63
	delay 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 7, rgb(0, 0, 0)
	waitforvisualfinish
	call _81CF496
	waitforvisualfinish
	delay 15
	call Unknown_81D5EF5
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 7, 0, rgb(0, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_SYNTHESIS: @ 81CF959
	loadspritegfx 10031
	loadspritegfx 10049
	createvisualtask sub_80E1F8C, 2, 2, 2, 2, 0, 16, 19451
	playsewithpan SE_W025, 192
	call Unknown_81D5ECA
	waitforvisualfinish
	call Unknown_81D5EF5
	waitforvisualfinish
	end

Move_TOXIC: @ 81CF983
	loadspritegfx 10151
	loadspritegfx 10150
	call _81CF99D
	call _81CF99D
	waitforvisualfinish
	delay 15
	call PoisonBubblesAnim
	waitforvisualfinish
	end
_81CF99D:
	createsprite gBattleAnimSpriteTemplate_83DA244, 130, -24, 16, 1, 1
	playsewithpan SE_W092, 63
	delay 15
	createsprite gBattleAnimSpriteTemplate_83DA244, 130, 8, 16, 1, 1
	playsewithpan SE_W092, 63
	delay 15
	createsprite gBattleAnimSpriteTemplate_83DA244, 130, -8, 16, 1, 1
	playsewithpan SE_W092, 63
	delay 15
	createsprite gBattleAnimSpriteTemplate_83DA244, 130, 24, 16, 1, 1
	playsewithpan SE_W092, 63
	delay 15
	return

Move_SLUDGE: @ 81CF9F2
	loadspritegfx 10150
	playsewithpan SE_W145C, 192
	createsprite gBattleAnimSpriteTemplate_83DA2B8, 130, 20, 0, 40, 0
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 5, 1
	createvisualtask sub_80E1F8C, 2, 4, 1, 2, 0, 12, 31774
	call PoisonBubblesAnim
	waitforvisualfinish
	end

Move_SLUDGE_BOMB: @ 81CFA34
	loadspritegfx 10150
	call _81CFB44
	call _81CFB44
	call _81CFB44
	call _81CFB44
	call _81CFB44
	call _81CFB44
	call _81CFB44
	call _81CFB44
	call _81CFB44
	call _81CFB44
	createvisualtask AnimTask_ShakeMon2, 5, 1, 3, 0, 15, 1
	createvisualtask sub_80E1F8C, 2, 4, 1, 2, 0, 12, 31774
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, 42, 27, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, -27, 44, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, 39, -28, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, -42, -42, 20
	playsewithpan SE_W091, 63
	delay 5
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, 0, 40, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, -8, -44, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, -46, -28, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, 46, 9, 20
	playsewithpan SE_W091, 63
	delay 5
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, 42, 0, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, -43, -12, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, 16, -46, 20
	createsprite gBattleAnimSpriteTemplate_83DA2E8, 130, -16, 44, 20
	playsewithpan SE_W091, 63
	delay 0
	waitsound
	waitforvisualfinish
	call PoisonBubblesAnim
	waitforvisualfinish
	end
_81CFB44:
	playsewithpan SE_W145C, 192
	createsprite gBattleAnimSpriteTemplate_83DA2B8, 130, 20, 0, 40, 0
	delay 3
	return

Move_ACID: @ 81CFB5A
	loadspritegfx 10150
	monbg ANIM_BANK_DEF_PARTNER
	createsprite gBattleAnimSpriteTemplate_83DA2D0, 130, 20, 0, 40, 1, 0, 0
	playsewithpan SE_W145C, 192
	delay 5
	createsprite gBattleAnimSpriteTemplate_83DA2D0, 130, 20, 0, 40, 1, 24, 0
	playsewithpan SE_W145C, 192
	delay 5
	createsprite gBattleAnimSpriteTemplate_83DA2D0, 130, 20, 0, 40, 1, -24, 0
	playsewithpan SE_W145C, 192
	delay 15
	createvisualtask AnimTask_ShakeMon2, 5, 1, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 5, 3, 2, 0, 10, 1
	createvisualtask sub_80E1F8C, 2, 20, 2, 2, 0, 12, 31774
	createsprite gBattleAnimSpriteTemplate_83DA31C, 130, 0, -22, 0, 15, 55
	playsewithpan SE_W145, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DA31C, 130, -26, -24, 0, 15, 55
	playsewithpan SE_W145, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DA31C, 130, 15, -27, 0, 15, 50
	playsewithpan SE_W145, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DA31C, 130, -15, -17, 0, 10, 45
	playsewithpan SE_W145, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DA31C, 130, 27, -22, 0, 15, 50
	playsewithpan SE_W145, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Move_BONEMERANG: @ 81CFC54
	loadspritegfx 10000
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W155, 192
	createsprite gBonemerangSpriteTemplate, 2
	delay 20
	playsewithpan SE_W030, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 5, 1
	delay 17
	playsewithpan SE_W233, 192
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, -4
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_BONE_CLUB: @ 81CFCA8
	loadspritegfx 10000
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W155, 63
	createsprite gBoneHitSpriteTemplate, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 5, 1
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 5, 1, 0, 10, 0, 0
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_BONE_RUSH: @ 81CFD0A
	loadspritegfx 10000
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W155, 63
	createsprite gBoneHitSpriteTemplate, 2, -42, -25, 0, 0, 15
	delay 12
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 3, 5, 1
	playsewithpan SE_W030, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_SPIKES: @ 81CFD55
	loadspritegfx 10152
	monbg ANIM_BANK_DEF_PARTNER
	playsewithpan SE_W026, 192
	waitplaysewithpan SE_W030, 63, 28
	createsprite gBattleAnimSpriteTemplate_840227C, 130, 20, 0, 0, 24, 30
	delay 10
	playsewithpan SE_W026, 192
	waitplaysewithpan SE_W030, 63, 28
	createsprite gBattleAnimSpriteTemplate_840227C, 130, 20, 0, -24, 24, 30
	delay 10
	waitplaysewithpan SE_W030, 63, 28
	createsprite gBattleAnimSpriteTemplate_840227C, 130, 20, 0, 24, 24, 30
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Move_MEGAHORN: @ 81CFDAC
	loadspritegfx 10153
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	playsewithpan SE_W082, 192
	jumpifcontest _81CFE83
	fadetobg 7
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, -2304, 768, 1, -1
_81CFDCF:
	waitbgfadein
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 2, 0, 15, 1
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 24, 0, 0, 6
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DAABC, 3, -42, 25, 0, 0, 6
	delay 4
	playsewithpan SE_W011, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 0
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -16, 4, 1, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, -4, 1, 12, 1
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 5, 1, 32767, 10, 0, 0
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 11
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 7
	waitforvisualfinish
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end
_81CFE83:
	fadetobg 8
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, 2304, 768, 0, -1
	goto _81CFDCF

Move_GUST: @ 81CFE9A
	loadspritegfx 10009
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W016, 63
	createsprite gBattleAnimSpriteTemplate_83DA380, 2, 0, -16
	createvisualtask sub_80DA09C, 5, 1, 70
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 7, 1
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	playsewithpan SE_W016B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_WING_ATTACK: @ 81CFEEB
	loadspritegfx 10009
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	loopsewithpan SE_W017, 192, 20, 2
	createvisualtask AnimTask_TranslateMonElliptical, 2, ANIM_BANK_ATTACKER, 12, 4, 1, 4
	createvisualtask sub_80DA09C, 5, 1, 70
	createsprite gBattleAnimSpriteTemplate_83DA3B4, 2, -25, 0, 0, 0, 20
	createsprite gBattleAnimSpriteTemplate_83DA3B4, 2, 25, 0, 0, 0, 20
	delay 24
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 24, 0, 0, 9
	delay 17
	createsprite gBasicHitSplatSpriteTemplate, 2, 16, 0, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, 2, -16, 0, 1, 1
	loopsewithpan SE_W003, 63, 5, 2
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 11
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_PECK: @ 81CFF88
	loadspritegfx 10135
	playsewithpan SE_W030, 63
	createvisualtask sub_80A8EFC, 2, 3, -768, 1, 2
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, -12, 0, 1, 3
	waitforvisualfinish
	end

Move_AEROBLAST: @ 81CFFAF
	loadspritegfx 10154
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	call Unknown_81D61FB
	monbgprio_28 1
	setalpha 12, 8
	call _81D000B
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 50, 1
	call _81D000B
	call _81D000B
	call _81D000B
	call _81D000B
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 0
	playsewithpan SE_W013, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	delay 0
	call Unknown_81D622B
	end
_81D000B:
	playsewithpan SE_W026, 192
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 14, -12, 0, -12, 15, 0, 0
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 26, 8, 12, 8, 15, 0, 0
	delay 3
	playsewithpan SE_W026, 192
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 14, -12, 0, -12, 15, 1, 0
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 26, 8, 12, 8, 15, 1, 0
	delay 3
	playsewithpan SE_W026, 192
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 14, -12, 0, -12, 15, 2, 0
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 26, 8, 12, 8, 15, 2, 0
	delay 3
	playsewithpan SE_W026, 192
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 14, -12, 0, -12, 15, 3, 0
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 26, 8, 12, 8, 15, 3, 0
	delay 3
	return

Move_WATER_GUN: @ 81D00CC
	loadspritegfx 10155
	loadspritegfx 10148
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createsprite gBattleAnimSpriteTemplate_83D9318, 2, 20, 0, 0, 0, 40, -25
	playsewithpan SE_W145, 192
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 5, 1, 1, 0, 8, 1
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 4, 0, 0, 1, 2
	createsprite gBattleAnimSpriteTemplate_83D9330, 2, 0, -15, 0, 15, 55
	playsewithpan SE_W152, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D9330, 2, 15, -20, 0, 15, 50
	playsewithpan SE_W152, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D9330, 2, -15, -10, 0, 10, 45
	playsewithpan SE_W152, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_CRABHAMMER: @ 81D0159
	loadspritegfx 10141
	loadspritegfx 10148
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 4, 0, 0, 1, 0
	playsewithpan SE_W233B, 63
	delay 1
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 32429, 10, 0, 0
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 8
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 4
	waitforvisualfinish
	loopsewithpan SE_W152, 63, 20, 3
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 4, 8, 1
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 10, 10, 20, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 20, -20, 20, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, -15, 15, 20, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 0, 0, 20, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, -10, -20, 20, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 16, -8, 20, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, 5, 8, 20, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9348, 2, -16, 0, 20, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_SURF: @ 81D0253
	createvisualtask sub_80D38BC, 2, 0
	delay 24
	panse_1B SE_W057, 192, 63, 2, 0
	waitforvisualfinish
	end

Move_FLAMETHROWER: @ 81D0267
	loadspritegfx 10029
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 46, 1
	delay 6
	createvisualtask sub_80D3630, 5, 100
	panse_1B SE_W053, 192, 63, 2, 0
	call _81D02E1
	call _81D02E1
	call _81D02E1
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 43, 1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D02E1:
	createsprite gBattleAnimSpriteTemplate_83D9268, 3, 10, 10, 0, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9268, 3, 10, 10, 0, 16
	delay 2
	return

Move_SANDSTORM: @ 81D0304
	loadspritegfx 10261
	playsewithpan SE_W201, 0
	createvisualtask do_boulder_dust, 5, 0
	delay 16
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 10, 2304, 96, 0
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 90, 2048, 96, 0
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 50, 2560, 96, 0
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 20, 2304, 96, 0
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 70, 1984, 96, 0
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 0, 2816, 96, 0
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DACE8, 40, 60, 2560, 96, 0
	end

Move_WHIRLPOOL: @ 81D038C
	loadspritegfx 10149
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 4, 2, 0, 7, rgb(0, 13, 23)
	playsewithpan SE_W250, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 50, 1
	call _81D03E4
	call _81D03E4
	call _81D03E4
	delay 12
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 4, 2, 7, 0, rgb(0, 13, 23)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end
_81D03E4:
	createsprite gBattleAnimSpriteTemplate_83DACB8, 130, 0, 28, 384, 50, 8, 50, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACB8, 130, 0, 32, 240, 40, 11, -46, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACB8, 130, 0, 33, 416, 40, 4, 42, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACB8, 130, 0, 31, 288, 45, 6, -42, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACB8, 130, 0, 28, 448, 45, 11, 46, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACB8, 130, 0, 33, 464, 50, 10, -50, 1
	delay 2
	return

Move_FLY: @ 81D046F
	loadspritegfx 10156
	loadspritegfx 10135
	choosetwoturnanim _81D0480, _81D0498
_81D047E:
	waitforvisualfinish
	end
_81D0480:
	playsewithpan SE_W019, 192
	createsprite gBattleAnimSpriteTemplate_83DA450, 2, 0, 0, 13, 336
	goto _81D047E
_81D0498:
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W104, 192
	createsprite gBattleAnimSpriteTemplate_83DA468, 2, 20
	delay 20
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	playsewithpan SE_W013, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	goto _81D047E

Move_BOUNCE: @ 81D04D9
	loadspritegfx 10156
	loadspritegfx 10135
	choosetwoturnanim _81D04E9, _81D04FD
_81D04E8:
	end
_81D04E9:
	playsewithpan SE_W100, 192
	createsprite gBattleAnimSpriteTemplate_83DA568, 2, 0, 0
	goto _81D04E8
_81D04FD:
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83DA594, 131
	delay 7
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, 130, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 5, 11, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	goto _81D04E8

Move_KARATE_CHOP: @ 81D053C
	loadspritegfx 10143
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	playsewithpan SE_W104, 63
	createsprite gBattleAnimSpriteTemplate_83D9F78, 2, -16, 0, 0, 0, 10, 1, 3, 0
	waitforvisualfinish
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_CROSS_CHOP: @ 81D058E
	loadspritegfx 10143
	loadspritegfx 10285
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W025, 63
	createsprite gBattleAnimSpriteTemplate_83D9FD8, 2, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9FD8, 2, 0, 0, 1
	delay 40
	playsewithpan SE_W013, 63
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 32767, 10, 0, 10
	createsprite gBattleAnimSpriteTemplate_83DB520, 3, 0, 0, 1, 20
	createvisualtask AnimTask_ShakeMon, 5, 1, 7, 0, 9, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_JUMP_KICK: @ 81D05F7
	loadspritegfx 10143
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 4
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D9F90, 2, -16, 8, 0, 0, 10, 1, 1, 1
	playsewithpan SE_W026, 63
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 1, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 7, 1
	playsewithpan SE_W004, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_HI_JUMP_KICK: @ 81D0654
	loadspritegfx 10143
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, -24, 0, 0, 8
	waitforvisualfinish
	delay 10
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 3
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D9F90, 2, -16, 8, 0, 0, 10, 1, 1, 1
	playsewithpan SE_W026, 63
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 1
	playsewithpan SE_W233B, 63
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -28, 0, 0, 3
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 3, 0, 11, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 6
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_DOUBLE_KICK: @ 81D06EA
	loadspritegfx 10143
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createsprite gBattleAnimSpriteTemplate_83D9FC0, 3, 1, 20, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_TRIPLE_KICK: @ 81D071D
	loadspritegfx 10143
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W233B, 63
	jumpifmoveturn 0, _81D0742
	jumpifmoveturn 1, _81D0778
	goto _81D07AE
_81D073D:
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D0742:
	createsprite gFistFootSpriteTemplate, 132, -16, -8, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, 131, -16, -16, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	goto _81D073D
_81D0778:
	createsprite gFistFootSpriteTemplate, 132, 8, 8, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, 131, 8, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	goto _81D073D
_81D07AE:
	createsprite gFistFootSpriteTemplate, 132, 0, 0, 20, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, -8, 1, 1
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	goto _81D073D

Move_DYNAMIC_PUNCH: @ 81D07E4
	loadspritegfx 10143
	loadspritegfx 10135
	loadspritegfx 10198
	loadspritegfx 10007
	delay 1
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W233B, 63
	createsprite gFistFootSpriteTemplate, 131, 0, 0, 20, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 130, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 5, 0, 7, 1
	delay 1
	waitsound
	playsewithpan SE_W120, 63
	createvisualtask AnimTask_ShakeMon2, 5, 1, 5, 0, 28, 1
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 16, 16, 1, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_COUNTER: @ 81D08AC
	loadspritegfx 10135
	loadspritegfx 10143
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 18, 6, 1, 4
	playsewithpan SE_W233, 192
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 20, 0, 0, 4
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, 2, -15, 18, 1, 0
	playsewithpan SE_W233B, 63
	delay 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 25, 1
	createsprite gFistFootSpriteTemplate, 3, -15, 18, 8, 1, 0
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, -4, 1, 0
	playsewithpan SE_W233B, 63
	delay 1
	createsprite gFistFootSpriteTemplate, 3, 0, -4, 8, 1, 0
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, 2, 15, 9, 1, 0
	playsewithpan SE_W233B, 63
	delay 1
	createsprite gFistFootSpriteTemplate, 3, 15, 9, 8, 1, 0
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 5
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_VITAL_THROW: @ 81D097B
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W233, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 12, 4, 1, 2
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 20, 0, 0, 4
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 1
	playsewithpan SE_W233B, 63
	delay 1
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -24, 0, 0, 4
	waitforvisualfinish
	delay 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 7
	delay 11
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 10
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_ROCK_SMASH: @ 81D09F6
	loadspritegfx 10058
	loadspritegfx 10135
	loadspritegfx 10143
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	delay 1
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 1
	createsprite gFistFootSpriteTemplate, 2, 0, 0, 8, 1, 0
	playsewithpan SE_W233B, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 5, 1
	waitforvisualfinish
	playsewithpan SE_W088, 63
	createsprite gBattleAnimSpriteTemplate_83DAC64, 2, 0, 0, 20, 24, 14, 2
	createsprite gBattleAnimSpriteTemplate_83DAC64, 2, 5, 0, -20, 24, 14, 1
	createsprite gBattleAnimSpriteTemplate_83DAC64, 2, 0, 5, 20, -24, 14, 2
	createsprite gBattleAnimSpriteTemplate_83DAC64, 2, -5, 0, -20, -24, 14, 2
	createsprite gBattleAnimSpriteTemplate_83DAC64, 2, 0, -5, 30, 18, 8, 2
	createsprite gBattleAnimSpriteTemplate_83DAC64, 2, 0, 0, 30, -18, 8, 2
	createsprite gBattleAnimSpriteTemplate_83DAC64, 2, 0, 0, -30, 18, 8, 2
	createsprite gBattleAnimSpriteTemplate_83DAC64, 2, 0, 0, -30, -18, 8, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 7, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_SUBMISSION: @ 81D0AEE
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W104, 192
	waitplaysewithpan SE_W004, 63, 10
	waitplaysewithpan SE_W104, 192, 20
	waitplaysewithpan SE_W004, 63, 30
	waitplaysewithpan SE_W104, 192, 40
	waitplaysewithpan SE_W004, 63, 50
	waitplaysewithpan SE_W104, 192, 60
	waitplaysewithpan SE_W004, 63, 70
	waitplaysewithpan SE_W104, 192, 80
	waitplaysewithpan SE_W004, 63, 90
	createvisualtask AnimTask_TranslateMonElliptical, 2, ANIM_BANK_ATTACKER, -18, 6, 6, 4
	createvisualtask AnimTask_TranslateMonElliptical, 2, ANIM_BANK_TARGET, 18, 6, 6, 4
	call _81D0B5D
	call _81D0B5D
	call _81D0B5D
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D0B5D:
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, -12, 1, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 3, -12, 8, 1, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 3, 12, 0, 1, 1
	delay 8
	return

Move_SUNNY_DAY: @ 81D0B91
	loadspritegfx 10157
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 13, 3
	createvisualtask sub_80E2A38, 10, 1921, 1, 0, 6, 32767
	waitforvisualfinish
	panse_26 SE_W080, 192, 63, 1, 0
	call _81D0BDD
	call _81D0BDD
	call _81D0BDD
	call _81D0BDD
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 1921, 1, 6, 0, 32767
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	end
_81D0BDD:
	createsprite gBattleAnimSpriteTemplate_83D95B0, 40
	delay 6
	return

Move_COTTON_SPORE: @ 81D0BE7
	loadspritegfx 10158
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	loopsewithpan SE_W077, 63, 18, 10
	call _81D0C07
	call _81D0C07
	call _81D0C07
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end
_81D0C07:
	createsprite gBattleAnimSpriteTemplate_83D63F8, 2, 0, -20, 85, 80, 0
	delay 12
	createsprite gBattleAnimSpriteTemplate_83D63F8, 2, 0, -10, 170, 80, 0
	delay 12
	createsprite gBattleAnimSpriteTemplate_83D63F8, 2, 0, -15, 0, 80, 0
	delay 12
	return

Move_SPORE: @ 81D0C41
	loadspritegfx 10158
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createvisualtask sub_80CACEC, 2
	loopsewithpan SE_W077, 63, 16, 11
	call _81D0C6C
	call _81D0C6C
	call _81D0C6C
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D0C6C:
	createsprite gBattleAnimSpriteTemplate_83D63F8, 130, 0, -20, 85, 80, 1
	delay 12
	createsprite gBattleAnimSpriteTemplate_83D63F8, 130, 0, -10, 170, 80, 1
	delay 12
	createsprite gBattleAnimSpriteTemplate_83D63F8, 130, 0, -15, 0, 80, 1
	delay 12
	return

Move_PETAL_DANCE: @ 81D0CA6
	loadspritegfx 10159
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W080, 192
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 12, 6, 6, 3
	createsprite gBattleAnimSpriteTemplate_83D6428, 2, 0, -24, 8, 140
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, 16, -24, 8, 100
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, -16, -24, 8, 100
	delay 15
	createsprite gBattleAnimSpriteTemplate_83D6428, 2, 0, -24, 8, 140
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, 32, -24, 8, 100
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, -32, -24, 8, 100
	delay 15
	createsprite gBattleAnimSpriteTemplate_83D6428, 2, 0, -24, 8, 140
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, 24, -24, 8, 100
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, -24, -24, 8, 100
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, 16, -24, 0, 100
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, -16, -24, 0, 100
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, 20, -16, 14, 80
	createsprite gBattleAnimSpriteTemplate_83D6440, 2, -20, -14, 16, 80
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 24, 0, 0, 5
	delay 3
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 6, 0, 8, 1
	waitforvisualfinish
	delay 8
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_RAZOR_LEAF: @ 81D0DDE
	loadspritegfx 10063
	loadspritegfx 10160
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_W077, 192, 10, 5
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -3, -2, 10
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -1, -1, 15
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -4, -4, 7
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -3, 11
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -1, -6, 8
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, 2, -1, 12
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -3, -4, 13
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, 4, -5, 7
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, 2, -6, 11
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -3, -5, 8
	delay 60
	playsewithpan SE_W013B, 192
	createsprite gBattleAnimSpriteTemplate_83D64E4, 131, 20, -10, 20, 0, 22, 20, 1
	createsprite gBattleAnimSpriteTemplate_83D64E4, 131, 20, -10, 20, 0, 22, -20, 1
	delay 20
	playsewithpan SE_W013, 63
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_DEF_PARTNER, 2, 0, 8, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_ANCIENT_POWER: @ 81D0EE5
	loadspritegfx 10058
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, 4, 1, 10, 1
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, 20, 32, -48, 50, 2
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, 0, 32, -38, 25, 5
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, 32, 32, -28, 40, 3
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, -20, 32, -48, 50, 2
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, 20, 32, -28, 60, 1
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, 0, 32, -28, 30, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 30, 1
	playsewithpan SE_W082, 192
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, 15, 32, -48, 25, 5
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, -10, 32, -42, 30, 4
	delay 10
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, 0, 32, -42, 25, 5
	createsprite gBattleAnimSpriteTemplate_83DAD60, 2, -25, 32, -48, 30, 4
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 16, 0, 0, 4
	delay 3
	playsewithpan SE_W120, 63
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 7
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_OCTAZOOKA: @ 81D100D
	loadspritegfx 10030
	loadspritegfx 10017
	playsewithpan SE_W025B, 192
	createsprite gBattleAnimSpriteTemplate_83D6F08, 130, 20, 0, 0, 0, 20, 0
	waitforvisualfinish
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D6F3C, 130, 8, 8, 1, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6F3C, 130, -8, -8, 1, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6F3C, 130, 8, -8, 1, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D6F3C, 130, -8, 8, 1, 0
	waitforvisualfinish
	end

Move_MIST: @ 81D1073
	loadspritegfx 10144
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 12, 8
	loopsewithpan SE_W054, 192, 20, 15
	call _81D10BE
	call _81D10BE
	call _81D10BE
	call _81D10BE
	call _81D10BE
	call _81D10BE
	call _81D10BE
	delay 32
	createvisualtask sub_80E1F8C, 2, 10, 8, 2, 0, 14, 32767
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	end
_81D10BE:
	createsprite gBattleAnimSpriteTemplate_83D9D3C, 2, 0, -24, 48, 240, 0, 1
	delay 7
	return

Move_HAZE: @ 81D10D4
	waitforvisualfinish
	playsewithpan SE_W114, 0
	createvisualtask sub_80D80E0, 5
	delay 30
	createvisualtask sub_80E2A38, 10, 1920, 2, 0, 16, 0
	delay 90
	createvisualtask sub_80E2A38, 10, 1920, 1, 16, 0, 0
	end

Move_FIRE_PUNCH: @ 81D1107
	loadspritegfx 10143
	loadspritegfx 10029
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 9, 31
	createsprite gBattleAnimSpriteTemplate_83D9478, 129, 0
	createsprite gBattleAnimSpriteTemplate_83D9478, 129, 64
	createsprite gBattleAnimSpriteTemplate_83D9478, 129, 128
	createsprite gBattleAnimSpriteTemplate_83D9478, 129, 196
	playsewithpan SE_W172, 63
	waitforvisualfinish
	createsprite gFistFootSpriteTemplate, 131, 0, 0, 8, 1, 0
	createsprite gBasicHitSplatSpriteTemplate, 130, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 15, 1
	call _81D11A2
	delay 4
	playsewithpan SE_W007, 63
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 4, 0, 9, 0, 31
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D11A2:
	createsprite gBattleAnimSpriteTemplate_83D9490, 129, 0, 10, 192, 176, 40
	createsprite gBattleAnimSpriteTemplate_83D9490, 129, 0, 10, -192, 240, 40
	createsprite gBattleAnimSpriteTemplate_83D9490, 129, 0, 10, 192, -160, 40
	createsprite gBattleAnimSpriteTemplate_83D9490, 129, 0, 10, -192, -112, 40
	createsprite gBattleAnimSpriteTemplate_83D9490, 129, 0, 10, 160, 48, 40
	createsprite gBattleAnimSpriteTemplate_83D9490, 129, 0, 10, -224, -32, 40
	createsprite gBattleAnimSpriteTemplate_83D9490, 129, 0, 10, 112, -128, 40
	return

Move_LEER: @ 81D121A
	loadspritegfx 10027
	monbg ANIM_BANK_ATTACKER
	monbgprio_28 0
	setalpha 8, 8
	playsewithpan SE_W043, 192
	createsprite gBattleAnimSpriteTemplate_84022B0, 2, 24, -12
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 10, ANIM_BANK_ATTACKER, 1
	waitforvisualfinish
	delay 10
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 1, 0, 9, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_DEF_PARTNER, 1, 0, 9, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	blendoff
	delay 1
	waitforvisualfinish
	end

Move_DREAM_EATER: @ 81D1271
	loadspritegfx 10147
	loadspritegfx 10031
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	playsewithpan SE_W060, 192
	call Unknown_81D61E7
	setalpha 8, 8
	playsewithpan SE_W107, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 5, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -6, -6, 15, ANIM_BANK_TARGET, 1
	waitforvisualfinish
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 2, 25, 1
	call _81D12DB
	waitforvisualfinish
	delay 15
	call Unknown_81D5EF5
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	delay 1
	call Unknown_81D61F3
	end
_81D12DB:
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 5, -18, -40, 35
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 28, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 40, 39
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -32, 26
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, -15, -16, 36
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, -15, -16, 36
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 16, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -40, 26
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -5, 15, 36, 33
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 10, -5, -8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, -10, 20, 20, 39
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 0, 5, 8, 26
	createsprite gBattleAnimSpriteTemplate_83D637C, 3, 5, -18, -20, 35
	delay 4
	return

Move_POISON_GAS: @ 81D1474
	loadspritegfx 10172
	loadspritegfx 10150
	delay 0
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_29
	setalpha 12, 8
	delay 0
	playsewithpan SE_W054, 192
	createsprite gBattleAnimSpriteTemplate_83D9DAC, 128, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gBattleAnimSpriteTemplate_83D9DAC, 128, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gBattleAnimSpriteTemplate_83D9DAC, 128, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gBattleAnimSpriteTemplate_83D9DAC, 128, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gBattleAnimSpriteTemplate_83D9DAC, 128, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 4
	playsewithpan SE_W054, 192
	createsprite gBattleAnimSpriteTemplate_83D9DAC, 128, 64, 0, 0, -32, -6, 4192, 1072, 0
	delay 40
	loopsewithpan SE_W054, 63, 28, 6
	createvisualtask sub_80E1F8C, 2, 4, 6, 2, 0, 12, 26650
	waitforvisualfinish
	blendoff
	clearmonbg ANIM_BANK_DEF_PARTNER
	delay 0
	end

Move_BIND: @ 81D1552
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 3328, 4, 0
	goto _81D1568
_81D1568:
	playsewithpan SE_W020, 63
	call _81D1578
	call _81D1578
	waitforvisualfinish
	end
_81D1578:
	createvisualtask AnimTask_ScaleMonAndRestore, 5, 10, -5, 5, ANIM_BANK_TARGET, 0
	delay 16
	return

Move_WRAP: @ 81D158C
	createvisualtask AnimTask_TranslateMonEllipticalRespectSide, 2, ANIM_BANK_ATTACKER, 6, 4, 2, 4
	goto _81D1568

Move_PSYBEAM: @ 81D15A2
	loadspritegfx 10163
	playsewithpan SE_W060, 192
	call Unknown_81D61E7
	createsoundtask sub_812B058, 200, -64, 63, 3, 4, 0, 15
	call _81D1626
	call _81D1626
	createvisualtask AnimTask_SwayMon, 5, 0, 6, 2048, 4, 1
	createvisualtask sub_80E1F8C, 2, 4, 2, 2, 0, 12, 32351
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	waitforvisualfinish
	delay 1
	call Unknown_81D61F3
	end
_81D1626:
	createsprite gBattleAnimSpriteTemplate_83DA784, 130, 16, 0, 0, 0, 13, 0
	delay 4
	return

Move_HYPNOSIS: @ 81D163C
	loadspritegfx 10163
	call Unknown_81D61E7
	call _81D166F
	call _81D166F
	call _81D166F
	createvisualtask sub_80E1F8C, 2, 4, 2, 2, 0, 12, 32351
	waitforvisualfinish
	delay 1
	call Unknown_81D61F3
	end
_81D166F:
	playsewithpan SE_W048, 192
	createsprite gBattleAnimSpriteTemplate_83DA784, 130, 0, 8, 0, 8, 27, 0
	createsprite gBattleAnimSpriteTemplate_83DA784, 130, 16, -8, 0, -8, 27, 0
	delay 6
	return

Move_PSYWAVE: @ 81D169C
	loadspritegfx 10165
	playsewithpan SE_W060, 192
	call Unknown_81D61E7
	createvisualtask sub_80D3630, 5, 100
	createsoundtask sub_812B058, 203, -64, 63, 2, 9, 0, 10
	call _81D16FF
	call _81D16FF
	createvisualtask sub_80E1F8C, 2, 4, 1, 4, 0, 12, 32351
	call _81D16FF
	call _81D16FF
	call _81D16FF
	call _81D16FF
	waitforvisualfinish
	delay 1
	call Unknown_81D61F3
	end
_81D16FF:
	createsprite gBattleAnimSpriteTemplate_83D9280, 131, 10, 10, 0, 16
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9280, 131, 10, 10, 0, 16
	delay 4
	return

Move_ZAP_CANNON: @ 81D1722
	loadspritegfx 10171
	loadspritegfx 10011
	playsewithpan SE_W086, 192
	createsprite gBattleAnimSpriteTemplate_83D9874, 131, 10, 0, 0, 0, 30, 0
	createsprite gBattleAnimSpriteTemplate_83D98A0, 132, 10, 0, 16, 30, 0, 40, 0
	createsprite gBattleAnimSpriteTemplate_83D98A0, 132, 10, 0, 16, 30, 64, 40, 1
	createsprite gBattleAnimSpriteTemplate_83D98A0, 132, 10, 0, 16, 30, 128, 40, 0
	createsprite gBattleAnimSpriteTemplate_83D98A0, 132, 10, 0, 16, 30, 192, 40, 2
	createsprite gBattleAnimSpriteTemplate_83D98A0, 132, 10, 0, 8, 30, 32, 40, 0
	createsprite gBattleAnimSpriteTemplate_83D98A0, 132, 10, 0, 8, 30, 96, 40, 1
	createsprite gBattleAnimSpriteTemplate_83D98A0, 132, 10, 0, 8, 30, 160, 40, 0
	createsprite gBattleAnimSpriteTemplate_83D98A0, 132, 10, 0, 8, 30, 224, 40, 2
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 5, 1
	delay 15
	waitplaysewithpan SE_W085B, 63, 19
	call ElectricityEffect
	waitforvisualfinish
	end

Move_STEEL_WING: @ 81D1807
	loadspritegfx 10009
	loadspritegfx 10135
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask sub_80E0A4C, 5, 0, 0, 0
	waitforvisualfinish
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	loopsewithpan SE_W017, 192, 20, 2
	createvisualtask AnimTask_TranslateMonElliptical, 2, ANIM_BANK_ATTACKER, 12, 4, 1, 4
	createvisualtask sub_80DA09C, 5, 1, 70
	createsprite gBattleAnimSpriteTemplate_83DA3B4, 2, -25, 0, 0, 0, 20
	createsprite gBattleAnimSpriteTemplate_83DA3B4, 2, 25, 0, 0, 0, 20
	delay 24
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 24, 0, 0, 9
	delay 17
	createsprite gBasicHitSplatSpriteTemplate, 2, 16, 0, 1, 1
	createsprite gBasicHitSplatSpriteTemplate, 2, -16, 0, 1, 1
	playsewithpan SE_W013, 63
	waitforvisualfinish
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 11
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_IRON_TAIL: @ 81D18B6
	loadspritegfx 10135
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask sub_80E0A4C, 5, 1, 0, 0
	waitforvisualfinish
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 130, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createvisualtask sub_80E0E24, 5, 0, 1
	clearmonbg ANIM_BANK_TARGET
	blendoff
	waitforvisualfinish
	end

Move_POISON_TAIL: @ 81D1914
	loadspritegfx 10135
	loadspritegfx 10150
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask sub_80E0A4C, 5, 1, 1, 23768
	waitforvisualfinish
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 130, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	playsewithpan SE_W233B, 63
	waitforvisualfinish
	createvisualtask sub_80E0E24, 5, 0, 1
	clearmonbg ANIM_BANK_TARGET
	blendoff
	call PoisonBubblesAnim
	waitforvisualfinish
	end

Move_METAL_CLAW: @ 81D197A
	loadspritegfx 10039
	loopsewithpan SE_W231, 192, 28, 2
	createvisualtask sub_80E0A4C, 5, 0, 0, 0
	waitforvisualfinish
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	delay 2
	playsewithpan SE_W013, 63
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, -10, -10, 0
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, -10, 10, 0
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, -4, 1, 10, 3, 1
	delay 8
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	delay 2
	playsewithpan SE_W013, 63
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, 10, -10, 1
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, 10, 10, 1
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, -4, 1, 10, 3, 1
	waitforvisualfinish
	end

Move_NIGHT_SHADE: @ 81D1A0D
	monbg ANIM_BANK_ATTACKER
	monbgprio_28 0
	playsewithpan SE_W060, 192
	fadetobg 2
	waitbgfadein
	delay 10
	playsewithpan SE_W043, 192
	createvisualtask sub_80DDDF0, 5, 85
	delay 70
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 12, 1
	createvisualtask sub_80E1F8C, 2, 4, 0, 2, 0, 13, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	delay 1
	restorebg
	waitbgfadein
	end

Move_EGG_BOMB: @ 81D1A55
	loadspritegfx 10198
	loadspritegfx 10175
	playsewithpan SE_W039, 192
	createsprite gBattleAnimSpriteTemplate_83D7594, 130, 10, 0, 0, 0, 25, -32
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 16, 1
	createsprite gBattleAnimSpriteTemplate_83D7828, 132, 6, 5, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D7828, 132, -16, -15, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D7828, 132, 16, -5, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D7828, 132, -12, 18, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D7828, 132, 0, 5, 1, 0
	playsewithpan SE_W120, 63
	delay 3
	waitforvisualfinish
	end

Move_SHADOW_BALL: @ 81D1AEF
	loadspritegfx 10176
	fadetobg 2
	waitbgfadein
	delay 15
	createsoundtask sub_812B058, 168, -64, 63, 5, 5, 0, 5
	createsprite gBattleAnimSpriteTemplate_83DAEA8, 130, 16, 16, 8
	waitforvisualfinish
	playsewithpan SE_W028, 63
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 8, 1
	waitforvisualfinish
	restorebg
	waitbgfadein
	end

Move_LICK: @ 81D1B32
	loadspritegfx 10177
	delay 15
	playsewithpan SE_W122, 63
	createsprite gBattleAnimSpriteTemplate_83DAEDC, 130, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 1, 0, 16, 1
	waitforvisualfinish
	end

Move_FOCUS_ENERGY: @ 81D1B59
	loadspritegfx 10184
	playsewithpan SE_W082, 192
	call EndureFlamesAnim
	delay 8
	createvisualtask sub_80E1F8C, 2, 2, 2, 2, 0, 11, 32767
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 32, 1
	call EndureFlamesAnim
	delay 8
	call EndureFlamesAnim
	waitforvisualfinish
	end

Move_BIDE: @ 81D1B99
	choosetwoturnanim _81D1BA3, _81D1BCF
	end
_81D1BA3:
	loopsewithpan SE_W036, 192, 9, 2
	createvisualtask sub_80E1F8C, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 32, 1
	waitforvisualfinish
	end
_81D1BCF:
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	loopsewithpan SE_W036, 192, 9, 2
	createvisualtask sub_80E2A38, 10, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 32, 1
	waitforvisualfinish
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 24, 0, 0, 4
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_ATTACKER, 2, 0, 12, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 16, 1
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 1, 18, -8, 1, 1
	delay 5
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 1, -18, 8, 1, 1
	delay 5
	playsewithpan SE_W004, 63
	createsprite gBasicHitSplatSpriteTemplate, 1, -8, -5, 1, 1
	waitforvisualfinish
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 7
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 2, 2, 11, 0, 31
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_STRING_SHOT: @ 81D1C98
	loadspritegfx 10179
	loadspritegfx 10180
	monbg ANIM_BANK_DEF_PARTNER
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, 5, 1, 2, 0, 9, rgb(0, 0, 0)
	waitforvisualfinish
	loopsewithpan SE_W081, 192, 9, 6
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	call _81D1D56
	waitforvisualfinish
	playsewithpan SE_W081B, 63
	createsprite gBattleAnimSpriteTemplate_83DAB40, 130, 0, 10
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DAB40, 130, 0, -2
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DAB40, 130, 0, 22
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	delay 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 5, 1, 2, 9, 0, rgb(0, 0, 0)
	end
_81D1D56:
	createsprite gBattleAnimSpriteTemplate_83DAB28, 130, 20, 0, 512, 20, 1
	delay 1
	return

Move_SPIDER_WEB: @ 81D1D6A
	loadspritegfx 10181
	loadspritegfx 10180
	monbg ANIM_BANK_DEF_PARTNER
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, 5, 1, 2, 0, 9, rgb(0, 0, 0)
	waitforvisualfinish
	monbgprio_28 1
	loopsewithpan SE_W081, 192, 9, 6
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	call _81D1DF7
	waitforvisualfinish
	playsewithpan SE_W081B, 63
	createsprite gBattleAnimSpriteTemplate_83DAB74, 2
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, 5, 1, 2, 9, 0, rgb(0, 0, 0)
	end
_81D1DF7:
	createsprite gBattleAnimSpriteTemplate_83DAB28, 130, 20, 0, 512, 20, 0
	delay 1
	return

Move_RAZOR_WIND: @ 81D1E0B
	choosetwoturnanim _81D1E16, _81D1E66
_81D1E14:
	waitforvisualfinish
	end
_81D1E16:
	loadspritegfx 10009
	playsewithpan SE_W016, 192
	createsprite gBattleAnimSpriteTemplate_83D765C, 2, 32, 0, 16, 16, 0, 7, 40
	createsprite gBattleAnimSpriteTemplate_83D765C, 2, 32, 0, 16, 16, 85, 7, 40
	createsprite gBattleAnimSpriteTemplate_83D765C, 2, 32, 0, 16, 16, 170, 7, 40
	waitforvisualfinish
	playsewithpan SE_W016B, 192
	goto _81D1E14
_81D1E66:
	loadspritegfx 10154
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W013B, 192
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 14, 8, 0, 0, 22, 2, 1
	delay 2
	playsewithpan SE_W013B, 192
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 14, -8, 16, 14, 22, 1, 1
	delay 2
	playsewithpan SE_W013B, 192
	createsprite gBattleAnimSpriteTemplate_83DA3E4, 2, 14, 12, -16, -14, 22, 0, 1
	delay 17
	playsewithpan SE_W013, 63
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 10, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_DEF_PARTNER, 2, 0, 10, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	goto _81D1E14

Move_DISABLE: @ 81D1EF1
	loadspritegfx 10071
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 8, 8
	playsewithpan SE_W197, 192
	createsprite gBattleAnimSpriteTemplate_83930F4, 13, 24, -16
	waitforvisualfinish
	createvisualtask sub_80D03C4, 5
	loopsewithpan SE_W020, 63, 15, 4
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_RECOVER: @ 81D1F1F
	loadspritegfx 10147
	loadspritegfx 10031
	monbg ANIM_BANK_ATK_PARTNER
	setalpha 12, 8
	loopsewithpan SE_W025, 192, 13, 3
	createvisualtask sub_80E1F8C, 2, 2, 0, 6, 0, 11, 12287
	call _81D1F5F
	call _81D1F5F
	call _81D1F5F
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	delay 1
	call Unknown_81D5EF5
	waitforvisualfinish
	end
_81D1F5F:
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 40, -10, 13
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -35, -10, 13
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 15, -40, 13
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -10, -32, 13
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 25, -20, 13
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, -40, -20, 13
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D62EC, 2, 5, -40, 13
	delay 3
	return

Move_MIMIC: @ 81D1FC9
	loadspritegfx 10147
	monbg_22 3
	setalpha 11, 5
	panse_1B SE_W107, 63, 192, 253, 0
	createvisualtask sub_80CB340, 5, 128, 24
	delay 15
	createsprite gBattleAnimSpriteTemplate_83D65E8, 130, -12, 24
	delay 10
	setarg 7, -1
	waitforvisualfinish
	playsewithpan SE_W036, 192
	createvisualtask sub_80E1F8C, 2, 2, 0, 2, 0, 11, 32767
	waitforvisualfinish
	clearmonbg_23 3
	blendoff
	end

Move_CONSTRICT: @ 81D2013
	loadspritegfx 10186
	loopsewithpan SE_W010, 63, 6, 4
	createsprite gBattleAnimSpriteTemplate_83D65A0, 132, 0, 16, 0, 2
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D65A0, 131, 0, 0, 0, 2
	createsprite gBattleAnimSpriteTemplate_83D65A0, 130, 0, 8, 1, 2
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D65A0, 131, 0, -8, 1, 2
	delay 8
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	delay 20
	playsewithpan SE_W020, 63
	setarg 7, -1
	waitforvisualfinish
	end

Move_CURSE: @ 81D207B
	choosetwoturnanim _81D2084, _81D2101
_81D2084:
	loadspritegfx 10199
	loadspritegfx 10200
	monbg ANIM_BANK_ATK_PARTNER
	createvisualtask sub_80DECB0, 5
	waitforvisualfinish
	delay 20
	createsprite gBattleAnimSpriteTemplate_83DAF20, 2
	delay 60
	call _81D20EB
	delay 41
	call _81D20EB
	delay 41
	call _81D20EB
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	delay 1
	monbg ANIM_BANK_DEF_PARTNER
	playsewithpan SE_W171, 63
	createsprite gBattleAnimSpriteTemplate_83DAF38, 130
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 14, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 16, 0, rgb(0, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end
_81D20EB:
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 4, 0, 10, 0
	playsewithpan SE_W020, 192
	return
_81D2101:
	createvisualtask AnimTask_SwayMon, 5, 0, 10, 1536, 3, 0
	waitforvisualfinish
	delay 10
	call _81D211C
	waitforvisualfinish
	end
_81D211C:
	playsewithpan SE_W082, 192
	createvisualtask sub_80E2F2C, 5
	createvisualtask sub_80E1F8C, 5, 2, 4, 2, 0, 10, 31
	return

Move_SOFT_BOILED: @ 81D213B
	loadspritegfx 10202
	loadspritegfx 10203
	loadspritegfx 10031
	monbg ANIM_BANK_ATK_PARTNER
	playsewithpan SE_W039, 192
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_ATTACKER, 0, 2, 6, 1
	createsprite gBattleAnimSpriteTemplate_83D78BC, 4, 0, 16, 0
	createsprite gBattleAnimSpriteTemplate_83D78BC, 4, 0, 16, 1
	delay 120
	delay 7
	playsewithpan SE_W030, 192
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 31, 3, 10, 0, rgb(12, 24, 30)
	createsprite gBattleAnimSpriteTemplate_83D7928, 3, 31, 16, 0, 1
	delay 8
	createsprite gBattleAnimSpriteTemplate_83D7928, 3, 31, 16, 0, 1
	delay 60
	setarg 7, -1
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	call Unknown_81D5F3E
	end

Move_HEAL_BELL: @ 81D21BD
	loadspritegfx 10205
	loadspritegfx 10206
	loadspritegfx 10203
	loadspritegfx 10049
	createvisualtask sub_80E2A38, 10, 10, 0, 0, 10, 32767
	waitforvisualfinish
	createvisualtask sub_80D1ADC, 5
	createsprite gBattleAnimSpriteTemplate_83D7A44, 2, 0, -24, 0, 1
	delay 12
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, 48, -18, 35, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, -48, 20, 30, 1, 1
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, -38, -29, 30, 2, 2
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, 36, 18, 30, 3, 3
	call _81D2372
	delay 33
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, 19, 26, 35, 4, 4
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, -34, -12, 30, 5, 5
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, 41, -20, 34, 6, 6
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, -15, 26, 32, 7, 0
	call _81D2372
	delay 33
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, -48, 18, 31, 0, 2
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, 48, -20, 30, 2, 5
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, 38, 29, 33, 4, 3
	createsprite gBattleAnimSpriteTemplate_83D7A68, 40, 0, -24, -36, -18, 30, 6, 1
	call _81D2372
	waitforvisualfinish
	createvisualtask sub_80D1B80, 5
	waitforvisualfinish
	playsewithpan SE_W234, 192
	createsprite gBattleAnimSpriteTemplate_83D6CA0, 16, -15, 0, 0, 0, 32, 60, 1
	delay 8
	createsprite gBattleAnimSpriteTemplate_83D6CA0, 16, 12, -5, 0, 0, 32, 60, 1
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createvisualtask sub_80E2A7C, 10, 4, 3, 10, 0, 31500
	createvisualtask sub_80E2A38, 10, 10, 3, 10, 0, 32767
	createsprite gBattleAnimSpriteTemplate_83D7974, 16, 0, 0, 0, 1
	end
_81D2372:
	createvisualtask sub_80E2A7C, 10, 4, 3, 8, 0, 31500
	createvisualtask sub_80E2A38, 10, 10, 3, 2, 10, 32767
	createsprite gBattleAnimSpriteTemplate_83D7928, 40, 0, -24, 0, 1
	playsewithpan SE_W215, 192
	return

Move_FAKE_OUT: @ 81D23A8
	playsewithpan SE_W260, 0
	createvisualtask sub_80D1CD0, 5
	waitforvisualfinish
	playsewithpan SE_W166, 63
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 5, 1
	createvisualtask sub_80D1E38, 3
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 16, 0, rgb(31, 31, 31)
	end

Move_SCARY_FACE: @ 81D23E3
	loadspritegfx 10218
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 27, 3, 0, 16, rgb(0, 0, 0)
	playsewithpan SE_W060, 192
	waitforvisualfinish
	delay 10
	playsewithpan SE_W043, 192
	createvisualtask sub_80D23B4, 5
	delay 13
	createsprite gBattleAnimSpriteTemplate_83D7B94, 0, -16, -8
	createsprite gBattleAnimSpriteTemplate_83D7B94, 0, 16, -8
	waitforvisualfinish
	createvisualtask sub_80D60B4, 3, 20, 1, 0
	playsewithpan SE_W081B, 63
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 27, 3, 16, 0, rgb(0, 0, 0)
	waitforvisualfinish
	end

Move_SWEET_KISS: @ 81D2446
	loadspritegfx 10216
	loadspritegfx 10220
	createsprite gBattleAnimSpriteTemplate_83D7BB8, 130, 16, -48
	playsewithpan SE_W215, 63
	delay 23
	playsewithpan SE_W215, 63
	delay 23
	playsewithpan SE_W215, 63
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, 160, -30
	playsewithpan SE_W213, 63
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, -256, -42
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, 128, -14
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, 416, -38
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, -128, -22
	createsprite gBattleAnimSpriteTemplate_83D7AC8, 131, -384, -31
	end

Move_LOVELY_KISS: @ 81D24AF
	loadspritegfx 10219
	loadspritegfx 10221
	createsprite gBattleAnimSpriteTemplate_83D7C00, 130, 0, -24
	playsewithpan SE_W060B, 63
	waitforvisualfinish
	playsewithpan SE_W213, 63
	createsprite gBattleAnimSpriteTemplate_83D7BD0, 131, -256, -42
	createsprite gBattleAnimSpriteTemplate_83D7BD0, 131, 128, -14
	createsprite gBattleAnimSpriteTemplate_83D7BD0, 131, 416, -38
	createsprite gBattleAnimSpriteTemplate_83D7BD0, 131, -128, -22
	end

Move_FURY_SWIPES: @ 81D24F6
	loadspritegfx 10222
	createsprite gHorizontalLungeSpriteTemplate, 2, 5, 5
	delay 4
	playsewithpan SE_W010, 63
	createsprite gBattleAnimSpriteTemplate_83D7C48, 130, 16, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 5, 1
	delay 10
	createsprite gHorizontalLungeSpriteTemplate, 130, 5, 5
	delay 4
	playsewithpan SE_W010, 63
	createsprite gBattleAnimSpriteTemplate_83D7C48, 130, -16, 0, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 7, 1
	end

Move_INGRAIN: @ 81D255A
	loadspritegfx 10223
	loadspritegfx 10147
	createsprite gBattleAnimSpriteTemplate_83D6658, 2, 16, 26, -1, 2, 150
	playsewithpan SE_W010, 192
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D6658, 2, -32, 20, 1, 1, 140
	playsewithpan SE_W010, 192
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D6658, 2, 32, 22, 1, 0, 130
	playsewithpan SE_W010, 192
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D6658, 2, -16, 25, -1, 3, 120
	playsewithpan SE_W010, 192
	delay 40
	createsprite gBattleAnimSpriteTemplate_83D6698, 3, 32, 26, -1, 3, 30
	delay 5
	playsewithpan SE_W145C, 192
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6698, 3, -48, 20, 1, 2, 30
	playsewithpan SE_W145C, 192
	delay 5
	playsewithpan SE_W145C, 192
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6698, 3, 48, 26, -2, 3, 18
	playsewithpan SE_W145C, 192
	delay 10
	waitforvisualfinish
	end

Move_PRESENT: @ 81D260B
	loadspritegfx 10224
	createvisualtask sub_812C960, 2
	createsprite gBattleAnimSpriteTemplate_83D671C, 130, 0, -5, 10, 2, -1
	playsewithpan SE_W039, 192
	delay 14
	playsewithpan SE_W145B, 192
	delay 14
	playsewithpan SE_W145B, 0
	delay 20
	playsewithpan SE_W145B, 63
	waitforvisualfinish
	jumpargeq 7, 0, _81D264E
	jumpargeq 7, 1, _81D26B9
	end
_81D264E:
	loadspritegfx 10198
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 131, 0, 0, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 131, 24, -24, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 131, -16, 16, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 131, -24, -12, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 131, 16, 16, 1, 1
	end
_81D26B9:
	loadspritegfx 10195
	loadspritegfx 10031
	playsewithpan SE_W234, 63
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, -16, 32, -3, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, 16, 32, -3, -1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, 32, 32, -3, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, -32, 32, -3, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, 0, 32, -3, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, -8, 32, -3, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, -8, 32, -3, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, 24, 32, -3, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D6764, 132, -24, 32, -3, 1
	waitforvisualfinish
	waitsound
	call Unknown_81D5F3E
	end

Move_BATON_PASS: @ 81D2762
	loadspritegfx 10226
	playsewithpan SE_W226, 192
	createvisualtask sub_80E1F8C, 2, 31, 1, 2, 0, 11, 31455
	createsprite gBattleAnimSpriteTemplate_84024D0, 2
	end

Move_PERISH_SONG: @ 81D2784
	loadspritegfx 10206
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 1, 1, 16
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 2, 1, 32
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 2, 48
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 4, 2, 64
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 5, 0, 80
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 6, 0, 96
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 7, 1, 112
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 8, 2, 128
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 9, 0, 144
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 10, 2, 160
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 11, 0, 176
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 12, 1, 192
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 13, 3, 208
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 14, 3, 224
	createsprite gBattleAnimSpriteTemplate_83D7D1C, 4, 15, 0, 240
	createsprite gBattleAnimSpriteTemplate_83D7D34, 4, 15, 0, 0
	delay 20
	panse_1B SE_W195, 192, 63, 2, 0
	delay 80
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 0, 16, rgb(0, 0, 0)
	createvisualtask sub_80E0E24, 5, 4, 0
	createvisualtask sub_80E0E24, 5, 5, 0
	createvisualtask sub_80E0E24, 5, 6, 0
	createvisualtask sub_80E0E24, 5, 7, 0
	delay 100
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 16, 0, rgb(0, 0, 0)
	createvisualtask sub_80E0E24, 5, 4, 1
	createvisualtask sub_80E0E24, 5, 5, 1
	createvisualtask sub_80E0E24, 5, 6, 1
	createvisualtask sub_80E0E24, 5, 7, 1
	waitforvisualfinish
	end

Move_SLEEP_TALK: @ 81D28ED
	loadspritegfx 10228
	createvisualtask AnimTask_SwayMon, 5, 0, 4, 4096, 2, 0
	delay 20
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -1
	playsewithpan SE_W173, 192
	delay 6
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -1
	delay 6
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -1
	delay 20
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -5
	playsewithpan SE_W173, 192
	delay 6
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -5
	delay 6
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -5
	delay 20
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -3
	playsewithpan SE_W173, 192
	delay 6
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -3
	delay 6
	createsprite gBattleAnimSpriteTemplate_84022F0, 130, 0, 20, 5, -3
	waitforvisualfinish
	end

Move_HYPER_FANG: @ 81D29A8
	loadspritegfx 10192
	playsewithpan SE_W044, 63
	delay 1
	delay 2
	createvisualtask sub_80E4200, 2
	jumpargeq 7, 1, _81D2A08
	createvisualtask sub_812C924, 2
	jumpargeq 7, 0, _81D29FA
	goto _81D2A01
_81D29D6:
	waitbgfadeout
	createsprite gBattleAnimSpriteTemplate_840233C, 130
	waitbgfadein
	createvisualtask AnimTask_ShakeMon, 3, 1, 0, 10, 10, 1
	playsewithpan SE_W043, 63
	delay 20
	restorebg
	waitbgfadein
	waitforvisualfinish
	end
_81D29FA:
	fadetobg 4
	goto _81D29D6
_81D2A01:
	fadetobg 5
	goto _81D29D6
_81D2A08:
	fadetobg 6
	goto _81D29D6

Move_TRI_ATTACK: @ 81D2A0F
	loadspritegfx 10230
	createsprite gBattleAnimSpriteTemplate_8402458, 130, 16, 0
	playsewithpan SE_W161, 192
	delay 20
	playsewithpan SE_W161, 192
	delay 20
	createsoundtask sub_812B058, 220, -64, 63, 5, 6, 0, 7
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 16, rgb(0, 0, 0)
	delay 16
	loadspritegfx 10033
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, -1, 0
	playsewithpan SE_W172B, 63
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 0, 1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, -1, -1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 2, 1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 1, -1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, -1, 1
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 1, -2
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D9520, 130, 0, 0, 30, 30, 3, 1
	delay 2
	createvisualtask sub_80D60B4, 2, 20, 3, 1, 1
	waitforvisualfinish
	loadspritegfx 10037
	createvisualtask sub_80E2324, 2, 257, 257, 257
	playsewithpan SE_W161B, 63
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 0, -48
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 0, -16
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D97D0, 130, 0, 16
	delay 20
	createvisualtask sub_80D60B4, 2, 20, 3, 1, 0
	delay 2
	createvisualtask sub_80E2324, 2, 257, 257, 257
	waitforvisualfinish
	loadspritegfx 10141
	call Unknown_81D5C36
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 16, 0, rgb(0, 0, 0)
	waitforvisualfinish
	end

Move_WILL_O_WISP: @ 81D2B83
	loadspritegfx 10232
	loadspritegfx 10231
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	playsewithpan SE_W052, 192
	waitplaysewithpan SE_W052, 192, 10
	createvisualtask sub_812B374, 2, -64, -64, 1, 0
	createsprite gBattleAnimSpriteTemplate_83D974C, 2, 0, 0, 0
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D974C, 3, 0, 0, 1
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D974C, 4, 0, 0, 2
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D974C, 4, 0, 0, 3
	delay 40
	createvisualtask sub_812B374, 2, -64, 63, 2, 0
	waitforvisualfinish
	monbgprio_29
	playsewithpan SE_W172B, 63
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 13, 1
	createsprite gBattleAnimSpriteTemplate_83D977C, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D977C, 2, 42
	createsprite gBattleAnimSpriteTemplate_83D977C, 2, 84
	createsprite gBattleAnimSpriteTemplate_83D977C, 2, 126
	createsprite gBattleAnimSpriteTemplate_83D977C, 2, 168
	createsprite gBattleAnimSpriteTemplate_83D977C, 2, 210
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Move_ENCORE: @ 81D2C41
	loadspritegfx 10227
	loadspritegfx 10247
	createvisualtask sub_812CC44, 2
	createvisualtask sub_80E2D78, 2, 248, 3, 0, 10, 0
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_840238C, 130, 0, -8
	createsprite gBattleAnimSpriteTemplate_84023A4, 2, -2, 0, 0, 0, 9
	createsprite gBattleAnimSpriteTemplate_84023A4, 2, 2, 0, 1, 0, 9
	createsprite gBattleAnimSpriteTemplate_84023BC, 3, -2, 0, 0, 0, 9
	createsprite gBattleAnimSpriteTemplate_84023BC, 3, 2, 0, 1, 0, 9
	delay 16
	createvisualtask sub_812B340, 5, 223, 63
	createvisualtask AnimTask_SwayMon, 5, 1, 8, 1536, 5, 1
	waitforvisualfinish
	createvisualtask sub_80E2D78, 2, 248, 3, 10, 0, 1
	waitforvisualfinish
	createvisualtask sub_812CCA8, 2
	end

Move_TRICK: @ 81D2CE8
	loadspritegfx 10224
	loadspritegfx 10207
	createsprite gBattleAnimSpriteTemplate_83D67F4, 2, -40, 80
	createsprite gBattleAnimSpriteTemplate_83D67F4, 2, -40, 208
	delay 16
	playsewithpan SE_W166, 0
	createvisualtask sub_80D1E38, 3
	createvisualtask sub_80D1EC8, 3
	delay 30
	playsewithpan SE_W104, 0
	delay 24
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W104, 0
	delay 16
	playsewithpan SE_W213, 0
	createvisualtask AnimTask_ShakeMon, 3, 0, 5, 0, 7, 2
	createvisualtask AnimTask_ShakeMon, 3, 1, 5, 0, 7, 2
	waitforvisualfinish
	end

Move_WISH: @ 81D2D66
	loadspritegfx 10233
	loadspritegfx 10049
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 0, 10, rgb(0, 0, 0)
	waitforvisualfinish
	panse_27 SE_W115, 63, 192, 253, 0
	createsprite gBattleAnimSpriteTemplate_84024E8, 40
	waitforvisualfinish
	delay 60
	loopsewithpan SE_W215, 192, 16, 3
	call Unknown_81D5ECA
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 10, 0, rgb(0, 0, 0)
	waitforvisualfinish
	end

Move_STOCKPILE: @ 81D2DAE
	loadspritegfx 10235
	playsewithpan SE_W025, 192
	createvisualtask sub_80E1F8C, 2, 2, 8, 1, 0, 12, 32767
	createvisualtask sub_812D674, 5
	call _81D2DEC
	call _81D2DEC
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 2, 0, 12, 0, rgb(31, 31, 31)
	end
_81D2DEC:
	createsprite gBattleAnimSpriteTemplate_83D6350, 2, 55, 55, 13
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D6350, 2, -55, -55, 13
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D6350, 2, 0, 55, 13
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D6350, 2, 0, -55, 13
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D6350, 2, 55, -34, 13
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D6350, 2, 55, 34, 13
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D6350, 2, -55, -34, 13
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D6350, 2, -55, 34, 13
	delay 1
	return

Move_SPIT_UP: @ 81D2E65
	loadspritegfx 10237
	loadspritegfx 10135
	playsewithpan SE_W036, 192
	createvisualtask sub_812D6CC, 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 8, 2
	delay 45
	playsewithpan SE_W255, 192
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 0, 12
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 32, 12
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 64, 12
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 96, 12
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 128, 12
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 160, 12
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 192, 12
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 224, 12
	delay 5
	jumpifmoveturn 2, _81D2F32
	jumpifmoveturn 3, _81D2F5B
_81D2EF5:
	delay 5
	createvisualtask sub_80A9058, 2, 0, 1, 8, 1, 0
	playsewithpan SE_W003, 63
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, -12, 10, 1, 1
	delay 5
	playsewithpan SE_W003, 63
	createsprite gBattleAnimSpriteTemplate_83DB538, 131, 12, -10, 1, 1
	waitforvisualfinish
	end
_81D2F32:
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 16
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 80
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 144
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 208
	goto _81D2EF5
_81D2F5B:
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 16
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 48
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 80
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 112
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 144
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 176
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 208
	createsprite gBattleAnimSpriteTemplate_83D7B60, 2, 240
	goto _81D2EF5

Move_SWALLOW: @ 81D2FA8
	loadspritegfx 10236
	loadspritegfx 10031
	playsewithpan SE_W036, 192
	createvisualtask sub_812D790, 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 8, 2
	delay 38
	playsewithpan SE_W255, 192
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 2, 0, 12, 1
	call _81D2FF9
	jumpifmoveturn 2, _81D303B
	jumpifmoveturn 3, _81D3045
_81D2FF2:
	waitforvisualfinish
	call Unknown_81D5EF5
	end
_81D2FF9:
	createsprite gBattleAnimSpriteTemplate_8402578, 2, 0, -8
	delay 1
	createsprite gBattleAnimSpriteTemplate_8402578, 2, -24, -8
	delay 1
	createsprite gBattleAnimSpriteTemplate_8402578, 2, 16, -8
	delay 1
	createsprite gBattleAnimSpriteTemplate_8402578, 2, -16, -8
	delay 1
	createsprite gBattleAnimSpriteTemplate_8402578, 2, 24, -8
	delay 1
	return
_81D303B:
	call _81D2FF9
	goto _81D2FF2
_81D3045:
	call _81D2FF9
	call _81D2FF9
	goto _81D2FF2

Move_TRANSFORM: @ 81D3054
	monbg ANIM_BANK_ATTACKER
	playsewithpan SE_W100, 192
	waitplaysewithpan SE_W107, 192, 48
	createvisualtask sub_812D7E8, 2, 0
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	end

Move_MORNING_SUN: @ 81D306C
	loadspritegfx 10241
	loadspritegfx 10031
	createvisualtask sub_812DB84, 5
	delay 8
	createvisualtask sub_80E2A38, 10, 1921, 8, 0, 12, 32767
	delay 14
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	call _81D30F2
	createvisualtask sub_80E2A38, 10, 1921, 3, 12, 0, 32767
	waitforvisualfinish
	waitsound
	call Unknown_81D5EF5
	end
_81D30F2:
	createsprite gBattleAnimSpriteTemplate_84025EC, 2, 30, 640
	delay 5
	return

Move_SWEET_SCENT: @ 81D3100
	loadspritegfx 10238
	playsewithpan SE_W230, 192
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 100, 0, 100
	delay 25
	setpan 0
	call _81D3144
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 55, 0
	setpan 63
	createvisualtask sub_80E1F8C, 2, 20, 1, 5, 5, 13, 22207
	call _81D3144
	waitforvisualfinish
	end
_81D3144:
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 70, 1, 64
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 60, 0, 64
	delay 5
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 80, 1, 64
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 58, 0, 120
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 100, 0, 120
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 90, 0, 64
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 48, 0, 64
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 95, 1, 80
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 100, 0, 120
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 75, 1, 64
	delay 2
	createsprite gBattleAnimSpriteTemplate_84026A4, 2, 85, 0, 120
	delay 2
	return

Move_HYPER_BEAM: @ 81D31EA
	loadspritegfx 10147
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 4, 0, 16, rgb(0, 0, 0)
	waitforvisualfinish
	delay 10
	playsewithpan SE_W063, 192
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 4, 1
	waitforvisualfinish
	delay 30
	createsoundtask sub_812B058, 247, -64, 63, 1, 15, 0, 5
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_ATTACKER, 0, 4, 50, 1
	createvisualtask sub_80E21A8, 2, 10147, 1, 12, 31, 16, 0, 0
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 50, 1
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 11, 26425
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	createvisualtask sub_80E2A38, 10, 4, 2, 11, 0, 26425
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 4, 16, 0, rgb(0, 0, 0)
	end
_81D331B:
	createsprite gBattleAnimSpriteTemplate_83D6394, 130
	createsprite gBattleAnimSpriteTemplate_83D6394, 130
	delay 1
	return

Move_FLATTER: @ 81D332C
	loadspritegfx 10227
	loadspritegfx 10240
	createvisualtask sub_812B340, 5, 223, 63
	createvisualtask sub_812CC44, 2
	createvisualtask sub_80E2D78, 2, 248, 3, 0, 10, 0
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_8402720, 130, 0, -8, 80
	delay 0
	createsprite gVerticalDipSpriteTemplate, 2, 5, 2, ANIM_BANK_TARGET
	delay 10
	createsprite gVerticalDipSpriteTemplate, 2, 5, 2, ANIM_BANK_TARGET
	delay 0
	createvisualtask sub_812B30C, 5, 229, -64
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	call _81D3415
	delay 5
	createvisualtask sub_812B30C, 5, 229, 63
	waitforvisualfinish
	createvisualtask sub_80E2D78, 2, 248, 3, 10, 0, 1
	waitforvisualfinish
	createvisualtask sub_812CCA8, 2
	end
_81D3415:
	createsprite gBattleAnimSpriteTemplate_8402708, 40, 0
	createsprite gBattleAnimSpriteTemplate_8402708, 40, 1
	return

Move_ROLE_PLAY: @ 81D3428
	monbg ANIM_BANK_ATK_PARTNER
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 16, 32767
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 0, 10, rgb(0, 0, 0)
	waitforvisualfinish
	playsewithpan SE_W161, 192
	waitplaysewithpan SE_W197, 192, 30
	createvisualtask sub_812EFC8, 2
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	createvisualtask sub_80E2A38, 10, 4, 2, 16, 0, 32767
	delay 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 2, 10, 0, rgb(0, 0, 0)
	end

Move_REFRESH: @ 81D3485
	loadspritegfx 10203
	loadspritegfx 10049
	playsewithpan SE_W287, 192
	createvisualtask sub_81300A4, 2, 0
	waitforvisualfinish
	playsewithpan SE_W234, 192
	call Unknown_81D5ECA
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 31, 3, 10, 0, rgb(12, 24, 30)
	createsprite gBattleAnimSpriteTemplate_83D7928, 3, 0, 0, 0, 0
	end

Move_BLAZE_KICK: @ 81D34C8
	loadspritegfx 10135
	loadspritegfx 10143
	loadspritegfx 10029
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W172, 63
	createsprite gBattleAnimSpriteTemplate_83DA024, 131, 0, 0, 1, 30
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 7, 32767
	delay 30
	playsewithpan SE_W007, 63
	createsprite gBasicHitSplatSpriteTemplate, 130, 0, 0, 1, 0
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 14, 1
	createvisualtask sub_80E2A38, 10, 4, 2, 0, 0, 32767
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 3, 1, 0, 8, 0, 0
	call _81D11A2
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_HYPER_VOICE: @ 81D3550
	loadspritegfx 10203
	call _81D3562
	waitforvisualfinish
	delay 8
	call _81D3562
	waitforvisualfinish
	end
_81D3562:
	createvisualtask sub_812B2B8, 5
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 31, 3, 8, 0, rgb(31, 31, 0)
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 5, ANIM_BANK_ATTACKER, 0
	createsprite gBattleAnimSpriteTemplate_83D798C, 0, 45, 0, 0, 0, 0, 0, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 1, 0, 6, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_DEF_PARTNER, 1, 0, 6, 1
	createvisualtask sub_80E26BC, 2, 1, 0, 6, 1
	return

Move_SAND_TOMB: @ 81D35D2
	loadspritegfx 10074
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 4, 2, 0, 7, rgb(19, 17, 0)
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 43, 1
	playsewithpan SE_W328, 63
	call _81D361F
	call _81D361F
	call _81D361F
	delay 22
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 4, 2, 7, 0, rgb(19, 17, 0)
	waitforvisualfinish
	end
_81D361F:
	createsprite gBattleAnimSpriteTemplate_83DAC7C, 130, 0, 32, 528, 30, 10, 50, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC7C, 130, 0, 36, 480, 20, 13, -46, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC7C, 130, 0, 37, 576, 20, 5, 42, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC7C, 130, 0, 35, 400, 25, 8, -42, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC7C, 130, 0, 32, 512, 25, 13, 46, 1
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DAC7C, 130, 0, 37, 464, 30, 12, -50, 1
	delay 2
	return

Move_SHEER_COLD: @ 81D36AA
	fadetobg 15
	waitbgfadeout
	playsewithpan SE_W196, 0
	waitbgfadein
	loadspritegfx 10010
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask sub_807B920, 2
	waitplaysewithpan SE_W258, 63, 17
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadein
	end

Move_ARM_THRUST: @ 81D36CF
	loadspritegfx 10143
	loadspritegfx 10135
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask sub_80A8E04, 5, 8, 5, 0, 0
	delay 6
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 3
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83DA144, 130, 10, -8, 14, 3
	waitforvisualfinish
	createvisualtask sub_80A8E04, 5, 8, 5, 0, 1
	playsewithpan SE_W003, 63
	choosetwoturnanim _81D373C, _81D3750
_81D3728:
	createvisualtask AnimTask_ShakeMon, 5, 1, 4, 0, 6, 1
	waitforvisualfinish
	blendoff
	end
_81D373C:
	createsprite gBasicHitSplatSpriteTemplate, 130, 8, 0, 1, 2
	goto _81D3728
_81D3750:
	createsprite gBasicHitSplatSpriteTemplate, 130, -8, 0, 1, 2
	goto _81D3728

Move_MUDDY_WATER: @ 81D3764
	panse_1B SE_W250, 192, 63, 2, 0
	createvisualtask sub_80D38BC, 2, 1
	waitforvisualfinish
	end

Move_BULLET_SEED: @ 81D3776
	loadspritegfx 10006
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 30, 1
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D7628, 130, 20, 0
	waitforvisualfinish
	end

Move_DRAGON_CLAW: @ 81D380C
	loadspritegfx 10029
	loadspritegfx 10039
	playsewithpan SE_W221B, 192
	createvisualtask sub_80E2A38, 10, 2, 4, 0, 8, 639
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 15, 1
	call _81D39E9
	call _81D39E9
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createvisualtask sub_812B30C, 5, 136, 63
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, -10, -10, 0
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, -10, 10, 0
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, -4, 1, 10, 3, 1
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createvisualtask sub_812B30C, 5, 136, 63
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, 10, -10, 1
	createsprite gBattleAnimSpriteTemplate_83DB288, 130, 10, 10, 1
	createsprite gBattleAnimSpriteTemplate_83DB428, 2, -4, 1, 10, 3, 1
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 33, 464, 30, 15, -50, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 33, 464, 30, 15, -50, 0
	createvisualtask sub_80E2A38, 10, 2, 4, 8, 0, 639
	waitforvisualfinish
	end
_81D39E9:
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 28, 528, 30, 13, 50, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 32, 480, 20, 16, -46, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 33, 576, 20, 8, 42, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 31, 400, 25, 11, -42, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 28, 512, 25, 16, 46, 0
	delay 2
	createsprite gBattleAnimSpriteTemplate_83DACD0, 2, 0, 33, 464, 30, 15, -50, 0
	delay 2
	return

Unknown_81D3A74: @ 81D3A74
	end

Move_MUD_SHOT: @ 81D3A75
	loadspritegfx 10259
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	createvisualtask AnimTask_ShakeMon, 5, 0, 0, 2, 46, 1
	delay 6
	createvisualtask sub_80D3630, 5, 100
	panse_1B SE_W250, 192, 63, 1, 0
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 43, 1
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D3AEF:
	createsprite gBattleAnimSpriteTemplate_83D920C, 3, 10, 10, 0, 16
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D920C, 3, 10, 10, 0, 16
	delay 2
	return

Move_METEOR_MASH: @ 81D3B12
	loadspritegfx 10233
	loadspritegfx 10135
	loadspritegfx 10143
	panse_1B SE_W112, 192, 63, 3, 0
	fadetobg 16
	waitbgfadein
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_8402A3C, 131, -48, -64, 72, 32, 30
	delay 10
	createsprite gBattleAnimSpriteTemplate_8402A3C, 131, -112, -64, 8, 32, 30
	delay 40
	createsprite gBattleAnimSpriteTemplate_83DA024, 131, 0, 0, 0, 30
	createsprite gBattleAnimSpriteTemplate_8402A3C, 131, -80, -64, 40, 32, 30
	delay 20
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 5, 0, 20, 1
	waitforvisualfinish
	delay 10
	restorebg
	waitbgfadein
	waitforvisualfinish
	end

Move_REVENGE: @ 81D3B99
	loadspritegfx 10245
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W036, 192
	createsprite gBattleAnimSpriteTemplate_83DA198, 2, 10, -10
	waitforvisualfinish
	createvisualtask sub_80E1F8C, 2, 2, 0, 4, 2, 8, 31
	waitforvisualfinish
	unloadspritegfx 10245
	loadspritegfx 10246
	createsprite gHorizontalLungeSpriteTemplate, 2, 6, 4
	delay 4
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83DA1E0, 130, 10, -10
	waitforvisualfinish
	unloadspritegfx 10246
	loadspritegfx 10135
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 3, 0, 10, 1
	createsprite gBattleAnimSpriteTemplate_83DB550, 131, -10, -8, 1, 1, 8
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DB550, 131, 10, 8, 1, 1, 8
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_POISON_FANG: @ 81D3C30
	loadspritegfx 10192
	loadspritegfx 10150
	playsewithpan SE_W044, 63
	createsprite gBattleAnimSpriteTemplate_840233C, 130
	delay 10
	createvisualtask AnimTask_ShakeMon, 3, 1, 3, 0, 10, 1
	waitforvisualfinish
	createvisualtask sub_80E1F8C, 2, 4, 0, 4, 0, 12, 26650
	call PoisonBubblesAnim
	waitforvisualfinish
	end

Move_SUBSTITUTE: @ 81D3C6F
	playsewithpan SE_W213, 192
	createvisualtask sub_81312E4, 2
	end

Move_FRENZY_PLANT: @ 81D3C7B
	loadspritegfx 10223
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 1, 2, 0, 5, rgb(0, 0, 0)
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 10, 8, 2, 0, 0, 100
	playsewithpan SE_W010, 192
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 20, -8, -2, 0, 1, 95
	playsewithpan SE_W010, 213
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 30, 8, -4, 0, 0, 90
	playsewithpan SE_W010, 234
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 40, -8, 4, 0, 1, 85
	playsewithpan SE_W010, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 50, 8, 0, 0, 0, 85
	playsewithpan SE_W010, 21
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 60, -8, -2, 0, 1, 85
	playsewithpan SE_W010, 42
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 75, 8, 0, 0, 0, 85
	playsewithpan SE_W010, 63
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 85, 16, 6, 0, 3, 80
	playsewithpan SE_W010, 63
	delay 5
	createsprite gBattleAnimSpriteTemplate_83D6670, 2, 85, -16, -6, 0, 2, 75
	playsewithpan SE_W010, 63
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -10, 1, 3
	playsewithpan SE_W003, 63
	createvisualtask AnimTask_ShakeMon, 3, 1, 8, 0, 20, 1
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, 2, 10, 8, 1, 3
	playsewithpan SE_W003, 63
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, 2, 10, -3, 1, 2
	playsewithpan SE_W003, 63
	delay 3
	createsprite gBasicHitSplatSpriteTemplate, 2, -3, 1, 1, 2
	playsewithpan SE_W003, 63
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, 1, 1, 1
	playsewithpan SE_W003, 63
	delay 2
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 10, 1, 1
	playsewithpan SE_W003, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 1, 2, 5, 0, rgb(0, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Move_METAL_SOUND: @ 81D3E1F
	loadspritegfx 10260
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_2A ANIM_BANK_TARGET
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 2, 0, 8, 1
	call _81D3E52
	call _81D3E52
	call _81D3E52
	call _81D3E52
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	delay 0
	waitforvisualfinish
	end
_81D3E52:
	panse_1B SE_W103, 192, 63, 2, 0
	createsprite gBattleAnimSpriteTemplate_83D7564, 130, 16, 0, 0, 0, 30, 0
	delay 2
	return

Move_FOCUS_PUNCH: @ 81D3E6F
	goto _81D3E76
_81D3E74:
	waitforvisualfinish
	end
_81D3E76:
	loadspritegfx 10135
	loadspritegfx 10143
	delay 1
	createvisualtask sub_80E4200, 2
	jumpargeq 7, 1, _81D3F2F
	createvisualtask sub_812C924, 2
	jumpargeq 7, 0, _81D3F21
	jumpargeq 7, 1, _81D3F28
_81D3EA4:
	waitbgfadein
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W207, 63
	createsprite gBattleAnimSpriteTemplate_83DA214, 130
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -8, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 8, 0, 24, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 2, 10, 2, 1, 0
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 2, 10, -6, 1, 0
	playsewithpan SE_W233B, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 8, 1, 0
	playsewithpan SE_W025B, 63
	waitforvisualfinish
	restorebg
	waitbgfadein
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	goto _81D3E74
_81D3F21:
	fadetobg 4
	goto _81D3EA4
_81D3F28:
	fadetobg 5
	goto _81D3EA4
_81D3F2F:
	fadetobg 6
	goto _81D3EA4

Move_RETURN: @ 81D3F36
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createvisualtask sub_81318F0, 2
	delay 2
	jumpargeq 7, 0, _81D3F6C
	jumpargeq 7, 1, _81D3FBE
	jumpargeq 7, 2, _81D401E
	jumpargeq 7, 3, _81D4139
_81D3F67:
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D3F6C:
	createsprite gVerticalDipSpriteTemplate, 2, 16, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, 2, 16, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -8, 1, 2
	createvisualtask sub_812B30C, 5, 139, 63
	goto _81D3F67
_81D3FBE:
	createsprite gVerticalDipSpriteTemplate, 2, 6, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, 2, 6, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	waitforvisualfinish
	delay 11
	createsprite gHorizontalLungeSpriteTemplate, 2, 5, 4
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 3, 0, 0, 1, 2
	createvisualtask sub_812B30C, 5, 141, 63
	goto _81D3F67
_81D401E:
	createsprite gVerticalDipSpriteTemplate, 2, 6, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, 2, 6, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, 2, 6, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, 2, 6, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -8, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 2, 10, 10, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 2, 3, -5, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 2, -5, 3, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	goto _81D3F67
_81D4139:
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 0, 0, 6, rgb(0, 0, 0)
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, 2, 16, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 2, 3, -5, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, 2, 12, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -8, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	waitforvisualfinish
	delay 4
	createsprite gVerticalDipSpriteTemplate, 2, 8, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -8, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	waitforvisualfinish
	delay 2
	createvisualtask sub_80E2DD8, 2, 0, 4, 5, 1
	createsprite gVerticalDipSpriteTemplate, 2, 4, 1, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -8, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask sub_80E2DD8, 2, 0, 4, 5, 1
	waitforvisualfinish
	createsprite gVerticalDipSpriteTemplate, 2, 4, 2, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	delay 5
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -8, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask sub_80E2DD8, 2, 0, 4, 5, 1
	waitforvisualfinish
	call _81D4371
	call _81D4371
	call _81D4371
	call _81D4371
	createsprite gBasicHitSplatSpriteTemplate, 2, -10, -8, 1, 0
	createvisualtask sub_812B30C, 5, 141, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 8, 0, 24, 1
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 2, 10, 10, 1, 0
	createvisualtask sub_812B30C, 5, 141, 63
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 2, 3, -5, 1, 0
	createvisualtask sub_812B30C, 5, 141, 63
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 2, -5, 3, 1, 0
	createvisualtask sub_812B30C, 5, 141, 63
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 0, 6, 0, rgb(0, 0, 0)
	goto _81D3F67
_81D4371:
	createsprite gVerticalDipSpriteTemplate, 2, 4, 3, ANIM_BANK_ATTACKER
	createvisualtask sub_812B340, 5, 167, -64
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask sub_812B30C, 5, 123, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createvisualtask sub_80E2DD8, 2, 0, 4, 5, 1
	waitforvisualfinish
	return

Move_COSMIC_POWER: @ 81D43C5
	loadspritegfx 10049
	createvisualtask sub_812B340, 5, 243, 0
	playsewithpan SE_W322, 0
	createvisualtask sub_80E3A08, 2, 0, 0, 15, 0
	waitforvisualfinish
	fadetobg 16
	waitbgfadeout
	createvisualtask sub_80E3A58, 2, 0, 128, 0, -1
	waitbgfadein
	delay 70
	createvisualtask sub_812B30C, 5, 228, -64
	createsprite gBattleAnimSpriteTemplate_83D6C88, 2, -15, 0, 0, 0, 32, 60
	delay 8
	createsprite gBattleAnimSpriteTemplate_83D6C88, 2, 12, -5, 0, 0, 32, 60
	delay 40
	createvisualtask sub_80E3A08, 2, 0, 15, 0, 0
	waitforvisualfinish
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	waitforvisualfinish
	end

Move_BLAST_BURN: @ 81D444A
	loadspritegfx 10035
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W221, 192
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -32, 0, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -20, -10, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 0, -16, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 20, -10, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 32, 0, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 20, 10, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, 0, 16, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -20, 10, 24, 0, 0, 0
	delay 25
	playsewithpan SE_W172B, 192
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -64, 0, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 6, -40, -20, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 70, 0, -32, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 70, 40, -20, 24, 0, 0, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 6, 0, 8, 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 64, 0, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 40, 20, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, 0, 32, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -40, 20, 24, 0, 0, 0
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 25
	playsewithpan SE_W172B, 192
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -96, 0, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 6, -60, -30, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 70, 0, -48, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 70, 60, -30, 24, 0, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, 130, -4, 3, 1, 0
	createvisualtask AnimTask_ShakeMon, 5, 1, 12, 0, 20, 1
	createvisualtask sub_80E26BC, 2, 2, 0, 10, 1
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 96, 0, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 66, 60, 30, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, 0, 48, 24, 0, 0, 0
	createsprite gBattleAnimSpriteTemplate_83D9538, 2, -60, 30, 24, 0, 0, 0
	createvisualtask sub_80E2324, 2, 257, 257, 257
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_ROCK_TOMB: @ 81D468C
	loadspritegfx 10250
	loadspritegfx 10058
	createvisualtask sub_80E26BC, 2, 2, 0, 10, 1
	waitforvisualfinish
	createsprite gBattleAnimSpriteTemplate_83DADA8, 130, 20, 12, 64, 114, 0
	delay 8
	createvisualtask sub_80E26BC, 2, 0, 2, 3, 1
	playsewithpan SE_W070, 63
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DADA8, 130, -20, 12, 64, 98, 0
	delay 8
	createvisualtask sub_80E26BC, 2, 0, 2, 3, 1
	playsewithpan SE_W070, 63
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DADA8, 194, 3, 6, 64, 82, 0
	delay 8
	createvisualtask sub_80E26BC, 2, 0, 2, 3, 1
	playsewithpan SE_W070, 63
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DADA8, 130, -3, 13, 64, 66, 0
	delay 8
	createvisualtask sub_80E26BC, 2, 0, 2, 3, 1
	playsewithpan SE_W070, 63
	delay 24
	playsewithpan SE_W063, 63
	createsprite gBattleAnimSpriteTemplate_83DA8F4, 133, 1, 50
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 20, 1
	createvisualtask sub_80E26BC, 2, 2, 0, 10, 1
	waitforvisualfinish
	end

Move_SILVER_WIND: @ 81D4773
	loadspritegfx 10271
	panse_1B SE_W016, 192, 63, 2, 0
	playsewithpan SE_W234, 0
	delay 0
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_29
	delay 0
	createvisualtask sub_80E2A7C, 10, 1, 0, 0, 4, 0
	createvisualtask sub_80E3B78, 2
	jumpargeq 7, 1, _81D4974
	fadetobg 22
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, 1536, 0, 0, -1
_81D47BA:
	delay 0
	createvisualtask sub_80E2A38, 10, 1, 0, 4, 4, 0
	waitbgfadein
	createsprite gBattleAnimSpriteTemplate_83D693C, 194, -32, 16, 0, 6, 2, 3, 1
	createsprite gBattleAnimSpriteTemplate_83D693C, 194, -8, 18, 64, 3, 2, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D693C, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D693C, 120, -40, 14, 128, 4, 1, 2, 1
	delay 0
	createsprite gBattleAnimSpriteTemplate_83D6954, 194, -32, 16, 0, 6, 2, 3, 1
	createsprite gBattleAnimSpriteTemplate_83D6954, 194, -8, 18, 64, 3, 2, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D6954, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D6954, 120, -40, 14, 128, 4, 1, 2, 1
	delay 0
	createsprite gBattleAnimSpriteTemplate_83D696C, 194, -32, 16, 0, 6, 2, 3, 1
	createsprite gBattleAnimSpriteTemplate_83D696C, 194, -8, 18, 64, 3, 2, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D696C, 120, -24, 18, 90, 5, 1, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D696C, 120, -40, 14, 128, 4, 1, 2, 1
	delay 6
	createsprite gBattleAnimSpriteTemplate_83D693C, 194, -4, 16, 0, 6, 1, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D693C, 194, -16, 12, 192, 5, 2, 3, 1
	delay 0
	createsprite gBattleAnimSpriteTemplate_83D6954, 194, -4, 16, 0, 6, 1, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D6954, 194, -16, 12, 192, 5, 2, 3, 1
	delay 0
	createsprite gBattleAnimSpriteTemplate_83D696C, 194, -4, 16, 0, 6, 1, 2, 1
	createsprite gBattleAnimSpriteTemplate_83D696C, 194, -16, 12, 192, 5, 2, 3, 1
	waitforvisualfinish
	playsewithpan SE_W016B, 63
	clearmonbg ANIM_BANK_DEF_PARTNER
	delay 0
	restorebg
	waitbgfadeout
	createvisualtask sub_80E2A7C, 10, 1, 0, 4, 0, 0
	setarg 7, -1
	waitbgfadein
	end
_81D4974:
	fadetobg 23
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, -1536, 0, 0, -1
	goto _81D47BA

Move_SNATCH: @ 81D498B
	playsewithpan SE_W036, 192
	createvisualtask AnimTask_WindUpLunge, 5, ANIM_BANK_ATTACKER, -12, 4, 10, 10, 12, 6
	end

Move_DIVE: @ 81D49A5
	loadspritegfx 10272
	loadspritegfx 10273
	choosetwoturnanim _81D49B4, _81D4A09
_81D49B4:
	loadspritegfx 10156
	playsewithpan SE_W029, 192
	createsprite gBattleAnimSpriteTemplate_83DA5D8, 2, 0, 0, 13, 336
	waitforvisualfinish
	playsewithpan SE_W291, 192
	createsprite gBattleAnimSpriteTemplate_83DA614, 3, 0
	call _81D49F2
	call _81D49F2
	call _81D49F2
	call _81D49F2
	call _81D49F2
	end
_81D49F2:
	createsprite gBattleAnimSpriteTemplate_83DA62C, 5, 0, 0
	createsprite gBattleAnimSpriteTemplate_83DA62C, 5, 1, 0
	return
_81D4A09:
	loadspritegfx 10148
	loadspritegfx 10155
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W153, 63
	createsprite gBattleAnimSpriteTemplate_83DA614, 131, 1
	call _81D4A48
	call _81D4A48
	call _81D4A48
	call _81D4A48
	call _81D4A48
	delay 12
	call _81C9502
	waitforvisualfinish
	visible 0
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D4A48:
	createsprite gBattleAnimSpriteTemplate_83DA62C, 133, 0, 1
	createsprite gBattleAnimSpriteTemplate_83DA62C, 133, 1, 1
	return

Move_ROCK_BLAST: @ 81D4A5F
	loadspritegfx 10058
	loadspritegfx 10135
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 6
	delay 3
	playsewithpan SE_W207, 192
	createsprite gBattleAnimSpriteTemplate_83DADE8, 130, 16, 0, 0, 0, 25, 257
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 1
	playsewithpan SE_W088, 63
	createsprite gBattleAnimSpriteTemplate_83DAC64, 130, 0, 0, 20, 24, 14, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 5, 1
	createsprite gBattleAnimSpriteTemplate_83DAC64, 130, 5, 0, -20, 24, 14, 1
	createsprite gBattleAnimSpriteTemplate_83DAC64, 130, 0, 5, 20, -24, 14, 2
	createsprite gBattleAnimSpriteTemplate_83DAC64, 130, -5, 0, -20, -24, 14, 2
	waitforvisualfinish
	end

Move_OVERHEAT: @ 81D4AFC
	loadspritegfx 10029
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 18
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 5, rgb(28, 0, 0)
	waitforvisualfinish
	createvisualtask sub_80E4028, 5, 0, 1
	delay 1
	createvisualtask sub_80E4178, 5, 0
	delay 1
	playsewithpan SE_W082, 192
	createvisualtask sub_80E4028, 5, 1, 0
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 2, 1, 0, 13, rgb(28, 0, 0)
	createvisualtask AnimTask_ShakeMon, 5, 0, 2, 0, 15, 1
	waitforvisualfinish
	playsewithpan SE_W172B, 192
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 0, 30, 25, -20
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 32, 30, 25, -20
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 64, 30, 25, -20
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 96, 30, 25, -20
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 128, 30, 25, -20
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 160, 30, 25, -20
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 192, 30, 25, -20
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 224, 30, 25, -20
	delay 5
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 0, 30, 25, 0
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 32, 30, 25, 0
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 64, 30, 25, 0
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 96, 30, 25, 0
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 128, 30, 25, 0
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 160, 30, 25, 0
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 192, 30, 25, 0
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 224, 30, 25, 0
	delay 5
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 0, 30, 25, 10
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 32, 30, 25, 10
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 64, 30, 25, 10
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 96, 30, 25, 10
	createsprite gBattleAnimSpriteTemplate_83DB100, 2, 1, 128, 30, 25, 10
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 160, 30, 25, 10
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 192, 30, 25, 10
	createsprite gBattleAnimSpriteTemplate_83DB100, 66, 1, 224, 30, 25, 10
	delay 5
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 131, -5, 3, 1, 0
	playsewithpan SE_W007, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 10, 0, 25, 1
	delay 6
	createsprite gBasicHitSplatSpriteTemplate, 131, 8, -5, 1, 0
	playsewithpan SE_W007, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 131, 10, 10, 1, 0
	playsewithpan SE_W007, 63
	delay 8
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 0
	playsewithpan SE_W007, 63
	createvisualtask sub_80E4178, 5, 1
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 2, -1, 0, 13, rgb(18, 18, 18)
	createvisualtask AnimTask_ShakeMon, 5, 0, 3, 0, 15, 1
	waitforvisualfinish
	createvisualtask sub_80E40D0, 5, 0, 1
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 5, 0, rgb(28, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	waitforvisualfinish
	delay 15
	createvisualtask sub_80E40D0, 5, 1, 0
	delay 1
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 2, 0, 13, 0, rgb(18, 18, 18)
	waitforvisualfinish
	end

Move_HYDRO_CANNON: @ 81D4DDE
	loadspritegfx 10149
	loadspritegfx 10148
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	playsewithpan SE_W057, 192
	createsprite gBattleAnimSpriteTemplate_83D92D0, 130
	delay 10
	createvisualtask sub_80E2324, 2, 257, 257, 257
	delay 30
	panse_1B SE_W056, 192, 63, 2, 0
	call _81D4EA8
	createvisualtask AnimTask_ShakeMon, 5, 1, 10, 0, 40, 1
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 130, 0, 0, 1, 0
	call _81D4EA8
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 130, 0, 0, 1, 0
	call _81D4EA8
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 130, 0, 0, 1, 0
	call _81D4EA8
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 130, 0, 0, 1, 0
	call _81D4EA8
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 130, 0, 0, 1, 0
	call _81D4EA8
	createsprite gBattleAnimSpriteTemplate_83DB4D8, 130, 0, 0, 1, 0
	waitforvisualfinish
	createvisualtask sub_80E2324, 2, 257, 257, 257
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D4EA8:
	createsprite gBattleAnimSpriteTemplate_83D92E8, 130, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D92E8, 130, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D92E8, 130, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D92E8, 130, 10, -10, 0, 0, 15, 257
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D92E8, 130, 10, -10, 0, 0, 15, 257
	return

Move_ASTONISH: @ 81D4F10
	loadspritegfx 10273
	playsewithpan SE_W227, 192
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 6
	delay 25
	createsprite gBattleAnimSpriteTemplate_83DA62C, 133, 0, 1
	playsewithpan SE_W166, 63
	createsprite gBattleAnimSpriteTemplate_83DA62C, 133, 1, 1
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 5, 1
	createvisualtask sub_80D1E38, 3
	waitforvisualfinish
	end

Move_SEISMIC_TOSS: @ 81D4F58
	loadspritegfx 10135
	loadspritegfx 10058
	setarg 7, 0
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	waitforvisualfinish
	createvisualtask sub_80DDA4C, 3
	delay 1
	fadetobg 17
	waitbgfadeout
	createvisualtask sub_80DDA8C, 3
	playsewithpan SE_W327, 0
	waitbgfadein
	waitforvisualfinish
	createvisualtask sub_80DDAF0, 3
	jumpargeq 7, 0, _81D4FAB
	jumpargeq 7, 1, _81D4FBC
	jumpargeq 7, 2, _81D4FD4
_81D4FA0:
	restorebg
	waitbgfadeout
	setarg 7, 4095
	waitbgfadein
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end
_81D4FAB:
	call _81D4FF3
	delay 16
	call _81D5054
	goto _81D4FA0
_81D4FBC:
	call _81D4FF3
	delay 14
	call _81D5054
	delay 14
	call _81D4FF3
	goto _81D4FA0
_81D4FD4:
	call _81D5054
	delay 10
	call _81D4FF3
	delay 10
	call _81D5054
	delay 10
	call _81D4FF3
	goto _81D4FA0
_81D4FF3:
	createsprite gBasicHitSplatSpriteTemplate, 131, -10, -8, 1, 1
	playsewithpan SE_W070, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 5, 1
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, -12, 27, 2, 3
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, 8, 28, 3, 4
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, -4, 30, 2, 3
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, 12, 25, 4, 4
	return
_81D5054:
	createsprite gBasicHitSplatSpriteTemplate, 131, 10, -8, 1, 1
	playsewithpan SE_W088, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 5, 1
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, -12, 32, 3, 4
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, 8, 31, 2, 2
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, -4, 28, 2, 3
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, 12, 30, 4, 3
	return

Move_MAGIC_COAT: @ 81D50B5
	loadspritegfx 10170
	setalpha 0, 16
	waitplaysewithpan SE_W112, 192, 15
	createsprite gBattleAnimSpriteTemplate_83DA708, 3, 40, 0, 10170
	waitforvisualfinish
	delay 1
	blendoff
	end

Move_WATER_PULSE: @ 81D50D2
	loadspritegfx 10155
	loadspritegfx 10288
	monbg ANIM_BANK_TARGET
	monbgprio_28 1
	playsewithpan SE_W145C, 192
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 0, 0, 7, rgb(0, 25, 28)
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D9408, 66, 100, 100, 8, 1, 20, 40, 0
	createsprite gBattleAnimSpriteTemplate_83D9408, 66, 20, 100, 16, 2, 10, 35, 1
	createsprite gBattleAnimSpriteTemplate_83D9408, 66, 200, 80, 8, 1, 40, 20, 0
	createsprite gBattleAnimSpriteTemplate_83D9408, 66, 80, 60, 10, 3, 20, 50, 0
	createsprite gBattleAnimSpriteTemplate_83D9408, 66, 140, 100, 16, 1, 20, 30, 1
	playsewithpan SE_W145C, 63
	waitforvisualfinish
	playsewithpan SE_W202, 192
	createsprite gBattleAnimSpriteTemplate_83D757C, 130, 0, 0, 40, 15
	delay 5
	playsewithpan SE_W202, 192
	createsprite gBattleAnimSpriteTemplate_83D757C, 130, 0, 0, 40, 15
	delay 5
	playsewithpan SE_W202, 192
	createsprite gBattleAnimSpriteTemplate_83D757C, 130, 0, 0, 40, 15
	delay 13
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 8, 18, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 7, 0, rgb(0, 25, 28)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

Move_PSYCHO_BOOST: @ 81D51C7
	loadspritegfx 10212
	monbg ANIM_BANK_ATK_PARTNER
	fadetobg 3
	waitbgfadeout
	createvisualtask sub_812C624, 5
	waitbgfadein
	delay 6
	createvisualtask sub_80E1F8C, 2, 1, 2, 8, 0, 10, 0
	delay 0
	monbgprio_28 0
	setalpha 8, 8
	delay 10
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_ATTACKER, 3, 0, 240, 0
	loopsewithpan SE_W060B, 192, 14, 10
	createsprite gBattleAnimSpriteTemplate_83DAA68, 2
	delay 110
	loopsewithpan SE_W060B, 192, 7, 10
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, -8, 1, 24, 1
	playsewithpan SE_W043, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	call Unknown_81D61F3
	end

Move_KNOCK_OFF: @ 81D523B
	loadspritegfx 10277
	loadspritegfx 10135
	createsprite gHorizontalLungeSpriteTemplate, 2, 4, 6
	delay 4
	playsewithpan SE_W233, 63
	createsprite gBattleAnimSpriteTemplate_8402AE4, 130, -16, -16
	delay 8
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 5, 1, 32767, 10, 0, 0
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, 0, 1, 2
	playsewithpan SE_W004, 63
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -12, 10, 0, 3
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 5
	delay 3
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 0, 3, 6, 1
	delay 5
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 6
	delay 10
	waitforvisualfinish
	end

Move_DOOM_DESIRE: @ 81D52CB
	createvisualtask sub_80E0EE8, 2
	delay 1
	monbg ANIM_BANK_ATK_PARTNER
	createvisualtask sub_80E0E24, 5, 1, 0
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 4, rgb(0, 0, 0)
	waitforvisualfinish
	setalpha 8, 8
	playsewithpan SE_W060, 192
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -4, -4, 15, ANIM_BANK_ATTACKER, 1
	waitforvisualfinish
	delay 20
	createvisualtask sub_80E0E24, 5, 1, 1
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 4, 0, rgb(0, 0, 0)
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATK_PARTNER
	blendoff
	end

Unknown_81D532F: @ 81D532F
	loadspritegfx 10198
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 0, 16, rgb(31, 31, 31)
	waitforvisualfinish
	delay 10
	createvisualtask sub_812E14C, 5
	delay 5
	playsewithpan SE_W109, 192
	delay 10
	playsewithpan SE_W109, 0
	delay 10
	playsewithpan SE_W109, 63
	delay 23
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 10, 0, 20, 1
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 16, 0, rgb(31, 31, 31)
	waitforvisualfinish
	end

Move_SKY_UPPERCUT: @ 81D53ED
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	fadetobg 17
	waitbgfadeout
	playsewithpan SE_W327, 192
	createvisualtask sub_80D9C80, 5, 55
	waitbgfadein
	setalpha 12, 8
	delay 38
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 0, 28, 0, 0, 5
	delay 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 4, 0, 6, 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, 131, -28, 28, 1, 1
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, 131, -15, 8, 1, 1
	playsewithpan SE_W233B, 63
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, 131, -5, -12, 1, 1
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, 131, 0, -32, 1, 1
	delay 1
	playsewithpan SE_W233B, 63
	createsprite gBasicHitSplatSpriteTemplate, 131, 5, -52, 1, 1
	createsprite gSlideMonToOffsetSpriteTemplate, 2, 1, -26, 16, 1, 4
	delay 4
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 0, 3, 6, 1
	delay 30
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 0, 0, 6
	delay 4
	createsprite gSlideMonToOriginalPosSpriteTemplate, 2, 1, 0, 6
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	end

Move_SECRET_POWER: @ 81D54E6
	createvisualtask sub_80E4008, 5
	jumpargeq 0, 0, Move_NEEDLE_ARM
	jumpargeq 0, 1, Move_MAGICAL_LEAF
	jumpargeq 0, 2, Move_MUD_SHOT
	jumpargeq 0, 3, Move_WATERFALL
	jumpargeq 0, 4, Move_SURF
	jumpargeq 0, 5, Move_BUBBLE_BEAM
	jumpargeq 0, 6, Move_ROCK_THROW
	jumpargeq 0, 7, Move_BITE
	jumpargeq 0, 8, Move_STRENGTH
	goto Move_SLAM

Move_TWISTER: @ 81D553A
	loadspritegfx 10063
	loadspritegfx 10135
	loadspritegfx 10058
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	playsewithpan SE_W239, 63
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 120, 70, 5, 70, 30
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 115, 55, 6, 60, 25
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 115, 60, 7, 60, 30
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 115, 55, 10, 60, 30
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DAE18, 130, 100, 50, 4, 50, 26
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 105, 25, 8, 60, 20
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 115, 40, 10, 48, 30
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DAE18, 130, 120, 30, 6, 45, 25
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 115, 35, 10, 60, 30
	delay 3
	createsprite gBattleAnimSpriteTemplate_83DAE18, 130, 105, 20, 8, 40, 0
	delay 3
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 20, 255, 15, 32, 0
	createsprite gBattleAnimSpriteTemplate_83D64B4, 130, 110, 10, 8, 32, 20
	waitforvisualfinish
	createsprite gBasicHitSplatSpriteTemplate, 131, -32, -16, 1, 3
	playsewithpan SE_W004, 63
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 3, 0, 12, 1
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_DEF_PARTNER, 3, 0, 12, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 3
	playsewithpan SE_W004, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83DB4F0, 131, 1, 3
	playsewithpan SE_W004, 63
	delay 4
	createsprite gBasicHitSplatSpriteTemplate, 131, 32, 20, 1, 3
	playsewithpan SE_W004, 63
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_MAGICAL_LEAF: @ 81D5699
	loadspritegfx 10063
	loadspritegfx 10160
	loadspritegfx 10135
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	delay 1
	loopsewithpan SE_W077, 192, 10, 5
	createvisualtask sub_80CC5F8, 5
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -3, -2, 10
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -1, -1, 15
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -4, -4, 7
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -3, 11
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -1, -6, 8
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, 2, -1, 12
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -3, -4, 13
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, 4, -5, 7
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, 2, -6, 11
	delay 2
	createsprite gBattleAnimSpriteTemplate_83D649C, 2, -3, -5, 8
	delay 60
	playsewithpan SE_W013B, 192
	createsprite gBattleAnimSpriteTemplate_83D64E4, 131, 20, -10, 20, 0, 32, 20, 0
	createsprite gBattleAnimSpriteTemplate_83D64E4, 131, 20, -10, 20, 0, 32, -20, 0
	delay 30
	playsewithpan SE_W013, 63
	createsprite gBasicHitSplatSpriteTemplate, 132, -10, -4, 1, 2
	createsprite gBasicHitSplatSpriteTemplate, 132, 10, 4, 1, 2
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	delay 20
	setarg 7, -1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

Move_ICE_BALL: @ 81D57BA
	loadspritegfx 10043
	loadspritegfx 10141
	createvisualtask sub_80D8FC0, 5, 0
	jumpargeq 0, 4, _81D5831
_81D57D1:
	playsewithpan SE_W196, 192
	createsprite gBattleAnimSpriteTemplate_83D9EF4, 130, 15, 0, -12, -16, 30, -40
	delay 28
	playsewithpan SE_W280, 63
	createvisualtask sub_80D8FC0, 5, 0
	jumpargeq 0, 0, _81D5842
	jumpargeq 0, 1, _81D5871
	jumpargeq 0, 2, _81D58AA
	jumpargeq 0, 3, _81D58ED
	jumpargeq 0, 4, _81D5935
_81D581F:
	createvisualtask sub_80D8FC0, 5, 0
	jumpargeq 0, 4, _81D5838
_81D5830:
	end
_81D5831:
	fadetobg 15
	goto _81D57D1
_81D5838:
	waitbgfadein
	delay 45
	restorebg
	waitbgfadein
	goto _81D5830
_81D5842:
	createvisualtask sub_80A9058, 2, 0, 1, 8, 1, 0
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	goto _81D581F
_81D5871:
	createvisualtask sub_80A9058, 2, 0, 1, 10, 1, 0
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	goto _81D581F
_81D58AA:
	createvisualtask sub_80A9058, 2, 0, 1, 14, 1, 0
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	goto _81D581F
_81D58ED:
	createvisualtask sub_80A9058, 2, 0, 1, 18, 1, 0
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	goto _81D581F
_81D5935:
	createvisualtask sub_80A9058, 2, 0, 1, 30, 1, 0
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	goto _81D581F
_81D597D:
	createsprite gBattleAnimSpriteTemplate_83D9F0C, 132, -12, -16
	return

Move_WEATHER_BALL: @ 81D5989
	loadspritegfx 10283
	createsprite gVerticalDipSpriteTemplate, 2, 8, 1, ANIM_BANK_ATTACKER
	delay 8
	playsewithpan SE_W207, 192
	createsprite gBattleAnimSpriteTemplate_83930A8, 2
	waitforvisualfinish
	delay 15
	playsewithpan SE_W197, 0
	createsprite gBattleAnimSpriteTemplate_83DB3DC, 2, 31, 5, 1, 32767, 10, 0, 0
	waitforvisualfinish
	createvisualtask sub_8132528, 2
	delay 1
	jumpargeq 7, 0, _81D59F4
	jumpargeq 7, 1, _81D5A31
	jumpargeq 7, 2, _81D5A95
	jumpargeq 7, 3, _81D5AF9
	jumpargeq 7, 4, _81D5B99
_81D59F4:
	loadspritegfx 10135
	createsprite gBattleAnimSpriteTemplate_83930C0, 130, -30, -100, 25, 1, 0, 0
	waitforvisualfinish
	playsewithpan SE_W025B, 63
	createsprite gBasicHitSplatSpriteTemplate, 132, -10, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 8, 1
	waitforvisualfinish
	end
_81D5A31:
	loadspritegfx 10029
	createsprite gBattleAnimSpriteTemplate_83D96AC, 130, -30, -100, 25, 1, 40, 10
	playsewithpan SE_W172, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D96AC, 130, -30, -100, 25, 1, -40, 20
	playsewithpan SE_W172, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D96AC, 130, -30, -100, 25, 1, 0, 0
	playsewithpan SE_W172, 63
	waitforvisualfinish
	playsewithpan SE_W172B, 63
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 8, 1
	waitforvisualfinish
	end
_81D5A95:
	loadspritegfx 10155
	createsprite gBattleAnimSpriteTemplate_83D9438, 130, -30, -100, 25, 1, 50, 10
	playsewithpan SE_W152, 63
	delay 8
	createsprite gBattleAnimSpriteTemplate_83D9438, 130, -30, -100, 25, 1, -20, 20
	playsewithpan SE_W152, 63
	delay 13
	createsprite gBattleAnimSpriteTemplate_83D9438, 130, -30, -100, 25, 1, 0, 0
	playsewithpan SE_W152, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 0, 3, 8, 1
	playsewithpan SE_W202, 63
	waitforvisualfinish
	end
_81D5AF9:
	loadspritegfx 10058
	createsprite gBattleAnimSpriteTemplate_83DAE30, 130, -30, -100, 25, 1, 30, 0
	playsewithpan SE_W088, 63
	delay 5
	createsprite gBattleAnimSpriteTemplate_83DAE30, 130, -30, -100, 25, 1, -40, 20
	playsewithpan SE_W088, 63
	delay 14
	createsprite gBattleAnimSpriteTemplate_83DAE30, 130, -30, -100, 25, 1, 0, 0
	playsewithpan SE_W088, 63
	waitforvisualfinish
	playsewithpan SE_W070, 63
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, -12, 27, 2, 3
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, 8, 28, 3, 4
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, -4, 30, 2, 3
	createsprite gBattleAnimSpriteTemplate_83DAE00, 130, 12, 25, 4, 4
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	waitforvisualfinish
	end
_81D5B99:
	loadspritegfx 10263
	loadspritegfx 10141
	createsprite gBattleAnimSpriteTemplate_83D9E54, 130, -30, -100, 25, 25, -40, 20
	playsewithpan SE_W258, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D9E54, 130, -30, -100, 25, 25, 40, 0
	playsewithpan SE_W258, 63
	delay 10
	createsprite gBattleAnimSpriteTemplate_83D9E54, 130, -30, -100, 25, 25, 0, 0
	playsewithpan SE_W258, 63
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	playsewithpan SE_W196, 63
	call Unknown_81D5C36
	waitforvisualfinish
	end

PoundCopy: @ 81D5C05
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

Unknown_81D5C36: @ 81D5C36
	createsprite gBattleAnimSpriteTemplate_83D9C78, 130, -10, -10, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, 10, 20, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C78, 130, -5, 10, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, 17, -12, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, -15, 15, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, 0, 0, 0
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C78, 130, 20, 2, 0
	playsewithpan SE_W196, 63
	return

Unknown_81D5CBA: @ 81D5CBA
	createsprite gBattleAnimSpriteTemplate_83D9C78, 130, -10, -10, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, 10, 20, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C78, 130, -29, 0, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, 29, -20, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C78, 130, -5, 10, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, 17, -12, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C78, 130, -20, 0, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, -15, 15, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, 26, -5, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C90, 130, 0, 0, 1
	playsewithpan SE_W196, 63
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9C78, 130, 20, 2, 1
	playsewithpan SE_W196, 63
	return

Unknown_81D5D8A: @ 81D5D8A
	loopsewithpan SE_W196, 63, 6, 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 0, 24, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 8, 24, 0
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -8, 24, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 16, 24, 0
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -16, 24, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 24, 24, 0
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -24, 24, 0
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 32, 24, 0
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -32, 24, 0
	return

Unknown_81D5E0E: @ 81D5E0E
	loopsewithpan SE_W196, 63, 6, 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 0, 24, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 8, 24, 1
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -8, 24, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 16, 24, 1
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -16, 24, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 24, 24, 1
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -24, 24, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 32, 24, 1
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -32, 24, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 40, 24, 1
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -40, 24, 1
	delay 4
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, 48, 24, 1
	createsprite gBattleAnimSpriteTemplate_83D9D14, 130, -48, 24, 1
	return

Unknown_81D5ECA: @ 81D5ECA
	createsprite gBattleAnimSpriteTemplate_83D6C88, 2, -15, 0, 0, 0, 32, 60
	delay 8
	createsprite gBattleAnimSpriteTemplate_83D6C88, 2, 12, -5, 0, 0, 32, 60
	delay 8
	return

Unknown_81D5EF5: @ 81D5EF5
	playsewithpan SE_W071B, 192
	createsprite gBattleAnimSpriteTemplate_83D7038, 2, 0, -5, 0, 0
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D7038, 2, -15, 10, 0, 0
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D7038, 2, -15, -15, 0, 0
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D7038, 2, 10, -5, 0, 0
	delay 7
	return

Unknown_81D5F3E: @ 81D5F3E
	playsewithpan SE_W071B, 63
	createsprite gBattleAnimSpriteTemplate_83D7038, 130, 0, -5, 1, 0
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D7038, 130, -15, 10, 1, 0
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D7038, 130, -15, -15, 1, 0
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D7038, 130, 10, -5, 1, 0
	delay 7
	return

PoisonBubblesAnim: @ 81D5F87
	createsprite gPoisonBubbleSpriteTemplate, 130, 10, 10, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, 130, 20, -20, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, 130, -20, 15, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, 130, 0, 0, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, 130, -20, -20, 0
	playsewithpan SE_W092, 63
	delay 6
	createsprite gPoisonBubbleSpriteTemplate, 130, 16, -8, 0
	playsewithpan SE_W092, 63
	return

WaterBubbleEffect: @ 81D5FF8
	createsprite gWaterBubbleSpriteTemplate, 2, 10, 10, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, 20, -20, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, -20, 15, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, 0, 0, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, -20, -20, 0
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, 16, -8, 0
	playsewithpan SE_W145C, 63
	return

WaterBubbleEffect2: @ 81D6069
	createsprite gWaterBubbleSpriteTemplate, 2, 10, 10, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, -28, -10, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, 20, -20, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, -20, 15, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, 0, 0, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, 27, 8, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, -20, -20, 1
	playsewithpan SE_W145C, 63
	delay 6
	createsprite gWaterBubbleSpriteTemplate, 2, 16, -8, 1
	playsewithpan SE_W145C, 63
	return

ElectricityEffect: @ 81D6100
	playsewithpan SE_W085B, 63
	createsprite gElectricitySpriteTemplate, 130, 5, 0, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, 130, -5, 10, 5, 1
	delay 2
	createsprite gElectricitySpriteTemplate, 130, 15, 20, 5, 2
	delay 2
	createsprite gElectricitySpriteTemplate, 130, -15, -10, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, 130, 25, 0, 5, 1
	delay 2
	createsprite gElectricitySpriteTemplate, 130, -8, 8, 5, 2
	delay 2
	createsprite gElectricitySpriteTemplate, 130, 2, -8, 5, 0
	delay 2
	createsprite gElectricitySpriteTemplate, 130, -20, 15, 5, 1
	return

ConfusionEffect: @ 81D618B
	loopsewithpan SE_W146, 63, 13, 6
	createsprite gConfusionDuckSpriteTemplate, 130, 0, -15, 0, 3, 90
	createsprite gConfusionDuckSpriteTemplate, 130, 0, -15, 51, 3, 90
	createsprite gConfusionDuckSpriteTemplate, 130, 0, -15, 102, 3, 90
	createsprite gConfusionDuckSpriteTemplate, 130, 0, -15, 153, 3, 90
	createsprite gConfusionDuckSpriteTemplate, 130, 0, -15, 204, 3, 90
	return

Unknown_81D61E7: @ 81D61E7
	fadetobg 3
	waitbgfadeout
	createvisualtask sub_812C560, 5
	waitbgfadein
	return

Unknown_81D61F3: @ 81D61F3
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	return

Unknown_81D61FB: @ 81D61FB
	jumpifcontest _81D6214
	fadetobg 18
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, -2304, 768, 1, -1
_81D6212:
	waitbgfadein
	return
_81D6214:
	fadetobg 19
	waitbgfadeout
	createvisualtask sub_80E3A58, 5, 2304, 768, 0, -1
	goto _81D6212

Unknown_81D622B: @ 81D622B
	restorebg
	waitbgfadeout
	setarg 7, -1
	waitbgfadein
	return

Unknown_81D6233: @ 81D6233
	createvisualtask sub_80E4200, 2
	jumpargeq 7, 1, Unknown_81D6258
	createvisualtask sub_812C924, 2
	jumpargeq 7, 0, Unknown_81D6266
	goto Unknown_81D625F

Unknown_81D6256: @ 81D6256
	waitbgfadein
	return

Unknown_81D6258: @ 81D6258
	fadetobg 26
	goto Unknown_81D6256

Unknown_81D625F: @ 81D625F
	fadetobg 25
	goto Unknown_81D6256

Unknown_81D6266: @ 81D6266
	fadetobg 24
	goto Unknown_81D6256

Unknown_81D626D: @ 81D626D
	restorebg
	waitbgfadein
	return

StatusCondition_Poison: @ 81D6270
	loopsewithpan SE_W092, 63, 13, 6
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 18, 2
	createvisualtask sub_80E1F8C, 2, 2, 2, 2, 0, 12, 31774
	end

StatusCondition_Confusion: @ 81D629B
	loadspritegfx 10073
	call ConfusionEffect
	end

StatusCondition_Burn: @ 81D62A4
	loadspritegfx 10029
	playsewithpan SE_W172, 63
	call _81D62BC
	call _81D62BC
	call _81D62BC
	waitforvisualfinish
	end
_81D62BC:
	createsprite gBattleAnimSpriteTemplate_83D9614, 130, -24, 24, 24, 24, 20, 1, 1
	delay 4
	return

StatusCondition_Love: @ 81D62D4
	loadspritegfx 10210
	playsewithpan SE_W204, 192
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, 0, 20
	delay 15
	playsewithpan SE_W204, 192
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, -20, 20
	delay 15
	playsewithpan SE_W204, 192
	createsprite gBattleAnimSpriteTemplate_83D7A80, 3, 20, 20
	end

StatusCondition_Sleep: @ 81D6309
	loadspritegfx 10228
	playsewithpan SE_W173, 192
	createsprite gBattleAnimSpriteTemplate_83D6D94, 2, 4, -10, 16, 0, 0
	delay 30
	createsprite gBattleAnimSpriteTemplate_83D6D94, 2, 4, -10, 16, 0, 0
	end

StatusCondition_Paralysis: @ 81D6335
	loadspritegfx 10011
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 10, 1
	call ElectricityEffect
	end

StatusCondition_Ice: @ 81D634F
	playsewithpan SE_W196, 0
	loadspritegfx 10010
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	waitplaysewithpan SE_W258, 63, 17
	createvisualtask sub_807B920, 2
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

StatusCondition_Curse: @ 81D636A
	loadspritegfx 10200
	monbg ANIM_BANK_DEF_PARTNER
	playsewithpan SE_W171, 63
	createsprite gBattleAnimSpriteTemplate_83DAF38, 130
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 14, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

StatusCondition_Nightmare: @ 81D638F
	loadspritegfx 10221
	monbg ANIM_BANK_DEF_PARTNER
	playsewithpan SE_W171, 63
	createsprite gBattleAnimSpriteTemplate_83DAF50, 130
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 14, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	end

General_CastformChange: @ 81D63B4
	createvisualtask c3_80DFBE4, 2
	jumpargeq 7, 1, _81D63E0
	goto _81D63C8
_81D63C8:
	monbg ANIM_BANK_ATTACKER
	playsewithpan SE_W100, 192
	waitplaysewithpan SE_W107, 192, 48
	createvisualtask sub_812D7E8, 2, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	end
_81D63E0:
	createvisualtask sub_812DB58, 2, 1
	end

General_StatsChange: @ 81D63EA
	createvisualtask sub_807BB88, 5
	waitforvisualfinish
	end

General_SubstituteFade: @ 81D63F3
	monbg ANIM_BANK_ATTACKER
	createvisualtask sub_81416C4, 5
	createvisualtask sub_80E2A38, 10, 2, 0, 0, 16, 32767
	waitforvisualfinish
	delay 1
	clearmonbg ANIM_BANK_ATTACKER
	delay 2
	blendoff
	createvisualtask sub_80E2A38, 10, 2, 0, 0, 0, 32767
	createvisualtask sub_814151C, 2, 1
	end

General_SubstituteAppear: @ 81D6430
	createvisualtask sub_81312E4, 2
	end

General_PokeblockThrow: @ 81D6438
	createvisualtask sub_8141D7C, 2
	createvisualtask sub_8141BD4, 2
	delay 0
	waitplaysewithpan SE_W026, 192, 22
	createsprite gBattleAnimSpriteTemplate_840B4FC, 131, -16, 7, 0, 32
	delay 50
	loopsewithpan SE_W039, 63, 19, 2
	createvisualtask AnimTask_SwayMon, 5, 1, 8, 1536, 2, 1
	waitforvisualfinish
	createvisualtask sub_8141C08, 2
	end

General_ItemKnockoff: @ 81D647E
	loadspritegfx 10224
	createsprite gBattleAnimSpriteTemplate_83D6734, 130
	end

General_TurnTrap: @ 81D6489
	createvisualtask sub_8141DAC, 5
	jumpargeq 0, 1, _81D64FD
	jumpargeq 0, 2, _81D6522
	jumpargeq 0, 3, _81D6576
	jumpargeq 0, 4, _81D65D3
	goto _81D64B5
_81D64B5:
	loadspritegfx 10186
	loopsewithpan SE_W010, 63, 6, 2
	createsprite gBattleAnimSpriteTemplate_83D65A0, 132, 0, 16, 0, 1
	delay 7
	createsprite gBattleAnimSpriteTemplate_83D65A0, 130, 0, 8, 1, 1
	delay 3
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_TARGET, 2, 0, 8, 1
	delay 20
	setarg 7, -1
	playsewithpan SE_W020, 63
	waitforvisualfinish
	end
_81D64FD:
	loadspritegfx 10029
	playsewithpan SE_W221B, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	call _81C90BF
	call _81C90BF
	waitforvisualfinish
	stopsound
	end
_81D6522:
	loadspritegfx 10149
	monbg ANIM_BANK_DEF_PARTNER
	monbgprio_28 1
	setalpha 12, 8
	delay 0
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 4, 2, 0, 7, rgb(0, 13, 23)
	playsewithpan SE_W250, 63
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	call _81D03E4
	call _81D03E4
	delay 12
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 4, 2, 7, 0, rgb(0, 13, 23)
	waitforvisualfinish
	stopsound
	clearmonbg ANIM_BANK_DEF_PARTNER
	end
_81D6576:
	loadspritegfx 10145
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W011, 63
	createsprite gBattleAnimSpriteTemplate_83DB1E8, 2, -32, 0, 2, 819, 0, 10
	createsprite gBattleAnimSpriteTemplate_83DB1E8, 2, 32, 0, 6, -819, 0, 10
	delay 10
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 5, 1, 3, 0, 5, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	waitforvisualfinish
	end
_81D65D3:
	loadspritegfx 10074
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 4, 2, 0, 7, rgb(19, 17, 0)
	createvisualtask AnimTask_ShakeMon, 5, 1, 0, 2, 30, 1
	playsewithpan SE_W328, 63
	call _81D361F
	call _81D361F
	delay 22
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 4, 2, 7, 0, rgb(19, 17, 0)
	waitforvisualfinish
	stopsound
	end

General_ItemEffect: @ 81D661C
	loadspritegfx 10203
	loadspritegfx 10049
	delay 0
	playsewithpan SE_W036, 192
	createvisualtask sub_80A8EFC, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_W036, 192
	createvisualtask sub_80A8EFC, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_W036, 192
	createvisualtask sub_80A8EFC, 2, 16, 128, 0, 2
	waitforvisualfinish
	playsewithpan SE_W234, 192
	call Unknown_81D5ECA
	waitforvisualfinish
	playsewithpan SE_REAPOKE, 192
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 2, 3, 7, 0, rgb(17, 31, 25)
	createsprite gBattleAnimSpriteTemplate_83D7928, 3, 0, 0, 0, 0
	waitforvisualfinish
	end

General_SmokeballEscape: @ 81D6690
	loadspritegfx 10242
	monbg ANIM_BANK_ATTACKER
	setalpha 12, 4
	delay 0
	playsewithpan SE_BOWA2, 63
	createsprite gBattleAnimSpriteTemplate_8402894, 128, 0, 32, 28, 30
	delay 4
	playsewithpan SE_BOWA2, 63
	createsprite gBattleAnimSpriteTemplate_8402894, 127, 2, 12, 20, 30
	delay 12
	playsewithpan SE_BOWA2, 63
	createsprite gBattleAnimSpriteTemplate_8402894, 126, 2, -28, 4, 30
	delay 4
	delay 8
	playsewithpan SE_BOWA2, 63
	createsprite gBattleAnimSpriteTemplate_8402894, 124, 2, 14, -20, 30
	delay 4
	playsewithpan SE_BOWA2, 63
	createvisualtask sub_80DFC24, 2, 2
	createsprite gBattleAnimSpriteTemplate_8402894, 123, 3, 4, 4, 30
	delay 14
	playsewithpan SE_BOWA2, 63
	createsprite gBattleAnimSpriteTemplate_8402894, 122, 3, -14, 18, 46
	delay 0
	createsprite gBattleAnimSpriteTemplate_8402894, 121, 3, 14, -14, 46
	delay 0
	createsprite gBattleAnimSpriteTemplate_8402894, 120, 3, -12, -10, 46
	delay 0
	createsprite gBattleAnimSpriteTemplate_8402894, 119, 3, 14, 14, 46
	delay 0
	createsprite gBattleAnimSpriteTemplate_8402894, 118, 3, 0, 0, 46
	waitforvisualfinish
	clearmonbg ANIM_BANK_ATTACKER
	invisible 0
	delay 0
	blendoff
	end

General_HangedOn: @ 81D676E
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 2, 7, 0, 9, rgb(31, 0, 0)
	playsewithpan SE_W082, 192
	createvisualtask sub_812FC68, 5, 30, 128, 0, 1, 2, 0, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 0, 2, 4, 9, 0, rgb(31, 0, 0)
	waitforvisualfinish
	delay 6
	createsprite gSlideMonToOriginalPosSpriteTemplate, 0, 0, 0, 15
	end

General_Rain: @ 81D67BB
	loadspritegfx 10115
	playsewithpan SE_W240, 192
	createvisualtask sub_80E2A38, 10, 1921, 2, 0, 4, 0
	waitforvisualfinish
	createvisualtask CreateAnimRaindrops, 2, 0, 3, 60
	createvisualtask CreateAnimRaindrops, 2, 0, 3, 60
	delay 50
	waitforvisualfinish
	createvisualtask sub_80E2A38, 10, 1921, 2, 4, 0, 0
	waitforvisualfinish
	end

General_Sun: @ 81D6804
	goto Move_SUNNY_DAY

General_Sandstorm: @ 81D6809
	goto Move_SANDSTORM

General_Hail: @ 81D680E
	goto Move_HAIL

General_LeechSeedDrain: @ 81D6813
	createvisualtask sub_8141E10, 5
	delay 0
	goto Move_ABSORB

General_MonHit: @ 81D6821
	loadspritegfx 10135
	monbg ANIM_BANK_TARGET
	setalpha 12, 8
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, 2, 0, 0, 1, 2
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 3, 0, 6, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_TARGET
	blendoff
	end

General_ItemSteal: @ 81D6852
	loadspritegfx 10224
	createvisualtask sub_80E42D0, 2
	createvisualtask sub_8141808, 2
	delay 1
	createsprite gBattleAnimSpriteTemplate_83D677C, 2, 0, -5, 10, 2, -1
	end

General_SnatchMove: @ 81D6877
	loadspritegfx 10224
	createvisualtask sub_80E4234, 2
	call Unknown_81D6AB6
	delay 1
	createvisualtask AnimTask_SwayMon, 2, 0, 5, 5120, 4, 1
	waitforvisualfinish
	createvisualtask sub_80E4264, 2
	jumpargeq 7, 0, _81D68B5
	goto _81D68C5
_81D68AE:
	waitforvisualfinish
	call Unknown_81D6AD6
	end
_81D68B5:
	playsewithpan SE_W104, 192
	createvisualtask sub_8131944, 2
	goto _81D68AE
_81D68C5:
	playsewithpan SE_W104, 192
	createvisualtask sub_8131FFC, 2
	goto _81D68AE

General_FutureSightHit: @ 81D68D5
	createvisualtask sub_80E42B0, 2
	monbg ANIM_BANK_DEF_PARTNER
	playsewithpan SE_W060, 192
	call Unknown_81D61E7
	setalpha 8, 8
	playsewithpan SE_W048, 63
	waitplaysewithpan SE_W048, 63, 8
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 4, 0, 15, 1
	createvisualtask AnimTask_ScaleMonAndRestore, 5, -5, -5, 15, ANIM_BANK_TARGET, 1
	waitforvisualfinish
	createvisualtask AnimTask_ShakeMon, 2, ANIM_BANK_TARGET, 4, 0, 24, 1
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	waitforvisualfinish
	delay 1
	call Unknown_81D61F3
	end

General_DoomDesireHit: @ 81D6934
	createvisualtask sub_80E42B0, 2
	loadspritegfx 10198
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 0, 16, rgb(31, 31, 31)
	waitforvisualfinish
	delay 10
	createvisualtask sub_812E14C, 5
	delay 9
	playsewithpan SE_W109, 192
	delay 9
	playsewithpan SE_W109, 0
	delay 9
	playsewithpan SE_W109, 63
	delay 25
	createvisualtask AnimTask_ShakeMonInPlace, 2, ANIM_BANK_TARGET, 10, 0, 20, 1
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 0, 0, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 24, -24, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -16, 16, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, -24, -12, 1, 1
	delay 6
	playsewithpan SE_W120, 63
	createsprite gBattleAnimSpriteTemplate_83D7828, 3, 16, 16, 1, 1
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 16, 0, rgb(31, 31, 31)
	waitforvisualfinish
	end

General_FocusPunchSetUp: @ 81D69F9
	loadspritegfx 10184
	playsewithpan SE_W082, 192
	call EndureFlamesAnim
	delay 8
	createvisualtask sub_80E1F8C, 2, 2, 2, 2, 0, 11, 31
	createvisualtask AnimTask_ShakeMon2, 2, ANIM_BANK_ATTACKER, 1, 0, 32, 1
	call EndureFlamesAnim
	delay 8
	call EndureFlamesAnim
	waitforvisualfinish
	end

General_IngrainHeal: @ 81D6A39
	loadspritegfx 10147
	loadspritegfx 10031
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 0, 4, rgb(13, 31, 12)
	waitforvisualfinish
	delay 3
	call _81CF496
	waitforvisualfinish
	delay 15
	call Unknown_81D5EF5
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 1, 4, 0, rgb(13, 31, 12)
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	end

General_WishHeal: @ 81D6A7C
	loadspritegfx 10031
	loadspritegfx 10049
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 0, 10, rgb(0, 0, 0)
	waitforvisualfinish
	playsewithpan SE_W025, 192
	call Unknown_81D5ECA
	waitforvisualfinish
	call Unknown_81D5EF5
	waitforvisualfinish
	createsprite gSimplePaletteBlendSpriteTemplate, 2, 1, 3, 10, 0, rgb(0, 0, 0)
	end

Unknown_81D6AB6: @ 81D6AB6
	createvisualtask sub_81417D8, 2
	jumpargeq 7, 1, _81D6AC7
_81D6AC5:
	waitforvisualfinish
	return
_81D6AC7:
	createvisualtask sub_814151C, 2, 1
	waitforvisualfinish
	goto _81D6AC5

Unknown_81D6AD6: @ 81D6AD6
	createvisualtask sub_81417D8, 2
	jumpargeq 7, 1, _81D6AE7
_81D6AE5:
	waitforvisualfinish
	return
_81D6AE7:
	createvisualtask sub_814151C, 2, 0
	waitforvisualfinish
	goto _81D6AE5

Special_LevelUp: @ 81D6AF6
	playsewithpan SE_EXPMAX, 0
	createvisualtask sub_813F4EC, 2
	delay 0
	createvisualtask sub_813F6A0, 5, 0, 0
	waitforvisualfinish
	createvisualtask sub_813F5E8, 2
	end

Special_SwitchOutPlayerMon: @ 81D6B17
	createvisualtask sub_813F844, 2
	delay 10
	createvisualtask sub_813F798, 2
	end

Special_SwitchOutOpponentMon: @ 81D6B28
	createvisualtask sub_813F844, 2
	delay 10
	createvisualtask sub_813F798, 2
	end

Special_BallThrow: @ 81D6B39
	createvisualtask sub_813F990, 2
	delay 0
	playsewithpan SE_NAGERU, 0
	createvisualtask sub_813FA94, 2
	createvisualtask sub_813F9E0, 2
	jumpargeq 7, -1, _81D6B65
_81D6B5C:
	waitforvisualfinish
	createvisualtask sub_813F9B8, 2
	end
_81D6B65:
	loadspritegfx 10135
	delay 25
	monbg ANIM_BANK_DEF_PARTNER
	setalpha 12, 8
	delay 0
	playsewithpan SE_W003, 63
	createsprite gBasicHitSplatSpriteTemplate, 130, -4, -20, 1, 2
	waitforvisualfinish
	clearmonbg ANIM_BANK_DEF_PARTNER
	blendoff
	goto _81D6B5C

Special_SafariBallThrow: @ 81D6B8D
	createvisualtask sub_813F990, 2
	delay 0
	createvisualtask sub_813FBB8, 2
	waitforvisualfinish
	createvisualtask sub_813F9B8, 2
	end

Special_SubstituteToMon: @ 81D6BA6
	createvisualtask sub_814151C, 2, 1
	end

Special_MonToSubstitute: @ 81D6BB0
	createvisualtask sub_814151C, 2, 0
	end
