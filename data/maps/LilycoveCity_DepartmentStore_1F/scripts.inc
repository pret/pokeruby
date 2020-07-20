LilycoveCity_DepartmentStore_1F_MapScripts:: @ 8159D54
	.byte 0

LilycoveCity_DepartmentStore_1F_EventScript_159D55:: @ 8159D55
	msgbox LilycoveCity_DepartmentStore_1F_Text_18BFB5, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_1F_EventScript_159D5E:: @ 8159D5E
	lock
	faceplayer
	dotimebasedevents
	compare VAR_LOTTERY_PRIZE, 0
	goto_if_ne LilycoveCity_DepartmentStore_1F_EventScript_159EB1
	goto_if_set FLAG_DAILY_PICKED_LOTTO_TICKET, LilycoveCity_DepartmentStore_1F_EventScript_159E4C
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4B5E, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E56
	setflag FLAG_DAILY_PICKED_LOTTO_TICKET
	message LilycoveCity_DepartmentStore_1F_Text_1C4CC6
	waitmessage
	special RetrieveLotteryNumber
	copyvar VAR_0x8008, VAR_RESULT
	special BufferLottoTicketNumber
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4CF6, MSGBOX_DEFAULT
	applymovement 2, Common_Movement_WalkInPlaceFastestRight
	waitmovement 0
	playse SE_PC_ON
	special DoLotteryCornerComputerEffect
	special PickLotteryCornerTicket
	delay 220
	special EndLotteryCornerComputerEffect
	delay 10
	applymovement 2, Common_Movement_FacePlayer
	waitmovement 0
	compare VAR_0x8004, 0
	goto_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E60
	incrementgamestat GAME_STAT_WON_POKEMON_LOTTERY
	compare VAR_0x8006, 0
	call_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E3A
	compare VAR_0x8006, 1
	call_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E43
	bufferitemname 0, VAR_0x8005
	compare VAR_0x8004, 1
	call_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E78
	compare VAR_0x8004, 2
	call_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E81
	compare VAR_0x8004, 3
	call_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E8A
	compare VAR_0x8004, 4
	call_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E93
	giveitem VAR_0x8005
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159E9C
	goto LilycoveCity_DepartmentStore_1F_EventScript_159E6E
	end

LilycoveCity_DepartmentStore_1F_EventScript_159E3A:: @ 8159E3A
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4D7D, MSGBOX_DEFAULT
	return

LilycoveCity_DepartmentStore_1F_EventScript_159E43:: @ 8159E43
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4DD1, MSGBOX_DEFAULT
	return

LilycoveCity_DepartmentStore_1F_EventScript_159E4C:: @ 8159E4C
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4C6A, MSGBOX_DEFAULT
	release
	end

LilycoveCity_DepartmentStore_1F_EventScript_159E56:: @ 8159E56
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4C85, MSGBOX_DEFAULT
	release
	end

LilycoveCity_DepartmentStore_1F_EventScript_159E60:: @ 8159E60
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4E27, MSGBOX_DEFAULT
	goto LilycoveCity_DepartmentStore_1F_EventScript_159E6E
	end

LilycoveCity_DepartmentStore_1F_EventScript_159E6E:: @ 8159E6E
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C501C, MSGBOX_DEFAULT
	release
	end

LilycoveCity_DepartmentStore_1F_EventScript_159E78:: @ 8159E78
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4E4F, MSGBOX_DEFAULT
	return

LilycoveCity_DepartmentStore_1F_EventScript_159E81:: @ 8159E81
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4E92, MSGBOX_DEFAULT
	return

LilycoveCity_DepartmentStore_1F_EventScript_159E8A:: @ 8159E8A
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4ED8, MSGBOX_DEFAULT
	return

LilycoveCity_DepartmentStore_1F_EventScript_159E93:: @ 8159E93
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4F1C, MSGBOX_DEFAULT
	return

LilycoveCity_DepartmentStore_1F_EventScript_159E9C:: @ 8159E9C
	copyvar VAR_LOTTERY_PRIZE, VAR_0x8005
	goto LilycoveCity_DepartmentStore_1F_EventScript_159EA7
	end

LilycoveCity_DepartmentStore_1F_EventScript_159EA7:: @ 8159EA7
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4F77, MSGBOX_DEFAULT
	release
	end

LilycoveCity_DepartmentStore_1F_EventScript_159EB1:: @ 8159EB1
	msgbox LilycoveCity_DepartmentStore_1F_Text_1C4FCC, MSGBOX_DEFAULT
	giveitem VAR_LOTTERY_PRIZE
	compare VAR_RESULT, 0
	goto_if_eq LilycoveCity_DepartmentStore_1F_EventScript_159EA7
	setvar VAR_LOTTERY_PRIZE, 0
	release
	end

LilycoveCity_DepartmentStore_1F_EventScript_159ED7:: @ 8159ED7
	msgbox LilycoveCity_DepartmentStore_1F_Text_18BFDB, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_1F_EventScript_159EE0:: @ 8159EE0
	msgbox LilycoveCity_DepartmentStore_1F_Text_18C044, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_1F_EventScript_159EE9:: @ 8159EE9
	msgbox LilycoveCity_DepartmentStore_1F_Text_18C07A, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_1F_EventScript_159EF2:: @ 8159EF2
	lock
	faceplayer
	waitse
	playmoncry SPECIES_AZUMARILL, 0
	msgbox LilycoveCity_DepartmentStore_1F_Text_18C0C3, MSGBOX_DEFAULT
	waitmoncry
	release
	end

LilycoveCity_DepartmentStore_1F_EventScript_159F05:: @ 8159F05
	msgbox LilycoveCity_DepartmentStore_1F_Text_18C0D9, MSGBOX_SIGN
	end
