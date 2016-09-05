#include "global.h"
#include "text.h"
#include "sprite.h"
#include "task.h"
#include "main.h"
#include "rtc.h"
#include "songs.h"
#include "palette.h"
#include "string_util.h"

extern u8 sub_8072080(void);
extern void Print(u8 *, u8, u8);
extern void CB2_ContinueSavedGame(void);
extern void CB2_InitMysteryEventMenu(void);
extern void CB2_InitOptionMenu(void);
extern void CB2_InitTitleScreen(void);
extern void FormatPlayTime(u8 *str, u16 hours, u16 minutes, bool16 colon);
extern u8 *sub_8072C74(u8 *, u8 *, u8, u8);
extern u16 GetPokedexSeenCount(void);
extern u8 *sub_8072C14(u8 *, s32, u8, u8);
extern u8 sub_80729D8(u8 *, u8, u16, u8);
extern u8 GetBadgeCount(void);
extern void Task_Birch1(u8);
void AddTextPrinterWithCallbackForMessage(const u8 *string, u8 a, u8 b);
u8 sub_8072CF4(u8 a);
void sub_8072DEC(void);
u8 sub_8075374(void);
void sub_807206C(u32);
void cry_related(u16, u8);
void audio_play(u8 a);
void Reset(u8 a, u8 b, u8 c, u8 d);
u8 GetMenuCursorPos(void);
void DoNamingScreen(u8 r0, struct SaveBlock2 *r1, u16 r2, u16 r3, u8 s0, MainCallback s4);
void sub_8072974(u8 r0, u8 r1, u32 r2);
s8 FillWindowPixelBuffer(void);
void c2_load_new_map_2(void);
void LZ77UnCompVram(const void *src, void *dest);
void sub_8071C4C(const struct WindowConfig *);
void CB2_MainMenu(void);
void VBlankCB_MainMenu(void);
void DecompressPicFromTable_2(const struct SpriteSheet *, u8, u8, void *, void *, u32);
void LoadCompressedObjectPalette(const struct SpritePalette *);
void gpu_pal_obj_decompress_and_apply(u16, u8);
u8 AddNewGameBirchObject(u8, u8, u8);
u8 sub_80859BC(u8, u16, u16, u8, void *);
void DrawDefaultWindow(u8 a, u8 b, u8 c, u8 d);

extern struct PaletteFadeControl gPaletteFade;
extern u8 gSaveFileDeletedMessage[];
extern u8 gSaveFileCorruptMessage[];
extern u8 gBoardNotInstalledMessage[];
extern u8 gBatteryDryMessage[];
extern u16 gSaveFileStatus;
extern u8 gMainMenuString_Continue[];
extern u8 gMainMenuString_NewGame[];
extern u8 gMainMenuString_MysteryEvents[];
extern u8 gMainMenuString_Option[];
extern u8 gMainMenuString_Player[];
extern u8 gMainMenuString_Time[];
extern u8 gMainMenuString_Pokedex[];
extern u8 gMainMenuString_Badges[];

void CB2_MainMenu(void);
void VBlankCB_MainMenu(void);
void CB2_InitMainMenu(void);
static void sub_80096FC(void);
static u32 InitMainMenu(bool8 a1);
static void Task_CheckSave(u8 taskId);
static void Task_WaitForSaveErrorAck(u8 taskId);
static void Task_CheckRtc(u8 taskId);
static void Task_WaitForRtcErrorAck(u8 taskId);
static void Task_DrawMainMenu(u8 taskId);
static void Task_HighlightCurrentMenuItem(u8 taskId);
static bool8 MainMenuProcessKeyInput(u8 taskId);
static void Task_MainMenuProcessKeyInput(u8 taskId);
static void MainMenuPressedA(u8 taskId);
static void MainMenuPressedB(u8 taskId);
static void HighlightCurrentMenuItem(u8, u8);
static void PrintMainMenuItem(u8 *text, u8, u8);
static void PrintSaveFileInfo(void);
static void PrintPlayerName(void);
static void PrintPlayTime(void);
static void PrintPokedexCount(void);
static void PrintBadgeCount(void);

extern u16 gMainMenuPalette[];

void CB2_MainMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void VBlankCB_MainMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_InitMainMenu(void)
{
    InitMainMenu(FALSE);
}

static void sub_80096FC(void)
{
    InitMainMenu(TRUE);
}

u32 InitMainMenu(u8 a1)
{
    u16 savedIme;
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

    DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);

    ResetPaletteFade();
    LoadPalette(gMainMenuPalette, 0, 32);
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    sub_8071C4C(&gWindowConfig_81E6CE4);

    if (a1)
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0x0000); // fade to black
    else
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0xFFFF); // fade to white

    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WININ = 0;
    REG_WINOUT = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;

    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;

    SetVBlankCallback(VBlankCB_MainMenu);
    SetMainCallback2(CB2_MainMenu);

    REG_DISPCNT = DISPCNT_OBJ_1D_MAP
                | DISPCNT_BG0_ON
                | DISPCNT_OBJ_ON
                | DISPCNT_WIN0_ON;

    taskId = CreateTask(Task_CheckSave, 0);
    gTasks[taskId].data[1] = 0;

    return 0;
}

void Task_CheckSave(u8 taskId)
{
    if (gPaletteFade.active)
        return;

    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WININ = 0x1111;
    REG_WINOUT = 49;
    REG_BLDCNT = 241;
    REG_BLDALPHA = 0;
    REG_BLDY = 7;

    switch (gSaveFileStatus)
    {
    case 1:
        if (sub_806918C() == TRUE)
            gTasks[taskId].data[0] = 2;
        else
            gTasks[taskId].data[0] = 1;

        gTasks[taskId].func = Task_CheckRtc;
        break;
    case 2:
        DrawDefaultWindow(2, 14, 27, 19);
        AddTextPrinterWithCallbackForMessage(gSaveFileDeletedMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = Task_WaitForSaveErrorAck;
        break;
    case 255:
        DrawDefaultWindow(2, 14, 27, 19);
        AddTextPrinterWithCallbackForMessage(gSaveFileCorruptMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[0] = 1;
        gTasks[taskId].func = Task_WaitForSaveErrorAck;

        if (sub_806918C() == TRUE)
            gTasks[taskId].data[0] = 2;
        else
            gTasks[taskId].data[0] = 1;
        break;
    case 0:
    default:
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = Task_CheckRtc;
        break;
    case 4:
        DrawDefaultWindow(2, 14, 27, 19);
        AddTextPrinterWithCallbackForMessage(gBoardNotInstalledMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = Task_WaitForSaveErrorAck;
        return;
    }
}

void Task_WaitForSaveErrorAck(u8 taskId)
{
    if (sub_8072080())
    {
        if (gMain.newKeys & A_BUTTON)
        {
            Reset(2, 14, 27, 19);
            gTasks[taskId].func = Task_CheckRtc;
        }
    }
}

void Task_CheckRtc(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        REG_WININ = 0x1111;
        REG_WINOUT = 49;
        REG_BLDCNT = 241;
        REG_BLDALPHA = 0;
        REG_BLDY = 7;

        if (!(RtcGetErrorStatus() & RTC_ERR_FLAG_MASK))
        {
            gTasks[taskId].func = Task_DrawMainMenu;
        }
        else
        {
            DrawDefaultWindow(2, 14, 27, 19);
            AddTextPrinterWithCallbackForMessage(gBatteryDryMessage, 3, 15);
            REG_WIN0H = WIN_RANGE(17, 223);
            REG_WIN0V = WIN_RANGE(113, 159);
            gTasks[taskId].func = Task_WaitForRtcErrorAck;
        }
    }
}

void Task_WaitForRtcErrorAck(u8 taskId)
{
    if (sub_8072080())
    {
        if ( gMain.newKeys & 1 )
        {
            Reset(2, 14, 27, 19);
            gTasks[taskId].func = Task_DrawMainMenu;
        }
    }
}

void Task_DrawMainMenu(u8 taskId)
{
    u16 palette;

    if (!gPaletteFade.active)
    {
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        REG_WININ = 0x1111;
        REG_WINOUT = 49;
        REG_BLDCNT = 241;
        REG_BLDALPHA = 0;
        REG_BLDY = 7;

        palette = RGB(0, 0, 0);
        LoadPalette(&palette, 254, 2);

        if (gSaveBlock2.playerGender == MALE)
        {
            palette = RGB(4, 16, 31);
            LoadPalette(&palette, 241, 2);
        }
        else
        {
            palette = RGB(31, 3, 21);
            LoadPalette(&palette, 241, 2);
        }

        switch (gTasks[taskId].data[0])
        {
        case 0:
        default:
            DrawDefaultWindow(1, 0, 28, 3);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 1);
            DrawDefaultWindow(1, 4, 28, 7);
            PrintMainMenuItem(gMainMenuString_Option, 2, 5);
            break;
        case 1:
            DrawDefaultWindow(1, 0, 28, 7);
            PrintMainMenuItem(gMainMenuString_Continue, 2, 1);
            DrawDefaultWindow(1, 8, 28, 11);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 9);
            DrawDefaultWindow(1, 12, 28, 15);
            PrintMainMenuItem(gMainMenuString_Option, 2, 13);
            PrintSaveFileInfo();
            break;
        case 2:
            DrawDefaultWindow(1, 0, 28, 7);
            PrintMainMenuItem(gMainMenuString_Continue, 2, 1);
            DrawDefaultWindow(1, 8, 28, 11);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 9);
            DrawDefaultWindow(1, 12, 28, 15);
            PrintMainMenuItem(gMainMenuString_MysteryEvents, 2, 13);
            DrawDefaultWindow(1, 16, 28, 19);
            PrintMainMenuItem(gMainMenuString_Option, 2, 0x11);
            PrintSaveFileInfo();
            break;
        }

        gTasks[taskId].func = Task_HighlightCurrentMenuItem;
    }
}

void Task_HighlightCurrentMenuItem(u8 taskId)
{
    HighlightCurrentMenuItem(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    gTasks[taskId].func = Task_MainMenuProcessKeyInput;
}

bool8 MainMenuProcessKeyInput(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        audio_play(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0x0000);
        gTasks[taskId].func = MainMenuPressedA;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        audio_play(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0xFFFF);
        REG_WIN0H = WIN_RANGE(0, 240);
        REG_WIN0V = WIN_RANGE(0, 160);
        gTasks[taskId].func = MainMenuPressedB;
    }
    else
    {
        s32 menuItemCount;

        switch (gTasks[taskId].data[0])
        {
        case 0:
        default:
            menuItemCount = 2;
            break;
        case 1:
            menuItemCount = 3;
            break;
        case 2:
            menuItemCount = 4;
            break;
        }

        if (gMain.newKeys & DPAD_UP)
        {
            if (gTasks[taskId].data[1] > 0)
            {
                gTasks[taskId].data[1]--;
                return TRUE;
            }
        }
        if (gMain.newKeys & DPAD_DOWN)
        {
            if (gTasks[taskId].data[1] < menuItemCount - 1)
            {
                gTasks[taskId].data[1]++;
                return TRUE;
            }
        }
    }

    return FALSE;
}

void Task_MainMenuProcessKeyInput(u8 taskId)
{
    bool8 currentMenuItemChanged = MainMenuProcessKeyInput(taskId);
    if (currentMenuItemChanged)
        gTasks[taskId].func = Task_HighlightCurrentMenuItem;
}

void MainMenuPressedA(u8 taskId)
{
    enum
    {
        NEW_GAME,
        CONTINUE,
        OPTION,
        MYSTERY_EVENTS,
    } action;

    if (gPaletteFade.active)
        return;

    switch (gTasks[taskId].data[0])
    {
    case 0:
    default:
        switch (gTasks[taskId].data[1])
        {
        case 0:
        default:
            action = NEW_GAME;
            break;
        case 1:
            action = OPTION;
            break;
        }
        break;
    case 1:
        switch (gTasks[taskId].data[1])
        {
        case 0:
        default:
            action = CONTINUE;
            break;
        case 1:
            action = NEW_GAME;
            break;
        case 2:
            action = OPTION;
            break;
        }
        break;
    case 2:
        switch (gTasks[taskId].data[1])
        {
        case 0:
        default:
            action = CONTINUE;
            break;
        case 1:
            action = NEW_GAME;
            break;
        case 2:
            action = MYSTERY_EVENTS;
            break;
        case 3:
            action = OPTION;
            break;
        }
        break;
    }

    switch ((int)action)
    {
    case NEW_GAME:
    default:
        gPlttBufferUnfaded[0] = 0;
        gPlttBufferFaded[0] = 0;
        gTasks[taskId].func = Task_Birch1;
        break;
    case CONTINUE:
        gPlttBufferUnfaded[0] = 0;
        gPlttBufferFaded[0] = 0;
        SetMainCallback2(CB2_ContinueSavedGame);
        DestroyTask(taskId);
        break;
    case OPTION:
        gMain.field_8 = (u32)sub_80096FC;
        SetMainCallback2(CB2_InitOptionMenu);
        DestroyTask(taskId);
        break;
    case MYSTERY_EVENTS:
        SetMainCallback2(CB2_InitMysteryEventMenu);
        DestroyTask(taskId);
        break;
    }
}

void MainMenuPressedB(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitTitleScreen);
        DestroyTask(taskId);
    }
}

void HighlightCurrentMenuItem(u8 layout, u8 menuItem)
{
    REG_WIN0H = WIN_RANGE(9, 231);

    switch (layout)
    {
    case 0:
    default:
        switch (menuItem)
        {
        case 0:
        default:
            REG_WIN0V = WIN_RANGE(1, 31);
            break;
        case 1:
            REG_WIN0V = WIN_RANGE(33, 63);
            break;
        }
        break;
    case 1:
        switch (menuItem)
        {
        case 0:
        default:
            REG_WIN0V = WIN_RANGE(1, 63);
            break;
        case 1:
            REG_WIN0V = WIN_RANGE(65, 95);
            break;
        case 2:
            REG_WIN0V = WIN_RANGE(97, 127);
            break;
        }
        break;
    case 2:
        switch (menuItem)
        {
        case 0:
        default:
            REG_WIN0V = WIN_RANGE(1, 63);
            break;
        case 1:
            REG_WIN0V = WIN_RANGE(65, 95);
            break;
        case 2:
            REG_WIN0V = WIN_RANGE(97, 127);
            break;
        case 3:
            REG_WIN0V = WIN_RANGE(129, 159);
            break;
        }
        break;
    }
}

void PrintMainMenuItem(u8 *text, u8 left, u8 top)
{
    u8 i;
    u8 buffer[32];

    buffer[0] = 0xFC;
    buffer[1] = 1;
    buffer[2] = 14;

    for (i = 0; i < 26; i++)
        buffer[3 + i] = text[i];

    buffer[29] = EOS;

    Print(buffer, left, top);
}

void PrintSaveFileInfo(void)
{
    PrintPlayerName();
    PrintPokedexCount();
    PrintPlayTime();
    PrintBadgeCount();
}

void PrintPlayerName(void)
{
    Print(gMainMenuString_Player, 2, 3);
    Print(gSaveBlock2.playerName, 9, 3);
}

void PrintPlayTime(void)
{
    u8 playTime[16];
    u8 alignedPlayTime[32];

    Print(gMainMenuString_Time, 16, 3);
    FormatPlayTime(playTime, gSaveBlock2.playTimeHours, gSaveBlock2.playTimeMinutes, 1);
    sub_8072C74(alignedPlayTime, playTime, 48, 1);
    Print(alignedPlayTime, 22, 3);
}

void PrintPokedexCount(void)
{
    u8 buffer[16];

    Print(gMainMenuString_Pokedex, 2, 5);
    sub_8072C14(buffer, GetPokedexSeenCount(), 18, 0);
    Print(buffer, 9, 5);
}

void PrintBadgeCount(void)
{
    u8 buffer[16];

    Print(gMainMenuString_Badges, 16, 5);
    ConvertIntToDecimalString(buffer, GetBadgeCount());
    sub_80729D8(buffer, 205, 40, 1);
}

//Text Strings
extern const u8 gUnknown_081C6D78[];    //Hi! Sorry to keep you waiting!...
extern const u8 gUnknown_081C6DF8[];
extern const u8 gUnknown_081C6E1A[];
extern const u8 gUnknown_081C6FCB[];
extern const u8 gUnknown_081C6FD8[];
extern const u8 gUnknown_081C6FFA[];
extern u8 gUnknown_081C7017[];
extern u8 gUnknown_081C7025[];
extern u8 gUnknown_081C7074[];

struct MonCoords
{
    u8 x, y;
};

extern const struct MonCoords gMonFrontPicCoords[];
extern const struct SpriteSheet gMonFrontPicTable[];
extern const struct SpritePalette gMonPaletteTable[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern void * const gUnknown_081FAF4C[];
extern u16 gUnknown_081E795C[];
extern u8 * const gUnknown_081E79B0[][2];
extern u8 * const gUnknown_081E79C0[][2];
extern u8 * const gUnknown_081E79E8[][2];

extern const u8 gUnknown_081E764C[];
extern const u8 gUnknown_081E768C[];
extern const u8 gUnknown_081E7834[];
extern const u8 gUnknown_081E796C[];
extern const u8 gUnknown_0840DFF7[];

extern u8 gSpriteAffineAnimTable_81E79AC[];

extern struct Sprite gSprites[];
extern u8 gStringVar4[];

extern u8 unk_2000000[];

void task_new_game_prof_birch_speech_2(u8 taskId);
void task_new_game_prof_birch_speech_3(u8 taskId);
void task_new_game_prof_birch_speech_4(u8 taskId);
void task_new_game_prof_birch_speech_5(u8 taskId);
void task_new_game_prof_birch_speech_6(u8 taskId);
void task_new_game_prof_birch_speech_7(u8 taskId);
void task_new_game_prof_birch_speech_8(u8 taskId);
void task_new_game_prof_birch_speech_9(u8 taskId);
void task_new_game_prof_birch_speech_10(u8 taskId);
void task_new_game_prof_birch_speech_11(u8 taskId);
void task_new_game_prof_birch_speech_12(u8 taskId);
void task_new_game_prof_birch_speech_13(u8 taskId);
void task_new_game_prof_birch_speech_14(u8 taskId);
void task_new_game_prof_birch_speech_15(u8 taskId);
void task_new_game_prof_birch_speech_16(u8 taskId);
void task_new_game_prof_birch_speech_17(u8 taskId);
void task_new_game_prof_birch_speech_18(u8 taskId);
void sub_800A974(u8 taskId);
void Task_800A9B4(u8 taskId);
void sub_800A9EC(u8 taskId);
void sub_800AAAC(u8 taskId);
void task_new_game_prof_birch_speech_part2_1(u8 taskId);
void sub_800AB38(u8 taskId);
void task_new_game_prof_birch_speech_part2_4(u8 taskId);
void sub_800AC20(u8 taskId);
void task_new_game_prof_birch_speech_part2_6(u8 taskId);
void task_new_game_prof_birch_speech_part2_7(u8 taskId);
void task_new_game_prof_birch_speech_part2_8(u8 taskId);
void task_new_game_prof_birch_speech_part2_9(u8 taskId);
void task_new_game_prof_birch_speech_part2_10(u8 taskId);
void sub_800AFC0(u8 taskId);
void sub_800B034(u8 taskId);
void new_game_prof_birch_speech_part2_start();
void nullsub_34(struct Sprite *sprite);
void sub_800B240(struct Sprite *sprite);
u8 sub_800B25C(u8, u8);
void AddBirchSpeechObjects(u8);
void sub_800B3EC(u8);
void sub_800B458(u8, u8);
void sub_800B4C8(u8);
void sub_800B534(u8 taskId, u8 a);
void sub_800B5A8(u8);
void sub_800B614(u8, u8);
void sub_800B654(u8);
void sub_800B6C0(u8 taskId, u8 a);
void CreateGenderMenu(u8 left, u8 top);
s8 GenderMenuProcessInput(void);
void CreateNameMenu(u8 a, u8 b);
s8 NameMenuProcessInput(void);
void set_default_player_name(u8 a);

void Task_Birch1(u8 taskId)
{
	SetUpWindowConfig(&gWindowConfig_81E6C3C);
	sub_8071C4C(&gWindowConfig_81E6CE4);
	REG_WIN0H = 0;
	REG_WIN0V = 0;
	REG_WININ = 0;
	REG_WINOUT = 0;
	REG_BLDCNT = 0;
	REG_BLDALPHA = 0;
	REG_BLDY = 0;
	LZ77UnCompVram(gUnknown_081E768C, (void *)BG_VRAM);
    LZ77UnCompVram(gUnknown_081E7834, (void *)(BG_VRAM + 0x3800));
	LoadPalette(gUnknown_081E764C, 0, 0x40);
	LoadPalette(gUnknown_081E796C, 1, 0x10);
	remove_some_task();
	ResetSpriteData();
	FreeAllSpritePalettes();
	AddBirchSpeechObjects(taskId);
	BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
	REG_BG1CNT = 0x00000703;
	REG_DISPCNT = 0x9A << 5;
	gTasks[taskId].data[4] = 0;
	gTasks[taskId].func = task_new_game_prof_birch_speech_2;
	gTasks[taskId].data[2] = 0xFF;
	gTasks[taskId].data[3] = 0xFF;
	gTasks[taskId].data[7] = 0xD8;
	
	sub_8075474(0xBB << 1);
}

void task_new_game_prof_birch_speech_2(u8 taskId)
{
	struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
	
	if(task->data[7] != 0)
	{
		task->data[7]--;
	}
	else
	{
		u8 spriteId = task->data[8];
		struct Sprite *sprites = gSprites;
		struct Sprite *sprite = &sprites[spriteId];
		sprite->pos1.x = 0x88;
		sprite->pos1.y = 0x3C;
		sprite->invisible = 0;
		sprite->oam.objMode = 1;
		sub_800B534(taskId, 0xA);
		sub_800B6C0(taskId, 0x14);
		task->data[7] = 0x50;
		task->func = task_new_game_prof_birch_speech_3;
	}
}

void task_new_game_prof_birch_speech_3(u8 taskId)
{
	struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
	
	if(task->data[5] != 0)
	{
		struct Sprite *sprites = gSprites;
		struct Sprite *sprite = &sprites[(s16)task->data[8]];
		
		sprite->oam.objMode = 0;
		if((u16)task->data[7])
		{
			task->data[7]--;
		}
		else
		{
			DrawDefaultWindow(0x2, 0xD, 0x1B, 0x12);
			AddTextPrinterWithCallbackForMessage(gUnknown_081C6D78, 0x3, 0xE);
			task->func = task_new_game_prof_birch_speech_4;
		}
	}
}

void task_new_game_prof_birch_speech_4(u8 taskId)
{
    if(!gPaletteFade.active && sub_8072CF4(0x18))
    {
        struct Task *tasks = gTasks;
        struct Task *task = &tasks[taskId];
        task->func = task_new_game_prof_birch_speech_5;
        AddTextPrinterWithCallbackForMessage(gUnknown_081C6DF8, 0x3, 0xE);
    }
}

void task_new_game_prof_birch_speech_5(u8 taskId)
{
	if(sub_8072CF4(0x18))
		gTasks[taskId].func = task_new_game_prof_birch_speech_6;
}

void task_new_game_prof_birch_speech_6(u8 taskId)
{
	struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
	u8 data = (u8)task->data[9];
	struct Sprite *sprites = gSprites;
	struct Sprite *sprite = &sprites[data];
	
	sprite->pos1.x = 0x68;
	sprite->pos1.y = 0x48;
	sprite->invisible = 0;
	sprite->data0 = 0;
	AddTextPrinterForMessage(data, sprite->oam.paletteNum, 0x70, 0x3A, 0, 0, 0x20, 0x0000FFFF);
	task->func = task_new_game_prof_birch_speech_7;
	task->data[7] = 0;
}

void task_new_game_prof_birch_speech_7(u8 taskId)
{
	struct Task *tasks;
    struct Task *task;
    
    if(sub_8075374())
    {
        struct Task *tasks = gTasks;
        struct Task *task = &tasks[taskId]; //r5
        
        if(task->data[7] > 0x5F)
        {
            sub_807206C((u32)&gUnknown_0840DFF7);
            task->func = task_new_game_prof_birch_speech_8;
        }
    }
    //_0800A4E4
    tasks = gTasks;
    task = &tasks[taskId]; //r2
    if((s16)task->data[7] <= 0x00003fff)
    {
        task->data[7]++;
        if(task->data[7] == 0x20)
        {
            cry_related(0xAF << 1, 0);
        }
    }
}

void task_new_game_prof_birch_speech_8(u8 taskId)
{
	if(sub_8072CF4(0x18))
    {
        AddTextPrinterWithCallbackForMessage(gUnknown_081C6E1A, 0x3, 0xE);
        gTasks[taskId].func = task_new_game_prof_birch_speech_9;
    }
}

void task_new_game_prof_birch_speech_9(u8 taskId)
{
	if(sub_8072CF4(0x18))
    {
        DrawDefaultWindow(0x2, 0xD, 0x1B, 0x12);
        AddTextPrinterWithCallbackForMessage(gUnknown_081C6FCB, 0x3, 0xE);
        gTasks[taskId].func = task_new_game_prof_birch_speech_10;
    }
}

void task_new_game_prof_birch_speech_10(u8 taskId)
{
    if(sub_8072CF4(0x18))
    {
        struct Sprite *sprites = gSprites;
        struct Task *tasks = gTasks;
        struct Task *task = &tasks[taskId];
        struct Sprite *sprite = &sprites[task->data[8]];
        struct Sprite *sprite2;
        
        sprite->oam.objMode = 1;
        sprite2 = &sprites[task->data[9]];
        sprite2->oam.objMode = 1;
        sub_800B458(taskId, 0x2);
        sub_800B614(taskId, 0x1);
        task->data[7] = 0x40;
        task->func = task_new_game_prof_birch_speech_11;
    }
}

void task_new_game_prof_birch_speech_11(u8 taskId)
{
    struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
    
    if((s16)task->data[4] != -0x3C)
    {
        task->data[4] -= 2;
        REG_BG1HOFS = task->data[4];
    }
    else
    {
        task->data[4] = 0x0000ffc4;
        task->func = task_new_game_prof_birch_speech_12;
    }
}

//Fix Me: Uses a few different registers, and I can't figure out why.
void task_new_game_prof_birch_speech_12(u8 taskId)
{
    if(gTasks[taskId].data[5])
    {
        gSprites[gTasks[taskId].data[8]].invisible = 1;
        gSprites[gTasks[taskId].data[9]].invisible = 1;

        if(gTasks[taskId].data[7])
        {
            gTasks[taskId].data[7]--;
        }
        else
        {
            u8 data10 = gTasks[taskId].data[10];
            
            gSprites[data10].pos1.x = 0xB4;
            gSprites[data10].pos1.y = 0x3C;
            gSprites[data10].invisible = 0;
            gSprites[data10].oam.objMode = 1;
            gTasks[taskId].data[2] = data10;
            gTasks[taskId].data[6] = 0;
            sub_800B534(taskId, 2);
            sub_800B6C0(taskId, 1);
            gTasks[taskId].func = task_new_game_prof_birch_speech_13;
        }
    }
}

void task_new_game_prof_birch_speech_13(u8 taskId)
{
    struct Task *tasks = gTasks;
	struct Task *task = &tasks[taskId];
    
    if(task->data[5])
    {
        struct Sprite *sprites = gSprites;
        struct Sprite *sprite = &sprites[task->data[2]];
        
        sprite->oam.objMode = 0;
        task->func = task_new_game_prof_birch_speech_14;
    }
}

void task_new_game_prof_birch_speech_14(u8 taskId)
{
	DrawDefaultWindow(2, 0xD, 0x1B, 0x12);
    AddTextPrinterWithCallbackForMessage(gUnknown_081C6FD8, 3, 14);
    gTasks[taskId].func = task_new_game_prof_birch_speech_15;
}

void task_new_game_prof_birch_speech_15(u8 taskId)
{
    if(sub_8072CF4(0x18))
    {
        CreateGenderMenu(2, 4);
        gTasks[taskId].func = task_new_game_prof_birch_speech_16;
    }
}

//Fix Me
void task_new_game_prof_birch_speech_16(u8 taskId)
{
    u8 cursorPos;

    switch (GenderMenuProcessInput())
    {
    case MALE:
        sub_8072DEC();
        audio_play(5);
        gSaveBlock2.playerGender = MALE;
        Reset(2, 4, 8, 9);
        gTasks[taskId].func = sub_800A974;
        break;
    case FEMALE:
        sub_8072DEC();
        audio_play(5);
        gSaveBlock2.playerGender = FEMALE;
        Reset(2, 4, 8, 9);
        gTasks[taskId].func = sub_800A974;
        break;
    }

    cursorPos = GetMenuCursorPos();

    if(cursorPos != (s16)gTasks[taskId].data[6])
    {
        gTasks[taskId].data[6] = cursorPos;
        gSprites[gTasks[taskId].data[2]].oam.objMode = 1;
        sub_800B458(taskId, 0);
        gTasks[taskId].func = task_new_game_prof_birch_speech_17;
    }
}

void task_new_game_prof_birch_speech_17(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[2];
    
    if(gTasks[taskId].data[5] == 0)
    {
        gSprites[spriteId].pos1.x += 4;
    }
    else
    {
        gSprites[spriteId].invisible = 1;
        if(gTasks[taskId].data[6])
        {
            spriteId = gTasks[taskId].data[11];
        }
        else
        {
            spriteId = gTasks[taskId].data[10];
        }
        
        gSprites[spriteId].pos1.x = 0xF0;
        gSprites[spriteId].pos1.y = 0x3C;
        gSprites[spriteId].invisible = 0;
        gTasks[taskId].data[2] = spriteId;
        gSprites[spriteId].oam.objMode = 1;
        sub_800B534(taskId, 0);
        gTasks[taskId].func = task_new_game_prof_birch_speech_18;
    }
}

void task_new_game_prof_birch_speech_18(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[2];
    
    if(gSprites[spriteId].pos1.x > 0xB4)
    {
        gSprites[spriteId].pos1.x -= 4;
    }
    else
    {
        gSprites[spriteId].pos1.x = 0xB4;
        if(gTasks[taskId].data[5])
        {
            gSprites[spriteId].oam.objMode = 0;
            gTasks[taskId].func = task_new_game_prof_birch_speech_16;
        }
    }
}

void sub_800A974(u8 taskId)
{
    DrawDefaultWindow(2, 13, 27, 18);
    AddTextPrinterWithCallbackForMessage(gUnknown_081C6FFA, 3, 14);
    gTasks[taskId].func = Task_800A9B4;
}

void Task_800A9B4(u8 taskId)
{
    if(sub_8072CF4(0x18))
    {
        CreateNameMenu(2, 1);
        gTasks[taskId].func = sub_800A9EC;
    }
}

//Fix Me
void sub_800A9EC(u8 taskId)
{
    s8 n = NameMenuProcessInput();

    switch (n)
    {
    case 1:
    case 2:
    case 3:
    case 4:
        sub_8072DEC();
        audio_play(5);
        Reset(2, 1, 22, 12);
        set_default_player_name(n);
        gTasks[taskId].func = task_new_game_prof_birch_speech_part2_1;
        break;
    case 0:
        audio_play(5);
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        gTasks[taskId].func = sub_800AAAC;
        break;
    case -1:
        sub_8072DEC();
        audio_play(5);
        Reset(2, 1, 22, 12);
        gTasks[taskId].func = task_new_game_prof_birch_speech_14;
        break;
    }
}

//Fix Me
void sub_800AAAC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        set_default_player_name(1);
        DoNamingScreen(0, &gSaveBlock2, gSaveBlock2.playerGender, 0, 0, new_game_prof_birch_speech_part2_start);
    }
}

void task_new_game_prof_birch_speech_part2_1(u8 taskId)
{
    DrawDefaultWindow(2, 13, 27, 18);
    StringExpandPlaceholders(gStringVar4, gUnknown_081C7017);
    AddTextPrinterWithCallbackForMessage(gStringVar4, 3, 14);
    gTasks[taskId].func = sub_800AB38;
}

void sub_800AB38(u8 taskId)
{
    if(sub_8072CF4(0x18))
    {
        sub_8072974(2, 1, 1);
        gTasks[taskId].func = task_new_game_prof_birch_speech_part2_4;
    }
}

void task_new_game_prof_birch_speech_part2_4(u8 taskId)
{
    switch (FillWindowPixelBuffer())
    {
    case 0:
        audio_play(5);
        Reset(2, 1, 8, 7);
        gSprites[gTasks[taskId].data[2]].oam.objMode = ST_OAM_OBJ_BLEND;
        sub_800B458(taskId, 2);
        sub_800B614(taskId, 1);
        gTasks[taskId].func = sub_800AC20;
        break;
    case -1:
    case 1:
        audio_play(5);
        Reset(2, 1, 8, 7);
        gTasks[taskId].func = task_new_game_prof_birch_speech_14;
        break;
    }
}

void sub_800AC20(u8 taskId)
{
    if(gTasks[taskId].data[4])
    {
        gTasks[taskId].data[4] += 2;
        REG_BG1HOFS = gTasks[taskId].data[4];
    }
    else
    {
        gTasks[taskId].func = task_new_game_prof_birch_speech_part2_6;
    }
}

void task_new_game_prof_birch_speech_part2_6(u8 taskId)
{
    if(gTasks[taskId].data[5])
    {
        s16 spriteId;
        
        spriteId = gTasks[taskId].data[10];
        gSprites[spriteId].invisible = 1;
        
        spriteId = gTasks[taskId].data[11];
        gSprites[spriteId].invisible = 1;
        
        spriteId = (u8)gTasks[taskId].data[8];
        gSprites[spriteId].pos1.x = 0x88;
        gSprites[spriteId].pos1.y = 0x40;
        gSprites[spriteId].invisible = 0;
        gSprites[spriteId].oam.objMode = 1;
        
        spriteId = (u8)gTasks[taskId].data[9];
        gSprites[spriteId].pos1.x = 0x68;
        gSprites[spriteId].pos1.y = 0x48;
        gSprites[spriteId].invisible = 0;
        gSprites[spriteId].oam.objMode = 1;
        
        sub_800B534(taskId, 2);
        sub_800B6C0(taskId, 1);
        DrawDefaultWindow(2, 13, 27, 18);
        StringExpandPlaceholders(gStringVar4, gUnknown_081C7025);
        AddTextPrinterWithCallbackForMessage(gStringVar4, 3, 14);
        gTasks[taskId].func = task_new_game_prof_birch_speech_part2_7;
    }
}

void task_new_game_prof_birch_speech_part2_7(u8 taskId)
{
    if(gTasks[taskId].data[5])
    {
        s16 spriteId;
        
        spriteId = gTasks[taskId].data[8];
        gSprites[spriteId].oam.objMode = 0;
        
        spriteId = gTasks[taskId].data[9];
        gSprites[spriteId].oam.objMode = 0;
        
        if(sub_8072CF4(0x18))
        {
            spriteId = gTasks[taskId].data[8];
            gSprites[spriteId].oam.objMode = 1;
            
            spriteId = gTasks[taskId].data[9];
            gSprites[spriteId].oam.objMode = 1;
            
            sub_800B458(taskId, 2);
            sub_800B614(taskId, 1);
            gTasks[taskId].data[7] = 0x40;
            gTasks[taskId].func = task_new_game_prof_birch_speech_part2_8;
        }
    }
}

void task_new_game_prof_birch_speech_part2_8(u8 taskId)
{
    if(gTasks[taskId].data[5])
    {
        s16 spriteId;
        
        spriteId = gTasks[taskId].data[8];
        gSprites[spriteId].invisible = 1;
        
        spriteId = gTasks[taskId].data[9];
        gSprites[spriteId].invisible = 1;
        
        if(gTasks[taskId].data[7])
        {
            gTasks[taskId].data[7]--;
        }
        else
        {
            u8 spriteId;
            
            if(gSaveBlock2.playerGender)
                spriteId = (u8)gTasks[taskId].data[11];
            else
                spriteId = (u8)gTasks[taskId].data[10];
            
            gSprites[spriteId].pos1.x = 0x78;
            gSprites[spriteId].pos1.y = 0x3C;
            gSprites[spriteId].invisible = 0;
            gSprites[spriteId].oam.objMode = 1;
            gTasks[taskId].data[2] = spriteId;
            
            sub_800B534(taskId, 2);
            sub_800B6C0(taskId, 1);
            DrawDefaultWindow(2, 13, 27, 18);
            AddTextPrinterWithCallbackForMessage(gUnknown_081C7074, 3, 14);
            gTasks[taskId].func = task_new_game_prof_birch_speech_part2_9;
        }
    }
}

void task_new_game_prof_birch_speech_part2_9(u8 taskId)
{
    if(gTasks[taskId].data[5])
    {
        s16 spriteId;
        
        spriteId = gTasks[taskId].data[2];
        gSprites[spriteId].oam.objMode = 0;
        
        if(sub_8072CF4(0x18))
        {
            u8 spriteId;
            
            spriteId = gTasks[taskId].data[2];
            gSprites[spriteId].oam.affineMode = 1;
            gSprites[spriteId].affineAnims = (union AffineAnimCmd **)gSpriteAffineAnimTable_81E79AC;
            InitSpriteAffineAnim(&gSprites[spriteId]);
            StartSpriteAffineAnim(&gSprites[spriteId], 0);
            gSprites[spriteId].callback = sub_800B240;
            BeginNormalPaletteFade(0x0000ffff, 0, 0, 0x10, 0);
            play_sound_effect(4);
            gTasks[taskId].func = task_new_game_prof_birch_speech_part2_10;
        }
    }
}

void task_new_game_prof_birch_speech_part2_10(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[2];

    if (gSprites[spriteId].affineAnimEnded)
        gTasks[taskId].func = sub_800AFC0;
}

void sub_800AFC0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 spriteId = gTasks[taskId].data[2];
        gSprites[spriteId].callback = nullsub_34;
        REG_DISPCNT = 4160;
        BeginNormalPaletteFade(0xFFFF0000, 0, 0, 0x10, 0xFFFF);
        gTasks[taskId].func = sub_800B034;
    }
}

void sub_800B034(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(c2_load_new_map_2);
        DestroyTask(taskId);
    }
}

// CB2
void new_game_prof_birch_speech_part2_start()
{
    u8 taskId;
    u8 spriteId;
    u16 savedIme;

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

    DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16(3, 0, (void *)PLTT, PLTT_SIZE);

    ResetPaletteFade();

    LZ77UnCompVram(gUnknown_081E768C, (void *)BG_VRAM);
    LZ77UnCompVram(gUnknown_081E7834, (void *)(BG_VRAM + 0x3800));

    LoadPalette(gUnknown_081E764C, 0, 0x40);

    ResetTasks();

    taskId = CreateTask(task_new_game_prof_birch_speech_part2_1, 0);

    gTasks[taskId].data[4] = -60;

    remove_some_task();
    ResetSpriteData();
    FreeAllSpritePalettes();
    AddBirchSpeechObjects(taskId);

    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    sub_8071C4C(&gWindowConfig_81E6CE4);

    if (gSaveBlock2.playerGender != MALE)
    {
        gTasks[taskId].data[6] = FEMALE;
        spriteId = gTasks[taskId].data[11];
    }
    else
    {
        gTasks[taskId].data[6] = MALE;
        spriteId = gTasks[taskId].data[10];
    }

    gSprites[spriteId].pos1.x = 180;
    gSprites[spriteId].pos1.y = 60;
    gSprites[spriteId].invisible = 0;

    gTasks[taskId].data[2] = spriteId;

    REG_BG1HOFS = -60;

    BeginNormalPaletteFade(0xFFFFFFFFu, 0, 0x10, 0, 0);

    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WININ = 0;
    REG_WINOUT = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;

    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;

    SetVBlankCallback(VBlankCB_MainMenu);
    SetMainCallback2(CB2_MainMenu);
    REG_BG1CNT = 1795;
    REG_DISPCNT = 4928;
}

void nullsub_34(struct Sprite *sprite)
{
}

void sub_800B240(struct Sprite *sprite)
{
    u32 y = (sprite->pos1.y << 16) + sprite->data0 + 0xC000;
    sprite->pos1.y = y >> 16;
    sprite->data0 = y;
}

u8 sub_800B25C(u8 a1, u8 a2)
{
    DecompressPicFromTable_2(
        &gMonFrontPicTable[350],
        gMonFrontPicCoords[350].x,
        gMonFrontPicCoords[350].y,
        gUnknown_081FAF4C[0],
        gUnknown_081FAF4C[1],
        350);
    LoadCompressedObjectPalette(&gMonPaletteTable[350]);
    gpu_pal_obj_decompress_and_apply(350, 1);
    return CreateSprite(&gUnknown_02024E8C, a1, a2, 0);
}

void AddBirchSpeechObjects(u8 taskId)
{
    u8 spriteId;

    spriteId = AddNewGameBirchObject(136, 60, 1);
    gSprites[spriteId].callback = nullsub_34;
    gSprites[spriteId].oam.priority = 0;
    gSprites[spriteId].invisible = 1;
    gTasks[taskId].data[8] = spriteId;

    spriteId = sub_800B25C(0x68, 0x48);
    gSprites[spriteId].callback = nullsub_34;
    gSprites[spriteId].oam.priority = 0;
    gSprites[spriteId].invisible = 1;
    gTasks[taskId].data[9] = spriteId;

    spriteId = sub_80859BC(0, 120, 60, 0, unk_2000000);
    gSprites[spriteId].callback = nullsub_34;
    gSprites[spriteId].invisible = 1;
    gSprites[spriteId].oam.priority = 0;
    gTasks[taskId].data[10] = spriteId;

    spriteId = sub_80859BC(1, 120, 60, 0, unk_2000000 + 0x800);
    gSprites[spriteId].callback = nullsub_34;
    gSprites[spriteId].invisible = 1;
    gSprites[spriteId].oam.priority = 0;
    gTasks[taskId].data[11] = spriteId;
}

void sub_800B3EC(u8 taskId)
{
    if (gTasks[taskId].data[1] == 0)
    {
        gTasks[gTasks[taskId].data[0]].data[5] = 1;
        DestroyTask(taskId);
    }
    else
    {
        if (gTasks[taskId].data[4])
        {
            gTasks[taskId].data[4]--;
        }
        else
        {
            gTasks[taskId].data[4] = gTasks[taskId].data[3];
            gTasks[taskId].data[1]--;
            gTasks[taskId].data[2]++;
            REG_BLDALPHA = gTasks[taskId].data[1] + (gTasks[taskId].data[2] * 256);
        }
    }
}

void sub_800B458(u8 taskId, u8 a2)
{
    u8 newTaskId;

    REG_BLDCNT = 592;
    REG_BLDALPHA = 16;
    REG_BLDY = 0;
    gTasks[taskId].data[5] = 0;
    newTaskId = CreateTask(sub_800B3EC, 0);

    gTasks[newTaskId].data[0] = taskId;
    gTasks[newTaskId].data[1] = 16;
    gTasks[newTaskId].data[2] = 0;
    gTasks[newTaskId].data[3] = a2;
    gTasks[newTaskId].data[4] = a2;
}

void sub_800B4C8(u8 taskId)
{
    if (gTasks[taskId].data[1] == 16)
    {
        gTasks[gTasks[taskId].data[0]].data[5] = 1;
        DestroyTask(taskId);
    }
    else if (gTasks[taskId].data[4])
    {
        gTasks[taskId].data[4]--;
    }
    else
    {
        gTasks[taskId].data[4] = gTasks[taskId].data[3];
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[2]--;
        REG_BLDALPHA = gTasks[taskId].data[1] + (gTasks[taskId].data[2] * 256);
    }
}

void sub_800B534(u8 taskId, u8 a2)
{
    u8 newTaskId;

    REG_BLDCNT = 592;
    REG_BLDALPHA = 4096;
    REG_BLDY = 0;
    gTasks[taskId].data[5] = 0;
    newTaskId = CreateTask(sub_800B4C8, 0);

    gTasks[newTaskId].data[0] = taskId;
    gTasks[newTaskId].data[1] = 0;
    gTasks[newTaskId].data[2] = 16;
    gTasks[newTaskId].data[3] = a2;
    gTasks[newTaskId].data[4] = a2;
}

void sub_800B5A8(u8 taskId)
{
    if (gTasks[taskId].data[2])
    {
        gTasks[taskId].data[2]--;
    }
    else
    {
        if (gTasks[taskId].data[1] == 8)
        {
            DestroyTask(taskId);
        }
        else if (gTasks[taskId].data[4])
        {
            gTasks[taskId].data[4]--;
        }
        else
        {
            gTasks[taskId].data[4] = gTasks[taskId].data[3];
            gTasks[taskId].data[1]++;
            LoadPalette(&gUnknown_081E795C[gTasks[taskId].data[1]], 1, 0x10);
        }
    }
}

void sub_800B614(u8 a1, u8 a2)
{
    u8 newTaskId = CreateTask(sub_800B5A8, 0);
    gTasks[newTaskId].data[0] = a1;
    gTasks[newTaskId].data[1] = 0;
    gTasks[newTaskId].data[2] = 8;
    gTasks[newTaskId].data[3] = a2;
    gTasks[newTaskId].data[4] = a2;
}

void sub_800B654(u8 taskId)
{
    if (gTasks[taskId].data[2])
    {
        gTasks[taskId].data[2]--;
    }
    else
    {
        if (gTasks[taskId].data[1] == 0)
        {
            DestroyTask(taskId);
        }
        else
        {
            if (gTasks[taskId].data[4])
            {
                gTasks[taskId].data[4]--;
            }
            else
            {
                gTasks[taskId].data[4] = gTasks[taskId].data[3];
                gTasks[taskId].data[1]--;
                LoadPalette(&gUnknown_081E795C[gTasks[taskId].data[1]], 1, 0x10);
            }
        }
    }
}

void sub_800B6C0(u8 a1, u8 a2)
{
    u8 newTaskId = CreateTask(sub_800B654, 0);
    gTasks[newTaskId].data[0] = a1;
    gTasks[newTaskId].data[1] = 8;
    gTasks[newTaskId].data[2] = 8;
    gTasks[newTaskId].data[3] = a2;
    gTasks[newTaskId].data[4] = a2;
}

void CreateGenderMenu(u8 left, u8 top)
{
    u8 menuLeft, menuTop;
    DrawDefaultWindow(left, top, left + 6, top + 5);
    menuLeft = left + 1;
    menuTop = top + 1;
    PrintStringArray(menuLeft, menuTop, 2, gUnknown_081E79B0);
    InitMenu(0, menuLeft, menuTop, 2, 0, 5);
}

s8 GenderMenuProcessInput(void)
{
    return ProcessMenuInputNoWrap();
}

void CreateNameMenu(u8 left, u8 top)
{
    DrawDefaultWindow(left, top, left + 10, top + 11);

    if (gSaveBlock2.playerGender == MALE)
    {
        PrintStringArray((u8)(left + 1), (u8)(top + 1), 5, gUnknown_081E79C0);
    }
    else
    {
        PrintStringArray((u8)(left + 1), (u8)(top + 1), 5, gUnknown_081E79E8);
    }

    InitMenu(0, (u8)(left + 1), (u8)(top + 1), 5, 0, 9);
}

s8 NameMenuProcessInput(void)
{
    return ProcessMenuInput();
}

void set_default_player_name(u8 index)
{
    u8 i;
    u8 *name;

    if (gSaveBlock2.playerGender == MALE)
        name = gUnknown_081E79C0[index][0];
    else
        name = gUnknown_081E79E8[index][0];

    for (i = 0; i < 7; i++)
        gSaveBlock2.playerName[i] = name[i];

    gSaveBlock2.playerName[i] = EOS;
}
