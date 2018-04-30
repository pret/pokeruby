#include "global.h"
#include "rom_8077ABC.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80DDB6C(struct Sprite *sprite);
void sub_80DDD58(struct Sprite *sprite);
void sub_80DDF40(struct Sprite *sprite);
void sub_80DE0FC(struct Sprite *sprite);
void sub_80DE7B8(struct Sprite *sprite);
void sub_80DEF3C(struct Sprite *sprite);
void sub_80DF0B8(struct Sprite *sprite);
void sub_80DF0B8(struct Sprite *sprite);
void sub_80DF3D8(struct Sprite *sprite);
void sub_80DF49C(struct Sprite *sprite);

const union AffineAnimCmd gSpriteAffineAnim_83DAE48[] =
{
    AFFINEANIMCMD_FRAME(0x1E, 0x1E, 10, 5),
    AFFINEANIMCMD_FRAME(0xFFE2, 0xFFE2, 10, 5),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAE60[] =
{
    gSpriteAffineAnim_83DAE48,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAE64 =
{
    .tileTag = 10013,
    .paletteTag = 10013,
    .oam = &gOamData_837DFEC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAE60,
    .callback = sub_80DDB6C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAE7C =
{
    .tileTag = 10013,
    .paletteTag = 10013,
    .oam = &gOamData_837E04C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DDD58,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAE94[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 10, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAEA4[] =
{
    gSpriteAffineAnim_83DAE94,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAEA8 =
{
    .tileTag = 10176,
    .paletteTag = 10176,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DAEA4,
    .callback = sub_80DDF40,
};

const union AnimCmd gSpriteAnim_83DAEC0[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(8, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(24, 2),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DAED8[] =
{
    gSpriteAnim_83DAEC0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAEDC =
{
    .tileTag = 10177,
    .paletteTag = 10177,
    .oam = &gOamData_837DF74,
    .anims = gSpriteAnimTable_83DAED8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DE0FC,
};

const union AffineAnimCmd gSpriteAffineAnim_83DAEF4[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DAF04[] =
{
    gSpriteAffineAnim_83DAEF4,
};

const struct SpriteTemplate gSpriteTemplate_83DAF08 =
{
    .tileTag = 10188,
    .paletteTag = 10188,
    .oam = &gOamData_837E07C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DE7B8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAF20 =
{
    .tileTag = 10199,
    .paletteTag = 10199,
    .oam = &gOamData_837E074,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DEF3C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAF38 =
{
    .tileTag = 10200,
    .paletteTag = 10200,
    .oam = &gOamData_837E054,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DF0B8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DAF50 =
{
    .tileTag = 10221,
    .paletteTag = 10221,
    .oam = &gOamData_837E054,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DF0B8,
};

const union AnimCmd gSpriteAnim_83DAF68[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(24, 4),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DAF7C[] =
{
    gSpriteAnim_83DAF68,
};

const struct SpriteTemplate gSpriteTemplate_83DAF80 =
{
    .tileTag = 10253,
    .paletteTag = 10253,
    .oam = &gOamData_837E094,
    .anims = gSpriteAnimTable_83DAF7C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DF3D8,
};

const struct SpriteTemplate gSpriteTemplate_83DAF98 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DF49C,
};
