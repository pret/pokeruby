FortreeCity_DecorationShop_MapScripts:: @ 8158257
	.byte 0

FortreeCity_DecorationShop_EventScript_158258:: @ 8158258
	msgbox FortreeCity_DecorationShop_Text_186A61, 2
	end

FortreeCity_DecorationShop_EventScript_158261:: @ 8158261
	msgbox FortreeCity_DecorationShop_Text_186AD6, 2
	end

FortreeCity_DecorationShop_EventScript_15826A:: @ 815826A
	lock
	faceplayer
	message FortreeCity_DecorationShop_Text_1A0BE4
	waitmessage
	pokemartdecoration FortreeCity_DecorationShop_Decorations1
	msgbox FortreeCity_DecorationShop_Text_1A0C02, 4
	release
	end

	.align 2
FortreeCity_DecorationShop_Decorations1:: @ 8158284
	.2byte DECOR_SMALL_DESK
	.2byte DECOR_POKEMON_DESK
	.2byte DECOR_HEAVY_DESK
	.2byte DECOR_RAGGED_DESK
	.2byte DECOR_COMFORT_DESK
	.2byte DECOR_BRICK_DESK
	.2byte DECOR_CAMP_DESK
	.2byte DECOR_HARD_DESK
	.2byte DECOR_NONE
	release
	end

FortreeCity_DecorationShop_EventScript_158298:: @ 8158298
	lock
	faceplayer
	message FortreeCity_DecorationShop_Text_1A0BE4
	waitmessage
	pokemartdecoration FortreeCity_DecorationShop_Decorations2
	msgbox FortreeCity_DecorationShop_Text_1A0C02, 4
	release
	end

	.align 2
FortreeCity_DecorationShop_Decorations2:: @ 81582B0
	.2byte DECOR_SMALL_CHAIR
	.2byte DECOR_POKEMON_CHAIR
	.2byte DECOR_HEAVY_CHAIR
	.2byte DECOR_RAGGED_CHAIR
	.2byte DECOR_COMFORT_CHAIR
	.2byte DECOR_BRICK_CHAIR
	.2byte DECOR_CAMP_CHAIR
	.2byte DECOR_HARD_CHAIR
	.2byte DECOR_NONE
	release
	end
