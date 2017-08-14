#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#define SPRITE gSprites[TASK.data[0]]

extern s16 gBattleAnimArgs[8];

extern u8 gObjectBankIDs[];
extern s32 gMoveDmgMoveAnim;
extern u16 gMovePowerMoveAnim;
extern u8 gBattleAnimPlayerMonIndex;
extern u8 gBattleAnimEnemyMonIndex;

static void sub_80A7EF0(u8 taskId);
static void sub_80A808C(u8 taskId);
static void sub_80A81D8(u8 taskId);
static void sub_80A8374(u8 taskId);
static void sub_80A8488(u8 taskId);
static void sub_80A85A4(struct Sprite *sprite);
void sub_80A8614(struct Sprite* sprite);
static void sub_80A86F4(struct Sprite *sprite);
static void sub_80A88F0(struct Sprite *sprite);
static void sub_80A89B4(u8 taskId);
static void sub_80A8A18(u8 taskId);
static void sub_80A8C0C(u8 taskId);
static void sub_80A8D8C(u8 taskId);
void sub_80A8FD8(u8 taskId);
static void sub_80A913C(u8 taskId);

void sub_80A7E7C(u8 taskId)
{
    u8 sprite;
    sprite = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
    if (sprite == 0xff)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
    gSprites[sprite].pos2.x = gBattleAnimArgs[1];
    gSprites[sprite].pos2.y = gBattleAnimArgs[2];
    TASK.data[0] = sprite;
    TASK.data[1] = gBattleAnimArgs[3];
    TASK.data[2] = gBattleAnimArgs[4];
    TASK.data[3] = gBattleAnimArgs[4];
    TASK.data[4] = gBattleAnimArgs[1];
    TASK.data[5] = gBattleAnimArgs[2];
    TASK.func = sub_80A7EF0;
    sub_80A7EF0(taskId);
}

static void sub_80A7EF0(u8 taskId)
{
    if (TASK.data[3] == 0)
    {
        if (SPRITE.pos2.x == 0)
        {
            SPRITE.pos2.x = TASK.data[4];
        }
        else
        {
            SPRITE.pos2.x = 0;
        }
        if (SPRITE.pos2.y == 0)
        {
            SPRITE.pos2.y = TASK.data[5];
        }
        else
        {
            SPRITE.pos2.y = 0;
        }
        TASK.data[3] = TASK.data[2];
        if (--TASK.data[1] == 0)
        {
            SPRITE.pos2.x = 0;
            SPRITE.pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
    else
    {
        TASK.data[3]--;
    }
}


void sub_80A7FA0(u8 taskId)
{
    u8 sprite;
    bool8 r6;
    u8 side;
    r6 = 0;
    if (gBattleAnimArgs[0] < 4)
    {
        sprite = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
        if (sprite == 0xff)
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
    else if (gBattleAnimArgs[0] != 8)
    {
        switch (gBattleAnimArgs[0])
        {
        case 4:
            side = GetBankByPlayerAI(0);
            break;
        case 5:
            side = GetBankByPlayerAI(2);
            break;
        case 6:
            side = GetBankByPlayerAI(1);
            break;
        case 7:
        default:
            side = GetBankByPlayerAI(3);
            break;
        }
        if (b_side_obj__get_some_boolean(side) == FALSE)
        {
            r6 = 1;
        }
        sprite = gObjectBankIDs[side];
    }
    else
    {
        sprite = gObjectBankIDs[gBattleAnimPlayerMonIndex];
    }
    if (r6)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
    gSprites[sprite].pos2.x = gBattleAnimArgs[1];
    gSprites[sprite].pos2.y = gBattleAnimArgs[2];
    TASK.data[0] = sprite;
    TASK.data[1] = gBattleAnimArgs[3];
    TASK.data[2] = gBattleAnimArgs[4];
    TASK.data[3] = gBattleAnimArgs[4];
    TASK.data[4] = gBattleAnimArgs[1];
    TASK.data[5] = gBattleAnimArgs[2];
    TASK.func = sub_80A808C;
    sub_80A808C(taskId);
}

static void sub_80A808C(u8 taskId)
{
    if (TASK.data[3] == 0)
    {
        if (SPRITE.pos2.x == TASK.data[4])
        {
            SPRITE.pos2.x = -TASK.data[4];
        }
        else
        {
            SPRITE.pos2.x = TASK.data[4];
        }
        if (SPRITE.pos2.y == TASK.data[5])
        {
            SPRITE.pos2.y = -TASK.data[5];
        }
        else
        {
            SPRITE.pos2.y = TASK.data[5];
        }
        TASK.data[3] = TASK.data[2];
        if (--TASK.data[1] == 0)
        {
            SPRITE.pos2.x = 0;
            SPRITE.pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
    else
    {
        TASK.data[3]--;
    }
}

void sub_80A8154(u8 taskId)
{
    u8 sprite;
    sprite = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
    if (sprite == 0xff)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
    gSprites[sprite].pos2.x += gBattleAnimArgs[1];
    gSprites[sprite].pos2.y += gBattleAnimArgs[2];
    TASK.data[0] = sprite;
    TASK.data[1] = 0;
    TASK.data[2] = gBattleAnimArgs[3];
    TASK.data[3] = 0;
    TASK.data[4] = gBattleAnimArgs[4];
    TASK.data[5] = gBattleAnimArgs[1] * 2;
    TASK.data[6] = gBattleAnimArgs[2] * 2;
    TASK.func = sub_80A81D8;
    sub_80A81D8(taskId);
}

static void sub_80A81D8(u8 taskId)
{
    if (TASK.data[3] == 0)
    {
        if (TASK.data[1] & 1)
        {
            SPRITE.pos2.x += TASK.data[5];
            SPRITE.pos2.y += TASK.data[6];
        }
        else
        {
            SPRITE.pos2.x -= TASK.data[5];
            SPRITE.pos2.y -= TASK.data[6];
        }
        TASK.data[3] = TASK.data[4];
        if (++TASK.data[1] >= TASK.data[2])
        {
            if (TASK.data[1] & 1)
            {
                SPRITE.pos2.x += TASK.data[5] / 2;
                SPRITE.pos2.y += TASK.data[6] / 2;
            }
            else
            {
                SPRITE.pos2.x -= TASK.data[5] / 2;
                SPRITE.pos2.y -= TASK.data[6] / 2;
            }
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
    else
    {
        TASK.data[3]--;
    }
}

void sub_80A8314(u8 taskId)
{
    u8 sprite = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
    gSprites[sprite].pos2.x = gBattleAnimArgs[1];
    TASK.data[0] = sprite;
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[3];
    TASK.data[4] = gBattleAnimArgs[4];
    TASK.func = sub_80A8374;
    sub_80A8374(taskId);
}

static void sub_80A8374(u8 taskId)
{
    s16 x;
    u8 sprite;
    sprite = TASK.data[0];
    x = TASK.data[1];
    if (TASK.data[2] == TASK.data[8]++)
    {
        TASK.data[8] = 0;
        if (gSprites[sprite].pos2.x == x)
        {
            x = -x;
        }
        gSprites[sprite].pos2.x += x;
    }
    TASK.data[1] = x;
    TASK.data[9] += TASK.data[3];
    gSprites[sprite].pos2.y = TASK.data[9] >> 8;
    if (--TASK.data[4] == 0)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
}

void sub_80A8408(u8 taskId)
{
    u8 i;
    u8 sprite;
    u8 v1;
    v1 = 1;
    sprite = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
    if (gBattleAnimArgs[4] > 5)
    {
        gBattleAnimArgs[4] = 5;
    }
    for (i = 0; i < gBattleAnimArgs[4]; i++)
    {
        v1 <<= 1;
    }
    TASK.data[0] = sprite;
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[3];
    TASK.data[4] = v1;
    TASK.func = sub_80A8488;
    sub_80A8488(taskId);
}

static void sub_80A8488(u8 taskId)
{
    u8 sprite;
    sprite = TASK.data[0];
    gSprites[sprite].pos2.x = Sin(TASK.data[5], TASK.data[1]);
    gSprites[sprite].pos2.y = -Cos(TASK.data[5], TASK.data[2]);
    gSprites[sprite].pos2.y += TASK.data[2];
    TASK.data[5] += TASK.data[4];
    TASK.data[5] &= 0xff;
    if (TASK.data[5] == 0)
    {
        TASK.data[3]--;
    }
    if (TASK.data[3] == 0)
    {
        gSprites[sprite].pos2.x = 0;
        gSprites[sprite].pos2.y = 0;
        DestroyAnimVisualTask(taskId);
        return;
    }
}

void sub_80A8500(u8 taskId)
{
    if (GetBankSide(gBattleAnimPlayerMonIndex))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    }
    sub_80A8408(taskId);
}

void sub_80A8530(struct Sprite *sprite)
{
    sprite->invisible = TRUE;
    if (GetBankSide(gBattleAnimPlayerMonIndex))
    {
        sprite->data1 = -gBattleAnimArgs[1];
    }
    else
    {
        sprite->data1 = gBattleAnimArgs[1];
    }
    sprite->data0 = gBattleAnimArgs[0];
    sprite->data2 = 0;
    sprite->data3 = gObjectBankIDs[gBattleAnimPlayerMonIndex];
    sprite->data4 = gBattleAnimArgs[0];
    oamt_set_x3A_32(sprite, sub_80A85A4);
    sprite->callback = sub_8078458;
}

static void sub_80A85A4(struct Sprite *sprite)
{
    sprite->data0 = sprite->data4;
    sprite->data1 = -sprite->data1;
    sprite->callback = sub_8078458;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80A85C8(struct Sprite *sprite)
{
    u8 spriteId;
    sprite->invisible = TRUE;
    spriteId = obj_id_for_side_relative_to_move(gBattleAnimArgs[2]);
    sprite->data0 = gBattleAnimArgs[0];
    sprite->data1 = 0;
    sprite->data2 = gBattleAnimArgs[1];
    sprite->data3 = spriteId;
    sprite->data4 = gBattleAnimArgs[0];
    oamt_set_x3A_32(sprite, sub_80A8614);
    sprite->callback = sub_8078458;
}

void sub_80A8614(struct Sprite *sprite)
{
    sprite->data0 = sprite->data4;
    sprite->data2 = -sprite->data2;
    sprite->callback = sub_8078458;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80A8638(struct Sprite *sprite)
{
    int something;
    int spriteId;
    if (!gBattleAnimArgs[0])
    {
        spriteId = gObjectBankIDs[gBattleAnimPlayerMonIndex];
    }
    else
    {
        spriteId = gObjectBankIDs[gBattleAnimEnemyMonIndex];
    }
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data1 = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x;
    sprite->data2 = gSprites[spriteId].pos1.x;
    sprite->data3 = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y;
    sprite->data4 = gSprites[spriteId].pos1.y;
    something = 0;
    sub_8078A5C(sprite);
    sprite->data3 = something;
    sprite->data4 = something;
    sprite->data5 = gSprites[spriteId].pos2.x;
    sprite->data6 = gSprites[spriteId].pos2.y;
    sprite->invisible = TRUE;
    if (gBattleAnimArgs[1] == 1)
    {
        sprite->data2 = something;
    }
    else if (gBattleAnimArgs[1] == 2)
    {
        sprite->data1 = something;
    }
    sprite->data7 = gBattleAnimArgs[1];
    sprite->data7 |= spriteId << 8;
    sprite->callback = sub_80A86F4;
}

static void sub_80A86F4(struct Sprite *sprite)
{
    s8 spriteId;
    u8 lo;
    struct Sprite *sprite2;
    lo = sprite->data7 & 0xff;
    spriteId = sprite->data7 >> 8;
    sprite2 = &gSprites[spriteId];
    if (sprite->data0 == 0)
    {
        if (lo < 2)
        {
            sprite2->pos2.x = 0;
        }
        if (lo == 2 || lo == 0)
        {
            sprite2->pos2.y = 0;
        }
        move_anim_8072740(sprite);
    }
    else
    {
        sprite->data0--;
        sprite->data3 += sprite->data1;
        sprite->data4 += sprite->data2;
        sprite2->pos2.x = (s8)(sprite->data3 >> 8) + sprite->data5;
        sprite2->pos2.y = (s8)(sprite->data4 >> 8) + sprite->data6;
    }
}

void sub_80A8764(struct Sprite *sprite)
{
    u8 v1;
    u8 spriteId;
    if (!gBattleAnimArgs[0])
    {
        v1 = gBattleAnimPlayerMonIndex;
    }
    else
    {
        v1 = gBattleAnimEnemyMonIndex;
    }
    spriteId = gObjectBankIDs[v1];
    if (GetBankSide(v1))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        if (gBattleAnimArgs[3] == 1)
        {
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        }
    }
    sprite->data0 = gBattleAnimArgs[4];
    sprite->data1 = gSprites[spriteId].pos1.x;
    sprite->data2 = gSprites[spriteId].pos1.x + gBattleAnimArgs[1];
    sprite->data3 = gSprites[spriteId].pos1.y;
    sprite->data4 = gSprites[spriteId].pos1.y + gBattleAnimArgs[2];
    sub_8078A5C(sprite);
    sprite->data3 = 0;
    sprite->data4 = 0;
    sprite->data5 = spriteId;
    sprite->invisible = TRUE;
    oamt_set_x3A_32(sprite, move_anim_8072740);
    sprite->callback = sub_80784A8;
}

void sub_80A8818(struct Sprite *sprite)
{
    u8 spriteId;
    u8 v1;
    sprite->invisible = TRUE;
    if (!gBattleAnimArgs[0])
    {
        v1 = gBattleAnimPlayerMonIndex;
    }
    else
    {
        v1 = gBattleAnimEnemyMonIndex;
    }
    spriteId = gObjectBankIDs[v1];
    if (GetBankSide(v1))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        if (gBattleAnimArgs[3] == 1)
        {
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        }
    }
    sprite->data0 = gBattleAnimArgs[4];
    sprite->data1 = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x;
    sprite->data2 = sprite->data1 + gBattleAnimArgs[1];
    sprite->data3 = gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y;
    sprite->data4 = sprite->data3 + gBattleAnimArgs[2];
    sub_8078A5C(sprite);
    sprite->data3 = gSprites[spriteId].pos2.x << 8;
    sprite->data4 = gSprites[spriteId].pos2.y << 8;
    sprite->data5 = spriteId;
    sprite->data6 = gBattleAnimArgs[5];
    if (!gBattleAnimArgs[5])
    {
        oamt_set_x3A_32(sprite, move_anim_8072740);
    }
    else
    {
        oamt_set_x3A_32(sprite, sub_80A88F0);
    }
    sprite->callback = sub_80784A8;
}


static void sub_80A88F0(struct Sprite *sprite)
{
    gSprites[sprite->data5].pos2.x = 0;
    gSprites[sprite->data5].pos2.y = 0;
    move_anim_8072740(sprite);
}

void sub_80A8920(u8 taskId)
{
    s16 r7;
    r7 = 0x8000 / gBattleAnimArgs[3];
    if (GetBankSide(gBattleAnimPlayerMonIndex))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[5] = -gBattleAnimArgs[5];
    }
    TASK.data[0] = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
    TASK.data[1] = (gBattleAnimArgs[1] << 8) / gBattleAnimArgs[3];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[3];
    TASK.data[4] = gBattleAnimArgs[4];
    TASK.data[5] = (gBattleAnimArgs[5] << 8) / gBattleAnimArgs[6];
    TASK.data[6] = gBattleAnimArgs[6];
    TASK.data[7] = r7;
    TASK.func = sub_80A89B4;
}

static void sub_80A89B4(u8 taskId)
{
    u8 spriteId;
    spriteId = TASK.data[0];
    TASK.data[11] += TASK.data[1];
    gSprites[spriteId].pos2.x = TASK.data[11] >> 8;
    gSprites[spriteId].pos2.y = Sin((u8)(TASK.data[10] >> 8), TASK.data[2]);
    TASK.data[10] += TASK.data[7];
    if (--TASK.data[3] == 0)
    {
        TASK.func = sub_80A8A18;
    }
}

static void sub_80A8A18(u8 taskId)
{
    u8 spriteId;
    if (TASK.data[4] > 0)
    {
        TASK.data[4]--;
    }
    else
    {
        spriteId = TASK.data[0];
        TASK.data[12] += TASK.data[5];
        gSprites[spriteId].pos2.x = (TASK.data[12] >> 8) + (TASK.data[11] >> 8);
        if (--TASK.data[6] == 0)
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}

static void sub_80A8B3C(u8 taskId);

void sub_80A8A80(u8 taskId)
{
    u8 spriteId;
    switch (gBattleAnimArgs[0])
    {
    case 0:
    case 1:
        spriteId = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
        break;
    case 2:
        if (!b_side_obj__get_some_boolean(gBattleAnimPlayerMonIndex ^ 2))
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
        spriteId = gObjectBankIDs[gBattleAnimPlayerMonIndex ^ 2];
        break;
    case 3:
        if (!b_side_obj__get_some_boolean(gBattleAnimEnemyMonIndex ^ 2))
        {
            DestroyAnimVisualTask(taskId);
            return;
        }
        spriteId = gObjectBankIDs[gBattleAnimEnemyMonIndex ^ 2];
        break;
    default:
        DestroyAnimVisualTask(taskId);
        return;
    }
    TASK.data[0] = spriteId;
    if (GetBankSide(gBattleAnimEnemyMonIndex))
    {
        TASK.data[1] = gBattleAnimArgs[1];
    }
    else
    {
        TASK.data[1] = -gBattleAnimArgs[1];
    }
    TASK.func = sub_80A8B3C;
}

static void sub_80A8B3C(u8 taskId)
{
    u8 spriteId = TASK.data[0];
    gSprites[spriteId].pos2.x += TASK.data[1];
    if (gSprites[spriteId].pos2.x + gSprites[spriteId].pos1.x + 0x20 > 0x130u)
    {
        DestroyAnimVisualTask(taskId);
        return;
    }
}

void sub_80A8B88(u8 taskId)
{
    u8 spriteId;
    if (GetBankSide(gBattleAnimPlayerMonIndex))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
    }
    spriteId = obj_id_for_side_relative_to_move(gBattleAnimArgs[4]);
    TASK.data[0] = gBattleAnimArgs[0];
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[3];
    TASK.data[4] = spriteId;
    if (gBattleAnimArgs[4] == 0)
    {
        TASK.data[5] = gBattleAnimPlayerMonIndex;
    }
    else
    {
        TASK.data[5] = gBattleAnimEnemyMonIndex;
    }
    TASK.data[12] = 1;
    TASK.func = sub_80A8C0C;
}

static void sub_80A8C0C(u8 taskId)
{
    s16 y;
    u8 spriteId;
    int index;
    u16 val;
    spriteId = TASK.data[4];
    val = TASK.data[10] + TASK.data[2];
    TASK.data[10] = val;
    index = val >> 8;
    y = Sin(index, TASK.data[1]);
    if (TASK.data[0] == 0)
    {
        gSprites[spriteId].pos2.x = y;
    }
    else
    {
        if (GetBankSide(TASK.data[5]) == 0)
        {
            gSprites[spriteId].pos2.y = (y >= 0) ? y : -y;
        }
        else
        {
            gSprites[spriteId].pos2.y = (y >= 0) ? -y : y;
        }
    }
    if (((index >= 0x80u) && (TASK.data[11] == 0) && (TASK.data[12] == 1))
        || ((index < 0x7fu) && (TASK.data[11] == 1) && (TASK.data[12] == 0)))
    {
        TASK.data[11] ^= 1;
        TASK.data[12] ^= 1;
        if (--TASK.data[3] == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}

void sub_80A8D34(u8 taskId)
{
    u8 spriteId;
    spriteId = obj_id_for_side_relative_to_move(gBattleAnimArgs[3]);
    sub_8078E70(spriteId, gBattleAnimArgs[4]);
    TASK.data[0] = gBattleAnimArgs[0];
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.data[3] = gBattleAnimArgs[2];
    TASK.data[4] = spriteId;
    TASK.data[10] = 0x100;
    TASK.data[11] = 0x100;
    TASK.func = sub_80A8D8C;
}

static void sub_80A8D8C(u8 taskId)
{
    u8 spriteId;
    TASK.data[10] += TASK.data[0];
    TASK.data[11] += TASK.data[1];
    spriteId = TASK.data[4];
    obj_id_set_rotscale(spriteId, TASK.data[10], TASK.data[11], 0);
    if (--TASK.data[2] == 0)
    {
        if (TASK.data[3] > 0)
        {
            TASK.data[0] = -TASK.data[0];
            TASK.data[1] = -TASK.data[1];
            TASK.data[2] = TASK.data[3];
            TASK.data[3] = 0;
        }
        else
        {
            sub_8078F40(spriteId);
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}

void sub_80A8E04(u8 taskId)
{
    u8 spriteId;
    spriteId = obj_id_for_side_relative_to_move(gBattleAnimArgs[2]);
    sub_8078E70(spriteId, 0);
    TASK.data[1] = 0;
    TASK.data[2] = gBattleAnimArgs[0];
    if (gBattleAnimArgs[3] != 1)
    {
        TASK.data[3] = 0;
    }
    else
    {
        TASK.data[3] = gBattleAnimArgs[0] * gBattleAnimArgs[1];
    }
    TASK.data[4] = gBattleAnimArgs[1];
    TASK.data[5] = spriteId;
    TASK.data[6] = gBattleAnimArgs[3];
    if (IsContest())
    {
        TASK.data[7] = 1;
    }
    else
    {
        if (gBattleAnimArgs[2] == 0)
        {
            TASK.data[7] = !GetBankSide(gBattleAnimPlayerMonIndex);
        }
        else
        {
            TASK.data[7] = !GetBankSide(gBattleAnimEnemyMonIndex);
        }
    }
    if (TASK.data[7])
    {
        if (!IsContest())
        {
            TASK.data[3] *= -1;
            TASK.data[4] *= -1;
        }
    }
    TASK.func = sub_80A8FD8;
}

void sub_80A8EFC(u8 taskId)
{
    u8 spriteId;
    spriteId = obj_id_for_side_relative_to_move(gBattleAnimArgs[2]);
    sub_8078E70(spriteId, 0);
    TASK.data[1] = 0;
    TASK.data[2] = gBattleAnimArgs[0];
    if (gBattleAnimArgs[2] == 0)
    {
        if (GetBankSide(gBattleAnimPlayerMonIndex))
        {
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        }
    }
    else
    {
        if (GetBankSide(gBattleAnimEnemyMonIndex))
        {
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        }
    }
    if (gBattleAnimArgs[3] != 1)
    {
        TASK.data[3] = 0;
    }
    else
    {
        TASK.data[3] = gBattleAnimArgs[0] * gBattleAnimArgs[1];
    }
    TASK.data[4] = gBattleAnimArgs[1];
    TASK.data[5] = spriteId;
    TASK.data[6] = gBattleAnimArgs[3];
    TASK.data[7] = 1;
    TASK.data[3] *= -1;
    TASK.data[4] *= -1;
    TASK.func = sub_80A8FD8;
}

void sub_80A8FD8(u8 taskId)
{
    TASK.data[3] += TASK.data[4];
    obj_id_set_rotscale(TASK.data[5], 0x100, 0x100, TASK.data[3]);
    if (TASK.data[7])
    {
        sub_8078F9C(TASK.data[5]);
    }
    if (++TASK.data[1] >= TASK.data[2])
    {
        switch (TASK.data[6])
        {
        case 1:
            sub_8078F40(TASK.data[5]);
        case 0:
        default:
            DestroyAnimVisualTask(taskId);
            return;
        case 2:
            TASK.data[1] = 0;
            TASK.data[4] *= -1;
            TASK.data[6] = 1;
            break;
        }
    }
}

void sub_80A9058(u8 taskId)
{
    if (!gBattleAnimArgs[0])
    {
        TASK.data[15] = gMovePowerMoveAnim / 12;
        if (TASK.data[15] < 1)
        {
            TASK.data[15] = 1;
        }
        if (TASK.data[15] > 16)
        {
            TASK.data[15] = 16;
        }
    }
    else
    {
        TASK.data[15] = gMoveDmgMoveAnim / 12;
        if (TASK.data[15] < 1)
        {
            TASK.data[15] = 1;
        }
        if (TASK.data[15] > 16)
        {
            TASK.data[15] = 16;
        }
    }
    TASK.data[14] = TASK.data[15] / 2;
    TASK.data[13] = TASK.data[14] + (TASK.data[15] & 1);
    TASK.data[12] = 0;
    TASK.data[10] = gBattleAnimArgs[3];
    TASK.data[11] = gBattleAnimArgs[4];
    TASK.data[7] = obj_id_for_side_relative_to_move(1);
    TASK.data[8] = gSprites[TASK.data[7]].pos2.x;
    TASK.data[9] = gSprites[TASK.data[7]].pos2.y;
    TASK.data[0] = 0;
    TASK.data[1] = gBattleAnimArgs[1];
    TASK.data[2] = gBattleAnimArgs[2];
    TASK.func = sub_80A913C;
}

static void sub_80A913C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (++task->data[0] > task->data[1])
    {
        task->data[0] = 0;
        task->data[12] = (task->data[12] + 1) & 1;
        if (task->data[10])
        {
            if (task->data[12])
            {
                gSprites[task->data[7]].pos2.x = task->data[8] + task->data[13];
            }
            else
            {
                gSprites[task->data[7]].pos2.x = task->data[8] - task->data[14];
            }
        }
        if (task->data[11])
        {
            if (task->data[12])
            {
                gSprites[task->data[7]].pos2.y = task->data[15];
            }
            else
            {
                gSprites[task->data[7]].pos2.y = 0;
            }
        }
        if (!--task->data[2])
        {
            gSprites[task->data[7]].pos2.x = 0;
            gSprites[task->data[7]].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}
