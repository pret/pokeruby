Route102_MapScripts:: @ 814EAD9
	.byte 0

Route102_EventScript_14EADA:: @ 814EADA
	loadptr 0, Route102_Text_16D431
	callstd 2
	end

Route102_EventScript_14EAE3:: @ 814EAE3
	loadptr 0, Route102_Text_16D547
	callstd 3
	end

Route102_EventScript_14EAEC:: @ 814EAEC
	loadptr 0, Route102_Text_16D55F
	callstd 3
	end

Route102_EventScript_14EAF5:: @ 814EAF5
	loadptr 0, Route102_Text_16D51A
	callstd 2
	end

Route102_EventScript_14EAFE:: @ 814EAFE
	trainerbattle 0, 318, 0, Route102_Text_1B79C3, Route102_Text_1B7A2C
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route102_EventScript_14EB25
	loadptr 0, Route102_Text_1B7A60
	callstd 6
	end

Route102_EventScript_14EB25:: @ 814EB25
	trainerbattle 5, 318, 0, Route102_Text_1B7A9F, Route102_Text_1B7AFD
	loadptr 0, Route102_Text_1B7B2F
	callstd 6
	end

Route102_EventScript_14EB3C:: @ 814EB3C
	trainerbattle 0, 615, 0, Route102_Text_1B7C05, Route102_Text_1B7C40
	loadptr 0, Route102_Text_1B7C52
	callstd 6
	end

Route102_EventScript_14EB53:: @ 814EB53
	trainerbattle 0, 603, 0, Route102_Text_1B7C97, Route102_Text_1B7CEC
	loadptr 0, Route102_Text_1B7D11
	callstd 6
	end

Route102_EventScript_14EB6A:: @ 814EB6A
	trainerbattle 0, 333, 0, Route102_Text_1B7B68, Route102_Text_1B7B9D
	loadptr 0, Route102_Text_1B7BD0
	callstd 6
	end

