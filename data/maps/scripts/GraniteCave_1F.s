GraniteCave_1F_MapScripts:: @ 815CBA6
	.byte 0

GraniteCave_1F_EventScript_15CBA7:: @ 815CBA7
	lock
	faceplayer
	checkflag 109
	jumpeq GraniteCave_1F_EventScript_15CBD3
	loadptr 0, GraniteCave_1F_Text_194917
	callstd 4
	setorcopyvar 0x8000, 0x157
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 109
	loadptr 0, GraniteCave_1F_Text_194A3E
	callstd 4
	release
	end

GraniteCave_1F_EventScript_15CBD3:: @ 815CBD3
	loadptr 0, GraniteCave_1F_Text_194A3E
	callstd 4
	release
	end

