	.macro wild_mon_difference species1, species2
	.ifdef SAPPHIRE
	.equiv SPECIES_\species1\()_\species2, SPECIES_\species2
	.equiv SPECIES_\species2\()_\species1, SPECIES_\species1
	.else
	.equiv SPECIES_\species1\()_\species2, SPECIES_\species1
	.equiv SPECIES_\species2\()_\species1, SPECIES_\species2
	.endif
	.endm

	wild_mon_difference SEEDOT, LOTAD
	wild_mon_difference NUZLEAF, LOMBRE
	wild_mon_difference MAWILE, SABLEYE
	wild_mon_difference ZANGOOSE, SEVIPER
	wild_mon_difference SOLROCK, LUNATONE
	wild_mon_difference DUSKULL, SHUPPET
	wild_mon_difference DUSCLOPS, BANETTE
	wild_mon_difference KOFFING, GRIMER
	wild_mon_difference MINUN, PLUSLE
	wild_mon_difference ILLUMISE, VOLBEAT

	.align 2
PetalburgCity_WaterMons:
	wild_mon MARILL, 20, 30
	wild_mon MARILL, 10, 20
	wild_mon MARILL, 30, 35
	wild_mon MARILL, 5, 10
	wild_mon MARILL, 5, 10

	.align 2
PetalburgCity_WaterMonsInfo:
	.4byte 1 @ encounter rate
	.4byte PetalburgCity_WaterMons

	.align 2
PetalburgCity_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon CORPHISH, 10, 30
	wild_mon CORPHISH, 25, 30
	wild_mon CORPHISH, 30, 35
	wild_mon CORPHISH, 20, 25
	wild_mon CORPHISH, 35, 40
	wild_mon CORPHISH, 40, 45

	.align 2
PetalburgCity_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte PetalburgCity_FishingMons

	.align 2
SlateportCity_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
SlateportCity_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SlateportCity_WaterMons

	.align 2
SlateportCity_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
SlateportCity_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte SlateportCity_FishingMons

	.align 2
LilycoveCity_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
LilycoveCity_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte LilycoveCity_WaterMons

	.align 2
LilycoveCity_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon STARYU, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
LilycoveCity_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte LilycoveCity_FishingMons

	.align 2
MossdeepCity_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
MossdeepCity_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte MossdeepCity_WaterMons

	.align 2
MossdeepCity_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
MossdeepCity_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MossdeepCity_FishingMons

	.align 2
SootopolisCity_WaterMons:
	wild_mon MAGIKARP, 5, 35
	wild_mon MAGIKARP, 10, 30
	wild_mon MAGIKARP, 15, 25
	wild_mon MAGIKARP, 25, 30
	wild_mon MAGIKARP, 25, 30

	.align 2
SootopolisCity_WaterMonsInfo:
	.4byte 1 @ encounter rate
	.4byte SootopolisCity_WaterMons

	.align 2
SootopolisCity_FishingMons:
	wild_mon MAGIKARP, 5, 10
	.ifdef SAPPHIRE
	wild_mon TENTACOOL, 5, 10
	.else
	wild_mon MAGIKARP, 10, 15
	.endif
	wild_mon MAGIKARP, 10, 30
	wild_mon MAGIKARP, 10, 30
	wild_mon MAGIKARP, 10, 30
	wild_mon MAGIKARP, 30, 35
	wild_mon MAGIKARP, 30, 35
	wild_mon GYARADOS, 35, 40
	wild_mon GYARADOS, 35, 45
	wild_mon GYARADOS, 5, 45

	.align 2
SootopolisCity_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte SootopolisCity_FishingMons

	.align 2
EverGrandeCity_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
EverGrandeCity_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte EverGrandeCity_WaterMons

	.align 2
EverGrandeCity_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon LUVDISC, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon LUVDISC, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon CORSOLA, 30, 35
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
EverGrandeCity_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte EverGrandeCity_FishingMons

	.align 2
MeteorFalls_1F_1R_LandMons:
	wild_mon ZUBAT, 16
	wild_mon ZUBAT, 17
	wild_mon ZUBAT, 18
	wild_mon ZUBAT, 15
	wild_mon ZUBAT, 14
	wild_mon SOLROCK_LUNATONE, 16
	wild_mon SOLROCK_LUNATONE, 18
	wild_mon SOLROCK_LUNATONE, 14
	wild_mon ZUBAT, 19
	wild_mon ZUBAT, 20
	wild_mon ZUBAT, 19
	wild_mon ZUBAT, 20

	.align 2
MeteorFalls_1F_1R_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MeteorFalls_1F_1R_LandMons

	.align 2
MeteorFalls_1F_1R_WaterMons:
	wild_mon ZUBAT, 5, 35
	wild_mon ZUBAT, 30, 35
	wild_mon SOLROCK_LUNATONE, 25, 35
	wild_mon SOLROCK_LUNATONE, 15, 25
	wild_mon SOLROCK_LUNATONE, 5, 15

	.align 2
MeteorFalls_1F_1R_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte MeteorFalls_1F_1R_WaterMons

	.align 2
MeteorFalls_1F_1R_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon BARBOACH, 10, 30
	wild_mon BARBOACH, 25, 30
	wild_mon BARBOACH, 30, 35
	wild_mon BARBOACH, 20, 25
	wild_mon BARBOACH, 35, 40
	wild_mon BARBOACH, 40, 45

	.align 2
MeteorFalls_1F_1R_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte MeteorFalls_1F_1R_FishingMons

	.align 2
MeteorFalls_1F_2R_LandMons:
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon SOLROCK_LUNATONE, 35
	wild_mon SOLROCK_LUNATONE, 33
	wild_mon SOLROCK_LUNATONE, 37
	wild_mon GOLBAT, 35
	wild_mon SOLROCK_LUNATONE, 39
	wild_mon GOLBAT, 38
	wild_mon GOLBAT, 40
	wild_mon GOLBAT, 38
	wild_mon GOLBAT, 40

	.align 2
MeteorFalls_1F_2R_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MeteorFalls_1F_2R_LandMons

	.align 2
MeteorFalls_1F_2R_WaterMons:
	wild_mon GOLBAT, 30, 35
	wild_mon GOLBAT, 30, 35
	wild_mon SOLROCK_LUNATONE, 25, 35
	wild_mon SOLROCK_LUNATONE, 15, 25
	wild_mon SOLROCK_LUNATONE, 5, 15

	.align 2
MeteorFalls_1F_2R_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte MeteorFalls_1F_2R_WaterMons

	.align 2
MeteorFalls_1F_2R_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon BARBOACH, 10, 30
	wild_mon BARBOACH, 25, 30
	wild_mon BARBOACH, 30, 35
	wild_mon WHISCASH, 30, 35
	wild_mon WHISCASH, 35, 40
	wild_mon WHISCASH, 40, 45

	.align 2
MeteorFalls_1F_2R_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte MeteorFalls_1F_2R_FishingMons

	.align 2
MeteorFalls_B1F_1R_LandMons:
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon SOLROCK_LUNATONE, 35
	wild_mon SOLROCK_LUNATONE, 33
	wild_mon SOLROCK_LUNATONE, 37
	wild_mon GOLBAT, 35
	wild_mon SOLROCK_LUNATONE, 39
	wild_mon GOLBAT, 38
	wild_mon GOLBAT, 40
	wild_mon GOLBAT, 38
	wild_mon GOLBAT, 40

	.align 2
MeteorFalls_B1F_1R_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MeteorFalls_B1F_1R_LandMons

	.align 2
MeteorFalls_B1F_1R_WaterMons:
	wild_mon GOLBAT, 30, 35
	wild_mon GOLBAT, 30, 35
	wild_mon SOLROCK_LUNATONE, 25, 35
	wild_mon SOLROCK_LUNATONE, 15, 25
	wild_mon SOLROCK_LUNATONE, 5, 15

	.align 2
MeteorFalls_B1F_1R_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte MeteorFalls_B1F_1R_WaterMons

	.align 2
MeteorFalls_B1F_1R_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon BARBOACH, 10, 30
	wild_mon BARBOACH, 25, 30
	wild_mon BARBOACH, 30, 35
	wild_mon WHISCASH, 30, 35
	wild_mon WHISCASH, 35, 40
	wild_mon WHISCASH, 40, 45

	.align 2
MeteorFalls_B1F_1R_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte MeteorFalls_B1F_1R_FishingMons

	.align 2
MeteorFalls_B1F_2R_LandMons:
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 35
	wild_mon BAGON, 30
	wild_mon SOLROCK_LUNATONE, 35
	wild_mon BAGON, 35
	wild_mon SOLROCK_LUNATONE, 37
	wild_mon BAGON, 25
	wild_mon SOLROCK_LUNATONE, 39
	wild_mon GOLBAT, 38
	wild_mon GOLBAT, 40
	wild_mon GOLBAT, 38
	wild_mon GOLBAT, 40

	.align 2
MeteorFalls_B1F_2R_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MeteorFalls_B1F_2R_LandMons

	.align 2
MeteorFalls_B1F_2R_WaterMons:
	wild_mon GOLBAT, 30, 35
	wild_mon GOLBAT, 30, 35
	wild_mon SOLROCK_LUNATONE, 25, 35
	wild_mon SOLROCK_LUNATONE, 15, 25
	wild_mon SOLROCK_LUNATONE, 5, 15

	.align 2
MeteorFalls_B1F_2R_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte MeteorFalls_B1F_2R_WaterMons

	.align 2
MeteorFalls_B1F_2R_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon BARBOACH, 10, 30
	wild_mon BARBOACH, 25, 30
	wild_mon BARBOACH, 30, 35
	wild_mon WHISCASH, 30, 35
	wild_mon WHISCASH, 35, 40
	wild_mon WHISCASH, 40, 45

	.align 2
MeteorFalls_B1F_2R_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte MeteorFalls_B1F_2R_FishingMons

	.align 2
RusturfTunnel_LandMons:
	wild_mon WHISMUR, 6
	wild_mon WHISMUR, 7
	wild_mon WHISMUR, 6
	wild_mon WHISMUR, 6
	wild_mon WHISMUR, 7
	wild_mon WHISMUR, 7
	wild_mon WHISMUR, 5
	wild_mon WHISMUR, 8
	wild_mon WHISMUR, 5
	wild_mon WHISMUR, 8
	wild_mon WHISMUR, 5
	wild_mon WHISMUR, 8

	.align 2
RusturfTunnel_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte RusturfTunnel_LandMons

	.align 2
GraniteCave_1F_LandMons:
	wild_mon ZUBAT, 7
	wild_mon MAKUHITA, 8
	wild_mon MAKUHITA, 7
	wild_mon ZUBAT, 8
	wild_mon MAKUHITA, 9
	wild_mon ABRA, 8
	wild_mon MAKUHITA, 10
	wild_mon MAKUHITA, 6
	wild_mon GEODUDE, 7
	wild_mon GEODUDE, 8
	wild_mon GEODUDE, 6
	wild_mon GEODUDE, 9

	.align 2
GraniteCave_1F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte GraniteCave_1F_LandMons

	.align 2
GraniteCave_B1F_LandMons:
	wild_mon ZUBAT, 9
	wild_mon ARON, 10
	wild_mon ARON, 9
	wild_mon ARON, 11
	wild_mon ZUBAT, 10
	wild_mon ABRA, 9
	wild_mon MAKUHITA, 10
	wild_mon MAKUHITA, 11
	wild_mon MAWILE_SABLEYE, 10
	wild_mon MAWILE_SABLEYE, 10
	wild_mon MAWILE_SABLEYE, 9
	wild_mon MAWILE_SABLEYE, 11

	.align 2
GraniteCave_B1F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte GraniteCave_B1F_LandMons

	.align 2
GraniteCave_B2F_LandMons:
	wild_mon ZUBAT, 10
	wild_mon ARON, 11
	wild_mon ARON, 10
	wild_mon ZUBAT, 11
	wild_mon ARON, 12
	wild_mon ABRA, 10
	wild_mon MAWILE_SABLEYE, 10
	wild_mon MAWILE_SABLEYE, 11
	wild_mon MAWILE_SABLEYE, 12
	wild_mon MAWILE_SABLEYE, 10
	wild_mon MAWILE_SABLEYE, 12
	wild_mon MAWILE_SABLEYE, 10

	.align 2
GraniteCave_B2F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte GraniteCave_B2F_LandMons

	.align 2
GraniteCave_B2F_RockSmashMons:
	wild_mon GEODUDE, 10, 15
	wild_mon NOSEPASS, 10, 20
	wild_mon GEODUDE, 5, 10
	wild_mon GEODUDE, 15, 20
	wild_mon GEODUDE, 15, 20

	.align 2
GraniteCave_B2F_RockSmashMonsInfo:
	.4byte 20 @ encounter rate
	.4byte GraniteCave_B2F_RockSmashMons

	.align 2
GraniteCave_StevensRoom_LandMons:
	wild_mon ZUBAT, 7
	wild_mon MAKUHITA, 8
	wild_mon MAKUHITA, 7
	wild_mon ZUBAT, 8
	wild_mon MAKUHITA, 9
	wild_mon ABRA, 8
	wild_mon MAKUHITA, 10
	wild_mon MAKUHITA, 6
	wild_mon ARON, 7
	wild_mon ARON, 8
	wild_mon ARON, 7
	wild_mon ARON, 8

	.align 2
GraniteCave_StevensRoom_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte GraniteCave_StevensRoom_LandMons

	.align 2
PetalburgWoods_LandMons:
	wild_mon ZIGZAGOON, 5
	wild_mon WURMPLE, 5
	wild_mon SHROOMISH, 5
	wild_mon ZIGZAGOON, 6
	wild_mon SILCOON, 5
	wild_mon CASCOON, 5
	wild_mon WURMPLE, 6
	wild_mon SHROOMISH, 6
	wild_mon TAILLOW, 5
	wild_mon SLAKOTH, 5
	wild_mon TAILLOW, 6
	wild_mon SLAKOTH, 6

	.align 2
PetalburgWoods_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte PetalburgWoods_LandMons

	.ifdef SAPPHIRE
	.equiv JAGGED_PASS_LEVEL_DIFF, 2
	.else
	.equiv JAGGED_PASS_LEVEL_DIFF, 0
	.endif

	.align 2
JaggedPass_LandMons:
	wild_mon NUMEL, 19 + JAGGED_PASS_LEVEL_DIFF
	wild_mon NUMEL, 19 + JAGGED_PASS_LEVEL_DIFF
	wild_mon MACHOP, 19 + JAGGED_PASS_LEVEL_DIFF
	wild_mon NUMEL, 18 + JAGGED_PASS_LEVEL_DIFF
	wild_mon SPOINK, 18 + JAGGED_PASS_LEVEL_DIFF
	wild_mon MACHOP, 18 + JAGGED_PASS_LEVEL_DIFF
	wild_mon SPOINK, 19 + JAGGED_PASS_LEVEL_DIFF
	wild_mon MACHOP, 20 + JAGGED_PASS_LEVEL_DIFF
	wild_mon NUMEL, 20 + JAGGED_PASS_LEVEL_DIFF
	wild_mon SPOINK, 20 + JAGGED_PASS_LEVEL_DIFF
	wild_mon NUMEL, 20 + JAGGED_PASS_LEVEL_DIFF
	wild_mon SPOINK, 20 + JAGGED_PASS_LEVEL_DIFF

	.align 2
JaggedPass_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte JaggedPass_LandMons

	.align 2
FieryPath_LandMons:
	wild_mon NUMEL, 15
	wild_mon KOFFING_GRIMER, 15
	wild_mon NUMEL, 16
	wild_mon MACHOP, 15
	wild_mon TORKOAL, 15
	wild_mon SLUGMA, 15
	wild_mon KOFFING_GRIMER, 16
	wild_mon MACHOP, 16
	wild_mon TORKOAL, 14
	wild_mon TORKOAL, 16
	wild_mon GRIMER_KOFFING, 14
	wild_mon GRIMER_KOFFING, 14

	.align 2
FieryPath_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte FieryPath_LandMons

	.align 2
MtPyre_1F_LandMons:
	wild_mon DUSKULL_SHUPPET, 27
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon DUSKULL_SHUPPET, 25
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 23
	wild_mon DUSKULL_SHUPPET, 22
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24

	.align 2
MtPyre_1F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MtPyre_1F_LandMons

	.align 2
MtPyre_2F_LandMons:
	wild_mon DUSKULL_SHUPPET, 27
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon DUSKULL_SHUPPET, 25
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 23
	wild_mon DUSKULL_SHUPPET, 22
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24

	.align 2
MtPyre_2F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MtPyre_2F_LandMons

	.align 2
MtPyre_3F_LandMons:
	wild_mon DUSKULL_SHUPPET, 27
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon DUSKULL_SHUPPET, 25
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 23
	wild_mon DUSKULL_SHUPPET, 22
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24

	.align 2
MtPyre_3F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MtPyre_3F_LandMons

	.align 2
MtPyre_4F_LandMons:
	wild_mon DUSKULL_SHUPPET, 27
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon DUSKULL_SHUPPET, 25
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 23
	wild_mon DUSKULL_SHUPPET, 22
	wild_mon SHUPPET_DUSKULL, 27
	wild_mon SHUPPET_DUSKULL, 27
	wild_mon SHUPPET_DUSKULL, 25
	wild_mon SHUPPET_DUSKULL, 29

	.align 2
MtPyre_4F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MtPyre_4F_LandMons

	.align 2
MtPyre_5F_LandMons:
	wild_mon DUSKULL_SHUPPET, 27
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon DUSKULL_SHUPPET, 25
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 23
	wild_mon DUSKULL_SHUPPET, 22
	wild_mon SHUPPET_DUSKULL, 27
	wild_mon SHUPPET_DUSKULL, 27
	wild_mon SHUPPET_DUSKULL, 25
	wild_mon SHUPPET_DUSKULL, 29

	.align 2
MtPyre_5F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MtPyre_5F_LandMons

	.align 2
MtPyre_6F_LandMons:
	wild_mon DUSKULL_SHUPPET, 27
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon DUSKULL_SHUPPET, 25
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon DUSKULL_SHUPPET, 23
	wild_mon DUSKULL_SHUPPET, 22
	wild_mon SHUPPET_DUSKULL, 27
	wild_mon SHUPPET_DUSKULL, 27
	wild_mon SHUPPET_DUSKULL, 25
	wild_mon SHUPPET_DUSKULL, 29

	.align 2
MtPyre_6F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MtPyre_6F_LandMons

	.align 2
MtPyre_Exterior_LandMons:
	wild_mon DUSKULL_SHUPPET, 27
	wild_mon MEDITITE, 27
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon MEDITITE, 29
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon VULPIX, 27
	wild_mon VULPIX, 29
	wild_mon VULPIX, 25
	wild_mon WINGULL, 27
	wild_mon WINGULL, 27
	wild_mon WINGULL, 26
	wild_mon WINGULL, 28

	.align 2
MtPyre_Exterior_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MtPyre_Exterior_LandMons

	.align 2
MtPyre_Summit_LandMons:
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon DUSKULL_SHUPPET, 29
	wild_mon DUSKULL_SHUPPET, 27
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon DUSKULL_SHUPPET, 30
	wild_mon DUSKULL_SHUPPET, 25
	wild_mon DUSKULL_SHUPPET, 24
	wild_mon SHUPPET_DUSKULL, 28
	wild_mon SHUPPET_DUSKULL, 26
	wild_mon SHUPPET_DUSKULL, 30
	wild_mon CHIMECHO, 28
	wild_mon CHIMECHO, 28

	.align 2
MtPyre_Summit_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte MtPyre_Summit_LandMons

	.align 2
SeafloorCavern_Entrance_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon ZUBAT, 5, 35
	wild_mon ZUBAT, 30, 35
	wild_mon GOLBAT, 30, 35
	wild_mon GOLBAT, 30, 35

	.align 2
SeafloorCavern_Entrance_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Entrance_WaterMons

	.align 2
SeafloorCavern_Entrance_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
SeafloorCavern_Entrance_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte SeafloorCavern_Entrance_FishingMons

	.align 2
SeafloorCavern_Room1_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
SeafloorCavern_Room1_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room1_LandMons

	.align 2
SeafloorCavern_Room2_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
SeafloorCavern_Room2_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room2_LandMons

	.align 2
SeafloorCavern_Room3_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
SeafloorCavern_Room3_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room3_LandMons

	.align 2
SeafloorCavern_Room4_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
SeafloorCavern_Room4_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room4_LandMons

	.align 2
SeafloorCavern_Room5_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
SeafloorCavern_Room5_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room5_LandMons

	.align 2
SeafloorCavern_Room6_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
SeafloorCavern_Room6_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room6_LandMons

	.align 2
SeafloorCavern_Room6_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon ZUBAT, 5, 35
	wild_mon ZUBAT, 30, 35
	wild_mon GOLBAT, 30, 35
	wild_mon GOLBAT, 30, 35

	.align 2
SeafloorCavern_Room6_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room6_WaterMons

	.align 2
SeafloorCavern_Room6_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
SeafloorCavern_Room6_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte SeafloorCavern_Room6_FishingMons

	.align 2
SeafloorCavern_Room7_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
SeafloorCavern_Room7_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room7_LandMons

	.align 2
SeafloorCavern_Room7_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon ZUBAT, 5, 35
	wild_mon ZUBAT, 30, 35
	wild_mon GOLBAT, 30, 35
	wild_mon GOLBAT, 30, 35

	.align 2
SeafloorCavern_Room7_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room7_WaterMons

	.align 2
SeafloorCavern_Room7_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
SeafloorCavern_Room7_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte SeafloorCavern_Room7_FishingMons

	.align 2
SeafloorCavern_Room8_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
SeafloorCavern_Room8_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte SeafloorCavern_Room8_LandMons

	.align 2
CaveOfOrigin_Entrance_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 28
	wild_mon ZUBAT, 29
	wild_mon ZUBAT, 34
	wild_mon ZUBAT, 35
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
CaveOfOrigin_Entrance_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte CaveOfOrigin_Entrance_LandMons

	.align 2
CaveOfOrigin_1F_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon MAWILE_SABLEYE, 30
	wild_mon MAWILE_SABLEYE, 32
	wild_mon MAWILE_SABLEYE, 34
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 34
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
CaveOfOrigin_1F_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte CaveOfOrigin_1F_LandMons

	.align 2
CaveOfOrigin_B1F_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon MAWILE_SABLEYE, 30
	wild_mon MAWILE_SABLEYE, 32
	wild_mon MAWILE_SABLEYE, 34
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 34
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
CaveOfOrigin_B1F_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte CaveOfOrigin_B1F_LandMons

	.align 2
CaveOfOrigin_B2F_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon MAWILE_SABLEYE, 30
	wild_mon MAWILE_SABLEYE, 32
	wild_mon MAWILE_SABLEYE, 34
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 34
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
CaveOfOrigin_B2F_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte CaveOfOrigin_B2F_LandMons

	.align 2
CaveOfOrigin_B3F_LandMons:
	wild_mon ZUBAT, 30
	wild_mon ZUBAT, 31
	wild_mon ZUBAT, 32
	wild_mon MAWILE_SABLEYE, 30
	wild_mon MAWILE_SABLEYE, 32
	wild_mon MAWILE_SABLEYE, 34
	wild_mon ZUBAT, 33
	wild_mon ZUBAT, 34
	wild_mon GOLBAT, 34
	wild_mon GOLBAT, 35
	wild_mon GOLBAT, 33
	wild_mon GOLBAT, 36

	.align 2
CaveOfOrigin_B3F_LandMonsInfo:
	.4byte 4 @ encounter rate
	.4byte CaveOfOrigin_B3F_LandMons

	.align 2
VictoryRoad_1F_LandMons:
	wild_mon GOLBAT, 40
	wild_mon HARIYAMA, 40
	wild_mon LAIRON, 40
	wild_mon LOUDRED, 40
	wild_mon ZUBAT, 36
	wild_mon MAKUHITA, 36
	wild_mon GOLBAT, 38
	wild_mon HARIYAMA, 38
	wild_mon ARON, 36
	wild_mon WHISMUR, 36
	wild_mon ARON, 36
	wild_mon WHISMUR, 36

	.align 2
VictoryRoad_1F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte VictoryRoad_1F_LandMons

	.align 2
VictoryRoad_B1F_LandMons:
	wild_mon GOLBAT, 40
	wild_mon HARIYAMA, 40
	wild_mon LAIRON, 40
	wild_mon MEDICHAM, 40
	wild_mon GOLBAT, 38
	wild_mon HARIYAMA, 38
	wild_mon GOLBAT, 42
	wild_mon HARIYAMA, 42
	wild_mon LAIRON, 42
	wild_mon MEDITITE, 38
	wild_mon LAIRON, 42
	wild_mon MEDITITE, 38

	.align 2
VictoryRoad_B1F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte VictoryRoad_B1F_LandMons

	.align 2
VictoryRoad_B1F_RockSmashMons:
	wild_mon GRAVELER, 30, 40
	wild_mon GEODUDE, 30, 40
	wild_mon GRAVELER, 35, 40
	wild_mon GRAVELER, 35, 40
	wild_mon GRAVELER, 35, 40

	.align 2
VictoryRoad_B1F_RockSmashMonsInfo:
	.4byte 20 @ encounter rate
	.4byte VictoryRoad_B1F_RockSmashMons

	.align 2
VictoryRoad_B2F_LandMons:
	wild_mon GOLBAT, 40
	wild_mon MAWILE_SABLEYE, 40
	wild_mon LAIRON, 40
	wild_mon MEDICHAM, 40
	wild_mon GOLBAT, 42
	wild_mon MAWILE_SABLEYE, 42
	wild_mon GOLBAT, 44
	wild_mon MAWILE_SABLEYE, 44
	wild_mon LAIRON, 42
	wild_mon MEDICHAM, 42
	wild_mon LAIRON, 44
	wild_mon MEDICHAM, 44

	.align 2
VictoryRoad_B2F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte VictoryRoad_B2F_LandMons

	.align 2
VictoryRoad_B2F_WaterMons:
	wild_mon GOLBAT, 30, 35
	wild_mon GOLBAT, 25, 30
	wild_mon GOLBAT, 35, 40
	wild_mon GOLBAT, 35, 40
	wild_mon GOLBAT, 35, 40

	.align 2
VictoryRoad_B2F_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte VictoryRoad_B2F_WaterMons

	.align 2
VictoryRoad_B2F_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon BARBOACH, 10, 30
	wild_mon BARBOACH, 25, 30
	wild_mon BARBOACH, 30, 35
	wild_mon WHISCASH, 30, 35
	wild_mon WHISCASH, 35, 40
	wild_mon WHISCASH, 40, 45

	.align 2
VictoryRoad_B2F_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte VictoryRoad_B2F_FishingMons

	.align 2
ShoalCave_LowTideEntranceRoom_LandMons:
	wild_mon ZUBAT, 26
	wild_mon SPHEAL, 26
	wild_mon ZUBAT, 28
	wild_mon SPHEAL, 28
	wild_mon ZUBAT, 30
	wild_mon SPHEAL, 30
	wild_mon ZUBAT, 32
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 32
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 32
	wild_mon SPHEAL, 32

	.align 2
ShoalCave_LowTideEntranceRoom_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte ShoalCave_LowTideEntranceRoom_LandMons

	.align 2
ShoalCave_LowTideEntranceRoom_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon ZUBAT, 5, 35
	wild_mon SPHEAL, 25, 30
	wild_mon SPHEAL, 25, 30
	wild_mon SPHEAL, 25, 35

	.align 2
ShoalCave_LowTideEntranceRoom_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte ShoalCave_LowTideEntranceRoom_WaterMons

	.align 2
ShoalCave_LowTideEntranceRoom_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
ShoalCave_LowTideEntranceRoom_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte ShoalCave_LowTideEntranceRoom_FishingMons

	.align 2
ShoalCave_LowTideInnerRoom_LandMons:
	wild_mon ZUBAT, 26
	wild_mon SPHEAL, 26
	wild_mon ZUBAT, 28
	wild_mon SPHEAL, 28
	wild_mon ZUBAT, 30
	wild_mon SPHEAL, 30
	wild_mon ZUBAT, 32
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 32
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 32
	wild_mon SPHEAL, 32

	.align 2
ShoalCave_LowTideInnerRoom_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte ShoalCave_LowTideInnerRoom_LandMons

	.align 2
ShoalCave_LowTideInnerRoom_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon ZUBAT, 5, 35
	wild_mon SPHEAL, 25, 30
	wild_mon SPHEAL, 25, 30
	wild_mon SPHEAL, 25, 35

	.align 2
ShoalCave_LowTideInnerRoom_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte ShoalCave_LowTideInnerRoom_WaterMons

	.align 2
ShoalCave_LowTideInnerRoom_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
ShoalCave_LowTideInnerRoom_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte ShoalCave_LowTideInnerRoom_FishingMons

	.align 2
ShoalCave_LowTideStairsRoom_LandMons:
	wild_mon ZUBAT, 26
	wild_mon SPHEAL, 26
	wild_mon ZUBAT, 28
	wild_mon SPHEAL, 28
	wild_mon ZUBAT, 30
	wild_mon SPHEAL, 30
	wild_mon ZUBAT, 32
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 32
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 32
	wild_mon SPHEAL, 32

	.align 2
ShoalCave_LowTideStairsRoom_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte ShoalCave_LowTideStairsRoom_LandMons

	.align 2
ShoalCave_LowTideLowerRoom_LandMons:
	wild_mon ZUBAT, 26
	wild_mon SPHEAL, 26
	wild_mon ZUBAT, 28
	wild_mon SPHEAL, 28
	wild_mon ZUBAT, 30
	wild_mon SPHEAL, 30
	wild_mon ZUBAT, 32
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 32
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 32
	wild_mon SPHEAL, 32

	.align 2
ShoalCave_LowTideLowerRoom_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte ShoalCave_LowTideLowerRoom_LandMons

	.align 2
ShoalCave_LowTideIceRoom_LandMons:
	wild_mon ZUBAT, 26
	wild_mon SPHEAL, 26
	wild_mon ZUBAT, 28
	wild_mon SPHEAL, 28
	wild_mon ZUBAT, 30
	wild_mon SPHEAL, 30
	wild_mon SNORUNT, 26
	wild_mon SPHEAL, 32
	wild_mon GOLBAT, 30
	wild_mon SNORUNT, 28
	wild_mon GOLBAT, 32
	wild_mon SNORUNT, 30

	.align 2
ShoalCave_LowTideIceRoom_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte ShoalCave_LowTideIceRoom_LandMons

	.align 2
NewMauville_Entrance_LandMons:
	wild_mon VOLTORB, 24
	wild_mon MAGNEMITE, 24
	wild_mon VOLTORB, 25
	wild_mon MAGNEMITE, 25
	wild_mon VOLTORB, 23
	wild_mon MAGNEMITE, 23
	wild_mon VOLTORB, 26
	wild_mon MAGNEMITE, 26
	wild_mon VOLTORB, 22
	wild_mon MAGNEMITE, 22
	wild_mon VOLTORB, 22
	wild_mon MAGNEMITE, 22

	.align 2
NewMauville_Entrance_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte NewMauville_Entrance_LandMons

	.align 2
NewMauville_Inside_LandMons:
	wild_mon VOLTORB, 24
	wild_mon MAGNEMITE, 24
	wild_mon VOLTORB, 25
	wild_mon MAGNEMITE, 25
	wild_mon VOLTORB, 23
	wild_mon MAGNEMITE, 23
	wild_mon VOLTORB, 26
	wild_mon MAGNEMITE, 26
	wild_mon VOLTORB, 22
	wild_mon MAGNEMITE, 22
	wild_mon ELECTRODE, 26
	wild_mon MAGNETON, 26

	.align 2
NewMauville_Inside_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte NewMauville_Inside_LandMons

	.align 2
AbandonedShip_Rooms_B1F_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon TENTACOOL, 5, 35
	wild_mon TENTACOOL, 5, 35
	wild_mon TENTACOOL, 5, 35
	wild_mon TENTACRUEL, 30, 35

	.align 2
AbandonedShip_Rooms_B1F_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte AbandonedShip_Rooms_B1F_WaterMons

	.align 2
AbandonedShip_Rooms_B1F_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon TENTACOOL, 25, 30
	wild_mon TENTACOOL, 30, 35
	wild_mon TENTACRUEL, 30, 35
	wild_mon TENTACRUEL, 25, 30
	wild_mon TENTACRUEL, 20, 25

	.align 2
AbandonedShip_Rooms_B1F_FishingMonsInfo:
	.4byte 20 @ encounter rate
	.4byte AbandonedShip_Rooms_B1F_FishingMons

	.align 2
AbandonedShip_HiddenFloorCorridors_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon TENTACOOL, 5, 35
	wild_mon TENTACOOL, 5, 35
	wild_mon TENTACOOL, 5, 35
	wild_mon TENTACRUEL, 30, 35

	.align 2
AbandonedShip_HiddenFloorCorridors_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte AbandonedShip_HiddenFloorCorridors_WaterMons

	.align 2
AbandonedShip_HiddenFloorCorridors_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon TENTACOOL, 25, 30
	wild_mon TENTACOOL, 30, 35
	wild_mon TENTACRUEL, 30, 35
	wild_mon TENTACRUEL, 25, 30
	wild_mon TENTACRUEL, 20, 25

	.align 2
AbandonedShip_HiddenFloorCorridors_FishingMonsInfo:
	.4byte 20 @ encounter rate
	.4byte AbandonedShip_HiddenFloorCorridors_FishingMons

	.align 2
SkyPillar_1F_LandMons:
	wild_mon MAWILE_SABLEYE, 48
	wild_mon GOLBAT, 48
	wild_mon GOLBAT, 50
	wild_mon MAWILE_SABLEYE, 50
	wild_mon CLAYDOL, 48
	wild_mon DUSCLOPS_BANETTE, 48
	wild_mon DUSCLOPS_BANETTE, 50
	wild_mon CLAYDOL, 49
	wild_mon CLAYDOL, 47
	wild_mon CLAYDOL, 50
	wild_mon CLAYDOL, 47
	wild_mon CLAYDOL, 50

	.align 2
SkyPillar_1F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte SkyPillar_1F_LandMons

	.align 2
SkyPillar_3F_LandMons:
	wild_mon MAWILE_SABLEYE, 51
	wild_mon GOLBAT, 51
	wild_mon GOLBAT, 53
	wild_mon MAWILE_SABLEYE, 53
	wild_mon CLAYDOL, 51
	wild_mon DUSCLOPS_BANETTE, 51
	wild_mon DUSCLOPS_BANETTE, 53
	wild_mon CLAYDOL, 52
	wild_mon CLAYDOL, 50
	wild_mon CLAYDOL, 53
	wild_mon CLAYDOL, 50
	wild_mon CLAYDOL, 53

	.align 2
SkyPillar_3F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte SkyPillar_3F_LandMons

	.align 2
SkyPillar_5F_LandMons:
	wild_mon MAWILE_SABLEYE, 54
	wild_mon GOLBAT, 54
	wild_mon GOLBAT, 56
	wild_mon MAWILE_SABLEYE, 56
	wild_mon CLAYDOL, 54
	wild_mon DUSCLOPS_BANETTE, 54
	wild_mon DUSCLOPS_BANETTE, 56
	wild_mon CLAYDOL, 55
	wild_mon CLAYDOL, 56
	wild_mon ALTARIA, 57
	wild_mon ALTARIA, 54
	wild_mon ALTARIA, 60

	.align 2
SkyPillar_5F_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte SkyPillar_5F_LandMons

	.align 2
Route101_LandMons:
	wild_mon WURMPLE, 2
	wild_mon ZIGZAGOON, 2
	wild_mon WURMPLE, 2
	wild_mon WURMPLE, 3
	wild_mon ZIGZAGOON, 3
	wild_mon ZIGZAGOON, 3
	wild_mon WURMPLE, 3
	wild_mon ZIGZAGOON, 3
	wild_mon POOCHYENA, 2
	wild_mon POOCHYENA, 2
	wild_mon POOCHYENA, 3
	wild_mon POOCHYENA, 3

	.align 2
Route101_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route101_LandMons

	.align 2
Route102_LandMons:
	wild_mon ZIGZAGOON, 3
	wild_mon WURMPLE, 3
	wild_mon ZIGZAGOON, 4
	wild_mon WURMPLE, 4
	wild_mon SEEDOT_LOTAD, 3
	wild_mon SEEDOT_LOTAD, 4
	wild_mon POOCHYENA, 3
	wild_mon POOCHYENA, 3
	wild_mon POOCHYENA, 4
	wild_mon RALTS, 4
	wild_mon POOCHYENA, 4
	wild_mon SURSKIT, 3

	.align 2
Route102_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route102_LandMons

	.align 2
Route102_WaterMons:
	wild_mon MARILL, 20, 30
	wild_mon MARILL, 10, 20
	wild_mon MARILL, 30, 35
	wild_mon MARILL, 5, 10
	wild_mon SURSKIT, 20, 30

	.align 2
Route102_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route102_WaterMons

	.align 2
Route102_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon CORPHISH, 10, 30
	wild_mon CORPHISH, 25, 30
	wild_mon CORPHISH, 30, 35
	wild_mon CORPHISH, 20, 25
	wild_mon CORPHISH, 35, 40
	wild_mon CORPHISH, 40, 45

	.align 2
Route102_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route102_FishingMons

	.align 2
Route103_LandMons:
	wild_mon ZIGZAGOON, 2
	wild_mon ZIGZAGOON, 3
	wild_mon ZIGZAGOON, 3
	wild_mon ZIGZAGOON, 4
	wild_mon POOCHYENA, 2
	wild_mon POOCHYENA, 3
	wild_mon POOCHYENA, 3
	wild_mon POOCHYENA, 4
	wild_mon WINGULL, 3
	wild_mon WINGULL, 3
	wild_mon WINGULL, 2
	wild_mon WINGULL, 4

	.align 2
Route103_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route103_LandMons

	.align 2
Route103_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route103_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route103_WaterMons

	.align 2
Route103_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route103_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route103_FishingMons

	.align 2
Route104_LandMons:
	wild_mon ZIGZAGOON, 4
	wild_mon WURMPLE, 4
	wild_mon ZIGZAGOON, 5
	wild_mon WURMPLE, 5
	wild_mon ZIGZAGOON, 4
	wild_mon ZIGZAGOON, 5
	wild_mon TAILLOW, 4
	wild_mon TAILLOW, 5
	wild_mon WINGULL, 4
	wild_mon WINGULL, 4
	wild_mon WINGULL, 3
	wild_mon WINGULL, 5

	.align 2
Route104_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route104_LandMons

	.align 2
Route104_WaterMons:
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route104_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route104_WaterMons

	.align 2
Route104_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon MAGIKARP, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon MAGIKARP, 10, 30
	wild_mon MAGIKARP, 10, 30
	wild_mon MAGIKARP, 25, 30
	wild_mon MAGIKARP, 30, 35
	wild_mon MAGIKARP, 20, 25
	wild_mon MAGIKARP, 35, 40
	wild_mon MAGIKARP, 40, 45

	.align 2
Route104_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route104_FishingMons

	.align 2
Route105_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route105_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route105_WaterMons

	.align 2
Route105_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route105_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route105_FishingMons

	.align 2
Route106_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route106_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route106_WaterMons

	.align 2
Route106_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route106_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route106_FishingMons

	.align 2
Route107_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route107_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route107_WaterMons

	.align 2
Route107_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route107_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route107_FishingMons

	.align 2
Route108_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route108_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route108_WaterMons

	.align 2
Route108_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route108_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route108_FishingMons

	.align 2
Route109_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route109_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route109_WaterMons

	.align 2
Route109_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route109_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route109_FishingMons

	.align 2
Route110_LandMons:
	wild_mon ZIGZAGOON, 12
	wild_mon ELECTRIKE, 12
	wild_mon GULPIN, 12
	wild_mon ELECTRIKE, 13
	wild_mon MINUN_PLUSLE, 13
	wild_mon ODDISH, 13
	wild_mon MINUN_PLUSLE, 13
	wild_mon GULPIN, 13
	wild_mon WINGULL, 12
	wild_mon WINGULL, 12
	wild_mon PLUSLE_MINUN, 12
	wild_mon PLUSLE_MINUN, 13

	.align 2
Route110_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route110_LandMons

	.align 2
Route110_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route110_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route110_WaterMons

	.align 2
Route110_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route110_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route110_FishingMons

	.align 2
Route111_LandMons:
	wild_mon SANDSHREW, 20
	wild_mon TRAPINCH, 20
	wild_mon SANDSHREW, 21
	wild_mon TRAPINCH, 21
	wild_mon CACNEA, 19
	wild_mon CACNEA, 21
	wild_mon SANDSHREW, 19
	wild_mon TRAPINCH, 19
	wild_mon BALTOY, 20
	wild_mon BALTOY, 20
	wild_mon BALTOY, 22
	wild_mon BALTOY, 22

	.align 2
Route111_LandMonsInfo:
	.4byte 10 @ encounter rate
	.4byte Route111_LandMons

	.align 2
Route111_WaterMons:
	wild_mon MARILL, 20, 30
	wild_mon MARILL, 10, 20
	wild_mon MARILL, 30, 35
	wild_mon MARILL, 5, 10
	wild_mon SURSKIT, 20, 30

	.align 2
Route111_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route111_WaterMons

	.align 2
Route111_RockSmashMons:
	wild_mon GEODUDE, 10, 15
	wild_mon GEODUDE, 5, 10
	wild_mon GEODUDE, 15, 20
	wild_mon GEODUDE, 15, 20
	wild_mon GEODUDE, 15, 20

	.align 2
Route111_RockSmashMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route111_RockSmashMons

	.align 2
Route111_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon BARBOACH, 10, 30
	wild_mon BARBOACH, 25, 30
	wild_mon BARBOACH, 30, 35
	wild_mon BARBOACH, 20, 25
	wild_mon BARBOACH, 35, 40
	wild_mon BARBOACH, 40, 45

	.align 2
Route111_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route111_FishingMons

	.align 2
Route112_LandMons:
	wild_mon NUMEL, 15
	wild_mon NUMEL, 15
	wild_mon MACHOP, 15
	wild_mon NUMEL, 14
	wild_mon NUMEL, 14
	wild_mon MACHOP, 14
	wild_mon NUMEL, 16
	wild_mon MACHOP, 16
	wild_mon NUMEL, 16
	wild_mon NUMEL, 16
	wild_mon NUMEL, 16
	wild_mon NUMEL, 16

	.align 2
Route112_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route112_LandMons

	.align 2
Route113_LandMons:
	wild_mon SPINDA, 15
	wild_mon SPINDA, 15
	wild_mon SANDSHREW, 15
	wild_mon SPINDA, 14
	wild_mon SPINDA, 14
	wild_mon SANDSHREW, 14
	wild_mon SPINDA, 16
	wild_mon SANDSHREW, 16
	wild_mon SPINDA, 16
	wild_mon SKARMORY, 16
	wild_mon SPINDA, 16
	wild_mon SKARMORY, 16

	.align 2
Route113_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route113_LandMons

	.align 2
Route114_LandMons:
	wild_mon SWABLU, 16
	wild_mon SEEDOT_LOTAD, 16
	wild_mon SWABLU, 17
	wild_mon SWABLU, 15
	wild_mon SEEDOT_LOTAD, 15
	wild_mon ZANGOOSE_SEVIPER, 16
	wild_mon NUZLEAF_LOMBRE, 16
	wild_mon NUZLEAF_LOMBRE, 18
	wild_mon ZANGOOSE_SEVIPER, 17
	wild_mon ZANGOOSE_SEVIPER, 15
	wild_mon ZANGOOSE_SEVIPER, 17
	wild_mon SURSKIT, 15

	.align 2
Route114_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route114_LandMons

	.align 2
Route114_WaterMons:
	wild_mon MARILL, 20, 30
	wild_mon MARILL, 10, 20
	wild_mon MARILL, 30, 35
	wild_mon MARILL, 5, 10
	wild_mon SURSKIT, 20, 30

	.align 2
Route114_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route114_WaterMons

	.align 2
Route114_RockSmashMons:
	wild_mon GEODUDE, 10, 15
	wild_mon GEODUDE, 5, 10
	wild_mon GEODUDE, 15, 20
	wild_mon GEODUDE, 15, 20
	wild_mon GEODUDE, 15, 20

	.align 2
Route114_RockSmashMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route114_RockSmashMons

	.align 2
Route114_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon BARBOACH, 10, 30
	wild_mon BARBOACH, 25, 30
	wild_mon BARBOACH, 30, 35
	wild_mon BARBOACH, 20, 25
	wild_mon BARBOACH, 35, 40
	wild_mon BARBOACH, 40, 45

	.align 2
Route114_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route114_FishingMons

	.align 2
Route115_LandMons:
	wild_mon SWABLU, 23
	wild_mon TAILLOW, 23
	wild_mon SWABLU, 25
	wild_mon TAILLOW, 24
	wild_mon TAILLOW, 25
	wild_mon SWELLOW, 25
	wild_mon JIGGLYPUFF, 24
	wild_mon JIGGLYPUFF, 25
	wild_mon WINGULL, 24
	wild_mon WINGULL, 24
	wild_mon WINGULL, 26
	wild_mon WINGULL, 25

	.align 2
Route115_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route115_LandMons

	.align 2
Route115_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route115_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route115_WaterMons

	.align 2
Route115_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route115_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route115_FishingMons

	.align 2
Route116_LandMons:
	wild_mon ZIGZAGOON, 6
	wild_mon WHISMUR, 6
	wild_mon NINCADA, 6
	wild_mon WHISMUR, 7
	wild_mon NINCADA, 7
	wild_mon TAILLOW, 6
	wild_mon TAILLOW, 7
	wild_mon TAILLOW, 8
	wild_mon ZIGZAGOON, 7
	wild_mon ZIGZAGOON, 8
	wild_mon SKITTY, 7
	wild_mon SKITTY, 8

	.align 2
Route116_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route116_LandMons

	.align 2
Route117_LandMons:
	wild_mon ZIGZAGOON, 13
	wild_mon ROSELIA, 13
	wild_mon ZIGZAGOON, 14
	wild_mon ROSELIA, 14
	wild_mon MARILL, 13
	wild_mon ODDISH, 13
	wild_mon ILLUMISE_VOLBEAT, 13
	wild_mon ILLUMISE_VOLBEAT, 13
	wild_mon ILLUMISE_VOLBEAT, 14
	wild_mon ILLUMISE_VOLBEAT, 14
	wild_mon VOLBEAT_ILLUMISE, 13
	wild_mon SURSKIT, 13

	.align 2
Route117_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route117_LandMons

	.align 2
Route117_WaterMons:
	wild_mon MARILL, 20, 30
	wild_mon MARILL, 10, 20
	wild_mon MARILL, 30, 35
	wild_mon MARILL, 5, 10
	wild_mon SURSKIT, 20, 30

	.align 2
Route117_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route117_WaterMons

	.align 2
Route117_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon CORPHISH, 10, 30
	wild_mon CORPHISH, 25, 30
	wild_mon CORPHISH, 30, 35
	wild_mon CORPHISH, 20, 25
	wild_mon CORPHISH, 35, 40
	wild_mon CORPHISH, 40, 45

	.align 2
Route117_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route117_FishingMons

	.align 2
Route118_LandMons:
	wild_mon ZIGZAGOON, 24
	wild_mon ELECTRIKE, 24
	wild_mon ZIGZAGOON, 26
	wild_mon ELECTRIKE, 26
	wild_mon LINOONE, 26
	wild_mon MANECTRIC, 26
	wild_mon WINGULL, 25
	wild_mon WINGULL, 25
	wild_mon WINGULL, 26
	wild_mon WINGULL, 26
	wild_mon WINGULL, 27
	wild_mon KECLEON, 25

	.align 2
Route118_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route118_LandMons

	.align 2
Route118_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route118_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route118_WaterMons

	.align 2
Route118_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon CARVANHA, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon CARVANHA, 30, 35
	wild_mon CARVANHA, 20, 25
	wild_mon CARVANHA, 35, 40
	wild_mon CARVANHA, 40, 45

	.align 2
Route118_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route118_FishingMons

	.align 2
Route119_LandMons:
	wild_mon ZIGZAGOON, 25
	wild_mon LINOONE, 25
	wild_mon ZIGZAGOON, 27
	wild_mon ODDISH, 25
	wild_mon LINOONE, 27
	wild_mon ODDISH, 26
	wild_mon ODDISH, 27
	wild_mon ODDISH, 24
	wild_mon TROPIUS, 25
	wild_mon TROPIUS, 26
	wild_mon TROPIUS, 27
	wild_mon KECLEON, 25

	.align 2
Route119_LandMonsInfo:
	.4byte 15 @ encounter rate
	.4byte Route119_LandMons

	.align 2
Route119_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route119_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route119_WaterMons

	.align 2
Route119_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon CARVANHA, 10, 30
	wild_mon CARVANHA, 25, 30
	wild_mon CARVANHA, 30, 35
	wild_mon CARVANHA, 20, 25
	wild_mon CARVANHA, 35, 40
	wild_mon CARVANHA, 40, 45

	.align 2
Route119_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route119_FishingMons

	.align 2
Route120_LandMons:
	wild_mon ZIGZAGOON, 25
	wild_mon LINOONE, 25
	wild_mon LINOONE, 27
	wild_mon ODDISH, 25
	wild_mon MARILL, 25
	wild_mon ODDISH, 26
	wild_mon ODDISH, 27
	wild_mon MARILL, 27
	wild_mon ABSOL, 25
	wild_mon ABSOL, 27
	wild_mon KECLEON, 25
	wild_mon SURSKIT, 25

	.align 2
Route120_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route120_LandMons

	.align 2
Route120_WaterMons:
	wild_mon MARILL, 20, 30
	wild_mon MARILL, 10, 20
	wild_mon MARILL, 30, 35
	wild_mon MARILL, 5, 10
	wild_mon SURSKIT, 20, 30

	.align 2
Route120_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route120_WaterMons

	.align 2
Route120_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 30
	wild_mon BARBOACH, 10, 30
	wild_mon BARBOACH, 25, 30
	wild_mon BARBOACH, 30, 35
	wild_mon BARBOACH, 20, 25
	wild_mon BARBOACH, 35, 40
	wild_mon BARBOACH, 40, 45

	.align 2
Route120_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route120_FishingMons

	.align 2
Route121_LandMons:
	wild_mon ZIGZAGOON, 26
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon LINOONE, 26
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon LINOONE, 28
	wild_mon ODDISH, 26
	wild_mon ODDISH, 28
	wild_mon GLOOM, 28
	wild_mon WINGULL, 26
	wild_mon WINGULL, 27
	wild_mon WINGULL, 28
	wild_mon KECLEON, 25

	.align 2
Route121_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route121_LandMons

	.align 2
Route121_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route121_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route121_WaterMons

	.align 2
Route121_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route121_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route121_FishingMons

	.align 2
Route122_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route122_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route122_WaterMons

	.align 2
Route122_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route122_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route122_FishingMons

	.align 2
Route123_LandMons:
	wild_mon ZIGZAGOON, 26
	wild_mon DUSKULL_SHUPPET, 26
	wild_mon LINOONE, 26
	wild_mon DUSKULL_SHUPPET, 28
	wild_mon LINOONE, 28
	wild_mon ODDISH, 26
	wild_mon ODDISH, 28
	wild_mon GLOOM, 28
	wild_mon WINGULL, 26
	wild_mon WINGULL, 27
	wild_mon WINGULL, 28
	wild_mon KECLEON, 25

	.align 2
Route123_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route123_LandMons

	.align 2
Route123_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route123_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route123_WaterMons

	.align 2
Route123_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route123_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route123_FishingMons

	.align 2
Route124_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route124_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route124_WaterMons

	.align 2
Route124_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route124_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route124_FishingMons

	.align 2
Route125_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route125_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route125_WaterMons

	.align 2
Route125_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route125_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route125_FishingMons

	.align 2
Route126_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route126_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route126_WaterMons

	.align 2
Route126_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route126_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route126_FishingMons

	.align 2
Route127_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route127_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route127_WaterMons

	.align 2
Route127_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route127_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route127_FishingMons

	.align 2
Route128_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route128_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route128_WaterMons

	.align 2
Route128_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon LUVDISC, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon LUVDISC, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon CORSOLA, 30, 35
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route128_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route128_FishingMons

	.align 2
Route129_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	.ifdef SAPPHIRE
	wild_mon WAILORD, 25, 30
	.else
	wild_mon WAILORD, 35, 40
	.endif

	.align 2
Route129_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route129_WaterMons

	.align 2
Route129_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route129_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route129_FishingMons

	.align 2
Route130_LandMons:
	wild_mon WYNAUT, 30
	wild_mon WYNAUT, 35
	wild_mon WYNAUT, 25
	wild_mon WYNAUT, 40
	wild_mon WYNAUT, 20
	wild_mon WYNAUT, 45
	wild_mon WYNAUT, 15
	wild_mon WYNAUT, 50
	wild_mon WYNAUT, 10
	wild_mon WYNAUT, 5
	wild_mon WYNAUT, 10
	wild_mon WYNAUT, 5

	.align 2
Route130_LandMonsInfo:
	.4byte 20 @ encounter rate
	.4byte Route130_LandMons

	.align 2
Route130_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route130_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route130_WaterMons

	.align 2
Route130_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route130_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route130_FishingMons

	.align 2
Route131_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route131_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route131_WaterMons

	.align 2
Route131_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route131_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route131_FishingMons

	.align 2
Route132_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route132_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route132_WaterMons

	.align 2
Route132_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon HORSEA, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route132_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route132_FishingMons

	.align 2
Route133_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route133_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route133_WaterMons

	.align 2
Route133_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon HORSEA, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route133_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route133_FishingMons

	.align 2
Route134_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
Route134_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Route134_WaterMons

	.align 2
Route134_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon HORSEA, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
Route134_FishingMonsInfo:
	.4byte 30 @ encounter rate
	.4byte Route134_FishingMons

	.align 2
SafariZone_Northwest_LandMons:
	wild_mon RHYHORN, 27
	wild_mon ODDISH, 27
	wild_mon RHYHORN, 29
	wild_mon ODDISH, 29
	wild_mon DODUO, 27
	wild_mon GLOOM, 29
	wild_mon GLOOM, 31
	wild_mon DODUO, 29
	wild_mon DODRIO, 29
	wild_mon PINSIR, 27
	wild_mon DODRIO, 31
	wild_mon PINSIR, 29

	.align 2
SafariZone_Northwest_LandMonsInfo:
	.4byte 25 @ encounter rate
	.4byte SafariZone_Northwest_LandMons

	.align 2
SafariZone_Northwest_WaterMons:
	wild_mon PSYDUCK, 20, 30
	wild_mon PSYDUCK, 20, 30
	wild_mon PSYDUCK, 30, 35
	wild_mon GOLDUCK, 30, 35
	wild_mon GOLDUCK, 25, 40

	.align 2
SafariZone_Northwest_WaterMonsInfo:
	.4byte 9 @ encounter rate
	.4byte SafariZone_Northwest_WaterMons

	.align 2
SafariZone_Northwest_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 25
	wild_mon GOLDEEN, 10, 30
	wild_mon GOLDEEN, 25, 30
	wild_mon GOLDEEN, 30, 35
	wild_mon SEAKING, 30, 35
	wild_mon SEAKING, 35, 40
	wild_mon SEAKING, 25, 30

	.align 2
SafariZone_Northwest_FishingMonsInfo:
	.4byte 35 @ encounter rate
	.4byte SafariZone_Northwest_FishingMons

	.align 2
SafariZone_Northeast_LandMons:
	wild_mon PHANPY, 27
	wild_mon ODDISH, 27
	wild_mon PHANPY, 29
	wild_mon ODDISH, 29
	wild_mon NATU, 27
	wild_mon GLOOM, 29
	wild_mon GLOOM, 31
	wild_mon NATU, 29
	wild_mon XATU, 29
	wild_mon HERACROSS, 27
	wild_mon XATU, 31
	wild_mon HERACROSS, 29

	.align 2
SafariZone_Northeast_LandMonsInfo:
	.4byte 25 @ encounter rate
	.4byte SafariZone_Northeast_LandMons

	.align 2
SafariZone_Northeast_RockSmashMons:
	wild_mon GEODUDE, 10, 15
	wild_mon GEODUDE, 5, 10
	wild_mon GEODUDE, 15, 20
	wild_mon GEODUDE, 20, 25
	wild_mon GEODUDE, 25, 30

	.align 2
SafariZone_Northeast_RockSmashMonsInfo:
	.4byte 25 @ encounter rate
	.4byte SafariZone_Northeast_RockSmashMons

	.align 2
SafariZone_Southwest_LandMons:
	wild_mon ODDISH, 25
	wild_mon ODDISH, 27
	wild_mon GIRAFARIG, 25
	wild_mon GIRAFARIG, 27
	wild_mon NATU, 25
	.ifdef SAPPHIRE
	wild_mon DODUO, 27
	.else
	wild_mon DODUO, 25
	.endif
	wild_mon GLOOM, 25
	wild_mon WOBBUFFET, 27
	wild_mon PIKACHU, 25
	wild_mon WOBBUFFET, 27
	wild_mon PIKACHU, 27
	wild_mon WOBBUFFET, 29

	.align 2
SafariZone_Southwest_LandMonsInfo:
	.4byte 25 @ encounter rate
	.4byte SafariZone_Southwest_LandMons

	.align 2
SafariZone_Southwest_WaterMons:
	wild_mon PSYDUCK, 20, 30
	wild_mon PSYDUCK, 20, 30
	wild_mon PSYDUCK, 30, 35
	wild_mon PSYDUCK, 30, 35
	wild_mon PSYDUCK, 30, 35

	.align 2
SafariZone_Southwest_WaterMonsInfo:
	.4byte 9 @ encounter rate
	.4byte SafariZone_Southwest_WaterMons

	.align 2
SafariZone_Southwest_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon GOLDEEN, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon GOLDEEN, 10, 25
	wild_mon GOLDEEN, 10, 30
	wild_mon GOLDEEN, 25, 30
	wild_mon GOLDEEN, 30, 35
	wild_mon SEAKING, 30, 35
	wild_mon SEAKING, 35, 40
	wild_mon SEAKING, 25, 30

	.align 2
SafariZone_Southwest_FishingMonsInfo:
	.4byte 35 @ encounter rate
	.4byte SafariZone_Southwest_FishingMons

	.align 2
SafariZone_Southeast_LandMons:
	wild_mon ODDISH, 25
	wild_mon ODDISH, 27
	wild_mon GIRAFARIG, 25
	wild_mon GIRAFARIG, 27
	wild_mon NATU, 25
	wild_mon DODUO, 25
	wild_mon GLOOM, 25
	wild_mon WOBBUFFET, 27
	wild_mon PIKACHU, 25
	wild_mon WOBBUFFET, 27
	wild_mon PIKACHU, 27
	wild_mon WOBBUFFET, 29

	.align 2
SafariZone_Southeast_LandMonsInfo:
	.4byte 25 @ encounter rate
	.4byte SafariZone_Southeast_LandMons

	.align 2
DewfordTown_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
DewfordTown_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte DewfordTown_WaterMons

	.align 2
DewfordTown_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 20, 25
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
DewfordTown_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte DewfordTown_FishingMons

	.align 2
PacifidlogTown_WaterMons:
	wild_mon TENTACOOL, 5, 35
	wild_mon WINGULL, 10, 30
	wild_mon WINGULL, 15, 25
	wild_mon PELIPPER, 25, 30
	wild_mon PELIPPER, 25, 30

	.align 2
PacifidlogTown_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte PacifidlogTown_WaterMons

	.align 2
PacifidlogTown_FishingMons:
	wild_mon MAGIKARP, 5, 10
	wild_mon TENTACOOL, 5, 10
	wild_mon MAGIKARP, 10, 30
	wild_mon TENTACOOL, 10, 30
	wild_mon WAILMER, 10, 30
	wild_mon SHARPEDO, 30, 35
	wild_mon WAILMER, 30, 35
	wild_mon WAILMER, 25, 30
	wild_mon WAILMER, 35, 40
	wild_mon WAILMER, 40, 45

	.align 2
PacifidlogTown_FishingMonsInfo:
	.4byte 10 @ encounter rate
	.4byte PacifidlogTown_FishingMons

	.align 2
Underwater1_WaterMons:
	wild_mon CLAMPERL, 20, 30
	wild_mon CHINCHOU, 20, 30
	wild_mon CLAMPERL, 30, 35
	wild_mon RELICANTH, 30, 35
	wild_mon RELICANTH, 30, 35

	.align 2
Underwater1_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Underwater1_WaterMons

	.align 2
Underwater2_WaterMons:
	wild_mon CLAMPERL, 20, 30
	wild_mon CHINCHOU, 20, 30
	wild_mon CLAMPERL, 30, 35
	wild_mon RELICANTH, 30, 35
	wild_mon RELICANTH, 30, 35

	.align 2
Underwater2_WaterMonsInfo:
	.4byte 4 @ encounter rate
	.4byte Underwater2_WaterMons

	.align 2
gWildMonHeaders::
	map PetalburgCity
	.2byte 0 @ padding
	.4byte NULL
	.4byte PetalburgCity_WaterMonsInfo
	.4byte NULL
	.4byte PetalburgCity_FishingMonsInfo

	map SlateportCity
	.2byte 0 @ padding
	.4byte NULL
	.4byte SlateportCity_WaterMonsInfo
	.4byte NULL
	.4byte SlateportCity_FishingMonsInfo

	map LilycoveCity
	.2byte 0 @ padding
	.4byte NULL
	.4byte LilycoveCity_WaterMonsInfo
	.4byte NULL
	.4byte LilycoveCity_FishingMonsInfo

	map MossdeepCity
	.2byte 0 @ padding
	.4byte NULL
	.4byte MossdeepCity_WaterMonsInfo
	.4byte NULL
	.4byte MossdeepCity_FishingMonsInfo

	map SootopolisCity
	.2byte 0 @ padding
	.4byte NULL
	.4byte SootopolisCity_WaterMonsInfo
	.4byte NULL
	.4byte SootopolisCity_FishingMonsInfo

	map EverGrandeCity
	.2byte 0 @ padding
	.4byte NULL
	.4byte EverGrandeCity_WaterMonsInfo
	.4byte NULL
	.4byte EverGrandeCity_FishingMonsInfo

	map MeteorFalls_1F_1R
	.2byte 0 @ padding
	.4byte MeteorFalls_1F_1R_LandMonsInfo
	.4byte MeteorFalls_1F_1R_WaterMonsInfo
	.4byte NULL
	.4byte MeteorFalls_1F_1R_FishingMonsInfo

	map MeteorFalls_1F_2R
	.2byte 0 @ padding
	.4byte MeteorFalls_1F_2R_LandMonsInfo
	.4byte MeteorFalls_1F_2R_WaterMonsInfo
	.4byte NULL
	.4byte MeteorFalls_1F_2R_FishingMonsInfo

	map MeteorFalls_B1F_1R
	.2byte 0 @ padding
	.4byte MeteorFalls_B1F_1R_LandMonsInfo
	.4byte MeteorFalls_B1F_1R_WaterMonsInfo
	.4byte NULL
	.4byte MeteorFalls_B1F_1R_FishingMonsInfo

	map MeteorFalls_B1F_2R
	.2byte 0 @ padding
	.4byte MeteorFalls_B1F_2R_LandMonsInfo
	.4byte MeteorFalls_B1F_2R_WaterMonsInfo
	.4byte NULL
	.4byte MeteorFalls_B1F_2R_FishingMonsInfo

	map RusturfTunnel
	.2byte 0 @ padding
	.4byte RusturfTunnel_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map GraniteCave_1F
	.2byte 0 @ padding
	.4byte GraniteCave_1F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map GraniteCave_B1F
	.2byte 0 @ padding
	.4byte GraniteCave_B1F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map GraniteCave_B2F
	.2byte 0 @ padding
	.4byte GraniteCave_B2F_LandMonsInfo
	.4byte NULL
	.4byte GraniteCave_B2F_RockSmashMonsInfo
	.4byte NULL

	map GraniteCave_StevensRoom
	.2byte 0 @ padding
	.4byte GraniteCave_StevensRoom_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map PetalburgWoods
	.2byte 0 @ padding
	.4byte PetalburgWoods_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map JaggedPass
	.2byte 0 @ padding
	.4byte JaggedPass_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map FieryPath
	.2byte 0 @ padding
	.4byte FieryPath_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map MtPyre_1F
	.2byte 0 @ padding
	.4byte MtPyre_1F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map MtPyre_2F
	.2byte 0 @ padding
	.4byte MtPyre_2F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map MtPyre_3F
	.2byte 0 @ padding
	.4byte MtPyre_3F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map MtPyre_4F
	.2byte 0 @ padding
	.4byte MtPyre_4F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map MtPyre_5F
	.2byte 0 @ padding
	.4byte MtPyre_5F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map MtPyre_6F
	.2byte 0 @ padding
	.4byte MtPyre_6F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map MtPyre_Exterior
	.2byte 0 @ padding
	.4byte MtPyre_Exterior_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map MtPyre_Summit
	.2byte 0 @ padding
	.4byte MtPyre_Summit_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map SeafloorCavern_Entrance
	.2byte 0 @ padding
	.4byte NULL
	.4byte SeafloorCavern_Entrance_WaterMonsInfo
	.4byte NULL
	.4byte SeafloorCavern_Entrance_FishingMonsInfo

	map SeafloorCavern_Room1
	.2byte 0 @ padding
	.4byte SeafloorCavern_Room1_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map SeafloorCavern_Room2
	.2byte 0 @ padding
	.4byte SeafloorCavern_Room2_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map SeafloorCavern_Room3
	.2byte 0 @ padding
	.4byte SeafloorCavern_Room3_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map SeafloorCavern_Room4
	.2byte 0 @ padding
	.4byte SeafloorCavern_Room4_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map SeafloorCavern_Room5
	.2byte 0 @ padding
	.4byte SeafloorCavern_Room5_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map SeafloorCavern_Room6
	.2byte 0 @ padding
	.4byte SeafloorCavern_Room6_LandMonsInfo
	.4byte SeafloorCavern_Room6_WaterMonsInfo
	.4byte NULL
	.4byte SeafloorCavern_Room6_FishingMonsInfo

	map SeafloorCavern_Room7
	.2byte 0 @ padding
	.4byte SeafloorCavern_Room7_LandMonsInfo
	.4byte SeafloorCavern_Room7_WaterMonsInfo
	.4byte NULL
	.4byte SeafloorCavern_Room7_FishingMonsInfo

	map SeafloorCavern_Room8
	.2byte 0 @ padding
	.4byte SeafloorCavern_Room8_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map CaveOfOrigin_Entrance
	.2byte 0 @ padding
	.4byte CaveOfOrigin_Entrance_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map CaveOfOrigin_1F
	.2byte 0 @ padding
	.4byte CaveOfOrigin_1F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map CaveOfOrigin_B1F
	.2byte 0 @ padding
	.4byte CaveOfOrigin_B1F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map CaveOfOrigin_B2F
	.2byte 0 @ padding
	.4byte CaveOfOrigin_B2F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map CaveOfOrigin_B3F
	.2byte 0 @ padding
	.4byte CaveOfOrigin_B3F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map VictoryRoad_1F
	.2byte 0 @ padding
	.4byte VictoryRoad_1F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map VictoryRoad_B1F
	.2byte 0 @ padding
	.4byte VictoryRoad_B1F_LandMonsInfo
	.4byte NULL
	.4byte VictoryRoad_B1F_RockSmashMonsInfo
	.4byte NULL

	map VictoryRoad_B2F
	.2byte 0 @ padding
	.4byte VictoryRoad_B2F_LandMonsInfo
	.4byte VictoryRoad_B2F_WaterMonsInfo
	.4byte NULL
	.4byte VictoryRoad_B2F_FishingMonsInfo

	map ShoalCave_LowTideEntranceRoom
	.2byte 0 @ padding
	.4byte ShoalCave_LowTideEntranceRoom_LandMonsInfo
	.4byte ShoalCave_LowTideEntranceRoom_WaterMonsInfo
	.4byte NULL
	.4byte ShoalCave_LowTideEntranceRoom_FishingMonsInfo

	map ShoalCave_LowTideInnerRoom
	.2byte 0 @ padding
	.4byte ShoalCave_LowTideInnerRoom_LandMonsInfo
	.4byte ShoalCave_LowTideInnerRoom_WaterMonsInfo
	.4byte NULL
	.4byte ShoalCave_LowTideInnerRoom_FishingMonsInfo

	map ShoalCave_LowTideStairsRoom
	.2byte 0 @ padding
	.4byte ShoalCave_LowTideStairsRoom_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map ShoalCave_LowTideLowerRoom
	.2byte 0 @ padding
	.4byte ShoalCave_LowTideLowerRoom_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map ShoalCave_LowTideIceRoom
	.2byte 0 @ padding
	.4byte ShoalCave_LowTideIceRoom_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map NewMauville_Entrance
	.2byte 0 @ padding
	.4byte NewMauville_Entrance_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map NewMauville_Inside
	.2byte 0 @ padding
	.4byte NewMauville_Inside_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map AbandonedShip_Rooms_B1F
	.2byte 0 @ padding
	.4byte NULL
	.4byte AbandonedShip_Rooms_B1F_WaterMonsInfo
	.4byte NULL
	.4byte AbandonedShip_Rooms_B1F_FishingMonsInfo

	map AbandonedShip_HiddenFloorCorridors
	.2byte 0 @ padding
	.4byte NULL
	.4byte AbandonedShip_HiddenFloorCorridors_WaterMonsInfo
	.4byte NULL
	.4byte AbandonedShip_HiddenFloorCorridors_FishingMonsInfo

	map SkyPillar_1F
	.2byte 0 @ padding
	.4byte SkyPillar_1F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map SkyPillar_3F
	.2byte 0 @ padding
	.4byte SkyPillar_3F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map SkyPillar_5F
	.2byte 0 @ padding
	.4byte SkyPillar_5F_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map Route101
	.2byte 0 @ padding
	.4byte Route101_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map Route102
	.2byte 0 @ padding
	.4byte Route102_LandMonsInfo
	.4byte Route102_WaterMonsInfo
	.4byte NULL
	.4byte Route102_FishingMonsInfo

	map Route103
	.2byte 0 @ padding
	.4byte Route103_LandMonsInfo
	.4byte Route103_WaterMonsInfo
	.4byte NULL
	.4byte Route103_FishingMonsInfo

	map Route104
	.2byte 0 @ padding
	.4byte Route104_LandMonsInfo
	.4byte Route104_WaterMonsInfo
	.4byte NULL
	.4byte Route104_FishingMonsInfo

	map Route105
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route105_WaterMonsInfo
	.4byte NULL
	.4byte Route105_FishingMonsInfo

	map Route106
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route106_WaterMonsInfo
	.4byte NULL
	.4byte Route106_FishingMonsInfo

	map Route107
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route107_WaterMonsInfo
	.4byte NULL
	.4byte Route107_FishingMonsInfo

	map Route108
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route108_WaterMonsInfo
	.4byte NULL
	.4byte Route108_FishingMonsInfo

	map Route109
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route109_WaterMonsInfo
	.4byte NULL
	.4byte Route109_FishingMonsInfo

	map Route110
	.2byte 0 @ padding
	.4byte Route110_LandMonsInfo
	.4byte Route110_WaterMonsInfo
	.4byte NULL
	.4byte Route110_FishingMonsInfo

	map Route111
	.2byte 0 @ padding
	.4byte Route111_LandMonsInfo
	.4byte Route111_WaterMonsInfo
	.4byte Route111_RockSmashMonsInfo
	.4byte Route111_FishingMonsInfo

	map Route112
	.2byte 0 @ padding
	.4byte Route112_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map Route113
	.2byte 0 @ padding
	.4byte Route113_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map Route114
	.2byte 0 @ padding
	.4byte Route114_LandMonsInfo
	.4byte Route114_WaterMonsInfo
	.4byte Route114_RockSmashMonsInfo
	.4byte Route114_FishingMonsInfo

	map Route115
	.2byte 0 @ padding
	.4byte Route115_LandMonsInfo
	.4byte Route115_WaterMonsInfo
	.4byte NULL
	.4byte Route115_FishingMonsInfo

	map Route116
	.2byte 0 @ padding
	.4byte Route116_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map Route117
	.2byte 0 @ padding
	.4byte Route117_LandMonsInfo
	.4byte Route117_WaterMonsInfo
	.4byte NULL
	.4byte Route117_FishingMonsInfo

	map Route118
	.2byte 0 @ padding
	.4byte Route118_LandMonsInfo
	.4byte Route118_WaterMonsInfo
	.4byte NULL
	.4byte Route118_FishingMonsInfo

	map Route119
	.2byte 0 @ padding
	.4byte Route119_LandMonsInfo
	.4byte Route119_WaterMonsInfo
	.4byte NULL
	.4byte Route119_FishingMonsInfo

	map Route120
	.2byte 0 @ padding
	.4byte Route120_LandMonsInfo
	.4byte Route120_WaterMonsInfo
	.4byte NULL
	.4byte Route120_FishingMonsInfo

	map Route121
	.2byte 0 @ padding
	.4byte Route121_LandMonsInfo
	.4byte Route121_WaterMonsInfo
	.4byte NULL
	.4byte Route121_FishingMonsInfo

	map Route122
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route122_WaterMonsInfo
	.4byte NULL
	.4byte Route122_FishingMonsInfo

	map Route123
	.2byte 0 @ padding
	.4byte Route123_LandMonsInfo
	.4byte Route123_WaterMonsInfo
	.4byte NULL
	.4byte Route123_FishingMonsInfo

	map Route124
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route124_WaterMonsInfo
	.4byte NULL
	.4byte Route124_FishingMonsInfo

	map Route125
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route125_WaterMonsInfo
	.4byte NULL
	.4byte Route125_FishingMonsInfo

	map Route126
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route126_WaterMonsInfo
	.4byte NULL
	.4byte Route126_FishingMonsInfo

	map Route127
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route127_WaterMonsInfo
	.4byte NULL
	.4byte Route127_FishingMonsInfo

	map Route128
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route128_WaterMonsInfo
	.4byte NULL
	.4byte Route128_FishingMonsInfo

	map Route129
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route129_WaterMonsInfo
	.4byte NULL
	.4byte Route129_FishingMonsInfo

	map Route130
	.2byte 0 @ padding
	.4byte Route130_LandMonsInfo
	.4byte Route130_WaterMonsInfo
	.4byte NULL
	.4byte Route130_FishingMonsInfo

	map Route131
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route131_WaterMonsInfo
	.4byte NULL
	.4byte Route131_FishingMonsInfo

	map Route132
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route132_WaterMonsInfo
	.4byte NULL
	.4byte Route132_FishingMonsInfo

	map Route133
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route133_WaterMonsInfo
	.4byte NULL
	.4byte Route133_FishingMonsInfo

	map Route134
	.2byte 0 @ padding
	.4byte NULL
	.4byte Route134_WaterMonsInfo
	.4byte NULL
	.4byte Route134_FishingMonsInfo

	map SafariZone_Northwest
	.2byte 0 @ padding
	.4byte SafariZone_Northwest_LandMonsInfo
	.4byte SafariZone_Northwest_WaterMonsInfo
	.4byte NULL
	.4byte SafariZone_Northwest_FishingMonsInfo

	map SafariZone_Northeast
	.2byte 0 @ padding
	.4byte SafariZone_Northeast_LandMonsInfo
	.4byte NULL
	.4byte SafariZone_Northeast_RockSmashMonsInfo
	.4byte NULL

	map SafariZone_Southwest
	.2byte 0 @ padding
	.4byte SafariZone_Southwest_LandMonsInfo
	.4byte SafariZone_Southwest_WaterMonsInfo
	.4byte NULL
	.4byte SafariZone_Southwest_FishingMonsInfo

	map SafariZone_Southeast
	.2byte 0 @ padding
	.4byte SafariZone_Southeast_LandMonsInfo
	.4byte NULL
	.4byte NULL
	.4byte NULL

	map DewfordTown
	.2byte 0 @ padding
	.4byte NULL
	.4byte DewfordTown_WaterMonsInfo
	.4byte NULL
	.4byte DewfordTown_FishingMonsInfo

	map PacifidlogTown
	.2byte 0 @ padding
	.4byte NULL
	.4byte PacifidlogTown_WaterMonsInfo
	.4byte NULL
	.4byte PacifidlogTown_FishingMonsInfo

	map Underwater1
	.2byte 0 @ padding
	.4byte NULL
	.4byte Underwater1_WaterMonsInfo
	.4byte NULL
	.4byte NULL

	map Underwater2
	.2byte 0 @ padding
	.4byte NULL
	.4byte Underwater2_WaterMonsInfo
	.4byte NULL
	.4byte NULL

	map UNDEFINED
	.2byte 0 @ padding
	.4byte NULL
	.4byte NULL
	.4byte NULL
	.4byte NULL
