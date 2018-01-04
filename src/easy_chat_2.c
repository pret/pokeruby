#include "global.h"
#include "constants/map_objects.h"
#include "decompress.h"
#include "easy_chat.h"
#include "field_map_obj.h"
#include "graphics.h"
#include "menu.h"
#include "palette.h"
#include "sprite.h"
#include "strings.h"
#include "trig.h"

extern void sub_809D104();

void sub_80E8268(void);
void sub_80E82BC(struct Sprite *);
void sub_80E8534(void);
void sub_80E85F8(struct Sprite *);
void sub_80E872C(struct Sprite *);
void sub_80E8760(struct Sprite *);
void sub_80E8818(void);
void sub_80E8860(struct Sprite *);
void sub_80E8A7C(void);
void sub_80E8B78(struct Sprite *);
void sub_80E8FA4(void);
void sub_80E9198(u8);
void sub_80E91D4(u8);
void sub_80E948C(void);
void sub_80E95A4(void);
void sub_80E9620(u16, u16);

const u16 InterviewPalette_0[] = INCBIN_U16("graphics/misc/interview_pal0.gbapal");
const u16 InterviewPalette_1[] = INCBIN_U16("graphics/misc/interview_pal1.gbapal");
const u8 InterviewArrowTiles[] = INCBIN_U8("graphics/misc/interview_arrow.4bpp");
const u8 InterviewButtonTiles[] = INCBIN_U8("graphics/misc/interview_buttons.4bpp");
const u16 gMenuInterviewFrame_Pal[] = INCBIN_U16("graphics/misc/interview_frame.gbapal");
const u8 gMenuInterviewFrame_Gfx[] = INCBIN_U8("graphics/misc/interview_frame.4bpp.lz");
const u8 InterviewTriangleCursorTiles[] = INCBIN_U8("graphics/misc/interview_triangle_cursor.4bpp");

void sub_80E8218(void)
{
    struct SpriteSheet interviewSpriteSheets[] =
    {
        {InterviewTriangleCursorTiles, 0x20, 0},
        {gInterviewOutlineCursorTiles, 0x700, 1},
        {InterviewArrowTiles, 0x100, 2},
        {InterviewButtonTiles, 0x100, 3},
        {NULL, 0, 0},
    };
    struct SpritePalette interviewSpritePalettes[] =
    {
        {InterviewPalette_0, 0},
        {InterviewPalette_1, 1},
        {NULL, 0},
    };

    LoadSpriteSheets(interviewSpriteSheets);
    LoadSpritePalettes(interviewSpritePalettes);
    sub_80E8268();
    sub_80E8818();
    sub_80E8A7C();
}

const struct OamData gOamData_83DBBF4 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct SpriteTemplate gSpriteTemplate_83DBBFC =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gOamData_83DBBF4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E82BC,
};

void sub_80E8268(void)
{
    u8 spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_83DBBFC, 0, 0, 0);
    gSprites[spriteId].pos1.y = gUnknown_083DB694->unk8A * 8 + 8;
    gSprites[spriteId].pos1.x = gUnknown_083DB694->unk88 * 8 + 4;
    gSprites[spriteId].data[0] = 0;
    gSprites[spriteId].data[1] = 0;
    gUnknown_083DB694->unk98 = &gSprites[spriteId];
}

void sub_80E82BC(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        if (gUnknown_083DB694->unk87)
        {
            u16 r5 = gUnknown_083DB694->unk86;
            u16 r4 = gUnknown_083DB694->unk85;
            u16 r7 = 0;
            u16 i;

            for (i = 0; i < r4; i++)
                r7 += gUnknown_083DB694->unk8C[r5][i];

            if (r5 == gUnknown_083DB694->unk84)
            {
                sprite->pos1.y = 96;
                sprite->pos1.x = (r4 * 7  + 3) * 8 + 4;
            }
            else
            {
                sprite->pos1.y = (gUnknown_083DB694->unk8A + r5 * 2) * 8 + 8;
                sprite->pos1.x = (gUnknown_083DB694->unk88 + r7 + r4 * 11) * 8 + 4;
            }

            sprite->pos2.x = -6;
            sprite->data[0] = 0;
        }
        else
        {
            if (++sprite->data[0] > 2)
            {
                sprite->data[0] = 0;
                if (++sprite->pos2.x > 0)
                    sprite->pos2.x = -6;
            }
        }
    }
}

void sub_80E8398(u8 a)
{
    switch (a)
    {
    case 0:
        gUnknown_083DB694->unk98->data[1] = a;
        gUnknown_083DB694->unk98->pos2.x = a;
        gUnknown_083DB694->unk98->invisible = FALSE;
        break;
    case 1:
        gUnknown_083DB694->unk98->data[1] = a;
        gUnknown_083DB694->unk98->pos2.x = 0;
        gUnknown_083DB694->unk98->invisible = FALSE;
        break;
    case 2:
        gUnknown_083DB694->unk98->data[1] = 1;
        gUnknown_083DB694->unk98->pos2.x = 0;
        gUnknown_083DB694->unk98->invisible = TRUE;
        break;
    }
}

const struct OamData gOamData_83DBC14 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 1,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_83DBC1C[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC24[] =
{
#if ENGLISH
    ANIMCMD_FRAME(8, 5),
#else
    ANIMCMD_FRAME(0, 5),
#endif
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC2C[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC34[] =
{
    ANIMCMD_FRAME(24, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC3C[] =
{
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC44[] =
{
    ANIMCMD_FRAME(40, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC4C[] =
{
    ANIMCMD_FRAME(40, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC54[] =
{
    ANIMCMD_FRAME(40, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC5C[] =
{
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC64[] =
{
#if ENGLISH
    ANIMCMD_FRAME(40, 5),
#else
    ANIMCMD_FRAME(16, 5),
#endif
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC6C[] =
{
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBC74[] =
{
    ANIMCMD_FRAME(40, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DBC7C[] =
{
    gSpriteAnim_83DBC1C,
    gSpriteAnim_83DBC24,
    gSpriteAnim_83DBC2C,
    gSpriteAnim_83DBC34,
};

const union AnimCmd *const gSpriteAnimTable_83DBC8C[] =
{
    gSpriteAnim_83DBC3C,
    gSpriteAnim_83DBC44,
    gSpriteAnim_83DBC4C,
    gSpriteAnim_83DBC54,
};

const union AnimCmd *const gSpriteAnimTable_83DBC9C[] =
{
    gSpriteAnim_83DBC5C,
    gSpriteAnim_83DBC64,
    gSpriteAnim_83DBC6C,
    gSpriteAnim_83DBC74,
};

/*
const struct SpriteTemplate gSpriteTemplate_83DBCAC =
{
    .tileTag = 1,
    .paletteTag = 1,
    .oam = &gOamData_83DBC14,
    .anims = gSpriteAnimTable_83DBC7C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E85F8,
};
*/

void sub_80E8420(void)
{
    struct SpriteTemplate spriteTemplate_83DBCAC =
    {
        .tileTag = 1,
        .paletteTag = 1,
        .oam = &gOamData_83DBC14,
        .anims = gSpriteAnimTable_83DBC7C,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_80E85F8,
    };
    u8 spriteId;

    spriteId = CreateSprite(&spriteTemplate_83DBCAC, 0, 0, 3);
    gUnknown_083DB694->unk9C = &gSprites[spriteId];

    spriteTemplate_83DBCAC.anims = gSpriteAnimTable_83DBC8C;
    spriteTemplate_83DBCAC.callback = sub_80E872C;
    spriteId = CreateSprite(&spriteTemplate_83DBCAC, 0, 0, 4);
    gUnknown_083DB694->unkA0 = &gSprites[spriteId];

    spriteTemplate_83DBCAC.anims = gSpriteAnimTable_83DBC9C;
    spriteTemplate_83DBCAC.callback = sub_80E8760;
    spriteId = CreateSprite(&spriteTemplate_83DBCAC, 0, 0, 5);
    gUnknown_083DB694->unkA4 = &gSprites[spriteId];

    gUnknown_083DB694->unk9C->data[0] = 0;
    gUnknown_083DB694->unkA0->data[0] = 0;
    gUnknown_083DB694->unkA4->data[0] = 0;

    gUnknown_083DB694->unk9C->data[3] = 0x0101 + IndexOfSpritePaletteTag(1) * 16;
    sub_80E8534();
    gUnknown_083DB694->unk96 = 1;
    REG_BLDCNT = 0x3F40;
}

void sub_80E8504(void)
{
    DestroySprite(gUnknown_083DB694->unk9C);
    DestroySprite(gUnknown_083DB694->unkA0);
    DestroySprite(gUnknown_083DB694->unkA4);
}

void sub_80E8534(void)
{
    if (gUnknown_083DB694->unk1B7 != 0)
        gUnknown_020388AC = 1;
    else if (gUnknown_083DB694->unk26 == 0)
        gUnknown_020388AC = 0;
    else if (gUnknown_083DB694->unk1A8 == 0 && gUnknown_083DB694->unk1A9 == 6)
        gUnknown_020388AC = 2;
    else
        gUnknown_020388AC = 3;

    gUnknown_083DB694->unk9C->data[2] = gUnknown_020388AC;
    gUnknown_083DB694->unkA0->data[2] = gUnknown_020388AC;
    gUnknown_083DB694->unkA4->data[2] = gUnknown_020388AC;

    StartSpriteAnim(gUnknown_083DB694->unk9C, gUnknown_020388AC);
    StartSpriteAnim(gUnknown_083DB694->unkA0, gUnknown_020388AC);
    StartSpriteAnim(gUnknown_083DB694->unkA4, gUnknown_020388AC);

    gUnknown_083DB694->unk9C->data[5] = 8;
    gUnknown_083DB694->unk9C->data[6] = 8;
    gUnknown_083DB694->unk9C->data[1] = 0;
}

const s8 gUnknown_083DBCC4[][7] =
{
    {1,  3,  5,  8, 10, 12, 15},
    {1,  3,  5,  8, 10, 12,  0},
    {1,  3,  5,  8, 10, 12, 14},
    {1,  3,  5,  8, 10, 12, 14},
};

void sub_80E85F8(struct Sprite *sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] & 1)
        sprite->data[5] = 8 + (gSineTable[sprite->data[1]] >> 5);
    else
        sprite->data[6] = 8 - (gSineTable[sprite->data[1]] >> 5);

    sprite->data[1] = (sprite->data[1] + 5) & 0xFF;

    REG_BLDALPHA = (sprite->data[6] << 8) | sprite->data[5];

    if (gUnknown_083DB694->unk96 != 0)
    {
        sub_80E8534();

        gUnknown_083DB694->unk9C->data[5] = 8;
        gUnknown_083DB694->unk9C->data[6] = 8;
        gUnknown_083DB694->unk9C->data[1] = 0;

        switch (sprite->data[2])
        {
        case 0:
            sprite->pos1.x = gUnknown_083DB694->unk1A9 * 88 + 32;
            sprite->pos1.y = (gUnknown_083DB694->unk1A8 - gUnknown_083DB694->unk1B5) * 16 + 96;
            break;
        case 1:
            sprite->pos1.x = 216;
            sprite->pos1.y = gUnknown_083DB694->unk1A8 * 16 + 96;
            break;
        case 2:
            sprite->pos1.x = 151;
            sprite->pos1.y = 96;
            break;
        case 3:
            sprite->pos1.x = gUnknown_083DBCC4[gUnknown_083DB694->unk1A8][gUnknown_083DB694->unk1A9] * 8 + 31;
            sprite->pos1.y = (gUnknown_083DB694->unk1A8 - gUnknown_083DB694->unk1B5) * 16 + 96;
            break;
        }
    }
}


void sub_80E872C(struct Sprite *sprite)
{
    if (gUnknown_083DB694->unk96 != 0 && sprite->data[2] == 0)
    {
        sprite->pos1.x = gUnknown_083DB694->unk9C->pos1.x + 32;
        sprite->pos1.y = gUnknown_083DB694->unk9C->pos1.y;
    }
}

#if ENGLISH
void sub_80E8760(struct Sprite *sprite)
{
    if (gUnknown_083DB694->unk96 != 0)
    {
        switch (sprite->data[2])
        {
        case 0:
            sprite->pos1.x = gUnknown_083DB694->unk9C->pos1.x + 64;
            sprite->pos1.y = gUnknown_083DB694->unk9C->pos1.y;
            break;
        case 2:
            sprite->pos1.x = gUnknown_083DB694->unk9C->pos1.x + 21;
            sprite->pos1.y = gUnknown_083DB694->unk9C->pos1.y;
            break;
        }
    }
}
#else
__attribute__((naked))
void sub_80E8760(struct Sprite *sprite)
{
    asm(".syntax unified\n\
	push {lr}\n\
	adds r2, r0, 0\n\
	ldr r0, _080E8784 @ =gUnknown_083DB694\n\
	ldr r1, [r0]\n\
	adds r0, r1, 0\n\
	adds r0, 0x96\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _080E87B2\n\
	movs r3, 0x32\n\
	ldrsh r0, [r2, r3]\n\
	cmp r0, 0x1\n\
	beq _080E8798\n\
	cmp r0, 0x1\n\
	bgt _080E8788\n\
	cmp r0, 0\n\
	beq _080E878E\n\
	b _080E87B2\n\
	.align 2, 0\n\
_080E8784: .4byte gUnknown_083DB694\n\
_080E8788:\n\
	cmp r0, 0x2\n\
	beq _080E87A2\n\
	b _080E87B2\n\
_080E878E:\n\
	adds r1, 0x9C\n\
	ldr r0, [r1]\n\
	ldrh r0, [r0, 0x20]\n\
	adds r0, 0x40\n\
	b _080E87AA\n\
_080E8798:\n\
	adds r1, 0x9C\n\
	ldr r0, [r1]\n\
	ldrh r0, [r0, 0x20]\n\
	adds r0, 0x1C\n\
	b _080E87AA\n\
_080E87A2:\n\
	adds r1, 0x9C\n\
	ldr r0, [r1]\n\
	ldrh r0, [r0, 0x20]\n\
	adds r0, 0x15\n\
_080E87AA:\n\
	strh r0, [r2, 0x20]\n\
	ldr r0, [r1]\n\
	ldrh r0, [r0, 0x22]\n\
	strh r0, [r2, 0x22]\n\
_080E87B2:\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided\n");
}
#endif

void sub_80E87A4(u8 a)
{
    gUnknown_083DB694->unkA8->data[1] = (a == 0);
    gUnknown_083DB694->unkA8->pos2.x = 0;
}

void sub_80E87CC(u8 a)
{
    gUnknown_083DB694->unkA8->invisible = (a == 0);
    sub_80E87A4(a);
    if (a != 0)
        gUnknown_083DB694->unk1B9 = 1;
}

void sub_80E8818(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83DBBFC, 0, 0, 0);

    gSprites[spriteId].data[0] = 0;
    gSprites[spriteId].data[1] = 0;
    gUnknown_083DB694->unkA8 = &gSprites[spriteId];
    gUnknown_083DB694->unkA8->callback = sub_80E8860;
    sub_80E87CC(0);
}

void sub_80E8860(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        if (gUnknown_083DB694->unk1B9 != 0)
        {
            sprite->pos1.x = gUnknown_083DB694->unk99A5 * 88 + 44;
            sprite->pos1.y = (gUnknown_083DB694->unk99A4 - gUnknown_083DB694->unk9A29) * 16 + 96;
            sprite->pos2.x = -6;
            sprite->data[0] = 0;
        }
        else
        {
            sprite->data[0]++;
            if (sprite->data[0] > 2)
            {
                sprite->data[0] = 0;
                sprite->pos2.x++;
                if (sprite->pos2.x > 0)
                    sprite->pos2.x = -6;
            }
        }
    }
}

void sub_80E88F0(void)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        gUnknown_083DB694->unkAC[i]->invisible = TRUE;
        gUnknown_083DB694->unkAC[i]->data[1] = 0;
        gUnknown_083DB694->unkB4[i]->invisible = TRUE;
        gUnknown_083DB694->unkB4[i]->data[1] = 0;
    }
    gUnknown_083DB694->unk9C70 = 0;
}

void sub_80E8958(u8 animNum)
{
    s16 r9;
    u16 i;

    if (animNum == 0)
    {
        r9 = 100;
        gUnknown_083DB694->unk9C6C = &gUnknown_083DB694->unk1B5;
        if (gUnknown_083DB694->unk26 == 0)
            gUnknown_083DB694->unk9C71 = gUnknown_083DB694->unk1B6 - 4;
        else
            gUnknown_083DB694->unk9C71 = 0;
    }
    else
    {
        r9 = 120;
        gUnknown_083DB694->unk9C6C = &gUnknown_083DB694->unk9A29;
        gUnknown_083DB694->unk9C71 = gUnknown_083DB694->unk9A28 - 4;
        for (i = 0; i < 2; i++)
        {
            gUnknown_083DB694->unkB4[i]->invisible = FALSE;
            gUnknown_083DB694->unkB4[i]->data[1] = 1;
        }
    }

    if (gUnknown_083DB694->unk9C71 < 0)
        gUnknown_083DB694->unk9C71 = 0;

    for (i = 0; i < 2; i++)
    {
        gUnknown_083DB694->unkAC[i]->pos1.x = r9;
        gUnknown_083DB694->unkAC[i]->invisible = FALSE;
        gUnknown_083DB694->unkAC[i]->data[1] = 1;
        StartSpriteAnim(gUnknown_083DB694->unkAC[i], animNum);
    }

    gUnknown_083DB694->unk9C70 = 1;
}

const struct OamData gOamData_83DBCE0 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_83DBCE8[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBCF0[] =
{
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DBCF8[] =
{
    gSpriteAnim_83DBCE8,
    gSpriteAnim_83DBCF0,
};

const union AnimCmd gSpriteAnim_83DBD00[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBD08[] =
{
    ANIMCMD_FRAME(4, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DBD10[] =
{
    gSpriteAnim_83DBD00,
    gSpriteAnim_83DBD08,
};

void sub_80E8A7C(void)
{
    struct SpriteTemplate spriteTemplate_83DBD18 =
    {
        .tileTag = 2,
        .paletteTag = 0,
        .oam = &gOamData_83DBCE0,
        .anims = gSpriteAnimTable_83DBCF8,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_80E8B78,
    };
    u16 i;
    u8 spriteId;

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(&spriteTemplate_83DBD18, 0, 84 + i * 72 , 0);
        gUnknown_083DB694->unkAC[i] = &gSprites[spriteId];
        gUnknown_083DB694->unkAC[i]->data[0] = i;
        gUnknown_083DB694->unkAC[i]->vFlip = i;
    }

    spriteTemplate_83DBD18.tileTag = 3;
    spriteTemplate_83DBD18.anims = gSpriteAnimTable_83DBD10;

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(&spriteTemplate_83DBD18, 142 + i * 40, 88, 0);
        gUnknown_083DB694->unkB4[i] = &gSprites[spriteId];
        gUnknown_083DB694->unkB4[i]->data[0] = i;
        gUnknown_083DB694->unkB4[i]->oam.shape = 1;
        gUnknown_083DB694->unkB4[i]->oam.size = 1;
        StartSpriteAnim(gUnknown_083DB694->unkB4[i], i);
    }

    sub_80E8958(0);
    sub_80E88F0();
}

void sub_80E8B78(struct Sprite *sprite)
{
    bool8 invisible;

    if (gUnknown_083DB694->unk9C70 != 0 && sprite->data[1] != 0)
    {
        if (sprite->data[0] == 0)
        {
            invisible = FALSE;
            if (*gUnknown_083DB694->unk9C6C == 0)
                invisible = TRUE;
            sprite->invisible = invisible;
        }
        else
        {
            invisible = FALSE;
            if (*gUnknown_083DB694->unk9C6C == gUnknown_083DB694->unk9C71)
                invisible = TRUE;
            sprite->invisible = invisible;
        }
    }
}

// defined below
extern const struct SpriteTemplate gSpriteTemplate_83DBD48;

void sub_80E8BF4(u8 reporter, u8 b)
{
    struct CompressedSpriteSheet gUnknown_083DBD30 = {gMenuInterviewFrame_Gfx, 2048, 0x0006};
    struct SpritePalette gUnknown_083DBD38 = {gMenuInterviewFrame_Pal, 0x0004};
    s16 x;
    s16 y;
    u16 gabbyTyGfxId;
    u8 spriteId;

    switch (b)
    {
    case 2:
    default:
        x = 64;
        y = 40;
        break;
    case 5:
        x = 36;
        y = 48;
        break;
    }

    switch (reporter)
    {
    case 0:  // Gabby
    default:
        gabbyTyGfxId = MAP_OBJ_GFX_REPORTER_M;
        break;
    case 1:  // Ty
        gabbyTyGfxId = MAP_OBJ_GFX_REPORTER_F;
        break;
    }

    LoadCompressedObjectPic(&gUnknown_083DBD30);
    LoadSpritePalette(&gUnknown_083DBD38);
    CreateSprite(&gSpriteTemplate_83DBD48, x, y, 1);

    spriteId = AddPseudoFieldObject(
      (gSaveBlock2.playerGender == MALE) ? MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL : MAP_OBJ_GFX_RIVAL_MAY_NORMAL,
      SpriteCallbackDummy, x - 12, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = 0;
        StartSpriteAnim(&gSprites[spriteId], 3);
    }

    spriteId = AddPseudoFieldObject(gabbyTyGfxId, SpriteCallbackDummy, x + 12, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = 0;
        StartSpriteAnim(&gSprites[spriteId], 2);
    }
}

const struct OamData gOamData_83DBD40 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct SpriteTemplate gSpriteTemplate_83DBD48 =
{
    .tileTag = 6,
    .paletteTag = 4,
    .oam = &gOamData_83DBD40,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const struct CompressedSpriteSheet gUnknown_083DBD60 = {gMenuWordGroupIndicator_Gfx, 4096, 0x0007};

const struct SpritePalette gUnknown_083DBD68 = {gMenuWordGroupIndicator_Pal, 0x0005};

const struct OamData gOamData_83DBD70 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_83DBD78[] =
{
    ANIMCMD_FRAME(96, 3),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBD80[] =
{
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(96, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBD94[] =
{
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(96, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBDA8[] =
{
    ANIMCMD_FRAME(64, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBDB4[] =
{
    ANIMCMD_FRAME(64, 2),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DBDC0[] =
{
    ANIMCMD_FRAME(64, 2),
    ANIMCMD_FRAME(96, 2),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DBDCC[] =
{
    gSpriteAnim_83DBD78,
    gSpriteAnim_83DBD80,
    gSpriteAnim_83DBD94,
    gSpriteAnim_83DBDA8,
    gSpriteAnim_83DBDB4,
    gSpriteAnim_83DBDC0,
};

const struct SpriteTemplate gSpriteTemplate_83DBDE4 =
{
    .tileTag = 7,
    .paletteTag = 5,
    .oam = &gOamData_83DBD70,
    .anims = gSpriteAnimTable_83DBDCC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

void sub_80E8CEC(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&gUnknown_083DBD60);
    LoadSpritePalette(&gUnknown_083DBD68);

    spriteId = CreateSprite(&gSpriteTemplate_83DBDE4, 224, 88, 0);
    if (spriteId != MAX_SPRITES)
        gUnknown_083DB694->unk9C74 = &gSprites[spriteId];
    else
        gUnknown_083DB694->unk9C74 = NULL;
}

void sub_80E8D54(void)
{
    if (gUnknown_083DB694->unk9C74 != NULL)
    {
        if (gUnknown_083DB694->unk26 == 0)
            StartSpriteAnim(gUnknown_083DB694->unk9C74, 1);
        else
            StartSpriteAnim(gUnknown_083DB694->unk9C74, 2);
    }
}

void sub_80E8D8C(u8 a)
{
    if (gUnknown_083DB694->unk9C74 != NULL)
    {
        if (a != 0)
        {
            if (gUnknown_083DB694->unk26 == 0)
                StartSpriteAnim(gUnknown_083DB694->unk9C74, 3);
            else
                StartSpriteAnim(gUnknown_083DB694->unk9C74, 4);
        }
        else
        {
            StartSpriteAnim(gUnknown_083DB694->unk9C74, 5);
        }
    }
}

extern const u16 gUnknown_083DBDFC[];

extern const u16 gUnknown_083DBE40[];

void sub_80E8DD8(void)
{
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;

    REG_BG0CNT = 0x8B00;
    REG_BG1CNT = 0x0D09;

    CpuCopy16(gUnknown_08E945D0, gUnknown_083DB694->unk1C8, 0x500);
    LZ77UnCompWram(gUnknown_08E953D0, gUnknown_083DB694->unk6C8);
    LZ77UnCompVram(gMenuWordGroupFrame_Gfx, (void *)(VRAM + 0x8000));
    CpuCopy16(gUnknown_083DB694->unk1C8, (void *)(VRAM + 0x6800), 0x500);
    LoadPalette(gMenuWordGroupFrame1_Pal, 64, 64);

    REG_BG2CNT = 0x0E02;

    DmaClear16(3, (void *)(VRAM + 0x7000), 0x800);
    DmaCopy16Defvars(3, gUnknown_08E9AB00, (void *)(VRAM + 0x6000), 64);
    LZ77UnCompVram(gUnknown_08E9AB60, (void *)(VRAM + 0x7000));
    LoadPalette(gUnknown_08E9AB40, 0, 32);
    LoadPalette(gUnknown_083DBDFC, 16, 32);

    REG_BG3CNT = 0x0F0F;

    DmaClear32(3, (void *)(VRAM + 0x7800), 0x800);
    LoadPalette(gUnknown_083DBE40, 32, 32);
    gPlttBufferUnfaded[63] = RGB(31, 31, 31);
    gPlttBufferUnfaded[49] = RGB(27, 26, 27);
    gPlttBufferUnfaded[56] = RGB(28, 28, 28);
    gPlttBufferFaded[63] = RGB(31, 31, 31);
    gPlttBufferFaded[49] = RGB(27, 26, 27);
    gPlttBufferFaded[56] = RGB(28, 28, 28);

    gUnknown_083DB694->unkBC = 0;
    sub_80E8FA4();
    sub_80E948C();
    sub_80E9198(10);
    sub_80E91D4(0);
    sub_80E95A4();

    REG_BLDCNT = 0;
}

// The components are ORed in the reverse order from the normal RGB macro
#define RGB_(r, g, b) ((((b) & 0x1F) << 10) | (((g) & 0x1F) << 5) | ((r) & 0x1F))

#define R_VAL(color) ((color) & 0x1F)
#define G_VAL(color) (((color) >> 5) & 0x1F)
#define B_VAL(color) (((color) >> 10) & 0x1F)

void sub_80E8FA4(void)
{
    u16 i;
    u16 r3;
    u16 r4;
    s32 sp0[3];
    s32 spC[3];
    s32 sp18[3];

    for (i = 0; i < 3; i++)
    {
        sp0[0] = R_VAL(*(gMenuWordGroupFrame2_Pal + i + 1)) << 8;
        spC[0] = R_VAL(*(gMenuWordGroupFrame2_Pal + i + 4)) << 8;
        sp0[1] = G_VAL(*(gMenuWordGroupFrame2_Pal + i + 1)) << 8;
        spC[1] = G_VAL(*(gMenuWordGroupFrame2_Pal + i + 4)) << 8;
        sp0[2] = B_VAL(*(gMenuWordGroupFrame2_Pal + i + 1)) << 8;
        spC[2] = B_VAL(*(gMenuWordGroupFrame2_Pal + i + 4)) << 8;

        for (r3 = 0; r3 < 3; r3++)
            sp18[r3] = (spC[r3] - sp0[r3]) / 8;

        for (r4 = 0; r4 < 8; r4++)
        {
            gUnknown_083DB694->unk9C34[i][r4] = RGB_(sp0[0] >> 8, sp0[1] >> 8, sp0[2] >> 8);
            for (r3 = 0; r3 < 3; r3++)
                sp0[r3] += sp18[r3];
        }
        gUnknown_083DB694->unk9C34[i][r4] = RGB_(spC[0] >> 8, spC[1] >> 8, spC[2] >> 8);
    }
    gUnknown_083DB694->unk9C32 = 0;
}

void sub_80E9108(u8 a)
{
    u16 i;

    gUnknown_083DB694->unk9C32 += a;
    for (i = 0; i < 3; i++)
    {
        gPlttBufferUnfaded[81 + i] = gUnknown_083DB694->unk9C34[i][gUnknown_083DB694->unk9C32];
        gPlttBufferFaded[81 + i] = gUnknown_083DB694->unk9C34[i][gUnknown_083DB694->unk9C32];
    }
}

void sub_80E9178(void)
{
    gUnknown_083DB694->unk9C32 = 0;
    sub_80E9108(0);
}

void sub_80E9198(u8 a)
{
    gUnknown_03000740 = a;
}

u8 sub_80E91A4(void)
{
    return gUnknown_03000740;
}

void sub_80E91B0(const u8 *a, u8 b, u8 c, u8 d)
{
    sub_8072AB0(a, b * 8, c * 8, 176, d * 8, 1);
}

void sub_80E91D4(u8 a)
{
    BasicInitMenuWindow(&gWindowConfig_81E6DA8);

    if (a == 10)
    {
        MenuZeroFillWindowRect(3, 14, 26, 19);
        sub_80E9198(10);
        return;
    }

    //_080E9200
    if (sub_80E91A4() == 10)
        MenuDrawTextWindow(3, 14, 26, 19);

    //_080E9218
    sub_80E9198(a);
    switch (a)
    {
    case 0:
        sub_80E91B0(gUnknown_083DB694->unk9C80, 4, 15, 2);
        sub_80E91B0(gUnknown_083DB694->unk9CC9, 4, 17, 2);
        break;
    case 1:
        sub_80E91B0(gUnknown_083DB694->unk9D12, 4, 15, 2);
        sub_80E91B0(gUnknown_083DB694->unk9D5B, 4, 17, 2);
        break;
    case 2:
        sub_80E91B0(gOtherText_TextDeletedConfirmPage1, 4, 15, 2);
        sub_80E91B0(gOtherText_TextDeletedConfirmPage2, 4, 17, 2);
        break;
    case 3:
        switch (gUnknown_083DB694->unk8)
        {
        case 9:
            sub_80E91B0(gOtherText_QuitGivingInfo, 4, 15, 4);
            break;
        case 4:
            sub_80E91B0(gOtherText_StopGivingMail, 4, 15, 4);
            break;
        default:
            sub_80E91B0(gOtherText_QuitEditing, 4, 15, 4);
            break;
        }
        break;
    case 4:
        sub_80E91B0(gOtherText_EditedTextNoSavePage1, 4, 15, 2);
        sub_80E91B0(gOtherText_EditedTextNoSavePage2, 4, 17, 2);
        break;
    case 5:
        sub_80E91B0(gOtherText_EnterAPhraseOrWord, 4, 15, 4);
        break;
    case 6:
        sub_80E91B0(gOtherText_TextNoDelete, 4, 15, 4);
        break;
    case 7:
        sub_80E91B0(gOtherText_OnlyOnePhrase, 4, 15, 2);
        sub_80E91B0(gOtherText_OriginalSongRestored, 4, 17, 2);
        break;
    case 8:
        sub_80E91B0(gOtherText_TrendyAlready, 4, 15, 4);
        break;
    case 9:
        sub_80E91B0(gOtherText_CombineTwoPhrases, 4, 15, 4);
        break;
    }
}

void sub_80E9368(u8 a)
{
    const u8 *r4;

    switch (a)
    {
    case 0:
        r4 = gOtherText_Profile;
        break;
    case 1:
        r4 = gOtherText_AtBattleStart;
        break;
    case 2:
        r4 = gOtherText_UponWinningBattle;
        break;
    case 3:
        r4 = gOtherText_UponLosingBattle;
        break;
    case 6:
        r4 = gOtherText_TheBardsSong;
        break;
    case 9:
        r4 = gOtherText_WhatsHipHappening;
        break;
    case 5:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
        r4 = gOtherText_Interview;
        break;
    case 13:
        r4 = gOtherText_GoodSaying;
        break;
    default:
        r4 = NULL;
        break;
    }

    BasicInitMenuWindow(&gWindowConfig_81E6D8C);
    gUnknown_083DB694->unk9F8E[0] = EXT_CTRL_CODE_BEGIN;
    gUnknown_083DB694->unk9F8E[1] = 5;
    gUnknown_083DB694->unk9F8E[2] = 1;
    if (r4 != NULL)
    {
        sub_8072C74(gUnknown_083DB694->unk9F8E + 3, r4, 240, 2);
        MenuPrint(gUnknown_083DB694->unk9F8E, 0, 0);
    }
    else
    {
        u8 *str = gUnknown_083DB694->unk9F8E + 3;

        str[0] = EXT_CTRL_CODE_BEGIN;
        str[1] = 0x11;
        str[2] = 0x10;
        str[3] = EOS;

        MenuPrint(gUnknown_083DB694->unk9F8E, 0, 0);
        MenuPrint(gUnknown_083DB694->unk9F8E, 28, 0);
    }
    BasicInitMenuWindow(&gWindowConfig_81E6DA8);
}

void sub_80E948C(void)
{
    switch (gUnknown_083DB694->unk9)
    {
    case 4:
        sub_809D104((void *)(VRAM + 0x6800), 3, 3, gUnknown_08E94AD0, 0, 26, 24, 6);
        break;
    case 5:
        sub_809D104((void *)(VRAM + 0x6800), 14, 2, gUnknown_08E94AD0, 0, 18, 13, 8);
        break;
    case 0:
        sub_809D104((void *)(VRAM + 0x6800), 2, 2, gUnknown_08E94AD0, 0, 10, 26, 8);
        break;
    case 1:
        sub_809D104((void *)(VRAM + 0x6800), 2, 0, gUnknown_08E94AD0, 0, 0, 26, 10);
        break;
    case 2:
        sub_809D104((void *)(VRAM + 0x6800), 14, 3, gUnknown_08E94AD0, 13, 18, 13, 4);
        break;
    case 3:
        sub_809D104((void *)(VRAM + 0x6800), 3, 2, gUnknown_08E94AD0, 0, 32, 24, 4);
        break;
    }
}

void sub_80E95A4(void)
{
    BasicInitMenuWindow(&gWindowConfig_81E6D8C);
    switch (gUnknown_083DB694->unk9)
    {
    case 4:
        sub_80E9620(4, 6);
        break;
    case 5:
        sub_80E9620(2, 17);
        break;
    case 0:
        sub_80E9620(3, 5);
        break;
    case 1:
        sub_80E9620(0, 5);
        break;
    case 2:
        sub_80E9620(4, 17);
        break;
    case 3:
        sub_80E9620(3, 6);
        break;
    }
    BasicInitMenuWindow(&gWindowConfig_81E6DA8);
}
