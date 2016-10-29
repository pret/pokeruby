	.include "asm/macros.inc"
	.include "asm/macros/battle_anim.inc"
	.include "constants/constants.inc"

	.section script_data, "aw", %progbits

gUnknown_081C7160:: @ 81C7160
	.2byte 47
	.2byte 195
	.2byte 320
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
gBattleAnims_Unknown1:: @ 81C771C
	.4byte Unknown_81D63B4
	.4byte Unknown_81D63EA
	.4byte Unknown_81D63F3
	.4byte Unknown_81D6430
	.4byte Unknown_81D6438
	.4byte Unknown_81D647E
	.4byte Unknown_81D6489
	.4byte Unknown_81D661C
	.4byte Unknown_81D6690
	.4byte Unknown_81D676E
	.4byte Unknown_Weather_Rain
	.4byte Unknown_Weather_HarshSunlight
	.4byte Unknown_Weather_Sandstorm
	.4byte Unknown_Weather_Hail
	.4byte Unknown_81D6813
	.4byte Unknown_81D6821
	.4byte Unknown_81D6852
	.4byte Unknown_81D6877
	.4byte Unknown_81D68D5
	.4byte Unknown_81D6934
	.4byte Unknown_81D69F9
	.4byte Unknown_81D6A39
	.4byte Unknown_81D6A7C

	.align 2
gBattleAnims_Unknown2:: @ 81C7778
	.4byte Unknown_81D6AF6
	.4byte Unknown_81D6B17
	.4byte Unknown_81D6B28
	.4byte Unknown_81D6B39
	.4byte Unknown_81D6B8D
	.4byte Unknown_81D6BA6
	.4byte Unknown_81D6BB0

Move_POUND: @ 81C7794
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W003, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	wait
	clearmonbg 1
	blendoff
	end

Move_DOUBLE_SLAP: @ 81C77C5
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	ifelse _81C77F0, _81C7804
_81C77D6:
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W003, 63
	wait
	clearmonbg 1
	blendoff
	end
_81C77F0:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -8, 0, 1, 2
	jump _81C77D6
_81C7804:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 8, 0, 1, 2
	jump _81C77D6

Move_POISON_POWDER: @ 81C7818
	loadsprite 10065
	loadsprite 10150
	panse_1C SE_W077, 63, 10, 6
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, -30, -22, 117, 80, 5, 1
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, 10, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, -25, -22, 117, 112, 5, 3
	pause 15
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, -5, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, 5, -22, 117, 96, 5, 1
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, 0, -22, 117, 69, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, -15, -22, 117, 112, 5, 2
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, -15, -22, 117, 112, 5, 2
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, 15, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, -10, -22, 117, 96, 7, 2
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, -5, -22, 117, 90, -8, 0
	pause 20
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, -10, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, 0, -22, 117, 89, 5, 2
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, 20, -22, 117, 112, -8, 2
	sprite gBattleAnimSpriteTemplate_83D6254, 130, 6, 5, -22, 117, 80, 5, 1
	wait
	end

Move_STUN_SPORE: @ 81C7949
	loadsprite 10068
	panse_1C SE_W077, 63, 10, 6
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, -30, -22, 117, 80, 5, 1
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, 10, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, -25, -22, 117, 112, 5, 3
	pause 15
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, -5, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, 5, -22, 117, 96, 5, 1
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, 0, -22, 117, 69, -5, 1
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, -15, -22, 117, 112, 5, 2
	pause 30
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, -15, -22, 117, 112, 5, 2
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, 15, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, -10, -22, 117, 96, 7, 2
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, -5, -22, 117, 90, -8, 0
	pause 20
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, -10, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, 0, -22, 117, 89, 5, 2
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, 20, -22, 117, 112, -8, 2
	sprite gBattleAnimSpriteTemplate_83D623C, 130, 6, 5, -22, 117, 80, 5, 1
	wait
	end

Move_SLEEP_POWDER: @ 81C7A77
	loadsprite 10067
	panse_1C SE_W077, 63, 10, 6
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, -30, -22, 117, 80, 5, 1
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, 10, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, -25, -22, 117, 112, 5, 3
	pause 15
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, -5, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, 5, -22, 117, 96, 5, 1
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, 0, -22, 117, 69, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, -15, -22, 117, 112, 5, 2
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, -15, -22, 117, 112, 5, 2
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, 15, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, -10, -22, 117, 96, 7, 2
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, -5, -22, 117, 90, -8, 0
	pause 20
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, -10, -22, 117, 80, -5, 1
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, 0, -22, 117, 89, 5, 2
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, 20, -22, 117, 112, -8, 2
	sprite gBattleAnimSpriteTemplate_83D6224, 130, 6, 5, -22, 117, 80, 5, 1
	wait
	end

Move_SWIFT: @ 81C7BA5
	loadsprite 10174
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6510, 131, 7, 20, -10, 20, 0, 22, 20, 1
	pause 5
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6510, 131, 7, 20, -10, 20, 5, 22, -18, 1
	pause 5
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6510, 131, 7, 20, -10, 20, -10, 22, 15, 1
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 18, 1
	createtask sub_80A7FA0, 2, 5, 3, 2, 0, 18, 1
	pause 5
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6510, 131, 7, 20, -10, 20, 0, 22, -20, 1
	pause 5
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6510, 131, 7, 20, -10, 20, 0, 22, 12, 1
	pause 5
	wait
	clearmonbg 3
	blendoff
	end

Move_STRENGTH: @ 81C7C5E
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W036, 192
	createtask sub_80A8314, 5, 5, 0, 2, 0, 96, 30
	wait
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 4
	createtask sub_80A8500, 2, 5, 1, 18, 6, 2, 4
	pause 4
	panse_19 SE_W025B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 16, 12, 1, 1
	pause 4
	panse_19 SE_W025B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -16, -12, 1, 1
	pause 4
	panse_19 SE_W025B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 3, 4, 1, 1
	wait
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	wait
	clearmonbg 3
	blendoff
	end

Move_TACKLE: @ 81C7CF2
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 4
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W004, 63
	wait
	clearmonbg 1
	blendoff
	end

Move_BODY_SLAM: @ 81C7D30
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W036, 192
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 6, 1, 0
	wait
	pause 11
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 26, 0, 0, 5
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 4, 4, -10, 0, 1, 0
	panse_1C SE_W025B, 63, 10, 2
	pause 1
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -28, 0, 0, 3
	wait
	createtask sub_80A8154, 2, 5, 1, 4, 0, 12, 1
	wait
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 6
	pause 5
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 6
	wait
	clearmonbg 3
	blendoff
	end

Move_SUPERSONIC: @ 81C7DBD
	loadsprite 10163
	monbg 2
	monbgprio_2A 0
	setalpha 12, 8
	createtask sub_80A7FA0, 2, 5, 0, 2, 0, 8, 1
	call _81C7DFB
	call _81C7DFB
	call _81C7DFB
	call _81C7DFB
	call _81C7DFB
	call _81C7DFB
	wait
	clearmonbg 2
	blendoff
	end
_81C7DFB:
	panse_19 SE_W048, 192
	sprite gBattleAnimSpriteTemplate_83D7534, 130, 6, 16, 0, 0, 0, 30, 0
	pause 2
	ret

Move_SCREECH: @ 81C7E15
	loadsprite 10164
	createtask sub_80A7FA0, 2, 5, 0, 3, 0, 2, 1
	call _81C7E48
	call _81C7E48
	pause 16
	createtask sub_80A8B88, 5, 5, 0, 6, 2048, 2, 1
	wait
	end
_81C7E48:
	panse_19 SE_W103, 192
	sprite gBattleAnimSpriteTemplate_83D754C, 130, 6, 16, 0, 0, 0, 30, 0
	pause 2
	ret

Move_FLAME_WHEEL: @ 81C7E62
	loadsprite 10029
	monbg 3
	monbgprio_2A 1
	sprite gBattleAnimSpriteTemplate_83D9694, 3, 4, 0, 0, 56, 0
	panse_19 SE_W172, 192
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9694, 3, 4, 0, 0, 56, 4
	panse_19 SE_W172, 192
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9694, 3, 4, 0, 0, 56, 8
	panse_19 SE_W172, 192
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9694, 3, 4, 0, 0, 56, 12
	panse_19 SE_W172, 192
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9694, 3, 4, 0, 0, 56, 16
	panse_19 SE_W172, 192
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9694, 3, 4, 0, 0, 56, 20
	panse_19 SE_W172, 192
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9694, 3, 4, 0, 0, 56, 24
	panse_19 SE_W172, 192
	wait
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 24, 0, 0, 6
	pause 4
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 8, 1
	createtask sub_8079790, 3, 5, 1, 31, 12, 1, 1
	panse_19 SE_W172B, 63
	call _81D11A2
	pause 7
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 9
	wait
	clearmonbg 3
	end

Unknown_81C7F4C: @ 81C7F4C
	sprite gBattleAnimSpriteTemplate_83D9694, 3, 3, 0, 0, 50
	pause 4
	ret

Move_PIN_MISSILE: @ 81C7F5C
	loadsprite 10161
	loadsprite 10135
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	panse_19 SE_W026, 192
	sprite gBattleAnimSpriteTemplate_83DABA4, 2, 6, 20, -8, -8, -8, 20, -32
	pause 15
	sprite gBattleAnimSpriteTemplate_83DABA4, 2, 6, 20, -8, 8, 8, 20, -40
	pause 4
	panse_19 SE_W030, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -8, -8, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 2, 1
	pause 9
	sprite gBattleAnimSpriteTemplate_83DABA4, 2, 6, 20, -8, 0, 0, 20, -32
	pause 4
	panse_19 SE_W030, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 8, 8, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 2, 1
	pause 14
	panse_19 SE_W030, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 2, 1
	wait
	clearmonbg 1
	blendoff
	end

Move_ICICLE_SPEAR: @ 81C8021
	loadsprite 10262
	loadsprite 10135
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	panse_19 SE_W196, 192
	sprite gBattleAnimSpriteTemplate_83DABBC, 2, 6, 20, -8, -8, -8, 20, -32
	pause 15
	sprite gBattleAnimSpriteTemplate_83DABBC, 2, 6, 20, -8, 8, 8, 20, -40
	pause 4
	panse_19 SE_W030, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -8, -8, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 2, 1
	pause 9
	sprite gBattleAnimSpriteTemplate_83DABBC, 2, 6, 20, -8, 0, 0, 20, -32
	pause 4
	panse_19 SE_W030, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 8, 8, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 2, 1
	pause 14
	panse_19 SE_W030, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 2, 1
	wait
	clearmonbg 1
	blendoff
	end

Move_TAKE_DOWN: @ 81C80E6
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W036, 192
	createtask sub_80A8920, 5, 7, 0, -24, 8, 23, 10, 40, 10
	pause 35
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 0, 10, 0, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 4, 4, -10, 0, 1, 0
	panse_19 SE_W025B, 63
	pause 1
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -16, 0, 0, 4
	wait
	createtask sub_80A8154, 2, 5, 1, 4, 0, 12, 1
	wait
	pause 2
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 5
	pause 3
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 7
	wait
	clearmonbg 3
	blendoff
	end

Move_DOUBLE_EDGE: @ 81C817A
	loadsprite 10135
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 2, 4, 2, 32767, 10, 0, 0
	wait
	pause 10
	panse_19 SE_W207, 192
	panse_1D SE_W207, 192, 8
	createtask sub_80A8500, 2, 5, 0, 18, 6, 2, 4
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 0, 16, 16, 32767
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 20, 0, 0, 4
	pause 3
	wait
	panse_19 SE_W025B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 132, 4, -10, 0, 1, 0
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -32, 0, 0, 3
	wait
	createtask sub_80A8E04, 2, 4, 8, -256, 0, 0
	createtask sub_80A8E04, 2, 4, 8, -256, 1, 0
	createtask sub_80A8154, 2, 5, 0, 4, 0, 12, 1
	createtask sub_80A8154, 2, 5, 1, 4, 0, 12, 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 16, 0, 32767
	wait
	createtask sub_80A8E04, 2, 4, 8, -256, 0, 1
	createtask sub_80A8E04, 2, 4, 8, -256, 1, 1
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 5
	pause 3
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 7
	wait
	end

Move_POISON_STING: @ 81C828D
	loadsprite 10161
	loadsprite 10135
	loadsprite 10150
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	panse_19 SE_W013B, 192
	sprite gBattleAnimSpriteTemplate_83DAB8C, 130, 5, 20, 0, -8, 0, 20
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 5, 1
	panse_19 SE_W030, 63
	wait
	call Unknown_81D5F87
	wait
	clearmonbg 1
	blendoff
	end

Move_TWINEEDLE: @ 81C82E2
	loadsprite 10161
	loadsprite 10135
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	panse_1C SE_W013B, 192, 6, 2
	sprite gBattleAnimSpriteTemplate_83DAB8C, 130, 5, 10, -4, 0, -4, 20
	sprite gBattleAnimSpriteTemplate_83DAB8C, 130, 5, 20, 12, 10, 12, 20
	pause 20
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 5, 1
	sprite gBattleAnimSpriteTemplate_83DB4C0, 3, 4, 0, -4, 1, 3
	panse_1C SE_W030, 63, 5, 2
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB4C0, 3, 4, 10, 12, 1, 3
	wait
	clearmonbg 1
	blendoff
	end

Move_FIRE_BLAST: @ 81C8355
	loadsprite 10029
	createtask_1F sub_812AF30, 2, 144, 145
	call _81C83E9
	call _81C83E9
	call _81C83E9
	pause 24
	createtask sub_80E2A38, 10, 5, 1, 3, 0, 8, 0
	wait
	pause 19
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 20, 1
	call _81C842D
	pause 3
	call _81C842D
	pause 3
	call _81C842D
	pause 3
	call _81C842D
	pause 3
	call _81C842D
	pause 3
	call _81C842D
	pause 3
	call _81C842D
	pause 3
	call _81C842D
	pause 3
	call _81C842D
	wait
	createtask sub_80E2A38, 10, 5, 1, 2, 8, 0, 0
	wait
	end
_81C83E9:
	sprite gBattleAnimSpriteTemplate_83D962C, 130, 3, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D962C, 130, 3, 0, 0, 51
	sprite gBattleAnimSpriteTemplate_83D962C, 130, 3, 0, 0, 102
	sprite gBattleAnimSpriteTemplate_83D962C, 130, 3, 0, 0, 153
	sprite gBattleAnimSpriteTemplate_83D962C, 130, 3, 0, 0, 204
	pause 5
	ret
_81C842D:
	sprite gBattleAnimSpriteTemplate_83D967C, 130, 5, 0, 0, 10, 0, -2
	sprite gBattleAnimSpriteTemplate_83D967C, 130, 5, 0, 0, 13, -2, 0
	sprite gBattleAnimSpriteTemplate_83D967C, 130, 5, 0, 0, 13, 2, 0
	sprite gBattleAnimSpriteTemplate_83D967C, 130, 5, 0, 0, 15, -2, 2
	sprite gBattleAnimSpriteTemplate_83D967C, 130, 5, 0, 0, 15, 2, 2
	ret

Move_LEECH_SEED: @ 81C8483
	loadsprite 10006
	panse_19 SE_W077, 192
	sprite gBattleAnimSpriteTemplate_83D63C8, 130, 6, 15, 0, 0, 24, 35, -32
	pause 8
	panse_19 SE_W077, 192
	sprite gBattleAnimSpriteTemplate_83D63C8, 130, 6, 15, 0, -16, 24, 35, -40
	pause 8
	panse_19 SE_W077, 192
	sprite gBattleAnimSpriteTemplate_83D63C8, 130, 6, 15, 0, 16, 24, 35, -37
	pause 12
	panse_1C SE_W039, 63, 10, 8
	wait
	end

Move_EMBER: @ 81C84D9
	loadsprite 10029
	panse_1C SE_W052, 192, 5, 2
	sprite gBattleAnimSpriteTemplate_83D95E4, 130, 6, 20, 0, -16, 24, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D95E4, 130, 6, 20, 0, 0, 24, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D95E4, 130, 6, 20, 0, 16, 24, 20, 1
	pause 16
	panse_19 SE_W172, 63
	call _81C8535
	call _81C8535
	call _81C8535
	end
_81C8535:
	sprite gBattleAnimSpriteTemplate_83D95FC, 130, 7, -24, 24, 24, 24, 20, 1, 1
	pause 4
	ret

Move_MEGA_PUNCH: @ 81C854D
	loadsprite 10135
	loadsprite 10143
	monbg 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 0, 0, 16, 0
	setalpha 12, 8
	panse_19 SE_W025, 63
	sprite gBattleAnimSpriteTemplate_83DA058, 3, 4, 0, 0, 0, 50
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 7, 32767
	pause 50
	call _81C85E9
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 0
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 22, 1
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 0, 32767
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 0, 8, 0, 0
	panse_19 SE_W233B, 63
	wait
	clearmonbg 1
	blendoff
	pause 2
	restorebg
	waitbgfadein
	end
_81C85E9:
	pause 2
	createtask sub_80E4200, 2
	jumpvareq 7, 1, _81C8620
	createtask sub_812C924, 2
	jumpvareq 7, 0, _81C8612
	jumpvareq 7, 1, _81C8619
_81C8611:
	ret
_81C8612:
	changebg 4
	jump _81C8611
_81C8619:
	changebg 5
	jump _81C8611
_81C8620:
	changebg 6
	jump _81C8611

Move_MEGA_KICK: @ 81C8627
	loadsprite 10135
	loadsprite 10143
	monbg 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 0, 0, 16, 0
	setalpha 12, 8
	panse_19 SE_W025, 63
	sprite gBattleAnimSpriteTemplate_83DA058, 3, 4, 0, 0, 1, 50
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 7, 32767
	pause 50
	panse_19 SE_W025B, 63
	call _81C85E9
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 0
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 22, 1
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 0, 32767
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 0, 8, 0, 0
	wait
	clearmonbg 1
	blendoff
	pause 2
	restorebg
	waitbgfadein
	end

Move_COMET_PUNCH: @ 81C86C3
	loadsprite 10135
	loadsprite 10143
	monbg 1
	setalpha 12, 8
	ifelse _81C86F1, _81C8716
_81C86D7:
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W004, 63
	wait
	clearmonbg 1
	blendoff
	end
_81C86F1:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -8, -8, 1, 2
	sprite gBattleAnimSpriteTemplate_83D9FA8, 3, 5, -8, 0, 8, 1, 0
	jump _81C86D7
_81C8716:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 8, -8, 1, 2
	sprite gBattleAnimSpriteTemplate_83D9FA8, 3, 5, 8, 0, 8, 1, 0
	jump _81C86D7

Move_SONIC_BOOM: @ 81C873B
	loadsprite 10003
	loadsprite 10135
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	call _81C8772
	call _81C8772
	call _81C8772
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 10, 1
	call _81C878A
	wait
	clearmonbg 3
	blendoff
	end
_81C8772:
	panse_19 SE_W013B, 192
	sprite gBattleAnimSpriteTemplate_83D74A4, 130, 5, 16, 0, 0, 0, 15
	pause 4
	ret
_81C878A:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 2
	pause 4
	ret

Move_THUNDER_SHOCK: @ 81C879C
	loadsprite 10001
	loadsprite 10011
	createtask sub_80E2A38, 10, 5, 1, 0, 0, 6, 0
	wait
	pause 10
	createtask sub_80D681C, 5, 3, 0, -44, 0
	panse_19 SE_W085, 63
	pause 9
	createtask sub_80E2A38, 10, 5, 4, 0, 0, 13, 0
	wait
	createtask sub_80E2A38, 10, 5, 4, 0, 13, 0, 0
	wait
	pause 20
	call Unknown_81D6100
	wait
	pause 20
	createtask sub_80E2A38, 10, 5, 1, 0, 6, 0, 0
	wait
	end

Move_THUNDERBOLT: @ 81C880A
	loadsprite 10001
	loadsprite 10282
	loadsprite 10011
	createtask sub_80E2A38, 10, 5, 1, 0, 0, 6, 0
	wait
	pause 10
	createtask sub_80D681C, 5, 3, 24, -52, 0
	panse_19 SE_W085, 63
	pause 7
	createtask sub_80D681C, 5, 3, -24, -52, 0
	panse_19 SE_W085, 63
	pause 7
	createtask sub_80D681C, 5, 3, 0, -60, 1
	panse_19 SE_W085, 63
	pause 9
	createtask sub_80E2A38, 10, 5, 4, 0, 0, 13, 0
	wait
	createtask sub_80E2A38, 10, 5, 4, 0, 13, 0, 0
	wait
	pause 20
	sprite gBattleAnimSpriteTemplate_83D98F0, 131, 4, 44, 0, 0, 3
	sprite gBattleAnimSpriteTemplate_83D9908, 132, 8, 0, 0, 32, 44, 0, 40, 0, -32765
	sprite gBattleAnimSpriteTemplate_83D9908, 132, 8, 0, 0, 32, 44, 64, 40, 1, -32765
	sprite gBattleAnimSpriteTemplate_83D9908, 132, 8, 0, 0, 32, 44, 128, 40, 0, -32765
	sprite gBattleAnimSpriteTemplate_83D9908, 132, 8, 0, 0, 32, 44, 192, 40, 2, -32765
	sprite gBattleAnimSpriteTemplate_83D9908, 132, 8, 0, 0, 16, 44, 32, 40, 0, -32765
	sprite gBattleAnimSpriteTemplate_83D9908, 132, 8, 0, 0, 16, 44, 96, 40, 1, -32765
	sprite gBattleAnimSpriteTemplate_83D9908, 132, 8, 0, 0, 16, 44, 160, 40, 0, -32765
	sprite gBattleAnimSpriteTemplate_83D9908, 132, 8, 0, 0, 16, 44, 224, 40, 2, -32765
	panse_19 SE_W063, 63
	pause 0
	createtask sub_80E2A38, 10, 5, 1, 0, 2, 2, 0
	pause 6
	createtask sub_80E2A38, 10, 5, 1, 0, 6, 6, 0
	pause 6
	createtask sub_80E2A38, 10, 5, 1, 0, 2, 2, 0
	pause 6
	createtask sub_80E2A38, 10, 5, 1, 0, 6, 6, 0
	wait
	pause 20
	panse_1D SE_W085B, 63, 19
	call Unknown_81D6100
	wait
	pause 20
	createtask sub_80E2A38, 10, 5, 1, 0, 6, 0, 0
	wait
	end

Move_THUNDER_WAVE: @ 81C89C0
	loadsprite 10001
	loadsprite 10011
	loadsprite 10173
	createtask sub_80E2A38, 10, 5, 1, 0, 0, 6, 0
	wait
	pause 10
	createtask sub_80D681C, 5, 3, 0, -48, 0
	panse_19 SE_W086, 63
	pause 20
	panse_1C SE_W085B, 63, 10, 4
	sprite gBattleAnimSpriteTemplate_83D9950, 130, 2, -16, -16
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9950, 130, 2, -16, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9950, 130, 2, -16, 16
	wait
	createtask sub_80E2A38, 10, 5, 1, 0, 6, 0, 0
	wait
	end

Move_BEAT_UP: @ 81C8A2F
	loadsprite 10135
	loadsprite 10143
	monbg 1
	setalpha 12, 8
	ifelse _81C8A48, _81C8AB9
_81C8A43:
	wait
	clearmonbg 1
	blendoff
	end
_81C8A48:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, -20, -20, 1, 2
	sprite gBattleAnimSpriteTemplate_83D9FA8, 131, 5, -20, -12, 8, 1, 0
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W233B, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 8, 0, 1, 2
	sprite gBattleAnimSpriteTemplate_83D9FA8, 131, 5, 8, 8, 8, 1, 0
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W233B, 63
	jump _81C8A43
_81C8AB9:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 12, -20, 1, 2
	sprite gBattleAnimSpriteTemplate_83D9FA8, 131, 5, 12, -12, 8, 1, 0
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W233B, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, -12, 0, 1, 2
	sprite gBattleAnimSpriteTemplate_83D9FA8, 131, 5, -12, 8, 8, 1, 0
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W233B, 63
	jump _81C8A43

Move_STOMP: @ 81C8B2A
	loadsprite 10143
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W104, 63
	sprite gBattleAnimSpriteTemplate_83DA070, 3, 3, 0, -32, 15
	pause 19
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, -8, 1, 1
	createtask sub_80A7E7C, 2, 5, 1, 0, 4, 9, 1
	panse_19 SE_W025B, 63
	wait
	clearmonbg 1
	blendoff
	end

Move_TAIL_WHIP: @ 81C8B71
	panse_1C SE_W039, 192, 24, 3
	createtask sub_80A8500, 2, 5, 0, 12, 4, 2, 3
	wait
	end

Move_CUT: @ 81C8B8A
	loadsprite 10138
	monbg 1
	setalpha 12, 8
	panse_19 SE_W015, 63
	sprite gBattleAnimSpriteTemplate_83D6B28, 2, 3, 40, -32, 0
	pause 5
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 10, 1
	wait
	clearmonbg 1
	blendoff
	wait
	end

Move_HIDDEN_POWER: @ 81C8BBC
	loadsprite 10217
	panse_19 SE_W036, 192
	createtask sub_80A8D34, 5, 5, -7, -7, 11, 0, 0
	wait
	pause 30
	createtask sub_8079790, 5, 5, 0, 20479, 12, 5, 1
	pause 4
	createtask sub_80A8D34, 5, 5, -7, -7, 11, 0, 0
	panse_19 SE_W179, 192
	sprite gBattleAnimSpriteTemplate_83D7B14, 2, 2, 26, 0
	sprite gBattleAnimSpriteTemplate_83D7B14, 2, 2, 26, 42
	sprite gBattleAnimSpriteTemplate_83D7B14, 2, 2, 26, 84
	sprite gBattleAnimSpriteTemplate_83D7B14, 2, 2, 26, 126
	sprite gBattleAnimSpriteTemplate_83D7B14, 2, 2, 26, 168
	sprite gBattleAnimSpriteTemplate_83D7B14, 2, 2, 26, 210
	pause 52
	setvar 7, -1
	panse_19 SE_W115, 192
	createtask sub_80A8D34, 5, 5, -7, -7, 11, 0, 0
	sprite gBattleAnimSpriteTemplate_83D7B2C, 130, 1, 0
	sprite gBattleAnimSpriteTemplate_83D7B2C, 130, 1, 32
	sprite gBattleAnimSpriteTemplate_83D7B2C, 130, 1, 64
	sprite gBattleAnimSpriteTemplate_83D7B2C, 130, 1, 96
	sprite gBattleAnimSpriteTemplate_83D7B2C, 130, 1, 128
	sprite gBattleAnimSpriteTemplate_83D7B2C, 130, 1, 160
	sprite gBattleAnimSpriteTemplate_83D7B2C, 130, 1, 192
	sprite gBattleAnimSpriteTemplate_83D7B2C, 130, 1, 224
	end

Move_REVERSAL: @ 81C8CA5
	loadsprite 10236
	loadsprite 10143
	loadsprite 10135
	panse_19 SE_W197, 192
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 3, 32767, 8, 0, 0
	wait
	pause 30
	createtask sub_80E1F8C, 2, 6, 31, 3, 2, 0, 10, 32767
	pause 10
	panse_19 SE_W179, 192
	sprite gBattleAnimSpriteTemplate_8402738, 2, 2, 26, 0
	sprite gBattleAnimSpriteTemplate_8402738, 2, 2, 26, 42
	sprite gBattleAnimSpriteTemplate_8402738, 2, 2, 26, 84
	sprite gBattleAnimSpriteTemplate_8402738, 2, 2, 26, 126
	sprite gBattleAnimSpriteTemplate_8402738, 2, 2, 26, 168
	sprite gBattleAnimSpriteTemplate_8402738, 2, 2, 26, 210
	wait
	pause 20
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	pause 8
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 32767, 8, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9FA8, 132, 5, 0, 0, 10, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 1
	createtask sub_80A9058, 5, 5, 0, 1, 8, 1, 0
	end

Move_PURSUIT: @ 81C8D80
	loadsprite 10135
	monbg 1
	fadetobg 1
	waitbgfadein
	pause 0
	setalpha 12, 8
	ifelse _81C8D9F, _81C8DC8
_81C8D96:
	wait
	clearmonbg 1
	blendoff
	pause 0
	restorebg
	waitbgfadein
	end
_81C8D9F:
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 2
	createtask sub_80A9058, 5, 5, 0, 1, 6, 1, 0
	jump _81C8D96
_81C8DC8:
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 1
	createtask sub_80A9058, 5, 5, 0, 1, 6, 1, 0
	jump _81C8D96

Move_SPIKE_CANNON: @ 81C8DF1
	loadsprite 10161
	loadsprite 10135
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	createtask sub_80A8920, 5, 7, 0, -4, 0, 4, 6, 8, 4
	wait
	panse_1C SE_W013B, 192, 5, 3
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 5
	sprite gBattleAnimSpriteTemplate_83DAB8C, 2, 5, 10, -8, -8, -8, 20
	sprite gBattleAnimSpriteTemplate_83DAB8C, 2, 5, 18, 0, 0, 0, 20
	sprite gBattleAnimSpriteTemplate_83DAB8C, 2, 5, 26, 8, 8, 8, 20
	wait
	sprite gBattleAnimSpriteTemplate_83DB4C0, 3, 4, -8, -8, 1, 2
	sprite gBattleAnimSpriteTemplate_83DB4C0, 3, 4, 0, 0, 1, 2
	sprite gBattleAnimSpriteTemplate_83DB4C0, 3, 4, 8, 8, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 7, 1
	panse_1C SE_W030, 63, 5, 3
	wait
	clearmonbg 1
	blendoff
	end

Move_SWORDS_DANCE: @ 81C8EA4
	loadsprite 10005
	monbg 0
	setalpha 12, 8
	panse_19 SE_W014, 192
	createtask sub_80A8500, 2, 5, 0, 16, 6, 1, 4
	sprite gBattleAnimSpriteTemplate_83D748C, 2, 2, 0, 0
	pause 22
	createtask sub_80E21A8, 2, 7, 10005, 2, 2, 32754, 16, 0, 0
	wait
	clearmonbg 0
	blendoff
	pause 1
	end

Move_PSYCH_UP: @ 81C8EEA
	loadsprite 10196
	monbg 2
	createtask sub_80E1F8C, 2, 6, 25, 2, 6, 1, 11, 0
	setalpha 12, 8
	panse_1C SE_W060B, 192, 5, 10
	sprite gBattleAnimSpriteTemplate_83DA690, 2, 4, 0, 0, 0, 0
	createtask sub_80A8B88, 5, 5, 0, 5, 2560, 8, 0
	pause 127
	pause 4
	panse_19 SE_W060, 192
	createtask sub_80A8D34, 5, 5, -5, -5, 10, 0, 1
	createtask sub_80E2A38, 9, 5, 2, 2, 10, 0, 1023
	pause 30
	clearmonbg 2
	blendoff
	wait
	end

Move_DIZZY_PUNCH: @ 81C8F5C
	loadsprite 10073
	loadsprite 10143
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	call _81C9077
	sprite gBattleAnimSpriteTemplate_83D9FA8, 133, 5, 16, 8, 20, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 132, 4, 16, 0, 1, 1
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, 16, 8, 160, -32
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, 16, 8, -256, -40
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, 16, 8, 128, -16
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, 16, 8, 416, -38
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, 16, 8, -128, -22
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, 16, 8, -384, -31
	pause 10
	call _81C9077
	sprite gBattleAnimSpriteTemplate_83D9FA8, 133, 5, -16, -8, 20, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 132, 4, -16, -16, 1, 1
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, -16, -8, 160, -32
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, -16, -8, -256, -40
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, -16, -8, 128, -16
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, -16, -8, 416, -38
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, -16, -8, -128, -22
	sprite gBattleAnimSpriteTemplate_83DA088, 131, 4, -16, -8, -384, -31
	wait
	clearmonbg 1
	blendoff
	end
_81C9077:
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	pause 6
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 7, 1
	ret

Move_FIRE_SPIN: @ 81C9096
	loadsprite 10029
	panse_19 SE_W221B, 63
	createtask sub_80A7E7C, 5, 5, 1, 0, 2, 47, 1
	call _81C90BF
	call _81C90BF
	call _81C90BF
	wait
	end
_81C90BF:
	sprite gBattleAnimSpriteTemplate_83DACD0, 130, 7, 0, 28, 528, 30, 13, 50, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 130, 7, 0, 32, 480, 20, 16, -46, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 130, 7, 0, 33, 576, 20, 8, 42, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 130, 7, 0, 31, 400, 25, 11, -42, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 130, 7, 0, 28, 512, 25, 16, 46, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 130, 7, 0, 33, 464, 30, 15, -50, 1
	pause 2
	ret

Move_FURY_CUTTER: @ 81C914A
	loadsprite 10138
	monbg 1
	setalpha 12, 8
	panse_19 SE_W013, 63
	createtask sub_80D30AC, 2
	jumpvareq 7, 0, _81C91A7
	jump _81C91B9
_81C916A:
	createtask update_fury_cutter_counter_copy, 2
	jumpvareq 7, 1, _81C918E
	jumpvareq 7, 2, _81C91CB
	jumpvareq 7, 3, _81C91E5
	jump _81C91FF
_81C918E:
	pause 5
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 10, 1
	wait
	clearmonbg 1
	blendoff
	wait
	end
_81C91A7:
	sprite gBattleAnimSpriteTemplate_83D6B28, 2, 3, 40, -32, 0
	jump _81C916A
_81C91B9:
	sprite gBattleAnimSpriteTemplate_83D6B28, 2, 3, 40, -32, 1
	jump _81C916A
_81C91CB:
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 10505, 4, 0, 0
	jump _81C918E
_81C91E5:
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 3, 10505, 4, 0, 0
	jump _81C918E
_81C91FF:
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 3, 10505, 4, 0, 0
	jump _81C918E

Move_SELF_DESTRUCT: @ 81C9219
	loadsprite 10198
	createtask sub_80E2A38, 10, 5, 2, 1, 0, 9, 31
	createtask sub_80A7FA0, 5, 5, 4, 6, 0, 38, 1
	createtask sub_80A7FA0, 5, 5, 5, 6, 0, 38, 1
	createtask sub_80A7FA0, 5, 5, 6, 6, 0, 38, 1
	createtask sub_80A7FA0, 5, 5, 7, 6, 0, 38, 1
	createtask sub_80A7FA0, 5, 5, 8, 6, 0, 38, 1
	call _81C929F
	call _81C929F
	wait
	createtask sub_80E2A38, 10, 5, 2, 1, 9, 0, 31
	end
_81C929F:
	panse_19 SE_W120, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 0, 0, 0, 1
	pause 6
	panse_19 SE_W120, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 24, -24, 0, 1
	pause 6
	panse_19 SE_W120, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -16, 16, 0, 1
	pause 6
	panse_19 SE_W120, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -24, -12, 0, 1
	pause 6
	panse_19 SE_W120, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 16, 16, 0, 1
	pause 6
	ret

Move_SLAM: @ 81C9309
	loadsprite 10056
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W004, 192
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 20, 3, 0, 4
	pause 1
	sprite gBattleAnimSpriteTemplate_83D69DC, 2, 2, 0, 0
	pause 3
	panse_19 SE_W025B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -12, 10, 0, 3
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 5
	pause 3
	createtask sub_80A8154, 2, 5, 1, 0, 3, 6, 1
	wait
	pause 5
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 6
	wait
	clearmonbg 1
	blendoff
	end

Move_VINE_WHIP: @ 81C9391
	loadsprite 10287
	panse_19 SE_W026, 192
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 6
	pause 6
	panse_19 SE_W010, 63
	sprite gBattleAnimSpriteTemplate_83D69F4, 130, 2, 0, 0
	pause 6
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 6, 1
	end

Move_DRILL_PECK: @ 81C93C8
	loadsprite 10135
	loadsprite 10162
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 0
	panse_19 SE_W029, 192
	wait
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 1
	pause 2
	panse_1C SE_W030, 63, 4, 8
	createtask sub_80DB0E8, 5
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 18, 1
	wait
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 2
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 6
	wait
	end

Move_WATERFALL: @ 81C9421
	loadsprite 10148
	loadsprite 10155
	loadsprite 10141
	monbg 3
	setalpha 12, 8
	createtask sub_80A7E7C, 5, 5, 0, 0, 2, 23, 1
	pause 5
	panse_19 SE_W152, 192
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 10, 10, 25, 0
	pause 4
	panse_19 SE_W152, 192
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, -15, 0, 25, 0
	pause 4
	panse_19 SE_W152, 192
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 20, 10, 25, 0
	pause 4
	panse_19 SE_W152, 192
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 0, -10, 25, 0
	pause 4
	panse_19 SE_W152, 192
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, -10, 15, 25, 0
	pause 4
	panse_19 SE_W152, 192
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 25, 20, 25, 0
	pause 4
	panse_19 SE_W152, 192
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, -20, 20, 25, 0
	pause 4
	panse_19 SE_W152, 192
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 12, 0, 25, 0
	wait
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 5
	pause 6
	call _81C9502
	wait
	clearmonbg 3
	blendoff
	end
_81C9502:
	panse_19 SE_W127, 63
	createtask sub_80A7FA0, 5, 5, 1, 4, 0, 17, 1
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, 20, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 20
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, 15, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 15
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 15
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, 10, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 10
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 10
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, 5, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 5
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 5
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, -5, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, -5
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, -5
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, -10, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, -10
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, -10
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, -15, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, -15
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, -15
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4D8, 3, 4, 0, -20, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, -20
	sprite gBattleAnimSpriteTemplate_83D9360, 4, 2, 0, -20
	ret

Move_EXPLOSION: @ 81C9675
	loadsprite 10198
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 8, 9, 8474, 8, 0, 8
	createtask sub_80A7FA0, 5, 5, 4, 8, 0, 40, 1
	createtask sub_80A7FA0, 5, 5, 5, 8, 0, 40, 1
	createtask sub_80A7FA0, 5, 5, 6, 8, 0, 40, 1
	createtask sub_80A7FA0, 5, 5, 7, 8, 0, 40, 1
	createtask sub_80A7FA0, 5, 5, 8, 8, 0, 40, 1
	call _81C9712
	call _81C9712
	wait
	createtask sub_80E2A38, 10, 5, 1, 1, 16, 16, 32767
	pause 50
	createtask sub_80E2A38, 10, 5, 1, 3, 16, 0, 32767
	end
_81C9712:
	panse_19 SE_W153, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 0, 0, 0, 1
	pause 6
	panse_19 SE_W153, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 24, -24, 0, 1
	pause 6
	panse_19 SE_W153, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -16, 16, 0, 1
	pause 6
	panse_19 SE_W153, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -24, -12, 0, 1
	pause 6
	panse_19 SE_W153, 192
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 16, 16, 0, 1
	pause 6
	ret

Move_DEFENSE_CURL: @ 81C977C
	loadsprite 10234
	panse_1C SE_W161, 192, 18, 3
	createtask sub_80E0E24, 5, 2, 0, 0
	createtask sub_812D350, 5
	wait
	sprite gBattleAnimSpriteTemplate_8402498, 2, 4, 0, 6, 0, 1
	wait
	createtask sub_80E0E24, 5, 2, 0, 1
	wait
	end

Move_PROTECT: @ 81C97B5
	loadsprite 10280
	monbg 2
	monbgprio_28 0
	panse_1D SE_W115, 192, 16
	sprite gBattleAnimSpriteTemplate_83D6BE8, 2, 3, 24, 0, 90
	wait
	clearmonbg 2
	end

Move_DETECT: @ 81C97D2
	loadsprite 10071
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 9, 0
	wait
	createtask sub_80E2A38, 10, 5, 2, 1, 0, 9, 32767
	pause 18
	panse_19 SE_W197, 192
	sprite gBattleAnimSpriteTemplate_83930F4, 13, 2, 20, -20
	wait
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 9, 0, 0
	createtask sub_80E2A38, 10, 5, 2, 2, 9, 0, 32767
	wait
	end

Move_FRUSTRATION: @ 81C9830
	loadsprite 10135
	loadsprite 10087
	monbg 3
	setalpha 12, 8
	createtask sub_8079CEC, 1
	jumpvareq 7, 0, _81C9864
	jumpvareq 7, 1, _81C996A
	jumpvareq 7, 2, _81C9A37
	jump _81C9AB3
_81C985F:
	wait
	clearmonbg 3
	blendoff
	end
_81C9864:
	panse_19 SE_W082, 192
	createtask sub_80A7FA0, 5, 5, 0, 1, 0, 15, 1
	createtask sub_80E2A38, 10, 5, 2, 3, 0, 9, 31
	wait
	pause 20
	panse_19 SE_W207B, 192
	sprite gBattleAnimSpriteTemplate_83D7798, 2, 3, 0, 20, -28
	wait
	panse_19 SE_W207B, 192
	sprite gBattleAnimSpriteTemplate_83D7798, 2, 3, 0, 20, -28
	wait
	pause 10
	createtask sub_80A8B88, 5, 5, 0, 16, 6144, 8, 0
	pause 5
	createtask sub_80A7FA0, 5, 5, 1, 4, 0, 30, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 0
	panse_19 SE_W004, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 24, 8, 1, 0
	panse_19 SE_W004, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -24, -16, 1, 0
	panse_19 SE_W004, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 8, 4, 1, 0
	panse_19 SE_W004, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -16, 19, 1, 0
	panse_19 SE_W004, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 18, -18, 1, 0
	panse_19 SE_W004, 63
	wait
	createtask sub_80E2A38, 10, 5, 2, 3, 9, 0, 31
	jump _81C985F
_81C996A:
	panse_19 SE_W082, 192
	createtask sub_80A7FA0, 5, 5, 0, 1, 0, 15, 1
	createtask sub_80E2A38, 10, 5, 2, 3, 0, 9, 31
	wait
	pause 20
	panse_19 SE_W207B, 192
	sprite gBattleAnimSpriteTemplate_83D7798, 2, 3, 0, 20, -28
	wait
	pause 5
	createtask sub_812E498, 5
	pause 7
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 8, 1, 1
	createtask sub_80A7FA0, 5, 5, 1, 4, 0, 6, 1
	pause 14
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 12, -6, 1, 1
	createtask sub_80A7FA0, 5, 5, 1, 4, 0, 6, 1
	pause 14
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -12, -6, 1, 1
	createtask sub_80A7FA0, 5, 5, 1, 4, 0, 6, 1
	wait
	createtask sub_80E2A38, 10, 5, 2, 3, 9, 0, 31
	jump _81C985F
_81C9A37:
	panse_19 SE_W207B, 192
	sprite gBattleAnimSpriteTemplate_83D7798, 2, 3, 0, 20, -28
	wait
	pause 5
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 4
	pause 6
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 10, 4, 1, 1
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 6, 1
	wait
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 4
	pause 6
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -4, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 6, 1
	jump _81C985F
_81C9AB3:
	sprite gBattleAnimSpriteTemplate_8402630, 2, 2, 20, -28
	wait
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 10, 2
	pause 12
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 1, 0, 6, 1
	jump _81C985F

Move_SAFEGUARD: @ 81C9AF7
	loadsprite 10244
	monbg 2
	setalpha 8, 8
	panse_19 SE_W208, 192
	sprite gBattleAnimSpriteTemplate_83D7D74, 2
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7D74, 2
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7D74, 2
	wait
	panse_19 SE_REAPOKE, 192
	createtask sub_80E1F8C, 2, 6, 10, 0, 2, 0, 10, 32767
	wait
	clearmonbg 2
	blendoff
	end

Move_PAIN_SPLIT: @ 81C9B39
	loadsprite 10239
	sprite gBattleAnimSpriteTemplate_84026F0, 2, 3, -8, -42, 0
	sprite gBattleAnimSpriteTemplate_84026F0, 130, 3, -8, -42, 1
	pause 10
	panse_19 SE_W207B, 0
	createtask sub_812EB10, 2, 2, 0, 0
	createtask sub_812EB10, 2, 2, 1, 0
	wait
	sprite gBattleAnimSpriteTemplate_84026F0, 2, 3, -24, -42, 0
	sprite gBattleAnimSpriteTemplate_84026F0, 130, 3, -24, -42, 1
	pause 10
	panse_19 SE_W207B, 0
	createtask sub_812EB10, 2, 2, 0, 1
	createtask sub_812EB10, 2, 2, 1, 1
	wait
	sprite gBattleAnimSpriteTemplate_84026F0, 2, 3, 8, -42, 0
	sprite gBattleAnimSpriteTemplate_84026F0, 130, 3, 8, -42, 1
	pause 10
	panse_19 SE_W207B, 0
	createtask sub_812EB10, 2, 2, 0, 2
	createtask sub_812EB10, 2, 2, 1, 2
	end

Move_VICE_GRIP: @ 81C9BE1
	loadsprite 10138
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W011, 63
	sprite gBattleAnimSpriteTemplate_83D769C, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83D769C, 2, 1, 1
	pause 9
	sprite gBattleAnimSpriteTemplate_83DB4A8, 1, 4, 0, 0, 1, 2
	createtask sub_80A7FA0, 5, 5, 1, 2, 0, 5, 1
	wait
	clearmonbg 3
	blendoff
	end

Move_GUILLOTINE: @ 81C9C29
	loadsprite 10138
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	fadetobg_25 12, 13, 14
	waitbgfadein
	panse_19 SE_W011, 63
	sprite gBattleAnimSpriteTemplate_83D76DC, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83D76DC, 2, 1, 1
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 16, 0
	pause 9
	createtask sub_80A7FA0, 5, 5, 1, 2, 0, 23, 1
	pause 46
	createtask sub_80A7FA0, 5, 5, 1, 4, 0, 8, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 0, 8, 0, 0
	panse_19 SE_W013, 63
	wait
	clearmonbg 3
	blendoff
	restorebg
	waitbgfadein
	end

Move_PAY_DAY: @ 81C9CB5
	loadsprite 10100
	loadsprite 10135
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	panse_19 SE_W013B, 192
	sprite gBattleAnimSpriteTemplate_83D75E4, 2, 5, 20, 0, 0, 0, 1152
	wait
	panse_19 SE_W006, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 1, 4, 0, 0, 1, 2
	sprite gBattleAnimSpriteTemplate_83D75FC, 2
	createtask sub_80A7FA0, 2, 5, 1, 1, 0, 6, 1
	wait
	clearmonbg 1
	blendoff
	end

Move_OUTRAGE: @ 81C9D08
	loadsprite 10029
	panse_1C SE_W082, 192, 8, 3
	createtask sub_80E1F8C, 2, 6, 7, 2, 5, 3, 8, 430
	createtask sub_80A8500, 2, 5, 0, 12, 6, 5, 4
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 1280, 0, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, -1280, 0, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 0, 1280, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 0, -1280, 3
	pause 0
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 40, 1
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 1280, 768, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, -1280, 768, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 1280, -768, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, -1280, -768, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 1280, 0, 3
	call _81C9E0F
	call _81C9E0F
	wait
	end
_81C9E0F:
	pause 3
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, -1280, 0, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 0, 1280, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 0, -1280, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 1280, 768, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, -1280, 768, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, 1280, -768, 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DAFCC, 130, 6, 0, 0, 30, -1280, -768, 3
	ret

Move_SPARK: @ 81C9EA3
	loadsprite 10135
	loadsprite 10011
	pause 0
	createtask sub_80E1F8C, 2, 6, 3, -31, 1, 5, 5, 23551
	panse_19 SE_W085B, 192
	sprite gBattleAnimSpriteTemplate_83D985C, 0, 7, 32, 24, 190, 12, 0, 1, 0
	pause 0
	sprite gBattleAnimSpriteTemplate_83D985C, 0, 7, 80, 24, 22, 12, 0, 1, 0
	sprite gBattleAnimSpriteTemplate_83D985C, 0, 7, 156, 24, 121, 13, 0, 1, 1
	pause 0
	createtask sub_80E1F8C, 2, 6, 3, -31, 1, 0, 0, 23551
	pause 10
	createtask sub_80E1F8C, 2, 6, 3, -31, 1, 5, 5, 23551
	panse_19 SE_W085B, 192
	sprite gBattleAnimSpriteTemplate_83D985C, 0, 7, 100, 24, 60, 10, 0, 1, 0
	sprite gBattleAnimSpriteTemplate_83D985C, 0, 7, 170, 24, 42, 11, 0, 1, 1
	pause 0
	sprite gBattleAnimSpriteTemplate_83D985C, 0, 7, 238, 24, 165, 10, 0, 1, 1
	pause 0
	createtask sub_80E1F8C, 2, 6, 3, -31, 1, 0, 0, 23551
	pause 20
	createtask sub_80E1F8C, 2, 6, 3, -31, 1, 7, 7, 23551
	panse_19 SE_W085B, 192
	sprite gBattleAnimSpriteTemplate_83D9908, 4, 8, 0, 0, 32, 12, 0, 20, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9908, 4, 8, 0, 0, 32, 12, 64, 20, 1, 0
	sprite gBattleAnimSpriteTemplate_83D9908, 4, 8, 0, 0, 32, 12, 128, 20, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9908, 4, 8, 0, 0, 32, 12, 192, 20, 2, 0
	sprite gBattleAnimSpriteTemplate_83D9908, 4, 8, 0, 0, 16, 12, 32, 20, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9908, 4, 8, 0, 0, 16, 12, 96, 20, 1, 0
	sprite gBattleAnimSpriteTemplate_83D9908, 4, 8, 0, 0, 16, 12, 160, 20, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9908, 4, 8, 0, 0, 16, 12, 224, 20, 2, 0
	pause 4
	wait
	createtask sub_80E1F8C, 2, 6, 3, -31, 1, 0, 0, 23551
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 4
	pause 4
	panse_19 SE_W063, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	wait
	createtask sub_80E1F8C, 2, 6, 4, -31, 2, 0, 6, 23551
	call Unknown_81D6100
	wait
	end

Move_ATTRACT: @ 81CA0BA
	loadsprite 10216
	panse_1C SE_W204, 192, 12, 3
	createtask sub_80A8B88, 5, 5, 0, 12, 4096, 4, 0
	pause 15
	sprite gBattleAnimSpriteTemplate_83D7AB0, 131, 2, 20, -8
	wait
	panse_19 SE_W213, 63
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, 160, -32
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, -256, -40
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, 128, -16
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, 416, -38
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, -128, -22
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, -384, -31
	wait
	panse_1D SE_W213B, 0, 15
	createtask sub_80D2100, 5
	sprite gBattleAnimSpriteTemplate_83D7AE0, 40, 3, 16, 256, 0
	sprite gBattleAnimSpriteTemplate_83D7AE0, 40, 3, 224, 240, 15
	sprite gBattleAnimSpriteTemplate_83D7AE0, 40, 3, 126, 272, 30
	sprite gBattleAnimSpriteTemplate_83D7AE0, 40, 3, 80, 224, 45
	sprite gBattleAnimSpriteTemplate_83D7AE0, 40, 3, 170, 272, 60
	sprite gBattleAnimSpriteTemplate_83D7AE0, 40, 3, 40, 256, 75
	sprite gBattleAnimSpriteTemplate_83D7AE0, 40, 3, 112, 256, 90
	sprite gBattleAnimSpriteTemplate_83D7AE0, 40, 3, 200, 272, 90
	pause 75
	createtask sub_80E1F8C, 2, 6, 4, 4, 4, 0, 10, 28479
	end

Move_GROWTH: @ 81CA1B3
	call _81CA1C0
	wait
	call _81CA1C0
	wait
	end
_81CA1C0:
	createtask sub_80E1F8C, 2, 6, 2, 0, 2, 0, 8, 32767
	panse_19 SE_W036, 192
	createtask sub_80A8D34, 5, 5, -3, -3, 16, 0, 0
	ret

Move_WHIRLWIND: @ 81CA1E9
	loadsprite 10162
	sprite gBattleAnimSpriteTemplate_83DA51C, 2, 5, 0, -8, 1, 60, 0
	sprite gBattleAnimSpriteTemplate_83DA51C, 2, 5, 0, 0, 1, 60, 1
	sprite gBattleAnimSpriteTemplate_83DA51C, 2, 5, 0, 8, 1, 60, 2
	sprite gBattleAnimSpriteTemplate_83DA51C, 2, 5, 0, 16, 1, 60, 3
	sprite gBattleAnimSpriteTemplate_83DA51C, 2, 5, 0, 24, 1, 60, 4
	sprite gBattleAnimSpriteTemplate_83DA51C, 2, 5, 0, 32, 1, 60, 0
	pause 5
	panse_1C SE_W104, 63, 10, 4
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 15, 1
	pause 29
	createtask sub_80A8500, 2, 5, 1, 12, 6, 1, 5
	pause 7
	panse_19 SE_W081, 63
	createtask sub_80A8A80, 5, 2, 1, 8
	wait
	end

Move_CONFUSE_RAY: @ 81CA291
	loadsprite 10013
	monbg 3
	fadetobg 2
	waitbgfadein
	createtask sub_812B374, 2, 4, -64, 63, 2, 0
	createtask sub_80E2094, 2, 6, 10013, 0, 6, 0, 14, 351
	sprite gBattleAnimSpriteTemplate_83DAE64, 130, 3, 28, 0, 288
	wait
	setalpha 8, 8
	panse_19 SE_W081B, 63
	sprite gBattleAnimSpriteTemplate_83DAE7C, 130, 2, 0, -16
	wait
	pause 0
	blendoff
	clearmonbg 3
	restorebg
	waitbgfadein
	end

Move_LOCK_ON: @ 81CA2E4
	loadsprite 10014
	sprite gBattleAnimSpriteTemplate_83D6DAC, 40
	sprite gBattleAnimSpriteTemplate_83D6DC4, 40, 1, 1
	sprite gBattleAnimSpriteTemplate_83D6DC4, 40, 1, 2
	sprite gBattleAnimSpriteTemplate_83D6DC4, 40, 1, 3
	sprite gBattleAnimSpriteTemplate_83D6DC4, 40, 1, 4
	pause 120
	setvar 7, -1
	wait
	end

Move_MEAN_LOOK: @ 81CA31A
	loadsprite 10187
	monbg 3
	panse_19 SE_W060, 192
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 16, 0
	panse_1C SE_W109, 63, 15, 4
	panse_1D SE_W043, 63, 85
	sprite gBattleAnimSpriteTemplate_8402264, 2
	pause 120
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 16, 0, 0
	pause 30
	clearmonbg 3
	wait
	end

Move_ROCK_THROW: @ 81CA35F
	loadsprite 10058
	sprite gBattleAnimSpriteTemplate_83DB428, 130, 4, 6, 1, 15, 1
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 0, 1, 0, 0
	panse_19 SE_W088, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 19, 1, 10, 0
	panse_19 SE_W088, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, -23, 2, -10, 0
	panse_19 SE_W088, 63
	createtask sub_80A7E7C, 2, 5, 1, 0, 5, 20, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, -15, 1, -10, 0
	panse_19 SE_W088, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 23, 2, 10, 0
	panse_19 SE_W088, 63
	wait
	end

Move_ROCK_SLIDE: @ 81CA3EB
	loadsprite 10058
	monbg 3
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 4, 7, 1, 11, 1
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, -5, 1, -5, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 5, 0, 6, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 19, 1, 10, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, -23, 2, -10, 1
	panse_19 SE_W088, 63
	createtask sub_80A7E7C, 2, 5, 1, 0, 5, 50, 1
	createtask sub_80A7E7C, 2, 5, 3, 0, 5, 50, 1
	pause 2
	call _81CA483
	call _81CA483
	wait
	clearmonbg 3
	end
_81CA483:
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, -20, 0, -10, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 28, 1, 10, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, -10, 1, -5, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 10, 0, 6, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 24, 1, 10, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, -32, 2, -10, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, -20, 0, -10, 1
	panse_19 SE_W088, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC4C, 130, 4, 30, 2, 10, 1
	panse_19 SE_W088, 63
	pause 2
	ret

Move_THIEF: @ 81CA52C
	loadsprite 10135
	monbg 1
	pause 1
	fadetobg 1
	waitbgfadein
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	pause 6
	panse_19 SE_W233, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 1, 0, 8, 1
	wait
	pause 20
	clearmonbg 1
	blendoff
	restorebg
	waitbgfadein
	end

Move_BUBBLE_BEAM: @ 81CA573
	loadsprite 10146
	loadsprite 10155
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	pause 1
	call _81CA5AD
	createtask sub_80A8B88, 5, 5, 0, 3, 3072, 8, 1
	call _81CA5AD
	call _81CA5AD
	wait
	call Unknown_81D5FF8
	wait
	clearmonbg 1
	blendoff
	end
_81CA5AD:
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 35, 70, 0, 256, 50
	panse_19 SE_W145, 192
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 20, 40, -10, 256, 50
	panse_19 SE_W145, 192
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 10, -60, 0, 256, 50
	panse_19 SE_W145, 192
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 15, -15, 10, 256, 50
	panse_19 SE_W145, 192
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 30, 10, -10, 256, 50
	panse_19 SE_W145, 192
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 25, -30, 10, 256, 50
	panse_19 SE_W145, 192
	pause 3
	ret

Move_ICY_WIND: @ 81CA650
	loadsprite 10141
	loadsprite 10142
	monbg 3
	createtask sub_80E2A38, 10, 5, 11, 4, 0, 4, 0
	fadetobg 15
	waitbgfadeout
	panse_19 SE_W196, 0
	waitbgfadein
	wait
	panse_1B SE_W016, 192, 63, 2, 0
	call _81CA6A8
	pause 5
	call _81CA6A8
	panse_19 SE_W016B, 63
	pause 55
	call Unknown_81D5E0E
	wait
	clearmonbg 3
	restorebg
	waitbgfadeout
	createtask sub_80E2A38, 10, 5, 11, 4, 4, 0, 0
	waitbgfadein
	end
_81CA6A8:
	sprite gBattleAnimSpriteTemplate_83D9CA8, 168, 6, 0, 0, 0, 0, 72, 1
	pause 5
	sprite gBattleAnimSpriteTemplate_83D9CA8, 168, 6, 0, 10, 0, 10, 72, 1
	pause 5
	sprite gBattleAnimSpriteTemplate_83D9CA8, 168, 6, 0, -10, 0, -10, 72, 1
	pause 5
	sprite gBattleAnimSpriteTemplate_83D9CA8, 168, 6, 0, 15, 0, 15, 72, 1
	pause 5
	sprite gBattleAnimSpriteTemplate_83D9CA8, 168, 6, 0, -5, 0, -5, 72, 1
	ret

Move_SMOKESCREEN: @ 81CA710
	loadsprite 10016
	loadsprite 10017
	panse_19 SE_W104, 192
	sprite gBattleAnimSpriteTemplate_84021B0, 130, 6, 20, 0, 0, 0, 35, -25
	wait
	createtask sub_812C1D0, 2
	pause 2
	panse_19 SE_W028, 63
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, -12, 104, 0, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, -12, 72, 1, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, -6, 56, 1, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, -6, 88, 0, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, 0, 56, 0, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, 0, 88, 1, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, 6, 72, 0, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, 6, 104, 1, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, 12, 72, 0, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, 12, 56, 1, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, 18, 80, 0, 75
	sprite gBattleAnimSpriteTemplate_8402198, 132, 5, 0, 18, 72, 1, 75
	wait
	end

Move_CONVERSION: @ 81CA809
	loadsprite 10018
	monbg 2
	monbgprio_28 0
	setalpha 16, 0
	pause 0
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, -24, -24
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, -8, -24
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, 8, -24
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, 24, -24
	pause 3
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, -24, -8
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, -8, -8
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, 8, -8
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, 24, -8
	pause 3
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, -24, 8
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, -8, 8
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, 8, 8
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, 24, 8
	pause 3
	panse_19 SE_W129, 192
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, -24, 24
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, -8, 24
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, 8, 24
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6F80, 2, 2, 24, 24
	pause 20
	panse_19 SE_W112, 192
	createtask sub_80E21A8, 2, 7, 10018, 1, 1, 14335, 12, 0, 0
	pause 6
	createtask sub_80CE108, 5
	wait
	pause 1
	clearmonbg 2
	blendoff
	end

Move_CONVERSION_2: @ 81CA91E
	loadsprite 10018
	monbg 3
	monbgprio_2A 1
	setalpha 0, 16
	pause 0
	panse_19 SE_W112, 63
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, -24, -24, 60
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, -8, -24, 65
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, 8, -24, 70
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, 24, -24, 75
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, -24, -8, 80
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, -8, -8, 85
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, 8, -8, 90
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, 24, -8, 95
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, -24, 8, 100
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, -8, 8, 105
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, 8, 8, 110
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, 24, 8, 115
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, -24, 24, 120
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, -8, 24, 125
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, 8, 24, 130
	sprite gBattleAnimSpriteTemplate_83D6FB0, 2, 3, 24, 24, 135
	createtask sub_80CE210, 5
	pause 60
	panse_19 SE_W129, 63
	pause 10
	panse_19 SE_W129, 63
	pause 10
	panse_19 SE_W129, 63
	pause 10
	panse_19 SE_W129, 63
	pause 10
	panse_19 SE_W129, 63
	pause 10
	panse_19 SE_W129, 63
	pause 10
	panse_19 SE_W129, 63
	pause 10
	panse_19 SE_W129, 63
	wait
	clearmonbg 3
	blendoff
	end

Move_ROLLING_KICK: @ 81CAA3A
	loadsprite 10143
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	createtask sub_80A8500, 2, 5, 0, 18, 6, 1, 4
	panse_19 SE_W104, 192
	pause 6
	panse_19 SE_W104, 192
	wait
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 20, 0, 0, 4
	sprite gBattleAnimSpriteTemplate_83D9FF0, 2, 6, -24, 0, 48, 10, 160, 0
	pause 5
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -8, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 6, 1
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 1, 8
	clearmonbg 1
	blendoff
	end

Move_HEADBUTT: @ 81CAABD
	loadsprite 10135
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 0
	panse_19 SE_W029, 192
	wait
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 1
	wait
	createtask sub_80A8154, 2, 5, 0, 2, 0, 4, 1
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 6, 1
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 2
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 0, 0, 1, 1
	panse_19 SE_W233B, 63
	wait
	end

Move_HORN_ATTACK: @ 81CAB1A
	loadsprite 10135
	loadsprite 10020
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 0
	panse_19 SE_W029, 192
	wait
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 1
	sprite gBattleAnimSpriteTemplate_83D7050, 132, 3, 0, 0, 10
	wait
	createtask sub_80A8154, 2, 5, 0, 2, 0, 4, 1
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 6, 1
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 2
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 0, 0, 1, 1
	panse_19 SE_W030, 63
	wait
	end

Move_FURY_ATTACK: @ 81CAB87
	loadsprite 10135
	loadsprite 10020
	createtask sub_80A8E04, 2, 4, 4, 256, 0, 2
	ifelse _81CABB8, _81CABDE
_81CABA5:
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 6, 1
	wait
	end
_81CABB8:
	sprite gBattleAnimSpriteTemplate_83D7050, 132, 3, 8, 8, 10
	wait
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 0, 0, 1, 1
	panse_19 SE_W030, 63
	jump _81CABA5
_81CABDE:
	sprite gBattleAnimSpriteTemplate_83D7050, 132, 3, -8, -8, 10
	wait
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 0, 0, 1, 1
	panse_19 SE_W030, 63
	jump _81CABA5

Move_HORN_DRILL: @ 81CAC04
	loadsprite 10135
	loadsprite 10020
	jumpunkcond _81CAD6A
	fadetobg 7
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, -2304, 768, 1, -1
_81CAC21:
	waitbgfadein
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 0
	panse_19 SE_W029, 192
	wait
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 1
	sprite gBattleAnimSpriteTemplate_83D7050, 132, 3, 0, 0, 12
	wait
	playse SE_BAN
	createtask sub_80A8154, 2, 5, 0, 2, 0, 40, 1
	createtask sub_80A8154, 2, 5, 1, 10, 0, 40, 1
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 0, 0, 1, 3
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 0, 2, 1, 3
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, -4, 3, 1, 3
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, -8, -5, 1, 3
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 4, -12, 1, 3
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 16, 0, 1, 3
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 5, 18, 1, 3
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, -17, 12, 1, 2
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, -21, -15, 1, 2
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 8, -27, 1, 2
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 32, 0, 1, 2
	panse_19 SE_W030, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6DE4, 2, 1, 2
	wait
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	end
_81CAD6A:
	fadetobg 8
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, 2304, 768, 0, -1
	jump _81CAC21

Move_THRASH: @ 81CAD81
	loadsprite 10135
	loadsprite 10143
	createtask sub_80D0A4C, 2
	createtask sub_80D0AB8, 2
	sprite gBattleAnimSpriteTemplate_83D9FC0, 131, 3, 1, 10, 0
	createtask sub_80A8154, 2, 5, 1, 4, 0, 7, 1
	panse_19 SE_W004, 63
	pause 28
	sprite gBattleAnimSpriteTemplate_83D9FC0, 131, 3, 1, 10, 1
	createtask sub_80A8154, 2, 5, 1, 4, 0, 7, 1
	panse_19 SE_W233B, 63
	pause 28
	sprite gBattleAnimSpriteTemplate_83D9FC0, 131, 3, 1, 10, 3
	createtask sub_80A8154, 2, 5, 1, 8, 0, 16, 1
	panse_19 SE_W025B, 63
	end

Move_SING: @ 81CAE00
	loadsprite 10072
	monbg 3
	createtask sub_80CEA20, 2
	wait
	panse_1B SE_W047, 192, 63, 2, 0
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 7, 0, 12
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 6, 1, 12
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 1, 2, 12
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 2, 3, 12
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 3, 0, 12
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 2, 1, 12
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 5, 2, 12
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 6, 3, 12
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 2, 0, 12
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 2, 1, 12
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 1, 2, 12
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 5, 3, 12
	pause 4
	wait
	clearmonbg 3
	createtask sub_80CEAD8, 2
	wait
	end

Move_LOW_KICK: @ 81CAED4
	loadsprite 10143
	loadsprite 10135
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 20, 0, 0, 4
	sprite gBattleAnimSpriteTemplate_83D9FF0, 130, 6, -24, 28, 40, 8, 160, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, -8, 8, 1, 2
	createtask sub_80A8E04, 2, 4, 6, 384, 1, 2
	panse_19 SE_W233B, 63
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 1, 4
	end

Move_EARTHQUAKE: @ 81CAF31
	createtask sub_80E1864, 5, 3, 5, 10, 50
	createtask sub_80E1864, 5, 3, 4, 10, 50
	panse_19 SE_W089, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, 0, 14, 32767, 14
	pause 16
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, 0, 14, 32767, 14
	end

Move_FISSURE: @ 81CAF7E
	loadsprite 10074
	createtask sub_80E1864, 3, 3, 5, 10, 50
	createtask sub_80E1864, 3, 3, 1, 10, 50
	panse_19 SE_W089, 63
	pause 8
	call _81CAFFF
	pause 15
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, 0, 14, 32767, 14
	pause 15
	call _81CB050
	pause 15
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, 0, 14, 32767, 14
	pause 15
	call _81CAFFF
	pause 50
	fadetobg 21
	waitbgfadeout
	createtask sub_80E1BB0, 5, 3, 1, 5, -1
	waitbgfadein
	pause 40
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	end
_81CAFFF:
	sprite gBattleAnimSpriteTemplate_83DB34C, 130, 6, 1, 0, 12, -48, -16, 24
	sprite gBattleAnimSpriteTemplate_83DB34C, 130, 6, 1, 0, 16, -16, -10, 24
	sprite gBattleAnimSpriteTemplate_83DB34C, 130, 6, 1, 1, 14, -52, -18, 24
	sprite gBattleAnimSpriteTemplate_83DB34C, 130, 6, 1, 1, 12, -32, -16, 24
	panse_19 SE_W091, 63
	ret
_81CB050:
	sprite gBattleAnimSpriteTemplate_83DB34C, 130, 6, 1, 0, 12, -24, -16, 24
	sprite gBattleAnimSpriteTemplate_83DB34C, 130, 6, 1, 0, 16, -38, -10, 24
	sprite gBattleAnimSpriteTemplate_83DB34C, 130, 6, 1, 1, 14, -20, -18, 24
	sprite gBattleAnimSpriteTemplate_83DB34C, 130, 6, 1, 1, 12, -36, -16, 24
	panse_19 SE_W091, 63
	ret

Move_DIG: @ 81CB0A1
	ifelse _81CB0AB, _81CB106
_81CB0AA:
	end
_81CB0AB:
	loadsprite 10074
	loadsprite 10281
	sprite gBattleAnimSpriteTemplate_83DB364, 1, 3, 0, 0, 180
	sprite gBattleAnimSpriteTemplate_83DB364, 1, 3, 0, 1, 180
	monbg_22 0
	pause 1
	createtask sub_80E1244, 2, 1, 0
	pause 6
	call _81CB16A
	call _81CB16A
	call _81CB16A
	call _81CB16A
	call _81CB16A
	wait
	clearmonbg_23 0
	pause 1
	createtask sub_80E1244, 2, 1, 1
	jump _81CB0AA
_81CB106:
	loadsprite 10135
	loadsprite 10281
	createtask sub_80E149C, 2, 1, 0
	wait
	monbg 0
	sprite gBattleAnimSpriteTemplate_83DB364, 1, 3, 0, 0, 48
	sprite gBattleAnimSpriteTemplate_83DB364, 1, 3, 0, 1, 48
	pause 1
	createtask sub_80E149C, 2, 1, 1
	pause 16
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -8, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 6, 1
	panse_19 SE_W025B, 192
	clearmonbg 0
	jump _81CB0AA
_81CB16A:
	sprite gBattleAnimSpriteTemplate_83DB34C, 2, 6, 0, 0, 12, 4, -16, 18
	sprite gBattleAnimSpriteTemplate_83DB34C, 2, 6, 0, 0, 16, 4, -10, 18
	sprite gBattleAnimSpriteTemplate_83DB34C, 2, 6, 0, 1, 14, 4, -18, 18
	sprite gBattleAnimSpriteTemplate_83DB34C, 2, 6, 0, 1, 12, 4, -16, 18
	panse_19 SE_W091, 192
	pause 32
	ret

Move_MEDITATE: @ 81CB1BD
	call Unknown_81D61E7
	createtask sub_80DBC94, 2
	panse_19 SE_W029, 192
	pause 16
	panse_19 SE_W036, 192
	wait
	call Unknown_81D61F3
	end

Move_AGILITY: @ 81CB1DA
	monbg 2
	setalpha 12, 8
	createtask sub_80A8500, 2, 5, 0, 24, 6, 4, 4
	createtask sub_80E2DD8, 2, 4, 0, 4, 7, 10
	panse_19 SE_W104, 192
	pause 12
	panse_19 SE_W104, 192
	pause 12
	panse_19 SE_W104, 192
	pause 12
	panse_19 SE_W104, 192
	pause 12
	panse_19 SE_W104, 192
	pause 12
	wait
	clearmonbg 2
	blendoff
	pause 1
	end

Move_QUICK_ATTACK: @ 81CB224
	loadsprite 10135
	monbg 2
	setalpha 12, 8
	createtask sub_80A8500, 2, 5, 0, 24, 6, 1, 5
	createtask sub_80E2DD8, 2, 4, 0, 4, 7, 3
	panse_19 SE_W026, 192
	pause 4
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 6, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 132, 4, 0, 0, 1, 1
	panse_19 SE_W233B, 63
	wait
	clearmonbg 2
	blendoff
	wait
	end

Move_RAGE: @ 81CB27C
	loadsprite 10135
	loadsprite 10087
	monbg 1
	setalpha 12, 8
	createtask sub_8079790, 3, 5, 0, 31, 10, 0, 2
	sprite gBattleAnimSpriteTemplate_83D7798, 2, 3, 0, -20, -28
	panse_19 SE_W207B, 192
	pause 20
	sprite gBattleAnimSpriteTemplate_83D7798, 2, 3, 0, 20, -28
	panse_19 SE_W207B, 192
	wait
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 6
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A9058, 2, 5, 1, 1, 10, 1, 0
	panse_19 SE_W233B, 63
	wait
	clearmonbg 1
	end

Move_TELEPORT: @ 81CB2F2
	call Unknown_81D61E7
	createtask sub_80DBCFC, 2
	panse_19 SE_W100, 192
	pause 15
	call Unknown_81D61F3
	wait
	end

Move_DOUBLE_TEAM: @ 81CB30B
	monbg 2
	setalpha 12, 8
	createtask sub_80CE7E0, 2
	panse_19 SE_W104, 192
	pause 32
	panse_19 SE_W104, 192
	pause 24
	panse_19 SE_W104, 192
	pause 16
	panse_19 SE_W104, 192
	pause 8
	panse_19 SE_W104, 192
	pause 8
	panse_19 SE_W104, 192
	pause 8
	panse_19 SE_W104, 192
	pause 8
	panse_19 SE_W104, 192
	pause 8
	panse_19 SE_W104, 192
	wait
	clearmonbg 2
	blendoff
	pause 1
	end

Move_MINIMIZE: @ 81CB352
	setalpha 10, 8
	createtask sub_80D0488, 2
	panse_1C SE_W107, 192, 34, 3
	wait
	blendoff
	end

Move_METRONOME: @ 81CB365
	loadsprite 10064
	loadsprite 10209
	sprite gBattleAnimSpriteTemplate_83D7220, 11, 2, 0, 100
	panse_19 SE_W118, 192
	pause 6
	sprite gBattleAnimSpriteTemplate_83D72C8, 12, 1, 0
	pause 24
	panse_1C SE_W039, 192, 22, 3
	wait
	end

Move_SKULL_BASH: @ 81CB38F
	ifelse _81CB399, _81CB3E6
_81CB398:
	end
_81CB399:
	call _81CB3A9
	call _81CB3A9
	wait
	jump _81CB398
_81CB3A9:
	sprite gBattleAnimSpriteTemplate_83C2010, 2, 6, 0, -24, 0, 0, 10, 0
	panse_19 SE_W036, 192
	wait
	createtask sub_80A8E04, 2, 4, 16, 96, 0, 2
	wait
	sprite gBattleAnimSpriteTemplate_83C2010, 2, 6, 0, 24, 0, 0, 10, 1
	wait
	ret
_81CB3E6:
	loadsprite 10135
	createtask sub_80CDAC8, 2, 1, 0
	panse_19 SE_W036, 192
	wait
	playse SE_BAN
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, 0, 14, 32767, 14
	createtask sub_80A8154, 2, 5, 0, 2, 0, 40, 1
	createtask sub_80A8154, 2, 5, 1, 10, 0, 40, 1
	sprite gBattleAnimSpriteTemplate_83DB538, 132, 4, 0, 0, 1, 0
	panse_1C SE_W025B, 63, 8, 3
	wait
	createtask sub_80CDAC8, 2, 1, 1
	jump _81CB398

Move_AMNESIA: @ 81CB455
	loadsprite 10093
	call Unknown_81D61E7
	pause 8
	sprite gBattleAnimSpriteTemplate_83DA88C, 20
	panse_19 SE_W118, 192
	pause 54
	panse_1C SE_W118, 192, 16, 3
	wait
	call Unknown_81D61F3
	end

Move_KINESIS: @ 81CB479
	loadsprite 10075
	loadsprite 10097
	panse_19 SE_W060, 192
	call Unknown_81D61E7
	sprite gBattleAnimSpriteTemplate_83DA824, 20
	sprite gBattleAnimSpriteTemplate_83D7450, 19, 3, 32, -8, 0
	sprite gBattleAnimSpriteTemplate_83D7450, 19, 3, 32, 16, 1
	panse_1C SE_W109, 192, 21, 2
	pause 60
	panse_19 SE_W146, 192
	pause 30
	panse_1C SE_W146, 192, 20, 2
	pause 70
	panse_19 SE_W207B, 192
	wait
	call Unknown_81D61F3
	end

Move_GLARE: @ 81CB4CA
	loadsprite 10248
	loadsprite 10218
	createtask sub_81301EC, 5, 1, 0
	panse_19 SE_W060B, 192
	wait
	createtask sub_80E2A38, 5, 5, 1, 0, 0, 16, 0
	wait
	sprite gBattleAnimSpriteTemplate_83D7B94, 0, 2, -16, -8
	sprite gBattleAnimSpriteTemplate_83D7B94, 0, 2, 16, -8
	createtask sub_80D23B4, 5
	panse_19 SE_W043, 192
	pause 2
	createtask sub_80D60B4, 3, 3, 20, 1, 0
	wait
	createtask sub_80E2A38, 5, 5, 1, 0, 16, 0, 0
	end

Move_BARRAGE: @ 81CB533
	loadsprite 10254
	createtask sub_8130554, 3
	panse_19 SE_W207, 192
	pause 24
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 4, 8, 1, 40, 1
	createtask sub_80A7E7C, 3, 5, 1, 0, 4, 20, 1
	createtask sub_80A7E7C, 3, 5, 3, 0, 4, 20, 1
	panse_1C SE_W070, 63, 8, 2
	end

Move_SKY_ATTACK: @ 81CB57B
	ifelse _81CB585, _81CB68E
_81CB584:
	end
_81CB585:
	monbg 3
	setalpha 12, 11
	createtask sub_80E3BA4, 5, 1, 7
	jumpvareq 7, 0, _81CB5A0
	jump _81CB617
_81CB5A0:
	createtask sub_80E2A38, 10, 5, 27, 1, 0, 12, 0
	wait
	pause 12
	createtask sub_80E2A38, 10, 5, 2, 1, 8, 0, 0
	createtask sub_80E1864, 5, 3, 0, 2, 16
	panse_1C SE_W287, 192, 4, 8
	createtask sub_80E2A38, 10, 5, 2, 1, 0, 15, 32767
	pause 20
	createtask sub_80E2A38, 10, 5, 2, 1, 15, 0, 32767
	wait
	createtask sub_80E2A38, 10, 5, 25, 1, 8, 0, 0
	wait
	clearmonbg 3
	blendoff
	jump _81CB584
_81CB617:
	createtask sub_80E2A7C, 10, 5, 1, 1, 0, 12, 0
	wait
	pause 12
	createtask sub_80E2A38, 10, 5, 2, 1, 8, 0, 0
	createtask sub_80E1864, 5, 3, 0, 2, 16
	panse_19 SE_W287, 192
	pause 8
	createtask sub_80E2A38, 10, 5, 2, 1, 0, 15, 32767
	pause 20
	createtask sub_80E2A38, 10, 5, 2, 1, 15, 0, 32767
	wait
	createtask sub_80E2A7C, 10, 5, 4, 1, 8, 0, 0
	wait
	clearmonbg 3
	blendoff
	jump _81CB584
_81CB68E:
	loadsprite 10135
	loadsprite 10284
	call Unknown_81D61FB
	monbg 0
	createtask sub_80E2A38, 10, 5, 2, 0, 0, 16, 32767
	pause 4
	createtask sub_80DFC24, 5, 1, 0
	wait
	createtask sub_812B340, 5, 2, 238, -64
	sprite gBattleAnimSpriteTemplate_83DA65C, 130
	pause 14
	createtask sub_80A7FA0, 2, 5, 1, 10, 0, 18, 1
	createtask sub_812B30C, 5, 2, 141, 63
	pause 20
	createtask sub_80DFD24, 5, 1, 1
	pause 2
	createtask sub_80E2A38, 10, 5, 2, 0, 15, 0, 32767
	wait
	clearmonbg 0
	call Unknown_81D622B
	jump _81CB584

Move_FLASH: @ 81CB713
	panse_19 SE_W043, 192
	createtask sub_80E388C, 2
	wait
	end

Move_SPLASH: @ 81CB720
	createtask sub_80D074C, 2, 2, 0, 3
	pause 8
	panse_1C SE_W039, 192, 38, 3
	wait
	end

Move_ACID_ARMOR: @ 81CB735
	monbg 0
	setalpha 15, 0
	createtask sub_812F314, 2, 1, 0
	panse_19 SE_W151, 192
	wait
	blendoff
	clearmonbg 0
	pause 1
	end

Move_SHARPEN: @ 81CB74E
	loadsprite 10185
	sprite gBattleAnimSpriteTemplate_83D6EF0, 2
	wait
	end

Move_SUPER_FANG: @ 81CB75A
	loadsprite 10192
	createtask sub_80A8154, 2, 5, 0, 1, 0, 20, 1
	panse_19 SE_W082, 192
	wait
	createtask sub_80A8154, 2, 5, 0, 3, 0, 48, 1
	createtask sub_8079790, 2, 5, 0, 1247, 12, 4, 1
	wait
	pause 20
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 4
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7080, 130
	panse_19 SE_W044, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, 2143, 14, 32767, 14
	createtask sub_80A7E7C, 2, 5, 1, 0, 7, 12, 1
	wait
	blendoff
	end

Move_SLASH: @ 81CB7DB
	loadsprite 10183
	sprite gBattleAnimSpriteTemplate_83D6E38, 130, 3, 1, -8, 0
	panse_19 SE_W013, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6E38, 130, 3, 1, 8, 0
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 18, 1
	panse_19 SE_W013, 63
	wait
	end

Move_STRUGGLE: @ 81CB815
	loadsprite 10135
	loadsprite 10215
	monbg 1
	setalpha 12, 8
	createtask sub_80A8154, 2, 5, 0, 3, 0, 12, 4
	sprite gBattleAnimSpriteTemplate_83D7C90, 2, 3, 0, 0, 2
	sprite gBattleAnimSpriteTemplate_83D7C90, 2, 3, 0, 1, 2
	panse_1C SE_W029, 192, 12, 4
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 2
	createtask sub_80A8154, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W025B, 63
	wait
	clearmonbg 1
	blendoff
	end

Move_SKETCH: @ 81CB87B
	loadsprite 10002
	monbg 1
	createtask sub_80D0C88, 2
	sprite gBattleAnimSpriteTemplate_83D77E0, 130
	wait
	clearmonbg 1
	createtask sub_80D074C, 2, 2, 0, 2
	panse_1C SE_W039, 192, 38, 2
	end

Move_NIGHTMARE: @ 81CB8A3
	fadetobg 2
	waitbgfadein
	jumpunkcond _81CB8CF
	monbg 3
	createtask sub_80DE1B0, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 40, 1
	panse_19 SE_W171, 63
	wait
	clearmonbg 3
	restorebg
	waitbgfadein
	end
_81CB8CF:
	createtask sub_8079790, 2, 5, 0, 32767, 10, 2, 1
	createtask sub_80A7E7C, 2, 5, 0, 3, 0, 32, 1
	panse_19 SE_W171, 63
	wait
	restorebg
	waitbgfadein
	end

Move_FLAIL: @ 81CB8F9
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	createtask sub_812E860, 2, 1, 0
	panse_1C SE_W029, 192, 8, 2
	wait
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 3
	createtask sub_80A9058, 2, 5, 0, 1, 30, 1, 0
	panse_19 SE_W025B, 63
	wait
	clearmonbg 1
	blendoff
	end

Move_SPITE: @ 81CB936
	fadetobg 2
	panse_19 SE_W060, 192
	waitbgfadein
	monbg 3
	createtask sub_80E1F8C, 2, 6, 2, 2, 6, 0, 8, 32767
	createtask sub_80DE3AC, 2
	panse_1C SE_W060, 63, 20, 3
	wait
	restorebg
	waitbgfadein
	clearmonbg 1
	end

Move_MACH_PUNCH: @ 81CB965
	loadsprite 10135
	loadsprite 10143
	monbg 2
	createtask sub_80E3B4C, 2
	jumpvareq 7, 1, _81CB9E6
	fadetobg 9
_81CB97E:
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, -2304, 0, 1, -1
	waitbgfadein
	pause 0
	setalpha 9, 8
	createtask sub_807A69C, 2, 2, 28968, 10
	panse_19 SE_W026, 192
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 132, 5, 0, 0, 8, 1, 0
	panse_19 SE_W004, 63
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	wait
	clearmonbg 2
	blendoff
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	end
_81CB9E6:
	fadetobg 10
	jump _81CB97E

Move_FORESIGHT: @ 81CB9ED
	loadsprite 10258
	monbg 3
	monbgprio_28 1
	setalpha 16, 0
	sprite gBattleAnimSpriteTemplate_8402A24, 130, 1, 1
	pause 17
	panse_1C SE_W166, 63, 16, 4
	pause 48
	pause 24
	panse_19 SE_W166, 63
	pause 10
	createtask sub_8079790, 5, 5, 1, 32767, 12, 2, 1
	panse_19 SE_W197, 63
	wait
	blendoff
	clearmonbg 3
	end

Move_DESTINY_BOND: @ 81CBA2C
	loadsprite 10188
	fadetobg 2
	panse_19 SE_W060, 192
	waitbgfadein
	createtask sub_80DE918, 5, 2, 0, 48
	panse_19 SE_W109, 192
	pause 48
	createtask sub_80A8154, 2, 5, 0, 2, 0, 24, 1
	createtask sub_80E2A7C, 2, 5, 6, 1, 0, 12, 30653
	pause 24
	createtask sub_80E2A7C, 2, 5, 6, 1, 12, 0, 30653
	panse_19 SE_W171, 63
	wait
	restorebg
	waitbgfadein
	blendoff
	clearmonbg 5
	end

Move_ENDURE: @ 81CBA87
	loadsprite 10184
	panse_19 SE_W082, 192
	call _81CBAC7
	pause 8
	createtask sub_80E1F8C, 2, 6, 2, 2, 2, 0, 11, 31
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 32, 1
	call _81CBAC7
	pause 8
	call _81CBAC7
	wait
	end
_81CBAC7:
	sprite gBattleAnimSpriteTemplate_83D6E98, 2, 4, 0, -24, 26, 2
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6E98, 2, 4, 0, 14, 28, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6E98, 2, 4, 0, -5, 10, 2
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6E98, 2, 4, 0, 28, 26, 3
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6E98, 2, 4, 0, -12, 0, 1
	ret

Move_CHARM: @ 81CBB1B
	loadsprite 10210
	createtask sub_812E568, 5, 3, 0, 2, 0
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, 0, 20
	panse_19 SE_W204, 192
	pause 15
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, -20, 20
	panse_19 SE_W204, 192
	pause 15
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, 20, 20
	panse_19 SE_W204, 192
	wait
	end

Move_ROLLOUT: @ 81CBB5E
	loadsprite 10135
	loadsprite 10074
	loadsprite 10058
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createtask sub_80DD4D4, 2
	wait
	createtask sub_80A9058, 2, 5, 0, 1, 30, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 4, 4, 0, 0, 1, 2
	panse_19 SE_W025B, 63
	wait
	clearmonbg 3
	blendoff
	end

Move_FALSE_SWIPE: @ 81CBB9F
	loadsprite 10286
	loadsprite 10135
	sprite gBattleAnimSpriteTemplate_83D6E50, 130
	panse_19 SE_W233, 63
	pause 16
	sprite gBattleAnimSpriteTemplate_83D6E68, 130, 1, 0
	panse_19 SE_W104, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6E68, 130, 1, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6E68, 130, 1, 32
	panse_19 SE_W104, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6E68, 130, 1, 48
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6E68, 130, 1, 64
	panse_19 SE_W104, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6E68, 130, 1, 80
	pause 2
	wait
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 6, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 132, 4, 0, 0, 1, 3
	panse_19 SE_W004, 63
	end

Move_SWAGGER: @ 81CBC26
	loadsprite 10086
	loadsprite 10087
	createtask sub_80D08C8, 2
	panse_19 SE_W207, 192
	wait
	sprite gBattleAnimSpriteTemplate_83D7764, 2
	panse_1C SE_W207, 192, 4, 2
	wait
	pause 24
	sprite gBattleAnimSpriteTemplate_83D7798, 130, 3, 1, -20, -28
	panse_19 SE_W207B, 63
	pause 12
	sprite gBattleAnimSpriteTemplate_83D7798, 130, 3, 1, 20, -28
	panse_19 SE_W207B, 63
	wait
	end

Move_MILK_DRINK: @ 81CBC6E
	loadsprite 10099
	loadsprite 10203
	loadsprite 10031
	monbg 1
	sprite gBattleAnimSpriteTemplate_83D6C48, 2
	pause 40
	panse_19 SE_W152, 192
	pause 12
	panse_19 SE_W152, 192
	pause 20
	panse_19 SE_W152, 192
	wait
	sprite gBattleAnimSpriteTemplate_83D7928, 3, 4, 0, 0, 1, 0
	panse_19 SE_W208, 192
	wait
	clearmonbg 1
	call Unknown_81D5F3E
	wait
	end

Move_MAGNITUDE: @ 81CBCB0
	createtask sub_80E1B88, 2
	wait
	jumpvareq 15, 0, _81CBCC9
	jumpvareq 15, 1, _81CBCEE
_81CBCC8:
	end
_81CBCC9:
	createtask sub_80E1864, 5, 3, 5, 0, 50
	createtask sub_80E1864, 5, 3, 4, 0, 50
	panse_1C SE_W070, 63, 8, 10
	jump _81CBCC8
_81CBCEE:
	createtask sub_80E1864, 5, 3, 5, 0, 50
	createtask sub_80E1864, 5, 3, 4, 0, 50
	panse_1C SE_W070, 63, 8, 10
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, 0, 14, 32767, 14
	pause 16
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, 0, 14, 32767, 14
	jump _81CBCC8

Move_RAPID_SPIN: @ 81CBD41
	loadsprite 10135
	loadsprite 10229
	monbg 0
	sprite gBattleAnimSpriteTemplate_84023E8, 2, 6, 0, 0, 32, -32, 40, -2
	createtask sub_812CDC8, 2, 3, 0, 2, 0
	panse_1C SE_W013B, 192, 8, 4
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 0, 0, 1, 2
	createtask sub_80A9058, 2, 5, 0, 1, 10, 1, 0
	panse_19 SE_W003, 63
	wait
	pause 8
	createtask sub_812CDC8, 2, 3, 0, 2, 1
	panse_1C SE_W013B, 192, 8, 4
	wait
	clearmonbg 0
	end

Move_MOONLIGHT: @ 81CBDAE
	loadsprite 10194
	loadsprite 10195
	loadsprite 10031
	setalpha 0, 16
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 16, 0
	wait
	sprite gBattleAnimSpriteTemplate_83D6FC8, 2, 2, 120, 56
	createtask sub_8079670, 3, 5, 0, 16, 16, 0, 1
	panse_19 SE_W236, 0
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6FF8, 40, 2, -12, 0
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6FF8, 40, 2, -24, 0
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6FF8, 40, 2, 21, 0
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6FF8, 40, 2, 0, 0
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6FF8, 40, 2, 10, 0
	pause 20
	createtask sub_80CE3EC, 2
	wait
	call Unknown_81D5EF5
	wait
	end

Move_EXTREME_SPEED: @ 81CBE3E
	loadsprite 10207
	loadsprite 10135
	createtask sub_80E3B4C, 2
	jumpvareq 7, 1, _81CBEF5
	fadetobg 9
_81CBE55:
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, -2304, 0, 1, -1
	waitbgfadein
	createtask sub_80D15A4, 2
	panse_1C SE_W013B, 192, 8, 3
	wait
	pause 1
	createtask sub_80E4300, 2
	monbg 1
	setalpha 12, 8
	pause 18
	createtask sub_80D1638, 2
	pause 2
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB508, 130, 4, 1, 0, -12, 3
	pause 10
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB508, 130, 4, 1, 0, 12, 3
	pause 10
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB508, 130, 4, 1, 0, 0, 3
	wait
	createtask sub_80D18D4, 2
	pause 10
	createtask sub_80D17C4, 2
	panse_1C SE_W104, 192, 8, 4
	wait
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	clearmonbg 1
	blendoff
	pause 1
	setvar 7, 4096
	pause 1
	end
_81CBEF5:
	fadetobg 10
	jump _81CBE55

Move_UPROAR: @ 81CBEFC
	loadsprite 10225
	loadsprite 10203
	monbg 3
	createtask sub_80D2CF8, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83D79A4, 3, 6, 0, 0, 0, 0, 31, 8
	panse_19 SE_W253, 192
	sprite gBattleAnimSpriteTemplate_83D7CC8, 2, 4, 0, 29, -12, 0
	sprite gBattleAnimSpriteTemplate_83D7CC8, 2, 4, 0, -12, -29, 1
	pause 16
	createtask sub_80D2CF8, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83D79A4, 3, 6, 0, 0, 0, 0, 31, 8
	panse_19 SE_W253, 192
	sprite gBattleAnimSpriteTemplate_83D7CC8, 2, 4, 0, 12, -29, 1
	sprite gBattleAnimSpriteTemplate_83D7CC8, 2, 4, 0, -29, -12, 0
	pause 16
	createtask sub_80D2CF8, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83D79A4, 3, 6, 0, 0, 0, 0, 31, 8
	panse_19 SE_W253, 192
	sprite gBattleAnimSpriteTemplate_83D7CC8, 2, 4, 0, 24, -24, 1
	sprite gBattleAnimSpriteTemplate_83D7CC8, 2, 4, 0, -24, -24, 0
	wait
	clearmonbg 3
	end

Move_HEAT_WAVE: @ 81CBFC6
	loadsprite 10261
	createtask sub_80E2C60, 5, 5, 10261, 0, 6, 6, 31
	createtask do_boulder_dust, 5, 1, 1
	createtask sub_80D6080, 6, 2, 6, 31
	panse_1B SE_W257, 192, 63, 2, 0
	pause 4
	createtask sub_80D5DDC, 5
	pause 12
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 10, 2304, 96, 1
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 90, 2048, 96, 1
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 50, 2560, 96, 1
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 20, 2304, 96, 1
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 70, 1984, 96, 1
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 0, 2816, 96, 1
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 60, 2560, 96, 1
	end

Move_HAIL: @ 81CC076
	loadsprite 10263
	loadsprite 10141
	createtask sub_80E2A38, 10, 5, 1, 3, 0, 6, 0
	wait
	createtask sub_80D8ADC, 5
	panse_1C SE_W258, 0, 8, 10
	wait
	createtask sub_80E2A38, 10, 5, 1, 3, 6, 0, 0
	end

Move_TORMENT: @ 81CC0AE
	loadsprite 10087
	loadsprite 10209
	createtask sub_812D008, 2
	wait
	createtask sub_8079790, 2, 5, 1, 31, 10, 1, 1
	sprite gBattleAnimSpriteTemplate_83D7798, 130, 3, 1, -20, -28
	panse_19 SE_W207B, 63
	pause 20
	sprite gBattleAnimSpriteTemplate_83D7798, 130, 3, 1, 20, -28
	panse_19 SE_W207B, 63
	end

Move_MEMENTO: @ 81CC0F2
	setalpha 0, 16
	pause 1
	createtask sub_80E0918, 2
	pause 1
	createtask sub_80E00EC, 5
	panse_19 SE_W060, 192
	pause 48
	panse_19 SE_W060B, 192
	wait
	createtask sub_80E09C4, 2
	pause 12
	setalpha 0, 16
	pause 1
	monbg_22 1
	createtask sub_80E03BC, 5
	panse_19 SE_W060, 63
	wait
	clearmonbg_23 1
	pause 1
	blendoff
	pause 1
	end

Move_FACADE: @ 81CC136
	loadsprite 10243
	createtask sub_812FD7C, 2, 2, 0, 3
	createtask sub_812FFE4, 2, 2, 0, 72
	panse_1C SE_W207, 192, 24, 3
	end

Move_SMELLING_SALT: @ 81CC156
	loadsprite 10247
	loadsprite 10255
	sprite gBattleAnimSpriteTemplate_84029C4, 130, 3, 1, 0, 2
	sprite gBattleAnimSpriteTemplate_84029C4, 130, 3, 1, 1, 2
	pause 32
	createtask sub_8130918, 3, 2, 1, 2
	panse_1C SE_W003, 63, 12, 2
	wait
	pause 4
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 6, 2
	sprite gBattleAnimSpriteTemplate_84029F4, 130, 3, 1, 8, 3
	panse_1C SE_W207B, 63, 16, 3
	end

Move_FOLLOW_ME: @ 81CC1B1
	loadsprite 10064
	sprite gBattleAnimSpriteTemplate_83D72E0, 2, 1, 0
	panse_19 SE_W039, 192
	pause 18
	panse_19 SE_W213, 192
	pause 71
	panse_1C SE_W039, 192, 22, 3
	end

Move_CHARGE: @ 81CC1D0
	loadsprite 10211
	loadsprite 10212
	loadsprite 10213
	monbg 0
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 4, 0
	wait
	createtask sub_80D6B3C, 2, 4, 0, 60, 2, 12
	panse_19 SE_W268, 192
	pause 30
	panse_19 SE_W268, 192
	pause 30
	panse_19 SE_W268, 192
	sprite gBattleAnimSpriteTemplate_83D9A6C, 2, 1, 0
	pause 25
	panse_19 SE_W268, 192
	pause 20
	panse_19 SE_W268, 192
	pause 15
	panse_19 SE_W268, 192
	pause 10
	pause 6
	panse_1C SE_W268, 192, 6, 5
	wait
	sprite gBattleAnimSpriteTemplate_83D9A9C, 2, 3, 0, 16, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9A9C, 2, 3, 0, -16, -16
	panse_19 SE_W085B, 192
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 4, 4, 0, 0
	clearmonbg 0
	blendoff
	end

Move_TAUNT: @ 81CC26B
	loadsprite 10214
	loadsprite 10209
	loadsprite 10087
	sprite gBattleAnimSpriteTemplate_83D7220, 11, 2, 0, 45
	panse_19 SE_W118, 192
	pause 6
	sprite gBattleAnimSpriteTemplate_83D7358, 12, 1, 0
	pause 4
	panse_1C SE_W039, 192, 16, 2
	wait
	pause 8
	sprite gBattleAnimSpriteTemplate_83D7798, 130, 3, 1, -20, -28
	panse_19 SE_W207B, 63
	wait
	pause 12
	sprite gBattleAnimSpriteTemplate_83D7798, 130, 3, 1, 20, -28
	panse_19 SE_W207B, 63
	end

Move_HELPING_HAND: @ 81CC2BF
	loadsprite 10247
	createtask sub_8130D20, 5
	sprite gBattleAnimSpriteTemplate_8402A0C, 40, 1, 0
	sprite gBattleAnimSpriteTemplate_8402A0C, 40, 1, 1
	pause 19
	panse_19 SE_W227, 0
	createtask sub_80A7FA0, 2, 5, 2, 2, 0, 5, 1
	pause 14
	panse_19 SE_W227, 0
	createtask sub_80A7FA0, 2, 5, 2, 2, 0, 5, 1
	pause 20
	panse_19 SE_W227, 0
	createtask sub_80A7FA0, 2, 5, 2, 3, 0, 10, 1
	createtask sub_8079790, 2, 5, 2, 1023, 12, 1, 1
	end

Move_ASSIST: @ 81CC332
	loadsprite 10252
	sprite gBattleAnimSpriteTemplate_8402964, 50, 5, 112, -16, 140, 128, 36
	pause 2
	sprite gBattleAnimSpriteTemplate_8402964, 50, 5, 208, 128, -16, 48, 36
	panse_19 SE_W010, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_8402964, 50, 5, -16, 112, 256, -16, 36
	panse_19 SE_W010, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_8402964, 50, 5, 108, 128, 84, -16, 36
	panse_19 SE_W010, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_8402964, 50, 5, -16, 56, 256, 56, 36
	panse_19 SE_W010, 0
	end

Move_SUPERPOWER: @ 81CC3A3
	loadsprite 10212
	loadsprite 10256
	loadsprite 10257
	monbg 2
	monbgprio_28 0
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DA0FC, 130, 1, 0
	panse_19 SE_W025, 192
	pause 20
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 4, 4, 1, 180, 1
	createtask sub_812B340, 5, 2, 234, 0
	pause 40
	sprite gBattleAnimSpriteTemplate_83DA114, 41, 4, 200, 96, 1, 120
	pause 8
	sprite gBattleAnimSpriteTemplate_83DA114, 41, 4, 20, 248, 4, 112
	pause 8
	sprite gBattleAnimSpriteTemplate_83DA114, 41, 4, 130, 160, 2, 104
	pause 8
	sprite gBattleAnimSpriteTemplate_83DA114, 41, 4, 160, 192, 0, 96
	pause 8
	sprite gBattleAnimSpriteTemplate_83DA114, 41, 4, 60, 288, 3, 88
	pause 74
	sprite gBattleAnimSpriteTemplate_83DA12C, 131, 1, 0
	panse_19 SE_W207, 192
	pause 16
	createtask sub_80A7FA0, 2, 5, 1, 8, 0, 16, 1
	panse_19 SE_W025B, 63
	wait
	clearmonbg 2
	blendoff
	pause 1
	end

Move_RECYCLE: @ 81CC45E
	loadsprite 10278
	monbg 0
	setalpha 0, 16
	pause 1
	sprite gBattleAnimSpriteTemplate_8402B10, 2
	panse_1C SE_W036, 192, 24, 3
	wait
	createtask sub_8079790, 5, 5, 0, 32767, 12, 2, 1
	panse_19 SE_W036, 192
	wait
	blendoff
	clearmonbg 0
	pause 1
	end

Move_BRICK_BREAK: @ 81CC492
	loadsprite 10167
	loadsprite 10135
	loadsprite 10143
	loadsprite 10208
	ifelse _81CC4A7, _81CC576
_81CC4A7:
	monbg 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 3, 8
	pause 4
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -18, -18, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 2, 5, -18, -18, 10, 1, 0
	panse_19 SE_W233, 63
	pause 20
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 3, 8
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 18, 18, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 2, 5, 18, 18, 10, 1, 0
	panse_19 SE_W233, 63
	pause 20
	createtask sub_80A8920, 2, 7, 0, -24, 0, 24, 10, 24, 3
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 6, 0
	pause 37
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 2, 5, 0, 0, 10, 1, 0
	panse_19 SE_W233B, 63
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 6, 0, 0
	wait
	clearmonbg 1
	end
_81CC576:
	monbg 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 3, 8
	pause 4
	sprite gBattleAnimSpriteTemplate_83DA0A0, 3, 5, 1, 0, 0, 90, 10
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -18, -18, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 2, 5, -18, -18, 10, 1, 0
	panse_19 SE_W233, 63
	pause 20
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 3, 8
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 18, 18, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 2, 5, 18, 18, 10, 1, 0
	panse_19 SE_W233, 63
	pause 20
	createtask sub_80A8920, 2, 7, 0, -24, 0, 24, 10, 24, 3
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 6, 0
	pause 37
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 2, 5, 0, 0, 10, 1, 0
	panse_19 SE_W233B, 63
	wait
	sprite gBattleAnimSpriteTemplate_83DA0B8, 2, 4, 1, 0, -8, -12
	sprite gBattleAnimSpriteTemplate_83DA0B8, 2, 4, 1, 1, 8, -12
	sprite gBattleAnimSpriteTemplate_83DA0B8, 2, 4, 1, 2, -8, 12
	sprite gBattleAnimSpriteTemplate_83DA0B8, 2, 4, 1, 3, 8, 12
	panse_19 SE_W280, 63
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 6, 0, 0
	wait
	clearmonbg 1
	end

Move_YAWN: @ 81CC697
	loadsprite 10242
	createtask sub_812F724, 2, 1, 0
	panse_19 SE_W281, 192
	wait
	sprite gBattleAnimSpriteTemplate_84027EC, 133, 1, 2
	panse_19 SE_W255, 192
	pause 4
	sprite gBattleAnimSpriteTemplate_84027EC, 133, 1, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_84027EC, 133, 1, 0
	wait
	createtask sub_812F724, 2, 1, 1
	panse_19 SE_W281, 63
	end

Move_ENDEAVOR: @ 81CC6DA
	loadsprite 10243
	loadsprite 10135
	createtask sub_812FD7C, 2, 2, 0, 2
	panse_1C SE_W039, 192, 24, 2
	createtask sub_8079790, 5, 5, 0, 703, 12, 1, 2
	pause 6
	createtask sub_80A9058, 5, 5, 0, 1, 8, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 12, -12, 1, 2
	panse_19 SE_W003, 63
	pause 24
	createtask sub_80A9058, 5, 5, 0, 1, 8, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, -12, 12, 1, 2
	panse_19 SE_W004, 63
	end

Move_ERUPTION: @ 81CC74F
	loadsprite 10201
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 31, 2, 0, 4, 31
	wait
	createtask sub_80D5470, 2
	panse_1D SE_W153, 192, 60
	wait
	createtask sub_80D5470, 2
	panse_1D SE_W153, 192, 60
	wait
	pause 30
	sprite gBattleAnimSpriteTemplate_83D96F8, 40, 5, 200, -32, 0, 100, 0
	sprite gBattleAnimSpriteTemplate_83D96F8, 40, 5, 30, -32, 16, 90, 1
	sprite gBattleAnimSpriteTemplate_83D96F8, 40, 5, 150, -32, 32, 60, 2
	sprite gBattleAnimSpriteTemplate_83D96F8, 40, 5, 90, -32, 48, 80, 3
	sprite gBattleAnimSpriteTemplate_83D96F8, 40, 5, 110, -32, 64, 50, 0
	sprite gBattleAnimSpriteTemplate_83D96F8, 40, 5, 60, -32, 80, 70, 1
	pause 22
	createtask sub_80E1864, 5, 3, 5, 8, 60
	createtask sub_80E1864, 5, 3, 4, 8, 60
	panse_1C SE_W088, 63, 16, 12
	pause 80
	sprite gBattleAnimSpriteTemplate_83DB3C4, 40, 5, 31, 4, 4, 0, 31
	end

Move_SKILL_SWAP: @ 81CC81C
	loadsprite 10251
	call Unknown_81D61E7
	createtask sub_80DC0B0, 3, 1, 1
	createtask sub_8079790, 5, 5, 1, 32767, 12, 3, 1
	panse_1C SE_W179, 192, 24, 3
	pause 16
	createtask sub_80DC0B0, 3, 1, 0
	createtask sub_8079790, 5, 5, 0, 32767, 12, 3, 1
	wait
	call Unknown_81D61F3
	end

Move_IMPRISON: @ 81CC867
	loadsprite 10249
	loadsprite 10250
	call Unknown_81D61E7
	monbg 3
	createtask sub_80DBE00, 5
	pause 8
	panse_1C SE_W030, 192, 8, 5
	wait
	pause 4
	sprite gBattleAnimSpriteTemplate_83DA8F4, 5, 2, 0, 40
	createtask sub_80E1864, 5, 3, 4, 1, 10
	panse_19 SE_W063, 192
	clearmonbg 3
	call Unknown_81D61F3
	end

Move_GRUDGE: @ 81CC8AA
	loadsprite 10253
	monbg 0
	monbgprio_29
	fadetobg 2
	panse_19 SE_W060, 192
	waitbgfadein
	createtask sub_80DF1A4, 3
	panse_1C SE_W052, 192, 16, 4
	pause 10
	pause 80
	panse_19 SE_W171, 63
	wait
	restorebg
	waitbgfadein
	clearmonbg 0
	end

Move_CAMOUFLAGE: @ 81CC8D2
	monbg 2
	monbgprio_28 0
	setalpha 16, 0
	createtask sub_80E2B74, 5, 4, 2, 3, 0, 14
	pause 16
	createtask sub_80DFC24, 2, 1, 4
	panse_19 SE_W185, 192
	wait
	pause 8
	createtask sub_80E2B74, 5, 4, 2, 0, 0, 0
	wait
	createtask sub_80DFD24, 2, 1, 1
	wait
	blendoff
	clearmonbg 2
	end

Move_TAIL_GLOW: @ 81CC918
	loadsprite 10212
	monbg 0
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 4, 0
	wait
	sprite gBattleAnimSpriteTemplate_83DAC10, 66, 1, 0
	pause 18
	panse_1C SE_W234, 192, 16, 6
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 4, 4, 0, 0
	clearmonbg 0
	blendoff
	pause 1
	end

Move_LUSTER_PURGE: @ 81CC95B
	loadsprite 10267
	loadsprite 10135
	fadetobg 3
	waitbgfadeout
	createtask sub_812C624, 5
	waitbgfadein
	monbg 0
	setalpha 12, 8
	panse_19 SE_W076, 192
	sprite gBattleAnimSpriteTemplate_83DA9E0, 41, 4, 0, 0, 0, 0
	pause 20
	createtask sub_80E2A7C, 5, 5, 5, 2, 0, 16, -1
	createtask sub_80E2C60, 5, 5, 10267, 2, 0, 16, -1
	wait
	createtask sub_80E2C60, 5, 5, 10135, 0, 12, 12, 23552
	wait
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 2
	createtask sub_812B30C, 5, 2, 215, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 2
	createtask sub_812B30C, 5, 2, 215, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 2
	createtask sub_812B30C, 5, 2, 215, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 2
	createtask sub_812B30C, 5, 2, 215, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 2
	createtask sub_812B30C, 5, 2, 215, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 2
	createtask sub_812B30C, 5, 2, 215, 63
	wait
	createtask sub_80E2A7C, 5, 5, 5, 2, 16, 0, -1
	createtask sub_80E1864, 5, 3, 1, 5, 14
	wait
	clearmonbg 0
	blendoff
	call Unknown_81D61F3
	end

Move_MIST_BALL: @ 81CCA72
	loadsprite 10155
	loadsprite 10270
	pause 0
	panse_19 SE_W081, 192
	sprite gBattleAnimSpriteTemplate_83D9D80, 128, 6, 0, 0, 0, 0, 30, 0
	wait
	panse_19 SE_W028, 63
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 10, 0
	sprite gBattleAnimSpriteTemplate_83DB3DC, 0, 7, 1, 1, 1, 32279, 16, 32767, 16
	pause 0
	panse_19 SE_W114, 0
	createtask sub_80D8414, 5
	createtask sub_80E2A38, 10, 5, 4, 3, 0, 16, 32767
	pause 8
	createtask sub_80A7E7C, 2, 5, 1, 4, 0, 70, 0
	pause 70
	createtask sub_80E2A38, 10, 5, 4, 2, 16, 0, 32767
	end

Move_FEATHER_DANCE: @ 81CCB01
	loadsprite 10270
	monbg 3
	monbgprio_29
	panse_19 SE_W080, 63
	pause 0
	sprite gBattleAnimSpriteTemplate_83DA498, 128, 8, 0, -16, 64, 2, 104, 11304, 32, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA498, 128, 8, 0, -16, 32, 2, 104, 11304, 32, 1
	sprite gBattleAnimSpriteTemplate_83DA498, 128, 8, 0, -16, 0, 2, 104, 11304, 32, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA498, 128, 8, 0, -16, 224, 2, 104, 11304, 32, 1
	sprite gBattleAnimSpriteTemplate_83DA498, 128, 8, 0, -16, 128, 2, 104, 11304, 32, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA498, 128, 8, 0, -16, 192, 2, 104, 11304, 32, 1
	sprite gBattleAnimSpriteTemplate_83DA498, 128, 8, 0, -16, 160, 2, 104, 11304, 32, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA498, 128, 8, 0, -16, 96, 2, 104, 11304, 32, 1
	wait
	clearmonbg 3
	end

Move_TEETER_DANCE: @ 81CCBD1
	loadsprite 10072
	loadsprite 10073
	createtask sub_813219C, 5
	sprite gBattleAnimSpriteTemplate_83D715C, 2, 3, 0, 16, -2
	panse_19 SE_W298, 192
	pause 24
	sprite gBattleAnimSpriteTemplate_83D715C, 2, 3, 0, 0, -2
	panse_19 SE_W298, 192
	pause 24
	sprite gBattleAnimSpriteTemplate_83D715C, 2, 3, 0, -16, -2
	panse_19 SE_W298, 192
	pause 24
	sprite gBattleAnimSpriteTemplate_83D715C, 2, 3, 1, -8, -2
	panse_19 SE_W298, 192
	pause 24
	sprite gBattleAnimSpriteTemplate_83D715C, 2, 3, 2, 8, -2
	panse_19 SE_W298, 192
	end

Move_MUD_SPORT: @ 81CCC3C
	loadsprite 10074
	createtask sub_80D074C, 2, 2, 0, 6
	pause 24
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 0, -4, -16
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 0, 4, -12
	panse_19 SE_W091, 192
	pause 32
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 0, -3, -12
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 0, 5, -14
	panse_19 SE_W091, 192
	pause 32
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 0, -5, -18
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 0, 3, -14
	panse_19 SE_W091, 192
	pause 16
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 220, 60
	panse_1D SE_W145B, 0, 15
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 60, 100
	panse_1D SE_W145B, 0, 25
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 140, 55
	panse_1D SE_W145B, 0, 14
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 180, 50
	panse_1D SE_W145B, 0, 10
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 20, 90
	panse_1D SE_W145B, 0, 22
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 90, 90
	panse_1D SE_W145B, 0, 22
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 160, 60
	panse_1D SE_W145B, 0, 15
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 30, 90
	panse_1D SE_W145B, 0, 22
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 120, 60
	panse_1D SE_W145B, 0, 15
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB334, 130, 3, 1, 200, 40
	panse_1D SE_W145B, 0, 10
	end

Move_NEEDLE_ARM: @ 81CCD73
	loadsprite 10266
	loadsprite 10135
	loadsprite 10143
	panse_1C SE_W030, 63, 2, 16
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 0, -32, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 22, -22, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 30, 0, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 20, 20, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 0, 28, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, -19, 19, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, -27, 0, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, -18, -18, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 0, -25, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 17, -17, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 23, 0, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 0, 16, 16, 16
	wait
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 18, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 132, 5, 0, 0, 8, 1, 0
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 1, 0, -24, 10
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 1, 17, -17, 10
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 1, 24, 0, 10
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 1, 17, 17, 10
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 1, 0, 24, 10
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 1, -17, 17, 10
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 1, -24, 0, 10
	sprite gBattleAnimSpriteTemplate_83D6994, 130, 5, 1, 1, -17, -17, 10
	end

Move_SLACK_OFF: @ 81CCF23
	loadsprite 10031
	createtask sub_813257C, 2, 1, 0
	panse_19 SE_W281, 192
	wait
	call Unknown_81D5EF5
	wait
	end

Move_CRUSH_CLAW: @ 81CCF3B
	loadsprite 10167
	loadsprite 10039
	loadsprite 10208
	monbg 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	pause 4
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 18, 1
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, -10, -10, 0
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, -10, 10, 0
	panse_19 SE_W013, 63
	pause 12
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, 10, -10, 1
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, 10, 10, 1
	panse_19 SE_W013, 63
	wait
	wait
	blendoff
	clearmonbg 1
	end

Move_AROMATHERAPY: @ 81CCFAB
	panse_19 SE_W080, 0
	loadsprite 10159
	loadsprite 10203
	loadsprite 10049
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 1, 0, 0, 7, 13293
	pause 1
	monbg 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83D68B8, 0, 7, 24, 16, 0, 2, 2, 0, 0
	sprite gBattleAnimSpriteTemplate_83D68B8, 66, 7, 64, 24, 0, 3, 1, 1, 0
	sprite gBattleAnimSpriteTemplate_83D68D0, 0, 7, 16, 24, 0, 2, 1, 0, 0
	pause 20
	sprite gBattleAnimSpriteTemplate_83D68B8, 66, 7, 48, 12, 0, 4, 3, 1, 0
	sprite gBattleAnimSpriteTemplate_83D68B8, 0, 7, 100, 16, 0, 3, 2, 0, 0
	sprite gBattleAnimSpriteTemplate_83D68B8, 0, 7, 74, 24, 180, 3, 2, 0, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83D68B8, 66, 7, 80, 30, 0, 4, 1, 1, 0
	sprite gBattleAnimSpriteTemplate_83D68B8, 0, 7, 128, 12, 0, 3, 3, 0, 0
	sprite gBattleAnimSpriteTemplate_83D68D0, 0, 7, 90, 16, 0, 2, 1, 0, 0
	wait
	clearmonbg 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 1, 0, 7, 0, 13293
	pause 1
	panse_19 SE_W287, 192
	createtask sub_81300A4, 2, 1, 1
	wait
	panse_19 SE_W234, 192
	sprite gBattleAnimSpriteTemplate_83D6CA0, 16, 7, -15, 0, 0, 0, 32, 60, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83D6CA0, 16, 7, 12, -5, 0, 0, 32, 60, 1
	wait
	panse_19 SE_REAPOKE, 192
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 43, 3, 10, 0, 13293
	sprite gBattleAnimSpriteTemplate_83D7974, 16, 4, 0, 0, 0, 1
	wait
	end

Move_FAKE_TEARS: @ 81CD10D
	loadsprite 10155
	loadsprite 10209
	loadsprite 10072
	createtask sub_80E2C60, 5, 5, 10155, 0, 4, 4, 32108
	wait
	createtask sub_812E568, 5, 3, 0, 2, 1
	panse_1C SE_W039, 192, 12, 4
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB238, 2, 2, 0, 0
	sprite gBattleAnimSpriteTemplate_83DB238, 2, 2, 0, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB238, 2, 2, 0, 2
	sprite gBattleAnimSpriteTemplate_83DB238, 2, 2, 0, 3
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB238, 2, 2, 0, 0
	sprite gBattleAnimSpriteTemplate_83DB238, 2, 2, 0, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB238, 2, 2, 0, 2
	sprite gBattleAnimSpriteTemplate_83DB238, 2, 2, 0, 3
	wait
	end

Move_AIR_CUTTER: @ 81CD19D
	loadsprite 10003
	loadsprite 10138
	loadsprite 10135
	pause 0
	monbg 3
	setalpha 12, 8
	pause 0
	createtask sub_80CFB04, 2, 5, 32, -24, 1536, 2, 128
	wait
	panse_19 SE_W015, 63
	sprite gBattleAnimSpriteTemplate_83D6B40, 2, 4, 40, -32, 0, 2
	pause 5
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	createtask sub_80A7FA0, 2, 5, 3, 2, 0, 8, 1
	wait
	blendoff
	clearmonbg 3
	pause 0
	end

Move_ODOR_SLEUTH: @ 81CD1FF
	monbg 1
	createtask sub_81316F8, 5
	pause 24
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 3, 4
	panse_19 SE_W207, 192
	pause 6
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 3, 4
	panse_19 SE_W207, 192
	wait
	clearmonbg 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 3, 1, -1, 16, -1, 0
	panse_19 SE_W043, 192
	end

Move_GRASS_WHISTLE: @ 81CD249
	loadsprite 10072
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 4, 13298
	wait
	createtask sub_80CEA20, 2
	wait
	panse_1B SE_W320, 192, 63, 2, 0
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 7, 1, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 6, 1, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 1, 1, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 2, 1, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 3, 1, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 2, 1, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 5, 1, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 6, 1, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 2, 1, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 2, 1, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 1, 1, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D7114, 130, 3, 5, 1, 0
	pause 4
	wait
	createtask sub_80CEAD8, 2
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 4, 4, 0, 13298
	wait
	end

Move_TICKLE: @ 81CD33C
	loadsprite 10218
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 2, 0, 0, 16, 0
	wait
	sprite gBattleAnimSpriteTemplate_83D7B94, 0, 2, -16, -8
	sprite gBattleAnimSpriteTemplate_83D7B94, 0, 2, 16, -8
	panse_19 SE_W197, 192
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 2, 0, 16, 0, 0
	wait
	pause 20
	createtask sub_80A8B88, 3, 5, 0, 6, 1280, 3, 0
	pause 12
	createtask sub_812E568, 3, 3, 1, 6, 2
	panse_1C SE_W039, 63, 8, 8
	wait
	end

Move_WATER_SPOUT: @ 81CD3A8
	loadsprite 10268
	loadsprite 10148
	monbg 3
	setalpha 12, 8
	createtask sub_80D40F4, 5
	panse_19 SE_W029, 192
	pause 44
	panse_19 SE_W291, 192
	wait
	pause 16
	createtask sub_80D45D8, 5
	panse_19 SE_W057, 63
	clearmonbg 3
	blendoff
	end

Move_SHADOW_PUNCH: @ 81CD3D6
	loadsprite 10135
	loadsprite 10143
	fadetobg 2
	waitbgfadein
	monbg 2
	setalpha 9, 8
	createtask sub_807A69C, 2, 2, 0, 13
	panse_19 SE_W026, 192
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 132, 5, 0, 0, 8, 1, 0
	panse_19 SE_W004, 63
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	wait
	clearmonbg 2
	blendoff
	restorebg
	waitbgfadein
	end

Move_EXTRASENSORY: @ 81CD431
	call Unknown_81D61E7
	monbg 3
	setalpha 12, 8
	createtask sub_8079790, 5, 5, 0, 891, 12, 1, 1
	createtask sub_80DC2D4, 5, 1, 0
	panse_19 SE_W020, 63
	wait
	createtask sub_8079790, 5, 5, 0, 891, 12, 1, 1
	createtask sub_80DC2D4, 5, 1, 1
	panse_19 SE_W020, 63
	wait
	createtask sub_80DC4F4, 5, 1, 0
	createtask sub_80DC2D4, 5, 1, 2
	panse_19 SE_W043, 192
	wait
	blendoff
	clearmonbg 3
	call Unknown_81D61F3
	end

Move_AERIAL_ACE: @ 81CD499
	loadsprite 10138
	monbg 1
	setalpha 12, 8
	createtask sub_80A8500, 2, 5, 0, 24, 6, 1, 5
	createtask sub_80E2DD8, 2, 4, 0, 4, 7, 3
	sprite gBattleAnimSpriteTemplate_83D6B28, 2, 3, 40, -32, 0
	panse_19 SE_W013B, 192
	pause 5
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 10, 1
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 0, 10, 0, 0
	panse_19 SE_W013, 63
	wait
	clearmonbg 1
	blendoff
	end

Move_IRON_DEFENSE: @ 81CD503
	panse_1C SE_REAPOKE, 192, 28, 2
	createtask sub_80E0A4C, 5, 3, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 1, 8, 2, -1, 14, -1, 0
	wait
	end

Move_BLOCK: @ 81CD52D
	loadsprite 10250
	sprite gBattleAnimSpriteTemplate_8402A6C, 194
	panse_19 SE_W207, 63
	end

Move_HOWL: @ 81CD53C
	loadsprite 10053
	createtask sub_812F724, 2, 1, 0
	pause 12
	call _81CE35E
	createtask sub_812B18C, 2, 2, 0, 3
	wait
	pause 30
	end

Move_BULK_UP: @ 81CD55E
	loadsprite 10086
	createtask sub_80D08C8, 2
	panse_19 SE_W207, 192
	wait
	sprite gBattleAnimSpriteTemplate_83D7764, 2
	panse_1C SE_W207, 192, 4, 2
	wait
	end

Move_COVET: @ 81CD57C
	loadsprite 10210
	loadsprite 10224
	createtask sub_812E568, 5, 3, 0, 2, 0
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, 0, 20
	panse_19 SE_W204, 192
	pause 15
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, -20, 20
	panse_19 SE_W204, 192
	pause 15
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, 20, 20
	panse_19 SE_W204, 192
	wait
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	panse_1C SE_W146, 63, 4, 3
	end

Move_VOLT_TACKLE: @ 81CD5D9
	loadsprite 10001
	loadsprite 10212
	loadsprite 10213
	monbg 0
	setalpha 12, 8
	createtask sub_80E2A38, 10, 5, 1, 0, 0, 8, 0
	wait
	sprite gBattleAnimSpriteTemplate_83D9AB4, 1
	panse_19 SE_W268, 192
	wait
	clearmonbg 0
	blendoff
	pause 8
	createtask sub_80D700C, 5, 1, 0
	panse_19 SE_W085, 192
	wait
	createtask sub_80D700C, 5, 1, 1
	panse_19 SE_W085, 63
	wait
	createtask sub_80D700C, 5, 1, 2
	panse_19 SE_W085, 192
	wait
	createtask sub_80D700C, 5, 1, 3
	panse_19 SE_W085, 63
	wait
	createtask sub_80D700C, 5, 1, 4
	panse_19 SE_W085, 192
	pause 8
	createtask sub_80A7FA0, 2, 5, 1, 10, 0, 18, 1
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D9A9C, 2, 3, 1, 16, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9A9C, 2, 3, 1, -16, -16
	pause 8
	createtask sub_80D6E9C, 5
	wait
	createtask sub_80A7FA0, 2, 5, 0, 3, 0, 9, 1
	panse_19 SE_W085B, 192
	sprite gBattleAnimSpriteTemplate_83D9A9C, 2, 3, 0, 16, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9A9C, 2, 3, 0, -16, -16
	wait
	createtask sub_80E2A38, 10, 5, 1, 0, 8, 0, 0
	wait
	end

Move_WATER_SPORT: @ 81CD6D1
	loadsprite 10268
	createtask sub_80D48F4, 5
	pause 8
	panse_19 SE_W057, 192
	pause 44
	panse_19 SE_W057, 192
	pause 44
	panse_19 SE_W057, 192
	pause 44
	panse_1B SE_W057, 192, 63, 2, 0
	end

Move_CALM_MIND: @ 81CD6F7
	loadsprite 10203
	monbg 2
	createtask sub_80E2A7C, 5, 5, 0, 0, 0, 16, 0
	wait
	createtask sub_80E3BDC, 5, 1, 1
	wait
	sprite gBattleAnimSpriteTemplate_83D795C, 40, 4, 0, 0, 0, 0
	panse_19 SE_W048, 192
	pause 14
	sprite gBattleAnimSpriteTemplate_83D795C, 40, 4, 0, 0, 0, 0
	panse_19 SE_W048, 192
	pause 14
	sprite gBattleAnimSpriteTemplate_83D795C, 40, 4, 0, 0, 0, 0
	panse_19 SE_W048, 192
	wait
	createtask sub_80E3BDC, 5, 1, 0
	wait
	createtask sub_80E2A7C, 5, 5, 0, 0, 16, 0, 0
	wait
	clearmonbg 2
	end

Move_LEAF_BLADE: @ 81CD775
	loadsprite 10063
	loadsprite 10285
	createtask sub_80CBDF4, 5
	pause 2
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	panse_19 SE_W015, 63
	pause 50
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	panse_19 SE_W015, 63
	pause 50
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	panse_19 SE_W015, 63
	wait
	monbg 1
	setalpha 12, 8
	pause 12
	createtask sub_80A7FA0, 2, 5, 1, 8, 0, 18, 1
	sprite gBattleAnimSpriteTemplate_83DB520, 130, 4, 0, 0, 1, 36
	panse_19 SE_W043, 63
	wait
	clearmonbg 1
	blendoff
	end

Move_DRAGON_DANCE: @ 81CD7F8
	loadsprite 10249
	monbg 0
	monbgprio_28 0
	pause 1
	createtask sub_80DF924, 5
	panse_19 SE_W100, 192
	pause 8
	createtask sub_80798AC, 5, 5, 10249, 19456, 14, 0, 3
	sprite gBattleAnimSpriteTemplate_83DB0E8, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB0E8, 2, 1, 43
	sprite gBattleAnimSpriteTemplate_83DB0E8, 2, 1, 85
	sprite gBattleAnimSpriteTemplate_83DB0E8, 2, 1, 128
	sprite gBattleAnimSpriteTemplate_83DB0E8, 2, 1, 170
	sprite gBattleAnimSpriteTemplate_83DB0E8, 2, 1, 213
	pause 30
	panse_19 SE_W100, 192
	pause 30
	panse_19 SE_W100, 192
	wait
	clearmonbg 0
	pause 1
	end

Move_SHOCK_WAVE: @ 81CD867
	loadsprite 10211
	loadsprite 10212
	loadsprite 10001
	loadsprite 10037
	monbg 0
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 4, 0
	wait
	createtask sub_80D6B3C, 2, 4, 0, 20, 0, 2
	panse_19 SE_W268, 192
	pause 12
	sprite gBattleAnimSpriteTemplate_83D9B28, 2
	pause 30
	createtask sub_80D72DC, 5
	pause 12
	wait
	createtask sub_80D759C, 5
	panse_19 SE_W161B, 63
	wait
	createtask sub_80A7E7C, 2, 5, 1, 0, 6, 18, 1
	createtask sub_80E2A38, 5, 5, 1, 3, 16, 0, 32767
	createtask sub_80E2A38, 5, 5, 4, 0, 16, 16, 0
	pause 4
	createtask sub_80E2A38, 5, 5, 4, 0, 0, 0, 0
	wait
	clearmonbg 0
	blendoff
	end

Move_HARDEN: @ 81CD909
	panse_1C SE_W231, 192, 28, 2
	createtask sub_80E0A4C, 5, 3, 0, 0, 0
	wait
	end

Move_BELLY_DRUM: @ 81CD91E
	loadsprite 10072
	loadsprite 10193
	createtask sub_80CEA20, 2
	wait
	call _81CD9EB
	sprite gBattleAnimSpriteTemplate_83D71A8, 2, 4, 0, 0, 0, 0
	panse_19 SE_W187, 192
	pause 15
	call _81CD9D0
	sprite gBattleAnimSpriteTemplate_83D71A8, 2, 4, 1, 1, 1, 0
	panse_19 SE_W187, 192
	pause 15
	call _81CD9EB
	sprite gBattleAnimSpriteTemplate_83D71A8, 2, 4, 0, 3, 3, 128
	panse_19 SE_W187, 192
	pause 7
	call _81CD9D0
	sprite gBattleAnimSpriteTemplate_83D71A8, 2, 4, 1, 2, 0, 128
	panse_19 SE_W187, 192
	pause 7
	call _81CD9EB
	sprite gBattleAnimSpriteTemplate_83D71A8, 2, 4, 0, 1, 1, 0
	panse_19 SE_W187, 192
	pause 7
	call _81CD9D0
	sprite gBattleAnimSpriteTemplate_83D71A8, 2, 4, 1, 0, 3, 0
	panse_19 SE_W187, 192
	wait
	createtask sub_80CEAD8, 2
	wait
	end
_81CD9D0:
	sprite gBattleAnimSpriteTemplate_83D7174, 3, 1, 0
	createtask sub_80A7E7C, 2, 5, 0, 0, 8, 2, 1
	ret
_81CD9EB:
	sprite gBattleAnimSpriteTemplate_83D7174, 3, 1, 1
	createtask sub_80A7E7C, 2, 5, 0, 0, 8, 2, 1
	ret

Move_MIND_READER: @ 81CDA06
	loadsprite 10189
	loadsprite 10190
	loadsprite 10191
	monbg 4
	panse_19 SE_W109, 63
	sprite gBattleAnimSpriteTemplate_84021DC, 5, 4, 0, 0, 1, 0
	sprite gBattleAnimSpriteTemplate_84021F4, 5
	pause 40
	panse_19 SE_W043, 63
	createtask sub_80E1F8C, 2, 6, 1, 1, 2, 0, 10, 0
	call _81CDA4D
	wait
	clearmonbg 4
	end
_81CDA4D:
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 70, 0, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 40, 40, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 10, -60, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, -50, -40, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, -40, 40, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 50, -50, 6
	pause 2
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 50, -30, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 60, 10, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 0, 60, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 0, -40, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, -60, 20, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, -60, -30, 6
	pause 2
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, -50, 50, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, -60, 20, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, -40, -40, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 20, -60, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 50, -50, 6
	sprite gBattleAnimSpriteTemplate_840220C, 4, 3, 35, 40, 6
	pause 2
	ret

Move_ICE_PUNCH: @ 81CDB3E
	monbg 3
	setalpha 12, 8
	loadsprite 10141
	loadsprite 10135
	loadsprite 10143
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 7, 0
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 9, 32588
	pause 20
	panse_19 SE_W081, 63
	sprite gBattleAnimSpriteTemplate_83D9BF8, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83D9BF8, 2, 1, 64
	sprite gBattleAnimSpriteTemplate_83D9BF8, 2, 1, 128
	sprite gBattleAnimSpriteTemplate_83D9BF8, 2, 1, 192
	pause 5
	sprite gBattleAnimSpriteTemplate_83D9BE0, 2, 1, 32
	sprite gBattleAnimSpriteTemplate_83D9BE0, 2, 1, 96
	sprite gBattleAnimSpriteTemplate_83D9BE0, 2, 1, 160
	sprite gBattleAnimSpriteTemplate_83D9BE0, 2, 1, 224
	pause 17
	sprite gBattleAnimSpriteTemplate_83D9FA8, 4, 5, 0, -10, 8, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, -10, 1, 1
	panse_19 SE_W004, 63
	pause 2
	createtask sub_80A7E7C, 5, 5, 1, 0, 5, 3, 1
	wait
	pause 15
	call Unknown_81D5C36
	pause 5
	createtask sub_80E2A38, 10, 5, 4, 2, 9, 0, 32588
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 0, 7, 0, 0
	wait
	clearmonbg 3
	blendoff
	end

Move_REST: @ 81CDC29
	panse_19 SE_W173, 192
	loadsprite 10228
	sprite gBattleAnimSpriteTemplate_83D6D94, 2, 5, 4, -10, 16, 0, 0
	pause 20
	sprite gBattleAnimSpriteTemplate_83D6D94, 2, 5, 4, -10, 16, 0, 0
	pause 20
	sprite gBattleAnimSpriteTemplate_83D6D94, 2, 5, 4, -10, 16, 0, 0
	wait
	end

Move_CONFUSION: @ 81CDC69
	monbg 3
	call Unknown_81D61E7
	setalpha 8, 8
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 10, 1
	createtask sub_80E1F8C, 2, 6, 2, 0, 2, 0, 8, 32767
	wait
	panse_19 SE_W048, 63
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 15, 1
	createtask sub_80A8D34, 5, 5, -4, -4, 15, 1, 1
	wait
	clearmonbg 3
	blendoff
	pause 1
	call Unknown_81D61F3
	end

Move_PSYCHIC: @ 81CDCCA
	monbg 3
	call Unknown_81D61E7
	setalpha 8, 8
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 10, 1
	createtask sub_80E1F8C, 2, 6, 2, 0, 2, 0, 8, 767
	wait
	panse_1C SE_W048, 63, 10, 3
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 15, 1
	createtask sub_80A8D34, 5, 5, -6, -6, 15, 1, 1
	wait
	clearmonbg 3
	blendoff
	pause 1
	call Unknown_81D61F3
	end

Move_FUTURE_SIGHT: @ 81CDD2D
	jump _81CDD3B
_81CDD32:
	wait
	pause 1
	call Unknown_81D61F3
	end
_81CDD3B:
	monbg 2
	panse_19 SE_W060, 192
	call Unknown_81D61E7
	setalpha 8, 8
	panse_19 SE_W048, 192
	createtask sub_80E1F8C, 2, 6, 2, 0, 2, 0, 8, 32767
	createtask sub_80A8D34, 5, 5, -4, -4, 15, 0, 1
	wait
	clearmonbg 2
	blendoff
	jump _81CDD32

Unknown_81CDD7A: @ 81CDD7A
	monbg 3
	panse_19 SE_W060, 192
	call Unknown_81D61E7
	setalpha 8, 8
	panse_19 SE_W048, 63
	panse_1D SE_W048, 63, 8
	createtask sub_80A7E7C, 2, 5, 1, 4, 0, 15, 1
	createtask sub_80A8D34, 5, 5, -5, -5, 15, 1, 1
	wait
	createtask sub_80A7E7C, 2, 5, 1, 4, 0, 24, 1
	wait
	clearmonbg 3
	blendoff
	jump _81CDD32

Move_THUNDER: @ 81CDDCE
	loadsprite 10037
	fadetobg 11
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, -256, 0, 1, -1
	waitbgfadein
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 16, 0
	pause 16
	createtask sub_80E2324, 2, 3, 257, 257, 257
	panse_19 SE_W086, 63
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 16, -36
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 16, -20
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 16, 12
	pause 20
	sprite gBattleAnimSpriteTemplate_83D97D0, 134, 2, -16, -32
	panse_19 SE_W086, 63
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 134, 2, -16, -16
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 134, 2, -16, 16
	panse_19 SE_W086, 63
	pause 5
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 24, -32
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 24, -16
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 24, 16
	pause 30
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 5
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 0, -32
	panse_19 SE_W161B, 63
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 0, -16
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 0, 16
	pause 10
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	createtask sub_80D60B4, 2, 4, 30, 3, 1, 0
	pause 2
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 130, 5, 1, 2, 16, 0, 0
	wait
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	end

Move_THUNDER_PUNCH: @ 81CDF28
	loadsprite 10135
	loadsprite 10143
	loadsprite 10037
	monbg 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 16, 0
	wait
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83D9FA8, 132, 5, 0, 0, 8, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 1
	pause 1
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 0, -48
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 2, 2, 0, -16
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 2, 2, 0, 16
	pause 1
	panse_19 SE_W161B, 63
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 2
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 15, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 2
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 16, 0, 0
	pause 20
	wait
	clearmonbg 1
	blendoff
	end

Move_SACRED_FIRE: @ 81CDFF1
	loadsprite 10033
	loadsprite 10035
	panse_1C SE_W221, 192, 7, 5
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -32, 0, 50, 5, -2, 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, -20, -10, 50, 5, -1, -1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 0, -16, 50, 5, 0, -1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 20, -10, 50, 5, 1, -1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, 32, 0, 50, 5, 2, 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, 20, 10, 50, 5, 1, 1
	pause 1
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, 0, 16, 50, 5, 0, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -20, 10, 50, 5, -1, 1
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	wait
	panse_19 SE_W221B, 63
	sprite gBattleAnimSpriteTemplate_83D9508, 130, 6, -16, 0, 70, 16, 0, 1
	pause 10
	panse_19 SE_W221B, 63
	sprite gBattleAnimSpriteTemplate_83D9508, 130, 6, 0, 0, 70, 16, 0, 1
	pause 10
	panse_19 SE_W221B, 63
	sprite gBattleAnimSpriteTemplate_83D9508, 130, 6, 16, 0, 80, 16, 0, 1
	pause 1
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	wait
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 1
	panse_19 SE_W172B, 63
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, -1, 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 0, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, -1, -1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 2, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 1, -1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, -1, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 1, -2
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 3, 1
	wait
	end

Move_SCRATCH: @ 81CE1D8
	loadsprite 10137
	monbg 1
	setalpha 12, 8
	panse_19 SE_W010, 63
	sprite gBattleAnimSpriteTemplate_8402180, 2, 4, 0, 0, 1, 0
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	wait
	clearmonbg 1
	blendoff
	wait
	end

Move_DRAGON_BREATH: @ 81CE20A
	loadsprite 10029
	monbg 3
	monbgprio_28 1
	panse_1C SE_W172, 192, 7, 7
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	createtask sub_80E2A38, 10, 5, 4, 1, 0, 9, 31
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 21, 1
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB044, 130, 5, 0, 0, 0, 0, 20
	wait
	createtask sub_80E2A38, 10, 5, 4, 1, 9, 0, 31
	wait
	clearmonbg 3
	end

Move_ROAR: @ 81CE31E
	loadsprite 10053
	monbg 0
	monbgprio_28 0
	setalpha 8, 8
	createtask sub_812B18C, 2, 2, 0, 2
	createtask sub_80A8D34, 5, 5, -5, -5, 10, 0, 1
	call _81CE35E
	pause 20
	createtask sub_80A8A80, 5, 2, 1, 2
	wait
	clearmonbg 0
	blendoff
	wait
	pause 20
	end
_81CE35E:
	sprite gBattleAnimSpriteTemplate_8402934, 2, 3, 24, -8, 0
	sprite gBattleAnimSpriteTemplate_8402934, 2, 3, 24, 0, 2
	sprite gBattleAnimSpriteTemplate_8402934, 2, 3, 24, 8, 1
	pause 15
	sprite gBattleAnimSpriteTemplate_8402934, 2, 3, 24, -8, 0
	sprite gBattleAnimSpriteTemplate_8402934, 2, 3, 24, 0, 2
	sprite gBattleAnimSpriteTemplate_8402934, 2, 3, 24, 8, 1
	ret

Move_GROWL: @ 81CE3AF
	loadsprite 10053
	createtask sub_812B18C, 2, 2, 0, 255
	call _81CE35E
	pause 10
	createtask sub_80A7FA0, 2, 5, 1, 1, 0, 9, 1
	createtask sub_80A7FA0, 2, 5, 3, 1, 0, 9, 1
	wait
	pause 20
	end

Move_SNORE: @ 81CE3EA
	loadsprite 10197
	monbg 2
	setalpha 8, 8
	call _81CE403
	pause 30
	call _81CE403
	wait
	clearmonbg 2
	blendoff
	end
_81CE403:
	panse_19 SE_W173, 192
	createtask sub_80A8D34, 5, 5, -7, -7, 7, 0, 1
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 7, 1
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 5, 6, 1, 14, 0, 0
	sprite gBattleAnimSpriteTemplate_83D77F8, 2, 7, 0, 0, -42, -38, 24, 0, 0
	sprite gBattleAnimSpriteTemplate_83D77F8, 2, 7, 0, 0, 0, -42, 24, 0, 0
	sprite gBattleAnimSpriteTemplate_83D77F8, 2, 7, 0, 0, 42, -38, 24, 0, 0
	ret

Move_LIGHT_SCREEN: @ 81CE47A
	loadsprite 10070
	loadsprite 10166
	setalpha 0, 16
	panse_1D SE_W115, 192, 15
	sprite gBattleAnimSpriteTemplate_83DA6A8, 1, 3, 40, 0, 10166
	pause 10
	call _81CE4A1
	wait
	pause 1
	blendoff
	end
_81CE4A1:
	sprite gBattleAnimSpriteTemplate_83DA76C, 2, 4, 23, 0, 0, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA76C, 2, 4, 31, -8, 0, 1
	pause 5
	sprite gBattleAnimSpriteTemplate_83DA76C, 2, 4, 30, 20, 0, 1
	pause 7
	sprite gBattleAnimSpriteTemplate_83DA76C, 2, 4, 10, -15, 0, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA76C, 2, 4, 20, 10, 0, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA76C, 2, 4, 10, 18, 0, 1
	ret

Move_MIRROR_COAT: @ 81CE506
	loadsprite 10070
	loadsprite 10168
	setalpha 0, 16
	sprite gBattleAnimSpriteTemplate_83DA6D8, 1, 3, 40, 0, 10168
	pause 10
	panse_19 SE_W115, 192
	call _81CE4A1
	wait
	pause 1
	blendoff
	end

Move_REFLECT: @ 81CE52C
	loadsprite 10071
	loadsprite 10167
	setalpha 0, 16
	panse_1D SE_W115, 192, 15
	sprite gBattleAnimSpriteTemplate_83DA6C0, 1, 3, 40, 0, 10167
	pause 20
	sprite gBattleAnimSpriteTemplate_83DA73C, 2, 4, 30, 0, 0, 1
	pause 7
	sprite gBattleAnimSpriteTemplate_83DA73C, 2, 4, 19, -12, 0, 1
	pause 7
	sprite gBattleAnimSpriteTemplate_83DA73C, 2, 4, 10, 20, 0, 1
	wait
	pause 1
	blendoff
	end

Move_BARRIER: @ 81CE57F
	loadsprite 10169
	setalpha 0, 16
	panse_1D SE_W112, 192, 15
	sprite gBattleAnimSpriteTemplate_83DA6F0, 3, 3, 40, 0, 10169
	wait
	pause 1
	blendoff
	end

Move_BUBBLE: @ 81CE59C
	loadsprite 10146
	loadsprite 10155
	monbg 1
	setalpha 12, 8
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 15, -15, 10, 128, 100
	panse_19 SE_W145, 192
	panse_1D SE_W145B, 63, 100
	pause 6
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 35, 37, 40, 128, 100
	panse_19 SE_W145, 192
	panse_1D SE_W145B, 63, 100
	pause 6
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 10, -37, 30, 128, 100
	panse_19 SE_W145, 192
	panse_1D SE_W145B, 63, 100
	pause 6
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 30, 10, 15, 128, 100
	panse_19 SE_W145, 192
	panse_1D SE_W145B, 63, 100
	pause 6
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 20, 33, 20, 128, 100
	panse_19 SE_W145, 192
	panse_1D SE_W145B, 63, 100
	pause 6
	sprite gBattleAnimSpriteTemplate_83D9178, 2, 7, 18, 0, 25, -30, 10, 128, 100
	panse_19 SE_W145, 192
	panse_1D SE_W145B, 63, 100
	wait
	call Unknown_81D6069
	wait
	clearmonbg 1
	blendoff
	end

Move_SMOG: @ 81CE672
	loadsprite 10172
	monbg 3
	monbgprio_29
	setalpha 12, 8
	panse_1C SE_W054, 63, 17, 10
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	call _81CE6D7
	pause 120
	panse_1C SE_W092, 63, 18, 2
	createtask sub_80E1F8C, 2, 6, 4, 2, 2, 0, 12, 26650
	pause 10
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 15, 1
	wait
	clearmonbg 3
	blendoff
	end
_81CE6D7:
	sprite gBattleAnimSpriteTemplate_83D9D54, 2, 6, 0, -24, 48, 240, 1, 0
	pause 7
	ret

Move_FAINT_ATTACK: @ 81CE6ED
	loadsprite 10135
	monbg 0
	fadetobg 1
	waitbgfadein
	pause 0
	panse_19 SE_W185, 192
	createtask sub_80A8500, 2, 5, 0, 18, 6, 1, 3
	createtask sub_80DFC24, 2, 1, 1
	wait
	clearmonbg 0
	invisible 0
	pause 1
	createtask sub_80E4300, 2
	monbg 1
	setalpha 12, 8
	pause 1
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 1
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 9, 1
	wait
	clearmonbg 1
	blendoff
	pause 1
	setvar 7, 4096
	pause 32
	createtask sub_80DFDC0, 2
	monbg 0
	createtask sub_80DFD24, 2, 1, 1
	wait
	clearmonbg 0
	pause 1
	restorebg
	waitbgfadein
	end

Move_SAND_ATTACK: @ 81CE774
	loadsprite 10074
	monbg 2
	monbgprio_28 0
	setalpha 12, 8
	panse_19 SE_W028, 192
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, -10, 0, 0, 3
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 2
	call _81CE7C4
	call _81CE7C4
	call _81CE7C4
	call _81CE7C4
	call _81CE7C4
	call _81CE7C4
	wait
	clearmonbg 2
	blendoff
	end
_81CE7C4:
	sprite gBattleAnimSpriteTemplate_83DB2F8, 130, 5, 15, 15, 20, 0, 0
	sprite gBattleAnimSpriteTemplate_83DB2F8, 130, 5, 15, 15, 20, 10, 10
	sprite gBattleAnimSpriteTemplate_83DB2F8, 130, 5, 15, 15, 20, -10, -10
	sprite gBattleAnimSpriteTemplate_83DB2F8, 130, 5, 15, 15, 20, 20, 5
	sprite gBattleAnimSpriteTemplate_83DB2F8, 130, 5, 15, 15, 20, -20, -5
	pause 2
	ret

Move_MUD_SLAP: @ 81CE81C
	loadsprite 10074
	panse_19 SE_W028, 192
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, -10, 0, 0, 3
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 2
	call _81CE862
	call _81CE862
	call _81CE862
	call _81CE862
	call _81CE862
	call _81CE862
	wait
	end
_81CE862:
	sprite gBattleAnimSpriteTemplate_83DB31C, 130, 5, 15, 15, 20, 0, 0
	sprite gBattleAnimSpriteTemplate_83DB31C, 130, 5, 15, 15, 20, 10, 5
	sprite gBattleAnimSpriteTemplate_83DB31C, 130, 5, 15, 15, 20, -10, -5
	sprite gBattleAnimSpriteTemplate_83DB31C, 130, 5, 15, 15, 20, 20, 10
	sprite gBattleAnimSpriteTemplate_83DB31C, 130, 5, 15, 15, 20, -20, -10
	pause 2
	ret

Move_DRAGON_RAGE: @ 81CE8BA
	loadsprite 10029
	loadsprite 10035
	panse_19 SE_W082, 192
	createtask sub_80A7E7C, 5, 5, 0, 0, 2, 40, 1
	wait
	sprite gBattleAnimSpriteTemplate_83C1FF8, 130, 5, 0, 15, 0, 0, 4
	wait
	sprite gBattleAnimSpriteTemplate_83DB0D0, 130, 5, 30, 15, 0, 10, 10
	wait
	panse_1C SE_W172B, 63, 11, 3
	createtask sub_80A7E7C, 5, 5, 1, 0, 3, 25, 1
	sprite gBattleAnimSpriteTemplate_83DB078, 194, 3, 1, 5, 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB078, 194, 3, 1, -10, -15
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB078, 130, 3, 1, 0, 25
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB078, 194, 3, 1, 15, 5
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB078, 194, 3, 1, -25, 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB078, 130, 3, 1, 30, 30
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB078, 130, 3, 1, -27, 25
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB078, 194, 3, 1, 0, 8
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 194, 3, 0, 0, 4
	wait
	end

Move_RAIN_DANCE: @ 81CE997
	loadsprite 10115
	panse_19 SE_W240, 192
	createtask sub_80E2A38, 10, 5, 1921, 2, 0, 4, 0
	wait
	createtask sub_80D30F0, 2, 3, 0, 3, 120
	createtask sub_80D30F0, 2, 3, 0, 3, 120
	pause 120
	pause 30
	wait
	createtask sub_80E2A38, 10, 5, 1921, 2, 4, 0, 0
	wait
	end

Move_BITE: @ 81CE9E2
	loadsprite 10139
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W044, 63
	sprite gBattleAnimSpriteTemplate_83DB1D0, 2, 6, 0, -32, 0, 0, 819, 10
	sprite gBattleAnimSpriteTemplate_83DB1D0, 2, 6, 0, 32, 4, 0, -819, 10
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 5, 5, 1, 0, 4, 7, 1
	wait
	clearmonbg 1
	blendoff
	pause 1
	end

Move_CRUNCH: @ 81CEA40
	loadsprite 10139
	loadsprite 10135
	monbg 1
	fadetobg 1
	waitbgfadein
	setalpha 12, 8
	panse_19 SE_W044, 63
	sprite gBattleAnimSpriteTemplate_83DB1D0, 2, 6, -32, -32, 1, 819, 819, 10
	sprite gBattleAnimSpriteTemplate_83DB1D0, 2, 6, 32, 32, 5, -819, -819, 10
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -8, 0, 1, 1
	createtask sub_80A7E7C, 5, 5, 1, 0, 7, 5, 2
	wait
	panse_19 SE_W044, 63
	sprite gBattleAnimSpriteTemplate_83DB1D0, 2, 6, 32, -32, 7, -819, 819, 10
	sprite gBattleAnimSpriteTemplate_83DB1D0, 2, 6, -32, 32, 3, 819, -819, 10
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 8, 0, 1, 1
	createtask sub_80A7E7C, 5, 5, 1, 0, 8, 4, 2
	wait
	clearmonbg 1
	blendoff
	pause 1
	restorebg
	waitbgfadein
	end

Move_CLAMP: @ 81CEAF0
	loadsprite 10145
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W011, 63
	sprite gBattleAnimSpriteTemplate_83DB1E8, 2, 6, -32, 0, 2, 819, 0, 10
	sprite gBattleAnimSpriteTemplate_83DB1E8, 2, 6, 32, 0, 6, -819, 0, 10
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 5, 5, 1, 3, 0, 5, 1
	wait
	clearmonbg 1
	blendoff
	wait
	end

Move_ICE_BEAM: @ 81CEB4D
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	loadsprite 10141
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 7, 0
	wait
	createtask_1F sub_812B058, 7, 183, -64, 63, 4, 4, 0, 10
	sprite gBattleAnimSpriteTemplate_83D9C3C, 2, 5, 20, 12, 0, 12, 20
	sprite gBattleAnimSpriteTemplate_83D9C3C, 2, 5, 20, -12, 0, -12, 20
	pause 1
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 4, -31, 0, 7, 32384
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 25, 1
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	call _81CEC4E
	sprite gBattleAnimSpriteTemplate_83D9C24, 2, 5, 20, 0, 0, 0, 11
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9C24, 2, 5, 20, 0, 0, 0, 11
	wait
	pause 20
	call Unknown_81D5C36
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 4, 5, 7, 0, 32384
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 0, 7, 0, 0
	wait
	clearmonbg 1
	blendoff
	end
_81CEC4E:
	sprite gBattleAnimSpriteTemplate_83D9C3C, 2, 5, 20, 12, 0, 12, 20
	sprite gBattleAnimSpriteTemplate_83D9C3C, 2, 5, 20, -12, 0, -12, 20
	sprite gBattleAnimSpriteTemplate_83D9C24, 2, 5, 20, 0, 0, 0, 11
	pause 1
	ret

Move_WITHDRAW: @ 81CEC84
	panse_19 SE_W029, 192
	createtask sub_80CF4D8, 5
	wait
	end

Move_AURORA_BEAM: @ 81CEC91
	loadsprite 10140
	fadetobg 20
	waitbgfadein
	panse_19 SE_W062, 192
	setvar 7, 0
	createtask sub_80D3490, 10, 1, 130
	call _81CED18
	createtask sub_80A7FA0, 5, 5, 1, 1, 0, 17, 1
	call _81CED18
	call _81CED18
	call _81CED18
	setvar 7, -1
	createtask_1F sub_812B058, 7, 183, -64, 63, 3, 6, 0, 10
	createtask sub_80A7FA0, 5, 5, 1, 2, 0, 40, 1
	call _81CED18
	call _81CED18
	call _81CED18
	call _81CED18
	call _81CED18
	call _81CED18
	wait
	restorebg
	waitbgfadein
	end
_81CED18:
	sprite gBattleAnimSpriteTemplate_83D91C4, 130, 5, 20, 0, 0, 0, 17
	pause 1
	sprite gBattleAnimSpriteTemplate_83D91C4, 130, 5, 20, 0, 0, 0, 17
	pause 1
	sprite gBattleAnimSpriteTemplate_83D91C4, 130, 5, 20, 0, 0, 0, 17
	pause 1
	sprite gBattleAnimSpriteTemplate_83D91C4, 130, 5, 20, 0, 0, 0, 17
	pause 1
	ret

Move_SOLAR_BEAM: @ 81CED65
	loadsprite 10147
	ifelse _81CED73, _81CEE70
_81CED71:
	wait
	end
_81CED73:
	monbg 2
	setalpha 12, 8
	createtask sub_80E1F8C, 2, 6, 2, 1, 4, 0, 11, 12287
	panse_19 SE_W025, 192
	call _81CED9D
	wait
	clearmonbg 2
	blendoff
	jump _81CED71
_81CED9D:
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 40, 40, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -40, -40, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 0, 40, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 0, -40, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 40, -20, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 40, 20, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -40, -20, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -40, 20, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -20, 30, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 20, -30, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -20, -30, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 20, 30, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -40, 0, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 40, 0, 16
	pause 2
	ret
_81CEE70:
	call Unknown_81D6233
	panse_1B SE_W076, 192, 63, 2, 0
	createtask sub_80CA928, 5
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 1
	pause 4
	createtask sub_80E2A38, 10, 5, 4, 1, 0, 10, 1017
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 2
	pause 4
	createtask sub_80A7FA0, 5, 5, 1, 2, 0, 65, 1
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 3
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 4
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 5
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 6
	pause 4
	call _81CEF42
	call _81CEF42
	wait
	createtask sub_80E2A38, 10, 5, 4, 1, 10, 0, 1017
	call Unknown_81D626D
	jump _81CED71
_81CEF42:
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 2
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 3
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 4
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 5
	pause 4
	sprite gBattleAnimSpriteTemplate_83D6304, 131, 4, 15, 0, 20, 6
	pause 4
	ret

Move_BLIZZARD: @ 81CEFBA
	loadsprite 10141
	monbg 3
	createtask sub_80E3B4C, 2
	jumpvareq 7, 1, _81CF13F
	fadetobg 9
_81CEFD0:
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, -2304, 0, 1, -1
	waitbgfadein
	wait
	panse_1B SE_W059, 192, 63, 2, 0
	call _81CF00A
	call _81CF00A
	panse_19 SE_W059B, 63
	wait
	call Unknown_81D5CBA
	wait
	clearmonbg 3
	pause 20
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	end
_81CF00A:
	sprite gBattleAnimSpriteTemplate_83D9CA8, 40, 6, 0, -10, 0, -10, 72, 1
	sprite gBattleAnimSpriteTemplate_83D9CC0, 40, 8, 0, 0, 0, 0, 80, 0, 0, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CA8, 40, 6, 0, -15, 0, -15, 72, 1
	sprite gBattleAnimSpriteTemplate_83D9CC0, 40, 8, 0, -10, 0, -10, 80, 0, 0, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CA8, 40, 6, 0, -5, 0, -5, 72, 1
	sprite gBattleAnimSpriteTemplate_83D9CC0, 40, 8, 0, 10, 0, 10, 80, 0, 0, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CA8, 40, 6, 0, -10, 0, -10, 72, 1
	sprite gBattleAnimSpriteTemplate_83D9CC0, 40, 8, 0, -20, 0, -20, 80, 0, 0, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CA8, 40, 6, 0, -20, 0, -20, 72, 1
	sprite gBattleAnimSpriteTemplate_83D9CC0, 40, 8, 0, 15, 0, 15, 80, 0, 0, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CA8, 40, 6, 0, -15, 0, -15, 72, 1
	sprite gBattleAnimSpriteTemplate_83D9CC0, 40, 8, 0, -20, 0, -20, 80, 0, 0, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CA8, 40, 6, 0, -25, 0, -25, 72, 1
	sprite gBattleAnimSpriteTemplate_83D9CC0, 40, 8, 0, 20, 0, 20, 80, 0, 0, 1
	pause 3
	ret
_81CF13F:
	fadetobg 10
	jump _81CEFD0

Move_POWDER_SNOW: @ 81CF146
	loadsprite 10141
	monbg 3
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 31, 1, 0, 3, 0
	wait
	panse_1B SE_W016, 192, 63, 2, 0
	call _81CF190
	call _81CF190
	panse_19 SE_W016B, 63
	wait
	waitsound
	call Unknown_81D5CBA
	wait
	clearmonbg 3
	pause 20
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 31, 1, 3, 0, 0
	end
_81CF190:
	sprite gBattleAnimSpriteTemplate_83D9CD8, 40, 8, 0, 0, 0, 0, 56, 4, 4, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CD8, 40, 8, 0, -10, 0, -10, 56, 4, 4, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CD8, 40, 8, 0, 10, 0, 10, 56, -4, 3, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CD8, 40, 8, 0, -20, 0, -20, 56, -4, 5, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CD8, 40, 8, 0, 15, 0, 15, 56, 4, 4, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CD8, 40, 8, 0, -20, 0, -20, 56, 4, 4, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9CD8, 40, 8, 0, 20, 0, 20, 56, 4, 4, 1
	pause 3
	ret

Move_HYDRO_PUMP: @ 81CF240
	loadsprite 10149
	loadsprite 10148
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createtask sub_80A7E7C, 5, 5, 0, 0, 2, 40, 1
	pause 6
	panse_1B SE_W056, 192, 63, 2, 0
	createtask sub_80D3630, 5, 1, 100
	call _81CF2DF
	call _81CF2DF
	call _81CF2DF
	createtask sub_80A7E7C, 5, 5, 1, 3, 0, 37, 1
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
	pause 1
	pause 1
	call _81CF320
	wait
	clearmonbg 3
	blendoff
	end
_81CF2DF:
	sprite gBattleAnimSpriteTemplate_83D91F4, 3, 4, 10, 10, 0, 16
	sprite gBattleAnimSpriteTemplate_83D91F4, 3, 4, 10, 10, 0, -16
	pause 1
	sprite gBattleAnimSpriteTemplate_83D91F4, 3, 4, 10, 10, 0, 16
	sprite gBattleAnimSpriteTemplate_83D91F4, 3, 4, 10, 10, 0, -16
	pause 1
	ret
_81CF320:
	sprite gBattleAnimSpriteTemplate_83DB4D8, 4, 4, 0, 15, 1, 1
	sprite gBattleAnimSpriteTemplate_83DB4D8, 4, 4, 0, -15, 1, 1
	ret

Move_SIGNAL_BEAM: @ 81CF33F
	loadsprite 10264
	loadsprite 10265
	loadsprite 10073
	createtask sub_80A7E7C, 5, 5, 0, 0, 2, 25, 1
	pause 6
	panse_1B SE_W062, 192, 63, 1, 0
	createtask sub_80D3630, 5, 1, 100
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	call _81CF406
	createtask sub_80A7E7C, 5, 5, 1, 3, 0, 25, 1
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 4, 8, 5, 31, 8, 961, 8
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
	wait
	end
_81CF406:
	sprite gBattleAnimSpriteTemplate_83D9224, 131, 4, 10, 10, 0, 16
	sprite gBattleAnimSpriteTemplate_83D923C, 131, 4, 10, 10, 0, -16
	pause 1
	ret

Move_ABSORB: @ 81CF427
	loadsprite 10147
	loadsprite 10031
	loadsprite 10135
	monbg 3
	monbgprio_2A 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 4, 13293
	wait
	panse_19 SE_W071, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	pause 2
	createtask sub_80A7E7C, 5, 5, 1, 0, 5, 5, 1
	wait
	pause 3
	call _81CF496
	wait
	pause 15
	call Unknown_81D5EF5
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 4, 0, 13293
	wait
	clearmonbg 3
	blendoff
	end
_81CF496:
	panse_19 SE_W152, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	pause 4
	panse_19 SE_W152, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	pause 4
	panse_19 SE_W152, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	pause 4
	panse_19 SE_W152, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, -15, -16, 36
	pause 4
	panse_19 SE_W152, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	pause 4
	panse_19 SE_W152, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	pause 4
	panse_19 SE_W152, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 20, 39
	pause 4
	panse_19 SE_W152, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 5, -18, -20, 35
	pause 4
	ret

Move_MEGA_DRAIN: @ 81CF53F
	loadsprite 10147
	loadsprite 10031
	loadsprite 10135
	monbg 3
	monbgprio_2A 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 8, 13293
	wait
	panse_19 SE_W071, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 1
	pause 2
	createtask sub_80A7E7C, 5, 5, 1, 0, 5, 5, 1
	wait
	pause 3
	call _81CF5AE
	wait
	pause 15
	call Unknown_81D5EF5
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 8, 0, 13293
	wait
	clearmonbg 3
	blendoff
	end
_81CF5AE:
	panse_19 SE_W145C, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 5, -18, -20, 35
	pause 4
	panse_19 SE_W145C, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 20, 39
	pause 4
	panse_19 SE_W145C, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	pause 4
	panse_19 SE_W145C, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, -15, -16, 36
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	pause 4
	panse_19 SE_W145C, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, -15, -16, 36
	pause 4
	panse_19 SE_W145C, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	pause 4
	panse_19 SE_W145C, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 20, 39
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	pause 4
	panse_19 SE_W145C, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 5, -18, -20, 35
	pause 4
	ret

Move_GIGA_DRAIN: @ 81CF6CF
	loadsprite 10147
	loadsprite 10031
	loadsprite 10135
	monbg 3
	monbgprio_2A 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 12, 13293
	wait
	panse_19 SE_W071, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 0
	pause 2
	createtask sub_80A7E7C, 5, 5, 1, 0, 5, 5, 1
	wait
	pause 3
	call _81CF73E
	wait
	pause 15
	call Unknown_81D5EF5
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 12, 0, 13293
	wait
	clearmonbg 3
	blendoff
	end
_81CF73E:
	panse_19 SE_W202, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 5, -18, -40, 35
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 20, 39
	pause 4
	panse_19 SE_W202, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 28, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 40, 39
	pause 4
	panse_19 SE_W202, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -32, 26
	pause 4
	panse_19 SE_W202, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, -15, -16, 36
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	pause 4
	panse_19 SE_W202, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, -15, -16, 36
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	pause 4
	panse_19 SE_W202, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -40, 26
	pause 4
	panse_19 SE_W202, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 36, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 20, 39
	pause 4
	panse_19 SE_W202, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 5, -18, -20, 35
	pause 4
	ret

Move_LEECH_LIFE: @ 81CF8D7
	loadsprite 10161
	loadsprite 10147
	pause 1
	loadsprite 10031
	loadsprite 10135
	monbg 3
	monbgprio_2A 1
	setalpha 12, 8
	pause 1
	sprite gBattleAnimSpriteTemplate_83DAB10, 2, 3, -20, 15, 12
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	panse_19 SE_W071, 63
	pause 2
	createtask sub_80A7E7C, 5, 5, 1, 0, 5, 5, 1
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 7, 0
	wait
	call _81CF496
	wait
	pause 15
	call Unknown_81D5EF5
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 7, 0, 0
	wait
	clearmonbg 3
	blendoff
	end

Move_SYNTHESIS: @ 81CF959
	loadsprite 10031
	loadsprite 10049
	createtask sub_80E1F8C, 2, 6, 2, 2, 2, 0, 16, 19451
	panse_19 SE_W025, 192
	call Unknown_81D5ECA
	wait
	call Unknown_81D5EF5
	wait
	end

Move_TOXIC: @ 81CF983
	loadsprite 10151
	loadsprite 10150
	call _81CF99D
	call _81CF99D
	wait
	pause 15
	call Unknown_81D5F87
	wait
	end
_81CF99D:
	sprite gBattleAnimSpriteTemplate_83DA244, 130, 4, -24, 16, 1, 1
	panse_19 SE_W092, 63
	pause 15
	sprite gBattleAnimSpriteTemplate_83DA244, 130, 4, 8, 16, 1, 1
	panse_19 SE_W092, 63
	pause 15
	sprite gBattleAnimSpriteTemplate_83DA244, 130, 4, -8, 16, 1, 1
	panse_19 SE_W092, 63
	pause 15
	sprite gBattleAnimSpriteTemplate_83DA244, 130, 4, 24, 16, 1, 1
	panse_19 SE_W092, 63
	pause 15
	ret

Move_SLUDGE: @ 81CF9F2
	loadsprite 10150
	panse_19 SE_W145C, 192
	sprite gBattleAnimSpriteTemplate_83DA2B8, 130, 4, 20, 0, 40, 0
	wait
	createtask sub_80A7E7C, 5, 5, 1, 3, 0, 5, 1
	createtask sub_80E1F8C, 2, 6, 4, 1, 2, 0, 12, 31774
	call Unknown_81D5F87
	wait
	end

Move_SLUDGE_BOMB: @ 81CFA34
	loadsprite 10150
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
	createtask sub_80A7FA0, 5, 5, 1, 3, 0, 15, 1
	createtask sub_80E1F8C, 2, 6, 4, 1, 2, 0, 12, 31774
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, 42, 27, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, -27, 44, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, 39, -28, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, -42, -42, 20
	panse_19 SE_W091, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, 0, 40, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, -8, -44, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, -46, -28, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, 46, 9, 20
	panse_19 SE_W091, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, 42, 0, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, -43, -12, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, 16, -46, 20
	sprite gBattleAnimSpriteTemplate_83DA2E8, 130, 3, -16, 44, 20
	panse_19 SE_W091, 63
	pause 0
	waitsound
	wait
	call Unknown_81D5F87
	wait
	end
_81CFB44:
	panse_19 SE_W145C, 192
	sprite gBattleAnimSpriteTemplate_83DA2B8, 130, 4, 20, 0, 40, 0
	pause 3
	ret

Move_ACID: @ 81CFB5A
	loadsprite 10150
	monbg 3
	sprite gBattleAnimSpriteTemplate_83DA2D0, 130, 6, 20, 0, 40, 1, 0, 0
	panse_19 SE_W145C, 192
	pause 5
	sprite gBattleAnimSpriteTemplate_83DA2D0, 130, 6, 20, 0, 40, 1, 24, 0
	panse_19 SE_W145C, 192
	pause 5
	sprite gBattleAnimSpriteTemplate_83DA2D0, 130, 6, 20, 0, 40, 1, -24, 0
	panse_19 SE_W145C, 192
	pause 15
	createtask sub_80A7FA0, 5, 5, 1, 2, 0, 10, 1
	createtask sub_80A7FA0, 5, 5, 3, 2, 0, 10, 1
	createtask sub_80E1F8C, 2, 6, 20, 2, 2, 0, 12, 31774
	sprite gBattleAnimSpriteTemplate_83DA31C, 130, 5, 0, -22, 0, 15, 55
	panse_19 SE_W145, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83DA31C, 130, 5, -26, -24, 0, 15, 55
	panse_19 SE_W145, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83DA31C, 130, 5, 15, -27, 0, 15, 50
	panse_19 SE_W145, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83DA31C, 130, 5, -15, -17, 0, 10, 45
	panse_19 SE_W145, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83DA31C, 130, 5, 27, -22, 0, 15, 50
	panse_19 SE_W145, 63
	wait
	clearmonbg 3
	end

Move_BONEMERANG: @ 81CFC54
	loadsprite 10000
	loadsprite 10135
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	panse_19 SE_W155, 192
	sprite gBattleAnimSpriteTemplate_83DB2C8, 2
	pause 20
	panse_19 SE_W030, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 1
	createtask sub_80A7E7C, 5, 5, 1, 5, 0, 5, 1
	pause 17
	panse_19 SE_W233, 192
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, -4
	wait
	clearmonbg 3
	blendoff
	end

Move_BONE_CLUB: @ 81CFCA8
	loadsprite 10000
	loadsprite 10135
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	panse_19 SE_W155, 63
	sprite gBattleAnimSpriteTemplate_83DB2E0, 2, 5, -42, -25, 0, 0, 15
	pause 12
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 1
	createtask sub_80A7E7C, 5, 5, 1, 0, 5, 5, 1
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 7, 5, 1, 0, 10, 0, 0
	panse_19 SE_W233B, 63
	wait
	clearmonbg 3
	blendoff
	end

Move_BONE_RUSH: @ 81CFD0A
	loadsprite 10000
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W155, 63
	sprite gBattleAnimSpriteTemplate_83DB2E0, 2, 5, -42, -25, 0, 0, 15
	pause 12
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 5, 5, 1, 0, 3, 5, 1
	panse_19 SE_W030, 63
	wait
	clearmonbg 3
	blendoff
	end

Move_SPIKES: @ 81CFD55
	loadsprite 10152
	monbg 3
	panse_19 SE_W026, 192
	panse_1D SE_W030, 63, 28
	sprite gBattleAnimSpriteTemplate_840227C, 130, 5, 20, 0, 0, 24, 30
	pause 10
	panse_19 SE_W026, 192
	panse_1D SE_W030, 63, 28
	sprite gBattleAnimSpriteTemplate_840227C, 130, 5, 20, 0, -24, 24, 30
	pause 10
	panse_1D SE_W030, 63, 28
	sprite gBattleAnimSpriteTemplate_840227C, 130, 5, 20, 0, 24, 24, 30
	wait
	clearmonbg 3
	end

Move_MEGAHORN: @ 81CFDAC
	loadsprite 10153
	loadsprite 10135
	monbg 3
	panse_19 SE_W082, 192
	jumpunkcond _81CFE83
	fadetobg 7
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, -2304, 768, 1, -1
_81CFDCF:
	waitbgfadein
	setalpha 12, 8
	createtask sub_80A7E7C, 5, 5, 0, 2, 0, 15, 1
	wait
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 24, 0, 0, 6
	pause 3
	sprite gBattleAnimSpriteTemplate_83DAABC, 3, 5, -42, 25, 0, 0, 6
	pause 4
	panse_19 SE_W011, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 0
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -16, 4, 1, 4
	wait
	createtask sub_80A8154, 2, 5, 1, -4, 1, 12, 1
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 7, 5, 1, 32767, 10, 0, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 11
	pause 3
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 7
	wait
	wait
	clearmonbg 3
	blendoff
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	end
_81CFE83:
	fadetobg 8
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, 2304, 768, 0, -1
	jump _81CFDCF

Move_GUST: @ 81CFE9A
	loadsprite 10009
	loadsprite 10135
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	panse_19 SE_W016, 63
	sprite gBattleAnimSpriteTemplate_83DA380, 2, 2, 0, -16
	createtask sub_80DA09C, 5, 2, 1, 70
	wait
	createtask sub_80A7FA0, 5, 5, 1, 1, 0, 7, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	panse_19 SE_W016B, 63
	wait
	clearmonbg 3
	blendoff
	end

Move_WING_ATTACK: @ 81CFEEB
	loadsprite 10009
	loadsprite 10135
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	panse_1C SE_W017, 192, 20, 2
	createtask sub_80A8408, 2, 5, 0, 12, 4, 1, 4
	createtask sub_80DA09C, 5, 2, 1, 70
	sprite gBattleAnimSpriteTemplate_83DA3B4, 2, 5, -25, 0, 0, 0, 20
	sprite gBattleAnimSpriteTemplate_83DA3B4, 2, 5, 25, 0, 0, 0, 20
	pause 24
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 24, 0, 0, 9
	pause 17
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 16, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -16, 0, 1, 1
	panse_1C SE_W003, 63, 5, 2
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 11
	wait
	clearmonbg 3
	blendoff
	end

Move_PECK: @ 81CFF88
	loadsprite 10135
	panse_19 SE_W030, 63
	createtask sub_80A8EFC, 2, 4, 3, -768, 1, 2
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, -12, 0, 1, 3
	wait
	end

Move_AEROBLAST: @ 81CFFAF
	loadsprite 10154
	loadsprite 10135
	monbg 3
	call Unknown_81D61FB
	monbgprio_28 1
	setalpha 12, 8
	call _81D000B
	createtask sub_80A7E7C, 5, 5, 1, 5, 0, 50, 1
	call _81D000B
	call _81D000B
	call _81D000B
	call _81D000B
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 0
	panse_19 SE_W013, 63
	wait
	clearmonbg 3
	blendoff
	pause 0
	call Unknown_81D622B
	end
_81D000B:
	panse_19 SE_W026, 192
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 14, -12, 0, -12, 15, 0, 0
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 26, 8, 12, 8, 15, 0, 0
	pause 3
	panse_19 SE_W026, 192
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 14, -12, 0, -12, 15, 1, 0
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 26, 8, 12, 8, 15, 1, 0
	pause 3
	panse_19 SE_W026, 192
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 14, -12, 0, -12, 15, 2, 0
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 26, 8, 12, 8, 15, 2, 0
	pause 3
	panse_19 SE_W026, 192
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 14, -12, 0, -12, 15, 3, 0
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 26, 8, 12, 8, 15, 3, 0
	pause 3
	ret

Move_WATER_GUN: @ 81D00CC
	loadsprite 10155
	loadsprite 10148
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83D9318, 2, 6, 20, 0, 0, 0, 40, -25
	panse_19 SE_W145, 192
	wait
	createtask sub_80A7FA0, 5, 5, 1, 1, 0, 8, 1
	sprite gBattleAnimSpriteTemplate_83DB4D8, 4, 4, 0, 0, 1, 2
	sprite gBattleAnimSpriteTemplate_83D9330, 2, 5, 0, -15, 0, 15, 55
	panse_19 SE_W152, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83D9330, 2, 5, 15, -20, 0, 15, 50
	panse_19 SE_W152, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83D9330, 2, 5, -15, -10, 0, 10, 45
	panse_19 SE_W152, 63
	wait
	clearmonbg 3
	blendoff
	end

Move_CRABHAMMER: @ 81D0159
	loadsprite 10141
	loadsprite 10148
	monbg 3
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB4D8, 4, 4, 0, 0, 1, 0
	panse_19 SE_W233B, 63
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 32429, 10, 0, 0
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -24, 0, 0, 4
	wait
	pause 8
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 4
	wait
	panse_1C SE_W152, 63, 20, 3
	createtask sub_80A7E7C, 5, 5, 1, 0, 4, 8, 1
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 10, 10, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 20, -20, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, -15, 15, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 0, 0, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, -10, -20, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 16, -8, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, 5, 8, 20, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9348, 2, 4, -16, 0, 20, 1
	wait
	clearmonbg 3
	blendoff
	end

Move_SURF: @ 81D0253
	createtask sub_80D38BC, 2, 1, 0
	pause 24
	panse_1B SE_W057, 192, 63, 2, 0
	wait
	end

Move_FLAMETHROWER: @ 81D0267
	loadsprite 10029
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createtask sub_80A7E7C, 5, 5, 0, 0, 2, 46, 1
	pause 6
	createtask sub_80D3630, 5, 1, 100
	panse_1B SE_W053, 192, 63, 2, 0
	call _81D02E1
	call _81D02E1
	call _81D02E1
	createtask sub_80A7E7C, 5, 5, 1, 3, 0, 43, 1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	call _81D02E1
	wait
	clearmonbg 3
	blendoff
	end
_81D02E1:
	sprite gBattleAnimSpriteTemplate_83D9268, 3, 4, 10, 10, 0, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9268, 3, 4, 10, 10, 0, 16
	pause 2
	ret

Move_SANDSTORM: @ 81D0304
	loadsprite 10261
	panse_19 SE_W201, 0
	createtask do_boulder_dust, 5, 1, 0
	pause 16
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 10, 2304, 96, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 90, 2048, 96, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 50, 2560, 96, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 20, 2304, 96, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 70, 1984, 96, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 0, 2816, 96, 0
	pause 10
	sprite gBattleAnimSpriteTemplate_83DACE8, 40, 4, 60, 2560, 96, 0
	end

Move_WHIRLPOOL: @ 81D038C
	loadsprite 10149
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	pause 0
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 4, 2, 0, 7, 23968
	panse_19 SE_W250, 63
	createtask sub_80A7E7C, 5, 5, 1, 0, 2, 50, 1
	call _81D03E4
	call _81D03E4
	call _81D03E4
	pause 12
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 4, 2, 7, 0, 23968
	wait
	clearmonbg 3
	end
_81D03E4:
	sprite gBattleAnimSpriteTemplate_83DACB8, 130, 7, 0, 28, 384, 50, 8, 50, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACB8, 130, 7, 0, 32, 240, 40, 11, -46, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACB8, 130, 7, 0, 33, 416, 40, 4, 42, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACB8, 130, 7, 0, 31, 288, 45, 6, -42, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACB8, 130, 7, 0, 28, 448, 45, 11, 46, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACB8, 130, 7, 0, 33, 464, 50, 10, -50, 1
	pause 2
	ret

Move_FLY: @ 81D046F
	loadsprite 10156
	loadsprite 10135
	ifelse _81D0480, _81D0498
_81D047E:
	wait
	end
_81D0480:
	panse_19 SE_W019, 192
	sprite gBattleAnimSpriteTemplate_83DA450, 2, 4, 0, 0, 13, 336
	jump _81D047E
_81D0498:
	monbg 3
	setalpha 12, 8
	panse_19 SE_W104, 192
	sprite gBattleAnimSpriteTemplate_83DA468, 2, 1, 20
	pause 20
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 0
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	panse_19 SE_W013, 63
	wait
	clearmonbg 3
	blendoff
	jump _81D047E

Move_BOUNCE: @ 81D04D9
	loadsprite 10156
	loadsprite 10135
	ifelse _81D04E9, _81D04FD
_81D04E8:
	end
_81D04E9:
	panse_19 SE_W100, 192
	sprite gBattleAnimSpriteTemplate_83DA568, 2, 2, 0, 0
	jump _81D04E8
_81D04FD:
	monbg 3
	setalpha 12, 8
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83DA594, 131
	pause 7
	panse_19 SE_W025B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 0, 0, 1, 0
	createtask sub_80A7E7C, 5, 5, 1, 0, 5, 11, 1
	wait
	clearmonbg 3
	blendoff
	jump _81D04E8

Move_KARATE_CHOP: @ 81D053C
	loadsprite 10143
	loadsprite 10135
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	panse_19 SE_W104, 63
	sprite gBattleAnimSpriteTemplate_83D9F78, 2, 8, -16, 0, 0, 0, 10, 1, 3, 0
	wait
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 5, 5, 1, 4, 0, 6, 1
	wait
	clearmonbg 3
	blendoff
	end

Move_CROSS_CHOP: @ 81D058E
	loadsprite 10143
	loadsprite 10285
	monbg 3
	setalpha 12, 8
	panse_19 SE_W025, 63
	sprite gBattleAnimSpriteTemplate_83D9FD8, 2, 3, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9FD8, 2, 3, 0, 0, 1
	pause 40
	panse_19 SE_W013, 63
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 32767, 10, 0, 10
	sprite gBattleAnimSpriteTemplate_83DB520, 3, 4, 0, 0, 1, 20
	createtask sub_80A7E7C, 5, 5, 1, 7, 0, 9, 1
	wait
	clearmonbg 3
	blendoff
	end

Move_JUMP_KICK: @ 81D05F7
	loadsprite 10143
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 4
	pause 3
	sprite gBattleAnimSpriteTemplate_83D9F90, 2, 8, -16, 8, 0, 0, 10, 1, 1, 1
	panse_19 SE_W026, 63
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 1, 4, 0, 0, 1, 1
	createtask sub_80A7E7C, 5, 5, 1, 5, 0, 7, 1
	panse_19 SE_W004, 63
	wait
	clearmonbg 3
	blendoff
	end

Move_HI_JUMP_KICK: @ 81D0654
	loadsprite 10143
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, -24, 0, 0, 8
	wait
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 3
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9F90, 2, 8, -16, 8, 0, 0, 10, 1, 1, 1
	panse_19 SE_W026, 63
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 1
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -28, 0, 0, 3
	pause 3
	createtask sub_80A8154, 2, 5, 1, 3, 0, 11, 1
	wait
	pause 5
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 6
	wait
	clearmonbg 3
	blendoff
	end

Move_DOUBLE_KICK: @ 81D06EA
	loadsprite 10143
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83D9FC0, 3, 3, 1, 20, 1
	createtask sub_80A7E7C, 5, 5, 1, 4, 0, 6, 1
	panse_19 SE_W233B, 63
	wait
	wait
	clearmonbg 3
	blendoff
	end

Move_TRIPLE_KICK: @ 81D071D
	loadsprite 10143
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W233B, 63
	jumpif 0, _81D0742
	jumpif 1, _81D0778
	jump _81D07AE
_81D073D:
	wait
	clearmonbg 3
	blendoff
	end
_81D0742:
	sprite gBattleAnimSpriteTemplate_83D9FA8, 132, 5, -16, -8, 20, 1, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, -16, -16, 1, 2
	createtask sub_80A7E7C, 5, 5, 1, 4, 0, 6, 1
	jump _81D073D
_81D0778:
	sprite gBattleAnimSpriteTemplate_83D9FA8, 132, 5, 8, 8, 20, 1, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 8, 0, 1, 2
	createtask sub_80A7E7C, 5, 5, 1, 4, 0, 6, 1
	jump _81D073D
_81D07AE:
	sprite gBattleAnimSpriteTemplate_83D9FA8, 132, 5, 0, 0, 20, 1, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, -8, 1, 1
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	jump _81D073D

Move_DYNAMIC_PUNCH: @ 81D07E4
	loadsprite 10143
	loadsprite 10135
	loadsprite 10198
	loadsprite 10007
	pause 1
	monbg 3
	setalpha 12, 8
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83D9FA8, 131, 5, 0, 0, 20, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 0, 0, 1, 0
	createtask sub_80A7E7C, 5, 5, 1, 5, 0, 7, 1
	pause 1
	waitsound
	panse_19 SE_W120, 63
	createtask sub_80A7FA0, 5, 5, 1, 5, 0, 28, 1
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 0, 0, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 24, -24, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -16, 16, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -24, -12, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 16, 16, 1, 1
	wait
	clearmonbg 3
	blendoff
	end

Move_COUNTER: @ 81D08AC
	loadsprite 10135
	loadsprite 10143
	monbg 3
	setalpha 12, 8
	createtask sub_80A8500, 2, 5, 0, 18, 6, 1, 4
	panse_19 SE_W233, 192
	wait
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 20, 0, 0, 4
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -15, 18, 1, 0
	panse_19 SE_W233B, 63
	pause 1
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 25, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 3, 5, -15, 18, 8, 1, 0
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, -4, 1, 0
	panse_19 SE_W233B, 63
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 3, 5, 0, -4, 8, 1, 0
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 15, 9, 1, 0
	panse_19 SE_W233B, 63
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 3, 5, 15, 9, 8, 1, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 5
	wait
	clearmonbg 3
	blendoff
	end

Move_VITAL_THROW: @ 81D097B
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W233, 192
	createtask sub_80A8500, 2, 5, 0, 12, 4, 1, 2
	wait
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 20, 0, 0, 4
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 1
	panse_19 SE_W233B, 63
	pause 1
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -24, 0, 0, 4
	wait
	pause 3
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 7
	pause 11
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 10
	wait
	clearmonbg 3
	blendoff
	end

Move_ROCK_SMASH: @ 81D09F6
	loadsprite 10058
	loadsprite 10135
	loadsprite 10143
	monbg 3
	setalpha 12, 8
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83D9FA8, 2, 5, 0, 0, 8, 1, 0
	panse_19 SE_W233B, 63
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 5, 1
	wait
	panse_19 SE_W088, 63
	sprite gBattleAnimSpriteTemplate_83DAC64, 2, 6, 0, 0, 20, 24, 14, 2
	sprite gBattleAnimSpriteTemplate_83DAC64, 2, 6, 5, 0, -20, 24, 14, 1
	sprite gBattleAnimSpriteTemplate_83DAC64, 2, 6, 0, 5, 20, -24, 14, 2
	sprite gBattleAnimSpriteTemplate_83DAC64, 2, 6, -5, 0, -20, -24, 14, 2
	sprite gBattleAnimSpriteTemplate_83DAC64, 2, 6, 0, -5, 30, 18, 8, 2
	sprite gBattleAnimSpriteTemplate_83DAC64, 2, 6, 0, 0, 30, -18, 8, 2
	sprite gBattleAnimSpriteTemplate_83DAC64, 2, 6, 0, 0, -30, 18, 8, 2
	sprite gBattleAnimSpriteTemplate_83DAC64, 2, 6, 0, 0, -30, -18, 8, 2
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 7, 1
	wait
	clearmonbg 3
	blendoff
	end

Move_SUBMISSION: @ 81D0AEE
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W104, 192
	panse_1D SE_W004, 63, 10
	panse_1D SE_W104, 192, 20
	panse_1D SE_W004, 63, 30
	panse_1D SE_W104, 192, 40
	panse_1D SE_W004, 63, 50
	panse_1D SE_W104, 192, 60
	panse_1D SE_W004, 63, 70
	panse_1D SE_W104, 192, 80
	panse_1D SE_W004, 63, 90
	createtask sub_80A8408, 2, 5, 0, -18, 6, 6, 4
	createtask sub_80A8408, 2, 5, 1, 18, 6, 6, 4
	call _81D0B5D
	call _81D0B5D
	call _81D0B5D
	wait
	clearmonbg 3
	blendoff
	end
_81D0B5D:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, -12, 1, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, -12, 8, 1, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 12, 0, 1, 1
	pause 8
	ret

Move_SUNNY_DAY: @ 81D0B91
	loadsprite 10157
	monbg 2
	setalpha 13, 3
	createtask sub_80E2A38, 10, 5, 1921, 1, 0, 6, 32767
	wait
	panse_26 SE_W080, 192, 63, 1, 0
	call _81D0BDD
	call _81D0BDD
	call _81D0BDD
	call _81D0BDD
	wait
	createtask sub_80E2A38, 10, 5, 1921, 1, 6, 0, 32767
	wait
	clearmonbg 2
	blendoff
	end
_81D0BDD:
	sprite gBattleAnimSpriteTemplate_83D95B0, 40
	pause 6
	ret

Move_COTTON_SPORE: @ 81D0BE7
	loadsprite 10158
	monbg 3
	monbgprio_28 1
	panse_1C SE_W077, 63, 18, 10
	call _81D0C07
	call _81D0C07
	call _81D0C07
	wait
	clearmonbg 3
	end
_81D0C07:
	sprite gBattleAnimSpriteTemplate_83D63F8, 2, 5, 0, -20, 85, 80, 0
	pause 12
	sprite gBattleAnimSpriteTemplate_83D63F8, 2, 5, 0, -10, 170, 80, 0
	pause 12
	sprite gBattleAnimSpriteTemplate_83D63F8, 2, 5, 0, -15, 0, 80, 0
	pause 12
	ret

Move_SPORE: @ 81D0C41
	loadsprite 10158
	monbg 3
	setalpha 12, 8
	createtask sub_80CACEC, 2
	panse_1C SE_W077, 63, 16, 11
	call _81D0C6C
	call _81D0C6C
	call _81D0C6C
	wait
	pause 1
	clearmonbg 3
	blendoff
	end
_81D0C6C:
	sprite gBattleAnimSpriteTemplate_83D63F8, 130, 5, 0, -20, 85, 80, 1
	pause 12
	sprite gBattleAnimSpriteTemplate_83D63F8, 130, 5, 0, -10, 170, 80, 1
	pause 12
	sprite gBattleAnimSpriteTemplate_83D63F8, 130, 5, 0, -15, 0, 80, 1
	pause 12
	ret

Move_PETAL_DANCE: @ 81D0CA6
	loadsprite 10159
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W080, 192
	createtask sub_80A8500, 2, 5, 0, 12, 6, 6, 3
	sprite gBattleAnimSpriteTemplate_83D6428, 2, 4, 0, -24, 8, 140
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, 16, -24, 8, 100
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, -16, -24, 8, 100
	pause 15
	sprite gBattleAnimSpriteTemplate_83D6428, 2, 4, 0, -24, 8, 140
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, 32, -24, 8, 100
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, -32, -24, 8, 100
	pause 15
	sprite gBattleAnimSpriteTemplate_83D6428, 2, 4, 0, -24, 8, 140
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, 24, -24, 8, 100
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, -24, -24, 8, 100
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, 16, -24, 0, 100
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, -16, -24, 0, 100
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, 20, -16, 14, 80
	sprite gBattleAnimSpriteTemplate_83D6440, 2, 4, -20, -14, 16, 80
	wait
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 24, 0, 0, 5
	pause 3
	panse_19 SE_W025B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 0
	createtask sub_80A7E7C, 2, 5, 1, 6, 0, 8, 1
	wait
	pause 8
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 7
	wait
	clearmonbg 3
	blendoff
	end

Move_RAZOR_LEAF: @ 81D0DDE
	loadsprite 10063
	loadsprite 10160
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	pause 1
	panse_1C SE_W077, 192, 10, 5
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -3, -2, 10
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -1, -1, 15
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -4, -4, 7
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, 3, -3, 11
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -1, -6, 8
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, 2, -1, 12
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -3, -4, 13
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, 4, -5, 7
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, 2, -6, 11
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -3, -5, 8
	pause 60
	panse_19 SE_W013B, 192
	sprite gBattleAnimSpriteTemplate_83D64E4, 131, 7, 20, -10, 20, 0, 22, 20, 1
	sprite gBattleAnimSpriteTemplate_83D64E4, 131, 7, 20, -10, 20, 0, 22, -20, 1
	pause 20
	panse_19 SE_W013, 63
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	createtask sub_80A7FA0, 2, 5, 3, 2, 0, 8, 1
	wait
	clearmonbg 3
	blendoff
	end

Move_ANCIENT_POWER: @ 81D0EE5
	loadsprite 10058
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 4, 4, 1, 10, 1
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, 20, 32, -48, 50, 2
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, 0, 32, -38, 25, 5
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, 32, 32, -28, 40, 3
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, -20, 32, -48, 50, 2
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, 20, 32, -28, 60, 1
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, 0, 32, -28, 30, 4
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 30, 1
	panse_19 SE_W082, 192
	pause 10
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, 15, 32, -48, 25, 5
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, -10, 32, -42, 30, 4
	pause 10
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, 0, 32, -42, 25, 5
	sprite gBattleAnimSpriteTemplate_83DAD60, 2, 5, -25, 32, -48, 30, 4
	wait
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 16, 0, 0, 4
	pause 3
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 1
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 6, 1
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 7
	wait
	clearmonbg 3
	blendoff
	end

Move_OCTAZOOKA: @ 81D100D
	loadsprite 10030
	loadsprite 10017
	panse_19 SE_W025B, 192
	sprite gBattleAnimSpriteTemplate_83D6F08, 130, 6, 20, 0, 0, 0, 20, 0
	wait
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D6F3C, 130, 4, 8, 8, 1, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6F3C, 130, 4, -8, -8, 1, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6F3C, 130, 4, 8, -8, 1, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83D6F3C, 130, 4, -8, 8, 1, 0
	wait
	end

Move_MIST: @ 81D1073
	loadsprite 10144
	monbg 2
	setalpha 12, 8
	panse_1C SE_W054, 192, 20, 15
	call _81D10BE
	call _81D10BE
	call _81D10BE
	call _81D10BE
	call _81D10BE
	call _81D10BE
	call _81D10BE
	pause 32
	createtask sub_80E1F8C, 2, 6, 10, 8, 2, 0, 14, 32767
	wait
	clearmonbg 2
	blendoff
	end
_81D10BE:
	sprite gBattleAnimSpriteTemplate_83D9D3C, 2, 6, 0, -24, 48, 240, 0, 1
	pause 7
	ret

Move_HAZE: @ 81D10D4
	wait
	panse_19 SE_W114, 0
	createtask sub_80D80E0, 5
	pause 30
	createtask sub_80E2A38, 10, 5, 1920, 2, 0, 16, 0
	pause 90
	createtask sub_80E2A38, 10, 5, 1920, 1, 16, 0, 0
	end

Move_FIRE_PUNCH: @ 81D1107
	loadsprite 10143
	loadsprite 10029
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 9, 31
	sprite gBattleAnimSpriteTemplate_83D9478, 129, 1, 0
	sprite gBattleAnimSpriteTemplate_83D9478, 129, 1, 64
	sprite gBattleAnimSpriteTemplate_83D9478, 129, 1, 128
	sprite gBattleAnimSpriteTemplate_83D9478, 129, 1, 196
	panse_19 SE_W172, 63
	wait
	sprite gBattleAnimSpriteTemplate_83D9FA8, 131, 5, 0, 0, 8, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 0, 0, 1, 1
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 15, 1
	call _81D11A2
	pause 4
	panse_19 SE_W007, 63
	wait
	createtask sub_80E2A38, 10, 5, 4, 0, 9, 0, 31
	wait
	clearmonbg 3
	blendoff
	end
_81D11A2:
	sprite gBattleAnimSpriteTemplate_83D9490, 129, 5, 0, 10, 192, 176, 40
	sprite gBattleAnimSpriteTemplate_83D9490, 129, 5, 0, 10, -192, 240, 40
	sprite gBattleAnimSpriteTemplate_83D9490, 129, 5, 0, 10, 192, -160, 40
	sprite gBattleAnimSpriteTemplate_83D9490, 129, 5, 0, 10, -192, -112, 40
	sprite gBattleAnimSpriteTemplate_83D9490, 129, 5, 0, 10, 160, 48, 40
	sprite gBattleAnimSpriteTemplate_83D9490, 129, 5, 0, 10, -224, -32, 40
	sprite gBattleAnimSpriteTemplate_83D9490, 129, 5, 0, 10, 112, -128, 40
	ret

Move_LEER: @ 81D121A
	loadsprite 10027
	monbg 0
	monbgprio_28 0
	setalpha 8, 8
	panse_19 SE_W043, 192
	sprite gBattleAnimSpriteTemplate_84022B0, 2, 2, 24, -12
	createtask sub_80A8D34, 5, 5, -5, -5, 10, 0, 1
	wait
	pause 10
	createtask sub_80A7FA0, 2, 5, 1, 1, 0, 9, 1
	createtask sub_80A7FA0, 2, 5, 3, 1, 0, 9, 1
	wait
	clearmonbg 0
	blendoff
	pause 1
	wait
	end

Move_DREAM_EATER: @ 81D1271
	loadsprite 10147
	loadsprite 10031
	monbg 3
	monbgprio_2A 1
	panse_19 SE_W060, 192
	call Unknown_81D61E7
	setalpha 8, 8
	panse_19 SE_W107, 63
	createtask sub_80A7E7C, 2, 5, 1, 5, 0, 15, 1
	createtask sub_80A8D34, 5, 5, -6, -6, 15, 1, 1
	wait
	setalpha 12, 8
	createtask sub_80A7E7C, 2, 5, 1, 0, 2, 25, 1
	call _81D12DB
	wait
	pause 15
	call Unknown_81D5EF5
	wait
	clearmonbg 3
	blendoff
	pause 1
	call Unknown_81D61F3
	end
_81D12DB:
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 5, -18, -40, 35
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 20, 39
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 28, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 40, 39
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -32, 26
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, -15, -16, 36
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, -15, -16, 36
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 16, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -40, 26
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -5, 15, 36, 33
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 10, -5, -8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, -10, 20, 20, 39
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 0, 5, 8, 26
	sprite gBattleAnimSpriteTemplate_83D637C, 3, 4, 5, -18, -20, 35
	pause 4
	ret

Move_POISON_GAS: @ 81D1474
	loadsprite 10172
	loadsprite 10150
	pause 0
	monbg 3
	monbgprio_29
	setalpha 12, 8
	pause 0
	panse_19 SE_W054, 192
	sprite gBattleAnimSpriteTemplate_83D9DAC, 128, 8, 64, 0, 0, -32, -6, 4192, 1072, 0
	pause 4
	panse_19 SE_W054, 192
	sprite gBattleAnimSpriteTemplate_83D9DAC, 128, 8, 64, 0, 0, -32, -6, 4192, 1072, 0
	pause 4
	panse_19 SE_W054, 192
	sprite gBattleAnimSpriteTemplate_83D9DAC, 128, 8, 64, 0, 0, -32, -6, 4192, 1072, 0
	pause 4
	panse_19 SE_W054, 192
	sprite gBattleAnimSpriteTemplate_83D9DAC, 128, 8, 64, 0, 0, -32, -6, 4192, 1072, 0
	pause 4
	panse_19 SE_W054, 192
	sprite gBattleAnimSpriteTemplate_83D9DAC, 128, 8, 64, 0, 0, -32, -6, 4192, 1072, 0
	pause 4
	panse_19 SE_W054, 192
	sprite gBattleAnimSpriteTemplate_83D9DAC, 128, 8, 64, 0, 0, -32, -6, 4192, 1072, 0
	pause 40
	panse_1C SE_W054, 63, 28, 6
	createtask sub_80E1F8C, 2, 6, 4, 6, 2, 0, 12, 26650
	wait
	blendoff
	clearmonbg 3
	pause 0
	end

Move_BIND: @ 81D1552
	createtask sub_80A8B88, 5, 5, 0, 6, 3328, 4, 0
	jump _81D1568
_81D1568:
	panse_19 SE_W020, 63
	call _81D1578
	call _81D1578
	wait
	end
_81D1578:
	createtask sub_80A8D34, 5, 5, 10, -5, 5, 1, 0
	pause 16
	ret

Move_WRAP: @ 81D158C
	createtask sub_80A8500, 2, 5, 0, 6, 4, 2, 4
	jump _81D1568

Move_PSYBEAM: @ 81D15A2
	loadsprite 10163
	panse_19 SE_W060, 192
	call Unknown_81D61E7
	createtask_1F sub_812B058, 7, 200, -64, 63, 3, 4, 0, 15
	call _81D1626
	call _81D1626
	createtask sub_80A8B88, 5, 5, 0, 6, 2048, 4, 1
	createtask sub_80E1F8C, 2, 6, 4, 2, 2, 0, 12, 32351
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	call _81D1626
	wait
	pause 1
	call Unknown_81D61F3
	end
_81D1626:
	sprite gBattleAnimSpriteTemplate_83DA784, 130, 6, 16, 0, 0, 0, 13, 0
	pause 4
	ret

Move_HYPNOSIS: @ 81D163C
	loadsprite 10163
	call Unknown_81D61E7
	call _81D166F
	call _81D166F
	call _81D166F
	createtask sub_80E1F8C, 2, 6, 4, 2, 2, 0, 12, 32351
	wait
	pause 1
	call Unknown_81D61F3
	end
_81D166F:
	panse_19 SE_W048, 192
	sprite gBattleAnimSpriteTemplate_83DA784, 130, 6, 0, 8, 0, 8, 27, 0
	sprite gBattleAnimSpriteTemplate_83DA784, 130, 6, 16, -8, 0, -8, 27, 0
	pause 6
	ret

Move_PSYWAVE: @ 81D169C
	loadsprite 10165
	panse_19 SE_W060, 192
	call Unknown_81D61E7
	createtask sub_80D3630, 5, 1, 100
	createtask_1F sub_812B058, 7, 203, -64, 63, 2, 9, 0, 10
	call _81D16FF
	call _81D16FF
	createtask sub_80E1F8C, 2, 6, 4, 1, 4, 0, 12, 32351
	call _81D16FF
	call _81D16FF
	call _81D16FF
	call _81D16FF
	wait
	pause 1
	call Unknown_81D61F3
	end
_81D16FF:
	sprite gBattleAnimSpriteTemplate_83D9280, 131, 4, 10, 10, 0, 16
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9280, 131, 4, 10, 10, 0, 16
	pause 4
	ret

Move_ZAP_CANNON: @ 81D1722
	loadsprite 10171
	loadsprite 10011
	panse_19 SE_W086, 192
	sprite gBattleAnimSpriteTemplate_83D9874, 131, 6, 10, 0, 0, 0, 30, 0
	sprite gBattleAnimSpriteTemplate_83D98A0, 132, 7, 10, 0, 16, 30, 0, 40, 0
	sprite gBattleAnimSpriteTemplate_83D98A0, 132, 7, 10, 0, 16, 30, 64, 40, 1
	sprite gBattleAnimSpriteTemplate_83D98A0, 132, 7, 10, 0, 16, 30, 128, 40, 0
	sprite gBattleAnimSpriteTemplate_83D98A0, 132, 7, 10, 0, 16, 30, 192, 40, 2
	sprite gBattleAnimSpriteTemplate_83D98A0, 132, 7, 10, 0, 8, 30, 32, 40, 0
	sprite gBattleAnimSpriteTemplate_83D98A0, 132, 7, 10, 0, 8, 30, 96, 40, 1
	sprite gBattleAnimSpriteTemplate_83D98A0, 132, 7, 10, 0, 8, 30, 160, 40, 0
	sprite gBattleAnimSpriteTemplate_83D98A0, 132, 7, 10, 0, 8, 30, 224, 40, 2
	wait
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 5, 1
	pause 15
	panse_1D SE_W085B, 63, 19
	call Unknown_81D6100
	wait
	end

Move_STEEL_WING: @ 81D1807
	loadsprite 10009
	loadsprite 10135
	panse_1C SE_W231, 192, 28, 2
	createtask sub_80E0A4C, 5, 3, 0, 0, 0
	wait
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	panse_1C SE_W017, 192, 20, 2
	createtask sub_80A8408, 2, 5, 0, 12, 4, 1, 4
	createtask sub_80DA09C, 5, 2, 1, 70
	sprite gBattleAnimSpriteTemplate_83DA3B4, 2, 5, -25, 0, 0, 0, 20
	sprite gBattleAnimSpriteTemplate_83DA3B4, 2, 5, 25, 0, 0, 0, 20
	pause 24
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 24, 0, 0, 9
	pause 17
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 16, 0, 1, 1
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -16, 0, 1, 1
	panse_19 SE_W013, 63
	wait
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 11
	wait
	clearmonbg 3
	blendoff
	end

Move_IRON_TAIL: @ 81D18B6
	loadsprite 10135
	panse_1C SE_W231, 192, 28, 2
	createtask sub_80E0A4C, 5, 3, 1, 0, 0
	wait
	monbg 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 4
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W233B, 63
	wait
	createtask sub_80E0E24, 5, 2, 0, 1
	clearmonbg 1
	blendoff
	wait
	end

Move_POISON_TAIL: @ 81D1914
	loadsprite 10135
	loadsprite 10150
	panse_1C SE_W231, 192, 28, 2
	createtask sub_80E0A4C, 5, 3, 1, 1, 23768
	wait
	monbg 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 4
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	panse_19 SE_W233B, 63
	wait
	createtask sub_80E0E24, 5, 2, 0, 1
	clearmonbg 1
	blendoff
	call Unknown_81D5F87
	wait
	end

Move_METAL_CLAW: @ 81D197A
	loadsprite 10039
	panse_1C SE_W231, 192, 28, 2
	createtask sub_80E0A4C, 5, 3, 0, 0, 0
	wait
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	pause 2
	panse_19 SE_W013, 63
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, -10, -10, 0
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, -10, 10, 0
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 5, -4, 1, 10, 3, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	pause 2
	panse_19 SE_W013, 63
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, 10, -10, 1
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, 10, 10, 1
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 5, -4, 1, 10, 3, 1
	wait
	end

Move_NIGHT_SHADE: @ 81D1A0D
	monbg 0
	monbgprio_28 0
	panse_19 SE_W060, 192
	fadetobg 2
	waitbgfadein
	pause 10
	panse_19 SE_W043, 192
	createtask sub_80DDDF0, 5, 1, 85
	pause 70
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 12, 1
	createtask sub_80E1F8C, 2, 6, 4, 0, 2, 0, 13, 0
	wait
	clearmonbg 0
	pause 1
	restorebg
	waitbgfadein
	end

Move_EGG_BOMB: @ 81D1A55
	loadsprite 10198
	loadsprite 10175
	panse_19 SE_W039, 192
	sprite gBattleAnimSpriteTemplate_83D7594, 130, 6, 10, 0, 0, 0, 25, -32
	wait
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 16, 1
	sprite gBattleAnimSpriteTemplate_83D7828, 132, 4, 6, 5, 1, 0
	panse_19 SE_W120, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83D7828, 132, 4, -16, -15, 1, 0
	panse_19 SE_W120, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83D7828, 132, 4, 16, -5, 1, 0
	panse_19 SE_W120, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83D7828, 132, 4, -12, 18, 1, 0
	panse_19 SE_W120, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83D7828, 132, 4, 0, 5, 1, 0
	panse_19 SE_W120, 63
	pause 3
	wait
	end

Move_SHADOW_BALL: @ 81D1AEF
	loadsprite 10176
	fadetobg 2
	waitbgfadein
	pause 15
	createtask_1F sub_812B058, 7, 168, -64, 63, 5, 5, 0, 5
	sprite gBattleAnimSpriteTemplate_83DAEA8, 130, 3, 16, 16, 8
	wait
	panse_19 SE_W028, 63
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 8, 1
	wait
	restorebg
	waitbgfadein
	end

Move_LICK: @ 81D1B32
	loadsprite 10177
	pause 15
	panse_19 SE_W122, 63
	sprite gBattleAnimSpriteTemplate_83DAEDC, 130, 2, 0, 0
	createtask sub_80A7FA0, 2, 5, 1, 1, 0, 16, 1
	wait
	end

Move_FOCUS_ENERGY: @ 81D1B59
	loadsprite 10184
	panse_19 SE_W082, 192
	call _81CBAC7
	pause 8
	createtask sub_80E1F8C, 2, 6, 2, 2, 2, 0, 11, 32767
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 32, 1
	call _81CBAC7
	pause 8
	call _81CBAC7
	wait
	end

Move_BIDE: @ 81D1B99
	ifelse _81D1BA3, _81D1BCF
	end
_81D1BA3:
	panse_1C SE_W036, 192, 9, 2
	createtask sub_80E1F8C, 2, 6, 2, 2, 2, 0, 11, 31
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 32, 1
	wait
	end
_81D1BCF:
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_1C SE_W036, 192, 9, 2
	createtask sub_80E2A38, 10, 5, 2, 2, 0, 11, 31
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 32, 1
	wait
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 24, 0, 0, 4
	wait
	createtask sub_80A8154, 2, 5, 0, 2, 0, 12, 1
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 16, 1
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 1, 4, 18, -8, 1, 1
	pause 5
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 1, 4, -18, 8, 1, 1
	pause 5
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 1, 4, -8, -5, 1, 1
	wait
	pause 5
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 7
	wait
	createtask sub_80E2A38, 10, 5, 2, 2, 11, 0, 31
	wait
	clearmonbg 3
	blendoff
	end

Move_STRING_SHOT: @ 81D1C98
	loadsprite 10179
	loadsprite 10180
	monbg 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DB3C4, 5, 5, 1, 2, 0, 9, 0
	wait
	panse_1C SE_W081, 192, 9, 6
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
	wait
	panse_19 SE_W081B, 63
	sprite gBattleAnimSpriteTemplate_83DAB40, 130, 2, 0, 10
	pause 4
	sprite gBattleAnimSpriteTemplate_83DAB40, 130, 2, 0, -2
	pause 4
	sprite gBattleAnimSpriteTemplate_83DAB40, 130, 2, 0, 22
	wait
	clearmonbg 3
	pause 1
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 5, 5, 1, 2, 9, 0, 0
	end
_81D1D56:
	sprite gBattleAnimSpriteTemplate_83DAB28, 130, 5, 20, 0, 512, 20, 1
	pause 1
	ret

Move_SPIDER_WEB: @ 81D1D6A
	loadsprite 10181
	loadsprite 10180
	monbg 3
	pause 0
	sprite gBattleAnimSpriteTemplate_83DB3C4, 5, 5, 1, 2, 0, 9, 0
	wait
	monbgprio_28 1
	panse_1C SE_W081, 192, 9, 6
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
	wait
	panse_19 SE_W081B, 63
	sprite gBattleAnimSpriteTemplate_83DAB74, 2
	wait
	clearmonbg 3
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 5, 5, 1, 2, 9, 0, 0
	end
_81D1DF7:
	sprite gBattleAnimSpriteTemplate_83DAB28, 130, 5, 20, 0, 512, 20, 0
	pause 1
	ret

Move_RAZOR_WIND: @ 81D1E0B
	ifelse _81D1E16, _81D1E66
_81D1E14:
	wait
	end
_81D1E16:
	loadsprite 10009
	panse_19 SE_W016, 192
	sprite gBattleAnimSpriteTemplate_83D765C, 2, 7, 32, 0, 16, 16, 0, 7, 40
	sprite gBattleAnimSpriteTemplate_83D765C, 2, 7, 32, 0, 16, 16, 85, 7, 40
	sprite gBattleAnimSpriteTemplate_83D765C, 2, 7, 32, 0, 16, 16, 170, 7, 40
	wait
	panse_19 SE_W016B, 192
	jump _81D1E14
_81D1E66:
	loadsprite 10154
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W013B, 192
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 14, 8, 0, 0, 22, 2, 1
	pause 2
	panse_19 SE_W013B, 192
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 14, -8, 16, 14, 22, 1, 1
	pause 2
	panse_19 SE_W013B, 192
	sprite gBattleAnimSpriteTemplate_83DA3E4, 2, 7, 14, 12, -16, -14, 22, 0, 1
	pause 17
	panse_19 SE_W013, 63
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 10, 1
	createtask sub_80A7FA0, 2, 5, 3, 2, 0, 10, 1
	wait
	clearmonbg 1
	blendoff
	jump _81D1E14

Move_DISABLE: @ 81D1EF1
	loadsprite 10071
	monbg 1
	monbgprio_28 1
	setalpha 8, 8
	panse_19 SE_W197, 192
	sprite gBattleAnimSpriteTemplate_83930F4, 13, 2, 24, -16
	wait
	createtask sub_80D03C4, 5
	panse_1C SE_W020, 63, 15, 4
	wait
	pause 1
	clearmonbg 1
	blendoff
	end

Move_RECOVER: @ 81D1F1F
	loadsprite 10147
	loadsprite 10031
	monbg 2
	setalpha 12, 8
	panse_1C SE_W025, 192, 13, 3
	createtask sub_80E1F8C, 2, 6, 2, 0, 6, 0, 11, 12287
	call _81D1F5F
	call _81D1F5F
	call _81D1F5F
	wait
	clearmonbg 2
	blendoff
	pause 1
	call Unknown_81D5EF5
	wait
	end
_81D1F5F:
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 40, -10, 13
	pause 3
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -35, -10, 13
	pause 3
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 15, -40, 13
	pause 3
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -10, -32, 13
	pause 3
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 25, -20, 13
	pause 3
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, -40, -20, 13
	pause 3
	sprite gBattleAnimSpriteTemplate_83D62EC, 2, 3, 5, -40, 13
	pause 3
	ret

Move_MIMIC: @ 81D1FC9
	loadsprite 10147
	monbg_22 3
	setalpha 11, 5
	panse_1B SE_W107, 63, 192, 253, 0
	createtask sub_80CB340, 5, 2, 128, 24
	pause 15
	sprite gBattleAnimSpriteTemplate_83D65E8, 130, 2, -12, 24
	pause 10
	setvar 7, -1
	wait
	panse_19 SE_W036, 192
	createtask sub_80E1F8C, 2, 6, 2, 0, 2, 0, 11, 32767
	wait
	clearmonbg_23 3
	blendoff
	end

Move_CONSTRICT: @ 81D2013
	loadsprite 10186
	panse_1C SE_W010, 63, 6, 4
	sprite gBattleAnimSpriteTemplate_83D65A0, 132, 4, 0, 16, 0, 2
	pause 7
	sprite gBattleAnimSpriteTemplate_83D65A0, 131, 4, 0, 0, 0, 2
	sprite gBattleAnimSpriteTemplate_83D65A0, 130, 4, 0, 8, 1, 2
	pause 7
	sprite gBattleAnimSpriteTemplate_83D65A0, 131, 4, 0, -8, 1, 2
	pause 8
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 6, 1
	pause 20
	panse_19 SE_W020, 63
	setvar 7, -1
	wait
	end

Move_CURSE: @ 81D207B
	ifelse _81D2084, _81D2101
_81D2084:
	loadsprite 10199
	loadsprite 10200
	monbg 2
	createtask sub_80DECB0, 5
	wait
	pause 20
	sprite gBattleAnimSpriteTemplate_83DAF20, 2
	pause 60
	call _81D20EB
	pause 41
	call _81D20EB
	pause 41
	call _81D20EB
	wait
	clearmonbg 2
	pause 1
	monbg 3
	panse_19 SE_W171, 63
	sprite gBattleAnimSpriteTemplate_83DAF38, 130
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 14, 1
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 16, 0, 0
	wait
	clearmonbg 3
	end
_81D20EB:
	createtask sub_80A7FA0, 2, 5, 0, 4, 0, 10, 0
	panse_19 SE_W020, 192
	ret
_81D2101:
	createtask sub_80A8B88, 5, 5, 0, 10, 1536, 3, 0
	wait
	pause 10
	call _81D211C
	wait
	end
_81D211C:
	panse_19 SE_W082, 192
	createtask sub_80E2F2C, 5
	createtask sub_80E1F8C, 5, 6, 2, 4, 2, 0, 10, 31
	ret

Move_SOFT_BOILED: @ 81D213B
	loadsprite 10202
	loadsprite 10203
	loadsprite 10031
	monbg 2
	panse_19 SE_W039, 192
	createtask sub_80A7E7C, 2, 5, 0, 0, 2, 6, 1
	sprite gBattleAnimSpriteTemplate_83D78BC, 4, 3, 0, 16, 0
	sprite gBattleAnimSpriteTemplate_83D78BC, 4, 3, 0, 16, 1
	pause 120
	pause 7
	panse_19 SE_W030, 192
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 31, 3, 10, 0, 31500
	sprite gBattleAnimSpriteTemplate_83D7928, 3, 4, 31, 16, 0, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83D7928, 3, 4, 31, 16, 0, 1
	pause 60
	setvar 7, -1
	wait
	clearmonbg 2
	call Unknown_81D5F3E
	end

Move_HEAL_BELL: @ 81D21BD
	loadsprite 10205
	loadsprite 10206
	loadsprite 10203
	loadsprite 10049
	createtask sub_80E2A38, 10, 5, 10, 0, 0, 10, 32767
	wait
	createtask sub_80D1ADC, 5
	sprite gBattleAnimSpriteTemplate_83D7A44, 2, 4, 0, -24, 0, 1
	pause 12
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, 48, -18, 35, 0, 0
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, -48, 20, 30, 1, 1
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, -38, -29, 30, 2, 2
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, 36, 18, 30, 3, 3
	call _81D2372
	pause 33
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, 19, 26, 35, 4, 4
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, -34, -12, 30, 5, 5
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, 41, -20, 34, 6, 6
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, -15, 26, 32, 7, 0
	call _81D2372
	pause 33
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, -48, 18, 31, 0, 2
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, 48, -20, 30, 2, 5
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, 38, 29, 33, 4, 3
	sprite gBattleAnimSpriteTemplate_83D7A68, 40, 7, 0, -24, -36, -18, 30, 6, 1
	call _81D2372
	wait
	createtask sub_80D1B80, 5
	wait
	panse_19 SE_W234, 192
	sprite gBattleAnimSpriteTemplate_83D6CA0, 16, 7, -15, 0, 0, 0, 32, 60, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83D6CA0, 16, 7, 12, -5, 0, 0, 32, 60, 1
	wait
	panse_19 SE_REAPOKE, 192
	createtask sub_80E2A7C, 10, 5, 4, 3, 10, 0, 31500
	createtask sub_80E2A38, 10, 5, 10, 3, 10, 0, 32767
	sprite gBattleAnimSpriteTemplate_83D7974, 16, 4, 0, 0, 0, 1
	end
_81D2372:
	createtask sub_80E2A7C, 10, 5, 4, 3, 8, 0, 31500
	createtask sub_80E2A38, 10, 5, 10, 3, 2, 10, 32767
	sprite gBattleAnimSpriteTemplate_83D7928, 40, 4, 0, -24, 0, 1
	panse_19 SE_W215, 192
	ret

Move_FAKE_OUT: @ 81D23A8
	panse_19 SE_W260, 0
	createtask sub_80D1CD0, 5
	wait
	panse_19 SE_W166, 63
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 5, 1
	createtask sub_80D1E38, 3
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 16, 0, 32767
	end

Move_SCARY_FACE: @ 81D23E3
	loadsprite 10218
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 27, 3, 0, 16, 0
	panse_19 SE_W060, 192
	wait
	pause 10
	panse_19 SE_W043, 192
	createtask sub_80D23B4, 5
	pause 13
	sprite gBattleAnimSpriteTemplate_83D7B94, 0, 2, -16, -8
	sprite gBattleAnimSpriteTemplate_83D7B94, 0, 2, 16, -8
	wait
	createtask sub_80D60B4, 3, 3, 20, 1, 0
	panse_19 SE_W081B, 63
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 27, 3, 16, 0, 0
	wait
	end

Move_SWEET_KISS: @ 81D2446
	loadsprite 10216
	loadsprite 10220
	sprite gBattleAnimSpriteTemplate_83D7BB8, 130, 2, 16, -48
	panse_19 SE_W215, 63
	pause 23
	panse_19 SE_W215, 63
	pause 23
	panse_19 SE_W215, 63
	wait
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, 160, -30
	panse_19 SE_W213, 63
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, -256, -42
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, 128, -14
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, 416, -38
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, -128, -22
	sprite gBattleAnimSpriteTemplate_83D7AC8, 131, 2, -384, -31
	end

Move_LOVELY_KISS: @ 81D24AF
	loadsprite 10219
	loadsprite 10221
	sprite gBattleAnimSpriteTemplate_83D7C00, 130, 2, 0, -24
	panse_19 SE_W060B, 63
	wait
	panse_19 SE_W213, 63
	sprite gBattleAnimSpriteTemplate_83D7BD0, 131, 2, -256, -42
	sprite gBattleAnimSpriteTemplate_83D7BD0, 131, 2, 128, -14
	sprite gBattleAnimSpriteTemplate_83D7BD0, 131, 2, 416, -38
	sprite gBattleAnimSpriteTemplate_83D7BD0, 131, 2, -128, -22
	end

Move_FURY_SWIPES: @ 81D24F6
	loadsprite 10222
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 5, 5
	pause 4
	panse_19 SE_W010, 63
	sprite gBattleAnimSpriteTemplate_83D7C48, 130, 3, 16, 0, 1
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 5, 1
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FB0, 130, 2, 5, 5
	pause 4
	panse_19 SE_W010, 63
	sprite gBattleAnimSpriteTemplate_83D7C48, 130, 3, -16, 0, 0
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 7, 1
	end

Move_INGRAIN: @ 81D255A
	loadsprite 10223
	loadsprite 10147
	sprite gBattleAnimSpriteTemplate_83D6658, 2, 5, 16, 26, -1, 2, 150
	panse_19 SE_W010, 192
	pause 10
	sprite gBattleAnimSpriteTemplate_83D6658, 2, 5, -32, 20, 1, 1, 140
	panse_19 SE_W010, 192
	pause 10
	sprite gBattleAnimSpriteTemplate_83D6658, 2, 5, 32, 22, 1, 0, 130
	panse_19 SE_W010, 192
	pause 10
	sprite gBattleAnimSpriteTemplate_83D6658, 2, 5, -16, 25, -1, 3, 120
	panse_19 SE_W010, 192
	pause 40
	sprite gBattleAnimSpriteTemplate_83D6698, 3, 5, 32, 26, -1, 3, 30
	pause 5
	panse_19 SE_W145C, 192
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6698, 3, 5, -48, 20, 1, 2, 30
	panse_19 SE_W145C, 192
	pause 5
	panse_19 SE_W145C, 192
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6698, 3, 5, 48, 26, -2, 3, 18
	panse_19 SE_W145C, 192
	pause 10
	wait
	end

Move_PRESENT: @ 81D260B
	loadsprite 10224
	createtask sub_812C960, 2
	sprite gBattleAnimSpriteTemplate_83D671C, 130, 5, 0, -5, 10, 2, -1
	panse_19 SE_W039, 192
	pause 14
	panse_19 SE_W145B, 192
	pause 14
	panse_19 SE_W145B, 0
	pause 20
	panse_19 SE_W145B, 63
	wait
	jumpvareq 7, 0, _81D264E
	jumpvareq 7, 1, _81D26B9
	end
_81D264E:
	loadsprite 10198
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 131, 4, 0, 0, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 131, 4, 24, -24, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 131, 4, -16, 16, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 131, 4, -24, -12, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 131, 4, 16, 16, 1, 1
	end
_81D26B9:
	loadsprite 10195
	loadsprite 10031
	panse_19 SE_W234, 63
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, -16, 32, -3, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, 16, 32, -3, -1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, 32, 32, -3, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, -32, 32, -3, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, 0, 32, -3, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, -8, 32, -3, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, -8, 32, -3, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, 24, 32, -3, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D6764, 132, 4, -24, 32, -3, 1
	wait
	waitsound
	call Unknown_81D5F3E
	end

Move_BATON_PASS: @ 81D2762
	loadsprite 10226
	panse_19 SE_W226, 192
	createtask sub_80E1F8C, 2, 6, 31, 1, 2, 0, 11, 31455
	sprite gBattleAnimSpriteTemplate_84024D0, 2
	end

Move_PERISH_SONG: @ 81D2784
	loadsprite 10206
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 1, 1, 16
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 2, 1, 32
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 3, 2, 48
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 4, 2, 64
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 5, 0, 80
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 6, 0, 96
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 7, 1, 112
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 8, 2, 128
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 9, 0, 144
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 10, 2, 160
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 11, 0, 176
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 12, 1, 192
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 13, 3, 208
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 14, 3, 224
	sprite gBattleAnimSpriteTemplate_83D7D1C, 4, 3, 15, 0, 240
	sprite gBattleAnimSpriteTemplate_83D7D34, 4, 3, 15, 0, 0
	pause 20
	panse_1B SE_W195, 192, 63, 2, 0
	pause 80
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 0, 16, 0
	createtask sub_80E0E24, 5, 2, 4, 0
	createtask sub_80E0E24, 5, 2, 5, 0
	createtask sub_80E0E24, 5, 2, 6, 0
	createtask sub_80E0E24, 5, 2, 7, 0
	pause 100
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 16, 0, 0
	createtask sub_80E0E24, 5, 2, 4, 1
	createtask sub_80E0E24, 5, 2, 5, 1
	createtask sub_80E0E24, 5, 2, 6, 1
	createtask sub_80E0E24, 5, 2, 7, 1
	wait
	end

Move_SLEEP_TALK: @ 81D28ED
	loadsprite 10228
	createtask sub_80A8B88, 5, 5, 0, 4, 4096, 2, 0
	pause 20
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -1
	panse_19 SE_W173, 192
	pause 6
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -1
	pause 6
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -1
	pause 20
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -5
	panse_19 SE_W173, 192
	pause 6
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -5
	pause 6
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -5
	pause 20
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -3
	panse_19 SE_W173, 192
	pause 6
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -3
	pause 6
	sprite gBattleAnimSpriteTemplate_84022F0, 130, 4, 0, 20, 5, -3
	wait
	end

Move_HYPER_FANG: @ 81D29A8
	loadsprite 10192
	panse_19 SE_W044, 63
	pause 1
	pause 2
	createtask sub_80E4200, 2
	jumpvareq 7, 1, _81D2A08
	createtask sub_812C924, 2
	jumpvareq 7, 0, _81D29FA
	jump _81D2A01
_81D29D6:
	waitbgfadeout
	sprite gBattleAnimSpriteTemplate_840233C, 130
	waitbgfadein
	createtask sub_80A7E7C, 3, 5, 1, 0, 10, 10, 1
	panse_19 SE_W043, 63
	pause 20
	restorebg
	waitbgfadein
	wait
	end
_81D29FA:
	fadetobg 4
	jump _81D29D6
_81D2A01:
	fadetobg 5
	jump _81D29D6
_81D2A08:
	fadetobg 6
	jump _81D29D6

Move_TRI_ATTACK: @ 81D2A0F
	loadsprite 10230
	sprite gBattleAnimSpriteTemplate_8402458, 130, 2, 16, 0
	panse_19 SE_W161, 192
	pause 20
	panse_19 SE_W161, 192
	pause 20
	createtask_1F sub_812B058, 7, 220, -64, 63, 5, 6, 0, 7
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 16, 0
	pause 16
	loadsprite 10033
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, -1, 0
	panse_19 SE_W172B, 63
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 0, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, -1, -1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 2, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 1, -1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, -1, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 1, -2
	pause 1
	sprite gBattleAnimSpriteTemplate_83D9520, 130, 6, 0, 0, 30, 30, 3, 1
	pause 2
	createtask sub_80D60B4, 2, 4, 20, 3, 1, 1
	wait
	loadsprite 10037
	createtask sub_80E2324, 2, 3, 257, 257, 257
	panse_19 SE_W161B, 63
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 0, -48
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 0, -16
	pause 1
	sprite gBattleAnimSpriteTemplate_83D97D0, 130, 2, 0, 16
	pause 20
	createtask sub_80D60B4, 2, 4, 20, 3, 1, 0
	pause 2
	createtask sub_80E2324, 2, 3, 257, 257, 257
	wait
	loadsprite 10141
	call Unknown_81D5C36
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 16, 0, 0
	wait
	end

Move_WILL_O_WISP: @ 81D2B83
	loadsprite 10232
	loadsprite 10231
	monbg 3
	monbgprio_2A 1
	panse_19 SE_W052, 192
	panse_1D SE_W052, 192, 10
	createtask sub_812B374, 2, 4, -64, -64, 1, 0
	sprite gBattleAnimSpriteTemplate_83D974C, 2, 3, 0, 0, 0
	pause 3
	sprite gBattleAnimSpriteTemplate_83D974C, 3, 3, 0, 0, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83D974C, 4, 3, 0, 0, 2
	pause 3
	sprite gBattleAnimSpriteTemplate_83D974C, 4, 3, 0, 0, 3
	pause 40
	createtask sub_812B374, 2, 4, -64, 63, 2, 0
	wait
	monbgprio_29
	panse_19 SE_W172B, 63
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 13, 1
	sprite gBattleAnimSpriteTemplate_83D977C, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83D977C, 2, 1, 42
	sprite gBattleAnimSpriteTemplate_83D977C, 2, 1, 84
	sprite gBattleAnimSpriteTemplate_83D977C, 2, 1, 126
	sprite gBattleAnimSpriteTemplate_83D977C, 2, 1, 168
	sprite gBattleAnimSpriteTemplate_83D977C, 2, 1, 210
	wait
	clearmonbg 3
	end

Move_ENCORE: @ 81D2C41
	loadsprite 10227
	loadsprite 10247
	createtask sub_812CC44, 2
	createtask sub_80E2D78, 2, 5, 248, 3, 0, 10, 0
	wait
	sprite gBattleAnimSpriteTemplate_840238C, 130, 2, 0, -8
	sprite gBattleAnimSpriteTemplate_84023A4, 2, 5, -2, 0, 0, 0, 9
	sprite gBattleAnimSpriteTemplate_84023A4, 2, 5, 2, 0, 1, 0, 9
	sprite gBattleAnimSpriteTemplate_84023BC, 3, 5, -2, 0, 0, 0, 9
	sprite gBattleAnimSpriteTemplate_84023BC, 3, 5, 2, 0, 1, 0, 9
	pause 16
	createtask sub_812B340, 5, 2, 223, 63
	createtask sub_80A8B88, 5, 5, 1, 8, 1536, 5, 1
	wait
	createtask sub_80E2D78, 2, 5, 248, 3, 10, 0, 1
	wait
	createtask sub_812CCA8, 2
	end

Move_TRICK: @ 81D2CE8
	loadsprite 10224
	loadsprite 10207
	sprite gBattleAnimSpriteTemplate_83D67F4, 2, 2, -40, 80
	sprite gBattleAnimSpriteTemplate_83D67F4, 2, 2, -40, 208
	pause 16
	panse_19 SE_W166, 0
	createtask sub_80D1E38, 3
	createtask sub_80D1EC8, 3
	pause 30
	panse_19 SE_W104, 0
	pause 24
	panse_19 SE_W104, 0
	pause 16
	panse_19 SE_W104, 0
	pause 16
	panse_19 SE_W104, 0
	pause 16
	panse_19 SE_W104, 0
	pause 16
	panse_19 SE_W104, 0
	pause 16
	panse_19 SE_W213, 0
	createtask sub_80A7E7C, 3, 5, 0, 5, 0, 7, 2
	createtask sub_80A7E7C, 3, 5, 1, 5, 0, 7, 2
	wait
	end

Move_WISH: @ 81D2D66
	loadsprite 10233
	loadsprite 10049
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 0, 10, 0
	wait
	panse_27 SE_W115, 63, 192, 253, 0
	sprite gBattleAnimSpriteTemplate_84024E8, 40
	wait
	pause 60
	panse_1C SE_W215, 192, 16, 3
	call Unknown_81D5ECA
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 10, 0, 0
	wait
	end

Move_STOCKPILE: @ 81D2DAE
	loadsprite 10235
	panse_19 SE_W025, 192
	createtask sub_80E1F8C, 2, 6, 2, 8, 1, 0, 12, 32767
	createtask sub_812D674, 5
	call _81D2DEC
	call _81D2DEC
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 2, 0, 12, 0, 32767
	end
_81D2DEC:
	sprite gBattleAnimSpriteTemplate_83D6350, 2, 3, 55, 55, 13
	pause 1
	sprite gBattleAnimSpriteTemplate_83D6350, 2, 3, -55, -55, 13
	pause 1
	sprite gBattleAnimSpriteTemplate_83D6350, 2, 3, 0, 55, 13
	pause 1
	sprite gBattleAnimSpriteTemplate_83D6350, 2, 3, 0, -55, 13
	pause 1
	sprite gBattleAnimSpriteTemplate_83D6350, 2, 3, 55, -34, 13
	pause 1
	sprite gBattleAnimSpriteTemplate_83D6350, 2, 3, 55, 34, 13
	pause 1
	sprite gBattleAnimSpriteTemplate_83D6350, 2, 3, -55, -34, 13
	pause 1
	sprite gBattleAnimSpriteTemplate_83D6350, 2, 3, -55, 34, 13
	pause 1
	ret

Move_SPIT_UP: @ 81D2E65
	loadsprite 10237
	loadsprite 10135
	panse_19 SE_W036, 192
	createtask sub_812D6CC, 5
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 8, 2
	pause 45
	panse_19 SE_W255, 192
	pause 3
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 2, 0, 12
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 2, 32, 12
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 2, 64, 12
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 2, 96, 12
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 2, 128, 12
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 2, 160, 12
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 2, 192, 12
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 2, 224, 12
	pause 5
	jumpif 2, _81D2F32
	jumpif 3, _81D2F5B
_81D2EF5:
	pause 5
	createtask sub_80A9058, 2, 5, 0, 1, 8, 1, 0
	panse_19 SE_W003, 63
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, -12, 10, 1, 1
	pause 5
	panse_19 SE_W003, 63
	sprite gBattleAnimSpriteTemplate_83DB538, 131, 4, 12, -10, 1, 1
	wait
	end
_81D2F32:
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 16
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 80
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 144
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 208
	jump _81D2EF5
_81D2F5B:
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 16
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 48
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 80
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 112
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 144
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 176
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 208
	sprite gBattleAnimSpriteTemplate_83D7B60, 2, 1, 240
	jump _81D2EF5

Move_SWALLOW: @ 81D2FA8
	loadsprite 10236
	loadsprite 10031
	panse_19 SE_W036, 192
	createtask sub_812D790, 5
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 8, 2
	pause 38
	panse_19 SE_W255, 192
	createtask sub_80A7FA0, 2, 5, 0, 2, 0, 12, 1
	call _81D2FF9
	jumpif 2, _81D303B
	jumpif 3, _81D3045
_81D2FF2:
	wait
	call Unknown_81D5EF5
	end
_81D2FF9:
	sprite gBattleAnimSpriteTemplate_8402578, 2, 2, 0, -8
	pause 1
	sprite gBattleAnimSpriteTemplate_8402578, 2, 2, -24, -8
	pause 1
	sprite gBattleAnimSpriteTemplate_8402578, 2, 2, 16, -8
	pause 1
	sprite gBattleAnimSpriteTemplate_8402578, 2, 2, -16, -8
	pause 1
	sprite gBattleAnimSpriteTemplate_8402578, 2, 2, 24, -8
	pause 1
	ret
_81D303B:
	call _81D2FF9
	jump _81D2FF2
_81D3045:
	call _81D2FF9
	call _81D2FF9
	jump _81D2FF2

Move_TRANSFORM: @ 81D3054
	monbg 0
	panse_19 SE_W100, 192
	panse_1D SE_W107, 192, 48
	createtask sub_812D7E8, 2, 1, 0
	wait
	clearmonbg 0
	end

Move_MORNING_SUN: @ 81D306C
	loadsprite 10241
	loadsprite 10031
	createtask sub_812DB84, 5
	pause 8
	createtask sub_80E2A38, 10, 5, 1921, 8, 0, 12, 32767
	pause 14
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
	createtask sub_80E2A38, 10, 5, 1921, 3, 12, 0, 32767
	wait
	waitsound
	call Unknown_81D5EF5
	end
_81D30F2:
	sprite gBattleAnimSpriteTemplate_84025EC, 2, 2, 30, 640
	pause 5
	ret

Move_SWEET_SCENT: @ 81D3100
	loadsprite 10238
	panse_19 SE_W230, 192
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 100, 0, 100
	pause 25
	setpan 0
	call _81D3144
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 2, 55, 0
	setpan 63
	createtask sub_80E1F8C, 2, 6, 20, 1, 5, 5, 13, 22207
	call _81D3144
	wait
	end
_81D3144:
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 70, 1, 64
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 60, 0, 64
	pause 5
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 80, 1, 64
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 58, 0, 120
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 100, 0, 120
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 90, 0, 64
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 48, 0, 64
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 95, 1, 80
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 100, 0, 120
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 75, 1, 64
	pause 2
	sprite gBattleAnimSpriteTemplate_84026A4, 2, 3, 85, 0, 120
	pause 2
	ret

Move_HYPER_BEAM: @ 81D31EA
	loadsprite 10147
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 4, 0, 16, 0
	wait
	pause 10
	panse_19 SE_W063, 192
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 4, 1
	wait
	pause 30
	createtask_1F sub_812B058, 7, 247, -64, 63, 1, 15, 0, 5
	createtask sub_80A7E7C, 2, 5, 0, 0, 4, 50, 1
	createtask sub_80E21A8, 2, 7, 10147, 1, 12, 31, 16, 0, 0
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	call _81D331B
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 50, 1
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 11, 26425
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
	createtask sub_80E2A38, 10, 5, 4, 2, 11, 0, 26425
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 4, 16, 0, 0
	end
_81D331B:
	sprite gBattleAnimSpriteTemplate_83D6394, 130
	sprite gBattleAnimSpriteTemplate_83D6394, 130
	pause 1
	ret

Move_FLATTER: @ 81D332C
	loadsprite 10227
	loadsprite 10240
	createtask sub_812B340, 5, 2, 223, 63
	createtask sub_812CC44, 2
	createtask sub_80E2D78, 2, 5, 248, 3, 0, 10, 0
	wait
	sprite gBattleAnimSpriteTemplate_8402720, 130, 3, 0, -8, 80
	pause 0
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 5, 2, 1
	pause 10
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 5, 2, 1
	pause 0
	createtask sub_812B30C, 5, 2, 229, -64
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
	pause 5
	createtask sub_812B30C, 5, 2, 229, 63
	wait
	createtask sub_80E2D78, 2, 5, 248, 3, 10, 0, 1
	wait
	createtask sub_812CCA8, 2
	end
_81D3415:
	sprite gBattleAnimSpriteTemplate_8402708, 40, 1, 0
	sprite gBattleAnimSpriteTemplate_8402708, 40, 1, 1
	ret

Move_ROLE_PLAY: @ 81D3428
	monbg 2
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 16, 32767
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 0, 10, 0
	wait
	panse_19 SE_W161, 192
	panse_1D SE_W197, 192, 30
	createtask sub_812EFC8, 2
	wait
	clearmonbg 2
	createtask sub_80E2A38, 10, 5, 4, 2, 16, 0, 32767
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 2, 10, 0, 0
	end

Move_REFRESH: @ 81D3485
	loadsprite 10203
	loadsprite 10049
	panse_19 SE_W287, 192
	createtask sub_81300A4, 2, 1, 0
	wait
	panse_19 SE_W234, 192
	call Unknown_81D5ECA
	wait
	panse_19 SE_REAPOKE, 192
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 31, 3, 10, 0, 31500
	sprite gBattleAnimSpriteTemplate_83D7928, 3, 4, 0, 0, 0, 0
	end

Move_BLAZE_KICK: @ 81D34C8
	loadsprite 10135
	loadsprite 10143
	loadsprite 10029
	monbg 1
	setalpha 12, 8
	panse_19 SE_W172, 63
	sprite gBattleAnimSpriteTemplate_83DA024, 131, 4, 0, 0, 1, 30
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 7, 32767
	pause 30
	panse_19 SE_W007, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 0, 0, 1, 0
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 14, 1
	createtask sub_80E2A38, 10, 5, 4, 2, 0, 0, 32767
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 3, 1, 0, 8, 0, 0
	call _81D11A2
	wait
	clearmonbg 1
	blendoff
	end

Move_HYPER_VOICE: @ 81D3550
	loadsprite 10203
	call _81D3562
	wait
	pause 8
	call _81D3562
	wait
	end
_81D3562:
	createtask sub_812B2B8, 5
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 31, 3, 8, 0, 1023
	createtask sub_80A8D34, 5, 5, -5, -5, 5, 0, 0
	sprite gBattleAnimSpriteTemplate_83D798C, 0, 7, 45, 0, 0, 0, 0, 0, 1
	createtask sub_80A7FA0, 2, 5, 1, 1, 0, 6, 1
	createtask sub_80A7FA0, 2, 5, 3, 1, 0, 6, 1
	createtask sub_80E26BC, 2, 4, 1, 0, 6, 1
	ret

Move_SAND_TOMB: @ 81D35D2
	loadsprite 10074
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 4, 2, 0, 7, 563
	createtask sub_80A7E7C, 5, 5, 1, 0, 2, 43, 1
	panse_19 SE_W328, 63
	call _81D361F
	call _81D361F
	call _81D361F
	pause 22
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 4, 2, 7, 0, 563
	wait
	end
_81D361F:
	sprite gBattleAnimSpriteTemplate_83DAC7C, 130, 7, 0, 32, 528, 30, 10, 50, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC7C, 130, 7, 0, 36, 480, 20, 13, -46, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC7C, 130, 7, 0, 37, 576, 20, 5, 42, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC7C, 130, 7, 0, 35, 400, 25, 8, -42, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC7C, 130, 7, 0, 32, 512, 25, 13, 46, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83DAC7C, 130, 7, 0, 37, 464, 30, 12, -50, 1
	pause 2
	ret

Move_SHEER_COLD: @ 81D36AA
	fadetobg 15
	waitbgfadeout
	panse_19 SE_W196, 0
	waitbgfadein
	loadsprite 10010
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createtask sub_807B920, 2
	panse_1D SE_W258, 63, 17
	wait
	clearmonbg 3
	blendoff
	restorebg
	waitbgfadein
	end

Move_ARM_THRUST: @ 81D36CF
	loadsprite 10143
	loadsprite 10135
	monbgprio_28 1
	setalpha 12, 8
	createtask sub_80A8E04, 5, 4, 8, 5, 0, 0
	pause 6
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 3
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83DA144, 130, 4, 10, -8, 14, 3
	wait
	createtask sub_80A8E04, 5, 4, 8, 5, 0, 1
	panse_19 SE_W003, 63
	ifelse _81D373C, _81D3750
_81D3728:
	createtask sub_80A7E7C, 5, 5, 1, 4, 0, 6, 1
	wait
	blendoff
	end
_81D373C:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, 8, 0, 1, 2
	jump _81D3728
_81D3750:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, -8, 0, 1, 2
	jump _81D3728

Move_MUDDY_WATER: @ 81D3764
	panse_1B SE_W250, 192, 63, 2, 0
	createtask sub_80D38BC, 2, 1, 1
	wait
	end

Move_BULLET_SEED: @ 81D3776
	loadsprite 10006
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 30, 1
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D7628, 130, 2, 20, 0
	wait
	end

Move_DRAGON_CLAW: @ 81D380C
	loadsprite 10029
	loadsprite 10039
	panse_19 SE_W221B, 192
	createtask sub_80E2A38, 10, 5, 2, 4, 0, 8, 639
	createtask sub_80A7E7C, 5, 5, 0, 0, 2, 15, 1
	call _81D39E9
	call _81D39E9
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 28, 528, 30, 13, 50, 0
	pause 2
	createtask sub_812B30C, 5, 2, 136, 63
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, -10, -10, 0
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, -10, 10, 0
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 5, -4, 1, 10, 3, 1
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 32, 480, 20, 16, -46, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 33, 576, 20, 8, 42, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 31, 400, 25, 11, -42, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 28, 512, 25, 16, 46, 0
	pause 2
	createtask sub_812B30C, 5, 2, 136, 63
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, 10, -10, 1
	sprite gBattleAnimSpriteTemplate_83DB288, 130, 3, 10, 10, 1
	sprite gBattleAnimSpriteTemplate_83DB428, 2, 5, -4, 1, 10, 3, 1
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 33, 464, 30, 15, -50, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 28, 528, 30, 13, 50, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 32, 480, 20, 16, -46, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 33, 576, 20, 8, 42, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 31, 400, 25, 11, -42, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 28, 512, 25, 16, 46, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 33, 464, 30, 15, -50, 0
	createtask sub_80E2A38, 10, 5, 2, 4, 8, 0, 639
	wait
	end
_81D39E9:
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 28, 528, 30, 13, 50, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 32, 480, 20, 16, -46, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 33, 576, 20, 8, 42, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 31, 400, 25, 11, -42, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 28, 512, 25, 16, 46, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83DACD0, 2, 7, 0, 33, 464, 30, 15, -50, 0
	pause 2
	ret

Unknown_81D3A74: @ 81D3A74
	end

Move_MUD_SHOT: @ 81D3A75
	loadsprite 10259
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	createtask sub_80A7E7C, 5, 5, 0, 0, 2, 46, 1
	pause 6
	createtask sub_80D3630, 5, 1, 100
	panse_1B SE_W250, 192, 63, 1, 0
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	createtask sub_80A7E7C, 5, 5, 1, 3, 0, 43, 1
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	call _81D3AEF
	wait
	clearmonbg 3
	blendoff
	end
_81D3AEF:
	sprite gBattleAnimSpriteTemplate_83D920C, 3, 4, 10, 10, 0, 16
	pause 2
	sprite gBattleAnimSpriteTemplate_83D920C, 3, 4, 10, 10, 0, 16
	pause 2
	ret

Move_METEOR_MASH: @ 81D3B12
	loadsprite 10233
	loadsprite 10135
	loadsprite 10143
	panse_1B SE_W112, 192, 63, 3, 0
	fadetobg 16
	waitbgfadein
	wait
	sprite gBattleAnimSpriteTemplate_8402A3C, 131, 5, -48, -64, 72, 32, 30
	pause 10
	sprite gBattleAnimSpriteTemplate_8402A3C, 131, 5, -112, -64, 8, 32, 30
	pause 40
	sprite gBattleAnimSpriteTemplate_83DA024, 131, 4, 0, 0, 0, 30
	sprite gBattleAnimSpriteTemplate_8402A3C, 131, 5, -80, -64, 40, 32, 30
	pause 20
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 1
	createtask sub_80A7FA0, 2, 5, 1, 5, 0, 20, 1
	wait
	pause 10
	restorebg
	waitbgfadein
	wait
	end

Move_REVENGE: @ 81D3B99
	loadsprite 10245
	monbg 1
	setalpha 12, 8
	panse_19 SE_W036, 192
	sprite gBattleAnimSpriteTemplate_83DA198, 2, 2, 10, -10
	wait
	createtask sub_80E1F8C, 2, 6, 2, 0, 4, 2, 8, 31
	wait
	unloadsprite 10245
	loadsprite 10246
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 6, 4
	pause 4
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83DA1E0, 130, 2, 10, -10
	wait
	unloadsprite 10246
	loadsprite 10135
	createtask sub_80A7FA0, 2, 5, 1, 3, 0, 10, 1
	sprite gBattleAnimSpriteTemplate_83DB550, 131, 5, -10, -8, 1, 1, 8
	panse_19 SE_W233B, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB550, 131, 5, 10, 8, 1, 1, 8
	panse_19 SE_W025B, 63
	wait
	clearmonbg 1
	blendoff
	end

Move_POISON_FANG: @ 81D3C30
	loadsprite 10192
	loadsprite 10150
	panse_19 SE_W044, 63
	sprite gBattleAnimSpriteTemplate_840233C, 130
	pause 10
	createtask sub_80A7E7C, 3, 5, 1, 3, 0, 10, 1
	wait
	createtask sub_80E1F8C, 2, 6, 4, 0, 4, 0, 12, 26650
	call Unknown_81D5F87
	wait
	end

Move_SUBSTITUTE: @ 81D3C6F
	panse_19 SE_W213, 192
	createtask sub_81312E4, 2
	end

Move_FRENZY_PLANT: @ 81D3C7B
	loadsprite 10223
	loadsprite 10135
	monbg 1
	monbgprio_28 1
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 1, 2, 0, 5, 0
	wait
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 10, 8, 2, 0, 0, 100
	panse_19 SE_W010, 192
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 20, -8, -2, 0, 1, 95
	panse_19 SE_W010, 213
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 30, 8, -4, 0, 0, 90
	panse_19 SE_W010, 234
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 40, -8, 4, 0, 1, 85
	panse_19 SE_W010, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 50, 8, 0, 0, 0, 85
	panse_19 SE_W010, 21
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 60, -8, -2, 0, 1, 85
	panse_19 SE_W010, 42
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 75, 8, 0, 0, 0, 85
	panse_19 SE_W010, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 85, 16, 6, 0, 3, 80
	panse_19 SE_W010, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83D6670, 2, 6, 85, -16, -6, 0, 2, 75
	panse_19 SE_W010, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -10, 1, 3
	panse_19 SE_W003, 63
	createtask sub_80A7E7C, 3, 5, 1, 8, 0, 20, 1
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 10, 8, 1, 3
	panse_19 SE_W003, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 10, -3, 1, 2
	panse_19 SE_W003, 63
	pause 3
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -3, 1, 1, 2
	panse_19 SE_W003, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, 1, 1, 1
	panse_19 SE_W003, 63
	pause 2
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 10, 1, 1
	panse_19 SE_W003, 63
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 1, 2, 5, 0, 0
	wait
	clearmonbg 1
	blendoff
	end

Move_METAL_SOUND: @ 81D3E1F
	loadsprite 10260
	monbg 3
	monbgprio_2A 1
	createtask sub_80A7FA0, 2, 5, 0, 2, 0, 8, 1
	call _81D3E52
	call _81D3E52
	call _81D3E52
	call _81D3E52
	wait
	clearmonbg 3
	pause 0
	wait
	end
_81D3E52:
	panse_1B SE_W103, 192, 63, 2, 0
	sprite gBattleAnimSpriteTemplate_83D7564, 130, 6, 16, 0, 0, 0, 30, 0
	pause 2
	ret

Move_FOCUS_PUNCH: @ 81D3E6F
	jump _81D3E76
_81D3E74:
	wait
	end
_81D3E76:
	loadsprite 10135
	loadsprite 10143
	pause 1
	createtask sub_80E4200, 2
	jumpvareq 7, 1, _81D3F2F
	createtask sub_812C924, 2
	jumpvareq 7, 0, _81D3F21
	jumpvareq 7, 1, _81D3F28
_81D3EA4:
	waitbgfadein
	monbg 3
	setalpha 12, 8
	panse_19 SE_W207, 63
	sprite gBattleAnimSpriteTemplate_83DA214, 130
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -8, 1, 0
	createtask sub_80A7E7C, 5, 5, 1, 8, 0, 24, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 10, 2, 1, 0
	panse_19 SE_W233B, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 10, -6, 1, 0
	panse_19 SE_W233B, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 8, 1, 0
	panse_19 SE_W025B, 63
	wait
	restorebg
	waitbgfadein
	clearmonbg 3
	blendoff
	jump _81D3E74
_81D3F21:
	fadetobg 4
	jump _81D3EA4
_81D3F28:
	fadetobg 5
	jump _81D3EA4
_81D3F2F:
	fadetobg 6
	jump _81D3EA4

Move_RETURN: @ 81D3F36
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	createtask sub_81318F0, 2
	pause 2
	jumpvareq 7, 0, _81D3F6C
	jumpvareq 7, 1, _81D3FBE
	jumpvareq 7, 2, _81D401E
	jumpvareq 7, 3, _81D4139
_81D3F67:
	wait
	clearmonbg 3
	blendoff
	end
_81D3F6C:
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 16, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	wait
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 16, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -8, 1, 2
	createtask sub_812B30C, 5, 2, 139, 63
	jump _81D3F67
_81D3FBE:
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 6, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	wait
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 6, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	wait
	pause 11
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 5, 4
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 3, 4, 0, 0, 1, 2
	createtask sub_812B30C, 5, 2, 141, 63
	jump _81D3F67
_81D401E:
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 6, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	wait
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 6, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	wait
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 6, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	wait
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 6, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -8, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 10, 10, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 3, -5, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -5, 3, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	jump _81D3F67
_81D4139:
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 0, 0, 6, 0
	wait
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 16, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 3, -5, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	wait
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 12, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -8, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	wait
	pause 4
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 8, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -8, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	wait
	pause 2
	createtask sub_80E2DD8, 2, 4, 0, 4, 5, 1
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 4, 1, 0
	createtask sub_812B340, 5, 2, 167, -64
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -8, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	createtask sub_80E2DD8, 2, 4, 0, 4, 5, 1
	wait
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 4, 2, 0
	createtask sub_812B340, 5, 2, 167, -64
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -8, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	createtask sub_80E2DD8, 2, 4, 0, 4, 5, 1
	wait
	call _81D4371
	call _81D4371
	call _81D4371
	call _81D4371
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -10, -8, 1, 0
	createtask sub_812B30C, 5, 2, 141, 63
	createtask sub_80A7E7C, 5, 5, 1, 8, 0, 24, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 10, 10, 1, 0
	createtask sub_812B30C, 5, 2, 141, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 3, -5, 1, 0
	createtask sub_812B30C, 5, 2, 141, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, -5, 3, 1, 0
	createtask sub_812B30C, 5, 2, 141, 63
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 0, 6, 0, 0
	jump _81D3F67
_81D4371:
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 4, 3, 0
	createtask sub_812B340, 5, 2, 167, -64
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_812B30C, 5, 2, 123, 63
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	createtask sub_80E2DD8, 2, 4, 0, 4, 5, 1
	wait
	ret

Move_COSMIC_POWER: @ 81D43C5
	loadsprite 10049
	createtask sub_812B340, 5, 2, 243, 0
	panse_19 SE_W322, 0
	createtask sub_80E3A08, 2, 4, 0, 0, 15, 0
	wait
	fadetobg 16
	waitbgfadeout
	createtask sub_80E3A58, 2, 4, 0, 128, 0, -1
	waitbgfadein
	pause 70
	createtask sub_812B30C, 5, 2, 228, -64
	sprite gBattleAnimSpriteTemplate_83D6C88, 2, 6, -15, 0, 0, 0, 32, 60
	pause 8
	sprite gBattleAnimSpriteTemplate_83D6C88, 2, 6, 12, -5, 0, 0, 32, 60
	pause 40
	createtask sub_80E3A08, 2, 4, 0, 15, 0, 0
	wait
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	wait
	end

Move_BLAST_BURN: @ 81D444A
	loadsprite 10035
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	panse_19 SE_W221, 192
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -32, 0, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -20, -10, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 0, -16, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 20, -10, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 32, 0, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 20, 10, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, 0, 16, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -20, 10, 24, 0, 0, 0
	pause 25
	panse_19 SE_W172B, 192
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -64, 0, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 6, 6, -40, -20, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 70, 6, 0, -32, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 70, 6, 40, -20, 24, 0, 0, 0
	createtask sub_80A7E7C, 5, 5, 1, 6, 0, 8, 1
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 64, 0, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 40, 20, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, 0, 32, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -40, 20, 24, 0, 0, 0
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 25
	panse_19 SE_W172B, 192
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -96, 0, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 6, 6, -60, -30, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 70, 6, 0, -48, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 70, 6, 60, -30, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, -4, 3, 1, 0
	createtask sub_80A7E7C, 5, 5, 1, 12, 0, 20, 1
	createtask sub_80E26BC, 2, 4, 2, 0, 10, 1
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 96, 0, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 66, 6, 60, 30, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, 0, 48, 24, 0, 0, 0
	sprite gBattleAnimSpriteTemplate_83D9538, 2, 6, -60, 30, 24, 0, 0, 0
	createtask sub_80E2324, 2, 3, 257, 257, 257
	wait
	clearmonbg 3
	blendoff
	end

Move_ROCK_TOMB: @ 81D468C
	loadsprite 10250
	loadsprite 10058
	createtask sub_80E26BC, 2, 4, 2, 0, 10, 1
	wait
	sprite gBattleAnimSpriteTemplate_83DADA8, 130, 5, 20, 12, 64, 114, 0
	pause 8
	createtask sub_80E26BC, 2, 4, 0, 2, 3, 1
	panse_19 SE_W070, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DADA8, 130, 5, -20, 12, 64, 98, 0
	pause 8
	createtask sub_80E26BC, 2, 4, 0, 2, 3, 1
	panse_19 SE_W070, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DADA8, 194, 5, 3, 6, 64, 82, 0
	pause 8
	createtask sub_80E26BC, 2, 4, 0, 2, 3, 1
	panse_19 SE_W070, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DADA8, 130, 5, -3, 13, 64, 66, 0
	pause 8
	createtask sub_80E26BC, 2, 4, 0, 2, 3, 1
	panse_19 SE_W070, 63
	pause 24
	panse_19 SE_W063, 63
	sprite gBattleAnimSpriteTemplate_83DA8F4, 133, 2, 1, 50
	createtask sub_80A7E7C, 5, 5, 1, 3, 0, 20, 1
	createtask sub_80E26BC, 2, 4, 2, 0, 10, 1
	wait
	end

Move_SILVER_WIND: @ 81D4773
	loadsprite 10271
	panse_1B SE_W016, 192, 63, 2, 0
	panse_19 SE_W234, 0
	pause 0
	monbg 3
	monbgprio_29
	pause 0
	createtask sub_80E2A7C, 10, 5, 1, 0, 0, 4, 0
	createtask sub_80E3B78, 2
	jumpvareq 7, 1, _81D4974
	fadetobg 22
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, 1536, 0, 0, -1
_81D47BA:
	pause 0
	createtask sub_80E2A38, 10, 5, 1, 0, 4, 4, 0
	waitbgfadein
	sprite gBattleAnimSpriteTemplate_83D693C, 194, 7, -32, 16, 0, 6, 2, 3, 1
	sprite gBattleAnimSpriteTemplate_83D693C, 194, 7, -8, 18, 64, 3, 2, 2, 1
	sprite gBattleAnimSpriteTemplate_83D693C, 120, 7, -24, 18, 90, 5, 1, 2, 1
	sprite gBattleAnimSpriteTemplate_83D693C, 120, 7, -40, 14, 128, 4, 1, 2, 1
	pause 0
	sprite gBattleAnimSpriteTemplate_83D6954, 194, 7, -32, 16, 0, 6, 2, 3, 1
	sprite gBattleAnimSpriteTemplate_83D6954, 194, 7, -8, 18, 64, 3, 2, 2, 1
	sprite gBattleAnimSpriteTemplate_83D6954, 120, 7, -24, 18, 90, 5, 1, 2, 1
	sprite gBattleAnimSpriteTemplate_83D6954, 120, 7, -40, 14, 128, 4, 1, 2, 1
	pause 0
	sprite gBattleAnimSpriteTemplate_83D696C, 194, 7, -32, 16, 0, 6, 2, 3, 1
	sprite gBattleAnimSpriteTemplate_83D696C, 194, 7, -8, 18, 64, 3, 2, 2, 1
	sprite gBattleAnimSpriteTemplate_83D696C, 120, 7, -24, 18, 90, 5, 1, 2, 1
	sprite gBattleAnimSpriteTemplate_83D696C, 120, 7, -40, 14, 128, 4, 1, 2, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83D693C, 194, 7, -4, 16, 0, 6, 1, 2, 1
	sprite gBattleAnimSpriteTemplate_83D693C, 194, 7, -16, 12, 192, 5, 2, 3, 1
	pause 0
	sprite gBattleAnimSpriteTemplate_83D6954, 194, 7, -4, 16, 0, 6, 1, 2, 1
	sprite gBattleAnimSpriteTemplate_83D6954, 194, 7, -16, 12, 192, 5, 2, 3, 1
	pause 0
	sprite gBattleAnimSpriteTemplate_83D696C, 194, 7, -4, 16, 0, 6, 1, 2, 1
	sprite gBattleAnimSpriteTemplate_83D696C, 194, 7, -16, 12, 192, 5, 2, 3, 1
	wait
	panse_19 SE_W016B, 63
	clearmonbg 3
	pause 0
	restorebg
	waitbgfadeout
	createtask sub_80E2A7C, 10, 5, 1, 0, 4, 0, 0
	setvar 7, -1
	waitbgfadein
	end
_81D4974:
	fadetobg 23
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, -1536, 0, 0, -1
	jump _81D47BA

Move_SNATCH: @ 81D498B
	panse_19 SE_W036, 192
	createtask sub_80A8920, 5, 7, 0, -12, 4, 10, 10, 12, 6
	end

Move_DIVE: @ 81D49A5
	loadsprite 10272
	loadsprite 10273
	ifelse _81D49B4, _81D4A09
_81D49B4:
	loadsprite 10156
	panse_19 SE_W029, 192
	sprite gBattleAnimSpriteTemplate_83DA5D8, 2, 4, 0, 0, 13, 336
	wait
	panse_19 SE_W291, 192
	sprite gBattleAnimSpriteTemplate_83DA614, 3, 1, 0
	call _81D49F2
	call _81D49F2
	call _81D49F2
	call _81D49F2
	call _81D49F2
	end
_81D49F2:
	sprite gBattleAnimSpriteTemplate_83DA62C, 5, 2, 0, 0
	sprite gBattleAnimSpriteTemplate_83DA62C, 5, 2, 1, 0
	ret
_81D4A09:
	loadsprite 10148
	loadsprite 10155
	monbg 3
	setalpha 12, 8
	panse_19 SE_W153, 63
	sprite gBattleAnimSpriteTemplate_83DA614, 131, 1, 1
	call _81D4A48
	call _81D4A48
	call _81D4A48
	call _81D4A48
	call _81D4A48
	pause 12
	call _81C9502
	wait
	visible 0
	clearmonbg 3
	blendoff
	end
_81D4A48:
	sprite gBattleAnimSpriteTemplate_83DA62C, 133, 2, 0, 1
	sprite gBattleAnimSpriteTemplate_83DA62C, 133, 2, 1, 1
	ret

Move_ROCK_BLAST: @ 81D4A5F
	loadsprite 10058
	loadsprite 10135
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 6
	pause 3
	panse_19 SE_W207, 192
	sprite gBattleAnimSpriteTemplate_83DADE8, 130, 6, 16, 0, 0, 0, 25, 257
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 1
	panse_19 SE_W088, 63
	sprite gBattleAnimSpriteTemplate_83DAC64, 130, 6, 0, 0, 20, 24, 14, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 5, 1
	sprite gBattleAnimSpriteTemplate_83DAC64, 130, 6, 5, 0, -20, 24, 14, 1
	sprite gBattleAnimSpriteTemplate_83DAC64, 130, 6, 0, 5, 20, -24, 14, 2
	sprite gBattleAnimSpriteTemplate_83DAC64, 130, 6, -5, 0, -20, -24, 14, 2
	wait
	end

Move_OVERHEAT: @ 81D4AFC
	loadsprite 10029
	loadsprite 10135
	monbg 3
	setalpha 12, 18
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 5, 28
	wait
	createtask sub_80E4028, 5, 2, 0, 1
	pause 1
	createtask sub_80E4178, 5, 1, 0
	pause 1
	panse_19 SE_W082, 192
	createtask sub_80E4028, 5, 2, 1, 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 2, 1, 0, 13, 28
	createtask sub_80A7E7C, 5, 5, 0, 2, 0, 15, 1
	wait
	panse_19 SE_W172B, 192
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 0, 30, 25, -20
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 32, 30, 25, -20
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 64, 30, 25, -20
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 96, 30, 25, -20
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 128, 30, 25, -20
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 160, 30, 25, -20
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 192, 30, 25, -20
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 224, 30, 25, -20
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 0, 30, 25, 0
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 32, 30, 25, 0
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 64, 30, 25, 0
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 96, 30, 25, 0
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 128, 30, 25, 0
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 160, 30, 25, 0
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 192, 30, 25, 0
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 224, 30, 25, 0
	pause 5
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 0, 30, 25, 10
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 32, 30, 25, 10
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 64, 30, 25, 10
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 96, 30, 25, 10
	sprite gBattleAnimSpriteTemplate_83DB100, 2, 5, 1, 128, 30, 25, 10
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 160, 30, 25, 10
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 192, 30, 25, 10
	sprite gBattleAnimSpriteTemplate_83DB100, 66, 5, 1, 224, 30, 25, 10
	pause 5
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, -5, 3, 1, 0
	panse_19 SE_W007, 63
	createtask sub_80A7E7C, 2, 5, 1, 10, 0, 25, 1
	pause 6
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 8, -5, 1, 0
	panse_19 SE_W007, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 10, 10, 1, 0
	panse_19 SE_W007, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 0
	panse_19 SE_W007, 63
	createtask sub_80E4178, 5, 1, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 2, -1, 0, 13, 19026
	createtask sub_80A7E7C, 5, 5, 0, 3, 0, 15, 1
	wait
	createtask sub_80E40D0, 5, 2, 0, 1
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 5, 0, 28
	wait
	clearmonbg 3
	blendoff
	wait
	pause 15
	createtask sub_80E40D0, 5, 2, 1, 0
	pause 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 2, 0, 13, 0, 19026
	wait
	end

Move_HYDRO_CANNON: @ 81D4DDE
	loadsprite 10149
	loadsprite 10148
	monbg 3
	setalpha 12, 8
	panse_19 SE_W057, 192
	sprite gBattleAnimSpriteTemplate_83D92D0, 130
	pause 10
	createtask sub_80E2324, 2, 3, 257, 257, 257
	pause 30
	panse_1B SE_W056, 192, 63, 2, 0
	call _81D4EA8
	createtask sub_80A7E7C, 5, 5, 1, 10, 0, 40, 1
	sprite gBattleAnimSpriteTemplate_83DB4D8, 130, 4, 0, 0, 1, 0
	call _81D4EA8
	sprite gBattleAnimSpriteTemplate_83DB4D8, 130, 4, 0, 0, 1, 0
	call _81D4EA8
	sprite gBattleAnimSpriteTemplate_83DB4D8, 130, 4, 0, 0, 1, 0
	call _81D4EA8
	sprite gBattleAnimSpriteTemplate_83DB4D8, 130, 4, 0, 0, 1, 0
	call _81D4EA8
	sprite gBattleAnimSpriteTemplate_83DB4D8, 130, 4, 0, 0, 1, 0
	call _81D4EA8
	sprite gBattleAnimSpriteTemplate_83DB4D8, 130, 4, 0, 0, 1, 0
	wait
	createtask sub_80E2324, 2, 3, 257, 257, 257
	wait
	clearmonbg 3
	blendoff
	end
_81D4EA8:
	sprite gBattleAnimSpriteTemplate_83D92E8, 130, 6, 10, -10, 0, 0, 15, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83D92E8, 130, 6, 10, -10, 0, 0, 15, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83D92E8, 130, 6, 10, -10, 0, 0, 15, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83D92E8, 130, 6, 10, -10, 0, 0, 15, 257
	pause 1
	sprite gBattleAnimSpriteTemplate_83D92E8, 130, 6, 10, -10, 0, 0, 15, 257
	ret

Move_ASTONISH: @ 81D4F10
	loadsprite 10273
	panse_19 SE_W227, 192
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 6
	pause 25
	sprite gBattleAnimSpriteTemplate_83DA62C, 133, 2, 0, 1
	panse_19 SE_W166, 63
	sprite gBattleAnimSpriteTemplate_83DA62C, 133, 2, 1, 1
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 5, 1
	createtask sub_80D1E38, 3
	wait
	end

Move_SEISMIC_TOSS: @ 81D4F58
	loadsprite 10135
	loadsprite 10058
	setvar 7, 0
	monbg 3
	setalpha 12, 8
	wait
	createtask sub_80DDA4C, 3
	pause 1
	fadetobg 17
	waitbgfadeout
	createtask sub_80DDA8C, 3
	panse_19 SE_W327, 0
	waitbgfadein
	wait
	createtask sub_80DDAF0, 3
	jumpvareq 7, 0, _81D4FAB
	jumpvareq 7, 1, _81D4FBC
	jumpvareq 7, 2, _81D4FD4
_81D4FA0:
	restorebg
	waitbgfadeout
	setvar 7, 4095
	waitbgfadein
	clearmonbg 3
	blendoff
	end
_81D4FAB:
	call _81D4FF3
	pause 16
	call _81D5054
	jump _81D4FA0
_81D4FBC:
	call _81D4FF3
	pause 14
	call _81D5054
	pause 14
	call _81D4FF3
	jump _81D4FA0
_81D4FD4:
	call _81D5054
	pause 10
	call _81D4FF3
	pause 10
	call _81D5054
	pause 10
	call _81D4FF3
	jump _81D4FA0
_81D4FF3:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, -10, -8, 1, 1
	panse_19 SE_W070, 63
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 5, 1
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, -12, 27, 2, 3
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, 8, 28, 3, 4
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, -4, 30, 2, 3
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, 12, 25, 4, 4
	ret
_81D5054:
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 10, -8, 1, 1
	panse_19 SE_W088, 63
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 5, 1
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, -12, 32, 3, 4
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, 8, 31, 2, 2
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, -4, 28, 2, 3
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, 12, 30, 4, 3
	ret

Move_MAGIC_COAT: @ 81D50B5
	loadsprite 10170
	setalpha 0, 16
	panse_1D SE_W112, 192, 15
	sprite gBattleAnimSpriteTemplate_83DA708, 3, 3, 40, 0, 10170
	wait
	pause 1
	blendoff
	end

Move_WATER_PULSE: @ 81D50D2
	loadsprite 10155
	loadsprite 10288
	monbg 1
	monbgprio_28 1
	panse_19 SE_W145C, 192
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 0, 0, 7, 29472
	pause 10
	sprite gBattleAnimSpriteTemplate_83D9408, 66, 7, 100, 100, 8, 1, 20, 40, 0
	sprite gBattleAnimSpriteTemplate_83D9408, 66, 7, 20, 100, 16, 2, 10, 35, 1
	sprite gBattleAnimSpriteTemplate_83D9408, 66, 7, 200, 80, 8, 1, 40, 20, 0
	sprite gBattleAnimSpriteTemplate_83D9408, 66, 7, 80, 60, 10, 3, 20, 50, 0
	sprite gBattleAnimSpriteTemplate_83D9408, 66, 7, 140, 100, 16, 1, 20, 30, 1
	panse_19 SE_W145C, 63
	wait
	panse_19 SE_W202, 192
	sprite gBattleAnimSpriteTemplate_83D757C, 130, 4, 0, 0, 40, 15
	pause 5
	panse_19 SE_W202, 192
	sprite gBattleAnimSpriteTemplate_83D757C, 130, 4, 0, 0, 40, 15
	pause 5
	panse_19 SE_W202, 192
	sprite gBattleAnimSpriteTemplate_83D757C, 130, 4, 0, 0, 40, 15
	pause 13
	createtask sub_80A7E7C, 2, 5, 1, 0, 8, 18, 1
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 7, 0, 29472
	wait
	clearmonbg 3
	end

Move_PSYCHO_BOOST: @ 81D51C7
	loadsprite 10212
	monbg 2
	fadetobg 3
	waitbgfadeout
	createtask sub_812C624, 5
	waitbgfadein
	pause 6
	createtask sub_80E1F8C, 2, 6, 1, 2, 8, 0, 10, 0
	pause 0
	monbgprio_28 0
	setalpha 8, 8
	pause 10
	createtask sub_80A7E7C, 2, 5, 0, 3, 0, 240, 0
	panse_1C SE_W060B, 192, 14, 10
	sprite gBattleAnimSpriteTemplate_83DAA68, 2
	pause 110
	panse_1C SE_W060B, 192, 7, 10
	wait
	createtask sub_80A7FA0, 2, 5, 1, -8, 1, 24, 1
	panse_19 SE_W043, 63
	wait
	clearmonbg 2
	blendoff
	call Unknown_81D61F3
	end

Move_KNOCK_OFF: @ 81D523B
	loadsprite 10277
	loadsprite 10135
	sprite gBattleAnimSpriteTemplate_83C1FB0, 2, 2, 4, 6
	pause 4
	panse_19 SE_W233, 63
	sprite gBattleAnimSpriteTemplate_8402AE4, 130, 2, -16, -16
	pause 8
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 5, 1, 32767, 10, 0, 0
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, 0, 1, 2
	panse_19 SE_W004, 63
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -12, 10, 0, 3
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 5
	pause 3
	createtask sub_80A8154, 2, 5, 1, 0, 3, 6, 1
	pause 5
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 6
	pause 10
	wait
	end

Move_DOOM_DESIRE: @ 81D52CB
	createtask sub_80E0EE8, 2
	pause 1
	monbg 2
	createtask sub_80E0E24, 5, 2, 1, 0
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 4, 0
	wait
	setalpha 8, 8
	panse_19 SE_W060, 192
	createtask sub_80A8D34, 5, 5, -4, -4, 15, 0, 1
	wait
	pause 20
	createtask sub_80E0E24, 5, 2, 1, 1
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 4, 0, 0
	wait
	clearmonbg 2
	blendoff
	end

Unknown_81D532F: @ 81D532F
	loadsprite 10198
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 0, 16, 32767
	wait
	pause 10
	createtask sub_812E14C, 5
	pause 5
	panse_19 SE_W109, 192
	pause 10
	panse_19 SE_W109, 0
	pause 10
	panse_19 SE_W109, 63
	pause 23
	createtask sub_80A8154, 2, 5, 1, 10, 0, 20, 1
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 0, 0, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 24, -24, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -16, 16, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -24, -12, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 16, 16, 1, 1
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 16, 0, 32767
	wait
	end

Move_SKY_UPPERCUT: @ 81D53ED
	loadsprite 10135
	monbg 3
	monbgprio_28 1
	fadetobg 17
	waitbgfadeout
	panse_19 SE_W327, 192
	createtask sub_80D9C80, 5, 1, 55
	waitbgfadein
	setalpha 12, 8
	pause 38
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 0, 28, 0, 0, 5
	pause 4
	createtask sub_80A7FA0, 2, 5, 1, 4, 0, 6, 1
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, -28, 28, 1, 1
	pause 1
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, -15, 8, 1, 1
	panse_19 SE_W233B, 63
	pause 1
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, -5, -12, 1, 1
	pause 1
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 0, -32, 1, 1
	pause 1
	panse_19 SE_W233B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 5, -52, 1, 1
	sprite gBattleAnimSpriteTemplate_83C1FF8, 2, 5, 1, -26, 16, 1, 4
	pause 4
	createtask sub_80A8154, 2, 5, 1, 0, 3, 6, 1
	pause 30
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 0, 0, 6
	pause 4
	sprite gBattleAnimSpriteTemplate_83C1FE0, 2, 3, 1, 0, 6
	clearmonbg 3
	blendoff
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	end

Move_SECRET_POWER: @ 81D54E6
	createtask sub_80E4008, 5
	jumpvareq 0, 0, Move_NEEDLE_ARM
	jumpvareq 0, 1, Move_MAGICAL_LEAF
	jumpvareq 0, 2, Move_MUD_SHOT
	jumpvareq 0, 3, Move_WATERFALL
	jumpvareq 0, 4, Move_SURF
	jumpvareq 0, 5, Move_BUBBLE_BEAM
	jumpvareq 0, 6, Move_ROCK_THROW
	jumpvareq 0, 7, Move_BITE
	jumpvareq 0, 8, Move_STRENGTH
	jump Move_SLAM

Move_TWISTER: @ 81D553A
	loadsprite 10063
	loadsprite 10135
	loadsprite 10058
	monbg 3
	monbgprio_28 1
	panse_19 SE_W239, 63
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 120, 70, 5, 70, 30
	pause 1
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 115, 55, 6, 60, 25
	pause 1
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 115, 60, 7, 60, 30
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 115, 55, 10, 60, 30
	pause 3
	sprite gBattleAnimSpriteTemplate_83DAE18, 130, 5, 100, 50, 4, 50, 26
	pause 1
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 105, 25, 8, 60, 20
	pause 1
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 115, 40, 10, 48, 30
	pause 3
	sprite gBattleAnimSpriteTemplate_83DAE18, 130, 5, 120, 30, 6, 45, 25
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 115, 35, 10, 60, 30
	pause 3
	sprite gBattleAnimSpriteTemplate_83DAE18, 130, 5, 105, 20, 8, 40, 0
	pause 3
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 20, 255, 15, 32, 0
	sprite gBattleAnimSpriteTemplate_83D64B4, 130, 5, 110, 10, 8, 32, 20
	wait
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, -32, -16, 1, 3
	panse_19 SE_W004, 63
	createtask sub_80A8154, 2, 5, 1, 3, 0, 12, 1
	createtask sub_80A8154, 2, 5, 3, 3, 0, 12, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 3
	panse_19 SE_W004, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB4F0, 131, 2, 1, 3
	panse_19 SE_W004, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83DB4A8, 131, 4, 32, 20, 1, 3
	panse_19 SE_W004, 63
	wait
	clearmonbg 3
	blendoff
	end

Move_MAGICAL_LEAF: @ 81D5699
	loadsprite 10063
	loadsprite 10160
	loadsprite 10135
	monbg 3
	setalpha 12, 8
	pause 1
	panse_1C SE_W077, 192, 10, 5
	createtask sub_80CC5F8, 5
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -3, -2, 10
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -1, -1, 15
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -4, -4, 7
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, 3, -3, 11
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -1, -6, 8
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, 2, -1, 12
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -3, -4, 13
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, 4, -5, 7
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, 2, -6, 11
	pause 2
	sprite gBattleAnimSpriteTemplate_83D649C, 2, 3, -3, -5, 8
	pause 60
	panse_19 SE_W013B, 192
	sprite gBattleAnimSpriteTemplate_83D64E4, 131, 7, 20, -10, 20, 0, 32, 20, 0
	sprite gBattleAnimSpriteTemplate_83D64E4, 131, 7, 20, -10, 20, 0, 32, -20, 0
	pause 30
	panse_19 SE_W013, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 132, 4, -10, -4, 1, 2
	sprite gBattleAnimSpriteTemplate_83DB4A8, 132, 4, 10, 4, 1, 2
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	pause 20
	setvar 7, -1
	wait
	clearmonbg 3
	blendoff
	end

Move_ICE_BALL: @ 81D57BA
	loadsprite 10043
	loadsprite 10141
	createtask sub_80D8FC0, 5, 1, 0
	jumpvareq 0, 4, _81D5831
_81D57D1:
	panse_19 SE_W196, 192
	sprite gBattleAnimSpriteTemplate_83D9EF4, 130, 6, 15, 0, -12, -16, 30, -40
	pause 28
	panse_19 SE_W280, 63
	createtask sub_80D8FC0, 5, 1, 0
	jumpvareq 0, 0, _81D5842
	jumpvareq 0, 1, _81D5871
	jumpvareq 0, 2, _81D58AA
	jumpvareq 0, 3, _81D58ED
	jumpvareq 0, 4, _81D5935
_81D581F:
	createtask sub_80D8FC0, 5, 1, 0
	jumpvareq 0, 4, _81D5838
_81D5830:
	end
_81D5831:
	fadetobg 15
	jump _81D57D1
_81D5838:
	waitbgfadein
	pause 45
	restorebg
	waitbgfadein
	jump _81D5830
_81D5842:
	createtask sub_80A9058, 2, 5, 0, 1, 8, 1, 0
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	jump _81D581F
_81D5871:
	createtask sub_80A9058, 2, 5, 0, 1, 10, 1, 0
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	jump _81D581F
_81D58AA:
	createtask sub_80A9058, 2, 5, 0, 1, 14, 1, 0
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	call _81D597D
	jump _81D581F
_81D58ED:
	createtask sub_80A9058, 2, 5, 0, 1, 18, 1, 0
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
	jump _81D581F
_81D5935:
	createtask sub_80A9058, 2, 5, 0, 1, 30, 1, 0
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
	jump _81D581F
_81D597D:
	sprite gBattleAnimSpriteTemplate_83D9F0C, 132, 2, -12, -16
	ret

Move_WEATHER_BALL: @ 81D5989
	loadsprite 10283
	sprite gBattleAnimSpriteTemplate_83C1FC8, 2, 3, 8, 1, 0
	pause 8
	panse_19 SE_W207, 192
	sprite gBattleAnimSpriteTemplate_83930A8, 2
	wait
	pause 15
	panse_19 SE_W197, 0
	sprite gBattleAnimSpriteTemplate_83DB3DC, 2, 7, 31, 5, 1, 32767, 10, 0, 0
	wait
	createtask sub_8132528, 2
	pause 1
	jumpvareq 7, 0, _81D59F4
	jumpvareq 7, 1, _81D5A31
	jumpvareq 7, 2, _81D5A95
	jumpvareq 7, 3, _81D5AF9
	jumpvareq 7, 4, _81D5B99
_81D59F4:
	loadsprite 10135
	sprite gBattleAnimSpriteTemplate_83930C0, 130, 6, -30, -100, 25, 1, 0, 0
	wait
	panse_19 SE_W025B, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 132, 4, -10, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 8, 1
	wait
	end
_81D5A31:
	loadsprite 10029
	sprite gBattleAnimSpriteTemplate_83D96AC, 130, 6, -30, -100, 25, 1, 40, 10
	panse_19 SE_W172, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83D96AC, 130, 6, -30, -100, 25, 1, -40, 20
	panse_19 SE_W172, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83D96AC, 130, 6, -30, -100, 25, 1, 0, 0
	panse_19 SE_W172, 63
	wait
	panse_19 SE_W172B, 63
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 8, 1
	wait
	end
_81D5A95:
	loadsprite 10155
	sprite gBattleAnimSpriteTemplate_83D9438, 130, 6, -30, -100, 25, 1, 50, 10
	panse_19 SE_W152, 63
	pause 8
	sprite gBattleAnimSpriteTemplate_83D9438, 130, 6, -30, -100, 25, 1, -20, 20
	panse_19 SE_W152, 63
	pause 13
	sprite gBattleAnimSpriteTemplate_83D9438, 130, 6, -30, -100, 25, 1, 0, 0
	panse_19 SE_W152, 63
	wait
	createtask sub_80A7E7C, 2, 5, 1, 0, 3, 8, 1
	panse_19 SE_W202, 63
	wait
	end
_81D5AF9:
	loadsprite 10058
	sprite gBattleAnimSpriteTemplate_83DAE30, 130, 6, -30, -100, 25, 1, 30, 0
	panse_19 SE_W088, 63
	pause 5
	sprite gBattleAnimSpriteTemplate_83DAE30, 130, 6, -30, -100, 25, 1, -40, 20
	panse_19 SE_W088, 63
	pause 14
	sprite gBattleAnimSpriteTemplate_83DAE30, 130, 6, -30, -100, 25, 1, 0, 0
	panse_19 SE_W088, 63
	wait
	panse_19 SE_W070, 63
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, -12, 27, 2, 3
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, 8, 28, 3, 4
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, -4, 30, 2, 3
	sprite gBattleAnimSpriteTemplate_83DAE00, 130, 4, 12, 25, 4, 4
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	wait
	end
_81D5B99:
	loadsprite 10263
	loadsprite 10141
	sprite gBattleAnimSpriteTemplate_83D9E54, 130, 6, -30, -100, 25, 25, -40, 20
	panse_19 SE_W258, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83D9E54, 130, 6, -30, -100, 25, 25, 40, 0
	panse_19 SE_W258, 63
	pause 10
	sprite gBattleAnimSpriteTemplate_83D9E54, 130, 6, -30, -100, 25, 25, 0, 0
	panse_19 SE_W258, 63
	wait
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	panse_19 SE_W196, 63
	call Unknown_81D5C36
	wait
	end

PoundCopy: @ 81D5C05
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W003, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	wait
	clearmonbg 1
	blendoff
	end

Unknown_81D5C36: @ 81D5C36
	sprite gBattleAnimSpriteTemplate_83D9C78, 130, 3, -10, -10, 0
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, 10, 20, 0
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C78, 130, 3, -5, 10, 0
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, 17, -12, 0
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, -15, 15, 0
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, 0, 0, 0
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C78, 130, 3, 20, 2, 0
	panse_19 SE_W196, 63
	ret

Unknown_81D5CBA: @ 81D5CBA
	sprite gBattleAnimSpriteTemplate_83D9C78, 130, 3, -10, -10, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, 10, 20, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C78, 130, 3, -29, 0, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, 29, -20, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C78, 130, 3, -5, 10, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, 17, -12, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C78, 130, 3, -20, 0, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, -15, 15, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, 26, -5, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C90, 130, 3, 0, 0, 1
	panse_19 SE_W196, 63
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9C78, 130, 3, 20, 2, 1
	panse_19 SE_W196, 63
	ret

Unknown_81D5D8A: @ 81D5D8A
	panse_1C SE_W196, 63, 6, 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 0, 24, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 8, 24, 0
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -8, 24, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 16, 24, 0
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -16, 24, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 24, 24, 0
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -24, 24, 0
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 32, 24, 0
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -32, 24, 0
	ret

Unknown_81D5E0E: @ 81D5E0E
	panse_1C SE_W196, 63, 6, 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 0, 24, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 8, 24, 1
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -8, 24, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 16, 24, 1
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -16, 24, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 24, 24, 1
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -24, 24, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 32, 24, 1
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -32, 24, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 40, 24, 1
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -40, 24, 1
	pause 4
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, 48, 24, 1
	sprite gBattleAnimSpriteTemplate_83D9D14, 130, 3, -48, 24, 1
	ret

Unknown_81D5ECA: @ 81D5ECA
	sprite gBattleAnimSpriteTemplate_83D6C88, 2, 6, -15, 0, 0, 0, 32, 60
	pause 8
	sprite gBattleAnimSpriteTemplate_83D6C88, 2, 6, 12, -5, 0, 0, 32, 60
	pause 8
	ret

Unknown_81D5EF5: @ 81D5EF5
	panse_19 SE_W071B, 192
	sprite gBattleAnimSpriteTemplate_83D7038, 2, 4, 0, -5, 0, 0
	pause 7
	sprite gBattleAnimSpriteTemplate_83D7038, 2, 4, -15, 10, 0, 0
	pause 7
	sprite gBattleAnimSpriteTemplate_83D7038, 2, 4, -15, -15, 0, 0
	pause 7
	sprite gBattleAnimSpriteTemplate_83D7038, 2, 4, 10, -5, 0, 0
	pause 7
	ret

Unknown_81D5F3E: @ 81D5F3E
	panse_19 SE_W071B, 63
	sprite gBattleAnimSpriteTemplate_83D7038, 130, 4, 0, -5, 1, 0
	pause 7
	sprite gBattleAnimSpriteTemplate_83D7038, 130, 4, -15, 10, 1, 0
	pause 7
	sprite gBattleAnimSpriteTemplate_83D7038, 130, 4, -15, -15, 1, 0
	pause 7
	sprite gBattleAnimSpriteTemplate_83D7038, 130, 4, 10, -5, 1, 0
	pause 7
	ret

Unknown_81D5F87: @ 81D5F87
	sprite gBattleAnimSpriteTemplate_83DA350, 130, 3, 10, 10, 0
	panse_19 SE_W092, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA350, 130, 3, 20, -20, 0
	panse_19 SE_W092, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA350, 130, 3, -20, 15, 0
	panse_19 SE_W092, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA350, 130, 3, 0, 0, 0
	panse_19 SE_W092, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA350, 130, 3, -20, -20, 0
	panse_19 SE_W092, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA350, 130, 3, 16, -8, 0
	panse_19 SE_W092, 63
	ret

Unknown_81D5FF8: @ 81D5FF8
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 10, 10, 0
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 20, -20, 0
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, -20, 15, 0
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 0, 0, 0
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, -20, -20, 0
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 16, -8, 0
	panse_19 SE_W145C, 63
	ret

Unknown_81D6069: @ 81D6069
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 10, 10, 1
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, -28, -10, 1
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 20, -20, 1
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, -20, 15, 1
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 0, 0, 1
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 27, 8, 1
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, -20, -20, 1
	panse_19 SE_W145C, 63
	pause 6
	sprite gBattleAnimSpriteTemplate_83DA368, 2, 3, 16, -8, 1
	panse_19 SE_W145C, 63
	ret

Unknown_81D6100: @ 81D6100
	panse_19 SE_W085B, 63
	sprite gBattleAnimSpriteTemplate_83D9920, 130, 4, 5, 0, 5, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9920, 130, 4, -5, 10, 5, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9920, 130, 4, 15, 20, 5, 2
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9920, 130, 4, -15, -10, 5, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9920, 130, 4, 25, 0, 5, 1
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9920, 130, 4, -8, 8, 5, 2
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9920, 130, 4, 2, -8, 5, 0
	pause 2
	sprite gBattleAnimSpriteTemplate_83D9920, 130, 4, -20, 15, 5, 1
	ret

Unknown_81D618B: @ 81D618B
	panse_1C SE_W146, 63, 13, 6
	sprite gBattleAnimSpriteTemplate_83DB3AC, 130, 5, 0, -15, 0, 3, 90
	sprite gBattleAnimSpriteTemplate_83DB3AC, 130, 5, 0, -15, 51, 3, 90
	sprite gBattleAnimSpriteTemplate_83DB3AC, 130, 5, 0, -15, 102, 3, 90
	sprite gBattleAnimSpriteTemplate_83DB3AC, 130, 5, 0, -15, 153, 3, 90
	sprite gBattleAnimSpriteTemplate_83DB3AC, 130, 5, 0, -15, 204, 3, 90
	ret

Unknown_81D61E7: @ 81D61E7
	fadetobg 3
	waitbgfadeout
	createtask sub_812C560, 5
	waitbgfadein
	ret

Unknown_81D61F3: @ 81D61F3
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	ret

Unknown_81D61FB: @ 81D61FB
	jumpunkcond _81D6214
	fadetobg 18
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, -2304, 768, 1, -1
_81D6212:
	waitbgfadein
	ret
_81D6214:
	fadetobg 19
	waitbgfadeout
	createtask sub_80E3A58, 5, 4, 2304, 768, 0, -1
	jump _81D6212

Unknown_81D622B: @ 81D622B
	restorebg
	waitbgfadeout
	setvar 7, -1
	waitbgfadein
	ret

Unknown_81D6233: @ 81D6233
	createtask sub_80E4200, 2
	jumpvareq 7, 1, Unknown_81D6258
	createtask sub_812C924, 2
	jumpvareq 7, 0, Unknown_81D6266
	jump Unknown_81D625F

Unknown_81D6256: @ 81D6256
	waitbgfadein
	ret

Unknown_81D6258: @ 81D6258
	fadetobg 26
	jump Unknown_81D6256

Unknown_81D625F: @ 81D625F
	fadetobg 25
	jump Unknown_81D6256

Unknown_81D6266: @ 81D6266
	fadetobg 24
	jump Unknown_81D6256

Unknown_81D626D: @ 81D626D
	restorebg
	waitbgfadein
	ret

StatusCondition_Poison: @ 81D6270
	panse_1C SE_W092, 63, 13, 6
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 18, 2
	createtask sub_80E1F8C, 2, 6, 2, 2, 2, 0, 12, 31774
	end

StatusCondition_Confusion: @ 81D629B
	loadsprite 10073
	call Unknown_81D618B
	end

StatusCondition_Burn: @ 81D62A4
	loadsprite 10029
	panse_19 SE_W172, 63
	call _81D62BC
	call _81D62BC
	call _81D62BC
	wait
	end
_81D62BC:
	sprite gBattleAnimSpriteTemplate_83D9614, 130, 7, -24, 24, 24, 24, 20, 1, 1
	pause 4
	ret

StatusCondition_Love: @ 81D62D4
	loadsprite 10210
	panse_19 SE_W204, 192
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, 0, 20
	pause 15
	panse_19 SE_W204, 192
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, -20, 20
	pause 15
	panse_19 SE_W204, 192
	sprite gBattleAnimSpriteTemplate_83D7A80, 3, 2, 20, 20
	end

StatusCondition_Sleep: @ 81D6309
	loadsprite 10228
	panse_19 SE_W173, 192
	sprite gBattleAnimSpriteTemplate_83D6D94, 2, 5, 4, -10, 16, 0, 0
	pause 30
	sprite gBattleAnimSpriteTemplate_83D6D94, 2, 5, 4, -10, 16, 0, 0
	end

StatusCondition_Paralysis: @ 81D6335
	loadsprite 10011
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 10, 1
	call Unknown_81D6100
	end

StatusCondition_Ice: @ 81D634F
	panse_19 SE_W196, 0
	loadsprite 10010
	monbg 3
	monbgprio_28 1
	panse_1D SE_W258, 63, 17
	createtask sub_807B920, 2
	wait
	clearmonbg 3
	end

StatusCondition_Curse: @ 81D636A
	loadsprite 10200
	monbg 3
	panse_19 SE_W171, 63
	sprite gBattleAnimSpriteTemplate_83DAF38, 130
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 14, 1
	wait
	clearmonbg 3
	end

StatusCondition_Nightmare: @ 81D638F
	loadsprite 10221
	monbg 3
	panse_19 SE_W171, 63
	sprite gBattleAnimSpriteTemplate_83DAF50, 130
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 14, 1
	wait
	clearmonbg 3
	end

Unknown_81D63B4: @ 81D63B4
	createtask c3_80DFBE4, 2
	jumpvareq 7, 1, _81D63E0
	jump _81D63C8
_81D63C8:
	monbg 0
	panse_19 SE_W100, 192
	panse_1D SE_W107, 192, 48
	createtask sub_812D7E8, 2, 1, 1
	wait
	clearmonbg 0
	end
_81D63E0:
	createtask sub_812DB58, 2, 1, 1
	end

Unknown_81D63EA: @ 81D63EA
	createtask sub_807BB88, 5
	wait
	end

Unknown_81D63F3: @ 81D63F3
	monbg 0
	createtask sub_81416C4, 5
	createtask sub_80E2A38, 10, 5, 2, 0, 0, 16, 32767
	wait
	pause 1
	clearmonbg 0
	pause 2
	blendoff
	createtask sub_80E2A38, 10, 5, 2, 0, 0, 0, 32767
	createtask sub_814151C, 2, 1, 1
	end

Unknown_81D6430: @ 81D6430
	createtask sub_81312E4, 2
	end

Unknown_81D6438: @ 81D6438
	createtask sub_8141D7C, 2
	createtask sub_8141BD4, 2
	pause 0
	panse_1D SE_W026, 192, 22
	sprite gBattleAnimSpriteTemplate_840B4FC, 131, 4, -16, 7, 0, 32
	pause 50
	panse_1C SE_W039, 63, 19, 2
	createtask sub_80A8B88, 5, 5, 1, 8, 1536, 2, 1
	wait
	createtask sub_8141C08, 2
	end

Unknown_81D647E: @ 81D647E
	loadsprite 10224
	sprite gBattleAnimSpriteTemplate_83D6734, 130
	end

Unknown_81D6489: @ 81D6489
	createtask sub_8141DAC, 5
	jumpvareq 0, 1, _81D64FD
	jumpvareq 0, 2, _81D6522
	jumpvareq 0, 3, _81D6576
	jumpvareq 0, 4, _81D65D3
	jump _81D64B5
_81D64B5:
	loadsprite 10186
	panse_1C SE_W010, 63, 6, 2
	sprite gBattleAnimSpriteTemplate_83D65A0, 132, 4, 0, 16, 0, 1
	pause 7
	sprite gBattleAnimSpriteTemplate_83D65A0, 130, 4, 0, 8, 1, 1
	pause 3
	createtask sub_80A7FA0, 2, 5, 1, 2, 0, 8, 1
	pause 20
	setvar 7, -1
	panse_19 SE_W020, 63
	wait
	end
_81D64FD:
	loadsprite 10029
	panse_19 SE_W221B, 63
	createtask sub_80A7E7C, 5, 5, 1, 0, 2, 30, 1
	call _81C90BF
	call _81C90BF
	wait
	stopsound
	end
_81D6522:
	loadsprite 10149
	monbg 3
	monbgprio_28 1
	setalpha 12, 8
	pause 0
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 4, 2, 0, 7, 23968
	panse_19 SE_W250, 63
	createtask sub_80A7E7C, 5, 5, 1, 0, 2, 30, 1
	call _81D03E4
	call _81D03E4
	pause 12
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 4, 2, 7, 0, 23968
	wait
	stopsound
	clearmonbg 3
	end
_81D6576:
	loadsprite 10145
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W011, 63
	sprite gBattleAnimSpriteTemplate_83DB1E8, 2, 6, -32, 0, 2, 819, 0, 10
	sprite gBattleAnimSpriteTemplate_83DB1E8, 2, 6, 32, 0, 6, -819, 0, 10
	pause 10
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 5, 5, 1, 3, 0, 5, 1
	wait
	clearmonbg 1
	blendoff
	wait
	end
_81D65D3:
	loadsprite 10074
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 4, 2, 0, 7, 563
	createtask sub_80A7E7C, 5, 5, 1, 0, 2, 30, 1
	panse_19 SE_W328, 63
	call _81D361F
	call _81D361F
	pause 22
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 4, 2, 7, 0, 563
	wait
	stopsound
	end

Unknown_81D661C: @ 81D661C
	loadsprite 10203
	loadsprite 10049
	pause 0
	panse_19 SE_W036, 192
	createtask sub_80A8EFC, 2, 4, 16, 128, 0, 2
	wait
	panse_19 SE_W036, 192
	createtask sub_80A8EFC, 2, 4, 16, 128, 0, 2
	wait
	panse_19 SE_W036, 192
	createtask sub_80A8EFC, 2, 4, 16, 128, 0, 2
	wait
	panse_19 SE_W234, 192
	call Unknown_81D5ECA
	wait
	panse_19 SE_REAPOKE, 192
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 2, 3, 7, 0, 26609
	sprite gBattleAnimSpriteTemplate_83D7928, 3, 4, 0, 0, 0, 0
	wait
	end

Unknown_81D6690: @ 81D6690
	loadsprite 10242
	monbg 0
	setalpha 12, 4
	pause 0
	panse_19 SE_BOWA2, 63
	sprite gBattleAnimSpriteTemplate_8402894, 128, 4, 0, 32, 28, 30
	pause 4
	panse_19 SE_BOWA2, 63
	sprite gBattleAnimSpriteTemplate_8402894, 127, 4, 2, 12, 20, 30
	pause 12
	panse_19 SE_BOWA2, 63
	sprite gBattleAnimSpriteTemplate_8402894, 126, 4, 2, -28, 4, 30
	pause 4
	pause 8
	panse_19 SE_BOWA2, 63
	sprite gBattleAnimSpriteTemplate_8402894, 124, 4, 2, 14, -20, 30
	pause 4
	panse_19 SE_BOWA2, 63
	createtask sub_80DFC24, 2, 1, 2
	sprite gBattleAnimSpriteTemplate_8402894, 123, 4, 3, 4, 4, 30
	pause 14
	panse_19 SE_BOWA2, 63
	sprite gBattleAnimSpriteTemplate_8402894, 122, 4, 3, -14, 18, 46
	pause 0
	sprite gBattleAnimSpriteTemplate_8402894, 121, 4, 3, 14, -14, 46
	pause 0
	sprite gBattleAnimSpriteTemplate_8402894, 120, 4, 3, -12, -10, 46
	pause 0
	sprite gBattleAnimSpriteTemplate_8402894, 119, 4, 3, 14, 14, 46
	pause 0
	sprite gBattleAnimSpriteTemplate_8402894, 118, 4, 3, 0, 0, 46
	wait
	clearmonbg 0
	invisible 0
	pause 0
	blendoff
	end

Unknown_81D676E: @ 81D676E
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 2, 7, 0, 9, 31
	panse_19 SE_W082, 192
	createtask sub_812FC68, 5, 7, 30, 128, 0, 1, 2, 0, 1
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 0, 5, 2, 4, 9, 0, 31
	wait
	pause 6
	sprite gBattleAnimSpriteTemplate_83C1FE0, 0, 3, 0, 0, 15
	end

Unknown_Weather_Rain: @ 81D67BB
	loadsprite 10115
	panse_19 SE_W240, 192
	createtask sub_80E2A38, 10, 5, 1921, 2, 0, 4, 0
	wait
	createtask sub_80D30F0, 2, 3, 0, 3, 60
	createtask sub_80D30F0, 2, 3, 0, 3, 60
	pause 50
	wait
	createtask sub_80E2A38, 10, 5, 1921, 2, 4, 0, 0
	wait
	end

Unknown_Weather_HarshSunlight: @ 81D6804
	jump Move_SUNNY_DAY

Unknown_Weather_Sandstorm: @ 81D6809
	jump Move_SANDSTORM

Unknown_Weather_Hail: @ 81D680E
	jump Move_HAIL

Unknown_81D6813: @ 81D6813
	createtask sub_8141E10, 5
	pause 0
	jump Move_ABSORB

Unknown_81D6821: @ 81D6821
	loadsprite 10135
	monbg 1
	setalpha 12, 8
	panse_19 SE_W003, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 2, 4, 0, 0, 1, 2
	createtask sub_80A7E7C, 2, 5, 1, 3, 0, 6, 1
	wait
	clearmonbg 1
	blendoff
	end

Unknown_81D6852: @ 81D6852
	loadsprite 10224
	createtask sub_80E42D0, 2
	createtask sub_8141808, 2
	pause 1
	sprite gBattleAnimSpriteTemplate_83D677C, 2, 5, 0, -5, 10, 2, -1
	end

Unknown_81D6877: @ 81D6877
	loadsprite 10224
	createtask sub_80E4234, 2
	call Unknown_81D6AB6
	pause 1
	createtask sub_80A8B88, 2, 5, 0, 5, 5120, 4, 1
	wait
	createtask sub_80E4264, 2
	jumpvareq 7, 0, _81D68B5
	jump _81D68C5
_81D68AE:
	wait
	call Unknown_81D6AD6
	end
_81D68B5:
	panse_19 SE_W104, 192
	createtask sub_8131944, 2
	jump _81D68AE
_81D68C5:
	panse_19 SE_W104, 192
	createtask sub_8131FFC, 2
	jump _81D68AE

Unknown_81D68D5: @ 81D68D5
	createtask sub_80E42B0, 2
	monbg 3
	panse_19 SE_W060, 192
	call Unknown_81D61E7
	setalpha 8, 8
	panse_19 SE_W048, 63
	panse_1D SE_W048, 63, 8
	createtask sub_80A7E7C, 2, 5, 1, 4, 0, 15, 1
	createtask sub_80A8D34, 5, 5, -5, -5, 15, 1, 1
	wait
	createtask sub_80A7E7C, 2, 5, 1, 4, 0, 24, 1
	wait
	clearmonbg 3
	blendoff
	wait
	pause 1
	call Unknown_81D61F3
	end

Unknown_81D6934: @ 81D6934
	createtask sub_80E42B0, 2
	loadsprite 10198
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 0, 16, 32767
	wait
	pause 10
	createtask sub_812E14C, 5
	pause 9
	panse_19 SE_W109, 192
	pause 9
	panse_19 SE_W109, 0
	pause 9
	panse_19 SE_W109, 63
	pause 25
	createtask sub_80A8154, 2, 5, 1, 10, 0, 20, 1
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 0, 0, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 24, -24, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -16, 16, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, -24, -12, 1, 1
	pause 6
	panse_19 SE_W120, 63
	sprite gBattleAnimSpriteTemplate_83D7828, 3, 4, 16, 16, 1, 1
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 16, 0, 32767
	wait
	end

Unknown_81D69F9: @ 81D69F9
	loadsprite 10184
	panse_19 SE_W082, 192
	call _81CBAC7
	pause 8
	createtask sub_80E1F8C, 2, 6, 2, 2, 2, 0, 11, 31
	createtask sub_80A7FA0, 2, 5, 0, 1, 0, 32, 1
	call _81CBAC7
	pause 8
	call _81CBAC7
	wait
	end

Unknown_81D6A39: @ 81D6A39
	loadsprite 10147
	loadsprite 10031
	monbg 3
	setalpha 12, 8
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 0, 4, 13293
	wait
	pause 3
	call _81CF496
	wait
	pause 15
	call Unknown_81D5EF5
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 1, 4, 0, 13293
	wait
	clearmonbg 3
	blendoff
	end

Unknown_81D6A7C: @ 81D6A7C
	loadsprite 10031
	loadsprite 10049
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 0, 10, 0
	wait
	panse_19 SE_W025, 192
	call Unknown_81D5ECA
	wait
	call Unknown_81D5EF5
	wait
	sprite gBattleAnimSpriteTemplate_83DB3C4, 2, 5, 1, 3, 10, 0, 0
	end

Unknown_81D6AB6: @ 81D6AB6
	createtask sub_81417D8, 2
	jumpvareq 7, 1, _81D6AC7
_81D6AC5:
	wait
	ret
_81D6AC7:
	createtask sub_814151C, 2, 1, 1
	wait
	jump _81D6AC5

Unknown_81D6AD6: @ 81D6AD6
	createtask sub_81417D8, 2
	jumpvareq 7, 1, _81D6AE7
_81D6AE5:
	wait
	ret
_81D6AE7:
	createtask sub_814151C, 2, 1, 0
	wait
	jump _81D6AE5

Unknown_81D6AF6: @ 81D6AF6
	panse_19 SE_EXPMAX, 0
	createtask sub_813F4EC, 2
	pause 0
	createtask sub_813F6A0, 5, 2, 0, 0
	wait
	createtask sub_813F5E8, 2
	end

Unknown_81D6B17: @ 81D6B17
	createtask sub_813F844, 2
	pause 10
	createtask sub_813F798, 2
	end

Unknown_81D6B28: @ 81D6B28
	createtask sub_813F844, 2
	pause 10
	createtask sub_813F798, 2
	end

Unknown_81D6B39: @ 81D6B39
	createtask sub_813F990, 2
	pause 0
	panse_19 SE_NAGERU, 0
	createtask sub_813FA94, 2
	createtask sub_813F9E0, 2
	jumpvareq 7, -1, _81D6B65
_81D6B5C:
	wait
	createtask sub_813F9B8, 2
	end
_81D6B65:
	loadsprite 10135
	pause 25
	monbg 3
	setalpha 12, 8
	pause 0
	panse_19 SE_W003, 63
	sprite gBattleAnimSpriteTemplate_83DB4A8, 130, 4, -4, -20, 1, 2
	wait
	clearmonbg 3
	blendoff
	jump _81D6B5C

Unknown_81D6B8D: @ 81D6B8D
	createtask sub_813F990, 2
	pause 0
	createtask sub_813FBB8, 2
	wait
	createtask sub_813F9B8, 2
	end

Unknown_81D6BA6: @ 81D6BA6
	createtask sub_814151C, 2, 1, 1
	end

Unknown_81D6BB0: @ 81D6BB0
	createtask sub_814151C, 2, 1, 0
	end
