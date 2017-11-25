#include "global.h"
#include "battle.h"
#include "data2.h"
#include "decompress.h"
#include "event_data.h"
#include "ewram.h"
#include "item.h"
#include "items.h"
#include "learn_move.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "region_map.h"
#include "sound.h"
#include "species.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "task.h"
#include "tv.h"
#include "unknown_task.h"

#define ewramSS (*(struct SummaryScreenStruct *)(gSharedMem + 0x18000))

static void sub_809DE44(void);
static void sub_809EB40(u8);
static void sub_809EBC4(void);
static void sub_809E044(void);
static void sub_80A1D84(struct Pokemon *);
static void sub_80A18C4(void);
static bool8 LoadPokemonSummaryScreenGraphics(void);
static bool8 MonKnowsMultipleMoves(struct Pokemon *);
extern void PrintSummaryWindowHeaderText(void);
static void sub_80A1DCC(struct Pokemon *);
static void sub_809FE80(void);
static void sub_80A00A4(void);
static void sub_80A0390(void);
extern void sub_80A015C(struct Pokemon *);
extern u8 sub_80A1808(struct Pokemon *);
extern void sub_80A1F98(s32, u8, u8, u8, u8, u16, s32);
static void sub_80A0958(struct Pokemon *);
static void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *, u8, u8);
static void PokemonSummaryScreen_PrintEggTrainerMemo(struct Pokemon *, u8, u8);
static void sub_80A1EF8(const u8 *, u8, u8, u16, s32);
static void sub_80A1F48(const u8 *, u8, u8, u8, u16);
static void PrintHeldItemName(u16, u8, u8);
static void PrintNumRibbons(struct Pokemon *);
static void DrawExperienceProgressBar(struct Pokemon *, u8, u8);
static void sub_809E13C(u8 taskId);
static void sub_80A1950(void);
static void sub_809DA1C(void);
static void sub_809D844(void);

extern void sub_809D85C(void);
extern void sub_809DE64(void);
extern bool8 sub_809DA84(void);
extern void SummaryScreenHandleAButton(u8);
extern void SummaryScreenHandleUpDownInput(u8, s8);
extern bool8 sub_809F7D0(u8);
extern void sub_809F9D0(u8, u8);
extern void sub_809EAC8(u8);
extern void sub_809E534(u8);
extern void sub_809E83C(u8, s8);
extern void sub_809E7F0(u8);
extern void sub_809E6D8(void);
extern void sub_809E5C4(void);
extern void sub_80A1B40(u8);
extern void sub_80A2078(int);
extern void sub_809E3FC(u8);
extern void SummaryScreenHandleKeyInput(u8);
extern void sub_80A1B1C(u8);
extern void sub_80A16CC(u8);
extern void sub_80A1A30(u8);
extern void DrawSummaryScreenNavigationDots(void);
extern void sub_80A00F4(u8);
extern void sub_80A029C(struct Pokemon *);
extern void sub_809EE74(u8);
extern void sub_809EC38(u8);
extern void sub_809FBE4(void);
extern void sub_809F0D0(u8, s8);
extern void sub_80A1500(u8);
extern void sub_80A1334(u8);
extern u8 StorageSystemGetNextMonIndex(struct BoxPokemon *, u8, u8, u8);
extern void sub_809F43C(u8);
extern s8 sub_809F284(s8);
extern s8 sub_809F3CC(s8);
extern bool8 sub_809F310(struct Pokemon *);
extern s8 sub_809F344(u8);
extern s8 sub_809F388(u8);
extern bool8 sub_809F5F8(void);
extern void sub_80A1DE8(struct Pokemon *);
extern u8 sub_809F6B4(struct Pokemon *, u8 *);
extern void DrawPokerusSurvivorDot(struct Pokemon *);
extern void sub_80A12D0(s8);
extern void sub_809FAC8(struct Pokemon *);
extern void SummaryScreenHandleLeftRightInput(u8, s8);
extern void sub_809E8F0(u8, s8, u8*);
extern void sub_809E260(u8);
extern void sub_809F814(u8);
extern void sub_80A1654(s8, u8);
extern void sub_80A1488(s8, u8);
extern void GetStringCenterAlignXOffsetWithLetterSpacing(u8, u8, u8, u8);
extern bool8 sub_809FA94(struct Pokemon *);
static void sub_809FC34(struct Pokemon *);
extern void sub_809FC0C(void);
static void sub_809FF64(struct Pokemon *);
extern void sub_809FEB8(void);
extern void sub_80A1918(u8, u8);
extern void sub_80A198C(u8, u8, u8, u8);
extern u16 GetMonMove(struct Pokemon *, u8);
extern void sub_80A04CC(u16);
extern void sub_80A057C(u16);
extern void sub_80A0498(u16);
extern void sub_80A046C(u16);
extern void sub_80A03F0(struct Pokemon *, u8 *);
extern u16 sub_80A03BC(struct Pokemon *, u8);
extern void sub_80A20A8(u8);
extern u8 ball_number_to_ball_processing_index(u16);
extern void sub_809F678(struct Pokemon *);
extern void sub_80A1BC0(struct Sprite *sprite);
extern void sub_80A1888(struct Sprite *);
extern void sub_80A0428(struct Pokemon *, u8 *);
extern void sub_80A18E4(u8);
extern void GetStringCenterAlignXOffset(u8, u8, u8);
extern u8 *sub_80A1E58(u8 *, u8);
static void sub_80A0A2C(struct Pokemon *, u8, u8);
extern void sub_80A1FF8(const u8 *, u8, u8, u8);

extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gUnknown_020384F0;
extern u8 gUnknown_08208238[];
extern u16 gUnknown_030041B8;
extern u16 gUnknown_03004280;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030041B0;
extern const u16 gSummaryScreenTextTiles[];
extern const u16 gSummaryScreenButtonTiles[];
extern const u8 gMoveTypes_Pal[];
extern const u8 gStatusScreen_Pal[];
extern const u8 gStatusScreen_Tilemap[];
extern const struct CompressedSpritePalette gUnknown_083C1278;
extern const struct CompressedSpritePalette gUnknown_083C12FC;
extern const struct CompressedSpriteSheet gUnknown_083C12F4;
extern const struct CompressedSpriteSheet gUnknown_083C1270;
extern const struct CompressedSpriteSheet gUnknown_083C11B8;
extern const u8 gUnknown_08E74688[];
extern const u8 gUnknown_08E73E88[];
extern const u8 gUnknown_08E74E88[];
extern const u8 gUnknown_08E73508[];
extern const u8 gStatusScreen_Gfx[];
extern const u8 gFontDefaultPalette[];
extern const u8 gUnknownPalette_81E6692[];
extern const u8 gUnknown_083C15A8[];
extern const void (*gUnknown_083C1580[])(void);
extern const void (*gUnknown_083C1598[])(struct Pokemon *);
extern const void (*gUnknown_083C1588[])(struct Pokemon *);
extern const u16 gUnknown_083C157E[];
extern const u16 gUnknown_083C157C[];
extern const u8 gAbilityNames[][13];
extern const u8 * const gAbilityDescriptions[];
extern const u8 * const gMoveDescriptions[];
extern const u8 * const gContestEffectStrings[];
extern const struct ContestMove gContestMoves[];
extern const struct ContestEffect gContestEffects[];
extern TaskFunc gUnknown_03005CF0;
extern const u8 gUnknown_083C15BC[];
extern struct Sprite *gUnknown_020384F4;
extern const u16 gSummaryScreenMonMarkingsPalette[];
extern struct SpriteTemplate gSpriteTemplate_83C1304;
extern struct SpriteTemplate gSpriteTemplate_83C1280;
extern const u8 gUnknown_083C11D8[];
extern struct SpriteTemplate gSpriteTemplate_83C11C0;
extern struct SpriteTemplate gUnknown_02024E8C;
extern const u16 gUnknown_08E94510[];
extern const u16 gUnknown_08E94550[];
extern const u16 gUnknown_08E94590[];
extern const u8 gUnknown_08E73E88[];
extern const u8 gUnknown_083C15AE[];
extern const u8 gUnknown_083C15B4[];
extern const u8 *const gUnknown_083C1068[];


void sub_809D844(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_809D85C(void)
{
    REG_BG1HOFS = gUnknown_030042C0;
    REG_BG1VOFS = gUnknown_030041B4;
    REG_BG2HOFS = gUnknown_03004288;
    REG_BG2VOFS = gUnknown_03004280;
    REG_BG3HOFS = gUnknown_030041B0;
    REG_BG3VOFS = gUnknown_030041B8;

    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void ShowPokemonSummaryScreen(struct Pokemon *party, u8 partyIndex, u8 partyCount, MainCallback func, u8 e)
{
    gPaletteFade.bufferTransferDisabled = 1;

    ewramSS.unk0.partyMons = party;
    ewramSS.unk8 = e;
    ewramSS.unk9 = partyIndex;
    ewramSS.unkA = partyCount;
    ewramSS.unk4 = func;
    ewramSS.unk74 = 0;
    ewramSS.unk79 = 4;
    ewramSS.unk7C = 0;
    ewramSS.unk80 = 0;
    ewramSS.unk7B = 0;

    if (e > 4)
    {
        ewramSS.unkE = 1;
    }
    else
    {
        ewramSS.unkE = 0;
    }

    switch (e)
    {
    case 0:
    case 5:
        ewramSS.unk75 = 0;
        ewramSS.unk76 = 3;
        ewramSS.unk77 = 0;
        ewramSS.unk78 = 0;
        ewramSS.unk7E = 1;
        ewramSS.unk7F = 7;
        break;
    case 4:
        ewramSS.unk75 = 0;
        ewramSS.unk76 = 3;
        ewramSS.unk77 = 0;
        ewramSS.unk78 = 0;
        ewramSS.unk7E = 1;
        ewramSS.unk7F = 7;
        ewramSS.unk7B = 1;
        break;
    case 2:
        ewramSS.unk75 = 2;
        ewramSS.unk76 = 3;
        ewramSS.unk77 = 1;
        ewramSS.unk78 = 1;
        ewramSS.unk7E = 3;
        ewramSS.unk7F = 0;
        ewramSS.unk79 = 0;
        break;
    case 1:
    case 6:
        ewramSS.unk75 = 2;
        ewramSS.unk76 = 3;
        ewramSS.unk77 = 1;
        ewramSS.unk78 = 1;
        break;
    }

    ewramSS.unkB = ewramSS.unk75;
    SetMainCallback2(sub_809DE44);
}

void sub_809D9F0(struct Pokemon *party, u8 partyIndex, u8 partyCount, MainCallback func, u16 e)
{
    ShowPokemonSummaryScreen(party, partyIndex, partyCount, func, 2);
    ewramSS.unk7C = e;
}

void sub_809DA1C(void)
{
    switch (ewramSS.unk8)
    {
    case 0:
    case 5:
        ewramSS.unkF = CreateTask(SummaryScreenHandleKeyInput, 0);
        break;
    case 4:
        ewramSS.unkF = CreateTask(SummaryScreenHandleKeyInput, 0);
        break;
    case 2:
    case 3:
        ewramSS.unkF = CreateTask(sub_809EB40, 0);
        break;
    case 1:
    case 6:
        ewramSS.unkF = CreateTask(sub_809E3FC, 0);
        break;
    }
}

bool8 sub_809DA84(void)
{
    const u16 *src;
    void *dest;

    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        ResetSpriteData();
        gMain.state++;
        break;
    case 1:
        remove_some_task();
        gMain.state++;
        break;
    case 2:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 3:
        dest = (void *)VRAM;
        DmaClearLarge(3, dest, 0x10000, 0x1000, 32);
        gMain.state++;
        break;
    case 4:
        sub_809DE64();
        gMain.state++;
        break;
    case 5:
        SetUpWindowConfig(&gWindowConfig_81E6E6C);
        gMain.state++;
        break;
    case 6:
        MultistepInitMenuWindowBegin(&gWindowConfig_81E6E6C);
        gMain.state++;
        break;
    case 7:
        if (MultistepInitMenuWindowContinue())
        {
            gMain.state++;
        }
        break;
    case 8:
        sub_809DA1C();
        gMain.state++;
        break;
    case 9:
        src = gSummaryScreenTextTiles;
        dest = (void *)VRAM + 0xD000;
        DmaCopy16(3, src, dest, 320);

        src = gSummaryScreenButtonTiles;
        dest = (void *)VRAM + 0xD140;
        DmaCopy16(3, src, dest, 256);

        ewramSS.unk74 = 0;
        gMain.state++;
        break;
    case 10:
        if (LoadPokemonSummaryScreenGraphics())
        {
            ewramSS.unk74 = 0;
            gMain.state++;
        }
        break;
    case 11:
        sub_80A18C4();
        gMain.state++;
        break;
    case 12:
        sub_809F678(&ewramSS.unk10);
        if (!GetMonStatusAndPokerus(&ewramSS.unk10))
        {
            sub_80A12D0(0);
        }
        else
        {
            sub_80A12D0(10);
        }

        DrawPokerusSurvivorDot(&ewramSS.unk10);
        gMain.state++;
        break;
    case 13:
        sub_80A1950();
        sub_80A1D84(&ewramSS.unk10);
        gMain.state++;
        break;
    case 14:
        sub_80A1DE8(&ewramSS.unk10);
        ewramSS.unk74 = 0;
        gMain.state++;
        break;
    case 15:
        if ((ewramSS.unkC = sub_809F6B4(&ewramSS.unk10, &ewramSS.unk74)) != 0xFF)
        {
            ewramSS.unk74 = 0;
            gMain.state++;
        }
        break;
    case 16:
        sub_809E044();
        DrawSummaryScreenNavigationDots();
        gMain.state++;
        break;
    case 17:
        if (ewramSS.unkB < 2)
        {
            gUnknown_083C1580[ewramSS.unkB]();
        }

        gMain.state++;
        break;
    case 18:
        sub_809FAC8(&ewramSS.unk10);
        gMain.state++;
        break;
    case 19:
        gUnknown_083C1598[ewramSS.unkB](&ewramSS.unk10);
        gMain.state++;
        break;
    case 20:
        if (GetMonData(&ewramSS.unk10, MON_DATA_IS_EGG))
        {
            gUnknown_030041B0 = 256;
        }
        else
        {
            gUnknown_030041B0 = 0;
        }

        gMain.state++;
        break;
    case 21:
        sub_809EBC4();
        if (ewramSS.unk79 != 0)
        {
            sub_80A1488(0, 0);
            sub_80A1654(0, 0);
        }
        else
        {
            sub_80A1488(10, 0);
            sub_80A1654(10, 0);
        }

        PrintSummaryWindowHeaderText();
        gMain.state++;
        break;
    case 22:
        if (sub_8055870() != TRUE)
        {
            gMain.state++;
        }
        break;
    default:
        SetVBlankCallback(sub_809D85C);
        BeginHardwarePaletteFade(0xFF, 0, 16, 0, 1);
        SetMainCallback2(sub_809D844);
        gPaletteFade.bufferTransferDisabled = 0;
        return TRUE;
        break;
    }

    return FALSE;
}

void sub_809DE44(void)
{
    while (sub_809DA84() != TRUE && sub_80F9344() != TRUE);
}

void sub_809DE64(void)
{
    REG_BG0CNT = 0x1E08;
    REG_BG1CNT = 0x4801;
    REG_BG2CNT = 0x4A02;
    REG_BG3CNT = 0x5C03;

    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 0;
    gUnknown_030041B8 = 0;

    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;

    REG_BLDCNT = 0;
    REG_DISPCNT = 0x1F40;
}

bool8 LoadPokemonSummaryScreenGraphics(void)
{
    switch (ewramSS.unk74)
    {
    case 0:
        LZDecompressVram(gStatusScreen_Gfx, (void *)VRAM + 0);
        break;
    case 1:
        CpuSet(gUnknown_08E73508, (void *)VRAM + 0xE000, 0x400);
        break;
    case 2:
        LZDecompressVram(gUnknown_08E74E88, (void *)VRAM + 0xE800);
        break;
    case 3:
        LZDecompressVram(gStatusScreen_Tilemap, (void *)VRAM + 0x4800);
        break;
    case 4:
        CpuSet(gUnknown_08E73E88, (void *)VRAM + 0x5800, 0x400);
        break;
    case 5:
        CpuSet(gUnknown_08E74688, (void *)VRAM + 0x6800, 0x400);
        break;
    case 6:
        LoadCompressedPalette(gStatusScreen_Pal, 0, 160);
        break;
    case 7:
        LoadCompressedObjectPic(&gUnknown_083C11B8);
        break;
    case 8:
        LoadCompressedObjectPic(&gUnknown_083C1270);
        break;
    case 9:
        LoadCompressedObjectPic(&gUnknown_083C12F4);
        break;
    case 10:
        LoadCompressedObjectPalette(&gUnknown_083C12FC);
        break;
    case 11:
        LoadCompressedObjectPalette(&gUnknown_083C1278);
        break;
    case 12:
        LoadCompressedPalette(gMoveTypes_Pal, 464, 96);
        ewramSS.unk74 = 0;
        return TRUE;
    }

    ewramSS.unk74++;
    return FALSE;
}

void sub_809E044(void)
{
    LoadPalette(&gUnknownPalette_81E6692[28], 129, 2);
    LoadPalette(&gUnknownPalette_81E6692[30], 136, 2);
    LoadPalette(&gUnknownPalette_81E6692[28], 143, 2);
    LoadPalette(&gUnknownPalette_81E6692[30], 137, 2);
    LoadPalette(&gUnknownPalette_81E6692[12], 209, 4);
    LoadPalette(&gUnknownPalette_81E6692[20], 211, 4);
    LoadPalette(&gUnknownPalette_81E6692[28], 213, 4);
    LoadPalette(&gUnknownPalette_81E6692[12], 215, 4);
    LoadPalette(&gUnknownPalette_81E6692[8],  217, 4);
    LoadPalette(&gUnknownPalette_81E6692[16], 219, 4);
    LoadPalette(&gUnknownPalette_81E6692[4],  221, 2);
    LoadPalette(&gUnknownPalette_81E6692[6], 222, 2);
    LoadPalette(&gUnknownPalette_81E6692[2],  223, 2);
    LoadPalette(gFontDefaultPalette,          240, 32);
    LoadPalette(&gUnknownPalette_81E6692[6], 249, 2);
}

void SummaryScreenExit(u8 taskId)
{
    PlaySE(5);
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    gTasks[taskId].func = sub_809E13C;
}

void sub_809E13C(u8 taskId)
{
    if (sub_8055870() != TRUE && !gPaletteFade.active)
    {
        gUnknown_020384F0 = ewramSS.unk9;

        ResetSpriteData();
        FreeAllSpritePalettes();
        StopCryAndClearCrySongs();
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
        SetMainCallback2(ewramSS.unk4);
        DestroyTask(taskId);
    }
}

void SummaryScreenHandleKeyInput(u8 taskId)
{
    if (gPaletteFade.active)
        return;

    if (gMain.newKeys & DPAD_UP)
    {
        SummaryScreenHandleUpDownInput(taskId, -1);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        SummaryScreenHandleUpDownInput(taskId, 1);
    }
    else if ((gMain.newKeys & DPAD_LEFT) || sub_80F9284() == 1)
    {
        SummaryScreenHandleLeftRightInput(taskId, -1);
    }
    else if ((gMain.newKeys & DPAD_RIGHT) || sub_80F9284() == 2)
    {
        SummaryScreenHandleLeftRightInput(taskId, 1);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (ewramSS.unkB > 1)
        {
            SummaryScreenHandleAButton(taskId);
        }

        if (ewramSS.unkB == 0)
        {
            SummaryScreenExit(taskId);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        SummaryScreenExit(taskId);
    }
}

void sub_809E260(u8 taskId)
{
    if (gPaletteFade.active)
        return;

    if (gMain.newKeys & DPAD_UP)
    {
        gTasks[taskId].data[0] = 4;
        sub_809E8F0(taskId, -1, &ewramSS.unk79);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        gTasks[taskId].data[0] = 4;
        sub_809E8F0(taskId, 1, &ewramSS.unk79);
    }
    else if ((gMain.newKeys & DPAD_LEFT) || sub_80F9284() == 1)
    {
        if (ewramSS.unkB == 3 && (ewramSS.unk79 != 4 || ewramSS.unk7C != 0))
        {
            MenuZeroFillWindowRect(0, 14, 9, 18);
        }

        SummaryScreenHandleLeftRightInput(taskId, -1);
    }
    else if ((gMain.newKeys & DPAD_RIGHT) || sub_80F9284() == 2)
    {
        if (ewramSS.unkB != ewramSS.unk76)
        {
            if (ewramSS.unkB == 2 && (ewramSS.unk79 != 4 || ewramSS.unk7C != 0))
            {
                MenuZeroFillWindowRect(0, 14, 9, 18);
            }

            SummaryScreenHandleLeftRightInput(taskId, 1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (sub_809F7D0(taskId) == 1 || ewramSS.unk79 == 4)
        {
            ewramSS.unk7A = ewramSS.unk79;
            gSpecialVar_0x8005 = ewramSS.unk7A;
            SummaryScreenExit(taskId);
        }
        else
        {
            PlaySE(32);
            sub_809F9D0(taskId, ewramSS.unk79);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        ewramSS.unk7A = 4;
        gSpecialVar_0x8005 = 4;
        SummaryScreenExit(taskId);
    }
}

void sub_809E3FC(u8 taskId)
{
    if (gPaletteFade.active)
        return;

    if (gMain.newKeys & DPAD_UP)
    {
        gTasks[taskId].data[0] = 4;
        sub_809E8F0(taskId, -1, &ewramSS.unk79);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        gTasks[taskId].data[0] = 4;
        sub_809E8F0(taskId, 1, &ewramSS.unk79);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (ewramSS.unk79 != 4 && ewramSS.unk7B == 0)
        {
            if (!MonKnowsMultipleMoves(&ewramSS.unk10))
            {
                PlaySE(32);
            }
            else
            {
                PlaySE(5);

                ewramSS.unk7A = ewramSS.unk79;
                sub_80A1B40(1);
                sub_80A1A30(19);

                gTasks[taskId].func = sub_809E534;
            }
        }
        else
        {
            PlaySE(5);
            sub_809EAC8(taskId);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(5);
        sub_809EAC8(taskId);
    }

}

bool8 MonKnowsMultipleMoves(struct Pokemon *mon)
{
    u8 i;

    for (i = 1; i < 4; i++)
    {
        if (GetMonMove(mon, i))
        {
            return TRUE;
        }
    }

    return FALSE;
}

void sub_809E534(u8 taskId)
{
    if (gMain.newKeys & DPAD_UP)
    {
        gTasks[taskId].data[0] = 3;
        sub_809E8F0(taskId, -1, &ewramSS.unk7A);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        gTasks[taskId].data[0] = 3;
        sub_809E8F0(taskId, 1, &ewramSS.unk7A);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        sub_809E83C(taskId, 1);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        sub_809E83C(taskId, -1);
    }
}

__attribute__((naked))
void sub_809E5C4(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x20\n\
    ldr r1, _0809E6D0 @ =gSharedMem + 0x18000\n\
    ldr r5, [r1]\n\
    ldrb r2, [r1, 0x9]\n\
    movs r0, 0x64\n\
    muls r0, r2\n\
    adds r5, r0\n\
    adds r0, r1, 0\n\
    adds r0, 0x79\n\
    ldrb r0, [r0]\n\
    mov r8, r0\n\
    adds r1, 0x7A\n\
    ldrb r6, [r1]\n\
    adds r0, 0xD\n\
    str r0, [sp, 0x8]\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x8]\n\
    bl GetMonData\n\
    mov r1, sp\n\
    adds r1, 0x2\n\
    str r1, [sp, 0x14]\n\
    strh r0, [r1]\n\
    adds r2, r6, 0\n\
    adds r2, 0xD\n\
    str r2, [sp, 0xC]\n\
    adds r0, r5, 0\n\
    adds r1, r2, 0\n\
    bl GetMonData\n\
    mov r1, sp\n\
    strh r0, [r1]\n\
    mov r3, r8\n\
    adds r3, 0x11\n\
    str r3, [sp, 0x10]\n\
    adds r0, r5, 0\n\
    adds r1, r3, 0\n\
    bl GetMonData\n\
    mov r7, sp\n\
    adds r7, 0x5\n\
    str r7, [sp, 0x18]\n\
    strb r0, [r7]\n\
    adds r0, r6, 0\n\
    adds r0, 0x11\n\
    str r0, [sp, 0x1C]\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x1C]\n\
    bl GetMonData\n\
    add r1, sp, 0x4\n\
    mov r10, r1\n\
    strb r0, [r1]\n\
    adds r0, r5, 0\n\
    movs r1, 0x15\n\
    bl GetMonData\n\
    mov r4, sp\n\
    adds r4, 0x6\n\
    strb r0, [r4]\n\
    ldr r1, _0809E6D4 @ =gUnknown_08208238\n\
    mov r2, r8\n\
    adds r0, r2, r1\n\
    ldrb r0, [r0]\n\
    mov r9, r0\n\
    ldrb r0, [r4]\n\
    adds r2, r0, 0\n\
    mov r3, r9\n\
    ands r2, r3\n\
    mov r7, r8\n\
    lsls r7, 1\n\
    mov r8, r7\n\
    asrs r2, r7\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    adds r1, r6, r1\n\
    ldrb r3, [r1]\n\
    adds r1, r0, 0\n\
    ands r1, r3\n\
    lsls r6, 1\n\
    asrs r1, r6\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    mov r7, r9\n\
    bics r0, r7\n\
    strb r0, [r4]\n\
    ldrb r0, [r4]\n\
    bics r0, r3\n\
    strb r0, [r4]\n\
    lsls r2, r6\n\
    mov r0, r8\n\
    lsls r1, r0\n\
    adds r2, r1\n\
    ldrb r0, [r4]\n\
    orrs r0, r2\n\
    strb r0, [r4]\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x8]\n\
    mov r2, sp\n\
    bl SetMonData\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0xC]\n\
    ldr r2, [sp, 0x14]\n\
    bl SetMonData\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x10]\n\
    mov r2, r10\n\
    bl SetMonData\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x1C]\n\
    ldr r2, [sp, 0x18]\n\
    bl SetMonData\n\
    adds r0, r5, 0\n\
    movs r1, 0x15\n\
    adds r2, r4, 0\n\
    bl SetMonData\n\
    add sp, 0x20\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809E6D0: .4byte gSharedMem + 0x18000\n\
_0809E6D4: .4byte gUnknown_08208238\n\
    .syntax divided\n");
}

__attribute__((naked))
void sub_809E6D8(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x20\n\
    ldr r2, _0809E7E8 @ =gSharedMem + 0x18000\n\
    ldr r5, [r2]\n\
    ldrb r1, [r2, 0x9]\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 4\n\
    adds r5, r0\n\
    adds r0, r2, 0\n\
    adds r0, 0x79\n\
    ldrb r0, [r0]\n\
    mov r8, r0\n\
    adds r2, 0x7A\n\
    ldrb r6, [r2]\n\
    adds r0, 0xD\n\
    str r0, [sp, 0x8]\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x8]\n\
    bl GetBoxMonData\n\
    mov r1, sp\n\
    adds r1, 0x2\n\
    str r1, [sp, 0x14]\n\
    strh r0, [r1]\n\
    adds r2, r6, 0\n\
    adds r2, 0xD\n\
    str r2, [sp, 0xC]\n\
    adds r0, r5, 0\n\
    adds r1, r2, 0\n\
    bl GetBoxMonData\n\
    mov r1, sp\n\
    strh r0, [r1]\n\
    mov r3, r8\n\
    adds r3, 0x11\n\
    str r3, [sp, 0x10]\n\
    adds r0, r5, 0\n\
    adds r1, r3, 0\n\
    bl GetBoxMonData\n\
    mov r7, sp\n\
    adds r7, 0x5\n\
    str r7, [sp, 0x18]\n\
    strb r0, [r7]\n\
    adds r0, r6, 0\n\
    adds r0, 0x11\n\
    str r0, [sp, 0x1C]\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x1C]\n\
    bl GetBoxMonData\n\
    add r1, sp, 0x4\n\
    mov r10, r1\n\
    strb r0, [r1]\n\
    adds r0, r5, 0\n\
    movs r1, 0x15\n\
    bl GetBoxMonData\n\
    mov r4, sp\n\
    adds r4, 0x6\n\
    strb r0, [r4]\n\
    ldr r1, _0809E7EC @ =gUnknown_08208238\n\
    mov r2, r8\n\
    adds r0, r2, r1\n\
    ldrb r0, [r0]\n\
    mov r9, r0\n\
    ldrb r0, [r4]\n\
    adds r2, r0, 0\n\
    mov r3, r9\n\
    ands r2, r3\n\
    mov r7, r8\n\
    lsls r7, 1\n\
    mov r8, r7\n\
    asrs r2, r7\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    adds r1, r6, r1\n\
    ldrb r3, [r1]\n\
    adds r1, r0, 0\n\
    ands r1, r3\n\
    lsls r6, 1\n\
    asrs r1, r6\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    mov r7, r9\n\
    bics r0, r7\n\
    strb r0, [r4]\n\
    ldrb r0, [r4]\n\
    bics r0, r3\n\
    strb r0, [r4]\n\
    lsls r2, r6\n\
    mov r0, r8\n\
    lsls r1, r0\n\
    adds r2, r1\n\
    ldrb r0, [r4]\n\
    orrs r0, r2\n\
    strb r0, [r4]\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x8]\n\
    mov r2, sp\n\
    bl SetBoxMonData\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0xC]\n\
    ldr r2, [sp, 0x14]\n\
    bl SetBoxMonData\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x10]\n\
    mov r2, r10\n\
    bl SetBoxMonData\n\
    adds r0, r5, 0\n\
    ldr r1, [sp, 0x1C]\n\
    ldr r2, [sp, 0x18]\n\
    bl SetBoxMonData\n\
    adds r0, r5, 0\n\
    movs r1, 0x15\n\
    adds r2, r4, 0\n\
    bl SetBoxMonData\n\
    add sp, 0x20\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809E7E8: .4byte gSharedMem + 0x18000\n\
_0809E7EC: .4byte gUnknown_08208238\n\
    .syntax divided\n");
}

void sub_809E7F0(u8 taskId)
{
    if (sub_809F5F8())
    {
        ewramSS.unk74 = 0;
        sub_80A0428(&ewramSS.unk10, &ewramSS.unk79);
        gTasks[taskId].func = sub_809E3FC;
        sub_80A2078(taskId);
    }
}

void sub_809E83C(u8 taskId, s8 b)
{
    PlaySE(5);

    sub_80A1B1C(19);
    sub_80A1B40(0);

    if (b == 1)
    {
        if (ewramSS.unk79 != ewramSS.unk7A)
        {
            if (ewramSS.unkE == 0)
            {
                sub_809E5C4();
            }
            else
            {
                sub_809E6D8();
            }

            ewramSS.unk79 = ewramSS.unk7A;
            sub_809F678(&ewramSS.unk10);
            ewramSS.unk74 = 1;

            gTasks[taskId].func = sub_809E7F0;
            return;
        }
    }
    else
    {
        sub_80A0428(&ewramSS.unk10, &ewramSS.unk79);
    }

    gTasks[taskId].func = sub_809E3FC;
    sub_80A2078(taskId);
}

__attribute__((naked))
void sub_809E8F0(u8 taskId, s8 direction, u8 *c)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x8\n\
    adds r4, r1, 0\n\
    mov r9, r2\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    movs r0, 0x1\n\
    str r0, [sp]\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    mov r1, r9\n\
    ldrb r6, [r1]\n\
    ldr r1, _0809E944 @ =gTasks\n\
    mov r2, r8\n\
    lsls r0, r2, 2\n\
    add r0, r8\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldrb r0, [r0, 0x8]\n\
    movs r2, 0\n\
    lsls r4, 24\n\
    asrs r4, 24\n\
    mov r10, r4\n\
    lsls r7, r0, 24\n\
_0809E930:\n\
    lsls r0, r6, 24\n\
    asrs r0, 24\n\
    add r0, r10\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    asrs r1, r0, 24\n\
    cmp r0, r7\n\
    ble _0809E948\n\
    movs r6, 0\n\
    b _0809E94E\n\
    .align 2, 0\n\
_0809E944: .4byte gTasks\n\
_0809E948:\n\
    cmp r1, 0\n\
    bge _0809E94E\n\
    lsrs r6, r7, 24\n\
_0809E94E:\n\
    lsls r4, r6, 24\n\
    lsrs r1, r4, 24\n\
    ldr r0, _0809EA10 @ =gSharedMem + 0x18010\n\
    str r2, [sp, 0x4]\n\
    bl GetMonMove\n\
    lsls r0, 16\n\
    adds r5, r4, 0\n\
    ldr r2, [sp, 0x4]\n\
    cmp r0, 0\n\
    bne _0809E97A\n\
    asrs r0, r5, 24\n\
    cmp r0, 0x4\n\
    beq _0809E97A\n\
    lsls r0, r2, 24\n\
    movs r3, 0x80\n\
    lsls r3, 17\n\
    adds r0, r3\n\
    lsrs r2, r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x3\n\
    ble _0809E930\n\
_0809E97A:\n\
    mov r1, r9\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x4\n\
    bne _0809E996\n\
    asrs r0, r5, 24\n\
    cmp r0, 0x4\n\
    beq _0809E996\n\
    ldr r0, _0809EA14 @ =gSharedMem + 0x18000\n\
    adds r0, 0x7C\n\
    ldrh r0, [r0]\n\
    mov r2, r8\n\
    lsls r7, r2, 2\n\
    cmp r0, 0\n\
    beq _0809E9AC\n\
_0809E996:\n\
    ldr r2, _0809EA18 @ =gTasks\n\
    mov r3, r8\n\
    lsls r1, r3, 2\n\
    adds r0, r1, r3\n\
    lsls r0, 3\n\
    adds r0, r2\n\
    movs r2, 0x22\n\
    ldrsh r0, [r0, r2]\n\
    adds r7, r1, 0\n\
    cmp r0, 0x1\n\
    bne _0809E9D0\n\
_0809E9AC:\n\
    lsrs r4, r5, 24\n\
    movs r0, 0x2\n\
    adds r1, r4, 0\n\
    bl sub_80A1488\n\
    movs r0, 0x2\n\
    adds r1, r4, 0\n\
    bl sub_80A1654\n\
    ldr r1, _0809EA18 @ =gTasks\n\
    mov r3, r8\n\
    adds r0, r7, r3\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    movs r1, 0\n\
    strh r1, [r0, 0x22]\n\
    movs r0, 0\n\
    str r0, [sp]\n\
_0809E9D0:\n\
    mov r1, r9\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x4\n\
    beq _0809E9FE\n\
    asrs r0, r5, 24\n\
    cmp r0, 0x4\n\
    bne _0809E9FE\n\
    ldr r0, _0809EA14 @ =gSharedMem + 0x18000\n\
    adds r0, 0x7C\n\
    ldrh r0, [r0]\n\
    cmp r0, 0\n\
    bne _0809E9FE\n\
    movs r4, 0x2\n\
    negs r4, r4\n\
    lsrs r5, 24\n\
    adds r0, r4, 0\n\
    adds r1, r5, 0\n\
    bl sub_80A1488\n\
    adds r0, r4, 0\n\
    adds r1, r5, 0\n\
    bl sub_80A1654\n\
_0809E9FE:\n\
    mov r2, r9\n\
    strb r6, [r2]\n\
    ldr r0, _0809EA1C @ =gSharedMem + 0x18079\n\
    cmp r9, r0\n\
    bne _0809EA20\n\
    movs r0, 0\n\
    bl sub_80A1C30\n\
    b _0809EA26\n\
    .align 2, 0\n\
_0809EA10: .4byte gSharedMem + 0x18010\n\
_0809EA14: .4byte gSharedMem + 0x18000\n\
_0809EA18: .4byte gTasks\n\
_0809EA1C: .4byte gSharedMem + 0x18079\n\
_0809EA20:\n\
    movs r0, 0x1\n\
    bl sub_80A1C30\n\
_0809EA26:\n\
    ldr r3, [sp]\n\
    cmp r3, 0\n\
    beq _0809EA34\n\
    ldr r0, _0809EA4C @ =gSharedMem + 0x18010\n\
    mov r1, r9\n\
    bl sub_80A0428\n\
_0809EA34:\n\
    mov r0, r8\n\
    bl sub_80A2078\n\
    add sp, 0x8\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809EA4C: .4byte gSharedMem + 0x18010\n\
    .syntax divided\n");
}

void SummaryScreenHandleAButton(u8 taskId)
{
    PlaySE(5);

    ewramSS.unk79 = 0;
    sub_80A1488(2, 0);
    sub_80A1654(2, 0);

    if (ewramSS.unk7B == 0)
    {
        ewramSS.unk7F = 5;
        PrintSummaryWindowHeaderText();
    }

    sub_80A16CC(0);
    sub_80A029C(&ewramSS.unk10);
    sub_80A1A30(9);

    gTasks[taskId].func = sub_809E3FC;
    sub_80A2078(taskId);
}

void sub_809EAC8(u8 taskId)
{
    if (ewramSS.unk79 != 4)
    {
        sub_80A1488(-2, 0);
        sub_80A1654(-2, 0);
    }

    sub_80A1B1C(9);
    sub_80A16CC(1);

    MenuZeroFillWindowRect(15, 12, 28, 13);
    MenuZeroFillWindowRect(11, 15, 28, 18);

    ewramSS.unk7F = 6;
    PrintSummaryWindowHeaderText();

    gTasks[taskId].func = SummaryScreenHandleKeyInput;
}

void sub_809EB40(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 5:
        sub_80A1A30(9);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_809E260;
        break;
    case 0:
        ewramSS.unk79 = 0;
        if (ewramSS.unk7C != 0)
        {
            sub_80A1488(10, 0);
            sub_80A1654(10, ewramSS.unk79);
        }

        sub_80A16CC(0);
        sub_80A029C(&ewramSS.unk10);
        // fall through
    default:
        gTasks[taskId].data[0]++;
        break;
    }
}

void sub_809EBC4(void)
{
    if (ewramSS.unkB != 0)
    {
        DrawSummaryScreenNavigationDots();
        gUnknown_030042C0 = 0x100;

        if (ewramSS.unkB == 1)
            REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0x800;

        if (ewramSS.unkB == 2)
            REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0xA00;

        if (ewramSS.unkB == 3)
            REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0xC00;
    }
}

void sub_809EC38(u8 taskId)
{
    u8 minus2;
    s16 *taskData = gTasks[taskId].data;

    switch (taskData[0])
    {
    case 0:
        if (ewramSS.unk80 == 0)
        {
            if (ewramSS.unkB != 0)
            {
                gUnknown_03004288 = 0x100;
            }

            if (ewramSS.unkB == 1)
            {
                REG_BG2CNT = (REG_BG2CNT & 0xE0FF) + 0x800;
            }

            if (ewramSS.unkB == 2)
            {
                REG_BG2CNT = (REG_BG2CNT & 0xE0FF) + 0xA00;
            }
        }
        else
        {
            if (ewramSS.unkB != 0)
            {
                gUnknown_030042C0 = 0x100;
            }

            if (ewramSS.unkB == 1)
            {
                REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0x800;
            }

            if (ewramSS.unkB == 2)
            {
                REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0xA00;
            }
        }

        taskData[0]++;
        break;
    case 1:
        if (ewramSS.unk80 == 0)
        {
            int var2 = gUnknown_030042C0 - 0x20;
            gUnknown_030042C0 = var2;
            if (var2 << 16 == 0)
            {
                REG_BG1CNT = (REG_BG1CNT & 0xFFFC) + 2;
                REG_BG2CNT = (REG_BG2CNT & 0xFFFC) + 1;
                taskData[0]++;
            }
        }
        else
        {
            int var2 = gUnknown_03004288 - 0x20;
            gUnknown_03004288 = var2;
            if (var2 << 16 == 0)
            {
                REG_BG1CNT = (REG_BG1CNT & 0xFFFC) + 1;
                REG_BG2CNT = (REG_BG2CNT & 0xFFFC) + 2;
                taskData[0]++;
            }
        }
        break;
    case 2:
        ewramSS.unk7E = ewramSS.unkB + 1;
        minus2 = ewramSS.unk8 - 2;
        if (minus2 < 2)
        {
            ewramSS.unk7F = 0;
            sub_80A029C(&ewramSS.unk10);
            sub_80A0428(&ewramSS.unk10, &ewramSS.unk79);
            sub_80A00F4(ewramSS.unk79);
        }
        else
        {
            if (ewramSS.unkB > 1 && (ewramSS.unk7B == 0 || ewramSS.unk8 == 4))
            {
                ewramSS.unk7F = 6;
            }
            else if (ewramSS.unkB == 0)
            {
                ewramSS.unk7F = 7;
            }
            else
            {
                ewramSS.unk7F = 0;
            }
        }

        taskData[0]++;
        break;
    case 3:
        DrawSummaryScreenNavigationDots();
        PrintSummaryWindowHeaderText();
        taskData[0]++;
        break;
    case 4:
        gUnknown_083C1598[ewramSS.unkB](&ewramSS.unk10);
        ewramSS.unk80 ^= 1;
        taskData[0]++;
        break;
    case 5:
        if (sub_8055870() != TRUE)
        {
            gTasks[taskId].func = gUnknown_03005CF0;
        }
        break;
    }
}

void sub_809EE74(u8 taskId)
{
    int var1;
    u8 minus2;
    s16 *taskData = gTasks[taskId].data;

    switch (taskData[0])
    {
    case 0:
        var1 = ewramSS.unk80;
        if (var1 == 0)
        {
            gUnknown_03004288 = ewramSS.unk80;
            taskData[0]++;
        }
        else
        {
            gUnknown_030042C0 = 0;
            taskData[0]++;
        }
        break;
    case 1:
        if (ewramSS.unk80 == 0)
        {
            if (ewramSS.unkB == 1)
                REG_BG2CNT = (REG_BG2CNT & 0xE0FC) + 0x801;

            if (ewramSS.unkB == 2)
                REG_BG2CNT = (REG_BG2CNT & 0xE0FC) + 0xA01;

            if (ewramSS.unkB == 3)
                REG_BG2CNT = (REG_BG2CNT & 0xE0FC) + 0xC01;

            REG_BG1CNT = (REG_BG1CNT & 0xFFFC) + 2;
        }
        else
        {
            if (ewramSS.unkB == 1)
                REG_BG1CNT = (REG_BG1CNT & 0xE0FC) + 0x801;

            if (ewramSS.unkB == 2)
                REG_BG1CNT = (REG_BG1CNT & 0xE0FC) + 0xA01;

            if (ewramSS.unkB == 3)
                REG_BG1CNT = (REG_BG1CNT & 0xE0FC) + 0xC01;

            REG_BG2CNT = (REG_BG2CNT & 0xFFFC) + 2;
        }

        taskData[0]++;
        break;
    case 2:
        if (ewramSS.unk80 == 0)
        {
            int var2 = gUnknown_03004288 + 0x20;
            gUnknown_03004288 = var2;
            if ((var2 << 16) == 0x1000000)
            {
                taskData[0]++;
            }
        }
        else
        {
            int var2 = gUnknown_030042C0 + 0x20;
            gUnknown_030042C0 = var2;
            if ((var2 << 16) == 0x1000000)
            {
                taskData[0]++;
            }
        }
        break;
    case 3:
        ewramSS.unk7E = ewramSS.unkB + 1;
        minus2 = ewramSS.unk8 - 2;
        if (minus2 < 2)
        {
            ewramSS.unk7F = 0;
            sub_80A029C(&ewramSS.unk10);
            sub_80A0428(&ewramSS.unk10, &ewramSS.unk79);
            sub_80A00F4(ewramSS.unk79);
        }
        else
        {
            if (ewramSS.unkB > 1 && (ewramSS.unk7B == 0 || ewramSS.unk8 == 4))
            {
                ewramSS.unk7F = 6;
            }
            else if (ewramSS.unkB == 0)
            {
                ewramSS.unk7F = 7;
            }
            else
            {
                ewramSS.unk7F = 0;
            }
        }

        taskData[0]++;
        break;
    case 4:
        DrawSummaryScreenNavigationDots();
        PrintSummaryWindowHeaderText();
        taskData[0]++;
        break;
    case 5:
        gUnknown_083C1598[ewramSS.unkB](&ewramSS.unk10);
        ewramSS.unk80 ^= 1;
        taskData[0]++;
        break;
    case 6:
        if (sub_8055870() != TRUE)
        {
            gTasks[taskId].func = gUnknown_03005CF0;
        }
        break;
    }
}

void sub_809F0D0(u8 taskId, s8 direction)
{
    ewramSS.unkB += direction;
    gUnknown_03005CF0 = gTasks[taskId].func;
    sub_809FBE4();
    gTasks[taskId].data[0] = 0;

    if (direction == -1)
    {
        gTasks[taskId].func = sub_809EC38;
    }
    else
    {
        gTasks[taskId].func = sub_809EE74;
        gTasks[taskId].func(taskId);
    }
}

void SummaryScreenHandleLeftRightInput(u8 taskId, s8 direction)
{
    if (!GetMonData(&ewramSS.unk10, MON_DATA_IS_EGG))
    {
        if (direction == -1 && ewramSS.unkB == ewramSS.unk75) return;
        if (direction ==  1 && ewramSS.unkB == ewramSS.unk76) return;

        if (FindTaskIdByFunc(sub_80A1334) == 0xFF && FindTaskIdByFunc(sub_80A1500) == 0xFF)
        {
            PlaySE(5);
            sub_809F0D0(taskId, direction);
        }
    }
}

#ifdef NONMATCHING
void SummaryScreenHandleUpDownInput(u8 taskId, s8 direction)
{
    s8 var3;
    u8 var1 = direction;

    if (ewramSS.unkE == 1)
    {
        if (ewramSS.unkB != 0)
        {
            var1 = (direction == 1) ? 0 : 1;
        }
        else
        {
            var1 = (direction == 1) ? 2 : 3;
        }

        var3 = StorageSystemGetNextMonIndex(ewramSS.unk0.boxMons, ewramSS.unk9, ewramSS.unkA, var1);
    }
    else
    {
        if (sub_80F9344() == TRUE && IsLinkDoubleBattle() == TRUE)
        {
            var3 = sub_809F3CC(var1);
        }
        else
        {
            var3 = sub_809F284(var1);
        }
    }

    if (var3 != -1)
    {
        PlaySE(5);
        if (GetMonStatusAndPokerus(&ewramSS.unk10))
        {
            sub_80A12D0(-2);
        }

        ewramSS.unk9 = var3;
        ewramSS.unk84 = gTasks[taskId].func;
        gTasks[taskId].func = sub_809F43C;
    }
}
#else
__attribute__((naked))
void SummaryScreenHandleUpDownInput(u8 taskId, s8 direction)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    lsls r1, 24\n\
    lsrs r4, r1, 24\n\
    ldr r0, _0809F1E4 @ =gSharedMem + 0x18000\n\
    ldrb r1, [r0, 0xE]\n\
    adds r2, r0, 0\n\
    cmp r1, 0x1\n\
    bne _0809F202\n\
    ldrb r0, [r2, 0xB]\n\
    cmp r0, 0\n\
    beq _0809F1E8\n\
    lsls r1, r4, 24\n\
    asrs r1, 24\n\
    movs r4, 0x1\n\
    eors r1, r4\n\
    negs r0, r1\n\
    orrs r0, r1\n\
    lsrs r4, r0, 31\n\
    b _0809F1F4\n\
    .align 2, 0\n\
_0809F1E4: .4byte gSharedMem + 0x18000\n\
_0809F1E8:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    movs r4, 0x3\n\
    cmp r0, 0x1\n\
    bne _0809F1F4\n\
    movs r4, 0x2\n\
_0809F1F4:\n\
    ldr r0, [r2]\n\
    ldrb r1, [r2, 0x9]\n\
    ldrb r2, [r2, 0xA]\n\
    adds r3, r4, 0\n\
    bl StorageSystemGetNextMonIndex\n\
    b _0809F22C\n\
_0809F202:\n\
    bl sub_80F9344\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _0809F224\n\
    bl IsLinkDoubleBattle\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _0809F224\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    bl sub_809F3CC\n\
    b _0809F22C\n\
_0809F224:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    bl sub_809F284\n\
_0809F22C:\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    movs r1, 0x1\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    beq _0809F270\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    ldr r5, _0809F278 @ =gSharedMem + 0x18010\n\
    adds r0, r5, 0\n\
    bl GetMonStatusAndPokerus\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0809F258\n\
    movs r0, 0x2\n\
    negs r0, r0\n\
    bl sub_80A12D0\n\
_0809F258:\n\
    adds r0, r5, 0\n\
    subs r0, 0x10\n\
    strb r4, [r0, 0x9]\n\
    ldr r1, _0809F27C @ =gTasks\n\
    lsls r0, r6, 2\n\
    adds r0, r6\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    str r1, [r5, 0x74]\n\
    ldr r1, _0809F280 @ =sub_809F43C\n\
    str r1, [r0]\n\
_0809F270:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809F278: .4byte gSharedMem + 0x18010\n\
_0809F27C: .4byte gTasks\n\
_0809F280: .4byte sub_809F43C\n\
    .syntax divided\n");
}
#endif // NONMATCHING

// s8 sub_809F284(s8 a)
// {
//     struct Pokemon *mons = ewramSS.unk0.partyMons;
//     u8 var1 = 0;

//     if (ewramSS.unkB == 0)
//     {
//         if ((s8)a == -1 || ewramSS.unk9 != 0)
//         {
//             if ((s8)a == 1 || ewramSS.unk9 < ewramSS.unkA)
//             {
//                 return ewramSS.unk9 + a;
//             }
//         }

//         return -1;
//     }
//     else
//     {
//         while (1)
//         {
//             var1 += a;

//             if (ewramSS.unk9 + var1 >= 0 || ewramSS.unk9 + var1 > ewramSS.unkA)
//             {
//                 return -1;
//             }

//             if (!GetMonData(&mons[ewramSS.unk9 + var1], MON_DATA_IS_EGG))
//             {
//                 break;
//             }
//         }

//         return ewramSS.unk9 + var1;
//     }

// }
__attribute__((naked))
s8 sub_809F284(s8 a)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    ldr r0, _0809F2C0 @ =gSharedMem + 0x18000\n\
    ldr r7, [r0]\n\
    movs r6, 0\n\
    ldrb r1, [r0, 0xB]\n\
    adds r4, r0, 0\n\
    cmp r1, 0\n\
    bne _0809F2C4\n\
    lsls r0, r3, 24\n\
    asrs r2, r0, 24\n\
    movs r1, 0x1\n\
    negs r1, r1\n\
    adds r5, r0, 0\n\
    cmp r2, r1\n\
    bne _0809F2AC\n\
    ldrb r0, [r4, 0x9]\n\
    cmp r0, 0\n\
    beq _0809F2E4\n\
_0809F2AC:\n\
    asrs r0, r5, 24\n\
    cmp r0, 0x1\n\
    bne _0809F2BA\n\
    ldrb r0, [r4, 0x9]\n\
    ldrb r1, [r4, 0xA]\n\
    cmp r0, r1\n\
    bcs _0809F2E4\n\
_0809F2BA:\n\
    ldrb r0, [r4, 0x9]\n\
    adds r0, r3\n\
    b _0809F304\n\
    .align 2, 0\n\
_0809F2C0: .4byte gSharedMem + 0x18000\n\
_0809F2C4:\n\
    lsls r5, r3, 24\n\
_0809F2C6:\n\
    lsls r0, r6, 24\n\
    asrs r0, 24\n\
    asrs r1, r5, 24\n\
    adds r0, r1\n\
    lsls r0, 24\n\
    ldr r4, _0809F2EC @ =gSharedMem + 0x18000\n\
    lsrs r6, r0, 24\n\
    asrs r0, 24\n\
    ldrb r2, [r4, 0x9]\n\
    adds r1, r0, r2\n\
    cmp r1, 0\n\
    blt _0809F2E4\n\
    ldrb r0, [r4, 0xA]\n\
    cmp r1, r0\n\
    ble _0809F2F0\n\
_0809F2E4:\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    b _0809F308\n\
    .align 2, 0\n\
_0809F2EC: .4byte gSharedMem + 0x18000\n\
_0809F2F0:\n\
    movs r0, 0x64\n\
    muls r0, r1\n\
    adds r0, r7, r0\n\
    movs r1, 0x2D\n\
    bl GetMonData\n\
    cmp r0, 0\n\
    bne _0809F2C6\n\
    ldrb r0, [r4, 0x9]\n\
    adds r0, r6\n\
_0809F304:\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
_0809F308:\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}

bool8 sub_809F310(struct Pokemon *mon)
{
    if (GetMonData(mon, MON_DATA_SPECIES))
    {
        if (ewramSS.unkB != 0 || !GetMonData(mon, MON_DATA_IS_EGG))
        {
            return TRUE;
        }
    }

    return FALSE;
}

s8 sub_809F344(u8 partyIndex)
{
    while (1)
    {
        partyIndex++;    
        if (partyIndex == PARTY_SIZE)
        {
            return -1;
        }

        if (sub_809F310(&gPlayerParty[gUnknown_083C15A8[partyIndex]]) == TRUE)
        {
            return gUnknown_083C15A8[partyIndex];
        }
    }
}

s8 sub_809F388(u8 partyIndex)
{
    while (1)
    {
        if (partyIndex == 0)
        {
            return -1;
        }

        partyIndex--;    
        if (sub_809F310(&gPlayerParty[gUnknown_083C15A8[partyIndex]]) == TRUE)
        {
            return gUnknown_083C15A8[partyIndex];
        }
    }
}

#ifdef NONMATCHING // The nested if statements at the end are not matching.
s8 sub_809F3CC(s8 a)
{
    u8 var1 = 0;
    u8 i = 0;

    for (i = 0; i < 6; i++)
    {
        if (gUnknown_083C15A8[i] == ewramSS.unk9)
        {
            var1 = i;
            break;
        }
    }

    if ((s8)a != -1 || var1 != 0)
    {
        if ((s8)a != 1)
        {
            return sub_809F388(var1);
        }
        else if (var1 != 5)
        {
            return sub_809F344(var1);
        }
    }

    return -1;
}
#else
__attribute__((naked))
s8 sub_809F3CC(s8 a)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    lsls r0, 24\n\
    lsrs r6, r0, 24\n\
    movs r2, 0\n\
    movs r1, 0\n\
    ldr r3, _0809F41C @ =gUnknown_083C15A8\n\
    ldr r4, _0809F420 @ =gSharedMem + 0x18000\n\
    ldrb r0, [r3]\n\
    ldrb r5, [r4, 0x9]\n\
    cmp r0, r5\n\
    beq _0809F3FC\n\
    adds r5, r3, 0\n\
    adds r3, r4, 0\n\
_0809F3E6:\n\
    adds r0, r1, 0x1\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    cmp r1, 0x5\n\
    bhi _0809F3FC\n\
    adds r0, r1, r5\n\
    ldrb r0, [r0]\n\
    ldrb r4, [r3, 0x9]\n\
    cmp r0, r4\n\
    bne _0809F3E6\n\
    adds r2, r1, 0\n\
_0809F3FC:\n\
    lsls r0, r6, 24\n\
    asrs r1, r0, 24\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    cmp r1, r0\n\
    bne _0809F40C\n\
    cmp r2, 0\n\
    beq _0809F414\n\
_0809F40C:\n\
    cmp r1, 0x1\n\
    bne _0809F424\n\
    cmp r2, 0x5\n\
    bne _0809F42C\n\
_0809F414:\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    b _0809F436\n\
    .align 2, 0\n\
_0809F41C: .4byte gUnknown_083C15A8\n\
_0809F420: .4byte gSharedMem + 0x18000\n\
_0809F424:\n\
    adds r0, r2, 0\n\
    bl sub_809F388\n\
    b _0809F432\n\
_0809F42C:\n\
    adds r0, r2, 0\n\
    bl sub_809F344\n\
_0809F432:\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
_0809F436:\n\
    pop {r4-r6}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_809F43C(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
        StopCryAndClearCrySongs();
        gMain.state++;
        break;
    case 1:
        DestroySpriteAndFreeResources(&gSprites[ewramSS.unkC]);
        gMain.state++;
        break;
    case 2:
        DestroySpriteAndFreeResources(&gSprites[ewramSS.unkD]);
        gMain.state++;
        break;
    case 3:
        ewramSS.unk74 = 0;
        ewramSS.unk79 = 0;
        gMain.state++;
        break;
    case 4:
        sub_809F678(&ewramSS.unk10);
        if (GetMonStatusAndPokerus(&ewramSS.unk10))
        {
            sub_80A12D0(2);
        }

        DrawPokerusSurvivorDot(&ewramSS.unk10);
        gMain.state++;
        break;
    case 5:
        if ((ewramSS.unkC = sub_809F6B4(&ewramSS.unk10, &ewramSS.unk74)) != 0xFF)
        {
            ewramSS.unk74 = 0;
            if (GetMonData(&ewramSS.unk10, MON_DATA_IS_EGG))
            {
                gUnknown_030041B0 = 256;
            }
            else
            {
                gUnknown_030041B0 = 0;
            }

            gMain.state++;
        }
        break;
    case 6:
        sub_80A1DCC(&ewramSS.unk10);
        gMain.state++;
        break;
    case 7:
        sub_80A1DE8(&ewramSS.unk10);
        gMain.state++;
        break;
    case 8:
        if (sub_809F5F8())
        {
            ewramSS.unk74 = 0;
            gMain.state++;
        }
        break;
    default:
        if (sub_8055870() != TRUE)
        {
            gMain.state = 0;
            gTasks[taskId].func = ewramSS.unk84;
        }
        break;
    }
}

bool8 sub_809F5F8(void)
{
    if (ewramSS.unk74 == 0)
    {
        sub_809FAC8(&ewramSS.unk10);
        ewramSS.unk74++;
        return FALSE;
    }
    else
    {
        gUnknown_083C1588[ewramSS.unkB](&ewramSS.unk10);
        return TRUE;
    }
}

void sub_809F63C(struct Pokemon *mon)
{
    sub_809FE80();
    sub_809FC34(mon);
}

void sub_809F650(struct Pokemon *mon)
{
    sub_80A00A4();
    sub_809FF64(mon);
}

void sub_809F664(struct Pokemon *mon)
{
    sub_80A0390();
    sub_80A015C(mon);
}

void sub_809F678(struct Pokemon *mon)
{
    if (ewramSS.unkE == 0)
    {
        struct Pokemon *mons = ewramSS.unk0.partyMons;
        *mon = mons[ewramSS.unk9];
    }
    else
    {
        struct BoxPokemon *mons = ewramSS.unk0.boxMons;
        sub_803B4B4(&mons[ewramSS.unk9], mon);
    }
}

u8 sub_809F6B4(struct Pokemon *mon, u8 *b)
{
    u16 species;
    u32 personality;
    u32 otId;
    const struct CompressedSpritePalette *palette;

    switch (*b)
    {
    default:
        return sub_80A1808(mon);
    case 0:
        species = GetMonData(mon, MON_DATA_SPECIES2);
        personality = GetMonData(mon, MON_DATA_PERSONALITY);

        HandleLoadSpecialPokePic(
            &gMonFrontPicTable[species],
            gMonFrontPicCoords[species].coords,
            gMonFrontPicCoords[species].y_offset,
            ewram_addr,
            gUnknown_081FAF4C[1],
            species,
            personality);
        *b += 1;
        return 0xFF;
    case 1:
        species = GetMonData(mon, MON_DATA_SPECIES2);
        personality = GetMonData(mon, MON_DATA_PERSONALITY);
        otId = GetMonData(mon, MON_DATA_OT_ID);

        palette = GetMonSpritePalStructFromOtIdPersonality(species, otId, personality);
        LoadCompressedObjectPalette(palette);
        GetMonSpriteTemplate_803C56C(palette->tag, 1);
        *b += 1;
        return 0xFF;
    }
}

u16 GetMonMove(struct Pokemon *mon, u8 moveId)
{
    switch (moveId)
    {
    case 0:
        return GetMonData(mon, MON_DATA_MOVE1);
    case 1:
        return GetMonData(mon, MON_DATA_MOVE2);
    case 2:
        return GetMonData(mon, MON_DATA_MOVE3);
    default:
        return GetMonData(mon, MON_DATA_MOVE4);
    }
}

static u16 GetMonMovePP(struct Pokemon *mon, u8 moveId)
{
    switch (moveId)
    {
    case 0:
        return GetMonData(mon, MON_DATA_PP1);
    case 1:
        return GetMonData(mon, MON_DATA_PP2);
    case 2:
        return GetMonData(mon, MON_DATA_PP3);
    default:
        return GetMonData(mon, MON_DATA_PP4);
    }
}

bool8 sub_809F7D0(u8 taskId)
{
    struct Pokemon mon;
    u16 move;

    sub_809F678(&mon);
    move = GetMonMove(&mon, ewramSS.unk79);    
    if (IsHMMove(move) == TRUE && ewramSS.unk8 != 3)
    {
        return FALSE;
    }

    return TRUE;
}

#ifdef NONMATCHING // The two "ewramSS.unk79 = taskData[15];" lines have small register differences.
void sub_809F814(u8 taskId)
{
    u16 var1;

    s16 *taskData = gTasks[taskId].data;

    var1 = taskData[14];
    if (taskData[14] < 4)
    {
        taskData[14] = var1 + 1;
    }
    else if (gMain.newKeys & DPAD_UP)
    {
        gTasks[taskId].func = sub_809E260;
        taskData[0] = 4;
        taskData[13] = 1;
        ewramSS.unk79 = taskData[15];
        sub_809E8F0(taskId, -1, NULL);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        gTasks[taskId].func = sub_809E260;
        taskData[0] = 4;
        taskData[13] = 1;
        ewramSS.unk79 = taskData[15];
        sub_809E8F0(taskId, 1, NULL);
    }
    else if ((gMain.newKeys & DPAD_LEFT) || sub_80F9284() == 1)
    {
        if (ewramSS.unkB != 2)
        {
            if (ewramSS.unkB == 3 && (ewramSS.unk79 != 4 || ewramSS.unk7C != 0))
            {
                MenuZeroFillWindowRect(0, 14, 9, 18);
            }

            gTasks[taskId].func = sub_809E260;

            SummaryScreenHandleLeftRightInput(taskId, -1);
            sub_80A1488(1, taskData[15]);
            sub_80A1654(1, taskData[15]);
        }
    }
    else if ((gMain.newKeys & DPAD_RIGHT) || sub_80F9284() == 2)
    {
        if (ewramSS.unkB != ewramSS.unk76)
        {
            if (ewramSS.unkB == 2 && (ewramSS.unk79 != 4 || ewramSS.unk7C != 0))
            {
                MenuZeroFillWindowRect(0, 14, 9, 18);
            }

            gTasks[taskId].func = sub_809E260;

            SummaryScreenHandleLeftRightInput(taskId, 1);
            sub_80A1488(1, taskData[15]);
            sub_80A1654(1, taskData[15]);
        }
    }
    else if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        sub_80A1488(2, taskData[15]);
        sub_80A1654(2, taskData[15]);

        gTasks[taskId].func = sub_809E260;
    }
}
#else
__attribute__((naked))
void sub_809F814(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    lsls r0, r5, 2\n\
    adds r0, r5\n\
    lsls r6, r0, 3\n\
    ldr r0, _0809F83C @ =gTasks + 0x8\n\
    mov r8, r0\n\
    adds r4, r6, r0\n\
    ldrh r1, [r4, 0x1C]\n\
    movs r2, 0x1C\n\
    ldrsh r0, [r4, r2]\n\
    cmp r0, 0x3\n\
    bgt _0809F840\n\
    adds r0, r1, 0x1\n\
    strh r0, [r4, 0x1C]\n\
    b _0809F9C0\n\
    .align 2, 0\n\
_0809F83C: .4byte gTasks + 0x8\n\
_0809F840:\n\
    ldr r7, _0809F874 @ =gMain\n\
    ldrh r1, [r7, 0x2E]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809F880\n\
    mov r0, r8\n\
    subs r0, 0x8\n\
    adds r0, r6, r0\n\
    ldr r1, _0809F878 @ =sub_809E260\n\
    str r1, [r0]\n\
    movs r0, 0x4\n\
    strh r0, [r4]\n\
    movs r0, 0x1\n\
    strh r0, [r4, 0x1A]\n\
    ldr r2, _0809F87C @ =gSharedMem + 0x18000\n\
    ldrh r0, [r4, 0x1E]\n\
    adds r2, 0x79\n\
    strb r0, [r2]\n\
    movs r1, 0x1\n\
    negs r1, r1\n\
    adds r0, r5, 0\n\
    bl sub_809E8F0\n\
    b _0809F9C0\n\
    .align 2, 0\n\
_0809F874: .4byte gMain\n\
_0809F878: .4byte sub_809E260\n\
_0809F87C: .4byte gSharedMem + 0x18000\n\
_0809F880:\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809F8B4\n\
    mov r0, r8\n\
    subs r0, 0x8\n\
    adds r0, r6, r0\n\
    ldr r1, _0809F8AC @ =sub_809E260\n\
    str r1, [r0]\n\
    movs r0, 0x4\n\
    strh r0, [r4]\n\
    movs r0, 0x1\n\
    strh r0, [r4, 0x1A]\n\
    ldr r2, _0809F8B0 @ =gSharedMem + 0x18000\n\
    ldrh r0, [r4, 0x1E]\n\
    adds r2, 0x79\n\
    strb r0, [r2]\n\
    adds r0, r5, 0\n\
    movs r1, 0x1\n\
    bl sub_809E8F0\n\
    b _0809F9C0\n\
    .align 2, 0\n\
_0809F8AC: .4byte sub_809E260\n\
_0809F8B0: .4byte gSharedMem + 0x18000\n\
_0809F8B4:\n\
    movs r0, 0x20\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0809F8C8\n\
    bl sub_80F9284\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _0809F918\n\
_0809F8C8:\n\
    ldr r1, _0809F90C @ =gSharedMem + 0x18000\n\
    ldrb r0, [r1, 0xB]\n\
    cmp r0, 0x2\n\
    beq _0809F9C0\n\
    cmp r0, 0x3\n\
    bne _0809F8F4\n\
    adds r0, r1, 0\n\
    adds r0, 0x79\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x4\n\
    bne _0809F8E8\n\
    adds r0, r1, 0\n\
    adds r0, 0x7C\n\
    ldrh r0, [r0]\n\
    cmp r0, 0\n\
    beq _0809F8F4\n\
_0809F8E8:\n\
    movs r0, 0\n\
    movs r1, 0xE\n\
    movs r2, 0x9\n\
    movs r3, 0x12\n\
    bl MenuZeroFillWindowRect\n\
_0809F8F4:\n\
    ldr r1, _0809F910 @ =gTasks\n\
    lsls r0, r5, 2\n\
    adds r0, r5\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldr r1, _0809F914 @ =sub_809E260\n\
    str r1, [r0]\n\
    movs r1, 0x1\n\
    negs r1, r1\n\
    adds r0, r5, 0\n\
    b _0809F972\n\
    .align 2, 0\n\
_0809F90C: .4byte gSharedMem + 0x18000\n\
_0809F910: .4byte gTasks\n\
_0809F914: .4byte sub_809E260\n\
_0809F918:\n\
    ldrh r1, [r7, 0x2E]\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0809F92E\n\
    bl sub_80F9284\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x2\n\
    bne _0809F994\n\
_0809F92E:\n\
    ldr r1, _0809F988 @ =gSharedMem + 0x18000\n\
    adds r2, r1, 0\n\
    adds r2, 0x76\n\
    ldrb r0, [r1, 0xB]\n\
    ldrb r2, [r2]\n\
    cmp r0, r2\n\
    beq _0809F9C0\n\
    cmp r0, 0x2\n\
    bne _0809F960\n\
    adds r0, r1, 0\n\
    adds r0, 0x79\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x4\n\
    bne _0809F954\n\
    adds r0, r1, 0\n\
    adds r0, 0x7C\n\
    ldrh r0, [r0]\n\
    cmp r0, 0\n\
    beq _0809F960\n\
_0809F954:\n\
    movs r0, 0\n\
    movs r1, 0xE\n\
    movs r2, 0x9\n\
    movs r3, 0x12\n\
    bl MenuZeroFillWindowRect\n\
_0809F960:\n\
    ldr r1, _0809F98C @ =gTasks\n\
    lsls r0, r5, 2\n\
    adds r0, r5\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldr r1, _0809F990 @ =sub_809E260\n\
    str r1, [r0]\n\
    adds r0, r5, 0\n\
    movs r1, 0x1\n\
_0809F972:\n\
    bl SummaryScreenHandleLeftRightInput\n\
    ldrb r1, [r4, 0x1E]\n\
    movs r0, 0x1\n\
    bl sub_80A1488\n\
    ldrb r1, [r4, 0x1E]\n\
    movs r0, 0x1\n\
    bl sub_80A1654\n\
    b _0809F9C0\n\
    .align 2, 0\n\
_0809F988: .4byte gSharedMem + 0x18000\n\
_0809F98C: .4byte gTasks\n\
_0809F990: .4byte sub_809E260\n\
_0809F994:\n\
    ldrh r1, [r7, 0x2E]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _0809F9A6\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0809F9C0\n\
_0809F9A6:\n\
    ldrb r1, [r4, 0x1E]\n\
    movs r0, 0x2\n\
    bl sub_80A1488\n\
    ldrb r1, [r4, 0x1E]\n\
    movs r0, 0x2\n\
    bl sub_80A1654\n\
    mov r0, r8\n\
    subs r0, 0x8\n\
    adds r0, r6, r0\n\
    ldr r1, _0809F9CC @ =sub_809E260\n\
    str r1, [r0]\n\
_0809F9C0:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809F9CC: .4byte sub_809E260\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_809F9D0(u8 taskId, u8 b)
{
    s16 *taskData = gTasks[taskId].data;
    taskData[14] = 0;
    taskData[15] = b;

    sub_80A1488(-2, 4);
    sub_80A1654(-2, 4);
    MenuZeroFillWindowRect(11, 15, 28, 18);
    MenuPrint(gOtherText_CantForgetHMs, 11, 15);

    gTasks[taskId].func = sub_809F814;
}

u8 sub_809FA30(void)
{
    return ewramSS.unk7A;
}

// void GetStringCenterAlignXOffsetWithLetterSpacing(u8 a, u8 b, u8 c, u8 d)
// {
//     u16 *vramAddr = (u16 *)(VRAM + 0xF000);

//     vramAddr[(d * 32) + c] = (b * 0x1000) + (a * 2) + 0x200 + 0x80;
//     vramAddr[(d * 32) + c + 32] = (b * 0x1000) + (a * 2) + 0x200 + 0x81;
// }
__attribute__((naked))
void GetStringCenterAlignXOffsetWithLetterSpacing(u8 a, u8 b, u8 c, u8 d)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    lsls r0, 24\n\
    lsls r1, 24\n\
    lsls r2, 24\n\
    lsls r3, 24\n\
    lsrs r2, 23\n\
    lsrs r3, 18\n\
    ldr r4, _0809FA70 @ =0x0600f000\n\
    adds r3, r4\n\
    adds r2, r3\n\
    lsrs r1, 12\n\
    lsrs r0, 23\n\
    movs r4, 0x80\n\
    lsls r4, 2\n\
    adds r3, r4, 0\n\
    adds r0, r3\n\
    adds r1, r0\n\
    adds r0, r1, 0\n\
    adds r0, 0x80\n\
    strh r0, [r2]\n\
    adds r2, 0x40\n\
    adds r1, 0x81\n\
    strh r1, [r2]\n\
    pop {r4}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0809FA70: .4byte 0x0600f000\n\
    .syntax divided\n");
}

void GetStringCenterAlignXOffset(u8 a, u8 b, u8 c)
{
    GetStringCenterAlignXOffsetWithLetterSpacing(a, 15, b, c);
}

bool8 sub_809FA94(struct Pokemon *mon)
{
    if (!IsShiny(mon))
    {
        LoadPalette(gUnknown_083C157C, 4, 2);
        return FALSE;
    }
    else
    {
        LoadPalette(gUnknown_083C157E, 4, 2);
        return TRUE;
    }
}

void sub_809FAC8(struct Pokemon *mon)
{
    bool8 shinyDexNum;
    u16 dexNum;
    u8 *buffer;

    if (GetMonData(mon, MON_DATA_IS_EGG))
    {
        MenuZeroFillWindowRect(1, 2, 4, 3);
        MenuZeroFillWindowRect(3, 16, 9, 17);
        MenuZeroFillWindowRect(0, 12, 11, 15);
        GetMonNickname(mon, gStringVar1);
        sub_80A1FF8(gStringVar1, 13, 3, 16);
        LoadPalette(gUnknown_083C157C, 4, 2);
    }
    else
    {
        shinyDexNum = sub_809FA94(mon);
        dexNum = SpeciesToPokedexNum(GetMonData(mon, MON_DATA_SPECIES));
        if (dexNum != 0xFFFF)
        {
            if (!shinyDexNum)
            {
                GetStringCenterAlignXOffset(2, 1, 2);
                sub_80A1F98(dexNum, 13, 3, 2, 17, 16, 1);
            }
            else
            {
                GetStringCenterAlignXOffsetWithLetterSpacing(2, 8, 1, 2);
                sub_80A1F98(dexNum, 8, 3, 2, 17, 16, 1);
            }
        }
        else
        {
            MenuZeroFillWindowRect(1, 2, 4, 3);
        }

        buffer = gStringVar1;
        buffer = sub_80A1E58(buffer, 13);
        buffer = GetMonNickname(mon, buffer);
        buffer[0] = EXT_CTRL_CODE_BEGIN;
        buffer[1] = 0x13;
        buffer[2] = 0x3C;
        buffer[3] = EOS;
        MenuPrint(gStringVar1, 1, 12);

        sub_80A0958(mon);
    }
}

void sub_809FBE4(void)
{
    u8 i;

    for (i = 0; i < 28; i++)
    {
        sub_80A1918(i, 1);
    }

    MenuZeroFillWindowRect(11, 4, 29, 18);
}

void sub_809FC0C(void)
{
    MenuPrint(gOtherText_Type2, 11, 6);
    GetStringCenterAlignXOffset(0, 22, 4);
    GetStringCenterAlignXOffset(2, 23, 4);
}

void sub_809FC34(struct Pokemon *mon)
{
    u8 i;
    u8 *buffer;
    u16 friendship;
    u8 language;
    u16 species;
    u8 ability;

    for (i = 0; i < 5; i++)
    {
        sub_80A1918(i, 1);
    }

    MenuZeroFillWindowRect(11, 9, 28, 12);
    if (GetMonData(mon, MON_DATA_IS_EGG))
    {
        buffer = gStringVar1;
        buffer = sub_80A1E58(buffer, 13);
        buffer = StringCopy(buffer, gOtherText_OriginalTrainer);
        buffer = StringCopy(buffer, gOtherText_FiveQuestionsAndSlash);
        buffer[0] = EXT_CTRL_CODE_BEGIN;
        buffer[1] = 0x13;
        buffer[2] = 0x4E;
        buffer[3] = EOS;
        MenuPrint(gStringVar1, 11, 4);

        sub_80A1EF8(gOtherText_FiveQuestionsAndSlash, 13, 193, 32, 1);
        sub_80A198C(9, 120, 48, 0);

        friendship = GetMonData(mon, MON_DATA_FRIENDSHIP);
        if (friendship < 6)
        {
            MenuPrint(gOtherText_EggAbout, 11, 9);
        }
        else if (friendship < 11)
        {
            MenuPrint(gOtherText_EggSoon, 11, 9);
        }
        else if (friendship < 41)
        {
            MenuPrint(gOtherText_EggSomeTime, 11, 9);
        }
        else
        {
            MenuPrint(gOtherText_EggLongTime, 11, 9);
        }

        PokemonSummaryScreen_PrintEggTrainerMemo(mon, 11, 14);
    }
    else
    {
        GetMonData(mon, MON_DATA_OT_NAME, gStringVar2);
        language = GetMonData(mon, MON_DATA_LANGUAGE);
        ConvertInternationalString(gStringVar2, language);

        buffer = gStringVar1;
        buffer = sub_80A1E58(buffer, 13);
        buffer = StringCopy(buffer, gOtherText_OriginalTrainer);

        if (GetMonData(mon, MON_DATA_OT_GENDER) == MALE)
        {
            buffer = sub_80A1E58(buffer, 9);
        }
        else
        {
            buffer = sub_80A1E58(buffer, 10);
        }

        buffer = StringCopy(buffer, gStringVar2);
        buffer[0] = EXT_CTRL_CODE_BEGIN;
        buffer[1] = 0x13;
        buffer[2] = 0x4E;
        buffer[3] = EOS;
        MenuPrint(gStringVar1, 11, 4);

        sub_80A1F98(GetMonData(mon, MON_DATA_OT_ID) & 0xFFFF, 13, 5, 2, 193, 32, 1);

        species = GetMonData(mon, MON_DATA_SPECIES);
        sub_80A198C(gBaseStats[species].type1, 120, 48, 0);
        if (gBaseStats[species].type1 != gBaseStats[species].type2)
        {
            sub_80A198C(gBaseStats[species].type2, 160, 48, 1);
        }

        ability = GetAbilityBySpecies(GetMonData(mon, MON_DATA_SPECIES), GetMonData(mon, MON_DATA_ALT_ABILITY));
        sub_80A1FF8(gAbilityNames[ability], 13, 11, 9);
        MenuPrint(gAbilityDescriptions[ability], 11, 11);

        PokemonSummaryScreen_PrintTrainerMemo(mon, 11, 14);
    }
}

void sub_809FE6C(struct Pokemon *mon)
{
    sub_809FC0C();
    sub_809FC34(mon);
}

void sub_809FE80(void)
{
    MenuZeroFillWindowRect(14, 4, 18, 5);
    MenuZeroFillWindowRect(25, 4, 30, 5);
    MenuZeroFillWindowRect(11, 9, 28, 12);
    MenuZeroFillWindowRect(11, 14, 28, 17);
}

void sub_809FEB8(void)
{
    sub_80A1FF8(gOtherText_ExpPoints, 13, 11, 14);
    sub_80A1FF8(gOtherText_NextLv, 13, 11, 16);
    MenuPrint(gOtherText_Terminator18, 21, 16);

    sub_80A1F48(gOtherText_HP, 13, 11, 7, 42);
    sub_80A1F48(gOtherText_Attack, 13, 11, 9, 42);
    sub_80A1F48(gOtherText_Defense, 13, 11, 11, 42);
    sub_80A1F48(gOtherText_SpAtk, 13, 22, 7, 36);
    sub_80A1F48(gOtherText_SpDef, 13, 22, 9, 36);
    sub_80A1F48(gOtherText_Speed, 13, 22, 11, 36);
}

void sub_809FF64(struct Pokemon *mon)
{
    u8 i;
    u16 heldItem;
    u8 *buffer;

    for (i = 0; i < 5; i++)
    {
        sub_80A1918(i, 1);
    }

    heldItem = GetMonData(mon, MON_DATA_HELD_ITEM);
    PrintHeldItemName(heldItem, 11, 4);
    PrintNumRibbons(mon);

    buffer = gStringVar1;

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_EXP));
    MenuPrint_RightAligned(buffer, 29, 14);
    DrawExperienceProgressBar(mon, 23, 16);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_ATK));
    sub_8072BD8(buffer, 16, 9, 50);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_DEF));
    sub_8072BD8(buffer, 16, 11, 50);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_SPATK));
    sub_8072BD8(buffer, 27, 7, 18);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_SPDEF));
    sub_8072BD8(buffer, 27, 9, 18);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_SPEED));
    sub_8072BD8(buffer, 27, 11, 18);

    buffer = sub_8072C14(buffer, GetMonData(mon, MON_DATA_HP), 24, 1);
    *buffer++ = CHAR_SLASH;
    buffer = sub_8072C14(buffer, GetMonData(mon, MON_DATA_MAX_HP), 48, 1);

    MenuPrint_PixelCoords(gStringVar1, 126, 56, 1);
}

void sub_80A0090(struct Pokemon *mon)
{
    sub_809FEB8();
    sub_809FF64(mon);
}

void sub_80A00A4(void)
{
    MenuZeroFillWindowRect(11, 4, 19, 5);
    MenuZeroFillWindowRect(16, 7, 21, 8);
    MenuZeroFillWindowRect(17, 9, 21, 12);
    MenuZeroFillWindowRect(27, 7, 29, 12);
    MenuZeroFillWindowRect(22, 14, 28, 15);
    MenuZeroFillWindowRect(23, 16, 28, 17);
}

void sub_80A00F4(u8 a)
{
    if (ewramSS.unk7C != 0 || a != 4)
    {
        if (ewramSS.unkB == 2)
        {
            sub_80A1FF8(gOtherText_Power2, 13, 1, 15);
            sub_80A1FF8(gOtherText_Accuracy2, 13, 1, 17);
        }
        else
        {
            sub_80A1FF8(gOtherText_Appeal2, 13, 1, 15);
            sub_80A1FF8(gOtherText_Jam2, 13, 1, 17);
        }
    }
}

void sub_80A015C(struct Pokemon *mon)
{
    u8 i;
    u16 move;
    u16 curPP;
    u8 ppBonuses;
    u8 maxPP;
    u8 *buffer;

    for (i = 0; i < 4; i++)
    {
        move = GetMonMove(mon, i);
        curPP = GetMonMovePP(mon, i);

        if (move == 0)
        {
            sub_80A1918(i, 1);
            sub_80A1FF8(gOtherText_OneDash, 13, 15, (2 * i) + 4);
            MenuPrint(gOtherText_TwoDashes, 26, (2 * i) + 4);
        }
        else
        {
            if (ewramSS.unkB == 2)
            {
                sub_80A198C(gBattleMoves[move].type, 87, ((2 * i) + 4) * 8, i);
            }
            else
            {
                sub_80A198C(gContestMoves[move].contestCategory + 18, 87, ((2 * i) + 4) * 8, i);
            }

            sub_80A1FF8(gMoveNames[move], 13, 15, (2 * i) + 4);
            GetStringCenterAlignXOffset(1, 24, (2 * i) + 4);
            
            ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
            maxPP = CalculatePPWithBonus(move, ppBonuses, i);

            buffer = gStringVar1;
            buffer = sub_8072C14(buffer, curPP, 14, 1);
            *buffer++ = CHAR_SLASH;
            sub_8072C14(buffer, maxPP, 32, 1);
            MenuPrint(gStringVar1, 25, (2 * i) + 4);
        }
    }
}

void sub_80A029C(struct Pokemon *mon)
{
    u8 *buffer;
    u16 move;
    u8 pp;

    if (ewramSS.unk7C == 0)
    {
        sub_80A1FF8(gOtherText_CancelNoTerminator, 13, 15, 12);
        return;
    }

    move = ewramSS.unk7C;

    if (ewramSS.unkB == 2)
        sub_80A198C(gBattleMoves[move].type, 87, 96, 4);
    else
        sub_80A198C(gContestMoves[move].contestCategory + 18, 87, 96, 4);

    if (ewramSS.unkB == 2)
        sub_80A1FF8(gMoveNames[move], 10, 15, 12);
    else
        sub_80A1FF8(gMoveNames[move], 9, 15, 12);

    GetStringCenterAlignXOffset(1, 24, 12);

    buffer = gStringVar1;
    pp = gBattleMoves[move].pp;
    buffer = sub_8072C14(buffer, pp, 14, 1);
    *buffer++ = CHAR_SLASH;
    buffer = sub_8072C14(buffer, pp, 32, 1);
    MenuPrint(gStringVar1, 25, 12);
}

void sub_80A0390(void)
{
    u8 i;

    for (i = 0; i < MAX_MON_MOVES; i++)
    {
        MenuZeroFillWindowRect(15, (i * 2) + 4, 28, (i * 2) + 5);
    }
}

u16 sub_80A03BC(struct Pokemon *mon, u8 selectedMoveIndex)
{
    u16 move;

    if (selectedMoveIndex != MAX_MON_MOVES)
    {
        move = GetMonMove(mon, selectedMoveIndex);
    }
    else
    {
        if (ewramSS.unk7C != 0)
        {
            move = ewramSS.unk7C;
        }
        else
        {
            move = 0xFFFF;
        }
    }

    return move;
}

void sub_80A03F0(struct Pokemon *mon, u8 *selectedMoveIndex)
{
    u16 move = sub_80A03BC(mon, *selectedMoveIndex);

    if (ewramSS.unkB == 2)
    {
        sub_80A04CC(move);
        sub_80A057C(0xFFFF);
    }
    else
    {
        sub_80A057C(move);
    }
}

void sub_80A0428(struct Pokemon *mon, u8 *selectedMoveIndex)
{
    u16 move = sub_80A03BC(mon, *selectedMoveIndex);
    MenuZeroFillWindowRect(11, 15, 28, 18);

    if (ewramSS.unkB == 2)
    {
        sub_80A046C(move);
    }
    else
    {
        sub_80A0498(move);
    }

    sub_80A03F0(mon, selectedMoveIndex);
}

void sub_80A046C(u16 move)
{
    if (move == 0xFFFF) return;

    MenuPrint(gMoveDescriptions[move - 1], 11, 15);
}

void sub_80A0498(u16 move)
{
    if (move == 0xFFFF) return;

    MenuPrint(gContestEffectStrings[gContestMoves[move].effect], 11, 15);
}

void sub_80A04CC(u16 move)
{
    u8 *buffer;

    if (move == 0xFFFF) return;

    if (gBattleMoves[move].power <= 1)
    {
        buffer = gStringVar1;
        buffer = sub_8072C74(buffer, gOtherText_ThreeDashes2, 21, 1);
        MenuPrint(gStringVar1, 7, 15);
    }
    else
    {
        buffer = gStringVar1;
        buffer = sub_8072C14(buffer, gBattleMoves[move].power, 21, 1);
        MenuPrint(gStringVar1, 7, 15);
    }

    if (gBattleMoves[move].accuracy == 0)
    {
        buffer = gStringVar1;
        buffer = sub_8072C74(buffer, gOtherText_ThreeDashes2, 21, 1);
        MenuPrint(gStringVar1, 7, 17);
    }
    else
    {
        buffer = gStringVar1;
        buffer = sub_8072C14(buffer, gBattleMoves[move].accuracy, 21, 1);
        MenuPrint(gStringVar1, 7, 17);
    }
}

#ifdef NONMATCHING // The two vramAddr lines are non-matching.
void sub_80A057C(u16 move)
{
    u8 appeal;
    u8 jam;
    u8 i;
    u16 *vramAddr = (u16 *)(VRAM + 0x6800);

    if (move == 0xFFFF) return;

    appeal = gContestEffects[gContestMoves[move].effect].appeal;
    if (appeal != 0xFF)
    {
        appeal = appeal / 10;
    }

    for (i = 0; i < 8; i++)
    {
        u16 tile = 0x1039;
        int and = 3;
        int offset = 0x3CC / 2;
        if (appeal != 0xFF && i < appeal)
        {
            tile = 0x103A;
        }

        *(&vramAddr[(i >> 2 << 5) + (i & and)] + offset) = tile;
    }

    if (move == 0xFFFF) return;

    jam = gContestEffects[gContestMoves[move].effect].jam;
    if (jam != 0xFF)
    {
        jam = jam / 10;
    }

    for (i = 0; i < 8; i++)
    {
        u16 tile = 0x103D;
        int and = 3;
        int offset = 0x226;
        if (jam != 0xFF && i < jam)
        {
            tile = 0x103C;
        }

        *(&vramAddr[(i >> 2 << 5) + (i & and)] + offset) = tile;
    }
}
#else
__attribute__((naked))
void sub_80A057C(u16 move)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    ldr r0, _080A0648 @ =0x06006800\n\
    mov r8, r0\n\
    ldr r0, _080A064C @ =0x0000ffff\n\
    cmp r5, r0\n\
    beq _080A063A\n\
    ldr r1, _080A0650 @ =gContestEffects\n\
    ldr r2, _080A0654 @ =gContestMoves\n\
    lsls r3, r5, 3\n\
    adds r0, r3, r2\n\
    ldrb r0, [r0]\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r4, [r0, 0x1]\n\
    mov r10, r2\n\
    mov r9, r3\n\
    cmp r4, 0xFF\n\
    beq _080A05B8\n\
    adds r0, r4, 0\n\
    movs r1, 0xA\n\
    bl __udivsi3\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
_080A05B8:\n\
    movs r2, 0\n\
    movs r7, 0x3\n\
    movs r6, 0xF3\n\
    lsls r6, 2\n\
_080A05C0:\n\
    ldr r3, _080A0658 @ =0x00001039\n\
    cmp r4, 0xFF\n\
    beq _080A05CC\n\
    cmp r2, r4\n\
    bcs _080A05CC\n\
    adds r3, 0x1\n\
_080A05CC:\n\
    lsrs r0, r2, 2\n\
    lsls r0, 5\n\
    adds r1, r2, 0\n\
    ands r1, r7\n\
    adds r1, r0\n\
    lsls r1, 1\n\
    add r1, r8\n\
    adds r1, r6\n\
    strh r3, [r1]\n\
    adds r0, r2, 0x1\n\
    lsls r0, 24\n\
    lsrs r2, r0, 24\n\
    cmp r2, 0x7\n\
    bls _080A05C0\n\
    ldr r0, _080A064C @ =0x0000ffff\n\
    cmp r5, r0\n\
    beq _080A063A\n\
    mov r0, r9\n\
    add r0, r10\n\
    ldrb r0, [r0]\n\
    lsls r0, 2\n\
    ldr r1, _080A0650 @ =gContestEffects\n\
    adds r0, r1\n\
    ldrb r4, [r0, 0x2]\n\
    cmp r4, 0xFF\n\
    beq _080A060C\n\
    adds r0, r4, 0\n\
    movs r1, 0xA\n\
    bl __udivsi3\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
_080A060C:\n\
    movs r2, 0\n\
    movs r6, 0x3\n\
    ldr r5, _080A065C @ =0x0000044c\n\
_080A0612:\n\
    ldr r3, _080A0660 @ =0x0000103d\n\
    cmp r4, 0xFF\n\
    beq _080A061E\n\
    cmp r2, r4\n\
    bcs _080A061E\n\
    subs r3, 0x1\n\
_080A061E:\n\
    lsrs r0, r2, 2\n\
    lsls r0, 5\n\
    adds r1, r2, 0\n\
    ands r1, r6\n\
    adds r1, r0\n\
    lsls r1, 1\n\
    add r1, r8\n\
    adds r1, r5\n\
    strh r3, [r1]\n\
    adds r0, r2, 0x1\n\
    lsls r0, 24\n\
    lsrs r2, r0, 24\n\
    cmp r2, 0x7\n\
    bls _080A0612\n\
_080A063A:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A0648: .4byte 0x06006800\n\
_080A064C: .4byte 0x0000ffff\n\
_080A0650: .4byte gContestEffects\n\
_080A0654: .4byte gContestMoves\n\
_080A0658: .4byte 0x00001039\n\
_080A065C: .4byte 0x0000044c\n\
_080A0660: .4byte 0x0000103d\n\
    .syntax divided\n");
}
#endif // NONMATCHING

bool8 PokemonSummaryScreen_CheckOT(struct Pokemon *mon)
{
    u32 trainerId;

    if (ewram18000_3 == gEnemyParty)
    {
        u8 enemyId = GetMultiplayerId() ^ 1;
        trainerId = gLinkPlayers[enemyId].trainerId & 0xFFFF;
        StringCopy(gStringVar1, gLinkPlayers[enemyId].name);
        StripExtCtrlCodes(gStringVar1);
    }
    else
    {
        trainerId = GetPlayerTrainerId() & 0xFFFF;
        StringCopy(gStringVar1, gSaveBlock2.playerName);
    }

    if (trainerId != (GetMonData(mon, MON_DATA_OT_ID) & 0xFFFF))
        return FALSE;

    GetMonData(mon, MON_DATA_OT_NAME, gStringVar2);

    if (!StringCompareWithoutExtCtrlCodes(gStringVar1, gStringVar2))
        return TRUE;

    return FALSE;
}

void PokemonSummaryScreen_PrintEggTrainerMemo(struct Pokemon *mon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet = GetMonData(mon, MON_DATA_MET_GAME);

    if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
    {
        MenuPrint(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);

    if (locationMet == 255)
    {
        // Eggs received from Pokemon Box.
        MenuPrint(gOtherText_EggNicePlace, left, top);
        return;
    }

    if (!PokemonSummaryScreen_CheckOT(mon))
    {
        MenuPrint(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    asm(""); // needed to match for some reason

    if (locationMet == 253)
    {
        MenuPrint(gOtherText_EggHotSprings, left, top);
        return;
    }

    MenuPrint(gOtherText_EggDayCare, left, top);
}

void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *pokemon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet;
    u8 *ptr = gStringVar4;
    u8 nature = GetNature(pokemon);

#if ENGLISH
    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);

    if (nature != NATURE_BOLD && nature != NATURE_GENTLE)
    {
        ptr = StringCopy(ptr, gOtherText_Terminator4);
    }

    ptr = StringCopy(ptr, gOtherText_Nature);
#elif GERMAN
    ptr = StringCopy(gStringVar4, gOtherText_Nature);
    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);
    ptr = StringCopy(ptr, gOtherText_Terminator4);
#endif

    if (PokemonSummaryScreen_CheckOT(pokemon) == TRUE)
    {
        locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);

        if (GetMonData(pokemon, MON_DATA_MET_LEVEL) == 0)
        {
            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, 5);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Egg2);
        }
        else if (locationMet >= 88)
        {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }
        else
        {
            u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Met);
        }
    }
    else
    {
        gameMet = GetMonData(pokemon, MON_DATA_MET_GAME);

        if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
        {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }
        else
        {
            locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);
            if (locationMet == 0xFF)
            {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_FatefulEncounter);
            }
            else if (locationMet >= 88)
            {
                *ptr = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_ObtainedInTrade);
            }
            else
            {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                CopyLocationName(gStringVar1, locationMet);
                ptr = sub_80A1E9C(ptr, gStringVar1, 14);
                StringCopy(ptr, gOtherText_Met2);
            }
        }
    }

    MenuPrint(gStringVar4, left++, top++);
}

void sub_80A0958(struct Pokemon *pokemon)
{
    u16 species;
    u8 *buffer;
    u8 level;

    species = GetMonData(pokemon, MON_DATA_SPECIES);

    buffer = gStringVar1;
    buffer = sub_80A1E58(buffer, 13);
    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x11;
    buffer[2] = 0x7;
    buffer[3] = CHAR_SLASH;
    buffer += 4;
    buffer = StringCopy(buffer, gSpeciesNames[species]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x50;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 0, 14);
    MenuZeroFillWindowRect(3, 16, 9, 17);

    level = GetMonData(pokemon, MON_DATA_LEVEL);

    buffer = sub_80A1E58(gStringVar1, 13);
    buffer[0] = 0x34;
    buffer += 1;
    buffer = ConvertIntToDecimalString(buffer, level);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x20;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 3, 16);
    sub_80A0A2C(pokemon, 7, 16);
}

void sub_80A0A2C(struct Pokemon *pokemon, u8 left, u8 top)
{
    const u8 *genderSymbol;
    u8 var1;
    u8 bottom;
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES2);

    if (species != SPECIES_NIDORAN_M && species != SPECIES_NIDORAN_F)
    {
        u8 gender = GetMonGender(pokemon);
        switch (gender)
        {
        default:
            bottom = top + 1;
            MenuZeroFillWindowRect(left, top, left, bottom);
            return;
        case MON_MALE:
            genderSymbol = gOtherText_MaleSymbol2;
            var1 = 11;
            break;
        case MON_FEMALE:
            genderSymbol = gOtherText_FemaleSymbolAndLv;
            var1 = 12;
            break;
        }

        sub_80A1FF8(genderSymbol, var1, left, top);
    }
}

u8 GetNumRibbons(struct Pokemon *pokemon)
{
    u8 numRibbons = GetMonData(pokemon, MON_DATA_COOL_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_BEAUTY_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_CUTE_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_SMART_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_TOUGH_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_CHAMPION_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_WINNING_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_VICTORY_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_ARTIST_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_EFFORT_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_1);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_2);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_3);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_4);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_5);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_6);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_7);

    return numRibbons;
}

void PrintNumRibbons(struct Pokemon *pokemon)
{
    u8 numRibbons = GetNumRibbons(pokemon);

    if (numRibbons == 0)
    {
        StringCopy(gStringVar1, gOtherText_None);
    }
    else
    {
        u8 ribbonsStringLength;
        u8 *text;

        StringCopy(gStringVar1, gOtherText_Ribbons00);
        ribbonsStringLength = StringLength(gStringVar1);

        text = &gStringVar1[ribbonsStringLength - 2];

        text[0] = EXT_CTRL_CODE_BEGIN;
        text[1] = 0x14;
        text[2] = 6;
        ConvertIntToDecimalStringN(&text[3], numRibbons, 1, 2);
    }

    MenuPrint(gUnknown_083C15AE, 21, 4);
}

void PrintHeldItemName(u16 itemId, u8 left, u8 top)
{
    if (itemId == ITEM_ENIGMA_BERRY
        && sub_80F9344() == TRUE
        && IsLinkDoubleBattle() == TRUE
        && (ewramSS.unk9 == 1 || ewramSS.unk9 == 4 || ewramSS.unk9 == 5))
    {
        StringCopy(gStringVar1, ItemId_GetItem(itemId)->name);
    }
    else if (itemId == 0)
    {
        StringCopy(gStringVar1, gOtherText_None);
    }
    else
    {
        CopyItemName(itemId, gStringVar1);
    }

    MenuPrint(gUnknown_083C15B4, left, top);
}

void DrawExperienceProgressBar(struct Pokemon *pokemon, u8 left, u8 top)
{
    u32 curExperience;
    u8 level;
    u16 species;
    u8 i;
    u16 *vramAddr;
    u32 expToNextLevel = 0;
    s64 numExpProgressBarTicks = 0;

    curExperience = GetMonData(pokemon, MON_DATA_EXP);
    level = GetMonData(pokemon, MON_DATA_LEVEL);
    species = GetMonData(pokemon, MON_DATA_SPECIES);

    // The experience progress bar is shown as empty when the Pokemon is already level 100.
    if (level < 100)
    {
        u32 nextLevelExp;
        u32 expSinceLastLevel;
        u32 expBetweenLevels;
        u32 curLevelExperience;

        nextLevelExp = gExperienceTables[gBaseStats[species].growthRate][level + 1];
        expToNextLevel = nextLevelExp - curExperience;
        curLevelExperience = gExperienceTables[gBaseStats[species].growthRate][level];
        expBetweenLevels = (nextLevelExp - curLevelExperience);
        expSinceLastLevel = curExperience - curLevelExperience;

        // Calculate the number of 1-pixel "ticks" to illuminate in the experience progress bar.
        // There are 8 tiles that make up the bar, and each tile has 8 "ticks". Hence, the numerator
        // is multiplied by 64.
        numExpProgressBarTicks = (expSinceLastLevel * 64) / expBetweenLevels;
        if (numExpProgressBarTicks == 0 && expSinceLastLevel != 0)
        {
            // Ensure sure some exp. gain is visible in the progress bar.
            numExpProgressBarTicks = 1;
        }
    }

    ConvertIntToDecimalString(gStringVar1, expToNextLevel);
    MenuPrint_RightAligned(gStringVar1, left + 6, top);


    // Draw each of the 8 tiles that make up the experience progress bar.
    vramAddr = (u16 *)(VRAM + 0x4CAA);
    for (i = 0; i < 8; i++)
    {
        u16 tile;
        u16 baseTile = 0x2062;

        if (numExpProgressBarTicks > 7)
        {
            tile = 0x206A; // full exp. bar block
        }
        else
        {
            tile = (numExpProgressBarTicks % 8) + baseTile;
        }

        vramAddr[i] = tile;

        numExpProgressBarTicks -= 8;
        if (numExpProgressBarTicks < 0)
        {
            numExpProgressBarTicks = 0;
        }
    }
}

// Prints the text displayed in the top-left or top-right of the screen.
// Each of the 4 summary screens displays different text.
void PrintSummaryWindowHeaderText(void)
{
    u8 *buffer = gStringVar1;

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x12;
    buffer[2] = 0x2;

    buffer += 3;
    buffer = sub_80A1E58(buffer, 13);
    buffer = StringCopy(buffer, gUnknown_083C1068[ewramSS.unk7E]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x58;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 0, 0);

    if (ewramSS.unk7F != 0)
    {
        GetStringCenterAlignXOffset(5, 23, 0);
        GetStringCenterAlignXOffset(6, 24, 0);
    }
    else
    {
        MenuZeroFillWindowRect(23, 0, 24, 1);
    }

    buffer = gStringVar1;
    buffer = sub_80A1E58(buffer, 13);
    buffer = StringCopy(buffer, gUnknown_083C1068[ewramSS.unk7F]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x28;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 25, 0);
}

// If the given pokemon previously had the pokerus virus, a small
// dot will be drawn in between the pokeball and the mon's level.
void DrawPokerusSurvivorDot(struct Pokemon *pokemon)
{
    u16 *vram1 = (u16 *)(VRAM + 0xE444);
    u16 *vram2 = (u16 *)(VRAM + 0xEC44);

    if (!CheckPartyPokerus(pokemon, 0) && CheckPartyHasHadPokerus(pokemon, 0))
    {
        *vram1 = 0x2C;
        *vram2 = 0x2C;
    }
    else
    {
        *vram1 = 0x081A;
        *vram2 = 0x081A;
    }
}

// Draws the 4 small navigation circles at the top of the pokemon summary screen.
#ifdef NONMATCHING
void DrawSummaryScreenNavigationDots(void)
{
    void *dest;
    u16 arr[8];
    u8 i = 0;
    struct SummaryScreenStruct *SS = (struct SummaryScreenStruct *)(gSharedMem + 0x18000);
    u16 var1 = 0x4040;
    u16 var2 = 0x404A;

    for (i = 0; i < 4; i++)
    {
        if (i < SS->unk75)
        {
            arr[i * 2] = var1;
            arr[(i * 2) + 1] = var1 + 1;
        }
        else if (i > SS->unk76)
        {
            arr[i * 2] = var2;
            arr[(i * 2) + 1] = var2 + 1;
        }
        else
        {
            if (i < SS->unkB)
            {
                arr[i * 2] = 0x4046;
                arr[(i * 2) + 1] = 0x4046 + 1;
            }

            if (i == SS->unkB)
            {
                if (i != SS->unk76)
                {
                    arr[i * 2] = 0x4041;
                    arr[(i * 2) + 1] = 0x4041 + 1;
                }
                else
                {
                    arr[i * 2] = 0x404B;
                    arr[(i * 2) + 1] = 0x404B + 1;
                }
            }

            if (i > SS->unkB)
            {
                if (i != SS->unk76)
                {
                    arr[i * 2] = 0x4043;
                    arr[(i * 2) + 1] = 0x4043 + 1;
                }
                else
                {
                    arr[i * 2] = 0x4048;
                    arr[(i * 2) + 1] = 0x4048 + 1;
                }
            }
        }
    }

    dest = (void *)(VRAM + 0xE016);
    DmaCopy16(3, arr, dest, 16);

    for (i = 0; i < 8; i++)
    {
        arr[i] += 0x10;
    }

    dest = (void *)(VRAM + 0xE056);
    DmaCopy16(3, arr, dest, 16);
}
#else
__attribute__((naked))
void DrawSummaryScreenNavigationDots(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x10\n\
    movs r3, 0\n\
    ldr r6, _080A0F24 @ =gSharedMem + 0x18000\n\
    adds r5, r6, 0\n\
    ldr r1, _080A0F28 @ =0x00004040\n\
    mov r8, r1\n\
    ldr r2, _080A0F2C @ =0x0000404a\n\
    mov r10, r2\n\
_080A0F02:\n\
    adds r0, r5, 0\n\
    adds r0, 0x75\n\
    ldrb r0, [r0]\n\
    cmp r3, r0\n\
    bcs _080A0F30\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    add r0, sp\n\
    mov r4, r8\n\
    strh r4, [r0]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    mov r7, sp\n\
    adds r0, r7, r1\n\
    strh r4, [r0]\n\
    b _080A0FE2\n\
    .align 2, 0\n\
_080A0F24: .4byte gSharedMem + 0x18000\n\
_080A0F28: .4byte 0x00004040\n\
_080A0F2C: .4byte 0x0000404a\n\
_080A0F30:\n\
    movs r0, 0x76\n\
    adds r0, r6\n\
    mov r12, r0\n\
    ldrb r1, [r0]\n\
    cmp r3, r1\n\
    bls _080A0F52\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    add r0, sp\n\
    mov r2, r10\n\
    strh r2, [r0]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    mov r4, sp\n\
    adds r0, r4, r1\n\
    strh r2, [r0]\n\
    b _080A0FE2\n\
_080A0F52:\n\
    ldrb r4, [r5, 0xB]\n\
    cmp r3, r4\n\
    bcs _080A0F6E\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r7, sp\n\
    adds r2, r7, r0\n\
    ldr r0, _080A0F88 @ =0x00004046\n\
    strh r0, [r2]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    add r1, sp\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080A0F6E:\n\
    cmp r3, r4\n\
    bne _080A0FA6\n\
    mov r0, r12\n\
    ldrb r0, [r0]\n\
    cmp r3, r0\n\
    beq _080A0F90\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r4, sp\n\
    adds r2, r4, r0\n\
    ldr r0, _080A0F8C @ =0x00004041\n\
    b _080A0F9A\n\
    .align 2, 0\n\
_080A0F88: .4byte 0x00004046\n\
_080A0F8C: .4byte 0x00004041\n\
_080A0F90:\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r7, sp\n\
    adds r2, r7, r0\n\
    ldr r0, _080A0FC4 @ =0x0000404b\n\
_080A0F9A:\n\
    strh r0, [r2]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    add r1, sp\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080A0FA6:\n\
    ldrb r0, [r5, 0xB]\n\
    cmp r3, r0\n\
    bls _080A0FE2\n\
    adds r0, r6, 0\n\
    adds r0, 0x76\n\
    ldrb r0, [r0]\n\
    cmp r3, r0\n\
    beq _080A0FCC\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r4, sp\n\
    adds r2, r4, r0\n\
    ldr r0, _080A0FC8 @ =0x00004043\n\
    b _080A0FD6\n\
    .align 2, 0\n\
_080A0FC4: .4byte 0x0000404b\n\
_080A0FC8: .4byte 0x00004043\n\
_080A0FCC:\n\
    lsls r1, r3, 1\n\
    lsls r0, r3, 2\n\
    mov r7, sp\n\
    adds r2, r7, r0\n\
    ldr r0, _080A1034 @ =0x00004048\n\
_080A0FD6:\n\
    strh r0, [r2]\n\
    adds r1, 0x1\n\
    lsls r1, 1\n\
    add r1, sp\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080A0FE2:\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x3\n\
    bls _080A0F02\n\
    ldr r1, _080A1038 @ =0x0600e016\n\
    ldr r0, _080A103C @ =0x040000d4\n\
    mov r2, sp\n\
    str r2, [r0]\n\
    str r1, [r0, 0x4]\n\
    ldr r1, _080A1040 @ =0x80000008\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    movs r3, 0\n\
_080A0FFE:\n\
    lsls r0, r3, 1\n\
    mov r4, sp\n\
    adds r1, r4, r0\n\
    ldrh r0, [r1]\n\
    adds r0, 0x10\n\
    strh r0, [r1]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x7\n\
    bls _080A0FFE\n\
    ldr r1, _080A1044 @ =0x0600e056\n\
    ldr r0, _080A103C @ =0x040000d4\n\
    str r4, [r0]\n\
    str r1, [r0, 0x4]\n\
    ldr r1, _080A1040 @ =0x80000008\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    add sp, 0x10\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1034: .4byte 0x00004048\n\
_080A1038: .4byte 0x0600e016\n\
_080A103C: .4byte 0x040000d4\n\
_080A1040: .4byte 0x80000008\n\
_080A1044: .4byte 0x0600e056\n\
    .syntax divided\n");
}
#endif // NONMATCHING

__attribute__((naked))
void sub_80A1048(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    lsls r0, 2\n\
    add r0, r8\n\
    lsls r0, 3\n\
    ldr r1, _080A10A0 @ =gTasks + 0x8\n\
    adds r6, r0, r1\n\
    ldrh r0, [r6]\n\
    ldrh r1, [r6, 0x2]\n\
    adds r0, r1\n\
    strh r0, [r6, 0x2]\n\
    lsls r0, 16\n\
    cmp r0, 0\n\
    bne _080A106E\n\
    b _080A1224\n\
_080A106E:\n\
    movs r5, 0x2\n\
    ldrsh r2, [r6, r5]\n\
    ldr r0, _080A10A4 @ =0x0000024a\n\
    subs r0, r2\n\
    lsls r0, 1\n\
    ldr r1, _080A10A8 @ =gUnknown_08E73508\n\
    adds r4, r0, r1\n\
    ldr r5, _080A10AC @ =0x0600e480\n\
    lsls r2, 1\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r7, r1, 0\n\
    cmp r2, r0\n\
    bhi _080A10B4\n\
    ldr r0, _080A10B0 @ =0x040000d4\n\
    str r4, [r0]\n\
    str r5, [r0, 0x4]\n\
    lsrs r1, r2, 1\n\
    movs r2, 0x80\n\
    lsls r2, 24\n\
    orrs r1, r2\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080A10E0\n\
    .align 2, 0\n\
_080A10A0: .4byte gTasks + 0x8\n\
_080A10A4: .4byte 0x0000024a\n\
_080A10A8: .4byte gUnknown_08E73508\n\
_080A10AC: .4byte 0x0600e480\n\
_080A10B0: .4byte 0x040000d4\n\
_080A10B4:\n\
    ldr r3, _080A110C @ =0x040000d4\n\
    str r4, [r3]\n\
    str r5, [r3, 0x4]\n\
    ldr r0, _080A1110 @ =0x80000800\n\
    str r0, [r3, 0x8]\n\
    ldr r0, [r3, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r4, r0\n\
    adds r5, r0\n\
    ldr r1, _080A1114 @ =0xfffff000\n\
    adds r2, r1\n\
    cmp r2, r0\n\
    bhi _080A10B4\n\
    str r4, [r3]\n\
    str r5, [r3, 0x4]\n\
    lsrs r0, r2, 1\n\
    movs r1, 0x80\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    str r0, [r3, 0x8]\n\
    ldr r0, [r3, 0x8]\n\
_080A10E0:\n\
    movs r5, 0x2\n\
    ldrsh r0, [r6, r5]\n\
    ldr r1, _080A1118 @ =0x0000026a\n\
    subs r1, r0\n\
    lsls r1, 1\n\
    adds r3, r1, r7\n\
    ldr r4, _080A111C @ =0x0600e4c0\n\
    lsls r1, r0, 1\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    cmp r1, r0\n\
    bhi _080A1120\n\
    ldr r0, _080A110C @ =0x040000d4\n\
    str r3, [r0]\n\
    str r4, [r0, 0x4]\n\
    lsrs r1, 1\n\
    movs r2, 0x80\n\
    lsls r2, 24\n\
    orrs r1, r2\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080A114C\n\
    .align 2, 0\n\
_080A110C: .4byte 0x040000d4\n\
_080A1110: .4byte 0x80000800\n\
_080A1114: .4byte 0xfffff000\n\
_080A1118: .4byte 0x0000026a\n\
_080A111C: .4byte 0x0600e4c0\n\
_080A1120:\n\
    ldr r2, _080A1178 @ =0x040000d4\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    ldr r0, _080A117C @ =0x80000800\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r3, r0\n\
    adds r4, r0\n\
    ldr r5, _080A1180 @ =0xfffff000\n\
    adds r1, r5\n\
    cmp r1, r0\n\
    bhi _080A1120\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    lsrs r0, r1, 1\n\
    movs r1, 0x80\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
_080A114C:\n\
    movs r1, 0x2\n\
    ldrsh r0, [r6, r1]\n\
    ldr r1, _080A1184 @ =0x0000024a\n\
    subs r1, r0\n\
    lsls r1, 1\n\
    adds r3, r1, r7\n\
    ldr r4, _080A1188 @ =0x0600ec80\n\
    lsls r1, r0, 1\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    cmp r1, r0\n\
    bhi _080A118C\n\
    ldr r0, _080A1178 @ =0x040000d4\n\
    str r3, [r0]\n\
    str r4, [r0, 0x4]\n\
    lsrs r1, 1\n\
    movs r2, 0x80\n\
    lsls r2, 24\n\
    orrs r1, r2\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080A11B8\n\
    .align 2, 0\n\
_080A1178: .4byte 0x040000d4\n\
_080A117C: .4byte 0x80000800\n\
_080A1180: .4byte 0xfffff000\n\
_080A1184: .4byte 0x0000024a\n\
_080A1188: .4byte 0x0600ec80\n\
_080A118C:\n\
    ldr r2, _080A11E4 @ =0x040000d4\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    ldr r0, _080A11E8 @ =0x80000800\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r3, r0\n\
    adds r4, r0\n\
    ldr r5, _080A11EC @ =0xfffff000\n\
    adds r1, r5\n\
    cmp r1, r0\n\
    bhi _080A118C\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    lsrs r0, r1, 1\n\
    movs r1, 0x80\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
_080A11B8:\n\
    movs r1, 0x2\n\
    ldrsh r0, [r6, r1]\n\
    ldr r1, _080A11F0 @ =0x0000026a\n\
    subs r1, r0\n\
    lsls r1, 1\n\
    adds r3, r1, r7\n\
    ldr r4, _080A11F4 @ =0x0600ecc0\n\
    lsls r1, r0, 1\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    cmp r1, r0\n\
    bhi _080A11F8\n\
    ldr r0, _080A11E4 @ =0x040000d4\n\
    str r3, [r0]\n\
    str r4, [r0, 0x4]\n\
    lsrs r1, 1\n\
    movs r2, 0x80\n\
    lsls r2, 24\n\
    orrs r1, r2\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080A1224\n\
    .align 2, 0\n\
_080A11E4: .4byte 0x040000d4\n\
_080A11E8: .4byte 0x80000800\n\
_080A11EC: .4byte 0xfffff000\n\
_080A11F0: .4byte 0x0000026a\n\
_080A11F4: .4byte 0x0600ecc0\n\
_080A11F8:\n\
    ldr r2, _080A12B0 @ =0x040000d4\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    ldr r0, _080A12B4 @ =0x80000800\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r3, r0\n\
    adds r4, r0\n\
    ldr r5, _080A12B8 @ =0xfffff000\n\
    adds r1, r5\n\
    cmp r1, r0\n\
    bhi _080A11F8\n\
    str r3, [r2]\n\
    str r4, [r2, 0x4]\n\
    lsrs r0, r1, 1\n\
    movs r1, 0x80\n\
    lsls r1, 24\n\
    orrs r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
_080A1224:\n\
    ldrb r4, [r6, 0x2]\n\
    ldrh r7, [r6, 0x2]\n\
    ldrh r0, [r6]\n\
    mov r12, r0\n\
    cmp r4, 0x9\n\
    bhi _080A1272\n\
    adds r3, r6, 0x4\n\
    ldr r2, _080A12B0 @ =0x040000d4\n\
    ldr r5, _080A12BC @ =0x80000001\n\
_080A1236:\n\
    lsls r1, r4, 1\n\
    ldr r6, _080A12C0 @ =0x0600e480\n\
    adds r0, r1, r6\n\
    str r3, [r2]\n\
    str r0, [r2, 0x4]\n\
    str r5, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    adds r6, 0x40\n\
    adds r0, r1, r6\n\
    str r3, [r2]\n\
    str r0, [r2, 0x4]\n\
    str r5, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    ldr r6, _080A12C4 @ =0x0600ec80\n\
    adds r0, r1, r6\n\
    str r3, [r2]\n\
    str r0, [r2, 0x4]\n\
    str r5, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    ldr r0, _080A12C8 @ =0x0600ecc0\n\
    adds r1, r0\n\
    str r3, [r2]\n\
    str r1, [r2, 0x4]\n\
    str r5, [r2, 0x8]\n\
    ldr r0, [r2, 0x8]\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x9\n\
    bls _080A1236\n\
_080A1272:\n\
    mov r1, r12\n\
    lsls r0, r1, 16\n\
    cmp r0, 0\n\
    beq _080A1286\n\
    lsls r0, r7, 16\n\
    asrs r0, 16\n\
    cmp r0, 0\n\
    ble _080A1286\n\
    cmp r0, 0x9\n\
    ble _080A12A4\n\
_080A1286:\n\
    lsls r0, r7, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x9\n\
    ble _080A129A\n\
    ldr r0, _080A12CC @ =gOtherText_Status\n\
    movs r1, 0xD\n\
    movs r2, 0x1\n\
    movs r3, 0x12\n\
    bl sub_80A1FF8\n\
_080A129A:\n\
    bl sub_80A1D18\n\
    mov r0, r8\n\
    bl DestroyTask\n\
_080A12A4:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A12B0: .4byte 0x040000d4\n\
_080A12B4: .4byte 0x80000800\n\
_080A12B8: .4byte 0xfffff000\n\
_080A12BC: .4byte 0x80000001\n\
_080A12C0: .4byte 0x0600e480\n\
_080A12C4: .4byte 0x0600ec80\n\
_080A12C8: .4byte 0x0600ecc0\n\
_080A12CC: .4byte gOtherText_Status\n\
    .syntax divided\n");
}

void sub_80A12D0(s8 a)
{
    u8 newTaskId;

    MenuZeroFillWindowRect(1, 18, 5, 19);
    sub_80A18E4(29);

    newTaskId = CreateTask(sub_80A1048, 0);
    gTasks[newTaskId].data[0] = a;

    if (a < 0)
    {
        gTasks[newTaskId].data[1] = 10;
    }
    else
    {
        gTasks[newTaskId].data[1] = 0;
    }

    gTasks[newTaskId].data[2] = 1;
}

// void sub_80A1334(u8 taskId)
// {
//     u8 i;
//     s16 var1;

//     gTasks[taskId].data[1] += gTasks[taskId].data[0];

//     var1 = 0;
//     if (gTasks[taskId].data[1] >= 0)
//     {
//         var1 = 10;
//         if (gTasks[taskId].data[1] < 10)
//         {
//             var1 = gTasks[taskId].data[1];
//         }
//     }

//     if (var1 > 0)
//     {
//         u8 *vramAddr = (u8 *)(VRAM + 0x5B40);
//         for (i = 0; i < 7; i++)
//         {
//             CpuSet(&gUnknown_08E73E88[(i + 13) * 64], vramAddr, var1 & 0x1FFFFF);
//             vramAddr += 64;
//         }
//     }

//     if (var1 <= 9)
//     {
//         u8 *vramAddr = (u8 *)(VRAM + 0x5B40);
//         for (i = 0; i < 64; i++)
//         {
//             u16 val = gTasks[taskId].data[2];
//             CpuSet(&val, vramAddr, ((10 - var1) & 0x1FFFFF) | 0x800000);
//         }
//     }
//     else
//     {
//         MenuZeroFillWindowRect(0, 19, 9, 19);
//     }

//     if (gTasks[taskId].data[0] == 0 || gTasks[taskId].data[1] < 0)
//     {
//         if (ewramSS.unkB == 2)
//         {
//             MenuZeroFillWindowRect(0, 14, 9, 18);
//             sub_80A0958(ewramSS.unk10);

//             if (GetMonStatusAndPokerus(ewramSS.unk10))
//             {
//                 sub_80A1FF8(gOtherText_Status, 13, 1, 18);
//             }

//             DestroyTask(taskId);
//         }
//     }

//     if (gTasks[taskId].data[1] > 9)
//     {
//         if (ewramSS.unkB == 2)
//         {
//             sub_80A00F4(gTasks[taskId].data[3]);
//         }

//         sub_80A0428(ewramSS.unk10, &gTasks[taskId].data[3]);
//         DestroyTask(taskId);
//     }
// }
__attribute__((naked))
void sub_80A1334(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    lsls r0, 2\n\
    add r0, r10\n\
    lsls r0, 3\n\
    ldr r1, _080A13E4 @ =gTasks + 0x8\n\
    adds r7, r0, r1\n\
    ldrh r0, [r7]\n\
    ldrh r1, [r7, 0x2]\n\
    adds r0, r1\n\
    strh r0, [r7, 0x2]\n\
    lsls r0, 16\n\
    asrs r1, r0, 16\n\
    movs r0, 0\n\
    cmp r1, 0\n\
    blt _080A136A\n\
    movs r0, 0xA\n\
    cmp r1, 0xA\n\
    bgt _080A136A\n\
    ldrh r0, [r7, 0x2]\n\
_080A136A:\n\
    lsls r0, 16\n\
    asrs r2, r0, 16\n\
    mov r9, r0\n\
    cmp r2, 0\n\
    ble _080A13A6\n\
    movs r0, 0xA\n\
    subs r0, r2\n\
    lsls r0, 1\n\
    ldr r1, _080A13E8 @ =0x06005b40\n\
    adds r4, r0, r1\n\
    movs r5, 0\n\
    adds r6, r2, 0\n\
    ldr r0, _080A13EC @ =0x001fffff\n\
    mov r8, r0\n\
_080A1386:\n\
    adds r0, r5, 0\n\
    adds r0, 0xD\n\
    lsls r0, 6\n\
    ldr r1, _080A13F0 @ =gUnknown_08E73E88\n\
    adds r0, r1\n\
    adds r1, r4, 0\n\
    mov r2, r8\n\
    ands r2, r6\n\
    bl CpuSet\n\
    adds r4, 0x40\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x6\n\
    bls _080A1386\n\
_080A13A6:\n\
    mov r1, r9\n\
    asrs r2, r1, 16\n\
    cmp r2, 0x9\n\
    bgt _080A13F4\n\
    ldr r4, _080A13E8 @ =0x06005b40\n\
    movs r5, 0\n\
    mov r8, sp\n\
    movs r0, 0xA\n\
    subs r6, r0, r2\n\
    ldr r0, _080A13EC @ =0x001fffff\n\
    ands r6, r0\n\
    movs r0, 0x80\n\
    lsls r0, 17\n\
    mov r9, r0\n\
_080A13C2:\n\
    ldrh r0, [r7, 0x4]\n\
    mov r1, r8\n\
    strh r0, [r1]\n\
    mov r0, sp\n\
    adds r1, r4, 0\n\
    mov r2, r9\n\
    orrs r2, r6\n\
    bl CpuSet\n\
    adds r4, 0x40\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x6\n\
    bls _080A13C2\n\
    b _080A1400\n\
    .align 2, 0\n\
_080A13E4: .4byte gTasks + 0x8\n\
_080A13E8: .4byte 0x06005b40\n\
_080A13EC: .4byte 0x001fffff\n\
_080A13F0: .4byte gUnknown_08E73E88\n\
_080A13F4:\n\
    movs r0, 0\n\
    movs r1, 0x13\n\
    movs r2, 0x9\n\
    movs r3, 0x13\n\
    bl MenuZeroFillWindowRect\n\
_080A1400:\n\
    movs r1, 0\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0\n\
    beq _080A1410\n\
    movs r1, 0x2\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0\n\
    bge _080A144A\n\
_080A1410:\n\
    ldr r4, _080A1480 @ =gSharedMem + 0x18000\n\
    ldrb r0, [r4, 0xB]\n\
    cmp r0, 0x2\n\
    bne _080A1444\n\
    movs r0, 0\n\
    movs r1, 0xE\n\
    movs r2, 0x9\n\
    movs r3, 0x12\n\
    bl MenuZeroFillWindowRect\n\
    adds r4, 0x10\n\
    adds r0, r4, 0\n\
    bl sub_80A0958\n\
    adds r0, r4, 0\n\
    bl GetMonStatusAndPokerus\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080A1444\n\
    ldr r0, _080A1484 @ =gOtherText_Status\n\
    movs r1, 0xD\n\
    movs r2, 0x1\n\
    movs r3, 0x12\n\
    bl sub_80A1FF8\n\
_080A1444:\n\
    mov r0, r10\n\
    bl DestroyTask\n\
_080A144A:\n\
    movs r1, 0x2\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0x9\n\
    ble _080A1470\n\
    ldr r4, _080A1480 @ =gSharedMem + 0x18000\n\
    ldrb r0, [r4, 0xB]\n\
    cmp r0, 0x2\n\
    bne _080A1460\n\
    ldrb r0, [r7, 0x6]\n\
    bl sub_80A00F4\n\
_080A1460:\n\
    adds r0, r4, 0\n\
    adds r0, 0x10\n\
    adds r1, r7, 0x6\n\
    bl sub_80A0428\n\
    mov r0, r10\n\
    bl DestroyTask\n\
_080A1470:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1480: .4byte gSharedMem + 0x18000\n\
_080A1484: .4byte gOtherText_Status\n\
    .syntax divided\n");
}

// Related to re-drawing the summary area underneath the pokemon's picture
// in all of the summary screen tabs.
void sub_80A1488(s8 a, u8 b)
{
    u8 taskId;

    if (ewramSS.unkB == 2)
    {
        MenuZeroFillWindowRect(0, 14, 9, 19);
    }

    taskId = FindTaskIdByFunc(sub_80A1334);
    if (taskId == 0xFF)
    {
        taskId = CreateTask(sub_80A1334, 0);
    }

    gTasks[taskId].data[0] = (s8)a;

    if ((s8)a < 0)
    {
        gTasks[taskId].data[1] = 10;
    }
    else
    {
        gTasks[taskId].data[1] = 0;
    }

    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = b;
}

__attribute__((naked))
void sub_80A1500(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r10, r0\n\
    lsls r0, 2\n\
    add r0, r10\n\
    lsls r0, 3\n\
    ldr r1, _080A15B0 @ =gTasks + 0x8\n\
    adds r7, r0, r1\n\
    ldrh r0, [r7]\n\
    ldrh r1, [r7, 0x2]\n\
    adds r0, r1\n\
    strh r0, [r7, 0x2]\n\
    lsls r0, 16\n\
    asrs r1, r0, 16\n\
    movs r0, 0\n\
    cmp r1, 0\n\
    blt _080A1536\n\
    movs r0, 0xA\n\
    cmp r1, 0xA\n\
    bgt _080A1536\n\
    ldrh r0, [r7, 0x2]\n\
_080A1536:\n\
    lsls r0, 16\n\
    asrs r2, r0, 16\n\
    mov r9, r0\n\
    cmp r2, 0\n\
    ble _080A1572\n\
    movs r0, 0xA\n\
    subs r0, r2\n\
    lsls r0, 1\n\
    ldr r1, _080A15B4 @ =0x06006b40\n\
    adds r4, r0, r1\n\
    movs r5, 0\n\
    adds r6, r2, 0\n\
    ldr r0, _080A15B8 @ =0x001fffff\n\
    mov r8, r0\n\
_080A1552:\n\
    adds r0, r5, 0\n\
    adds r0, 0xD\n\
    lsls r0, 6\n\
    ldr r1, _080A15BC @ =gUnknown_08E74688\n\
    adds r0, r1\n\
    adds r1, r4, 0\n\
    mov r2, r8\n\
    ands r2, r6\n\
    bl CpuSet\n\
    adds r4, 0x40\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x6\n\
    bls _080A1552\n\
_080A1572:\n\
    mov r1, r9\n\
    asrs r2, r1, 16\n\
    cmp r2, 0x9\n\
    bgt _080A15C0\n\
    ldr r4, _080A15B4 @ =0x06006b40\n\
    movs r5, 0\n\
    mov r8, sp\n\
    movs r0, 0xA\n\
    subs r6, r0, r2\n\
    ldr r0, _080A15B8 @ =0x001fffff\n\
    ands r6, r0\n\
    movs r0, 0x80\n\
    lsls r0, 17\n\
    mov r9, r0\n\
_080A158E:\n\
    ldrh r0, [r7, 0x4]\n\
    mov r1, r8\n\
    strh r0, [r1]\n\
    mov r0, sp\n\
    adds r1, r4, 0\n\
    mov r2, r9\n\
    orrs r2, r6\n\
    bl CpuSet\n\
    adds r4, 0x40\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x6\n\
    bls _080A158E\n\
    b _080A15CC\n\
    .align 2, 0\n\
_080A15B0: .4byte gTasks + 0x8\n\
_080A15B4: .4byte 0x06006b40\n\
_080A15B8: .4byte 0x001fffff\n\
_080A15BC: .4byte gUnknown_08E74688\n\
_080A15C0:\n\
    movs r0, 0\n\
    movs r1, 0x13\n\
    movs r2, 0x9\n\
    movs r3, 0x13\n\
    bl MenuZeroFillWindowRect\n\
_080A15CC:\n\
    movs r1, 0\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0\n\
    beq _080A15DC\n\
    movs r1, 0x2\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0\n\
    bge _080A1616\n\
_080A15DC:\n\
    ldr r4, _080A164C @ =gSharedMem + 0x18000\n\
    ldrb r0, [r4, 0xB]\n\
    cmp r0, 0x3\n\
    bne _080A1610\n\
    movs r0, 0\n\
    movs r1, 0xE\n\
    movs r2, 0x9\n\
    movs r3, 0x12\n\
    bl MenuZeroFillWindowRect\n\
    adds r4, 0x10\n\
    adds r0, r4, 0\n\
    bl sub_80A0958\n\
    adds r0, r4, 0\n\
    bl GetMonStatusAndPokerus\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080A1610\n\
    ldr r0, _080A1650 @ =gOtherText_Status\n\
    movs r1, 0xD\n\
    movs r2, 0x1\n\
    movs r3, 0x12\n\
    bl sub_80A1FF8\n\
_080A1610:\n\
    mov r0, r10\n\
    bl DestroyTask\n\
_080A1616:\n\
    movs r1, 0x2\n\
    ldrsh r0, [r7, r1]\n\
    cmp r0, 0x9\n\
    ble _080A163C\n\
    ldr r4, _080A164C @ =gSharedMem + 0x18000\n\
    ldrb r0, [r4, 0xB]\n\
    cmp r0, 0x3\n\
    bne _080A162C\n\
    ldrb r0, [r7, 0x6]\n\
    bl sub_80A00F4\n\
_080A162C:\n\
    adds r0, r4, 0\n\
    adds r0, 0x10\n\
    adds r1, r7, 0x6\n\
    bl sub_80A0428\n\
    mov r0, r10\n\
    bl DestroyTask\n\
_080A163C:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A164C: .4byte gSharedMem + 0x18000\n\
_080A1650: .4byte gOtherText_Status\n\
    .syntax divided\n");
}

void sub_80A1654(s8 a, u8 b)
{
    u8 taskId;

    if (ewramSS.unkB == 3)
    {
        MenuZeroFillWindowRect(0, 14, 9, 19);
    }

    taskId = FindTaskIdByFunc(sub_80A1500);
    if (taskId == 0xFF)
    {
        taskId = CreateTask(sub_80A1500, 0);
    }

    gTasks[taskId].data[0] = (s8)a;

    if ((s8)a < 0)
    {
        gTasks[taskId].data[1] = 10;
    }
    else
    {
        gTasks[taskId].data[1] = 0;
    }

    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = b;
}

#ifdef NONMATCHING
void sub_80A16CC(u8 a)
{
    u8 i;
    u16 *vramAddr = (u16 *)(VRAM + 0x6AD4);

    if (a == 0)
    {
        for (i = 0; i < 20; i++)
        {
            vramAddr[i] = gUnknown_08E94510[i] + 0x1000;
            vramAddr[i + 0x20] = gUnknown_08E94510[i] + 0x1000;
            vramAddr[i + 0x40] = gUnknown_08E94550[i] + 0x1000;
        }
    }
    else
    {
        i = 0;
        for (i = 0; i < 20; i++)
        {
            vramAddr[i] = gUnknown_08E94550[i] + 0x1000;
            vramAddr[i + 0x20] = gUnknown_08E94590[i] + 0x1000;
            vramAddr[i + 0x40] = gUnknown_08E94590[i] + 0x1000;
        }
    }

    vramAddr = (u16 *)(VRAM + 0x5AD4);

    if (a == 0)
    {
        for (i = 0; i < 20; i++)
        {
            vramAddr[i] = gUnknown_08E94510[i] + 0x3000;
            vramAddr[i + 0x20] = gUnknown_08E94510[i] + 0x3000;
            vramAddr[i + 0x40] = gUnknown_08E94550[i] + 0x3000;
        }
    }
    else
    {
        for (i = 0; i < 20; i++)
        {
            vramAddr[i] = gUnknown_08E94550[i] + 0x3000;
            vramAddr[i + 0x20] = gUnknown_08E94590[i] + 0x3000;
            vramAddr[i + 0x40] = gUnknown_08E94590[i] + 0x3000;
        }
    }
}
#else
__attribute__((naked))
void sub_80A16CC(u8 a)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r9, r0\n\
    ldr r0, _080A1724 @ =0x06006ad4\n\
    mov r12, r0\n\
    mov r1, r9\n\
    cmp r1, 0\n\
    bne _080A172C\n\
    movs r5, 0\n\
    ldr r7, _080A1728 @ =gUnknown_08E94510\n\
    movs r0, 0x80\n\
    lsls r0, 5\n\
    adds r6, r0, 0\n\
    movs r1, 0x40\n\
    adds r1, r7\n\
    mov r8, r1\n\
_080A16F4:\n\
    lsls r2, r5, 1\n\
    mov r0, r12\n\
    adds r3, r2, r0\n\
    adds r4, r2, r7\n\
    ldrh r1, [r4]\n\
    adds r0, r6, r1\n\
    strh r0, [r3]\n\
    adds r1, r3, 0\n\
    adds r1, 0x40\n\
    ldrh r4, [r4]\n\
    adds r0, r6, r4\n\
    strh r0, [r1]\n\
    adds r3, 0x80\n\
    add r2, r8\n\
    ldrh r2, [r2]\n\
    adds r0, r6, r2\n\
    strh r0, [r3]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x13\n\
    bls _080A16F4\n\
    b _080A1768\n\
    .align 2, 0\n\
_080A1724: .4byte 0x06006ad4\n\
_080A1728: .4byte gUnknown_08E94510\n\
_080A172C:\n\
    movs r5, 0\n\
    ldr r6, _080A17B0 @ =gUnknown_08E94550\n\
    movs r7, 0x80\n\
    lsls r7, 5\n\
    adds r4, r7, 0\n\
    movs r0, 0x40\n\
    adds r0, r6\n\
    mov r8, r0\n\
_080A173C:\n\
    lsls r1, r5, 1\n\
    mov r7, r12\n\
    adds r2, r1, r7\n\
    adds r0, r1, r6\n\
    ldrh r0, [r0]\n\
    adds r0, r4, r0\n\
    strh r0, [r2]\n\
    adds r3, r2, 0\n\
    adds r3, 0x40\n\
    add r1, r8\n\
    ldrh r7, [r1]\n\
    adds r0, r4, r7\n\
    strh r0, [r3]\n\
    adds r2, 0x80\n\
    ldrh r1, [r1]\n\
    adds r0, r4, r1\n\
    strh r0, [r2]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x13\n\
    bls _080A173C\n\
_080A1768:\n\
    ldr r0, _080A17B4 @ =0x06005ad4\n\
    mov r12, r0\n\
    mov r1, r9\n\
    cmp r1, 0\n\
    bne _080A17BC\n\
    movs r5, 0\n\
    ldr r7, _080A17B8 @ =gUnknown_08E94510\n\
    movs r0, 0xC0\n\
    lsls r0, 6\n\
    adds r6, r0, 0\n\
    movs r1, 0x40\n\
    adds r1, r7\n\
    mov r8, r1\n\
_080A1782:\n\
    lsls r2, r5, 1\n\
    mov r0, r12\n\
    adds r3, r2, r0\n\
    adds r4, r2, r7\n\
    ldrh r1, [r4]\n\
    adds r0, r6, r1\n\
    strh r0, [r3]\n\
    adds r1, r3, 0\n\
    adds r1, 0x40\n\
    ldrh r4, [r4]\n\
    adds r0, r6, r4\n\
    strh r0, [r1]\n\
    adds r3, 0x80\n\
    add r2, r8\n\
    ldrh r2, [r2]\n\
    adds r0, r6, r2\n\
    strh r0, [r3]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x13\n\
    bls _080A1782\n\
    b _080A17F8\n\
    .align 2, 0\n\
_080A17B0: .4byte gUnknown_08E94550\n\
_080A17B4: .4byte 0x06005ad4\n\
_080A17B8: .4byte gUnknown_08E94510\n\
_080A17BC:\n\
    movs r5, 0\n\
    ldr r6, _080A1804 @ =gUnknown_08E94550\n\
    movs r7, 0xC0\n\
    lsls r7, 6\n\
    adds r4, r7, 0\n\
    movs r0, 0x40\n\
    adds r0, r6\n\
    mov r8, r0\n\
_080A17CC:\n\
    lsls r1, r5, 1\n\
    mov r7, r12\n\
    adds r2, r1, r7\n\
    adds r0, r1, r6\n\
    ldrh r0, [r0]\n\
    adds r0, r4, r0\n\
    strh r0, [r2]\n\
    adds r3, r2, 0\n\
    adds r3, 0x40\n\
    add r1, r8\n\
    ldrh r7, [r1]\n\
    adds r0, r4, r7\n\
    strh r0, [r3]\n\
    adds r2, 0x80\n\
    ldrh r1, [r1]\n\
    adds r0, r4, r1\n\
    strh r0, [r2]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    cmp r5, 0x13\n\
    bls _080A17CC\n\
_080A17F8:\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1804: .4byte gUnknown_08E94550\n\
    .syntax divided\n");
}
#endif // NONMATCHING

u8 sub_80A1808(struct Pokemon *pokemon)
{
    u16 species;
    u8 spriteId;

    species = GetMonData(pokemon, MON_DATA_SPECIES2);
    spriteId = CreateSprite(&gUnknown_02024E8C, 40, 64, 5);

    FreeSpriteOamMatrix(&gSprites[spriteId]);

    gSprites[spriteId].data0 = species;
    gSprites[spriteId].callback = sub_80A1888;

    if (!IsPokeSpriteNotFlipped(species))
    {
        gSprites[spriteId].hFlip = 1;
    }
    else
    {
        gSprites[spriteId].hFlip = 0;
    }

    return spriteId;
}

void sub_80A1888(struct Sprite *sprite)
{
    if (!gPaletteFade.active)
    {
        sprite->callback = SpriteCallbackDummy;

        if (!GetMonData(&ewramSS.unk10, MON_DATA_IS_EGG))
        {
            PlayCry1(sprite->data0, 0);
        }
    }
}

void sub_80A18C4(void)
{
    u8 i;

    for (i = 0; i < 30; i++)
    {
        ewram1A000[i] = 0xFF;
    }
}

void sub_80A18E4(u8 a)
{
    if (ewram1A000[a] != 0xFF)
    {
        DestroySprite(&gSprites[ewram1A000[a]]);
        ewram1A000[a] = 0xFF;
    }
}

void sub_80A1918(u8 a, u8 invisible)
{
    gSprites[ewram1A000[a]].invisible = invisible;
}

void sub_80A1950(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (ewram1A000[i] == 0xFF)
        {
            ewram1A000[i] = CreateSprite(&gSpriteTemplate_83C11C0, 0, 0, 2);
        }

        sub_80A1918(i, 1);
    }
}

void sub_80A198C(u8 animNum, u8 x, u8 y, u8 d)
{
    StartSpriteAnim(&gSprites[ewram1A000[d]], animNum);

    gSprites[ewram1A000[d]].oam.paletteNum = gUnknown_083C11D8[animNum];
    gSprites[ewram1A000[d]].pos1.x = x + 16;
    gSprites[ewram1A000[d]].pos1.y = y + 8;

    sub_80A1918(d, 0);
}

void sub_80A1A30(u8 a)
{
    u8 i;
    s16 x;
    u8 subPriority = 0;

    if (ewramSS.unkB > 1)
    {
        if (a == 9)
        {
            subPriority = 1;
        }

        for (i = 0; i < 10; i++)
        {
            x = (i * 16) + 0x58;
            ewram1A000[a + i] = CreateSprite(&gSpriteTemplate_83C1280, x, 40, subPriority);

            if (i == 0)
            {
                StartSpriteAnim(&gSprites[ewram1A000[a]], 4);
            }
            else if (i == 9)
            {
                StartSpriteAnim(&gSprites[ewram1A000[a + i]], 5);
            }
            else
            {
                StartSpriteAnim(&gSprites[ewram1A000[a + i]], 6);
            }

            gSprites[ewram1A000[a + i]].callback = sub_80A1BC0;
            gSprites[ewram1A000[a + i]].data0 = a;
            gSprites[ewram1A000[a + i]].data1 = 0;
        }
    }
}

void sub_80A1B1C(u8 a)
{
    u8 i;

    for (i = 0; i < 10; i++)
    {
        sub_80A18E4(a + i);
    }
}

#ifdef NONMATCHING
void sub_80A1B40(u8 a)
{
    u8 i;
    u8 var1 = a * 3;

    StartSpriteAnim(&gSprites[ewram1A000[9]], var1 + 4);

    for (i = 0; i < 8; i++)
    {
        StartSpriteAnim(&gSprites[ewram1A000[10 + i]], var1 + 6);
    }

    StartSpriteAnim(&gSprites[ewram1A000[18]], var1 + 5);
}
#else
__attribute__((naked))
void sub_80A1B40(u8 a)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    lsls r1, r7, 1\n\
    adds r1, r7\n\
    lsls r1, 24\n\
    ldr r0, _080A1BB4 @ =gSharedMem + 0x1A009\n\
    ldrb r2, [r0]\n\
    lsls r0, r2, 4\n\
    adds r0, r2\n\
    lsls r0, 2\n\
    ldr r2, _080A1BB8 @ =gSprites\n\
    adds r0, r2\n\
    lsrs r7, r1, 24\n\
    movs r2, 0x80\n\
    lsls r2, 19\n\
    adds r1, r2\n\
    lsrs r1, 24\n\
    bl StartSpriteAnim\n\
    movs r4, 0\n\
    adds r0, r7, 0x6\n\
    lsls r0, 24\n\
    mov r8, r0\n\
_080A1B74:\n\
    ldr r6, _080A1BBC @ =gSharedMem + 0x1A00A\n\
    adds r0, r4, r6\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r5, _080A1BB8 @ =gSprites\n\
    adds r0, r5\n\
    mov r2, r8\n\
    lsrs r1, r2, 24\n\
    bl StartSpriteAnim\n\
    adds r0, r4, 0x1\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x7\n\
    bls _080A1B74\n\
    ldrb r1, [r6, 0x8]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    adds r1, r7, 0x5\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    bl StartSpriteAnim\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1BB4: .4byte gSharedMem + 0x1A009\n\
_080A1BB8: .4byte gSprites\n\
_080A1BBC: .4byte gSharedMem + 0x1A00A\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80A1BC0(struct Sprite *sprite)
{
    u8 animNum = sprite->animNum - 4;
    if (animNum < 3)
    {
        sprite->data1 = (sprite->data1 + 1) & 0x1F;

        if (sprite->data1 > 24)
        {
            sprite->invisible = 1;
        }
        else
        {
            sprite->invisible = 0;
        }
    }
    else
    {
        sprite->data1 = 0;
        sprite->invisible = 0;
    }

    if (sprite->data0 == 9)
    {
        sprite->pos2.y = ewramSS.unk79 * 16;
    }
    else
    {
        sprite->pos2.y = ewramSS.unk7A * 16;
    }
}

__attribute__((naked))
void sub_80A1C30(u8 a)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 25\n\
    lsrs r3, r0, 24\n\
    adds r4, r3, 0\n\
    adds r0, r3, 0\n\
    adds r0, 0xA\n\
    cmp r3, r0\n\
    bge _080A1C82\n\
    ldr r5, _080A1C88 @ =gSprites\n\
    movs r7, 0x5\n\
    negs r7, r7\n\
    ldr r6, _080A1C8C @ =gSharedMem + 0x1A009\n\
_080A1C50:\n\
    adds r2, r3, r6\n\
    ldrb r1, [r2]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    movs r1, 0\n\
    strh r1, [r0, 0x30]\n\
    ldrb r0, [r2]\n\
    lsls r1, r0, 4\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r5\n\
    adds r1, 0x3E\n\
    ldrb r2, [r1]\n\
    adds r0, r7, 0\n\
    ands r0, r2\n\
    strb r0, [r1]\n\
    adds r0, r3, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    adds r0, r4, 0\n\
    adds r0, 0xA\n\
    cmp r3, r0\n\
    blt _080A1C50\n\
_080A1C82:\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1C88: .4byte gSprites\n\
_080A1C8C: .4byte gSharedMem + 0x1A009\n\
    .syntax divided\n");
}

u8 pokemon_ailments_get_primary(u32 status)
{
    if (status & 0x88)
        return 1;
    if (status & 0x40)
        return 2;
    if (status & 0x7)
        return 3;
    if (status & 0x20)
        return 4;
    if (status & 0x10)
        return 5;

    return 0;
}

u8 GetMonStatusAndPokerus(struct Pokemon *mon)
{
    u8 statusAilment;

    if (GetMonData(mon, MON_DATA_HP) == 0)
    {
        return 7;
    }

    statusAilment = pokemon_ailments_get_primary(GetMonData(mon, MON_DATA_STATUS));
    if (statusAilment == 0)
    {
        if (!CheckPartyPokerus(mon, 0))
        {
            return 0;
        }
        else
        {
            return 6;
        }
    }

    return statusAilment;
}

#ifdef NONMATCHING
void sub_80A1D18(void)
{
    struct Pokemon mon;
    u8 statusAndPkrs;
    u8 statusAndPkrs2;

    sub_809F678(&mon);
    statusAndPkrs = GetMonStatusAndPokerus(&mon);

    if (statusAndPkrs)
    {
        statusAndPkrs2 = statusAndPkrs - 1;

        if (ewram1A000[29] == 0xFF)
        {
            ewram1A000[29] = CreateSprite(&gSpriteTemplate_83C1304, 64, 152, 0);
        }
    }
    else
    {
        sub_80A18E4(29);
        return;
    }

    StartSpriteAnim(&gSprites[ewram1A000[29]], statusAndPkrs2);
}
#else
__attribute__((naked))
void sub_80A1D18(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    sub sp, 0x64\n\
    mov r0, sp\n\
    bl sub_809F678\n\
    mov r0, sp\n\
    bl GetMonStatusAndPokerus\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0\n\
    beq _080A1D58\n\
    subs r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    ldr r4, _080A1D50 @ =gSharedMem + 0x1A01D\n\
    ldrb r0, [r4]\n\
    cmp r0, 0xFF\n\
    bne _080A1D60\n\
    ldr r0, _080A1D54 @ =gSpriteTemplate_83C1304\n\
    movs r1, 0x40\n\
    movs r2, 0x98\n\
    movs r3, 0\n\
    bl CreateSprite\n\
    strb r0, [r4]\n\
    b _080A1D60\n\
    .align 2, 0\n\
_080A1D50: .4byte gSharedMem + 0x1A01D\n\
_080A1D54: .4byte gSpriteTemplate_83C1304\n\
_080A1D58:\n\
    movs r0, 0x1D\n\
    bl sub_80A18E4\n\
    b _080A1D74\n\
_080A1D60:\n\
    ldr r0, _080A1D7C @ =gSharedMem + 0x1A01D\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _080A1D80 @ =gSprites\n\
    adds r0, r1\n\
    adds r1, r5, 0\n\
    bl StartSpriteAnim\n\
_080A1D74:\n\
    add sp, 0x64\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A1D7C: .4byte gSharedMem + 0x1A01D\n\
_080A1D80: .4byte gSprites\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80A1D84(struct Pokemon *mon)
{
    struct Sprite *sprite;

    sprite = sub_80F7920(0x7533, 0x7533, gSummaryScreenMonMarkingsPalette);
    gUnknown_020384F4 = sprite;

    if (sprite != NULL)
    {
        u8 markings = GetMonData(mon, MON_DATA_MARKINGS);
        StartSpriteAnim(sprite, markings);

        gUnknown_020384F4->pos1.x = 60;
        gUnknown_020384F4->pos1.y = 26;
    }
}

void sub_80A1DCC(struct Pokemon *mon)
{
    DestroySprite(gUnknown_020384F4);
    sub_80A1D84(mon);
}

void sub_80A1DE8(struct Pokemon *mon)
{
    u8 ball = ball_number_to_ball_processing_index(GetMonData(mon, MON_DATA_POKEBALL));
    sub_80478DC(ball);

    ewramSS.unkD = CreateSprite(&gBallSpriteTemplates[ball], 6, 136, 0);
    gSprites[ewramSS.unkD].callback = SpriteCallbackDummy;
    gSprites[ewramSS.unkD].oam.priority = 3;
}

u8 *sub_80A1E58(u8 *text, u8 id)
{
    if (id != 0xFF)
    {
        const u8 *ptr = gUnknown_083C15BC;
        while (*ptr != 0xFF && *ptr != id)
        {
            ptr += 4;
        }

        text[0] = EXT_CTRL_CODE_BEGIN;
        text[1] = 4;
        text[2] = ptr[1];
        text[3] = ptr[2];
        text[4] = ptr[3];

        text += 5;
    }

    return text;
}

u8 *sub_80A1E9C(u8 *dest, const u8 *src, u8 id)
{
    u8 arr[3];

    sub_8072CD4(&arr[0], &arr[1], &arr[2]);

    dest = sub_80A1E58(dest, id);
    dest = StringCopy(dest, src);

    if (id != 0xFF)
    {
        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 4;
        dest[2] = arr[0];
        dest[3] = arr[1];
        dest[4] = arr[2];
        dest[5] = 0xFF;

        dest += 5;
    }

    return dest;
}

void sub_80A1EF8(const u8 *text, u8 id, u8 left, u16 top, s32 e)
{
    sub_80A1E9C(gStringVar4, text, id);
    MenuPrint_PixelCoords(gStringVar4, left, top, (bool8)e);
}

void sub_80A1F48(const u8 *text, u8 id, u8 c, u8 d, u16 e)
{
    sub_80A1E9C(gStringVar4, text, id);
    sub_8072BD8(gStringVar4, c, d, e);
}

void sub_80A1F98(s32 value, u8 id, u8 n, u8 mode, u8 left, u16 top, s32 e)
{
    ConvertIntToDecimalStringN(gStringVar1, value, mode, n);
    sub_80A1EF8(gStringVar1, id, left, top, e);
}

void sub_80A1FF8(const u8 *text, u8 id, u8 left, u8 top)
{
    sub_80A1E9C(gStringVar4, text, id);
    MenuPrint(gStringVar4, left, top);
}

u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level)
{
    u8 buffer[12];

    dest[0] = 0x34;
    dest++;

    if (level == 0)
    {
        level = 5;
    }

    ConvertIntToDecimalString(buffer, level);
    dest = sub_80A1E9C(dest, buffer, 14);
    dest = StringCopy(dest, gOtherText_Comma);

    return dest;
}

void sub_80A2078(int taskId)
{
    gUnknown_03005CF0 = gTasks[taskId].func;
    gTasks[taskId].func = sub_80A20A8;
    gTasks[taskId].func((u8)taskId);
}

void sub_80A20A8(u8 taskId)
{
    if (sub_8055870() != TRUE)
    {
        gTasks[taskId].func = gUnknown_03005CF0;
    }
}
