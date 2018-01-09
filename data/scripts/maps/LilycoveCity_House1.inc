LilycoveCity_House1_MapScripts:: @ 8159B85
	.byte 0

LilycoveCity_House1_EventScript_159B86:: @ 8159B86
	msgbox LilycoveCity_House1_Text_18B7B0, 2
	end

LilycoveCity_House1_EventScript_159B8F:: @ 8159B8F
	lock
	faceplayer
	waitse
	playmoncry SPECIES_KECLEON, 0
	msgbox LilycoveCity_House1_Text_18B82B, 4
	waitmoncry
	release
	end
