Route119_WeatherInstitute_2F_MapScripts:: @ 8163CC2
	map_script 3, Route119_WeatherInstitute_2F_MapScript1_163CC8
	.byte 0

Route119_WeatherInstitute_2F_MapScript1_163CC8:: @ 8163CC8
	call Route119_WeatherInstitute_2F_EventScript_1A0196
	compare 0x40b3, 0
	call_if 1, Route119_WeatherInstitute_2F_EventScript_163CE4
	compare 0x40b3, 1
	call_if 1, Route119_WeatherInstitute_2F_EventScript_163CF0
	end

Route119_WeatherInstitute_2F_EventScript_163CE4:: @ 8163CE4
	movespriteperm 5, 1, 6
	spritebehave 5, 10
	return

Route119_WeatherInstitute_2F_EventScript_163CF0:: @ 8163CF0
	movespriteperm 5, 4, 6
	spritebehave 5, 10
	return

Route119_WeatherInstitute_2F_EventScript_163CFC:: @ 8163CFC
	trainerbattle 0, OPPONENT_WEATHER_INSTITUTE_GRUNT_3, 0, Route119_WeatherInstitute_2F_Text_19EEAF, Route119_WeatherInstitute_2F_Text_19EF1B
	msgbox Route119_WeatherInstitute_2F_Text_19EF3E, 6
	end

Route119_WeatherInstitute_2F_EventScript_163D13:: @ 8163D13
	trainerbattle 0, OPPONENT_WEATHER_INSTITUTE_GRUNT_4, 0, Route119_WeatherInstitute_2F_Text_19EFA3, Route119_WeatherInstitute_2F_Text_19EFDD
	msgbox Route119_WeatherInstitute_2F_Text_19EFE9, 6
	end

Route119_WeatherInstitute_2F_EventScript_163D2A:: @ 8163D2A
	trainerbattle 2, OPPONENT_WEATHER_INSTITUTE_GRUNT_5, 0, Route119_WeatherInstitute_2F_Text_19F042, Route119_WeatherInstitute_2F_Text_19F0F4, Route119_WeatherInstitute_2F_EventScript_163D45
	msgbox Route119_WeatherInstitute_2F_Text_19F11B, 6
	end

Route119_WeatherInstitute_2F_EventScript_163D45:: @ 8163D45
	msgbox Route119_WeatherInstitute_2F_Text_19F11B, 4
	closebutton
	setvar 0x40b3, 1
	clearflag 893
	fadedefault
	fadescreen 1
	setflag 890
	disappear 1
	disappear 2
	disappear 3
	fadescreen 0
	move 5, Route119_WeatherInstitute_2F_Movement_163DC8
	waitmove 0
	moveoffscreen 5
	goto Route119_WeatherInstitute_2F_EventScript_163D7A
	end

Route119_WeatherInstitute_2F_EventScript_163D7A:: @ 8163D7A
	msgbox Route119_WeatherInstitute_2F_Text_19F1CF, 4
	countpokemon
	compare RESULT, 6
	goto_if_eq Route119_WeatherInstitute_2F_EventScript_163DB4
	fanfare 370
	message Route119_WeatherInstitute_2F_Text_19F267
	waitfanfare
	waittext
	givepokemon SPECIES_CASTFORM, 25, ITEM_MYSTIC_WATER, 0x0, 0x0, 0
	setflag 151
	msgbox Route119_WeatherInstitute_2F_Text_19F27D, 4
	release
	end

Route119_WeatherInstitute_2F_EventScript_163DB4:: @ 8163DB4
	msgbox Route119_WeatherInstitute_2F_Text_19F231, 4
	release
	end

Route119_WeatherInstitute_2F_EventScript_163DBE:: @ 8163DBE
	msgbox Route119_WeatherInstitute_2F_Text_19F2FE, 4
	release
	end

Route119_WeatherInstitute_2F_Movement_163DC8:: @ 8163DC8
	step_right
	step_right
	step_right
	step_end

Route119_WeatherInstitute_2F_EventScript_163DCC:: @ 8163DCC
	lock
	faceplayer
	checkflag 151
	goto_if_eq Route119_WeatherInstitute_2F_EventScript_163DBE
	goto Route119_WeatherInstitute_2F_EventScript_163D7A
	end
