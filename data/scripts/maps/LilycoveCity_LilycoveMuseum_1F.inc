LilycoveCity_LilycoveMuseum_1F_MapScripts:: @ 815841B
	.byte 0

LilycoveCity_LilycoveMuseum_1F_EventScript_15841C:: @ 815841C
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187348, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158425:: @ 8158425
	lockall
	applymovement 2, LilycoveCity_LilycoveMuseum_1F_Movement_1A0839
	message LilycoveCity_LilycoveMuseum_1F_Text_1873B9
	waitmessage
	multichoice 20, 8, 16, 1
	compare RESULT, 0
	goto_if_eq LilycoveCity_LilycoveMuseum_1F_EventScript_158458
	compare RESULT, 1
	goto_if_eq LilycoveCity_LilycoveMuseum_1F_EventScript_15844F
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15844F:: @ 815844F
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187459, 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158458:: @ 8158458
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187495, MSGBOX_YESNO
	compare RESULT, NO
	goto_if_eq LilycoveCity_LilycoveMuseum_1F_EventScript_158477
	compare RESULT, YES
	goto_if_eq LilycoveCity_LilycoveMuseum_1F_EventScript_158481
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158477:: @ 8158477
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_1874F5, 3
	releaseall
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158481:: @ 8158481
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187534, 3
	applymovement 2, LilycoveCity_LilycoveMuseum_1F_Movement_1584FC
	waitmovement 0
	removeobject 2
	switch FACING
	case 2, LilycoveCity_LilycoveMuseum_1F_EventScript_1584BD
	case 3, LilycoveCity_LilycoveMuseum_1F_EventScript_1584D2
	case 4, LilycoveCity_LilycoveMuseum_1F_EventScript_1584E7
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_1584BD:: @ 81584BD
	lockall
	applymovement 255, LilycoveCity_LilycoveMuseum_1F_Movement_158504
	waitmovement 0
	warp MAP_LILYCOVE_CITY_LILYCOVE_MUSEUM_2F, 255, 11, 8
	waitstate
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_1584D2:: @ 81584D2
	lockall
	applymovement 255, LilycoveCity_LilycoveMuseum_1F_Movement_1584FE
	waitmovement 0
	warp MAP_LILYCOVE_CITY_LILYCOVE_MUSEUM_2F, 255, 11, 8
	waitstate
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_1584E7:: @ 81584E7
	lockall
	applymovement 255, LilycoveCity_LilycoveMuseum_1F_Movement_158501
	waitmovement 0
	warp MAP_LILYCOVE_CITY_LILYCOVE_MUSEUM_2F, 255, 11, 8
	waitstate
	end

LilycoveCity_LilycoveMuseum_1F_Movement_1584FC:: @ 81584FC
	walk_up
	end_movement

LilycoveCity_LilycoveMuseum_1F_Movement_1584FE:: @ 81584FE
	walk_left
	walk_up
	end_movement

LilycoveCity_LilycoveMuseum_1F_Movement_158501:: @ 8158501
	walk_right
	walk_up
	end_movement

LilycoveCity_LilycoveMuseum_1F_Movement_158504:: @ 8158504
	walk_up
	walk_up
	end_movement

LilycoveCity_LilycoveMuseum_1F_EventScript_158507:: @ 8158507
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_18757F, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158510:: @ 8158510
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_1875BE, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158519:: @ 8158519
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_1875F8, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158522:: @ 8158522
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187641, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15852B:: @ 815852B
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_1876A1, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158534:: @ 8158534
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_18770C, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15853D:: @ 815853D
LilycoveCity_LilycoveMuseum_2F_EventScript_15853D:: @ 815853D
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_18775F, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158546:: @ 8158546
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_1877A9, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15854F:: @ 815854F
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187810, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158558:: @ 8158558
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_1878B7, 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158561:: @ 8158561
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_18791D, 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15856A:: @ 815856A
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_1879BF, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158573:: @ 8158573
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_1879E6, 3
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15857C:: @ 815857C
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187A1A, 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_158585:: @ 8158585
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187AA0, 2
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_15858E:: @ 815858E
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187B04, 2
	lockall
	applymovement 8, LilycoveCity_LilycoveMuseum_1F_Movement_1A083D
	waitmovement 0
	releaseall
	end

LilycoveCity_LilycoveMuseum_1F_EventScript_1585A3:: @ 81585A3
	msgbox LilycoveCity_LilycoveMuseum_1F_Text_187B7F, 2
	end
