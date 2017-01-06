	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gExpandedPlaceholder_Empty:: @ 840DC80
	.string "$"

gExpandedPlaceholder_Kun:: @ 840DC81
	.string "$"

gExpandedPlaceholder_Chan:: @ 840DC82
	.string "$"

gExpandedPlaceholder_Sapphire:: @ 840DC83
	.string "SAPPHIRE$"

gExpandedPlaceholder_Ruby:: @ 840DC8C
	.string "RUBY$"

gExpandedPlaceholder_Aqua:: @ 840DC91
	.string "AQUA$"

gExpandedPlaceholder_Magma:: @ 840DC96
	.string "MAGMA$"

gExpandedPlaceholder_Archie:: @ 840DC9C
	.string "ARCHIE$"

gExpandedPlaceholder_Maxie:: @ 840DCA3
	.string "MAXIE$"

gExpandedPlaceholder_Kyogre:: @ 840DCA9
	.string "KYOGRE$"

gExpandedPlaceholder_Groudon:: @ 840DCB0
	.string "GROUDON$"

gExpandedPlaceholder_Brendan:: @ 840DCB8
	.string "BRENDAN$"

gExpandedPlaceholder_May:: @ 840DCC0
	.string "MAY$"

gSystemText_Egg:: @ 840DCC4
	.string "EGG$"

gSystemText_Pokemon2:: @ 840DCC8
	.string "POKéMON$"

gMainMenuString_NewGame:: @ 840DCD0
	.string "NEW GAME$"

gMainMenuString_Continue:: @ 840DCD9
	.string "CONTINUE$"

gMainMenuString_Option:: @ 840DCE2
	.string "OPTION$"

gMainMenuString_MysteryEvents:: @ 840DCE9
	.string "MYSTERY EVENTS$"

SystemText_UpdatingSaveExternal::
	.string "Updating save file using external\ndata. Please wait.$"

SystemText_SaveUpdated::
	.string "The save file has been updated.$"

SystemText_SaveUpdatedExchangeBackup::
	.string "The save file has been updated.\pFurther game data cannot be saved\nto the backup memory.\pPlease exchange the backup memory.\pFor details, please contact the\nNintendo Service Center.$"

SystemText_SaveNotUpdated::
	.string "The save file could not be updated.\pPlease exchange the backup\nmemory.\pFor details, please contact the\nNintendo Service Center.$"

gSaveFileCorruptMessage:: @ 840DE81
	.string "The save file is corrupt. The\nprevious save file will be loaded.$"

gSaveFileDeletedMessage:: @ 840DEC2
	.string " The save file has been deleted...$"

gBoardNotInstalledMessage:: @ 840DEE5
	.string "The 1M sub-circuit board is\nnot installed.$"

gBatteryDryMessage:: @ 840DF10
	.string "The internal battery has run dry.\nThe game can be played.\pHowever, clock-based events will\nno longer occur.$"

gMainMenuString_Player:: @ 840DF7C
	.string "PLAYER$"

gMainMenuString_Pokedex:: @ 840DF83
	.string "POKéDEX$"

gMainMenuString_Time:: @ 840DF8B
	.string "TIME$"

gMainMenuString_Badges:: @ 840DF90
	.string "BADGES$"

gBirchText_Boy::
	.string "BOY$"
gBirchText_Girl::
	.string "GIRL$"
gBirchText_NewName::
	.string "NEW NAME$"

gDefaultBoyName1::
	.ifdef SAPPHIRE
	.string "SEAN$"
	.else
	.string "LANDON$"
	.endif
gDefaultBoyName2::
	.string "TERRY$"
gDefaultBoyName3::
	.string "SETH$"
gDefaultBoyName4::
	.string "TOM$"

gDefaultGirlName1::
	.ifdef SAPPHIRE
	.string "MARINA$"
	.else
	.string "TERRA$"
	.endif
gDefaultGirlName2::
	.string "KIMMY$"
gDefaultGirlName3::
	.string "NICOLA$"
gDefaultGirlName4::
	.string "SARA$"

gSystemText_IntroWeCall::
	.string "This is what we call\na POKéMON.$"

gSystemText_NewPara:: @ 840DFF7
	.string "\p$"

gDexText_UnknownPoke:: @ 840DFF9
	.string "            ????? POKéMON$" @ why 12 spaces?

gDexText_UnknownHeight:: @ 840E013
	.string "{CLEAR_TO 0x0C}??’??”$"

gDexText_UnknownWeight:: @ 840E01D
	.string "????.? lbs.$"
	.string "$"

gDexText_CryOf:: @ 840E02A
	.string "{CLEAR_TO 2}CRY OF$"
	.string "$"

gDexText_SizeComparedTo:: @ 840E035
	.string "SIZE COMPARED TO $"

gDexText_RegisterComplete:: @ 840E047
	.string "POKéDEX registration completed.$"

gDexText_Searching:: @ 840E067
	.string "Searching...\nPlease wait.$"

gDexText_SearchComplete:: @ 840E081
	.string "Search completed.$"

gDexText_NoMatching:: @ 840E093
	.string "No matching POKéMON were found.$"

DexText_SearchForPoke::
	.string "Search for POKéMON based on\nselected parameters.$"
DexText_SwitchDex::
	.string "Switch POKéDEX listings.$"
DexText_ReturnToDex::
	.string "Return to the POKéDEX.$"
DexText_SelectDexMode::
	.string "Select the POKéDEX mode.$"
DexText_SelectDexList::
	.string "Select the POKéDEX listing mode.$"
DexText_ListByABC::
	.string "List by the first letter in the name.\n/Spotted POKéMON only.$"
DexText_ListByColor::
	.string "List by body color.\n/Spotted POKéMON only.$"
DexText_ListByType::
	.string "List by type.\n/Owned POKéMON only.$"
DexText_ExecuteSearchSwitch::
	.string "Execute search/switch.$"
DexText_HoennDex::
	.string "HOENN DEX$"
DexText_NationalDex::
	.string "NATIONAL DEX$"
DexText_NumericalMode::
	.string "NUMERICAL MODE$"
DexText_ABCMode::
	.string "A TO Z MODE$"
DexText_HeaviestMode::
	.string "HEAVIEST MODE$"
DexText_LightestMode::
	.string "LIGHTEST MODE$"
DexText_TallestMode::
	.string "TALLEST MODE$"
DexText_SmallestMode::
	.string "SMALLEST MODE$"
DexText_ABC::
	.string "ABC$"
DexText_DEF::
	.string "DEF$"
DexText_GHI::
	.string "GHI$"
DexText_JKL::
	.string "JKL$"
DexText_MNO::
	.string "MNO$"
DexText_PQR::
	.string "PQR$"
DexText_STU::
	.string "STU$"
DexText_VWX::
	.string "VWX$"
DexText_YZ::
	.string "YZ$"
DexText_Red::
	.string "RED$"
DexText_Blue::
	.string "BLUE$"
DexText_Yellow::
	.string "YELLOW$"
DexText_Green::
	.string "GREEN$"
DexText_Black::
	.string "BLACK$"
DexText_Brown::
	.string "BROWN$"
DexText_Purple::
	.string "PURPLE$"
DexText_Gray::
	.string "GRAY$"
DexText_White::
	.string "WHITE$"
DexText_Pink::
	.string "PINK$"
DexText_HoennDex2::
	.string "HOENN region’s POKéDEX$"
DexText_NationalDex2::
	.string "National edition POKéDEX$"
DexText_ListByNumber::
	.string "POKéMON are listed according to their\nnumber.$"
DexText_ListByABC2::
	.string "Spotted and owned POKéMON are listed\nalphabetically.$"
DexText_ListByHeavyToLightest::
	.string "Owned POKéMON are listed from the\nheaviest to the lightest.$"
DexText_ListByLightToHeaviest::
	.string "Owned POKéMON are listed from the\nlightest to the heaviest.$"
DexText_ListByTallToSmallest::
	.string "Owned POKéMON are listed from the\ntallest to the smallest.$"
DexText_ListBySmallToTallest::
	.string "Owned POKéMON are listed from the\nsmallest to the tallest.$"
DexText_Terminator5::
	.string "$"
DexText_DontSpecify::
	.string "DON’T SPECIFY.$"
DexText_None::
	.string "NONE$"
DexText_RightPointingTriangle::
	.string "▶$" @ right-pointing triangle
DexText_Terminator6::
	.string " $"

gMenuText_WelcomeToHOFAndDexRating:: @ 840E44F
	.string "Welcome to the HALL OF FAME!$"
	.string "Spotted POKéMON: {STR_VAR_1}!\nOwned POKéMON: {STR_VAR_2}!\pPROF. BIRCH’s POKéDEX rating!\pPROF. BIRCH: Let’s see...\p$"

gMenuText_HOFSaving:: @ 840E4CD
	.string "SAVING...\nDON’T TURN OFF THE POWER.$"

gMenuText_HOFCorrupt:: @ 840E4F1
	.string "The HALL OF FAME data is corrupt.$"

gMenuText_HOFNumber:: @ 840E513
	.string "HALL OF FAME No. $"

gMenuText_HOFCongratulations:: @ 840E525
	.string "LEAGUE CHAMPION!\nCONGRATULATIONS!$"

gOtherText_Number2:: @ 840E547
	.string "No. $"

gOtherText_Level3:: @ 840E54C
	.string "Lv. $"

gOtherText_IDNumber:: @ 840E551
	.string "IDNo. /$"

gOtherText_Name:: @ 840E559
	.string "NAME /$"

gOtherText_IDNumber2:: @ 840E560
	.string "IDNo. /$"

gOtherText_BirchInTrouble:: @ 840E568
	.string "{HIGHLIGHT WHITE2}{COLOR DARK_GREY}PROF. BIRCH is in trouble!\nRelease a POKéMON and rescue him!$"

gOtherText_DoYouChoosePoke:: @ 840E5AB
	.string "{HIGHLIGHT WHITE2}{COLOR DARK_GREY}Do you choose this POKéMON?$"

gOtherText_Poke:: @ 840E5CD
	.string "POKéMON$"

gSystemText_SaveErrorExchangeBackup:: @ 840E5D5
	.string "Save error.\pPlease exchange the\nbackup memory.$"

gOtherText_FlyToWhere:: @ 840E604
	.string "FLY to where?$"

OtherText_Use::
	.string "USE$"
OtherText_Toss::
	.string "TOSS$"
OtherText_Register::
	.string "REGISTER$"
OtherText_Give2::
	.string "GIVE$"
OtherText_CheckTag::
	.string "CHECK TAG$"
OtherText_Confirm::
	.string "CONFIRM$"

gOtherText_Walk:: @ 840E63B
	.string "WALK$"

gUnknownText_Exit:: @ 840E640
	.string "EXIT$"

gOtherText_CancelNoTerminator:: @ 840E645
	.string "CANCEL$"

gOtherText_CancelWithTerminator:: @ 840E64C
	.string "$CANCEL$"

OtherText_Item::
	.string "ITEM$"
OtherText_Mail::
	.string "MAIL$"
OtherText_Take2::
	.string "TAKE$"
OtherText_Store::
	.string "STORE$"

gOtherText_Check:: @ 840E669
	.string "CHECK$"

gOtherText_None:: @ 840E66F
	.string "NONE$"

gOtherText_ThreeQuestions2:: @ 840E674
	.string "???$"

gOtherText_FiveQuestionsAndSlash:: @ 840E678
	.string "?????$"
	.string "/$"

gOtherText_OneDash:: @ 840E680
	.string "-$"

gOtherText_TwoDashes:: @ 840E682
	.string "--$"

gOtherText_ThreeDashes2:: @ 840E685
	.string "---$"

gOtherText_MaleSymbol2:: @ 840E689
	.string "♂$"

gOtherText_FemaleSymbolAndLv:: @ 840E68B
	.string "♀$"
	.string "Lv.$"

gOtherText_TallPlusAndRightArrow:: @ 840E691
	.string "{TALL_PLUS}$"
	.string "{RIGHT_ARROW}$"

gMenuText_GoBackToPrev:: @ 840E697
	.string "Go back to the\nprevious menu.$"

gOtherText_WhatWillYouDo:: @ 840E6B5
	.string "What would you like to do?$"

gOtherText_xString1:: @ 840E6D0
	.string "×{STR_VAR_1}$"

gOtherText_Berry2:: @ 840E6D4
	.string " BERRY$"

gOtherText_Coins2:: @ 840E6DB
	.string "{STR_VAR_1} COINS$"

gOtherText_CloseBag:: @ 840E6E4
	.string "CLOSE BAG$"

OtherText_TheField3::
	.string "the field.$"
OtherText_TheBattle::
	.string "the battle.$"
OtherText_ThePokeList::
	.string "the POKéMON LIST.$"
OtherText_TheShop::
	.string "the shop.$"
OtherText_TheField::
	.string "the field.$"
OtherText_TheField2::
	.string "the field.$"
OtherText_ThePC::
	.string "the PC.$"

	.align 2
gUnknown_0840E740:: @ 840E740
	.4byte OtherText_TheField3
	.4byte OtherText_TheBattle
	.4byte OtherText_ThePokeList
	.4byte OtherText_TheShop
	.4byte OtherText_TheField
	.4byte OtherText_TheField2
	.4byte OtherText_ThePC

gOtherText_ReturnTo:: @ 840E75C
	.string "Return to$"

gOtherText_WhatWillYouDo2:: @ 840E766
	.string "What would you\nlike to do?$"

gOtherText_CantWriteMail:: @ 840E781
	.string "You can’t write\nMAIL here.$"

gOtherText_NoPokemon:: @ 840E79C
	.string "There is no\nPOKéMON.{PAUSE_UNTIL_PRESS}$"

gOtherText_SwitchWhichItem:: @ 840E7B3
	.string "Switch with which\nitem?$"

gOtherText_CantBeHeld:: @ 840E7CB
	.string "{STR_VAR_1} can’t be held.$"

gOtherText_CantBeHeldHere:: @ 840E7DD
	.string "{STR_VAR_1} can’t be held here.$"

gOtherText_HowManyToDeposit:: @ 840E7F4
	.string "How many do you\nwant to deposit?$"

gOtherText_DepositedItems:: @ 840E815
	.string "Deposited {STR_VAR_2}\n{STR_VAR_1}(s).$"

gOtherText_NoRoomForItems:: @ 840E829
	.string "There’s no room to\nstore items.$"

gOtherText_CantStoreSomeoneItem:: @ 840E849
	.string "You can’t store\nsomeone else’s item\nin the PC.$"

gOtherText_TooImportant:: @ 840E878
	.string "That’s much too\nimportant to toss\nout!$"

gOtherText_HowManyToToss:: @ 840E89F
	.string "Toss out how many?$"

gOtherText_ThrewAwayItem:: @ 840E8B2
	.string "Threw away {STR_VAR_2}\n{STR_VAR_1}(s).$"

gOtherText_OkayToThrowAwayPrompt:: @ 840E8C7
	.string "Is it okay to\nthrow away {STR_VAR_2}\n{STR_VAR_1}(s)?$"

gOtherText_DadsAdvice:: @ 840E8EA
	.string "DAD’s advice...\n{PLAYER}, there’s a time and place for\leverything!{PAUSE_UNTIL_PRESS}$"

gOtherText_CantGetOffBike:: @ 840E929
	.string "You can’t dismount your BIKE here.{PAUSE_UNTIL_PRESS}$"

gOtherText_ItemfinderResponding:: @ 840E94E
	.string "Oh!\nThe machine’s responding!\pThere’s an item buried around here!{PAUSE_UNTIL_PRESS}$"

gOtherText_ItemfinderItemUnderfoot:: @ 840E992
	.string "The machine’s indicating something\nright underfoot!{PAUSE_UNTIL_PRESS}$"

gOtherText_NoResponse:: @ 840E9C8
	.string "... ... ... ... Nope!\nThere’s no response.{PAUSE_UNTIL_PRESS}$"

gOtherText_Coins3:: @ 840E9F5
	.string "Your COINS:\n{STR_VAR_1}{PAUSE_UNTIL_PRESS}$"

gOtherText_BootedTM:: @ 840EA06
	.string "Booted up a TM.$"

gOtherText_BootedHM:: @ 840EA16
	.string "Booted up an HM.$"

gOtherText_ContainsMove:: @ 840EA27
	.string "It contained\n{STR_VAR_1}.\pTeach {STR_VAR_1}\nto a POKéMON?$"

gOtherText_UsedItem:: @ 840EA4F
	.string "{PLAYER} used the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gOtherText_RepelLingers:: @ 840EA61
	.string "But the effects of a REPEL lingered\nfrom earlier.{PAUSE_UNTIL_PRESS}$"

gOtherText_UsedFlute:: @ 840EA95
	.string "{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be lured.{PAUSE_UNTIL_PRESS}$"

gOtherText_UsedRepel:: @ 840EAC3
	.string "{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be repelled.{PAUSE_UNTIL_PRESS}$"

gOtherText_BoxIsFull:: @ 840EAF4
	.string "The BOX is full.{PAUSE_UNTIL_PRESS}$"

gOtherText_Size:: @ 840EB07
	.string "SIZE /$"

gOtherText_Firm:: @ 840EB0E
	.string "FIRM /$"

gContestStatsText_Unknown1:: @ 840EB15
	.string "{STR_VAR_1}.{STR_VAR_2}”$"

ContestStatsText_VerySoft::
	.string "Very soft$"
ContestStatsText_Soft::
	.string "Soft$"
ContestStatsText_Hard::
	.string "Hard$"
ContestStatsText_VeryHard::
	.string "Very hard$"
ContestStatsText_SuperHard::
	.string "Super hard$"
ContestStatsText_RedPokeBlock::
	.string "RED {POKEBLOCK}$"
ContestStatsText_BluePokeBlock::
	.string "BLUE {POKEBLOCK}$"
ContestStatsText_PinkPokeBlock::
	.string "PINK {POKEBLOCK}$"
ContestStatsText_GreenPokeBlock::
	.string "GREEN {POKEBLOCK}$"
ContestStatsText_YellowPokeBlock::
	.string "YELLOW {POKEBLOCK}$"
ContestStatsText_PurplePokeBlock::
	.string "PURPLE {POKEBLOCK}$"
ContestStatsText_IndigoPokeBlock::
	.string "INDIGO {POKEBLOCK}$"
ContestStatsText_BrownPokeBlock::
	.string "BROWN {POKEBLOCK}$"
ContestStatsText_LiteBluePokeBlock::
	.string "LITEBLUE {POKEBLOCK}$"
ContestStatsText_OlivePokeBlock::
	.string "OLIVE {POKEBLOCK}$"
ContestStatsText_GrayPokeBlock::
	.string "GRAY {POKEBLOCK}$"
ContestStatsText_BlackPokeBlock::
	.string "BLACK {POKEBLOCK}$"
ContestStatsText_WhitePokeBlock::
	.string "WHITE {POKEBLOCK}$"
ContestStatsText_GoldPokeBlock::
	.string "GOLD {POKEBLOCK}$"

gContestStatsText_Spicy:: @ 840EBED
	.string "SPICY$"

gContestStatsText_Dry:: @ 840EBF3
	.string "DRY$"

gContestStatsText_Sweet:: @ 840EBF7
	.string "SWEET$"

gContestStatsText_Bitter:: @ 840EBFD
	.string "BITTER$"

gContestStatsText_Sour:: @ 840EC04
	.string "SOUR$"
	.string "TASTY$" @ tasty is probably unused, but feel isn't.
	.string "FEEL$"

gContestStatsText_StowCase:: @ 840EC14
	.string "Stow CASE.$"

gContestStatsText_ThrowAwayPrompt:: @ 840EC1F
	.string "Throw away this\n{STR_VAR_1}?$"

gContestStatsText_WasThrownAway:: @ 840EC33
	.string "The {STR_VAR_1}\nwas thrown away.$"

gContestStatsText_NormallyAte:: @ 840EC4B
	.string "{STR_VAR_1} ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gContestStatsText_HappilyAte:: @ 840EC5C
	.string "{STR_VAR_1} happily ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gContestStatsText_DisdainfullyAte:: @ 840EC75
	.string "{STR_VAR_1} disdainfully ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

MartText_Buy::
	.string "BUY$"
MartText_Sell::
	.string "SELL$"
MartText_Quit2::
	.string "QUIT$"

gOtherText_QuitShopping:: @ 840ECA1
	.string "Quit shopping.$"

gOtherText_HowManyYouWant:: @ 840ECB0
	.string "{STR_VAR_1}? Certainly.\nHow many would you like?$"

gOtherText_ThatWillBe:: @ 840ECD8
	.string "{STR_VAR_1}? And you wanted {STR_VAR_2}?\nThat will be ¥{STR_VAR_3}.$"

gOtherText_ThatWillBe2:: @ 840ED01
	.string "{STR_VAR_1}, is it?\nThat’ll be ¥{STR_VAR_2}. Do you want it?$"

gOtherText_ThatWillBe3:: @ 840ED2C
	.string "You wanted {STR_VAR_1}?\nThat’ll be ¥{STR_VAR_2}. Will that be okay?$"

gOtherText_HereYouGo:: @ 840ED5E
	.string "Here you go!\nThank you very much.$"

gOtherText_HereYouGo2:: @ 840ED80
	.string "Thank you!\nI’ll send it to your home PC.$"

gOtherText_HereYouGo3:: @ 840EDA9
	.string "Thanks!\nI’ll send it to your PC at home.$"

gOtherText_NotEnoughMoney:: @ 840EDD2
	.string "You don’t have enough money.{PAUSE_UNTIL_PRESS}$"

gOtherText_NoRoomFor:: @ 840EDF1
	.string "You have no more room for items.{PAUSE_UNTIL_PRESS}$"

gOtherText_SpaceForIsFull:: @ 840EE14
	.string "The space for {STR_VAR_1} is full.{PAUSE_UNTIL_PRESS}$"

gOtherText_AnythingElse:: @ 840EE30
	.string "Is there anything else I can help\nyou with?$"

gOtherText_CanIHelpYou:: @ 840EE5C
	.string "Can I help you with anything else?$"

gOtherText_FreePremierBall:: @ 840EE7F
	.string "I’ll throw in a PREMIER BALL, too.{PAUSE_UNTIL_PRESS}$"

gOtherText_CantBuyThat:: @ 840EEA4
	.string "{STR_VAR_2}? Oh, no.\nI can’t buy that.{PAUSE_UNTIL_PRESS}$"

gOtherText_HowManyToSell:: @ 840EEC4
	.string "{STR_VAR_2}?\nHow many would you like to sell?$"

gOtherText_CanPay:: @ 840EEE9
	.string "I can pay ¥{STR_VAR_1}.\nWould that be okay?$"

gOtherText_SoldItem:: @ 840EF0C
	.string "Turned over the {STR_VAR_2}\nand received ¥{STR_VAR_1}.$"

OtherText_Money::
	.string "¥{STR_VAR_1}$"
OtherText_Shift::
	.string "SHIFT$"
OtherText_SendOut::
	.string "SEND OUT$"
OtherText_Switch2::
	.string "SWITCH$"
OtherText_Summary::
	.string "SUMMARY$"
OtherText_Moves::
	.string "MOVES$"
OtherText_Enter2::
	.string "ENTER$"
OtherText_NoEntry::
	.string "NO ENTRY$"
OtherText_Take::
	.string "TAKE$"
OtherText_Read2::
	.string "READ$"

gOtherText_Hp2:: @ 840EF72
	.string "HP$"

gOtherText_SpAtk2:: @ 840EF75
	.string "SP. ATK$"

gOtherText_SpDef2:: @ 840EF7D
	.string "SP. DEF$"

gOtherText_WontHaveAnyEffect:: @ 840EF85
	.string "It won’t have any effect.{PAUSE_UNTIL_PRESS}$"

gOtherText_CantUseOnPoke:: @ 840EFA1
	.if REVISION >= 1
	.string "This can’t be used on\nthat POKéMON.{PAUSE_UNTIL_PRESS}$"
	.else
	.string "This item can’t be used on\nthat POKéMON.{PAUSE_UNTIL_PRESS}$"
	.endif

gOtherText_CantBeSwitched:: @ 840EFCC
	.string "{STR_VAR_1} can’t be switched\nout!{PAUSE_UNTIL_PRESS}$"

gOtherText_AlreadyBattle:: @ 840EFE8
	.string "{STR_VAR_1} is already\nin battle!{PAUSE_UNTIL_PRESS}$"

gOtherText_AlreadySelected:: @ 840F003
	.string "{STR_VAR_1} has already been\nselected.{PAUSE_UNTIL_PRESS}$"

gOtherText_NoEnergyLeft:: @ 840F023
	.string "{STR_VAR_1} has no energy\nleft to battle!{PAUSE_UNTIL_PRESS}$"

gOtherText_CantSwitchPokeWithYours:: @ 840F046
	.string "You can’t switch {STR_VAR_1}’s\nPOKéMON with one of yours!{PAUSE_UNTIL_PRESS}$"

gOtherText_EGGCantBattle:: @ 840F079
	.string "An EGG can’t battle!{PAUSE_UNTIL_PRESS}$"

gOtherText_CantBeUsedBadge:: @ 840F090
	.string "This can’t be used until a new\nBADGE is obtained.$"

gOtherText_NoMoreThreePoke:: @ 840F0C2
	.string "No more than three POKéMON\nmay enter.$"

gOtherText_SendRemovedMailPrompt:: @ 840F0E8
	.string "Send the removed MAIL to\nyour PC?$"

gOtherText_MailWasSent:: @ 840F10A
	.string "The MAIL was sent to your PC.{PAUSE_UNTIL_PRESS}$"

gOtherText_MailboxIsFull:: @ 840F12A
	.string "Your PC’s MAILBOX is full.{PAUSE_UNTIL_PRESS}$"

gOtherText_MailRemovedMessageLost:: @ 840F147
	.string "If the MAIL is removed, the\nmessage will be lost. Okay?$"

gOtherText_MailMustBeRemoved:: @ 840F17F
	.string "MAIL must be removed before\nholding an item.{PAUSE_UNTIL_PRESS}$"

gOtherText_WasGivenToHold:: @ 840F1AE
	.string "{STR_VAR_1} was given the\n{STR_VAR_2} to hold.{PAUSE_UNTIL_PRESS}$"

gOtherText_AlreadyHolding:: @ 840F1CD
	.string "{STR_VAR_1} is already holding\none {STR_VAR_2}.\pWould you like to switch the\ntwo items?$"

gOtherText_NotHoldingAnything:: @ 840F213
	.string "{STR_VAR_1} isn’t\nholding anything.{PAUSE_UNTIL_PRESS}$"

gOtherText_ReceivedTheThingFrom:: @ 840F230
	.string "Received the {STR_VAR_2}\nfrom {STR_VAR_1}.{PAUSE_UNTIL_PRESS}$"

gOtherText_MailTaken:: @ 840F24B
	.string "MAIL was taken from the\nPOKéMON.{PAUSE_UNTIL_PRESS}$"

gOtherText_TakenAndReplaced:: @ 840F26E
	.string "The {STR_VAR_2} was taken and\nreplaced with the {STR_VAR_1}.{PAUSE_UNTIL_PRESS}$"

gOtherText_PokeHoldingItemCantMail:: @ 840F29B
	.string "This POKéMON is holding an item.\nIt cannot hold MAIL.{PAUSE_UNTIL_PRESS}$"

gOtherText_MailTransferredMailbox:: @ 840F2D3
	.string "MAIL was transferred from\nthe MAILBOX.{PAUSE_UNTIL_PRESS}$"

gOtherText_BagFullCannotRemoveItem:: @ 840F2FC
	.string "The BAG is full. The POKéMON’s\nitem could not be removed.{PAUSE_UNTIL_PRESS}$"

gOtherText_LearnedMove:: @ 840F338
	.string "{STR_VAR_1} learned\n{STR_VAR_2}!$"

gOtherText_NotCompatible:: @ 840F347
	.string "{STR_VAR_1} and {STR_VAR_2}\nare not compatible.\p{STR_VAR_2} can’t be learned.{PAUSE_UNTIL_PRESS}$"

gOtherText_WantsToLearn:: @ 840F37C
	.string "{STR_VAR_1} wants to learn the\nmove {STR_VAR_2}.\pHowever, {STR_VAR_1} already\nknows four moves.\pShould a move be deleted and\nreplaced with {STR_VAR_2}?$"

gOtherText_StopTryingTo:: @ 840F3F0
	.string "Stop trying to teach\n{STR_VAR_2}?$"

gOtherText_DidNotLearnMove2:: @ 840F409
	.string "{STR_VAR_1} did not learn the\nmove {STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gOtherText_WhichMoveToForget2:: @ 840F429
	.string "Which move should be forgotten?{PAUSE_UNTIL_PRESS}$"

gOtherText_ForgetMove123_2:: @ 840F44B
	.string "{PAUSE 32}1, {PAUSE 15}2, and{PAUSE 15}... {PAUSE 15}... {PAUSE 15}... {PAUSE 15}{PLAY_SE SE_KON}Poof!\p{STR_VAR_1} forgot how to\nuse {STR_VAR_2}.\pAnd...{PAUSE_UNTIL_PRESS}$"

gOtherText_AlreadyKnows:: @ 840F49E
	.string "{STR_VAR_1} already knows\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}$"

gOtherText_HPRestoredBy:: @ 840F4B5
	.string "{STR_VAR_1}’s HP was restored by\n{STR_VAR_2} points.{PAUSE_UNTIL_PRESS}$"

gOtherText_CuredPoisoning:: @ 840F4DA
	.string "{STR_VAR_1} was cured of its\npoisoning.{PAUSE_UNTIL_PRESS}$"

gOtherText_CuredParalysis:: @ 840F4FB
	.string "{STR_VAR_1} was cured of\nparalysis.{PAUSE_UNTIL_PRESS}$"

gOtherText_WokeUp:: @ 840F518
	.string "{STR_VAR_1} woke up.{PAUSE_UNTIL_PRESS}$"

gOtherText_BurnHealed:: @ 840F526
	.string "{STR_VAR_1}’s burn was healed.{PAUSE_UNTIL_PRESS}$"

gOtherText_ThawedOut:: @ 840F53E
	.string "{STR_VAR_1} was thawed out.{PAUSE_UNTIL_PRESS}$"

gOtherText_PPRestored:: @ 840F553
	.string "PP was restored.{PAUSE_UNTIL_PRESS}$"

gOtherText_RegainedHealth:: @ 840F566
	.string "{STR_VAR_1} regained health.{PAUSE_UNTIL_PRESS}$"

gOtherText_BecameHealthy:: @ 840F57C
	.string "{STR_VAR_1} became healthy.{PAUSE_UNTIL_PRESS}$"

gOtherText_PPIncreased:: @ 840F591
	.string "{STR_VAR_1}’s PP increased.{PAUSE_UNTIL_PRESS}$"

gOtherText_ElevatedTo:: @ 840F5A6
	.string "{STR_VAR_1} was elevated to\nLv. {STR_VAR_2}.$"

gOtherText_WasRaised:: @ 840F5C1
	.string "{STR_VAR_1}’s {STR_VAR_2} was\nraised.{PAUSE_UNTIL_PRESS}$"

gOtherText_SnapConfusion:: @ 840F5D7
	.string "{STR_VAR_1} snapped out of its\nconfusion.{PAUSE_UNTIL_PRESS}$"

gOtherText_GotOverLove:: @ 840F5FA
	.string "{STR_VAR_1} got over its\ninfatuation.{PAUSE_UNTIL_PRESS}$"

OtherText_ChoosePoke::
	.string "Choose a POKéMON.$"
OtherText_MovePokeTo::
	.string "Move to where?$"
OtherText_TeachWhat::
	.string "Teach which POKéMON?$"
OtherText_UseWhat::
	.string "Use on which POKéMON?$"
OtherText_GiveWhat::
	.string "Give to which POKéMON?$"
OtherText_DoWhat::
	.string "Do what with {STR_VAR_1}?$"
OtherText_NothingToCut::
	.string "There’s nothing to CUT.$"
OtherText_CantSurf::
	.string "You can’t SURF here.$"
OtherText_AlreadySurfing::
	.string "You’re already SURFING.$"
OtherText_CantUseThatHere::
	.string "Can’t use that here.$"
OtherText_RestoreWhatMove::
	.string "Restore which move?$"
OtherText_BoostPP::
	.string "Boost PP of which move?$"
OtherText_DoWhatWithItem::
	.string "Do what with an item?$"
OtherText_NoPokeForBattle::
	.string "No POKéMON for battle!$"
OtherText_ChoosePoke2::
	.string "Choose a POKéMON.$"
OtherText_NotEnoughHP::
	.string "Not enough HP...$"
OtherText_ThreePokeNeeded::
	.string "Three POKéMON are needed.$"
OtherText_PokeCantBeSame::
	.string "POKéMON can’t be the same.$"
OtherText_NoIdenticalHoldItems::
	.string "No identical hold items.$"
OtherText_TeachWhichPoke::
	.string "Teach which POKéMON?$"

gOtherText_Attack:: @ 840F7C6
	.string "ATTACK$"

gOtherText_Defense:: @ 840F7CD
	.string "DEFENSE$"

gOtherText_SpAtk:: @ 840F7D5
	.string "SP. ATK$"

gOtherText_SpDef:: @ 840F7DD
	.string "SP. DEF$"

gOtherText_Speed:: @ 840F7E5
	.string "SPEED$"

gOtherText_HP:: @ 840F7EB
	.string "HP$"

gOtherText_Terminator18:: @ 840F7EE
	.string "$"

gOtherText_OriginalTrainer:: @ 840F7EF
	.string "OT/$"

gOtherText_Type2:: @ 840F7F3
	.string "TYPE/$"

gOtherText_Power2:: @ 840F7F9
	.string "POWER$"

gOtherText_Accuracy2:: @ 840F7FF
	.string "ACCURACY$"

gOtherText_Appeal2:: @ 840F808
	.string "APPEAL$"

gOtherText_Jam2:: @ 840F80F
	.string "JAM$"

gOtherText_Status:: @ 840F813
	.string "STATUS$"

gOtherText_ExpPoints:: @ 840F81A
	.string "EXP. POINTS$"

gOtherText_NextLv:: @ 840F826
	.string "NEXT LV.$"

gOtherText_Ribbons00:: @ 840F82F
	.string "RIBBONS: 00$"

OtherText_Event::
	.string "EVENT$"
OtherText_Switch::
	.string "SWITCH$"
OtherText_PokeInfo::
	.string "POKéMON INFO$"
OtherText_PokeSkills::
	.string "POKéMON SKILLS$"
OtherText_BattleMoves::
	.string "BATTLE MOVES$"
OtherText_ContestMoves::
	.string "C0NTEST MOVES$" @why the l33t 0, that's stupid
OtherText_Info::
	.string "INFO$"

gOtherText_EggLongTime:: @ 840F884
	.string "It looks like this EGG will\ntake a long time to hatch.$"

gOtherText_EggSomeTime:: @ 840F8BB
	.string "What will hatch from this?\nIt will take some time.$"

gOtherText_EggSoon:: @ 840F8EE
	.string "It moves occasionally.\nIt should hatch soon.$"

gOtherText_EggAbout:: @ 840F91B
	.string "It’s making sounds.\nIt’s about to hatch!$"

gOtherText_CantForgetHMs:: @ 840F944
	.string "HM moves can’t be\nforgotten now.$"

gOtherText_PlayersBase:: @ 840F965
	.string "’s BASE$"

gOtherText_OkayToDeleteFromRegistry:: @ 840F96D
	.string "Is it okay to delete {STR_VAR_1}\nfrom the REGISTRY?$"

gOtherText_RegisteredDataDeleted:: @ 840F998
	.string "The registered data was deleted.{PAUSE_UNTIL_PRESS}$"

gSecretBaseText_NoRegistry:: @ 840F9BB
	.string "There is no REGISTRY.{PAUSE_UNTIL_PRESS}$"

SecretBaseText_DelRegist::
	.string "DEL REGIST.$"
SecretBaseText_Decorate::
	.string "DECORATE$"
SecretBaseText_PutAway::
	.string "PUT AWAY$"
SecretBaseText_Toss::
	.string "TOSS$"
SecretBaseText_PutOutDecor::
	.string "Put out the selected decoration item.$"
SecretBaseText_StoreChosenDecor::
	.string "Store the chosen decoration in the PC.$"
SecretBaseText_ThrowAwayDecor::
	.string "Throw away unwanted decorations.$"

gSecretBaseText_NoDecors:: @ 840FA64
	.string "There are no decorations.{PAUSE_UNTIL_PRESS}$"

SecretBaseText_Desk::
	.string "DESK$"
SecretBaseText_Chair::
	.string "CHAIR$"
SecretBaseText_Plant::
	.string "PLANT$"
SecretBaseText_Ornament::
	.string "ORNAMENT$"
SecretBaseText_Mat::
	.string "MAT$"
SecretBaseText_Poster::
	.string "POSTER$"
SecretBaseText_Doll::
	.string "DOLL$"
SecretBaseText_Cushion::
	.string "CUSHION$"

gSecretBaseText_GoldRank:: @ 840FAB2
	.string "GOLD$"

gSecretBaseText_SilverRank:: @ 840FAB7
	.string "SILVER$"

gSecretBaseText_PlaceItHere:: @ 840FABE
	.string "Place it here?$"

gSecretBaseText_CantBePlacedHere:: @ 840FACD
	.string "It can’t be placed here.$"

gSecretBaseText_CancelDecorating:: @ 840FAE6
	.string "Cancel decorating?$"

gSecretBaseText_InUseAlready:: @ 840FAF9
	.string "This is in use already.$"

gSecretBaseText_NoMoreDecor:: @ 840FB11
	.string "No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$"

gSecretBaseText_NoMoreDecor2:: @ 840FB57
	.string "No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$"
	.string "This can’t be placed here.\nIt must be on a DESK, etc.$"

gSecretBaseText_DecorCantPlace:: @ 840FBD3
	.string "This decoration can’t be placed in\nyour own room.$"

gSecretBaseText_DecorInUse:: @ 840FC05
	.string "This decoration is in use.\nIt can’t be thrown away.$"

gSecretBaseText_WillBeDiscarded:: @ 840FC39
	.string "This {STR_VAR_1} will be discarded.\nIs that okay?$"

gSecretBaseText_DecorThrownAway:: @ 840FC62
	.string "The decoration item was thrown away.$"

gSecretBaseText_StopPuttingAwayDecor:: @ 840FC87
	.string "Stop putting away decorations?$"

gSecretBaseText_NoDecor:: @ 840FCA6
	.string "There is no decoration item here.$"

gSecretBaseText_ReturnDecor:: @ 840FCC8
	.string "Return this decoration to the PC?$"

gSecretBaseText_DecorReturned:: @ 840FCEA
	.string "The decoration was returned to the PC.$"

gSecretBaseText_NoDecorInUse:: @ 840FD11
	.string "There are no decorations in use.{PAUSE_UNTIL_PRESS}$"

SecretBaseText_Tristan::
	.string "TRISTAN$"
SecretBaseText_Philip::
	.string "PHILIP$"
SecretBaseText_Dennis::
	.string "DENNIS$"
SecretBaseText_Roberto::
	.string "ROBERTO$"
SecretBaseText_TurnOff::
	.string "TURN OFF$"
SecretBaseText_Decoration::
	.string "DECORATION$"
SecretBaseText_ItemStorage::
	.string "ITEM STORAGE$"

gPCText_Mailbox:: @ 840FD73
	.string "MAILBOX$"

PCText_DepositItem::
	.string "DEPOSIT ITEM$"
PCText_WithdrawItem::
	.string "WITHDRAW ITEM$"
PCText_TossItem::
	.string "TOSS ITEM$"
PCText_StoreItems::
	.string "Store items in the PC.$"
PCText_TakeOutItems::
	.string "Take out items from the PC.$"
PCText_ThrowAwayItems::
	.string "Throw away items stored in the PC.$"

gOtherText_NoItems:: @ 840FDF6
	.string "There are no items.{PAUSE_UNTIL_PRESS}$"

gOtherText_NoMoreRoom:: @ 840FE0C
	.string "There is no more\nroom in the BAG.$"

gOtherText_HowManyToWithdraw:: @ 840FE2E
	.string "How many do you\nwant to withdraw?$"

gOtherText_WithdrewThing:: @ 840FE50
	.string "Withdrew {STR_VAR_2}\n{STR_VAR_1}(s).$"

OtherText_Read::
	.string "READ$"

gOtherText_MoveToBag:: @ 840FE68
	.string "MOVE TO BAG$"

OtherText_Give::
	.string "GIVE$"

gOtherText_NoMailHere:: @ 840FE79
	.string "There’s no MAIL here.{PAUSE_UNTIL_PRESS}$"

gOtherText_WhatWillYouDoMail:: @ 840FE91
	.string "What would you like to do with\n{STR_VAR_1}’s MAIL?$"

gOtherText_MessageWillBeLost:: @ 840FEBB
	.string "The message will be lost.\nIs that okay?$"

gOtherText_BagIsFull:: @ 840FEE3
	.string "The BAG is full.{PAUSE_UNTIL_PRESS}$"

gOtherText_MailWasReturned:: @ 840FEF6
	.string "The MAIL was returned to the BAG\nwith its message erased.{PAUSE_UNTIL_PRESS}$"

gOtherText_Dad:: @ 840FF32
	.string "DAD$"

gOtherText_Mom:: @ 840FF36
	.string "MOM$"

gOtherText_Wallace:: @ 840FF3A
	.string "WALLACE$"

gOtherText_Steven:: @ 840FF42
	.string "STEVEN$"

gOtherText_Brawly:: @ 840FF49
	.string "BRAWLY$"

gOtherText_Winona:: @ 840FF50
	.string "WINONA$"

gOtherText_Phoebe:: @ 840FF57
	.string "PHOEBE$"

gOtherText_Glacia:: @ 840FF5E
	.string "GLACIA$"

gContestText_ContestWinner:: @ 840FF65
	.string "CONTEST WINNER\n$"

gOtherText_Unknown1:: @ 840FF75
	.string "’s $"

OtherText_Cool::
	.string "COOL $"
OtherText_Beauty2::
	.string "BEAUTY $"
OtherText_Cute::
	.string "CUTE $"
OtherText_Smart::
	.string "SMART $"
OtherText_Tough::
	.string "TOUGH $"
OtherText_NonstopSuperCool::
	.string "Nonstop super-cool -\nthe inestimable $"
OtherText_Terminator6::
	.string "$"
OtherText_GoodLookingPoke::
	.string "Hey, there!\nThe good-looking POKéMON $"
OtherText_Terminator7::
	.string "$"
OtherText_MarvelousGreat::
	.string "The marvelous, wonderful, and\nvery great $"
OtherText_Terminator8::
	.string "$"
OtherText_CenturyLastVenus::
	.string "This century’s last Venus -\nthe beautiful $"
OtherText_Terminator9::
	.string "$"
OtherText_Terminator10::
	.string "$"
OtherText_DazzlingSlime::
	.string "’s dazzling,\nglittering smile$"
OtherText_PokeCenterIdol::
	.string "POKéMON CENTER’s super idol -\nthe incomparable $"
OtherText_Terminator11::
	.string "$"
OtherText_LovelyAndSweet::
	.string "The lovely and sweet $"
OtherText_Terminator12::
	.string "$"
OtherText_ThePretty::
	.string "The pretty $"
OtherText_WinningPortrait::
	.string "’s\nwinning portrait$"
OtherText_GiveUsWink::
	.string "Give us a wink!\nThe cutie POKéMON $"
OtherText_Terminator13::
	.string "$"
OtherText_SmartnessMaestro::
	.string "The smartness maestro -\nThe wise POKéMON $"
OtherText_Terminator14::
	.string "$"
OtherText_ChosenPokeAmong::
	.string "The chosen POKéMON -\nThe one among POKéMON $"
OtherText_Terminator15::
	.string "$"
OtherText_TheExcellent::
	.string "The excellent $"
OtherText_ItsMomentOfElegance::
	.string "’s\nmoment of elegance$"
OtherText_PowerfullyMuscular::
	.string "The powerfully muscular\nspeedster $"
OtherText_Terminator16::
	.string "$"
OtherText_StrongErEst::
	.string "The strong, stronger, and\nstrongest $"
OtherText_Terminator17::
	.string "$"
OtherText_MightyTough::
	.string "The mighty tough\nhyper POKéMON $"
OtherText_Exclamation::
	.string "!$"
OtherText_Petalburg::
	.string "PETALBURG$"
OtherText_Slateport::
	.string "SLATEPORT$"
OtherText_Littleroot::
	.string "LITTLEROOT$"
OtherText_Lilycove::
	.string "LILYCOVE$"
OtherText_Dewford::
	.string "DEWFORD$"
OtherText_Enter::
	.string "ENTER$"
OtherText_Info3::
	.string "INFO$"
OtherText_WhatsAContest::
	.string "What’s a CONTEST?$"
OtherText_TypesOfContest::
	.string "Types of CONTESTS$"
OtherText_Ranks::
	.string "Ranks$"
OtherText_Judging::
	.string "Judging$"
OtherText_CoolContest::
	.string "COOL CONTEST$"
OtherText_BeautyContest::
	.string "BEAUTY CONTEST$"
OtherText_CuteContest::
	.string "CUTE CONTEST$"
OtherText_SmartContest::
	.string "SMART CONTEST$"
OtherText_ToughContest::
	.string "TOUGH CONTEST$"
OtherText_Decoration::
	.string "DECORATION$"
OtherText_PackUp::
	.string "PACK UP$"
OtherText_Count::
	.string "COUNT$"
OtherText_Registry::
	.string "REGISTRY$"
OtherText_Information::
	.string "INFORMATION$"
OtherText_Mach::
	.string "MACH$"
OtherText_Acro::
	.string "ACRO$"
OtherText_Poison::
	.string "PSN$"
OtherText_Paralysis::
	.string "PAR$"
OtherText_Sleep::
	.string "SLP$"
OtherText_Burn::
	.string "BRN$"
OtherText_Frozen::
	.string "FRZ$"
OtherText_Quit::
	.string "QUIT$"
OtherText_SawIt::
	.string "Saw it$"
OtherText_NotYet::
	.string "Not yet$"
OtherText_Yes::
	.string "YES$"
OtherText_No::
	.string "NO$"
OtherText_Info2::
	.string "INFO$"
OtherText_SingleBattle::
	.string "SINGLE BATTLE$"
OtherText_DoubleBattle::
	.string "DOUBLE BATTLE$"
OtherText_MultiBattle::
	.string "MULTI BATTLE$"
OtherText_MrBriney::
	.string "MR. BRINEY$"
OtherText_MakeAChallenge::
	.string "Make a challenge.$"
OtherText_ObtainInformation::
	.string "Obtain information.$"
OtherText_Lv50_2::
	.string "LV. 50$"
OtherText_Lv100_2::
	.string "LV. 100$"
OtherText_Zigzagoon::
	.string "ZIGZAGOON$"
OtherText_Nincada::
	.string "NINCADA$"
OtherText_Poochyena::
	.string "POOCHYENA$"
OtherText_Nincada2::
	.string "NINCADA$"
OtherText_Lotad::
	.string "LOTAD$"
OtherText_Roselia::
	.string "ROSELIA$"
OtherText_Shroomish::
	.string "SHROOMISH$"
OtherText_Nincada3::
	.string "NINCADA$"
OtherText_Surskit::
	.string "SURSKIT$"
OtherText_Treecko::
	.string "TREECKO$"
OtherText_Torchic::
	.string "TORCHIC$"
OtherText_Mudkip::
	.string "MUDKIP$"
OtherText_Seedot::
	.string "SEEDOT$"
OtherText_Shroomish2::
	.string "SHROOMISH$"
OtherText_Spinda::
	.string "SPINDA$"
OtherText_Shroomish3::
	.string "SHROOMISH$"
OtherText_Zigzagoon2::
	.string "ZIGZAGOON$"
OtherText_Wurmple::
	.string "WURMPLE$"
OtherText_PokeBall::
	.string "POKé BALL$"
OtherText_SuperPotion::
	.string "SUPER POTION$"
OtherText_SamePrice::
	.string "Same price$"
OtherText_Yen135::
	.string "¥135$"
OtherText_Yen155::
	.string "¥155$"
OtherText_Yen175::
	.string "¥175$"
OtherText_CostMore::
	.string "They will cost more.$"
OtherText_CostLess::
	.string "They will cost less.$"
OtherText_SamePrice2::
	.string "Same price$"
OtherText_MaleSymbol::
	.string "♂$"
OtherText_FemaleSymbol::
	.string "♀$"
OtherText_Neither::
	.string "Neither$"
OtherText_Males::
	.string "Males$"
OtherText_Females::
	.string "Females$"
OtherText_SameNumber::
	.string "Same number$"
OtherText_Male::
	.string "Male$"
OtherText_Female::
	.string "Female$"
OtherText_ItDepends::
	.string "It depends$"
OtherText_Six2::
	.string "6$"
OtherText_Eight2::
	.string "8$"
OtherText_Ten::
	.string "10$"
OtherText_One::
	.string "1$"
OtherText_Two::
	.string "2$"
OtherText_Three::
	.string "3$"
OtherText_Six::
	.string "6$"
OtherText_Seven::
	.string "7$"
OtherText_Eight::
	.string "8$"
OtherText_FreshWater::
	.string "FRESH WATER{CLEAR_TO 0x48}¥200$"
OtherText_SodaPop::
	.string "SODA POP{CLEAR_TO 0x48}¥300$"
OtherText_Lemonade::
	.string "LEMONADE{CLEAR_TO 0x48}¥350$"
OtherText_HowToRide::
	.string "HOW TO RIDE$"
OtherText_HowToTurn::
	.string "HOW TO TURN$"
OtherText_SandySlopes::
	.string "SANDY SLOPES$"
OtherText_Wheelies::
	.string "WHEELIES$"
OtherText_BunnyHops::
	.string "BUNNY-HOPS$"
OtherText_Jumping::
	.string "JUMPING$"
OtherText_Satisfied::
	.string "Satisfied$"
OtherText_Dissatisfied::
	.string "Dissatisfied$"
OtherText_Deepseatooth::
	.string "DEEPSEATOOTH$"
OtherText_Deepseascale::
	.string "DEEPSEASCALE$"
OtherText_BlueFlute2::
	.string "BLUE FLUTE$"
OtherText_YellowFlute2::
	.string "YELLOW FLUTE$"
OtherText_RedFlute2::
	.string "RED FLUTE$"
OtherText_WhiteFlute2::
	.string "WHITE FLUTE$"
OtherText_BlackFlute2::
	.string "BLACK FLUTE$"
OtherText_GlassChair::
	.string "GLASS CHAIR$"
OtherText_GlassDesk::
	.string "GLASS DESK$"
OtherText_TreeckoDoll::
	.string "TREECKO DOLL 1,000 COINS$"
OtherText_TorchicDoll::
	.string "TORCHIC DOLL 1,000 COINS$"
OtherText_MudkipDoll::
	.string "MUDKIP DOLL   1,000 COINS$"
OtherText_50Coins::
	.string "  50 COINS    ¥1,000$"
OtherText_500Coins::
	.string "500 COINS  ¥10,000$"
OtherText_Excellent::
	.string "Excellent!$"
OtherText_NotSoHot::
	.string "Not so hot$"
OtherText_RedShard::
	.string "RED SHARD$"
OtherText_YellowShard::
	.string "YELLOW SHARD$"
OtherText_BlueShard::
	.string "BLUE SHARD$"
OtherText_GreenShard::
	.string "GREEN SHARD$"
OtherText_BattleTower::
	.string "BATTLE TOWER$"
OtherText_Right::
	.string "Right$"
OtherText_Left::
	.string "Left$"
OtherText_TM32::
	.string "TM32  1,500 COINS$"
OtherText_TM29::
	.string "TM29  3,500 COINS$"
OtherText_TM35::
	.string "TM35  4,000 COINS$"
OtherText_TM24::
	.string "TM24  4,000 COINS$"
OtherText_TM13::
	.string "TM13  4,000 COINS$"
OtherText_1F_2::
	.string "1F$"
OtherText_2F_2::
	.string "2F$"
OtherText_3F_2::
	.string "3F$"
OtherText_4F_2::
	.string "4F$"
OtherText_5F_2::
	.string "5F$"
OtherText_Cool2::
	.string "COOL$"
OtherText_Beauty3::
	.string "BEAUTY$"
OtherText_Cute2::
	.string "CUTE$"
OtherText_Smart2::
	.string "SMART$"
OtherText_Tough2::
	.string "TOUGH$"
OtherText_Normal::
	.string "NORMAL$"
OtherText_Super::
	.string "SUPER$"
OtherText_Hyper::
	.string "HYPER$"
OtherText_Master::
	.string "MASTER$"
OtherText_Cool3::
	.string "COOL$"
OtherText_Beauty4::
	.string "BEAUTY$"
OtherText_Cute3::
	.string "CUTE$"
OtherText_Smart3::
	.string "SMART$"
OtherText_Tough3::
	.string "TOUGH$"
OtherText_Items::
	.string "ITEMS$"
OtherText_KeyItems::
	.string "KEY ITEMS$"
OtherText_Balls::
	.string "BALLS$"
OtherText_TMsHMs::
	.string "TMs & HMs$"
OtherText_Berries::
	.string "BERRIES$"

gPCText_SomeonesPC:: @ 8410753
	.string "SOMEONE’S PC$"

gPCText_LanettesPC:: @ 8410760
	.string "LANETTE’S PC$"

gPCText_PlayersPC:: @ 841076D
	.string "{PLAYER}’s PC$"

gPCText_HallOfFame:: @ 8410775
	.string "HALL OF FAME$"

gPCText_LogOff:: @ 8410782
	.string "LOG OFF$"

gOtherText_99Times:: @ 841078A
	.string "99 times +$"

gOtherText_1Minute:: @ 8410795
	.string "1 minute +$"

gOtherText_Seconds:: @ 84107A0
	.string " seconds$"

gOtherText_Times:: @ 84107A9
	.string " times$"
	.string ".$"

gOtherText_BigGuy:: @ 84107B2
	.string "Big guy$"

gOtherText_BigGirl:: @ 84107BA
	.string "Big girl$"

gOtherText_Son:: @ 84107C3
	.string "son$"

gOtherText_Daughter:: @ 84107C7
	.string "daughter$"

OtherText_BlueFlute::
	.string "BLUE FLUTE$"
OtherText_YellowFlute::
	.string "YELLOW FLUTE$"
OtherText_RedFlute::
	.string "RED FLUTE$"
OtherText_WhiteFlute::
	.string "WHITE FLUTE$"
OtherText_BlackFlute::
	.string "BLACK FLUTE$"
OtherText_PrettyChair::
	.string "PRETTY CHAIR$"
OtherText_PrettyDesk::
	.string "PRETTY DESK$"
OtherText_1F::
	.string "1F$"
OtherText_2F::
	.string "2F$"
OtherText_3F::
	.string "3F$"
OtherText_4F::
	.string "4F$"
OtherText_5F::
	.string "5F$"
OtherText_6F::
	.string "6F$"
OtherText_7F::
	.string "7F$"
OtherText_8F::
	.string "8F$"
OtherText_9F::
	.string "9F$"
OtherText_10F::
	.string "10F$"
OtherText_11F::
	.string "11F$"
OtherText_B1F::
	.string "B1F$"
OtherText_B2F::
	.string "B2F$"
OtherText_B3F::
	.string "B3F$"
OtherText_B4F::
	.string "B4F$"
OtherText_Rooftop::
	.string "ROOFTOP$"

gOtherText_NowOn:: @ 841085E
	.string "Now on:$"

gPCText_Cancel:: @ 8410866
	.string "CANCEL$"

PCText_ExitBox::
	.string "Exit from the BOX.$"
PCText_WhatYouDo::
	.string "What would you like to do?$"
PCText_PickATheme::
	.string "Please pick a theme.$"
PCText_PickAWallpaper::
	.string "Please pick out wallpaper.$"
PCText_IsSelected::
	.string " is selected.$"
PCText_JumpToWhichBox::
	.string "Jump to which BOX?$"
PCText_DepositInWhichBox::
	.string "Deposit in which BOX?$"
PCText_WasDeposited::
	.string " was deposited.$"
PCText_BoxIsFull::
	.string "The BOX is full.$"
PCText_ReleasePoke::
	.string "Release this POKéMON?$"
PCText_WasReleased::
	.string " was released.$"
PCText_ByeBye::
	.string "Bye-bye, !$"
PCText_MarkPoke::
	.string "Mark your POKéMON.$"
PCText_LastPoke::
	.string "That’s your last POKéMON!$"
PCText_PartyFull::
	.string "Your party’s full!$"
PCText_HoldingPoke::
	.string "You’re holding a POKéMON!$"
PCText_WhichOneWillTake::
	.string "Which one will you take?$"
PCText_CantReleaseEgg::
	.string "You can’t release an EGG.$"
PCText_ContinueBox::
	.string "Continue BOX operations?$"
PCText_CameBack::
	.string " came back!$"
PCText_Worried::
	.string "Was it worried about you?$"
PCText_Surprise::
	.string "... ... ... ... ...!$"
PCText_PleaseRemoveMail::
	.string "Please remove the MAIL.$"
PCText_Cancel2::
	.string "CANCEL$"
PCText_Deposit::
	.string "DEPOSIT$"
PCText_Withdraw::
	.string "WITHDRAW$"
PCText_Switch::
	.string "SWITCH$"
PCText_Move::
	.string "MOVE$"
PCText_Place::
	.string "PLACE$"
PCText_Summary::
	.string "SUMMARY$"
PCText_Release::
	.string "RELEASE$"
PCText_Mark::
	.string "MARK$"
PCText_Name::
	.string "NAME$"
PCText_Jump::
	.string "JUMP$"
PCText_Wallpaper::
	.string "WALLPAPER$"
PCText_Scenery1::
	.string "SCENERY 1$"
PCText_Scenery2::
	.string "SCENERY 2$"
PCText_Scenery3::
	.string "SCENERY 3$"
PCText_Etc::
	.string "ETCETERA$"
PCText_Forest::
	.string "FOREST$"
PCText_City::
	.string "CITY$"
PCText_Desert::
	.string "DESERT$"
PCText_Savanna::
	.string "SAVANNA$"
PCText_Crag::
	.string "CRAG$"
PCText_Volcano::
	.string "VOLCANO$"
PCText_Snow::
	.string "SNOW$"
PCText_Cave::
	.string "CAVE$"
PCText_Beach::
	.string "BEACH$"
PCText_Seafloor::
	.string "SEAFLOOR$"
PCText_River::
	.string "RIVER$"
PCText_Sky::
	.string "SKY$"
PCText_Polka::
	.string "POLKA-DOT$"
PCText_PokeCenter::
	.string "POKéCENTER$"
PCText_Machine::
	.string "MACHINE$"
PCText_Plain::
	.string "PLAIN$"
PCText_WhatDoYouWant::
	.string "What do you want?$"
PCText_WithdrawPoke::
	.string "WITHDRAW POKéMON$"
PCText_DepositPoke::
	.string "DEPOSIT POKéMON$"
PCText_MovePoke::
	.string "MOVE POKéMON$"
PCText_SeeYa::
	.string "SEE YA!$"
PCText_MovePokeToParty::
	.string "Move POKéMON stored in BOXES to\nyour party.$"
PCText_StorePokeInBox::
	.string "Store POKéMON in your party in BOXES.$"
PCText_OrganizeBoxesParty::
	.string "Organize the POKéMON in BOXES and\nin your party.$"
PCText_ReturnToPrevMenu::
	.string "Return to the previous menu.$"

gPCText_OnlyOne:: @ 8410C1C
	.string "There is just one POKéMON with you.$"

gPCText_PartyFull2:: @ 8410C40
	.string "Your party is full!$"

gPCText_BOX:: @ 8410C54
	.string "BOX$"

PCText_CheckMap::
	.string "{CLEAR 0}Check the map of the HOENN region.$"
PCText_CheckPoke::
	.string "{CLEAR 0}Check POKéMON in detail.$"
PCText_CheckTrainer::
	.string "{CLEAR 0}Check TRAINER information.$"
PCText_CheckRibbons::
	.string "{CLEAR 0}Check obtained RIBBONS.$"
PCText_PutAwayNav::
	.string "{CLEAR 0}Put away the POKéNAV.$"
PCText_NoRibbonWin::
	.string "{CLEAR 0}There are no RIBBON winners.$"
PCText_NoTrainers::
	.string "{CLEAR 0}No TRAINERS are registered.$"
PCText_CheckParty::
	.string "{CLEAR 0}Check party POKéMON in detail.$"
PCText_CheckPokeAll::
	.string "{CLEAR 0}Check all POKéMON in detail.$"
PCText_ReturnToNav::
	.string "{CLEAR 0}Return to the POKéNAV menu.$"
PCText_FindCool::
	.string "{CLEAR 0}Find cool POKéMON.$"
PCText_FindBeauty::
	.string "{CLEAR 0}Find beautiful POKéMON.$"
PCText_FindCute::
	.string "{CLEAR 0}Find cute POKéMON.$"
PCText_FindSmart::
	.string "{CLEAR 0}Find smart POKéMON.$"
PCText_FindTough::
	.string "{CLEAR 0}Find tough POKéMON.$"
PCText_ReturnToCondition::
	.string "{CLEAR 0}Return to the CONDITION menu.$"

gOtherText_NumberRegistered:: @ 8410E22
	.string "No. registered$"

gOtherText_NumberBattles:: @ 8410E31
	.string "No. of battles$"

gOtherText_Strategy:: @ 8410E40
	.string "{PALETTE 5}STRATEGY$"

gOtherText_TrainersPokemon:: @ 8410E4C
	.string "{PALETTE 5}TRAINER’S POKéMON$"

gOtherText_SelfIntroduction:: @ 8410E61
	.string "{PALETTE 5}SELF-INTRODUCTION$"

gOtherText_Nature2:: @ 8410E76
	.string "NATURE/$"

gOtherText_InParty:: @ 8410E7E
	.string "IN PARTY$"

gOtherText_Number:: @ 8410E87
	.string "No. $"

gOtherText_Ribbons:: @ 8410E8C
	.string "RIBBONS$"

OtherText_MakeProfilePage1::
	.string "Make your profile by combining$"
OtherText_MakeProfilePage2::
	.string "four words or phrases.$"
OtherText_MakeMessagePage1::
	.string "Make a message with 6 phrases.$"
OtherText_MakeMessagePage2::
	.string "Max. two 12-letter phrases/line.$"
OtherText_DescribeFeelingsPage1::
	.string "Find words that describe your$"
OtherText_DescribeFeelingsPage2::
	.string "feelings right now.$"
OtherText_WithFourPhrases::
	.string "With four phrases,$"
OtherText_CombineNinePhrasesPage1::
	.string "Combine nine phrases and$"
OtherText_CombineNinePhrasesPage2::
	.string "make a message.$"
OtherText_ImproveBardSongPage1::
	.string "Change just one word or phrase$"
OtherText_ImproveBardSongPage2::
	.string "and improve the BARD’s song.$"
OtherText_YourProfile::
	.string "Your profile $"
OtherText_YourFeelingBattle::
	.string "Your feeling at the battle’s start$"
OtherText_SetWinMessage::
	.string "What you say if you win a battle$"
OtherText_SetLossMessage::
	.string "What you say if you lose a battle$"
OtherText_TheAnswer::
	.string "The answer$"
OtherText_MailMessage::
	.string "The MAIL message$"
OtherText_MailSalutation::
	.string "The MAIL salutation$"
OtherText_NewSong::
	.string "The new song$"
OtherText_CombineTwoPhrasesPage1::
	.string "Combine two phrases and$"
OtherText_CombineTwoPhrasesPage2::
	.string "make a trendy saying.$"
OtherText_ConfirmTrendyPage1::
	.string "The trendy saying$"
OtherText_ConfirmTrendyPage2::
	.string "is as shown. Okay?$"
OtherText_HipsterPage1::
	.string "I’ll combine two phrases and$"
OtherText_HipsterPage2::
	.string "teach you a good saying.$"

gOtherText_TextDeletedConfirmPage1:: @ 84110EE
	.string "All the text being edited will$"

gOtherText_TextDeletedConfirmPage2:: @ 841110D
	.string "be deleted. Is that okay?$"

gOtherText_QuitEditing:: @ 8411127
	.string "Quit editing?$"

gOtherText_EditedTextNoSavePage1:: @ 8411135
	.string "The edited text will not be saved.$"

gOtherText_EditedTextNoSavePage2:: @ 8411158
	.string "Is that okay?$"

gOtherText_EnterAPhraseOrWord:: @ 8411166
	.string "Please enter a phrase or word.$"

gOtherText_TextNoDelete:: @ 8411185
	.string "The entire text can’t be deleted.$"

gOtherText_OnlyOnePhrase:: @ 84111A7
	.string "Only one phrase may be changed.$"

gOtherText_OriginalSongRestored:: @ 84111C7
	.string "The original song will be restored.$"

gOtherText_TrendyAlready:: @ 84111EB
	.string "That’s trendy already!$"

gOtherText_CombineTwoPhrases:: @ 8411202
	.string "Combine two words or phrases.$"

gOtherText_QuitGivingInfo:: @ 8411220
	.string "Quit giving information?$"

gOtherText_StopGivingMail:: @ 8411239
	.string "Stop giving the POKéMON MAIL?$"

gOtherText_Profile:: @ 8411257
	.string "PROFILE$"

gOtherText_AtBattleStart:: @ 841125F
	.string "At the battle’s start.$"

gOtherText_UponWinningBattle:: @ 8411276
	.string "Upon winning a battle.$"

gOtherText_UponLosingBattle:: @ 841128D
	.string "Upon losing a battle.$"

gOtherText_TheBardsSong:: @ 84112A3
	.string "The BARD’s Song$"

gOtherText_WhatsHipHappening:: @ 84112B3
	.string "What’s hip and happening?$"

gOtherText_Interview:: @ 84112CD
	.string "Interview$"

gOtherText_GoodSaying:: @ 84112D7
	.string "Good saying$"

OtherText_SoPretty::
	.string " so pretty!$"
OtherText_SoDarling::
	.string " so darling!$"
OtherText_SoRelaxed::
	.string " so relaxed!$"
OtherText_SoSunny::
	.string " so sunny!$"
OtherText_SoDesirable::
	.string " so desirable!$"
OtherText_SoExciting::
	.string " so exciting!$"
OtherText_SoAmusing::
	.string " so amusing!$"
OtherText_SoMagical::
	.string " so magical!$"

gOtherText_Is:: @ 841134B
	.string " is$"

gOtherText_DontYouAgree:: @ 841134F
	.string "\nDon’t you agree?$"

OtherText_WantVacationNicePlace::
	.string "I so want to go on a vacation.\nWould you happen to know a nice place?$"
OtherText_BoughtCrayonsIsNice::
	.string "I bought crayons with 120 colors!\nDon’t you think that’s nice?$"
OtherText_IfWeCouldFloat::
	.string "Wouldn’t it be nice if we could float\naway on a cloud of bubbles?$"
OtherText_SandWashesAwayMakeSad::
	.string "When you write on a sandy beach,\nthey wash away. It makes me sad.$"
OtherText_WhatsBottomSeaLike::
	.string "What’s the bottom of the sea like?\nJust once I would so love to go!$"
OtherText_SeeSettingSun::
	.string "When you see the setting sun, does it\nmake you want to go home?$"
OtherText_LyingInGreenGrass::
	.string "Lying back in the green grass...\nOh, it’s so, so nice!$"
OtherText_SecretBasesWonderful::
	.string "SECRET BASES are so wonderful!\nCan’t you feel the excitement?$"
OtherText_PokeLeague::
	.string "POKéMON LEAGUE$"
OtherText_PokeCenter::
	.string "POKéMON CENTER$"

gOtherText_GetsAPokeBlock:: @ 8411581
	.string " gets a {POKEBLOCK}?$"

OtherText_Coolness::
	.string "Coolness $"
OtherText_Beauty::
	.string "Beauty $"
OtherText_Cuteness::
	.string "Cuteness $"
OtherText_Smartness::
	.string "Smartness $"
OtherText_Toughness::
	.string "Toughness $"

gOtherText_WasEnhanced:: @ 84115C2
	.string "was enhanced!$"

gOtherText_NothingChanged:: @ 84115D0
	.string "Nothing changed!$"

gOtherText_WontEat:: @ 84115E1
	.string "It won’t eat anymore...$"

gSystemText_SaveFailedBackupCheck:: @ 84115F9
	.string "Save failed.\nChecking the backup memory...\nPlease wait.\n{COLOR RED}“Time required: 1 minute”$"

gSystemText_BackupDamagedGameContinue:: @ 841164E
	.string "The backup memory is damaged or\nthe internal battery has run dry.\nThe game can be played. However,\nprogress cannot be saved.$"

gSystemText_GameplayEnded:: @ 84116CB
	.string "{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen...”$"

gSystemText_CheckCompleteSaveAttempt:: @ 841170F
	.string "Check completed.\nAttempting to save again.\nPlease wait.$"

gSystemText_SaveCompletedGameEnd:: @ 8411747
	.string "Save completed.\n{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen.”$"

gSystemText_SaveCompletedPressA:: @ 8411799
	.string "Save completed.\n{COLOR RED}“Please press the A Button.”$"

gOtherText_Ferry:: @ 84117C9
	.string "FERRY$"

gOtherText_SecretBase:: @ 84117CF
	.string "SECRET BASE$"

gOtherText_Hideout:: @ 84117DB
	.string "HIDEOUT$"

gSystemText_ResetRTCPrompt:: @ 84117E3
	.string "Reset RTC?\nA: Confirm, B: Cancel$"

gSystemText_PresentTime:: @ 8411804
	.string "Present time in game$"

gSystemText_PreviousTime:: @ 8411819
	.string "Previous time in game$"

gSystemText_PleaseResetTime:: @ 841182F
	.string "Please reset the time.$"

gSystemText_ClockResetDataSave:: @ 8411846
	.string "The clock has been reset.\nData will be saved. Please wait.$"

gSystemText_SaveCompleted:: @ 8411881
	.string "Save completed.$"

gSystemText_SaveFailed:: @ 8411891
	.string "Save failed...$"

gSystemText_NoSaveFileNoTime:: @ 84118A0
	.string "There is no save file, so the time\ncan’t be set.$"

gSystemText_ClockAdjustmentUsable:: @ 84118D1
	.string "The in-game clock adjustment system\nis now useable.$"

gSystemText_Saving:: @ 8411905
	.string "SAVING...\nDON’T TURN OFF THE POWER.$"
