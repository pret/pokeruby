SootopolisCity_House6_MapScripts:: @ 815B385
	.byte 0

SootopolisCity_House6_EventScript_15B386:: @ 815B386
	lock
	faceplayer
	checkflag 245
	jumpeq SootopolisCity_House6_EventScript_15B3CD
	loadptr 0, SootopolisCity_House6_Text_18FEA1
	callstd 5
	compare RESULT, 0
	callif 1, SootopolisCity_House6_EventScript_15B3C3
	loadptr 0, SootopolisCity_House6_Text_18FF12
	callstd 4
	setorcopyvar 0x8000, 0x75
	callstd 7
	compare RESULT, 0
	jumpeq SootopolisCity_House6_EventScript_15B3D7
	setflag 245
	release
	end

SootopolisCity_House6_EventScript_15B3C3:: @ 815B3C3
	loadptr 0, SootopolisCity_House6_Text_18FF6D
	callstd 4
	release
	end

SootopolisCity_House6_EventScript_15B3CD:: @ 815B3CD
	loadptr 0, SootopolisCity_House6_Text_18FF95
	callstd 4
	release
	end

SootopolisCity_House6_EventScript_15B3D7:: @ 815B3D7
	bufferdecor 1, 117
	loadptr 0, SootopolisCity_House6_Text_1A0CEF
	callstd 4
	loadptr 0, SootopolisCity_House6_Text_18FF28
	callstd 4
	release
	end

