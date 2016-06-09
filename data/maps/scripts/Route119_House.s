Route119_House_MapScripts:: @ 8163DDD
	.byte 0

Route119_House_EventScript_163DDE:: @ 8163DDE
	loadptr 0, Route119_House_Text_19F371
	callstd 2
	end

Route119_House_EventScript_163DE7:: @ 8163DE7
	lock
	faceplayer
	checksound
	pokecry SPECIES_WINGULL, 0
	loadptr 0, Route119_House_Text_19F406
	callstd 4
	waitpokecry
	release
	end

