MtPyre_Exterior_MapScripts:: @ 815D486
	map_script 3, MtPyre_Exterior_MapScript1_15D48C
	.byte 0

MtPyre_Exterior_MapScript1_15D48C:: @ 815D48C
	call MtPyre_Exterior_EventScript_15D492
	end

MtPyre_Exterior_EventScript_15D492:: @ 815D492
	getplayerxy 0x4000, 0x4001
	compare 0x4001, 12
	jumpif 0, MtPyre_Exterior_EventScript_15D4A3
	return

MtPyre_Exterior_EventScript_15D4A3:: @ 815D4A3
	setweather 6
	return

MtPyre_Exterior_EventScript_15D4A7:: @ 815D4A7
	setweather 6
	doweather
	end

MtPyre_Exterior_EventScript_15D4AC:: @ 815D4AC
	setweather 2
	doweather
	end
