	.align 2
gBattleTowerTrainers:: @ 8402F00
@ 0
	.byte TRAINER_CLASS_YOUNGSTER
	.string "ALWIN$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word ARE
	ec_word YOU
	ec_word READY
	ec_word QUES
	ec_word HERE_I_COME
	ec_word EXCL

@ 1
	.byte TRAINER_CLASS_BIRD_KEEPER
	.string "DIRK$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word OH_KAY
	ec_word I_AM
	ec_word READY
	ec_word EXCL
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 2
	.byte TRAINER_CLASS_LADY
	.string "SIBILLE$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word THAT
	ec_word BECOMES
	ec_word A
	ec_word CHILD_S_PLAY
	ec_word GO
	.2byte 0xFFFF

@ 3
	.byte TRAINER_CLASS_BLACK_BELT
	.string "OLAF$", 8
	.byte 0x05 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word MY
	ec_word GHOST
	ec_word IS
	ec_word FULL
	ec_word TOUGHNESS
	ec_word SNORT

@ 4
	.byte TRAINER_CLASS_NINJA_BOY
	.string "JOST$", 8
	.byte 0x05 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word GO
	ec_word WHO_WAS
	ec_word POKEMON
	ec_word FIGHT
	ec_word FIGHT
	ec_word FIGHT

@ 5
	.byte TRAINER_CLASS_SCHOOL_KID_F
	.string "TINA$", 8
	.byte 0x0A @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word STUDY
	ec_word IS
	ec_word BORING
	ec_word LET_S
	ec_word BETTER
	ec_word FIGHT

@ 6
	.byte TRAINER_CLASS_BUG_MANIAC
	.string "HAJO$", 8
	.byte 0x41 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word TOUGHNESS
	ec_word AND
	ec_move2 TRANSFORM
	ec_word WILL
	ec_word BABE
	ec_word FAINT

@ 7
	.byte TRAINER_CLASS_FISHERMAN
	.string "GEORG$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word IT
	ec_word GOES
	ec_word NOTHING
	ec_word OVER
	ec_word FISHING
	.2byte 0xFFFF

@ 8
	.byte TRAINER_CLASS_TUBER_F
	.string "ANNE$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word POKEMON
	ec_word MUST_BE
	ec_word MAN
	ec_word SIMPLE
	ec_word ADORE
	.2byte 0xFFFF

@ 9
	.byte TRAINER_CLASS_POKEFAN_F
	.string "JULIA$", 8
	.byte 0x42 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I_AM
	ec_word CUTE
	ec_word I_AM
	ec_word QUITE
	ec_word AN
	ec_word LADY

@ 10
	.byte TRAINER_CLASS_GENTLEMAN
	.string "JOHANN$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word THE
	ec_word DAY
	ec_word IS
	ec_word PERFECT
	ec_word FOR
	ec_word BATTLE

@ 11
	.byte TRAINER_CLASS_CAMPER
	.string "KARL$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word NOW
	ec_word ARE
	ec_word YOU
	ec_word MY
	ec_word FRIEND
	.2byte 0xFFFF

@ 12
	.byte TRAINER_CLASS_RUNNING_TRIATHLETE_F
	.string "KENDRA$", 8
	.byte 0x0A @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I_AM
	ec_word SMART
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word AND
	ec_word YOU
	ec_word QUES

@ 13
	.byte TRAINER_CLASS_HIKER
	.string "DAVID$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WAHAHAHA
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word TODAY
	ec_word IS
	ec_move2 PAY_DAY
	.2byte 0xFFFF

@ 14
	.byte TRAINER_CLASS_BATTLE_GIRL
	.string "KEA$", 8
	.byte 0x0A @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word YOU_RE
	ec_word TOUGH
	ec_word OR
	ec_word QUES
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 15
	.byte TRAINER_CLASS_PSYCHIC_M
	.string "JULIAN$", 8
	.byte 0x05 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word FUFUFU
	ec_word YOU
	ec_word CAN_T
	ec_word DON_T
	ec_word WINS
	ec_word KID

@ 16
	.byte TRAINER_CLASS_LASS
	.string "JOSI$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word BE
	ec_word KIND
	ec_word TO
	ec_word GIRL
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 17
	.byte TRAINER_CLASS_GUITARIST
	.string "LEIF$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I_AM
	ec_word GREAT
	ec_word YOU_RE
	ec_word RATHER
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word OKAY

@ 18
	.byte TRAINER_CLASS_RICH_BOY
	.string "INGO$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I
	ec_word HAVE
	ec_word ROUGH_SKIN
	ec_word NATURAL_CURE
	ec_word IS
	ec_word ALL_RIGHT

@ 19
	.byte TRAINER_CLASS_BUG_CATCHER
	.string "LUDWIG$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word IF_I_WIN
	ec_word IS
	ec_word THAT
	ec_word EXCITING
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 20
	.byte TRAINER_CLASS_PICNICKER
	.string "RAJA$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WITH
	ec_word POKEMON
	ec_word TO
	ec_word WALKING
	ec_word IS
	ec_word GREAT

@ 21
	.byte TRAINER_CLASS_COLLECTOR
	.string "HARALD$", 8
	.byte 0x09 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word HERE_GOES
	ec_word MY
	ec_word HUGE_POWER
	.2byte 0xFFFF
	ec_word POKEMON
	.2byte 0xFFFF

@ 22
	.byte TRAINER_CLASS_TUBER_M
	.string "KIM$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I_AM
	ec_word A
	ec_word GENIUS
	ec_word WE
	ec_word WILL
	ec_word WINS

@ 23
	.byte TRAINER_CLASS_KINDLER
	.string "ERWIN$", 8
	.byte 0x05 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word MY
	ec_word FIRE
	ec_word IS
	ec_word VERY
	ec_word HOT
	.2byte 0xFFFF

@ 24
	.byte TRAINER_CLASS_PSYCHIC_F
	.string "EIKA$", 8
	.byte 0x0A @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word FIGHTING
	ec_move1 ASTONISH
	ec_word AND
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 25
	.byte TRAINER_CLASS_SWIMMER_F
	.string "ANNINA$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word SORRY
	ec_word YOURS
	ec_word POKEMON
	ec_word WILL
	ec_word DON_T
	ec_word WINS

@ 26
	.byte TRAINER_CLASS_CYCLING_TRIATHLETE_F
	.string "RUTH$", 8
	.byte 0x06 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I_AM
	ec_word TOUGH
	ec_word WHO_WAS
	ec_word POKEMON
	ec_word TOO
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS

@ 27
	.byte TRAINER_CLASS_POKEMANIAC
	.string "JENS$", 8
	.byte 0x40 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WHO_WAS
	ec_word POKEMON
	ec_word THOSE
	ec_word COOL
	ec_word YOURS
	ec_word LOSE

@ 28
	.byte TRAINER_CLASS_SAILOR
	.string "TITUS$", 8
	.byte 0x09 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word MY
	ec_word FOE
	ec_word IS
	ec_word FINALLY
	ec_word HERE
	ec_word EXCELLENT

@ 29
	.byte TRAINER_CLASS_POKEMON_BREEDER_F
	.string "NICOLA$", 8
	.byte 0x06 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I_AM
	ec_word VORACIOUS
	ec_move2 POUND
	ec_word AND
	ec_move2 BELLY_DRUM
	.2byte 0xFFFF

@ 30
	.byte TRAINER_CLASS_HEX_MANIAC
	.string "PAULA$", 8
	.byte 0x42 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word IS_IT_QUES
	ec_word THOSE_ARE
	ec_word UGLY
	ec_move1 SPITE
	ec_word TO
	ec_word TAKE

@ 31
	.byte TRAINER_CLASS_RUIN_MANIAC
	.string "SÖREN$", 8
	.byte 0x41 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word ADVENTURE
	ec_word AND
	ec_word BATTLE
	ec_word THOSE
	ec_word WHO_WAS
	ec_word LIKES

@ 32
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_M
	.string "RAINER$", 8
	.byte 0x09 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WE
	ec_word CAN
	ec_word VERSUS
	ec_word CHILDREN
	ec_word DON_T
	ec_word LOSE

@ 33
	.byte TRAINER_CLASS_SCHOOL_KID_M
	.string "FABIAN$", 8
	.byte 0x08 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word DAILY
	ec_word POKEMON
	ec_word IN
	ec_word THE
	ec_word SCHOOL
	ec_word AWESOME

@ 34
	.byte TRAINER_CLASS_POKEMON_RANGER_F
	.string "ELLEN$", 8
	.byte 0x04 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word ARE
	ec_word YOU
	ec_word ALL_RIGHT
	ec_word TO
	ec_word POKEMON
	ec_word QUES

@ 35
	.byte TRAINER_CLASS_SWIMMER_M
	.string "ARNIE$", 8
	.byte 0x09 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word MY
	ec_word FIGHTING
	ec_word IS
	ec_word PERFECTION
	ec_word YOUR
	ec_word USELESS

@ 36
	.byte TRAINER_CLASS_RUNNING_TRIATHLETE_M
	.string "HARDI$", 8
	.byte 0x09 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word BOY
	ec_word I_AM
	ec_word MAYBE
	ec_word TIRED
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	.2byte 0xFFFF

@ 37
	.byte TRAINER_CLASS_BEAUTY
	.string "LINA$", 8
	.byte 0x06 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word A
	ec_word TRAINER
	ec_word HOW_DO
	ec_word YOU
	ec_word IS
	ec_word EXCITING

@ 38
	.byte TRAINER_CLASS_AROMA_LADY
	.string "SELINA$", 8
	.byte 0x06 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word YOU_VE
	ec_word STENCH
	ec_word OR
	ec_move1 SWEET_SCENT
	ec_word QUES
	.2byte 0xFFFF

@ 39
	.byte TRAINER_CLASS_COLLECTOR
	.string "DANTE$", 8
	.byte 0x81 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word YOURS
	ec_word POKEMON
	ec_word I
	ec_word WANTS
	ec_word SHE
	ec_word EXCL_EXCL

@ 40
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_F
	.string "KATJA$", 8
	.byte 0x04 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word TODAY
	ec_word WANTS
	ec_word I
	ec_word MY
	ec_word BEST
	ec_word GIVE

@ 41
	.byte TRAINER_CLASS_POKEMON_RANGER_M
	.string "HORST$", 8
	.byte 0x0C @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WAAAH
	ec_word WAAAH
	ec_word WAAAH
	ec_word WAAAH
	ec_word EHEHE
	ec_move1 FAKE_TEARS

@ 42
	.byte TRAINER_CLASS_POKEFAN_M
	.string "GERRIT$", 8
	.byte 0x80 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word MY
	ec_word ANIME
	ec_word SONG
	ec_word IS
	ec_word DON_T
	ec_word LOUSY

@ 43
	.byte TRAINER_CLASS_CYCLING_TRIATHLETE_M
	.string "NIKO$", 8
	.byte 0x04 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word BATTLE
	ec_word DON_T
	ec_word JUST
	ec_word DO
	ec_word SOMETHING
	ec_word ELSE

@ 44
	.byte TRAINER_CLASS_POKEMON_BREEDER_M
	.string "BALDO$", 8
	.byte 0x41 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word ARE
	ec_word YOU
	ec_word BUSY
	ec_word HAS
	ec_word THAT
	ec_word TIME

@ 45
	.byte TRAINER_CLASS_PARASOL_LADY
	.string "ALMA$", 8
	.byte 0x08 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word THAT
	ec_move1 MORNING_SUN
	ec_word HAS
	ec_word SO
	ec_word A_LOT
	ec_move1 COSMIC_POWER

@ 46
	.byte TRAINER_CLASS_CAMPER
	.string "ADAM$", 8
	.byte 0x0C @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word EXCITING
	ec_word BATTLE
	ec_word THOSE
	ec_word GREAT
	ec_word YEEHAW_EXCL
	.2byte 0xFFFF

@ 47
	.byte TRAINER_CLASS_SCHOOL_KID_F
	.string "GRETE$", 8
	.byte 0x42 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I
	ec_word WANTS
	ec_word SOMETHING
	ec_move1 GROWTH
	ec_word WORKS
	.2byte 0xFFFF

@ 48
	.byte TRAINER_CLASS_BEAUTY
	.string "NAOMI$", 8
	.byte 0x04 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word IT
	ec_word WAS
	ec_word GREAT
	ec_word YOUNG
	ec_word TO
	ec_word HIS

@ 49
	.byte TRAINER_CLASS_NINJA_BOY
	.string "KENO$", 8
	.byte 0x0C @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word PLEASE
	ec_word BE
	ec_word DON_T
	ec_word SO
	ec_word MEAN
	ec_word TO_ME

@ 50
	.byte TRAINER_CLASS_CYCLING_TRIATHLETE_M
	.string "REMUS$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WAKES_UP
	ec_move2 HIDDEN_POWER
	ec_word AND
	ec_move1 ASTONISH
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 51
	.byte TRAINER_CLASS_POKEMON_RANGER_F
	.string "EDITH$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word THE
	ec_word BATTLE_TOWER
	ec_word IS
	ec_word SO
	ec_word ENTERTAINING
	ec_word AWESOME

@ 52
	.byte TRAINER_CLASS_RUIN_MANIAC
	.string "ANTON$", 8
	.byte 0x41 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word THICK_FAT
	ec_word AND
	ec_word CHLOROPHYLL
	ec_word BLEND
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word TASTY

@ 53
	.byte TRAINER_CLASS_SWIMMER_M
	.string "MALTE$", 8
	.byte 0x81 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word AN
	ec_move1 SCARY_FACE
	ec_word IS
	ec_word DON_T
	ec_word QUITE
	ec_word TERRIBLE

@ 54
	.byte TRAINER_CLASS_HEX_MANIAC
	.string "RAOUL$", 8
	.byte 0x42 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word RUN_AWAY
	ec_word GIVE_ME
	ec_word SON
	ec_word BEST
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 55
	.byte TRAINER_CLASS_RUNNING_TRIATHLETE_M
	.string "RICK$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WATER
	ec_word IS
	ec_word TASTY
	ec_word HIP_AND
	ec_word REFRESHING
	ec_word YES_SIR_EXCL

@ 56
	.byte TRAINER_CLASS_POKEFAN_M
	.string "DENNIS$", 8
	.byte 0x80 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word GO
	ec_word WHO_WAS
	ec_word POKEMON
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 57
	.byte TRAINER_CLASS_PSYCHIC_F
	.string "GLORIA$", 8
	.byte 0x82 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word THE
	ec_word FIGHTING
	ec_word MUST_BE
	ec_word HOT
	ec_word HIS
	ec_word FIERY

@ 58
	.byte TRAINER_CLASS_GUITARIST
	.string "NINO$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word MUSIC
	ec_word IS
	ec_word MY
	ec_word EVERY
	ec_word MY
	ec_word DESTINY

@ 59
	.byte TRAINER_CLASS_KINDLER
	.string "FIETE$", 8
	.byte 0x41 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word IT_S
	ec_word ALL_RIGHT
	ec_word VERY
	ec_word ALL_RIGHT
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 60
	.byte TRAINER_CLASS_AROMA_LADY
	.string "AMANDA$", 8
	.byte 0x82 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WHAT
	ec_word FOR
	ec_word A
	ec_word TRAINER
	ec_word ARE
	ec_word YOU

@ 61
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_M
	.string "MAREK$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WE_VE
	ec_word UNTIL
	ec_word NOW
	ec_word TOTALLY
	ec_word NEVER
	ec_word LOST

@ 62
	.byte TRAINER_CLASS_DRAGON_TAMER
	.string "NATHAN$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word DRAGON
	.2byte 0xFFFF
	ec_word POKEMON
	ec_word THOSE
	ec_word FANTASTIC
	.2byte 0xFFFF

@ 63
	.byte TRAINER_CLASS_LASS
	.string "MIRIAM$", 8
	.byte 0x82 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word YOU_RE
	ec_word QUITE
	ec_word TOO_STRONG
	ec_word AM
	ec_word BAD
	ec_word NEWS

@ 64
	.byte TRAINER_CLASS_POKEMANIAC
	.string "THEO$", 8
	.byte 0x40 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word PLUSH_DOLL
	ec_word MUST_BE
	ec_word MAN
	ec_word SIMPLE
	ec_word ADORE
	.2byte 0xFFFF

@ 65
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_F
	.string "PIA$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word HERE_I_COME
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word CUTE
	ec_word A
	ec_word CHANNEL
	ec_word IDOL

@ 66
	.byte TRAINER_CLASS_POKEFAN_F
	.string "ALISSA$", 8
	.byte 0x20 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word YOURS
	ec_word POKEMON
	ec_word THOSE
	ec_word PREPOSTEROUS
	ec_word I_AM
	ec_word SHOCKED

@ 67
	.byte TRAINER_CLASS_GENTLEMAN
	.string "ARTUR$", 8
	.byte 0x20 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word PLEASE
	ec_word ALL
	ec_word BATTLE
	ec_word WEREN_T
	ec_word GREAT
	ec_word HIS

@ 68
	.byte TRAINER_CLASS_SWIMMER_F
	.string "MAJA$", 8
	.byte 0x82 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I_AM
	ec_word PRETTY
	ec_word YOU
	ec_word CAN_T
	ec_word DON_T
	ec_word WINS

@ 69
	.byte TRAINER_CLASS_COOL_TRAINER_M
	.string "MARIUS$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I
	ec_word BATTLE
	ec_word DAILY
	ec_word I
	ec_word WON_T
	ec_word LOSE

@ 70
	.byte TRAINER_CLASS_BIRD_KEEPER
	.string "OLIVER$", 8
	.byte 0x11 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word GIGGLE
	ec_word GIGGLE
	ec_word SNORT
	ec_word HAPPILY
	ec_word GIGGLE
	ec_word MUFUFU

@ 71
	.byte TRAINER_CLASS_CYCLING_TRIATHLETE_F
	.string "MOLLY$", 8
	.byte 0x12 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word IS
	ec_word TODAY
	ec_word MONDAY
	ec_word QUES
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 72
	.byte TRAINER_CLASS_BUG_MANIAC
	.string "JÖRG$", 8
	.byte 0x40 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WATER
	.2byte 0xFFFF
	ec_word AND
	ec_word BUG
	.2byte 0xFFFF
	ec_word POKEMON

@ 73
	.byte TRAINER_CLASS_BATTLE_GIRL
	.string "ANKE$", 8
	.byte 0x20 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WHAT
	ec_word IS
	ec_word PRESSURE
	ec_word STATIC
	ec_word IS
	ec_word SUPER

@ 74
	.byte TRAINER_CLASS_FISHERMAN
	.string "HANS$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word KID
	ec_word YOU
	ec_word CAN_T
	ec_word DON_T
	ec_word WINS
	.2byte 0xFFFF

@ 75
	.byte TRAINER_CLASS_SAILOR
	.string "PETER$", 8
	.byte 0x20 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word IT_S
	ec_word QUITE
	ec_word TERRIBLE
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word MODE
	ec_word I

@ 76
	.byte TRAINER_CLASS_EXPERT_F
	.string "MARA$", 8
	.byte 0x20 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word YOU_RE
	ec_word VERY
	ec_word ALL_RIGHT
	ec_word TRAINS
	ec_word OR
	ec_word QUES

@ 77
	.byte TRAINER_CLASS_BUG_MANIAC
	.string "DARIUS$", 8
	.byte 0x11 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word ARE
	ec_word YOU
	ec_word TOUGH
	ec_word ARE
	ec_word YOU
	ec_word SCARY

@ 78
	.byte TRAINER_CLASS_POKEMON_BREEDER_F
	.string "REGINA$", 8
	.byte 0x12 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word TODAY
	ec_word WIN
	ec_word I
	ec_word MAYBE
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	.2byte 0xFFFF

@ 79
	.byte TRAINER_CLASS_PARASOL_LADY
	.string "MAIKE$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word SO
	ec_word AN
	ec_move1 SCARY_FACE
	ec_word IS
	ec_word NOT_VERY
	ec_word KIND

@ 80
	.byte TRAINER_CLASS_RUNNING_TRIATHLETE_F
	.string "SANDRA$", 8
	.byte 0x04 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word SPORTS
	ec_word IS
	ec_word HEALTHY
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word SPIRALING
	.2byte 0xFFFF

@ 81
	.byte TRAINER_CLASS_POKEMON_RANGER_M
	.string "ARNOLD$", 8
	.byte 0x08 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word AWESOME
	ec_word WHO_WAS
	ec_word POKEMON
	ec_word THOSE
	ec_word ROCK_SOLID
	.2byte 0xFFFF

@ 82
	.byte TRAINER_CLASS_BLACK_BELT
	.string "XENO$", 8
	.byte 0x04 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word HOO_HAH
	ec_word ARE
	ec_word YOU
	ec_word READY
	ec_word FOR
	ec_word SHADY

@ 83
	.byte TRAINER_CLASS_COOL_TRAINER_F
	.string "KARLA$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word YOU
	ec_word CAN_T
	ec_word ME
	ec_word NEVER
	ec_word SMITE
	ec_word KID

@ 84
	.byte TRAINER_CLASS_COLLECTOR
	.string "VOLKER$", 8
	.byte 0x80 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word FROM
	ec_word PLACE
	ec_word TO
	ec_word PLACE
	ec_word POKEMON
	ec_word WOWEE

@ 85
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_M
	.string "TOBIAS$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word THAT
	ec_word ISN_T
	ec_word SPORTS
	ec_word IT_S
	ec_word A
	ec_word FIGHTING

@ 86
	.byte TRAINER_CLASS_GENTLEMAN
	.string "NORBERT$", 8
	.byte 0x20 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I
	ec_word MUST_BE
	ec_word WINS
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word PLEASE
	ec_word PLEASE

@ 87
	.byte TRAINER_CLASS_BATTLE_GIRL
	.string "ZITA$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word THAT
	ec_word IS
	ec_word SCARY
	ec_word PLEASE
	ec_word BE
	ec_word NICE

@ 88
	.byte TRAINER_CLASS_BEAUTY
	.string "ELKE$", 8
	.byte 0x20 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WITHOUT
	ec_move1 FLAIL
	ec_word NONE
	ec_move1 WITHDRAW
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	.2byte 0xFFFF

@ 89
	.byte TRAINER_CLASS_HIKER
	.string "VITUS$", 8
	.byte 0x04 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word YAHOO
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word LISTENS
	ec_word HER
	ec_word TO
	ec_word QUES

@ 90
	.byte TRAINER_CLASS_EXPERT_M
	.string "MALTE$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word LEARN
	ec_word CORRECT
	ec_word TO
	ec_word FIGHT
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 91
	.byte TRAINER_CLASS_POKEMON_BREEDER_M
	.string "TIM$", 8
	.byte 0x40 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word IT_S
	ec_word A
	ec_word FIGHTING
	ec_word NONE
	ec_word CHILD_S_PLAY
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS

@ 92
	.byte TRAINER_CLASS_GUITARIST
	.string "GAVIN$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word SHADY
	ec_word BABY
	ec_word BABY
	ec_word BABY
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 93
	.byte TRAINER_CLASS_PSYCHIC_M
	.string "RALF$", 8
	.byte 0x08 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word STICKY_HOLD
	ec_word THOSE
	ec_word IMPORTANT
	ec_word ISN_T_IT_QUES
	.2byte 0xFFFF
	.2byte 0xFFFF

@ 94
	.byte TRAINER_CLASS_COOL_TRAINER_F
	.string "JENNY$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word I
	ec_word SEARCH
	ec_word TRAINER
	ec_word ABSOLUTELY
	ec_word TOUGH
	ec_word THOSE

@ 95
	.byte TRAINER_CLASS_EXPERT_M
	.string "JOEL$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word BELIEVE
	ec_word ON
	ec_word YOURS
	ec_word POKEMON
	ec_word AND
	ec_word WIN

@ 96
	.byte TRAINER_CLASS_DRAGON_TAMER
	.string "KOLJA$", 8
	.byte 0x0C @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word GIRL
	ec_word WITH
	ec_move2 FORESIGHT
	ec_word THOSE
	ec_word NICE
	.2byte 0xFFFF

@ 97
	.byte TRAINER_CLASS_COOL_TRAINER_M
	.string "BILL$", 8
	.byte 0x01 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word WHO_WAS
	ec_word POWER
	ec_word IS
	ec_word OVERWHELMING
	ec_word DISAPPEAR
	ec_word BETTER

@ 98
	.byte TRAINER_CLASS_EXPERT_F
	.string "CALLA$", 8
	.byte 0x10 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word TRAINER
	ec_word YOU
	ec_word ARE
	ec_word SEEMS
	ec_word CAPABLE
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS

@ 99
	.byte TRAINER_CLASS_LADY
	.string "GESA$", 8
	.byte 0x02 @ team flags
	.2byte 0 @ padding
@ pre-battle dialogue
	ec_word COME_ON
	ec_word ABSOLUTELY
	ec_word TIME
	ec_word BECOMES
	ec_word EXCELLENT
	.2byte 0xFFFF
