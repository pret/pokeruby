Route116_TunnelersRestHouse_MapScripts:: @ 815C2DE
	map_script 3, Route116_TunnelersRestHouse_MapScript1_15C2E4
	.byte 0

Route116_TunnelersRestHouse_MapScript1_15C2E4:: @ 815C2E4
	setflag 2138
	end

Route116_TunnelersRestHouse_EventScript_15C2E8:: @ 815C2E8
	loadptr 0, Route116_TunnelersRestHouse_Text_192F33
	callstd 2
	end

Route116_TunnelersRestHouse_EventScript_15C2F1:: @ 815C2F1
	loadptr 0, Route116_TunnelersRestHouse_Text_193049
	callstd 2
	end

Route116_TunnelersRestHouse_EventScript_15C2FA:: @ 815C2FA
	lock
	faceplayer
	checkflag 199
	jumpeq Route116_TunnelersRestHouse_EventScript_15C30F
	loadptr 0, Route116_TunnelersRestHouse_Text_193135
	callstd 4
	release
	end

Route116_TunnelersRestHouse_EventScript_15C30F:: @ 815C30F
	loadptr 0, Route116_TunnelersRestHouse_Text_1931C1
	callstd 4
	release
	end

