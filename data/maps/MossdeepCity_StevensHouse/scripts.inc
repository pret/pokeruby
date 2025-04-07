MossdeepCity_StevensHouse_MapScripts:: @ 815A9C5
	map_script MAP_SCRIPT_ON_LOAD, MossdeepCity_StevensHouse_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, MossdeepCity_StevensHouse_OnTransition
	map_script MAP_SCRIPT_ON_FRAME_TABLE, MossdeepCity_StevensHouse_OnFrame
	.byte 0

MossdeepCity_StevensHouse_OnLoad:: @ 815A9D5
	call_if_unset FLAG_SYS_GAME_CLEAR, MossdeepCity_StevensHouse_EventScript_HideStevensNote
	end

MossdeepCity_StevensHouse_EventScript_HideStevensNote:: @ 815A9DF
	setmetatile 6, 4, METATILE_GenericBuilding_TableEdge, 1
	return

MossdeepCity_StevensHouse_OnTransition:: @ 815A9E9
	compare VAR_STEVENS_HOUSE_STATE, 1
	call_if_eq MossdeepCity_StevensHouse_EventScript_SetStevenPos
	end

MossdeepCity_StevensHouse_EventScript_SetStevenPos:: @ 815A9F5
	setobjectxyperm 1, 6, 5
	setobjectmovementtype 1, 7
	return

MossdeepCity_StevensHouse_OnFrame:: @ 815AA01
	map_script_2 VAR_STEVENS_HOUSE_STATE, 0, MossdeepCity_StevensHouse_EventScript_StevenGivesDive
	.2byte 0

MossdeepCity_StevensHouse_EventScript_StevenGivesDive:: @ 815AA0B
	lockall
	applymovement 1, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	playse SE_PIN
	applymovement 1, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 1, Common_Movement_Delay48
	waitmovement 0
	applymovement 1, MossdeepCity_StevensHouse_Movement_StevenApproachPlayer
	waitmovement 0
	msgbox MossdeepCity_StevensHouse_Text_YouveEarnedHMDive, MSGBOX_DEFAULT
	giveitem ITEM_HM08_DIVE
	setflag FLAG_RECEIVED_HM08
	setflag FLAG_OMIT_DIVE_FROM_STEVEN_LETTER
	msgbox MossdeepCity_StevensHouse_Text_ExplainDive, MSGBOX_DEFAULT
	closemessage
	delay 20
	applymovement 1, MossdeepCity_StevensHouse_Movement_StevenReturn
	waitmovement 0
	setvar VAR_STEVENS_HOUSE_STATE, 1
	releaseall
	end

MossdeepCity_StevensHouse_Movement_StevenApproachPlayer:: @ 815AA6E
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_down
	step_end

MossdeepCity_StevensHouse_Movement_StevenReturn:: @ 815AA76
	walk_up
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

MossdeepCity_StevensHouse_EventScript_BeldumPokeball:: @ 815AA7C
	lockall
	msgbox MossdeepCity_StevensHouse_Text_TakeBallContainingBeldum, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq MossdeepCity_StevensHouse_EventScript_LeaveBeldum
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq MossdeepCity_StevensHouse_EventScript_GiveBeldum
	copyvar VAR_0x8004, VAR_RESULT
	removeobject 2
	playfanfare MUS_OBTAIN_ITEM
	message MossdeepCity_StevensHouse_Text_ObtainedBeldum
	waitfanfare
	waitmessage
	givemon SPECIES_BELDUM, 5, ITEM_NONE
	bufferspeciesname 1, SPECIES_BELDUM
	msgbox gText_NicknameReceivedPokemon, MSGBOX_YESNO
	compare VAR_RESULT, YES
	call_if_eq Common_EventScript_NameReceivedPartyMon
	setflag FLAG_HIDE_BELDUM_BALL_STEVENS_HOUSE
	setflag FLAG_RECEIVED_BELDUM
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_GiveBeldum:: @ 815AADC
	msgbox MossdeepCity_StevensHouse_Text_NoSpaceForAnotherMon, MSGBOX_DEFAULT
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_LeaveBeldum:: @ 815AAE6
	msgbox MossdeepCity_StevensHouse_Text_LeftPokeBallWhereItWas, MSGBOX_DEFAULT
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_RockDisplay:: @ 815AAF0
	msgbox MossdeepCity_StevensHouse_Text_CollectionOfRareRocks, MSGBOX_SIGN
	end

MossdeepCity_StevensHouse_EventScript_Steven:: @ 815AAF9
	msgbox MossdeepCity_StevensHouse_Text_UnderwateCavernBetweenMossdeepSootopolis, MSGBOX_NPC
	end

MossdeepCity_StevensHouse_EventScript_Letter:: @ 815AB02
	lockall
	goto_if_set FLAG_OMIT_DIVE_FROM_STEVEN_LETTER, MossdeepCity_StevensHouse_EventScript_LetterWithoutDive
	msgbox MossdeepCity_StevensHouse_Text_LetterFromStevenWithDive, MSGBOX_DEFAULT
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_LetterWithoutDive:: @ 815AB16
	msgbox MossdeepCity_StevensHouse_Text_LetterFromSteven, MSGBOX_DEFAULT
	releaseall
	end

MossdeepCity_StevensHouse_EventScript_DiveItemBall:: @ 815AB20
	finditem ITEM_HM08_DIVE
	setflag FLAG_RECEIVED_HM08
	end
