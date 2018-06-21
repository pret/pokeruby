SootopolisCity_House3_MapScripts:: @ 815B319
	.byte 0

SootopolisCity_House3_EventScript_15B31A:: @ 815B31A
	lock
	faceplayer
	msgbox SootopolisCity_House3_Text_18FB36, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq SootopolisCity_House3_EventScript_15B339
	msgbox SootopolisCity_House3_Text_18FBC0, 4
	release
	end

SootopolisCity_House3_EventScript_15B339:: @ 815B339
	msgbox SootopolisCity_House3_Text_18FB9C, 4
	release
	end

SootopolisCity_House3_EventScript_15B343:: @ 815B343
	msgbox SootopolisCity_House3_Text_18FC1A, 2
	end
