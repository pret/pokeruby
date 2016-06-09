Route119_WeatherInstitute_2F_MapScripts:: @ 8163CC2
	map_script 3, Route119_WeatherInstitute_2F_MapScript1_163CC8
	.byte 0

Route119_WeatherInstitute_2F_MapScript1_163CC8:: @ 8163CC8
	call Route119_WeatherInstitute_2F_EventScript_1A0196
	compare 0x40b3, 0
	callif 1, Route119_WeatherInstitute_2F_EventScript_163CE4
	compare 0x40b3, 1
	callif 1, Route119_WeatherInstitute_2F_EventScript_163CF0
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
	trainerbattle 0, 583, 0, Route119_WeatherInstitute_2F_Text_19EEAF, Route119_WeatherInstitute_2F_Text_19EF1B
	loadptr 0, Route119_WeatherInstitute_2F_Text_19EF3E
	callstd 6
	end

Route119_WeatherInstitute_2F_EventScript_163D13:: @ 8163D13
	trainerbattle 0, 584, 0, Route119_WeatherInstitute_2F_Text_19EFA3, Route119_WeatherInstitute_2F_Text_19EFDD
	loadptr 0, Route119_WeatherInstitute_2F_Text_19EFE9
	callstd 6
	end

Route119_WeatherInstitute_2F_EventScript_163D2A:: @ 8163D2A
	trainerbattle 2, 599, 0, Route119_WeatherInstitute_2F_Text_19F042, Route119_WeatherInstitute_2F_Text_19F0F4, Route119_WeatherInstitute_2F_EventScript_163D45
	loadptr 0, Route119_WeatherInstitute_2F_Text_19F11B
	callstd 6
	end

Route119_WeatherInstitute_2F_EventScript_163D45:: @ 8163D45
	loadptr 0, Route119_WeatherInstitute_2F_Text_19F11B
	callstd 4
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
	jump Route119_WeatherInstitute_2F_EventScript_163D7A
	end

Route119_WeatherInstitute_2F_EventScript_163D7A:: @ 8163D7A
	loadptr 0, Route119_WeatherInstitute_2F_Text_19F1CF
	callstd 4
	countpokemon
	compare RESULT, 6
	jumpeq Route119_WeatherInstitute_2F_EventScript_163DB4
	fanfare 370
	message Route119_WeatherInstitute_2F_Text_19F267
	waitfanfare
	waittext
	givepokemon SPECIES_CASTFORM, 25, ITEM_MYSTIC_WATER, 0x0, 0x0, 0
	setflag 151
	loadptr 0, Route119_WeatherInstitute_2F_Text_19F27D
	callstd 4
	release
	end

Route119_WeatherInstitute_2F_EventScript_163DB4:: @ 8163DB4
	loadptr 0, Route119_WeatherInstitute_2F_Text_19F231
	callstd 4
	release
	end

Route119_WeatherInstitute_2F_EventScript_163DBE:: @ 8163DBE
	loadptr 0, Route119_WeatherInstitute_2F_Text_19F2FE
	callstd 4
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
	jumpeq Route119_WeatherInstitute_2F_EventScript_163DBE
	jump Route119_WeatherInstitute_2F_EventScript_163D7A
	end

