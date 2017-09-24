gUnknown_081C340A:: @ 81C340A
	setvar 0x40a4, 1
	special ExitSafariMode
	warp3 Route121_SafariZoneEntrance, 255, 2, 5
	end

EventScript_1C341B: @ 81C341B
	setvar 0x40a4, 1
	special ExitSafariMode
	warp Route121_SafariZoneEntrance, 255, 2, 5
	waitstate
	end

gUnknown_081C342D:: @ 81C342D
	lockall
	msgbox UnknownString_81C34B2, 5
	compare RESULT, 1
	jumpeq EventScript_1C3443
	releaseall
	end

EventScript_1C3443:
	goto EventScript_1C341B

gUnknown_081C3448:: @ 81C3448
	lockall
	playsfx 73
	message UnknownString_81C34E4
	waittext
	waitbutton
	releaseall
	goto EventScript_1C341B

gUnknown_081C3459:: @ 81C3459
	lockall
	playsfx 73
	message UnknownString_81C3514
	waittext
	waitbutton
	releaseall
	goto EventScript_1C341B

gUnknown_081C346A:: @ 81C346A
	lockall
	special SafariZoneGetPokeblockNameInFeeder
	compare RESULT, -1
	jumpif 5, EventScript_1C34A9
	msgbox UnknownString_81C354E, 5
	compare RESULT, 1
	jumpeq EventScript_1C348E
	releaseall
	end

EventScript_1C348E:
	fadescreen 1
	special sub_810BAF4
	waitstate
	compare RESULT, -1
	jumpif 5, EventScript_1C34A0
	end

EventScript_1C34A0:
	message UnknownString_81C35A9
	waittext
	waitbutton
	releaseall
	end

EventScript_1C34A9:
	message UnknownString_81C3583
	waittext
	waitbutton
	releaseall
	end
