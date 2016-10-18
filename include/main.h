#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#include "global.h"

typedef void (*MainCallback)(void);
typedef void (*IntrCallback)(void);
typedef void (*IntrFunc)(void);

struct Main
{
    /*0x00*/ MainCallback callback1;
    /*0x04*/ MainCallback callback2;

    /*0x08*/ MainCallback field_8;

    /*0x0C*/ IntrCallback vblankCallback;
    /*0x10*/ IntrCallback hblankCallback;
    /*0x14*/ IntrCallback vcountCallback;
    /*0x18*/ IntrCallback serialCallback;

    /*0x1C*/ vu16 intrCheck;

    /*0x20*/ u32 vblankCounter1;
    /*0x24*/ u32 vblankCounter2;

    /*0x28*/ u16 heldKeysRaw;           // held keys without L=A remapping
    /*0x2A*/ u16 newKeysRaw;            // newly pressed keys without L=A remapping
    /*0x2C*/ u16 heldKeys;              // held keys with L=A remapping
    /*0x2E*/ u16 newKeys;               // newly pressed keys with L=A remapping
    /*0x30*/ u16 newAndRepeatedKeys;    // newly pressed keys plus key repeat
    /*0x32*/ u16 keyRepeatCounter;      // counts down to 0, triggering key repeat
    /*0x34*/ bool16 watchedKeysPressed; // whether one of the watched keys was pressed
    /*0x36*/ u16 watchedKeysMask;       // bit mask for watched keys

    u8 objCount;

    struct OamData oamBuffer[128];

    /*0x43C*/ u8 state;

    /*0x43D*/ u8 oamLoadDisabled:1;
};

extern u8 gUnknown_3001764;
extern struct Main gMain;
extern u8 gUnknown_3001BB4;
extern bool8 gLinkVSyncDisabled;

extern const u8 gGameVersion;
extern const u8 gGameLanguage;

void SetMainCallback2(MainCallback callback);
void InitKeys(void);
void SetVBlankCallback(IntrCallback callback);
void SetHBlankCallback(IntrCallback callback);
void SetVCountCallback(IntrCallback callback);
void SetSerialCallback(IntrCallback callback);
void InitFlashTimer(void);
void DoSoftReset(void);
void ClearPokemonCrySongs(void);

#endif // GUARD_MAIN_H
