SootopolisCity_House2_MapScripts:: @ 815B2E4
	.byte 0

SootopolisCity_House2_EventScript_15B2E5:: @ 815B2E5
	lock
	faceplayer
	loadptr 0, SootopolisCity_House2_Text_18FA66
	callstd 5
	compare RESULT, 1
	callif 1, SootopolisCity_House2_EventScript_15B307
	compare RESULT, 0
	callif 1, SootopolisCity_House2_EventScript_15B310
	release
	end

SootopolisCity_House2_EventScript_15B307:: @ 815B307
	loadptr 0, SootopolisCity_House2_Text_18FAAE
	callstd 4
	return

SootopolisCity_House2_EventScript_15B310:: @ 815B310
	loadptr 0, SootopolisCity_House2_Text_18FB04
	callstd 4
	return

