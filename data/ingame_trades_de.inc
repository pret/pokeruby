	.align 2
gIngameTrades:: @ 8215AC4
	.string "MAKIT$", 11 @ nickname
	.space 1
	.2byte SPECIES_MAKUHITA @ NPC mon species
	.byte 5 @ HP IV
	.byte 5 @ attack IV
	.byte 4 @ defense IV
	.byte 4 @ speed IV
	.byte 4 @ sp. attack IV
	.byte 4 @ sp. defense IV
	.byte TRUE @ second ability
	.space 3
	.4byte 49562 @ OT ID
	.byte 5 @ cool
	.byte 5 @ beauty
	.byte 5 @ cute
	.byte 5 @ smart
	.byte 30 @ tough
	.space 3
	.4byte 0x9C40 @ personality value
	.2byte ITEM_X_ATTACK @ held item
	.byte -1 @ mail num
	.string "MAIK$", 11 @ OT name
	.byte MALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_SLAKOTH @ player mon species
	.space 2

	.string "CONEC$", 11 @ nickname
	.space 1
	.2byte SPECIES_SKITTY @ NPC mon species
	.byte 5 @ HP IV
	.byte 4 @ attack IV
	.byte 4 @ defense IV
	.byte 5 @ speed IV
	.byte 4 @ sp. attack IV
	.byte 4 @ sp. defense IV
	.byte FALSE @ second ability
	.space 3
	.4byte 2259 @ OT ID
	.byte 5 @ cool
	.byte 5 @ beauty
	.byte 30 @ cute
	.byte 5 @ smart
	.byte 5 @ tough
	.space 3
	.4byte 0x498A2E17 @ personality value
	.2byte ITEM_GLITTER_MAIL @ held item
	.byte 0 @ mail num
	.string "MADINA$", 11 @ OT name
	.byte FEMALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_PIKACHU @ player mon species
	.space 2

	.string "CORASO$", 11 @ nickname
	.space 1
	.2byte SPECIES_CORSOLA @ NPC mon species
	.byte 4 @ HP IV
	.byte 4 @ attack IV
	.byte 5 @ defense IV
	.byte 4 @ speed IV
	.byte 4 @ sp. attack IV
	.byte 5 @ sp. defense IV
	.byte TRUE @ second ability
	.space 3
	.4byte 50183 @ OT ID
	.byte 5 @ cool
	.byte 30 @ beauty
	.byte 5 @ cute
	.byte 5 @ smart
	.byte 5 @ tough
	.space 3
	.4byte 0x4C970B7F @ personality value
	.2byte ITEM_TROPIC_MAIL @ held item
	.byte 1 @ mail num
	.string "LIANA$", 11 @ OT name
	.byte FEMALE @ OT gender
	.byte 10 @ sheen
	.2byte SPECIES_BELLOSSOM @ player mon species
	.space 2

	.align 1
gIngameTradeMail:: @ 8215B78
@ 0
	ec_pokemon1 PIKACHU
	ec_word THANK_YOU
	ec_word EXCL
	ec_word MY
	ec_pokemon1 SKITTY
	ec_word EATS
	.2byte 0xFFFF
	ec_word A_LOT
	ec_word EXCL
	.2byte 0

@ 1
	ec_word I
	ec_word WANT
	ec_word OF
	ec_move2 PETAL_DANCE
	ec_word WORKS
	ec_word THE
	ec_word IS
	ec_word SO
	ec_word PRETTY
	.2byte 0
