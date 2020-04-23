DewfordTown_House2_MapScripts:: @ 81535DB
	.byte 0

DewfordTown_House2_EventScript_1535DC:: @ 81535DC
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_SILK_SCARF, DewfordTown_House2_EventScript_153615
	msgbox DewfordTown_House2_Text_175EFE, MSGBOX_DEFAULT
	giveitem ITEM_SILK_SCARF
	compare VAR_RESULT, 0
	goto_if_eq DewfordTown_House2_EventScript_15360B
	setflag FLAG_RECEIVED_SILK_SCARF
	release
	end

DewfordTown_House2_EventScript_15360B:: @ 815360B
	msgbox DewfordTown_House2_Text_175FDA, MSGBOX_DEFAULT
	release
	end

DewfordTown_House2_EventScript_153615:: @ 8153615
	msgbox DewfordTown_House2_Text_176055, MSGBOX_DEFAULT
	release
	end

DewfordTown_House2_EventScript_15361F:: @ 815361F
	msgbox DewfordTown_House2_Text_1760C8, MSGBOX_NPC
	end
