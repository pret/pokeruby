#include "global.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "text.h"

enum {
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
    PAGE_ARTWORK,
    PAGE_TEXT_EDITOR,
    PAGE_NOA_TESTING,
    PAGE_BRAILLE_CODE_CHECK_1,
    PAGE_BRAILLE_CODE_CHECK_2,
    PAGE_SPECIAL_THANKS_4,
    PAGE_SPECIAL_THANKS_5,

    PAGE_COUNT
};

#define UNK_DEFINE_82 (0x82)

#define COLOR_DARK_GREEN 0x1967
#define COLOR_LIGHT_GREEN 0x328D

enum {
    TDA_0 = 0,
    TDA_TASK_C_ID = 1,
    TDA_TASK_D_ID = 3,
    TDA_4 = 4,
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

    TDD_0 = 0,
    TDD_1 = 1,
    TDD_2 = 2,
};

struct Unk201C000 {
    u8 pad_00[0x88];
    u16 var_88;
    u16 var_8A;
    u16 var_8C;
};

struct HallOfFame {
    u8 sheet0[0x800];
    u8 sheet1[0x800];
    u8 sheet2[0x800];
};

struct CreditsEntry {
    u8 var_0;
    u8 *text;
};

extern struct Unk201C000 unk_201C000;

extern struct HallOfFame gHallOfFame;
extern u8 unk_201e800[0x800];
extern u8 unk_201f000[0x800];
extern u16 unk_201f800[];

extern s16 gUnknown_02039320;
extern u16 gUnknown_02039322; // TASK A
extern u8 gUnknown_02039324;
extern u8 gUnknown_02039325;
extern u16 gUnknown_0203935C;

extern u8 gReservedSpritePaletteCount;

// data/starter_choose
extern u16 gBirchBagGrassPal[32];
extern u8 gBirchBagTilemap[];
extern u8 gBirchHelpGfx[];

//  data/credits
extern u16 gUnknown_0840B7BC[32];
extern u16 gUnknown_0840B7FC[32];
extern struct CreditsEntry *gCreditsEntryPointerTable[][5];
extern struct SpriteSheet gUnknown_0840CAA0;
extern struct SpritePalette gUnknown_0840CAB0;

static void task_a_8143B38(u8 taskIdA);
void task_a_8143B68(u8 taskIdA);
static void task_a_8143BFC(u8 taskIdA);
static void task_a_080C9BFC(u8 taskIdA);
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

void task_d_8144514(u8 taskIdD);
u8 sub_8144ECC(u8 data, u8 taskIdA);
void sub_81450AC(u8 taskIdA);
void sub_8145128(u16, u16, u16);
void sub_81452D0(int, int);
void sub_81458DC(void);

static void vblank_8143948(void) {
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_814395C(void) {
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();

    if (!(gMain.heldKeys & B_BUTTON))
    {
        return;
    }

    if (!gUnknown_02039324)
    {
        return;
    }

    if (gTasks[gUnknown_02039322].func != task_a_8143B68)
    {
        return;
    }

    vblank_8143948();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    gUnknown_02039325 = 1;
}

void sub_81439D0(void) {
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
        {
            break;
        }
    }

    taskIdC = gTasks[taskIdA].data[TDA_TASK_C_ID];
    gTasks[taskIdC].data[TDC_0] = 40;

    SetUpWindowConfig(&gWindowConfig_81E7208);
    InitMenuWindow(&gWindowConfig_81E7208);
    LoadPalette(&gUnknown_0840B7BC, 0x80, sizeof(gUnknown_0840B7BC));

    CpuCopy16(&gUnknown_0840B7FC, (void *) (VRAM + 0xBEE0), sizeof(gUnknown_0840B7FC));

    REG_BG0VOFS = 0xFFFC;

    taskIdB = CreateTask(task_b_81441B8, 0);

    gTasks[taskIdB].data[TDB_TASK_A_ID] = taskIdA;
    gTasks[taskIdA].data[TDA_TASK_B_ID] = taskIdB;

    BeginNormalPaletteFade(-1, 0, 16, 0, 0);


    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;


    SetVBlankCallback(vblank_8143948);
    m4aSongNumStart(BGM_THANKFOR);
    SetMainCallback2(sub_814395C);
    gUnknown_02039325 = 0;

    c000 = &unk_201C000;

    sub_81458DC();

    c000->var_88 = 0;
    c000->var_8A = 0;
    c000->var_8C = 0;

    gUnknown_02039322 = taskIdA;
}

void task_a_8143B38(u8 taskIdA) {
    if (gPaletteFade.active)
    {
        return;
    }

    gTasks[taskIdA].func = task_a_8143B68;
}

void task_a_8143B68(u8 taskIdA) {
    u16 data11;

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
    data11 = gTasks[taskIdA].data[TDA_11];

    if (gTasks[taskIdA].data[TDA_11] == 1)
    {
        gTasks[taskIdA].data[TDA_13] = data11;
        gTasks[taskIdA].data[TDA_11] = 0;
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        gTasks[taskIdA].func = task_a_8143BFC;
    }
    else if (gTasks[taskIdA].data[TDA_11] == 2)
    {
        gTasks[taskIdA].data[TDA_13] = data11;
        gTasks[taskIdA].data[TDA_11] = 0;
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        gTasks[taskIdA].func = task_a_8143CC0;
    }
}

static void task_a_8143BFC(u8 taskIdA) {
    if (gPaletteFade.active)
    {
        return;
    }

    REG_DISPCNT = 0;
    sub_81450AC(taskIdA);
    gTasks[taskIdA].func = task_a_080C9BFC;
}

static void task_a_080C9BFC(u8 taskIdA) {
    u16 backup;

    SetVBlankCallback(NULL);

    if (!sub_8144ECC(gTasks[taskIdA].data[TDA_7], taskIdA))
    {
        return;
    }

    BeginNormalPaletteFade(-1, 0, 16, 0, 0);

    backup = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = backup;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;

    SetVBlankCallback(vblank_8143948);
    gTasks[taskIdA].func = task_a_8143B38;
}

static void task_a_8143CC0(u8 taskIdA) {
    if (gPaletteFade.active)
    {
        return;
    }

    REG_DISPCNT = 0;
    sub_81450AC(taskIdA);
    gTasks[taskIdA].func = task_a_8143D04;
}

#ifdef NONMATCHING
static void task_a_8143D04(u8 taskIdA) {
    switch (gMain.state) {
    default:
    case 0: {
        u16 i;

        ResetSpriteData();
        FreeAllSpritePalettes();
        gReservedSpritePaletteCount = 8;
        LZ77UnCompVram(&gBirchHelpGfx, (void *) VRAM);
        LZ77UnCompVram(&gBirchBagTilemap, (void *) (VRAM + 0x3800));
        LoadPalette(gBirchBagGrassPal + 2, 1, 31 * 2);

        for (i = 0; i < 0x800; i++) {
            gHallOfFame.sheet0[i] = 0x11;
        }

        for (i = 0; i < 0x800; i++) {
            gHallOfFame.sheet1[i] = 0x22;
        }

        for (i = 0; i < 0x800; i++) {
            gHallOfFame.sheet2[i] = 0x33;
        }

        unk_201f800[0] = 0;
        unk_201f800[1] = 0x53FF; // light yellow
        unk_201f800[2] = 0x529F; // light red
        unk_201f800[3] = 0x7E94; // light blue

        LoadSpriteSheet(&gUnknown_0840CAA0);
        LoadSpritePalette(&gUnknown_0840CAB0);

        gMain.state += 1;
        break;
    }

    case 1: {
        gTasks[taskIdA].data[TDA_TASK_D_ID] = CreateTask(task_d_8144514, 0);
        gTasks[gTasks[taskIdA].data[TDA_TASK_D_ID]].data[TDD_0] = 1;
        gTasks[gTasks[taskIdA].data[TDA_TASK_D_ID]].data[TDD_1] = taskIdA;
        gTasks[gTasks[taskIdA].data[TDA_TASK_D_ID]].data[TDD_2] = gTasks[taskIdA].data[TDA_7];

        BeginNormalPaletteFade(-1, 0, 16, 0, 0);
        REG_BG3HOFS = 0;
        REG_BG3VOFS = 32;
        REG_BG3CNT = 0x703;
        REG_DISPCNT = 0x1940;

        gMain.state = 0;
        gUnknown_0203935C = 0;
        gTasks[taskIdA].func = task_a_8143B38;
        break;
    }
    }
}
#else
__attribute__((naked))
static void task_a_8143D04(u8 taskId) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	sub sp, 0x4\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	ldr r0, _08143DC8 @ =gMain\n\
	ldr r1, _08143DCC @ =0x0000043c\n\
	adds r1, r0\n\
	mov r8, r1\n\
	ldrb r7, [r1]\n\
	cmp r7, 0\n\
	beq _08143D24\n\
	cmp r7, 0x1\n\
	beq _08143E0C\n\
_08143D24:\n\
	bl ResetSpriteData\n\
	bl FreeAllSpritePalettes\n\
	ldr r1, _08143DD0 @ =gReservedSpritePaletteCount\n\
	movs r0, 0x8\n\
	strb r0, [r1]\n\
	ldr r0, _08143DD4 @ =gBirchHelpGfx\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl LZ77UnCompVram\n\
	ldr r0, _08143DD8 @ =gBirchGrassTilemap\n\
	ldr r1, _08143DDC @ =0x06003800\n\
	bl LZ77UnCompVram\n\
	ldr r0, _08143DE0 @ =gBirchBagGrassPal + 2\n\
	movs r1, 0x1\n\
	movs r2, 0x3E\n\
	bl LoadPalette\n\
	movs r1, 0\n\
	ldr r4, _08143DE4 @ =0x0201e000\n\
	movs r3, 0x11\n\
	ldr r2, _08143DE8 @ =0x000007ff\n\
_08143D56:\n\
	adds r0, r1, r4\n\
	strb r3, [r0]\n\
	adds r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	cmp r1, r2\n\
	bls _08143D56\n\
	movs r1, 0\n\
	ldr r2, _08143DEC @ =0x0201f800\n\
	ldr r6, _08143DF0 @ =gUnknown_0840CAA0\n\
	ldr r0, _08143DF4 @ =0xfffff000\n\
	adds r5, r2, r0\n\
	movs r4, 0x22\n\
	ldr r3, _08143DE8 @ =0x000007ff\n\
_08143D72:\n\
	adds r0, r1, r5\n\
	strb r4, [r0]\n\
	adds r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	cmp r1, r3\n\
	bls _08143D72\n\
	movs r1, 0\n\
	ldr r5, _08143DF8 @ =0x0201f000\n\
	movs r4, 0x33\n\
	ldr r3, _08143DE8 @ =0x000007ff\n\
_08143D88:\n\
	adds r0, r1, r5\n\
	strb r4, [r0]\n\
	adds r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	cmp r1, r3\n\
	bls _08143D88\n\
	movs r0, 0\n\
	strh r0, [r2]\n\
	ldr r1, _08143DFC @ =0x000053ff\n\
	adds r0, r1, 0\n\
	strh r0, [r2, 0x2]\n\
	ldr r1, _08143E00 @ =0x0000529f\n\
	adds r0, r1, 0\n\
	strh r0, [r2, 0x4]\n\
	ldr r1, _08143E04 @ =0x00007e94\n\
	adds r0, r1, 0\n\
	strh r0, [r2, 0x6]\n\
	adds r0, r6, 0\n\
	bl LoadSpriteSheet\n\
	ldr r0, _08143E08 @ =gUnknown_0840CAB0\n\
	bl LoadSpritePalette\n\
	ldr r1, _08143DC8 @ =gMain\n\
	ldr r2, _08143DCC @ =0x0000043c\n\
	adds r1, r2\n\
	ldrb r0, [r1]\n\
	adds r0, 0x1\n\
	strb r0, [r1]\n\
	b _08143E90\n\
	.align 2, 0\n\
_08143DC8: .4byte gMain\n\
_08143DCC: .4byte 0x0000043c\n\
_08143DD0: .4byte gReservedSpritePaletteCount\n\
_08143DD4: .4byte gBirchHelpGfx\n\
_08143DD8: .4byte gBirchGrassTilemap\n\
_08143DDC: .4byte 0x06003800\n\
_08143DE0: .4byte gBirchBagGrassPal + 2\n\
_08143DE4: .4byte 0x0201e000\n\
_08143DE8: .4byte 0x000007ff\n\
_08143DEC: .4byte 0x0201f800\n\
_08143DF0: .4byte gUnknown_0840CAA0\n\
_08143DF4: .4byte 0xfffff000\n\
_08143DF8: .4byte 0x0201f000\n\
_08143DFC: .4byte 0x000053ff\n\
_08143E00: .4byte 0x0000529f\n\
_08143E04: .4byte 0x00007e94\n\
_08143E08: .4byte gUnknown_0840CAB0\n\
_08143E0C:\n\
	ldr r0, _08143EA0 @ =task_d_8144514\n\
	movs r1, 0\n\
	bl CreateTask\n\
	ldr r2, _08143EA4 @ =gTasks\n\
	lsls r4, r6, 2\n\
	adds r4, r6\n\
	lsls r4, 3\n\
	adds r4, r2\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	movs r1, 0\n\
	mov r9, r1\n\
	movs r5, 0\n\
	strh r0, [r4, 0xE]\n\
	movs r0, 0xE\n\
	ldrsh r1, [r4, r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r0, 3\n\
	adds r0, r2\n\
	strh r7, [r0, 0x8]\n\
	movs r0, 0xE\n\
	ldrsh r1, [r4, r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r0, 3\n\
	adds r0, r2\n\
	strh r6, [r0, 0xA]\n\
	movs r0, 0xE\n\
	ldrsh r1, [r4, r0]\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	lsls r0, 3\n\
	adds r0, r2\n\
	ldrh r1, [r4, 0x16]\n\
	strh r1, [r0, 0xC]\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	str r5, [sp]\n\
	movs r1, 0\n\
	movs r2, 0x10\n\
	movs r3, 0\n\
	bl BeginNormalPaletteFade\n\
	ldr r0, _08143EA8 @ =REG_BG3HOFS\n\
	strh r5, [r0]\n\
	ldr r1, _08143EAC @ =REG_BG3VOFS\n\
	movs r0, 0x20\n\
	strh r0, [r1]\n\
	subs r1, 0x10\n\
	ldr r2, _08143EB0 @ =0x00000703\n\
	adds r0, r2, 0\n\
	strh r0, [r1]\n\
	subs r1, 0xE\n\
	movs r2, 0xCA\n\
	lsls r2, 5\n\
	adds r0, r2, 0\n\
	strh r0, [r1]\n\
	mov r1, r9\n\
	mov r0, r8\n\
	strb r1, [r0]\n\
	ldr r0, _08143EB4 @ =gUnknown_0203935C\n\
	strh r5, [r0]\n\
	ldr r0, _08143EB8 @ =sub_8143B38\n\
	str r0, [r4]\n\
_08143E90:\n\
	add sp, 0x4\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08143EA0: .4byte task_d_8144514\n\
_08143EA4: .4byte gTasks\n\
_08143EA8: .4byte 0x4000000 + 0x1c\n\
_08143EAC: .4byte 0x4000000 + 0x1e\n\
_08143EB0: .4byte 0x00000703\n\
_08143EB4: .4byte gUnknown_0203935C\n\
_08143EB8: .4byte task_a_8143B38\n\
    .syntax divided\n");
}
#endif

static void task_a_8143EBC(u8 taskIdA) {
    if (gTasks[taskIdA].data[TDA_12])
    {
        gTasks[taskIdA].data[TDA_12] -= 1;
        return;
    }

    BeginNormalPaletteFade(-1, 12, 0, 16, 0);
    gTasks[taskIdA].func = task_a_8143F04;
}

static void task_a_8143F04(u8 taskIdA) {
    if (gPaletteFade.active)
    {
        return;
    }

    sub_81450AC(taskIdA);
    gTasks[taskIdA].func = task_a_8143F3C;
}

static void task_a_8143F3C(u8 taskIdA) {
    u16 backup;

    sub_8144130();
    ResetPaletteFade();
    sub_8145128(0, 0x3800, 0);
    ResetSpriteData();
    FreeAllSpritePalettes();
    BeginNormalPaletteFade(-1, 8, 16, 0, 0);

    REG_BG0CNT = 0x700;
    backup = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = backup;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    REG_DISPCNT = 0x140;

    gTasks[taskIdA].data[TDA_0] = 0x100;
    gTasks[taskIdA].func = task_a_8143FDC;
}

static void task_a_8143FDC(u8 taskIdA) {
    if (gTasks[taskIdA].data[TDA_0])
    {
        gTasks[taskIdA].data[TDA_0] -= 1;
        return;
    }

    BeginNormalPaletteFade(-1, 6, 0, 16, 0);
    gTasks[taskIdA].func = task_a_8144024;
}

static void task_a_8144024(u8 taskIdA) {
    if (gPaletteFade.active)
    {
        return;
    }

    sub_81452D0(0x3800, 0);

    BeginNormalPaletteFade(-1, 0, 0, 0, 0);
    gTasks[taskIdA].data[TDA_0] = 7200;
    gTasks[taskIdA].func = task_a_8144080;
}

static void task_a_8144080(u8 taskIdA) {
    if (gPaletteFade.active)
    {
        return;
    }

    if (gTasks[taskIdA].data[TDA_0] == 0)
    {
        FadeOutBGM(4);
        BeginNormalPaletteFade(-1, 8, 0, 16, 0xFFFF);
        gTasks[taskIdA].func = task_a_8144114;
        return;
    }

    if (gMain.newKeys)
    {
        FadeOutBGM(4);
        BeginNormalPaletteFade(-1, 8, 0, 16, 0xFFFF);
        gTasks[taskIdA].func = task_a_8144114;
        return;
    }

    if (gTasks[taskIdA].data[TDA_0] == 7144)
    {
        FadeOutBGM(8);
    }

    if (gTasks[taskIdA].data[TDA_0] == 6840)
    {
        m4aSongNumStart(BGM_END);
    }

    gTasks[taskIdA].data[TDA_0] -= 1;
}

static void task_a_8144114(u8 taskIdA) {
    if (gPaletteFade.active)
    {
        return;
    }

    SoftReset(0xFF);
}

static void sub_8144130(void) {
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

    DmaFill16(3, 0, (void *) VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *) OAM, OAM_SIZE);
    DmaFill16(3, 0, (void *) (PLTT + 2), PLTT_SIZE - 2);
}

static void task_b_81441B8(u8 taskIdB) {
    u16 i;

    switch (gTasks[taskIdB].data[TDB_0])
    {
    case 0:
    case 6:
    case 7:
    case 8:
    case 9:
    default:
        if (gPaletteFade.active)
        {
            return;
        }
        gTasks[taskIdB].data[TDB_0] = 1;
        gTasks[taskIdB].data[TDB_3] = 0x58;
        gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_14] = 0;
        gUnknown_02039320 = 0;
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
                {
                    sub_8072BD8(gCreditsEntryPointerTable[gTasks[taskIdB].data[TDB_CURRENT_PAGE]][i]->text, 0,
                                9 + i * 2, 240);
                }

                gTasks[taskIdB].data[TDB_CURRENT_PAGE] += 1;
                gTasks[taskIdB].data[TDB_0] += 1;

                gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_14] = 1;

                if (gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_13] == 1)
                {
                    BeginNormalPaletteFade(0x300, 0, 16, 0, COLOR_LIGHT_GREEN);
                }
                else
                {
                    BeginNormalPaletteFade(0x300, 0, 16, 0, COLOR_DARK_GREEN);
                }
                return;
            }


            gTasks[taskIdB].data[TDB_0] = 10;
            return;
        }

        gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_14] = 0;
        return;

    case 3:
        REG_DISPCNT |= DISPCNT_BG0_ON;

        if (gPaletteFade.active)
        {
            return;
        }

        gTasks[taskIdB].data[TDB_3] = UNK_DEFINE_82;
        gTasks[taskIdB].data[TDB_0] += 1;
        return;

    case 4:
        if (gTasks[taskIdB].data[TDB_3] != 0)
        {
            gTasks[taskIdB].data[TDB_3] -= 1;
            return;
        }

        if (sub_8144454((u8) gTasks[taskIdB].data[TDB_CURRENT_PAGE], (u8) gTasks[taskIdB].data[TDB_TASK_A_ID]))
        {
            gTasks[taskIdB].data[TDB_0] += 1;
            return;
        }

        gTasks[taskIdB].data[TDB_0] += 1;

        if (gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_13] == 1)
        {
            BeginNormalPaletteFade(0x300, 0, 0, 16, COLOR_LIGHT_GREEN);
        }
        else
        {
            BeginNormalPaletteFade(0x300, 0, 0, 16, COLOR_DARK_GREEN);
        }

        return;

    case 5:
        if (gPaletteFade.active)
        {
            return;
        }

        MenuZeroFillWindowRect(0, 9, 29, 19);
        gTasks[taskIdB].data[TDB_0] = 2;
        return;

    case 10:
        gTasks[gTasks[taskIdB].data[TDB_TASK_A_ID]].data[TDA_4] = 1;
        DestroyTask(taskIdB);
        return;
    }
}

#define LAST_PAGE (PAGE_TEXT_EDITOR)

static u8 sub_8144454(u8 page, u8 taskIdA) {
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
