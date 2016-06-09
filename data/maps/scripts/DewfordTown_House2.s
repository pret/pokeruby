DewfordTown_House2_MapScripts:: @ 81535DB
	.byte 0

DewfordTown_House2_EventScript_1535DC:: @ 81535DC
	lock
	faceplayer
	checkflag 289
	jumpeq DewfordTown_House2_EventScript_153615
	loadptr 0, DewfordTown_House2_Text_175EFE
	callstd 4
	setorcopyvar 0x8000, 0xd9
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq DewfordTown_House2_EventScript_15360B
	setflag 289
	release
	end

DewfordTown_House2_EventScript_15360B:: @ 815360B
	loadptr 0, DewfordTown_House2_Text_175FDA
	callstd 4
	release
	end

DewfordTown_House2_EventScript_153615:: @ 8153615
	loadptr 0, DewfordTown_House2_Text_176055
	callstd 4
	release
	end

DewfordTown_House2_EventScript_15361F:: @ 815361F
	loadptr 0, DewfordTown_House2_Text_1760C8
	callstd 2
	end

