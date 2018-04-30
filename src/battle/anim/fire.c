#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;

void sub_80D4ED8(struct Sprite *sprite);
void sub_80D4F18(struct Sprite *sprite);
void sub_80D4FCC(struct Sprite *sprite);
void sub_80D4F5C(struct Sprite *sprite);
void sub_80D5074(struct Sprite *sprite);
static void sub_80D5038(struct Sprite *);
static void sub_80D50E8(struct Sprite *);

const union AnimCmd gSpriteAnim_83D9450[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(48, 4),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_83D9460[] =
{
    ANIMCMD_FRAME(16, 4, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 4, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(48, 4, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9470[] =
{
    gSpriteAnim_83D9450,
    gSpriteAnim_83D9460,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9478 =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9470,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4ED8,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9490 =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9470,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4F18,
};

const union AnimCmd gSpriteAnim_83D94A8[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_FRAME(80, 3),
    ANIMCMD_FRAME(96, 3),
    ANIMCMD_FRAME(112, 3),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D94CC[] =
{
    gSpriteAnim_83D94A8,
};

const union AnimCmd gSpriteAnim_83D94D0[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_FRAME(64, 5),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D94E8[] =
{
    gSpriteAnim_83D94D0,
};

const union AffineAnimCmd gSpriteAffineAnim_83D94EC[] =
{
    AFFINEANIMCMD_FRAME(0x32, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x20, 0x0, 0, 7),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9504[] =
{
    gSpriteAffineAnim_83D94EC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9508 =
{
    .tileTag = 10033,
    .paletteTag = 10033,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83D94CC,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9504,
    .callback = sub_80D4FCC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9520 =
{
    .tileTag = 10033,
    .paletteTag = 10033,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D94CC,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4FCC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9538 =
{
    .tileTag = 10035,
    .paletteTag = 10035,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D94E8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4F5C,
};

const struct SpriteTemplate gSpriteTemplate_83D9550 =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D94E8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D4F5C,
};

const union AnimCmd gSpriteAnim_83D9568[] =
{
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_FRAME(48, 6),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9578[] =
{
    gSpriteAnim_83D9568,
};

const struct SpriteTemplate gSpriteTemplate_83D957C =
{
    .tileTag = 10029,
    .paletteTag = 10029,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9578,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D5074,
};

void sub_80D4ED8(struct Sprite *sprite)
{
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = 0x3C;
    sprite->data[2] = 0x9;
    sprite->data[3] = 0x1E;
    sprite->data[4] = 0xFE00;

    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);

    sprite->callback = sub_8078174;
    sprite->callback(sprite);
}

void sub_80D4F18(struct Sprite *sprite)
{
    sub_807867C(sprite, gBattleAnimArgs[0]);

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[3];

    sprite->callback = sub_8078394;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D4F5C(struct Sprite *sprite)
{
    sub_8078650(sprite);

    if (GetBattlerSide(gAnimBankAttacker))
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[2] = -gBattleAnimArgs[4];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[2] = gBattleAnimArgs[4];
    }

    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[5];

    sprite->callback = sub_80D5038;
}

void sub_80D4FCC(struct Sprite *sprite)
{
    if (GetBattlerSide(gAnimBankAttacker))
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[2] = gBattleAnimArgs[4];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[2] = -gBattleAnimArgs[4];
    }

    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[5];

    sprite->callback = sub_80D5038;
}

static void sub_80D5038(struct Sprite *sprite)
{
    if (++sprite->data[0] < sprite->data[4])
    {
        sprite->pos2.x += sprite->data[2];
        sprite->pos2.y += sprite->data[3];
    }

    if (sprite->data[0] == sprite->data[1])
        move_anim_8074EE0(sprite);
}

void sub_80D5074(struct Sprite *sprite)
{
    sub_8078650(sprite);

    if (GetBattlerSide(gAnimBankAttacker))
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->subpriority = 8;
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->data[4] = gBattleAnimArgs[6];
    sprite->data[5] = 0;

    sprite->callback = sub_80D50E8;
}

static void sub_80D50E8(struct Sprite *sprite)
{
    if (sprite->data[3])
    {
        if(sprite->data[5] > 10000)
            sprite->subpriority = 1;

        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1] + (sprite->data[5] >> 8));
        sprite->pos2.y = Cos(sprite->data[0], sprite->data[1] + (sprite->data[5] >> 8));

        sprite->data[0] += sprite->data[2];
        sprite->data[5] += sprite->data[4];

        if (sprite->data[0] > 255)
            sprite->data[0] -= 256;
        else if (sprite->data[0] < 0)
            sprite->data[0] += 256;

        sprite->data[3]--;
    }
    else
    {
        move_anim_8074EE0(sprite);
    }
}