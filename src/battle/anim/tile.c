#include "global.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern u8 gBattlersCount;
extern u8 gHealthboxSpriteIds[];

void sub_80CE09C(struct Sprite* sprite);
void sub_80CE17C(struct Sprite* sprite);
static void sub_80CE1AC(struct Sprite* sprite);

// tile_in (flips a white tile from the scene into facing the player.)
// Used in Conversion.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6F08 =
{
    .tileTag = ANIM_TAG_BLACK_BALL,
    .paletteTag = ANIM_TAG_BLACK_BALL,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const union AnimCmd gSpriteAnim_83D6F20[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_FRAME(64, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6F38[] =
{
    gSpriteAnim_83D6F20,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6F3C =
{
    .tileTag = ANIM_TAG_GRAY_SMOKE,
    .paletteTag = ANIM_TAG_GRAY_SMOKE,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D6F38,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80793C4,
};

const union AnimCmd gSpriteAnim_83D6F54[] =
{
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6F68[] =
{
    gSpriteAnim_83D6F54,
};

const union AffineAnimCmd gSpriteAffineAnim_83D6F6C[] =
{
    AFFINEANIMCMD_FRAME(0x200, 0x200, 0, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D6F7C[] =
{
    gSpriteAffineAnim_83D6F6C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6F80 =
{
    .tileTag = ANIM_TAG_CONVERSION,
    .paletteTag = ANIM_TAG_CONVERSION,
    .oam = &gOamData_837E104,
    .anims = gSpriteAnimTable_83D6F68,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6F7C,
    .callback = sub_80CE09C,
};

const union AnimCmd gSpriteAnim_83D6F98[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6FAC[] =
{
    gSpriteAnim_83D6F98,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6FB0 =
{
    .tileTag = ANIM_TAG_CONVERSION,
    .paletteTag = ANIM_TAG_CONVERSION,
    .oam = &gOamData_837E104,
    .anims = gSpriteAnimTable_83D6FAC,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D6F7C,
    .callback = sub_80CE17C,
};

void sub_80CE09C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 0) + gBattleAnimArgs[0];
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 1) + gBattleAnimArgs[1];
        if (IsContest())
            sprite->y += 10;
        sprite->data[0]++;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        DestroyAnimSprite(sprite);
}

void sub_80CE108(u8 taskId)
{
    if (gTasks[taskId].data[2] == 1)
    {
        gBattleAnimArgs[7] = 0xFFFF;
        gTasks[taskId].data[2]++;
    }
    else if (gTasks[taskId].data[2] == 2)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        if (++gTasks[taskId].data[0] == 4)
        {
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[1]++;
            REG_BLDALPHA = (gTasks[taskId].data[1] << 8) | (16 - gTasks[taskId].data[1]);
            if (gTasks[taskId].data[1] == 16)
                gTasks[taskId].data[2]++;
        }
    }
}

void sub_80CE17C(struct Sprite* sprite)
{
    InitSpritePosToAnimTarget(sprite, FALSE);
    sprite->animPaused = 1;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = sub_80CE1AC;
}

static void sub_80CE1AC(struct Sprite* sprite)
{
    if (sprite->data[0])
    {
        sprite->data[0]--;
    }
    else
    {
        sprite->animPaused = 0;
        sprite->data[0] = 30;
        sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        sprite->callback = StartAnimLinearTranslation;
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    }
}

void sub_80CE210(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 4)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1]++;
        REG_BLDALPHA = gTasks[taskId].data[1] | ((16 - gTasks[taskId].data[1]) << 8);
        if (gTasks[taskId].data[1] == 16)
            DestroyAnimVisualTask(taskId);
    }
}

void unref_sub_80CE260(u8 taskId)
{
    u8 i;
    for (i = 0; i < gBattlersCount; i++)
    {
        if (gBattleAnimArgs[0] == 1 && GetBattlerSide(i) == 0)
            sub_8043DB0(gHealthboxSpriteIds[i]);

        if (gBattleAnimArgs[1] == 1 && GetBattlerSide(i) == 1)
            sub_8043DB0(gHealthboxSpriteIds[i]);
    }

    DestroyAnimVisualTask(taskId);
}

void unref_sub_80CE2D4(u8 taskId)
{
    u8 i;
    for (i = 0; i < gBattlersCount; i++)
    {
        sub_8043DFC(gHealthboxSpriteIds[i]);
    }

    DestroyAnimVisualTask(taskId);
}
