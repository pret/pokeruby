Route119_WeatherInstitute_2F_MapScripts:: @ 8163CC2
	map_script MAP_SCRIPT_ON_TRANSITION, Route119_WeatherInstitute_2F_MapScript1_163CC8
	.byte 0

Route119_WeatherInstitute_2F_MapScript1_163CC8:: @ 8163CC8
	call Common_EventScript_SetupEvilTeamGfxIds
	compare VAR_WEATHER_INSTITUTE_STATE, 0
	call_if_eq Route119_WeatherInstitute_2F_EventScript_163CE4
	compare VAR_WEATHER_INSTITUTE_STATE, 1
	call_if_eq Route119_WeatherInstitute_2F_EventScript_163CF0
	end

Route119_WeatherInstitute_2F_EventScript_163CE4:: @ 8163CE4
	setobjectxyperm 5, 1, 6
	setobjectmovementtype 5, 10
	return

Route119_WeatherInstitute_2F_EventScript_163CF0:: @ 8163CF0
	setobjectxyperm 5, 4, 6
	setobjectmovementtype 5, 10
	return

Route119_WeatherInstitute_2F_EventScript_163CFC:: @ 8163CFC
	trainerbattle_single TRAINER_WEATHER_INSTITUTE_GRUNT_3, Route119_WeatherInstitute_2F_Text_19EEAF, Route119_WeatherInstitute_2F_Text_19EF1B
	msgbox Route119_WeatherInstitute_2F_Text_19EF3E, MSGBOX_AUTOCLOSE
	end

Route119_WeatherInstitute_2F_EventScript_163D13:: @ 8163D13
	trainerbattle_single TRAINER_WEATHER_INSTITUTE_GRUNT_4, Route119_WeatherInstitute_2F_Text_19EFA3, Route119_WeatherInstitute_2F_Text_19EFDD
	msgbox Route119_WeatherInstitute_2F_Text_19EFE9, MSGBOX_AUTOCLOSE
	end

Route119_WeatherInstitute_2F_EventScript_163D2A:: @ 8163D2A
	trainerbattle_single TRAINER_WEATHER_INSTITUTE_GRUNT_5, Route119_WeatherInstitute_2F_Text_19F042, Route119_WeatherInstitute_2F_Text_19F0F4, Route119_WeatherInstitute_2F_EventScript_163D45
	msgbox Route119_WeatherInstitute_2F_Text_19F11B, MSGBOX_AUTOCLOSE
	end

Route119_WeatherInstitute_2F_EventScript_163D45:: @ 8163D45
	msgbox Route119_WeatherInstitute_2F_Text_19F11B, MSGBOX_DEFAULT
	closemessage
	setvar VAR_WEATHER_INSTITUTE_STATE, 1
	clearflag FLAG_HIDE_WEATHER_INSTITUTE_WORKERS_2F
	fadedefaultbgm
	fadescreen FADE_TO_BLACK
	setflag FLAG_HIDE_EVIL_TEAM_WEATHER_INSTITUTE
	removeobject 1
	removeobject 2
	removeobject 3
	fadescreen FADE_FROM_BLACK
	applymovement 5, Route119_WeatherInstitute_2F_Movement_163DC8
	waitmovement 0
	moveobjectoffscreen 5
	goto Route119_WeatherInstitute_2F_EventScript_163D7A
	end

Route119_WeatherInstitute_2F_EventScript_163D7A:: @ 8163D7A
	msgbox Route119_WeatherInstitute_2F_Text_19F1CF, MSGBOX_DEFAULT
	getpartysize
	compare VAR_RESULT, 6
	goto_if_eq Route119_WeatherInstitute_2F_EventScript_163DB4
	playfanfare MUS_FANFA4
	message Route119_WeatherInstitute_2F_Text_19F267
	waitfanfare
	waitmessage
	givemon SPECIES_CASTFORM, 25, ITEM_MYSTIC_WATER
	setflag FLAG_RECEIVED_CASTFORM
	msgbox Route119_WeatherInstitute_2F_Text_19F27D, MSGBOX_DEFAULT
	release
	end

Route119_WeatherInstitute_2F_EventScript_163DB4:: @ 8163DB4
	msgbox Route119_WeatherInstitute_2F_Text_19F231, MSGBOX_DEFAULT
	release
	end

Route119_WeatherInstitute_2F_EventScript_163DBE:: @ 8163DBE
	msgbox Route119_WeatherInstitute_2F_Text_19F2FE, MSGBOX_DEFAULT
	release
	end

Route119_WeatherInstitute_2F_Movement_163DC8:: @ 8163DC8
	walk_right
	walk_right
	walk_right
	step_end

Route119_WeatherInstitute_2F_EventScript_163DCC:: @ 8163DCC
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_CASTFORM, Route119_WeatherInstitute_2F_EventScript_163DBE
	goto Route119_WeatherInstitute_2F_EventScript_163D7A
	end
