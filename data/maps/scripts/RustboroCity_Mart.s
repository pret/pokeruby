RustboroCity_Mart_MapScripts:: @ 8157BD3
	.byte 0

RustboroCity_Mart_EventScript_157BD4:: @ 8157BD4
	lock
	faceplayer
	message RustboroCity_Mart_Text_1A0BE4
	waittext
	checkflag 287
	jumpif 0, RustboroCity_Mart_EventScript_157BEF
	checkflag 287
	jumpeq RustboroCity_Mart_EventScript_157C18
	end

RustboroCity_Mart_EventScript_157BEF:: @ 8157BEF
	pokemart RustboroCity_Mart_Pokemart_157C00
	loadptr 0, RustboroCity_Mart_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x157bfe, 0x2

RustboroCity_Mart_Pokemart_157C00:: @ 8157C00
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
	pokemart RustboroCity_Mart_Pokemart_157C28
	loadptr 0, RustboroCity_Mart_Text_1A0C02
	callstd 4
	release
	end

	.incbin "baserom.gba", 0x157c27, 0x1

RustboroCity_Mart_Pokemart_157C28:: @ 8157C28
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
	loadptr 0, RustboroCity_Mart_Text_184C76
	callstd 2
	end

RustboroCity_Mart_EventScript_157C4D:: @ 8157C4D
	loadptr 0, RustboroCity_Mart_Text_184CD8
	callstd 2
	end

RustboroCity_Mart_EventScript_157C56:: @ 8157C56
	loadptr 0, RustboroCity_Mart_Text_184D43
	callstd 2
	end

