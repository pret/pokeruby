Std_MsgboxNPC:
	lock
	faceplayer
	message 0x0
	waitmessage
	waitbuttonpress
	release
	return

Std_MsgboxSign:
	lockall
	message 0x0
	waitmessage
	waitbuttonpress
	releaseall
	return

Std_MsgboxDefault:
	message 0x0
	waitmessage
	waitbuttonpress
	return

Std_MsgboxYesNo:
	message 0x0
	waitmessage
	yesnobox 20, 8
	return

EventScript_UnusedReturn: @ 819F805
	return

Common_EventScript_SaveGame:: @ 819F806
	special SaveGame
	waitstate
	return
