RustboroCity_House1_MapScripts:: @ 8157C7C
	.byte 0

RustboroCity_House1_EventScript_Trader:: @ 8157C7D
	lock
	faceplayer
	goto_if_set FLAG_RUSTBORO_NPC_TRADE_COMPLETED, RustboroCity_House1_EventScript_TradeCompleted
	setvar VAR_0x8008, 0
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	msgbox RustboroCity_House1_Text_IllTradeIfYouWant, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq RustboroCity_House1_EventScript_DeclineTrade
	special SelectMonForNPCTrade
	waitstate
	copyvar VAR_0x800A, VAR_0x8004
	compare VAR_0x8004, 255
	goto_if_eq RustboroCity_House1_EventScript_DeclineTrade
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne RustboroCity_House1_EventScript_NotRequestedMon
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	msgbox RustboroCity_House1_Text_PleaseBeGoodToMyPokemon, MSGBOX_DEFAULT
	setflag FLAG_RUSTBORO_NPC_TRADE_COMPLETED
	release
	end

RustboroCity_House1_EventScript_DeclineTrade:: @ 8157CFB
	msgbox RustboroCity_House1_Text_AwwItsAGoodMon, MSGBOX_DEFAULT
	release
	end

RustboroCity_House1_EventScript_NotRequestedMon:: @ 8157D05
	bufferspeciesname 0, VAR_0x8009
	msgbox RustboroCity_House1_Text_ThatIsNoMon, MSGBOX_DEFAULT
	release
	end

RustboroCity_House1_EventScript_TradeCompleted:: @ 8157D13
	msgbox RustboroCity_House1_Text_WontYouGetCurious, MSGBOX_DEFAULT
	release
	end

RustboroCity_House1_EventScript_Hiker:: @ 8157D1D
	msgbox RustboroCity_House1_Text_AllSortsOfPlaces, MSGBOX_NPC
	end
