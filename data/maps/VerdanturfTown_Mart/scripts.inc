VerdanturfTown_Mart_MapScripts:: @ 8153EBB
	.byte 0

VerdanturfTown_Mart_EventScript_Clerk:: @ 8153EBC
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart VerdanturfTown_Mart_Pokemart
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
VerdanturfTown_Mart_Pokemart:: @ 8153ED4
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

VerdanturfTown_Mart_EventScript_Boy:: @ 8153EEE
	msgbox VerdanturfTown_Mart_Text_XSpecialIsCrucial, MSGBOX_NPC
	end

VerdanturfTown_Mart_EventScript_ExpertF:: @ 8153EF7
	msgbox VerdanturfTown_Mart_Text_NoStrategyGuidesForContest, MSGBOX_NPC
	end

VerdanturfTown_Mart_EventScript_Lass:: @ 8153F00
	msgbox VerdanturfTown_Mart_Text_NestBallOnWeakenedPokemon, MSGBOX_NPC
	end
