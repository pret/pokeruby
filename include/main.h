#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#include "global.h"

typedef void (*MainCallback)(void);
typedef void (*IntrCallback)(void);
typedef void (*IntrFunc)(void);

struct Main
{
    MainCallback callback1;
    MainCallback callback2;

    u32 field_8;

    IntrCallback vblankCallback;
    IntrCallback hblankCallback;
    IntrCallback vcountCallback;
    IntrCallback serialCallback;

    vu16 intrCheck;

    u32 vblankCounter1;
    u32 vblankCounter2;

    u16 heldKeysRaw;           // held keys without L=A remapping
    u16 newKeysRaw;            // newly pressed keys without L=A remapping
    u16 heldKeys;              // held keys with L=A remapping
    u16 newKeys;               // newly pressed keys with L=A remapping
    u16 newAndRepeatedKeys;    // newly pressed keys plus key repeat
    u16 keyRepeatCounter;      // counts down to 0, triggering key repeat
    bool16 watchedKeysPressed; // whether one of the watched keys was pressed
    u16 watchedKeysMask;       // bit mask for watched keys

    u8 objCount;

    struct OamData oamBuffer[128];

    u8 state;

    u8 oamLoadDisabled:1;
};

extern struct Main gMain;

#endif // GUARD_MAIN_H
