RustboroCity_House1_MapScripts:: @ 8157C7C
	.byte 0

RustboroCity_House1_EventScript_157C7D:: @ 8157C7D
	lock
	faceplayer
	checkflag 153
	jumpif FLAG_IS_SET, RustboroCity_House1_EventScript_157D13
	setvar 0x8008, 0
	copyvar 0x8004, 0x8008
	specialval RESULT, 252
	copyvar 0x8009, RESULT
	msgbox RustboroCity_House1_Text_184EBA, 5
	compare RESULT, 0
	jumpif EQUAL, RustboroCity_House1_EventScript_157CFB
	special 159
	waitstate
	copyvar 0x800a, 0x8004
	compare 0x8004, 255
	jumpif EQUAL, RustboroCity_House1_EventScript_157CFB
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
	msgbox RustboroCity_House1_Text_184F6B, 4
	setflag 153
	release
	end

RustboroCity_House1_EventScript_157CFB:: @ 8157CFB
	msgbox RustboroCity_House1_Text_184FC1, 4
	release
	end

RustboroCity_House1_EventScript_157D05:: @ 8157D05
	bufferpoke 0, 0x8009
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
