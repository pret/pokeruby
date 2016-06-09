SlateportCity_Mart_MapScripts:: @ 8156410
	.byte 0

SlateportCity_Mart_EventScript_156411:: @ 8156411
	lock
	faceplayer
	message SlateportCity_Mart_Text_1A0BE4
	waittext
	pokemart SlateportCity_Mart_Pokemart_156428
	loadptr 0, SlateportCity_Mart_Text_1A0C02
	callstd 4
	release
	end

SlateportCity_Mart_Pokemart_156428:: @ 8156428
	.2byte ITEM_POKE_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_POTION
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_REPEL
	.2byte ITEM_HARBOR_MAIL
	.2byte ITEM_NONE
	release
	end

SlateportCity_Mart_EventScript_15643E:: @ 815643E
	loadptr 0, SlateportCity_Mart_Text_180730
	callstd 2
	end

SlateportCity_Mart_EventScript_156447:: @ 8156447
	loadptr 0, SlateportCity_Mart_Text_18079D
	callstd 2
	end

