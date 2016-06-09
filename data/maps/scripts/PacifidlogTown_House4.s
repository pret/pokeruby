PacifidlogTown_House4_MapScripts:: @ 815434B
	.byte 0

PacifidlogTown_House4_EventScript_15434C:: @ 815434C
	loadptr 0, PacifidlogTown_House4_Text_17961F
	callstd 2
	end

PacifidlogTown_House4_EventScript_154355:: @ 8154355
	loadptr 0, PacifidlogTown_House4_Text_17959B
	callstd 2
	end

PacifidlogTown_House4_EventScript_15435E:: @ 815435E
	lock
	faceplayer
	loadptr 0, PacifidlogTown_House4_Text_17963D
	callstd 5
	compare RESULT, 1
	jumpeq PacifidlogTown_House4_EventScript_15437F
	compare RESULT, 0
	jumpeq PacifidlogTown_House4_EventScript_154389
	end

PacifidlogTown_House4_EventScript_15437F:: @ 815437F
	loadptr 0, PacifidlogTown_House4_Text_179656
	callstd 4
	release
	end

PacifidlogTown_House4_EventScript_154389:: @ 8154389
	loadptr 0, PacifidlogTown_House4_Text_17968C
	callstd 4
	release
	end

