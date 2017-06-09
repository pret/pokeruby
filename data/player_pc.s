	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gPCText_OptionDescList:: @ 8406288
	.4byte PCText_TakeOutItems
	.4byte PCText_StoreItems
	.4byte PCText_ThrowAwayItems
	.4byte gMenuText_GoBackToPrev

	.align 2
gPCText_PlayerPCOptionsText:: @ 8406298
	.4byte SecretBaseText_ItemStorage, PlayerPC_ItemStorage
	.4byte gPCText_Mailbox, PlayerPC_Mailbox
	.4byte SecretBaseText_Decoration, PlayerPC_Decoration
	.4byte SecretBaseText_TurnOff, PlayerPC_TurnOff

gBedroomPC_OptionOrder:: @ 84062B8
	.byte 0, 1, 2, 3

gPlayerPC_OptionOrder:: @ 84062BC
	.byte 0, 1, 3

	.align 2
gPCText_ItemPCOptionsText:: @ 84062C0
	.4byte PCText_WithdrawItem, ItemStorage_Withdraw
	.4byte PCText_DepositItem, ItemStorage_Deposit
	.4byte PCText_TossItem, ItemStorage_Toss
	.4byte gUnknownText_Exit, ItemStorage_Exit

	.align 2
gUnknown_084062E0:: @ 84062E0
	.4byte sub_813A83C
	.4byte sub_813A878

	.align 2
gUnknown_084062E8:: @ 84062E8
	.4byte sub_813B578
	.4byte sub_813B610

	.align 2
gNewGamePCItems:: @ 84062F0
	.2byte ITEM_POTION, 1
	.2byte ITEM_NONE, 0

	.align 2
gUnknown_084062F8:: @ 84062F8
	.4byte OtherText_Read, Mailbox_Read
	.4byte gOtherText_MoveToBag, Mailbox_MoveToBag
	.4byte OtherText_Give, Mailbox_Give
	.4byte gOtherText_CancelNoTerminator, Mailbox_Cancel

gUnknown_08406318:: @ 8406318
	.string "{STR_VAR_1}{CLEAR_TO 80}$"

gUnknown_0840631E:: @ 840631E
	.string "{COLOR RED}{STR_VAR_1}{CLEAR_TO 80}$"

gUnknown_08406327:: @ 8406327
	.string "{STR_VAR_1}$"

gUnknown_0840632A:: @ 840632A
	.string "{COLOR RED}{STR_VAR_1}$"

gUnknown_08406330:: @ 8406330
	.string "{CLEAR_TO 32}$"

	.align 1
gUnknown_08406334:: @ 8406334
	.2byte 0x5294
	.2byte 0x6B5A
	.2byte 0x7FFF

gUnknown_0840633A:: @ 840633A
	.string "{COLOR RED}{STR_VAR_1}$"
