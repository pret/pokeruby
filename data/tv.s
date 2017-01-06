	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gPokeOutbreakSpeciesList:: @ 83D13F8
	.2byte	SPECIES_SURSKIT
	.2byte	MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE
	.byte	3
	.byte	MAPSEC_Route102

	.2byte	SPECIES_SURSKIT
	.2byte	MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE
	.byte	15
	.byte	MAPSEC_Route114

	.2byte	SPECIES_SURSKIT
	.2byte	MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE
	.byte	15
	.byte	MAPSEC_Route117

	.2byte	SPECIES_SURSKIT
	.2byte	MOVE_BUBBLE, MOVE_QUICK_ATTACK, MOVE_NONE, MOVE_NONE
	.byte	28
	.byte	MAPSEC_Route120

	.2byte	SPECIES_SKITTY
	.2byte	MOVE_GROWL, MOVE_TACKLE, MOVE_NONE, MOVE_NONE
	.byte	15
	.byte	MAPSEC_Route116

	.align 2
gTVNewsTextGroup1:: @ 83D1434
	.4byte 0x0
	.4byte gTVNewsText_EnergyGuru1
	.4byte gTVNewsText_GameCorner1
	.4byte gTVNewsText_LilycoveDepartment1

	.align 2
gTVNewsTextGroup2:: @ 83D1444
	.4byte 0x0
	.4byte gTVNewsText_EnergyGuru2
	.4byte gTVNewsText_GameCorner2
	.4byte gTVNewsText_LilycoveDepartment2

	.align 2
gTVNewsTextGroup3:: @ 83D1454
	.4byte 0x0
	.4byte gTVNewsText_EnergyGuru3
	.4byte gTVNewsText_GameCorner3
	.4byte gTVNewsText_LilycoveDepartment3

	.align 2
gUnknown_083D1464:: @ 83D1464
	.4byte gStringVar1
	.4byte gStringVar2
	.4byte gStringVar3

	.align 2
gTVFanClubTextGroup:: @ 83D1470
	.4byte gTVFanClubText1
	.4byte gTVFanClubText2
	.4byte gTVFanClubText3
	.4byte gTVFanClubText4
	.4byte gTVFanClubText5
	.4byte gTVFanClubText6
	.4byte gTVFanClubText7
	.4byte gTVFanClubText8

	.align 2
gTVRecentHappeningsTextGroup:: @ 83D1490
	.4byte gTVRecentHappeningsText1
	.4byte gTVRecentHappeningsText2
	.4byte gTVRecentHappeningsText3
	.4byte gTVRecentHappeningsText4
	.4byte gTVRecentHappeningsText5
	.4byte gTVRecentHappeningsText6

	.align 2
gTVFanClubOpinionsTextGroup:: @ 83D14A8
	.4byte gTVFanClubOpinionsText1
	.4byte gTVFanClubOpinionsText2
	.4byte gTVFanClubOpinionsText3
	.4byte gTVFanClubOpinionsText4
	.4byte gTVFanClubOpinionsText5

	.align 2
gTVPokemonOutbreakTextGroup:: @ 83D14BC
	.4byte gTVPokemonOutbreakText

	.align 2
gTVPokemonTodayTextGroup:: @ 83D14C0
	.4byte gTVPokemonTodayText1
	.4byte gTVPokemonTodayText2
	.4byte gTVPokemonTodayText3
	.4byte gTVPokemonTodayText4
	.4byte gTVPokemonTodayText5
	.4byte gTVPokemonTodayText6
	.4byte gTVPokemonTodayText7
	.4byte gTVPokemonTodayText8
	.4byte gTVPokemonTodayText9
	.4byte gTVPokemonTodayText10
	.4byte gTVPokemonTodayText11
	.4byte gTVPokemonTodayText12

	.align 2
gTVSmartShopperTextGroup:: @ 83D14F0
	.4byte gTVSmartShopperText1
	.4byte gTVSmartShopperText2
	.4byte gTVSmartShopperText3
	.4byte gTVSmartShopperText4
	.4byte gTVSmartShopperText5
	.4byte gTVSmartShopperText6
	.4byte gTVSmartShopperText7
	.4byte gTVSmartShopperText8
	.4byte gTVSmartShopperText9
	.4byte gTVSmartShopperText10
	.4byte gTVSmartShopperText11
	.4byte gTVSmartShopperText12
	.4byte gTVSmartShopperText13

	.align 2
gTVBravoTrainerTextGroup:: @ 83D1524
	.4byte gTVBravoTrainerText1
	.4byte gTVBravoTrainerText2
	.4byte gTVBravoTrainerText3
	.4byte gTVBravoTrainerText4
	.4byte gTVBravoTrainerText5
	.4byte gTVBravoTrainerText6
	.4byte gTVBravoTrainerText7
	.4byte gTVBravoTrainerText8
	.4byte gTVBravoTrainerText9

	.align 2
gTVBravoTrainerBattleTowerTextGroup:: @ 83D1548
	.4byte gTVBravoTrainerBattleTowerText1
	.4byte gTVBravoTrainerBattleTowerText2
	.4byte gTVBravoTrainerBattleTowerText3
	.4byte gTVBravoTrainerBattleTowerText4
	.4byte gTVBravoTrainerBattleTowerText5
	.4byte gTVBravoTrainerBattleTowerText6
	.4byte gTVBravoTrainerBattleTowerText7
	.4byte gTVBravoTrainerBattleTowerText8
	.4byte gTVBravoTrainerBattleTowerText9
	.4byte gTVBravoTrainerBattleTowerText10
	.4byte gTVBravoTrainerBattleTowerText11
	.4byte gTVBravoTrainerBattleTowerText12
	.4byte gTVBravoTrainerBattleTowerText13
	.4byte gTVBravoTrainerBattleTowerText14
	.4byte gTVBravoTrainerBattleTowerText15

	.align 2
gTVNameRaterTextGroup:: @ 83D1584
	.4byte gTVNameRaterText1
	.4byte gTVNameRaterText2
	.4byte gTVNameRaterText3
	.4byte gTVNameRaterText4
	.4byte gTVNameRaterText5
	.4byte gTVNameRaterText6
	.4byte gTVNameRaterText7
	.4byte gTVNameRaterText8
	.4byte gTVNameRaterText9
	.4byte gTVNameRaterText10
	.4byte gTVNameRaterText11
	.4byte gTVNameRaterText12
	.4byte gTVNameRaterText13
	.4byte gTVNameRaterText14
	.4byte gTVNameRaterText15
	.4byte gTVNameRaterText16
	.4byte gTVNameRaterText17
	.4byte gTVNameRaterText18
	.4byte gTVNameRaterText19

	.align 2
gTVPokemonTodayFailedCaptureTextGroup:: @ 83D15D0
	.4byte gTVPokemonTodayFailedCaptureText1
	.4byte gTVPokemonTodayFailedCaptureText2
	.4byte gTVPokemonTodayFailedCaptureText3
	.4byte gTVPokemonTodayFailedCaptureText4
	.4byte gTVPokemonTodayFailedCaptureText5
	.4byte gTVPokemonTodayFailedCaptureText6
	.4byte gTVPokemonTodayFailedCaptureText7

	.align 2
gTVFishingGuruAdviceTextGroup:: @ 83D15EC
	.4byte gTVFishingGuruAdviceText1
	.4byte gTVFishingGuruAdviceText2

	.align 2
gTVWorldOfMastersTextGroup:: @ 83D15F4
	.4byte gTVWorldOfMastersText1
	.4byte gTVWorldOfMastersText2
	.4byte gTVWorldOfMastersText3

	.align 2
gTVGabbyAndTyTextGroup:: @ 83D1600
	.4byte gTVGabbyAndTyText1
	.4byte gTVGabbyAndTyText2
	.4byte gTVGabbyAndTyText3
	.4byte gTVGabbyAndTyText4
	.4byte gTVGabbyAndTyText5
	.4byte gTVGabbyAndTyText6
	.4byte gTVGabbyAndTyText7
	.4byte gTVGabbyAndTyText8
	.4byte gTVGabbyAndTyText9
