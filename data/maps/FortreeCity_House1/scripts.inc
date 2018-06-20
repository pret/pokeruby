FortreeCity_House1_MapScripts:: @ 8157E12
	.byte 0

FortreeCity_House1_EventScript_157E13:: @ 8157E13
	lock
	faceplayer
	goto_if_set FLAG_FORTREE_NPC_TRADE_COMPLETED, FortreeCity_House1_EventScript_157EAD
	setvar VAR_SPECIAL_8, 1
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_8
	specialvar RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_SPECIAL_9, RESULT
	msgbox FortreeCity_House1_Text_18568C, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq FortreeCity_House1_EventScript_157E95
	special SelectMonForNPCTrade
	waitstate
	copyvar VAR_SPECIAL_A, VAR_SPECIAL_4
	compare VAR_SPECIAL_4, 255
	goto_if_eq FortreeCity_House1_EventScript_157E95
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_A
	specialvar RESULT, GetTradeSpecies
	copyvar VAR_SPECIAL_B, RESULT
	compare RESULT, VAR_SPECIAL_9
	goto_if_ne FortreeCity_House1_EventScript_157E9F
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_8
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	bufferspeciesname 0, VAR_SPECIAL_9
	msgbox FortreeCity_House1_Text_1856F7, 4
	setflag FLAG_FORTREE_NPC_TRADE_COMPLETED
	release
	end

FortreeCity_House1_EventScript_157E95:: @ 8157E95
	msgbox FortreeCity_House1_Text_18577F, 4
	release
	end

FortreeCity_House1_EventScript_157E9F:: @ 8157E9F
	bufferspeciesname 0, VAR_SPECIAL_9
	msgbox FortreeCity_House1_Text_185737, 4
	release
	end

FortreeCity_House1_EventScript_157EAD:: @ 8157EAD
	msgbox FortreeCity_House1_Text_1857C7, 4
	release
	end

FortreeCity_House1_EventScript_157EB7:: @ 8157EB7
	msgbox FortreeCity_House1_Text_18582A, 2
	end

FortreeCity_House1_EventScript_157EC0:: @ 8157EC0
	lock
	faceplayer
	waitse
	playmoncry SPECIES_ZIGZAGOON, 0
	msgbox FortreeCity_House1_Text_185888, 4
	waitmoncry
	release
	end
