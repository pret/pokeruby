#include "global.h"
#include "easy_chat.h"
#include "graphics.h"
#include "sprite.h"
#include "trig.h"

void sub_80E8268(void);
void sub_80E82BC(struct Sprite *);
void sub_80E8534(void);
void sub_80E85F8(struct Sprite *);
void sub_80E872C(struct Sprite *);
void sub_80E8760(struct Sprite *);
void sub_80E8818(void);
void sub_80E8A7C(void);

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

extern const s8 gUnknown_083DBCC4[][7];

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
