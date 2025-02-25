SlateportCity_MapScripts:: @ 814BA36
	map_script MAP_SCRIPT_ON_TRANSITION, SlateportCity_OnTransition
	.byte 0

SlateportCity_OnTransition:: @ 814BA3C
	.ifdef SAPPHIRE
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_AQUA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_1, OBJ_EVENT_GFX_AQUA_MEMBER_M
	.else
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_MAGMA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_1, OBJ_EVENT_GFX_MAGMA_MEMBER_M
	.endif
	setvar VAR_SLATEPORT_MUSEUM_1F_STATE, 0
	call SlateportCity_EventScript_EnterSlateport
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_MovePeopleForSternInterview
	end

SlateportCity_EventScript_EnterSlateport:: @ 814BA5C
	setflag FLAG_VISITED_SLATEPORT_CITY
	setvar VAR_LINK_CONTEST_ROOM_STATE, 0
	setflag FLAG_HIDE_CONTEST_REPORTER_SLATEPORT
	return

SlateportCity_EventScript_MovePeopleForSternInterview:: @ 814BA68
	setobjectxyperm 11, 28, 13
	setobjectxyperm 7, 25, 13
	setobjectxyperm 3, 25, 14
	setobjectxyperm 6, 27, 16
	setobjectxyperm 8, 28, 16
	setobjectxyperm 1, 29, 16
	setobjectxyperm 2, 31, 14
	setobjectmovementtype 11, 8
	setobjectmovementtype 7, 18
	setobjectmovementtype 3, 16
	setobjectmovementtype 6, 7
	setobjectmovementtype 8, 7
	setobjectmovementtype 1, 7
	setobjectmovementtype 2, 9
	return

SlateportCity_EventScript_EnergyGuru:: @ 814BAB6
	lock
	faceplayer
	message SlateportCity_Text_EnergyGuruSellWhatYouNeed
	waitmessage
	pokemart SlateportCity_Pokemart_EnergyGuru
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
SlateportCity_Pokemart_EnergyGuru:: @ 814BAD0
	.2byte ITEM_PROTEIN
	.2byte ITEM_IRON
	.2byte ITEM_CARBOS
	.2byte ITEM_ZINC
	.2byte ITEM_CALCIUM
	.2byte ITEM_HP_UP
	.2byte ITEM_NONE
	release
	end

SlateportCity_EventScript_EffortRibbonWoman:: @ 814BAE0
	lock
	faceplayer
	bufferleadmonspeciesname 0
	msgbox SlateportCity_Text_OhYourPokemon, MSGBOX_DEFAULT
	specialvar VAR_RESULT, LeadMonHasEffortRibbon
	compare VAR_RESULT, 1
	call_if_eq SlateportCity_EventScript_MonHasEffortRibbon
	specialvar VAR_RESULT, ScrSpecial_AreLeadMonEVsMaxedOut
	compare VAR_RESULT, 0
	call_if_eq SlateportCity_EventScript_MonEVsNotMaxed
	msgbox SlateportCity_Text_PleaseGiveItThisEffortRibbon, MSGBOX_DEFAULT
	playfanfare MUS_OBTAIN_ITEM
	message SlateportCity_Text_ReceivedEffortRibbon
	waitfanfare
	waitmessage
	msgbox SlateportCity_Text_PutEffortRibbonOnMon, MSGBOX_DEFAULT
	special GivLeadMonEffortRibbon
	release
	end

SlateportCity_EventScript_MonEVsNotMaxed:: @ 814BB2B
	msgbox SlateportCity_Text_GoForItLittleHarder, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_MonHasEffortRibbon:: @ 814BB35
	msgbox SlateportCity_Text_EffortRibbonLooksGoodOnIt, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_Cook:: @ 814BB3F
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_CookSternInterview
	msgbox SlateportCity_Text_SeaweedFullOfLife, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_CookSternInterview:: @ 814BB56
	msgbox SlateportCity_Text_CaptainComeBackWithBigFish, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_OldWoman:: @ 814BB60
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_OldWomanSternInterview
	msgbox SlateportCity_Text_HowTownIsBornAndGrows, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_OldWomanSternInterview:: @ 814BB77
	msgbox SlateportCity_Text_CaptSternBeingInterviewed, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_Girl:: @ 814BB81
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_GirlSternInterview
	goto_if_set FLAG_RECEIVED_SECRET_POWER, SlateportCity_EventScript_GirlSecretBase
	msgbox SlateportCity_Text_SlateportWonderfulPlace, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_GirlSternInterview:: @ 814BBA1
	msgbox SlateportCity_Text_InterviewerSoCool, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_GirlSecretBase:: @ 814BBAB
	msgbox SlateportCity_Text_BuyBricksSoDecorWontGetDirty, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_RichBoy:: @ 814BBB5
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_RichBoySternInterview
	msgbox SlateportCity_Text_GoingToCompeteInPokemonContest, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_RichBoySternInterview:: @ 814BBCC
	msgbox SlateportCity_Text_SternSaysDiscoveredSomething, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_FatMan:: @ 814BBD6
	compare VAR_SLATEPORT_STATE, 1
	goto_if_eq SlateportCity_EventScript_FatManSternInterview
	msgbox SlateportCity_Text_BushedHikingFromMauville, MSGBOX_NPC
	end

SlateportCity_EventScript_FatManSternInterview:: @ 814BBEA
	msgbox SlateportCity_Text_AmIOnTV, MSGBOX_SIGN
	end

SlateportCity_EventScript_Man1:: @ 814BBF3
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_Man1SternInterview
	msgbox SlateportCity_Text_EveryoneCallsHimCaptStern, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_Man1SternInterview:: @ 814BC0A
	msgbox SlateportCity_Text_CaptainsACelebrity, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_Woman1:: @ 814BC14
	lock
	faceplayer
	goto_if_set FLAG_DOCK_REJECTED_DEVON_GOODS, SlateportCity_EventScript_Woman1EvilTeamGone
	msgbox SlateportCity_Text_WhatsLongLineOverThere, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_Woman1EvilTeamGone:: @ 814BC29
	msgbox SlateportCity_Text_VisitedMuseumOften, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_ContestHallSign:: @ 814BC33
	msgbox SlateportCity_Text_PokemonContestHyperRankSign, MSGBOX_SIGN
	end

SlateportCity_EventScript_SternsShipyardSign:: @ 814BC3C
	lockall
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_EventScript_SternsShipyardFerryComplete
	goto_if_set FLAG_BADGE07_GET, SlateportCity_EventScript_SternsShipyardNearsCompletion
	msgbox SlateportCity_Text_SternsShipyardWantedSign, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_EventScript_SternsShipyardNearsCompletion:: @ 814BC59
	msgbox SlateportCity_Text_SternsShipyardNearsCompletion, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_EventScript_SternsShipyardFerryComplete:: @ 814BC63
	msgbox SlateportCity_Text_SternsShipyardFerryComplete, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_EventScript_PokemonFanClubSign:: @ 814BC6D
	msgbox SlateportCity_Text_PokemonFanClubSign, MSGBOX_SIGN
	end

SlateportCity_EventScript_OceanicMuseumSign:: @ 814BC76
	msgbox SlateportCity_Text_OceanicMuseumSign, MSGBOX_SIGN
	end

SlateportCity_EventScript_CitySign:: @ 814BC7F
	msgbox SlateportCity_Text_CitySign, MSGBOX_SIGN
	end

SlateportCity_EventScript_MarketSign:: @ 814BC88
	msgbox SlateportCity_Text_MarketSign, MSGBOX_SIGN
	end

SlateportCity_EventScript_HarborSign:: @ 814BC91
	lockall
	goto_if_set FLAG_SYS_GAME_CLEAR, SlateportCity_EventScript_HarborSignFerryComplete
	msgbox SlateportCity_Text_HarborFerryUnderConstruction, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_EventScript_HarborSignFerryComplete:: @ 814BCA5
	msgbox SlateportCity_Text_HarborSign, MSGBOX_DEFAULT
	releaseall
	end

SlateportCity_EventScript_NameRatersHouseSign:: @ 814BCAF
	msgbox SlateportCity_Text_NameRatersHouseSign, MSGBOX_SIGN
	end

SlateportCity_EventScript_Maniac:: @ 814BCB8
	lock
	faceplayer
	compare VAR_SLATEPORT_STATE, 1
	call_if_eq SlateportCity_EventScript_ManiacSternInterview
	msgbox SlateportCity_Text_GetNameRaterToHelpYou, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_ManiacSternInterview:: @ 814BCCF
	msgbox SlateportCity_Text_GetNameRaterToHelpYou, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_Woman2:: @ 814BCD9
	msgbox SlateportCity_Text_CantChangeTradeMonName, MSGBOX_NPC
	end

SlateportCity_EventScript_Sailor1:: @ 814BCE2
	msgbox SlateportCity_Text_SeaIsSoWet, MSGBOX_NPC
	end

SlateportCity_EventScript_Sailor2:: @ 814BCEB
	msgbox SlateportCity_Text_SinkOldBoats, MSGBOX_NPC
	end

SlateportCity_EventScript_PokefanF:: @ 814BCF4
	msgbox SlateportCity_Text_BuyTooMuch, MSGBOX_NPC
	end

SlateportCity_EventScript_Man2:: @ 814BCFD
	msgbox SlateportCity_Text_ContestHallBuiltRecently, MSGBOX_NPC
	end

SlateportCity_EventScript_SchoolKid:: @ 814BD06
	lock
	faceplayer
	msgbox SlateportCity_Text_DoYouKnowBerryBlender, MSGBOX_YESNO
	compare VAR_RESULT, YES
	call_if_eq SlateportCity_EventScript_ExplainBerryBlender
	compare VAR_RESULT, NO
	call_if_eq SlateportCity_EventScript_ExplainPokeblock
	release
	end

SlateportCity_EventScript_ExplainBerryBlender:: @ 814BD28
	msgbox SlateportCity_Text_ExplainBerryBlender, MSGBOX_DEFAULT
	return

SlateportCity_EventScript_ExplainPokeblock:: @ 814BD31
	msgbox SlateportCity_Text_ExplainPokeblock, MSGBOX_DEFAULT
	return

SlateportCity_EventScript_EvilTeamGrunt1:: @ 814BD3A
	lock
	faceplayer
	msgbox SlateportCity_Text_QuitPushing, MSGBOX_DEFAULT
	closemessage
	applymovement 5, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_EventScript_EvilTeamGrunt2:: @ 814BD51
	lock
	faceplayer
	msgbox SlateportCity_Text_EvilTeamHasPolicy, MSGBOX_DEFAULT
	closemessage
	applymovement 19, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_EventScript_EvilTeamGrunt3:: @ 814BD68
	lock
	faceplayer
	msgbox SlateportCity_Text_BossIsBrilliant, MSGBOX_DEFAULT
	closemessage
	applymovement 20, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_EventScript_EvilTeamGrunt4:: @ 814BD7F
	lock
	faceplayer
	msgbox SlateportCity_Text_WhatsNewSchemeIWonder, MSGBOX_DEFAULT
	closemessage
	applymovement 27, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_EventScript_EvilTeamGrunt5:: @ 814BD96
	lock
	faceplayer
	msgbox SlateportCity_Text_ShouldTakeItAll, MSGBOX_DEFAULT
	closemessage
	applymovement 28, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_EventScript_EvilTeamGrunt6:: @ 814BDAD
	lock
	faceplayer
	msgbox SlateportCity_Text_DontButtIn, MSGBOX_DEFAULT
	closemessage
	applymovement 29, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_EventScript_EvilTeamGrunt7:: @ 814BDC4
	lock
	faceplayer
	msgbox SlateportCity_Text_RemindsMeOfLongLineForGames, MSGBOX_DEFAULT
	closemessage
	applymovement 30, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_EventScript_EvilTeamGrunt8:: @ 814BDDB
	lock
	faceplayer
	msgbox SlateportCity_Text_WhyAreWeLiningUp, MSGBOX_DEFAULT
	closemessage
	applymovement 31, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_EventScript_DollClerk:: @ 814BDF2
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemartdecoration SlateportCity_PokemartDecor1_Dolls
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
SlateportCity_PokemartDecor1_Dolls:: @ 814BE0C
	.2byte DECOR_AZURILL_DOLL
	.2byte DECOR_MARILL_DOLL
	.2byte DECOR_SKITTY_DOLL
	.2byte DECOR_NONE
	release
	end

SlateportCity_EventScript_ComeBackWithSecretPower:: @ 814BE16
	msgbox gText_ComeBackWithSecretPower, MSGBOX_DEFAULT
	release
	end

SlateportCity_EventScript_DecorClerk:: @ 814BE20
	lock
	faceplayer
	goto_if_unset FLAG_RECEIVED_SECRET_POWER, SlateportCity_EventScript_ComeBackWithSecretPower
	message Text_HowMayIServeYou
	waitmessage
	pokemartdecoration SlateportCity_PokemartDecor1
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
SlateportCity_PokemartDecor1:: @ 814BE40
	.2byte DECOR_RED_BRICK
	.2byte DECOR_BLUE_BRICK
	.2byte DECOR_YELLOW_BRICK
	.2byte DECOR_RED_BALLOON
	.2byte DECOR_BLUE_BALLOON
	.2byte DECOR_YELLOW_BALLOON
	.2byte DECOR_C_LOW_NOTE_MAT
	.2byte DECOR_D_NOTE_MAT
	.2byte DECOR_E_NOTE_MAT
	.2byte DECOR_F_NOTE_MAT
	.2byte DECOR_G_NOTE_MAT
	.2byte DECOR_A_NOTE_MAT
	.2byte DECOR_B_NOTE_MAT
	.2byte DECOR_C_HIGH_NOTE_MAT
	.2byte DECOR_NONE
	release
	end

@ 814BE60
	lock
	faceplayer
	goto_if_unset FLAG_RECEIVED_SECRET_POWER, SlateportCity_EventScript_ComeBackWithSecretPower
	message Text_HowMayIServeYou
	waitmessage
	pokemartdecoration SlateportCity_PokemartDecor2
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
SlateportCity_PokemartDecor2:: @ 814BE80
	.2byte DECOR_MUD_BALL
	.2byte DECOR_SLIDE
	.2byte DECOR_FENCE_LENGTH
	.2byte DECOR_FENCE_WIDTH
	.2byte DECOR_TIRE
	.2byte DECOR_BREAKABLE_DOOR
	.2byte DECOR_SOLID_BOARD
	.2byte DECOR_STAND
	.2byte DECOR_TV
	.2byte DECOR_ROUND_TV
	.2byte DECOR_CUTE_TV
	.2byte DECOR_NONE
	release
	end

SlateportCity_EventScript_PowerTMClerk:: @ 814BE9A
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart SlateportCity_Pokemart_PowerTMs
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
SlateportCity_Pokemart_PowerTMs:: @ 814BEB4
	.2byte ITEM_TM10_HIDDEN_POWER
	.2byte ITEM_TM43_SECRET_POWER
	.2byte ITEM_NONE
	release
	end

SlateportCity_EventScript_CaptStern:: @ 814BEBC
	lockall
	msgbox SlateportCity_Text_SternMoveAheadWithExploration, MSGBOX_DEFAULT
	msgbox SlateportCity_Text_GabbyWonderfulThanksForInterview, MSGBOX_DEFAULT
	closemessage
	applymovement 10, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 10
	applymovement 9, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 25
	applymovement 11, SlateportCity_Movement_SternWatchGabbyAndTyExit
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Movement_PlayerFaceStern
	applymovement 10, SlateportCity_Movement_GabbyExit
	applymovement 9, SlateportCity_Movement_TyExit
	waitmovement 0
	removeobject 10
	removeobject 9
	msgbox SlateportCity_Text_SternWhewFirstInterview, MSGBOX_DEFAULT
	applymovement 11, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	msgbox SlateportCity_Text_OhPlayerWeMadeDiscovery, MSGBOX_DEFAULT
	playbgm MUS_EVIL_TEAM, FALSE
	msgbox SlateportCity_Text_EvilTeamWillAssumeControlOfSubmarine, MSGBOX_DEFAULT
	applymovement 6, Common_Movement_WalkInPlaceFastestLeft
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	applymovement 7, SlateportCity_Movement_OldWomanConcern
	applymovement 3, Common_Movement_QuestionMark
	applymovement 2, SlateportCity_Movement_ManConcern
	waitmovement 0
	applymovement 11, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	msgbox SlateportCity_Text_SternWhatWasAllThat, MSGBOX_DEFAULT
	playse SE_PIN
	applymovement 11, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 11, Common_Movement_Delay48
	waitmovement 0
	msgbox SlateportCity_Text_FromHarborTryingToTakeSub, MSGBOX_DEFAULT
	applymovement 11, Common_Movement_FacePlayer
	waitmovement 0
	msgbox SlateportCity_Text_PleaseComeWithMe, MSGBOX_DEFAULT
	closemessage
	applymovement 11, SlateportCity_Movement_SternEnterHarbor
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Movement_PlayerEnterHarbor
	waitmovement 0
	removeobject 11
	clearflag FLAG_HIDE_STERN_SLATEPORT_HARBOR
	clearflag FLAG_HIDE_SUBMARINE_SHADOW_SLATEPORT_HARBOR
	clearflag FLAG_HIDE_GRUNT_1_SLATEPORT_HARBOR
	clearflag FLAG_HIDE_GRUNT_2_SLATEPORT_HARBOR
	setvar VAR_SLATEPORT_STATE, 2
	warp MAP_SLATEPORT_CITY_HARBOR, 255, 11, 14
	waitstate
	releaseall
	end

SlateportCity_Movement_OldWomanConcern:: @ 814BFCD
	delay_16
	delay_16
	emote_question_mark
	walk_in_place_fastest_right
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

SlateportCity_Movement_ManConcern:: @ 814BFD5
	emote_question_mark
	walk_in_place_fastest_up
	delay_16
	walk_in_place_fastest_down
	delay_16
	delay_16
	walk_in_place_fastest_left
	step_end

SlateportCity_Movement_GabbyExit:: @ 814BFDD
	delay_16
	walk_left
	walk_left
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

SlateportCity_Movement_TyExit:: @ 814BFEA
	walk_down
	walk_left
	walk_left
	walk_left
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

SlateportCity_Movement_Unused:: @ 814BFF8
	walk_down
	walk_in_place_fastest_up
	step_end

SlateportCity_Movement_SternEnterHarbor:: @ 814BFFB
	walk_right
	walk_up
	walk_up
	set_invisible
	step_end

SlateportCity_Movement_SternWatchGabbyAndTyExit:: @ 814C000
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_down
	walk_left
	step_end

SlateportCity_Movement_PlayerEnterHarbor:: @ 814C008
	walk_in_place_fastest_right
	delay_16
	delay_16
	walk_right
	walk_up
	step_end

SlateportCity_Movement_PlayerFaceStern:: @ 814C00E
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_down
	step_end

SlateportCity_EventScript_Ty:: @ 814C017
	msgbox SlateportCity_Text_BigSmileForCamera, MSGBOX_SIGN
	end

SlateportCity_EventScript_Gabby:: @ 814C020
	msgbox SlateportCity_Text_MostInvaluableExperience, MSGBOX_SIGN
	end

SlateportCity_EventScript_Man3:: @ 814C029
	msgbox SlateportCity_Text_WonderIfLighthouseStartlesPokemon, MSGBOX_NPC
	end
