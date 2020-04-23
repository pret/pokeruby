MtPyre_2F_MapScripts:: @ 815D36E
	map_script MAP_SCRIPT_ON_FRAME_TABLE, MtPyre_2F_MapScript2_1C6BB5
	map_script MAP_SCRIPT_ON_TRANSITION, MtPyre_2F_MapScript1_1C6BBF
	map_script MAP_SCRIPT_ON_RESUME, MtPyre_2F_MapScript1_15D37E
	.byte 0

MtPyre_2F_MapScript1_15D37E:: @ 815D37E
	setstepcallback 7
	setholewarp MAP_MT_PYRE_1F, 255, 0, 0
	end

MtPyre_2F_EventScript_15D389:: @ 815D389
	msgbox MtPyre_2F_Text_1965BB, MSGBOX_NPC
	end

MtPyre_2F_EventScript_15D392:: @ 815D392
	msgbox MtPyre_2F_Text_196600, MSGBOX_NPC
	end

MtPyre_2F_EventScript_15D39B:: @ 815D39B
	trainerbattle_single TRAINER_MARK, MtPyre_2F_Text_196674, MtPyre_2F_Text_1966BE
	msgbox MtPyre_2F_Text_1966E7, MSGBOX_AUTOCLOSE
	end

MtPyre_2F_EventScript_15D3B2:: @ 815D3B2
	trainerbattle_double TRAINER_DEZ_AND_LUKE, MtPyre_2F_Text_1962C6, MtPyre_2F_Text_196358, MtPyre_2F_Text_1963CB
	msgbox MtPyre_2F_Text_196368, MSGBOX_AUTOCLOSE
	end

MtPyre_2F_EventScript_15D3CD:: @ 815D3CD
	trainerbattle_double TRAINER_DEZ_AND_LUKE, MtPyre_2F_Text_196449, MtPyre_2F_Text_1964EB, MtPyre_2F_Text_196539
	msgbox MtPyre_2F_Text_196504, MSGBOX_AUTOCLOSE
	end
