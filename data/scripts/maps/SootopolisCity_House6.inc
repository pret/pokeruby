SootopolisCity_House6_MapScripts:: @ 815B385
	.byte 0

SootopolisCity_House6_EventScript_15B386:: @ 815B386
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_WAILMER_DOLL, SootopolisCity_House6_EventScript_15B3CD
	msgbox SootopolisCity_House6_Text_18FEA1, MSGBOX_YESNO
	compare RESULT, NO
	call_if_eq SootopolisCity_House6_EventScript_15B3C3
	msgbox SootopolisCity_House6_Text_18FF12, 4
	givedecoration_std DECOR_WAILMER_DOLL
	compare RESULT, 0
	goto_if_eq SootopolisCity_House6_EventScript_15B3D7
	setflag FLAG_RECEIVED_WAILMER_DOLL
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
	bufferdecorationname 1, DECOR_WAILMER_DOLL
	msgbox SootopolisCity_House6_Text_1A0CEF, 4
	msgbox SootopolisCity_House6_Text_18FF28, 4
	release
	end
