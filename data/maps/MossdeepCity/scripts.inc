MossdeepCity_MapScripts:: @ 814CF92
	map_script MAP_SCRIPT_ON_TRANSITION, MossdeepCity_OnTransition
	.byte 0

MossdeepCity_OnTransition:: @ 814CF98
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_1
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_2
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_3
	clearflag FLAG_MOSSDEEP_GYM_SWITCH_4
	call_if_set FLAG_SYS_WEATHER_CTRL, Common_EventScript_SetLegendaryWeather
	end

MossdeepCity_EventScript_PokefanF:: @ 814CFAE
	msgbox MossdeepCity_Text_SpaceCenterLaunchingRockets, MSGBOX_NPC
	end

MossdeepCity_EventScript_Sailor:: @ 814CFB7
	msgbox MossdeepCity_Text_WailmerDisappeared, MSGBOX_NPC
	end

MossdeepCity_EventScript_NinjaBoy:: @ 814CFC0
	msgbox MossdeepCity_Text_WailmerWatching, MSGBOX_NPC
	end

MossdeepCity_EventScript_ExpertM:: @ 814CFC9
	msgbox MossdeepCity_Text_LifeNeedsSeaToLive, MSGBOX_NPC
	end

MossdeepCity_EventScript_Girl:: @ 814CFD2
	msgbox MossdeepCity_Text_NiceIfWorldCoveredByFlowers, MSGBOX_NPC
	end

MossdeepCity_EventScript_Woman:: @ 814CFDB
	msgbox MossdeepCity_Text_SpecialSpaceCenterRock, MSGBOX_NPC
	end

MossdeepCity_EventScript_WhiteRock:: @ 814CFE4
	msgbox MossdeepCity_Text_ItsAWhiteRock, MSGBOX_SIGN
	end

MossdeepCity_EventScript_GymSign:: @ 814CFED
	msgbox MossdeepCity_Text_GymSign, MSGBOX_SIGN
	end

MossdeepCity_EventScript_CitySign:: @ 814CFF6
	msgbox MossdeepCity_Text_CitySign, MSGBOX_SIGN
	end

MossdeepCity_EventScript_SpaceCenterSign:: @ 814CFFF
	msgbox MossdeepCity_Text_SpaceCenterSign, MSGBOX_SIGN
	end

MossdeepCity_EventScript_VisitedMossdeep:: @ 814D008
	setflag FLAG_VISITED_MOSSDEEP_CITY
	setvar VAR_TEMP_1, 1
	end

MossdeepCity_EventScript_Man:: @ 814D011
	lock
	faceplayer
	msgbox MossdeepCity_Text_SurfExhilarating, MSGBOX_DEFAULT
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

MossdeepCity_EventScript_KingsRockBoy:: @ 814D027
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_KINGS_ROCK, MossdeepCity_EventScript_ReceivedKingsRock
	msgbox MossdeepCity_Text_WantKingsRockStevenGaveMe, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq MossdeepCity_EventScript_DeclineKingsRock
	msgbox MossdeepCity_Text_YouCanKeepIt, MSGBOX_DEFAULT
	giveitem ITEM_KINGS_ROCK
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_RECEIVED_KINGS_ROCK
	release
	end

MossdeepCity_EventScript_ReceivedKingsRock:: @ 814D069
	msgbox MossdeepCity_Text_CollectingRocks, MSGBOX_DEFAULT
	release
	end

MossdeepCity_EventScript_DeclineKingsRock:: @ 814D073
	msgbox MossdeepCity_Text_WhatToDoWithWeirdRock, MSGBOX_DEFAULT
	release
	end
