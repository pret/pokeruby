Route110_TrickHousePuzzle3_MapScripts:: @ 8161EBD
	map_script MAP_SCRIPT_ON_RESUME, Route110_TrickHousePuzzle3_OnResume
	map_script MAP_SCRIPT_ON_TRANSITION, Route110_TrickHousePuzzle3_OnTransition
	.byte 0

Route110_TrickHousePuzzle3_OnResume:: @ 8161EC8
	call Route110_TrickHousePuzzle3_EventScript_UpdateButtonMetatiles
	compare VAR_TEMP_9, 0
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetDoorsState0
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetDoorsState1
	end

Route110_TrickHousePuzzle3_OnTransition:: @ 8161EE4
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	setvar VAR_TEMP_3, 0
	setvar VAR_TEMP_4, 0
	setvar VAR_TEMP_5, 0
	setvar VAR_TEMP_6, 0
	setvar VAR_TEMP_7, 0
	setvar VAR_TEMP_8, 0
	setvar VAR_TEMP_9, 0
	end

Route110_TrickHousePuzzle3_EventScript_UpdateButtonMetatiles:: @ 8161F12
	setmetatile 5, 20, METATILE_TrickHousePuzzle_Button_Up, 0
	setmetatile 4, 12, METATILE_TrickHousePuzzle_Button_Up, 0
	setmetatile 11, 10, METATILE_TrickHousePuzzle_Button_Up, 0
	setmetatile 3, 8, METATILE_TrickHousePuzzle_Button_Up, 0
	setmetatile 13, 7, METATILE_TrickHousePuzzle_Button_Up, 0
	setmetatile 1, 3, METATILE_TrickHousePuzzle_Button_Up, 0
	setmetatile 10, 2, METATILE_TrickHousePuzzle_Button_Up, 0
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle3_EventScript_PressedButton1Metatile
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle3_EventScript_PressedButton2Metatile
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle3_EventScript_PressedButton3Metatile
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle3_EventScript_PressedButton4Metatile
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle3_EventScript_PressedButton5Metatile
	compare VAR_TEMP_8, 6
	call_if_eq Route110_TrickHousePuzzle3_EventScript_PressedButton6Metatile
	compare VAR_TEMP_8, 7
	call_if_eq Route110_TrickHousePuzzle3_EventScript_PressedButton7Metatile
	return

Route110_TrickHousePuzzle3_EventScript_PressedButton1Metatile:: @ 8161F9F
	setmetatile 5, 20, METATILE_TrickHousePuzzle_Button_Pressed, 0
	return

Route110_TrickHousePuzzle3_EventScript_PressedButton2Metatile:: @ 8161FA9
	setmetatile 4, 12, METATILE_TrickHousePuzzle_Button_Pressed, 0
	return

Route110_TrickHousePuzzle3_EventScript_PressedButton3Metatile:: @ 8161FB3
	setmetatile 11, 10, METATILE_TrickHousePuzzle_Button_Pressed, 0
	return

Route110_TrickHousePuzzle3_EventScript_PressedButton4Metatile:: @ 8161FBD
	setmetatile 3, 8, METATILE_TrickHousePuzzle_Button_Pressed, 0
	return

Route110_TrickHousePuzzle3_EventScript_PressedButton5Metatile:: @ 8161FC7
	setmetatile 13, 7, METATILE_TrickHousePuzzle_Button_Pressed, 0
	return

Route110_TrickHousePuzzle3_EventScript_PressedButton6Metatile:: @ 8161FD1
	setmetatile 1, 3, METATILE_TrickHousePuzzle_Button_Pressed, 0
	return

Route110_TrickHousePuzzle3_EventScript_PressedButton7Metatile:: @ 8161FDB
	setmetatile 10, 2, METATILE_TrickHousePuzzle_Button_Pressed, 0
	return

Route110_TrickHousePuzzle3_EventScript_SetDoorsState0:: @ 8161FE5
	setmetatile 1, 6, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 2, 6, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 1, 7, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 2, 7, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 4, 9, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 5, 9, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 4, 10, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 5, 10, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 4, 18, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 5, 18, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 4, 19, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 5, 19, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 7, 3, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 8, 3, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 7, 4, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 8, 4, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 7, 9, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 8, 9, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 7, 10, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 8, 10, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 7, 18, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 8, 18, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 7, 19, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 8, 19, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 13, 3, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 14, 3, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 13, 4, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 14, 4, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 13, 9, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 14, 9, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 13, 10, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 14, 10, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 13, 15, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile0, 0
	setmetatile 14, 15, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile1, 0
	setmetatile 13, 16, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile2, 0
	setmetatile 14, 16, METATILE_TrickHousePuzzle_BlueDoorH_Open_Tile3, 0
	setmetatile 3, 13, METATILE_TrickHousePuzzle_BlueDoorV_Retracted, 1
	setmetatile 3, 14, METATILE_TrickHousePuzzle_Floor_ShadowTop, 0
	setmetatile 6, 7, METATILE_TrickHousePuzzle_BlueDoorV_Retracted, 1
	setmetatile 6, 8, METATILE_TrickHousePuzzle_Floor_ShadowTop, 0
	setmetatile 9, 16, METATILE_TrickHousePuzzle_BlueDoorV_Retracted, 1
	setmetatile 9, 17, METATILE_TrickHousePuzzle_Floor_ShadowTop, 0
	setmetatile 12, 4, METATILE_TrickHousePuzzle_BlueDoorV_Retracted, 1
	setmetatile 12, 5, METATILE_TrickHousePuzzle_Floor_ShadowTop, 0
	setmetatile 12, 10, METATILE_TrickHousePuzzle_BlueDoorV_Retracted, 1
	setmetatile 12, 11, METATILE_TrickHousePuzzle_Floor_ShadowTop, 0
	setmetatile 1, 15, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile0, 0
	setmetatile 2, 15, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile1, 0
	setmetatile 1, 16, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile2, 1
	setmetatile 2, 16, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile3, 1
	setmetatile 4, 6, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile0, 0
	setmetatile 5, 6, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile1, 0
	setmetatile 4, 7, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile2, 1
	setmetatile 5, 7, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile3, 1
	setmetatile 7, 12, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile0, 0
	setmetatile 8, 12, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile1, 0
	setmetatile 7, 13, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile2, 1
	setmetatile 8, 13, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile3, 1
	setmetatile 10, 12, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile0, 0
	setmetatile 11, 12, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile1, 0
	setmetatile 10, 13, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile2, 1
	setmetatile 11, 13, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile3, 1
	setmetatile 10, 18, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile0, 0
	setmetatile 11, 18, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile1, 0
	setmetatile 10, 19, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile2, 1
	setmetatile 11, 19, METATILE_TrickHousePuzzle_RedDoorH_Closed_Tile3, 1
	setmetatile 3, 4, METATILE_TrickHousePuzzle_RedDoorV_Open0, 1
	setmetatile 3, 5, METATILE_TrickHousePuzzle_RedDoorV_Open1, 1
	setmetatile 6, 10, METATILE_TrickHousePuzzle_RedDoorV_Open0, 1
	setmetatile 6, 11, METATILE_TrickHousePuzzle_RedDoorV_Open1, 1
	setmetatile 6, 13, METATILE_TrickHousePuzzle_RedDoorV_Open0, 1
	setmetatile 6, 14, METATILE_TrickHousePuzzle_RedDoorV_Open1, 1
	setmetatile 6, 16, METATILE_TrickHousePuzzle_RedDoorV_Open0, 1
	setmetatile 6, 17, METATILE_TrickHousePuzzle_RedDoorV_Open1, 1
	setmetatile 9, 4, METATILE_TrickHousePuzzle_RedDoorV_Open0, 1
	setmetatile 9, 5, METATILE_TrickHousePuzzle_RedDoorV_Open1, 1
	setmetatile 9, 7, METATILE_TrickHousePuzzle_RedDoorV_Open0, 1
	setmetatile 9, 8, METATILE_TrickHousePuzzle_RedDoorV_Open1, 1
	setmetatile 12, 13, METATILE_TrickHousePuzzle_RedDoorV_Open0, 1
	setmetatile 12, 14, METATILE_TrickHousePuzzle_RedDoorV_Open1, 1
	setmetatile 12, 16, METATILE_TrickHousePuzzle_RedDoorV_Open0, 1
	setmetatile 12, 17, METATILE_TrickHousePuzzle_RedDoorV_Open1, 1
	return

Route110_TrickHousePuzzle3_EventScript_SetDoorsState1:: @ 81622C8
	setmetatile 1, 6, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 2, 6, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 1, 7, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 2, 7, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 4, 9, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 5, 9, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 4, 10, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 5, 10, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 4, 18, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 5, 18, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 4, 19, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 5, 19, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 7, 3, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 8, 3, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 7, 4, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 8, 4, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 7, 9, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 8, 9, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 7, 10, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 8, 10, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 7, 18, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 8, 18, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 7, 19, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 8, 19, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 13, 3, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 14, 3, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 13, 4, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 14, 4, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 13, 9, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 14, 9, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 13, 10, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 14, 10, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 13, 15, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile0, 0
	setmetatile 14, 15, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile1, 0
	setmetatile 13, 16, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile2, 1
	setmetatile 14, 16, METATILE_TrickHousePuzzle_BlueDoorH_Closed_Tile3, 1
	setmetatile 3, 13, METATILE_TrickHousePuzzle_BlueDoorV_Open0, 1
	setmetatile 3, 14, METATILE_TrickHousePuzzle_BlueDoorV_Open1, 1
	setmetatile 6, 7, METATILE_TrickHousePuzzle_BlueDoorV_Open0, 1
	setmetatile 6, 8, METATILE_TrickHousePuzzle_BlueDoorV_Open1, 1
	setmetatile 9, 16, METATILE_TrickHousePuzzle_BlueDoorV_Open0, 1
	setmetatile 9, 17, METATILE_TrickHousePuzzle_BlueDoorV_Open1, 1
	setmetatile 12, 4, METATILE_TrickHousePuzzle_BlueDoorV_Open0, 1
	setmetatile 12, 5, METATILE_TrickHousePuzzle_BlueDoorV_Open1, 1
	setmetatile 12, 10, METATILE_TrickHousePuzzle_BlueDoorV_Open0, 1
	setmetatile 12, 11, METATILE_TrickHousePuzzle_BlueDoorV_Open1, 1
	setmetatile 1, 15, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile0, 0
	setmetatile 2, 15, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile1, 0
	setmetatile 1, 16, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile2, 0
	setmetatile 2, 16, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile3, 0
	setmetatile 4, 6, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile0, 0
	setmetatile 5, 6, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile1, 0
	setmetatile 4, 7, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile2, 0
	setmetatile 5, 7, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile3, 0
	setmetatile 7, 12, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile0, 0
	setmetatile 8, 12, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile1, 0
	setmetatile 7, 13, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile2, 0
	setmetatile 8, 13, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile3, 0
	setmetatile 10, 12, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile0, 0
	setmetatile 11, 12, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile1, 0
	setmetatile 10, 13, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile2, 0
	setmetatile 11, 13, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile3, 0
	setmetatile 10, 18, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile0, 0
	setmetatile 11, 18, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile1, 0
	setmetatile 10, 19, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile2, 0
	setmetatile 11, 19, METATILE_TrickHousePuzzle_RedDoorH_Open_Tile3, 0
	setmetatile 3, 4, METATILE_TrickHousePuzzle_RedDoorV_Retracted, 1
	setmetatile 3, 5, METATILE_TrickHousePuzzle_Floor_ShadowTop_Alt, 0
	setmetatile 6, 10, METATILE_TrickHousePuzzle_RedDoorV_Retracted, 1
	setmetatile 6, 11, METATILE_TrickHousePuzzle_Floor_ShadowTop_Alt, 0
	setmetatile 6, 13, METATILE_TrickHousePuzzle_RedDoorV_Retracted, 1
	setmetatile 6, 14, METATILE_TrickHousePuzzle_Floor_ShadowTop_Alt, 0
	setmetatile 6, 16, METATILE_TrickHousePuzzle_RedDoorV_Retracted, 1
	setmetatile 6, 17, METATILE_TrickHousePuzzle_Floor_ShadowTop_Alt, 0
	setmetatile 9, 4, METATILE_TrickHousePuzzle_RedDoorV_Retracted, 1
	setmetatile 9, 5, METATILE_TrickHousePuzzle_Floor_ShadowTop_Alt, 0
	setmetatile 9, 7, METATILE_TrickHousePuzzle_RedDoorV_Retracted, 1
	setmetatile 9, 8, METATILE_TrickHousePuzzle_Floor_ShadowTop_Alt, 0
	setmetatile 12, 13, METATILE_TrickHousePuzzle_RedDoorV_Retracted, 1
	setmetatile 12, 14, METATILE_TrickHousePuzzle_Floor_ShadowTop_Alt, 0
	setmetatile 12, 16, METATILE_TrickHousePuzzle_RedDoorV_Retracted, 1
	setmetatile 12, 17, METATILE_TrickHousePuzzle_Floor_ShadowTop_Alt, 0
	return

Route110_TrickHousePuzzle3_EventScript_Button1:: @ 81625AB
	lockall
	setvar VAR_TEMP_8, 1
	goto Route110_TrickHousePuzzle3_EventScript_PressButton
	end

Route110_TrickHousePuzzle3_EventScript_Button2:: @ 81625B7
	lockall
	setvar VAR_TEMP_8, 2
	goto Route110_TrickHousePuzzle3_EventScript_PressButton
	end

Route110_TrickHousePuzzle3_EventScript_Button3:: @ 81625C3
	lockall
	setvar VAR_TEMP_8, 3
	goto Route110_TrickHousePuzzle3_EventScript_PressButton
	end

Route110_TrickHousePuzzle3_EventScript_Button4:: @ 81625CF
	lockall
	setvar VAR_TEMP_8, 4
	goto Route110_TrickHousePuzzle3_EventScript_PressButton
	end

Route110_TrickHousePuzzle3_EventScript_Button5:: @ 81625DB
	lockall
	setvar VAR_TEMP_8, 5
	goto Route110_TrickHousePuzzle3_EventScript_PressButton
	end

Route110_TrickHousePuzzle3_EventScript_Button6:: @ 81625E7
	lockall
	setvar VAR_TEMP_8, 6
	goto Route110_TrickHousePuzzle3_EventScript_PressButton
	end

Route110_TrickHousePuzzle3_EventScript_Button7:: @ 81625F3
	lockall
	setvar VAR_TEMP_8, 7
	goto Route110_TrickHousePuzzle3_EventScript_PressButton
	end

Route110_TrickHousePuzzle3_EventScript_PressButton:: @ 81625FF
	call Route110_TrickHousePuzzle3_EventScript_SetButton
	playse SE_PIN
	call Route110_TrickHousePuzzle3_EventScript_UpdateButtonMetatiles
	goto Route110_TrickHousePuzzle3_EventScript_AlternateDoors
	end

Route110_TrickHousePuzzle3_EventScript_SetButton:: @ 8162612
	setvar VAR_TEMP_1, 0
	setvar VAR_TEMP_2, 0
	setvar VAR_TEMP_3, 0
	setvar VAR_TEMP_4, 0
	setvar VAR_TEMP_5, 0
	setvar VAR_TEMP_6, 0
	setvar VAR_TEMP_7, 0
	compare VAR_TEMP_8, 1
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetButton1
	compare VAR_TEMP_8, 2
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetButton2
	compare VAR_TEMP_8, 3
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetButton3
	compare VAR_TEMP_8, 4
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetButton4
	compare VAR_TEMP_8, 5
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetButton5
	compare VAR_TEMP_8, 6
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetButton6
	compare VAR_TEMP_8, 7
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetButton7
	return

Route110_TrickHousePuzzle3_EventScript_SetButton1:: @ 8162683
	setvar VAR_TEMP_1, 1
	return

Route110_TrickHousePuzzle3_EventScript_SetButton2:: @ 8162689
	setvar VAR_TEMP_2, 1
	return

Route110_TrickHousePuzzle3_EventScript_SetButton3:: @ 816268F
	setvar VAR_TEMP_3, 1
	return

Route110_TrickHousePuzzle3_EventScript_SetButton4:: @ 8162695
	setvar VAR_TEMP_4, 1
	return

Route110_TrickHousePuzzle3_EventScript_SetButton5:: @ 816269B
	setvar VAR_TEMP_5, 1
	return

Route110_TrickHousePuzzle3_EventScript_SetButton6:: @ 81626A1
	setvar VAR_TEMP_6, 1
	return

Route110_TrickHousePuzzle3_EventScript_SetButton7:: @ 81626A7
	setvar VAR_TEMP_7, 1
	return

Route110_TrickHousePuzzle3_EventScript_AlternateDoors:: @ 81626AD
	compare VAR_TEMP_9, 1
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetDoorsState0
	compare VAR_TEMP_9, 0
	call_if_eq Route110_TrickHousePuzzle3_EventScript_SetDoorsState1
	special DrawWholeMapView
	compare VAR_TEMP_9, 1
	goto_if_eq Route110_TrickHousePuzzle3_EventScript_ClearAltDoorState
	compare VAR_TEMP_9, 0
	goto_if_eq Route110_TrickHousePuzzle3_EventScript_SetAltDoorState
	end

Route110_TrickHousePuzzle3_EventScript_ClearAltDoorState:: @ 81626DD
	setvar VAR_TEMP_9, 0
	releaseall
	end

Route110_TrickHousePuzzle3_EventScript_SetAltDoorState:: @ 81626E4
	setvar VAR_TEMP_9, 1
	releaseall
	end

Route110_TrickHousePuzzle3_EventScript_Scroll:: @ 81626EB
	lockall
	compare VAR_TRICK_HOUSE_PUZZLE_3_STATE, 0
	goto_if_eq Route110_TrickHousePuzzle3_EventScript_ReadScroll
	goto Route110_TrickHousePuzzle3_EventScript_ReadScrollAgain
	end

Route110_TrickHousePuzzle3_EventScript_ReadScroll:: @ 81626FD
	setvar VAR_TRICK_HOUSE_PUZZLE_3_STATE, 1
	goto Route110_TrickHousePuzzle3_EventScript_FoundScroll
	end

Route110_TrickHousePuzzle3_EventScript_Justin:: @ 8162708
	trainerbattle_single TRAINER_JUSTIN, Route110_TrickHousePuzzle3_Text_JustinIntro, Route110_TrickHousePuzzle3_Text_JustinDefeat
	msgbox Route110_TrickHousePuzzle3_Text_JustinPostBattle, MSGBOX_AUTOCLOSE
	end

Route110_TrickHousePuzzle3_EventScript_Martha:: @ 816271F
	trainerbattle_single TRAINER_MARTHA, Route110_TrickHousePuzzle3_Text_MarthaIntro, Route110_TrickHousePuzzle3_Text_MarthaDefeat
	msgbox Route110_TrickHousePuzzle3_Text_MarthaPostBattle, MSGBOX_AUTOCLOSE
	end

Route110_TrickHousePuzzle3_EventScript_Alan:: @ 8162736
	trainerbattle_single TRAINER_ALAN, Route110_TrickHousePuzzle3_Text_AlanIntro, Route110_TrickHousePuzzle3_Text_AlanDefeat
	msgbox Route110_TrickHousePuzzle3_Text_AlanPostBattle, MSGBOX_AUTOCLOSE
	end
