PacifidlogTown_House3_MapScripts:: @ 815429D
	.byte 0

PacifidlogTown_House3_EventScript_15429E:: @ 815429E
	lock
	faceplayer
	checkflag 154
	jumpeq PacifidlogTown_House3_EventScript_154338
	setvar 0x8008, 2
	copyvar 0x8004, 0x8008
	specialval RESULT, 252
	copyvar 0x8009, RESULT
	msgbox PacifidlogTown_House3_Text_17940E, 5
	compare RESULT, 0
	jumpeq PacifidlogTown_House3_EventScript_154320
	special 159
	waitstate
	copyvar 0x800a, 0x8004
	compare 0x8004, 255
	jumpeq PacifidlogTown_House3_EventScript_154320
	copyvar 0x8005, 0x800a
	specialval RESULT, 255
	copyvar 0x800b, RESULT
	comparevars RESULT, 0x8009
	jumpif 5, PacifidlogTown_House3_EventScript_15432A
	copyvar 0x8004, 0x8008
	copyvar 0x8005, 0x800a
	special 253
	special 254
	waitstate
	bufferpoke 0, 0x8009
	msgbox PacifidlogTown_House3_Text_1794C4, 4
	setflag 154
	release
	end

PacifidlogTown_House3_EventScript_154320:: @ 8154320
	msgbox PacifidlogTown_House3_Text_1794ED, 4
	release
	end

PacifidlogTown_House3_EventScript_15432A:: @ 815432A
	bufferpoke 0, 0x8009
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
