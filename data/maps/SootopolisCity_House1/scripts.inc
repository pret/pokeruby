SootopolisCity_House1_MapScripts:: @ 815B29A
	.byte 0

SootopolisCity_House1_EventScript_BrickBreakBlackBelt:: @ 815B29B
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM31, SootopolisCity_House1_EventScript_BrickBreakBlacSootopolisCity_House1_EventScript_ReceivedBrickBreakBelt
	msgbox SootopolisCity_House1_Text_DevelopedThisTM, MSGBOX_DEFAULT
	giveitem ITEM_TM31_BRICK_BREAK
	setflag FLAG_RECEIVED_TM31
	msgbox SootopolisCity_House1_Text_ExplainBrickBreak, MSGBOX_DEFAULT
	release
	end

SootopolisCity_House1_EventScript_BrickBreakBlacSootopolisCity_House1_EventScript_ReceivedBrickBreakBelt:: @ 815B2C7
	msgbox SootopolisCity_House1_Text_ExplainBrickBreak, MSGBOX_DEFAULT
	release
	end

SootopolisCity_House1_EventScript_Kecleon:: @ 815B2D1
	lock
	faceplayer
	waitse
	playmoncry SPECIES_KECLEON, 0
	msgbox SootopolisCity_House1_Text_Kecleon, MSGBOX_DEFAULT
	waitmoncry
	release
	end
