FortreeCity_House1_MapScripts:: @ 8157E12
	.byte 0

FortreeCity_House1_EventScript_Trader:: @ 8157E13
	lock
	faceplayer
	goto_if_set FLAG_FORTREE_NPC_TRADE_COMPLETED, FortreeCity_House1_EventScript_TradeCompleted
	setvar VAR_0x8008, 1
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	msgbox FortreeCity_House1_Text_WouldYouTradeIt, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq FortreeCity_House1_EventScript_DeclineTrade
	special SelectMonForNPCTrade
	waitstate
	copyvar VAR_0x800A, VAR_0x8004
	compare VAR_0x8004, 255
	goto_if_eq FortreeCity_House1_EventScript_DeclineTrade
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne FortreeCity_House1_EventScript_NotRequestedMon
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	bufferspeciesname 0, VAR_0x8009
	msgbox FortreeCity_House1_Text_PleaseBeNiceToMon, MSGBOX_DEFAULT
	setflag FLAG_FORTREE_NPC_TRADE_COMPLETED
	release
	end

FortreeCity_House1_EventScript_DeclineTrade:: @ 8157E95
	msgbox FortreeCity_House1_Text_ChangeYourMindSeeMe, MSGBOX_DEFAULT
	release
	end

FortreeCity_House1_EventScript_NotRequestedMon:: @ 8157E9F
	bufferspeciesname 0, VAR_0x8009
	msgbox FortreeCity_House1_Text_ThatMonIsntAMon, MSGBOX_DEFAULT
	release
	end

FortreeCity_House1_EventScript_TradeCompleted:: @ 8157EAD
	msgbox FortreeCity_House1_Text_PromiseToTakeGoodCareOfMon, MSGBOX_DEFAULT
	release
	end

FortreeCity_House1_EventScript_ExpertF:: @ 8157EB7
	msgbox FortreeCity_House1_Text_TradingMemoriesWithOthers, MSGBOX_NPC
	end

FortreeCity_House1_EventScript_Zigzagoon:: @ 8157EC0
	lock
	faceplayer
	waitse
	playmoncry SPECIES_ZIGZAGOON, 0
	msgbox FortreeCity_House1_Text_Zigzagoon, MSGBOX_DEFAULT
	waitmoncry
	release
	end
