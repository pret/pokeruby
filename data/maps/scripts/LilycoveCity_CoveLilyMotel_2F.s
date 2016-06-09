LilycoveCity_CoveLilyMotel_2F_MapScripts:: @ 81583A0
	.byte 0

LilycoveCity_CoveLilyMotel_2F_EventScript_1583A1:: @ 81583A1
	lock
	faceplayer
	checkflag 2
	callif 0, LilycoveCity_CoveLilyMotel_2F_EventScript_1583C7
	checkflag 2
	callif 1, LilycoveCity_CoveLilyMotel_2F_EventScript_1583DD
	specialval RESULT, 335
	compare RESULT, 1
	jumpeq LilycoveCity_CoveLilyMotel_2F_EventScript_1583D0
	release
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583C7:: @ 81583C7
	loadptr 0, LilycoveCity_CoveLilyMotel_2F_Text_186FE7
	callstd 4
	return

LilycoveCity_CoveLilyMotel_2F_EventScript_1583D0:: @ 81583D0
	setflag 2
	fanfare 370
	waitfanfare
	jump LilycoveCity_CoveLilyMotel_2F_EventScript_1583DD
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583DD:: @ 81583DD
	message LilycoveCity_CoveLilyMotel_2F_Text_18708F
	waittext
	call LilycoveCity_CoveLilyMotel_2F_EventScript_1A02C5
	special 264
	waitstate
	release
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583EE:: @ 81583EE
	loadptr 0, LilycoveCity_CoveLilyMotel_2F_Text_187149
	callstd 2
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583F7:: @ 81583F7
	loadptr 0, LilycoveCity_CoveLilyMotel_2F_Text_18719E
	callstd 2
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158400:: @ 8158400
	loadptr 0, LilycoveCity_CoveLilyMotel_2F_Text_1871DF
	callstd 2
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158409:: @ 8158409
	loadptr 0, LilycoveCity_CoveLilyMotel_2F_Text_18729A
	callstd 2
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158412:: @ 8158412
	loadptr 0, LilycoveCity_CoveLilyMotel_2F_Text_1872D4
	callstd 2
	end

