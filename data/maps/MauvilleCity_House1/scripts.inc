MauvilleCity_House1_MapScripts:: @ 81569FC
	.byte 0

MauvilleCity_House1_EventScript_RockSmashDude:: @ 81569FD
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_HM06, MauvilleCity_House1_EventScript_ReceivedRockSmash
	msgbox MauvilleCity_House1_Text_ImRockSmashDudeTakeThis, MSGBOX_DEFAULT
	giveitem ITEM_HM06_ROCK_SMASH
	setflag FLAG_RECEIVED_HM06
	msgbox MauvilleCity_House1_Text_ExplainRockSmash, MSGBOX_DEFAULT
	release
	end

MauvilleCity_House1_EventScript_ReceivedRockSmash:: @ 8156A29
	msgbox MauvilleCity_House1_Text_MonCanFlyOutOfSmashedRock, MSGBOX_DEFAULT
	release
	end
