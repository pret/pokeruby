Route114_LanettesHouse_MapScripts:: @ 815C258
	map_script 3, Route114_LanettesHouse_MapScript1_15C25E
	.byte 0

Route114_LanettesHouse_MapScript1_15C25E:: @ 815C25E
	setflag 2117
	end

Route114_LanettesHouse_EventScript_15C262:: @ 815C262
	lock
	faceplayer
	checkflag 131
	jumpeq Route114_LanettesHouse_EventScript_15C28F
	setflag 2123
	msgbox Route114_LanettesHouse_Text_192A0D, 4
	givedecoration 100
	compare RESULT, 0
	jumpeq Route114_LanettesHouse_EventScript_1A02AE
	setflag 131
	release
	end

Route114_LanettesHouse_EventScript_15C28F:: @ 815C28F
	msgbox Route114_LanettesHouse_Text_192ACC, 4
	release
	end

Route114_LanettesHouse_EventScript_15C299:: @ 815C299
	lockall
	msgbox Route114_LanettesHouse_Text_192B4A, 5
	compare RESULT, 1
	jumpeq Route114_LanettesHouse_EventScript_15C2B7
	msgbox Route114_LanettesHouse_Text_192DA9, 4
	releaseall
	end

Route114_LanettesHouse_EventScript_15C2B7:: @ 815C2B7
	msgbox Route114_LanettesHouse_Text_192C01, 5
	compare RESULT, 1
	callif 1, Route114_LanettesHouse_EventScript_15C2CC
	releaseall
	end

Route114_LanettesHouse_EventScript_15C2CC:: @ 815C2CC
	msgbox Route114_LanettesHouse_Text_192CB4, 4
	return

Route114_LanettesHouse_EventScript_15C2D5:: @ 815C2D5
	msgbox Route114_LanettesHouse_Text_192DC1, 3
	end

