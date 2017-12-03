PacifidlogTown_House3_MapScripts:: @ 815429D
	.byte 0

PacifidlogTown_House3_EventScript_15429E:: @ 815429E
	lock
	faceplayer
	checkflag FLAG_PACIFIDLOG_NPC_TRADE_COMPLETED
	goto_if_eq PacifidlogTown_House3_EventScript_154338
	setvar 0x8008, 2
	copyvar 0x8004, 0x8008
	specialvar RESULT, sub_804D89C
	copyvar 0x8009, RESULT
	msgbox PacifidlogTown_House3_Text_17940E, 5
	compare RESULT, 0
	goto_if_eq PacifidlogTown_House3_EventScript_154320
	special sub_80F9A0C
	waitstate
	copyvar 0x800a, 0x8004
	compare 0x8004, 255
	goto_if_eq PacifidlogTown_House3_EventScript_154320
	copyvar 0x8005, 0x800a
	specialvar RESULT, sub_804DB2C
	copyvar 0x800b, RESULT
	compare RESULT, 0x8009
	goto_if 5, PacifidlogTown_House3_EventScript_15432A
	copyvar 0x8004, 0x8008
	copyvar 0x8005, 0x800a
	special sub_804DB68
	special sub_804E174
	waitstate
	getspeciesname 0, 0x8009
	msgbox PacifidlogTown_House3_Text_1794C4, 4
	setflag FLAG_PACIFIDLOG_NPC_TRADE_COMPLETED
	release
	end

PacifidlogTown_House3_EventScript_154320:: @ 8154320
	msgbox PacifidlogTown_House3_Text_1794ED, 4
	release
	end

PacifidlogTown_House3_EventScript_15432A:: @ 815432A
	getspeciesname 0, 0x8009
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
