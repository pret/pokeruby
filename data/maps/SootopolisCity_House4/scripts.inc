SootopolisCity_House4_MapScripts:: @ 815B34C
	.byte 0

SootopolisCity_House4_EventScript_15B34D:: @ 815B34D
	msgbox SootopolisCity_House4_Text_18FC92, MSGBOX_NPC
	end

SootopolisCity_House4_EventScript_15B356:: @ 815B356
	msgbox SootopolisCity_House4_Text_18FD41, MSGBOX_NPC
	end

SootopolisCity_House4_EventScript_15B35F:: @ 815B35F
	lock
	faceplayer
	waitse
	playmoncry SPECIES_AZUMARILL, 0
	msgbox SootopolisCity_House4_Text_18FDD8, MSGBOX_DEFAULT
	waitmoncry
	release
	end
