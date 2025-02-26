SootopolisCity_MapScripts:: @ 814D07D
	map_script MAP_SCRIPT_ON_LOAD, SootopolisCity_OnLoad
	map_script MAP_SCRIPT_ON_TRANSITION, SootopolisCity_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, SootopolisCity_OnResume
	.byte 0

SootopolisCity_OnLoad:: @ 814D08D
	call_if_unset FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, SootopolisCity_EventScript_ExpertBlockCaveOfOrigin
	call_if_set FLAG_LEGEND_ESCAPED_SEAFLOOR_CAVERN, SootopolisCity_EventScript_WeatherEventDoorsLocked
	end

SootopolisCity_EventScript_ExpertBlockCaveOfOrigin:: @ 814D0A0
	setobjectxyperm 3, 31, 18
	setmetatile 31, 32, METATILE_Sootopolis_GymDoor_Closed, 1
	return

SootopolisCity_EventScript_WeatherEventDoorsLocked:: @ 814D0B1
	call_if_unset FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_LockCityDoors
	return

SootopolisCity_EventScript_LockCityDoors:: @ 814D0BB
	setmetatile 9, 6, METATILE_Sootopolis_Door_Closed, 1
	setmetatile 9, 17, METATILE_Sootopolis_Door_Closed, 1
	setmetatile 9, 26, METATILE_Sootopolis_Door_Closed, 1
	setmetatile 44, 17, METATILE_Sootopolis_Door_Closed, 1
	setmetatile 8, 35, METATILE_Sootopolis_Door_Closed, 1
	setmetatile 53, 28, METATILE_Sootopolis_Door_Closed, 1
	setmetatile 45, 6, METATILE_Sootopolis_Door_Closed, 1
	setmetatile 48, 25, METATILE_Sootopolis_Door_Closed, 1
	setmetatile 31, 32, METATILE_Sootopolis_GymDoor_Closed, 1
	return

SootopolisCity_OnTransition:: @ 814D10D
	setflag FLAG_VISITED_SOOTOPOLIS_CITY
	call_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_SetStevenOutsideGymPostLegendary
	call_if_set FLAG_SYS_WEATHER_CTRL, SootopolisCity_EventScript_SetWeather
	end

SootopolisCity_EventScript_SetWeather:: @ 814D123
	call Common_EventScript_SetLegendaryWeather
	setobjectxyperm 1, 29, 19
	setobjectxyperm 2, 33, 19
	compare VAR_SOOTOPOLIS_STATE, 1
	call_if_eq SootopolisCity_EventScript_SetStevenWallaceInitialPositions
	return

SootopolisCity_EventScript_SetStevenWallaceInitialPositions:: @ 814D142
	setobjectxyperm 10, 29, 6
	setobjectmovementtype 10, 10
	setobjectxyperm 5, 30, 6
	setobjectmovementtype 5, 9
	return

SootopolisCity_EventScript_SetStevenOutsideGymPostLegendary:: @ 814D159
	setobjectxyperm 10, 31, 33
	setobjectmovementtype 10, 8
	return

SootopolisCity_OnResume:: @ 814D165
	setdivewarp MAP_UNDERWATER_SOOTOPOLIS_CITY, 255, 9, 6
	end

SootopolisCity_EventScript_CaveOfOriginExpert:: @ 814D16E
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_CaveOfOriginExpertPostLegendary
	msgbox SootopolisCity_Text_CaveOfOriginPleaseLeave, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_CaveOfOriginExpertPostLegendary:: @ 814D183
	msgbox SootopolisCity_Text_AllLifeStartsAtTheCave, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_CaveEntranceWoman1:: @ 814D18D
	msgbox SootopolisCity_Text_TheLegendWasTrue, MSGBOX_NPC
	end

SootopolisCity_EventScript_CaveEntranceWoman2:: @ 814D196
	msgbox SootopolisCity_Text_NaturalBalanceIsShifting, MSGBOX_NPC
	end

SootopolisCity_EventScript_KiriGiveBerry:: @ 814D19F
	lock
	faceplayer
	dotimebasedevents
	special GetPlayerBigGuyGirlString
	goto_if_set FLAG_DAILY_RECEIVED_BERRY_SOOTOPOLIS, SootopolisCity_EventScript_KiriReceivedBerry
	msgbox SootopolisCity_Text_NameIsKiriHaveOneOfThese, MSGBOX_DEFAULT
	random 10
	addvar VAR_RESULT, 20
	addvar VAR_RESULT, ITEM_CHERI_BERRY
	giveitem VAR_RESULT
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	setflag FLAG_DAILY_RECEIVED_BERRY_SOOTOPOLIS
	msgbox SootopolisCity_Text_GiveYouThisBerryToo, MSGBOX_DEFAULT
	random 2
	compare VAR_RESULT, 0
	goto_if_eq SootopolisCity_EventScript_GiveFigyBerry
	compare VAR_RESULT, 1
	goto_if_eq SootopolisCity_EventScript_GiveIapapaBerry
	end

SootopolisCity_EventScript_GiveFigyBerry:: @ 814D1FF
	giveitem ITEM_FIGY_BERRY
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	msgbox SootopolisCity_Text_WhatKindOfWishInYourName, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_GiveIapapaBerry:: @ 814D220
	giveitem ITEM_IAPAPA_BERRY
	compare VAR_RESULT, 0
	goto_if_eq Common_EventScript_ShowBagIsFull
	msgbox SootopolisCity_Text_WhatKindOfWishInYourName, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_KiriReceivedBerry:: @ 814D241
	msgbox SootopolisCity_Text_KiriBornInSeasons, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SootopolisCity_EventScript_KiriLikeSeasonBornIn
	msgbox SootopolisCity_Text_OhDoesntMatter, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_KiriLikeSeasonBornIn:: @ 814D25E
	msgbox SootopolisCity_Text_ThenILoveAutumn, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Woman2:: @ 814D268
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_SOOTOPOLIS_GYM, SootopolisCity_EventScript_Woman2PostGym
	msgbox SootopolisCity_Text_YoureGoingToChallengeWallace, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Woman2PostGym:: @ 814D27D
	msgbox SootopolisCity_Text_BecomeYourFan, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Man1:: @ 814D287
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_Man1PostLegendary
	msgbox SootopolisCity_Text_NoOrdinaryTourist1, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Man1PostLegendary:: @ 814D29C
	msgbox SootopolisCity_Text_NoOrdinaryTourist2, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Woman1:: @ 814D2A6
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_Woman1PostLegendary
	msgbox SootopolisCity_Text_SootopolisSkyBeautiful, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Woman1PostLegendary:: @ 814D2BB
	msgbox SootopolisCity_Text_NightSkyFavoriteScenery, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Boy1:: @ 814D2C5
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_Boy1PostLegendary
	msgbox SootopolisCity_Text_WonderWhatWorldIsLike, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Boy1PostLegendary:: @ 814D2DA
	msgbox SootopolisCity_Text_WhereIsMyHouse, MSGBOX_DEFAULT
	release
	end

SootopolisCity_EventScript_Boy1Normal:: @ 814D2E4
	msgbox SootopolisCity_Text_PhysicallyFitLivingHere, MSGBOX_NPC
	end

SootopolisCity_EventScript_GymSign:: @ 814D2ED
	msgbox SootopolisCity_Text_GymSign, MSGBOX_SIGN
	end

SootopolisCity_EventScript_CitySign:: @ 814D2F6
	msgbox SootopolisCity_Text_CitySign, MSGBOX_SIGN
	end

ClosedSootopolisDoorScript:: @ 814D2FF
	msgbox ClosedSootopolisDoorText, MSGBOX_SIGN
	end

SootopolisCity_EventScript_LeadPlayerCaveOfOrigin:: @ 814D308
	lockall
	applymovement 10, Common_Movement_WalkInPlaceFastestLeft
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	playse SE_PIN
	applymovement 10, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 10, Common_Movement_Delay48
	waitmovement 0
	applymovement 10, SootopolisCity_EventScript_StevenApproachYouCameToo
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_YouCameInRainstorm, MSGBOX_DEFAULT
	.else
	msgbox SootopolisCity_Text_YouCameInScorchingSun, MSGBOX_DEFAULT
	.endif
	closemessage
	applymovement 10, SootopolisCity_EventScript_StevenLeadPlayerToWallace
	applymovement OBJ_EVENT_ID_PLAYER, SootopolisCity_EventScript_PlayerFollowStevenToWallace
	waitmovement 10
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_MyNameIsWallaceDownpour, MSGBOX_DEFAULT
	.else
	msgbox SootopolisCity_Text_MyNameIsWallaceSunshine, MSGBOX_DEFAULT
	.endif
	playse SE_PIN
	applymovement 5, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement 5, Common_Movement_Delay48
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_ThatIsTheBlueOrb, MSGBOX_DEFAULT
	.else
	msgbox SootopolisCity_Text_ThatIsTheRedOrb, MSGBOX_DEFAULT
	.endif
	closemessage
	delay 30
	applymovement 5, SootopolisCity_EventScript_WallaceStartLeadPlayerToCave
	applymovement 10, SootopolisCity_EventScript_StevenStartFollowPlayerToCave
	applymovement OBJ_EVENT_ID_PLAYER, SootopolisCity_EventScript_PlayerStartFollowWallaceToCave
	waitmovement 0
	applymovement 5, Common_Movement_WalkInPlaceFastestRight
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	delay 30
	applymovement 10, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_PeopleNeedRainToLive, MSGBOX_DEFAULT
	.else
	msgbox SootopolisCity_Text_PeopleNeedSunlightToLive, MSGBOX_DEFAULT
	.endif
	closemessage
	delay 30
	applymovement 5, SootopolisCity_EventScript_WallaceContinueLeadPlayerToCave
	applymovement OBJ_EVENT_ID_PLAYER, SootopolisCity_EventScript_PlayerContinueFollowWallaceToCave
	applymovement 10, SootopolisCity_EventScript_StevenContinueFollowPlayerToCave
	waitmovement 0
	applymovement 5, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_CaveOfOriginWithBlueOrb, MSGBOX_DEFAULT
	.else
	msgbox SootopolisCity_Text_CaveOfOriginWithRedOrb, MSGBOX_DEFAULT
	.endif
	applymovement OBJ_EVENT_ID_PLAYER, Common_Movement_WalkInPlaceFastestLeft
	waitmovement 0
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_NeverExpectedHoldingBlueOrb, MSGBOX_DEFAULT
	.else
	msgbox SootopolisCity_Text_NeverExpectedHoldingRedOrb, MSGBOX_DEFAULT
	.endif
	moveobjectoffscreen 5
	setobjectmovementtype 5, 9
	moveobjectoffscreen 10
	setobjectmovementtype 10, 10
	setvar VAR_SOOTOPOLIS_STATE, 2
	releaseall
	end

SootopolisCity_EventScript_StevenApproachYouCameToo:: @ 814D413
	walk_left
	walk_left
	walk_left
	step_end

SootopolisCity_EventScript_StevenLeadPlayerToWallace:: @ 814D417
	walk_right
	walk_right
	walk_right
	walk_up
	walk_in_place_fastest_down
	step_end

SootopolisCity_EventScript_StevenStartFollowPlayerToCave:: @ 814D41D
	walk_down
	walk_right
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	step_end

SootopolisCity_EventScript_StevenContinueFollowPlayerToCave:: @ 814D42D
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

SootopolisCity_EventScript_PlayerFollowStevenToWallace:: @ 814D440
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

SootopolisCity_EventScript_PlayerStartFollowWallaceToCave:: @ 814D445
	walk_right
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

SootopolisCity_EventScript_PlayerContinueFollowWallaceToCave:: @ 814D457
	delay_16
	delay_16
	walk_left
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

SootopolisCity_EventScript_WallaceStartLeadPlayerToCave:: @ 814D46A
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_down
	walk_down
	walk_down
	walk_down
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	walk_left
	step_end

SootopolisCity_EventScript_WallaceContinueLeadPlayerToCave:: @ 814D47C
	delay_16
	delay_16
	walk_left
	walk_left
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_down
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	walk_right
	step_end

SootopolisCity_EventScript_YouMustGoWithOrb:: @ 814D48F
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_YouMustGoWithBlueOrb, MSGBOX_NPC
	.else
	msgbox SootopolisCity_Text_YouMustGoWithRedOrb, MSGBOX_NPC
	.endif
	end

SootopolisCity_EventScript_YoullBeOkay:: @ 814D498
	lock
	faceplayer
	goto_if_set FLAG_LEGENDARY_BATTLE_COMPLETED, SootopolisCity_EventScript_14D4AD
	.ifdef SAPPHIRE
	msgbox SootopolisCity_Text_YoullBeOkaySapphire, MSGBOX_DEFAULT
	.else
	msgbox SootopolisCity_Text_YoullBeOkayRuby, MSGBOX_DEFAULT
	.endif
	release
	end

SootopolisCity_EventScript_14D4AD:: @ 814D4AD
	msgbox SootopolisCity_Text_WeOweItAllToYou, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFastestDown
	waitmovement 0
	delay 50
	setfieldeffectargument 0, 1
	dofieldeffect FLDEFF_NPCFLY_OUT
	delay 15
	removeobject VAR_LAST_TALKED
	waitfieldeffect FLDEFF_NPCFLY_OUT
	release
	end
