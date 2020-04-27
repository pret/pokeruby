LilycoveCity_LilycoveMuseum_2F_MapScripts:: @ 81585AC
	map_script MAP_SCRIPT_ON_LOAD, LilycoveCity_LilycoveMuseum_2F_MapScript1_1585B7
	map_script MAP_SCRIPT_ON_FRAME_TABLE, LilycoveCity_LilycoveMuseum_2F_MapScript2_158670
	.byte 0

LilycoveCity_LilycoveMuseum_2F_MapScript1_1585B7:: @ 81585B7
	goto_if_set FLAG_COOL_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_1585FD
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_1585C6
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1585C6:: @ 81585C6
	goto_if_set FLAG_BEAUTY_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_158615
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_1585D5
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1585D5:: @ 81585D5
	goto_if_set FLAG_CUTE_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_15862D
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_1585E4
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1585E4:: @ 81585E4
	goto_if_set FLAG_SMART_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_158645
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_1585F3
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1585F3:: @ 81585F3
	goto_if_set FLAG_TOUGH_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_15865D
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1585FD:: @ 81585FD
	setmetatile 10, 6, METATILE_LilycoveMuseum_Painting2_Left, 1
	setmetatile 11, 6, METATILE_LilycoveMuseum_Painting2_Right, 1
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_1585C6
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158615:: @ 8158615
	setmetatile 18, 6, METATILE_LilycoveMuseum_Painting1_Left, 1
	setmetatile 19, 6, METATILE_LilycoveMuseum_Painting1_Right, 1
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_1585D5
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15862D:: @ 815862D
	setmetatile 14, 10, METATILE_LilycoveMuseum_Painting3_Left, 1
	setmetatile 15, 10, METATILE_LilycoveMuseum_Painting3_Right, 1
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_1585E4
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158645:: @ 8158645
	setmetatile 6, 10, METATILE_LilycoveMuseum_Painting0_Left, 1
	setmetatile 7, 10, METATILE_LilycoveMuseum_Painting0_Right, 1
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_1585F3
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15865D:: @ 815865D
	setmetatile 2, 6, METATILE_LilycoveMuseum_Painting4_Left, 1
	setmetatile 3, 6, METATILE_LilycoveMuseum_Painting4_Right, 1
	end

LilycoveCity_LilycoveMuseum_2F_MapScript2_158670:: @ 8158670
	map_script_2 VAR_LILYCOVE_MUSEUM_2F_STATE, 0, LilycoveCity_LilycoveMuseum_2F_EventScript_15867A
	.2byte 0

LilycoveCity_LilycoveMuseum_2F_EventScript_15867A:: @ 815867A
	lockall
	applymovement 1, LilycoveCity_LilycoveMuseum_2F_Movement_1A0839
	applymovement 255, LilycoveCity_LilycoveMuseum_2F_Movement_1586D3
	waitmovement 0
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_187C42, MSGBOX_SIGN
	applymovement 1, LilycoveCity_LilycoveMuseum_2F_Movement_1586D5
	waitmovement 0
	applymovement 255, LilycoveCity_LilycoveMuseum_2F_Movement_1586D5
	waitmovement 0
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_187C64, MSGBOX_SIGN
	applymovement 1, LilycoveCity_LilycoveMuseum_2F_Movement_1A0839
	waitmovement 0
	applymovement 255, LilycoveCity_LilycoveMuseum_2F_Movement_1586D3
	waitmovement 0
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_187E1D, MSGBOX_SIGN
	copyvar VAR_LILYCOVE_MUSEUM_2F_STATE, 0x1
	releaseall
	end

LilycoveCity_LilycoveMuseum_2F_Movement_1586D3:: @ 81586D3
	walk_in_place_fastest_left
	step_end

LilycoveCity_LilycoveMuseum_2F_Movement_1586D5:: @ 81586D5
	face_up
	delay_16
	step_end

LilycoveCity_LilycoveMuseum_2F_EventScript_1586D8:: @ 81586D8
	lockall
	goto_if_set FLAG_RECEIVED_GLASS_ORNAMENT, LilycoveCity_LilycoveMuseum_2F_EventScript_158793
	specialvar VAR_0x8004, sub_80C4D50
	switch VAR_0x8004
	case 1, LilycoveCity_LilycoveMuseum_2F_EventScript_15872C
	case 2, LilycoveCity_LilycoveMuseum_2F_EventScript_15872C
	case 3, LilycoveCity_LilycoveMuseum_2F_EventScript_15872C
	case 4, LilycoveCity_LilycoveMuseum_2F_EventScript_15872C
	case 5, LilycoveCity_LilycoveMuseum_2F_EventScript_158735
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_187F4E, MSGBOX_NPC
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15872C:: @ 815872C
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_187F9D, MSGBOX_NPC
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158735:: @ 8158735
	applymovement 1, LilycoveCity_LilycoveMuseum_2F_Movement_1A0839
	waitmovement 0
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_18802F, MSGBOX_DEFAULT
	applymovement 1, LilycoveCity_LilycoveMuseum_2F_Movement_1586D5
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_188041, MSGBOX_DEFAULT
	goto LilycoveCity_LilycoveMuseum_2F_EventScript_15875C
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15875C:: @ 815875C
	applymovement 1, LilycoveCity_LilycoveMuseum_2F_Movement_1A0839
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_188120, MSGBOX_DEFAULT
	givedecoration DECOR_GLASS_ORNAMENT
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_LilycoveMuseum_2F_EventScript_158783
	setflag FLAG_RECEIVED_GLASS_ORNAMENT
	closemessage
	releaseall
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158783:: @ 8158783
	call LilycoveCity_LilycoveMuseum_2F_EventScript_1A02B8
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_188166, MSGBOX_DEFAULT
	closemessage
	releaseall
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158793:: @ 8158793
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_188194, MSGBOX_NPC
	releaseall
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15879D:: @ 815879D
	lockall
	goto_if_set FLAG_CUTE_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_15883C
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_188219, MSGBOX_SIGN
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1587B0:: @ 81587B0
	lockall
	goto_if_set FLAG_TOUGH_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_158858
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_18824C, MSGBOX_SIGN
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1587C3:: @ 81587C3
	lockall
	goto_if_set FLAG_COOL_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_158820
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_1882B4, MSGBOX_SIGN
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1587D6:: @ 81587D6
	lockall
	goto_if_set FLAG_BEAUTY_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_15882E
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_188281, MSGBOX_SIGN
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_1587E9:: @ 81587E9
	lockall
	goto_if_set FLAG_SMART_PAINTING_MADE, LilycoveCity_LilycoveMuseum_2F_EventScript_15884A
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_1882E6, MSGBOX_SIGN
	end

@ 81587FC
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_18831A, MSGBOX_SIGN
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158805:: @ 8158805
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_188336, MSGBOX_NPC
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15880E:: @ 815880E
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_1883AB, MSGBOX_NPC
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158817:: @ 8158817
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_188423, MSGBOX_NPC
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158820:: @ 8158820
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_18831A, MSGBOX_SIGN
	fadescreen 1
	showcontestwinner 9
	releaseall
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15882E:: @ 815882E
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_18831A, MSGBOX_SIGN
	fadescreen 1
	showcontestwinner 10
	releaseall
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15883C:: @ 815883C
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_18831A, MSGBOX_SIGN
	fadescreen 1
	showcontestwinner 11
	releaseall
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_15884A:: @ 815884A
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_18831A, MSGBOX_SIGN
	fadescreen 1
	showcontestwinner 12
	releaseall
	end

LilycoveCity_LilycoveMuseum_2F_EventScript_158858:: @ 8158858
	msgbox LilycoveCity_LilycoveMuseum_2F_Text_18831A, MSGBOX_SIGN
	fadescreen 1
	showcontestwinner 13
	releaseall
	end
