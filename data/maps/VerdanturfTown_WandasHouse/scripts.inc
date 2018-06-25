VerdanturfTown_WandasHouse_MapScripts:: @ 8153F5A
	.byte 0

VerdanturfTown_WandasHouse_EventScript_153F5B:: @ 8153F5B
	lock
	faceplayer
	goto_if_set FLAG_WALLY_SPEECH, VerdanturfTown_WandasHouse_EventScript_153F73
	msgbox VerdanturfTown_WandasHouse_Text_1783F6, 4
	setflag FLAG_WALLY_SPEECH
	release
	end

VerdanturfTown_WandasHouse_EventScript_153F73:: @ 8153F73
	msgbox VerdanturfTown_WandasHouse_Text_178521, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_153F7D:: @ 8153F7D
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_WALLY_VICTORY_ROAD, VerdanturfTown_WandasHouse_EventScript_153FA5
	goto_if_set FLAG_DEFEATED_LAVARIDGE_GYM, VerdanturfTown_WandasHouse_EventScript_153F9B
	msgbox VerdanturfTown_WandasHouse_Text_17859A, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_153F9B:: @ 8153F9B
	msgbox VerdanturfTown_WandasHouse_Text_178683, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_153FA5:: @ 8153FA5
	msgbox VerdanturfTown_WandasHouse_Text_1786B5, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_153FAF:: @ 8153FAF
	msgbox VerdanturfTown_WandasHouse_Text_17886A, 2
	end

VerdanturfTown_WandasHouse_EventScript_153FB8:: @ 8153FB8
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_LAVARIDGE_GYM, VerdanturfTown_WandasHouse_EventScript_153FE0
	goto_if_set FLAG_DEFEATED_WALLY_MAUVILLE, VerdanturfTown_WandasHouse_EventScript_153FD6
	msgbox VerdanturfTown_WandasHouse_Text_1787FB, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_153FD6:: @ 8153FD6
	msgbox VerdanturfTown_WandasHouse_Text_178739, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_153FE0:: @ 8153FE0
	msgbox VerdanturfTown_WandasHouse_Text_1787FB, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_153FEA:: @ 8153FEA
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_WALLY_VICTORY_ROAD, VerdanturfTown_WandasHouse_EventScript_154025
	goto_if_set FLAG_DEFEATED_LAVARIDGE_GYM, VerdanturfTown_WandasHouse_EventScript_15401B
	goto_if_set FLAG_RUSTURF_TUNNEL_OPENED, VerdanturfTown_WandasHouse_EventScript_154011
	msgbox VerdanturfTown_WandasHouse_Text_1788B1, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_154011:: @ 8154011
	msgbox VerdanturfTown_WandasHouse_Text_178983, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_15401B:: @ 815401B
	msgbox VerdanturfTown_WandasHouse_Text_1789DD, 4
	release
	end

VerdanturfTown_WandasHouse_EventScript_154025:: @ 8154025
	msgbox VerdanturfTown_WandasHouse_Text_178A47, 4
	release
	end
