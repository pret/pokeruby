#include "global.h"
#include "rom_8077ABC.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80E0F1C(struct Sprite *sprite);
void sub_80E1004(struct Sprite *sprite);
void sub_80E1078(struct Sprite *sprite);
void sub_80E1078(struct Sprite *sprite);
void sub_80E1108(struct Sprite *sprite);
void sub_80E1728(struct Sprite *sprite);
void sub_80E17CC(struct Sprite *sprite);

const union AffineAnimCmd gSpriteAffineAnim_83DB2A0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 15, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_83DB2B0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 20, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DB2C0[] =
{
    gSpriteAffineAnim_83DB2A0,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DB2C4[] =
{
    gSpriteAffineAnim_83DB2B0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB2C8 =
{
    .tileTag = 10000,
    .paletteTag = 10000,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB2C0,
    .callback = sub_80E0F1C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB2E0 =
{
    .tileTag = 10000,
    .paletteTag = 10000,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB2C4,
    .callback = sub_80E1004,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB2F8 =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1078,
};

const union AnimCmd gSpriteAnim_83DB310[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DB318[] =
{
    gSpriteAnim_83DB310,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB31C =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83DB318,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1078,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB334 =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1108,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB34C =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1728,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB364 =
{
    .tileTag = 10281,
    .paletteTag = 10281,
    .oam = &gOamData_837DF54,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E17CC,
};
