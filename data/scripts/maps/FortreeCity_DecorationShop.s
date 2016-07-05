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
	waittext
	pokemartdecor FortreeCity_DecorationShop_PokemartDecor_158284
	msgbox FortreeCity_DecorationShop_Text_1A0C02, 4
	release
	end

	.align 2
FortreeCity_DecorationShop_PokemartDecor_158284:: @ 8158284
	.2byte 1
	.2byte 2
	.2byte 3
	.2byte 4
	.2byte 5
	.2byte 7
	.2byte 8
	.2byte 9
	.2byte 0
	release
	end

FortreeCity_DecorationShop_EventScript_158298:: @ 8158298
	lock
	faceplayer
	message FortreeCity_DecorationShop_Text_1A0BE4
	waittext
	pokemartdecor FortreeCity_DecorationShop_PokemartDecor_1582B0
	msgbox FortreeCity_DecorationShop_Text_1A0C02, 4
	release
	end

	.align 2
FortreeCity_DecorationShop_PokemartDecor_1582B0:: @ 81582B0
	.2byte 10
	.2byte 11
	.2byte 12
	.2byte 15
	.2byte 14
	.2byte 16
	.2byte 17
	.2byte 18
	.2byte 0
	release
	end
