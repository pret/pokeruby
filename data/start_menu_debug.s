	.if DEBUG

#include "constants/moves.h"
	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2

gUnknown_Debug_839C5F4::
	.byte 0x00, 0x00, 0xe7, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x3b, 0x00, 0x06, 0x02, 0x00, 0x00, 0x00, 0x00, 0x3b, 0x00, 0x09, 0x03, 0x00, 0x00

Str_839C60C:: @ 0x839C60C
gDebug0x839C60C::
	.string "Set FLASH ERR$"

Str_839C61A:: @ 0x839C61A
	.string "abcde;　abcde:　ABCDE;　ABCDE:\p"
	.string "Tableaux　des　verbes　du　2{SUPER_E}　groupe.\p"
	.string "La1{SUPER_RE}　chose　à apprendre　c’est　de　lire.\p"
	.string "Tableaux　des　verbes　du　1{SUPER_ER}　groupe.\p"
	.string "“あいうえおかきくけコさしすせそたちつてとな”\n"
	.string "<にぬネのはひふへほマみむめもやゆよらりるれろわャッ>\p"
	.string "をんゃゅょアイウエオカキクケサシスルレロワ,$"

	.endif
