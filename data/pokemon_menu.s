	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gPokemonMenuActions:: @ 839F494
	.4byte OtherText_Summary, PokemonMenu_Summary
	.4byte OtherText_Switch2, PokemonMenu_Switch
	.4byte OtherText_Item, PokemonMenu_Item
	.4byte gOtherText_CancelNoTerminator, PokemonMenu_Cancel
	.4byte OtherText_Give2, PokemonMenu_GiveItem
	.4byte OtherText_Take2, PokemonMenu_TakeItem
	.4byte OtherText_Take, PokemonMenu_TakeMail
	.4byte OtherText_Mail, PokemonMenu_Mail
	.4byte OtherText_Read2, PokemonMenu_ReadMail
	.4byte gOtherText_CancelNoTerminator, PokemonMenu_CancelSubmenu
	.4byte gMoveNames + 13 * MOVE_CUT, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_FLASH, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_ROCK_SMASH, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_STRENGTH, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_SURF, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_FLY, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_DIVE, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_WATERFALL, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_TELEPORT, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_DIG, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_SECRET_POWER, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_MILK_DRINK, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_SOFT_BOILED, PokemonMenu_FieldMove
	.4byte gMoveNames + 13 * MOVE_SWEET_SCENT, PokemonMenu_FieldMove

gUnknown_0839F554:: @ 839F554
	.incbin "baserom.gba", 0x39f554, 0x1e

Unknown_39F572: @ 839F572
	.byte 4, 5, 9, 0

	.align 2
gUnknown_0839F578:: @ 839F578
	.byte 3, 6, 0, 0
	.4byte Unknown_39F572

Unknown_39F580: @ 839F580
	.byte 8, 6, 9, 0

	.align 2
gUnknown_0839F584:: @ 839F584
	.byte 3, 9, 0, 0
	.4byte Unknown_39F580

	.align 2
gFieldMoveFuncs:: @ 839F58C
	.4byte SetUpFieldMove_Cut, 0x6
	.4byte SetUpFieldMove_Flash, 0x9
	.4byte SetUpFieldMove_RockSmash, 0x9
	.4byte SetUpFieldMove_Strength, 0x9
	.4byte SetUpFieldMove_Surf, 0x7
	.4byte SetUpFieldMove_Fly, 0x9
	.4byte SetUpFieldMove_Dive, 0x9
	.4byte SetUpFieldMove_Waterfall, 0x9
	.4byte SetUpFieldMove_Teleport, 0x9
	.4byte SetUpFieldMove_Dig, 0x9
	.4byte SetUpFieldMove_SecretPower, 0x9
	.4byte SetUpFieldMove_SoftBoiled, 0x10
	.4byte SetUpFieldMove_SoftBoiled, 0x10
	.4byte SetUpFieldMove_SweetScent, 0x9
