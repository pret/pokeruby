#include "global.h"
#include "battle_anim.h"
#include "random.h"
#include "sprite.h"
#include "task.h"

extern s16 gBattleAnimArgs[8];
extern const struct SpriteTemplate gSpriteTemplate_83D9130[];

static void MoveAnimRaindrop(struct Sprite *);

// rain (spawns and animates raindrops)
// Used in Rain Dance and general rain animation.

void CreateAnimRaindrops(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].data[1] = gBattleAnimArgs[0];
        gTasks[taskId].data[2] = gBattleAnimArgs[1];
        gTasks[taskId].data[3] = gBattleAnimArgs[2];
    }

    gTasks[taskId].data[0]++;

    if (gTasks[taskId].data[0] % gTasks[taskId].data[2] == 1)
    {
        u8 x = Random() % 240;
        u8 y = Random() % 80;
        CreateSprite(gSpriteTemplate_83D9130, x,  y, 4);
    }

    if (gTasks[taskId].data[0] == gTasks[taskId].data[3])
    {
        DestroyAnimVisualTask(taskId);
    }
}

void SetAnimRaindropCallback(struct Sprite *sprite)
{
    sprite->callback = MoveAnimRaindrop;
}

static void MoveAnimRaindrop(struct Sprite *sprite)
{
    if (++sprite->data[0] <= 13)
    {
        sprite->pos2.x++;
        sprite->pos2.y += 4;
    }

    if (sprite->animEnded)
    {
        DestroySprite(sprite);
    }
}
