RustboroCity_MapScripts:: @ 814C372
	map_script 3, RustboroCity_MapScript1_14C378
	.byte 0

RustboroCity_MapScript1_14C378:: @ 814C378
	setflag 2073
	call RustboroCity_EventScript_1A0196
	call RustboroCity_EventScript_1A014E
	end

RustboroCity_EventScript_14C386:: @ 814C386
	lock
	faceplayer
	checkflag 142
	jumpeq RustboroCity_EventScript_14C39B
	msgbox RustboroCity_Text_16689D, 4
	release
	end

RustboroCity_EventScript_14C39B:: @ 814C39B
	msgbox RustboroCity_Text_16690C, 4
	release
	end

RustboroCity_EventScript_14C3A5:: @ 814C3A5
	lock
	faceplayer
	msgbox RustboroCity_Text_166A67, 4
	release
	end

RustboroCity_EventScript_14C3B1:: @ 814C3B1
	msgbox RustboroCity_Text_166AE0, 2
	end

RustboroCity_EventScript_14C3BA:: @ 814C3BA
	lock
	faceplayer
	checkflag 2055
	jumpeq RustboroCity_EventScript_14C3CF
	msgbox RustboroCity_Text_16696D, 4
	release
	end

RustboroCity_EventScript_14C3CF:: @ 814C3CF
	msgbox RustboroCity_Text_1669FE, 4
	release
	end

RustboroCity_EventScript_14C3D9:: @ 814C3D9
	lock
	faceplayer
	checkflag 188
	jumpeq RustboroCity_EventScript_14C3EE
	msgbox RustboroCity_Text_166B86, 4
	release
	end

RustboroCity_EventScript_14C3EE:: @ 814C3EE
	msgbox RustboroCity_Text_166BEF, 4
	release
	end

RustboroCity_EventScript_14C3F8:: @ 814C3F8
	msgbox RustboroCity_Text_166C98, 2
	end

RustboroCity_EventScript_14C401:: @ 814C401
	msgbox RustboroCity_Text_166CFA, 3
	end

RustboroCity_EventScript_14C40A:: @ 814C40A
	msgbox RustboroCity_Text_167374, 3
	end

RustboroCity_EventScript_14C413:: @ 814C413
	msgbox RustboroCity_Text_1673FA, 3
	end

RustboroCity_EventScript_14C41C:: @ 814C41C
	msgbox RustboroCity_Text_167439, 3
	end

@ 814C425
	msgbox RustboroCity_Text_167485, 3
	end

RustboroCity_EventScript_14C42E:: @ 814C42E
	msgbox RustboroCity_Text_1674DD, 3
	end

RustboroCity_EventScript_14C437:: @ 814C437
	msgbox RustboroCity_Text_167525, 3
	end

RustboroCity_EventScript_14C440:: @ 814C440
	msgbox RustboroCity_Text_167568, 3
	end

RustboroCity_EventScript_14C449:: @ 814C449
	lock
	faceplayer
	msgbox RustboroCity_Text_166D59, 4
	move 7, RustboroCity_Movement_1A083D
	waitmove 0
	release
	end

RustboroCity_EventScript_14C45F:: @ 814C45F
	lock
	faceplayer
	msgbox RustboroCity_Text_166DB0, 4
	move 8, RustboroCity_Movement_1A083D
	waitmove 0
	release
	end

RustboroCity_EventScript_14C475:: @ 814C475
	lock
	faceplayer
	msgbox RustboroCity_Text_166DEE, 4
	release
	end

RustboroCity_EventScript_14C481:: @ 814C481
	lockall
	movespriteperm 9, 14, 21
	spritebehave 9, 10
	setvar 0x8004, 0
	jump RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C498:: @ 814C498
	lockall
	movespriteperm 9, 14, 21
	spritebehave 9, 10
	setvar 0x8004, 1
	jump RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C4AF:: @ 814C4AF
	lockall
	movespriteperm 9, 14, 21
	spritebehave 9, 10
	setvar 0x8004, 2
	jump RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C4C6:: @ 814C4C6
	lockall
	movespriteperm 9, 14, 21
	spritebehave 9, 10
	setvar 0x8004, 3
	jump RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C4DD:: @ 814C4DD
	lockall
	movespriteperm 9, 14, 21
	spritebehave 9, 10
	setvar 0x8004, 4
	jump RustboroCity_EventScript_14C4F4
	end

RustboroCity_EventScript_14C4F4:: @ 814C4F4
	msgbox RustboroCity_Text_166E65, 4
	closebutton
	reappear 10
	reappear 9
	move 10, RustboroCity_Movement_14C5C2
	waitmove 0
	disappear 10
	move 9, RustboroCity_Movement_14C5D3
	waitmove 0
	msgbox RustboroCity_Text_166E7E, 4
	closebutton
	move 9, RustboroCity_Movement_14C5DB
	waitmove 0
	disappear 9
	movespriteperm 9, 30, 10
	clearflag 732
	setflag 142
	setvar 0x405a, 2
	setvar 0x409a, 2
	setvar 0x406f, 1
	clearflag 891
	clearflag 880
	clearflag 878
	setflag 739
	setflag 881
	releaseall
	end

@ 814C55D
	msgbox RustboroCity_Text_166F6B, 4
	return

@ 814C566
	msgbox RustboroCity_Text_166FB4, 4
	return

@ 814C56F
	move 9, RustboroCity_Movement_14C5E3
	waitmove 0
	return

@ 814C57A
	move 9, RustboroCity_Movement_14C5E7
	waitmove 0
	return

@ 814C585
	move 9, RustboroCity_Movement_14C5EC
	waitmove 0
	return

@ 814C590
	move 9, RustboroCity_Movement_14C5F1
	waitmove 0
	return

@ 814C59B
	move 9, RustboroCity_Movement_14C5F7
	waitmove 0
	move 255, RustboroCity_Movement_1A0841
	waitmove 0
	return

@ 814C5B0
	step_30
	step_30
	step_18
	step_18
	step_18
	step_18
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_end

RustboroCity_Movement_14C5C2:: @ 814C5C2
	step_30
	step_30
	step_18
	step_18
	step_18
	step_18
	step_18
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_16
	step_end

RustboroCity_Movement_14C5D3:: @ 814C5D3
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_26
	step_end

RustboroCity_Movement_14C5DB:: @ 814C5DB
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

RustboroCity_Movement_14C5E3:: @ 814C5E3
	step_down
	step_right
	step_right
	step_end

RustboroCity_Movement_14C5E7:: @ 814C5E7
	step_down
	step_down
	step_right
	step_right
	step_end

RustboroCity_Movement_14C5EC:: @ 814C5EC
	step_down
	step_down
	step_right
	step_right
	step_end

RustboroCity_Movement_14C5F1:: @ 814C5F1
	step_down
	step_down
	step_down
	step_right
	step_right
	step_end

RustboroCity_Movement_14C5F7:: @ 814C5F7
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_25
	step_end

RustboroCity_EventScript_14C5FF:: @ 814C5FF
	lock
	faceplayer
	checkflag 143
	jumpeq RustboroCity_EventScript_14C614
	msgbox RustboroCity_Text_166F6B, 4
	release
	end

RustboroCity_EventScript_14C614:: @ 814C614
	checksound
	setvar 0x4001, 4
	jump RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C620:: @ 814C620
	lockall
	setvar 0x4001, 0
	jump RustboroCity_EventScript_14C650
	end

RustboroCity_EventScript_14C62C:: @ 814C62C
	lockall
	setvar 0x4001, 1
	jump RustboroCity_EventScript_14C650
	end

RustboroCity_EventScript_14C638:: @ 814C638
	lockall
	setvar 0x4001, 2
	jump RustboroCity_EventScript_14C650
	end

RustboroCity_EventScript_14C644:: @ 814C644
	lockall
	setvar 0x4001, 3
	jump RustboroCity_EventScript_14C650
	end

RustboroCity_EventScript_14C650:: @ 814C650
	compare 0x4001, 0
	callif 1, RustboroCity_EventScript_14C691
	compare 0x4001, 1
	callif 1, RustboroCity_EventScript_14C6BD
	compare 0x4001, 2
	callif 1, RustboroCity_EventScript_14C6E9
	compare 0x4001, 3
	callif 1, RustboroCity_EventScript_14C715
	setflag 159
	setvar 0x405a, 3
	moveoffscreen 9
	msgbox RustboroCity_Text_166EA5, 4
	releaseall
	end

RustboroCity_EventScript_14C691:: @ 814C691
	move 9, RustboroCity_Movement_1A0841
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	move 255, RustboroCity_Movement_1A0845
	waitmove 0
	return

RustboroCity_EventScript_14C6BD:: @ 814C6BD
	move 9, RustboroCity_Movement_1A083F
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	move 255, RustboroCity_Movement_1A0843
	waitmove 0
	return

RustboroCity_EventScript_14C6E9:: @ 814C6E9
	move 9, RustboroCity_Movement_1A0845
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	move 255, RustboroCity_Movement_1A0841
	waitmove 0
	return

RustboroCity_EventScript_14C715:: @ 814C715
	move 9, RustboroCity_Movement_1A0845
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	move 9, RustboroCity_Movement_14C74B
	waitmove 0
	move 255, RustboroCity_Movement_1A0841
	waitmove 0
	return

RustboroCity_Movement_14C74B:: @ 814C74B
	step_down
	step_end

RustboroCity_EventScript_14C74D:: @ 814C74D
	lockall
	setvar 0x4001, 0
	jump RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C759:: @ 814C759
	lockall
	setvar 0x4001, 1
	jump RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C765:: @ 814C765
	lockall
	setvar 0x4001, 2
	jump RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C771:: @ 814C771
	lockall
	setvar 0x4001, 3
	jump RustboroCity_EventScript_14C77D
	end

RustboroCity_EventScript_14C77D:: @ 814C77D
	compare 0x4001, 0
	callif 1, RustboroCity_EventScript_14C7FE
	compare 0x4001, 1
	callif 1, RustboroCity_EventScript_14C82A
	compare 0x4001, 2
	callif 1, RustboroCity_EventScript_14C856
	compare 0x4001, 3
	callif 1, RustboroCity_EventScript_14C882
	compare 0x4001, 4
	callif 1, RustboroCity_EventScript_14C8B8
	msgbox RustboroCity_Text_166FB4, 4
	giveitem ITEM_GREAT_BALL
	compare RESULT, 0
	callif 1, RustboroCity_EventScript_14C7F5
	msgbox RustboroCity_Text_16707F, 4
	closebutton
	setflag 144
	setflag 732
	setvar 0x405a, 5
	pause 30
	warp RustboroCity_DevonCorp_3F, 255, 2, 2
	waitstate
	releaseall
	end

RustboroCity_EventScript_14C7F5:: @ 814C7F5
	msgbox RustboroCity_Text_16704C, 4
	return

RustboroCity_EventScript_14C7FE:: @ 814C7FE
	move 9, RustboroCity_Movement_1A0841
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	move 255, RustboroCity_Movement_1A0845
	waitmove 0
	return

RustboroCity_EventScript_14C82A:: @ 814C82A
	move 9, RustboroCity_Movement_1A0843
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	move 255, RustboroCity_Movement_1A083F
	waitmove 0
	return

RustboroCity_EventScript_14C856:: @ 814C856
	move 9, RustboroCity_Movement_1A0845
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	move 255, RustboroCity_Movement_1A0841
	waitmove 0
	return

RustboroCity_EventScript_14C882:: @ 814C882
	move 9, RustboroCity_Movement_1A0845
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	move 9, RustboroCity_Movement_14C74B
	waitmove 0
	move 255, RustboroCity_Movement_1A0841
	waitmove 0
	return

RustboroCity_EventScript_14C8B8:: @ 814C8B8
	move 9, RustboroCity_Movement_1A083F
	waitmove 0
	playsfx 21
	move 9, RustboroCity_Movement_1A0833
	waitmove 0
	move 9, RustboroCity_Movement_1A0835
	waitmove 0
	return

RustboroCity_EventScript_14C8DA:: @ 814C8DA
	lock
	faceplayer
	checkflag 288
	jumpeq RustboroCity_EventScript_14C917
	checkgender
	compare RESULT, 0
	jumpeq RustboroCity_EventScript_14C8FD
	compare RESULT, 1
	jumpeq RustboroCity_EventScript_14C90A
	end

RustboroCity_EventScript_14C8FD:: @ 814C8FD
	setflag 288
	msgbox RustboroCity_Text_1670A7, 4
	release
	end

RustboroCity_EventScript_14C90A:: @ 814C90A
	setflag 288
	msgbox RustboroCity_Text_167213, 4
	release
	end

RustboroCity_EventScript_14C917:: @ 814C917
	checkgender
	compare RESULT, 0
	jumpeq RustboroCity_EventScript_14C92F
	compare RESULT, 1
	jumpeq RustboroCity_EventScript_14C939
	end

RustboroCity_EventScript_14C92F:: @ 814C92F
	msgbox RustboroCity_Text_16713C, 4
	release
	end

RustboroCity_EventScript_14C939:: @ 814C939
	msgbox RustboroCity_Text_1672B8, 4
	release
	end
