RustboroCity_House1_MapScripts:: @ 8157C7C
	.byte 0

RustboroCity_House1_EventScript_157C7D:: @ 8157C7D
	lock
	faceplayer
	checkflag 153
	jumpeq RustboroCity_House1_EventScript_157D13
	setvar 0x8008, 0
	copyvar 0x8004, 0x8008
	specialval RESULT, 252
	copyvar 0x8009, RESULT
	loadptr 0, RustboroCity_House1_Text_184EBA
	callstd 5
	compare RESULT, 0
	jumpeq RustboroCity_House1_EventScript_157CFB
	special 159
	waitstate
	copyvar 0x800a, 0x8004
	compare 0x8004, 255
	jumpeq RustboroCity_House1_EventScript_157CFB
	copyvar 0x8005, 0x800a
	specialval RESULT, 255
	copyvar 0x800b, RESULT
	comparevars RESULT, 0x8009
	jumpif 5, RustboroCity_House1_EventScript_157D05
	copyvar 0x8004, 0x8008
	copyvar 0x8005, 0x800a
	special 253
	special 254
	waitstate
	loadptr 0, RustboroCity_House1_Text_184F6B
	callstd 4
	setflag 153
	release
	end

RustboroCity_House1_EventScript_157CFB:: @ 8157CFB
	loadptr 0, RustboroCity_House1_Text_184FC1
	callstd 4
	release
	end

RustboroCity_House1_EventScript_157D05:: @ 8157D05
	bufferpoke 0, 32777
	loadptr 0, RustboroCity_House1_Text_184F8F
	callstd 4
	release
	end

RustboroCity_House1_EventScript_157D13:: @ 8157D13
	loadptr 0, RustboroCity_House1_Text_184FDD
	callstd 4
	release
	end

RustboroCity_House1_EventScript_157D1D:: @ 8157D1D
	loadptr 0, RustboroCity_House1_Text_185020
	callstd 2
	end

