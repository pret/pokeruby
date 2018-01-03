#include "constants/easy_chat.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "constants/constants.inc"

#define EC_DUPLICATES(count) (0xFF00 + (count))

	.section .rodata

	.align 2
gUnknown_083DBCC4:: @ 83DBCC4
	.byte  1,  3,  5,  8, 10, 12, 15
	.byte  1,  3,  5,  8, 10, 12,  0
	.byte  1,  3,  5,  8, 10, 12, 14
	.byte  1,  3,  5,  8, 10, 12, 14

	.align 2
gOamData_83DBCE0:: @ 83DBCE0
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0400

	.align 2
gSpriteAnim_83DBCE8:: @ 83DBCE8
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBCF0:: @ 83DBCF0
	obj_image_anim_frame 4, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DBCF8:: @ 83DBCF8
	.4byte gSpriteAnim_83DBCE8
	.4byte gSpriteAnim_83DBCF0

	.align 2
gSpriteAnim_83DBD00:: @ 83DBD00
	obj_image_anim_frame 0, 5
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBD08:: @ 83DBD08
	obj_image_anim_frame 4, 5
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DBD10:: @ 83DBD10
	.4byte gSpriteAnim_83DBD00
	.4byte gSpriteAnim_83DBD08

	.align 2
gSpriteTemplate_83DBD18:: @ 83DBD18
	spr_template 2, 0, gOamData_83DBCE0, gSpriteAnimTable_83DBCF8, NULL, gDummySpriteAffineAnimTable, sub_80E8B78

	.align 2
gUnknown_083DBD30:: @ 83DBD30
	obj_tiles gMenuInterviewFrame_Gfx, 2048, 0x0006

	.align 2
gUnknown_083DBD38:: @ 83DBD38
	obj_pal gMenuInterviewFrame_Pal, 0x0004

	.align 2
gOamData_83DBD40:: @ 83DBD40
	.2byte 0x0000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteTemplate_83DBD48:: @ 83DBD48
	spr_template 6, 4, gOamData_83DBD40, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

	.align 2
gUnknown_083DBD60:: @ 83DBD60
	obj_tiles gMenuWordGroupIndicator_Gfx, 4096, 0x0007

	.align 2
gUnknown_083DBD68:: @ 83DBD68
	obj_pal gMenuWordGroupIndicator_Pal, 0x0005

	.align 2
gOamData_83DBD70:: @ 83DBD70
	.2byte 0x4000
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteAnim_83DBD78:: @ 83DBD78
	obj_image_anim_frame 96, 3
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBD80:: @ 83DBD80
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 96, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 0, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBD94:: @ 83DBD94
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 96, 4
	obj_image_anim_frame 64, 4
	obj_image_anim_frame 32, 4
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBDA8:: @ 83DBDA8
	obj_image_anim_frame 64, 2
	obj_image_anim_frame 32, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBDB4:: @ 83DBDB4
	obj_image_anim_frame 64, 2
	obj_image_anim_frame 0, 2
	obj_image_anim_end

	.align 2
gSpriteAnim_83DBDC0:: @ 83DBDC0
	obj_image_anim_frame 64, 2
	obj_image_anim_frame 96, 2
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83DBDCC:: @ 83DBDCC
	.4byte gSpriteAnim_83DBD78
	.4byte gSpriteAnim_83DBD80
	.4byte gSpriteAnim_83DBD94
	.4byte gSpriteAnim_83DBDA8
	.4byte gSpriteAnim_83DBDB4
	.4byte gSpriteAnim_83DBDC0

	.align 2
gSpriteTemplate_83DBDE4:: @ 83DBDE4
	spr_template 7, 5, gOamData_83DBD70, gSpriteAnimTable_83DBDCC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy

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
