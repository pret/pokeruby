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

extern u16 gBattleTypeFlags;

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
extern u8 gUnknown_02024C07;
extern u8 gUnknown_02024C08;
extern u8 gUnknown_02024C0A;
extern u8 gUnknown_02024C0C;
extern u8 gUnknown_02024C78;
extern u8 gUnknown_02024E60[];
extern u8 gUnknown_02024E64[];
extern void (*gUnknown_030042D4)(void);
extern void (*gUnknown_03004330[])(void);

extern void sub_800BF28(void);
extern void sub_8083C50(u8);
extern void nullsub_41(void);
extern void nullsub_91(void);
extern void battle_anim_clear_some_data(void);
extern void sub_8040710(void);
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

void sub_800B858(void)
{
    if (gBattleTypeFlags & 2)
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
    sub_8040710();
    BattleAI_HandleItemUseBeforeAISetup();
    if (gBattleTypeFlags & 0x10)
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
    
    if (gBattleTypeFlags & 2)
        sub_800BA78();
    else
        sub_800B9A8();
    sub_800BD54();
    if (!(gBattleTypeFlags & 0x40))
    {
        for (i = 0; i < gUnknown_02024A68; i++)
            sub_8094978(i, 0);
    }
}

void sub_800B9A8(void)
{
    if (!(gBattleTypeFlags & 1))
    {
        gUnknown_030042D4 = sub_8010800;
        if (gBattleTypeFlags & 0x80)
            gUnknown_03004330[0] = sub_812B468;
        else if (gBattleTypeFlags & 0x200)
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
    if ((gBattleTypeFlags & (BATTLE_TYPE_40 | BATTLE_TYPE_DOUBLE)) == BATTLE_TYPE_DOUBLE)
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
    
    if (!(gBattleTypeFlags & BATTLE_TYPE_40))
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
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != 0x19C
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
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != 0x19C
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
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES) != 0  //Why is this one not SPECIES2 like the rest?
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != 0x19C
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
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != 0x19C
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
    
    if (gBattleTypeFlags & 2)
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
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14002] = gUnknown_02024C07;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14003] = gUnknown_02024C08;
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
