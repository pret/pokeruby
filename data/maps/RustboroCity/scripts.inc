RustboroCity_MapScripts:: @ 814C372
	map_script MAP_SCRIPT_ON_TRANSITION, RustboroCity_OnTransition
	.byte 0

RustboroCity_OnTransition:: @ 814C378
	setflag FLAG_VISITED_RUSTBORO_CITY
	call Common_EventScript_SetupEvilTeamGfxIds
	call Common_EventScript_SetupRivalGfxId
	end

RustboroCity_EventScript_FatMan:: @ 814C386
	lock
	faceplayer
	goto_if_set FLAG_DEVON_GOODS_STOLEN, RustboroCity_EventScript_FatManSawGrunt
	msgbox RustboroCity_Text_WeShortenItToDevon, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_FatManSawGrunt:: @ 814C39B
	msgbox RustboroCity_Text_SneakyLookingManWentAroundCorner, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_DevonEmployee2:: @ 814C3A5
	lock
	faceplayer
	msgbox RustboroCity_Text_YoureNewAroundHere, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_Woman:: @ 814C3B1
	msgbox RustboroCity_Text_GymLeaderIsntEasyWithFire, MSGBOX_NPC
	end

RustboroCity_EventScript_Man1:: @ 814C3BA
	lock
	faceplayer
	goto_if_set FLAG_BADGE01_GET, RustboroCity_EventScript_Man1HaveBadge
	msgbox RustboroCity_Text_HaveYouChallengedGym, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_Man1HaveBadge:: @ 814C3CF
	msgbox RustboroCity_Text_HeyThatsRustborosGymBadge, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_Boy2:: @ 814C3D9
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_POKENAV, RustboroCity_EventScript_Boy2BrineyLeftTunnel
	msgbox RustboroCity_Text_MrBrineyWalksInTheTunnel, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_Boy2BrineyLeftTunnel:: @ 814C3EE
	msgbox RustboroCity_Text_MrBrineyLovesPeeko, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_Twin:: @ 814C3F8
	msgbox RustboroCity_Text_WowYouHavePokemon, MSGBOX_NPC
	end

RustboroCity_EventScript_NinjaBoy:: @ 814C401
	msgbox RustboroCity_Text_CatchRarePokemonIfIGoToSchool, MSGBOX_SIGN
	end

RustboroCity_EventScript_TunnelSign:: @ 814C40A
	msgbox RustboroCity_Text_TunnelNearingCompletion, MSGBOX_SIGN
	end

RustboroCity_EventScript_DevonCorpSign:: @ 814C413
	msgbox RustboroCity_Text_DevonCorpSign, MSGBOX_SIGN
	end

RustboroCity_EventScript_GymSign:: @ 814C41C
	msgbox RustboroCity_Text_GymSign, MSGBOX_SIGN
	end

@ 814C425
	msgbox RustboroCity_Text_DevonCorpBranchOfficeSign, MSGBOX_SIGN
	end

RustboroCity_EventScript_CitySign:: @ 814C42E
	msgbox RustboroCity_Text_CitySign, MSGBOX_SIGN
	end

RustboroCity_EventScript_TrainersSchoolSign:: @ 814C437
	msgbox RustboroCity_Text_TrainersSchoolSign, MSGBOX_SIGN
	end

RustboroCity_EventScript_CuttersHouseSign:: @ 814C440
	msgbox RustboroCity_Text_CuttersHouse, MSGBOX_SIGN
	end

RustboroCity_EventScript_LittleBoy:: @ 814C449
	lock
	faceplayer
	msgbox RustboroCity_Text_PokemonCanChangeLookFromExp, MSGBOX_DEFAULT
	applymovement 7, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

RustboroCity_EventScript_LittleGirl:: @ 814C45F
	lock
	faceplayer
	msgbox RustboroCity_Text_PokemonChangeShape, MSGBOX_DEFAULT
	applymovement 8, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

RustboroCity_EventScript_Man2:: @ 814C475
	lock
	faceplayer
	msgbox RustboroCity_Text_TradePokemonGrowFast, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_StolenGoodsTrigger0:: @ 814C481
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_0x8004, 0
	goto RustboroCity_EventScript_StolenGoodsScene
	end

RustboroCity_EventScript_StolenGoodsTrigger1:: @ 814C498
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_0x8004, 1
	goto RustboroCity_EventScript_StolenGoodsScene
	end

RustboroCity_EventScript_StolenGoodsTrigger2:: @ 814C4AF
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_0x8004, 2
	goto RustboroCity_EventScript_StolenGoodsScene
	end

RustboroCity_EventScript_StolenGoodsTrigger3:: @ 814C4C6
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_0x8004, 3
	goto RustboroCity_EventScript_StolenGoodsScene
	end

RustboroCity_EventScript_StolenGoodsTrigger4:: @ 814C4DD
	lockall
	setobjectxyperm 9, 14, 21
	setobjectmovementtype 9, 10
	setvar VAR_0x8004, 4
	goto RustboroCity_EventScript_StolenGoodsScene
	end

RustboroCity_EventScript_StolenGoodsScene:: @ 814C4F4
	msgbox RustboroCity_Text_OutOfTheWay, MSGBOX_DEFAULT
	closemessage
	addobject 10
	addobject 9
	applymovement 10, RustboroCity_Movement_GruntEscape
	waitmovement 0
	removeobject 10
	applymovement 9, RustboroCity_Movement_EmployeeChaseGrunt1
	waitmovement 0
	msgbox RustboroCity_Text_WaitDontTakeMyGoods, MSGBOX_DEFAULT
	closemessage
	applymovement 9, RustboroCity_Movement_EmployeeChaseGrunt2
	waitmovement 0
	removeobject 9
	setobjectxyperm 9, 30, 10
	clearflag FLAG_HIDE_DEVON_RUSTBORO
	setflag FLAG_DEVON_GOODS_STOLEN
	setvar VAR_RUSTBORO_STATE, 2
	setvar VAR_RUSTURF_TUNNEL_STATE, 2
	setvar VAR_ROUTE116_STATE, 1
	clearflag FLAG_HIDE_BRINEY_ROUTE116
	clearflag FLAG_HIDE_PEEKO_RUSTURF_TUNNEL
	clearflag FLAG_HIDE_GRUNT_RUSTURF_TUNNEL
	setflag FLAG_HIDE_MR_BRINEY_ROUTE104_HOUSE
	setflag FLAG_HIDE_PEEKO_BRINEY_HOUSE
	releaseall
	end

@ 814C55D
	msgbox RustboroCity_Text_ShadyCharacterTookOffTowardsTunnel, MSGBOX_DEFAULT
	return

@ 814C566
	msgbox RustboroCity_Text_YouGotItThankYou, MSGBOX_DEFAULT
	return

@ 814C56F
	applymovement 9, RustboroCity_Movement_EmployeeApproachUp
	waitmovement 0
	return

@ 814C57A
	applymovement 9, RustboroCity_Movement_EmployeeApproachLeft
	waitmovement 0
	return

@ 814C585
	applymovement 9, RustboroCity_Movement_EmployeeApproachRight
	waitmovement 0
	return

@ 814C590
	applymovement 9, RustboroCity_Movement_EmployeeApproachDown
	waitmovement 0
	return

@ 814C59B
	applymovement 9, RustboroCity_Movement_EmployeeApproachPlayerFar
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

@ 814C5B0
	walk_fastest_right
	walk_fastest_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	step_end

RustboroCity_Movement_GruntEscape:: @ 814C5C2
	walk_fastest_right
	walk_fastest_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_right
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	walk_fast_up
	step_end

RustboroCity_Movement_EmployeeChaseGrunt1:: @ 814C5D3
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_up
	step_end

RustboroCity_Movement_EmployeeChaseGrunt2:: @ 814C5DB
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	walk_up
	step_end

RustboroCity_Movement_EmployeeApproachUp:: @ 814C5E3
	walk_down
	walk_right
	walk_right
	step_end

RustboroCity_Movement_EmployeeApproachLeft:: @ 814C5E7
	walk_down
	walk_down
	walk_right
	walk_right
	step_end

RustboroCity_Movement_EmployeeApproachRight:: @ 814C5EC
	walk_down
	walk_down
	walk_right
	walk_right
	step_end

RustboroCity_Movement_EmployeeApproachDown:: @ 814C5F1
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	step_end

RustboroCity_Movement_EmployeeApproachPlayerFar:: @ 814C5F7
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_in_place_fastest_down
	step_end

RustboroCity_EventScript_DevonEmployee1:: @ 814C5FF
	lock
	faceplayer
	goto_if_set FLAG_RECOVERED_DEVON_GOODS, RustboroCity_EventScript_ReturnGoodsSpokeToEmployee
	msgbox RustboroCity_Text_ShadyCharacterTookOffTowardsTunnel, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_ReturnGoodsSpokeToEmployee:: @ 814C614
	waitse
	setvar VAR_TEMP_1, 4
	goto RustboroCity_EventScript_ReturnGoods
	end

RustboroCity_EventScript_HelpGetGoodsTrigger0:: @ 814C620
	lockall
	setvar VAR_TEMP_1, 0
	goto RustboroCity_EventScript_EmployeeAskToGetGoods
	end

RustboroCity_EventScript_HelpGetGoodsTrigger1:: @ 814C62C
	lockall
	setvar VAR_TEMP_1, 1
	goto RustboroCity_EventScript_EmployeeAskToGetGoods
	end

RustboroCity_EventScript_HelpGetGoodsTrigger2:: @ 814C638
	lockall
	setvar VAR_TEMP_1, 2
	goto RustboroCity_EventScript_EmployeeAskToGetGoods
	end

RustboroCity_EventScript_HelpGetGoodsTrigger3:: @ 814C644
	lockall
	setvar VAR_TEMP_1, 3
	goto RustboroCity_EventScript_EmployeeAskToGetGoods
	end

RustboroCity_EventScript_EmployeeAskToGetGoods:: @ 814C650
	compare VAR_TEMP_1, 0
	call_if_eq RustboroCity_EventScript_EmployeeFacePlayerUp1
	compare VAR_TEMP_1, 1
	call_if_eq RustboroCity_EventScript_EmployeeFacePlayerLeft1
	compare VAR_TEMP_1, 2
	call_if_eq RustboroCity_EventScript_EmployeeFacePlayerDown1
	compare VAR_TEMP_1, 3
	call_if_eq RustboroCity_EventScript_EmployeeApproachPlayerDown1
	setflag FLAG_UNKNOWN_9F
	setvar VAR_RUSTBORO_STATE, 3
	moveobjectoffscreen 9
	msgbox RustboroCity_Text_HelpMeIWasRobbed, MSGBOX_DEFAULT
	releaseall
	end

RustboroCity_EventScript_EmployeeFacePlayerUp1:: @ 814C691
	applymovement 9, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

RustboroCity_EventScript_EmployeeFacePlayerLeft1:: @ 814C6BD
	applymovement 9, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	return

RustboroCity_EventScript_EmployeeFacePlayerDown1:: @ 814C6E9
	applymovement 9, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

RustboroCity_EventScript_EmployeeApproachPlayerDown1:: @ 814C715
	applymovement 9, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	applymovement 9, RustboroCity_Movement_EmployeeApproachPlayerDown
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

RustboroCity_Movement_EmployeeApproachPlayerDown:: @ 814C74B
	walk_down
	step_end

RustboroCity_EventScript_ReturnGoodsTrigger0:: @ 814C74D
	lockall
	setvar VAR_TEMP_1, 0
	goto RustboroCity_EventScript_ReturnGoods
	end

RustboroCity_EventScript_ReturnGoodsTrigger1:: @ 814C759
	lockall
	setvar VAR_TEMP_1, 1
	goto RustboroCity_EventScript_ReturnGoods
	end

RustboroCity_EventScript_ReturnGoodsTrigger2:: @ 814C765
	lockall
	setvar VAR_TEMP_1, 2
	goto RustboroCity_EventScript_ReturnGoods
	end

RustboroCity_EventScript_ReturnGoodsTrigger3:: @ 814C771
	lockall
	setvar VAR_TEMP_1, 3
	goto RustboroCity_EventScript_ReturnGoods
	end

RustboroCity_EventScript_ReturnGoods:: @ 814C77D
	compare VAR_TEMP_1, 0
	call_if_eq RustboroCity_EventScript_EmployeeFacePlayerUp2
	compare VAR_TEMP_1, 1
	call_if_eq RustboroCity_EventScript_EmployeeFacePlayerLeft2
	compare VAR_TEMP_1, 2
	call_if_eq RustboroCity_EventScript_EmployeeFacePlayerDown2
	compare VAR_TEMP_1, 3
	call_if_eq RustboroCity_EventScript_EmployeeApproachPlayerDown2
	compare VAR_TEMP_1, 4
	call_if_eq RustboroCity_EventScript_EmployeeFacePlayerRight
	msgbox RustboroCity_Text_YouGotItThankYou, MSGBOX_DEFAULT
	giveitem ITEM_GREAT_BALL
	compare VAR_RESULT, 0
	call_if_eq RustboroCity_EventScript_BagFull
	msgbox RustboroCity_Text_PleaseComeWithMe, MSGBOX_DEFAULT
	closemessage
	setflag FLAG_RETURNED_DEVON_GOODS
	setflag FLAG_HIDE_DEVON_RUSTBORO
	setvar VAR_RUSTBORO_STATE, 5
	delay 30
	warp MAP_RUSTBORO_CITY_DEVON_CORP_3F, 255, 2, 2
	waitstate
	releaseall
	end

RustboroCity_EventScript_BagFull:: @ 814C7F5
	msgbox RustboroCity_Text_YoureLoadedWithItems, MSGBOX_DEFAULT
	return

RustboroCity_EventScript_EmployeeFacePlayerUp2:: @ 814C7FE
	applymovement 9, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	return

RustboroCity_EventScript_EmployeeFacePlayerLeft2:: @ 814C82A
	applymovement 9, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	return

RustboroCity_EventScript_EmployeeFacePlayerDown2:: @ 814C856
	applymovement 9, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

RustboroCity_EventScript_EmployeeApproachPlayerDown2:: @ 814C882
	applymovement 9, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	applymovement 9, RustboroCity_Movement_EmployeeApproachPlayerDown
	waitmovement 0
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestUp
	waitmovement 0
	return

RustboroCity_EventScript_EmployeeFacePlayerRight:: @ 814C8B8
	applymovement 9, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	playse SE_PIN
	applymovement 9, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 9, Common_Movement_Delay48
	waitmovement 0
	return

RustboroCity_EventScript_RivalEncounter:: @ 814C8DA
	lock
	faceplayer
	goto_if_set FLAG_MET_RIVAL_RUSTBORO, RustboroCity_EventScript_BrineyHint
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq RustboroCity_EventScript_MayHiHowsPokedexComing
	compare VAR_RESULT, 1
	goto_if_eq RustboroCity_EventScript_BrendanHiHowsPokedexComing
	end

RustboroCity_EventScript_MayHiHowsPokedexComing:: @ 814C8FD
	setflag FLAG_MET_RIVAL_RUSTBORO
	msgbox RustboroCity_Text_MayHiHowsPokedexComing, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_BrendanHiHowsPokedexComing:: @ 814C90A
	setflag FLAG_MET_RIVAL_RUSTBORO
	msgbox RustboroCity_Text_BrendanHiHowsPokedexComing, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_BrineyHint:: @ 814C917
	checkplayergender
	compare VAR_RESULT, 0
	goto_if_eq RustboroCity_EventScript_MayBrineyHint
	compare VAR_RESULT, 1
	goto_if_eq RustboroCity_EventScript_BrendanBrineyHint
	end

RustboroCity_EventScript_MayBrineyHint:: @ 814C92F
	msgbox RustboroCity_Text_MayMrBrineyHint, MSGBOX_DEFAULT
	release
	end

RustboroCity_EventScript_BrendanBrineyHint:: @ 814C939
	msgbox RustboroCity_Text_BrendanMrBrineyHint, MSGBOX_DEFAULT
	release
	end
