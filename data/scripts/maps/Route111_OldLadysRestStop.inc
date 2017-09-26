Route111_OldLadysRestStop_MapScripts:: @ 815BFD1
	map_script 3, Route111_OldLadysRestStop_MapScript1_15BFD7
	.byte 0

Route111_OldLadysRestStop_MapScript1_15BFD7:: @ 815BFD7
	setflag 2113
	end

Route111_OldLadysRestStop_EventScript_15BFDB:: @ 815BFDB
	lock
	faceplayer
	msgbox Route111_OldLadysRestStop_Text_1923AF, 5
	compare RESULT, 1
	goto_if_eq Route111_OldLadysRestStop_EventScript_15BFFC
	compare RESULT, 0
	goto_if_eq Route111_OldLadysRestStop_EventScript_15C029
	end

Route111_OldLadysRestStop_EventScript_15BFFC:: @ 815BFFC
	msgbox Route111_OldLadysRestStop_Text_192423, 4
	closebutton
	call Route111_OldLadysRestStop_EventScript_1A02CA
	msgbox Route111_OldLadysRestStop_Text_19244D, 5
	compare RESULT, 1
	goto_if_eq Route111_OldLadysRestStop_EventScript_15BFFC
	compare RESULT, 0
	goto_if_eq Route111_OldLadysRestStop_EventScript_15C029
	end

Route111_OldLadysRestStop_EventScript_15C029:: @ 815C029
	msgbox Route111_OldLadysRestStop_Text_1924C6, 4
	release
	end
