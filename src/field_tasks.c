#include "global.h"
#include "task.h"
#include "main.h"
#include "constants/vars.h"
#include "bike.h"
#include "item.h"
#include "constants/items.h"
#include "event_data.h"
#include "overworld.h"
#include "clock.h"
#include "script.h"
#include "field_special_scene.h"
#include "field_effect_helpers.h"
#include "secret_base.h"
#include "metatile_behavior.h"
#include "fieldmap.h"
#include "field_player_avatar.h"
#include "field_camera.h"
#include "constants/songs.h"
#include "sound.h"
#include "field_tasks.h"

void DummyPerStepCallback(u8);
void PerStepCallback_8069F64(u8);
void PerStepCallback_8069AA0(u8);
void PerStepCallback_8069864(u8);
void PerStepCallback_8069DD4(u8);
void PerStepCallback_806A07C(u8);

void (*const gUnknown_08376364[])(u8) = {
    DummyPerStepCallback,
    PerStepCallback_8069F64,
    PerStepCallback_8069AA0,
    PerStepCallback_8069864,
    PerStepCallback_8069DD4,
    EndTruckSequence,
    sub_80BCF1C,
    PerStepCallback_806A07C
};

void Task_RunPerStepCallback(u8 taskId)
{
    int idx = gTasks[taskId].data[0];
    gUnknown_08376364[idx](taskId);
}

#define tState           data[0]
#define tAmbientCryState data[1]
#define tAmbientCryDelay data[2]

static void RunTimeBasedEvents(s16 *data)
{
    switch (tState)
    {
        case 0:
            if (gMain.vblankCounter1 & 0x1000)
            {
                DoTimeBasedEvents();
                tState++;
            }
            break;
        case 1:
            if (!(gMain.vblankCounter1 & 0x1000))
            {
                tState--;
            }
            break;
    }
}

void Task_RunTimeBasedEvents(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (!ScriptContext2_IsEnabled())
    {
        RunTimeBasedEvents(data);
        UpdateAmbientCry(&tAmbientCryState, &tAmbientCryDelay);
    }
}

#undef tState
#undef tAmbientCryState
#undef tAmbientCryDelay

void Task_MuddySlope(u8);

void SetUpFieldTasks(void)
{
    if (!FuncIsActiveTask(Task_RunPerStepCallback))
    {
        u8 taskId = CreateTask(Task_RunPerStepCallback, 0x50);
        gTasks[taskId].data[0] = 0;
    }
    if (!FuncIsActiveTask(Task_MuddySlope))
    {
        CreateTask(Task_MuddySlope, 0x50);
    }
    if (!FuncIsActiveTask(Task_RunTimeBasedEvents))
    {
        CreateTask(Task_RunTimeBasedEvents, 0x50);
    }
}

void ActivatePerStepCallback(u8 callback)
{
    s16 *dataPointer;
    s16 *dataStart;
    s16 zero;
    u8 taskId = FindTaskIdByFunc(Task_RunPerStepCallback);
    if (taskId != 0xff)
    {
        dataStart = gTasks[taskId].data;
        zero = 0;
        dataPointer = &dataStart[15];
        do
        {
            *dataPointer-- = zero;
        } while ((int)dataPointer >= (int)dataStart);
        if (callback >= ARRAY_COUNT(gUnknown_08376364))
        {
            *dataStart = 0;
        }
        else
        {
            *dataStart = callback;
        }
    }
}

void ResetFieldTasksArgs(void)
{
    u8 taskId;
    s16 *taskData;
    taskId = FindTaskIdByFunc(Task_RunPerStepCallback);
    if (taskId != 0xff)
    {
        taskData = gTasks[taskId].data;
    }
    taskId = FindTaskIdByFunc(Task_RunTimeBasedEvents);
    if (taskId != 0xff)
    {
        taskData = gTasks[taskId].data;
        taskData[1] = 0;
        taskData[2] = 0;
    }
}

const struct MetatileOffset gUnknown_08376384[][2] = {
    {{  0,  0,0x259}, {  0,  1,0x261}},
    {{  0, -1,0x259}, {  0,  0,0x261}},
    {{  0,  0,0x252}, {  1,  0,0x253}},
    {{ -1,  0,0x252}, {  0,  0,0x253}}
};

const struct MetatileOffset gUnknown_083763A4[][2] = {
    {{  0,  0,0x25A}, {  0,  1,0x262}},
    {{  0, -1,0x25A}, {  0,  0,0x262}},
    {{  0,  0,0x254}, {  1,  0,0x255}},
    {{ -1,  0,0x254}, {  0,  0,0x255}}
};

const struct MetatileOffset gUnknown_083763C4[][2] = {
    {{  0,  0,0x258}, {  0,  1,0x260}},
    {{  0, -1,0x258}, {  0,  0,0x260}},
    {{  0,  0,0x250}, {  1,  0,0x251}},
    {{ -1,  0,0x250}, {  0,  0,0x251}}
};

void DummyPerStepCallback(u8 taskId) {}

const struct MetatileOffset *sub_80695E0(const struct MetatileOffset a0[][2], s8 a1)
{
    if (MetatileBehavior_IsPacifidlogVerticalLog1(a1))
    {
        return a0[0];
    }
    else if (MetatileBehavior_IsPacifidlogVerticalLog2(a1))
    {
        return a0[1];
    }
    else if (MetatileBehavior_IsPacifidlogHorizontalLog1(a1))
    {
        return a0[2];
    }
    else if (MetatileBehavior_IsPacifidlogHorizontalLog2(a1))
    {
        return a0[3];
    }
    else
    {
        return NULL;
    }
}

#ifdef NONMATCHING
void sub_8069638(const struct MetatileOffset offsets[][2], s16 x, s16 y, bool32 flag)
{
    const struct MetatileOffset *offsetData = sub_80695E0(offsets, MapGridGetMetatileBehaviorAt(x, y));
    const struct MetatileOffset *offsetdata2 = offsetData;
    if (offsetData != NULL)
    {
        MapGridSetMetatileIdAt(x + offsetData[0].x, y + offsetData[0].y, offsetData[0].tileId);
        if (flag)
        {
            CurrentMapDrawMetatileAt(x + offsetData[0].x, y + offsetData[0].y);
        }
        MapGridSetMetatileIdAt(x + offsetdata2[1].x, y + offsetdata2[1].y, offsetdata2[1].tileId);
        if (flag)
        {
            CurrentMapDrawMetatileAt(x + offsetdata2[1].x, y + offsetdata2[1].y);
        }
    }
}
#else
NAKED
void sub_8069638(const struct MetatileOffset offsets[][2], s16 x, s16 y, bool32 flag)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r8\n"
                    "\tpush {r7}\n"
                    "\tadds r5, r0, 0\n"
                    "\tmov r8, r3\n"
                    "\tlsls r1, 16\n"
                    "\tasrs r6, r1, 16\n"
                    "\tlsls r2, 16\n"
                    "\tasrs r7, r2, 16\n"
                    "\tadds r0, r6, 0\n"
                    "\tadds r1, r7, 0\n"
                    "\tbl MapGridGetMetatileBehaviorAt\n"
                    "\tadds r1, r0, 0\n"
                    "\tlsls r1, 16\n"
                    "\tlsrs r1, 16\n"
                    "\tadds r0, r5, 0\n"
                    "\tbl sub_80695E0\n"
                    "\tadds r4, r0, 0\n"
                    "\tadds r5, r4, 0\n"
                    "\tcmp r4, 0\n"
                    "\tbeq _080696B6\n"
                    "\tmovs r0, 0\n"
                    "\tldrsb r0, [r4, r0]\n"
                    "\tadds r0, r6, r0\n"
                    "\tmovs r1, 0x1\n"
                    "\tldrsb r1, [r4, r1]\n"
                    "\tadds r1, r7, r1\n"
                    "\tldrh r2, [r4, 0x2]\n"
                    "\tbl MapGridSetMetatileIdAt\n"
                    "\tmov r0, r8\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0806968E\n"
                    "\tmovs r0, 0\n"
                    "\tldrsb r0, [r4, r0]\n"
                    "\tadds r0, r6, r0\n"
                    "\tmovs r1, 0x1\n"
                    "\tldrsb r1, [r4, r1]\n"
                    "\tadds r1, r7, r1\n"
                    "\tbl CurrentMapDrawMetatileAt\n"
                    "_0806968E:\n"
                    "\tmovs r0, 0x4\n"
                    "\tldrsb r0, [r5, r0]\n"
                    "\tadds r0, r6, r0\n"
                    "\tmovs r1, 0x5\n"
                    "\tldrsb r1, [r5, r1]\n"
                    "\tadds r1, r7, r1\n"
                    "\tldrh r2, [r5, 0x6]\n"
                    "\tbl MapGridSetMetatileIdAt\n"
                    "\tmov r0, r8\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _080696B6\n"
                    "\tmovs r0, 0x4\n"
                    "\tldrsb r0, [r5, r0]\n"
                    "\tadds r0, r6, r0\n"
                    "\tmovs r1, 0x5\n"
                    "\tldrsb r1, [r5, r1]\n"
                    "\tadds r1, r7, r1\n"
                    "\tbl CurrentMapDrawMetatileAt\n"
                    "_080696B6:\n"
                    "\tpop {r3}\n"
                    "\tmov r8, r3\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0");
}
#endif

void sub_80696C0(s16 x, s16 y, bool32 flag)
{
    sub_8069638(gUnknown_08376384, x, y, flag);
}

void sub_80696E4(s16 x, s16 y, bool32 flag)
{
    sub_8069638(gUnknown_083763A4, x, y, flag);
}

void sub_8069708(s16 x, s16 y, bool32 flag)
{
    sub_8069638(gUnknown_083763C4, x, y, flag);
}

bool32 sub_806972C(s16 x1, s16 y1, s16 x2, s16 y2)
{
    s8 metatileBehavior = MapGridGetMetatileBehaviorAt(x2, y2);
    if (MetatileBehavior_IsPacifidlogVerticalLog1(metatileBehavior))
    {
        if (y1 > y2)
        {
            return FALSE;
        }
    }
    else if (MetatileBehavior_IsPacifidlogVerticalLog2(metatileBehavior))
    {
        if (y1 < y2)
        {
            return FALSE;
        }
    }
    else if (MetatileBehavior_IsPacifidlogHorizontalLog1(metatileBehavior))
    {
        if (x1 > x2)
        {
            return FALSE;
        }
    }
    else if (MetatileBehavior_IsPacifidlogHorizontalLog2(metatileBehavior))
    {
        if (x1 < x2)
        {
            return FALSE;
        }
    }
    return TRUE;
}

bool32 sub_80697C8(s16 x1, s16 y1, s16 x2, s16 y2)
{
    s8 metatileBehavior = MapGridGetMetatileBehaviorAt(x1, y1);
    if (MetatileBehavior_IsPacifidlogVerticalLog1(metatileBehavior))
    {
        if (y1 < y2)
        {
            return FALSE;
        }
    }
    else if (MetatileBehavior_IsPacifidlogVerticalLog2(metatileBehavior))
    {
        if (y1 > y2)
        {
            return FALSE;
        }
    }
    else if (MetatileBehavior_IsPacifidlogHorizontalLog1(metatileBehavior))
    {
        if (x1 < x2)
        {
            return FALSE;
        }
    }
    else if (MetatileBehavior_IsPacifidlogHorizontalLog2(metatileBehavior))
    {
        if (x1 > x2)
        {
            return FALSE;
        }
    }
    return TRUE;
}

void PerStepCallback_8069864(u8 taskId)
{
    s16 *data;
    s16 x, y;
    data = gTasks[taskId].data;
    PlayerGetDestCoords(&x, &y);
    switch (data[1])
    {
        case 0:
            data[2] = x;
            data[3] = y;
            sub_80696E4(x, y, TRUE);
            data[1] = 1;
            break;
        case 1:
            if (x != data[2] || y != data[3])
            {
                if (sub_806972C(x, y, data[2], data[3]))
                {
                    sub_80696C0(data[2], data[3], TRUE);
                    sub_8069708(data[2], data[3], FALSE);
                    data[4] = data[2];
                    data[5] = data[3];
                    data[1] = 2;
                    data[6] = 8;
                }
                else
                {
                    data[4] = -1;
                    data[5] = -1;
                }
                if (sub_80697C8(x, y, data[2], data[3]))
                {
                    sub_80696C0(x, y, TRUE);
                    data[1] = 2;
                    data[6] = 8;
                }
                data[2] = x;
                data[3] = y;
                if (MetatileBehavior_IsPacifidlogLog(MapGridGetMetatileBehaviorAt(x, y)))
                {
                    PlaySE(SE_MIZU);
                }
            }
            break;
        case 2:
            if ((--data[6]) == 0)
            {
                sub_80696E4(x, y, TRUE);
                if (data[4] != -1 && data[5] != -1)
                {
                    sub_8069708(data[4], data[5], TRUE);
                }
                data[1] = 1;
            }
            break;
    }
}

void sub_80699D8(s16 x, s16 y)
{
    u8 z = PlayerGetZCoord();
    if (!(z & 0x01))
    {
        switch (MapGridGetMetatileIdAt(x, y))
        {
            case 0x24e:
                MapGridSetMetatileIdAt(x, y, 0x24f);
                break;
            case 0x256:
                MapGridSetMetatileIdAt(x, y, 0x257);
                break;
        }
    }
}

void sub_8069A3C(s16 x, s16 y)
{
    u8 z = PlayerGetZCoord();
    if (!(z & 0x01))
    {
        switch (MapGridGetMetatileIdAt(x, y))
        {
            case 0x24f:
                MapGridSetMetatileIdAt(x, y, 0x24e);
                break;
            case 0x257:
                MapGridSetMetatileIdAt(x, y, 0x256);
                break;
        }
    }
}

void PerStepCallback_8069AA0(u8 taskId)
{
    bool8 isFortreeBridgeCur;
    bool8 isFortreeBridgePrev;
    u8 z, flag;
    s16 x, y, x2, y2;
    s16 *data = gTasks[taskId].data;
    PlayerGetDestCoords(&x, &y);
    switch (data[1])
    {
        default:
            break;
        case 0:
            data[2] = x;
            data[3] = y;
            if (MetatileBehavior_IsFortreeBridge(MapGridGetMetatileBehaviorAt(x, y)))
            {
                sub_80699D8(x, y);
                CurrentMapDrawMetatileAt(x, y);
            }
            data[1] = 1;
            break;
        case 1:
            x2 = data[2];
            y2 = data[3];
            if (x == x2 && y == y2)
            {
                break;
            }
            isFortreeBridgeCur = MetatileBehavior_IsFortreeBridge(MapGridGetMetatileBehaviorAt(x, y));
            isFortreeBridgePrev = MetatileBehavior_IsFortreeBridge(MapGridGetMetatileBehaviorAt(x2, y2));
            z = PlayerGetZCoord();
            flag = 0;
            if ((u8)(z & 1) == 0)
            {
                flag = 1;
            }
            if (flag && (isFortreeBridgeCur == 1 || isFortreeBridgePrev == 1))
            {
                PlaySE(SE_HASHI);
            }
            if (isFortreeBridgePrev)
            {
                sub_8069A3C(x2, y2);
                CurrentMapDrawMetatileAt(x2, y2);
                sub_80699D8(x, y);
                CurrentMapDrawMetatileAt(x, y);
            }
            data[4] = x2;
            data[5] = y2;
            data[2] = x;
            data[3] = y;
            if (!isFortreeBridgePrev)
            {
                break;
            }
            data[6] = 16;
            data[1] = 2;
            // fallthrough
        case 2:
            data[6]--;
            x2 = data[4];
            y2 = data[5];
            switch (data[6] % 7)
            {
                case 0:
                    CurrentMapDrawMetatileAt(x2, y2);
                case 1:
                case 2:
                case 3:
                    break;
                case 4:
                    sub_80699D8(x2, y2);
                    CurrentMapDrawMetatileAt(x2, y2);
                    sub_8069A3C(x2, y2);
                case 5:
                case 6:
                case 7:
                    break;
            }
            if (data[6] == 0)
            {
                data[1] = 1;
            }
            break;
    }
}

const u16 gUnknown_083763E4[] = {
    0,
    0,
    0,
    0,
    0,
    0,
    VAR_TEMP_1,
    VAR_TEMP_2,
    VAR_TEMP_3,
    VAR_TEMP_4,
    0,
    0,
    VAR_TEMP_5,
    VAR_TEMP_6,
    VAR_TEMP_7,
    0,
    0,
    VAR_TEMP_8,
    VAR_TEMP_9,
    VAR_TEMP_A,
    0,
    0,
    0,
    0,
    0,
    0
};

bool32 sub_8069CB8(s16 x, s16 y)
{
    if ((u16)(x - 3) < 11 && (u16)(y - 6) < 14 && gUnknown_083763E4[y])
    {
        return TRUE;
    }
    return FALSE;
}

void sub_8069CFC(s16 x, s16 y)
{
    if (sub_8069CB8(x, y))
    {
        *GetVarPointer(gUnknown_083763E4[y]) |= (1 << (x - 3));
    }
}

bool32 sub_8069D34(s16 x, s16 y)
{
    u32 var;
    if (!sub_8069CB8(x, y))
    {
        return FALSE;
    }
    var = VarGet(gUnknown_083763E4[y]) << 16;
    if (((1 << 16) << (x - 3)) & var)
    {
        return TRUE;
    }
    return FALSE;
}

void SetSootopolisGymCrackedIceMetatiles(void)
{
    s32 x, y;
    s32 width = gMapHeader.mapLayout->width;
    s32 height = gMapHeader.mapLayout->height;
    for (x = 0; x < width; x++)
    {
        for (y = 0; y < height; y++)
        {
            if (sub_8069D34(x, y) == TRUE)
            {
                MapGridSetMetatileIdAt(x + 7, y + 7, 0x20e);
            }
        }
    }
}

void PerStepCallback_8069DD4(u8 taskId)
{
    s16 x, y;
    u16 tileBehavior;
    u16 *var;
    s16 *data = gTasks[taskId].data;
    switch (data[1])
    {
        case 0:
            PlayerGetDestCoords(&x, &y);
            data[2] = x;
            data[3] = y;
            data[1] = 1;
            break;
        case 1:
            PlayerGetDestCoords(&x, &y);
            if (x != data[2] || y != data[3])
            {
                data[2] = x;
                data[3] = y;
                tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
                var = GetVarPointer(VAR_ICE_STEP_COUNT);
                if (MetatileBehavior_IsThinIce(tileBehavior) == TRUE)
                {
                    (*var)++;
                    data[6] = 4;
                    data[1] = 2;
                    data[4] = x;
                    data[5] = y;
                }
                else if (MetatileBehavior_IsCrackedIce(tileBehavior) == TRUE)
                {
                    *var = 0;
                    data[6] = 4;
                    data[1] = 3;
                    data[4] = x;
                    data[5] = y;
                }
            }
            break;
        case 2:
            if (data[6] != 0)
            {
                data[6]--;
            }
            else
            {
                x = data[4];
                y = data[5];
                PlaySE(SE_RU_BARI);
                MapGridSetMetatileIdAt(x, y, 0x20e);
                CurrentMapDrawMetatileAt(x, y);
                sub_8069CFC(x - 7, y - 7);
                data[1] = 1;
            }
            break;
        case 3:
            if (data[6] != 0)
            {
                data[6]--;
            }
            else
            {
                x = data[4];
                y = data[5];
                PlaySE(SE_RU_GASYAN);
                MapGridSetMetatileIdAt(x, y, 0x206);
                CurrentMapDrawMetatileAt(x, y);
                data[1] = 1;
            }
            break;
    }
}

void PerStepCallback_8069F64(u8 taskId)
{
    s16 x, y;
    u16 *var;
    s16 *data = gTasks[taskId].data;
    PlayerGetDestCoords(&x, &y);
    if (x != data[1] || y != data[2])
    {
        data[1] = x;
        data[2] = y;
        if (MetatileBehavior_IsAshGrass(MapGridGetMetatileBehaviorAt(x, y)))
        {
            if (MapGridGetMetatileIdAt(x, y) == 0x20a)
            {
                StartAshFieldEffect(x, y, 0x212, 4);
            }
            else
            {
                StartAshFieldEffect(x, y, 0x206, 4);
            }
            if (CheckBagHasItem(ITEM_SOOT_SACK, 1))
            {
                var = GetVarPointer(VAR_ASH_GATHER_COUNT);
                if (*var < 9999)
                {
                    (*var)++;
                }
            }
        }
    }
}

void sub_806A040(s16 x, s16 y)
{
    MapGridSetMetatileIdAt(x, y, MapGridGetMetatileIdAt(x, y) == 0x22f ? 0x206 : 0x237);
    CurrentMapDrawMetatileAt(x, y);
}

void PerStepCallback_806A07C(u8 taskId)
{
    s16 x, y;
    u16 behavior;
    s16 *data = gTasks[taskId].data;
    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);
    if (data[4] != 0 && (--data[4]) == 0)
    {
        sub_806A040(data[5], data[6]);
    }
    if (data[7] != 0 && (--data[7]) == 0)
    {
        sub_806A040(data[8], data[9]);
    }
    if (MetatileBehavior_IsCrackedFloorHole(behavior))
    {
        VarSet(VAR_ICE_STEP_COUNT, 0); // this var does double duty
    }
    if ((x != data[2] || y != data[3]))
    {
        data[2] = x;
        data[3] = y;
        if (MetatileBehavior_IsCrackedFloor(behavior))
        {
            if (GetPlayerSpeed() != 4)
            {
                VarSet(VAR_ICE_STEP_COUNT, 0); // this var does double duty
            }
            if (data[4] == 0)
            {
                data[4] = 3;
                data[5] = x;
                data[6] = y;
            }
            else if (data[7] == 0)
            {
                data[7] = 3;
                data[8] = x;
                data[9] = y;
            }
        }
    }
}

static const u16 sMuddySlopeAnimationMetatiles[] = {0xe8, 0xeb, 0xea, 0xe9};

static void SetMuddySlopeAnimatedMetatile(s16 *counter, s16 x, s16 y)
{
    u16 tile;
    if (--(*counter) == 0)
        tile = 0xe8;
    else
        tile = sMuddySlopeAnimationMetatiles[*counter / 8];

    MapGridSetMetatileIdAt(x, y, tile);
    CurrentMapDrawMetatileAt(x, y);

    // Immediately set the metatile back to the original muddy slope metatile
    // but don't actualy draw it on the screen. This is so the underlying metatile
    // behvior on the map is not changed.
    MapGridSetMetatileIdAt(x, y, 0xe8);
}

// Checks for the player traversing on muddy slope metatiles.
// When the player walks or slides on one, it executes a short animation to
// make it look like a small mudslide. A maximum of 4 mudslide animations can
// exist simultaneously.
void Task_MuddySlope(u8 taskId)
{
    s16 x, y, x2, y2;
    int i;
    u16 mapIndices;
    s16 *data = gTasks[taskId].data;
    PlayerGetDestCoords(&x, &y);
    mapIndices = (gSaveBlock1.location.mapGroup << 8) | gSaveBlock1.location.mapNum;
    switch (data[1])
    {
        case 0:
            data[0] = mapIndices;
            data[2] = x;
            data[3] = y;
            data[1] = 1;
            data[4] = 0;
            data[7] = 0;
            data[10] = 0;
            data[13] = 0;
            break;
        case 1:
            if (data[2] != x || data[3] != y)
            {
                data[2] = x;
                data[3] = y;
                if (MetatileBehavior_IsMuddySlope(MapGridGetMetatileBehaviorAt(x, y)))
                {
                    for (i = 4; i < 14; i += 3)
                    {
                        if (data[i] == 0)
                        {
                            data[i] = 32;
                            data[i + 1] = x;
                            data[i + 2] = y;
                            break;
                        }
                    }
                }
            }
            break;
    }

    if (gCamera.field_0 && mapIndices != data[0])
    {
        data[0] = mapIndices;
        x2 = gCamera.x;
        y2 = gCamera.y;
    }
    else
    {
        x2 = 0;
        y2 = 0;
    }

    for (i = 4; i < 14; i += 3)
    {
        if (data[i])
        {
            data[i + 1] -= x2;
            data[i + 2] -= y2;
            SetMuddySlopeAnimatedMetatile(&data[i], data[i + 1], data[i + 2]);
        }
    }
}
