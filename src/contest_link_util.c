#include "global.h"
#include "contest_link_util.h"
#include "battle.h"
#include "blend_palette.h"
#include "constants/songs.h"
#include "contest.h"
#include "contest_link.h"
#include "data2.h"
#include "decompress.h"
#include "event_data.h"
#include "ewram.h"
#include "field_effect.h"
#include "field_specials.h"
#include "graphics.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "overworld.h"
#include "palette.h"
#include "pokedex.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system.h"
#include "random.h"
#include "scanline_effect.h"
#include "script.h"
#include "sound.h"
#include "string_util.h"
#include "strings2.h"
#include "text.h"
#include "trig.h"
#include "tv.h"
#include "util.h"

#define ABS(x) ((x) < 0 ? -(x) : (x))

#define GET_CONTEST_WINNER(var) {           \
    for ((var) = 0; (var) < 4; (var)++)     \
    {                                       \
        if (gContestFinalStandings[i] == 0) \
            break;                          \
    }                                       \
}

struct UnkEwramStruct18000 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
    u8 unk_04;
    u8 unk_05;
    u8 unk_06;
    u8 unk_07;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0a;
    s16 unk_0c[4];
    u8 unk_14;
};

struct UnkEwramStruct18018 {
    s32 unk_00;
    s32 unk_04;
    u32 unk_08;
    u32 unk_0c;
    u8 unk_10;
    u8 unk_11;
    u8 unk_12;
};

#define eContestLink80C2020Struct2018000 (*(struct UnkEwramStruct18000 *)(gSharedMem + 0x18000))
#define eContestLink80C2020Struct2018018 ((struct UnkEwramStruct18018 *)(gSharedMem + 0x18018))
#define eContestLink80C2020Struct2018068 (gSharedMem + 0x18068)

static void sub_80C2430(void);
static void sub_80C2448(void);
static void sub_80C24F4(u8 taskId);
static void sub_80C255C(u8 taskId);
static void sub_80C25A4(u8 taskId);
static void sub_80C25C0(u8 taskId);
static void sub_80C2600(u8 taskId);
static void sub_80C26E4(u8 taskId);
static void sub_80C2770(u8 taskId);
static void sub_80C27EC(u8 taskId);
static void sub_80C2878(u8 taskId);
static void sub_80C2A8C(u8 taskId);
static void sub_80C2D1C(u8 taskId);
static void sub_80C2D80(u8 taskId);
static void sub_80C2DD8(u8 taskId);
static void sub_80C2E14(u8 taskId);
static void sub_80C2EA0(u8 taskId);
static void sub_80C2F28(u8 taskId);
static void sub_80C2F64(u8 taskId);
static void LoadAllContestMonIcons(u8 srcOffset, bool8 useDmaNow);
void sub_80C310C(void);
void sub_80C3158(const u8 *string, u8 spriteId);
void sub_80C33DC(void);
u16 sub_80C34AC(const u8 *string);
void sub_80C34CC(s16 data4, u16 pos0y, u16 data5, u16 data6);
void sub_80C3520(u16 a0);
void sub_80C3588(struct Sprite *sprite);
void sub_80C35FC(struct Sprite *sprite);
void sub_80C3630(struct Sprite *sprite);
void sub_80C3698(const u8 *string);
void sub_80C3764(void);
void sub_80C37E4(void);
u8 sub_80C3990(u8 a0, u8 a1);
s8 sub_80C39E4(u8 a0, u8 a1);
void sub_80C3A5C(u8 taskId);
void sub_80C3BD8(u8 taskId);
void sub_80C3B30(u8 taskId);
void sub_80C3C44(struct Sprite *sprite);
void sub_80C3CB8(struct Sprite *sprite);
void sub_80C3D04(u8 taskId);
void sub_80C3DF0(struct Sprite *sprite);
void sub_80C3E60(u8 a0, u8 a1);
void sub_80C3EA4(u8 taskId);
void sub_80C3F00(void);
void sub_80C40D4(u8 a0, u8 a1);
void sub_80C42C0(u8 taskId);
void Task_StartCommunication(u8 taskId);
void Task_StartCommunicateRng(u8 taskId);
void Task_StartCommunicateLeaderIds(u8 taskId);
void Task_StartCommunicateCategory(u8 taskId);
void Task_LinkContest_SetUpContest(u8 taskId);
void Task_LinkContest_CalculateTurnOrder(u8 taskId);
void Task_LinkContest_FinalizeConnection(u8 taskId);
void Task_LinkContest_Disconnect(u8 taskId);
void Task_LinkContest_WaitDisconnect(u8 taskId);

const u16 gUnknown_083D1624[] = INCBIN_U16("graphics/unknown/unknown_3D1624/0.4bpp");
const u16 gUnknown_083D1644[] = INCBIN_U16("graphics/unknown/unknown_3D1624/1.4bpp");
const u16 gUnknown_083D1664[] = INCBIN_U16("graphics/unknown/unknown_3D1624/2.4bpp");
const u16 gUnknown_083D1684[] = INCBIN_U16("graphics/unknown/unknown_3D1624/3.4bpp");
const u16 gUnknown_083D16A4[] = INCBIN_U16("graphics/unknown/unknown_3D1624/4.4bpp");
const u16 gUnknown_083D16C4[] = INCBIN_U16("graphics/unknown/unknown_3D1624/5.4bpp");
const u16 gUnknown_083D16E4[] = INCBIN_U16("graphics/unknown/unknown_3D1624/6.4bpp");
const u16 gUnknown_083D1704[] = INCBIN_U16("graphics/unknown/unknown_3D1624/7.4bpp");
const u16 gMiscBlank_Pal[] = INCBIN_U16("graphics/interface/blank.gbapal");

const struct OamData gOamData_83D1744 = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 3,
    .priority = 3,
    .paletteNum = 2
};

const struct SpriteTemplate gSpriteTemplate_83D174C = {
    0xbc1,
    0xbc1,
    &gOamData_83D1744,
    gDummySpriteAnimTable,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

const struct SpriteSheet gUnknown_083D1764[] = {
    {gMiscBlank_Gfx, 0x400, 0xbc1},
    {gMiscBlank_Gfx, 0x400, 0xbc2},
    {gMiscBlank_Gfx, 0x400, 0xbc3},
    {gMiscBlank_Gfx, 0x400, 0xbc4},
    {gMiscBlank_Gfx, 0x400, 0xbc5},
    {gMiscBlank_Gfx, 0x400, 0xbc6},
    {gMiscBlank_Gfx, 0x400, 0xbc7},
    {gMiscBlank_Gfx, 0x400, 0xbc8},
};

const struct SpritePalette gUnknown_083D17A4 = {
    gMiscBlank_Pal, 0xbc1
};

const struct OamData gOamData_83D17AC = {};

const struct SpriteTemplate gSpriteTemplate_83D17B4 = {
    0xbc9,
    0xbc9,
    &gOamData_83D17AC,
    gDummySpriteAnimTable,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_80C3DF0
};

const struct CompressedSpriteSheet gUnknown_083D17CC = {gContestConfetti_Gfx, 0x220, 0xbc9};

const struct CompressedSpritePalette gUnknown_083D17D4 = {gContestConfetti_Pal, 0xbc9};

const u8 gUnknown_083D17DC[] = _("{COLOR RED}");
const u8 gUnknown_083D17E0[] = _("/");
const u8 gUnknown_083D17E2[] = _("{SIZE 3}{COLOR_HIGHLIGHT_SHADOW WHITE2 DARK_GREY LIGHT_BLUE}");

void sub_80C2020(void)
{
    REG_DISPCNT = DISPCNT_OBJ_1D_MAP;
    Text_LoadWindowTemplate(&gWindowTemplate_81E6FA0);
    Text_InitWindowWithTemplate(&gMenuWindow, &gWindowTemplate_81E6FA0);
    REG_BG0CNT = BGCNT_WRAP | BGCNT_SCREENBASE(30);
    REG_BG1CNT = BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(24);
    REG_BG2CNT = BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(28);
    REG_BG3CNT = BGCNT_WRAP | BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(26);
    REG_MOSAIC = 0;
    REG_WININ = 0x3f3f;
    REG_WINOUT = 0x3f2e;
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_DISPCNT |= DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;
    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    gBattle_WIN1H = 0;
    gBattle_WIN1V = 0;
}

void sub_80C2144(void)
{
    int i;
    int j;
    s8 r7;
    s8 r4;
    u16 r6;
    u16 r3;

    DmaFill32Large(3, 0, VRAM, VRAM_SIZE, 0x1000);
    LZDecompressVram(gUnknown_08D1977C, BG_SCREEN_ADDR(0));
    LZDecompressVram(gUnknown_08D1A490, BG_SCREEN_ADDR(26));
    LZDecompressVram(gUnknown_08D1A364, BG_SCREEN_ADDR(28));
    LZDecompressVram(gUnknown_08D1A250, BG_SCREEN_ADDR(30));
    sub_80C37E4();
    LoadCompressedPalette(gUnknown_08D1A618, 0, 0x200);
    LoadFontDefaultPalette(&gWindowTemplate_81E6FA0);
    for (i = 0; i < 4; i++)
    {
        r7 = sub_80C3990(i, 1);
        r4 = sub_80C39E4(i, 1);
        for (j = 0; j < 10; j++)
        {
            r6 = 0x60b2;
            if (j < r7)
                r6 = 0x60b4;
            if (j < ABS(r4))
            {
                r3 = 0x60a4;
                if (r4 < 0)
                    r3 = 0x60a6;
            }
            else
                r3 = 0x60a2;
            ((u16 *)BG_VRAM)[i * 0x60 + j + 0x60b3] = r6;
            ((u16 *)BG_VRAM)[i * 0x60 + j + 0x60d3] = r3;
        }
    }
}

void sub_80C226C(u8 a0)
{
    u8 *strbuf;

    if (a0 == gContestPlayerMonIndex)
        strbuf = StringCopy(gDisplayedStringBattle, gUnknown_083D17DC);
    else
        strbuf = gDisplayedStringBattle;
    strbuf[0] = EXT_CTRL_CODE_BEGIN;
    strbuf[1] = 0x06;
    strbuf[2] = 0x04;
    strbuf += 3;
    strbuf = StringCopy(strbuf, gContestMons[a0].nickname);
    strbuf[0] = EXT_CTRL_CODE_BEGIN;
    strbuf[1] = 0x13;
    strbuf[2] = 0x32;
    strbuf += 3;
    strbuf = StringCopy(strbuf, gUnknown_083D17E0);
    if (gIsLinkContest & 1)
        StringCopy(strbuf, gLinkPlayers[a0].name);
    else
        StringCopy(strbuf, gContestMons[a0].trainerName);
    Text_InitWindowAndPrintText(&gMenuWindow, gDisplayedStringBattle, a0 * 36 + 770, 7, a0 * 3 + 4);
}

void sub_80C2340(void)
{
    int i;

    for (i = 0; i < 4; i++)
        sub_80C226C(i);
}

void sub_80C2358(void)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    SetVBlankCallback(NULL);
    sub_80C2020();
    ScanlineEffect_Clear();
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    FreeAllSpritePalettes();
    sub_80C2144();
    sub_80C310C();
    LoadAllContestMonIcons(0, TRUE);
    sub_80C2340();
    eContestLink80C2020Struct2018000 = (struct UnkEwramStruct18000){};
    memset(eContestLink80C2020Struct2018018, 0, 4 * sizeof(struct UnkEwramStruct18018));
    sub_80C33DC();
    BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
    gPaletteFade.bufferTransferDisabled = FALSE;
    eContestLink80C2020Struct2018000.unk_02 = CreateTask(sub_80C24F4, 5);
    SetMainCallback2(sub_80C2430);
    gBattle_WIN1H = 0xf0;
    gBattle_WIN1V = 0x80a0;
    CreateTask(sub_80C2F28, 20);
    sub_80C3F00();
    PlayBGM(MUS_CONTEST_RESULTS);
    SetVBlankCallback(sub_80C2448);
}

static void sub_80C2430(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

static void sub_80C2448(void)
{
    REG_BG0HOFS = gBattle_BG0_X;
    REG_BG0VOFS = gBattle_BG0_Y;
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;
    REG_WIN0H = gBattle_WIN0H;
    REG_WIN0V = gBattle_WIN0V;
    REG_WIN1H = gBattle_WIN1H;
    REG_WIN1V = gBattle_WIN1V;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ScanlineEffect_InitHBlankDmaTransfer();
}

static void sub_80C24F4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gIsLinkContest & 1)
        {
            sub_80C3698(gOtherText_LinkStandby);
            gTasks[taskId].func = sub_80C255C;
        }
        else
        {
            gTasks[taskId].func = sub_80C2600;
        }
    }
}

static void sub_80C255C(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers && GetLinkPlayerCount() == MAX_LINK_PLAYERS)
    {
        CreateTask(sub_80C25A4, 0);
        gTasks[taskId].func = TaskDummy;
    }
}

static void sub_80C25A4(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(taskId, Task_LinkContest_CommunicateMonIdxs, sub_80C25C0);
}

static void sub_80C25C0(u8 taskId)
{
    if (IsLinkTaskFinished())
    {
        DestroyTask(taskId);
        gTasks[eContestLink80C2020Struct2018000.unk_02].func = sub_80C2600;
        sub_80C3764();
    }
}

static void sub_80C2600(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        CreateTask(sub_80C2F64, 20);
        sub_80C3158(gContestText_AnnounceResults, eContestLink80C2020Struct2018000.unk_00);
        sub_80C34CC(sub_80C34AC(gContestText_AnnounceResults), 0x90, 0x78, 0x440);
        gTasks[taskId].data[0]++;
    }
    else if (gTasks[taskId].data[0] == 1)
    {
        if (eContestLink80C2020Struct2018000.unk_04 == 0)
        {
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
        }
    }
    else if (gTasks[taskId].data[0] == 2)
    {
        if (++gTasks[taskId].data[1] == 0x15)
        {
            gTasks[taskId].data[1] = 0;
            gTasks[taskId].data[0]++;
        }
    }
    else if (gTasks[taskId].data[0] == 3)
    {
        sub_80C3158(gContestText_PreliminaryResults, eContestLink80C2020Struct2018000.unk_00);
        sub_80C34CC(sub_80C34AC(gContestText_PreliminaryResults), 0x90, 0xffff, 0x440);
        gTasks[taskId].data[0]++;
    }
    else if (gTasks[taskId].data[0] == 4)
    {
        if (eContestLink80C2020Struct2018000.unk_04 == 2)
        {
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].func = sub_80C26E4;
        }
    }
}

static void sub_80C26E4(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        case 0:
            if (eContestLink80C2020Struct2018000.unk_0a == 0)
            {
                sub_80C40D4(0, gTasks[taskId].data[2]++);
                if (eContestLink80C2020Struct2018000.unk_14 == 0)
                {
                    gTasks[taskId].data[0] = 2;
                }
                else
                {
                    gTasks[taskId].data[0]++;
                }
            }
            break;
        case 1:
            if (eContestLink80C2020Struct2018000.unk_14 == 0)
            {
                gTasks[taskId].data[0] = 0;
            }
            break;
        case 2:
            sub_80C3520(0x440);
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].func = sub_80C2770;
            break;
    }
}

static void sub_80C2770(u8 taskId)
{
    if (eContestLink80C2020Struct2018000.unk_04 == 0)
    {
        if (++gTasks[taskId].data[1] == 21)
        {
            gTasks[taskId].data[1] = 0;
            sub_80C3158(gContestText_Round2Results, eContestLink80C2020Struct2018000.unk_00);
            sub_80C34CC(sub_80C34AC(gContestText_Round2Results), 0x90, 0xffff, 0x440);
        }
    }
    else if (eContestLink80C2020Struct2018000.unk_04 == 2)
    {
        gTasks[taskId].func = sub_80C27EC;
    }
}

static void sub_80C27EC(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
        case 0:
            if (eContestLink80C2020Struct2018000.unk_0a == 0)
            {
                sub_80C40D4(1, gTasks[taskId].data[2]++);
                if (eContestLink80C2020Struct2018000.unk_14 == 0)
                {
                    gTasks[taskId].data[0] = 2;
                }
                else
                {
                    gTasks[taskId].data[0]++;
                }
            }
            break;
        case 1:
            if (eContestLink80C2020Struct2018000.unk_14 == 0)
            {
                gTasks[taskId].data[0] = 0;
            }
            break;
        case 2:
            sub_80C3520(0x440);
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].func = sub_80C2878;
            break;
    }
}

static void sub_80C2878(u8 taskId)
{
    int i;
    u8 taskId2;
    u8 strbuf[100];

    switch (gTasks[taskId].data[0])
    {
        case 0:
            if (eContestLink80C2020Struct2018000.unk_04 == 0)
                gTasks[taskId].data[0]++;
            break;
        case 1:
            if (++gTasks[taskId].data[1] == 31)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[0]++;
            }
            break;
        case 2:
            for (i = 0; i < 4; i++)
            {
                taskId2 = CreateTask(sub_80C3A5C, 10);
                gTasks[taskId2].data[0] = gContestFinalStandings[i];
                gTasks[taskId2].data[1] = i;
            }
            gTasks[taskId].data[0]++;
            break;
        case 3:
            if (eContestLink80C2020Struct2018000.unk_05 == 4)
            {
                if (++gTasks[taskId].data[1] == 31)
                {
                    gTasks[taskId].data[1] = 0;
                    CreateTask(sub_80C3B30, 10);
                    gTasks[taskId].data[0]++;
                    GET_CONTEST_WINNER(i);
                    sub_80C3E60(i, 14);
                }
            }
            break;
        case 4:
            if (++gTasks[taskId].data[1] == 21)
            {
                gTasks[taskId].data[1] = 0;
                GET_CONTEST_WINNER(i);
                if (gIsLinkContest & 1)
                {
                    StringCopy(gStringVar1, gLinkPlayers[i].name);
                }
                else
                {
                    StringCopy(gStringVar1, gContestMons[i].trainerName);
                }
                StringCopy(gStringVar2, gContestMons[i].nickname);
                StringExpandPlaceholders(strbuf, gContestText_PokeWon);
                sub_80C3158(strbuf, eContestLink80C2020Struct2018000.unk_00);
                sub_80C34CC(sub_80C34AC(strbuf), 0x90, 0xffff, 0x440);
                gTasks[taskId].data[0]++;
            }
            break;
        case 5:
            gTasks[taskId].data[0] = 0;
            gTasks[taskId].func = sub_80C2A8C;
            break;
    }
}

static void sub_80C2A8C(u8 taskId)
{
    int i;
    u8 spriteId;
    u16 species;
    u32 personality;
    u32 otId;
    const struct CompressedSpritePalette *monPal;

    switch (gTasks[taskId].data[0])
    {
        case 0:
            gBattle_WIN0H = 0xf0;
            gBattle_WIN0V = 0x5050;
            GET_CONTEST_WINNER(i);
            species = gContestMons[i].species;
            personality = gContestMons[i].personality;
            otId = gContestMons[i].otId;
            HandleLoadSpecialPokePic(gMonFrontPicTable + species, gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, (void *)gSharedMem, gMonSpriteGfx_Sprite_ptr[1], species, personality);
            monPal = GetMonSpritePalStructFromOtIdPersonality(species, otId, personality);
            LoadCompressedObjectPalette(monPal);
            GetMonSpriteTemplate_803C56C(species, 1);
            gCreatingSpriteTemplate.paletteTag = monPal->tag;
            spriteId = CreateSprite(&gCreatingSpriteTemplate, 0x110, 0x50, 10);
            gSprites[spriteId].data[1] = species;
            gSprites[spriteId].oam.priority = 0;
            gSprites[spriteId].callback = sub_80C3C44;
            eContestLink80C2020Struct2018000.unk_08 = spriteId;
            LoadCompressedObjectPic(&gUnknown_083D17CC);
            LoadCompressedObjectPalette(&gUnknown_083D17D4);
            CreateTask(sub_80C3D04, 10);
            gTasks[taskId].data[0]++;
            break;
        case 1:
            if (++gTasks[taskId].data[3] == 1)
            {
                u8 win0v;
                gTasks[taskId].data[3] = 0;
                gTasks[taskId].data[2] += 2;
                if (gTasks[taskId].data[2] > 0x20)
                    gTasks[taskId].data[2] = 0x20;
                win0v = gTasks[taskId].data[2];
                gBattle_WIN0V = ((0x50 - win0v) << 8) | (0x50 + win0v);
                if (win0v == 0x20)
                {
                    gTasks[taskId].data[0]++;
                }
            }
            break;
        case 2:
            if (eContestLink80C2020Struct2018000.unk_06 == 1)
            {
                gTasks[taskId].data[0]++;
            }
            break;
        case 3:
            if (++gTasks[taskId].data[1] == 121)
            {
                gTasks[taskId].data[1] = 0;
                gSprites[eContestLink80C2020Struct2018000.unk_08].callback = sub_80C3CB8;
                gTasks[taskId].data[0]++;
            }
            break;
        case 4:
            if (eContestLink80C2020Struct2018000.unk_06 == 2)
            {
                u8 win0v = (gBattle_WIN0V >> 8);
                win0v += 2;
                if (win0v > 0x50)
                    win0v = 0x50;
                gBattle_WIN0V = (win0v << 8) | (0xa0 - win0v);
                if (win0v == 0x50)
                {
                    gTasks[taskId].data[0]++;
                }
            }
            break;
        case 5:
            if (eContestLink80C2020Struct2018000.unk_06 == 2)
            {
                eContestLink80C2020Struct2018000.unk_09 = 1;
                gTasks[taskId].data[0] = 0;
                gTasks[taskId].func = sub_80C2D1C;
            }
            break;
    }
}

static void sub_80C2D1C(u8 taskId)
{
    int i;

    if (gMain.newKeys & A_BUTTON)
    {
        if (!(gIsLinkContest & 1))
        {
            for (i = 0; i < 4; i++)
            {
                GetSetPokedexFlag(SpeciesToNationalPokedexNum(gContestMons[i].species), FLAG_SET_SEEN);
            }
        }
        gTasks[taskId].func = sub_80C2D80;
    }
}

static void sub_80C2D80(u8 taskId)
{
    if (gIsLinkContest & 1)
    {
        sub_80C3698(gOtherText_LinkStandby);
        SetCloseLinkCallback();
        gTasks[taskId].func = sub_80C2DD8;
    }
    else
    {
        gTasks[taskId].func = sub_80C2E14;
    }
}

static void sub_80C2DD8(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        gIsLinkContest = 0;
        sub_80C3764();
        gTasks[taskId].func = sub_80C2E14;
    }
}

static void sub_80C2E14(u8 taskId)
{
    sub_80BE284(gContestFinalStandings[gContestPlayerMonIndex]);
    sub_810FB10(2);
    Contest_SaveWinner(gSpecialVar_ContestRank);
    Contest_SaveWinner(0xFE);
    eCurContestWinnerIsForArtist = TRUE;
    eCurContestWinnerSaveIdx = GetContestWinnerSaveIdx(0xfe, 0);
    BeginHardwarePaletteFade(0xff, 0, 0, 16, 0);
    gTasks[taskId].func = sub_80C2EA0;
}

static void sub_80C2EA0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gTasks[taskId].data[1] == 0)
        {
            DestroyTask(eContestLink80C2020Struct2018000.unk_03);
            BlendPalettes(0x0000ffff, 16, 0);
            gTasks[taskId].data[1]++;
        }
        else if (gTasks[taskId].data[1] == 1)
        {
            BlendPalettes(0xffff0000, 16, 0);
            gTasks[taskId].data[1]++;
        }
        else
        {
            REG_BLDCNT = 0;
            REG_BLDY = 0;
            DestroyTask(taskId);
            SetMainCallback2(CB2_ReturnToFieldContinueScriptPlayMapMusic);
        }
    }
}

static void sub_80C2F28(u8 taskId)
{
    gBattle_BG3_X += 2;
    gBattle_BG3_Y++;
    if (gBattle_BG3_X > 0xff)
        gBattle_BG3_X -= 0xff;
    if (gBattle_BG3_Y > 0xff)
        gBattle_BG3_Y -= 0xff;
}

static void sub_80C2F64(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 2)
    {
        gTasks[taskId].data[0] = 0;
        if (gTasks[taskId].data[2] == 0)
            gTasks[taskId].data[1]++;
        else
            gTasks[taskId].data[1]--;
        if (gTasks[taskId].data[1] == 16)
            gTasks[taskId].data[2] = 1;
        else if (gTasks[taskId].data[1] == 0)
            gTasks[taskId].data[2] = 0;
        BlendPalette(0x6b, 0x01, gTasks[taskId].data[1], RGB(30, 22, 11));
        BlendPalette(0x68, 0x01, gTasks[taskId].data[1], RGB(31, 31, 31));
        BlendPalette(0x6e, 0x01, gTasks[taskId].data[1], RGB(30, 29, 29));
    }
    if (gTasks[taskId].data[1] == 0)
        eContestLink80C2020Struct2018000.unk_0a = 0;
    else
        eContestLink80C2020Struct2018000.unk_0a = 1;
}

void sub_80C3024(u16 species, u8 destOffset, u8 srcOffset, bool8 useDmaNow, u32 personality)
{
    int i;
    int j;
    u16 tile;
    u16 offset;
    u16 var0;
    u16 var1;

    if (useDmaNow)
    {
        DmaCopy32Defvars(3, GetMonIconPtr(species, personality) + (srcOffset << 9) + 0x80, BG_CHAR_ADDR(1) + (destOffset << 9), 0x180);
        var0 = ((destOffset + 10) << 12);
        var1 = (destOffset * 16 + 0x200);
        tile = var1 | var0;
        offset = destOffset * 0x60 + 0x83;
        for (i = 0; i < 3; i++)
        {
            for (j = 0; j < 4; j++)
            {
                ((u16 *)BG_CHAR_ADDR(3))[(i << 5) + j + offset] = tile;
                tile++;
            }
        }
    }
    else
    {
        RequestSpriteCopy(GetMonIconPtr(species, personality) + (srcOffset << 9) + 0x80, BG_CHAR_ADDR(1) + (destOffset << 9), 0x180);
    }
}

static void LoadAllContestMonIcons(u8 srcOffset, bool8 useDmaNow)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        sub_80C3024(gContestMons[i].species, i, srcOffset, useDmaNow, gContestMons[i].personality);
    }
}

void sub_80C310C(void)
{
    int i;
    register u16 species asm("r0");

    for (i = 0; i < 4; i++)
    {
        species = mon_icon_convert_unown_species_id(gContestMons[i].species, 0);
        LoadPalette(gMonIconPalettes[gMonIconPaletteIndices[species]], 0xa0 + 0x10 * i, 0x20);
    }
}

#ifdef NONMATCHING
void sub_80C3158(const u8 *string, u8 spriteId)
{
    int i, j;
    u8 width;
    u8 * displayedStringBattle;
    void * dest;
    u8 * d1;
    u8 * d2;
    void *d3;
    void *d4;
    void *d5;
    void *d6;
    int w;
    u16 sp00[4];
    struct Sprite *sprite = &gSprites[spriteId];
    sp00[0] = gSprites[spriteId].oam.tileNum;
    sp00[1] = gSprites[sprite->data[0]].oam.tileNum;
    sp00[2] = gSprites[sprite->data[1]].oam.tileNum;
    sp00[3] = gSprites[sprite->data[2]].oam.tileNum;

    for (i = 0; i < 4; i++)
    {
        DmaClear32(3, (void *)VRAM + 0x10000 + 32 * sp00[i], 0x400);
    }

    width = Text_GetStringWidthFromWindowTemplate(&gWindowTemplate_81E7278, string);
    displayedStringBattle = gDisplayedStringBattle;
    displayedStringBattle = StringCopy(displayedStringBattle, gUnknown_083D17E2);
    if ((~width + 1) & 7)
    {
        displayedStringBattle[0] = EXT_CTRL_CODE_BEGIN;
        displayedStringBattle[1] = 0x11;
        displayedStringBattle[2] = ((~width + 1) & 7) / 2;
        displayedStringBattle += 3;
    }

    width += -8 & (width + 7);
    displayedStringBattle = StringCopy(displayedStringBattle, string);

    displayedStringBattle[0] = EXT_CTRL_CODE_BEGIN;
    displayedStringBattle[1] = 0x13;
    displayedStringBattle[2] = width;
    displayedStringBattle[3] = EOS;

    sub_80034D4(eContestLink80C2020Struct2018068, gDisplayedStringBattle);

    CpuCopy32(&gUnknown_083D1624[0x0], (void *)(VRAM + 0x10000) + 32 * sp00[0], 32);
    CpuCopy32(&gUnknown_083D1624[0x40], (void *)(VRAM + 0x10000) + 32 * sp00[0] + 0x100, 32);
    CpuCopy32(&gUnknown_083D1624[0x40], (void *)(VRAM + 0x10000) + 32 * sp00[0] + 0x200, 32);
    CpuCopy32(&gUnknown_083D1624[0x20], (void *)(VRAM + 0x10000) + 32 * sp00[0] + 0x300, 32);

    w = width / 8;
    j = 0;
    if (j <= w)
    {
        d2 = eContestLink80C2020Struct2018068 + 0x20;
        d1 = eContestLink80C2020Struct2018068;
        d3 = (void *)VRAM + 0x0FD20;
        d4 = (void *)VRAM + 0x0FE20;
        d5 = (void *)VRAM + 0x0FF20;
        d6 = (void *)VRAM + 0x10020;
        while (j <= w)
        {
            if (j < 7)
                dest = 32 * sp00[0] + d6;
            else if (j < 15)
                dest = 32 * sp00[1] + d5;
            else if (j < 23)
                dest = 32 * sp00[2] + d4;
            else
                dest = 32 * sp00[3] + d3;

            if (j == w)
                break;

            CpuCopy32(gUnknown_083D16E4, dest, 32);
            CpuCopy32(gUnknown_083D16E4 + 0x10, dest + 0x300, 32);
            CpuCopy32(j * 0x40 + d2, dest + 0x100, 32);
            CpuCopy32(j * 0x40 + d1, dest + 0x200, 32);

            d3 += 0x20;
            d4 += 0x20;
            d5 += 0x20;
            d6 += 0x20;
            j++;
        }
    }

    CpuCopy32(gUnknown_083D1644, dest, 32);
    CpuCopy32(gUnknown_083D1644 + 0x40, dest + 0x100, 32);
    CpuCopy32(gUnknown_083D1644 + 0x40, dest + 0x200, 32);
    CpuCopy32(gUnknown_083D1644 + 0x20, dest + 0x300, 32);
}
#else
asm(".include \"constants/gba_constants.inc\"");
asm(".include \"include/macros.inc\"");
NAKED
void sub_80C3158(const u8 * string, u8 spriteId)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x1C\n"
                "\tmov r9, r0\n"
                "\tlsls r1, 24\n"
                "\tlsrs r1, 24\n"
                "\tlsls r2, r1, 4\n"
                "\tadds r2, r1\n"
                "\tlsls r2, 2\n"
                "\tldr r3, _080C32C0 @ =gSprites\n"
                "\tadds r2, r3\n"
                "\tmov r1, sp\n"
                "\tldrh r0, [r2, 0x4]\n"
                "\tlsls r0, 22\n"
                "\tlsrs r0, 22\n"
                "\tstrh r0, [r1]\n"
                "\tmov r4, sp\n"
                "\tmovs r0, 0x2E\n"
                "\tldrsh r1, [r2, r0]\n"
                "\tlsls r0, r1, 4\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r3\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tlsls r0, 22\n"
                "\tlsrs r0, 22\n"
                "\tstrh r0, [r4, 0x2]\n"
                "\tmovs r0, 0x30\n"
                "\tldrsh r1, [r2, r0]\n"
                "\tlsls r0, r1, 4\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r3\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tlsls r0, 22\n"
                "\tlsrs r0, 22\n"
                "\tstrh r0, [r4, 0x4]\n"
                "\tmovs r0, 0x32\n"
                "\tldrsh r1, [r2, r0]\n"
                "\tlsls r0, r1, 4\n"
                "\tadds r0, r1\n"
                "\tlsls r0, 2\n"
                "\tadds r0, r3\n"
                "\tldrh r0, [r0, 0x4]\n"
                "\tlsls r0, 22\n"
                "\tlsrs r0, 22\n"
                "\tstrh r0, [r4, 0x6]\n"
                "\tldr r1, _080C32C4 @ =gWindowTemplate_81E7278\n"
                "\tmov r8, r1\n"
                "\tldr r7, _080C32C8 @ =0x06010000\n"
                "\tldr r2, _080C32CC @ =0x040000d4\n"
                "\tldr r6, _080C32D0 @ =0x85000100\n"
                "\tmov r1, sp\n"
                "\tmovs r5, 0\n"
                "\tadd r3, sp, 0x8\n"
                "\tmovs r4, 0x3\n"
                "_080C31CE:\n"
                "\tldrh r0, [r1]\n"
                "\tlsls r0, 5\n"
                "\tadds r0, r7\n"
                "\tstr r5, [sp, 0x8]\n"
                "\tstr r3, [r2]\n"
                "\tstr r0, [r2, 0x4]\n"
                "\tstr r6, [r2, 0x8]\n"
                "\tldr r0, [r2, 0x8]\n"
                "\tadds r1, 0x2\n"
                "\tsubs r4, 0x1\n"
                "\tcmp r4, 0\n"
                "\tbge _080C31CE\n"
                "\tmov r0, r8\n"
                "\tmov r1, r9\n"
                "\tbl Text_GetStringWidthFromWindowTemplate\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tldr r2, _080C32D4 @ =gDisplayedStringBattle\n"
                "\tldr r1, _080C32D8 @ =gUnknown_083D17E2\n"
                "\tadds r0, r2, 0\n"
                "\tbl StringCopy\n"
                "\tadds r2, r0, 0\n"
                "\tmvns r0, r5\n"
                "\tadds r1, r0, 0x1\n"
                "\tmovs r0, 0x7\n"
                "\tands r1, r0\n"
                "\tcmp r1, 0\n"
                "\tbeq _080C3218\n"
                "\tmovs r0, 0xFC\n"
                "\tstrb r0, [r2]\n"
                "\tmovs r0, 0x11\n"
                "\tstrb r0, [r2, 0x1]\n"
                "\tlsrs r0, r1, 1\n"
                "\tstrb r0, [r2, 0x2]\n"
                "\tadds r2, 0x3\n"
                "_080C3218:\n"
                "\tadds r6, r5, 0x7\n"
                "\tmovs r1, 0x8\n"
                "\tnegs r1, r1\n"
                "\tadds r0, r1, 0\n"
                "\tands r6, r0\n"
                "\tlsls r6, 24\n"
                "\tlsrs r5, r6, 24\n"
                "\tadds r0, r2, 0\n"
                "\tmov r1, r9\n"
                "\tbl StringCopy\n"
                "\tadds r2, r0, 0\n"
                "\tmovs r0, 0xFC\n"
                "\tstrb r0, [r2]\n"
                "\tmovs r0, 0x13\n"
                "\tstrb r0, [r2, 0x1]\n"
                "\tstrb r5, [r2, 0x2]\n"
                "\tmovs r0, 0xFF\n"
                "\tstrb r0, [r2, 0x3]\n"
                "\tldr r0, _080C32DC @ =gSharedMem + 0x18068\n"
                "\tmov r10, r0\n"
                "\tldr r1, _080C32D4 @ =gDisplayedStringBattle\n"
                "\tbl sub_80034D4\n"
                "\tmov r0, sp\n"
                "\tldrh r4, [r0]\n"
                "\tlsls r4, 5\n"
                "\tldr r1, _080C32C8 @ =0x06010000\n"
                "\tadds r7, r4, r1\n"
                "\tldr r0, _080C32E0 @ =gUnknown_083D1624\n"
                "\tmov r9, r0\n"
                "\tldr r1, _080C32E4 @ =REG_BG0CNT\n"
                "\tmov r8, r1\n"
                "\tadds r1, r7, 0\n"
                "\tmov r2, r8\n"
                "\tbl CpuSet\n"
                "\tmov r5, r9\n"
                "\tadds r5, 0x80\n"
                "\tldr r0, _080C32E8 @ =0x06010100\n"
                "\tadds r1, r4, r0\n"
                "\tadds r0, r5, 0\n"
                "\tmov r2, r8\n"
                "\tbl CpuSet\n"
                "\tldr r0, _080C32EC @ =0x06010200\n"
                "\tadds r1, r4, r0\n"
                "\tadds r0, r5, 0\n"
                "\tmov r2, r8\n"
                "\tbl CpuSet\n"
                "\tmov r0, r9\n"
                "\tadds r0, 0x40\n"
                "\tldr r1, _080C32F0 @ =0x06010300\n"
                "\tadds r4, r1\n"
                "\tadds r1, r4, 0\n"
                "\tmov r2, r8\n"
                "\tbl CpuSet\n"
                "\tlsrs r5, r6, 27\n"
                "\tmovs r4, 0\n"
                "\tcmp r4, r5\n"
                "\tbgt _080C3382\n"
                "\tmov r6, sp\n"
                "\tmov r0, r10\n"
                "\tadds r0, 0x20\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tmov r1, r10\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tldr r0, _080C32F4 @ =0x0600fd20\n"
                "\tstr r0, [sp, 0x14]\n"
                "\tldr r1, _080C32F8 @ =0x0600fe20\n"
                "\tstr r1, [sp, 0x18]\n"
                "\tldr r0, _080C32FC @ =0x0600ff20\n"
                "\tmov r10, r0\n"
                "\tldr r1, _080C3300 @ =0x06010020\n"
                "\tmov r9, r1\n"
                "_080C32B2:\n"
                "\tcmp r4, 0x6\n"
                "\tbgt _080C3304\n"
                "\tldrh r0, [r6]\n"
                "\tlsls r0, 5\n"
                "\tmov r1, r9\n"
                "\tb _080C3322\n"
                "\t.align 2, 0\n"
                "_080C32C0: .4byte gSprites\n"
                "_080C32C4: .4byte gWindowTemplate_81E7278\n"
                "_080C32C8: .4byte 0x06010000\n"
                "_080C32CC: .4byte 0x040000d4\n"
                "_080C32D0: .4byte 0x85000100\n"
                "_080C32D4: .4byte gDisplayedStringBattle\n"
                "_080C32D8: .4byte gUnknown_083D17E2\n"
                "_080C32DC: .4byte gSharedMem + 0x18068\n"
                "_080C32E0: .4byte gUnknown_083D1624\n"
                "_080C32E4: .4byte REG_BG0CNT\n"
                "_080C32E8: .4byte 0x06010100\n"
                "_080C32EC: .4byte 0x06010200\n"
                "_080C32F0: .4byte 0x06010300\n"
                "_080C32F4: .4byte 0x0600fd20\n"
                "_080C32F8: .4byte 0x0600fe20\n"
                "_080C32FC: .4byte 0x0600ff20\n"
                "_080C3300: .4byte 0x06010020\n"
                "_080C3304:\n"
                "\tcmp r4, 0xE\n"
                "\tbgt _080C3310\n"
                "\tldrh r0, [r6, 0x2]\n"
                "\tlsls r0, 5\n"
                "\tmov r1, r10\n"
                "\tb _080C3322\n"
                "_080C3310:\n"
                "\tcmp r4, 0x16\n"
                "\tbgt _080C331C\n"
                "\tldrh r0, [r6, 0x4]\n"
                "\tlsls r0, 5\n"
                "\tldr r1, [sp, 0x18]\n"
                "\tb _080C3322\n"
                "_080C331C:\n"
                "\tldrh r0, [r6, 0x6]\n"
                "\tlsls r0, 5\n"
                "\tldr r1, [sp, 0x14]\n"
                "_080C3322:\n"
                "\tadds r7, r0, r1\n"
                "\tcmp r4, r5\n"
                "\tbeq _080C3382\n"
                "\tldr r0, _080C33D0 @ =gUnknown_083D16E4\n"
                "\tadds r1, r7, 0\n"
                "\tmov r2, r8\n"
                "\tbl CpuSet\n"
                "\tmovs r0, 0xC0\n"
                "\tlsls r0, 2\n"
                "\tadds r1, r7, r0\n"
                "\tldr r0, _080C33D0 @ =gUnknown_083D16E4\n"
                "\tadds r0, 0x20\n"
                "\tmov r2, r8\n"
                "\tbl CpuSet\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 1\n"
                "\tadds r1, r7, r0\n"
                "\tldr r0, [sp, 0x10]\n"
                "\tmov r2, r8\n"
                "\tbl CpuSet\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 2\n"
                "\tadds r1, r7, r0\n"
                "\tldr r0, [sp, 0xC]\n"
                "\tmov r2, r8\n"
                "\tbl CpuSet\n"
                "\tldr r1, [sp, 0xC]\n"
                "\tadds r1, 0x40\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tldr r0, [sp, 0x10]\n"
                "\tadds r0, 0x40\n"
                "\tstr r0, [sp, 0x10]\n"
                "\tldr r1, [sp, 0x14]\n"
                "\tadds r1, 0x20\n"
                "\tstr r1, [sp, 0x14]\n"
                "\tldr r0, [sp, 0x18]\n"
                "\tadds r0, 0x20\n"
                "\tstr r0, [sp, 0x18]\n"
                "\tmovs r1, 0x20\n"
                "\tadd r10, r1\n"
                "\tadd r9, r1\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, r5\n"
                "\tble _080C32B2\n"
                "_080C3382:\n"
                "\tldr r4, _080C33D4 @ =gUnknown_083D1644\n"
                "\tldr r5, _080C33D8 @ =REG_BG0CNT\n"
                "\tadds r0, r4, 0\n"
                "\tadds r1, r7, 0\n"
                "\tadds r2, r5, 0\n"
                "\tbl CpuSet\n"
                "\tadds r6, r4, 0\n"
                "\tadds r6, 0x80\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 1\n"
                "\tadds r1, r7, r0\n"
                "\tadds r0, r6, 0\n"
                "\tadds r2, r5, 0\n"
                "\tbl CpuSet\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 2\n"
                "\tadds r1, r7, r0\n"
                "\tadds r0, r6, 0\n"
                "\tadds r2, r5, 0\n"
                "\tbl CpuSet\n"
                "\tadds r4, 0x40\n"
                "\tmovs r0, 0xC0\n"
                "\tlsls r0, 2\n"
                "\tadds r1, r7, r0\n"
                "\tadds r0, r4, 0\n"
                "\tadds r2, r5, 0\n"
                "\tbl CpuSet\n"
                "\tadd sp, 0x1C\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080C33D0: .4byte gUnknown_083D16E4\n"
                "_080C33D4: .4byte gUnknown_083D1644\n"
                "_080C33D8: .4byte REG_BG0CNT");
}
#endif //NONMATCHING

void sub_80C33DC(void)
{
    int i;
    struct SpriteTemplate template;
    u8 spriteIds[8];

    template = gSpriteTemplate_83D174C;
    for (i = 0; i <8; i++)
        LoadSpriteSheet(&gUnknown_083D1764[i]);

    LoadSpritePalette(&gUnknown_083D17A4);
    for (i = 0; i < 8; i++)
    {
        spriteIds[i] = CreateSprite(&template, 272, 144, 10);
        template.tileTag++;
    }

    gSprites[spriteIds[0]].data[0] = spriteIds[1];
    gSprites[spriteIds[0]].data[1] = spriteIds[2];
    gSprites[spriteIds[0]].data[2] = spriteIds[3];

    gSprites[spriteIds[4]].data[0] = spriteIds[5];
    gSprites[spriteIds[4]].data[1] = spriteIds[6];
    gSprites[spriteIds[4]].data[2] = spriteIds[7];

    eContestLink80C2020Struct2018000.unk_00 = spriteIds[0];
    eContestLink80C2020Struct2018000.unk_04 = 0;
    eContestLink80C2020Struct2018000.unk_01 = spriteIds[4];
    sub_80C3764();
}

u16 sub_80C34AC(const u8 * string)
{
    u8 width = (StringLength(string) * 6);
    return 0x70 - (width / 2);
}

void sub_80C34CC(s16 arg0, u16 y, u16 arg2, u16 arg3)
{
    struct Sprite *sprite = &gSprites[eContestLink80C2020Struct2018000.unk_00];
    sprite->x = 272;
    sprite->y = y;
    sprite->x2 = 0;
    sprite->y2 = 0;
    sprite->data[4] = arg0 + 32;
    sprite->data[5] = arg2;
    sprite->data[6] = arg3;
    sprite->data[7] = 0;
    sprite->callback = sub_80C3588;
    eContestLink80C2020Struct2018000.unk_04 = 1;
}

void sub_80C3520(u16 arg0)
{
    struct Sprite *sprite = &gSprites[eContestLink80C2020Struct2018000.unk_00];
    sprite->x += sprite->x2;
    sprite->y += sprite->y2;
    sprite->y2 = 0;
    sprite->x2 = 0;
    sprite->data[6] = arg0;
    sprite->data[7] = 0;
    sprite->callback = sub_80C3630;
    eContestLink80C2020Struct2018000.unk_04 = 3;
}

void sub_80C3564(struct Sprite *sprite)
{
    sprite->x = 272;
    sprite->y = 144;
    sprite->y2 = 0;
    sprite->x2 = 0;
    sprite->callback = SpriteCallbackDummy;
    eContestLink80C2020Struct2018000.unk_04 = 0;
}


void sub_80C3588(struct Sprite *sprite)
{
    int i;
    s16 var0;

    var0 = (u16)sprite->data[7] + (u16)sprite->data[6];
    sprite->x -= var0 >> 8;
    sprite->data[7] = (sprite->data[6] + sprite->data[7]) & 0xFF;
    if (sprite->x < sprite->data[4])
        sprite->x = sprite->data[4];

    for (i = 0; i < 3; i++)
    {
        struct Sprite *sprite2 = &gSprites[sprite->data[i]];
        sprite2->x = sprite->x + sprite->x2 + (i + 1) * 64;
    }

    if (sprite->x == sprite->data[4])
        sprite->callback = sub_80C35FC;
}

void sub_80C35FC(struct Sprite *sprite)
{
    eContestLink80C2020Struct2018000.unk_04 = 2;
    if ((u16)sprite->data[5] != 0xFFFF)
    {
        if (--sprite->data[5] == -1)
            sub_80C3520(sprite->data[6]);
    }
}

void sub_80C3630(struct Sprite *sprite)
{
    int i;
    s16 var0;

    var0 = (u16)sprite->data[7] + (u16)sprite->data[6];
    sprite->x -= var0 >> 8;
    sprite->data[7] = (sprite->data[6] + sprite->data[7]) & 0xFF;
    for (i = 0; i < 3; i++)
    {
        struct Sprite *sprite2 = &gSprites[sprite->data[i]];
        sprite2->x = sprite->x + sprite->x2 + (i + 1) * 64;
    }

    if (sprite->x + sprite->x2 < -224)
        sub_80C3564(sprite);
}

void sub_80C3698(const u8 *text)
{
    int i;
    u16 x;
    struct Sprite *sprite;

    sub_80C3158(text, eContestLink80C2020Struct2018000.unk_01);
    x = sub_80C34AC(text);
    sprite = &gSprites[eContestLink80C2020Struct2018000.unk_01];
    sprite->x = x + 32;
    sprite->y = 80;
    sprite->invisible = FALSE;
    for (i = 0; i < 3; i++)
    {
        gSprites[sprite->data[i]].x = sprite->x + sprite->x2 + (i + 1) * 64;
        gSprites[sprite->data[i]].y = sprite->y;
        gSprites[sprite->data[i]].invisible = FALSE;
    }

    gBattle_WIN0H = 0x00F0;
    gBattle_WIN0V = ((sprite->y - 16) << 8) | (sprite->y + 16);
    REG_WININ = WININ_WIN1_BG_ALL | WININ_WIN1_OBJ | WININ_WIN1_CLR | WININ_WIN0_BG1 | WININ_WIN0_BG2 | WININ_WIN0_BG3 | WININ_WIN0_OBJ | WININ_WIN0_CLR;
}

void sub_80C3764(void)
{
    int i;
    struct Sprite *sprite;

    sprite = &gSprites[eContestLink80C2020Struct2018000.unk_01];
    sprite->invisible = TRUE;
    for (i = 0; i < 3; i++)
        gSprites[sprite->data[i]].invisible = TRUE;

    gBattle_WIN0H = 0;
    gBattle_WIN0V = 0;
    REG_WIN0H = gBattle_WIN0H;
    REG_WIN0V = gBattle_WIN0V;
    REG_WININ = WININ_WIN0_BG_ALL | WININ_WIN0_OBJ | WININ_WIN0_CLR  | WININ_WIN1_BG_ALL | WININ_WIN1_OBJ | WININ_WIN1_CLR;
}

#ifdef ENGLISH
#ifdef NONMATCHING
static inline s32 de_sub_80C39A8(s32 a0)
{
    s32 result = 0;
    if (gIsLinkContest & 0x1)
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 9, 2, 8, 2);
        result = 8;
    }
    else if (gSpecialVar_ContestRank == 0)
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 0, 0, 9, 2);
        result = 9;
    }
    else if (gSpecialVar_ContestRank == 1)
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 9, 0, 8, 2);
        result = 8;
    }
    else if (gSpecialVar_ContestRank == 2)
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 17, 0, 8, 2);
        result = 8;
    }
    else
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 0, 2, 9, 2);
        result = 9;
    }
    return result;
}

static inline s32 de_sub_80C3A84(s32 a0, s32 * a1)
{
    s32 result;
    if (gSpecialVar_ContestCategory == 0)
    {
        *a1 = 0;
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 17, 2, 10, 2);
        result = 10;
    }
    else if (gSpecialVar_ContestCategory == 1)
    {
        *a1 = 1;
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 0, 4, 11, 2);
        result = 11;
    }
    else if (gSpecialVar_ContestCategory == 2)
    {
        *a1 = 2;
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 11, 4, 10, 2);
        result = 10;
    }
    else if (gSpecialVar_ContestCategory == 3)
    {
        *a1 = 3;
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 21, 4, 10, 2);
        result = 10;
    }
    else
    {
        *a1 = 4;
        sub_809D104((void *)(VRAM + 0xE000), a0, 1, gUnknown_08E964B8, 0, 6, 10, 2);
        result = 10;
    }
    return result;
}

void sub_80C37E4(void)
{
    s32 sp0;
    s32 i;
    de_sub_80C3A84(de_sub_80C39A8(5) + 5, &sp0);
    for (i = 0; i < 0x80; i++)
    {
        ((vu16 *)(VRAM + 0xE000))[i] &= 0xFFF;
        ((vu16 *)(VRAM + 0xE000))[i] |= sp0 << 12;;
    }
}
#else
NAKED
void sub_80C37E4(void)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tsub sp, 0x10\n"
                "\tmovs r5, 0x1\n"
                "\tmovs r4, 0\n"
                "\tldr r0, _080C3808 @ =gIsLinkContest\n"
                "\tldrb r0, [r0]\n"
                "\tadds r1, r5, 0\n"
                "\tands r1, r0\n"
                "\tcmp r1, 0\n"
                "\tbeq _080C3814\n"
                "\tldr r0, _080C380C @ =0x0600e000\n"
                "\tldr r3, _080C3810 @ =gUnknown_08E964B8\n"
                "\tmovs r1, 0x9\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0x2\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tb _080C386A\n"
                "\t.align 2, 0\n"
                "_080C3808: .4byte gIsLinkContest\n"
                "_080C380C: .4byte 0x0600e000\n"
                "_080C3810: .4byte gUnknown_08E964B8\n"
                "_080C3814:\n"
                "\tldr r0, _080C3830 @ =gSpecialVar_ContestRank\n"
                "\tldrh r2, [r0]\n"
                "\tcmp r2, 0\n"
                "\tbne _080C383C\n"
                "\tmovs r4, 0x1\n"
                "\tldr r0, _080C3834 @ =0x0600e000\n"
                "\tldr r3, _080C3838 @ =gUnknown_08E964B8\n"
                "\tstr r2, [sp]\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tmovs r1, 0x9\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tb _080C3870\n"
                "\t.align 2, 0\n"
                "_080C3830: .4byte gSpecialVar_ContestRank\n"
                "_080C3834: .4byte 0x0600e000\n"
                "_080C3838: .4byte gUnknown_08E964B8\n"
                "_080C383C:\n"
                "\tcmp r2, 0x1\n"
                "\tbne _080C385C\n"
                "\tldr r0, _080C3854 @ =0x0600e000\n"
                "\tldr r3, _080C3858 @ =gUnknown_08E964B8\n"
                "\tmovs r1, 0x9\n"
                "\tstr r1, [sp]\n"
                "\tstr r4, [sp, 0x4]\n"
                "\tmovs r1, 0x8\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tb _080C3870\n"
                "\t.align 2, 0\n"
                "_080C3854: .4byte 0x0600e000\n"
                "_080C3858: .4byte gUnknown_08E964B8\n"
                "_080C385C:\n"
                "\tcmp r2, 0x2\n"
                "\tbne _080C3884\n"
                "\tldr r0, _080C387C @ =0x0600e000\n"
                "\tldr r3, _080C3880 @ =gUnknown_08E964B8\n"
                "\tmovs r1, 0x11\n"
                "\tstr r1, [sp]\n"
                "\tstr r4, [sp, 0x4]\n"
                "_080C386A:\n"
                "\tmovs r1, 0x8\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tstr r2, [sp, 0xC]\n"
                "_080C3870:\n"
                "\tmovs r1, 0x5\n"
                "\tmovs r2, 0x1\n"
                "\tbl sub_809D104\n"
                "\tb _080C389E\n"
                "\t.align 2, 0\n"
                "_080C387C: .4byte 0x0600e000\n"
                "_080C3880: .4byte gUnknown_08E964B8\n"
                "_080C3884:\n"
                "\tmovs r4, 0x1\n"
                "\tldr r0, _080C38C0 @ =0x0600e000\n"
                "\tldr r3, _080C38C4 @ =gUnknown_08E964B8\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0x2\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tmovs r1, 0x9\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tmovs r1, 0x5\n"
                "\tmovs r2, 0x1\n"
                "\tbl sub_809D104\n"
                "_080C389E:\n"
                "\tadds r4, 0xD\n"
                "\tldr r0, _080C38C8 @ =gSpecialVar_ContestCategory\n"
                "\tldrh r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbne _080C38CC\n"
                "\tmovs r6, 0\n"
                "\tldr r0, _080C38C0 @ =0x0600e000\n"
                "\tldr r3, _080C38C4 @ =gUnknown_08E964B8\n"
                "\tmovs r1, 0x11\n"
                "\tstr r1, [sp]\n"
                "\tmovs r2, 0x2\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tmovs r1, 0xA\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tstr r2, [sp, 0xC]\n"
                "\tb _080C392A\n"
                "\t.align 2, 0\n"
                "_080C38C0: .4byte 0x0600e000\n"
                "_080C38C4: .4byte gUnknown_08E964B8\n"
                "_080C38C8: .4byte gSpecialVar_ContestCategory\n"
                "_080C38CC:\n"
                "\tcmp r0, 0x1\n"
                "\tbne _080C38EC\n"
                "\tmovs r6, 0x1\n"
                "\tldr r0, _080C38E4 @ =0x0600e000\n"
                "\tldr r3, _080C38E8 @ =gUnknown_08E964B8\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0x4\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tmovs r1, 0xB\n"
                "\tb _080C3924\n"
                "\t.align 2, 0\n"
                "_080C38E4: .4byte 0x0600e000\n"
                "_080C38E8: .4byte gUnknown_08E964B8\n"
                "_080C38EC:\n"
                "\tcmp r0, 0x2\n"
                "\tbne _080C3910\n"
                "\tmovs r6, 0x2\n"
                "\tldr r0, _080C3908 @ =0x0600e000\n"
                "\tldr r3, _080C390C @ =gUnknown_08E964B8\n"
                "\tmovs r1, 0xB\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0x4\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tmovs r1, 0xA\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tstr r6, [sp, 0xC]\n"
                "\tb _080C392A\n"
                "\t.align 2, 0\n"
                "_080C3908: .4byte 0x0600e000\n"
                "_080C390C: .4byte gUnknown_08E964B8\n"
                "_080C3910:\n"
                "\tcmp r0, 0x3\n"
                "\tbne _080C393C\n"
                "\tmovs r6, 0x3\n"
                "\tldr r0, _080C3934 @ =0x0600e000\n"
                "\tldr r3, _080C3938 @ =gUnknown_08E964B8\n"
                "\tmovs r1, 0x15\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0x4\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tmovs r1, 0xA\n"
                "_080C3924:\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tstr r1, [sp, 0xC]\n"
                "_080C392A:\n"
                "\tadds r1, r4, 0\n"
                "\tadds r2, r5, 0\n"
                "\tbl sub_809D104\n"
                "\tb _080C395A\n"
                "\t.align 2, 0\n"
                "_080C3934: .4byte 0x0600e000\n"
                "_080C3938: .4byte gUnknown_08E964B8\n"
                "_080C393C:\n"
                "\tmovs r6, 0x4\n"
                "\tldr r0, _080C3984 @ =0x0600e000\n"
                "\tldr r3, _080C3988 @ =gUnknown_08E964B8\n"
                "\tmovs r1, 0\n"
                "\tstr r1, [sp]\n"
                "\tmovs r1, 0x6\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tmovs r1, 0xA\n"
                "\tstr r1, [sp, 0x8]\n"
                "\tmovs r1, 0x2\n"
                "\tstr r1, [sp, 0xC]\n"
                "\tadds r1, r4, 0\n"
                "\tadds r2, r5, 0\n"
                "\tbl sub_809D104\n"
                "_080C395A:\n"
                "\tldr r5, _080C398C @ =0x00000fff\n"
                "\tlsls r4, r6, 12\n"
                "\tldr r2, _080C3984 @ =0x0600e000\n"
                "\tmovs r3, 0x7F\n"
                "_080C3962:\n"
                "\tldrh r1, [r2]\n"
                "\tadds r0, r5, 0\n"
                "\tands r0, r1\n"
                "\tstrh r0, [r2]\n"
                "\tldrh r1, [r2]\n"
                "\tadds r0, r4, 0\n"
                "\torrs r0, r1\n"
                "\tstrh r0, [r2]\n"
                "\tadds r2, 0x2\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tbge _080C3962\n"
                "\tadd sp, 0x10\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080C3984: .4byte 0x0600e000\n"
                "_080C3988: .4byte gUnknown_08E964B8\n"
                "_080C398C: .4byte 0x00000fff");
}
#endif // NONMATCHING

#elif defined(GERMAN)
s16 de_sub_80C39A8(s32 a0)
{
    s16 result;
    if (gIsLinkContest & 1)
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 11, 3, 8, 3);
        result = 8;
    }
    else if (gSpecialVar_ContestRank == 0)
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 0, 0, 11, 3);
        result = 11;
    }
    else if (gSpecialVar_ContestRank == 1)
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 11, 0, 10, 3);
        result = 10;
    }
    else if (gSpecialVar_ContestRank == 2)
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 21, 0, 10, 3);
        result = 10;
    }
    else
    {
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 0, 3, 11, 3);
        result = 11;
    }
    return result;
}

s16 de_sub_80C3A84(s32 a0, s32 * a1)
{
    s16 result;
    if (gSpecialVar_ContestCategory == 0)
    {
        *a1 = 0;
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 19, 3, 7, 3);
        result = 7;
    }
    else if (gSpecialVar_ContestCategory == 1)
    {
        *a1 = 1;
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 0, 6, 7, 3);
        result = 7;
    }
    else if (gSpecialVar_ContestCategory == 2)
    {
        *a1 = 2;
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 7, 6, 4, 3);
        result = 4;
    }
    else if (gSpecialVar_ContestCategory == 3)
    {
        *a1 = 3;
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 11, 6, 6, 3);
        result = 6;
    }
    else
    {
        *a1 = 4;
        sub_809D104((void *)(VRAM + 0xE000), a0, 0, gUnknown_08E964B8, 17, 6, 5, 3);
        result = 5;
    }
    return result;
}

void sub_80C37E4(void)
{
    s32 sp0;
    s32 i;
    de_sub_80C3A84(de_sub_80C39A8(6) + 6, &sp0);
    for (i = 0; i < 0x80; i++)
    {
        ((vu16 *)(VRAM + 0xE000))[i] &= 0xFFF;
        ((vu16 *)(VRAM + 0xE000))[i] |= sp0 << 12;;
    }
}
#endif

// fakematching?
u8 sub_80C3990(u8 monIndex, u8 arg1)
{
    u32 var0;
    u32 var1;

    var0 = gContestMonRound1Points[monIndex] << 16;
    var1 = var0 / 0x3F;
    if (var1 & 0xFFFF)
        var1 += 0x10000;

    var1 >>= 16;
    if (var1 == 0 && var0)
        var1 = 1;

    if (arg1 && var1 > 10)
        var1 = 10;

    return var1;
}

s8 sub_80C39E4(u8 arg0, u8 arg1)
{
    u32 r4;
    u32 r2;
    s16 val;
    s8 ret;

    val = gContestMonRound2Points[arg0];
    if (val < 0)
        r4 = -val << 16;
    else
        r4 =  val << 16;
    r2 = r4 / 80;
    if (r2 & 0xFFFF)
        r2 += 0x10000;

    r2 >>= 16;
    if (r2 == 0 && r4 != 0)
        r2 = 1;

    if (arg1 != 0 && r2 > 10)
        r2 = 10;

    if (gContestMonRound2Points[arg0] < 0)
        ret = -r2;
    else
        ret =  r2;

    return ret;
}

void sub_80C3A5C(u8 taskId)
{
    u16 firstTileNum;

    if (gTasks[taskId].data[10] == 0)
    {
        gTasks[taskId].data[11] = (3 - gTasks[taskId].data[0]) * 40;
        gTasks[taskId].data[10]++;
    }
    else if (gTasks[taskId].data[10] == 1)
    {
        if (--gTasks[taskId].data[11] == -1)
        {
            firstTileNum = gTasks[taskId].data[0] * 2 + 0x5043;
            *(vu16 *)((VRAM + 0xE142) + gTasks[taskId].data[1] * 192) = firstTileNum + 0x00;
            *(vu16 *)((VRAM + 0xE144) + gTasks[taskId].data[1] * 192) = firstTileNum + 0x01;
            *(vu16 *)((VRAM + 0xE182) + gTasks[taskId].data[1] * 192) = firstTileNum + 0x10;
            *(vu16 *)((VRAM + 0xE184) + gTasks[taskId].data[1] * 192) = firstTileNum + 0x11;
            eContestLink80C2020Struct2018000.unk_05++;
            DestroyTask(taskId);
            PlaySE(SE_CONTEST_PLACE);
        }
    }
}

#ifdef NONMATCHING
void sub_80C3B30(u8 taskId)
{
    int i, j, k;

    for (i = 0; i < 4 && gContestFinalStandings[i] != 0; i++)
        ;

    for (j = 0; j < 3; j++)
    {
        for (k = 0; k < 30; k++)
        {
            ((u16 *)((VRAM + 0xE100) + 2 * (96 * i + 32 * j)))[k] &= 0x0FFF;
            ((u16 *)((VRAM + 0xE100) + 2 * (96 * i + 32 * j)))[k] |= 0x9000;
        }
    }
    gTasks[taskId].data[10] = i;
    gTasks[taskId].data[12] = 1;
    gTasks[taskId].func = sub_80C3BD8;
    eContestLink80C2020Struct2018000.unk_03 = taskId;
}
#else
NAKED
void sub_80C3B30(u8 taskId)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r12, r0\n"
                "\tmovs r5, 0\n"
                "\tldr r1, _080C3BC0 @ =gContestFinalStandings\n"
                "\tldrb r0, [r1]\n"
                "\tldr r2, _080C3BC4 @ =gTasks\n"
                "\tmov r10, r2\n"
                "\tcmp r0, 0\n"
                "\tbeq _080C3B5C\n"
                "_080C3B4E:\n"
                "\tadds r5, 0x1\n"
                "\tcmp r5, 0x3\n"
                "\tbgt _080C3B5C\n"
                "\tadds r0, r5, r1\n"
                "\tldrb r0, [r0]\n"
                "\tcmp r0, 0\n"
                "\tbne _080C3B4E\n"
                "_080C3B5C:\n"
                "\tmovs r1, 0\n"
                "\tlsls r0, r5, 1\n"
                "\tmov r2, r12\n"
                "\tlsls r2, 2\n"
                "\tmov r9, r2\n"
                "\tadds r0, r5\n"
                "\tlsls r0, 5\n"
                "\tmov r8, r0\n"
                "\tldr r7, _080C3BC8 @ =0x00000fff\n"
                "\tmovs r0, 0x90\n"
                "\tlsls r0, 8\n"
                "\tadds r6, r0, 0\n"
                "_080C3B74:\n"
                "\tlsls r0, r1, 5\n"
                "\tadds r4, r1, 0x1\n"
                "\tadd r0, r8\n"
                "\t@ the next two instructions are swapped\n"
                "\tmovs r3, 0x1D\n"
                "\tlsls r0, 1\n"
                "\tldr r1, _080C3BCC @ =0x0600e100\n"
                "\tadds r2, r0, r1\n"
                "_080C3B82:\n"
                "\tldrh r1, [r2]\n"
                "\tadds r0, r7, 0\n"
                "\tands r0, r1\n"
                "\torrs r0, r6\n"
                "\tstrh r0, [r2]\n"
                "\tadds r2, 0x2\n"
                "\tsubs r3, 0x1\n"
                "\tcmp r3, 0\n"
                "\tbge _080C3B82\n"
                "\tadds r1, r4, 0\n"
                "\tcmp r1, 0x2\n"
                "\tble _080C3B74\n"
                "\tmov r0, r9\n"
                "\tadd r0, r12\n"
                "\tlsls r0, 3\n"
                "\tadd r0, r10\n"
                "\tstrh r5, [r0, 0x1C]\n"
                "\tmovs r1, 0x1\n"
                "\tstrh r1, [r0, 0x20]\n"
                "\tldr r2, _080C3BD0 @ =sub_80C3BD8\n"
                "\tstr r2, [r0]\n"
                "\tmov r1, r12\n"
                "\tldr r0, _080C3BD4 @ =gSharedMem + 0x18000\n"
                "\tstrb r1, [r0, 0x3]\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080C3BC0: .4byte gContestFinalStandings\n"
                "_080C3BC4: .4byte gTasks\n"
                "_080C3BC8: .4byte 0x00000fff\n"
                "_080C3BCC: .4byte 0x0600e100\n"
                "_080C3BD0: .4byte sub_80C3BD8\n"
                "_080C3BD4: .4byte gSharedMem + 0x18000");
}
#endif //NONMATCHING

void sub_80C3BD8(u8 taskId)
{
    if (++gTasks[taskId].data[11] == 1)
    {
        gTasks[taskId].data[11] = 0;
        BlendPalette(0x91, 1, gTasks[taskId].data[12], RGB(13, 28, 27));
        if (gTasks[taskId].data[13] == 0)
        {
            if (++gTasks[taskId].data[12] == 16)
                gTasks[taskId].data[13] = 1;
        }
        else
        {
            if (--gTasks[taskId].data[12] == 0)
                gTasks[taskId].data[13] = 0;
        }
    }
}

void sub_80C3C44(struct Sprite *sprite)
{
    if (sprite->data[0] < 10)
    {
        if (++sprite->data[0] == 10)
        {
            PlayCry1(sprite->data[1], 0);
            sprite->data[1] = 0;
        }
    }
    else
    {
        s16 delta = (u16)sprite->data[1] + 0x600;
        sprite->x -= delta >> 8;
        sprite->data[1] = (sprite->data[1] + 0x600) & 0xFF;
        if (sprite->x < 120)
            sprite->x = 120;

        if (sprite->x == 120)
        {
            sprite->callback = SpriteCallbackDummy;
            sprite->data[1] = 0;
            eContestLink80C2020Struct2018000.unk_06 = 1;
        }
    }
}

void sub_80C3CB8(struct Sprite *sprite)
{
    s16 delta = (u16)sprite->data[1] + 0x600;
    sprite->x -= delta >> 8;
    sprite->data[1] = (sprite->data[1] + 0x600) & 0xFF;
    if (sprite->x < -32)
    {
        sprite->callback = SpriteCallbackDummy;
        sprite->invisible = TRUE;
        eContestLink80C2020Struct2018000.unk_06 = 2;
    }
}

void sub_80C3D04(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 5)
    {
        gTasks[taskId].data[0] = 0;
        if (eContestLink80C2020Struct2018000.unk_07 < 40)
        {
            u8 spriteId = CreateSprite(&gSpriteTemplate_83D17B4, (Random() % 240) - 20, 44, 5);
            gSprites[spriteId].data[0] = Random() % 512;
            gSprites[spriteId].data[1] = (Random() % 24) + 16;
            gSprites[spriteId].data[2] = (Random() % 256) + 48;
            gSprites[spriteId].oam.tileNum += Random() % 17;
            eContestLink80C2020Struct2018000.unk_07++;
        }
    }

    if (eContestLink80C2020Struct2018000.unk_09)
        DestroyTask(taskId);
}

void sub_80C3DF0(struct Sprite *sprite)
{
    register s16 var0 asm("r1");

    sprite->data[3] += sprite->data[0];
    sprite->x2 = Sin(sprite->data[3] >> 8, sprite->data[1]);
    var0 = sprite->data[4] + sprite->data[2];
    sprite->x += var0 >> 8;
    var0 = var0 & 0xFF;
    sprite->data[4] = var0;
    sprite->y++;
    if (eContestLink80C2020Struct2018000.unk_09)
        sprite->invisible = TRUE;

    if (sprite->x > 248 || sprite->y > 116)
    {
        DestroySprite(sprite);
        eContestLink80C2020Struct2018000.unk_07--;
    }
}

void sub_80C3E60(u8 monIndex, u8 numFrames)
{
    u8 taskId = CreateTask(sub_80C3EA4, 8);
    gTasks[taskId].data[0] = monIndex;
    gTasks[taskId].data[1] = numFrames;
    gTasks[taskId].data[2] = gContestMons[monIndex].species;
}

void sub_80C3EA4(u8 taskId)
{
    u8 monIndex = gTasks[taskId].data[0];
    if (gTasks[taskId].data[10]++ == gTasks[taskId].data[1])
    {
        gTasks[taskId].data[10] = 0;
        sub_80C3024(gTasks[taskId].data[2], monIndex, gTasks[taskId].data[11], FALSE, gContestMons[monIndex].personality);
        gTasks[taskId].data[11] ^= 1;
    }
}

void sub_80C3F00(void)
{
    s32 i;
    s16 r2 = gContestMonTotalPoints[0];
    s32 r4;
    u32 r5;
    s8 r0;

    for (i = 1; i < 4; i++)
    {
        if (r2 < gContestMonTotalPoints[i])
            r2 = gContestMonTotalPoints[i];
    }

    if (r2 < 0)
    {
        r2 = gContestMonTotalPoints[0];

        for (i = 1; i < 4; i++)
        {
            if (r2 > gContestMonTotalPoints[i])
                r2 = gContestMonTotalPoints[i];
        }
    }

    for (i = 0; i < 4; i++)
    {
        r4 = 1000 * gContestMonRound1Points[i] / ABS(r2);
        if ((r4 % 10) >= 5)
            r4 += 10;
        eContestLink80C2020Struct2018018[i].unk_00 = r4 / 10;

        r4 = 1000 * ABS(gContestMonRound2Points[i]) / ABS(r2);
        if ((r4 % 10) >= 5)
            r4 += 10;
        eContestLink80C2020Struct2018018[i].unk_04 = r4 / 10;

        if (gContestMonRound2Points[i] < 0)
            eContestLink80C2020Struct2018018[i].unk_10 = 1;

        r5 = 22528 * eContestLink80C2020Struct2018018[i].unk_00 / 100;
        if ((r5 % 256) >= 128)
            r5 += 256;
        eContestLink80C2020Struct2018018[i].unk_08 = r5 / 256;

        r5 = eContestLink80C2020Struct2018018[i].unk_04 * 22528 / 100;
        if ((r5 % 256) >= 128)
            r5 += 256;
        eContestLink80C2020Struct2018018[i].unk_0c = r5 / 256;

        eContestLink80C2020Struct2018018[i].unk_11 = sub_80C3990(i, 1);
        r0 = sub_80C39E4(i, 1);
        eContestLink80C2020Struct2018018[i].unk_12 = ABS(r0);

        if (gContestFinalStandings[i])
        {
            s16 r2__ = eContestLink80C2020Struct2018018[i].unk_08;
            s16 r1__ = eContestLink80C2020Struct2018018[i].unk_0c;
            if (eContestLink80C2020Struct2018018[i].unk_10)
                r1__ = -r1__;
            if (r2__ + r1__ == 88)
            {
                if (r1__ > 0)
                    eContestLink80C2020Struct2018018[i].unk_0c--;
                else if (r2__ > 0)
                    eContestLink80C2020Struct2018018[i].unk_08--;
            }
        }
    }
}

#ifdef NONMATCHING
void sub_80C40D4(u8 arg0, u8 arg1)
{
    int i;
    u8 taskId;
    u8 sp8, spC;

    sp8 = 0;
    spC = 0;
    if (!arg0)
    {
        u32 var0;
        for (i = 0; i < 4; i++)
        {
            u8 var1 = eContestLink80C2020Struct2018018[i].unk_11;
            if (arg1 < var1)
            {
                int x = var1 + 19;
                x += 32 * (i * 3 + 5);
                x -= arg1;
                x--;
                *(vu16 *)((VRAM + 0xC000) + 2 * x) = 0x60B3;
                taskId = CreateTask(sub_80C42C0, 10);
                var0 = ((eContestLink80C2020Struct2018018[i].unk_08 << 16) / eContestLink80C2020Struct2018018[i].unk_11) * (arg1 + 1);
                if ((var0 % 0x10000) >= 0x8000)
                    var0 += 0x10000;

                gTasks[taskId].data[0] = i;
                gTasks[taskId].data[1] = var0 >> 16;
                eContestLink80C2020Struct2018000.unk_14++;
                sp8++;
            }
        }
    }
    else
    {
        u32 var0;
        for (i = 0; i < 4; i++)
        {
            int tile;
            s8 var1 = eContestLink80C2020Struct2018018[i].unk_12;
            tile = eContestLink80C2020Struct2018018[i].unk_10 ? 0x60A5 : 0x60A3;
            if (arg1 < var1)
            {
                int x = var1 + 19;
                x += 32 * (i * 3 + 6);
                x -= arg1;
                x--;
                *(vu16 *)((VRAM + 0xC000) + 2 * x) = tile;
                taskId = CreateTask(sub_80C42C0, 10);
                var0 = ((eContestLink80C2020Struct2018018[i].unk_0c << 16) / eContestLink80C2020Struct2018018[i].unk_12) * (arg1 + 1);
                if ((var0 % 0x10000) >= 0x8000)
                    var0 += 0x10000;

                gTasks[taskId].data[0] = i;
                if (eContestLink80C2020Struct2018018[i].unk_10)
                {
                    gTasks[taskId].data[2] = 1;
                    spC++;
                }
                else
                {
                    sp8++;
                }

                if (eContestLink80C2020Struct2018018[i].unk_10)
                    gTasks[taskId].data[1] =  -(var0 >> 16) + eContestLink80C2020Struct2018018[i].unk_08;
                else
                    gTasks[taskId].data[1] = (var0 >> 16) + eContestLink80C2020Struct2018018[i].unk_08;

                eContestLink80C2020Struct2018000.unk_14++;
            }
        }
    }

    if (spC)
        PlaySE(SE_BOO);

    if (sp8)
        PlaySE(SE_PIN);
}
#else
// Assorted register differences
NAKED
void sub_80C40D4(u8 arg0, u8 arg1)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x8\n"
                "\tlsls r0, 24\n"
                "\tlsls r1, 24\n"
                "\tlsrs r7, r1, 24\n"
                "\tmovs r1, 0\n"
                "\tmov r10, r1\n"
                "\tmovs r2, 0\n"
                "\tstr r2, [sp]\n"
                "\tcmp r0, 0\n"
                "\tbne _080C4198\n"
                "\tmov r8, r2\n"
                "\tldr r0, _080C417C @ =gSharedMem + 0x18018\n"
                "\tsubs r1, 0x18\n"
                "\tadds r1, r0\n"
                "\tmov r9, r1\n"
                "\tadds r4, r0, 0\n"
                "\tadds r4, 0x8\n"
                "\tmovs r6, 0xA0\n"
                "_080C4102:\n"
                "\tldrb r0, [r4, 0x9]\n"
                "\tcmp r7, r0\n"
                "\tbcs _080C416A\n"
                "\tadds r0, 0x13\n"
                "\tadds r0, r6, r0\n"
                "\tsubs r0, r7\n"
                "\tlsls r0, 1\n"
                "\tldr r2, _080C4180 @ =0x0600bffe\n"
                "\tadds r0, r2\n"
                "\tldr r2, _080C4184 @ =0x000060b3\n"
                "\tadds r1, r2, 0\n"
                "\tstrh r1, [r0]\n"
                "\tldr r0, _080C4188 @ =sub_80C42C0\n"
                "\tmovs r1, 0xA\n"
                "\tbl CreateTask\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tldr r0, [r4]\n"
                "\tlsls r0, 16\n"
                "\tldrb r1, [r4, 0x9]\n"
                "\tbl __udivsi3\n"
                "\tadds r1, r7, 0x1\n"
                "\tadds r3, r0, 0\n"
                "\tmuls r3, r1\n"
                "\tldr r0, _080C418C @ =0x0000ffff\n"
                "\tands r0, r3\n"
                "\tldr r1, _080C4190 @ =0x00007fff\n"
                "\tcmp r0, r1\n"
                "\tbls _080C4146\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 9\n"
                "\tadds r3, r0\n"
                "_080C4146:\n"
                "\tldr r1, _080C4194 @ =gTasks\n"
                "\tlsls r0, r5, 2\n"
                "\tadds r0, r5\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r1\n"
                "\tmov r1, r8\n"
                "\tstrh r1, [r0, 0x8]\n"
                "\tlsrs r1, r3, 16\n"
                "\tstrh r1, [r0, 0xA]\n"
                "\tmov r2, r9\n"
                "\tldrb r0, [r2, 0x14]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r2, 0x14]\n"
                "\tmov r0, r10\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r10, r0\n"
                "_080C416A:\n"
                "\tadds r4, 0x14\n"
                "\tadds r6, 0x60\n"
                "\tmovs r0, 0x1\n"
                "\tadd r8, r0\n"
                "\tmov r1, r8\n"
                "\tcmp r1, 0x3\n"
                "\tble _080C4102\n"
                "\tb _080C4292\n"
                "\t.align 2, 0\n"
                "_080C417C: .4byte gSharedMem + 0x18018\n"
                "_080C4180: .4byte 0x0600bffe\n"
                "_080C4184: .4byte 0x000060b3\n"
                "_080C4188: .4byte sub_80C42C0\n"
                "_080C418C: .4byte 0x0000ffff\n"
                "_080C4190: .4byte 0x00007fff\n"
                "_080C4194: .4byte gTasks\n"
                "_080C4198:\n"
                "\tmovs r2, 0\n"
                "\tmov r8, r2\n"
                "\tldr r0, _080C4220 @ =gSharedMem + 0x18018\n"
                "\tmov r12, r0\n"
                "\tmov r9, r2\n"
                "\tmovs r1, 0xC0\n"
                "\tstr r1, [sp, 0x4]\n"
                "_080C41A6:\n"
                "\tmov r6, r9\n"
                "\tadd r6, r12\n"
                "\tldrb r1, [r6, 0x12]\n"
                "\tldrb r0, [r6, 0x10]\n"
                "\tldr r2, _080C4224 @ =0x000060a3\n"
                "\tcmp r0, 0\n"
                "\tbeq _080C41B6\n"
                "\tadds r2, 0x2\n"
                "_080C41B6:\n"
                "\tlsls r0, r1, 24\n"
                "\tasrs r0, 24\n"
                "\tcmp r7, r0\n"
                "\tbge _080C427E\n"
                "\tadds r0, 0x13\n"
                "\tldr r1, [sp, 0x4]\n"
                "\tadds r0, r1, r0\n"
                "\tsubs r0, r7\n"
                "\tlsls r0, 1\n"
                "\tldr r1, _080C4228 @ =0x0600bffe\n"
                "\tadds r0, r1\n"
                "\tstrh r2, [r0]\n"
                "\tldr r0, _080C422C @ =sub_80C42C0\n"
                "\tmovs r1, 0xA\n"
                "\tbl CreateTask\n"
                "\tlsls r0, 24\n"
                "\tlsrs r5, r0, 24\n"
                "\tldr r0, [r6, 0xC]\n"
                "\tlsls r0, 16\n"
                "\tldrb r1, [r6, 0x12]\n"
                "\tbl __udivsi3\n"
                "\tadds r1, r7, 0x1\n"
                "\tadds r3, r0, 0\n"
                "\tmuls r3, r1\n"
                "\tldr r0, _080C4230 @ =0x0000ffff\n"
                "\tands r0, r3\n"
                "\tldr r1, _080C4234 @ =0x00007fff\n"
                "\tcmp r0, r1\n"
                "\tbls _080C41FA\n"
                "\tmovs r2, 0x80\n"
                "\tlsls r2, 9\n"
                "\tadds r3, r2\n"
                "_080C41FA:\n"
                "\tldr r1, _080C4238 @ =gTasks\n"
                "\tlsls r2, r5, 2\n"
                "\tadds r0, r2, r5\n"
                "\tlsls r0, 3\n"
                "\tadds r4, r0, r1\n"
                "\tmov r0, r8\n"
                "\tstrh r0, [r4, 0x8]\n"
                "\tldrb r0, [r6, 0x10]\n"
                "\tadds r6, r1, 0\n"
                "\tcmp r0, 0\n"
                "\tbeq _080C423C\n"
                "\tmovs r0, 0x1\n"
                "\tstrh r0, [r4, 0xC]\n"
                "\tldr r0, [sp]\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tstr r0, [sp]\n"
                "\tb _080C4246\n"
                "\t.align 2, 0\n"
                "_080C4220: .4byte gSharedMem + 0x18018\n"
                "_080C4224: .4byte 0x000060a3\n"
                "_080C4228: .4byte 0x0600bffe\n"
                "_080C422C: .4byte sub_80C42C0\n"
                "_080C4230: .4byte 0x0000ffff\n"
                "_080C4234: .4byte 0x00007fff\n"
                "_080C4238: .4byte gTasks\n"
                "_080C423C:\n"
                "\tmov r0, r10\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 24\n"
                "\tlsrs r0, 24\n"
                "\tmov r10, r0\n"
                "_080C4246:\n"
                "\tldr r0, _080C4264 @ =gSharedMem + 0x18018\n"
                "\tmov r1, r9\n"
                "\tadds r4, r1, r0\n"
                "\tldrb r1, [r4, 0x10]\n"
                "\tmov r12, r0\n"
                "\tcmp r1, 0\n"
                "\tbeq _080C4268\n"
                "\tadds r0, r2, r5\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r6\n"
                "\tlsrs r2, r3, 16\n"
                "\tldr r1, [r4, 0x8]\n"
                "\tsubs r1, r2\n"
                "\tb _080C4274\n"
                "\t.align 2, 0\n"
                "_080C4264: .4byte gSharedMem + 0x18018\n"
                "_080C4268:\n"
                "\tadds r0, r2, r5\n"
                "\tlsls r0, 3\n"
                "\tadds r0, r6\n"
                "\tlsrs r2, r3, 16\n"
                "\tldr r1, [r4, 0x8]\n"
                "\tadds r1, r2\n"
                "_080C4274:\n"
                "\tstrh r1, [r0, 0xA]\n"
                "\tldr r1, _080C42BC @ =gSharedMem + 0x18000\n"
                "\tldrb r0, [r1, 0x14]\n"
                "\tadds r0, 0x1\n"
                "\tstrb r0, [r1, 0x14]\n"
                "_080C427E:\n"
                "\tmovs r2, 0x14\n"
                "\tadd r9, r2\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tadds r0, 0x60\n"
                "\tstr r0, [sp, 0x4]\n"
                "\tmovs r1, 0x1\n"
                "\tadd r8, r1\n"
                "\tmov r2, r8\n"
                "\tcmp r2, 0x3\n"
                "\tble _080C41A6\n"
                "_080C4292:\n"
                "\tldr r0, [sp]\n"
                "\tcmp r0, 0\n"
                "\tbeq _080C429E\n"
                "\tmovs r0, 0x16\n"
                "\tbl PlaySE\n"
                "_080C429E:\n"
                "\tmov r1, r10\n"
                "\tcmp r1, 0\n"
                "\tbeq _080C42AA\n"
                "\tmovs r0, 0x15\n"
                "\tbl PlaySE\n"
                "_080C42AA:\n"
                "\tadd sp, 0x8\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080C42BC: .4byte gSharedMem + 0x18000");
}
#endif //NONMATCHING

void sub_80C42C0(u8 taskId /*r12*/)
{
    bool32 r6 = FALSE;
    bool32 r9 = FALSE;
    u8 r5 = gTasks[taskId].data[0];
    s16 r7 = gTasks[taskId].data[1];
    s16 r1 = gTasks[taskId].data[2];
    s32 i;

    if (r1 != 0)
    {
        if (eContestLink80C2020Struct2018000.unk_0c[r5] <= 0)
            r6 = TRUE;
    }
    else
    {
        if (eContestLink80C2020Struct2018000.unk_0c[r5] >= 88)
            r6 = TRUE;
    }
    if (eContestLink80C2020Struct2018000.unk_0c[r5] == r7)
        r9 = TRUE;

    if (!r9)
    {
        if (r6)
        {
            eContestLink80C2020Struct2018000.unk_0c[r5] = r7;
        }
        else if (r1 != 0)
        {
            eContestLink80C2020Struct2018000.unk_0c[r5]--;
        }
        else
        {
            eContestLink80C2020Struct2018000.unk_0c[r5]++;
        }
    }
    if (!r6)
    {
        if (!r9)
        {
            for (i = 0; i < 11; i++)
            {
                u8 r0;
                u16 tile;
                if (eContestLink80C2020Struct2018000.unk_0c[r5] >= 8 * (i + 1))
                {
                    r0 = 8;
                }
                else if (eContestLink80C2020Struct2018000.unk_0c[r5] >= 8 * i)
                {
                    r0 = eContestLink80C2020Struct2018000.unk_0c[r5] % 8;
                }
                else
                {
                    r0 = 0;
                }
                if (r0 < 4)
                    tile = 0x504C + r0;
                else
                    tile = 0x5057 + r0;
                *(vu16 *)((VRAM + 0xE18E) + 2 * (96 * r5 + i)) = tile;
            }
        }
    }
    if (r9)
    {
        eContestLink80C2020Struct2018000.unk_14--;
        DestroyTask(taskId);
    }
}

void ScrSpecial_CheckSelectedMonAndInitContest(void)
{
    u8 result = CanMonParticipateInContest(&gPlayerParty[gContestMonPartyIndex]);
    if (result != 0)
    {
        Contest_InitAllPokemon(gSpecialVar_ContestCategory, gSpecialVar_ContestRank);
        CalculateRound1Points(gSpecialVar_ContestCategory);
    }
    gSpecialVar_Result = result;
}

u16 ScrSpecial_CanMonParticipateInSelectedLinkContest(void)
{
    u16 result = 0;
    struct Pokemon *mon = &gPlayerParty[gContestMonPartyIndex];
    switch (gSpecialVar_ContestCategory)
    {
    case CONTEST_CATEGORY_COOL:
        if (GetMonData(mon, MON_DATA_COOL_RIBBON) > gSpecialVar_ContestRank)
            result = 1;
        break;
    case CONTEST_CATEGORY_BEAUTY:
        if (GetMonData(mon, MON_DATA_BEAUTY_RIBBON) > gSpecialVar_ContestRank)
            result = 1;
        break;
    case CONTEST_CATEGORY_CUTE:
        if (GetMonData(mon, MON_DATA_CUTE_RIBBON) > gSpecialVar_ContestRank)
            result = 1;
        break;
    case CONTEST_CATEGORY_SMART:
        if (GetMonData(mon, MON_DATA_SMART_RIBBON) > gSpecialVar_ContestRank)
            result = 1;
        break;
    case CONTEST_CATEGORY_TOUGH:
        if (GetMonData(mon, MON_DATA_TOUGH_RIBBON) > gSpecialVar_ContestRank)
            result = 1;
        break;
    }

    return result;
}


void ScrSpecial_GiveContestRibbon(void)
{
    u8 ribbonData;

    if (gContestFinalStandings[gContestPlayerMonIndex] != 0)
        return;

    switch (gSpecialVar_ContestCategory)
    {
    case CONTEST_CATEGORY_COOL:
        ribbonData = GetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_COOL_RIBBON);
        if (ribbonData <= gSpecialVar_ContestRank && ribbonData < 4)
        {
            ribbonData++;
            SetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_COOL_RIBBON, &ribbonData);
        }
        break;
    case CONTEST_CATEGORY_BEAUTY:
        ribbonData = GetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_BEAUTY_RIBBON);
        if (ribbonData <= gSpecialVar_ContestRank && ribbonData < 4)
        {
            ribbonData++;
            SetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_BEAUTY_RIBBON, &ribbonData);
        }
        break;
    case CONTEST_CATEGORY_CUTE:
        ribbonData = GetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_CUTE_RIBBON);
        if (ribbonData <= gSpecialVar_ContestRank && ribbonData < 4)
        {
            ribbonData++;
            SetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_CUTE_RIBBON, &ribbonData);
        }
        break;
    case CONTEST_CATEGORY_SMART:
        ribbonData = GetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_SMART_RIBBON);
        if (ribbonData <= gSpecialVar_ContestRank && ribbonData < 4)
        {
            ribbonData++;
            SetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_SMART_RIBBON, &ribbonData);
        }
        break;
    case CONTEST_CATEGORY_TOUGH:
        ribbonData = GetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_TOUGH_RIBBON);
        if (ribbonData <= gSpecialVar_ContestRank && ribbonData < 4)
        {
            ribbonData++;
            SetMonData(&gPlayerParty[gContestMonPartyIndex], MON_DATA_TOUGH_RIBBON, &ribbonData);
        }
        break;
    }
}

void Contest_CopyAndConvertTrainerName_Intl(u8 * dest, const u8 * src)
{
    StringCopy(dest, src);
    if (dest[0] == EXT_CTRL_CODE_BEGIN && dest[1] == 0x15)
        ConvertInternationalString(dest, LANGUAGE_JAPANESE);
}

void Contest_CopyAndConvertNicknameI_Intl(u8 * dest, u8 idx)
{
    StringCopy(dest, gContestMons[idx].nickname);
    if (gIsLinkContest & 1)
    {
        if (gLinkPlayers[idx].language == LANGUAGE_JAPANESE)
        {
            ConvertInternationalString(dest, GetStringLanguage(dest));
        }
    }
}

void Contest_GetTrainerNameI_StringVar1(void)
{
    if (gIsLinkContest & 1)
    {
        Contest_CopyAndConvertTrainerName_Intl(gStringVar1, gLinkPlayers[gSpecialVar_0x8006].name);
    }
    else
    {
        Contest_CopyAndConvertTrainerName_Intl(gStringVar1, gContestMons[gSpecialVar_0x8006].trainerName);
    }
}

void Contest_GetNicknameI_StringVar1(void)
{
    Contest_CopyAndConvertNicknameI_Intl(gStringVar3, gSpecialVar_0x8006);
}

void ScrSpecial_CountContestMonsWithBetterCondition(void)
{
    u8 i;
    u8 count;

    for (i = 0, count = 0; i < 4; i++)
    {
        if (gContestMonRound1Points[gSpecialVar_0x8006] < gContestMonRound1Points[i])
            count++;
    }

    gSpecialVar_0x8004 = count;
}

void ScrSpecial_GetMonCondition(void)
{
    gSpecialVar_0x8004 = gContestMonRound1Points[gSpecialVar_0x8006];
}

void ScrSpecial_GetContestWinnerIdx(void)
{
    u8 i;

    for (i = 0; i < 4 && gContestFinalStandings[i] != 0; i++)
        ;

    gSpecialVar_0x8005 = i;
}

void ScrSpecial_GetContestWinnerTrainerName(void)
{
    u8 i;

    for (i = 0; i < 4 && gContestFinalStandings[i] != 0; i++)
        ;

    if (gIsLinkContest & 1)
    {
        Contest_CopyAndConvertTrainerName_Intl(gStringVar3, gLinkPlayers[i].name);
    }
    else
    {
        Contest_CopyAndConvertTrainerName_Intl(gStringVar3, gContestMons[i].trainerName);
    }
}

void ScrSpecial_GetContestWinnerNick(void)
{
    u8 i;

    for (i = 0; i < 4 && gContestFinalStandings[i] != 0; i++)
        ;

    Contest_CopyAndConvertNicknameI_Intl(gStringVar1, i);
}

void sub_80C488C(void)
{
    SetMainCallback2(CB2_StartContest);
}

void sub_80C489C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(sub_80C488C);
    }
}

void sub_80C48C8(void)
{
    ScriptContext2_Enable();
    CreateTask(sub_80C489C, 10);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
}

void Contest_GetSpeciesNameI_StringVar1(void)
{
    gSpecialVar_0x8004 = gContestMons[gSpecialVar_0x8006].species;
}

void sub_80C4914(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(sub_80C2358);
    }
}

void sub_80C4940(void)
{
    ScriptContext2_Enable();
    CreateTask(sub_80C4914, 10);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB_BLACK);
}

void ScrSpecial_GetContestPlayerMonIdx(void)
{
    gSpecialVar_0x8004 = gContestPlayerMonIndex;
}

void ContestLinkTransfer(u8 category)
{
    u8 taskId;
    ScriptContext2_Enable();
    taskId = CreateTask(Task_LinkContest_Init, 0);
    SetTaskFuncWithFollowupFunc(taskId, Task_LinkContest_Init, Task_StartCommunication);
    gTasks[taskId].data[9] = category;
}

void Task_StartCommunication(u8 taskId)
{
    Contest_CreatePlayerMon(gContestMonPartyIndex);
    SetTaskFuncWithFollowupFunc(taskId, sub_80C8734, Task_StartCommunicateRng);
}

void Task_StartCommunicateRng(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(
        taskId, Task_LinkContest_CommunicateRng, Task_StartCommunicateLeaderIds);
}

void Task_StartCommunicateLeaderIds(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(
        taskId, Task_LinkContest_CommunicateLeaderIds, Task_StartCommunicateCategory);
}

void Task_StartCommunicateCategory(u8 taskId)
{
    SetTaskFuncWithFollowupFunc(
        taskId, Task_LinkContest_CommunicateCategory, Task_LinkContest_SetUpContest);
}

void Task_LinkContest_SetUpContest(u8 taskId)
{
    u8 i;
    u8 sp0[4];
    u8 sp4[4];

    for (i = 0; i < 4; i++)
        sp0[i] = gTasks[taskId].data[i + 1];

    for (i = 0; i < 4; i++)
    {
        if (sp0[0] != sp0[i])
            break;
    }

    if (i == 4)
        gSpecialVar_0x8004 = 0;
    else
        gSpecialVar_0x8004 = 1;

    for (i = 0; i < 4; i++)
        sp4[i] = gTasks[taskId].data[i + 5];

    gContestLinkLeaderIndex = LinkContest_GetLeaderIndex(sp4);
    CalculateRound1Points(gSpecialVar_ContestCategory);
    SetTaskFuncWithFollowupFunc(
        taskId, Task_LinkContest_CommunicateRound1Points, Task_LinkContest_CalculateTurnOrder);
}

void Task_LinkContest_CalculateTurnOrder(u8 taskId)
{
    SortContestants(0);
    SetTaskFuncWithFollowupFunc(
        taskId, Task_LinkContest_CommunicateTurnOrder, Task_LinkContest_FinalizeConnection);
}

u8 LinkContest_GetLeaderIndex(u8 * a0)
{
    s32 i;
    u8 result = 0;

    for (i = 1; i < 4; i++)
    {
        if (a0[result] < a0[i])
            result = i;
    }

    return result;
}

void Task_LinkContest_FinalizeConnection(u8 taskId)
{
    if (gSpecialVar_0x8004 == 1)
    {
        if (IsLinkTaskFinished())
            gTasks[taskId].func = Task_LinkContest_Disconnect;
    }
    else
    {
        DestroyTask(taskId);
        ScriptContext2_Disable();
        EnableBothScriptContexts();
    }
}

void Task_LinkContest_Disconnect(u8 taskId)
{
    SetCloseLinkCallback();
    gTasks[taskId].func = Task_LinkContest_WaitDisconnect;
}

void Task_LinkContest_WaitDisconnect(u8 taskId)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        DestroyTask(taskId);
        ScriptContext2_Disable();
        EnableBothScriptContexts();
    }
}
