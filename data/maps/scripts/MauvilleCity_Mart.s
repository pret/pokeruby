MauvilleCity_Mart_MapScripts:: @ 81573BD
	.byte 0

MauvilleCity_Mart_EventScript_1573BE:: @ 81573BE
	lock
	faceplayer
	message MauvilleCity_Mart_Text_1A0BE4
	waittext
	pokemart MauvilleCity_Mart_Pokemart_1573D8
	loadptr 0, MauvilleCity_Mart_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x1573d5, 0x3

MauvilleCity_Mart_Pokemart_1573D8:: @ 81573D8
	.2byte ITEM_POKE_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_GUARD_SPEC
	.2byte ITEM_DIRE_HIT
	.2byte ITEM_X_ACCURACY
	.2byte ITEM_NONE
	release
	end

MauvilleCity_Mart_EventScript_1573F4:: @ 81573F4
	loadptr 0, MauvilleCity_Mart_Text_1827D3
	callstd 2
	end

MauvilleCity_Mart_EventScript_1573FD:: @ 81573FD
	loadptr 0, MauvilleCity_Mart_Text_18287F
	callstd 2
	end

