#include "global.h"
#include "data2.h"
#include "util.h"
#include "overworld.h"
#include "constants/songs.h"
#include "ewram.h"
#include "main.h"
#include "scanline_effect.h"
#include "decompress.h"
#include "palette.h"
#include "blend_palette.h"
#include "graphics.h"
#include "strings2.h"
#include "text.h"
#include "string_util.h"
#include "menu.h"
#include "sound.h"
#include "pokedex.h"
#include "pokemon_icon.h"
#include "tv.h"
#include "battle.h"
#include "contest.h"
#include "link.h"
#include "field_effect.h"
#include "field_specials.h"
#include "contest_link_80C857C.h"
#include "contest_link_80C2020.h"

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
    u8 filler_01[1];
    u8 unk_02;
    u8 unk_03;
    u8 unk_04;
    u8 unk_05;
    u8 unk_06;
    u8 filler_07[1];
    u8 unk_08;
    u8 unk_09;
    u8 unk_0a;
    u8 filler_0b[9];
    u8 unk_14;
};

struct UnkEwramStruct18018 {
    u8 filler_00[0x50];
};

#define eContestLink80C2020Struct2018000 (*(struct UnkEwramStruct18000 *)(gSharedMem + 0x18000))
#define eContestLink80C2020Struct2018018 (*(struct UnkEwramStruct18018 *)(gSharedMem + 0x18018))
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
void sub_80C34CC(s16 data4, s16 pos0y, u16 data5, s16 data6);
void sub_80C3520(u16 a0);
void sub_80C3698(const u8 *string);
void sub_80C3764(void);
void sub_80C37E4(void);
u8 sub_80C3990(u8 a0, u8 a1);
s8 sub_80C39E4(u8 a0, u8 a1);
void sub_80C3A5C(u8 taskId);
void sub_80C3B30(u8 taskId);
void sub_80C3C44(struct Sprite *sprite);
void sub_80C3CB8(struct Sprite *sprite);
void sub_80C3D04(u8 taskId);
void sub_80C3DF0(struct Sprite *sprite);
void sub_80C3E60(u8 a0, u8 a1);
void sub_80C3F00(void);
void sub_80C40D4(u8 a0, u8 a1);

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
    eContestLink80C2020Struct2018018 = (struct UnkEwramStruct18018){};
    sub_80C33DC();
    BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
    gPaletteFade.bufferTransferDisabled = FALSE;
    eContestLink80C2020Struct2018000.unk_02 = CreateTask(sub_80C24F4, 5);
    SetMainCallback2(sub_80C2430);
    gBattle_WIN1H = 0xf0;
    gBattle_WIN1V = 0x80a0;
    CreateTask(sub_80C2F28, 20);
    sub_80C3F00();
    PlayBGM(MUS_CON_K);
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
    SetTaskFuncWithFollowupFunc(taskId, sub_80C89DC, sub_80C25C0);
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
            HandleLoadSpecialPokePic(gMonFrontPicTable + species, gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, (intptr_t)gSharedMem, gUnknown_081FAF4C[1], species, personality);
            monPal = GetMonSpritePalStructFromOtIdPersonality(species, otId, personality);
            LoadCompressedObjectPalette(monPal);
            GetMonSpriteTemplate_803C56C(species, 1);
            gUnknown_02024E8C.paletteTag = monPal->tag;
            spriteId = CreateSprite(&gUnknown_02024E8C, 0x110, 0x50, 10);
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
        sub_800832C();
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
    ewram15DDF = 1;
    ewram15DDE = sub_80B2C4C(0xfe, 0);
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
            SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
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

#ifdef NONMATCHING
void sub_80C3024(u16 species, u8 destOffset, u8 srcOffset, bool8 useDmaNow, u32 personality)
{
    int i;
    int j;
    u16 tile;
    u16 offset;
    int vOffset;

    if (useDmaNow)
    {
        DmaCopy32Defvars(3, GetMonIconPtr(species, personality) + (srcOffset << 9) + 0x80, BG_CHAR_ADDR(1) + (destOffset << 9), 0x180);
        tile = ((destOffset + 10) << 12);
        tile |= (destOffset * 16 + 0x200);
        offset = destOffset * 0x60 + 0x83;
        for (i = 0; i < 3; i++)
        {
            vOffset = (i << 5) + offset;
            for (j = 0; j < 4; j++)
            {
                ((u16 *)BG_CHAR_ADDR(3))[vOffset + j] = tile;
                tile++;
            }
        }
    }
    else
    {
        RequestSpriteCopy(GetMonIconPtr(species, personality) + (srcOffset << 9) + 0x80, BG_CHAR_ADDR(1) + (destOffset << 9), 0x180);
    }
}
#else
__attribute__((naked)) void sub_80C3024(u16 species, u8 destOffset, u8 srcOffset, bool8 useDmaNow, u32 personality)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                    "\tldr r6, [sp, 0x10]\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r4, r1, 24\n"
                    "\tlsls r2, 24\n"
                    "\tlsrs r5, r2, 24\n"
                    "\tlsls r3, 24\n"
                    "\tcmp r3, 0\n"
                    "\tbeq _080C30B0\n"
                    "\tadds r1, r6, 0\n"
                    "\tbl GetMonIconPtr\n"
                    "\tlsls r1, r5, 9\n"
                    "\tadds r0, r1\n"
                    "\tadds r0, 0x80\n"
                    "\tlsls r1, r4, 9\n"
                    "\tldr r2, _080C30A0 @ =0x06004000\n"
                    "\tadds r1, r2\n"
                    "\tldr r2, _080C30A4 @ =0x040000d4\n"
                    "\tstr r0, [r2]\n"
                    "\tstr r1, [r2, 0x4]\n"
                    "\tldr r0, _080C30A8 @ =0x84000060\n"
                    "\tstr r0, [r2, 0x8]\n"
                    "\tldr r0, [r2, 0x8]\n"
                    "\tadds r1, r4, 0\n"
                    "\tadds r1, 0xA\n"
                    "\tlsls r1, 28\n"
                    "\tlsls r0, r4, 20\n"
                    "\tmovs r2, 0x80\n"
                    "\tlsls r2, 18\n"
                    "\tadds r0, r2\n"
                    "\torrs r0, r1\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tlsls r0, r4, 1\n"
                    "\tadds r0, r4\n"
                    "\tlsls r0, 21\n"
                    "\tmovs r2, 0x83\n"
                    "\tlsls r2, 16\n"
                    "\tadds r0, r2\n"
                    "\tlsrs r5, r0, 16\n"
                    "\tmovs r2, 0\n"
                    "\tldr r6, _080C30AC @ =0x0600c000\n"
                    "_080C307C:\n"
                    "\tlsls r0, r2, 5\n"
                    "\tadds r4, r2, 0x1\n"
                    "\tadds r0, r5\n"
                    "\tmovs r3, 0x3\n"
                    "\tlsls r0, 1\n"
                    "\tadds r2, r0, r6\n"
                    "_080C3088:\n"
                    "\tstrh r1, [r2]\n"
                    "\tadds r0, r1, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tadds r2, 0x2\n"
                    "\tsubs r3, 0x1\n"
                    "\tcmp r3, 0\n"
                    "\tbge _080C3088\n"
                    "\tadds r2, r4, 0\n"
                    "\tcmp r2, 0x2\n"
                    "\tble _080C307C\n"
                    "\tb _080C30CA\n"
                    "\t.align 2, 0\n"
                    "_080C30A0: .4byte 0x06004000\n"
                    "_080C30A4: .4byte 0x040000d4\n"
                    "_080C30A8: .4byte 0x84000060\n"
                    "_080C30AC: .4byte 0x0600c000\n"
                    "_080C30B0:\n"
                    "\tadds r1, r6, 0\n"
                    "\tbl GetMonIconPtr\n"
                    "\tlsls r1, r5, 9\n"
                    "\tadds r0, r1\n"
                    "\tadds r0, 0x80\n"
                    "\tlsls r1, r4, 9\n"
                    "\tldr r2, _080C30D0 @ =0x06004000\n"
                    "\tadds r1, r2\n"
                    "\tmovs r2, 0xC0\n"
                    "\tlsls r2, 1\n"
                    "\tbl RequestSpriteCopy\n"
                    "_080C30CA:\n"
                    "\tpop {r4-r6}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_080C30D0: .4byte 0x06004000");
}
#endif

static void LoadAllContestMonIcons(u8 srcOffset, bool8 useDmaNow)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        sub_80C3024(gContestMons[i].species, i, srcOffset, useDmaNow, gContestMons[i].personality);
    }
}

#ifdef NONMATCHING
void sub_80C310C(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        u16 species = mon_icon_convert_unown_species_id(gContestMons[i].species, 0);
        LoadPalette(gMonIconPalettes[gMonIconPaletteIndices[species]], 0xa0 + 0x10 * i, 0x20);
    }
}
#else
__attribute__((naked)) void sub_80C310C(void)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                "\tmovs r4, 0\n"
                "\tldr r6, _080C314C @ =gMonIconPaletteIndices\n"
                "\tmovs r5, 0xA0\n"
                "\tlsls r5, 16\n"
                "_080C3116:\n"
                "\tldr r1, _080C3150 @ =gContestMons\n"
                "\tlsls r0, r4, 6\n"
                "\tadds r0, r1\n"
                "\tldrh r0, [r0]\n"
                "\tmovs r1, 0\n"
                "\tbl mon_icon_convert_unown_species_id\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tadds r0, r6\n"
                "\tldrb r0, [r0]\n"
                "\tlsls r0, 5\n"
                "\tldr r1, _080C3154 @ =gMonIconPalettes\n"
                "\tadds r0, r1\n"
                "\tlsrs r1, r5, 16\n"
                "\tmovs r2, 0x20\n"
                "\tbl LoadPalette\n"
                "\tmovs r0, 0x80\n"
                "\tlsls r0, 13\n"
                "\tadds r5, r0\n"
                "\tadds r4, 0x1\n"
                "\tcmp r4, 0x3\n"
                "\tble _080C3116\n"
                "\tpop {r4-r6}\n"
                "\tpop {r0}\n"
                "\tbx r0\n"
                "\t.align 2, 0\n"
                "_080C314C: .4byte gMonIconPaletteIndices\n"
                "_080C3150: .4byte gContestMons\n"
                "_080C3154: .4byte gMonIconPalettes");
}
#endif

// void sub_80C3158(const u8 *string, u8 spriteId)
// {
//     int i, j;
//     u8 width;
//     u8 * displayedStringBattle;
//     void * dest;
//     u8 * d1;
//     u8 * d2;
//     void *d3;
//     void *d4;
//     void *d5;
//     void *d6;
//     int w;
//     u16 sp00[4];
//     struct Sprite *sprite = &gSprites[spriteId];
//     sp00[0] = gSprites[spriteId].oam.tileNum;
//     sp00[1] = gSprites[sprite->data[0]].oam.tileNum;
//     sp00[2] = gSprites[sprite->data[1]].oam.tileNum;
//     sp00[3] = gSprites[sprite->data[2]].oam.tileNum;

//     for (i = 0; i < 4; i++)
//     {
//         DmaClear32(3, (void *)VRAM + 0x10000 + 32 * sp00[i], 0x400);
//     }

//     width = Text_GetStringWidthFromWindowTemplate(&gWindowTemplate_81E7278, string);
//     displayedStringBattle = gDisplayedStringBattle;
//     displayedStringBattle = StringCopy(displayedStringBattle, gUnknown_083D17E2);
//     if ((~width + 1) & 7)
//     {
//         displayedStringBattle[0] = EXT_CTRL_CODE_BEGIN;
//         displayedStringBattle[1] = 0x11;
//         displayedStringBattle[2] = ((~width + 1) & 7) / 2;
//         displayedStringBattle += 3;
//     }

//     width += -8 & (width + 7);
//     displayedStringBattle = StringCopy(displayedStringBattle, string);

//     displayedStringBattle[0] = EXT_CTRL_CODE_BEGIN;
//     displayedStringBattle[1] = 0x13;
//     displayedStringBattle[2] = width;
//     displayedStringBattle[3] = EOS;

//     sub_80034D4(eContestLink80C2020Struct2018068, gDisplayedStringBattle);

//     CpuSet(&gUnknown_083D1624[0x0], (void *)0x6010000 + 32 * sp00[0], 0x4000008);
//     CpuSet(&gUnknown_083D1624[0x40], (void *)0x6010000 + 32 * sp00[0] + 0x100, 0x4000008);
//     CpuSet(&gUnknown_083D1624[0x40], (void *)0x6010000 + 32 * sp00[0] + 0x200, 0x4000008);
//     CpuSet(&gUnknown_083D1624[0x20], (void *)0x6010000 + 32 * sp00[0] + 0x300, 0x4000008);

//     w = width / 8;
//     j = 0;
//     if (j <= w)
//     {
//         d2 = eContestLink80C2020Struct2018068 + 0x20;
//         d1 = eContestLink80C2020Struct2018068;
//         d3 = (void *)VRAM + 0x0FD20;
//         d4 = (void *)VRAM + 0x0FE20;
//         d5 = (void *)VRAM + 0x0FF20;
//         d6 = (void *)VRAM + 0x10020;
//         while (j <= w)
//         {
//             if (j < 7)
//                 dest = 32 * sp00[0] + d6;
//             else if (j < 15)
//                 dest = 32 * sp00[1] + d5;
//             else if (j < 23)
//                 dest = 32 * sp00[2] + d4;
//             else
//                 dest = 32 * sp00[3] + d3;

//             if (j == w)
//                 break;

//             CpuSet(gUnknown_083D16E4, dest, 0x4000008);
//             CpuSet(gUnknown_083D16E4 + 0x10, dest + 0x300, 0x4000008);
//             CpuSet(j * 0x40 + d2, dest + 0x100, 0x4000008);
//             CpuSet(j * 0x40 + d1, dest + 0x200, 0x4000008);

//             d3 += 0x20;
//             d4 += 0x20;
//             d5 += 0x20;
//             d6 += 0x20;
//             j++;
//         }
//     }

//     CpuSet(gUnknown_083D1644, dest, 0x4000008);
//     CpuSet(gUnknown_083D1644 + 0x40, dest + 0x100, 0x4000008);
//     CpuSet(gUnknown_083D1644 + 0x40, dest + 0x200, 0x4000008);
//     CpuSet(gUnknown_083D1644 + 0x20, dest + 0x300, 0x4000008);
// }
