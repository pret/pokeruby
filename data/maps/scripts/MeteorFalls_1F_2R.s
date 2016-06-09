MeteorFalls_1F_2R_MapScripts:: @ 815C678
	.byte 0

MeteorFalls_1F_2R_EventScript_15C679:: @ 815C679
	trainerbattle 0, 392, 0, MeteorFalls_1F_2R_Text_1939C5, MeteorFalls_1F_2R_Text_193A35
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq MeteorFalls_1F_2R_EventScript_15C6A0
	loadptr 0, MeteorFalls_1F_2R_Text_193A60
	callstd 6
	end

MeteorFalls_1F_2R_EventScript_15C6A0:: @ 815C6A0
	trainerbattle 5, 392, 0, MeteorFalls_1F_2R_Text_193AB3, MeteorFalls_1F_2R_Text_193B21
	loadptr 0, MeteorFalls_1F_2R_Text_193B4C
	callstd 6
	end

MeteorFalls_1F_2R_EventScript_15C6B7:: @ 815C6B7
	trainerbattle 4, 681, 0, MeteorFalls_1F_2R_Text_193BB7, MeteorFalls_1F_2R_Text_193C10, MeteorFalls_1F_2R_Text_193C9F
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq MeteorFalls_1F_2R_EventScript_15C6E2
	loadptr 0, MeteorFalls_1F_2R_Text_193C35
	callstd 6
	end

MeteorFalls_1F_2R_EventScript_15C6E2:: @ 815C6E2
	trainerbattle 7, 681, 0, MeteorFalls_1F_2R_Text_193E75, MeteorFalls_1F_2R_Text_193ECE, MeteorFalls_1F_2R_Text_193F59
	loadptr 0, MeteorFalls_1F_2R_Text_193EF3
	callstd 6
	end

MeteorFalls_1F_2R_EventScript_15C6FD:: @ 815C6FD
	trainerbattle 4, 681, 0, MeteorFalls_1F_2R_Text_193D10, MeteorFalls_1F_2R_Text_193D6E, MeteorFalls_1F_2R_Text_193DFB
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq MeteorFalls_1F_2R_EventScript_15C728
	loadptr 0, MeteorFalls_1F_2R_Text_193D9A
	callstd 6
	end

MeteorFalls_1F_2R_EventScript_15C728:: @ 815C728
	trainerbattle 7, 681, 0, MeteorFalls_1F_2R_Text_193FCA, MeteorFalls_1F_2R_Text_19403A, MeteorFalls_1F_2R_Text_1940DF
	loadptr 0, MeteorFalls_1F_2R_Text_194066
	callstd 6
	end

