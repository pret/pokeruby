#include "global.h"
#include "decoration.h"
#include "decoration_inventory.h"
#include "sprite.h"
#include "task.h"
#include "constants/decorations.h"

#define DECOR_INV(ptr) {.items = ptr, .size = sizeof ptr}

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

void ClearDecorationInventory(u8 category)
{
    u8 i;
    for (i = 0; i < gDecorationInventories[category].size; i++)
    {
        gDecorationInventories[category].items[i] = DECOR_NONE;
    }
}

void ClearDecorationInventories(void)
{
    u8 i;
    for (i = 0; i < 8; i++)
    {
        ClearDecorationInventory(i);
    }
}

s8 FindFreeDecorationInventorySlot(u8 category)
{
    s8 i;
    for (i = 0; i < (s8)gDecorationInventories[category].size; i++)
    {
        if (gDecorationInventories[category].items[i] == DECOR_NONE)
            return i;
    }

    return -1;
}

bool8 InventoryContainsDecoration(u8 decorationId)
{
    u8 i;
    u8 category = gDecorations[decorationId].category;
    for (i = 0; i < gDecorationInventories[category].size; i++)
    {
        if (gDecorationInventories[category].items[i] == decorationId)
            return TRUE;
    }

    return FALSE;
}

bool8 GiveDecoration(u8 decorationId)
{
    u8 category;
    s8 slot;
    if (decorationId == DECOR_NONE)
        return FALSE;

    category = gDecorations[decorationId].category;
    slot = FindFreeDecorationInventorySlot(category);
    if (slot == -1)
        return FALSE;

    gDecorationInventories[category].items[slot] = decorationId;
    return TRUE;
}

bool8 CheckDecorationInventoryHasSpace(u8 decorationId)
{
    u8 category;
    if (decorationId == DECOR_NONE)
        return FALSE;

    category = gDecorations[decorationId].category;
    if (FindFreeDecorationInventorySlot(category) == -1)
        return FALSE;

    return TRUE;
}

s8 RemoveDecorationFromInventory(u8 decorationId)
{
    u8 category;
    u8 i = 0;
    if (decorationId == DECOR_NONE)
        return FALSE;

    for (i = 0; i < gDecorationInventories[gDecorations[decorationId].category].size; i++)
    {
        category = gDecorations[decorationId].category;
        if (gDecorationInventories[category].items[i] == decorationId)
        {
            gDecorationInventories[category].items[i] = DECOR_NONE;
            SortDecorationInventory(category);
            return TRUE;
        }
    }

    return FALSE;
}

void SortDecorationInventory(u8 category)
{
    u8 i;
    u8 j;
    u8 tmp;
    for (i = 0; i < gDecorationInventories[category].size; i++)
    {
        for (j = i + 1; j < gDecorationInventories[category].size; j++)
        {
            if (gDecorationInventories[category].items[j] != 0 && (gDecorationInventories[category].items[i] == DECOR_NONE || gDecorationInventories[category].items[i] > gDecorationInventories[category].items[j]))
            {
                tmp = gDecorationInventories[category].items[i];
                gDecorationInventories[category].items[i] = gDecorationInventories[category].items[j];
                gDecorationInventories[category].items[j] = tmp;
            }
        }
    }
}

u8 GetNumDecorationsInInventoryCategory(u8 category)
{
    u8 i;
    u8 count = 0;
    for (i = 0; i < gDecorationInventories[category].size; i++)
    {
        if (gDecorationInventories[category].items[i] != DECOR_NONE)
            count++;
    }

    return count;
}

u8 GetNumDecorationsInInventory(void)
{
    u8 i;
    u8 count = 0;
    for (i = 0; i < 8; i++)
        count += GetNumDecorationsInInventoryCategory(i);

    return count;
}

#if DEBUG
void Debug_GiveAllDecorations(void)
{
    u8 decor;

    for (decor = 0; decor < DECOR_COUNT; decor++)
        GiveDecoration(decor);
}
#endif
