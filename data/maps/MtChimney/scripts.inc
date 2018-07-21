MtChimney_MapScripts:: @ 815CF7C
	map_script 5, MtChimney_MapScript1_15CF92
	map_script 3, MtChimney_MapScript1_15CF87
	.byte 0

MtChimney_MapScript1_15CF87:: @ 815CF87
	setvar VAR_JAGGED_PASS_ASH_WEATHER, 1
	call MtChimney_EventScript_1A0196
	end

MtChimney_MapScript1_15CF92:: @ 815CF92
	setstepcallback 1
	end

MtChimney_EventScript_15CF95:: @ 815CF95
	lock
	faceplayer
	showmoneybox 0, 0
	nop
	msgbox MtChimney_Text_195760, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq MtChimney_EventScript_15D00B
	checkmoney 0xc8, 0
	compare RESULT, 0
	goto_if_eq MtChimney_EventScript_15D018
	msgbox MtChimney_Text_1957A9, 4
	checkitemspace ITEM_LAVA_COOKIE, 1
	compare RESULT, 1
	call_if_eq MtChimney_EventScript_15D000
	giveitem_std ITEM_LAVA_COOKIE
	compare RESULT, 0
	goto_if_eq MtChimney_EventScript_15CFF3
	hidemoneybox 0, 0
	release
	end

MtChimney_EventScript_15CFF3:: @ 815CFF3
	msgbox MtChimney_Text_1A0CC2, 4
	hidemoneybox 0, 0
	release
	end

MtChimney_EventScript_15D000:: @ 815D000
	takemoney 0xc8, 0
	updatemoneybox 0, 0
	nop
	return

MtChimney_EventScript_15D00B:: @ 815D00B
	msgbox MtChimney_Text_1957F7, 4
	hidemoneybox 0, 0
	release
	end

MtChimney_EventScript_15D018:: @ 815D018
	msgbox MtChimney_Text_1957BA, 4
	hidemoneybox 0, 0
	release
	end

MtChimney_Movement_15D025:: @ 815D025
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_right
	end_movement

MtChimney_Movement_15D02D:: @ 815D02D
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

MtChimney_Movement_15D036:: @ 815D036
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_right
	walk_right
	end_movement

MtChimney_Movement_15D03E:: @ 815D03E
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

@ 815D048
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	end_movement

@ 815D05A
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_down
	end_movement

@ 815D063
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

@ 815D072
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	end_movement

@ 815D08B
	delay_16
	delay_16
	delay_16
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_down
	end_movement

@ 815D096
	delay_16
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

@ 815D0A6
	delay_16
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	end_movement

@ 815D0B7
	delay_16
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_in_place_fastest_down
	end_movement

@ 815D0BF
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

@ 815D0CD
	walk_down
	end_movement

@ 815D0CF
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

@ 815D0D7
	delay_16
	delay_16
	walk_in_place_fastest_left
	delay_16
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	end_movement

@ 815D0E1
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	delay_16
	walk_in_place_fastest_left
	delay_16
	walk_down
	walk_down
	end_movement

@ 815D0EC
	lock_facing_direction
	walk_fast_left
	unlock_facing_direction
	face_right
	end_movement

@ 815D0F1
	walk_left
	walk_in_place_fastest_right
	delay_16
	end_movement

MtChimney_EventScript_15D0F5:: @ 815D0F5
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B36F1, 3
	.else
	msgbox MtChimney_Text_1B40EA, 3
	.endif
	end

MtChimney_EventScript_15D0FE:: @ 815D0FE
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B372E, 3
	.else
	msgbox MtChimney_Text_1B4128, 3
	.endif
	end

MtChimney_EventScript_15D107:: @ 815D107
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3778, 3
	.else
	msgbox MtChimney_Text_1B416E, 3
	.endif
	end

MtChimney_EventScript_15D110:: @ 815D110
	.ifdef SAPPHIRE
	trainerbattle 0, TRAINER_MT_CHIMNEY_GRUNT_1, 0, MtChimney_Text_1B3168, MtChimney_Text_1B31EA
	msgbox MtChimney_Text_1B3239, 6
	.else
	trainerbattle 0, TRAINER_MT_CHIMNEY_GRUNT_1, 0, MtChimney_Text_1B3B36, MtChimney_Text_1B3BB8
	msgbox MtChimney_Text_1B3C07, 6
	.endif
	end

MtChimney_EventScript_15D127:: @ 815D127
	.ifdef SAPPHIRE
	trainerbattle 0, TRAINER_MT_CHIMNEY_GRUNT_2, 0, MtChimney_Text_1B32C8, MtChimney_Text_1B336E
	msgbox MtChimney_Text_1B338D, 6
	.else
	trainerbattle 0, TRAINER_MT_CHIMNEY_GRUNT_2, 0, MtChimney_Text_1B3C96, MtChimney_Text_1B3D1E
	msgbox MtChimney_Text_1B3D3D, 6
	.endif
	end

MtChimney_EventScript_15D13E:: @ 815D13E
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B33EA, 3
	.else
	msgbox MtChimney_Text_1B3D9A, 3
	.endif
	end

@ 815D147
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3427, 3
	.else
	msgbox MtChimney_Text_1B3DD6, 3
	.endif
	end

MtChimney_EventScript_15D150:: @ 815D150
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3446, 3
	.else
	msgbox MtChimney_Text_1B3DF5, 3
	.endif
	end

MtChimney_EventScript_15D159:: @ 815D159
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3470, 3
	.else
	msgbox MtChimney_Text_1B3E1F, 3
	.endif
	end

MtChimney_EventScript_15D162:: @ 815D162
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B34C6, 3
	.else
	msgbox MtChimney_Text_1B3E7A, 3
	.endif
	end

MtChimney_EventScript_15D16B:: @ 815D16B
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B3503, 3
	.else
	msgbox MtChimney_Text_1B3EBA, 3
	.endif
	end

MtChimney_EventScript_15D174:: @ 815D174
	.ifdef SAPPHIRE
	msgbox MtChimney_Text_1B37B4, 3
	.else
	msgbox MtChimney_Text_1B41B0, 3
	.endif
	end

MtChimney_EventScript_15D17D:: @ 815D17D
	lockall
	goto_if_unset FLAG_DEFEATED_EVIL_TEAM_MT_CHIMNEY, MtChimney_EventScript_15D1D0
	goto_if_set FLAG_RECEIVED_METEORITE, MtChimney_EventScript_15D1C6
	msgbox MtChimney_Text_195870, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq MtChimney_EventScript_15D1BC
	msgbox MtChimney_Text_1958C6, 4
	giveitem_std ITEM_METEORITE
	setflag FLAG_RECEIVED_METEORITE
	releaseall
	end

MtChimney_EventScript_15D1BC:: @ 815D1BC
	msgbox MtChimney_Text_1958FC, 4
	releaseall
	end

MtChimney_EventScript_15D1C6:: @ 815D1C6
	msgbox MtChimney_Text_195920, 4
	releaseall
	end

MtChimney_EventScript_15D1D0:: @ 815D1D0
	msgbox MtChimney_Text_195806, 4
	releaseall
	end

MtChimney_EventScript_15D1DA:: @ 815D1DA
	msgbox MtChimney_Text_19595C, 3
	end

MtChimney_EventScript_15D1E3:: @ 815D1E3
	trainerbattle 0, TRAINER_SHELBY_1, 0, MtChimney_Text_19597F, MtChimney_Text_1959D8
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq MtChimney_EventScript_15D20A
	msgbox MtChimney_Text_195A04, 6
	end

MtChimney_EventScript_15D20A:: @ 815D20A
	trainerbattle 5, TRAINER_SHELBY_1, 0, MtChimney_Text_195A45, MtChimney_Text_195AAD
	msgbox MtChimney_Text_195AD9, 6
	end

MtChimney_EventScript_15D221:: @ 815D221
	trainerbattle 0, TRAINER_MELISSA, 0, MtChimney_Text_195B1C, MtChimney_Text_195B5F
	msgbox MtChimney_Text_195B84, 6
	end

MtChimney_EventScript_15D238:: @ 815D238
	trainerbattle 0, TRAINER_SHEILA, 0, MtChimney_Text_195BB2, MtChimney_Text_195BF9
	msgbox MtChimney_Text_195C31, 6
	end

MtChimney_EventScript_15D24F:: @ 815D24F
	trainerbattle 0, TRAINER_SHIRLEY, 0, MtChimney_Text_195CD8, MtChimney_Text_195D2F
	msgbox MtChimney_Text_195D5C, 6
	end
