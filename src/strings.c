#include "global.h"
#include "strings.h"

#if ENGLISH

// placeholder strings
const u8 gExpandedPlaceholder_Empty[] = _("");
const u8 gExpandedPlaceholder_Kun[] = _("");
const u8 gExpandedPlaceholder_Chan[] = _("");
const u8 gExpandedPlaceholder_Sapphire[] = _("SAPPHIRE");
const u8 gExpandedPlaceholder_Ruby[] = _("RUBY");
const u8 gExpandedPlaceholder_Aqua[] = _("AQUA");
const u8 gExpandedPlaceholder_Magma[] = _("MAGMA");
const u8 gExpandedPlaceholder_Archie[] = _("ARCHIE");
const u8 gExpandedPlaceholder_Maxie[] = _("MAXIE");
const u8 gExpandedPlaceholder_Kyogre[] = _("KYOGRE");
const u8 gExpandedPlaceholder_Groudon[] = _("GROUDON");
const u8 gExpandedPlaceholder_Brendan[] = _("BRENDAN");
const u8 gExpandedPlaceholder_May[] = _("MAY");

// system text
const u8 gSystemText_Egg[] = _("EGG");
const u8 gSystemText_Pokemon2[] = _("POKéMON");

// main menu text
const u8 gMainMenuString_NewGame[] = _("NEW GAME");
const u8 gMainMenuString_Continue[] = _("CONTINUE");
const u8 gMainMenuString_Option[] = _("OPTION");
const u8 gMainMenuString_MysteryEvents[] = _("MYSTERY EVENTS");

// system text 2
const u8 SystemText_UpdatingSaveExternal[] = _("Updating save file using external\ndata. Please wait.");
const u8 SystemText_SaveUpdated[] = _("The save file has been updated.");
const u8 SystemText_SaveUpdatedExchangeBackup[] = _("The save file has been updated.\pFurther game data cannot be saved\nto the backup memory.\pPlease exchange the backup memory.\pFor details, please contact the\nNintendo Service Center.");
const u8 SystemText_SaveNotUpdated[] = _("The save file could not be updated.\pPlease exchange the backup\nmemory.\pFor details, please contact the\nNintendo Service Center.");

// save file text
const u8 gSaveFileCorruptMessage[] = _("The save file is corrupt. The\nprevious save file will be loaded.");
const u8 gSaveFileDeletedMessage[] = _(" The save file has been deleted...");

// system text 3
const u8 gBoardNotInstalledMessage[] = _("The 1M sub-circuit board is\nnot installed.");
const u8 gBatteryDryMessage[] = _("The internal battery has run dry.\nThe game can be played.\pHowever, clock-based events will\nno longer occur.");

// main menu text 2
const u8 gMainMenuString_Player[] = _("PLAYER");
const u8 gMainMenuString_Pokedex[] = _("POKéDEX");
const u8 gMainMenuString_Time[] = _("TIME");
const u8 gMainMenuString_Badges[] = _("BADGES");

// birch text
const u8 gBirchText_Boy[] = _("BOY");
const u8 gBirchText_Girl[] = _("GIRL");
const u8 gBirchText_NewName[] = _("NEW NAME");

#ifdef SAPPHIRE
const u8 gDefaultBoyName1[] = _("SEAN");
#else
const u8 gDefaultBoyName1[] = _("LANDON");
#endif
const u8 gDefaultBoyName2[] = _("TERRY");
const u8 gDefaultBoyName3[] = _("SETH");
const u8 gDefaultBoyName4[] = _("TOM");

#ifdef SAPPHIRE
const u8 gDefaultGirlName1[] = _("MARINA");
#else
const u8 gDefaultGirlName1[] = _("TERRA");
#endif
const u8 gDefaultGirlName2[] = _("KIMMY");
const u8 gDefaultGirlName3[] = _("NICOLA");
const u8 gDefaultGirlName4[] = _("SARA");

const u8 gSystemText_IntroWeCall[] = _("This is what we call\na POKéMON.");
const u8 gSystemText_NewPara[] = _("\p");

const u8 gDexText_UnknownPoke[] = _("            ????? POKéMON");
const u8 gDexText_UnknownHeight[] = _("{CLEAR_TO 0x0C}??’??”");
const u8 gDexText_UnknownWeight[] = _("????.? lbs.$"); // extra terminator?
const u8 gDexText_CryOf[] = _("{CLEAR_TO 2}CRY OF$"); // extra terminator?
const u8 gDexText_SizeComparedTo[] = _("SIZE COMPARED TO ");
const u8 gDexText_RegisterComplete[] = _("POKéDEX registration completed.");
const u8 gDexText_Searching[] = _("Searching...\nPlease wait.");
const u8 gDexText_SearchComplete[] = _("Search completed.");
const u8 gDexText_NoMatching[] = _("No matching POKéMON were found.");

const u8 DexText_SearchForPoke[] = _("Search for POKéMON based on\nselected parameters.");
const u8 DexText_SwitchDex[] = _("Switch POKéDEX listings.");
const u8 DexText_ReturnToDex[] = _("Return to the POKéDEX.");
const u8 DexText_SelectDexMode[] = _("Select the POKéDEX mode.");
const u8 DexText_SelectDexList[] = _("Select the POKéDEX listing mode.");
const u8 DexText_ListByABC[] = _("List by the first letter in the name.\n/Spotted POKéMON only.");
const u8 DexText_ListByColor[] = _("List by body color.\n/Spotted POKéMON only.");
const u8 DexText_ListByType[] = _("List by type.\n/Owned POKéMON only.");
const u8 DexText_ExecuteSearchSwitch[] = _("Execute search/switch.");
const u8 DexText_HoennDex[] = _("HOENN DEX");
const u8 DexText_NationalDex[] = _("NATIONAL DEX");
const u8 DexText_NumericalMode[] = _("NUMERICAL MODE");
const u8 DexText_ABCMode[] = _("A TO Z MODE");
const u8 DexText_HeaviestMode[] = _("HEAVIEST MODE");
const u8 DexText_LightestMode[] = _("LIGHTEST MODE");
const u8 DexText_TallestMode[] = _("TALLEST MODE");
const u8 DexText_SmallestMode[] = _("SMALLEST MODE");
const u8 DexText_ABC[] = _("ABC");
const u8 DexText_DEF[] = _("DEF");
const u8 DexText_GHI[] = _("GHI");
const u8 DexText_JKL[] = _("JKL");
const u8 DexText_MNO[] = _("MNO");
const u8 DexText_PQR[] = _("PQR");
const u8 DexText_STU[] = _("STU");
const u8 DexText_VWX[] = _("VWX");
const u8 DexText_YZ[] = _("YZ");
const u8 DexText_Red[] = _("RED");
const u8 DexText_Blue[] = _("BLUE");
const u8 DexText_Yellow[] = _("YELLOW");
const u8 DexText_Green[] = _("GREEN");
const u8 DexText_Black[] = _("BLACK");
const u8 DexText_Brown[] = _("BROWN");
const u8 DexText_Purple[] = _("PURPLE");
const u8 DexText_Gray[] = _("GRAY");
const u8 DexText_White[] = _("WHITE");
const u8 DexText_Pink[] = _("PINK");
const u8 DexText_HoennDex2[] = _("HOENN region’s POKéDEX");
const u8 DexText_NationalDex2[] = _("National edition POKéDEX");
const u8 DexText_ListByNumber[] = _("POKéMON are listed according to their\nnumber.");
const u8 DexText_ListByABC2[] = _("Spotted and owned POKéMON are listed\nalphabetically.");
const u8 DexText_ListByHeavyToLightest[] = _("Owned POKéMON are listed from the\nheaviest to the lightest.");
const u8 DexText_ListByLightToHeaviest[] = _("Owned POKéMON are listed from the\nlightest to the heaviest.");
const u8 DexText_ListByTallToSmallest[] = _("Owned POKéMON are listed from the\ntallest to the smallest.");
const u8 DexText_ListBySmallToTallest[] = _("Owned POKéMON are listed from the\nsmallest to the tallest.");
const u8 DexText_Terminator5[] = _("");
const u8 DexText_DontSpecify[] = _("DON’T SPECIFY.");
const u8 DexText_None[] = _("NONE");
const u8 DexText_RightPointingTriangle[] = _("▶"); // right pointing triangle
const u8 DexText_Terminator6[] = _(" ");

const u8 gMenuText_WelcomeToHOFAndDexRating[] = _("Welcome to the HALL OF FAME!$Spotted POKéMON: {STR_VAR_1}!\nOwned POKéMON: {STR_VAR_2}!\pPROF. BIRCH’s POKéDEX rating!\pPROF. BIRCH: Let’s see...\p");
const u8 gMenuText_HOFSaving[] = _("SAVING...\nDON’T TURN OFF THE POWER.");
const u8 gMenuText_HOFCorrupt[] = _("The HALL OF FAME data is corrupt.");
const u8 gMenuText_HOFNumber[] = _("HALL OF FAME No. ");
const u8 gMenuText_HOFCongratulations[] = _("LEAGUE CHAMPION!\nCONGRATULATIONS!");

const u8 gOtherText_Number2[] = _("No. ");
const u8 gOtherText_Level3[] = _("Lv. ");
const u8 gOtherText_IDNumber[] = _("IDNo. /");
const u8 gOtherText_Name[] = _("NAME /");
const u8 gOtherText_IDNumber2[] = _("IDNo. /");
const u8 gOtherText_BirchInTrouble[] = _("{HIGHLIGHT WHITE2}{COLOR DARK_GREY}PROF. BIRCH is in trouble!\nRelease a POKéMON and rescue him!");
const u8 gOtherText_DoYouChoosePoke[] = _("{HIGHLIGHT WHITE2}{COLOR DARK_GREY}Do you choose this POKéMON?");
const u8 gOtherText_Poke[] = _("POKéMON");

const u8 gSystemText_SaveErrorExchangeBackup[] = _("Save error.\pPlease exchange the\nbackup memory.");
const u8 gOtherText_FlyToWhere[] = _("FLY to where?");

const u8 OtherText_Use[] = _("USE");
const u8 OtherText_Toss[] = _("TOSS");
const u8 OtherText_Register[] = _("REGISTER");
const u8 OtherText_Give2[] = _("GIVE");
const u8 OtherText_CheckTag[] = _("CHECK TAG");
const u8 OtherText_Confirm[] = _("CONFIRM");
const u8 gOtherText_Walk[] = _("WALK");

const u8 gOtherText_Exit[] = _("EXIT");
const u8 gOtherText_CancelNoTerminator[] = _("CANCEL");
const u8 gOtherText_CancelWithTerminator[] = _("$CANCEL"); // with terminator at beginning?

const u8 OtherText_Item[] = _("ITEM");
const u8 OtherText_Mail[] = _("MAIL");
const u8 OtherText_Take2[] = _("TAKE");
const u8 OtherText_Store[] = _("STORE");

const u8 gOtherText_Check[] = _("CHECK");
const u8 gOtherText_None[] = _("NONE");

const u8 gOtherText_ThreeQuestions2[] = _("???");

const u8 gOtherText_FiveQuestions[] = _("?????");
const u8 gOtherText_Slash[] = _("/");

const u8 gOtherText_OneDash[] = _("-");
const u8 gOtherText_TwoDashes[] = _("--");
const u8 gOtherText_ThreeDashes2[] = _("---");
const u8 gOtherText_MaleSymbol2[] = _("♂");
const u8 gOtherText_FemaleSymbol2[] = _("♀");
const u8 gOtherText_Lv[] = _("Lv.");
const u8 gOtherText_TallPlusAndRightArrow[] = _("{TALL_PLUS}${RIGHT_ARROW}");
const u8 gMenuText_GoBackToPrev[] = _("Go back to the\nprevious menu.");
const u8 gOtherText_WhatWillYouDo[] = _("What would you like to do?");

const u8 gOtherText_xString1[] = _("×{STR_VAR_1}");
const u8 gOtherText_Berry2[] = _(" BERRY");
const u8 gOtherText_Coins2[] = _("{STR_VAR_1} COINS");
const u8 gOtherText_CloseBag[] = _("CLOSE BAG");

const u8 OtherText_TheField3[] = _("the field.");
const u8 OtherText_TheBattle[] = _("the battle.");
const u8 OtherText_ThePokeList[] = _("the POKéMON LIST.");
const u8 OtherText_TheShop[] = _("the shop.");
const u8 OtherText_TheField[] = _("the field.");
const u8 OtherText_TheField2[] = _("the field.");
const u8 OtherText_ThePC[] = _("the PC.");

const u8 *const gUnknown_0840E740[7] =
{
    OtherText_TheField3,
    OtherText_TheBattle,
    OtherText_ThePokeList,
    OtherText_TheShop,
    OtherText_TheField,
    OtherText_TheField2,
    OtherText_ThePC,
};

const u8 gOtherText_ReturnTo[] = _("Return to");
const u8 gOtherText_WhatWillYouDo2[] = _("What would you\nlike to do?");
const u8 gOtherText_CantWriteMail[] = _("You can’t write\nMAIL here.");
const u8 gOtherText_NoPokemon[] = _("There is no\nPOKéMON.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SwitchWhichItem[] = _("Switch with which\nitem?");
const u8 gOtherText_CantBeHeld[] = _("{STR_VAR_1} can’t be held.");
const u8 gOtherText_CantBeHeldHere[] = _("{STR_VAR_1} can’t be held here.");
const u8 gOtherText_HowManyToDeposit[] = _("How many do you\nwant to deposit?");
const u8 gOtherText_DepositedItems[] = _("Deposited {STR_VAR_2}\n{STR_VAR_1}(s).");
const u8 gOtherText_NoRoomForItems[] = _("There’s no room to\nstore items.");
const u8 gOtherText_CantStoreSomeoneItem[] = _("You can’t store\nsomeone else’s item\nin the PC.");
const u8 gOtherText_TooImportant[] = _("That’s much too\nimportant to toss\nout!");
const u8 gOtherText_HowManyToToss[] = _("Toss out how many?");
const u8 gOtherText_ThrewAwayItem[] = _("Threw away {STR_VAR_2}\n{STR_VAR_1}(s).");
const u8 gOtherText_OkayToThrowAwayPrompt[] = _("Is it okay to\nthrow away {STR_VAR_2}\n{STR_VAR_1}(s)?");
const u8 gOtherText_DadsAdvice[] = _("DAD’s advice...\n{PLAYER}, there’s a time and place for\leverything!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantGetOffBike[] = _("You can’t dismount your BIKE here.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ItemfinderResponding[] = _("Oh!\nThe machine’s responding!\pThere’s an item buried around here!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ItemfinderItemUnderfoot[] = _("The machine’s indicating something\nright underfoot!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoResponse[] = _("... ... ... ... Nope!\nThere’s no response.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Coins3[] = _("Your COINS:\n{STR_VAR_1}{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BootedTM[] = _("Booted up a TM.");
const u8 gOtherText_BootedHM[] = _("Booted up an HM.");
const u8 gOtherText_ContainsMove[] = _("It contained\n{STR_VAR_1}.\pTeach {STR_VAR_1}\nto a POKéMON?");
const u8 gOtherText_UsedItem[] = _("{PLAYER} used the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_RepelLingers[] = _("But the effects of a REPEL lingered\nfrom earlier.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_UsedFlute[] = _("{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be lured.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_UsedRepel[] = _("{PLAYER} used the\n{STR_VAR_2}.\pWild POKéMON will be repelled.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BoxIsFull[] = _("The BOX is full.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Size[] = _("SIZE /");
const u8 gOtherText_Firm[] = _("FIRM /");

const u8 gContestStatsText_Unknown1[] = _("{STR_VAR_1}.{STR_VAR_2}”");

const u8 ContestStatsText_VerySoft[] = _("Very soft");
const u8 ContestStatsText_Soft[] = _("Soft");
const u8 ContestStatsText_Hard[] = _("Hard");
const u8 ContestStatsText_VeryHard[] = _("Very hard");
const u8 ContestStatsText_SuperHard[] = _("Super hard");

const u8 ContestStatsText_RedPokeBlock[] = _("RED {POKEBLOCK}");
const u8 ContestStatsText_BluePokeBlock[] = _("BLUE {POKEBLOCK}");
const u8 ContestStatsText_PinkPokeBlock[] = _("PINK {POKEBLOCK}");
const u8 ContestStatsText_GreenPokeBlock[] = _("GREEN {POKEBLOCK}");
const u8 ContestStatsText_YellowPokeBlock[] = _("YELLOW {POKEBLOCK}");
const u8 ContestStatsText_PurplePokeBlock[] = _("PURPLE {POKEBLOCK}");
const u8 ContestStatsText_IndigoPokeBlock[] = _("INDIGO {POKEBLOCK}");
const u8 ContestStatsText_BrownPokeBlock[] = _("BROWN {POKEBLOCK}");
const u8 ContestStatsText_LiteBluePokeBlock[] = _("LITEBLUE {POKEBLOCK}");
const u8 ContestStatsText_OlivePokeBlock[] = _("OLIVE {POKEBLOCK}");
const u8 ContestStatsText_GrayPokeBlock[] = _("GRAY {POKEBLOCK}");
const u8 ContestStatsText_BlackPokeBlock[] = _("BLACK {POKEBLOCK}");
const u8 ContestStatsText_WhitePokeBlock[] = _("WHITE {POKEBLOCK}");
const u8 ContestStatsText_GoldPokeBlock[] = _("GOLD {POKEBLOCK}");

const u8 gContestStatsText_Spicy[] = _("SPICY");
const u8 gContestStatsText_Dry[] = _("DRY");
const u8 gContestStatsText_Sweet[] = _("SWEET");
const u8 gContestStatsText_Bitter[] = _("BITTER");
const u8 gContestStatsText_Sour[] = _("SOUR");
const u8 gContestStatsText_Tasty[] = _("TASTY");
const u8 gContestStatsText_Feel[] = _("FEEL");

const u8 gContestStatsText_StowCase[] = _("Stow CASE.");
const u8 gContestStatsText_ThrowAwayPrompt[] = _("Throw away this\n{STR_VAR_1}?");
const u8 gContestStatsText_WasThrownAway[] = _("The {STR_VAR_1}\nwas thrown away.");
const u8 gContestStatsText_NormallyAte[] = _("{STR_VAR_1} ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");
const u8 gContestStatsText_HappilyAte[] = _("{STR_VAR_1} happily ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");
const u8 gContestStatsText_DisdainfullyAte[] = _("{STR_VAR_1} disdainfully ate the\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");

const u8 MartText_Buy[] = _("BUY");
const u8 MartText_Sell[] = _("SELL");
const u8 MartText_Quit2[] = _("QUIT");

const u8 gOtherText_QuitShopping[] = _("Quit shopping.");

const u8 gOtherText_HowManyYouWant[] = _("{STR_VAR_1}? Certainly.\nHow many would you like?");
const u8 gOtherText_ThatWillBe[] = _("{STR_VAR_1}? And you wanted {STR_VAR_2}?\nThat will be ¥{STR_VAR_3}.");
const u8 gOtherText_ThatWillBe2[] = _("{STR_VAR_1}, is it?\nThat’ll be ¥{STR_VAR_2}. Do you want it?");
const u8 gOtherText_ThatWillBe3[] = _("You wanted {STR_VAR_1}?\nThat’ll be ¥{STR_VAR_2}. Will that be okay?");
const u8 gOtherText_HereYouGo[] = _("Here you go!\nThank you very much.");
const u8 gOtherText_HereYouGo2[] = _("Thank you!\nI’ll send it to your home PC.");
const u8 gOtherText_HereYouGo3[] = _("Thanks!\nI’ll send it to your PC at home.");
const u8 gOtherText_NotEnoughMoney[] = _("You don’t have enough money.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoRoomFor[] = _("You have no more room for items.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SpaceForIsFull[] = _("The space for {STR_VAR_1} is full.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AnythingElse[] = _("Is there anything else I can help\nyou with?");
const u8 gOtherText_CanIHelpYou[] = _("Can I help you with anything else?");
const u8 gOtherText_FreePremierBall[] = _("I’ll throw in a PREMIER BALL, too.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantBuyThat[] = _("{STR_VAR_2}? Oh, no.\nI can’t buy that.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_HowManyToSell[] = _("{STR_VAR_2}?\nHow many would you like to sell?");
const u8 gOtherText_CanPay[] = _("I can pay ¥{STR_VAR_1}.\nWould that be okay?");
const u8 gOtherText_SoldItem[] = _("Turned over the {STR_VAR_2}\nand received ¥{STR_VAR_1}.");

const u8 OtherText_Money[] = _("¥{STR_VAR_1}");
const u8 OtherText_Shift[] = _("SHIFT");
const u8 OtherText_SendOut[] = _("SEND OUT");
const u8 OtherText_Switch2[] = _("SWITCH");
const u8 OtherText_Summary[] = _("SUMMARY");
const u8 OtherText_Moves[] = _("MOVES");
const u8 OtherText_Enter2[] = _("ENTER");
const u8 OtherText_NoEntry[] = _("NO ENTRY");
const u8 OtherText_Take[] = _("TAKE");
const u8 OtherText_Read2[] = _("READ");

const u8 gOtherText_Hp2[] = _("HP");
const u8 gOtherText_SpAtk2[] = _("SP. ATK");
const u8 gOtherText_SpDef2[] = _("SP. DEF");
const u8 gOtherText_WontHaveAnyEffect[] = _("It won’t have any effect.{PAUSE_UNTIL_PRESS}");

#if REVISION >= 1
const u8 gOtherText_CantUseOnPoke[] = _("This can’t be used on\nthat POKéMON.{PAUSE_UNTIL_PRESS}");
#else
const u8 gOtherText_CantUseOnPoke[] = _("This item can’t be used on\nthat POKéMON.{PAUSE_UNTIL_PRESS}");
#endif

const u8 gOtherText_CantBeSwitched[] = _("{STR_VAR_1} can’t be switched\nout!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyBattle[] = _("{STR_VAR_1} is already\nin battle!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadySelected[] = _("{STR_VAR_1} has already been\nselected.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoEnergyLeft[] = _("{STR_VAR_1} has no energy\nleft to battle!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantSwitchPokeWithYours[] = _("You can’t switch {STR_VAR_1}’s\nPOKéMON with one of yours!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_EGGCantBattle[] = _("An EGG can’t battle!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantBeUsedBadge[] = _("This can’t be used until a new\nBADGE is obtained.");
const u8 gOtherText_NoMoreThreePoke[] = _("No more than three POKéMON\nmay enter.");
const u8 gOtherText_SendRemovedMailPrompt[] = _("Send the removed MAIL to\nyour PC?");
const u8 gOtherText_MailWasSent[] = _("The MAIL was sent to your PC.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailboxIsFull[] = _("Your PC’s MAILBOX is full.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailRemovedMessageLost[] = _("If the MAIL is removed, the\nmessage will be lost. Okay?");
const u8 gOtherText_MailMustBeRemoved[] = _("MAIL must be removed before\nholding an item.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WasGivenToHold[] = _("{STR_VAR_1} was given the\n{STR_VAR_2} to hold.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyHolding[] = _("{STR_VAR_1} is already holding\none {STR_VAR_2}.\pWould you like to switch the\ntwo items?");
const u8 gOtherText_NotHoldingAnything[] = _("{STR_VAR_1} isn’t\nholding anything.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ReceivedTheThingFrom[] = _("Received the {STR_VAR_2}\nfrom {STR_VAR_1}.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailTaken[] = _("MAIL was taken from the\nPOKéMON.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_TakenAndReplaced[] = _("The {STR_VAR_2} was taken and\nreplaced with the {STR_VAR_1}.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PokeHoldingItemCantMail[] = _("This POKéMON is holding an item.\nIt cannot hold MAIL.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailTransferredMailbox[] = _("MAIL was transferred from\nthe MAILBOX.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BagFullCannotRemoveItem[] = _("The BAG is full. The POKéMON’s\nitem could not be removed.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_LearnedMove[] = _("{STR_VAR_1} learned\n{STR_VAR_2}!");
const u8 gOtherText_NotCompatible[] = _("{STR_VAR_1} and {STR_VAR_2}\nare not compatible.\p{STR_VAR_2} can’t be learned.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WantsToLearn[] = _("{STR_VAR_1} wants to learn the\nmove {STR_VAR_2}.\pHowever, {STR_VAR_1} already\nknows four moves.\pShould a move be deleted and\nreplaced with {STR_VAR_2}?");
const u8 gOtherText_StopTryingTo[] = _("Stop trying to teach\n{STR_VAR_2}?");
const u8 gOtherText_DidNotLearnMove2[] = _("{STR_VAR_1} did not learn the\nmove {STR_VAR_2}.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WhichMoveToForget2[] = _("Which move should be forgotten?{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ForgetMove123_2[] = _("{PAUSE 32}1, {PAUSE 15}2, and{PAUSE 15}... {PAUSE 15}... {PAUSE 15}... {PAUSE 15}{PLAY_SE SE_KON}Poof!\p{STR_VAR_1} forgot how to\nuse {STR_VAR_2}.\pAnd...{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyKnows[] = _("{STR_VAR_1} already knows\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_HPRestoredBy[] = _("{STR_VAR_1}’s HP was restored by\n{STR_VAR_2} points.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CuredPoisoning[] = _("{STR_VAR_1} was cured of its\npoisoning.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CuredParalysis[] = _("{STR_VAR_1} was cured of\nparalysis.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WokeUp[] = _("{STR_VAR_1} woke up.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BurnHealed[] = _("{STR_VAR_1}’s burn was healed.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ThawedOut[] = _("{STR_VAR_1} was thawed out.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PPRestored[] = _("PP was restored.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_RegainedHealth[] = _("{STR_VAR_1} regained health.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BecameHealthy[] = _("{STR_VAR_1} became healthy.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PPIncreased[] = _("{STR_VAR_1}’s PP increased.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ElevatedTo[] = _("{STR_VAR_1} was elevated to\nLv. {STR_VAR_2}.");
const u8 gOtherText_WasRaised[] = _("{STR_VAR_1}’s {STR_VAR_2} was\nraised.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SnapConfusion[] = _("{STR_VAR_1} snapped out of its\nconfusion.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_GotOverLove[] = _("{STR_VAR_1} got over its\ninfatuation.{PAUSE_UNTIL_PRESS}");
const u8 OtherText_ChoosePoke[] = _("Choose a POKéMON.");
const u8 OtherText_MovePokeTo[] = _("Move to where?");
const u8 OtherText_TeachWhat[] = _("Teach which POKéMON?");
const u8 OtherText_UseWhat[] = _("Use on which POKéMON?");
const u8 OtherText_GiveWhat[] = _("Give to which POKéMON?");
const u8 OtherText_DoWhat[] = _("Do what with {STR_VAR_1}?");
const u8 OtherText_NothingToCut[] = _("There’s nothing to CUT.");
const u8 OtherText_CantSurf[] = _("You can’t SURF here.");
const u8 OtherText_AlreadySurfing[] = _("You’re already SURFING.");
const u8 OtherText_CantUseThatHere[] = _("Can’t use that here.");
const u8 OtherText_RestoreWhatMove[] = _("Restore which move?");
const u8 OtherText_BoostPP[] = _("Boost PP of which move?");
const u8 OtherText_DoWhatWithItem[] = _("Do what with an item?");
const u8 OtherText_NoPokeForBattle[] = _("No POKéMON for battle!");
const u8 OtherText_ChoosePoke2[] = _("Choose a POKéMON.");
const u8 OtherText_NotEnoughHP[] = _("Not enough HP...");
const u8 OtherText_ThreePokeNeeded[] = _("Three POKéMON are needed.");
const u8 OtherText_PokeCantBeSame[] = _("POKéMON can’t be the same.");
const u8 OtherText_NoIdenticalHoldItems[] = _("No identical hold items.");
const u8 OtherText_TeachWhichPoke[] = _("Teach which POKéMON?");
const u8 gOtherText_Attack[] = _("ATTACK");
const u8 gOtherText_Defense[] = _("DEFENSE");
const u8 gOtherText_SpAtk[] = _("SP. ATK");
const u8 gOtherText_SpDef[] = _("SP. DEF");
const u8 gOtherText_Speed[] = _("SPEED");
const u8 gOtherText_HP[] = _("HP");
const u8 gOtherText_Terminator18[] = _("");
const u8 gOtherText_OriginalTrainer[] = _("OT/");
const u8 gOtherText_Type2[] = _("TYPE/");
const u8 gOtherText_Power2[] = _("POWER");
const u8 gOtherText_Accuracy2[] = _("ACCURACY");
const u8 gOtherText_Appeal2[] = _("APPEAL");
const u8 gOtherText_Jam2[] = _("JAM");
const u8 gOtherText_Status[] = _("STATUS");
const u8 gOtherText_ExpPoints[] = _("EXP. POINTS");
const u8 gOtherText_NextLv[] = _("NEXT LV.");
const u8 gOtherText_Ribbons00[] = _("RIBBONS: 00");

const u8 OtherText_Event[] = _("EVENT");
const u8 OtherText_Switch[] = _("SWITCH");
const u8 OtherText_PokeInfo[] = _("POKéMON INFO");
const u8 OtherText_PokeSkills[] = _("POKéMON SKILLS");
const u8 OtherText_BattleMoves[] = _("BATTLE MOVES");
const u8 OtherText_ContestMoves[] = _("C0NTEST MOVES"); // The "O" in "CONTEST" is actually a 0.
const u8 OtherText_Info[] = _("INFO");

const u8 gOtherText_EggLongTime[] = _("It looks like this EGG will\ntake a long time to hatch.");
const u8 gOtherText_EggSomeTime[] = _("What will hatch from this?\nIt will take some time.");
const u8 gOtherText_EggSoon[] = _("It moves occasionally.\nIt should hatch soon.");
const u8 gOtherText_EggAbout[] = _("It’s making sounds.\nIt’s about to hatch!");
const u8 gOtherText_CantForgetHMs[] = _("HM moves can’t be\nforgotten now.");
const u8 gOtherText_PlayersBase[] = _("’s BASE");
const u8 gOtherText_OkayToDeleteFromRegistry[] = _("Is it okay to delete {STR_VAR_1}\nfrom the REGISTRY?");
const u8 gOtherText_RegisteredDataDeleted[] = _("The registered data was deleted.{PAUSE_UNTIL_PRESS}");

const u8 gSecretBaseText_NoRegistry[] = _("There is no REGISTRY.{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_DelRegist[] = _("DEL REGIST.");
const u8 SecretBaseText_Decorate[] = _("DECORATE");
const u8 SecretBaseText_PutAway[] = _("PUT AWAY");
const u8 SecretBaseText_Toss[] = _("TOSS");
const u8 SecretBaseText_PutOutDecor[] = _("Put out the selected decoration item.");
const u8 SecretBaseText_StoreChosenDecor[] = _("Store the chosen decoration in the PC.");
const u8 SecretBaseText_ThrowAwayDecor[] = _("Throw away unwanted decorations.");
const u8 gSecretBaseText_NoDecors[] = _("There are no decorations.{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_Desk[] = _("DESK");
const u8 SecretBaseText_Chair[] = _("CHAIR");
const u8 SecretBaseText_Plant[] = _("PLANT");
const u8 SecretBaseText_Ornament[] = _("ORNAMENT");
const u8 SecretBaseText_Mat[] = _("MAT");
const u8 SecretBaseText_Poster[] = _("POSTER");
const u8 SecretBaseText_Doll[] = _("DOLL");
const u8 SecretBaseText_Cushion[] = _("CUSHION");
const u8 gSecretBaseText_GoldRank[] = _("GOLD");
const u8 gSecretBaseText_SilverRank[] = _("SILVER");
const u8 gSecretBaseText_PlaceItHere[] = _("Place it here?");
const u8 gSecretBaseText_CantBePlacedHere[] = _("It can’t be placed here.");
const u8 gSecretBaseText_CancelDecorating[] = _("Cancel decorating?");
const u8 gSecretBaseText_InUseAlready[] = _("This is in use already.");
const u8 gSecretBaseText_NoMoreDecor[] = _("No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.");
const u8 gSecretBaseText_NoMoreDecor2[] = _("No more decorations can be placed.\nThe most that can be placed is {STR_VAR_1}.$This can’t be placed here.\nIt must be on a DESK, etc.");
const u8 gSecretBaseText_DecorCantPlace[] = _("This decoration can’t be placed in\nyour own room.");
const u8 gSecretBaseText_DecorInUse[] = _("This decoration is in use.\nIt can’t be thrown away.");
const u8 gSecretBaseText_WillBeDiscarded[] = _("This {STR_VAR_1} will be discarded.\nIs that okay?");
const u8 gSecretBaseText_DecorThrownAway[] = _("The decoration item was thrown away.");
const u8 gSecretBaseText_StopPuttingAwayDecor[] = _("Stop putting away decorations?");
const u8 gSecretBaseText_NoDecor[] = _("There is no decoration item here.");
const u8 gSecretBaseText_ReturnDecor[] = _("Return this decoration to the PC?");
const u8 gSecretBaseText_DecorReturned[] = _("The decoration was returned to the PC.");
const u8 gSecretBaseText_NoDecorInUse[] = _("There are no decorations in use.{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_Tristan[] = _("TRISTAN");
const u8 SecretBaseText_Philip[] = _("PHILIP");
const u8 SecretBaseText_Dennis[] = _("DENNIS");
const u8 SecretBaseText_Roberto[] = _("ROBERTO");
const u8 SecretBaseText_TurnOff[] = _("TURN OFF");
const u8 SecretBaseText_Decoration[] = _("DECORATION");
const u8 SecretBaseText_ItemStorage[] = _("ITEM STORAGE");

const u8 gPCText_Mailbox[] = _("MAILBOX");
const u8 PCText_DepositItem[] = _("DEPOSIT ITEM");
const u8 PCText_WithdrawItem[] = _("WITHDRAW ITEM");
const u8 PCText_TossItem[] = _("TOSS ITEM");
const u8 PCText_StoreItems[] = _("Store items in the PC.");
const u8 PCText_TakeOutItems[] = _("Take out items from the PC.");
const u8 PCText_ThrowAwayItems[] = _("Throw away items stored in the PC.");

const u8 gOtherText_NoItems[] = _("There are no items.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoMoreRoom[] = _("There is no more\nroom in the BAG.");
const u8 gOtherText_HowManyToWithdraw[] = _("How many do you\nwant to withdraw?");
const u8 gOtherText_WithdrewThing[] = _("Withdrew {STR_VAR_2}\n{STR_VAR_1}(s).");
const u8 OtherText_Read[] = _("READ");
const u8 gOtherText_MoveToBag[] = _("MOVE TO BAG");
const u8 OtherText_Give[] = _("GIVE");
const u8 gOtherText_NoMailHere[] = _("There’s no MAIL here.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WhatWillYouDoMail[] = _("What would you like to do with\n{STR_VAR_1}’s MAIL?");
const u8 gOtherText_MessageWillBeLost[] = _("The message will be lost.\nIs that okay?");
const u8 gOtherText_BagIsFull[] = _("The BAG is full.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailWasReturned[] = _("The MAIL was returned to the BAG\nwith its message erased.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Dad[] = _("DAD");
const u8 gOtherText_Mom[] = _("MOM");
const u8 gOtherText_Wallace[] = _("WALLACE");
const u8 gOtherText_Steven[] = _("STEVEN");
const u8 gOtherText_Brawly[] = _("BRAWLY");
const u8 gOtherText_Winona[] = _("WINONA");
const u8 gOtherText_Phoebe[] = _("PHOEBE");
const u8 gOtherText_Glacia[] = _("GLACIA");
const u8 gContestText_ContestWinner[] = _("CONTEST WINNER\n");
const u8 gOtherText_Unknown1[] = _("’s ");
const u8 OtherText_Cool[] = _("COOL ");
const u8 OtherText_Beauty2[] = _("BEAUTY ");
const u8 OtherText_Cute[] = _("CUTE ");
const u8 OtherText_Smart[] = _("SMART ");
const u8 OtherText_Tough[] = _("TOUGH ");
const u8 OtherText_NonstopSuperCool[] = _("Nonstop super-cool -\nthe inestimable ");
const u8 OtherText_Terminator6[] = _("");
const u8 OtherText_GoodLookingPoke[] = _("Hey, there!\nThe good-looking POKéMON ");
const u8 OtherText_Terminator7[] = _("");
const u8 OtherText_MarvelousGreat[] = _("The marvelous, wonderful, and\nvery great ");
const u8 OtherText_Terminator8[]= _("");
const u8 OtherText_CenturyLastVenus[]= _("This century’s last Venus -\nthe beautiful ");
const u8 OtherText_Terminator9[]= _("");
const u8 OtherText_Terminator10[]= _("");
const u8 OtherText_DazzlingSmile[]= _("’s dazzling,\nglittering smile");
const u8 OtherText_PokeCenterIdol[]= _("POKéMON CENTER’s super idol -\nthe incomparable ");
const u8 OtherText_Terminator11[]= _("");
const u8 OtherText_LovelyAndSweet[]= _("The lovely and sweet ");
const u8 OtherText_Terminator12[]= _("");
const u8 OtherText_ThePretty[]= _("The pretty ");
const u8 OtherText_WinningPortrait[] = _("’s\nwinning portrait");
const u8 OtherText_GiveUsWink[] = _("Give us a wink!\nThe cutie POKéMON ");
const u8 OtherText_Terminator13[] = _("");
const u8 OtherText_SmartnessMaestro[] = _("The smartness maestro -\nThe wise POKéMON ");
const u8 OtherText_Terminator14[] = _("");
const u8 OtherText_ChosenPokeAmong[] = _("The chosen POKéMON -\nThe one among POKéMON ");
const u8 OtherText_Terminator15[] = _("");
const u8 OtherText_TheExcellent[] = _("The excellent ");
const u8 OtherText_ItsMomentOfElegance[] = _("’s\nmoment of elegance");
const u8 OtherText_PowerfullyMuscular[] = _("The powerfully muscular\nspeedster ");
const u8 OtherText_Terminator16[] = _("");
const u8 OtherText_StrongErEst[] = _("The strong, stronger, and\nstrongest ");
const u8 OtherText_Terminator17[] = _("");
const u8 OtherText_MightyTough[] = _("The mighty tough\nhyper POKéMON ");
const u8 OtherText_Exclamation[] = _("!");
const u8 OtherText_Petalburg[] = _("PETALBURG");
const u8 OtherText_Slateport[] = _("SLATEPORT");
const u8 OtherText_Littleroot[] = _("LITTLEROOT"); // unused contest location?
const u8 OtherText_Lilycove[] = _("LILYCOVE");
const u8 OtherText_Dewford[] = _("DEWFORD");
const u8 OtherText_Enter[] = _("ENTER");
const u8 OtherText_Info3[] = _("INFO");
const u8 OtherText_WhatsAContest[] = _("What’s a CONTEST?");
const u8 OtherText_TypesOfContest[] = _("Types of CONTESTS");
const u8 OtherText_Ranks[] = _("Ranks");
const u8 OtherText_Judging[] = _("Judging");
const u8 OtherText_CoolContest[] = _("COOL CONTEST");
const u8 OtherText_BeautyContest[] = _("BEAUTY CONTEST");
const u8 OtherText_CuteContest[] = _("CUTE CONTEST");
const u8 OtherText_SmartContest[] = _("SMART CONTEST");
const u8 OtherText_ToughContest[] = _("TOUGH CONTEST");
const u8 OtherText_Decoration[] = _("DECORATION");
const u8 OtherText_PackUp[] = _("PACK UP");
const u8 OtherText_Count[] = _("COUNT");
const u8 OtherText_Registry[] = _("REGISTRY");
const u8 OtherText_Information[] = _("INFORMATION");
const u8 OtherText_Mach[] = _("MACH");
const u8 OtherText_Acro[] = _("ACRO");
const u8 OtherText_Poison[] = _("PSN");
const u8 OtherText_Paralysis[] = _("PAR");
const u8 OtherText_Sleep[] = _("SLP");
const u8 OtherText_Burn[] = _("BRN");
const u8 OtherText_Frozen[] = _("FRZ");
const u8 OtherText_Quit[] = _("QUIT");
const u8 OtherText_SawIt[] = _("Saw it");
const u8 OtherText_NotYet[] = _("Not yet");
const u8 OtherText_Yes[] = _("YES");
const u8 OtherText_No[] = _("NO");
const u8 OtherText_Info2[] = _("INFO");
const u8 OtherText_SingleBattle[] = _("SINGLE BATTLE");
const u8 OtherText_DoubleBattle[] = _("DOUBLE BATTLE");
const u8 OtherText_MultiBattle[] = _("MULTI BATTLE");
const u8 OtherText_MrBriney[] = _("MR. BRINEY");
const u8 OtherText_MakeAChallenge[] = _("Make a challenge.");
const u8 OtherText_ObtainInformation[] = _("Obtain information.");
const u8 OtherText_Lv50_2[] = _("LV. 50");
const u8 OtherText_Lv100_2[] = _("LV. 100");
const u8 OtherText_Zigzagoon[] = _("ZIGZAGOON");
const u8 OtherText_Nincada[] = _("NINCADA");
const u8 OtherText_Poochyena[] = _("POOCHYENA");
const u8 OtherText_Nincada2[] = _("NINCADA");
const u8 OtherText_Lotad[] = _("LOTAD");
const u8 OtherText_Roselia[] = _("ROSELIA");
const u8 OtherText_Shroomish[] = _("SHROOMISH");
const u8 OtherText_Nincada3[] = _("NINCADA");
const u8 OtherText_Surskit[] = _("SURSKIT");
const u8 OtherText_Treecko[] = _("TREECKO");
const u8 OtherText_Torchic[] = _("TORCHIC");
const u8 OtherText_Mudkip[] = _("MUDKIP");
const u8 OtherText_Seedot[] = _("SEEDOT");
const u8 OtherText_Shroomish2[] = _("SHROOMISH");
const u8 OtherText_Spinda[] = _("SPINDA");
const u8 OtherText_Shroomish3[] = _("SHROOMISH");
const u8 OtherText_Zigzagoon2[] = _("ZIGZAGOON");
const u8 OtherText_Wurmple[] = _("WURMPLE");
const u8 OtherText_PokeBall[] = _("POKé BALL");
const u8 OtherText_SuperPotion[] = _("SUPER POTION");
const u8 OtherText_SamePrice[] = _("Same price");
const u8 OtherText_Yen135[] = _("¥135");
const u8 OtherText_Yen155[] = _("¥155");
const u8 OtherText_Yen175[] = _("¥175");
const u8 OtherText_CostMore[] = _("They will cost more.");
const u8 OtherText_CostLess[] = _("They will cost less.");
const u8 OtherText_SamePrice2[] = _("Same price");
const u8 OtherText_MaleSymbol[] = _("♂");
const u8 OtherText_FemaleSymbol[] = _("♀");
const u8 OtherText_Neither[] = _("Neither");
const u8 OtherText_Males[] = _("Males");
const u8 OtherText_Females[] = _("Females");
const u8 OtherText_SameNumber[] = _("Same number");
const u8 OtherText_Male[] = _("Male");
const u8 OtherText_Female[] = _("Female");
const u8 OtherText_ItDepends[] = _("It depends");
const u8 OtherText_Six2[] = _("6");
const u8 OtherText_Eight2[] = _("8");
const u8 OtherText_Ten[] = _("10");
const u8 OtherText_One[] = _("1");
const u8 OtherText_Two[] = _("2");
const u8 OtherText_Three[] = _("3");
const u8 OtherText_Six[] = _("6");
const u8 OtherText_Seven[] = _("7");
const u8 OtherText_Eight[] = _("8");
const u8 OtherText_FreshWater[] = _("FRESH WATER{CLEAR_TO 0x48}¥200");
const u8 OtherText_SodaPop[] = _("SODA POP{CLEAR_TO 0x48}¥300");
const u8 OtherText_Lemonade[] = _("LEMONADE{CLEAR_TO 0x48}¥350");
const u8 OtherText_HowToRide[] = _("HOW TO RIDE");
const u8 OtherText_HowToTurn[] = _("HOW TO TURN");
const u8 OtherText_SandySlopes[] = _("SANDY SLOPES");
const u8 OtherText_Wheelies[] = _("WHEELIES");
const u8 OtherText_BunnyHops[] = _("BUNNY-HOPS");
const u8 OtherText_Jumping[] = _("JUMPING");
const u8 OtherText_Satisfied[] = _("Satisfied");
const u8 OtherText_Dissatisfied[] = _("Dissatisfied");
const u8 OtherText_Deepseatooth[] = _("DEEPSEATOOTH");
const u8 OtherText_Deepseascale[] = _("DEEPSEASCALE");
const u8 OtherText_BlueFlute2[] = _("BLUE FLUTE");
const u8 OtherText_YellowFlute2[] = _("YELLOW FLUTE");
const u8 OtherText_RedFlute2[] = _("RED FLUTE");
const u8 OtherText_WhiteFlute2[] = _("WHITE FLUTE");
const u8 OtherText_BlackFlute2[] = _("BLACK FLUTE");
const u8 OtherText_GlassChair[] = _("GLASS CHAIR");
const u8 OtherText_GlassDesk[] = _("GLASS DESK");
const u8 OtherText_TreeckoDoll[] = _("TREECKO DOLL 1,000 COINS");
const u8 OtherText_TorchicDoll[] = _("TORCHIC DOLL 1,000 COINS");
const u8 OtherText_MudkipDoll[] = _("MUDKIP DOLL   1,000 COINS");
const u8 OtherText_50Coins[] = _("  50 COINS    ¥1,000");
const u8 OtherText_500Coins[] = _("500 COINS  ¥10,000");
const u8 OtherText_Excellent[] = _("Excellent!");
const u8 OtherText_NotSoHot[] = _("Not so hot");
const u8 OtherText_RedShard[] = _("RED SHARD");
const u8 OtherText_YellowShard[] = _("YELLOW SHARD");
const u8 OtherText_BlueShard[] = _("BLUE SHARD");
const u8 OtherText_GreenShard[] = _("GREEN SHARD");
const u8 OtherText_BattleTower[] = _("BATTLE TOWER");
const u8 OtherText_Right[] = _("Right");
const u8 OtherText_Left[] = _("Left");
const u8 OtherText_TM32[] = _("TM32  1,500 COINS");
const u8 OtherText_TM29[] = _("TM29  3,500 COINS");
const u8 OtherText_TM35[] = _("TM35  4,000 COINS");
const u8 OtherText_TM24[] = _("TM24  4,000 COINS");
const u8 OtherText_TM13[] = _("TM13  4,000 COINS");
const u8 OtherText_1F_2[] = _("1F");
const u8 OtherText_2F_2[] = _("2F");
const u8 OtherText_3F_2[] = _("3F");
const u8 OtherText_4F_2[] = _("4F");
const u8 OtherText_5F_2[] = _("5F");
const u8 OtherText_Cool2[] = _("COOL");
const u8 OtherText_Beauty3[] = _("BEAUTY");
const u8 OtherText_Cute2[] = _("CUTE");
const u8 OtherText_Smart2[] = _("SMART");
const u8 OtherText_Tough2[] = _("TOUGH");
const u8 OtherText_Normal[] = _("NORMAL");
const u8 OtherText_Super[] = _("SUPER");
const u8 OtherText_Hyper[] = _("HYPER");
const u8 OtherText_Master[] = _("MASTER");
const u8 OtherText_Cool3[] = _("COOL");
const u8 OtherText_Beauty4[] = _("BEAUTY");
const u8 OtherText_Cute3[] = _("CUTE");
const u8 OtherText_Smart3[] = _("SMART");
const u8 OtherText_Tough3[] = _("TOUGH");
const u8 OtherText_Items[] = _("ITEMS");
const u8 OtherText_KeyItems[] = _("KEY ITEMS");
const u8 OtherText_Balls[] = _("BALLS");
const u8 OtherText_TMsHMs[] = _("TMs & HMs");
const u8 OtherText_Berries[] = _("BERRIES");

const u8 gPCText_SomeonesPC[] = _("SOMEONE’S PC");
const u8 gPCText_LanettesPC[] = _("LANETTE’S PC");
const u8 gPCText_PlayersPC[] = _("{PLAYER}’s PC");
const u8 gPCText_HallOfFame[] = _("HALL OF FAME");
const u8 gPCText_LogOff[] = _("LOG OFF");

const u8 gOtherText_99Times[] = _("99 times +");
const u8 gOtherText_1Minute[] = _("1 minute +");
const u8 gOtherText_Seconds[] = _(" seconds");
const u8 gOtherText_Times[] = _(" times$.");
const u8 gOtherText_BigGuy[] = _("Big guy");
const u8 gOtherText_BigGirl[] = _("Big girl");
const u8 gOtherText_Son[] = _("son");
const u8 gOtherText_Daughter[] = _("daughter");
const u8 OtherText_BlueFlute[] = _("BLUE FLUTE");
const u8 OtherText_YellowFlute[] = _("YELLOW FLUTE");
const u8 OtherText_RedFlute[] = _("RED FLUTE");
const u8 OtherText_WhiteFlute[] = _("WHITE FLUTE");
const u8 OtherText_BlackFlute[] = _("BLACK FLUTE");
const u8 OtherText_PrettyChair[] = _("PRETTY CHAIR");
const u8 OtherText_PrettyDesk[] = _("PRETTY DESK");
const u8 OtherText_1F[] = _("1F");
const u8 OtherText_2F[] = _("2F");
const u8 OtherText_3F[] = _("3F");
const u8 OtherText_4F[] = _("4F");
const u8 OtherText_5F[] = _("5F");
const u8 OtherText_6F[] = _("6F");
const u8 OtherText_7F[] = _("7F");
const u8 OtherText_8F[] = _("8F");
const u8 OtherText_9F[] = _("9F");
const u8 OtherText_10F[] = _("10F");
const u8 OtherText_11F[] = _("11F");
const u8 OtherText_B1F[] = _("B1F");
const u8 OtherText_B2F[] = _("B2F");
const u8 OtherText_B3F[] = _("B3F");
const u8 OtherText_B4F[] = _("B4F");
const u8 OtherText_Rooftop[] = _("ROOFTOP");

const u8 gOtherText_NowOn[] = _("Now on:");

const u8 gPCText_Cancel[] = _("CANCEL");

const u8 PCText_ExitBox[] = _("Exit from the BOX.");
const u8 PCText_WhatYouDo[] = _("What would you like to do?");
const u8 PCText_PickATheme[] = _("Please pick a theme.");
const u8 PCText_PickAWallpaper[] = _("Please pick out wallpaper.");
const u8 PCText_IsSelected[] = _(" is selected.");
const u8 PCText_JumpToWhichBox[] = _("Jump to which BOX?");
const u8 PCText_DepositInWhichBox[] = _("Deposit in which BOX?");
const u8 PCText_WasDeposited[] = _(" was deposited.");
const u8 PCText_BoxIsFull[] = _("The BOX is full.");
const u8 PCText_ReleasePoke[] = _("Release this POKéMON?");
const u8 PCText_WasReleased[] = _(" was released.");
const u8 PCText_ByeBye[] = _("Bye-bye, !");
const u8 PCText_MarkPoke[] = _("Mark your POKéMON.");
const u8 PCText_LastPoke[] = _("That’s your last POKéMON!");
const u8 PCText_PartyFull[] = _("Your party’s full!");
const u8 PCText_HoldingPoke[] = _("You’re holding a POKéMON!");
const u8 PCText_WhichOneWillTake[] = _("Which one will you take?");
const u8 PCText_CantReleaseEgg[] = _("You can’t release an EGG.");
const u8 PCText_ContinueBox[] = _("Continue BOX operations?");
const u8 PCText_CameBack[] = _(" came back!");
const u8 PCText_Worried[] = _("Was it worried about you?");
const u8 PCText_Surprise[] = _("... ... ... ... ...!");
const u8 PCText_PleaseRemoveMail[] = _("Please remove the MAIL.");
const u8 PCText_Cancel2[] = _("CANCEL");
const u8 PCText_Deposit[] = _("DEPOSIT");
const u8 PCText_Withdraw[] = _("WITHDRAW");
const u8 PCText_Switch[] = _("SWITCH");
const u8 PCText_Move[] = _("MOVE");
const u8 PCText_Place[] = _("PLACE");
const u8 PCText_Summary[] = _("SUMMARY");
const u8 PCText_Release[] = _("RELEASE");
const u8 PCText_Mark[] = _("MARK");
const u8 PCText_Name[] = _("NAME");
const u8 PCText_Jump[] = _("JUMP");
const u8 PCText_Wallpaper[] = _("WALLPAPER");
const u8 PCText_Scenery1[] = _("SCENERY 1");
const u8 PCText_Scenery2[] = _("SCENERY 2");
const u8 PCText_Scenery3[] = _("SCENERY 3");
const u8 PCText_Etc[] = _("ETCETERA");
const u8 PCText_Forest[] = _("FOREST");
const u8 PCText_City[] = _("CITY");
const u8 PCText_Desert[] = _("DESERT");
const u8 PCText_Savanna[] = _("SAVANNA");
const u8 PCText_Crag[] = _("CRAG");
const u8 PCText_Volcano[] = _("VOLCANO");
const u8 PCText_Snow[] = _("SNOW");
const u8 PCText_Cave[] = _("CAVE");
const u8 PCText_Beach[] = _("BEACH");
const u8 PCText_Seafloor[] = _("SEAFLOOR");
const u8 PCText_River[] = _("RIVER");
const u8 PCText_Sky[] = _("SKY");
const u8 PCText_Polka[] = _("POLKA-DOT");
const u8 PCText_PokeCenter[] = _("POKéCENTER");
const u8 PCText_Machine[] = _("MACHINE");
const u8 PCText_Plain[] = _("PLAIN");
const u8 PCText_WhatDoYouWant[] = _("What do you want?");
const u8 PCText_WithdrawPoke[] = _("WITHDRAW POKéMON");
const u8 PCText_DepositPoke[] = _("DEPOSIT POKéMON");
const u8 PCText_MovePoke[] = _("MOVE POKéMON");
const u8 PCText_SeeYa[] = _("SEE YA!");
const u8 PCText_MovePokeToParty[] = _("Move POKéMON stored in BOXES to\nyour party.");
const u8 PCText_StorePokeInBox[] = _("Store POKéMON in your party in BOXES.");
const u8 PCText_OrganizeBoxesParty[] = _("Organize the POKéMON in BOXES and\nin your party.");
const u8 PCText_ReturnToPrevMenu[] = _("Return to the previous menu.");

const u8 gPCText_OnlyOne[] = _("There is just one POKéMON with you.");
const u8 gPCText_PartyFull2[] = _("Your party is full!");
const u8 gPCText_BOX[] = _("BOX");

// pokenav
const u8 PCText_CheckMap[] = _("{CLEAR 0}Check the map of the HOENN region.");
const u8 PCText_CheckPoke[] = _("{CLEAR 0}Check POKéMON in detail.");
const u8 PCText_CheckTrainer[] = _("{CLEAR 0}Check TRAINER information.");
const u8 PCText_CheckRibbons[] = _("{CLEAR 0}Check obtained RIBBONS.");
const u8 PCText_PutAwayNav[] = _("{CLEAR 0}Put away the POKéNAV.");
const u8 PCText_NoRibbonWin[] = _("{CLEAR 0}There are no RIBBON winners.");
const u8 PCText_NoTrainers[] = _("{CLEAR 0}No TRAINERS are registered.");
const u8 PCText_CheckParty[] = _("{CLEAR 0}Check party POKéMON in detail.");
const u8 PCText_CheckPokeAll[] = _("{CLEAR 0}Check all POKéMON in detail.");
const u8 PCText_ReturnToNav[] = _("{CLEAR 0}Return to the POKéNAV menu.");
const u8 PCText_FindCool[] = _("{CLEAR 0}Find cool POKéMON.");
const u8 PCText_FindBeauty[] = _("{CLEAR 0}Find beautiful POKéMON.");
const u8 PCText_FindCute[] = _("{CLEAR 0}Find cute POKéMON.");
const u8 PCText_FindSmart[] = _("{CLEAR 0}Find smart POKéMON.");
const u8 PCText_FindTough[] = _("{CLEAR 0}Find tough POKéMON.");
const u8 PCText_ReturnToCondition[] = _("{CLEAR 0}Return to the CONDITION menu.");

const u8 gOtherText_NumberRegistered[] = _("No. registered");
const u8 gOtherText_NumberBattles[] = _("No. of battles");
const u8 gOtherText_Strategy[] = _("{PALETTE 5}STRATEGY");
const u8 gOtherText_TrainersPokemon[] = _("{PALETTE 5}TRAINER’S POKéMON");
const u8 gOtherText_SelfIntroduction[] = _("{PALETTE 5}SELF-INTRODUCTION");
const u8 gOtherText_Nature2[] = _("NATURE/");
const u8 gOtherText_InParty[] = _("IN PARTY");
const u8 gOtherText_Number[] = _("No. ");
const u8 gOtherText_Ribbons[] = _("RIBBONS");
const u8 OtherText_MakeProfilePage1[] = _("Make your profile by combining");
const u8 OtherText_MakeProfilePage2[] = _("four words or phrases.");
const u8 OtherText_MakeMessagePage1[] = _("Make a message with 6 phrases.");
const u8 OtherText_MakeMessagePage2[] = _("Max. two 12-letter phrases/line.");
const u8 OtherText_DescribeFeelingsPage1[] = _("Find words that describe your");
const u8 OtherText_DescribeFeelingsPage2[] = _("feelings right now.");
const u8 OtherText_WithFourPhrases[] = _("With four phrases,");
const u8 OtherText_CombineNinePhrasesPage1[] = _("Combine nine phrases and");
const u8 OtherText_CombineNinePhrasesPage2[] = _("make a message.");
const u8 OtherText_ImproveBardSongPage1[] = _("Change just one word or phrase");
const u8 OtherText_ImproveBardSongPage2[] = _("and improve the BARD’s song.");
const u8 OtherText_YourProfile[] = _("Your profile ");
const u8 OtherText_YourFeelingBattle[] = _("Your feeling at the battle’s start");
const u8 OtherText_SetWinMessage[] = _("What you say if you win a battle");
const u8 OtherText_SetLossMessage[] = _("What you say if you lose a battle");
const u8 OtherText_TheAnswer[] = _("The answer");
const u8 OtherText_MailMessage[] = _("The MAIL message");
const u8 OtherText_MailSalutation[] = _("The MAIL salutation");
const u8 OtherText_NewSong[] = _("The new song");
const u8 OtherText_CombineTwoPhrasesPage1[] = _("Combine two phrases and");
const u8 OtherText_CombineTwoPhrasesPage2[] = _("make a trendy saying.");
const u8 OtherText_ConfirmTrendyPage1[] = _("The trendy saying");
const u8 OtherText_ConfirmTrendyPage2[] = _("is as shown. Okay?");
const u8 OtherText_HipsterPage1[] = _("I’ll combine two phrases and");
const u8 OtherText_HipsterPage2[] = _("teach you a good saying.");

const u8 gOtherText_TextDeletedConfirmPage1[] = _("All the text being edited will");
const u8 gOtherText_TextDeletedConfirmPage2[] = _("be deleted. Is that okay?");
const u8 gOtherText_QuitEditing[] = _("Quit editing?");
const u8 gOtherText_EditedTextNoSavePage1[] = _("The edited text will not be saved.");
const u8 gOtherText_EditedTextNoSavePage2[] = _("Is that okay?");
const u8 gOtherText_EnterAPhraseOrWord[] = _("Please enter a phrase or word.");
const u8 gOtherText_TextNoDelete[] = _("The entire text can’t be deleted.");
const u8 gOtherText_OnlyOnePhrase[] = _("Only one phrase may be changed.");
const u8 gOtherText_OriginalSongRestored[] = _("The original song will be restored.");
const u8 gOtherText_TrendyAlready[] = _("That’s trendy already!");
const u8 gOtherText_CombineTwoPhrases[] = _("Combine two words or phrases.");
const u8 gOtherText_QuitGivingInfo[] = _("Quit giving information?");
const u8 gOtherText_StopGivingMail[] = _("Stop giving the POKéMON MAIL?");
const u8 gOtherText_Profile[] = _("PROFILE");
const u8 gOtherText_AtBattleStart[] = _("At the battle’s start.");
const u8 gOtherText_UponWinningBattle[] = _("Upon winning a battle.");
const u8 gOtherText_UponLosingBattle[] = _("Upon losing a battle.");

// mauville_man?
const u8 gOtherText_TheBardsSong[] = _("The BARD’s Song");
const u8 gOtherText_WhatsHipHappening[] = _("What’s hip and happening?");
const u8 gOtherText_Interview[] = _("Interview");
const u8 gOtherText_GoodSaying[] = _("Good saying");
const u8 OtherText_SoPretty[] = _(" so pretty!");
const u8 OtherText_SoDarling[] = _(" so darling!");
const u8 OtherText_SoRelaxed[] = _(" so relaxed!");
const u8 OtherText_SoSunny[] = _(" so sunny!");
const u8 OtherText_SoDesirable[] = _(" so desirable!");
const u8 OtherText_SoExciting[] = _(" so exciting!");
const u8 OtherText_SoAmusing[] = _(" so amusing!");
const u8 OtherText_SoMagical[] = _(" so magical!");

const u8 gOtherText_Is[] = _(" is");
const u8 gOtherText_DontYouAgree[] = _("\nDon’t you agree?");

const u8 OtherText_WantVacationNicePlace[] = _("I so want to go on a vacation.\nWould you happen to know a nice place?");
const u8 OtherText_BoughtCrayonsIsNice[] = _("I bought crayons with 120 colors!\nDon’t you think that’s nice?");
const u8 OtherText_IfWeCouldFloat[] = _("Wouldn’t it be nice if we could float\naway on a cloud of bubbles?");
const u8 OtherText_SandWashesAwayMakeSad[] = _("When you write on a sandy beach,\nthey wash away. It makes me sad.");
const u8 OtherText_WhatsBottomSeaLike[] = _("What’s the bottom of the sea like?\nJust once I would so love to go!");
const u8 OtherText_SeeSettingSun[] = _("When you see the setting sun, does it\nmake you want to go home?");
const u8 OtherText_LyingInGreenGrass[] = _("Lying back in the green grass...\nOh, it’s so, so nice!");
const u8 OtherText_SecretBasesWonderful[] = _("SECRET BASES are so wonderful!\nCan’t you feel the excitement?");

const u8 OtherText_PokeLeague[] = _("POKéMON LEAGUE");
const u8 OtherText_PokeCenter[] = _("POKéMON CENTER");

const u8 gOtherText_GetsAPokeBlock[] = _(" gets a {POKEBLOCK}?");

const u8 OtherText_Coolness[] = _("Coolness ");
const u8 OtherText_Beauty[] = _("Beauty ");
const u8 OtherText_Cuteness[] = _("Cuteness ");
const u8 OtherText_Smartness[] = _("Smartness ");
const u8 OtherText_Toughness[] = _("Toughness ");

const u8 gOtherText_WasEnhanced[] = _("was enhanced!");
const u8 gOtherText_NothingChanged[] = _("Nothing changed!");
const u8 gOtherText_WontEat[] = _("It won’t eat anymore...");

const u8 gSystemText_SaveFailedBackupCheck[] = _("Save failed.\nChecking the backup memory...\nPlease wait.\n{COLOR RED}“Time required: 1 minute”");
const u8 gSystemText_BackupDamagedGameContinue[] = _("The backup memory is damaged or\nthe internal battery has run dry.\nThe game can be played. However,\nprogress cannot be saved.");
const u8 gSystemText_GameplayEnded[] = _("{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen...”");
const u8 gSystemText_CheckCompleteSaveAttempt[] = _("Check completed.\nAttempting to save again.\nPlease wait.");
const u8 gSystemText_SaveCompletedGameEnd[] = _("Save completed.\n{COLOR RED}“Gameplay cannot be continued.\nReturning to the title screen.”");
const u8 gSystemText_SaveCompletedPressA[] = _("Save completed.\n{COLOR RED}“Please press the A Button.”");

const u8 gOtherText_Ferry[] = _("FERRY");
const u8 gOtherText_SecretBase[] = _("SECRET BASE");
const u8 gOtherText_Hideout[] = _("HIDEOUT");

const u8 gSystemText_ResetRTCPrompt[] = _("Reset RTC?\nA: Confirm, B: Cancel");
const u8 gSystemText_PresentTime[] = _("Present time in game");
const u8 gSystemText_PreviousTime[] = _("Previous time in game");
const u8 gSystemText_PleaseResetTime[] = _("Please reset the time.");
const u8 gSystemText_ClockResetDataSave[] = _("The clock has been reset.\nData will be saved. Please wait.");
const u8 gSystemText_SaveCompleted[] = _("Save completed.");
const u8 gSystemText_SaveFailed[] = _("Save failed...");
const u8 gSystemText_NoSaveFileNoTime[] = _("There is no save file, so the time\ncan’t be set.");
const u8 gSystemText_ClockAdjustmentUsable[] = _("The in-game clock adjustment system\nis now useable.");
const u8 gSystemText_Saving[] = _("SAVING...\nDON’T TURN OFF THE POWER.");

#elif GERMAN

// placeholder strings
const u8 gExpandedPlaceholder_Empty[] = _("");
const u8 gExpandedPlaceholder_Kun[] = _("");
const u8 gExpandedPlaceholder_Chan[] = _("");
const u8 gExpandedPlaceholder_Sapphire[] = _("SAPHIR");
const u8 gExpandedPlaceholder_Ruby[] = _("RUBIN");
const u8 gExpandedPlaceholder_Aqua[] = _("AQUA");
const u8 gExpandedPlaceholder_Magma[] = _("MAGMA");
const u8 gExpandedPlaceholder_Archie[] = _("ADRIAN");
const u8 gExpandedPlaceholder_Maxie[] = _("MARC");
const u8 gExpandedPlaceholder_Kyogre[] = _("KYOGRE");
const u8 gExpandedPlaceholder_Groudon[] = _("GROUDON");
const u8 gExpandedPlaceholder_Brendan[] = _("BRIX");
const u8 gExpandedPlaceholder_May[] = _("MAIKE");

// system text
const u8 gSystemText_Egg[] = _("EI");
const u8 gSystemText_Pokemon2[] = _("POKéMON");

// main menu text
const u8 gMainMenuString_NewGame[] = _("NEUES SPIEL");
const u8 gMainMenuString_Continue[] = _("WEITER");
const u8 gMainMenuString_Option[] = _("OPTIONEN");
const u8 gMainMenuString_MysteryEvents[] = _("GEHEIMGESCHEHEN");

// system text 2
const u8 SystemText_UpdatingSaveExternal[] = _("Neuer Spielstand mittels Übertra-\ngung externer Daten. Bitte warten.");
const u8 SystemText_SaveUpdated[] = _("Der Spielstand wurde erneuert.");
const u8 SystemText_SaveUpdatedExchangeBackup[] = _("Der Spielstand wurde gespeichert.\pDas Backup Memory kann keine \nweiteren Spieldaten sichern.\pBitte Backup Memory austauschen.\pBei Fragen bitte an die Nintendo\nKonsumentenberatung wenden.");
const u8 SystemText_SaveNotUpdated[] = _("Spielstand wurde nicht gesichert.\pBitte Backup Memory \naustauschen.\pBei Fragen bitte an die Nintendo\nKonsumentenberatung wenden.");

// save file text
const u8 gSaveFileCorruptMessage[] = _("Der Spielstand ist beschädigt. Der\nvorherige Spielstand wird geladen.");
const u8 gSaveFileDeletedMessage[] = _("Der Spielstand wurde gelöscht.");

// system text 3
const u8 gBoardNotInstalledMessage[] = _("Das ‘1M Sub-circuit Board’\nist nicht installiert.");
const u8 gBatteryDryMessage[] = _("Interne Batterie ist verbraucht.\nSpiel kann fortgesetzt werden.\pAber zeitbasierende Spiel-Events\nwerden nicht mehr initiiert.");

// main menu text 2
const u8 gMainMenuString_Player[] = _("SPIELER");
const u8 gMainMenuString_Pokedex[] = _("POKéDEX");
const u8 gMainMenuString_Time[] = _("SPIELZEIT");
const u8 gMainMenuString_Badges[] = _("ORDEN");

// birch text
const u8 gBirchText_Boy[] = _("JUNGE");
const u8 gBirchText_Girl[] = _("MÄDEL");
const u8 gBirchText_NewName[] = _("NEUER NAME");

#ifdef SAPPHIRE
const u8 gDefaultBoyName1[] = _("SEBOLD");
#else
const u8 gDefaultBoyName1[] = _("ROLAND");
#endif
const u8 gDefaultBoyName2[] = _("DANIEL");
const u8 gDefaultBoyName3[] = _("HELGE");
const u8 gDefaultBoyName4[] = _("JAN");

#ifdef SAPPHIRE
const u8 gDefaultGirlName1[] = _("MARTINA");
#else
const u8 gDefaultGirlName1[] = _("PETRA");
#endif
const u8 gDefaultGirlName2[] = _("TANJA");
const u8 gDefaultGirlName3[] = _("ANDREA");
const u8 gDefaultGirlName4[] = _("SARA");

const u8 gSystemText_IntroWeCall[] = _("Dies ist ein so genanntes\n“POKéMON”.");
const u8 gSystemText_NewPara[] = _("\p");

const u8 gDexText_UnknownPoke[] = _("?????");
const u8 gDexText_UnknownHeight[] = _("???,?  m");
const u8 gDexText_UnknownWeight[] = _("???,?  kg$");
const u8 gDexText_CryOf[] = _("{CLEAR_TO 2}RUF VON$");
const u8 gDexText_SizeComparedTo[] = _("GRÖSSE IM VERGLEICH ZU ");
const u8 gDexText_RegisterComplete[] = _("Neuer Eintrag aufgenommen.");
const u8 gDexText_Searching[] = _("Suche läuft.\nBitte warten...");
const u8 gDexText_SearchComplete[] = _("Suche beendet.");
const u8 gDexText_NoMatching[] = _("Es wurde keine Übereinstimmung ermittelt.");

const u8 DexText_SearchForPoke[] = _("Suche nach POKéMON anhand\nausgewählter Parameter.");
const u8 DexText_SwitchDex[] = _("Ordnungssystem des POKéDEX ändern.");
const u8 DexText_ReturnToDex[] = _("Kehre zurück zum POKéDEX.");
const u8 DexText_SelectDexMode[] = _("Wähle einen POKéDEX.");
const u8 DexText_SelectDexList[] = _("Wähle ein Ordnungssystem des POKéDEX.");
const u8 DexText_ListByABC[] = _("Nach Anfangsbuchstaben suchen.\n(Alle gesehenen POKéMON.)");
const u8 DexText_ListByColor[] = _("Nach Körperfarbe suchen.\n(Alle gesehenen POKéMON.)");
const u8 DexText_ListByType[] = _("Nach Elementklasse suchen.\n(Nur gefangene POKéMON.)");
const u8 DexText_ExecuteSearchSwitch[] = _("Suche/Ändern ausführen.");
const u8 DexText_HoennDex[] = _("HOENN DEX");
const u8 DexText_NationalDex[] = _("NATIONALER DEX");
const u8 DexText_NumericalMode[] = _("NUMERISCH");
const u8 DexText_ABCMode[] = _("VON A BIS Z");
const u8 DexText_HeaviestMode[] = _("NACH GEWICHT {0x86}");
const u8 DexText_LightestMode[] = _("NACH GEWICHT {0x85}");
const u8 DexText_TallestMode[] = _("NACH GRÖSSE {0x86}");
const u8 DexText_SmallestMode[] = _("NACH GRÖSSE {0x85}");
const u8 DexText_ABC[] = _("ABC");
const u8 DexText_DEF[] = _("DEF");
const u8 DexText_GHI[] = _("GHI");
const u8 DexText_JKL[] = _("JKL");
const u8 DexText_MNO[] = _("MNO");
const u8 DexText_PQR[] = _("PQR");
const u8 DexText_STU[] = _("STU");
const u8 DexText_VWX[] = _("VWX");
const u8 DexText_YZ[] = _("YZ");
const u8 DexText_Red[] = _("ROT");
const u8 DexText_Blue[] = _("BLAU");
const u8 DexText_Yellow[] = _("GELB");
const u8 DexText_Green[] = _("GRÜN");
const u8 DexText_Black[] = _("SCHWARZ");
const u8 DexText_Brown[] = _("BRAUN");
const u8 DexText_Purple[] = _("LILA");
const u8 DexText_Gray[] = _("GRAU");
const u8 DexText_White[] = _("WEISS");
const u8 DexText_Pink[] = _("ROSA");
const u8 DexText_HoennDex2[] = _("POKéDEX von HOENN");
const u8 DexText_NationalDex2[] = _("POKéDEX, erweiterte Edition");
const u8 DexText_ListByNumber[] = _("POKéMON werden anhand ihrer\nNummer sortiert.");
const u8 DexText_ListByABC2[] = _("Gesehene und gefangene POKéMON\nwerden alphabetisch geordnet.");
const u8 DexText_ListByHeavyToLightest[] = _("Gefangene POKéMON werden nach Gewicht\nsortiert, beginnend mit dem schwersten.");
const u8 DexText_ListByLightToHeaviest[] = _("Gefangene POKéMON werden nach Gewicht\nsortiert, beginnend mit dem leichtesten.");
const u8 DexText_ListByTallToSmallest[] = _("Gefangene POKéMON werden nach Größe\nsortiert, beginnend mit dem größten.");
const u8 DexText_ListBySmallToTallest[] = _("Gefangene POKéMON werden nach Größe\nsortiert, beginnend mit dem kleinsten.");
const u8 DexText_Terminator5[] = _("");
const u8 DexText_DontSpecify[] = _("KEINE ANGABE");
const u8 DexText_None[] = _("KEINER");
const u8 DexText_RightPointingTriangle[] = _("▶");
const u8 DexText_Terminator6[] = _(" ");

const u8 gMenuText_WelcomeToHOFAndDexRating[] = _("Willkommen in der RUHMESHALLE!$Gesehene POKéMON: {STR_VAR_1}!\nGefangene POKéMON: {STR_VAR_2}!\pPROF. BIRKs POKéDEX-Bewertung!\pPROF. BIRK: Sehen wir mal...\p");
const u8 gMenuText_HOFSaving[] = _("SPEICHERVORGANG...\nDAS GERÄT NICHT AUSSCHALTEN!");
const u8 gMenuText_HOFCorrupt[] = _("Die RH-Daten sind beschädigt.");
const u8 gMenuText_HOFNumber[] = _("RUHMESHALLE, Nr. ");
const u8 gMenuText_HOFCongratulations[] = _("CHAMP der POKéMON LIGA!\nHerzlichen Glückwunsch!");

const u8 gOtherText_Number2[] = _("Nr.");
const u8 gOtherText_Level3[] = _("Lv.");
const u8 gOtherText_IDNumber[] = _("ID.Nr. /");
const u8 gOtherText_Name[] = _("NAME /");
const u8 gOtherText_IDNumber2[] = _("ID.Nr. /");
const u8 gOtherText_BirchInTrouble[] = _("{HIGHLIGHT WHITE2}{COLOR DARK_GREY}PROF. BIRK ist in Schwierigkeiten!\nSchnapp’ dir ein POKéMON und hilf ihm!");
const u8 gOtherText_DoYouChoosePoke[] = _("{HIGHLIGHT WHITE2}{COLOR DARK_GREY}Wählst du dieses POKéMON?");
const u8 gOtherText_Poke[] = _("POKéMON");

const u8 gSystemText_SaveErrorExchangeBackup[] = _("Fehler beim Speichern!\pBitte Backup Memory\naustauschen.");
const u8 gOtherText_FlyToWhere[] = _("Wohin willst du FLIEGEN?");

const u8 OtherText_Use[] = _("O.K.");
const u8 OtherText_Toss[] = _("MÜLL");
const u8 OtherText_Register[] = _("WÄHLEN");
const u8 OtherText_Give2[] = _("GEBEN");
const u8 OtherText_CheckTag[] = _("PRÜFEN");
const u8 OtherText_Confirm[] = _("O.K.");
const u8 gOtherText_Walk[] = _("LAUFEN");

const u8 gOtherText_Exit[] = _("BEENDEN");
const u8 gOtherText_CancelNoTerminator[] = _("ZURÜCK");
const u8 gOtherText_CancelWithTerminator[] = _("$ZURÜCK");

const u8 OtherText_Item[] = _("ITEM");
const u8 OtherText_Mail[] = _("BRIEF");
const u8 OtherText_Take2[] = _("NEHMEN");
const u8 OtherText_Store[] = _("GEBEN");

const u8 gOtherText_Check[] = _("PRÜFEN");
const u8 gOtherText_None[] = _("KEINES");

const u8 gOtherText_ThreeQuestions2[] = _("???");

const u8 gOtherText_FiveQuestions[] = _("?????");
const u8 gOtherText_Slash[] = _("/");

const u8 gOtherText_OneDash[] = _("-");
const u8 gOtherText_TwoDashes[] = _("--");
const u8 gOtherText_ThreeDashes2[] = _("---");
const u8 gOtherText_MaleSymbol2[] = _("♂");
const u8 gOtherText_FemaleSymbol2[] = _("♀");
const u8 gOtherText_Lv[] = _("Lv.");
const u8 gOtherText_TallPlusAndRightArrow[] = _("{TALL_PLUS}${RIGHT_ARROW}");
const u8 gMenuText_GoBackToPrev[] = _("Kehre zurück zum\nvorherigen Menü.");
const u8 gOtherText_WhatWillYouDo[] = _("Was möchtest du tun?");

const u8 gOtherText_xString1[] = _("×{STR_VAR_1}");
const u8 gOtherText_Berry2[] = _("BEERE");
const u8 gOtherText_Coins2[] = _("{STR_VAR_1} MÜNZ.");
const u8 gOtherText_CloseBag[] = _("BEUTEL SCHLIESSEN");

const u8 OtherText_TheField3[] = _("zum Hauptmenü.");
const u8 OtherText_TheBattle[] = _("zum Kampf.");
const u8 OtherText_ThePokeList[] = _("zur POKéMON-LISTE.");
const u8 OtherText_TheShop[] = _("zum Geschäft.");
const u8 OtherText_TheField[] = _("zum Hauptmenü.");
const u8 OtherText_TheField2[] = _("zum Hauptmenü.");
const u8 OtherText_ThePC[] = _("zum PC.");

const u8 *const gUnknown_0840E740[7] =
{
    OtherText_TheField3,
    OtherText_TheBattle,
    OtherText_ThePokeList,
    OtherText_TheShop,
    OtherText_TheField,
    OtherText_TheField2,
    OtherText_ThePC,
};

const u8 gOtherText_ReturnTo[] = _("Zurück ");
const u8 gOtherText_WhatWillYouDo2[] = _("Was möchtest\ndu tun?");
const u8 gOtherText_CantWriteMail[] = _("Du kannst keinen\nBRIEF schreiben.");
const u8 gOtherText_NoPokemon[] = _("Hier ist kein\nPOKéMON.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SwitchWhichItem[] = _("Gegen welches Item\naustauschen?");
const u8 gOtherText_CantBeHeld[] = _("{STR_VAR_1} ist nicht zu geben.");
const u8 gOtherText_CantBeHeldHere[] = _("{STR_VAR_1} ist hier nicht zu geben.");
const u8 gOtherText_HowManyToDeposit[] = _("Wie viele möchtest\ndu ablegen?");
const u8 gOtherText_DepositedItems[] = _("{STR_VAR_2}× {STR_VAR_1}\nwurde abgelegt.");
const u8 gOtherText_NoRoomForItems[] = _("Kein Platz für\nweitere Items.");
const u8 gOtherText_CantStoreSomeoneItem[] = _("Du kannst kein\nItem eines anderen\nauf dem PC lagern.");
const u8 gOtherText_TooImportant[] = _("Das ist viel zu\nwichtig, um es\nwegzuwerfen!");
const u8 gOtherText_HowManyToToss[] = _("Wie viel in den Müll?");
const u8 gOtherText_ThrewAwayItem[] = _("{STR_VAR_2} × {STR_VAR_1}\nweggeworfen.");
const u8 gOtherText_OkayToThrowAwayPrompt[] = _("Willst du wirklich\n{STR_VAR_2} × {STR_VAR_1}\nwegwerfen?");
const u8 gOtherText_DadsAdvice[] = _("VATI sagt immer...\n{PLAYER}, dies ist weder der rechte\lOrt noch der rechte Zeitpunkt dafür!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantGetOffBike[] = _("Du kannst hier nicht vom RAD steigen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ItemfinderResponding[] = _("Oh!\nDas Gerät zeigt etwas an!\pHier muss ein Item vergraben sein!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ItemfinderItemUnderfoot[] = _("Das Gerät macht direkt unter\ndeinen Füßen etwas aus!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoResponse[] = _("... ... ... ... Nichts!\nKeine Anzeige.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Coins3[] = _("Deine MÜNZEN:\n{STR_VAR_1}{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BootedTM[] = _("Eine TM wurde aktiviert.");
const u8 gOtherText_BootedHM[] = _("Eine VM wurde aktiviert.");
const u8 gOtherText_ContainsMove[] = _("Sie enthält\n{STR_VAR_1}.\p{STR_VAR_1} einem\nPOKéMON beibringen?");
const u8 gOtherText_UsedItem[] = _("{PLAYER} setzt\n{STR_VAR_2} ein.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_RepelLingers[] = _("Aber SCHUTZ wirkt doch\nnoch!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_UsedFlute[] = _("{PLAYER} setzt\n{STR_VAR_2} ein.\pWilde POKéMON werden angezogen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_UsedRepel[] = _("{PLAYER} setzt\n{STR_VAR_2} ein.\pWilde POKéMON werden abgehalten.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BoxIsFull[] = _("Die BOXEN sind voll.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Size[] = _("MASS:");
const u8 gOtherText_Firm[] = _("GÜTE:");

const u8 gContestStatsText_Unknown1[] = _("{STR_VAR_1},{STR_VAR_2} cm");

const u8 ContestStatsText_VerySoft[] = _("Sehr weich");
const u8 ContestStatsText_Soft[] = _("Weich");
const u8 ContestStatsText_Hard[] = _("Hart");
const u8 ContestStatsText_VeryHard[] = _("Sehr hart");
const u8 ContestStatsText_SuperHard[] = _("Steinhart");

const u8 ContestStatsText_RedPokeBlock[] = _("{POKEBLOCK} ROT");
const u8 ContestStatsText_BluePokeBlock[] = _("{POKEBLOCK} BLAU");
const u8 ContestStatsText_PinkPokeBlock[] = _("{POKEBLOCK} ROSA");
const u8 ContestStatsText_GreenPokeBlock[] = _("{POKEBLOCK} GRÜN");
const u8 ContestStatsText_YellowPokeBlock[] = _("{POKEBLOCK} GELB");
const u8 ContestStatsText_PurplePokeBlock[] = _("{POKEBLOCK} LILA");
const u8 ContestStatsText_IndigoPokeBlock[] = _("{POKEBLOCK} INDIGO");
const u8 ContestStatsText_BrownPokeBlock[] = _("{POKEBLOCK} BRAUN");
const u8 ContestStatsText_LiteBluePokeBlock[] = _("{POKEBLOCK} CYAN");
const u8 ContestStatsText_OlivePokeBlock[] = _("{POKEBLOCK} OLIV");
const u8 ContestStatsText_GrayPokeBlock[] = _("{POKEBLOCK} GRAU");
const u8 ContestStatsText_BlackPokeBlock[] = _("{POKEBLOCK} SCHWARZ");
const u8 ContestStatsText_WhitePokeBlock[] = _("{POKEBLOCK} WEISS");
const u8 ContestStatsText_GoldPokeBlock[] = _("{POKEBLOCK} GOLD");

const u8 gContestStatsText_Spicy[] = _("SCHARF");
const u8 gContestStatsText_Dry[] = _("TROCKEN");
const u8 gContestStatsText_Sweet[] = _("SÜSS");
const u8 gContestStatsText_Bitter[] = _("BITTER");
const u8 gContestStatsText_Sour[] = _("SAUER");
const u8 gContestStatsText_Tasty[] = _("LECKER");
const u8 gContestStatsText_Feel[] = _("WÜRZE");

const u8 gContestStatsText_StowCase[] = _("BOX verstauen.");
const u8 gContestStatsText_ThrowAwayPrompt[] = _("{STR_VAR_1}\nwegwerfen?");
const u8 gContestStatsText_WasThrownAway[] = _("{STR_VAR_1}\nwurde weggeworfen.");
const u8 gContestStatsText_NormallyAte[] = _("{STR_VAR_1} aß den\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");
const u8 gContestStatsText_HappilyAte[] = _("{STR_VAR_1} aß gerne den\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");
const u8 gContestStatsText_DisdainfullyAte[] = _("{STR_VAR_1} aß ungern den\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");

const u8 MartText_Buy[] = _("KAUFEN");
const u8 MartText_Sell[] = _("VERKAUFEN");
const u8 MartText_Quit2[] = _("TSCHÜSS!");

const u8 gOtherText_QuitShopping[] = _("Einkauf beenden.");

const u8 gOtherText_HowManyYouWant[] = _("{STR_VAR_1}? Aber gerne.\nWie viele möchtest du?");
const u8 gOtherText_ThatWillBe[] = _("{STR_VAR_1}? Und du möchtest {STR_VAR_2}?\nDas macht dann ¥{STR_VAR_3}.");
const u8 gOtherText_ThatWillBe2[] = _("{STR_VAR_1} soll es sein?\nDas kostet ¥{STR_VAR_2}. Einverstanden?");
const u8 gOtherText_ThatWillBe3[] = _("Du wolltest {STR_VAR_1}?\nDas kostet ¥{STR_VAR_2}. Einverstanden?");
const u8 gOtherText_HereYouGo[] = _("Bitte sehr!\nUnd vielen Dank.");
const u8 gOtherText_HereYouGo2[] = _("Vielen Dank!\nEs wird auf deinen PC übertragen.");
const u8 gOtherText_HereYouGo3[] = _("Danke!\nEs wird auf deinen PC übertragen.");
const u8 gOtherText_NotEnoughMoney[] = _("Du hast nicht genug Geld.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoRoomFor[] = _("Du hast keinen Platz für weitere Items.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SpaceForIsFull[] = _("Es ist kein Platz für {STR_VAR_1}.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AnythingElse[] = _("Gibt es noch etwas, womit\nich dienen kann?");
const u8 gOtherText_CanIHelpYou[] = _("Kann ich dir sonst noch dienlich sein?");
const u8 gOtherText_FreePremierBall[] = _("Ich gebe dir noch einen PREMIERBALL.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantBuyThat[] = _("{STR_VAR_2}? Es tut mir Leid, aber\ndas kann ich nicht kaufen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_HowManyToSell[] = _("{STR_VAR_2}?\nWie viele möchtest du verkaufen?");
const u8 gOtherText_CanPay[] = _("Ich gebe dir ¥{STR_VAR_1}.\nBist du damit einverstanden?");
const u8 gOtherText_SoldItem[] = _("{STR_VAR_2} wurde übergeben\nim Tausch gegen ¥{STR_VAR_1}.");

const u8 OtherText_Money[] = _("¥{STR_VAR_1}");
const u8 OtherText_Shift[] = _("TAUSCH");
const u8 OtherText_SendOut[] = _("AUSSENDEN");
const u8 OtherText_Switch2[] = _("TAUSCH");
const u8 OtherText_Summary[] = _("BERICHT");
const u8 OtherText_Moves[] = _("ATTACKEN");
const u8 OtherText_Enter2[] = _("EINTRAGEN");
const u8 OtherText_NoEntry[] = _("AUSTRAGEN");
const u8 OtherText_Take[] = _("NEHMEN");
const u8 OtherText_Read2[] = _("LESEN");

const u8 gOtherText_Hp2[] = _("KP");
const u8 gOtherText_SpAtk2[] = _("SP. ANG.");
const u8 gOtherText_SpDef2[] = _("SP. VER.");
const u8 gOtherText_WontHaveAnyEffect[] = _("Es wird keine Wirkung haben.{PAUSE_UNTIL_PRESS}");

const u8 gOtherText_CantUseOnPoke[] = _("Das kann nicht bei diesem\nPOKéMON eingesetzt werden.{PAUSE_UNTIL_PRESS}");

const u8 gOtherText_CantBeSwitched[] = _("{STR_VAR_1} kann nicht ausge-\ntauscht werden!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyBattle[] = _("{STR_VAR_1}\nkämpft bereits!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadySelected[] = _("{STR_VAR_1} ist\nbereits ausgewählt.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoEnergyLeft[] = _("{STR_VAR_1} kann\nnicht kämpfen!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantSwitchPokeWithYours[] = _("Ein POKéMON von {STR_VAR_1} ist\nnicht gegen deins eintauschbar!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_EGGCantBattle[] = _("Ein EI kann nicht kämpfen!{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CantBeUsedBadge[] = _("Das ist erst einsetzbar, wenn\nein neuer ORDEN errungen wurde.");
const u8 gOtherText_NoMoreThreePoke[] = _("Es können nicht mehr als\ndrei POKéMON teilnehmen.");
const u8 gOtherText_SendRemovedMailPrompt[] = _("Den abgenommenen BRIEF\nauf deinen PC übertragen?");
const u8 gOtherText_MailWasSent[] = _("Der BRIEF wurde auf deinen\nPC übertragen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailboxIsFull[] = _("Du kannst keine weiteren BRIEFE\nauf deinen PC übertragen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailRemovedMessageLost[] = _("Wird der BRIEF entfernt, geht\nder Inhalt verloren, okay?");
const u8 gOtherText_MailMustBeRemoved[] = _("Der BRIEF muss entfernt werden,\num ein Item tragen zu können.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WasGivenToHold[] = _("{STR_VAR_1} erhält\n{STR_VAR_2} zum Tragen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyHolding[] = _("{STR_VAR_1} trägt bereits\n{STR_VAR_2}.\pSollen die Items ausge-\ntauscht werden?");
const u8 gOtherText_NotHoldingAnything[] = _("{STR_VAR_1} trägt\nkein Item.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ReceivedTheThingFrom[] = _("{STR_VAR_2} von\n{STR_VAR_1} erhalten.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailTaken[] = _("Der BRIEF wurde dem\nPOKéMON abgenommen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_TakenAndReplaced[] = _("{STR_VAR_2} wurde gegen\n{STR_VAR_1} ausgetauscht.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PokeHoldingItemCantMail[] = _("Dieses POKéMON trägt ein Item.\nEs kann keinen BRIEF tragen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailTransferredMailbox[] = _("Der BRIEF wurde von deinem\nPC heruntergeladen.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BagFullCannotRemoveItem[] = _("Der BEUTEL ist voll. Das Item des\nPOKéMON wurde nicht entfernt.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_LearnedMove[] = _("{STR_VAR_1} erlernt\n{STR_VAR_2}!");
const u8 gOtherText_NotCompatible[] = _("{STR_VAR_1} und {STR_VAR_2}\nsind nicht kompatibel.\p{STR_VAR_2} kann nicht \nerlernt werden.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WantsToLearn[] = _("{STR_VAR_1} versucht,\n{STR_VAR_2} zu erlernen.\pAber {STR_VAR_1} kann maximal\nvier Attacken erlernen.\pSoll eine andere Attacke durch\n{STR_VAR_2} ersetzt werden?");
const u8 gOtherText_StopTryingTo[] = _("{STR_VAR_2} nicht\nerlernen?");
const u8 gOtherText_DidNotLearnMove2[] = _("{STR_VAR_1} hat {STR_VAR_2}\nnicht erlernt.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WhichMoveToForget2[] = _("Welche Attacke soll vergessen\nwerden?{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ForgetMove123_2[] = _("{PAUSE 32}1, {PAUSE 15}2 und{PAUSE 15}... {PAUSE 15}... {PAUSE 15}... {PAUSE 15}{PLAY_SE 0x38 0x00} Schwupp!\p{STR_VAR_1} hat\n{STR_VAR_2} vergessen.\pUnd...{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_AlreadyKnows[] = _("{STR_VAR_1} kennt\n{STR_VAR_2}.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_HPRestoredBy[] = _("Die KP von {STR_VAR_1} wurden\num {STR_VAR_2} Punkte aufgefüllt.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CuredPoisoning[] = _("Die Vergiftung von {STR_VAR_1}\nwurde geheilt.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_CuredParalysis[] = _("Die Paralyse von {STR_VAR_1}\nwurde aufgehoben.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WokeUp[] = _("{STR_VAR_1} ist aufgewacht.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BurnHealed[] = _("Verbrennung von {STR_VAR_1}\nwurde geheilt.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ThawedOut[] = _("{STR_VAR_1} wurde aufgetaut.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PPRestored[] = _("AP wurden aufgefüllt.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_RegainedHealth[] = _("{STR_VAR_1} erholte sich.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_BecameHealthy[] = _("{STR_VAR_1} erholte sich.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_PPIncreased[] = _("AP von {STR_VAR_1}\nwurden angehoben.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_ElevatedTo[] = _("{STR_VAR_1} erreicht\nLv. {STR_VAR_2}.");
const u8 gOtherText_WasRaised[] = _("{STR_VAR_2} von\n{STR_VAR_1} wurde angehoben.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_SnapConfusion[] = _("{STR_VAR_1} ist nicht\nmehr verwirrt.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_GotOverLove[] = _("{STR_VAR_1} fühlt sich nicht\nmehr angezogen.{PAUSE_UNTIL_PRESS}");
const u8 OtherText_ChoosePoke[] = _("Wähle ein POKéMON.");
const u8 OtherText_MovePokeTo[] = _("An wessen Stelle setzen?");
const u8 OtherText_TeachWhat[] = _("Welches POKéMON lehren?");
const u8 OtherText_UseWhat[] = _("Welches POKéMON?");
const u8 OtherText_GiveWhat[] = _("Welchem POKéMON geben?");
const u8 OtherText_DoWhat[] = _("Was tun mit {STR_VAR_1}?");
const u8 OtherText_NothingToCut[] = _("Hier nicht einsetzbar.");
const u8 OtherText_CantSurf[] = _("SURFER nicht einsetzbar.");
const u8 OtherText_AlreadySurfing[] = _("SURFER ist eingesetzt.");
const u8 OtherText_CantUseThatHere[] = _("Hier nicht einsetzbar.");
const u8 OtherText_RestoreWhatMove[] = _("Welche Attacke auffüllen?");
const u8 OtherText_BoostPP[] = _("AP welcher Attacke heben?");
const u8 OtherText_DoWhatWithItem[] = _("Was willst du mit dem Item?");
const u8 OtherText_NoPokeForBattle[] = _("Kein POKéMON kampfbereit!");
const u8 OtherText_ChoosePoke2[] = _("Wähle ein POKéMON.");
const u8 OtherText_NotEnoughHP[] = _("Nicht genügend KP...");
const u8 OtherText_ThreePokeNeeded[] = _("Drei POKéMON sind nötig.");
const u8 OtherText_PokeCantBeSame[] = _("Nicht dieselben POKéMON!");
const u8 OtherText_NoIdenticalHoldItems[] = _("Nicht dieselben Items!");
const u8 OtherText_TeachWhichPoke[] = _("Welches POKéMON lehren?");
const u8 gOtherText_Attack[] = _("ANGRIFF");
const u8 gOtherText_Defense[] = _("VERT.");
const u8 gOtherText_SpAtk[] = _("SP.ANG.");
const u8 gOtherText_SpDef[] = _("SP.VER.");
const u8 gOtherText_Speed[] = _("INIT.");
const u8 gOtherText_HP[] = _("KP");
const u8 gOtherText_Terminator18[] = _("");
const u8 gOtherText_OriginalTrainer[] = _("OT:");
const u8 gOtherText_Type2[] = _("TYP:");
const u8 gOtherText_Power2[] = _("STÄRKE");
const u8 gOtherText_Accuracy2[] = _("GENAU.");
const u8 gOtherText_Appeal2[] = _("AUSDR.");
const u8 gOtherText_Jam2[] = _("EINDR.");
const u8 gOtherText_Status[] = _("STATUS");
const u8 gOtherText_ExpPoints[] = _("E.-PUNKTE");
const u8 gOtherText_NextLv[] = _("NÄCHST. Lv.");
const u8 gOtherText_Ribbons00[] = _("BÄNDER: 00");

const u8 OtherText_Event[] = _("GESCHEHEN");
const u8 OtherText_Switch[] = _("TAUSCH");
const u8 OtherText_PokeInfo[] = _("POKéMON-INFO");
const u8 OtherText_PokeSkills[] = _("POKéMON-FÄHIG.");
const u8 OtherText_BattleMoves[] = _("ATTACKEN");
const u8 OtherText_ContestMoves[] = _("WETT.-ATTACKEN");
const u8 OtherText_Info[] = _("INFO");

const u8 gOtherText_EggLongTime[] = _("Dieses EI braucht sicher\nnoch lange, bis es schlüpft.");
const u8 gOtherText_EggSomeTime[] = _("Was da wohl schlüpfen wird?\nEs wird sicher lange dauern.");
const u8 gOtherText_EggSoon[] = _("Es bewegt sich manchmal.\nVielleicht schlüpft es bald?");
const u8 gOtherText_EggAbout[] = _("Es macht Geräusche.\nSicher schlüpft es bald!");
const u8 gOtherText_CantForgetHMs[] = _("VM-Attacken können jetzt\nnicht vergessen werden.");
const u8 gOtherText_PlayersBase[] = _("BASIS v. {PLAYER}");
const u8 gOtherText_OkayToDeleteFromRegistry[] = _("Soll {STR_VAR_1} aus dem GRUNDBUCH\ngelöscht werden?");
const u8 gOtherText_RegisteredDataDeleted[] = _("Eingetragene Daten wurden gelöscht.{PAUSE_UNTIL_PRESS}");

const u8 gSecretBaseText_NoRegistry[] = _("Es gibt kein GRUNDBUCH.{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_DelRegist[] = _("EINTR. LÖSCHEN");
const u8 SecretBaseText_Decorate[] = _("DEKORIEREN");
const u8 SecretBaseText_PutAway[] = _("WEGNEHMEN");
const u8 SecretBaseText_Toss[] = _("WEGWERFEN");
const u8 SecretBaseText_PutOutDecor[] = _("Wähle eine Dekoration \nund stelle sie auf.");
const u8 SecretBaseText_StoreChosenDecor[] = _("Wähle eine Dekoration und \nübertrage sie auf deinen PC.");
const u8 SecretBaseText_ThrowAwayDecor[] = _("Wähle eine Dekoration\nund wirf sie weg.");
const u8 gSecretBaseText_NoDecors[] = _("Es gibt keine Dekoration.{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_Desk[] = _("TISCH");
const u8 SecretBaseText_Chair[] = _("STUHL");
const u8 SecretBaseText_Plant[] = _("PFLANZE");
const u8 SecretBaseText_Ornament[] = _("ORNAMENT");
const u8 SecretBaseText_Mat[] = _("MATTE");
const u8 SecretBaseText_Poster[] = _("POSTER");
const u8 SecretBaseText_Doll[] = _("PUPPE");
const u8 SecretBaseText_Cushion[] = _("KISSEN");
const u8 gSecretBaseText_GoldRank[] = _("GOLD");
const u8 gSecretBaseText_SilverRank[] = _("SILBER");
const u8 gSecretBaseText_PlaceItHere[] = _("Hierhin platzieren?");
const u8 gSecretBaseText_CantBePlacedHere[] = _("Kann hier nicht platziert werden.");
const u8 gSecretBaseText_CancelDecorating[] = _("Dekorieren beenden?");
const u8 gSecretBaseText_InUseAlready[] = _("Das wurde bereits platziert.");
const u8 gSecretBaseText_NoMoreDecor[] = _("Mehr kann nicht dekoriert werden. Es\nist nur Platz für {STR_VAR_1} Dekorationen.");
const u8 gSecretBaseText_NoMoreDecor2[] = _("Mehr kann nicht dekoriert werden. Es\nist nur Platz für {STR_VAR_1} Dekorationen.");
const u8 gSecretBaseText_DecorMustPlaceOnTable[] = _("Das geht nicht. Es muss auf einem\nTISCH oder Ähnlichem stehen.");
const u8 gSecretBaseText_DecorCantPlace[] = _("Die Dekoration kann nicht in deinem\neigenen Zimmer aufgestellt werden.");
const u8 gSecretBaseText_DecorInUse[] = _("Diese Dekoration wurde platziert.\nDu kannst sie nicht wegwerfen.");
const u8 gSecretBaseText_WillBeDiscarded[] = _("{STR_VAR_1} wird weggeworfen.\nEinverstanden?");
const u8 gSecretBaseText_DecorThrownAway[] = _("Die Dekoration wurde weggeworfen.");
const u8 gSecretBaseText_StopPuttingAwayDecor[] = _("Wegnehmen von Dekoration beenden?");
const u8 gSecretBaseText_NoDecor[] = _("Hier ist keine Dekoration.");
const u8 gSecretBaseText_ReturnDecor[] = _("Diese Dekoration auf \nden PC übertragen?");
const u8 gSecretBaseText_DecorReturned[] = _("Die Dekoration wurde auf\nden PC übertragen.");
const u8 gSecretBaseText_NoDecorInUse[] = _("Es sind keine Dekorationen platziert.{PAUSE_UNTIL_PRESS}");
const u8 SecretBaseText_Tristan[] = _("TATIAN");
const u8 SecretBaseText_Philip[] = _("LARS");
const u8 SecretBaseText_Dennis[] = _("KLAAS");
const u8 SecretBaseText_Roberto[] = _("HAINER");
const u8 SecretBaseText_TurnOff[] = _("AUSSCHALTEN");
const u8 SecretBaseText_Decoration[] = _("DEKORATION");
const u8 SecretBaseText_ItemStorage[] = _("ITEM-LAGER");

const u8 gPCText_Mailbox[] = _("BRIEFBOX");
const u8 PCText_DepositItem[] = _("ITEM ABLEGEN");
const u8 PCText_WithdrawItem[] = _("ITEM NEHMEN");
const u8 PCText_TossItem[] = _("ITEM IN MÜLL");
const u8 PCText_StoreItems[] = _("Lagere Items auf deinem PC.");
const u8 PCText_TakeOutItems[] = _("Nimm Items von deinem PC.");
const u8 PCText_ThrowAwayItems[] = _("Wirf gelagerte Items weg.");

const u8 gOtherText_NoItems[] = _("Es gibt keine Items.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_NoMoreRoom[] = _("In deinem BEUTEL\nist kein Platz mehr.");
const u8 gOtherText_HowManyToWithdraw[] = _("Wie viele möchtest\ndu aufnehmen?");
const u8 gOtherText_WithdrewThing[] = _("{STR_VAR_2} × {STR_VAR_1}\naufgenommen.");
const u8 OtherText_Read[] = _("LESEN");
const u8 gOtherText_MoveToBag[] = _("IN BEUTEL GEBEN");
const u8 OtherText_Give[] = _("GEBEN");
const u8 gOtherText_NoMailHere[] = _("Hier ist kein BRIEF.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_WhatWillYouDoMail[] = _("Was soll mit dem BRIEF von\n{STR_VAR_1} geschehen?");
const u8 gOtherText_MessageWillBeLost[] = _("Der Inhalt geht verloren.\nIst das in Ordnung für dich?");
const u8 gOtherText_BagIsFull[] = _("Der BEUTEL ist voll.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_MailWasReturned[] = _("Der BRIEF, dessen Inhalt gelöscht\nist, wurde im BEUTEL gelagert.{PAUSE_UNTIL_PRESS}");
const u8 gOtherText_Dad[] = _("VATI");
const u8 gOtherText_Mom[] = _("MUTTI");
const u8 gOtherText_Wallace[] = _("WASSILI");
const u8 gOtherText_Steven[] = _("TROY");
const u8 gOtherText_Brawly[] = _("KAMILLO");
const u8 gOtherText_Winona[] = _("WIBKE");
const u8 gOtherText_Phoebe[] = _("ANTONIA");
const u8 gOtherText_Glacia[] = _("FROSINA");
const u8 gContestText_ContestWinner[] = _("-WETTBEWERBSSIEGER\n");
const u8 gOtherText_Unknown1[] = _(" von ");
const u8 OtherText_Cool[] = _("COOL.");
const u8 OtherText_Beauty2[] = _("SCHÖN.");
const u8 OtherText_Cute[] = _("ANMUT");
const u8 OtherText_Smart[] = _("KLUG.");
const u8 OtherText_Tough[] = _("STÄRKE");
const u8 OtherText_NonstopSuperCool[] = _("Super-mega-cool ist\ndieses umwerfende ");
const u8 OtherText_Terminator6[] = _("");
const u8 OtherText_GoodLookingPoke[] = _("Das anbetungswürdige\nPOKéMON: ");
const u8 OtherText_Terminator7[] = _("");
const u8 OtherText_MarvelousGreat[] = _("Phantastisch, großartig -\nschlicht brillant: ");
const u8 OtherText_Terminator8[] = _("");
const u8 OtherText_CenturyLastVenus[] = _("Ein Bild von einem POKéMON!\nDas wunderschöne ");
const u8 OtherText_Terminator9[] = _("");
const u8 OtherText_Terminator10[] = _("Einfach umwerfend, das strahlende\nLächeln von ");
const u8 OtherText_DazzlingSmile[] = _("");
const u8 OtherText_PokeCenterIdol[] = _("Superstar des POKéMON-CENTERs -\ndas unvergleichliche ");
const u8 OtherText_Terminator11[] = _("");
const u8 OtherText_LovelyAndSweet[] = _("Das liebliche, zuckersüße ");
const u8 OtherText_Terminator12[] = _("");
const u8 OtherText_ThePretty[] = _("Das Gewinner-Portrait\nvon dem hübschen ");
const u8 OtherText_WinningPortrait[] = _("");
const u8 OtherText_GiveUsWink[] = _("Winke uns zu, du\ngoldiges ");
const u8 OtherText_Terminator13[] = _("");
const u8 OtherText_SmartnessMaestro[] = _("Der Gelehrte unter den\nPOKéMON! Das weise ");
const u8 OtherText_Terminator14[] = _("");
const u8 OtherText_ChosenPokeAmong[] = _("Das auserwählte und\neinzigartige POKéMON: ");
const u8 OtherText_Terminator15[] = _("");
const u8 OtherText_TheExcellent[] = _("Das grandiose ");
const u8 OtherText_ItsMomentOfElegance[] = _(" -\nder Inbegriff von Eleganz und Stil");
const u8 OtherText_PowerfullyMuscular[] = _("Der energische, kraftstrotzende\nÜberflieger: ");
const u8 OtherText_Terminator16[] = _("");
const u8 OtherText_StrongErEst[] = _("Stark, stärker, am stärksten -\ndas allerstärkste ");
const u8 OtherText_Terminator17[] = _("");
const u8 OtherText_MightyTough[] = _("Das mächtige, prächtige - das\nstärkste POKéMON: ");
const u8 OtherText_Exclamation[] = _("");
const u8 OtherText_Petalburg[] = _("BLÜTENBURG CITY");
const u8 OtherText_Slateport[] = _("GRAPHITPORT CITY");
const u8 OtherText_Littleroot[] = _("WURZELHEIM");
const u8 OtherText_Lilycove[] = _("SEEGRASULB CITY");
const u8 OtherText_Dewford[] = _("FAUSTAUHAVEN");
const u8 OtherText_Enter[] = _("JA");
const u8 OtherText_Info3[] = _("INFO");
const u8 OtherText_WhatsAContest[] = _("Der WETTBEWERB");
const u8 OtherText_TypesOfContest[] = _("WETTBEWERB-Arten");
const u8 OtherText_Ranks[] = _("Klassen");
const u8 OtherText_Judging[] = _("Bewertung");
const u8 OtherText_CoolContest[] = _("COOL.-WETTB.");
const u8 OtherText_BeautyContest[] = _("SCHÖN.-WETTB.");
const u8 OtherText_CuteContest[] = _("ANMUT-WETTB.");
const u8 OtherText_SmartContest[] = _("KLUG.-WETTB.");
const u8 OtherText_ToughContest[] = _("STÄRKE-WETTB.");
const u8 OtherText_Decoration[] = _("DEKORATION");
const u8 OtherText_PackUp[] = _("EINPACKEN");
const u8 OtherText_Count[] = _("ZÄHLEN");
const u8 OtherText_Registry[] = _("GRUNDBUCH");
const u8 OtherText_Information[] = _("INFORMATION");
const u8 OtherText_Mach[] = _("EIL");
const u8 OtherText_Acro[] = _("KUNST");
const u8 OtherText_Poison[] = _("GIF");
const u8 OtherText_Paralysis[] = _("PAR");
const u8 OtherText_Sleep[] = _("SLF");
const u8 OtherText_Burn[] = _("BRT");
const u8 OtherText_Frozen[] = _("GFR");
const u8 OtherText_Quit[] = _("ZURÜCK");
const u8 OtherText_SawIt[] = _("Gesehen");
const u8 OtherText_NotYet[] = _("Noch nicht");
const u8 OtherText_Yes[] = _("JA");
const u8 OtherText_No[] = _("NEIN");
const u8 OtherText_Info2[] = _("INFO");
const u8 OtherText_SingleBattle[] = _("EINZELKAMPF");
const u8 OtherText_DoubleBattle[] = _("DOPPELKAMPF");
const u8 OtherText_MultiBattle[] = _("MULTIKAMPF");
const u8 OtherText_MrBriney[] = _("MR. BRACK");
const u8 OtherText_MakeAChallenge[] = _("Zum Kampf fordern");
const u8 OtherText_ObtainInformation[] = _("Information dazu");
const u8 OtherText_Lv50_2[] = _("Lv. 50");
const u8 OtherText_Lv100_2[] = _("Lv. 100");
const u8 OtherText_Zigzagoon[] = _("ZIGZACHS");
const u8 OtherText_Nincada[] = _("NINCADA");
const u8 OtherText_Poochyena[] = _("FIFFYEN");
const u8 OtherText_Nincada2[] = _("NINCADA");
const u8 OtherText_Lotad[] = _("LOTURZEL");
const u8 OtherText_Roselia[] = _("ROSELIA");
const u8 OtherText_Shroomish[] = _("KNILZ");
const u8 OtherText_Nincada3[] = _("NINCADA");
const u8 OtherText_Surskit[] = _("GEHWEIHER");
const u8 OtherText_Treecko[] = _("GECKARBOR");
const u8 OtherText_Torchic[] = _("FLEMMLI");
const u8 OtherText_Mudkip[] = _("HYDROPI");
const u8 OtherText_Seedot[] = _("SAMURZEL");
const u8 OtherText_Shroomish2[] = _("KNILZ");
const u8 OtherText_Spinda[] = _("PANDIR");
const u8 OtherText_Shroomish3[] = _("KNILZ");
const u8 OtherText_Zigzagoon2[] = _("ZIGZACHS");
const u8 OtherText_Wurmple[] = _("WAUMPEL");
const u8 OtherText_PokeBall[] = _("POKéBALL");
const u8 OtherText_SuperPotion[] = _("SUPERTRANK");
const u8 OtherText_SamePrice[] = _("Zum selben Preis");
const u8 OtherText_Yen135[] = _("¥135");
const u8 OtherText_Yen155[] = _("¥155");
const u8 OtherText_Yen175[] = _("¥175");
const u8 OtherText_CostMore[] = _("Sie kosten mehr.");
const u8 OtherText_CostLess[] = _("Sie kosten weniger.");
const u8 OtherText_SamePrice2[] = _("Gleicher Preis");
const u8 OtherText_MaleSymbol[] = _("♂");
const u8 OtherText_FemaleSymbol[] = _("♀");
const u8 OtherText_Neither[] = _("Weder noch");
const u8 OtherText_Males[] = _("Männer");
const u8 OtherText_Females[] = _("Frauen");
const u8 OtherText_SameNumber[] = _("Gleich viele");
const u8 OtherText_Male[] = _("Männlich");
const u8 OtherText_Female[] = _("Weiblich");
const u8 OtherText_ItDepends[] = _("Ansichtssache");
const u8 OtherText_Six2[] = _("6");
const u8 OtherText_Eight2[] = _("8");
const u8 OtherText_Ten[] = _("10");
const u8 OtherText_One[] = _("1");
const u8 OtherText_Two[] = _("2");
const u8 OtherText_Three[] = _("3");
const u8 OtherText_Six[] = _("6");
const u8 OtherText_Seven[] = _("7");
const u8 OtherText_Eight[] = _("8");
const u8 OtherText_FreshWater[] = _("TAFELWASSER{CLEAR_TO 72}¥200");
const u8 OtherText_SodaPop[] = _("SPRUDEL{CLEAR_TO 72}¥300");
const u8 OtherText_Lemonade[] = _("LIMONADE{CLEAR_TO 72}¥350");
const u8 OtherText_HowToRide[] = _("RAD FAHREN");
const u8 OtherText_HowToTurn[] = _("KURVEN FAHREN");
const u8 OtherText_SandySlopes[] = _("SANDHÜGEL");
const u8 OtherText_Wheelies[] = _("WHEELIES");
const u8 OtherText_BunnyHops[] = _("HOPPELN");
const u8 OtherText_Jumping[] = _("SPRINGEN");
const u8 OtherText_Satisfied[] = _("Zufrieden");
const u8 OtherText_Dissatisfied[] = _("Unzufrieden");
const u8 OtherText_Deepseatooth[] = _("ABYSSZAHN");
const u8 OtherText_Deepseascale[] = _("ABYSSPLATTE");
const u8 OtherText_BlueFlute2[] = _("BLAUE FLÖTE");
const u8 OtherText_YellowFlute2[] = _("GELBE FLÖTE");
const u8 OtherText_RedFlute2[] = _("ROTE FLÖTE");
const u8 OtherText_WhiteFlute2[] = _("WEISSE FLÖTE");
const u8 OtherText_BlackFlute2[] = _("SCHWRZ. FLÖTE");
const u8 OtherText_GlassChair[] = _("GLASSTUHL");
const u8 OtherText_GlassDesk[] = _("GLASTISCH");
const u8 OtherText_TreeckoDoll[] = _("GECKARBOR-PUPPE 1.000 M.");
const u8 OtherText_TorchicDoll[] = _("FLEMMLI-PUPPE 1.000 M.");
const u8 OtherText_MudkipDoll[] = _("HYDROPI-PUPPE 1.000 M.");
const u8 OtherText_50Coins[] = _("  50 MÜNZEN    ¥1.000");
const u8 OtherText_500Coins[] = _("500 MÜNZEN  ¥10.000");
const u8 OtherText_Excellent[] = _("Klasse!");
const u8 OtherText_NotSoHot[] = _("Naja...");
const u8 OtherText_RedShard[] = _("PURPURSTÜCK");
const u8 OtherText_YellowShard[] = _("GELBSTÜCK");
const u8 OtherText_BlueShard[] = _("INDIGOSTÜCK");
const u8 OtherText_GreenShard[] = _("GRÜNSTÜCK");
const u8 OtherText_BattleTower[] = _("DUELLTURM");
const u8 OtherText_Right[] = _("Rechts");
const u8 OtherText_Left[] = _("Links");
const u8 OtherText_TM32[] = _("TM32  1.500 MÜNZEN");
const u8 OtherText_TM29[] = _("TM29  3.500 MÜNZEN");
const u8 OtherText_TM35[] = _("TM35  4.000 MÜNZEN");
const u8 OtherText_TM24[] = _("TM24  4.000 MÜNZEN");
const u8 OtherText_TM13[] = _("TM13  4.000 MÜNZEN");
const u8 OtherText_1F_2[] = _("EG");
const u8 OtherText_2F_2[] = _("1S");
const u8 OtherText_3F_2[] = _("2S");
const u8 OtherText_4F_2[] = _("3S");
const u8 OtherText_5F_2[] = _("4S");
const u8 OtherText_Cool2[] = _("COOL.");
const u8 OtherText_Beauty3[] = _("SCHÖN.");
const u8 OtherText_Cute2[] = _("ANMUT");
const u8 OtherText_Smart2[] = _("KLUG.");
const u8 OtherText_Tough2[] = _("STÄRKE");
const u8 OtherText_Normal[] = _("NORMAL");
const u8 OtherText_Super[] = _("SUPER");
const u8 OtherText_Hyper[] = _("HYPER");
const u8 OtherText_Master[] = _("MASTER");
const u8 OtherText_Cool3[] = _("COOL.");
const u8 OtherText_Beauty4[] = _("SCHÖN.");
const u8 OtherText_Cute3[] = _("ANMUT");
const u8 OtherText_Smart3[] = _("KLUG.");
const u8 OtherText_Tough3[] = _("STÄRKE");
const u8 OtherText_Items[] = _("ITEM");
const u8 OtherText_KeyItems[] = _("BASIS-ITEM");
const u8 OtherText_Balls[] = _("BALL");
const u8 OtherText_TMsHMs[] = _("TM/VM");
const u8 OtherText_Berries[] = _("BEEREN");

const u8 gPCText_SomeonesPC[] = _("JEMANDES PC");
const u8 gPCText_LanettesPC[] = _("LANETTES PC");
const u8 gPCText_PlayersPC[] = _("PC von {PLAYER}");
const u8 gPCText_HallOfFame[] = _("RUHMESHALLE");
const u8 gPCText_LogOff[] = _("AUSLOGGEN");

const u8 gOtherText_99Times[] = _("99-mal +");
const u8 gOtherText_1Minute[] = _("1 Minute +");
const u8 gOtherText_Seconds[] = _(" Sekunden");
const u8 gOtherText_Times[] = _("-mal$.");
const u8 gOtherText_BigGuy[] = _("");
const u8 gOtherText_BigGirl[] = _("");
const u8 gOtherText_Son[] = _("Sohn");
const u8 gOtherText_Daughter[] = _("Tochter");
const u8 OtherText_BlueFlute[] = _("BLAUE FLÖTE");
const u8 OtherText_YellowFlute[] = _("GELBE FLÖTE");
const u8 OtherText_RedFlute[] = _("ROTE FLÖTE");
const u8 OtherText_WhiteFlute[] = _("WEISSE FLÖTE");
const u8 OtherText_BlackFlute[] = _("SCHWRZ. FLÖTE");
const u8 OtherText_PrettyChair[] = _("EDLER STUHL");
const u8 OtherText_PrettyDesk[] = _("EDLER TISCH");
const u8 OtherText_1F[] = _("EG");
const u8 OtherText_2F[] = _("1S");
const u8 OtherText_3F[] = _("2S");
const u8 OtherText_4F[] = _("3S");
const u8 OtherText_5F[] = _("4S");
const u8 OtherText_6F[] = _("5S");
const u8 OtherText_7F[] = _("6S");
const u8 OtherText_8F[] = _("7S");
const u8 OtherText_9F[] = _("8S");
const u8 OtherText_10F[] = _("9S");
const u8 OtherText_11F[] = _("10S");
const u8 OtherText_B1F[] = _("U1S");
const u8 OtherText_B2F[] = _("U2S");
const u8 OtherText_B3F[] = _("U3S");
const u8 OtherText_B4F[] = _("U4S");
const u8 OtherText_Rooftop[] = _("DACH");

const u8 gOtherText_NowOn[] = _("Momentan im");

const u8 gPCText_Cancel[] = _("ZURÜCK");

const u8 PCText_ExitBox[] = _("Die BOX verlassen?");
const u8 PCText_WhatYouDo[] = _("Was möchtest du tun?");
const u8 PCText_PickATheme[] = _("Wähle eine Motivsammlung.");
const u8 PCText_PickAWallpaper[] = _("Wähle ein Hintergrundmotiv.");
const u8 PCText_IsSelected[] = _(" ist ausgewählt.");
const u8 PCText_JumpToWhichBox[] = _("Zu welcher BOX wechseln?");
const u8 PCText_DepositInWhichBox[] = _("In welche BOX ablegen?");
const u8 PCText_WasDeposited[] = _(" wurde abgelegt.");
const u8 PCText_BoxIsFull[] = _("Die BOX ist voll.");
const u8 PCText_ReleasePoke[] = _("Dieses POKéMON freilassen?");
const u8 PCText_WasReleased[] = _("{STR_VAR_1} ist wieder frei.");
const u8 PCText_ByeBye[] = _("Tschüss, !");
const u8 PCText_MarkPoke[] = _("Markiere dein POKéMON.");
const u8 PCText_LastPoke[] = _("Dein letztes POKéMON!");
const u8 PCText_PartyFull[] = _("Dein Team ist voll!");
const u8 PCText_HoldingPoke[] = _("Du hältst ein POKéMON!");
const u8 PCText_WhichOneWillTake[] = _("Welches wählst du aus?");
const u8 PCText_CantReleaseEgg[] = _("Du kannst kein EI freilass.!");
const u8 PCText_ContinueBox[] = _("Die BOX weiter bearbeiten?");
const u8 PCText_CameBack[] = _(" kam zurück!");
const u8 PCText_Worried[] = _("War es in Sorge um dich?");
const u8 PCText_Surprise[] = _("... ... ... ... ...!");
const u8 PCText_PleaseRemoveMail[] = _("BRIEF bitte entfernen.");
const u8 PCText_Cancel2[] = _("ZURÜCK");
const u8 PCText_Deposit[] = _("ABLEGEN");
const u8 PCText_Withdraw[] = _("NEHMEN");
const u8 PCText_Switch[] = _("TAUSCHEN");
const u8 PCText_Move[] = _("BEWEGEN");
const u8 PCText_Place[] = _("ABSETZEN");
const u8 PCText_Summary[] = _("BERICHT");
const u8 PCText_Release[] = _("ENTLASS.");
const u8 PCText_Mark[] = _("MARKIER.");
const u8 PCText_Name[] = _("BENENNEN");
const u8 PCText_Jump[] = _("WECHSELN");
const u8 PCText_Wallpaper[] = _("MOTIV");
const u8 PCText_Scenery1[] = _("LISTE 1");
const u8 PCText_Scenery2[] = _("LISTE 2");
const u8 PCText_Scenery3[] = _("LISTE 3");
const u8 PCText_Etc[] = _("SONSTIGES");
const u8 PCText_Forest[] = _("WALD");
const u8 PCText_City[] = _("MAUER");
const u8 PCText_Desert[] = _("WÜSTE");
const u8 PCText_Savanna[] = _("STEPPE");
const u8 PCText_Crag[] = _("GERÖLL");
const u8 PCText_Volcano[] = _("VULKAN");
const u8 PCText_Snow[] = _("SCHNEE");
const u8 PCText_Cave[] = _("HÖHLE");
const u8 PCText_Beach[] = _("STRAND");
const u8 PCText_Seafloor[] = _("TIEFSEE");
const u8 PCText_River[] = _("FLUSS");
const u8 PCText_Sky[] = _("HIMMEL");
const u8 PCText_Polka[] = _("PUNKTE");
const u8 PCText_PokeCenter[] = _("POKéCENTER");
const u8 PCText_Machine[] = _("MASCHINE");
const u8 PCText_Plain[] = _("WEISS");
const u8 PCText_WhatDoYouWant[] = _("Was willst du tun?");
const u8 PCText_WithdrawPoke[] = _("POKéMON NEHMEN");
const u8 PCText_DepositPoke[] = _("POKéMON ABLEGEN");
const u8 PCText_MovePoke[] = _("POKéMON BEWEGEN");
const u8 PCText_SeeYa[] = _("TSCHÜSSI!");
const u8 PCText_MovePokeToParty[] = _("Nimm POKéMON aus einer\nBOX in dein Team auf.");
const u8 PCText_StorePokeInBox[] = _("Lagere POKéMON aus deinem\nTeam in einer BOX.");
const u8 PCText_OrganizeBoxesParty[] = _("Ordne POKéMON in den BOXEN\nund/oder in deinem Team.");
const u8 PCText_ReturnToPrevMenu[] = _("Zurück zum vorherigen Menü.");

const u8 gPCText_OnlyOne[] = _("Du führst nur ein POKéMON mit dir.");
const u8 gPCText_PartyFull2[] = _("Dein Team ist voll!");
const u8 gPCText_BOX[] = _("BOX ");

// pokenav
const u8 PCText_CheckMap[] = _("{CLEAR 0}Karte der HOENN-Region");
const u8 PCText_CheckPoke[] = _("{CLEAR 0}POKéMON-Daten im Detail");
const u8 PCText_CheckTrainer[] = _("{CLEAR 0}TRAINER-Daten im Detail");
const u8 PCText_CheckRibbons[] = _("{CLEAR 0}Einsicht über BÄNDER");
const u8 PCText_PutAwayNav[] = _("{CLEAR 0}POKéNAV schließen");
const u8 PCText_NoRibbonWin[] = _("{CLEAR 0}Es gibt keine BÄNDER.");
const u8 PCText_NoTrainers[] = _("{CLEAR 0}Keine TRAINER-Daten aufgenommen");
const u8 PCText_CheckParty[] = _("{CLEAR 0}Daten über POKéMON des Teams");
const u8 PCText_CheckPokeAll[] = _("{CLEAR 0}Daten über alle POKéMON");
const u8 PCText_ReturnToNav[] = _("{CLEAR 0}Zurück zum POKéNAV-Menü");
const u8 PCText_FindCool[] = _("{CLEAR 0}Nach coolen POKéMON suchen.");
const u8 PCText_FindBeauty[] = _("{CLEAR 0}Nach schönen POKéMON suchen.");
const u8 PCText_FindCute[] = _("{CLEAR 0}Nach anmutigen POKéMON suchen.");
const u8 PCText_FindSmart[] = _("{CLEAR 0}Nach klugen POKéMON suchen.");
const u8 PCText_FindTough[] = _("{CLEAR 0}Nach starken POKéMON suchen.");
const u8 PCText_ReturnToCondition[] = _("{CLEAR 0}Zurück zum Menüpunkt ZUSTAND");

const u8 gOtherText_NumberRegistered[] = _("Registrierte:");
const u8 gOtherText_NumberBattles[] = _("Kämpfe:");
const u8 gOtherText_Strategy[] = _("{PALETTE 5}TAKTIK:");
const u8 gOtherText_TrainersPokemon[] = _("{PALETTE 5}POKéMON:");
const u8 gOtherText_SelfIntroduction[] = _("{PALETTE 5}MOTTO:");
const u8 gOtherText_Nature2[] = _("NATUR/");
const u8 gOtherText_InParty[] = _("IM TEAM");
const u8 gOtherText_Number[] = _("Nr. ");
const u8 gOtherText_Ribbons[] = _("BÄNDER");
const u8 OtherText_MakeProfilePage1[] = _("Erstelle dein eigenes Profil:");
const u8 OtherText_MakeProfilePage2[] = _("Kombiniere 4 Wörter/Ausdrücke.");
const u8 OtherText_MakeMessagePage1[] = _("Verwende 6 Ausdrücke.");
const u8 OtherText_MakeMessagePage2[] = _("Max. pro Zeile 2-mal 12 Buchstaben");
const u8 OtherText_DescribeFeelingsPage1[] = _("Finde Worte, die deine momentanen");
const u8 OtherText_DescribeFeelingsPage2[] = _("Empfindungen beschreiben.");
const u8 OtherText_WithFourPhrases[] = _("Verwende 4 Ausdrücke und");
const u8 OtherText_CombineNinePhrasesPage1[] = _("Kombiniere 9 Ausdrücke und");
const u8 OtherText_CombineNinePhrasesPage2[] = _("erstelle eine Nachricht.");
const u8 OtherText_ImproveBardSongPage1[] = _("Ändere nur 1 Wort/Ausdruck");
const u8 OtherText_ImproveBardSongPage2[] = _("und verbessere das BARDEN-Lied.");
const u8 OtherText_YourProfile[] = _("Dein Profil");
const u8 OtherText_YourFeelingBattle[] = _("Deine Gefühle zum Kampfbeginn");
const u8 OtherText_SetWinMessage[] = _("Deine Worte im Fall des Sieges");
const u8 OtherText_SetLossMessage[] = _("Deine Worte im Fall der Niederlage");
const u8 OtherText_TheAnswer[] = _("Die Antwort");
const u8 OtherText_MailMessage[] = _("Der Inhalt des BRIEFES");
const u8 OtherText_MailSalutation[] = _("Der Gruß des BRIEFES");
const u8 OtherText_NewSong[] = _("Das neue Lied");
const u8 OtherText_CombineTwoPhrasesPage1[] = _("Kombiniere 2 Ausdrücke und");
const u8 OtherText_CombineTwoPhrasesPage2[] = _("schaffe einen hippen Spruch.");
const u8 OtherText_ConfirmTrendyPage1[] = _("Der hippe Spruch");
const u8 OtherText_ConfirmTrendyPage2[] = _("lautet also so. O.K.?");
const u8 OtherText_HipsterPage1[] = _("Kombiniere 2 Ausdrücke und");
const u8 OtherText_HipsterPage2[] = _("bringe ihr einen guten Spruch bei.");

const u8 gOtherText_TextDeletedConfirmPage1[] = _("Der gesamte verfasste Text wird");
const u8 gOtherText_TextDeletedConfirmPage2[] = _("gelöscht. Einverstanden?");
const u8 gOtherText_QuitEditing[] = _("Das Textverfassen beenden?");
const u8 gOtherText_EditedTextNoSavePage1[] = _("Der Text wird nicht gespeichert.");
const u8 gOtherText_EditedTextNoSavePage2[] = _("Ist das in Ordnung?");
const u8 gOtherText_EnterAPhraseOrWord[] = _("Bitte Wort/Ausdruck eingeben.");
const u8 gOtherText_TextNoDelete[] = _("Gesamter Text ist nicht löschbar.");
const u8 gOtherText_OnlyOnePhrase[] = _("Nur ein Ausdruck ist änderbar.");
const u8 gOtherText_OriginalSongRestored[] = _("Das Lied wird wiederhergestellt.");
const u8 gOtherText_TrendyAlready[] = _("Das ist bereits hip.");
const u8 gOtherText_CombineTwoPhrases[] = _("Kombiniere 2 Wörter/Ausdrücke.");
const u8 gOtherText_QuitGivingInfo[] = _("Keine weiteren Infos liefern?");
const u8 gOtherText_StopGivingMail[] = _("POKéMON keinen BRIEF geben?");
const u8 gOtherText_Profile[] = _("PROFIL");
const u8 gOtherText_AtBattleStart[] = _("Zum Kampfbeginn");
const u8 gOtherText_UponWinningBattle[] = _("Über den Sieg");
const u8 gOtherText_UponLosingBattle[] = _("Über die Niederlage");

// mauville_man?
const u8 gOtherText_TheBardsSong[] = _("Das BARDEN-Lied");
const u8 gOtherText_WhatsHipHappening[] = _("Was ist hip? Was ist top?");
const u8 gOtherText_Interview[] = _("Interview");
const u8 gOtherText_GoodSaying[] = _("Guter Spruch");
const u8 OtherText_SoPretty[] = _(" so hübsch!");
const u8 OtherText_SoDarling[] = _(" so reizend!");
const u8 OtherText_SoRelaxed[] = _(" so lässig!");
const u8 OtherText_SoSunny[] = _(" so überwältigend!");
const u8 OtherText_SoDesirable[] = _(" so erstrebenswert!");
const u8 OtherText_SoExciting[] = _(" so aufregend!");
const u8 OtherText_SoAmusing[] = _(" so amüsant!");
const u8 OtherText_SoMagical[] = _(" so zauberhaft!");

const u8 gOtherText_Is[] = _(" klingt");
const u8 gOtherText_DontYouAgree[] = _("\nFindest du nicht auch?");

const u8 OtherText_WantVacationNicePlace[] = _("Ich will unbedingt verreisen!\nKennst du ein hübsches Reiseziel?");
const u8 OtherText_BoughtCrayonsIsNice[] = _("Ich habe 120 verschiedene Farbstifte\ngekauft! Das ist doch toll, oder?");
const u8 OtherText_IfWeCouldFloat[] = _("Wäre es nicht herrlich, wir könnten auf\neiner Luftblasenwolke davonschweben?");
const u8 OtherText_SandWashesAwayMakeSad[] = _("Eine Botschaft in Sand geschrieben\nwird weggespült. Das ist traurig.");
const u8 OtherText_WhatsBottomSeaLike[] = _("Wie der Meeresgrund wohl ist? Ich\nwürde ihn so gerne einmal erleben!");
const u8 OtherText_SeeSettingSun[] = _("Sehnst du dich beim Anblick der unter-\ngehenden Sonne nach deinem Zuhause?");
const u8 OtherText_LyingInGreenGrass[] = _("Einfach so im grünen Gras liegen...\nOh, das ist so was von angenehm!");
const u8 OtherText_SecretBasesWonderful[] = _("GEHEIMBASEN sind superklasse!\nFindest du das nicht auch aufregend?");

const u8 OtherText_PokeLeague[] = _("POKéMON LIGA");
const u8 OtherText_PokeCenter[] = _("POKéMON-CENTER");

const u8 gOtherText_GetsAPokeBlock[] = _(" erhält einen {POKEBLOCK}?");

const u8 OtherText_Coolness[] = _("Coolness ");
const u8 OtherText_Beauty[] = _("Schönheit ");
const u8 OtherText_Cuteness[] = _("Anmut ");
const u8 OtherText_Smartness[] = _("Klugheit ");
const u8 OtherText_Toughness[] = _("Stärke ");

const u8 gOtherText_WasEnhanced[] = _("wurde erhöht!");
const u8 gOtherText_NothingChanged[] = _("Keine Veränderung eingetreten!");
const u8 gOtherText_WontEat[] = _("Es will nicht mehr essen.");

const u8 gSystemText_SaveFailedBackupCheck[] = _("Speicherfehler\nBackup Memory wird geprüft.\nBitte warten...\n{COLOR RED}“Benötigte Zeit: 1 Minute”");
const u8 gSystemText_BackupDamagedGameContinue[] = _("Backup Memory defekt oder\ninterne Batterie verbraucht!\nSpiel kann fortgesetzt werden.\nWeiteres Speichern nicht möglich.");
const u8 gSystemText_GameplayEnded[] = _("{COLOR RED}“Spiel fortsetzen nicht möglich.\nZurück zum Titelbildschirm...”");
const u8 gSystemText_CheckCompleteSaveAttempt[] = _("Überprüfung beendet.\nNeuer Speicherversuch erfolgt.\nBitte warten...");
const u8 gSystemText_SaveCompletedGameEnd[] = _("Speichern beendet.\n{COLOR RED}“Spiel fortsetzen nicht möglich.\nZurück zum Titelbildschirm.”");
const u8 gSystemText_SaveCompletedPressA[] = _("Speichern beendet.\n{COLOR RED}“Bitte A-Knopf drücken.”");

const u8 gOtherText_Ferry[] = _("FÄHRE");
const u8 gOtherText_SecretBase[] = _("GEHEIMBASIS");
const u8 gOtherText_Hideout[] = _("VERSTECK");

const u8 gSystemText_ResetRTCPrompt[] = _("Echtzeituhr zurücksetzen?\nA: Bestätigen, B: Zurück");
const u8 gSystemText_PresentTime[] = _("Aktuelle Uhrzeit im Spiel");
const u8 gSystemText_PreviousTime[] = _("Vorherige Uhrzeit im Spiel");
const u8 gSystemText_PleaseResetTime[] = _("Bitte die Zeit zurückstellen.");
const u8 gSystemText_ClockResetDataSave[] = _("Die Uhr wurde zurückgestellt. Daten\nwerden gesichert. Bitte warten...");
const u8 gSystemText_SaveCompleted[] = _("Speichern beendet.");
const u8 gSystemText_SaveFailed[] = _("Speichern fehlgeschlagen.");
const u8 gSystemText_NoSaveFileNoTime[] = _("Es existiert kein Speicherstand. Uhr-\nzeit kann nicht eingestellt werden.");
const u8 gSystemText_ClockAdjustmentUsable[] = _("Das spielinterne Zeiteingabe-\nSystem ist jetzt verfügbar.");
const u8 gSystemText_Saving[] = _("SPEICHERVORGANG...\nGERÄT NICHT AUSSCHALTEN!");
#endif
