LilycoveCity_DepartmentStore_3F_MapScripts:: @ 8159F90
	.byte 0

LilycoveCity_DepartmentStore_3F_EventScript_ClerkLeft:: @ 8159F91
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart LilycoveCity_DepartmentStore_3F_Pokemart_Vitamins
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
LilycoveCity_DepartmentStore_3F_Pokemart_Vitamins:: @ 8159FA8
	.2byte ITEM_PROTEIN
	.2byte ITEM_CALCIUM
	.2byte ITEM_IRON
	.2byte ITEM_ZINC
	.2byte ITEM_CARBOS
	.2byte ITEM_HP_UP
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_3F_EventScript_ClerkRight:: @ 8159FB8
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart LilycoveCity_DepartmentStore_3F_Pokemart_StatBoosters
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end


	.align 2
LilycoveCity_DepartmentStore_3F_Pokemart_StatBoosters:: @ 8159FD0
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

LilycoveCity_DepartmentStore_3F_EventScript_TriathleteM:: @ 8159FE2
	msgbox LilycoveCity_DepartmentStore_3F_Text_ItemsBestForTougheningPokemon, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_3F_EventScript_PokefanM:: @ 8159FEB
	msgbox LilycoveCity_DepartmentStore_3F_Text_WantMoreEndurance, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_3F_EventScript_Woman:: @ 8159FF4
	msgbox LilycoveCity_DepartmentStore_3F_Text_GaveCarbosToSpeedUpMon, MSGBOX_NPC
	end
