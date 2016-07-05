	.align 2
gContestMoves::
@ NONE
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POUND
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_POUND @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ KARATE_CHOP
	.byte 37 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOUBLE_SLAP
	.byte 17 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_POUND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COMET_PUNCH
	.byte 35 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEGA_PUNCH
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER, 0, 0 @ combo moves
	.byte 0 @ padding

@ PAY_DAY
	.byte 46 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FIRE_PUNCH
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_FIRE_PUNCH @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, COMBO_STARTER_THUNDER_PUNCH, COMBO_STARTER_ICE_PUNCH, 0 @ combo moves
	.byte 0 @ padding

@ ICE_PUNCH
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_ICE_PUNCH @ combo starter ID
	.byte COMBO_STARTER_THUNDER_PUNCH, COMBO_STARTER_FIRE_PUNCH, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDER_PUNCH
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_THUNDER_PUNCH @ combo starter ID
	.byte COMBO_STARTER_CHARGE, COMBO_STARTER_FIRE_PUNCH, COMBO_STARTER_ICE_PUNCH, 0 @ combo moves
	.byte 0 @ padding

@ SCRATCH
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SCRATCH @ combo starter ID
	.byte COMBO_STARTER_LEER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ VICE_GRIP
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_VICE_GRIP @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GUILLOTINE
	.byte 45 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_VICE_GRIP, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAZOR_WIND
	.byte 37 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWORDS_DANCE
	.byte 38 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_SWORDS_DANCE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CUT
	.byte 45 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GUST
	.byte 43 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WING_ATTACK
	.byte 35 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WHIRLWIND
	.byte 43 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLY
	.byte 5 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BIND
	.byte 47 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_VICE_GRIP, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLAM
	.byte 19 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_POUND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ VINE_WHIP
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STOMP
	.byte 12 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, COMBO_STARTER_LEER, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOUBLE_KICK
	.byte 35 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEGA_KICK
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER, 0, 0 @ combo moves
	.byte 0 @ padding

@ JUMP_KICK
	.byte 1 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MIND_READER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROLLING_KICK
	.byte 13 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SAND_ATTACK
	.byte 17 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_SAND_ATTACK @ combo starter ID
	.byte COMBO_STARTER_MUD_SLAP, COMBO_STARTER_SANDSTORM, 0, 0 @ combo moves
	.byte 0 @ padding

@ HEADBUTT
	.byte 10 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HORN_ATTACK
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_HORN_ATTACK @ combo starter ID
	.byte COMBO_STARTER_LEER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FURY_ATTACK
	.byte 17 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HORN_ATTACK, COMBO_STARTER_PECK, 0, 0 @ combo moves
	.byte 0 @ padding

@ HORN_DRILL
	.byte 45 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HORN_ATTACK, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TACKLE
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DEFENSE_CURL, COMBO_STARTER_LEER, COMBO_STARTER_HARDEN, 0 @ combo moves
	.byte 0 @ padding

@ BODY_SLAM
	.byte 12 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WRAP
	.byte 47 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TAKE_DOWN
	.byte 1 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_HARDEN, 0, 0 @ combo moves
	.byte 0 @ padding

@ THRASH
	.byte 18 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOUBLE_EDGE
	.byte 1 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_HARDEN, 0, 0 @ combo moves
	.byte 0 @ padding

@ TAIL_WHIP
	.byte 30 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_STING
	.byte 10 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TWINEEDLE
	.byte 10 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PIN_MISSILE
	.byte 17 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LEER
	.byte 47 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_LEER @ combo starter ID
	.byte COMBO_STARTER_RAGE, COMBO_STARTER_SCARY_FACE, 0, 0 @ combo moves
	.byte 0 @ padding

@ BITE
	.byte 13 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LEER, COMBO_STARTER_SCARY_FACE, 0, 0 @ combo moves
	.byte 0 @ padding

@ GROWL
	.byte 30 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROAR
	.byte 43 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SING
	.byte 26 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_SING @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUPERSONIC
	.byte 43 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SONIC_BOOM
	.byte 35 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DISABLE
	.byte 26 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ACID
	.byte 12 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EMBER
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLAMETHROWER
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIST
	.byte 5 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATER_GUN
	.byte 0 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_WATER_SPORT, COMBO_STARTER_MUD_SPORT, 0 @ combo moves
	.byte 0 @ padding

@ HYDRO_PUMP
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SURF
	.byte 37 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_SURF @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_DIVE, 0, 0 @ combo moves
	.byte 0 @ padding

@ ICE_BEAM
	.byte 19 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BLIZZARD
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_POWDER_SNOW, COMBO_STARTER_HAIL, 0, 0 @ combo moves
	.byte 0 @ padding

@ PSYBEAM
	.byte 43 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BUBBLE_BEAM
	.byte 13 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AURORA_BEAM
	.byte 19 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HYPER_BEAM
	.byte 18 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PECK
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_PECK @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRILL_PECK
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_PECK, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUBMISSION
	.byte 1 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MIND_READER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LOW_KICK
	.byte 12 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COUNTER
	.byte 4 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_TAUNT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SEISMIC_TOSS
	.byte 19 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FAKE_OUT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STRENGTH
	.byte 19 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ABSORB
	.byte 10 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEGA_DRAIN
	.byte 12 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LEECH_SEED
	.byte 11 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GROWTH
	.byte 38 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_GROWTH @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAZOR_LEAF
	.byte 37 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SOLAR_BEAM
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, COMBO_STARTER_GROWTH, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_POWDER
	.byte 27 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWEET_SCENT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STUN_SPORE
	.byte 45 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWEET_SCENT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLEEP_POWDER
	.byte 13 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWEET_SCENT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PETAL_DANCE
	.byte 18 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STRING_SHOT
	.byte 10 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_STRING_SHOT @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRAGON_RAGE
	.byte 33 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_DRAGON_RAGE @ combo starter ID
	.byte COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_DANCE, 0, 0 @ combo moves
	.byte 0 @ padding

@ FIRE_SPIN
	.byte 47 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDER_SHOCK
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDERBOLT
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDER_WAVE
	.byte 45 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDER
	.byte 11 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_LOCK_ON, 0 @ combo moves
	.byte 0 @ padding

@ ROCK_THROW
	.byte 35 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_ROCK_THROW @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EARTHQUAKE
	.byte 13 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_EARTHQUAKE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FISSURE
	.byte 45 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_EARTHQUAKE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DIG
	.byte 5 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TOXIC
	.byte 27 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONFUSION
	.byte 10 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_CONFUSION @ combo starter ID
	.byte COMBO_STARTER_PSYCHIC, COMBO_STARTER_KINESIS, COMBO_STARTER_CALM_MIND, 0 @ combo moves
	.byte 0 @ padding

@ PSYCHIC
	.byte 13 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_PSYCHIC @ combo starter ID
	.byte COMBO_STARTER_KINESIS, COMBO_STARTER_CONFUSION, COMBO_STARTER_CALM_MIND, 0 @ combo moves
	.byte 0 @ padding

@ HYPNOSIS
	.byte 13 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_HYPNOSIS @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEDITATE
	.byte 38 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AGILITY
	.byte 40 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DOUBLE_TEAM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ QUICK_ATTACK
	.byte 40 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DOUBLE_TEAM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAGE
	.byte 3 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_RAGE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TELEPORT
	.byte 5 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DOUBLE_TEAM, COMBO_STARTER_PSYCHIC, COMBO_STARTER_KINESIS, COMBO_STARTER_CONFUSION @ combo moves
	.byte 0 @ padding

@ NIGHT_SHADE
	.byte 19 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIMIC
	.byte 32 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SCREECH
	.byte 13 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOUBLE_TEAM
	.byte 4 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_DOUBLE_TEAM @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RECOVER
	.byte 19 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HARDEN
	.byte 4 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_HARDEN @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MINIMIZE
	.byte 4 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SMOKESCREEN
	.byte 16 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SMOG, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONFUSE_RAY
	.byte 43 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WITHDRAW
	.byte 5 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DEFENSE_CURL
	.byte 4 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_DEFENSE_CURL @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BARRIER
	.byte 5 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LIGHT_SCREEN
	.byte 5 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HAZE
	.byte 27 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ REFLECT
	.byte 5 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FOCUS_ENERGY
	.byte 13 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_FOCUS_ENERGY @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BIDE
	.byte 5 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ METRONOME
	.byte 3 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIRROR_MOVE
	.byte 32 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SELF_DESTRUCT
	.byte 2 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EGG_BOMB
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SOFT_BOILED, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LICK
	.byte 12 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SMOG
	.byte 13 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SMOG @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLUDGE
	.byte 12 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SLUDGE @ combo starter ID
	.byte COMBO_STARTER_SLUDGE_BOMB, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BONE_CLUB
	.byte 17 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_BONE_CLUB @ combo starter ID
	.byte COMBO_STARTER_BONEMERANG, COMBO_STARTER_BONE_RUSH, 0, 0 @ combo moves
	.byte 0 @ padding

@ FIRE_BLAST
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATERFALL
	.byte 30 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CLAMP
	.byte 47 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWIFT
	.byte 29 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SKULL_BASH
	.byte 12 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPIKE_CANNON
	.byte 17 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONSTRICT
	.byte 10 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AMNESIA
	.byte 38 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ KINESIS
	.byte 47 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_KINESIS @ combo starter ID
	.byte COMBO_STARTER_PSYCHIC, COMBO_STARTER_CONFUSION, 0, 0 @ combo moves
	.byte 0 @ padding

@ SOFT_BOILED
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_SOFT_BOILED @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HI_JUMP_KICK
	.byte 1 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MIND_READER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GLARE
	.byte 13 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LEER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DREAM_EATER
	.byte 11 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HYPNOSIS, COMBO_STARTER_CALM_MIND, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_GAS
	.byte 27 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BARRAGE
	.byte 35 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LEECH_LIFE
	.byte 10 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LOVELY_KISS
	.byte 13 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SKY_ATTACK
	.byte 37 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TRANSFORM
	.byte 3 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BUBBLE
	.byte 11 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DIZZY_PUNCH
	.byte 12 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPORE
	.byte 13 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLASH
	.byte 16 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PSYWAVE
	.byte 45 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPLASH
	.byte 30 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ACID_ARMOR
	.byte 38 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CRABHAMMER
	.byte 37 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SWORDS_DANCE, 0, 0 @ combo moves
	.byte 0 @ padding

@ EXPLOSION
	.byte 2 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FURY_SWIPES
	.byte 17 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SCRATCH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BONEMERANG
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_BONEMERANG @ combo starter ID
	.byte COMBO_STARTER_BONE_CLUB, COMBO_STARTER_BONE_RUSH, 0, 0 @ combo moves
	.byte 0 @ padding

@ REST
	.byte 4 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_REST @ combo starter ID
	.byte COMBO_STARTER_BELLY_DRUM, COMBO_STARTER_CHARM, COMBO_STARTER_YAWN, 0 @ combo moves
	.byte 0 @ padding

@ ROCK_SLIDE
	.byte 13 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ROCK_THROW, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HYPER_FANG
	.byte 12 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHARPEN
	.byte 38 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONVERSION
	.byte 35 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TRI_ATTACK
	.byte 11 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LOCK_ON, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUPER_FANG
	.byte 45 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SCARY_FACE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLASH
	.byte 37 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, COMBO_STARTER_SCRATCH, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUBSTITUTE
	.byte 4 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STRUGGLE
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SKETCH
	.byte 32 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TRIPLE_KICK
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THIEF
	.byte 31 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPIDER_WEB
	.byte 26 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_STRING_SHOT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIND_READER
	.byte 47 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_MIND_READER @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ NIGHTMARE
	.byte 13 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HYPNOSIS, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLAME_WHEEL
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SNORE
	.byte 0 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_REST, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CURSE
	.byte 41 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_CURSE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLAIL
	.byte 33 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONVERSION_2
	.byte 35 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AEROBLAST
	.byte 37 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COTTON_SPORE
	.byte 17 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ REVERSAL
	.byte 30 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPITE
	.byte 33 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CURSE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POWDER_SNOW
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_POWDER_SNOW @ combo starter ID
	.byte COMBO_STARTER_HAIL, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PROTECT
	.byte 5 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HARDEN, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MACH_PUNCH
	.byte 40 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SCARY_FACE
	.byte 17 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SCARY_FACE @ combo starter ID
	.byte COMBO_STARTER_RAGE, COMBO_STARTER_LEER, 0, 0 @ combo moves
	.byte 0 @ padding

@ FAINT_ATTACK
	.byte 29 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FAKE_OUT, COMBO_STARTER_LEER, COMBO_STARTER_POUND, 0 @ combo moves
	.byte 0 @ padding

@ SWEET_KISS
	.byte 26 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BELLY_DRUM
	.byte 38 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_BELLY_DRUM @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLUDGE_BOMB
	.byte 17 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SLUDGE_BOMB @ combo starter ID
	.byte COMBO_STARTER_SLUDGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MUD_SLAP
	.byte 17 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_MUD_SLAP @ combo starter ID
	.byte COMBO_STARTER_SAND_ATTACK, COMBO_STARTER_MUD_SPORT, COMBO_STARTER_SANDSTORM, 0 @ combo moves
	.byte 0 @ padding

@ OCTAZOOKA
	.byte 17 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_LOCK_ON, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPIKES
	.byte 26 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ZAP_CANNON
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LOCK_ON, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FORESIGHT
	.byte 27 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DESTINY_BOND
	.byte 2 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_CURSE, COMBO_STARTER_ENDURE, 0 @ combo moves
	.byte 0 @ padding

@ PERISH_SONG
	.byte 45 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_SING, 0, 0 @ combo moves
	.byte 0 @ padding

@ ICY_WIND
	.byte 13 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DETECT
	.byte 4 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_TAUNT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BONE_RUSH
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_BONE_RUSH @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_BONE_CLUB, COMBO_STARTER_BONEMERANG, 0 @ combo moves
	.byte 0 @ padding

@ LOCK_ON
	.byte 47 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_LOCK_ON @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ OUTRAGE
	.byte 18 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SANDSTORM
	.byte 43 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SANDSTORM @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GIGA_DRAIN
	.byte 17 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ENDURE
	.byte 4 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_ENDURE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CHARM
	.byte 19 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_CHARM @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROLLOUT
	.byte 47 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DEFENSE_CURL, COMBO_STARTER_HARDEN, 0, 0 @ combo moves
	.byte 0 @ padding

@ FALSE_SWIPE
	.byte 13 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWAGGER
	.byte 29 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MILK_DRINK
	.byte 35 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPARK
	.byte 12 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FURY_CUTTER
	.byte 3 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STEEL_WING
	.byte 35 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEAN_LOOK
	.byte 26 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_MEAN_LOOK @ combo starter ID
	.byte COMBO_STARTER_CURSE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ATTRACT
	.byte 26 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLEEP_TALK
	.byte 3 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_REST, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HEAL_BELL
	.byte 30 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RETURN
	.byte 44 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PRESENT
	.byte 3 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FRUSTRATION
	.byte 44 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SAFEGUARD
	.byte 5 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PAIN_SPLIT
	.byte 12 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SACRED_FIRE
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MAGNITUDE
	.byte 46 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DYNAMIC_PUNCH
	.byte 17 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEGAHORN
	.byte 35 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRAGON_BREATH
	.byte 13 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_DRAGON_BREATH @ combo starter ID
	.byte COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_DANCE, 0, 0 @ combo moves
	.byte 0 @ padding

@ BATON_PASS
	.byte 26 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ENCORE
	.byte 26 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PURSUIT
	.byte 45 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAPID_SPIN
	.byte 4 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWEET_SCENT
	.byte 13 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_SWEET_SCENT @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ IRON_TAIL
	.byte 12 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ METAL_CLAW
	.byte 0 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_METAL_SOUND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ VITAL_THROW
	.byte 41 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FAKE_OUT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MORNING_SUN
	.byte 34 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SYNTHESIS
	.byte 34 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MOONLIGHT
	.byte 34 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HIDDEN_POWER
	.byte 3 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CROSS_CHOP
	.byte 37 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TWISTER
	.byte 43 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAIN_DANCE
	.byte 46 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_RAIN_DANCE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUNNY_DAY
	.byte 46 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_SUNNY_DAY @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CRUNCH
	.byte 12 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SCARY_FACE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIRROR_COAT
	.byte 4 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_TAUNT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PSYCH_UP
	.byte 35 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EXTREME_SPEED
	.byte 40 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ANCIENT_POWER
	.byte 38 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHADOW_BALL
	.byte 16 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FUTURE_SIGHT
	.byte 47 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_PSYCHIC, COMBO_STARTER_KINESIS, COMBO_STARTER_CONFUSION, COMBO_STARTER_CALM_MIND @ combo moves
	.byte 0 @ padding

@ ROCK_SMASH
	.byte 39 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WHIRLPOOL
	.byte 47 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BEAT_UP
	.byte 45 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FAKE_OUT
	.byte 19 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_FAKE_OUT @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ UPROAR
	.byte 43 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STOCKPILE
	.byte 4 @ effect ID
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_STOCKPILE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPIT_UP
	.byte 0 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_STOCKPILE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWALLOW
	.byte 38 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_STOCKPILE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HEAT_WAVE
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HAIL
	.byte 13 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_HAIL @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TORMENT
	.byte 26 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLATTER
	.byte 26 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WILL_O_WISP
	.byte 12 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEMENTO
	.byte 2 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FACADE
	.byte 30 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FOCUS_PUNCH
	.byte 41 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SMELLING_SALT
	.byte 10 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FOLLOW_ME
	.byte 47 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ NATURE_POWER
	.byte 46 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CHARGE
	.byte 35 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_CHARGE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TAUNT
	.byte 26 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_TAUNT @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HELPING_HAND
	.byte 26 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TRICK
	.byte 35 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROLE_PLAY
	.byte 31 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WISH
	.byte 47 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ASSIST
	.byte 34 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ INGRAIN
	.byte 5 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUPERPOWER
	.byte 1 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LOCK_ON, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MAGIC_COAT
	.byte 5 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RECYCLE
	.byte 3 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ REVENGE
	.byte 41 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BRICK_BREAK
	.byte 12 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ YAWN
	.byte 26 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_YAWN @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ KNOCK_OFF
	.byte 12 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FAKE_OUT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ENDEAVOR
	.byte 30 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ERUPTION
	.byte 33 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, COMBO_STARTER_EARTHQUAKE, COMBO_STARTER_SUNNY_DAY, 0 @ combo moves
	.byte 0 @ padding

@ SKILL_SWAP
	.byte 31 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ IMPRISON
	.byte 27 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ REFRESH
	.byte 38 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_WATER_SPORT, COMBO_STARTER_SING, 0, 0 @ combo moves
	.byte 0 @ padding

@ GRUDGE
	.byte 33 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CURSE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SNATCH
	.byte 45 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SECRET_POWER
	.byte 39 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DIVE
	.byte 4 @ effect ID
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_DIVE @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SURF, 0, 0 @ combo moves
	.byte 0 @ padding

@ ARM_THRUST
	.byte 17 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_FAKE_OUT, 0, 0 @ combo moves
	.byte 0 @ padding

@ CAMOUFLAGE
	.byte 37 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TAIL_GLOW
	.byte 38 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LUSTER_PURGE
	.byte 10 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIST_BALL
	.byte 12 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FEATHER_DANCE
	.byte 30 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TEETER_DANCE
	.byte 18 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BLAZE_KICK
	.byte 0 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MUD_SPORT
	.byte 0 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_MUD_SPORT @ combo starter ID
	.byte COMBO_STARTER_MUD_SLAP, COMBO_STARTER_WATER_SPORT, 0, 0 @ combo moves
	.byte 0 @ padding

@ ICE_BALL
	.byte 47 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ NEEDLE_ARM
	.byte 12 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLACK_OFF
	.byte 33 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_YAWN, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HYPER_VOICE
	.byte 13 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_FANG
	.byte 27 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CRUSH_CLAW
	.byte 12 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BLAST_BURN
	.byte 18 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HYDRO_CANNON
	.byte 18 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ METEOR_MASH
	.byte 35 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ASTONISH
	.byte 10 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WEATHER_BALL
	.byte 0 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SUNNY_DAY, COMBO_STARTER_HAIL, COMBO_STARTER_SANDSTORM @ combo moves
	.byte 0 @ padding

@ AROMATHERAPY
	.byte 30 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FAKE_TEARS
	.byte 30 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AIR_CUTTER
	.byte 19 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ OVERHEAT
	.byte 1 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ODOR_SLEUTH
	.byte 27 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROCK_TOMB
	.byte 47 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ROCK_THROW, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SILVER_WIND
	.byte 38 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ METAL_SOUND
	.byte 13 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_METAL_SOUND @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GRASS_WHISTLE
	.byte 13 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TICKLE
	.byte 27 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COSMIC_POWER
	.byte 38 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATER_SPOUT
	.byte 33 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SIGNAL_BEAM
	.byte 43 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHADOW_PUNCH
	.byte 29 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EXTRASENSORY
	.byte 12 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SKY_UPPERCUT
	.byte 19 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SAND_TOMB
	.byte 47 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SANDSTORM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHEER_COLD
	.byte 45 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MUDDY_WATER
	.byte 17 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BULLET_SEED
	.byte 45 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AERIAL_ACE
	.byte 29 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ICICLE_SPEAR
	.byte 19 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ IRON_DEFENSE
	.byte 5 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BLOCK
	.byte 26 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HOWL
	.byte 38 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRAGON_CLAW
	.byte 19 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_DANCE, 0 @ combo moves
	.byte 0 @ padding

@ FRENZY_PLANT
	.byte 18 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BULK_UP
	.byte 38 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BOUNCE
	.byte 5 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MUD_SHOT
	.byte 13 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_TAIL
	.byte 27 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COVET
	.byte 31 @ effect ID
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ VOLT_TACKLE
	.byte 1 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MAGICAL_LEAF
	.byte 29 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATER_SPORT
	.byte 0 @ effect ID
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_WATER_SPORT @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_MUD_SPORT, 0, 0 @ combo moves
	.byte 0 @ padding

@ CALM_MIND
	.byte 4 @ effect ID
	.byte CONTEST_SMART
	.byte COMBO_STARTER_CALM_MIND @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LEAF_BLADE
	.byte 37 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRAGON_DANCE
	.byte 38 @ effect ID
	.byte CONTEST_COOL
	.byte COMBO_STARTER_DRAGON_DANCE @ combo starter ID
	.byte COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_BREATH, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROCK_BLAST
	.byte 35 @ effect ID
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHOCK_WAVE
	.byte 29 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATER_PULSE
	.byte 43 @ effect ID
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOOM_DESIRE
	.byte 47 @ effect ID
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PSYCHO_BOOST
	.byte 1 @ effect ID
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding
