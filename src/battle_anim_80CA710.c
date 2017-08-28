#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "decompress.h"
#include "palette.h"
#include "rng.h"
#include "rom_8077ABC.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

struct __attribute__((packed)) Some3ByteStruct {
    u8 unkArr[3];
};

struct UnknownStruct_1
{
    void *src[2];
    void *dest;
    u32 unkC;
    void (*unk10)(void);
    u8 srcBank;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 taskId;
    u8 filler19[0x7];
};

struct UnknownStruct_2
{
    const void *dest;
    u32 control;
    u8 unk8;
    u8 unk9;
};

struct UnknownStruct6
{
    u16 unk0[0xA0];
    u8 fillerA0[0x640];
    u16 unk780[0xA0];
};

extern u8 gBanksBySide[];
extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimPlayerMonIndex;
extern u8 gBattleAnimEnemyMonIndex;
extern struct SpriteTemplate gSpriteTemplate_83D631C;
extern struct SpriteTemplate gSpriteTemplate_83D6884;
extern struct SpriteTemplate gSpriteTemplate_83D74BC;
extern struct SpriteTemplate gSpriteTemplate_83D75AC;
extern struct SpriteTemplate gBattleAnimSpriteTemplate_83D6FC8;
extern struct SpriteTemplate gBattleAnimSpriteTemplate_83D6FF8;
extern struct AffineAnimFrameCmd gUnknown_083D76F4;
extern struct AffineAnimFrameCmd gUnknown_083D7714;
extern struct AffineAnimFrameCmd gUnknown_083D77B0;
extern s16 gUnknown_03000728[];
extern s8 gUnknown_083D680C[11][3];
extern u16 gUnknown_083D6984[];
extern s8 gUnknown_083D6DDC[4][2];
extern u8 gObjectBankIDs[];
extern u8 gNoOfAllBanks;
extern u8 gHealthboxIDs[];
extern u16 gUnknown_083D712C[4][6];
extern u16 gBattleTypeFlags;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_03004288;
extern struct UnknownStruct6 gUnknown_03004DE0;
extern struct UnknownStruct_1 gUnknown_03004DC0;

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
void sub_80CBDB0(struct Sprite* sprite);
void sub_80CC408(struct Sprite* sprite);
void sub_80CC580(struct Sprite* sprite);
void sub_80CC7D4(struct Sprite* sprite);
void sub_80CCB00(struct Sprite* sprite);
void sub_80CCCB4(struct Sprite* sprite);
void sub_80CCE0C(struct Sprite* sprite);
void sub_80CCF70(struct Sprite* sprite);
void sub_80CD0CC(struct Sprite* sprite, int unk1, int unk2);
void sub_80CD2D4(struct Sprite* sprite);
void sub_80CD394(struct Sprite* sprite);
void sub_80CD408(struct Sprite* sprite);
void sub_80CD4B8(struct Sprite* sprite);
void sub_80CD4EC(struct Sprite* sprite);
void sub_80CD5A8(struct Sprite* sprite);
void sub_80CD654(struct Sprite* sprite);
void sub_80CD67C(struct Sprite* sprite);
void sub_80CD7CC(struct Sprite* sprite);
void sub_80CD81C(struct Sprite* sprite);
void sub_80CD8A8(struct Sprite* sprite);
void sub_80CD8F8(struct Sprite* sprite);
void sub_80CD91C(struct Sprite* sprite);
void sub_80CD9B8(struct Sprite* sprite);
void sub_80CD9D4(struct Sprite* sprite);
void sub_80CDE78(struct Sprite* sprite);
void sub_80CDEB0(struct Sprite* sprite);
void sub_80CDEC0(struct Sprite* sprite);
void sub_80CDF70(struct Sprite* sprite);
void sub_80CE000(struct Sprite* sprite);
void sub_80CE1AC(struct Sprite* sprite);
void sub_80CE354(struct Sprite* sprite);
void sub_80CE3B0(struct Sprite* sprite);
void sub_80CE798(struct Sprite* sprite);
void sub_80CE974(struct Sprite* sprite);
void sub_80CEC1C(struct Sprite* sprite);
void sub_80CED78(struct Sprite* sprite);
void sub_80CEEE8(struct Sprite* sprite);
void sub_80CF008(struct Sprite* sprite);
void sub_80CF088(struct Sprite* sprite);
void sub_80CF138(struct Sprite* sprite);
void sub_80CF158(struct Sprite* sprite);
void sub_80CF228(struct Sprite* sprite);
void sub_80CF264(struct Sprite* sprite);
void sub_80CF310(struct Sprite* sprite);
void sub_80CF490(struct Sprite* sprite);
void sub_80CF4B8(struct Sprite* sprite);
void sub_80CF6B4(struct Sprite* sprite);
void sub_80CFE2C(struct Sprite* sprite);
void sub_80CFF68(struct Sprite* sprite);
void sub_80D0030(struct Sprite* sprite);
void sub_80D00B4(struct Sprite* sprite);
void sub_80D020C(struct Sprite* sprite);
void sub_80D02D0(struct Sprite* sprite);
void sub_80D0344(struct Sprite* sprite);
void sub_80D03A8(struct Sprite* sprite);
void sub_80D0704(struct Sprite* sprite);
void sub_80D0E8C(struct Sprite* sprite);

s16 sub_80CC338(struct Sprite* sprite);

void sub_80787B0(struct Sprite *sprite, u8 a2);
void sub_8078764(struct Sprite *sprite, u8 a2);
void sub_8078B34(struct Sprite *sprite);
void sub_8078D60(struct Sprite *sprite);
void sub_80786EC(struct Sprite *sprite);
void sub_80782D8(struct Sprite *sprite);
void sub_8078CC0(struct Sprite *sprite);
void sub_8078600(struct Sprite *sprite);
void sub_8078504(struct Sprite *sprite);
void sub_807861C(struct Sprite *sprite);
void sub_8078650(struct Sprite *sprite);
void sub_8078394(struct Sprite *sprite);
void sub_80785E4(struct Sprite *sprite);
void sub_8078278(struct Sprite *sprite);
void sub_8078C00(struct Sprite *sprite);
void sub_8078114(struct Sprite *sprite);


extern void sub_8043DB0();
extern void sub_8043DFC();

void sub_807A3FC(u8 slot, u8 a2, s16 *a3, s16 *a4);
u8 sub_8079ED4(u8 slot);
s8 sub_8076F98(s8 a);
int sub_807A100(u8 slot, u8 a2);
u16 sub_80790F0(s16 a, s16 b);
void sub_8078FDC(struct Sprite *sprite, bool8 a2, s16 xScale, s16 yScale, u16 rotation);
void sub_807867C(struct Sprite *sprite, s16 a2);
u8 sub_8077EE4(u8 slot, u8 a2);
u32 sub_80791A8(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);
u32 sub_80792C0(u8 a1, u8 a2, u8 a3, u8 a4);
s16 duplicate_obj_of_side_rel2move_in_transparent_mode(u8 a1);
void obj_delete_but_dont_free_vram(struct Sprite *sprite);
s16 sub_81174E0(s16 a);
s16 sub_81174C4(s16 a, s16 b);
void sub_8079108(u16 a1, bool8 a2);
void sub_80798F4(struct Task *task, u8 a2, void *a3);
bool8 sub_807992C(struct Task *task);
u8 sub_8077FC0(u8 slot);
void sub_80895F8(struct UnknownStruct_2 unk);

void move_anim_8074EE0(struct Sprite *sprite);
bool8 sub_8078718(struct Sprite *sprite);
bool8 sub_8078CE8(struct Sprite *sprite);

void sub_80CB3A8(u8 taskId);
void sub_80CB438(u8 taskId);
void sub_80CBF5C(u8 taskId);
void sub_80CDB60(u8 taskId);
void sub_80CDD20(u8 taskId);
void sub_80CE4D4(u8 taskId);
void sub_80CE910(u8 taskId);
void sub_80CF514(u8 taskId);
void sub_80D0428(u8 taskId);
void sub_80D04E0(u8 taskId);
void sub_80D07AC(u8 taskId);
void sub_80D0904(u8 taskId);
void sub_80D0A8C(u8 taskId);
void sub_80D0B3C(u8 taskId);
void sub_80D0D68(u8 taskId);

void sub_80CC358(struct Task* task, u8 taskId);
void sub_80D0614(struct Task* task, u8 taskId);

void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e);

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

void sub_80CB09C(struct Sprite* sprite)
{
    bool8 c = FALSE;
    s16 a = sprite->data0;
    s16 b = sprite->data7;
    s16 r0;
    
    sprite->data0 = 1;
    sub_8078718(sprite);
    r0 = sprite->data7;
    sprite->data0 = a;
    if (b > 0xC8 && r0 <= 0x37 && sprite->oam.affineParam == 0)
        sprite->oam.affineParam++;
    if (sprite->oam.affineParam != 0 && sprite->data0 != 0)
    {
        sprite->invisible ^= 1;
        sprite->oam.affineParam++;
        if (sprite->oam.affineParam == 0x1E)
            c = TRUE;
    }
    
    if (sprite->pos1.x + sprite->pos2.x > 0x100
     || sprite->pos1.x + sprite->pos2.x < -16
     || sprite->pos1.y + sprite->pos2.y > 0xA0
     || sprite->pos1.y + sprite->pos2.y < -16)
        c = TRUE;

    if (c)
        move_anim_8072740(sprite);
}

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

void sub_80CB438(u8 taskId)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        if (gTasks[taskId].data[0] == 0)
        {
            u8 spriteId = obj_id_for_side_relative_to_move(1);
            sub_8078F40(spriteId);
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            gTasks[taskId].data[0]++;
            return;
        }
    }
    else
    {
        if (gTasks[taskId].data[0] == 0)
            return;
    }
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 3)
        DestroyAnimVisualTask(taskId);
}

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

void sub_80CB620(struct Sprite *sprite)
{
    s16 p1 = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
    s16 p2 = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
    s16 e1 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    s16 e2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);

    e1 -= p1;
    e2 -= p2;
    sprite->pos1.x = p1 + e1 * gBattleAnimArgs[0] / 100;
    sprite->pos1.y = p2 + e2 * gBattleAnimArgs[0] / 100;
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

bool8 sub_80CB814(struct Sprite* sprite)
{
    u16 r10 = (u8)(sprite->data5 >> 8);
    u16 r9 = (u8)sprite->data5;
    s32 r2 = (u8)(sprite->data6 >> 8);
    s32 r4 = (u8)sprite->data6;
    s16 r6 = sprite->data7 >> 8;
    s16 r3 = sprite->data7 & 0xFF;
    s16 r4_2;
    s16 r0;
    s32 var1;
    s32 var2;

    if (r2 == 0)
        r2 = -32;
    else if (r2 == 255)
        r2 = 0x110;
    r4_2 = r4 - r9;
    r0 = r2 - r10;
    var1 = r0 * r3 / r6;
    var2 = r4_2 * r3 / r6;
    sprite->pos1.x = var1 + r10;
    sprite->pos1.y = var2 + r9;
    if (++r3 == r6)
        return TRUE;
    sprite->data7 = (r6 << 8) | r3;
    return FALSE;
}

void sub_80CB8B8(struct Sprite* sprite)
{
    if(sprite->data0 == 10)
    {
        StartSpriteAffineAnim(sprite, 1);
    }
    sprite->data0++;
    if(sprite->data0 > 50) move_anim_8072740(sprite);
}

void sub_80CB8E8(struct Sprite* sprite)
{
    sprite->data0 += sprite->data3 * 128 / sprite->data4;
    if (sprite->data0 >= 128)
    {
        sprite->data1++;
        sprite->data0 = 0;
    }
    sprite->pos2.y = Sin(sprite->data0 + 128, 30 - sprite->data1 * 8);
    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = 0;
        sprite->data0 = 0;
        sprite->callback = sub_80CB8B8;
    }
}

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

void sub_80CBBF0(struct Sprite* sprite)
{
    int a;
    int b;

    if (sprite->data0 == 0)
    {
        if (!IsContest())
        {
            sprite->data1 = gBattleAnimArgs[1];
            sprite->pos1.x = 0x78;
        }
        else
        {
            a = gBattleAnimArgs[1] - 32;
            if (a < 0)
                b = gBattleAnimArgs[1] + 0xDF;
            else
                b = a;
            sprite->data1 = a - ((b >> 8) << 8);
            sprite->pos1.x = 0x46;

        }
        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->data2 = gBattleAnimArgs[0];
        sprite->data4 = 20;
        sprite->pos2.x = Cos(sprite->data1, 0x3C);
        sprite->pos2.y = Sin(sprite->data1, 20);
        sprite->callback = sub_80CBC8C;
        if (sprite->data1 > 0 && sprite->data1 < 0xC0)
            sprite->subpriority = 31;
        else
            sprite->subpriority = 29;
    }
}

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



void sub_80CBCF8(struct Sprite* sprite)
{
    if(sprite->data2 == gUnknown_083D680C[sprite->data0][1])
	{
	    if(gUnknown_083D680C[sprite->data0][2] == 0x7F)
		{
		    sprite->data0 = 0;
			sprite->callback = sub_80CBDB0;
		}
		sprite->data2 = 0;
		sprite->data0++;
	}
	else
	{
	    sprite->data2++;
		sprite->data1 = (gUnknown_083D680C[sprite->data0][0] * gUnknown_083D680C[sprite->data0][2] + sprite->data1) & 0xFF;
		if (!IsContest())
		{
		    if((u16)(sprite->data1 - 1) <= 0xBE)
            {
			    sprite->subpriority = 31;
			}
			else
			{
			    sprite->subpriority = 29;
		    }
		}
		sprite->pos2.x = Cos(sprite->data1, 0x3C);
		sprite->pos2.y = Sin(sprite->data1, 20);
	}
}

void sub_80CBDB0(struct Sprite* sprite)
{
    if(sprite->data0 > 20) move_anim_8072740(sprite);
	sprite->invisible = sprite->data0 % 2;
	sprite->data0++;
}

void sub_80CBDF4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[4] = sub_8079E90(gBattleAnimEnemyMonIndex) - 1;
    task->data[6] = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    task->data[7] = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    task->data[10] = sub_807A100(gBattleAnimEnemyMonIndex, 1);
    task->data[11] = sub_807A100(gBattleAnimEnemyMonIndex, 0);
    task->data[5] = (GetBankSide(gBattleAnimEnemyMonIndex) == 1) ? 1 : -1;
    task->data[9] = 0x38 - (task->data[5] * 64);
    task->data[8] = task->data[7] - task->data[9] + task->data[6];
    task->data[2] = CreateSprite(&gSpriteTemplate_83D6884, task->data[8], task->data[9], task->data[4]);
    if (task->data[2] == 0x40)
        DestroyAnimVisualTask(taskId);
    gSprites[task->data[2]].data0 = 10;
    gSprites[task->data[2]].data1 = task->data[8];
    gSprites[task->data[2]].data2 = task->data[6] - (task->data[10] / 2 + 10) * task->data[5];
    gSprites[task->data[2]].data3 = task->data[9];
    gSprites[task->data[2]].data4 = task->data[7] + (task->data[11] / 2 + 10) * task->data[5];
    gSprites[task->data[2]].data5 = sub_80CC338(&gSprites[task->data[2]]);
    sub_80786EC(&gSprites[task->data[2]]);
    task->func = sub_80CBF5C;
}

void sub_80CBF5C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct Sprite* sprite = &gSprites[task->data[2]];
    int a = task->data[0];
    switch(a)
    {
        case 4:
        {
            sub_80CC358(task, taskId);
            if(sub_8078718(sprite) == 0)
            {
                break;
            }
            else
            {
                task->data[15] = 5;
                task->data[0] = 0xFF;
                break;
            }
        }
        case 8:
        {
            sub_80CC358(task, taskId);
            if(sub_8078718(sprite) == 0)
            {
                break;
            }
            else
            {
            task->data[15] = 9;
            task->data[0] = 0xFF;
            break;
            }
        }
        case 0:
        {
            sub_80CC358(task, taskId);
            if(sub_8078718(sprite) == 0)
            {
                break;
            }
            task->data[15] = 1;
            task->data[0] = 0xFF;
            break;
        }
        case 1:
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 10;
            sprite->data1 = sprite->pos1.x;
            sprite->data2 = task->data[6];
            sprite->data3 = sprite->pos1.y;
            sprite->data4 = task->data[7];
            sprite->data5 = sub_80CC338(sprite);
            task->data[4] += 2;
            task->data[3] = a;
            sprite->subpriority = task->data[4];
            StartSpriteAnim(sprite, task->data[3]);
            sub_80786EC(sprite);
            task->data[0]++;
            break;
        }
        case 2:
        {
            sub_80CC358(task, taskId);
            if(sub_8078718(sprite) == 0)
            {
                break;
            }
            task->data[15] = 3;
            task->data[0] = 0xFF;
            break;
        }
        case 3:
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 10;
            sprite->data1 = sprite->pos1.x;
            sprite->data2 = task->data[6] - ((task->data[10] / 2) + 10) * task->data[5];
            sprite->data3 = sprite->pos1.y;
            sprite->data4 = task->data[7] - ((task->data[11] / 2) + 10) * task->data[5];
            sprite->data5 = sub_80CC338(sprite);
            task->data[3] = 2;
            sprite->subpriority = task->data[4];
            StartSpriteAnim(sprite, task->data[3]);
            sub_80786EC(sprite);
            task->data[0]++;
            break;
        }
        case 5:
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 10;
            sprite->data1 = sprite->pos1.x;
            sprite->data2 = task->data[6] + ((task->data[10] / 2) + 10) * task->data[5];
            sprite->data3 = sprite->pos1.y;
            sprite->data4 = task->data[7] + ((task->data[11] / 2) + 10) * task->data[5];
            sprite->data5 = sub_80CC338(sprite);
            task->data[4] -= 2;
            task->data[3] = 3;
            sprite->subpriority = task->data[4];
            StartSpriteAnim(sprite, task->data[3]);
            sub_80786EC(sprite);
            task->data[0]++;
            break;
        }
        case 6:
        {
            sub_80CC358(task, taskId);
            if(sub_8078718(sprite) == 0)
            {
                break;
            }
            task->data[15] = 7;
            task->data[0] = 0xFF;
            break;
        }
        case 7:
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 10;
            sprite->data1 = sprite->pos1.x;
            sprite->data2 = task->data[6];
            sprite->data3 = sprite->pos1.y;
            sprite->data4 = task->data[7];
            sprite->data5 = sub_80CC338(sprite);
            task->data[4] += 2;
            task->data[3] = 4;
            sprite->subpriority = task->data[4];
            StartSpriteAnim(sprite, task->data[3]);
            sub_80786EC(sprite);
            task->data[0]++;
            break;
        }
        case 9:
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 10;
            sprite->data1 = sprite->pos1.x;
            sprite->data2 = task->data[6] - ((task->data[10] / 2) + 10) * task->data[5];
            sprite->data3 = sprite->pos1.y;
            sprite->data4 = task->data[7] + ((task->data[11] / 2) + 10) * task->data[5];
            sprite->data5 = sub_80CC338(sprite);
            task->data[3] = 5;
            sprite->subpriority = task->data[4];
            StartSpriteAnim(sprite, task->data[3]);
            sub_80786EC(sprite);
            task->data[0]++;
            break;
        }
        case 10:
        {
            sub_80CC358(task, taskId);
            if(sub_8078718(sprite) == 0)
            {
                break;
            }
            else
            {
                task->data[15] = 11;
                task->data[0] = 0xFF;
                break;
            }
        }
        case 11:
        {
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data0 = 10;
            sprite->data1 = sprite->pos1.x;
            sprite->data2 = task->data[8];
            sprite->data3 = sprite->pos1.y;
            sprite->data4 = task->data[9];
            sprite->data5 = sub_80CC338(sprite);
            task->data[4] -= 2;
            task->data[3] = 6;
            sprite->subpriority = task->data[4];
            StartSpriteAnim(sprite, task->data[3]);
            sub_80786EC(sprite);
            task->data[0]++;
            break;
        }
        case 12:
        {
            sub_80CC358(task, taskId);
            if(sub_8078718(sprite) != 0)
            {
                DestroySprite(sprite);
                task->data[0]++;
            }
            break;
        }
        case 13:
        {
            if(task->data[12] == 0)
            {
                DestroyAnimVisualTask(taskId);
                break;
            }
            break;
        }
        case 255:
        {
            task->data[1]++;
            if(task->data[1] > 5)
            {
                task->data[1] = 0;
                task->data[0] = task->data[15];
            }
        }
    }
}

s16 sub_80CC338(struct Sprite* sprite)
{
    s16 var = 8;
    if(sprite->data4 < sprite->pos1.y) var = -var;
    return var;
}

void sub_80CC358(struct Task* task, u8 taskId)
{
    task->data[14]++;
    if(task->data[14] > 0)
    {
        u8 spriteId;
        s16 spriteX;
        s16 spriteY;
        task->data[14] = 0;
        spriteX = gSprites[task->data[2]].pos1.x + gSprites[task->data[2]].pos2.x;
        spriteY = gSprites[task->data[2]].pos1.y + gSprites[task->data[2]].pos2.y;
        spriteId = CreateSprite(&gSpriteTemplate_83D6884, spriteX, spriteY, task->data[4]);
        if (spriteId != 0x40)
        {
            gSprites[spriteId].data6 = taskId;
            gSprites[spriteId].data7 = 12;
            gTasks[taskId].data[12]++;
            gSprites[spriteId].data0 = task->data[13] & 1;
            gTasks[taskId].data[13]++;
            StartSpriteAnim(&gSprites[spriteId], task->data[3]);
            gSprites[spriteId].subpriority = task->data[4];
            gSprites[spriteId].callback = sub_80CC408;
        }
    }
}

void sub_80CC408(struct Sprite* sprite)
{
    sprite->data0++;
    if (sprite->data0 > 1)
    {
        sprite->data0 = 0;
        sprite->invisible ^= 1;
        sprite->data1++;
        if(sprite->data1 > 8)
        {
            gTasks[sprite->data6].data[sprite->data7]--;
            DestroySprite(sprite);
        }
    }
}

void sub_80CC474(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[6])
        bank = gBattleAnimPlayerMonIndex;
    else
        bank = gBattleAnimEnemyMonIndex;
    if (GetBankSide(bank) != 0)
    {
        sprite->data4 = 0;
        sprite->data2 = gBattleAnimArgs[3];
        sprite->pos1.x = 0xFFF0;
    }
    else
    {
        sprite->data4 = 1;
        sprite->data2 = -gBattleAnimArgs[3];
        sprite->pos1.x = 0x100;
    }
    sprite->data1 = gBattleAnimArgs[1];
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data3 = gBattleAnimArgs[4];
    switch(gBattleAnimArgs[5])
    {
        case 0:
        {
            sprite->pos1.y = gBattleAnimArgs[0];
            sprite->oam.priority = sub_8079ED4(bank);
            break;
        }
        case 1:
        {
            sprite->pos1.y = gBattleAnimArgs[0];
            sprite->oam.priority = sub_8079ED4(bank) + 1;
            break;
        }
        case 2:
        {
            sprite->pos1.y = sub_8077ABC(bank, 3) + gBattleAnimArgs[0];
            sprite->oam.priority = sub_8079ED4(bank);
            break;
        }
        case 3:
        {
            sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + gBattleAnimArgs[0];
            obj_id_for_side_relative_to_move(1);
            sprite->oam.priority = sub_8079ED4(bank) + 1;
            break;
        }
    }
    sprite->callback = sub_80CC580;
}

void sub_80CC580(struct Sprite* sprite)
{
    int a = sprite->data7;
    sprite->data7++;
    sprite->pos2.y = (sprite->data1 * gSineTable[sprite->data0]) >> 8;
    sprite->pos2.x = sprite->data2 * a;
    sprite->data0 = (sprite->data3 * a) & 0xFF;
    if (sprite->data4 == 0)
    {
        if (sprite->pos2.x + sprite->pos1.x <= 0xF7)
            return;
    }
    else
    {
        if (sprite->pos2.x + sprite->pos1.x > -16)
            return;
    }
    move_anim_8074EE0(sprite);
}

void sub_80CC5F8(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch(task->data[0])
    {
        case 0:
        {
            task->data[8] = IndexOfSpritePaletteTag(0x274f) * 16 + 256;
            task->data[12] = IndexOfSpritePaletteTag(0x27b0) * 16 + 256;
            task->data[0]++;
            break;
        }
        case 1:
        {
            task->data[9]++;
            if(task->data[9] >= 0)
            {
                task->data[9] = 0;
                BlendPalette(task->data[8], 0x10, task->data[10], gUnknown_083D6984[task->data[11]]);
                BlendPalette(task->data[12], 0x10, task->data[10], gUnknown_083D6984[task->data[11]]);
                task->data[10]++;
                if(task->data[10] == 17)
                {
                    task->data[10] = 0;
                    task->data[11]++;
                    if(task->data[11] == 7) task->data[11] = 0;
                }
            }
            break;
        }
    }
    if(gBattleAnimArgs[7] == -1) DestroyAnimVisualTask(taskId);
}

void sub_80CC6CC(struct Sprite* sprite)
{
    u8 a;
    u8 b;
    u16 c;
    u16 x;
    u16 y;

    if (gBattleAnimArgs[4] == 0)
    {
        move_anim_8072740(sprite);
    }
    else
    {

        if (gBattleAnimArgs[0] == 0)
        {
            a = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
            b = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
        }
        else
        {
            a = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
            b = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
        }
        sprite->data0 = gBattleAnimArgs[4];
        if (gBattleAnimArgs[1] == 0)
        {
            sprite->pos1.x = gBattleAnimArgs[2] + a;
            sprite->pos1.y = gBattleAnimArgs[3] + b;
            sprite->data5 = a;
            sprite->data6 = b;
        }
        else
        {
            sprite->pos1.x = a;
            sprite->pos1.y = b;
            sprite->data5 = gBattleAnimArgs[2] + a;
            sprite->data6 = gBattleAnimArgs[3] + b;
        }
        x = sprite->pos1.x;
        sprite->data1 = x * 16;
        y = sprite->pos1.y;
        sprite->data2 = y * 16;
        sprite->data3 = (sprite->data5 - sprite->pos1.x) * 16 / gBattleAnimArgs[4];
        sprite->data4 = (sprite->data6 - sprite->pos1.y) * 16 / gBattleAnimArgs[4];
        c = sub_80790F0(sprite->data5 - x, sprite->data6 - y);
        if (IsContest())
            c -= 0x8000;
        sub_8078FDC(sprite, 0, 0x100, 0x100, c);
        sprite->callback = sub_80CC7D4;
    }
}

void sub_80CC7D4(struct Sprite* sprite)
{
    if(sprite->data0)
    {
        sprite->data1 += sprite->data3;
        sprite->data2 += sprite->data4;
        sprite->pos1.x = sprite->data1 >> 4 ;
        sprite->pos1.y = sprite->data2 >> 4 ;
        sprite->data0--;
    }
    else
        move_anim_8074EE0(sprite);
}

void sub_80CC810(struct Sprite* sprite)
{
    if(sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CC82C(struct Sprite* sprite)
{
    if(GetBankSide(gBattleAnimPlayerMonIndex) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    sprite->callback = sub_8078600;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80CC884(struct Sprite* sprite)
{
    if(GetBankSide(gBattleAnimPlayerMonIndex) == 0)
        StartSpriteAnim(sprite, 1);
    sprite->callback = sub_80CC810;
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}

void sub_80CC8C8(struct Sprite* sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data1 = gBattleAnimArgs[3];
    sprite->data3 = gBattleAnimArgs[4];
    sprite->data5 = gBattleAnimArgs[5];
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[6]);
    oamt_set_x3A_32(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078504;
}

void sub_80CC914(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 0);
    sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 1);
    if(GetBankSide(gBattleAnimEnemyMonIndex) == 0)
        sprite->pos1.y += 8;
    sprite->callback = sub_80CCB00;
    if(gBattleAnimArgs[2] == 0)
        sprite->pos1.x += gBattleAnimArgs[0];
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->hFlip = 1;
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data1 -= 0x400;
    sprite->data2 += 0x400;
    sprite->data5 = gBattleAnimArgs[2];
    if(sprite->data5 == 1)
        sprite->data1 = -sprite->data1;
}

void sub_80CC9BC(struct Sprite* sprite)
{
    u8 a;
    u8 b;
    switch(gBattleAnimArgs[3])
    {
        case 1:
        {
            a = sub_8077ABC(gBattleAnimEnemyMonIndex ^ 2, 0);
            b = sub_8077ABC(gBattleAnimEnemyMonIndex ^ 2, 1);
            break;
        }
        case 2:
        {
            a = sub_8077ABC(gBattleAnimEnemyMonIndex, 0);
            b = sub_8077ABC(gBattleAnimEnemyMonIndex, 1);
            if(b_side_obj__get_some_boolean(gBattleAnimEnemyMonIndex ^ 2))
            {
                a = (sub_8077ABC(gBattleAnimEnemyMonIndex ^ 2, 0) + a) / 2;
                b = (sub_8077ABC(gBattleAnimEnemyMonIndex ^ 2, 1) + b) / 2;
            }
            break;
        }
        case 0:
        default:
        {
            a = sub_8077ABC(gBattleAnimEnemyMonIndex, 0);
            b = sub_8077ABC(gBattleAnimEnemyMonIndex, 1);
            break;
        }
    }
    sprite->pos1.x = a;
    sprite->pos1.y = b;
    if(GetBankSide(gBattleAnimEnemyMonIndex) == 0)
        sprite->pos1.y += 8;
    sprite->callback = sub_80CCB00;
    if(gBattleAnimArgs[2] == 0)
        sprite->pos1.x += gBattleAnimArgs[0];
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->hFlip = 1;
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data1 -= 0x400;
    sprite->data2 += 0x400;
    sprite->data5 = gBattleAnimArgs[2];
    if(sprite->data5 == 1)
        sprite->data1 = -sprite->data1;
}

void sub_80CCB00(struct Sprite* sprite)
{
    sprite->data3 += sprite->data1;
    sprite->data4 += sprite->data2;
    if(sprite->data5 == 0)
        sprite->data1 += 0x18;
    else
        sprite->data1 -= 0x18;
    sprite->data2 -= 0x18;
    sprite->pos2.x = sprite->data3 >> 8;
    sprite->pos2.y = sprite->data4 >> 8;
    sprite->data0++;
    if(sprite->data0 == 20)
    {
        oamt_set_x3A_32(sprite, move_anim_8072740);
        sprite->data0 = 3;
        sprite->callback = sub_80782D8;
    }
}

void unref_sub_80CCB6C(struct Sprite* sprite)
{
    if(sprite->data2 > 1)
    {
        if(sprite->data3 & 1)
        {
            sprite->invisible = 0;
            gSprites[sprite->data0].invisible = 0;
            gSprites[sprite->data1].invisible = 0;
        }
        else
        {
            sprite->invisible = 1;
            gSprites[sprite->data0].invisible = 1;
            gSprites[sprite->data1].invisible = 1;
        }
        sprite->data2 = 0;
        sprite->data3++;
    }
    else
    {
        sprite->data2++;
    }
    if(sprite->data3 == 10)
    {
        DestroySprite(&gSprites[sprite->data0]);
        DestroySprite(&gSprites[sprite->data1]);
        move_anim_8072740(sprite);
    }
}

void sub_80CCC50(struct Sprite* sprite)
{
    sprite->data0 = gBattleAnimArgs[2];
    if(GetBankSide(gBattleAnimPlayerMonIndex) != 0)
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];
    StartSpriteAnim(sprite, gBattleAnimArgs[5]);
    sprite->data1 = -gBattleAnimArgs[3];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data3 = gBattleAnimArgs[4];
    sprite->callback = sub_80CCCB4;
    sub_80CCCB4(sprite);
}

void sub_80CCCB4(struct Sprite* sprite)
{
    sprite->pos2.x = Cos(sprite->data0, 100);
    sprite->pos2.y = Sin(sprite->data0, 20);
    if(sprite->data0 <= 0x7F)
        sprite->subpriority = 0;
    else
        sprite->subpriority = 14;
    sprite->data0 = (sprite->data0 + sprite->data1) & 0xFF;
    sprite->data5 += 0x82;
    sprite->pos2.y += sprite->data5 >> 8;
    sprite->data2++;
    if(sprite->data2 == sprite->data3)
        move_anim_8072740(sprite);
}

void sub_80CCD24(struct Sprite* sprite)
{
    if(IsContest() != 0)
    {
        gBattleAnimArgs[1] += 8;
    }
    sprite->pos1.x = sub_8077EE4(gBattleAnimPlayerMonIndex, 0) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gBattleAnimPlayerMonIndex, 1) + gBattleAnimArgs[1];
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 0 || IsContest())
        sprite->oam.priority = sub_8079ED4(gBattleAnimPlayerMonIndex) + 1;
    else
        sprite->oam.priority = sub_8079ED4(gBattleAnimPlayerMonIndex);
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data2 = (IndexOfSpritePaletteTag(0x2828) << 4) + 0x100;
    sprite->data7 = 16;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = (sprite->data7 << 8) | (16 - sprite->data7);
    sprite->callback = sub_80CCE0C;
}

void sub_80CCE0C(struct Sprite* sprite)
{
    int a;
    int i;
    sprite->data5 += 0x60;
    sprite->pos2.x = -(sprite->data5 >> 8);
    sprite->data1++;
    if(sprite->data1 > 1)
    {
        sprite->data1 = 0;
        a = gPlttBufferFaded[sprite->data2 + 1];
        i = 0;
        do
    {
      gPlttBufferFaded[sprite->data2 + ++i] = gPlttBufferFaded[sprite->data2 + i + 1];
    }
    while ( i <= 5 );
        gPlttBufferFaded[sprite->data2 + 7] = a;
    }
    if (sprite->data7 > 6 && sprite->data0 >0 && ++sprite->data6 > 1)
    {
        sprite->data6 = 0;
        sprite->data7 -= 1;
        REG_BLDALPHA = (sprite->data7 << 8) | (16 - sprite->data7);;
    }
    if (sprite->data0 >0)
    {
        sprite->data0 -= 1;
    }
    else if (++sprite->data6 > 1)
    {
        sprite->data6 = 0;
        sprite->data7++;
        REG_BLDALPHA = (sprite->data7 << 8) | (16 - sprite->data7);
        if(sprite->data7 == 16)
        {
            sprite->invisible = 1;
            sprite->callback = sub_807861C;
        }
    }
}

void sub_80CCF04(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + 0xFFE8;
    sprite->data0 = 0;
    sprite->data1 = 0;
    sprite->data2 = 0;
    sprite->data3 = 0;
    sprite->data4 = 0;
    sprite->data6 = 0;
    sprite->data7 = 16;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = (sprite->data7 << 8) | sprite->data6;
    sprite->callback = sub_80CCF70;
}

void sub_80CCF70(struct Sprite* sprite)
{
    switch(sprite->data0)
    {
        case 0:
        {
            if(++sprite->data2 > 0)
            {
                sprite->data2 = 0;
                if(((++sprite->data1) & 1) != 0)
                {
                    if(sprite->data6 <= 15)
                        sprite->data6++;
                }
                else if (sprite->data7 > 0)
                    sprite->data7--;
                REG_BLDALPHA = (sprite->data7 << 8) | sprite->data6;
                if(sprite->data6 == 16 && sprite->data7 == 0)
                {
                    sprite->data1 = 0;
                    sprite->data0++;
                    break;
                }
            }
            break;
        }
        case 1:
        {
            if(++sprite->data1 > 8)
            {
                sprite->data1 = 0;
                StartSpriteAffineAnim(sprite, 1);
                sprite->data0++;
                break;
            }
            break;
        }
        case 2:
        {
            sub_80CD0CC(sprite, 16, 4);
            if(++sprite->data1 > 2)
            {
                sprite->data1 = 0;
                sprite->pos1.y++;
            }
            if(++sprite->data2 <= 29)
                break;
            if(sprite->data2 & 1)
            {
                if(sprite->data6 > 0)
                    sprite->data6--;
            }
            else if(sprite->data7 <= 15)
                sprite->data7++;
            REG_BLDALPHA = (sprite->data7 << 8) | sprite->data6;
            if(sprite->data6 == 0 && sprite->data7 == 16)
            {
                sprite->data1 = 0;
                sprite->data2 = 0;
                sprite->data0++;
                break;
            }
            else
                break;
        }
        case 3:
        {
            sprite->invisible = 1;
            sprite->data0++;
            break;
        }
        case 4:
        {
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            move_anim_8072740(sprite);
        }
    }
}

void sub_80CD0CC(struct Sprite* sprite, int unk1, int unk2)
{
    if(sprite->data3 <= 11)
        sprite->data4 += 2;
    if((u16)(sprite->data3 - 0x12) <= 0x17)
        sprite->data4 -= 2;
    if((sprite->data3) > 0x2F)
        sprite->data4 += 2;
    sprite->pos2.x = sprite->data4 / 9;
    sprite->pos2.y = sprite->data4 / 14;
    if(sprite->pos2.y < 0)
        sprite->pos2.y *= -1;
    sprite->data3++;
    if(sprite->data3 > 0x3B)
        sprite->data3 = 0;
}

void sub_80CD140(struct Sprite* sprite)
{
    if (!gBattleAnimArgs[2])
        sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data0 = gBattleAnimArgs[5];
    sprite->data1 = gBattleAnimArgs[3];
    sprite->data2 = gBattleAnimArgs[4];
    oamt_set_x3A_32(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80CD190(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[2])
        bank = gBattleAnimPlayerMonIndex;
    else
        bank = gBattleAnimEnemyMonIndex;
    if (IsDoubleBattle() && b_side_obj__get_some_boolean(bank ^ 2))
    {
        sub_807A3FC(bank, gBattleAnimArgs[6], &sprite->pos1.x, &sprite->pos1.y);
        sub_807867C(sprite, gBattleAnimArgs[0]);
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        if (!gBattleAnimArgs[6])
        {
            sprite->pos1.x = sub_8077ABC(bank, 0);
            sprite->pos1.y = sub_8077ABC(bank, 1) + gBattleAnimArgs[1];
        }
        else
        {
            sprite->pos1.x = sub_8077ABC(bank, 2);
            sprite->pos1.y = sub_8077ABC(bank, 3) + gBattleAnimArgs[1];
        }
        sub_807867C(sprite, gBattleAnimArgs[0]);
    }
    sprite->data0 = gBattleAnimArgs[5];
    sprite->data1 = gBattleAnimArgs[3];
    sprite->data2 = gBattleAnimArgs[4];
    oamt_set_x3A_32(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80CD274(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, 1);
    }
    sprite->callback = sub_80CD2D4;
}

void sub_80CD2D4(struct Sprite* sprite)
{
    if (++sprite->data0 > 30)
    {
        sprite->pos2.y = (30 - sprite->data0) / 3;
        sprite->pos2.x = Sin(sprite->data1 * 4, 3);
        sprite->data1++;
    }
    if(sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CD328(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data3 = 1;
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data3 = 0xFFFF;
        StartSpriteAffineAnim(sprite, 1);
    }
    sprite->callback = sub_80CD394;
}

void sub_80CD394(struct Sprite* sprite)
{
    sprite->pos2.y = -(sprite->data0 / 0x28);
    sprite->pos2.x = sprite->data4 / 10;
    sprite->data4 += sprite->data3 * 2;
    sprite->data0 += sprite->data1;
    if (++sprite->data1 > 0x3C)
        move_anim_8074EE0(sprite);
}

void sub_80CD3E0(struct Sprite* sprite)
{
    sprite->pos1.x -= 32;
    sprite->pos1.y -= 32;
    sprite->data0 = 20;
    sprite->callback = sub_80782D8;
    oamt_set_x3A_32(sprite, sub_80CD408);
}

void sub_80CD408(struct Sprite* sprite)
{
    switch(sprite->data5 & 1)
    {
        case 0:
            sprite->data0 = 1;
            sprite->callback = sub_80782D8;
            oamt_set_x3A_32(sprite, sub_80CD408);
            break;
        case 1:
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.y = 0;
            sprite->pos2.x = 0;
            sprite->data0 = 8;
            sprite->data2 = sprite->pos1.x + gUnknown_083D6DDC[sprite->data5 >> 8][0];
            sprite->data4 = sprite->pos1.y + gUnknown_083D6DDC[sprite->data5 >> 8][1];
            sprite->callback = sub_8078B34;
            oamt_set_x3A_32(sprite, sub_80CD4B8);
            sprite->data5 += 0x100;
            PlaySE12WithPanning(0xD2, sub_8076F98(0x3F));
            break;
    }
    sprite->data5 ^= 1;
}

void sub_80CD4B8(struct Sprite* sprite)
{
    if ((sprite->data5 >> 8) == 4)
    {
        sprite->data0 = 10;
        sprite->callback = sub_80782D8;
        oamt_set_x3A_32(sprite, sub_80CD4EC);
    }
    else
        sprite->callback = sub_80CD408;
}

void sub_80CD4EC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    if(sprite->oam.affineParam == 0)
    {
        sprite->data0 = 3;
        sprite->data1 = 0;
        sprite->data2 = 0;
        sprite->callback = sub_80782D8;
        oamt_set_x3A_32(sprite, sub_80CD5A8);
    }
    else
    {
        switch(sprite->oam.affineParam)
        {
            case 1:
                a = -8;
                b = -8;
                break;
            case 2:
                a = -8;
                b = 8;
                break;
            case 3:
                a = 8;
                b = -8;
                break;
            default:
                a = 8;
                b = 8;
                break;
        }
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data0 = 6;
        sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + a;
        sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + b;
        sprite->callback = sub_8078B34;
        oamt_set_x3A_32(sprite, sub_80CD654);
    }
}

void sub_80CD5A8(struct Sprite* sprite)
{
    if (sprite->data2 == 0)
    {
        if ((sprite->data1 += 3) > 16)
            sprite->data1 = 16;
    }
    else if ((sprite->data1 -= 3) < 0)
            sprite->data1 = 0;
    BlendPalettes(sub_80791A8(1, 1, 1, 1, 1, 0, 0), sprite->data1, 0x7FFF);
    if (sprite->data1 == 16)
    {
        int pal;
        sprite->data2++;
        pal = sprite->oam.paletteNum;
        LoadPalette(&gPlttBufferUnfaded[0x108 + pal * 16], pal * 16 | 0x101, 4);
        PlaySE12WithPanning(0xC0, sub_8076F98(0x3F));
    }
    else if (sprite->data1 == 0)
        sprite->callback = sub_80CD654;
}

void sub_80CD654(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->data1 = 0;
        sprite->data0 = 0;
        sprite->callback = sub_80CD67C;
    }
}

void sub_80CD67C(struct Sprite* sprite)
{
    if (sprite->data0 % 3 == 0)
    {
        sprite->data1++;
        sprite->invisible ^= 1;
    }
    sprite->data0++;
    if (sprite->data1 == 8)
        move_anim_8072740(sprite);
}

void sub_80CD6CC(struct Sprite* sprite)
{
    sprite->oam.affineParam = gBattleAnimArgs[0];
    if ((s16)sprite->oam.affineParam == 1)
    {
        sprite->pos1.x -= 0x18;
        sprite->pos1.y -= 0x18;
    }
    else if((s16)sprite->oam.affineParam == 2)
    {
        sprite->pos1.x -= 0x18;
        sprite->pos1.y += 0x18;
        sprite->oam.matrixNum = 16;
    }
    else if((s16)sprite->oam.affineParam == 3)
    {
        sprite->pos1.x += 0x18;
        sprite->pos1.y -= 0x18;
        sprite->oam.matrixNum = 8;
    }
    else
    {
        sprite->pos1.x += 0x18;
        sprite->pos1.y += 0x18;
        sprite->oam.matrixNum = 24;
    }
    sprite->oam.tileNum = (sprite->oam.tileNum + 16);
    sprite->callback = sub_80CD3E0;
    sub_80CD3E0(sprite);
}

void sub_80CD774(struct Sprite* sprite)
{
    sprite->invisible = 1;
    sprite->data0 = 0;
    switch(gBattleAnimArgs[0])
    {
        case 0:
            sprite->callback = sub_80CD7CC;
            break;
        case 1:
            sprite->callback = sub_80CD8A8;
            break;
        case 2:
            sprite->callback = sub_80CD8F8;
            break;
        default:
            sprite->callback = sub_80CD9B8;
            break;
    }
}

void sub_80CD7CC(struct Sprite* sprite)
{
    sprite->data0 = 6;
    sprite->data1 = (GetBankSide(gBattleAnimPlayerMonIndex)) ? 2 : -2;
    sprite->data2 = 0;
    sprite->data3 = gObjectBankIDs[gBattleAnimPlayerMonIndex];
    oamt_set_x3A_32(sprite, sub_80CD81C);
    sprite->callback = sub_8078458;
}

void sub_80CD81C(struct Sprite* sprite)
{
    if (sprite->data0 == 0)
    {
        sprite->data3 = gObjectBankIDs[gBattleAnimPlayerMonIndex];
        sub_8078E70(sprite->data3, 0);
        sprite->data4 = (sprite->data6 = GetBankSide(gBattleAnimPlayerMonIndex)) ? 0x300 : 0xFFFFFD00;
        sprite->data5 = 0;
    }
    sprite->data5 += sprite->data4;
    obj_id_set_rotscale(sprite->data3, 0x100, 0x100, sprite->data5);
    sub_8078F9C(sprite->data3);
    if (++sprite->data0 > 3)
    {
        sprite->data0 = 0;
        sprite->callback = sub_80CD9B8;
    }
}

void sub_80CD8A8(struct Sprite* sprite)
{
    sprite->data0 = 4;
    sprite->data1 = (GetBankSide(gBattleAnimPlayerMonIndex)) ? -3 : 3;
    sprite->data2 = 0;
    sprite->data3 = gObjectBankIDs[gBattleAnimPlayerMonIndex];
    oamt_set_x3A_32(sprite, sub_80CD9B8);
    sprite->callback = sub_8078458;
}

void sub_80CD8F8(struct Sprite* sprite)
{
    if(++sprite->data0 > 8)
    {
        sprite->data0 = 0;
        sprite->callback = sub_80CD91C;
    }
}

void sub_80CD91C(struct Sprite* sprite)
{
    if (sprite->data0 == 0)
    {
        sprite->data3 = gObjectBankIDs[gBattleAnimPlayerMonIndex];
        sprite->data6 = GetBankSide(gBattleAnimPlayerMonIndex);
        if (GetBankSide(gBattleAnimPlayerMonIndex))
        {
            sprite->data4 = 0xFC00;
            sprite->data5 = 0xC00;
        }
        else
        {
            sprite->data4 = 0x400;
            sprite->data5 = 0xF400;
        }
    }
    sprite->data5 += sprite->data4;
    obj_id_set_rotscale(sprite->data3, 0x100, 0x100, sprite->data5);
    sub_8078F9C(sprite->data3);
    if (++sprite->data0 > 2)
    {
        sub_8078F40(sprite->data3);
        sprite->callback = sub_80CD9B8;
    }
}

void sub_80CD9B8(struct Sprite* sprite)
{
    move_anim_8072740(sprite);
}

void sub_80CD9C4(struct Sprite* sprite)
{
    sprite->data0 = 0;
    sprite->callback = sub_80CD9D4;
}

void sub_80CD9D4(struct Sprite* sprite)
{
    switch(sprite->data0)
    {
        case 0:
            sprite->data1 = 0;
            sprite->data2 = gObjectBankIDs[gBattleAnimPlayerMonIndex];
            sprite->data3 = GetBankSide(gBattleAnimPlayerMonIndex);
            sprite->data4 = (sprite->data3 != 0) ? 0x200 : -0x200;
            sprite->data5 = 0;
            sub_8078E70(sprite->data2, 0);
            sprite->data0++;
        case 1:
            sprite->data5 += sprite->data4;
            obj_id_set_rotscale(sprite->data2, 0x100, 0x100, sprite->data5);
            sub_8078F9C(sprite->data2);
            if (++sprite->data1 > 3)
            {
                sprite->data1 = 0;
                sprite->data4 *= -1;
                sprite->data0++;
            }
            break;
        case 2:
            sprite->data5 += sprite->data4;
            obj_id_set_rotscale(sprite->data2, 0x100, 0x100, sprite->data5);
            sub_8078F9C(sprite->data2);
            if (++sprite->data1 > 3)
            {
                sub_8078F40(sprite->data2);
                move_anim_8072740(sprite);
            }
            break;
    }
}

void sub_80CDAC8(u8 taskId)
{   u8 a;
    gTasks[taskId].data[0] = gObjectBankIDs[gBattleAnimPlayerMonIndex];
    a = GetBankSide(gBattleAnimPlayerMonIndex);
    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = 0;
    switch(gBattleAnimArgs[0])
    {
        default:
            DestroyAnimVisualTask(taskId);
            break;
        case 0:
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].data[3] = 8;
            gTasks[taskId].data[4] = 0;
            gTasks[taskId].data[5] = 3;
            if (a == 0)
                gTasks[taskId].data[5] *= -1;
            gTasks[taskId].func = sub_80CDB60;
            break;
        case 1:
            gTasks[taskId].data[3] = 8;
            gTasks[taskId].data[4] = 0x600;
            gTasks[taskId].data[5] = 0xC0;
            if (a == 0)
            {
                gTasks[taskId].data[4] = -gTasks[taskId].data[4];
                gTasks[taskId].data[5] = -gTasks[taskId].data[5];
            }
            gTasks[taskId].func = sub_80CDD20;
            break;
    }
}

void sub_80CDB60(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch(task->data[2])
    {
    case 0:
        if(task->data[3])
        {
            task->data[4] += task->data[5];
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3]--;
        }
        else
        {
            task->data[3] = 8;
            task->data[4] = 0;
            task->data[5] = (task->data[1] == 0) ? -0xC0 : 0xC0;
            sub_8078E70(task->data[0], 0);
            task->data[2]++;
        }
        break;
    case 1:
        if (task->data[3])
        {
            task->data[4] += task->data[5];
            obj_id_set_rotscale(task->data[0], 0x100, 0x100, task->data[4]);
            sub_8078F9C(task->data[0]);
            task->data[3]--;
        }
        else
        {
            task->data[3] = 8;
            task->data[4] = gSprites[task->data[0]].pos2.x;
            task->data[5] = (task->data[1] == 0) ? 0x2 : -0x2;
            task->data[6] = 1;
            task->data[2]++;
        }
        break;
    case 2:
        if (task->data[3])
        {
            if (task->data[6])
            {
                task->data[6]--;
            }
            else
            {
                if (task->data[3] & 1)
                    gSprites[task->data[0]].pos2.x = task->data[4] + task->data[5];
                else
                    gSprites[task->data[0]].pos2.x = task->data[4] - task->data[5];
                task->data[6] = 1;
                task->data[3]--;
            }
        }
        else
        {
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3] = 12;
            task->data[2]++;
        }
        break;
    case 3:
        if (task->data[3])
        {
            task->data[3]--;
        }
        else
        {
            task->data[3] = 3;
            task->data[4] = gSprites[task->data[0]].pos2.x;
            task->data[5] = (task->data[1] == 0) ? 8 : -8;
            task->data[2]++;
        }
        break;
    case 4:
        if (task->data[3])
        {
            task->data[4] += task->data[5];
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3]--;
        }
        else
        {
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

void sub_80CDD20(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (task->data[3])
    {
        task->data[4] -= task->data[5];
        obj_id_set_rotscale(task->data[0], 0x100, 0x100, task->data[4]);
        sub_8078F9C(task->data[0]);
        task->data[3]--;
    }
    else
    {
        sub_8078F40(task->data[0]);
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80CDD74(struct Sprite* sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 3) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + gBattleAnimArgs[2];
    }
    sprite->data0 = 0;
    sprite->data1 = 0;
    oamt_set_x3A_32(sprite, sub_80CDEC0);
    sprite->callback = sub_8078600;
}

void sub_80CDDDC(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + 0xFFD0;
    sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    oamt_set_x3A_32(sprite, sub_80CDE78);
    sprite->callback = sub_8078600;
}

void sub_80CDE24(struct Sprite* sprite)
{
    sprite->pos1.x = sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + 0xFFD0 + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    StartSpriteAnim(sprite, 1);
    sprite->data0 = 0;
    sprite->data1 = 0;
    sprite->callback = sub_80CDEC0;
}

void sub_80CDE78(struct Sprite* sprite)
{
    if (++sprite->data0 > 8)
    {
        sprite->data0 = 12;
        sprite->data1 = 8;
        sprite->data2 = 0;
        oamt_set_x3A_32(sprite, sub_80CDEB0);
        sprite->callback = sub_8078364;
    }
}

void sub_80CDEB0(struct Sprite* sprite)
{
    sprite->data0 = 0;
    sprite->data1 = 0;
    sprite->callback = sub_80CDEC0;
}

void sub_80CDEC0(struct Sprite* sprite)
{
    if(++sprite->data0 > 1)
    {
        sprite->data0 = 0;
        sprite->invisible = !sprite->invisible;
        if(++sprite->data1 > 8)
            move_anim_8072740(sprite);
    }
}

void sub_80CDF0C(struct Sprite* sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 1) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 1) + gBattleAnimArgs[2];
    }
    sprite->data0 = 0;
    sprite->data1 = gBattleAnimArgs[3];
    sprite->callback = sub_80CDF70;
}

void sub_80CDF70(struct Sprite* sprite)
{
    if (++sprite->data0 > sprite->data1)
    {
        sprite->data0 = 0;
        sprite->pos1.y--;
    }
    sprite->pos1.y -= sprite->data0;
    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CDFB0(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 3) - 12;
    sprite->data0 = 0;
    sprite->data1 = 2;
    sprite->data2 = 0;
    sprite->data3 = 0;
    sprite->data4 = 0;
    sprite->data5 = sub_8076F98(-0x40);
    sprite->callback = sub_80CE000;
}

void sub_80CE000(struct Sprite* sprite)
{
    if (++sprite->data0 >= sprite->data1)
    {
        sprite->invisible = !sprite->invisible;
        if (!sprite->invisible)
        {
            sprite->data4++;
            if (!(sprite->data4 & 1))
                PlaySE12WithPanning(SE_W207B, sprite->data5);
        }
        sprite->data0 = 0;
        if (++sprite->data2 > 1)
        {
            sprite->data2 = 0;
            sprite->data1++;
        }
    }
    if (sprite->animEnded && sprite->data1 > 16 && sprite->invisible)
        move_anim_8072740(sprite);
}

void sub_80CE09C(struct Sprite* sprite)
{
    if (sprite->data0 == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 1) + gBattleAnimArgs[1];
        if (IsContest())
            sprite->pos1.y += 10;
        sprite->data0++;
    }
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        move_anim_8072740(sprite);
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
    sub_8078764(sprite, 0);
    sprite->animPaused = 1;
    sprite->data0 = gBattleAnimArgs[2];
    sprite->callback = sub_80CE1AC;
}

void sub_80CE1AC(struct Sprite* sprite)
{
    if (sprite->data0)
        sprite->data0--;
    else
    {
        sprite->animPaused = 0;
        sprite->data0 = 30;
        sprite->data2 = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
        sprite->data4 = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
        sprite->callback = sub_8078B34;
        oamt_set_x3A_32(sprite, move_anim_8072740);
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
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gBattleAnimArgs[0] == 1 && GetBankSide(i) == 0)
            sub_8043DB0(gHealthboxIDs[i]);
        if (gBattleAnimArgs[1] == 1 && GetBankSide(i) == 1)
            sub_8043DB0(gHealthboxIDs[i]);
    }
    DestroyAnimVisualTask(taskId);
}

void unref_sub_80CE2D4(u8 taskId)
{
    u8 i;
    for (i = 0; i < gNoOfAllBanks; i++)
        sub_8043DFC(gHealthboxIDs[i]);
    DestroyAnimVisualTask(taskId);
}

void sub_80CE30C(struct Sprite* sprite)
{
    if (IsContest())
    {
        sprite->pos1.x = 0x30;
        sprite->pos1.y = 0x28;
    }
    else
    {
        sprite->pos1.x = gBattleAnimArgs[0];
        sprite->pos1.y = gBattleAnimArgs[1];
    }
    sprite->oam.shape = 0;
    sprite->oam.size = 3;
    sprite->data0 = 0;
    sprite->callback = sub_80CE354;
}

void sub_80CE354(struct Sprite* sprite)
{
    if (sprite->data0)
        move_anim_8072740(sprite);
}

void sub_80CE36C(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = gBattleAnimArgs[1];
    sprite->data0 = 0;
    sprite->data1 = 0;
    sprite->data2 = 0;
    sprite->data3 = 0;
    sprite->data4 = 1;
    sprite->callback = sub_80CE3B0;
}

void sub_80CE3B0(struct Sprite* sprite)
{
    if (++sprite->data1 > 1)
    {
        sprite->data1 = 0;
        if (sprite->data2 <= 0x77)
        {
            sprite->pos1.y++;
            sprite->data2++;
        }
    }
    if (sprite->data0)
        move_anim_8072740(sprite);
}

void sub_80CE3EC(u8 taskId)
{
    int a = sub_80791A8(1, 0, 0, 0, 0, 0, 0) & 0xFFFF;
    int b;
    int c;
    int d;
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = a;
    gTasks[taskId].data[4] = 0;
    gTasks[taskId].data[5] = 0;
    gTasks[taskId].data[6] = 0;
    gTasks[taskId].data[7] = 13;
    gTasks[taskId].data[8] = 14;
    gTasks[taskId].data[9] = 15;
    b = sub_80792C0(1, 1, 1, 1);
    c = a | b;
    sub_8079BF4(&gTasks[taskId].data[14], &gTasks[taskId].data[15], (void*)c);
    b = b | (0x10000 << IndexOfSpritePaletteTag(0x27D2));
    d = IndexOfSpritePaletteTag(0x27D3);
    BeginNormalPaletteFade((0x10000 << d) | b, 0, 0, 0x10, 32699);
    gTasks[taskId].func = sub_80CE4D4;
    sub_80CE4D4(taskId);
}

void sub_80CE4D4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[0])
    {
        case 0:
            if (++task->data[1] > 0)
            {
                u16 color;
                u16 bitmask;
                u16 r3;
                u16 i;
                u16 j;
                task->data[1] = 0;
                if (++task->data[2] <= 15)
                {
                    u16 red;
                    u16 green;
                    u16 blue;
                    task->data[4] += task->data[7];
                    task->data[5] += task->data[8];
                    task->data[6] += task->data[9];
                    red = task->data[4] >> 3;
                    green = task->data[5] >> 3;
                    blue = task->data[6] >> 3;
                    color = RGB(red, green, blue);
                }
                else
                {
                    color = RGB(27, 29, 31);
                    task->data[0]++;
                }
                bitmask = 1;
                r3 = 0;
                for (i = 0; i <= 15; i++)
                {
                    if (task->data[3] & bitmask)
                    {
                            for (j = 1; j <= 15; j++)
                                gPlttBufferFaded[r3 + j] = color;
                    }
                    bitmask <<= 1;
                    r3 += 16;
                }
            }
            break;
        case 1:
            if (!gPaletteFade.active)
            {
                u8 spriteId;
                for (spriteId = 0; spriteId < MAX_SPRITES; spriteId++)
                {
                    if (gSprites[spriteId].template == &gBattleAnimSpriteTemplate_83D6FC8 || gSprites[spriteId].template == &gBattleAnimSpriteTemplate_83D6FF8)
                        gSprites[spriteId].data0 = 1;
                }
                task->data[1] = 0;
                task->data[0]++;
            }
            break;
        case 2:
            if (++task->data[1] > 30)
            {
                BeginNormalPaletteFade((u32)sub_8079BFC(task->data[14], task->data[15]), 0, 16, 0, RGB(27, 29, 31));
                task->data[0]++;
            }
            break;
        case 3:
            if (!gPaletteFade.active)
                DestroyAnimVisualTask(taskId);
            break;
    }
}

void sub_80CE670(struct Sprite* sprite)
{
    if (gBattleAnimArgs[2] <= 1)
        gBattleAnimArgs[2] = 2;
    if (gBattleAnimArgs[2] > 0x7F)
        gBattleAnimArgs[2] = 0x7F;
    sprite->data0 = 0;
    sprite->data1 = gBattleAnimArgs[2];
    sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + gBattleAnimArgs[1];
    sprite->data6 = sprite->pos1.x;
    sprite->data7 = sprite->pos1.y;
    if (IsContest() != 0)
    {
        sprite->oam.matrixNum = 8;
        sprite->pos1.x += 40;
        sprite->pos1.y += 20;
        sprite->data2 = sprite->pos1.x << 7;
        sprite->data3 = -0x1400 / sprite->data1;
        sprite->data4 = sprite->pos1.y << 7;
        sprite->data5 = -0xA00 / sprite->data1;
    }
    else if (GetBankSide(gBattleAnimPlayerMonIndex) == 0)
    {
        sprite->pos1.x -= 40;
        sprite->pos1.y += 20;
        sprite->data2 = sprite->pos1.x << 7;
        sprite->data3 = 0x1400 / sprite->data1;
        sprite->data4 = sprite->pos1.y << 7;
        sprite->data5 = -0xA00 / sprite->data1;
    }
    else
    {
        sprite->pos1.x += 40;
        sprite->pos1.y -= 20;
        sprite->data2 = sprite->pos1.x << 7;
        sprite->data3 = -0x1400 / sprite->data1;
        sprite->data4 = sprite->pos1.y << 7;
        sprite->data5 = 0xA00 / sprite->data1;
        sprite->oam.matrixNum = 24;
    }
    sprite->callback = sub_80CE798;
}

void sub_80CE798(struct Sprite* sprite)
{
    sprite->data2 += sprite->data3;
    sprite->data4 += sprite->data5;
    sprite->pos1.x = sprite->data2 >> 7;
    sprite->pos1.y = sprite->data4 >> 7;
    if (--sprite->data1 == 1)
    {
        sprite->pos1.x = sprite->data6;
        sprite->pos1.y = sprite->data7;
    }
    if (sprite->data1 == 0)
        move_anim_8072740(sprite);
}

// double team
void sub_80CE7E0(u8 taskId)
{
    u16 i;
    int obj;
    u16 r3;
    u16 r4;
    struct Task* task = &gTasks[taskId];
    task->data[0] = obj_id_for_side_relative_to_move(0);
    task->data[1] = AllocSpritePalette(0x2771);
    r3 = (task->data[1] * 16) + 0x100;
    r4 = (gSprites[task->data[0]].oam.paletteNum + 16) << 4;
    for (i = 1; i < 16; i++)
    {
        gPlttBufferUnfaded[r3 + i] = gPlttBufferUnfaded[r4 + i];
    }
    BlendPalette(r3, 16, 11, 0);
    task->data[3] = 0;
    i = 0;
    while (i <= 1 && (obj = duplicate_obj_of_side_rel2move_in_transparent_mode(0)) >= 0)
    {
        gSprites[obj].oam.paletteNum = task->data[1];
        gSprites[obj].data0 = 0;
        gSprites[obj].data1 = i << 7;
        gSprites[obj].data2 = taskId;
        gSprites[obj].callback = sub_80CE974;
        task->data[3]++;
        i++;
    }
    task->func = sub_80CE910;
    if (GetBankIdentity_permutated(gBattleAnimPlayerMonIndex) == 1)
    {
        REG_DISPCNT &= 0xFDFF;
    }
    else
        REG_DISPCNT &= 0xFBFF;
}

void sub_80CE910(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (!task->data[3])
    {
        if (GetBankIdentity_permutated(gBattleAnimPlayerMonIndex) == 1)
            REG_DISPCNT |= 0x200;
        else
            REG_DISPCNT |= 0x400;
        FreeSpritePaletteByTag(0x2771);
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80CE974(struct Sprite* sprite)
{
    if (++sprite->data3 > 1)
    {
        sprite->data3 = 0;
        sprite->data0++;
    }
    if (sprite->data0 > 0x40)
    {
        gTasks[sprite->data2].data[3]--;
        obj_delete_but_dont_free_vram(sprite);
    }
    else
    {
        sprite->data4 = gSineTable[sprite->data0] / 6;
        sprite->data5 = gSineTable[sprite->data0] / 13;
        sprite->data1 = (sprite->data1 + sprite->data5) & 0xFF;
        sprite->pos2.x = Sin(sprite->data1, sprite->data4);
    }
}

void sub_80CEA04(struct Sprite* sprite)
{
    oamt_set_x3A_32(sprite, move_anim_8072740);
    sprite->callback = sub_8078600;
}

// grasswhistle
void sub_80CEA20(u8 taskId)
{
    u16 i;
    u16 j;
    u16 index;

    index = IndexOfSpritePaletteTag(gUnknown_083D712C[0][0]);
    if (index != 0xFF)
    {
        index = (index << 4) + 0x100;
        for (i = 1; i < 6; i++)
            gPlttBufferFaded[index + i] = gUnknown_083D712C[0][i];
    }
    for (j = 1; j < 4; j++)
    {
        index = AllocSpritePalette(gUnknown_083D712C[j][0]);
        if (index != 0xFF)
        {
            index = (index << 4) + 0x100;
            for (i = 1; i < 6; i++)
                gPlttBufferFaded[index + i] = gUnknown_083D712C[j][i];
        }
    }
    DestroyAnimVisualTask(taskId);
}

void sub_80CEAD8(u8 taskId)
{
    u16 i;
    for (i = 1; i < 4; i++)
        FreeSpritePaletteByTag(gUnknown_083D712C[i][0]);
    DestroyAnimVisualTask(taskId);
}

void sub_80CEB0C(struct Sprite* sprite)
{
    u8 index;
    u8 a;
    u8 b;
    sub_8078650(sprite);
    StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    if ((index = IndexOfSpritePaletteTag(gUnknown_083D712C[gBattleAnimArgs[1]][0])) != 0xFF)
        sprite->oam.paletteNum = index;
    sprite->data1 = gBattleAnimArgs[1];
    sprite->data2 = 0;
    sprite->data3 = gBattleAnimArgs[2];
    if (IsContest())
    {
        a = 0x30;
        b = 0x28;
    }
    else
    {
        a = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
        b = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    }
    sprite->data4 = sprite->pos1.x << 4;
    sprite->data5 = sprite->pos1.y << 4;
    sub_80CEBC4(a - sprite->pos1.x, b - sprite->pos1.y, &sprite->data6, &sprite->data7, 0x28);
    sprite->callback = sub_80CEC1C;
}

void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e)
{
    int f;
    int g;
    if (a < 0)
        e = -e;
    f = a << 8;
    g = f / e;
    if (g == 0)
        g = 1;
    *c = f / g;
    *d = (b << 8) / g;
}

//grasswhistle music notes
void sub_80CEC1C(struct Sprite* sprite)
{
    int b;
    s16 a;
    int c;
    u8 index;
    sprite->data0++;
    b = sprite->data0 * 5 - ((sprite->data0 * 5 / 256) << 8);
    sprite->data4 += sprite->data6;
    sprite->data5 += sprite->data7;
    sprite->pos1.x = sprite->data4 >> 4;
    sprite->pos1.y = sprite->data5 >> 4;
    sprite->pos2.y = Sin(b, 15);
    a = (u16)sprite->pos1.y;
    c = (u16)sprite->pos1.x;
    //SOMEBODY CLEAN THIS UP THIS IS MESSY AS HELL AND I'M PRETTY SURE I DID IT IN SOME TACKY WAY
    if ((u32)((c + 16) << 16) > (0x110) << 16 || a < -16 || a > 0x80)
    {
        move_anim_8074EE0(sprite);
    }
    else
    {
        if(sprite->data3 && ++sprite->data2 > sprite->data3)
        {
            sprite->data2 = 0;
            if (++sprite->data1 > 3)
                sprite->data1 = 0;
            index = IndexOfSpritePaletteTag(gUnknown_083D712C[sprite->data1][0]);
            if (index != 0xFF)
                sprite->oam.paletteNum = index;
        }
    }
}

void sub_80CECE8(struct Sprite* sprite)
{
    int a; 
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 1)
    {
        a = gBattleAnimArgs[1]; 
        (u16)gBattleAnimArgs[1] = -a;
    }
    sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 3) + gBattleAnimArgs[2];
    StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    sprite->data2 = 0;
    sprite->data3 = 0;
    sprite->data4 = sprite->pos1.x << 4;
    sprite->data5 = sprite->pos1.y << 4;
    sprite->data6 = (gBattleAnimArgs[1] << 4) / 5;
    sprite->data7 = (gBattleAnimArgs[2] << 7) / 5;
    sprite->callback = sub_80CED78;
}

void sub_80CED78(struct Sprite* sprite)
{
    sprite->data4 += sprite->data6;
    sprite->data5 += sprite->data7;
    sprite->pos1.x = sprite->data4 >> 4;
    sprite->pos1.y = sprite->data5 >> 4;
    if (sprite->data0 > 5 && sprite->data3 == 0)
    {
        sprite->data2 = (sprite->data2 + 16) & 0xFF;
        sprite->pos2.x = Cos(sprite->data2, 18);
        sprite->pos2.y = Sin(sprite->data2, 18);
        if (sprite->data2 == 0)
            sprite->data3 = 1;
    }
    if (++sprite->data0 == 0x30)
        move_anim_8074EE0(sprite);
}

void sub_80CEDF0(struct Sprite* sprite)
{
    s16 a;
    if (gBattleAnimArgs[0] == 1)
    {
        sprite->oam.matrixNum = 8;
        a = 16;
    }
    else
        a = -16;
    sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2) + a;
    sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 3) + 8;
    sprite->data0 = 8;
    sprite->callback = sub_80782D8;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80CEE60(struct Sprite* sprite)
{
    s16 a;
    u8 index;
    sub_8078650(sprite);
    sprite->pos1.y += 8;
    StartSpriteAnim(sprite, gBattleAnimArgs[1]);
    index = IndexOfSpritePaletteTag(gUnknown_083D712C[gBattleAnimArgs[2]][0]);
    if (index != 0xFF)
        sprite->oam.paletteNum = index;
    a = (gBattleAnimArgs[0] == 0) ? 0xFFE0 : 0x20;
    sprite->data0 = 40;
    sprite->data1 = sprite->pos1.x;
    sprite->data2 = a + sprite->data1;
    sprite->data3 = sprite->pos1.y;
    sprite->data4 = sprite->data3 - 40;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data5 = gBattleAnimArgs[3];
    sprite->callback = sub_80CEEE8;
}

void sub_80CEEE8(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) == 0)
    {
        s16 a;
        a = Sin(sprite->data5, 8);
        if (sprite->pos2.x < 0)
            a = -a;
        sprite->pos2.x += a;
        sprite->pos2.y += Sin(sprite->data5, 4);
        sprite->data5 = (sprite->data5 + 8) & 0xFF;
    }
    else
        move_anim_8072740(sprite);
}

void sub_80CEF44(u8 bank, struct Sprite* sprite)
{
    if (GetBankSide(bank) == 0)
        sprite->pos1.x = sub_807A100(bank, 5) + 8;
    else
        sprite->pos1.x = sub_807A100(bank, 4) - 8;
    sprite->pos1.y = sub_8077ABC(bank, 3) - (s16)sub_807A100(bank, 0) / 4;
}

void sub_80CEF9C(struct Sprite* sprite)
{
    u8 a;
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimPlayerMonIndex;
    else
        bank = gBattleAnimEnemyMonIndex;
    sub_80CEF44(bank, sprite);
    a = (GetBankSide(bank) == 0) ? 0 : 1;
    sprite->data0 = gBattleAnimArgs[1];
    sprite->data1 = a + 2;
    StartSpriteAnim(sprite, a);
    oamt_set_x3A_32(sprite, sub_80CF008);
    sprite->callback = sub_8078600;
}

void sub_80CF008(struct Sprite* sprite)
{
    if (--sprite->data0 == 0)
    {
        oamt_set_x3A_32(sprite, move_anim_8072740);
        StartSpriteAnim(sprite, sprite->data1);
        sprite->callback = sub_8078600;
    }
}

void sub_80CF040(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimPlayerMonIndex;
    else
        bank = gBattleAnimEnemyMonIndex;
    sub_80CEF44(bank, sprite);
    sprite->data0 = 0;
    oamt_set_x3A_32(sprite, sub_80CF088);
    sprite->callback = sub_80785E4;
}

void sub_80CF088(struct Sprite* sprite)
{
    if (++sprite->data0 > 16)
    {
        StartSpriteAffineAnim(sprite, 1);
        oamt_set_x3A_32(sprite, move_anim_8074EE0);
        sprite->callback = sub_80785E4;
    }
}

void sub_80CF0BC(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimPlayerMonIndex;
    else
        bank = gBattleAnimEnemyMonIndex;
    sprite->pos1.x = sub_8077ABC(bank, 0);
    sprite->pos1.y = sub_807A100(bank, 2);
    if (sprite->pos1.y <= 9)
        sprite->pos1.y = 10;
    sprite->data0 = 1;
    sprite->data1 = 0;
    sprite->data2 = sprite->subpriority;
    sprite->data3 = sprite->subpriority + 4;
    sprite->data4 = 0;
    oamt_set_x3A_32(sprite, sub_80CF138);
    sprite->callback = sub_80785E4;
}

void sub_80CF138(struct Sprite* sprite)
{
    if (++sprite->data4 > 12)
        sprite->callback = sub_80CF158;
}

void sub_80CF158(struct Sprite* sprite)
{
    s16 temp;
    s16 temp2;
    sprite->data1 += 4;
    if (sprite->data1 > 0xFE)
    {
        if (--sprite->data0 == 0)
        {
            sprite->pos2.x = 0;
            sprite->callback = sub_80CF088;
            return;
        }
        else
            sprite->data1 &= 0xFF;
    }
    if (sprite->data1 > 0x4F)
        sprite->subpriority = sprite->data3;
    if (sprite->data1 > 0x9F)
        sprite->subpriority = sprite->data2;
    temp = gSineTable[sprite->data1];
    sprite->pos2.x = (temp2 = temp >> 3) + (temp2 >> 1);
}

void sub_80CF1C8(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimPlayerMonIndex;
    else
        bank = gBattleAnimEnemyMonIndex;
    sub_80CEF44(bank, sprite);
    if (GetBankSide(bank) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->data0 = 2;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->data0 = 3;
    }
    sprite->callback = sub_80CF228;
}

void sub_80CF228(struct Sprite* sprite)
{
    if (++sprite->data1 > 10)
    {
        sprite->data1 = 0;
        StartSpriteAnim(sprite, sprite->data0);
        oamt_set_x3A_32(sprite, sub_80CF264);
        sprite->callback = sub_8078600;
    }
}

void sub_80CF264(struct Sprite* sprite)
{
    if (++sprite->data1 > 5)
        move_anim_8072740(sprite);
}

void sub_80CF280(struct Sprite* sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data1 = gBattleAnimArgs[2];
    sprite->data2 = gBattleAnimArgs[4];
    sprite->data3 = gBattleAnimArgs[5];
    sprite->data4 = gBattleAnimArgs[3];
    oamt_set_x3A_32(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078278;
    sub_8078278(sprite);
}

void sub_80CF2D0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimPlayerMonIndex;
    else
        bank = gBattleAnimEnemyMonIndex;
    sub_80CEF44(bank, sprite);
    sprite->data0 = 0;
    sprite->data1 = 0;
    sprite->callback = sub_80CF310;
}

void sub_80CF310(struct Sprite* sprite)
{
    switch (sprite->data0)
    {
        case 0:
            sprite->pos2.y -= 3;
            if (++sprite->data1 == 6)
                sprite->data0++;
            break;
        case 1:
            sprite->pos2.y += 3;
            if (--sprite->data1 == 0)
                sprite->data0++;
            break;
        case 2:
            if (++sprite->data1 == 0x40)
                move_anim_8072740(sprite);
            break;
    }
}

void sub_80CF374(struct Sprite* sprite)
{
    s16 temp;
    gSprites[sprite->data2].pos2.x += sprite->data1;
    temp = sprite->data1;
    sprite->data1 = -temp;
    if (sprite->data0 == 0)
    {
        gSprites[sprite->data2].pos2.x = 0;
        move_anim_8074EE0(sprite);
    }
    sprite->data0--;
}

void sub_80CF3C4(struct Sprite* sprite)
{
    u8 a;
    sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
    a = gObjectBankIDs[gBattleAnimEnemyMonIndex];
    if (GetBankSide(gBattleAnimPlayerMonIndex) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data1 = gBattleAnimArgs[3];
    sprite->data2 = a;
    sprite->callback = sub_80CF374;
    sprite->invisible = 1;
}

void sub_80CF458(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data0 = gBattleAnimArgs[2];
    sprite->data1 = gBattleAnimArgs[3];
    sprite->data5 = gBattleAnimArgs[4];
    sprite->callback = sub_80782D8;
    oamt_set_x3A_32(sprite, sub_80CF490);
}

void sub_80CF490(struct Sprite* sprite)
{
    sprite->data0 = sprite->data1;
    sprite->data2 = sprite->pos1.x;
    sprite->data4 = sprite->pos1.y + 15;
    sprite->callback = sub_8078B34;
    oamt_set_x3A_32(sprite, sub_80CF4B8);
}

void sub_80CF4B8(struct Sprite* sprite)
{
    if (sprite->data5 == 0)
        move_anim_8072740(sprite);
    else
        sprite->data5--;
}

void sub_80CF4D8(u8 taskId)
{
    sub_8078E70(gObjectBankIDs[gBattleAnimPlayerMonIndex], 0);
    gTasks[taskId].func = sub_80CF514;
}

void sub_80CF514(u8 taskId)
{
    u8 a = gObjectBankIDs[gBattleAnimPlayerMonIndex];
    s16 b;
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 0)
    {
        b = -gTasks[taskId].data[0];
    }
    else
    {
        b = gTasks[taskId].data[0];
    }
    obj_id_set_rotscale(a, 0x100, 0x100, b);
    if (gTasks[taskId].data[1] == 0)
    {
        gTasks[taskId].data[0] += 0xB0;
        gSprites[a].pos2.y++;
    }
    else if (gTasks[taskId].data[1] == 1)
    {
        if (++gTasks[taskId].data[3] == 0x1E)
            gTasks[taskId].data[1] = 2;
        return;
    }
    else
    {
        gTasks[taskId].data[0] -= 0xB0;
        gSprites[a].pos2.y--;
    }
    sub_8078F9C(a);
    if (gTasks[taskId].data[0] == 0xF20 || gTasks[taskId].data[0] == 0)
    {
        if (gTasks[taskId].data[1] == 2)
        {
            sub_8078F40(a);
            DestroyAnimVisualTask(taskId);
        }
        else
        {
            gTasks[taskId].data[1]++;
        }
    }
}

void sub_80CF610(struct Sprite* sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    if (GetBankSide(gBattleAnimPlayerMonIndex) != 0)
    {
        sprite->hFlip = 1;
        if (gBattleAnimArgs[2] != 0)
            sprite->vFlip = 1;
    }
    else
    {
        if (gBattleAnimArgs[2] != 0)
            sprite->vFlip = 1;
    }
    sprite->callback = sub_8078600;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80CF690(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    sprite->callback = sub_80785E4;
    oamt_set_x3A_32(sprite, sub_80CF6B4);
}

void sub_80CF6B4(struct Sprite* sprite)
{
    sprite->data0 = 6;
    sprite->data2 = sprite->pos1.x;
    sprite->data4 = sprite->pos1.y - 32;
    sprite->callback = sub_8078B34;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

//sonic boom
void sub_80CF6DC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    u16 c;

    if (IsContest())
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    else if (GetBankSide(gBattleAnimPlayerMonIndex) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }
    sub_80787B0(sprite, 1);
    a = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + gBattleAnimArgs[2];
    b = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + gBattleAnimArgs[3];
    c = sub_80790F0(a - sprite->pos1.x, b - sprite->pos1.y);
    c += 0xF000;
    if (IsContest())
        c -= 0x6000;
    sub_8078FDC(sprite, 0, 0x100, 0x100, c);
    sprite->data0 = gBattleAnimArgs[4];
    sprite->data2 = a;
    sprite->data4 = b;
    sprite->callback = sub_8078B34;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80CF7E0(struct Sprite* sprite)
{
    if (sprite->data0-- <= 0)
    {
        gTasks[sprite->data7].data[1]--;
        DestroySprite(sprite);
    }
}

void sub_80CF814(struct Sprite* sprite)
{
    struct Task* task = &gTasks[sprite->data7];
    if (sprite->data0 > task->data[5])
    {
        sprite->data5 += sprite->data3;
        sprite->data6 += sprite->data4;
    }
    else
    {
        sprite->data5 -= sprite->data3;
        sprite->data6 -= sprite->data4;
    }
    sprite->data1 += sprite->data5;
    sprite->data2 += sprite->data6;
    if (1 & task->data[7])
        sprite->pos2.x = ((u16)sprite->data1 >> 8) * -1;
    else
        sprite->pos2.x = (u16)sprite->data1 >> 8;
    if (1 & task->data[8])
        sprite->pos2.y = ((u16)sprite->data2 / 256u) * -1;
    else
        sprite->pos2.y = (u16)sprite->data2 / 256u;
    if (sprite->data0-- <= 0)
    {
        sprite->data0 = 30;
        sprite->callback = sub_80CF7E0;
    }
}

//air cutter
void sub_80CF8B8(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    s16 c;
    struct Task* task = &gTasks[sprite->data7];
    sprite->data1 += (-2 & task->data[7]);
    sprite->data2 += (-2 & task->data[8]);
    if (1 & task->data[7])
        sprite->pos2.x = ((u16)sprite->data1 >> 8) * -1;
    else
        sprite->pos2.x = (u16)sprite->data1 >> 8;
    if (1 & task->data[8])
        sprite->pos2.y = ((u16)sprite->data2 / 256u) * -1;
    else
        sprite->pos2.y = (u16)sprite->data2 / 256u;
    if (sprite->data0-- <= 0)
    {
        sprite->data0 = 8;
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
        sprite->data2 = 0;
        sprite->data1 = 0;
        sprite->data6 = 0;
        sprite->data5 = 0;
        sprite->data3 = sub_81174C4(sub_81174C4(b, a), sub_81174E0(0x1C0));
        sprite->data4 = sub_81174C4(sub_81174C4(c, a), sub_81174E0(0x1C0));
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
        sprite->data0 = gTasks[taskId].data[5] - gTasks[taskId].data[6];
        sprite->data7 = taskId;
        gTasks[taskId].data[gTasks[taskId].data[1] + 13] = spriteId;
        gTasks[taskId].data[0] = gTasks[taskId].data[3];
        gTasks[taskId].data[1]++;
        PlaySE12WithPanning(0x9A, sub_8076F98(-0x3F));
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
        if ((gBanksBySide[gBattleAnimEnemyMonIndex] & 1) == 0)
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
    r6 = gTasks[taskId].data[9] = sub_8077ABC(gBattleAnimPlayerMonIndex, 0);
    r9 = gTasks[taskId].data[10] = sub_8077ABC(gBattleAnimPlayerMonIndex, 1);
    if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
     && b_side_obj__get_some_boolean(gBattleAnimEnemyMonIndex ^ 2))
    {
        sub_807A3FC(gBattleAnimEnemyMonIndex, 0, &sp1, &sp2);
    }
    else
    {
        sp1 = sub_8077ABC(gBattleAnimEnemyMonIndex, 0);
        sp2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 1);
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
            u16 var = sub_8079E90(gBattleAnimEnemyMonIndex) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gBattleAnimEnemyMonIndex) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }
    else
    {
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = sub_8079E90(gBattleAnimEnemyMonIndex) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gBattleAnimEnemyMonIndex) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }
    if (gTasks[taskId].data[2] < 3)
        gTasks[taskId].data[2] = 3;
    gTasks[taskId].func = sub_80CFA20;
}

void sub_80CFDFC(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    sprite->data0 = 0x100 + (IndexOfSpritePaletteTag(gSpriteTemplate_83D75AC.paletteTag) << 4);
    sprite->callback = sub_80CFE2C;
}

#ifdef NONMATCHING
void sub_80CFE2C(struct Sprite* sprite)
{
    u16 r7;
    u16* r1;
    u16* r2;
    int i;
    if (++sprite->data1 == 2)
    {
        sprite->data1 = 0;
        r7 = gPlttBufferFaded[sprite->data0 + 8];
        r2 = &gPlttBufferFaded[0x10];
        r1 = &gPlttBufferFaded[sprite->data0 + 9];
        for (i = 7; i >= 0; i--)
        {
            *r2 = *r1;
            r1++;
            r2++;
        }
        gPlttBufferFaded[sprite->data0 + 15] = r7;
        if (++sprite->data2 == 0x18)
            move_anim_8072740(sprite);
    }
}
#else
__attribute__((naked))
void sub_80CFE2C(struct Sprite* sprite)
{
    asm(".syntax unified\n\
    	push {r4-r7,lr}\n\
	adds r4, r0, 0\n\
	ldrh r0, [r4, 0x30]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x30]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x2\n\
	bne _080CFE90\n\
	movs r0, 0\n\
	strh r0, [r4, 0x30]\n\
	ldrh r5, [r4, 0x2E]\n\
	ldr r1, _080CFE98 @ =gPlttBufferFaded\n\
	adds r0, r5, 0\n\
	adds r0, 0x8\n\
	lsls r0, 1\n\
	adds r0, r1\n\
	ldrh r7, [r0]\n\
	adds r6, r1, 0 @puts gPlttBufferFaded in r6\n\
	adds r1, r5, 0\n\
	adds r1, 0x9\n\
	lsls r0, r5, 1\n\
	adds r0, r6 \n\
	adds r2, r0, 0\n\
	adds r2, 0x10\n\
	movs r3, 0x7\n\
	lsls r1, 1\n\
	adds r1, r6 \n\
_080CFE64:\n\
	ldrh r0, [r1]\n\
	strh r0, [r2]\n\
	adds r1, 0x2\n\
	adds r2, 0x2\n\
	subs r3, 0x1\n\
	cmp r3, 0\n\
	bge _080CFE64\n\
	adds r0, r5, 0\n\
	adds r0, 0xF\n\
	lsls r0, 1\n\
	adds r0, r6\n\
	strh r7, [r0]\n\
	ldrh r0, [r4, 0x32]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x32]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x18\n\
	bne _080CFE90\n\
	adds r0, r4, 0\n\
	bl move_anim_8072740\n\
_080CFE90:\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080CFE98: .4byte gPlttBufferFaded\n\
.syntax divided\n");
}
#endif

void sub_80CFE9C(struct Sprite* sprite)
{
    s16 r6;
    s16 r7;
    u16 var;

    sub_80787B0(sprite, 1);
    r6 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    r7 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + gBattleAnimArgs[3];
    if (GetBankSide(gBattleAnimPlayerMonIndex) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    r6 += gBattleAnimArgs[2];
    var = sub_80790F0(r6 - sprite->pos1.x, r7 - sprite->pos1.y);
    var += 0xC000;
    sub_8078FDC(sprite, 0, 0x100, 0x100, var);
    sprite->data0 = gBattleAnimArgs[4];
    sprite->data2 = r6;
    sprite->data4 = r7;
    sprite->callback = sub_8078C00;
    oamt_set_x3A_32(sprite, move_anim_8072740);
}

void sub_80CFF50(struct Sprite* sprite)
{
    sprite->data2 = -16;
    sprite->pos1.y += 8;
    sprite->callback = sub_80CFF68;
}

void sub_80CFF68(struct Sprite* sprite)
{
    sprite->data0 += 0x80;
    sprite->pos2.x = sprite->data0 >> 8;
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 0)
        sprite->pos2.x = -sprite->pos2.x;
    sprite->pos2.y = Sin(sprite->data1, sprite->data2);
    sprite->data1 += 5;
    if (sprite->data1 > 0x7E)
    {
        sprite->data1 = 0;
        sprite->data2 /= 2;
        if (++sprite->data3 == 2)
            move_anim_8072740(sprite);
    }
}

void sub_80CFFD8(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data0 = 20;
    sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2);
    sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3);
    sprite->callback = sub_8078B34;
    sprite->affineAnimPaused = 1;
    oamt_set_x3A_32(sprite, sub_80D0030);
}

void sub_80D0030(struct Sprite* sprite)
{
    int i;
    u16 rand;
    s16* ptr;
    PlaySE12WithPanning(0xA6, sub_8076F98(0x3F));
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.y = 0;
    sprite->pos2.x = 0;
    ptr = &sprite->data7;
    for (i = 0; i < 8; i++) {
        ptr[i - 7] = 0;
    }
    rand = Random();
    sprite->data6 = 0xFFF4 - (rand & 7);
    rand = Random();
    sprite->data7 = (rand % 0xA0) + 0xA0;
    sprite->callback = sub_80D00B4;
    sprite->affineAnimPaused = 0;
}

void sub_80D00B4(struct Sprite* sprite)
{
    sprite->data0 += sprite->data7;
    sprite->pos2.x = sprite->data0 >> 8;
    if (sprite->data7 & 1)
        sprite->pos2.x = -sprite->pos2.x;
    sprite->pos2.y = Sin(sprite->data1, sprite->data6);
    sprite->data1 += 8;
    if (sprite->data1 > 0x7E)
    {
        sprite->data1 = 0;
        sprite->data2 /= 2;
        if (++sprite->data3 == 1)
            move_anim_8072740(sprite);
    }
}

void sub_80D0118(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 0)
        sprite->pos1.y += 16;
    sprite->data0 = gBattleAnimArgs[4];
    sprite->data1 = gBattleAnimArgs[2];
    sprite->data2 = gBattleAnimArgs[5];
    sprite->data3 = gBattleAnimArgs[6];
    sprite->data4 = gBattleAnimArgs[3];
    sprite->callback = sub_8078114;
    oamt_set_x3A_32(sprite, move_anim_8072740);
    sprite->callback(sprite);
}

void sub_80D0178(struct Sprite* sprite)
{
    s16 r7 = 32;
    s16 r4 = -32;
    s16 r8 = 16;
    s16 r6 = -16;
    if (gBattleAnimArgs[0] != 0)
    {
        r7 = r4;
        r4 = 32;
        r8 = r6;
        r6 = 16;
        StartSpriteAnim(sprite, 1);
    }
    sprite->pos1.x += r7;
    sprite->pos1.y += r4;
    sprite->data0 = 6;
    sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + r8;
    sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + r6;
    sprite->callback = sub_8078B34;
    oamt_set_x3A_32(sprite, sub_80D020C);
}

void sub_80D020C(struct Sprite* sprite)
{
    if (sprite->animEnded == 1)
        move_anim_8072740(sprite);
}

void sub_80D0228(struct Sprite* sprite)
{
    s16 r8 = 32;
    s16 r4 = -32;
    s16 r9 = 16;
    s16 r6 = -16;
    if (gBattleAnimArgs[0] != 0)
    {
        r8 = r4;
        r4 = 32;
        r9 = r6;
        r6 = 16;
        StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    }
    sprite->pos1.x += r8;
    sprite->pos1.y += r4;
    sprite->data0 = 6;
    sprite->data1 = sprite->pos1.x;
    sprite->data2 = sub_8077ABC(gBattleAnimEnemyMonIndex, 2) + r9;
    sprite->data3 = sprite->pos1.y;
    sprite->data4 = sub_8077ABC(gBattleAnimEnemyMonIndex, 3) + r6;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data5 = gBattleAnimArgs[0];
    sprite->data6 = sprite->data0;
    sprite->callback = sub_80D02D0;
}

void sub_80D02D0(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) && sprite->animEnded == 1)
    {
        SeekSpriteAnim(sprite, 0);
        sprite->animPaused = 1;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 2;
        sprite->pos2.y = -2;
        sprite->data0 = sprite->data6;
        sprite->data1 ^= 1;
        sprite->data2 ^= 1;
        sprite->data4 = 0;
        sprite->data3 = 0;
        sprite->callback = sub_80D0344;
    }
}

void sub_80D0344(struct Sprite* sprite)
{
    if (sprite->data3)
    {
        sprite->pos2.x = -sprite->pos2.x;
        sprite->pos2.y = -sprite->pos2.y;
    }
    sprite->data3 ^= 1;
    if (++sprite->data4 == 0x33)
    {
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data4 = 0;
        sprite->data3 = 0;
        sprite->animPaused = 0;
        StartSpriteAnim(sprite, sprite->data5 ^ 1);
        sprite->callback = sub_80D03A8;
    }
}

void sub_80D03A8(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) != 0)
        move_anim_8072740(sprite);
}

void sub_80D03C4(u8 taskId)
{
    u8 spriteId = obj_id_for_side_relative_to_move(1);
    sub_8078E70(spriteId, 1);
    obj_id_set_rotscale(spriteId, 0xD0, 0xD0, 0);
    sub_8079108(gSprites[spriteId].oam.paletteNum + 16, 0);
    gTasks[taskId].data[0] = 0x50;
    gTasks[taskId].func = sub_80D0428;
}

void sub_80D0428(u8 taskId)
{
    if (--gTasks[taskId].data[0] == -1)
    {
        u8 spriteId = obj_id_for_side_relative_to_move(1);
        sub_8078F40(spriteId);
        sub_8079108(gSprites[spriteId].oam.paletteNum + 16, 1);
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D0488(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = obj_id_for_side_relative_to_move(0);
    task->data[0] = spriteId;
    sub_8078E70(spriteId, 0);
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0x100;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = sub_8079E90(gBattleAnimPlayerMonIndex);
    task->func = sub_80D04E0;
}

void sub_80D04E0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[1])
    {
        case 0:
            if (task->data[2] == 0 || task->data[2] == 3 || task->data[2] == 6)
                sub_80D0614(task, taskId);
            task->data[2]++;
            task->data[4] += 0x28;
            obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
            sub_8079A64(task->data[0]);
            if (task->data[2] == 32)
            {
                task->data[5]++;
                task->data[1]++;
            }
            break;
        case 1:
            if (task->data[6] == 0)
            {
                if (task->data[5] == 3)
                {
                    task->data[2] = 0;
                    task->data[1] = 3;
                }
                else
                {
                    task->data[2] = 0;
                    task->data[3] = 0;
                    task->data[4] = 0x100;
                    obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
                    sub_8079A64(task->data[0]);
                    task->data[1] = 2;
                }
            }
            break;
        case 2:
            task->data[1] = 0;
            break;
        case 3:
            if (++task->data[2] > 32)
            {
                task->data[2] = 0;
                task->data[1]++;
            }
            break;
        case 4:
            task->data[2] += 2;
            task->data[4] -= 0x50;
            obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
            sub_8079A64(task->data[0]);
            if (task->data[2] == 32)
            {
                task->data[2] = 0;
                task->data[1]++;
            }
            break;
        case 5:
            sub_8078F40(task->data[0]);
            gSprites[task->data[15]].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
            break;    
    }
}

#ifdef NONMATCHING
void sub_80D0614(struct Task* task, u8 taskId)
{
    s16 r8 = duplicate_obj_of_side_rel2move_in_transparent_mode(0);
    if (r8 >= 0)
    {
        u8 r6 = AllocOamMatrix();
        if (r6 == 0xFF)
            obj_delete_but_dont_free_vram(&gSprites[r8]);
        else
        {
            gSprites[r8].oam.objMode = 1;
            gSprites[r8].oam.affineMode = 3;
            gSprites[r8].affineAnimPaused = 1;
            gSprites[r8].oam.matrixNum = r6;
            gSprites[r8].subpriority = task->data[7] - task->data[3];
            task->data[3]++;
            task->data[6]++;
            gSprites[r8].data0 = 16;
            gSprites[r8].data1 = taskId;
            gSprites[r8].data2 = 6;
            gSprites[r8].callback = sub_80D0704;
            obj_id_set_rotscale(r8, task->data[4], task->data[4], 0);
            gSprites[r8].oam.affineMode = 1;
            CalcCenterToCornerVec(&gSprites[r8], gSprites[r8].oam.shape, gSprites[r8].oam.size, gSprites[r8].oam.affineMode);
        }
    }
}
#else
__attribute__((naked))
void sub_80D0614(struct Task* task, u8 taskId)
{
    asm(".syntax unified\n\
    	push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	adds r7, r0, 0 @r7 is task\n\
	lsls r1, 24\n\
	lsrs r1, 24\n\
	mov r9, r1 @r9 is taskId\n\
	movs r0, 0\n\
	bl duplicate_obj_of_side_rel2move_in_transparent_mode\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	mov r8, r0\n\
	lsls r0, 16\n\
	asrs r4, r0, 16\n\
	cmp r4, 0\n\
	blt _080D06EE @jump to bottom\n\
	bl AllocOamMatrix\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0xFF\n\
	bne _080D0658\n\
	lsls r0, r4, 4\n\
	adds r0, r4\n\
	lsls r0, 2\n\
	ldr r1, _080D0654 @ =gSprites\n\
	adds r0, r1\n\
	bl obj_delete_but_dont_free_vram\n\
	b _080D06EE @ jump to bottom\n\
	.align 2, 0\n\
_080D0654: .4byte gSprites\n\
_080D0658:\n\
	ldr r5, _080D06FC @ =gSprites\n\
	lsls r3, r4, 4\n\
	adds r3, r4\n\
	lsls r3, 2\n\
	adds r4, r3, r5\n\
	ldrb r1, [r4, 0x1]\n\
	movs r0, 0xD\n\
	negs r0, r0\n\
	ands r0, r1\n\
	movs r1, 0x4\n\
	orrs r0, r1\n\
	movs r1, 0x3\n\
	orrs r0, r1\n\
	strb r0, [r4, 0x1]\n\
	adds r2, r4, 0\n\
	adds r2, 0x2C\n\
	ldrb r0, [r2]\n\
	movs r1, 0x80\n\
	orrs r0, r1\n\
	strb r0, [r2]\n\
	movs r0, 0x1F\n\
	ands r6, r0\n\
	lsls r2, r6, 1\n\
	ldrb r1, [r4, 0x3]\n\
	movs r0, 0x3F\n\
	negs r0, r0\n\
	ands r0, r1\n\
	orrs r0, r2\n\
	strb r0, [r4, 0x3]\n\
	ldrb r0, [r7, 0x16]\n\
	ldrb r1, [r7, 0xE]\n\
	subs r0, r1\n\
	adds r1, r4, 0\n\
	adds r1, 0x43\n\
	strb r0, [r1]\n\
	ldrh r0, [r7, 0xE]\n\
	adds r0, 0x1\n\
	strh r0, [r7, 0xE]\n\
	ldrh r0, [r7, 0x14]\n\
	adds r0, 0x1\n\
	strh r0, [r7, 0x14]\n\
	movs r0, 0x10\n\
	strh r0, [r4, 0x2E]\n\
	mov r0, r9\n\
	strh r0, [r4, 0x30]\n\
	movs r0, 0x6\n\
	strh r0, [r4, 0x32]\n\
	adds r5, 0x1C\n\
	adds r3, r5\n\
	ldr r0, _080D0700 @ =sub_80D0704\n\
	str r0, [r3]\n\
	mov r1, r8 @duplicate_obj_of_side_rel2move_in_transparent_mode(0)\n\
	lsls r0, r1, 24\n\
	lsrs r0, 24\n\
	movs r1, 0x10\n\
	ldrsh r2, [r7, r1]\n\
	adds r1, r2, 0\n\
	movs r3, 0\n\
	bl obj_id_set_rotscale\n\
	ldrb r0, [r4, 0x1]\n\
	movs r3, 0x4\n\
	negs r3, r3\n\
	ands r3, r0\n\
	movs r0, 0x1\n\
	orrs r3, r0\n\
	strb r3, [r4, 0x1]\n\
	lsrs r1, r3, 6\n\
	ldrb r2, [r4, 0x3]\n\
	lsrs r2, 6\n\
	lsls r3, 30\n\
	lsrs r3, 30\n\
	adds r0, r4, 0\n\
	bl CalcCenterToCornerVec\n\
_080D06EE:\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080D06FC: .4byte gSprites\n\
_080D0700: .4byte sub_80D0704\n\
.syntax divided\n");
}
#endif

void sub_80D0704(struct Sprite* sprite)
{
    if (--sprite->data0 == 0)
    {
        gTasks[sprite->data1].data[sprite->data2]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        obj_delete_but_dont_free_vram(sprite);
    }
}

void sub_80D074C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (gBattleAnimArgs[1] == 0)
        DestroyAnimVisualTask(taskId);
    else
    {
        u8 spriteId = obj_id_for_side_relative_to_move(gBattleAnimArgs[0]);
        task->data[0] = spriteId;
        task->data[1] = 0;
        task->data[2] = gBattleAnimArgs[1];
        task->data[3] = 0;
        task->data[4] = 0;
        sub_80798F4(task, spriteId, &gUnknown_083D76F4);
        task->func = sub_80D07AC;
    }
}

void sub_80D07AC(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[1])
    {
        case 0:
            sub_807992C(task);
            task->data[4] += 3;
            gSprites[task->data[0]].pos2.y += task->data[4];
            if (++task->data[3] > 7)
            {
                task->data[3] = 0;
                task->data[1]++;
            }
            break;
        case 1:
            sub_807992C(task);
            gSprites[task->data[0]].pos2.y += task->data[4];
            if (++task->data[3] > 7)
            {
                task->data[3] = 0;
                task->data[1]++;
            }
            break;
        case 2:
            if (task->data[4] != 0)
            {
                gSprites[task->data[0]].pos2.y -= 2;
                task->data[4] -= 2;
            }
            else
                task->data[1]++;
            break;
        case 3:
            if (!sub_807992C(task))
            {
                if (--task->data[2] == 0)
                {
                    gSprites[task->data[0]].pos2.y = 0;
                    DestroyAnimVisualTask(taskId);
                }
                else
                {
                    sub_80798F4(task, task->data[0], &gUnknown_083D76F4);
                    task->data[1] = 0;
                }
            }
            break;
    }
}

void sub_80D08C8(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = obj_id_for_side_relative_to_move(0);
    sub_80798F4(task, spriteId, &gUnknown_083D7714);
    task->func = sub_80D0904;
}

void sub_80D0904(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (!sub_807992C(task))
        DestroyAnimVisualTask(taskId);
}

void sub_80D0930(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2) + 32;
        sprite->data1 = 0x40;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->pos1.x = sub_8077ABC(gBattleAnimPlayerMonIndex, 2) - 32;
        sprite->data1 = -0x40;
    }
    sprite->pos1.y = sub_8077ABC(gBattleAnimPlayerMonIndex, 3);
    sprite->data0 = 0x34;
    sprite->data2 = 0;
    sprite->data3 = 0;
    sprite->data4 = 0;
    oamt_set_x3A_32(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80D09C0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimPlayerMonIndex;
    else
        bank = gBattleAnimEnemyMonIndex;
    if (GetBankSide(bank) == 1)
    {
        gBattleAnimArgs[1] *= -1;
    }
    sprite->pos1.x = sub_8077ABC(bank, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = sub_8077ABC(bank, 3) + gBattleAnimArgs[2];
    if (sprite->pos1.y <= 7)
        sprite->pos1.y = 8;
    oamt_set_x3A_32(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}

void sub_80D0A4C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = obj_id_for_side_relative_to_move(0);
    task->data[0] = spriteId;
    task->data[1] = 0;
    sub_80798F4(task, spriteId, &gUnknown_083D77B0);
    task->func = sub_80D0A8C;
}

void sub_80D0A8C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (!sub_807992C(task))
        DestroyAnimVisualTask(taskId);
}

void sub_80D0AB8(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = obj_id_for_side_relative_to_move(0);
    task->data[1] = 0;
    task->data[2] = 4;
    task->data[3] = 7;
    task->data[4] = 3;
    task->data[5] = gSprites[task->data[0]].pos1.x;
    task->data[6] = gSprites[task->data[0]].pos1.y;
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[9] = 2;
    if (GetBankSide(gBattleAnimPlayerMonIndex) == 1)
        task->data[2] *= -1;
    task->func = sub_80D0B3C;
}

void sub_80D0B3C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (++task->data[7] > 2)
    {
        task->data[7] = 0;
        task->data[8]++;
        if ((task->data[8] & 1) != 0)
        {
            gSprites[task->data[0]].pos1.y += task->data[9];
        }
        else
            gSprites[task->data[0]].pos1.y -= task->data[9];
    }
    switch (task->data[1])
    {
        case 0:
            gSprites[task->data[0]].pos1.x += task->data[2];
            if (--task->data[3] == 0)
            {
                task->data[3] = 14;
                task->data[1] = 1;
            }
            break;
        case 1:
            gSprites[task->data[0]].pos1.x -= task->data[2];
            if (--task->data[3] == 0)
            {
                task->data[3] = 7;
                task->data[1] = 2;
            }
            break;
        case 2:
            gSprites[task->data[0]].pos1.x += task->data[2];
            if (--task->data[3] == 0)
            {
                if (--task->data[4] != 0)
                {
                    task->data[3] = 7;
                    task->data[1] = 0;
                }
                else
                {
                    if ((task->data[8] & 1) != 0)
                    {
                        gSprites[task->data[0]].pos1.y -= task->data[9];
                    }
                    DestroyAnimVisualTask(taskId);
                }
            }
        break;
    }
}

void sub_80D0C88(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct UnknownStruct_2 sp;
    s16 i;
    task->data[0] = sub_8077FC0(gBattleAnimEnemyMonIndex) + 32;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[15] = sub_807A100(gBattleAnimEnemyMonIndex, 0);
    if (GetBankIdentity_permutated(gBattleAnimEnemyMonIndex) == 1)
    {
        task->data[6] = gUnknown_030042C0;
        sp.dest = (u16 *)REG_ADDR_BG1HOFS;
    }
    else
    {
        task->data[6] = gUnknown_03004288;
        sp.dest = (u16 *)REG_ADDR_BG2HOFS;
    }
    for (i = task->data[0] - 0x40; i <= task->data[0];i++)
    {
        if (i >= 0)
        {
            gUnknown_03004DE0.unk0[i] = task->data[6] + 0xF0;
            gUnknown_03004DE0.unk780[i] = task->data[6] + 0xF0;
        }
    }
    sp.control = 0xa2600001;
    sp.unk8 = 1;
    sp.unk9 = 0;
    sub_80895F8(sp);
    task->func = sub_80D0D68;
}

#ifdef NONMATCHING
void sub_80D0D68(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[4])
    {
        case 0:
            if (++task->data[5] > 20)
                task->data[4]++;
            break;
        case 1:
            if (++task->data[1] > 3)
            {
                task->data[1] = 0;
                task->data[2] = 3 & task->data[3];
                task->data[5] = task->data[0] - task->data[3];
                switch (task->data[2])
                {
                    case 1:
                        task->data[5] -= 2;
                    default:
                    case 0:
                        break;
                    case 2:
                    case 3:
                        task->data[5]++;
                        break;
                }
                if (task->data[5] >= 0)
                {
                    gUnknown_03004DE0.unk0[task->data[5]] = task->data[6];
                    gUnknown_03004DE0.unk780[task->data[5]] = task->data[6];
                }
                if (++task->data[3] >= task->data[15])
                {
                    gUnknown_03004DC0.unk15 = 3;
                    DestroyAnimVisualTask(taskId);
                }
                    
            }
            break;
    }
}
#else
__attribute__((naked))
void sub_80D0D68(u8 taskId)
{
    asm(".syntax unified\n\
        push {r4,lr}\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	lsls r0, r4, 2\n\
	adds r0, r4\n\
	lsls r0, 3\n\
	ldr r1, _080D0D88 @ =gTasks\n\
	adds r3, r0, r1\n\
	movs r1, 0x10\n\
	ldrsh r0, [r3, r1]\n\
	cmp r0, 0\n\
	beq _080D0D8C\n\
	cmp r0, 0x1\n\
	beq _080D0DA2\n\
	b _080D0E22\n\
	.align 2, 0\n\
_080D0D88: .4byte gTasks\n\
_080D0D8C:\n\
	ldrh r0, [r3, 0x12]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0x12]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x14\n\
	ble _080D0E22\n\
	ldrh r0, [r3, 0x10]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0x10]\n\
	b _080D0E22\n\
_080D0DA2:\n\
	ldrh r0, [r3, 0xA]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0xA]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x3\n\
	ble _080D0E22\n\
	movs r0, 0\n\
	strh r0, [r3, 0xA]\n\
	ldrh r1, [r3, 0xE]\n\
	movs r0, 0x3\n\
	ands r0, r1\n\
	strh r0, [r3, 0xC]\n\
	ldrh r0, [r3, 0x8]\n\
	subs r0, r1\n\
	strh r0, [r3, 0x12]\n\
	movs r2, 0xC\n\
	ldrsh r1, [r3, r2]\n\
	cmp r1, 0x1\n\
	beq _080D0DD8\n\
	cmp r1, 0x1\n\
	ble _080D0DE0\n\
	cmp r1, 0x2\n\
	beq _080D0DDC\n\
	cmp r1, 0x3\n\
	beq _080D0DDC\n\
	b _080D0DE0\n\
_080D0DD8:\n\
	subs r0, 0x2\n\
	b _080D0DDE\n\
_080D0DDC:\n\
	adds r0, 0x1\n\
_080D0DDE:\n\
	strh r0, [r3, 0x12]\n\
_080D0DE0:\n\
	movs r1, 0x12\n\
	ldrsh r0, [r3, r1]\n\
	cmp r0, 0\n\
	blt _080D0E04\n\
	ldr r2, _080D0E28 @ =gUnknown_03004DE0\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	ldrh r1, [r3, 0x14]\n\
	strh r1, [r0]\n\
	movs r1, 0x12\n\
	ldrsh r0, [r3, r1]\n\
	lsls r0, 1\n\
	movs r1, 0xF0\n\
	lsls r1, 3\n\
	adds r2, r1\n\
	adds r0, r2\n\
	ldrh r1, [r3, 0x14]\n\
	strh r1, [r0]\n\
_080D0E04:\n\
	ldrh r0, [r3, 0xE]\n\
	adds r0, 0x1\n\
	strh r0, [r3, 0xE]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	movs r2, 0x26\n\
	ldrsh r1, [r3, r2]\n\
	cmp r0, r1\n\
	blt _080D0E22\n\
	ldr r1, _080D0E2C @ =gUnknown_03004DC0\n\
	movs r0, 0x3\n\
	strb r0, [r1, 0x15]\n\
	adds r0, r4, 0\n\
	bl DestroyAnimVisualTask\n\
_080D0E22:\n\
	pop {r4}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080D0E28: .4byte gUnknown_03004DE0\n\
_080D0E2C: .4byte gUnknown_03004DC0\n\
.syntax divided\n");
}
#endif

void sub_80D0E30(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimEnemyMonIndex, 0) - 16;
    sprite->pos1.y = sub_8077FC0(gBattleAnimEnemyMonIndex) + 16;
    sprite->data0 = 0;
    sprite->data1 = 0;
    sprite->data2 = 0;
    sprite->data3 = 16;
    sprite->data4 = 0;
    sprite->data5 = sub_807A100(gBattleAnimEnemyMonIndex, 0) + 2;
    sprite->data6 = sub_8076F98(0x3F);
    sprite->callback = sub_80D0E8C;
}
