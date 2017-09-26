SlateportCity_House2_MapScripts:: @ 815638F
	.byte 0

SlateportCity_House2_EventScript_156390:: @ 8156390
	msgbox SlateportCity_House2_Text_1804CF, 2
	end

SlateportCity_House2_EventScript_156399:: @ 8156399
	lock
	faceplayer
	checkitem ITEM_CONTEST_PASS, 1
	compare RESULT, 1
	goto_if_eq SlateportCity_House2_EventScript_1563B5
	msgbox SlateportCity_House2_Text_180567, 4
	release
	end

SlateportCity_House2_EventScript_1563B5:: @ 81563B5
	msgbox SlateportCity_House2_Text_1805CD, 4
	release
	end
