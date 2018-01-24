#if DEBUG
#include "global.h"

// These should be static, uninitialized once it gets decompiled.
#define BSS_DATA __attribute__((section(".bss")))
BSS_DATA u8 gDebug_03000700[4] = {0};
BSS_DATA u8 gDebug_03000704[4] = {0};
BSS_DATA u8 gDebug_03000708[4] = {0};
BSS_DATA u8 gDebug_0300070C = 0;
BSS_DATA u8 gDebug_0300070D = 0;
BSS_DATA u8 gDebug_0300070E = 0;
BSS_DATA u8 gDebug_0300070F = 0;
BSS_DATA u8 gDebug_03000710[13] = {0};
BSS_DATA u8 gDebug_0300071D = 0;
BSS_DATA u8 gDebug_0300071E = 0;
BSS_DATA u8 gDebug_0300071F = 0;
BSS_DATA u8 gDebug_03000720 = 0;
BSS_DATA u8 gDebug_03000721 = 0;

#endif
