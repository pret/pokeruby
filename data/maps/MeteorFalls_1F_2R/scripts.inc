MeteorFalls_1F_2R_MapScripts:: @ 815C678
	.byte 0

MeteorFalls_1F_2R_EventScript_15C679:: @ 815C679
	trainerbattle 0, TRAINER_NICOLAS_1, 0, MeteorFalls_1F_2R_Text_1939C5, MeteorFalls_1F_2R_Text_193A35
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq MeteorFalls_1F_2R_EventScript_15C6A0
	msgbox MeteorFalls_1F_2R_Text_193A60, 6
	end

MeteorFalls_1F_2R_EventScript_15C6A0:: @ 815C6A0
	trainerbattle 5, TRAINER_NICOLAS_1, 0, MeteorFalls_1F_2R_Text_193AB3, MeteorFalls_1F_2R_Text_193B21
	msgbox MeteorFalls_1F_2R_Text_193B4C, 6
	end

MeteorFalls_1F_2R_EventScript_15C6B7:: @ 815C6B7
	trainerbattle 4, TRAINER_JOHN_AND_JAY_1, 0, MeteorFalls_1F_2R_Text_193BB7, MeteorFalls_1F_2R_Text_193C10, MeteorFalls_1F_2R_Text_193C9F
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq MeteorFalls_1F_2R_EventScript_15C6E2
	msgbox MeteorFalls_1F_2R_Text_193C35, 6
	end

MeteorFalls_1F_2R_EventScript_15C6E2:: @ 815C6E2
	trainerbattle 7, TRAINER_JOHN_AND_JAY_1, 0, MeteorFalls_1F_2R_Text_193E75, MeteorFalls_1F_2R_Text_193ECE, MeteorFalls_1F_2R_Text_193F59
	msgbox MeteorFalls_1F_2R_Text_193EF3, 6
	end

MeteorFalls_1F_2R_EventScript_15C6FD:: @ 815C6FD
	trainerbattle 4, TRAINER_JOHN_AND_JAY_1, 0, MeteorFalls_1F_2R_Text_193D10, MeteorFalls_1F_2R_Text_193D6E, MeteorFalls_1F_2R_Text_193DFB
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq MeteorFalls_1F_2R_EventScript_15C728
	msgbox MeteorFalls_1F_2R_Text_193D9A, 6
	end

MeteorFalls_1F_2R_EventScript_15C728:: @ 815C728
	trainerbattle 7, TRAINER_JOHN_AND_JAY_1, 0, MeteorFalls_1F_2R_Text_193FCA, MeteorFalls_1F_2R_Text_19403A, MeteorFalls_1F_2R_Text_1940DF
	msgbox MeteorFalls_1F_2R_Text_194066, 6
	end
