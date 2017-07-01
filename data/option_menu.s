	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_0839F5FC:: @ 839F5FC
	.incbin "graphics/misc/option_menu_text.gbapal"

@ note: this is only used in the Japanese release
	.align 2
gUnknown_0839F63C:: @ 839F63C
	.incbin "graphics/misc/option_menu_equals_sign.4bpp"
