EventScript_PC:: @ 81A0009
	lockall
	setvar VAR_0x8004, 0
	special DoPCTurnOnEffect
	playse SE_PC_ON
	msgbox Text_BootUpPC, MSGBOX_DEFAULT
	goto EventScript_PCMainMenu
	end

EventScript_PCMainMenu:
	message Text_WhichPCShouldBeAccessed
	waitmessage
	special ScriptMenu_CreatePCMultichoice
	waitstate
	goto EventScript_AccessPC
	end

EventScript_AccessPC:
	switch VAR_RESULT
	case 0, EventScript_AccessPokemonStorage
	case 1, EventScript_AccessPlayersPC
	case 2, EventScript_AccessHallOfFame
	case 3, EventScript_TurnOffPC
	case MULTI_B_PRESSED, EventScript_TurnOffPC
	end

EventScript_AccessPlayersPC:
	playse SE_PC_LOGON
	msgbox Text_AccessedPlayersPC, MSGBOX_DEFAULT
	special PlayerPC
	waitstate
	goto EventScript_PCMainMenu
	end

EventScript_AccessPokemonStorage:
	playse SE_PC_LOGON
	call_if_unset FLAG_SYS_PC_LANETTE, EventScript_AccessSomeonesPC
	call_if_set FLAG_SYS_PC_LANETTE, EventScript_AccessLanettesPC
	msgbox Text_StorageSystemOpened, MSGBOX_DEFAULT
	special ShowPokemonStorageSystem
	waitstate
	goto EventScript_PCMainMenu
	end

EventScript_AccessSomeonesPC:
	msgbox Text_AccessedSomeonesPC, MSGBOX_DEFAULT
	return

EventScript_AccessLanettesPC:
	msgbox Text_AccessedLanettesPC, MSGBOX_DEFAULT
	return

EventScript_TurnOffPC:
	setvar VAR_0x8004, 0
	playse SE_PC_OFF
	special DoPCTurnOffEffect
	releaseall
	end

EventScript_AccessHallOfFame:
	goto_if_unset FLAG_SYS_GAME_CLEAR, EventScript_TurnOffPC
	playse SE_PC_LOGON
	special AccessHallOfFamePC
	waitstate
	goto EventScript_AccessPC
	end
