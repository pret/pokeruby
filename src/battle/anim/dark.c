#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "scanline_effect.h"

void sub_80DFE90(struct Sprite *sprite);

void sub_80DFC9C(u8 taskId);
void sub_80DFD58(u8 taskId);

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gObjectBankIDs[];

// used in Smoke Ball escape, Sky Attack, Feint Attack and Camouflage

void sub_80DFC24(u8 taskId)
{
    int bank;
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    bank = gAnimBankAttacker;
    gTasks[taskId].data[1] = 16;
    REG_BLDALPHA = 16;
    if (GetBankIdentity_permutated(bank) == 1)
        REG_BLDCNT = 0x3F42;
    else
        REG_BLDCNT = 0x3F44;
    gTasks[taskId].func = sub_80DFC9C;
}

void sub_80DFC9C(u8 taskId)
{
    u8 r2 = gTasks[taskId].data[1] >> 8;
    u8 r1 = gTasks[taskId].data[1];
    if (gTasks[taskId].data[2] == (u8)gTasks[taskId].data[0])
    {
        r2++;
        r1--;
        gTasks[taskId].data[1] = (r2 << 8) | r1;
        REG_BLDALPHA = (r2 << 8) | r1;
        gTasks[taskId].data[2] = 0;
        if (r2 == 16)
        {
            gSprites[gObjectBankIDs[gAnimBankAttacker]].invisible = 1;
            DestroyAnimVisualTask(taskId);
        }
    }
    else
        gTasks[taskId].data[2]++;
}

void sub_80DFD24(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[1] = 0x1000;
    gTasks[taskId].func = sub_80DFD58;
    REG_BLDALPHA = 0x1000;
}

void sub_80DFD58(u8 taskId)
{
    u8 r1 = gTasks[taskId].data[1] >> 8;
    u8 r5 = gTasks[taskId].data[1];
    if (gTasks[taskId].data[2] == (u8)gTasks[taskId].data[0])
    {
        r1--;
        r5++;
        gTasks[taskId].data[1] = (r1 << 8) | r5;
        REG_BLDALPHA = (r1 << 8) | r5;
        gTasks[taskId].data[2] = 0;
        if (r1 == 0)
        {
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
    else
        gTasks[taskId].data[2]++;
}

// unlike the above is only used in Feint Attack

void sub_80DFDC0(u8 taskId)
{
    REG_BLDALPHA = 0x1000;
    if (GetBankIdentity_permutated(gAnimBankAttacker) == 1)
        REG_BLDCNT = 0x3F42;
    else
        REG_BLDCNT = 0x3F44;
    DestroyAnimVisualTask(taskId);
}

// unused sprite template's callback

void sub_80DFE14(struct Sprite *sprite)
{
    sprite->data[1] = GetBankPosition(gAnimBankTarget, 2);
    sprite->data[2] = GetBankPosition(gAnimBankAttacker, 2);
    sprite->data[3] = GetBankPosition(gAnimBankTarget, 3);
    sprite->data[4] = GetBankPosition(gAnimBankAttacker, 3);
    sprite->data[0] = 0x7E;
    sub_8078A5C(sprite);
    sprite->data[3] = -sprite->data[1];
    sprite->data[4] = -sprite->data[2];
    sprite->data[6] = 0xFFD8;
    sprite->callback = sub_80DFE90;
    sub_80DFE90(sprite);
}

void sub_80DFE90(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    sprite->pos2.x = sprite->data[3] >> 8;
    sprite->pos2.y = sprite->data[4] >> 8;
    if (sprite->data[7] == 0)
    {
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        sprite->pos2.x = sprite->data[3] >> 8;
        sprite->pos2.y = sprite->data[4] >> 8;
        sprite->data[0]--;
    }
    sprite->pos2.y += Sin(sprite->data[5], sprite->data[6]);
    sprite->data[5] = (sprite->data[5] + 3) & 0xFF;
    if (sprite->data[5] > 0x7F)
    {
        sprite->data[5] = 0;
        sprite->data[6] += 20;
        sprite->data[7]++;
    }
    if (--sprite->data[0] == 0)
        DestroyAnimSprite(sprite);
}
