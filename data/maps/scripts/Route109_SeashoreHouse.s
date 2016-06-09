Route109_SeashoreHouse_MapScripts:: @ 8160DCA
	map_script 3, Route109_SeashoreHouse_MapScript1_160DD0
	.byte 0

Route109_SeashoreHouse_MapScript1_160DD0:: @ 8160DD0
	setflag 2111
	end

Route109_SeashoreHouse_EventScript_160DD4:: @ 8160DD4
	lock
	faceplayer
	checkflag 140
	jumpeq Route109_SeashoreHouse_EventScript_160E36
	checkflag 141
	jumpeq Route109_SeashoreHouse_EventScript_160E08
	checkflag 2
	jumpeq Route109_SeashoreHouse_EventScript_160DFE
	loadptr 0, Route109_SeashoreHouse_Text_19B4D9
	callstd 4
	setflag 2
	release
	end

Route109_SeashoreHouse_EventScript_160DFE:: @ 8160DFE
	loadptr 0, Route109_SeashoreHouse_Text_19B5B9
	callstd 4
	release
	end

Route109_SeashoreHouse_EventScript_160E08:: @ 8160E08
	loadptr 0, Route109_SeashoreHouse_Text_19B609
	callstd 4
	setorcopyvar 0x8000, 0x1b
	setorcopyvar 0x8001, 0x6
	callstd 0
	compare RESULT, 0
	jumpeq Route109_SeashoreHouse_EventScript_160E2C
	setflag 140
	release
	end

Route109_SeashoreHouse_EventScript_160E2C:: @ 8160E2C
	loadptr 0, Route109_SeashoreHouse_Text_19B6BE
	callstd 4
	release
	end

Route109_SeashoreHouse_EventScript_160E36:: @ 8160E36
	showmoney 0, 0
	snop
	loadptr 0, Route109_SeashoreHouse_Text_19B702
	callstd 5
	compare RESULT, 1
	jumpeq Route109_SeashoreHouse_EventScript_160E5A
	loadptr 0, Route109_SeashoreHouse_Text_19B773
	callstd 4
	hidemoney 0, 0
	release
	end

Route109_SeashoreHouse_EventScript_160E5A:: @ 8160E5A
	checkmoney 0x12c, 0
	compare RESULT, 0
	jumpeq Route109_SeashoreHouse_EventScript_160E9E
	checkitemspace ITEM_SODA_POP, 1
	compare RESULT, 0
	jumpeq Route109_SeashoreHouse_EventScript_160EAB
	loadptr 0, Route109_SeashoreHouse_Text_19B74C
	callstd 4
	paymoney 0x12c, 0
	updatemoney 0, 0
	snop
	setorcopyvar 0x8000, 0x1b
	setorcopyvar 0x8001, 0x1
	callstd 0
	hidemoney 0, 0
	release
	end

Route109_SeashoreHouse_EventScript_160E9E:: @ 8160E9E
	loadptr 0, Route109_SeashoreHouse_Text_19B759
	callstd 4
	hidemoney 0, 0
	release
	end

Route109_SeashoreHouse_EventScript_160EAB:: @ 8160EAB
	loadptr 0, Route109_SeashoreHouse_Text_1A0CC2
	callstd 4
	hidemoney 0, 0
	release
	end

Route109_SeashoreHouse_EventScript_160EB8:: @ 8160EB8
	trainerbattle 2, 493, 0, Route109_SeashoreHouse_Text_19B809, Route109_SeashoreHouse_Text_19B869, Route109_SeashoreHouse_EventScript_160F09
	loadptr 0, Route109_SeashoreHouse_Text_19B89F
	callstd 6
	end

Route109_SeashoreHouse_EventScript_160ED3:: @ 8160ED3
	trainerbattle 2, 647, 0, Route109_SeashoreHouse_Text_19B8E5, Route109_SeashoreHouse_Text_19B949, Route109_SeashoreHouse_EventScript_160F09
	loadptr 0, Route109_SeashoreHouse_Text_19B955
	callstd 6
	end

Route109_SeashoreHouse_EventScript_160EEE:: @ 8160EEE
	trainerbattle 2, 65, 0, Route109_SeashoreHouse_Text_19B988, Route109_SeashoreHouse_Text_19B9C7, Route109_SeashoreHouse_EventScript_160F09
	loadptr 0, Route109_SeashoreHouse_Text_19B9E5
	callstd 6
	end

Route109_SeashoreHouse_EventScript_160F09:: @ 8160F09
	checktrainerflag 493
	jumpif 0, Route109_SeashoreHouse_EventScript_160F29
	checktrainerflag 647
	jumpif 0, Route109_SeashoreHouse_EventScript_160F29
	checktrainerflag 65
	jumpif 0, Route109_SeashoreHouse_EventScript_160F29
	setflag 141
	release
	end

Route109_SeashoreHouse_EventScript_160F29:: @ 8160F29
	release
	end

