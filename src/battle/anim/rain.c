#include "global.h"
#include "battle_anim.h"
#include "random.h"
#include "sprite.h"
#include "task.h"

extern s16 gBattleAnimArgs[8];

void SetAnimRaindropCallback(struct Sprite *sprite);
static void MoveAnimRaindrop(struct Sprite *sprite);

// rain (spawns and animates raindrops)
// Used in Rain Dance and general rain animation.

 const u8 gUnknown_3D7D8C[] = INCBIN_U8("graphics/unknown/unknown_3D7D8C.4bpp");
 const u8 gUnknown_3D810C[] = INCBIN_U8("graphics/unknown/unknown_3D810C.bin");

 const union AnimCmd gSpriteAnim_83D910C[] =
{
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(8, 2),
    ANIMCMD_FRAME(16, 2),
    ANIMCMD_FRAME(24, 6),
    ANIMCMD_FRAME(32, 2),
    ANIMCMD_FRAME(40, 2),
    ANIMCMD_FRAME(48, 2),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D912C[] =
{
    gSpriteAnim_83D910C,
};

const struct SpriteTemplate gSpriteTemplate_83D9130 =
{
    .tileTag = 10115,
    .paletteTag = 10115,
    .oam = &gOamData_837DF74,
    .anims = gSpriteAnimTable_83D912C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SetAnimRaindropCallback,
};

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
        CreateSprite(&gSpriteTemplate_83D9130, x,  y, 4);
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
