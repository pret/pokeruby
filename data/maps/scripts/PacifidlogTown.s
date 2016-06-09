PacifidlogTown_MapScripts:: @ 814E8EE
	map_script 3, PacifidlogTown_MapScript1_14E8F9
	map_script 5, PacifidlogTown_MapScript1_14E8FD
	.byte 0

PacifidlogTown_MapScript1_14E8F9:: @ 814E8F9
	setflag 2069
	end

PacifidlogTown_MapScript1_14E8FD:: @ 814E8FD
	tileeffect 3
	end

PacifidlogTown_EventScript_14E900:: @ 814E900
	loadptr 0, PacifidlogTown_Text_16D04A
	callstd 2
	end

PacifidlogTown_EventScript_14E909:: @ 814E909
	loadptr 0, PacifidlogTown_Text_16CFC5
	callstd 2
	end

PacifidlogTown_EventScript_14E912:: @ 814E912
	loadptr 0, PacifidlogTown_Text_16D08A
	callstd 2
	end

PacifidlogTown_EventScript_14E91B:: @ 814E91B
	loadptr 0, PacifidlogTown_Text_16D0CE
	callstd 3
	end

