#include "global.h"

extern u8 gUnknown_0202E8E2[];

u8 *GetFlagPointer(u16 id)
{
    if (id == 0)
        return 0;

    if (id < 0x4000)
        return &gSaveBlock1.flags[id / 8];

    return &gUnknown_0202E8E2[(id - 0x4000) / 8];
}

u8 FlagSet(u16 id)
{
    u8 *ptr = GetFlagPointer(id);
    if (ptr)
        *ptr |= 1 << (id & 7);
    return 0;
}

u8 FlagReset(u16 id)
{
    u8 *ptr = GetFlagPointer(id);
    if (ptr)
        *ptr &= ~(1 << (id & 7));
    return 0;
}

bool8 FlagGet(u16 id)
{
    u8 *ptr = GetFlagPointer(id);

    if (!ptr)
        return FALSE;

    if (!(((*ptr) >> (id & 7)) & 1))
        return FALSE;

    return TRUE;
}
