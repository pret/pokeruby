RustboroCity_House1_MapScripts:: @ 8157C7C
	.byte 0

RustboroCity_House1_EventScript_157C7D:: @ 8157C7D
	lock
	faceplayer
	checkflag FLAG_RUSTBORO_NPC_TRADE_COMPLETED
	goto_if_eq RustboroCity_House1_EventScript_157D13
	setvar 0x8008, 0
	copyvar 0x8004, 0x8008
	specialvar RESULT, sub_804D89C
	copyvar 0x8009, RESULT
	msgbox RustboroCity_House1_Text_184EBA, 5
	compare RESULT, 0
	goto_if_eq RustboroCity_House1_EventScript_157CFB
	special sub_80F9A0C
	waitstate
	copyvar 0x800a, 0x8004
	compare 0x8004, 255
	goto_if_eq RustboroCity_House1_EventScript_157CFB
	copyvar 0x8005, 0x800a
	specialvar RESULT, sub_804DB2C
	copyvar 0x800b, RESULT
	compare RESULT, 0x8009
	goto_if 5, RustboroCity_House1_EventScript_157D05
	copyvar 0x8004, 0x8008
	copyvar 0x8005, 0x800a
	special sub_804DB68
	special sub_804E174
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
	getspeciesname 0, 0x8009
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
