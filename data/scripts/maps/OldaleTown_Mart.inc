OldaleTown_Mart_MapScripts:: @ 8152F78
	.byte 0

OldaleTown_Mart_EventScript_152F79:: @ 8152F79
	lock
	faceplayer
	message OldaleTown_Mart_Text_1A0BE4
	waitmessage
	goto_if_set FLAG_ADVENTURE_STARTED, OldaleTown_Mart_EventScript_152FA8
	pokemart OldaleTown_Mart_Items1
	msgbox OldaleTown_Mart_Text_1A0C02, 4
	release
	end

	.align 2
OldaleTown_Mart_Items1:: @ 8152F9C
	.2byte ITEM_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_NONE
	release
	end

OldaleTown_Mart_EventScript_152FA8:: @ 8152FA8
	pokemart OldaleTown_Mart_Items2
	msgbox OldaleTown_Mart_Text_1A0C02, 4
	release
	end

	.align 2
OldaleTown_Mart_Items2:: @ 8152FB8
	.2byte ITEM_POKE_BALL
	.2byte ITEM_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_NONE
	release
	end

OldaleTown_Mart_EventScript_152FC6:: @ 8152FC6
	lock
	faceplayer
	goto_if_set FLAG_ADVENTURE_STARTED, OldaleTown_Mart_EventScript_152FDB
	msgbox OldaleTown_Mart_Text_174A8A, 4
	release
	end

OldaleTown_Mart_EventScript_152FDB:: @ 8152FDB
	msgbox OldaleTown_Mart_Text_174ACB, 4
	release
	end

OldaleTown_Mart_EventScript_152FE5:: @ 8152FE5
	msgbox OldaleTown_Mart_Text_174B10, 2
	end
