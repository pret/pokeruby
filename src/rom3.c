#include "global.h"
#include "battle.h"
#include "battle_811DA74.h"
#include "battle_ai.h"
#include "battle_anim.h"
#include "battle_anim_81258BC.h"
#include "battle_anim_8137220.h"
#include "battle_util.h"
#include "cable_club.h"
#include "constants/items.h"
#include "link.h"
#include "pokemon.h"
#include "rom3.h"
#include "rom_8094928.h"
#include "constants/species.h"
#include "task.h"
#include "util.h"
#include "battle_message.h"
#include "data2.h"
#include "ewram.h"

extern u16 gBattleTypeFlags;
extern u16 gBattleWeather;
extern struct BattlePokemon gBattleMons[];

static EWRAM_DATA u8 gUnknown_020238C4 = 0;
static EWRAM_DATA u8 gUnknown_020238C5 = 0;
static EWRAM_DATA u8 gUnknown_020238C6 = 0;

extern u32 gUnknown_020239FC;
extern u8 gBattleBufferA[][0x200];
extern u8 gBattleBufferB[][0x200];
extern u8 gActiveBattler;
extern u32 gBattleExecBuffer;
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[];
extern u8 gBanksBySide[];
extern u16 gCurrentMove;
extern u16 gChosenMove;
extern u16 gLastUsedItem;
extern u8 gLastUsedAbility;
extern u8 gBankAttacker;
extern u8 gBankTarget;
extern u8 gEffectBank;
extern u8 gStringBank;
extern u8 gAbsentBattlerFlags;
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

#if DEBUG
extern u8 gUnknown_02023A14_50;
#endif

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
    ClearBattleAnimationVars();
    ClearBattleMonForms();
    BattleAI_HandleItemUseBeforeAISetup();
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        ZeroEnemyPartyMons();
        CreateMon(&gEnemyParty[0], SPECIES_POOCHYENA, 2, 32, 0, 0, 0, 0);
        i = ITEM_NONE;
        SetMonData(&gEnemyParty[0], MON_DATA_HELD_ITEM, &i);
    }
    gUnknown_020239FC = 0;
    gUnknown_02024C78 = 0;

#if DEBUG
    if (gUnknown_02023A14_50 & 0x80)
    {
        gSharedMem[0x160fd] = 0;
        gSharedMem[0x160fe] = 0;
        gSharedMem[0x160ff] = 0;
        ((u32 *) gBattleBuffersTransferData)[64]++;
    }
#endif
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
        for (i = 0; i < gBattlersCount; i++)
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
        gBattlersCount = 2;
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
        gBattlersCount = 4;
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
            gBattlersCount = 2;
        }
        else
        {
            gBattleBankFunc[1] = SetBankFuncToPlayerBufferRunCommand;
            gBanksBySide[1] = 0;
            gBattleBankFunc[0] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBanksBySide[0] = 1;
            gBattlersCount = 2;
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
            gBattlersCount = 4;
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
            gBattlersCount = 4;

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
                gBattlerPartyIndexes[gLinkPlayers[i].lp_field_18] = 0;
                break;
            case 1:
            case 2:
                gBanksBySide[gLinkPlayers[i].lp_field_18] = 2;
                gBattlerPartyIndexes[gLinkPlayers[i].lp_field_18] = 3;
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
                    gBattlerPartyIndexes[gLinkPlayers[i].lp_field_18] = 0;
                    break;
                case 1:
                case 2:
                    gBanksBySide[gLinkPlayers[i].lp_field_18] = 2;
                    gBattlerPartyIndexes[gLinkPlayers[i].lp_field_18] = 3;
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
                    gBattlerPartyIndexes[gLinkPlayers[i].lp_field_18] = 0;
                    break;
                case 1:
                case 2:
                    gBanksBySide[gLinkPlayers[i].lp_field_18] = 3;
                    gBattlerPartyIndexes[gLinkPlayers[i].lp_field_18] = 3;
                    break;
                }
            }
        }
    }
    gBattlersCount = 4;
}

void sub_800BD54(void)
{
    int i;
    int j;

    if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        for (i = 0; i < gBattlersCount; i++)
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
                            gBattlerPartyIndexes[i] = j;
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
                            gBattlerPartyIndexes[i] = j;
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
                         && gBattlerPartyIndexes[i - 2] != j)
                        {
                            gBattlerPartyIndexes[i] = j;
                            break;
                        }
                    }
                    else
                    {
                        if (GetMonData(&gEnemyParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != 0
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != SPECIES_EGG
                         && GetMonData(&gEnemyParty[j], MON_DATA_IS_EGG) == 0
                         && gBattlerPartyIndexes[i - 2] != j)
                        {
                            gBattlerPartyIndexes[i] = j;
                            break;
                        }
                    }
                }
            }
        }
    }
}

void PrepareBufferDataTransfer(u8 a, u8 *data, u16 size)
{
    int i;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        PrepareBufferDataTransferLink(a, size, data);
    }
    else
    {
        switch (a)
        {
        case 0:
            for (i = 0; i < size; i++)
            {
                gBattleBufferA[gActiveBattler][i] = *data;
                data++;
            }
            break;
        case 1:
            for (i = 0; i < size; i++)
            {
                gBattleBufferB[gActiveBattler][i] = *data;
                data++;
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

void PrepareBufferDataTransferLink(u8 a, u16 size, u8 *data)
{
    s32 r9;
    int i;

    r9 = size - size % 4 + 4;
    if (gTasks[gUnknown_020238C4].data[14] + r9 + 9 > 0x1000)
    {
        gTasks[gUnknown_020238C4].data[12] = gTasks[gUnknown_020238C4].data[14];
        gTasks[gUnknown_020238C4].data[14] = 0;
    }

    ewram14000arr(0, gTasks[gUnknown_020238C4].data[14]) = a;
    ewram14000arr(1, gTasks[gUnknown_020238C4].data[14]) = gActiveBattler;
    ewram14000arr(2, gTasks[gUnknown_020238C4].data[14]) = gBankAttacker;
    ewram14000arr(3, gTasks[gUnknown_020238C4].data[14]) = gBankTarget;
    ewram14000arr(4, gTasks[gUnknown_020238C4].data[14]) = r9;
    ewram14000arr(5, gTasks[gUnknown_020238C4].data[14]) = (r9 & 0x0000FF00) >> 8;
    ewram14000arr(6, gTasks[gUnknown_020238C4].data[14]) = gAbsentBattlerFlags;
    ewram14000arr(7, gTasks[gUnknown_020238C4].data[14]) = gEffectBank;

    for (i = 0; i < size; i++)
        ewram14008arr(i, gTasks[gUnknown_020238C4].data[14]) = data[i];
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
                var = (ewram14004arr(0, gTasks[taskId].data[15]) | (ewram14004arr(1, gTasks[taskId].data[15]) << 8)) + 8;
                SendBlock(bitmask_all_link_players_but_self(), &ewram14000arr(0, gTasks[taskId].data[15]), var);
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
        if (IsLinkTaskFinished())
        {
            var = (ewram14004arr(0, gTasks[taskId].data[15]) | (ewram14004arr(1, gTasks[taskId].data[15]) << 8));
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
    u16 *recvBuffer;  //r3
    u8 *dest;  //r5
    u8 *src;  //r4

    if (gReceivedRemoteLinkPlayers != 0 && (gBattleTypeFlags & 0x20) && gLinkPlayers[0].linkType == 0x2211)
    {
        for (i = 0; i < GetLinkPlayerCount(); i++)
        {
            if (GetBlockReceivedStatus() & gBitTable[i])
            {
                ResetBlockReceivedFlag(i);
                recvBuffer = gBlockRecvBuffer[i];
#ifndef NONMATCHING
                asm("");
                recvBuffer = gBlockRecvBuffer[i];
#endif
                r6 = gBlockRecvBuffer[i][2];
                if (gTasks[gUnknown_020238C5].data[14] + 9 + r6 > 0x1000)
                {
                    gTasks[gUnknown_020238C5].data[12] = gTasks[gUnknown_020238C5].data[14];
                    gTasks[gUnknown_020238C5].data[14] = 0;
                }
                //_0800C402
                dest = EWRAM_15000 + gTasks[gUnknown_020238C5].data[14];
                src = (u8 *)recvBuffer;
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
        r4 = ewram15000arr(1, gTasks[taskId].data[15]);
        r7 = ewram15000arr(4, gTasks[taskId].data[15]) | (ewram15000arr(5, gTasks[taskId].data[15]) << 8);
        switch (ewram15000arr(0, gTasks[taskId].data[15]))
        {
        case 0:
            if (gBattleExecBuffer & gBitTable[r4])
                return;
            memcpy(gBattleBufferA[r4], &ewram15000arr(8, gTasks[taskId].data[15]), r7);
            sub_80155A4(r4);
            if (!(gBattleTypeFlags & BATTLE_TYPE_WILD))
            {
                gBankAttacker = ewram15000arr(2, gTasks[taskId].data[15]);
                gBankTarget = ewram15000arr(3, gTasks[taskId].data[15]);
                gAbsentBattlerFlags = ewram15000arr(6, gTasks[taskId].data[15]);
                gEffectBank = ewram15000arr(7, gTasks[taskId].data[15]);
            }
            break;
        case 1:
            memcpy(gBattleBufferB[r4], &ewram15000arr(8, gTasks[taskId].data[15]), r7);
            break;
        case 2:
            r2 = ewram15000arr(8, gTasks[taskId].data[15]);
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
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd1(u8 a, u8 b, u8 c)
{
    gBattleBuffersTransferData[0] = 1;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitSetMonData(u8 a, u8 b, u8 c, u8 d, void *e)
{
    int i;

    gBattleBuffersTransferData[0] = 2;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    for (i = 0; i < d; i++)
        gBattleBuffersTransferData[3 + i] = *(u8*)(e++);
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, d + 3);
}

void Emitcmd3(u8 a, u8 b, u8 c, u8 *d)
{
    int i;

    gBattleBuffersTransferData[0] = 3;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    for (i = 0; i < c; i++)
        gBattleBuffersTransferData[3 + i] = *(d++);
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, c + 3);
}

void EmitLoadPokeSprite(u8 a)
{
    gBattleBuffersTransferData[0] = 4;
    gBattleBuffersTransferData[1] = 4;
    gBattleBuffersTransferData[2] = 4;
    gBattleBuffersTransferData[3] = 4;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitSendOutPoke(u8 a, u8 b, u8 c)
{
    gBattleBuffersTransferData[0] = 5;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = 5;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitReturnPokeToBall(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 6;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void EmitTrainerThrow(u8 a)
{
    gBattleBuffersTransferData[0] = 7;
    gBattleBuffersTransferData[1] = 7;
    gBattleBuffersTransferData[2] = 7;
    gBattleBuffersTransferData[3] = 7;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitTrainerSlide(u8 a)
{
    gBattleBuffersTransferData[0] = 8;
    gBattleBuffersTransferData[1] = 8;
    gBattleBuffersTransferData[2] = 8;
    gBattleBuffersTransferData[3] = 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitTrainerSlideBack(u8 a)
{
    gBattleBuffersTransferData[0] = 9;
    gBattleBuffersTransferData[1] = 9;
    gBattleBuffersTransferData[2] = 9;
    gBattleBuffersTransferData[3] = 9;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd10(u8 a)
{
    gBattleBuffersTransferData[0] = 10;
    gBattleBuffersTransferData[1] = 10;
    gBattleBuffersTransferData[2] = 10;
    gBattleBuffersTransferData[3] = 10;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd11(u8 a)
{
    gBattleBuffersTransferData[0] = 11;
    gBattleBuffersTransferData[1] = 11;
    gBattleBuffersTransferData[2] = 11;
    gBattleBuffersTransferData[3] = 11;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd12(u8 a)
{
    gBattleBuffersTransferData[0] = 12;
    gBattleBuffersTransferData[1] = 12;
    gBattleBuffersTransferData[2] = 12;
    gBattleBuffersTransferData[3] = 12;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitBallThrow(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 13;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void EmitPuase(u8 a, u8 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 14;
    gBattleBuffersTransferData[1] = b;
    for (i = 0; i < b * 3; i++)
        gBattleBuffersTransferData[2 + i] = *(c++);
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, b * 3 + 2);
}

void EmitMoveAnimation(u8 a, u16 b, u8 c, u16 d, s32 e, u8 f, struct DisableStruct *g)
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
    memcpy(&gBattleBuffersTransferData[16], g, sizeof(*g));
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 0x2C);
}

void EmitPrintString(u8 a, u16 stringID)
{
    s32 i;
    struct StringInfoBattle* stringInfo;

    gBattleBuffersTransferData[0] = 16;
    gBattleBuffersTransferData[1] = gBattleOutcome;
    gBattleBuffersTransferData[2] = stringID;
    gBattleBuffersTransferData[3] = (stringID & 0xFF00) >> 8;

    stringInfo = (struct StringInfoBattle*)(&gBattleBuffersTransferData[4]);
    stringInfo->currentMove = gCurrentMove;
    stringInfo->lastMove = gChosenMove;
    stringInfo->lastItem = gLastUsedItem;
    stringInfo->lastAbility = gLastUsedAbility;
    stringInfo->scrActive = gBattleStruct->scriptingActive;
    stringInfo->unk1605E = gBattleStruct->unk1605E;
    stringInfo->hpScale = gBattleStruct->hpScale;
    stringInfo->StringBank = gStringBank;
    stringInfo->moveType = gBattleMoves[gCurrentMove].type;

    for (i = 0; i < 4; i++)
        stringInfo->abilities[i] = gBattleMons[i].ability;
    for (i = 0; i < 0x10; i++)
    {
        stringInfo->textBuffs[0][i] = gBattleTextBuff1[i];
        stringInfo->textBuffs[1][i] = gBattleTextBuff2[i];
        stringInfo->textBuffs[2][i] = gBattleTextBuff3[i];
    }
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, sizeof(struct StringInfoBattle) + 4);
}

void EmitPrintStringPlayerOnly(u8 a, u16 stringID)
{
    s32 i;
    struct StringInfoBattle* stringInfo;

    gBattleBuffersTransferData[0] = 17;
    gBattleBuffersTransferData[1] = 17;
    gBattleBuffersTransferData[2] = stringID;
    gBattleBuffersTransferData[3] = (stringID & 0xFF00) >> 8;

    stringInfo = (struct StringInfoBattle*)(&gBattleBuffersTransferData[4]);
    stringInfo->currentMove = gCurrentMove;
    stringInfo->lastMove = gChosenMove;
    stringInfo->lastItem = gLastUsedItem;
    stringInfo->lastAbility = gLastUsedAbility;
    stringInfo->scrActive = gBattleStruct->scriptingActive;
    stringInfo->unk1605E = gBattleStruct->unk1605E;

    for (i = 0; i < 4; i++)
        stringInfo->abilities[i] = gBattleMons[i].ability;
    for (i = 0; i < 0x10; i++)
    {
        stringInfo->textBuffs[0][i] = gBattleTextBuff1[i];
        stringInfo->textBuffs[1][i] = gBattleTextBuff2[i];
        stringInfo->textBuffs[2][i] = gBattleTextBuff3[i];
    }
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, sizeof(struct StringInfoBattle) + 4);
}

void Emitcmd18(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 18;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd19(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 19;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void Emitcmd20(u8 a, u8 b, u8 c, u8 *d)
{
    u32 i;

    gBattleBuffersTransferData[0] = 20;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = 0;
    for (i = 0; i < 20; i++)
        gBattleBuffersTransferData[4 + i] = d[i];
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 24);
}

void EmitOpenBag(u8 a, u8 *b)
{
    int i;

    gBattleBuffersTransferData[0] = 21;
    for (i = 0; i < 3; i++)
        gBattleBuffersTransferData[1 + i] = b[i];
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
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
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 8);  //but only 7 bytes were written
}

void Emitcmd23(u8 a)
{
    gBattleBuffersTransferData[0] = 23;
    gBattleBuffersTransferData[1] = 23;
    gBattleBuffersTransferData[2] = 23;
    gBattleBuffersTransferData[3] = 23;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

// FIXME: I think this function is supposed to take s16 as its second argument,
// but battle_4.c expects u16
void EmitHealthBarUpdate(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 24;
    gBattleBuffersTransferData[1] = 0;
    gBattleBuffersTransferData[2] = (s16)b;
    gBattleBuffersTransferData[3] = ((s16)b & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

// FIXME: I think this function is supposed to take s16 as its third argument,
// but battle_4.c expects u16
void EmitExpBarUpdate(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 25;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (s16)c;
    gBattleBuffersTransferData[3] = ((s16)c & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
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
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 9);
}

void EmitStatusAnimation(u8 a, u8 b, u32 c)
{
    gBattleBuffersTransferData[0] = 27;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0x0000FF00) >> 8;
    gBattleBuffersTransferData[4] = (c & 0x00FF0000) >> 16;
    gBattleBuffersTransferData[5] = (c & 0xFF000000) >> 24;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 6);
}

void EmitStatusXor(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 28;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void Emitcmd29(u8 a, u16 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 29;
    gBattleBuffersTransferData[1] = 29;
    gBattleBuffersTransferData[2] = b;
    gBattleBuffersTransferData[3] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gBattleBuffersTransferData[4 + i] = *(c++);
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, b + 4);
}

void EmitDMATransfer(u8 a, u32 b, u16 c, u8 *d)
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
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, c + 7);
}

void Emitcmd31(u8 a, u16 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 31;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gBattleBuffersTransferData[3 + i] = *(c++);
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, b + 3);
}

void Emitcmd32(u8 a, u16 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 32;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gBattleBuffersTransferData[3 + i] = *(c++);
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, b + 3);
}

void Emitcmd33(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 33;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd34(u8 a, u8 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 34;
    gBattleBuffersTransferData[1] = b;
    for (i = 0; i < 3; i++)
        gBattleBuffersTransferData[2 + i] = c[i];
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 5);
}

void Emitcmd35(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 35;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd36(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 36;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd37(u8 a)
{
    gBattleBuffersTransferData[0] = 37;
    gBattleBuffersTransferData[1] = 37;
    gBattleBuffersTransferData[2] = 37;
    gBattleBuffersTransferData[3] = 37;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd38(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 38;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void Emitcmd39(u8 a)
{
    gBattleBuffersTransferData[0] = 39;
    gBattleBuffersTransferData[1] = 39;
    gBattleBuffersTransferData[2] = 39;
    gBattleBuffersTransferData[3] = 39;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd40(u8 a)
{
    gBattleBuffersTransferData[0] = 40;
    gBattleBuffersTransferData[1] = 40;
    gBattleBuffersTransferData[2] = 40;
    gBattleBuffersTransferData[3] = 40;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitHitAnimation(u8 a)
{
    gBattleBuffersTransferData[0] = 41;
    gBattleBuffersTransferData[1] = 41;
    gBattleBuffersTransferData[2] = 41;
    gBattleBuffersTransferData[3] = 41;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd42(u8 a)
{
    gBattleBuffersTransferData[0] = 42;
    gBattleBuffersTransferData[1] = 42;
    gBattleBuffersTransferData[2] = 42;
    gBattleBuffersTransferData[3] = 42;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitEffectivenessSound(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 43;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd44(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 44;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitFaintingCry(u8 a)
{
    gBattleBuffersTransferData[0] = 45;
    gBattleBuffersTransferData[1] = 45;
    gBattleBuffersTransferData[2] = 45;
    gBattleBuffersTransferData[3] = 45;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitIntroSlide(u8 a, u8 battleTerrain)
{
    gBattleBuffersTransferData[0] = 46;
    gBattleBuffersTransferData[1] = battleTerrain;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void EmitTrainerBallThrow(u8 a)
{
    gBattleBuffersTransferData[0] = 47;
    gBattleBuffersTransferData[1] = 47;
    gBattleBuffersTransferData[2] = 47;
    gBattleBuffersTransferData[3] = 47;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitDrawPartyStatusSummary(u8 a, struct HpAndStatus *hpAndStatus, u8 c)
{
    int i;

    gBattleBuffersTransferData[0] = 48;
    gBattleBuffersTransferData[1] = c & 0x7F;
    gBattleBuffersTransferData[2] = (c & 0x80) >> 7;
    gBattleBuffersTransferData[3] = 48;
    for (i = 0; i < 48; i++)
        gBattleBuffersTransferData[4 + i] = *(i + (u8*)(hpAndStatus));
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 52);
}

void Emitcmd49(u8 a)
{
    gBattleBuffersTransferData[0] = 49;
    gBattleBuffersTransferData[1] = 49;
    gBattleBuffersTransferData[2] = 49;
    gBattleBuffersTransferData[3] = 49;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void Emitcmd50(u8 a)
{
    gBattleBuffersTransferData[0] = 50;
    gBattleBuffersTransferData[1] = 50;
    gBattleBuffersTransferData[2] = 50;
    gBattleBuffersTransferData[3] = 50;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitSpriteInvisibility(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 51;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = 51;
    gBattleBuffersTransferData[3] = 51;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitBattleAnimation(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 52;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void EmitLinkStandbyMsg(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 53;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void EmitResetActionMoveSelection(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 54;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void Emitcmd55(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 55;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}
