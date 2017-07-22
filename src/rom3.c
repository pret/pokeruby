#include "global.h"
#include "rom3.h"
#include "battle.h"
#include "battle_811DA74.h"
#include "battle_ai.h"
#include "battle_anim.h"
#include "battle_anim_81258BC.h"
#include "battle_anim_8137220.h"
#include "cable_club.h"
#include "items.h"
#include "link.h"
#include "pokemon.h"
#include "rom_8094928.h"
#include "species.h"
#include "task.h"
#include "util.h"

extern u8 unk_2000000[];

#define EWRAM_14000 ((u8 *)(unk_2000000 + 0x14000))
#define EWRAM_15000 ((u8 *)(unk_2000000 + 0x15000))

extern u16 gBattleTypeFlags;
extern u16 gBattleWeather;
extern struct BattlePokemon gBattleMons[];

static EWRAM_DATA u8 gUnknown_020238C4 = 0;
static EWRAM_DATA u8 gUnknown_020238C5 = 0;
static EWRAM_DATA u8 gUnknown_020238C6 = 0;

extern u32 gUnknown_020239FC;
extern u8 gBattleBufferA[][0x200];
extern u8 gBattleBufferB[][0x200];
extern u8 gActiveBank;
extern u32 gBattleExecBuffer;
extern u8 gNoOfAllBanks;
extern u16 gBattlePartyID[];
extern u8 gBanksBySide[];
extern u16 gCurrentMove;
extern u16 gUnknown_02024BE8;
extern u16 gLastUsedItem;
extern u8 gLastUsedAbility;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gEffectBank;
extern u8 gStringBank;
extern u8 gAbsentBankFlags;
extern u8 gMultiHitCounter;
extern u8 gUnknown_02024C78;
extern u8 gBattleOutcome;
extern u8 gActionSelectionCursor[];
extern u8 gMoveSelectionCursor[];
extern u8 gBattleTextBuff1[];
extern u8 gBattleTextBuff2[];
extern u8 gBattleTextBuff3[];
extern void (*gBattleMainFunc)(void);
extern void (*gBattleBankFunc[])(void);

u8 gBattleBuffersTransferData[0x170];

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

    gBattleMainFunc = nullsub_41;
    for (i = 0; i < 4; i++)
    {
        gBattleBankFunc[i] = nullsub_91;
        gBanksBySide[i] = 0xFF;
        gActionSelectionCursor[i] = 0;
        gMoveSelectionCursor[i] = 0;
    }
    sub_800B858();
    gBattleExecBuffer = 0;
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
        for (i = 0; i < gNoOfAllBanks; i++)
            sub_8094978(i, 0);
    }
}

void sub_800B9A8(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        gBattleMainFunc = sub_8010800;
        if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
            gBattleBankFunc[0] = SetBankFuncToSafariBufferRunCommand;
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL)
            gBattleBankFunc[0] = SetBankFuncToWallyBufferRunCommand;
        else
            gBattleBankFunc[0] = SetBankFuncToPlayerBufferRunCommand;
        gBanksBySide[0] = 0;
        gBattleBankFunc[1] = SetBankFuncToOpponentBufferRunCommand;
        gBanksBySide[1] = 1;
        gNoOfAllBanks = 2;
    }
    else
    {
        gBattleMainFunc = sub_8010800;
        gBattleBankFunc[0] = SetBankFuncToPlayerBufferRunCommand;
        gBanksBySide[0] = 0;
        gBattleBankFunc[1] = SetBankFuncToOpponentBufferRunCommand;
        gBanksBySide[1] = 1;
        gBattleBankFunc[2] = SetBankFuncToPlayerBufferRunCommand;
        gBanksBySide[2] = 2;
        gBattleBankFunc[3] = SetBankFuncToOpponentBufferRunCommand;
        gBanksBySide[3] = 3;
        gNoOfAllBanks = 4;
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
            gBattleMainFunc = sub_8010800;
            gBattleBankFunc[0] = SetBankFuncToPlayerBufferRunCommand;
            gBanksBySide[0] = 0;
            gBattleBankFunc[1] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBanksBySide[1] = 1;
            gNoOfAllBanks = 2;
        }
        else
        {
            gBattleBankFunc[1] = SetBankFuncToPlayerBufferRunCommand;
            gBanksBySide[1] = 0;
            gBattleBankFunc[0] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBanksBySide[0] = 1;
            gNoOfAllBanks = 2;
        }
        return;
    }
    if ((gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_DOUBLE)) == BATTLE_TYPE_DOUBLE)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_WILD)
        {
            gBattleMainFunc = sub_8010800;
            gBattleBankFunc[0] = SetBankFuncToPlayerBufferRunCommand;
            gBanksBySide[0] = 0;
            gBattleBankFunc[1] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBanksBySide[1] = 1;
            gBattleBankFunc[2] = SetBankFuncToPlayerBufferRunCommand;
            gBanksBySide[2] = 2;
            gBattleBankFunc[3] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBanksBySide[3] = 3;
            gNoOfAllBanks = 4;
        }
        else
        {
            gBattleBankFunc[1] = SetBankFuncToPlayerBufferRunCommand;
            gBanksBySide[1] = 0;
            gBattleBankFunc[0] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBanksBySide[0] = 1;
            gBattleBankFunc[3] = SetBankFuncToPlayerBufferRunCommand;
            gBanksBySide[3] = 2;
            gBattleBankFunc[2] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBanksBySide[2] = 3;
            gNoOfAllBanks = 4;

        }
        return;
    }
    multiplayerId = GetMultiplayerId();
    if (gBattleTypeFlags & BATTLE_TYPE_WILD)
        gBattleMainFunc = sub_8010800;
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
            gBattleBankFunc[gLinkPlayers[i].lp_field_18] = SetBankFuncToPlayerBufferRunCommand;
            switch (gLinkPlayers[i].lp_field_18)
            {
            case 0:
            case 3:
                gBanksBySide[gLinkPlayers[i].lp_field_18] = 0;
                gBattlePartyID[gLinkPlayers[i].lp_field_18] = 0;
                break;
            case 1:
            case 2:
                gBanksBySide[gLinkPlayers[i].lp_field_18] = 2;
                gBattlePartyID[gLinkPlayers[i].lp_field_18] = 3;
                break;
            }
        }
        else
        {
            if ((!(gLinkPlayers[i].lp_field_18 & 1) && !(gLinkPlayers[multiplayerId].lp_field_18 & 1))
             || ((gLinkPlayers[i].lp_field_18 & 1) && (gLinkPlayers[multiplayerId].lp_field_18 & 1)))
            {
                gBattleBankFunc[gLinkPlayers[i].lp_field_18] = SetBankFuncToLinkPartnerBufferRunCommand;
                switch (gLinkPlayers[i].lp_field_18)
                {
                case 0:
                case 3:
                    gBanksBySide[gLinkPlayers[i].lp_field_18] = 0;
                    gBattlePartyID[gLinkPlayers[i].lp_field_18] = 0;
                    break;
                case 1:
                case 2:
                    gBanksBySide[gLinkPlayers[i].lp_field_18] = 2;
                    gBattlePartyID[gLinkPlayers[i].lp_field_18] = 3;
                    break;
                }
            }
            else
            {
                gBattleBankFunc[gLinkPlayers[i].lp_field_18] = SetBankFuncToLinkOpponentBufferRunCommand;
                switch (gLinkPlayers[i].lp_field_18)
                {
                case 0:
                case 3:
                    gBanksBySide[gLinkPlayers[i].lp_field_18] = 1;
                    gBattlePartyID[gLinkPlayers[i].lp_field_18] = 0;
                    break;
                case 1:
                case 2:
                    gBanksBySide[gLinkPlayers[i].lp_field_18] = 3;
                    gBattlePartyID[gLinkPlayers[i].lp_field_18] = 3;
                    break;
                }
            }
        }
    }
    gNoOfAllBanks = 4;
}

void sub_800BD54(void)
{
    int i;
    int j;

    if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        for (i = 0; i < gNoOfAllBanks; i++)
        {
            for (j = 0; j < 6; j++)
            {
                if (i < 2)
                {
                    if (!(gBanksBySide[i] & 1))
                    {
                        if (GetMonData(&gPlayerParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != 0
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != SPECIES_EGG
                         && GetMonData(&gPlayerParty[j], MON_DATA_IS_EGG) == 0)
                        {
                            gBattlePartyID[i] = j;
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
                            gBattlePartyID[i] = j;
                            break;
                        }
                    }
                }
                else
                {
                    if (!(gBanksBySide[i] & 1))
                    {
                        if (GetMonData(&gPlayerParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES) != 0  //Probably a typo by Game Freak. The rest use SPECIES2
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != SPECIES_EGG
                         && GetMonData(&gPlayerParty[j], MON_DATA_IS_EGG) == 0
                         && gBattlePartyID[i - 2] != j)
                        {
                            gBattlePartyID[i] = j;
                            break;
                        }
                    }
                    else
                    {
                        if (GetMonData(&gEnemyParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != 0
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != SPECIES_EGG
                         && GetMonData(&gEnemyParty[j], MON_DATA_IS_EGG) == 0
                         && gBattlePartyID[i - 2] != j)
                        {
                            gBattlePartyID[i] = j;
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
                gBattleBufferA[gActiveBank][i] = *b;
                b++;
            }
            break;
        case 1:
            for (i = 0; i < c; i++)
            {
                gBattleBufferB[gActiveBank][i] = *b;
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
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14001] = gActiveBank;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14002] = gBankAttacker;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14003] = gBankTarget;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14004] = r9;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14005] = (r9 & 0x0000FF00) >> 8;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14006] = gAbsentBankFlags;
    unk_2000000[gTasks[gUnknown_020238C4].data[14] + 0x14007] = gEffectBank;
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
            if (gBattleExecBuffer & gBitTable[r4])
                return;
            memcpy(gBattleBufferA[r4], &unk_2000000[0x15000 + gTasks[taskId].data[15] + 8], r7);
            sub_80155A4(r4);
            if (!(gBattleTypeFlags & BATTLE_TYPE_WILD))
            {
                gBankAttacker = unk_2000000[0x15000 + gTasks[taskId].data[15] + 2];
                gBankTarget = unk_2000000[0x15000 + gTasks[taskId].data[15] + 3];
                gAbsentBankFlags = unk_2000000[0x15000 + gTasks[taskId].data[15] + 6];
                gEffectBank = unk_2000000[0x15000 + gTasks[taskId].data[15] + 7];
            }
            break;
        case 1:
            memcpy(gBattleBufferB[r4], &unk_2000000[0x15000 + gTasks[taskId].data[15] + 8], r7);
            break;
        case 2:
            r2 = unk_2000000[0x15000 + gTasks[taskId].data[15] + 8];
            gBattleExecBuffer &= ~(gBitTable[r4] << (r2 * 4));
            break;
        }
        gTasks[taskId].data[15] = gTasks[taskId].data[15] + r7 + 8;
    }
}

void EmitGetAttributes(u8 a, u8 b, u8 c)
{
    gBattleBuffersTransferData[0] = 0;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = 0;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x01_a_b_0(u8 a, u8 b, u8 c)
{
    gBattleBuffersTransferData[0] = 1;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = 0;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitSetAttributes(u8 a, u8 b, u8 c, u8 d, void *e)
{
    int i;

    gBattleBuffersTransferData[0] = 2;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    for (i = 0; i < d; i++)
        gBattleBuffersTransferData[3 + i] = *(u8*)(e++);
    dp01_prepare_buffer(a, gBattleBuffersTransferData, d + 3);
}

void unref_sub_800C6A4(u8 a, u8 b, u8 c, u8 *d)
{
    int i;

    gBattleBuffersTransferData[0] = 3;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    for (i = 0; i < c; i++)
        gBattleBuffersTransferData[3 + i] = *(d++);
    dp01_prepare_buffer(a, gBattleBuffersTransferData, c + 3);
}

void dp01_build_cmdbuf_x04_4_4_4(u8 a)
{
    gBattleBuffersTransferData[0] = 4;
    gBattleBuffersTransferData[1] = 4;
    gBattleBuffersTransferData[2] = 4;
    gBattleBuffersTransferData[3] = 4;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitSwitchInAnim(u8 a, u8 b, u8 c)
{
    gBattleBuffersTransferData[0] = 5;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = 5;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitReturnPokeToBall(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 6;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}

void dp01_build_cmdbuf_x07_7_7_7(u8 a)
{
    gBattleBuffersTransferData[0] = 7;
    gBattleBuffersTransferData[1] = 7;
    gBattleBuffersTransferData[2] = 7;
    gBattleBuffersTransferData[3] = 7;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitTrainerSlide(u8 a)
{
    gBattleBuffersTransferData[0] = 8;
    gBattleBuffersTransferData[1] = 8;
    gBattleBuffersTransferData[2] = 8;
    gBattleBuffersTransferData[3] = 8;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x09_9_9_9(u8 a)
{
    gBattleBuffersTransferData[0] = 9;
    gBattleBuffersTransferData[1] = 9;
    gBattleBuffersTransferData[2] = 9;
    gBattleBuffersTransferData[3] = 9;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitFaintAnimation(u8 a)
{
    gBattleBuffersTransferData[0] = 10;
    gBattleBuffersTransferData[1] = 10;
    gBattleBuffersTransferData[2] = 10;
    gBattleBuffersTransferData[3] = 10;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x0B_B_B_B(u8 a)
{
    gBattleBuffersTransferData[0] = 11;
    gBattleBuffersTransferData[1] = 11;
    gBattleBuffersTransferData[2] = 11;
    gBattleBuffersTransferData[3] = 11;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x0C_C_C_C(u8 a)
{
    gBattleBuffersTransferData[0] = 12;
    gBattleBuffersTransferData[1] = 12;
    gBattleBuffersTransferData[2] = 12;
    gBattleBuffersTransferData[3] = 12;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitBallThrowAnim(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 13;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}

void unref_sub_800C828(u8 a, u8 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 14;
    gBattleBuffersTransferData[1] = b;
    for (i = 0; i < b * 3; i++)
        gBattleBuffersTransferData[2 + i] = *(c++);
    dp01_prepare_buffer(a, gBattleBuffersTransferData, b * 3 + 2);
}

void EmitMoveAnimation(u8 a, u16 b, u8 c, u16 d, s32 e, u8 f, u8 *g)
{
    gBattleBuffersTransferData[0] = 15;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = c;
    gBattleBuffersTransferData[4] = d;
    gBattleBuffersTransferData[5] = (d & 0xFF00) >> 8;
    gBattleBuffersTransferData[6] = e;
    gBattleBuffersTransferData[7] = (e & 0x0000FF00) >> 8;
    gBattleBuffersTransferData[8] = (e & 0x00FF0000) >> 16;
    gBattleBuffersTransferData[9] = (e & 0xFF000000) >> 24;
    gBattleBuffersTransferData[10] = f;
    gBattleBuffersTransferData[11] = gMultiHitCounter;
    if (AbilityBattleEffects(14, 0, 13, 0, 0) == 0 && AbilityBattleEffects(14, 0, 0x4D, 0, 0) == 0)
    {
        gBattleBuffersTransferData[12] = gBattleWeather;
        gBattleBuffersTransferData[13] = (gBattleWeather & 0xFF00) >> 8;
    }
    else
    {
        gBattleBuffersTransferData[12] = 0;
        gBattleBuffersTransferData[13] = 0;
    }
    gBattleBuffersTransferData[14] = 0;
    gBattleBuffersTransferData[15] = 0;
    memcpy(&gBattleBuffersTransferData[16], g, 0x1C);
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 0x2C);
}

#ifdef NONMATCHING
void EmitPrintString(u8 a, u16 b)
{
    int i;
    //u16 *r12;

    gBattleBuffersTransferData[0] = 16;
    gBattleBuffersTransferData[1] = gBattleOutcome;
    gBattleBuffersTransferData[2] = b;
    gBattleBuffersTransferData[3] = (b & 0xFF00) >> 8;

    *((u16 *)&gBattleBuffersTransferData[4]) = gCurrentMove;
    *((u16 *)&gBattleBuffersTransferData[6]) = gUnknown_02024BE8;
    *((u16 *)&gBattleBuffersTransferData[8]) = gLastUsedItem;

    gBattleBuffersTransferData[10] = gLastUsedAbility;
    gBattleBuffersTransferData[11] = unk_2000000[0x16000 + 3];
    gBattleBuffersTransferData[12] = unk_2000000[0x16000 + 0x5E];
    gBattleBuffersTransferData[13] = unk_2000000[0x16000 + 0xC1];
    gBattleBuffersTransferData[14] = gStringBank;
    gBattleBuffersTransferData[15] = gBattleMoves[gCurrentMove].type;
    for (i = 0; i < 4; i++)
    {
        gBattleBuffersTransferData[16 + i] = gBattleMons[i].ability;
    }
    for (i = 0; i < 16; i++)
    {
        gBattleBuffersTransferData[20 + i] = gBattleTextBuff1[i];
        gBattleBuffersTransferData[36 + i] = gBattleTextBuff2[i];
        gBattleBuffersTransferData[52 + i] = gBattleTextBuff3[i];
    }
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 0x44);
}
#else
__attribute__((naked))
void EmitPrintString(u8 a, u16 b)
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
    ldr r2, _0800CA2C @ =gBattleBuffersTransferData\n\
    movs r0, 0x10\n\
    strb r0, [r2]\n\
    ldr r0, _0800CA30 @ =gBattleOutcome\n\
    ldrb r0, [r0]\n\
    strb r0, [r2, 0x1]\n\
    strb r1, [r2, 0x2]\n\
    lsrs r1, 8\n\
    strb r1, [r2, 0x3]\n\
    adds r0, r2, 0x4\n\
    mov r12, r0\n\
    ldr r4, _0800CA34 @ =gCurrentMove\n\
    ldrh r0, [r4]\n\
    strh r0, [r2, 0x4]\n\
    ldr r0, _0800CA38 @ =gUnknown_02024BE8\n\
    ldrh r0, [r0]\n\
    mov r1, r12\n\
    strh r0, [r1, 0x2]\n\
    ldr r0, _0800CA3C @ =gLastUsedItem\n\
    ldrh r0, [r0]\n\
    strh r0, [r1, 0x4]\n\
    ldr r0, _0800CA40 @ =gLastUsedAbility\n\
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
    ldr r0, _0800CA50 @ =gStringBank\n\
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
    ldr r7, _0800CA58 @ =gBattleTextBuff3\n\
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
    ldr r6, _0800CA60 @ =gBattleTextBuff2\n\
    mov r2, r12\n\
    adds r2, 0x30\n\
_0800C9F0:\n\
    adds r1, r5, r3\n\
    ldr r7, _0800CA64 @ =gBattleTextBuff1\n\
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
_0800CA2C: .4byte gBattleBuffersTransferData\n\
_0800CA30: .4byte gBattleOutcome\n\
_0800CA34: .4byte gCurrentMove\n\
_0800CA38: .4byte gUnknown_02024BE8\n\
_0800CA3C: .4byte gLastUsedItem\n\
_0800CA40: .4byte gLastUsedAbility\n\
_0800CA44: .4byte 0x02000000\n\
_0800CA48: .4byte 0x00016003\n\
_0800CA4C: .4byte 0x000160c1\n\
_0800CA50: .4byte gStringBank\n\
_0800CA54: .4byte gBattleMoves\n\
_0800CA58: .4byte gBattleTextBuff3\n\
_0800CA5C: .4byte gBattleMons\n\
_0800CA60: .4byte gBattleTextBuff2\n\
_0800CA64: .4byte gBattleTextBuff1\n\
    .syntax divided\n");
}
#endif

__attribute__((naked))
void EmitPrintStringPlayerOnly()
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
    ldr r2, _0800CB28 @ =gBattleBuffersTransferData\n\
    movs r0, 0x11\n\
    strb r0, [r2]\n\
    strb r0, [r2, 0x1]\n\
    strb r1, [r2, 0x2]\n\
    lsrs r1, 8\n\
    strb r1, [r2, 0x3]\n\
    adds r0, r2, 0x4\n\
    mov r12, r0\n\
    ldr r0, _0800CB2C @ =gCurrentMove\n\
    ldrh r0, [r0]\n\
    strh r0, [r2, 0x4]\n\
    ldr r0, _0800CB30 @ =gUnknown_02024BE8\n\
    ldrh r0, [r0]\n\
    mov r1, r12\n\
    strh r0, [r1, 0x2]\n\
    ldr r0, _0800CB34 @ =gLastUsedItem\n\
    ldrh r0, [r0]\n\
    strh r0, [r1, 0x4]\n\
    ldr r0, _0800CB38 @ =gLastUsedAbility\n\
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
    ldr r7, _0800CB48 @ =gBattleTextBuff3\n\
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
    ldr r6, _0800CB50 @ =gBattleTextBuff2\n\
    mov r2, r12\n\
    adds r2, 0x30\n\
_0800CAEC:\n\
    adds r1, r5, r3\n\
    ldr r7, _0800CB54 @ =gBattleTextBuff1\n\
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
_0800CB28: .4byte gBattleBuffersTransferData\n\
_0800CB2C: .4byte gCurrentMove\n\
_0800CB30: .4byte gUnknown_02024BE8\n\
_0800CB34: .4byte gLastUsedItem\n\
_0800CB38: .4byte gLastUsedAbility\n\
_0800CB3C: .4byte 0x02000000\n\
_0800CB40: .4byte 0x00016003\n\
_0800CB44: .4byte 0x0001605e\n\
_0800CB48: .4byte gBattleTextBuff3\n\
_0800CB4C: .4byte gBattleMons\n\
_0800CB50: .4byte gBattleTextBuff2\n\
_0800CB54: .4byte gBattleTextBuff1\n\
    .syntax divided\n");
}

void dp01_build_cmdbuf_x12_a_bb(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 18;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void unref_sub_800CB84(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 19;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}

void sub_800CBA4(u8 a, u8 b, u8 c, u8 *d)
{
    u32 i;

    gBattleBuffersTransferData[0] = 20;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = 0;
    for (i = 0; i < 20; i++)
        gBattleBuffersTransferData[4 + i] = d[i];
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 24);
}

void sub_800CBE0(u8 a, u8 *b)
{
    int i;

    gBattleBuffersTransferData[0] = 21;
    for (i = 0; i < 3; i++)
        gBattleBuffersTransferData[1 + i] = b[i];
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e)
{
    int i;

    gBattleBuffersTransferData[0] = 22;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = d;
    for (i = 0; i < 3; i++)
        gBattleBuffersTransferData[4 + i] = e[i];
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 8);  //but only 7 bytes were written
}

void dp01_build_cmdbuf_x17_17_17_17(u8 a)
{
    gBattleBuffersTransferData[0] = 23;
    gBattleBuffersTransferData[1] = 23;
    gBattleBuffersTransferData[2] = 23;
    gBattleBuffersTransferData[3] = 23;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitHealthBarUpdate(u8 a, s16 b)
{
    gBattleBuffersTransferData[0] = 24;
    gBattleBuffersTransferData[1] = 0;
    gBattleBuffersTransferData[2] = b;
    gBattleBuffersTransferData[3] = (b & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitExpBarUpdate(u8 a, u8 b, s16 c)
{
    gBattleBuffersTransferData[0] = 25;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitStatusIconUpdate(u8 a, u32 b, u32 c)
{
    gBattleBuffersTransferData[0] = 26;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0x0000FF00) >> 8;
    gBattleBuffersTransferData[3] = (b & 0x00FF0000) >> 16;
    gBattleBuffersTransferData[4] = (b & 0xFF000000) >> 24;
    gBattleBuffersTransferData[5] = c;
    gBattleBuffersTransferData[6] = (c & 0x0000FF00) >> 8;
    gBattleBuffersTransferData[7] = (c & 0x00FF0000) >> 16;
    gBattleBuffersTransferData[8] = (c & 0xFF000000) >> 24;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 9);
}

void EmitStatusAnimation(u8 a, u8 b, u32 c)
{
    gBattleBuffersTransferData[0] = 27;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0x0000FF00) >> 8;
    gBattleBuffersTransferData[4] = (c & 0x00FF0000) >> 16;
    gBattleBuffersTransferData[5] = (c & 0xFF000000) >> 24;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 6);
}

void EmitStatusXor(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 28;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}

void dp01_build_cmdbuf_x1D_1D_numargs_varargs(u8 a, u16 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 29;
    gBattleBuffersTransferData[1] = 29;
    gBattleBuffersTransferData[2] = b;
    gBattleBuffersTransferData[3] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gBattleBuffersTransferData[4 + i] = *(c++);
    dp01_prepare_buffer(a, gBattleBuffersTransferData, b + 4);
}

void unref_sub_800CDD4(u8 a, u32 b, u16 c, u8 *d)
{
    int i;

    gBattleBuffersTransferData[0] = 30;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0x0000FF00) >> 8;
    gBattleBuffersTransferData[3] = (b & 0x00FF0000) >> 16;
    gBattleBuffersTransferData[4] = (b & 0xFF000000) >> 24;
    gBattleBuffersTransferData[5] = c;
    gBattleBuffersTransferData[6] = (c & 0xFF00) >> 8;
    for (i = 0; i < c; i++)
        gBattleBuffersTransferData[7 + i] = *(d++);
    dp01_prepare_buffer(a, gBattleBuffersTransferData, c + 7);
}

void unref_sub_800CE3C(u8 a, u16 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 31;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gBattleBuffersTransferData[3 + i] = *(c++);
    dp01_prepare_buffer(a, gBattleBuffersTransferData, b + 3);
}

void unref_sub_800CE84(u8 a, u16 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 32;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gBattleBuffersTransferData[3 + i] = *(c++);
    dp01_prepare_buffer(a, gBattleBuffersTransferData, b + 3);
}

void dp01_build_cmdbuf_x21_a_bb(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 33;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x22_a_three_bytes(u8 a, u8 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 34;
    gBattleBuffersTransferData[1] = b;
    for (i = 0; i < 3; i++)
        gBattleBuffersTransferData[2 + i] = c[i];
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 5);
}

void dp01_build_cmdbuf_x23_aa_0(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 35;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x24_aa_0(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 36;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x25_25_25_25(u8 a)
{
    gBattleBuffersTransferData[0] = 37;
    gBattleBuffersTransferData[1] = 37;
    gBattleBuffersTransferData[2] = 37;
    gBattleBuffersTransferData[3] = 37;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x26_a(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 38;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}

void dp01_build_cmdbuf_x27_27_27_27(u8 a)
{
    gBattleBuffersTransferData[0] = 39;
    gBattleBuffersTransferData[1] = 39;
    gBattleBuffersTransferData[2] = 39;
    gBattleBuffersTransferData[3] = 39;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x28_28_28_28(u8 a)
{
    gBattleBuffersTransferData[0] = 40;
    gBattleBuffersTransferData[1] = 40;
    gBattleBuffersTransferData[2] = 40;
    gBattleBuffersTransferData[3] = 40;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitHitAnimation(u8 a)
{
    gBattleBuffersTransferData[0] = 41;
    gBattleBuffersTransferData[1] = 41;
    gBattleBuffersTransferData[2] = 41;
    gBattleBuffersTransferData[3] = 41;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x2A_2A_2A_2A(u8 a)
{
    gBattleBuffersTransferData[0] = 42;
    gBattleBuffersTransferData[1] = 42;
    gBattleBuffersTransferData[2] = 42;
    gBattleBuffersTransferData[3] = 42;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitEffectivenessSound(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 43;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitPlaySound(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 44;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitFaintingCry(u8 a)
{
    gBattleBuffersTransferData[0] = 45;
    gBattleBuffersTransferData[1] = 45;
    gBattleBuffersTransferData[2] = 45;
    gBattleBuffersTransferData[3] = 45;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitBattleIntroSlide(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 46;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}

void dp01_build_cmdbuf_x2F_2F_2F_2F(u8 a)
{
    gBattleBuffersTransferData[0] = 47;
    gBattleBuffersTransferData[1] = 47;
    gBattleBuffersTransferData[2] = 47;
    gBattleBuffersTransferData[3] = 47;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x30_TODO(u8 a, u8 *b, u8 c)
{
    int i;

    gBattleBuffersTransferData[0] = 48;
    gBattleBuffersTransferData[1] = c & 0x7F;
    gBattleBuffersTransferData[2] = (c & 0x80) >> 7;
    gBattleBuffersTransferData[3] = 48;
    for (i = 0; i < 48; i++)
        gBattleBuffersTransferData[4 + i] = b[i];
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 52);
}

void dp01_build_cmdbuf_x31_31_31_31(u8 a)
{
    gBattleBuffersTransferData[0] = 49;
    gBattleBuffersTransferData[1] = 49;
    gBattleBuffersTransferData[2] = 49;
    gBattleBuffersTransferData[3] = 49;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void dp01_build_cmdbuf_x32_32_32_32(u8 a)
{
    gBattleBuffersTransferData[0] = 50;
    gBattleBuffersTransferData[1] = 50;
    gBattleBuffersTransferData[2] = 50;
    gBattleBuffersTransferData[3] = 50;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitSpriteInvisibility(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 51;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = 51;
    gBattleBuffersTransferData[3] = 51;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitBattleAnimation(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 52;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 4);
}

void EmitLinkStandbyMsg(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 53;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}

void EmitResetActionMoveSelection(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 54;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}

void dp01_build_cmdbuf_x37_a(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 55;
    gBattleBuffersTransferData[1] = b;
    dp01_prepare_buffer(a, gBattleBuffersTransferData, 2);
}
