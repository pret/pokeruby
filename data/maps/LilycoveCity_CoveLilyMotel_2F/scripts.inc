LilycoveCity_CoveLilyMotel_2F_MapScripts:: @ 81583A0
	.byte 0

LilycoveCity_CoveLilyMotel_2F_EventScript_1583A1:: @ 81583A1
	lock
	faceplayer
	call_if_unset FLAG_TEMP_2, LilycoveCity_CoveLilyMotel_2F_EventScript_1583C7
	call_if_set FLAG_TEMP_2, LilycoveCity_CoveLilyMotel_2F_EventScript_1583DD
	specialvar RESULT, CompletedHoennPokedex
	compare RESULT, 1
	goto_if_eq LilycoveCity_CoveLilyMotel_2F_EventScript_1583D0
	release
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583C7:: @ 81583C7
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_186FE7, 4
	return

LilycoveCity_CoveLilyMotel_2F_EventScript_1583D0:: @ 81583D0
	setflag FLAG_TEMP_2
	playfanfare MUS_FANFA4
	waitfanfare
	goto LilycoveCity_CoveLilyMotel_2F_EventScript_1583DD
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583DD:: @ 81583DD
	message LilycoveCity_CoveLilyMotel_2F_Text_18708F
	waitmessage
	call LilycoveCity_CoveLilyMotel_2F_EventScript_1A02C5
	special ScrSpecial_ShowDiploma
	waitstate
	release
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583EE:: @ 81583EE
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_187149, 2
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583F7:: @ 81583F7
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_18719E, 2
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158400:: @ 8158400
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_1871DF, 2
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158409:: @ 8158409
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_18729A, 2
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158412:: @ 8158412
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_1872D4, 2
	end
