SecretBase_MapScripts:: @ 815F337
    map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, SecretBase_OnWarp
    map_script MAP_SCRIPT_ON_TRANSITION, SecretBase_OnTransition
    map_script MAP_SCRIPT_ON_FRAME_TABLE, SecretBase_OnFrame
    map_script MAP_SCRIPT_ON_RESUME, SecretBase_OnResume
    .byte 0

SecretBase_OnResume:: @ 815F34C
    setstepcallback 6
    end

SecretBase_OnTransition:: @ 815F34F
    call SecretBase_EventScript_SetDecorationFlags
    special SetSecretBaseOwnerGfxId
    end

SecretBase_OnWarp:: @ 815F358
    map_script_2 VAR_SECRET_BASE_INITIALIZED, 0, SecretBase_EventScript_InitDecorations
    .2byte 0

SecretBase_OnFrame:: @ 815F362
    map_script_2 VAR_INIT_SECRET_BASE, 0, SecretBase_EventScript_FirstEntrance
    .2byte 0

SecretBase_EventScript_PC:: @ 815F36C
	lockall
	playse SE_PC_LOGON
	message SecretBase_Text_BootUpPC
	dofieldeffect FLDEFF_SECRET_BASE_PC_TURN_ON
	waitstate
	waitmessage
	waitbuttonpress
	playse SE_SELECT
	goto SecretBase_EventScript_PCShowMainMenu
	end

SecretBase_EventScript_PCShowMainMenu:
	message SecretBase_Text_WhatWouldYouLikeToDo
	waitmessage
	goto_if_set FLAG_SECRET_BASE_REGISTRY_ENABLED, SecretBase_EventScript_PCMainMenuWithRegister
	goto SecretBase_EventScript_PCMainMenuWithoutRegister
	end

SecretBase_EventScript_PCCancel:: @ 815F399
	lockall
	goto SecretBase_EventScript_PCShowMainMenu
	end

SecretBase_EventScript_PCMainMenuWithRegister:
	multichoice 0, 0, 6, 0
	switch VAR_RESULT
	case 0, SecretBase_EventScript_PCDecorationMenu
	case 1, SecretBase_EventScript_PCPackUp
	case 2, SecretBase_EventScript_PCRegistryMenu
	case 3, SecretBase_EventScript_PCTurnOff
	case 127, SecretBase_EventScript_PCTurnOff
	end

SecretBase_EventScript_PCMainMenuWithoutRegister:
	multichoice 0, 0, 5, 0
	switch VAR_RESULT
	case 0, SecretBase_EventScript_PCDecorationMenu
	case 1, SecretBase_EventScript_PCPackUp
	case 2, SecretBase_EventScript_PCTurnOff
	case 127, SecretBase_EventScript_PCTurnOff
	end

SecretBase_EventScript_PCPackUp:
	msgbox SecretBase_Text_AllDecorationsWillBeReturned, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_EventScript_PCShowMainMenu
	closemessage
	special MoveOutOfSecretBase
	releaseall
	end

SecretBase_EventScript_PCDecorationMenu:
	special SecretBasePC_Decoration
	end

SecretBase_EventScript_PCRegistryMenu:
	special SecretBasePC_Registry
	end

SecretBase_EventScript_RecordMixingPC:: @ 815F43A
	lockall
	message SecretBase_Text_BootUpPC
	playse SE_PC_LOGON
	dofieldeffect FLDEFF_SECRET_BASE_PC_TURN_ON
	waitstate
	waitmessage
	waitbuttonpress
	playse SE_SELECT
	goto SecretBase_EventScript_PCRegisterMenu
	end

SecretBase_EventScript_PCRegisterMenu:
	message SecretBase_Text_WhatWouldYouLikeToDo
	waitmessage
	multichoice 0, 0, 7, 0
	switch VAR_RESULT
	case 0, SecretBase_EventScript_PCRegister
	case 1, SecretBase_EventScript_PCRegistryMenu
	case 2, SecretBase_EventScript_PCRegistryInfo
	case 3, SecretBase_EventScript_PCTurnOff
	case 127, SecretBase_EventScript_PCTurnOff
	end

SecretBase_EventScript_ShowRegisterMenu:: @ 815F49A
	lockall
	goto SecretBase_EventScript_PCRegisterMenu
	end

SecretBase_EventScript_PCRegister:
	special GetCurSecretBaseRegistrationValidity
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_EventScript_AlreadyRegistered
	compare VAR_RESULT, 2
	goto_if_eq SecretBase_EventScript_CantRegisterTooManyBases
	special BufferSecretBaseOwnerName
	msgbox SecretBase_Text_WantToRegisterSecretBase, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_EventScript_PCRegisterMenu
	msgbox SecretBase_Text_RegistrationCompleted, MSGBOX_SIGN
	special ToggleCurSecretBaseRegistry
	special DoSecretBasePCTurnOffEffect
	releaseall
	end

SecretBase_EventScript_AlreadyRegistered:
	msgbox SecretBase_Text_AlreadyRegisteredDelete, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SecretBase_EventScript_PCRegisterMenu
	msgbox SecretBase_Text_DataUnregistered, MSGBOX_SIGN
	special ToggleCurSecretBaseRegistry
	special DoSecretBasePCTurnOffEffect
	releaseall
	end

SecretBase_EventScript_CantRegisterTooManyBases:
	msgbox SecretBase_Text_TooManyBasesDeleteSome, MSGBOX_SIGN
	special DoSecretBasePCTurnOffEffect
	closemessage
	releaseall
	end

SecretBase_EventScript_PCRegistryInfo:
	message SecretBase_Text_RegistryInfo
	waitmessage
	goto SecretBase_EventScript_PCRegisterMenu
	end

SecretBase_EventScript_PCTurnOff:
	special DoSecretBasePCTurnOffEffect
	closemessage
	releaseall
	end

SecretBase_EventScript_SandOrnament:: @ 815F523
	dofieldeffect FLDEFF_SAND_PILLAR
	waitstate
	end

SecretBase_EventScript_ShieldOrToyTV:: @ 815F528
	special GetShieldToyTVDecorationInfo
	compare VAR_RESULT, 0
	goto_if_eq SecretBase_EventScript_BattleTowerShield
	compare VAR_RESULT, 1
	goto_if_eq SecretBase_EventScript_ToyTV
	compare VAR_RESULT, 2
	goto_if_eq SecretBase_EventScript_SeedotTV
	compare VAR_RESULT, 3
	goto_if_eq SecretBase_EventScript_SkittyTV
	end

SecretBase_EventScript_BattleTowerShield:
	msgbox SecretBase_Text_BattleTowerShield, MSGBOX_SIGN
	end

SecretBase_EventScript_ToyTV:
	msgbox SecretBase_Text_ToyTV, MSGBOX_SIGN
	end

SecretBase_EventScript_SeedotTV:
	msgbox SecretBase_Text_SeedotTV, MSGBOX_SIGN
	end

SecretBase_EventScript_SkittyTV:
	msgbox SecretBase_Text_SkittyTV, MSGBOX_SIGN
	end
