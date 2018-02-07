RustboroCity_House1_MapScripts:: @ 8157C7C
	.byte 0

RustboroCity_House1_EventScript_157C7D:: @ 8157C7D
	lock
	faceplayer
	goto_if_set FLAG_RUSTBORO_NPC_TRADE_COMPLETED, RustboroCity_House1_EventScript_157D13
	setvar VAR_SPECIAL_8, 0
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_8
	specialvar RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_SPECIAL_9, RESULT
	msgbox RustboroCity_House1_Text_184EBA, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq RustboroCity_House1_EventScript_157CFB
	special SelectMonForNPCTrade
	waitstate
	copyvar VAR_SPECIAL_A, VAR_SPECIAL_4
	compare VAR_SPECIAL_4, 255
	goto_if_eq RustboroCity_House1_EventScript_157CFB
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_A
	specialvar RESULT, GetTradeSpecies
	copyvar VAR_SPECIAL_B, RESULT
	compare RESULT, VAR_SPECIAL_9
	goto_if_ne RustboroCity_House1_EventScript_157D05
	copyvar VAR_SPECIAL_4, VAR_SPECIAL_8
	copyvar VAR_SPECIAL_5, VAR_SPECIAL_A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	msgbox RustboroCity_House1_Text_184F6B, 4
	setflag FLAG_RUSTBORO_NPC_TRADE_COMPLETED
	release
	end

RustboroCity_House1_EventScript_157CFB:: @ 8157CFB
	msgbox RustboroCity_House1_Text_184FC1, 4
	release
	end

RustboroCity_House1_EventScript_157D05:: @ 8157D05
	bufferspeciesname 0, VAR_SPECIAL_9
	msgbox RustboroCity_House1_Text_184F8F, 4
	release
	end

RustboroCity_House1_EventScript_157D13:: @ 8157D13
	msgbox RustboroCity_House1_Text_184FDD, 4
	release
	end

RustboroCity_House1_EventScript_157D1D:: @ 8157D1D
	msgbox RustboroCity_House1_Text_185020, 2
	end
