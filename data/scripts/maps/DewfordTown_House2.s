DewfordTown_House2_MapScripts:: @ 81535DB
	.byte 0

DewfordTown_House2_EventScript_1535DC:: @ 81535DC
	lock
	faceplayer
	checkflag 289
	jumpif FLAG_IS_SET, DewfordTown_House2_EventScript_153615
	msgbox DewfordTown_House2_Text_175EFE, 4
	giveitem ITEM_SILK_SCARF
	compare RESULT, 0
	jumpif EQUAL, DewfordTown_House2_EventScript_15360B
	setflag 289
	release
	end

DewfordTown_House2_EventScript_15360B:: @ 815360B
	msgbox DewfordTown_House2_Text_175FDA, 4
	release
	end

DewfordTown_House2_EventScript_153615:: @ 8153615
	msgbox DewfordTown_House2_Text_176055, 4
	release
	end

DewfordTown_House2_EventScript_15361F:: @ 815361F
	msgbox DewfordTown_House2_Text_1760C8, 2
	end
