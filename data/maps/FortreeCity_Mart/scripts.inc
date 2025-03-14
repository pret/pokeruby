FortreeCity_Mart_MapScripts:: @ 8158066
	.byte 0

FortreeCity_Mart_EventScript_Clerk:: @ 8158067
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart FortreeCity_Mart_Items
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
FortreeCity_Mart_Items:: @ 8158080
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_REVIVE
	.2byte ITEM_SUPER_REPEL
	.2byte ITEM_WOOD_MAIL
	.2byte ITEM_NONE
	release
	end

FortreeCity_Mart_EventScript_Woman:: @ 8158098
	msgbox FortreeCity_Mart_Text_SuperRepelBetter, MSGBOX_NPC
	end

FortreeCity_Mart_EventScript_Girl:: @ 81580A1
	msgbox FortreeCity_Mart_Text_StockUpOnItems, MSGBOX_NPC
	end

FortreeCity_Mart_EventScript_Boy:: @ 81580AA
	msgbox FortreeCity_Mart_Text_RareCandyMakesMonGrow, MSGBOX_NPC
	end
