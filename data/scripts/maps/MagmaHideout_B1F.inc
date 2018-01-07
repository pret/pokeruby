MagmaHideout_B1F_MapScripts:: @ 815F2A8
	map_script 5, MagmaHideout_B1F_MapScript1_15F2AE
	.byte 0

MagmaHideout_B1F_MapScript1_15F2AE:: @ 815F2AE
	call_if_set FLAG_SYS_CTRL_OBJ_DELETE, MagmaHideout_B1F_EventScript_15F2B8
	end

MagmaHideout_B1F_EventScript_15F2B8:: @ 815F2B8
	removeobject LAST_TALKED
	return
