#include "constants/easy_chat.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

#define EC_DUPLICATES(count) (0xFF00 + (count))

	.section .rodata

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
