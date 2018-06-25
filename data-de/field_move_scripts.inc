S_CuttableTree:: @ 81B0DCC
	lockall
	goto_if_unset FLAG_BADGE01_GET, CannotUseCut
	checkpartymove MOVE_CUT
	compare RESULT, 6
	goto_if_eq CannotUseCut
	setfieldeffectargument 0, RESULT
	bufferpartymonnick 0, RESULT
	buffermovename 1, MOVE_CUT
	msgbox UseCutPromptText, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Cut_ChoseNo
	msgbox UsedCutRockSmashText, 4
	closemessage
	dofieldeffect FLDEFF_USE_CUT_ON_TREE
	waitstate
	goto DoTreeCutMovement
	end

DoCutFieldEffectScript:: @ 81B0E16
	lockall
	dofieldeffect FLDEFF_USE_CUT_ON_TREE
	waitstate
	goto DoTreeCutMovement
	end

DoTreeCutMovement: @ 81B0E21
	applymovement LAST_TALKED, TreeCutMovement @ tree cut animation
	waitmovement 0
	removeobject LAST_TALKED @ tree disappears
	releaseall
	end

TreeCutMovement: @ 81B0E30
	cut_tree
	end_movement

CannotUseCut: @ 81B0E32
	msgbox CannotUseCutText, 3
	releaseall
	end

Cut_ChoseNo: @ 81B0E3C
	closemessage
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

S_BreakableRock:: @ 81B0EB7
	lockall
	goto_if_unset FLAG_BADGE03_GET, CannotUseRockSmash
	checkpartymove MOVE_ROCK_SMASH
	compare RESULT, 6
	goto_if_eq CannotUseRockSmash
	setfieldeffectargument 0, RESULT
	bufferpartymonnick 0, RESULT
	buffermovename 1, MOVE_ROCK_SMASH
	msgbox UseRockSmashPromptText, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq RockSmash_ChoseNo
	msgbox UsedCutRockSmashText, 4
	closemessage
	dofieldeffect FLDEFF_USE_ROCK_SMASH
	waitstate
	goto DoRockSmashMovement
	end

S_UseRockSmash:: @ 81B0F01
	lockall
	dofieldeffect FLDEFF_USE_ROCK_SMASH
	waitstate
	goto DoRockSmashMovement
	end

DoRockSmashMovement: @ 81B0F0C
	applymovement LAST_TALKED, RockSmashMovement
	waitmovement 0
	removeobject LAST_TALKED
	specialvar RESULT, TryUpdateRusturfTunnelState
	compare RESULT, 1
	goto_if_eq DoRockSmashMovement_Done
	special ScrSpecial_RockSmashWildEncounter
	compare RESULT, 0
	goto_if_eq DoRockSmashMovement_Done
	waitstate
	releaseall
	end

DoRockSmashMovement_Done: @ 81B0F3A
	releaseall
	end

RockSmashMovement: @ 81B0F3C
	rock_smash_break
	end_movement

CannotUseRockSmash: @ 81B0F3E
	msgbox CannotUseRockSmashText, 3
	releaseall
	end

RockSmash_ChoseNo: @ 81B0F48
	closemessage
	releaseall
	end

UseRockSmashPromptText: @ 81B0F4B
	.string "Dieser Fels sieht zerbrechlich aus.\n"
	.string "Soll ZERTRÜMMERER eingesetzt werden?$"

CannotUseRockSmashText: @ 81B0F90
	.string "Ein großer Felsen. Ein POKéMON könnte\n"
	.string "ihn vielleicht zertrümmern.$"

S_PushableBoulder:: @ 81B0FCB
	lockall
	goto_if_unset FLAG_BADGE04_GET, CannotUseStrength
	goto_if_set FLAG_SYS_USE_STRENGTH, AlreadyUsedStrength
	checkpartymove 70
	compare RESULT, 6
	goto_if_eq CannotUseStrength
	setfieldeffectargument 0, RESULT
	msgbox UseStrengthPromptText, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Strength_ChoseNo
	closemessage
	dofieldeffect FLDEFF_USE_STRENGTH
	waitstate
	goto UsedStrength
	end

S_UseStrength:: @ 81B100E
	lockall
	dofieldeffect FLDEFF_USE_STRENGTH
	waitstate
	goto UsedStrength
	end

UsedStrength: @ 81B1019
	setflag FLAG_SYS_USE_STRENGTH
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
	closemessage
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

S_UseWaterfall:: @ 81B115A
	lockall
	checkpartymove MOVE_WATERFALL
	compare RESULT, 6
	goto_if_eq Waterfall_NoMonKnows
	bufferpartymonnick 0, RESULT
	setfieldeffectargument 0, RESULT
	msgbox UseWaterfallPromptText, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Waterfall_Done
	msgbox UsedWaterfallText, 4
	dofieldeffect FLDEFF_USE_WATERFALL
	goto Waterfall_Done

S_CannotUseWaterfall:: @ 81B1194
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
	checkpartymove MOVE_DIVE
	compare RESULT, 6
	goto_if_eq CannotUseDive
	bufferpartymonnick 0, RESULT
	setfieldeffectargument 0, RESULT
	setfieldeffectargument 1, 1
	msgbox UseDivePromptText, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Dive_Done
	msgbox UsedDiveText, 4
	dofieldeffect FLDEFF_USE_DIVE
	goto Dive_Done
	lockall

CannotUseDive: @ 81B125F
	msgbox CannotUseDiveText, 4

Dive_Done: @ 81B1267
	releaseall
	end

S_UseDiveUnderwater:: @ 81B1269
	lockall
	checkpartymove MOVE_DIVE
	compare RESULT, 6
	goto_if_eq UnderwaterCannotUseDive
	bufferpartymonnick 0, RESULT
	setfieldeffectargument 0, RESULT
	setfieldeffectargument 1, 1
	msgbox UnderwaterUseDivePromptText, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq UnderwaterDive_Done
	msgbox UsedDiveText, 4
	dofieldeffect FLDEFF_USE_DIVE
	goto UnderwaterDive_Done

UnderwaterCannotUseDive: @ 81B12A7
	lockall
	msgbox UnderwaterCannotUseDiveText, 4
	goto UnderwaterDive_Done

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
