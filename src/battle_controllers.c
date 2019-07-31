#include "global.h"
#include "battle.h"
#include "battle_controllers.h"
#include "battle_811DA74.h"
#include "battle_ai_script_commands.h"
#include "battle_anim.h"
#include "battle_anim_81258BC.h"
#include "battle_anim_8137220.h"
#include "battle_util.h"
#include "cable_club.h"
#include "constants/items.h"
#include "link.h"
#include "pokemon.h"
#include "rom_8094928.h"
#include "constants/species.h"
#include "task.h"
#include "util.h"
#include "battle_message.h"
#include "data2.h"
#include "ewram.h"
#include "constants/abilities.h"

extern u16 gBattleTypeFlags;
extern u16 gBattleWeather;
extern struct BattlePokemon gBattleMons[];

static EWRAM_DATA u8 sLinkSendTaskId = 0;
static EWRAM_DATA u8 sLinkReceiveTaskId = 0;
static EWRAM_DATA u8 gUnknown_020238C6 = 0;

extern u32 gUnknown_020239FC;
extern u8 gBattleBufferA[][0x200];
extern u8 gBattleBufferB[][0x200];
extern u8 gActiveBattler;
extern u32 gBattleControllerExecFlags;
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[];
extern u8 gBattlerPositions[];
extern u16 gCurrentMove;
extern u16 gChosenMove;
extern u16 gLastUsedItem;
extern u8 gLastUsedAbility;
extern u8 gBattlerAttacker;
extern u8 gBattlerTarget;
extern u8 gEffectBattler;
extern u8 gPotentialItemEffectBattler;
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
extern void (*gBattlerControllerFuncs[])(void);

u8 gBattleBuffersTransferData[0x170];

// this file's funcionts
static void CreateTasksForSendRecvLinkBuffers(void);
static void InitSinglePlayerBtlControllers(void);
static void SetBattlePartyIds(void);
static void Task_HandleSendLinkBuffersData(u8 taskId);
static void Task_HandleCopyReceivedLinkBuffersData(u8 taskId);

void HandleLinkBattleSetup(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        OpenLink();
        CreateTask(sub_8083C50, 0);
        CreateTasksForSendRecvLinkBuffers();
    }
}

#if DEBUG
extern u8 gUnknown_02023A14_50;
#endif

void SetUpBattleVarsAndBirchPoochyena(void)
{
    s32 i;

    gBattleMainFunc = nullsub_41;

    for (i = 0; i < MAX_BATTLERS_COUNT; i++)
    {
        gBattlerControllerFuncs[i] = nullsub_91;
        gBattlerPositions[i] = 0xFF;
        gActionSelectionCursor[i] = 0;
        gMoveSelectionCursor[i] = 0;
    }

    HandleLinkBattleSetup();
    gBattleControllerExecFlags = 0;
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
        InitLinkBtlControllers();
    else
        InitSinglePlayerBtlControllers();

    SetBattlePartyIds();

    if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        for (i = 0; i < gBattlersCount; i++)
            sub_8094978(i, 0);
    }
}

static void InitSinglePlayerBtlControllers(void)
{
    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        gBattleMainFunc = sub_8010800;
        if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
            gBattlerControllerFuncs[0] = SetBankFuncToSafariBufferRunCommand;
        else if (gBattleTypeFlags & BATTLE_TYPE_WALLY_TUTORIAL)
            gBattlerControllerFuncs[0] = SetBankFuncToWallyBufferRunCommand;
        else
            gBattlerControllerFuncs[0] = SetBankFuncToPlayerBufferRunCommand;
        gBattlerPositions[0] = 0;
        gBattlerControllerFuncs[1] = SetBankFuncToOpponentBufferRunCommand;
        gBattlerPositions[1] = 1;
        gBattlersCount = 2;
    }
    else
    {
        gBattleMainFunc = sub_8010800;
        gBattlerControllerFuncs[0] = SetBankFuncToPlayerBufferRunCommand;
        gBattlerPositions[0] = 0;
        gBattlerControllerFuncs[1] = SetBankFuncToOpponentBufferRunCommand;
        gBattlerPositions[1] = 1;
        gBattlerControllerFuncs[2] = SetBankFuncToPlayerBufferRunCommand;
        gBattlerPositions[2] = 2;
        gBattlerControllerFuncs[3] = SetBankFuncToOpponentBufferRunCommand;
        gBattlerPositions[3] = 3;
        gBattlersCount = 4;
    }
}

void InitLinkBtlControllers(void)
{
    u8 multiplayerId;
    int i;

    if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
    {
        if (gBattleTypeFlags & BATTLE_TYPE_WILD)
        {
            gBattleMainFunc = sub_8010800;
            gBattlerControllerFuncs[0] = SetBankFuncToPlayerBufferRunCommand;
            gBattlerPositions[0] = 0;
            gBattlerControllerFuncs[1] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBattlerPositions[1] = 1;
            gBattlersCount = 2;
        }
        else
        {
            gBattlerControllerFuncs[1] = SetBankFuncToPlayerBufferRunCommand;
            gBattlerPositions[1] = 0;
            gBattlerControllerFuncs[0] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBattlerPositions[0] = 1;
            gBattlersCount = 2;
        }
        return;
    }
    if ((gBattleTypeFlags & (BATTLE_TYPE_MULTI | BATTLE_TYPE_DOUBLE)) == BATTLE_TYPE_DOUBLE)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_WILD)
        {
            gBattleMainFunc = sub_8010800;
            gBattlerControllerFuncs[0] = SetBankFuncToPlayerBufferRunCommand;
            gBattlerPositions[0] = 0;
            gBattlerControllerFuncs[1] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBattlerPositions[1] = 1;
            gBattlerControllerFuncs[2] = SetBankFuncToPlayerBufferRunCommand;
            gBattlerPositions[2] = 2;
            gBattlerControllerFuncs[3] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBattlerPositions[3] = 3;
            gBattlersCount = 4;
        }
        else
        {
            gBattlerControllerFuncs[1] = SetBankFuncToPlayerBufferRunCommand;
            gBattlerPositions[1] = 0;
            gBattlerControllerFuncs[0] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBattlerPositions[0] = 1;
            gBattlerControllerFuncs[3] = SetBankFuncToPlayerBufferRunCommand;
            gBattlerPositions[3] = 2;
            gBattlerControllerFuncs[2] = SetBankFuncToLinkOpponentBufferRunCommand;
            gBattlerPositions[2] = 3;
            gBattlersCount = 4;

        }
        return;
    }
    multiplayerId = GetMultiplayerId();
    if (gBattleTypeFlags & BATTLE_TYPE_WILD)
        gBattleMainFunc = sub_8010800;
    for (i = 0; i < 4; i++)
    {
        switch (gLinkPlayers[i].id)
        {
        case 0:
        case 3:
            sub_8094978(gLinkPlayers[i].id, 0);
            break;
        case 1:
        case 2:
            sub_8094978(gLinkPlayers[i].id, 1);
            break;
        }

        if (i == multiplayerId)
        {
            gBattlerControllerFuncs[gLinkPlayers[i].id] = SetBankFuncToPlayerBufferRunCommand;
            switch (gLinkPlayers[i].id)
            {
            case 0:
            case 3:
                gBattlerPositions[gLinkPlayers[i].id] = 0;
                gBattlerPartyIndexes[gLinkPlayers[i].id] = 0;
                break;
            case 1:
            case 2:
                gBattlerPositions[gLinkPlayers[i].id] = 2;
                gBattlerPartyIndexes[gLinkPlayers[i].id] = 3;
                break;
            }
        }
        else
        {
            if ((!(gLinkPlayers[i].id & 1) && !(gLinkPlayers[multiplayerId].id & 1))
             || ((gLinkPlayers[i].id & 1) && (gLinkPlayers[multiplayerId].id & 1)))
            {
                gBattlerControllerFuncs[gLinkPlayers[i].id] = SetBankFuncToLinkPartnerBufferRunCommand;
                switch (gLinkPlayers[i].id)
                {
                case 0:
                case 3:
                    gBattlerPositions[gLinkPlayers[i].id] = 0;
                    gBattlerPartyIndexes[gLinkPlayers[i].id] = 0;
                    break;
                case 1:
                case 2:
                    gBattlerPositions[gLinkPlayers[i].id] = 2;
                    gBattlerPartyIndexes[gLinkPlayers[i].id] = 3;
                    break;
                }
            }
            else
            {
                gBattlerControllerFuncs[gLinkPlayers[i].id] = SetBankFuncToLinkOpponentBufferRunCommand;
                switch (gLinkPlayers[i].id)
                {
                case 0:
                case 3:
                    gBattlerPositions[gLinkPlayers[i].id] = 1;
                    gBattlerPartyIndexes[gLinkPlayers[i].id] = 0;
                    break;
                case 1:
                case 2:
                    gBattlerPositions[gLinkPlayers[i].id] = 3;
                    gBattlerPartyIndexes[gLinkPlayers[i].id] = 3;
                    break;
                }
            }
        }
    }
    gBattlersCount = 4;
}

static void SetBattlePartyIds(void)
{
    s32 i, j;

    if (!(gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        for (i = 0; i < gBattlersCount; i++)
        {
            for (j = 0; j < PARTY_SIZE; j++)
            {
                if (i < 2)
                {
                    if (GET_BATTLER_SIDE2(i) == B_SIDE_PLAYER)
                    {
                        if (GetMonData(&gPlayerParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES2) != SPECIES_NONE
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
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != SPECIES_NONE
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
                    if (GET_BATTLER_SIDE2(i) == B_SIDE_PLAYER)
                    {
                        if (GetMonData(&gPlayerParty[j], MON_DATA_HP) != 0
                         && GetMonData(&gPlayerParty[j], MON_DATA_SPECIES) != SPECIES_NONE  // Probably a typo by Game Freak. The rest use SPECIES2
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
                         && GetMonData(&gEnemyParty[j], MON_DATA_SPECIES2) != SPECIES_NONE
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

static void PrepareBufferDataTransfer(u8 bufferId, u8 *data, u16 size)
{
    s32 i;

    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        PrepareBufferDataTransferLink(bufferId, size, data);
    }
    else
    {
        switch (bufferId)
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

static void CreateTasksForSendRecvLinkBuffers(void)
{
    sLinkSendTaskId = CreateTask(Task_HandleSendLinkBuffersData, 0);
    gTasks[sLinkSendTaskId].data[11] = 0;
    gTasks[sLinkSendTaskId].data[12] = 0;
    gTasks[sLinkSendTaskId].data[13] = 0;
    gTasks[sLinkSendTaskId].data[14] = 0;
    gTasks[sLinkSendTaskId].data[15] = 0;

    sLinkReceiveTaskId = CreateTask(Task_HandleCopyReceivedLinkBuffersData, 0);
    gTasks[sLinkReceiveTaskId].data[12] = 0;
    gTasks[sLinkReceiveTaskId].data[13] = 0;
    gTasks[sLinkReceiveTaskId].data[14] = 0;
    gTasks[sLinkReceiveTaskId].data[15] = 0;

    gUnknown_020238C6 = 0;
    CpuFill16(0, EWRAM_14000, 0x2000);
}

void PrepareBufferDataTransferLink(u8 a, u16 size, u8 *data)
{
    s32 r9;
    int i;

    r9 = size - size % 4 + 4;
    if (gTasks[sLinkSendTaskId].data[14] + r9 + 9 > 0x1000)
    {
        gTasks[sLinkSendTaskId].data[12] = gTasks[sLinkSendTaskId].data[14];
        gTasks[sLinkSendTaskId].data[14] = 0;
    }

    ewram14000arr(0, gTasks[sLinkSendTaskId].data[14]) = a;
    ewram14000arr(1, gTasks[sLinkSendTaskId].data[14]) = gActiveBattler;
    ewram14000arr(2, gTasks[sLinkSendTaskId].data[14]) = gBattlerAttacker;
    ewram14000arr(3, gTasks[sLinkSendTaskId].data[14]) = gBattlerTarget;
    ewram14000arr(4, gTasks[sLinkSendTaskId].data[14]) = r9;
    ewram14000arr(5, gTasks[sLinkSendTaskId].data[14]) = (r9 & 0x0000FF00) >> 8;
    ewram14000arr(6, gTasks[sLinkSendTaskId].data[14]) = gAbsentBattlerFlags;
    ewram14000arr(7, gTasks[sLinkSendTaskId].data[14]) = gEffectBattler;

    for (i = 0; i < size; i++)
        ewram14008arr(i, gTasks[sLinkSendTaskId].data[14]) = data[i];
    gTasks[sLinkSendTaskId].data[14] = gTasks[sLinkSendTaskId].data[14] + r9 + 8;
}

void Task_HandleSendLinkBuffersData(u8 taskId)
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
                if (gTasks[sLinkReceiveTaskId].data[14] + 9 + r6 > 0x1000)
                {
                    gTasks[sLinkReceiveTaskId].data[12] = gTasks[sLinkReceiveTaskId].data[14];
                    gTasks[sLinkReceiveTaskId].data[14] = 0;
                }
                //_0800C402
                dest = EWRAM_15000 + gTasks[sLinkReceiveTaskId].data[14];
                src = (u8 *)recvBuffer;
                for (j = 0; j < r6 + 8; j++)
                    dest[j] = src[j];
                gTasks[sLinkReceiveTaskId].data[14] = gTasks[sLinkReceiveTaskId].data[14] + r6 + 8;
            }
            //_0800C446
        }
    }
}

static void Task_HandleCopyReceivedLinkBuffersData(u8 taskId)
{
    u16 blockSize;
    u8 battlerId;
    u8 r2;

    if (gTasks[taskId].data[15] != gTasks[taskId].data[14])
    {
        if (gTasks[taskId].data[15] > gTasks[taskId].data[14]
         && gTasks[taskId].data[15] == gTasks[taskId].data[12])
        {
            gTasks[taskId].data[12] = 0;
            gTasks[taskId].data[15] = 0;
        }
        battlerId = ewram15000arr(1, gTasks[taskId].data[15]);
        blockSize = ewram15000arr(4, gTasks[taskId].data[15]) | (ewram15000arr(5, gTasks[taskId].data[15]) << 8);
        switch (ewram15000arr(0, gTasks[taskId].data[15]))
        {
        case 0:
            if (gBattleControllerExecFlags & gBitTable[battlerId])
                return;
            memcpy(gBattleBufferA[battlerId], &ewram15000arr(8, gTasks[taskId].data[15]), blockSize);
            sub_80155A4(battlerId);
            if (!(gBattleTypeFlags & BATTLE_TYPE_WILD))
            {
                gBattlerAttacker = ewram15000arr(2, gTasks[taskId].data[15]);
                gBattlerTarget = ewram15000arr(3, gTasks[taskId].data[15]);
                gAbsentBattlerFlags = ewram15000arr(6, gTasks[taskId].data[15]);
                gEffectBattler = ewram15000arr(7, gTasks[taskId].data[15]);
            }
            break;
        case 1:
            memcpy(gBattleBufferB[battlerId], &ewram15000arr(8, gTasks[taskId].data[15]), blockSize);
            break;
        case 2:
            r2 = ewram15000arr(8, gTasks[taskId].data[15]);
            gBattleControllerExecFlags &= ~(gBitTable[battlerId] << (r2 * 4));
            break;
        }

        gTasks[taskId].data[15] = gTasks[taskId].data[15] + blockSize + 8;
    }
}

void BtlController_EmitGetMonData(u8 bufferId, u8 requestId, u8 monToCheck)
{
    gBattleBuffersTransferData[0] = CONTROLLER_GETMONDATA;
    gBattleBuffersTransferData[1] = requestId;
    gBattleBuffersTransferData[2] = monToCheck;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitGetRawMonData(u8 bufferId, u8 monId, u8 bytes)
{
    gBattleBuffersTransferData[0] = CONTROLLER_GETRAWMONDATA;
    gBattleBuffersTransferData[1] = monId;
    gBattleBuffersTransferData[2] = bytes;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitSetMonData(u8 bufferId, u8 requestId, u8 monToCheck, u8 bytes, void *data)
{
    s32 i;

    gBattleBuffersTransferData[0] = CONTROLLER_SETMONDATA;
    gBattleBuffersTransferData[1] = requestId;
    gBattleBuffersTransferData[2] = monToCheck;
    for (i = 0; i < bytes; i++)
        gBattleBuffersTransferData[3 + i] = *(u8*)(data++);
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 3 + bytes);
}

void BtlController_EmitSetRawMonData(u8 bufferId, u8 monId, u8 bytes, void *data)
{
    s32 i;

    gBattleBuffersTransferData[0] = CONTROLLER_SETRAWMONDATA;
    gBattleBuffersTransferData[1] = monId;
    gBattleBuffersTransferData[2] = bytes;
    for (i = 0; i < bytes; i++)
        gBattleBuffersTransferData[3 + i] = *(u8*)(data++);
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, bytes + 3);
}

void BtlController_EmitLoadMonSprite(u8 bufferId)
{
    gBattleBuffersTransferData[0] = CONTROLLER_LOADMONSPRITE;
    gBattleBuffersTransferData[1] = CONTROLLER_LOADMONSPRITE;
    gBattleBuffersTransferData[2] = CONTROLLER_LOADMONSPRITE;
    gBattleBuffersTransferData[3] = CONTROLLER_LOADMONSPRITE;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitSwitchInAnim(u8 bufferId, u8 partyId, bool8 dontClearSubstituteBit)
{
    gBattleBuffersTransferData[0] = CONTROLLER_SWITCHINANIM;
    gBattleBuffersTransferData[1] = partyId;
    gBattleBuffersTransferData[2] = dontClearSubstituteBit;
    gBattleBuffersTransferData[3] = 5;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitReturnMonToBall(u8 bufferId, u8 arg1)
{
    gBattleBuffersTransferData[0] = CONTROLLER_RETURNMONTOBALL;
    gBattleBuffersTransferData[1] = arg1;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 2);
}

void BtlController_EmitDrawTrainerPic(u8 bufferId)
{
    gBattleBuffersTransferData[0] = CONTROLLER_DRAWTRAINERPIC;
    gBattleBuffersTransferData[1] = CONTROLLER_DRAWTRAINERPIC;
    gBattleBuffersTransferData[2] = CONTROLLER_DRAWTRAINERPIC;
    gBattleBuffersTransferData[3] = CONTROLLER_DRAWTRAINERPIC;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitTrainerSlide(u8 bufferId)
{
    gBattleBuffersTransferData[0] = CONTROLLER_TRAINERSLIDE;
    gBattleBuffersTransferData[1] = CONTROLLER_TRAINERSLIDE;
    gBattleBuffersTransferData[2] = CONTROLLER_TRAINERSLIDE;
    gBattleBuffersTransferData[3] = CONTROLLER_TRAINERSLIDE;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitTrainerSlideBack(u8 bufferId)
{
    gBattleBuffersTransferData[0] = CONTROLLER_TRAINERSLIDEBACK;
    gBattleBuffersTransferData[1] = CONTROLLER_TRAINERSLIDEBACK;
    gBattleBuffersTransferData[2] = CONTROLLER_TRAINERSLIDEBACK;
    gBattleBuffersTransferData[3] = CONTROLLER_TRAINERSLIDEBACK;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitFaintAnimation(u8 bufferId)
{
    gBattleBuffersTransferData[0] = CONTROLLER_FAINTANIMATION;
    gBattleBuffersTransferData[1] = CONTROLLER_FAINTANIMATION;
    gBattleBuffersTransferData[2] = CONTROLLER_FAINTANIMATION;
    gBattleBuffersTransferData[3] = CONTROLLER_FAINTANIMATION;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitPaletteFade(u8 bufferId)
{
    gBattleBuffersTransferData[0] = CONTROLLER_PALETTEFADE;
    gBattleBuffersTransferData[1] = CONTROLLER_PALETTEFADE;
    gBattleBuffersTransferData[2] = CONTROLLER_PALETTEFADE;
    gBattleBuffersTransferData[3] = CONTROLLER_PALETTEFADE;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitSuccessBallThrowAnim(u8 bufferId)
{
    gBattleBuffersTransferData[0] = CONTROLLER_SUCCESSBALLTHROWANIM;
    gBattleBuffersTransferData[1] = CONTROLLER_SUCCESSBALLTHROWANIM;
    gBattleBuffersTransferData[2] = CONTROLLER_SUCCESSBALLTHROWANIM;
    gBattleBuffersTransferData[3] = CONTROLLER_SUCCESSBALLTHROWANIM;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 4);
}

void BtlController_EmitBallThrowAnim(u8 bufferId, u8 caseId)
{
    gBattleBuffersTransferData[0] = CONTROLLER_BALLTHROWANIM;
    gBattleBuffersTransferData[1] = caseId;
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 2);
}

void BtlController_EmitPause(u8 bufferId, u8 toWait, void *data)
{
    s32 i;

    gBattleBuffersTransferData[0] = CONTROLLER_PAUSE;
    gBattleBuffersTransferData[1] = toWait;
    for (i = 0; i < toWait * 3; i++)
        gBattleBuffersTransferData[2 + i] = *(u8*)(data++);
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, toWait * 3 + 2);
}

void BtlController_EmitMoveAnimation(u8 bufferId, u16 move, u8 turnOfMove, u16 movePower, s32 dmg, u8 friendship, struct DisableStruct *disableStructPtr)
{
    gBattleBuffersTransferData[0] = CONTROLLER_MOVEANIMATION;
    gBattleBuffersTransferData[1] = move;
    gBattleBuffersTransferData[2] = (move & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = turnOfMove;
    gBattleBuffersTransferData[4] = movePower;
    gBattleBuffersTransferData[5] = (movePower & 0xFF00) >> 8;
    gBattleBuffersTransferData[6] = dmg;
    gBattleBuffersTransferData[7] = (dmg & 0x0000FF00) >> 8;
    gBattleBuffersTransferData[8] = (dmg & 0x00FF0000) >> 16;
    gBattleBuffersTransferData[9] = (dmg & 0xFF000000) >> 24;
    gBattleBuffersTransferData[10] = friendship;
    gBattleBuffersTransferData[11] = gMultiHitCounter;
    if (WEATHER_HAS_EFFECT2)
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
    memcpy(&gBattleBuffersTransferData[16], disableStructPtr, sizeof(struct DisableStruct));
    PrepareBufferDataTransfer(bufferId, gBattleBuffersTransferData, 16 + sizeof(struct DisableStruct));
}

void BtlController_EmitPrintString(u8 a, u16 stringID)
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
    stringInfo->StringBank = gPotentialItemEffectBattler;
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

void BtlController_EmitPrintSelectionString(u8 a, u16 stringID)
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

void BtlController_EmitChooseAction(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 18;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitUnknownYesNoBox(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 19;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void BtlController_EmitChooseMove(u8 a, u8 b, u8 c, u8 *d)
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

void BtlController_EmitChooseItem(u8 a, u8 *b)
{
    int i;

    gBattleBuffersTransferData[0] = 21;
    for (i = 0; i < 3; i++)
        gBattleBuffersTransferData[1 + i] = b[i];
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e)
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

void BtlController_EmitCmd23(u8 a)
{
    gBattleBuffersTransferData[0] = 23;
    gBattleBuffersTransferData[1] = 23;
    gBattleBuffersTransferData[2] = 23;
    gBattleBuffersTransferData[3] = 23;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

// FIXME: I think this function is supposed to take s16 as its second argument,
// but battle_4.c expects u16
void BtlController_EmitHealthBarUpdate(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 24;
    gBattleBuffersTransferData[1] = 0;
    gBattleBuffersTransferData[2] = (s16)b;
    gBattleBuffersTransferData[3] = ((s16)b & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

// FIXME: I think this function is supposed to take s16 as its third argument,
// but battle_4.c expects u16
void BtlController_EmitExpUpdate(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 25;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (s16)c;
    gBattleBuffersTransferData[3] = ((s16)c & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitStatusIconUpdate(u8 a, u32 b, u32 c)
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

void BtlController_EmitStatusAnimation(u8 a, u8 b, u32 c)
{
    gBattleBuffersTransferData[0] = 27;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0x0000FF00) >> 8;
    gBattleBuffersTransferData[4] = (c & 0x00FF0000) >> 16;
    gBattleBuffersTransferData[5] = (c & 0xFF000000) >> 24;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 6);
}

void BtlController_EmitStatusXor(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 28;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void BtlController_EmitDataTransfer(u8 a, u16 b, u8 *c)
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

void BtlController_EmitDMA3Transfer(u8 a, u32 b, u16 c, u8 *d)
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

void BtlController_EmitPlayBGM(u8 a, u16 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 31;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gBattleBuffersTransferData[3 + i] = *(c++);
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, b + 3);
}

void BtlController_EmitCmd32(u8 a, u16 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 32;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    for (i = 0; i < b; i++)
        gBattleBuffersTransferData[3 + i] = *(c++);
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, b + 3);
}

void BtlController_EmitTwoReturnValues(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 33;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitChosenMonReturnValue(u8 a, u8 b, u8 *c)
{
    int i;

    gBattleBuffersTransferData[0] = 34;
    gBattleBuffersTransferData[1] = b;
    for (i = 0; i < 3; i++)
        gBattleBuffersTransferData[2 + i] = c[i];
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 5);
}

void BtlController_EmitOneReturnValue(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 35;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitOneReturnValue_Duplicate(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 36;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitCmd37(u8 a)
{
    gBattleBuffersTransferData[0] = 37;
    gBattleBuffersTransferData[1] = 37;
    gBattleBuffersTransferData[2] = 37;
    gBattleBuffersTransferData[3] = 37;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitCmd38(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 38;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void BtlController_EmitCmd39(u8 a)
{
    gBattleBuffersTransferData[0] = 39;
    gBattleBuffersTransferData[1] = 39;
    gBattleBuffersTransferData[2] = 39;
    gBattleBuffersTransferData[3] = 39;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitCmd40(u8 a)
{
    gBattleBuffersTransferData[0] = 40;
    gBattleBuffersTransferData[1] = 40;
    gBattleBuffersTransferData[2] = 40;
    gBattleBuffersTransferData[3] = 40;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitHitAnimation(u8 a)
{
    gBattleBuffersTransferData[0] = 41;
    gBattleBuffersTransferData[1] = 41;
    gBattleBuffersTransferData[2] = 41;
    gBattleBuffersTransferData[3] = 41;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitCmd42(u8 a)
{
    gBattleBuffersTransferData[0] = 42;
    gBattleBuffersTransferData[1] = 42;
    gBattleBuffersTransferData[2] = 42;
    gBattleBuffersTransferData[3] = 42;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitPlaySE(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 43;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitPlayFanfareOrBGM(u8 a, u16 b)
{
    gBattleBuffersTransferData[0] = 44;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = (b & 0xFF00) >> 8;
    gBattleBuffersTransferData[3] = 0;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitFaintingCry(u8 a)
{
    gBattleBuffersTransferData[0] = 45;
    gBattleBuffersTransferData[1] = 45;
    gBattleBuffersTransferData[2] = 45;
    gBattleBuffersTransferData[3] = 45;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitIntroSlide(u8 a, u8 battleTerrain)
{
    gBattleBuffersTransferData[0] = 46;
    gBattleBuffersTransferData[1] = battleTerrain;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void BtlController_EmitIntroTrainerBallThrow(u8 a)
{
    gBattleBuffersTransferData[0] = 47;
    gBattleBuffersTransferData[1] = 47;
    gBattleBuffersTransferData[2] = 47;
    gBattleBuffersTransferData[3] = 47;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitDrawPartyStatusSummary(u8 a, struct HpAndStatus *hpAndStatus, u8 c)
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

void BtlController_EmitHidePartyStatusSummary(u8 a)
{
    gBattleBuffersTransferData[0] = 49;
    gBattleBuffersTransferData[1] = 49;
    gBattleBuffersTransferData[2] = 49;
    gBattleBuffersTransferData[3] = 49;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitEndBounceEffect(u8 a)
{
    gBattleBuffersTransferData[0] = 50;
    gBattleBuffersTransferData[1] = 50;
    gBattleBuffersTransferData[2] = 50;
    gBattleBuffersTransferData[3] = 50;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitSpriteInvisibility(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 51;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = 51;
    gBattleBuffersTransferData[3] = 51;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitBattleAnimation(u8 a, u8 b, u16 c)
{
    gBattleBuffersTransferData[0] = 52;
    gBattleBuffersTransferData[1] = b;
    gBattleBuffersTransferData[2] = c;
    gBattleBuffersTransferData[3] = (c & 0xFF00) >> 8;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 4);
}

void BtlController_EmitLinkStandbyMsg(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 53;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void BtlController_EmitResetActionMoveSelection(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 54;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}

void BtlController_EmitCmd55(u8 a, u8 b)
{
    gBattleBuffersTransferData[0] = 55;
    gBattleBuffersTransferData[1] = b;
    PrepareBufferDataTransfer(a, gBattleBuffersTransferData, 2);
}
