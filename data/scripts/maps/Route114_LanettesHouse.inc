Route114_LanettesHouse_MapScripts:: @ 815C258
	map_script 3, Route114_LanettesHouse_MapScript1_15C25E
	.byte 0

Route114_LanettesHouse_MapScript1_15C25E:: @ 815C25E
	setflag FLAG_LANDMARK_LANETTES_HOUSE
	end

Route114_LanettesHouse_EventScript_15C262:: @ 815C262
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_DOLL_LANETTE, Route114_LanettesHouse_EventScript_15C28F
	setflag FLAG_SYS_PC_LANETTE
	msgbox Route114_LanettesHouse_Text_192A0D, 4
	.ifdef SAPPHIRE
	givedecoration_std DECOR_LOTAD_DOLL
	.else
	givedecoration_std DECOR_SEEDOT_DOLL
	.endif
	compare RESULT, 0
	goto_if_eq Route114_LanettesHouse_EventScript_1A02AE
	setflag FLAG_RECEIVED_DOLL_LANETTE
	release
	end

Route114_LanettesHouse_EventScript_15C28F:: @ 815C28F
	msgbox Route114_LanettesHouse_Text_192ACC, 4
	release
	end

Route114_LanettesHouse_EventScript_15C299:: @ 815C299
	lockall
	msgbox Route114_LanettesHouse_Text_192B4A, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq Route114_LanettesHouse_EventScript_15C2B7
	msgbox Route114_LanettesHouse_Text_192DA9, 4
	releaseall
	end

Route114_LanettesHouse_EventScript_15C2B7:: @ 815C2B7
	msgbox Route114_LanettesHouse_Text_192C01, MSGBOX_YESNO
	compare RESULT, YES
	call_if_eq Route114_LanettesHouse_EventScript_15C2CC
	releaseall
	end

Route114_LanettesHouse_EventScript_15C2CC:: @ 815C2CC
	msgbox Route114_LanettesHouse_Text_192CB4, 4
	return

Route114_LanettesHouse_EventScript_15C2D5:: @ 815C2D5
	msgbox Route114_LanettesHouse_Text_192DC1, 3
	end
