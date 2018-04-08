#if DEBUG

#include "global.h"
#include "constants/songs.h"
#include "constants/moves.h"
#include "constants/items.h"
#include "battle.h"
#include "debug.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "mystery_event_menu.h"
#include "overworld.h"
#include "reset_rtc_screen.h"
#include "rtc.h"
#include "save.h"
#include "sound.h"
#include "task.h"
#include "text.h"
#include "trade.h"
#include "start_menu.h"
#include "string_util.h"
#include "new_game.h"
#include "script.h"
#include "fieldmap.h"
#include "field_player_avatar.h"
#include "credits.h"
#include "event_data.h"
#include "berry.h"
#include "pokedex.h"
#include "mori_debug_menu.h"
#include "cable_club.h"
#include "field_fadetransition.h"
#include "wild_encounter.h"
#include "battle_setup.h"
#include "safari_zone.h"
#include "fldeff_cut.h"
#include "fldeff_flash.h"
#include "rom6.h"
#include "fldeff_strength.h"
#include "pokemon_menu.h"
#include "fldeff_secretpower.h"
#include "data2.h"
#include "item.h"
#include "reset_rtc_screen.h"

// berry_blender.c
extern void unref_sub_80524BC(void);

void debug_sub_8076BB4(u8);
void debug_sub_8077CF4(u8 x, u8 y);
u8 DebugMenu_807706C(void);
u8 DebugMenu_807709C(void);
void DebugMenu_807719C(void);
void DebugMenu_80771EC(void);
void DebugMenu_8077238(void);
u8 DebugMenu_8077D78(const struct MenuAction *menuActions);
void DebugMenu_8077D24(const struct MenuAction *menuAction, u8 width, u8 itemCount);
u8 DebugMenu_8077C14(void);
bool8 DebugMenu_8077DB4(void);
void DebugMenu_8077EAC(void);
void DebugMenu_8077F40(u8 taskId);
void DebugMenu_8077F7C(u8 taskId);
void DebugMenu_8077FFC(u8 taskId);
void DebugMenu_807806C(u8 taskId);

u8 DebugMenu_Exit(void);
u8 DebugMenu_OpenWatanabe(void);
u8 DebugMenu_OpenSogabe(void);
u8 DebugMenu_OpenTamada(void);
u8 DebugMenu_OpenKagaya(void);
u8 DebugMenu_OpenMatsuda(void);
u8 DebugMenu_OpenNohara(void);
u8 DebugMenu_OpenNakamura(void);
u8 DebugMenu_Teleport(void);
u8 DebugMenu_EditPKMN(void);
u8 DebugMenu_SwitchBG(void);
u8 DebugMenu_OpenMori(void);
u8 DebugMenu_OpenTomomichi(void);
u8 DebugMenu_OpenAoki(void);
u8 DebugMenu_OpenTaya(void);
u8 DebugMenu_ToggleClearFlag(void);
u8 DebugMenu_ControlEncounter(void);
u8 DebugMenu_PTime(void);
u8 DebugMenu_MakeItems(void);
u8 debug_sub_8091300(void);
u8 DebugMenu_ViewPortraits(void);
u8 DebugMenu_TimeRecords(void);
u8 DebugMenu_SetTime(void);
u8 DebugMenu_NationalDex(void);
u8 DebugMenu_CreatePKMN(void);
u8 DebugMenu_ViewPokemonGraphics(void);
u8 DebugMenu_BattleForDebug(void);
u8 DebugMenu_AllBadges(void);
u8 DebugMenu_HoennNationalDex(void);
u8 DebugMenu_SetRamBerry(void);
u8 DebugMenu_UseHM(void);
u8 DebugMenu_OpenIwasawa(void);
u8 DebugMenu_ToggleBGM(void);
u8 DebugMenu_OpenSizeComparison(void);
u8 DebugMenu_Safari(void);
u8 DebugMenu_RematchTrainers(void);
u8 DebugMenu_MiragaIslandRND(void);
u8 DebugMenu_HallOfFame(void);
u8 DebugMenu_OpenMysteryEvent(void);
u8 DebugMenu_OpenLegendsRecord(void);
u8 DebugMenu_OpenWeatherEvents(void);
u8 DebugMenu_CellInfo(void);
u8 DebugMenu_CheckPKBLCK(void);
u8 DebugMenu_EffortValues(void);
u8 DebugMenu_HoennDex(void);
u8 DebugMenu_OpenSeeTrainers(void);
u8 DebugMenu_OpenBerryInfo(void);
u8 DebugMenu_BattleTowerStages(void);
u8 DebugMenu_EndSequenceDemo(void);
u8 DebugMenu_RandomNumberTest(void);
u8 DebugMenu_MeTooBackupMan(void);
u8 DebugMenu_OpenMurakawa(void);
u8 DebugMenu_OpenKiwa(void);
u8 DebugMenu_8076CBC(void);
u8 DebugMenu_8076CC0(void);
u8 DebugMenu_8076CD4(void);
u8 DebugMenu_8076C6C(void);
u8 DebugMenu_8076CD8(void);
u8 DebugMenu_8076D28(void);
u8 DebugMenu_8076D3C(void);
u8 DebugMenu_8076C80(void);
u8 DebugMenu_8076C90(void);
u8 DebugMenu_8076D50(void);
u8 DebugMenu_8076CEC(void);
u8 DebugMenu_8076D14(void);
u8 DebugMenu_8076D00(void);
u8 DebugMenu_8076D5C(void);
u8 DebugMenu_8076E18(void);
u8 DebugMenu_8076EDC(void);
void DebugMenu_8076FEC(void);

const u8 Str_839B740[] = _("·WATANABE");
const u8 Str_839B74A[] = _("SOGABE");
const u8 Str_839B751[] = _("·TAMADA");
const u8 Str_839B759[] = _("KAGAYA");
const u8 Str_839B760[] = _("MATUDA");
const u8 Str_839B767[] = _("NOHARA");
const u8 Str_839B76E[] = _("NAKAMURA");
const u8 Str_839B777[] = _("EXIT");
const u8 Str_839B77C[] = _("Teleport");
const u8 Str_839B785[] = _("Switch BG");
const u8 Str_839B78F[] = _("Edit your {PKMN}");
const u8 Str_839B79C[] = _("MORI");
const u8 Str_839B7A1[] = _("TOMOMITI");
const u8 Str_839B7AA[] = _("·AOKI");
const u8 Str_839B7B0[] = _("TAYA");
const u8 Str_839B7B5[] = _("Control Encounter");
const u8 Str_839B7C7[] = _("PTIME");
const u8 Str_839B7CD[] = _("Make items");
const u8 Str_839B7D8[] = _("Transport");
const u8 Str_839B7E2[] = _("See portraits");
const u8 Str_839B7F0[] = _("Time records");
const u8 Str_839B7FD[] = _("Set time");
const u8 Str_839B806[] = _("National オカDex");
const u8 Str_839B815[] = _("Hoenn オカDex");
const u8 Str_839B821[] = _("Create {PKMN}");
const u8 Str_839B82B[] = _("See {PKMN} graphics");
const u8 Str_839B83B[] = _("See trainers");
const u8 Str_839B848[] = _("Battle for debug");
const u8 Str_839B859[] = _("Full set of badges");
const u8 Str_839B86C[] = _("Hoenn National Dex");
const u8 Str_839B87F[] = _("Set Ram berry");
const u8 Str_839B88D[] = _("Use HM");
const u8 Str_839B894[] = _("IWASAWA");
const u8 Str_839B89C[] = _("BGM ON/OFF");
const u8 Str_839B8A7[] = _("Size comparison");
const u8 Str_839B8B7[] = _("Clear flag ON/OFF");
const u8 Str_839B8C9[] = _("Safari");
const u8 Str_839B8D0[] = _("Rematch trainers");
const u8 Str_839B8E1[] = _("Mirage island RND");
const u8 Str_839B8F3[] = _("Hall of fame");
const u8 Str_839B900[] = _("Mystery event");
const u8 Str_839B90E[] = _("Legends records");
const u8 Str_839B91E[] = _("Weather events");
const u8 Str_839B92D[] = _("Cell info.");
const u8 Str_839B938[] = _("Check {POKEBLOCK}");
const u8 Str_839B944[] = _("Effort values");
const u8 Str_839B952[] = _("Berrie Info");
const u8 Str_839B95E[] = _("Battle Tower stages");
const u8 Str_839B972[] = _("End sequence demo");
const u8 Str_839B984[] = _("Random number test");
const u8 Str_839B997[] = _("Me-too BackupMan");
const u8 Str_839B9A8[] = _("MURAKAWA");
const u8 Str_839B9B1[] = _("KINA(FONT)");

const struct MenuAction gDebug0x839B9BC[] =
{
    { Str_839B777, DebugMenu_Exit },
    { Str_839B740, DebugMenu_OpenWatanabe },
    { Str_839B74A, DebugMenu_OpenSogabe },
    { Str_839B751, DebugMenu_OpenTamada },
    { Str_839B759, DebugMenu_OpenKagaya },
    { Str_839B760, DebugMenu_OpenMatsuda },
    { Str_839B767, DebugMenu_OpenNohara },
    { Str_839B76E, DebugMenu_OpenNakamura },
    { Str_839B77C, DebugMenu_Teleport },
    { Str_839B78F, DebugMenu_EditPKMN },
    { Str_839B785, DebugMenu_SwitchBG },
    { Str_839B79C, DebugMenu_OpenMori },
    { Str_839B7A1, DebugMenu_OpenTomomichi },
    { Str_839B7AA, DebugMenu_OpenAoki },
    { Str_839B7B0, DebugMenu_OpenTaya },
    { Str_839B8B7, DebugMenu_ToggleClearFlag },
    { Str_839B7B5, DebugMenu_ControlEncounter },
    { Str_839B7C7, DebugMenu_PTime },
    { Str_839B7CD, DebugMenu_MakeItems },
    { Str_839B7D8, debug_sub_8091300 },
    { Str_839B7E2, DebugMenu_ViewPortraits },
    { Str_839B7F0, DebugMenu_TimeRecords },
    { Str_839B7FD, DebugMenu_SetTime },
    { Str_839B806, DebugMenu_NationalDex },
    { Str_839B821, DebugMenu_CreatePKMN },
    { Str_839B82B, DebugMenu_ViewPokemonGraphics },
    { Str_839B848, DebugMenu_BattleForDebug },
    { Str_839B859, DebugMenu_AllBadges },
    { Str_839B86C, DebugMenu_HoennNationalDex },
    { Str_839B87F, DebugMenu_SetRamBerry },
    { Str_839B88D, DebugMenu_UseHM },
    { Str_839B894, DebugMenu_OpenIwasawa },
    { Str_839B89C, DebugMenu_ToggleBGM },
    { Str_839B8A7, DebugMenu_OpenSizeComparison },
    { Str_839B8C9, DebugMenu_Safari },
    { Str_839B8D0, DebugMenu_RematchTrainers },
    { Str_839B8E1, DebugMenu_MiragaIslandRND },
    { Str_839B8F3, DebugMenu_HallOfFame },
    { Str_839B900, DebugMenu_OpenMysteryEvent },
    { Str_839B90E, DebugMenu_OpenLegendsRecord },
    { Str_839B91E, DebugMenu_OpenWeatherEvents },
    { Str_839B92D, DebugMenu_CellInfo },
    { Str_839B938, DebugMenu_CheckPKBLCK },
    { Str_839B944, DebugMenu_EffortValues },
    { Str_839B815, DebugMenu_HoennDex },
    { Str_839B83B, DebugMenu_OpenSeeTrainers },
    { Str_839B952, DebugMenu_OpenBerryInfo },
    { Str_839B95E, DebugMenu_BattleTowerStages },
    { Str_839B972, DebugMenu_EndSequenceDemo },
    { Str_839B984, DebugMenu_RandomNumberTest },
    { Str_839B997, DebugMenu_MeTooBackupMan },
    { Str_839B9A8, DebugMenu_OpenMurakawa },
    { Str_839B9B1, DebugMenu_OpenKiwa },
};

const u8 gUnknown_Debug_839BB64[] =
{
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x00, 0x0b, 0x0c, 0x0d, 0x0e, 0x1f, 0x12, 0x13, 0x00, 0x08, 0x09, 0x0a, 0x1e, 0x10, 0x24, 0x0f, 0x00, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x00,
    0x1c, 0x1d, 0x14, 0x20, 0x21, 0x22, 0x23, 0x00, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x00, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x32, 0x00, 0x11, 0x33, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00,
};

const u8 gUnknown_Debug_0839BBA4[] = _("Debugging Version");
const u8 gUnknown_Debug_0839BBB6[] = _("{VERSION} Version");
const u8 gUnknown_Debug_0839BBC1[] = _("Normal RTC compatible");
const u8 Str_839BBD7[] = _("か　の　じっけん");
const u8 Str_839BBE0[] = _("じっけん2");
const u8 Str_839BBE6[] = _("BGじっけん");
const u8 Str_839BBED[] = _("Battle");
const u8 Str_839BBF4[] = _("つうしん　じっけん");
const u8 Str_839BBFE[] = _("LINK Test2");
const u8 Str_839BC09[] = _("フィールド　はじめる");
const u8 Str_839BC14[] = _("フィールド　つづき");
const u8 Str_839BC1E[] = _("Sound test");
const u8 Str_839BC29[] = _("{POKEBLOCK} test");
const u8 Str_839BC34[] = _("Crash backup data");
const u8 Str_839BC46[] = _("e-Card test");
const u8 Str_839BC52[] = _("こうかんデモ　　　");
const u8 Str_839BC5C[] = _("Time in game");
const u8 Str_839BC69[] = _("フェスタ　モード");
const u8 Str_839BC72[] = _("Mimic e-Card");
const u8 Str_839BC7F[] = _("RTC reset");
const u8 Str_839BC89[] = _("Converter");

const struct MenuAction gUnknown_Debug_839BC94[] =
{
    { Str_839BBD7, DebugMenu_8076CBC },
    { Str_839BBE0, DebugMenu_8076CC0 },
    { Str_839BBE6, DebugMenu_8076CD4 },
    { Str_839BBED, DebugMenu_8076C6C },
    { Str_839BC29, DebugMenu_8076CD8 },
    { Str_839BBFE, DebugMenu_8076D28 },
    { Str_839BC1E, DebugMenu_8076D3C },
    { Str_839BC09, DebugMenu_8076C80 },
    { Str_839BC14, DebugMenu_8076C90 },
    { Str_839BC34, DebugMenu_8076D50 },
    { Str_839BC46, DebugMenu_8076CEC },
    { Str_839BC52, DebugMenu_8076D14 },
    { Str_839BC72, DebugMenu_8076D00 },
    { Str_839BC5C, DebugMenu_8076D5C },
    { Str_839BC7F, DebugMenu_8076E18 },
    { Str_839BC89, DebugMenu_8076EDC },
};

// NOTE: When decompiling this file, I found out that having an extraneous extern
// in a C file can affect the generated asm. If this extern is commented out,
// debug_sub_8076BB4 will access the array differently and no longer match.
//extern const struct MenuAction gUnknown_Debug_839BC94[];

const u8 gMenuOrders_839BD14[][10] =
{
    { 3, 6, 4, 0xFF },
    { 5, 9, 10, 12, 13, 14, 15, 0xFF },
};

const u8 Str_839BD26[] = {2, 0, 0, 0};  // doesn't appear to be referenced

const u8 Str_839BD2C[] = _("RTCを　リセット　します\n"         // Reset RTC
                           "Aで　じっこう　　　Bでキャンセル");

const u8 Str_839BD4C[] = _("RTCを　リセット　した！");

const u8 Str_839BD5A[] = _("セーブデータを　コンバートします\n"
                           "Aで　けってい　　Bで　キャンセル");

const u8 Str_839BD7D[] = _("へんかんが　しゅうりょう　しました！");


extern const u8 Str_839BD2C[];
extern const u8 Str_839BD4C[];

static u8 gUnknown_030006B8;
UNUSED static const s32 * gUnknown_030006BC;
static u8 gUnknown_030006C0;
static u8 gUnknown_030006C1;
static const u8 * gUnknown_030006C4;
static u8 gUnknown_030006C8;

void debug_sub_8076AC8(u8 a)
{
    s32 r4;

    gUnknown_030006C4 = gMenuOrders_839BD14[a];
    for (r4 = 0; gUnknown_030006C4[r4] != 0xFF; r4++)
        ;
    Menu_EraseWindowRect(16, 0, 29, 19);
    Menu_DrawStdWindowFrame(16, 0, 29, r4 * 2 + 1);
    Menu_PrintItemsReordered(17, 1, r4, (struct MenuAction2 *)gUnknown_Debug_839BC94, gUnknown_030006C4);
    InitMenu(0, 17, 1, r4, 0, 12);
}

void debug_sub_8076B4C(void)
{
    u8 taskId = FindTaskIdByFunc(debug_sub_8076BB4);

    if (taskId != 0xFF)
        DestroyTask(taskId);
}

// Initializes test menu
void debug_sub_8076B68(void)
{
    Menu_PrintText(gUnknown_Debug_0839BBB6, 1, 1);
    Menu_PrintText(gUnknown_Debug_0839BBC1, 1, 3);
    Menu_PrintText(gUnknown_Debug_0839BBA4, 1, 9);
    debug_sub_8077CF4(4, 11);
    debug_sub_8076AC8(0);
    CreateTask(debug_sub_8076BB4, 1);
}

// Handles input for the test menu
void debug_sub_8076BB4(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    switch (input)
    {
    default:
        gUnknown_Debug_839BC94[gUnknown_030006C4[cursorPos]].func();
        break;
    case -2:
        if (gMain.newKeys & 0x20)
        {
            if (data[0] == 0)
                data[0] = 1;
            else
                data[0]--;
            debug_sub_8076AC8(data[0]);
            PlaySE(SE_SELECT);
        }
        else if (gMain.newKeys & 0x10)
        {
            if (data[0] == 1)
                data[0] = 0;
            else
                data[0]++;
            debug_sub_8076AC8(data[0]);
            PlaySE(SE_SELECT);
        }
        break;
    case -1:
        DoSoftReset();
        break;
    }
}

u8 DebugMenu_8076C6C(void)
{
    SetMainCallback2(debug_sub_8010800);
    return 0;
}

u8 DebugMenu_8076C80(void)
{
    debug_sub_8076B4C();
    DebugMenu_8076FEC();
    return 0;
}

u8 DebugMenu_8076C90(void)
{
    if (gSaveFileStatus == SAVE_STATUS_ERROR)
    {
        PlaySE(0x16);
    }
    else
    {
        debug_sub_8076B4C();
        SetMainCallback2(CB2_ContinueSavedGame);
    }
    return 0;
}

u8 DebugMenu_8076CBC(void)
{
    return 0;
}

u8 DebugMenu_8076CC0(void)
{
    SetMainCallback2(debug_nullsub_66);
    return 0;
}

u8 DebugMenu_8076CD4(void)
{
    return 0;
}

u8 DebugMenu_8076CD8(void)
{
    SetMainCallback2(unref_sub_80524BC);
    return 0;
}

u8 DebugMenu_8076CEC(void)
{
    SetMainCallback2(CB2_InitMysteryEventMenu);
    return 0;
}

u8 DebugMenu_8076D00(void)
{
    SetMainCallback2(debug_sub_815D15C);
    return 0;
}

u8 DebugMenu_8076D14(void)
{
    SetMainCallback2(sub_804B790);
    return 0;
}

u8 DebugMenu_8076D28(void)
{
    SetMainCallback2(LinkTestScreen);
    return 0;
}

u8 DebugMenu_8076D3C(void)
{
    SetMainCallback2(CB2_StartSoundCheckMenu);
    return 0;
}

u8 DebugMenu_8076D50(void)
{
    Save_EraseAllData();
    return 0;
}

u8 DebugMenu_8076D5C(void)
{
    debug_sub_8076B4C();
    debug_sub_806F8F8();
    return 0;
}

void DebugMenu_8076D6C(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        Menu_DisplayDialogueFrame();
        Menu_PrintText(Str_839BD2C, 2, 15);
        data[0]++;
        break;
    case 1:
        if (gMain.newKeys & A_BUTTON)
        {
            Menu_DisplayDialogueFrame();
            Menu_PrintText(Str_839BD4C, 2, 15);
            PlaySE(0x49);
            RtcReset();
            data[0]++;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            DestroyTask(taskId);
            DoSoftReset();
        }
        break;
    case 2:
        if (gMain.newKeys & A_BUTTON)
        {
            DestroyTask(taskId);
            DoSoftReset();
        }
        break;
    }
}

u8 DebugMenu_8076E18(void)
{
    debug_sub_8076B4C();
    CreateTask(DebugMenu_8076D6C, 10);
    return 0;
}

void DebugMenu_8076E30(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
        case 0:
            Menu_DisplayDialogueFrame();
            Menu_PrintText(Str_839BD5A, 2, 15);
            data[0]++;
            break;
        case 1:
            if (gMain.newKeys & A_BUTTON)
            {
                Menu_DisplayDialogueFrame();
                sub_813B79C();
                Menu_PrintText(Str_839BD7D, 2, 15);
                PlaySE(SE_PINPON);
                data[0]++;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                DestroyTask(taskId);
                DoSoftReset(); // noreturn
            }
            break;
        case 2:
            if (gMain.newKeys & A_BUTTON)
            {
                DestroyTask(taskId);
                DoSoftReset(); // noreturn
            }
            break;
    }
}

u8 DebugMenu_8076EDC(void)
{
    debug_sub_8076B4C();
    CreateTask(DebugMenu_8076E30, 10);
    return 0;
}

const u8 Str_839BD90[] = _("ジュンイチ");
const u8 Str_839BD96[] = _("ダイゴロウ");
const u8 Str_839BD9C[] = _("テツジ");
const u8 Str_839BDA0[] = _("バレンシア");
const u8 Str_839BDA6[] = _("ハルコマチ");
const u8 Str_839BDAC[] = _("RAYMOND");
const u8 Str_839BDB4[] = _("TIFFANY");
const u8 Str_839BDBC[] = _("くまxちえ");

const struct {
    const u8 * text;
    u32 flags;
} gUnknown_Debug_839BDC4[] = {
    {Str_839BD90, 0x0},
    {Str_839BD96, 0x0},
    {Str_839BDA0, 0x1},
    {Str_839BDA6, 0x1},
    {Str_839BDAC, 0x80},
    {Str_839BDB4, 0x81},
    {Str_839BD9C, 0x0},
    {Str_839BDBC, 0x1}
};

void DebugMenu_8076EF4(void)
{
    u8 i;

    Menu_DrawStdWindowFrame(0, 0, 11, 17);
    Menu_PrintItems(2, 1, ARRAY_COUNT(gUnknown_Debug_839BDC4), gUnknown_Debug_839BDC4);
    for (i = 0; i < ARRAY_COUNT(gUnknown_Debug_839BDC4); i++)
    {
        sub_8071F60((gUnknown_Debug_839BDC4[i].flags & 1) == MALE ? CHAR_MALE : CHAR_FEMALE, 10, 2 * i + 1);
    }
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_839BDC4), 0, 9);
}

void DebugMenu_8076F60(u8 taskId)
{
    s8 input = Menu_ProcessInput();
    s8 cursorPos = Menu_GetCursorPos();

    switch (input)
    {
        case -2:
            break;
        case -1:
            Menu_EraseScreen();
            debug_sub_8076B68();
            DestroyTask(taskId);
            break;
        default:
        {
            u8 flags = gUnknown_Debug_839BDC4[cursorPos].flags;
            gSaveBlock2.playerGender = flags & 1;
            StringCopy(gSaveBlock2.playerName, gUnknown_Debug_839BDC4[cursorPos].text);
            if ((flags & 0x80) == 0)
                debug_sub_8057508(FALSE);
            else
                debug_sub_8057508(TRUE);
            DestroyTask(taskId);
            SetMainCallback2(debug_sub_8058C00);
            break;
        }
    }
}

void DebugMenu_8076FEC(void)
{
    DebugMenu_8076EF4();
    CreateTask(DebugMenu_8076F60, 10);
}

void DebugMenu_8077004(void)
{
    gUnknown_030006C4 = gUnknown_Debug_839BB64 + gUnknown_030006C1 * 8;
}

void DebugMenu_8077020(u8 taskId)
{
    if (gMenuCallback() == TRUE)
        DestroyTask(taskId);
}

void DebugMenu_8077048(void)
{
    gMenuCallback = DebugMenu_807706C;
    ScriptContext2_Enable();
    CreateTask(DebugMenu_8077020, 80);
}

u8 DebugMenu_807706C(void)
{
    InitMenuWindow(&gWindowTemplate_81E6CE4);
    DebugMenu_8077004();
    DebugMenu_807719C();
    DebugMenu_80771EC();
    DebugMenu_8077238();
    gMenuCallback = DebugMenu_807709C;
    return FALSE;
}

u8 DebugMenu_807709C(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gUnknown_030006C0 = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gUnknown_030006C0 = Menu_MoveCursor(+1);
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        PlaySE(SE_SELECT);
        if (gUnknown_030006C1 == 0)
            gUnknown_030006C1 = 7;
        else
            gUnknown_030006C1--;
        DebugMenu_8077004();
        DebugMenu_807719C();
    }
    if (gMain.newKeys & DPAD_RIGHT)
    {
        PlaySE(SE_SELECT);
        if (gUnknown_030006C1 == 7)
            gUnknown_030006C1 = 0;
        else
            gUnknown_030006C1++;
        DebugMenu_8077004();
        DebugMenu_807719C();
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gDebug0x839B9BC[gUnknown_030006C4[gUnknown_030006C0]].func();
    }
    if (gMain.newKeys & (B_BUTTON | START_BUTTON))
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

void DebugMenu_807719C(void)
{
    Menu_DrawStdWindowFrame(0, 0, 14, 17);
    Menu_PrintItemsReordered(1, 1, 8, gDebug0x839B9BC, gUnknown_030006C4);
    gUnknown_030006C0 = InitMenu(0, 1, 1, 8, gUnknown_030006C0, 13);
}

const u8 Str_839BE04[] = _("ID");

void DebugMenu_80771EC(void)
{
    u8 * buf = gStringVar4;
    buf = StringCopy(buf, Str_839BE04);
    buf = ConvertIntToDecimalStringN(buf, gSaveBlock1.location.mapGroup, STR_CONV_MODE_RIGHT_ALIGN, 3);
    buf = ConvertIntToDecimalStringN(buf, gSaveBlock1.location.mapNum, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_DrawStdWindowFrame(19, 12, 29, 15);
    Menu_PrintText(gStringVar4, 20, 13);
}

void DebugMenu_8077238(void)
{
    u8 sp00[] = _("X");
    u8 sp04[] = _(" Y");
    u8 sp08[] = _(" H");
    u8 sp0c[4];

    s16 x;
    s16 y;
    u8 z;
    u16 sp14 = 0;

    PlayerGetDestCoords(&x, &y);
    z = MapGridGetZCoordAt(x, y);
    x -= 7;
    y -= 7;

    StringCopy(gStringVar4, sp00);
    ConvertIntToDecimalStringN(sp0c, x, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(gStringVar4, sp0c);
    StringAppend(gStringVar4, sp04);
    ConvertIntToDecimalStringN(sp0c, y, STR_CONV_MODE_LEFT_ALIGN, 3);
    StringAppend(gStringVar4, sp0c);
    StringAppend(gStringVar4, sp08);
    ConvertIntToDecimalStringN(sp0c, z, STR_CONV_MODE_LEFT_ALIGN, 2);
    StringAppend(gStringVar4, sp0c);

    for (sp14 = 0; gStringVar4[sp14] != EOS; sp14++)
        ;

    Menu_DrawStdWindowFrame(28 - sp14, 16, 29, 19);
    Menu_PrintText(gStringVar4, 29 - sp14, 17);
}

u8 DebugMenu_Exit(void)
{
    CloseMenu();
    return TRUE;
}

u8 DebugMenu_OpenSogabe(void)
{
    return unref_sub_814A414();
}

u8 DebugMenu_OpenTamada(void)
{
    return debug_sub_8075C30();
}

u8 DebugMenu_OpenKagaya(void)
{
    return InitKagayaDebugMenu_A();
}

u8 DebugMenu_OpenMatsuda(void)
{
    return unref_sub_80A9B28();
}

u8 DebugMenu_OpenNohara(void)
{
    return InitNoharaDebugMenu();
}

u8 DebugMenu_OpenWatanabe(void)
{
    CloseMenu();
    SetMainCallback2(InitWatanabeDebugMenu);
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_EndSequenceDemo(void)
{
    CloseMenu();
    SetMainCallback2(sub_81439D0);
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_HallOfFame(void)
{
    CloseMenu();
    GameClear();
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_OpenSizeComparison(void)
{
    CloseMenu();
    InitSizeComparison();
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_HoennNationalDex(void)
{
    if (IsNationalPokedexEnabled())
        DisableNationalPokedex();
    else
        EnableNationalPokedex();
    CloseMenu();
    return TRUE;
}

const u8 Str_839BE0F[] = _("HP");
const u8 Str_839BE12[] = _("PAR");
const u8 Str_839BE16[] = _("SLP");
const u8 Str_839BE1A[] = _("PSN");
const u8 Str_839BE1E[] = _("ウマイ");

u8 DebugMenu_8077434(void)
{
    switch (Menu_GetCursorPos())
    {
        case 0:
            debug_sub_80C2C18(Str_839BE0F, 1, 4);
            debug_sub_80C2D24(0xff, 0xff, 0xff, 0, 0xff, 0xff);
            break;
        case 1:
            debug_sub_80C2C18(Str_839BE12, 2, 0);
            debug_sub_80C2D24(0xff, 0xff, 0, 0xff, 0xff, 0xff);
            break;
        case 2:
            debug_sub_80C2C18(Str_839BE16, 3, 0);
            debug_sub_80C2D24(0xff, 0, 0xff, 0xff, 0xff, 0xff);
            break;
        case 3:
            debug_sub_80C2C18(Str_839BE1A, 4, 0);
            debug_sub_80C2D24(0, 0xff, 0xff, 0xff, 0xff, 0xff);
            break;
        case 4:
            debug_sub_80C2C18(Str_839BE1E, 4, 0);
            debug_sub_80C2D24(0xff, 0xff, 0xff, 0xff, 0xff, 0xff);
            break;
    }
    CloseMenu();
    return TRUE;
}

const struct MenuAction gUnknown_Debug_839BE24[] = {
    {Str_839BE0F, DebugMenu_8077434},
    {Str_839BE12, DebugMenu_8077434},
    {Str_839BE16, DebugMenu_8077434},
    {Str_839BE1A, DebugMenu_8077434},
    {Str_839BE1E, DebugMenu_8077434}
};

u8 DebugMenu_807750C(void)
{
    return DebugMenu_8077D78(gUnknown_Debug_839BE24);
}

u8 DebugMenu_SetRamBerry(void)
{
    DebugMenu_8077D24(gUnknown_Debug_839BE24, 12, ARRAY_COUNT(gUnknown_Debug_839BE24));
    gMenuCallback = DebugMenu_807750C;
    return FALSE;
}

u8 DebugMenu_ToggleBGM(void)
{
    gDisableMusic = gDisableMusic ? FALSE : TRUE;
    CloseMenu();
    return TRUE;
}

u8 DebugMenu_BattleForDebug(void)
{
    CloseMenu();
    InitBattleForDebug();
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_NationalDex(void)
{
    u16 i;

    for (i = 0; i < 386; i++)
    {
        GetSetPokedexFlag(i + 1, 2);
        GetSetPokedexFlag(i + 1, 3);
    }
    gUnknown_03005CE8 = TRUE;
    CloseMenu();
    return TRUE;
}

u8 DebugMenu_HoennDex(void)
{
    u16 i;

    for (i = 0; i < 202; i++)
    {
        u16 nati = HoennToNationalOrder(i + 1);
        GetSetPokedexFlag(nati, 2);
        GetSetPokedexFlag(nati, 3);
    }
    gUnknown_03005CE8 = TRUE;
    CloseMenu();
    return TRUE;
}

u8 DebugMenu_CreatePKMN(void)
{
    CloseMenu();
    InitCreatePokemon();
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_ViewPokemonGraphics(void)
{
    CloseMenu();
    InitSeePokemonGraphics();
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_OpenSeeTrainers(void)
{
    CloseMenu();
    InitSeeTrainers();
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_OpenMori(void)
{
    return InitMoriDebugMenu();
}

u8 DebugMenu_OpenTomomichi(void)
{
    return InitTomomichiDebugWindow();
}

u8 DebugMenu_OpenAoki(void)
{
    CloseMenu();
    return TRUE;
}

u8 DebugMenu_OpenTaya(void)
{
    return InitTayaDebugWindow();
}

u8 DebugMenu_OpenNakamura(void)
{
    return InitNakamuraDebugMenu();
}

u8 DebugMenu_OpenIwasawa(void)
{
    return debug_sub_8138CC4();
}

u8 DebugMenu_Teleport(void)
{
    Overworld_SetWarpDestToLastHealLoc();
    sub_8080E88();
    ScriptContext2_Enable();
    CloseMenu();
    return TRUE;
}

u8 DebugMenu_EditPKMN(void)
{
    Menu_EraseScreen();
    NakaGenderTest();
    return FALSE;
}

void DebugMenu_80776B4(u8 bgNum)
{
    u8 sp00[] = __("OFF$"
                   "ON$");
    Menu_BlankWindowRect(25, bgNum * 2, 29, bgNum * 2 + 1);
    Menu_PrintText(sp00 + 4 * ((gUnknown_030006C8 >> bgNum) & 1), 25, bgNum * 2);
}

void DebugMenu_8077704(void)
{
    u8 sp00[] = _("BG0\n"
                  "BG1\n"
                  "BG2\n"
                  "BG3\n");
    Menu_BlankWindowRect(19, 0, 29, 8);
    Menu_PrintText(sp00, 21, 0);
    gUnknown_030006C8 = (REG_DISPCNT >> 8) & 0x0F;
    DebugMenu_80776B4(0);
    DebugMenu_80776B4(1);
    DebugMenu_80776B4(2);
    DebugMenu_80776B4(3);
}

u8 DebugMenu_8077760(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(-1);
        if (gUnknown_030006B8 != 0)
            gUnknown_030006B8--;
        else
            gUnknown_030006B8 = 3;
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(+1);
        if (gUnknown_030006B8 != 3)
            gUnknown_030006B8++;
        else
            gUnknown_030006B8 = 0;
    }
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        PlaySE(SE_SELECT);
        gUnknown_030006C8 ^= (1 << Menu_GetCursorPos());
        DebugMenu_80776B4(Menu_GetCursorPos());
    }
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        REG_DISPCNT = (REG_DISPCNT & 0xF0FF) + (gUnknown_030006C8 << 8);
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

u8 DebugMenu_SwitchBG(void)
{
    Menu_EraseScreen();
    DebugMenu_8077704();
    InitMenu(0, 20, 0, 4, 0, 6);
    gMenuCallback = DebugMenu_8077760;
    return FALSE;
}

void DebugMenu_807786C(u8 a0)
{
    u8 sp00[] = __("ON$"
                   "OFF$");

    Menu_DrawStdWindowFrame(25, 0, 29, 3);
    Menu_PrintText(sp00 + 3 * a0, 26, 1);
}

u8 DebugMenu_80778A8(void)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        PlaySE(SE_SELECT);
        gWildEncountersDisabled ^= 1;
        DebugMenu_807786C(gWildEncountersDisabled);
    }
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

u8 DebugMenu_ControlEncounter(void)
{
    Menu_EraseScreen();
    DebugMenu_807786C(gWildEncountersDisabled);
    gMenuCallback = DebugMenu_80778A8;
    return FALSE;
}

u8 DebugMenu_UseHM()
{
    gMenuCallback = DebugMenu_8077C14;
    return FALSE;
}

u8 DebugMenu_8077934(void)
{
    int i;

    for (i = 0; i < ARRAY_COUNT(gSaveBlock1.trainerRematches); i++)
        gSaveBlock1.trainerRematches[i] = 1;
    CloseMenu();
    return TRUE;
}

u8 DebugMenu_8077954(void)
{
    int i;

    for (i = 0; i < ARRAY_COUNT(gSaveBlock1.trainerRematches); i++)
        gSaveBlock1.trainerRematches[i] = 0;
    CloseMenu();
    return TRUE;
}

const u8 Str_839BE6B[] = _("さいせんかのうトレーナー:{STR_VAR_1}\n"
                           "さいせんじょうたいトレーナー:{STR_VAR_2}");
const u8 Str_839BE8D[] = _("いる");
const u8 Str_839BE90[] = _("いない");

bool8 DebugMenu_8077974(void)
{
    Menu_EraseScreen();
    if (IsRematchTrainerIn(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum))
        StringCopy(gStringVar1, Str_839BE8D);
    else
        StringCopy(gStringVar1, Str_839BE90);
    if (DoesSomeoneWantRematchIn(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum))
        StringCopy(gStringVar2, Str_839BE8D);
    else
        StringCopy(gStringVar2, Str_839BE90);
    sub_8071F40(Str_839BE6B);
    gMenuCallback = DebugMenu_8077DB4;
    return FALSE;
}

bool8 DebugMenu_8077A20(void)
{
    gSaveBlock1.trainerRematchStepCounter = 255;
    CloseMenu();
    return TRUE;
}

bool8 DebugMenu_8077A40(void)
{
    gSaveBlock1.trainerRematchStepCounter = 0;
    CloseMenu();
    return TRUE;
}

const u8 Str_839BE94[] = _("Max num of steps");
const u8 Str_839BEA5[] = _("Clear num of steps");
const u8 Str_839BEB8[] = _("See trainers");
const u8 Str_839BEC5[] = _("Flag all clear");
const u8 Str_839BED4[] = _("Flag all set");

const struct MenuAction gUnknown_Debug_839BEE4[] = {
    {Str_839BEB8, DebugMenu_8077974},
    {Str_839BE94, DebugMenu_8077A20},
    {Str_839BEA5, DebugMenu_8077A40},
    {Str_839BED4, DebugMenu_8077934},
    {Str_839BEC5, DebugMenu_8077954}
};

u8 DebugMenu_8077A60(void)
{
    return DebugMenu_8077D78(gUnknown_Debug_839BEE4);
}

u8 DebugMenu_RematchTrainers(void)
{
    Menu_EraseScreen();
    DebugMenu_8077D24(gUnknown_Debug_839BEE4, 13, ARRAY_COUNT(gUnknown_Debug_839BEE4));
    gMenuCallback = DebugMenu_8077A60;
    return FALSE;
}

bool8 DebugMenu_8077A9C(void)
{
    gNumSafariBalls = 30;
    CloseMenu();
    return TRUE;
}

bool8 DebugMenu_8077AB4(void)
{
    gNumSafariBalls = 1;
    CloseMenu();
    return TRUE;
}

bool8 DebugMenu_8077ACC(void)
{
    gSafariZoneStepCounter = 500;
    CloseMenu();
    return TRUE;
}

bool8 DebugMenu_8077AE8(void)
{
    gSafariZoneStepCounter = 1;
    CloseMenu();
    return TRUE;
}

const u8 Str_839BF0C[] = _("のこり　{STR_VAR_1}ほ");
const u8 Str_839BF14[] = _("{STR_VAR_1}\n"
                           "のこり　{STR_VAR_2}ほ");
const u8 Str_839BF1F[] = _("めのまえには\n"
                           "キューブが　ありません！");

bool8 DebugMenu_8077B00(void)
{
    Menu_EraseScreen();
    if (unref_sub_80C853C())
        sub_8071F40(Str_839BF14);
    else
        sub_8071F40(Str_839BF1F);
    gMenuCallback = DebugMenu_8077DB4;
    return FALSE;
}

const u8 Str_839BF33[] = _("ほすうをのこり1にする");
const u8 Str_839BF3F[] = _("ボールをのこり1にする");
const u8 Str_839BF4B[] = _("キューブおきば");
const u8 Str_839BF53[] = _("ボールをのこり30に");
const u8 Str_839BF5E[] = _("ほすうをのこり500に");

const struct MenuAction gUnknown_Debug_839BF6C[] = {
    {Str_839BF4B, DebugMenu_8077B00},
    {Str_839BF5E, DebugMenu_8077ACC},
    {Str_839BF33, DebugMenu_8077AE8},
    {Str_839BF53, DebugMenu_8077A9C},
    {Str_839BF3F, DebugMenu_8077AB4}
};

bool8 DebugMenu_8077B3C(void)
{
    return DebugMenu_8077D78(gUnknown_Debug_839BF6C);
}

u8 DebugMenu_Safari(void)
{
    if (!GetSafariZoneFlag())
    {
        CloseMenu();
        PlaySE(SE_BOO);
        return TRUE;
    }
    Menu_EraseScreen();
    DebugMenu_8077D24(gUnknown_Debug_839BF6C, 14, ARRAY_COUNT(gUnknown_Debug_839BF6C));
    ConvertIntToDecimalStringN(gStringVar1, gSafariZoneStepCounter, STR_CONV_MODE_RIGHT_ALIGN, 3);
    sub_8071F40(Str_839BF0C);
    gMenuCallback = DebugMenu_8077B3C;
    ScriptContext2_Enable();
    return FALSE;
}

bool8 DebugMenu_8077BB4(void)
{
    debug_sub_80AFEE4();
    return TRUE;
}

bool8 DebugMenu_8077BC0(void)
{
    debug_sub_8122080();
    return TRUE;
}

bool8 DebugMenu_8077BCC(void)
{
    debug_sub_8120968();
    return TRUE;
}

bool8 DebugMenu_8077BD8(void)
{
    debug_sub_8130318();
    return TRUE;
}

bool8 DebugMenu_8077BE4(void)
{
    debug_sub_80986AC();
    CloseMenu();
    return TRUE;
}

bool8 DebugMenu_8077BF4(void)
{
    debug_sub_80D93F4();
    return TRUE;
}

const struct MenuAction gUnknown_Debug_839BF94[] = {
    {gMoveNames[MOVE_CUT], DebugMenu_8077BB4},
    {gMoveNames[MOVE_FLASH], DebugMenu_8077BC0},
    {gMoveNames[MOVE_ROCK_SMASH], DebugMenu_8077BCC},
    {gMoveNames[MOVE_STRENGTH], DebugMenu_8077BD8},
    {gMoveNames[MOVE_SURF], debug_sub_80B0770},
    {gMoveNames[MOVE_FLY], debug_sub_80B07B0},
    {gMoveNames[MOVE_WATERFALL], DebugMenu_8077BE4},
    {gMoveNames[MOVE_DIVE], debug_sub_80B0800},
    {gMoveNames[MOVE_SECRET_POWER], DebugMenu_8077BF4}
};

bool8 DebugMenu_8077C00(void)
{
    return DebugMenu_8077D78(gUnknown_Debug_839BF94);
}

u8 DebugMenu_8077C14(void)
{
    Menu_EraseScreen();
    DebugMenu_8077D24(gUnknown_Debug_839BF94, 10, ARRAY_COUNT(gUnknown_Debug_839BF94));
    gMenuCallback = DebugMenu_8077C00;
    return FALSE;
}

const u8 Str_839BFDC[] = _("　じかん　ふん　びょう");

const s32 gUnknown_Debug_839BFE8[] = {
    99, 10, 2, 23,
    99, 10, 2, 26
};

#ifdef NONMATCHING
void DebugMenu_8077C3C(const char * a0, u8 * a1)
{
    // Register allocation swap
    // Intended: r7 = a1, r6 = gUnknown_030006BC[2]
    // Observed: r6 = a1, r7 = gUnknown_030006BC[2]

    int i;

    gUnknown_030006BC = gUnknown_Debug_839BFE8;
    *a1++ = CHAR_SPACE;
    *a1++ = CHAR_SPACE;

    for (i = 0; i < 2; i++, gUnknown_030006BC += 4)
    {
        u32 r5 = 0;
        int r2;
        int r4;
        for (r2 = gUnknown_030006BC[1], r4 = 0; r4 < gUnknown_030006BC[2]; r4++, r2 /= 10)
            r5 += (a0[gUnknown_030006BC[3] + r4] - '0') * r2;
        if (gUnknown_030006BC[0] < r5)
            r5 = gUnknown_030006BC[0];
        a1 = ConvertIntToDecimalStringN(a1, r5, STR_CONV_MODE_LEADING_ZEROS, gUnknown_030006BC[2]);
    }
    a1[0] = a0[29] - 'A' + CHAR_A;
    if (a1[0] > 0xf6)
        a1[0] = 0xf6;
    a1[1] = EOS;
}
#else
NAKED void DebugMenu_8077C3C(const char * a0, u8 * a1)
{
    asm("\tpush\t{r4, r5, r6, r7, lr}\n"
        "\tmov\tr7, sl\n"
        "\tmov\tr6, r9\n"
        "\tmov\tr5, r8\n"
        "\tpush\t{r5, r6, r7}\n"
        "\tadd\tsp, sp, #0xfffffffc\n"
        "\tmov\tsl, r0\n"
        "\tadd\tr7, r1, #0\n"
        "\tldr\tr0, ._271       @ gUnknown_030006BC\n"
        "\tldr\tr1, ._271 + 4   @ gUnknown_Debug_839BFE8\n"
        "\tstr\tr1, [r0]\n"
        "\tmov\tr1, #0x0\n"
        "\tstrb\tr1, [r7]\n"
        "\tadd\tr7, r7, #0x1\n"
        "\tstrb\tr1, [r7]\n"
        "\tadd\tr7, r7, #0x1\n"
        "\tmov\tr3, #0x0\n"
        "\tmov\tr8, r0\n"
        "._269:\n"
        "\tmov\tr5, #0x0\n"
        "\tldr\tr1, ._271       @ gUnknown_030006BC\n"
        "\tldr\tr0, [r1]\n"
        "\tldr\tr2, [r0, #0x4]\n"
        "\tmov\tr4, #0x0\n"
        "\tldr\tr1, [r0, #0x8]\n"
        "\tadd\tr3, r3, #0x1\n"
        "\tmov\tr9, r3\n"
        "\tcmp\tr5, r1\n"
        "\tbge\t._266\t@cond_branch\n"
        "\tadd\tr3, r0, #0\n"
        "\tadd\tr6, r1, #0\n"
        "._267:\n"
        "\tldr\tr0, [r3, #0xc]\n"
        "\tadd\tr0, r0, r4\n"
        "\tadd r0, r0, sl\n"
        "\tldrb\tr0, [r0]\n"
        "\tsub\tr0, r0, #0x30\n"
        "\tmul\tr0, r0, r2\n"
        "\tadd\tr5, r5, r0\n"
        "\tadd\tr4, r4, #0x1\n"
        "\tadd\tr0, r2, #0\n"
        "\tmov\tr1, #0xa\n"
        "\tstr\tr3, [sp]\n"
        "\tbl\t__divsi3\n"
        "\tadd\tr2, r0, #0\n"
        "\tldr\tr3, [sp]\n"
        "\tcmp\tr4, r6\n"
        "\tblt\t._267\t@cond_branch\n"
        "._266:\n"
        "\tmov\tr0, r8\n"
        "\tldr\tr1, [r0]\n"
        "\tldr\tr0, [r1]\n"
        "\tcmp\tr0, r5\n"
        "\tbcs\t._268\t@cond_branch\n"
        "\tadd\tr5, r0, #0\n"
        "._268:\n"
        "\tldrb\tr3, [r1, #0x8]\n"
        "\tadd\tr0, r7, #0\n"
        "\tadd\tr1, r5, #0\n"
        "\tmov\tr2, #0x2\n"
        "\tbl\tConvertIntToDecimalStringN\n"
        "\tadd\tr7, r0, #0\n"
        "\tmov\tr3, r9\n"
        "\tmov\tr1, r8\n"
        "\tldr\tr0, [r1]\n"
        "\tadd\tr0, r0, #0x10\n"
        "\tstr\tr0, [r1]\n"
        "\tcmp\tr3, #0x1\n"
        "\tble\t._269\t@cond_branch\n"
        "\tmov\tr1, sl\n"
        "\tldrb\tr0, [r1, #0x1d]\n"
        "\tadd\tr0, r0, #0x7a\n"
        "\tstrb\tr0, [r7]\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr0, r0, #0x18\n"
        "\tcmp\tr0, #0xf6\n"
        "\tbls\t._270\t@cond_branch\n"
        "\tmov\tr0, #0xf6\n"
        "\tstrb\tr0, [r7]\n"
        "._270:\n"
        "\tmov\tr0, #0xff\n"
        "\tstrb\tr0, [r7, #0x1]\n"
        "\tadd\tsp, sp, #0x4\n"
        "\tpop\t{r3, r4, r5}\n"
        "\tmov\tr8, r3\n"
        "\tmov\tr9, r4\n"
        "\tmov\tsl, r5\n"
        "\tpop\t{r4, r5, r6, r7}\n"
        "\tpop\t{r0}\n"
        "\tbx\tr0\n"
        "._272:\n"
        "\t.align\t2, 0\n"
        "._271:\n"
        "\t.word\tgUnknown_030006BC \n"
        "\t.word\tgUnknown_Debug_839BFE8\n");
}
#endif

void debug_sub_8077CF4(u8 x, u8 y)
{
    DebugMenu_8077C3C(BuildDateTime, gStringVar4);
    Menu_PrintText(gStringVar4, x, y);
}

void DebugMenu_8077D24(const struct MenuAction *menuAction, u8 width, u8 itemCount)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, width, 2 * itemCount + 1);
    Menu_PrintItems(1, 1, itemCount, menuAction);
    InitMenu(0, 1, 1, itemCount, 0, width - 1);
}

u8 DebugMenu_8077D78(const struct MenuAction *menuActions)
{
    s8 input = Menu_ProcessInput();
    switch (input)
    {
        default:
            Menu_EraseScreen();
            gMenuCallback = menuActions[input].func;
            return FALSE;
        case -2:
            return FALSE;
        case -1:
            CloseMenu();
            return TRUE;
    }
}

bool8 DebugMenu_8077DB4(void)
{
    if (gMain.newKeys & A_BUTTON)
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

bool32 DebugMenu_8077DD8(s16 * a0, s32 a1, s32 a2, u16 a3)
{
    if (a3 & DPAD_DOWN)
    {
        *a0 -= 1;
        if (*a0 < a1)
            *a0 = a2;
    }
    else if (a3 & DPAD_UP)
    {
        *a0 += 1;
        if (*a0 > a2)
            *a0 = a1;
    }
    else if (a3 & DPAD_LEFT)
    {
        *a0 -= 10;
        if (*a0 < a1)
            *a0 = a2;
    }
    else if (a3 & DPAD_RIGHT)
    {
        *a0 += 10;
        if (*a0 > a2)
            *a0 = a1;
    }
    else
        return FALSE;
    return TRUE;
}

int DebugMenu_8077E40(int flag)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        CloseMenu();
        return -1;
    }
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        PlaySE(SE_SELECT);
        if (flag)
        {
            DebugMenu_807786C(1);
            return 0;
        }
        else
        {
            DebugMenu_807786C(0);
            return 1;
        }
    }
    return flag;
}

u8 DebugMenu_MakeItems()
{
    CloseMenu();
    DebugMenu_8077EAC();
    ScriptContext2_Enable();
    return TRUE;
}

void DebugMenu_8077EAC(void)
{
    u8 taskId = CreateTask(DebugMenu_8077F40, 80);
    Menu_EraseScreen();
    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = 1;
}

void DebugMenu_8077EE0(u16 itemId, u16 quantity)
{
    Menu_BlankWindowRect(4, 17, 22, 18);
    ConvertIntToDecimalStringN(gStringVar1, itemId, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_PrintText(gStringVar1, 4, 17);
    Menu_PrintText(ItemId_GetName(itemId), 8, 17);
    ConvertIntToDecimalStringN(gStringVar1, quantity, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_PrintText(gStringVar1, 18, 17);
}

const u8 gDebug0x839C008[] = _("Which item?");

void DebugMenu_8077F40(u8 taskId)
{
    struct Task *task = gTasks + taskId;
    Menu_DisplayDialogueFrame();
    Menu_PrintText(gDebug0x839C008, 2, 15);
    DebugMenu_8077EE0(task->data[1], task->data[2]);
    task->func = DebugMenu_8077F7C;
}

const u8 Str_839C014[] = _("How　many？");

void DebugMenu_8077F7C(u8 taskId)
{
    struct Task *task = gTasks + taskId;
    if (gMain.newKeys & A_BUTTON)
    {
        Menu_DisplayDialogueFrame();
        Menu_PrintText(Str_839C014, 2, 15);
        DebugMenu_8077EE0(task->data[1], task->data[2]);
        task->func = DebugMenu_8077FFC;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        task->func = DebugMenu_807806C;
    }
    else if (DebugMenu_8077DD8(task->data + 1, 1, ITEM_15C, gMain.newAndRepeatedKeys) == TRUE)
    {
        DebugMenu_8077EE0(task->data[1], task->data[2]);
    }
}

void DebugMenu_8077FFC(u8 taskId)
{
    struct Task *task = gTasks + taskId;
    if (gMain.newKeys & A_BUTTON)
    {
        if (AddBagItem(task->data[1], task->data[2]) == TRUE)
            PlaySE(SE_SELECT);
        task->func = DebugMenu_8077F40;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        task->func = DebugMenu_8077F40;
    }
    else if (DebugMenu_8077DD8(task->data + 2, 1, 99, gMain.newAndRepeatedKeys) == TRUE)
    {
        DebugMenu_8077EE0(task->data[1], task->data[2]);
    }
}

void DebugMenu_807806C(u8 taskId)
{
    Menu_EraseScreen();
    ScriptContext2_Disable();
    DestroyTask(taskId);
    DebugMenu_8077048();
}

const u8 Str_839C01E[] = _("にがおえ　ばんごう\n"
                           "ポケモンナンバー\n"
                           "ポケモンめい\n"
                           "ブリーダーめい\n"
                           "しゅるい\n"
                           "こせいらんすう");
const u8 Str_839C04D[] = _("データなし");

void DebugMenu_807808C(u32 a0)
{
    u8 strbuf[11];
    struct ContestWinner *winner;

    if (a0 == 0 || a0 > 13)
        a0 = 1;
    winner = gSaveBlock1.contestWinners + a0 - 1;

    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 19, 17);
    Menu_PrintText(Str_839C01E, 2, 2);

    ConvertIntToDecimalStringN(strbuf, a0, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_PrintText(strbuf, 11, 2);

    ConvertIntToDecimalStringN(strbuf, winner->species, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_PrintText(strbuf, 11, 4);

    if (StringLength(winner->nickname) <= 11)
        Menu_PrintText(winner->nickname, 11, 6);
    else
        Menu_PrintText(Str_839C04D, 11, 6);

    if (StringLength(winner->trainerName) <= 11)
        Menu_PrintText(winner->trainerName, 11, 8);
    else
        Menu_PrintText(Str_839C04D, 11, 8);

    ConvertIntToDecimalStringN(strbuf, winner->contestCategory, STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_PrintText(strbuf, 11, 10);

    ConvertIntToHexStringN(strbuf, winner->personality, STR_CONV_MODE_LEADING_ZEROS, 8);
    Menu_PrintText(strbuf, 11, 12);
}

void DebugMenu_807817C(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        Menu_EraseScreen();
        DestroyTask(taskId);
        ScriptContext2_Disable();
    }
}

void DebugMenu_80781A8(u8 taskId)
{
    struct Task *task = gTasks + taskId;

    if (task->data[0] == 0)
        task->data[0]++;
    else if (gMain.newKeys & A_BUTTON)
    {
        DebugMenu_807808C(task->data[0]);
        task->func = DebugMenu_807817C;
        return;
    }
    else if (!DebugMenu_8077DD8(task->data + 0, 1, 13, gMain.newAndRepeatedKeys & (DPAD_UP | DPAD_DOWN)))
        return;
    Menu_BlankWindowRect(4, 17, 22, 18);
    ConvertIntToDecimalStringN(gStringVar1, task->data[0], STR_CONV_MODE_RIGHT_ALIGN, 3);
    Menu_PrintText(gStringVar1, 4, 17);
}

u8 DebugMenu_ViewPortraits(void)
{
    CloseMenu();
    CreateTask(DebugMenu_80781A8, 80);
    ScriptContext2_Enable();
    return TRUE;
}

void DebugMenu_8078254(u32 a0)
{
    DebugMenu_807808C(a0);
}

u8 DebugMenu_AllBadges(void)
{
    FlagSet(FLAG_BADGE01_GET);
    FlagSet(FLAG_BADGE02_GET);
    FlagSet(FLAG_BADGE03_GET);
    FlagSet(FLAG_BADGE04_GET);
    FlagSet(FLAG_BADGE05_GET);
    FlagSet(FLAG_BADGE06_GET);
    FlagSet(FLAG_BADGE07_GET);
    FlagSet(FLAG_BADGE08_GET);
    CloseMenu();
    return TRUE;
}

u8 DebugMenu_TimeRecords(void)
{
    CloseMenu();
    CreateTask(debug_sub_806F9E4, 80);
    ScriptContext2_Enable();
    return TRUE;
}

u8 DebugMenu_SetTime(void)
{
    CloseMenu();
    debug_sub_806F99C();
    ScriptContext2_Enable();
    return TRUE;
}

const u8 Str_839C053[] = _("Miracle Island emerged\n"
                           "Random numbers:{STR_VAR_1}");

void DebugMenu_80782EC(u16 rnums)
{
    ConvertIntToHexStringN(gStringVar1, rnums, STR_CONV_MODE_LEFT_ALIGN, 4);
    sub_8071F40(Str_839C053);
}

void DebugMenu_8078310(u8 taskId)
{
    s16 * data = gTasks[taskId].data;

    switch (data[0])
    {
        case 0:
            data[1] = VarGet(VAR_MIRAGE_RND_H);
            DebugMenu_80782EC(data[1]);
            data[0]++;
            break;
        case 1:
            if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_PINPON);
                *GetVarPointer(VAR_MIRAGE_RND_H) = data[1];
                Menu_EraseScreen();
                DestroyTask(taskId);
                ScriptContext2_Disable();
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                Menu_EraseScreen();
                DestroyTask(taskId);
                ScriptContext2_Disable();
            }
            else if (DebugMenu_8077DD8(data + 1, 0, 0xFFFF, gMain.newAndRepeatedKeys) == TRUE)
                DebugMenu_80782EC(data[1]);
            break;
    }
}

u8 DebugMenu_MiragaIslandRND(void)
{
    CloseMenu();
    CreateTask(DebugMenu_8078310, 80);
    ScriptContext2_Enable();
    return TRUE;
}

bool8 DebugMenu_80783C8(void)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        PlaySE(SE_SELECT);
        if (!FlagGet(FLAG_SYS_GAME_CLEAR))
        {
            FlagSet(FLAG_SYS_GAME_CLEAR);
            DebugMenu_807786C(0);
        }
        else
        {
            FlagClear(FLAG_SYS_GAME_CLEAR);
            DebugMenu_807786C(1);
        }
    }
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        CloseMenu();
        return TRUE;
    }
    return FALSE;
}

u8 DebugMenu_ToggleClearFlag(void)
{
    Menu_EraseScreen();
    DebugMenu_807786C(FlagGet(FLAG_SYS_GAME_CLEAR) ^ 1);
    gMenuCallback = DebugMenu_80783C8;
    return FALSE;
}

bool8 DebugMenu_8078464(void)
{
    switch (DebugMenu_8077E40(FlagGet(FLAG_SYS_WEATHER_CTRL)))
    {
        case 0:
            FlagClear(FLAG_SYS_WEATHER_CTRL);
            return FALSE;
        case 1:
            FlagSet(FLAG_SYS_WEATHER_CTRL);
            return FALSE;
        case -1:
            return TRUE;
    }
    return FALSE;
}

u8 DebugMenu_OpenWeatherEvents(void)
{
    Menu_EraseScreen();
    DebugMenu_807786C(FlagGet(FLAG_SYS_WEATHER_CTRL) ? FALSE : TRUE);
    gMenuCallback = DebugMenu_8078464;
    return FALSE;
}

bool8 DebugMenu_80784E8(void)
{
    switch (DebugMenu_8077E40(IsMysteryGiftEnabled()))
    {
        case 0:
            DisableMysteryGift();
            return FALSE;
        case 1:
            EnableMysteryGift();
            return FALSE;
        case -1:
            return TRUE;
    }
    return FALSE;
}

u8 DebugMenu_OpenMysteryEvent(void)
{
    Menu_EraseScreen();
    DebugMenu_807786C(IsMysteryGiftEnabled() ? FALSE : TRUE);
    gMenuCallback = DebugMenu_80784E8;
    return FALSE;
}

const u8 Str_839C07C[] = _("{STR_VAR_1}:{STR_VAR_2}\n"
                           "{STR_VAR_3}");
const u8 Str_839C085[] = _("みしよう　データ");
const u8 Str_839C08E[] = _("Confirmation");
const u8 Str_839C09B[] = _("Max-1 set");
const u8 Str_839C0A5[] = _("Zero clear");
const u8 Str_839C0B0[] = _("レポート");
const u8 Str_839C0B5[] = _("クリア　じかん");
const u8 Str_839C0BD[] = _("りゅうこう　さくせい");
const u8 Str_839C0C8[] = _("きのみを　うえたかいすう");
const u8 Str_839C0D5[] = _("じてんしゃこうかん");
const u8 Str_839C0DF[] = _("ほすう");
const u8 Str_839C0E3[] = _("インタビュー");
const u8 Str_839C0EA[] = _("バトル");
const u8 Str_839C0EE[] = _("やせいバトル");
const u8 Str_839C0F5[] = _("トレーナーバトル");
const u8 Str_839C0FE[] = _("でんどういり");
const u8 Str_839C105[] = _("ポケモンほかく");
const u8 Str_839C10D[] = _("つった　かいすう");
const u8 Str_839C116[] = _("タマゴかえった");
const u8 Str_839C11E[] = _("しんかした");
const u8 Str_839C124[] = _("ポケセン　かいふく");
const u8 Str_839C12E[] = _("じたく　かいふく");
const u8 Str_839C137[] = _("サファリ　りよう");
const u8 Str_839C140[] = _("ひでん:いあいぎり");
const u8 Str_839C14A[] = _("ひでん:いわくだき");
const u8 Str_839C154[] = _("きち　ひっこし");
const u8 Str_839C15C[] = _("つうしんこうかん");
const u8 Str_839C165[] = _("つうしんたいせん");
const u8 Str_839C16E[] = _("つうしん　かち");
const u8 Str_839C176[] = _("つうしん　まけ");
const u8 Str_839C17E[] = _("つうしん　ひきわけ");
const u8 Str_839C188[] = _("わざ:はねる");
const u8 Str_839C18F[] = _("わざ:わるあがき");
const u8 Str_839C198[] = _("スロットおおあたりかいすう");
const u8 Str_839C1A6[] = _("ルーレット　れんしょう");
const u8 Str_839C1B2[] = _("バトルタワー");
const u8 Str_839C1B9[] = _("バトルタワーかち");
const u8 Str_839C1C2[] = _("バトルタワーれんしょう");
const u8 Str_839C1CE[] = _("ポロックさくせい");
const u8 Str_839C1D7[] = _("つうしんでポロックつくった");
const u8 Str_839C1E5[] = _("つうしんコンテストかち");
const u8 Str_839C1F1[] = _("CPUコンテストさんか");
const u8 Str_839C1FD[] = _("CPUコンテストかち");
const u8 Str_839C208[] = _("かいもの");
const u8 Str_839C20D[] = _("ダウジングマシン");
const u8 Str_839C216[] = _("あめふり");
const u8 Str_839C21B[] = _("ずかんをみた");
const u8 Str_839C222[] = _("リボン　もらった");
const u8 Str_839C22B[] = _("だんさ　とびおり");
const u8 Str_839C234[] = _("TVを　みた");
const u8 Str_839C23B[] = _("とけいを　みた");
const u8 Str_839C243[] = _("くじが　あたった");
const u8 Str_839C24C[] = _("ポケモンあずけた");
const u8 Str_839C255[] = _("ロープウェイりよう");
const u8 Str_839C25F[] = _("おんせん　はいった");

const struct {
    u32 maxVal;
    const u8 * name;
} gUnknown_Debug_839C26C[] = {
    {0xFFFFFF, Str_839C0B0},
    {65485627, Str_839C0B5},
    {0xFFFFFF, Str_839C0BD},
    {0xFFFFFF, Str_839C0C8},
    {0xFFFFFF, Str_839C0D5},
    {0xFFFFFF, Str_839C0DF},
    {0xFFFFFF, Str_839C0E3},
    {0xFFFFFF, Str_839C0EA},
    {0xFFFFFF, Str_839C0EE},
    {0xFFFFFF, Str_839C0F5},
    {999,      Str_839C0FE},
    {0xFFFFFF, Str_839C105},
    {0xFFFFFF, Str_839C10D},
    {0xFFFFFF, Str_839C116},
    {0xFFFFFF, Str_839C11E},
    {0xFFFFFF, Str_839C124},
    {0xFFFFFF, Str_839C12E},
    {0xFFFFFF, Str_839C137},
    {0xFFFFFF, Str_839C140},
    {0xFFFFFF, Str_839C14A},
    {0xFFFFFF, Str_839C154},
    {0xFFFFFF, Str_839C15C},
    {0xFFFFFF, Str_839C165},
    {9999,     Str_839C16E},
    {9999,     Str_839C176},
    {9999,     Str_839C17E},
    {0xFFFFFF, Str_839C188},
    {0xFFFFFF, Str_839C18F},
    {0xFFFFFF, Str_839C198},
    {0xFFFFFF, Str_839C1A6},
    {0xFFFFFF, Str_839C1B2},
    {0x0,      Str_839C1B9},
    {0x0,      Str_839C1C2},
    {0xFFFFFF, Str_839C1CE},
    {0xFFFFFF, Str_839C1D7},
    {0xFFFFFF, Str_839C1E5},
    {0xFFFFFF, Str_839C1F1},
    {0xFFFFFF, Str_839C1FD},
    {0xFFFFFF, Str_839C208},
    {0xFFFFFF, Str_839C20D},
    {0xFFFFFF, Str_839C216},
    {0xFFFFFF, Str_839C21B},
    {0xFFFFFF, Str_839C222},
    {0xFFFFFF, Str_839C22B},
    {0xFFFFFF, Str_839C234},
    {0xFFFFFF, Str_839C23B},
    {0xFFFFFF, Str_839C243},
    {0xFFFFFF, Str_839C24C},
    {0xFFFFFF, Str_839C255},
    {0xFFFFFF, Str_839C25F}
};

void DebugMenu_8078550(u16 gameStat)
{
    u32 value = GetGameStat(gameStat);

    ConvertIntToDecimalStringN(gStringVar1, gameStat, STR_CONV_MODE_LEADING_ZEROS, 2);
    StringCopy(gStringVar2, gUnknown_Debug_839C26C[gameStat].name);
    if (gUnknown_Debug_839C26C[gameStat].maxVal == 0)
        StringCopy(gStringVar3, Str_839C085);
    else if (gameStat != GAME_STAT_FIRST_HOF_PLAY_TIME)
        ConvertIntToDecimalStringN(gStringVar3, value, STR_CONV_MODE_RIGHT_ALIGN, 10);
    else
    {
        ConvertIntToDecimalStringN(gStringVar3, value >> 16, STR_CONV_MODE_RIGHT_ALIGN, 3);
        gStringVar3[3] = CHAR_COLON;
        ConvertIntToDecimalStringN(gStringVar3 + 4, (value >> 8) & 0xff, STR_CONV_MODE_LEADING_ZEROS, 2);
        gStringVar3[6] = CHAR_COLON;
        ConvertIntToDecimalStringN(gStringVar3 + 7, value & 0xff, STR_CONV_MODE_LEADING_ZEROS, 2);
    }
    Menu_DisplayDialogueFrame();
    Menu_PrintText(Str_839C07C, 2, 15);
}

NAKED
bool8 DebugMenu_807860C()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	ldr	r1, ._432       @ gTasks\n"
        "	add	r4, r0, r1\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._428	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._429	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._430	@cond_branch\n"
        "	b	._447\n"
        "._433:\n"
        "	.align	2, 0\n"
        "._432:\n"
        "	.word	gTasks+0x8\n"
        "._429:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._434	@cond_branch\n"
        "	b	._447\n"
        "._430:\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	bl	DebugMenu_8078550\n"
        "._441:\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4]\n"
        "	b	._447\n"
        "._428:\n"
        "	ldr	r3, ._439       @ gMain\n"
        "	ldrh	r1, [r3, #0x2e]\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._437	@cond_branch\n"
        "	ldrh	r0, [r4]\n"
        "	sub	r0, r0, #0x1\n"
        "	strh	r0, [r4]\n"
        "	mov	r0, #0x1\n"
        "	b	._438\n"
        "._440:\n"
        "	.align	2, 0\n"
        "._439:\n"
        "	.word	gMain\n"
        "._437:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r2, r0, #0x10\n"
        "	cmp	r2, #0\n"
        "	bne	._441	@cond_branch\n"
        "	ldrh	r1, [r3, #0x30]\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._442	@cond_branch\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4, #0x2]\n"
        "	lsl	r0, r0, #0x10\n"
        "	asr	r0, r0, #0x10\n"
        "	cmp	r0, #0x32\n"
        "	bne	._446	@cond_branch\n"
        "	strh	r2, [r4, #0x2]\n"
        "	b	._446\n"
        "._442:\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._447	@cond_branch\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	sub	r0, r0, #0x1\n"
        "	strh	r0, [r4, #0x2]\n"
        "	lsl	r0, r0, #0x10\n"
        "	cmp	r0, #0\n"
        "	bge	._446	@cond_branch\n"
        "	mov	r0, #0x31\n"
        "	strh	r0, [r4, #0x2]\n"
        "._446:\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	bl	DebugMenu_8078550\n"
        "	b	._447\n"
        "._434:\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	ScriptContext2_Disable\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "._447:\n"
        "	mov	r0, #0x0\n"
        "._438:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

NAKED
void DebugMenu_80786C0()
{
    asm(
        "	push	{lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	DebugMenu_807860C\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

NAKED
void DebugMenu_80786D0()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	add	r0, r4, #0\n"
        "	bl	DebugMenu_807860C\n"
        "	cmp	r0, #0\n"
        "	beq	._449	@cond_branch\n"
        "	ldr	r1, ._450       @ gTasks\n"
        "	lsl	r0, r4, #0x2\n"
        "	add	r0, r0, r4\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r2, [r0, #0xa]\n"
        "	ldr	r1, ._450 + 4   @ gUnknown_Debug_839C26C\n"
        "	lsl	r0, r2, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	beq	._449	@cond_branch\n"
        "	sub	r1, r0, #1\n"
        "	add	r0, r2, #0\n"
        "	bl	SetGameStat\n"
        "	mov	r0, #0x15\n"
        "	bl	PlaySE\n"
        "._449:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._451:\n"
        "	.align	2, 0\n"
        "._450:\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_Debug_839C26C\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078714()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	add	r0, r4, #0\n"
        "	bl	DebugMenu_807860C\n"
        "	cmp	r0, #0\n"
        "	beq	._453	@cond_branch\n"
        "	ldr	r1, ._454       @ gTasks\n"
        "	lsl	r0, r4, #0x2\n"
        "	add	r0, r0, r4\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r2, [r0, #0xa]\n"
        "	ldr	r1, ._454 + 4   @ gUnknown_Debug_839C26C\n"
        "	lsl	r0, r2, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	beq	._453	@cond_branch\n"
        "	add	r0, r2, #0\n"
        "	mov	r1, #0x0\n"
        "	bl	SetGameStat\n"
        "	mov	r0, #0x15\n"
        "	bl	PlaySE\n"
        "._453:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._455:\n"
        "	.align	2, 0\n"
        "._454:\n"
        "	.word	gTasks\n"
        "	.word	gUnknown_Debug_839C26C\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078758()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	r4, r0, #0\n"
        "	bl	CloseMenu\n"
        "	bl	ScriptContext2_Enable\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	mov	r0, #0x1\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078774()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._456       @ DebugMenu_80786C0\n"
        "	bl	DebugMenu_8078758\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._457:\n"
        "	.align	2, 0\n"
        "._456:\n"
        "	.word	DebugMenu_80786C0+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078788()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._458       @ DebugMenu_80786D0\n"
        "	bl	DebugMenu_8078758\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._459:\n"
        "	.align	2, 0\n"
        "._458:\n"
        "	.word	DebugMenu_80786D0+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_807879C()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._460       @ DebugMenu_8078714\n"
        "	bl	DebugMenu_8078758\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._461:\n"
        "	.align	2, 0\n"
        "._460:\n"
        "	.word	DebugMenu_8078714+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_80787B0()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._462       @ gUnknown_Debug_839C3FC\n"
        "	bl	DebugMenu_8077D78\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._463:\n"
        "	.align	2, 0\n"
        "._462:\n"
        "	.word	gUnknown_Debug_839C3FC\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_OpenLegendsRecord()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._464       @ gUnknown_Debug_839C3FC\n"
        "	mov	r1, #0xc\n"
        "	mov	r2, #0x3\n"
        "	bl	DebugMenu_8077D24\n"
        "	ldr	r1, ._464 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._464 + 8   @ DebugMenu_80787B0\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._465:\n"
        "	.align	2, 0\n"
        "._464:\n"
        "	.word	gUnknown_Debug_839C3FC\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_80787B0+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_80787EC()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	mov	r5, sp\n"
        "	add	r5, r5, #0x2\n"
        "	mov	r0, sp\n"
        "	add	r1, r5, #0\n"
        "	bl	GetXYCoordsOneStepInFrontOfPlayer\n"
        "	ldr	r4, ._466       @ gSpecialVar_Result\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r0, r1]\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r5, r2]\n"
        "	bl	MapGridGetMetatileBehaviorAt\n"
        "	strh	r0, [r4]\n"
        "	ldr	r0, ._466 + 4   @ gStringVar1\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x4\n"
        "	bl	ConvertIntToHexStringN\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r0, r1]\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r5, r2]\n"
        "	bl	MapGridGetMetatileIdAt\n"
        "	strh	r0, [r4]\n"
        "	ldr	r0, ._466 + 8   @ gStringVar2\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x4\n"
        "	bl	ConvertIntToHexStringN\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r0, r1]\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r5, r2]\n"
        "	bl	MapGridGetZCoordAt\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	strh	r0, [r4]\n"
        "	ldr	r0, ._466 + 12  @ gStringVar3\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x4\n"
        "	bl	ConvertIntToHexStringN\n"
        "	ldr	r0, ._466 + 16  @ gStringVar4\n"
        "	ldr	r1, ._466 + 20  @ Str_839C414\n"
        "	bl	StringExpandPlaceholders\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._467:\n"
        "	.align	2, 0\n"
        "._466:\n"
        "	.word	gSpecialVar_Result\n"
        "	.word	gStringVar1\n"
        "	.word	gStringVar2\n"
        "	.word	gStringVar3\n"
        "	.word	gStringVar4\n"
        "	.word	Str_839C414\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078880()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	ldr	r1, ._472       @ gTasks\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r4, r0, r1\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._468	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._469	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._470	@cond_branch\n"
        "	b	._480\n"
        "._473:\n"
        "	.align	2, 0\n"
        "._472:\n"
        "	.word	gTasks\n"
        "._469:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._474	@cond_branch\n"
        "	b	._480\n"
        "._470:\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	b	._476\n"
        "._468:\n"
        "	ldr	r0, ._478       @ gStringVar4\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "._476:\n"
        "	ldrh	r0, [r4, #0x8]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4, #0x8]\n"
        "	b	._480\n"
        "._479:\n"
        "	.align	2, 0\n"
        "._478:\n"
        "	.word	gStringVar4\n"
        "._474:\n"
        "	ldr	r0, ._481       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._480	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	ScriptContext2_Disable\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "._480:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._482:\n"
        "	.align	2, 0\n"
        "._481:\n"
        "	.word	gMain\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_CellInfo()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._483       @ DebugMenu_8078880\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	bl	DebugMenu_80787EC\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._484:\n"
        "	.align	2, 0\n"
        "._483:\n"
        "	.word	DebugMenu_8078880+1\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_OpenBerryInfo()
{
    asm(
        "	push	{r4, lr}\n"
        "	bl	DebugOpenBerryInfo\n"
        "	add	r4, r0, #0\n"
        "	cmp	r4, #0\n"
        "	bne	._485	@cond_branch\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	b	._486\n"
        "._485:\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x13\n"
        "	mov	r3, #0x13\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._487       @ gMenuCallback\n"
        "	ldr	r0, ._487 + 4   @ DebugMenu_8077DB4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "._486:\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._488:\n"
        "	.align	2, 0\n"
        "._487:\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8077DB4+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078950()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._489       @ Str_839C42E\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._490:\n"
        "	.align	2, 0\n"
        "._489:\n"
        "	.word	Str_839C42E\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078968()
{
    asm(
        "	push	{lr}\n"
        "	lsl	r0, r0, #0x10\n"
        "	cmp	r0, #0\n"
        "	bne	._491	@cond_branch\n"
        "	ldr	r0, ._493       @ gStringVar1\n"
        "	mov	r1, #0x32\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	b	._492\n"
        "._494:\n"
        "	.align	2, 0\n"
        "._493:\n"
        "	.word	gStringVar1\n"
        "._491:\n"
        "	ldr	r0, ._495       @ gStringVar1\n"
        "	mov	r1, #0x64\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "._492:\n"
        "	ldr	r0, ._495       @ gStringVar1\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._496:\n"
        "	.align	2, 0\n"
        "._495:\n"
        "	.word	gStringVar1\n"
        "\n"
    );
}

NAKED
void DebugMenu_80789A4()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	r1, r0, #0\n"
        "	lsl	r1, r1, #0x10\n"
        "	lsr	r1, r1, #0x10\n"
        "	ldr	r4, ._497       @ gStringVar1\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x4\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x9\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._498:\n"
        "	.align	2, 0\n"
        "._497:\n"
        "	.word	gStringVar1\n"
        "\n"
    );
}

NAKED
void DebugMenu_80789CC()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r4, r0, #0x2\n"
        "	add	r4, r4, r0\n"
        "	lsl	r4, r4, #0x3\n"
        "	ldr	r6, ._499       @ gTasks\n"
        "	add	r5, r4, r6\n"
        "	mov	r0, #0x0\n"
        "	strh	r0, [r5]\n"
        "	ldr	r0, ._499 + 4   @ gSaveBlock2\n"
        "	ldr	r1, ._499 + 8   @ 0x55c\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r5, #0x2]\n"
        "	bl	DebugMenu_8078950\n"
        "	ldrh	r0, [r5]\n"
        "	bl	DebugMenu_8078968\n"
        "	sub	r6, r6, #0x8\n"
        "	add	r4, r4, r6\n"
        "	ldr	r0, ._499 + 12  @ DebugMenu_8078A14\n"
        "	str	r0, [r4]\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._500:\n"
        "	.align	2, 0\n"
        "._499:\n"
        "	.word	gTasks+0x8\n"
        "	.word	gSaveBlock2\n"
        "	.word	0x55c\n"
        "	.word	DebugMenu_8078A14+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078A14()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r4, r1, #0x3\n"
        "	ldr	r5, ._504       @ gTasks\n"
        "	add	r2, r4, r5\n"
        "	ldr	r0, ._504 + 4   @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0xc0\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._501	@cond_branch\n"
        "	mov	r1, #0x0\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r0, [r2, r3]\n"
        "	cmp	r0, #0\n"
        "	bne	._502	@cond_branch\n"
        "	mov	r1, #0x1\n"
        "._502:\n"
        "	strh	r1, [r2]\n"
        "	ldrh	r0, [r2]\n"
        "	bl	DebugMenu_8078968\n"
        "	b	._510\n"
        "._505:\n"
        "	.align	2, 0\n"
        "._504:\n"
        "	.word	gTasks+0x8\n"
        "	.word	gMain\n"
        "._501:\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._506	@cond_branch\n"
        "	ldr	r1, ._508       @ gSaveBlock2\n"
        "	mov	r3, #0x0\n"
        "	ldsh	r0, [r2, r3]\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldr	r3, ._508 + 4   @ 0x55c\n"
        "	add	r1, r1, r3\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r0, [r0]\n"
        "	strh	r0, [r2, #0x2]\n"
        "	ldrh	r0, [r2, #0x2]\n"
        "	bl	DebugMenu_80789A4\n"
        "	add	r0, r5, #0\n"
        "	sub	r0, r0, #0x8\n"
        "	add	r0, r4, r0\n"
        "	ldr	r1, ._508 + 8   @ DebugMenu_8078AA4\n"
        "	b	._507\n"
        "._509:\n"
        "	.align	2, 0\n"
        "._508:\n"
        "	.word	gSaveBlock2\n"
        "	.word	0x55c\n"
        "	.word	DebugMenu_8078AA4+1\n"
        "._506:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._510	@cond_branch\n"
        "	add	r0, r5, #0\n"
        "	sub	r0, r0, #0x8\n"
        "	add	r0, r4, r0\n"
        "	ldr	r1, ._511       @ DebugMenu_8078B38\n"
        "._507:\n"
        "	str	r1, [r0]\n"
        "._510:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._512:\n"
        "	.align	2, 0\n"
        "._511:\n"
        "	.word	DebugMenu_8078B38+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078AA4()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r5, r1, #0x3\n"
        "	ldr	r7, ._515       @ gTasks\n"
        "	add	r4, r5, r7\n"
        "	add	r0, r4, #2\n"
        "	mov	r2, #0xfa\n"
        "	lsl	r2, r2, #0x3\n"
        "	ldr	r6, ._515 + 4   @ gMain\n"
        "	ldrh	r3, [r6, #0x30]\n"
        "	mov	r1, #0x0\n"
        "	bl	DebugMenu_8077DD8\n"
        "	cmp	r0, #0x1\n"
        "	bne	._513	@cond_branch\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	bl	DebugMenu_80789A4\n"
        "	b	._521\n"
        "._516:\n"
        "	.align	2, 0\n"
        "._515:\n"
        "	.word	gTasks+0x8\n"
        "	.word	gMain\n"
        "._513:\n"
        "	ldrh	r1, [r6, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._517	@cond_branch\n"
        "	ldr	r1, ._519       @ gSaveBlock2\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r0, [r4, r2]\n"
        "	lsl	r0, r0, #0x1\n"
        "	ldr	r2, ._519 + 4   @ 0x55c\n"
        "	add	r1, r1, r2\n"
        "	add	r0, r0, r1\n"
        "	ldrh	r1, [r4, #0x2]\n"
        "	strh	r1, [r0]\n"
        "	mov	r0, #0x49\n"
        "	bl	PlaySE\n"
        "	add	r0, r7, #0\n"
        "	sub	r0, r0, #0x8\n"
        "	add	r0, r5, r0\n"
        "	ldr	r1, ._519 + 8   @ DebugMenu_8078B38\n"
        "	b	._518\n"
        "._520:\n"
        "	.align	2, 0\n"
        "._519:\n"
        "	.word	gSaveBlock2\n"
        "	.word	0x55c\n"
        "	.word	DebugMenu_8078B38+1\n"
        "._517:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._521	@cond_branch\n"
        "	bl	DebugMenu_8078950\n"
        "	ldrh	r0, [r4]\n"
        "	bl	DebugMenu_8078968\n"
        "	add	r0, r7, #0\n"
        "	sub	r0, r0, #0x8\n"
        "	add	r0, r5, r0\n"
        "	ldr	r1, ._522       @ DebugMenu_8078A14\n"
        "._518:\n"
        "	str	r1, [r0]\n"
        "._521:\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._523:\n"
        "	.align	2, 0\n"
        "._522:\n"
        "	.word	DebugMenu_8078A14+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078B38()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	ScriptContext2_Disable\n"
        "	add	r0, r4, #0\n"
        "	bl	DestroyTask\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_BattleTowerStages()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	ScriptContext2_Enable\n"
        "	ldr	r0, ._524       @ DebugMenu_80789CC\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._525:\n"
        "	.align	2, 0\n"
        "._524:\n"
        "	.word	DebugMenu_80789CC+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078B70()
{
    asm(
        "	push	{lr}\n"
        "	add	r1, r0, #0\n"
        "	lsl	r1, r1, #0x10\n"
        "	lsr	r1, r1, #0x10\n"
        "	ldr	r0, ._526       @ gStringVar1\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x1\n"
        "	bl	ConvertIntToHexStringN\n"
        "	ldr	r0, ._526 + 4   @ Str_839C438\n"
        "	bl	sub_8071F40\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._527:\n"
        "	.align	2, 0\n"
        "._526:\n"
        "	.word	gStringVar1\n"
        "	.word	Str_839C438\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078B94()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	mov	r3, #0x0\n"
        "	ldr	r1, ._531       @ gUnknown_Debug_839C444\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0\n"
        "	beq	._529	@cond_branch\n"
        "	ldr	r5, ._531 + 4   @ gSaveBlock1\n"
        "	add	r4, r1, #0\n"
        "._530:\n"
        "	lsl	r0, r3, #0x3\n"
        "	add	r2, r0, r5\n"
        "	add	r0, r0, r4\n"
        "	ldr	r1, [r0, #0x4]\n"
        "	ldr	r0, [r0]\n"
        "	str	r0, [r2]\n"
        "	str	r1, [r2, #0x4]\n"
        "	add	r0, r3, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r3, r0, #0x18\n"
        "	cmp	r3, #0x27\n"
        "	bhi	._529	@cond_branch\n"
        "	lsl	r0, r3, #0x3\n"
        "	add	r0, r0, r4\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0\n"
        "	bne	._530	@cond_branch\n"
        "._529:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._532:\n"
        "	.align	2, 0\n"
        "._531:\n"
        "	.word	gUnknown_Debug_839C444\n"
        "	.word	gSaveBlock1+0x7f8\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078BD4()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	ldr	r1, ._536       @ gTasks\n"
        "	add	r4, r0, r1\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, #0\n"
        "	beq	._533	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	beq	._534	@cond_branch\n"
        "	b	._545\n"
        "._537:\n"
        "	.align	2, 0\n"
        "._536:\n"
        "	.word	gTasks+0x8\n"
        "._533:\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	bl	DebugMenu_8078B70\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4]\n"
        "	b	._545\n"
        "._534:\n"
        "	ldr	r2, ._541       @ gMain\n"
        "	ldrh	r1, [r2, #0x2e]\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._539	@cond_branch\n"
        "	mov	r0, #0x49\n"
        "	bl	PlaySE\n"
        "	bl	Menu_EraseScreen\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "	bl	ScriptContext2_Disable\n"
        "	bl	DebugMenu_8078B94\n"
        "	b	._545\n"
        "._542:\n"
        "	.align	2, 0\n"
        "._541:\n"
        "	.word	gMain\n"
        "._539:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._543	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "	bl	ScriptContext2_Disable\n"
        "	b	._545\n"
        "._543:\n"
        "	add	r0, r4, #2\n"
        "	ldrh	r3, [r2, #0x30]\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x4\n"
        "	bl	DebugMenu_8077DD8\n"
        "	cmp	r0, #0x1\n"
        "	bne	._545	@cond_branch\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	bl	DebugMenu_8078B70\n"
        "._545:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_CheckPKBLCK()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._546       @ DebugMenu_8078BD4\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._547:\n"
        "	.align	2, 0\n"
        "._546:\n"
        "	.word	DebugMenu_8078BD4+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078C80()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._548       @ Str_839C5A4\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._548 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._548 + 8   @ DebugMenu_8078CA8\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._549:\n"
        "	.align	2, 0\n"
        "._548:\n"
        "	.word	Str_839C5A4\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8078CA8+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078CA8()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._552       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._550	@cond_branch\n"
        "	ldr	r1, ._552 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._552 + 8   @ DebugMenu_8078CE4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	b	._555\n"
        "._553:\n"
        "	.align	2, 0\n"
        "._552:\n"
        "	.word	gMain\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8078CE4+1\n"
        "._550:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._554	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._555\n"
        "._554:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "._555:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078CE4()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r1, ._558       @ \n"
        "	mov	r2, #0x80\n"
        "	lsl	r2, r2, #0xa\n"
        "	mov	r0, #0x0\n"
        "	bl	DebugMenu_8078E40\n"
        "	cmp	r0, #0x1\n"
        "	bne	._556	@cond_branch\n"
        "	ldr	r0, ._558 + 4   @ \n"
        "	ldr	r1, ._558 + 8   @ \n"
        "	bl	StringCopy\n"
        "	b	._557\n"
        "._559:\n"
        "	.align	2, 0\n"
        "._558:\n"
        "	.word	+0x2000000\n"
        "	.word	gStringVar4\n"
        "	.word	Str_839C5CC\n"
        "._556:\n"
        "	ldr	r0, ._560       @ gStringVar4\n"
        "	ldr	r1, ._560 + 4   @ Str_839C5DF\n"
        "	bl	StringCopy\n"
        "._557:\n"
        "	ldr	r1, ._560 + 8   @ gMenuCallback\n"
        "	ldr	r0, ._560 + 12  @ DebugMenu_8078D7C\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._561:\n"
        "	.align	2, 0\n"
        "._560:\n"
        "	.word	gStringVar4\n"
        "	.word	Str_839C5DF\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8078D7C+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078D30()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	ldr	r5, ._563       @ \n"
        "	mov	r4, #0x0\n"
        "	mov	r6, #0x80\n"
        "	lsl	r6, r6, #0x5\n"
        "._562:\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r5, #0\n"
        "	add	r2, r6, #0\n"
        "	bl	DebugMenu_8078E68\n"
        "	add	r5, r5, r6\n"
        "	add	r0, r4, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	cmp	r4, #0x1f\n"
        "	bls	._562	@cond_branch\n"
        "	ldr	r0, ._563 + 4   @ \n"
        "	ldr	r1, ._563 + 8   @ \n"
        "	bl	StringCopy\n"
        "	ldr	r1, ._563 + 12  @ \n"
        "	ldr	r0, ._563 + 16  @ \n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._564:\n"
        "	.align	2, 0\n"
        "._563:\n"
        "	.word	+0x2000000\n"
        "	.word	gStringVar4\n"
        "	.word	Str_839C5D6\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8078D7C+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078D7C()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._565       @ gStringVar4\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, ._565 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._565 + 8   @ DebugMenu_8078DA4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._566:\n"
        "	.align	2, 0\n"
        "._565:\n"
        "	.word	gStringVar4\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8078DA4+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078DA4()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._569       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._567	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._568\n"
        "._570:\n"
        "	.align	2, 0\n"
        "._569:\n"
        "	.word	gMain\n"
        "._567:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "._568:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_MeTooBackupMan()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._571       @ gUnknown_Debug_839C594\n"
        "	mov	r1, #0xc\n"
        "	mov	r2, #0x2\n"
        "	bl	DebugMenu_8077D24\n"
        "	ldr	r1, ._571 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._571 + 8   @ DebugMenu_8078DF0\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._572:\n"
        "	.align	2, 0\n"
        "._571:\n"
        "	.word	gUnknown_Debug_839C594\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8078DF0+1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078DF0()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._573       @ gUnknown_Debug_839C594\n"
        "	bl	DebugMenu_8077D78\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._574:\n"
        "	.align	2, 0\n"
        "._573:\n"
        "	.word	gUnknown_Debug_839C594\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078E04()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	r6, r1, #0\n"
        "	add	r5, r2, #0\n"
        "	b	._575\n"
        "._577:\n"
        "	ldr	r0, ._579       @ 0xfffff000\n"
        "	add	r5, r5, r0\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x5\n"
        "	add	r6, r6, r0\n"
        "	add	r0, r4, #1\n"
        "._575:\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r4, r0, #0x10\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	ProgramFlashSectorAndVerify\n"
        "	cmp	r0, #0\n"
        "	bne	._576	@cond_branch\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x5\n"
        "	cmp	r5, r0\n"
        "	bhi	._577	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	b	._578\n"
        "._580:\n"
        "	.align	2, 0\n"
        "._579:\n"
        "	.word	0xfffff000\n"
        "._576:\n"
        "	mov	r0, #0x0\n"
        "._578:\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

NAKED
bool8 DebugMenu_8078E40()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	r4, r0, #0\n"
        "	add	r5, r1, #0\n"
        "	add	r6, r2, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	bl	m4aSoundVSyncOff\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r5, #0\n"
        "	add	r2, r6, #0\n"
        "	bl	DebugMenu_8078E04\n"
        "	add	r4, r0, #0\n"
        "	bl	m4aSoundVSyncOn\n"
        "	add	r0, r4, #0\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078E68()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	r4, r1, #0\n"
        "	add	r3, r2, #0\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	r1, #0x0\n"
        "	add	r2, r4, #0\n"
        "	bl	ReadFlash\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078E80()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	r4, r0, #0\n"
        "	mov	r0, #0x2\n"
        "	mov	r1, #0xf\n"
        "	mov	r2, #0x16\n"
        "	mov	r3, #0x10\n"
        "	bl	Menu_BlankWindowRect\n"
        "	ldr	r1, ._581       @ gUnknown_Debug_839C5F4\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r0, [r4, r2]\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r1, [r0, #0x4]\n"
        "	mov	r0, #0xd0\n"
        "	mov	r2, #0xf\n"
        "	bl	sub_8071F60\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._582:\n"
        "	.align	2, 0\n"
        "._581:\n"
        "	.word	gUnknown_Debug_839C5F4\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078EB0()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	r5, r0, #0\n"
        "	ldr	r4, ._583       @ gStringVar1\n"
        "	mov	r0, #0x2\n"
        "	ldsh	r1, [r5, r0]\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	mov	r0, #0xf0\n"
        "	mov	r1, #0x5\n"
        "	mov	r2, #0x11\n"
        "	bl	sub_8071F60\n"
        "	mov	r0, #0x4\n"
        "	ldsh	r1, [r5, r0]\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x2\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x6\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	mov	r0, #0xf0\n"
        "	mov	r1, #0x8\n"
        "	mov	r2, #0x11\n"
        "	bl	sub_8071F60\n"
        "	mov	r0, #0x6\n"
        "	ldsh	r1, [r5, r0]\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x2\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x9\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._584:\n"
        "	.align	2, 0\n"
        "._583:\n"
        "	.word	gStringVar1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078F1C()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r4, r0, #0x2\n"
        "	add	r4, r4, r0\n"
        "	lsl	r4, r4, #0x3\n"
        "	ldr	r6, ._585       @ gTasks\n"
        "	add	r5, r4, r6\n"
        "	mov	r0, #0x0\n"
        "	strh	r0, [r5]\n"
        "	ldr	r1, ._585 + 4   @ gSaveBlock2\n"
        "	ldrh	r0, [r1, #0xe]\n"
        "	strh	r0, [r5, #0x2]\n"
        "	ldrb	r0, [r1, #0x10]\n"
        "	strh	r0, [r5, #0x4]\n"
        "	ldrb	r0, [r1, #0x11]\n"
        "	strh	r0, [r5, #0x6]\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	add	r0, r5, #0\n"
        "	bl	DebugMenu_8078EB0\n"
        "	add	r0, r5, #0\n"
        "	bl	DebugMenu_8078E80\n"
        "	sub	r6, r6, #0x8\n"
        "	add	r4, r4, r6\n"
        "	ldr	r0, ._585 + 8   @ DebugMenu_8078F68\n"
        "	str	r0, [r4]\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._586:\n"
        "	.align	2, 0\n"
        "._585:\n"
        "	.word	gTasks+0x8\n"
        "	.word	gSaveBlock2\n"
        "	.word	DebugMenu_8078F68+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8078F68()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r5, r1, #0x3\n"
        "	ldr	r6, ._589       @ gTasks\n"
        "	add	r4, r5, r6\n"
        "	ldr	r3, ._589 + 4   @ gMain\n"
        "	ldrh	r1, [r3, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._587	@cond_branch\n"
        "	ldr	r1, ._589 + 8   @ gSaveBlock2\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	strh	r0, [r1, #0xe]\n"
        "	ldrh	r0, [r4, #0x4]\n"
        "	strb	r0, [r1, #0x10]\n"
        "	ldrh	r0, [r4, #0x6]\n"
        "	strb	r0, [r1, #0x11]\n"
        "	mov	r0, #0x49\n"
        "	bl	PlaySE\n"
        "	b	._588\n"
        "._590:\n"
        "	.align	2, 0\n"
        "._589:\n"
        "	.word	gTasks+0x8\n"
        "	.word	gMain\n"
        "	.word	gSaveBlock2\n"
        "._587:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._591	@cond_branch\n"
        "._588:\n"
        "	add	r0, r6, #0\n"
        "	sub	r0, r0, #0x8\n"
        "	add	r0, r5, r0\n"
        "	ldr	r1, ._593       @ DebugMenu_8079020\n"
        "	str	r1, [r0]\n"
        "	b	._601\n"
        "._594:\n"
        "	.align	2, 0\n"
        "._593:\n"
        "	.word	DebugMenu_8079020+1\n"
        "._591:\n"
        "	mov	r0, #0x20\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._595	@cond_branch\n"
        "	ldrh	r1, [r4]\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r0, [r4, r2]\n"
        "	cmp	r0, #0\n"
        "	beq	._601	@cond_branch\n"
        "	sub	r0, r1, #1\n"
        "	b	._597\n"
        "._595:\n"
        "	mov	r0, #0x10\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._598	@cond_branch\n"
        "	ldrh	r0, [r4]\n"
        "	cmp	r0, #0x1\n"
        "	bhi	._601	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "._597:\n"
        "	strh	r0, [r4]\n"
        "	add	r0, r4, #0\n"
        "	bl	DebugMenu_8078E80\n"
        "	b	._601\n"
        "._598:\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r2, [r4, r0]\n"
        "	lsl	r2, r2, #0x3\n"
        "	ldr	r0, ._602       @ gUnknown_Debug_839C5F4\n"
        "	add	r2, r2, r0\n"
        "	ldrb	r0, [r2, #0x5]\n"
        "	lsl	r0, r0, #0x1\n"
        "	add	r0, r4, r0\n"
        "	ldrh	r1, [r2]\n"
        "	ldrh	r2, [r2, #0x2]\n"
        "	ldrh	r3, [r3, #0x30]\n"
        "	bl	DebugMenu_8077DD8\n"
        "	cmp	r0, #0x1\n"
        "	bne	._601	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	bl	DebugMenu_8078EB0\n"
        "._601:\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._603:\n"
        "	.align	2, 0\n"
        "._602:\n"
        "	.word	gUnknown_Debug_839C5F4\n"
        "\n"
    );
}

NAKED
void DebugMenu_8079020()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	ScriptContext2_Disable\n"
        "	add	r0, r4, #0\n"
        "	bl	DestroyTask\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_PTime()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._604       @ DebugMenu_8078F1C\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._605:\n"
        "	.align	2, 0\n"
        "._604:\n"
        "	.word	DebugMenu_8078F1C+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8079058()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	ldr	r1, ._610       @ gTasks\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r4, r0, r1\n"
        "	mov	r0, #0x8\n"
        "	ldsh	r1, [r4, r0]\n"
        "	cmp	r1, #0x1\n"
        "	beq	._606	@cond_branch\n"
        "	cmp	r1, #0x1\n"
        "	bgt	._607	@cond_branch\n"
        "	cmp	r1, #0\n"
        "	beq	._608	@cond_branch\n"
        "	b	._620\n"
        "._611:\n"
        "	.align	2, 0\n"
        "._610:\n"
        "	.word	gTasks\n"
        "._607:\n"
        "	cmp	r1, #0x2\n"
        "	beq	._612	@cond_branch\n"
        "	b	._620\n"
        "._608:\n"
        "	ldr	r0, ._615       @ gUnknown_Debug_03004BD0\n"
        "	str	r1, [r0]\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	b	._614\n"
        "._616:\n"
        "	.align	2, 0\n"
        "._615:\n"
        "	.word	gUnknown_Debug_03004BD0\n"
        "._606:\n"
        "	ldr	r0, ._618       @ gDebug0x839C60C\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	mov	r0, #0x14\n"
        "	mov	r1, #0x8\n"
        "	mov	r2, #0x1\n"
        "	bl	DisplayYesNoMenu\n"
        "._614:\n"
        "	ldrh	r0, [r4, #0x8]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4, #0x8]\n"
        "	b	._620\n"
        "._619:\n"
        "	.align	2, 0\n"
        "._618:\n"
        "	.word	gDebug0x839C60C\n"
        "._612:\n"
        "	bl	Menu_ProcessInputNoWrap_\n"
        "	lsl	r0, r0, #0x18\n"
        "	asr	r1, r0, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	beq	._620	@cond_branch\n"
        "	cmp	r1, #0\n"
        "	bne	._621	@cond_branch\n"
        "	ldr	r1, ._623       @ gUnknown_Debug_03004BD0\n"
        "	mov	r0, #0x1\n"
        "	b	._622\n"
        "._624:\n"
        "	.align	2, 0\n"
        "._623:\n"
        "	.word	gUnknown_Debug_03004BD0\n"
        "._621:\n"
        "	ldr	r1, ._625       @ gUnknown_Debug_03004BD0\n"
        "	mov	r0, #0x0\n"
        "._622:\n"
        "	str	r0, [r1]\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	ScriptContext2_Disable\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "._620:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._626:\n"
        "	.align	2, 0\n"
        "._625:\n"
        "	.word	gUnknown_Debug_03004BD0\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_OpenMurakawa()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._627       @ DebugMenu_8079058\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._628:\n"
        "	.align	2, 0\n"
        "._627:\n"
        "	.word	DebugMenu_8079058+1\n"
        "\n"
    );
}

NAKED
void DebugMenu_8079110()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	ldr	r1, ._633       @ gTasks\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r4, r0, r1\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, #0x1\n"
        "	beq	._629	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	bgt	._630	@cond_branch\n"
        "	cmp	r0, #0\n"
        "	beq	._631	@cond_branch\n"
        "	b	._642\n"
        "._634:\n"
        "	.align	2, 0\n"
        "._633:\n"
        "	.word	gTasks\n"
        "._630:\n"
        "	cmp	r0, #0x2\n"
        "	beq	._635	@cond_branch\n"
        "	b	._642\n"
        "._631:\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	b	._637\n"
        "._629:\n"
        "	ldr	r0, ._639       @ Str_839C61A\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	MenuPrintMessage\n"
        "._637:\n"
        "	ldrh	r0, [r4, #0x8]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4, #0x8]\n"
        "	b	._642\n"
        "._640:\n"
        "	.align	2, 0\n"
        "._639:\n"
        "	.word	Str_839C61A\n"
        "._635:\n"
        "	bl	Menu_UpdateWindowText\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._642	@cond_branch\n"
        "	ldr	r0, ._643       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._642	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	ScriptContext2_Disable\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "._642:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._644:\n"
        "	.align	2, 0\n"
        "._643:\n"
        "	.word	gMain\n"
        "\n"
    );
}

NAKED
u8 DebugMenu_OpenKiwa()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._645       @ DebugMenu_8079110\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	bl	ScriptContext2_Enable\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._646:\n"
        "	.align	2, 0\n"
        "._645:\n"
        "	.word	DebugMenu_8079110+1\n"
        "\n"
    );
}

#endif
