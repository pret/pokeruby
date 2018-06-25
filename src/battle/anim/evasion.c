#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"
#include "blend_palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80CE910(u8 taskId);
static void sub_80CE974(struct Sprite* sprite);

// evasion (the shadow seen during evasion increases, mainly Double Team.)
// Used by Double Team.

void sub_80CE7E0(u8 taskId)
{
    u16 i;
    int obj;
    u16 r3;
    u16 r4;
    struct Task* task = &gTasks[taskId];
    task->data[0] = GetAnimBattlerSpriteId(0);
    task->data[1] = AllocSpritePalette(0x2771);
    r3 = (task->data[1] * 16) + 0x100;
    r4 = (gSprites[task->data[0]].oam.paletteNum + 16) << 4;
    for (i = 1; i < 16; i++)
    {
        gPlttBufferUnfaded[r3 + i] = gPlttBufferUnfaded[r4 + i];
    }

    BlendPalette(r3, 16, 11, RGB(0, 0, 0));
    task->data[3] = 0;
    i = 0;
    while (i <= 1 && (obj = duplicate_obj_of_side_rel2move_in_transparent_mode(0)) >= 0)
    {
        gSprites[obj].oam.paletteNum = task->data[1];
        gSprites[obj].data[0] = 0;
        gSprites[obj].data[1] = i << 7;
        gSprites[obj].data[2] = taskId;
        gSprites[obj].callback = sub_80CE974;
        task->data[3]++;
        i++;
    }

    task->func = sub_80CE910;
    if (GetBattlerPosition_permutated(gAnimBankAttacker) == 1)
    {
        REG_DISPCNT &= 0xFDFF;
    }
    else
    {
        REG_DISPCNT &= 0xFBFF;
    }
}

void sub_80CE910(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (!task->data[3])
    {
        if (GetBattlerPosition_permutated(gAnimBankAttacker) == 1)
            REG_DISPCNT |= 0x200;
        else
            REG_DISPCNT |= 0x400;

        FreeSpritePaletteByTag(0x2771);
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80CE974(struct Sprite* sprite)
{
    if (++sprite->data[3] > 1)
    {
        sprite->data[3] = 0;
        sprite->data[0]++;
    }

    if (sprite->data[0] > 0x40)
    {
        gTasks[sprite->data[2]].data[3]--;
        obj_delete_but_dont_free_vram(sprite);
    }
    else
    {
        sprite->data[4] = gSineTable[sprite->data[0]] / 6;
        sprite->data[5] = gSineTable[sprite->data[0]] / 13;
        sprite->data[1] = (sprite->data[1] + sprite->data[5]) & 0xFF;
        sprite->pos2.x = Sin(sprite->data[1], sprite->data[4]);
    }
}
