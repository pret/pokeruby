FallarborTown_Mart_MapScripts:: @ 8153966
	.byte 0

FallarborTown_Mart_EventScript_153967:: @ 8153967
	lock
	faceplayer
	message FallarborTown_Mart_Text_1A0BE4
	waitmessage
	pokemart FallarborTown_Mart_Items
	msgbox FallarborTown_Mart_Text_1A0C02, 4
	release
	end

	.align 2
FallarborTown_Mart_Items:: @ 8153980
	.2byte ITEM_GREAT_BALL
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_SUPER_REPEL
	.2byte ITEM_X_SPECIAL
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_DIRE_HIT
	.2byte ITEM_GUARD_SPEC
	.2byte ITEM_NONE
	release
	end

FallarborTown_Mart_EventScript_15399C:: @ 815399C
	msgbox FallarborTown_Mart_Text_176FF0, 2
	end

FallarborTown_Mart_EventScript_1539A5:: @ 81539A5
	msgbox FallarborTown_Mart_Text_1770E2, 2
	end

FallarborTown_Mart_EventScript_1539AE:: @ 81539AE
	lock
	faceplayer
	waitse
	playmoncry SPECIES_SKITTY, 0
	msgbox FallarborTown_Mart_Text_1770D3, 4
	waitmoncry
	release
	end
