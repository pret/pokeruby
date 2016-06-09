LilycoveCity_LilycoveMuseum_1F_MapScripts:: @ 815841B
	.byte 0

LilycoveCity_LilycoveMuseum_1F_EventScript_15841C:: @ 815841C
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187348
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158425:: @ 8158425
	lockall
	move 2, LilycoveCity_LilycoveMuseum_1F_Movement_1A0839
	message LilycoveCity_LilycoveMuseum_1F_Text_1873B9
	waittext
	multichoice 20, 8, 16, 1
	compare RESULT, 0
	jumpeq LilycoveCity_LilycoveMuseum_1F_EventScript_158458
	compare RESULT, 1
	jumpeq LilycoveCity_LilycoveMuseum_1F_EventScript_15844F
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15844F:: @ 815844F
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187459
	callstd 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158458:: @ 8158458
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187495
	callstd 5
	compare RESULT, 0
	jumpeq LilycoveCity_LilycoveMuseum_1F_EventScript_158477
	compare RESULT, 1
	jumpeq LilycoveCity_LilycoveMuseum_1F_EventScript_158481
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158477:: @ 8158477
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_1874F5
	callstd 3
	releaseall
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158481:: @ 8158481
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187534
	callstd 3
	move 2, LilycoveCity_LilycoveMuseum_1F_Movement_1584FC
	waitmove 0
	disappear 2
	switch FACING
	case 2, LilycoveCity_LilycoveMuseum_1F_EventScript_1584BD
	case 3, LilycoveCity_LilycoveMuseum_1F_EventScript_1584D2
	case 4, LilycoveCity_LilycoveMuseum_1F_EventScript_1584E7
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_1584BD:: @ 81584BD
	lockall
	move 255, LilycoveCity_LilycoveMuseum_1F_Movement_158504
	waitmove 0
	warp LilycoveCity_LilycoveMuseum_2F, 255, 11, 8
	waitstate
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_1584D2:: @ 81584D2
	lockall
	move 255, LilycoveCity_LilycoveMuseum_1F_Movement_1584FE
	waitmove 0
	warp LilycoveCity_LilycoveMuseum_2F, 255, 11, 8
	waitstate
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_1584E7:: @ 81584E7
	lockall
	move 255, LilycoveCity_LilycoveMuseum_1F_Movement_158501
	waitmove 0
	warp LilycoveCity_LilycoveMuseum_2F, 255, 11, 8
	waitstate
	end

LilycoveCity_LilycoveMuseum_1F_Movement_1584FC:: @ 81584FC
	step_up
	step_end

LilycoveCity_LilycoveMuseum_1F_Movement_1584FE:: @ 81584FE
	step_left
	step_up
	step_end

LilycoveCity_LilycoveMuseum_1F_Movement_158501:: @ 8158501
	step_right
	step_up
	step_end

LilycoveCity_LilycoveMuseum_1F_Movement_158504:: @ 8158504
	step_up
	step_up
	step_end

LilycoveCity_LilycoveMuseum_1F_EventScript_158507:: @ 8158507
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_18757F
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158510:: @ 8158510
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_1875BE
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158519:: @ 8158519
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_1875F8
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158522:: @ 8158522
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187641
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15852B:: @ 815852B
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_1876A1
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158534:: @ 8158534
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_18770C
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15853D:: @ 815853D
LilycoveCity_LilycoveMuseum_2F_EventScript_15853D:: @ 815853D
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_18775F
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158546:: @ 8158546
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_1877A9
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15854F:: @ 815854F
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187810
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158558:: @ 8158558
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_1878B7
	callstd 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158561:: @ 8158561
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_18791D
	callstd 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15856A:: @ 815856A
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_1879BF
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158573:: @ 8158573
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_1879E6
	callstd 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15857C:: @ 815857C
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187A1A
	callstd 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158585:: @ 8158585
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187AA0
	callstd 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15858E:: @ 815858E
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187B04
	callstd 2
	lockall
	move 8, LilycoveCity_LilycoveMuseum_1F_Movement_1A083D
	waitmove 0
	releaseall
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_1585A3:: @ 81585A3
	loadptr 0, LilycoveCity_LilycoveMuseum_1F_Text_187B7F
	callstd 2
	end

