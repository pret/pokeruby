#include "global.h"
#include "gba/m4a_internal.h"
#include "battle.h"
#include "main.h"
#include "pokemon.h"
#include "rom_8077ABC.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

extern struct MusicPlayerInfo gMPlay_BGM;
extern u16 gBattleTypeFlags;
extern u8 gBankTarget;
extern u8 gActiveBank;
extern u16 gBattlePartyID[];
extern u8 gObjectBankIDs[];
extern u8 gDoingBattleAnim;

extern const struct SpriteTemplate gSpriteTemplate_820AAB4[];

extern u32 ball_number_to_ball_processing_index(u16);  // not sure of return type
extern void sub_80786EC();
extern bool8 sub_8078718(struct Sprite *);
extern void sub_814086C(u8, u8, int, int, u8);
extern u8 sub_8141314(u8, u8, u8, u8);

void sub_8046464(u8);
void sub_80466E8(struct Sprite *);
void sub_80466F4(struct Sprite *);
void sub_8046760(struct Sprite *);
void sub_80467F8(struct Sprite *);
void sub_804684C(struct Sprite *);
void sub_8046944(struct Sprite *);
void sub_8046984(struct Sprite *);
void sub_8046C78(struct Sprite *);
void sub_8046E7C(struct Sprite *);
void sub_8046E9C(struct Sprite *);
void sub_8046FBC(struct Sprite *);
void sub_8047074(struct Sprite *);
void sub_8047254(struct Sprite *);
void sub_80478DC();
void sub_804794C(u8);
u16 sub_8047978();

u8 sub_8046400(u16 a, u8 b)
{
    u8 taskId;

    gDoingBattleAnim = 1;
    ewram17810[gActiveBank].unk0_3 = 1;
    taskId = CreateTask(sub_8046464, 5);
    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = b;
    gTasks[taskId].data[3] = gActiveBank;
    return 0;
}

void sub_8046464(u8 taskId)
{
    bool8 sp0 = FALSE;
    u16 r8;
    u8 r5;
    u16 ball;
    u8 r4;
    u8 spriteId;

    if (gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].data[0]++;
        return;
    }
    r8 = gTasks[taskId].data[2];
    r5 = gTasks[taskId].data[3];
    if (GetBankSide(r5) != 0)
        ball = GetMonData(&gEnemyParty[gBattlePartyID[r5]], MON_DATA_POKEBALL);
    else
        ball = GetMonData(&gPlayerParty[gBattlePartyID[r5]], MON_DATA_POKEBALL);
    r4 = ball_number_to_ball_processing_index(ball);
    sub_80478DC(r4);
    spriteId = CreateSprite(&gSpriteTemplate_820AAB4[r4], 32, 80, 0x1D);
    gSprites[spriteId].data0 = 0x80;
    gSprites[spriteId].data1 = 0;
    gSprites[spriteId].data7 = r8;
    switch (r8)
    {
    case 0xFF:
        gBankTarget = r5;
        gSprites[spriteId].pos1.x = 0x18;
        gSprites[spriteId].pos1.y = 0x44;
        gSprites[spriteId].callback = sub_8047074;
        break;
    case 0xFE:
        gSprites[spriteId].pos1.x = sub_8077ABC(r5, 0);
        gSprites[spriteId].pos1.y = sub_8077ABC(r5, 1) + 0x18;
        gBankTarget = r5;
        gSprites[spriteId].data0 = 0;
        gSprites[spriteId].callback = sub_8047254;
        break;
    default:
        gBankTarget = GetBankByPlayerAI(1);
        sp0 = TRUE;
        break;
    }
    gSprites[spriteId].data6 = gBankTarget;
    if (!sp0)
    {
        DestroyTask(taskId);
        return;
    }
    gSprites[spriteId].data0 = 0x22;
    gSprites[spriteId].data2 = sub_8077ABC(gBankTarget, 0);
    gSprites[spriteId].data4 = sub_8077ABC(gBankTarget, 1) - 16;
    gSprites[spriteId].data5 = -40;
    sub_80786EC(&gSprites[spriteId]);
    gSprites[spriteId].oam.affineParam = taskId;
    gTasks[taskId].data[4] = gBankTarget;
    gTasks[taskId].func = TaskDummy;
    PlaySE(SE_NAGERU);
}

void objc_0804ABD4(struct Sprite *sprite)
{
    if (sub_8078718(sprite))
    {
        u8 taskId = sprite->oam.affineParam;
        u8 r5 = gTasks[taskId].data[4];
        u8 r8 = gTasks[taskId].data[2];
        u32 r4;  // not sure of this type

        StartSpriteAnim(sprite, 1);
        sprite->affineAnimPaused = TRUE;
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data5 = 0;
        r4 = ball_number_to_ball_processing_index(sub_8047978(r5));
        sub_814086C(sprite->pos1.x, sprite->pos1.y - 5, 1, 0x1C, r4);
        sprite->data0 = sub_8141314(0, r5, 14, r4);
        sprite->data6 = r5;
        sprite->data7 = r8;
        DestroyTask(taskId);
        sprite->callback = sub_80466E8;
    }
}

void sub_80466E8(struct Sprite *sprite)
{
    sprite->callback = sub_80466F4;
}

void sub_80466F4(struct Sprite *sprite)
{
    sprite->data5++;
    if (sprite->data5 == 10)
    {
        sprite->data5 = 0;
        sprite->callback = sub_8046760;
        StartSpriteAffineAnim(&gSprites[gObjectBankIDs[sprite->data6]], 2);
        AnimateSprite(&gSprites[gObjectBankIDs[sprite->data6]]);
        gSprites[gObjectBankIDs[sprite->data6]].data1 = 0;
    }
}

void sub_8046760(struct Sprite *sprite)
{
    sprite->data5++;
    if (sprite->data5 == 11)
        PlaySE(SE_SUIKOMU);
    if (gSprites[gObjectBankIDs[sprite->data6]].affineAnimEnded)
    {
        StartSpriteAnim(sprite, 2);
        gSprites[gObjectBankIDs[sprite->data6]].invisible = TRUE;
        sprite->data5 = 0;
        sprite->callback = sub_80467F8;
    }
    else
    {
        gSprites[gObjectBankIDs[sprite->data6]].data1 += 0x60;
        gSprites[gObjectBankIDs[sprite->data6]].pos2.y = -gSprites[gObjectBankIDs[sprite->data6]].data1 >> 8;
    }
}

void sub_80467F8(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        sprite->data5++;
        if (sprite->data5 == 1)
        {
            sprite->data3 = 0;
            sprite->data4 = 32;
            sprite->data5 = 0;
            sprite->pos1.y += Cos(0, 32);
            sprite->pos2.y = -Cos(0, sprite->data4);
            sprite->callback = sub_804684C;
        }
    }
}

void sub_804684C(struct Sprite *sprite)
{
    bool8 r5 = FALSE;

    switch (sprite->data3 & 0xFF)
    {
    case 0:
        sprite->pos2.y = -Cos(sprite->data5, sprite->data4);
        sprite->data5 += 4 + (sprite->data3 >> 8);
        if (sprite->data5 >= 64)
        {
            sprite->data4 -= 10;
            sprite->data3 += 0x101;
            if (sprite->data3 >> 8 == 4)
                r5 = TRUE;
            switch (sprite->data3 >> 8)
            {
            case 1:
                PlaySE(SE_KON);
                break;
            case 2:
                PlaySE(SE_KON2);
                break;
            case 3:
                PlaySE(SE_KON3);
                break;
            default:
                PlaySE(SE_KON4);
                break;
            }
        }
        break;
    case 1:
        sprite->pos2.y = -Cos(sprite->data5, sprite->data4);
        sprite->data5 -= 4 + (sprite->data3 >> 8);
        if (sprite->data5 <= 0)
        {
            sprite->data5 = 0;
            sprite->data3 &= 0xFF00;
        }
        break;
    }
    if (r5)
    {
        sprite->data3 = 0;
        sprite->pos1.y += Cos(64, 32);
        sprite->pos2.y = 0;
        if (sprite->data7 == 0)
        {
            sprite->callback = sub_8046C78;
        }
        else
        {
            sprite->callback = sub_8046944;
            sprite->data4 = 1;
            sprite->data5 = 0;
        }
    }
}

void sub_8046944(struct Sprite *sprite)
{
    sprite->data3++;
    if (sprite->data3 == 31)
    {
        sprite->data3 = 0;
        sprite->affineAnimPaused = TRUE;
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_8046984;
        PlaySE(SE_BOWA);
    }
}

void sub_8046984(struct Sprite *sprite)
{
    switch (sprite->data3 & 0xFF)
    {
    case 0:
    case 2:
        sprite->pos2.x += sprite->data4;
        sprite->data5 += sprite->data4;
        sprite->affineAnimPaused = FALSE;
        if (sprite->data5 > 3 || sprite->data5 < -3)
        {
            sprite->data3++;
            sprite->data5 = 0;
        }
        break;
    case 1:
        sprite->data5++;
        if (sprite->data5 == 1)
        {
            sprite->data5 = 0;
            sprite->data4 = -sprite->data4;
            sprite->data3++;
            sprite->affineAnimPaused = FALSE;
            if (sprite->data4 < 0)
                ChangeSpriteAffineAnim(sprite, 2);
            else
                ChangeSpriteAffineAnim(sprite, 1);
        }
        else
        {
            sprite->affineAnimPaused = TRUE;
        }
        break;
    case 3:
        sprite->data3 += 0x100;
        if (sprite->data3 >> 8 == sprite->data7)
        {
            sprite->callback = sub_8046C78;
        }
        else
        {
            if (sprite->data7 == 4 && sprite->data3 >> 8 == 3)
            {
                sprite->callback = sub_8046E7C;
                sprite->affineAnimPaused = TRUE;
            }
            else
            {
                sprite->data3++;
                sprite->affineAnimPaused = TRUE;
            }
        }
        break;
    case 4:
    default:
        sprite->data5++;
        if (sprite->data5 == 31)
        {
            sprite->data5 = 0;
            sprite->data3 &= 0xFF00;
            StartSpriteAffineAnim(sprite, 3);
            if (sprite->data4 < 0)
                StartSpriteAffineAnim(sprite, 2);
            else
                StartSpriteAffineAnim(sprite, 1);
            PlaySE(SE_BOWA);
        }
        break;
    }
}

void sub_8046AD0(u8 taskId)
{
    u8 r6 = gTasks[taskId].data[2];
    u8 r3 = gTasks[taskId].data[1];
    u16 species = gTasks[taskId].data[0];

    switch (gTasks[taskId].data[15])
    {
    case 0:
    default:
        if (gTasks[taskId].data[8] < 3)
            gTasks[taskId].data[8]++;
        else
            gTasks[taskId].data[15] = r6 + 1;
        break;
    case 1:
        PlayCry1(species, r3);
        DestroyTask(taskId);
        break;
    case 2:
        StopCryAndClearCrySongs();
        gTasks[taskId].data[10] = 3;
        gTasks[taskId].data[15] = 20;
        break;
    case 20:
        if (gTasks[taskId].data[10] != 0)
        {
            gTasks[taskId].data[10]--;
            break;
        }
        PlayCry4(species, r3, 1);
        DestroyTask(taskId);
        break;
    case 3:
        gTasks[taskId].data[10] = 6;
        gTasks[taskId].data[15] = 30;
        break;
    case 30:
        if (gTasks[taskId].data[10] != 0)
        {
            gTasks[taskId].data[10]--;
            break;
        }
        gTasks[taskId].data[15]++;
        // fall through
    case 31:
        if (!IsCryPlayingOrClearCrySongs())
        {
            StopCryAndClearCrySongs();
            gTasks[taskId].data[10] = 3;
            gTasks[taskId].data[15]++;
        }
        break;
    case 32:
        if (gTasks[taskId].data[10] != 0)
        {
            gTasks[taskId].data[10]--;
            break;
        }
        PlayCry4(species, r3, 0);
        DestroyTask(taskId);
        break;
    }
}

void sub_8046C78(struct Sprite *sprite)
{
    u8 r5 = sprite->data6;
    u32 r4;  // not sure of this type

    StartSpriteAnim(sprite, 1);
    r4 = ball_number_to_ball_processing_index(sub_8047978(r5));
    sub_814086C(sprite->pos1.x, sprite->pos1.y - 5, 1, 0x1C, r4);
    sprite->data0 = sub_8141314(1, sprite->data6, 14, r4);
    sprite->callback = sub_8046E9C;
    if (gMain.inBattle)
    {
        struct Pokemon *pkmn;
        u16 species;
        s8 r8;
        u16 r4_2;
        u8 taskId;

        if (GetBankSide(r5) != 0)
        {
            pkmn = &gEnemyParty[gBattlePartyID[r5]];
            r8 = 25;
        }
        else
        {
            pkmn = &gPlayerParty[gBattlePartyID[r5]];
            r8 = -25;
        }
        species = GetMonData(pkmn, MON_DATA_SPECIES);
        if ((r5 == GetBankByPlayerAI(0) || r5 == GetBankByPlayerAI(1))
         && IsDoubleBattle() && ewram17840.unk9_0)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (IsBGMPlaying())
                    m4aMPlayStop(&gMPlay_BGM);
            }
            else
            {
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 128);
            }
        }
        if (!IsDoubleBattle() || !ewram17840.unk9_0)
            r4_2 = 0;
        else if (r5 == GetBankByPlayerAI(0) || r5 == GetBankByPlayerAI(1))
            r4_2 = 1;
        else
            r4_2 = 2;
        taskId = CreateTask(sub_8046AD0, 3);
        gTasks[taskId].data[0] = species;
        gTasks[taskId].data[1] = r8;
        gTasks[taskId].data[2] = r4_2;
        gTasks[taskId].data[15] = 0;
    }
    StartSpriteAffineAnim(&gSprites[gObjectBankIDs[sprite->data6]], 1);
    AnimateSprite(&gSprites[gObjectBankIDs[sprite->data6]]);
    gSprites[gObjectBankIDs[sprite->data6]].data1 = 0x1000;
}

void sub_8046E7C(struct Sprite *sprite)
{
    sprite->animPaused = TRUE;
    sprite->callback = sub_8046FBC;
    sprite->data3 = 0;
    sprite->data4 = 0;
    sprite->data5 = 0;
}

void sub_8046E9C(struct Sprite *sprite)
{
    bool8 r7 = FALSE;
    u8 r4 = sprite->data6;

    gSprites[gObjectBankIDs[r4]].invisible = FALSE;
    if (sprite->animEnded)
        sprite->invisible = TRUE;
    if (gSprites[gObjectBankIDs[r4]].affineAnimEnded)
    {
        StartSpriteAffineAnim(&gSprites[gObjectBankIDs[r4]], 0);
        r7 = TRUE;
    }
    else
    {
        gSprites[gObjectBankIDs[r4]].data1 -= 288;
        gSprites[gObjectBankIDs[r4]].pos2.y = gSprites[gObjectBankIDs[r4]].data1 >> 8;
    }
    if (sprite->animEnded && r7)
    {
        s32 i;
        u32 r3;

        gSprites[gObjectBankIDs[r4]].pos2.y = 0;
        gDoingBattleAnim = 0;
        ewram17810[r4].unk0_3 = 0;
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
        for (r3 = 0, i = 0; i < 4; i++)
        {
            if (ewram17810[i].unk0_3 == 0)
                r3++;
        }
        if (r3 == 4)
        {
            for (i = 0; i < 12; i++)
                sub_804794C(i);
        }
    }
}
