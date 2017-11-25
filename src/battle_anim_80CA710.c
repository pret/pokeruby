#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_anim_80CA710.h"
#include "battle_interface.h"
#include "blend_palette.h"
#include "decompress.h"
#include "ewram.h"
#include "main.h"
#include "palette.h"
#include "rng.h"
#include "rom_8077ABC.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "unknown_task.h"

struct Struct_sub_8078914
{
    u8 *field_0;
    u8 *field_4;
    u8 field_8;
};

extern u8 gBanksBySide[];
extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;
extern struct SpriteTemplate gSpriteTemplate_83D631C;
extern struct SpriteTemplate gSpriteTemplate_83D6884;
extern struct SpriteTemplate gSpriteTemplate_83D74BC;
extern struct SpriteTemplate gSpriteTemplate_83D75AC;
extern struct SpriteTemplate gSpriteTemplate_83D79E8;
extern struct SpriteTemplate gBattleAnimSpriteTemplate_83D6FC8;
extern struct SpriteTemplate gBattleAnimSpriteTemplate_83D6FF8;
extern struct AffineAnimFrameCmd gUnknown_083D76F4;
extern struct AffineAnimFrameCmd gUnknown_083D7714;
extern struct AffineAnimFrameCmd gUnknown_083D77B0;
extern struct AffineAnimFrameCmd gUnknown_083D79BC;
extern struct AffineAnimFrameCmd gUnknown_083D7A98;
extern struct INCBIN_U8 gBattleAnimSpritePalette_206;
extern struct INCBIN_U8 gAttractTilemap;
extern struct INCBIN_U8 gAttractGfx;
extern struct INCBIN_U8 gAttractPal;
extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFaceContest;
extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFacePlayer;
extern struct INCBIN_U8 gBattleAnimBackgroundTilemap_ScaryFaceOpponent;
extern struct INCBIN_U8 gBattleAnimBackgroundImage_ScaryFace;
extern struct INCBIN_U8 gBattleAnimBackgroundPalette_ScaryFace;
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
extern u16 gUnknown_030042C4;
extern u16 gUnknown_03004240;
extern u16 gUnknown_030041B4;
extern s8 gUnknown_083D7A00[4][2];
extern u16 gUnknown_083D7A5C[5];

static void sub_80CA768(struct Sprite* sprite);
static void sub_80CA8B4(struct Sprite* sprite);
static void sub_80CA9F8(struct Sprite* sprite);
static void sub_80CAACC(struct Sprite* sprite);
static void sub_80CAB88(struct Sprite* sprite);
static void sub_80CABC0(struct Sprite* sprite);
static void sub_80CAC44(struct Sprite* sprite);
static void sub_80CADA8(struct Sprite* sprite);
static void sub_80CAE74(struct Sprite* sprite);
static void sub_80CAF20(struct Sprite* sprite);
static void sub_80CAF6C(struct Sprite* sprite);
static void sub_80CB09C(struct Sprite* sprite);
static void sub_80CB1A4(struct Sprite* sprite);
static void sub_80CB298(struct Sprite* sprite);
static void sub_80CB2D4(struct Sprite* sprite);
static void sub_80CB710(struct Sprite* sprite);
static void sub_80CBB60(struct Sprite* sprite);
static void sub_80CBC8C(struct Sprite* sprite);
static void sub_80CBCF8(struct Sprite* sprite);
static void sub_80CBDB0(struct Sprite* sprite);
static void sub_80CC408(struct Sprite* sprite);
static void sub_80CC580(struct Sprite* sprite);
static void sub_80CC7D4(struct Sprite* sprite);
static void sub_80CCB00(struct Sprite* sprite);
static void sub_80CCCB4(struct Sprite* sprite);
static void sub_80CCE0C(struct Sprite* sprite);
static void sub_80CCF70(struct Sprite* sprite);
static void sub_80CD0CC(struct Sprite* sprite, int unk1, int unk2);
static void sub_80CD2D4(struct Sprite* sprite);
static void sub_80CD394(struct Sprite* sprite);
static void sub_80CD408(struct Sprite* sprite);
static void sub_80CD4B8(struct Sprite* sprite);
static void sub_80CD4EC(struct Sprite* sprite);
static void sub_80CD5A8(struct Sprite* sprite);
static void sub_80CD654(struct Sprite* sprite);
static void sub_80CD67C(struct Sprite* sprite);
static void sub_80CD7CC(struct Sprite* sprite);
static void sub_80CD81C(struct Sprite* sprite);
static void sub_80CD8A8(struct Sprite* sprite);
static void sub_80CD8F8(struct Sprite* sprite);
static void sub_80CD91C(struct Sprite* sprite);
static void sub_80CD9B8(struct Sprite* sprite);
static void sub_80CD9D4(struct Sprite* sprite);
static void sub_80CDE78(struct Sprite* sprite);
static void sub_80CDEB0(struct Sprite* sprite);
static void sub_80CDEC0(struct Sprite* sprite);
static void sub_80CDF70(struct Sprite* sprite);
static void sub_80CE000(struct Sprite* sprite);
static void sub_80CE1AC(struct Sprite* sprite);
static void sub_80CE354(struct Sprite* sprite);
static void sub_80CE3B0(struct Sprite* sprite);
static void sub_80CE798(struct Sprite* sprite);
static void sub_80CE974(struct Sprite* sprite);
static void sub_80CEC1C(struct Sprite* sprite);
static void sub_80CED78(struct Sprite* sprite);
static void sub_80CEEE8(struct Sprite* sprite);
static void sub_80CF008(struct Sprite* sprite);
static void sub_80CF088(struct Sprite* sprite);
static void sub_80CF138(struct Sprite* sprite);
static void sub_80CF158(struct Sprite* sprite);
static void sub_80CF228(struct Sprite* sprite);
static void sub_80CF264(struct Sprite* sprite);
static void sub_80CF310(struct Sprite* sprite);
static void sub_80CF490(struct Sprite* sprite);
static void sub_80CF4B8(struct Sprite* sprite);
static void sub_80CF6B4(struct Sprite* sprite);
static void sub_80CFE2C(struct Sprite* sprite);
static void sub_80CFF68(struct Sprite* sprite);
static void sub_80D0030(struct Sprite* sprite);
static void sub_80D00B4(struct Sprite* sprite);
static void sub_80D020C(struct Sprite* sprite);
static void sub_80D02D0(struct Sprite* sprite);
static void sub_80D0344(struct Sprite* sprite);
static void sub_80D03A8(struct Sprite* sprite);
extern void sub_80D0704(struct Sprite* sprite);
static void sub_80D0E8C(struct Sprite* sprite);
static void sub_80D1098(struct Sprite* sprite);
static void sub_80D13AC(struct Sprite* sprite);
static void sub_80D1424(struct Sprite* sprite);
static void sub_80D144C(struct Sprite* sprite);
static void sub_80D14C4(struct Sprite* sprite);
static void sub_80D1504(struct Sprite* sprite);
static void sub_80D154C(struct Sprite* sprite);
static void sub_80D158C(struct Sprite* sprite);
static void sub_80D1FA4(struct Sprite* sprite);
static void sub_80D2094(struct Sprite* sprite);
static void sub_80D2704(struct Sprite* sprite);
static void sub_80D2834(struct Sprite* sprite);
static s16 sub_80CC338(struct Sprite* sprite);
static void sub_80CB3A8(u8 taskId);
static void sub_80CB438(u8 taskId);
static void sub_80CBF5C(u8 taskId);
static void sub_80CDB60(u8 taskId);
static void sub_80CDD20(u8 taskId);
static void sub_80CE4D4(u8 taskId);
static void sub_80CE910(u8 taskId);
static void sub_80CF514(u8 taskId);
static void sub_80D0428(u8 taskId);
static void sub_80D04E0(u8 taskId);
static void sub_80D07AC(u8 taskId);
static void sub_80D0904(u8 taskId);
static void sub_80D0A8C(u8 taskId);
static void sub_80D0B3C(u8 taskId);
static void sub_80D0D68(u8 taskId);
static void sub_80D15E0(u8 taskId);
static void sub_80D16A0(u8 taskId);
static void sub_80D1808(u8 taskId);
static void sub_80D1930(u8 taskId);
static void sub_80D1D48(u8 taskId);
static void sub_80D1D9C(u8 taskId);
static void sub_80D21F0(u8 taskId);
static void sub_80D24E0(u8 taskId);
static void sub_80CC358(struct Task* task, u8 taskId);
extern void sub_80D0614(struct Task* task, u8 taskId);
static void sub_80CEBC4(s16 a, s16 b, s16* c, s16* d, s8 e);


void sub_80CA710(struct Sprite* sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];

    if (GetBankSide(gBattleAnimBankAttacker))
    {
        sprite->data[3] = -gBattleAnimArgs[4];
    }
    else
    {
        sprite->data[3] = gBattleAnimArgs[4];
    }

    sprite->data[4] = gBattleAnimArgs[5];
    sprite->callback = sub_80CA768;
}

void sub_80CA768(struct Sprite* sprite)
{
    if (sprite->data[0] > 0)
    {
        sprite->data[0]--;
        sprite->pos2.y = sprite->data[2] >> 8;
        sprite->data[2] += sprite->data[1];
        sprite->pos2.x = Sin(sprite->data[5], sprite->data[3]);
        sprite->data[5] = (sprite->data[5] + sprite->data[4]) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CA7B0(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
}

void sub_80CA800(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[3]);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CA858(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80CA8B4;
    sub_80CA8B4(sprite);
}

void sub_80CA8B4(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite))
    {
        DestroySprite(sprite);
    }
    else
    {
        if (sprite->data[5] > 0x7F)
        {
            sprite->subpriority = sub_8079E90(gBattleAnimBankTarget) + 1;
        }
        else
        {
            sprite->subpriority = sub_8079E90(gBattleAnimBankTarget) + 6;
        }
        sprite->pos2.x += Sin(sprite->data[5], 5);
        sprite->pos2.y += Cos(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 15) & 0xFF;
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
        CreateSpriteAndAnimate(&gSpriteTemplate_83D631C, 0, 0, sub_8079E90(gBattleAnimBankTarget) + 1);
    }

    if (gTasks[taskId].data[1] == 15)
        DestroyAnimVisualTask(taskId);
}

void sub_80CA9A8(struct Sprite* sprite)
{
    sub_8078764(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[5] = gBattleAnimArgs[2];
    sub_80786EC(sprite);
    sprite->callback = sub_80CA9F8;
}

void sub_80CA9F8(struct Sprite* sprite)
{
    if (sub_8078718(sprite))
        move_anim_8072740(sprite);
}

void sub_80CAA14(struct Sprite* sprite)
{
    u16 a = Random();
    u16 b;
    
    StartSpriteAnim(sprite, a & 7);
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        sprite->pos1.x -= 20;
    }
    else
    {
        sprite->pos1.x += 20;
    }

    b = Random();
    sprite->data[0] = (b & 31) + 64;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sub_8078D60(sprite);
    sprite->data[5] = Random() & 0xFF;
    sprite->data[6] = sprite->subpriority;
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
        sprite->pos2.y += Cos(sprite->data[5], 12);
        if (sprite->data[5] <= 0x7E)
        {
            sprite->subpriority = sprite->data[6];
        }
        else
        {
            sprite->subpriority = sprite->data[6] + 1;
        }

        sprite->data[5] = (sprite->data[5] + 24) & 0xFF;
    }
}

void sub_80CAB18(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    sprite->callback = sub_80CAB88;
}

void sub_80CAB88(struct Sprite* sprite)
{
    if (sub_8078718(sprite))
    {
        sprite->invisible = 1;
        sprite->data[0] = 10;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CABC0);
    }
}

void sub_80CABC0(struct Sprite* sprite)
{
    sprite->invisible = 0;
    StartSpriteAnim(sprite, 1);
    sprite->data[0] = 60;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CABF8(struct Sprite* sprite)
{
    sub_8078764(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    if (gBattleAnimArgs[4] == 1)
    {
        sprite->oam.objMode = 1;
    }

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->callback = sub_80CAC44;
    sub_80CAC44(sprite);
}

void sub_80CAC44(struct Sprite* sprite)
{
    u8 var1;
    
    sprite->pos2.x = Sin(sprite->data[1], 32);
    sprite->pos2.y = Cos(sprite->data[1], -3) + ((sprite->data[2] += 24) >> 8);
    if ((u16)(sprite->data[1] - 0x40) < 0x80)
    {
        sprite->oam.priority = (sub_8079ED4(gBattleAnimBankTarget) & 3);
    }
    else
    {
        var1 = sub_8079ED4(gBattleAnimBankTarget) + 1;
        if (var1 > 3)
        {
            var1 = 3;
        }

        sprite->oam.priority = var1;
    }

    sprite->data[1] = (sprite->data[1] + 2) & 0xFF;
    sprite->data[0]--;
    if (sprite->data[0] == -1)
        move_anim_8072740(sprite);
}

void sub_80CACEC(u8 taskId)
{
    if (NotInBattle() || !IsDoubleBattle())
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        if (GetBankIdentity_permutated(gBattleAnimBankTarget) == 1)
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
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3) + gBattleAnimArgs[2];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = 0x40;
    sprite->callback = sub_80CADA8;
    sub_80CADA8(sprite);
}

void sub_80CADA8(struct Sprite* sprite)
{
    if (!sub_8078B5C(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[5], 32);
        sprite->pos2.y += Cos(sprite->data[5], -5);
        if ((u16)(sprite->data[5] - 0x40) < 0x80)
        {
            sprite->subpriority = sub_8079E90(gBattleAnimBankAttacker) - 1;
        }
        else
        {
            sprite->subpriority = sub_8079E90(gBattleAnimBankAttacker) + 1;
        }

        sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CAE20(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3) + gBattleAnimArgs[2];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = 0x40;
    sprite->callback = sub_80CAE74;
    sub_80CAE74(sprite);
}

void sub_80CAE74(struct Sprite* sprite)
{
    if (!sub_8078B5C(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[5], 8);
        if ((u16)(sprite->data[5] - 0x3B) < 5 || (u16)(sprite->data[5] - 0xBB) < 5)
        {
            sprite->oam.matrixNum ^= 8;
        }

        sprite->data[5] = (sprite->data[5] + 5) & 0xFF;
    }
    else
    {
       move_anim_8072740(sprite);
    }
}

void sub_80CAED8(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->callback = sub_80CAF20;
}

void sub_80CAF20(struct Sprite* sprite)
{
    if (!sprite->data[2])
    {
        if (sprite->data[1] & 1)
        {
            sprite->data[0] = 0x80;
            sprite->data[1] = 0;
            sprite->data[2] = 0;
        }
        else
        {
            sprite->data[0] = sprite->data[1] & 1;
            sprite->data[1] = sprite->data[1] & 1;
            sprite->data[2] = sprite->data[1] & 1;
        }
        sprite->callback = sub_80CAF6C;
    }
    else
    {
        sprite->data[2]--;
        sprite->pos1.x += sprite->data[0];
        sprite->pos1.y += sprite->data[1];
    }
}

void sub_80CAF6C(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        sprite->pos2.x = -Sin(sprite->data[0], 0x19);
    }
    else
    {
        sprite->pos2.x = Sin(sprite->data[0], 0x19);
    }

    sprite->data[0] = (sprite->data[0] + 2) & 0xFF;
    sprite->data[1]++;
    if (!(sprite->data[1] & 1))
    {
        sprite->pos2.y++;
    }

    if (sprite->data[1] > 0x50)
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CAFD0(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    if (GetBankSide(gBattleAnimBankAttacker))
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    if (!(gBattleAnimArgs[6]))
    {
        sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
        sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    }
    else
    {
        sub_807A3FC(gBattleAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
        sprite->data[2] += gBattleAnimArgs[2];
        sprite->data[4] += gBattleAnimArgs[3];
    }

    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) == GetBankSide(gBattleAnimBankTarget))
    {
        sprite->data[0] = 1;
    }
    else
    {
        sprite->data[0] = 0;
    }

    sprite->callback = sub_80CB09C;
}

void sub_80CB09C(struct Sprite* sprite)
{
    bool8 c = FALSE;
    s16 a = sprite->data[0];
    s16 b = sprite->data[7];
    s16 r0;
    
    sprite->data[0] = 1;
    sub_8078718(sprite);
    r0 = sprite->data[7];
    sprite->data[0] = a;
    if (b > 0xC8 && r0 <= 0x37 && sprite->oam.affineParam == 0)
        sprite->oam.affineParam++;

    if (sprite->oam.affineParam != 0 && sprite->data[0] != 0)
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
    if (!NotInBattle() && IsDoubleBattle() == TRUE)
    {
        sub_807A3FC(gBattleAnimBankTarget, 1, &sprite->pos1.x, &sprite->pos1.y);
    }

    sprite->pos1.y += 32;
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[3];
    sprite->data[4] = gBattleAnimArgs[4];
    sprite->callback = sub_80CB1A4;
}

void sub_80CB1A4(struct Sprite* sprite)
{
    if (sprite->data[1] == 0xFF)
    {
        sprite->pos1.y -= 2;
    }
    else if (sprite->data[1] > 0)
    {
        sprite->pos1.y -= 2;
        sprite->data[1] -= 2;
    }

    sprite->data[5] += sprite->data[2];
    if (sprite->data[0] < sprite->data[4])
        sprite->data[5] += sprite->data[2];

    sprite->data[5] &= 0xFF;
    sprite->pos2.x = Cos(sprite->data[5], sprite->data[3]);
    sprite->pos2.y = Sin(sprite->data[5], 5);
    if (sprite->data[5] <= 0x7F)
    {
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankTarget) - 1;
    }
    else
    {
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankTarget) + 1;
    }

    sprite->data[0]--;
    if (!sprite->data[0])
        move_anim_8072740(sprite);
}

void sub_80CB25C(struct Sprite* sprite)
{
    sub_8078764(sprite, 0);
    sprite->affineAnimPaused = 1;
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[2]);
    sprite->data[6] = gBattleAnimArgs[2];
    sprite->data[7] = gBattleAnimArgs[3];
    sprite->callback = sub_80CB298;
}

void sub_80CB298(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->affineAnimPaused = 0;
        GetAnimBankSpriteId(1);
        sprite->data[0] = 0x100;
        sprite->callback = sub_80CB2D4;
    }
}

void sub_80CB2D4(struct Sprite* sprite)
{
    GetAnimBankSpriteId(1);
    if (!sprite->data[2])
    {
        sprite->data[0] += 11;
    }
    else
    {
        sprite->data[0] -= 11;
    }
    sprite->data[1]++;
    if (sprite->data[1] == 6)
    {
        sprite->data[1] = 0;
        sprite->data[2] ^= 1;
    }

    if (sprite->affineAnimEnded)
    {
        sprite->data[7]--;
        if (sprite->data[7] > 0)
        {
            StartSpriteAffineAnim(sprite, sprite->data[6]);
        }
        else
        {
            move_anim_8072740(sprite);
        }
    }
}

void sub_80CB340(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(1);
    if (gSprites[spriteId].invisible)
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
    u8 spriteId = GetAnimBankSpriteId(1);
    gTasks[taskId].data[10] += gTasks[taskId].data[0];
    gSprites[spriteId].pos2.x = gTasks[taskId].data[10] >> 8;
    if (GetBankSide(gBattleAnimBankTarget))
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
    }

    gTasks[taskId].data[11] += 16;
    obj_id_set_rotscale(spriteId, gTasks[taskId].data[11], gTasks[taskId].data[11], 0);
    sub_8079A64(spriteId);
    gTasks[taskId].data[1]--;
    if (!gTasks[taskId].data[1])
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
            u8 spriteId = GetAnimBankSpriteId(1);
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
    switch (sprite->data[0])
    {
    case 0:
    {
        if (GetBankSide(gBattleAnimBankTarget) == 0)
        {
            s16 a = gBattleAnimArgs[0];
            gBattleAnimArgs[0] = -a;
        }

        sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[1];
        sprite->invisible = 1;
        sprite->data[0]++;
        break;
    }
    case 1:
    {
        sprite->invisible = 0;
        if (sprite->affineAnimEnded)
        {
            ChangeSpriteAffineAnim(sprite, 1);
            sprite->data[0] = 25;
            sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
            sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
            sprite->callback = sub_8078CC0;
            StoreSpriteCallbackInData(sprite, move_anim_8072740);
            break;
        }
    }
    }
}

void sub_80CB59C(struct Sprite* sprite)
{
    if (!sprite->data[0])
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1);
        sprite->pos2.x = gBattleAnimArgs[0];
        sprite->pos2.y = gBattleAnimArgs[1];
        sprite->subpriority = gBattleAnimArgs[2] + 30;
        StartSpriteAnim(sprite, gBattleAnimArgs[3]);
        sprite->data[2] = gBattleAnimArgs[4];
        sprite->data[0]++;
        if ((sprite->pos1.y + sprite->pos2.y) > 120)
        {
            sprite->pos1.y += -120 + (sprite->pos2.y + sprite->pos1.y);
        }
    }
    sprite->callback = sub_80CB710;
}

void sub_80CB620(struct Sprite *sprite)
{
    s16 p1 = sub_8077ABC(gBattleAnimBankAttacker, 2);
    s16 p2 = sub_8077ABC(gBattleAnimBankAttacker, 3);
    s16 e1 = sub_8077ABC(gBattleAnimBankTarget, 2);
    s16 e2 = sub_8077ABC(gBattleAnimBankTarget, 3);

    e1 -= p1;
    e2 -= p2;
    sprite->pos1.x = p1 + e1 * gBattleAnimArgs[0] / 100;
    sprite->pos1.y = p2 + e2 * gBattleAnimArgs[0] / 100;
    sprite->pos2.x = gBattleAnimArgs[1];
    sprite->pos2.y = gBattleAnimArgs[2];
    sprite->subpriority = gBattleAnimArgs[3] + 30;
    StartSpriteAnim(sprite, gBattleAnimArgs[4]);
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->callback = sub_80CB710;
    gUnknown_03000728[0] = sprite->pos1.x;
    gUnknown_03000728[1] = sprite->pos1.y;
    gUnknown_03000728[2] = e1;
    gUnknown_03000728[3] = e2;
}

void sub_80CB710(struct Sprite* sprite)
{
    if (++sprite->data[0] > (sprite->data[2] - 10))
        sprite->invisible = sprite->data[0] % 2;

    if (sprite->data[0] > sprite->data[2])
        move_anim_8072740(sprite);
}

void sub_80CB768(struct Sprite* sprite)
{
    if (!sprite->data[0])
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[1];
        sprite->data[1] = gBattleAnimArgs[2];
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->data[3] = gBattleAnimArgs[4];
    }

    sprite->data[0]++;
    sprite->pos2.x = sprite->data[1] * sprite->data[0];
    sprite->pos2.y = Sin((sprite->data[0] * 20) & 0xFF, sprite->data[2]);
    if (sprite->data[0] > sprite->data[3])
        move_anim_8072740(sprite);
}

void sub_80CB7EC(struct Sprite* sprite, s16 c)
{
    s32 a = (sprite->pos1.x * 256) | sprite->pos1.y;
    s32 b = (sprite->data[6] * 256) | sprite->data[7];
    c *= 256;
    sprite->data[5] = a;
    sprite->data[6] = b;
    sprite->data[7] = c;
}

bool8 sub_80CB814(struct Sprite* sprite)
{
    u16 r10 = (u8)(sprite->data[5] >> 8);
    u16 r9 = (u8)sprite->data[5];
    s32 r2 = (u8)(sprite->data[6] >> 8);
    s32 r4 = (u8)sprite->data[6];
    s16 r6 = sprite->data[7] >> 8;
    s16 r3 = sprite->data[7] & 0xFF;
    s16 r4_2;
    s16 r0;
    s32 var1;
    s32 var2;

    if (r2 == 0)
    {
        r2 = -32;
    }
    else if (r2 == 255)
    {
        r2 = 0x110;
    }

    r4_2 = r4 - r9;
    r0 = r2 - r10;
    var1 = r0 * r3 / r6;
    var2 = r4_2 * r3 / r6;
    sprite->pos1.x = var1 + r10;
    sprite->pos1.y = var2 + r9;
    if (++r3 == r6)
        return TRUE;

    sprite->data[7] = (r6 << 8) | r3;
    return FALSE;
}

void sub_80CB8B8(struct Sprite* sprite)
{
    if (sprite->data[0] == 10)
    {
        StartSpriteAffineAnim(sprite, 1);
    }

    sprite->data[0]++;
    if (sprite->data[0] > 50)
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CB8E8(struct Sprite* sprite)
{
    sprite->data[0] += sprite->data[3] * 128 / sprite->data[4];
    if (sprite->data[0] >= 128)
    {
        sprite->data[1]++;
        sprite->data[0] = 0;
    }

    sprite->pos2.y = Sin(sprite->data[0] + 128, 30 - sprite->data[1] * 8);
    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CB8B8;
    }
}

void sub_80CB94C(struct Sprite* sprite)
{
    s16 e1;
    s16 e2;
    sub_80787B0(sprite, 0);
    e1 = sub_8077ABC(gBattleAnimBankTarget, 0);
    e2 = sub_8077ABC(gBattleAnimBankTarget, 1);
    if ((gBattleAnimBankAttacker ^ 2) == gBattleAnimBankTarget)
    {
        sprite->data[6] = e1;
        sprite->data[7] = e2 + 10;
        sub_80CB7EC(sprite, 0x3C);
        sprite->data[3] = 1;
    }
    else
    {
        sprite->data[6] = e1;
        sprite->data[7] = e2 + 10;
        sub_80CB7EC(sprite, 0x3C);
        sprite->data[3] = 3;
    }

    sprite->data[4] = 0x3C;
    sprite->callback = sub_80CB8E8;
}

void sub_80CB9C4(struct Sprite* sprite)
{
    int zero;
    sprite->data[0] += ((sprite->data[3] * 128) / sprite->data[4]);
    zero = 0;
    if (sprite->data[0] > 0x7F)
    {
        sprite->data[1]++;
        sprite->data[0] = zero;
    }

    sprite->pos2.y = Sin(sprite->data[0] + 0x80, 30 - sprite->data[1] * 8);
    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = zero;
        sprite->data[0] = zero;
        move_anim_8072740(sprite);
    }
}

void sub_80CBA28(struct Sprite* sprite)
{
    s16 e = sub_8077ABC(gBattleAnimBankTarget, 1);
    if (GetBankSide(gBattleAnimBankTarget) == 0)
    {
        sprite->data[6] = 0;
        sprite->data[7] = e + 10;
        sub_80CB7EC(sprite, 0x28);
        sprite->data[3] = 3;
        sprite->data[4] = 0x3C;
        sprite->callback = sub_80CB8E8;
    }
    else
    {
        sprite->data[6] = 255;
        sprite->data[7] = e + 10;
        if (NotInBattle())
            sprite->data[6] = 0;

        sub_80CB7EC(sprite, 0x28);
        sprite->data[3] = 3;
        sprite->data[4] = 0x3C;
        sprite->callback = sub_80CB9C4;
    }
}

void sub_80CBAA4(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_8078764(sprite, 0);
        sprite->data[1] = gBattleAnimArgs[2];
    }

    sprite->data[0]++;
    sprite->pos2.y = sprite->data[1] * sprite->data[0];
    if (sprite->animEnded)
    {
        move_anim_8072740(sprite);
    }
}

void sub_80CBAE8(struct Sprite* sprite)
{
    s16 p1;
    s16 p2;
    sub_8078764(sprite, 0);
    p1 = sub_8077ABC(gBattleAnimBankAttacker, 0);
    p2 = sub_8077ABC(gBattleAnimBankAttacker, 1);
    if ((gBattleAnimBankTarget ^ 2) == gBattleAnimBankAttacker)
    {
        sprite->data[6] = p1;
        sprite->data[7] = p2 + 10;
        sub_80CB7EC(sprite, 0x3c);
        sprite->data[3] = 1;
    }
    else
    {
        sprite->data[6] = p1;
        sprite->data[7] = p2 + 10;
        sub_80CB7EC(sprite, 0x3c);
        sprite->data[3] = 3;
    }

    sprite->data[4] = 0x3C;
    sprite->callback = sub_80CBB60;
}

void sub_80CBB60(struct Sprite* sprite)
{
    int zero;
    sprite->data[0] += ((sprite->data[3] * 128) / sprite->data[4]);
    zero = 0;
    if (sprite->data[0] > 0x7F)
    {
        sprite->data[1]++;
        sprite->data[0] = zero;
    }

    sprite->pos2.y = Sin(sprite->data[0] + 0x80, 30 - sprite->data[1] * 8);
    if (sprite->pos2.y == 0)
    {
        PlaySE12WithPanning(0x7D, sub_8076F98(0x3F));
    }

    if (sub_80CB814(sprite))
    {
        sprite->pos2.y = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CB8B8;
        PlaySE12WithPanning(0x7D, sub_8076F98(-0x40));
    }
}

void sub_80CBBF0(struct Sprite* sprite)
{
    int a;
    int b;

    if (sprite->data[0] == 0)
    {
        if (!NotInBattle())
        {
            sprite->data[1] = gBattleAnimArgs[1];
            sprite->pos1.x = 0x78;
        }
        else
        {
            a = gBattleAnimArgs[1] - 32;
            if (a < 0)
                b = gBattleAnimArgs[1] + 0xDF;
            else
                b = a;

            sprite->data[1] = a - ((b >> 8) << 8);
            sprite->pos1.x = 0x46;
        }

        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[0];
        sprite->data[4] = 20;
        sprite->pos2.x = Cos(sprite->data[1], 0x3C);
        sprite->pos2.y = Sin(sprite->data[1], 20);
        sprite->callback = sub_80CBC8C;
        if (sprite->data[1] > 0 && sprite->data[1] < 0xC0)
            sprite->subpriority = 31;
        else
            sprite->subpriority = 29;
    }
}

void sub_80CBC8C(struct Sprite* sprite)
{
    switch (sprite->data[3])
    {
    case 0:
        if (sprite->data[2] > 0x4E)
        {
            sprite->data[3] = 1;
            StartSpriteAffineAnim(sprite, 1);
            break;
        }
        else
        {
            sprite->data[2] += sprite->data[4] / 10;
            sprite->data[4] += 3;
            sprite->pos1.y = sprite->data[2];
            break;
        }
        break;
    case 1:
        if (sprite->data[3] && sprite->affineAnimEnded)
        {
            sprite->data[0] = 0;
            sprite->data[2] = 0;
            sprite->callback = sub_80CBCF8;
        }
        break;
    }
}



void sub_80CBCF8(struct Sprite* sprite)
{
    if (sprite->data[2] == gUnknown_083D680C[sprite->data[0]][1])
	{
	    if (gUnknown_083D680C[sprite->data[0]][2] == 0x7F)
		{
		    sprite->data[0] = 0;
			sprite->callback = sub_80CBDB0;
		}

		sprite->data[2] = 0;
		sprite->data[0]++;
	}
	else
	{
	    sprite->data[2]++;
		sprite->data[1] = (gUnknown_083D680C[sprite->data[0]][0] * gUnknown_083D680C[sprite->data[0]][2] + sprite->data[1]) & 0xFF;
		if (!NotInBattle())
		{
		    if ((u16)(sprite->data[1] - 1) <= 0xBE)
            {
			    sprite->subpriority = 31;
			}
			else
			{
			    sprite->subpriority = 29;
		    }
		}

		sprite->pos2.x = Cos(sprite->data[1], 0x3C);
		sprite->pos2.y = Sin(sprite->data[1], 20);
	}
}

void sub_80CBDB0(struct Sprite* sprite)
{
    if (sprite->data[0] > 20)
        move_anim_8072740(sprite);

	sprite->invisible = sprite->data[0] % 2;
	sprite->data[0]++;
}

void sub_80CBDF4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[4] = sub_8079E90(gBattleAnimBankTarget) - 1;
    task->data[6] = sub_8077ABC(gBattleAnimBankTarget, 2);
    task->data[7] = sub_8077ABC(gBattleAnimBankTarget, 3);
    task->data[10] = sub_807A100(gBattleAnimBankTarget, 1);
    task->data[11] = sub_807A100(gBattleAnimBankTarget, 0);
    task->data[5] = (GetBankSide(gBattleAnimBankTarget) == 1) ? 1 : -1;
    task->data[9] = 0x38 - (task->data[5] * 64);
    task->data[8] = task->data[7] - task->data[9] + task->data[6];
    task->data[2] = CreateSprite(&gSpriteTemplate_83D6884, task->data[8], task->data[9], task->data[4]);
    if (task->data[2] == 0x40)
        DestroyAnimVisualTask(taskId);

    gSprites[task->data[2]].data[0] = 10;
    gSprites[task->data[2]].data[1] = task->data[8];
    gSprites[task->data[2]].data[2] = task->data[6] - (task->data[10] / 2 + 10) * task->data[5];
    gSprites[task->data[2]].data[3] = task->data[9];
    gSprites[task->data[2]].data[4] = task->data[7] + (task->data[11] / 2 + 10) * task->data[5];
    gSprites[task->data[2]].data[5] = sub_80CC338(&gSprites[task->data[2]]);
    sub_80786EC(&gSprites[task->data[2]]);
    task->func = sub_80CBF5C;
}

void sub_80CBF5C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct Sprite* sprite = &gSprites[task->data[2]];
    int a = task->data[0];
    switch (a)
    {
    case 4:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 5;
            task->data[0] = 0xFF;
        }
        break;
    case 8:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 9;
            task->data[0] = 0xFF;
        }
        break;
    case 0:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
            break;

        task->data[15] = 1;
        task->data[0] = 0xFF;
        break;
    case 1:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] += 2;
        task->data[3] = a;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 2:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
            break;

        task->data[15] = 3;
        task->data[0] = 0xFF;
        break;
    case 3:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] - ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] - ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[3] = 2;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 5:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] + ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] + ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] -= 2;
        task->data[3] = 3;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 6:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
            break;

        task->data[15] = 7;
        task->data[0] = 0xFF;
        break;
    case 7:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] += 2;
        task->data[3] = 4;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 9:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] - ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] + ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[3] = 5;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    case 10:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 11;
            task->data[0] = 0xFF;
        }
        break;
    case 11:
    {
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[8];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[9];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] -= 2;
        task->data[3] = 6;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        sub_80786EC(sprite);
        task->data[0]++;
        break;
    }
    case 12:
        sub_80CC358(task, taskId);
        if (sub_8078718(sprite) != 0)
        {
            DestroySprite(sprite);
            task->data[0]++;
        }
        break;
    case 13:
        if (task->data[12] == 0)
        {
            DestroyAnimVisualTask(taskId);
        }
        break;
    case 255:
        task->data[1]++;
        if (task->data[1] > 5)
        {
            task->data[1] = 0;
            task->data[0] = task->data[15];
        }
        break;
    }
}

s16 sub_80CC338(struct Sprite* sprite)
{
    s16 var = 8;
    if (sprite->data[4] < sprite->pos1.y)
        var = -var;

    return var;
}

void sub_80CC358(struct Task* task, u8 taskId)
{
    task->data[14]++;
    if (task->data[14] > 0)
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
            gSprites[spriteId].data[6] = taskId;
            gSprites[spriteId].data[7] = 12;
            gTasks[taskId].data[12]++;
            gSprites[spriteId].data[0] = task->data[13] & 1;
            gTasks[taskId].data[13]++;
            StartSpriteAnim(&gSprites[spriteId], task->data[3]);
            gSprites[spriteId].subpriority = task->data[4];
            gSprites[spriteId].callback = sub_80CC408;
        }
    }
}

void sub_80CC408(struct Sprite* sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] > 1)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
        sprite->data[1]++;
        if (sprite->data[1] > 8)
        {
            gTasks[sprite->data[6]].data[sprite->data[7]]--;
            DestroySprite(sprite);
        }
    }
}

void sub_80CC474(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[6])
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    if (GetBankSide(bank) != 0)
    {
        sprite->data[4] = 0;
        sprite->data[2] = gBattleAnimArgs[3];
        sprite->pos1.x = 0xFFF0;
    }
    else
    {
        sprite->data[4] = 1;
        sprite->data[2] = -gBattleAnimArgs[3];
        sprite->pos1.x = 0x100;
    }

    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[4];
    switch (gBattleAnimArgs[5])
    {
    case 0:
        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank);
        break;
    case 1:
        sprite->pos1.y = gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank) + 1;
        break;
    case 2:
        sprite->pos1.y = sub_8077ABC(bank, 3) + gBattleAnimArgs[0];
        sprite->oam.priority = sub_8079ED4(bank);
        break;
    case 3:
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[0];
        GetAnimBankSpriteId(1);
        sprite->oam.priority = sub_8079ED4(bank) + 1;
        break;
    }

    sprite->callback = sub_80CC580;
}

void sub_80CC580(struct Sprite* sprite)
{
    int a = sprite->data[7];
    sprite->data[7]++;
    sprite->pos2.y = (sprite->data[1] * gSineTable[sprite->data[0]]) >> 8;
    sprite->pos2.x = sprite->data[2] * a;
    sprite->data[0] = (sprite->data[3] * a) & 0xFF;
    if (sprite->data[4] == 0)
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
            BlendPalette(task->data[8], 0x10, task->data[10], gUnknown_083D6984[task->data[11]]);
            BlendPalette(task->data[12], 0x10, task->data[10], gUnknown_083D6984[task->data[11]]);
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
            a = sub_8077ABC(gBattleAnimBankAttacker, 2);
            b = sub_8077ABC(gBattleAnimBankAttacker, 3);
        }
        else
        {
            a = sub_8077ABC(gBattleAnimBankTarget, 2);
            b = sub_8077ABC(gBattleAnimBankTarget, 3);
        }

        sprite->data[0] = gBattleAnimArgs[4];
        if (gBattleAnimArgs[1] == 0)
        {
            sprite->pos1.x = gBattleAnimArgs[2] + a;
            sprite->pos1.y = gBattleAnimArgs[3] + b;
            sprite->data[5] = a;
            sprite->data[6] = b;
        }
        else
        {
            sprite->pos1.x = a;
            sprite->pos1.y = b;
            sprite->data[5] = gBattleAnimArgs[2] + a;
            sprite->data[6] = gBattleAnimArgs[3] + b;
        }

        x = sprite->pos1.x;
        sprite->data[1] = x * 16;
        y = sprite->pos1.y;
        sprite->data[2] = y * 16;
        sprite->data[3] = (sprite->data[5] - sprite->pos1.x) * 16 / gBattleAnimArgs[4];
        sprite->data[4] = (sprite->data[6] - sprite->pos1.y) * 16 / gBattleAnimArgs[4];
        c = sub_80790F0(sprite->data[5] - x, sprite->data[6] - y);
        if (NotInBattle())
            c -= 0x8000;

        sub_8078FDC(sprite, 0, 0x100, 0x100, c);
        sprite->callback = sub_80CC7D4;
    }
}

void sub_80CC7D4(struct Sprite* sprite)
{
    if (sprite->data[0])
    {
        sprite->data[1] += sprite->data[3];
        sprite->data[2] += sprite->data[4];
        sprite->pos1.x = sprite->data[1] >> 4 ;
        sprite->pos1.y = sprite->data[2] >> 4 ;
        sprite->data[0]--;
    }
    else
    {
        move_anim_8074EE0(sprite);
    }
}

void sub_80CC810(struct Sprite* sprite)
{
    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CC82C(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
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
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CC884(struct Sprite* sprite)
{
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
        StartSpriteAnim(sprite, 1);

    sprite->callback = sub_80CC810;
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}

void sub_80CC8C8(struct Sprite* sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];
    sprite->data[5] = gBattleAnimArgs[5];
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[6]);
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078504;
}

void sub_80CC914(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 1);
    if (GetBankSide(gBattleAnimBankTarget) == 0)
        sprite->pos1.y += 8;

    sprite->callback = sub_80CCB00;
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->hFlip = 1;
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] -= 0x400;
    sprite->data[2] += 0x400;
    sprite->data[5] = gBattleAnimArgs[2];
    if (sprite->data[5] == 1)
        sprite->data[1] = -sprite->data[1];
}

void sub_80CC9BC(struct Sprite* sprite)
{
    u8 a;
    u8 b;
    switch (gBattleAnimArgs[3])
    {
    case 1:
        a = sub_8077ABC(gBattleAnimBankTarget ^ 2, 0);
        b = sub_8077ABC(gBattleAnimBankTarget ^ 2, 1);
        break;
    case 2:
        a = sub_8077ABC(gBattleAnimBankTarget, 0);
        b = sub_8077ABC(gBattleAnimBankTarget, 1);
        if (IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2))
        {
            a = (sub_8077ABC(gBattleAnimBankTarget ^ 2, 0) + a) / 2;
            b = (sub_8077ABC(gBattleAnimBankTarget ^ 2, 1) + b) / 2;
        }
        break;
    case 0:
    default:
        a = sub_8077ABC(gBattleAnimBankTarget, 0);
        b = sub_8077ABC(gBattleAnimBankTarget, 1);
        break;
    }

    sprite->pos1.x = a;
    sprite->pos1.y = b;
    if (GetBankSide(gBattleAnimBankTarget) == 0)
        sprite->pos1.y += 8;

    sprite->callback = sub_80CCB00;
    if (gBattleAnimArgs[2] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->hFlip = 1;
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] -= 0x400;
    sprite->data[2] += 0x400;
    sprite->data[5] = gBattleAnimArgs[2];
    if (sprite->data[5] == 1)
        sprite->data[1] = -sprite->data[1];
}

void sub_80CCB00(struct Sprite* sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    if (sprite->data[5] == 0)
        sprite->data[1] += 0x18;
    else
        sprite->data[1] -= 0x18;

    sprite->data[2] -= 0x18;
    sprite->pos2.x = sprite->data[3] >> 8;
    sprite->pos2.y = sprite->data[4] >> 8;
    sprite->data[0]++;
    if (sprite->data[0] == 20)
    {
        StoreSpriteCallbackInData(sprite, move_anim_8072740);
        sprite->data[0] = 3;
        sprite->callback = sub_80782D8;
    }
}

void unref_sub_80CCB6C(struct Sprite* sprite)
{
    if (sprite->data[2] > 1)
    {
        if (sprite->data[3] & 1)
        {
            sprite->invisible = 0;
            gSprites[sprite->data[0]].invisible = 0;
            gSprites[sprite->data[1]].invisible = 0;
        }
        else
        {
            sprite->invisible = 1;
            gSprites[sprite->data[0]].invisible = 1;
            gSprites[sprite->data[1]].invisible = 1;
        }

        sprite->data[2] = 0;
        sprite->data[3]++;
    }
    else
    {
        sprite->data[2]++;
    }

    if (sprite->data[3] == 10)
    {
        DestroySprite(&gSprites[sprite->data[0]]);
        DestroySprite(&gSprites[sprite->data[1]]);
        move_anim_8072740(sprite);
    }
}

void sub_80CCC50(struct Sprite* sprite)
{
    sprite->data[0] = gBattleAnimArgs[2];
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];

    StartSpriteAnim(sprite, gBattleAnimArgs[5]);
    sprite->data[1] = -gBattleAnimArgs[3];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[3] = gBattleAnimArgs[4];
    sprite->callback = sub_80CCCB4;
    sub_80CCCB4(sprite);
}

void sub_80CCCB4(struct Sprite* sprite)
{
    sprite->pos2.x = Cos(sprite->data[0], 100);
    sprite->pos2.y = Sin(sprite->data[0], 20);
    if (sprite->data[0] <= 0x7F)
        sprite->subpriority = 0;
    else
        sprite->subpriority = 14;

    sprite->data[0] = (sprite->data[0] + sprite->data[1]) & 0xFF;
    sprite->data[5] += 0x82;
    sprite->pos2.y += sprite->data[5] >> 8;
    sprite->data[2]++;
    if (sprite->data[2] == sprite->data[3])
        move_anim_8072740(sprite);
}

void sub_80CCD24(struct Sprite* sprite)
{
    if (NotInBattle() != 0)
    {
        gBattleAnimArgs[1] += 8;
    }

    sprite->pos1.x = sub_8077EE4(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[1];
    if (GetBankSide(gBattleAnimBankAttacker) == 0 || NotInBattle())
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankAttacker) + 1;
    else
        sprite->oam.priority = sub_8079ED4(gBattleAnimBankAttacker);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = (IndexOfSpritePaletteTag(0x2828) << 4) + 0x100;
    sprite->data[7] = 16;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = (sprite->data[7] << 8) | (16 - sprite->data[7]);
    sprite->callback = sub_80CCE0C;
}

void sub_80CCE0C(struct Sprite* sprite)
{
    int a;
    int i;
    sprite->data[5] += 0x60;
    sprite->pos2.x = -(sprite->data[5] >> 8);
    sprite->data[1]++;
    if (sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        a = gPlttBufferFaded[sprite->data[2] + 1];
        i = 0;
        do
        {
            gPlttBufferFaded[sprite->data[2] + ++i] = gPlttBufferFaded[sprite->data[2] + i + 1];
        } while ( i <= 5 );

        gPlttBufferFaded[sprite->data[2] + 7] = a;
    }

    if (sprite->data[7] > 6 && sprite->data[0] >0 && ++sprite->data[6] > 1)
    {
        sprite->data[6] = 0;
        sprite->data[7] -= 1;
        REG_BLDALPHA = (sprite->data[7] << 8) | (16 - sprite->data[7]);;
    }

    if (sprite->data[0] >0)
    {
        sprite->data[0] -= 1;
    }
    else if (++sprite->data[6] > 1)
    {
        sprite->data[6] = 0;
        sprite->data[7]++;
        REG_BLDALPHA = (sprite->data[7] << 8) | (16 - sprite->data[7]);
        if (sprite->data[7] == 16)
        {
            sprite->invisible = 1;
            sprite->callback = sub_807861C;
        }
    }
}

void sub_80CCF04(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + 0xFFE8;
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[6] = 0;
    sprite->data[7] = 16;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = (sprite->data[7] << 8) | sprite->data[6];
    sprite->callback = sub_80CCF70;
}

void sub_80CCF70(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] > 0)
        {
            sprite->data[2] = 0;
            if (((++sprite->data[1]) & 1) != 0)
            {
                if (sprite->data[6] <= 15)
                    sprite->data[6]++;
            }
            else if (sprite->data[7] > 0)
                sprite->data[7]--;

            REG_BLDALPHA = (sprite->data[7] << 8) | sprite->data[6];
            if (sprite->data[6] == 16 && sprite->data[7] == 0)
            {
                sprite->data[1] = 0;
                sprite->data[0]++;
            }
        }
        break;
    case 1:
        if (++sprite->data[1] > 8)
        {
            sprite->data[1] = 0;
            StartSpriteAffineAnim(sprite, 1);
            sprite->data[0]++;
        }
        break;
    case 2:
        sub_80CD0CC(sprite, 16, 4);
        if (++sprite->data[1] > 2)
        {
            sprite->data[1] = 0;
            sprite->pos1.y++;
        }

        if (++sprite->data[2] <= 29)
            break;

        if (sprite->data[2] & 1)
        {
            if (sprite->data[6] > 0)
                sprite->data[6]--;
        }
        else if (sprite->data[7] <= 15)
        {
            sprite->data[7]++;
        }

        REG_BLDALPHA = (sprite->data[7] << 8) | sprite->data[6];
        if (sprite->data[6] == 0 && sprite->data[7] == 16)
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 3:
        sprite->invisible = 1;
        sprite->data[0]++;
        break;
    case 4:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        move_anim_8072740(sprite);
        break;
    }
}

void sub_80CD0CC(struct Sprite* sprite, int unk1, int unk2)
{
    if (sprite->data[3] <= 11)
        sprite->data[4] += 2;

    if ((u16)(sprite->data[3] - 0x12) <= 0x17)
        sprite->data[4] -= 2;

    if ((sprite->data[3]) > 0x2F)
        sprite->data[4] += 2;

    sprite->pos2.x = sprite->data[4] / 9;
    sprite->pos2.y = sprite->data[4] / 14;
    if (sprite->pos2.y < 0)
        sprite->pos2.y *= -1;

    sprite->data[3]++;
    if (sprite->data[3] > 0x3B)
        sprite->data[3] = 0;
}

void sub_80CD140(struct Sprite* sprite)
{
    if (!gBattleAnimArgs[2])
        sub_8078650(sprite);

    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80CD190(struct Sprite* sprite)
{
    u8 bank;
    if (!gBattleAnimArgs[2])
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    if (IsDoubleBattle() && IsAnimBankSpriteVisible(bank ^ 2))
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

    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80CD274(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
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
    if (++sprite->data[0] > 30)
    {
        sprite->pos2.y = (30 - sprite->data[0]) / 3;
        sprite->pos2.x = Sin(sprite->data[1] * 4, 3);
        sprite->data[1]++;
    }

    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CD328(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[3] = 1;
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[3] = 0xFFFF;
        StartSpriteAffineAnim(sprite, 1);
    }

    sprite->callback = sub_80CD394;
}

void sub_80CD394(struct Sprite* sprite)
{
    sprite->pos2.y = -(sprite->data[0] / 0x28);
    sprite->pos2.x = sprite->data[4] / 10;
    sprite->data[4] += sprite->data[3] * 2;
    sprite->data[0] += sprite->data[1];
    if (++sprite->data[1] > 0x3C)
        move_anim_8074EE0(sprite);
}

void sub_80CD3E0(struct Sprite* sprite)
{
    sprite->pos1.x -= 32;
    sprite->pos1.y -= 32;
    sprite->data[0] = 20;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80CD408);
}

void sub_80CD408(struct Sprite* sprite)
{
    switch (sprite->data[5] & 1)
    {
    case 0:
        sprite->data[0] = 1;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD408);
        break;
    case 1:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 8;
        sprite->data[2] = sprite->pos1.x + gUnknown_083D6DDC[sprite->data[5] >> 8][0];
        sprite->data[4] = sprite->pos1.y + gUnknown_083D6DDC[sprite->data[5] >> 8][1];
        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, sub_80CD4B8);
        sprite->data[5] += 0x100;
        PlaySE12WithPanning(0xD2, sub_8076F98(0x3F));
        break;
    }

    sprite->data[5] ^= 1;
}

void sub_80CD4B8(struct Sprite* sprite)
{
    if ((sprite->data[5] >> 8) == 4)
    {
        sprite->data[0] = 10;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD4EC);
    }
    else
    {
        sprite->callback = sub_80CD408;
    }
}

void sub_80CD4EC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    if (sprite->oam.affineParam == 0)
    {
        sprite->data[0] = 3;
        sprite->data[1] = 0;
        sprite->data[2] = 0;
        sprite->callback = sub_80782D8;
        StoreSpriteCallbackInData(sprite, sub_80CD5A8);
    }
    else
    {
        switch (sprite->oam.affineParam)
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
        sprite->data[0] = 6;
        sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + a;
        sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + b;
        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, sub_80CD654);
    }
}

void sub_80CD5A8(struct Sprite* sprite)
{
    if (sprite->data[2] == 0)
    {
        if ((sprite->data[1] += 3) > 16)
            sprite->data[1] = 16;
    }
    else if ((sprite->data[1] -= 3) < 0)
    {
        sprite->data[1] = 0;
    }

    BlendPalettes(sub_80791A8(1, 1, 1, 1, 1, 0, 0), sprite->data[1], 0x7FFF);
    if (sprite->data[1] == 16)
    {
        int pal;
        sprite->data[2]++;
        pal = sprite->oam.paletteNum;
        LoadPalette(&gPlttBufferUnfaded[0x108 + pal * 16], pal * 16 | 0x101, 4);
        PlaySE12WithPanning(0xC0, sub_8076F98(0x3F));
    }
    else if (sprite->data[1] == 0)
    {
        sprite->callback = sub_80CD654;
    }
}

void sub_80CD654(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->data[1] = 0;
        sprite->data[0] = 0;
        sprite->callback = sub_80CD67C;
    }
}

void sub_80CD67C(struct Sprite* sprite)
{
    if (sprite->data[0] % 3 == 0)
    {
        sprite->data[1]++;
        sprite->invisible ^= 1;
    }

    sprite->data[0]++;
    if (sprite->data[1] == 8)
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
    else if ((s16)sprite->oam.affineParam == 2)
    {
        sprite->pos1.x -= 0x18;
        sprite->pos1.y += 0x18;
        sprite->oam.matrixNum = 16;
    }
    else if ((s16)sprite->oam.affineParam == 3)
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
    sprite->data[0] = 0;
    switch (gBattleAnimArgs[0])
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
    sprite->data[0] = 6;
    sprite->data[1] = (GetBankSide(gBattleAnimBankAttacker)) ? 2 : -2;
    sprite->data[2] = 0;
    sprite->data[3] = gObjectBankIDs[gBattleAnimBankAttacker];
    StoreSpriteCallbackInData(sprite, sub_80CD81C);
    sprite->callback = sub_8078458;
}

void sub_80CD81C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[3] = gObjectBankIDs[gBattleAnimBankAttacker];
        sub_8078E70(sprite->data[3], 0);
        sprite->data[4] = (sprite->data[6] = GetBankSide(gBattleAnimBankAttacker)) ? 0x300 : 0xFFFFFD00;
        sprite->data[5] = 0;
    }

    sprite->data[5] += sprite->data[4];
    obj_id_set_rotscale(sprite->data[3], 0x100, 0x100, sprite->data[5]);
    sub_8078F9C(sprite->data[3]);
    if (++sprite->data[0] > 3)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80CD9B8;
    }
}

void sub_80CD8A8(struct Sprite* sprite)
{
    sprite->data[0] = 4;
    sprite->data[1] = (GetBankSide(gBattleAnimBankAttacker)) ? -3 : 3;
    sprite->data[2] = 0;
    sprite->data[3] = gObjectBankIDs[gBattleAnimBankAttacker];
    StoreSpriteCallbackInData(sprite, sub_80CD9B8);
    sprite->callback = sub_8078458;
}

void sub_80CD8F8(struct Sprite* sprite)
{
    if (++sprite->data[0] > 8)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80CD91C;
    }
}

void sub_80CD91C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[3] = gObjectBankIDs[gBattleAnimBankAttacker];
        sprite->data[6] = GetBankSide(gBattleAnimBankAttacker);
        if (GetBankSide(gBattleAnimBankAttacker))
        {
            sprite->data[4] = 0xFC00;
            sprite->data[5] = 0xC00;
        }
        else
        {
            sprite->data[4] = 0x400;
            sprite->data[5] = 0xF400;
        }
    }

    sprite->data[5] += sprite->data[4];
    obj_id_set_rotscale(sprite->data[3], 0x100, 0x100, sprite->data[5]);
    sub_8078F9C(sprite->data[3]);
    if (++sprite->data[0] > 2)
    {
        sub_8078F40(sprite->data[3]);
        sprite->callback = sub_80CD9B8;
    }
}

void sub_80CD9B8(struct Sprite* sprite)
{
    move_anim_8072740(sprite);
}

void sub_80CD9C4(struct Sprite* sprite)
{
    sprite->data[0] = 0;
    sprite->callback = sub_80CD9D4;
}

void sub_80CD9D4(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = 0;
        sprite->data[2] = gObjectBankIDs[gBattleAnimBankAttacker];
        sprite->data[3] = GetBankSide(gBattleAnimBankAttacker);
        sprite->data[4] = (sprite->data[3] != 0) ? 0x200 : -0x200;
        sprite->data[5] = 0;
        sub_8078E70(sprite->data[2], 0);
        sprite->data[0]++;
    case 1:
        sprite->data[5] += sprite->data[4];
        obj_id_set_rotscale(sprite->data[2], 0x100, 0x100, sprite->data[5]);
        sub_8078F9C(sprite->data[2]);
        if (++sprite->data[1] > 3)
        {
            sprite->data[1] = 0;
            sprite->data[4] *= -1;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[5] += sprite->data[4];
        obj_id_set_rotscale(sprite->data[2], 0x100, 0x100, sprite->data[5]);
        sub_8078F9C(sprite->data[2]);
        if (++sprite->data[1] > 3)
        {
            sub_8078F40(sprite->data[2]);
            move_anim_8072740(sprite);
        }
        break;
    }
}

void sub_80CDAC8(u8 taskId)
{   u8 a;
    gTasks[taskId].data[0] = gObjectBankIDs[gBattleAnimBankAttacker];
    a = GetBankSide(gBattleAnimBankAttacker);
    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = 0;
    switch (gBattleAnimArgs[0])
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
    switch (task->data[2])
    {
    case 0:
        if (task->data[3])
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
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[2];
    }

    sprite->data[0] = 0;
    sprite->data[1] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CDEC0);
    sprite->callback = sub_8078600;
}

void sub_80CDDDC(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + 0xFFD0;
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3);
    StoreSpriteCallbackInData(sprite, sub_80CDE78);
    sprite->callback = sub_8078600;
}

void sub_80CDE24(struct Sprite* sprite)
{
    sprite->pos1.x = sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + 0xFFD0 + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3);
    StartSpriteAnim(sprite, 1);
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CDEC0;
}

void sub_80CDE78(struct Sprite* sprite)
{
    if (++sprite->data[0] > 8)
    {
        sprite->data[0] = 12;
        sprite->data[1] = 8;
        sprite->data[2] = 0;
        StoreSpriteCallbackInData(sprite, sub_80CDEB0);
        sprite->callback = sub_8078364;
    }
}

void sub_80CDEB0(struct Sprite* sprite)
{
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CDEC0;
}

void sub_80CDEC0(struct Sprite* sprite)
{
    if (++sprite->data[0] > 1)
    {
        sprite->data[0] = 0;
        sprite->invisible = !sprite->invisible;
        if (++sprite->data[1] > 8)
            move_anim_8072740(sprite);
    }
}

void sub_80CDF0C(struct Sprite* sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[2];
    }

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80CDF70;
}

void sub_80CDF70(struct Sprite* sprite)
{
    if (++sprite->data[0] > sprite->data[1])
    {
        sprite->data[0] = 0;
        sprite->pos1.y--;
    }

    sprite->pos1.y -= sprite->data[0];
    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80CDFB0(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) - 12;
    sprite->data[0] = 0;
    sprite->data[1] = 2;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = sub_8076F98(-0x40);
    sprite->callback = sub_80CE000;
}

void sub_80CE000(struct Sprite* sprite)
{
    if (++sprite->data[0] >= sprite->data[1])
    {
        sprite->invisible = !sprite->invisible;
        if (!sprite->invisible)
        {
            sprite->data[4]++;
            if (!(sprite->data[4] & 1))
                PlaySE12WithPanning(SE_W207B, sprite->data[5]);
        }

        sprite->data[0] = 0;
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->data[1]++;
        }
    }

    if (sprite->animEnded && sprite->data[1] > 16 && sprite->invisible)
        move_anim_8072740(sprite);
}

void sub_80CE09C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[0];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[1];
        if (NotInBattle())
            sprite->pos1.y += 10;
        sprite->data[0]++;
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
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = sub_80CE1AC;
}

void sub_80CE1AC(struct Sprite* sprite)
{
    if (sprite->data[0])
    {
        sprite->data[0]--;
    }
    else
    {
        sprite->animPaused = 0;
        sprite->data[0] = 30;
        sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
        sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
        sprite->callback = sub_8078B34;
        StoreSpriteCallbackInData(sprite, move_anim_8072740);
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
    {
        sub_8043DFC(gHealthboxIDs[i]);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80CE30C(struct Sprite* sprite)
{
    if (NotInBattle())
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
    sprite->data[0] = 0;
    sprite->callback = sub_80CE354;
}

void sub_80CE354(struct Sprite* sprite)
{
    if (sprite->data[0])
        move_anim_8072740(sprite);
}

void sub_80CE36C(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = gBattleAnimArgs[1];
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 1;
    sprite->callback = sub_80CE3B0;
}

void sub_80CE3B0(struct Sprite* sprite)
{
    if (++sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        if (sprite->data[2] <= 0x77)
        {
            sprite->pos1.y++;
            sprite->data[2]++;
        }
    }

    if (sprite->data[0])
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
                    {
                        gPlttBufferFaded[r3 + j] = color;
                    }
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
                    gSprites[spriteId].data[0] = 1;
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

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[6] = sprite->pos1.x;
    sprite->data[7] = sprite->pos1.y;
    if (NotInBattle() != 0)
    {
        sprite->oam.matrixNum = 8;
        sprite->pos1.x += 40;
        sprite->pos1.y += 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = -0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = -0xA00 / sprite->data[1];
    }
    else if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        sprite->pos1.x -= 40;
        sprite->pos1.y += 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = 0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = -0xA00 / sprite->data[1];
    }
    else
    {
        sprite->pos1.x += 40;
        sprite->pos1.y -= 20;
        sprite->data[2] = sprite->pos1.x << 7;
        sprite->data[3] = -0x1400 / sprite->data[1];
        sprite->data[4] = sprite->pos1.y << 7;
        sprite->data[5] = 0xA00 / sprite->data[1];
        sprite->oam.matrixNum = 24;
    }

    sprite->callback = sub_80CE798;
}

void sub_80CE798(struct Sprite* sprite)
{
    sprite->data[2] += sprite->data[3];
    sprite->data[4] += sprite->data[5];
    sprite->pos1.x = sprite->data[2] >> 7;
    sprite->pos1.y = sprite->data[4] >> 7;
    if (--sprite->data[1] == 1)
    {
        sprite->pos1.x = sprite->data[6];
        sprite->pos1.y = sprite->data[7];
    }

    if (sprite->data[1] == 0)
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
    task->data[0] = GetAnimBankSpriteId(0);
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
        gSprites[obj].data[0] = 0;
        gSprites[obj].data[1] = i << 7;
        gSprites[obj].data[2] = taskId;
        gSprites[obj].callback = sub_80CE974;
        task->data[3]++;
        i++;
    }

    task->func = sub_80CE910;
    if (GetBankIdentity_permutated(gBattleAnimBankAttacker) == 1)
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
        if (GetBankIdentity_permutated(gBattleAnimBankAttacker) == 1)
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

void sub_80CEA04(struct Sprite* sprite)
{
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
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
        {
            gPlttBufferFaded[index + i] = gUnknown_083D712C[0][i];
        }
    }

    for (j = 1; j < 4; j++)
    {
        index = AllocSpritePalette(gUnknown_083D712C[j][0]);
        if (index != 0xFF)
        {
            index = (index << 4) + 0x100;
            for (i = 1; i < 6; i++)
            {
                gPlttBufferFaded[index + i] = gUnknown_083D712C[j][i];
            }
        }
    }
    DestroyAnimVisualTask(taskId);
}

void sub_80CEAD8(u8 taskId)
{
    u16 i;
    for (i = 1; i < 4; i++)
    {
        FreeSpritePaletteByTag(gUnknown_083D712C[i][0]);
    }

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

    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[2] = 0;
    sprite->data[3] = gBattleAnimArgs[2];
    if (NotInBattle())
    {
        a = 0x30;
        b = 0x28;
    }
    else
    {
        a = sub_8077ABC(gBattleAnimBankTarget, 2);
        b = sub_8077ABC(gBattleAnimBankTarget, 3);
    }

    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sub_80CEBC4(a - sprite->pos1.x, b - sprite->pos1.y, &sprite->data[6], &sprite->data[7], 0x28);
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
    sprite->data[0]++;
    b = sprite->data[0] * 5 - ((sprite->data[0] * 5 / 256) << 8);
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
    sprite->pos2.y = Sin(b, 15);
    a = (u16)sprite->pos1.y;
    c = (u16)sprite->pos1.x;

    if ((u32)((c + 16) << 16) > (0x110) << 16 || a < -16 || a > 0x80)
    {
        move_anim_8074EE0(sprite);
    }
    else
    {
        if (sprite->data[3] && ++sprite->data[2] > sprite->data[3])
        {
            sprite->data[2] = 0;
            if (++sprite->data[1] > 3)
                sprite->data[1] = 0;

            index = IndexOfSpritePaletteTag(gUnknown_083D712C[sprite->data[1]][0]);
            if (index != 0xFF)
                sprite->oam.paletteNum = index;
        }
    }
}

void sub_80CECE8(struct Sprite* sprite)
{
    int a; 
    if (GetBankSide(gBattleAnimBankAttacker) == 1)
    {
        a = gBattleAnimArgs[1]; 
        (u16)gBattleAnimArgs[1] = -a;
    }

    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) + gBattleAnimArgs[2];
    StartSpriteAnim(sprite, gBattleAnimArgs[0]);
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = sprite->pos1.x << 4;
    sprite->data[5] = sprite->pos1.y << 4;
    sprite->data[6] = (gBattleAnimArgs[1] << 4) / 5;
    sprite->data[7] = (gBattleAnimArgs[2] << 7) / 5;
    sprite->callback = sub_80CED78;
}

void sub_80CED78(struct Sprite* sprite)
{
    sprite->data[4] += sprite->data[6];
    sprite->data[5] += sprite->data[7];
    sprite->pos1.x = sprite->data[4] >> 4;
    sprite->pos1.y = sprite->data[5] >> 4;
    if (sprite->data[0] > 5 && sprite->data[3] == 0)
    {
        sprite->data[2] = (sprite->data[2] + 16) & 0xFF;
        sprite->pos2.x = Cos(sprite->data[2], 18);
        sprite->pos2.y = Sin(sprite->data[2], 18);
        if (sprite->data[2] == 0)
            sprite->data[3] = 1;
    }

    if (++sprite->data[0] == 0x30)
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
    {
        a = -16;
    }

    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + a;
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) + 8;
    sprite->data[0] = 8;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
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
    sprite->data[0] = 40;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = a + sprite->data[1];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->data[3] - 40;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80CEEE8;
}

void sub_80CEEE8(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) == 0)
    {
        s16 a;
        a = Sin(sprite->data[5], 8);
        if (sprite->pos2.x < 0)
            a = -a;

        sprite->pos2.x += a;
        sprite->pos2.y += Sin(sprite->data[5], 4);
        sprite->data[5] = (sprite->data[5] + 8) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
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
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    a = (GetBankSide(bank) == 0) ? 0 : 1;
    sprite->data[0] = gBattleAnimArgs[1];
    sprite->data[1] = a + 2;
    StartSpriteAnim(sprite, a);
    StoreSpriteCallbackInData(sprite, sub_80CF008);
    sprite->callback = sub_8078600;
}

void sub_80CF008(struct Sprite* sprite)
{
    if (--sprite->data[0] == 0)
    {
        StoreSpriteCallbackInData(sprite, move_anim_8072740);
        StartSpriteAnim(sprite, sprite->data[1]);
        sprite->callback = sub_8078600;
    }
}

void sub_80CF040(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    sprite->data[0] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CF088);
    sprite->callback = sub_80785E4;
}

void sub_80CF088(struct Sprite* sprite)
{
    if (++sprite->data[0] > 16)
    {
        StartSpriteAffineAnim(sprite, 1);
        StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
        sprite->callback = sub_80785E4;
    }
}

void sub_80CF0BC(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sprite->pos1.x = sub_8077ABC(bank, 0);
    sprite->pos1.y = sub_807A100(bank, 2);
    if (sprite->pos1.y <= 9)
        sprite->pos1.y = 10;

    sprite->data[0] = 1;
    sprite->data[1] = 0;
    sprite->data[2] = sprite->subpriority;
    sprite->data[3] = sprite->subpriority + 4;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, sub_80CF138);
    sprite->callback = sub_80785E4;
}

void sub_80CF138(struct Sprite* sprite)
{
    if (++sprite->data[4] > 12)
        sprite->callback = sub_80CF158;
}

void sub_80CF158(struct Sprite* sprite)
{
    s16 temp;
    s16 temp2;
    sprite->data[1] += 4;
    if (sprite->data[1] > 0xFE)
    {
        if (--sprite->data[0] == 0)
        {
            sprite->pos2.x = 0;
            sprite->callback = sub_80CF088;
            return;
        }
        else
        {
            sprite->data[1] &= 0xFF;
        }
    }

    if (sprite->data[1] > 0x4F)
        sprite->subpriority = sprite->data[3];

    if (sprite->data[1] > 0x9F)
        sprite->subpriority = sprite->data[2];

    temp = gSineTable[sprite->data[1]];
    sprite->pos2.x = (temp2 = temp >> 3) + (temp2 >> 1);
}

void sub_80CF1C8(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    if (GetBankSide(bank) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->data[0] = 2;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->data[0] = 3;
    }

    sprite->callback = sub_80CF228;
}

void sub_80CF228(struct Sprite* sprite)
{
    if (++sprite->data[1] > 10)
    {
        sprite->data[1] = 0;
        StartSpriteAnim(sprite, sprite->data[0]);
        StoreSpriteCallbackInData(sprite, sub_80CF264);
        sprite->callback = sub_8078600;
    }
}

void sub_80CF264(struct Sprite* sprite)
{
    if (++sprite->data[1] > 5)
        move_anim_8072740(sprite);
}

void sub_80CF280(struct Sprite* sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[4];
    sprite->data[3] = gBattleAnimArgs[5];
    sprite->data[4] = gBattleAnimArgs[3];
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078278;
    sub_8078278(sprite);
}

void sub_80CF2D0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    sub_80CEF44(bank, sprite);
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->callback = sub_80CF310;
}

void sub_80CF310(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos2.y -= 3;
        if (++sprite->data[1] == 6)
            sprite->data[0]++;
        break;
    case 1:
        sprite->pos2.y += 3;
        if (--sprite->data[1] == 0)
            sprite->data[0]++;
        break;
    case 2:
        if (++sprite->data[1] == 0x40)
            move_anim_8072740(sprite);
        break;
    }
}

void sub_80CF374(struct Sprite* sprite)
{
    s16 temp;
    gSprites[sprite->data[2]].pos2.x += sprite->data[1];
    temp = sprite->data[1];
    sprite->data[1] = -temp;
    if (sprite->data[0] == 0)
    {
        gSprites[sprite->data[2]].pos2.x = 0;
        move_anim_8074EE0(sprite);
    }

    sprite->data[0]--;
}

void sub_80CF3C4(struct Sprite* sprite)
{
    u8 a;
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    a = gObjectBankIDs[gBattleAnimBankTarget];
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
    }
    else
    {
        sprite->pos1.x += gBattleAnimArgs[0];
    }

    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = a;
    sprite->callback = sub_80CF374;
    sprite->invisible = 1;
}

void sub_80CF458(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[4];
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80CF490);
}

void sub_80CF490(struct Sprite* sprite)
{
    sprite->data[0] = sprite->data[1];
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y + 15;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, sub_80CF4B8);
}

void sub_80CF4B8(struct Sprite* sprite)
{
    if (sprite->data[5] == 0)
        move_anim_8072740(sprite);
    else
        sprite->data[5]--;
}

void sub_80CF4D8(u8 taskId)
{
    sub_8078E70(gObjectBankIDs[gBattleAnimBankAttacker], 0);
    gTasks[taskId].func = sub_80CF514;
}

void sub_80CF514(u8 taskId)
{
    u8 a = gObjectBankIDs[gBattleAnimBankAttacker];
    s16 b;
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
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
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
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
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CF690(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    sprite->callback = sub_80785E4;
    StoreSpriteCallbackInData(sprite, sub_80CF6B4);
}

void sub_80CF6B4(struct Sprite* sprite)
{
    sprite->data[0] = 6;
    sprite->data[2] = sprite->pos1.x;
    sprite->data[4] = sprite->pos1.y - 32;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

//sonic boom
void sub_80CF6DC(struct Sprite* sprite)
{
    s16 a;
    s16 b;
    u16 c;

    if (NotInBattle())
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    else if (GetBankSide(gBattleAnimBankAttacker) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
    }

    sub_80787B0(sprite, 1);
    a = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
    b = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    c = sub_80790F0(a - sprite->pos1.x, b - sprite->pos1.y);
    c += 0xF000;
    if (NotInBattle())
        c -= 0x6000;

    sub_8078FDC(sprite, 0, 0x100, 0x100, c);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = a;
    sprite->data[4] = b;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
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

//air cutter
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

    if (NotInBattle())
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
        if ((gBanksBySide[gBattleAnimBankTarget] & 1) == 0)
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
    r6 = gTasks[taskId].data[9] = sub_8077ABC(gBattleAnimBankAttacker, 0);
    r9 = gTasks[taskId].data[10] = sub_8077ABC(gBattleAnimBankAttacker, 1);
    if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        && IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2))
    {
        sub_807A3FC(gBattleAnimBankTarget, 0, &sp1, &sp2);
    }
    else
    {
        sp1 = sub_8077ABC(gBattleAnimBankTarget, 0);
        sp2 = sub_8077ABC(gBattleAnimBankTarget, 1);
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
            u16 var = sub_8079E90(gBattleAnimBankTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gBattleAnimBankTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }
    else
    {
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = sub_8079E90(gBattleAnimBankTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gBattleAnimBankTarget) - gBattleAnimArgs[4];
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
    sprite->data[0] = 0x100 + (IndexOfSpritePaletteTag(gSpriteTemplate_83D75AC.paletteTag) << 4);
    sprite->callback = sub_80CFE2C;
}

#ifdef NONMATCHING
void sub_80CFE2C(struct Sprite* sprite)
{
    u16 r7;
    u16* r1;
    u16* r2;
    int i;
    if (++sprite->data[1] == 2)
    {
        sprite->data[1] = 0;
        r7 = gPlttBufferFaded[sprite->data[0] + 8];
        r2 = &gPlttBufferFaded[0x10];
        r1 = &gPlttBufferFaded[sprite->data[0] + 9];
        for (i = 7; i >= 0; i--)
        {
            *r2 = *r1;
            r1++;
            r2++;
        }

        gPlttBufferFaded[sprite->data[0] + 15] = r7;
        if (++sprite->data[2] == 0x18)
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
    r6 = sub_8077ABC(gBattleAnimBankTarget, 2);
    r7 = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    r6 += gBattleAnimArgs[2];
    var = sub_80790F0(r6 - sprite->pos1.x, r7 - sprite->pos1.y);
    var += 0xC000;
    sub_8078FDC(sprite, 0, 0x100, 0x100, var);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = r6;
    sprite->data[4] = r7;
    sprite->callback = sub_8078C00;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80CFF50(struct Sprite* sprite)
{
    sprite->data[2] = -16;
    sprite->pos1.y += 8;
    sprite->callback = sub_80CFF68;
}

void sub_80CFF68(struct Sprite* sprite)
{
    sprite->data[0] += 0x80;
    sprite->pos2.x = sprite->data[0] >> 8;
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
        sprite->pos2.x = -sprite->pos2.x;

    sprite->pos2.y = Sin(sprite->data[1], sprite->data[2]);
    sprite->data[1] += 5;
    if (sprite->data[1] > 0x7E)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 2)
            move_anim_8072740(sprite);
    }
}

void sub_80CFFD8(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = 20;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sprite->callback = sub_8078B34;
    sprite->affineAnimPaused = 1;
    StoreSpriteCallbackInData(sprite, sub_80D0030);
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
    ptr = &sprite->data[7];
    for (i = 0; i < 8; i++)
    {
        ptr[i - 7] = 0;
    }

    rand = Random();
    sprite->data[6] = 0xFFF4 - (rand & 7);
    rand = Random();
    sprite->data[7] = (rand % 0xA0) + 0xA0;
    sprite->callback = sub_80D00B4;
    sprite->affineAnimPaused = 0;
}

void sub_80D00B4(struct Sprite* sprite)
{
    sprite->data[0] += sprite->data[7];
    sprite->pos2.x = sprite->data[0] >> 8;
    if (sprite->data[7] & 1)
        sprite->pos2.x = -sprite->pos2.x;

    sprite->pos2.y = Sin(sprite->data[1], sprite->data[6]);
    sprite->data[1] += 8;
    if (sprite->data[1] > 0x7E)
    {
        sprite->data[1] = 0;
        sprite->data[2] /= 2;
        if (++sprite->data[3] == 1)
            move_anim_8072740(sprite);
    }
}

void sub_80D0118(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
        sprite->pos1.y += 16;

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->data[3] = gBattleAnimArgs[6];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->callback = sub_8078114;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
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
    sprite->data[0] = 6;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + r8;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + r6;
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, sub_80D020C);
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
    sprite->data[0] = 6;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + r9;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + r6;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[5] = gBattleAnimArgs[0];
    sprite->data[6] = sprite->data[0];
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
        sprite->data[0] = sprite->data[6];
        sprite->data[1] ^= 1;
        sprite->data[2] ^= 1;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->callback = sub_80D0344;
    }
}

void sub_80D0344(struct Sprite* sprite)
{
    if (sprite->data[3])
    {
        sprite->pos2.x = -sprite->pos2.x;
        sprite->pos2.y = -sprite->pos2.y;
    }

    sprite->data[3] ^= 1;
    if (++sprite->data[4] == 0x33)
    {
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[4] = 0;
        sprite->data[3] = 0;
        sprite->animPaused = 0;
        StartSpriteAnim(sprite, sprite->data[5] ^ 1);
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
    u8 spriteId = GetAnimBankSpriteId(1);
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
        u8 spriteId = GetAnimBankSpriteId(1);
        sub_8078F40(spriteId);
        sub_8079108(gSprites[spriteId].oam.paletteNum + 16, 1);
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D0488(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBankSpriteId(0);
    task->data[0] = spriteId;
    sub_8078E70(spriteId, 0);
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0x100;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = sub_8079E90(gBattleAnimBankAttacker);
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
        {
            obj_delete_but_dont_free_vram(&gSprites[r8]);
        }
        else
        {
            gSprites[r8].oam.objMode = 1;
            gSprites[r8].oam.affineMode = 3;
            gSprites[r8].affineAnimPaused = 1;
            gSprites[r8].oam.matrixNum = r6;
            gSprites[r8].subpriority = task->data[7] - task->data[3];
            task->data[3]++;
            task->data[6]++;
            gSprites[r8].data[0] = 16;
            gSprites[r8].data[1] = taskId;
            gSprites[r8].data[2] = 6;
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
    if (--sprite->data[0] == 0)
    {
        gTasks[sprite->data[1]].data[sprite->data[2]]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        obj_delete_but_dont_free_vram(sprite);
    }
}

void sub_80D074C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (gBattleAnimArgs[1] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        u8 spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);
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
    u8 spriteId = GetAnimBankSpriteId(0);
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
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        StartSpriteAnim(sprite, 0);
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + 32;
        sprite->data[1] = 0x40;
    }
    else
    {
        StartSpriteAnim(sprite, 1);
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) - 32;
        sprite->data[1] = -0x40;
    }

    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = 0x34;
    sprite->data[2] = 0;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sprite->callback = sub_8078394;
}

void sub_80D09C0(struct Sprite* sprite)
{
    u8 bank;
    if (gBattleAnimArgs[0] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    if (GetBankSide(bank) == 1)
    {
        gBattleAnimArgs[1] *= -1;
    }

    sprite->pos1.x = sub_8077ABC(bank, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = sub_8077ABC(bank, 3) + gBattleAnimArgs[2];
    if (sprite->pos1.y <= 7)
        sprite->pos1.y = 8;

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}

void sub_80D0A4C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBankSpriteId(0);
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
    task->data[0] = GetAnimBankSpriteId(0);
    task->data[1] = 0;
    task->data[2] = 4;
    task->data[3] = 7;
    task->data[4] = 3;
    task->data[5] = gSprites[task->data[0]].pos1.x;
    task->data[6] = gSprites[task->data[0]].pos1.y;
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[9] = 2;
    if (GetBankSide(gBattleAnimBankAttacker) == 1)
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
        {
            gSprites[task->data[0]].pos1.y -= task->data[9];
        }
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
    struct UnknownTaskStruct sp;
    s16 i;
    task->data[0] = sub_8077FC0(gBattleAnimBankTarget) + 32;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[15] = sub_807A100(gBattleAnimBankTarget, 0);
    if (GetBankIdentity_permutated(gBattleAnimBankTarget) == 1)
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
            gUnknown_03004DE0[0][i] = task->data[6] + 0xF0;
            gUnknown_03004DE0[1][i] = task->data[6] + 0xF0;
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
            task->data[2] = task->data[3] & 3;
            task->data[5] = task->data[0] - task->data[3];
            switch (task->data[2])
            {
            case 0:
                break;
            case 1:
                task->data[5] -= 2;
                break;
            case 2:
                task->data[5] += 1;
                break;
            case 3:
                task->data[5] += 1;
                break;
            }

            if (task->data[5] >= 0)
            {
                gUnknown_03004DE0[0][task->data[5]] = task->data[6];
                gUnknown_03004DE0[1][task->data[5]] = task->data[6];
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
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0) - 16;
    sprite->pos1.y = sub_8077FC0(gBattleAnimBankTarget) + 16;
    sprite->data[0] = 0;
    sprite->data[1] = 0;
    sprite->data[2] = 0;
    sprite->data[3] = 16;
    sprite->data[4] = 0;
    sprite->data[5] = sub_807A100(gBattleAnimBankTarget, 0) + 2;
    sprite->data[6] = sub_8076F98(0x3F);
    sprite->callback = sub_80D0E8C;
}

void sub_80D0E8C(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] > 3 && sprite->data[2] < sprite->data[5])
        {
            sprite->data[1] = 0;
            sprite->pos1.y -= 1;
            sprite->data[2]++;
            if (sprite->data[2] % 10 == 0)
                PlaySE12WithPanning(0xCD, sprite->data[6]);
        }
        sprite->data[4] += sprite->data[3];
        if (sprite->data[4] > 31)
        {
            sprite->data[4] = 0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        else if (sprite->data[4] <= -32)
        {
            sprite->data[4] = -0x40 - sprite->data[4];
            sprite->data[3] *= -1;
        }
        sprite->pos2.x = sprite->data[4];
        if (sprite->data[5] == sprite->data[2])
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0;
            sprite->data[0]++;
        }
        break;
    case 2:
        if (++sprite->data[2] > 1)
        {
            sprite->data[2] = 0;
            sprite->invisible = !sprite->invisible;
        }
        if (++sprite->data[1] > 16)
        {
            sprite->invisible = 0;
            move_anim_8072740(sprite);
        }
        break;
    }
}

void sub_80D0FD8(struct Sprite* sprite)
{
    u8 bank = 0;
    u16 sp0 = 0;
    u16 sp1 = 0;
    u8 r4;

    if (gBattleAnimArgs[2] == 0)
        bank = gBattleAnimBankAttacker;
    else
        bank = gBattleAnimBankTarget;

    r4 = gBattleAnimArgs[3] ^ 1;
    if (IsDoubleBattle() && IsAnimBankSpriteVisible(bank ^ 2))
    {
        sub_807A3FC(bank, r4, &sp0, &sp1);
        if (r4 == 0)
            r4 = sub_8077ABC(bank, 0);
        else
            r4 = sub_8077ABC(bank, 2);

        if (GetBankSide(bank) != 0)
            gBattleAnimArgs[0] -= (sp0 - r4) - gBattleAnimArgs[0];  // This is weird.
        else
            gBattleAnimArgs[0] = sp0 - r4;
    }

    sprite->callback = sub_80793C4;
    sub_80793C4(sprite);
}

void sub_80D1098(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite))
    {
        FreeSpriteOamMatrix(sprite);
        move_anim_8072740(sprite);
    }
}

void sub_80D10B8(struct Sprite* sprite)
{
    u16 r9 = 0;
    u16 r6 = 0;
    s16 sp0 = 0;
    s16 sp1 = 0;
    u8 sp4;
    u8 bankr7;
    u8 bankr8;
    u8 r10;

    if (gBattleAnimArgs[5] == 0)
    {
        bankr7 = gBattleAnimBankAttacker;
        bankr8 = gBattleAnimBankTarget;
    }
    else
    {
        bankr7 = gBattleAnimBankTarget;
        bankr8 = gBattleAnimBankAttacker;
    }

    if (gBattleAnimArgs[6] == 0)
    {
        r10 = 0;
        sp4 = 1;
    }
    else
    {
        r10 = 2;
        sp4 = 3;
    }

    if (GetBankSide(bankr7) != 0)
    {
        r9 = sub_8077ABC(bankr7, r10) + gBattleAnimArgs[0];
        if (IsAnimBankSpriteVisible(bankr8 ^ 2))
            sprite->subpriority = gSprites[gObjectBankIDs[bankr8 ^ 2]].subpriority - 1;
        else
            sprite->subpriority = gSprites[gObjectBankIDs[bankr8]].subpriority - 1;
    }
    else
    {
        r9 = sub_8077ABC(bankr7, r10) - gBattleAnimArgs[0];
        if (gMain.inBattle && IsAnimBankSpriteVisible(bankr7 ^ 2))
        {
            if (gSprites[gObjectBankIDs[bankr7]].pos1.x < gSprites[gObjectBankIDs[bankr7 ^ 2]].pos1.x)
                sprite->subpriority = gSprites[gObjectBankIDs[bankr7 ^ 2]].subpriority + 1;
            else
                sprite->subpriority = gSprites[gObjectBankIDs[bankr7]].subpriority - 1;
        }
        else
        {
            sprite->subpriority = gSprites[gObjectBankIDs[bankr7]].subpriority - 1;
        }

    }

    r6 = sub_8077ABC(bankr7, sp4) + gBattleAnimArgs[1];
    if (gMain.inBattle && IsAnimBankSpriteVisible(bankr8 ^ 2))
    {
        sub_807A3FC(bankr8, gBattleAnimArgs[6], &sp0, &sp1);
    }
    else
    {
        sp0 = sub_8077ABC(bankr8, r10);
        sp1 = sub_8077ABC(bankr8, sp4);
    }

    if (GetBankSide(bankr8))
        sp0 += gBattleAnimArgs[3];
    else
        sp0 -= gBattleAnimArgs[3];

    sp1 += gBattleAnimArgs[4];
    sprite->pos1.x = sprite->data[1] = r9;
    sprite->pos1.y = sprite->data[3] = r6;
    sprite->data[2] = sp0;
    sprite->data[4] = sp1;
    sprite->data[0] = gBattleAnimArgs[0];
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->callback = sub_80D1098;
    sub_80D1098(sprite);
}

void sub_80D1318(struct Sprite* sprite)
{
    u8 index = IndexOfSpritePaletteTag(0x27DB);
    if (index != 0xFF)
    {
        BlendPalette(((index << 20) + 0x1010000) >> 16, 15, gBattleAnimArgs[5], gBattleAnimArgs[4]);
    }

    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = sub_80793C4;
    sub_80793C4(sprite);
}

void sub_80D1368(struct Sprite* sprite)
{
    s16 r1;
    sub_80787B0(sprite, 0);
    r1 = (GetBankSide(gBattleAnimBankAttacker)) ? -0xA0 : 0xA0;
    sprite->data[0] = 0x380;
    sprite->data[1] = r1;
    sprite->data[7] = gBattleAnimArgs[2];
    sprite->callback = sub_80D13AC;
}

void sub_80D13AC(struct Sprite* sprite)
{
    s16 add;
    sprite->pos2.y -= (sprite->data[0] >> 8);
    sprite->pos2.x = sprite->data[1] >> 8;
    sprite->data[0] -= 32;
    add = (GetBankSide(gBattleAnimBankAttacker)) ? -0xA0 : 0xA0;
    sprite->data[1] += add;
    if (sprite->pos2.y > 0)
    {
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 0;
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_80D1424;
    }
}

void sub_80D1424(struct Sprite* sprite)
{
    if (sprite->data[0]++ > 19)
    {
        StartSpriteAffineAnim(sprite, 2);
        sprite->callback = sub_80D144C;
    }
}

void sub_80D144C(struct Sprite* sprite)
{
    if (sprite->affineAnimEnded)
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->data[0] = 0;
        if (sprite->data[7] == 0)
        {
            sprite->oam.tileNum += 16;
            sprite->callback = sub_80D14C4;
        }
        else
        {
            sprite->oam.tileNum += 32;
            sprite->callback = sub_80D154C;
        }
    }
}

void sub_80D14C4(struct Sprite* sprite)
{
    sprite->pos2.y -= 2;
    if (++sprite->data[0] == 9)
    {
        sprite->data[0] = 16;
        sprite->data[1] = 0;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = sprite->data[0];
        sprite->callback = sub_80D1504;
    }
}

void sub_80D1504(struct Sprite* sprite)
{
    if (sprite->data[1]++ % 3 == 0)
    {
        sprite->data[0]--;
        REG_BLDALPHA = sprite->data[0] | ((16 - sprite->data[0]) << 8);
        if (sprite->data[0] == 0)
            sprite->callback = sub_80D154C;
    }
}

void sub_80D154C(struct Sprite* sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        sprite->invisible = 1;
        if (sprite->data[7] == 0)
            sprite->callback = sub_80D158C;
        else
            sprite->callback = move_anim_8072740;
    }
}

void sub_80D158C(struct Sprite* sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    move_anim_8072740(sprite);
}

void sub_80D15A4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBankSpriteId(0);
    task->data[0] = spriteId;
    sub_80798F4(task, spriteId, &gUnknown_083D79BC);
    task->func = sub_80D15E0;
}

void sub_80D15E0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (sub_807992C(task) == 0)
    {
        gSprites[task->data[0]].pos2.y = 0;
        gSprites[task->data[0]].invisible = 1;
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D1638(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[12] = 3;
    if (GetBankSide(gBattleAnimBankTarget) == 0)
    {
        task->data[13] = 0xFFFF;
        task->data[14] = 8;
    }
    else
    {
        task->data[13] = 1;
        task->data[14] = -8;
    }

    task->data[15] = GetAnimBankSpriteId(1);
    task->func = sub_80D16A0;
}

void sub_80D16A0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        gSprites[task->data[15]].pos2.x += task->data[14];
        task->data[1] = 0;
        task->data[2] = 0;
        task->data[3] = 0;
        task->data[0]++;
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]++;
            if (task->data[2] & 1)
                gSprites[task->data[15]].pos2.x += 6;
            else
                gSprites[task->data[15]].pos2.x -= 6;

            if (++task->data[3] > 4)
            {
                if (task->data[2] & 1)
                    gSprites[task->data[15]].pos2.x -= 6;

                task->data[0]++;
            }
        }
        break;
    case 2:
        if (--task->data[12] != 0)
            task->data[0] = 0;
        else
            task->data[0]++;
        break;
    case 3:
        gSprites[task->data[15]].pos2.x += task->data[13];
        if (gSprites[task->data[15]].pos2.x == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D17C4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 1;
    task->data[13] = 14;
    task->data[14] = 2;
    task->data[15] = GetAnimBankSpriteId(0);
    task->func = sub_80D1808;
}

void sub_80D1808(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (task->data[0] == 0 && ++task->data[1] > task->data[4])
    {
        task->data[1] = 0;
        if (++task->data[2] & 1)
            gSprites[task->data[15]].invisible = 0;
        else
            gSprites[task->data[15]].invisible = 1;

        if (++task->data[3] >= task->data[13])
        {
            if (++task->data[4] < task->data[14])
            {
                task->data[1] = 0;
                task->data[2] = 0;
                task->data[3] = 0;
            }
            else
            {
                gSprites[task->data[15]].invisible = 0;
                DestroyAnimVisualTask(taskId);
            }
        }
    }
}

void sub_80D18D4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[13] = 0;
    task->data[14] = sub_8077ABC(gBattleAnimBankAttacker, 0);
    task->data[15] = sub_8077ABC(gBattleAnimBankAttacker, 1);
    task->func = sub_80D1930;
}

void sub_80D1930(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[8])
    {
    case 0:
        if (++task->data[4] > 1)
        {
            task->data[4] = 0;
            task->data[5] = (task->data[5] + 1) & 1;
            if (++task->data[6] > 20)
            {
                if (task->data[7] == 0)
                {
                    task->data[6] = 0;
                    task->data[8] = 1;
                }
                else
                    task->data[8] = 2;
            }
        }
        break;
    case 1:
        task->data[5] = 0;
        if (++task->data[4] > 20)
        {
            task->data[7] = 1;
            task->data[8] = 0;
        }
        break;
    case 2:
        task->data[5] = 1;
        break;
    }

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 4)
        {
            u8 spriteId;
            task->data[1] = 0;
            spriteId = CreateSprite(&gSpriteTemplate_83D79E8, task->data[14], task->data[15], 0);
            if (spriteId != MAX_SPRITES)
            {
                gSprites[spriteId].data[0] = taskId;
                gSprites[spriteId].data[1] = 13;
                gSprites[spriteId].pos2.x = gUnknown_083D7A00[task->data[2]][0];
                gSprites[spriteId].pos2.y = gUnknown_083D7A00[task->data[2]][1];
                task->data[13]++;
                if (++task->data[2] > 3)
                {
                    task->data[2] = 0;
                    if (++task->data[3] > 5)
                        task->data[0]++;
                }
            }
        }
        break;
    case 1:
        if (task->data[13] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D1A70(struct Sprite* sprite)
{
    sprite->invisible = gTasks[sprite->data[0]].data[5];
    if (sprite->animEnded)
    {
        gTasks[sprite->data[0]].data[sprite->data[1]]--;
        DestroySprite(sprite);
    }
}

void sub_80D1ADC(u8 taskId)
{
    int i;
    u8 sp[8];
    void* src;
    void* dest;
    void* what;
    sp[0] = IndexOfSpritePaletteTag(0x27DE);
    for (i = 1; i <= 4; i++)
    {
        sp[i] = AllocSpritePalette(0x2710 - i);
    }

    src = &gBattleAnimSpritePalette_206;
    dest = (NotInBattle()) ? gSharedMem + 0x18000 - 0x3800: gSharedMem + 0x18000;
    LZDecompressWram(src, dest);
    for (i = 0; i <= 4; i++)
    {
        what = ((NotInBattle()) ? gSharedMem + 0x14800 : gSharedMem + 0x18000) + (i << 5);
        LoadPalette(what, (u16)((sp[i] << 4) + 0x100), 32);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80D1B80(u8 taskId)
{
    int i;
    for (i = 0; i < 5; i++)
    {
        FreeSpritePaletteByTag(gUnknown_083D7A5C[i]);
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80D1BA8(struct Sprite* sprite, u8 a, u8 b)
{
    u8 tile;
    tile = (b & 1);
    tile = ((-tile | tile) >> 31) & 32;
    sprite->oam.tileNum += tile + (a << 2);
    sprite->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_083D7A5C[b >> 1]);
}

void sub_80D1C08(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    if (GetBankSide(gBattleAnimBankAttacker) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[3];
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
    sub_80D1BA8(sprite, gBattleAnimArgs[5], gBattleAnimArgs[6]);
}

void sub_80D1C80(struct Sprite* sprite)
{
    if (++sprite->data[0] == 1)
        sub_80787B0(sprite, 0);

    sprite->pos2.x = Sin(sprite->data[1], 8);
    sprite->pos2.y = sprite->data[2] >> 8;
    sprite->data[1] = (sprite->data[1] + 7) & 0xFF;
    sprite->data[2] -= 0x80;
    if (sprite->data[0] == 0x3C)
        move_anim_8072740(sprite);
}

void sub_80D1CD0(u8 taskId)
{
    int zero;
    bool8 result = NotInBattle();
    u16 var = 0xF0;
    if (result)
    {
        var = 0x98;
        zero = 0;
    }
    else
    {
        zero = 0;
    }

    gUnknown_030042C4 = var;
    gUnknown_03004240 = 0xA0;
    REG_WIN0H = var;
    REG_WIN0V = 0xA0;
    REG_WININ = 0x3F1F;
    REG_WINOUT = 0x3F3F;
    REG_BLDCNT = 0xC8;
    REG_BLDY = 0x10;
    gTasks[taskId].data[0] = zero;
    gTasks[taskId].data[1] = var;
    gTasks[taskId].func = sub_80D1D48;
}

void sub_80D1D48(u8 taskId)
{
    gTasks[taskId].data[0] += 13;
    gTasks[taskId].data[1] -= 13;
    if (gTasks[taskId].data[0] >= gTasks[taskId].data[1])
    {
        gUnknown_030042C4 = 0;
        gTasks[taskId].func = sub_80D1D9C;
    }
    else
    {
        gUnknown_030042C4 = gTasks[taskId].data[1] | (gTasks[taskId].data[0] << 8);
    }
}

void sub_80D1D9C(u8 taskId)
{
    if (++gTasks[taskId].data[10] == 5)
    {
        gTasks[taskId].data[11] = 0x88;
        RequestSpriteCopy((u8 *)(&gTasks[taskId].data[11]), (u8 *)(&REG_BLDCNT), 2);
        BlendPalettes(sub_80791A8(1, 0, 0, 0, 0, 0, 0), 16, RGB(31, 31, 31));
    }
    else if (gTasks[taskId].data[10] > 4)
    {
        gUnknown_030042C4 = 0;
        gUnknown_03004240 = 0;
        REG_WININ = 0x3F3F;
        REG_WINOUT = 0x3F3F;
        REG_BLDCNT = 0;
        REG_BLDY = 0;
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D1E38(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(1);
    if (++gTasks[taskId].data[0] == 1)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBankSpriteId(1), &gUnknown_083D7A98);
        gSprites[spriteId].pos2.x = 4;
    }
    else
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
        if (sub_807992C(&gTasks[taskId]) == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_80D1EC8(u8 taskId)
{
    u8 spriteId = GetAnimBankSpriteId(0);
    if (++gTasks[taskId].data[0] == 1)
    {
        sub_80798F4(&gTasks[taskId], GetAnimBankSpriteId(0), &gUnknown_083D7A98);
        gSprites[spriteId].pos2.x = 4;
    }
    else
    {
        gSprites[spriteId].pos2.x = -gSprites[spriteId].pos2.x;
        if (sub_807992C(&gTasks[taskId]) == 0)
        {
            gSprites[spriteId].pos2.x = 0;
            gSprites[spriteId].pos2.y = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
}

void sub_80D1F58(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->data[0] = 0x5F;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->callback = sub_80D1FA4;
}

void sub_80D1FA4(struct Sprite* sprite)
{
    if (sub_8078B5C(sprite) == 0)
    {
        sprite->pos2.y += Sin(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 4) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}

void sub_80D1FDC(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 0x64)
        {
            sprite->invisible = sprite->data[3] % 2;
        }

        if (sprite->data[3] > 0x78)
        {
            move_anim_8072740(sprite);
        }
    }
}

void sub_80D2064(struct Sprite* sprite)
{
    sprite->pos1.x = gBattleAnimArgs[0];
    sprite->pos1.y = 0xA0;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, sub_80D2094);
}

void sub_80D2094(struct Sprite* sprite)
{
    s16 y;
    sprite->data[2] += sprite->data[1];
    sprite->pos2.y = -((u16)sprite->data[2] >> 8);
    sprite->pos2.x = Sin(sprite->data[3], 4);
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    y = sprite->pos1.y + sprite->pos2.y;
    if (y <= 0x48)
    {
        sprite->invisible = sprite->data[3] % 2;
        if (y <= 0x40)
            move_anim_8072740(sprite);
    }
}

void sub_80D2100(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u8* tempvar;
    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 3;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    if (!NotInBattle())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    sub_8078914(&subStruct);
    tempvar = subStruct.field_4;
    DmaFill32(3, 0x0, tempvar, 0x1000);
    LZDecompressVram(&gAttractTilemap, tempvar);
    LZDecompressVram(&gAttractGfx, subStruct.field_0);
    LoadCompressedPalette(&gAttractPal, subStruct.field_8 << 4, 32);
    if (NotInBattle())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    gTasks[taskId].func = sub_80D21F0;
}

void sub_80D21F0(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 16)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 0x8D)
        {
            gTasks[taskId].data[11] = 16;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 4)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        sub_8078914(&subStruct);
        {
            u8 *addr = subStruct.field_0;
            u32 size = 0x2000;
            while (1)
            {
                DmaFill32(3, 0, addr, 0x1000);
                addr += 0x1000;
                size -= 0x1000;
                if (size <= 0x1000)
                {
                    DmaFill32(3, 0, addr, size);
                    break;
                }
            }
        }
        DmaClear32(3, subStruct.field_4, 0x800);
        if (!NotInBattle())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;

        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BG1CNT_BITFIELD.priority = 1;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D23B4(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u8* tempvar;
    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0x1000;
    REG_BG1CNT_BITFIELD.priority = 1;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    if (!NotInBattle())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    sub_8078914(&subStruct);
    tempvar = subStruct.field_4;
    DmaFill32(3, 0x0, tempvar, 0x1000);
    if (NotInBattle())
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFaceContest, subStruct.field_4);
    else if (GetBankSide(gBattleAnimBankTarget) == 1)
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFacePlayer, subStruct.field_4);
    else
        LZDecompressVram(&gBattleAnimBackgroundTilemap_ScaryFaceOpponent, subStruct.field_4);

    LZDecompressVram(&gBattleAnimBackgroundImage_ScaryFace, subStruct.field_0);
    LoadCompressedPalette(&gBattleAnimBackgroundPalette_ScaryFace, subStruct.field_8 << 4, 32);
    if (NotInBattle())
        sub_80763FC(subStruct.field_8, (u16 *)subStruct.field_4, 0, 0);

    gTasks[taskId].func = sub_80D24E0;
}

void sub_80D24E0(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;

    switch (gTasks[taskId].data[12])
    {
    case 0:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]++;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 14)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 1:
        if (++gTasks[taskId].data[11] == 0x15)
        {
            gTasks[taskId].data[11] = 14;
            gTasks[taskId].data[12]++;
        }
        break;
    case 2:
        if (++gTasks[taskId].data[10] == 2)
        {
            gTasks[taskId].data[10] = 0;
            gTasks[taskId].data[11]--;
            REG_BLDALPHA = gTasks[taskId].data[11] | ((16 - gTasks[taskId].data[11]) << 8);
            if (gTasks[taskId].data[11] == 0)
            {
                gTasks[taskId].data[12]++;
                gTasks[taskId].data[11] = 0;
            }
        }
        break;
    case 3:
        sub_8078914(&subStruct);
        {
            u8 *addr = subStruct.field_0;
            u32 size = 0x2000;
            while (1)
            {
                DmaFill32(3, 0, addr, 0x1000);
                addr += 0x1000;
                size -= 0x1000;
                if (size <= 0x1000)
                {
                    DmaFill32(3, 0, addr, size);
                    break;
                }
            }
        }
        DmaClear32(3, subStruct.field_4, 0x800);
        if (!NotInBattle())
            REG_BG1CNT_BITFIELD.charBaseBlock = 0;

        gTasks[taskId].data[12]++;
        // fall through
    case 4:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BG1CNT_BITFIELD.priority = 1;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D26A4(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->affineAnimPaused = 1;
    sprite->data[0] = gBattleAnimArgs[0];
    sprite->data[1] = gBattleAnimArgs[1];
    sprite->data[7] = sub_8079E90(gBattleAnimBankAttacker);
    sprite->callback = sub_80D2704;
    sub_80D2704(sprite);
}

void sub_80D2704(struct Sprite* sprite)
{
    if ((u16)(sprite->data[1] - 0x40) <= 0x7F)
        sprite->subpriority = sprite->data[7] + 1;
    else
        sprite->subpriority = sprite->data[7] - 1;

    sprite->pos2.x = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->pos2.y = Cos(sprite->data[1], sprite->data[3] >> 8);
    sprite->data[1] = (sprite->data[1] + 9) & 0xFF;
    switch (sprite->data[5])
    {
    case 1:
        sprite->data[2] -= 0x400;
        sprite->data[3] -= 0x100;
        if (++sprite->data[4] == sprite->data[0])
        {
            sprite->data[5] = 2;
            return;
        }
        break;
    case 0:
        sprite->data[2] += 0x400;
        sprite->data[3] += 0x100;
        if (++sprite->data[4] == sprite->data[0])
        {
            sprite->data[4] = 0;
            sprite->data[5] = 1;
        }
        break;
    }

    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
        move_anim_8072740(sprite);
}

void sub_80D27E0(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = Sin(gBattleAnimArgs[0], 10);
    sprite->data[1] = Cos(gBattleAnimArgs[0], 7);
    sprite->callback = sub_80D2834;
}

void sub_80D2834(struct Sprite* sprite)
{
    sprite->pos2.x += sprite->data[0];
    sprite->pos2.y += sprite->data[1];
    if (sprite->pos1.x + sprite->pos2.x + 16 > 0x110u || sprite->pos1.y + sprite->pos2.y > 0xA0 || sprite->pos1.y + sprite->pos2.y < -16)
        move_anim_8072740(sprite);
}

void sub_80D287C(struct Sprite* sprite)
{
    sprite->pos2.x += sprite->data[0];
    sprite->pos2.y += sprite->data[1];
    if (sprite->data[3]++ >= sprite->data[2])
        move_anim_8072740(sprite);
}

void sub_80D28AC(struct Sprite* sprite)
{
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->data[0] = Sin(gBattleAnimArgs[0], 10);
    sprite->data[1] = Cos(gBattleAnimArgs[0], 7);
    sprite->data[2] = gBattleAnimArgs[1];
    sprite->callback = sub_80D287C;
}

void sub_80D2904(struct Sprite* sprite)
{
    if (sprite->animEnded)
        move_anim_8072740(sprite);
}

void sub_80D2920(struct Sprite* sprite)
{
    sub_80787B0(sprite, 1);
    sprite->callback = sub_80D2904;
}

void sub_80D2938(struct Sprite* sprite)
{
    s16 r5;
    if (sprite->data[0] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->data[0]++;
    r5 = (sprite->data[0] * 10) & 0xFF;
    sprite->pos2.x = Sin(r5, 0x50) >> 8;
    if (sprite->data[0] <= 0x4F)
        sprite->pos2.y = (sprite->data[0] / 2) + (Cos(r5, 0x50) >> 8);

    if (sprite->data[0] > 0x5A)
    {
        sprite->data[2]++;
        sprite->pos2.x -= sprite->data[2] / 2;
    }

    if (sprite->data[0] > 0x64)
        move_anim_8072740(sprite);
}

void sub_80D29CC(struct Sprite* sprite)
{
    sprite->data[5]++;
    sprite->pos2.x = Sin(sprite->data[3], 5);
    sprite->pos2.y = sprite->data[5] / 2;
    sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
    if (sprite->data[5] > 20)
        sprite->invisible = sprite->data[5] % 2;

    if (sprite->data[5] > 30)
        move_anim_8072740(sprite);
}

void sub_80D2A38(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[2] = gBattleAnimArgs[1];
        sprite->data[0]++;
    }
    else
    {
        sprite->data[4] += sprite->data[1];
        sprite->pos2.x = sprite->data[4] >> 8;
        sprite->pos2.y = Sin(sprite->data[3], sprite->data[2]);
        sprite->data[3] = (sprite->data[3] + 3) & 0xFF;
        if (sprite->data[3] > 0x46)
        {
            sprite->callback = sub_80D29CC;
            sprite->pos1.x += sprite->pos2.x;
            sprite->pos1.y += sprite->pos2.y;
            sprite->pos2.x = 0;
            sprite->pos2.y = 0;
            sprite->data[3] = Random() % 0xB4;
        }
    }
}

/* void sub_80D2ABC(struct Sprite* sprite)
{
    int var;
    s16 var2;
    int var3;
    if (sprite->data[3] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, 0);
        sprite->subpriority = sub_8079E90(gBattleAnimBankTarget) - 1;
        sprite->data[2] = 1;
    }

    sprite->data[0] += sprite->data[2];
    var = sprite->data[0] * 4;
    if (var < 0)
        var += 0xFF;

    sprite->data[1] = (sprite->data[0] * 4) -(((var) >> 8) << 8);
    if (sprite->data[1] < 0)
        sprite->data[1] = 0;

    var3 = sprite->data[1];
    var2 = sprite->data[0];
    var2 /= 4;
    sprite->pos2.x = Cos(var3, 30 - var2);
    var3 = sprite->data[1];
    var2 = sprite->data[0] / 8;
    sprite->pos2.x = Sin(var3, 10 - var2);
    if (sprite->data[1] > 0x80 && sprite->data[2] > 0)
        sprite->data[2] = 0xFFFF;
} */