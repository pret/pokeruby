#include "global.h"
#include "asm.h"
#include "battle.h"
#include "items.h"
#include "link.h"
#include "pokemon.h"
#include "species.h"
#include "task.h"

extern u8 unk_2000000[];

#define EWRAM_14000 ((u8 *)(unk_2000000 + 0x14000))
#define EWRAM_15000 ((u8 *)(unk_2000000 + 0x15000))

extern u16 gBattleTypeFlags;
extern const u32 gBitTable[];
extern u16 gBattleWeather;
extern struct BattlePokemon gBattleMons[];

extern u8 gUnknown_020238C4;
extern u8 gUnknown_020238C5;
extern u8 gUnknown_020238C6;
extern u32 gUnknown_020239FC;
extern u8 gUnknown_02023A60[][0x200];
extern u8 gUnknown_02024260[][0x200];
extern u8 gUnknown_02024A60;
extern u32 gUnknown_02024A64;
extern u8 gUnknown_02024A68;
extern u16 gUnknown_02024A6A[];
extern u8 gUnknown_02024A72[];
extern u16 gUnknown_02024BE6;
extern u16 gUnknown_02024BE8;
extern u16 gUnknown_02024C04;
extern u8 byte_2024C06;
extern u8 gPlayerMonIndex;
extern u8 gEnemyMonIndex;
extern u8 gUnknown_02024C0A;
extern u8 gUnknown_02024C0B;
extern u8 gUnknown_02024C0C;
extern u8 gUnknown_02024C0E;
extern u8 gUnknown_02024C78;
extern u8 gUnknown_02024D26;
extern u8 gUnknown_02024E60[];
extern u8 gUnknown_02024E64[];
extern u8 gUnknown_03004040[];
extern u8 gUnknown_030041C0[];
extern u8 gUnknown_03004290[];
extern u8 gUnknown_030042B0[];
extern void (*gUnknown_030042D4)(void);
extern void (*gUnknown_03004330[])(void);

extern void sub_800BF28(void);
extern void sub_8083C50(u8);
extern void nullsub_41(void);
extern void nullsub_91(void);
extern void battle_anim_clear_some_data(void);
extern void ClearBattleMonForms(void);
extern void BattleAI_HandleItemUseBeforeAISetup(void);
extern void sub_8094978(u8, int);
extern void sub_800BA78(void);
extern void sub_800B9A8(void);
extern void sub_800BD54(void);
extern void sub_8010800(void);
extern void sub_812B468(void);
extern void sub_8137224(void);
extern void sub_802BF74(void);
extern void sub_8032AE0(void);
extern void sub_8037510(void);
extern void sub_811DA78(void);
extern void dp01_prepare_buffer_wireless_probably(u8 a, u16, u8 *c);
extern void sub_800C1A8(u8);
extern void sub_800C47C(u8);
extern void sub_8007F4C(void);
extern u8 sub_8007ECC(void);
extern void sub_80155A4();
extern u8 sub_8018324();

void sub_800B858(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        OpenLink();
        CreateTask(sub_8083C50, 0);
        sub_800BF28();
    }
}

void setup_poochyena_battle(void)
{
    s32 i;

    gUnknown_030042D4 = nullsub_41;
    for (i = 0; i < 4; i++)
    {
        gUnknown_03004330[i] = nullsub_91;
        gUnknown_02024A72[i] = 0xFF;
        gUnknown_02024E60[i] = 0;
        gUnknown_02024E64[i] = 0;
    }
    sub_800B858();
    gUnknown_02024A64 = 0;
    battle_anim_clear_some_data();
    ClearBattleMonForms();
    BattleAI_HandleItemUseBeforeAISetup();
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        ZeroEnemyPartyMons();
        CreateMon(&gEnemyParty[0], SPECIES_POOCHYENA, 2, 32, 0, 0, 0, 0);
        i = ITEM_NONE;
        SetMonData(&gEnemyParty[0], MON_DATA_HELD_ITEM, (u8 *)&i);
    }
    gUnknown_020239FC = 0;
    gUnknown_02024C78 = 0;
}

void sub_800B950(void)
{
    s32 i;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        sub_800BA78();
    else
        sub_800B9A8();
    sub_800BD54();
    if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        for (i = 0; i < gUnknown_02024A68; i++)
            sub_8094978(i, 0);
    }
}

void sub_800B9A8(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        gUnknown_030042D4 = sub_8010800;
        if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
            gUnknown_03004330[0] = sub_812B468;
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL)
            gUnknown_03004330[0] = sub_8137224;
        else
            gUnknown_03004330[0] = sub_802BF74;
        gUnknown_02024A72[0] = 0;
        gUnknown_03004330[1] = sub_8032AE0;
        gUnknown_02024A72[1] = 1;
        gUnknown_02024A68 = 2;
    }
    else
    {
        gUnknown_030042D4 = sub_8010800;
        gUnknown_03004330[0] = sub_802BF74;
        gUnknown_02024A72[0] = 0;
        gUnknown_03004330[1] = sub_8032AE0;
        gUnknown_02024A72[1] = 1;
        gUnknown_03004330[2] = sub_802BF74;
        gUnknown_02024A72[2] = 2;
        gUnknown_03004330[3] = sub_8032AE0;
        gUnknown_02024A72[3] = 3;
        gUnknown_02024A68 = 4;
    }
}

void sub_800BA78(void)
{
    u8 multiplayerId;
    int i;

    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        if (gBattleTypeFlags & BATTLE_TYPE_WILD)
        {
            gUnknown_030042D4 = sub_8010800;
            gUnknown_03004330[0] = sub_802BF74;
            gUnknown_02024A72[0] = 0;
            gUnknown_03004330[1] = sub_8037510;
            gUnknown_02024A72[1] = 1;
            gUnknown_02024A68 = 2;
        }
        else
        {
            gUnknown_03004330[1] = sub_802BF74;
            gUnknown_02024A72[1] = 0;
            gUnknown_03004330[0] = sub_8037510;
            gUnknown_02024A72[0] = 1;
            gUnknown_02024A68 = 2;
        }
        return;
    }
    if ((gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_DOUBLE)) == BATTLE_TYPE_DOUBLE)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_WILD)
        {
            gUnknown_030042D4 = sub_8010800;
            gUnknown_03004330[0] = sub_802BF74;
            gUnknown_02024A72[0] = 0;
            gUnknown_03004330[1] = sub_8037510;
            gUnknown_02024A72[1] = 1;
            gUnknown_03004330[2] = sub_802BF74;
            gUnknown_02024A72[2] = 2;
            gUnknown_03004330[3] = sub_8037510;
            gUnknown_02024A72[3] = 3;
            gUnknown_02024A68 = 4;
        }
        else
        {
            gUnknown_03004330[1] = sub_802BF74;
            gUnknown_02024A72[1] = 0;
            gUnknown_03004330[0] = sub_8037510;
            gUnknown_02024A72[0] = 1;
            gUnknown_03004330[3] = sub_802BF74;
            gUnknown_02024A72[3] = 2;
            gUnknown_03004330[2] = sub_8037510;
            gUnknown_02024A72[2] = 3;
            gUnknown_02024A68 = 4;

        }
        return;
    }
    multiplayerId = GetMultiplayerId();
    if (gBattleTypeFlags & BATTLE_TYPE_WILD)
        gUnknown_030042D4 = sub_8010800;
    for (i = 0; i < 4; i++)
    {
        switch (gLinkPlayers[i].lp_field_18)
        {
        case 0:
        case 3:
            sub_8094978(gLinkPlayers[i].lp_field_18, 0);
            break;
        case 1:
        case 2:
            sub_8094978(gLinkPlayers[i].lp_field_18, 1);
            break;
        }

        if (i == multiplayerId)
        {
            gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_802BF74;
            switch (gLinkPlayers[i].lp_field_18)
            {
            case 0:
            case 3:
                gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 0;
                gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                break;
            case 1:
            case 2:
                gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 2;
                gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                break;
            }
        }
        else
        {
            if ((!(gLinkPlayers[i].lp_field_18 & 1) && !(gLinkPlayers[multiplayerId].lp_field_18 & 1))
             || ((gLinkPlayers[i].lp_field_18 & 1) && (gLinkPlayers[multiplayerId].lp_field_18 & 1)))
            {
                gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_811DA78;
                switch (gLinkPlayers[i].lp_field_18)
                {
                case 0:
                case 3:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 0;
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                    break;
                case 1:
                case 2:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 2;
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                    break;
                }
            }
            else
            {
                gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_8037510;
                switch (gLinkPlayers[i].lp_field_18)
                {
                case 0:
                case 3:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 1;
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                    break;
                case 1:
                case 2:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 3;
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                    break;
                }
            }
        }
    }
    gUnknown_02024A68 = 4;
}

void sub_800BD54(void)
{
    int i;
    int j;

    if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        for (i = 0; i < gUnknown_02024A68; i++)
        {
            for (j = 0; j < 6; j++)
            {
                if (i < 2)
                {
                    if (!(gUnknown_02024A72[i] & 1))
                    {
                        if (GetMonData(&gPlayerParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != 0
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != SPECIES_EGG
                         && GetMonData(&gPlayerParty[j], MON_DATA_IS_EGG) == 0)
                        {
                            gUnknown_02024A6A[i] = j;
                            break;
                        }
                    }
                    else
                    {
                        if (GetMonData(&gEnemyParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != 0
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != SPECIES_EGG
                         && GetMonData(&gEnemyParty[j], MON_DATA_IS_EGG) == 0)
                        {
                            gUnknown_02024A6A[i] = j;
                            break;
                        }
                    }
                }
                else
                {
                    if (!(gUnknown_02024A72[i] & 1))
                    {
                        if (GetMonData(&gPlayerParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES) != 0  //Probably a typo by Game Freak. The rest use SPECIES2
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != SPECIES_EGG
                         && GetMonData(&gPlayerParty[j], MON_DATA_IS_EGG) == 0
                         && gUnknown_02024A6A[i - 2] != j)
                        {
                            gUnknown_02024A6A[i] = j;
                            break;
                        }
                    }
                    else
                    {
                        if (GetMonData(&gEnemyParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != 0
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != SPECIES_EGG
                         && GetMonData(&gEnemyParty[j], MON_DATA_IS_EGG) == 0
                         && gUnknown_02024A6A[i - 2] != j)
                        {
                            gUnknown_02024A6A[i] = j;
                            break;
                        }
                    }
                }
            }
        }
    }
}

void dp01_prepare_buffer(u8 a, u8 *b, u16 c)
{
    int i;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        dp01_prepare_buffer_wireless_probably(a, c, b);
    }
    else
    {
        switch (a)
        {
        case 0:
            for (i = 0; i < c; i++)
            {
                gUnknown_02023A60[gUnknown_02024A60][i] = *b;
                b++;
            }
            break;
        case 1:
            for (i = 0; i < c; i++)
            {
                gUnknown_02024260[gUnknown_02024A60][i] = *b;
                b++;
            }
            break;
        }
    }
}

void sub_800BF28(void)
{
    gUnknown_020238C4 = CreateTask(sub_800C1A8, 0);
    gTasks[gUnknown_020238C4].data[11] = 0;
    gTasks[gUnknown_020238C4].data[12] = 0;
    gTasks[gUnknown_020238C4].data[13] = 0;
    gTasks[gUnknown_020238C4].data[14] = 0;
    gTasks[gUnknown_020238C4].data[15] = 0;
    gUnknown_020238C5 = CreateTask(sub_800C47C, 0);
    gTasks[gUnknown_020238C5].data[12] = 0;
    gTasks[gUnknown_020238C5].data[13] = 0;
    gTasks[gUnknown_020238C5].data[14] = 0;
    gTasks[gUnknown_020238C5].data[15] = 0;
    gUnknown_020238C6 = 0;
    CpuFill16(0, EWRAM_14000, 0x2000);
}

void dp01_prepare_buffer_wireless_probably(u8 a, u16 b, u8 *c)
{
    s32 r9;
    int i;

    r9 = b - b % 4 + 4;
    if (gTasks[gUnknown_020238C4].data[14] + r9 + 9 > 0x1000)
    {
        gTasks[gUnknown_020238C4].data[12] = gTasks[gUnknown_020238C4].data[14];
        gTasks[gUnknown_020238C4].data[14] = 0;
    }
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14000] = a;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14001] = gUnknown_02024A60;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14002] = gPlayerMonIndex;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14003] = gEnemyMonIndex;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14004] = r9;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14005] = (r9 & 0x0000FF00) >> 8;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14006] = gUnknown_02024C0C;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14007] = gUnknown_02024C0A;
    for (i = 0; i < b; i++)
        unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14008 + i] = c[i];
    gTasks[gUnknown_020238C4].data[14] = gTasks[gUnknown_020238C4].data[14] + r9 + 8;
}

void sub_800C1A8(u8 taskId)
{
    u16 var;

    switch (gTasks[taskId].data[11])
    {
    case 0:
        gTasks[taskId].data[10] = 100;
        gTasks[taskId].data[11]++;
        break;
    case 1:
        gTasks[taskId].data[10]--;
        if (gTasks[taskId].data[10] == 0)
            gTasks[taskId].data[11]++;
        break;
    case 2:
        GetLinkPlayerCount_2();
        if (IsLinkMaster())
        {
            sub_8007F4C();
            gTasks[taskId].data[11]++;
            break;
        }
        gTasks[taskId].data[11]++;
        break;
    case 3:
        if (gTasks[taskId].data[15] != gTasks[taskId].data[14])
        {
            if (gTasks[taskId].data[13] == 0)
            {
                if (gTasks[taskId].data[15] > gTasks[taskId].data[14]
                 && gTasks[taskId].data[15] == gTasks[taskId].data[12])
                {
                    gTasks[taskId].data[12] = 0;
                    gTasks[taskId].data[15] = 0;
                }
                var = (unk_2000000[gTasks[taskId].data[15] + 0x14004] | (unk_2000000[gTasks[taskId].data[15] + 0x14005] << 8)) + 8;
                SendBlock(bitmask_all_link_players_but_self(), &unk_2000000[gTasks[taskId].data[15] + 0x14000], var);
                gTasks[taskId].data[11]++;
            }
            else
            {
                gTasks[taskId].data[13]--;
                break;
            }
        }
        break;
    case 4:
        if (sub_8007ECC())
        {
            var = unk_2000000[gTasks[taskId].data[15] + 0x14004] | (unk_2000000[gTasks[taskId].data[15] + 0x14005] << 8);
            gTasks[taskId].data[13] = 1;
            gTasks[taskId].data[15] = gTasks[taskId].data[15] + var + 8;
            gTasks[taskId].data[11] = 3;
        }
        break;
    case 5:
        gTasks[taskId].data[13]--;
        if (gTasks[taskId].data[13] == 0)
        {
            gTasks[taskId].data[13] = 1;
            gTasks[taskId].data[11] = 3;
        }
        break;
    }
}

//fix me
void sub_800C35C(void)
{
    u8 i;  //r4
    s32 j;  //r2
    u16 r6;  //r6
    u8 *recvBuffer;  //r3
    u8 *dest;  //r5
    u8 *src;  //r4

    if (gReceivedRemoteLinkPlayers != 0 && (gBattleTypeFlags & 0x20) && gLinkPlayers[0].linkType == 0x2211)
    {
        for (i = 0; i < GetLinkPlayerCount(); i++)
        {
            if (GetBlockReceivedStatus() & gBitTable[i])
            {
                ResetBlockReceivedFlag(i);
                recvBuffer = (u8 *)&gBlockRecvBuffer[i];
#ifndef NONMATCHING
                asm("");
                recvBuffer = (u8 *)&gBlockRecvBuffer[i];
#endif
                r6 = gBlockRecvBuffer[i][2];
                if (gTasks[gUnknown_020238C5].data[14] + 9 + r6 > 0x1000)
                {
                    gTasks[gUnknown_020238C5].data[12] = gTasks[gUnknown_020238C5].data[14];
                    gTasks[gUnknown_020238C5].data[14] = 0;
                }
                //_0800C402
                dest = EWRAM_15000 + gTasks[gUnknown_020238C5].data[14];
                src = recvBuffer;
                for (j = 0; j < r6 + 8; j++)
                    dest[j] = src[j];
                gTasks[gUnknown_020238C5].data[14] = gTasks[gUnknown_020238C5].data[14] + r6 + 8;
            }
            //_0800C446
        }
    }
}

void sub_800C47C(u8 taskId)
{
    u16 r7;
    u8 r4;
    u8 r2;

    if (gTasks[taskId].data[15] != gTasks[taskId].data[14])
    {
        if (gTasks[taskId].data[15] > gTasks[taskId].data[14]
         && gTasks[taskId].data[15] == gTasks[taskId].data[12])
        {
            gTasks[taskId].data[12] = 0;
            gTasks[taskId].data[15] = 0;
        }
        r4 = unk_2000000[0x15000 + gTasks[taskId].data[15] + 1];
        r7 = unk_2000000[0x15000 + gTasks[taskId].data[15] + 4] | (unk_2000000[0x15000 + gTasks[taskId].data[15] + 5] << 8);
        switch (unk_2000000[0x15000 + gTasks[taskId].data[15] + 0])
        {
        case 0:
            if (gUnknown_02024A64 & gBitTable[r4])
                return;
            memcpy(gUnknown_02023A60[r4], &unk_2000000[0x15000 + gTasks[taskId].data[15] + 8], r7);
            sub_80155A4(r4);
            if (!(gBattleTypeFlags & BATTLE_TYPE_WILD))
            {
                gPlayerMonIndex = unk_2000000[0x15000 + gTasks[taskId].data[15] + 2];
                gEnemyMonIndex = unk_2000000[0x15000 + gTasks[taskId].data[15] + 3];
                gUnknown_02024C0C = unk_2000000[0x15000 + gTasks[taskId].data[15] + 6];
                gUnknown_02024C0A = unk_2000000[0x15000 + gTasks[taskId].data[15] + 7];
            }
            break;
        case 1:
            memcpy(gUnknown_02024260[r4], &unk_2000000[0x15000 + gTasks[taskId].data[15] + 8], r7);
            break;
        case 2:
            r2 = unk_2000000[0x15000 + gTasks[taskId].data[15] + 8];
            gUnknown_02024A64 &= ~(gBitTable[r4] << (r2 * 4));
            break;
        }
        gTasks[taskId].data[15] = gTasks[taskId].data[15] + r7 + 8;
    }
}

void dp01_build_cmdbuf_x00_a_b_0(u8 a, u8 b, u8 c)
{
    gUnknown_03004040[0] = 0;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = 0;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x01_a_b_0(u8 a, u8 b, u8 c)
{
    gUnknown_03004040[0] = 1;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = 0;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x02_a_b_varargs(u8 a, u8 b, u8 c, u8 d, u8 *e)
{
    int i;

    gUnknown_03004040[0] = 2;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    for (i = 0; i < d; i++)
        gUnknown_03004040[3 + i] = *(e++);
    dp01_prepare_buffer(a, gUnknown_03004040, d + 3);
}

void unref_sub_800C6A4(u8 a, u8 b, u8 c, u8 *d)
{
    int i;

    gUnknown_03004040[0] = 3;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    for (i = 0; i < c; i++)
        gUnknown_03004040[3 + i] = *(d++);
    dp01_prepare_buffer(a, gUnknown_03004040, c + 3);
}

void dp01_build_cmdbuf_x04_4_4_4(u8 a)
{
    gUnknown_03004040[0] = 4;
    gUnknown_03004040[1] = 4;
    gUnknown_03004040[2] = 4;
    gUnknown_03004040[3] = 4;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void sub_800C704(u8 a, u8 b, u8 c)
{
    gUnknown_03004040[0] = 5;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = 5;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x06_a(u8 a, u8 b)
{
    gUnknown_03004040[0] = 6;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}

void dp01_build_cmdbuf_x07_7_7_7(u8 a)
{
    gUnknown_03004040[0] = 7;
    gUnknown_03004040[1] = 7;
    gUnknown_03004040[2] = 7;
    gUnknown_03004040[3] = 7;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x08_8_8_8(u8 a)
{
    gUnknown_03004040[0] = 8;
    gUnknown_03004040[1] = 8;
    gUnknown_03004040[2] = 8;
    gUnknown_03004040[3] = 8;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x09_9_9_9(u8 a)
{
    gUnknown_03004040[0] = 9;
    gUnknown_03004040[1] = 9;
    gUnknown_03004040[2] = 9;
    gUnknown_03004040[3] = 9;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x0A_A_A_A(u8 a)
{
    gUnknown_03004040[0] = 10;
    gUnknown_03004040[1] = 10;
    gUnknown_03004040[2] = 10;
    gUnknown_03004040[3] = 10;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x0B_B_B_B(u8 a)
{
    gUnknown_03004040[0] = 11;
    gUnknown_03004040[1] = 11;
    gUnknown_03004040[2] = 11;
    gUnknown_03004040[3] = 11;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x0C_C_C_C(u8 a)
{
    gUnknown_03004040[0] = 12;
    gUnknown_03004040[1] = 12;
    gUnknown_03004040[2] = 12;
    gUnknown_03004040[3] = 12;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x0D_a(u8 a, u8 b)
{
    gUnknown_03004040[0] = 13;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}

void unref_sub_800C828(u8 a, u8 b, u8 *c)
{
    int i;

    gUnknown_03004040[0] = 14;
    gUnknown_03004040[1] = b;
    for (i = 0; i < b * 3; i++)
        gUnknown_03004040[2 + i] = *(c++);
    dp01_prepare_buffer(a, gUnknown_03004040, b * 3 + 2);
}

void dp01_build_cmdbuf_x0F_aa_b_cc_dddd_e_mlc_weather_00_x1Cbytes(u8 a, u16 b, u8 c, u16 d, s32 e, u8 f, u8 *g)
{
    gUnknown_03004040[0] = 15;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0xFF00) >> 8;
    gUnknown_03004040[3] = c;
    gUnknown_03004040[4] = d;
    gUnknown_03004040[5] = (d & 0xFF00) >> 8;
    gUnknown_03004040[6] = e;
    gUnknown_03004040[7] = (e & 0x0000FF00) >> 8;
    gUnknown_03004040[8] = (e & 0x00FF0000) >> 16;
    gUnknown_03004040[9] = (e & 0xFF000000) >> 24;
    gUnknown_03004040[10] = f;
    gUnknown_03004040[11] = gUnknown_02024C0E;
    if (sub_8018324(14, 0, 13, 0, 0) == 0 && sub_8018324(14, 0, 0x4D, 0, 0) == 0)
    {
        gUnknown_03004040[12] = gBattleWeather;
        gUnknown_03004040[13] = (gBattleWeather & 0xFF00) >> 8;
    }
    else
    {
        gUnknown_03004040[12] = 0;
        gUnknown_03004040[13] = 0;
    }
    gUnknown_03004040[14] = 0;
    gUnknown_03004040[15] = 0;
    memcpy(&gUnknown_03004040[16], g, 0x1C);
    dp01_prepare_buffer(a, gUnknown_03004040, 0x2C);
}

#ifdef NONMATCHING
void dp01_build_cmdbuf_x10_TODO(u8 a, u16 b)
{
    int i;
    //u16 *r12;

    gUnknown_03004040[0] = 16;
    gUnknown_03004040[1] = gUnknown_02024D26;
    gUnknown_03004040[2] = b;
    gUnknown_03004040[3] = (b & 0xFF00) >> 8;

    *((u16 *)&gUnknown_03004040[4]) = gUnknown_02024BE6;
    *((u16 *)&gUnknown_03004040[6]) = gUnknown_02024BE8;
    *((u16 *)&gUnknown_03004040[8]) = gUnknown_02024C04;

    gUnknown_03004040[10] = byte_2024C06;
    gUnknown_03004040[11] = unk_2000000[0x16000 + 3];
    gUnknown_03004040[12] = unk_2000000[0x16000 + 0x5E];
    gUnknown_03004040[13] = unk_2000000[0x16000 + 0xC1];
    gUnknown_03004040[14] = gUnknown_02024C0B;
    gUnknown_03004040[15] = gBattleMoves[gUnknown_02024BE6].type;
    for (i = 0; i < 4; i++)
    {
        gUnknown_03004040[16 + i] = gBattleMons[i].ability;
    }
    for (i = 0; i < 16; i++)
    {
        gUnknown_03004040[20 + i] = gUnknown_030041C0[i];
        gUnknown_03004040[36 + i] = gUnknown_03004290[i];
        gUnknown_03004040[52 + i] = gUnknown_030042B0[i];
    }
    dp01_prepare_buffer(a, gUnknown_03004040, 0x44);
}
#else
NAKED
void dp01_build_cmdbuf_x10_TODO(u8 a, u16 b)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    lsls r1, 16\n\
    lsrs r1, 16\n\
    ldr r2, _0800CA2C @ =gUnknown_03004040\n\
    movs r0, 0x10\n\
    strb r0, [r2]\n\
    ldr r0, _0800CA30 @ =gUnknown_02024D26\n\
    ldrb r0, [r0]\n\
    strb r0, [r2, 0x1]\n\
    strb r1, [r2, 0x2]\n\
    lsrs r1, 8\n\
    strb r1, [r2, 0x3]\n\
    adds r0, r2, 0x4\n\
    mov r12, r0\n\
    ldr r4, _0800CA34 @ =gUnknown_02024BE6\n\
    ldrh r0, [r4]\n\
    strh r0, [r2, 0x4]\n\
    ldr r0, _0800CA38 @ =gUnknown_02024BE8\n\
    ldrh r0, [r0]\n\
    mov r1, r12\n\
    strh r0, [r1, 0x2]\n\
    ldr r0, _0800CA3C @ =gUnknown_02024C04\n\
    ldrh r0, [r0]\n\
    strh r0, [r1, 0x4]\n\
    ldr r0, _0800CA40 @ =byte_2024C06\n\
    ldrb r0, [r0]\n\
    strb r0, [r1, 0x6]\n\
    ldr r1, _0800CA44 @ =0x02000000\n\
    ldr r3, _0800CA48 @ =0x00016003\n\
    adds r0, r1, r3\n\
    ldrb r0, [r0]\n\
    mov r7, r12\n\
    strb r0, [r7, 0x7]\n\
    adds r3, 0x5B\n\
    adds r0, r1, r3\n\
    ldrb r0, [r0]\n\
    strb r0, [r7, 0x8]\n\
    ldr r7, _0800CA4C @ =0x000160c1\n\
    adds r1, r7\n\
    ldrb r0, [r1]\n\
    mov r1, r12\n\
    strb r0, [r1, 0x9]\n\
    ldr r0, _0800CA50 @ =gUnknown_02024C0B\n\
    ldrb r0, [r0]\n\
    strb r0, [r1, 0xA]\n\
    ldr r3, _0800CA54 @ =gBattleMoves\n\
    ldrh r1, [r4]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r3\n\
    ldrb r0, [r0, 0x2]\n\
    mov r3, r12\n\
    strb r0, [r3, 0xB]\n\
    movs r3, 0\n\
    mov r9, r2\n\
    ldr r7, _0800CA58 @ =gUnknown_030042B0\n\
    mov r8, r7\n\
    adds r2, 0x10\n\
    ldr r0, _0800CA5C @ =gBattleMons\n\
    adds r4, r0, 0\n\
    adds r4, 0x20\n\
_0800C9D2:\n\
    adds r1, r2, r3\n\
    ldrb r0, [r4]\n\
    strb r0, [r1]\n\
    adds r4, 0x58\n\
    adds r3, 0x1\n\
    cmp r3, 0x3\n\
    ble _0800C9D2\n\
    movs r3, 0\n\
    mov r5, r12\n\
    adds r5, 0x10\n\
    mov r4, r12\n\
    adds r4, 0x20\n\
    ldr r6, _0800CA60 @ =gUnknown_03004290\n\
    mov r2, r12\n\
    adds r2, 0x30\n\
_0800C9F0:\n\
    adds r1, r5, r3\n\
    ldr r7, _0800CA64 @ =gUnknown_030041C0\n\
    adds r0, r3, r7\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    adds r1, r4, r3\n\
    adds r0, r3, r6\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    adds r1, r2, r3\n\
    mov r7, r8\n\
    adds r0, r3, r7\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    adds r3, 0x1\n\
    cmp r3, 0xF\n\
    ble _0800C9F0\n\
    mov r0, r10\n\
    mov r1, r9\n\
    movs r2, 0x44\n\
    bl dp01_prepare_buffer\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0800CA2C: .4byte gUnknown_03004040\n\
_0800CA30: .4byte gUnknown_02024D26\n\
_0800CA34: .4byte gUnknown_02024BE6\n\
_0800CA38: .4byte gUnknown_02024BE8\n\
_0800CA3C: .4byte gUnknown_02024C04\n\
_0800CA40: .4byte byte_2024C06\n\
_0800CA44: .4byte 0x02000000\n\
_0800CA48: .4byte 0x00016003\n\
_0800CA4C: .4byte 0x000160c1\n\
_0800CA50: .4byte gUnknown_02024C0B\n\
_0800CA54: .4byte gBattleMoves\n\
_0800CA58: .4byte gUnknown_030042B0\n\
_0800CA5C: .4byte gBattleMons\n\
_0800CA60: .4byte gUnknown_03004290\n\
_0800CA64: .4byte gUnknown_030041C0\n\
    .syntax divided\n");
}
#endif

NAKED
void dp01_build_cmdbuf_x11_TODO()
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    lsls r1, 16\n\
    lsrs r1, 16\n\
    ldr r2, _0800CB28 @ =gUnknown_03004040\n\
    movs r0, 0x11\n\
    strb r0, [r2]\n\
    strb r0, [r2, 0x1]\n\
    strb r1, [r2, 0x2]\n\
    lsrs r1, 8\n\
    strb r1, [r2, 0x3]\n\
    adds r0, r2, 0x4\n\
    mov r12, r0\n\
    ldr r0, _0800CB2C @ =gUnknown_02024BE6\n\
    ldrh r0, [r0]\n\
    strh r0, [r2, 0x4]\n\
    ldr r0, _0800CB30 @ =gUnknown_02024BE8\n\
    ldrh r0, [r0]\n\
    mov r1, r12\n\
    strh r0, [r1, 0x2]\n\
    ldr r0, _0800CB34 @ =gUnknown_02024C04\n\
    ldrh r0, [r0]\n\
    strh r0, [r1, 0x4]\n\
    ldr r0, _0800CB38 @ =byte_2024C06\n\
    ldrb r0, [r0]\n\
    strb r0, [r1, 0x6]\n\
    ldr r0, _0800CB3C @ =0x02000000\n\
    ldr r3, _0800CB40 @ =0x00016003\n\
    adds r1, r0, r3\n\
    ldrb r1, [r1]\n\
    mov r7, r12\n\
    strb r1, [r7, 0x7]\n\
    ldr r1, _0800CB44 @ =0x0001605e\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    strb r0, [r7, 0x8]\n\
    movs r3, 0\n\
    mov r9, r2\n\
    ldr r7, _0800CB48 @ =gUnknown_030042B0\n\
    mov r8, r7\n\
    mov r4, r9\n\
    adds r4, 0x10\n\
    ldr r0, _0800CB4C @ =gBattleMons\n\
    adds r2, r0, 0\n\
    adds r2, 0x20\n\
_0800CACE:\n\
    adds r1, r4, r3\n\
    ldrb r0, [r2]\n\
    strb r0, [r1]\n\
    adds r2, 0x58\n\
    adds r3, 0x1\n\
    cmp r3, 0x3\n\
    ble _0800CACE\n\
    movs r3, 0\n\
    mov r5, r12\n\
    adds r5, 0x10\n\
    mov r4, r12\n\
    adds r4, 0x20\n\
    ldr r6, _0800CB50 @ =gUnknown_03004290\n\
    mov r2, r12\n\
    adds r2, 0x30\n\
_0800CAEC:\n\
    adds r1, r5, r3\n\
    ldr r7, _0800CB54 @ =gUnknown_030041C0\n\
    adds r0, r3, r7\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    adds r1, r4, r3\n\
    adds r0, r3, r6\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    adds r1, r2, r3\n\
    mov r7, r8\n\
    adds r0, r3, r7\n\
    ldrb r0, [r0]\n\
    strb r0, [r1]\n\
    adds r3, 0x1\n\
    cmp r3, 0xF\n\
    ble _0800CAEC\n\
    mov r0, r10\n\
    mov r1, r9\n\
    movs r2, 0x44\n\
    bl dp01_prepare_buffer\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0800CB28: .4byte gUnknown_03004040\n\
_0800CB2C: .4byte gUnknown_02024BE6\n\
_0800CB30: .4byte gUnknown_02024BE8\n\
_0800CB34: .4byte gUnknown_02024C04\n\
_0800CB38: .4byte byte_2024C06\n\
_0800CB3C: .4byte 0x02000000\n\
_0800CB40: .4byte 0x00016003\n\
_0800CB44: .4byte 0x0001605e\n\
_0800CB48: .4byte gUnknown_030042B0\n\
_0800CB4C: .4byte gBattleMons\n\
_0800CB50: .4byte gUnknown_03004290\n\
_0800CB54: .4byte gUnknown_030041C0\n\
    .syntax divided\n");
}

void dp01_build_cmdbuf_x12_a_bb(u8 a, u8 b, u16 c)
{
    gUnknown_03004040[0] = 18;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = (c & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void unref_sub_800CB84(u8 a, u8 b)
{
    gUnknown_03004040[0] = 19;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}

void sub_800CBA4(u8 a, u8 b, u8 c, u8 *d)
{
    u32 i;

    gUnknown_03004040[0] = 20;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = 0;
    for (i = 0; i < 20; i++)
        gUnknown_03004040[4 + i] = d[i];
    dp01_prepare_buffer(a, gUnknown_03004040, 24);
}

void sub_800CBE0(u8 a, u8 *b)
{
    int i;

    gUnknown_03004040[0] = 21;
    for (i = 0; i < 3; i++)
        gUnknown_03004040[1 + i] = b[i];
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f(u8 a, u8 b, u8 c, u8 d, u8 *e)
{
    int i;

    gUnknown_03004040[0] = 22;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = d;
    for (i = 0; i < 3; i++)
        gUnknown_03004040[4 + i] = e[i];
    dp01_prepare_buffer(a, gUnknown_03004040, 8);  //but only 7 bytes were written
}

void dp01_build_cmdbuf_x17_17_17_17(u8 a)
{
    gUnknown_03004040[0] = 23;
    gUnknown_03004040[1] = 23;
    gUnknown_03004040[2] = 23;
    gUnknown_03004040[3] = 23;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x18_0_aa_health_bar_update(u8 a, s16 b)
{
    gUnknown_03004040[0] = 24;
    gUnknown_03004040[1] = 0;
    gUnknown_03004040[2] = b;
    gUnknown_03004040[3] = (b & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x19_a_bb(u8 a, u8 b, s16 c)
{
    gUnknown_03004040[0] = 25;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = (c & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x1A_aaaa_bbbb(u8 a, u32 b, u32 c)
{
    gUnknown_03004040[0] = 26;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0x0000FF00) >> 8;
    gUnknown_03004040[3] = (b & 0x00FF0000) >> 16;
    gUnknown_03004040[4] = (b & 0xFF000000) >> 24;
    gUnknown_03004040[5] = c;
    gUnknown_03004040[6] = (c & 0x0000FF00) >> 8;
    gUnknown_03004040[7] = (c & 0x00FF0000) >> 16;
    gUnknown_03004040[8] = (c & 0xFF000000) >> 24;
    dp01_prepare_buffer(a, gUnknown_03004040, 9);
}

void dp01_build_cmdbuf_x1B_aaaa_b(u8 a, u8 b, u32 c)
{
    gUnknown_03004040[0] = 27;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = (c & 0x0000FF00) >> 8;
    gUnknown_03004040[4] = (c & 0x00FF0000) >> 16;
    gUnknown_03004040[5] = (c & 0xFF000000) >> 24;
    dp01_prepare_buffer(a, gUnknown_03004040, 6);
}

void dp01_build_cmdbuf_x1C_a(u8 a, u8 b)
{
    gUnknown_03004040[0] = 28;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}

void dp01_build_cmdbuf_x1D_1D_numargs_varargs(u8 a, u16 b, u8 *c)
{
    int i;

    gUnknown_03004040[0] = 29;
    gUnknown_03004040[1] = 29;
    gUnknown_03004040[2] = b;
    gUnknown_03004040[3] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gUnknown_03004040[4 + i] = *(c++);
    dp01_prepare_buffer(a, gUnknown_03004040, b + 4);
}

void unref_sub_800CDD4(u8 a, u32 b, u16 c, u8 *d)
{
    int i;

    gUnknown_03004040[0] = 30;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0x0000FF00) >> 8;
    gUnknown_03004040[3] = (b & 0x00FF0000) >> 16;
    gUnknown_03004040[4] = (b & 0xFF000000) >> 24;
    gUnknown_03004040[5] = c;
    gUnknown_03004040[6] = (c & 0xFF00) >> 8;
    for (i = 0; i < c; i++)
        gUnknown_03004040[7 + i] = *(d++);
    dp01_prepare_buffer(a, gUnknown_03004040, c + 7);
}

void unref_sub_800CE3C(u8 a, u16 b, u8 *c)
{
    int i;

    gUnknown_03004040[0] = 31;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gUnknown_03004040[3 + i] = *(c++);
    dp01_prepare_buffer(a, gUnknown_03004040, b + 3);
}

void unref_sub_800CE84(u8 a, u16 b, u8 *c)
{
    int i;

    gUnknown_03004040[0] = 32;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gUnknown_03004040[3 + i] = *(c++);
    dp01_prepare_buffer(a, gUnknown_03004040, b + 3);
}

void dp01_build_cmdbuf_x21_a_bb(u8 a, u8 b, u16 c)
{
    gUnknown_03004040[0] = 33;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = (c & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x22_a_three_bytes(u8 a, u8 b, u8 *c)
{
    int i;

    gUnknown_03004040[0] = 34;
    gUnknown_03004040[1] = b;
    for (i = 0; i < 3; i++)
        gUnknown_03004040[2 + i] = c[i];
    dp01_prepare_buffer(a, gUnknown_03004040, 5);
}

void dp01_build_cmdbuf_x23_aa_0(u8 a, u16 b)
{
    gUnknown_03004040[0] = 35;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0xFF00) >> 8;
    gUnknown_03004040[3] = 0;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x24_aa_0(u8 a, u16 b)
{
    gUnknown_03004040[0] = 36;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0xFF00) >> 8;
    gUnknown_03004040[3] = 0;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x25_25_25_25(u8 a)
{
    gUnknown_03004040[0] = 37;
    gUnknown_03004040[1] = 37;
    gUnknown_03004040[2] = 37;
    gUnknown_03004040[3] = 37;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x26_a(u8 a, u8 b)
{
    gUnknown_03004040[0] = 38;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}

void dp01_build_cmdbuf_x27_27_27_27(u8 a)
{
    gUnknown_03004040[0] = 39;
    gUnknown_03004040[1] = 39;
    gUnknown_03004040[2] = 39;
    gUnknown_03004040[3] = 39;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x28_28_28_28(u8 a)
{
    gUnknown_03004040[0] = 40;
    gUnknown_03004040[1] = 40;
    gUnknown_03004040[2] = 40;
    gUnknown_03004040[3] = 40;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x29_29_29_29(u8 a)
{
    gUnknown_03004040[0] = 41;
    gUnknown_03004040[1] = 41;
    gUnknown_03004040[2] = 41;
    gUnknown_03004040[3] = 41;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x2A_2A_2A_2A(u8 a)
{
    gUnknown_03004040[0] = 42;
    gUnknown_03004040[1] = 42;
    gUnknown_03004040[2] = 42;
    gUnknown_03004040[3] = 42;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x2B_aa_0(u8 a, u16 b)
{
    gUnknown_03004040[0] = 43;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0xFF00) >> 8;
    gUnknown_03004040[3] = 0;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void sub_800D074(u8 a, u16 b)
{
    gUnknown_03004040[0] = 44;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = (b & 0xFF00) >> 8;
    gUnknown_03004040[3] = 0;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x2D_2D_2D_2D(u8 a)
{
    gUnknown_03004040[0] = 45;
    gUnknown_03004040[1] = 45;
    gUnknown_03004040[2] = 45;
    gUnknown_03004040[3] = 45;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x2E_a(u8 a, u8 b)
{
    gUnknown_03004040[0] = 46;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}

void dp01_build_cmdbuf_x2F_2F_2F_2F(u8 a)
{
    gUnknown_03004040[0] = 47;
    gUnknown_03004040[1] = 47;
    gUnknown_03004040[2] = 47;
    gUnknown_03004040[3] = 47;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x30_TODO(u8 a, u8 *b, u8 c)
{
    int i;

    gUnknown_03004040[0] = 48;
    gUnknown_03004040[1] = c & 0x7F;
    gUnknown_03004040[2] = (c & 0x80) >> 7;
    gUnknown_03004040[3] = 48;
    for (i = 0; i < 48; i++)
        gUnknown_03004040[4 + i] = b[i];
    dp01_prepare_buffer(a, gUnknown_03004040, 52);
}

void dp01_build_cmdbuf_x31_31_31_31(u8 a)
{
    gUnknown_03004040[0] = 49;
    gUnknown_03004040[1] = 49;
    gUnknown_03004040[2] = 49;
    gUnknown_03004040[3] = 49;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x32_32_32_32(u8 a)
{
    gUnknown_03004040[0] = 50;
    gUnknown_03004040[1] = 50;
    gUnknown_03004040[2] = 50;
    gUnknown_03004040[3] = 50;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x33_a_33_33(u8 a, u8 b)
{
    gUnknown_03004040[0] = 51;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = 51;
    gUnknown_03004040[3] = 51;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void dp01_build_cmdbuf_x34_a_bb_aka_battle_anim(u8 a, u8 b, u16 c)
{
    gUnknown_03004040[0] = 52;
    gUnknown_03004040[1] = b;
    gUnknown_03004040[2] = c;
    gUnknown_03004040[3] = (c & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gUnknown_03004040, 4);
}

void sub_800D1D8(u8 a, u8 b)
{
    gUnknown_03004040[0] = 53;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}

void dp01_build_cmdbuf_x38_a(u8 a, u8 b)
{
    gUnknown_03004040[0] = 54;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}

void dp01_build_cmdbuf_x37_a(u8 a, u8 b)
{
    gUnknown_03004040[0] = 55;
    gUnknown_03004040[1] = b;
    dp01_prepare_buffer(a, gUnknown_03004040, 2);
}
