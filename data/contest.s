#include "constants/moves.h"
#include "constants/species.h"
	.include "include/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gUnknownText_UnknownFormatting2:: @ 83CC3A0
	.string "{COLOR GREEN}{SHADOW RED}$"

gUnknownText_UnknownFormatting3:: @ 83CC3A7
	.string "{COLOR LIGHT_GREY}$"

	.align 2
gUnknown_083CC3AC:: @ 83CC3AC
	obj_tiles gContestNumbers_UnusedGfx, 512, 0x4e20

	.align 2
gUnknown_083CC3B4:: @ 83CC3B4
	obj_pal gContestNumbers_UnusedPal, 0x4E20
	obj_pal gContestNumbers_UnusedPal, 0x4E21
	obj_pal gContestNumbers_UnusedPal, 0x4E22
	obj_pal gContestNumbers_UnusedPal, 0x4E23

	.align 2
gSpriteAnim_83CC3D4:: @ 83CC3D4
	obj_image_anim_frame 0, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83CC3DC:: @ 83CC3DC
	obj_image_anim_frame 4, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83CC3E4:: @ 83CC3E4
	obj_image_anim_frame 8, 1
	obj_image_anim_end

	.align 2
gSpriteAnim_83CC3EC:: @ 83CC3EC
	obj_image_anim_frame 12, 1
	obj_image_anim_end

	.align 2
gSpriteAnimTable_83CC3F4:: @ 83CC3F4
	.4byte gSpriteAnim_83CC3D4
	.4byte gSpriteAnim_83CC3DC
	.4byte gSpriteAnim_83CC3E4
	.4byte gSpriteAnim_83CC3EC

	.align 2
gSpriteAffineAnim_83CC404:: @ 83CC404
	obj_rot_scal_anim_frame 0x0, 0x0, 0, 1
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83CC414:: @ 83CC414
	obj_rot_scal_anim_frame 0xFFF1, 0xFFF1, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83CC424:: @ 83CC424
	obj_rot_scal_anim_frame 0x1F, 0x1F, 0, 0
	obj_rot_scal_anim_frame 0xF, 0xF, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83CC43C:: @ 83CC43C
	.4byte gSpriteAffineAnim_83CC404
	.4byte gSpriteAffineAnim_83CC414
	.4byte gSpriteAffineAnim_83CC424
	.4byte NULL

	.align 2
gOamData_83CC44C:: @ 83CC44C
	.2byte 0x0000
	.2byte 0x4000
	.2byte 0x0000

	.align 2
gSpriteTemplate_83CC454:: @ 83CC454
	spr_template 20000, 20000, gOamData_83CC44C, gSpriteAnimTable_83CC3F4, NULL, gSpriteAffineAnimTable_83CC43C, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CC46C:: @ 83CC46C
	spr_template 20000, 20001, gOamData_83CC44C, gSpriteAnimTable_83CC3F4, NULL, gSpriteAffineAnimTable_83CC43C, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CC484:: @ 83CC484
	spr_template 20000, 20002, gOamData_83CC44C, gSpriteAnimTable_83CC3F4, NULL, gSpriteAffineAnimTable_83CC43C, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CC49C:: @ 83CC49C
	spr_template 20000, 20003, gOamData_83CC44C, gSpriteAnimTable_83CC3F4, NULL, gSpriteAffineAnimTable_83CC43C, SpriteCallbackDummy

	.align 2
gUnknown_083CC4B4:: @ 83CC4B4
	obj_tiles gBlankGfxCompressed, 4096, 33000
	obj_tiles gBlankGfxCompressed, 4096, 33001
	obj_tiles gBlankGfxCompressed, 4096, 33002
	obj_tiles gBlankGfxCompressed, 4096, 33003

	.align 2
gUnknown_083CC4D4:: @ 83CC4D4
	obj_pal gSharedMem + 0x180A4, 33000
	obj_pal gSharedMem + 0x180C4, 33001
	obj_pal gSharedMem + 0x180E4, 33002
	obj_pal gSharedMem + 0x18104, 33003

	.align 2
gOamData_83CC4F4:: @ 83CC4F4
	.2byte 0x0700
	.2byte 0xC000
	.2byte 0x0000

	.align 2
gSpriteAffineAnim_83CC4FC:: @ 83CC4FC
	obj_rot_scal_anim_frame 0x100, 0x100, 0, 0
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnim_83CC50C:: @ 83CC50C
	obj_rot_scal_anim_frame 0x3, 0x3, 0, 15
	obj_rot_scal_anim_frame 0xFFFD, 0xFFFD, 0, 15
	obj_rot_scal_anim_frame 0x3, 0x3, 0, 15
	obj_rot_scal_anim_frame 0xFFFD, 0xFFFD, 0, 15
	obj_rot_scal_anim_end

	.align 2
gSpriteAffineAnimTable_83CC534:: @ 83CC534
	.4byte gSpriteAffineAnim_83CC4FC
	.4byte gSpriteAffineAnim_83CC50C

	.align 2
gSpriteTemplate_83CC53C:: @ 83CC53C
	spr_template 33000, 33000, gOamData_83CC4F4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83CC534, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CC554:: @ 83CC554
	spr_template 33001, 33001, gOamData_83CC4F4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83CC534, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CC56C:: @ 83CC56C
	spr_template 33002, 33002, gOamData_83CC4F4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83CC534, SpriteCallbackDummy

	.align 2
gSpriteTemplate_83CC584:: @ 83CC584
	spr_template 33003, 33003, gOamData_83CC4F4, gDummySpriteAnimTable, NULL, gSpriteAffineAnimTable_83CC534, SpriteCallbackDummy

gUnknown_083CC59C:: @ 83CC59C
	.string "{HIGHLIGHT TRANSPARENT}{COLOR}$"

gText_Slash:: @ 83CC5A2
	.string "/$"

	.align 1
gUnknown_083CC5A4:: @ 83CC5A4
	.2byte 0x73, 0x19E6, 0x253, 0x4CC4, 0x1F, 0x3E0, 0x3FF, 0x7C00

@ 83CC5B4
	.include "data/contest_excitement_table.inc"

	.align 2
gDefaultContestWinners:: @ 83CC5D0
	.4byte 0
	.4byte 0xFFFF
	.2byte SPECIES_TAILLOW
	.byte CONTEST_SMART
.ifdef ENGLISH
	.string "TAILTA$", 11
	.string "WYATT$", 10
.else
	.string "SCHWALBI$", 11
	.string "ROSEL$", 10
.endif

	.4byte 0
	.4byte 0xFFFF
	.2byte SPECIES_BRELOOM
	.byte CONTEST_BEAUTY
.ifdef ENGLISH
	.string "BRELO$", 11
	.string "LIANA$", 10
.else
	.string "TUFUNG$", 11
	.string "WITOLD$", 10
.endif

	.4byte 0
	.4byte 0xFFFF
	.2byte SPECIES_PELIPPER
	.byte CONTEST_COOL
.ifdef ENGLISH
	.string "PELEP$", 11
	.string "TIERA$", 10
.else
	.string "LIPPER$", 11
	.string "RUFUS$", 10
.endif

	.4byte 0
	.4byte 0xFFFF
	.2byte SPECIES_PELIPPER
	.byte CONTEST_COOL
.ifdef ENGLISH
	.string "PELEP$", 11
	.string "TIERA$", 10
.else
	.string "LIPPER$", 11
	.string "ELLEN$", 10
.endif

	.4byte 0
	.4byte 0xFFFF
	.2byte SPECIES_PELIPPER
	.byte CONTEST_COOL
.ifdef ENGLISH
	.string "PELEP$", 11
	.string "TIERA$", 10
.else
	.string "LIPPER$", 11
	.string "AVIA$", 10
.endif

	.4byte 0
	.4byte 0xFFFF
	.2byte SPECIES_DELCATTY
	.byte CONTEST_SMART
.ifdef ENGLISH
	.string "KITSY$", 11
	.string "OMAR$", 10
.else
	.string "CONEC$", 11
	.string "HAUBERT$", 10
.endif

	.4byte 0
	.4byte 0xFFFF
	.2byte SPECIES_GULPIN
	.byte CONTEST_CUTE
.ifdef ENGLISH
	.string "GULPS$", 11
	.string "MACIE$", 10
.else
	.string "SCHLUCKI$", 11
	.string "HEILWIG$", 10
.endif

	.4byte 0
	.4byte 0xFFFF
	.2byte SPECIES_LOUDRED
	.byte CONTEST_TOUGH
.ifdef ENGLISH
	.string "LOUDED$", 11
	.string "BRYANT$", 10
.else
	.string "KEELO$", 11
	.string "ISEGRIM$", 10
.endif
