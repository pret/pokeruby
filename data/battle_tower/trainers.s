	.align 2

gBattleTowerTrainers: ; 8402F00
; 0
	.byte TRAINER_CLASS_YOUNGSTER
	.charmapstr "ALVIN$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word ARE
	ec_word YOU
	ec_word READY
	ec_word QUES
	ec_word HERE_I_COME
	ec_word EXCL

; 1
	.byte TRAINER_CLASS_BIRD_KEEPER
	.charmapstr "DIRK$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word OKAY
	ec_word I_AM
	ec_word GOING
	ec_word FOR
	ec_word IT
	ec_word EXCL

; 2
	.byte TRAINER_CLASS_LADY
	.charmapstr "CYBIL$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU_RE
	ec_word A
	ec_word PUSHOVER
	ec_word LET_S
	ec_word GET
	ec_word GOING

; 3
	.byte TRAINER_CLASS_BLACK_BELT
	.charmapstr "CHEN$", 8
	.byte 0x05 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word MY
	ec_word SPIRIT
	ec_word IS
	ec_word ENOUGH
	ec_word SNORT
	ec_word ARRGH

; 4
	.byte TRAINER_CLASS_NINJA_BOY
	.charmapstr "YOSHI$", 8
	.byte 0x05 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word GO
	ec_word MY
	ec_word POKEMON
	ec_word FIGHT
	ec_word THE
	ec_word BATTLE

; 5
	.byte TRAINER_CLASS_SCHOOL_KID_F
	.charmapstr "TINA$", 8
	.byte 0x0A ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word STUDY
	ec_word IS
	ec_word BORING
	ec_word LET_S
	ec_word BATTLE
	ec_word NOW

; 6
	.byte TRAINER_CLASS_BUG_MANIAC
	.charmapstr "COREY$", 8
	.byte 0x41 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word HEY
	ec_word I
	ec_word WILL
	ec_move2 TRANSFORM
	ec_word FOR
	ec_move1 STRENGTH

; 7
	.byte TRAINER_CLASS_FISHERMAN
	.charmapstr "GORDON$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word NEED
	ec_word A
	ec_word VACATION
	ec_word RIGHT
	ec_word NOW

; 8
	.byte TRAINER_CLASS_TUBER_F
	.charmapstr "ANN$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word WE
	ec_word ALL
	ec_word ADORE
	ec_word POKEMON
	ec_word ABSOLUTELY
	ec_word TRULY

; 9
	.byte TRAINER_CLASS_POKEFAN_F
	.charmapstr "JULIA$", 8
	.byte 0x42 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I_AM
	ec_word A
	ec_word CUTE
	ec_word LADY
	ec_word YES
	ec_word I_AM

; 10
	.byte TRAINER_CLASS_GENTLEMAN
	.charmapstr "GREGORY$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word THINK
	ec_word WE
	ec_word SHOULD
	ec_word START
	ec_word TODAY

; 11
	.byte TRAINER_CLASS_CAMPER
	.charmapstr "KEITH$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU_RE
	ec_word MY
	ec_word FRIEND
	ec_word FROM
	ec_word NOW
	ec_word ON

; 12
	.byte TRAINER_CLASS_RUNNING_TRIATHLETE_F
	.charmapstr "KENDRA$", 8
	.byte 0x0A ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I_AM
	ec_move1 SWIFT
	ec_word HOW
	ec_word ABOUT
	ec_word YOU
	ec_word QUES

; 13
	.byte TRAINER_CLASS_HIKER
	.charmapstr "DEV$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word WAHAHAHA
	ec_word I_AM
	ec_word FEELING
	ec_word LIKE
	ec_word IT_S
	ec_move2 PAY_DAY

; 14
	.byte TRAINER_CLASS_BATTLE_GIRL
	.charmapstr "CASSIE$", 8
	.byte 0x0A ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU_RE
	ec_word STRONG
	ec_word AREN_T
	.2byte -1
	ec_word YOU
	ec_word QUES

; 15
	.byte TRAINER_CLASS_PSYCHIC_M
	.charmapstr "JULIAN$", 8
	.byte 0x05 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word FUFUFU
	.2byte -1
	ec_word YOU
	ec_word CAN_T
	ec_word WIN
	ec_word KID

; 16
	.byte TRAINER_CLASS_LASS
	.charmapstr "JOYCE$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word BE
	ec_word KIND
	ec_word TO
	ec_word THE
	ec_word DIGITAL
	ec_word IDOL

; 17
	.byte TRAINER_CLASS_GUITARIST
	.charmapstr "LES$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I_AM
	ec_word GREAT
	ec_word YOU_RE
	ec_word JUST
	ec_word RATHER
	ec_word OKAY

; 18
	.byte TRAINER_CLASS_RICH_BOY
	.charmapstr "CLINTON$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word HAVE
	ec_word ROUGH_SKIN
	ec_word I
	ec_word NEED
	ec_word NATURAL_CURE

; 19
	.byte TRAINER_CLASS_BUG_CATCHER
	.charmapstr "LEWIS$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word THIS
	ec_word IS
	ec_word EXCITING
	ec_word CAN
	ec_word I
	ec_word WIN

; 20
	.byte TRAINER_CLASS_PICNICKER
	.charmapstr "RACHAEL$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word LIKE
	ec_word WALKING
	ec_word WITH
	ec_word MY
	ec_word POKEMON

; 21
	.byte TRAINER_CLASS_COLLECTOR
	.charmapstr "HAROLD$", 8
	.byte 0x09 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word HERE
	ec_word THEY
	ec_word COME
	ec_word MY
	ec_move2 SUPERPOWER
	ec_word POKEMON

; 22
	.byte TRAINER_CLASS_TUBER_M
	.charmapstr "KIPP$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I_AM
	ec_word A
	ec_word GENIUS
	ec_word I
	ec_word SHOULD
	ec_word WIN

; 23
	.byte TRAINER_CLASS_KINDLER
	.charmapstr "IRWIN$", 8
	.byte 0x05 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU
	ec_word WILL
	ec_word BE
	ec_word FEELING
	ec_word MY
	ec_word FIRE

; 24
	.byte TRAINER_CLASS_PSYCHIC_F
	.charmapstr "EILEEN$", 8
	.byte 0x0A ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word WILL
	ec_move1 ASTONISH
	ec_word YOU
	ec_word IN
	ec_word BATTLE

; 25
	.byte TRAINER_CLASS_SWIMMER_F
	.charmapstr "ANNE$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word SORRY
	ec_word BUT
	ec_word YOU
	ec_word WILL
	ec_word NOT
	ec_word WIN

; 26
	.byte TRAINER_CLASS_CYCLING_TRIATHLETE_F
	.charmapstr "RUTH$", 8
	.byte 0x06 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word A
	ec_word STRONG
	ec_word GIRL
	ec_word WANTS
	ec_word TOUGH
	ec_word POKEMON

; 27
	.byte TRAINER_CLASS_POKEMANIAC
	.charmapstr "JEREMY$", 8
	.byte 0x40 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word MY
	ec_word POKEMON
	ec_word ARE
	ec_word COOL
	ec_word YOURS
	ec_word CAN_T_WIN

; 28
	.byte TRAINER_CLASS_SAILOR
	.charmapstr "TREVOR$", 8
	.byte 0x09 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word MY
	ec_word OPPONENT
	ec_word IS
	ec_word FINALLY
	ec_word HERE
	ec_word EXCELLENT

; 29
	.byte TRAINER_CLASS_POKEMON_BREEDER_F
	.charmapstr "COLETTE$", 8
	.byte 0x06 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word AM
	ec_word HUNGRY
	ec_move2 POUND
	ec_word MY
	ec_move2 BELLY_DRUM

; 30
	.byte TRAINER_CLASS_HEX_MANIAC
	.charmapstr "PAULA$", 8
	.byte 0x42 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word IT_S
	ec_word HARD
	ec_word TO
	ec_word TAKE
	ec_word UGLY
	ec_move1 SPITE

; 31
	.byte TRAINER_CLASS_RUIN_MANIAC
	.charmapstr "STANLY$", 8
	.byte 0x41 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word ADVENTURE
	ec_word AND
	ec_word BATTLE
	ec_word ARE
	ec_word MY
	ec_word LIKES

; 32
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_M
	.charmapstr "TROY$", 8
	.byte 0x09 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU
	ec_word CAN_T
	ec_word LOSE
	ec_word TO
	ec_word A
	ec_word KID

; 33
	.byte TRAINER_CLASS_SCHOOL_KID_M
	.charmapstr "ED$", 8
	.byte 0x08 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word POKEMON
	ec_word DAILY
	ec_word AT
	ec_word SCHOOL
	ec_word IT_S
	ec_word AWESOME

; 34
	.byte TRAINER_CLASS_POKEMON_RANGER_F
	.charmapstr "ELLEN$", 8
	.byte 0x04 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word ARE
	ec_word YOU
	ec_word KIND
	ec_word TO
	ec_word YOUR
	ec_word POKEMON

; 35
	.byte TRAINER_CLASS_SWIMMER_M
	.charmapstr "ARNIE$", 8
	.byte 0x09 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word BATTLE
	ec_word SERIOUSLY
	ec_word BEAUTIFUL
	ec_word YOU
	ec_move1 DIG

; 36
	.byte TRAINER_CLASS_RUNNING_TRIATHLETE_M
	.charmapstr "HAL$", 8
	.byte 0x09 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word BOY
	ec_word I_AM
	ec_word TIRED
	ec_word READY
	ec_word FOR
	ec_word SLEEP

; 37
	.byte TRAINER_CLASS_BEAUTY
	.charmapstr "LAUREN$", 8
	.byte 0x06 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word A
	ec_word TRAINER
	ec_word LIKE
	ec_word YOU
	ec_word IS
	ec_word EXCITING

; 38
	.byte TRAINER_CLASS_AROMA_LADY
	.charmapstr "STACY$", 8
	.byte 0x06 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word HAVE
	ec_word YOU
	ec_word A
	ec_word STENCH
	ec_word OR
	ec_move1 SWEET_SCENT

; 39
	.byte TRAINER_CLASS_COLLECTOR
	.charmapstr "DARYL$", 8
	.byte 0x81 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOUR
	ec_word POKEMON
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word I
	ec_word WANT
	ec_word IT

; 40
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_F
	.charmapstr "KATHY$", 8
	.byte 0x04 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word WILL
	ec_word TRY
	ec_word MY
	ec_word BEST
	ec_word TODAY

; 41
	.byte TRAINER_CLASS_POKEMON_RANGER_M
	.charmapstr "HARRIS$", 8
	.byte 0x0C ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word WAAAH
	ec_word WAAAH
	ec_word WAAAH
	ec_word WAAAH
	ec_word EHEHE
	ec_move1 FAKE_TEARS

; 42
	.byte TRAINER_CLASS_POKEFAN_M
	.charmapstr "GLENN$", 8
	.byte 0x80 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word LISTEN
	ec_word TO
	ec_word MY
	ec_word LOUSY
	ec_word ANIME
	ec_word SONG

; 43
	.byte TRAINER_CLASS_CYCLING_TRIATHLETE_M
	.charmapstr "NICO$", 8
	.byte 0x04 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word DON_T
	ec_word JUST
	ec_word BATTLE
	ec_word DO
	ec_word SOMETHING
	ec_word ELSE

; 44
	.byte TRAINER_CLASS_POKEMON_BREEDER_M
	.charmapstr "BAILEY$", 8
	.byte 0x41 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word ARE
	ec_word YOU
	ec_word BUSY
	ec_word GET
	ec_word WITH
	ec_word IT

; 45
	.byte TRAINER_CLASS_PARASOL_LADY
	.charmapstr "ABBIE$", 8
	.byte 0x08 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word THE
	ec_move1 MORNING_SUN
	ec_word HAS
	ec_word SO
	ec_word MUCH
	ec_move1 COSMIC_POWER

; 46
	.byte TRAINER_CLASS_CAMPER
	.charmapstr "AL$", 8
	.byte 0x0C ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word LET_S
	ec_word HAVE
	ec_word AN
	ec_word EXCITING
	ec_word BATTLE
	ec_word YEEHAW_EXCL

; 47
	.byte TRAINER_CLASS_SCHOOL_KID_F
	.charmapstr "PEGGY$", 8
	.byte 0x42 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word WANT
	ec_word TO
	ec_word SEE
	ec_word SOME
	ec_move1 GROWTH

; 48
	.byte TRAINER_CLASS_BEAUTY
	.charmapstr "NAOMI$", 8
	.byte 0x04 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word IT
	ec_word WAS
	ec_word GREAT
	ec_word TO
	ec_word BE
	ec_word YOUNG

; 49
	.byte TRAINER_CLASS_NINJA_BOY
	.charmapstr "KENJI$", 8
	.byte 0x0C ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word PLEASE
	.2byte -1
	ec_word DON_T
	ec_word BE
	ec_word MEAN
	ec_word TO_ME

; 50
	.byte TRAINER_CLASS_CYCLING_TRIATHLETE_M
	.charmapstr "ROSS$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word WAKE_UP
	ec_word MY
	ec_move2 HIDDEN_POWER
	ec_word AND
	ec_move1 ASTONISH
	ec_word ME

; 51
	.byte TRAINER_CLASS_POKEMON_RANGER_F
	.charmapstr "EDNA$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word BATTLE_TOWER
	ec_word IS
	ec_word SO
	ec_word ENTERTAINING
	ec_word IT_S
	ec_word AWESOME

; 52
	.byte TRAINER_CLASS_RUIN_MANIAC
	.charmapstr "ANTON$", 8
	.byte 0x41 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word BLEND
	ec_word THICK_FAT
	ec_word AND
	ec_word CHLOROPHYLL
	ec_word IT_S
	ec_word TASTY

; 53
	.byte TRAINER_CLASS_SWIMMER_M
	.charmapstr "MITCH$", 8
	.byte 0x81 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word NEXT
	ec_word A
	ec_word GIRL
	ec_word WITH
	ec_word A
	ec_move1 SCARY_FACE

; 54
	.byte TRAINER_CLASS_HEX_MANIAC
	.charmapstr "ROD$", 8
	.byte 0x42 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word GIMME
	ec_word A
	ec_word TOUGH
	ec_word BATTLE
	ec_word NOT
	ec_word WIMPY

; 55
	.byte TRAINER_CLASS_RUNNING_TRIATHLETE_M
	.charmapstr "RICH$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word TASTY
	ec_word WATER
	ec_word IS
	ec_word HIP_AND
	ec_word HAPPENING
	ec_word YES_SIR_EXCL

; 56
	.byte TRAINER_CLASS_POKEFAN_M
	.charmapstr "DANIEL$", 8
	.byte 0x80 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word GO
	ec_word FOR
	ec_word IT
	ec_word MY
	ec_word LOVEY_DOVEY
	ec_word POKEMON

; 57
	.byte TRAINER_CLASS_PSYCHIC_F
	.charmapstr "GLORIA$", 8
	.byte 0x82 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word LET_S
	ec_word GET
	ec_word THIS
	ec_word FIERY
	ec_word BATTLE
	ec_word HAPPENING

; 58
	.byte TRAINER_CLASS_GUITARIST
	.charmapstr "NELSON$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word MUSIC
	ec_word IS
	ec_word MY
	ec_word ALL
	ec_word MY
	ec_word DESTINY

; 59
	.byte TRAINER_CLASS_KINDLER
	.charmapstr "FERRIS$", 8
	.byte 0x41 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word GOOD
	ec_word IT
	ec_word IS
	ec_word SO
	ec_word VERY
	ec_word GOOD

; 60
	.byte TRAINER_CLASS_AROMA_LADY
	.charmapstr "AMANDA$", 8
	.byte 0x82 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word WHAT
	ec_word KIND
	ec_word OF
	ec_word TRAINER
	ec_word ARE
	ec_word YOU

; 61
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_M
	.charmapstr "MASON$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word DON_T
	ec_word KNOW
	ec_word HOW
	ec_word TO
	ec_word LOSE

; 62
	.byte TRAINER_CLASS_DRAGON_TAMER
	.charmapstr "NATE$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word DRAGON
	ec_word POKEMON
	ec_word ARE
	ec_word ALL
	ec_word THE
	ec_move1 RAGE

; 63
	.byte TRAINER_CLASS_LASS
	.charmapstr "MIRIAM$", 8
	.byte 0x82 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU_RE
	ec_word TOO_STRONG
	ec_word SERIOUSLY
	ec_word IT_S
	ec_word BAD
	ec_word NEWS

; 64
	.byte TRAINER_CLASS_POKEMANIAC
	.charmapstr "THEO$", 8
	.byte 0x40 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word ADORE
	ec_word MY
	ec_word MEGA
	ec_word CUTE
	ec_word PLUSH_DOLL

; 65
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_F
	.charmapstr "PAMELA$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word HERE_I_COME
	ec_word I_AM
	ec_word THE
	ec_word CUTE
	ec_move2 WATER_SPORT
	ec_word IDOL

; 66
	.byte TRAINER_CLASS_POKEFAN_F
	.charmapstr "ALISSA$", 8
	.byte 0x20 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word IT_S
	ec_word A
	ec_word PREPOSTEROUS
	ec_word MATCH
	ec_word I_AM
	ec_word SHOCKED

; 67
	.byte TRAINER_CLASS_GENTLEMAN
	.charmapstr "ARTHUR$", 8
	.byte 0x20 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word PLEASE
	ec_word GIVE
	ec_word ME
	ec_word A
	ec_word GOOD
	ec_word BATTLE

; 68
	.byte TRAINER_CLASS_SWIMMER_F
	.charmapstr "MARCY$", 8
	.byte 0x82 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I_AM
	ec_word BEAUTIFUL
	ec_word YOU
	ec_word CAN_T
	ec_word BEAT
	ec_word ME

; 69
	.byte TRAINER_CLASS_COOL_TRAINER_M
	.charmapstr "MILLER$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word BATTLE
	ec_word DAILY
	ec_word I
	ec_word WON_T
	ec_word LOSE

; 70
	.byte TRAINER_CLASS_BIRD_KEEPER
	.charmapstr "OLIVER$", 8
	.byte 0x11 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	ec_word GIGGLE
	ec_word ELLIPSIS_ELLIPSIS_ELLIPSIS
	.2byte -1
	.2byte -1
	.2byte -1

; 71
	.byte TRAINER_CLASS_CYCLING_TRIATHLETE_F
	.charmapstr "MOLLY$", 8
	.byte 0x12 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word HOW
	ec_word ARE
	ec_word YOU
	ec_word ON
	ec_word MONDAY
	ec_word MORNING

; 72
	.byte TRAINER_CLASS_BUG_MANIAC
	.charmapstr "JASON$", 8
	.byte 0x40 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word WATER
	ec_word AND
	ec_word BUG
	ec_word POKEMON
	ec_word ARE
	ec_word GREAT

; 73
	.byte TRAINER_CLASS_BATTLE_GIRL
	.charmapstr "AVA$", 8
	.byte 0x20 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word WHAT
	ec_word IS
	ec_word THIS
	ec_word PRESSURE
	ec_word ELLIPSIS
	ec_word STATIC

; 74
	.byte TRAINER_CLASS_FISHERMAN
	.charmapstr "HANK$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU_RE
	ec_word A
	ec_word KID
	ec_word YOU
	ec_word CAN_T
	ec_word WIN

; 75
	.byte TRAINER_CLASS_SAILOR
	.charmapstr "PETER$", 8
	.byte 0x20 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word IT_S
	ec_word SERIOUSLY
	ec_word TERRIBLE
	ec_word I
	ec_word REALLY
	ec_word THINK

; 76
	.byte TRAINER_CLASS_EXPERT_F
	.charmapstr "MINDY$", 8
	.byte 0x20 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU
	ec_word APPEAR
	ec_word TO
	ec_word TRAIN
	ec_word VERY
	ec_word WELL

; 77
	.byte TRAINER_CLASS_BUG_MANIAC
	.charmapstr "DWIGHT$", 8
	.byte 0x11 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word ARE
	ec_word YOU
	ec_word STRONG
	ec_word YOU
	ec_word ARE
	ec_word SCARY

; 78
	.byte TRAINER_CLASS_POKEMON_BREEDER_F
	.charmapstr "REENA$", 8
	.byte 0x12 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word ALWAYS
	ec_word LOSE
	ec_word MAYBE
	ec_word TODAY
	ec_word ELLIPSIS

; 79
	.byte TRAINER_CLASS_PARASOL_LADY
	.charmapstr "MEGAN$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word DON_T
	ec_word MAKE
	ec_word THAT
	ec_move1 SCARY_FACE
	ec_word AT
	ec_word ME

; 80
	.byte TRAINER_CLASS_RUNNING_TRIATHLETE_F
	.charmapstr "SIERRA$", 8
	.byte 0x04 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I_VE
	ec_word RUN
	ec_word A_LOT
	ec_word SO
	ec_word I_AM
	ec_word HEALTHY

; 81
	.byte TRAINER_CLASS_POKEMON_RANGER_M
	.charmapstr "ARNOLD$", 8
	.byte 0x08 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I_AM
	ec_word FEELING
	ec_word AWESOME
	ec_word MY
	ec_word POKEMON
	ec_word ROCK

; 82
	.byte TRAINER_CLASS_BLACK_BELT
	.charmapstr "XIN$", 8
	.byte 0x04 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word HOO_HAH
	ec_word ARE
	ec_word YOU
	ec_word READY
	ec_word TO
	ec_word ROCK

; 83
	.byte TRAINER_CLASS_COOL_TRAINER_F
	.charmapstr "KELLY$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YOU
	ec_word COULDN_T
	ec_word BEAT
	ec_word ME
	ec_word EVER
	ec_word KID

; 84
	.byte TRAINER_CLASS_COLLECTOR
	.charmapstr "VANCE$", 8
	.byte 0x80 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word POKEMON
	ec_word ALL
	ec_word OVER
	ec_word THE
	ec_word PLACE
	ec_word WOWEE

; 85
	.byte TRAINER_CLASS_SWIMMING_TRIATHLETE_M
	.charmapstr "TOBY$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word THIS
	ec_word ISN_T
	ec_word SPORTS
	ec_word IT_S
	ec_word A
	ec_word BATTLE

; 86
	.byte TRAINER_CLASS_GENTLEMAN
	.charmapstr "NORTON$", 8
	.byte 0x20 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word HAVE
	ec_word TO
	ec_word WIN
	ec_word PLEASE
	ec_word LOSE

; 87
	.byte TRAINER_CLASS_BATTLE_GIRL
	.charmapstr "ZOE$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word THIS
	ec_word IS
	ec_word SCARY
	ec_word PLEASE
	ec_word BE
	ec_word NICE

; 88
	.byte TRAINER_CLASS_BEAUTY
	.charmapstr "EMMA$", 8
	.byte 0x20 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word DON_T
	ec_word YOU
	ec_move1 FLAIL
	ec_word YOU
	ec_word CAN_T
	ec_move1 WITHDRAW

; 89
	.byte TRAINER_CLASS_HIKER
	.charmapstr "VINCE$", 8
	.byte 0x04 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word YAHOO
	ec_word YAHOO
	ec_word ARE
	ec_word YOU
	ec_word LISTENING
	ec_word QUES

; 90
	.byte TRAINER_CLASS_EXPERT_M
	.charmapstr "MARV$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word LEARN
	ec_word TO
	ec_word BATTLE
	ec_word THE
	ec_word CORRECT
	ec_word WAY

; 91
	.byte TRAINER_CLASS_POKEMON_BREEDER_M
	.charmapstr "TODD$", 8
	.byte 0x40 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word THE
	ec_word WAY
	ec_word YOU
	ec_word BATTLE
	ec_word IT_S
	ec_word CHILD_S_PLAY

; 92
	.byte TRAINER_CLASS_GUITARIST
	.charmapstr "GAVIN$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word BABY
	ec_word BABY
	ec_word BABY
	ec_word ROCK
	ec_word ME
	ec_word HARD

; 93
	.byte TRAINER_CLASS_PSYCHIC_M
	.charmapstr "QUINN$", 8
	.byte 0x08 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word HAVE
	ec_word A
	ec_word STICKY_HOLD
	ec_word ON
	ec_word YOU

; 94
	.byte TRAINER_CLASS_COOL_TRAINER_F
	.charmapstr "JENN$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I_AM
	ec_word ON
	ec_word A
	ec_word TOUGH
	ec_word TRAINER
	ec_word SEARCH

; 95
	.byte TRAINER_CLASS_EXPERT_M
	.charmapstr "JOEL$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word BELIEVE
	ec_word IN
	ec_word YOUR
	ec_word POKEMON
	ec_word AND
	ec_word WIN

; 96
	.byte TRAINER_CLASS_DRAGON_TAMER
	.charmapstr "KYLE$", 8
	.byte 0x0C ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word I
	ec_word LIKE
	ec_word A
	ec_word GIRL
	ec_word WITH
	ec_move2 FORESIGHT

; 97
	.byte TRAINER_CLASS_COOL_TRAINER_M
	.charmapstr "BRET$", 8
	.byte 0x01 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word TAKE
	ec_word MY
	ec_word OVERWHELMING
	ec_word POWER
	ec_word AND
	ec_word DISAPPEAR

; 98
	.byte TRAINER_CLASS_EXPERT_F
	.charmapstr "CARRIE$", 8
	.byte 0x10 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word TRAINER
	ec_word I
	ec_word SEE
	ec_word YOU
	ec_word ARE
	ec_word CAPABLE

; 99
	.byte TRAINER_CLASS_LADY
	.charmapstr "GILLIAN$", 8
	.byte 0x02 ; team flags
	.2byte 0 ; padding
; pre-battle dialogue
	ec_word COME_ON
	ec_word SHOW
	ec_word ME
	ec_word AN
	ec_word EXCELLENT
	ec_word TIME
