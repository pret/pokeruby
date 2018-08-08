AquaHideout_B1F_MapScripts:: @ 815D831
	map_script 5, AquaHideout_B1F_MapScript1_15D83C
	map_script 3, AquaHideout_B1F_MapScript1_15D84A
	.byte 0

AquaHideout_B1F_MapScript1_15D83C:: @ 815D83C
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, AquaHideout_B1F_EventScript_15D846
	end

AquaHideout_B1F_EventScript_15D846:: @ 815D846
	removeobject LAST_TALKED
	return

AquaHideout_B1F_MapScript1_15D84A:: @ 815D84A
	call AquaHideout_B1F_EventScript_1A0196
	end

AquaHideout_B1F_EventScript_15D850:: @ 815D850
MagmaHideout_B1F_EventScript_15D850:: @ 815D850
	trainerbattle 2, TRAINER_HIDEOUT_B1F_GRUNT_1, 0, AquaHideout_B1F_Text_196E6F, AquaHideout_B1F_Text_196EB6, AquaHideout_B1F_EventScript_15D86B
	msgbox AquaHideout_B1F_Text_196ECC, 6
	end

AquaHideout_B1F_EventScript_15D86B:: @ 815D86B
	msgbox AquaHideout_B1F_Text_196ECC, 4
	release
	end

AquaHideout_B1F_EventScript_15D875:: @ 815D875
MagmaHideout_B1F_EventScript_15D875:: @ 815D875
	trainerbattle 2, TRAINER_HIDEOUT_B1F_GRUNT_2, 0, AquaHideout_B1F_Text_196F39, AquaHideout_B1F_Text_196F9B, AquaHideout_B1F_EventScript_15D890
	msgbox AquaHideout_B1F_Text_196FB5, 6
	end

AquaHideout_B1F_EventScript_15D890:: @ 815D890
	msgbox AquaHideout_B1F_Text_196FB5, 4
	release
	end

AquaHideout_B1F_EventScript_15D89A:: @ 815D89A
MagmaHideout_B1F_EventScript_15D89A:: @ 815D89A
	trainerbattle 0, TRAINER_HIDEOUT_B1F_GRUNT_3, 0, AquaHideout_B1F_Text_196FFD, AquaHideout_B1F_Text_197040
	msgbox AquaHideout_B1F_Text_197056, 6
	end
