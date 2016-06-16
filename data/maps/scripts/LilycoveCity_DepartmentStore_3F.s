LilycoveCity_DepartmentStore_3F_MapScripts:: @ 8159F90
	.byte 0

LilycoveCity_DepartmentStore_3F_EventScript_159F91:: @ 8159F91
	lock
	faceplayer
	message LilycoveCity_DepartmentStore_3F_Text_1A0BE4
	waittext
	pokemart LilycoveCity_DepartmentStore_3F_Pokemart_159FA8
	msgbox LilycoveCity_DepartmentStore_3F_Text_1A0C02, 4
	release
	end

LilycoveCity_DepartmentStore_3F_Pokemart_159FA8:: @ 8159FA8
	.2byte ITEM_PROTEIN
	.2byte ITEM_CALCIUM
	.2byte ITEM_IRON
	.2byte ITEM_ZINC
	.2byte ITEM_CARBOS
	.2byte ITEM_HP_UP
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_3F_EventScript_159FB8:: @ 8159FB8
	lock
	faceplayer
	message LilycoveCity_DepartmentStore_3F_Text_1A0BE4
	waittext
	pokemart LilycoveCity_DepartmentStore_3F_Pokemart_159FD0
	msgbox LilycoveCity_DepartmentStore_3F_Text_1A0C02, 4
	release
	end

	.incbin "baserom.gba", 0x159fcf, 0x1

LilycoveCity_DepartmentStore_3F_Pokemart_159FD0:: @ 8159FD0
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_SPECIAL
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_DIRE_HIT
	.2byte ITEM_GUARD_SPEC
	.2byte ITEM_X_ACCURACY
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_3F_EventScript_159FE2:: @ 8159FE2
	msgbox LilycoveCity_DepartmentStore_3F_Text_18C24B, 2
	end

LilycoveCity_DepartmentStore_3F_EventScript_159FEB:: @ 8159FEB
	msgbox LilycoveCity_DepartmentStore_3F_Text_18C2B5, 2
	end

LilycoveCity_DepartmentStore_3F_EventScript_159FF4:: @ 8159FF4
	msgbox LilycoveCity_DepartmentStore_3F_Text_18C32E, 2
	end

