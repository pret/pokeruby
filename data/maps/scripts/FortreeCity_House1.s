FortreeCity_House1_MapScripts:: @ 8157E12
	.byte 0

FortreeCity_House1_EventScript_157E13:: @ 8157E13
	lock
	faceplayer
	checkflag 155
	jumpeq FortreeCity_House1_EventScript_157EAD
	setvar 0x8008, 1
	copyvar 0x8004, 0x8008
	specialval RESULT, 252
	copyvar 0x8009, RESULT
	loadptr 0, FortreeCity_House1_Text_18568C
	callstd 5
	compare RESULT, 0
	jumpeq FortreeCity_House1_EventScript_157E95
	special 159
	waitstate
	copyvar 0x800a, 0x8004
	compare 0x8004, 255
	jumpeq FortreeCity_House1_EventScript_157E95
	copyvar 0x8005, 0x800a
	specialval RESULT, 255
	copyvar 0x800b, RESULT
	comparevars RESULT, 0x8009
	jumpif 5, FortreeCity_House1_EventScript_157E9F
	copyvar 0x8004, 0x8008
	copyvar 0x8005, 0x800a
	special 253
	special 254
	waitstate
	bufferpoke 0, 32777
	loadptr 0, FortreeCity_House1_Text_1856F7
	callstd 4
	setflag 155
	release
	end

FortreeCity_House1_EventScript_157E95:: @ 8157E95
	loadptr 0, FortreeCity_House1_Text_18577F
	callstd 4
	release
	end

FortreeCity_House1_EventScript_157E9F:: @ 8157E9F
	bufferpoke 0, 32777
	loadptr 0, FortreeCity_House1_Text_185737
	callstd 4
	release
	end

FortreeCity_House1_EventScript_157EAD:: @ 8157EAD
	loadptr 0, FortreeCity_House1_Text_1857C7
	callstd 4
	release
	end

FortreeCity_House1_EventScript_157EB7:: @ 8157EB7
	loadptr 0, FortreeCity_House1_Text_18582A
	callstd 2
	end

FortreeCity_House1_EventScript_157EC0:: @ 8157EC0
	lock
	faceplayer
	checksound
	pokecry SPECIES_ZIGZAGOON, 0
	loadptr 0, FortreeCity_House1_Text_185888
	callstd 4
	waitpokecry
	release
	end

