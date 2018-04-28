#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "blend_palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// shimmer
// Used by Magical Leaf.

static const u16 sMagicalLeafBlendColors[] =
{
    RGB(31, 0, 0),
    RGB(31, 19, 0),
    RGB(31, 31, 0),
    RGB(0, 31, 0),
    RGB(5, 14, 31),
    RGB(22, 10, 31),
    RGB(22, 21, 31),
};

void sub_80CC5F8(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[0])
    {
    case 0:
        task->data[8] = IndexOfSpritePaletteTag(0x274f) * 16 + 256;
        task->data[12] = IndexOfSpritePaletteTag(0x27b0) * 16 + 256;
        task->data[0]++;
        break;
    case 1:
        task->data[9]++;
        if (task->data[9] >= 0)
        {
            task->data[9] = 0;
            BlendPalette(task->data[8], 0x10, task->data[10], sMagicalLeafBlendColors[task->data[11]]);
            BlendPalette(task->data[12], 0x10, task->data[10], sMagicalLeafBlendColors[task->data[11]]);
            task->data[10]++;
            if (task->data[10] == 17)
            {
                task->data[10] = 0;
                task->data[11]++;
                if (task->data[11] == 7)
                    task->data[11] = 0;
            }
        }
        break;
    }

    if (gBattleAnimArgs[7] == -1)
        DestroyAnimVisualTask(taskId);
}
