	.align 2
gContestMoves::
@ NONE
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POUND
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_POUND @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ KARATE_CHOP
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOUBLE_SLAP
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_POUND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COMET_PUNCH
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEGA_PUNCH
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER, 0, 0 @ combo moves
	.byte 0 @ padding

@ PAY_DAY
	.byte CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FIRE_PUNCH
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_FIRE_PUNCH @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, COMBO_STARTER_THUNDER_PUNCH, COMBO_STARTER_ICE_PUNCH, 0 @ combo moves
	.byte 0 @ padding

@ ICE_PUNCH
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_ICE_PUNCH @ combo starter ID
	.byte COMBO_STARTER_THUNDER_PUNCH, COMBO_STARTER_FIRE_PUNCH, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDER_PUNCH
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte COMBO_STARTER_THUNDER_PUNCH @ combo starter ID
	.byte COMBO_STARTER_CHARGE, COMBO_STARTER_FIRE_PUNCH, COMBO_STARTER_ICE_PUNCH, 0 @ combo moves
	.byte 0 @ padding

@ SCRATCH
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SCRATCH @ combo starter ID
	.byte COMBO_STARTER_LEER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ VICE_GRIP
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_VICE_GRIP @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GUILLOTINE
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_VICE_GRIP, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAZOR_WIND
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWORDS_DANCE
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_SWORDS_DANCE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CUT
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GUST
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WING_ATTACK
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WHIRLWIND
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLY
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BIND
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_VICE_GRIP, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLAM
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_POUND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ VINE_WHIP
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STOMP
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, COMBO_STARTER_LEER, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOUBLE_KICK
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEGA_KICK
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER, 0, 0 @ combo moves
	.byte 0 @ padding

@ JUMP_KICK
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MIND_READER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROLLING_KICK
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SAND_ATTACK
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_SAND_ATTACK @ combo starter ID
	.byte COMBO_STARTER_MUD_SLAP, COMBO_STARTER_SANDSTORM, 0, 0 @ combo moves
	.byte 0 @ padding

@ HEADBUTT
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HORN_ATTACK
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte COMBO_STARTER_HORN_ATTACK @ combo starter ID
	.byte COMBO_STARTER_LEER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FURY_ATTACK
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HORN_ATTACK, COMBO_STARTER_PECK, 0, 0 @ combo moves
	.byte 0 @ padding

@ HORN_DRILL
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HORN_ATTACK, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TACKLE
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DEFENSE_CURL, COMBO_STARTER_LEER, COMBO_STARTER_HARDEN, 0 @ combo moves
	.byte 0 @ padding

@ BODY_SLAM
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WRAP
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TAKE_DOWN
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_HARDEN, 0, 0 @ combo moves
	.byte 0 @ padding

@ THRASH
	.byte CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOUBLE_EDGE
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_HARDEN, 0, 0 @ combo moves
	.byte 0 @ padding

@ TAIL_WHIP
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_STING
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TWINEEDLE
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PIN_MISSILE
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LEER
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_COOL
	.byte COMBO_STARTER_LEER @ combo starter ID
	.byte COMBO_STARTER_RAGE, COMBO_STARTER_SCARY_FACE, 0, 0 @ combo moves
	.byte 0 @ padding

@ BITE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LEER, COMBO_STARTER_SCARY_FACE, 0, 0 @ combo moves
	.byte 0 @ padding

@ GROWL
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROAR
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SING
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_SING @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUPERSONIC
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SONIC_BOOM
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DISABLE
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ACID
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EMBER
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLAMETHROWER
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIST
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATER_GUN
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_WATER_SPORT, COMBO_STARTER_MUD_SPORT, 0 @ combo moves
	.byte 0 @ padding

@ HYDRO_PUMP
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SURF
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_SURF @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_DIVE, 0, 0 @ combo moves
	.byte 0 @ padding

@ ICE_BEAM
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BLIZZARD
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_POWDER_SNOW, COMBO_STARTER_HAIL, 0, 0 @ combo moves
	.byte 0 @ padding

@ PSYBEAM
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BUBBLE_BEAM
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AURORA_BEAM
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HYPER_BEAM
	.byte CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PECK
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte COMBO_STARTER_PECK @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRILL_PECK
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_PECK, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUBMISSION
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MIND_READER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LOW_KICK
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COUNTER
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_TAUNT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SEISMIC_TOSS
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FAKE_OUT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STRENGTH
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ABSORB
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEGA_DRAIN
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LEECH_SEED
	.byte CONTEST_EFFECT_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GROWTH
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_GROWTH @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAZOR_LEAF
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SOLAR_BEAM
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, COMBO_STARTER_GROWTH, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_POWDER
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWEET_SCENT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STUN_SPORE
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWEET_SCENT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLEEP_POWDER
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWEET_SCENT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PETAL_DANCE
	.byte CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STRING_SHOT
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_SMART
	.byte COMBO_STARTER_STRING_SHOT @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRAGON_RAGE
	.byte CONTEST_EFFECT_BETTER_WHEN_LATER
	.byte CONTEST_COOL
	.byte COMBO_STARTER_DRAGON_RAGE @ combo starter ID
	.byte COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_DANCE, 0, 0 @ combo moves
	.byte 0 @ padding

@ FIRE_SPIN
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDER_SHOCK
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDERBOLT
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDER_WAVE
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THUNDER
	.byte CONTEST_EFFECT_STARTLE_PREV_MONS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_LOCK_ON, 0 @ combo moves
	.byte 0 @ padding

@ ROCK_THROW
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_ROCK_THROW @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EARTHQUAKE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_EARTHQUAKE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FISSURE
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_EARTHQUAKE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DIG
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TOXIC
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONFUSION
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_SMART
	.byte COMBO_STARTER_CONFUSION @ combo starter ID
	.byte COMBO_STARTER_PSYCHIC, COMBO_STARTER_KINESIS, COMBO_STARTER_CALM_MIND, 0 @ combo moves
	.byte 0 @ padding

@ PSYCHIC
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte COMBO_STARTER_PSYCHIC @ combo starter ID
	.byte COMBO_STARTER_KINESIS, COMBO_STARTER_CONFUSION, COMBO_STARTER_CALM_MIND, 0 @ combo moves
	.byte 0 @ padding

@ HYPNOSIS
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte COMBO_STARTER_HYPNOSIS @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEDITATE
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AGILITY
	.byte CONTEST_EFFECT_NEXT_APPEAL_EARLIER
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DOUBLE_TEAM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ QUICK_ATTACK
	.byte CONTEST_EFFECT_NEXT_APPEAL_EARLIER
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DOUBLE_TEAM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAGE
	.byte CONTEST_EFFECT_REPETITION_NOT_BORING
	.byte CONTEST_COOL
	.byte COMBO_STARTER_RAGE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TELEPORT
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DOUBLE_TEAM, COMBO_STARTER_PSYCHIC, COMBO_STARTER_KINESIS, COMBO_STARTER_CONFUSION @ combo moves
	.byte 0 @ padding

@ NIGHT_SHADE
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIMIC
	.byte CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SCREECH
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOUBLE_TEAM
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_COOL
	.byte COMBO_STARTER_DOUBLE_TEAM @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RECOVER
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HARDEN
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_HARDEN @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MINIMIZE
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SMOKESCREEN
	.byte CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SMOG, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONFUSE_RAY
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WITHDRAW
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DEFENSE_CURL
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_DEFENSE_CURL @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BARRIER
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LIGHT_SCREEN
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HAZE
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ REFLECT
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FOCUS_ENERGY
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_COOL
	.byte COMBO_STARTER_FOCUS_ENERGY @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BIDE
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ METRONOME
	.byte CONTEST_EFFECT_REPETITION_NOT_BORING
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIRROR_MOVE
	.byte CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SELF_DESTRUCT
	.byte CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EGG_BOMB
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SOFT_BOILED, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LICK
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SMOG
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SMOG @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLUDGE
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SLUDGE @ combo starter ID
	.byte COMBO_STARTER_SLUDGE_BOMB, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BONE_CLUB
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_BONE_CLUB @ combo starter ID
	.byte COMBO_STARTER_BONEMERANG, COMBO_STARTER_BONE_RUSH, 0, 0 @ combo moves
	.byte 0 @ padding

@ FIRE_BLAST
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATERFALL
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CLAMP
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWIFT
	.byte CONTEST_EFFECT_BETTER_IF_FIRST
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SKULL_BASH
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPIKE_CANNON
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONSTRICT
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AMNESIA
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ KINESIS
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_SMART
	.byte COMBO_STARTER_KINESIS @ combo starter ID
	.byte COMBO_STARTER_PSYCHIC, COMBO_STARTER_CONFUSION, 0, 0 @ combo moves
	.byte 0 @ padding

@ SOFT_BOILED
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_SOFT_BOILED @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HI_JUMP_KICK
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MIND_READER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GLARE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LEER, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DREAM_EATER
	.byte CONTEST_EFFECT_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HYPNOSIS, COMBO_STARTER_CALM_MIND, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_GAS
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BARRAGE
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LEECH_LIFE
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LOVELY_KISS
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SKY_ATTACK
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TRANSFORM
	.byte CONTEST_EFFECT_REPETITION_NOT_BORING
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BUBBLE
	.byte CONTEST_EFFECT_STARTLE_PREV_MONS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DIZZY_PUNCH
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPORE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLASH
	.byte CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PSYWAVE
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPLASH
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ACID_ARMOR
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CRABHAMMER
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SWORDS_DANCE, 0, 0 @ combo moves
	.byte 0 @ padding

@ EXPLOSION
	.byte CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FURY_SWIPES
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SCRATCH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BONEMERANG
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_BONEMERANG @ combo starter ID
	.byte COMBO_STARTER_BONE_CLUB, COMBO_STARTER_BONE_RUSH, 0, 0 @ combo moves
	.byte 0 @ padding

@ REST
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_REST @ combo starter ID
	.byte COMBO_STARTER_BELLY_DRUM, COMBO_STARTER_CHARM, COMBO_STARTER_YAWN, 0 @ combo moves
	.byte 0 @ padding

@ ROCK_SLIDE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ROCK_THROW, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HYPER_FANG
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHARPEN
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONVERSION
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TRI_ATTACK
	.byte CONTEST_EFFECT_STARTLE_PREV_MONS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LOCK_ON, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUPER_FANG
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SCARY_FACE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLASH
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, COMBO_STARTER_SCRATCH, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUBSTITUTE
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STRUGGLE
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SKETCH
	.byte CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TRIPLE_KICK
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ THIEF
	.byte CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPIDER_WEB
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_STRING_SHOT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIND_READER
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_SMART
	.byte COMBO_STARTER_MIND_READER @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ NIGHTMARE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HYPNOSIS, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLAME_WHEEL
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SNORE
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_REST, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CURSE
	.byte CONTEST_EFFECT_NEXT_APPEAL_LATER
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_CURSE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLAIL
	.byte CONTEST_EFFECT_BETTER_WHEN_LATER
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CONVERSION_2
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AEROBLAST
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COTTON_SPORE
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ REVERSAL
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPITE
	.byte CONTEST_EFFECT_BETTER_WHEN_LATER
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CURSE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POWDER_SNOW
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_POWDER_SNOW @ combo starter ID
	.byte COMBO_STARTER_HAIL, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PROTECT
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_HARDEN, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MACH_PUNCH
	.byte CONTEST_EFFECT_NEXT_APPEAL_EARLIER
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SCARY_FACE
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SCARY_FACE @ combo starter ID
	.byte COMBO_STARTER_RAGE, COMBO_STARTER_LEER, 0, 0 @ combo moves
	.byte 0 @ padding

@ FAINT_ATTACK
	.byte CONTEST_EFFECT_BETTER_IF_FIRST
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FAKE_OUT, COMBO_STARTER_LEER, COMBO_STARTER_POUND, 0 @ combo moves
	.byte 0 @ padding

@ SWEET_KISS
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BELLY_DRUM
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_BELLY_DRUM @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLUDGE_BOMB
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SLUDGE_BOMB @ combo starter ID
	.byte COMBO_STARTER_SLUDGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MUD_SLAP
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_MUD_SLAP @ combo starter ID
	.byte COMBO_STARTER_SAND_ATTACK, COMBO_STARTER_MUD_SPORT, COMBO_STARTER_SANDSTORM, 0 @ combo moves
	.byte 0 @ padding

@ OCTAZOOKA
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_LOCK_ON, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPIKES
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ZAP_CANNON
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LOCK_ON, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FORESIGHT
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DESTINY_BOND
	.byte CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_CURSE, COMBO_STARTER_ENDURE, 0 @ combo moves
	.byte 0 @ padding

@ PERISH_SONG
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_MEAN_LOOK, COMBO_STARTER_SING, 0, 0 @ combo moves
	.byte 0 @ padding

@ ICY_WIND
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DETECT
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_TAUNT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BONE_RUSH
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_BONE_RUSH @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_BONE_CLUB, COMBO_STARTER_BONEMERANG, 0 @ combo moves
	.byte 0 @ padding

@ LOCK_ON
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_SMART
	.byte COMBO_STARTER_LOCK_ON @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ OUTRAGE
	.byte CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SANDSTORM
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_SANDSTORM @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GIGA_DRAIN
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ENDURE
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_ENDURE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CHARM
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_CHARM @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROLLOUT
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DEFENSE_CURL, COMBO_STARTER_HARDEN, 0, 0 @ combo moves
	.byte 0 @ padding

@ FALSE_SWIPE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWAGGER
	.byte CONTEST_EFFECT_BETTER_IF_FIRST
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MILK_DRINK
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPARK
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FURY_CUTTER
	.byte CONTEST_EFFECT_REPETITION_NOT_BORING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STEEL_WING
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEAN_LOOK
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_MEAN_LOOK @ combo starter ID
	.byte COMBO_STARTER_CURSE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ATTRACT
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLEEP_TALK
	.byte CONTEST_EFFECT_REPETITION_NOT_BORING
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_REST, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HEAL_BELL
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RETURN
	.byte CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PRESENT
	.byte CONTEST_EFFECT_REPETITION_NOT_BORING
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FRUSTRATION
	.byte CONTEST_EFFECT_EXCITE_AUDIENCE_IN_ANY_CONTEST
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SAFEGUARD
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PAIN_SPLIT
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SACRED_FIRE
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MAGNITUDE
	.byte CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DYNAMIC_PUNCH
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_MIND_READER, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEGAHORN
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRAGON_BREATH
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_COOL
	.byte COMBO_STARTER_DRAGON_BREATH @ combo starter ID
	.byte COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_DANCE, 0, 0 @ combo moves
	.byte 0 @ padding

@ BATON_PASS
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ENCORE
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PURSUIT
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAPID_SPIN
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWEET_SCENT
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_SWEET_SCENT @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ IRON_TAIL
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ METAL_CLAW
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_METAL_SOUND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ VITAL_THROW
	.byte CONTEST_EFFECT_NEXT_APPEAL_LATER
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FAKE_OUT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MORNING_SUN
	.byte CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SYNTHESIS
	.byte CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MOONLIGHT
	.byte CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HIDDEN_POWER
	.byte CONTEST_EFFECT_REPETITION_NOT_BORING
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CROSS_CHOP
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TWISTER
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RAIN_DANCE
	.byte CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_RAIN_DANCE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUNNY_DAY
	.byte CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_SUNNY_DAY @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CRUNCH
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SCARY_FACE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIRROR_COAT
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_TAUNT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PSYCH_UP
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EXTREME_SPEED
	.byte CONTEST_EFFECT_NEXT_APPEAL_EARLIER
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ANCIENT_POWER
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHADOW_BALL
	.byte CONTEST_EFFECT_SHIFT_JUDGE_ATTENTION
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FUTURE_SIGHT
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_PSYCHIC, COMBO_STARTER_KINESIS, COMBO_STARTER_CONFUSION, COMBO_STARTER_CALM_MIND @ combo moves
	.byte 0 @ padding

@ ROCK_SMASH
	.byte CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WHIRLPOOL
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BEAT_UP
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FAKE_OUT
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_FAKE_OUT @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ UPROAR
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ STOCKPILE
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_TOUGH
	.byte COMBO_STARTER_STOCKPILE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SPIT_UP
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_STOCKPILE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SWALLOW
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_STOCKPILE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HEAT_WAVE
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HAIL
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_HAIL @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TORMENT
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FLATTER
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WILL_O_WISP
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MEMENTO
	.byte CONTEST_EFFECT_GREAT_APPEAL_BUT_NO_MORE_MOVES
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FACADE
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FOCUS_PUNCH
	.byte CONTEST_EFFECT_NEXT_APPEAL_LATER
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SMELLING_SALT
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FOLLOW_ME
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ NATURE_POWER
	.byte CONTEST_EFFECT_BETTER_WHEN_AUDIENCE_EXCITED
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CHARGE
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_SMART
	.byte COMBO_STARTER_CHARGE @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TAUNT
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_SMART
	.byte COMBO_STARTER_TAUNT @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HELPING_HAND
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TRICK
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROLE_PLAY
	.byte CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WISH
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ASSIST
	.byte CONTEST_EFFECT_QUALITY_DEPENDS_ON_TIMING
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ INGRAIN
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SUPERPOWER
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_LOCK_ON, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MAGIC_COAT
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ RECYCLE
	.byte CONTEST_EFFECT_REPETITION_NOT_BORING
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ REVENGE
	.byte CONTEST_EFFECT_NEXT_APPEAL_LATER
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BRICK_BREAK
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ YAWN
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_YAWN @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ KNOCK_OFF
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FAKE_OUT, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ENDEAVOR
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ERUPTION
	.byte CONTEST_EFFECT_BETTER_WHEN_LATER
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ENDURE, COMBO_STARTER_EARTHQUAKE, COMBO_STARTER_SUNNY_DAY, 0 @ combo moves
	.byte 0 @ padding

@ SKILL_SWAP
	.byte CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ IMPRISON
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ REFRESH
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_WATER_SPORT, COMBO_STARTER_SING, 0, 0 @ combo moves
	.byte 0 @ padding

@ GRUDGE
	.byte CONTEST_EFFECT_BETTER_WHEN_LATER
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CURSE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SNATCH
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SECRET_POWER
	.byte CONTEST_EFFECT_BETTER_WITH_GOOD_CONDITION
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DIVE
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_BEAUTY
	.byte COMBO_STARTER_DIVE @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SURF, 0, 0 @ combo moves
	.byte 0 @ padding

@ ARM_THRUST
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, COMBO_STARTER_FAKE_OUT, 0, 0 @ combo moves
	.byte 0 @ padding

@ CAMOUFLAGE
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TAIL_GLOW
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LUSTER_PURGE
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MIST_BALL
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FEATHER_DANCE
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TEETER_DANCE
	.byte CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BLAZE_KICK
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MUD_SPORT
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_MUD_SPORT @ combo starter ID
	.byte COMBO_STARTER_MUD_SLAP, COMBO_STARTER_WATER_SPORT, 0, 0 @ combo moves
	.byte 0 @ padding

@ ICE_BALL
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ NEEDLE_ARM
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SLACK_OFF
	.byte CONTEST_EFFECT_BETTER_WHEN_LATER
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_YAWN, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HYPER_VOICE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_FANG
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ CRUSH_CLAW
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SWORDS_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BLAST_BURN
	.byte CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HYDRO_CANNON
	.byte CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ METEOR_MASH
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ASTONISH
	.byte CONTEST_EFFECT_STARTLE_PREV_MON
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WEATHER_BALL
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_SUNNY_DAY, COMBO_STARTER_HAIL, COMBO_STARTER_SANDSTORM @ combo moves
	.byte 0 @ padding

@ AROMATHERAPY
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ FAKE_TEARS
	.byte CONTEST_EFFECT_BETTER_IF_LAST
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AIR_CUTTER
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ OVERHEAT
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SUNNY_DAY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ODOR_SLEUTH
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROCK_TOMB
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_ROCK_THROW, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SILVER_WIND
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ METAL_SOUND
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte COMBO_STARTER_METAL_SOUND @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ GRASS_WHISTLE
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ TICKLE
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COSMIC_POWER
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATER_SPOUT
	.byte CONTEST_EFFECT_BETTER_WHEN_LATER
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SIGNAL_BEAM
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHADOW_PUNCH
	.byte CONTEST_EFFECT_BETTER_IF_FIRST
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ EXTRASENSORY
	.byte CONTEST_EFFECT_BADLY_STARTLE_FRONT_MON
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SKY_UPPERCUT
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_FOCUS_ENERGY, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SAND_TOMB
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_SANDSTORM, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHEER_COLD
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MUDDY_WATER
	.byte CONTEST_EFFECT_STARTLE_MON_WITH_JUDGES_ATTENTION
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BULLET_SEED
	.byte CONTEST_EFFECT_BADLY_STARTLE_MONS_WITH_GOOD_APPEALS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ AERIAL_ACE
	.byte CONTEST_EFFECT_BETTER_IF_FIRST
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ ICICLE_SPEAR
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ IRON_DEFENSE
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BLOCK
	.byte CONTEST_EFFECT_MAKE_FOLLOWING_MONS_NERVOUS
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ HOWL
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRAGON_CLAW
	.byte CONTEST_EFFECT_STARTLE_MONS_SAME_TYPE_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_DRAGON_BREATH, COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_DANCE, 0 @ combo moves
	.byte 0 @ padding

@ FRENZY_PLANT
	.byte CONTEST_EFFECT_JAMS_OTHERS_BUT_MISS_ONE_TURN
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BULK_UP
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ BOUNCE
	.byte CONTEST_EFFECT_AVOID_STARTLE
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MUD_SHOT
	.byte CONTEST_EFFECT_BADLY_STARTLE_PREV_MONS
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ POISON_TAIL
	.byte CONTEST_EFFECT_WORSEN_CONDITION_OF_PREV_MONS
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ COVET
	.byte CONTEST_EFFECT_APPEAL_AS_GOOD_AS_PREV_ONES
	.byte CONTEST_CUTE
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ VOLT_TACKLE
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ MAGICAL_LEAF
	.byte CONTEST_EFFECT_BETTER_IF_FIRST
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_GROWTH, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATER_SPORT
	.byte CONTEST_EFFECT_HIGHLY_APPEALING
	.byte CONTEST_CUTE
	.byte COMBO_STARTER_WATER_SPORT @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, COMBO_STARTER_MUD_SPORT, 0, 0 @ combo moves
	.byte 0 @ padding

@ CALM_MIND
	.byte CONTEST_EFFECT_AVOID_STARTLE_ONCE
	.byte CONTEST_SMART
	.byte COMBO_STARTER_CALM_MIND @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ LEAF_BLADE
	.byte CONTEST_EFFECT_AFFECTED_BY_PREV_APPEAL
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DRAGON_DANCE
	.byte CONTEST_EFFECT_IMPROVE_CONDITION_PREVENT_NERVOUSNESS
	.byte CONTEST_COOL
	.byte COMBO_STARTER_DRAGON_DANCE @ combo starter ID
	.byte COMBO_STARTER_DRAGON_RAGE, COMBO_STARTER_DRAGON_BREATH, 0, 0 @ combo moves
	.byte 0 @ padding

@ ROCK_BLAST
	.byte CONTEST_EFFECT_BETTER_IF_SAME_TYPE
	.byte CONTEST_TOUGH
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ SHOCK_WAVE
	.byte CONTEST_EFFECT_BETTER_IF_FIRST
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CHARGE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ WATER_PULSE
	.byte CONTEST_EFFECT_SCRAMBLE_NEXT_TURN_ORDER
	.byte CONTEST_BEAUTY
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_RAIN_DANCE, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ DOOM_DESIRE
	.byte CONTEST_EFFECT_DONT_EXCITE_AUDIENCE
	.byte CONTEST_COOL
	.byte 0 @ combo starter ID
	.byte 0, 0, 0, 0 @ combo moves
	.byte 0 @ padding

@ PSYCHO_BOOST
	.byte CONTEST_EFFECT_USER_MORE_EASILY_STARTLED
	.byte CONTEST_SMART
	.byte 0 @ combo starter ID
	.byte COMBO_STARTER_CALM_MIND, 0, 0, 0 @ combo moves
	.byte 0 @ padding
