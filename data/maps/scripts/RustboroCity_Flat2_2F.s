RustboroCity_Flat2_2F_MapScripts:: @ 8157D96
	.byte 0

RustboroCity_Flat2_2F_EventScript_157D97:: @ 8157D97
	loadptr 0, RustboroCity_Flat2_2F_Text_185421
	callstd 2
	end

RustboroCity_Flat2_2F_EventScript_157DA0:: @ 8157DA0
	lock
	faceplayer
	checkflag 213
	jumpeq RustboroCity_Flat2_2F_EventScript_157DCF
	loadptr 0, RustboroCity_Flat2_2F_Text_185461
	callstd 4
	setorcopyvar 0x8000, 0xc
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq RustboroCity_Flat2_2F_EventScript_1A029B
	setflag 213
	release
	end

RustboroCity_Flat2_2F_EventScript_157DCF:: @ 8157DCF
	loadptr 0, RustboroCity_Flat2_2F_Text_1854C4
	callstd 4
	release
	end

