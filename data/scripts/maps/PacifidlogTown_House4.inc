PacifidlogTown_House4_MapScripts:: @ 815434B
	.byte 0

PacifidlogTown_House4_EventScript_15434C:: @ 815434C
	msgbox PacifidlogTown_House4_Text_17961F, 2
	end

PacifidlogTown_House4_EventScript_154355:: @ 8154355
	msgbox PacifidlogTown_House4_Text_17959B, 2
	end

PacifidlogTown_House4_EventScript_15435E:: @ 815435E
	lock
	faceplayer
	msgbox PacifidlogTown_House4_Text_17963D, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq PacifidlogTown_House4_EventScript_15437F
	compare RESULT, NO
	goto_if_eq PacifidlogTown_House4_EventScript_154389
	end

PacifidlogTown_House4_EventScript_15437F:: @ 815437F
	msgbox PacifidlogTown_House4_Text_179656, 4
	release
	end

PacifidlogTown_House4_EventScript_154389:: @ 8154389
	msgbox PacifidlogTown_House4_Text_17968C, 4
	release
	end
