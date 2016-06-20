CuttableTreeScript:: @ 81B0DCC
	lockall
	checkflag 2055
	jumpif 0, CannotUseCut
	checkattack MOVE_CUT
	compare RESULT, 6
	jumpeq CannotUseCut
	setanimation 0, RESULT
	bufferpartypoke 0, RESULT
	bufferattack 1, MOVE_CUT
	msgbox UseCutPromptText, 5
	compare RESULT, 0
	jumpeq Cut_ChoseNo
	msgbox UsedCutRockSmashText, 4
	closebutton
	doanimation 2
	waitstate
	jump DoTreeCutMovement
	end

UseCutScript:: @ 81B0E16
	lockall
	doanimation 2
	waitstate
	jump DoTreeCutMovement
	end

DoTreeCutMovement: @ 81B0E21
	move LAST_TALKED, TreeCutMovement @ tree cut animation
	waitmove 0
	disappear LAST_TALKED @ tree disappears
	releaseall
	end

TreeCutMovement: @ 81B0E30
	step_5b
	step_end

CannotUseCut: @ 81B0E32
	msgbox CannotUseCutText, 3
	releaseall
	end

Cut_ChoseNo: @ 81B0E3C
	closebutton
	releaseall
	end

UseCutPromptText: @ 81B0E3F
	.string "This tree looks like it can be CUT down.\p"
	.string "Would you like to CUT it?$"

UsedCutRockSmashText: @ 81B0E82
	.string "{STR_VAR_1} used {STR_VAR_2}.$"

CannotUseCutText: @ 81B0E8E
	.string "This tree looks like it can be CUT down.$"

BreakableRockScript:: @ 81B0EB7
	lockall
	checkflag 2057
	jumpif 0, CannotUseRockSmash
	checkattack MOVE_ROCK_SMASH
	compare RESULT, 6
	jumpeq CannotUseRockSmash
	setanimation 0, RESULT
	bufferpartypoke 0, RESULT
	bufferattack 1, MOVE_ROCK_SMASH
	msgbox UseRockSmashPromptText, 5
	compare RESULT, 0
	jumpeq RockSmash_ChoseNo
	msgbox UsedCutRockSmashText, 4
	closebutton
	doanimation 37
	waitstate
	jump DoRockSmashMovement
	end

UseRockSmashScript:: @ 81B0F01
	lockall
	doanimation 37
	waitstate
	jump DoRockSmashMovement
	end

DoRockSmashMovement: @ 81B0F0C
	move LAST_TALKED, RockSmashMovement
	waitmove 0
	disappear LAST_TALKED
	specialval RESULT, 298
	compare RESULT, 1
	jumpeq DoRockSmashMovement_Done
	special 171
	compare RESULT, 0
	jumpeq DoRockSmashMovement_Done
	waitstate
	releaseall
	end

DoRockSmashMovement_Done: @ 81B0F3A
	releaseall
	end

RockSmashMovement: @ 81B0F3C
	step_5a
	step_end

CannotUseRockSmash: @ 81B0F3E
	msgbox CannotUseRockSmashText, 3
	releaseall
	end

RockSmash_ChoseNo: @ 81B0F48
	closebutton
	releaseall
	end

UseRockSmashPromptText: @ 81B0F4B
	.string "This rock appears to be breakable.\n"
	.string "Would you like to use ROCK SMASH?$"

CannotUseRockSmashText: @ 81B0F90
	.string "It’s a rugged rock, but a POKéMON\n"
	.string "may be able to smash it.$"

PushableBoulderScript:: @ 81B0FCB
	lockall
	checkflag 2058
	jumpif 0, CannotUseStrength
	checkflag 2089
	jumpeq AlreadyUsedStrength
	checkattack 70
	compare RESULT, 6
	jumpeq CannotUseStrength
	setanimation 0, RESULT
	msgbox UseStrengthPromptText, 5
	compare RESULT, 0
	jumpeq Strength_ChoseNo
	closebutton
	doanimation 40
	waitstate
	jump UsedStrength
	end

UseStrengthScript:: @ 81B100E
	lockall
	doanimation 0x28
	waitstate
	jump UsedStrength
	end

UsedStrength: @ 81B1019
	setflag 2089
	msgbox UsedStrengthText, 3
	releaseall
	end

CannotUseStrength: @ 81B1026
	msgbox CannotUseStrengthText, 3
	releaseall
	end

AlreadyUsedStrength: @ 81B1030
	msgbox AlreadyUsedStrengthText, 3
	releaseall
	end

Strength_ChoseNo: @ 81B103A
	closebutton
	releaseall
	end

UseStrengthPromptText: @ 81B103D
	.string "It’s a big boulder, but a POKéMON\n"
	.string "may be able to push it aside.\p"
	.string "Would you like to use STRENGTH?$"

UsedStrengthText: @ 81B109D
	.string "{STR_VAR_1} used STRENGTH.\p"
	.string "{STR_VAR_1}’s STRENGTH made it possible\n"
	.string "to move boulders around.$"

CannotUseStrengthText: @ 81B10E7
	.string "It’s a big boulder, but a POKéMON\n"
	.string "may be able to push it aside.$"

AlreadyUsedStrengthText: @ 81B1127
	.string "STRENGTH made it possible to move\n"
	.string "boulders around.$"

UseWaterfallScript:: @ 81B115A
	lockall
	checkattack MOVE_WATERFALL
	compare RESULT, 6
	jumpeq Waterfall_NoMonKnows
	bufferpartypoke 0, RESULT
	setanimation 0, RESULT
	msgbox UseWaterfallPromptText, 5
	compare RESULT, 0
	jumpeq Waterfall_Done
	msgbox UsedWaterfallText, 4
	doanimation 0x2B
	jump Waterfall_Done

CannotUseWaterfallScript:: @ 81B1194
	lockall
Waterfall_NoMonKnows: @ 81B1195
	msgbox CannotUseWaterfallText, 4
Waterfall_Done:  @ 81B119D
	releaseall
	end

CannotUseWaterfallText: @ 81B119F
	.string "A wall of water is crashing down with\n"
	.string "a mighty roar.$"

UseWaterfallPromptText: @ 81B11D4
	.string "It’s a large waterfall.\n"
	.string "Would you like to use WATERFALL?$"

UsedWaterfallText: @ 81B120D
	.string "{STR_VAR_1} used WATERFALL.$"

UseDiveScript:: @ 81B1220
	lockall
	checkattack MOVE_DIVE
	compare RESULT, 6
	jumpeq CannotUseDive
	bufferpartypoke 0, RESULT
	setanimation 0, RESULT
	setanimation 1, 1
	msgbox UseDivePromptText, 5
	compare RESULT, 0
	jumpeq Dive_Done
	msgbox UsedDiveText, 4
	doanimation 44
	jump Dive_Done
	lockall

CannotUseDive: @ 81B125F
	msgbox CannotUseDiveText, 4

Dive_Done: @ 81B1267
	releaseall
	end

UnderwaterUseDiveScript:: @ 81B1269
	lockall
	checkattack MOVE_DIVE
	compare RESULT, 6
	jumpeq UnderwaterCannotUseDive
	bufferpartypoke 0, RESULT
	setanimation 0, RESULT
	setanimation 1, 1
	msgbox UnderwaterUseDivePromptText, 5
	compare RESULT, 0
	jumpeq UnderwaterDive_Done
	msgbox UsedDiveText, 4
	doanimation 44
	jump UnderwaterDive_Done

UnderwaterCannotUseDive: @ 81B12A7
	lockall
	msgbox UnderwaterCannotUseDiveText, 4
	jump UnderwaterDive_Done

@ not used
SurfacingBlocked: @ 81B12B5
	lockall
	msgbox SurfacingBlockedText, 4

UnderwaterDive_Done: @ 81B12BE
	releaseall
	end

CannotUseDiveText: @ 81B12C0
	.string "The sea is deep here. A POKéMON may be\n"
	.string "able to go underwater here.$"

UseDivePromptText: @ 81B1303
	.string "The sea is deep here.\n"
	.string "Would you like to use DIVE?$"

UsedDiveText: @ 81B1335
	.string "{STR_VAR_1} used DIVE.$"

UnderwaterCannotUseDiveText: @ 81B1343
	.string "Light is filtering down from above.\n"
	.string "A POKéMON may be able to surface here.$"

UnderwaterUseDivePromptText: @ 81B138E
	.string "Light is filtering down from above.\n"
	.string "Would you like to use DIVE?$"

SurfacingBlockedText: @ 81B13CE
	.string "There is something in the way above.\n"
	.string "DIVE can’t be used here.$"

SweetScentNothingHereScript:: @ 81B140C
	msgbox SweetScentNothingHereText, 3
	end

SweetScentNothingHereText: @ 81B1415
	.string "There appears to be nothing here...$"
