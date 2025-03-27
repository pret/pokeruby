SootopolisCity_House2_MapScripts:: @ 815B2E4
	.byte 0

SootopolisCity_House2_EventScript_ExpertF:: @ 815B2E5
	lock
	faceplayer
	msgbox SootopolisCity_House2_Text_DidYouKnowAboutMtPyreOrbs, MSGBOX_YESNO
	compare VAR_RESULT, YES
	call_if_eq SootopolisCity_House2_EventScript_KnowAboutOrbs
	compare VAR_RESULT, NO
	call_if_eq SootopolisCity_House2_EventScript_DontKnowAboutOrbs
	release
	end

SootopolisCity_House2_EventScript_KnowAboutOrbs:: @ 815B307
	msgbox SootopolisCity_House2_Text_YesTwoOrbsSideBySide, MSGBOX_DEFAULT
	return

SootopolisCity_House2_EventScript_DontKnowAboutOrbs:: @ 815B310
	msgbox SootopolisCity_House2_Text_OughtToVisitAndSee, MSGBOX_DEFAULT
	return
