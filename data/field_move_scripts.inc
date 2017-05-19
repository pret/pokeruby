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
	.string "Du kannst den ZERSCHNEIDER hier\n"
	.string "einsetzen!\p"
	.string "Möchtest du den ZERSCHNEIDER\n"
	.string "einsetzen?$"

UsedCutRockSmashText: @ 81B0E82
	.string "{STR_VAR_1} setzt {STR_VAR_2} ein.$"

CannotUseCutText: @ 81B0E8E
	.string "Der ZERSCHNEIDER kann hier eingesetzt\n"
	.string "werden.$"

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
	.string "Dieser Fels sieht zerbrechlich aus.\n"
	.string "Soll ZERTRÜMMERER eingesetzt werden?$"

CannotUseRockSmashText: @ 81B0F90
	.string "Ein großer Felsen. Ein POKéMON könnte\n"
	.string "ihn vielleicht zertrümmern.$"

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
	doanimation 40
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
	.string "Ein POKéMON kann diesen Felsen\n"
	.string "vielleicht bewegen.\p"
	.string "Möchtest du STÄRKE einsetzen?$"

UsedStrengthText: @ 81B109D
	.string "{STR_VAR_1} setzt STÄRKE ein.\p"
	.string "STÄRKE von {STR_VAR_1} ermöglicht es,\n"
	.string "den Felsen zu bewegen.$"

CannotUseStrengthText: @ 81B10E7
	.string "Ein POKéMON kann diesen Felsen\n"
	.string "vielleicht bewegen.$"

AlreadyUsedStrengthText: @ 81B1127
	.string "STÄRKE ermöglicht es, Felsen zu\n"
	.string "bewegen.$"

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
	doanimation 43
	jump Waterfall_Done

CannotUseWaterfallScript:: @ 81B1194
	lockall
Waterfall_NoMonKnows: @ 81B1195
	msgbox CannotUseWaterfallText, 4
Waterfall_Done:  @ 81B119D
	releaseall
	end

CannotUseWaterfallText: @ 81B119F
	.string "Das Wasser fällt steil wie eine Wand\n"
	.string "brüllend in die Tiefe.$"

UseWaterfallPromptText: @ 81B11D4
	.string "Ein riesiger Wasserfall.\n"
	.string "Möchtest du KASKADE einsetzen?$"

UsedWaterfallText: @ 81B120D
	.string "{STR_VAR_1} setzt KASKADE ein.$"

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
	.string "Das Wasser ist hier tief. Ein POKéMON\n"
	.string "könnte hier vielleicht tauchen.$"

UseDivePromptText: @ 81B1303
	.string "Das Meer ist an dieser Stelle sehr tief.\n"
	.string "Möchtest du TAUCHER einsetzen?$"

UsedDiveText: @ 81B1335
	.string "{STR_VAR_1} setzt TAUCHER ein.$"

UnderwaterCannotUseDiveText: @ 81B1343
	.string "Licht schimmert von oben herab. Ein\n"
	.string "POKéMON könnte hier auftauchen.$"

UnderwaterUseDivePromptText: @ 81B138E
	.string "Licht schimmert von oben herab.\n"
	.string "Möchtest du TAUCHER einsetzen?$"

SurfacingBlockedText: @ 81B13CE
	.string "An der Oberfläche ist irgendetwas im\n"
	.string "Weg. TAUCHER kann nicht\l"
	.string "eingesetzt werden.$"

SweetScentNothingHereScript:: @ 81B140C
	msgbox SweetScentNothingHereText, 3
	end

SweetScentNothingHereText: @ 81B1415
	.string "Hier scheint nichts zu sein...$"
