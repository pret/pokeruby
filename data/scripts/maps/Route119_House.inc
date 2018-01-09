Route119_House_MapScripts:: @ 8163DDD
	.byte 0

Route119_House_EventScript_163DDE:: @ 8163DDE
	msgbox Route119_House_Text_19F371, 2
	end

Route119_House_EventScript_163DE7:: @ 8163DE7
	lock
	faceplayer
	waitse
	playmoncry SPECIES_WINGULL, 0
	msgbox Route119_House_Text_19F406, 4
	waitmoncry
	release
	end
