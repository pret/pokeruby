SootopolisCity_House2_MapScripts:: @ 815B2E4
	.byte 0

SootopolisCity_House2_EventScript_15B2E5:: @ 815B2E5
	lock
	faceplayer
	msgbox SootopolisCity_House2_Text_18FA66, MSGBOX_YESNO
	compare VAR_RESULT, YES
	call_if_eq SootopolisCity_House2_EventScript_15B307
	compare VAR_RESULT, NO
	call_if_eq SootopolisCity_House2_EventScript_15B310
	release
	end

SootopolisCity_House2_EventScript_15B307:: @ 815B307
	msgbox SootopolisCity_House2_Text_18FAAE, MSGBOX_DEFAULT
	return

SootopolisCity_House2_EventScript_15B310:: @ 815B310
	msgbox SootopolisCity_House2_Text_18FB04, MSGBOX_DEFAULT
	return
