SootopolisCity_Mart_MapScripts:: @ 815B21A
	.byte 0

SootopolisCity_Mart_EventScript_15B21B:: @ 815B21B
	lock
	faceplayer
	message SootopolisCity_Mart_Text_1A0BE4
	waitmessage
	pokemart SootopolisCity_Mart_Items
	msgbox SootopolisCity_Mart_Text_1A0C02, 4
	release
	end

	.align 2
SootopolisCity_Mart_Items:: @ 815B234
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

SootopolisCity_Mart_EventScript_15B24A:: @ 815B24A
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_Mart_EventScript_15B268
	goto_if_unset FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, SootopolisCity_Mart_EventScript_15B268
	msgbox SootopolisCity_Mart_Text_18F8D7, 4
	release
	end

SootopolisCity_Mart_EventScript_15B268:: @ 815B268
	msgbox SootopolisCity_Mart_Text_18F890, 4
	release
	end

SootopolisCity_Mart_EventScript_15B272:: @ 815B272
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_Mart_EventScript_15B290
	goto_if_unset FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, SootopolisCity_Mart_EventScript_15B290
	msgbox SootopolisCity_Mart_Text_18F96B, 4
	release
	end

SootopolisCity_Mart_EventScript_15B290:: @ 815B290
	msgbox SootopolisCity_Mart_Text_18F8F2, 4
	release
	end
