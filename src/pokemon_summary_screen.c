#include "global.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "battle.h"
#include "battle_anim_813F0F4.h"
#include "contest.h"
#include "data2.h"
#include "decompress.h"
#include "event_data.h"
#include "ewram.h"
#include "item.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "move_tutor_menu.h"
#include "overworld.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "region_map.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "task.h"
#include "tv.h"
#include "scanline_effect.h"
#include "daycare.h"

static void SummaryScreen_PrintPokemonInfoLabels(void);
static void SummaryScreen_PrintPokemonSkillsLabels(void);
static void sub_809F63C(struct Pokemon *);
static void sub_809F650(struct Pokemon *);
static void sub_809F664(struct Pokemon *);
static void sub_809FE6C(struct Pokemon *);
static void sub_80A0090(struct Pokemon *);
static void sub_80A015C(struct Pokemon *);
static void sub_809DE44(void);
static void sub_809EB40(u8);
static void sub_809EBC4(void);
static void SummaryScreen_LoadPalettes(void);
static void sub_80A1D84(struct Pokemon *);
static void sub_80A18C4(void);
static bool8 LoadPokemonSummaryScreenGraphics(void);
static bool8 MonKnowsMultipleMoves(struct Pokemon *);
static void PrintSummaryWindowHeaderText(void);
static void sub_80A1DCC(struct Pokemon *);
static void sub_809FE80(void);
static void sub_80A00A4(void);
static void sub_80A0390(void);
extern u8 SummaryScreen_CreatePokemonSprite(struct Pokemon *);
static void SummaryScreen_PrintColoredIntPixelCoords(s32, u8, u8, u8, u8, u16, s32);
static void sub_80A0958(struct Pokemon *);
static void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *, u8, u8);
static void PokemonSummaryScreen_PrintEggTrainerMemo(struct Pokemon *, u8, u8);
static void SummaryScreen_PrintColoredTextPixelCoords(const u8 *, u8, u8, u16, s32);
static void SummaryScreen_PrintColoredTextCentered(const u8 *, u8, u8, u8, u16);
static void PrintHeldItemName(u16, u8, u8);
static void PrintNumRibbons(struct Pokemon *);
static void DrawExperienceProgressBar(struct Pokemon *, u8, u8);
static void SummaryScreen_DestroyTask(u8 taskId);
static void sub_80A1950(void);
static void sub_809DE64(void);
static void SummaryScreenHandleAButton(u8);
static void SummaryScreenHandleUpDownInput(u8, s8);
static bool8 SummaryScreen_CanForgetSelectedMove(u8);
static void sub_809F9D0(u8, u8);
static void SummaryScreen_MoveSelect_Cancel(u8);
static void sub_809E534(u8);
static void sub_809E83C(u8, s8);
static void sub_80A1B40(u8);
static void sub_80A2078(int);
static void SummaryScreen_MoveSelect_HandleInput(u8);
static void SummaryScreenHandleKeyInput(u8);
static void sub_80A1B1C(u8);
static void sub_80A16CC(u8);
static void sub_80A1A30(u8);
static void DrawSummaryScreenNavigationDots(void);
static void sub_80A00F4(u8);
static void sub_80A029C(struct Pokemon *);
static void sub_809FBE4(void);
static void sub_80A1500(u8);
static void sub_80A1334(u8);
extern void sub_809F43C(u8);
extern s8 sub_809F284(s8);
extern s8 sub_809F3CC(s8);
static bool8 sub_809F5F8(void);
static void sub_80A1DE8(struct Pokemon *);
static u8 SummaryScreen_LoadPokemonSprite(struct Pokemon *, u8 *);
static void DrawPokerusSurvivorDot(struct Pokemon *);
static void sub_80A12D0(s8);
static void sub_809FAC8(struct Pokemon *);
static void SummaryScreenHandleLeftRightInput(u8, s8);
static void sub_809E8F0();
static void sub_80A1654(s8, u8);
static void sub_80A1488(s8, u8);
static void SummaryScreen_PrintPokemonInfo(struct Pokemon *);
static void SummaryScreen_PrintPokemonSkills(struct Pokemon *);
static void sub_80A1918(u8, u8);
static void SummaryScreen_DrawTypeIcon(u8, u8, u8, u8);
static u16 GetMonMove(struct Pokemon *, u8);
static void sub_80A04CC(u16);
static void sub_80A057C(u16);
static void sub_80A0498(u16);
static void sub_80A046C(u16);
static void sub_80A20A8(u8);
static void SummaryScreen_GetPokemon(struct Pokemon *);
static void sub_80A1BC0(struct Sprite *sprite);
static void SummaryScreen_SpritePlayCry(struct Sprite *);
static void sub_80A0428(struct Pokemon *, u8 *);
static void sub_80A18E4(u8);
static u8 *SummaryScreen_SetTextColor(u8 *, u8);
static u8 *SummaryScreen_CopyColoredString(u8 *, const u8 *, u8);
static void sub_80A0A2C(struct Pokemon *, u8, u8);
static void SummaryScreen_PrintColoredText(const u8 *, u8, u8, u8);

extern u8 StorageSystemGetNextMonIndex(struct BoxPokemon *, u8, u8, u8);

extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gPPUpReadMasks[];
extern TaskFunc gUnknown_03005CF0;
extern struct SpriteTemplate gUnknown_02024E8C;

extern const u8 gStatusPal_Icons[];
extern const u8 gStatusGfx_Icons[];
extern const u8 gMenuSummaryPal[];
extern const u8 gMenuSummaryGfx[];
extern const u8 gMoveTypes_Gfx[];
extern const u8 gMoveTypes_Pal[];
extern const u8 gStatusScreen_Pal[];
extern const u8 gStatusScreen_Tilemap[];
extern const u8 gUnknown_08E74688[];
extern const u8 gUnknown_08E74E88[];
extern const u8 gUnknown_08E73508[];
extern const u8 gStatusScreen_Gfx[];
extern const u8 gFontDefaultPalette[];
extern const u8 gAbilityNames[][13];
extern const u8 * const gAbilityDescriptions[];
extern const u8 * const gContestEffectStrings[];
extern const struct ContestMove gContestMoves[];
extern const struct ContestEffect gContestEffects[];
extern const u16 gUnknown_08E94510[];
extern const u16 gUnknown_08E94550[];
extern const u16 gUnknown_08E94590[];
extern const u8 gUnknown_08E73E88[];

EWRAM_DATA u8 gUnknown_020384F0 = 0;
EWRAM_DATA struct Sprite *gUnknown_020384F4 = NULL;

#if ENGLISH
#include "data/text/move_descriptions_en.h"
#include "data/text/nature_names_en.h"
#elif GERMAN
#include "data/text/move_descriptions_de.h"
#include "data/text/nature_names_de.h"
#endif

static const u8 * const sPageHeaderTexts[] = {
    gEmptyString_81E72B0,
    OtherText_PokeInfo,
    OtherText_PokeSkills,
    OtherText_BattleMoves,
    OtherText_ContestMoves,
    OtherText_Switch,
    OtherText_Info,
    gOtherText_CancelNoTerminator,
};

static const union AffineAnimCmd sUnusedSpriteAffineAnim[] = {
    AFFINEANIMCMD_FRAME(0xFF00, 0x100, 0, 0),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd *const sUnsuedSpriteAffineAnimTable[] = {
    sUnusedSpriteAffineAnim,
};

static const struct OamData sOamData_83C109C = {
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_83C10A4[] = { ANIMCMD_FRAME(0, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10AC[] = { ANIMCMD_FRAME(8, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10B4[] = { ANIMCMD_FRAME(16, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10BC[] = { ANIMCMD_FRAME(24, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10C4[] = { ANIMCMD_FRAME(32, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10CC[] = { ANIMCMD_FRAME(40, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10D4[] = { ANIMCMD_FRAME(48, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10DC[] = { ANIMCMD_FRAME(56, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10E4[] = { ANIMCMD_FRAME(64, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10EC[] = { ANIMCMD_FRAME(72, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10F4[] = { ANIMCMD_FRAME(80, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C10FC[] = { ANIMCMD_FRAME(88, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1104[] = { ANIMCMD_FRAME(96, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C110C[] = { ANIMCMD_FRAME(104, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1114[] = { ANIMCMD_FRAME(112, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C111C[] = { ANIMCMD_FRAME(120, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1124[] = { ANIMCMD_FRAME(128, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C112C[] = { ANIMCMD_FRAME(136, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1134[] = { ANIMCMD_FRAME(144, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C113C[] = { ANIMCMD_FRAME(152, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1144[] = { ANIMCMD_FRAME(160, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C114C[] = { ANIMCMD_FRAME(168, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1154[] = { ANIMCMD_FRAME(176, 0), ANIMCMD_END, };

static const union AnimCmd *const sSpriteAnimTable_83C115C[] = {
    sSpriteAnim_83C10A4,
    sSpriteAnim_83C10AC,
    sSpriteAnim_83C10B4,
    sSpriteAnim_83C10BC,
    sSpriteAnim_83C10C4,
    sSpriteAnim_83C10CC,
    sSpriteAnim_83C10D4,
    sSpriteAnim_83C10DC,
    sSpriteAnim_83C10E4,
    sSpriteAnim_83C10EC,
    sSpriteAnim_83C10F4,
    sSpriteAnim_83C10FC,
    sSpriteAnim_83C1104,
    sSpriteAnim_83C110C,
    sSpriteAnim_83C1114,
    sSpriteAnim_83C111C,
    sSpriteAnim_83C1124,
    sSpriteAnim_83C112C,
    sSpriteAnim_83C1134,
    sSpriteAnim_83C113C,
    sSpriteAnim_83C1144,
    sSpriteAnim_83C114C,
    sSpriteAnim_83C1154,
};

static const struct CompressedSpriteSheet sUnknown_083C11B8 = { gMoveTypes_Gfx, 0x1700, 30002 };

static const struct SpriteTemplate sSpriteTemplate_83C11C0 = {
    .tileTag = 30002,
    .paletteTag = 30002,
    .oam = &sOamData_83C109C,
    .anims = sSpriteAnimTable_83C115C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const u8 sUnknown_PaletteNums[] = { 0xD, 0xD, 0xE, 0xE, 0xD, 0xD, 0xF, 0xE, 0xD, 0xF, 0xD, 0xE, 0xF, 0xD, 0xE, 0xE, 0xF, 0xD, 0xD, 0xE, 0xE, 0xF, 0xD };

static const struct OamData sOamData_83C11F0 = {
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_83C11F8[] = { ANIMCMD_FRAME(0, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1200[] = { ANIMCMD_FRAME(4, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1208[] = { ANIMCMD_FRAME(8, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1210[] = { ANIMCMD_FRAME(12, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1218[] = { ANIMCMD_FRAME(16, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1220[] = { ANIMCMD_FRAME(16, 0, .hFlip = TRUE), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1228[] = { ANIMCMD_FRAME(20, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1230[] = { ANIMCMD_FRAME(24, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1238[] = { ANIMCMD_FRAME(24, 0, .hFlip = TRUE), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C1240[] = { ANIMCMD_FRAME(28, 0), ANIMCMD_END, };

static const union AnimCmd *const sSpriteAnimTable_83C1248[] = {
    sSpriteAnim_83C11F8,
    sSpriteAnim_83C1200,
    sSpriteAnim_83C1208,
    sSpriteAnim_83C1210,
    sSpriteAnim_83C1218,
    sSpriteAnim_83C1220,
    sSpriteAnim_83C1228,
    sSpriteAnim_83C1230,
    sSpriteAnim_83C1238,
    sSpriteAnim_83C1240,
};

static const struct CompressedSpriteSheet sUnknown_083C1270 = { gMenuSummaryGfx, 0x400, 30000 };
static const struct CompressedSpritePalette sUnknown_083C1278 = { gMenuSummaryPal, 30000 };

static const struct SpriteTemplate sSpriteTemplate_83C1280 = {
    .tileTag = 30000,
    .paletteTag = 30000,
    .oam = &sOamData_83C11F0,
    .anims = sSpriteAnimTable_83C1248,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const struct OamData sOamData_83C1298 = {
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_83C12A0[] = { ANIMCMD_FRAME(0, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C12A8[] = { ANIMCMD_FRAME(4, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C12B0[] = { ANIMCMD_FRAME(8, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C12B8[] = { ANIMCMD_FRAME(12, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C12C0[] = { ANIMCMD_FRAME(16, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C12C8[] = { ANIMCMD_FRAME(20, 0), ANIMCMD_END, };
static const union AnimCmd sSpriteAnim_83C12D0[] = { ANIMCMD_FRAME(24, 0), ANIMCMD_END, };

static const union AnimCmd *const sSpriteAnimTable_83C12D8[] = {
    sSpriteAnim_83C12A0,
    sSpriteAnim_83C12A8,
    sSpriteAnim_83C12B0,
    sSpriteAnim_83C12B8,
    sSpriteAnim_83C12C0,
    sSpriteAnim_83C12C8,
    sSpriteAnim_83C12D0,
};

static const struct CompressedSpriteSheet sUnknown_083C12F4 = { gStatusGfx_Icons, 0x380, 30001 };
static const struct CompressedSpritePalette sUnknown_083C12FC = { gStatusPal_Icons, 30001 };

static const struct SpriteTemplate sSpriteTemplate_83C1304 = {
    .tileTag = 30001,
    .paletteTag = 30001,
    .oam = &sOamData_83C1298,
    .anims = sSpriteAnimTable_83C12D8,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

static const u16 sSummaryScreenMonMarkingsPalette[] = INCBIN_U16("graphics/summary_screen/mon_markings.gbapal");

#if ENGLISH
static const u16 gSummaryScreenTextTiles[] = INCBIN_U16("graphics/summary_screen/text.4bpp");
#elif GERMAN
extern const u16 gSummaryScreenTextTiles[];
#endif

static const u16 sSummaryScreenButtonTiles[] = INCBIN_U16("graphics/summary_screen/buttons.4bpp");

static const u16 sUnknown_083C157C[] = { RGB(26, 26, 23) };
static const u16 sUnknown_083C157E[] = { RGB(30, 30, 27) };

static void (*const sUnknown_083C1580[])(void) = {
    SummaryScreen_PrintPokemonInfoLabels,
    SummaryScreen_PrintPokemonSkillsLabels,
};

static void (*const sUnknown_083C1588[])(struct Pokemon *) = {
    sub_809F63C,
    sub_809F650,
    sub_809F664,
    sub_809F664,
};

static void (*const sUnknown_083C1598[])(struct Pokemon *) = {
    sub_809FE6C,
    sub_80A0090,
    sub_80A015C,
    sub_80A015C,
};

static const u8 sDoubleBattlePartyOrder[] = { 0, 2, 3, 1, 4, 5 };

static const u8 sUnknown_083C15AE[] = _("{STR_VAR_1}{CLEAR_TO 64}");
static const u8 sUnknown_083C15B4[] = _("{STR_VAR_1}{CLEAR_TO 72}");

struct TextColors {
    u8 id;
    u8 color;
    u8 background;
    u8 shadow;
};

// The TEXT_COLOR constants don't apply. Refer to the palette for this screen.
static const struct TextColors sSummaryScreenTextColors[] = {
    {  9,  1, 0,  2 }, // blue
    { 10,  3, 0,  4 }, // pink
    {  8,  5, 0,  6 }, // yellow
    { 11,  7, 0,  8 }, // blue2
    { 14,  9, 0, 10 }, // red
    { 12, 11, 0, 12 }, // pink2
    { 13, 13, 0, 14 }, // white
    { -1, 15, 0, 10 }, // black
};

void sub_809D844(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
#if DEBUG
    if (gLinkOpen == TRUE)
        debug_sub_8008264(gLink.recvQueue.count, 20, 1, 2, 3);
#endif
}

void sub_809D85C(void)
{
    REG_BG1HOFS = gBattle_BG1_X;
    REG_BG1VOFS = gBattle_BG1_Y;
    REG_BG2HOFS = gBattle_BG2_X;
    REG_BG2VOFS = gBattle_BG2_Y;
    REG_BG3HOFS = gBattle_BG3_X;
    REG_BG3VOFS = gBattle_BG3_Y;

    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void ShowPokemonSummaryScreen(struct Pokemon *party, u8 monIndex, u8 maxMonIndex, MainCallback callback, u8 mode)
{
    gPaletteFade.bufferTransferDisabled = 1;

    pssData.monList.partyMons = party;
    pssData.mode = mode;
    pssData.monIndex = monIndex;
    pssData.maxMonIndex = maxMonIndex;
    pssData.callback = callback;
    pssData.loadGfxState = 0;
    pssData.selectedMoveIndex = 4;
    pssData.moveToLearn = 0;
    pssData.bgToggle = 0;
    pssData.disableMoveOrderEditing = FALSE;

    if (mode >= PSS_MODE_PC_NORMAL)
        pssData.usingPC = TRUE;
    else
        pssData.usingPC = FALSE;

    switch (mode)
    {
    case PSS_MODE_NORMAL:
    case PSS_MODE_PC_NORMAL:
        pssData.firstPage = PSS_PAGE_INFO;
        pssData.lastPage = PSS_PAGE_CONTEST_MOVES;
        pssData.unk77 = 0;
        pssData.unk78 = 0;
        pssData.headerTextId = 1;
        pssData.headerActionTextId = 7;
        break;
    case PSS_MODE_NO_MOVE_ORDER_EDIT:
        pssData.firstPage = PSS_PAGE_INFO;
        pssData.lastPage = PSS_PAGE_CONTEST_MOVES;
        pssData.unk77 = 0;
        pssData.unk78 = 0;
        pssData.headerTextId = 1;
        pssData.headerActionTextId = 7;
        pssData.disableMoveOrderEditing = TRUE;
        break;
    case PSS_MODE_SELECT_MOVE:
        pssData.firstPage = PSS_PAGE_BATTLE_MOVES;
        pssData.lastPage = PSS_PAGE_CONTEST_MOVES;
        pssData.unk77 = 1;
        pssData.unk78 = 1;
        pssData.headerTextId = 3;
        pssData.headerActionTextId = 0;
        pssData.selectedMoveIndex = 0;
        break;
    case PSS_MODE_MOVES_ONLY:
    case PSS_MODE_PC_MOVES_ONLY:
        pssData.firstPage = PSS_PAGE_BATTLE_MOVES;
        pssData.lastPage = PSS_PAGE_CONTEST_MOVES;
        pssData.unk77 = 1;
        pssData.unk78 = 1;
        break;
    }

    pssData.page = pssData.firstPage;
    SetMainCallback2(sub_809DE44);
}

void ShowSelectMovePokemonSummaryScreen(struct Pokemon *party, u8 monIndex, u8 maxMonIndex, MainCallback callback, u16 move)
{
    ShowPokemonSummaryScreen(party, monIndex, maxMonIndex, callback, PSS_MODE_SELECT_MOVE);
    pssData.moveToLearn = move;
}

void sub_809DA1C(void)
{
    switch (pssData.mode)
    {
    case PSS_MODE_NORMAL:
    case PSS_MODE_PC_NORMAL:
        pssData.inputHandlingTaskId = CreateTask(SummaryScreenHandleKeyInput, 0);
        break;
    case PSS_MODE_NO_MOVE_ORDER_EDIT:
        pssData.inputHandlingTaskId = CreateTask(SummaryScreenHandleKeyInput, 0);
        break;
    case PSS_MODE_SELECT_MOVE:
    case PSS_MODE_UNKNOWN:
        pssData.inputHandlingTaskId = CreateTask(sub_809EB40, 0);
        break;
    case PSS_MODE_MOVES_ONLY:
    case PSS_MODE_PC_MOVES_ONLY:
        pssData.inputHandlingTaskId = CreateTask(SummaryScreen_MoveSelect_HandleInput, 0);
        break;
    }
}

bool8 sub_809DA84(void)
{
    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(NULL);
        ResetSpriteData();
        gMain.state++;
        break;
    case 1:
        ScanlineEffect_Stop();
        gMain.state++;
        break;
    case 2:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 3:
        DmaClearLarge(3, (void *)(VRAM + 0x0), 0x10000, 0x1000, 32);
        gMain.state++;
        break;
    case 4:
        sub_809DE64();
        gMain.state++;
        break;
    case 5:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6E6C);
        gMain.state++;
        break;
    case 6:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E6E6C);
        gMain.state++;
        break;
    case 7:
        if (MultistepInitMenuWindowContinue())
            gMain.state++;
        break;
    case 8:
        sub_809DA1C();
        gMain.state++;
        break;
    case 9:
        DmaCopy16Defvars(3, gSummaryScreenTextTiles, (void *)(VRAM + 0xD000), 320);
        DmaCopy16Defvars(3, sSummaryScreenButtonTiles, (void *)(VRAM + 0xD140), 256);
        pssData.loadGfxState = 0;
        gMain.state++;
        break;
    case 10:
        if (LoadPokemonSummaryScreenGraphics())
        {
            pssData.loadGfxState = 0;
            gMain.state++;
        }
        break;
    case 11:
        sub_80A18C4();
        gMain.state++;
        break;
    case 12:
        SummaryScreen_GetPokemon(&pssData.loadedMon);
        if (!GetMonStatusAndPokerus(&pssData.loadedMon))
            sub_80A12D0(0);
        else
            sub_80A12D0(10);
        DrawPokerusSurvivorDot(&pssData.loadedMon);
        gMain.state++;
        break;
    case 13:
        sub_80A1950();
        sub_80A1D84(&pssData.loadedMon);
        gMain.state++;
        break;
    case 14:
        sub_80A1DE8(&pssData.loadedMon);
        pssData.loadGfxState = 0;
        gMain.state++;
        break;
    case 15:
        if ((pssData.monSpriteId = SummaryScreen_LoadPokemonSprite(&pssData.loadedMon, &pssData.loadGfxState)) != 0xFF)
        {
            pssData.loadGfxState = 0;
            gMain.state++;
        }
        break;
    case 16:
        SummaryScreen_LoadPalettes();
        DrawSummaryScreenNavigationDots();
        gMain.state++;
        break;
    case 17:
        if (pssData.page <= PSS_PAGE_SKILLS)
            sUnknown_083C1580[pssData.page]();
        gMain.state++;
        break;
    case 18:
        sub_809FAC8(&pssData.loadedMon);
        gMain.state++;
        break;
    case 19:
        sUnknown_083C1598[pssData.page](&pssData.loadedMon);
        gMain.state++;
        break;
    case 20:
        if (GetMonData(&pssData.loadedMon, MON_DATA_IS_EGG))
            gBattle_BG3_X = 256;
        else
            gBattle_BG3_X = 0;
        gMain.state++;
        break;
    case 21:
        sub_809EBC4();
        if (pssData.selectedMoveIndex != 0)
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
            gMain.state++;
        break;
    default:
        SetVBlankCallback(sub_809D85C);
        BeginHardwarePaletteFade(0xFF, 0, 16, 0, 1);
        SetMainCallback2(sub_809D844);
        gPaletteFade.bufferTransferDisabled = 0;
#if DEBUG
        if (gLinkOpen == TRUE)
            debug_sub_8008218((void *)(VRAM + 0xDDE0), 0x8000, (void *)(VRAM + 0xF000), 3);
#endif
        return TRUE;
    }

    return FALSE;
}

static void sub_809DE44(void)
{
    while (sub_809DA84() != TRUE && sub_80F9344() != TRUE)
        ;
}

static void sub_809DE64(void)
{
    REG_BG0CNT = 0x1E08;
    REG_BG1CNT = 0x4801;
    REG_BG2CNT = 0x4A02;
    REG_BG3CNT = 0x5C03;

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;
    gBattle_BG2_X = 0;
    gBattle_BG2_Y = 0;
    gBattle_BG3_X = 0;
    gBattle_BG3_Y = 0;

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

static bool8 LoadPokemonSummaryScreenGraphics(void)
{
    switch (pssData.loadGfxState)
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
        LoadCompressedObjectPic(&sUnknown_083C11B8);
        break;
    case 8:
        LoadCompressedObjectPic(&sUnknown_083C1270);
        break;
    case 9:
        LoadCompressedObjectPic(&sUnknown_083C12F4);
        break;
    case 10:
        LoadCompressedObjectPalette(&sUnknown_083C12FC);
        break;
    case 11:
        LoadCompressedObjectPalette(&sUnknown_083C1278);
        break;
    case 12:
        LoadCompressedPalette(gMoveTypes_Pal, 464, 96);
        pssData.loadGfxState = 0;
        return TRUE;
    }

    pssData.loadGfxState++;
    return FALSE;
}

static void SummaryScreen_LoadPalettes(void)
{
    LoadPalette(gUnknownPalette_81E6692 + 14, 129, 2);
    LoadPalette(gUnknownPalette_81E6692 + 15, 136, 2);
    LoadPalette(gUnknownPalette_81E6692 + 14, 143, 2);
    LoadPalette(gUnknownPalette_81E6692 + 15, 137, 2);
    LoadPalette(gUnknownPalette_81E6692 + 6,  209, 4);
    LoadPalette(gUnknownPalette_81E6692 + 10, 211, 4);
    LoadPalette(gUnknownPalette_81E6692 + 14, 213, 4);
    LoadPalette(gUnknownPalette_81E6692 + 6,  215, 4);
    LoadPalette(gUnknownPalette_81E6692 + 4,  217, 4);
    LoadPalette(gUnknownPalette_81E6692 + 8,  219, 4);
    LoadPalette(gUnknownPalette_81E6692 + 2,  221, 2);
    LoadPalette(gUnknownPalette_81E6692 + 3,  222, 2);
    LoadPalette(gUnknownPalette_81E6692 + 1,  223, 2);
    LoadPalette(gFontDefaultPalette,          240, 32);
    LoadPalette(gUnknownPalette_81E6692 + 3,  249, 2);
}

static void SummaryScreenExit(u8 taskId)
{
    PlaySE(SE_SELECT);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = SummaryScreen_DestroyTask;
}

static void SummaryScreen_DestroyTask(u8 taskId)
{
    if (sub_8055870() != TRUE && !gPaletteFade.active)
    {
        gUnknown_020384F0 = pssData.monIndex;

        ResetSpriteData();
        FreeAllSpritePalettes();
        StopCryAndClearCrySongs();
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
        SetMainCallback2(pssData.callback);
        DestroyTask(taskId);
    }
}

static void SummaryScreenHandleKeyInput(u8 taskId)
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
        if (pssData.page >= PSS_PAGE_BATTLE_MOVES)
            SummaryScreenHandleAButton(taskId);
        if (pssData.page == PSS_PAGE_INFO)
            SummaryScreenExit(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        SummaryScreenExit(taskId);
    }
}

static void sub_809E260(u8 taskId)
{
    if (gPaletteFade.active)
        return;

    if (gMain.newKeys & DPAD_UP)
    {
        gTasks[taskId].data[0] = 4;
        sub_809E8F0(taskId, -1, &pssData.selectedMoveIndex);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        gTasks[taskId].data[0] = 4;
        sub_809E8F0(taskId, 1, &pssData.selectedMoveIndex);
    }
    else if ((gMain.newKeys & DPAD_LEFT) || sub_80F9284() == 1)
    {
        if (pssData.page == PSS_PAGE_CONTEST_MOVES && (pssData.selectedMoveIndex != 4 || pssData.moveToLearn != 0))
            Menu_EraseWindowRect(0, 14, 9, 18);
        SummaryScreenHandleLeftRightInput(taskId, -1);
    }
    else if ((gMain.newKeys & DPAD_RIGHT) || sub_80F9284() == 2)
    {
        if (pssData.page != pssData.lastPage)
        {
            if (pssData.page == PSS_PAGE_BATTLE_MOVES && (pssData.selectedMoveIndex != 4 || pssData.moveToLearn != 0))
                Menu_EraseWindowRect(0, 14, 9, 18);
            SummaryScreenHandleLeftRightInput(taskId, 1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (SummaryScreen_CanForgetSelectedMove(taskId) == TRUE || pssData.selectedMoveIndex == 4)
        {
            pssData.switchMoveIndex = pssData.selectedMoveIndex;
            gSpecialVar_0x8005 = pssData.switchMoveIndex;
            SummaryScreenExit(taskId);
        }
        else
        {
            PlaySE(SE_HAZURE);
            sub_809F9D0(taskId, pssData.selectedMoveIndex);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        pssData.switchMoveIndex = 4;
        gSpecialVar_0x8005 = pssData.switchMoveIndex;
        SummaryScreenExit(taskId);
    }
}

static void SummaryScreen_MoveSelect_HandleInput(u8 taskId)
{
    if (gPaletteFade.active)
        return;

    if (gMain.newKeys & DPAD_UP)
    {
        gTasks[taskId].data[0] = 4;
        sub_809E8F0(taskId, -1, &pssData.selectedMoveIndex);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        gTasks[taskId].data[0] = 4;
        sub_809E8F0(taskId, 1, &pssData.selectedMoveIndex);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        if (pssData.selectedMoveIndex != 4 && !pssData.disableMoveOrderEditing)
        {
            if (!MonKnowsMultipleMoves(&pssData.loadedMon))
            {
                PlaySE(SE_HAZURE);
            }
            else
            {
                PlaySE(SE_SELECT);

                pssData.switchMoveIndex = pssData.selectedMoveIndex;
                sub_80A1B40(1);
                sub_80A1A30(19);

                gTasks[taskId].func = sub_809E534;
            }
        }
        else
        {
            PlaySE(SE_SELECT);
            SummaryScreen_MoveSelect_Cancel(taskId);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        SummaryScreen_MoveSelect_Cancel(taskId);
    }

}

static bool8 MonKnowsMultipleMoves(struct Pokemon *mon)
{
    u8 i;

    for (i = 1; i < 4; i++)
    {
        if (GetMonMove(mon, i))
            return TRUE;
    }

    return FALSE;
}

static void sub_809E534(u8 taskId)
{
    if (gMain.newKeys & DPAD_UP)
    {
        gTasks[taskId].data[0] = 3;
        sub_809E8F0(taskId, -1, &pssData.switchMoveIndex);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        gTasks[taskId].data[0] = 3;
        sub_809E8F0(taskId, 1, &pssData.switchMoveIndex);
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

static void SummaryScreen_SwapMoves_Party(void)
{
    struct Pokemon *party = pssData.monList.partyMons;
    struct Pokemon *pkmn = &party[pssData.monIndex];
    u8 moveIndex1 = pssData.selectedMoveIndex;
    u8 moveIndex2 = pssData.switchMoveIndex;

    u16 move1 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex1);
    u16 move2 = GetMonData(pkmn, MON_DATA_MOVE1 + moveIndex2);
    u8 move1pp = GetMonData(pkmn, MON_DATA_PP1 + moveIndex1);
    u8 move2pp = GetMonData(pkmn, MON_DATA_PP1 + moveIndex2);
    u8 ppBonuses = GetMonData(pkmn, MON_DATA_PP_BONUSES);

    // Swap PP bonuses
    u8 r9 = gPPUpReadMasks[moveIndex1];
    u8 r2 = (ppBonuses & r9) >> (moveIndex1 * 2);
    u8 r3 = gPPUpReadMasks[moveIndex2];
    u8 r1 = (ppBonuses & r3) >> (moveIndex2 * 2);
    ppBonuses &= ~r9;
    ppBonuses &= ~r3;
    ppBonuses |= (r2 << (moveIndex2 * 2)) + (r1 << (moveIndex1 * 2));

    // Swap the moves
    SetMonData(pkmn, MON_DATA_MOVE1 + moveIndex1, &move2);
    SetMonData(pkmn, MON_DATA_MOVE1 + moveIndex2, &move1);
    SetMonData(pkmn, MON_DATA_PP1 + moveIndex1, &move2pp);
    SetMonData(pkmn, MON_DATA_PP1 + moveIndex2, &move1pp);
    SetMonData(pkmn, MON_DATA_PP_BONUSES, &ppBonuses);
}

static void SummaryScreen_SwapMoves_Box(void)
{
    struct BoxPokemon *boxMons = pssData.monList.boxMons;
    struct BoxPokemon *pkmn = &boxMons[pssData.monIndex];
    u8 moveIndex1 = pssData.selectedMoveIndex;
    u8 moveIndex2 = pssData.switchMoveIndex;

    u16 move1 = GetBoxMonData(pkmn, MON_DATA_MOVE1 + moveIndex1);
    u16 move2 = GetBoxMonData(pkmn, MON_DATA_MOVE1 + moveIndex2);
    u8 move1pp = GetBoxMonData(pkmn, MON_DATA_PP1 + moveIndex1);
    u8 move2pp = GetBoxMonData(pkmn, MON_DATA_PP1 + moveIndex2);
    u8 ppBonuses = GetBoxMonData(pkmn, MON_DATA_PP_BONUSES);

    // Swap PP bonuses
    u8 r9 = gPPUpReadMasks[moveIndex1];
    u8 r2 = (ppBonuses & r9) >> (moveIndex1 * 2);
    u8 r3 = gPPUpReadMasks[moveIndex2];
    u8 r1 = (ppBonuses & r3) >> (moveIndex2 * 2);
    ppBonuses &= ~r9;
    ppBonuses &= ~r3;
    ppBonuses |= (r2 << (moveIndex2 * 2)) + (r1 << (moveIndex1 * 2));

    // Swap the moves
    SetBoxMonData(pkmn, MON_DATA_MOVE1 + moveIndex1, &move2);
    SetBoxMonData(pkmn, MON_DATA_MOVE1 + moveIndex2, &move1);
    SetBoxMonData(pkmn, MON_DATA_PP1 + moveIndex1, &move2pp);
    SetBoxMonData(pkmn, MON_DATA_PP1 + moveIndex2, &move1pp);
    SetBoxMonData(pkmn, MON_DATA_PP_BONUSES, &ppBonuses);
}

void sub_809E7F0(u8 taskId)
{
    if (sub_809F5F8())
    {
        pssData.loadGfxState = 0;
        sub_80A0428(&pssData.loadedMon, &pssData.selectedMoveIndex);
        gTasks[taskId].func = SummaryScreen_MoveSelect_HandleInput;
        sub_80A2078(taskId);
    }
}

static void sub_809E83C(u8 taskId, s8 b)
{
    PlaySE(SE_SELECT);

    sub_80A1B1C(19);
    sub_80A1B40(0);

    if (b == 1)
    {
        if (pssData.selectedMoveIndex != pssData.switchMoveIndex)
        {
            if (pssData.usingPC == FALSE)
                SummaryScreen_SwapMoves_Party();
            else
                SummaryScreen_SwapMoves_Box();

            pssData.selectedMoveIndex = pssData.switchMoveIndex;
            SummaryScreen_GetPokemon(&pssData.loadedMon);
            pssData.loadGfxState = 1;

            gTasks[taskId].func = sub_809E7F0;
            return;
        }
    }
    else
    {
        sub_80A0428(&pssData.loadedMon, &pssData.selectedMoveIndex);
    }

    gTasks[taskId].func = SummaryScreen_MoveSelect_HandleInput;
    sub_80A2078(taskId);
}

NAKED
static void sub_809E8F0(/*u8 taskId, s8 direction, u8 *c*/)
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

static void SummaryScreenHandleAButton(u8 taskId)
{
    PlaySE(SE_SELECT);

    pssData.selectedMoveIndex = 0;
    sub_80A1488(2, 0);
    sub_80A1654(2, 0);

    if (!pssData.disableMoveOrderEditing)
    {
        pssData.headerActionTextId = 5;
        PrintSummaryWindowHeaderText();
    }

    sub_80A16CC(0);
    sub_80A029C(&pssData.loadedMon);
    sub_80A1A30(9);

    gTasks[taskId].func = SummaryScreen_MoveSelect_HandleInput;
    sub_80A2078(taskId);
}

static void SummaryScreen_MoveSelect_Cancel(u8 taskId)
{
    if (pssData.selectedMoveIndex != 4)
    {
        sub_80A1488(-2, 0);
        sub_80A1654(-2, 0);
    }

    sub_80A1B1C(9);
    sub_80A16CC(1);

    Menu_EraseWindowRect(15, 12, 28, 13);
    Menu_EraseWindowRect(11, 15, 28, 18);

    pssData.headerActionTextId = 6;
    PrintSummaryWindowHeaderText();

    gTasks[taskId].func = SummaryScreenHandleKeyInput;
}

static void sub_809EB40(u8 taskId)
{
    switch (gTasks[taskId].data[0])
    {
    case 5:
        sub_80A1A30(9);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = sub_809E260;
        break;
    case 0:
        pssData.selectedMoveIndex = 0;
        if (pssData.moveToLearn != 0)
        {
            sub_80A1488(10, 0);
            sub_80A1654(10, pssData.selectedMoveIndex);
        }

        sub_80A16CC(0);
        sub_80A029C(&pssData.loadedMon);
        // fall through
    default:
        gTasks[taskId].data[0]++;
        break;
    }
}

static void sub_809EBC4(void)
{
    if (pssData.page != PSS_PAGE_INFO)
    {
        DrawSummaryScreenNavigationDots();
        gBattle_BG1_X = 0x100;

        if (pssData.page == PSS_PAGE_SKILLS)
            REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0x800;

        if (pssData.page == PSS_PAGE_BATTLE_MOVES)
            REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0xA00;

        if (pssData.page == PSS_PAGE_CONTEST_MOVES)
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
        if (pssData.bgToggle == 0)
        {
            if (pssData.page != PSS_PAGE_INFO)
                gBattle_BG2_X = 0x100;

            if (pssData.page == PSS_PAGE_SKILLS)
                REG_BG2CNT = (REG_BG2CNT & 0xE0FF) + 0x800;

            if (pssData.page == PSS_PAGE_BATTLE_MOVES)
                REG_BG2CNT = (REG_BG2CNT & 0xE0FF) + 0xA00;
        }
        else
        {
            if (pssData.page != PSS_PAGE_INFO)
                gBattle_BG1_X = 0x100;

            if (pssData.page == PSS_PAGE_SKILLS)
                REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0x800;

            if (pssData.page == PSS_PAGE_BATTLE_MOVES)
                REG_BG1CNT = (REG_BG1CNT & 0xE0FF) + 0xA00;
        }

        taskData[0]++;
        break;
    case 1:
        if (pssData.bgToggle == 0)
        {
            int var2 = gBattle_BG1_X - 0x20;
            gBattle_BG1_X = var2;
            if (var2 << 16 == 0)
            {
                REG_BG1CNT = (REG_BG1CNT & 0xFFFC) + 2;
                REG_BG2CNT = (REG_BG2CNT & 0xFFFC) + 1;
                taskData[0]++;
            }
        }
        else
        {
            int var2 = gBattle_BG2_X - 0x20;
            gBattle_BG2_X = var2;
            if (var2 << 16 == 0)
            {
                REG_BG1CNT = (REG_BG1CNT & 0xFFFC) + 1;
                REG_BG2CNT = (REG_BG2CNT & 0xFFFC) + 2;
                taskData[0]++;
            }
        }
        break;
    case 2:
        pssData.headerTextId = pssData.page + 1;
        minus2 = pssData.mode - 2;
        if (minus2 < 2)
        {
            pssData.headerActionTextId = 0;
            sub_80A029C(&pssData.loadedMon);
            sub_80A0428(&pssData.loadedMon, &pssData.selectedMoveIndex);
            sub_80A00F4(pssData.selectedMoveIndex);
        }
        else
        {
            if (pssData.page >= PSS_PAGE_BATTLE_MOVES && (!pssData.disableMoveOrderEditing || pssData.mode == PSS_MODE_NO_MOVE_ORDER_EDIT))
                pssData.headerActionTextId = 6;
            else if (pssData.page == PSS_PAGE_INFO)
                pssData.headerActionTextId = 7;
            else
                pssData.headerActionTextId = 0;
        }
        taskData[0]++;
        break;
    case 3:
        DrawSummaryScreenNavigationDots();
        PrintSummaryWindowHeaderText();
        taskData[0]++;
        break;
    case 4:
        sUnknown_083C1598[pssData.page](&pssData.loadedMon);
        pssData.bgToggle ^= 1;
        taskData[0]++;
        break;
    case 5:
        if (sub_8055870() != TRUE)
            gTasks[taskId].func = gUnknown_03005CF0;
        break;
    }
}

void sub_809EE74(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    switch (taskData[0])
    {
    case 0:
        if (pssData.bgToggle == 0)
        {
            gBattle_BG2_X = 0;
            taskData[0]++;
        }
        else
        {
            gBattle_BG1_X = 0;
            taskData[0]++;
        }
        break;
    case 1:
        if (pssData.bgToggle == 0)
        {
            if (pssData.page == PSS_PAGE_SKILLS)
                REG_BG2CNT = (REG_BG2CNT & 0xE0FC) + 0x801;

            if (pssData.page == PSS_PAGE_BATTLE_MOVES)
                REG_BG2CNT = (REG_BG2CNT & 0xE0FC) + 0xA01;

            if (pssData.page == PSS_PAGE_CONTEST_MOVES)
                REG_BG2CNT = (REG_BG2CNT & 0xE0FC) + 0xC01;

            REG_BG1CNT = (REG_BG1CNT & 0xFFFC) + 2;
        }
        else
        {
            if (pssData.page == PSS_PAGE_SKILLS)
                REG_BG1CNT = (REG_BG1CNT & 0xE0FC) + 0x801;

            if (pssData.page == PSS_PAGE_BATTLE_MOVES)
                REG_BG1CNT = (REG_BG1CNT & 0xE0FC) + 0xA01;

            if (pssData.page == PSS_PAGE_CONTEST_MOVES)
                REG_BG1CNT = (REG_BG1CNT & 0xE0FC) + 0xC01;

            REG_BG2CNT = (REG_BG2CNT & 0xFFFC) + 2;
        }

        taskData[0]++;
        break;
    case 2:
        if (pssData.bgToggle == 0)
        {
            gBattle_BG2_X += 32;
            if (gBattle_BG2_X == 0x100)
                taskData[0]++;
        }
        else
        {
            gBattle_BG1_X += 32;
            if (gBattle_BG1_X == 0x100)
                taskData[0]++;
        }
        break;
    case 3:
        pssData.headerTextId = pssData.page + 1;
        if (pssData.mode == 2 || pssData.mode == 3)
        {
            pssData.headerActionTextId = 0;
            sub_80A029C(&pssData.loadedMon);
            sub_80A0428(&pssData.loadedMon, &pssData.selectedMoveIndex);
            sub_80A00F4(pssData.selectedMoveIndex);
        }
        else
        {
            if (pssData.page >= PSS_PAGE_BATTLE_MOVES && (!pssData.disableMoveOrderEditing || pssData.mode == PSS_MODE_NO_MOVE_ORDER_EDIT))
                pssData.headerActionTextId = 6;
            else if (pssData.page == PSS_PAGE_INFO)
                pssData.headerActionTextId = 7;
            else
                pssData.headerActionTextId = 0;
        }
        taskData[0]++;
        break;
    case 4:
        DrawSummaryScreenNavigationDots();
        PrintSummaryWindowHeaderText();
        taskData[0]++;
        break;
    case 5:
        sUnknown_083C1598[pssData.page](&pssData.loadedMon);
        pssData.bgToggle ^= 1;
        taskData[0]++;
        break;
    case 6:
        if (sub_8055870() != TRUE)
            gTasks[taskId].func = gUnknown_03005CF0;
        break;
    }
}

void sub_809F0D0(u8 taskId, s8 direction)
{
    pssData.page += direction;
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

static void SummaryScreenHandleLeftRightInput(u8 taskId, s8 direction)
{
    if (!GetMonData(&pssData.loadedMon, MON_DATA_IS_EGG))
    {
        if (direction == -1 && pssData.page == pssData.firstPage)
            return;
        if (direction ==  1 && pssData.page == pssData.lastPage)
            return;
        if (FindTaskIdByFunc(sub_80A1334) == 0xFF && FindTaskIdByFunc(sub_80A1500) == 0xFF)
        {
            PlaySE(SE_SELECT);
            sub_809F0D0(taskId, direction);
        }
    }
}

#ifdef NONMATCHING
static void SummaryScreenHandleUpDownInput(u8 taskId, s8 direction)
{
    s8 var3;
    u8 var1 = direction;

    if (pssData.usingPC == TRUE)
    {
        if (pssData.page != PSS_PAGE_INFO)
        {
            var1 = (direction == 1) ? 0 : 1;
        }
        else
        {
            var1 = (direction == 1) ? 2 : 3;
        }

        var3 = StorageSystemGetNextMonIndex(pssData.monList.boxMons, pssData.monIndex, pssData.maxMonIndex, var1);
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
        PlaySE(SE_SELECT);
        if (GetMonStatusAndPokerus(&pssData.loadedMon))
        {
            sub_80A12D0(-2);
        }

        pssData.monIndex = var3;
        pssData.unk84 = gTasks[taskId].func;
        gTasks[taskId].func = sub_809F43C;
    }
}
#else
NAKED
static void SummaryScreenHandleUpDownInput(u8 taskId, s8 direction)
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

#ifdef NONMATCHING
s8 sub_809F284(s8 a)
{
    struct Pokemon *mons = pssData.monList.partyMons;
    s8 r6 = 0;

    if (pssData.page == PSS_PAGE_INFO)
    {
        if (a == -1 && pssData.monIndex == 0)
            return -1;
        if (a == 1 && pssData.monIndex >= pssData.maxMonIndex)
            return -1;
        return pssData.monIndex + a;
    }
    else
    {
        do
        {
            r6 += a;
            if (pssData.monIndex + r6 < 0 || pssData.monIndex + r6 > pssData.maxMonIndex)
                return -1;
        } while (GetMonData(&mons[pssData.monIndex + r6], MON_DATA_IS_EGG) != 0);
        return pssData.monIndex + r6;
    }
}
#else
NAKED
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
#endif // NONMATCHING

bool8 sub_809F310(struct Pokemon *mon)
{
    if (GetMonData(mon, MON_DATA_SPECIES))
    {
        if (pssData.page != PSS_PAGE_INFO || !GetMonData(mon, MON_DATA_IS_EGG))
            return TRUE;
    }
    return FALSE;
}

s8 sub_809F344(u8 partyIndex)
{
    while (1)
    {
        partyIndex++;
        if (partyIndex == PARTY_SIZE)
            return -1;
        if (sub_809F310(&gPlayerParty[sDoubleBattlePartyOrder[partyIndex]]) == TRUE)
            return sDoubleBattlePartyOrder[partyIndex];
    }
}

s8 sub_809F388(u8 partyIndex)
{
    while (1)
    {
        if (partyIndex == 0)
            return -1;
        partyIndex--;
        if (sub_809F310(&gPlayerParty[sDoubleBattlePartyOrder[partyIndex]]) == TRUE)
            return sDoubleBattlePartyOrder[partyIndex];
    }
}

s8 sub_809F3CC(s8 direction)
{
    u8 i;
    u8 monIndex = 0;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (sDoubleBattlePartyOrder[i] == pssData.monIndex)
        {
            monIndex = i;
            break;
        }
    }

    if ((direction == -1 && monIndex == 0) || (direction == 1 && monIndex == 5))
        return -1;
    if (direction != 1)
        return sub_809F388(monIndex);
    else if (monIndex != 5)
        return sub_809F344(monIndex);

    return -1;
}

void sub_809F43C(u8 taskId)
{
    switch (gMain.state)
    {
    case 0:
        StopCryAndClearCrySongs();
        gMain.state++;
        break;
    case 1:
        DestroySpriteAndFreeResources(&gSprites[pssData.monSpriteId]);
        gMain.state++;
        break;
    case 2:
        DestroySpriteAndFreeResources(&gSprites[pssData.ballSpriteId]);
        gMain.state++;
        break;
    case 3:
        pssData.loadGfxState = 0;
        pssData.selectedMoveIndex = 0;
        gMain.state++;
        break;
    case 4:
        SummaryScreen_GetPokemon(&pssData.loadedMon);
        if (GetMonStatusAndPokerus(&pssData.loadedMon))
            sub_80A12D0(2);
        DrawPokerusSurvivorDot(&pssData.loadedMon);
        gMain.state++;
        break;
    case 5:
        if ((pssData.monSpriteId = SummaryScreen_LoadPokemonSprite(&pssData.loadedMon, &pssData.loadGfxState)) != 0xFF)
        {
            pssData.loadGfxState = 0;
            if (GetMonData(&pssData.loadedMon, MON_DATA_IS_EGG))
                gBattle_BG3_X = 256;
            else
                gBattle_BG3_X = 0;
            gMain.state++;
        }
        break;
    case 6:
        sub_80A1DCC(&pssData.loadedMon);
        gMain.state++;
        break;
    case 7:
        sub_80A1DE8(&pssData.loadedMon);
        gMain.state++;
        break;
    case 8:
        if (sub_809F5F8())
        {
            pssData.loadGfxState = 0;
            gMain.state++;
        }
        break;
    default:
        if (sub_8055870() != TRUE)
        {
            gMain.state = 0;
            gTasks[taskId].func = pssData.unk84;
        }
        break;
    }
}

static bool8 sub_809F5F8(void)
{
    if (pssData.loadGfxState == 0)
    {
        sub_809FAC8(&pssData.loadedMon);
        pssData.loadGfxState++;
        return FALSE;
    }
    else
    {
        sUnknown_083C1588[pssData.page](&pssData.loadedMon);
        return TRUE;
    }
}

static void sub_809F63C(struct Pokemon *mon)
{
    sub_809FE80();
    SummaryScreen_PrintPokemonInfo(mon);
}

static void sub_809F650(struct Pokemon *mon)
{
    sub_80A00A4();
    SummaryScreen_PrintPokemonSkills(mon);
}

static void sub_809F664(struct Pokemon *mon)
{
    sub_80A0390();
    sub_80A015C(mon);
}

static void SummaryScreen_GetPokemon(struct Pokemon *mon)
{
    if (!pssData.usingPC)
    {
        struct Pokemon *mons = pssData.monList.partyMons;
        *mon = mons[pssData.monIndex];
    }
    else
    {
        struct BoxPokemon *mons = pssData.monList.boxMons;
        ExpandBoxMon(&mons[pssData.monIndex], mon);
    }
}

static u8 SummaryScreen_LoadPokemonSprite(struct Pokemon *mon, u8 *state)
{
    u16 species;
    u32 personality;
    u32 otId;
    const struct CompressedSpritePalette *palette;

    switch (*state)
    {
    default:
        return SummaryScreen_CreatePokemonSprite(mon);
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
        *state += 1;
        return 0xFF;
    case 1:
        species = GetMonData(mon, MON_DATA_SPECIES2);
        personality = GetMonData(mon, MON_DATA_PERSONALITY);
        otId = GetMonData(mon, MON_DATA_OT_ID);

        palette = GetMonSpritePalStructFromOtIdPersonality(species, otId, personality);
        LoadCompressedObjectPalette(palette);
        GetMonSpriteTemplate_803C56C(palette->tag, 1);
        *state += 1;
        return 0xFF;
    }
}

static u16 GetMonMove(struct Pokemon *mon, u8 moveId)
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

static bool8 SummaryScreen_CanForgetSelectedMove(u8 taskId)
{
    struct Pokemon mon;
    u16 move;

    SummaryScreen_GetPokemon(&mon);
    move = GetMonMove(&mon, pssData.selectedMoveIndex);
    if (IsHMMove(move) == TRUE && pssData.mode != PSS_MODE_UNKNOWN)
        return FALSE;
    return TRUE;
}

void sub_809F814(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    if (taskData[14] < 4)
    {
        taskData[14]++;
    }
    else if (gMain.newKeys & DPAD_UP)
    {
        gTasks[taskId].func = sub_809E260;
        taskData[0] = 4;
        taskData[13] = 1;
        pssData.selectedMoveIndex = taskData[15];
        sub_809E8F0(taskId, -1, &pssData.selectedMoveIndex);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        gTasks[taskId].func = sub_809E260;
        taskData[0] = 4;
        taskData[13] = 1;
        pssData.selectedMoveIndex = taskData[15];
        sub_809E8F0(taskId, 1, &pssData.selectedMoveIndex);
    }
    else if ((gMain.newKeys & DPAD_LEFT) || sub_80F9284() == 1)
    {
        if (pssData.page != PSS_PAGE_BATTLE_MOVES)
        {
            if (pssData.page == PSS_PAGE_CONTEST_MOVES && (pssData.selectedMoveIndex != 4 || pssData.moveToLearn != 0))
                Menu_EraseWindowRect(0, 14, 9, 18);

            gTasks[taskId].func = sub_809E260;

            SummaryScreenHandleLeftRightInput(taskId, -1);
            sub_80A1488(1, taskData[15]);
            sub_80A1654(1, taskData[15]);
        }
    }
    else if ((gMain.newKeys & DPAD_RIGHT) || sub_80F9284() == 2)
    {
        if (pssData.page != pssData.lastPage)
        {
            if (pssData.page == PSS_PAGE_BATTLE_MOVES && (pssData.selectedMoveIndex != 4 || pssData.moveToLearn != 0))
                Menu_EraseWindowRect(0, 14, 9, 18);

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

static void sub_809F9D0(u8 taskId, u8 moveIndex)
{
    s16 *taskData = gTasks[taskId].data;
    taskData[14] = 0;
    taskData[15] = moveIndex;

    sub_80A1488(-2, 4);
    sub_80A1654(-2, 4);
    Menu_EraseWindowRect(11, 15, 28, 18);
    Menu_PrintText(gOtherText_CantForgetHMs, 11, 15);

    gTasks[taskId].func = sub_809F814;
}

u8 sub_809FA30(void)
{
    return pssData.switchMoveIndex;
}

static void SummaryScreen_PlaceTextTile(u8 tile, u8 palette, u8 x, u8 y)
{
    u16 *vramAddr = (u16 *)(VRAM + 0xF000) + x + y * 32;
    vramAddr[0] = (palette << 12) + 0x200 + tile * 2 + 0x80;
    vramAddr[32] = (palette << 12) + 0x200 + tile * 2 + 0x81;
}

static void SummaryScreen_PlaceTextTile_White(u8 tile, u8 x, u8 y)
{
    SummaryScreen_PlaceTextTile(tile, 15, x, y);
}

bool8 sub_809FA94(struct Pokemon *mon)
{
    if (!IsShiny(mon))
    {
        LoadPalette(sUnknown_083C157C, 4, 2);
        return FALSE;
    }
    else
    {
        LoadPalette(sUnknown_083C157E, 4, 2);
        return TRUE;
    }
}

static void sub_809FAC8(struct Pokemon *mon)
{
    bool8 shiny;
    u16 dexNum;
    u8 *buffer;

    if (GetMonData(mon, MON_DATA_IS_EGG))
    {
        Menu_EraseWindowRect(1, 2, 4, 3);
        Menu_EraseWindowRect(3, 16, 9, 17);
        Menu_EraseWindowRect(0, 12, 11, 15);
        GetMonNickname(mon, gStringVar1);
        SummaryScreen_PrintColoredText(gStringVar1, 13, 3, 16);
        LoadPalette(sUnknown_083C157C, 4, 2);
    }
    else
    {
        shiny = sub_809FA94(mon);
        dexNum = SpeciesToPokedexNum(GetMonData(mon, MON_DATA_SPECIES));
        if (dexNum != 0xFFFF)
        {
            if (!shiny)
            {
                SummaryScreen_PlaceTextTile_White(2, 1, 2);
                SummaryScreen_PrintColoredIntPixelCoords(dexNum, 13, 3, 2, 17, 16, 1);
            }
            else
            {
                SummaryScreen_PlaceTextTile(2, 8, 1, 2);
                SummaryScreen_PrintColoredIntPixelCoords(dexNum, 8, 3, 2, 17, 16, 1);
            }
        }
        else
        {
            Menu_EraseWindowRect(1, 2, 4, 3);
        }

        buffer = gStringVar1;
        buffer = SummaryScreen_SetTextColor(buffer, 13);
        buffer = GetMonNickname(mon, buffer);
        buffer[0] = EXT_CTRL_CODE_BEGIN;
        buffer[1] = 0x13;
        buffer[2] = 0x3C;
        buffer[3] = EOS;
        Menu_PrintText(gStringVar1, 1, 12);

        sub_80A0958(mon);
    }
}

static void sub_809FBE4(void)
{
    u8 i;

    for (i = 0; i < 28; i++)
        sub_80A1918(i, 1);

    Menu_EraseWindowRect(11, 4, 29, 18);
}

static void SummaryScreen_PrintPokemonInfoLabels(void)
{
    Menu_PrintText(gOtherText_Type2, 11, 6);
    SummaryScreen_PlaceTextTile_White(0, 22, 4);
    SummaryScreen_PlaceTextTile_White(2, 23, 4);
}

static void SummaryScreen_PrintPokemonInfo(struct Pokemon *mon)
{
    u8 i;
    u8 *buffer;
    u16 friendship;
    u8 language;
    u16 species;
    u8 ability;

    for (i = 0; i < 5; i++)
        sub_80A1918(i, 1);

    Menu_EraseWindowRect(11, 9, 28, 12);
    if (GetMonData(mon, MON_DATA_IS_EGG))
    {
        buffer = gStringVar1;
        buffer = SummaryScreen_SetTextColor(buffer, 13);
        buffer = StringCopy(buffer, gOtherText_OriginalTrainer);
        buffer = StringCopy(buffer, gOtherText_FiveQuestions);
        buffer[0] = EXT_CTRL_CODE_BEGIN;
        buffer[1] = 0x13;
        buffer[2] = 0x4E;
        buffer[3] = EOS;
        Menu_PrintText(gStringVar1, 11, 4);

        SummaryScreen_PrintColoredTextPixelCoords(gOtherText_FiveQuestions, 13, 193, 32, 1);
        SummaryScreen_DrawTypeIcon(TYPE_MYSTERY, 120, 48, 0);

        friendship = GetMonData(mon, MON_DATA_FRIENDSHIP);
        if (friendship <= 5)
            Menu_PrintText(gOtherText_EggAbout, 11, 9);
        else if (friendship <= 10)
            Menu_PrintText(gOtherText_EggSoon, 11, 9);
        else if (friendship <= 40)
            Menu_PrintText(gOtherText_EggSomeTime, 11, 9);
        else
            Menu_PrintText(gOtherText_EggLongTime, 11, 9);

        PokemonSummaryScreen_PrintEggTrainerMemo(mon, 11, 14);
    }
    else
    {
        GetMonData(mon, MON_DATA_OT_NAME, gStringVar2);
        language = GetMonData(mon, MON_DATA_LANGUAGE);
        ConvertInternationalString(gStringVar2, language);

        buffer = gStringVar1;
        buffer = SummaryScreen_SetTextColor(buffer, 13);
        buffer = StringCopy(buffer, gOtherText_OriginalTrainer);

        if (GetMonData(mon, MON_DATA_OT_GENDER) == MALE)
            buffer = SummaryScreen_SetTextColor(buffer, 9);
        else
            buffer = SummaryScreen_SetTextColor(buffer, 10);

        buffer = StringCopy(buffer, gStringVar2);
        buffer[0] = EXT_CTRL_CODE_BEGIN;
        buffer[1] = 0x13;
        buffer[2] = 0x4E;
        buffer[3] = EOS;
        Menu_PrintText(gStringVar1, 11, 4);

        SummaryScreen_PrintColoredIntPixelCoords(GetMonData(mon, MON_DATA_OT_ID) & 0xFFFF, 13, 5, 2, 193, 32, 1);

        species = GetMonData(mon, MON_DATA_SPECIES);
        SummaryScreen_DrawTypeIcon(gBaseStats[species].type1, 120, 48, 0);
        if (gBaseStats[species].type1 != gBaseStats[species].type2)
            SummaryScreen_DrawTypeIcon(gBaseStats[species].type2, 160, 48, 1);

        ability = GetAbilityBySpecies(GetMonData(mon, MON_DATA_SPECIES), GetMonData(mon, MON_DATA_ALT_ABILITY));
        SummaryScreen_PrintColoredText(gAbilityNames[ability], 13, 11, 9);
        Menu_PrintText(gAbilityDescriptions[ability], 11, 11);

        PokemonSummaryScreen_PrintTrainerMemo(mon, 11, 14);
    }
}

static void sub_809FE6C(struct Pokemon *mon)
{
    SummaryScreen_PrintPokemonInfoLabels();
    SummaryScreen_PrintPokemonInfo(mon);
}

static void sub_809FE80(void)
{
    Menu_EraseWindowRect(14, 4, 18, 5);
    Menu_EraseWindowRect(25, 4, 30, 5);
    Menu_EraseWindowRect(11, 9, 28, 12);
    Menu_EraseWindowRect(11, 14, 28, 17);
}

static void SummaryScreen_PrintPokemonSkillsLabels(void)
{
    SummaryScreen_PrintColoredText(gOtherText_ExpPoints, 13, 11, 14);
    SummaryScreen_PrintColoredText(gOtherText_NextLv, 13, 11, 16);
    Menu_PrintText(gOtherText_Terminator18, 21, 16);

    SummaryScreen_PrintColoredTextCentered(gOtherText_HP, 13, 11, 7, 42);
    SummaryScreen_PrintColoredTextCentered(gOtherText_Attack, 13, 11, 9, 42);
    SummaryScreen_PrintColoredTextCentered(gOtherText_Defense, 13, 11, 11, 42);
    SummaryScreen_PrintColoredTextCentered(gOtherText_SpAtk, 13, 22, 7, 36);
    SummaryScreen_PrintColoredTextCentered(gOtherText_SpDef, 13, 22, 9, 36);
    SummaryScreen_PrintColoredTextCentered(gOtherText_Speed, 13, 22, 11, 36);
}

static void SummaryScreen_PrintPokemonSkills(struct Pokemon *mon)
{
    u8 i;
    u16 heldItem;
    u8 *buffer;

    for (i = 0; i < 5; i++)
        sub_80A1918(i, 1);

    heldItem = GetMonData(mon, MON_DATA_HELD_ITEM);
    PrintHeldItemName(heldItem, 11, 4);
    PrintNumRibbons(mon);

    buffer = gStringVar1;

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_EXP));
    MenuPrint_RightAligned(buffer, 29, 14);
    DrawExperienceProgressBar(mon, 23, 16);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_ATK));
    MenuPrint_Centered(buffer, 16, 9, 50);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_DEF));
    MenuPrint_Centered(buffer, 16, 11, 50);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_SPATK));
    MenuPrint_Centered(buffer, 27, 7, 18);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_SPDEF));
    MenuPrint_Centered(buffer, 27, 9, 18);

    ConvertIntToDecimalString(buffer, GetMonData(mon, MON_DATA_SPEED));
    MenuPrint_Centered(buffer, 27, 11, 18);

    buffer = AlignInt1InMenuWindow(buffer, GetMonData(mon, MON_DATA_HP), 24, 1);
    *buffer++ = CHAR_SLASH;
    buffer = AlignInt1InMenuWindow(buffer, GetMonData(mon, MON_DATA_MAX_HP), 48, 1);

    Menu_PrintTextPixelCoords(gStringVar1, 126, 56, 1);
}

static void sub_80A0090(struct Pokemon *mon)
{
    SummaryScreen_PrintPokemonSkillsLabels();
    SummaryScreen_PrintPokemonSkills(mon);
}

static void sub_80A00A4(void)
{
    Menu_EraseWindowRect(11, 4, 19, 5);
    Menu_EraseWindowRect(16, 7, 21, 8);
    Menu_EraseWindowRect(17, 9, 21, 12);
    Menu_EraseWindowRect(27, 7, 29, 12);
    Menu_EraseWindowRect(22, 14, 28, 15);
    Menu_EraseWindowRect(23, 16, 28, 17);
}

static void sub_80A00F4(u8 a)
{
    if (pssData.moveToLearn != 0 || a != 4)
    {
        if (pssData.page == PSS_PAGE_BATTLE_MOVES)
        {
            SummaryScreen_PrintColoredText(gOtherText_Power2, 13, 1, 15);
            SummaryScreen_PrintColoredText(gOtherText_Accuracy2, 13, 1, 17);
        }
        else
        {
            SummaryScreen_PrintColoredText(gOtherText_Appeal2, 13, 1, 15);
            SummaryScreen_PrintColoredText(gOtherText_Jam2, 13, 1, 17);
        }
    }
}

static void sub_80A015C(struct Pokemon *mon)
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
            SummaryScreen_PrintColoredText(gOtherText_OneDash, 13, 15, (2 * i) + 4);
            Menu_PrintText(gOtherText_TwoDashes, 26, (2 * i) + 4);
        }
        else
        {
            if (pssData.page == PSS_PAGE_BATTLE_MOVES)
                SummaryScreen_DrawTypeIcon(gBattleMoves[move].type, 87, ((2 * i) + 4) * 8, i);
            else
                SummaryScreen_DrawTypeIcon(gContestMoves[move].contestCategory + 18, 87, ((2 * i) + 4) * 8, i);

            SummaryScreen_PrintColoredText(gMoveNames[move], 13, 15, (2 * i) + 4);
            SummaryScreen_PlaceTextTile_White(1, 24, (2 * i) + 4);

            ppBonuses = GetMonData(mon, MON_DATA_PP_BONUSES);
            maxPP = CalculatePPWithBonus(move, ppBonuses, i);

            buffer = gStringVar1;
            buffer = AlignInt1InMenuWindow(buffer, curPP, 14, 1);
            *buffer++ = CHAR_SLASH;
            AlignInt1InMenuWindow(buffer, maxPP, 32, 1);
            Menu_PrintText(gStringVar1, 25, (2 * i) + 4);
        }
    }
}

static void sub_80A029C(struct Pokemon *mon)
{
    u8 *buffer;
    u16 move;
    u8 pp;

    if (pssData.moveToLearn == 0)
    {
        SummaryScreen_PrintColoredText(gOtherText_CancelNoTerminator, 13, 15, 12);
        return;
    }

    move = pssData.moveToLearn;

    if (pssData.page == PSS_PAGE_BATTLE_MOVES)
        SummaryScreen_DrawTypeIcon(gBattleMoves[move].type, 87, 96, 4);
    else
        SummaryScreen_DrawTypeIcon(gContestMoves[move].contestCategory + 18, 87, 96, 4);

    if (pssData.page == PSS_PAGE_BATTLE_MOVES)
        SummaryScreen_PrintColoredText(gMoveNames[move], 10, 15, 12);
    else
        SummaryScreen_PrintColoredText(gMoveNames[move], 9, 15, 12);

    SummaryScreen_PlaceTextTile_White(1, 24, 12);

    buffer = gStringVar1;
    pp = gBattleMoves[move].pp;
    buffer = AlignInt1InMenuWindow(buffer, pp, 14, 1);
    *buffer++ = CHAR_SLASH;
    buffer = AlignInt1InMenuWindow(buffer, pp, 32, 1);
    Menu_PrintText(gStringVar1, 25, 12);
}

static void sub_80A0390(void)
{
    u8 i;

    for (i = 0; i < MAX_MON_MOVES; i++)
        Menu_EraseWindowRect(15, (i * 2) + 4, 28, (i * 2) + 5);
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
        if (pssData.moveToLearn != 0)
            move = pssData.moveToLearn;
        else
            move = 0xFFFF;
    }

    return move;
}

void sub_80A03F0(struct Pokemon *mon, u8 *selectedMoveIndex)
{
    u16 move = sub_80A03BC(mon, *selectedMoveIndex);

    if (pssData.page == PSS_PAGE_BATTLE_MOVES)
    {
        sub_80A04CC(move);
        sub_80A057C(0xFFFF);
    }
    else
    {
        sub_80A057C(move);
    }
}

static void sub_80A0428(struct Pokemon *mon, u8 *selectedMoveIndex)
{
    u16 move = sub_80A03BC(mon, *selectedMoveIndex);
    Menu_EraseWindowRect(11, 15, 28, 18);

    if (pssData.page == PSS_PAGE_BATTLE_MOVES)
        sub_80A046C(move);
    else
        sub_80A0498(move);

    sub_80A03F0(mon, selectedMoveIndex);
}

static void sub_80A046C(u16 move)
{
    if (move != 0xFFFF)
        Menu_PrintText(gMoveDescriptions[move - 1], 11, 15);
}

static void sub_80A0498(u16 move)
{
    if (move != 0xFFFF)
        Menu_PrintText(gContestEffectStrings[gContestMoves[move].effect], 11, 15);
}

static void sub_80A04CC(u16 move)
{
    u8 *buffer;

    if (move != 0xFFFF)
    {
        if (gBattleMoves[move].power <= 1)
        {
            buffer = gStringVar1;
            buffer = AlignStringInMenuWindow(buffer, gOtherText_ThreeDashes2, 21, 1);
            Menu_PrintText(gStringVar1, 7, 15);
        }
        else
        {
            buffer = gStringVar1;
            buffer = AlignInt1InMenuWindow(buffer, gBattleMoves[move].power, 21, 1);
            Menu_PrintText(gStringVar1, 7, 15);
        }

        if (gBattleMoves[move].accuracy == 0)
        {
            buffer = gStringVar1;
            buffer = AlignStringInMenuWindow(buffer, gOtherText_ThreeDashes2, 21, 1);
            Menu_PrintText(gStringVar1, 7, 17);
        }
        else
        {
            buffer = gStringVar1;
            buffer = AlignInt1InMenuWindow(buffer, gBattleMoves[move].accuracy, 21, 1);
            Menu_PrintText(gStringVar1, 7, 17);
        }
    }
}

#ifdef NONMATCHING // The two vramAddr lines are non-matching.
static void sub_80A057C(u16 move)
{
    u8 appeal;
    u8 jam;
    u8 i;
    u16 *vramAddr = (u16 *)(VRAM + 0x6800);

    if (move == 0xFFFF) return;

    appeal = gContestEffects[gContestMoves[move].effect].appeal;
    if (appeal != 0xFF)
        appeal = appeal / 10;

    for (i = 0; i < 8; i++)
    {
        u16 tile = 0x1039;
        int and = 3;
        int offset = 0x3CC / 2;
        if (appeal != 0xFF && i < appeal)
            tile = 0x103A;

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
NAKED
static void sub_80A057C(u16 move)
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
        Text_StripExtCtrlCodes(gStringVar1);
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

static void PokemonSummaryScreen_PrintEggTrainerMemo(struct Pokemon *mon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet = GetMonData(mon, MON_DATA_MET_GAME);

    if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
    {
        Menu_PrintText(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);

    if (locationMet == 255)
    {
        // Eggs received from Pokemon Box.
        Menu_PrintText(gOtherText_EggNicePlace, left, top);
        return;
    }

    if (!PokemonSummaryScreen_CheckOT(mon))
    {
        Menu_PrintText(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    asm(""); // needed to match for some reason

    if (locationMet == 253)
    {
        Menu_PrintText(gOtherText_EggHotSprings, left, top);
        return;
    }

    Menu_PrintText(gOtherText_EggDayCare, left, top);
}

static void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *mon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet;
    u8 *ptr = gStringVar4;
    u8 nature = GetNature(mon);

#if ENGLISH
    ptr = SummaryScreen_CopyColoredString(ptr, gNatureNames[nature], 14);
    if (nature != NATURE_BOLD && nature != NATURE_GENTLE)
        ptr = StringCopy(ptr, gOtherText_Terminator4);
    ptr = StringCopy(ptr, gOtherText_Nature);
#elif GERMAN
    ptr = StringCopy(gStringVar4, gOtherText_Nature);
    ptr = SummaryScreen_CopyColoredString(ptr, gNatureNames[nature], 14);
    ptr = StringCopy(ptr, gOtherText_Terminator4);
#endif

    if (PokemonSummaryScreen_CheckOT(mon) == TRUE)
    {
        locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);

        if (GetMonData(mon, MON_DATA_MET_LEVEL) == 0)
        {
            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, EGG_HATCH_LEVEL);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = SummaryScreen_CopyColoredString(ptr, gStringVar1, 14);
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
            u8 levelMet = GetMonData(mon, MON_DATA_MET_LEVEL);

            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = SummaryScreen_CopyColoredString(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Met);
        }
    }
    else
    {
        gameMet = GetMonData(mon, MON_DATA_MET_GAME);

        if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
        {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }
        else
        {
            locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);
            if (locationMet == 0xFF)
            {
                u8 levelMet = GetMonData(mon, MON_DATA_MET_LEVEL);

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
                u8 levelMet = GetMonData(mon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                CopyLocationName(gStringVar1, locationMet);
                ptr = SummaryScreen_CopyColoredString(ptr, gStringVar1, 14);
                StringCopy(ptr, gOtherText_Met2);
            }
        }
    }

    Menu_PrintText(gStringVar4, left++, top++);
}

static void sub_80A0958(struct Pokemon *mon)
{
    u16 species;
    u8 *buffer;
    u8 level;

    species = GetMonData(mon, MON_DATA_SPECIES);

    buffer = gStringVar1;
    buffer = SummaryScreen_SetTextColor(buffer, 13);
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

    Menu_PrintText(gStringVar1, 0, 14);
    Menu_EraseWindowRect(3, 16, 9, 17);

    level = GetMonData(mon, MON_DATA_LEVEL);

    buffer = SummaryScreen_SetTextColor(gStringVar1, 13);
    buffer[0] = CHAR_LV;
    buffer += 1;
    buffer = ConvertIntToDecimalString(buffer, level);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x20;
    buffer[3] = EOS;

    Menu_PrintText(gStringVar1, 3, 16);
    sub_80A0A2C(mon, 7, 16);
}

static void sub_80A0A2C(struct Pokemon *mon, u8 left, u8 top)
{
    const u8 *genderSymbol;
    u8 color;
    u8 bottom;
    u16 species = GetMonData(mon, MON_DATA_SPECIES2);

    if (species != SPECIES_NIDORAN_M && species != SPECIES_NIDORAN_F)
    {
        u8 gender = GetMonGender(mon);
        switch (gender)
        {
        default:
            bottom = top + 1;
            Menu_EraseWindowRect(left, top, left, bottom);
            return;
        case MON_MALE:
            genderSymbol = gOtherText_MaleSymbol2;
            color = 11;
            break;
        case MON_FEMALE:
            genderSymbol = gOtherText_FemaleSymbol2;
            color = 12;
            break;
        }

        SummaryScreen_PrintColoredText(genderSymbol, color, left, top);
    }
}

u8 GetNumRibbons(struct Pokemon *mon)
{
    u8 numRibbons = 0;
    numRibbons += GetMonData(mon, MON_DATA_COOL_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_BEAUTY_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_CUTE_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_SMART_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_TOUGH_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_CHAMPION_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_WINNING_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_VICTORY_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_ARTIST_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_EFFORT_RIBBON);
    numRibbons += GetMonData(mon, MON_DATA_GIFT_RIBBON_1);
    numRibbons += GetMonData(mon, MON_DATA_GIFT_RIBBON_2);
    numRibbons += GetMonData(mon, MON_DATA_GIFT_RIBBON_3);
    numRibbons += GetMonData(mon, MON_DATA_GIFT_RIBBON_4);
    numRibbons += GetMonData(mon, MON_DATA_GIFT_RIBBON_5);
    numRibbons += GetMonData(mon, MON_DATA_GIFT_RIBBON_6);
    numRibbons += GetMonData(mon, MON_DATA_GIFT_RIBBON_7);

    return numRibbons;
}

static void PrintNumRibbons(struct Pokemon *mon)
{
    u8 numRibbons = GetNumRibbons(mon);

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

    Menu_PrintText(sUnknown_083C15AE, 21, 4);
}

static void PrintHeldItemName(u16 itemId, u8 left, u8 top)
{
    if (itemId == ITEM_ENIGMA_BERRY
     && sub_80F9344() == TRUE
     && IsLinkDoubleBattle() == TRUE
     && (pssData.monIndex == 1 || pssData.monIndex == 4 || pssData.monIndex == 5))
        StringCopy(gStringVar1, ItemId_GetName(itemId));
    else if (itemId == 0)
        StringCopy(gStringVar1, gOtherText_None);
    else
        CopyItemName(itemId, gStringVar1);

    Menu_PrintText(sUnknown_083C15B4, left, top);
}

static void DrawExperienceProgressBar(struct Pokemon *mon, u8 left, u8 top)
{
    u32 curExperience;
    u8 level;
    u16 species;
    u8 i;
    u16 *vramAddr;
    u32 expToNextLevel = 0;
    s64 numExpProgressBarTicks = 0;

    curExperience = GetMonData(mon, MON_DATA_EXP);
    level = GetMonData(mon, MON_DATA_LEVEL);
    species = GetMonData(mon, MON_DATA_SPECIES);

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

        if (numExpProgressBarTicks >= 8)
            tile = 0x2062 + 8; // full exp. bar block
        else
            tile = 0x2062 + (numExpProgressBarTicks % 8);

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
static void PrintSummaryWindowHeaderText(void)
{
    u8 *buffer = gStringVar1;

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x12;
    buffer[2] = 0x2;

    buffer += 3;
    buffer = SummaryScreen_SetTextColor(buffer, 13);
    buffer = StringCopy(buffer, sPageHeaderTexts[pssData.headerTextId]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x58;
    buffer[3] = EOS;

    Menu_PrintText(gStringVar1, 0, 0);

    if (pssData.headerActionTextId != 0)
    {
        SummaryScreen_PlaceTextTile_White(5, 23, 0);
        SummaryScreen_PlaceTextTile_White(6, 24, 0);
    }
    else
    {
        Menu_EraseWindowRect(23, 0, 24, 1);
    }

    buffer = gStringVar1;
    buffer = SummaryScreen_SetTextColor(buffer, 13);
    buffer = StringCopy(buffer, sPageHeaderTexts[pssData.headerActionTextId]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x28;
    buffer[3] = EOS;

    Menu_PrintText(gStringVar1, 25, 0);
}

// If the given pokemon previously had the pokerus virus, a small
// dot will be drawn in between the pokeball and the mon's level.
static void DrawPokerusSurvivorDot(struct Pokemon *mon)
{
    u16 *vram1 = (u16 *)(VRAM + 0xE444);
    u16 *vram2 = (u16 *)(VRAM + 0xEC44);

    if (!CheckPartyPokerus(mon, 0) && CheckPartyHasHadPokerus(mon, 0))
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
static void DrawSummaryScreenNavigationDots(void)
{
    void *dest;
    u16 arr[8];
    u8 i = 0;
    struct PokemonSummaryScreenStruct *SS = (struct PokemonSummaryScreenStruct *)(gSharedMem + 0x18000);
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

    DmaCopy16Defvars(3, arr, (void *)(VRAM + 0xE016), 16);

    for (i = 0; i < 8; i++)
    {
        arr[i] += 0x10;
    }

    DmaCopy16Defvars(3, arr, (void *)(VRAM + 0xE056), 16);
}
#else
NAKED
static void DrawSummaryScreenNavigationDots(void)
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

NAKED
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
    bl SummaryScreen_PrintColoredText\n\
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

static void sub_80A12D0(s8 a)
{
    u8 newTaskId;

    Menu_EraseWindowRect(1, 18, 5, 19);
    sub_80A18E4(29);

    newTaskId = CreateTask(sub_80A1048, 0);
    gTasks[newTaskId].data[0] = a;

    if (a < 0)
        gTasks[newTaskId].data[1] = 10;
    else
        gTasks[newTaskId].data[1] = 0;

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
//         Menu_EraseWindowRect(0, 19, 9, 19);
//     }

//     if (gTasks[taskId].data[0] == 0 || gTasks[taskId].data[1] < 0)
//     {
//         if (pssData.page == PSS_PAGE_BATTLE_MOVES)
//         {
//             Menu_EraseWindowRect(0, 14, 9, 18);
//             sub_80A0958(pssData.loadedMon);

//             if (GetMonStatusAndPokerus(pssData.loadedMon))
//             {
//                 SummaryScreen_PrintColoredText(gOtherText_Status, 13, 1, 18);
//             }

//             DestroyTask(taskId);
//         }
//     }

//     if (gTasks[taskId].data[1] > 9)
//     {
//         if (pssData.page == PSS_PAGE_BATTLE_MOVES)
//         {
//             sub_80A00F4(gTasks[taskId].data[3]);
//         }

//         sub_80A0428(pssData.loadedMon, &gTasks[taskId].data[3]);
//         DestroyTask(taskId);
//     }
// }
NAKED
static void sub_80A1334(u8 taskId)
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
    bl Menu_EraseWindowRect\n\
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
    bl Menu_EraseWindowRect\n\
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
    bl SummaryScreen_PrintColoredText\n\
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
static void sub_80A1488(s8 a, u8 b)
{
    u8 taskId;

    if (pssData.page == PSS_PAGE_BATTLE_MOVES)
        Menu_EraseWindowRect(0, 14, 9, 19);

    taskId = FindTaskIdByFunc(sub_80A1334);
    if (taskId == 0xFF)
        taskId = CreateTask(sub_80A1334, 0);

    gTasks[taskId].data[0] = a;

    if (a < 0)
        gTasks[taskId].data[1] = 10;
    else
        gTasks[taskId].data[1] = 0;

    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = b;
}

NAKED
static void sub_80A1500(u8 taskId)
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
    bl Menu_EraseWindowRect\n\
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
    bl Menu_EraseWindowRect\n\
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
    bl SummaryScreen_PrintColoredText\n\
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

static void sub_80A1654(s8 a, u8 b)
{
    u8 taskId;

    if (pssData.page == PSS_PAGE_CONTEST_MOVES)
        Menu_EraseWindowRect(0, 14, 9, 19);

    taskId = FindTaskIdByFunc(sub_80A1500);
    if (taskId == 0xFF)
        taskId = CreateTask(sub_80A1500, 0);

    gTasks[taskId].data[0] = a;

    if (a < 0)
        gTasks[taskId].data[1] = 10;
    else
        gTasks[taskId].data[1] = 0;

    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = b;
}

#ifdef NONMATCHING
static void sub_80A16CC(u8 a)
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
NAKED
static void sub_80A16CC(u8 a)
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

u8 SummaryScreen_CreatePokemonSprite(struct Pokemon *mon)
{
    u16 species;
    u8 spriteId;

    species = GetMonData(mon, MON_DATA_SPECIES2);
    spriteId = CreateSprite(&gUnknown_02024E8C, 40, 64, 5);

    FreeSpriteOamMatrix(&gSprites[spriteId]);

    gSprites[spriteId].data[0] = species;
    gSprites[spriteId].callback = SummaryScreen_SpritePlayCry;

    if (!IsPokeSpriteNotFlipped(species))
        gSprites[spriteId].hFlip = TRUE;
    else
        gSprites[spriteId].hFlip = FALSE;

    return spriteId;
}

static void SummaryScreen_SpritePlayCry(struct Sprite *sprite)
{
    if (!gPaletteFade.active)
    {
        sprite->callback = SpriteCallbackDummy;

        if (!GetMonData(&pssData.loadedMon, MON_DATA_IS_EGG))
            PlayCry1(sprite->data[0], 0);
    }
}

static void sub_80A18C4(void)
{
    u8 i;

    for (i = 0; i < 30; i++)
        ewram1A000[i] = 0xFF;
}

static void sub_80A18E4(u8 a)
{
    if (ewram1A000[a] != 0xFF)
    {
        DestroySprite(&gSprites[ewram1A000[a]]);
        ewram1A000[a] = 0xFF;
    }
}

static void sub_80A1918(u8 a, u8 invisible)
{
    gSprites[ewram1A000[a]].invisible = invisible;
}

static void sub_80A1950(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (ewram1A000[i] == 0xFF)
            ewram1A000[i] = CreateSprite(&sSpriteTemplate_83C11C0, 0, 0, 2);

        sub_80A1918(i, 1);
    }
}

static void SummaryScreen_DrawTypeIcon(u8 animNum, u8 x, u8 y, u8 d)
{
    StartSpriteAnim(&gSprites[ewram1A000[d]], animNum);

    gSprites[ewram1A000[d]].oam.paletteNum = sUnknown_PaletteNums[animNum];
    gSprites[ewram1A000[d]].pos1.x = x + 16;
    gSprites[ewram1A000[d]].pos1.y = y + 8;

    sub_80A1918(d, 0);
}

static void sub_80A1A30(u8 a)
{
    u8 i;
    s16 x;
    u8 subPriority = 0;

    if (pssData.page >= PSS_PAGE_BATTLE_MOVES)
    {
        if (a == 9)
            subPriority = 1;

        for (i = 0; i < 10; i++)
        {
            x = (i * 16) + 0x58;
            ewram1A000[a + i] = CreateSprite(&sSpriteTemplate_83C1280, x, 40, subPriority);

            if (i == 0)
                StartSpriteAnim(&gSprites[ewram1A000[a]], 4);
            else if (i == 9)
                StartSpriteAnim(&gSprites[ewram1A000[a + i]], 5);
            else
                StartSpriteAnim(&gSprites[ewram1A000[a + i]], 6);

            gSprites[ewram1A000[a + i]].callback = sub_80A1BC0;
            gSprites[ewram1A000[a + i]].data[0] = a;
            gSprites[ewram1A000[a + i]].data[1] = 0;
        }
    }
}

static void sub_80A1B1C(u8 a)
{
    u8 i;

    for (i = 0; i < 10; i++)
        sub_80A18E4(a + i);
}

static void sub_80A1B40(u8 a)
{
    u8 i;
    a *= 3;

    StartSpriteAnim(&gSprites[ewram1A000[9]], a + 4);

    for (i = 0; i < 8; i++)
        StartSpriteAnim(&gSprites[ewram1A000[10 + i]], a + 6);

    StartSpriteAnim(&gSprites[ewram1A000[18]], a + 5);
}

static void sub_80A1BC0(struct Sprite *sprite)
{
    if (sprite->animNum == 4 || sprite->animNum == 5 || sprite->animNum == 6)
    {
        sprite->data[1] = (sprite->data[1] + 1) & 0x1F;

        if (sprite->data[1] > 24)
            sprite->invisible = TRUE;
        else
            sprite->invisible = FALSE;
    }
    else
    {
        sprite->data[1] = 0;
        sprite->invisible = 0;
    }

    if (sprite->data[0] == 9)
        sprite->pos2.y = pssData.selectedMoveIndex * 16;
    else
        sprite->pos2.y = pssData.switchMoveIndex * 16;
}

#define shared1A009 ((u8 *)(gSharedMem + 0x1A009))

void sub_80A1C30(u8 a)
{
    u8 r3;

    a *= 10;
    for (r3 = a; r3 < a + 10; r3++)
    {
        gSprites[shared1A009[r3]].data[1] = 0;
        gSprites[shared1A009[r3]].invisible = FALSE;
    }
}

u8 GetPrimaryStatus(u32 status)
{
    if (status & (STATUS_POISON | STATUS_TOXIC_POISON))
        return STATUS_PRIMARY_POISON;
    if (status & STATUS_PARALYSIS)
        return STATUS_PRIMARY_PARALYSIS;
    if (status & STATUS_SLEEP)
        return STATUS_PRIMARY_SLEEP;
    if (status & STATUS_FREEZE)
        return STATUS_PRIMARY_FREEZE;
    if (status & STATUS_BURN)
        return STATUS_PRIMARY_BURN;

    return STATUS_PRIMARY_NONE;
}

u8 GetMonStatusAndPokerus(struct Pokemon *mon)
{
    u8 statusAilment;

    if (GetMonData(mon, MON_DATA_HP) == 0)
        return STATUS_PRIMARY_FAINTED;

    statusAilment = GetPrimaryStatus(GetMonData(mon, MON_DATA_STATUS));
    if (statusAilment == STATUS_PRIMARY_NONE)
    {
        if (!CheckPartyPokerus(mon, 0))
            return STATUS_PRIMARY_NONE;
        else
            return STATUS_PRIMARY_POKERUS;
    }

    return statusAilment;
}

#ifdef NONMATCHING
void sub_80A1D18(void)
{
    struct Pokemon mon;
    u8 statusAndPkrs;
    u8 statusAndPkrs2;

    SummaryScreen_GetPokemon(&mon);
    statusAndPkrs = GetMonStatusAndPokerus(&mon);

    if (statusAndPkrs)
    {
        statusAndPkrs2 = statusAndPkrs - 1;

        if (ewram1A000[29] == 0xFF)
            ewram1A000[29] = CreateSprite(&sSpriteTemplate_83C1304, 64, 152, 0);
    }
    else
    {
        sub_80A18E4(29);
        return;
    }

    StartSpriteAnim(&gSprites[ewram1A000[29]], statusAndPkrs2);
}
#else
NAKED
void sub_80A1D18(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    sub sp, 0x64\n\
    mov r0, sp\n\
    bl SummaryScreen_GetPokemon\n\
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
    ldr r0, _080A1D54 @ =sSpriteTemplate_83C1304\n\
    movs r1, 0x40\n\
    movs r2, 0x98\n\
    movs r3, 0\n\
    bl CreateSprite\n\
    strb r0, [r4]\n\
    b _080A1D60\n\
    .align 2, 0\n\
_080A1D50: .4byte gSharedMem + 0x1A01D\n\
_080A1D54: .4byte sSpriteTemplate_83C1304\n\
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

static void sub_80A1D84(struct Pokemon *mon)
{
    struct Sprite *sprite;

    sprite = sub_80F7920(30003, 30003, sSummaryScreenMonMarkingsPalette);
    gUnknown_020384F4 = sprite;

    if (sprite != NULL)
    {
        u8 markings = GetMonData(mon, MON_DATA_MARKINGS);
        StartSpriteAnim(sprite, markings);

        gUnknown_020384F4->pos1.x = 60;
        gUnknown_020384F4->pos1.y = 26;
    }
}

static void sub_80A1DCC(struct Pokemon *mon)
{
    DestroySprite(gUnknown_020384F4);
    sub_80A1D84(mon);
}

static void sub_80A1DE8(struct Pokemon *mon)
{
    u8 ball = ball_number_to_ball_processing_index(GetMonData(mon, MON_DATA_POKEBALL));
    LoadBallGraphics(ball);

    pssData.ballSpriteId = CreateSprite(&gBallSpriteTemplates[ball], 6, 136, 0);
    gSprites[pssData.ballSpriteId].callback = SpriteCallbackDummy;
    gSprites[pssData.ballSpriteId].oam.priority = 3;
}

static u8 *SummaryScreen_SetTextColor(u8 *text, u8 id)
{
    if (id != 0xFF)
    {
        const struct TextColors *colors = sSummaryScreenTextColors;

        while (colors->id != 0xFF && colors->id != id)
            colors++;

        text[0] = EXT_CTRL_CODE_BEGIN;
        text[1] = EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW;
        text[2] = colors->color;
        text[3] = colors->background;
        text[4] = colors->shadow;

        text += 5;
    }

    return text;
}

static u8 *SummaryScreen_CopyColoredString(u8 *dest, const u8 *src, u8 id)
{
    u8 colors[3];

    Menu_GetTextColors(&colors[0], &colors[1], &colors[2]);

    dest = SummaryScreen_SetTextColor(dest, id);
    dest = StringCopy(dest, src);

    if (id != 0xFF)
    {
        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW;
        dest[2] = colors[0];
        dest[3] = colors[1];
        dest[4] = colors[2];
        dest[5] = 0xFF;

        dest += 5;
    }

    return dest;
}

static void SummaryScreen_PrintColoredTextPixelCoords(const u8 *text, u8 id, u8 left, u16 top, s32 e)
{
    SummaryScreen_CopyColoredString(gStringVar4, text, id);
    Menu_PrintTextPixelCoords(gStringVar4, left, top, (bool8)e);
}

static void SummaryScreen_PrintColoredTextCentered(const u8 *text, u8 id, u8 left, u8 top, u16 width)
{
    SummaryScreen_CopyColoredString(gStringVar4, text, id);
    MenuPrint_Centered(gStringVar4, left, top, width);
}

static void SummaryScreen_PrintColoredIntPixelCoords(s32 value, u8 id, u8 n, u8 mode, u8 left, u16 top, s32 e)
{
    ConvertIntToDecimalStringN(gStringVar1, value, mode, n);
    SummaryScreen_PrintColoredTextPixelCoords(gStringVar1, id, left, top, e);
}

static void SummaryScreen_PrintColoredText(const u8 *text, u8 id, u8 left, u8 top)
{
    SummaryScreen_CopyColoredString(gStringVar4, text, id);
    Menu_PrintText(gStringVar4, left, top);
}

u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level)
{
    u8 buffer[12];

    *dest++ = CHAR_LV;

    if (level == 0)
        level = 5;

    ConvertIntToDecimalString(buffer, level);
    dest = SummaryScreen_CopyColoredString(dest, buffer, 14);
    dest = StringCopy(dest, gOtherText_Comma);

    return dest;
}

static void sub_80A2078(int taskId)
{
    gUnknown_03005CF0 = gTasks[taskId].func;
    gTasks[taskId].func = sub_80A20A8;
    gTasks[taskId].func((u8)taskId);
}

static void sub_80A20A8(u8 taskId)
{
    if (sub_8055870() != TRUE)
        gTasks[taskId].func = gUnknown_03005CF0;
}
