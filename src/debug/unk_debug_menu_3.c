#include "global.h"
#include "debug.h"
#include "constants/items.h"
#include "mystery_event_script.h"
#include "berry.h"

#if DEBUG

extern const u8 gUnknown_Debug_845DAE1[];
extern const u8 gUnknown_Debug_845DAE1End[];

size_t debug_sub_813C404(u8 * dest)
{
    size_t size = gUnknown_Debug_845DAE1End - gUnknown_Debug_845DAE1;
    memcpy(dest, gUnknown_Debug_845DAE1, size);
    unref_sub_812620C(dest, gUnknown_Debug_845DAE1);
    return size;
}

extern const u8 gUnknown_Debug_845E3E0[];
extern const u8 gUnknown_Debug_845E3E0End[];

size_t debug_sub_813C430(u8 * dest)
{
    size_t size = gUnknown_Debug_845E3E0End - gUnknown_Debug_845E3E0;
    memcpy(dest, gUnknown_Debug_845E3E0, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E3E0);
    return size;
}

extern const u8 gUnknown_Debug_845E422[];
extern const u8 gUnknown_Debug_845E422End[];

size_t debug_sub_813C45C(u8 * dest)
{
    size_t size = gUnknown_Debug_845E422End - gUnknown_Debug_845E422;
    memcpy(dest, gUnknown_Debug_845E422, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E422);
    return size;
}

extern const u8 gUnknown_Debug_845E402[];
extern const u8 gUnknown_Debug_845E402End[];

size_t debug_sub_813C488(u8 * dest)
{
    size_t size = gUnknown_Debug_845E402End - gUnknown_Debug_845E402;
    memcpy(dest, gUnknown_Debug_845E402, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E402);
    return size;
}

extern const u8 gUnknown_Debug_845E606[];
extern const u8 gUnknown_Debug_845E606End[];

size_t debug_sub_813C4B4(u8 * dest)
{
    size_t size = gUnknown_Debug_845E606End - gUnknown_Debug_845E606;
    memcpy(dest, gUnknown_Debug_845E606, size);
    return size;
}

extern const u8 gUnknown_Debug_845E619[];
extern const u8 gUnknown_Debug_845E619End[];

size_t debug_sub_813C4D4(u8 * dest)
{
    size_t size = gUnknown_Debug_845E619End - gUnknown_Debug_845E619;
    memcpy(dest, gUnknown_Debug_845E619, size);
    unref_sub_81261B4(dest, gUnknown_Debug_845E619);
    return size;
}

extern const u8 gUnknown_Debug_845E712[];
extern const u8 gUnknown_Debug_845E712End[];

size_t debug_sub_813C500(u8 * dest)
{
    size_t size = gUnknown_Debug_845E712End - gUnknown_Debug_845E712;
    memcpy(dest, gUnknown_Debug_845E712, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E712);
    return size;
}

extern const u8 gUnknown_Debug_845E797[];
extern const u8 gUnknown_Debug_845E797End[];
extern const u8 gUnknown_Debug_845E7B5[];

size_t debug_sub_813C52C(u8 * dest, u16 itemId)
{
    u8 * ptr;
    size_t size = gUnknown_Debug_845E797End - gUnknown_Debug_845E797;
    memcpy(dest, gUnknown_Debug_845E797, size);
    ptr = gUnknown_Debug_845E7B5 - gUnknown_Debug_845E797 + dest;
    ptr += 3;
    ptr[0] = itemId;
    ptr[1] = itemId >> 8;
    unref_sub_812620C(dest, gUnknown_Debug_845E797);
    return size;
}

size_t debug_sub_813C580(u8 * dest)
{
    return debug_sub_813C52C(dest, ITEM_POTION);
}

size_t debug_sub_813C58C(u8 * dest)
{
    return debug_sub_813C52C(dest, ITEM_POKE_BALL);
}

size_t debug_sub_813C598(u8 * dest)
{
    return debug_sub_813C52C(dest, ITEM_CHERI_BERRY);
}

size_t debug_sub_813C5A4(u8 * dest)
{
    return debug_sub_813C52C(dest, ITEM_TM01_FOCUS_PUNCH);
}

extern const u8 gUnknown_Debug_845DDB2[];
extern const u8 gUnknown_Debug_845DDB2End[];
extern const u8 gUnknown_Debug_845DDD6[];

extern const u8 Str_842E23C[]; //static const u8 Str_842E23C[] = _("ガイブ");

size_t debug_sub_813C5B4(u8 * dest)
{
    u8 * saveBerry = (u8 *)&gSaveBlock1.enigmaBerry;
    u8 * berry = (u8 *)(dest - gUnknown_Debug_845DDB2 + gUnknown_Debug_845DDD6);
    size_t size = gUnknown_Debug_845DDB2End - gUnknown_Debug_845DDB2;
    int i;

    debug_sub_80C2C18(Str_842E23C, 0, 0);

    for (i = 0; i < 0x1000; i++)
        dest[i] = 0;

    for (i = 0; i < size; i++)
        dest[i] = gUnknown_Debug_845DDB2[i];

    for (i = 0; i < sizeof(struct EnigmaBerry); i++)
        berry[i] = saveBerry[i];

    ClearEnigmaBerries();
    unref_sub_81261B4(dest, gUnknown_Debug_845DDB2);
    return size;
}

#endif // DEBUG
