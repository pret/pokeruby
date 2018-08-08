Route104_Prototype_MapScripts:: @ 8160C4A
	.byte 0

Route104_Prototype_EventScript_160C4B:: @ 8160C4B
	lock
	faceplayer
	goto_if_trainer_not_defeated TRAINER_BRIANNA_1, Route104_Prototype_EventScript_160C99
	goto_if_trainer_not_defeated TRAINER_CINDY_2, Route104_Prototype_EventScript_160C99
	goto_if_trainer_not_defeated TRAINER_AMY_AND_LIV_3, Route104_Prototype_EventScript_160C99
	goto_if_trainer_not_defeated TRAINER_GINA_AND_MIA_2, Route104_Prototype_EventScript_160C99
	goto_if_trainer_not_defeated TRAINER_LUCAS_2, Route104_Prototype_EventScript_160C99
	goto_if_trainer_not_defeated TRAINER_MIKE_1, Route104_Prototype_EventScript_160C99
	setflag FLAG_ROUTE104_PROTOTYPE_COMPLETED_1
	msgbox Route104_Prototype_Text_19B267, 4
	goto_if_set FLAG_ROUTE104_PROTOTYPE_COMPLETED_2, Route104_Prototype_EventScript_160CFB
	release
	end

Route104_Prototype_EventScript_160C99:: @ 8160C99
	msgbox Route104_Prototype_Text_19B22E, 4
	release
	end

Route104_Prototype_EventScript_160CA3:: @ 8160CA3
	lock
	faceplayer
	goto_if_trainer_not_defeated TRAINER_BRIANNA_1, Route104_Prototype_EventScript_160CF1
	goto_if_trainer_not_defeated TRAINER_CINDY_2, Route104_Prototype_EventScript_160CF1
	goto_if_trainer_not_defeated TRAINER_AMY_AND_LIV_3, Route104_Prototype_EventScript_160CF1
	goto_if_trainer_not_defeated TRAINER_GINA_AND_MIA_2, Route104_Prototype_EventScript_160CF1
	goto_if_trainer_not_defeated TRAINER_LUCAS_2, Route104_Prototype_EventScript_160CF1
	goto_if_trainer_not_defeated TRAINER_MIKE_1, Route104_Prototype_EventScript_160CF1
	setflag FLAG_ROUTE104_PROTOTYPE_COMPLETED_2
	msgbox Route104_Prototype_Text_19B2E9, 4
	goto_if_set FLAG_ROUTE104_PROTOTYPE_COMPLETED_1, Route104_Prototype_EventScript_160CFB
	release
	end

Route104_Prototype_EventScript_160CF1:: @ 8160CF1
	msgbox Route104_Prototype_Text_19B2B6, 4
	release
	end

Route104_Prototype_EventScript_160CFB:: @ 8160CFB
	closemessage
	delay 60
	fadescreen 1
	delay 60
	special DoSoftReset
	waitstate
	release
	end

Route104_Prototype_EventScript_160D0A:: @ 8160D0A
	msgbox Route104_Prototype_Text_19B33B, 2
	end

Route104_Prototype_EventScript_160D13:: @ 8160D13
	msgbox Route104_Prototype_Text_19B37F, 2
	end

Route104_Prototype_EventScript_160D1C:: @ 8160D1C
	msgbox Route104_Prototype_Text_19B3DE, 3
	end

Route104_Prototype_EventScript_160D25:: @ 8160D25
	msgbox Route104_Prototype_Text_19B3FF, 3
	end

Route104_Prototype_EventScript_160D2E:: @ 8160D2E
	trainerbattle 0, TRAINER_CINDY_2, 0, Route104_Prototype_Text_19AD9B, Route104_Prototype_Text_19ADDA
	msgbox Route104_Prototype_Text_19ADF7, 6
	end

Route104_Prototype_EventScript_160D45:: @ 8160D45
	trainerbattle 4, TRAINER_AMY_AND_LIV_3, 0, Route104_Prototype_Text_19AE3E, Route104_Prototype_Text_19AE53, Route104_Prototype_Text_19AEA9
	msgbox Route104_Prototype_Text_19AE6A, 6
	end

Route104_Prototype_EventScript_160D60:: @ 8160D60
	trainerbattle 4, TRAINER_GINA_AND_MIA_2, 0, Route104_Prototype_Text_19B148, Route104_Prototype_Text_19B17D, Route104_Prototype_Text_19B1DD
	msgbox Route104_Prototype_Text_19B18D, 6
	end

Route104_Prototype_EventScript_160D7B:: @ 8160D7B
	trainerbattle 0, TRAINER_MIKE_1, 0, Route104_Prototype_Text_19AEFB, Route104_Prototype_Text_19AF3E
	msgbox Route104_Prototype_Text_19AF56, 6
	end

Route104_Prototype_EventScript_160D92:: @ 8160D92
	trainerbattle 0, TRAINER_BRIANNA_1, 0, Route104_Prototype_Text_19AF8A, Route104_Prototype_Text_19AFDB
	msgbox Route104_Prototype_Text_19B00D, 6
	end

Route104_Prototype_EventScript_160DA9:: @ 8160DA9
	trainerbattle 0, TRAINER_LUCAS_2, 0, Route104_Prototype_Text_19B066, Route104_Prototype_Text_19B0D7
	msgbox Route104_Prototype_Text_19B0EF, 6
	end
