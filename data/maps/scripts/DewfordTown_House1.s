DewfordTown_House1_MapScripts:: @ 8152FEE
	.byte 0

DewfordTown_House1_EventScript_152FEF:: @ 8152FEF
	loadptr 0, DewfordTown_House1_Text_174BA5
	callstd 2
	end

DewfordTown_House1_EventScript_152FF8:: @ 8152FF8
	loadptr 0, DewfordTown_House1_Text_174C0D
	callstd 2
	end

DewfordTown_House1_EventScript_153001:: @ 8153001
	lock
	faceplayer
	checksound
	pokecry SPECIES_ZIGZAGOON, 0
	loadptr 0, DewfordTown_House1_Text_174CC8
	callstd 4
	waitpokecry
	release
	end

