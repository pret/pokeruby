FortreeCity_Mart_MapScripts:: @ 8158066
	.byte 0

FortreeCity_Mart_EventScript_158067:: @ 8158067
	lock
	faceplayer
	message FortreeCity_Mart_Text_1A0BE4
	waittext
	pokemart FortreeCity_Mart_Pokemart_158080
	loadptr 0, FortreeCity_Mart_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x15807e, 0x2

FortreeCity_Mart_Pokemart_158080:: @ 8158080
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_REVIVE
	.2byte ITEM_SUPER_REPEL
	.2byte ITEM_WOOD_MAIL
	.2byte ITEM_NONE
	release
	end

FortreeCity_Mart_EventScript_158098:: @ 8158098
	loadptr 0, FortreeCity_Mart_Text_1861EF
	callstd 2
	end

FortreeCity_Mart_EventScript_1580A1:: @ 81580A1
	loadptr 0, FortreeCity_Mart_Text_186251
	callstd 2
	end

FortreeCity_Mart_EventScript_1580AA:: @ 81580AA
	loadptr 0, FortreeCity_Mart_Text_1862CA
	callstd 2
	end

