	.align 2
	.global gTrainers
gTrainers: @ 81F04FC
@ NONE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_1
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 0 @ party size
	.4byte NULL

@ ARCHIE_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AQUA_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_ARCHIE
	.string "ARCHIE$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Archie1

@ GRUNT_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt1

@ GRUNT_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Grunt2

@ GRUNT_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt3

@ GRUNT_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt4

@ GRUNT_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt5

@ GRUNT_6
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt6

@ GRUNT_7
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grunt7

@ GRUNT_8
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt8

@ GRUNT_9
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt9

@ GRUNT_10
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt10

@ GRUNT_11
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt11

@ GRUNT_12
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt12

@ GRUNT_13
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt13

@ GRUNT_14
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt14

@ GRUNT_15
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt15

@ GRUNT_16
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt16

@ GRUNT_17
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt17

@ GRUNT_18
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grunt18

@ GRUNT_19
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt19

@ GRUNT_20
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt20

@ GRUNT_21
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt21

@ GRUNT_22
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grunt22

@ GRUNT_23
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt23

@ GRUNT_24
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt24

@ GRUNT_25
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_F
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt25

@ GRUNT_26
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_F
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grunt26

@ GRUNT_27
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_AQUA
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_GRUNT_F
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt27

@ ANONYMOUS_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AQUA_ADMIN
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_ADMIN_M
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Anonymous1

@ MATT_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AQUA_ADMIN
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_ADMIN_M
	.string "MATT$", 12
	.2byte ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Matt1

@ MATT_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AQUA_ADMIN
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_ADMIN_M
	.string "MATT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Matt2

@ SHELLY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AQUA_ADMIN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_ADMIN_F
	.string "SHELLY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Shelly1

@ SHELLY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AQUA_ADMIN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_AQUA_ADMIN_F
	.string "SHELLY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Shelly2

@ ARCHIE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AQUA_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_ARCHIE
	.string "ARCHIE$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Archie2

@ ARCHIE_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AQUA_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_AQUA @ gender flag and encounter music
	.byte TRAINER_PIC_ARCHIE
	.string "ARCHIE$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Archie3

@ DAISY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AROMA_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_AROMA_LADY
	.string "DAISY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Daisy

@ ROSE_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AROMA_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_AROMA_LADY
	.string "ROSE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Rose1

@ LILY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AROMA_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_AROMA_LADY
	.string "LILY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Lily

@ VIOLET
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AROMA_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_AROMA_LADY
	.string "VIOLET$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Violet

@ ROSE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AROMA_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_AROMA_LADY
	.string "ROSE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Rose2

@ ROSE_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AROMA_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_AROMA_LADY
	.string "ROSE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Rose3

@ ROSE_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AROMA_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_AROMA_LADY
	.string "ROSE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Rose4

@ ROSE_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_AROMA_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_AROMA_LADY
	.string "ROSE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Rose5

@ DUSTY_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_RUIN_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_RUIN_MANIAC
	.string "DUSTY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dusty1

@ CHIP
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_RUIN_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_RUIN_MANIAC
	.string "CHIP$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Chip

@ FOSTER
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_RUIN_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_RUIN_MANIAC
	.string "FOSTER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Foster

@ DUSTY_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_RUIN_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_RUIN_MANIAC
	.string "DUSTY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dusty2

@ DUSTY_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_RUIN_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_RUIN_MANIAC
	.string "DUSTY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dusty3

@ DUSTY_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_RUIN_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_RUIN_MANIAC
	.string "DUSTY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dusty4

@ DUSTY_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_RUIN_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_RUIN_MANIAC
	.string "DUSTY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dusty5

@ GABBY_AND_TY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_INTERVIEWER
	.byte TRAINER_ENCOUNTER_MUSIC_INTERVIEWER @ gender flag and encounter music
	.byte TRAINER_PIC_INTERVIEWER
	.string "GABBY & TY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_GabbyAndTy1

@ GABBY_AND_TY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_INTERVIEWER
	.byte TRAINER_ENCOUNTER_MUSIC_INTERVIEWER @ gender flag and encounter music
	.byte TRAINER_PIC_INTERVIEWER
	.string "GABBY & TY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_GabbyAndTy2

@ GABBY_AND_TY_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_INTERVIEWER
	.byte TRAINER_ENCOUNTER_MUSIC_INTERVIEWER @ gender flag and encounter music
	.byte TRAINER_PIC_INTERVIEWER
	.string "GABBY & TY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_GabbyAndTy3

@ GABBY_AND_TY_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_INTERVIEWER
	.byte TRAINER_ENCOUNTER_MUSIC_INTERVIEWER @ gender flag and encounter music
	.byte TRAINER_PIC_INTERVIEWER
	.string "GABBY & TY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_GabbyAndTy4

@ GABBY_AND_TY_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_INTERVIEWER
	.byte TRAINER_ENCOUNTER_MUSIC_INTERVIEWER @ gender flag and encounter music
	.byte TRAINER_PIC_INTERVIEWER
	.string "GABBY & TY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_GabbyAndTy5

@ GABBY_AND_TY_6
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_INTERVIEWER
	.byte TRAINER_ENCOUNTER_MUSIC_INTERVIEWER @ gender flag and encounter music
	.byte TRAINER_PIC_INTERVIEWER
	.string "GABBY & TY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_GabbyAndTy6

@ LOLA_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_F
	.string "LOLA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Lola1

@ CARMEN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_F
	.string "CARMEN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Carmen

@ GWEN 
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_F
	.string "GWEN $", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Gwen 

@ LOLA_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_F
	.string "LOLA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Lola2

@ LOLA_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_F
	.string "LOLA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Lola3

@ LOLA_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_F
	.string "LOLA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Lola4

@ LOLA_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_F
	.string "LOLA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Lola5

@ RICKY_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_M
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_M
	.string "RICKY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Ricky1

@ SIMON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_M
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_M
	.string "SIMON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Simon

@ CHARLIE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_M
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_M
	.string "CHARLIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Charlie

@ RICKY_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_M
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_M
	.string "RICKY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Ricky2

@ RICKY_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_M
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_M
	.string "RICKY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Ricky3

@ RICKY_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_M
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_M
	.string "RICKY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Ricky4

@ RICKY_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_TUBER_M
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_TUBER_M
	.string "RICKY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Ricky5

@ RANDALL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "RANDALL$", 12
	.2byte ITEM_X_SPEED, ITEM_X_SPEED, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Randall

@ PARKER
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "PARKER$", 12
	.2byte ITEM_GUARD_SPEC, ITEM_GUARD_SPEC, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Parker

@ GEORGE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "GEORGE$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_George

@ BERKE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "BERKE$", 12
	.2byte ITEM_DIRE_HIT, ITEM_DIRE_HIT, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Berke

@ CLYDE
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "CLYDE$", 12
	.2byte ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Clyde

@ VINCENT
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "VINCENT$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Vincent

@ LEROY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "LEROY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Leroy

@ WILTON_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "WILTON$", 12
	.2byte ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Wilton1

@ EDGAR
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "EDGAR$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Edgar

@ ALBERT
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "ALBERT$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Albert

@ SAMUEL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "SAMUEL$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Samuel

@ VITO
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "VITO$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Vito

@ OWEN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "OWEN$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Owen

@ WILTON_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "WILTON$", 12
	.2byte ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Wilton2

@ WILTON_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "WILTON$", 12
	.2byte ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Wilton3

@ WILTON_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "WILTON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Wilton4

@ WILTON_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "WILTON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Wilton5

@ WARREN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "WARREN$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Warren

@ MARY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "MARY$", 12
	.2byte ITEM_X_ACCURACY, ITEM_X_ACCURACY, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Mary

@ LORI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "LORI$", 12
	.2byte ITEM_X_DEFEND, ITEM_X_DEFEND, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Lori

@ JODY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "JODY$", 12
	.2byte ITEM_X_ATTACK, ITEM_X_ATTACK, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jody

@ WENDY
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "WENDY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Wendy

@ ELAINE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "ELAINE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Elaine

@ BROOKE_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "BROOKE$", 12
	.2byte ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brooke1

@ JENNIFER
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "JENNIFER$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jennifer

@ HOPE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "HOPE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Hope

@ SHANNON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "SHANNON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Shannon

@ MICHELLE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "MICHELLE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Michelle

@ CAROLINE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "CAROLINE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Caroline

@ JULIE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "JULIE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Julie

@ BROOKE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "BROOKE$", 12
	.2byte ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brooke2

@ BROOKE_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "BROOKE$", 12
	.2byte ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brooke3

@ BROOKE_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "BROOKE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brooke4

@ BROOKE_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "BROOKE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brooke5

@ PATRICIA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "PATRICIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Patricia

@ KINDRA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "KINDRA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Kindra

@ TAMMY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "TAMMY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Tammy

@ VALERIE_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "VALERIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Valerie1

@ TASHA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "TASHA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Tasha

@ VALERIE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "VALERIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Valerie2

@ VALERIE_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "VALERIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Valerie3

@ VALERIE_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "VALERIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Valerie4

@ VALERIE_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HEX_MANIAC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_HEX_MANIAC
	.string "VALERIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Valerie5

@ CINDY_1
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "CINDY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Cindy1

@ ANONYMOUS_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Anonymous2

@ BRIANNA_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "BRIANNA$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Brianna1

@ CINDY_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "CINDY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Cindy2

@ BRIANNA_2
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "BRIANNA$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Brianna2

@ ANETTE
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "ANETTE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Anette

@ CINDY_3
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "CINDY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Cindy3

@ CINDY_4
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "CINDY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Cindy4

@ CINDY_5
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "CINDY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Cindy5

@ CINDY_6
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LADY
	.string "CINDY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Cindy6

@ MELISSA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "MELISSA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Melissa

@ SHEILA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "SHEILA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Sheila

@ SHIRLEY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "SHIRLEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Shirley

@ JESSICA_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "JESSICA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jessica1

@ CONNIE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "CONNIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Connie

@ BRIDGET
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "BRIDGET$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Bridget

@ OLIVIA
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "OLIVIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Olivia

@ TIFFANY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "TIFFANY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Tiffany

@ JESSICA_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "JESSICA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jessica2

@ JESSICA_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "JESSICA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jessica3

@ JESSICA_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "JESSICA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jessica4

@ JESSICA_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "JESSICA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jessica5

@ WINSTON_1
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_RICH_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_RICH_BOY
	.string "WINSTON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Winston1

@ ANONYMOUS_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_RICH_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_RICH_BOY
	.string "$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Anonymous3

@ GARRET
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_RICH_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_RICH_BOY
	.string "GARRET$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Garret

@ WINSTON_2
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_RICH_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_RICH_BOY
	.string "WINSTON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Winston2

@ WINSTON_3
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_RICH_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_RICH_BOY
	.string "WINSTON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Winston3

@ WINSTON_4
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_RICH_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_RICH_BOY
	.string "WINSTON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Winston4

@ WINSTON_5
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_RICH_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_RICH_BOY
	.string "WINSTON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Winston5

@ STEVE_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMANIAC
	.string "STEVE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Steve1

@ CHRIS
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMANIAC
	.string "CHRIS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Chris

@ MARK
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMANIAC
	.string "MARK$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Mark

@ KENN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMANIAC
	.string "KENN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Kenn

@ STEVE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMANIAC
	.string "STEVE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Steve2

@ STEVE_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMANIAC
	.string "STEVE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Steve3

@ STEVE_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMANIAC
	.string "STEVE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Steve4

@ STEVE_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMANIAC
	.string "STEVE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Steve5

@ LUIS
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "LUIS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Luis

@ AUSTIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "AUSTIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Austin

@ DOUGLAS
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "DOUGLAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Douglas

@ DARRIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "DARRIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Darrin

@ TONY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "TONY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Tony1

@ JEROME
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "JEROME$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jerome

@ MATTHEW
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "MATTHEW$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Matthew

@ DAVID
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "DAVID$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_David

@ SPENCER
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "SPENCER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Spencer

@ ROLAND
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "ROLAND$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Roland

@ CODY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "CODY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cody

@ STAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "STAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Stan

@ BARRY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "BARRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Barry

@ DEAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "DEAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dean

@ RODNEY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "RODNEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Rodney

@ RICHARD
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "RICHARD$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Richard

@ HERMAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "HERMAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Herman

@ ANONYMOUS_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Anonymous4

@ GILBERT
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "GILBERT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Gilbert

@ FRANKLIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "FRANKLIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Franklin

@ DANNY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "DANNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Danny

@ JACK
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "JACK$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jack

@ DUDLEY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "DUDLEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dudley

@ CHAD
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "CHAD$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Chad

@ TONY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "TONY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Tony2

@ TONY_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "TONY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Tony3

@ TONY_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "TONY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Tony4

@ TONY_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "TONY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Tony5

@ HIDEKI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "HIDEKI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Hideki

@ HITOSHI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "HITOSHI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Hitoshi

@ KIYO
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "KIYO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Kiyo

@ KOICHI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "KOICHI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Koichi

@ NOB_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "NOB$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Nob1

@ NOB_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "NOB$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Nob2

@ NOB_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "NOB$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Nob3

@ NOB_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "NOB$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Nob4

@ NOB_5
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "NOB$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Nob5

@ YUJI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "YUJI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Yuji

@ DAISUKE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "DAISUKE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Daisuke

@ ATSUSHI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "ATSUSHI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Atsushi

@ KIRK
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "KIRK$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Kirk

@ SCOTT
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "SCOTT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Scott

@ HARVEY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "HARVEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Harvey

@ SHAWN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "SHAWN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Shawn

@ RANDY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "RANDY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Randy

@ DALTON_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "DALTON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dalton1

@ DALTON_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "DALTON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dalton2

@ DALTON_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "DALTON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dalton3

@ DALTON_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "DALTON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dalton4

@ DALTON_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GUITARIST
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_GUITARIST
	.string "DALTON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dalton5

@ COLE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "COLE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Cole

@ FLINT
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "FLINT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Flint

@ AXLE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "AXLE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Axle

@ JAKE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "JAKE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jake

@ ANDY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "ANDY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Andy

@ BERNIE_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "BERNIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Bernie1

@ BERNIE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "BERNIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Bernie2

@ BERNIE_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "BERNIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Bernie3

@ BERNIE_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "BERNIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Bernie4

@ BERNIE_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_KINDLER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_KINDLER
	.string "BERNIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Bernie5

@ DREW
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "DREW$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Drew

@ CLIFF
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "CLIFF$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Cliff

@ LARRY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "LARRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Larry

@ SHANE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "SHANE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Shane

@ JUSTIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "JUSTIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Justin

@ ETHAN_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "ETHAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Ethan1

@ JEFF
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "JEFF$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jeff

@ TRAVIS
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "TRAVIS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Travis

@ ETHAN_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "ETHAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Ethan2

@ ETHAN_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "ETHAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Ethan3

@ ETHAN_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "ETHAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ethan4

@ ETHAN_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "ETHAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ethan5

@ BRENT
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "BRENT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Brent

@ DONALD
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "DONALD$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Donald

@ TAYLOR
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "TAYLOR$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Taylor

@ BRANDON_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "BRANDON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brandon1

@ DEREK
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "DEREK$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Derek

@ BRANDON_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "BRANDON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brandon2

@ BRANDON_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "BRANDON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brandon3

@ BRANDON_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "BRANDON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Brandon4

@ BRANDON_5
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_MANIAC
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_MANIAC
	.string "BRANDON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Brandon5

@ EDWARD
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "EDWARD$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Edward

@ PRESTON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "PRESTON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Preston

@ VIRGIL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "VIRGIL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Virgil

@ FRITZ
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "FRITZ$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Fritz

@ WILLIAM
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "WILLIAM$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_William

@ JOSHUA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "JOSHUA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Joshua

@ CAMERON_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "CAMERON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cameron1

@ CAMERON_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "CAMERON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cameron2

@ CAMERON_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "CAMERON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cameron3

@ CAMERON_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "CAMERON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cameron4

@ CAMERON_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_M
	.string "CAMERON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cameron5

@ JACLYN
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "JACLYN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jaclyn

@ HANNAH
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "HANNAH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Hannah

@ SAMANTHA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "SAMANTHA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Samantha

@ MAURA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "MAURA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Maura

@ KAYLA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "KAYLA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Kayla

@ ALEXIS
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "ALEXIS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Alexis

@ JACKI_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "JACKI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jacki1

@ JACKI_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "JACKI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jacki2

@ JACKI_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "JACKI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jacki3

@ JACKI_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "JACKI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jacki4

@ JACKI_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PSYCHIC
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_PSYCHIC_F
	.string "JACKI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jacki5

@ WALTER_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GENTLEMAN
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_GENTLEMAN
	.string "WALTER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Walter1

@ TUCKER
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GENTLEMAN
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_GENTLEMAN
	.string "TUCKER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Tucker

@ THOMAS
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GENTLEMAN
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_GENTLEMAN
	.string "THOMAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Thomas

@ WALTER_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_GENTLEMAN
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_GENTLEMAN
	.string "WALTER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Walter2

@ WALTER_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_GENTLEMAN
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_GENTLEMAN
	.string "WALTER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Walter3

@ WALTER_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_GENTLEMAN
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_GENTLEMAN
	.string "WALTER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Walter4

@ WALTER_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_GENTLEMAN
	.byte TRAINER_ENCOUNTER_MUSIC_RICH @ gender flag and encounter music
	.byte TRAINER_PIC_GENTLEMAN
	.string "WALTER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Walter5

@ SIDNEY
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_ELITE_FOUR
	.byte TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR @ gender flag and encounter music
	.byte TRAINER_PIC_SIDNEY
	.string "SIDNEY$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Sidney

@ PHOEBE
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_ELITE_FOUR
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR @ gender flag and encounter music
	.byte TRAINER_PIC_PHOEBE
	.string "PHOEBE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Phoebe

@ GLACIA
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_ELITE_FOUR
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR @ gender flag and encounter music
	.byte TRAINER_PIC_GLACIA
	.string "GLACIA$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Glacia

@ DRAKE
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_ELITE_FOUR
	.byte TRAINER_ENCOUNTER_MUSIC_ELITE_FOUR @ gender flag and encounter music
	.byte TRAINER_PIC_DRAKE
	.string "DRAKE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Drake

@ ROXANNE
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LEADER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_ROXANNE
	.string "ROXANNE$", 12
	.2byte ITEM_POTION, ITEM_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Roxanne

@ BRAWLY
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRAWLY
	.string "BRAWLY$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Brawly

@ WATTSON
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_WATTSON
	.string "WATTSON$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Wattson

@ FLANNERY
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LEADER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_FLANNERY
	.string "FLANNERY$", 12
	.2byte ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Flannery

@ NORMAN
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_NORMAN
	.string "NORMAN$", 12
	.2byte ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Norman

@ WINONA
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LEADER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_WINONA
	.string "WINONA$", 12
	.2byte ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Winona

@ TATE_AND_LIZA
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_TATE_AND_LIZA
	.string "TATE&LIZA$", 12
	.2byte ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_HYPER_POTION @ items
	.4byte TRUE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_TateAndLiza

@ WALLACE
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_WALLACE
	.string "WALLACE$", 12
	.2byte ITEM_HYPER_POTION, ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Wallace

@ JERRY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_M
	.string "JERRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jerry1

@ TED
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_M
	.string "TED$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Ted

@ PAUL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_M
	.string "PAUL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Paul

@ JERRY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_M
	.string "JERRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jerry2

@ JERRY_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_M
	.string "JERRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jerry3

@ JERRY_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_M
	.string "JERRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jerry4

@ JERRY_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_M
	.string "JERRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Jerry5

@ KAREN_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_F
	.string "KAREN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Karen1

@ GEORGIA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_F
	.string "GEORGIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Georgia

@ KAREN_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_F
	.string "KAREN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Karen2

@ KAREN_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_F
	.string "KAREN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Karen3

@ KAREN_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_F
	.string "KAREN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Karen4

@ KAREN_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SCHOOL_KID
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_SCHOOL_KID_F
	.string "KAREN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Karen5

@ KATE_AND_JOY
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_SR_AND_JR
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_SR_AND_JR
	.string "KATE & JOY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_KateAndJoy

@ ANNA_AND_MEG_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_SR_AND_JR
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_SR_AND_JR
	.string "ANNA & MEG$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AnnaAndMeg1

@ ANNA_AND_MEG_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_SR_AND_JR
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_SR_AND_JR
	.string "ANNA & MEG$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AnnaAndMeg2

@ ANNA_AND_MEG_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_SR_AND_JR
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_SR_AND_JR
	.string "ANNA & MEG$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AnnaAndMeg3

@ ANNA_AND_MEG_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_SR_AND_JR
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_SR_AND_JR
	.string "ANNA & MEG$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AnnaAndMeg4

@ ANNA_AND_MEG_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_SR_AND_JR
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_SR_AND_JR
	.string "ANNA & MEG$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AnnaAndMeg5

@ VICTOR
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_WINSTRATE
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_M
	.string "VICTOR$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Victor

@ MIGUEL_1
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_M
	.string "MIGUEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Miguel1

@ COLTON
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_M
	.string "COLTON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Colton

@ MIGUEL_2
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_M
	.string "MIGUEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Miguel2

@ MIGUEL_3
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_M
	.string "MIGUEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Miguel3

@ MIGUEL_4
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_M
	.string "MIGUEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Miguel4

@ MIGUEL_5
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_M
	.string "MIGUEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Miguel5

@ VICTORIA
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_WINSTRATE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_F
	.string "VICTORIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x3 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Victoria

@ VANESSA
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_F
	.string "VANESSA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Vanessa

@ MARISSA
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_F
	.string "MARISSA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Marissa

@ ISABEL_1
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_F
	.string "ISABEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Isabel1

@ ISABEL_2
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_F
	.string "ISABEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Isabel2

@ ISABEL_3
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_F
	.string "ISABEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Isabel3

@ ISABEL_4
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_F
	.string "ISABEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Isabel4

@ ISABEL_5
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_POKEFAN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_POKEFAN_F
	.string "ISABEL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Isabel5

@ TIMOTHY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_M
	.string "TIMOTHY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Timothy1

@ TIMOTHY_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_M
	.string "TIMOTHY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Timothy2

@ TIMOTHY_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_M
	.string "TIMOTHY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Timothy3

@ TIMOTHY_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_M
	.string "TIMOTHY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Timothy4

@ TIMOTHY_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_M
	.string "TIMOTHY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Timothy5

@ VICKY
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_WINSTRATE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_F
	.string "VICKY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Vicky

@ SHELBY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_F
	.string "SHELBY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Shelby1

@ SHELBY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_F
	.string "SHELBY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Shelby2

@ SHELBY_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_F
	.string "SHELBY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Shelby3

@ SHELBY_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_F
	.string "SHELBY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Shelby4

@ SHELBY_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_EXPERT
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_EXPERT_F
	.string "SHELBY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Shelby5

@ CALVIN_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "CALVIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Calvin1

@ BILLY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "BILLY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Billy

@ JOSH
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "JOSH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Josh

@ TOMMY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "TOMMY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Tommy

@ JOEY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "JOEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Joey

@ BEN
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "BEN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Ben

@ ANONYMOUS_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Anonymous5

@ KEVIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "KEVIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Kevin

@ NEAL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "NEAL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Neal

@ DILLON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "DILLON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dillon

@ CALVIN_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "CALVIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Calvin2

@ CALVIN_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "CALVIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Calvin3

@ CALVIN_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "CALVIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Calvin4

@ CALVIN_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "CALVIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Calvin5

@ EDDIE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "EDDIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Eddie

@ ALLEN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "ALLEN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Allen

@ TIMMY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNGSTER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "TIMMY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Timmy

@ STEVEN
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_CHAMPION
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_STEVEN
	.string "STEVEN$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_FULL_RESTORE, ITEM_FULL_RESTORE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Steven

@ ANDREW
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "ANDREW$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Andrew

@ IVAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "IVAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ivan

@ CLAUDE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "CLAUDE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Claude

@ ELLIOT_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "ELLIOT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Elliot1

@ NED
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "NED$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Ned

@ DALE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "DALE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Dale

@ NOLAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "NOLAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Nolan

@ BARNY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "BARNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Barny

@ WADE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "WADE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Wade

@ CARTER
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "CARTER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Carter

@ ELLIOT_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "ELLIOT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Elliot2

@ ELLIOT_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "ELLIOT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Elliot3

@ ELLIOT_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "ELLIOT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Elliot4

@ ELLIOT_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "ELLIOT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x3 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Elliot5

@ RONALD
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "RONALD$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Ronald

@ JACOB
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_M
	.string "JACOB$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Jacob

@ ANTHONY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_M
	.string "ANTHONY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Anthony

@ BENJAMIN_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_M
	.string "BENJAMIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Benjamin1

@ BENJAMIN_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_M
	.string "BENJAMIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Benjamin2

@ BENJAMIN_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_M
	.string "BENJAMIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Benjamin3

@ BENJAMIN_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_M
	.string "BENJAMIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Benjamin4

@ BENJAMIN_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_M
	.string "BENJAMIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Benjamin5

@ ABIGAIL_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_F
	.string "ABIGAIL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Abigail1

@ JASMINE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_F
	.string "JASMINE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Jasmine

@ ABIGAIL_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_F
	.string "ABIGAIL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Abigail2

@ ABIGAIL_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_F
	.string "ABIGAIL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Abigail3

@ ABIGAIL_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_F
	.string "ABIGAIL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Abigail4

@ ABIGAIL_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_CYCLING_TRIATHLETE_F
	.string "ABIGAIL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Abigail5

@ DYLAN_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_M
	.string "DYLAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dylan1

@ DYLAN_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_M
	.string "DYLAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dylan2

@ DYLAN_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_M
	.string "DYLAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dylan3

@ DYLAN_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_M
	.string "DYLAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dylan4

@ DYLAN_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_M
	.string "DYLAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dylan5

@ MARIA_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_F
	.string "MARIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Maria1

@ MARIA_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_F
	.string "MARIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Maria2

@ MARIA_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_F
	.string "MARIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Maria3

@ MARIA_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_F
	.string "MARIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Maria4

@ MARIA_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_RUNNING_TRIATHLETE_F
	.string "MARIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Maria5

@ CALEB
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "CALEB$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Caleb

@ ANONYMOUS_6
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Anonymous6

@ ISAIAH_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "ISAIAH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Isaiah1

@ ANONYMOUS_7
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Anonymous7

@ CHASE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "CHASE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Chase

@ ISAIAH_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "ISAIAH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Isaiah2

@ ISAIAH_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "ISAIAH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Isaiah3

@ ISAIAH_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "ISAIAH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Isaiah4

@ ISAIAH_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_M
	.string "ISAIAH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Isaiah5

@ ANONYMOUS_8
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Anonymous8

@ CONNOR
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "CONNOR$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Connor

@ ANONYMOUS_9
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Anonymous9

@ KATELYN_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "KATELYN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Katelyn1

@ ALLISON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "ALLISON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Allison

@ KATELYN_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "KATELYN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Katelyn2

@ KATELYN_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "KATELYN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Katelyn3

@ KATELYN_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "KATELYN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Katelyn4

@ KATELYN_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TRIATHLETE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMING_TRIATHLETE_F
	.string "KATELYN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Katelyn5

@ NICOLAS_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_DRAGON_TAMER
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_DRAGON_TAMER
	.string "NICOLAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Nicolas1

@ NICOLAS_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_DRAGON_TAMER
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_DRAGON_TAMER
	.string "NICOLAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Nicolas2

@ NICOLAS_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_DRAGON_TAMER
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_DRAGON_TAMER
	.string "NICOLAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Nicolas3

@ NICOLAS_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_DRAGON_TAMER
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_DRAGON_TAMER
	.string "NICOLAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Nicolas4

@ NICOLAS_5
	.byte F_TRAINER_PARTY_HELD_ITEM @ party type flags
	.byte TRAINER_CLASS_NAME_DRAGON_TAMER
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_DRAGON_TAMER
	.string "NICOLAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Nicolas5

@ AARON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_DRAGON_TAMER
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_DRAGON_TAMER
	.string "AARON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Aaron

@ PERRY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "PERRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Perry

@ HUGH
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "HUGH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Hugh

@ PHIL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "PHIL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Phil

@ JARED
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "JARED$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jared

@ ANONYMOUS_10
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Anonymous10

@ TANNER
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "TANNER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Tanner

@ WILL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "WILL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Will

@ COLIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "COLIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Colin

@ ROBERT_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "ROBERT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Robert1

@ BENNY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "BENNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Benny

@ CHESTER
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "CHESTER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Chester

@ ROBERT_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "ROBERT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Robert2

@ ROBERT_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "ROBERT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Robert3

@ ROBERT_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "ROBERT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Robert4

@ ROBERT_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "ROBERT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Robert5

@ ALEX
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "ALEX$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Alex

@ BECK
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "BECK$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Beck

@ YASU
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "YASU$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x3 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Yasu

@ TAKASHI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "TAKASHI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x3 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Takashi

@ MAKOTO
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "MAKOTO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Makoto

@ HIDEO_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "HIDEO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Hideo1

@ LAO_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "LAO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Lao1

@ LUNG
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "LUNG$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Lung

@ LAO_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "LAO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Lao2

@ LAO_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "LAO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Lao3

@ LAO_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "LAO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Lao4

@ LAO_5
	.byte F_TRAINER_PARTY_HELD_ITEM | F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "LAO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x0 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Lao5

@ TESSA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "TESSA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Tessa

@ LAURA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "LAURA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Laura

@ CYNDY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "CYNDY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cyndy1

@ CORA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "CORA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Cora

@ JILL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "JILL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jill

@ CYNDY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "CYNDY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cyndy2

@ CYNDY_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "CYNDY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cyndy3

@ CYNDY_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "CYNDY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cyndy4

@ CYNDY_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "CYNDY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Cyndy5

@ MADELINE_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PARASOL_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_PARASOL_LADY
	.string "MADELINE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Madeline1

@ CLARISSA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PARASOL_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_PARASOL_LADY
	.string "CLARISSA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Clarissa

@ ANGELICA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PARASOL_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_PARASOL_LADY
	.string "ANGELICA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Angelica

@ MADELINE_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PARASOL_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_PARASOL_LADY
	.string "MADELINE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Madeline2

@ MADELINE_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PARASOL_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_PARASOL_LADY
	.string "MADELINE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Madeline3

@ MADELINE_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PARASOL_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_PARASOL_LADY
	.string "MADELINE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Madeline4

@ MADELINE_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PARASOL_LADY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_PARASOL_LADY
	.string "MADELINE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Madeline5

@ BEVERLY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "BEVERLY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Beverly

@ DAWN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "DAWN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Dawn

@ NICOLE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "NICOLE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Nicole

@ DENISE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "DENISE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Denise

@ BETH
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "BETH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Beth

@ TARA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "TARA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Tara

@ MISSY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "MISSY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Missy

@ ALICE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "ALICE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Alice

@ JENNY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "JENNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jenny1

@ GRACE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "GRACE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grace

@ TANYA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "TANYA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Tanya

@ SHARON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "SHARON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Sharon

@ NIKKI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "NIKKI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Nikki

@ BRENDA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "BRENDA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Brenda

@ KATIE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "KATIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Katie

@ SUSIE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "SUSIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Susie

@ KARA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "KARA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Kara

@ DANA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "DANA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dana

@ ERIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "ERIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Erin

@ DEBRA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "DEBRA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Debra

@ LINDA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "LINDA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Linda

@ KAYLEE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "KAYLEE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Kaylee

@ LAUREL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "LAUREL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Laurel

@ DARCY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "DARCY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Darcy

@ JENNY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "JENNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jenny2

@ JENNY_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "JENNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jenny3

@ JENNY_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "JENNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jenny4

@ JENNY_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "JENNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Jenny5

@ HEIDI
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "HEIDI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Heidi

@ BECKY
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "BECKY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Becky

@ CAROL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "CAROL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Carol

@ NANCY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "NANCY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Nancy

@ MARTHA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "MARTHA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Martha

@ DIANA_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "DIANA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Diana1

@ NINA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "NINA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Nina

@ IRENE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "IRENE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Irene

@ DIANA_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "DIANA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Diana2

@ DIANA_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "DIANA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Diana3

@ DIANA_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "DIANA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Diana4

@ DIANA_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "DIANA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Diana5

@ AMY_AND_LIV_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "AMY & LIV$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AmyAndLiv1

@ AMY_AND_LIV_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "AMY & LIV$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AmyAndLiv2

@ GINA_AND_MIA_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "GINA & MIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_GinaAndMia1

@ MIU_AND_YUKI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "MIU & YUKI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_MiuAndYuki

@ AMY_AND_LIV_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "AMY & LIV$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AmyAndLiv3

@ GINA_AND_MIA_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "GINA & MIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_GinaAndMia2

@ AMY_AND_LIV_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "AMY & LIV$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AmyAndLiv4

@ AMY_AND_LIV_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "AMY & LIV$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AmyAndLiv5

@ AMY_AND_LIV_6
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "AMY & LIV$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_AmyAndLiv6

@ HUEY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "HUEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Huey

@ EDMOND
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "EDMOND$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Edmond

@ ERNEST_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "ERNEST$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ernest1

@ DWAYNE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "DWAYNE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Dwayne

@ PHILLIP
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "PHILLIP$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Phillip

@ LEONARD
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "LEONARD$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Leonard

@ DUNCAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "DUNCAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Duncan

@ ERNEST_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "ERNEST$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ernest2

@ ERNEST_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "ERNEST$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ernest3

@ ERNEST_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "ERNEST$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ernest4

@ ERNEST_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SAILOR
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_SAILOR
	.string "ERNEST$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ernest5

@ ANONYMOUS_11
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Anonymous11

@ ANONYMOUS_12
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Anonymous12

@ ANONYMOUS_13
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Anonymous13

@ SONNY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "SONNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Sonny

@ DONOVAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "DONOVAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Donovan

@ GERALD
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "GERALD$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Gerald

@ KELVIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "KELVIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Kelvin

@ KODY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "KODY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Kody

@ TEVIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "TEVIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Tevin

@ DAMON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "DAMON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Damon

@ PABLO
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BOARDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNGSTER
	.string "PABLO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Pablo

@ EDWIN_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COLLECTOR
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_COLLECTOR
	.string "EDWIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Edwin1

@ HECTOR_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COLLECTOR
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_COLLECTOR
	.string "HECTOR$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Hector1

@ HECTOR_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COLLECTOR
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_COLLECTOR
	.string "HECTOR$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Hector2

@ EDWIN_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COLLECTOR
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_COLLECTOR
	.string "EDWIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Edwin2

@ EDWIN_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COLLECTOR
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_COLLECTOR
	.string "EDWIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Edwin3

@ EDWIN_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COLLECTOR
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_COLLECTOR
	.string "EDWIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Edwin4

@ EDWIN_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COLLECTOR
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_COLLECTOR
	.string "EDWIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Edwin5

@ WALLY_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_WALLY
	.string "WALLY$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Wally1

@ BRENDAN_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Brendan1

@ BRENDAN_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brendan2

@ BRENDAN_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brendan3

@ BRENDAN_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Brendan4

@ BRENDAN_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brendan5

@ BRENDAN_6
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brendan6

@ BRENDAN_7
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Brendan7

@ BRENDAN_8
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brendan8

@ BRENDAN_9
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Brendan9

@ MAY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_May1

@ MAY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_May2

@ MAY_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_May3

@ MAY_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_May4

@ MAY_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_May5

@ MAY_6
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_May6

@ MAY_7
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_May7

@ MAY_8
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_May8

@ MAY_9
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_May9

@ ISAAC_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_M
	.string "ISAAC$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Isaac1

@ RILEY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_M
	.string "RILEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Riley

@ AIDAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_M
	.string "AIDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Aidan

@ ISAAC_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_M
	.string "ISAAC$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Isaac2

@ ISAAC_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_M
	.string "ISAAC$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Isaac3

@ ISAAC_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_M
	.string "ISAAC$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Isaac4

@ ISAAC_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_M
	.string "ISAAC$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Isaac5

@ LYDIA_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_F
	.string "LYDIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Lydia1

@ ALEXIA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_F
	.string "ALEXIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Alexia

@ DANIELLE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_F
	.string "DANIELLE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Danielle

@ LYDIA_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_F
	.string "LYDIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Lydia2

@ LYDIA_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_F
	.string "LYDIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Lydia3

@ LYDIA_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_F
	.string "LYDIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Lydia4

@ LYDIA_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_BREEDER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_BREEDER_F
	.string "LYDIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Lydia5

@ JACKSON_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_M
	.string "JACKSON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jackson1

@ CARLOS
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_M
	.string "CARLOS$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Carlos

@ SEBASTIAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_M
	.string "SEBASTIAN$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Sebastian

@ JACKSON_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_M
	.string "JACKSON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jackson2

@ JACKSON_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_M
	.string "JACKSON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jackson3

@ JACKSON_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_M
	.string "JACKSON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Jackson4

@ JACKSON_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_M
	.string "JACKSON$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Jackson5

@ CATHERINE_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_F
	.string "CATHERINE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Catherine1

@ JENNA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_F
	.string "JENNA$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Jenna

@ SOPHIA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_F
	.string "SOPHIA$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Sophia

@ CATHERINE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_F
	.string "CATHERINE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Catherine2

@ CATHERINE_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_F
	.string "CATHERINE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Catherine3

@ CATHERINE_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_F
	.string "CATHERINE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Catherine4

@ CATHERINE_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_RANGER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_POKEMON_RANGER_F
	.string "CATHERINE$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Catherine5

@ MAXIE_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAXIE
	.string "MAXIE$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Maxie1

@ GRUNT_28
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt28

@ GRUNT_29
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Grunt29

@ GRUNT_30
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt30

@ GRUNT_31
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt31

@ GRUNT_32
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt32

@ GRUNT_33
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt33

@ GRUNT_34
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grunt34

@ GRUNT_35
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt35

@ GRUNT_36
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt36

@ GRUNT_37
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt37

@ GRUNT_38
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt38

@ GRUNT_39
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt39

@ GRUNT_40
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt40

@ GRUNT_41
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt41

@ GRUNT_42
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt42

@ GRUNT_43
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt43

@ GRUNT_44
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt44

@ GRUNT_45
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grunt45

@ GRUNT_46
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt46

@ GRUNT_47
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt47

@ GRUNT_48
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt48

@ GRUNT_49
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grunt49

@ GRUNT_50
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt50

@ GRUNT_51
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_M
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Grunt51

@ GRUNT_52
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_F
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt52

@ GRUNT_53
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_F
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Grunt53

@ GRUNT_54
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TEAM_MAGMA
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_GRUNT_F
	.string "GRUNT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Grunt54

@ ANONYMOUS_14
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_ADMIN
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Anonymous14

@ ANONYMOUS_15
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_ADMIN
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_ADMIN_M
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Anonymous15

@ TABITHA_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_ADMIN
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_ADMIN_M
	.string "TABITHA$", 12
	.2byte ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Tabitha1

@ TABITHA_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_ADMIN
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_ADMIN_M
	.string "TABITHA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Tabitha2

@ ANONYMOUS_16
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_ADMIN
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_ADMIN_M
	.string "$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Anonymous16

@ COURTNEY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_ADMIN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_ADMIN_F
	.string "COURTNEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Courtney1

@ COURTNEY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_ADMIN
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAGMA_ADMIN_F
	.string "COURTNEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Courtney2

@ MAXIE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAXIE
	.string "MAXIE$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Maxie2

@ MAXIE_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_MAGMA_LEADER
	.byte TRAINER_ENCOUNTER_MUSIC_MAGMA @ gender flag and encounter music
	.byte TRAINER_PIC_MAXIE
	.string "MAXIE$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Maxie3

@ TIANA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "TIANA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Tiana

@ HALEY_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "HALEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Haley1

@ JANICE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "JANICE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Janice

@ VIVI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_WINSTRATE
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "VIVI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Vivi

@ HALEY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "HALEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Haley2

@ HALEY_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "HALEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Haley3

@ HALEY_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "HALEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Haley4

@ HALEY_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "HALEY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Haley5

@ SALLY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "SALLY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Sally

@ ROBIN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "ROBIN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Robin

@ ANDREA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "ANDREA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Andrea

@ CRISSY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_LASS
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_LASS
	.string "CRISSY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Crissy

@ RICK
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "RICK$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Rick

@ LYLE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "LYLE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 6 @ party size
	.4byte gTrainerParty_Lyle

@ JOSE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "JOSE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Jose

@ DOUG
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "DOUG$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Doug

@ GREG
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "GREG$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Greg

@ KENT
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "KENT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Kent

@ JAMES_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "JAMES$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_James1

@ JAMES_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "JAMES$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_James2

@ JAMES_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "JAMES$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_James3

@ JAMES_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "JAMES$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_James4

@ JAMES_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BUG_CATCHER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BUG_CATCHER
	.string "JAMES$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_James5

@ BRICE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "BRICE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Brice

@ TRENT_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "TRENT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Trent1

@ LENNY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "LENNY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Lenny

@ LUCAS_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "LUCAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Lucas1

@ ALAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "ALAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Alan

@ CLARK
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "CLARK$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Clark

@ ERIC
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "ERIC$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Eric

@ LUCAS_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "LUCAS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Lucas2

@ MIKE_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "MIKE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Mike1

@ MIKE_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "MIKE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Mike2

@ TRENT_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "TRENT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Trent2

@ TRENT_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "TRENT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Trent3

@ TRENT_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "TRENT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Trent4

@ TRENT_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_HIKER
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_HIKER
	.string "TRENT$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Trent5

@ DEZ_AND_LUKE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNG_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNG_COUPLE
	.string "DEZ & LUKE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_DezAndLuke

@ LEA_AND_JED
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNG_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNG_COUPLE
	.string "LEA & JED$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_LeaAndJed

@ LOIS_AND_HAL_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNG_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNG_COUPLE
	.string "LOIS & HAL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_LoisAndHal1

@ LOIS_AND_HAL_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNG_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNG_COUPLE
	.string "LOIS & HAL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_LoisAndHal2

@ LOIS_AND_HAL_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNG_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNG_COUPLE
	.string "LOIS & HAL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_LoisAndHal3

@ LOIS_AND_HAL_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNG_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNG_COUPLE
	.string "LOIS & HAL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_LoisAndHal4

@ LOIS_AND_HAL_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNG_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNG_COUPLE
	.string "LOIS & HAL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_LoisAndHal5

@ JOHANNA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BEAUTY
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_BEAUTY
	.string "JOHANNA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Johanna

@ ZANE
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "ZANE$", 12
	.2byte ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Zane

@ VIVIAN
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "VIVIAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Vivian

@ SADIE
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_BATTLE_GIRL
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BATTLE_GIRL
	.string "SADIE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Sadie

@ HIDEO_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "HIDEO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x3 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Hideo2

@ KEIGO
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "KEIGO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x3 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Keigo

@ TSUNAO
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_NINJA_BOY
	.byte TRAINER_ENCOUNTER_MUSIC_SUSPICIOUS @ gender flag and encounter music
	.byte TRAINER_PIC_NINJA_BOY
	.string "TSUNAO$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x3 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Tsunao

@ TERRELL
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_CAMPER
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_CAMPER
	.string "TERRELL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Terrell

@ KYLEE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_PICNICKER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_PICNICKER
	.string "KYLEE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Kylee

@ WALLY_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_WALLY
	.string "WALLY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 1 @ party size
	.4byte gTrainerParty_Wally2

@ WALLY_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_WALLY
	.string "WALLY$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Wally3

@ WALLY_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_WALLY
	.string "WALLY$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Wally4

@ WALLY_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_WALLY
	.string "WALLY$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Wally5

@ WALLY_6
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_WALLY
	.string "WALLY$", 12
	.2byte ITEM_SUPER_POTION, ITEM_SUPER_POTION, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 5 @ party size
	.4byte gTrainerParty_Wally6

@ BRENDAN_10
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Brendan10

@ BRENDAN_11
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Brendan11

@ BRENDAN_12
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte TRAINER_ENCOUNTER_MUSIC_MALE @ gender flag and encounter music
	.byte TRAINER_PIC_BRENDAN
	.string "BRENDAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Brendan12

@ MAY_10
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_May10

@ MAY_11
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_May11

@ MAY_12
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_POKEMON_TRAINER_3
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_FEMALE @ gender flag and encounter music
	.byte TRAINER_PIC_MAY
	.string "MAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_May12

@ JONAH
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "JONAH$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Jonah

@ HENRY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "HENRY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Henry

@ ROGER
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "ROGER$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Roger

@ ALEXA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_F
	.string "ALEXA$", 12
	.2byte ITEM_FULL_RESTORE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Alexa

@ RUBEN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_COOL_TRAINER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_COOL_TRAINER_M
	.string "RUBEN$", 12
	.2byte ITEM_HYPER_POTION, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Ruben

@ KOJI
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BLACK_BELT
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_BLACK_BELT
	.string "KOJI$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Koji

@ WAYNE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "WAYNE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Wayne

@ BYRON
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_BIRD_KEEPER
	.byte TRAINER_ENCOUNTER_MUSIC_COOL @ gender flag and encounter music
	.byte TRAINER_PIC_BIRD_KEEPER
	.string "BYRON$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_Byron

@ REED
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_M
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_M
	.string "REED$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Reed

@ TISHA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SWIMMER_F
	.byte F_TRAINER_FEMALE | TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SWIMMER_F
	.string "TISHA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 3 @ party size
	.4byte gTrainerParty_Tisha

@ TORI_AND_TIA
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_TWINS
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_TWINS
	.string "TORI & TIA$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_ToriAndTia

@ KIM_AND_IRIS
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_SR_AND_JR
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_SR_AND_JR
	.string "KIM & IRIS$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_KimAndIris

@ TYRA_AND_IVY
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_SR_AND_JR
	.byte TRAINER_ENCOUNTER_MUSIC_TWINS @ gender flag and encounter music
	.byte TRAINER_PIC_SR_AND_JR
	.string "TYRA & IVY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_TyraAndIvy

@ MEL_AND_PAUL
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_YOUNG_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_GIRL @ gender flag and encounter music
	.byte TRAINER_PIC_YOUNG_COUPLE
	.string "MEL & PAUL$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_MelAndPaul

@ JOHN_AND_JAY_1
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_OLD_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_OLD_COUPLE
	.string "JOHN & JAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_JohnAndJay1

@ JOHN_AND_JAY_2
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_OLD_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_OLD_COUPLE
	.string "JOHN & JAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_JohnAndJay2

@ JOHN_AND_JAY_3
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_OLD_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_OLD_COUPLE
	.string "JOHN & JAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_JohnAndJay3

@ JOHN_AND_JAY_4
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_OLD_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_OLD_COUPLE
	.string "JOHN & JAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0xb @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_JohnAndJay4

@ JOHN_AND_JAY_5
	.byte F_TRAINER_PARTY_CUSTOM_MOVESET @ party type flags
	.byte TRAINER_CLASS_NAME_OLD_COUPLE
	.byte TRAINER_ENCOUNTER_MUSIC_INTENSE @ gender flag and encounter music
	.byte TRAINER_PIC_OLD_COUPLE
	.string "JOHN & JAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x7 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_JohnAndJay5

@ RELI_AND_IAN
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SIS_AND_BRO
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SIS_AND_BRO
	.string "RELI & IAN$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_ReliAndIan

@ RITA_AND_SAM_1
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SIS_AND_BRO
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SIS_AND_BRO
	.string "RITA & SAM$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_RitaAndSam1

@ RITA_AND_SAM_2
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SIS_AND_BRO
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SIS_AND_BRO
	.string "RITA & SAM$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_RitaAndSam2

@ RITA_AND_SAM_3
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SIS_AND_BRO
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SIS_AND_BRO
	.string "RITA & SAM$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_RitaAndSam3

@ RITA_AND_SAM_4
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SIS_AND_BRO
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SIS_AND_BRO
	.string "RITA & SAM$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_RitaAndSam4

@ RITA_AND_SAM_5
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SIS_AND_BRO
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SIS_AND_BRO
	.string "RITA & SAM$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_RitaAndSam5

@ LISA_AND_RAY
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_SIS_AND_BRO
	.byte TRAINER_ENCOUNTER_MUSIC_SWIMMER @ gender flag and encounter music
	.byte TRAINER_PIC_SIS_AND_BRO
	.string "LISA & RAY$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte TRUE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 2 @ party size
	.4byte gTrainerParty_LisaAndRay

@ EUGENE
	.byte 0 @ party type flags
	.byte TRAINER_CLASS_NAME_FISHERMAN
	.byte TRAINER_ENCOUNTER_MUSIC_HIKER @ gender flag and encounter music
	.byte TRAINER_PIC_FISHERMAN
	.string "EUGENE$", 12
	.2byte ITEM_NONE, ITEM_NONE, ITEM_NONE, ITEM_NONE @ items
	.4byte FALSE @ is double battle
	.4byte 0x1 @ AI flags
	.4byte 4 @ party size
	.4byte gTrainerParty_Eugene
