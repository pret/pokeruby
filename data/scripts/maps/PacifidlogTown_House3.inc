PacifidlogTown_House3_MapScripts:: @ 815429D
	.byte 0

PacifidlogTown_House3_EventScript_15429E:: @ 815429E
	lock
	faceplayer
	goto_if_set FLAG_PACIFIDLOG_NPC_TRADE_COMPLETED, PacifidlogTown_House3_EventScript_154338
	setvar VAR_SPECIAL_8, 2
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_8
	specialvar RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_SPECIAL_9, RESULT
	msgbox PacifidlogTown_House3_Text_17940E, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq PacifidlogTown_House3_EventScript_154320
	special SelectMonForNPCTrade
	waitstate
	copyvar VAR_SPECIAL_A, VAR_SPECIAL_4
	compare VAR_SPECIAL_4, 255
	goto_if_eq PacifidlogTown_House3_EventScript_154320
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_A
	specialvar RESULT, GetTradeSpecies
	copyvar VAR_SPECIAL_B, RESULT
	compare RESULT, VAR_SPECIAL_9
	goto_if_ne PacifidlogTown_House3_EventScript_15432A
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_8
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	bufferspeciesname 0, VAR_SPECIAL_9
	msgbox PacifidlogTown_House3_Text_1794C4, 4
	setflag FLAG_PACIFIDLOG_NPC_TRADE_COMPLETED
	release
	end

PacifidlogTown_House3_EventScript_154320:: @ 8154320
	msgbox PacifidlogTown_House3_Text_1794ED, 4
	release
	end

PacifidlogTown_House3_EventScript_15432A:: @ 815432A
	bufferspeciesname 0, VAR_SPECIAL_9
	msgbox PacifidlogTown_House3_Text_1794DF, 4
	release
	end

PacifidlogTown_House3_EventScript_154338:: @ 8154338
	msgbox PacifidlogTown_House3_Text_17950A, 4
	release
	end

PacifidlogTown_House3_EventScript_154342:: @ 8154342
	msgbox PacifidlogTown_House3_Text_179541, 2
	end
