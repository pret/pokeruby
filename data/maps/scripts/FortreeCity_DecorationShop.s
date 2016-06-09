FortreeCity_DecorationShop_MapScripts:: @ 8158257
	.byte 0

FortreeCity_DecorationShop_EventScript_158258:: @ 8158258
	loadptr 0, FortreeCity_DecorationShop_Text_186A61
	callstd 2
	end

FortreeCity_DecorationShop_EventScript_158261:: @ 8158261
	loadptr 0, FortreeCity_DecorationShop_Text_186AD6
	callstd 2
	end

FortreeCity_DecorationShop_EventScript_15826A:: @ 815826A
	lock
	faceplayer
	message FortreeCity_DecorationShop_Text_1A0BE4
	waittext
	pokemartdecor FortreeCity_DecorationShop_Pokemart_158284
	loadptr 0, FortreeCity_DecorationShop_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x158281, 0x3

FortreeCity_DecorationShop_Pokemart_158284:: @ 8158284
	.2byte ITEM_MASTER_BALL
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_POKE_BALL
	.2byte ITEM_SAFARI_BALL
	.2byte ITEM_DIVE_BALL
	.2byte ITEM_NEST_BALL
	.2byte ITEM_REPEAT_BALL
	.2byte ITEM_NONE
	release
	end

FortreeCity_DecorationShop_EventScript_158298:: @ 8158298
	lock
	faceplayer
	message FortreeCity_DecorationShop_Text_1A0BE4
	waittext
	pokemartdecor FortreeCity_DecorationShop_Pokemart_1582B0
	loadptr 0, FortreeCity_DecorationShop_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x1582af, 0x1

FortreeCity_DecorationShop_Pokemart_1582B0:: @ 81582B0
	.2byte ITEM_TIMER_BALL
	.2byte ITEM_LUXURY_BALL
	.2byte ITEM_PREMIER_BALL
	.2byte ITEM_BURN_HEAL
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_ICE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_NONE
	release
	end

