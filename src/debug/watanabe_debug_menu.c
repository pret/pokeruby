#if DEBUG
#include "global.h"
#include "ewram.h"
#include "random.h"
#include "gba/flash_internal.h"
#include "constants/species.h"
#include "constants/songs.h"
#include "debug.h"
#include "palette.h"
#include "scanline_effect.h"
#include "main.h"
#include "task.h"
#include "sprite.h"
#include "text.h"
#include "menu.h"
#include "script.h"
#include "overworld.h"
#include "data2.h"
#include "fieldmap.h"
#include "save.h"
#include "sound.h"
#include "pokedex.h"
#include "load_save.h"
#include "pokemon_storage_system.h"
#include "battle.h"
#include "battle_bg.h"

struct WatanabeDebugMenuItem {
    const u8 * text;
    union {
        u8 type1[2];
        u32 type2;
        u8 type3;
    } data;
};

struct WatanabeEwram18000 {
    struct Pokemon pokemon;
    u32 unk64[0x40];
    u32 unk164;
    u8 unk168;
    u8 unk169;
    u8 unk16a;
};

#define eWatanabe18000 (*(struct WatanabeEwram18000 *)(gSharedMem + 0x18000))

EWRAM_DATA u8 gUnknown_Debug_20389EC[0x20] = { 0 };
EWRAM_DATA u8 gUnknown_Debug_2038A0C[0x10] = { 0 };
EWRAM_DATA struct WatanabeEwram18000 * gUnknown_Debug_2038A1C = NULL;
EWRAM_DATA u8 gUnknown_Debug_2038A20[4] = { 0 };

u32 byte_3005E30;

extern s8 gBattleTerrain;

void debug_80C3A50(u8 taskId);
void debug_80C3D2C(u8 taskId);
void debug_80C4214(u8);
void debug_80C42B8(u8 taskId);
void debug_80C4348(u8 taskId);
void debug_80C43A8(u8 taskId);
void debug_80C44EC(u8 taskId);
void debug_80C4550(u8 taskId);
void debug_80C4694(void);
void debug_80C4704(void);
bool8 debug_80C4774(void);
void debug_80C47BC(u8 taskId);
void debug_80C48A0(u8 taskId);
void debug_80C4900(u8 taskId);
void debug_80C4A60(u8 taskId);
void debug_80C4AC4(u8 taskId);
void debug_80C4C44(u8);
void debug_80C4D14(u8 taskId);
void debug_80C4DB8(u8 taskId);
void debug_80C4E18(u8 taskId);
void debug_80C4F00(u8);
void debug_80C4F48(u8 taskId);
void debug_80C5038(u8 taskId);
void debug_80C5098(u8 taskId);
void debug_80C5158(u8 taskId);
void debug_80C5174(u8 taskId);
void debug_80C5190(u8 taskId);
void debug_80C51AC(u8 taskId);
void debug_80C51C8(u8 taskId);
void debug_80C51E4(u8 taskId);
void debug_80C53A4(u8 taskId);
void debug_80C53C0(u8 taskId);
void debug_80C53F0(u8 taskId);
void debug_80C55E4(u8 taskId);
void debug_80C5708(u8 taskId);
void debug_80C5C94(void);
void debug_80C5FFC(void);
void debug_80C627C(u8);
void debug_80C6384(void);
void debug_80C643C(void);
void debug_80C68CC(u16, u8, u8, u8);
void debug_80C7584(struct Sprite *);

extern const struct WatanabeDebugMenuItem gUnknown_Debug_083F8068[5];
extern const struct WatanabeDebugMenuItem gUnknown_Debug_083F80D8[10];
extern const struct WatanabeDebugMenuItem gUnknown_Debug_083F814C[9];
extern const struct WatanabeDebugMenuItem gUnknown_Debug_083F8698[6];

extern const u8 gUnknown_Debug_083F7FD4[2]; // = _("▶");
extern const u8 gUnknown_Debug_083F7FD6[4]; // = {0x25, 0x20, 0x01, 0x08};
extern const u8 gUnknown_Debug_083F7FDA[4]; // = _("ひりつ");
extern const u8 gUnknown_Debug_083F7FDE[4]; // = _("たかさ");
extern const u8 gUnknown_Debug_083F7FE2[11]; // = _("Lキー▶しゅくしょう");
extern const u8 gUnknown_Debug_083F7FED[9]; // = _("Rキー▶かくだい");
extern const u8 gUnknown_Debug_083F7FF6[11]; // = _("Uキー▶うえ　いどう");
extern const u8 gUnknown_Debug_083F8001[11]; // = _("Dキー▶した　いどう");
extern const u8 gUnknown_Debug_083F800C[13]; // = _("Aボタン▶そうさきりかえ");
extern const u8 gUnknown_Debug_083F8019[9]; // = _("Bボタン▶やめる");
extern const u8 gUnknown_Debug_083F8022[6]; // = _("スタート:");
extern const u8 gUnknown_Debug_083F8028[6]; // = _(":セレクト");
extern const u8 gUnknown_Debug_083F8194[12]; // = _("ポケモンを　えらんでね");
extern const u8 gUnknown_Debug_083F81A0[13]; // = _("{COLOR RED}START:つぎへ");
extern const u8 gUnknown_Debug_083F81AD[13]; // = _("{COLOR RED}じぶんの　ポケモン");
extern const u8 gUnknown_Debug_083F81BA[13]; // = _("{COLOR RED}あいての　ポケモン");
extern const u8 gUnknown_Debug_083F81C7[15]; // = _("たいせんモードを　えらんでね");
extern const u8 gUnknown_Debug_083F81D6[15]; // = _("{COLOR RED}バトルモード　せんたく");
extern const u8 gUnknown_Debug_083F81E5[16]; // = _("{COLOR RED}トレーナーAI　せんたく");
extern const u8 gUnknown_Debug_083F81F5[13]; // = _("{COLOR RED}START:かいし");
extern const u8 gUnknown_Debug_083F8202[15]; // =_("{COLOR RED}バトルちけい　せんたく");
extern const u8 gUnknown_Debug_083F8211[17]; // = _("じぶんの　せいべつを　えらんでね");
extern const u8 gUnknown_Debug_083F8222[13]; // = _("{COLOR RED}せいべつ　せんたく");
extern const u8 gUnknown_Debug_083F822F[4]; // = _("おとこ");
extern const u8 gUnknown_Debug_083F8233[4]; // = _("おんな");
extern const u8 gUnknown_Debug_083F8720[10];
extern const u8 gUnknown_Debug_083F872A[9];
extern const u8 gUnknown_Debug_083F8733[37]; // = _("Create　POKひMON　　　LR:Shift　　START:Add");

#define SPRITETAG_WATANABE 0x1000

u8 byte_83F88EC[];
u16 word_83F888C[];

struct SpriteSheet stru_83F8828[] = {
    {byte_83F88EC, 0x800, SPRITETAG_WATANABE},
    {}
};
struct SpritePalette stru_83F8838[] = {
    {word_83F888C, SPRITETAG_WATANABE},
    {}
};

struct OamData gOamData_83F8848 = {
    .y = 0xa0
};

union AnimCmd gSpriteAnim_83F8850[] = {
    ANIMCMD_FRAME(38, 30),
    ANIMCMD_END
};

union AnimCmd gSpriteAnim_83F8858[] = {
    ANIMCMD_FRAME(39, 30),
    ANIMCMD_END
};

union AnimCmd gSpriteAnim_83F8860[] = {
    ANIMCMD_FRAME(40, 30),
    ANIMCMD_END
};

const union AnimCmd *gSpriteAnimTable_83F8868[] = {
    gSpriteAnim_83F8850,
    gSpriteAnim_83F8858,
    gSpriteAnim_83F8860
};

struct SpriteTemplate gSpriteTemplate_83F8874 = {
    SPRITETAG_WATANABE,
    SPRITETAG_WATANABE,
    &gOamData_83F8848,
    gSpriteAnimTable_83F8868,
    NULL,
    gDummySpriteAffineAnimTable,
    debug_80C7584
};

void debug_69(struct Sprite *sprite)
{

}

void debug_80C35DC(void)
{
    SetVBlankCallback(NULL);
    REG_DISPCNT = 0;
    REG_BG3CNT = 0;
    REG_BG2CNT = 0;
    REG_BG1CNT = 0;
    REG_BG0CNT = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    DmaFill16Large(3, 0, VRAM, VRAM_SIZE, 0x1000);
    DmaFill32Defvars(3, 0, OAM, OAM_SIZE);
    DmaFill16Defvars(3, 0, PLTT, PLTT_SIZE);
    ResetPaletteFade();
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade(); // I really don't want palette fade here
    FreeAllSpritePalettes();
    LoadSpriteSheet(stru_83F8828);
    LoadSpritePalette(stru_83F8838);
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
    InitMenuWindow(&gWindowTemplate_81E6CE4);
}

void debug_80C36F4(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void debug_80C370C(void)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(debug_80C36F4);
    }

    else
    {
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
    }
}

void debug_80C373C(u8 taskId)
{
    DestroyTask(taskId);
    ScriptContext2_Disable();
    SetMainCallback2(sub_80546F0);
}

void debug_80C3758(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void debug_80C376C(u16 a0, u8 a1, u8 a2)
{
    u8 i;
    u8 divresult;
    u8 sp00[4];
    bool8 r4;

    for (i = 0; i < 3; i++)
        sp00[i] = CHAR_SPACE;
    sp00[3] = EOS;

    r4 = FALSE;
    divresult = a0 / 100;
    if (divresult)
    {
        sp00[0] = CHAR_0 + divresult;
        r4 = TRUE;
    }

    divresult = (a0 % 100) / 10;
    if (divresult || r4)
    {
        sp00[1] = CHAR_0 + divresult;
    }

    sp00[2] = CHAR_0 + ((a0 % 100) % 10);

    Menu_PrintText(sp00, a1, a2);
}

void debug_80C3800(u16 a0, u8 a1, u8 a2)
{
    u8 sp00[11];
    u8 i;

    for (i = 0; i < 10; i++)
        sp00[i] = CHAR_SPACE;
    sp00[i] = EOS;

    for (i = 0; gSpeciesNames[a0][i] != EOS && i < 10; i++)
        sp00[i] = gSpeciesNames[a0][i];

    Menu_PrintText(sp00, a1, a2);
}

u16 debug_80C3878(u8 a0, u16 a1)
{
    switch (a0)
    {
        default:
        case 0:
            if (a1 > SPECIES_BULBASAUR)
                a1--;
            else
                a1 = NUM_SPECIES - 1;
            break;
        case 1:
            if (a1 < NUM_SPECIES - 1)
                a1++;
            else
                a1 = SPECIES_BULBASAUR;
            break;
    }
    return a1;
}

u16 debug_80C38B4(u8 a0, u16 a1)
{
    switch (a0)
    {
        default:
        case 0:
            if (a1)
                a1--;
            else
                a1 = 0x52;
            break;
        case 1:
            if (a1 < 0x52)
                a1++;
            else
                a1 = 0;
            break;
    }
    return a1;
}

void debug_80C38E4(u8 a0, u8 a1, u8 a2, u8 a3, u8 a4)
{
    // u8 sp00[] = _("▶");
    u8 sp00[ARRAY_COUNT(gUnknown_Debug_083F7FD4)];

    memcpy(sp00, gUnknown_Debug_083F7FD4, sizeof(gUnknown_Debug_083F7FD4));
    Menu_BlankWindowRect(a1, a2, a1, a3);
    if (a4)
        Menu_PrintText(sp00, a1, a0);
}

void debug_80C393C(void)
{
    ProgramFlashSectorAndVerify(30, (void *)gUnknown_Debug_083F7FD6);
}

void InitWatanabeDebugMenu(void)
{
    switch (gMain.state)
    {
        default:
        case 0:
            save_serialize_map();
            sub_8125E2C();
            gMain.state = 1;
            break;
        case 1:
            if (sub_8125E6C())
                gMain.state++;
            break;
        case 2:
            PlaySE(SE_SAVE);
            gMain.state++;
            break;
        case 3:
            if (!IsSEPlaying())
            {
                ScriptContext2_Disable();
                SetMainCallback2(sub_80546F0);
            }
            break;
    }
}

void InitSizeComparison(void)
{
    u8 taskId;
    debug_80C35DC();
    gReservedSpritePaletteCount = 1;
    LoadPalette(gUnknown_Debug_20389EC, 0x100, 0x20);

    {
        u16 imeBak = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = imeBak;
    }

    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    SetVBlankCallback(debug_80C3758);
    SetMainCallback2(debug_80C370C);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON;
    taskId = CreateTask(debug_80C3A50, 0);
    gTasks[taskId].data[0] = 0xfc;
}

#ifdef NONMATCHING
void debug_80C3A50(u8 taskId)
{
    u16 natDexNum = gTasks[taskId].data[0];
    u16 species = NationalPokedexNumToSpecies(natDexNum);
    u16 spriteId;
    u16 spriteId2;
    struct SaveBlock2 *saveBlock2 = &gSaveBlock2;

    Menu_DrawStdWindowFrame(6, 0, 23, 9);

    Menu_DrawStdWindowFrame(0, 0, 5, 9);
    Menu_PrintText(gUnknown_Debug_083F7FDA, 1, 1);
    Menu_PrintText(gUnknown_Debug_083F7FDE, 1, 5);

    Menu_DrawStdWindowFrame(24, 0, 29, 9);
    Menu_PrintText(gUnknown_Debug_083F7FD6, 25, 1);
    Menu_PrintText(gUnknown_Debug_083F7FDE, 25, 5);

    Menu_DrawStdWindowFrame(0, 10, 11, 19);
    Menu_PrintText(gUnknown_Debug_083F7FE2, 1, 11);
    Menu_PrintText(gUnknown_Debug_083F7FED, 1, 13);
    Menu_PrintText(gUnknown_Debug_083F7FF6, 1, 15);
    Menu_PrintText(gUnknown_Debug_083F8001, 1, 17);

    Menu_DrawStdWindowFrame(12, 10, 29, 15);
    Menu_PrintText(gUnknown_Debug_083F800C, 13, 11);
    Menu_PrintText(gUnknown_Debug_083F8019, 13, 13);

    Menu_DrawStdWindowFrame(12, 16, 29, 19);
    Menu_PrintText(gUnknown_Debug_083F8022, 13, 17);
    Menu_PrintText(gUnknown_Debug_083F8028, 24, 17);

    debug_80C3800(species, 18, 17);

    spriteId = sub_8091A4C(saveBlock2->playerGender, 0x98, 0x28, 0);
    gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId].oam.matrixNum = 2;
    gSprites[spriteId].oam.priority = 0;
    gSprites[spriteId].oam.paletteNum = 0;
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(0));
    gSprites[spriteId].pos2.y = gPokedexEntries[natDexNum].trainerOffset;
    SetOamMatrix(2, gPokedexEntries[natDexNum].trainerScale, 0, 0, gPokedexEntries[natDexNum].trainerScale);
    gTasks[taskId].data[3] = spriteId;
    gTasks[taskId].data[4] = gPokedexEntries[natDexNum].trainerOffset;
    gTasks[taskId].data[6] = gPokedexEntries[natDexNum].trainerScale;

    spriteId2 = sub_80918EC(natDexNum, 0x58, 0x28, 1);
    gSprites[spriteId2].oam.affineMode = ST_OAM_AFFINE_NORMAL;
    gSprites[spriteId2].oam.matrixNum = 1;
    gSprites[spriteId2].oam.priority = 0;
    gSprites[spriteId2].oam.paletteNum = 0;
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(0));
    gSprites[spriteId2].pos2.y = gPokedexEntries[natDexNum].pokemonOffset;
    SetOamMatrix(1, gPokedexEntries[natDexNum].pokemonScale, 0, 0, gPokedexEntries[natDexNum].pokemonScale);
    gTasks[taskId].data[2] = spriteId2;
    gTasks[taskId].data[5] = gPokedexEntries[natDexNum].pokemonOffset;
    gTasks[taskId].data[7] = gPokedexEntries[natDexNum].pokemonScale;
    gTasks[taskId].data[8] = 0;
    gTasks[taskId].data[9] = 0;

    REG_WININ = 0x3F1F;
    REG_WINOUT = 0x001F;
    REG_WIN0H = ((gTasks[taskId].data[8] * 64 + 0x38) << 8) + (gTasks[taskId].data[8] * 64 + 0x78);
    REG_WIN0V = 0x0848;
    REG_WIN1H = 0x31BF;
    REG_WIN1V = 0x014F;
    REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
    REG_BLDALPHA = 0;
    REG_BLDY = 7;
    REG_DISPCNT |= DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
    gTasks[taskId].func = debug_80C3D2C;
}
#else
NAKED void debug_80C3A50(u8 taskId)
{
    asm("\tpush\t{r4, r5, r6, r7, lr}\n"
        "\tmov\tr7, sl\n"
        "\tmov\tr6, r9\n"
        "\tmov\tr5, r8\n"
        "\tpush\t{r5, r6, r7}\n"
        "\tadd\tsp, sp, #0xffffffd8\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr0, r0, #0x18\n"
        "\tldr\tr1, ._56        @ gTasks\n"
        "\tlsl\tr2, r0, #0x2\n"
        "\tadd\tr0, r2, r0\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr7, r0, r1\n"
        "\tldrh\tr0, [r7, #0x8]\n"
        "\tstr\tr0, [sp, #0x4]\n"
        "\tbl\tNationalPokedexNumToSpecies\n"
        "\tmov\tr1, sp\n"
        "\tstrh\tr0, [r1, #0x8]\n"
        "\tadd\tr2, r0, #0\n"
        "\tlsl\tr2, r2, #0x10\n"
        "\tstr\tr2, [sp, #0xc]\n"
        "\tlsr\tr2, r2, #0x10\n"
        "\tmov\tr9, r2\n"
        "\tldr\tr3, ._56 + 4    @ gSaveBlock2\n"
        "\tmov\tr8, r3\n"
        "\tmov\tr0, #0x6\n"
        "\tmov\tr1, #0x0\n"
        "\tmov\tr2, #0x17\n"
        "\tmov\tr3, #0x9\n"
        "\tbl\tMenu_DrawStdWindowFrame\n"
        "\tmov\tr0, #0x0\n"
        "\tmov\tr1, #0x0\n"
        "\tmov\tr2, #0x5\n"
        "\tmov\tr3, #0x9\n"
        "\tbl\tMenu_DrawStdWindowFrame\n"
        "\tldr\tr5, ._56 + 8    @ gUnknown_Debug_083F7FD6\n"
        "\tadd\tr0, r5, #0\n"
        "\tmov\tr1, #0x1\n"
        "\tmov\tr2, #0x1\n"
        "\tbl\tMenu_PrintText\n"
        "\tldr\tr4, ._56 + 12   @ gUnknown_Debug_083F7FDE\n"
        "\tadd\tr0, r4, #0\n"
        "\tmov\tr1, #0x1\n"
        "\tmov\tr2, #0x5\n"
        "\tbl\tMenu_PrintText\n"
        "\tmov\tr0, #0x18\n"
        "\tmov\tr1, #0x0\n"
        "\tmov\tr2, #0x1d\n"
        "\tmov\tr3, #0x9\n"
        "\tbl\tMenu_DrawStdWindowFrame\n"
        "\tadd\tr0, r5, #0\n"
        "\tmov\tr1, #0x19\n"
        "\tmov\tr2, #0x1\n"
        "\tbl\tMenu_PrintText\n"
        "\tadd\tr0, r4, #0\n"
        "\tmov\tr1, #0x19\n"
        "\tmov\tr2, #0x5\n"
        "\tbl\tMenu_PrintText\n"
        "\tmov\tr0, #0x0\n"
        "\tmov\tr1, #0xa\n"
        "\tmov\tr2, #0xb\n"
        "\tmov\tr3, #0x13\n"
        "\tbl\tMenu_DrawStdWindowFrame\n"
        "\tldr\tr0, ._56 + 16   @ gUnknown_Debug_083F7FE2\n"
        "\tmov\tr1, #0x1\n"
        "\tmov\tr2, #0xb\n"
        "\tbl\tMenu_PrintText\n"
        "\tldr\tr0, ._56 + 20   @ gUnknown_Debug_083F7FED\n"
        "\tmov\tr1, #0x1\n"
        "\tmov\tr2, #0xd\n"
        "\tbl\tMenu_PrintText\n"
        "\tldr\tr0, ._56 + 24   @ gUnknown_Debug_083F7FF6\n"
        "\tmov\tr1, #0x1\n"
        "\tmov\tr2, #0xf\n"
        "\tbl\tMenu_PrintText\n"
        "\tldr\tr0, ._56 + 28   @ gUnknown_Debug_083F8001\n"
        "\tmov\tr1, #0x1\n"
        "\tmov\tr2, #0x11\n"
        "\tbl\tMenu_PrintText\n"
        "\tmov\tr0, #0xc\n"
        "\tmov\tr1, #0xa\n"
        "\tmov\tr2, #0x1d\n"
        "\tmov\tr3, #0xf\n"
        "\tbl\tMenu_DrawStdWindowFrame\n"
        "\tldr\tr0, ._56 + 32   @ gUnknown_Debug_083F800C\n"
        "\tmov\tr1, #0xd\n"
        "\tmov\tr2, #0xb\n"
        "\tbl\tMenu_PrintText\n"
        "\tldr\tr0, ._56 + 36   @ gUnknown_Debug_083F8019\n"
        "\tmov\tr1, #0xd\n"
        "\tmov\tr2, #0xd\n"
        "\tbl\tMenu_PrintText\n"
        "\tmov\tr0, #0xc\n"
        "\tmov\tr1, #0x10\n"
        "\tmov\tr2, #0x1d\n"
        "\tmov\tr3, #0x13\n"
        "\tbl\tMenu_DrawStdWindowFrame\n"
        "\tldr\tr0, ._56 + 40   @ gUnknown_Debug_083F8022\n"
        "\tmov\tr1, #0xd\n"
        "\tmov\tr2, #0x11\n"
        "\tbl\tMenu_PrintText\n"
        "\tldr\tr0, ._56 + 44   @ gUnknown_Debug_083F8028\n"
        "\tmov\tr1, #0x18\n"
        "\tmov\tr2, #0x11\n"
        "\tbl\tMenu_PrintText\n"
        "\tmov\tr0, r9\n"
        "\tmov\tr1, #0x12\n"
        "\tmov\tr2, #0x11\n"
        "\tbl\tdebug_80C3800\n"
        "\tmov\tr1, r8\n"
        "\tldrb\tr0, [r1, #0x8]\n"
        "\tmov\tr1, #0x98\n"
        "\tmov\tr2, #0x28\n"
        "\tmov\tr3, #0x0\n"
        "\tbl\tsub_8091A4C\n"
        "\tmov\tr2, sp\n"
        "\tstrh\tr0, [r2, #0x10]\n"
        "\tadd\tr3, r0, #0\n"
        "\tlsl\tr3, r3, #0x10\n"
        "\tstr\tr3, [sp, #0x18]\n"
        "\tlsr\tr0, r3, #0x10\n"
        "\tstr\tr0, [sp, #0x14]\n"
        "\tlsl\tr4, r0, #0x4\n"
        "\tadd\tr4, r4, r0\n"
        "\tlsl\tr4, r4, #0x2\n"
        "\tldr\tr1, ._56 + 48   @ gSprites\n"
        "\tadd\tr4, r4, r1\n"
        "\tldrb\tr1, [r4, #0x1]\n"
        "\tmov\tr2, #0x4\n"
        "\tneg\tr2, r2\n"
        "\tmov\tsl, r2\n"
        "\tmov\tr0, sl\n"
        "\tand\tr0, r0, r1\n"
        "\tmov\tr3, #0x1\n"
        "\torr\tr0, r0, r3\n"
        "\tstrb\tr0, [r4, #0x1]\n"
        "\tldrb\tr1, [r4, #0x3]\n"
        "\tmov\tr0, #0x3f\n"
        "\tneg\tr0, r0\n"
        "\tmov\tr9, r0\n"
        "\tand\tr0, r0, r1\n"
        "\tmov\tr1, #0x4\n"
        "\torr\tr0, r0, r1\n"
        "\tstrb\tr0, [r4, #0x3]\n"
        "\tldrb\tr1, [r4, #0x5]\n"
        "\tsub\tr2, r2, #0x9\n"
        "\tmov\tr8, r2\n"
        "\tmov\tr0, r8\n"
        "\tand\tr0, r0, r1\n"
        "\tmov\tr3, #0xf\n"
        "\tand\tr0, r0, r3\n"
        "\tstrb\tr0, [r4, #0x5]\n"
        "\tmov\tr0, #0x0\n"
        "\tbl\tGetSpritePaletteTagByPaletteNum\n"
        "\tlsl\tr0, r0, #0x10\n"
        "\tlsr\tr0, r0, #0x10\n"
        "\tbl\tFreeSpritePaletteByTag\n"
        "\tldr\tr0, ._56 + 52   @ gPokedexEntries\n"
        "\tldr\tr1, [sp, #0x4]\n"
        "\tlsl\tr5, r1, #0x3\n"
        "\tadd\tr5, r5, r1\n"
        "\tlsl\tr5, r5, #0x2\n"
        "\tadd\tr5, r5, r0\n"
        "\tldrh\tr6, [r5, #0x20]\n"
        "\tstrh\tr6, [r4, #0x26]\n"
        "\tldrh\tr4, [r5, #0x1e]\n"
        "\tstr\tr4, [sp]\n"
        "\tmov\tr0, #0x2\n"
        "\tadd\tr1, r4, #0\n"
        "\tmov\tr2, #0x0\n"
        "\tmov\tr3, #0x0\n"
        "\tbl\tSetOamMatrix\n"
        "\tmov\tr2, sp\n"
        "\tldrh\tr2, [r2, #0x14]\n"
        "\tstrh\tr2, [r7, #0xe]\n"
        "\tstrh\tr6, [r7, #0x10]\n"
        "\tstrh\tr4, [r7, #0x14]\n"
        "\tldr\tr0, [sp, #0x4]\n"
        "\tmov\tr1, #0x58\n"
        "\tmov\tr2, #0x28\n"
        "\tmov\tr3, #0x1\n"
        "\tbl\tsub_80918EC\n"
        "\tmov\tr3, sp\n"
        "\tstrh\tr0, [r3, #0x1c]\n"
        "\tlsl\tr0, r0, #0x10\n"
        "\tstr\tr0, [sp, #0x24]\n"
        "\tlsr\tr1, r0, #0x10\n"
        "\tstr\tr1, [sp, #0x20]\n"
        "\tlsl\tr4, r1, #0x4\n"
        "\tadd\tr4, r4, r1\n"
        "\tlsl\tr4, r4, #0x2\n"
        "\tldr\tr2, ._56 + 48   @ gSprites\n"
        "\tadd\tr4, r4, r2\n"
        "\tldrb\tr0, [r4, #0x1]\n"
        "\tmov\tr3, sl\n"
        "\tand\tr3, r3, r0\n"
        "\tmov\tr0, #0x1\n"
        "\torr\tr3, r3, r0\n"
        "\tstrb\tr3, [r4, #0x1]\n"
        "\tldrb\tr0, [r4, #0x3]\n"
        "\tmov\tr1, r9\n"
        "\tand\tr1, r1, r0\n"
        "\tmov\tr0, #0x2\n"
        "\torr\tr1, r1, r0\n"
        "\tstrb\tr1, [r4, #0x3]\n"
        "\tldrb\tr0, [r4, #0x5]\n"
        "\tmov\tr2, r8\n"
        "\tand\tr2, r2, r0\n"
        "\tmov\tr3, #0xf\n"
        "\tand\tr2, r2, r3\n"
        "\tstrb\tr2, [r4, #0x5]\n"
        "\tmov\tr0, #0x0\n"
        "\tbl\tGetSpritePaletteTagByPaletteNum\n"
        "\tlsl\tr0, r0, #0x10\n"
        "\tlsr\tr0, r0, #0x10\n"
        "\tbl\tFreeSpritePaletteByTag\n"
        "\tldrh\tr0, [r5, #0x1c]\n"
        "\tmov\tr8, r0\n"
        "\tstrh\tr0, [r4, #0x26]\n"
        "\tldrh\tr4, [r5, #0x1a]\n"
        "\tstr\tr4, [sp]\n"
        "\tmov\tr0, #0x1\n"
        "\tadd\tr1, r4, #0\n"
        "\tmov\tr2, #0x0\n"
        "\tmov\tr3, #0x0\n"
        "\tbl\tSetOamMatrix\n"
        "\tmov\tr1, sp\n"
        "\tldrh\tr1, [r1, #0x20]\n"
        "\tstrh\tr1, [r7, #0xc]\n"
        "\tmov\tr2, r8\n"
        "\tstrh\tr2, [r7, #0x12]\n"
        "\tstrh\tr4, [r7, #0x16]\n"
        "\tmov\tr3, #0x0\n"
        "\tstrh\tr3, [r7, #0x18]\n"
        "\tstrh\tr3, [r7, #0x1a]\n"
        "\tldr\tr1, ._56 + 56   @ 0x4000048\n"
        "\tldr\tr2, ._56 + 60   @ 0x3f1f\n"
        "\tadd\tr0, r2, #0\n"
        "\tstrh\tr0, [r1]\n"
        "\tadd\tr1, r1, #0x2\n"
        "\tmov\tr0, #0x1f\n"
        "\tstrh\tr0, [r1]\n"
        "\tldr\tr2, ._56 + 64   @ 0x4000040\n"
        "\tmov\tr3, #0x18\n"
        "\tldsh\tr1, [r7, r3]\n"
        "\tlsl\tr1, r1, #0x6\n"
        "\tadd\tr0, r1, #0\n"
        "\tadd\tr0, r0, #0x38\n"
        "\tlsl\tr0, r0, #0x8\n"
        "\tadd\tr1, r1, #0x78\n"
        "\tadd\tr0, r0, r1\n"
        "\tstrh\tr0, [r2]\n"
        "\tldr\tr1, ._56 + 68   @ 0x4000044\n"
        "\tldr\tr2, ._56 + 72   @ 0x848\n"
        "\tadd\tr0, r2, #0\n"
        "\tstrh\tr0, [r1]\n"
        "\tsub\tr1, r1, #0x2\n"
        "\tldr\tr3, ._56 + 76   @ 0x31bf\n"
        "\tadd\tr0, r3, #0\n"
        "\tstrh\tr0, [r1]\n"
        "\tadd\tr1, r1, #0x4\n"
        "\tldr\tr2, ._56 + 80   @ 0x14f\n"
        "\tadd\tr0, r2, #0\n"
        "\tstrh\tr0, [r1]\n"
        "\tadd\tr1, r1, #0xa\n"
        "\tmov\tr0, #0xe1\n"
        "\tstrh\tr0, [r1]\n"
        "\tldr\tr0, ._56 + 84   @ 0x4000052\n"
        "\tmov\tr3, #0x0\n"
        "\tstrh\tr3, [r0]\n"
        "\tadd\tr1, r1, #0x4\n"
        "\tmov\tr0, #0x7\n"
        "\tstrh\tr0, [r1]\n"
        "\tmov\tr2, #0x80\n"
        "\tlsl\tr2, r2, #0x13\n"
        "\tldrh\tr0, [r2]\n"
        "\tmov\tr3, #0xc0\n"
        "\tlsl\tr3, r3, #0x7\n"
        "\tadd\tr1, r3, #0\n"
        "\torr\tr0, r0, r1\n"
        "\tstrh\tr0, [r2]\n"
        "\tldr\tr0, ._56 + 88   @ debug_80C3D2C\n"
        "\tstr\tr0, [r7]\n"
        "\tadd\tsp, sp, #0x28\n"
        "\tpop\t{r3, r4, r5}\n"
        "\tmov\tr8, r3\n"
        "\tmov\tr9, r4\n"
        "\tmov\tsl, r5\n"
        "\tpop\t{r4, r5, r6, r7}\n"
        "\tpop\t{r0}\n"
        "\tbx\tr0\n"
        "._57:\n"
        "\t.align\t2, 0\n"
        "._56:\n"
        "\t.word\tgTasks\n"
        "\t.word\tgSaveBlock2\n"
        "\t.word\tgUnknown_Debug_083F7FD6+0x4\n"
        "\t.word\tgUnknown_Debug_083F7FDE\n"
        "\t.word\tgUnknown_Debug_083F7FE2\n"
        "\t.word\tgUnknown_Debug_083F7FED\n"
        "\t.word\tgUnknown_Debug_083F7FF6\n"
        "\t.word\tgUnknown_Debug_083F8001\n"
        "\t.word\tgUnknown_Debug_083F800C\n"
        "\t.word\tgUnknown_Debug_083F8019\n"
        "\t.word\tgUnknown_Debug_083F8022\n"
        "\t.word\tgUnknown_Debug_083F8028\n"
        "\t.word\tgSprites\n"
        "\t.word\tgPokedexEntries\n"
        "\t.word\t0x4000048\n"
        "\t.word\t0x3f1f\n"
        "\t.word\t0x4000040\n"
        "\t.word\t0x4000044\n"
        "\t.word\t0x848\n"
        "\t.word\t0x31bf\n"
        "\t.word\t0x14f\n"
        "\t.word\t0x4000052\n"
        "\t.word\tdebug_80C3D2C+1");
}
#endif // NONMATCHING

void debug_80C3D2C(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        SetMainCallback2(debug_80C370C);
        gTasks[taskId].func = debug_80C373C;
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gTasks[taskId].data[8] ^= 1;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if (gTasks[taskId].data[8])
        {
            if (gMain.heldKeys & R_BUTTON)
                gTasks[taskId].data[6] += 16;
            else
                gTasks[taskId].data[6] += 1;
            if ((u16)gTasks[taskId].data[6] > 0x8000)
                gTasks[taskId].data[6] = 0x8000;
        }
        else
        {
            if (gMain.heldKeys & R_BUTTON)
                gTasks[taskId].data[7] += 16;
            else
                gTasks[taskId].data[7] += 1;
            if ((u16)gTasks[taskId].data[7] > 0x8000)
                gTasks[taskId].data[7] = 0x8000;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        if (gTasks[taskId].data[8])
        {
            if (gMain.heldKeys & R_BUTTON)
                gTasks[taskId].data[6] -= 16;
            else
                gTasks[taskId].data[6] -= 1;
            if (gTasks[taskId].data[6] < 0x100)
                gTasks[taskId].data[6] = 0x100;
        }
        else
        {
            if (gMain.heldKeys & R_BUTTON)
                gTasks[taskId].data[7] -= 16;
            else
                gTasks[taskId].data[7] -= 1;
            if (gTasks[taskId].data[7] < 0x100)
                gTasks[taskId].data[7] = 0x100;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (gTasks[taskId].data[8])
        {
            gTasks[taskId].data[4]--;
        }
        else
        {
            gTasks[taskId].data[5]--;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (gTasks[taskId].data[8])
        {
            gTasks[taskId].data[4]++;
        }
        else
        {
            gTasks[taskId].data[5]++;
        }
    }
    else if (gMain.newAndRepeatedKeys & START_BUTTON)
    {
        if (gTasks[taskId].data[0] < 0x182)
            gTasks[taskId].data[0]++;
        else
            gTasks[taskId].data[0] = 1;
        DestroySprite(gSprites + gTasks[taskId].data[2]);
        DestroySprite(gSprites + gTasks[taskId].data[3]);
        gTasks[taskId].func = debug_80C3A50;
    }
    else if (gMain.newAndRepeatedKeys & SELECT_BUTTON)
    {
        if (gTasks[taskId].data[0] > 1)
            gTasks[taskId].data[0]--;
        else
            gTasks[taskId].data[0] = 0x182;
        DestroySprite(gSprites + gTasks[taskId].data[2]);
        DestroySprite(gSprites + gTasks[taskId].data[3]);
        gTasks[taskId].func = debug_80C3A50;
    }
    else
    {
        u16 scale = gTasks[taskId].data[7];
        u16 offset = gTasks[taskId].data[5];
        SetOamMatrix(1, scale, 0, 0, scale);
        debug_80C68CC(scale, 1, 3, 4);
        debug_80C68CC(offset, 1, 7, 4);
        gSprites[gTasks[taskId].data[2]].pos2.y = offset;

        scale = gTasks[taskId].data[6];
        offset = gTasks[taskId].data[4];
        SetOamMatrix(2, scale, 0, 0, scale);
        debug_80C68CC(scale, 25, 3, 4);
        debug_80C68CC(offset, 25, 7, 4);
        gSprites[gTasks[taskId].data[3]].pos2.y = offset;

        REG_WIN0H = ((gTasks[taskId].data[8] * 64 + 0x38) << 8) + (gTasks[taskId].data[8] * 64 + 0x78);
    }
}

void debug_80C405C(u8 * dest, u16 species)
{
    u8 i;

    for (i = 0; i < 10; i++)
        dest[i] = CHAR_SPACE;
    dest[i] = EOS;

    dest[0] = CHAR_HYPHEN;

    if (species != SPECIES_NONE)
    {
        for (i = 0; gSpeciesNames[species][i] != EOS && i < 10; i++)
            dest[i] = gSpeciesNames[species][i];
    }
}

void debug_80C40C4(bool8 who)
{
    u8 i;
    u16 maxHp;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (who)
        {
            struct Pokemon *pokemon = gEnemyParty + i;
            if (GetMonData(pokemon, MON_DATA_SPECIES) != SPECIES_NONE)
            {
                CalculateMonStats(pokemon);
                maxHp = GetMonData(pokemon, MON_DATA_MAX_HP);
                SetMonData(pokemon, MON_DATA_HP, &maxHp);
            }
        }
        else
        {
            struct Pokemon *pokemon = gPlayerParty + i;
            if (GetMonData(pokemon, MON_DATA_SPECIES) != SPECIES_NONE)
            {
                CalculateMonStats(pokemon);
                maxHp = GetMonData(pokemon, MON_DATA_MAX_HP);
                SetMonData(pokemon, MON_DATA_HP, &maxHp);
            }
        }
    }
}

void InitBattleForDebug(void)
{
    SavePlayerParty();
    gUnknown_Debug_2038A0C[13] = gSaveBlock2.playerGender;
    gUnknown_Debug_2038A0C[0] = 0;
    gUnknown_Debug_2038A0C[1] = 0;
    gUnknown_Debug_2038A0C[2] = 0;
    gUnknown_Debug_2038A0C[3] = 0;
    gUnknown_Debug_2038A0C[4] = 0;
    gUnknown_Debug_2038A0C[5] = 0;
    gUnknown_Debug_2038A0C[6] = 0;
    gUnknown_Debug_2038A0C[7] = 0;
    gUnknown_Debug_2038A0C[8] = 0;
    gUnknown_Debug_2038A0C[12] = 0;
    byte_3005E30 = 0;
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    debug_80C4214(0);
    CreateTask(debug_80C47BC, 0);
}

void debug_80C41A8(void)
{
    gUnknown_Debug_2038A0C[1] = 0;
    gUnknown_Debug_2038A0C[2] = 0;
    ZeroPlayerPartyMons();
    ZeroEnemyPartyMons();
    debug_80C4214(0);
    CreateTask(debug_80C47BC, 0);
}

void debug_80C41D4(void)
{
    debug_80C40C4(0);
    debug_80C4214(0);
    CreateTask(debug_80C42B8, 0);
}

void debug_80C41F4(void)
{
    debug_80C40C4(1);
    debug_80C4214(1);
    CreateTask(debug_80C42B8, 0);
}

void debug_80C4214(UNUSED u8 a0)
{
    debug_80C35DC();
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_WININ = 0x1111;
    REG_WINOUT = 0x0031;
    REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
    REG_BLDALPHA = 0;
    REG_BLDY = 7;

    {
        u16 imeBak = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = imeBak;
    }

    SetVBlankCallback(debug_80C3758);
    SetMainCallback2(debug_80C370C);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
    REG_WIN0H = 0x01EF;
    REG_WIN0V = 0x819F;
}

void debug_80C42B8(u8 taskId)
{
    u8 sp00[ARRAY_COUNT(gUnknown_Debug_083F8194)];
    u8 sp0c[ARRAY_COUNT(gUnknown_Debug_083F81A0)];

    memcpy(sp00, gUnknown_Debug_083F8194, sizeof(gUnknown_Debug_083F8194));
    memcpy(sp0c, gUnknown_Debug_083F81A0, sizeof(gUnknown_Debug_083F81A0));

    // u8 sp00[] = _("ポケモンを　えらんでね");
    // u8 sp0c[] = _("{COLOR RED}START:つぎへ");

    Menu_DrawStdWindowFrame(0, 16, 29, 19);
    Menu_PrintText(sp00, 1, 17);
    Menu_PrintText(sp0c, 20, 17);

    debug_80C4694();
    debug_80C4704();

    if (gUnknown_Debug_2038A0C[0])
        gTasks[taskId].func = debug_80C44EC;
    else
        gTasks[taskId].func = debug_80C4348;
}

void debug_80C4348(u8 taskId)
{
    debug_80C38E4(gUnknown_Debug_2038A0C[1] * 2 + 3, 1, 1, 14, 1);
    REG_WIN1H = 0x0177;
    REG_WIN1V = 0x017F;
    gTasks[taskId].func = debug_80C43A8;
}

void debug_80C43A8(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        debug_sub_80A433C(gPlayerParty + gUnknown_Debug_2038A0C[1], debug_80C41D4);
        DestroyTask(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].func = debug_80C4F48;
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        if (debug_80C4774())
        {
            PlaySE(SE_SELECT);
            CalculatePlayerPartyCount();
            CalculateEnemyPartyCount();
            gTasks[taskId].func = debug_80C4D14;
        }
    }
    else if (gMain.newKeys & (R_BUTTON | DPAD_RIGHT))
    {
        debug_80C38E4(0, 1, 1, 14, 0);
        gTasks[taskId].func = debug_80C44EC;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP && gUnknown_Debug_2038A0C[1] != 0)
    {
        gUnknown_Debug_2038A0C[1]--;
        gTasks[taskId].func = debug_80C4348;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN && gUnknown_Debug_2038A0C[1] < 5 && GetMonData(gPlayerParty + gUnknown_Debug_2038A0C[1], MON_DATA_SPECIES) != SPECIES_NONE)
    {
        gUnknown_Debug_2038A0C[1]++;
        gTasks[taskId].func = debug_80C4348;
    }
}

void debug_80C44EC(u8 taskId)
{
    debug_80C38E4(gUnknown_Debug_2038A0C[2] * 2 + 3, 16, 1, 14, 1);
    REG_WIN1H = 0x79EF;
    REG_WIN1V = 0x017F;
    gTasks[taskId].func = debug_80C4550;
}

void debug_80C4550(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        debug_sub_80A433C(gEnemyParty + gUnknown_Debug_2038A0C[2], debug_80C41F4);
        DestroyTask(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].func = debug_80C4F48;
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        if (debug_80C4774())
        {
            PlaySE(SE_SELECT);
            CalculatePlayerPartyCount();
            CalculateEnemyPartyCount();
            gTasks[taskId].func = debug_80C4D14;
        }
    }
    else if (gMain.newKeys & (L_BUTTON | DPAD_LEFT))
    {
        debug_80C38E4(0, 16, 1, 14, 0);
        gTasks[taskId].func = debug_80C4348;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP && gUnknown_Debug_2038A0C[2] != 0)
    {
        gUnknown_Debug_2038A0C[2]--;
        gTasks[taskId].func = debug_80C44EC;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN && gUnknown_Debug_2038A0C[2] < 5 && GetMonData(gEnemyParty + gUnknown_Debug_2038A0C[2], MON_DATA_SPECIES) != SPECIES_NONE)
    {
        gUnknown_Debug_2038A0C[2]++;
        gTasks[taskId].func = debug_80C44EC;
    }
}

void debug_80C4694(void)
{
    u8 i;
    // u8 sp00[] = _("{COLOR RED}じぶんの　ポケモン");
    u8 sp00[ARRAY_COUNT(gUnknown_Debug_083F81AD)];
    u8 sp10[POKEMON_NAME_LENGTH + 1];
    memcpy(sp00, gUnknown_Debug_083F81AD, sizeof(gUnknown_Debug_083F81AD));

    Menu_DrawStdWindowFrame(0, 0, 14, 15);
    Menu_PrintText(sp00, 2, 1);
    for (i = 0; i < PARTY_SIZE; i++)
    {
        debug_80C405C(sp10, GetMonData(gPlayerParty + i, MON_DATA_SPECIES));
        Menu_PrintText(sp10, 2, 2 * i + 3);
    }
}

void debug_80C4704(void)
{
    u8 i;
    // u8 sp00[] = _("{COLOR RED}あいての　ポケモン");
    u8 sp00[ARRAY_COUNT(gUnknown_Debug_083F81BA)];
    u8 sp10[POKEMON_NAME_LENGTH + 1];
    memcpy(sp00, gUnknown_Debug_083F81BA, sizeof(gUnknown_Debug_083F81BA));

    Menu_DrawStdWindowFrame(15, 0, 29, 15);
    Menu_PrintText(sp00, 17, 1);
    for (i = 0; i < PARTY_SIZE; i++)
    {
        debug_80C405C(sp10, GetMonData(gEnemyParty + i, MON_DATA_SPECIES));
        Menu_PrintText(sp10, 17, 2 * i + 3);
    }
}

bool8 debug_80C4774(void)
{
    u8 i = gUnknown_Debug_2038A0C[12] - 1;
    if (GetMonData(gPlayerParty + i, MON_DATA_SPECIES) != SPECIES_NONE && GetMonData(gEnemyParty + i, MON_DATA_SPECIES) != SPECIES_NONE)
        return TRUE;
    return FALSE;
}

void debug_80C47BC(u8 taskId)
{
    u8 i;

    // u8 sp00[] = _("{COLOR RED}あいての　ポケモン");
    // u8 sp10[] = _("たいせんモードを　えらんでね");
    // u8 sp20[] = _("{COLOR RED}バトルモード　せんたく");
    // u8 sp30[] = _("{COLOR RED}トレーナーAI　せんたく");

    u8 sp00[ARRAY_COUNT(gUnknown_Debug_083F81C7)];
    u8 sp10[ARRAY_COUNT(gUnknown_Debug_083F81A0)];
    u8 sp20[ARRAY_COUNT(gUnknown_Debug_083F81D6)];
    u8 sp30[ARRAY_COUNT(gUnknown_Debug_083F81E5)];

    memcpy(sp00, gUnknown_Debug_083F81C7, sizeof(gUnknown_Debug_083F81C7));
    memcpy(sp10, gUnknown_Debug_083F81A0, sizeof(gUnknown_Debug_083F81A0));
    memcpy(sp20, gUnknown_Debug_083F81D6, sizeof(gUnknown_Debug_083F81D6));
    memcpy(sp30, gUnknown_Debug_083F81E5, sizeof(gUnknown_Debug_083F81E5));

    Menu_DrawStdWindowFrame(0, 16, 29, 19);
    Menu_PrintText(sp00, 1, 17);
    Menu_PrintText(sp10, 20, 17);

    Menu_DrawStdWindowFrame(0, 0, 14, 15);
    Menu_PrintText(sp20, 2, 1);

    for (i = 0; i < ARRAY_COUNT(gUnknown_Debug_083F8068); i++)
        Menu_PrintText(gUnknown_Debug_083F8068[i].text, 2, 2 * i + 3);

    Menu_DrawStdWindowFrame(15, 0, 29, 15);
    Menu_PrintText(sp30, 17, 1);

    debug_80C4C44(gUnknown_Debug_2038A0C[4]);

    gTasks[taskId].func = debug_80C48A0;
}

void debug_80C48A0(u8 taskId)
{
    debug_80C38E4(2 * gUnknown_Debug_2038A0C[3] + 3, 1, 1, 14, 1);
    REG_WIN1H = 0x0177;
    REG_WIN1V = 0x017F;
    gTasks[taskId].func = debug_80C4900;
}

void debug_80C4900(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        SetMainCallback2(debug_80C370C);
        LoadPlayerParty();
        gSaveBlock2.playerGender = gUnknown_Debug_2038A0C[13];
        gBattleTypeFlags = 0;
        gUnknown_02023A14_50 = 0;
        gTasks[taskId].func = debug_80C373C;
    }
    else if (gMain.newKeys & START_BUTTON || gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gBattleTypeFlags = gUnknown_Debug_083F8068[gUnknown_Debug_2038A0C[3]].data.type1[0];
        gUnknown_02023A14_50 = 8;
        gUnknown_Debug_2038A0C[12] = gUnknown_Debug_083F8068[gUnknown_Debug_2038A0C[3]].data.type1[1];
        if (gUnknown_Debug_2038A0C[3] == 1 || gUnknown_Debug_2038A0C[3] == 2)
        {
            debug_80C38E4(0, 1, 1, 14, 0);
            gTasks[taskId].func = debug_80C4A60;
        }
        else
        {
            gTasks[taskId].func = debug_80C4F48;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP && gUnknown_Debug_2038A0C[3] > 0)
    {
        gUnknown_Debug_2038A0C[3]--;
        gTasks[taskId].func = debug_80C48A0;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN && gUnknown_Debug_2038A0C[3] < 2)
    {
        gUnknown_Debug_2038A0C[3]++;
        gTasks[taskId].func = debug_80C48A0;
    }
}

void debug_80C4A60(u8 taskId)
{
    debug_80C38E4(gUnknown_Debug_2038A0C[5] * 2 + 3, 16, 1, 14, 1);
    REG_WIN1H = 0x79EF;
    REG_WIN1V = 0x017F;
    gTasks[taskId].func = debug_80C4AC4;
}

struct WatanabeEwram17000 {
    u8 fill0;
    u8 unk1_0:4;
    u8 unk1_4:1;
    u8 unk1_5:3;
    u8 unk2;
    u8 unk3;
    u8 fill4[5];
    u8 unk9;
    u8 unkA;
    u8 unkB;
    u8 unkC;
};

#define eWatanabe17000 (*(struct WatanabeEwram17000 *)(gSharedMem + 0x17000))

void debug_80C4AC4(u8 taskId)
{
    u8 r1 = gUnknown_Debug_2038A0C[4] + gUnknown_Debug_2038A0C[5];
    
    if (gMain.newKeys & A_BUTTON)
    {
        u32 mask = gUnknown_Debug_083F80D8[r1].data.type2;
        if (byte_3005E30 & mask)
            byte_3005E30 &= (mask ^ 0xFFFF);
        else
            byte_3005E30 |= mask;
        debug_80C4C44(gUnknown_Debug_2038A0C[4]);
        gTasks[taskId].func = debug_80C4A60;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        debug_80C38E4(0, 16, 1, 14, 0);
        gTasks[taskId].func = debug_80C48A0;
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        PlaySE(SE_SELECT);
        gTrainerBattleOpponent = 0x400;
        eWatanabe17000.unk1_4 = 0;
        eWatanabe17000.unk2 = 0xAC;
        eWatanabe17000.unk3 = 0xFF;
        eWatanabe17000.unk9 = 0;
        eWatanabe17000.unkA = 0;
        eWatanabe17000.unkB = 0;
        eWatanabe17000.unkC = 0;
        gTasks[taskId].func = debug_80C4F48;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (gUnknown_Debug_2038A0C[5] > 0)
            gUnknown_Debug_2038A0C[5]--;
        else if (gUnknown_Debug_2038A0C[4] > 0)
        {
            gUnknown_Debug_2038A0C[4]--;
            debug_80C4C44(gUnknown_Debug_2038A0C[4]);
        }
        gTasks[taskId].func = debug_80C4A60;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN && gUnknown_Debug_2038A0C[5] < 9)
    {
        if (gUnknown_Debug_2038A0C[5] < 5)
            gUnknown_Debug_2038A0C[5]++;
        else if (gUnknown_Debug_2038A0C[4] < 4)
        {
            gUnknown_Debug_2038A0C[4]++;
            debug_80C4C44(gUnknown_Debug_2038A0C[4]);
        }
        gTasks[taskId].func = debug_80C4A60;
    }
}

void debug_80C4C44(u8 a0)
{
    u8 i;
    u8 j;
    u8 sp00[15];

    for (i = 0; i < 6; i++)
    {
        if (i + a0 < 10)
        {
            for (j = 0; gUnknown_Debug_083F80D8[i + a0].text[j] != EOS && j < 12; j++)
            {
                sp00[j + 3] = gUnknown_Debug_083F80D8[i + a0].text[j];
            }
            for (; j < 12; j++)
            {
                sp00[j + 3] = CHAR_SPACE;
            }
            sp00[14] = EOS;
            sp00[0] = EXT_CTRL_CODE_BEGIN;
            sp00[1] = 0x01;
            if (byte_3005E30 & (1 << (i + a0)))
                sp00[2] = 0x03;
            else
                sp00[2] = 0x01;
            Menu_PrintText(sp00, 17, 2 * i + 3);
        }
    }
}

void debug_80C4D14(u8 taskId)
{
    // u8 sp00[] = _("たいせんモードを　えらんでね");
    // u8 sp10[] = _("{COLOR RED}START:かいし");
    // u8 sp20[] = _("{COLOR RED}バトルちけい　せんたく");

    u8 sp00[ARRAY_COUNT(gUnknown_Debug_083F81C7)];
    u8 sp10[ARRAY_COUNT(gUnknown_Debug_083F81F5)];
    u8 sp20[ARRAY_COUNT(gUnknown_Debug_083F8202)];

    memcpy(sp00, gUnknown_Debug_083F81C7, sizeof(gUnknown_Debug_083F81C7));
    memcpy(sp10, gUnknown_Debug_083F81F5, sizeof(gUnknown_Debug_083F81F5));
    memcpy(sp20, gUnknown_Debug_083F8202, sizeof(gUnknown_Debug_083F8202));

    Menu_DrawStdWindowFrame(0, 16, 29, 19);
    Menu_PrintText(sp00, 1, 17);
    Menu_PrintText(sp10, 20, 17);

    Menu_DrawStdWindowFrame(0, 0, 14, 15);
    Menu_PrintText(sp20, 2, 1);
    debug_80C4F00(gUnknown_Debug_2038A0C[6]);

    Menu_DrawStdWindowFrame(15, 0, 29,15);
    gTasks[taskId].func = debug_80C4DB8;
}

void debug_80C4DB8(u8 taskId)
{
    debug_80C38E4(2 * gUnknown_Debug_2038A0C[7] + 3, 1, 1, 14, 1);
    REG_WIN1H = 0x0177;
    REG_WIN1V = 0x017F;
    gTasks[taskId].func = debug_80C4E18;
}

void debug_80C4E18(u8 taskId)
{
    u8 r6 = gUnknown_Debug_2038A0C[6] + gUnknown_Debug_2038A0C[7];
    if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].func = debug_80C42B8;
    }
    else if (gMain.newKeys & START_BUTTON || gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gBattleTerrain = gUnknown_Debug_083F814C[r6].data.type3;
        gTasks[taskId].func = debug_80C5158;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (gUnknown_Debug_2038A0C[7] > 0)
            gUnknown_Debug_2038A0C[7]--;
        else if (gUnknown_Debug_2038A0C[6] > 0)
        {
            gUnknown_Debug_2038A0C[6]--;
            debug_80C4F00(gUnknown_Debug_2038A0C[6]);
        }
        gTasks[taskId].func = debug_80C4DB8;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN && gUnknown_Debug_2038A0C[7] < 8)
    {
        if (gUnknown_Debug_2038A0C[7] < 5)
            gUnknown_Debug_2038A0C[7]++;
        else if (gUnknown_Debug_2038A0C[6] < 3)
        {
            gUnknown_Debug_2038A0C[6]++;
            debug_80C4F00(gUnknown_Debug_2038A0C[6]);
        }
        gTasks[taskId].func = debug_80C4DB8;
    }
}

void debug_80C4F00(u8 a0)
{
    u8 i;
    Menu_BlankWindowRect(1, 3, 13, 14);

    for (i = 0; i < 6; i++)
    {
        if (i < 9)
            Menu_PrintText(gUnknown_Debug_083F814C[i + a0].text, 2, 2 * i + 3);
    }
}

void debug_80C4F48(u8 taskId)
{
    // u8 sp00[] = _("じぶんの　せいべつを　えらんでね");
    // u8 sp14[] = _("{COLOR RED}START:つぎへ");
    // u8 sp24[] = _("{COLOR RED}せいべつ　せんたく");
    // u8 sp34[] = _("おとこ");
    // u8 sp38[] = _("おんな");

    u8 sp00[ARRAY_COUNT(gUnknown_Debug_083F8211)];
    u8 sp14[ARRAY_COUNT(gUnknown_Debug_083F81A0)];
    u8 sp24[ARRAY_COUNT(gUnknown_Debug_083F8222)];
    u8 sp34[ARRAY_COUNT(gUnknown_Debug_083F822F)];
    u8 sp38[ARRAY_COUNT(gUnknown_Debug_083F8233)];

    memcpy(sp00, gUnknown_Debug_083F8211, sizeof(gUnknown_Debug_083F8211));
    memcpy(sp14, gUnknown_Debug_083F81A0, sizeof(gUnknown_Debug_083F81A0));
    memcpy(sp24, gUnknown_Debug_083F8222, sizeof(gUnknown_Debug_083F8222));
    memcpy(sp34, gUnknown_Debug_083F822F, sizeof(gUnknown_Debug_083F822F));
    memcpy(sp38, gUnknown_Debug_083F8233, sizeof(gUnknown_Debug_083F8233));

    Menu_DrawStdWindowFrame(0, 16, 29, 19);
    Menu_PrintText(sp00, 1, 17);
    Menu_PrintText(sp14, 20, 17);

    Menu_DrawStdWindowFrame(0, 0, 14, 15);
    Menu_PrintText(sp24, 2, 1);

    Menu_BlankWindowRect(1, 3, 13, 14);
    Menu_PrintText(sp24, 2, 1);
    Menu_PrintText(sp34, 2, 3);
    Menu_PrintText(sp38, 2, 5);

    Menu_DrawStdWindowFrame(15, 0, 29, 15);
    gTasks[taskId].func = debug_80C5038;
}

void debug_80C5038(u8 taskId)
{
    debug_80C38E4(gUnknown_Debug_2038A0C[8] * 2 + 3, 1, 1, 14, 1);
    REG_WIN1H = 0x0177;
    REG_WIN1V = 0x017F;
    gTasks[taskId].func = debug_80C5098;
}

void debug_80C5098(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].func = debug_80C47BC;
    }
    else if (gMain.newKeys & START_BUTTON || gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gSaveBlock2.playerGender = gUnknown_Debug_2038A0C[8];
        gTasks[taskId].func = debug_80C42B8;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP && gUnknown_Debug_2038A0C[8] > 0)
    {
        gUnknown_Debug_2038A0C[8]--;
        gTasks[taskId].func = debug_80C5038;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN && gUnknown_Debug_2038A0C[8] < 1)
    {
        gUnknown_Debug_2038A0C[8]++;
        gTasks[taskId].func = debug_80C5038;
    }
}

void debug_80C5158(u8 taskId)
{
    gTasks[taskId].func = debug_80C5174;
}

void debug_80C5174(u8 taskId)
{
    gTasks[taskId].func = debug_80C5190;
}

void debug_80C5190(u8 taskId)
{
    gTasks[taskId].func = debug_80C51AC;
}

void debug_80C51AC(u8 taskId)
{
    gTasks[taskId].func = debug_80C51C8;
}

void debug_80C51C8(u8 taskId)
{
    gTasks[taskId].func = debug_80C51E4;
}

void debug_80C51E4(u8 taskId)
{
    sub_80408BC();
    gMain.savedCallback = debug_80C41A8;
    SetMainCallback2(unref_sub_800D684);
}

void debug_80C5208(void)
{
    u16 i;

    gUnknown_Debug_2038A1C = &eWatanabe18000;

    for (i = 0; i < 64; i++)
    {
        gUnknown_Debug_2038A1C->unk64[i] = 0;
    }

    gUnknown_Debug_2038A1C->unk64[0] = 0xfc;
    gUnknown_Debug_2038A1C->unk64[3] = gSaveBlock2.playerTrainerId[0] | (gSaveBlock2.playerTrainerId[1] << 8) | (gSaveBlock2.playerTrainerId[2] << 16) | (gSaveBlock2.playerTrainerId[3] << 24);
    gUnknown_Debug_2038A1C->unk64[4] = (Random() << 16) | Random();
    gUnknown_Debug_2038A1C->unk64[1] = 1;
    gUnknown_Debug_2038A1C->unk64[2] = 1;
    debug_80C5C94();
}

bool8 debug_80C527C(struct Pokemon *pokemon)
{
    u8 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(gPlayerParty + i, MON_DATA_SPECIES, NULL) == SPECIES_NONE)
        {
            gPlayerParty[i] = *pokemon;
            gPlayerPartyCount = i + 1;
            return FALSE;
        }
    }
    SendMonToPC(&gUnknown_Debug_2038A1C->pokemon);
    return TRUE;
}

void InitCreatePokemon(void)
{
    // u8 sp04[] = _("Create　POKひMON　　　LR:Shift　　START:Add");
    u8 sp04[ARRAY_COUNT(gUnknown_Debug_083F8733)];

    memcpy(sp04, gUnknown_Debug_083F8733, sizeof(gUnknown_Debug_083F8733));

    debug_80C35DC();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    REG_BLDCNT = 0x0000;
    REG_BLDALPHA = 0x0000;
    REG_BLDY = 0x0000;

    {
        u16 imeBak = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = imeBak;
    }

    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;

    SetVBlankCallback(debug_80C3758);
    SetMainCallback2(debug_80C370C);

    Menu_DrawStdWindowFrame(0, 0, 29, 3);
    Menu_PrintText(sp04, 1, 1);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON;
    CreateTask(debug_80C53A4, 0);
    debug_80C5208();
    gUnknown_Debug_2038A1C->unk168 = 0;
    gUnknown_Debug_2038A1C->unk169 = 0;
}

void debug_80C53A4(u8 taskId)
{
    gTasks[taskId].func = debug_80C53C0;
}

void debug_80C53C0(u8 taskId)
{
    debug_80C6384();
    debug_80C627C(0);
    gTasks[taskId].func = debug_80C53F0;
}

void debug_80C53F0(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        gUnknown_Debug_2038A1C->unk164 = gUnknown_Debug_2038A1C->unk64[gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[gUnknown_Debug_2038A1C->unk169]];
        gUnknown_Debug_2038A1C->unk16a = 0;
        debug_80C643C();
        gTasks[taskId].func = debug_80C55E4;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        SetMainCallback2(debug_80C370C);
        gTasks[taskId].func = debug_80C373C;
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        bool8 r4;
        PlaySE(SE_SELECT);
        debug_80C5FFC();
        r4 = debug_80C527C(&gUnknown_Debug_2038A1C->pokemon);
        Menu_DrawStdWindowFrame(3, 8, 26, 11);
        if (r4)
            Menu_PrintText(gUnknown_Debug_083F872A, 4, 9);
        else
            Menu_PrintText(gUnknown_Debug_083F8720, 4, 9);
        gTasks[taskId].func = debug_80C5708;
    }
    else if (gMain.newKeys & SELECT_BUTTON)
    {
        u32 r4 = gUnknown_Debug_2038A1C->unk64[0];
        GetSetPokedexFlag(r4, 2);
        GetSetPokedexFlag(r4, 3);
        PlaySE(SE_SELECT);
    }
    else if (gMain.newKeys & DPAD_UP)
    {
        debug_80C627C(2);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        debug_80C627C(1);
    }
    else if (gMain.newKeys & L_BUTTON && gUnknown_Debug_2038A1C->unk168 > 0)
    {
        gUnknown_Debug_2038A1C->unk168--;
        gUnknown_Debug_2038A1C->unk169 = 0;
        gTasks[taskId].func = debug_80C53C0;
    }
    else if (gMain.newKeys & R_BUTTON && gUnknown_Debug_2038A1C->unk168 < 5)
    {
        gUnknown_Debug_2038A1C->unk168++;
        gUnknown_Debug_2038A1C->unk169 = 0;
        gTasks[taskId].func = debug_80C53C0;
    }
}

u16 word_83F888C[] = INCBIN_U16("graphics/debug/sprite_browser.gbapal");
u8 byte_83F88EC[] = INCBIN_U8("graphics/debug/sprite_browser.4bpp");

#endif // DEBUG
