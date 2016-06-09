MossdeepCity_Mart_MapScripts:: @ 815A925
	.byte 0

MossdeepCity_Mart_EventScript_15A926:: @ 815A926
	lock
	faceplayer
	message MossdeepCity_Mart_Text_1A0BE4
	waittext
	pokemart MossdeepCity_Mart_Pokemart_15A940
	loadptr 0, MossdeepCity_Mart_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x15a93d, 0x3

MossdeepCity_Mart_Pokemart_15A940:: @ 815A940
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
	loadptr 0, MossdeepCity_Mart_Text_18D758
	callstd 2
	end

MossdeepCity_Mart_EventScript_15A95F:: @ 815A95F
	loadptr 0, MossdeepCity_Mart_Text_18D7E7
	callstd 2
	end

MossdeepCity_Mart_EventScript_15A968:: @ 815A968
	loadptr 0, MossdeepCity_Mart_Text_18D841
	callstd 2
	end

