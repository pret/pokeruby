Route117_MapScripts:: @ 8150D3A
	map_script 3, Route117_MapScript1_150D40
	.byte 0

Route117_MapScript1_150D40:: @ 8150D40
	call Route117_EventScript_150D46
	end

Route117_EventScript_150D46:: @ 8150D46
	checkflag 134
	jumpif 0, Route117_EventScript_150D56
	movespriteperm 3, 47, 6

Route117_EventScript_150D56:: @ 8150D56
	return

Route117_EventScript_150D57:: @ 8150D57
	msgbox Route117_Text_170CA7, 2
	end

Route117_EventScript_150D60:: @ 8150D60
	msgbox Route117_Text_170CEB, 2
	end

Route117_EventScript_150D69:: @ 8150D69
	msgbox Route117_Text_170C26, 2
	end

Route117_EventScript_150D72:: @ 8150D72
	msgbox Route117_Text_170D02, 3
	end

Route117_EventScript_150D7B:: @ 8150D7B
	msgbox Route117_Text_170D1E, 3
	end

Route117_EventScript_150D84:: @ 8150D84
	msgbox Route117_Text_170D38, 3
	end

Route117_EventScript_150D8D:: @ 8150D8D
	trainerbattle 0, 538, 0, Route117_Text_1BD49E, Route117_Text_1BD4D9
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route117_EventScript_150DB4
	msgbox Route117_Text_1BD4F9, 6
	end

Route117_EventScript_150DB4:: @ 8150DB4
	trainerbattle 5, 538, 0, Route117_Text_1BD569, Route117_Text_1BD5AB
	msgbox Route117_Text_1BD5F2, 6
	end

Route117_EventScript_150DCB:: @ 8150DCB
	trainerbattle 0, 545, 0, Route117_Text_1BD634, Route117_Text_1BD67B
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route117_EventScript_150DF2
	msgbox Route117_Text_1BD69B, 6
	end

Route117_EventScript_150DF2:: @ 8150DF2
	trainerbattle 5, 545, 0, Route117_Text_1BD6F2, Route117_Text_1BD733
	msgbox Route117_Text_1BD74F, 6
	end

Route117_EventScript_150E09:: @ 8150E09
	trainerbattle 0, 364, 0, Route117_Text_1BD79A, Route117_Text_1BD7E0
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route117_EventScript_150E30
	msgbox Route117_Text_1BD7F5, 6
	end

Route117_EventScript_150E30:: @ 8150E30
	trainerbattle 5, 364, 0, Route117_Text_1BD83F, Route117_Text_1BD8A2
	msgbox Route117_Text_1BD8BD, 6
	end

Route117_EventScript_150E47:: @ 8150E47
	trainerbattle 0, 369, 0, Route117_Text_1BD914, Route117_Text_1BD965
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route117_EventScript_150E6E
	msgbox Route117_Text_1BD98F, 6
	end

Route117_EventScript_150E6E:: @ 8150E6E
	trainerbattle 5, 369, 0, Route117_Text_1BD9F1, Route117_Text_1BDA41
	msgbox Route117_Text_1BDA6B, 6
	end

Route117_EventScript_150E85:: @ 8150E85
	trainerbattle 0, 227, 0, Route117_Text_1BDAA7, Route117_Text_1BDAFC
	msgbox Route117_Text_1BDB24, 6
	end

Route117_EventScript_150E9C:: @ 8150E9C
	trainerbattle 4, 287, 0, Route117_Text_1BDBC3, Route117_Text_1BDC07, Route117_Text_1BDC96
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route117_EventScript_150EC7
	msgbox Route117_Text_1BDC44, 6
	end

Route117_EventScript_150EC7:: @ 8150EC7
	trainerbattle 7, 287, 0, Route117_Text_1BDDEF, Route117_Text_1BDE2F, Route117_Text_1BDEA7
	msgbox Route117_Text_1BDE55, 6
	end

Route117_EventScript_150EE2:: @ 8150EE2
	trainerbattle 4, 287, 0, Route117_Text_1BDCD2, Route117_Text_1BDD1E, Route117_Text_1BDD8B
	specialval RESULT, 57
	compare RESULT, 1
	jumpeq Route117_EventScript_150F0D
	msgbox Route117_Text_1BDD4E, 6
	end

Route117_EventScript_150F0D:: @ 8150F0D
	trainerbattle 7, 287, 0, Route117_Text_1BDEE3, Route117_Text_1BDF26, Route117_Text_1BDF90
	msgbox Route117_Text_1BDF37, 6
	end

