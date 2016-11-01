	.include "asm/macros.inc"
	.include "constants/constants.inc"
	.include "asm/macros/battle_script.inc"

	.section script_data, "aw", %progbits

	.align 2
gUnknown_081D9E48:: @ 81D9E48
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EBC
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8
	.4byte BattleScript_1D9EA8

gUnknown_081D9E7C:: @ 81D9E7C
	.4byte BattleScript_1D9F45
	.4byte BattleScript_1D9F4F
	.4byte BattleScript_1D9F4F
	.4byte BattleScript_1D9F7B
	.4byte BattleScript_1D9F9C
	.4byte BattleScript_1D9FBB

gUnknown_081D9E94:: @ 81D9E94
	.4byte BattleScript_1D9FDA

gUnknown_081D9E98:: @ 81D9E98
	.4byte BattleScript_1D9FE4
	.4byte BattleScript_1D9FEB
	.4byte BattleScript_1D9FF4
	.4byte BattleScript_1DA00A

BattleScript_1D9EA8: @ 81D9EA8
	jumpifhalfword 4, 0x20239f8, 512, BattleScript_1D9EB8
	printstring BATTLE_TEXT_Used1
	pokemoncatchfunction

BattleScript_1D9EB8: @ 81D9EB8
	printstring BATTLE_TEXT_TutorialUsed
	pokemoncatchfunction

BattleScript_1D9EBC: @ 81D9EBC
	printstring BATTLE_TEXT_Used1
	atk98 1
	pokemoncatchfunction

gUnknown_081D9EC2:: @ 81D9EC2
	jumpifhalfword 0, 0x2024c04, 5, BattleScript_1D9ED0
	atk60 11

BattleScript_1D9ED0: @ 81D9ED0
	printstring BATTLE_TEXT_BallCaught1
	capturesomethingf1 BattleScript_1D9EE3
	printstring BATTLE_TEXT_AddedToDex
	waitstateatk
	setbyte 0x2024d1e, 0
	capturesomethingf2

BattleScript_1D9EE3: @ 81D9EE3
	printstring BATTLE_TEXT_GiveNickname
	waitstateatk
	setbyte 0x2024d1e, 0
	capturesomethingf3 BattleScript_1D9EF8
	printstring BATTLE_TEXT_SentToPC
	waitmessage 64

BattleScript_1D9EF8: @ 81D9EF8
	catchpoke
	setbyte 0x2024d26, 7
	activesidesomething

gUnknown_081D9F00:: @ 81D9F00
	printstring BATTLE_TEXT_BallCaught2
	setbyte 0x2024d26, 7
	activesidesomething

gUnknown_081D9F0A:: @ 81D9F0A
	printfromtable BattleTextList_4015E6
	waitmessage 64
	jumpifbyte 5, 0x20239f8, 128, BattleScript_1D9F34
	jumpifbyte 1, 0x2038808, 0, BattleScript_1D9F34
	printstring BATTLE_TEXT_SafariOver
	waitmessage 64
	setbyte 0x2024d26, 8

BattleScript_1D9F34: @ 81D9F34
	atkf6

gUnknown_081D9F35:: @ 81D9F35
	waitmessage 64
	printstring BATTLE_TEXT_BlockBall
	waitmessage 64
	printstring BATTLE_TEXT_DontBeAThief
	waitmessage 64
	atkf6

BattleScript_1D9F45: @ 81D9F45
	setbyte 0x201600c, 15
	atk49 1, 0
	end

BattleScript_1D9F4F: @ 81D9F4F
	pause 48
	atk54 1
	printstring BATTLE_TEXT_Used2
	waitmessage 64
	atk75
	orword 0x2024c6c, 0x100
	graphicalhpupdate USER
	datahpupdate USER
	printstring BATTLE_TEXT_RestoredHealth
	waitmessage 64
	atk98 1
	setbyte 0x201600c, 15
	atk49 1, 0
	atkf6

BattleScript_1D9F7B: @ 81D9F7B
	pause 48
	atk54 1
	printstring BATTLE_TEXT_Used2
	waitmessage 64
	atk75
	printfromtable BattleTextList_401620
	waitmessage 64
	atk98 1
	setbyte 0x201600c, 15
	atk49 1, 0
	atkf6

BattleScript_1D9F9C: @ 81D9F9C
	pause 48
	atk54 1
	printstring BATTLE_TEXT_Used2
	waitmessage 64
	atk75
	printfromtable BattleTextList_401570
	waitmessage 64
	setbyte 0x201600c, 15
	atk49 1, 0
	atkf6

BattleScript_1D9FBB: @ 81D9FBB
	pause 48
	atk54 1
	printstring BATTLE_TEXT_Used2
	waitmessage 64
	atk75
	printfromtable BattleTextList_4015A0
	waitmessage 64
	setbyte 0x201600c, 15
	atk49 1, 0
	atkf6

BattleScript_1D9FDA: @ 81D9FDA
	atk54 17
	setbyte 0x2024d26, 4
	activesidesomething

BattleScript_1D9FE4: @ 81D9FE4
	printstring BATTLE_TEXT_WatchingCarefully
	waitmessage 64
	end2

BattleScript_1D9FEB: @ 81D9FEB
	printfromtable BattleTextList_401616
	waitmessage 64
	end2

BattleScript_1D9FF4: @ 81D9FF4
	printstring BATTLE_TEXT_ThrewBlock
	waitmessage 64
	playanimation USER, 4, 0x0
	printfromtable BattleTextList_40161A
	waitmessage 64
	end2

BattleScript_1DA00A: @ 81DA00A
	printstring 2
	waitmessage 64
	atk4b
	waitstateatk
	atk53 0
	waitstateatk
	printstring BATTLE_TEXT_WallyBall
	waitmessage 64
	end2
