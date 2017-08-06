#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "decompress.h"
#include "palette.h"
#include "rng.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimPlayerMonIndex;
extern u8 gBattleAnimEnemyMonIndex;
extern struct SpriteTemplate gSpriteTemplate_83D631C;
extern s16 gUnknown_03000728[];

void sub_80CA768(struct Sprite* sprite);
void sub_80CA8B4(struct Sprite* sprite);
void sub_80CA9F8(struct Sprite* sprite);
void sub_80CAACC(struct Sprite* sprite);
void sub_80CAB88(struct Sprite* sprite);
void sub_80CABC0(struct Sprite* sprite);
void sub_80CAC44(struct Sprite* sprite);
void sub_80CADA8(struct Sprite* sprite);
void sub_80CAE74(struct Sprite* sprite);
void sub_80CAF20(struct Sprite* sprite);
void sub_80CAF6C(struct Sprite* sprite);
void sub_80CB09C(struct Sprite* sprite);
void sub_80CB1A4(struct Sprite* sprite);
void sub_80CB298(struct Sprite* sprite);
void sub_80CB2D4(struct Sprite* sprite);
void sub_80CB710(struct Sprite* sprite);
void sub_80CBB60(struct Sprite* sprite);
void sub_80CBC8C(struct Sprite* sprite);
void sub_80CBCF8(struct Sprite* sprite);

void sub_80787B0(struct Sprite *sprite, u8 a2);
void sub_8078764(struct Sprite *sprite, u8 a2);
void sub_8078B34(struct Sprite *sprite);
void sub_8078D60(struct Sprite *sprite);
void sub_80786EC(struct Sprite *sprite);
void sub_80782D8(struct Sprite *sprite);
void sub_8078CC0(struct Sprite *sprite);
void sub_807A3FC(u8 slot, u8 a2, s16 *a3, s16 *a4);
u8 sub_8079ED4(u8 slot);
s8 sub_8076F98(s8 a);

void move_anim_8074EE0(struct Sprite *sprite);
bool8 sub_8078718(struct Sprite *sprite);
bool8 sub_8078CE8(struct Sprite *sprite);

void sub_80CB3A8(u8 taskId);
void sub_80CB438(u8 taskId);

void sub_80CA710(struct Sprite* sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data1 = gBattleAnimArgs[3];
    if (GetBankSide(gBattleAnimPlayerMonIndex))
    {
        sprite->data3 = -gBattleAnimArgs[4];
    }
    else
    {
        sprite->data3 = gBattleAnimArgs[4];
    }
    sprite->data4 = gBattleAnimArgs[5];
    sprite->callback = sub_80CA768;
}

void sub_80CA768(struct Sprite* sprite)
{
    if (sprite->data0 > 0)
    {
        sprite->data0--;
        sprite->pos2.y = sprite->data2 >> 8;
        sprite->data2 += sprite->data1;
        sprite->pos2.x = Sin(sprite->data5, sprite->data3);
        sprite->data5 = (sprite->data5 + sprite->data4) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CA7B0(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data2 = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
    sprite->data4 = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
    sprite->callback = sub_8078B34;
    oamt_set_x3A_32(sprite, move_anim_8074EE0);
}

void sub_80CA800(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[3]);
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    sprite->callback = sub_8078B34;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80CA858(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data1 = sprite->pos1.x;
    sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    sprite->data3 = sprite->pos1.y;
    sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data5 = gBattleAnimArgs[3];
    sprite->callback = sub_80CA8B4;
    sub_80CA8B4(sprite);
}

void sub_80CA8B4(struct Sprite* sprite)
{
    if(sub_8078B5C(sprite))
    {
        DestroySprite(sprite);
    }
    else
    {
        if(sprite->data5 > 0x7F)
        {
            sprite->subpriority = sub_8079E90(gBattleAnimEnemyMonIndex) + 1;
        }
        else
        {
            sprite->subpriority = sub_8079E90(gBattleAnimEnemyMonIndex) + 6;
        }
        sprite->pos2.x += Sin(sprite->data5, 5);
        sprite->pos2.y += Cos(sprite->data5, 14);
        sprite->data5 = (sprite->data5 + 15) & 0xFF;
    }
}

void sub_80CA928(u8 taskId)
{
    gTasks[taskId].data[0]--;
    if (gTasks[taskId].data[0] == -1)
    {
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 6;
        gBattleAnimArgs[0] = 15;
        gBattleAnimArgs[1] = 0;
        gBattleAnimArgs[2] = 80;
        gBattleAnimArgs[3] = 0;
        CreateSpriteAndAnimate(&gSpriteTemplate_83D631C, 0, 0, sub_8079E90(gBattleAnimEnemyMonIndex) + 1);
    }
    if (gTasks[taskId].data[1] == 15) DestroyAnimVisualTask(taskId);
}

void sub_80CA9A8(struct Sprite* sprite)
{
    sub_8078764(sprite, 1);
    sprite->data0 = gBattleAnimArgs[3];
    sprite->data2 = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
    sprite->data4 = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
    sprite->data5 = gBattleAnimArgs[2];
    sub_80786EC(sprite);
    sprite->callback = sub_80CA9F8;
}

void sub_80CA9F8(struct Sprite* sprite)
{
    if (sub_8078718(sprite)) move_anim_8072740(sprite);
}

void sub_80CAA14(struct Sprite* sprite)
{
    u16 a = Random();
    u16 b;
    
    StartSpriteAnim(sprite, a & 7);
    sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
    if (GetBankSide(gBattleAnimPlayerMonIndex))
    {
        sprite->pos1.x -= 20;
    }
    else
    {
        sprite->pos1.x += 20;
    }
    b = Random();
    sprite->data0 = (b & 31) + 64;
    sprite->data1 = sprite->pos1.x;
    sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    sprite->data3 = sprite->pos1.y;
    sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    sub_8078D60(sprite);
    sprite->data5 = Random() & 0xFF;
    sprite->data6 = sprite->subpriority;
    sprite->callback = sub_80CAACC;
    sub_80CAACC(sprite);
}

void sub_80CAACC(struct Sprite* sprite)
{
    if (sub_8078CE8(sprite))
    {
        move_anim_8072740(sprite);
    }
    else
    {
        sprite->pos2.y += Cos(sprite->data5, 12);
        if (sprite->data5 <= 0x7E)
        {
            sprite->subpriority = sprite->data6;
        }
        else
        {
            sprite->subpriority = sprite->data6 + 1;
        }
        sprite->data5 = (sprite->data5 + 24) & 0xFF;
    }
}

void sub_80CAB18(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    if(GetBankSide(gBattleAnimPlayerMonIndex))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data0 = gBattleAnimArgs[4];
    sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 0) + gBattleAnimArgs[2];
    sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 1) + gBattleAnimArgs[3];
    sprite->data5 = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    sprite->callback = sub_80CAB88;
}

void sub_80CAB88(struct Sprite* sprite)
{
    if(sub_8078718(sprite))
    {
        sprite->invisible = 1;
        sprite->data0 = 10;
        sprite->callback = sub_80782D8;
        oamt_set_x3A_32(sprite, sub_80CABC0);
    }
}

void sub_80CABC0(struct Sprite* sprite)
{
    sprite->invisible = 0;
    StartSpriteAnim(sprite, 1);
    sprite->data0 = 60;
    sprite->callback = sub_80782D8;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80CABF8(struct Sprite* sprite)
{
    sub_8078764(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    if (gBattleAnimArgs[4] == 1)
    {
        sprite->oam.objMode = 1;
    }
    sprite->data0 = gBattleAnimArgs[3];
    sprite->data1 = gBattleAnimArgs[2];
    sprite->callback = sub_80CAC44;
    sub_80CAC44(sprite);
}

void sub_80CAC44(struct Sprite* sprite)
{

    u8 b;
    
    sprite->pos2.x = Sin(sprite->data1, 32);
    sprite->pos2.y = Cos(sprite->data1, -3) + ((sprite->data2 += 24) >> 8);
    if ((u16)(sprite->data1 - 0x40) < 0x80)
    {
        sprite->oam.priority = (sub_8079ED4(gBattleAnimEnemyMonIndex) & 3);
    }
    else
    {
        b = sub_8079ED4(gBattleAnimEnemyMonIndex) + 1;
        if ( b > 3)
        {
            b = 3;
        }
        sprite->oam.priority = b;
    }
    sprite->data1 = (sprite->data1 + 2) & 0xFF;
    sprite->data0--;
    if (sprite->data0 == -1) move_anim_8072740(sprite);
}

void sub_80CACEC(u8 taskId)
{
    if(IsContest() || !IsDoubleBattle())
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        if (GetBankIdentity_permutated(gBattleAnimEnemyMonIndex) == 1)
        {
            REG_BG2CNT_BITFIELD.priority = 3;
        }
        else
        {
            REG_BG1CNT_BITFIELD.priority = 1;
        }
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80CAD54(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    sprite->data0 = gBattleAnimArgs[3];
    sprite->data1 = sprite->pos1.x;
    sprite->data2 = sprite->pos1.x;
    sprite->data3 = sprite->pos1.y;
    sprite->data4 = sub_8077ABC(gBattleAnimPlayerMonIndex, 3) + gBattleAnimArgs[2];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data5 = 0x40;
    sprite->callback = sub_80CADA8;
    sub_80CADA8(sprite);
}

void sub_80CADA8(struct Sprite* sprite)
{
    if(!sub_8078B5C(sprite))
    {
        sprite->pos2.x += Sin(sprite->data5, 32);
        sprite->pos2.y += Cos(sprite->data5, -5);
        if ((u16)(sprite->data5 - 0x40) < 0x80)
        {
            sprite->subpriority = sub_8079E90(gBattleAnimPlayerMonIndex) - 1;
        }
        else
        {
            sprite->subpriority = sub_8079E90(gBattleAnimPlayerMonIndex) + 1;
        }
        sprite->data5 = (sprite->data5 + 5) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CAE20(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data0 = gBattleAnimArgs[3];
    sprite->data1 = sprite->pos1.x;
    sprite->data2 = sprite->pos1.x;
    sprite->data3 = sprite->pos1.y;
    sprite->data4 = sub_8077ABC(gBattleAnimPlayerMonIndex, 3) + gBattleAnimArgs[2];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data5 = 0x40;
    sprite->callback = sub_80CAE74;
    sub_80CAE74(sprite);
}

void sub_80CAE74(struct Sprite* sprite)
{
    if(!sub_8078B5C(sprite))
    {
        sprite->pos2.x += Sin(sprite->data5, 8);
        if ((u16)(sprite->data5 - 0x3B) < 5 || (u16)(sprite->data5 - 0xBB) < 5)
        {
            sprite->oam.matrixNum ^= 8;
        }
        sprite->data5 = (sprite->data5 + 5) & 0xFF;
    }
    else
    {
       move_anim_8072740(sprite);
    }
}

void sub_80CAED8(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
    sprite->data0 = gBattleAnimArgs[0];
    sprite->data1 = gBattleAnimArgs[1];
    sprite->data2 = gBattleAnimArgs[2];
    sprite->callback = sub_80CAF20;
}

void sub_80CAF20(struct Sprite* sprite)
{
    if(!sprite->data2)
    {
        if(sprite->data1 & 1)
        {
            sprite->data0 = 0x80;
            sprite->data1 = 0;
            sprite->data2 = 0;
        }
        else
        {
            sprite->data0 = sprite->data1 & 1;
            sprite->data1 = sprite->data1 & 1;
            sprite->data2 = sprite->data1 & 1;
        }
        sprite->callback = sub_80CAF6C;
    }
    else
    {
        sprite->data2--;
        sprite->pos1.x += sprite->data0;
        sprite->pos1.y += sprite->data1;
    }
}

void sub_80CAF6C(struct Sprite* sprite)
{
    if(GetBankSide(gBattleAnimPlayerMonIndex))
    {
        sprite->pos2.x = -Sin(sprite->data0, 0x19);
    }
    else
    {
        sprite->pos2.x = Sin(sprite->data0, 0x19);
    }
    sprite->data0 = (sprite->data0 + 2) & 0xFF;
    sprite->data1++;
    if(!(sprite->data1 & 1))
    {
        sprite->pos2.y++;
    }
    if(sprite->data1 > 0x50)
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CAFD0(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    if(GetBankSide(gBattleAnimPlayerMonIndex))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data0 = gBattleAnimArgs[4];
    if(!(gBattleAnimArgs[6]))
    {
        sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + gBattleAnimArgs[2];
        sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + gBattleAnimArgs[3];
    }
    else
    {
        sub_807A3FC(gBattleAnimEnemyMonIndex, 1, &sprite->data2, &sprite->data4);
        sprite->data2 += gBattleAnimArgs[2];
        sprite->data4 += gBattleAnimArgs[3];
    }
    sprite->data5 = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    if(GetBankSide(gBattleAnimPlayerMonIndex) == GetBankSide(gBattleAnimEnemyMonIndex))
    {
        sprite->data0 = 1;
    }
    else
    {
        sprite->data0 = 0;
    }
    sprite->callback = sub_80CB09C;
}

#ifdef NONMATCHING
void sub_80CB09C(struct Sprite* sprite)
{
    s16 c = 0;
    s16 a = sprite->data0;
    s16 b = sprite->data7;
    sprite->data0 = 1;
    sub_8078718(sprite);
    sprite->data0 = a;
    if (b > 0xC8 && sprite->data7 <= 0x37 && sprite->oam.affineParam == 0)
    sprite->oam.affineParam++;
    if (sprite->oam.affineParam != 0 && sprite->data0 != 0)
    {
        sprite->invisible ^= 1;
        sprite->oam.affineParam++;
        if(sprite->oam.affineParam == 0x1E)
        {
            c = 1;
        }
    }
    if((sprite->pos1.x + sprite->pos2.x + 16) <= 0x110 && (sprite->pos1.y + sprite->pos2.y) <= 0xA0 && (sprite->pos1.y + sprite->pos2.y) < -16)
    {
        c = 1;
    }
    if (!c) move_anim_8072740(sprite);
}
#else
__attribute__((naked))
void sub_80CB09C(struct Sprite* sprite)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    adds r6, r0, 0\n\
    movs r7, 0\n\
    ldrh r5, [r6, 0x2E]\n\
    ldrh r4, [r6, 0x3C]\n\
    movs r0, 0x1\n\
    strh r0, [r6, 0x2E]\n\
    adds r0, r6, 0\n\
    bl sub_8078718\n\
    ldrh r0, [r6, 0x3C]\n\
    strh r5, [r6, 0x2E]\n\
    lsls r4, 16\n\
    asrs r4, 16\n\
    cmp r4, 0xC8\n\
    ble _080CB0CE\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x37\n\
    bgt _080CB0CE\n\
    ldrh r0, [r6, 0x6]\n\
    cmp r0, 0\n\
    bne _080CB0D4\n\
    adds r0, 0x1\n\
    strh r0, [r6, 0x6]\n\
_080CB0CE:\n\
    ldrh r0, [r6, 0x6]\n\
    cmp r0, 0\n\
    beq _080CB106\n\
_080CB0D4:\n\
    movs r1, 0x2E\n\
    ldrsh r0, [r6, r1]\n\
    cmp r0, 0\n\
    beq _080CB106\n\
    adds r3, r6, 0\n\
    adds r3, 0x3E\n\
    ldrb r2, [r3]\n\
    lsls r0, r2, 29\n\
    lsrs r0, 31\n\
    movs r1, 0x1\n\
    eors r1, r0\n\
    lsls r1, 2\n\
    movs r0, 0x5\n\
    negs r0, r0\n\
    ands r0, r2\n\
    orrs r0, r1\n\
    strb r0, [r3]\n\
    ldrh r0, [r6, 0x6]\n\
    adds r0, 0x1\n\
    strh r0, [r6, 0x6]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x1E\n\
    bne _080CB106\n\
    movs r7, 0x1\n\
_080CB106:\n\
    movs r2, 0x20\n\
    ldrsh r0, [r6, r2]\n\
    movs r2, 0x24\n\
    ldrsh r1, [r6, r2]\n\
    adds r0, r1\n\
    adds r0, 0x10\n\
    movs r1, 0x88\n\
    lsls r1, 1\n\
    cmp r0, r1\n\
    bhi _080CB130\n\
    movs r0, 0x22\n\
    ldrsh r1, [r6, r0]\n\
    movs r2, 0x26\n\
    ldrsh r0, [r6, r2]\n\
    adds r1, r0\n\
    cmp r1, 0xA0\n\
    bgt _080CB130\n\
    movs r0, 0x10\n\
    negs r0, r0\n\
    cmp r1, r0\n\
    bge _080CB132\n\
_080CB130:\n\
    movs r7, 0x1\n\
_080CB132:\n\
    cmp r7, 0\n\
    beq _080CB13C\n\
    adds r0, r6, 0\n\
    bl move_anim_8072740\n\
_080CB13C:\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif

void sub_80CB144(struct Sprite* sprite)
{
    if(!IsContest() && IsDoubleBattle() == TRUE)
    {
        sub_807A3FC(gBattleAnimEnemyMonIndex, 1, &sprite->pos1.x, &sprite->pos1.y);
    }
    sprite->pos1.y += 32;
    sprite->data0 = gBattleAnimArgs[0];
    sprite->data1 = gBattleAnimArgs[1];
    sprite->data2 = gBattleAnimArgs[2];
    sprite->data3 = gBattleAnimArgs[3];
    sprite->data4 = gBattleAnimArgs[4];
    sprite->callback = sub_80CB1A4;
}

void sub_80CB1A4(struct Sprite* sprite)
{
    if(sprite->data1 == 0xFF)
    {
        sprite->pos1.y -= 2;
    }
    else if(sprite->data1 > 0)
    {
        sprite->pos1.y -= 2;
        sprite->data1 -= 2;
    }
    sprite->data5 += sprite->data2;
    if(sprite->data0 < sprite->data4) sprite->data5 += sprite->data2;
    sprite->data5 &= 0xFF;
    sprite->pos2.x = Cos(sprite->data5, sprite->data3);
    sprite->pos2.y = Sin(sprite->data5, 5);
    if(sprite->data5 <= 0x7F)
    {
        sprite->oam.priority = sub_8079ED4(gBattleAnimEnemyMonIndex) - 1;
    }
    else
    {
        sprite->oam.priority = sub_8079ED4(gBattleAnimEnemyMonIndex) + 1;
    }
    sprite->data0--;
    if(!sprite->data0) move_anim_8072740(sprite);
}

void sub_80CB25C(struct Sprite* sprite)
{
    sub_8078764(sprite, 0);
    sprite->affineAnimPaused = 1;
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[2]);
    sprite->data6 = gBattleAnimArgs[2];
    sprite->data7 = gBattleAnimArgs[3];
    sprite->callback = sub_80CB298;
}

void sub_80CB298(struct Sprite* sprite)
{
    if((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->affineAnimPaused = 0;
        obj_id_for_side_relative_to_move(1);
        sprite->data0 = 0x100;
        sprite->callback = sub_80CB2D4;
    }
}

void sub_80CB2D4(struct Sprite* sprite)
{
    obj_id_for_side_relative_to_move(1);
    if(!sprite->data2)
    {
        sprite->data0 += 11;
    }
    else
    {
        sprite->data0 -= 11;
    }
    sprite->data1++;
    if(sprite->data1 == 6)
    {
        sprite->data1 = 0;
        sprite->data2 ^= 1;
    }
    if(sprite->affineAnimEnded)
    {
        sprite->data7--;
        if(sprite->data7 > 0)
        {
            StartSpriteAffineAnim(sprite, sprite->data6);
        }
        else
        {
            move_anim_8072740(sprite);
        }
    }
}

void sub_80CB340(u8 taskId)
{
    u8 spriteId = obj_id_for_side_relative_to_move(1);
    if(gSprites[spriteId].invisible)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        sub_8078E70(spriteId, 1);
        gTasks[taskId].data[0] = gBattleAnimArgs[0];
        gTasks[taskId].data[1] = gBattleAnimArgs[1];
        gTasks[taskId].data[11] = 256;
        gTasks[taskId].func = sub_80CB3A8;
    }
}

void sub_80CB3A8(u8 taskId)
{
    u8 spriteId = obj_id_for_side_relative_to_move(1);
    gTasks[taskId].data[10] += gTasks[taskId].data[0];
    gSprites[spriteId].pos2.x = gTasks[taskId].data[10] >> 8;
    if(GetBankSide(gBattleAnimEnemyMonIndex))
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
    }
    gTasks[taskId].data[11] += 16;
    obj_id_set_rotscale(spriteId, gTasks[taskId].data[11], gTasks[taskId].data[11], 0);
    sub_8079A64(spriteId);
    gTasks[taskId].data[1]--;
    if(!gTasks[taskId].data[1])
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_80CB438;
    }
}

#ifdef NONMATCHING
void sub_80CB438(u8 taskId)
{
    if((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        if(!gTasks[taskId].data[0])
        {
            u8 spriteId = obj_id_for_side_relative_to_move(1);
            sub_8078F40(spriteId);
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            gTasks[taskId].data[0]++;
        }
        else
        {
            gTasks[taskId].data[0]++;
            
        }
    }
    else if(gTasks[taskId].data[0])
    {
        gTasks[taskId].data[0]++;
    }
    if(gTasks[taskId].data[0] == 3) DestroyAnimVisualTask(taskId);
}
#else
__attribute__((naked))
void sub_80CB438(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    ldr r0, _080CB484 @ =gBattleAnimArgs\n\
    ldrh r1, [r0, 0xE]\n\
    ldr r0, _080CB488 @ =0x0000ffff\n\
    cmp r1, r0\n\
    bne _080CB494\n\
    ldr r0, _080CB48C @ =gTasks\n\
    lsls r2, r3, 2\n\
    adds r1, r2, r3\n\
    lsls r1, 3\n\
    adds r6, r1, r0\n\
    movs r1, 0x8\n\
    ldrsh r5, [r6, r1]\n\
    adds r4, r0, 0\n\
    cmp r5, 0\n\
    bne _080CB4A8\n\
    movs r0, 0x1\n\
    bl obj_id_for_side_relative_to_move\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    adds r0, r4, 0\n\
    bl sub_8078F40\n\
    ldr r1, _080CB490 @ =gSprites\n\
    lsls r0, r4, 4\n\
    adds r0, r4\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    strh r5, [r0, 0x24]\n\
    strh r5, [r0, 0x26]\n\
    ldrh r0, [r6, 0x8]\n\
    adds r0, 0x1\n\
    strh r0, [r6, 0x8]\n\
    b _080CB4C2\n\
    .align 2, 0\n\
_080CB484: .4byte gBattleAnimArgs\n\
_080CB488: .4byte 0x0000ffff\n\
_080CB48C: .4byte gTasks\n\
_080CB490: .4byte gSprites\n\
_080CB494:\n\
    ldr r1, _080CB4C8 @ =gTasks\n\
    lsls r2, r3, 2\n\
    adds r0, r2, r3\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    movs r4, 0x8\n\
    ldrsh r0, [r0, r4]\n\
    adds r4, r1, 0\n\
    cmp r0, 0\n\
    beq _080CB4C2\n\
_080CB4A8:\n\
    adds r1, r2, r3\n\
    lsls r1, 3\n\
    adds r1, r4\n\
    ldrh r0, [r1, 0x8]\n\
    adds r0, 0x1\n\
    strh r0, [r1, 0x8]\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x3\n\
    bne _080CB4C2\n\
    adds r0, r3, 0\n\
    bl DestroyAnimVisualTask\n\
_080CB4C2:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080CB4C8: .4byte gTasks\n\
    .syntax divided\n");
}
#endif

void sub_80CB4CC(struct Sprite* sprite)
{
    switch(sprite->data0)
    {
        case 0:
        {
            if(GetBankSide(gBattleAnimEnemyMonIndex) == 0)
            {
                s16 a = gBattleAnimArgs[0];
                gBattleAnimArgs[0] = -a;
            }
            sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 0) + gBattleAnimArgs[0];
            sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 1) + gBattleAnimArgs[1];
            sprite->invisible = 1;
            sprite->data0++;
            break;
        }
        case 1:
        {
            sprite->invisible = 0;
            if(sprite->affineAnimEnded)
            {
                ChangeSpriteAffineAnim(sprite, 1);
                sprite->data0 = 25;
                sprite->data2 = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
                sprite->data4 = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
                sprite->callback = sub_8078CC0;
                oamt_set_x3A_32(sprite, move_anim_8072740);
                break;
            }
        }
    }
}

void sub_80CB59C(struct Sprite* sprite)
{
    if(!sprite->data0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
        sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 1);
        sprite->pos2.x = gBattleAnimArgs[0];
        sprite->pos2.y = gBattleAnimArgs[1];
        sprite->subpriority = gBattleAnimArgs[2] + 30;
        StartSpriteAnim(sprite, gBattleAnimArgs[3]);
        sprite->data2 = gBattleAnimArgs[4];
        sprite->data0++;
        if((sprite->pos1.y + sprite->pos2.y) > 120)
        {
            sprite->pos1.y += -120 + (sprite->pos2.y + sprite->pos1.y);
        }
    }
    sprite->callback = sub_80CB710;
}

#ifdef NONMATCHING
void sub_80CB620(struct Sprite* sprite)
{
    u8 p1 = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
    u8 p2 = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
    u8 e1 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    u8 e2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    e1 -= p1;
    e2 -= p2;
    sprite->pos1.x = p1 + ((gBattleAnimArgs[0] * e1) / 100);
    sprite->pos1.y = p2 + ((gBattleAnimArgs[0] * e2) / 100);
    sprite->pos2.x = gBattleAnimArgs[1];
    sprite->pos2.y = gBattleAnimArgs[2];
    sprite->subpriority = gBattleAnimArgs[3] + 30;
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    sprite->data2 = gBattleAnimArgs[5];
    sprite->callback = sub_80CB710;
    gUnknown_03000728[0] = sprite->pos1.x;
    gUnknown_03000728[1] = sprite->pos1.y;
    gUnknown_03000728[2] = e1;
    gUnknown_03000728[3] = e2;
}
#else
__attribute__((naked))
void sub_80CB620(struct Sprite* sprite)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    mov r6, r10\n\
    mov r5, r9\n\
    mov r4, r8\n\
    push {r4-r6}\n\
    sub sp, 0x4\n\
    mov r9, r0\n\
    ldr r4, _080CB6FC @ =gBattleAnimPlayerMonIndex\n\
    ldrb r0, [r4]\n\
    movs r1, 0x2\n\
    bl sub_8077ABC\n\
    adds r5, r0, 0\n\
    lsls r5, 24\n\
    lsrs r5, 24\n\
    ldrb r0, [r4]\n\
    movs r1, 0x3\n\
    bl sub_8077ABC\n\
    mov r8, r0\n\
    mov r0, r8\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    ldr r6, _080CB700 @ =gBattleAnimEnemyMonIndex\n\
    ldrb r0, [r6]\n\
    movs r1, 0x2\n\
    bl sub_8077ABC\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    ldrb r0, [r6]\n\
    movs r1, 0x3\n\
    bl sub_8077ABC\n\
    adds r2, r0, 0\n\
    lsls r2, 24\n\
    subs r4, r5\n\
    lsls r4, 16\n\
    lsrs r2, 24\n\
    mov r1, r8\n\
    subs r2, r1\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    lsrs r3, r4, 16\n\
    mov r10, r3\n\
    asrs r4, 16\n\
    ldr r6, _080CB704 @ =gBattleAnimArgs\n\
    movs r1, 0\n\
    ldrsh r0, [r6, r1]\n\
    muls r0, r4\n\
    movs r1, 0x64\n\
    str r2, [sp]\n\
    bl __divsi3\n\
    adds r5, r0\n\
    mov r3, r9\n\
    strh r5, [r3, 0x20]\n\
    ldr r2, [sp]\n\
    lsls r0, r2, 16\n\
    asrs r0, 16\n\
    movs r3, 0\n\
    ldrsh r1, [r6, r3]\n\
    muls r0, r1\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    add r8, r0\n\
    mov r1, r8\n\
    mov r0, r9\n\
    strh r1, [r0, 0x22]\n\
    ldrh r0, [r6, 0x2]\n\
    mov r3, r9\n\
    strh r0, [r3, 0x24]\n\
    ldrh r0, [r6, 0x4]\n\
    strh r0, [r3, 0x26]\n\
    ldrb r0, [r6, 0x6]\n\
    adds r0, 0x1E\n\
    mov r1, r9\n\
    adds r1, 0x43\n\
    strb r0, [r1]\n\
    ldrb r1, [r6, 0x8]\n\
    mov r0, r9\n\
    bl StartSpriteAnim\n\
    ldrh r0, [r6, 0xA]\n\
    mov r1, r9\n\
    strh r0, [r1, 0x32]\n\
    ldr r0, _080CB708 @ =sub_80CB710\n\
    str r0, [r1, 0x1C]\n\
    ldr r1, _080CB70C @ =gUnknown_03000728\n\
    mov r3, r9\n\
    ldrh r0, [r3, 0x20]\n\
    strh r0, [r1]\n\
    ldrh r0, [r3, 0x22]\n\
    strh r0, [r1, 0x2]\n\
    mov r0, r10\n\
    strh r0, [r1, 0x4]\n\
    ldr r2, [sp]\n\
    strh r2, [r1, 0x6]\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080CB6FC: .4byte gBattleAnimPlayerMonIndex\n\
_080CB700: .4byte gBattleAnimEnemyMonIndex\n\
_080CB704: .4byte gBattleAnimArgs\n\
_080CB708: .4byte sub_80CB710\n\
_080CB70C: .4byte gUnknown_03000728\n\
    .syntax divided\n");
}
#endif

void sub_80CB710(struct Sprite* sprite)
{
    if(++sprite->data0 > (sprite->data2 - 10))
    {
        sprite->invisible = sprite->data0 % 2;
    }
    if(sprite->data0 > sprite->data2) move_anim_8072740(sprite);
}

void sub_80CB768(struct Sprite* sprite)
{
    if(!sprite->data0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 1) + gBattleAnimArgs[1];
        sprite->data1 = gBattleAnimArgs[2];
        sprite->data2 = gBattleAnimArgs[3];
        sprite->data3 = gBattleAnimArgs[4];
    }
    sprite->data0++;
    sprite->pos2.x = sprite->data1 * sprite->data0;
    sprite->pos2.y = Sin((sprite->data0 * 20) & 0xFF, sprite->data2);
    if(sprite->data0 > sprite->data3) move_anim_8072740(sprite);
}

void sub_80CB7EC(struct Sprite* sprite, s16 c)
{
    s32 a = (sprite->pos1.x * 256) | sprite->pos1.y;
    s32 b = (sprite->data6 * 256) | sprite->data7;
    c *= 256;
    sprite->data5 = a;
    sprite->data6 = b;
    sprite->data7 = c;
}

#ifdef NONMATCHING
bool8 sub_80CB814(struct Sprite* sprite)
{
    s32 a = sprite->data5 >> 8;
    s16 d = sprite->data5;
    s16 b = sprite->data6 >> 8;
    s16 e = sprite->data6;
    s16 c = sprite->data7 >> 8;
    s16 f = c & 0xFF;
    if(!b)
    {
        b = ~32;
    }
    else if(b == 255)
    {
        b = 0x110;
    }
    sprite->pos1.x = ((b - a) * f / a ) + (((e - d) * f) / a);
    sprite->pos2.y = d;
    f++;
    if(f != a)
    {
        sprite->data7 = (f << 8) | c;
        return FALSE;
    }
    return TRUE;
}
#else
__attribute__((naked))
bool8 sub_80CB814(struct Sprite* sprite)
{
    asm(".syntax unified\n\
        push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    mov r8, r0\n\
    ldrh r0, [r0, 0x38]\n\
    lsrs r1, r0, 8\n\
    mov r10, r1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r9, r0\n\
    mov r1, r8\n\
    ldrh r0, [r1, 0x3A]\n\
    lsrs r2, r0, 8\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldrh r1, [r1, 0x3C]\n\
    lsls r0, r1, 16\n\
    asrs r0, 24\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    movs r3, 0xFF\n\
    ands r3, r1\n\
    cmp r2, 0\n\
    bne _080CB84E\n\
    movs r2, 0x20\n\
    negs r2, r2\n\
    b _080CB856\n\
_080CB84E:\n\
    cmp r2, 0xFF\n\
    bne _080CB856\n\
    movs r2, 0x88\n\
    lsls r2, 1\n\
_080CB856:\n\
    mov r0, r9\n\
    subs r4, r0\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    mov r1, r10\n\
    subs r0, r2, r1\n\
    lsls r5, r3, 16\n\
    asrs r5, 16\n\
    muls r0, r5\n\
    lsls r1, r6, 16\n\
    asrs r7, r1, 16\n\
    adds r1, r7, 0\n\
    bl __divsi3\n\
    adds r6, r0, 0\n\
    lsls r4, 16\n\
    asrs r4, 16\n\
    adds r0, r4, 0\n\
    muls r0, r5\n\
    adds r1, r7, 0\n\
    bl __divsi3\n\
    add r6, r10\n\
    mov r1, r8\n\
    strh r6, [r1, 0x20]\n\
    add r0, r9\n\
    strh r0, [r1, 0x22]\n\
    adds r5, 0x1\n\
    lsls r5, 16\n\
    lsrs r3, r5, 16\n\
    asrs r5, 16\n\
    cmp r5, r7\n\
    beq _080CB8A8\n\
    lsls r1, r7, 8\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    orrs r0, r1\n\
    mov r1, r8\n\
    strh r0, [r1, 0x3C]\n\
    movs r0, 0\n\
    b _080CB8AA\n\
_080CB8A8:\n\
    movs r0, 0x1\n\
_080CB8AA:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif

void sub_80CB8B8(struct Sprite* sprite)
{
    if(sprite->data0 == 10)
    {
        StartSpriteAffineAnim(sprite, 1);
    }
    sprite->data0++;
    if(sprite->data0 > 50) move_anim_8072740(sprite);
}

#ifdef NONMATCHING
void sub_80CB8E8(struct Sprite* sprite)
{
    int temp = ((sprite->data3 * 128) / sprite->data4) + sprite->data0;
    int zero = 0;
    sprite->data0 = temp;
    if(sprite->data0 > 0x7F)
    {
        sprite->data1++;
        sprite->data0 = zero;
    }
    sprite->pos2.y = Sin(sprite->data0 + 0x80, (sprite->data1 * 8) - 30);
    if(!sub_80CB814(sprite))
    {
        sprite->pos2.y = zero;
        sprite->data0 = zero;
        sprite->callback = sub_80CB8B8;
    }
}
#else
__attribute__((naked))
void sub_80CB8E8(struct Sprite* sprite)
{
    asm(".syntax unified\n\
        push {r4,r5,lr}\n\
    adds r4, r0, 0\n\
    movs r1, 0x34\n\
    ldrsh r0, [r4, r1]\n\
    lsls r0, 7\n\
    movs r2, 0x36\n\
    ldrsh r1, [r4, r2]\n\
    bl __divsi3\n\
    ldrh r1, [r4, 0x2E]\n\
    adds r1, r0\n\
    movs r5, 0\n\
    strh r1, [r4, 0x2E]\n\
    lsls r1, 16\n\
    asrs r1, 16\n\
    cmp r1, 0x7F\n\
    ble _080CB912\n\
    ldrh r0, [r4, 0x30]\n\
    adds r0, 0x1\n\
    strh r0, [r4, 0x30]\n\
    strh r5, [r4, 0x2E]\n\
_080CB912:\n\
    ldrh r0, [r4, 0x2E]\n\
    adds r0, 0x80\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    movs r1, 0x30\n\
    ldrsh r2, [r4, r1]\n\
    lsls r2, 3\n\
    movs r1, 0x1E\n\
    subs r1, r2\n\
    lsls r1, 16\n\
    asrs r1, 16\n\
    bl Sin\n\
    strh r0, [r4, 0x26]\n\
    adds r0, r4, 0\n\
    bl sub_80CB814\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080CB942\n\
    strh r5, [r4, 0x26]\n\
    strh r5, [r4, 0x2E]\n\
    ldr r0, _080CB948 @ =sub_80CB8B8\n\
    str r0, [r4, 0x1C]\n\
_080CB942:\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080CB948: .4byte sub_80CB8B8\n\
    .syntax divided\n");
}
#endif

void sub_80CB94C(struct Sprite* sprite)
{
    s16 e1;
    s16 e2;
    sub_80787B0(sprite, 0);
    e1 = sub_8077ABC(gBattleAnimEnemyMonIndex, 0);
    e2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 1);
    if((gBattleAnimPlayerMonIndex ^ 2) == gBattleAnimEnemyMonIndex)
    {
        sprite->data6 = e1;
        sprite->data7 = e2 + 10;
        sub_80CB7EC(sprite, 0x3C);
        sprite->data3 = 1;
    }
    else
    {
        sprite->data6 = e1;
        sprite->data7 = e2 + 10;
        sub_80CB7EC(sprite, 0x3C);
        sprite->data3 = 3;
    }
    sprite->data4 = 0x3C;
    sprite->callback = sub_80CB8E8;
}

void sub_80CB9C4(struct Sprite* sprite)
{
    int zero;
    sprite->data0 += ((sprite->data3 * 128) / sprite->data4);
    zero = 0;
    if(sprite->data0 > 0x7F)
    {
        sprite->data1++;
        sprite->data0 = zero;
    }
    sprite->pos2.y = Sin(sprite->data0 + 0x80, 30 - sprite->data1 * 8);
    if(sub_80CB814(sprite))
    {
        sprite->pos2.y = zero;
        sprite->data0 = zero;
        move_anim_8072740(sprite);
    }
}

void sub_80CBA28(struct Sprite* sprite)
{
    s16 e = sub_8077ABC(gBattleAnimEnemyMonIndex, 1);
    if(GetBankSide(gBattleAnimEnemyMonIndex) == 0)
    {
        sprite->data6 = 0;
        sprite->data7 = e + 10;
        sub_80CB7EC(sprite, 0x28);
        sprite->data3 = 3;
        sprite->data4 = 0x3C;
        sprite->callback = sub_80CB8E8;
    }
    else
    {
        sprite->data6 = 255;
        sprite->data7 = e + 10;
        if(IsContest()) sprite->data6 = 0;
        sub_80CB7EC(sprite, 0x28);
        sprite->data3 = 3;
        sprite->data4 = 0x3C;
        sprite->callback = sub_80CB9C4;
    }
}

void sub_80CBAA4(struct Sprite* sprite)
{
    if(sprite->data0 == 0)
    {
        sub_8078764(sprite, 0);
        sprite->data1 = gBattleAnimArgs[2];
    }
    sprite->data0++;
    sprite->pos2.y = sprite->data1 * sprite->data0;
    if(sprite->animEnded) move_anim_8072740(sprite);
}

void sub_80CBAE8(struct Sprite* sprite)
{
    s16 p1;
    s16 p2;
    sub_8078764(sprite, 0);
    p1 = sub_8077ABC(gBattleAnimPlayerMonIndex, 0);
    p2 = sub_8077ABC(gBattleAnimPlayerMonIndex, 1);
    if((gBattleAnimEnemyMonIndex ^ 2) == gBattleAnimPlayerMonIndex)
    {
        sprite->data6 = p1;
        sprite->data7 = p2 + 10;
        sub_80CB7EC(sprite, 0x3c);
        sprite->data3 = 1;
    }
    else
    {
        sprite->data6 = p1;
        sprite->data7 = p2 + 10;
        sub_80CB7EC(sprite, 0x3c);
        sprite->data3 = 3;
    }
    sprite->data4 = 0x3C;
    sprite->callback = sub_80CBB60;
}

void sub_80CBB60(struct Sprite* sprite)
{
    int zero;
    sprite->data0 += ((sprite->data3 * 128) / sprite->data4);
    zero = 0;
    if(sprite->data0 > 0x7F)
    {
        sprite->data1++;
        sprite->data0 = zero;
    }
    sprite->pos2.y = Sin(sprite->data0 + 0x80, 30 - sprite->data1 * 8);
    if(sprite->pos2.y == 0)
    {
        PlaySE12WithPanning(0x7D, sub_8076F98(0x3F));
    }
    if(sub_80CB814(sprite))
    {
        sprite->pos2.y = 0;
        sprite->data0 = 0;
        sprite->callback = sub_80CB8B8;
        PlaySE12WithPanning(0x7D, sub_8076F98(-0x40));
    }
}

#ifdef NONMATCHING
void sub_80CBBF0(struct Sprite* sprite)
{
    int a;
    int b;
    if(sprite->data0 == 0)
    {
        if(!IsContest())
        {
            sprite->data1 = gBattleAnimArgs[1];
            sprite->pos1.x = 0x78;
        }
        else
        {
            a = gBattleAnimArgs[1] - 32;
            b = a;
            if(a < 0)
            {
                b += gBattleAnimArgs[1] + 0xDF;
            }
            sprite->data1 = b - a;
            sprite->pos1.x = 0x46;
            
        }
        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->data2 = gBattleAnimArgs[0];
        sprite->data4 = 20;
        sprite->pos2.x = Cos(sprite->data1, 0x3C);
        sprite->pos2.y = Sin(sprite->data1, 20);
        sprite->callback = sub_80CBC8C;
        if((sprite->data1 - 1) <= 0xBE)
        {
            sprite->subpriority = 30;
        }
        else
        {
            sprite->subpriority = 28;
        }
    }
}
#else
__attribute__((naked))
void sub_80CBBF0(struct Sprite* sprite)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    adds r4, r0, 0\n\
    movs r1, 0x2E\n\
    ldrsh r0, [r4, r1]\n\
    cmp r0, 0\n\
    bne _080CBC84\n\
    bl IsContest\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _080CBC18\n\
    ldr r0, _080CBC14 @ =gBattleAnimArgs\n\
    ldrh r1, [r0, 0x2]\n\
    strh r1, [r4, 0x30]\n\
    movs r1, 0x78\n\
    strh r1, [r4, 0x20]\n\
    adds r5, r0, 0\n\
    b _080CBC3A\n\
    .align 2, 0\n\
_080CBC14: .4byte gBattleAnimArgs\n\
_080CBC18:\n\
    ldr r0, _080CBC74 @ =gBattleAnimArgs\n\
    movs r1, 0x2\n\
    ldrsh r3, [r0, r1]\n\
    adds r1, r3, 0\n\
    subs r1, 0x20\n\
    adds r2, r1, 0\n\
    adds r5, r0, 0\n\
    cmp r1, 0\n\
    bge _080CBC2E\n\
    adds r2, r3, 0\n\
    adds r2, 0xDF\n\
_080CBC2E:\n\
    asrs r0, r2, 8\n\
    lsls r0, 8\n\
    subs r0, r1, r0\n\
    strh r0, [r4, 0x30]\n\
    movs r0, 0x46\n\
    strh r0, [r4, 0x20]\n\
_080CBC3A:\n\
    ldrh r0, [r5]\n\
    strh r0, [r4, 0x22]\n\
    strh r0, [r4, 0x32]\n\
    movs r0, 0x14\n\
    strh r0, [r4, 0x36]\n\
    movs r1, 0x30\n\
    ldrsh r0, [r4, r1]\n\
    movs r1, 0x3C\n\
    bl Cos\n\
    strh r0, [r4, 0x24]\n\
    movs r1, 0x30\n\
    ldrsh r0, [r4, r1]\n\
    movs r1, 0x14\n\
    bl Sin\n\
    strh r0, [r4, 0x26]\n\
    ldr r0, _080CBC78 @ =sub_80CBC8C\n\
    str r0, [r4, 0x1C]\n\
    ldrh r0, [r4, 0x30]\n\
    subs r0, 0x1\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0xBE\n\
    bhi _080CBC7C\n\
    adds r1, r4, 0\n\
    adds r1, 0x43\n\
    movs r0, 0x1F\n\
    b _080CBC82\n\
    .align 2, 0\n\
_080CBC74: .4byte gBattleAnimArgs\n\
_080CBC78: .4byte sub_80CBC8C\n\
_080CBC7C:\n\
    adds r1, r4, 0\n\
    adds r1, 0x43\n\
    movs r0, 0x1D\n\
_080CBC82:\n\
    strb r0, [r1]\n\
_080CBC84:\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif

void sub_80CBC8C(struct Sprite* sprite)
{
    switch(sprite->data3)
    {
        case 0:
        {
            if(sprite->data2 > 0x4E)
            {
                sprite->data3 = 1;
                StartSpriteAffineAnim(sprite, 1);
                break;
            }
            else
            {
                sprite->data2 += sprite->data4 / 10;
                sprite->data4 += 3;
                sprite->pos1.y = sprite->data2;
                break;
            }
        }
        case 1:
        {
            if(sprite->data3 && sprite->affineAnimEnded)
            {
                sprite->data0 = 0;
                sprite->data2 = 0;
                sprite->callback = sub_80CBCF8;
            }
            break;
        }
    }
}