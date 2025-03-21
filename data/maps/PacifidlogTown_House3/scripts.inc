PacifidlogTown_House3_MapScripts:: @ 815429D
	.byte 0

PacifidlogTown_House3_EventScript_Trader:: @ 815429E
	lock
	faceplayer
	goto_if_set FLAG_PACIFIDLOG_NPC_TRADE_COMPLETED, PacifidlogTown_House3_EventScript_TradeCompleted
	setvar VAR_0x8008, 2
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	msgbox PacifidlogTown_House3_Text_WillingToTradeIt, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq PacifidlogTown_House3_EventScript_DeclineTrade
	special SelectMonForNPCTrade
	waitstate
	copyvar VAR_0x800A, VAR_0x8004
	compare VAR_0x8004, 255
	goto_if_eq PacifidlogTown_House3_EventScript_DeclineTrade
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne PacifidlogTown_House3_EventScript_NotRequestedMon
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	bufferspeciesname 0, VAR_0x8009
	msgbox PacifidlogTown_House3_Text_MonIsSoFluffy, MSGBOX_DEFAULT
	setflag FLAG_PACIFIDLOG_NPC_TRADE_COMPLETED
	release
	end

PacifidlogTown_House3_EventScript_DeclineTrade:: @ 8154320
	msgbox PacifidlogTown_House3_Text_ImDisappointed, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House3_EventScript_NotRequestedMon:: @ 815432A
	bufferspeciesname 0, VAR_0x8009
	msgbox PacifidlogTown_House3_Text_ThatsNoMon, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House3_EventScript_TradeCompleted:: @ 8154338
	msgbox PacifidlogTown_House3_Text_NowWereFriends, MSGBOX_DEFAULT
	release
	end

PacifidlogTown_House3_EventScript_Girl:: @ 8154342
	msgbox PacifidlogTown_House3_Text_IsThatAPokedex, MSGBOX_NPC
	end
