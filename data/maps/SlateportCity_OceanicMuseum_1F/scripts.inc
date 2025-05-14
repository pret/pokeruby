SlateportCity_OceanicMuseum_1F_MapScripts:: @ 8155ACA
	map_script MAP_SCRIPT_ON_TRANSITION, SlateportCity_OceanicMuseum_1F_MapScript1_OnTransition
	.byte 0

SlateportCity_OceanicMuseum_1F_MapScript1_OnTransition:: @ 8155AD0
	.ifdef SAPPHIRE
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_AQUA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_1, OBJ_EVENT_GFX_AQUA_MEMBER_M
	.else
	setvar VAR_OBJ_GFX_ID_0, OBJ_EVENT_GFX_MAGMA_MEMBER_F
	setvar VAR_OBJ_GFX_ID_1, OBJ_EVENT_GFX_MAGMA_MEMBER_M
	.endif
	end

SlateportCity_OceanicMuseum_1F_EventScript_EntranceAttendant:: @ 8155ADB
	msgbox SlateportCity_OceanicMuseum_1F_Text_PleaseEnjoyYourself, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_PayEntranceFeeLeft:: @ 8155AE4
	lockall
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	goto SlateportCity_OceanicMuseum_1F_EventScript_PayEntranceFee
	end

SlateportCity_OceanicMuseum_1F_EventScript_PayEntranceFeeRight:: @ 8155AF5
	lockall
	applymovement LOCALID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	goto SlateportCity_OceanicMuseum_1F_EventScript_PayEntranceFee
	end

SlateportCity_OceanicMuseum_1F_EventScript_PayEntranceFee:: @ 8155B06
	showmoneybox 0, 0
	nop
	msgbox SlateportCity_OceanicMuseum_1F_Text_WouldYouLikeToEnter, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_CheckMoneyForFee
	closemessage
	hidemoneybox 0, 0
	applymovement LOCALID_PLAYER, SlateportCity_OceanicMuseum_1F_Movement_PushPlayerBackFromCounter
	waitmovement 0
	releaseall
	end

SlateportCity_OceanicMuseum_1F_EventScript_CheckMoneyForFee:: @ 8155B2D
	checkmoney 50, 0
	compare VAR_RESULT, 0
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_NotEnoughMoney
	removemoney 50, 0
	updatemoneybox 0, 0
	nop
	msgbox SlateportCity_OceanicMuseum_1F_Text_PleaseEnjoyYourself, MSGBOX_DEFAULT
	setvar VAR_SLATEPORT_MUSEUM_1F_STATE, 1
	hidemoneybox 0, 0
	releaseall
	end

SlateportCity_OceanicMuseum_1F_EventScript_NotEnoughMoney:: @ 8155B5A
	goto_if_unset FLAG_DELIVERED_DEVON_GOODS, SlateportCity_OceanicMuseum_1F_EventScript_AllowEntranceAnyway
	msgbox SlateportCity_OceanicMuseum_1F_Text_NotEnoughMoney, MSGBOX_DEFAULT
	closemessage
	hidemoneybox 0, 0
	applymovement LOCALID_PLAYER, SlateportCity_OceanicMuseum_1F_Movement_PushPlayerBackFromCounter
	waitmovement 0
	releaseall
	end

SlateportCity_OceanicMuseum_1F_EventScript_AllowEntranceAnyway:: @ 8155B7B
	msgbox SlateportCity_OceanicMuseum_1F_Text_CatchUpWithYourGroup, MSGBOX_DEFAULT
	setvar VAR_SLATEPORT_MUSEUM_1F_STATE, 1
	hidemoneybox 0, 0
	releaseall
	end

SlateportCity_OceanicMuseum_1F_Movement_PushPlayerBackFromCounter:: @ 8155B8D
	walk_down
	step_end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumGrunt1:: @ 8155B8F
	msgbox SlateportCity_OceanicMuseum_1F_Text_EvilTeamExistForGoodOfAll, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumGrunt2:: @ 8155B98
	msgbox SlateportCity_OceanicMuseum_1F_Text_OurBossIsntHere, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumGrunt3:: @ 8155BA1
	msgbox SlateportCity_OceanicMuseum_1F_Text_WouldStuffHereMakeMeRich, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumGrunt4:: @ 8155BAA
	msgbox SlateportCity_OceanicMuseum_1F_Text_CanLearnForNefariousDeeds, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumGrunt5:: @ 8155BB3
	msgbox SlateportCity_OceanicMuseum_1F_Text_RustboroBungled, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumGrunt6:: @ 8155BBC
	msgbox SlateportCity_OceanicMuseum_1F_Text_DidntHaveMoney, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_WhirlpoolExperiment:: @ 8155BC5
	msgbox SlateportCity_OceanicMuseum_1F_Text_WhirlpoolExperiment, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_WaterfallExperiment:: @ 8155BCE
	msgbox SlateportCity_OceanicMuseum_1F_Text_WaterfallExperiment, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_OceanSoilDisplay:: @ 8155BD7
	msgbox SlateportCity_OceanicMuseum_1F_Text_OceanSoilDisplay, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_BeachSandDisplay:: @ 8155BE0
	msgbox SlateportCity_OceanicMuseum_1F_Text_BeachSandDisplay, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_OceanicMinifact1:: @ 8155BE9
	msgbox SlateportCity_OceanicMuseum_1F_Text_OceanicMinifact1, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_OceanicMinifact2:: @ 8155BF2
	msgbox SlateportCity_OceanicMuseum_1F_Text_OceanicMinifact2, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_OceanicMinifact3:: @ 8155BFB
	msgbox SlateportCity_OceanicMuseum_1F_Text_OceanicMinifact3, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_FossilDisplay:: @ 8155C04
	msgbox SlateportCity_OceanicMuseum_1F_Text_FossilDisplay, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_DepthMeasuringMachine:: @ 8155C0D
	msgbox SlateportCity_OceanicMuseum_1F_Text_DepthMeasuringMachine, MSGBOX_SIGN
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumPatron1:: @ 8155C16
	msgbox SlateportCity_OceanicMuseum_1F_Text_LearnAboutSeaForBattling, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumPatron2:: @ 8155C1F
	msgbox SlateportCity_OceanicMuseum_1F_Text_SternIsRoleModel, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumPatron3:: @ 8155C28
	msgbox SlateportCity_OceanicMuseum_1F_Text_MustBePokemonWeDontKnow, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_MuseumPatron4:: @ 8155C31
	msgbox SlateportCity_OceanicMuseum_1F_Text_WantSeaPokemon, MSGBOX_NPC
	end

SlateportCity_OceanicMuseum_1F_EventScript_FamiliarGrunt:: @ 8155C3A
	lock
	faceplayer
	delay 8
	playse SE_PIN
	applymovement 13, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 13, Common_Movement_Delay48
	waitmovement 0
	msgbox SlateportCity_OceanicMuseum_1F_Text_RememberMeTakeThis, MSGBOX_DEFAULT
	giveitem ITEM_TM46_THIEF
	compare VAR_RESULT, 0
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_NoRoomForThief
	setflag FLAG_RECEIVED_TM46
	msgbox SlateportCity_OceanicMuseum_1F_Text_YouScrewedUpOurPlans, MSGBOX_DEFAULT
	closemessage
	compare VAR_FACING, 2
	goto_if_eq SlateportCity_OceanicMuseum_1F_EventScript_FamiliarGruntExitNorth
	compare VAR_FACING, 2
	goto_if_ne SlateportCity_OceanicMuseum_1F_EventScript_FamiliarGruntExitSouth
	end

SlateportCity_OceanicMuseum_1F_EventScript_FamiliarGruntExitNorth:: @ 8155C98
	applymovement 13, SlateportCity_OceanicMuseum_1F_Movement_FamiliarGruntExitNorth
	waitmovement 0
	setflag FLAG_HIDE_SCARED_GRUNT_OCEANIC_MUSEUM
	playse SE_EXIT
	removeobject 13
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_FamiliarGruntExitSouth:: @ 8155CAD
	applymovement 13, SlateportCity_OceanicMuseum_1F_Movement_FamiliarGruntExit
	waitmovement 0
	setflag FLAG_HIDE_SCARED_GRUNT_OCEANIC_MUSEUM
	playse SE_EXIT
	removeobject 13
	release
	end

SlateportCity_OceanicMuseum_1F_EventScript_NoRoomForThief:: @ 8155CC2
	msgbox SlateportCity_OceanicMuseum_1F_Text_YouHaveToTakeThis, MSGBOX_DEFAULT
	release
	end

SlateportCity_OceanicMuseum_1F_Movement_FamiliarGruntExit:: @ 8155CCC
	face_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	delay_8
	step_end

SlateportCity_OceanicMuseum_1F_Movement_FamiliarGruntExitNorth:: @ 8155CD3
	walk_fast_right
	walk_fast_down
	walk_fast_down
	walk_fast_down
	walk_fast_down
	delay_8
	step_end
