#include "global.h"
#include "gba/m4a_internal.h"
#include "gba/flash_internal.h"
#include "siirtc.h"
#include "main.h"
#include "rtc.h"
#include "link.h"

extern struct SoundInfo gSoundInfo;
extern u32 gUnknown_3004820;
extern u32 IntrMain[];

void VBlankIntr(void);
void HBlankIntr(void);
void VCountIntr(void);
void SerialIntr(void);
void IntrDummy(void);
void Timer3Intr(void);

const u8 gGameVersion = 2; // Ruby

const u8 gGameLanguage = 2; // English

const char BuildDateTime[] = "2002 10 15 20:34";

const IntrFunc gIntrTableTemplate[] =
{
    SerialIntr, // Serial interrupt
    Timer3Intr, // Timer 3 interrupt
    HBlankIntr, // H-blank interrupt
    VBlankIntr, // V-blank interrupt
    VCountIntr, // V-count interrupt
    IntrDummy,  // Timer 0 interrupt
    IntrDummy,  // Timer 1 interrupt
    IntrDummy,  // Timer 2 interrupt
    IntrDummy,  // DMA 0 interrupt
    IntrDummy,  // DMA 1 interrupt
    IntrDummy,  // DMA 2 interrupt
    IntrDummy,  // DMA 3 interrupt
    IntrDummy,  // Key interrupt
    IntrDummy,  // Game Pak interrupt
};

#define INTR_COUNT ((int)(sizeof(gIntrTableTemplate)/sizeof(IntrFunc)))

COMM_2(u16 gKeyRepeatStartDelay)
COMM_2(u8 gUnknown_3001764)
COMM_4(struct Main gMain)
COMM_2(u16 gKeyRepeatContinueDelay)
COMM_2(u8 gUnknown_3001BB4)
COMM_4(IntrFunc gIntrTable[INTR_COUNT])
COMM_2(bool8 gLinkVSyncDisabled)
COMM_4(u32 IntrMain_Buffer[0x200])
COMM_2(u8 gPcmDmaCounter)

EWRAM_DATA void (*gFlashTimerIntrFunc)(void) = NULL;

extern void sub_800C35C(void);
extern u16 Random(void);
extern void SeedRng(u16);
extern void remove_some_task(void);
extern void c2_copyright_1();
extern u32 sub_80558AC(void);
extern u32 sub_8055910(void);
extern u32 sub_8055940(void);
extern void sound_something(void);
extern void CheckForFlashMemory(void);
extern void sound_sources_off(void);

void UpdateLinkAndCallCallbacks(void);
void InitMainCallbacks(void);
void CallCallbacks(void);
void SetMainCallback2(MainCallback callback);
void SeedRngWithRtc(void);
void InitKeys(void);
void ReadKeys(void);
void InitIntrHandlers(void);
void SetVBlankCallback(IntrCallback callback);
void SetHBlankCallback(IntrCallback callback);
void SetVCountCallback(IntrCallback callback);
void SetSerialCallback(IntrCallback callback);
void WaitForVBlank(void);
void DoSoftReset(void);

#define B_START_SELECT (B_BUTTON | START_BUTTON | SELECT_BUTTON)

void AgbMain()
{
    RegisterRamReset(RESET_ALL);
    REG_WAITCNT = WAITCNT_PREFETCH_ENABLE | WAITCNT_WS0_S_1 | WAITCNT_WS0_N_3;
    InitKeys();
    InitIntrHandlers();
    m4aSoundInit();
    RtcInit();
    CheckForFlashMemory();
    InitMainCallbacks();
    sound_sources_off();
    SeedRngWithRtc();

    gUnknown_3001BB4 = 0;

    if (gUnknown_3004820 != 1)
        SetMainCallback2(0);

    gUnknown_3001764 = 0;

    for (;;)
    {
        ReadKeys();

        if (!gUnknown_3001BB4
         && (gMain.heldKeysRaw & A_BUTTON)
         && (gMain.heldKeysRaw & B_START_SELECT) == B_START_SELECT)
            DoSoftReset();

        if (gLink.sendQueue.count > 1 && sub_8055910() == 1)
        {
            gUnknown_3001764 = 1;
            UpdateLinkAndCallCallbacks();
            gUnknown_3001764 = 0;
        }
        else
        {
            gUnknown_3001764 = 0;
            UpdateLinkAndCallCallbacks();

            if (gLink.recvQueue.count > 1)
            {
                if (sub_80558AC() == 1)
                {
                    gMain.newKeys = 0;
                    gUnknown_3001764 = 1;
                    UpdateLinkAndCallCallbacks();
                    gUnknown_3001764 = 0;
                }
            }
        }

        PlayTimeCounter_Update();
        sound_something();
        WaitForVBlank();
    }
}

void UpdateLinkAndCallCallbacks(void)
{
    gLinkStatus = LinkMain1(&gShouldAdvanceLinkState, gSendCmd, gRecvCmds);
    LinkMain2(&gMain.heldKeys);
    if (!(gLinkStatus & LINK_STAT_RECEIVED_NOTHING) || sub_8055940() != 1)
        CallCallbacks();
}

void InitMainCallbacks(void)
{
    gMain.vblankCounter1 = 0;
    gMain.vblankCounter2 = 0;
    gMain.callback1 = NULL;
    SetMainCallback2(c2_copyright_1);
}

void CallCallbacks(void)
{
    if (gMain.callback1)
        gMain.callback1();

    if (gMain.callback2)
        gMain.callback2();
}

void SetMainCallback2(MainCallback callback)
{
    gMain.callback2 = callback;
    gMain.state = 0;
}

void SeedRngWithRtc(void)
{
    u32 seed = RtcGetMinuteCount();
    seed = (seed >> 16) ^ (seed & 0xFFFF);
    SeedRng(seed);
}

void InitKeys(void)
{
    gKeyRepeatContinueDelay = 5;
    gKeyRepeatStartDelay = 40;

    gMain.heldKeys = 0;
    gMain.newKeys = 0;
    gMain.newAndRepeatedKeys = 0;
    gMain.heldKeysRaw = 0;
    gMain.newKeysRaw = 0;
}

void ReadKeys(void)
{
    u16 keyInput = REG_KEYINPUT ^ KEYS_MASK;
    gMain.newKeysRaw = keyInput & ~gMain.heldKeysRaw;
    gMain.newKeys = gMain.newKeysRaw;
    gMain.newAndRepeatedKeys = gMain.newKeysRaw;

    // BUG: Key repeat won't work when pressing L using L=A button mode
    // because it compares the raw key input with the remapped held keys.
    // Note that newAndRepeatedKeys is never remapped either.

    if (keyInput != 0 && gMain.heldKeys == keyInput)
    {
        gMain.keyRepeatCounter--;

        if (gMain.keyRepeatCounter == 0)
        {
            gMain.newAndRepeatedKeys = keyInput;
            gMain.keyRepeatCounter = gKeyRepeatContinueDelay;
        }
    }
    else
    {
        // If there is no input or the input has changed, reset the counter.
        gMain.keyRepeatCounter = gKeyRepeatStartDelay;
    }

    gMain.heldKeysRaw = keyInput;
    gMain.heldKeys = gMain.heldKeysRaw;

    // Remap L to A if the L=A option is enabled.
    if (gSaveBlock2.optionsButtonMode == 2)
    {
        if (gMain.newKeys & L_BUTTON)
            gMain.newKeys |= A_BUTTON;

        if (gMain.heldKeys & L_BUTTON)
            gMain.heldKeys |= A_BUTTON;
    }

    if (gMain.newKeys & gMain.watchedKeysMask)
        gMain.watchedKeysPressed = TRUE;
}

void InitIntrHandlers(void)
{
    int i;

    for (i = 0; i < INTR_COUNT; i++)
        gIntrTable[i] = gIntrTableTemplate[i];

    DmaCopy32(3, IntrMain, IntrMain_Buffer, sizeof(IntrMain_Buffer));

    INTR_VECTOR = IntrMain_Buffer;

    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    SetSerialCallback(NULL);

    REG_IME = 1;
    REG_IE = INTR_FLAG_VBLANK;
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IE |= INTR_FLAG_VBLANK;
}

void SetVBlankCallback(IntrCallback callback)
{
    gMain.vblankCallback = callback;
}

void SetHBlankCallback(IntrCallback callback)
{
    gMain.hblankCallback = callback;
}

void SetVCountCallback(IntrCallback callback)
{
    gMain.vcountCallback = callback;
}

void SetSerialCallback(IntrCallback callback)
{
    gMain.serialCallback = callback;
}

void VBlankIntr(void)
{
    u16 savedIme;

    if (!gLinkVSyncDisabled)
        LinkVSync();

    savedIme = REG_IME;
    REG_IME = 0;
    m4aSoundVSync();
    REG_IME = savedIme;

    gMain.vblankCounter1++;

    if (gMain.vblankCallback)
        gMain.vblankCallback();

    gMain.vblankCounter2++;

    gPcmDmaCounter = gSoundInfo.pcmDmaCounter;

    m4aSoundMain();
    sub_800C35C();
    Random();

    INTR_CHECK |= INTR_FLAG_VBLANK;
    gMain.intrCheck |= INTR_FLAG_VBLANK;
}

void InitFlashTimer(void)
{
    SetFlashTimerIntr(2, gFlashTimerIntrFunc);
}

void HBlankIntr(void)
{
    if (gMain.hblankCallback)
        gMain.hblankCallback();

    INTR_CHECK |= INTR_FLAG_HBLANK;
    gMain.intrCheck |= INTR_FLAG_HBLANK;
}

void VCountIntr(void)
{
    if (gMain.vcountCallback)
        gMain.vcountCallback();

    INTR_CHECK |= INTR_FLAG_VCOUNT;
    gMain.intrCheck |= INTR_FLAG_VCOUNT;
}

void SerialIntr(void)
{
    if (gMain.serialCallback)
        gMain.serialCallback();

    INTR_CHECK |= INTR_FLAG_SERIAL;
    gMain.intrCheck |= INTR_FLAG_SERIAL;
}

void IntrDummy(void)
{
}

void WaitForVBlank(void)
{
    gMain.intrCheck &= ~INTR_FLAG_VBLANK;
    VBlankIntrWait();
}

void DoSoftReset(void)
{
    REG_IME = 0;
    m4aSoundVSyncOff();
    remove_some_task();
    DmaStop(1);
    DmaStop(2);
    DmaStop(3);
    SiiRtcProtect();
    SoftReset(RESET_ALL);
}

void ClearPokemonCrySongs(void)
{
    CpuFill16(0, gPokemonCrySongs, MAX_POKEMON_CRIES * sizeof(struct PokemonCrySong));
}
