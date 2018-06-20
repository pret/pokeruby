RustboroCity_Flat2_2F_MapScripts:: @ 8157D96
	.byte 0

RustboroCity_Flat2_2F_EventScript_157D97:: @ 8157D97
	msgbox RustboroCity_Flat2_2F_Text_185421, 2
	end

RustboroCity_Flat2_2F_EventScript_157DA0:: @ 8157DA0
	lock
	faceplayer
	goto_if_set FLAG_RECEIVED_PREMIER_BALL_RUSTBORO, RustboroCity_Flat2_2F_EventScript_157DCF
	msgbox RustboroCity_Flat2_2F_Text_185461, 4
	giveitem_std ITEM_PREMIER_BALL
	compare RESULT, 0
	goto_if_eq RustboroCity_Flat2_2F_EventScript_1A029B
	setflag FLAG_RECEIVED_PREMIER_BALL_RUSTBORO
	release
	end

RustboroCity_Flat2_2F_EventScript_157DCF:: @ 8157DCF
	msgbox RustboroCity_Flat2_2F_Text_1854C4, 4
	release
	end
