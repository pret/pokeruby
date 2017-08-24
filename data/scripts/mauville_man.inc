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
	case MAUVILLE_MAN_GIDDY,       MauvilleCity_PokemonCenter_1F_EventScript_1B09EB
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
	special ScrSpecial_PlayBardSong
	pause 60
	special ScrSpecial_HasBardSongBeenChanged
	compare RESULT, FALSE
	jumpeq prompt_write_lyrics	@ Prompt new lyrics only if song hasn't been changed
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

speak_to_hipster:: @ 81AE845
	lock
	faceplayer
	setflag 2054
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0C5B, 4
	special sub_80F7C70
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE86A
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0CA7, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE86A:: @ 81AE86A
	special sub_80F7C90
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AE882
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0D11, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AE882:: @ 81AE882
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0D75, 4
	special ScrSpecial_SetHipsterSpokenFlag
	release
	end

@-------------------------------------------------------------------------------
@ Trader
@-------------------------------------------------------------------------------

	.include "data/text/trader.inc"

speak_to_trader:: @ 81AEBAB
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE88F, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEBDA
	special sub_8109C44
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEBE3
	message MauvilleCity_PokemonCenter_1F_Text_1AE910
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBDA:: @ 81AEBDA
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE8C6, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBE3:: @ 81AEBE3
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE8DF, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC:: @ 81AEBEC
	special sub_8109E34
	waitstate
	compare 0x8004, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC2D
	compare 0x8004, 65535
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC36
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE97C, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC42
	special sub_8109C58
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC4E
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC2D:: @ 81AEC2D
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE950, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC36:: @ 81AEC36
	message MauvilleCity_PokemonCenter_1F_Text_1AEB31
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC42:: @ 81AEC42
	message MauvilleCity_PokemonCenter_1F_Text_1AE910
	waittext
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEBEC
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC4E:: @ 81AEC4E
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE9B6, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AEC57:: @ 81AEC57
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AE9F8, 4
	special sub_8109CF0
	waitstate
	compare 0x8006, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECA6
	compare 0x8006, 65535
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECAF
	special sub_8109C90
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AECBD
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA9B, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	special sub_8109DE0
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEAFB, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECA6:: @ 81AECA6
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA2B, 2
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECAF:: @ 81AECAF
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEAC3, 4
	jump MauvilleCity_PokemonCenter_1F_EventScript_1AEC57
	end

MauvilleCity_PokemonCenter_1F_EventScript_1AECBD:: @ 81AECBD
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEA57, 2
	end

@-------------------------------------------------------------------------------
@ Storyteller
@-------------------------------------------------------------------------------

	.include "data/text/storyteller.inc"

speak_to_storyteller:: @ 81B0816
	setvar 0x8008, 0
	setvar 0x8009, 0
	setvar 0x800a, 0
	setvar 0x800b, 0
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AECC6, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	specialval RESULT, sub_80F889C
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B08D3

MauvilleCity_PokemonCenter_1F_EventScript_1B084F:: @ 81B084F
	message MauvilleCity_PokemonCenter_1F_Text_1AED35
	waittext
	special sub_80F8874
	waitstate
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0883
	setvar 0x8008, 1
	special sub_80F8888
	waittext
	waitbutton
	specialval RESULT, sub_80F88AC
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0893
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B0909

MauvilleCity_PokemonCenter_1F_EventScript_1B0883:: @ 81B0883
	compare 0x8008, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B08AE

MauvilleCity_PokemonCenter_1F_EventScript_1B0893:: @ 81B0893
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEE50, 4
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEF0A, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B084F

MauvilleCity_PokemonCenter_1F_EventScript_1B08AE:: @ 81B08AE
	specialval RESULT, sub_80F88E0
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B091F
	specialval RESULT, sub_80F889C
	compare RESULT, 4
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B091F
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B08DB

MauvilleCity_PokemonCenter_1F_EventScript_1B08D3:: @ 81B08D3
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AED70, 4

MauvilleCity_PokemonCenter_1F_EventScript_1B08DB:: @ 81B08DB
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEEB4, 5
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0914
	specialval RESULT, sub_80F88FC
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0909
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEF49, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0909:: @ 81B0909
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEDE8, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0914:: @ 81B0914
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AED1D, 4
	closebutton
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B091F:: @ 81B091F
	msgbox MauvilleCity_PokemonCenter_1F_Text_1AEFA5, 4
	closebutton
	release
	end

@-------------------------------------------------------------------------------
@ Giddy
@-------------------------------------------------------------------------------

	.include "data/text/giddy.inc"

MauvilleCity_PokemonCenter_1F_EventScript_1B09EB:: @ 81B09EB
	lock
	faceplayer
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B092A, 5
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A0C
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A6F
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A0C:: @ 81B0A0C
	special sub_80F7CC8
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A79
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A26:: @ 81B0A26
	special sub_80F7CC8
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A40
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A79
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A40:: @ 81B0A40
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B0998, 4
	jump MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A4E:: @ 81B0A4E
	special ScrSpecial_GenerateGiddyLine
	special ShowFieldMessageStringVar4
	waittext
	yesnobox 20, 8
	compare RESULT, 1
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A26
	compare RESULT, 0
	jumpeq MauvilleCity_PokemonCenter_1F_EventScript_1B0A26
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A6F:: @ 81B0A6F
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B097C, 4
	release
	end

MauvilleCity_PokemonCenter_1F_EventScript_1B0A79:: @ 81B0A79
	msgbox MauvilleCity_PokemonCenter_1F_Text_1B09B0, 4
	release
	end

	.include "data/text/bard.inc"
	.include "data/text/hipster.inc"