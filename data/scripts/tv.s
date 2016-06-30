Event_TV:: @ 81A6E72
	lockall
	inccounter 44
	special 75
	specialval RESULT, 73
	compare RESULT, 2
	jumpeq EventScript_1A6F01
	compare RESULT, 1
	jumpeq EventScript_1A6F0B
	checkflag 2098
	jumpif 0, EventScript_1A6EF1
	checkflag 2097
	jumpeq EventScript_1A6EF1
	specialval RESULT, 176
	compare RESULT, 1
	jumpeq EventScript_1A6F66
	jump EventScript_1A6F50
	end

EventScript_1A6EBB:
	specialval 0x8004, 65
	compare 0x8004, 255
	jumpeq EventScript_1A6F3F
	specialval RESULT, 71
	compare RESULT, 255
	jumpeq EventScript_1A6F3F
	copyvar 0x8004, RESULT
	specialval RESULT, 66
	compare RESULT, 0
	jumpif 5, EventScript_1A6F21
	end

EventScript_1A6EF1:
	special 74
	msgbox UnknownString_81A0E68, 4
	special 62
	releaseall
	end

EventScript_1A6F01:
	msgbox UnknownString_817288C, 4
	releaseall
	end

EventScript_1A6F0B:
	msgbox UnknownString_8172C50, 4
	special 297
	clearflag 2141
	setflag 255
	special 62
	releaseall
	end

EventScript_1A6F21:
	special 63
	waittext
	waitbutton
	compare RESULT, 1
	jumpif 5, EventScript_1A6F21
	jump EventScript_1A6F37
	end

EventScript_1A6F37:
	special 62
	setflag 2097
	releaseall
	end

EventScript_1A6F3F:
	special 74
	msgbox UnknownString_81A0E68, 4
	jump EventScript_1A6F37
	end

EventScript_1A6F50:
	special 64
	compare RESULT, 0
	jumpeq EventScript_1A6EBB
	waittext
	waitbutton
	jump EventScript_1A6F37
	end

EventScript_1A6F66:
	special 175
	waittext
	waitbutton
	compare RESULT, 0
	jumpeq EventScript_1A6F66
	jump EventScript_1A6F37
	end
