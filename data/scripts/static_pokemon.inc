Hideout_B1F_EventScript_Electrode1:: @ 81A04FD
	lock
	faceplayer
	setwildbattle SPECIES_ELECTRODE, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_ELECTRODE, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_ELECTRODE_1_HIDEOUT
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end

Hideout_B1F_EventScript_Electrode2:: @ 81A051B
	lock
	faceplayer
	setwildbattle SPECIES_ELECTRODE, 30, ITEM_NONE
	waitse
	playmoncry SPECIES_ELECTRODE, 2
	delay 40
	waitmoncry
	setflag FLAG_HIDE_ELECTRODE_2_HIDEOUT
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end

Route120_EventScript_Kecleon1:: @ 81A0539
	lock
	faceplayer
	setvar VAR_0x8004, 1
	goto EventScript_Kecleon
	end

Route120_EventScript_Kecleon2:: @ 81A0546
	lock
	faceplayer
	setvar VAR_0x8004, 2
	goto EventScript_Kecleon
	end

Route120_EventScript_Kecleon3:: @ 81A0553
	lock
	faceplayer
	setvar VAR_0x8004, 3
	goto EventScript_Kecleon
	end

Route120_EventScript_Kecleon4:: @ 81A0560
	lock
	faceplayer
	setvar VAR_0x8004, 4
	goto EventScript_Kecleon
	end

Route120_EventScript_Kecleon5:: @ 81A056D
	lock
	faceplayer
	setvar VAR_0x8004, 5
	goto EventScript_Kecleon
	end

Route119_EventScript_Kecleon1:: @ 81A057A
	lock
	faceplayer
	setvar VAR_0x8004, 6
	goto EventScript_Kecleon
	end

Route119_EventScript_Kecleon2:: @ 81A0587
	lock
	faceplayer
	setvar VAR_0x8004, 7
	goto EventScript_Kecleon
	end

EventScript_Kecleon:: @ 81A0594
	checkitem ITEM_DEVON_SCOPE, 1
	compare VAR_RESULT, 1
	goto_if_eq EventScript_AskUseDevonScope
	msgbox Text_SomethingUnseeable, MSGBOX_DEFAULT
	release
	end

EventScript_AskUseDevonScope:: @ 81A05AE
	msgbox Text_WantToUseDevonScope, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq EventScript_BattleKecleon
	release
	end

EventScript_BattleKecleon:: @ 81A05C3
	msgbox Text_UseDevonScopeMonAttacked, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_FacePlayer
	waitmovement 0
	applymovement VAR_LAST_TALKED, Movement_KecleonAppears
	waitmovement 0
	waitse
	playmoncry SPECIES_KECLEON, 2
	delay 40
	waitmoncry
	setwildbattle SPECIES_KECLEON, 30, ITEM_NONE
	compare VAR_0x8004, 1
	call_if_eq Route120_EventScript_HideKecleon1
	compare VAR_0x8004, 2
	call_if_eq Route120_EventScript_HideKecleon2
	compare VAR_0x8004, 3
	call_if_eq Route120_EventScript_HideKecleon3
	compare VAR_0x8004, 4
	call_if_eq Route120_EventScript_HideKecleon4
	compare VAR_0x8004, 5
	call_if_eq Route120_EventScript_HideKecleon5
	compare VAR_0x8004, 6
	call_if_eq Route119_EventScript_HideKecleon1
	compare VAR_0x8004, 7
	call_if_eq Route119_EventScript_HideKecleon2
	setflag FLAG_SYS_CTRL_OBJ_DELETE
	dowildbattle
	clearflag FLAG_SYS_CTRL_OBJ_DELETE
	release
	end

Route120_EventScript_HideKecleon1:: @ 81A0646
	setflag FLAG_HIDE_KECLEON_ROUTE120_3
	return

Route120_EventScript_HideKecleon2:: @ 81A064A
	setflag FLAG_HIDE_KECLEON_ROUTE120_4
	return

Route120_EventScript_HideKecleon3:: @ 81A064E
	setflag FLAG_HIDE_KECLEON_ROUTE120_5
	return

Route120_EventScript_HideKecleon4:: @ 81A0652
	setflag FLAG_HIDE_KECLEON_ROUTE120_6
	return

Route120_EventScript_HideKecleon5:: @ 81A0656
	setflag FLAG_HIDE_KECLEON_ROUTE120_7
	return

Route119_EventScript_HideKecleon1:: @ 81A065A
	setflag FLAG_HIDE_KECLEON_ROUTE119_1
	return

Route119_EventScript_HideKecleon2:: @ 81A065E
	setflag FLAG_HIDE_KECLEON_ROUTE119_2
	return

Movement_KecleonAppears:: @ 81A0662
	set_visible
	delay_4
	set_invisible
	delay_4
	set_visible
	delay_4
	set_invisible
	delay_4
	set_visible
	delay_8
	set_invisible
	delay_8
	set_visible
	delay_8
	set_invisible
	delay_8
	set_visible
	delay_16
	set_invisible
	delay_16
	set_visible
	step_end
