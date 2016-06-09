PetalburgCity_Mart_MapScripts:: @ 81552AF
	.byte 0

PetalburgCity_Mart_EventScript_1552B0:: @ 81552B0
	lock
	faceplayer
	message PetalburgCity_Mart_Text_1A0BE4
	waittext
	checkflag 296
	jumpeq PetalburgCity_Mart_EventScript_1552EA
	pokemart PetalburgCity_Mart_Pokemart_1552D0
	loadptr 0, PetalburgCity_Mart_Text_1A0C02
	callstd 4
	release
	end

PetalburgCity_Mart_Pokemart_1552D0:: @ 81552D0
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
	pokemart PetalburgCity_Mart_Pokemart_1552FC
	loadptr 0, PetalburgCity_Mart_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x1552f9, 0x3

PetalburgCity_Mart_Pokemart_1552FC:: @ 81552FC
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
	loadptr 0, PetalburgCity_Mart_Text_17BFFD
	callstd 2
	end

PetalburgCity_Mart_EventScript_155323:: @ 8155323
	loadptr 0, PetalburgCity_Mart_Text_17C06C
	callstd 2
	end

PetalburgCity_Mart_EventScript_15532C:: @ 815532C
	loadptr 0, PetalburgCity_Mart_Text_17C0BC
	callstd 2
	end

