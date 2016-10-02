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

    MainCallback field_8;

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
