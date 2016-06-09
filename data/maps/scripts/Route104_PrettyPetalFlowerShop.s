Route104_PrettyPetalFlowerShop_MapScripts:: @ 815BDE4
	map_script 3, Route104_PrettyPetalFlowerShop_MapScript1_15BDEA
	.byte 0

Route104_PrettyPetalFlowerShop_MapScript1_15BDEA:: @ 815BDEA
	setflag 2108
	checkflag 127
	jumpif 0, Route104_PrettyPetalFlowerShop_EventScript_15BE03
	checkflag 2057
	jumpif 0, Route104_PrettyPetalFlowerShop_EventScript_15BE03
	setflag 1
	end

Route104_PrettyPetalFlowerShop_EventScript_15BE03:: @ 815BE03
	movespriteperm 1, 4, 6
	end

Route104_PrettyPetalFlowerShop_EventScript_15BE0B:: @ 815BE0B
	lock
	faceplayer
	checkflag 1
	jumpeq Route104_PrettyPetalFlowerShop_EventScript_15BE7C
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C5EC6
	callstd 4
	checkflag 127
	jumpeq Route104_PrettyPetalFlowerShop_EventScript_15BE4A
	setflag 127
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C5F48
	callstd 5
	compare RESULT, 1
	callif 1, Route104_PrettyPetalFlowerShop_EventScript_15BE6A
	compare RESULT, 0
	callif 1, Route104_PrettyPetalFlowerShop_EventScript_15BE73
	release
	end

Route104_PrettyPetalFlowerShop_EventScript_15BE4A:: @ 815BE4A
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C5F1B
	callstd 5
	compare RESULT, 1
	callif 1, Route104_PrettyPetalFlowerShop_EventScript_15BE6A
	compare RESULT, 0
	callif 1, Route104_PrettyPetalFlowerShop_EventScript_15BE73
	release
	end

Route104_PrettyPetalFlowerShop_EventScript_15BE6A:: @ 815BE6A
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C5F9D
	callstd 4
	return

Route104_PrettyPetalFlowerShop_EventScript_15BE73:: @ 815BE73
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C6121
	callstd 4
	return

Route104_PrettyPetalFlowerShop_EventScript_15BE7C:: @ 815BE7C
	message Route104_PrettyPetalFlowerShop_Text_1A0C42
	waittext
	pokemartbp Route104_PrettyPetalFlowerShop_Pokemart_15BE94
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x15be91, 0x3

Route104_PrettyPetalFlowerShop_Pokemart_15BE94:: @ 815BE94
	.2byte ITEM_FULL_RESTORE
	.2byte ITEM_MAX_POTION
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_REVIVE
	.2byte ITEM_NONE
	release
	end

Route104_PrettyPetalFlowerShop_EventScript_15BEA4:: @ 815BEA4
	lock
	faceplayer
	checkflag 94
	jumpif 0, Route104_PrettyPetalFlowerShop_EventScript_15BEB9
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C61E8
	callstd 4
	release
	end

Route104_PrettyPetalFlowerShop_EventScript_15BEB9:: @ 815BEB9
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C6158
	callstd 4
	setorcopyvar 0x8000, 0x10c
	setorcopyvar 0x8001, 0x1
	callstd 0
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C61E8
	callstd 4
	setflag 94
	release
	end

Route104_PrettyPetalFlowerShop_EventScript_15BEDA:: @ 815BEDA
	lock
	faceplayer
	checkdailyflags
	checkflag 2256
	jumpeq Route104_PrettyPetalFlowerShop_EventScript_15BF1A
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C62DA
	callstd 4
	random 8
	addvar RESULT, 133
	setorcopyvar 0x8000, RESULT
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route104_PrettyPetalFlowerShop_EventScript_1A029B
	setflag 2256
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C6335
	callstd 4
	release
	end

Route104_PrettyPetalFlowerShop_EventScript_15BF1A:: @ 815BF1A
	loadptr 0, Route104_PrettyPetalFlowerShop_Text_1C6335
	callstd 4
	release
	end

