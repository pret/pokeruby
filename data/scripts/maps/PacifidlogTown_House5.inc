PacifidlogTown_House5_MapScripts:: @ 8154393
	.byte 0

PacifidlogTown_House5_EventScript_154394:: @ 8154394
	lock
	faceplayer
	specialvar RESULT, IsMirageIslandPresent
	compare RESULT, 1
	goto_if_eq PacifidlogTown_House5_EventScript_1543B0
	msgbox PacifidlogTown_House5_Text_179718, 4
	release
	end

PacifidlogTown_House5_EventScript_1543B0:: @ 81543B0
	msgbox PacifidlogTown_House5_Text_17973B, 4
	release
	end

PacifidlogTown_House5_EventScript_1543BA:: @ 81543BA
	msgbox PacifidlogTown_House5_Text_179765, 2
	end
