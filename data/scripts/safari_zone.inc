gUnknown_081C340A:: @ 81C340A
	setvar VAR_SAFARI_ZONE_STATE, 1
	special ExitSafariMode
	setwarp MAP_ROUTE121_SAFARI_ZONE_ENTRANCE, 255, 2, 5
	end

EventScript_1C341B: @ 81C341B
	setvar VAR_SAFARI_ZONE_STATE, 1
	special ExitSafariMode
	warp MAP_ROUTE121_SAFARI_ZONE_ENTRANCE, 255, 2, 5
	waitstate
	end

gUnknown_081C342D:: @ 81C342D
	lockall
	msgbox UnknownString_81C34B2, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq EventScript_1C3443
	releaseall
	end

EventScript_1C3443:
	goto EventScript_1C341B

gUnknown_081C3448:: @ 81C3448
	lockall
	playse SE_PINPON
	message UnknownString_81C34E4
	waitmessage
	waitbuttonpress
	releaseall
	goto EventScript_1C341B

gUnknown_081C3459:: @ 81C3459
	lockall
	playse SE_PINPON
	message UnknownString_81C3514
	waitmessage
	waitbuttonpress
	releaseall
	goto EventScript_1C341B

gUnknown_081C346A:: @ 81C346A
	lockall
	special SafariZoneGetPokeblockNameInFeeder
	compare RESULT, 0xFFFF
	goto_if_ne EventScript_1C34A9
	msgbox UnknownString_81C354E, MSGBOX_YESNO
	compare RESULT, YES
	goto_if_eq EventScript_1C348E
	releaseall
	end

EventScript_1C348E:
	fadescreen 1
	special OpenPokeblockCaseOnFeeder
	waitstate
	compare RESULT, 0xFFFF
	goto_if_ne EventScript_1C34A0
	end

EventScript_1C34A0:
	message UnknownString_81C35A9
	waitmessage
	waitbuttonpress
	releaseall
	end

EventScript_1C34A9:
	message UnknownString_81C3583
	waitmessage
	waitbuttonpress
	releaseall
	end
