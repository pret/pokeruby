#if DEBUG

#include "global.h"
#include "debug.h"
#include "constants/items.h"
#include "mystery_event_script.h"

extern const u8 gUnknown_Debug_845DAE1[];
extern const u8 gUnknown_Debug_845DAE1End[];

size_t debug_sub_813C404(void * dest)
{
    size_t size = gUnknown_Debug_845DAE1End - gUnknown_Debug_845DAE1;
    memcpy(dest, gUnknown_Debug_845DAE1, size);
    unref_sub_812620C(dest, gUnknown_Debug_845DAE1);
    return size;
}

extern const u8 gUnknown_Debug_845E3E0[];
extern const u8 gUnknown_Debug_845E3E0End[];

size_t debug_sub_813C430(void * dest)
{
    size_t size = gUnknown_Debug_845E3E0End - gUnknown_Debug_845E3E0;
    memcpy(dest, gUnknown_Debug_845E3E0, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E3E0);
    return size;
}

extern const u8 gUnknown_Debug_845E422[];
extern const u8 gUnknown_Debug_845E422End[];

size_t debug_sub_813C45C(void * dest)
{
    size_t size = gUnknown_Debug_845E422End - gUnknown_Debug_845E422;
    memcpy(dest, gUnknown_Debug_845E422, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E422);
    return size;
}

extern const u8 gUnknown_Debug_845E402[];
extern const u8 gUnknown_Debug_845E402End[];

size_t debug_sub_813C488(void * dest)
{
    size_t size = gUnknown_Debug_845E402End - gUnknown_Debug_845E402;
    memcpy(dest, gUnknown_Debug_845E402, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E402);
    return size;
}

extern const u8 gUnknown_Debug_845E606[];
extern const u8 gUnknown_Debug_845E606End[];

size_t debug_sub_813C4B4(void * dest)
{
    size_t size = gUnknown_Debug_845E606End - gUnknown_Debug_845E606;
    memcpy(dest, gUnknown_Debug_845E606, size);
    return size;
}

extern const u8 gUnknown_Debug_845E619[];
extern const u8 gUnknown_Debug_845E619End[];

size_t debug_sub_813C4D4(void * dest)
{
    size_t size = gUnknown_Debug_845E619End - gUnknown_Debug_845E619;
    memcpy(dest, gUnknown_Debug_845E619, size);
    unref_sub_81261B4(dest, gUnknown_Debug_845E619);
    return size;
}

extern const u8 gUnknown_Debug_845E712[];
extern const u8 gUnknown_Debug_845E712End[];

size_t debug_sub_813C500(void * dest)
{
    size_t size = gUnknown_Debug_845E712End - gUnknown_Debug_845E712;
    memcpy(dest, gUnknown_Debug_845E712, size);
    unref_sub_812620C(dest, gUnknown_Debug_845E712);
    return size;
}

extern const u8 gUnknown_Debug_845E797[];
extern const u8 gUnknown_Debug_845E797End[];
extern const u8 gUnknown_Debug_845E7B5[];

size_t debug_sub_813C52C(void * dest, u16 itemId)
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

size_t debug_sub_813C580(void * dest)
{
    return debug_sub_813C52C(dest, ITEM_POTION);
}

size_t debug_sub_813C58C(void * dest)
{
    return debug_sub_813C52C(dest, ITEM_POKE_BALL);
}

size_t debug_sub_813C598(void * dest)
{
    return debug_sub_813C52C(dest, ITEM_CHERI_BERRY);
}

size_t debug_sub_813C5A4(void * dest)
{
    return debug_sub_813C52C(dest, ITEM_TM01_FOCUS_PUNCH);
}

#endif // DEBUG
