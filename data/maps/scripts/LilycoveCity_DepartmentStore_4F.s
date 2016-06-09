LilycoveCity_DepartmentStore_4F_MapScripts:: @ 8159FFD
	.byte 0

LilycoveCity_DepartmentStore_4F_EventScript_159FFE:: @ 8159FFE
	loadptr 0, LilycoveCity_DepartmentStore_4F_Text_18C39C
	callstd 2
	end

LilycoveCity_DepartmentStore_4F_EventScript_15A007:: @ 815A007
	loadptr 0, LilycoveCity_DepartmentStore_4F_Text_18C41B
	callstd 2
	end

LilycoveCity_DepartmentStore_4F_EventScript_15A010:: @ 815A010
	loadptr 0, LilycoveCity_DepartmentStore_4F_Text_18C481
	callstd 2
	end

LilycoveCity_DepartmentStore_4F_EventScript_15A019:: @ 815A019
	lock
	faceplayer
	message LilycoveCity_DepartmentStore_4F_Text_1A0BE4
	waittext
	pokemart LilycoveCity_DepartmentStore_4F_Pokemart_15A030
	loadptr 0, LilycoveCity_DepartmentStore_4F_Text_1A0C02
	callstd 4
	release
	end

LilycoveCity_DepartmentStore_4F_Pokemart_15A030:: @ 815A030
	.2byte ITEM_TM38
	.2byte ITEM_TM25
	.2byte ITEM_TM14
	.2byte ITEM_TM15
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_4F_EventScript_15A03C:: @ 815A03C
	lock
	faceplayer
	message LilycoveCity_DepartmentStore_4F_Text_1A0BE4
	waittext
	pokemart LilycoveCity_DepartmentStore_4F_Pokemart_15A054
	loadptr 0, LilycoveCity_DepartmentStore_4F_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x15a053, 0x1

LilycoveCity_DepartmentStore_4F_Pokemart_15A054:: @ 815A054
	.2byte ITEM_TM17
	.2byte ITEM_TM20
	.2byte ITEM_TM33
	.2byte ITEM_TM16
	.2byte ITEM_NONE
	release
	end

