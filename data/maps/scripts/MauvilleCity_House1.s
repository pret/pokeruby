MauvilleCity_House1_MapScripts:: @ 81569FC
	.byte 0

MauvilleCity_House1_EventScript_1569FD:: @ 81569FD
	lock
	faceplayer
	checkflag 107
	jumpeq MauvilleCity_House1_EventScript_156A29
	loadptr 0, MauvilleCity_House1_Text_181B1A
	callstd 4
	setorcopyvar 0x8000, 0x158
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 107
	loadptr 0, MauvilleCity_House1_Text_181B64
	callstd 4
	release
	end

MauvilleCity_House1_EventScript_156A29:: @ 8156A29
	loadptr 0, MauvilleCity_House1_Text_181BF6
	callstd 4
	release
	end

