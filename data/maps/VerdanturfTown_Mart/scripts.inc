VerdanturfTown_Mart_MapScripts:: @ 8153EBB
	.byte 0

VerdanturfTown_Mart_EventScript_153EBC:: @ 8153EBC
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart VerdanturfTown_Mart_Items
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
VerdanturfTown_Mart_Items:: @ 8153ED4
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_NEST_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_BURN_HEAL
	.2byte ITEM_ICE_HEAL
	.2byte ITEM_REPEL
	.2byte ITEM_X_SPECIAL
	.2byte ITEM_FLUFFY_TAIL
	.2byte ITEM_NONE
	release
	end

VerdanturfTown_Mart_EventScript_153EEE:: @ 8153EEE
	msgbox VerdanturfTown_Mart_Text_1781C9, MSGBOX_NPC
	end

VerdanturfTown_Mart_EventScript_153EF7:: @ 8153EF7
	msgbox VerdanturfTown_Mart_Text_178240, MSGBOX_NPC
	end

VerdanturfTown_Mart_EventScript_153F00:: @ 8153F00
	msgbox VerdanturfTown_Mart_Text_1782C0, MSGBOX_NPC
	end
