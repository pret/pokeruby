LavaridgeTown_Mart_MapScripts:: @ 81538CA
	.byte 0

LavaridgeTown_Mart_EventScript_Clerk:: @ 81538CB
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart LavaridgeTown_Mart_Pokemart
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
LavaridgeTown_Mart_Pokemart:: @ 81538E4
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_BURN_HEAL
	.2byte ITEM_REVIVE
	.2byte ITEM_SUPER_REPEL
	.2byte ITEM_X_SPEED
	.2byte ITEM_NONE
	release
	end

LavaridgeTown_Mart_EventScript_ExpertM:: @ 81538FA
	msgbox LavaridgeTown_Mart_Text_XSpeedFirstStrike, MSGBOX_NPC
	end

LavaridgeTown_Mart_EventScript_OldWoman:: @ 8153903
	msgbox LavaridgeTown_Mart_Text_LocalSpecialtyOnMtChimney, MSGBOX_NPC
	end
