RusturfTunnel_MapScripts:: @ 815C745
	map_script 3, RusturfTunnel_MapScript1_15C762
	map_script 2, RusturfTunnel_MapScript2_15C750
	.byte 0

RusturfTunnel_MapScript2_15C750:: @ 815C750
	map_script_2 0x409a, 4, RusturfTunnel_EventScript_15C7D1
	map_script_2 0x409a, 5, RusturfTunnel_EventScript_15C7D1
	.2byte 0

RusturfTunnel_MapScript1_15C762:: @ 815C762
	call RusturfTunnel_EventScript_1A0196
	compare 0x409a, 2
	call_if 1, RusturfTunnel_EventScript_15C773
	end

RusturfTunnel_EventScript_15C773:: @ 815C773
	setobjectxyperm 7, 13, 4
	setobjectxyperm 6, 13, 5
	return

RusturfTunnel_EventScript_15C782:: @ 815C782
	lock
	faceplayer
	msgbox RusturfTunnel_Text_194766, 4
	closemessage
	applymovement LAST_TALKED, RusturfTunnel_Movement_1A083D
	waitmovement 0
	release
	end

RusturfTunnel_EventScript_15C799:: @ 815C799
	lock
	faceplayer
	checkflag FLAG_TEMP_1
	goto_if_eq RusturfTunnel_EventScript_15C7BC
	setflag FLAG_TEMP_1
	msgbox RusturfTunnel_Text_1944C5, 4
	closemessage
	applymovement LAST_TALKED, RusturfTunnel_Movement_1A083D
	waitmovement 0
	release
	end

RusturfTunnel_EventScript_15C7BC:: @ 815C7BC
	msgbox RusturfTunnel_Text_1945B2, 4
	closemessage
	applymovement LAST_TALKED, RusturfTunnel_Movement_1A083D
	waitmovement 0
	release
	end

RusturfTunnel_EventScript_15C7D1:: @ 815C7D1
	lockall
	compare 0x4001, 1
	call_if 1, RusturfTunnel_EventScript_15C8CA
	compare 0x4001, 2
	call_if 1, RusturfTunnel_EventScript_15C8DF
	compare 0x4001, 3
	call_if 1, RusturfTunnel_EventScript_15C8EA
	call RusturfTunnel_EventScript_15C92D
	msgbox RusturfTunnel_Text_19461D, 4
	compare 0x4001, 2
	call_if 1, RusturfTunnel_EventScript_15C8EB
	compare 0x4001, 3
	call_if 1, RusturfTunnel_EventScript_15C8EB
	giveitem ITEM_HM04
	setflag 106
	msgbox RusturfTunnel_Text_194693, 4
	closemessage
	compare 0x4001, 1
	call_if 1, RusturfTunnel_EventScript_15C880
	compare 0x4001, 2
	call_if 1, RusturfTunnel_EventScript_15C892
	compare 0x4001, 3
	call_if 1, RusturfTunnel_EventScript_15C8AE
	msgbox RusturfTunnel_Text_194706, 4
	closemessage
	compare 0x4001, 1
	call_if 1, RusturfTunnel_EventScript_15C8F7
	compare 0x4001, 2
	call_if 1, RusturfTunnel_EventScript_15C909
	compare 0x4001, 3
	call_if 1, RusturfTunnel_EventScript_15C91B
	call RusturfTunnel_EventScript_1A0442
	releaseall
	end

RusturfTunnel_EventScript_15C880:: @ 815C880
	applymovement 255, RusturfTunnel_Movement_15C96A
	applymovement 1, RusturfTunnel_Movement_15C98F
	waitmovement 0
	return

RusturfTunnel_EventScript_15C892:: @ 815C892
	applymovement 255, RusturfTunnel_Movement_15C96D
	applymovement 1, RusturfTunnel_Movement_15C994
	waitmovement 0
	applymovement 10, RusturfTunnel_Movement_1A0845
	waitmovement 0
	return

RusturfTunnel_EventScript_15C8AE:: @ 815C8AE
	applymovement 255, RusturfTunnel_Movement_15C96D
	applymovement 1, RusturfTunnel_Movement_15C994
	waitmovement 0
	applymovement 10, RusturfTunnel_Movement_1A0845
	waitmovement 0
	return

RusturfTunnel_EventScript_15C8CA:: @ 815C8CA
	applymovement 1, RusturfTunnel_Movement_1A0841
	waitmovement 0
	applymovement 255, RusturfTunnel_Movement_1A0845
	waitmovement 0
	return

RusturfTunnel_EventScript_15C8DF:: @ 815C8DF
	applymovement 1, RusturfTunnel_Movement_15C970
	waitmovement 0
	return

RusturfTunnel_EventScript_15C8EA:: @ 815C8EA
	return

RusturfTunnel_EventScript_15C8EB:: @ 815C8EB
	closemessage
	applymovement 1, RusturfTunnel_Movement_15C98D
	waitmovement 0
	return

RusturfTunnel_EventScript_15C8F7:: @ 815C8F7
	applymovement 10, RusturfTunnel_Movement_15C945
	applymovement 1, RusturfTunnel_Movement_15C973
	waitmovement 0
	return

RusturfTunnel_EventScript_15C909:: @ 815C909
	applymovement 10, RusturfTunnel_Movement_15C951
	applymovement 1, RusturfTunnel_Movement_15C980
	waitmovement 0
	return

RusturfTunnel_EventScript_15C91B:: @ 815C91B
	applymovement 10, RusturfTunnel_Movement_15C951
	applymovement 1, RusturfTunnel_Movement_15C980
	waitmovement 0
	return

RusturfTunnel_EventScript_15C92D:: @ 815C92D
	playse 21
	applymovement 1, RusturfTunnel_Movement_1A0833
	waitmovement 0
	applymovement 1, RusturfTunnel_Movement_1A0835
	waitmovement 0
	return

RusturfTunnel_Movement_15C945:: @ 815C945
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

RusturfTunnel_Movement_15C951:: @ 815C951
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

@ 815C95D
	step_left
	step_28
	step_end

@ 815C960
	step_down
	step_26
	step_13
	step_28
	step_end

@ 815C965
	step_up
	step_25
	step_13
	step_28
	step_end

RusturfTunnel_Movement_15C96A:: @ 815C96A
	step_left
	step_28
	step_end

RusturfTunnel_Movement_15C96D:: @ 815C96D
	step_right
	step_27
	step_end

RusturfTunnel_Movement_15C970:: @ 815C970
	step_up
	step_28
	step_end

RusturfTunnel_Movement_15C973:: @ 815C973
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

RusturfTunnel_Movement_15C980:: @ 815C980
	step_up
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

RusturfTunnel_Movement_15C98D:: @ 815C98D
	step_right
	step_end

RusturfTunnel_Movement_15C98F:: @ 815C98F
	step_22
	step_22
	step_16
	step_18
	step_end

RusturfTunnel_Movement_15C994:: @ 815C994
	step_24
	step_24
	step_18
	step_26
	step_end

RusturfTunnel_EventScript_15C999:: @ 815C999
	setvar 0x4001, 1
	end

RusturfTunnel_EventScript_15C99F:: @ 815C99F
	setvar 0x4001, 2
	end

RusturfTunnel_EventScript_15C9A5:: @ 815C9A5
	setvar 0x4001, 3
	end

RusturfTunnel_EventScript_15C9AB:: @ 815C9AB
	lockall
	msgbox RusturfTunnel_Text_194159, 4
	closemessage
	applymovement 6, RusturfTunnel_Movement_15C9D3
	applymovement 7, RusturfTunnel_Movement_15C9D3
	waitmovement 0
	moveobjectoffscreen 6
	moveobjectoffscreen 7
	setvar 0x409a, 3
	releaseall
	end

RusturfTunnel_Movement_15C9D3:: @ 815C9D3
	step_40
	step_right
	step_41
	step_end

RusturfTunnel_EventScript_15C9D7:: @ 815C9D7
	lock
	faceplayer
	waitse
	playpokecry SPECIES_WINGULL, 0
	msgbox RusturfTunnel_Text_194188, 4
	waitpokecry
	release
	end

RusturfTunnel_EventScript_15C9EA:: @ 815C9EA
	lock
	faceplayer
	playbgm BGM_EVIL_TEAM, 0
	msgbox RusturfTunnel_Text_19419B, 4
	trainerbattle 3, OPPONENT_RUSTURF_TUNNEL_GRUNT, 0, RusturfTunnel_Text_194243
	msgbox RusturfTunnel_Text_194274, 4
	giveitem ITEM_DEVON_GOODS
	closemessage
	applymovement 255, RusturfTunnel_Movement_15CA99
	applymovement 6, RusturfTunnel_Movement_15CAA2
	waitmovement 0
	removeobject 6
	delay 50
	addobject 5
	applymovement 5, RusturfTunnel_Movement_15CAAC
	waitmovement 0
	applymovement 255, RusturfTunnel_Movement_15CA9F
	applymovement 5, RusturfTunnel_Movement_15CAC0
	waitmovement 0
	msgbox RusturfTunnel_Text_19432A, 4
	applymovement 5, RusturfTunnel_Movement_1A0839
	waitmovement 0
	message RusturfTunnel_Text_19434F
	waitmessage
	waitse
	playpokecry SPECIES_WINGULL, 0
	waitbutton
	waitpokecry
	closemessage
	applymovement 5, RusturfTunnel_Movement_15CAB4
	applymovement 7, RusturfTunnel_Movement_15CAC3
	waitmovement 0
	removeobject 5
	removeobject 7
	clearflag 142
	setflag 143
	setvar 0x405a, 4
	setvar 0x4090, 1
	setflag 891
	release
	end

RusturfTunnel_Movement_15CA99:: @ 815CA99
	step_00
	step_40
	step_up
	step_41
	step_27
	step_end

RusturfTunnel_Movement_15CA9F:: @ 815CA9F
	step_down
	step_26
	step_end

RusturfTunnel_Movement_15CAA2:: @ 815CAA2
	step_17
	step_17
	step_17
	step_17
	step_17
	step_17
	step_17
	step_17
	step_17
	step_end

RusturfTunnel_Movement_15CAAC:: @ 815CAAC
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

RusturfTunnel_Movement_15CAB4:: @ 815CAB4
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RusturfTunnel_Movement_15CAC0:: @ 815CAC0
	step_14
	step_right
	step_end

RusturfTunnel_Movement_15CAC3:: @ 815CAC3
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RusturfTunnel_EventScript_15CACD:: @ 815CACD
	trainerbattle 0, OPPONENT_MIKE_2, 0, RusturfTunnel_Text_194814, RusturfTunnel_Text_1948A2
	msgbox RusturfTunnel_Text_1948C4, 6
	end
