RustboroCity_Mart_MapScripts:: @ 8157BD3
	.byte 0

RustboroCity_Mart_EventScript_157BD4:: @ 8157BD4
	lock
	faceplayer
	message RustboroCity_Mart_Text_1A0BE4
	waitmessage
	goto_if_unset FLAG_MET_DEVON_EMPLOYEE, RustboroCity_Mart_EventScript_157BEF
	goto_if_set FLAG_MET_DEVON_EMPLOYEE, RustboroCity_Mart_EventScript_157C18
	end

RustboroCity_Mart_EventScript_157BEF:: @ 8157BEF
	pokemart RustboroCity_Mart_Items1
	msgbox RustboroCity_Mart_Text_1A0C02, 4
	release
	end

	.align 2
RustboroCity_Mart_Items1:: @ 8157C00
	.2byte ITEM_POKE_BALL
	.2byte ITEM_POTION
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_REPEL
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_NONE
	release
	end

RustboroCity_Mart_EventScript_157C18:: @ 8157C18
	pokemart RustboroCity_Mart_Items2
	msgbox RustboroCity_Mart_Text_1A0C02, 4
	release
	end

	.align 2
RustboroCity_Mart_Items2:: @ 8157C28
	.2byte ITEM_POKE_BALL
	.2byte ITEM_TIMER_BALL
	.2byte ITEM_REPEAT_BALL
	.2byte ITEM_POTION
	.2byte ITEM_SUPER_POTION
	.2byte ITEM_ANTIDOTE
	.2byte ITEM_PARALYZE_HEAL
	.2byte ITEM_ESCAPE_ROPE
	.2byte ITEM_REPEL
	.2byte ITEM_X_SPEED
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_NONE
	release
	end

RustboroCity_Mart_EventScript_157C44:: @ 8157C44
	msgbox RustboroCity_Mart_Text_184C76, 2
	end

RustboroCity_Mart_EventScript_157C4D:: @ 8157C4D
	msgbox RustboroCity_Mart_Text_184CD8, 2
	end

RustboroCity_Mart_EventScript_157C56:: @ 8157C56
	msgbox RustboroCity_Mart_Text_184D43, 2
	end
