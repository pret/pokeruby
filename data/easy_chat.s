#include "constants/easy_chat.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

#define EC_DUPLICATES(count) (0xFF00 + (count))

	.section .rodata

gUnknown_083DBDFC:: @ 83DBDFC
	.incbin "graphics/unknown/unknown_3DBDFC.gbapal"

	.align 1
gUnknown_083DBE1C:: @ 83DBE1C
	.2byte  0x300, 0x300, 0x300, 0x300, 0x300, 0x300, 0x300, 0x300, 0x300
	.2byte  0x301, 0x301, 0x301, 0x301, 0x301, 0x300, 0x300, 0x300, 0x300

gUnknown_083DBE40:: @ 83DBE40
	.incbin "graphics/unknown/unknown_3DBE40.gbapal"

@ unused tilemap?
	.2byte  0x5036, 0x5037, 0x5038, 0x5039, 0x503A, 0x503B
	.2byte  0x5046, 0x5047, 0x5048, 0x5049, 0x504A, 0x504B
	.2byte  0x5056, 0x5057, 0x5058, 0x5059, 0x505A, 0x505B
	.2byte  0x5030, 0x5031, 0x5032, 0x5033, 0x5034, 0x5035
	.2byte  0x5040, 0x5041, 0x5042, 0x5043, 0x5044, 0x5045
	.2byte  0x5050, 0x5051, 0x5052, 0x5053, 0x5054, 0x5055

gUnknown_083DBEA8:: @ 83DBEA8
	.string "{CLEAR_TO 88}$"

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
