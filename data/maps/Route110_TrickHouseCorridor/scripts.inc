Route110_TrickHouseCorridor_MapScripts:: @ 8161CEC
	map_script MAP_SCRIPT_ON_TRANSITION, Route110_TrickHouseCorridor_OnTransition
	.byte 0

Route110_TrickHouseCorridor_OnTransition:: @ 8161CF2
	setvar VAR_TRICK_HOUSE_STATE, 1
	end
