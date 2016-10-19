MauvilleCity_House1_MapScripts:: @ 81569FC
	.byte 0

MauvilleCity_House1_EventScript_1569FD:: @ 81569FD
	lock
	faceplayer
	checkflag 107
	jumpif FLAG_IS_SET, MauvilleCity_House1_EventScript_156A29
	msgbox MauvilleCity_House1_Text_181B1A, 4
	giveitem ITEM_HM06
	setflag 107
	msgbox MauvilleCity_House1_Text_181B64, 4
	release
	end

MauvilleCity_House1_EventScript_156A29:: @ 8156A29
	msgbox MauvilleCity_House1_Text_181BF6, 4
	release
	end
