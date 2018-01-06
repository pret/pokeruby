PetalburgCity_Mart_MapScripts:: @ 81552AF
	.byte 0

PetalburgCity_Mart_EventScript_1552B0:: @ 81552B0
	lock
	faceplayer
	message PetalburgCity_Mart_Text_1A0BE4
	waitmessage
	goto_if_set FLAG_PETALBURG_MART_EXPANDED_ITEMS, PetalburgCity_Mart_EventScript_1552EA
	pokemart PetalburgCity_Mart_Items1
	msgbox PetalburgCity_Mart_Text_1A0C02, 4
	release
	end

	.align 2
PetalburgCity_Mart_Items1:: @ 81552D0
	.2byte ITEM_POKE_BALL
	.2byte ITEM_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_REPEL
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_ORANGE_MAIL
	.2byte ITEM_NONE
	release
	end

PetalburgCity_Mart_EventScript_1552EA:: @ 81552EA
	pokemart PetalburgCity_Mart_Items2
	msgbox PetalburgCity_Mart_Text_1A0C02, 4
	release
	end

	.align 2
PetalburgCity_Mart_Items2:: @ 81552FC
	.2byte ITEM_POKE_BALL
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_POTION
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_AWAKENING
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_REPEL
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_ORANGE_MAIL
	.2byte ITEM_NONE
	release
	end

PetalburgCity_Mart_EventScript_15531A:: @ 815531A
	msgbox PetalburgCity_Mart_Text_17BFFD, 2
	end

PetalburgCity_Mart_EventScript_155323:: @ 8155323
	msgbox PetalburgCity_Mart_Text_17C06C, 2
	end

PetalburgCity_Mart_EventScript_15532C:: @ 815532C
	msgbox PetalburgCity_Mart_Text_17C0BC, 2
	end
