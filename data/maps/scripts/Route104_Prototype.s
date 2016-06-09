Route104_Prototype_MapScripts:: @ 8160C4A
	.byte 0

Route104_Prototype_EventScript_160C4B:: @ 8160C4B
	lock
	faceplayer
	checktrainerflag 116
	jumpif 0, Route104_Prototype_EventScript_160C99
	checktrainerflag 117
	jumpif 0, Route104_Prototype_EventScript_160C99
	checktrainerflag 485
	jumpif 0, Route104_Prototype_EventScript_160C99
	checktrainerflag 486
	jumpif 0, Route104_Prototype_EventScript_160C99
	checktrainerflag 633
	jumpif 0, Route104_Prototype_EventScript_160C99
	checktrainerflag 634
	jumpif 0, Route104_Prototype_EventScript_160C99
	setflag 215
	loadptr 0, Route104_Prototype_Text_19B267
	callstd 4
	checkflag 216
	jumpeq Route104_Prototype_EventScript_160CFB
	release
	end

Route104_Prototype_EventScript_160C99:: @ 8160C99
	loadptr 0, Route104_Prototype_Text_19B22E
	callstd 4
	release
	end

Route104_Prototype_EventScript_160CA3:: @ 8160CA3
	lock
	faceplayer
	checktrainerflag 116
	jumpif 0, Route104_Prototype_EventScript_160CF1
	checktrainerflag 117
	jumpif 0, Route104_Prototype_EventScript_160CF1
	checktrainerflag 485
	jumpif 0, Route104_Prototype_EventScript_160CF1
	checktrainerflag 486
	jumpif 0, Route104_Prototype_EventScript_160CF1
	checktrainerflag 633
	jumpif 0, Route104_Prototype_EventScript_160CF1
	checktrainerflag 634
	jumpif 0, Route104_Prototype_EventScript_160CF1
	setflag 216
	loadptr 0, Route104_Prototype_Text_19B2E9
	callstd 4
	checkflag 215
	jumpeq Route104_Prototype_EventScript_160CFB
	release
	end

Route104_Prototype_EventScript_160CF1:: @ 8160CF1
	loadptr 0, Route104_Prototype_Text_19B2B6
	callstd 4
	release
	end

Route104_Prototype_EventScript_160CFB:: @ 8160CFB
	closebutton
	pause 60
	fadescreen 1
	pause 60
	special 271
	waitstate
	release
	end

Route104_Prototype_EventScript_160D0A:: @ 8160D0A
	loadptr 0, Route104_Prototype_Text_19B33B
	callstd 2
	end

Route104_Prototype_EventScript_160D13:: @ 8160D13
	loadptr 0, Route104_Prototype_Text_19B37F
	callstd 2
	end

Route104_Prototype_EventScript_160D1C:: @ 8160D1C
	loadptr 0, Route104_Prototype_Text_19B3DE
	callstd 3
	end

Route104_Prototype_EventScript_160D25:: @ 8160D25
	loadptr 0, Route104_Prototype_Text_19B3FF
	callstd 3
	end

Route104_Prototype_EventScript_160D2E:: @ 8160D2E
	trainerbattle 0, 117, 0, Route104_Prototype_Text_19AD9B, Route104_Prototype_Text_19ADDA
	loadptr 0, Route104_Prototype_Text_19ADF7
	callstd 6
	end

Route104_Prototype_EventScript_160D45:: @ 8160D45
	trainerbattle 4, 485, 0, Route104_Prototype_Text_19AE3E, Route104_Prototype_Text_19AE53, Route104_Prototype_Text_19AEA9
	loadptr 0, Route104_Prototype_Text_19AE6A
	callstd 6
	end

Route104_Prototype_EventScript_160D60:: @ 8160D60
	trainerbattle 4, 486, 0, Route104_Prototype_Text_19B148, Route104_Prototype_Text_19B17D, Route104_Prototype_Text_19B1DD
	loadptr 0, Route104_Prototype_Text_19B18D
	callstd 6
	end

Route104_Prototype_EventScript_160D7B:: @ 8160D7B
	trainerbattle 0, 634, 0, Route104_Prototype_Text_19AEFB, Route104_Prototype_Text_19AF3E
	loadptr 0, Route104_Prototype_Text_19AF56
	callstd 6
	end

Route104_Prototype_EventScript_160D92:: @ 8160D92
	trainerbattle 0, 116, 0, Route104_Prototype_Text_19AF8A, Route104_Prototype_Text_19AFDB
	loadptr 0, Route104_Prototype_Text_19B00D
	callstd 6
	end

Route104_Prototype_EventScript_160DA9:: @ 8160DA9
	trainerbattle 0, 633, 0, Route104_Prototype_Text_19B066, Route104_Prototype_Text_19B0D7
	loadptr 0, Route104_Prototype_Text_19B0EF
	callstd 6
	end

