MtPyre_1F_MapScripts:: @ 815D322
	.byte 0

MtPyre_1F_EventScript_15D323:: @ 815D323
	lock
	faceplayer
	checkflag 282
	jumpeq MtPyre_1F_EventScript_15D352
	loadptr 0, MtPyre_1F_Text_196151
	callstd 4
	setorcopyvar 0x8000, 0xbe
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq MtPyre_1F_EventScript_1A029B
	setflag 282
	release
	end

MtPyre_1F_EventScript_15D352:: @ 815D352
	loadptr 0, MtPyre_1F_Text_1961CE
	callstd 4
	release
	end

MtPyre_1F_EventScript_15D35C:: @ 815D35C
	loadptr 0, MtPyre_1F_Text_196218
	callstd 2
	end

MtPyre_1F_EventScript_15D365:: @ 815D365
	loadptr 0, MtPyre_1F_Text_196283
	callstd 2
	end

