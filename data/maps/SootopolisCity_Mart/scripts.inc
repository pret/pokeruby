SootopolisCity_Mart_MapScripts:: @ 815B21A
	.byte 0

SootopolisCity_Mart_EventScript_Clerk:: @ 815B21B
	lock
	faceplayer
	message Text_HowMayIServeYou
	waitmessage
	pokemart SootopolisCity_Mart_Pokemart
	msgbox Text_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
SootopolisCity_Mart_Pokemart:: @ 815B234
	.2byte ITEM_ULTRA_BALL
	.2byte ITEM_HYPER_POTION
	.2byte ITEM_MAX_POTION
	.2byte ITEM_FULL_HEAL
	.2byte ITEM_REVIVE
	.2byte ITEM_MAX_REPEL
	.2byte ITEM_X_ATTACK
	.2byte ITEM_X_DEFEND
	.2byte ITEM_SHADOW_MAIL
	.2byte ITEM_NONE
	release
	end

SootopolisCity_Mart_EventScript_FatMan:: @ 815B24A
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_Mart_EventScript_FatManNoLegendary
	goto_if_unset FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, SootopolisCity_Mart_EventScript_FatManNoLegendary
	msgbox SootopolisCity_Mart_Text_TooScaryOutside, MSGBOX_DEFAULT
	release
	end

SootopolisCity_Mart_EventScript_FatManNoLegendary:: @ 815B268
	msgbox SootopolisCity_Mart_Text_PPUpIsGreat, MSGBOX_DEFAULT
	release
	end

SootopolisCity_Mart_EventScript_Gentleman:: @ 815B272
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_Mart_EventScript_GentlemanNoLegendary
	goto_if_unset FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, SootopolisCity_Mart_EventScript_GentlemanNoLegendary
	msgbox SootopolisCity_Mart_Text_DidSomethingAwaken, MSGBOX_DEFAULT
	release
	end

SootopolisCity_Mart_EventScript_GentlemanNoLegendary:: @ 815B290
	msgbox SootopolisCity_Mart_Text_FullRestoreItemOfDreams, MSGBOX_DEFAULT
	release
	end
