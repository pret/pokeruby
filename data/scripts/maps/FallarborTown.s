FallarborTown_MapScripts:: @ 814E7E0
	map_script 3, FallarborTown_MapScript1_14E7E6
	.byte 0

FallarborTown_MapScript1_14E7E6:: @ 814E7E6
	setflag 2067
	setvar 0x4086, 0
	setflag 800
	clearflag 270
	end

FallarborTown_EventScript_14E7F5:: @ 814E7F5
	lock
	faceplayer
	checkflag 139
	jumpif EQUAL, FallarborTown_EventScript_14E80A
	msgbox FallarborTown_Text_16C7FF, 4
	release
	end

FallarborTown_EventScript_14E80A:: @ 814E80A
	msgbox FallarborTown_Text_16C855, 4
	release
	end

FallarborTown_EventScript_14E814:: @ 814E814
	msgbox FallarborTown_Text_16C8D6, 2
	end

FallarborTown_EventScript_14E81D:: @ 814E81D
	msgbox FallarborTown_Text_16C941, 2
	end

FallarborTown_EventScript_14E826:: @ 814E826
	lock
	faceplayer
	checksound
	pokecry SPECIES_AZURILL, 0
	msgbox FallarborTown_Text_16C92C, 4
	waitpokecry
	release
	end

FallarborTown_EventScript_14E839:: @ 814E839
	msgbox FallarborTown_Text_16CA39, 3
	end

FallarborTown_EventScript_14E842:: @ 814E842
MeteorFalls_1F_1R_EventScript_14E842:: @ 814E842
MeteorFalls_1F_2R_EventScript_14E842:: @ 814E842
	msgbox FallarborTown_Text_16CA83, 3
	end

FallarborTown_EventScript_14E84B:: @ 814E84B
	msgbox FallarborTown_Text_16CAB9, 3
	end
