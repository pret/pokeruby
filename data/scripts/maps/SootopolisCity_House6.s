SootopolisCity_House6_MapScripts:: @ 815B385
	.byte 0

SootopolisCity_House6_EventScript_15B386:: @ 815B386
	lock
	faceplayer
	checkflag 245
	jumpif EQUAL, SootopolisCity_House6_EventScript_15B3CD
	msgbox SootopolisCity_House6_Text_18FEA1, 5
	compare RESULT, 0
	callif 1, SootopolisCity_House6_EventScript_15B3C3
	msgbox SootopolisCity_House6_Text_18FF12, 4
	givedecoration 117
	compare RESULT, 0
	jumpif EQUAL, SootopolisCity_House6_EventScript_15B3D7
	setflag 245
	release
	end

SootopolisCity_House6_EventScript_15B3C3:: @ 815B3C3
	msgbox SootopolisCity_House6_Text_18FF6D, 4
	release
	end

SootopolisCity_House6_EventScript_15B3CD:: @ 815B3CD
	msgbox SootopolisCity_House6_Text_18FF95, 4
	release
	end

SootopolisCity_House6_EventScript_15B3D7:: @ 815B3D7
	bufferdecor 1, 117
	msgbox SootopolisCity_House6_Text_1A0CEF, 4
	msgbox SootopolisCity_House6_Text_18FF28, 4
	release
	end
