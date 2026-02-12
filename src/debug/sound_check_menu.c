#include "global.h"
#include "sprite.h"
#include "palette.h"
#include "task.h"
#include "m4a.h"
#include "main.h"
#include "text.h"
#include "menu.h"
#include "constants/songs.h"
#include "title_screen.h"
#include "sound.h"
#include "pokedex_cry_screen.h"

// local task defines
#define tWindowSelected data[0]
#define tBgmIndex data[1]
#define tSeIndex data[2]

// window selections
enum
{
    MUS_WINDOW,
    SE_WINDOW
};

// driver test cry enums
enum
{
    CRY_TEST_VOICE,
    CRY_TEST_VOLUME,
    CRY_TEST_PANPOT,
    CRY_TEST_PITCH,
    CRY_TEST_LENGTH,
    CRY_TEST_RELEASE,
    CRY_TEST_PROGRESS,
    CRY_TEST_CHORUS,
    CRY_TEST_PRIORITY
};

// minmax range enums
enum
{
    MIN,
    MAX
};

extern struct ToneData gCryTable[];
extern struct ToneData gCryTable2[];

static EWRAM_DATA u8 gUnknown_020387B0 = 0;
static EWRAM_DATA u8 gUnknown_020387B1 = 0;
static EWRAM_DATA u8 gUnknown_020387B2 = 0;
static EWRAM_DATA s8 sDriverTestSelection = 0;
static EWRAM_DATA int sSoundTestParams[9] = {0};
static EWRAM_DATA u8 gUnknown_020387D8 = 0;
static EWRAM_DATA u8 gUnknown_020387D9 = 0;

u16 gSoundTestCryNum;
extern u8 gDexCryScreenState;

struct MusicPlayerInfo *gUnknown_03005D30;

extern struct MusicPlayerInfo gMPlayInfo_BGM;

void Task_InitSoundCheckMenu(u8);
void sub_80BA384(u8);
void sub_80BA65C(u8);
void sub_80BA68C(u8);
void HighlightSelectedWindow(u8);
void PrintSoundNumber(u16, u16, u16);
void sub_80BA79C(const u8 *const, u16, u16);
void Task_DrawDriverTestMenu(u8);
void Task_ProcessDriverTestInput(u8);
void AdjustSelectedDriverParam(s8);
void PrintDriverTestMenuText(void);
void sub_80BAE10(u8, u8);
void PrintSignedNumber(int, u16, u16, u8);
void sub_80BAF84(u8);
void sub_80BB038(u8);
void sub_80BB1D4(void);
void Task_InitCryTest(u8);
void Task_ProcessCryTestInput(u8);
void PrintCryNumber(void);

void CB2_SoundCheckMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void VBlankCB_SoundCheckMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    if (gUnknown_020387B0 != 0)
    {
        m4aSoundMain();
        m4aSoundMain();
        m4aSoundMain();
    }
}

// unused
void CB2_StartSoundCheckMenu(void)
{
    u8 taskId;

    SetVBlankCallback(NULL);
    REG_DISPCNT = 0;
    REG_BG2CNT = 0;
    REG_BG1CNT = 0;
    REG_BG0CNT = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);
    ResetPaletteFade();
    ResetTasks();
    ResetSpriteData();
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
    InitMenuWindow(&gMenuTextWindowTemplate);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    REG_WIN0H = WIN_RANGE(0, 0);
    REG_WIN0V = WIN_RANGE(0, 0);
    REG_WIN1H = WIN_RANGE(0, 0);
    REG_WIN1V = WIN_RANGE(0, 0);
    REG_WININ = 0x1111;
    REG_WINOUT = 0x31;
    REG_BLDCNT = 0xE1;
    REG_BLDALPHA = 0;
    REG_BLDY = 7;
    REG_IE = 1; // could be a typo of REG_IME
    REG_IE |= 1;
    REG_DISPSTAT |= 8;
    SetVBlankCallback(VBlankCB_SoundCheckMenu);
    SetMainCallback2(CB2_SoundCheckMenu);
    REG_DISPCNT = 0x7140;
    taskId = CreateTask(Task_InitSoundCheckMenu, 0);
    gTasks[taskId].tWindowSelected = MUS_WINDOW;
    gTasks[taskId].tBgmIndex = 0;
    gTasks[taskId].tSeIndex = 0;
    gTasks[taskId].data[3] = 0;
    gUnknown_020387B0 = 0;
    gTasks[taskId].data[3] = 0; // why?
    m4aSoundInit();
}

void Task_InitSoundCheckMenu(u8 taskId)
{
    u8 soundcheckStr[] = DTR("サウンドチェック", "SOUND CHECK");
    u8 bgmStr[] = _("BGM");
    u8 seStr[] = _("SE ");
    u8 abDescStr[] = DTR("A‥さいせい　B‥おわり", "A PLAY  B STOP");
    u8 upDownStr[] = _("L‥UP R‥DOWN");
    u8 driverStr[] = _("R‥DRIVER-TEST");

    if (!gPaletteFade.active)
    {
        Menu_DrawStdWindowFrame(2, 0, 27, 3);
        Menu_DrawStdWindowFrame(2, 5, 27, 10);
        Menu_DrawStdWindowFrame(2, 12, 27, 17);
        Menu_PrintText(soundcheckStr, 4, 1);
        Menu_PrintText(abDescStr, 14, 1);
        Menu_PrintText(bgmStr, 4, 6);
        Menu_PrintText(upDownStr, 14, 6);
        Menu_PrintText(seStr, 4, 13);
        Menu_PrintText(upDownStr, 14, 13);
        Menu_PrintText(driverStr, 14, 18);
        gTasks[taskId].func = sub_80BA384;
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);
    }
}

// ideally this should be a multi Coords8 struct, but it wont match when its treated like a struct.
static const u8 gUnknown_083D0300[] = { 1, 1, 1, 3, 1, 5, 1, 7, 1, 9, 1, 11, 1, 13, 1, 15, 1, 17 };

static const u8 *const gBGMNames[];
static const u8 *const gSENames[];

void sub_80BA384(u8 taskId) // Task_HandleDrawingSoundCheckMenuText
{
    HighlightSelectedWindow(gTasks[taskId].tWindowSelected);
    PrintSoundNumber(gTasks[taskId].tBgmIndex + MUS_STOP, 7, 8); // print by BGM index
    sub_80BA79C(gBGMNames[gTasks[taskId].tBgmIndex], 11, 8);
    PrintSoundNumber(gTasks[taskId].tSeIndex, 7, 15);
    sub_80BA79C(gSENames[gTasks[taskId].tSeIndex], 11, 15);
    gTasks[taskId].func = sub_80BA65C;
}

bool8 Task_ProcessSoundCheckMenuInput(u8 taskId)
{
    if (JOY_NEW(R_BUTTON)) // driver test
    {
        gTasks[taskId].func = Task_DrawDriverTestMenu;
    }
    else if (JOY_NEW(L_BUTTON))
    {
        gTasks[taskId].func = sub_80BAF84;
    }
    else if (JOY_NEW(START_BUTTON))
    {
        gTasks[taskId].func = Task_InitCryTest;
    }
    else if (JOY_NEW(A_BUTTON))
    {
        if (gTasks[taskId].tWindowSelected != 0) // is playing?
        {
            if (gTasks[taskId].data[4] != 0)
            {
                if (gTasks[taskId].tSeIndex != 0)
                {
                    m4aSongNumStop(gTasks[taskId].data[4]);
                    m4aSongNumStart(gTasks[taskId].tSeIndex);
                    gTasks[taskId].data[4] = gTasks[taskId].tSeIndex;
                }
                else
                {
                    m4aSongNumStop(gTasks[taskId].data[4]);
                    gTasks[taskId].data[4] = 0;
                }
            }
            else if (gTasks[taskId].tSeIndex != 0)
            {
                m4aSongNumStart(gTasks[taskId].tSeIndex);
                gTasks[taskId].data[4] = gTasks[taskId].tSeIndex;
            }
        }
        else
        {
            if (gTasks[taskId].data[3] != 0)
            {
                if (gTasks[taskId].tBgmIndex != 0)
                {
                    m4aSongNumStop(gTasks[taskId].data[3] + MUS_STOP);
                    m4aSongNumStart(gTasks[taskId].tBgmIndex + MUS_STOP);
                    gTasks[taskId].data[3] = gTasks[taskId].tBgmIndex;
                }
                else
                {
                    m4aSongNumStop(gTasks[taskId].data[3] + MUS_STOP);
                    gTasks[taskId].data[3] = 0;
                }
            }
            else if (gTasks[taskId].tBgmIndex != 0)
            {
                m4aSongNumStart(gTasks[taskId].tBgmIndex + MUS_STOP);
                gTasks[taskId].data[3] = gTasks[taskId].tBgmIndex;
            }
        }
    }
    else if (JOY_NEW(B_BUTTON))
    {
        m4aSongNumStart(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskId].func = sub_80BA68C;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        gTasks[taskId].tWindowSelected ^= 1;
        return TRUE;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        gTasks[taskId].tWindowSelected ^= 1;
        return TRUE;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        if (gTasks[taskId].tWindowSelected != 0)
        {
            if (gTasks[taskId].tSeIndex > 0)
                gTasks[taskId].tSeIndex--;
            else
                gTasks[taskId].tSeIndex = 247;
        }
        else
        {
            if (gTasks[taskId].tBgmIndex > 0)
                gTasks[taskId].tBgmIndex--;
            else
                gTasks[taskId].tBgmIndex = 117;
        }
        return TRUE;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if (gTasks[taskId].tWindowSelected != 0)
        {
            if (gTasks[taskId].tSeIndex < 247)
                gTasks[taskId].tSeIndex++;
            else
                gTasks[taskId].tSeIndex = 0;
        }
        else
        {
            if (gTasks[taskId].tBgmIndex < 117)
                gTasks[taskId].tBgmIndex++;
            else
                gTasks[taskId].tBgmIndex = 0;
        }
        return TRUE;
    }
    else if (JOY_HELD(SELECT_BUTTON))
    {
        gUnknown_020387B0 = 1;
    }
    else
    {
        gUnknown_020387B0 = 0;
    }
    return FALSE;
}

void sub_80BA65C(u8 taskId)
{
    if (Task_ProcessSoundCheckMenuInput(taskId) != FALSE)
        gTasks[taskId].func = sub_80BA384;
}

void sub_80BA68C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(CB2_InitTitleScreen);
    }
}

void HighlightSelectedWindow(u8 windowType)
{
    switch (windowType)
    {
    case MUS_WINDOW:
    default:
        REG_WIN1H = WIN_RANGE(17, 223);
        REG_WIN1V = WIN_RANGE(41, 87);
        break;
    case SE_WINDOW:
        REG_WIN1H = WIN_RANGE(17, 223);
        REG_WIN1V = WIN_RANGE(97, 143);
        break;
    }
}

void PrintSoundNumber(u16 soundIndex, u16 x, u16 y) // PrintSoundNumber ?
{
    u8 i;
    u8 str[5];
    bool8 someBool;
    u8 divisorValue;

    for (i = 0; i < 3; i++)
        str[i] = 0; // initialize array

    str[3] = CHAR_ELLIPSIS;
    str[4] = EOS;
    someBool = FALSE;

    divisorValue = soundIndex / 100;
    if (divisorValue)
    {
        str[0] = divisorValue + CHAR_0;
        someBool = TRUE;
    }

    divisorValue = (soundIndex % 100) / 10;
    if (divisorValue || someBool)
        str[1] = divisorValue + CHAR_0;

    str[2] = ((soundIndex % 100) % 10) + CHAR_0;
    Menu_PrintText(str, x, y);
}

void sub_80BA79C(const u8 *const string, u16 x, u16 y)
{
    u8 i;
    u8 str[11];

    for (i = 0; i <= 10; i++)
        str[i] = 0; // format string.

    str[10] = EOS; // the above for loop formats the last element of the array unnecessarily.

    for (i = 0; string[i] != EOS && i < 10; i++)
        str[i] = string[i];

    Menu_PrintText(str, x, y);
}

void Task_DrawDriverTestMenu(u8 taskId) // Task_DrawDriverTestMenu
{
    u8 bbackStr[] = DTR("Bぼたんで　もどる", "B BUTTON: BACK");
    u8 aplayStr[] = DTR("Aぼたんで　さいせい", "A BUTTON: PLAY");
    u8 voiceStr[] = _("VOICE‥‥‥‥");
    u8 volumeStr[] = _("VOLUME‥‥‥");
    u8 panpotStr[] = _("PANPOT‥‥‥");
    u8 pitchStr[] = _("PITCH‥‥‥‥");
    u8 lengthStr[] = _("LENGTH‥‥‥");
    u8 releaseStr[] = _("RELEASE‥‥");
    u8 progressStr[] = _("PROGRESS‥");
    u8 chorusStr[] = _("CHORUS‥‥‥");
    u8 priorityStr[] = _("PRIORITY‥");
    u8 playingStr[] = DTR("さいせいちゆう‥", "PLAYING"); // 再生中 (playing)
    u8 reverseStr[] = DTR("はんてん‥‥‥‥", "REVERSE"); // 反転 (reverse)
    u8 stereoStr[] = DTR("すてれお‥‥‥‥", "STEREO"); // stereo

    REG_DISPCNT = 0x3140;
    Menu_DrawStdWindowFrame(0, 0, 29, 19);
    Menu_PrintText(bbackStr, 19, 4);
    Menu_PrintText(aplayStr, 19, 2);
    Menu_PrintText(voiceStr, 2, 1);
    Menu_PrintText(volumeStr, 2, 3);
    Menu_PrintText(panpotStr, 2, 5);
    Menu_PrintText(pitchStr, 2, 7);
    Menu_PrintText(lengthStr, 2, 9);
    Menu_PrintText(releaseStr, 2, 11);
    Menu_PrintText(progressStr, 2, 13);
    Menu_PrintText(chorusStr, 2, 15);
    Menu_PrintText(priorityStr, 2, 17);
    Menu_PrintText(playingStr, 19, 16);
    Menu_PrintText(reverseStr, 19, 14);
    Menu_PrintText(stereoStr, 19, 12);
    REG_WIN0H = WIN_RANGE(0, DISPLAY_WIDTH);
    REG_WIN0V = WIN_RANGE(0, DISPLAY_HEIGHT);
    sDriverTestSelection = 0;
    gUnknown_020387B1 = 0;
    gUnknown_020387B2 = 0;
    gUnknown_03005D30 = NULL;
    gUnknown_020387D8 = 0;
    gUnknown_020387D9 = 1;
    sSoundTestParams[CRY_TEST_VOICE] = 0;
    sSoundTestParams[CRY_TEST_VOLUME] = 120;
    sSoundTestParams[CRY_TEST_PANPOT] = 0;
    sSoundTestParams[CRY_TEST_PITCH] = 15360;
    sSoundTestParams[CRY_TEST_LENGTH] = 180;
    sSoundTestParams[CRY_TEST_PROGRESS] = 0;
    sSoundTestParams[CRY_TEST_RELEASE] = 0;
    sSoundTestParams[CRY_TEST_CHORUS] = 0;
    sSoundTestParams[CRY_TEST_PRIORITY] = 2;
    PrintDriverTestMenuText();
    sub_80BAE10(0, 0);
    gTasks[taskId].func = Task_ProcessDriverTestInput;
}

void Task_ProcessDriverTestInput(u8 taskId)
{
    if (JOY_NEW(B_BUTTON))
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);
        Menu_EraseWindowRect(0, 0, 29, 19);
        gTasks[taskId].func = Task_InitSoundCheckMenu;
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_UP) // _080BAAA8
    {
        u8 old = sDriverTestSelection;

        if(--sDriverTestSelection < 0)
            sDriverTestSelection = 8;
        sub_80BAE10(old, sDriverTestSelection);
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_DOWN) // _080BAAD0
    {
        u8 old = sDriverTestSelection;

        if(++sDriverTestSelection > 8)
            sDriverTestSelection = 0;
        sub_80BAE10(old, sDriverTestSelection);
        return;
    }
    if (JOY_NEW(START_BUTTON)) // _080BAAF8
    {
        gUnknown_020387D8 ^= 1;
        PrintDriverTestMenuText();
        return;
    }
    if (JOY_NEW(SELECT_BUTTON)) // _080BAB14
    {
        gUnknown_020387D9 ^= 1;
        PrintDriverTestMenuText();
        SetPokemonCryStereo(gUnknown_020387D9);
        return;
    }
    if (gMain.newAndRepeatedKeys & R_BUTTON) // _080BAB38
    {
        AdjustSelectedDriverParam(10);
        PrintDriverTestMenuText();
        return;
    }
    if (gMain.newAndRepeatedKeys & L_BUTTON) // _080BAB46
    {
        AdjustSelectedDriverParam(-10);
        PrintDriverTestMenuText();
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_LEFT) // _080BAB56
    {
        AdjustSelectedDriverParam(-1);
        PrintDriverTestMenuText();
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT) // _080BAB64
    {
        AdjustSelectedDriverParam(1);
        PrintDriverTestMenuText();
        return;
    }
    if (JOY_NEW(A_BUTTON)) // _080BAB78
    {
        u8 divide, remaining;

        SetPokemonCryVolume(sSoundTestParams[CRY_TEST_VOLUME]);
        SetPokemonCryPanpot(sSoundTestParams[CRY_TEST_PANPOT]);
        SetPokemonCryPitch(sSoundTestParams[CRY_TEST_PITCH]);
        SetPokemonCryLength(sSoundTestParams[CRY_TEST_LENGTH]);
        SetPokemonCryProgress(sSoundTestParams[CRY_TEST_PROGRESS]);
        SetPokemonCryRelease(sSoundTestParams[CRY_TEST_RELEASE]);
        SetPokemonCryChorus(sSoundTestParams[CRY_TEST_CHORUS]);
        SetPokemonCryPriority(sSoundTestParams[CRY_TEST_PRIORITY]);

        remaining = sSoundTestParams[CRY_TEST_VOICE] % 128;
        divide = sSoundTestParams[CRY_TEST_VOICE] / 128;

        switch (divide)
        {
        case 0:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&gCryTable2[(128 * 0) + remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&gCryTable[(128 * 0) + remaining]);
            break;
        case 1:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&gCryTable2[(128 * 1) + remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&gCryTable[(128 * 1) + remaining]);
            break;
        case 2:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&gCryTable2[(128 * 2) + remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&gCryTable[(128 * 2) + remaining]);
            break;
        case 3:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&gCryTable2[(128 * 3) + remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&gCryTable[(128 * 3) + remaining]);
            break;
        }
    }

    // _080BACA2
    if (gUnknown_03005D30 != NULL)
    {
        gUnknown_020387B1 = IsPokemonCryPlaying(gUnknown_03005D30);

        if (gUnknown_020387B1 != gUnknown_020387B2)
            PrintDriverTestMenuText();

        gUnknown_020387B2 = gUnknown_020387B1;
    }
}

void AdjustSelectedDriverParam(s8 delta)
{
    // also ideally should be a MinMax struct, but any attempt to make this into a struct causes it to not match due to the weird multi dim access.
    int paramRanges[] =
    {
        0, 387,         // Voice
        0, 127,         // Volume
        -127, 127,      // Panpot
        -128, 32639,    // Pitch
        0, 65535,       // Length
        0, 255,         // Release
        0, 65535,       // Progress
        -64, 63         // Chorus
                        // Priority??? Why is it missing?
    };

    sSoundTestParams[sDriverTestSelection] += delta;

    if (sSoundTestParams[sDriverTestSelection] > paramRanges[MULTI_DIM_ARR(sDriverTestSelection, B_16, MAX)])
        sSoundTestParams[sDriverTestSelection] = paramRanges[MULTI_DIM_ARR(sDriverTestSelection, B_16, MIN)];

    if (sSoundTestParams[sDriverTestSelection] < paramRanges[MULTI_DIM_ARR(sDriverTestSelection, B_16, MIN)])
        sSoundTestParams[sDriverTestSelection] = paramRanges[MULTI_DIM_ARR(sDriverTestSelection, B_16, MAX)];
}

void PrintDriverTestMenuText(void)
{
    PrintSignedNumber(sSoundTestParams[CRY_TEST_VOICE] + 1, 11, 1, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_VOLUME], 11, 3, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_PANPOT], 11, 5, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_PITCH], 11, 7, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_LENGTH], 11, 9, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_RELEASE], 11, 11, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_PROGRESS], 11, 13, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_CHORUS], 11, 15, 5);
    PrintSignedNumber(sSoundTestParams[CRY_TEST_PRIORITY], 11, 17, 5);
    PrintSignedNumber(gUnknown_020387B1, 27, 16, 1);
    PrintSignedNumber(gUnknown_020387D8, 27, 14, 1);
    PrintSignedNumber(gUnknown_020387D9, 27, 12, 1);
}

void sub_80BAE10(u8 var1, u8 var2)
{
    u8 str1[] = _("▶");
    u8 str2[] = _(" ");

    Menu_PrintText(str2, gUnknown_083D0300[MULTI_DIM_ARR(var1, B_16, 0)], gUnknown_083D0300[MULTI_DIM_ARR(var1, B_16, 1)]);
    Menu_PrintText(str1, gUnknown_083D0300[MULTI_DIM_ARR(var2, B_16, 0)], gUnknown_083D0300[MULTI_DIM_ARR(var2, B_16, 1)]);
}

void PrintSignedNumber(int n, u16 x, u16 y, u8 digits)
{
    int powersOfTen[6] =
    {
              1,
             10,
            100,
           1000,
          10000,
         100000
    };
    u8 str[8];
    s8 i;
    s8 negative;
    s8 someVar2;

    for (i = 0; i <= digits; i++)
        str[i] = CHAR_SPACE;
    str[digits + 1] = EOS;

    negative = FALSE;
    if (n < 0)
    {
        n = -n;
        negative = TRUE;
    }

    if (digits == 1)
        someVar2 = TRUE;
    else
        someVar2 = FALSE;

    for (i = digits - 1; i >= 0; i--)
    {
        s8 d = n / powersOfTen[i];

        if (d != 0 || someVar2 || i == 0)
        {
            if (negative && !someVar2)
                str[digits - i - 1] = CHAR_HYPHEN;
            str[digits - i] = CHAR_0 + d;
            someVar2 = TRUE;
        }
        n %= powersOfTen[i];
    }

    Menu_PrintText(str, x, y);
}

static const s8 gUnknown_083D03F8[5] = { 0x3F, 0x00, 0xC0, 0x7F, 0x80 };

void sub_80BAF84(u8 taskId)
{
    u8 seStr[] = _("SE");
    u8 panStr[] = _("PAN");
    u8 playingStr[] = DTR("さいせいちゆう‥", "PLAYING");

    REG_DISPCNT = 0x3140;
    Menu_DrawStdWindowFrame(0, 0, 29, 19);
    Menu_PrintText(seStr, 3, 2);
    Menu_PrintText(panStr, 3, 4);
    Menu_PrintText(playingStr, 3, 8);
    REG_WIN0H = WIN_RANGE(0, DISPLAY_WIDTH);
    REG_WIN0V = WIN_RANGE(0, DISPLAY_HEIGHT);
    sSoundTestParams[CRY_TEST_VOICE] = 1;
    sSoundTestParams[CRY_TEST_PANPOT] = 0;
    sSoundTestParams[CRY_TEST_CHORUS] = 0;
    sSoundTestParams[CRY_TEST_PROGRESS] = 0;
    sSoundTestParams[CRY_TEST_RELEASE] = 0;
    sub_80BB1D4();
    gTasks[taskId].func = sub_80BB038;
}

void sub_80BB038(u8 taskId)
{
    sub_80BB1D4();
    if (sSoundTestParams[CRY_TEST_PROGRESS])
    {
        if (sSoundTestParams[CRY_TEST_RELEASE])
        {
            sSoundTestParams[CRY_TEST_RELEASE]--;
        }
        else // _080BB05C
        {
            s8 panpot = gUnknown_083D03F8[sSoundTestParams[CRY_TEST_PANPOT]];
            if (panpot != -128)
            {
                if (panpot == 127)
                {
                    sSoundTestParams[CRY_TEST_CHORUS] += 2;
                    if (sSoundTestParams[CRY_TEST_CHORUS] < 63)
                        SE12PanpotControl(sSoundTestParams[CRY_TEST_CHORUS]);
                }
            }
            else // _080BB08C
            {
                sSoundTestParams[CRY_TEST_CHORUS] -= 2;
                if (sSoundTestParams[CRY_TEST_CHORUS] > -64)
                    SE12PanpotControl(sSoundTestParams[CRY_TEST_CHORUS]);
            }
        }
    }
     // _080BB0A2
    if (JOY_NEW(B_BUTTON))
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);
        Menu_EraseWindowRect(0, 0, 29, 19);
        gTasks[taskId].func = Task_InitSoundCheckMenu;
        return;
    }
    if (JOY_NEW(A_BUTTON)) // _080BB104
    {
        s8 panpot = gUnknown_083D03F8[sSoundTestParams[CRY_TEST_PANPOT]];
        if (panpot != -128)
        {
            if (panpot == 127)
            {
                PlaySE12WithPanning(sSoundTestParams[CRY_TEST_VOICE], -64);
                sSoundTestParams[CRY_TEST_CHORUS] = -64;
                sSoundTestParams[CRY_TEST_PROGRESS] = 1;
                sSoundTestParams[CRY_TEST_RELEASE] = 30;
                return;
            }
        }
        else // _080BB140
        {
            PlaySE12WithPanning(sSoundTestParams[CRY_TEST_VOICE], 63);
            sSoundTestParams[CRY_TEST_CHORUS] = 63;
            sSoundTestParams[CRY_TEST_PROGRESS] = 1;
            sSoundTestParams[CRY_TEST_RELEASE] = 30;
            return;
        }
        // _080BB154
        PlaySE12WithPanning(sSoundTestParams[CRY_TEST_VOICE], panpot);
        sSoundTestParams[CRY_TEST_PROGRESS] = 0;
        return;
    }
    if (JOY_NEW(L_BUTTON)) // _080BB15E
    {
        sSoundTestParams[CRY_TEST_PANPOT]++;
        if (sSoundTestParams[CRY_TEST_PANPOT] > 4)
            sSoundTestParams[CRY_TEST_PANPOT] = 0;
    }
    if (JOY_NEW(R_BUTTON)) // _080BB176
    {
        sSoundTestParams[CRY_TEST_PANPOT]--;
        if (sSoundTestParams[CRY_TEST_PANPOT] < 0)
            sSoundTestParams[CRY_TEST_PANPOT] = 4;
    }
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT) // _080BB192
    {
        sSoundTestParams[CRY_TEST_VOICE]++;
        if (sSoundTestParams[CRY_TEST_VOICE] > 247)
            sSoundTestParams[CRY_TEST_VOICE] = 0;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT) // _080BB1B0
    {
        sSoundTestParams[CRY_TEST_VOICE]--;
        if (sSoundTestParams[CRY_TEST_VOICE] < 0)
            sSoundTestParams[CRY_TEST_VOICE] = 247;
    }
}

void sub_80BB1D4(void)
{
    u8 lrStr[] = _("  LR");
    u8 rlStr[] = _("  RL");

    PrintSignedNumber(sSoundTestParams[CRY_TEST_VOICE], 7, 2, 3);

    switch (gUnknown_083D03F8[sSoundTestParams[CRY_TEST_PANPOT]])
    {
    case 127:
        Menu_PrintText(lrStr, 7, 4);
        break;
    case -128:
        Menu_PrintText(rlStr, 7, 4);
        break;
    default:
        PrintSignedNumber(gUnknown_083D03F8[sSoundTestParams[CRY_TEST_PANPOT]], 7, 4, 3);
        break;
    }
    PrintSignedNumber(IsSEPlaying(), 12, 8, 1);
}

#define SOUND_LIST_BGM \
	X(MUS_STOP, "STOP") \
	X(MUS_LITTLEROOT_TEST, "TETSUJI") \
	X(MUS_GSC_ROUTE38, "FIELD13") \
	X(MUS_CAUGHT, "KACHI22") \
	X(MUS_VICTORY_WILD, "KACHI2") \
	X(MUS_VICTORY_GYM_LEADER, "KACHI3") \
	X(MUS_VICTORY_LEAGUE, "KACHI5") \
	X(MUS_C_COMM_CENTER, "PCC") \
	X(MUS_GSC_PEWTER, "NIBI") \
	X(MUS_C_VS_LEGEND_BEAST, "SUIKUN") \
	X(MUS_ROUTE101, "DOORO1") \
	X(MUS_ROUTE110, "DOORO-X1") \
	X(MUS_ROUTE120, "DOORO-X3") \
	X(MUS_PETALBURG, "MACHI-S2") \
	X(MUS_OLDALE, "MACHI-S4") \
	X(MUS_GYM, "GIM") \
	X(MUS_SURF, "NAMINORI") \
	X(MUS_PETALBURG_WOODS, "DAN01") \
	X(MUS_LEVEL_UP, "FANFA1") \
	X(MUS_HEAL, "ME-ASA") \
	X(MUS_OBTAIN_BADGE, "ME-BACHI") \
	X(MUS_OBTAIN_ITEM, "FANFA4") \
	X(MUS_EVOLVED, "FANFA5") \
	X(MUS_OBTAIN_TMHM, "ME-WAZA") \
	X(MUS_LILYCOVE_MUSEUM, "BIJYUTU") \
	X(MUS_ROUTE122, "DOORO-X4") \
	X(MUS_OCEANIC_MUSEUM, "FUNE-KAN") \
	X(MUS_EVOLUTION_INTRO, "ME-SHINKA") \
	X(MUS_EVOLUTION, "SHINKA") \
	X(MUS_MOVE_DELETED, "ME-WASURE") \
	X(MUS_ENCOUNTER_GIRL, "SYOUJOEYE") \
	X(MUS_ENCOUNTER_MALE, "BOYEYE") \
	X(MUS_ABANDONED_SHIP, "DAN02") \
	X(MUS_FORTREE, "MACHI-S3") \
	X(MUS_BIRCH_LAB, "ODAMAKI") \
	X(MUS_B_TOWER, "B-TOWER") \
	X(MUS_ENCOUNTER_SWIMMER, "SWIMEYE") \
	X(MUS_CAVE_OF_ORIGIN, "DAN03") \
	X(MUS_OBTAIN_BERRY, "ME-KINOMI") \
	X(MUS_AWAKEN_LEGEND, "ME-TAMA") \
	X(MUS_SLOTS_JACKPOT, "ME-B-BIG") \
	X(MUS_SLOTS_WIN, "ME-B-SMALL") \
	X(MUS_TOO_BAD, "ME-ZANNEN") \
	X(MUS_ROULETTE, "BD-TIME") \
	X(MUS_LINK_CONTEST_P1, "TEST1") \
	X(MUS_LINK_CONTEST_P2, "TEST2") \
	X(MUS_LINK_CONTEST_P3, "TEST3") \
	X(MUS_LINK_CONTEST_P4, "TEST4") \
	X(MUS_ENCOUNTER_RICH, "TEST") \
	X(MUS_VERDANTURF, "GOMACHI0") \
	X(MUS_RUSTBORO, "GOTOWN") \
	X(MUS_POKE_CENTER, "POKECEN") \
	X(MUS_ROUTE104, "NEXTROAD") \
	X(MUS_ROUTE119, "GRANROAD") \
	X(MUS_CYCLING, "CYCLING") \
	X(MUS_POKE_MART, "FRIENDLY") \
	X(MUS_LITTLEROOT, "MISHIRO") \
	X(MUS_MT_CHIMNEY, "TOZAN") \
	X(MUS_ENCOUNTER_FEMALE, "GIRLEYE") \
	X(MUS_LILYCOVE, "MINAMO") \
	X(MUS_ROUTE111, "ASHROAD") \
	X(MUS_HELP, "EVENT0") \
	X(MUS_UNDERWATER, "DEEPDEEP") \
	X(MUS_VICTORY_TRAINER, "KACHI1") \
	X(MUS_TITLE, "TITLE3") \
	X(MUS_INTRO, "DEMO1") \
	X(MUS_ENCOUNTER_MAY, "GIRL-SUP") \
	X(MUS_ENCOUNTER_INTENSE, "HAGESHII") \
	X(MUS_ENCOUNTER_COOL, "KAKKOII") \
	X(MUS_ROUTE113, "KAZANBAI") \
	X(MUS_ENCOUNTER_AQUA, "AQA-0") \
	X(MUS_FOLLOW_ME, "TSURETEK") \
	X(MUS_ENCOUNTER_BRENDAN, "BOY-SUP") \
	X(MUS_EVER_GRANDE, "RAINBOW") \
	X(MUS_ENCOUNTER_SUSPICIOUS, "AYASII") \
	X(MUS_VICTORY_AQUA_MAGMA, "KACHI4") \
	X(MUS_CABLE_CAR, "ROPEWAY") \
	X(MUS_GAME_CORNER, "CASINO") \
	X(MUS_DEWFORD, "HIGHTOWN") \
	X(MUS_SAFARI_ZONE, "SAFARI") \
	X(MUS_VICTORY_ROAD, "C-ROAD") \
	X(MUS_AQUA_MAGMA_HIDEOUT, "AJITO") \
	X(MUS_SAILING, "M-BOAT") \
	X(MUS_MT_PYRE, "M-DUNGON") \
	X(MUS_SLATEPORT, "FINECITY") \
	X(MUS_MT_PYRE_EXTERIOR, "MACHUPI") \
	X(MUS_SCHOOL, "P-SCHOOL") \
	X(MUS_HALL_OF_FAME, "DENDOU") \
	X(MUS_FALLARBOR, "TONEKUSA") \
	X(MUS_SEALED_CHAMBER, "MABOROSI") \
	X(MUS_CONTEST_WINNER, "CON-FAN") \
	X(MUS_CONTEST, "CONTEST0") \
	X(MUS_ENCOUNTER_MAGMA, "MGM0") \
	X(MUS_INTRO_BATTLE, "T-BATTLE") \
	X(MUS_WEATHER_KYOGRE, "OOAME") \
	X(MUS_WEATHER_GROUDON, "HIDERI") \
	X(MUS_SOOTOPOLIS, "RUNECITY") \
	X(MUS_CONTEST_RESULTS, "CON-K") \
	X(MUS_HALL_OF_FAME_ROOM, "EIKOU-R") \
	X(MUS_TRICK_HOUSE, "KARAKURI") \
	X(MUS_ENCOUNTER_TWINS, "HUTAGO") \
	X(MUS_ENCOUNTER_ELITE_FOUR, "SITENNOU") \
	X(MUS_ENCOUNTER_HIKER, "YAMA-EYE") \
	X(MUS_CONTEST_LOBBY, "CONLOBBY") \
	X(MUS_ENCOUNTER_INTERVIEWER, "INTER-V") \
	X(MUS_ENCOUNTER_CHAMPION, "DAIGO") \
	X(MUS_CREDITS, "THANKFOR") \
	X(MUS_END, "END") \
	X(MUS_VS_WILD, "BATTLE27") \
	X(MUS_VS_AQUA_MAGMA, "BATTLE31") \
	X(MUS_VS_TRAINER, "BATTLE20") \
	X(MUS_VS_GYM_LEADER, "BATTLE32") \
	X(MUS_VS_CHAMPION, "BATTLE33") \
	X(MUS_VS_REGI, "BATTLE36") \
	X(MUS_VS_KYOGRE_GROUDON, "BATTLE34") \
	X(MUS_VS_RIVAL, "BATTLE35") \
	X(MUS_VS_ELITE_FOUR, "BATTLE38") \
	X(MUS_VS_AQUA_MAGMA_LEADER, "BATTLE30")

#define SOUND_LIST_SE \
	X(MUS_DUMMY, "STOP") \
	X(SE_USE_ITEM, "KAIFUKU") \
	X(SE_PC_LOGIN, "PC-LOGON") \
	X(SE_PC_OFF, "PC-OFF") \
	X(SE_PC_ON, "PC-ON") \
	X(SE_SELECT, "SELECT") \
	X(SE_WIN_OPEN, "WIN-OPEN") \
	X(SE_WALL_HIT, "WALL-HIT") \
	X(SE_DOOR, "DOOR") \
	X(SE_EXIT, "KAIDAN") \
	X(SE_LEDGE, "DANSA") \
	X(SE_BIKE_BELL, "JITENSYA") \
	X(SE_NOT_EFFECTIVE, "KOUKA-L") \
	X(SE_EFFECTIVE, "KOUKA-M") \
	X(SE_SUPER_EFFECTIVE, "KOUKA-H") \
	X(SE_BALL_OPEN, "BOWA2") \
	X(SE_FAINT, "POKE-DEAD") \
	X(SE_FLEE, "NIGERU") \
	X(SE_SLIDING_DOOR, "JIDO-DOA") \
	X(SE_SHIP, "NAMINORI") \
	X(SE_BANG, "BAN") \
	X(SE_PIN, "PIN") \
	X(SE_BOO, "BOO") \
	X(SE_BALL, "BOWA") \
	X(SE_CONTEST_PLACE, "JYUNI") \
	X(SE_A, "A") \
	X(SE_I, "I") \
	X(SE_U, "U") \
	X(SE_E, "E") \
	X(SE_O, "O") \
	X(SE_N, "N") \
	X(SE_SUCCESS, "SEIKAI") \
	X(SE_FAILURE, "HAZURE") \
	X(SE_EXP, "EXP") \
	X(SE_BIKE_HOP, "JITE-PYOKO") \
	X(SE_SWITCH, "MU-PACHI") \
	X(SE_CLICK, "TK-KASYA") \
	X(SE_FU_ZAKU, "FU-ZAKU") \
	X(SE_CONTEST_CONDITION_LOSE, "FU-ZAKU2") \
	X(SE_LAVARIDGE_FALL_WARP, "FU-ZUZUZU") \
	X(SE_ICE_STAIRS, "RU-GASHIN") \
	X(SE_ICE_BREAK, "RU-GASYAN") \
	X(SE_ICE_CRACK, "RU-BARI") \
	X(SE_FALL, "RU-HYUU") \
	X(SE_UNLOCK, "KI-GASYAN") \
	X(SE_WARP_IN, "TK-WARPIN") \
	X(SE_WARP_OUT, "TK-WARPOUT") \
	X(SE_REPEL, "TU-SAA") \
	X(SE_ROTATING_GATE, "HI-TURUN") \
	X(SE_TRUCK_MOVE, "TRACK-MOVE") \
	X(SE_TRUCK_STOP, "TRACK-STOP") \
	X(SE_TRUCK_UNLOAD, "TRACK-HAIK") \
	X(SE_TRUCK_DOOR, "TRACK-DOOR") \
	X(SE_BERRY_BLENDER, "MOTER") \
	X(SE_CARD, "CARD") \
	X(SE_SAVE, "SAVE") \
	X(SE_BALL_BOUNCE_1, "KON") \
	X(SE_BALL_BOUNCE_2, "KON2") \
	X(SE_BALL_BOUNCE_3, "KON3") \
	X(SE_BALL_BOUNCE_4, "KON4") \
	X(SE_BALL_TRADE, "SUIKOMU") \
	X(SE_BALL_THROW, "NAGERU") \
	X(SE_NOTE_C, "TOY-C") \
	X(SE_NOTE_D, "TOY-D") \
	X(SE_NOTE_E, "TOY-E") \
	X(SE_NOTE_F, "TOY-F") \
	X(SE_NOTE_G, "TOY-G") \
	X(SE_NOTE_A, "TOY-A") \
	X(SE_NOTE_B, "TOY-B") \
	X(SE_NOTE_C_HIGH, "TOY-C1") \
	X(SE_PUDDLE, "MIZU") \
	X(SE_BRIDGE_WALK, "HASHI") \
	X(SE_ITEMFINDER, "DAUGI") \
	X(SE_DING_DONG, "PINPON") \
	X(SE_BALLOON_RED, "FUUSEN1") \
	X(SE_BALLOON_BLUE, "FUUSEN2") \
	X(SE_BALLOON_YELLOW, "FUUSEN3") \
	X(SE_BREAKABLE_DOOR, "TOY-KABE") \
	X(SE_MUD_BALL, "TOY-DANGO") \
	X(SE_FIELD_POISON, "DOKU") \
	X(SE_ESCALATOR, "ESUKA") \
	X(SE_THUNDERSTORM, "T-AME") \
	X(SE_THUNDERSTORM_STOP, "T-AME-E") \
	X(SE_DOWNPOUR, "T-OOAME") \
	X(SE_DOWNPOUR_STOP, "T-OOAME-E") \
	X(SE_RAIN, "T-KOAME") \
	X(SE_RAIN_STOP, "T-KOAME-E") \
	X(SE_THUNDER, "T-KAMI") \
	X(SE_THUNDER2, "T-KAMI2") \
	X(SE_ELEVATOR, "ELEBETA") \
	X(SE_LOW_HEALTH, "HINSI") \
	X(SE_EXP_MAX, "EXPMAX") \
	X(SE_ROULETTE_BALL, "TAMAKORO") \
	X(SE_ROULETTE_BALL2, "TAMAKORO-E") \
	X(SE_TAILLOW_WING_FLAP, "BASABASA") \
	X(SE_SHOP, "REGI") \
	X(SE_CONTEST_HEART, "C-GAJI") \
	X(SE_CONTEST_CURTAIN_RISE, "C-MAKU-U") \
	X(SE_CONTEST_CURTAIN_FALL, "C-MAKU-D") \
	X(SE_CONTEST_ICON_CHANGE, "C-PASI") \
	X(SE_CONTEST_ICON_CLEAR, "C-SYU") \
	X(SE_CONTEST_MONS_TURN, "C-PIKON") \
	X(SE_SHINY, "REAPOKE") \
	X(SE_INTRO_BLAST, "OP-BASYU") \
	X(SE_MUGSHOT, "BT-START") \
	X(SE_APPLAUSE, "DENDOU") \
	X(SE_VEND, "JIHANKI") \
	X(SE_ORB, "TAMA") \
	X(SE_DEX_SCROLL, "Z-SCROLL") \
	X(SE_DEX_PAGE, "Z-PAGE") \
	X(SE_POKENAV_ON, "PN-ON") \
	X(SE_POKENAV_OFF, "PN-OFF") \
	X(SE_DEX_SEARCH, "Z-SEARCH") \
	X(SE_EGG_HATCH, "TAMAGO") \
	X(SE_BALL_TRAY_ENTER, "TB-START") \
	X(SE_BALL_TRAY_BALL, "TB-KON") \
	X(SE_BALL_TRAY_EXIT, "TB-KARA") \
	X(SE_GLASS_FLUTE, "BIDORO") \
	X(SE_M_THUNDERBOLT, "W085") \
	X(SE_M_THUNDERBOLT2, "W085B") \
	X(SE_M_HARDEN, "W231") \
	X(SE_M_NIGHTMARE, "W171") \
	X(SE_M_VITAL_THROW, "W233") \
	X(SE_M_VITAL_THROW2, "W233B") \
	X(SE_M_BUBBLE, "W145") \
	X(SE_M_BUBBLE2, "W145B") \
	X(SE_M_BUBBLE3, "W145C") \
	X(SE_M_RAIN_DANCE, "W240") \
	X(SE_M_CUT, "W015") \
	X(SE_M_STRING_SHOT, "W081") \
	X(SE_M_STRING_SHOT2, "W081B") \
	X(SE_M_ROCK_THROW, "W088") \
	X(SE_M_GUST, "W016") \
	X(SE_M_GUST2, "W016B") \
	X(SE_M_DOUBLE_SLAP, "W003") \
	X(SE_M_DOUBLE_TEAM, "W104") \
	X(SE_M_RAZOR_WIND, "W013") \
	X(SE_M_ICY_WIND, "W196") \
	X(SE_M_THUNDER_WAVE, "W086") \
	X(SE_M_COMET_PUNCH, "W004") \
	X(SE_M_MEGA_KICK, "W025") \
	X(SE_M_MEGA_KICK2, "W025B") \
	X(SE_M_CRABHAMMER, "W152") \
	X(SE_M_JUMP_KICK, "W026") \
	X(SE_M_FLAME_WHEEL, "W172") \
	X(SE_M_FLAME_WHEEL2, "W172B") \
	X(SE_M_FLAMETHROWER, "W053") \
	X(SE_M_FIRE_PUNCH, "W007") \
	X(SE_M_TOXIC, "W092") \
	X(SE_M_SACRED_FIRE, "W221") \
	X(SE_M_SACRED_FIRE2, "W221B") \
	X(SE_M_EMBER, "W052") \
	X(SE_M_TAKE_DOWN, "W036") \
	X(SE_M_BLIZZARD, "W059") \
	X(SE_M_BLIZZARD2, "W059B") \
	X(SE_M_SCRATCH, "W010") \
	X(SE_M_VICEGRIP, "W011") \
	X(SE_M_WING_ATTACK, "W017") \
	X(SE_M_FLY, "W019") \
	X(SE_M_SAND_ATTACK, "W028") \
	X(SE_M_RAZOR_WIND2, "W013B") \
	X(SE_M_BITE, "W044") \
	X(SE_M_HEADBUTT, "W029") \
	X(SE_M_SURF, "W057") \
	X(SE_M_HYDRO_PUMP, "W056") \
	X(SE_M_WHIRLPOOL, "W250") \
	X(SE_M_HORN_ATTACK, "W030") \
	X(SE_M_TAIL_WHIP, "W039") \
	X(SE_M_MIST, "W054") \
	X(SE_M_POISON_POWDER, "W077") \
	X(SE_M_BIND, "W020") \
	X(SE_M_DRAGON_RAGE, "W082") \
	X(SE_M_SING, "W047") \
	X(SE_M_PERISH_SONG, "W195") \
	X(SE_M_PAY_DAY, "W006") \
	X(SE_M_DIG, "W091") \
	X(SE_M_DIZZY_PUNCH, "W146") \
	X(SE_M_SELF_DESTRUCT, "W120") \
	X(SE_M_EXPLOSION, "W153") \
	X(SE_M_ABSORB_2, "W071B") \
	X(SE_M_ABSORB, "W071") \
	X(SE_M_SCREECH, "W103") \
	X(SE_M_BUBBLE_BEAM, "W062") \
	X(SE_M_BUBBLE_BEAM2, "W062B") \
	X(SE_M_SUPERSONIC, "W048") \
	X(SE_M_BELLY_DRUM, "W187") \
	X(SE_M_METRONOME, "W118") \
	X(SE_M_BONEMERANG, "W155") \
	X(SE_M_LICK, "W122") \
	X(SE_M_PSYBEAM, "W060") \
	X(SE_M_FAINT_ATTACK, "W185") \
	X(SE_M_SWORDS_DANCE, "W014") \
	X(SE_M_LEER, "W043") \
	X(SE_M_SWAGGER, "W207") \
	X(SE_M_SWAGGER2, "W207B") \
	X(SE_M_HEAL_BELL, "W215") \
	X(SE_M_CONFUSE_RAY, "W109") \
	X(SE_M_SNORE, "W173") \
	X(SE_M_BRICK_BREAK, "W280") \
	X(SE_M_GIGA_DRAIN, "W202") \
	X(SE_M_PSYBEAM2, "W060B") \
	X(SE_M_SOLAR_BEAM, "W076") \
	X(SE_M_PETAL_DANCE, "W080") \
	X(SE_M_TELEPORT, "W100") \
	X(SE_M_MINIMIZE, "W107") \
	X(SE_M_SKETCH, "W166") \
	X(SE_M_SWIFT, "W129") \
	X(SE_M_REFLECT, "W115") \
	X(SE_M_BARRIER, "W112") \
	X(SE_M_DETECT, "W197") \
	X(SE_M_LOCK_ON, "W199") \
	X(SE_M_MOONLIGHT, "W236") \
	X(SE_M_CHARM, "W204") \
	X(SE_M_CHARGE, "W268") \
	X(SE_M_STRENGTH, "W070") \
	X(SE_M_HYPER_BEAM, "W063") \
	X(SE_M_WATERFALL, "W127") \
	X(SE_M_REVERSAL, "W179") \
	X(SE_M_ACID_ARMOR, "W151") \
	X(SE_M_SANDSTORM, "W201") \
	X(SE_M_TRI_ATTACK, "W161") \
	X(SE_M_TRI_ATTACK2, "W161B") \
	X(SE_M_ENCORE, "W227") \
	X(SE_M_ENCORE2, "W227B") \
	X(SE_M_BATON_PASS, "W226") \
	X(SE_M_MILK_DRINK, "W208") \
	X(SE_M_ATTRACT, "W213") \
	X(SE_M_ATTRACT2, "W213B") \
	X(SE_M_MORNING_SUN, "W234") \
	X(SE_M_FLATTER, "W260") \
	X(SE_M_SAND_TOMB, "W328") \
	X(SE_M_GRASSWHISTLE, "W320") \
	X(SE_M_SPIT_UP, "W255") \
	X(SE_M_DIVE, "W291") \
	X(SE_M_EARTHQUAKE, "W089") \
	X(SE_M_TWISTER, "W239") \
	X(SE_M_SWEET_SCENT, "W230") \
	X(SE_M_YAWN, "W281") \
	X(SE_M_SKY_UPPERCUT, "W327") \
	X(SE_M_STAT_INCREASE, "W287") \
	X(SE_M_HEAT_WAVE, "W257") \
	X(SE_M_UPROAR, "W253") \
	X(SE_M_HAIL, "W258") \
	X(SE_M_COSMIC_POWER, "W322") \
	X(SE_M_TEETER_DANCE, "W298") \
	X(SE_M_STAT_DECREASE, "W287B") \
	X(SE_M_HAZE, "W114") \
	X(SE_M_HYPER_BEAM2, "W063B")

// Create BGM list
#define X(songId, name) static const u8 sBGMName_##songId[] = _(name);
SOUND_LIST_BGM
#undef X

#define X(songId, name) sBGMName_##songId,
static const u8 *const gBGMNames[] =
{
SOUND_LIST_BGM
};
#undef X

// Create SE list
#define X(songId, name) static const u8 sSEName_##songId[] = _(name);
SOUND_LIST_SE
#undef X

#define X(songId, name) sSEName_##songId,
static const u8 *const gSENames[] =
{
SOUND_LIST_SE
};
#undef X

void Task_InitCryTest(u8 taskId)
{
    struct CryScreenWindow cryStruct, cryStruct2;
    u8 zero;

    Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
    InitMenuWindow(&gMenuTextWindowTemplate);
    gSoundTestCryNum = 1;
    ResetSpriteData();
    FreeAllSpritePalettes();

    cryStruct.charBase = 0x2000;
    cryStruct.screenBase = 29;
    cryStruct.paletteNo = 12;
    cryStruct.yPos = 30;
    cryStruct.xPos = 4;

    zero = 0; // wtf?
    gDexCryScreenState = 0;

    while (LoadCryWaveformWindow(&cryStruct, 3) == FALSE)
        ;

    cryStruct2.charBase = 0;
    cryStruct2.screenBase = 15;
    cryStruct2.paletteNo = 13;
    cryStruct2.xPos = 12;
    cryStruct2.yPos = 12;

    zero = 0; // wtf?
    gDexCryScreenState = 0;

    while (ShowPokedexCryScreen(&cryStruct2, 2) == FALSE)
        ;

    Menu_DrawStdWindowFrame(0, 16, 5, 19);
    PrintCryNumber();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG2CNT = 0xF01;
    REG_BG3CNT = 0x1D03;
    REG_DISPCNT = 0x1d40;
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_BGM, 2);
    gTasks[taskId].func = Task_ProcessCryTestInput;
}

void Task_ProcessCryTestInput(u8 taskId)
{
    UpdateCryWaveformWindow(3);

    if (JOY_NEW(A_BUTTON))
    {
        CryScreenPlayButton(gSoundTestCryNum);
    }
    if (JOY_NEW(R_BUTTON))
    {
        StopCryAndClearCrySongs();
    }
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if(--gSoundTestCryNum == 0)
            gSoundTestCryNum = 384; // total species
        PrintCryNumber();
    }
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if(++gSoundTestCryNum > 384)
            gSoundTestCryNum = 1;
        PrintCryNumber();
    }
    if (JOY_NEW(B_BUTTON))
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);
        Menu_EraseWindowRect(0, 0, 29, 19);
        gTasks[taskId].func = Task_InitSoundCheckMenu;
        DestroyCryMeterNeedleSprite();
    }
}

void PrintCryNumber(void)
{
    PrintSignedNumber(gSoundTestCryNum, 1, 17, 3);
}
