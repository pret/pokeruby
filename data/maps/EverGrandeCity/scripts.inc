EverGrandeCity_MapScripts:: @ 814D4D5
	map_script MAP_SCRIPT_ON_TRANSITION, EverGrandeCity_OnTransition
	.byte 0

EverGrandeCity_OnTransition:: @ 814D4DB
	call_if_set FLAG_SYS_WEATHER_CTRL, Common_EventScript_SetAbnormalWeather
	end

EverGrandeCity_EventScript_VictoryRoadSign:: @ 814D4E5
	msgbox EverGrandeCity_Text_EnteringVictoryRoad, MSGBOX_SIGN
	end

EverGrandeCity_EventScript_CitySign:: @ 814D4EE
	msgbox EverGrandeCity_Text_CitySign, MSGBOX_SIGN
	end

EverGrandeCity_EventScript_PokemonLeagueSign:: @ 814D4F7
	msgbox EverGrandeCity_Text_EnteringPokemonLeague, MSGBOX_SIGN
	end

EverGrandeCity_EventScript_SetVisitedEverGrande:: @ 814D500
	setflag FLAG_VISITED_EVER_GRANDE_CITY
	setvar VAR_TEMP_1, 1
	end
