AquaHideout_1F_MapScripts:: @ 815D7C2
	map_script MAP_SCRIPT_ON_TRANSITION, AquaHideout_1F_MapScript1_15D7C8
	.byte 0

AquaHideout_1F_MapScript1_15D7C8:: @ 815D7C8
	call Common_EventScript_SetupEvilTeamGfxIds
	end

AquaHideout_1F_EventScript_15D7CE:: @ 815D7CE
MagmaHideout_1F_EventScript_15D7CE:: @ 815D7CE
	lock
	faceplayer
	goto_if_set FLAG_MT_PYRE_ORB_STOLEN, AquaHideout_1F_EventScript_15D7E3
	msgbox AquaHideout_1F_Text_196AFD, MSGBOX_DEFAULT
	release
	end

AquaHideout_1F_EventScript_15D7E3:: @ 815D7E3
	msgbox AquaHideout_1F_Text_196BC5, MSGBOX_DEFAULT
	release
	end

AquaHideout_1F_EventScript_15D7ED:: @ 815D7ED
MagmaHideout_1F_EventScript_15D7ED:: @ 815D7ED
	lock
	faceplayer
	goto_if_set FLAG_MT_PYRE_ORB_STOLEN, AquaHideout_1F_EventScript_15D802
	msgbox AquaHideout_1F_Text_196C83, MSGBOX_DEFAULT
	release
	end

AquaHideout_1F_EventScript_15D802:: @ 815D802
	msgbox AquaHideout_1F_Text_196D46, MSGBOX_DEFAULT
	release
	end

AquaHideout_1F_EventScript_15D80C:: @ 815D80C
MagmaHideout_1F_EventScript_15D80C:: @ 815D80C
	trainerbattle_single TRAINER_HIDEOUT_1F_GRUNT, AquaHideout_1F_Text_196E01, AquaHideout_1F_Text_196E28, AquaHideout_1F_EventScript_15D827
	msgbox AquaHideout_1F_Text_196E3D, MSGBOX_AUTOCLOSE
	end

AquaHideout_1F_EventScript_15D827:: @ 815D827
	msgbox AquaHideout_1F_Text_196E3D, MSGBOX_DEFAULT
	release
	end
