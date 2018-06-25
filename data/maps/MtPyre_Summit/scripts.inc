MtPyre_Summit_MapScripts:: @ 815D4B1
	map_script 3, MtPyre_Summit_MapScript1_15D4B7
	.byte 0

MtPyre_Summit_MapScript1_15D4B7:: @ 815D4B7
	call MtPyre_Summit_EventScript_1A0196
	end

MtPyre_Summit_EventScript_15D4BD:: @ 815D4BD
	lockall
	setvar VAR_SPECIAL_8, 0
	goto MtPyre_Summit_EventScript_15D4E1
	end

MtPyre_Summit_EventScript_15D4C9:: @ 815D4C9
	lockall
	setvar VAR_SPECIAL_8, 1
	goto MtPyre_Summit_EventScript_15D4E1
	end

MtPyre_Summit_EventScript_15D4D5:: @ 815D4D5
	lockall
	setvar VAR_SPECIAL_8, 2
	goto MtPyre_Summit_EventScript_15D4E1
	end

MtPyre_Summit_EventScript_15D4E1:: @ 815D4E1
	applymovement 255, MtPyre_Summit_Movement_1A0841
	waitmovement 0
	applymovement 2, MtPyre_Summit_Movement_1A0845
	waitmovement 0
	delay 50
	compare VAR_SPECIAL_8, 0
	call_if_eq MtPyre_Summit_EventScript_15D593
	compare VAR_SPECIAL_8, 1
	call_if_eq MtPyre_Summit_EventScript_15D59E
	compare VAR_SPECIAL_8, 2
	call_if_eq MtPyre_Summit_EventScript_15D59F
	.ifdef SAPPHIRE
	msgbox UnknownString_81B52B0, 4
	.else
	msgbox MtPyre_Summit_Text_1B5EEC, 4
	.endif
	closemessage
	fadescreen 1
	removeobject 2
	removeobject 4
	removeobject 5
	removeobject 6
	setflag FLAG_HIDE_LEADER_MT_PYRE_SUMMIT
	setflag FLAG_HIDE_GRUNTS_MT_PYRE_SUMMIT
	fadescreen 0
	delay 20
	call MtPyre_Summit_EventScript_15D57A
	compare VAR_SPECIAL_8, 0
	call_if_eq MtPyre_Summit_EventScript_15D5AA
	compare VAR_SPECIAL_8, 1
	call_if_eq MtPyre_Summit_EventScript_15D5BF
	compare VAR_SPECIAL_8, 2
	call_if_eq MtPyre_Summit_EventScript_15D5CA
	.ifdef SAPPHIRE
	msgbox UnknownString_81B53AB, 4
	.else
	msgbox MtPyre_Summit_Text_1B5FE6, 4
	.endif
	giveitem_std ITEM_RED_OR_BLUE_ORB
	setflag FLAG_RECEIVED_RED_OR_BLUE_ORB
	releaseall
	end

MtPyre_Summit_EventScript_15D57A:: @ 815D57A
	setflag FLAG_MT_PYRE_ORB_STOLEN
	setvar VAR_SLATEPORT_STATE, 1
	clearflag FLAG_HIDE_STERN_SLATEPORT
	clearflag FLAG_HIDE_GABBY_AND_TY_SLATEPORT
	setvar VAR_SLATEPORT_HARBOR_STATE, 1
	setvar VAR_MT_PYRE_STATE, 1
	return

MtPyre_Summit_EventScript_15D593:: @ 815D593
	applymovement 2, MtPyre_Summit_Movement_15D5E9
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D59E:: @ 815D59E
	return

MtPyre_Summit_EventScript_15D59F:: @ 815D59F
	applymovement 2, MtPyre_Summit_Movement_15D5EC
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D5AA:: @ 815D5AA
	applymovement 3, MtPyre_Summit_Movement_15D5DF
	waitmovement 0
	applymovement 255, MtPyre_Summit_Movement_1A0843
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D5BF:: @ 815D5BF
	applymovement 3, MtPyre_Summit_Movement_15D5E3
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D5CA:: @ 815D5CA
	applymovement 3, MtPyre_Summit_Movement_15D5E5
	waitmovement 0
	applymovement 255, MtPyre_Summit_Movement_1A083F
	waitmovement 0
	return

MtPyre_Summit_Movement_15D5DF:: @ 815D5DF
	walk_down
	walk_down
	walk_in_place_fastest_left
	end_movement

MtPyre_Summit_Movement_15D5E3:: @ 815D5E3
	walk_down
	end_movement

MtPyre_Summit_Movement_15D5E5:: @ 815D5E5
	walk_down
	walk_down
	walk_in_place_fastest_right
	end_movement

MtPyre_Summit_Movement_15D5E9:: @ 815D5E9
	walk_left
	walk_in_place_fastest_down
	end_movement

MtPyre_Summit_Movement_15D5EC:: @ 815D5EC
	walk_right
	walk_in_place_fastest_down
	end_movement

MtPyre_Summit_EventScript_15D5EF:: @ 815D5EF
	lock
	faceplayer
	.ifdef SAPPHIRE
	msgbox UnknownString_81B586F, MSGBOX_YESNO
	.else
	msgbox MtPyre_Summit_Text_1B64B3, MSGBOX_YESNO
	.endif
	compare RESULT, YES
	call_if_eq MtPyre_Summit_EventScript_15D611
	compare RESULT, NO
	call_if_eq MtPyre_Summit_EventScript_15D61A
	release
	end

MtPyre_Summit_EventScript_15D611:: @ 815D611
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5992, 4
	.else
	msgbox MtPyre_Summit_Text_1B65D6, 4
	.endif
	return

MtPyre_Summit_EventScript_15D61A:: @ 815D61A
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5BD7, 4
	.else
	msgbox MtPyre_Summit_Text_1B6823, 4
	.endif
	return

MtPyre_Summit_EventScript_15D623:: @ 815D623
	lock
	faceplayer
	goto_if_set FLAG_RETURNED_RED_OR_BLUE_ORB, MtPyre_Summit_EventScript_15D6C4
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, MtPyre_Summit_EventScript_15D64A
	goto_if_set FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, MtPyre_Summit_EventScript_15D6BA
	.ifdef SAPPHIRE
	msgbox UnknownString_81B54BE, 4
	.else
	msgbox MtPyre_Summit_Text_1B60F9, 4
	.endif
	release
	end

MtPyre_Summit_EventScript_15D64A:: @ 815D64A
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5647, MSGBOX_YESNO
	.else
	msgbox MtPyre_Summit_Text_1B6283, MSGBOX_YESNO
	.endif
	compare RESULT, YES
	goto_if_eq MtPyre_Summit_EventScript_15D669
	compare RESULT, NO
	goto_if_eq MtPyre_Summit_EventScript_15D69B
	end

MtPyre_Summit_EventScript_15D669:: @ 815D669
	setvar VAR_SPECIAL_4, ITEM_RED_OR_BLUE_ORB
	call MtPyre_Summit_EventScript_1A067F
	closemessage
	applymovement LAST_TALKED, MtPyre_Summit_Movement_1A0841
	waitmovement 0
	delay 40
	applymovement LAST_TALKED, MtPyre_Summit_Movement_1A0839
	waitmovement 0
	delay 10
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5762, 4
	.else
	msgbox MtPyre_Summit_Text_1B639C, 4
	.endif
	setflag FLAG_RETURNED_RED_OR_BLUE_ORB
	release
	end

MtPyre_Summit_EventScript_15D69B:: @ 815D69B
	.ifdef SAPPHIRE
	msgbox UnknownString_81B56AB, MSGBOX_YESNO
	.else
	msgbox MtPyre_Summit_Text_1B62E7, MSGBOX_YESNO
	.endif
	compare RESULT, YES
	goto_if_eq MtPyre_Summit_EventScript_15D669
	compare RESULT, NO
	goto_if_eq MtPyre_Summit_EventScript_15D69B
	end

MtPyre_Summit_EventScript_15D6BA:: @ 815D6BA
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5540, 4
	.else
	msgbox MtPyre_Summit_Text_1B617B, 4
	.endif
	release
	end

MtPyre_Summit_EventScript_15D6C4:: @ 815D6C4
	.ifdef SAPPHIRE
	msgbox UnknownString_81B57BE, 4
	.else
	msgbox MtPyre_Summit_Text_1B63F8, 4
	.endif
	release
	end

MtPyre_Summit_EventScript_15D6CE:: @ 815D6CE
	lockall
	setvar VAR_SPECIAL_8, 0
	goto MtPyre_Summit_EventScript_15D6F2
	end

MtPyre_Summit_EventScript_15D6DA:: @ 815D6DA
	lockall
	setvar VAR_SPECIAL_8, 1
	goto MtPyre_Summit_EventScript_15D6F2
	end

MtPyre_Summit_EventScript_15D6E6:: @ 815D6E6
	lockall
	setvar VAR_SPECIAL_8, 2
	goto MtPyre_Summit_EventScript_15D6F2
	end

MtPyre_Summit_EventScript_15D6F2:: @ 815D6F2
	applymovement 255, MtPyre_Summit_Movement_1A0841
	waitmovement 0
	applymovement 2, MtPyre_Summit_Movement_1A0845
	waitmovement 0
	delay 50
	compare VAR_SPECIAL_8, 0
	call_if_eq MtPyre_Summit_EventScript_15D75E
	compare VAR_SPECIAL_8, 1
	call_if_eq MtPyre_Summit_EventScript_15D769
	compare VAR_SPECIAL_8, 2
	call_if_eq MtPyre_Summit_EventScript_15D774
	.ifdef SAPPHIRE
	msgbox UnknownString_81B5BFC, 4
	.else
	msgbox MtPyre_Summit_Text_1B6848, 4
	.endif
	closemessage
	compare VAR_SPECIAL_8, 0
	call_if_eq MtPyre_Summit_EventScript_15D77F
	compare VAR_SPECIAL_8, 1
	call_if_eq MtPyre_Summit_EventScript_15D78A
	compare VAR_SPECIAL_8, 2
	call_if_eq MtPyre_Summit_EventScript_15D795
	removeobject 2
	setvar VAR_MT_PYRE_STATE, 3
	releaseall
	end

MtPyre_Summit_EventScript_15D75E:: @ 815D75E
	applymovement 2, MtPyre_Summit_Movement_15D7A0
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D769:: @ 815D769
	applymovement 2, MtPyre_Summit_Movement_15D7A3
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D774:: @ 815D774
	applymovement 2, MtPyre_Summit_Movement_15D7A4
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D77F:: @ 815D77F
	applymovement 2, MtPyre_Summit_Movement_15D7A7
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D78A:: @ 815D78A
	applymovement 2, MtPyre_Summit_Movement_15D7B0
	waitmovement 0
	return

MtPyre_Summit_EventScript_15D795:: @ 815D795
	applymovement 2, MtPyre_Summit_Movement_15D7B9
	waitmovement 0
	return

MtPyre_Summit_Movement_15D7A0:: @ 815D7A0
	walk_left
	walk_in_place_fastest_down
	end_movement

MtPyre_Summit_Movement_15D7A3:: @ 815D7A3
	end_movement

MtPyre_Summit_Movement_15D7A4:: @ 815D7A4
	walk_right
	walk_in_place_fastest_down
	end_movement

MtPyre_Summit_Movement_15D7A7:: @ 815D7A7
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

MtPyre_Summit_Movement_15D7B0:: @ 815D7B0
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

MtPyre_Summit_Movement_15D7B9:: @ 815D7B9
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement
