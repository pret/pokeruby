Route113_GlassWorkshop_MapScripts:: @ 816354A
	map_script 3, Route113_GlassWorkshop_MapScript1_163550
	.byte 0

Route113_GlassWorkshop_MapScript1_163550:: @ 8163550
	setflag FLAG_LANDMARK_GLASS_WORKSHOP
	compare VAR_GLASS_WORKSHOP_STATE, 1
	call_if_eq Route113_GlassWorkshop_EventScript_16355F
	end

Route113_GlassWorkshop_EventScript_16355F:: @ 816355F
	setvar VAR_GLASS_WORKSHOP_STATE, 2
	return

Route113_GlassWorkshop_EventScript_163565:: @ 8163565
	lock
	faceplayer
	compare VAR_GLASS_WORKSHOP_STATE, 10
	goto_if_ge Route113_GlassWorkshop_EventScript_1638D2
	compare VAR_GLASS_WORKSHOP_STATE, 2
	goto_if_eq Route113_GlassWorkshop_EventScript_1635B5
	compare VAR_GLASS_WORKSHOP_STATE, 1
	goto_if_eq Route113_GlassWorkshop_EventScript_1635AB
	msgbox Route113_GlassWorkshop_Text_19E4E6, 4
	giveitem_std ITEM_SOOT_SACK
	setvar VAR_GLASS_WORKSHOP_STATE, 1
	msgbox Route113_GlassWorkshop_Text_19E59B, 4
	release
	end

Route113_GlassWorkshop_EventScript_1635AB:: @ 81635AB
	msgbox Route113_GlassWorkshop_Text_19E59B, 4
	release
	end

Route113_GlassWorkshop_EventScript_1635B5:: @ 81635B5
	checkitem ITEM_SOOT_SACK, 1
	compare RESULT, 0
	goto_if_eq Route113_GlassWorkshop_EventScript_1635E4
	msgbox Route113_GlassWorkshop_Text_19E65B, 4
	compare VAR_ASH_GATHER_COUNT, 250
	goto_if_lt Route113_GlassWorkshop_EventScript_163818
	message Route113_GlassWorkshop_Text_19E757
	waitmessage
	goto Route113_GlassWorkshop_EventScript_1635EE
	end

Route113_GlassWorkshop_EventScript_1635E4:: @ 81635E4
	msgbox Route113_GlassWorkshop_Text_19EAC1, 4
	release
	end

Route113_GlassWorkshop_EventScript_1635EE:: @ 81635EE
	setvar VAR_SPECIAL_9, 0
	special ShowGlassWorkshopMenu
	waitstate
	switch RESULT
	case 0, Route113_GlassWorkshop_EventScript_163660
	case 1, Route113_GlassWorkshop_EventScript_16369C
	case 2, Route113_GlassWorkshop_EventScript_1636D8
	case 3, Route113_GlassWorkshop_EventScript_163714
	case 4, Route113_GlassWorkshop_EventScript_163750
	case 5, Route113_GlassWorkshop_EventScript_16378C
	case 6, Route113_GlassWorkshop_EventScript_1637CD
	case 7, Route113_GlassWorkshop_EventScript_16380E
	case 127, Route113_GlassWorkshop_EventScript_16380E
	end

Route113_GlassWorkshop_EventScript_163660:: @ 8163660
	setvar VAR_SPECIAL_8, ITEM_BLUE_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	setvar VAR_SPECIAL_A, 250
	compare VAR_ASH_GATHER_COUNT, 250
	goto_if_lt Route113_GlassWorkshop_EventScript_163830
	msgbox Route113_GlassWorkshop_Text_19E7CD, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route113_GlassWorkshop_EventScript_163845
	setvar VAR_GLASS_WORKSHOP_STATE, 10
	subvar VAR_ASH_GATHER_COUNT, 250
	goto Route113_GlassWorkshop_EventScript_163851
	end

Route113_GlassWorkshop_EventScript_16369C:: @ 816369C
	setvar VAR_SPECIAL_8, ITEM_YELLOW_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	setvar VAR_SPECIAL_A, 500
	compare VAR_ASH_GATHER_COUNT, 500
	goto_if_lt Route113_GlassWorkshop_EventScript_163830
	msgbox Route113_GlassWorkshop_Text_19E7CD, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route113_GlassWorkshop_EventScript_163845
	setvar VAR_GLASS_WORKSHOP_STATE, 11
	subvar VAR_ASH_GATHER_COUNT, 500
	goto Route113_GlassWorkshop_EventScript_163851
	end

Route113_GlassWorkshop_EventScript_1636D8:: @ 81636D8
	setvar VAR_SPECIAL_8, ITEM_RED_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	setvar VAR_SPECIAL_A, 500
	compare VAR_ASH_GATHER_COUNT, 500
	goto_if_lt Route113_GlassWorkshop_EventScript_163830
	msgbox Route113_GlassWorkshop_Text_19E7CD, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route113_GlassWorkshop_EventScript_163845
	setvar VAR_GLASS_WORKSHOP_STATE, 12
	subvar VAR_ASH_GATHER_COUNT, 500
	goto Route113_GlassWorkshop_EventScript_163851
	end

Route113_GlassWorkshop_EventScript_163714:: @ 8163714
	setvar VAR_SPECIAL_8, ITEM_WHITE_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	setvar VAR_SPECIAL_A, 1000
	compare VAR_ASH_GATHER_COUNT, 1000
	goto_if_lt Route113_GlassWorkshop_EventScript_163830
	msgbox Route113_GlassWorkshop_Text_19E7CD, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route113_GlassWorkshop_EventScript_163845
	setvar VAR_GLASS_WORKSHOP_STATE, 13
	subvar VAR_ASH_GATHER_COUNT, 1000
	goto Route113_GlassWorkshop_EventScript_163851
	end

Route113_GlassWorkshop_EventScript_163750:: @ 8163750
	setvar VAR_SPECIAL_8, ITEM_BLACK_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	setvar VAR_SPECIAL_A, 1000
	compare VAR_ASH_GATHER_COUNT, 1000
	goto_if_lt Route113_GlassWorkshop_EventScript_163830
	msgbox Route113_GlassWorkshop_Text_19E7CD, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route113_GlassWorkshop_EventScript_163845
	setvar VAR_GLASS_WORKSHOP_STATE, 14
	subvar VAR_ASH_GATHER_COUNT, 1000
	goto Route113_GlassWorkshop_EventScript_163851
	end

Route113_GlassWorkshop_EventScript_16378C:: @ 816378C
	setvar VAR_SPECIAL_9, 1
	setvar VAR_SPECIAL_8, DECOR_PRETTY_CHAIR
	bufferdecorationname 0, VAR_SPECIAL_8
	setvar VAR_SPECIAL_A, 6000
	compare VAR_ASH_GATHER_COUNT, 6000
	goto_if_lt Route113_GlassWorkshop_EventScript_163830
	msgbox Route113_GlassWorkshop_Text_19E7CD, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route113_GlassWorkshop_EventScript_163845
	setvar VAR_GLASS_WORKSHOP_STATE, 15
	subvar VAR_ASH_GATHER_COUNT, 6000
	goto Route113_GlassWorkshop_EventScript_163851
	end

Route113_GlassWorkshop_EventScript_1637CD:: @ 81637CD
	setvar VAR_SPECIAL_9, 1
	setvar VAR_SPECIAL_8, DECOR_PRETTY_DESK
	bufferdecorationname 0, VAR_SPECIAL_8
	setvar VAR_SPECIAL_A, 8000
	compare VAR_ASH_GATHER_COUNT, 8000
	goto_if_lt Route113_GlassWorkshop_EventScript_163830
	msgbox Route113_GlassWorkshop_Text_19E7CD, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq Route113_GlassWorkshop_EventScript_163845
	setvar VAR_GLASS_WORKSHOP_STATE, 16
	subvar VAR_ASH_GATHER_COUNT, 8000
	goto Route113_GlassWorkshop_EventScript_163851
	end

Route113_GlassWorkshop_EventScript_16380E:: @ 816380E
	msgbox Route113_GlassWorkshop_Text_19E990, 4
	release
	end

Route113_GlassWorkshop_EventScript_163818:: @ 8163818
	setvar VAR_SPECIAL_A, 250
	subvar VAR_SPECIAL_A, 16456
	buffernumberstring 0, 32778
	msgbox Route113_GlassWorkshop_Text_19E697, 4
	release
	end

Route113_GlassWorkshop_EventScript_163830:: @ 8163830
	subvar VAR_SPECIAL_A, 16456
	buffernumberstring 1, 32778
	message Route113_GlassWorkshop_Text_19E890
	waitmessage
	goto Route113_GlassWorkshop_EventScript_1635EE
	end

Route113_GlassWorkshop_EventScript_163845:: @ 8163845
	message Route113_GlassWorkshop_Text_19E802
	waitmessage
	goto Route113_GlassWorkshop_EventScript_1635EE
	end

Route113_GlassWorkshop_EventScript_163851:: @ 8163851
	msgbox Route113_GlassWorkshop_Text_19E827, 4
	closemessage
	fadescreen 1
	playse SE_SELECT
	delay 30
	fadescreen 0
	msgbox Route113_GlassWorkshop_Text_19E9D7, 4
	compare VAR_SPECIAL_9, 0
	call_if_eq Route113_GlassWorkshop_EventScript_163889
	compare VAR_SPECIAL_9, 1
	call_if_eq Route113_GlassWorkshop_EventScript_1638A1
	setvar VAR_GLASS_WORKSHOP_STATE, 2
	release
	end

Route113_GlassWorkshop_EventScript_163889:: @ 8163889
	giveitem_std VAR_SPECIAL_8
	compare RESULT, 0
	goto_if_eq Route113_GlassWorkshop_EventScript_1638B4
	return

Route113_GlassWorkshop_EventScript_1638A1:: @ 81638A1
	givedecoration_std VAR_SPECIAL_8
	compare RESULT, 0
	goto_if_eq Route113_GlassWorkshop_EventScript_1638C3
	return

Route113_GlassWorkshop_EventScript_1638B4:: @ 81638B4
	call Route113_GlassWorkshop_EventScript_1A02A5
	msgbox Route113_GlassWorkshop_Text_19EA06, 4
	release
	end

Route113_GlassWorkshop_EventScript_1638C3:: @ 81638C3
	call Route113_GlassWorkshop_EventScript_1A02B8
	msgbox Route113_GlassWorkshop_Text_19EA64, 4
	release
	end

Route113_GlassWorkshop_EventScript_1638D2:: @ 81638D2
	switch VAR_GLASS_WORKSHOP_STATE
	case 10, Route113_GlassWorkshop_EventScript_163925
	case 11, Route113_GlassWorkshop_EventScript_163939
	case 12, Route113_GlassWorkshop_EventScript_16394D
	case 13, Route113_GlassWorkshop_EventScript_163961
	case 14, Route113_GlassWorkshop_EventScript_163975
	case 15, Route113_GlassWorkshop_EventScript_163989
	case 16, Route113_GlassWorkshop_EventScript_16399D
	end

Route113_GlassWorkshop_EventScript_163925:: @ 8163925
	setvar VAR_SPECIAL_9, 0
	setvar VAR_SPECIAL_8, ITEM_BLUE_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	goto Route113_GlassWorkshop_EventScript_1639B1
	end

Route113_GlassWorkshop_EventScript_163939:: @ 8163939
	setvar VAR_SPECIAL_9, 0
	setvar VAR_SPECIAL_8, ITEM_YELLOW_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	goto Route113_GlassWorkshop_EventScript_1639B1
	end

Route113_GlassWorkshop_EventScript_16394D:: @ 816394D
	setvar VAR_SPECIAL_9, 0
	setvar VAR_SPECIAL_8, ITEM_RED_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	goto Route113_GlassWorkshop_EventScript_1639B1
	end

Route113_GlassWorkshop_EventScript_163961:: @ 8163961
	setvar VAR_SPECIAL_9, 0
	setvar VAR_SPECIAL_8, ITEM_WHITE_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	goto Route113_GlassWorkshop_EventScript_1639B1
	end

Route113_GlassWorkshop_EventScript_163975:: @ 8163975
	setvar VAR_SPECIAL_9, 0
	setvar VAR_SPECIAL_8, ITEM_BLACK_FLUTE
	bufferitemname 0, VAR_SPECIAL_8
	goto Route113_GlassWorkshop_EventScript_1639B1
	end

Route113_GlassWorkshop_EventScript_163989:: @ 8163989
	setvar VAR_SPECIAL_9, 1
	setvar VAR_SPECIAL_8, DECOR_PRETTY_CHAIR
	bufferdecorationname 0, DECOR_PRETTY_CHAIR
	goto Route113_GlassWorkshop_EventScript_1639B1
	end

Route113_GlassWorkshop_EventScript_16399D:: @ 816399D
	setvar VAR_SPECIAL_9, 1
	setvar VAR_SPECIAL_8, DECOR_PRETTY_DESK
	bufferdecorationname 0, DECOR_PRETTY_DESK
	goto Route113_GlassWorkshop_EventScript_1639B1
	end

Route113_GlassWorkshop_EventScript_1639B1:: @ 81639B1
	msgbox Route113_GlassWorkshop_Text_19E9D7, 4
	compare VAR_SPECIAL_9, 0
	call_if_eq Route113_GlassWorkshop_EventScript_163889
	compare VAR_SPECIAL_9, 1
	call_if_eq Route113_GlassWorkshop_EventScript_1638A1
	setvar VAR_GLASS_WORKSHOP_STATE, 2
	release
	end

Route113_GlassWorkshop_EventScript_1639D6:: @ 81639D6
	msgbox Route113_GlassWorkshop_Text_19EB3B, 2
	end
