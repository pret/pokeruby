SlateportCity_Mart_MapScripts:: @ 8156410
	.byte 0

SlateportCity_Mart_EventScript_156411:: @ 8156411
	lock
	faceplayer
	message SlateportCity_Mart_Text_1A0BE4
	waitmessage
	pokemart SlateportCity_Mart_Items
	msgbox SlateportCity_Mart_Text_1A0C02, 4
	release
	end

	.align 2
SlateportCity_Mart_Items:: @ 8156428
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
	msgbox SlateportCity_Mart_Text_180730, 2
	end

SlateportCity_Mart_EventScript_156447:: @ 8156447
	msgbox SlateportCity_Mart_Text_18079D, 2
	end
