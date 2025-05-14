RustboroCity_Mart_MapScripts:: @ 8157BD3
	.byte 0

RustboroCity_Mart_EventScript_Clerk:: @ 8157BD4
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	goto_if_unset FLAG_MET_DEVON_EMPLOYEE, RustboroCity_Mart_EventScript_PokemartBasic
	goto_if_set FLAG_MET_DEVON_EMPLOYEE, RustboroCity_Mart_EventScript_PokemartExpanded
	end

RustboroCity_Mart_EventScript_PokemartBasic:: @ 8157BEF
	pokemart RustboroCity_Mart_Pokemart_Basic
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
RustboroCity_Mart_Pokemart_Basic:: @ 8157C00
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

RustboroCity_Mart_EventScript_PokemartExpanded:: @ 8157C18
	pokemart RustboroCity_Mart_Pokemart_Expanded
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
RustboroCity_Mart_Pokemart_Expanded:: @ 8157C28
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

RustboroCity_Mart_EventScript_PokefanF:: @ 8157C44
	msgbox RustboroCity_Mart_Text_BuyingHealsInCaseOfShroomish, MSGBOX_NPC
	end

RustboroCity_Mart_EventScript_Boy:: @ 8157C4D
	msgbox RustboroCity_Mart_Text_ShouldBuySuperPotionsInstead, MSGBOX_NPC
	end

RustboroCity_Mart_EventScript_BugCatcher:: @ 8157C56
	msgbox RustboroCity_Mart_Text_GettingEscapeRopeJustInCase, MSGBOX_NPC
	end
