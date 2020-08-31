LilycoveCity_CoveLilyMotel_2F_MapScripts:: @ 81583A0
	.byte 0

LilycoveCity_CoveLilyMotel_2F_EventScript_1583A1:: @ 81583A1
	lock
	faceplayer
	call_if_unset FLAG_TEMP_2, LilycoveCity_CoveLilyMotel_2F_EventScript_1583C7
	call_if_set FLAG_TEMP_2, LilycoveCity_CoveLilyMotel_2F_EventScript_1583DD
	specialvar VAR_RESULT, CompletedHoennPokedex
	compare VAR_RESULT, 1
	goto_if_eq LilycoveCity_CoveLilyMotel_2F_EventScript_1583D0
	release
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583C7:: @ 81583C7
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_186FE7, MSGBOX_DEFAULT
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
	call Common_EventScript_PlayGymBadgeFanfare
	special ScrSpecial_ShowDiploma
	waitstate
	release
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583EE:: @ 81583EE
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_187149, MSGBOX_NPC
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_1583F7:: @ 81583F7
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_18719E, MSGBOX_NPC
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158400:: @ 8158400
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_1871DF, MSGBOX_NPC
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158409:: @ 8158409
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_18729A, MSGBOX_NPC
	end

LilycoveCity_CoveLilyMotel_2F_EventScript_158412:: @ 8158412
	msgbox LilycoveCity_CoveLilyMotel_2F_Text_1872D4, MSGBOX_NPC
	end
