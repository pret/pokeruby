#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "ewram.h"
#include "palette.h"
#include "decompress.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern const u8 gBattleAnimSpritePalette_206[];

void sub_80D1C08(struct Sprite* sprite);

// Used in Heal Bell.

const union AnimCmd gSpriteAnim_83D7A08[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 15),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 15, .hFlip = TRUE),
    ANIMCMD_FRAME(16, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 15),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D7A40[] =
{
    gSpriteAnim_83D7A08,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7A44 =
{
    .tileTag = 10205,
    .paletteTag = 10205,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D7A40,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80793C4,
};

const u16 gUnknown_083D7A5C[] =
{
    10206,
    9999,
    9998,
    9997,
    9996,
    0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7A68 =
{
    .tileTag = 10206,
    .paletteTag = 10206,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D1C08,
};

void sub_80D1ADC(u8 taskId)
{
    int i;
    u8 sp[8];
    void* src;
    void* dest;
    void* what;
    sp[0] = IndexOfSpritePaletteTag(0x27DE);
    for (i = 1; i <= 4; i++)
    {
        sp[i] = AllocSpritePalette(0x2710 - i);
    }

    src = &gBattleAnimSpritePalette_206;
    dest = (IsContest()) ? gSharedMem + 0x18000 - 0x3800: gSharedMem + 0x18000;
    LZDecompressWram(src, dest);
    for (i = 0; i <= 4; i++)
    {
        what = ((IsContest()) ? gSharedMem + 0x14800 : gSharedMem + 0x18000) + (i << 5);
        LoadPalette(what, (u16)((sp[i] << 4) + 0x100), 32);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80D1B80(u8 taskId)
{
    int i;
    for (i = 0; i < 5; i++)
    {
        FreeSpritePaletteByTag(gUnknown_083D7A5C[i]);
    }

    DestroyAnimVisualTask(taskId);
}

static void sub_80D1BA8(struct Sprite* sprite, u8 a, u8 b)
{
    u8 tile;
    tile = (b & 1);
    tile = ((-tile | tile) >> 31) & 32;
    sprite->oam.tileNum += tile + (a << 2);
    sprite->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_083D7A5C[b >> 1]);
}

void sub_80D1C08(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 0);
    if (GetBattlerSide(gAnimBankAttacker) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 0) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 1) + gBattleAnimArgs[3];
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sub_80D1BA8(sprite, gBattleAnimArgs[5], gBattleAnimArgs[6]);
}
