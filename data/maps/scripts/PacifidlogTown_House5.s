PacifidlogTown_House5_MapScripts:: @ 8154393
	.byte 0

PacifidlogTown_House5_EventScript_154394:: @ 8154394
	lock
	faceplayer
	specialval RESULT, 209
	compare RESULT, 1
	jumpeq PacifidlogTown_House5_EventScript_1543B0
	loadptr 0, PacifidlogTown_House5_Text_179718
	callstd 4
	release
	end

PacifidlogTown_House5_EventScript_1543B0:: @ 81543B0
	loadptr 0, PacifidlogTown_House5_Text_17973B
	callstd 4
	release
	end

PacifidlogTown_House5_EventScript_1543BA:: @ 81543BA
	loadptr 0, PacifidlogTown_House5_Text_179765
	callstd 2
	end

