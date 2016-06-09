Route123_MapScripts:: @ 8151C53
	map_script 3, Route123_MapScript1_151C59
	.byte 0

Route123_MapScript1_151C59:: @ 8151C59
	special 325
	end

Route123_EventScript_151C5D:: @ 8151C5D
	lock
	faceplayer
	checkflag 232
	jumpeq Route123_EventScript_151CAC
	loadptr 0, Route123_Text_171D83
	callstd 4
	special 299
	compare RESULT, 0
	jumpeq Route123_EventScript_151CAA
	loadptr 0, Route123_Text_171DC2
	callstd 4
	setorcopyvar 0x8000, 0x133
	setorcopyvar 0x8001, 0x1
	callstd 0
	compare RESULT, 0
	jumpeq Route123_EventScript_1A029B
	setflag 232
	loadptr 0, Route123_Text_171E34
	callstd 4
	release
	end

Route123_EventScript_151CAA:: @ 8151CAA
	release
	end

Route123_EventScript_151CAC:: @ 8151CAC
	loadptr 0, Route123_Text_171E34
	callstd 4
	release
	end

Route123_EventScript_151CB6:: @ 8151CB6
	loadptr 0, Route123_Text_171E76
	callstd 3
	end

Route123_EventScript_151CBF:: @ 8151CBF
	loadptr 0, Route123_Text_171E8E
	callstd 3
	end

Route123_EventScript_151CC8:: @ 8151CC8
	loadptr 0, Route123_Text_171EBC
	callstd 3
	end

Route123_EventScript_151CD1:: @ 8151CD1
	trainerbattle 0, 92, 0, Route123_Text_1BFF6A, Route123_Text_1BFFA2
	loadptr 0, Route123_Text_1BFFC1
	callstd 6
	end

Route123_EventScript_151CE8:: @ 8151CE8
	trainerbattle 0, 75, 0, Route123_Text_1BFFF0, Route123_Text_1C0057
	loadptr 0, Route123_Text_1C0075
	callstd 6
	end

Route123_EventScript_151CFF:: @ 8151CFF
	trainerbattle 0, 39, 0, Route123_Text_1C009E, Route123_Text_1C00D4
	loadptr 0, Route123_Text_1C0100
	callstd 6
	end

Route123_EventScript_151D16:: @ 8151D16
	trainerbattle 0, 238, 0, Route123_Text_1C013F, Route123_Text_1C01A3
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route123_EventScript_151D3D
	loadptr 0, Route123_Text_1C01B1
	callstd 6
	end

Route123_EventScript_151D3D:: @ 8151D3D
	trainerbattle 5, 238, 0, Route123_Text_1C01F9, Route123_Text_1C0240
	loadptr 0, Route123_Text_1C024E
	callstd 6
	end

Route123_EventScript_151D54:: @ 8151D54
	trainerbattle 0, 249, 0, Route123_Text_1C028C, Route123_Text_1C0303
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route123_EventScript_151D7B
	loadptr 0, Route123_Text_1C030F
	callstd 6
	end

Route123_EventScript_151D7B:: @ 8151D7B
	trainerbattle 5, 249, 0, Route123_Text_1C0351, Route123_Text_1C0380
	loadptr 0, Route123_Text_1C038C
	callstd 6
	end

Route123_EventScript_151D92:: @ 8151D92
	trainerbattle 4, 484, 0, Route123_Text_1C03CB, Route123_Text_1C040E, Route123_Text_1C0462
	loadptr 0, Route123_Text_1C0423
	callstd 6
	end

Route123_EventScript_151DAD:: @ 8151DAD
	trainerbattle 4, 484, 0, Route123_Text_1C049C, Route123_Text_1C04CD, Route123_Text_1C0519
	loadptr 0, Route123_Text_1C04E3
	callstd 6
	end

Route123_EventScript_151DC8:: @ 8151DC8
	trainerbattle 0, 106, 0, Route123_Text_1C0554, Route123_Text_1C059F
	loadptr 0, Route123_Text_1C05BC
	callstd 6
	end

