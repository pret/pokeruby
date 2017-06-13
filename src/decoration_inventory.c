//
// Created by Scott Norton on 6/5/17.
//

#include "global.h"
#include "sprite.h"
#include "task.h"
#include "decoration.h"
#include "decoration_inventory.h"

#define DECOR_INV(ptr) {.items = (u8 *)&ptr, .size = sizeof ptr}

struct DecorationInventory const gDecorationInventories[] = {
    DECOR_INV(gSaveBlock1.decorDesk),
    DECOR_INV(gSaveBlock1.decorChair),
    DECOR_INV(gSaveBlock1.decorPlant),
    DECOR_INV(gSaveBlock1.decorOrnament),
    DECOR_INV(gSaveBlock1.decorMat),
    DECOR_INV(gSaveBlock1.decorPoster),
    DECOR_INV(gSaveBlock1.decorDoll),
    DECOR_INV(gSaveBlock1.decorCushion)
};

void ClearDecorationInventory(u8 invIdx)
{
    u8 i;
    for (i=0; i<gDecorationInventories[invIdx].size; i++)
    {
        gDecorationInventories[invIdx].items[i] = DECOR_NONE;
    }
}

void ClearDecorationInventories(void)
{
    u8 i;
    for (i=0; i<8; i++)
    {
        ClearDecorationInventory(i);
    }
}

s8 sub_8133F9C(u8 invIdx)
{
    s8 i;
    for (i=0; i<(s8)gDecorationInventories[invIdx].size; i++)
    {
        if (gDecorationInventories[invIdx].items[i] == DECOR_NONE)
        {
            return i;
        }
    }
    return -1;
}

bool8 sub_8133FE4(u8 decorIdx)
{
    u8 invIdx;
    u8 i;
    invIdx = gDecorations[decorIdx].decor_field_13;
    for (i=0; i<gDecorationInventories[invIdx].size; i++)
    {
        if (gDecorationInventories[invIdx].items[i] == decorIdx)
        {
            return TRUE;
        }
    }
    return FALSE;
}

bool8 IsThereStorageSpaceForDecoration(u8 decorIdx)
{
    u8 invIdx;
    s8 invSlot;
    if (decorIdx == DECOR_NONE)
    {
        return FALSE;
    }
    invIdx = gDecorations[decorIdx].decor_field_13;
    invSlot = sub_8133F9C(invIdx);
    if (invSlot == -1)
    {
        return FALSE;
    }
    gDecorationInventories[invIdx].items[invSlot] = decorIdx;
    return TRUE;
}

bool8 sub_8134074(u8 decorIdx)
{
    u8 invIdx;
    if (decorIdx == DECOR_NONE)
    {
        return FALSE;
    }
    invIdx = gDecorations[decorIdx].decor_field_13;
    if (sub_8133F9C(invIdx) == -1)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 sub_81340A8(u8 decorIdx)
{
    u8 i;
    u8 invIdx;
    i = 0;
    if (decorIdx == DECOR_NONE)
    {
        return FALSE;
    }
    for (i=0; i<gDecorationInventories[gDecorations[decorIdx].decor_field_13].size; i++)
    {
        invIdx = gDecorations[decorIdx].decor_field_13;
        if (gDecorationInventories[invIdx].items[i] == decorIdx)
        {
            gDecorationInventories[invIdx].items[i] = DECOR_NONE;
            sub_8134104(invIdx);
            return TRUE;
        }
    }
    return FALSE;
}

void sub_8134104(u8 invIdx)
{
    u8 i;
    u8 j;
    u8 tmp;
    for (i=0; i<gDecorationInventories[invIdx].size; i++)
    {
        for (j=i+1; j<gDecorationInventories[invIdx].size; j++)
        {
            if (gDecorationInventories[invIdx].items[j] != 0 && (gDecorationInventories[invIdx].items[i] == DECOR_NONE || gDecorationInventories[invIdx].items[i] > gDecorationInventories[invIdx].items[j]))
            {
                tmp = gDecorationInventories[invIdx].items[i];
                gDecorationInventories[invIdx].items[i] = gDecorationInventories[invIdx].items[j];
                gDecorationInventories[invIdx].items[j] = tmp;
            }
        }
    }
}

u8 sub_8134194(u8 invIdx)
{
    u8 i;
    u8 count;
    count = 0;
    for (i=0; i<gDecorationInventories[invIdx].size; i++)
    {
        if (gDecorationInventories[invIdx].items[i] != 0)
        {
            count++;
        }
    }
    return count;
}

u8 sub_81341D4(void)
{
    u8 i;
    u8 count;
    count = 0;
    for (i=0; i<8; i++)
    {
        count += sub_8134194(i);
    }
    return count;
}
