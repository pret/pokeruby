MauvilleCity_House2_MapScripts:: @ 81572BF
	.byte 0

MauvilleCity_House2_EventScript_1572C0:: @ 81572C0
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_COIN_CASE, MauvilleCity_House2_EventScript_15733D
	msgbox MauvilleCity_House2_Text_18244E, 4
	checkitem ITEM_HARBOR_MAIL, 1
	compare RESULT, 1
	goto_if_eq MauvilleCity_House2_EventScript_1572E5
	release
	end

MauvilleCity_House2_EventScript_1572E5:: @ 81572E5
	playse SE_PIN
	applymovement LAST_TALKED, MauvilleCity_House2_Movement_1A0833
	waitmovement 0
	applymovement LAST_TALKED, MauvilleCity_House2_Movement_1A0835
	waitmovement 0
	msgbox MauvilleCity_House2_Text_1824D8, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq MauvilleCity_House2_EventScript_15731B
	compare RESULT, NO
	goto_if_eq MauvilleCity_House2_EventScript_157347
	end

MauvilleCity_House2_EventScript_15731B:: @ 815731B
	msgbox MauvilleCity_House2_Text_182515, 4
	takeitem ITEM_HARBOR_MAIL, 1
	giveitem_std ITEM_COIN_CASE
	setflag FLAG_RECEIVED_COIN_CASE
	goto MauvilleCity_House2_EventScript_15733D
	end

MauvilleCity_House2_EventScript_15733D:: @ 815733D
	msgbox MauvilleCity_House2_Text_182549, 4
	release
	end

MauvilleCity_House2_EventScript_157347:: @ 8157347
	msgbox MauvilleCity_House2_Text_182578, 4
	release
	end
