MauvilleCity_House2_MapScripts:: @ 81572BF
	.byte 0

MauvilleCity_House2_EventScript_1572C0:: @ 81572C0
	lock
	faceplayer
	checkflag 258
	goto_if_eq MauvilleCity_House2_EventScript_15733D
	msgbox MauvilleCity_House2_Text_18244E, 4
	checkitem ITEM_HARBOR_MAIL, 1
	compare RESULT, 1
	goto_if_eq MauvilleCity_House2_EventScript_1572E5
	release
	end

MauvilleCity_House2_EventScript_1572E5:: @ 81572E5
	playsfx 21
	move LAST_TALKED, MauvilleCity_House2_Movement_1A0833
	waitmove 0
	move LAST_TALKED, MauvilleCity_House2_Movement_1A0835
	waitmove 0
	msgbox MauvilleCity_House2_Text_1824D8, 5
	compare RESULT, 1
	goto_if_eq MauvilleCity_House2_EventScript_15731B
	compare RESULT, 0
	goto_if_eq MauvilleCity_House2_EventScript_157347
	end

MauvilleCity_House2_EventScript_15731B:: @ 815731B
	msgbox MauvilleCity_House2_Text_182515, 4
	removeitem ITEM_HARBOR_MAIL, 1
	giveitem ITEM_COIN_CASE
	setflag 258
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
