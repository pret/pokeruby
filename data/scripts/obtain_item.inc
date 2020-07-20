Std_ObtainItem: @ 819FDF7
	additem VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_ObtainItemMessage
	return

EventScript_ObtainItemMessage: @ 819FE07
	bufferitemname 1, VAR_0x8000
	checkitemtype VAR_0x8000
	call EventScript_BufferPocketNameAndTryFanfare
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_ObtainedItem
	compare VAR_0x8007, FALSE
	call_if_eq EventScript_NoRoomForItem
	return

EventScript_BufferPocketNameAndTryFanfare:
	switch VAR_RESULT
	case POCKET_ITEMS,	    EventScript_BufferItemsPocket
	case POCKET_KEY_ITEMS,  EventScript_BufferKeyItemsPocket
	case POCKET_POKE_BALLS, EventScript_BufferPokeballsPocket
	case POCKET_TM_HM,	    EventScript_BufferTMHMsPocket
	case POCKET_BERRIES,	EventScript_BufferBerriesPocket
	end

EventScript_BufferItemsPocket:
	bufferstdstring 2, STDSTRING_ITEMS
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferKeyItemsPocket:
	bufferstdstring 2, STDSTRING_KEYITEMS
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferPokeballsPocket:
	bufferstdstring 2, STDSTRING_POKEBALLS
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_BufferTMHMsPocket:
	bufferstdstring 2, STDSTRING_TMHMS
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedTMHM
	return

EventScript_BufferBerriesPocket:
	bufferstdstring 2, STDSTRING_BERRIES
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PlayFanfareObtainedItem
	return

EventScript_ObtainedItem: @ 819FEB7
	message Text_ObtainedTheItem
	waitfanfare
	waitmessage
	msgbox Text_PutItemInPocket
	setvar VAR_RESULT, TRUE
	return

EventScript_NoRoomForItem: @ 819FECC
	setvar VAR_RESULT, FALSE
	return

EventScript_PlayFanfareObtainedItem:
	playfanfare MUS_FANFA4
	return

EventScript_PlayFanfareObtainedTMHM:
	playfanfare MUS_ME_WAZA
	return

Std_ObtainDecoration: @ 819FEDA
	adddecoration VAR_0x8000
	copyvar VAR_0x8007, VAR_RESULT
	call EventScript_ObtainDecorationMessage
	return

EventScript_ObtainDecorationMessage: @ 819FEE8
	bufferdecorationname 1, VAR_0x8000
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_ObtainedDecor
	compare VAR_0x8007, FALSE
	call_if_eq EventScript_NoRoomForDecor
	return

EventScript_ObtainedDecor: @ 819FF03
	playfanfare MUS_FANFA4
	message Text_ObtainedTheDecor
	waitfanfare
	waitmessage
	msgbox Text_TheDecorWasTransferredToThePC
	setvar VAR_RESULT, TRUE
	return

EventScript_NoRoomForDecor: @ 819FF1B
	setvar VAR_RESULT, FALSE
	return

Std_FindItem: @ 819FF21
	lock
	faceplayer
	waitse
	additem VAR_0x8000, VAR_0x8001
	copyvar VAR_0x8007, VAR_RESULT
	bufferitemname 1, VAR_0x8000
	checkitemtype VAR_0x8000
	call EventScript_BufferPocketNameAndTryFanfare
	compare VAR_0x8007, TRUE
	call_if_eq EventScript_PickUpItem
	compare VAR_0x8007, FALSE
	call_if_eq EventScript_NoRoomToPickUpItem
	release
	return

EventScript_PickUpItem: @ 819FF52
	removeobject VAR_LAST_TALKED
	message Text_FoundOneItem
	waitfanfare
	waitmessage
	msgbox Text_PutItemInPocket
	return

EventScript_NoRoomToPickUpItem: @ 819FF65
	msgbox Text_ObtainedTheItem
	msgbox Text_TooBadBagIsFull
	setvar VAR_RESULT, FALSE
	return

EventScript_HiddenItem:: @ 819FF7B
	lockall
	waitse
	additem VAR_0x8005
	copyvar VAR_0x8007, VAR_RESULT
	bufferitemname 1, VAR_0x8005
	checkitemtype VAR_0x8005
	call EventScript_BufferPocketNameAndTryFanfare
	compare VAR_0x8007, TRUE
	goto_if_eq EventScript_PickUpHiddenItem
	compare VAR_0x8007, FALSE
	goto_if_eq EventScript_NoRoomToPickUpHiddenItem
	end

EventScript_PickUpHiddenItem:
	message Text_FoundOneItem
	waitfanfare
	waitmessage
	msgbox Text_PutItemInPocket
	special SetHiddenItemFlag
	releaseall
	end

EventScript_NoRoomToPickUpHiddenItem:
	msgbox Text_FoundOneItem
	msgbox Text_TooBadBagIsFull
	setvar VAR_RESULT, FALSE
	releaseall
	end
