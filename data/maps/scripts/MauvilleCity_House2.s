MauvilleCity_House2_MapScripts:: @ 81572BF
	.byte 0

MauvilleCity_House2_EventScript_1572C0:: @ 81572C0
	lock
	faceplayer
	checkflag 258
	jumpeq MauvilleCity_House2_EventScript_15733D
	loadptr 0, MauvilleCity_House2_Text_18244E
	callstd 4
	checkitem ITEM_HARBOR_MAIL, 1
	compare RESULT, 1
	jumpeq MauvilleCity_House2_EventScript_1572E5
	release
	end

MauvilleCity_House2_EventScript_1572E5:: @ 81572E5
	playsfx 21
	move LAST_TALKED, MauvilleCity_House2_Movement_1A0833
	waitmove 0
	move LAST_TALKED, MauvilleCity_House2_Movement_1A0835
	waitmove 0
	loadptr 0, MauvilleCity_House2_Text_1824D8
	callstd 5
	compare RESULT, 1
	jumpeq MauvilleCity_House2_EventScript_15731B
	compare RESULT, 0
	jumpeq MauvilleCity_House2_EventScript_157347
	end

MauvilleCity_House2_EventScript_15731B:: @ 815731B
	loadptr 0, MauvilleCity_House2_Text_182515
	callstd 4
	removeitem ITEM_HARBOR_MAIL, 1
	setorcopyvar 0x8000, 0x104
	setorcopyvar 0x8001, 0x1
	callstd 0
	setflag 258
	jump MauvilleCity_House2_EventScript_15733D
	end

MauvilleCity_House2_EventScript_15733D:: @ 815733D
	loadptr 0, MauvilleCity_House2_Text_182549
	callstd 4
	release
	end

MauvilleCity_House2_EventScript_157347:: @ 8157347
	loadptr 0, MauvilleCity_House2_Text_182578
	callstd 4
	release
	end

