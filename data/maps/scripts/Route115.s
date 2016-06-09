Route115_MapScripts:: @ 815092D
	.byte 0

Route115_EventScript_15092E:: @ 815092E
	loadptr 0, Route115_Text_170273
	callstd 2
	end

Route115_EventScript_150937:: @ 8150937
	loadptr 0, Route115_Text_1702E7
	callstd 3
	end

Route115_EventScript_150940:: @ 8150940
	loadptr 0, Route115_Text_170301
	callstd 3
	end

Route115_EventScript_150949:: @ 8150949
	trainerbattle 0, 307, 0, Route115_Text_1BC9AC, Route115_Text_1BC9E6
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route115_EventScript_150970
	loadptr 0, Route115_Text_1BCA0E
	callstd 6
	end

Route115_EventScript_150970:: @ 8150970
	trainerbattle 5, 307, 0, Route115_Text_1BCA6B, Route115_Text_1BCAB3
	loadptr 0, Route115_Text_1BCAC6
	callstd 6
	end

Route115_EventScript_150987:: @ 8150987
	trainerbattle 0, 182, 0, Route115_Text_1BCB0D, Route115_Text_1BCB2E
	loadptr 0, Route115_Text_1BCB40
	callstd 6
	end

Route115_EventScript_15099E:: @ 815099E
	trainerbattle 0, 183, 0, Route115_Text_1BCB8A, Route115_Text_1BCBC1
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route115_EventScript_1509C5
	loadptr 0, Route115_Text_1BCBDE
	callstd 6
	end

Route115_EventScript_1509C5:: @ 81509C5
	trainerbattle 5, 183, 0, Route115_Text_1BCC4C, Route115_Text_1BCCA2
	loadptr 0, Route115_Text_1BCCBA
	callstd 6
	end

Route115_EventScript_1509DC:: @ 81509DC
	trainerbattle 0, 427, 0, Route115_Text_1BCCF4, Route115_Text_1BCD32
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route115_EventScript_150A03
	loadptr 0, Route115_Text_1BCD4C
	callstd 6
	end

Route115_EventScript_150A03:: @ 8150A03
	trainerbattle 5, 427, 0, Route115_Text_1BCDB0, Route115_Text_1BCDD0
	loadptr 0, Route115_Text_1BCDEF
	callstd 6
	end

Route115_EventScript_150A1A:: @ 8150A1A
	trainerbattle 0, 514, 0, Route115_Text_1BCEE0, Route115_Text_1BCF16
	loadptr 0, Route115_Text_1BCF3D
	callstd 6
	end

