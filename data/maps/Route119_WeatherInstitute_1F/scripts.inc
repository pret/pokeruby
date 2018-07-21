Route119_WeatherInstitute_1F_MapScripts:: @ 8163C2A
	map_script 3, Route119_WeatherInstitute_1F_MapScript1_163C30
	.byte 0

Route119_WeatherInstitute_1F_MapScript1_163C30:: @ 8163C30
	call Route119_WeatherInstitute_1F_EventScript_1A0196
	compare VAR_WEATHER_INSTITUTE_STATE, 0
	call_if_eq Route119_WeatherInstitute_1F_EventScript_163C41
	end

Route119_WeatherInstitute_1F_EventScript_163C41:: @ 8163C41
	setobjectxyperm 5, 0, 5
	setobjectmovementtype 5, 10
	return

Route119_WeatherInstitute_1F_EventScript_163C4D:: @ 8163C4D
	lock
	faceplayer
	special GetPlayerBigGuyGirlString
	compare VAR_WEATHER_INSTITUTE_STATE, 0
	goto_if_eq Route119_WeatherInstitute_1F_EventScript_163C67
	msgbox Route119_WeatherInstitute_1F_Text_19ED22, 4
	release
	end

Route119_WeatherInstitute_1F_EventScript_163C67:: @ 8163C67
	msgbox Route119_WeatherInstitute_1F_Text_19ECF4, 4
	release
	end

Route119_WeatherInstitute_1F_EventScript_163C71:: @ 8163C71
	msgbox Route119_WeatherInstitute_1F_Text_19ED6B, 2
	end

Route119_WeatherInstitute_1F_EventScript_163C7A:: @ 8163C7A
	msgbox Route119_WeatherInstitute_1F_Text_19EE25, 2
	end

Route119_WeatherInstitute_1F_EventScript_163C83:: @ 8163C83
	lockall
	msgbox Route119_WeatherInstitute_1F_Text_19EE8B, 4
	closemessage
	call Route119_WeatherInstitute_1F_EventScript_1A02CA
	releaseall
	end

Route119_WeatherInstitute_1F_EventScript_163C94:: @ 8163C94
	trainerbattle 0, TRAINER_WEATHER_INSTITUTE_GRUNT_1, 0, Route119_WeatherInstitute_1F_Text_19EB8A, Route119_WeatherInstitute_1F_Text_19EBEE
	msgbox Route119_WeatherInstitute_1F_Text_19EC0E, 6
	end

Route119_WeatherInstitute_1F_EventScript_163CAB:: @ 8163CAB
	trainerbattle 0, TRAINER_WEATHER_INSTITUTE_GRUNT_2, 0, Route119_WeatherInstitute_1F_Text_19EC6B, Route119_WeatherInstitute_1F_Text_19EC89
	msgbox Route119_WeatherInstitute_1F_Text_19EC97, 6
	end
