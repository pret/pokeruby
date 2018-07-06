#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "battle.h"
#include "battle_anim_80CA710.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gBanksBySide[];
extern u16 gBattleTypeFlags;

extern void sub_80D4CA4(struct Sprite *sprite);

void AnimSonicBoomProjectile(struct Sprite* sprite);
void sub_80CF8B8(struct Sprite* sprite);

const struct SpriteTemplate gSonicBoomSpriteTemplate =
{
    .tileTag = 10003,
    .paletteTag = 10003,
    .oam = &gOamData_837E134,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = AnimSonicBoomProjectile,
};

const struct SpriteTemplate gSpriteTemplate_83D74BC =
{
    .tileTag = 10003,
    .paletteTag = 10003,
    .oam = &gOamData_837E074,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CF8B8,
};

const union AffineAnimCmd gSpriteAffineAnim_83D74D4[] =
{
    AFFINEANIMCMD_FRAME(0x20, 0x20, 0, 0),
    AFFINEANIMCMD_FRAME(0x7, 0x7, 0, -56),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D74EC[] =
{
    AFFINEANIMCMD_FRAME(0x5, 0x5, 0, 10),
    AFFINEANIMCMD_FRAME(0xFFF6, 0xFFF6, 0, 10),
    AFFINEANIMCMD_FRAME(0xA, 0xA, 0, 10),
    AFFINEANIMCMD_FRAME(0xFFF6, 0xFFF6, 0, 10),
    AFFINEANIMCMD_FRAME(0xA, 0xA, 0, 10),
    AFFINEANIMCMD_FRAME(0xFFF6, 0xFFF6, 0, 10),
    AFFINEANIMCMD_FRAME(0xA, 0xA, 0, 10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D752C[] =
{
    gSpriteAffineAnim_83D74D4,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D7530[] =
{
    gSpriteAffineAnim_83D74EC,
};

const struct SpriteTemplate gSupersonicWaveSpriteTemplate =
{
    .tileTag = 10163,
    .paletteTag = 10163,
    .oam = &gOamData_837E034,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D752C,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const struct SpriteTemplate gScreechWaveSpriteTemplate =
{
    .tileTag = 10164,
    .paletteTag = 10164,
    .oam = &gOamData_837E034,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D752C,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D7564 =
{
    .tileTag = 10260,
    .paletteTag = 10260,
    .oam = &gOamData_837E03C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D752C,
    .callback = TranslateAnimSpriteToTargetMonLocation,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D757C =
{
    .tileTag = 10288,
    .paletteTag = 10288,
    .oam = &gOamData_837E034,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D7530,
    .callback = sub_80D4CA4,
};

// Moves a projectile towards the target mon. The sprite is rotated to be pointing
// in the same direction it's moving.
// arg 0: initial x pixel offset
// arg 1: initial y pixel offset
// arg 2: target x pixel offset
// arg 3: target y pixel offset
// arg 4: duration
void AnimSonicBoomProjectile(struct Sprite* sprite)
{
    s16 targetXPos;
    s16 targetYPos;
    u16 rotation;

    if (IsContest())
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    else if (GetBattlerSide(gAnimBankAttacker) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    InitAnimSpritePos(sprite, 1);
    targetXPos = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    targetYPos = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    rotation = ArcTan2Neg(targetXPos - sprite->pos1.x, targetYPos - sprite->pos1.y);
    rotation += 0xF000;
    if (IsContest())
        rotation -= 0x6000;

    sub_8078FDC(sprite, 0, 0x100, 0x100, rotation);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = targetXPos;
    sprite->data[4] = targetYPos;
    sprite->callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80CF7E0(struct Sprite* sprite)
{
    if (sprite->data[0]-- <= 0)
    {
        gTasks[sprite->data[7]].data[1]--;
        DestroySprite(sprite);
    }
}

void sub_80CF814(struct Sprite* sprite)
{
    struct Task* task = &gTasks[sprite->data[7]];
    if (sprite->data[0] > task->data[5])
    {
        sprite->data[5] += sprite->data[3];
        sprite->data[6] += sprite->data[4];
    }
    else
    {
        sprite->data[5] -= sprite->data[3];
        sprite->data[6] -= sprite->data[4];
    }

    sprite->data[1] += sprite->data[5];
    sprite->data[2] += sprite->data[6];
    if (1 & task->data[7])
        sprite->pos2.x = ((u16)sprite->data[1] >> 8) * -1;
    else
        sprite->pos2.x = (u16)sprite->data[1] >> 8;

    if (1 & task->data[8])
        sprite->pos2.y = ((u16)sprite->data[2] / 256u) * -1;
    else
        sprite->pos2.y = (u16)sprite->data[2] / 256u;

    if (sprite->data[0]-- <= 0)
    {
        sprite->data[0] = 30;
        sprite->callback = sub_80CF7E0;
    }
}

void sub_80CF8B8(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    s16 c;

    struct Task* task = &gTasks[sprite->data[7]];
    sprite->data[1] += (-2 & task->data[7]);
    sprite->data[2] += (-2 & task->data[8]);
    if (1 & task->data[7])
        sprite->pos2.x = ((u16)sprite->data[1] >> 8) * -1;
    else
        sprite->pos2.x = (u16)sprite->data[1] >> 8;

    if (1 & task->data[8])
        sprite->pos2.y = ((u16)sprite->data[2] / 256u) * -1;
    else
        sprite->pos2.y = (u16)sprite->data[2] / 256u;

    if (sprite->data[0]-- <= 0)
    {
        sprite->data[0] = 8;
        task->data[5] = 4;
        a = sub_81174E0(0x1000);
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        if (task->data[11] >= sprite->pos1.x)
            b = (task->data[11] - sprite->pos1.x) << 8;
        else
            b = (sprite->pos1.x - task->data[11]) << 8;

        if (task->data[12] >= sprite->pos1.y)
            c = (task->data[12] - sprite->pos1.y) << 8;
        else
            c = (sprite->pos1.y - task->data[12]) << 8;

        sprite->data[2] = 0;
        sprite->data[1] = 0;
        sprite->data[6] = 0;
        sprite->data[5] = 0;
        sprite->data[3] = sub_81174C4(sub_81174C4(b, a), sub_81174E0(0x1C0));
        sprite->data[4] = sub_81174C4(sub_81174C4(c, a), sub_81174E0(0x1C0));
        sprite->callback = sub_80CF814;
    } 
}

void sub_80CF9F8(u8 taskId)
{
    if (gTasks[taskId].data[1] == 0)
        DestroyAnimVisualTask(taskId);
}

void sub_80CFA20(u8 taskId)
{
    if (gTasks[taskId].data[0]-- <= 0)
    {
        u8 spriteId;
        struct Sprite* sprite;
        spriteId = CreateSprite(&gSpriteTemplate_83D74BC, gTasks[taskId].data[9], gTasks[taskId].data[10], gTasks[taskId].data[2] - gTasks[taskId].data[1]);
        sprite = &gSprites[spriteId];
        switch (gTasks[taskId].data[4])
        {
        case 1:
            sprite->oam.matrixNum |= 24;
            break;
        case 2:
            sprite->oam.matrixNum = 8;
            break;
        }

        sprite->data[0] = gTasks[taskId].data[5] - gTasks[taskId].data[6];
        sprite->data[7] = taskId;
        gTasks[taskId].data[gTasks[taskId].data[1] + 13] = spriteId;
        gTasks[taskId].data[0] = gTasks[taskId].data[3];
        gTasks[taskId].data[1]++;
        PlaySE12WithPanning(0x9A, BattleAnimAdjustPanning(-0x3F));
        if (gTasks[taskId].data[1] > 2)
            gTasks[taskId].func = sub_80CF9F8;
    }
}

void sub_80CFB04(u8 taskId)
{
    s16 r9 = 0;
    s16 r6 = 0;
    s16 sp1 = 0;
    s16 sp2 = 0;
    s16 r4;

    if (IsContest())
    {
        gTasks[taskId].data[4] = 2;
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        if (gBattleAnimArgs[2] & 1)
            gBattleAnimArgs[2] &= ~1;
        else
            gBattleAnimArgs[2] |= 1;
    }
    else
    {
        if ((gBanksBySide[gAnimBankTarget] & 1) == 0)
        {
            gTasks[taskId].data[4] = 1;
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
            if (gBattleAnimArgs[2] & 1)
                gBattleAnimArgs[2] &= ~1;
            else
                gBattleAnimArgs[2] |= 1;
        }
    }
    r6 = gTasks[taskId].data[9] = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
    r9 = gTasks[taskId].data[10] = GetBattlerSpriteCoord(gAnimBankAttacker, 1);
    if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        && IsAnimBankSpriteVisible(gAnimBankTarget ^ 2))
    {
        SetAverageBattlerPositions(gAnimBankTarget, 0, &sp1, &sp2);
    }
    else
    {
        sp1 = GetBattlerSpriteCoord(gAnimBankTarget, 0);
        sp2 = GetBattlerSpriteCoord(gAnimBankTarget, 1);
    }

    sp1 = gTasks[taskId].data[11] = sp1 + gBattleAnimArgs[0];
    sp2 = gTasks[taskId].data[12] = sp2 + gBattleAnimArgs[1];
    if (sp1 >= r6)
        r4 = sp1 - r6;
    else
        r4 = r6 - sp1;

    gTasks[taskId].data[5] = sub_81174C4(r4, sub_81174E0(gBattleAnimArgs[2] & ~1));
    gTasks[taskId].data[6] = sub_81174C4(gTasks[taskId].data[5], 0x80);
    gTasks[taskId].data[7] = gBattleAnimArgs[2];
    if (sp2 >= r9)
    {
        r4 = sp2 - r9;
        gTasks[taskId].data[8] = sub_81174C4(r4, sub_81174E0(gTasks[taskId].data[5])) & ~1;
    }
    else
    {
        r4 = r9 - sp2;
        gTasks[taskId].data[8] = sub_81174C4(r4, sub_81174E0(gTasks[taskId].data[5])) | 1;
    }

    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    if (gBattleAnimArgs[4] & 0x80)
    {
        gBattleAnimArgs[4] ^= 0x80;
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = sub_8079E90(gAnimBankTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gAnimBankTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }
    else
    {
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = sub_8079E90(gAnimBankTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gAnimBankTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }

    if (gTasks[taskId].data[2] < 3)
        gTasks[taskId].data[2] = 3;

    gTasks[taskId].func = sub_80CFA20;
}
