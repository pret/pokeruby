	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ These seem to be strings for keypad test code.
gUnknown_0839B22C:: @ 839B22C
	.string " A$" @ A
	.string " B$" @ B
	.string "SL$" @ SELECT
	.string "ST$" @ START
	.string "RK$" @ right
	.string "LK$" @ left
	.string "UK$" @ up
	.string "DK$" @ down
	.string "RT$" @ R
	.string "LT$" @ L

gUnknown_0839B24A:: @ 839B24A
	.string "ND$"

gUnknown_0839B24D:: @ 839B24D
	.string "の　こどもは\n$" @ "'s child <topic-particle>"

gUnknown_0839B255:: @ 839B255
	.string " $"

gUnknown_0839B257:: @ 839B257
	.string "ながいなまえぽけもん$" @ "long name pokemon" (used as test name)

Text_39B262: @ 839B262
	.string "Search a child$"

Text_39B271: @ 839B271
	.string "Egg$"

Text_39B275: @ 839B275
	.string "Egg (male)$"

Text_39B280: @ 839B280
	.string "1000 steps$"

Text_39B28B: @ 839B28B
	.string "10000 steps$"

Text_39B297: @ 839B297
	.string "MOVE TUTOR$"

Text_39B2A2: @ 839B2A2
	.string "Breed an egg$"

Text_39B2AF: @ 839B2AF
	.string "Long name$"

Text_39B2B9: @ 839B2B9
	.string "Delete {POKEBLOCK}$"

	.align 2
gMoriDebugMenuActions:: @ 839B2C0
	.4byte Text_39B262, MoriDebugMenu_SearchChild
	.4byte Text_39B271, MoriDebugMenu_Egg
	.4byte Text_39B275, MoriDebugMenu_MaleEgg
	.4byte Text_39B280, MoriDebugMenu_1000Steps
	.4byte Text_39B28B, MoriDebugMenu_10000Steps
	.4byte Text_39B297, MoriDebugMenu_MoveTutor
	.4byte Text_39B2A2, MoriDebugMenu_BreedEgg
	.4byte Text_39B2AF, MoriDebugMenu_LongName
	.4byte Text_39B2B9, MoriDebugMenu_PokeblockCase
