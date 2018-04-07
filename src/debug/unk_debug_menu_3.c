#if DEBUG

#include "global.h"
#include "debug.h"
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

#endif // DEBUG
