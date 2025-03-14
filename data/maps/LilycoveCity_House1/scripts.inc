LilycoveCity_House1_MapScripts:: @ 8159B85
	.byte 0

LilycoveCity_House1_EventScript_ExpertM:: @ 8159B86
	msgbox LilycoveCity_House1_Text_PokemonPartnersNotTools, MSGBOX_NPC
	end

LilycoveCity_House1_EventScript_Kecleon:: @ 8159B8F
	lock
	faceplayer
	waitse
	playmoncry SPECIES_KECLEON, 0
	msgbox LilycoveCity_House1_Text_Kecleon, MSGBOX_DEFAULT
	waitmoncry
	release
	end
