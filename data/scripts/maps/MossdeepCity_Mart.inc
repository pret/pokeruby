MossdeepCity_Mart_MapScripts:: @ 815A925
	.byte 0

MossdeepCity_Mart_EventScript_15A926:: @ 815A926
	lock
	faceplayer
	message MossdeepCity_Mart_Text_1A0BE4
	waitmessage
	pokemart MossdeepCity_Mart_Items
	msgbox MossdeepCity_Mart_Text_1A0C02, 4
	release
	end

	.align 2
MossdeepCity_Mart_Items:: @ 815A940
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_NET_BALL
	.2byte ITEM_DIVE_BALL
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_REVIVE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_NONE
	release
	end

MossdeepCity_Mart_EventScript_15A956:: @ 815A956
	msgbox MossdeepCity_Mart_Text_18D758, 2
	end

MossdeepCity_Mart_EventScript_15A95F:: @ 815A95F
	msgbox MossdeepCity_Mart_Text_18D7E7, 2
	end

MossdeepCity_Mart_EventScript_15A968:: @ 815A968
	msgbox MossdeepCity_Mart_Text_18D841, 2
	end
