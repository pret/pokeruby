Route111_OldLadysRestStop_MapScripts:: @ 815BFD1
	map_script 3, Route111_OldLadysRestStop_MapScript1_15BFD7
	.byte 0

Route111_OldLadysRestStop_MapScript1_15BFD7:: @ 815BFD7
	setflag 2113
	end

Route111_OldLadysRestStop_EventScript_15BFDB:: @ 815BFDB
	lock
	faceplayer
	loadptr 0, Route111_OldLadysRestStop_Text_1923AF
	callstd 5
	compare RESULT, 1
	jumpeq Route111_OldLadysRestStop_EventScript_15BFFC
	compare RESULT, 0
	jumpeq Route111_OldLadysRestStop_EventScript_15C029
	end

Route111_OldLadysRestStop_EventScript_15BFFC:: @ 815BFFC
	loadptr 0, Route111_OldLadysRestStop_Text_192423
	callstd 4
	closebutton
	call Route111_OldLadysRestStop_EventScript_1A02CA
	loadptr 0, Route111_OldLadysRestStop_Text_19244D
	callstd 5
	compare RESULT, 1
	jumpeq Route111_OldLadysRestStop_EventScript_15BFFC
	compare RESULT, 0
	jumpeq Route111_OldLadysRestStop_EventScript_15C029
	end

Route111_OldLadysRestStop_EventScript_15C029:: @ 815C029
	loadptr 0, Route111_OldLadysRestStop_Text_1924C6
	callstd 4
	release
	end

