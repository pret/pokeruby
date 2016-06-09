LilycoveCity_DepartmentStore_5F_MapScripts:: @ 815A060
	.byte 0

LilycoveCity_DepartmentStore_5F_EventScript_15A061:: @ 815A061
	lock
	faceplayer
	message LilycoveCity_DepartmentStore_5F_Text_1A0BE4
	waittext
	pokemartbp LilycoveCity_DepartmentStore_5F_Pokemart_15A078
	loadptr 0, LilycoveCity_DepartmentStore_5F_Text_1A0C02
	callstd 4
	release
	end

LilycoveCity_DepartmentStore_5F_Pokemart_15A078:: @ 815A078
	.2byte ITEM_X_DEFEND
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_ACCURACY
	.2byte ITEM_SUPER_REPEL
	.2byte 91
	.2byte 92
	.2byte ITEM_SUN_STONE
	.2byte ITEM_MOON_STONE
	.2byte ITEM_FIRE_STONE
	.2byte ITEM_THUNDER_STONE
	.2byte ITEM_WATER_STONE
	.2byte ITEM_LEAF_STONE
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_5F_EventScript_15A094:: @ 815A094
	lock
	faceplayer
	message LilycoveCity_DepartmentStore_5F_Text_1A0BE4
	waittext
	pokemartbp LilycoveCity_DepartmentStore_5F_Pokemart_15A0AC
	loadptr 0, LilycoveCity_DepartmentStore_5F_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x15a0ab, 0x1

LilycoveCity_DepartmentStore_5F_Pokemart_15A0AC:: @ 815A0AC
	.2byte 101
	.2byte 102
	.2byte ITEM_BIG_MUSHROOM
	.2byte 105
	.2byte ITEM_PEARL
	.2byte ITEM_BIG_PEARL
	.2byte ITEM_STARDUST
	.2byte ITEM_STAR_PIECE
	.2byte ITEM_NUGGET
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_5F_EventScript_15A0C2:: @ 815A0C2
	lock
	faceplayer
	message LilycoveCity_DepartmentStore_5F_Text_1A0BE4
	waittext
	pokemartbp LilycoveCity_DepartmentStore_5F_Pokemart_15A0DC
	loadptr 0, LilycoveCity_DepartmentStore_5F_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x15a0d9, 0x3

LilycoveCity_DepartmentStore_5F_Pokemart_15A0DC:: @ 815A0DC
	.2byte ITEM_CARBOS
	.2byte ITEM_CALCIUM
	.2byte ITEM_RARE_CANDY
	.2byte ITEM_PP_UP
	.2byte ITEM_ZINC
	.2byte ITEM_PP_MAX
	.2byte 72
	.2byte ITEM_GUARD_SPEC
	.2byte ITEM_DIRE_HIT
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_5F_EventScript_15A0F2:: @ 815A0F2
	lock
	faceplayer
	message LilycoveCity_DepartmentStore_5F_Text_1A0BE4
	waittext
	pokemartbp LilycoveCity_DepartmentStore_5F_Pokemart_15A10C
	loadptr 0, LilycoveCity_DepartmentStore_5F_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x15a109, 0x3

LilycoveCity_DepartmentStore_5F_Pokemart_15A10C:: @ 815A10C
	.2byte 59
	.2byte 60
	.2byte 61
	.2byte 62
	.2byte ITEM_HP_UP
	.2byte ITEM_PROTEIN
	.2byte ITEM_IRON
	.2byte ITEM_RED_SHARD
	.2byte ITEM_BLUE_SHARD
	.2byte ITEM_YELLOW_SHARD
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_5F_EventScript_15A124:: @ 815A124
	loadptr 0, LilycoveCity_DepartmentStore_5F_Text_18C4F9
	callstd 2
	end

LilycoveCity_DepartmentStore_5F_EventScript_15A12D:: @ 815A12D
	loadptr 0, LilycoveCity_DepartmentStore_5F_Text_18C59F
	callstd 2
	end

LilycoveCity_DepartmentStore_5F_EventScript_15A136:: @ 815A136
	loadptr 0, LilycoveCity_DepartmentStore_5F_Text_18C556
	callstd 2
	end

