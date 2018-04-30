#include "global.h"
#include "gba/flash_internal.h"
#include "gba/m4a_internal.h"
#include "main.h"
#include "intro.h"
#include "link.h"
#include "load_save.h"
#include "m4a.h"
#include "play_time.h"
#include "random.h"
#include "rom3.h"
#include "overworld.h"
#include "rtc.h"
#include "siirtc.h"
#include "sound.h"
#include "scanline_effect.h"

extern struct SoundInfo gSoundInfo;
extern u32 IntrMain[];

static void VBlankIntr(void);
static void HBlankIntr(void);
static void VCountIntr(void);
static void SerialIntr(void);
static void IntrDummy(void);

#ifdef SAPPHIRE
#define GAME_VERSION VERSION_SAPPHIRE
#else
#define GAME_VERSION VERSION_RUBY
#endif

const u8 gGameVersion = GAME_VERSION;

const u8 gGameLanguage = GAME_LANGUAGE;

#if defined(ENGLISH)
const char BuildDateTime[] = "2002 10 15 20:34";
#elif defined(GERMAN)
const char BuildDateTime[] = "$Name: debug-Euro-2003-05-09-A $";
#endif

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

u16 gKeyRepeatStartDelay;
bool8 gLinkTransferringData;
struct Main gMain;
u16 gKeyRepeatContinueDelay;
u8 gSoftResetDisabled;
IntrFunc gIntrTable[INTR_COUNT];
bool8 gLinkVSyncDisabled;
u32 IntrMain_Buffer[0x200];
s8 gPcmDmaCounter;

EWRAM_DATA u8 gSharedMem[0x20000] = {0};
EWRAM_DATA void (**gFlashTimerIntrFunc)(void) = NULL;

static void UpdateLinkAndCallCallbacks(void);
static void InitMainCallbacks(void);
static void CallCallbacks(void);
static void SeedRngWithRtc(void);
static void ReadKeys(void);
static void InitIntrHandlers(void);
static void WaitForVBlank(void);

#define B_START_SELECT (B_BUTTON | START_BUTTON | SELECT_BUTTON)

#ifndef NDEBUG
    #include <stdlib.h> // don't include if not needed.
#endif

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
    InitMapMusic();
    SeedRngWithRtc();

    gSoftResetDisabled = FALSE;

// In Fire Red, AGBPrintInit is called at this spot. For user convenience, I
// opt to initialize the print area here. It is up to the user where they choose
// to print stuff from, as anything else declared is NOT authoritative.
#ifndef NDEBUG
    AGBPrintInit();
    __mb_cur_max = 1; // fix for AGBPrintf
#endif

    if (gFlashMemoryPresent != TRUE)
        SetMainCallback2(NULL);

    gLinkTransferringData = FALSE;

    for (;;)
    {
        ReadKeys();

        if (gSoftResetDisabled == FALSE
         && (gMain.heldKeysRaw & A_BUTTON)
         && (gMain.heldKeysRaw & B_START_SELECT) == B_START_SELECT)
            DoSoftReset();

        if (gLink.sendQueue.count > 1 && sub_8055910() == 1)
        {
            gLinkTransferringData = TRUE;
            UpdateLinkAndCallCallbacks();
            gLinkTransferringData = FALSE;
        }
        else
        {
            gLinkTransferringData = FALSE;
            UpdateLinkAndCallCallbacks();

            if (gLink.recvQueue.count > 1)
            {
                if (sub_80558AC() == 1)
                {
                    gMain.newKeys = 0;
                    gLinkTransferringData = TRUE;
                    UpdateLinkAndCallCallbacks();
                    gLinkTransferringData = FALSE;
                }
            }
        }

        PlayTimeCounter_Update();
        MapMusicMain();
        WaitForVBlank();
    }
}

static void UpdateLinkAndCallCallbacks(void)
{
    gLinkStatus = LinkMain1(&gShouldAdvanceLinkState, gSendCmd, gRecvCmds);
    LinkMain2(&gMain.heldKeys);
    if (!(gLinkStatus & LINK_STAT_RECEIVED_NOTHING) || sub_8055940() != 1)
        CallCallbacks();
}

static void InitMainCallbacks(void)
{
    gMain.vblankCounter1 = 0;
    gMain.vblankCounter2 = 0;
    gMain.callback1 = NULL;
    SetMainCallback2(CB2_InitCopyrightScreenAfterBootup);
}

static void CallCallbacks(void)
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

static void SeedRngWithRtc(void)
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

static void ReadKeys(void)
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

static void InitIntrHandlers(void)
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

static void VBlankIntr(void)
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

static void HBlankIntr(void)
{
    if (gMain.hblankCallback)
        gMain.hblankCallback();

    INTR_CHECK |= INTR_FLAG_HBLANK;
    gMain.intrCheck |= INTR_FLAG_HBLANK;
}

static void VCountIntr(void)
{
    if (gMain.vcountCallback)
        gMain.vcountCallback();

    INTR_CHECK |= INTR_FLAG_VCOUNT;
    gMain.intrCheck |= INTR_FLAG_VCOUNT;
}

static void SerialIntr(void)
{
    if (gMain.serialCallback)
        gMain.serialCallback();

    INTR_CHECK |= INTR_FLAG_SERIAL;
    gMain.intrCheck |= INTR_FLAG_SERIAL;
}

static void IntrDummy(void)
{}

static void WaitForVBlank(void)
{
    gMain.intrCheck &= ~INTR_FLAG_VBLANK;
    VBlankIntrWait();
}

void DoSoftReset(void)
{
    REG_IME = 0;
    m4aSoundVSyncOff();
    ScanlineEffect_Stop();
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
