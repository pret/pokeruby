#if DEBUG

#include "global.h"
#include "constants/songs.h"
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

// berry_blender.c
extern void unref_sub_80524BC(void);

void debug_sub_8076BB4(u8);
void debug_sub_8077CF4();

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

__attribute__((unused)) static u8 gUnknown_030006B8[4];
__attribute__((unused)) static u8 gUnknown_030006BC[4];
__attribute__((unused)) static u8 gUnknown_030006C0;
__attribute__((unused)) static u8 gUnknown_030006C1;
static const u8 *gUnknown_030006C4;
__attribute__((unused)) static u8 gUnknown_030006C8;

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

__attribute__((naked))
u8 DebugMenu_8076E18()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_8076B4C\n"
        "	ldr	r0, ._67        @ DebugMenu_8076D6C\n"
        "	mov	r1, #0xa\n"
        "	bl	CreateTask\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._68:\n"
        "	.align	2, 0\n"
        "._67:\n"
        "	.word	DebugMenu_8076D6C+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8076E30()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r3, r0, #0x18\n"
        "	lsl	r0, r3, #0x2\n"
        "	add	r0, r0, r3\n"
        "	lsl	r0, r0, #0x3\n"
        "	ldr	r1, ._73        @ gTasks\n"
        "	add	r4, r0, r1\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r1, [r4, r0]\n"
        "	cmp	r1, #0x1\n"
        "	beq	._69	@cond_branch\n"
        "	cmp	r1, #0x1\n"
        "	bgt	._70	@cond_branch\n"
        "	cmp	r1, #0\n"
        "	beq	._71	@cond_branch\n"
        "	b	._86\n"
        "._74:\n"
        "	.align	2, 0\n"
        "._73:\n"
        "	.word	gTasks+0x8\n"
        "._70:\n"
        "	cmp	r1, #0x2\n"
        "	beq	._75	@cond_branch\n"
        "	b	._86\n"
        "._71:\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._78        @ Str_839BD5A\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	b	._77\n"
        "._79:\n"
        "	.align	2, 0\n"
        "._78:\n"
        "	.word	Str_839BD5A\n"
        "._69:\n"
        "	ldr	r0, ._82        @ gMain\n"
        "	ldrh	r2, [r0, #0x2e]\n"
        "	and	r1, r1, r2\n"
        "	cmp	r1, #0\n"
        "	beq	._80	@cond_branch\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	bl	sub_813B79C\n"
        "	ldr	r0, ._82 + 4    @ Str_839BD7D\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	mov	r0, #0x49\n"
        "	bl	PlaySE\n"
        "._77:\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4]\n"
        "	b	._86\n"
        "._83:\n"
        "	.align	2, 0\n"
        "._82:\n"
        "	.word	gMain\n"
        "	.word	Str_839BD7D\n"
        "._80:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r2\n"
        "	cmp	r0, #0\n"
        "	beq	._86	@cond_branch\n"
        "	add	r0, r3, #0\n"
        "	bl	DestroyTask\n"
        "	bl	DoSoftReset\n"
        "	b	._86\n"
        "._75:\n"
        "	ldr	r0, ._87        @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._86	@cond_branch\n"
        "	add	r0, r3, #0\n"
        "	bl	DestroyTask\n"
        "	bl	DoSoftReset\n"
        "._86:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._88:\n"
        "	.align	2, 0\n"
        "._87:\n"
        "	.word	gMain\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_8076EDC()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_8076B4C\n"
        "	ldr	r0, ._89        @ DebugMenu_8076E30\n"
        "	mov	r1, #0xa\n"
        "	bl	CreateTask\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._90:\n"
        "	.align	2, 0\n"
        "._89:\n"
        "	.word	DebugMenu_8076E30+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8076EF4()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0xb\n"
        "	mov	r3, #0x11\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r4, ._93        @ gUnknown_Debug_839BDC4\n"
        "	mov	r0, #0x2\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x8\n"
        "	add	r3, r4, #0\n"
        "	bl	Menu_PrintItems\n"
        "	mov	r5, #0x0\n"
        "	add	r4, r4, #0x4\n"
        "._92:\n"
        "	lsl	r0, r5, #0x3\n"
        "	add	r0, r0, r4\n"
        "	ldr	r1, [r0]\n"
        "	mov	r0, #0x1\n"
        "	and	r1, r1, r0\n"
        "	mov	r0, #0xb6\n"
        "	cmp	r1, #0\n"
        "	bne	._91	@cond_branch\n"
        "	mov	r0, #0xb5\n"
        "._91:\n"
        "	lsl	r2, r5, #0x1\n"
        "	add	r2, r2, #0x1\n"
        "	lsl	r2, r2, #0x18\n"
        "	lsr	r2, r2, #0x18\n"
        "	mov	r1, #0xa\n"
        "	bl	sub_8071F60\n"
        "	add	r0, r5, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	cmp	r5, #0x7\n"
        "	bls	._92	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	mov	r0, #0x9\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x8\n"
        "	bl	InitMenu\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._94:\n"
        "	.align	2, 0\n"
        "._93:\n"
        "	.word	gUnknown_Debug_839BDC4\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8076F60()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	bl	Menu_ProcessInput\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	bl	Menu_GetCursorPos\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r2, r0, #0x18\n"
        "	lsl	r4, r4, #0x18\n"
        "	asr	r4, r4, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r4, r0\n"
        "	beq	._97	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	cmp	r4, r0\n"
        "	bne	._96	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	debug_sub_8076B68\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "	b	._97\n"
        "._96:\n"
        "	ldr	r3, ._100       @ gUnknown_Debug_839BDC4\n"
        "	lsl	r2, r2, #0x18\n"
        "	asr	r2, r2, #0x15\n"
        "	add	r0, r3, #4\n"
        "	add	r0, r2, r0\n"
        "	ldrb	r4, [r0]\n"
        "	ldr	r0, ._100 + 4   @ gSaveBlock2\n"
        "	mov	r1, #0x1\n"
        "	and	r1, r1, r4\n"
        "	strb	r1, [r0, #0x8]\n"
        "	add	r2, r2, r3\n"
        "	ldr	r1, [r2]\n"
        "	bl	StringCopy\n"
        "	mov	r0, #0x80\n"
        "	and	r4, r4, r0\n"
        "	cmp	r4, #0\n"
        "	bne	._98	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	bl	debug_sub_8057508\n"
        "	b	._99\n"
        "._101:\n"
        "	.align	2, 0\n"
        "._100:\n"
        "	.word	gUnknown_Debug_839BDC4\n"
        "	.word	gSaveBlock2\n"
        "._98:\n"
        "	mov	r0, #0x1\n"
        "	bl	debug_sub_8057508\n"
        "._99:\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "	ldr	r0, ._102       @ debug_sub_8058C00\n"
        "	bl	SetMainCallback2\n"
        "._97:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._103:\n"
        "	.align	2, 0\n"
        "._102:\n"
        "	.word	debug_sub_8058C00+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8076FEC()
{
    asm(
        "	push	{lr}\n"
        "	bl	DebugMenu_8076EF4\n"
        "	ldr	r0, ._104       @ DebugMenu_8076F60\n"
        "	mov	r1, #0xa\n"
        "	bl	CreateTask\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._105:\n"
        "	.align	2, 0\n"
        "._104:\n"
        "	.word	DebugMenu_8076F60+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077004()
{
    asm(
        "	ldr	r2, ._106       @ gUnknown_030006C4\n"
        "	ldr	r0, ._106 + 4   @ gUnknown_030006C1\n"
        "	ldrb	r0, [r0]\n"
        "	lsl	r0, r0, #0x3\n"
        "	ldr	r1, ._106 + 8   @ gUnknown_Debug_839BB64\n"
        "	add	r0, r0, r1\n"
        "	str	r0, [r2]\n"
        "	bx	lr\n"
        "._107:\n"
        "	.align	2, 0\n"
        "._106:\n"
        "	.word	gUnknown_030006C4 \n"
        "	.word	gUnknown_030006C1 \n"
        "	.word	gUnknown_Debug_839BB64\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077020()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	ldr	r0, ._109       @ gMenuCallback\n"
        "	ldr	r0, [r0]\n"
        "	bl	_call_via_r0\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x1\n"
        "	bne	._108	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	bl	DestroyTask\n"
        "._108:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._110:\n"
        "	.align	2, 0\n"
        "._109:\n"
        "	.word	gMenuCallback\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077048()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._111       @ gMenuCallback\n"
        "	ldr	r1, ._111 + 4   @ DebugMenu_807706C\n"
        "	str	r1, [r0]\n"
        "	bl	ScriptContext2_Enable\n"
        "	ldr	r0, ._111 + 8   @ DebugMenu_8077020\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._112:\n"
        "	.align	2, 0\n"
        "._111:\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_807706C+1\n"
        "	.word	DebugMenu_8077020+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_807706C()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._113       @ gWindowTemplate_81E6CE4\n"
        "	bl	InitMenuWindow\n"
        "	bl	DebugMenu_8077004\n"
        "	bl	DebugMenu_807719C\n"
        "	bl	DebugMenu_80771EC\n"
        "	bl	DebugMenu_8077238\n"
        "	ldr	r1, ._113 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._113 + 8   @ DebugMenu_807709C\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._114:\n"
        "	.align	2, 0\n"
        "._113:\n"
        "	.word	gWindowTemplate_81E6CE4\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_807709C+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_807709C()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r4, ._120       @ gMain\n"
        "	ldrh	r1, [r4, #0x2e]\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._115	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	bl	Menu_MoveCursor\n"
        "	ldr	r1, ._120 + 4   @ gUnknown_030006C0\n"
        "	strb	r0, [r1]\n"
        "._115:\n"
        "	ldrh	r1, [r4, #0x2e]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._116	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	mov	r0, #0x1\n"
        "	bl	Menu_MoveCursor\n"
        "	ldr	r1, ._120 + 4   @ gUnknown_030006C0\n"
        "	strb	r0, [r1]\n"
        "._116:\n"
        "	ldrh	r1, [r4, #0x2e]\n"
        "	mov	r0, #0x20\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._117	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r1, ._120 + 8   @ gUnknown_030006C1\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0\n"
        "	bne	._118	@cond_branch\n"
        "	mov	r0, #0x7\n"
        "	b	._119\n"
        "._121:\n"
        "	.align	2, 0\n"
        "._120:\n"
        "	.word	gMain\n"
        "	.word	gUnknown_030006C0 \n"
        "	.word	gUnknown_030006C1 \n"
        "._118:\n"
        "	sub	r0, r0, #0x1\n"
        "._119:\n"
        "	strb	r0, [r1]\n"
        "	bl	DebugMenu_8077004\n"
        "	bl	DebugMenu_807719C\n"
        "._117:\n"
        "	ldr	r0, ._125       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x10\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._122	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r1, ._125 + 4   @ gUnknown_030006C1\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0x7\n"
        "	bne	._123	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._124\n"
        "._126:\n"
        "	.align	2, 0\n"
        "._125:\n"
        "	.word	gMain\n"
        "	.word	gUnknown_030006C1 \n"
        "._123:\n"
        "	add	r0, r0, #0x1\n"
        "._124:\n"
        "	strb	r0, [r1]\n"
        "	bl	DebugMenu_8077004\n"
        "	bl	DebugMenu_807719C\n"
        "._122:\n"
        "	ldr	r0, ._129       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._127	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r1, ._129 + 4   @ gDebug0x839B9BC\n"
        "	ldr	r0, ._129 + 8   @ gUnknown_030006C0\n"
        "	ldrb	r2, [r0]\n"
        "	ldr	r0, ._129 + 12  @ gUnknown_030006C4\n"
        "	ldr	r0, [r0]\n"
        "	add	r0, r0, r2\n"
        "	ldrb	r0, [r0]\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r1, r1, #0x4\n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	bl	_call_via_r0\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	b	._132\n"
        "._130:\n"
        "	.align	2, 0\n"
        "._129:\n"
        "	.word	gMain\n"
        "	.word	gDebug0x839B9BC\n"
        "	.word	gUnknown_030006C0 \n"
        "	.word	gUnknown_030006C4 \n"
        "._127:\n"
        "	mov	r0, #0xa\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._131	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._132\n"
        "._131:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "._132:\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_807719C()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0xe\n"
        "	mov	r3, #0x11\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r3, ._133       @ gDebug0x839B9BC\n"
        "	ldr	r0, ._133 + 4   @ gUnknown_030006C4\n"
        "	ldr	r0, [r0]\n"
        "	str	r0, [sp]\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x8\n"
        "	bl	Menu_PrintItemsReordered\n"
        "	ldr	r4, ._133 + 8   @ gUnknown_030006C0\n"
        "	ldrb	r0, [r4]\n"
        "	str	r0, [sp]\n"
        "	mov	r0, #0xd\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x8\n"
        "	bl	InitMenu\n"
        "	strb	r0, [r4]\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._134:\n"
        "	.align	2, 0\n"
        "._133:\n"
        "	.word	gDebug0x839B9BC\n"
        "	.word	gUnknown_030006C4 \n"
        "	.word	gUnknown_030006C0 \n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_80771EC()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r0, ._135       @ gStringVar4\n"
        "	ldr	r1, ._135 + 4   @ Str_839BE04\n"
        "	bl	StringCopy\n"
        "	ldr	r4, ._135 + 8   @ gSaveBlock1\n"
        "	mov	r1, #0x4\n"
        "	ldsb	r1, [r4, r1]\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r1, #0x5\n"
        "	ldsb	r1, [r4, r1]\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r0, #0x13\n"
        "	mov	r1, #0xc\n"
        "	mov	r2, #0x1d\n"
        "	mov	r3, #0xf\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r0, ._135       @ gStringVar4\n"
        "	mov	r1, #0x14\n"
        "	mov	r2, #0xd\n"
        "	bl	Menu_PrintText\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._136:\n"
        "	.align	2, 0\n"
        "._135:\n"
        "	.word	gStringVar4\n"
        "	.word	Str_839BE04\n"
        "	.word	gSaveBlock1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077238()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	add	sp, sp, #0xffffffe8\n"
        "	ldr	r1, ._139       @ Str_839BE07\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x2\n"
        "	bl	memcpy\n"
        "	add	r0, sp, #0x4\n"
        "	mov	r9, r0\n"
        "	ldr	r1, ._139 + 4   @ Str_839BE09\n"
        "	mov	r2, #0x3\n"
        "	bl	memcpy\n"
        "	add	r1, sp, #0x8\n"
        "	mov	sl, r1\n"
        "	ldr	r1, ._139 + 8   @ Str_839BE0C\n"
        "	mov	r0, sl\n"
        "	mov	r2, #0x3\n"
        "	bl	memcpy\n"
        "	mov	r2, #0x0\n"
        "	str	r2, [sp, #0x14]\n"
        "	add	r4, sp, #0x10\n"
        "	mov	r6, sp\n"
        "	add	r6, r6, #0x12\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r6, #0\n"
        "	bl	PlayerGetDestCoords\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r4, r1]\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r6, r2]\n"
        "	bl	MapGridGetZCoordAt\n"
        "	mov	r8, r0\n"
        "	mov	r0, r8\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	r8, r0\n"
        "	ldrh	r0, [r4]\n"
        "	sub	r0, r0, #0x7\n"
        "	strh	r0, [r4]\n"
        "	ldrh	r0, [r6]\n"
        "	sub	r0, r0, #0x7\n"
        "	strh	r0, [r6]\n"
        "	ldr	r7, ._139 + 12  @ gStringVar4\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, sp\n"
        "	bl	StringCopy\n"
        "	add	r5, sp, #0xc\n"
        "	mov	r2, #0x0\n"
        "	ldsh	r1, [r4, r2]\n"
        "	add	r0, r5, #0\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r7, #0\n"
        "	add	r1, r5, #0\n"
        "	bl	StringAppend\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, r9\n"
        "	bl	StringAppend\n"
        "	mov	r0, #0x0\n"
        "	ldsh	r1, [r6, r0]\n"
        "	add	r0, r5, #0\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r7, #0\n"
        "	add	r1, r5, #0\n"
        "	bl	StringAppend\n"
        "	add	r0, r7, #0\n"
        "	mov	r1, sl\n"
        "	bl	StringAppend\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, r8\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x2\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r7, #0\n"
        "	add	r1, r5, #0\n"
        "	bl	StringAppend\n"
        "	ldrb	r0, [r7]\n"
        "	cmp	r0, #0xff\n"
        "	beq	._137	@cond_branch\n"
        "	add	r1, r7, #0\n"
        "._138:\n"
        "	ldr	r0, [sp, #0x14]\n"
        "	add	r0, r0, #0x1\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	str	r0, [sp, #0x14]\n"
        "	add	r0, r0, r1\n"
        "	ldrb	r0, [r0]\n"
        "	cmp	r0, #0xff\n"
        "	bne	._138	@cond_branch\n"
        "._137:\n"
        "	mov	r0, #0x1c\n"
        "	ldr	r1, [sp, #0x14]\n"
        "	sub	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	r1, #0x10\n"
        "	mov	r2, #0x1d\n"
        "	mov	r3, #0x13\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r0, ._139 + 12  @ gStringVar4\n"
        "	mov	r1, #0x1d\n"
        "	ldr	r2, [sp, #0x14]\n"
        "	sub	r1, r1, r2\n"
        "	lsl	r1, r1, #0x18\n"
        "	lsr	r1, r1, #0x18\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	add	sp, sp, #0x18\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._140:\n"
        "	.align	2, 0\n"
        "._139:\n"
        "	.word	Str_839BE07\n"
        "	.word	Str_839BE09\n"
        "	.word	Str_839BE0C\n"
        "	.word	gStringVar4\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_Exit()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenSogabe()
{
    asm(
        "	push	{lr}\n"
        "	bl	unref_sub_814A414\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenTamada()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_8075C30\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenKagaya()
{
    asm(
        "	push	{lr}\n"
        "	bl	InitKagayaDebugMenu_A\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenMatsuda()
{
    asm(
        "	push	{lr}\n"
        "	bl	unref_sub_80A9B28\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenNohara()
{
    asm(
        "	push	{lr}\n"
        "	bl	InitNoharaDebugMenu\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenWatanabe()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._141       @ InitWatanabeDebugMenu\n"
        "	bl	SetMainCallback2\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._142:\n"
        "	.align	2, 0\n"
        "._141:\n"
        "	.word	InitWatanabeDebugMenu+1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_EndSequenceDemo()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._143       @ sub_81439D0\n"
        "	bl	SetMainCallback2\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._144:\n"
        "	.align	2, 0\n"
        "._143:\n"
        "	.word	sub_81439D0+1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_HallOfFame()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	GameClear\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenSizeComparison()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	InitSizeComparison\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_HoennNationalDex()
{
    asm(
        "	push	{lr}\n"
        "	bl	IsNationalPokedexEnabled\n"
        "	cmp	r0, #0\n"
        "	beq	._145	@cond_branch\n"
        "	bl	DisableNationalPokedex\n"
        "	b	._146\n"
        "._145:\n"
        "	bl	EnableNationalPokedex\n"
        "._146:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_8077434()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	bl	Menu_GetCursorPos\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x4\n"
        "	bhi	._165	@cond_branch\n"
        "	lsl	r0, r0, #0x2\n"
        "	ldr	r1, ._149       @ \n"
        "	add	r0, r0, r1\n"
        "	ldr	r0, [r0]\n"
        "	mov	pc, r0\n"
        "._150:\n"
        "	.align	2, 0\n"
        "._149:\n"
        "	.word	._148\n"
        "._148:\n"
        "	.word	._151\n"
        "	.word	._152\n"
        "	.word	._153\n"
        "	.word	._154\n"
        "	.word	._155\n"
        "._151:\n"
        "	ldr	r0, ._157       @ Str_839BE0F\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x4\n"
        "	bl	GetEnigmaBerryChecksum\n"
        "	mov	r0, #0xff\n"
        "	str	r0, [sp]\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r1, #0xff\n"
        "	mov	r2, #0xff\n"
        "	mov	r3, #0x0\n"
        "	bl	debug_sub_80C2D24\n"
        "	b	._165\n"
        "._158:\n"
        "	.align	2, 0\n"
        "._157:\n"
        "	.word	Str_839BE0F\n"
        "._152:\n"
        "	ldr	r0, ._160       @ Str_839BE12\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0x0\n"
        "	bl	GetEnigmaBerryChecksum\n"
        "	mov	r0, #0xff\n"
        "	str	r0, [sp]\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r1, #0xff\n"
        "	mov	r2, #0x0\n"
        "	b	._159\n"
        "._161:\n"
        "	.align	2, 0\n"
        "._160:\n"
        "	.word	Str_839BE12\n"
        "._153:\n"
        "	ldr	r0, ._163       @ Str_839BE16\n"
        "	mov	r1, #0x3\n"
        "	mov	r2, #0x0\n"
        "	bl	GetEnigmaBerryChecksum\n"
        "	mov	r0, #0xff\n"
        "	str	r0, [sp]\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r1, #0x0\n"
        "	b	._162\n"
        "._164:\n"
        "	.align	2, 0\n"
        "._163:\n"
        "	.word	Str_839BE16\n"
        "._154:\n"
        "	ldr	r0, ._166       @ Str_839BE1A\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0x0\n"
        "	bl	GetEnigmaBerryChecksum\n"
        "	mov	r0, #0xff\n"
        "	str	r0, [sp]\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0xff\n"
        "._162:\n"
        "	mov	r2, #0xff\n"
        "._159:\n"
        "	mov	r3, #0xff\n"
        "	bl	debug_sub_80C2D24\n"
        "	b	._165\n"
        "._167:\n"
        "	.align	2, 0\n"
        "._166:\n"
        "	.word	Str_839BE1A\n"
        "._155:\n"
        "	ldr	r0, ._168       @ Str_839BE1E\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0x0\n"
        "	bl	GetEnigmaBerryChecksum\n"
        "	mov	r0, #0xff\n"
        "	str	r0, [sp]\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r1, #0xff\n"
        "	mov	r2, #0xff\n"
        "	mov	r3, #0xff\n"
        "	bl	debug_sub_80C2D24\n"
        "._165:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._169:\n"
        "	.align	2, 0\n"
        "._168:\n"
        "	.word	Str_839BE1E\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_807750C()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._170       @ gUnknown_Debug_839BE24\n"
        "	bl	DebugMenu_8077D78\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._171:\n"
        "	.align	2, 0\n"
        "._170:\n"
        "	.word	gUnknown_Debug_839BE24\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_SetRamBerry()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._172       @ gUnknown_Debug_839BE24\n"
        "	mov	r1, #0xc\n"
        "	mov	r2, #0x5\n"
        "	bl	DebugMenu_8077D24\n"
        "	ldr	r1, ._172 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._172 + 8   @ DebugMenu_807750C\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._173:\n"
        "	.align	2, 0\n"
        "._172:\n"
        "	.word	gUnknown_Debug_839BE24\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_807750C+1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_ToggleBGM()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r2, ._175       @ gDisableMusic\n"
        "	mov	r1, #0x0\n"
        "	ldrb	r0, [r2]\n"
        "	cmp	r0, #0\n"
        "	bne	._174	@cond_branch\n"
        "	mov	r1, #0x1\n"
        "._174:\n"
        "	strb	r1, [r2]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._176:\n"
        "	.align	2, 0\n"
        "._175:\n"
        "	.word	gDisableMusic\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_BattleForDebug()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	InitBattleForDebug\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_NationalDex()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	mov	r4, #0x0\n"
        "	ldr	r5, ._178       @ 0x181\n"
        "._177:\n"
        "	add	r4, r4, #0x1\n"
        "	lsl	r4, r4, #0x10\n"
        "	lsr	r4, r4, #0x10\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x2\n"
        "	bl	GetSetPokedexFlag\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x3\n"
        "	bl	GetSetPokedexFlag\n"
        "	cmp	r4, r5\n"
        "	bls	._177	@cond_branch\n"
        "	ldr	r1, ._178 + 4   @ gUnknown_03005CE8\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r4, r5}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._179:\n"
        "	.align	2, 0\n"
        "._178:\n"
        "	.word	0x181\n"
        "	.word	gUnknown_03005CE8\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_HoennDex()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	mov	r5, #0x0\n"
        "._180:\n"
        "	add	r5, r5, #0x1\n"
        "	lsl	r5, r5, #0x10\n"
        "	lsr	r5, r5, #0x10\n"
        "	add	r0, r5, #0\n"
        "	bl	HoennToNationalOrder\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x10\n"
        "	lsr	r4, r4, #0x10\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x2\n"
        "	bl	GetSetPokedexFlag\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x3\n"
        "	bl	GetSetPokedexFlag\n"
        "	cmp	r5, #0xc9\n"
        "	bls	._180	@cond_branch\n"
        "	ldr	r1, ._181       @ gUnknown_03005CE8\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r4, r5}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._182:\n"
        "	.align	2, 0\n"
        "._181:\n"
        "	.word	gUnknown_03005CE8\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_CreatePKMN()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	InitCreatePokemon\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_ViewPokemonGraphics()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	InitSeePokemonGraphics\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenSeeTrainers()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	InitSeeTrainers\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenMori()
{
    asm(
        "	push	{lr}\n"
        "	bl	InitMoriDebugMenu\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenTomomichi()
{
    asm(
        "	push	{lr}\n"
        "	bl	InitTomomichiDebugWindow\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenAoki()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenTaya()
{
    asm(
        "	push	{lr}\n"
        "	bl	InitTayaDebugWindow\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenNakamura()
{
    asm(
        "	push	{lr}\n"
        "	bl	InitNakamuraDebugMenu\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenIwasawa()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_8138CC4\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_Teleport()
{
    asm(
        "	push	{lr}\n"
        "	bl	Overworld_SetWarpDestToLastHealLoc\n"
        "	bl	sub_8080E88\n"
        "	bl	ScriptContext2_Enable\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_EditPKMN()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	debug_sub_815FFDC\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_80776B4()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	ldr	r1, ._183       @ Str_839BE4C\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x7\n"
        "	bl	memcpy\n"
        "	lsl	r3, r4, #0x1\n"
        "	lsl	r5, r4, #0x19\n"
        "	lsr	r5, r5, #0x18\n"
        "	add	r3, r3, #0x1\n"
        "	lsl	r3, r3, #0x18\n"
        "	lsr	r3, r3, #0x18\n"
        "	mov	r0, #0x19\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0x1d\n"
        "	bl	Menu_BlankWindowRect\n"
        "	ldr	r0, ._183 + 4   @ gUnknown_030006C8\n"
        "	ldrb	r0, [r0]\n"
        "	ASR	r0, r4\n"
        "	mov	r1, #0x1\n"
        "	and	r0, r0, r1\n"
        "	lsl	r0, r0, #0x2\n"
        "	add r0, r0, sp\n"
        "	mov	r1, #0x19\n"
        "	add	r2, r5, #0\n"
        "	bl	Menu_PrintText\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._184:\n"
        "	.align	2, 0\n"
        "._183:\n"
        "	.word	Str_839BE4C\n"
        "	.word	gUnknown_030006C8 \n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077704()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xffffffec\n"
        "	ldr	r1, ._185       @ Str_839BE53\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x11\n"
        "	bl	memcpy\n"
        "	mov	r0, #0x13\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x1d\n"
        "	mov	r3, #0x8\n"
        "	bl	Menu_BlankWindowRect\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0x15\n"
        "	mov	r2, #0x0\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r2, ._185 + 4   @ gUnknown_030006C8\n"
        "	mov	r0, #0x80\n"
        "	lsl	r0, r0, #0x13\n"
        "	ldrh	r0, [r0]\n"
        "	lsr	r0, r0, #0x8\n"
        "	mov	r1, #0xf\n"
        "	and	r0, r0, r1\n"
        "	strb	r0, [r2]\n"
        "	mov	r0, #0x0\n"
        "	bl	DebugMenu_80776B4\n"
        "	mov	r0, #0x1\n"
        "	bl	DebugMenu_80776B4\n"
        "	mov	r0, #0x2\n"
        "	bl	DebugMenu_80776B4\n"
        "	mov	r0, #0x3\n"
        "	bl	DebugMenu_80776B4\n"
        "	add	sp, sp, #0x14\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._186:\n"
        "	.align	2, 0\n"
        "._185:\n"
        "	.word	Str_839BE53\n"
        "	.word	gUnknown_030006C8 \n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_8077760()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	ldr	r2, ._190       @ gMain\n"
        "	ldrh	r1, [r2, #0x2e]\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r1\n"
        "	add	r5, r2, #0\n"
        "	cmp	r0, #0\n"
        "	beq	._187	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	bl	Menu_MoveCursor\n"
        "	ldr	r1, ._190 + 4   @ gUnknown_030006B8\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0\n"
        "	beq	._188	@cond_branch\n"
        "	sub	r0, r0, #0x1\n"
        "	b	._189\n"
        "._191:\n"
        "	.align	2, 0\n"
        "._190:\n"
        "	.word	gMain\n"
        "	.word	gUnknown_030006B8 \n"
        "._188:\n"
        "	mov	r0, #0x3\n"
        "._189:\n"
        "	strb	r0, [r1]\n"
        "._187:\n"
        "	ldrh	r1, [r5, #0x2e]\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._192	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	mov	r0, #0x1\n"
        "	bl	Menu_MoveCursor\n"
        "	ldr	r1, ._195       @ gUnknown_030006B8\n"
        "	ldrb	r0, [r1]\n"
        "	cmp	r0, #0x3\n"
        "	beq	._193	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	b	._194\n"
        "._196:\n"
        "	.align	2, 0\n"
        "._195:\n"
        "	.word	gUnknown_030006B8 \n"
        "._193:\n"
        "	mov	r0, #0x0\n"
        "._194:\n"
        "	strb	r0, [r1]\n"
        "._192:\n"
        "	ldrh	r1, [r5, #0x2e]\n"
        "	mov	r0, #0x30\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._197	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r4, ._201       @ gUnknown_030006C8\n"
        "	bl	Menu_GetCursorPos\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	r1, #0x1\n"
        "	LSL	r1, r0\n"
        "	ldrb	r0, [r4]\n"
        "	eor	r1, r1, r0\n"
        "	strb	r1, [r4]\n"
        "	bl	Menu_GetCursorPos\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	DebugMenu_80776B4\n"
        "._197:\n"
        "	ldrh	r2, [r5, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r2\n"
        "	cmp	r0, #0\n"
        "	bne	._198	@cond_branch\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r2\n"
        "	cmp	r0, #0\n"
        "	beq	._199	@cond_branch\n"
        "._198:\n"
        "	mov	r2, #0x80\n"
        "	lsl	r2, r2, #0x13\n"
        "	ldrh	r0, [r2]\n"
        "	ldr	r1, ._201 + 4   @ 0xf0ff\n"
        "	and	r1, r1, r0\n"
        "	ldr	r0, ._201       @ gUnknown_030006C8\n"
        "	ldrb	r0, [r0]\n"
        "	lsl	r0, r0, #0x8\n"
        "	add	r1, r1, r0\n"
        "	strh	r1, [r2]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	b	._200\n"
        "._202:\n"
        "	.align	2, 0\n"
        "._201:\n"
        "	.word	gUnknown_030006C8 \n"
        "	.word	0xf0ff\n"
        "._199:\n"
        "	mov	r0, #0x0\n"
        "._200:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_SwitchBG()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	DebugMenu_8077704\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	mov	r0, #0x6\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x14\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x4\n"
        "	bl	InitMenu\n"
        "	ldr	r1, ._203       @ gMenuCallback\n"
        "	ldr	r0, ._203 + 4   @ DebugMenu_8077760\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._204:\n"
        "	.align	2, 0\n"
        "._203:\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8077760+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_807786C()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	ldr	r1, ._205       @ Str_839BE64\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x7\n"
        "	bl	memcpy\n"
        "	mov	r0, #0x19\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x1d\n"
        "	mov	r3, #0x3\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	lsl	r0, r4, #0x1\n"
        "	add	r0, r0, r4\n"
        "	add r0, r0, sp\n"
        "	mov	r1, #0x1a\n"
        "	mov	r2, #0x1\n"
        "	bl	Menu_PrintText\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._206:\n"
        "	.align	2, 0\n"
        "._205:\n"
        "	.word	Str_839BE64\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_80778A8()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r4, ._211       @ gMain\n"
        "	ldrh	r1, [r4, #0x2e]\n"
        "	mov	r0, #0x30\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._207	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r2, ._211 + 4   @ sWildEncountersDisabled\n"
        "	ldrb	r0, [r2]\n"
        "	mov	r1, #0x1\n"
        "	eor	r0, r0, r1\n"
        "	strb	r0, [r2]\n"
        "	ldrb	r0, [r2]\n"
        "	bl	DebugMenu_807786C\n"
        "._207:\n"
        "	ldrh	r1, [r4, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._208	@cond_branch\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._209	@cond_branch\n"
        "._208:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	b	._210\n"
        "._212:\n"
        "	.align	2, 0\n"
        "._211:\n"
        "	.word	gMain\n"
        "	.word	sWildEncountersDisabled\n"
        "._209:\n"
        "	mov	r0, #0x0\n"
        "._210:\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_ControlEncounter()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._213       @ sWildEncountersDisabled\n"
        "	ldrb	r0, [r0]\n"
        "	bl	DebugMenu_807786C\n"
        "	ldr	r1, ._213 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._213 + 8   @ DebugMenu_80778A8\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._214:\n"
        "	.align	2, 0\n"
        "._213:\n"
        "	.word	sWildEncountersDisabled\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_80778A8+1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_UseHM()
{
    asm(
        "	ldr	r1, ._215       @ gMenuCallback\n"
        "	ldr	r0, ._215 + 4   @ DebugMenu_8077C14\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	bx	lr\n"
        "._216:\n"
        "	.align	2, 0\n"
        "._215:\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8077C14+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077934()
{
    asm(
        "	push	{lr}\n"
        "	mov	r1, #0x0\n"
        "	ldr	r3, ._218       @ gSaveBlock1\n"
        "	mov	r2, #0x1\n"
        "._217:\n"
        "	add	r0, r1, r3\n"
        "	strb	r2, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	cmp	r1, #0x63\n"
        "	bls	._217	@cond_branch\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._219:\n"
        "	.align	2, 0\n"
        "._218:\n"
        "	.word	gSaveBlock1+0x97a\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077954()
{
    asm(
        "	push	{lr}\n"
        "	mov	r1, #0x0\n"
        "	ldr	r3, ._222       @ gSaveBlock1\n"
        "	mov	r2, #0x0\n"
        "._221:\n"
        "	add	r0, r1, r3\n"
        "	strb	r2, [r0]\n"
        "	add	r1, r1, #0x1\n"
        "	cmp	r1, #0x63\n"
        "	bls	._221	@cond_branch\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._223:\n"
        "	.align	2, 0\n"
        "._222:\n"
        "	.word	gSaveBlock1+0x97a\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077974()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r1, ._226       @ gSaveBlock1\n"
        "	mov	r0, #0x4\n"
        "	ldsb	r0, [r1, r0]\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	ldrb	r1, [r1, #0x5]\n"
        "	lsl	r1, r1, #0x18\n"
        "	asr	r1, r1, #0x18\n"
        "	lsl	r1, r1, #0x10\n"
        "	lsr	r1, r1, #0x10\n"
        "	bl	IsRematchTrainerIn\n"
        "	cmp	r0, #0\n"
        "	beq	._224	@cond_branch\n"
        "	ldr	r0, ._226 + 4   @ gStringVar1\n"
        "	ldr	r1, ._226 + 8   @ Str_839BE8D\n"
        "	bl	StringCopy\n"
        "	b	._225\n"
        "._227:\n"
        "	.align	2, 0\n"
        "._226:\n"
        "	.word	gSaveBlock1\n"
        "	.word	gStringVar1\n"
        "	.word	Str_839BE8D\n"
        "._224:\n"
        "	ldr	r0, ._230       @ gStringVar1\n"
        "	ldr	r1, ._230 + 4   @ Str_839BE90\n"
        "	bl	StringCopy\n"
        "._225:\n"
        "	ldr	r1, ._230 + 8   @ gSaveBlock1\n"
        "	mov	r0, #0x4\n"
        "	ldsb	r0, [r1, r0]\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	ldrb	r1, [r1, #0x5]\n"
        "	lsl	r1, r1, #0x18\n"
        "	asr	r1, r1, #0x18\n"
        "	lsl	r1, r1, #0x10\n"
        "	lsr	r1, r1, #0x10\n"
        "	bl	DoesSomeoneWantRematchIn\n"
        "	cmp	r0, #0\n"
        "	beq	._228	@cond_branch\n"
        "	ldr	r0, ._230 + 12  @ gStringVar2\n"
        "	ldr	r1, ._230 + 16  @ Str_839BE8D\n"
        "	bl	StringCopy\n"
        "	b	._229\n"
        "._231:\n"
        "	.align	2, 0\n"
        "._230:\n"
        "	.word	gStringVar1\n"
        "	.word	Str_839BE90\n"
        "	.word	gSaveBlock1\n"
        "	.word	gStringVar2\n"
        "	.word	Str_839BE8D\n"
        "._228:\n"
        "	ldr	r0, ._232       @ gStringVar2\n"
        "	ldr	r1, ._232 + 4   @ Str_839BE90\n"
        "	bl	StringCopy\n"
        "._229:\n"
        "	ldr	r0, ._232 + 8   @ Str_839BE6B\n"
        "	bl	sub_8071F40\n"
        "	ldr	r1, ._232 + 12  @ gMenuCallback\n"
        "	ldr	r0, ._232 + 16  @ DebugMenu_8077DB4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._233:\n"
        "	.align	2, 0\n"
        "._232:\n"
        "	.word	gStringVar2\n"
        "	.word	Str_839BE90\n"
        "	.word	Str_839BE6B\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8077DB4+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077A20()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._234       @ gSaveBlock1\n"
        "	ldr	r1, ._234 + 4   @ 0x978\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0xff\n"
        "	strh	r1, [r0]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._235:\n"
        "	.align	2, 0\n"
        "._234:\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x978\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077A40()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._236       @ gSaveBlock1\n"
        "	ldr	r1, ._236 + 4   @ 0x978\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x0\n"
        "	strh	r1, [r0]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._237:\n"
        "	.align	2, 0\n"
        "._236:\n"
        "	.word	gSaveBlock1\n"
        "	.word	0x978\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077A60()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._238       @ gUnknown_Debug_839BEE4\n"
        "	bl	DebugMenu_8077D78\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._239:\n"
        "	.align	2, 0\n"
        "._238:\n"
        "	.word	gUnknown_Debug_839BEE4\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_RematchTrainers()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._240       @ gUnknown_Debug_839BEE4\n"
        "	mov	r1, #0xd\n"
        "	mov	r2, #0x5\n"
        "	bl	DebugMenu_8077D24\n"
        "	ldr	r1, ._240 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._240 + 8   @ DebugMenu_8077A60\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._241:\n"
        "	.align	2, 0\n"
        "._240:\n"
        "	.word	gUnknown_Debug_839BEE4\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8077A60+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077A9C()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r1, ._242       @ gNumSafariBalls\n"
        "	mov	r0, #0x1e\n"
        "	strb	r0, [r1]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._243:\n"
        "	.align	2, 0\n"
        "._242:\n"
        "	.word	gNumSafariBalls\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077AB4()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r1, ._244       @ gNumSafariBalls\n"
        "	mov	r0, #0x1\n"
        "	strb	r0, [r1]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._245:\n"
        "	.align	2, 0\n"
        "._244:\n"
        "	.word	gNumSafariBalls\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077ACC()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r1, ._246       @ gSafariZoneStepCounter\n"
        "	mov	r2, #0xfa\n"
        "	lsl	r2, r2, #0x1\n"
        "	add	r0, r2, #0\n"
        "	strh	r0, [r1]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._247:\n"
        "	.align	2, 0\n"
        "._246:\n"
        "	.word	gSafariZoneStepCounter\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077AE8()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r1, ._248       @ gSafariZoneStepCounter\n"
        "	mov	r0, #0x1\n"
        "	strh	r0, [r1]\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._249:\n"
        "	.align	2, 0\n"
        "._248:\n"
        "	.word	gSafariZoneStepCounter\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077B00()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	unref_sub_80C853C\n"
        "	cmp	r0, #0\n"
        "	beq	._250	@cond_branch\n"
        "	ldr	r0, ._252       @ Str_839BF14\n"
        "	bl	sub_8071F40\n"
        "	b	._251\n"
        "._253:\n"
        "	.align	2, 0\n"
        "._252:\n"
        "	.word	Str_839BF14\n"
        "._250:\n"
        "	ldr	r0, ._254       @ Str_839BF1F\n"
        "	bl	sub_8071F40\n"
        "._251:\n"
        "	ldr	r1, ._254 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._254 + 8   @ DebugMenu_8077DB4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._255:\n"
        "	.align	2, 0\n"
        "._254:\n"
        "	.word	Str_839BF1F\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8077DB4+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077B3C()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._256       @ gUnknown_Debug_839BF6C\n"
        "	bl	DebugMenu_8077D78\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._257:\n"
        "	.align	2, 0\n"
        "._256:\n"
        "	.word	gUnknown_Debug_839BF6C\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_Safari()
{
    asm(
        "	push	{lr}\n"
        "	bl	GetSafariZoneFlag\n"
        "	cmp	r0, #0\n"
        "	beq	._258	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._260       @ gUnknown_Debug_839BF6C\n"
        "	mov	r1, #0xe\n"
        "	mov	r2, #0x5\n"
        "	bl	DebugMenu_8077D24\n"
        "	ldr	r0, ._260 + 4   @ gStringVar1\n"
        "	ldr	r1, ._260 + 8   @ gSafariZoneStepCounter\n"
        "	ldrh	r1, [r1]\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	ldr	r0, ._260 + 12  @ Str_839BF0C\n"
        "	bl	sub_8071F40\n"
        "	ldr	r1, ._260 + 16  @ gMenuCallback\n"
        "	ldr	r0, ._260 + 20  @ DebugMenu_8077B3C\n"
        "	str	r0, [r1]\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x0\n"
        "	b	._259\n"
        "._261:\n"
        "	.align	2, 0\n"
        "._260:\n"
        "	.word	gUnknown_Debug_839BF6C\n"
        "	.word	gStringVar1\n"
        "	.word	gSafariZoneStepCounter\n"
        "	.word	Str_839BF0C\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8077B3C+1\n"
        "._258:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x16\n"
        "	bl	PlaySE\n"
        "	mov	r0, #0x1\n"
        "._259:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077BB4()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_80AFEE4\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077BC0()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_8122080\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077BCC()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_8120968\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077BD8()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_8130318\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077BE4()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_80986AC\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077BF4()
{
    asm(
        "	push	{lr}\n"
        "	bl	debug_sub_80D93F4\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077C00()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._262       @ gUnknown_Debug_839BF94\n"
        "	bl	DebugMenu_8077D78\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._263:\n"
        "	.align	2, 0\n"
        "._262:\n"
        "	.word	gUnknown_Debug_839BF94\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077C14()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._264       @ gUnknown_Debug_839BF94\n"
        "	mov	r1, #0xa\n"
        "	mov	r2, #0x9\n"
        "	bl	DebugMenu_8077D24\n"
        "	ldr	r1, ._264 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._264 + 8   @ DebugMenu_8077C00\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._265:\n"
        "	.align	2, 0\n"
        "._264:\n"
        "	.word	gUnknown_Debug_839BF94\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8077C00+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077C3C()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, sl\n"
        "	mov	r6, r9\n"
        "	mov	r5, r8\n"
        "	push	{r5, r6, r7}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	mov	sl, r0\n"
        "	add	r7, r1, #0\n"
        "	ldr	r0, ._271       @ gUnknown_030006BC\n"
        "	ldr	r1, ._271 + 4   @ gUnknown_Debug_839BFE8\n"
        "	str	r1, [r0]\n"
        "	mov	r1, #0x0\n"
        "	strb	r1, [r7]\n"
        "	add	r7, r7, #0x1\n"
        "	strb	r1, [r7]\n"
        "	add	r7, r7, #0x1\n"
        "	mov	r3, #0x0\n"
        "	mov	r8, r0\n"
        "._269:\n"
        "	mov	r5, #0x0\n"
        "	ldr	r1, ._271       @ gUnknown_030006BC\n"
        "	ldr	r0, [r1]\n"
        "	ldr	r2, [r0, #0x4]\n"
        "	mov	r4, #0x0\n"
        "	ldr	r1, [r0, #0x8]\n"
        "	add	r3, r3, #0x1\n"
        "	mov	r9, r3\n"
        "	cmp	r5, r1\n"
        "	bge	._266	@cond_branch\n"
        "	add	r3, r0, #0\n"
        "	add	r6, r1, #0\n"
        "._267:\n"
        "	ldr	r0, [r3, #0xc]\n"
        "	add	r0, r0, r4\n"
        "	add r0, r0, sl\n"
        "	ldrb	r0, [r0]\n"
        "	sub	r0, r0, #0x30\n"
        "	mul	r0, r0, r2\n"
        "	add	r5, r5, r0\n"
        "	add	r4, r4, #0x1\n"
        "	add	r0, r2, #0\n"
        "	mov	r1, #0xa\n"
        "	str	r3, [sp]\n"
        "	bl	__divsi3\n"
        "	add	r2, r0, #0\n"
        "	ldr	r3, [sp]\n"
        "	cmp	r4, r6\n"
        "	blt	._267	@cond_branch\n"
        "._266:\n"
        "	mov	r0, r8\n"
        "	ldr	r1, [r0]\n"
        "	ldr	r0, [r1]\n"
        "	cmp	r0, r5\n"
        "	bcs	._268	@cond_branch\n"
        "	add	r5, r0, #0\n"
        "._268:\n"
        "	ldrb	r3, [r1, #0x8]\n"
        "	add	r0, r7, #0\n"
        "	add	r1, r5, #0\n"
        "	mov	r2, #0x2\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r7, r0, #0\n"
        "	mov	r3, r9\n"
        "	mov	r1, r8\n"
        "	ldr	r0, [r1]\n"
        "	add	r0, r0, #0x10\n"
        "	str	r0, [r1]\n"
        "	cmp	r3, #0x1\n"
        "	ble	._269	@cond_branch\n"
        "	mov	r1, sl\n"
        "	ldrb	r0, [r1, #0x1d]\n"
        "	add	r0, r0, #0x7a\n"
        "	strb	r0, [r7]\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0xf6\n"
        "	bls	._270	@cond_branch\n"
        "	mov	r0, #0xf6\n"
        "	strb	r0, [r7]\n"
        "._270:\n"
        "	mov	r0, #0xff\n"
        "	strb	r0, [r7, #0x1]\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r3, r4, r5}\n"
        "	mov	r8, r3\n"
        "	mov	r9, r4\n"
        "	mov	sl, r5\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._272:\n"
        "	.align	2, 0\n"
        "._271:\n"
        "	.word	gUnknown_030006BC \n"
        "	.word	gUnknown_Debug_839BFE8\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_8077CF4()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	r4, r0, #0\n"
        "	add	r5, r1, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	lsl	r5, r5, #0x18\n"
        "	lsr	r5, r5, #0x18\n"
        "	ldr	r0, ._273       @ BuildDateTime\n"
        "	ldr	r6, ._273 + 4   @ gStringVar4\n"
        "	add	r1, r6, #0\n"
        "	bl	DebugMenu_8077C3C\n"
        "	add	r0, r6, #0\n"
        "	add	r1, r4, #0\n"
        "	add	r2, r5, #0\n"
        "	bl	Menu_PrintText\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._274:\n"
        "	.align	2, 0\n"
        "._273:\n"
        "	.word	BuildDateTime\n"
        "	.word	gStringVar4\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077D24()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	add	r6, r0, #0\n"
        "	add	r4, r1, #0\n"
        "	add	r5, r2, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	lsl	r5, r5, #0x18\n"
        "	lsr	r5, r5, #0x18\n"
        "	bl	Menu_EraseScreen\n"
        "	lsl	r3, r5, #0x1\n"
        "	add	r3, r3, #0x1\n"
        "	lsl	r3, r3, #0x18\n"
        "	lsr	r3, r3, #0x18\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	add	r2, r4, #0\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	mov	r0, #0x1\n"
        "	mov	r1, #0x1\n"
        "	add	r2, r5, #0\n"
        "	add	r3, r6, #0\n"
        "	bl	Menu_PrintItems\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	sub	r4, r4, #0x1\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	str	r4, [sp, #0x4]\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	add	r3, r5, #0\n"
        "	bl	InitMenu\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077D78()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	r5, r0, #0\n"
        "	bl	Menu_ProcessInput\n"
        "	lsl	r0, r0, #0x18\n"
        "	asr	r4, r0, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r4, r0\n"
        "	beq	._275	@cond_branch\n"
        "	add	r0, r0, #0x1\n"
        "	cmp	r4, r0\n"
        "	beq	._276	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._278       @ gMenuCallback\n"
        "	lsl	r1, r4, #0x3\n"
        "	add	r1, r1, r5\n"
        "	ldr	r1, [r1, #0x4]\n"
        "	str	r1, [r0]\n"
        "._275:\n"
        "	mov	r0, #0x0\n"
        "	b	._277\n"
        "._279:\n"
        "	.align	2, 0\n"
        "._278:\n"
        "	.word	gMenuCallback\n"
        "._276:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "._277:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077DB4()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._282       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._280	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._281\n"
        "._283:\n"
        "	.align	2, 0\n"
        "._282:\n"
        "	.word	gMain\n"
        "._280:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "._281:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077DD8()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	r4, r0, #0\n"
        "	add	r5, r1, #0\n"
        "	lsl	r3, r3, #0x10\n"
        "	lsr	r3, r3, #0x10\n"
        "	add	r1, r3, #0\n"
        "	mov	r0, #0x80\n"
        "	and	r0, r0, r3\n"
        "	cmp	r0, #0\n"
        "	beq	._284	@cond_branch\n"
        "	ldrh	r0, [r4]\n"
        "	sub	r0, r0, #0x1\n"
        "	b	._285\n"
        "._284:\n"
        "	mov	r0, #0x40\n"
        "	and	r0, r0, r3\n"
        "	cmp	r0, #0\n"
        "	beq	._286	@cond_branch\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	b	._287\n"
        "._286:\n"
        "	mov	r0, #0x20\n"
        "	and	r0, r0, r3\n"
        "	cmp	r0, #0\n"
        "	beq	._288	@cond_branch\n"
        "	ldrh	r0, [r4]\n"
        "	sub	r0, r0, #0xa\n"
        "._285:\n"
        "	strh	r0, [r4]\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, r5\n"
        "	bge	._293	@cond_branch\n"
        "	strh	r2, [r4]\n"
        "	b	._293\n"
        "._288:\n"
        "	mov	r0, #0x10\n"
        "	and	r1, r1, r0\n"
        "	cmp	r1, #0\n"
        "	bne	._291	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._292\n"
        "._291:\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0xa\n"
        "._287:\n"
        "	strh	r0, [r4]\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, r2\n"
        "	ble	._293	@cond_branch\n"
        "	strh	r5, [r4]\n"
        "._293:\n"
        "	mov	r0, #0x1\n"
        "._292:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077E40()
{
    asm(
        "	push	{r4, lr}\n"
        "	add	r4, r0, #0\n"
        "	ldr	r0, ._297       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._294	@cond_branch\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._295	@cond_branch\n"
        "._294:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	b	._302\n"
        "._298:\n"
        "	.align	2, 0\n"
        "._297:\n"
        "	.word	gMain\n"
        "._295:\n"
        "	mov	r0, #0x30\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._299	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	cmp	r4, #0\n"
        "	beq	._300	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	bl	DebugMenu_807786C\n"
        "	mov	r0, #0x0\n"
        "	b	._302\n"
        "._300:\n"
        "	mov	r0, #0x0\n"
        "	bl	DebugMenu_807786C\n"
        "	mov	r0, #0x1\n"
        "	b	._302\n"
        "._299:\n"
        "	add	r0, r4, #0\n"
        "._302:\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_MakeItems()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	DebugMenu_8077EAC\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077EAC()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r0, ._303       @ DebugMenu_8077F40\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	add	r4, r0, #0\n"
        "	lsl	r4, r4, #0x18\n"
        "	lsr	r4, r4, #0x18\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r1, ._303 + 4   @ gTasks\n"
        "	lsl	r0, r4, #0x2\n"
        "	add	r0, r0, r4\n"
        "	lsl	r0, r0, #0x3\n"
        "	add	r0, r0, r1\n"
        "	mov	r1, #0x1\n"
        "	strh	r1, [r0, #0xa]\n"
        "	strh	r1, [r0, #0xc]\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._304:\n"
        "	.align	2, 0\n"
        "._303:\n"
        "	.word	DebugMenu_8077F40+1\n"
        "	.word	gTasks\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077EE0()
{
    asm(
        "	push	{r4, r5, r6, lr}\n"
        "	add	r4, r0, #0\n"
        "	add	r6, r1, #0\n"
        "	lsl	r4, r4, #0x10\n"
        "	lsr	r4, r4, #0x10\n"
        "	lsl	r6, r6, #0x10\n"
        "	lsr	r6, r6, #0x10\n"
        "	mov	r0, #0x4\n"
        "	mov	r1, #0x11\n"
        "	mov	r2, #0x16\n"
        "	mov	r3, #0x12\n"
        "	bl	Menu_BlankWindowRect\n"
        "	ldr	r5, ._305       @ gStringVar1\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r4, #0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	add	r0, r4, #0\n"
        "	bl	ItemId_GetItem\n"
        "	mov	r1, #0x8\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	add	r0, r5, #0\n"
        "	add	r1, r6, #0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r5, #0\n"
        "	mov	r1, #0x12\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "	pop	{r4, r5, r6}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._306:\n"
        "	.align	2, 0\n"
        "._305:\n"
        "	.word	gStringVar1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077F40()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r4, r0, #0x2\n"
        "	add	r4, r4, r0\n"
        "	lsl	r4, r4, #0x3\n"
        "	ldr	r0, ._307       @ gTasks\n"
        "	add	r4, r4, r0\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._307 + 4   @ gDebug0x839C008\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	ldrh	r0, [r4, #0xa]\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	bl	DebugMenu_8077EE0\n"
        "	ldr	r0, ._307 + 8   @ DebugMenu_8077F7C\n"
        "	str	r0, [r4]\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._308:\n"
        "	.align	2, 0\n"
        "._307:\n"
        "	.word	gTasks\n"
        "	.word	gDebug0x839C008\n"
        "	.word	DebugMenu_8077F7C+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077F7C()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x3\n"
        "	ldr	r0, ._311       @ gTasks\n"
        "	add	r4, r1, r0\n"
        "	ldr	r3, ._311 + 4   @ gMain\n"
        "	ldrh	r1, [r3, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._309	@cond_branch\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._311 + 8   @ Str_839C014\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	ldrh	r0, [r4, #0xa]\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	bl	DebugMenu_8077EE0\n"
        "	ldr	r0, ._311 + 12  @ DebugMenu_8077FFC\n"
        "	str	r0, [r4]\n"
        "	b	._317\n"
        "._312:\n"
        "	.align	2, 0\n"
        "._311:\n"
        "	.word	gTasks\n"
        "	.word	gMain\n"
        "	.word	Str_839C014\n"
        "	.word	DebugMenu_8077FFC+1\n"
        "._309:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._313	@cond_branch\n"
        "	ldr	r0, ._315       @ DebugMenu_807806C\n"
        "	str	r0, [r4]\n"
        "	b	._317\n"
        "._316:\n"
        "	.align	2, 0\n"
        "._315:\n"
        "	.word	DebugMenu_807806C+1\n"
        "._313:\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0xa\n"
        "	mov	r2, #0xae\n"
        "	lsl	r2, r2, #0x1\n"
        "	ldrh	r3, [r3, #0x30]\n"
        "	mov	r1, #0x1\n"
        "	bl	DebugMenu_8077DD8\n"
        "	cmp	r0, #0x1\n"
        "	bne	._317	@cond_branch\n"
        "	ldrh	r0, [r4, #0xa]\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	bl	DebugMenu_8077EE0\n"
        "._317:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8077FFC()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x3\n"
        "	ldr	r0, ._321       @ gTasks\n"
        "	add	r4, r1, r0\n"
        "	ldr	r2, ._321 + 4   @ gMain\n"
        "	ldrh	r1, [r2, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._318	@cond_branch\n"
        "	ldrh	r0, [r4, #0xa]\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	bl	AddBagItem\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x1\n"
        "	bne	._320	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	b	._320\n"
        "._322:\n"
        "	.align	2, 0\n"
        "._321:\n"
        "	.word	gTasks\n"
        "	.word	gMain\n"
        "._318:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._323	@cond_branch\n"
        "._320:\n"
        "	ldr	r0, ._325       @ DebugMenu_8077F40\n"
        "	str	r0, [r4]\n"
        "	b	._327\n"
        "._326:\n"
        "	.align	2, 0\n"
        "._325:\n"
        "	.word	DebugMenu_8077F40+1\n"
        "._323:\n"
        "	add	r0, r4, #0\n"
        "	add	r0, r0, #0xc\n"
        "	ldrh	r3, [r2, #0x30]\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x63\n"
        "	bl	DebugMenu_8077DD8\n"
        "	cmp	r0, #0x1\n"
        "	bne	._327	@cond_branch\n"
        "	ldrh	r0, [r4, #0xa]\n"
        "	ldrh	r1, [r4, #0xc]\n"
        "	bl	DebugMenu_8077EE0\n"
        "._327:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_807806C()
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
        "	bl	DebugMenu_8077048\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_807808C()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	add	sp, sp, #0xfffffff4\n"
        "	add	r4, r0, #0\n"
        "	sub	r0, r4, #1\n"
        "	cmp	r0, #0xc\n"
        "	bls	._328	@cond_branch\n"
        "	mov	r4, #0x1\n"
        "._328:\n"
        "	lsl	r1, r4, #0x5\n"
        "	ldr	r0, ._331       @ gSaveBlock1\n"
        "	add	r5, r1, r0\n"
        "	bl	Menu_EraseScreen\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0x13\n"
        "	mov	r3, #0x11\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r0, ._331 + 4   @ Str_839C01E\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0x2\n"
        "	bl	Menu_PrintText\n"
        "	mov	r0, sp\n"
        "	add	r1, r4, #0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0x2\n"
        "	bl	Menu_PrintText\n"
        "	ldrh	r1, [r5, #0x8]\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0x4\n"
        "	bl	Menu_PrintText\n"
        "	add	r4, r5, #0\n"
        "	add	r4, r4, #0xb\n"
        "	add	r0, r4, #0\n"
        "	bl	StringLength\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	cmp	r0, #0xb\n"
        "	bhi	._329	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0x6\n"
        "	bl	Menu_PrintText\n"
        "	b	._330\n"
        "._332:\n"
        "	.align	2, 0\n"
        "._331:\n"
        "	.word	gSaveBlock1+0x2ddc\n"
        "	.word	Str_839C01E\n"
        "._329:\n"
        "	ldr	r0, ._335       @ Str_839C04D\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0x6\n"
        "	bl	Menu_PrintText\n"
        "._330:\n"
        "	add	r4, r5, #0\n"
        "	add	r4, r4, #0x16\n"
        "	add	r0, r4, #0\n"
        "	bl	StringLength\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	cmp	r0, #0xb\n"
        "	bhi	._333	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0x8\n"
        "	bl	Menu_PrintText\n"
        "	b	._334\n"
        "._336:\n"
        "	.align	2, 0\n"
        "._335:\n"
        "	.word	Str_839C04D\n"
        "._333:\n"
        "	ldr	r0, ._337       @ Str_839C04D\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0x8\n"
        "	bl	Menu_PrintText\n"
        "._334:\n"
        "	ldrb	r1, [r5, #0xa]\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0xa\n"
        "	bl	Menu_PrintText\n"
        "	ldr	r1, [r5]\n"
        "	mov	r0, sp\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x8\n"
        "	bl	ConvertIntToHexStringN\n"
        "	mov	r0, sp\n"
        "	mov	r1, #0xb\n"
        "	mov	r2, #0xc\n"
        "	bl	Menu_PrintText\n"
        "	add	sp, sp, #0xc\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._338:\n"
        "	.align	2, 0\n"
        "._337:\n"
        "	.word	Str_839C04D\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_807817C()
{
    asm(
        "	push	{r4, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	ldr	r0, ._340       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._339	@cond_branch\n"
        "	bl	Menu_EraseScreen\n"
        "	add	r0, r4, #0\n"
        "	bl	DestroyTask\n"
        "	bl	ScriptContext2_Disable\n"
        "._339:\n"
        "	pop	{r4}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._341:\n"
        "	.align	2, 0\n"
        "._340:\n"
        "	.word	gMain\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_80781A8()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	lsl	r1, r0, #0x2\n"
        "	add	r1, r1, r0\n"
        "	lsl	r1, r1, #0x3\n"
        "	ldr	r0, ._344       @ gTasks\n"
        "	add	r5, r1, r0\n"
        "	ldrh	r1, [r5, #0x8]\n"
        "	mov	r2, #0x8\n"
        "	ldsh	r0, [r5, r2]\n"
        "	cmp	r0, #0\n"
        "	bne	._342	@cond_branch\n"
        "	add	r0, r1, #1\n"
        "	strh	r0, [r5, #0x8]\n"
        "	b	._343\n"
        "._345:\n"
        "	.align	2, 0\n"
        "._344:\n"
        "	.word	gTasks\n"
        "._342:\n"
        "	ldr	r2, ._348       @ gMain\n"
        "	ldrh	r1, [r2, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._346	@cond_branch\n"
        "	mov	r1, #0x8\n"
        "	ldsh	r0, [r5, r1]\n"
        "	bl	DebugMenu_807808C\n"
        "	ldr	r0, ._348 + 4   @ DebugMenu_807817C\n"
        "	str	r0, [r5]\n"
        "	b	._350\n"
        "._349:\n"
        "	.align	2, 0\n"
        "._348:\n"
        "	.word	gMain\n"
        "	.word	DebugMenu_807817C+1\n"
        "._346:\n"
        "	add	r0, r5, #0\n"
        "	add	r0, r0, #0x8\n"
        "	ldrh	r1, [r2, #0x30]\n"
        "	mov	r3, #0xc0\n"
        "	and	r3, r3, r1\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0xd\n"
        "	bl	DebugMenu_8077DD8\n"
        "	cmp	r0, #0\n"
        "	beq	._350	@cond_branch\n"
        "._343:\n"
        "	mov	r0, #0x4\n"
        "	mov	r1, #0x11\n"
        "	mov	r2, #0x16\n"
        "	mov	r3, #0x12\n"
        "	bl	Menu_BlankWindowRect\n"
        "	ldr	r4, ._351       @ gStringVar1\n"
        "	mov	r2, #0x8\n"
        "	ldsh	r1, [r5, r2]\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	add	r0, r4, #0\n"
        "	mov	r1, #0x4\n"
        "	mov	r2, #0x11\n"
        "	bl	Menu_PrintText\n"
        "._350:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._352:\n"
        "	.align	2, 0\n"
        "._351:\n"
        "	.word	gStringVar1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_ViewPortraits()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._353       @ DebugMenu_80781A8\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._354:\n"
        "	.align	2, 0\n"
        "._353:\n"
        "	.word	DebugMenu_80781A8+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8078254()
{
    asm(
        "	push	{lr}\n"
        "	bl	DebugMenu_807808C\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_AllBadges()
{
    asm(
        "	push	{lr}\n"
        "	ldr	r0, ._355       @ 0x807\n"
        "	bl	FlagSet\n"
        "	ldr	r0, ._355 + 4   @ 0x808\n"
        "	bl	FlagSet\n"
        "	ldr	r0, ._355 + 8   @ 0x809\n"
        "	bl	FlagSet\n"
        "	ldr	r0, ._355 + 12  @ 0x80a\n"
        "	bl	FlagSet\n"
        "	ldr	r0, ._355 + 16  @ 0x80b\n"
        "	bl	FlagSet\n"
        "	ldr	r0, ._355 + 20  @ 0x80c\n"
        "	bl	FlagSet\n"
        "	ldr	r0, ._355 + 24  @ 0x80d\n"
        "	bl	FlagSet\n"
        "	ldr	r0, ._355 + 28  @ 0x80e\n"
        "	bl	FlagSet\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._356:\n"
        "	.align	2, 0\n"
        "._355:\n"
        "	.word	0x807\n"
        "	.word	0x808\n"
        "	.word	0x809\n"
        "	.word	0x80a\n"
        "	.word	0x80b\n"
        "	.word	0x80c\n"
        "	.word	0x80d\n"
        "	.word	0x80e\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_TimeRecords()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._357       @ debug_sub_806F9E4\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._358:\n"
        "	.align	2, 0\n"
        "._357:\n"
        "	.word	debug_sub_806F9E4+1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_SetTime()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	debug_sub_806F99C\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_80782EC()
{
    asm(
        "	push	{lr}\n"
        "	add	r1, r0, #0\n"
        "	lsl	r1, r1, #0x10\n"
        "	lsr	r1, r1, #0x10\n"
        "	ldr	r0, ._359       @ gStringVar1\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x4\n"
        "	bl	ConvertIntToHexStringN\n"
        "	ldr	r0, ._359 + 4   @ Str_839C053\n"
        "	bl	sub_8071F40\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._360:\n"
        "	.align	2, 0\n"
        "._359:\n"
        "	.word	gStringVar1\n"
        "	.word	Str_839C053\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8078310()
{
    asm(
        "	push	{r4, r5, lr}\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r5, r0, #0x18\n"
        "	lsl	r0, r5, #0x2\n"
        "	add	r0, r0, r5\n"
        "	lsl	r0, r0, #0x3\n"
        "	ldr	r1, ._364       @ gTasks\n"
        "	add	r4, r0, r1\n"
        "	mov	r1, #0x0\n"
        "	ldsh	r0, [r4, r1]\n"
        "	cmp	r0, #0\n"
        "	beq	._361	@cond_branch\n"
        "	cmp	r0, #0x1\n"
        "	beq	._362	@cond_branch\n"
        "	b	._375\n"
        "._365:\n"
        "	.align	2, 0\n"
        "._364:\n"
        "	.word	gTasks+0x8\n"
        "._361:\n"
        "	ldr	r0, ._367       @ 0x4024\n"
        "	bl	VarGet\n"
        "	strh	r0, [r4, #0x2]\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	bl	DebugMenu_80782EC\n"
        "	ldrh	r0, [r4]\n"
        "	add	r0, r0, #0x1\n"
        "	strh	r0, [r4]\n"
        "	b	._375\n"
        "._368:\n"
        "	.align	2, 0\n"
        "._367:\n"
        "	.word	0x4024\n"
        "._362:\n"
        "	ldr	r3, ._371       @ gMain\n"
        "	ldrh	r1, [r3, #0x2e]\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._369	@cond_branch\n"
        "	mov	r0, #0x49\n"
        "	bl	PlaySE\n"
        "	ldr	r0, ._371 + 4   @ 0x4024\n"
        "	bl	GetVarPointer\n"
        "	ldrh	r1, [r4, #0x2]\n"
        "	strh	r1, [r0]\n"
        "	b	._370\n"
        "._372:\n"
        "	.align	2, 0\n"
        "._371:\n"
        "	.word	gMain\n"
        "	.word	0x4024\n"
        "._369:\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._373	@cond_branch\n"
        "._370:\n"
        "	bl	Menu_EraseScreen\n"
        "	add	r0, r5, #0\n"
        "	bl	DestroyTask\n"
        "	bl	ScriptContext2_Disable\n"
        "	b	._375\n"
        "._373:\n"
        "	add	r0, r4, #2\n"
        "	ldr	r2, ._376       @ 0xffff\n"
        "	ldrh	r3, [r3, #0x30]\n"
        "	mov	r1, #0x0\n"
        "	bl	DebugMenu_8077DD8\n"
        "	cmp	r0, #0x1\n"
        "	bne	._375	@cond_branch\n"
        "	ldrh	r0, [r4, #0x2]\n"
        "	bl	DebugMenu_80782EC\n"
        "._375:\n"
        "	pop	{r4, r5}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._377:\n"
        "	.align	2, 0\n"
        "._376:\n"
        "	.word	0xffff\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_MiragaIslandRND()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._378       @ DebugMenu_8078310\n"
        "	mov	r1, #0x50\n"
        "	bl	CreateTask\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._379:\n"
        "	.align	2, 0\n"
        "._378:\n"
        "	.word	DebugMenu_8078310+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_80783C8()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r0, ._383       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x30\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._382	@cond_branch\n"
        "	mov	r0, #0x5\n"
        "	bl	PlaySE\n"
        "	ldr	r4, ._383 + 4   @ 0x804\n"
        "	add	r0, r4, #0\n"
        "	bl	FlagGet\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._381	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	bl	FlagSet\n"
        "	mov	r0, #0x0\n"
        "	bl	DebugMenu_807786C\n"
        "	b	._382\n"
        "._384:\n"
        "	.align	2, 0\n"
        "._383:\n"
        "	.word	gMain\n"
        "	.word	0x804\n"
        "._381:\n"
        "	add	r0, r4, #0\n"
        "	bl	FlagClear\n"
        "	mov	r0, #0x1\n"
        "	bl	DebugMenu_807786C\n"
        "._382:\n"
        "	ldr	r0, ._388       @ gMain\n"
        "	ldrh	r1, [r0, #0x2e]\n"
        "	mov	r0, #0x1\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	bne	._385	@cond_branch\n"
        "	mov	r0, #0x2\n"
        "	and	r0, r0, r1\n"
        "	cmp	r0, #0\n"
        "	beq	._386	@cond_branch\n"
        "._385:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "	b	._387\n"
        "._389:\n"
        "	.align	2, 0\n"
        "._388:\n"
        "	.word	gMain\n"
        "._386:\n"
        "	mov	r0, #0x0\n"
        "._387:\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_ToggleClearFlag()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._390       @ 0x804\n"
        "	bl	FlagGet\n"
        "	mov	r1, #0x1\n"
        "	eor	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	DebugMenu_807786C\n"
        "	ldr	r1, ._390 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._390 + 8   @ DebugMenu_80783C8\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._391:\n"
        "	.align	2, 0\n"
        "._390:\n"
        "	.word	0x804\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_80783C8+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8078464()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r4, ._396       @ 0x82a\n"
        "	add	r0, r4, #0\n"
        "	bl	FlagGet\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	DebugMenu_8077E40\n"
        "	add	r1, r0, #0\n"
        "	cmp	r1, #0\n"
        "	beq	._392	@cond_branch\n"
        "	cmp	r1, #0\n"
        "	bgt	._393	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	beq	._394	@cond_branch\n"
        "	b	._401\n"
        "._397:\n"
        "	.align	2, 0\n"
        "._396:\n"
        "	.word	0x82a\n"
        "._393:\n"
        "	cmp	r1, #0x1\n"
        "	beq	._398	@cond_branch\n"
        "	b	._401\n"
        "._392:\n"
        "	add	r0, r4, #0\n"
        "	bl	FlagClear\n"
        "	b	._401\n"
        "._398:\n"
        "	add	r0, r4, #0\n"
        "	bl	FlagSet\n"
        "	b	._401\n"
        "._394:\n"
        "	mov	r0, #0x1\n"
        "	b	._402\n"
        "._401:\n"
        "	mov	r0, #0x0\n"
        "._402:\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenWeatherEvents()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	ldr	r0, ._404       @ 0x82a\n"
        "	bl	FlagGet\n"
        "	mov	r1, #0x0\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	bne	._403	@cond_branch\n"
        "	mov	r1, #0x1\n"
        "._403:\n"
        "	add	r0, r1, #0\n"
        "	bl	DebugMenu_807786C\n"
        "	ldr	r1, ._404 + 4   @ gMenuCallback\n"
        "	ldr	r0, ._404 + 8   @ DebugMenu_8078464\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._405:\n"
        "	.align	2, 0\n"
        "._404:\n"
        "	.word	0x82a\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_8078464+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_80784E8()
{
    asm(
        "	push	{lr}\n"
        "	bl	IsMysteryGiftEnabled\n"
        "	bl	DebugMenu_8077E40\n"
        "	add	r1, r0, #0\n"
        "	cmp	r1, #0\n"
        "	beq	._406	@cond_branch\n"
        "	cmp	r1, #0\n"
        "	bgt	._407	@cond_branch\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	beq	._408	@cond_branch\n"
        "	b	._413\n"
        "._407:\n"
        "	cmp	r1, #0x1\n"
        "	beq	._410	@cond_branch\n"
        "	b	._413\n"
        "._406:\n"
        "	bl	DisableMysteryGift\n"
        "	b	._413\n"
        "._410:\n"
        "	bl	EnableMysteryGift\n"
        "	b	._413\n"
        "._408:\n"
        "	mov	r0, #0x1\n"
        "	b	._414\n"
        "._413:\n"
        "	mov	r0, #0x0\n"
        "._414:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 DebugMenu_OpenMysteryEvent()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_EraseScreen\n"
        "	bl	IsMysteryGiftEnabled\n"
        "	mov	r1, #0x0\n"
        "	cmp	r0, #0\n"
        "	bne	._415	@cond_branch\n"
        "	mov	r1, #0x1\n"
        "._415:\n"
        "	add	r0, r1, #0\n"
        "	bl	DebugMenu_807786C\n"
        "	ldr	r1, ._416       @ gMenuCallback\n"
        "	ldr	r0, ._416 + 4   @ DebugMenu_80784E8\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._417:\n"
        "	.align	2, 0\n"
        "._416:\n"
        "	.word	gMenuCallback\n"
        "	.word	DebugMenu_80784E8+1\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_8078550()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r6, r0, #0x10\n"
        "	lsl	r0, r6, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	bl	GetGameStat\n"
        "	add	r7, r0, #0\n"
        "	ldr	r0, ._420       @ gStringVar1\n"
        "	add	r1, r6, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x2\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	ldr	r0, ._420 + 4   @ gStringVar2\n"
        "	ldr	r5, ._420 + 8   @ gUnknown_Debug_839C26C\n"
        "	lsl	r4, r6, #0x3\n"
        "	add	r1, r5, #4\n"
        "	add	r1, r4, r1\n"
        "	ldr	r1, [r1]\n"
        "	bl	StringCopy\n"
        "	add	r4, r4, r5\n"
        "	ldr	r0, [r4]\n"
        "	cmp	r0, #0\n"
        "	bne	._418	@cond_branch\n"
        "	ldr	r0, ._420 + 12  @ gStringVar3\n"
        "	ldr	r1, ._420 + 16  @ Str_839C085\n"
        "	bl	StringCopy\n"
        "	b	._423\n"
        "._421:\n"
        "	.align	2, 0\n"
        "._420:\n"
        "	.word	gStringVar1\n"
        "	.word	gStringVar2\n"
        "	.word	gUnknown_Debug_839C26C\n"
        "	.word	gStringVar3\n"
        "	.word	Str_839C085\n"
        "._418:\n"
        "	cmp	r6, #0x1\n"
        "	beq	._422	@cond_branch\n"
        "	ldr	r0, ._424       @ gStringVar3\n"
        "	add	r1, r7, #0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0xa\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	b	._423\n"
        "._425:\n"
        "	.align	2, 0\n"
        "._424:\n"
        "	.word	gStringVar3\n"
        "._422:\n"
        "	ldr	r4, ._426       @ gStringVar3\n"
        "	lsr	r1, r7, #0x10\n"
        "	add	r0, r4, #0\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	mov	r6, #0xf0\n"
        "	strb	r6, [r4, #0x3]\n"
        "	add	r0, r4, #4\n"
        "	lsr	r1, r7, #0x8\n"
        "	mov	r5, #0xff\n"
        "	and	r1, r1, r5\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x2\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "	strb	r6, [r4, #0x6]\n"
        "	add	r4, r4, #0x7\n"
        "	and	r7, r7, r5\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r7, #0\n"
        "	mov	r2, #0x2\n"
        "	mov	r3, #0x2\n"
        "	bl	ConvertIntToDecimalStringN\n"
        "._423:\n"
        "	bl	Menu_DisplayDialogueFrame\n"
        "	ldr	r0, ._426 + 4   @ Str_839C07C\n"
        "	mov	r1, #0x2\n"
        "	mov	r2, #0xf\n"
        "	bl	Menu_PrintText\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._427:\n"
        "	.align	2, 0\n"
        "._426:\n"
        "	.word	gStringVar3\n"
        "	.word	Str_839C07C\n"
        "\n"
    );
}

__attribute__((naked))
void DebugMenu_807860C()
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
void DebugMenu_8078758()
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

__attribute__((naked))
void DebugMenu_8078774()
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

__attribute__((naked))
void DebugMenu_8078788()
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

__attribute__((naked))
void DebugMenu_807879C()
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

__attribute__((naked))
void DebugMenu_80787B0()
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
void DebugMenu_8078C80()
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

__attribute__((naked))
void DebugMenu_8078CA8()
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

__attribute__((naked))
void DebugMenu_8078CE4()
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

__attribute__((naked))
void DebugMenu_8078D30()
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

__attribute__((naked))
void DebugMenu_8078D7C()
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

__attribute__((naked))
void DebugMenu_8078DA4()
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

__attribute__((naked))
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

__attribute__((naked))
void DebugMenu_8078DF0()
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

__attribute__((naked))
void DebugMenu_8078E04()
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

__attribute__((naked))
void DebugMenu_8078E40()
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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

__attribute__((naked))
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
