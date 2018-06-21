Route110_TrickHouseEntrance_MapScripts:: @ 8160F2B
	map_script 3, Route110_TrickHouseEntrance_MapScript1_160F3B
	map_script 2, Route110_TrickHouseEntrance_MapScript2_1611CD
	map_script 4, Route110_TrickHouseEntrance_MapScript2_1610B2
	.byte 0

Route110_TrickHouseEntrance_MapScript1_160F3B:: @ 8160F3B
	setflag FLAG_LANDMARK_TRICK_HOUSE
	compare VAR_TRICK_HOUSE_STATE, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_160FCE
	compare VAR_TRICK_HOUSE_PRIZE_PICKUP, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_160FB2
	compare VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_16108E
	compare VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 5
	call_if_eq Route110_TrickHouseEntrance_EventScript_160FDE
	compare VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 3
	call_if_eq Route110_TrickHouseEntrance_EventScript_160FDE
	compare VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_160FDE
	switch VAR_TRICK_HOUSE_ENTRANCE_STATE_3
	case 0, Route110_TrickHouseEntrance_EventScript_16109A
	case 1, Route110_TrickHouseEntrance_EventScript_1610A0
	case 3, Route110_TrickHouseEntrance_EventScript_1610A6
	case 4, Route110_TrickHouseEntrance_EventScript_1610AC
	end

Route110_TrickHouseEntrance_EventScript_160FB2:: @ 8160FB2
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 8
	goto_if_eq Route110_TrickHouseEntrance_EventScript_160FC8
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 2
	end

Route110_TrickHouseEntrance_EventScript_160FC8:: @ 8160FC8
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 6
	end

Route110_TrickHouseEntrance_EventScript_160FCE:: @ 8160FCE
	setvar VAR_TRICK_HOUSE_STATE, 0
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 5
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_EventScript_160FDE:: @ 8160FDE
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 0
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	call_if_eq Route110_TrickHouseEntrance_EventScript_16103C
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 2
	call_if_eq Route110_TrickHouseEntrance_EventScript_161046
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 3
	call_if_eq Route110_TrickHouseEntrance_EventScript_161050
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 4
	call_if_eq Route110_TrickHouseEntrance_EventScript_16105A
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 5
	call_if_eq Route110_TrickHouseEntrance_EventScript_161064
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 6
	call_if_eq Route110_TrickHouseEntrance_EventScript_16106E
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 7
	call_if_eq Route110_TrickHouseEntrance_EventScript_161078
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 8
	call_if_eq Route110_TrickHouseEntrance_EventScript_161082
	return

Route110_TrickHouseEntrance_EventScript_16103C:: @ 816103C
	call_if_unset FLAG_BADGE03_GET, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161046:: @ 8161046
	call_if_unset FLAG_BADGE04_GET, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161050:: @ 8161050
	call_if_unset FLAG_BADGE05_GET, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_16105A:: @ 816105A
	call_if_unset FLAG_BADGE06_GET, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161064:: @ 8161064
	call_if_unset FLAG_BADGE07_GET, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_16106E:: @ 816106E
	call_if_unset FLAG_BADGE08_GET, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161078:: @ 8161078
	call_if_unset FLAG_SYS_GAME_CLEAR, Route110_TrickHouseEntrance_EventScript_161088
	return

Route110_TrickHouseEntrance_EventScript_161082:: @ 8161082
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 4
	return

Route110_TrickHouseEntrance_EventScript_161088:: @ 8161088
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 3
	return

Route110_TrickHouseEntrance_EventScript_16108E:: @ 816108E
	setobjectxyperm 1, 5, 2
	setobjectmovementtype 1, 4
	end

Route110_TrickHouseEntrance_EventScript_16109A:: @ 816109A
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 0
	end

Route110_TrickHouseEntrance_EventScript_1610A0:: @ 81610A0
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_EventScript_1610A6:: @ 81610A6
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_EventScript_1610AC:: @ 81610AC
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_MapScript2_1610B2:: @ 81610B2
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 1, Route110_TrickHouseEntrance_EventScript_1610F4
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 0, Route110_TrickHouseEntrance_EventScript_161105
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 1, Route110_TrickHouseEntrance_EventScript_1611AB
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 2, Route110_TrickHouseEntrance_EventScript_1611AF
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 3, Route110_TrickHouseEntrance_EventScript_1611AF
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 4, Route110_TrickHouseEntrance_EventScript_1611AB
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 5, Route110_TrickHouseEntrance_EventScript_1611AB
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 6, Route110_TrickHouseEntrance_EventScript_1611BE
	.2byte 0

Route110_TrickHouseEntrance_EventScript_1610F4:: @ 81610F4
	addobject 1
	showobjectat 1, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	turnobject 1, 4
	turnobject 255, 3
	end

Route110_TrickHouseEntrance_EventScript_161105:: @ 8161105
	addobject 1
	hideobjectat 1, MAP_ROUTE110_TRICK_HOUSE_ENTRANCE
	switch VAR_TRICK_HOUSE_ROOMS_COMPLETED
	case 0, Route110_TrickHouseEntrance_EventScript_16116B
	case 1, Route110_TrickHouseEntrance_EventScript_161173
	case 2, Route110_TrickHouseEntrance_EventScript_161193
	case 3, Route110_TrickHouseEntrance_EventScript_161183
	case 4, Route110_TrickHouseEntrance_EventScript_16118B
	case 5, Route110_TrickHouseEntrance_EventScript_16117B
	case 6, Route110_TrickHouseEntrance_EventScript_16119B
	case 7, Route110_TrickHouseEntrance_EventScript_1611A3
	end

Route110_TrickHouseEntrance_EventScript_16116B:: @ 816116B
	setobjectxy 1, 6, 3
	end

Route110_TrickHouseEntrance_EventScript_161173:: @ 8161173
	setobjectxy 1, 11, 5
	end

Route110_TrickHouseEntrance_EventScript_16117B:: @ 816117B
	setobjectxy 1, 11, 1
	end

Route110_TrickHouseEntrance_EventScript_161183:: @ 8161183
	setobjectxy 1, 3, 1
	end

Route110_TrickHouseEntrance_EventScript_16118B:: @ 816118B
	setobjectxy 1, 0, 5
	end

Route110_TrickHouseEntrance_EventScript_161193:: @ 8161193
	setobjectxy 1, 9, 1
	end

Route110_TrickHouseEntrance_EventScript_16119B:: @ 816119B
	setobjectxy 1, 8, 1
	end

Route110_TrickHouseEntrance_EventScript_1611A3:: @ 81611A3
	setobjectxy 1, 4, 4
	end

Route110_TrickHouseEntrance_EventScript_1611AB:: @ 81611AB
	removeobject 1
	end

Route110_TrickHouseEntrance_EventScript_1611AF:: @ 81611AF
	addobject 1
	setobjectxy 1, 5, 2
	turnobject 1, 2
	end

Route110_TrickHouseEntrance_EventScript_1611BE:: @ 81611BE
	addobject 1
	setobjectxy 1, 5, 2
	turnobject 1, 1
	end

Route110_TrickHouseEntrance_MapScript2_1611CD:: @ 81611CD
	map_script_2 VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 1, Route110_TrickHouseEntrance_EventScript_1611D7
	.2byte 0

Route110_TrickHouseEntrance_EventScript_1611D7:: @ 81611D7
	lockall
	delay 20
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_161327
	msgbox Route110_TrickHouseEntrance_Text_19BD82, 4
	closemessage
	delay 20
	applymovement 1, Route110_TrickHouseEntrance_Movement_161315
	waitmovement 0
	playse SE_W153
	applymovement 1, Route110_TrickHouseEntrance_Movement_16131E
	waitmovement 0
	removeobject 1
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 1
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 0
	releaseall
	end

@ 8161218
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16121A:: @ 816121A
	lockall
	switch VAR_TRICK_HOUSE_ENTRANCE_STATE_3
	case 0, Route110_TrickHouseEntrance_EventScript_16124D
	case 2, Route110_TrickHouseEntrance_EventScript_16136E
	case 3, Route110_TrickHouseEntrance_EventScript_161330
	case 6, Route110_TrickHouseEntrance_EventScript_161518
	end

Route110_TrickHouseEntrance_EventScript_16124D:: @ 816124D
	playse SE_PIN
	applymovement 255, Route110_TrickHouseEntrance_Movement_1A0833
	waitmovement 0
	applymovement 255, Route110_TrickHouseEntrance_Movement_1A0835
	waitmovement 0
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1612CD
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	call_if_eq Route110_TrickHouseEntrance_EventScript_1612D6
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 2
	call_if_eq Route110_TrickHouseEntrance_EventScript_1612DF
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 3
	call_if_eq Route110_TrickHouseEntrance_EventScript_1612E8
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 4
	call_if_eq Route110_TrickHouseEntrance_EventScript_1612F1
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 5
	call_if_eq Route110_TrickHouseEntrance_EventScript_1612FA
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 6
	call_if_eq Route110_TrickHouseEntrance_EventScript_161303
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 7
	call_if_eq Route110_TrickHouseEntrance_EventScript_16130C
	closemessage
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_2, 1
	warp MAP_ROUTE110_TRICK_HOUSE_ENTRANCE, 255, 6, 2
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1612CD:: @ 81612CD
	msgbox Route110_TrickHouseEntrance_Text_19BA6E, 4
	return

Route110_TrickHouseEntrance_EventScript_1612D6:: @ 81612D6
	msgbox Route110_TrickHouseEntrance_Text_19BAC0, 4
	return

Route110_TrickHouseEntrance_EventScript_1612DF:: @ 81612DF
	msgbox Route110_TrickHouseEntrance_Text_19BB11, 4
	return

Route110_TrickHouseEntrance_EventScript_1612E8:: @ 81612E8
	msgbox Route110_TrickHouseEntrance_Text_19BB61, 4
	return

Route110_TrickHouseEntrance_EventScript_1612F1:: @ 81612F1
	msgbox Route110_TrickHouseEntrance_Text_19BBB4, 4
	return

Route110_TrickHouseEntrance_EventScript_1612FA:: @ 81612FA
	msgbox Route110_TrickHouseEntrance_Text_19BC04, 4
	return

Route110_TrickHouseEntrance_EventScript_161303:: @ 8161303
	msgbox Route110_TrickHouseEntrance_Text_19BC55, 4
	return

Route110_TrickHouseEntrance_EventScript_16130C:: @ 816130C
	msgbox Route110_TrickHouseEntrance_Text_19BCA8, 4
	return

Route110_TrickHouseEnd_Movement_161315:: @ 8161315
Route110_TrickHouseEntrance_Movement_161315:: @ 8161315
	face_up
	delay_4
	face_left
	delay_4
	face_down
	delay_4
	face_right
	delay_4
	end_movement

Route110_TrickHouseEnd_Movement_16131E:: @ 816131E
Route110_TrickHouseEntrance_Movement_16131E:: @ 816131E
	face_up
	disable_anim
	slide_up
	slide_up
	slide_up
	slide_up
	slide_up
	slide_up
	end_movement

Route110_TrickHouseEntrance_EventScript_161327:: @ 8161327
	msgbox Route110_TrickHouseEntrance_Text_19BCFD, 4
	return

Route110_TrickHouseEntrance_EventScript_161330:: @ 8161330
	msgbox Route110_TrickHouseEntrance_Text_19BF19, 4
	closemessage
	applymovement 1, Route110_TrickHouseEntrance_Movement_1A0839
	waitmovement 0
	playse SE_PIN
	applymovement 1, Route110_TrickHouseEntrance_Movement_1A0833
	waitmovement 0
	applymovement 1, Route110_TrickHouseEntrance_Movement_1A0835
	waitmovement 0
	msgbox Route110_TrickHouseEntrance_Text_19BFAB, 4
	applymovement 1, Route110_TrickHouseEntrance_Movement_1A0841
	waitmovement 0
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16136E:: @ 816136E
	applymovement 1, Route110_TrickHouseEntrance_Movement_1A0839
	waitmovement 0
	msgbox Route110_TrickHouseEntrance_Text_19C07E, 4
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_1613CE
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 2
	goto_if_eq Route110_TrickHouseEntrance_EventScript_1613FA
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 3
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161426
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 4
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161452
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 5
	goto_if_eq Route110_TrickHouseEntrance_EventScript_16147E
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 6
	goto_if_eq Route110_TrickHouseEntrance_EventScript_1614AA
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 7
	goto_if_eq Route110_TrickHouseEntrance_EventScript_1614D6
	end

Route110_TrickHouseEntrance_EventScript_1613CE:: @ 81613CE
	giveitem_std ITEM_RARE_CANDY
	compare RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1613FA:: @ 81613FA
	giveitem_std ITEM_TIMER_BALL
	compare RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161426:: @ 8161426
	giveitem_std ITEM_HARD_STONE
	compare RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161452:: @ 8161452
	giveitem_std ITEM_SMOKE_BALL
	compare RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16147E:: @ 816147E
	giveitem_std ITEM_TM12_TAUNT
	compare RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1614AA:: @ 81614AA
	giveitem_std ITEM_MAGNET
	compare RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1614D6:: @ 81614D6
	giveitem_std ITEM_PP_MAX
	compare RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161502
	compare RESULT, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1A02A5
	msgbox Route110_TrickHouseEntrance_Text_19C0FC, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161502:: @ 8161502
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 3
	applymovement 1, Route110_TrickHouseEntrance_Movement_1A0841
	waitmovement 0
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161518:: @ 8161518
	applymovement 1, Route110_TrickHouseEntrance_Movement_1A0839
	waitmovement 0
	msgbox Route110_TrickHouseEntrance_Text_19C128, 4
	.ifdef SAPPHIRE
	givedecoration_std DECOR_BLUE_TENT
	.else
	givedecoration_std DECOR_RED_TENT
	.endif
	compare RESULT, 1
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161551
	compare RESULT, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1A02B8
	msgbox Route110_TrickHouseEntrance_Text_19C18D, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161551:: @ 8161551
	msgbox Route110_TrickHouseEntrance_Text_19C17E, 4
	closemessage
	applymovement 1, Route110_TrickHouseEntrance_Movement_16309F
	waitmovement 0
	applymovement 1, Route110_TrickHouseEntrance_Movement_161315
	waitmovement 0
	playse SE_W153
	applymovement 1, Route110_TrickHouseEntrance_Movement_16131E
	waitmovement 0
	removeobject 1
	setvar VAR_TRICK_HOUSE_PRIZE_PICKUP, 0
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE_3, 5
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16158A:: @ 816158A
	lockall
	switch VAR_TRICK_HOUSE_ENTRANCE_STATE_3
	case 0, Route110_TrickHouseEntrance_EventScript_1615BD
	case 1, Route110_TrickHouseEntrance_EventScript_1615C7
	case 4, Route110_TrickHouseEntrance_EventScript_1616B8
	case 5, Route110_TrickHouseEntrance_EventScript_1616C2
	end

Route110_TrickHouseEntrance_EventScript_1615BD:: @ 81615BD
	msgbox Route110_TrickHouseEntrance_Text_19BE6E, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1615C7:: @ 81615C7
	msgbox Route110_TrickHouseEntrance_Text_19BE7D, MSGBOX_YESNO
	closemessage
	compare RESULT, YES
	goto_if_eq Route110_TrickHouseEntrance_EventScript_1615DD
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1615DD:: @ 81615DD
	setmetatile 5, 1, 537, 0
	special DrawWholeMapView
	delay 20
	applymovement 255, Route110_TrickHouseEntrance_Movement_1A0856
	waitmovement 0
	applymovement 255, Route110_TrickHouseEntrance_Movement_16165E
	waitmovement 0
	switch VAR_TRICK_HOUSE_ROOMS_COMPLETED
	case 0, Route110_TrickHouseEntrance_EventScript_161660
	case 1, Route110_TrickHouseEntrance_EventScript_16166B
	case 2, Route110_TrickHouseEntrance_EventScript_161676
	case 3, Route110_TrickHouseEntrance_EventScript_161681
	case 4, Route110_TrickHouseEntrance_EventScript_16168C
	case 5, Route110_TrickHouseEntrance_EventScript_161697
	case 6, Route110_TrickHouseEntrance_EventScript_1616A2
	case 7, Route110_TrickHouseEntrance_EventScript_1616AD
	end

Route110_TrickHouseEntrance_Movement_16165E:: @ 816165E
	set_invisible
	end_movement

Route110_TrickHouseEntrance_EventScript_161660:: @ 8161660
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE1, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16166B:: @ 816166B
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE2, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161676:: @ 8161676
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE3, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161681:: @ 8161681
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE4, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16168C:: @ 816168C
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE5, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161697:: @ 8161697
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE6, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616A2:: @ 81616A2
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE7, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616AD:: @ 81616AD
	warp MAP_ROUTE110_TRICK_HOUSE_PUZZLE8, 255, 0, 21
	waitstate
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616B8:: @ 81616B8
	msgbox Route110_TrickHouseEntrance_Text_19BEB3, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616C2:: @ 81616C2
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 8
	goto_if_eq Route110_TrickHouseEntrance_EventScript_1616D7
	msgbox Route110_TrickHouseEntrance_Text_19BE6E, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1616D7:: @ 81616D7
	msgbox Route110_TrickHouseEntrance_Text_19BEB3, 4
	releaseall
	end

gUnknown_081616E1:: @ 81616E1
	lockall
	switch VAR_TRICK_HOUSE_ROOMS_COMPLETED
	case 0, Route110_TrickHouseEntrance_EventScript_161740
	case 1, Route110_TrickHouseEntrance_EventScript_161769
	case 2, Route110_TrickHouseEntrance_EventScript_161792
	case 3, Route110_TrickHouseEntrance_EventScript_1617BB
	case 4, Route110_TrickHouseEntrance_EventScript_1617E4
	case 5, Route110_TrickHouseEntrance_EventScript_16180D
	case 6, Route110_TrickHouseEntrance_EventScript_161836
	case 7, Route110_TrickHouseEntrance_EventScript_16185F
	end

Route110_TrickHouseEntrance_EventScript_161740:: @ 8161740
	compare VAR_TRICK_HOUSE_PUZZLE_1_STATE, 0
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161888
	msgbox UnknownString_819CAD1, 4
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_1_STATE, 2
	setmetatile 13, 1, 523, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161769:: @ 8161769
	compare VAR_TRICK_HOUSE_PUZZLE_2_STATE, 0
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161888
	msgbox UnknownString_819CCCB, 4
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_2_STATE, 2
	setmetatile 13, 1, 523, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161792:: @ 8161792
	compare VAR_TRICK_HOUSE_PUZZLE_3_STATE, 0
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161888
	msgbox UnknownString_819CEF9, 4
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_3_STATE, 2
	setmetatile 13, 1, 523, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1617BB:: @ 81617BB
	compare VAR_TRICK_HOUSE_PUZZLE_4_STATE, 0
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161888
	msgbox UnknownString_819D164, 4
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_4_STATE, 2
	setmetatile 13, 1, 523, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1617E4:: @ 81617E4
	compare VAR_TRICK_HOUSE_PUZZLE_5_STATE, 0
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161888
	msgbox UnknownString_819D3A5, 4
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_5_STATE, 2
	setmetatile 13, 1, 523, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16180D:: @ 816180D
	compare VAR_TRICK_HOUSE_PUZZLE_6_STATE, 0
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161888
	msgbox UnknownString_819DC0A, 4
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_6_STATE, 2
	setmetatile 13, 1, 523, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161836:: @ 8161836
	compare VAR_TRICK_HOUSE_PUZZLE_7_STATE, 0
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161888
	msgbox UnknownString_819DE8D, 4
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_7_STATE, 2
	setmetatile 13, 1, 523, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_16185F:: @ 816185F
	compare VAR_TRICK_HOUSE_PUZZLE_8_STATE, 0
	goto_if_eq Route110_TrickHouseEntrance_EventScript_161888
	msgbox UnknownString_819E0FF, 4
	playse SE_PIN
	setvar VAR_TRICK_HOUSE_PUZZLE_8_STATE, 2
	setmetatile 13, 1, 523, 0
	special DrawWholeMapView
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_161888:: @ 8161888
	msgbox UnknownString_819C21F, 4
	releaseall
	end

Route110_TrickHousePuzzle1_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle2_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle3_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle4_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle5_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle6_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle7_EventScript_161892:: @ 8161892
Route110_TrickHousePuzzle8_EventScript_161892:: @ 8161892
	msgbox Route110_TrickHousePuzzle1_Text_19C1FF, 4
	releaseall
	end

Route110_TrickHousePuzzle1_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle2_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle3_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle4_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle5_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle6_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle7_EventScript_16189C:: @ 816189C
Route110_TrickHousePuzzle8_EventScript_16189C:: @ 816189C
	playfanfare MUS_FANFA4
	message Route110_TrickHousePuzzle1_Text_19C1B8
	waitfanfare
	waitmessage
	msgbox Route110_TrickHousePuzzle1_Text_19C1CB, 4
	releaseall
	end

Route110_TrickHouseEntrance_EventScript_1618B0:: @ 81618B0
	lockall
	msgbox Route110_TrickHouseEntrance_Text_19BA56, 4
	releaseall
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 0
	call_if_eq Route110_TrickHouseEntrance_EventScript_1618E1
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 1
	call_if_eq Route110_TrickHouseEntrance_EventScript_1618F6
	compare VAR_TRICK_HOUSE_ROOMS_COMPLETED, 2
	call_if_eq Route110_TrickHouseEntrance_EventScript_16190B
	setvar VAR_TRICK_HOUSE_ENTRANCE_STATE, 1
	end

Route110_TrickHouseEntrance_EventScript_1618E1:: @ 81618E1
	setvar VAR_SPECIAL_4, 6
	setvar VAR_SPECIAL_5, 3
	setvar VAR_SPECIAL_6, 0
	call Route110_TrickHouseEntrance_EventScript_161920
	return

Route110_TrickHouseEntrance_EventScript_1618F6:: @ 81618F6
	setvar VAR_SPECIAL_4, 11
	setvar VAR_SPECIAL_5, 5
	setvar VAR_SPECIAL_6, 0
	call Route110_TrickHouseEntrance_EventScript_161920
	return

Route110_TrickHouseEntrance_EventScript_16190B:: @ 816190B
	setvar VAR_SPECIAL_4, 9
	setvar VAR_SPECIAL_5, 2
	setvar VAR_SPECIAL_6, 0
	call Route110_TrickHouseEntrance_EventScript_161920
	return

Route110_TrickHouseEntrance_EventScript_161920:: @ 8161920
	setfieldeffectargument 0, 32772
	setfieldeffectargument 1, 32773
	setfieldeffectargument 2, 32774
	dofieldeffect FLDEFF_SPARKLE
	waitfieldeffect FLDEFF_SPARKLE
	delay 10
	return
