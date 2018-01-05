#include "constants/easy_chat.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

#define EC_DUPLICATES(count) (0xFF00 + (count))

	.section .rodata

.ifdef GERMAN
unk_83E7EB0:
	.string "{UNKNOWN_14 8} A B C  D E F  {UNKNOWN_14 0}"
unk_83E7EC5:
	.string "mehr$"
unk_83E7ECA::
	.string "{UNKNOWN_14 8} G H I  J K L      $"
unk_83E7EE1:
	.string "{UNKNOWN_14 8} M N O  P Q R S    $"
unk_83E7EF8:
	.string "{UNKNOWN_14 8} T U V  W X Y Z    $"
.endif

	.align 2
gUnknown_083DBEAC:: @ 83DBEAC
.ifdef ENGLISH
	.string "{UNKNOWN_14 8} A B C  D E F  {UNKNOWN_14 0}others$", 0x20
	.string "{UNKNOWN_14 8} G H I  J K L      $", 0x20
	.string "{UNKNOWN_14 8} M N O  P Q R S    $", 0x20
	.string "{UNKNOWN_14 8} T U V  W X Y Z    $", 0x20
.else
	.4byte unk_83E7EB0
	.4byte unk_83E7ECA
	.4byte unk_83E7EE1
	.4byte unk_83E7EF8
	.4byte unk_83E7EC5
.endif

@ 83DBF2C
	.include "data/text/easy_chat/group_words.inc"

@ 83DE138
	.include "data/text/easy_chat/words_by_letter.inc"

@ 83DEFFA
	.include "data/text/easy_chat/group_sizes.inc"

@ 83DF010
	.include "data/text/easy_chat/group_orders.inc"

@ 83DFE6C
	.include "data/text/easy_chat/group_name_table.inc"
