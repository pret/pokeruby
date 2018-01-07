ShoalCave_LowTideLowerRoom_MapScripts:: @ 815E3F3
	map_script 1, ShoalCave_LowTideLowerRoom_MapScript1_15E3F9
	.byte 0

ShoalCave_LowTideLowerRoom_MapScript1_15E3F9:: @ 815E3F9
	call ShoalCave_LowTideLowerRoom_EventScript_15E3FF
	end

ShoalCave_LowTideLowerRoom_EventScript_15E3FF:: @ 815E3FF
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_4, ShoalCave_LowTideLowerRoom_EventScript_15E412
	setmetatile 18, 2, 856, 1
	return

ShoalCave_LowTideLowerRoom_EventScript_15E412:: @ 815E412
	return

ShoalCave_LowTideLowerRoom_EventScript_15E413:: @ 815E413
	lockall
	goto_if_set FLAG_HIDE_TOOK_SHOAL_SALT_4, ShoalCave_LowTideLowerRoom_EventScript_15E445
	giveitem_std ITEM_SHOAL_SALT
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideLowerRoom_EventScript_1A029B
	setmetatile 18, 2, 858, 0
	special DrawWholeMapView
	setflag FLAG_HIDE_TOOK_SHOAL_SALT_4
	releaseall
	end

ShoalCave_LowTideLowerRoom_EventScript_15E445:: @ 815E445
	msgbox ShoalCave_LowTideLowerRoom_Text_1C6979, 4
	releaseall
	end

ShoalCave_LowTideLowerRoom_EventScript_15E44F:: @ 815E44F
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_FOCUS_BAND, ShoalCave_LowTideLowerRoom_EventScript_15E47E
	msgbox ShoalCave_LowTideLowerRoom_Text_198200, 4
	giveitem_std ITEM_FOCUS_BAND
	compare RESULT, 0
	goto_if_eq ShoalCave_LowTideLowerRoom_EventScript_1A029B
	setflag FLAG_RECEIVED_FOCUS_BAND
	release
	end

ShoalCave_LowTideLowerRoom_EventScript_15E47E:: @ 815E47E
	msgbox ShoalCave_LowTideLowerRoom_Text_1982A2, 4
	release
	end
