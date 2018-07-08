#include "global.h"
#include "data2.h"
#include "decompress.h"
#include "event_data.h"
#include "hall_of_fame.h"
#include "intro_credits_graphics.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokedex.h"
#include "random.h"
#include "constants/songs.h"
#include "sound.h"
#include "constants/species.h"
#include "starter_choose.h"
#include "task.h"
#include "trig.h"
#include "ewram.h"

asm(".set REG_BASE, 0x4000000");
asm(".set OFFSET_REG_BLDCNT,      0x50");
asm(".set OFFSET_REG_BLDALPHA,    0x52");
asm(".set REG_BLDCNT,      REG_BASE + OFFSET_REG_BLDCNT");
asm(".set REG_BLDALPHA,    REG_BASE + OFFSET_REG_BLDALPHA");

enum
{
    PAGE_TITLE,
    PAGE_DIRECTOR,
    PAGE_ART_DIRECTOR,
    PAGE_BATTLE_DIRECTOR,
    PAGE_MAIN_PROGRAMMER,
    PAGE_BATTLE_SYSTEM_PROGRAMMER,
    PAGE_PROGRAMMERS_1,
    PAGE_PROGRAMMERS_2,
    PAGE_PROGRAMMERS_3,
    PAGE_MAIN_GRAHPICS_DESIGNER,
    PAGE_POKEMON_GRAHPIC_DESIGNERS_1,
    PAGE_POKEMON_GRAHPIC_DESIGNERS_2,
    PAGE_POKEMON_GRAHPIC_DESIGNERS_3,
    PAGE_POKEMON_DESIGNERS_1,
    PAGE_POKEMON_DESIGNERS_2,
    PAGE_MUSIC_COMPOSITION,
    PAGE_SOUND_EFFECTS,
    PAGE_GAME_DESIGNERS_1,
    PAGE_GAME_DESIGNERS_2,
    PAGE_GAME_DESIGNERS_3,
    PAGE_PLOT_SCENARIO,
    PAGE_GAME_SCENARIO,
    PAGE_SCRIPT_DESIGNERS,
    PAGE_MAP_DESIGNERS,
    PAGE_MAP_DATA_DESIGNERS,
    PAGE_PARAMETRIC_DESIGNERS,
    PAGE_POKEDEX_TEXT,
    PAGE_ENVIRONMENT_TOOLS,
    PAGE_PRODUCT_TESTING,
    PAGE_SPECIAL_THANKS,
    PAGE_SPECIAL_THANKS_1,
    PAGE_SPECIAL_THANKS_2,
    PAGE_SPECIAL_THANKS_3,
    PAGE_INFORMATION_SUPERVISORS,
    PAGE_COORDINATORS,
    PAGE_TASK_MANAGERS,
    PAGE_PRODUCERS,
    PAGE_EXECUTIVE_DIRECTOR,
    PAGE_EXECUTIVE_PRODUCERS_1,
    PAGE_EXECUTIVE_PRODUCERS_2,
    PAGE_TRANSLATION_COORDINATOR,
    PAGE_TRANSLATORS,
    PAGE_PROGRAMMERS,
    PAGE_GRAPHIC_DESIGNERS,
    PAGE_PRODUCT_SUPPORT,

#if ENGLISH
    PAGE_ARTWORK,
    PAGE_TEXT_EDITOR,
    PAGE_NOA_TESTING,
    PAGE_BRAILLE_CODE_CHECK_1,
    PAGE_BRAILLE_CODE_CHECK_2,
#elif GERMAN
    PAGE_NOE_TESTING,
    PAGE_BRAILLE_CODE_CHECK_1,
#endif

    PAGE_SPECIAL_THANKS_4,
    PAGE_SPECIAL_THANKS_5,

    PAGE_COUNT
};

#if ENGLISH
#define POKEMON_TILE_COUNT 68
#define LAST_PAGE (PAGE_TEXT_EDITOR)
#define UNK_DEFINE_45 (0x45)
#define UNK_DEFINE_82 (0x82)
#define UNK_DEF_1F3 (499)
#elif GERMAN
#define POKEMON_TILE_COUNT 65
#define LAST_PAGE (PAGE_NOE_TESTING)
#define UNK_DEFINE_45 (8)
#define UNK_DEFINE_82 (0x8D)
#define UNK_DEF_1F3 (554)
#endif

#define COLOR_DARK_GREEN 0x1967
#define COLOR_LIGHT_GREEN 0x328D

enum
{
    TDA_0 = 0,
    TDA_TASK_C_ID = 1,
    TDA_TASK_E_ID = 2,
    TDA_TASK_D_ID = 3,
    TDA_4 = 4,
    TDA_PLAYER_CYCLIST = 5,
    TDA_RIVAL_CYCLIST = 6,
    TDA_7 = 7, // Has something to do with the bike scene
    TDA_11 = 11, // Gets set depending on whether the bike or the grass scene should be shown
    TDA_12 = 12,
    TDA_13 = 13,
    TDA_14 = 14,
    TDA_TASK_B_ID = 15,

    // Appears to be responsible for text
    TDB_0 = 0,
    TDB_TASK_A_ID = 1,
    TDB_CURRENT_PAGE = 2,
    TDB_3 = 3,

    TDC_0 = 0,
    TDC_1 = 1,
    TDC_2 = 2,
    TDC_3 = 3,
    TDC_4 = 4,
    TDC_5 = 5,

    TDD_STATE = 0,
    TDD_TASK_A_ID = 1,
    TDD_2 = 2,
    TDD_3 = 3,

    TDE_0 = 0,
    TDE_1 = 1,
    TDE_TASK_A_ID = 2,
};


struct Unk201C000
{
    u16 unk0[POKEMON_TILE_COUNT];
    u16 unk88;
    u16 unk8A;
    u16 unk8C;
    u16 unk8E;
    u16 unk90[386];
    u16 unk394;
};

struct CreditsEntry
{
    u8 var_0;
    const u8 *text;
};

extern u8 unk_201e800[0x800];
extern u8 unk_201f000[0x800];

extern struct SpriteTemplate gUnknown_02024E8C;

extern u16 gUnknown_02039358;
extern s16 gUnknown_0203935A;
extern s16 gUnknown_0203935C;

static EWRAM_DATA s16 gUnknown_02039320 = 0;
static EWRAM_DATA u16 gUnknown_02039322 = 0; // TASK A
EWRAM_DATA u8 gUnknown_02039324 = 0;
static EWRAM_DATA u8 gUnknown_02039325 = 0;

extern u8 gReservedSpritePaletteCount;

// data/hall_of_fame
extern void *gUnknown_0840B5A0[];

// data/credits
const u16 gUnknown_0840B7BC[] = INCBIN_U16("graphics/credits/palette_1.gbapal");
const u8 gUnknown_0840B7FC[] = INCBIN_U8("graphics/credits/ampersand.4bpp");

void spritecb_814580C(struct Sprite *sprite);

const u8 gUnknown_0840B83C[] =
{
    0,    1, 0,
    0xFF, 1, 0xFF,
    0xFF, 1, 0xFF,
    0xFF, 1, 0xFF,
    0xFF, 1, 0xFF,
};

const u8 gUnknown_0840B84B[] =
{
    1, 0xFF, 1,
    1, 0xFF, 1,
    1, 2,    1,
    1, 0xFF, 1,
    1, 0xFF, 1,
};

const u8 gUnknown_0840B85A[] =
{
    1, 0, 0,
    1, 0xFF, 0xFF,
    1, 2,    2,
    1, 0xFF, 0xFF,
    1, 0x80, 0x80,
};

const u8 gUnknown_0840B869[] =
{
    1, 3, 1,
    1, 4, 1,
    1, 5, 1,
    1, 0xC4, 1,
    1, 0xC3, 1,
};

const u8 gUnknown_0840B878[] =
{
    1, 6, 7,
    1, 8, 9,
    1, 0xFF, 1,
    1, 0x88, 0x89,
    1, 0x86, 0x87,
#ifdef GERMAN
    1, 0, 0,
    1, 0xFF, 0xFF,
    1, 0x80, 0x8A,
    1, 0xFF, 0xFF,
    1, 0xFF, 0xFF,
    0, 1, 0,
    0xFF, 1, 0xFF,
    0xFF, 1, 0xFF,
    0xFF, 1, 0xFF,
    0x80, 1, 0x80,
#endif
};

#ifdef GERMAN
#include "data/credits_de.h"
#else
#include "data/credits_en.h"
#endif

const u8 gUnknown_0840CA00[][2] =
{
    {104, 36},
    {120, 36},
    {136, 36},
};

static const union AnimCmd gSpriteAnim_840CA08[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(64, 8),
    ANIMCMD_FRAME(128, 8),
    ANIMCMD_FRAME(192, 8),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gSpriteAnim_840CA1C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(128, 4),
    ANIMCMD_FRAME(192, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gSpriteAnim_840CA30[] =
{
    ANIMCMD_FRAME(256, 4),
    ANIMCMD_FRAME(320, 4),
    ANIMCMD_FRAME(384, 4),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_840CA40[] =
{
    ANIMCMD_FRAME(384, 30),
    ANIMCMD_FRAME(320, 30),
    ANIMCMD_FRAME(256, 30),
    ANIMCMD_FRAME(256, 30),
    ANIMCMD_END,
};

static const union AnimCmd *const gSpriteAnimTable_0840CA54[] =
{
    gSpriteAnim_840CA08,
    gSpriteAnim_840CA1C,
    gSpriteAnim_840CA30,
    gSpriteAnim_840CA40,
};

static const union AnimCmd gSpriteAnim_840CA64[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(64, 8),
    ANIMCMD_FRAME(128, 8),
    ANIMCMD_FRAME(192, 8),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gSpriteAnim_840CA78[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(64, 4),
    ANIMCMD_FRAME(128, 4),
    ANIMCMD_FRAME(192, 4),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd gSpriteAnim_840CA8C[] =
{
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END,
};

static const union AnimCmd *const gSpriteAnimTable_0840CA94[] =
{
    gSpriteAnim_840CA64,
    gSpriteAnim_840CA78,
    gSpriteAnim_840CA8C,
};

static const struct SpriteSheet gUnknown_0840CAA0[] = {{ewram1E000_2, 6144, 1001}, {0}};
static const struct SpritePalette gUnknown_0840CAB0[] = {{ewram_1F800_2, 1001}, {0}};

static const struct OamData gOamData_840CAC0 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd gSpriteAnim_840CAC8[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_840CAD0[] =
{
    ANIMCMD_FRAME(64, 8),
    ANIMCMD_END,
};

static const union AnimCmd gSpriteAnim_840CAD8[] =
{
    ANIMCMD_FRAME(128, 8),
    ANIMCMD_END,
};

static const union AnimCmd *const gSpriteAnimTable_840CAE0[] =
{
    gSpriteAnim_840CAC8,
    gSpriteAnim_840CAD0,
    gSpriteAnim_840CAD8,
};

static const struct SpriteTemplate gSpriteTemplate_840CAEC =
{
    .tileTag = 1001,
    .paletteTag = 1001,
    .oam = &gOamData_840CAC0,
    .anims = gSpriteAnimTable_840CAE0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = spritecb_814580C,
};

// graphics
extern u8 gCreditsCopyrightEnd_Gfx[];
extern u16 gIntroCopyright_Pal[16];

static void task_a_8143B38(u8 taskIdA);
static void task_a_8143B68(u8 taskIdA);
static void task_a_8143BFC(u8 taskIdA);
static void task_a_80C9BFC(u8 taskIdA);
static void task_a_8143CC0(u8 taskIdA);
static void task_a_8143D04(u8 taskIdA);
static void task_a_8143EBC(u8 taskIdA);
static void task_a_8143F04(u8 taskIdA);
static void task_a_8143F3C(u8 taskIdA);
static void task_a_8143FDC(u8 taskIdA);
static void task_a_8144024(u8 taskIdA);
static void task_a_8144080(u8 taskIdA);
static void task_a_8144114(u8 taskIdA);
static void sub_8144130(void);
static void task_b_81441B8(u8 taskIdB);
static u8 sub_8144454(u8 page, u8 taskIdA);
static void task_d_8144514(u8 taskIdD);
static bool8 sub_8144ECC(u8 data, u8 taskIdA);
static void sub_81450AC(u8 taskIdA);
static void sub_8145128(u16, u16, u16);
static void sub_81452D0(u16 arg0, u16 palette);
static void spritecb_player_8145378(struct Sprite *sprite);
static void spritecb_rival_8145420(struct Sprite *sprite);
static u8 sub_81456B4(u16 species, u16 x, u16 y, u16 position);
static void sub_81458DC(void);

static void vblank_8143948(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_814395C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();

    if ((gMain.heldKeys & B_BUTTON)
     && gUnknown_02039324 != 0
     && gTasks[gUnknown_02039322].func == task_a_8143B68)
    {
        vblank_8143948();
        RunTasks();
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
        gUnknown_02039325 = 1;
    }
}

void sub_81439D0(void)
{
    u8 taskIdA;
    s16 taskIdC;
    u8 taskIdB;
    u16 savedIme;
    struct Unk201C000 *c000;

    sub_8144130();
    SetVBlankCallback(NULL);
    ResetPaletteFade();
    ResetTasks();

    taskIdA = CreateTask(task_a_8143B38, 0);

    gTasks[taskIdA].data[TDA_4] = 0;
    gTasks[taskIdA].data[TDA_7] = 0;
    gTasks[taskIdA].data[TDA_11] = 0;
    gTasks[taskIdA].data[TDA_13] = 1;

    while (TRUE)
    {
        if (sub_8144ECC(0, taskIdA))
            break;
    }

    taskIdC = gTasks[taskIdA].data[TDA_TASK_C_ID];
    gTasks[taskIdC].data[TDC_0] = 40;

    Text_LoadWindowTemplate(&gWindowTemplate_81E7208);
    InitMenuWindow(&gWindowTemplate_81E7208);
    LoadPalette(&gUnknown_0840B7BC, 0x80, sizeof(gUnknown_0840B7BC));

    CpuCopy16(&gUnknown_0840B7FC, (void *)(VRAM + 0xBEE0), sizeof(gUnknown_0840B7FC));

    REG_BG0VOFS = 0xFFFC;

    taskIdB = CreateTask(task_b_81441B8, 0);

    gTasks[taskIdB].data[TDB_TASK_A_ID] = taskIdA;
    gTasks[taskIdA].data[TDA_TASK_B_ID] = taskIdB;

    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));

    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;


    SetVBlankCallback(vblank_8143948);
    m4aSongNumStart(MUS_THANKFOR);
    SetMainCallback2(sub_814395C);
    gUnknown_02039325 = 0;

    c000 = &ewram1c000;

    sub_81458DC();

    c000->unk88 = 0;
    c000->unk8A = 0;
    c000->unk8C = 0;

    gUnknown_02039322 = taskIdA;
}

static void task_a_8143B38(u8 taskIdA)
{
    if (!gPaletteFade.active)
        gTasks[taskIdA].func = task_a_8143B68;
}

static void task_a_8143B68(u8 taskIdA)
{
    u16 data1;

    if (gTasks[taskIdA].data[TDA_4])
    {
        s16 taskIdC;

        taskIdC = gTasks[taskIdA].data[TDA_TASK_C_ID];
        gTasks[taskIdC].data[TDC_0] = 30;

        gTasks[taskIdA].data[TDA_12] = 0x100;
        gTasks[taskIdA].func = task_a_8143EBC;
        return;
    }

    gUnknown_02039320 = 0;
    data1 = gTasks[taskIdA].data[TDA_11];

    if (gTasks[taskIdA].data[TDA_11] == 1)
    {
        gTasks[taskIdA].data[TDA_13] = data1;
        gTasks[taskIdA].data[TDA_11] = 0;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskIdA].func = task_a_8143BFC;
    }
    else if (gTasks[taskIdA].data[TDA_11] == 2)
    {
        gTasks[taskIdA].data[TDA_13] = data1;
        gTasks[taskIdA].data[TDA_11] = 0;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gTasks[taskIdA].func = task_a_8143CC0;
    }
}

static void task_a_8143BFC(u8 taskIdA)
{
    if (!gPaletteFade.active)
    {
        REG_DISPCNT = 0;
        sub_81450AC(taskIdA);
        gTasks[taskIdA].func = task_a_80C9BFC;
    }
}

static void task_a_80C9BFC(u8 taskIdA)
{
    u16 backup;

    SetVBlankCallback(NULL);

    if (sub_8144ECC(gTasks[taskIdA].data[TDA_7], taskIdA))
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));

        backup = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = backup;
        REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;

        SetVBlankCallback(vblank_8143948);
        gTasks[taskIdA].func = task_a_8143B38;
    }
}

static void task_a_8143CC0(u8 taskIdA)
{
    if (!gPaletteFade.active)
    {
        REG_DISPCNT = 0;
        sub_81450AC(taskIdA);
        gTasks[taskIdA].func = task_a_8143D04;
    }
}

void task_a_8143D04(u8 taskIdA)
{
    switch (gMain.state)
    {
    default:
    case 0:
    {
        u16 i;

        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
        LZ77UnCompVram(&gBirchHelpGfx, (void *)VRAM);
        LZ77UnCompVram(&gBirchGrassTilemap, (void *)(VRAM + 0x3800));
        LoadPalette(gBirchBagGrassPal[0] + 1, 1, 31 * 2);

        for (i = 0; i < 0x800; i++)
            HALL_OF_FAME_SHEET_0[i] = 0x11;
        for (i = 0; i < 0x800; i++)
            HALL_OF_FAME_SHEET_1[i] = 0x22;
        for (i = 0; i < 0x800; i++)
            HALL_OF_FAME_SHEET_2[i] = 0x33;

        EWRAM_1F800[0] = 0;
        EWRAM_1F800[1] = 0x53FF; // light yellow
        EWRAM_1F800[2] = 0x529F; // light red
        EWRAM_1F800[3] = 0x7E94; // light blue

        LoadSpriteSheet(gUnknown_0840CAA0);
        LoadSpritePalette(gUnknown_0840CAB0);

        gMain.state += 1;
        break;
    }
    case 1:
        gTasks[taskIdA].data[TDA_TASK_D_ID] = CreateTask(task_d_8144514, 0);
        gTasks[gTasks[taskIdA].data[TDA_TASK_D_ID]].data[TDD_STATE] = 1;
        gTasks[gTasks[taskIdA].data[TDA_TASK_D_ID]].data[TDD_TASK_A_ID] = taskIdA;
        gTasks[gTasks[taskIdA].data[TDA_TASK_D_ID]].data[TDD_2] = gTasks[taskIdA].data[TDA_7];

        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        REG_BG3HOFS = 0;
        REG_BG3VOFS = 32;
        REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(7) | BGCNT_16COLOR | BGCNT_TXT256x256;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON;

        gMain.state = 0;
        gUnknown_0203935C = 0;
        gTasks[taskIdA].func = task_a_8143B38;
        break;
    }
}

static void task_a_8143EBC(u8 taskIdA)
{
    if (gTasks[taskIdA].data[TDA_12])
    {
        gTasks[taskIdA].data[TDA_12] -= 1;
        return;
    }

    BeginNormalPaletteFade(0xFFFFFFFF, 12, 0, 16, RGB(0, 0, 0));
    gTasks[taskIdA].func = task_a_8143F04;
}

static void task_a_8143F04(u8 taskIdA)
{
    if (!gPaletteFade.active)
    {
        sub_81450AC(taskIdA);
        gTasks[taskIdA].func = task_a_8143F3C;
    }
}

static void task_a_8143F3C(u8 taskIdA)
{
    u16 backup;

    sub_8144130();
    ResetPaletteFade();
    sub_8145128(0, 0x3800, 0);
    ResetSpriteData();
    FreeAllSpritePalettes();
    BeginNormalPaletteFade(0xFFFFFFFF, 8, 16, 0, RGB(0, 0, 0));

    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(7) | BGCNT_16COLOR | BGCNT_TXT256x256;
    backup = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = backup;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON;

    gTasks[taskIdA].data[TDA_0] = 0x100;
    gTasks[taskIdA].func = task_a_8143FDC;
}

static void task_a_8143FDC(u8 taskIdA)
{
    if (gTasks[taskIdA].data[TDA_0])
    {
        gTasks[taskIdA].data[TDA_0] -= 1;
        return;
    }

    BeginNormalPaletteFade(0xFFFFFFFF, 6, 0, 16, RGB(0, 0, 0));
    gTasks[taskIdA].func = task_a_8144024;
}

static void task_a_8144024(u8 taskIdA)
{
    if (!gPaletteFade.active)
    {
        sub_81452D0(0x3800, 0);

        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0, RGB(0, 0, 0));
        gTasks[taskIdA].data[TDA_0] = 7200;
        gTasks[taskIdA].func = task_a_8144080;
    }
}

static void task_a_8144080(u8 taskIdA)
{
    if (!gPaletteFade.active)
    {
        if (gTasks[taskIdA].data[TDA_0] == 0)
        {
            FadeOutBGM(4);
            BeginNormalPaletteFade(0xFFFFFFFF, 8, 0, 16, FADE_COLOR_WHITE);
            gTasks[taskIdA].func = task_a_8144114;
            return;
        }

        if (gMain.newKeys)
        {
            FadeOutBGM(4);
            BeginNormalPaletteFade(0xFFFFFFFF, 8, 0, 16, FADE_COLOR_WHITE);
            gTasks[taskIdA].func = task_a_8144114;
            return;
        }

        if (gTasks[taskIdA].data[TDA_0] == 7144)
        {
            FadeOutBGM(8);
        }

        if (gTasks[taskIdA].data[TDA_0] == 6840)
            m4aSongNumStart(MUS_END);

        gTasks[taskIdA].data[TDA_0] -= 1;
    }
}

static void task_a_8144114(u8 taskIdA)
{
    if (!gPaletteFade.active)
        SoftReset(0xFF);
}

static void sub_8144130(void)
{
    REG_DISPCNT = 0;

    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;

    DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);
}

static void task_b_81441B8(u8 taskIdB)
{
    u16 i;

    switch (gTasks[taskIdB].data[TDB_0])
    {
    case 0:
    case 6:
    case 7:
    case 8:
    case 9:
    default:
        if (!gPaletteFade.active)
        {
            gTasks[taskIdB].data[TDB_0] = 1;
            gTasks[taskIdB].data[TDB_3] = 0x58;
            gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_14] = 0;
            gUnknown_02039320 = 0;
        }
        return;
    case 1:
        if (gTasks[taskIdB].data[TDB_3] != 0)
        {
            gTasks[taskIdB].data[TDB_3] -= 1;
            return;
        }
        gTasks[taskIdB].data[TDB_0] += 1;
        return;
    case 2:
        REG_DISPCNT &= ~DISPCNT_BG0_ON;
        if (gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].func == task_a_8143B68)
        {
            if (gTasks[taskIdB].data[TDB_CURRENT_PAGE] < PAGE_COUNT)
            {
                for (i = 0; i < 5; i++)
                    MenuPrint_Centered(gCreditsEntryPointerTable[gTasks[taskIdB].data[TDB_CURRENT_PAGE]][i]->text, 0, 9 + i * 2, 240);

                gTasks[taskIdB].data[TDB_CURRENT_PAGE] += 1;
                gTasks[taskIdB].data[TDB_0] += 1;

                gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_14] = 1;

                if (gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_13] == 1)
                    BeginNormalPaletteFade(0x300, 0, 16, 0, COLOR_LIGHT_GREEN);
                else
                    BeginNormalPaletteFade(0x300, 0, 16, 0, COLOR_DARK_GREEN);
                return;
            }
            gTasks[taskIdB].data[TDB_0] = 10;
            return;
        }
        gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_14] = 0;
        return;
    case 3:
        REG_DISPCNT |= DISPCNT_BG0_ON;
        if (!gPaletteFade.active)
        {
            gTasks[taskIdB].data[TDB_3] = UNK_DEFINE_82;
            gTasks[taskIdB].data[TDB_0] += 1;
        }
        return;
    case 4:
        if (gTasks[taskIdB].data[TDB_3] != 0)
        {
            gTasks[taskIdB].data[TDB_3] -= 1;
            return;
        }

        if (sub_8144454((u8)gTasks[taskIdB].data[TDB_CURRENT_PAGE], (u8)gTasks[taskIdB].data[TDB_TASK_A_ID]))
        {
            gTasks[taskIdB].data[TDB_0] += 1;
            return;
        }
        gTasks[taskIdB].data[TDB_0] += 1;
        if (gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_13] == 1)
            BeginNormalPaletteFade(0x300, 0, 0, 16, COLOR_LIGHT_GREEN);
        else
            BeginNormalPaletteFade(0x300, 0, 0, 16, COLOR_DARK_GREEN);
        return;
    case 5:
        if (!gPaletteFade.active)
        {
            Menu_EraseWindowRect(0, 9, 29, 19);
            gTasks[taskIdB].data[TDB_0] = 2;
        }
        return;

    case 10:
        gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_4] = 1;
        DestroyTask(taskIdB);
        return;
    }
}

static u8 sub_8144454(u8 page, u8 taskIdA)
{
    // Starts with bike + ocean + morning

    if (page == PAGE_PROGRAMMERS_1)
    {
        // Grass patch
        gTasks[taskIdA].data[TDA_11] = 2;
    }

    if (page == PAGE_POKEMON_GRAHPIC_DESIGNERS_3)
    {
        // Bike + ocean + sunset
        gTasks[taskIdA].data[TDA_7] = 1;
        gTasks[taskIdA].data[TDA_11] = 1;
    }

    if (page == PAGE_GAME_DESIGNERS_2)
    {
        // Grass patch
        gTasks[taskIdA].data[TDA_11] = 2;
    }

    if (page == PAGE_MAP_DATA_DESIGNERS)
    {
        // Bike + forest + sunset
        gTasks[taskIdA].data[TDA_7] = 2;
        gTasks[taskIdA].data[TDA_11] = 1;
    }

    if (page == PAGE_SPECIAL_THANKS_1)
    {
        // Grass patch
        gTasks[taskIdA].data[TDA_11] = 2;
    }

    if (page == PAGE_TASK_MANAGERS)
    {
        // Bike + forest + sunset
        gTasks[taskIdA].data[TDA_7] = 3;
        gTasks[taskIdA].data[TDA_11] = 1;
    }

    if (page == PAGE_TRANSLATION_COORDINATOR)
    {
        // Grass patch
        gTasks[taskIdA].data[TDA_11] = 2;
    }

    if (page == LAST_PAGE)
    {
        // Bike + town + night
        gTasks[taskIdA].data[TDA_7] = 4;
        gTasks[taskIdA].data[TDA_11] = 1;
    }

    if (gTasks[taskIdA].data[TDA_11] != 0)
    {
        // Returns true if changed?
        return TRUE;
    }

    return FALSE;
}

static void task_d_8144514(u8 taskIdD)
{
    struct Unk201C000 *r6 = &ewram1c000;
    u8 r2;

    switch (gTasks[taskIdD].data[TDD_STATE])
    {
    case 0:
        break;
    case 1:
        if (r6->unk8A == 0 && gTasks[gTasks[taskIdD].data[TDD_TASK_A_ID]].data[TDA_14] == 0)
            break;
        gTasks[gTasks[taskIdD].data[TDD_TASK_A_ID]].data[TDA_14] = 0;
        gTasks[taskIdD].data[TDD_STATE]++;
        break;
    case 2:
        if (r6->unk88 == POKEMON_TILE_COUNT || gTasks[gTasks[taskIdD].data[TDD_TASK_A_ID]].func != task_a_8143B68)
            break;
        r2 = sub_81456B4(r6->unk0[r6->unk8C], gUnknown_0840CA00[r6->unk8A][0], gUnknown_0840CA00[r6->unk8A][1], r6->unk8A);
        if (r6->unk8C < r6->unk8E - 1)
        {
            r6->unk8C++;
            gSprites[r2].data[3] = 50;
        }
        else
        {
            r6->unk8C = 0;
            gSprites[r2].data[3] = 512;
        }
        r6->unk88++;
        if (r6->unk8A == 2)
            r6->unk8A = 0;
        else
            r6->unk8A++;
        gTasks[taskIdD].data[TDD_3] = 50;
        gTasks[taskIdD].data[TDD_STATE]++;
        break;
    case 3:
        if (gTasks[taskIdD].data[TDD_3] != 0)
            gTasks[taskIdD].data[TDD_3]--;
        else
            gTasks[taskIdD].data[TDD_STATE] = 1;
        break;
    }
}

void task_c_8144664(u8 taskIdC)
{
    switch (gTasks[taskIdC].data[TDC_0])
    {
    case 0:
        gUnknown_0203935A = Sin((gTasks[taskIdC].data[TDC_5] >> 1) & 0x7F, 12);
        gTasks[taskIdC].data[TDC_5]++;
        break;
    case 1:
        if (gUnknown_0203935A != 0)
        {
            gUnknown_0203935A = Sin((gTasks[taskIdC].data[TDC_5] >> 1) & 0x7F, 12);
            gTasks[taskIdC].data[TDC_5]++;
        }
        else
        {
            gSprites[gTasks[taskIdC].data[TDC_2]].data[0] = 2;
            gTasks[taskIdC].data[TDC_5] = 0;
            gTasks[taskIdC].data[TDC_0]++;
        }
        break;
    case 2:
        if (gTasks[taskIdC].data[TDC_5] < 64)
        {
            gTasks[taskIdC].data[TDC_5]++;
            gUnknown_0203935A = Sin(gTasks[taskIdC].data[TDC_5] & 0x7F, 20);
        }
        else
        {
            gTasks[taskIdC].data[TDC_0]++;
        }
        break;
    case 3:
        gSprites[gTasks[taskIdC].data[TDC_2]].data[0] = 3;
        gSprites[gTasks[taskIdC].data[TDC_3]].data[0] = 1;
        gTasks[taskIdC].data[TDC_4] = 120;
        gTasks[taskIdC].data[TDC_0]++;
        break;
    case 4:
        if (gTasks[taskIdC].data[TDC_4] != 0)
        {
            gTasks[taskIdC].data[TDC_4]--;
        }
        else
        {
            gTasks[taskIdC].data[TDC_5] = 64;
            gTasks[taskIdC].data[TDC_0]++;
        }
        break;
    case 5:
        if (gTasks[taskIdC].data[TDC_5] > 0)
        {
            gTasks[taskIdC].data[TDC_5]--;
            gUnknown_0203935A = Sin(gTasks[taskIdC].data[TDC_5] & 0x7F, 20);
        }
        else
        {
            gSprites[gTasks[taskIdC].data[TDC_2]].data[0] = 1;
            gTasks[taskIdC].data[TDC_0]++;
        }
        break;
    case 6:
        gTasks[taskIdC].data[TDC_0] = 50;
        break;
    case 10:
        gSprites[gTasks[taskIdC].data[TDC_3]].data[0] = 2;
        gTasks[taskIdC].data[TDC_0] = 50;
        break;
    case 20:
        gSprites[gTasks[taskIdC].data[TDC_2]].data[0] = 4;
        gTasks[taskIdC].data[TDC_0] = 50;
        break;
    case 30:
        gSprites[gTasks[taskIdC].data[TDC_2]].data[0] = 5;
        gSprites[gTasks[taskIdC].data[TDC_3]].data[0] = 3;
        gTasks[taskIdC].data[TDC_0] = 50;
        break;
    case 50:
        gTasks[taskIdC].data[TDC_0] = 0;
        break;
    }
}

void task_e_8144934(u8 taskIdE)
{
    s16 taskIdC;

    switch (gTasks[taskIdE].data[TDE_0])
    {
    default:
    case 0:
        if (gTasks[taskIdE].data[TDE_1] != 0x7FFF)
        {

            if (gTasks[gTasks[gTasks[taskIdE].data[TDE_TASK_A_ID]].data[TDA_TASK_B_ID]].data[TDB_CURRENT_PAGE] == PAGE_ART_DIRECTOR)
            {
                gTasks[gTasks[gTasks[taskIdE].data[TDE_TASK_A_ID]].data[TDA_TASK_C_ID]].data[TDC_0] = 20;
                gTasks[taskIdE].data[TDE_1] = 0x7FFF;
            }
        }
        sub_8149020(0);
        break;
    case 1:
        sub_8149020(0);
        break;
    case 2:
        if (gTasks[taskIdE].data[TDE_1] != 0x7FFF)
        {
            taskIdC = gTasks[gTasks[taskIdE].data[TDE_TASK_A_ID]].data[TDA_TASK_C_ID];

            // Floor to multiple of 128
            if ((gTasks[taskIdC].data[TDC_5] & -128) == 640)
            {
                gTasks[taskIdC].data[TDC_0] = 1;
                gTasks[taskIdE].data[TDE_1] = 0x7FFF;
            }
        }
        sub_8149020(1);
        break;
    case 3:
        if (gTasks[taskIdE].data[TDE_1] != 0x7FFF)
        {

            if (gTasks[taskIdE].data[TDE_1] == UNK_DEF_1F3)
            {
                gTasks[gTasks[gTasks[taskIdE].data[TDE_TASK_A_ID]].data[TDA_TASK_C_ID]].data[TDC_0] = 10;
                gTasks[taskIdE].data[TDE_1] = 0x7FFF;
            }
            else
            {
                gTasks[taskIdE].data[TDE_1] += 1;
            }
        }
        sub_8149020(1);
        break;
    case 4:
        sub_8149020(2);
        break;
    }
}

static void sub_8144A68(u8 data, u8 taskIdA)
{
    switch (data)
    {
    case 0:
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.x = 272;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.x = 272;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].data[0] = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].data[0] = 0;
        gTasks[taskIdA].data[TDA_0] = sub_8148EC0(0, 0x2000, 0x20, 8);
        break;
    case 1:
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.x = 120;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.x = 272;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].data[0] = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].data[0] = 0;
        gTasks[taskIdA].data[TDA_0] = sub_8148EC0(0, 0x2000, 0x20, 8);
        break;
    case 2:
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.x = 120;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.x = 272;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].data[0] = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].data[0] = 0;
        gTasks[taskIdA].data[TDA_0] = sub_8148EC0(1, 0x2000, 0x200, 8);
        break;
    case 3:
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.x = 120;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.x = -32;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].data[0] = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].data[0] = 0;
        gTasks[taskIdA].data[TDA_0] = sub_8148EC0(1, 0x2000, 0x200, 8);
        break;
    case 4:
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].invisible = 0;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.x = 88;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.x = 152;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].pos1.y = 46;
        gSprites[gTasks[taskIdA].data[TDA_PLAYER_CYCLIST]].data[0] = 0;
        gSprites[gTasks[taskIdA].data[TDA_RIVAL_CYCLIST]].data[0] = 0;
        gTasks[taskIdA].data[TDA_0] = sub_8148EC0(2, 0x2000, 0x200, 8);
        break;
    }

    gTasks[taskIdA].data[TDA_TASK_E_ID] = CreateTask(task_e_8144934, 0);
    gTasks[gTasks[taskIdA].data[TDA_TASK_E_ID]].data[TDE_0] = data;
    gTasks[gTasks[taskIdA].data[TDA_TASK_E_ID]].data[TDE_1] = 0;
    gTasks[gTasks[taskIdA].data[TDA_TASK_E_ID]].data[TDE_TASK_A_ID] = taskIdA;

    gTasks[taskIdA].data[TDA_TASK_C_ID] = CreateTask(task_c_8144664, 0);
    gTasks[gTasks[taskIdA].data[TDA_TASK_C_ID]].data[TDC_0] = 0;
    gTasks[gTasks[taskIdA].data[TDA_TASK_C_ID]].data[TDC_1] = taskIdA;
    gTasks[gTasks[taskIdA].data[TDA_TASK_C_ID]].data[TDC_2] = gTasks[taskIdA].data[TDA_PLAYER_CYCLIST];
    gTasks[gTasks[taskIdA].data[TDA_TASK_C_ID]].data[TDC_3] = gTasks[taskIdA].data[TDA_RIVAL_CYCLIST];
    gTasks[gTasks[taskIdA].data[TDA_TASK_C_ID]].data[TDC_4] = 0;

    if (data == 2)
        gTasks[gTasks[taskIdA].data[TDA_TASK_C_ID]].data[TDC_5] = UNK_DEFINE_45;
}

static bool8 sub_8144ECC(u8 data, u8 taskIdA)
{
    u8 spriteId;

    switch (gMain.state)
    {
    default:
    case 0:
        REG_DISPCNT = 0;
        REG_BG3HOFS = 8;
        REG_BG3VOFS = 0;
        REG_BG2HOFS = 0;
        REG_BG2VOFS = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        ResetSpriteData();
        FreeAllSpritePalettes();
        gMain.state = 1;
        break;
    case 1:
        gUnknown_02039358 = 34;
        gUnknown_0203935A = 0;
        sub_8148CB0(data);
        gMain.state += 1;
        break;
    case 2:
        if (gSaveBlock2.playerGender == MALE)
        {
            LoadCompressedObjectPic(gIntro2BrendanSpriteSheet);
            LoadCompressedObjectPic(gUnknown_08416E34);
            LoadCompressedObjectPic(gIntro2BicycleSpriteSheet);
            LoadSpritePalettes(gIntro2SpritePalettes);

            spriteId = intro_create_brendan_sprite(120, 46);
            gTasks[taskIdA].data[TDA_PLAYER_CYCLIST] = spriteId;
            gSprites[spriteId].callback = spritecb_player_8145378;
            gSprites[spriteId].anims = gSpriteAnimTable_0840CA54;

            spriteId = intro_create_may_sprite(272, 46);
            gTasks[taskIdA].data[TDA_RIVAL_CYCLIST] = spriteId;
            gSprites[spriteId].callback = spritecb_rival_8145420;
            gSprites[spriteId].anims = gSpriteAnimTable_0840CA94;
        }
        else
        {
            LoadCompressedObjectPic(gIntro2MaySpriteSheet);
            LoadCompressedObjectPic(gUnknown_08416E24);
            LoadCompressedObjectPic(gIntro2BicycleSpriteSheet);
            LoadSpritePalettes(gIntro2SpritePalettes);

            spriteId = intro_create_may_sprite(120, 46);
            gTasks[taskIdA].data[TDA_PLAYER_CYCLIST] = spriteId;
            gSprites[spriteId].callback = spritecb_player_8145378;
            gSprites[spriteId].anims = gSpriteAnimTable_0840CA54;

            spriteId = intro_create_brendan_sprite(272, 46);
            gTasks[taskIdA].data[TDA_RIVAL_CYCLIST] = spriteId;
            gSprites[spriteId].callback = spritecb_rival_8145420;
            gSprites[spriteId].anims = gSpriteAnimTable_0840CA94;
        };
        gMain.state += 1;
        break;
    case 3:
        sub_8144A68(data, taskIdA);
        sub_8148E90(data);
        gMain.state = 0;
        return TRUE;
    }
    return FALSE;
}

static void sub_81450AC(u8 taskIdA)
{
    if (gTasks[taskIdA].data[TDA_0] != 0)
    {
        DestroyTask(gTasks[taskIdA].data[TDA_0]);
        gTasks[taskIdA].data[TDA_0] = 0;
    }

    if (gTasks[taskIdA].data[TDA_TASK_C_ID] != 0)
    {
        DestroyTask(gTasks[taskIdA].data[TDA_TASK_C_ID]);
        gTasks[taskIdA].data[TDA_TASK_C_ID] = 0;
    }

    if (gTasks[taskIdA].data[TDA_TASK_E_ID] != 0)
    {
        DestroyTask(gTasks[taskIdA].data[TDA_TASK_E_ID]);
        gTasks[taskIdA].data[TDA_TASK_E_ID] = 0;
    }

    if (gTasks[taskIdA].data[TDA_TASK_D_ID] != 0)
    {
        DestroyTask(gTasks[taskIdA].data[TDA_TASK_D_ID]);
        gTasks[taskIdA].data[TDA_TASK_D_ID] = 0;
    }

    gUnknown_0203935C = 1;
}

static void sub_8145128(u16 arg0, u16 arg1, u16 arg2)
{
    u16 baseTile;
    u16 i;

    LZ77UnCompVram(gCreditsCopyrightEnd_Gfx, (void *) (VRAM + arg0));
    LoadPalette(gIntroCopyright_Pal, arg2, sizeof(gIntroCopyright_Pal));

    baseTile = (arg2 / 16) << 12;

    for (i = 0; i < 32 * 32; i++)
        ((u16 *) (VRAM + arg1))[i] = baseTile + 1;

    for (i = 0; i < 21; i++)
        ((u16 *) (VRAM + arg1))[7 * 32 + 4 + i] = i + 2 + baseTile;

    for (i = 0; i < 20; i++)
        ((u16 *) (VRAM + arg1))[9 * 32 + 4 + i] = i + 23 + baseTile;

    for (i = 0; i < 23; i++)
        ((u16 *) (VRAM + arg1))[11 * 32 + 4 + i] = i + 43 + baseTile;

    for (i = 0; i < 12; i++)
        ((u16 *) (VRAM + arg1))[13 * 32 + 4 + i] = i + 66 + baseTile;
}

u16 sub_8145208(u8 arg0)
{
    u16 out = (arg0 & 0x3F) + 80;

    if (arg0 == 0xFF)
        return 1;

    if (arg0 & (1 << 7))
        out |= 1 << 11;
    if (arg0 & (1 << 6))
        out |= 1 << 10;

    return out;
}

void sub_814524C(const u8 arg0[], u8 baseX, u8 baseY, u16 arg3, u16 palette)
{
    u8 y, x;
    const u16 tileOffset = (palette / 16) << 12;

    for (y = 0; y < 5; y++)
    {
        for (x = 0; x < 3; x++)
            ((u16 *) (VRAM + arg3 + (baseY + y) * 64))[baseX + x] = tileOffset + sub_8145208(arg0[y * 3 + x]);
    }
}

static void sub_81452D0(u16 arg0, u16 palette)
{
    u16 pos;
    u16 baseTile = (palette / 16) << 12;

    for (pos = 0; pos < 32 * 32; pos++)
        ((u16 *) (VRAM + arg0))[pos] = baseTile + 1;

#if ENGLISH
    sub_814524C(gUnknown_0840B83C, 3, 7, arg0, palette);
    sub_814524C(gUnknown_0840B84B, 7, 7, arg0, palette);
    sub_814524C(gUnknown_0840B85A, 11, 7, arg0, palette);
    sub_814524C(gUnknown_0840B85A, 16, 7, arg0, palette);
    sub_814524C(gUnknown_0840B869, 20, 7, arg0, palette);
    sub_814524C(gUnknown_0840B878, 24, 7, arg0, palette);
#elif GERMAN
    sub_814524C(gUnknown_0840B85A, 7, 7, arg0, palette);
    sub_814524C(gUnknown_0840B869, 11, 7, arg0, palette);
    sub_814524C(gUnknown_0840B878, 15, 7, arg0, palette);
    sub_814524C(gUnknown_0840B85A, 19, 7, arg0, palette);
#endif
}

static void spritecb_player_8145378(struct Sprite *sprite)
{
    if (gUnknown_0203935C != 0)
    {
        DestroySprite(sprite);
        return;
    }

    switch (sprite->data[0])
    {
    case 0:
        StartSpriteAnimIfDifferent(sprite, 0);
        break;
    case 1:
        StartSpriteAnimIfDifferent(sprite, 1);
        if (sprite->pos1.x > -32)
            sprite->pos1.x -= 1;
        break;
    case 2:
        StartSpriteAnimIfDifferent(sprite, 2);
        break;
    case 3:
        StartSpriteAnimIfDifferent(sprite, 3);
        break;
    case 4:
        StartSpriteAnimIfDifferent(sprite, 0);
        if (sprite->pos1.x > 120)
            sprite->pos1.x -= 1;
        break;
    case 5:
        StartSpriteAnimIfDifferent(sprite, 0);
        if (sprite->pos1.x > -32)
            sprite->pos1.x -= 1;
        break;
    }
}

static void spritecb_rival_8145420(struct Sprite *sprite)
{
    if (gUnknown_0203935C != 0)
    {
        DestroySprite(sprite);
        return;
    }

    switch (sprite->data[0])
    {
    case 0:
        sprite->pos2.y = 0;
        StartSpriteAnimIfDifferent(sprite, 0);
        break;
    case 1:
        if (sprite->pos1.x > 200)
            StartSpriteAnimIfDifferent(sprite, 1);
        else
            StartSpriteAnimIfDifferent(sprite, 2);
        if (sprite->pos1.x > -32)
            sprite->pos1.x -= 2;
        sprite->pos2.y = -gUnknown_0203935A;
        break;
    case 2:
        sprite->data[7] += 1;
        StartSpriteAnimIfDifferent(sprite, 0);
        if ((sprite->data[7] & 3) == 0)
            sprite->pos1.x += 1;
        break;
    case 3:
        StartSpriteAnimIfDifferent(sprite, 0);
        if (sprite->pos1.x > -32)
            sprite->pos1.x -= 1;
        break;
    }
}

void spritecb_81454E0(struct Sprite *sprite)
{
    if (gUnknown_0203935C)
    {
        DestroySprite(sprite);
        return;
    }

    sprite->data[7] += 1;
    switch (sprite->data[0])
    {
    case 0:
    default:
        sprite->oam.affineMode = 1;
        sprite->oam.matrixNum = sprite->data[1];
        sprite->data[2] = 16;
        SetOamMatrix(sprite->data[1], 0x10000 / sprite->data[2], 0, 0, 0x10000 / sprite->data[2]);
        sprite->invisible = FALSE;
        sprite->data[0] = 1;
        break;
    case 1:
        if (sprite->data[2] < 256)
        {
            sprite->data[2] += 8;
            SetOamMatrix(sprite->data[1], 0x10000 / sprite->data[2], 0, 0, 0x10000 / sprite->data[2]);
        }
        else
        {
            sprite->data[0] += 1;
        }
        switch (sprite->data[1])
        {
        case 1:
            if ((sprite->data[7] & 3) == 0)
                sprite->pos1.y += 1;
            sprite->pos1.x -= 2;
            break;
        case 2:
            break;
        case 3:
            if ((sprite->data[7] & 3) == 0)
                sprite->pos1.y += 1;
            sprite->pos1.x += 2;
            break;
        }
        break;
    case 2:
        if (sprite->data[3] != 0)
        {
            sprite->data[3] -= 1;
        }
        else
        {
            REG_BLDCNT = 0xF40;
            REG_BLDALPHA = 0x10;
            sprite->oam.objMode = 1;
            sprite->data[3] = 16;
            sprite->data[0] += 1;
        }
        break;
    case 3:
        if (sprite->data[3] != 0)
        {
            int data3;
            vu16 *reg;

            sprite->data[3] -= 1;

            reg = &REG_BLDALPHA;
            data3 = 16 - sprite->data[3];
            *reg = (data3 << 8) + sprite->data[3];
        }
        else
        {
            sprite->invisible = TRUE;
            sprite->data[0] = 10;
        }
        break;
    case 10:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroySprite(sprite);
        break;
    }
}

static u8 sub_81456B4(u16 species, u16 x, u16 y, u16 position)
{
    u32 personality;
    const u8 *lzPaletteData;
    u8 spriteId;
    u8 spriteId2;

    species = NationalPokedexNumToSpecies(species);
    switch (species)
    {
    default:
        personality = 0;
        break;
    case SPECIES_SPINDA:
        personality = gSaveBlock2.pokedex.spindaPersonality;
        break;
    case SPECIES_UNOWN:
        personality = gSaveBlock2.pokedex.unownPersonality;
        break;
    }

    LoadSpecialPokePic(
        &gMonFrontPicTable[species],
        gMonFrontPicCoords[species].coords,
        gMonFrontPicCoords[species].y_offset,
        0x2000000,
        gUnknown_0840B5A0[position],
        species,
        personality,
        1
    );

    lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, 0, 0xFFFF);
    LoadCompressedPalette(lzPaletteData, 0x100 + (position * 16), 0x20);
    sub_8143648(position, position);

    spriteId = CreateSprite(&gUnknown_02024E8C, x, y, 0);
    gSprites[spriteId].oam.paletteNum = position;
    gSprites[spriteId].oam.priority = 1;
    gSprites[spriteId].data[1] = position + 1;
    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].callback = spritecb_81454E0;

    spriteId2 = CreateSprite(&gSpriteTemplate_840CAEC, gSprites[spriteId].pos1.x, gSprites[spriteId].pos1.y, 1);
    gSprites[spriteId2].data[0] = spriteId;

    StartSpriteAnimIfDifferent(&gSprites[spriteId2], position);

    return spriteId;
}

void spritecb_814580C(struct Sprite *sprite)
{
    if (gSprites[sprite->data[0]].data[0] == 10 || gUnknown_0203935C)
    {
        DestroySprite(sprite);
        return;
    }

    sprite->invisible = gSprites[sprite->data[0]].invisible;
    sprite->oam.objMode = gSprites[sprite->data[0]].oam.objMode;
    sprite->oam.affineMode = gSprites[sprite->data[0]].oam.affineMode;
    sprite->oam.matrixNum = gSprites[sprite->data[0]].oam.matrixNum;
    sprite->pos1.x = gSprites[sprite->data[0]].pos1.x;
    sprite->pos1.y = gSprites[sprite->data[0]].pos1.y;
}

static void sub_81458DC(void)
{
    struct Unk201C000 *unk201C000 = &ewram1c000;
    u16 starter = SpeciesToNationalPokedexNum(GetStarterPokemon(VarGet(VAR_STARTER_MON)));
    u16 seenTypesCount;
    u16 page;
    u16 dexNum;
    u16 j;

    for (dexNum = 1, seenTypesCount = 0; dexNum < 386; dexNum++)
    {
        if (GetSetPokedexFlag(dexNum, 1))
        {
            unk201C000->unk90[seenTypesCount] = dexNum;
            seenTypesCount++;
        }
    }

    for (dexNum = seenTypesCount; dexNum < 386; dexNum++)
        unk201C000->unk90[dexNum] = 0;

    unk201C000->unk394 = seenTypesCount;
    if (unk201C000->unk394 < POKEMON_TILE_COUNT)
        unk201C000->unk8E = seenTypesCount;
    else
        unk201C000->unk8E = POKEMON_TILE_COUNT;

    j = 0;
    do
    {
        page = Random() % unk201C000->unk394;
        unk201C000->unk0[j] = unk201C000->unk90[page];

        j++;
        unk201C000->unk90[page] = 0;
        unk201C000->unk394--;
        if (page != unk201C000->unk394)
        {
            unk201C000->unk90[page] = unk201C000->unk90[unk201C000->unk394];
            unk201C000->unk90[unk201C000->unk394] = 0;
        }
    }
    while (unk201C000->unk394 != 0 && j < POKEMON_TILE_COUNT);

    if (unk201C000->unk8E < POKEMON_TILE_COUNT)
    {
        for (j = unk201C000->unk8E, page = 0; j < POKEMON_TILE_COUNT; j++)
        {
            unk201C000->unk0[j] = unk201C000->unk0[page];

            page++;
            if (page == unk201C000->unk8E)
                page = 0;
        }
        unk201C000->unk0[POKEMON_TILE_COUNT - 1] = starter;
    }
    else
    {
        for (dexNum = 0; unk201C000->unk0[dexNum] != starter && dexNum < POKEMON_TILE_COUNT; dexNum++);

        if (dexNum < unk201C000->unk8E - 1)
        {
            unk201C000->unk0[dexNum] = unk201C000->unk0[POKEMON_TILE_COUNT - 1];
            unk201C000->unk0[POKEMON_TILE_COUNT - 1] = starter;
        }
        else
        {
            unk201C000->unk0[POKEMON_TILE_COUNT - 1] = starter;
        }
    }
    unk201C000->unk8E = POKEMON_TILE_COUNT;
}
