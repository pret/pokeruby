#include "global.h"
#include "constants/easy_chat.h"
#include "constants/event_objects.h"
#include "data2.h"
#include "decompress.h"
#include "easy_chat.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "field_message_box.h"
#include "graphics.h"
#include "menu.h"
#include "palette.h"
#include "pokedex.h"
#include "random.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "trig.h"
#include "scanline_effect.h"

#include "data/text/easy_chat/group_words.h"
#include "data/text/easy_chat/words_by_letter.h"
#include "data/text/easy_chat/group_sizes.h"
#include "data/text/easy_chat/group_orders.h"
#include "data/text/easy_chat/group_name_table.h"

extern void sub_8095C8C();
extern void sub_809D104(void *, u16, u16, const void *, u16, u16, u16, u16);

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
void sub_80E97C0(u16, u16);
void sub_80E9A4C(void);
void sub_80E9A60(const u8 *, u16, u16);
void sub_80E9A7C(u8 *, u16);
void sub_80E9AD4(void);
void sub_80E9C74(u16);
u8 sub_80EA1E0(void);
void sub_80EA24C(void);
void sub_80EA348(void);
void sub_80EA4A4(void);
void sub_80EA5A0(void);
void sub_80EA704(void);
void sub_80EA764(void);
void sub_80EA7F4(void);
void sub_80EA8BC(void);
void sub_80EA948(void);
void sub_80EAA44(void);
void sub_80EAAD4(void);
void sub_80EABD4(u16 *, u16, u16, u16, u16, u16, u16, u16, u16);
void sub_80EAC0C(u16 *);
void sub_80EAC30(struct UnknownEasyChatStruct1 *, u16, u16, u16, u16, void *);
void sub_80EAC48(struct UnknownEasyChatStruct1 *);
void sub_80EACBC(void *, u16 *, struct UnknownEasyChatStruct1 *);
u8 *CopyEasyChatGroupName(u8 *, u8, int);
u8 *sub_80EB218(u8 *, u16, u16);
u16 sub_80EB2D4(u16);
bool8 sub_80EB37C(u16);
bool8 sub_80EB868(u8);
static u16 sub_80EB960(void);
u8 sub_80EB9C8(void);
static u16 sub_80EB9D8(void);

EWRAM_DATA u8 gUnknown_020388AC = 0;

static u8 gUnknown_03000740;

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
    gSprites[spriteId].pos1.y = gEasyChatStruct->unk8A * 8 + 8;
    gSprites[spriteId].pos1.x = gEasyChatStruct->unk88 * 8 + 4;
    gSprites[spriteId].data[0] = 0;
    gSprites[spriteId].data[1] = 0;
    gEasyChatStruct->unk98 = &gSprites[spriteId];
}

void sub_80E82BC(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        if (gEasyChatStruct->unk87)
        {
            u16 r5 = gEasyChatStruct->unk86;
            u16 r4 = gEasyChatStruct->unk85;
            u16 r7 = 0;
            u16 i;

            for (i = 0; i < r4; i++)
                r7 += gEasyChatStruct->unk8C[r5][i];

            if (r5 == gEasyChatStruct->unk84)
            {
                sprite->pos1.y = 96;
                sprite->pos1.x = (r4 * 7  + 3) * 8 + 4;
            }
            else
            {
                sprite->pos1.y = (gEasyChatStruct->unk8A + r5 * 2) * 8 + 8;
                sprite->pos1.x = (gEasyChatStruct->unk88 + r7 + r4 * 11) * 8 + 4;
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
        gEasyChatStruct->unk98->data[1] = a;
        gEasyChatStruct->unk98->pos2.x = a;
        gEasyChatStruct->unk98->invisible = FALSE;
        break;
    case 1:
        gEasyChatStruct->unk98->data[1] = a;
        gEasyChatStruct->unk98->pos2.x = 0;
        gEasyChatStruct->unk98->invisible = FALSE;
        break;
    case 2:
        gEasyChatStruct->unk98->data[1] = 1;
        gEasyChatStruct->unk98->pos2.x = 0;
        gEasyChatStruct->unk98->invisible = TRUE;
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
    gEasyChatStruct->unk9C = &gSprites[spriteId];

    spriteTemplate_83DBCAC.anims = gSpriteAnimTable_83DBC8C;
    spriteTemplate_83DBCAC.callback = sub_80E872C;
    spriteId = CreateSprite(&spriteTemplate_83DBCAC, 0, 0, 4);
    gEasyChatStruct->unkA0 = &gSprites[spriteId];

    spriteTemplate_83DBCAC.anims = gSpriteAnimTable_83DBC9C;
    spriteTemplate_83DBCAC.callback = sub_80E8760;
    spriteId = CreateSprite(&spriteTemplate_83DBCAC, 0, 0, 5);
    gEasyChatStruct->unkA4 = &gSprites[spriteId];

    gEasyChatStruct->unk9C->data[0] = 0;
    gEasyChatStruct->unkA0->data[0] = 0;
    gEasyChatStruct->unkA4->data[0] = 0;

    gEasyChatStruct->unk9C->data[3] = 0x0101 + IndexOfSpritePaletteTag(1) * 16;
    sub_80E8534();
    gEasyChatStruct->unk96 = 1;
    REG_BLDCNT = 0x3F40;
}

void sub_80E8504(void)
{
    DestroySprite(gEasyChatStruct->unk9C);
    DestroySprite(gEasyChatStruct->unkA0);
    DestroySprite(gEasyChatStruct->unkA4);
}

void sub_80E8534(void)
{
    if (gEasyChatStruct->unk1B7 != 0)
        gUnknown_020388AC = 1;
    else if (gEasyChatStruct->unk26 == 0)
        gUnknown_020388AC = 0;
    else if (gEasyChatStruct->unk1A8 == 0 && gEasyChatStruct->unk1A9 == 6)
        gUnknown_020388AC = 2;
    else
        gUnknown_020388AC = 3;

    gEasyChatStruct->unk9C->data[2] = gUnknown_020388AC;
    gEasyChatStruct->unkA0->data[2] = gUnknown_020388AC;
    gEasyChatStruct->unkA4->data[2] = gUnknown_020388AC;

    StartSpriteAnim(gEasyChatStruct->unk9C, gUnknown_020388AC);
    StartSpriteAnim(gEasyChatStruct->unkA0, gUnknown_020388AC);
    StartSpriteAnim(gEasyChatStruct->unkA4, gUnknown_020388AC);

    gEasyChatStruct->unk9C->data[5] = 8;
    gEasyChatStruct->unk9C->data[6] = 8;
    gEasyChatStruct->unk9C->data[1] = 0;
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

    if (gEasyChatStruct->unk96 != 0)
    {
        sub_80E8534();

        gEasyChatStruct->unk9C->data[5] = 8;
        gEasyChatStruct->unk9C->data[6] = 8;
        gEasyChatStruct->unk9C->data[1] = 0;

        switch (sprite->data[2])
        {
        case 0:
            sprite->pos1.x = gEasyChatStruct->unk1A9 * 88 + 32;
            sprite->pos1.y = (gEasyChatStruct->unk1A8 - gEasyChatStruct->unk1B5) * 16 + 96;
            break;
        case 1:
#if ENGLISH
            sprite->pos1.x = 216;
#else
            sprite->pos1.x = 214;
#endif
            sprite->pos1.y = gEasyChatStruct->unk1A8 * 16 + 96;
            break;
        case 2:
            sprite->pos1.x = 151;
            sprite->pos1.y = 96;
            break;
        case 3:
            sprite->pos1.x = gUnknown_083DBCC4[gEasyChatStruct->unk1A8][gEasyChatStruct->unk1A9] * 8 + 31;
            sprite->pos1.y = (gEasyChatStruct->unk1A8 - gEasyChatStruct->unk1B5) * 16 + 96;
            break;
        }
    }
}


void sub_80E872C(struct Sprite *sprite)
{
    if (gEasyChatStruct->unk96 != 0 && sprite->data[2] == 0)
    {
        sprite->pos1.x = gEasyChatStruct->unk9C->pos1.x + 32;
        sprite->pos1.y = gEasyChatStruct->unk9C->pos1.y;
    }
}

void sub_80E8760(struct Sprite *sprite)
{
    if (gEasyChatStruct->unk96 != 0)
    {
        switch (sprite->data[2])
        {
        case 0:
            sprite->pos1.x = gEasyChatStruct->unk9C->pos1.x + 64;
            sprite->pos1.y = gEasyChatStruct->unk9C->pos1.y;
            break;
#if GERMAN
        case 1:
            sprite->pos1.x = gEasyChatStruct->unk9C->pos1.x + 28;
            sprite->pos1.y = gEasyChatStruct->unk9C->pos1.y;
            break;
#endif
        case 2:
            sprite->pos1.x = gEasyChatStruct->unk9C->pos1.x + 21;
            sprite->pos1.y = gEasyChatStruct->unk9C->pos1.y;
            break;
        }
    }
}

void sub_80E87A4(u8 a)
{
    gEasyChatStruct->unkA8->data[1] = (a == 0);
    gEasyChatStruct->unkA8->pos2.x = 0;
}

void sub_80E87CC(u8 a)
{
    gEasyChatStruct->unkA8->invisible = (a == 0);
    sub_80E87A4(a);
    if (a != 0)
        gEasyChatStruct->unk1B9 = 1;
}

void sub_80E8818(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83DBBFC, 0, 0, 0);

    gSprites[spriteId].data[0] = 0;
    gSprites[spriteId].data[1] = 0;
    gEasyChatStruct->unkA8 = &gSprites[spriteId];
    gEasyChatStruct->unkA8->callback = sub_80E8860;
    sub_80E87CC(0);
}

void sub_80E8860(struct Sprite *sprite)
{
    if (sprite->data[1] == 0)
    {
        if (gEasyChatStruct->unk1B9 != 0)
        {
            sprite->pos1.x = gEasyChatStruct->unk99A5 * 88 + 44;
            sprite->pos1.y = (gEasyChatStruct->unk99A4 - gEasyChatStruct->unk9A29) * 16 + 96;
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
        gEasyChatStruct->unkAC[i]->invisible = TRUE;
        gEasyChatStruct->unkAC[i]->data[1] = 0;
        gEasyChatStruct->unkB4[i]->invisible = TRUE;
        gEasyChatStruct->unkB4[i]->data[1] = 0;
    }
    gEasyChatStruct->unk9C70 = 0;
}

void sub_80E8958(u8 animNum)
{
    s16 r9;
    u16 i;

    if (animNum == 0)
    {
        r9 = 100;
        gEasyChatStruct->unk9C6C = &gEasyChatStruct->unk1B5;
        if (gEasyChatStruct->unk26 == 0)
            gEasyChatStruct->unk9C71 = gEasyChatStruct->unk1B6 - 4;
        else
            gEasyChatStruct->unk9C71 = 0;
    }
    else
    {
        r9 = 120;
        gEasyChatStruct->unk9C6C = &gEasyChatStruct->unk9A29;
        gEasyChatStruct->unk9C71 = gEasyChatStruct->unk9A28 - 4;
        for (i = 0; i < 2; i++)
        {
            gEasyChatStruct->unkB4[i]->invisible = FALSE;
            gEasyChatStruct->unkB4[i]->data[1] = 1;
        }
    }

    if (gEasyChatStruct->unk9C71 < 0)
        gEasyChatStruct->unk9C71 = 0;

    for (i = 0; i < 2; i++)
    {
        gEasyChatStruct->unkAC[i]->pos1.x = r9;
        gEasyChatStruct->unkAC[i]->invisible = FALSE;
        gEasyChatStruct->unkAC[i]->data[1] = 1;
        StartSpriteAnim(gEasyChatStruct->unkAC[i], animNum);
    }

    gEasyChatStruct->unk9C70 = 1;
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
        gEasyChatStruct->unkAC[i] = &gSprites[spriteId];
        gEasyChatStruct->unkAC[i]->data[0] = i;
        gEasyChatStruct->unkAC[i]->vFlip = i;
    }

    spriteTemplate_83DBD18.tileTag = 3;
    spriteTemplate_83DBD18.anims = gSpriteAnimTable_83DBD10;

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(&spriteTemplate_83DBD18, 142 + i * 40, 88, 0);
        gEasyChatStruct->unkB4[i] = &gSprites[spriteId];
        gEasyChatStruct->unkB4[i]->data[0] = i;
        gEasyChatStruct->unkB4[i]->oam.shape = 1;
        gEasyChatStruct->unkB4[i]->oam.size = 1;
        StartSpriteAnim(gEasyChatStruct->unkB4[i], i);
    }

    sub_80E8958(0);
    sub_80E88F0();
}

void sub_80E8B78(struct Sprite *sprite)
{
    bool8 invisible;

    if (gEasyChatStruct->unk9C70 != 0 && sprite->data[1] != 0)
    {
        if (sprite->data[0] == 0)
        {
            invisible = FALSE;
            if (*gEasyChatStruct->unk9C6C == 0)
                invisible = TRUE;
            sprite->invisible = invisible;
        }
        else
        {
            invisible = FALSE;
            if (*gEasyChatStruct->unk9C6C == gEasyChatStruct->unk9C71)
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
        gabbyTyGfxId = EVENT_OBJ_GFX_REPORTER_M;
        break;
    case 1:  // Ty
        gabbyTyGfxId = EVENT_OBJ_GFX_REPORTER_F;
        break;
    }

    LoadCompressedObjectPic(&gUnknown_083DBD30);
    LoadSpritePalette(&gUnknown_083DBD38);
    CreateSprite(&gSpriteTemplate_83DBD48, x, y, 1);

    spriteId = AddPseudoEventObject(
      (gSaveBlock2.playerGender == MALE) ? EVENT_OBJ_GFX_RIVAL_BRENDAN_NORMAL : EVENT_OBJ_GFX_RIVAL_MAY_NORMAL,
      SpriteCallbackDummy, x - 12, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.priority = 0;
        StartSpriteAnim(&gSprites[spriteId], 3);
    }

    spriteId = AddPseudoEventObject(gabbyTyGfxId, SpriteCallbackDummy, x + 12, y, 0);
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
        gEasyChatStruct->unk9C74 = &gSprites[spriteId];
    else
        gEasyChatStruct->unk9C74 = NULL;
}

void sub_80E8D54(void)
{
    if (gEasyChatStruct->unk9C74 != NULL)
    {
        if (gEasyChatStruct->unk26 == 0)
            StartSpriteAnim(gEasyChatStruct->unk9C74, 1);
        else
            StartSpriteAnim(gEasyChatStruct->unk9C74, 2);
    }
}

void sub_80E8D8C(u8 a)
{
    if (gEasyChatStruct->unk9C74 != NULL)
    {
        if (a != 0)
        {
            if (gEasyChatStruct->unk26 == 0)
                StartSpriteAnim(gEasyChatStruct->unk9C74, 3);
            else
                StartSpriteAnim(gEasyChatStruct->unk9C74, 4);
        }
        else
        {
            StartSpriteAnim(gEasyChatStruct->unk9C74, 5);
        }
    }
}

const u16 gUnknown_083DBDFC[] = INCBIN_U16("graphics/unknown/unknown_3DBDFC.gbapal");

const u16 gUnknown_083DBE1C[] =
{
    0x300, 0x300, 0x300, 0x300, 0x300, 0x300, 0x300, 0x300, 0x300,
    0x301, 0x301, 0x301, 0x301, 0x301, 0x300, 0x300, 0x300, 0x300,
};

const u16 gUnknown_083DBE40[] = INCBIN_U16("graphics/unknown/unknown_3DBE40.gbapal");

// unused tilemap?
const u16 gUnused_083DBE60[] =
{
    0x5036, 0x5037, 0x5038, 0x5039, 0x503A, 0x503B,
    0x5046, 0x5047, 0x5048, 0x5049, 0x504A, 0x504B,
    0x5056, 0x5057, 0x5058, 0x5059, 0x505A, 0x505B,
    0x5030, 0x5031, 0x5032, 0x5033, 0x5034, 0x5035,
    0x5040, 0x5041, 0x5042, 0x5043, 0x5044, 0x5045,
    0x5050, 0x5051, 0x5052, 0x5053, 0x5054, 0x5055,
};

const u8 gUnknown_083DBEA8[] = _("{CLEAR_TO 88}");

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

    CpuCopy16(gUnknown_08E945D0, gEasyChatStruct->unk1C8, 0x500);
    LZ77UnCompWram(gUnknown_08E953D0, gEasyChatStruct->unk6C8);
    LZ77UnCompVram(gMenuWordGroupFrame_Gfx, (void *)(VRAM + 0x8000));
    CpuCopy16(gEasyChatStruct->unk1C8, (void *)(VRAM + 0x6800), 0x500);
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

    gEasyChatStruct->unkBC = 0;
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
            gEasyChatStruct->unk9C34[i][r4] = RGB_(sp0[0] >> 8, sp0[1] >> 8, sp0[2] >> 8);
            for (r3 = 0; r3 < 3; r3++)
                sp0[r3] += sp18[r3];
        }
        gEasyChatStruct->unk9C34[i][r4] = RGB_(spC[0] >> 8, spC[1] >> 8, spC[2] >> 8);
    }
    gEasyChatStruct->unk9C32 = 0;
}

void sub_80E9108(s8 a)
{
    u16 i;

    gEasyChatStruct->unk9C32 += a;
    for (i = 0; i < 3; i++)
    {
        gPlttBufferUnfaded[81 + i] = gEasyChatStruct->unk9C34[i][gEasyChatStruct->unk9C32];
        gPlttBufferFaded[81 + i] = gEasyChatStruct->unk9C34[i][gEasyChatStruct->unk9C32];
    }
}

void sub_80E9178(void)
{
    gEasyChatStruct->unk9C32 = 0;
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
    BasicInitMenuWindow(&gWindowTemplate_81E6DA8);

    if (a == 10)
    {
        Menu_EraseWindowRect(3, 14, 26, 19);
        sub_80E9198(10);
        return;
    }

    if (sub_80E91A4() == 10)
        Menu_DrawStdWindowFrame(3, 14, 26, 19);

    sub_80E9198(a);
    switch (a)
    {
    case 0:
        sub_80E91B0(gEasyChatStruct->unk9C80, 4, 15, 2);
        sub_80E91B0(gEasyChatStruct->unk9CC9, 4, 17, 2);
        break;
    case 1:
        sub_80E91B0(gEasyChatStruct->unk9D12, 4, 15, 2);
        sub_80E91B0(gEasyChatStruct->unk9D5B, 4, 17, 2);
        break;
    case 2:
        sub_80E91B0(gOtherText_TextDeletedConfirmPage1, 4, 15, 2);
        sub_80E91B0(gOtherText_TextDeletedConfirmPage2, 4, 17, 2);
        break;
    case 3:
        switch (gEasyChatStruct->unk8)
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

    BasicInitMenuWindow(&gWindowTemplate_81E6D8C);
    gEasyChatStruct->unk9F8E[0] = EXT_CTRL_CODE_BEGIN;
    gEasyChatStruct->unk9F8E[1] = 5;
    gEasyChatStruct->unk9F8E[2] = 1;
    if (r4 != NULL)
    {
        AlignStringInMenuWindow(gEasyChatStruct->unk9F8E + 3, r4, 240, 2);
        Menu_PrintText(gEasyChatStruct->unk9F8E, 0, 0);
    }
    else
    {
        u8 *str = gEasyChatStruct->unk9F8E + 3;

        str[0] = EXT_CTRL_CODE_BEGIN;
        str[1] = 0x11;
        str[2] = 0x10;
        str[3] = EOS;

        Menu_PrintText(gEasyChatStruct->unk9F8E, 0, 0);
        Menu_PrintText(gEasyChatStruct->unk9F8E, 28, 0);
    }
    BasicInitMenuWindow(&gWindowTemplate_81E6DA8);
}

void sub_80E948C(void)
{
    switch (gEasyChatStruct->unk9)
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
    BasicInitMenuWindow(&gWindowTemplate_81E6D8C);
    switch (gEasyChatStruct->unk9)
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
    BasicInitMenuWindow(&gWindowTemplate_81E6DA8);
}

void sub_80E9620(u16 a, u16 b)
{
    u16 i;
    u16 j;
    u16 r10 = 0;
    u16 r7 = a;

    for (i = 0; i < gEasyChatStruct->unk84; i++)
    {
        u16 r6 = b;

        for (j = 0; j < gEasyChatStruct->unk83; j++)
        {
            if (r10 >= gEasyChatStruct->unkA)
            {
                Menu_PrintText(gUnknown_083DBEA8, r6, r7);
                break;
            }
            if (gEasyChatStruct->unkC[r10] == 0xFFFF)
            {
                sub_8095C8C((void *)(VRAM + 0x7000), r6, r7, gUnknown_083DBE1C, 0, 0, 9, 2, 9);
                r6 += 11;
            }
            else
            {
                sub_80EB218(gEasyChatStruct->unk9E14, gEasyChatStruct->unkC[r10], 11);
                Menu_PrintText(gEasyChatStruct->unk9E14, r6, r7);
                r6 += gEasyChatStruct->unk8C[i][j] + 11;
            }
            r10++;
        }
        r7 += 2;
    }
}

void sub_80E9744(void)
{
    BasicInitMenuWindow(&gWindowTemplate_81E6D8C);
    switch (gEasyChatStruct->unk9)
    {
    case 4:
        sub_80E97C0(4, 6);
        break;
    case 5:
        sub_80E97C0(2, 17);
        break;
    case 0:
        sub_80E97C0(3, 5);
        break;
    case 1:
        sub_80E97C0(0, 5);
        break;
    case 2:
        sub_80E97C0(4, 17);
        break;
    case 3:
        sub_80E97C0(3, 6);
        break;
    }
    BasicInitMenuWindow(&gWindowTemplate_81E6DA8);
}

void sub_80E97C0(u16 a, u16 b)
{
    u8 i;
    u8 r7 = 0;

    asm("":::"r9");

    for (i = 0; i < gEasyChatStruct->unk84; i++)
    {
        u8 r6;
        u8 *r2 = gEasyChatStruct->unk9E6E;
        u32 r1;

        for (r6 = 0; r6 < gEasyChatStruct->unk83; r6++)
        {
            if (r7 >= gEasyChatStruct->unkA)
                break;
            if (gEasyChatStruct->unkC[r7] != 0xFFFF)
            {
                r2 = sub_80EB218(r2, gEasyChatStruct->unkC[r7], 0);
                *r2++ = CHAR_SPACE;
            }
            r7++;
        }

        r1 = gEasyChatStruct->unk83 * 11;
        r2[0] = EXT_CTRL_CODE_BEGIN;
        r2[1] = 0x13;
        r2[2] = r1 * 8;
        r2[3] = EOS;

        Menu_PrintText(gEasyChatStruct->unk9E6E, b, a);

        a += 2;
    }
}

void sub_80E98C4(void)
{
    u8 r1;
    u8 r3;

    BasicInitMenuWindow(&gWindowTemplate_81E6D8C);
    switch (gEasyChatStruct->unk9)
    {
    case 4:
        r1 = 4;
        r3 = 2;
        break;
    case 5:
        r1 = 3;
        r3 = 2;
        break;
    case 0:
        r1 = 3;
        r3 = 2;
        break;
    case 1:
        r1 = 1;
        r3 = 3;
        break;
    case 2:
        r1 = 4;
        r3 = 1;
        break;
    case 3:
        r1 = 3;
        r3 = 1;
        break;
    default:
        return;
    }
    Menu_BlankWindowRect(2, r1, 27, r3 * 2 + r1 - 1);
    BasicInitMenuWindow(&gWindowTemplate_81E6DA8);
}

void sub_80E9940(u8 *a, u8 b)
{
    u8 r4 = (b & 7);

    Menu_BlankWindowRect(2, r4 * 2, 31, r4 * 2 + 1);
    sub_80E9A7C(a, b);
    sub_80E9A60(a, 2, r4 * 2);
}

#if ENGLISH

const u8 gUnknown_083DBEAC[][32] =
{
	_("{UNKNOWN_14 8} A B C  D E F  {UNKNOWN_14 0}others"),
	_("{UNKNOWN_14 8} G H I  J K L      "),
	_("{UNKNOWN_14 8} M N O  P Q R S    "),
	_("{UNKNOWN_14 8} T U V  W X Y Z    "),
};

#else

const u8 unk_83E7EB0[] = _("{UNKNOWN_14 8} A B C  D E F  {UNKNOWN_14 0}mehr");
const u8 unk_83E7ECA[] = _("{UNKNOWN_14 8} G H I  J K L      ");
const u8 unk_83E7EE1[] = _("{UNKNOWN_14 8} M N O  P Q R S    ");
const u8 unk_83E7EF8[] = _("{UNKNOWN_14 8} T U V  W X Y Z    ");
const u8 *const gUnknown_083DBEAC[] =
{
    unk_83E7EB0,
    unk_83E7ECA,
    unk_83E7EE1,
    unk_83E7EF8,
    unk_83E7EB0 + 21,  // pointer to "mehr". What is this for?
};

#endif

void sub_80E9974(void)
{
    BasicInitMenuWindow(&gWindowTemplate_81E6D54);
    if (gEasyChatStruct->unk26 == 0)
    {
        u16 i;

        for (i = gEasyChatStruct->unk1B5; i < gEasyChatStruct->unk1B5 + 4; i++)
            sub_80E9940(gEasyChatStruct->unk9DC9, i);
    }
    else
    {
        sub_80E9AD4();
        sub_80E9A60(gUnknown_083DBEAC[0], 2, 0);
        sub_80E9A60(gUnknown_083DBEAC[1], 2, 2);
        sub_80E9A60(gUnknown_083DBEAC[2], 2, 4);
        sub_80E9A60(gUnknown_083DBEAC[3], 2, 6);
    }
}

void sub_80E9A14(void)
{
    sub_80E9A4C();
    if (gEasyChatStruct->unk26 == 0)
        gEasyChatStruct->unk1BA += gEasyChatStruct->unk1B5 * 16;
}

void sub_80E9A4C(void)
{
    gEasyChatStruct->unk1BA = 0;
}

void sub_80E9A60(const u8 *a, u16 b, u16 c)
{
    c &= 0xF;
    Menu_PrintText(a, b, c);
}

void sub_80E9A7C(u8 *dest, u16 b)
{
    u16 i;
    u16 r5 = b * 2;

    for (i = 0; i < 2; i++)
    {
        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 0x12;
        dest[2] = 88 * i;
        dest += 3;

        dest = CopyEasyChatGroupName(dest, gEasyChatStruct->unk2A[b][i], 11);
        r5++;
        if (r5 >= gEasyChatStruct->unk28)
            break;
    }
}

void sub_80E9AD4(void)
{
    u16 i;

    BasicInitMenuWindow(&gWindowTemplate_81E6D54);
    for (i = 0; i < 16; i++)
        sub_80E9C74(i);
}

void sub_80E9AF8(u16 a)
{
    u8 *r8;
    u16 i;

    sub_80E9C74(a);

    r8 = gEasyChatStruct->unk9E14;
    r8[0] = EXT_CTRL_CODE_BEGIN;
    r8[1] = 0x11;
    r8[2] = 0x10;
    r8 += 3;

    if (gEasyChatStruct->unk7D != 0)
    {
        for (i = 0; i < gEasyChatStruct->unk99A6[a]; i++)
        {
            if (sub_80EB2D4(gEasyChatStruct->unk9A2A[a][i]) == 7)
                BasicInitMenuWindow(&gWindowTemplate_81E6D70);
            else
                BasicInitMenuWindow(&gWindowTemplate_81E6D54);
            sub_80EB218(r8, gEasyChatStruct->unk9A2A[a][i], 9);
            sub_80E9A60(gEasyChatStruct->unk9E14, i * 11 + 4, a * 2);
        }
    }
    else
    {
        BasicInitMenuWindow(&gWindowTemplate_81E6D54);
        for (i = 0; i < gEasyChatStruct->unk99A6[a]; i++)
        {
            sub_80EB218(r8, gEasyChatStruct->unk9A2A[a][i], 9);
            sub_80E9A60(gEasyChatStruct->unk9E14, i * 11 + 4, a * 2);
        }
    }
}

void sub_80E9C74(u16 a)
{
    a &= 7;
    Menu_BlankWindowRect(0, a * 2, 29, a * 2 + 1);
}

void sub_80E9C94(void)
{
    u16 r5 = min(gEasyChatStruct->unk9A28, 4);
    u16 i;

    for (i = 0; i < r5; i++)
        sub_80E9AF8(gEasyChatStruct->unk9A29 + i);
    while (i < 4)
        sub_80E9C74(i++);
}

void sub_80E9D00(void)
{
    u16 r4;
    u16 r5;

    if (gEasyChatStruct->unk1C0 > 0)
    {
        r4 = gEasyChatStruct->unk1C0;
        r5 = gEasyChatStruct->unk9A29 + 4;
    }
    else
    {
        r4 = -gEasyChatStruct->unk1C0;
        r5 = gEasyChatStruct->unk9A29 - r4;
    }
    while (--r4 != 0xFFFF)
        sub_80E9AF8(r5++);
}

void sub_80E9D7C(void)
{
    u16 r6;
    u16 r4;
    u16 i;

    BasicInitMenuWindow(&gWindowTemplate_81E6D54);
    if (gEasyChatStruct->unk1C0 < 0)
    {
        r6 = -gEasyChatStruct->unk1C0;
        r4 = gEasyChatStruct->unk1B5 - r6;
    }
    else
    {
        r6 = gEasyChatStruct->unk1C0;
        r4 = gEasyChatStruct->unk1B5 + 4;
    }
    for (i = 0; i < r6; i++)
    {
        sub_80E9940(gEasyChatStruct->unk9DC9, r4);
        r4++;
    }
}

void sub_80E9E08(u8 a)
{
    gEasyChatStruct->unk1BC = (gEasyChatStruct->unk1BA + gEasyChatStruct->unk1C0 * 16) & 0x7F;
    gEasyChatStruct->unk1BF = (gEasyChatStruct->unk1C0 < 0) ? -a : a;
}

bool8 sub_80E9E54(void)
{
    gEasyChatStruct->unk1BA = (gEasyChatStruct->unk1BA + gEasyChatStruct->unk1BF) & 0x7F;
    return (gEasyChatStruct->unk1BA == gEasyChatStruct->unk1BC);
}

void nullsub_23(void)
{
}

void sub_80E9E98(void)
{
    gEasyChatStruct->unkBE = 0;
}

bool8 sub_80E9EA8(void)
{
    switch (gEasyChatStruct->unkBE)
    {
    case 0:
        sub_80EA24C();
        gEasyChatStruct->unkBE++;
        // fall through
    case 1:
        if (sub_80EA1E0() != 0)
        {
            sub_80EA4A4();
            gEasyChatStruct->unkBE++;
        }
        break;
    case 2:
        if (sub_80EA1E0() != 0)
        {
            sub_80EA704();
            gEasyChatStruct->unkBE++;
        }
        break;
    case 3:
        if (sub_80EA1E0() != 0)
            gEasyChatStruct->unkBE++;
        break;
    case 4:
        gEasyChatStruct->unkBE++;
        break;
    case 5:
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80E9F50(void)
{
    switch (gEasyChatStruct->unkBE)
    {
    case 0:
        nullsub_23();
        sub_80EA764();
        gEasyChatStruct->unkBE++;
        // fall through
    case 1:
        if (sub_80EA1E0() != 0)
            gEasyChatStruct->unkBE++;
        break;
    case 2:
        sub_80EA5A0();
        gEasyChatStruct->unkBE++;
        // fall through
    case 3:
        if (sub_80EA1E0() != 0)
            gEasyChatStruct->unkBE++;
        break;
    case 4:
        sub_80EA348();
        gEasyChatStruct->unkBE++;
        // fall through
    case 5:
        if (sub_80EA1E0() != 0)
            gEasyChatStruct->unkBE++;
        break;
    case 6:
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80E9FD4(void)
{
    switch (gEasyChatStruct->unkBE)
    {
    case 0:
        nullsub_23();
        sub_80EA5A0();
        gEasyChatStruct->unkBE++;
        // fall through
    case 1:
        if (sub_80EA1E0() != 0)
            return TRUE;
        break;
    }
    return FALSE;
}

bool8 sub_80EA014(void)
{
    switch (gEasyChatStruct->unkBE)
    {
    case 0:
        sub_80EA4A4();
        gEasyChatStruct->unkBE++;
        // fall through
    case 1:
        if (sub_80EA1E0() != 0)
            return TRUE;
        break;
    }
    return FALSE;
}

bool8 sub_80EA050(void)
{
    switch (gEasyChatStruct->unkBE)
    {
    case 0:
        nullsub_23();
        sub_80EA764();
        gEasyChatStruct->unkBE++;
        break;
    case 1:
        if (sub_80EA1E0() != 0)
        {
            sub_80EA7F4();
            gEasyChatStruct->unkBE++;
        }
        break;
    case 2:
        sub_80E9108(1);
        if (sub_80EA1E0() != 0)
        {
            sub_80EA8BC();
            gEasyChatStruct->unkBE++;
        }
        break;
    case 3:
        sub_80E9108(1);
        if (sub_80EA1E0() != 0)
            gEasyChatStruct->unkBE++;
        break;
    case 4:
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80EA0E4(void)
{
    switch (gEasyChatStruct->unkBE)
    {
    case 0:
        sub_80EA948();
        gEasyChatStruct->unkBE++;
        // fall through
    case 1:
        sub_80E9108(-1);
        if (sub_80EA1E0() != 0)
        {
            sub_80EAA44();
            gEasyChatStruct->unkBE++;
        }
        break;
    case 2:
        sub_80E9108(-1);
        if (sub_80EA1E0() != 0)
        {
            sub_80EA704();
            gEasyChatStruct->unkBE++;
        }
        break;
    case 3:
        if (sub_80EA1E0() != 0)
            gEasyChatStruct->unkBE++;
        break;
    case 4:
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80EA184(void)
{
    switch (gEasyChatStruct->unkBE)
    {
    case 0:
        sub_80EAAD4();
        gEasyChatStruct->unkBE++;
        // fall through
    case 1:
        if (sub_80EA1E0() != 0)
            gEasyChatStruct->unkBE++;
        break;
    case 2:
        sub_80E9178();
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80EA1E0(void)
{
    u16 i;

    if (gEasyChatStruct->unkC4 != 0)
    {
        for (i = 0; i < gEasyChatStruct->unkC2; i++)
        {
            sub_80EAC0C(gEasyChatStruct->unkC8[i]);
            sub_80EAC48(&gEasyChatStruct->unk148[i]);
        }
        gEasyChatStruct->unkBC = 1;
        gEasyChatStruct->unkC4--;
        return FALSE;
    }
    return TRUE;
}

void sub_80EA24C(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 13, 14, 13, 15, -2, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 0, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 12, 14, 12, 15, 0, 0, 2, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 30, 0, -2, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[2], 13, 15, 13, 16, -2, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[2], 0, 9, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[3], 12, 15, 12, 16, 0, 0, 2, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[3], 30, 9, -2, 0, gEasyChatStruct->unk6C8);

    gEasyChatStruct->unkC2 = 4;
    gEasyChatStruct->unkC4 = 6;
}

void sub_80EA348(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 1, 14, 13, 15, 2, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 0, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 12, 14, 24, 15, 0, 0, -2, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 18, 0, 2, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[2], 1, 15, 13, 16, 2, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[2], 0, 9, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[3], 12, 15, 24, 16, 0, 0, -2, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[3], 18, 9, 2, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[4], 1, 14, 1, 16, 0, 0, 2, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[4], 1, 14, 0, 0, gEasyChatStruct->unk1C8);

    sub_80EABD4(gEasyChatStruct->unkC8[5], 24, 14, 24, 16, -2, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[5], 24, 14, -2, 0, gEasyChatStruct->unk1C8);

    gEasyChatStruct->unkC2 = 6;
    gEasyChatStruct->unkC4 = 6;
}

void sub_80EA4A4(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 1, 14, 13, 15, 0, -1, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 0, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 12, 14, 24, 15, 0, -1, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 18, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[2], 1, 15, 13, 16, 0, 0, 0, 1);
    sub_80EAC30(&gEasyChatStruct->unk148[2], 0, 9, 0, -1, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[3], 12, 15, 24, 16, 0, 0, 0, 1);
    sub_80EAC30(&gEasyChatStruct->unk148[3], 18, 9, 0, -1, gEasyChatStruct->unk6C8);

    gEasyChatStruct->unkC2 = 4;
    gEasyChatStruct->unkC4 = 4;
}

void sub_80EA5A0(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 1, 10, 13, 15, 0, 1, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 0, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 12, 10, 24, 15, 0, 1, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 18, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[2], 1, 15, 13, 20, 0, 0, 0, -1);
    sub_80EAC30(&gEasyChatStruct->unk148[2], 0, 5, 0, 1, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[3], 12, 15, 24, 20, 0, 0, 0, -1);
    sub_80EAC30(&gEasyChatStruct->unk148[3], 18, 5, 0, 1, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[4], 1, 10, 24, 10, 0, 0, 0, 1);
    sub_80EAC30(&gEasyChatStruct->unk148[4], 1, 10, 0, 0, gEasyChatStruct->unk1C8);

    sub_80EABD4(gEasyChatStruct->unkC8[5], 1, 20, 24, 20, 0, -1, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[5], 1, 20, 0, -1, gEasyChatStruct->unk1C8);

    gEasyChatStruct->unkC2 = 6;
    gEasyChatStruct->unkC4 = 4;
}

void sub_80EA704(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 24, 12, 25, 20, 0, 0, 1, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 5, 10, -1, 0, gEasyChatStruct->unk6C8);

    gEasyChatStruct->unkC2 = 1;
    gEasyChatStruct->unkC4 = 5;
}

void sub_80EA764(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 24, 12, 30, 20, 0, 0, -1, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 0, 10, 1, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 30, 12, 31, 20, -1, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 30, 12, -1, 0, gEasyChatStruct->unk1C8);

    gEasyChatStruct->unkC2 = 2;
    gEasyChatStruct->unkC4 = 6;
}

void sub_80EA7F4(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 20, 10, 25, 20, 0, 0, 1, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 25, 0, -1, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 0, 10, 1, 20, 0, 0, 1, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 0, 10, 0, 0, gEasyChatStruct->unk1C8);

    sub_80EABD4(gEasyChatStruct->unkC8[2], 1, 10, 4, 20, 1, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[2], 0, 0, 0, 0, gEasyChatStruct->unk6C8);

    gEasyChatStruct->unkC2 = 3;
    gEasyChatStruct->unkC4 = 2;
}

void sub_80EA8BC(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 3, 10, 4, 20, 0, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 0, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 0, 10, 2, 20, 0, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 0, 10, 0, 0, gEasyChatStruct->unk1C8);

    gEasyChatStruct->unkC2 = 2;
    gEasyChatStruct->unkC4 = 1;
}

void sub_80EA948(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 0, 10, 2, 20, 0, 0, -1, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 0, 10, 0, 0, gEasyChatStruct->unk1C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 3, 10, 5, 20, -1, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 0, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[2], 26, 10, 30, 20, -1, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[2], 26, 10, -1, 0, gEasyChatStruct->unk1C8);

    sub_80EABD4(gEasyChatStruct->unkC8[3], 25, 10, 26, 20, -1, 0, -1, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[3], 29, 0, 0, 0, gEasyChatStruct->unk6C8);

    gEasyChatStruct->unkC2 = 4;
    gEasyChatStruct->unkC4 = 2;
}

void sub_80EAA44(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 24, 10, 30, 20, 0, 0, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 24, 10, 0, 0, gEasyChatStruct->unk1C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 23, 10, 24, 20, 0, 0, -1, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 29, 0, 0, 0, gEasyChatStruct->unk6C8);

    gEasyChatStruct->unkC2 = 2;
    gEasyChatStruct->unkC4 = 1;
}

void sub_80EAAD4(void)
{
    sub_80EABD4(gEasyChatStruct->unkC8[0], 0, 10, 30, 15, 0, 1, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[0], 0, 0, 0, 0, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[1], 0, 15, 30, 20, 0, 0, 0, -1);
    sub_80EAC30(&gEasyChatStruct->unk148[1], 0, 5, 0, 1, gEasyChatStruct->unk6C8);

    sub_80EABD4(gEasyChatStruct->unkC8[2], 0, 10, 30, 10, 0, 0, 0, 1);
    sub_80EAC30(&gEasyChatStruct->unk148[2], 0, 10, 0, 0, gEasyChatStruct->unk1C8);

    sub_80EABD4(gEasyChatStruct->unkC8[3], 0, 20, 30, 20, 0, -1, 0, 0);
    sub_80EAC30(&gEasyChatStruct->unk148[3], 0, 20, 0, -1, gEasyChatStruct->unk1C8);

    gEasyChatStruct->unkC2 = 4;
    gEasyChatStruct->unkC4 = 5;
}

void sub_80EABD4(u16 *a, u16 b, u16 c, u16 d, u16 e, u16 f, u16 g, u16 h, u16 i)
{
    a[0] = b;
    a[1] = d;
    a[2] = c;
    a[3] = e;
    a[4] = f;
    a[5] = h;
    a[6] = g;
    a[7] = i;
}

void sub_80EAC0C(u16 *a)
{
    a[0] += a[4];
    a[1] += a[5];
    a[2] += a[6];
    a[3] += a[7];
}

void sub_80EAC30(struct UnknownEasyChatStruct1 *a, u16 b, u16 c, u16 d, u16 e, void *f)
{
    a->unk0 = b;
    a->unk2 = c;
    a->unk4 = d;
    a->unk6 = e;
    a->unk8 = f;
}

void sub_80EAC48(struct UnknownEasyChatStruct1 *a)
{
    a->unk0 += a->unk4;
    a->unk2 += a->unk6;
}

void sub_80EAC5C(void)
{
    u16 i;

    if (gEasyChatStruct->unkBC != 0)
    {
        for (i = 0; i < gEasyChatStruct->unkC2; i++)
            sub_80EACBC((void *)(VRAM + 0x6800), gEasyChatStruct->unkC8[i], &gEasyChatStruct->unk148[i]);
        gEasyChatStruct->unkBC = 0;
    }
}

void sub_80EACBC(void *a, u16 *b, struct UnknownEasyChatStruct1 *c)
{
    s16 r6 = b[1] - b[0];
    s16 r5 = b[3] - b[2];

    if (r6 > 0 && r5 > 0)
        sub_809D104(a, b[0], b[2], c->unk8, c->unk0, c->unk2, r6, r5);
}

// Strange...
void sub_80EAD08(void)
{
    u16 *r4;
    u16 r2;
    u16 i;

    r4 = gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer];
    r4 += 88;
    r2 = (gEasyChatStruct->unk1BA - 88) & 0xFF;

    for (i = 0; i < 64; i++)
    {
        if (gEasyChatStruct->unk1BA + i == 128)
            r2 = (-i - 88) & 0xFF;
        *r4++ = r2;
    }
}

u8 *CopyEasyChatGroupName(u8 *dest, u8 group, int unused)
{
    return StringCopy(dest, gEasyChatGroupNames[group]);
}

bool8 sub_80EAD7C(u8 group)
{
    switch (group)
    {
    case EC_GROUP_TRENDY_SAYING:
        return FlagGet(FLAG_SYS_HIPSTER_MEET);
    case EC_GROUP_EVENTS:
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        return FlagGet(FLAG_SYS_GAME_CLEAR);
    case EC_GROUP_POKEMON_2:
        return sub_80EB9C8();
    default:
        return TRUE;
    }
}

bool8 sub_80EADC0(u8 group, u16 word)
{
    switch (group)
    {
    case EC_GROUP_TRENDY_SAYING:
        if (gEasyChatStruct->unk40[2][11 + group] == 0)
            return FALSE;
        return sub_80EB868(word);
    case EC_GROUP_POKEMON_1:
        return GetSetPokedexFlag(SpeciesToNationalPokedexNum(word), 0);
    case EC_GROUP_EVENTS:
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        if (gEasyChatStruct->unk40[2][11 + group] == 0)
            return FALSE;
        return TRUE;
    case EC_GROUP_POKEMON_2:
        return sub_80EB9C8();
    default:
        return TRUE;
    }
}

u16 sub_80EAE88(u8 group)
{
    switch (group)
    {
    case EC_GROUP_POKEMON_1:
        return GetHoennPokedexCount(0);
    case EC_GROUP_TRENDY_SAYING:
        return sub_80EB8C0();
    default:
        if (sub_80EAD7C(group))
            return gEasyChatGroupSizes[group];
        return FALSE;
    }
}

#if GERMAN
NAKED
void sub_80EAECC(void)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x10\n\
	movs r7, 0\n\
	ldr r1, _080EAF08 @ =gEasyChatStruct\n\
	ldr r0, [r1]\n\
	ldr r3, _080EAF0C @ =0x0000446c\n\
	adds r3, r0, r3\n\
	str r3, [sp, 0x4]\n\
_080EAEE4:\n\
	ldr r1, _080EAF10 @ =gEasyChatWordsByLetter\n\
	lsls r2, r7, 1\n\
	adds r0, r2, r1\n\
	ldrh r4, [r0]\n\
	adds r3, r7, 0x1\n\
	lsls r0, r3, 1\n\
	adds r0, r1\n\
	ldrh r0, [r0]\n\
	str r0, [sp]\n\
	ldr r0, [sp, 0x4]\n\
	adds r1, r0, r2\n\
	movs r0, 0\n\
	strh r0, [r1]\n\
	mov r9, r0\n\
	adds r6, r4, 0\n\
	mov r10, r2\n\
	str r3, [sp, 0x8]\n\
	b _080EB00C\n\
	.align 2, 0\n\
_080EAF08: .4byte gEasyChatStruct\n\
_080EAF0C: .4byte 0x0000446c\n\
_080EAF10: .4byte gEasyChatWordsByLetter\n\
_080EAF14:\n\
	ldr r2, _080EAFAC @ =gEasyChatWordsAlphabetized\n\
	adds r0, r6, 0\n\
	adds r1, r0, 0x1\n\
	lsls r1, 16\n\
	lsrs r6, r1, 16\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	ldrh r1, [r0]\n\
	adds r4, r1, 0\n\
	ldr r0, _080EAFB0 @ =0x0000feff\n\
	cmp r1, r0\n\
	bls _080EAFC8\n\
	movs r0, 0xFF\n\
	ands r1, r0\n\
	movs r3, 0\n\
	subs r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	ldr r0, _080EAFB4 @ =0x0000ffff\n\
	cmp r5, r0\n\
	beq _080EB00C\n\
	lsls r0, r7, 4\n\
	adds r0, r7\n\
	lsls r0, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	mov r8, r0\n\
_080EAF4A:\n\
	adds r1, r6, 0\n\
	adds r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r6, r0, 16\n\
	lsls r1, 1\n\
	ldr r0, _080EAFAC @ =gEasyChatWordsAlphabetized\n\
	adds r1, r0\n\
	ldrh r4, [r1]\n\
	lsrs r0, r4, 9\n\
	ldr r1, _080EAFB8 @ =0x000001ff\n\
	adds r2, r1, 0\n\
	adds r1, r4, 0\n\
	ands r1, r2\n\
	str r3, [sp, 0xC]\n\
	bl sub_80EADC0\n\
	lsls r0, 24\n\
	ldr r3, [sp, 0xC]\n\
	cmp r0, 0\n\
	beq _080EAF9E\n\
	cmp r3, 0\n\
	bne _080EAF9E\n\
	ldr r3, _080EAFBC @ =gEasyChatStruct\n\
	ldr r2, [r3]\n\
	mov r1, r9\n\
	adds r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	mov r9, r0\n\
	lsls r1, 1\n\
	add r1, r8\n\
	ldr r3, _080EAFC0 @ =0x00000b78\n\
	adds r0, r2, r3\n\
	adds r0, r1\n\
	strh r4, [r0]\n\
	ldr r0, _080EAFC4 @ =0x0000446c\n\
	adds r2, r0\n\
	add r2, r10\n\
	ldrh r0, [r2]\n\
	adds r0, 0x1\n\
	strh r0, [r2]\n\
	movs r3, 0x1\n\
_080EAF9E:\n\
	subs r0, r5, 0x1\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	ldr r1, _080EAFB4 @ =0x0000ffff\n\
	cmp r5, r1\n\
	bne _080EAF4A\n\
	b _080EB00C\n\
	.align 2, 0\n\
_080EAFAC: .4byte gEasyChatWordsAlphabetized\n\
_080EAFB0: .4byte 0x0000feff\n\
_080EAFB4: .4byte 0x0000ffff\n\
_080EAFB8: .4byte 0x000001ff\n\
_080EAFBC: .4byte gEasyChatStruct\n\
_080EAFC0: .4byte 0x00000b78\n\
_080EAFC4: .4byte 0x0000446c\n\
_080EAFC8:\n\
	lsrs r0, r4, 9\n\
	ldr r3, _080EB030 @ =0x000001ff\n\
	adds r2, r3, 0\n\
	adds r1, r4, 0\n\
	ands r1, r2\n\
	bl sub_80EADC0\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080EB00C\n\
	ldr r0, _080EB034 @ =gEasyChatStruct\n\
	ldr r2, [r0]\n\
	mov r1, r9\n\
	adds r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	mov r9, r0\n\
	lsls r1, 1\n\
	lsls r0, r7, 4\n\
	adds r0, r7\n\
	lsls r0, 3\n\
	subs r0, r7\n\
	lsls r0, 2\n\
	adds r1, r0\n\
	ldr r3, _080EB038 @ =0x00000b78\n\
	adds r0, r2, r3\n\
	adds r0, r1\n\
	strh r4, [r0]\n\
	ldr r0, _080EB03C @ =0x0000446c\n\
	adds r2, r0\n\
	add r2, r10\n\
	ldrh r0, [r2]\n\
	adds r0, 0x1\n\
	strh r0, [r2]\n\
_080EB00C:\n\
	ldr r1, [sp]\n\
	cmp r6, r1\n\
	bcs _080EB014\n\
	b _080EAF14\n\
_080EB014:\n\
	ldr r3, [sp, 0x8]\n\
	lsls r0, r3, 16\n\
	lsrs r7, r0, 16\n\
	cmp r7, 0x1A\n\
	bhi _080EB020\n\
	b _080EAEE4\n\
_080EB020:\n\
	add sp, 0x10\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080EB030: .4byte 0x000001ff\n\
_080EB034: .4byte gEasyChatStruct\n\
_080EB038: .4byte 0x00000b78\n\
_080EB03C: .4byte 0x0000446c\n\
    .syntax divided\n");
}
#else
void sub_80EAECC(void)
{
    u16 i;
    u16 r9;
    u16 r6;
    u16 r5;
    bool8 r7;

    for (i = 0; i < 27; i++)
    {
        u16 word = gEasyChatWordsByLetter[i];
        u16 sp0 = gEasyChatWordsByLetter[i + 1];

        gEasyChatStruct->unk4142[i] = 0;
        r9 = 0;
        r6 = word;
        while (r6 < sp0)
        {
            u16 word = gEasyChatWordsAlphabetized[r6++];

            if (word > 0xFEFF)
            {
                r5 = word & 0xFF;
                r7 = FALSE;
                while (--r5 != 0xFFFF)
                {
                    word = gEasyChatWordsAlphabetized[r6++];
                    if (sub_80EADC0(EC_GROUP(word), EC_INDEX(word)) && !r7)
                    {
                        gEasyChatStruct->unkB78[i][r9++] = word;
                        gEasyChatStruct->unk4142[i]++;
                        r7 = TRUE;
                    }
                }
            }
            else
            {
                if (sub_80EADC0(EC_GROUP(word), EC_INDEX(word)))
                {
                    gEasyChatStruct->unkB78[i][r9++] = word;
                    gEasyChatStruct->unk4142[i]++;
                }
            }
        }
    }
}
#endif

// loads strings of all easy chat words except for the species and move names.
void LoadEasyChatStrings(void)
{
    u16 group;
    u16 index;

    for (group = 0; group <= EC_GROUP_POKEMON_2; group++)
    {
        if (group != EC_GROUP_POKEMON_1
         && group != EC_GROUP_POKEMON_2
         && group != EC_GROUP_MOVE_1
         && group != EC_GROUP_MOVE_2)
        {
            const u8 *wordText = gEasyChatGroupWords[group];

            index = 0;
            while (*wordText != EOS)
            {
                gEasyChatStruct->ecWordStrings[group][index] = wordText;

                // Find the end of the current word
                while (*wordText != EOS)
                    wordText++;
                // Skip over the EOS
                wordText++;

                index++;
            }
        }
    }
}

void sub_80EB0B0(void)
{
    const u16 *sp0;
    u16 r7;
    u16 r9;
    u16 r8;

    if (gEasyChatStruct->unk26 == 0)
    {
        u16 group = gEasyChatStruct->unk1B8;

        gEasyChatStruct->unk4178[group] = 0;
        r7 = 0;
        r9 = 0;
        sp0 = gEasyChatGroupOrders[group];
        for (r8 = 0; r8 < gEasyChatGroupSizes[gEasyChatStruct->unk1B8]; r8++)
        {
            if (sub_80EADC0(group, sp0[r8]))
            {
                gEasyChatStruct->unk9A2A[r9][r7] = ((group & 0x7F) << 9) | (sp0[r8] & 0x1FF);
                gEasyChatStruct->unk4178[group]++;
                r7++;
                if (r7 > 1)
                {
                    r7 = 0;
                    r9++;
                }
            }
        }
    }
    else
    {
        u8 r2 = gEasyChatStruct->unk1B8;
        u16 r3 = 0;
        u16 r6 = 0;
        u16 r5;

        for (r5 = 0; r5 < gEasyChatStruct->unk4142[r2]; r5++)
        {
            gEasyChatStruct->unk9A2A[r6][r3] = gEasyChatStruct->unkB78[r2][r5];
            r3++;
            if (r3 > 1)
            {
                r3 = 0;
                r6++;
            }
        }
    }
}

u8 *sub_80EB218(u8 *dest, u16 word, u16 c)
{
    u8 *wordText;

    if (sub_80EB37C(word))
    {
        wordText = StringCopy(dest, gOtherText_ThreeQuestions);
    }
    else if (word == 0xFFFF)
    {
        wordText = dest;
        wordText[0] = EOS;  // Why? It's going to get overwritten.
    }
    else
    {
        u16 group = EC_GROUP(word);
        u16 index = EC_INDEX(word);

        switch (group)
        {
        case EC_GROUP_POKEMON_1:
        case EC_GROUP_POKEMON_2:
            wordText = StringCopy(dest, gSpeciesNames[index]);
            break;
        case EC_GROUP_MOVE_1:
        case EC_GROUP_MOVE_2:
            wordText = StringCopy(dest, gMoveNames[index]);
            break;
        default:
            wordText = StringCopy(dest, gEasyChatStruct->ecWordStrings[group][index]);
            break;
        }
    }

    wordText[0] = EXT_CTRL_CODE_BEGIN;
    wordText[1] = 0x13;
    wordText[2] = c * 8;
    wordText += 3;

    *wordText = EOS;

    return wordText;
}

u16 sub_80EB2D4(u16 word)
{
    const u8 *wordText;
    u16 length;

    if (sub_80EB37C(word))
    {
        return StringLength(gOtherText_ThreeQuestions);
    }
    else if (word == 0xFFFF)
    {
        return 0;
    }
    else
    {
        u16 group = EC_GROUP(word);
        u16 index = EC_INDEX(word);

        switch (group)
        {
        case EC_GROUP_POKEMON_1:
        case EC_GROUP_POKEMON_2:
            wordText = gSpeciesNames[index];
            break;
        case EC_GROUP_MOVE_1:
        case EC_GROUP_MOVE_2:
            wordText = gMoveNames[index];
            break;
        default:
            wordText = gEasyChatStruct->ecWordStrings[group][index];
            break;
        }
    }

    length = 0;
    while (*wordText != EOS)
    {
        wordText++;
        length++;
    }
    return length;
}

bool8 sub_80EB37C(u16 word)
{
    const u16 *r4;
    u16 i;

    if (word == 0xFFFF)
    {
        return FALSE;
    }
    else
    {
        u16 group = EC_GROUP(word);
        u16 index = EC_INDEX(word);

        if (group <= EC_GROUP_POKEMON_2)
        {
            switch (group)
            {
            case EC_GROUP_POKEMON_1:
            case EC_GROUP_POKEMON_2:
            case EC_GROUP_MOVE_1:
            case EC_GROUP_MOVE_2:
                r4 = (u16 *)gEasyChatGroupWords[group];
                for (i = 0; i < gEasyChatGroupSizes[group]; i++)
                {
                    if (index == r4[i])
                        return FALSE;
                }
                break;
            default:
                if (index < gEasyChatGroupSizes[group])
                    return FALSE;
                break;
            }
        }
        return TRUE;
    }
}

#if GERMAN
u32 de_sub_80EB748(s32 group, s32 index)
{
    s32 i;
    u16 *words;
    u32 r7 = 0;

    switch (group)
    {
    case EC_GROUP_POKEMON_1:
    case EC_GROUP_POKEMON_2:
    case EC_GROUP_MOVE_1:
    case EC_GROUP_MOVE_2:
        words = (u16 *)gEasyChatGroupWords[group];
        for (i = 0; i < gEasyChatGroupSizes[group]; i++)
        {
            if (index == words[i])
            {
                r7 = i;
                break;
            }
        }
        break;
    default:
        r7 = index;
        break;
    }

    return r7;
}
#endif

// returns the end of the destination buffer text
u8 *EasyChat_GetWordText(u8 *dst, u16 word)
{
    u16 group;
    u16 wordIndex;
    const u8 *src;
    u16 i;

    if (sub_80EB37C(word))
        return StringCopy(dst, gOtherText_ThreeQuestions);

    if (word == 0xFFFF)
    {
        *dst = EOS;
        return dst;
    }
    else
    {
        group = EC_GROUP(word);
        wordIndex = EC_INDEX(word);
        switch (group)
        {
        case EC_GROUP_POKEMON_1: // 0
        case EC_GROUP_POKEMON_2: // 21
            dst = StringCopy(dst, gSpeciesNames[wordIndex]);
            break;
        case EC_GROUP_MOVE_1: // 18
        case EC_GROUP_MOVE_2: // 19
            dst = StringCopy(dst, gMoveNames[wordIndex]);
            break;
        default:
            src = gEasyChatGroupWords[group];
            for (i = wordIndex - 1; i != 0xFFFF; i--)
            {
                while (*src++ != EOS)
                    ;
            }
            dst = StringCopy(dst, src);
            break;
        }
        *dst = EOS;
        return dst;
    }
}

u8 *ConvertEasyChatWordsToString(u8 *dst, u16 *words, u16 arg2, u16 arg3)
{
    u16 i;
    u16 n;

    const u16 i1 = arg2 - 1;

    for (i = 0; i < arg3; i++)
    {
        u16 word;

        for (n = 0; n < i1; n++)
        {
            dst = EasyChat_GetWordText(dst, words[0]);

            if (words[0] != 0xFFFF)
            {
                dst[0] = CHAR_SPACE;
                dst++;
            }

            words++;
        }

        word = words[0];
        words++;
        dst = EasyChat_GetWordText(dst, word);

        dst[0] = CHAR_NEWLINE;
        dst++;
    }

    dst--;
    dst[0] = EOS;

    return dst;
}

u8 *sub_80EB544(u8 *dst, u16 *words, u16 arg2, u16 arg3)
{
    u16 i;
    u16 n;

    const u16 i1 = arg2 - 1;

    for (i = 0; i < arg3; i++)
    {
        u16 word;

        for (n = 0; n < i1; n++)
        {
            dst = EasyChat_GetWordText(dst, words[0]);

            if (words[0] != 0xFFFF)
            {
                dst[0] = CHAR_SPACE;
                dst++;
            }

            words++;
        }

        word = words[0];
        words++;
        dst = EasyChat_GetWordText(dst, word);

        // Only difference with ConvertEasyChatWordsToString
        dst[0] = (i == 0) ? CHAR_NEWLINE : CHAR_PROMPT_SCROLL;
        dst++;
    }

    dst--;
    dst[0] = EOS;

    return dst;
}


u16 unref_sub_80EB5E0(u16 arg0)
{
    const u8 *chars;
    u16 i;
    u16 length;
    int group, word;


    if (arg0 == 0xFFFF)
        return 0;

    group = EC_GROUP(arg0);
    word = EC_INDEX(arg0);
    switch (group)
    {
    case EC_GROUP_POKEMON_1: // 0
    case EC_GROUP_POKEMON_2: // 21
        chars = gSpeciesNames[word];
        break;
    case EC_GROUP_MOVE_1: // 18
    case EC_GROUP_MOVE_2: // 19
        chars = gMoveNames[word];
        break;
    default:
        chars = gEasyChatGroupWords[group];
        for (i = word - 1; i != 0xFFFF; i--)
        {
            while (*chars++ != EOS)
                ;
        }
        break;
    }

    length = 0;
    while (*chars != EOS)
    {
        chars++;
        length++;
    }

    return length;
}

bool8 sub_80EB680(u16 *arg0, u16 arg1, u16 arg2, u16 arg3)
{
    return FALSE;
}

void unref_sub_80EB684(u8 arg0, u16 arg1)
{
    u16 *ptr;
    u16 c;

    // FIXME: find actual tv shows used
    switch (arg0)
    {
    case 5:
        c = 6;
        ptr = (u16*)((void *)&gSaveBlock1.tvShows[arg1] + 0x04);
        break;
    case 7:
        c = 2;
        ptr = (u16*)((void *)&gSaveBlock1.tvShows[arg1] + 0x1C);
        break;
    case 8:
        c = 1;
        ptr = (u16*)((void *)&gSaveBlock1.tvShows[arg1] + 0x02);
        break;
    default:
        return;
    }

    c -= 1;
    while (c != 0xFFFF)
    {
        *ptr = -1;
        ptr++;
        c -= 1;
    }
}

void sub_80EB6FC(u16 *arg0, u16 arg1)
{
    u16 i;

    for (i = arg1 - 1; i != 0xFFFF; i--)
    {
        *arg0 = 0xFFFF;
        arg0++;
    }

}

u16 sub_80EB72C(u16 group)
{
    u16 local1 = Random() % gEasyChatGroupSizes[group];

    if (group == EC_GROUP_POKEMON_1
     || group == EC_GROUP_POKEMON_2
     || group == EC_GROUP_MOVE_1
     || group == EC_GROUP_MOVE_2)
    {
        local1 = ((u16 *) gEasyChatGroupWords[group])[local1];
    }

    return ((group & 0x7F) << 9) | (local1 & 0x1FF);
}

u16 sub_80EB784(u16 group)
{
    if (!sub_80EAD7C(group))
        return -1;

    if (group != EC_GROUP_POKEMON_1)
    {
        if (group == EC_GROUP_TRENDY_SAYING)
            return sub_80EB960();
    }
    else
    {
        return sub_80EB9D8();
    }

    return sub_80EB72C(group);
}

void sub_80EB7C4(void)
{
    u16 *words;
    u16 arg1, arg2;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        words = gSaveBlock1.easyChats.unk2B1C;
        arg1 = 2;
        arg2 = 2;
        break;
    case 1:
        words = gSaveBlock1.easyChats.unk2B28;
        if (sub_80EB680(gSaveBlock1.easyChats.unk2B28, 3, 2, 20))
        {
            arg1 = 2;
            arg2 = 3;
        }
        else
        {
            arg1 = 3;
            arg2 = 2;
        }
        break;
    case 2:
        words = gSaveBlock1.easyChats.unk2B34;
        arg1 = 3;
        arg2 = 2;
        break;
    case 3:
        words = gSaveBlock1.easyChats.unk2B40;
        arg1 = 3;
        arg2 = 2;
        break;
    default:
        return;
    }

    ConvertEasyChatWordsToString(gStringVar4, words, arg1, arg2);
    ShowFieldAutoScrollMessage(gStringVar4);
}

void BufferRandomHobbyOrLifestyleString(void)
{
    u16 group, local2;

    if (Random() & 1)
        group = EC_GROUP_HOBBIES;
    else
        group = EC_GROUP_LIFESTYLE;

    local2 = sub_80EB784(group);
    EasyChat_GetWordText(gStringVar2, local2);
}

u8 sub_80EB868(u8 arg0)
{
    int offset;
    int index;

    index = arg0 / 8;
    offset = arg0 % 8;
    return (gSaveBlock1.unk2D8C[index] >> offset) & 1;
}

void sub_80EB890(u8 arg0)
{
    int offset;
    int index;

    if (arg0 < 33)
    {
        index = arg0 / 8;
        offset = arg0 % 8;
        gSaveBlock1.unk2D8C[index] |= 1 << offset;
    }
}

u8 sub_80EB8C0(void)
{
    u8 i, count;

    for (i = 0, count = 0; i < 33; i++)
    {
        if (sub_80EB868(i))
            count++;
    }
    return count;
}

u16 sub_80EB8EC(void)
{
    u16 i;
    u16 local1, local2;

    local1 = sub_80EB8C0();
    if (local1 == 33)
        return -1;

    local2 = Random() % (33 - local1);
    for (i = 0; i < 33; i++)
    {
        if (sub_80EB868(i) == 0)
        {
            if (local2 == 0)
            {
                sub_80EB890(i);
                return (i & 0x1FF) | 0x2800;
            }
            local2--;
        }
    }
    return -1;
}

static u16 sub_80EB960(void)
{
    u16 i;
    u16 local1;

    local1 = sub_80EB8C0();
    if (local1 == 0)
        return -1;

    local1 = Random() % local1;
    for (i = 0; i < 33; i++)
    {
        if (sub_80EB868(i))
        {
            if (local1 == 0)
                return (i & 0x1FF) | 0x2800;
            local1--;
        }
    }

    return -1;
}

u8 sub_80EB9C8(void)
{
    return IsNationalPokedexEnabled();
}

static u16 sub_80EB9D8(void)
{
    u16 *speciesList;
    u16 local1;
    u16 i;
    u8 topsize;

    local1 = sub_80EAE88(0);

    if (local1 == 0)
        return -1;

    local1 = Random() % local1;
    speciesList = (u16 *)gEasyChatGroupWords[EC_GROUP_POKEMON_1];
    for (i = 0, topsize = gEasyChatGroupSizes[EC_GROUP_POKEMON_1]; i < topsize; i++)
    {
        const u16 dexNum = SpeciesToNationalPokedexNum(*speciesList);
        const u8 local2 = GetSetPokedexFlag(dexNum, 0);

        if (local2)
        {
            if (local1 == 0)
                return *speciesList & 0x1FF;
            local1--;
        }
        speciesList++;
    }
    return -1;
}
