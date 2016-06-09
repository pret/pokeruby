Route124_MapScripts:: @ 8151DDF
	map_script 3, Route124_MapScript1_151DE5
	.byte 0

Route124_MapScript1_151DE5:: @ 8151DE5
	checkflag 2090
	callif 1, Route124_EventScript_1A02C1
	end

Route124_EventScript_151DEF:: @ 8151DEF
	loadptr 0, Route124_Text_171ED1
	callstd 3
	end

Route124_EventScript_151DF8:: @ 8151DF8
	trainerbattle 0, 159, 0, Route124_Text_1C0624, Route124_Text_1C0675
	loadptr 0, Route124_Text_1C0693
	callstd 6
	end

Route124_EventScript_151E0F:: @ 8151E0F
	trainerbattle 0, 160, 0, Route124_Text_1C06F7, Route124_Text_1C0741
	loadptr 0, Route124_Text_1C0750
	callstd 6
	end

Route124_EventScript_151E26:: @ 8151E26
	trainerbattle 0, 449, 0, Route124_Text_1C07B4, Route124_Text_1C07F9
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route124_EventScript_151E4D
	loadptr 0, Route124_Text_1C080E
	callstd 6
	end

Route124_EventScript_151E4D:: @ 8151E4D
	trainerbattle 5, 449, 0, Route124_Text_1C0888, Route124_Text_1C08C8
	loadptr 0, Route124_Text_1C08EA
	callstd 6
	end

Route124_EventScript_151E64:: @ 8151E64
	trainerbattle 0, 450, 0, Route124_Text_1C0936, Route124_Text_1C096B
	loadptr 0, Route124_Text_1C0994
	callstd 6
	end

Route124_EventScript_151E7B:: @ 8151E7B
	trainerbattle 0, 174, 0, Route124_Text_1C09CE, Route124_Text_1C0A2F
	loadptr 0, Route124_Text_1C0A52
	callstd 6
	end

Route124_EventScript_151E92:: @ 8151E92
	trainerbattle 4, 687, 0, Route124_Text_1C0ABD, Route124_Text_1C0B36, Route124_Text_1C0BC8
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route124_EventScript_151EBD
	loadptr 0, Route124_Text_1C0B72
	callstd 6
	end

Route124_EventScript_151EBD:: @ 8151EBD
	trainerbattle 7, 687, 0, Route124_Text_1C0D1F, Route124_Text_1C0DB5, Route124_Text_1C0E5C
	loadptr 0, Route124_Text_1C0E06
	callstd 6
	end

Route124_EventScript_151ED8:: @ 8151ED8
	trainerbattle 4, 687, 0, Route124_Text_1C0C0E, Route124_Text_1C0C4F, Route124_Text_1C0CE0
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route124_EventScript_151F03
	loadptr 0, Route124_Text_1C0C7F
	callstd 6
	end

Route124_EventScript_151F03:: @ 8151F03
	trainerbattle 7, 687, 0, Route124_Text_1C0EA2, Route124_Text_1C0EE5, Route124_Text_1C0F90
	loadptr 0, Route124_Text_1C0F19
	callstd 6
	end

