	.align 2
gBattleMoves:: @ 81FB12C
@ NONE
	.byte EFFECT_HIT
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 0 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ POUND
	.byte EFFECT_HIT
	.byte 40 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 35 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ KARATE_CHOP
	.byte EFFECT_HIGH_CRITICAL
	.byte 50 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ DOUBLE_SLAP
	.byte EFFECT_MULTI_HIT
	.byte 15 @ power
	.byte TYPE_NORMAL
	.byte 85 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ COMET_PUNCH
	.byte EFFECT_MULTI_HIT
	.byte 18 @ power
	.byte TYPE_NORMAL
	.byte 85 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MEGA_PUNCH
	.byte EFFECT_HIT
	.byte 80 @ power
	.byte TYPE_NORMAL
	.byte 85 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ PAY_DAY
	.byte EFFECT_PAY_DAY
	.byte 40 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FIRE_PUNCH
	.byte EFFECT_BURN_HIT
	.byte 75 @ power
	.byte TYPE_FIRE
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ICE_PUNCH
	.byte EFFECT_FREEZE_HIT
	.byte 75 @ power
	.byte TYPE_ICE
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ THUNDER_PUNCH
	.byte EFFECT_PARALYZE_HIT
	.byte 75 @ power
	.byte TYPE_ELECTRIC
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SCRATCH
	.byte EFFECT_HIT
	.byte 40 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 35 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ VICE_GRIP
	.byte EFFECT_HIT
	.byte 55 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ GUILLOTINE
	.byte EFFECT_OHKO
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 30 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ RAZOR_WIND
	.byte EFFECT_RAZOR_WIND
	.byte 80 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SWORDS_DANCE
	.byte EFFECT_ATTACK_UP_2
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ CUT
	.byte EFFECT_HIT
	.byte 50 @ power
	.byte TYPE_NORMAL
	.byte 95 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ GUST
	.byte EFFECT_GUST
	.byte 40 @ power
	.byte TYPE_FLYING
	.byte 100 @ accuracy
	.byte 35 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ WING_ATTACK
	.byte EFFECT_HIT
	.byte 60 @ power
	.byte TYPE_FLYING
	.byte 100 @ accuracy
	.byte 35 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ WHIRLWIND
	.byte EFFECT_ROAR
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte -6 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FLY
	.byte EFFECT_FLY
	.byte 70 @ power
	.byte TYPE_FLYING
	.byte 95 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ BIND
	.byte EFFECT_TRAP
	.byte 15 @ power
	.byte TYPE_NORMAL
	.byte 75 @ accuracy
	.byte 20 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SLAM
	.byte EFFECT_HIT
	.byte 80 @ power
	.byte TYPE_NORMAL
	.byte 75 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ VINE_WHIP
	.byte EFFECT_HIT
	.byte 35 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ STOMP
	.byte EFFECT_FLINCH_HIT_2
	.byte 65 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ DOUBLE_KICK
	.byte EFFECT_DOUBLE_HIT
	.byte 30 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MEGA_KICK
	.byte EFFECT_HIT
	.byte 120 @ power
	.byte TYPE_NORMAL
	.byte 75 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ JUMP_KICK
	.byte EFFECT_RECOIL_IF_MISS
	.byte 70 @ power
	.byte TYPE_FIGHTING
	.byte 95 @ accuracy
	.byte 25 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ROLLING_KICK
	.byte EFFECT_FLINCH_HIT
	.byte 60 @ power
	.byte TYPE_FIGHTING
	.byte 85 @ accuracy
	.byte 15 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SAND_ATTACK
	.byte EFFECT_ACCURACY_DOWN
	.byte 0 @ power
	.byte TYPE_GROUND
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ HEADBUTT
	.byte EFFECT_FLINCH_HIT
	.byte 70 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ HORN_ATTACK
	.byte EFFECT_HIT
	.byte 65 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ FURY_ATTACK
	.byte EFFECT_MULTI_HIT
	.byte 15 @ power
	.byte TYPE_NORMAL
	.byte 85 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ HORN_DRILL
	.byte EFFECT_OHKO
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 30 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ TACKLE
	.byte EFFECT_HIT
	.byte 35 @ power
	.byte TYPE_NORMAL
	.byte 95 @ accuracy
	.byte 35 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ BODY_SLAM
	.byte EFFECT_PARALYZE_HIT
	.byte 85 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ WRAP
	.byte EFFECT_TRAP
	.byte 15 @ power
	.byte TYPE_NORMAL
	.byte 85 @ accuracy
	.byte 20 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ TAKE_DOWN
	.byte EFFECT_RECOIL
	.byte 90 @ power
	.byte TYPE_NORMAL
	.byte 85 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ THRASH
	.byte EFFECT_RAMPAGE
	.byte 90 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 100 @ secondary effect chance
	.byte F_TARGET_RANDOM
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ DOUBLE_EDGE
	.byte EFFECT_DOUBLE_EDGE
	.byte 120 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ TAIL_WHIP
	.byte EFFECT_DEFENSE_DOWN
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ POISON_STING
	.byte EFFECT_POISON_HIT
	.byte 15 @ power
	.byte TYPE_POISON
	.byte 100 @ accuracy
	.byte 35 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ TWINEEDLE
	.byte EFFECT_TWINEEDLE
	.byte 25 @ power
	.byte TYPE_BUG
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 20 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ PIN_MISSILE
	.byte EFFECT_MULTI_HIT
	.byte 14 @ power
	.byte TYPE_BUG
	.byte 85 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ LEER
	.byte EFFECT_DEFENSE_DOWN
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ BITE
	.byte EFFECT_FLINCH_HIT
	.byte 60 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ GROWL
	.byte EFFECT_ATTACK_DOWN
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ ROAR
	.byte EFFECT_ROAR
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte -6 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SING
	.byte EFFECT_SLEEP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 55 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ SUPERSONIC
	.byte EFFECT_CONFUSE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 55 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ SONIC_BOOM
	.byte EFFECT_SONICBOOM
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 90 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ DISABLE
	.byte EFFECT_DISABLE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 55 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ ACID
	.byte EFFECT_DEFENSE_DOWN_HIT
	.byte 40 @ power
	.byte TYPE_POISON
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 10 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ EMBER
	.byte EFFECT_BURN_HIT
	.byte 40 @ power
	.byte TYPE_FIRE
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FLAMETHROWER
	.byte EFFECT_BURN_HIT
	.byte 95 @ power
	.byte TYPE_FIRE
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ MIST
	.byte EFFECT_MIST
	.byte 0 @ power
	.byte TYPE_ICE
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ WATER_GUN
	.byte EFFECT_HIT
	.byte 40 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ HYDRO_PUMP
	.byte EFFECT_HIT
	.byte 120 @ power
	.byte TYPE_WATER
	.byte 80 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SURF
	.byte EFFECT_HIT
	.byte 95 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ ICE_BEAM
	.byte EFFECT_FREEZE_HIT
	.byte 95 @ power
	.byte TYPE_ICE
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ BLIZZARD
	.byte EFFECT_FREEZE_HIT
	.byte 120 @ power
	.byte TYPE_ICE
	.byte 70 @ accuracy
	.byte 5 @ PP
	.byte 10 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ PSYBEAM
	.byte EFFECT_CONFUSE_HIT
	.byte 65 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ BUBBLE_BEAM
	.byte EFFECT_SPEED_DOWN_HIT
	.byte 65 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ AURORA_BEAM
	.byte EFFECT_ATTACK_DOWN_HIT
	.byte 65 @ power
	.byte TYPE_ICE
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ HYPER_BEAM
	.byte EFFECT_RECHARGE
	.byte 150 @ power
	.byte TYPE_NORMAL
	.byte 90 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ PECK
	.byte EFFECT_HIT
	.byte 35 @ power
	.byte TYPE_FLYING
	.byte 100 @ accuracy
	.byte 35 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ DRILL_PECK
	.byte EFFECT_HIT
	.byte 80 @ power
	.byte TYPE_FLYING
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SUBMISSION
	.byte EFFECT_RECOIL
	.byte 80 @ power
	.byte TYPE_FIGHTING
	.byte 80 @ accuracy
	.byte 25 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ LOW_KICK
	.byte EFFECT_LOW_KICK
	.byte 1 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ COUNTER
	.byte EFFECT_COUNTER
	.byte 1 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte -5 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_MAKES_CONTACT @ misc. flags

@ SEISMIC_TOSS
	.byte EFFECT_LEVEL_DAMAGE
	.byte 1 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ STRENGTH
	.byte EFFECT_HIT
	.byte 80 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ABSORB
	.byte EFFECT_ABSORB
	.byte 20 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ MEGA_DRAIN
	.byte EFFECT_ABSORB
	.byte 40 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ LEECH_SEED
	.byte EFFECT_LEECH_SEED
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 90 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ GROWTH
	.byte EFFECT_SPECIAL_ATTACK_UP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ RAZOR_LEAF
	.byte EFFECT_HIGH_CRITICAL
	.byte 55 @ power
	.byte TYPE_GRASS
	.byte 95 @ accuracy
	.byte 25 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SOLAR_BEAM
	.byte EFFECT_SOLARBEAM
	.byte 120 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ POISON_POWDER
	.byte EFFECT_POISON
	.byte 0 @ power
	.byte TYPE_POISON
	.byte 75 @ accuracy
	.byte 35 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ STUN_SPORE
	.byte EFFECT_PARALYZE
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 75 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ SLEEP_POWDER
	.byte EFFECT_SLEEP
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 75 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ PETAL_DANCE
	.byte EFFECT_RAMPAGE
	.byte 70 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 100 @ secondary effect chance
	.byte F_TARGET_RANDOM
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ STRING_SHOT
	.byte EFFECT_SPEED_DOWN
	.byte 0 @ power
	.byte TYPE_BUG
	.byte 95 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ DRAGON_RAGE
	.byte EFFECT_DRAGON_RAGE
	.byte 1 @ power
	.byte TYPE_DRAGON
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FIRE_SPIN
	.byte EFFECT_TRAP
	.byte 15 @ power
	.byte TYPE_FIRE
	.byte 70 @ accuracy
	.byte 15 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ THUNDER_SHOCK
	.byte EFFECT_PARALYZE_HIT
	.byte 40 @ power
	.byte TYPE_ELECTRIC
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ THUNDERBOLT
	.byte EFFECT_PARALYZE_HIT
	.byte 95 @ power
	.byte TYPE_ELECTRIC
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ THUNDER_WAVE
	.byte EFFECT_PARALYZE
	.byte 0 @ power
	.byte TYPE_ELECTRIC
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ THUNDER
	.byte EFFECT_THUNDER
	.byte 120 @ power
	.byte TYPE_ELECTRIC
	.byte 70 @ accuracy
	.byte 10 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ ROCK_THROW
	.byte EFFECT_HIT
	.byte 50 @ power
	.byte TYPE_ROCK
	.byte 90 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ EARTHQUAKE
	.byte EFFECT_EARTHQUAKE
	.byte 100 @ power
	.byte TYPE_GROUND
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_ALL_EXCEPT_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FISSURE
	.byte EFFECT_OHKO
	.byte 1 @ power
	.byte TYPE_GROUND
	.byte 30 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ DIG
	.byte EFFECT_FLY
	.byte 60 @ power
	.byte TYPE_GROUND
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ TOXIC
	.byte EFFECT_TOXIC
	.byte 0 @ power
	.byte TYPE_POISON
	.byte 85 @ accuracy
	.byte 10 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ CONFUSION
	.byte EFFECT_CONFUSE_HIT
	.byte 50 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ PSYCHIC
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_HIT
	.byte 90 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ HYPNOSIS
	.byte EFFECT_SLEEP
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 60 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ MEDITATE
	.byte EFFECT_ATTACK_UP
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ AGILITY
	.byte EFFECT_SPEED_UP_2
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ QUICK_ATTACK
	.byte EFFECT_QUICK_ATTACK
	.byte 40 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 1 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ RAGE
	.byte EFFECT_RAGE
	.byte 20 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ TELEPORT
	.byte EFFECT_TELEPORT
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ NIGHT_SHADE
	.byte EFFECT_LEVEL_DAMAGE
	.byte 1 @ power
	.byte TYPE_GHOST
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ MIMIC
	.byte EFFECT_MIMIC
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_PROTECT @ misc. flags

@ SCREECH
	.byte EFFECT_DEFENSE_DOWN_2
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 85 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ DOUBLE_TEAM
	.byte EFFECT_EVASION_UP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ RECOVER
	.byte EFFECT_RESTORE_HP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ HARDEN
	.byte EFFECT_DEFENSE_UP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ MINIMIZE
	.byte EFFECT_MINIMIZE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ SMOKESCREEN
	.byte EFFECT_ACCURACY_DOWN
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ CONFUSE_RAY
	.byte EFFECT_CONFUSE
	.byte 0 @ power
	.byte TYPE_GHOST
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ WITHDRAW
	.byte EFFECT_DEFENSE_UP
	.byte 0 @ power
	.byte TYPE_WATER
	.byte 0 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ DEFENSE_CURL
	.byte EFFECT_DEFENSE_CURL
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ BARRIER
	.byte EFFECT_DEFENSE_UP_2
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ LIGHT_SCREEN
	.byte EFFECT_LIGHT_SCREEN
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ HAZE
	.byte EFFECT_HAZE
	.byte 0 @ power
	.byte TYPE_ICE
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_PROTECT @ misc. flags

@ REFLECT
	.byte EFFECT_REFLECT
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ FOCUS_ENERGY
	.byte EFFECT_FOCUS_ENERGY
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ BIDE
	.byte EFFECT_BIDE
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ METRONOME
	.byte EFFECT_METRONOME
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ MIRROR_MOVE
	.byte EFFECT_MIRROR_MOVE
	.byte 0 @ power
	.byte TYPE_FLYING
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ SELF_DESTRUCT
	.byte EFFECT_EXPLOSION
	.byte 200 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_ALL_EXCEPT_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ EGG_BOMB
	.byte EFFECT_HIT
	.byte 100 @ power
	.byte TYPE_NORMAL
	.byte 75 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ LICK
	.byte EFFECT_PARALYZE_HIT
	.byte 20 @ power
	.byte TYPE_GHOST
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SMOG
	.byte EFFECT_POISON_HIT
	.byte 20 @ power
	.byte TYPE_POISON
	.byte 70 @ accuracy
	.byte 20 @ PP
	.byte 40 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SLUDGE
	.byte EFFECT_POISON_HIT
	.byte 65 @ power
	.byte TYPE_POISON
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ BONE_CLUB
	.byte EFFECT_FLINCH_HIT
	.byte 65 @ power
	.byte TYPE_GROUND
	.byte 85 @ accuracy
	.byte 20 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FIRE_BLAST
	.byte EFFECT_BURN_HIT
	.byte 120 @ power
	.byte TYPE_FIRE
	.byte 85 @ accuracy
	.byte 5 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ WATERFALL
	.byte EFFECT_HIT
	.byte 80 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ CLAMP
	.byte EFFECT_TRAP
	.byte 35 @ power
	.byte TYPE_WATER
	.byte 75 @ accuracy
	.byte 10 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SWIFT
	.byte EFFECT_ALWAYS_HIT
	.byte 60 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SKULL_BASH
	.byte EFFECT_SKULL_BASH
	.byte 100 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SPIKE_CANNON
	.byte EFFECT_MULTI_HIT
	.byte 20 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ CONSTRICT
	.byte EFFECT_SPEED_DOWN_HIT
	.byte 10 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 35 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ AMNESIA
	.byte EFFECT_SPECIAL_DEFENSE_UP_2
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ KINESIS
	.byte EFFECT_ACCURACY_DOWN
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 80 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SOFT_BOILED
	.byte EFFECT_SOFTBOILED
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_SNATCH @ misc. flags

@ HI_JUMP_KICK
	.byte EFFECT_RECOIL_IF_MISS
	.byte 85 @ power
	.byte TYPE_FIGHTING
	.byte 90 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ GLARE
	.byte EFFECT_PARALYZE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 75 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ DREAM_EATER
	.byte EFFECT_DREAM_EATER
	.byte 100 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ POISON_GAS
	.byte EFFECT_POISON
	.byte 0 @ power
	.byte TYPE_POISON
	.byte 55 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ BARRAGE
	.byte EFFECT_MULTI_HIT
	.byte 15 @ power
	.byte TYPE_NORMAL
	.byte 85 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ LEECH_LIFE
	.byte EFFECT_ABSORB
	.byte 20 @ power
	.byte TYPE_BUG
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ LOVELY_KISS
	.byte EFFECT_SLEEP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 75 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ SKY_ATTACK
	.byte EFFECT_SKY_ATTACK
	.byte 140 @ power
	.byte TYPE_FLYING
	.byte 90 @ accuracy
	.byte 5 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ TRANSFORM
	.byte EFFECT_TRANSFORM
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ BUBBLE
	.byte EFFECT_SPEED_DOWN_HIT
	.byte 20 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 10 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ DIZZY_PUNCH
	.byte EFFECT_CONFUSE_HIT
	.byte 70 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 20 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SPORE
	.byte EFFECT_SLEEP
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ FLASH
	.byte EFFECT_ACCURACY_DOWN
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 70 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ PSYWAVE
	.byte EFFECT_PSYWAVE
	.byte 1 @ power
	.byte TYPE_PSYCHIC
	.byte 80 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SPLASH
	.byte EFFECT_SPLASH
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ ACID_ARMOR
	.byte EFFECT_DEFENSE_UP_2
	.byte 0 @ power
	.byte TYPE_POISON
	.byte 0 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ CRABHAMMER
	.byte EFFECT_HIGH_CRITICAL
	.byte 90 @ power
	.byte TYPE_WATER
	.byte 85 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ EXPLOSION
	.byte EFFECT_EXPLOSION
	.byte 250 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_ALL_EXCEPT_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FURY_SWIPES
	.byte EFFECT_MULTI_HIT
	.byte 18 @ power
	.byte TYPE_NORMAL
	.byte 80 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ BONEMERANG
	.byte EFFECT_DOUBLE_HIT
	.byte 50 @ power
	.byte TYPE_GROUND
	.byte 90 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ REST
	.byte EFFECT_REST
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ ROCK_SLIDE
	.byte EFFECT_FLINCH_HIT
	.byte 75 @ power
	.byte TYPE_ROCK
	.byte 90 @ accuracy
	.byte 10 @ PP
	.byte 30 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ HYPER_FANG
	.byte EFFECT_FLINCH_HIT
	.byte 80 @ power
	.byte TYPE_NORMAL
	.byte 90 @ accuracy
	.byte 15 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SHARPEN
	.byte EFFECT_ATTACK_UP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ CONVERSION
	.byte EFFECT_CONVERSION
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ TRI_ATTACK
	.byte EFFECT_TRI_ATTACK
	.byte 80 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 20 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SUPER_FANG
	.byte EFFECT_SUPER_FANG
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 90 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SLASH
	.byte EFFECT_HIGH_CRITICAL
	.byte 70 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SUBSTITUTE
	.byte EFFECT_SUBSTITUTE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ STRUGGLE
	.byte EFFECT_RECOIL
	.byte 50 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 1 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SKETCH
	.byte EFFECT_SKETCH
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 1 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ TRIPLE_KICK
	.byte EFFECT_TRIPLE_KICK
	.byte 10 @ power
	.byte TYPE_FIGHTING
	.byte 90 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ THIEF
	.byte EFFECT_THIEF
	.byte 40 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SPIDER_WEB
	.byte EFFECT_MEAN_LOOK
	.byte 0 @ power
	.byte TYPE_BUG
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ MIND_READER
	.byte EFFECT_LOCK_ON
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ NIGHTMARE
	.byte EFFECT_NIGHTMARE
	.byte 0 @ power
	.byte TYPE_GHOST
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FLAME_WHEEL
	.byte EFFECT_THAW_HIT
	.byte 60 @ power
	.byte TYPE_FIRE
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SNORE
	.byte EFFECT_SNORE
	.byte 40 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ CURSE
	.byte EFFECT_CURSE
	.byte 0 @ power
	.byte TYPE_UNKNOWN
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ FLAIL
	.byte EFFECT_FLAIL
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ CONVERSION_2
	.byte EFFECT_CONVERSION_2
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ AEROBLAST
	.byte EFFECT_HIGH_CRITICAL
	.byte 100 @ power
	.byte TYPE_FLYING
	.byte 95 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ COTTON_SPORE
	.byte EFFECT_SPEED_DOWN_2
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 85 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ REVERSAL
	.byte EFFECT_FLAIL
	.byte 1 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SPITE
	.byte EFFECT_SPITE
	.byte 0 @ power
	.byte TYPE_GHOST
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ POWDER_SNOW
	.byte EFFECT_FREEZE_HIT
	.byte 40 @ power
	.byte TYPE_ICE
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 10 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ PROTECT
	.byte EFFECT_PROTECT
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 3 @ priority
	.4byte 0 @ misc. flags

@ MACH_PUNCH
	.byte EFFECT_QUICK_ATTACK
	.byte 40 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 1 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SCARY_FACE
	.byte EFFECT_SPEED_DOWN_2
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 90 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ FAINT_ATTACK
	.byte EFFECT_ALWAYS_HIT
	.byte 60 @ power
	.byte TYPE_DARK
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SWEET_KISS
	.byte EFFECT_CONFUSE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 75 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ BELLY_DRUM
	.byte EFFECT_BELLY_DRUM
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ SLUDGE_BOMB
	.byte EFFECT_POISON_HIT
	.byte 90 @ power
	.byte TYPE_POISON
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ MUD_SLAP
	.byte EFFECT_ACCURACY_DOWN_HIT
	.byte 20 @ power
	.byte TYPE_GROUND
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ OCTAZOOKA
	.byte EFFECT_ACCURACY_DOWN_HIT
	.byte 65 @ power
	.byte TYPE_WATER
	.byte 85 @ accuracy
	.byte 10 @ PP
	.byte 50 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SPIKES
	.byte EFFECT_SPIKES
	.byte 0 @ power
	.byte TYPE_GROUND
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_ENEMY_SIDE
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ ZAP_CANNON
	.byte EFFECT_PARALYZE_HIT
	.byte 100 @ power
	.byte TYPE_ELECTRIC
	.byte 50 @ accuracy
	.byte 5 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FORESIGHT
	.byte EFFECT_FORESIGHT
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ DESTINY_BOND
	.byte EFFECT_DESTINY_BOND
	.byte 0 @ power
	.byte TYPE_GHOST
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ PERISH_SONG
	.byte EFFECT_PERISH_SONG
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ ICY_WIND
	.byte EFFECT_SPEED_DOWN_HIT
	.byte 55 @ power
	.byte TYPE_ICE
	.byte 95 @ accuracy
	.byte 15 @ PP
	.byte 100 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ DETECT
	.byte EFFECT_PROTECT
	.byte 0 @ power
	.byte TYPE_FIGHTING
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 3 @ priority
	.4byte 0 @ misc. flags

@ BONE_RUSH
	.byte EFFECT_MULTI_HIT
	.byte 25 @ power
	.byte TYPE_GROUND
	.byte 80 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ LOCK_ON
	.byte EFFECT_LOCK_ON
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ OUTRAGE
	.byte EFFECT_RAMPAGE
	.byte 90 @ power
	.byte TYPE_DRAGON
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 100 @ secondary effect chance
	.byte F_TARGET_RANDOM
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SANDSTORM
	.byte EFFECT_SANDSTORM
	.byte 0 @ power
	.byte TYPE_ROCK
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ GIGA_DRAIN
	.byte EFFECT_ABSORB
	.byte 60 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ ENDURE
	.byte EFFECT_ENDURE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 3 @ priority
	.4byte 0 @ misc. flags

@ CHARM
	.byte EFFECT_ATTACK_DOWN_2
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ ROLLOUT
	.byte EFFECT_ROLLOUT
	.byte 30 @ power
	.byte TYPE_ROCK
	.byte 90 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ FALSE_SWIPE
	.byte EFFECT_FALSE_SWIPE
	.byte 40 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SWAGGER
	.byte EFFECT_SWAGGER
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 90 @ accuracy
	.byte 15 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ MILK_DRINK
	.byte EFFECT_SOFTBOILED
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH | F_AFFECTED_BY_PROTECT @ misc. flags

@ SPARK
	.byte EFFECT_PARALYZE_HIT
	.byte 65 @ power
	.byte TYPE_ELECTRIC
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ FURY_CUTTER
	.byte EFFECT_FURY_CUTTER
	.byte 10 @ power
	.byte TYPE_BUG
	.byte 95 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ STEEL_WING
	.byte EFFECT_DEFENSE_UP_HIT
	.byte 70 @ power
	.byte TYPE_STEEL
	.byte 90 @ accuracy
	.byte 25 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MEAN_LOOK
	.byte EFFECT_MEAN_LOOK
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ ATTRACT
	.byte EFFECT_ATTRACT
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ SLEEP_TALK
	.byte EFFECT_SLEEP_TALK
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ HEAL_BELL
	.byte EFFECT_HEAL_BELL
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ RETURN
	.byte EFFECT_RETURN
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ PRESENT
	.byte EFFECT_PRESENT
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 90 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FRUSTRATION
	.byte EFFECT_FRUSTRATION
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SAFEGUARD
	.byte EFFECT_SAFEGUARD
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 25 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ PAIN_SPLIT
	.byte EFFECT_PAIN_SPLIT
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SACRED_FIRE
	.byte EFFECT_THAW_HIT
	.byte 100 @ power
	.byte TYPE_FIRE
	.byte 95 @ accuracy
	.byte 5 @ PP
	.byte 50 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ MAGNITUDE
	.byte EFFECT_MAGNITUDE
	.byte 1 @ power
	.byte TYPE_GROUND
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_ALL_EXCEPT_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ DYNAMIC_PUNCH
	.byte EFFECT_CONFUSE_HIT
	.byte 100 @ power
	.byte TYPE_FIGHTING
	.byte 50 @ accuracy
	.byte 5 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MEGAHORN
	.byte EFFECT_HIT
	.byte 120 @ power
	.byte TYPE_BUG
	.byte 85 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ DRAGON_BREATH
	.byte EFFECT_PARALYZE_HIT
	.byte 60 @ power
	.byte TYPE_DRAGON
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ BATON_PASS
	.byte EFFECT_BATON_PASS
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ ENCORE
	.byte EFFECT_ENCORE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ PURSUIT
	.byte EFFECT_PURSUIT
	.byte 40 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ RAPID_SPIN
	.byte EFFECT_RAPID_SPIN
	.byte 20 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SWEET_SCENT
	.byte EFFECT_EVASION_DOWN
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ IRON_TAIL
	.byte EFFECT_DEFENSE_DOWN_HIT
	.byte 100 @ power
	.byte TYPE_STEEL
	.byte 75 @ accuracy
	.byte 15 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ METAL_CLAW
	.byte EFFECT_ATTACK_UP_HIT
	.byte 50 @ power
	.byte TYPE_STEEL
	.byte 95 @ accuracy
	.byte 35 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ VITAL_THROW
	.byte EFFECT_VITAL_THROW
	.byte 70 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte -1 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MORNING_SUN
	.byte EFFECT_MORNING_SUN
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ SYNTHESIS
	.byte EFFECT_SYNTHESIS
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ MOONLIGHT
	.byte EFFECT_MOONLIGHT
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ HIDDEN_POWER
	.byte EFFECT_HIDDEN_POWER
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ CROSS_CHOP
	.byte EFFECT_HIGH_CRITICAL
	.byte 100 @ power
	.byte TYPE_FIGHTING
	.byte 80 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ TWISTER
	.byte EFFECT_TWISTER
	.byte 40 @ power
	.byte TYPE_DRAGON
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 20 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ RAIN_DANCE
	.byte EFFECT_RAIN_DANCE
	.byte 0 @ power
	.byte TYPE_WATER
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ SUNNY_DAY
	.byte EFFECT_SUNNY_DAY
	.byte 0 @ power
	.byte TYPE_FIRE
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ CRUNCH
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_HIT
	.byte 80 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 20 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MIRROR_COAT
	.byte EFFECT_MIRROR_COAT
	.byte 1 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte -5 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE @ misc. flags

@ PSYCH_UP
	.byte EFFECT_PSYCH_UP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ EXTREME_SPEED
	.byte EFFECT_QUICK_ATTACK
	.byte 80 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 1 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ANCIENT_POWER
	.byte EFFECT_ALL_STATS_UP_HIT
	.byte 60 @ power
	.byte TYPE_ROCK
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SHADOW_BALL
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_HIT
	.byte 80 @ power
	.byte TYPE_GHOST
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 20 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FUTURE_SIGHT
	.byte EFFECT_FUTURE_SIGHT
	.byte 80 @ power
	.byte TYPE_PSYCHIC
	.byte 90 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ ROCK_SMASH
	.byte EFFECT_DEFENSE_DOWN_HIT
	.byte 20 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 50 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ WHIRLPOOL
	.byte EFFECT_TRAP
	.byte 15 @ power
	.byte TYPE_WATER
	.byte 70 @ accuracy
	.byte 15 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ BEAT_UP
	.byte EFFECT_BEAT_UP
	.byte 10 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FAKE_OUT
	.byte EFFECT_FAKE_OUT
	.byte 40 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 1 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ UPROAR
	.byte EFFECT_UPROAR
	.byte 50 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 100 @ secondary effect chance
	.byte F_TARGET_RANDOM
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ STOCKPILE
	.byte EFFECT_STOCKPILE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ SPIT_UP
	.byte EFFECT_SPIT_UP
	.byte 100 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_AFFECTED_BY_PROTECT @ misc. flags

@ SWALLOW
	.byte EFFECT_SWALLOW
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ HEAT_WAVE
	.byte EFFECT_BURN_HIT
	.byte 100 @ power
	.byte TYPE_FIRE
	.byte 90 @ accuracy
	.byte 10 @ PP
	.byte 10 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ HAIL
	.byte EFFECT_HAIL
	.byte 0 @ power
	.byte TYPE_ICE
	.byte 0 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_PROTECT @ misc. flags

@ TORMENT
	.byte EFFECT_TORMENT
	.byte 0 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FLATTER
	.byte EFFECT_FLATTER
	.byte 0 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ WILL_O_WISP
	.byte EFFECT_WILL_O_WISP
	.byte 0 @ power
	.byte TYPE_FIRE
	.byte 75 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ MEMENTO
	.byte EFFECT_MEMENTO
	.byte 0 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FACADE
	.byte EFFECT_FACADE
	.byte 70 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ FOCUS_PUNCH
	.byte EFFECT_FOCUS_PUNCH
	.byte 150 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte -3 @ priority
	.4byte F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SMELLING_SALT
	.byte EFFECT_SMELLINGSALT
	.byte 60 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ FOLLOW_ME
	.byte EFFECT_FOLLOW_ME
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 3 @ priority
	.4byte 0 @ misc. flags

@ NATURE_POWER
	.byte EFFECT_NATURE_POWER
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 95 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ CHARGE
	.byte EFFECT_CHARGE
	.byte 0 @ power
	.byte TYPE_ELECTRIC
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ TAUNT
	.byte EFFECT_TAUNT
	.byte 0 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_PROTECT @ misc. flags

@ HELPING_HAND
	.byte EFFECT_HELPING_HAND
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 5 @ priority
	.4byte 0 @ misc. flags

@ TRICK
	.byte EFFECT_TRICK
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ ROLE_PLAY
	.byte EFFECT_ROLE_PLAY
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ WISH
	.byte EFFECT_WISH
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_PROTECT @ misc. flags

@ ASSIST
	.byte EFFECT_ASSIST
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ INGRAIN
	.byte EFFECT_INGRAIN
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ SUPERPOWER
	.byte EFFECT_SUPERPOWER
	.byte 120 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MAGIC_COAT
	.byte EFFECT_MAGIC_COAT
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte 4 @ priority
	.4byte 0 @ misc. flags

@ RECYCLE
	.byte EFFECT_RECYCLE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ REVENGE
	.byte EFFECT_REVENGE
	.byte 60 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte -4 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ BRICK_BREAK
	.byte EFFECT_BRICK_BREAK
	.byte 75 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ YAWN
	.byte EFFECT_YAWN
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ KNOCK_OFF
	.byte EFFECT_KNOCK_OFF
	.byte 20 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ENDEAVOR
	.byte EFFECT_ENDEAVOR
	.byte 1 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ERUPTION
	.byte EFFECT_ERUPTION
	.byte 150 @ power
	.byte TYPE_FIRE
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SKILL_SWAP
	.byte EFFECT_SKILL_SWAP
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ IMPRISON
	.byte EFFECT_IMPRISON
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_PROTECT @ misc. flags

@ REFRESH
	.byte EFFECT_REFRESH
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ GRUDGE
	.byte EFFECT_GRUDGE
	.byte 0 @ power
	.byte TYPE_GHOST
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SNATCH
	.byte EFFECT_SNATCH
	.byte 0 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_SPECIAL
	.byte 4 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE @ misc. flags

@ SECRET_POWER
	.byte EFFECT_SECRET_POWER
	.byte 70 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ DIVE
	.byte EFFECT_FLY
	.byte 60 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ARM_THRUST
	.byte EFFECT_MULTI_HIT
	.byte 15 @ power
	.byte TYPE_FIGHTING
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ CAMOUFLAGE
	.byte EFFECT_CAMOUFLAGE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ TAIL_GLOW
	.byte EFFECT_SPECIAL_ATTACK_UP_2
	.byte 0 @ power
	.byte TYPE_BUG
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ LUSTER_PURGE
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_HIT
	.byte 70 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 50 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ MIST_BALL
	.byte EFFECT_SPECIAL_ATTACK_DOWN_HIT
	.byte 70 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 50 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ FEATHER_DANCE
	.byte EFFECT_ATTACK_DOWN_2
	.byte 0 @ power
	.byte TYPE_FLYING
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ TEETER_DANCE
	.byte EFFECT_TEETER_DANCE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_ALL_EXCEPT_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_PROTECT @ misc. flags

@ BLAZE_KICK
	.byte EFFECT_BLAZE_KICK
	.byte 85 @ power
	.byte TYPE_FIRE
	.byte 90 @ accuracy
	.byte 10 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MUD_SPORT
	.byte EFFECT_MUD_SPORT
	.byte 0 @ power
	.byte TYPE_GROUND
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ ICE_BALL
	.byte EFFECT_ROLLOUT
	.byte 30 @ power
	.byte TYPE_ICE
	.byte 90 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ NEEDLE_ARM
	.byte EFFECT_FLINCH_HIT_2
	.byte 60 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SLACK_OFF
	.byte EFFECT_RESTORE_HP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ HYPER_VOICE
	.byte EFFECT_HIT
	.byte 90 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ POISON_FANG
	.byte EFFECT_POISON_FANG
	.byte 50 @ power
	.byte TYPE_POISON
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ CRUSH_CLAW
	.byte EFFECT_DEFENSE_DOWN_HIT
	.byte 75 @ power
	.byte TYPE_NORMAL
	.byte 95 @ accuracy
	.byte 10 @ PP
	.byte 50 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ BLAST_BURN
	.byte EFFECT_RECHARGE
	.byte 150 @ power
	.byte TYPE_FIRE
	.byte 90 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ HYDRO_CANNON
	.byte EFFECT_RECHARGE
	.byte 150 @ power
	.byte TYPE_WATER
	.byte 90 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ METEOR_MASH
	.byte EFFECT_ATTACK_UP_HIT
	.byte 100 @ power
	.byte TYPE_STEEL
	.byte 85 @ accuracy
	.byte 10 @ PP
	.byte 20 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ASTONISH
	.byte EFFECT_FLINCH_HIT_2
	.byte 30 @ power
	.byte TYPE_GHOST
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ WEATHER_BALL
	.byte EFFECT_WEATHER_BALL
	.byte 50 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ AROMATHERAPY
	.byte EFFECT_HEAL_BELL
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 0 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ FAKE_TEARS
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte 0 @ power
	.byte TYPE_DARK
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ AIR_CUTTER
	.byte EFFECT_HIGH_CRITICAL
	.byte 55 @ power
	.byte TYPE_FLYING
	.byte 95 @ accuracy
	.byte 25 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ OVERHEAT
	.byte EFFECT_OVERHEAT
	.byte 140 @ power
	.byte TYPE_FIRE
	.byte 90 @ accuracy
	.byte 5 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ODOR_SLEUTH
	.byte EFFECT_FORESIGHT
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ ROCK_TOMB
	.byte EFFECT_SPEED_DOWN_HIT
	.byte 50 @ power
	.byte TYPE_ROCK
	.byte 80 @ accuracy
	.byte 10 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SILVER_WIND
	.byte EFFECT_ALL_STATS_UP_HIT
	.byte 60 @ power
	.byte TYPE_BUG
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ METAL_SOUND
	.byte EFFECT_SPECIAL_DEFENSE_DOWN_2
	.byte 0 @ power
	.byte TYPE_STEEL
	.byte 85 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ GRASS_WHISTLE
	.byte EFFECT_SLEEP
	.byte 0 @ power
	.byte TYPE_GRASS
	.byte 55 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ TICKLE
	.byte EFFECT_TICKLE
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ COSMIC_POWER
	.byte EFFECT_COSMIC_POWER
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ WATER_SPOUT
	.byte EFFECT_ERUPTION
	.byte 150 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SIGNAL_BEAM
	.byte EFFECT_CONFUSE_HIT
	.byte 75 @ power
	.byte TYPE_BUG
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SHADOW_PUNCH
	.byte EFFECT_ALWAYS_HIT
	.byte 60 @ power
	.byte TYPE_GHOST
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ EXTRASENSORY
	.byte EFFECT_FLINCH_HIT_2
	.byte 80 @ power
	.byte TYPE_PSYCHIC
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SKY_UPPERCUT
	.byte EFFECT_SKY_UPPERCUT
	.byte 85 @ power
	.byte TYPE_FIGHTING
	.byte 90 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ SAND_TOMB
	.byte EFFECT_TRAP
	.byte 15 @ power
	.byte TYPE_GROUND
	.byte 70 @ accuracy
	.byte 15 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SHEER_COLD
	.byte EFFECT_OHKO
	.byte 1 @ power
	.byte TYPE_ICE
	.byte 30 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ MUDDY_WATER
	.byte EFFECT_ACCURACY_DOWN_HIT
	.byte 95 @ power
	.byte TYPE_WATER
	.byte 85 @ accuracy
	.byte 10 @ PP
	.byte 30 @ secondary effect chance
	.byte F_TARGET_BOTH_ENEMIES
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ BULLET_SEED
	.byte EFFECT_MULTI_HIT
	.byte 10 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ AERIAL_ACE
	.byte EFFECT_ALWAYS_HIT
	.byte 60 @ power
	.byte TYPE_FLYING
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ ICICLE_SPEAR
	.byte EFFECT_MULTI_HIT
	.byte 10 @ power
	.byte TYPE_ICE
	.byte 100 @ accuracy
	.byte 30 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ IRON_DEFENSE
	.byte EFFECT_DEFENSE_UP_2
	.byte 0 @ power
	.byte TYPE_STEEL
	.byte 0 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ BLOCK
	.byte EFFECT_MEAN_LOOK
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_MAGIC_COAT | F_AFFECTED_BY_PROTECT @ misc. flags

@ HOWL
	.byte EFFECT_ATTACK_UP
	.byte 0 @ power
	.byte TYPE_NORMAL
	.byte 0 @ accuracy
	.byte 40 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ DRAGON_CLAW
	.byte EFFECT_HIT
	.byte 80 @ power
	.byte TYPE_DRAGON
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ FRENZY_PLANT
	.byte EFFECT_RECHARGE
	.byte 150 @ power
	.byte TYPE_GRASS
	.byte 90 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ BULK_UP
	.byte EFFECT_BULK_UP
	.byte 0 @ power
	.byte TYPE_FIGHTING
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ BOUNCE
	.byte EFFECT_FLY
	.byte 85 @ power
	.byte TYPE_FLYING
	.byte 85 @ accuracy
	.byte 5 @ PP
	.byte 30 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MUD_SHOT
	.byte EFFECT_SPEED_DOWN_HIT
	.byte 55 @ power
	.byte TYPE_GROUND
	.byte 95 @ accuracy
	.byte 15 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ POISON_TAIL
	.byte EFFECT_POISON_TAIL
	.byte 50 @ power
	.byte TYPE_POISON
	.byte 100 @ accuracy
	.byte 25 @ PP
	.byte 10 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ COVET
	.byte EFFECT_THIEF
	.byte 40 @ power
	.byte TYPE_NORMAL
	.byte 100 @ accuracy
	.byte 40 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ VOLT_TACKLE
	.byte EFFECT_DOUBLE_EDGE
	.byte 120 @ power
	.byte TYPE_ELECTRIC
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ MAGICAL_LEAF
	.byte EFFECT_ALWAYS_HIT
	.byte 60 @ power
	.byte TYPE_GRASS
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ WATER_SPORT
	.byte EFFECT_WATER_SPORT
	.byte 0 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ CALM_MIND
	.byte EFFECT_CALM_MIND
	.byte 0 @ power
	.byte TYPE_PSYCHIC
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ LEAF_BLADE
	.byte EFFECT_HIGH_CRITICAL
	.byte 70 @ power
	.byte TYPE_GRASS
	.byte 100 @ accuracy
	.byte 15 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT | F_MAKES_CONTACT @ misc. flags

@ DRAGON_DANCE
	.byte EFFECT_DRAGON_DANCE
	.byte 0 @ power
	.byte TYPE_DRAGON
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte F_TARGET_USER
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_SNATCH @ misc. flags

@ ROCK_BLAST
	.byte EFFECT_MULTI_HIT
	.byte 25 @ power
	.byte TYPE_ROCK
	.byte 80 @ accuracy
	.byte 10 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ SHOCK_WAVE
	.byte EFFECT_ALWAYS_HIT
	.byte 60 @ power
	.byte TYPE_ELECTRIC
	.byte 0 @ accuracy
	.byte 20 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ WATER_PULSE
	.byte EFFECT_CONFUSE_HIT
	.byte 60 @ power
	.byte TYPE_WATER
	.byte 100 @ accuracy
	.byte 20 @ PP
	.byte 20 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags

@ DOOM_DESIRE
	.byte EFFECT_FUTURE_SIGHT
	.byte 120 @ power
	.byte TYPE_STEEL
	.byte 85 @ accuracy
	.byte 5 @ PP
	.byte 0 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte 0 @ misc. flags

@ PSYCHO_BOOST
	.byte EFFECT_OVERHEAT
	.byte 140 @ power
	.byte TYPE_PSYCHIC
	.byte 90 @ accuracy
	.byte 5 @ PP
	.byte 100 @ secondary effect chance
	.byte TARGET_SELECTED_POKEMON
	.byte 0 @ priority
	.4byte F_AFFECTED_BY_KINGS_ROCK | F_MIRROR_MOVE_COMPATIBLE | F_AFFECTED_BY_PROTECT @ misc. flags
