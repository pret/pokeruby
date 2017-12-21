DewfordTown_House1_MapScripts:: @ 8152FEE
	.byte 0

DewfordTown_House1_EventScript_152FEF:: @ 8152FEF
	msgbox DewfordTown_House1_Text_174BA5, 2
	end

DewfordTown_House1_EventScript_152FF8:: @ 8152FF8
	msgbox DewfordTown_House1_Text_174C0D, 2
	end

DewfordTown_House1_EventScript_153001:: @ 8153001
	lock
	faceplayer
	waitse
	playmoncry SPECIES_ZIGZAGOON, 0
	msgbox DewfordTown_House1_Text_174CC8, 4
	waitmoncry
	release
	end
