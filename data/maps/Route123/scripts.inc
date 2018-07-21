Route123_MapScripts:: @ 8151C53
	map_script 3, Route123_MapScript1_151C59
	.byte 0

Route123_MapScript1_151C59:: @ 8151C59
	special SetRoute123Weather
	end

Route123_EventScript_151C5D:: @ 8151C5D
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_TM19, Route123_EventScript_151CAC
	msgbox Route123_Text_171D83, 4
	special IsGrassTypeInParty
	compare RESULT, 0
	goto_if_eq Route123_EventScript_151CAA
	msgbox Route123_Text_171DC2, 4
	giveitem_std ITEM_TM19_GIGA_DRAIN
	compare RESULT, 0
	goto_if_eq Route123_EventScript_1A029B
	setflag FLAG_RECEIVED_TM19
	msgbox Route123_Text_171E34, 4
	release
	end

Route123_EventScript_151CAA:: @ 8151CAA
	release
	end

Route123_EventScript_151CAC:: @ 8151CAC
	msgbox Route123_Text_171E34, 4
	release
	end

Route123_EventScript_151CB6:: @ 8151CB6
	msgbox Route123_Text_171E76, 3
	end

Route123_EventScript_151CBF:: @ 8151CBF
	msgbox Route123_Text_171E8E, 3
	end

Route123_EventScript_151CC8:: @ 8151CC8
	msgbox Route123_Text_171EBC, 3
	end

Route123_EventScript_151CD1:: @ 8151CD1
	trainerbattle 0, TRAINER_WENDY, 0, Route123_Text_1BFF6A, Route123_Text_1BFFA2
	msgbox Route123_Text_1BFFC1, 6
	end

Route123_EventScript_151CE8:: @ 8151CE8
	trainerbattle 0, TRAINER_CLYDE, 0, Route123_Text_1BFFF0, Route123_Text_1C0057
	msgbox Route123_Text_1C0075, 6
	end

Route123_EventScript_151CFF:: @ 8151CFF
	trainerbattle 0, TRAINER_VIOLET, 0, Route123_Text_1C009E, Route123_Text_1C00D4
	msgbox Route123_Text_1C0100, 6
	end

Route123_EventScript_151D16:: @ 8151D16
	trainerbattle 0, TRAINER_CAMERON_1, 0, Route123_Text_1C013F, Route123_Text_1C01A3
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route123_EventScript_151D3D
	msgbox Route123_Text_1C01B1, 6
	end

Route123_EventScript_151D3D:: @ 8151D3D
	trainerbattle 5, TRAINER_CAMERON_1, 0, Route123_Text_1C01F9, Route123_Text_1C0240
	msgbox Route123_Text_1C024E, 6
	end

Route123_EventScript_151D54:: @ 8151D54
	trainerbattle 0, TRAINER_JACKI_1, 0, Route123_Text_1C028C, Route123_Text_1C0303
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route123_EventScript_151D7B
	msgbox Route123_Text_1C030F, 6
	end

Route123_EventScript_151D7B:: @ 8151D7B
	trainerbattle 5, TRAINER_JACKI_1, 0, Route123_Text_1C0351, Route123_Text_1C0380
	msgbox Route123_Text_1C038C, 6
	end

Route123_EventScript_151D92:: @ 8151D92
	trainerbattle 4, TRAINER_MIU_AND_YUKI, 0, Route123_Text_1C03CB, Route123_Text_1C040E, Route123_Text_1C0462
	msgbox Route123_Text_1C0423, 6
	end

Route123_EventScript_151DAD:: @ 8151DAD
	trainerbattle 4, TRAINER_MIU_AND_YUKI, 0, Route123_Text_1C049C, Route123_Text_1C04CD, Route123_Text_1C0519
	msgbox Route123_Text_1C04E3, 6
	end

Route123_EventScript_151DC8:: @ 8151DC8
	trainerbattle 0, TRAINER_KINDRA, 0, Route123_Text_1C0554, Route123_Text_1C059F
	msgbox Route123_Text_1C05BC, 6
	end
