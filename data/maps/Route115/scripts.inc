Route115_MapScripts:: @ 815092D
	.byte 0

Route115_EventScript_15092E:: @ 815092E
	msgbox Route115_Text_170273, 2
	end

Route115_EventScript_150937:: @ 8150937
	msgbox Route115_Text_1702E7, 3
	end

Route115_EventScript_150940:: @ 8150940
	msgbox Route115_Text_170301, 3
	end

Route115_EventScript_150949:: @ 8150949
	trainerbattle 0, TRAINER_TIMOTHY_1, 0, Route115_Text_1BC9AC, Route115_Text_1BC9E6
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route115_EventScript_150970
	msgbox Route115_Text_1BCA0E, 6
	end

Route115_EventScript_150970:: @ 8150970
	trainerbattle 5, TRAINER_TIMOTHY_1, 0, Route115_Text_1BCA6B, Route115_Text_1BCAB3
	msgbox Route115_Text_1BCAC6, 6
	end

Route115_EventScript_150987:: @ 8150987
	trainerbattle 0, TRAINER_KOICHI, 0, Route115_Text_1BCB0D, Route115_Text_1BCB2E
	msgbox Route115_Text_1BCB40, 6
	end

Route115_EventScript_15099E:: @ 815099E
	trainerbattle 0, TRAINER_NOB_1, 0, Route115_Text_1BCB8A, Route115_Text_1BCBC1
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route115_EventScript_1509C5
	msgbox Route115_Text_1BCBDE, 6
	end

Route115_EventScript_1509C5:: @ 81509C5
	trainerbattle 5, TRAINER_NOB_1, 0, Route115_Text_1BCC4C, Route115_Text_1BCCA2
	msgbox Route115_Text_1BCCBA, 6
	end

Route115_EventScript_1509DC:: @ 81509DC
	trainerbattle 0, TRAINER_CYNDY_1, 0, Route115_Text_1BCCF4, Route115_Text_1BCD32
	specialvar RESULT, ShouldTryRematchBattle
	compare RESULT, 1
	goto_if_eq Route115_EventScript_150A03
	msgbox Route115_Text_1BCD4C, 6
	end

Route115_EventScript_150A03:: @ 8150A03
	trainerbattle 5, TRAINER_CYNDY_1, 0, Route115_Text_1BCDB0, Route115_Text_1BCDD0
	msgbox Route115_Text_1BCDEF, 6
	end

Route115_EventScript_150A1A:: @ 8150A1A
.ifdef SAPPHIRE
	trainerbattle 0, TRAINER_514, 0, UnknownString_81BCE47, UnknownString_81BCE7D
	msgbox UnknownString_81BCEA4, 6
.else
	trainerbattle 0, TRAINER_514, 0, Route115_Text_1BCEE0, Route115_Text_1BCF16
	msgbox Route115_Text_1BCF3D, 6
.endc
	end
