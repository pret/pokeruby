LilycoveCity_MoveDeletersHouse_MapScripts:: @ 8159AAD
	.byte 0

LilycoveCity_MoveDeletersHouse_EventScript_159AAE:: @ 8159AAE
	lockall
	applymovement 1, LilycoveCity_MoveDeletersHouse_Movement_1A0839
	waitmovement 0
	msgbox LilycoveCity_MoveDeletersHouse_Text_18B622, MSGBOX_YESNO
	switch RESULT
	case YES, LilycoveCity_MoveDeletersHouse_EventScript_159ADE
	case NO, LilycoveCity_MoveDeletersHouse_EventScript_159B7B
	releaseall
	end

LilycoveCity_MoveDeletersHouse_EventScript_159ADE:: @ 8159ADE
	msgbox LilycoveCity_MoveDeletersHouse_Text_18B68C, 4
	special SelectMonForNPCTrade
	waitstate
	compare VAR_SPECIAL_4, 255
	goto_if_eq LilycoveCity_MoveDeletersHouse_EventScript_159B7B
	special IsSelectedMonEgg
	compare RESULT, 1
	goto_if_eq LilycoveCity_MoveDeletersHouse_EventScript_159B71
	special ScrSpecial_CountPokemonMoves
	compare RESULT, 1
	goto_if_eq LilycoveCity_MoveDeletersHouse_EventScript_159B64
	msgbox LilycoveCity_MoveDeletersHouse_Text_18B6B0, 4
	fadescreen 1
	special SelectMove
	fadescreen 0
	compare VAR_SPECIAL_5, 4
	goto_if_eq LilycoveCity_MoveDeletersHouse_EventScript_159ADE
	special ScrSpecial_GetPokemonNicknameAndMoveName
	msgbox LilycoveCity_MoveDeletersHouse_Text_18B6F2, MSGBOX_YESNO
	switch RESULT
	case YES, LilycoveCity_MoveDeletersHouse_EventScript_159B53
	case NO, LilycoveCity_MoveDeletersHouse_EventScript_159B7B
	releaseall
	end

LilycoveCity_MoveDeletersHouse_EventScript_159B53:: @ 8159B53
	special DeleteMonMove
	playfanfare MUS_ME_WASURE
	waitfanfare
	msgbox LilycoveCity_MoveDeletersHouse_Text_18B71E, 4
	releaseall
	end

LilycoveCity_MoveDeletersHouse_EventScript_159B64:: @ 8159B64
	special ScrSpecial_GetPokemonNicknameAndMoveName
	msgbox LilycoveCity_MoveDeletersHouse_Text_18B6D0, 4
	releaseall
	end

LilycoveCity_MoveDeletersHouse_EventScript_159B71:: @ 8159B71
	msgbox LilycoveCity_MoveDeletersHouse_Text_18B78C, 4
	releaseall
	end

LilycoveCity_MoveDeletersHouse_EventScript_159B7B:: @ 8159B7B
	msgbox LilycoveCity_MoveDeletersHouse_Text_18B757, 4
	releaseall
	end
