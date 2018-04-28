#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern const union AnimCmd *const gSpriteAnimTable_83D6424[];
extern const union AnimCmd *const gSpriteAnimTable_83D6420[];

void sub_80CC474(struct Sprite* sprite);
static void sub_80CC580(struct Sprite* sprite);

// flying_petals (petals fly across the screen.)
// Used by Aromatherapy.

const union AffineAnimCmd gSpriteAffineAnim_83D689C[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, 4, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D68B4[] = {
    gSpriteAffineAnim_83D689C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D68B8 =
{
    .tileTag = 10159,
    .paletteTag = 10159,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D6424,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CC474,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D68D0 =
{
    .tileTag = 10159,
    .paletteTag = 10159,
    .oam = &gOamData_837DF8C,
    .anims = gSpriteAnimTable_83D6420,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D68B4,
    .callback = sub_80CC474,
};

const union AffineAnimCmd gSpriteAffineAnim_83D68E8[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, -10, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd gSpriteAffineAnim_83D6900[] = {
    AFFINEANIMCMD_FRAME(192, 192, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, -12, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd gSpriteAffineAnim_83D6918[] = {
    AFFINEANIMCMD_FRAME(143, 143, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, -15, 1),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D6930[] = {
    gSpriteAffineAnim_83D68E8,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D6934[] = {
    gSpriteAffineAnim_83D6900,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D6938[] = {
    gSpriteAffineAnim_83D6918,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D693C =
{
    .tileTag = 10271,
    .paletteTag = 10271,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6930,
    .callback = sub_80CC474,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6954 =
{
    .tileTag = 10271,
    .paletteTag = 10271,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6934,
    .callback = sub_80CC474,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D696C =
{
    .tileTag = 10271,
    .paletteTag = 10271,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6938,
    .callback = sub_80CC474,
};

void sub_80CC474(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[6])
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    if (GetBattlerSide(bank) != 0)
    {
        sprite->data[4] = 0;
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->pos1.x = 0xFFF0;
    }
    else
    {
        sprite->data[4] = 1;
        sprite->data[2] = -gBattleAnimArgs[3];
        sprite->pos1.x = 0x100;
    }

    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[4];
    switch (gBattleAnimArgs[5])
    {
    case 0:
        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank);
        break;
    case 1:
        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank) + 1;
        break;
    case 2:
        sprite->pos1.y = GetBattlerSpriteCoord(bank, 3) + gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank);
        break;
    case 3:
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[0];
        GetAnimBattlerSpriteId(1);
        sprite->oam.priority = sub_8079ED4(bank) + 1;
        break;
    }

    sprite->callback = sub_80CC580;
}

static void sub_80CC580(struct Sprite* sprite)
{
    int a = sprite->data[7];
    sprite->data[7]++;
    sprite->pos2.y = (sprite->data[1] * gSineTable[sprite->data[0]]) >> 8;
    sprite->pos2.x = sprite->data[2] * a;
    sprite->data[0] = (sprite->data[3] * a) & 0xFF;
    if (sprite->data[4] == 0)
    {
        if (sprite->pos2.x + sprite->pos1.x <= 0xF7)
            return;
    }
    else
    {
        if (sprite->pos2.x + sprite->pos1.x > -16)
            return;
    }

    move_anim_8074EE0(sprite);
}
