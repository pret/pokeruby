LilycoveCity_PokemonTrainerFanClub_MapScripts:: @ 815938A
	map_script 2, LilycoveCity_PokemonTrainerFanClub_MapScript2_159395
	map_script 3, LilycoveCity_PokemonTrainerFanClub_MapScript1_159412
	.byte 0

LilycoveCity_PokemonTrainerFanClub_MapScript2_159395:: @ 8159395
	map_script_2 VAR_LILYCOVE_FAN_CLUB_STATE, 1, LilycoveCity_PokemonTrainerFanClub_EventScript_15939F
	.2byte 0

LilycoveCity_PokemonTrainerFanClub_EventScript_15939F:: @ 815939F
	lockall
	applymovement 1, LilycoveCity_PokemonTrainerFanClub_Movement_1A0845
	waitmovement 0
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A1D6, 4
	applymovement 4, LilycoveCity_PokemonTrainerFanClub_Movement_159402
	applymovement 2, LilycoveCity_PokemonTrainerFanClub_Movement_1593FA
	waitmovement 0
	applymovement 255, LilycoveCity_PokemonTrainerFanClub_Movement_1A0843
	waitmovement 0
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A1E8, 4
	applymovement 4, LilycoveCity_PokemonTrainerFanClub_Movement_159409
	waitmovement 0
	applymovement 255, LilycoveCity_PokemonTrainerFanClub_Movement_1A083F
	waitmovement 0
	applymovement 4, LilycoveCity_PokemonTrainerFanClub_Movement_15940C
	waitmovement 0
	setvar VAR_LILYCOVE_FAN_CLUB_STATE, 2
	releaseall
	end

LilycoveCity_PokemonTrainerFanClub_Movement_1593FA:: @ 81593FA
	delay_8
	walk_in_place_fastest_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	end_movement

LilycoveCity_PokemonTrainerFanClub_Movement_159402:: @ 8159402
	walk_fast_left
	walk_fast_left
	walk_fast_down
	walk_fast_down
	walk_fast_left
	walk_fast_down
	end_movement

LilycoveCity_PokemonTrainerFanClub_Movement_159409:: @ 8159409
	walk_down
	walk_in_place_fastest_right
	end_movement

LilycoveCity_PokemonTrainerFanClub_Movement_15940C:: @ 815940C
	jump_in_place_right
	walk_fast_up
	walk_fast_up
	walk_fast_right
	walk_in_place_fastest_down
	end_movement

LilycoveCity_PokemonTrainerFanClub_MapScript1_159412:: @ 8159412
	compare VAR_LILYCOVE_FAN_CLUB_STATE, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159515
	compare VAR_LILYCOVE_FAN_CLUB_STATE, 2
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159429
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159429:: @ 8159429
	special UpdateMovedLilycoveFanClubMembers
	setvar VAR_SPECIAL_4, 8
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 0
	call_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1594D5
	setvar VAR_SPECIAL_4, 9
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 0
	call_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1594DD
	setvar VAR_SPECIAL_4, 10
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 0
	call_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1594E5
	setvar VAR_SPECIAL_4, 11
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 0
	call_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1594ED
	setvar VAR_SPECIAL_4, 12
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 0
	call_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1594F5
	setvar VAR_SPECIAL_4, 13
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 0
	call_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1594FD
	setvar VAR_SPECIAL_4, 14
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 0
	call_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159505
	setvar VAR_SPECIAL_4, 15
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 0
	call_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_15950D
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1594D5:: @ 81594D5
	setobjectxyperm 1, 7, 5
	return

LilycoveCity_PokemonTrainerFanClub_EventScript_1594DD:: @ 81594DD
	setobjectxyperm 3, 3, 4
	return

LilycoveCity_PokemonTrainerFanClub_EventScript_1594E5:: @ 81594E5
	setobjectxyperm 4, 7, 2
	return

LilycoveCity_PokemonTrainerFanClub_EventScript_1594ED:: @ 81594ED
	setobjectxyperm 5, 5, 5
	return

LilycoveCity_PokemonTrainerFanClub_EventScript_1594F5:: @ 81594F5
	setobjectxyperm 6, 5, 2
	return

LilycoveCity_PokemonTrainerFanClub_EventScript_1594FD:: @ 81594FD
	setobjectxyperm 2, 8, 4
	return

LilycoveCity_PokemonTrainerFanClub_EventScript_159505:: @ 8159505
	setobjectxyperm 7, 3, 3
	return

LilycoveCity_PokemonTrainerFanClub_EventScript_15950D:: @ 815950D
	setobjectxyperm 8, 8, 3
	return

LilycoveCity_PokemonTrainerFanClub_EventScript_159515:: @ 8159515
	call LilycoveCity_PokemonTrainerFanClub_EventScript_1594DD
	call LilycoveCity_PokemonTrainerFanClub_EventScript_1594ED
	call LilycoveCity_PokemonTrainerFanClub_EventScript_1594F5
	call LilycoveCity_PokemonTrainerFanClub_EventScript_159505
	call LilycoveCity_PokemonTrainerFanClub_EventScript_15950D
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15952F:: @ 815952F
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 13
	special BufferStreakTrainerText
	compare VAR_LILYCOVE_FAN_CLUB_STATE, 0
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_15959C
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_15956E
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 7
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159592
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A400, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15956E:: @ 815956E
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159588
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A36A, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159588:: @ 8159588
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A391, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159592:: @ 8159592
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A48D, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15959C:: @ 815959C
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A4EA, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1595A6:: @ 81595A6
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 8
	special BufferStreakTrainerText
	compare VAR_LILYCOVE_FAN_CLUB_STATE, 0
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159613
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1595E5
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 7
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159609
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A629, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1595E5:: @ 81595E5
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1595FF
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A584, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1595FF:: @ 81595FF
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A5AC, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159609:: @ 8159609
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A65B, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159613:: @ 8159613
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A6D4, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15961D:: @ 815961D
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 9
	special BufferStreakTrainerText
	compare VAR_LILYCOVE_FAN_CLUB_STATE, 0
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_15968A
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_15965C
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 7
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159680
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A814, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15965C:: @ 815965C
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159676
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A71E, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159676:: @ 8159676
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A789, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159680:: @ 8159680
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A8C4, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15968A:: @ 815968A
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18A984, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159694:: @ 8159694
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 10
	special BufferStreakTrainerText
	compare VAR_LILYCOVE_FAN_CLUB_STATE, 0
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159701
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1596D3
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 7
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1596F7
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AB0A, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1596D3:: @ 81596D3
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1596ED
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AA39, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1596ED:: @ 81596ED
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AA83, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1596F7:: @ 81596F7
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AB41, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159701:: @ 8159701
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18ABAE, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15970B:: @ 815970B
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 11
	special BufferStreakTrainerText
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_15973F
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 7
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159763
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18ACC7, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15973F:: @ 815973F
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159759
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AC15, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159759:: @ 8159759
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AC5E, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159763:: @ 8159763
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AD05, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15976D:: @ 815976D
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 12
	special BufferStreakTrainerText
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1597A1
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 7
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1597C5
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AE63, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1597A1:: @ 81597A1
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_1597BB
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AD6D, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1597BB:: @ 81597BB
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18ADEF, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1597C5:: @ 81597C5
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AEF5, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_1597CF:: @ 81597CF
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 14
	special BufferStreakTrainerText
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159803
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 7
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159827
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18B030, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159803:: @ 8159803
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_15981D
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AF62, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15981D:: @ 815981D
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18AFD0, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159827:: @ 8159827
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18B0C8, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159831:: @ 8159831
	lock
	faceplayer
	setvar VAR_SPECIAL_4, 15
	special BufferStreakTrainerText
	specialvar RESULT, ShouldMoveLilycoveFanClubMember
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159865
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 7
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_159889
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18B1FD, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159865:: @ 8159865
	specialvar RESULT, GetNumMovedLilycoveFanClubMembers
	compare RESULT, 1
	goto_if_eq LilycoveCity_PokemonTrainerFanClub_EventScript_15987F
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18B16E, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_15987F:: @ 815987F
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18B181, 4
	release
	end

LilycoveCity_PokemonTrainerFanClub_EventScript_159889:: @ 8159889
	msgbox LilycoveCity_PokemonTrainerFanClub_Text_18B24F, 4
	release
	end
