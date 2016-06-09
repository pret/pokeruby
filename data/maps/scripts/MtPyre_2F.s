MtPyre_2F_MapScripts:: @ 815D36E
	map_script 2, MtPyre_2F_MapScript2_1C6BB5
	map_script 3, MtPyre_2F_MapScript1_1C6BBF
	map_script 5, MtPyre_2F_MapScript1_15D37E
	.byte 0

MtPyre_2F_MapScript1_15D37E:: @ 815D37E
	tileeffect 7
	warp5 MtPyre_1F, 255, 0, 0
	end

MtPyre_2F_EventScript_15D389:: @ 815D389
	loadptr 0, MtPyre_2F_Text_1965BB
	callstd 2
	end

MtPyre_2F_EventScript_15D392:: @ 815D392
	loadptr 0, MtPyre_2F_Text_196600
	callstd 2
	end

MtPyre_2F_EventScript_15D39B:: @ 815D39B
	trainerbattle 0, 145, 0, MtPyre_2F_Text_196674, MtPyre_2F_Text_1966BE
	loadptr 0, MtPyre_2F_Text_1966E7
	callstd 6
	end

MtPyre_2F_EventScript_15D3B2:: @ 815D3B2
	trainerbattle 4, 640, 0, MtPyre_2F_Text_1962C6, MtPyre_2F_Text_196358, MtPyre_2F_Text_1963CB
	loadptr 0, MtPyre_2F_Text_196368
	callstd 6
	end

MtPyre_2F_EventScript_15D3CD:: @ 815D3CD
	trainerbattle 4, 640, 0, MtPyre_2F_Text_196449, MtPyre_2F_Text_1964EB, MtPyre_2F_Text_196539
	loadptr 0, MtPyre_2F_Text_196504
	callstd 6
	end

