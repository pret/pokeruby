RustboroCity_House1_MapScripts:: @ 8157C7C
	.byte 0

RustboroCity_House1_EventScript_157C7D:: @ 8157C7D
	lock
	faceplayer
	goto_if_set FLAG_RUSTBORO_NPC_TRADE_COMPLETED, RustboroCity_House1_EventScript_157D13
	setvar VAR_0x8008, 0
	copyvar VAR_0x8004, VAR_0x8008
	specialvar VAR_RESULT, GetInGameTradeSpeciesInfo
	copyvar VAR_0x8009, VAR_RESULT
	msgbox RustboroCity_House1_Text_184EBA, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq RustboroCity_House1_EventScript_157CFB
	special SelectMonForNPCTrade
	waitstate
	copyvar VAR_0x800A, VAR_0x8004
	compare VAR_0x8004, 255
	goto_if_eq RustboroCity_House1_EventScript_157CFB
	copyvar VAR_0x8005, VAR_0x800A
	specialvar VAR_RESULT, GetTradeSpecies
	copyvar VAR_0x800B, VAR_RESULT
	compare VAR_RESULT, VAR_0x8009
	goto_if_ne RustboroCity_House1_EventScript_157D05
	copyvar VAR_0x8004, VAR_0x8008
	copyvar VAR_0x8005, VAR_0x800A
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	msgbox RustboroCity_House1_Text_184F6B, MSGBOX_DEFAULT
	setflag FLAG_RUSTBORO_NPC_TRADE_COMPLETED
	release
	end

RustboroCity_House1_EventScript_157CFB:: @ 8157CFB
	msgbox RustboroCity_House1_Text_184FC1, MSGBOX_DEFAULT
	release
	end

RustboroCity_House1_EventScript_157D05:: @ 8157D05
	bufferspeciesname 0, VAR_0x8009
	msgbox RustboroCity_House1_Text_184F8F, MSGBOX_DEFAULT
	release
	end

RustboroCity_House1_EventScript_157D13:: @ 8157D13
	msgbox RustboroCity_House1_Text_184FDD, MSGBOX_DEFAULT
	release
	end

RustboroCity_House1_EventScript_157D1D:: @ 8157D1D
	msgbox RustboroCity_House1_Text_185020, MSGBOX_NPC
	end
