MauvilleCity_House1_MapScripts:: @ 81569FC
	.byte 0

MauvilleCity_House1_EventScript_1569FD:: @ 81569FD
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_HM06, MauvilleCity_House1_EventScript_156A29
	msgbox MauvilleCity_House1_Text_181B1A, 4
	giveitem_std ITEM_HM06_ROCK_SMASH
	setflag FLAG_RECEIVED_HM06
	msgbox MauvilleCity_House1_Text_181B64, 4
	release
	end

MauvilleCity_House1_EventScript_156A29:: @ 8156A29
	msgbox MauvilleCity_House1_Text_181BF6, 4
	release
	end
