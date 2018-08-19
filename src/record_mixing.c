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

void sub_80B929C(void)
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
    sub_80B9C6C((u8 *)&ewram_2008000.daycareMailRecord, sizeof(struct PlayerRecords), a, ewram_2008000.tvShows);
    sub_80B9B70(&ewram_2008000.battleTowerRecord, sizeof(struct PlayerRecords), a);
    sub_80B9F3C(ewram_2008000.filler11C8, a);
}

#define tCounter data[0]

void Task_RecordMixing_SoundEffect(u8 taskId)
{
    gTasks[taskId].tCounter++;
    if (gTasks[taskId].tCounter == 50)
    {
        PlaySE(SE_W213);
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
        PlaySE(SE_W226);
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

u8 sub_80B9BBC(u16 *a)
{
    return a[16];
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

#ifdef NONMATCHING
void sub_80B9C6C(u8 *a, u32 b, u8 c, void *d)
{
    u8 r8;
    u8 sp4[4];
    u8 sp8[4];
    void *spC[4];
    u8 sp1C[4][2];
    u8 sp24[4][2];
    u8 sp3C;
    u16 sp40 = Random();
    u16 i;  // r3
    u16 r7;
    u8 r1;
    struct DayCareMisc *r6;

    //asm("":::"r8");
    SeedRng(gLinkPlayers[0].trainerId);
    r8 = GetLinkPlayerCount();
    for (i = 0; i < 4; i++)
    {
        sp4[i] = 0xFF;
        sp8[i] = 0;
        sp1C[i][0] = 0;
        sp1C[i][1] = 0;
    }
    sp3C = 0;
    for (i = 0; i < r8; i++)
    {
        r6 = (struct DayCareMisc *)(a + b * i);
        if (r6->numDaycareMons != 0)
        {
            for (r7 = 0; r7 < r6->numDaycareMons; r7++)
            {
                if (r6->itemsHeld[r7] == 0)
                    sp1C[i][r7] = 1;
            }
        }
        //_080B9D3C
    }
    //_080B9D46
    for (r7 = 0, i = 0; i < r8; i++)
    {
        r6 = (struct DayCareMisc *)(a + b * i);
        if (sp1C[i][0] == 1 || sp1C[i][1] == 1)
            sp3C++;
        if (sp1C[i][0] == 1 && sp1C[i][1] == 0)
        {
            sp24[r7][0] = i;
            sp24[r7][1] = 0;
            r7++;
        }
        else if (sp1C[i][0] == 0 && sp1C[i][1] == 1)
        {
            sp24[r7][0] = i;
            sp24[r7][1] = 0;
            r7++;
        }
        //else if (sp1C[i][0] == 1 + 1 && sp1C[i][1] + 1 == 1 + 1)
        else if (sp1C[i][0] == 1 && sp1C[i][1] == 1)
        {
            u8 r4, r1;

            sp24[r7][0] = i;
            r4 = sub_80B9BBC((u16 *)&r6->data[0]);
            r1 = sub_80B9BBC((u16 *)&r6->data[1]);

            asm("");
            if (r4 == 0 && r1 != 0)
                sp24[r7][1] = 1;
            else if ((r4 == 0 && r1 == 0) || (r4 != 0 && r1 != 0))
                sp24[r7][1] = Random() % 2;
            else
                sp24[r7][1] = 0;
            /*
            if (r4 == 0 && r1 != 0)
                sp24[r7][1] = 1;
            else if ((r4 == 0 && r1 == 0) || (r4 != 0 && r1 != 0))
                sp24[r7][1] = Random() % 2;
            else
                sp24[r7][1] = 0;
            */

            /*
            if (r4 == 0 && r1 != 0)
                sp24[r7][1] = 1;
            else if ((r4 == 0 && r1 == 0) || (r4 != 0 && r1 != 0))
                //sp24[r7][1] = ((Random() << 16) >> 16) % 2;
                sp24[r7][1] = Random() % 2;
            else
                sp24[r7][1] = 0;
            */
          //_080B9E2C:
            r7++;
        }
    }
    //_080B9E3E
    for (i = 0; i < 4; i++)
    {
        r6 = (struct DayCareMisc *)a + b * c;
        spC[i] = r6;
    }
    r1 = sub_80B9C4C(d) % 3;
    switch (sp3C)
    {
    case 2:
        sub_80B9BC4(a, b, (u8 *)sp24, 0, 1);
        break;
    case 3:
        {
            u8 var1 = gUnknown_083D02B4[r1][0];
            u8 var2 = gUnknown_083D02B4[r1][1];
            sub_80B9BC4(a, b, (u8 *)sp24, var1, var2);
        }
        break;
    case 4:
        {
            u8 *r6 = (u8 *)sp24;
            u8 var1 = gUnknown_083D02BA[r1][0];
            u8 var2 = gUnknown_083D02BA[r1][1];
            sub_80B9BC4(a, b, r6, var1, var2);
        }
        {
            u8 *r6 = (u8 *)sp24;
            u8 var1 = gUnknown_083D02BA[r1][2];
            u8 var2 = gUnknown_083D02BA[r1][3];
            sub_80B9BC4(a, b, r6, var1, var2);
        }
        break;
    }
    //_080B9EF0
    //memcpy(&gSaveBlock1.filler_303C.data[0], a + b * c, 0x38);
    //memcpy(&gSaveBlock1.filler_303C.data[1], a + b * c + 0x38, 0x38);
    r6 = (struct DayCareMisc *)(a + b * c);
    gSaveBlock1.filler_303C.data[0] = r6->data[0];
    gSaveBlock1.filler_303C.data[1] = r6->data[1];
    //memcpy(&gSaveBlock1.filler_303C.data[0], &r6->data[0], 0x38);
    //memcpy(&gSaveBlock1.filler_303C.data[1], &r6->data[1], 0x38);
    SeedRng(sp40);
}
#else
NAKED
void sub_80B9C6C(u8 *a, u32 b, u8 c, void *d)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x58\n\
    str r0, [sp, 0x2C]\n\
    str r1, [sp, 0x30]\n\
    str r3, [sp, 0x38]\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    str r2, [sp, 0x34]\n\
    bl Random\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x40]\n\
    ldr r0, _080B9DA8 @ =gLinkPlayers\n\
    ldrh r0, [r0, 0x4]\n\
    bl SeedRng\n\
    bl GetLinkPlayerCount\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    movs r3, 0\n\
    add r0, sp, 0x1C\n\
    mov r9, r0\n\
    movs r1, 0x1D\n\
    add r1, sp\n\
    mov r10, r1\n\
    mov r2, sp\n\
    adds r2, 0xC\n\
    str r2, [sp, 0x4C]\n\
    movs r7, 0xFF\n\
    add r4, sp, 0x8\n\
    movs r2, 0\n\
    mov r6, r9\n\
    mov r5, r10\n\
_080B9CBC:\n\
    mov r1, sp\n\
    adds r1, r3\n\
    adds r1, 0x4\n\
    ldrb r0, [r1]\n\
    orrs r0, r7\n\
    strb r0, [r1]\n\
    adds r0, r4, r3\n\
    strb r2, [r0]\n\
    lsls r1, r3, 1\n\
    adds r0, r6, r1\n\
    strb r2, [r0]\n\
    adds r1, r5, r1\n\
    strb r2, [r1]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r3, 0x3\n\
    bls _080B9CBC\n\
    movs r4, 0\n\
    str r4, [sp, 0x3C]\n\
    movs r3, 0\n\
    mov r1, r8\n\
    lsls r0, r1, 16\n\
    lsrs r1, r0, 16\n\
    str r0, [sp, 0x50]\n\
    ldr r4, [sp, 0x30]\n\
    ldr r0, [sp, 0x34]\n\
    adds r2, r4, 0\n\
    muls r2, r0\n\
    str r2, [sp, 0x48]\n\
    ldr r2, [sp, 0x3C]\n\
    cmp r2, r1\n\
    bcs _080B9D46\n\
    mov r8, r1\n\
_080B9D00:\n\
    ldr r4, [sp, 0x30]\n\
    adds r0, r4, 0\n\
    muls r0, r3\n\
    ldr r1, [sp, 0x2C]\n\
    adds r6, r1, r0\n\
    ldr r0, [r6, 0x70]\n\
    cmp r0, 0\n\
    beq _080B9D3C\n\
    movs r7, 0\n\
    cmp r7, r0\n\
    bcs _080B9D3C\n\
    adds r4, r6, 0\n\
    adds r4, 0x74\n\
    mov r2, r9\n\
    lsls r1, r3, 1\n\
    movs r5, 0x1\n\
_080B9D20:\n\
    lsls r0, r7, 1\n\
    adds r0, r4, r0\n\
    ldrh r0, [r0]\n\
    cmp r0, 0\n\
    bne _080B9D30\n\
    adds r0, r7, r1\n\
    adds r0, r2, r0\n\
    strb r5, [r0]\n\
_080B9D30:\n\
    adds r0, r7, 0x1\n\
    lsls r0, 16\n\
    lsrs r7, r0, 16\n\
    ldr r0, [r6, 0x70]\n\
    cmp r7, r0\n\
    bcc _080B9D20\n\
_080B9D3C:\n\
    adds r0, r3, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r3, r8\n\
    bcc _080B9D00\n\
_080B9D46:\n\
    movs r7, 0\n\
    movs r3, 0\n\
    ldr r2, [sp, 0x50]\n\
    cmp r2, 0\n\
    beq _080B9E3E\n\
    mov r4, sp\n\
    adds r4, 0x24\n\
    str r4, [sp, 0x44]\n\
    movs r0, 0x25\n\
    add r0, sp\n\
    mov r8, r0\n\
_080B9D5C:\n\
    ldr r1, [sp, 0x30]\n\
    adds r0, r1, 0\n\
    muls r0, r3\n\
    ldr r2, [sp, 0x2C]\n\
    adds r6, r2, r0\n\
    lsls r1, r3, 1\n\
    mov r4, r9\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1\n\
    beq _080B9D7C\n\
    mov r2, r10\n\
    adds r0, r2, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1\n\
    bne _080B9D86\n\
_080B9D7C:\n\
    ldr r0, [sp, 0x3C]\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x3C]\n\
_080B9D86:\n\
    mov r4, r9\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1\n\
    bne _080B9DAC\n\
    mov r2, r10\n\
    adds r0, r2, r1\n\
    ldrb r2, [r0]\n\
    cmp r2, 0\n\
    bne _080B9DAC\n\
_080B9D9A:\n\
    lsls r1, r7, 1\n\
    ldr r4, [sp, 0x44]\n\
    adds r0, r4, r1\n\
    strb r3, [r0]\n\
    add r1, r8\n\
    strb r2, [r1]\n\
    b _080B9E2C\n\
    .align 2, 0\n\
_080B9DA8: .4byte gLinkPlayers\n\
_080B9DAC:\n\
    mov r2, r9\n\
    adds r0, r2, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _080B9DC0\n\
    mov r4, r10\n\
    adds r0, r4, r1\n\
    ldrb r2, [r0]\n\
    cmp r2, 0x1\n\
    beq _080B9D9A\n\
_080B9DC0:\n\
    mov r2, r9\n\
    adds r0, r2, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1\n\
    bne _080B9E32\n\
    mov r4, r10\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1\n\
    bne _080B9E32\n\
    lsls r5, r7, 1\n\
    ldr r1, [sp, 0x44]\n\
    adds r0, r1, r5\n\
    strb r3, [r0]\n\
    adds r0, r6, 0\n\
    str r3, [sp, 0x54]\n\
    bl sub_80B9BBC\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    adds r0, r6, 0\n\
    adds r0, 0x38\n\
    bl sub_80B9BBC\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    ldr r3, [sp, 0x54]\n\
    cmp r4, 0\n\
    bne _080B9E0A\n\
    cmp r1, 0\n\
    beq _080B9E0E\n\
    mov r2, r8\n\
    adds r1, r2, r5\n\
    movs r0, 0x1\n\
    strb r0, [r1]\n\
    b _080B9E2C\n\
_080B9E0A:\n\
    cmp r1, 0\n\
    beq _080B9E26\n\
_080B9E0E:\n\
    str r3, [sp, 0x54]\n\
    bl Random\n\
    mov r4, r8\n\
    adds r2, r4, r5\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x1\n\
    ands r0, r1\n\
    strb r0, [r2]\n\
    ldr r3, [sp, 0x54]\n\
    b _080B9E2C\n\
_080B9E26:\n\
    mov r2, r8\n\
    adds r0, r2, r5\n\
    strb r1, [r0]\n\
_080B9E2C:\n\
    adds r0, r7, 0x1\n\
    lsls r0, 16\n\
    lsrs r7, r0, 16\n\
_080B9E32:\n\
    adds r0, r3, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    ldr r4, [sp, 0x50]\n\
    cmp r0, r4\n\
    bcc _080B9D5C\n\
_080B9E3E:\n\
    movs r3, 0\n\
    ldr r1, [sp, 0x48]\n\
    lsls r0, r1, 4\n\
    subs r0, r1\n\
    lsls r0, 3\n\
    ldr r2, [sp, 0x2C]\n\
    adds r6, r2, r0\n\
    ldr r1, [sp, 0x4C]\n\
_080B9E4E:\n\
    lsls r0, r3, 2\n\
    adds r0, r1, r0\n\
    str r6, [r0]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r3, 0x3\n\
    bls _080B9E4E\n\
    ldr r0, [sp, 0x38]\n\
    bl sub_80B9C4C\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    movs r1, 0x3\n\
    bl __umodsi3\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    ldr r4, [sp, 0x3C]\n\
    cmp r4, 0x3\n\
    beq _080B9E9C\n\
    cmp r4, 0x3\n\
    bgt _080B9E82\n\
    cmp r4, 0x2\n\
    beq _080B9E8A\n\
    b _080B9EF0\n\
_080B9E82:\n\
    ldr r0, [sp, 0x3C]\n\
    cmp r0, 0x4\n\
    beq _080B9EBC\n\
    b _080B9EF0\n\
_080B9E8A:\n\
    add r2, sp, 0x24\n\
    movs r0, 0x1\n\
    str r0, [sp]\n\
    ldr r0, [sp, 0x2C]\n\
    ldr r1, [sp, 0x30]\n\
    movs r3, 0\n\
    bl sub_80B9BC4\n\
    b _080B9EF0\n\
_080B9E9C:\n\
    ldr r0, _080B9EB8 @ =gUnknown_083D02B4\n\
    lsls r1, 1\n\
    adds r2, r1, r0\n\
    ldrb r3, [r2]\n\
    adds r0, 0x1\n\
    adds r1, r0\n\
    ldrb r0, [r1]\n\
    add r2, sp, 0x24\n\
    str r0, [sp]\n\
    ldr r0, [sp, 0x2C]\n\
    ldr r1, [sp, 0x30]\n\
    bl sub_80B9BC4\n\
    b _080B9EF0\n\
    .align 2, 0\n\
_080B9EB8: .4byte gUnknown_083D02B4\n\
_080B9EBC:\n\
    add r6, sp, 0x24\n\
    ldr r4, _080B9F2C @ =gUnknown_083D02BA\n\
    lsls r5, r1, 2\n\
    adds r0, r5, r4\n\
    ldrb r3, [r0]\n\
    adds r0, r4, 0x1\n\
    adds r0, r5, r0\n\
    ldrb r0, [r0]\n\
    str r0, [sp]\n\
    ldr r0, [sp, 0x2C]\n\
    ldr r1, [sp, 0x30]\n\
    adds r2, r6, 0\n\
    bl sub_80B9BC4\n\
    adds r0, r4, 0x2\n\
    adds r0, r5, r0\n\
    ldrb r3, [r0]\n\
    adds r4, 0x3\n\
    adds r5, r4\n\
    ldrb r0, [r5]\n\
    str r0, [sp]\n\
    ldr r0, [sp, 0x2C]\n\
    ldr r1, [sp, 0x30]\n\
    adds r2, r6, 0\n\
    bl sub_80B9BC4\n\
_080B9EF0:\n\
    ldr r1, [sp, 0x2C]\n\
    ldr r2, [sp, 0x48]\n\
    adds r6, r1, r2\n\
    ldr r4, _080B9F30 @ =gSaveBlock1\n\
    ldr r1, _080B9F34 @ =0x0000303c\n\
    adds r0, r4, r1\n\
    adds r1, r6, 0\n\
    movs r2, 0x38\n\
    bl memcpy\n\
    ldr r2, _080B9F38 @ =0x00003074\n\
    adds r4, r2\n\
    adds r1, r6, 0\n\
    adds r1, 0x38\n\
    adds r0, r4, 0\n\
    movs r2, 0x38\n\
    bl memcpy\n\
    ldr r0, [sp, 0x40]\n\
    bl SeedRng\n\
    add sp, 0x58\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080B9F2C: .4byte gUnknown_083D02BA\n\
_080B9F30: .4byte gSaveBlock1\n\
_080B9F34: .4byte 0x0000303c\n\
_080B9F38: .4byte 0x00003074\n\
    .syntax divided\n");
}
#endif

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
