#include "global.h"
#include "rom_8077ABC.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80DA034(struct Sprite *sprite);
void sub_80DA16C(struct Sprite *sprite);
void sub_80DA208(struct Sprite *sprite);
void sub_80DA300(struct Sprite *sprite);
void sub_80DA38C(struct Sprite *sprite);
void sub_80DA4D8(struct Sprite *sprite);
void sub_80DAD30(struct Sprite *sprite);
void sub_80DAD84(struct Sprite *sprite);
void sub_80DB000(struct Sprite *sprite);
void sub_80DB194(struct Sprite *sprite);
void sub_80DB1F4(struct Sprite *sprite);
void sub_80DB288(struct Sprite *sprite);
void sub_80DB374(struct Sprite *sprite);
void sub_80DB458(struct Sprite *sprite);
void sub_80DB564(struct Sprite *sprite);
void sub_80DB5E4(struct Sprite *sprite);

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA380 =
{
    .tileTag = 10009,
    .paletteTag = 10009,
    .oam = &gOamData_837DF7C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA034,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA398[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xA, 0x0, 0, 24),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA3B0[] =
{
    gSpriteAffineAnim_83DA398,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA3B4 =
{
    .tileTag = 10009,
    .paletteTag = 10009,
    .oam = &gOamData_837DFDC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA3B0,
    .callback = sub_80DA16C,
};

const union AnimCmd gSpriteAnim_83DA3CC[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(0, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE),
    ANIMCMD_FRAME(0, 3, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83DA3E0[] =
{
    gSpriteAnim_83DA3CC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA3E4 =
{
    .tileTag = 10154,
    .paletteTag = 10154,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_83DA3E0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA208,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA3FC[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFF0, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA424[] =
{
    gSpriteAffineAnim_83DA3FC,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA428[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 50, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA438[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -40, 1),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA448[] =
{
    gSpriteAffineAnim_83DA428,
    gSpriteAffineAnim_83DA438,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA450 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA424,
    .callback = sub_80DA300,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA468 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DF9C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA448,
    .callback = sub_80DA38C,
};

const union AnimCmd gSpriteAnim_83DA480[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83DA488[] =
{
    ANIMCMD_FRAME(16, 0, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA490[] =
{
    gSpriteAnim_83DA480,
    gSpriteAnim_83DA488,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA498 =
{
    .tileTag = 10270,
    .paletteTag = 10270,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DA490,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DA4D8,
};

const u16 gUnknownPalette_83DA4B0[] = INCBIN_U16("graphics/unknown/unknown_3DA4B0.gbapal");

const struct SpriteTemplate gSpriteTemplate_83DA4D0 =
{
    .tileTag = 10155,
    .paletteTag = 10155,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DAD30,
};

const struct SpriteTemplate gSpriteTemplate_83DA4E8 =
{
    .tileTag = 10270,
    .paletteTag = 10270,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83DA490,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DAD84,
};

const union AnimCmd gSpriteAnim_83DA500[] =
{
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_FRAME(8, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DA518[] =
{
    gSpriteAnim_83DA500,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA51C =
{
    .tileTag = 10162,
    .paletteTag = 10162,
    .oam = &gOamData_837DF54,
    .anims = gSpriteAnimTable_83DA518,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB000,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA534[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFEC, 0x0, 0, 7),
    AFFINEANIMCMD_FRAME(0xFFEC, 0xFFEC, 0, 5),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA564[] =
{
    gSpriteAffineAnim_83DA534,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA568 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA564,
    .callback = sub_80DB194,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA580[] =
{
    AFFINEANIMCMD_FRAME(0xA0, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA590[] =
{
    gSpriteAffineAnim_83DA580,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA594 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA590,
    .callback = sub_80DB1F4,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA5AC[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x28, 0x0, 0, 6),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 5),
    AFFINEANIMCMD_FRAME(0xFFF0, 0x20, 0, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA5D4[] =
{
    gSpriteAffineAnim_83DA5AC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA5D8 =
{
    .tileTag = 10156,
    .paletteTag = 10156,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DA5D4,
    .callback = sub_80DB288,
};

const union AffineAnimCmd gSpriteAffineAnim_83DA5F0[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x0, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x20, 0, 12),
    AFFINEANIMCMD_FRAME(0x0, 0xFFE0, 0, 11),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DA610[] =
{
    gSpriteAffineAnim_83DA5F0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA614 =
{
    .tileTag = 10272,
    .paletteTag = 10272,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB374,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA62C =
{
    .tileTag = 10273,
    .paletteTag = 10273,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB458,
};

const struct SpriteTemplate gSpriteTemplate_83DA644 =
{
    .tileTag = 10212,
    .paletteTag = 10212,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB564,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DA65C =
{
    .tileTag = 10284,
    .paletteTag = 10284,
    .oam = &gOamData_837DFFC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80DB5E4,
};
