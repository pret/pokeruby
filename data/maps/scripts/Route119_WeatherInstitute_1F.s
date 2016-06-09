Route119_WeatherInstitute_1F_MapScripts:: @ 8163C2A
	map_script 3, Route119_WeatherInstitute_1F_MapScript1_163C30
	.byte 0

Route119_WeatherInstitute_1F_MapScript1_163C30:: @ 8163C30
	call Route119_WeatherInstitute_1F_EventScript_1A0196
	compare 0x40b3, 0
	callif 1, Route119_WeatherInstitute_1F_EventScript_163C41
	end

Route119_WeatherInstitute_1F_EventScript_163C41:: @ 8163C41
	movespriteperm 5, 0, 5
	spritebehave 5, 10
	return

Route119_WeatherInstitute_1F_EventScript_163C4D:: @ 8163C4D
	lock
	faceplayer
	special 148
	compare 0x40b3, 0
	jumpeq Route119_WeatherInstitute_1F_EventScript_163C67
	loadptr 0, Route119_WeatherInstitute_1F_Text_19ED22
	callstd 4
	release
	end

Route119_WeatherInstitute_1F_EventScript_163C67:: @ 8163C67
	loadptr 0, Route119_WeatherInstitute_1F_Text_19ECF4
	callstd 4
	release
	end

Route119_WeatherInstitute_1F_EventScript_163C71:: @ 8163C71
	loadptr 0, Route119_WeatherInstitute_1F_Text_19ED6B
	callstd 2
	end

Route119_WeatherInstitute_1F_EventScript_163C7A:: @ 8163C7A
	loadptr 0, Route119_WeatherInstitute_1F_Text_19EE25
	callstd 2
	end

Route119_WeatherInstitute_1F_EventScript_163C83:: @ 8163C83
	lockall
	loadptr 0, Route119_WeatherInstitute_1F_Text_19EE8B
	callstd 4
	closebutton
	call Route119_WeatherInstitute_1F_EventScript_1A02CA
	releaseall
	end

Route119_WeatherInstitute_1F_EventScript_163C94:: @ 8163C94
	trainerbattle 0, 582, 0, Route119_WeatherInstitute_1F_Text_19EB8A, Route119_WeatherInstitute_1F_Text_19EBEE
	loadptr 0, Route119_WeatherInstitute_1F_Text_19EC0E
	callstd 6
	end

Route119_WeatherInstitute_1F_EventScript_163CAB:: @ 8163CAB
	trainerbattle 0, 591, 0, Route119_WeatherInstitute_1F_Text_19EC6B, Route119_WeatherInstitute_1F_Text_19EC89
	loadptr 0, Route119_WeatherInstitute_1F_Text_19EC97
	callstd 6
	end

