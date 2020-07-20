ProfBirch_EventScript_UpdateLocation:: @ 81A02F4
	compare VAR_PETALBURG_GYM_STATE, 0
	goto_if_eq Common_EventScript_Return
	compare VAR_BIRCH_STATE, 0
	call_if_eq ProfBirch_EventScript_MoveToLab
	compare VAR_BIRCH_STATE, 1
	call_if_eq ProfBirch_EventScript_MoveToLab
	compare VAR_BIRCH_STATE, 2
	call_if_eq ProfBirch_EventScript_MoveToRoute101
	compare VAR_BIRCH_STATE, 3
	call_if_eq ProfBirch_EventScript_MoveToRoute101
	compare VAR_BIRCH_STATE, 4
	call_if_eq ProfBirch_EventScript_MoveToRoute103
	compare VAR_BIRCH_STATE, 5
	call_if_eq ProfBirch_EventScript_MoveToRoute103
	compare VAR_BIRCH_STATE, 6
	call_if_eq ProfBirch_EventScript_MoveToLab
	compare VAR_BIRCH_STATE, 7
	call_if_eq ProfBirch_EventScript_MoveToLab
	return

ProfBirch_EventScript_MoveToLab:: @ 81A0358
	clearflag FLAG_HIDE_BIRCH_IN_LAB
	clearflag FLAG_UNKNOWN_BIRCH_380
	setflag FLAG_HIDE_BIRCH_ROUTE101
	setflag FLAG_HIDE_BIRCH_ROUTE103
	return

ProfBirch_EventScript_MoveToRoute101:: @ 81A0365
	clearflag FLAG_HIDE_BIRCH_ROUTE101
	setflag FLAG_HIDE_BIRCH_IN_LAB
	setflag FLAG_UNKNOWN_BIRCH_380
	setflag FLAG_HIDE_BIRCH_ROUTE103
	return

ProfBirch_EventScript_MoveToRoute103:: @ 81A0372
	clearflag FLAG_HIDE_BIRCH_ROUTE103
	setflag FLAG_HIDE_BIRCH_ROUTE101
	setflag FLAG_HIDE_BIRCH_IN_LAB
	setflag FLAG_UNKNOWN_BIRCH_380
	return

ProfBirch_EventScript_AskRatePokedex:: @ 81A037F
	lock
	faceplayer
	msgbox gBirchDexRatingText_ComeToShowMePokedex, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq ProfBirch_EventScript_DeclineRating
	call ProfBirch_EventScript_RatePokedex
	release
	end

ProfBirch_EventScript_DeclineRating:: @ 81A039B
	msgbox gBirchDexRatingText_Cancel, MSGBOX_DEFAULT
	release
	end

ProfBirch_EventScript_ShowRatingMessage:: @ 81A03A5
	copyvar VAR_0x8004, VAR_0x8009
	special ShowPokedexRatingMessage
	waitmessage
	waitbuttonpress
	return

ProfBirch_EventScript_RatePokedex:: @ 81A03B0
	setvar VAR_0x8004, 0
	specialvar VAR_RESULT, ScriptGetPokedexInfo
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	copyvar VAR_0x800A, VAR_RESULT
	buffernumberstring 0, VAR_0x8008  @ Num Hoenn seen
	buffernumberstring 1, VAR_0x8009  @ Num Hoenn caught
	msgbox gBirchDexRatingText_SoYouveSeenAndCaught, MSGBOX_DEFAULT
	call ProfBirch_EventScript_ShowRatingMessage
	compare VAR_0x800A, 0
	goto_if_eq Common_EventScript_Return  @ National dex not enabled
	setvar VAR_0x8004, 1
	specialvar VAR_RESULT, ScriptGetPokedexInfo
	copyvar VAR_0x8008, VAR_0x8005
	copyvar VAR_0x8009, VAR_0x8006
	buffernumberstring 0, VAR_0x8008  @ Num National seen
	buffernumberstring 1, VAR_0x8009  @ Num National caught
	msgbox gBirchDexRatingText_OnANationwideBasis, MSGBOX_DEFAULT
	return
