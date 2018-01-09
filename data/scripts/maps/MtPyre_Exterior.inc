MtPyre_Exterior_MapScripts:: @ 815D486
	map_script 3, MtPyre_Exterior_MapScript1_15D48C
	.byte 0

MtPyre_Exterior_MapScript1_15D48C:: @ 815D48C
	call MtPyre_Exterior_EventScript_15D492
	end

MtPyre_Exterior_EventScript_15D492:: @ 815D492
	getplayerxy VAR_TEMP_0, VAR_TEMP_1
	compare VAR_TEMP_1, 12
	goto_if_lt MtPyre_Exterior_EventScript_15D4A3
	return

MtPyre_Exterior_EventScript_15D4A3:: @ 815D4A3
	setweather WEATHER_FOG_1
	return

MtPyre_Exterior_EventScript_15D4A7:: @ 815D4A7
	setweather WEATHER_FOG_1
	doweather
	end

MtPyre_Exterior_EventScript_15D4AC:: @ 815D4AC
	setweather WEATHER_SUNNY
	doweather
	end
