@ From mauville_old_man.h
@ TODO: Put these in a header

MAUVILLE_MAN_BARD        = 0
MAUVILLE_MAN_HIPSTER     = 1
MAUVILLE_MAN_TRADER      = 2
MAUVILLE_MAN_STORYTELLER = 3
MAUVILLE_MAN_GIDDY       = 4

MauvilleCity_PokemonCenter_1F_EventScript_1AE744:: @ 81AE744
	special ScrSpecial_GetCurrentMauvilleMan
	switch RESULT
	case MAUVILLE_MAN_BARD,        speak_to_bard
	case MAUVILLE_MAN_HIPSTER,     speak_to_hipster
	case MAUVILLE_MAN_TRADER,      speak_to_trader
	case MAUVILLE_MAN_STORYTELLER, speak_to_storyteller
	case MAUVILLE_MAN_GIDDY,       speak_to_giddy
	end

@-------------------------------------------------------------------------------
@ Bard
@-------------------------------------------------------------------------------

speak_to_bard:
	lock
	faceplayer
	msgbox gTextBard_HiImTheBard, MSGBOX_YESNO
	compare RESULT, YES
	jumpeq yes_hear_song
	compare RESULT, NO
	jumpeq dont_hear_song
	end
yes_hear_song:
	setvar 0x8004, 0
	@ Give the player ear rape
	special ScrSpecial_PlayBardSong
	pause 60
	special ScrSpecial_HasBardSongBeenChanged
	compare RESULT, FALSE
	@ Prompt new lyrics only if song hasn't been changed
	jumpeq prompt_write_lyrics
	msgbox gTextBard_OhWhatAMovingSong, 4
	release
	end
dont_hear_song:
	msgbox gTextBard_OhYouveLeftMe, 4
	release
	end
prompt_write_lyrics:
	msgbox gTextBard_SoHowDoYouLikeMySong, MSGBOX_YESNO
	compare RESULT, YES
	jumpeq write_lyrics
	compare RESULT, NO
	jumpeq dont_write_lyrics
	end
write_lyrics:
	setvar 0x8004, 6
	call MauvilleCity_PokemonCenter_1F_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, NO
	jumpeq dont_write_lyrics
	msgbox gTextBard_ThankYouKindly, 4
	setvar 0x8004, 1
	@ Give the player ear rape again
	special ScrSpecial_PlayBardSong
	pause 60
	msgbox gTextBard_WasThatHowYouWanted, MSGBOX_YESNO
	compare RESULT, NO
	jumpeq write_lyrics		@ Keep looping until player responds YES
	special ScrSpecial_SaveBardSongLyrics
	msgbox gTextBard_OkayThatsIt, 4
	release
	end
dont_write_lyrics:
	msgbox gTextBard_OhYouveLeftMe2, 4
	release
	end

@-------------------------------------------------------------------------------
@ Hipster
@-------------------------------------------------------------------------------

speak_to_hipster:
	lock
	faceplayer
	setflag 2054
	msgbox gTextHipster_TheyCallMeTheHipster, 4
	special ScrSpecial_GetHipsterSpokenFlag
	compare RESULT, FALSE
	jumpeq hipster_first_time
	msgbox gTextHipster_TaughtYouAlready, 4
	release
	end
hipster_first_time:
	special ScrSpecial_HipsterTeachWord
	compare RESULT, TRUE		@ TRUE if player learned a new word
	jumpeq teach_new_word
	msgbox gTextHipster_YouAlreadyKnowALot, 4
	release
	end
teach_new_word:
	msgbox gTextHipster_HaveYouHeardAbout, 4
	special ScrSpecial_SetHipsterSpokenFlag
	release
	end

@-------------------------------------------------------------------------------
@ Trader
@-------------------------------------------------------------------------------

	.include "data/text/trader.inc"

speak_to_trader:
	lock
	faceplayer
	msgbox gTextTrader_Introduction, MSGBOX_YESNO
	compare RESULT, NO
	jumpeq dont_want_to_trade
	special ScrSpecial_GetTraderTradedFlag
	compare RESULT, TRUE
	jumpeq already_traded
	message gTextTrader_MenuPrompt
	waittext
	jump do_trader_menu_get
	end
dont_want_to_trade:
	msgbox gTextTrader_FeelUnwanted1, 2
	end
already_traded:
	msgbox gTextTrader_TradedAlready, 2
	end
do_trader_menu_get:
	special ScrSpecial_TraderMenuGetDecoration
	waitstate
	compare 0x8004, 0
	jumpeq cancelled_get_menu
	compare 0x8004, 65535
	jumpeq rare_item_cant_trade_away
	msgbox gTextTrader_ItemOnceBelongedTo, MSGBOX_YESNO
	compare RESULT, NO
	jumpeq dont_want_item
	special ScrSpecial_DoesPlayerHaveNoDecorations
	compare RESULT, TRUE
	jumpeq player_has_no_decorations
	jump do_trader_menu_give
	end
cancelled_get_menu:
	msgbox gTextTrader_DontWantAnything, 2
	end
rare_item_cant_trade_away:
	message gTextTrader_ICantTradeThatOneAway
	waittext
	jump do_trader_menu_get
	end
dont_want_item:
	message gTextTrader_MenuPrompt
	waittext
	jump do_trader_menu_get
	end
player_has_no_decorations:
	msgbox gTextTrader_YouDontHaveDecorations, 2
	end
do_trader_menu_give:
	msgbox gTextTrader_PickDecorationYoullTrade, 4
	special ScrSpecial_TraderMenuGiveDecoration
	waitstate
	compare 0x8006, 0
	jumpeq cancelled_give_menu
	compare 0x8006, 65535
	jumpeq decoration_is_in_use
	special ScrSpecial_IsDecorationFull
	compare RESULT, 1
	jumpeq decorations_full
	msgbox gTextTrader_SoWellTrade, MSGBOX_YESNO
	compare RESULT, NO
	jumpeq do_trader_menu_give
	special ScrSpecial_TraderDoDecorationTrade
	msgbox gTextTrader_ThenWellTrade, 2
	end
cancelled_give_menu:
	msgbox gTextTrader_FeelUnwanted2, 2
	end
decoration_is_in_use:
	msgbox gTextTrader_InUseYouCantTradeIt, 4
	jump do_trader_menu_give
	end
decorations_full:
	msgbox gTextTrader_NoRoomForThis, 2
	end

@-------------------------------------------------------------------------------
@ Storyteller
@-------------------------------------------------------------------------------

	.include "data/text/storyteller.inc"

speak_to_storyteller:
	setvar 0x8008, 0
	setvar 0x8009, 0
	setvar 0x800a, 0
	setvar 0x800b, 0
	lock
	faceplayer
	msgbox gTextStoryteller_Introduction, MSGBOX_YESNO
	compare RESULT, NO
	jumpeq dont_hear_story
	specialval RESULT, ScrSpecial_StorytellerGetFreeStorySlot
	compare RESULT, 0		@ If slot is 0, then the list is empty
	jumpeq no_stories_recorded
choose_story:
	message gTextStoryteller_WhichTale
	waittext
	special ScrSpecial_StorytellerStoryListMenu
	waitstate
	compare RESULT, FALSE
	jumpeq cancel_story_menu
	setvar 0x8008, 1
	special ScrSpecial_StorytellerDisplayStory
	waittext
	waitbutton
	specialval RESULT, ScrSpecial_StorytellerUpdateStat
	compare RESULT, FALSE
	jumpeq no_stat_update
	jump stat_update
cancel_story_menu:
	compare 0x8008, 0
	jumpeq dont_hear_story
	jump yes_hear_story
no_stat_update:
	msgbox gTextStoryteller_CouldThereBeOtherTrainers, 4
	msgbox gTextStoryteller_HearAnotherLegendaryTale, MSGBOX_YESNO
	compare RESULT, YES
	jumpeq choose_story
yes_hear_story:
	specialval RESULT, ScrSpecial_HasStorytellerAlreadyRecorded
	compare RESULT, TRUE
	jumpeq cant_record_story		@ already recorded story
	specialval RESULT, ScrSpecial_StorytellerGetFreeStorySlot
	compare RESULT, 4
	jumpeq cant_record_story		@ story list is full
	jump prompt_record_story
no_stories_recorded:
	msgbox gTextStoryteller_ButIKnowOfNoLegendaryTrainers, 4
prompt_record_story:
	msgbox gTextStoryteller_HaveYouAnyTales, MSGBOX_YESNO
	compare RESULT, NO
	jumpeq dont_hear_story
	specialval RESULT, ScrSpecial_StorytellerInitializeRandomStat
	compare RESULT, TRUE
	jumpeq stat_update
	msgbox gTextStoryteller_ImNotSatisfied, 4
	closebutton
	release
	end
stat_update:
	msgbox gTextStoryteller_BirthOfANewLegend, 4
	closebutton
	release
	end
dont_hear_story:
	msgbox gTextStoryteller_OhIFeelStifled, 4
	closebutton
	release
	end
cant_record_story:
	msgbox gTextStoryteller_WishMorePeopleWould, 4
	closebutton
	release
	end

@-------------------------------------------------------------------------------
@ Giddy
@-------------------------------------------------------------------------------

	.include "data/text/giddy.inc"

speak_to_giddy:
	lock
	faceplayer
	msgbox gTextGiddy_Introduction, MSGBOX_YESNO
	compare RESULT, YES
	jumpeq yes_hear_giddy
	compare RESULT, NO
	jumpeq dont_hear_giddy
	end
yes_hear_giddy:
	special ScrSpecial_GiddyShouldTellAnotherTale
	compare RESULT, TRUE
	jumpeq tell_giddy_tale
	compare RESULT, FALSE
	jumpeq bye_bye
	end
tell_another_giddy_tale:
	special ScrSpecial_GiddyShouldTellAnotherTale
	compare RESULT, TRUE
	jumpeq also_i_was_thinking
	compare RESULT, FALSE
	jumpeq bye_bye
	end
also_i_was_thinking:
	msgbox gTextGiddy_AlsoIWasThinking, 4
	jump tell_giddy_tale
	end
tell_giddy_tale:
	special ScrSpecial_GenerateGiddyLine
	special ShowFieldMessageStringVar4
	waittext
	yesnobox 20, 8
	compare RESULT, 1
	jumpeq tell_another_giddy_tale
	compare RESULT, 0
	jumpeq tell_another_giddy_tale
	end
dont_hear_giddy:
	msgbox gTextGiddy_YouveDeflatedMe, 4
	release
	end
bye_bye:
	msgbox gTextGiddy_ByeBye, 4
	release
	end

	.include "data/text/bard.inc"
	.include "data/text/hipster.inc"