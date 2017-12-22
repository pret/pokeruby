RustboroCity_DevonCorp_1F_MapScripts:: @ 8157406
	map_script 3, RustboroCity_DevonCorp_1F_MapScript1_15740C
	.byte 0

RustboroCity_DevonCorp_1F_MapScript1_15740C:: @ 815740C
	checkflag FLAG_RETURNED_DEVON_GOODS
	call_if 0, RustboroCity_DevonCorp_1F_EventScript_157416
	end

RustboroCity_DevonCorp_1F_EventScript_157416:: @ 8157416
	setobjectxyperm 2, 14, 2
	setobjectmovementtype 2, 8
	return

RustboroCity_DevonCorp_1F_EventScript_157422:: @ 8157422
	lock
	faceplayer
	checkflag FLAG_RETURNED_DEVON_GOODS
	goto_if_eq RustboroCity_DevonCorp_1F_EventScript_15744A
	checkflag FLAG_DEVON_GOODS_STOLEN
	goto_if_eq RustboroCity_DevonCorp_1F_EventScript_157440
	msgbox RustboroCity_DevonCorp_1F_Text_1829A4, 4
	release
	end

RustboroCity_DevonCorp_1F_EventScript_157440:: @ 8157440
	msgbox RustboroCity_DevonCorp_1F_Text_182A19, 4
	release
	end

RustboroCity_DevonCorp_1F_EventScript_15744A:: @ 815744A
	msgbox RustboroCity_DevonCorp_1F_Text_182AB3, 4
	release
	end

RustboroCity_DevonCorp_1F_EventScript_157454:: @ 8157454
	lock
	faceplayer
	checkflag FLAG_RETURNED_DEVON_GOODS
	goto_if_eq RustboroCity_DevonCorp_1F_EventScript_15747B
	checkflag FLAG_RECOVERED_DEVON_GOODS
	goto_if_eq RustboroCity_DevonCorp_1F_EventScript_157485
	checkflag FLAG_DEVON_GOODS_STOLEN
	goto_if_eq RustboroCity_DevonCorp_1F_EventScript_157485
	msgbox RustboroCity_DevonCorp_1F_Text_182AF0, 4
	release
	end

RustboroCity_DevonCorp_1F_EventScript_15747B:: @ 815747B
	msgbox RustboroCity_DevonCorp_1F_Text_182B5A, 4
	release
	end

RustboroCity_DevonCorp_1F_EventScript_157485:: @ 8157485
	msgbox RustboroCity_DevonCorp_1F_Text_182B2D, 4
	release
	end

RustboroCity_DevonCorp_1F_EventScript_15748F:: @ 815748F
	lock
	faceplayer
	checkflag FLAG_RETURNED_DEVON_GOODS
	goto_if_eq RustboroCity_DevonCorp_1F_EventScript_1574B6
	checkflag FLAG_RECOVERED_DEVON_GOODS
	goto_if_eq RustboroCity_DevonCorp_1F_EventScript_1574C0
	checkflag FLAG_DEVON_GOODS_STOLEN
	goto_if_eq RustboroCity_DevonCorp_1F_EventScript_1574C0
	msgbox RustboroCity_DevonCorp_1F_Text_1828EE, 4
	release
	end

RustboroCity_DevonCorp_1F_EventScript_1574B6:: @ 81574B6
	msgbox RustboroCity_DevonCorp_1F_Text_1828EE, 4
	release
	end

RustboroCity_DevonCorp_1F_EventScript_1574C0:: @ 81574C0
	msgbox RustboroCity_DevonCorp_1F_Text_18295E, 4
	release
	end
