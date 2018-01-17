	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	@ unused
gOtherText_TopSpeed::
	.string "TEMPO$"

gMultiText_BerryBlenderMaxSpeedRecord:: @ 842C2E6
	.string "BEERENMIXER\n"
	.string "MAXIMALTEMPO-REKORD!$"

gMultiText_2P3P4P:: @ 842C30A
	.string "2 SPIELER\n"
	.string "3 SPIELER\n"
	.string "4 SPIELER$"

gMultiText_Saving:: @ 842C328
	.string "SPEICHERVORGANG...\n"
	.string "DAS GERÄT NICHT AUSSCHALTEN!$"

gMultiText_LinkError:: @ 842C34C
	.string "{HIGHLIGHT TRANSPARENT}{COLOR WHITE2}Verbindungsfehler...\n"
	.string "Die Kabelverbindungen überprüfen und\n"
	.string "die Geräte aus- und wieder einschalten.$"

gSystemText_OptionMenu:: @ 842C3A6
	.string "{PALETTE 9}OPTIONEN$"

gSystemText_TextSpeed:: @ 842C3B0
	.string "{PALETTE 9}TEXT-TEMPO$"

gSystemText_BattleScene:: @ 842C3BE
	.string "{PALETTE 9}ANIMATION$"

gSystemText_BattleStyle:: @ 842C3CE
	.string "{PALETTE 9}KAMPFSTIL$"

gSystemText_Sound:: @ 842C3DE
	.string "{PALETTE 9}TON$"

gSystemText_Frame:: @ 842C3E7
	.string "{PALETTE 9}RAHMEN$"

gSystemText_Cancel:: @ 842C3F0
	.string "{PALETTE 9}ZURÜCK$"

gSystemText_ButtonMode:: @ 842C3FA
	.string "{PALETTE 9}KNOPFBELEGUNG$"

gSystemText_Slow:: @ 842C409
	.string "{PALETTE 15}1$"

gSystemText_Mid:: @ 842C411
	.string "{PALETTE 15}2$"

gSystemText_Fast:: @ 842C418
	.string "{PALETTE 15}3$"

gSystemText_On:: @ 842C420
	.string "{PALETTE 15}EIN$"

gSystemText_Off:: @ 842C426
	.string "{PALETTE 15}AUS$"

gSystemText_Shift:: @ 842C42D
	.string "{PALETTE 15}WECHSEL$"

gSystemText_Set:: @ 842C436
	.string "{PALETTE 15}FOLGE$"

gSystemText_Mono:: @ 842C43D
	.string "{PALETTE 15}MONO$"

gSystemText_Stereo:: @ 842C445
	.string "{PALETTE 15}STEREO$"

gSystemText_Type:: @ 842C44F
	.string "{PALETTE 15}MOTIV $"

gSystemText_Terminator:: @ 842C457
	.string "{PALETTE 8}$"

gSystemText_Normal:: @ 842C45B
	.string "{PALETTE 15}NORMAL$"

gSystemText_LR:: @ 842C465
	.string "{PALETTE 15}L/R$"

gSystemText_LA:: @ 842C46B
	.string "{PALETTE 15}L=A$"

SystemText_Pokedex::
	.string "POKéDEX$"
SystemText_Pokemon::
	.string "POKéMON$"
SystemText_BAG::
	.string "BEUTEL$"
SystemText_Pokenav::
	.string "POKéNAV$"
SystemText_Player::
	.string "{PLAYER}$"
SystemText_Save::
	.string "SICHERN$"
SystemText_Option::
	.string "OPTION.$"
SystemText_Exit::
	.string "BEENDEN$"
SystemText_Retire:: @ safari zone?
	.string "SCHLUSS$"

gOtherText_SafariStock:: @ 842C4A9
	.string "SAFARIBÄLLE\n"
	.string "Vorrat: {STR_VAR_1}$"

gSystemText_LinkStandby:: @ 842C4C0
	.string "Verbindung...\n"
	.string "... ... B-Knopf: Abbrechen$"

gSystemText_LoadEventPressA:: @ 842C4E9
	.string "Lade Geschehen mit A-Knopf.\n"
	.string "... ... B-Knopf: Abbrechen$"

gSystemText_LoadingEvent:: @ 842C524
	.string "Geschehen wird geladen.$"

gSystemText_DontCutLink:: @ 842C535
	.string "Verbindungskabel nicht entfernen!\n"
	.string "Die Geräte nicht ausschalten!$"

gSystemText_EventLoadSuccess:: @ 842C571
	.string "Geschehen ist erfolgreich geladen.$$"

gSystemText_LoadingError:: @ 842C58F
	.string "Fehler beim Laden!\n"
	.string "Vorgang wird abgebrochen.$$$$$$$$"

gOtherText_Hoenn:: @ 842C5B5
	.string "HOENN$"

gOtherText_OhABite:: @ 842C5BB
	.string "Oh! Da hat etwas angebissen!$"

gOtherText_PokeOnHook:: @ 842C5C7
	.string "Du hast ein POKéMON am Haken!{PAUSE_UNTIL_PRESS}$"

gOtherText_NotEvenANibble:: @ 842C5E2
	.string "Nicht mal ein klitzekleines Knabbern...{PAUSE_UNTIL_PRESS}$"

gOtherText_ItGotAway:: @ 842C5F9
	.string "Es ist entkommen...{PAUSE_UNTIL_PRESS}$$"

gTradeText_WillBeSent:: @ 842C60B
	.string "{STR_VAR_2} wird {STR_VAR_1} zugesandt.$"

gTradeText_ByeBye:: @ 842C622
	.string "Tschüss, {STR_VAR_2}!$"

gTradeText_SentOverPoke:: @ 842C62F
	.string "{STR_VAR_1} versandte {STR_VAR_3}.$"

gTradeText_TakeGoodCare:: @ 842C640
	.string "Kümmere dich gut um {STR_VAR_3}!$"

TradeText_Cancel::
	.string "ZUR.$"
TradeText_ChoosePoke::
	.string "Wähle ein POKéMON.$"
TradeText_Summary1::
	.string "BERICHT$"
TradeText_Trade1::
	.string "TAUSCH$"
TradeText_CancelTradePrompt::
	.string "Tausch abbrechen?$"
TradeText_PressBToExit::
	.string "Mit B-Knopf beenden.$"
TradeText_Summary2::
	.string "BERICHT$"
TradeText_Trade2::
	.string "TAUSCH$"
TradeText_LinkStandby::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Verbindung...\n"
	.string "Bitte warten...$"
TradeText_TradeCancelled::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Der Tausch\n"
	.string "wurde abgebrochen.$"
TradeText_OnlyPoke::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Das ist das einzige\n"
	.string "POKéMON zum Kampf.$"
TradeText_NonTradablePoke::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Dein Freund kann\n"
	.string "das nicht senden.$"
TradeText_WaitingForFriend::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Dein Freund ist\n"
	.string "noch nicht fertig...$"
TradeText_WantToTrade::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}Dein Freund möchte\n"
	.string "POKéMON tauschen.$"
	.string "$"

gTradeText_TradeOkayPrompt:: @ 842C7B6
	.string "Ist der Tausch O.K.?$"

gOtherText_Terminator2:: @ 842C7CA
	.string "$"

gOtherText_ControlAndMiscText:: @ 842C7CB
	.string "\n$"
	.string "/$"
	.string "Lv.$"
	.string "---$"

gOtherText_FourQuestions:: @ 842C7D6
	.string "????$"

@ 842C7DB
	.include "data/text/easy_chat/group_name_strings.inc"

gOtherText_ThreeQuestions:: @ 842C890
	.string "???$"

gOtherText_From:: @ 842C894
	.string "Von $"

gOtherText_MixingRecordsWithFriend:: @ 842C89A
	.string "Rekorddaten-Austausch...$"

gOtherText_MixingComplete:: @ 842C8AC
	.string "Rekorddaten-Austausch beendet.\n"
	.string "Vielen Dank für deine Geduld.$"

gOtherText_TrainersTrainerCard:: @ 842C8DC
	.string "TRAINERPASS von {PLAYER}$"

gOtherText_FirstHOF:: @ 842C8EC
	.string "ERSTE RUHMESHALLE:$"

gOtherText_LinkCableBattles:: @ 842C8FF
	.string "KÄMPFE GG. FREUND/E  S.:            N.:$"

gOtherText_BattleTowerWinRecord:: @ 842C924
	.string "DUELLTURM-S.:{CLEAR_TO 114}&{CLEAR_TO 152} IN FOLGE$"

gOtherText_ContestRecord:: @ 842C943
	.string "WETTB. MIT FREUND/EN S.:$"

gOtherText_MixingRecord:: @ 842C959
	.string "{POKEBLOCK} MIT FREUND/EN:$"

gOtherText_TradeRecord:: @ 842C96A
	.string "POKéMON-TAUSCH:$"

gOtherText_Boy:: @ 842C979
	.string "JUNGE$"

gOtherText_Girl:: @ 842C97D
	.string "MÄDEL$"
	.string "$"

gOtherText_Player:: @ 842C983
	.string "SPIELER$"

gOtherText_Badges:: @ 842C98A
	.string "ORDEN$"
	.string "$"

gOtherText_Pokedex:: @ 842C992
	.string "POKéDEX$"

gOtherText_PlayTime:: @ 842C99A
	.string "SPIELZEIT$"

gOtherText_SentToPC:: @ 842C9A4
	.string "{STR_VAR_1} wurde auf\n"
	.string "den PC übertragen.{PAUSE_UNTIL_PRESS}$"

OtherText_YourName::
	.string "DEIN NAME?$"
OtherText_BoxName::
	.string "NAME DER BOX?$"
OtherText_PokeName::
	.string "Kosename f. {STR_VAR_1}$"

gOtherText_Marco:: @ 842C9E1
	.string "MARCO$" @ polo

gOtherText_Coins:: @ 842C9E7
	.string "{STR_VAR_1} MÜNZ.$"

gOtherText_BattleResults:: @ 842C9F0
	.string "KAMPFERGEBNISSE von {PLAYER}$"

gOtherText_WinRecord:: @ 842CA04
	.string "GESAMT-REKORD S.:{STR_VAR_1} N.:{STR_VAR_2} P.:{STR_VAR_3}$"

gOtherText_WinLoseDraw:: @ 842CA20
	.string "SIEG      NIEDER.     PATT$"

gOtherText_SevenDashes:: @ 842CA3C
	.string "-------$"

gOtherText_FourDashes:: @ 842CA44
	.string "----$"

gOtherText_BattleTowerResults:: @ 842CA49
	.string "DUELLTURM-ERGEBNIS. von {PLAYER}$"

gOtherText_Lv50:: @ 842CA63
	.string "Lv. 50$"

gOtherText_Lv100:: @ 842CA69
	.string "Lv. 100$"

gOtherText_WinStreak:: @ 842CA70
	.string "{STR_VAR_1}S IN FOLGE$"

gOtherText_Current:: @ 842CA7B
	.string "MOMENTAN$"

gOtherText_Record:: @ 842CA83
	.string "REKORD$"

gOtherText_Prev:: @ 842CA8A
	.string "VORHER$"

gOtherText_QuitGamePrompt:: @ 842CA90
	.string "Spiel beenden?$"

gOtherText_MaxCoins:: @ 842CA9F
	.string "Du hast 9.999 MÜNZEN.$"

gOtherText_OutOfCoins:: @ 842CAB7
	.string "Du hast keine MÜNZEN mehr.\n"
	.string "Game over!$"

gOtherText_DontHaveThreeCoins:: @ 842CADB
	.string "Du hast keine drei MÜNZEN.$"

gOtherText_ReelTime:: @ 842CAF7
	.string "REEL TIME\n"
	.string "Hier hast du die Chance, in\n"
	.string "Blitzesschnelle zu gewinnen!\n"
	.string "Die Glücksrunde wiederholt\n"
	.string "sich, so oft die Zahl anzeigt.\n"
	.string "Sie endet mit einem BIG BONUS!$"

DaycareText_GetAlongVeryWell::
	.string "Die beiden scheinen sich sehr zu mögen.$"
DaycareText_GetAlong::
	.string "Die beiden scheinen sich zu vertragen.$"
DaycareText_DontLikeOther::
	.string "Die beiden mögen sich nicht sehr.$"
DaycareText_PlayOther::
	.string "Die beiden spielen lieber mit anderen\n"
	.string "POKéMON als miteinander.$"

gOtherText_NewLine2:: @ 842CC28
	.string "\n$"

gOtherText_CancelAndLv:: @ 842CC2A
	.string "KEINES$"
	.string "Lv.$"

gEggNickname:: @ 842CC34
	.string "EI$"

gOtherText_HatchedFromEgg:: @ 842CC38
	.string "{COLOR WHITE2}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GREY}{STR_VAR_1} schlüpfte aus dem EI!$"

gOtherText_NickHatchPrompt:: @ 842CC5A
	.string "{COLOR WHITE2}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GREY}Möchtest du dem geschlüpften\n"
	.string "{STR_VAR_1} einen Kosenamen geben?$"

OtherText_Battle::
	.string "KAMPF$"
OtherText_Contest::
	.string "WETTB.$"
OtherText_Type::
	.string "TYP/$"
OtherText_PP::
	.string "AP/$"
OtherText_Power::
	.string "STÄRKE$"
OtherText_Accuracy::
	.string "GENAU.$"
OtherText_Appeal::
	.string "AUSDRUCK$"
OtherText_Jam::
	.string "EINDRUCK$"

gOtherText_TeachWhichMove:: @ 842CCC7
	.string "{STR_VAR_1} welche Attacke beibr.?$"

gOtherText_TeachSpecificMove:: @ 842CCDF
	.string "{STR_VAR_2} beibringen?$"

gOtherText_PokeLearnedMove:: @ 842CCE9
	.string "{STR_VAR_1} erlernte {STR_VAR_2}.$"

gOtherText_DeleteOlderMove:: @ 842CCF8
	.string "{STR_VAR_1} versucht,\n"
	.string "{STR_VAR_2} zu erlernen.\p"
	.string "Aber {STR_VAR_1} kann nicht mehr\n"
	.string "als vier Attacken erlernen.\p"
	.string "Soll eine Attacke zu Gunsten von\n"
	.string "{STR_VAR_2} vergessen werden?$"

gOtherText_StopLearningMove:: @ 842CD65
	.string "{STR_VAR_2} nicht erlernen?$"

gOtherText_ForgotMove123:: @ 842CD77
	.string "{PAUSE 32}1, {PAUSE 15}2 {PAUSE 15}...{PAUSE 15}...{PAUSE 15}...{PAUSE 15} {PLAY_SE 0x38 0x00} Schwupp!\p$"

deuOtherText_ForgotAndLearned:: @ 843912f
	.string "{STR_VAR_1} vergaß {STR_VAR_3}.\p"
	.string "Und...\p"
	.string "{STR_VAR_1} erlernt {STR_VAR_2}.$"

gOtherText_ForgotOrDidNotLearnMove:: @ 842CDA3
	.string "{STR_VAR_1} hat {STR_VAR_2}\n"
	.string "nicht erlernt.$"

gOtherText_GiveUpTeachingMove:: @ 842CDDC
	.string "Soll {STR_VAR_1} keine neue Attacke\n"
	.string "erlernen?$"

gOtherText_WhichMoveToForget:: @ 842CE06
	.string "Welche Attacke soll vergessen\n"
	.string "werden?\p"
	.string "$"

gSystemText_ClearAllSaveDataPrompt:: @ 842CE27
	.string "Alle gesich. Datenbereiche löschen?$"

gSystemText_ClearingData:: @ 842CE42
	.string "Daten werden gelöscht...\n"
	.string "Bitte warten...$"

gContestText_AnnounceResults:: @ 842CE60
	.string "Bekanntgabe der Ergebnisse!$"

gContestText_PreliminaryResults:: @ 842CE78
	.string "Ergebnisse 1. Durchlauf!$"

gContestText_Round2Results:: @ 842CE91
	.string "Ergebnisse 2. Durchlauf!$"

gContestText_PokeWon:: @ 842CEA2
	.string "Sieger ist: {STR_VAR_2} von {STR_VAR_1}!$"

gOtherText_LinkStandby:: @ 842CEAF
	.string "Verbindung...$"

@ 842CEBF
	.include "data/text/landmarks.inc"

gOtherText_Terminator4:: @ 842D0E6
	.string ", $"

gOtherText_Nature:: @ 842D0E7
	.string "Wesen: $"

gOtherText_Comma:: @ 842D0F1
	.string ",$"

gOtherText_Met:: @ 842D0F3
	.string " (gef.)$"

gOtherText_Egg2:: @ 842D0FB
	.string " (EI)$"

gOtherText_ObtainedInTrade:: @ 842D103
	.string "im Tausch erhalten.$"

gOtherText_FatefulEncounter:: @ 842D118
	.string "schicksalhafte Begegnung.$"

gOtherText_Met2:: @ 842D12B
	.string " (gef.)$"

gOtherText_EggDayCare:: @ 842D133
	.string "Seltsames POKéMON-EI, das\n"
	.string "die PENSIONSLEITUNG fand.$"

gOtherText_EggNicePlace:: @ 842D164
	.string "Kurioses POKéMON-EI an\n"
	.string "hübschem Ort erhalten.$"

gOtherText_EggObtainedInTrade:: @ 842D197
	.string "Kurioses POKéMON-EI im\n"
	.string "Tausch erhalten.$"

gOtherText_EggHotSprings:: @ 842D1C3
	.string "Ein POKéMON-EI an den\n"
	.string "Heißen Quellen erhalten.$"

gOtherText_LinkStandby2:: @ 842D1EE
	.string "Verbindung...$"

gOtherText_YesNoAndPlayer:: @ 842D1FE
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}JA\n"
	.string "NEIN$"

	.string "{HIGHLIGHT TRANSPARENT}SPIELER$"

	.string "{HIGHLIGHT TRANSPARENT}$"

gOtherText_HoennDex:: @ 842D21C
	.string "HOENN$"

gOtherText_NationalDex:: @ 842D222
	.string "NATIONALER$"

gOtherText_DiplomaCertificationGameFreak:: @ 842D22B
	.string "{HIGHLIGHT TRANSPARENT}Spieler: {CLEAR 16}{COLOR RED}{PLAYER}\n"
	.string "\n"
	.string "{COLOR DARK_GREY}{STR_VAR_1} POKéDEX\n"
	.string "Dies Dokument bescheinigt\n"
	.string "die erfolgreiche Vervoll-\n"
	.string "ständigung des POKéDEX.\n"
	.string "\n"
	.string "{CLEAR_TO 66}{COLOR RED}GAME FREAK$"

	.string "{COLOR RED}{HIGHLIGHT TRANSPARENT}GAME FREAK$"

gOtherText_PLink:: @ 842D2BC
	.string "{STR_VAR_1}SP-LINK$"

gOtherText_YesNoTerminating:: @ 842D2C5
	.string "JA\n"
	.string "NEIN$"

	.string "Abbruch$"

gOtherText_LinkNotFound:: @ 842D2D9
	.string "Kein(e) Link-Partner gefunden.\n"
	.string "Bitte erneut versuchen.\p$"

gOtherText_BlenderChooseBerry:: @ 842D307
	.string "BEERENMIXER wird gestartet.\p"
	.string "Wähle die BEERE aus dem BEUTEL,\n"
	.string "die in den BEERENMIXER soll.\p$"

gOtherText_PokeBlockMade:: @ 842D368
	.string "{STR_VAR_1} wurde gemixt!$"

gOtherText_PressAToStart:: @ 842D373
	.string "Drücke A-Knopf zum Starten.$"

gOtherText_PleaseWait:: @ 842D390
	.string "Bitte hab noch ein wenig Geduld.$"

gOtherText_LinkStandby3:: @ 842D3A5
	.string "Verbindung...$"

gOtherText_BlendAnotherBerryPrompt:: @ 842D3B5
	.string "Möchtest du noch eine BEERE mixen?$"

gOtherText_OutOfBerries:: @ 842D3DC
	.string "Du hast keine BEEREN mehr zum\n"
	.string "Mixen im BEERENMIXER.\p"
	.string "$"

gOtherText_CaseIsFull:: @ 842D41A
	.string "Deine {POKEBLOCK}-BOX ist voll.\p$"

gOtherText_NoBerriesForBlend:: @ 842D434
	.string "{PLAYER} hat keine BEEREN\n"
	.string "für den BEERENMIXER.$"

gOtherText_OtherCaseIsFull:: @ 842D461
	.string "{POKEBLOCK}-BOX von {PLAYER} \n"
	.string "ist voll.\n$"

gOtherText_ResultsOfBlending:: @ 842D479
	.string "MIX-RESULTATE$"

	.string "VERW. BEERE$"

gOtherText_Berry:: @ 842D498
	.string "{STR_VAR_1}BEERE$"

gOtherText_RequiredTime:: @ 842D49F
	.string "ZEIT BENÖTIGT$"

gOtherText_Min:: @ 842D4AD
	.string "MIN.$"

gOtherText_Sec:: @ 842D4B2
	.string "SEK.$"

gOtherText_MaxSpeed:: @ 842D4B7
	.string "MAXIMALTEMPO$"

gOtherText_RPM:: @ 842D4C5
	.string " RPM$"

	.string ",$"

gOtherText_Ranking:: @ 842D4CB
	.string "STUFE$"

gOtherText_BlockLevelIs:: @ 842D4D3
	.string "Der Level ist $"

gOtherText_BlockFeelIs:: @ 842D4E1
	.string " und die Würze ist $"

gOtherText_Period:: @ 842D4F4
	.string ".$"

gOtherText_Day:: @ 842D4F6
	.string "TAG$"
	.string ":$"

gOtherText_OK:: @ 842D4FC
	.string "O.K.$"

gOtherText_CorrectTimePrompt:: @ 842D4FF
	.string "Ist die Uhrzeit korrekt?$"
