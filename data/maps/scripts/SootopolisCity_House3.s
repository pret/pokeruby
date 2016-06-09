SootopolisCity_House3_MapScripts:: @ 815B319
	.byte 0

SootopolisCity_House3_EventScript_15B31A:: @ 815B31A
	lock
	faceplayer
	loadptr 0, SootopolisCity_House3_Text_18FB36
	callstd 5
	compare RESULT, 1
	jumpeq SootopolisCity_House3_EventScript_15B339
	loadptr 0, SootopolisCity_House3_Text_18FBC0
	callstd 4
	release
	end

SootopolisCity_House3_EventScript_15B339:: @ 815B339
	loadptr 0, SootopolisCity_House3_Text_18FB9C
	callstd 4
	release
	end

SootopolisCity_House3_EventScript_15B343:: @ 815B343
	loadptr 0, SootopolisCity_House3_Text_18FC1A
	callstd 2
	end

