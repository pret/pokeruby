#include "constants/mauville_man.h"

MauvilleCity_PokemonCenter_1F_EventScript_1AE744:: @ 81AE744
	special ScrSpecial_GetCurrentMauvilleMan
	switch RESULT
	case MAUVILLE_MAN_BARD,        SpeakToBard
	case MAUVILLE_MAN_HIPSTER,     SpeakToHipster
	case MAUVILLE_MAN_TRADER,      SpeakToTrader
	case MAUVILLE_MAN_STORYTELLER, SpeakToStoryteller
	case MAUVILLE_MAN_GIDDY,       SpeakToGiddy
	end


@-------------------------------------------------------------------------------
@ Bard
@-------------------------------------------------------------------------------

SpeakToBard:
	lock
	faceplayer
	msgbox gTextBard_HiImTheBard, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq yes_hear_song
	compare RESULT, NO
	goto_if_eq dont_hear_song
	end

yes_hear_song:
	setvar VAR_SPECIAL_4, 0
	@ Give the player ear rape
	special ScrSpecial_PlayBardSong
	delay 60
	special ScrSpecial_HasBardSongBeenChanged
	compare RESULT, FALSE
	@ Prompt new lyrics only if song hasn't been changed
	goto_if_eq prompt_write_lyrics
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
	goto_if_eq write_lyrics
	compare RESULT, NO
	goto_if_eq dont_write_lyrics
	end

write_lyrics:
	setvar VAR_SPECIAL_4, 6
	call MauvilleCity_PokemonCenter_1F_EventScript_1A00F3
	lock
	faceplayer
	compare RESULT, NO
	goto_if_eq dont_write_lyrics
	msgbox gTextBard_ThankYouKindly, 4
	setvar VAR_SPECIAL_4, 1
	@ Give the player ear rape again
	special ScrSpecial_PlayBardSong
	delay 60
	msgbox gTextBard_WasThatHowYouWanted, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq write_lyrics		@ Keep looping until player responds YES
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

SpeakToHipster:
	lock
	faceplayer
	setflag FLAG_SYS_HIPSTER_MEET
	msgbox gTextHipster_TheyCallMeTheHipster, 4
	special ScrSpecial_GetHipsterSpokenFlag
	compare RESULT, FALSE
	goto_if_eq hipster_first_time
	msgbox gTextHipster_TaughtYouAlready, 4
	release
	end

hipster_first_time:
	special ScrSpecial_HipsterTeachWord
	compare RESULT, TRUE		@ TRUE if player learned a new word
	goto_if_eq teach_new_word
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

SpeakToTrader:
	lock
	faceplayer
	msgbox gTextTrader_Introduction, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq dont_want_to_trade
	special ScrSpecial_GetTraderTradedFlag
	compare RESULT, TRUE
	goto_if_eq already_traded
	message gTextTrader_MenuPrompt
	waitmessage
	goto do_trader_menu_get
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
	compare VAR_SPECIAL_4, 0
	goto_if_eq cancelled_get_menu
	compare VAR_SPECIAL_4, -1
	goto_if_eq rare_item_cant_trade_away
	msgbox gTextTrader_ItemOnceBelongedTo, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq dont_want_item
	special ScrSpecial_DoesPlayerHaveNoDecorations
	compare RESULT, TRUE
	goto_if_eq player_has_no_decorations
	goto do_trader_menu_give
	end

cancelled_get_menu:
	msgbox gTextTrader_DontWantAnything, 2
	end

rare_item_cant_trade_away:
	message gTextTrader_ICantTradeThatOneAway
	waitmessage
	goto do_trader_menu_get
	end

dont_want_item:
	message gTextTrader_MenuPrompt
	waitmessage
	goto do_trader_menu_get
	end

player_has_no_decorations:
	msgbox gTextTrader_YouDontHaveDecorations, 2
	end

do_trader_menu_give:
	msgbox gTextTrader_PickDecorationYoullTrade, 4
	special ScrSpecial_TraderMenuGiveDecoration
	waitstate
	compare VAR_SPECIAL_6, 0
	goto_if_eq cancelled_give_menu
	compare VAR_SPECIAL_6, -1
	goto_if_eq decoration_is_in_use
	special ScrSpecial_IsDecorationFull
	compare RESULT, 1
	goto_if_eq decorations_full
	msgbox gTextTrader_SoWellTrade, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq do_trader_menu_give
	special ScrSpecial_TraderDoDecorationTrade
	msgbox gTextTrader_ThenWellTrade, 2
	end

cancelled_give_menu:
	msgbox gTextTrader_FeelUnwanted2, 2
	end

decoration_is_in_use:
	msgbox gTextTrader_InUseYouCantTradeIt, 4
	goto do_trader_menu_give
	end

decorations_full:
	msgbox gTextTrader_NoRoomForThis, 2
	end


@-------------------------------------------------------------------------------
@ Storyteller
@-------------------------------------------------------------------------------

	.include "data/text/storyteller.inc"

SpeakToStoryteller:
	setvar VAR_SPECIAL_8, 0
	setvar VAR_SPECIAL_9, 0
	setvar VAR_SPECIAL_A, 0
	setvar VAR_SPECIAL_B, 0
	lock
	faceplayer
	msgbox gTextStoryteller_Introduction, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq dont_hear_story
	specialvar RESULT, ScrSpecial_StorytellerGetFreeStorySlot
	compare RESULT, 0		@ If slot is 0, then the list is empty
	goto_if_eq no_stories_recorded
choose_story:
	message gTextStoryteller_WhichTale
	waitmessage
	special ScrSpecial_StorytellerStoryListMenu
	waitstate
	compare RESULT, FALSE
	goto_if_eq cancel_story_menu
	setvar VAR_SPECIAL_8, 1
	special ScrSpecial_StorytellerDisplayStory
	waitmessage
	waitbuttonpress
	specialvar RESULT, ScrSpecial_StorytellerUpdateStat
	compare RESULT, FALSE
	goto_if_eq no_stat_update
	goto stat_update
cancel_story_menu:
	compare VAR_SPECIAL_8, 0
	goto_if_eq dont_hear_story
	goto yes_hear_story
no_stat_update:
	msgbox gTextStoryteller_CouldThereBeOtherTrainers, 4
	msgbox gTextStoryteller_HearAnotherLegendaryTale, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq choose_story
yes_hear_story:
	specialvar RESULT, ScrSpecial_HasStorytellerAlreadyRecorded
	compare RESULT, TRUE
	goto_if_eq cant_record_story		@ already recorded story
	specialvar RESULT, ScrSpecial_StorytellerGetFreeStorySlot
	compare RESULT, 4
	goto_if_eq cant_record_story		@ story list is full
	goto prompt_record_story
no_stories_recorded:
	msgbox gTextStoryteller_ButIKnowOfNoLegendaryTrainers, 4
prompt_record_story:
	msgbox gTextStoryteller_HaveYouAnyTales, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq dont_hear_story
	specialvar RESULT, ScrSpecial_StorytellerInitializeRandomStat
	compare RESULT, TRUE
	goto_if_eq stat_update
	msgbox gTextStoryteller_ImNotSatisfied, 4
	closemessage
	release
	end

stat_update:
	msgbox gTextStoryteller_BirthOfANewLegend, 4
	closemessage
	release
	end

dont_hear_story:
	msgbox gTextStoryteller_OhIFeelStifled, 4
	closemessage
	release
	end

cant_record_story:
	msgbox gTextStoryteller_WishMorePeopleWould, 4
	closemessage
	release
	end


@-------------------------------------------------------------------------------
@ Giddy
@-------------------------------------------------------------------------------

	.include "data/text/giddy.inc"

SpeakToGiddy:
	lock
	faceplayer
	msgbox gTextGiddy_Introduction, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq yes_hear_giddy
	compare RESULT, NO
	goto_if_eq dont_hear_giddy
	end

yes_hear_giddy:
	special ScrSpecial_GiddyShouldTellAnotherTale
	compare RESULT, TRUE
	goto_if_eq tell_giddy_tale
	compare RESULT, FALSE
	goto_if_eq bye_bye
	end

tell_another_giddy_tale:
	special ScrSpecial_GiddyShouldTellAnotherTale
	compare RESULT, TRUE
	goto_if_eq also_i_was_thinking
	compare RESULT, FALSE
	goto_if_eq bye_bye
	end

also_i_was_thinking:
	msgbox gTextGiddy_AlsoIWasThinking, 4
	goto tell_giddy_tale
	end

tell_giddy_tale:
	special ScrSpecial_GenerateGiddyLine
	special ShowFieldMessageStringVar4
	waitmessage
	yesnobox 20, 8
	compare RESULT, 1
	goto_if_eq tell_another_giddy_tale
	compare RESULT, 0
	goto_if_eq tell_another_giddy_tale
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
