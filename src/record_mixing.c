#include "global.h"
#include "record_mixing.h"
#include "battle_tower.h"
#include "cable_club.h"
#include "daycare.h"
#include "dewford_trend.h"
#include "event_data.h"
#include "fldeff_recordmixing.h"
#include "item.h"
#include "constants/items.h"
#include "load_save.h"
#include "link.h"
#include "mauville_man.h"
#include "menu.h"
#include "mystery_event_script.h"
#include "random.h"
#include "overworld.h"
#include "save.h"
#include "script.h"
#include "secret_base.h"
#include "constants/songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "tv.h"
#include "ewram.h"

EWRAM_DATA struct RecordMixingDayCareMail gDayCareMailRecord = {0};
extern u16 gSpecialVar_0x8005;

u32 gUnknown_03005D2C;

static u8 gUnknown_03000718;
static u8 gUnknown_0300071C[4];

void *recordMixingSecretBases = &gSaveBlock1.secretBases;
void *recordMixingTvShows = &gSaveBlock1.tvShows;
void *recordMixingPokeNews = &gSaveBlock1.pokeNews;
void *recordMixingMauvilleMan = &gSaveBlock1.mauvilleMan;
void *recordMixingEasyChatPairs = &gSaveBlock1.easyChatPairs;
struct RecordMixingDayCareMail *gDayCareMailPlayerRecord = &gDayCareMailRecord;
struct BattleTowerRecord *gBattleTowerPlayerRecord = &gSaveBlock2.battleTower.playerRecord;

#define BUFFER_CHUNK_SIZE 200

void RecordMixingPlayerSpotTriggered(void)
{
    sub_8083A84(Task_RecordMixing_Main);
}

struct PlayerRecords
{
    struct SecretBaseRecord secretBases[SECRET_BASES_COUNT];
    TVShow tvShows[TV_SHOWS_COUNT];
    struct PokeNews pokeNews[POKE_NEWS_COUNT];
    union MauvilleMan mauvilleMan;
    struct EasyChatPair easyChatPairs[5];
    struct RecordMixingDayCareMail daycareMailRecord;
    struct BattleTowerRecord battleTowerRecord;
    u16 filler11C8[0x34];
};

void RecordMixing_PrepareExchangePacket(void)
{
    SetPlayerSecretBaseRecordMixingParty();
    sub_80C045C();

    memcpy(ewram_2018000.secretBases, recordMixingSecretBases, sizeof(ewram_2018000.secretBases));
    memcpy(ewram_2018000.tvShows, recordMixingTvShows, sizeof(ewram_2018000.tvShows));
    memcpy(ewram_2018000.pokeNews, recordMixingPokeNews, sizeof(ewram_2008000.pokeNews));
    memcpy(&ewram_2018000.mauvilleMan, recordMixingMauvilleMan, sizeof(ewram_2008000.mauvilleMan));
    memcpy(ewram_2018000.easyChatPairs, recordMixingEasyChatPairs, sizeof(ewram_2018000.easyChatPairs));
    gDayCareMailRecord.mail[0] = gSaveBlock1.daycare.misc.mail[0];
    gDayCareMailRecord.mail[1] = gSaveBlock1.daycare.misc.mail[1];
    InitDaycareMailRecordMixing(gSaveBlock1.daycare.mons, &gDayCareMailRecord);
    memcpy(&ewram_2018000.daycareMailRecord, gDayCareMailPlayerRecord, sizeof(struct RecordMixingDayCareMail));
    memcpy(&ewram_2018000.battleTowerRecord, gBattleTowerPlayerRecord, sizeof(struct BattleTowerRecord));

    if (GetMultiplayerId() == 0)
        ewram_2018000.filler11C8[0] = GetRecordMixingGift();
}

void RecordMixing_ReceiveExchangePacket(u32 a)
{
    sub_80BD674(ewram_2008000.secretBases, sizeof(struct PlayerRecords), a);
    sub_80BFD44((u8 *)ewram_2008000.tvShows, sizeof(struct PlayerRecords), a);
    sub_80C0514(ewram_2008000.pokeNews, sizeof(struct PlayerRecords), a);
    sub_80B9B1C((u8 *)&ewram_2008000.mauvilleMan, sizeof(struct PlayerRecords), a);
    sub_80FA4E4(ewram_2008000.easyChatPairs, sizeof(struct PlayerRecords), a);
    sub_80B9C6C(&ewram_2008000.daycareMailRecord, sizeof(struct PlayerRecords), a, ewram_2008000.tvShows);
    sub_80B9B70(&ewram_2008000.battleTowerRecord, sizeof(struct PlayerRecords), a);
    sub_80B9F3C(ewram_2008000.filler11C8, a);
}

#define tCounter data[0]

void Task_RecordMixing_SoundEffect(u8 taskId)
{
    gTasks[taskId].tCounter++;
    if (gTasks[taskId].tCounter == 50)
    {
        PlaySE(SE_M_ATTRACT);
        gTasks[taskId].tCounter = 0;
    }
}

#undef tCounter


#define tState        data[0]
#define tSndEffTaskId data[15]

void Task_RecordMixing_Main(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:        // init
        sub_8007270(gSpecialVar_0x8005);
        VarSet(VAR_TEMP_0, 1);
        gUnknown_03000718 = 0;
        RecordMixing_PrepareExchangePacket();
        CreateRecordMixingSprite();
        tState = 1;
        data[10] = CreateTask(sub_80B95F0, 0x50);
        tSndEffTaskId = CreateTask(Task_RecordMixing_SoundEffect, 0x51);
        break;
    case 1:        // wait for sub_80B95F0
        if (!gTasks[data[10]].isActive)
        {
            tState = 2;
            FlagSet(FLAG_SYS_MIX_RECORD);
            DestroyRecordMixingSprite();
            DestroyTask(tSndEffTaskId);
        }
        break;
    case 2:
        data[10] = CreateTask(sub_80BA00C, 10);
        tState = 3;
        PlaySE(SE_M_BATON_PASS);
        break;
    case 3:        // wait for sub_80BA00C
        if (!gTasks[data[10]].isActive)
        {
            tState = 4;
            data[10] = sub_8083664();
            Menu_ClearWindowText();
            Menu_PrintText(gOtherText_MixingComplete, 2, 15);
            data[8] = 0;
        }
        break;
    case 4:        // wait 60 frames
        data[8]++;
        if (data[8] > 60)
            tState = 5;
        break;
    case 5:
        if (!gTasks[data[10]].isActive)
        {
            sub_8055588();
            Menu_EraseScreen();
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
        break;
    }
}

void sub_80B95F0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->tState)
    {
    case 0:
        sub_80B9A78();
        Menu_DisplayDialogueFrame();
        Menu_PrintText(gOtherText_MixingRecordsWithFriend, 2, 15);
        task->data[8] = 0x708;
        task->tState = 400;
        ClearLinkCallback_2();
        break;
    case 100:        // wait 20 frames
        task->data[12]++;
        if (task->data[12] > 20)
        {
            task->data[12] = 0;
            task->tState = 101;
        }
        break;
    case 101:
        {
            u8 players = GetLinkPlayerCount_2();

            if (IsLinkMaster() == 1)
            {
                if (players == sub_800820C())
                {
                    PlaySE(SE_PIN);
                    task->tState = 201;
                    task->data[12] = 0;
                }
            }
            else
            {
                PlaySE(SE_BOO);
                task->tState = 301;
            }
        }
        break;
    case 201:
        if (sub_800820C() == GetLinkPlayerCount_2())
        {
            if (++task->data[12] > GetLinkPlayerCount_2() * 30)
            {
                sub_8007F4C();
                task->tState = 1;
            }
        }
        break;
    case 301:
        if (sub_800820C() == GetLinkPlayerCount_2())
            task->tState = 1;
        break;
    case 400:        // wait 20 frames
        task->data[12]++;
        if (task->data[12] > 20)
        {
            task->tState = 1;
            task->data[12] = 0;
        }
        break;
    case 1:        // wait for handshake
        if (gReceivedRemoteLinkPlayers)
        {
            ConvertIntToDecimalStringN(gStringVar1, GetMultiplayerId_(), 2, 2);
            task->tState = 5;
        }
        break;
    case 2:
        {
            u8 subTaskId;

            task->data[6] = GetLinkPlayerCount_2();
            task->tState = 0;
            task->data[5] = GetMultiplayerId_();
            task->func = Task_RecordMixing_SendPacket;
            StorePtrInTaskData(&ewram_2018000, &task->data[2]);
            subTaskId = CreateTask(Task_RecordMixing_CopyReceiveBuffer, 0x50);
            task->data[10] = subTaskId;
            gTasks[subTaskId].data[0] = taskId;
            StorePtrInTaskData((u8 *)&ewram_2008000, &gTasks[subTaskId].data[5]);
        }
        break;
    case 5:        // wait 60 frames
        task->data[10]++;
        if (task->data[10] > 60)
        {
            task->data[10] = 0;
            task->tState = 2;
        }
        break;
    }
}

void Task_RecordMixing_SendPacket(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    // does this send the data 24 times?

    switch (task->tState)
    {
    case 0: //Copy record data to send buffer
        {
            void *recordData = (u8 *)LoadPtrFromTaskData(&task->data[2]) + BUFFER_CHUNK_SIZE * task->data[4];

            memcpy(gBlockSendBuffer, recordData, BUFFER_CHUNK_SIZE);
            task->tState++;
        }
        break;
    case 1:
        if (GetMultiplayerId() == 0)
            sub_8007E9C(1);
        task->tState++;
        break;
    case 2:
        break;
    case 3:
        task->data[4]++;
        if ((u16)task->data[4] == 24)
            task->tState++;
        else
            task->tState = 0;
        break;
    case 4:
        if (!gTasks[task->data[10]].isActive)
            task->func = Task_RecordMixing_SendPacket_SwitchToReceive;
    }
}

void Task_RecordMixing_CopyReceiveBuffer(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s32 recvStatus = GetBlockReceivedStatus();
    u8 handledPlayers = 0;

    if (recvStatus == sub_8008198())
    {
        u8 player;

        for (player = 0; player < GetLinkPlayerCount(); player++)
        {
            void *src;
            u8 *dst;

            if ((recvStatus >> player) & 1)
            {
                dst = LoadPtrFromTaskData(&task->data[5]) + task->data[player + 1] * BUFFER_CHUNK_SIZE + player * sizeof(struct PlayerRecords);
                src = GetPlayerRecvBuffer(player);
                if ((task->data[player + 1] + 1) * BUFFER_CHUNK_SIZE > sizeof(struct PlayerRecords))
                    memcpy(dst, src, sizeof(struct PlayerRecords) - task->data[player + 1] * BUFFER_CHUNK_SIZE);
                else
                    memcpy(dst, src, BUFFER_CHUNK_SIZE);
                ResetBlockReceivedFlag(player);
                task->data[player + 1]++;
                if ((u16)task->data[player + 1] == 0x18)
                    handledPlayers++;
            }
        }
        gTasks[task->data[0]].data[0]++;
    }
    if (handledPlayers == GetLinkPlayerCount())
        DestroyTask(taskId);
}

void sub_80B99B4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (!gTasks[task->data[10]].isActive)
        DestroyTask(taskId);
}

void Task_RecordMixing_ReceivePacket(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->func = sub_80B99B4;
    if (gUnknown_03000718 == 1)
        RecordMixing_ReceiveExchangePacket(task->data[5]);
}

void Task_RecordMixing_SendPacket_SwitchToReceive(u8 taskId)
{
    gTasks[taskId].func = Task_RecordMixing_ReceivePacket;
    gUnknown_03000718 = 1;
}

void *LoadPtrFromTaskData(u16 *taskData)
{
    return (void *)(taskData[0] | (taskData[1] << 16));
}

void StorePtrInTaskData(void *ptr, u16 *taskData)
{
    taskData[0] = (u32)ptr;
    taskData[1] = (u32)ptr >> 16;
}

u8 GetMultiplayerId_(void)
{
    return GetMultiplayerId();
}

u16 *GetPlayerRecvBuffer(u8 player)
{
    return gBlockRecvBuffer[player];
}

void sub_80B9A78(void)
{
    gUnknown_03005D2C = sizeof(struct PlayerRecords);
}

const u8 gUnknown_083D0288[2] = {1, 0};

const u8 gUnknown_083D028A[2][3] =
{
    {1, 2, 0},
    {2, 0, 1},
};

const u8 gUnknown_083D0290[9][4] =
{
    {1, 0, 3, 2},
    {3, 0, 1, 2},
    {2, 0, 3, 1},
    {1, 3, 0, 2},
    {2, 3, 0, 1},
    {3, 2, 0, 1},
    {1, 2, 3, 0},
    {2, 3, 1, 0},
    {3, 2, 1, 0},
};

void sub_80B9A88(u8 *a)
{
    u32 i;
    u32 id;
    u32 players = GetLinkPlayerCount();

    switch (players)
    {
    case 2:
        for (i = 0; i < 2; i++)
            a[i] = gUnknown_083D0288[i];
        break;
    case 3:
        id = GetLinkPlayerTrainerId(0) % 2;
        for (i = 0; i < 3; i++)
            a[i] = gUnknown_083D028A[id][i];
        break;
    case 4:
        id = GetLinkPlayerTrainerId(0) % 9;
        for (i = 0; i < 4; i++)
            a[i] = gUnknown_083D0290[id][i];
        break;
    default:
        break;
    }
}

void sub_80B9B1C(u8 *a, size_t size, u8 index)
{
    u8 arr[4];
    u8 *ptr;

    sub_80B9A88(arr);
    //Probably not how it was originally written, but this matches.
    memcpy(a + index * size, (ptr = recordMixingMauvilleMan), 0x40);
    memcpy(ptr, a + arr[index] * size, 0x40);
    sub_80F7F30();
}

void sub_80B9B70(void *battleTowerRecord, u32 size, u8 index)
{
    sub_80B9A88(gUnknown_0300071C);
    memcpy(battleTowerRecord + size * index, battleTowerRecord + size * gUnknown_0300071C[index], sizeof(struct BattleTowerRecord));
    sub_8134AC0(battleTowerRecord + size * index);
}

u8 sub_80B9BBC(struct DayCareMail *a)
{
    return a->message.itemId;
}

void sub_80B9BC4(u8 *a, size_t b, u8 c[][2], u8 d, u8 e)
{
    struct DayCareMail *r6 = (struct DayCareMail *)(a + b * c[d][0]);
    struct DayCareMail *src = r6 + c[d][1];
    struct DayCareMail sp0 = *src;
    struct DayCareMail *r8 = (struct DayCareMail *)(a + b * c[e][0]);

    r6 += c[d][1];
    *r6 = *(r8 + c[e][1]);

    r8 += c[e][1];
    *r8 = sp0;
}

u8 sub_80B9C4C(u8 *a)
{
    int i;
    u8 r2 = 0;

    for (i = 0; i < 0x100; i++)
        r2 += a[i];
    return r2;
}

const u8 gUnknown_083D02B4[][2] =
{
    {0, 1},
    {1, 2},
    {2, 0},
};

const u8 gUnknown_083D02BA[3][4] =
{
    {0, 1, 2, 3},
    {0, 2, 1, 3},
    {0, 3, 2, 1},
};

void sub_80B9C6C(struct RecordMixingDayCareMail *src, size_t recordSize, u8 which, TVShow *shows)
{
    {
        u16 i, j;
        u8 linkPlayerCount;
        u8 tableId;
        struct RecordMixingDayCareMail *_src;
        u8 which0, which1;
        void *ptr;
        u8 sp04[4];
        u8 sp08[4];
        struct RecordMixingDayCareMail *sp0c[4];
        u8 sp1c[4][2];
        u8 sp24[4][2];
        u8 sp34;
        u16 oldSeed;

        oldSeed = Random();
        SeedRng(gLinkPlayers[0].trainerId);
        linkPlayerCount = GetLinkPlayerCount();
        for (i = 0; i < 4; i++)
        {
            sp04[i] = 0xFF;
            sp08[i] = 0;
            sp1c[i][0] = 0;
            sp1c[i][1] = 0;
        }
        sp34 = 0;
        for (i = 0; i < linkPlayerCount; i++)
        {
            _src = (void *)src + recordSize * i;
            if (_src->numDaycareMons == 0)
                continue;

            for (j = 0; j < _src->numDaycareMons; j ++)
            {
                if (!_src->itemsHeld[j])
                    sp1c[i][j] = 1;
            }
        }

        j = 0;
        for (i = 0; i < linkPlayerCount; i++)
        {
            _src = (void *)src + recordSize * i;
            if (sp1c[i][0] == TRUE || sp1c[i][1] == TRUE)
                sp34++;

            if (sp1c[i][0] == TRUE && sp1c[i][1] == FALSE)
            {
                sp24[j][0] = i;
                sp24[j][1] = 0;
                j++;
            }
            else if (sp1c[i][0] == FALSE && sp1c[i][1] == TRUE)
            {
                sp24[j][0] = i;
                sp24[j][1] = 1;
                j++;
            }
            else if (sp1c[i][0] == TRUE && sp1c[i][1] == TRUE)
            {
                u32 var1, var2;

                sp24[j][0] = i;
                var1 = sub_80B9BBC(&_src->mail[0]);
                var2 = sub_80B9BBC(&_src->mail[1]);
                if (!var1 && var2)
                {
                    register u8 one asm("r0") = 1; // boo, a fakematch
                    sp24[j][1] = one;
                }
                else if ((var1 && var2) || (!var1 && !var2))
                {
                    sp24[j][1] = Random() % 2;
                }
                else if (var1 && !var2)
                {
                    sp24[j][1] = 0;
                }
                j++;
            }
        }

        for (i = 0; i < 4; i++)
        {
            _src = &src[recordSize * which];
            sp0c[i] = _src;
        }

        tableId = sub_80B9C4C((void *)shows) % 3;
        switch (sp34)
        {
        case 2:
            sub_80B9BC4((void *)src, recordSize, sp24, 0, 1);
            break;
        case 3:
            which0 = gUnknown_083D02B4[tableId][0];
            which1 = gUnknown_083D02B4[tableId][1];
            sub_80B9BC4((void *)src, recordSize, sp24, which0, which1);
            break;
        case 4:
            ptr = sp24;
            which0 = gUnknown_083D02BA[tableId][0];
            which1 = gUnknown_083D02BA[tableId][1];
            sub_80B9BC4((void *)src, recordSize, ptr, which0, which1);
            which0 = gUnknown_083D02BA[tableId][2];
            which1 = gUnknown_083D02BA[tableId][3];
            sub_80B9BC4((void *)src, recordSize, ptr, which0, which1);
            break;
        }

        _src = (void *)src + which * recordSize;
        gSaveBlock1.daycare.misc.mail[0] = _src->mail[0];
        gSaveBlock1.daycare.misc.mail[1] = _src->mail[1];
        //memcpy(&gSaveBlock1.daycare.misc.mail[0], &_src->mail[0], sizeof(struct DayCareMail));
        //memcpy(&gSaveBlock1.daycare.misc.mail[1], &_src->mail[1], sizeof(struct DayCareMail));
        SeedRng(oldSeed);
    }
}

void sub_80B9F3C(u16 *a, u8 b)
{
    if (b != 0 && *a != 0)
    {
        if (GetPocketByItemId(*a) == 5)
        {
            if (!CheckBagHasItem(*a, 1) && !CheckPCHasItem(*a, 1) && AddBagItem(*a, 1))
            {
                VarSet(VAR_TEMP_1, *a);
                StringCopy(gStringVar1, gLinkPlayers[0].name);
                if (*a == ITEM_EON_TICKET)
                    FlagSet(FLAG_SYS_HAS_EON_TICKET);
            }
            else
            {
                VarSet(VAR_TEMP_1, ITEM_NONE);
            }
        }
        else
        {
            if (AddBagItem(*a, 1) == TRUE)
            {
                VarSet(VAR_TEMP_1, *a);
                StringCopy(gStringVar1, gLinkPlayers[0].name);
            }
            else
            {
                VarSet(VAR_TEMP_1, ITEM_NONE);
            }
        }
    }
}

void sub_80BA00C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[0]++;
        break;
    case 1:
        task->data[0]++;
        break;
    case 2:
        SetSecretBase2Field_9_AndHideBG();
        sub_8125E2C();
        task->data[0]++;
        break;
    case 3:
        if (sub_8125E6C() != 0)
        {
            ClearSecretBase2Field_9_2();
            task->data[0]++;
            task->data[1] = 0;
        }
        break;
    case 4:
        task->data[1]++;
        if (task->data[1] > 10)
        {
            sub_800832C();
            task->data[0]++;
        }
        break;
    case 5:
        if (!gReceivedRemoteLinkPlayers)
            DestroyTask(taskId);
        break;
    }
}
