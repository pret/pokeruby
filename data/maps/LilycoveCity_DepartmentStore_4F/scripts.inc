LilycoveCity_DepartmentStore_4F_MapScripts:: @ 8159FFD
	.byte 0

LilycoveCity_DepartmentStore_4F_EventScript_Gentleman:: @ 8159FFE
	msgbox LilycoveCity_DepartmentStore_4F_Text_AttackOrDefenseTM, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_4F_EventScript_Woman:: @ 815A007
	msgbox LilycoveCity_DepartmentStore_4F_Text_FiftyDifferentTMs, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_4F_EventScript_Youngster:: @ 815A010
	msgbox LilycoveCity_DepartmentStore_4F_Text_PokemonOnlyHaveFourMoves, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_4F_EventScript_ClerkLeft:: @ 815A019
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart LilycoveCity_DepartmentStore_4F_Pokemart_AttackTMs
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
LilycoveCity_DepartmentStore_4F_Pokemart_AttackTMs:: @ 815A030
	.2byte ITEM_TM38_FIRE_BLAST
	.2byte ITEM_TM25_THUNDER
	.2byte ITEM_TM14_BLIZZARD
	.2byte ITEM_TM15_HYPER_BEAM
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_4F_EventScript_ClerkRight:: @ 815A03C
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart LilycoveCity_DepartmentStore_4F_Pokemart_DefenseTMs
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
LilycoveCity_DepartmentStore_4F_Pokemart_DefenseTMs:: @ 815A054
	.2byte ITEM_TM17_PROTECT
	.2byte ITEM_TM20_SAFEGUARD
	.2byte ITEM_TM33_REFLECT
	.2byte ITEM_TM16_LIGHT_SCREEN
	.2byte ITEM_NONE
	release
	end
