#include "var.h"
#include "global.h"

extern u16 *gSpecialVars[];

u16 *GetVarPointer(u16 id)
{
    if (id < 0x4000)
        return NULL;

    if ((s16)id >= 0)
        return &gSaveBlock1.vars[id - 0x4000];

    return gSpecialVars[id - 0x8000];
}

u16 VarGet(u16 id)
{
    u16 *ptr = GetVarPointer(id);
    if (!ptr)
        return id;
    return *ptr;
}

bool8 VarSet(u16 id, u16 value)
{
    u16 *ptr = GetVarPointer(id);
    if (!ptr)
        return FALSE;
    *ptr = value;
    return TRUE;
}

u8 VarGetFieldObjectGraphicsId(u8 id)
{
    return VarGet(0x4010 + id);
}
