#include "global.h"
#include "rom_8077ABC.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80E1CB4(struct Sprite *sprite);
void sub_80E1D84(struct Sprite *sprite);
void sub_80E1E2C(struct Sprite *sprite);
void sub_80E1F3C(struct Sprite *sprite);
void sub_80E24B8(struct Sprite *sprite);
void sub_80E27A0(struct Sprite *sprite);
void sub_80E2838(struct Sprite *sprite);
void sub_80E27A0(struct Sprite *sprite);
void sub_80E2870(struct Sprite *sprite);
void sub_80E2908(struct Sprite *sprite);
void sub_80E2978(struct Sprite *sprite);
void sub_80E29C0(struct Sprite *sprite);
void sub_80E27E8(struct Sprite *sprite);

const union AnimCmd gSpriteAnim_83DB37C[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_83DB390[] =
{
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DB3A4[] =
{
    gSpriteAnim_83DB37C,
    gSpriteAnim_83DB390,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB3AC =
{
    .tileTag = 10073,
    .paletteTag = 10073,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83DB3A4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1CB4,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB3C4 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1D84,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB3DC =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1E2C,
};

const union AnimCmd gSpriteAnim_83DB3F4[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DB40C[] =
{
    gSpriteAnim_83DB3F4,
};

const struct SpriteTemplate gSpriteTemplate_83DB410 =
{
    .tileTag = 10071,
    .paletteTag = 10071,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83DB40C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1F3C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB428 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E24B8,
};

const union AffineAnimCmd gSpriteAffineAnim_83DB440[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DB450[] =
{
    AFFINEANIMCMD_FRAME(0xD8, 0xD8, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DB468[] =
{
    AFFINEANIMCMD_FRAME(0xB0, 0xB0, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DB480[] =
{
    AFFINEANIMCMD_FRAME(0x80, 0x80, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DB498[] =
{
    gSpriteAffineAnim_83DB440,
    gSpriteAffineAnim_83DB450,
    gSpriteAffineAnim_83DB468,
    gSpriteAffineAnim_83DB480,
};

const struct SpriteTemplate gBasicHitSplatSpriteTemplate =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E27A0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4C0 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E2838,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4D8 =
{
    .tileTag = 10148,
    .paletteTag = 10148,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E27A0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB4F0 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E2870,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB508 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E2908,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB520 =
{
    .tileTag = 10285,
    .paletteTag = 10285,
    .oam = &gOamData_837E054,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E2978,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB538 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E29C0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB550 =
{
    .tileTag = 10135,
    .paletteTag = 10135,
    .oam = &gOamData_837E0B4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB498,
    .callback = sub_80E27E8,
};

const u16 gUnknown_083DB568 = RGB(31, 31, 31);
