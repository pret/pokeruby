#if DEBUG
#include "global.h"
#include "decompress.h"
#include "ewram.h"
#include "random.h"
#include "gba/flash_internal.h"
#include "constants/items.h"
#include "constants/species.h"
#include "constants/moves.h"
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
#include "item.h"
#include "pokemon_summary_screen.h"
#include "pokemon_icon.h"
#include "field_effect.h"

struct WatanabeDebugMenuItemSubstruct {
    u32 unk0;
    u32 unk4;
    u8 unk8;
    u8 unk9;
};

struct WatanabeDebugMenuItem {
    const u8 * text;
    union {
        u8 type1[2];
        u32 type2;
        u8 type3;
        const struct WatanabeDebugMenuItemSubstruct *type4;
    } data;
};

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

struct WatanabeEwram18000 {
    struct Pokemon pokemon;
    u32 unk64[0x40];
    u32 unk164;
    u8 unk168;
    u8 unk169;
    u8 unk16a;
    u8 unk16b[259];
};

struct WatanabeEwram18000_2 {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    struct PlttData unkC;
    u16 unk10[16];
};

#define eWatanabe17000 (*(struct WatanabeEwram17000 *)(gSharedMem + 0x17000))
#define eWatanabe18000 (*(struct WatanabeEwram18000 *)(gSharedMem + 0x18000))
#define eWatanabe18000_2 (*(struct WatanabeEwram18000_2 *)(gSharedMem + 0x18000))

EWRAM_DATA u8 gUnknown_Debug_20389EC[0x20] = { 0 };
EWRAM_DATA u8 gUnknown_Debug_2038A0C[0x10] = { 0 };
EWRAM_DATA struct WatanabeEwram18000 * gUnknown_Debug_2038A1C = NULL;
EWRAM_DATA struct WatanabeEwram18000_2 * gUnknown_Debug_2038A20 = NULL;

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
void debug_80C5DEC(void);
void debug_80C5EF4(void);
void debug_80C5FFC(void);
void debug_80C627C(u8);
void debug_80C6384(void);
void debug_80C643C(void);
void debug_80C6544(u8);
void debug_80C689C(u8 *, const u8 *, u8);
void debug_80C6678(u8 *, u32, u8, u8);
void debug_80C68CC(u16, u8, u8, u8);
void debug_80C6B00(u8 taskId);
void debug_80C6CB8(u8 taskId);
void debug_80C6EE8(u8 taskId);
void debug_80C6FA8(u8 taskId);
void debug_80C71FC(u8 taskId);
void debug_80C7294(u8 taskId);
void debug_80C74E4(u8 taskId);
void debug_80C7584(struct Sprite *);
void debug_80C777C(u8 taskId);
void debug_80C7934(u8 taskId);
void debug_80C7A54(u8 taskId);
void debug_80C7B14(u8 taskId);
void debug_80C7D44(u8 taskId);
void debug_80C7DDC(u8 taskId);
void debug_80C802C(u8 taskId);

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
    InitMenuWindow(&gMenuTextWindowTemplate);
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
    u8 sp00[] = _("▶");
    Menu_BlankWindowRect(a1, a2, a1, a3);
    if (a4)
        Menu_PrintText(sp00, a1, a0);
}

const u8 gUnknown_Debug_083F7FD6[] = {0x25, 0x20, 0x01, 0x08};

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
    u16 imeBak;
    debug_80C35DC();
    gReservedSpritePaletteCount = 1;
    LoadPalette(gUnknown_Debug_20389EC, 0x100, 0x20);

    imeBak = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = imeBak;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    SetVBlankCallback(debug_80C3758);
    SetMainCallback2(debug_80C370C);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON;
    taskId = CreateTask(debug_80C3A50, 0);
    gTasks[taskId].data[0] = 0xfc;
}

const u8 gUnknown_Debug_083F7FDA[] = _("ひりつ");
const u8 gUnknown_Debug_083F7FDE[] = _("たかさ");
const u8 gUnknown_Debug_083F7FE2[] = _("Lキー▶しゅくしょう");
const u8 gUnknown_Debug_083F7FED[] = _("Rキー▶かくだい");
const u8 gUnknown_Debug_083F7FF6[] = _("Uキー▶うえ　いどう");
const u8 gUnknown_Debug_083F8001[] = _("Dキー▶した　いどう");
const u8 gUnknown_Debug_083F800C[] = _("Aボタン▶そうさきりかえ");
const u8 gUnknown_Debug_083F8019[] = _("Bボタン▶やめる");
const u8 gUnknown_Debug_083F8022[] = _("スタート:");
const u8 gUnknown_Debug_083F8028[] = _(":セレクト");

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
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
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

const u8 gUnknown_Debug_083F802E[] = _("やせいたいせん");
const u8 gUnknown_Debug_083F8036[] = _("1VS1たいせん");
const u8 gUnknown_Debug_083F803F[] = _("2VS2たいせん");
const u8 gUnknown_Debug_083F8048[] = _("{COLOR BLUE}1VS1つうしんたいせん");
const u8 gUnknown_Debug_083F8058[] = _("{COLOR BLUE}2VS2つうしんたいせん");

const struct WatanabeDebugMenuItem gUnknown_Debug_083F8068[] = {
	{gUnknown_Debug_083F802E, {.type1 = {0x00, 0x01}}},
	{gUnknown_Debug_083F8036, {.type1 = {0x08, 0x01}}},
	{gUnknown_Debug_083F803F, {.type1 = {0x09, 0x02}}},
	{gUnknown_Debug_083F8048, {.type1 = {0x0A, 0x01}}},
	{gUnknown_Debug_083F8058, {.type1 = {0x0B, 0x02}}}
};

const u8 gUnknown_Debug_083F8090[] = _("きほんタイプ");
const u8 gUnknown_Debug_083F8097[] = _("AIタイプ2");
const u8 gUnknown_Debug_083F809E[] = _("AIタイプ3");
const u8 gUnknown_Debug_083F80A5[] = _("AIタイプ4");
const u8 gUnknown_Debug_083F80AC[] = _("AIタイプ5");
const u8 gUnknown_Debug_083F80B3[] = _("AIタイプ6");
const u8 gUnknown_Debug_083F80BA[] = _("AIタイプ7");
const u8 gUnknown_Debug_083F80C1[] = _("AIタイプ8");
const u8 gUnknown_Debug_083F80C8[] = _("AIタイプ9");
const u8 gUnknown_Debug_083F80CF[] = _("AIタイプ10");

const struct WatanabeDebugMenuItem gUnknown_Debug_083F80D8[] = {
	{gUnknown_Debug_083F8090, {.type2 = 0x1}},
	{gUnknown_Debug_083F8097, {.type2 = 0x2}},
	{gUnknown_Debug_083F809E, {.type2 = 0x4}},
	{gUnknown_Debug_083F80A5, {.type2 = 0x8}},
	{gUnknown_Debug_083F80AC, {.type2 = 0x10}},
	{gUnknown_Debug_083F80B3, {.type2 = 0x20}},
	{gUnknown_Debug_083F80BA, {.type2 = 0x40}},
	{gUnknown_Debug_083F80C1, {.type2 = 0x80}},
	{gUnknown_Debug_083F80C8, {.type2 = 0x100}},
	{gUnknown_Debug_083F80CF, {.type2 = 0x200}}
};

const u8 gUnknown_Debug_083F8128[] = _("くさ");
const u8 gUnknown_Debug_083F812B[] = _("ながい　くさ");
const u8 gUnknown_Debug_083F8132[] = _("すな");
const u8 gUnknown_Debug_083F8135[] = _("みず");
const u8 gUnknown_Debug_083F8138[] = _("うみ");
const u8 gUnknown_Debug_083F813B[] = _("いけ");
const u8 gUnknown_Debug_083F813E[] = _("いわ");
const u8 gUnknown_Debug_083F8141[] = _("どうくつ");
const u8 gUnknown_Debug_083F8146[] = _("そのた");

const struct WatanabeDebugMenuItem gUnknown_Debug_083F814C[] = {
	{gUnknown_Debug_083F8128, {.type3 = 0x0}},
	{gUnknown_Debug_083F812B, {.type3 = 0x1}},
	{gUnknown_Debug_083F8132, {.type3 = 0x2}},
	{gUnknown_Debug_083F8135, {.type3 = 0x3}},
	{gUnknown_Debug_083F8138, {.type3 = 0x4}},
	{gUnknown_Debug_083F813B, {.type3 = 0x5}},
	{gUnknown_Debug_083F813E, {.type3 = 0x6}},
	{gUnknown_Debug_083F8141, {.type3 = 0x7}},
	{gUnknown_Debug_083F8146, {.type3 = 0x8}}
};

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
    u16 imeBak;
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

    imeBak = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = imeBak;

    SetVBlankCallback(debug_80C3758);
    SetMainCallback2(debug_80C370C);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
    REG_WIN0H = 0x01EF;
    REG_WIN0V = 0x819F;
}

void debug_80C42B8(u8 taskId)
{
     u8 sp00[] = _("ポケモンを　えらんでね");
     u8 sp0c[] = _("{COLOR RED}START:つぎへ");

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
    u8 sp00[] = _("{COLOR RED}じぶんの　ポケモン");
    u8 sp10[POKEMON_NAME_LENGTH + 1];

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
    u8 sp00[] = _("{COLOR RED}あいての　ポケモン");
    u8 sp10[POKEMON_NAME_LENGTH + 1];

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
    u8 sp00[] = _("たいせんモードを　えらんでね");
    u8 sp10[] = _("{COLOR RED}START:つぎへ");
    u8 sp20[] = _("{COLOR RED}バトルモード　せんたく");
    u8 sp30[] = _("{COLOR RED}トレーナーAI　せんたく");

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
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
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
    u8 sp00[] = _("たいせんモードを　えらんでね");
    u8 sp10[] = _("{COLOR RED}START:かいし");
    u8 sp20[] = _("{COLOR RED}バトルちけい　せんたく");

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
    u8 sp00[] = _("じぶんの　せいべつを　えらんでね");
    u8 sp14[] = _("{COLOR RED}START:つぎへ");
    u8 sp24[] = _("{COLOR RED}せいべつ　せんたく");
    u8 sp34[] = _("おとこ");
    u8 sp38[] = _("おんな");

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
    SetMainCallback2(debug_sub_800D684);
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

const u8 Str_83F8237[] = _("Kind");
const struct WatanabeDebugMenuItemSubstruct _83F823C = {1, 0x00000182, 0x00, 0x03};

const u8 Str_83F8248[] = _("Level");
const struct WatanabeDebugMenuItemSubstruct _83F8250 = {1, 0x00000064, 0x00, 0x03};

const u8 Str_83F825C[] = _("EXP Points");
const struct WatanabeDebugMenuItemSubstruct _83F8268 = {1, 0x001E8480, 0x00, 0x07};

const u8 Str_83F8274[] = _("ID");
const struct WatanabeDebugMenuItemSubstruct _83F8278 = {0, 0xFFFFFFFF, 0x00, 0x0A};

const u8 Str_83F8284[] = _("Rnd Numbers");
const struct WatanabeDebugMenuItemSubstruct _83F8290 = {0, 0xFFFFFFFF, 0x00, 0x0A};

const u8 Str_83F829C[] = _("Sex");
const struct WatanabeDebugMenuItemSubstruct _83F82A0 = {0, 0x00000002, 0x00, 0xFF};

const u8 Str_83F82AC[] = _("Character");
const struct WatanabeDebugMenuItemSubstruct _83F82B8 = {0, 0x00000018, 0x00, 0xFF};

const u8 Str_83F82C4[] = _("Move1");
const struct WatanabeDebugMenuItemSubstruct _83F82CC = {0, 0x00000162, 0x00, 0x03};

const u8 Str_83F82D8[] = _("Move2");
const struct WatanabeDebugMenuItemSubstruct _83F82E0 = {0, 0x00000162, 0x00, 0x03};

const u8 Str_83F82EC[] = _("Move3");
const struct WatanabeDebugMenuItemSubstruct _83F82F4 = {0, 0x00000162, 0x00, 0x03};

const u8 Str_83F8300[] = _("Move4");
const struct WatanabeDebugMenuItemSubstruct _83F8308 = {0, 0x00000162, 0x00, 0x03};

const u8 Str_83F8314[] = _("Hold");
const struct WatanabeDebugMenuItemSubstruct _83F831C = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F8328[] = _("SP. Ability");
const struct WatanabeDebugMenuItemSubstruct _83F8334 = {0, 0x00000001, 0x00, 0xFF};

const u8 Str_83F8340[] = _("HPrnd");
const struct WatanabeDebugMenuItemSubstruct _83F8348 = {0, 0x0000001F, 0x00, 0x02};

const u8 Str_83F8354[] = _("HPexp");
const struct WatanabeDebugMenuItemSubstruct _83F835C = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F8368[] = _("ATKrnd");
const struct WatanabeDebugMenuItemSubstruct _83F8370 = {0, 0x0000001F, 0x00, 0x02};

const u8 Str_83F837C[] = _("ATKexp");
const struct WatanabeDebugMenuItemSubstruct _83F8384 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F8390[] = _("DEFrnd");
const struct WatanabeDebugMenuItemSubstruct _83F8398 = {0, 0x0000001F, 0x00, 0x02};

const u8 Str_83F83A4[] = _("DEFexp");
const struct WatanabeDebugMenuItemSubstruct _83F83AC = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F83B8[] = _("SPDrnd");
const struct WatanabeDebugMenuItemSubstruct _83F83C0 = {0, 0x0000001F, 0x00, 0x02};

const u8 Str_83F83CC[] = _("SPDexp");
const struct WatanabeDebugMenuItemSubstruct _83F83D4 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F83E0[] = _("SP. ATK$rnd");
const struct WatanabeDebugMenuItemSubstruct _83F83EC = {0, 0x0000001F, 0x00, 0x02};

const u8 Str_83F83F8[] = _("SP. ATK$exp");
const struct WatanabeDebugMenuItemSubstruct _83F8404 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F8410[] = _("SP. DEF$rnd");
const struct WatanabeDebugMenuItemSubstruct _83F841C = {0, 0x0000001F, 0x00, 0x02};

const u8 Str_83F8428[] = _("SP. DEF$exp");
const struct WatanabeDebugMenuItemSubstruct _83F8434 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F8440[] = _("Cool");
const struct WatanabeDebugMenuItemSubstruct _83F8448 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F8454[] = _("Beauty");
const struct WatanabeDebugMenuItemSubstruct _83F845C = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F8468[] = _("Cute");
const struct WatanabeDebugMenuItemSubstruct _83F8470 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F847C[] = _("Smart");
const struct WatanabeDebugMenuItemSubstruct _83F8484 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F8490[] = _("Tough");
const struct WatanabeDebugMenuItemSubstruct _83F8498 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F84A4[] = _("Sheen");
const struct WatanabeDebugMenuItemSubstruct _83F84AC = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F84B8[] = _("Tameness");
const struct WatanabeDebugMenuItemSubstruct _83F84C4 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F84D0[] = _("{PK}RUS");
const struct WatanabeDebugMenuItemSubstruct _83F84D8 = {0, 0x000000FF, 0x00, 0x03};

const u8 Str_83F84E4[] = _("EGG$");
const struct WatanabeDebugMenuItemSubstruct _83F84EC = {0, 0x00000001, 0x00, 0xFF};

const u8 Str_83F84F8[] = _("Status");
const struct WatanabeDebugMenuItemSubstruct _83F8500 = {0, 0x00000006, 0x00, 0xFF};

const u8 gUnknown_Debug_083F850A[] = _("{COLOR RED}HP　　");
const u8 gUnknown_Debug_083F8514[] = _("{COLOR RED}ATK　");
const u8 gUnknown_Debug_083F851C[] = _("{COLOR RED}DEF　");
const u8 gUnknown_Debug_083F8524[] = _("{COLOR RED}SPEED");
const u8 gUnknown_Debug_083F852D[] = _("{COLOR RED}SP。ATK");
const u8 gUnknown_Debug_083F8537[] = _("{COLOR RED}SP。DEF");
const u8 gUnknown_Debug_083F8541[] = _("なし");
const u8 gUnknown_Debug_083F8544[] = _("♂");
const u8 gUnknown_Debug_083F8546[] = _("♀");
const u8 gUnknown_Debug_083F8548[] = _("ー");
const u8 gUnknown_Debug_083F854A[] = _("ON");
const u8 gUnknown_Debug_083F854D[] = _("OFF");

const struct WatanabeDebugMenuItem gUnknown_Debug_083F8554[] = {
    {Str_83F8237, {.type4 = &_83F823C}},
    {Str_83F8248, {.type4 = &_83F8250}},
    {Str_83F825C, {.type4 = &_83F8268}},
    {Str_83F8274, {.type4 = &_83F8278}},
    {Str_83F8284, {.type4 = &_83F8290}},
    {Str_83F829C, {.type4 = &_83F82A0}},
    {Str_83F82AC, {.type4 = &_83F82B8}},
    {Str_83F82C4, {.type4 = &_83F82CC}},
    {Str_83F82D8, {.type4 = &_83F82E0}},
    {Str_83F82EC, {.type4 = &_83F82F4}},
    {Str_83F8300, {.type4 = &_83F8308}},
    {Str_83F8314, {.type4 = &_83F831C}},
    {Str_83F8328, {.type4 = &_83F8334}},
    {Str_83F8340, {.type4 = &_83F8348}},
    {Str_83F8354, {.type4 = &_83F835C}},
    {Str_83F8368, {.type4 = &_83F8370}},
    {Str_83F837C, {.type4 = &_83F8384}},
    {Str_83F8390, {.type4 = &_83F8398}},
    {Str_83F83A4, {.type4 = &_83F83AC}},
    {Str_83F83B8, {.type4 = &_83F83C0}},
    {Str_83F83CC, {.type4 = &_83F83D4}},
    {Str_83F83E0, {.type4 = &_83F83EC}},
    {Str_83F83F8, {.type4 = &_83F8404}},
    {Str_83F8410, {.type4 = &_83F841C}},
    {Str_83F8428, {.type4 = &_83F8434}},
    {Str_83F8440, {.type4 = &_83F8448}},
    {Str_83F8454, {.type4 = &_83F845C}},
    {Str_83F8468, {.type4 = &_83F8470}},
    {Str_83F847C, {.type4 = &_83F8484}},
    {Str_83F8490, {.type4 = &_83F8498}},
    {Str_83F84A4, {.type4 = &_83F84AC}},
    {Str_83F84B8, {.type4 = &_83F84C4}},
    {Str_83F84D0, {.type4 = &_83F84D8}},
    {Str_83F84E4, {.type4 = &_83F84EC}},
    {Str_83F84F8, {.type4 = &_83F8500}}
};

const u8 gUnknown_Debug_083F866C[] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0xFF
};

const u8 gUnknown_Debug_083F8674[] = {
    0x22, 0x1F, 0x20, 0xFF
};

const u8 gUnknown_Debug_083F8678[] = {
    0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0xFF
};

const u8 gUnknown_Debug_083F867F[] = {
    0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0xFE, 0xFF
};

const u8 gUnknown_Debug_083F8687[] = {
    0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0xFD, 0xFF
};

const u8 gUnknown_Debug_083F868F[] = {
    0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0xFF
};

const struct WatanabeDebugMenuItem gUnknown_Debug_083F8698[] = {
    {gUnknown_Debug_083F866C, {.type3 = 0x5}},
    {gUnknown_Debug_083F8674, {.type3 = 0x3}},
    {gUnknown_Debug_083F8678, {.type3 = 0x6}},
    {gUnknown_Debug_083F867F, {.type3 = 0x6}},
    {gUnknown_Debug_083F8687, {.type3 = 0x6}},
    {gUnknown_Debug_083F868F, {.type3 = 0x6}}
};

const u8 gUnknown_Debug_083F86C8[] = _("ーーー");
const u8 gUnknown_Debug_083F86CC[] = _("SLP");
const u8 gUnknown_Debug_083F86D0[] = _("PSN");
const u8 gUnknown_Debug_083F86D4[] = _("BRN");
const u8 gUnknown_Debug_083F86D8[] = _("FRZ");
const u8 gUnknown_Debug_083F86DC[] = _("PAR");
const u8 gUnknown_Debug_083F86E0[] = _("PSN2");

const struct WatanabeDebugMenuItem gUnknown_Debug_083F86E8[] = {
    {gUnknown_Debug_083F86C8, {.type3 = 0x0}},
    {gUnknown_Debug_083F86CC, {.type3 = 0x1}},
    {gUnknown_Debug_083F86D0, {.type3 = 0x8}},
    {gUnknown_Debug_083F86D4, {.type3 = 0x10}},
    {gUnknown_Debug_083F86D8, {.type3 = 0x20}},
    {gUnknown_Debug_083F86DC, {.type3 = 0x40}},
    {gUnknown_Debug_083F86E0, {.type3 = 0x80}}
};

const u8 gUnknown_Debug_083F8720[] = _("PKMNワLIST");
const u8 gUnknown_Debug_083F872A[] = _("PKMNワBOX");
void InitCreatePokemon(void)
{
    u8 sp04[] = _("Create　POKひMON　　　LR:Shift　　START:Add");

    debug_80C35DC();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
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
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
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

void debug_80C55E4(u8 taskId)
{
    u8 r7 = gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[gUnknown_Debug_2038A1C->unk169];
    if (gMain.newKeys & A_BUTTON)
    {
        gTasks[taskId].func = debug_80C53C0;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gUnknown_Debug_2038A1C->unk64[r7] = gUnknown_Debug_2038A1C->unk164;
        gTasks[taskId].func = debug_80C53C0;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        debug_80C6544(1);
        debug_80C643C();
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        debug_80C6544(2);
        debug_80C643C();
    }
    else if (gUnknown_Debug_083F8554[r7].data.type4->unk9 != 0xFF)
    {
        if (gMain.newKeys & DPAD_LEFT && gUnknown_Debug_2038A1C->unk16a < gUnknown_Debug_083F8554[r7].data.type4->unk9 - 1)
        {
            gUnknown_Debug_2038A1C->unk16a++;
            debug_80C643C();
        }
        else if (gMain.newKeys & DPAD_RIGHT && gUnknown_Debug_2038A1C->unk16a > 0)
        {
            gUnknown_Debug_2038A1C->unk16a--;
            debug_80C643C();
        }
    }
}

void debug_80C5708(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        gTasks[taskId].func = debug_80C53C0;
    }
}

u8 debug_80C5738(u8 * a0, u8 a1, u8 a2)
{
    u16 i;
    u8 r5;
    u8 r2;

    if (a1 == 0xfe)
    {
        debug_80C689C(a0, gUnknown_Debug_083F850A, 7);
        debug_80C6678(a0 + 7, gUnknown_Debug_2038A1C->unk64[35], 3, 1);
        a0[19] = CHAR_SPACE;
        a0[20] = CHAR_SPACE;
        debug_80C689C(a0 + 21, gUnknown_Debug_083F8514, 7);
        debug_80C6678(a0 + 28, gUnknown_Debug_2038A1C->unk64[36], 3, 1);
        a0[40] = CHAR_SPACE;
        a0[41] = CHAR_SPACE;
        debug_80C689C(a0 + 42, gUnknown_Debug_083F851C, 9);
        debug_80C6678(a0 + 49, gUnknown_Debug_2038A1C->unk64[37], 3, 1);
        return 0;
    }
    if (a1 == 0xfd)
    {
        debug_80C689C(a0, gUnknown_Debug_083F8524, 9);
        debug_80C6678(a0 + 9, gUnknown_Debug_2038A1C->unk64[38], 3, 1);
        a0[21] = CHAR_SPACE;
        a0[22] = CHAR_SPACE;
        debug_80C689C(a0 + 23, gUnknown_Debug_083F852D, 9);
        debug_80C6678(a0 + 32, gUnknown_Debug_2038A1C->unk64[39], 3, 1);
        a0[44] = CHAR_SPACE;
        a0[45] = CHAR_SPACE;
        debug_80C689C(a0 + 46, gUnknown_Debug_083F8537, 9);
        debug_80C6678(a0 + 55, gUnknown_Debug_2038A1C->unk64[40], 3, 1);
        return 0;
    }
    for (i = 0; i < 12; i++)
        a0[i] = CHAR_SPACE;
    debug_80C689C(a0, gUnknown_Debug_083F8554[a1].text, 11);
    for (i = 12; i < 256; i++)
        a0[i] = EOS;
    r2 = gUnknown_Debug_083F8554[a1].data.type4->unk9;
    r5 = r2 * 4;
    switch (a1)
    {
        default:
            a0[0] = EOS;
            break;
        case 0:
            debug_80C6678(a0 + 10, gUnknown_Debug_2038A1C->unk64[a1], r2, a2);
            a0[10 + r5] = CHAR_SPACE;
            a0[11 + r5] = EXT_CTRL_CODE_BEGIN;
            a0[12 + r5] = 0x01;
            a0[13 + r5] = a2;
            debug_80C689C(a0 + 14 + r5, gSpeciesNames[NationalPokedexNumToSpecies(gUnknown_Debug_2038A1C->unk64[a1])], 10);
            break;
        case 5:
            switch (gUnknown_Debug_2038A1C->unk64[a1])
            {
                case 0:
                    debug_80C689C(a0 + 10, gUnknown_Debug_083F8546, 2);
                    break;
                case 1:
                    debug_80C689C(a0 + 10, gUnknown_Debug_083F8541, 2);
                    break;
                case 2:
                    debug_80C689C(a0 + 10, gUnknown_Debug_083F8544, 2);
                    break;
            }
            break;
        case 7 ... 10:
            debug_80C6678(a0 + 10, gUnknown_Debug_2038A1C->unk64[a1], r2, a2);
            a0[10 + r5] = CHAR_SPACE;
            a0[11 + r5] = EXT_CTRL_CODE_BEGIN;
            a0[12 + r5] = 0x01;
            a0[13 + r5] = a2;
            debug_80C689C(a0 + 14 + r5, gMoveNames[gUnknown_Debug_2038A1C->unk64[a1]], 12);
            break;
        case 11:
            debug_80C6678(a0 + 10, gUnknown_Debug_2038A1C->unk64[a1], r2, a2);
            a0[10 + r5] = CHAR_SPACE;
            a0[11 + r5] = EXT_CTRL_CODE_BEGIN;
            a0[12 + r5] = 0x01;
            a0[13 + r5] = a2;
            if (gUnknown_Debug_2038A1C->unk64[a1] != ITEM_NONE)
                debug_80C689C(a0 + 14 + r5, ItemId_GetName(gUnknown_Debug_2038A1C->unk64[a1]), 9);
            else
                debug_80C689C(a0 + 14 + r5, gUnknown_Debug_083F8541, 9);
            break;
        case 12:
            a0 += 12;
            debug_80C689C(a0, gAbilityNames[GetAbilityBySpecies(NationalPokedexNumToSpecies(gUnknown_Debug_2038A1C->unk64[0]), gUnknown_Debug_2038A1C->unk64[a1])], 12);
            break;
        case 34:
            debug_80C689C(a0 + 10, gUnknown_Debug_083F86E8[gUnknown_Debug_2038A1C->unk64[a1]].text, 4);
            break;
        case 1 ... 4:
        case 13 ... 32:
            debug_80C6678(a0 + 12, gUnknown_Debug_2038A1C->unk64[a1], r2, a2);
            break;
        case 33:
            if (gUnknown_Debug_2038A1C->unk64[a1])
                debug_80C689C(a0 + 10, gUnknown_Debug_083F854A, 4);
            else
                debug_80C689C(a0 + 10, gUnknown_Debug_083F854D, 4);
            break;
        case 6:
            debug_80C689C(a0 + 10, gNatureNames[gUnknown_Debug_2038A1C->unk64[a1]], 5);
            break;
    }
    return 0;
}

u32 debug_80C5B60(u8 a0)
{
    return gUnknown_Debug_2038A1C->unk64[a0];
}

void debug_80C5B74(u32 a0, u8 a1)
{
    switch (a1)
    {
        default:
            gUnknown_Debug_2038A1C->unk64[a1] = a0;
            break;
        case 0:
        case 3:
        case 4:
            gUnknown_Debug_2038A1C->unk64[a1] = a0;
            debug_80C5C94();
            break;
        case 1:
            gUnknown_Debug_2038A1C->unk64[a1] = a0;
            gUnknown_Debug_2038A1C->unk64[2] = gExperienceTables[gBaseStats[NationalPokedexNumToSpecies(gUnknown_Debug_2038A1C->unk64[0])].growthRate][a0];
            debug_80C5C94();
            break;
        case 2:
            gUnknown_Debug_2038A1C->unk64[a1] = a0;
            debug_80C5DEC();
            break;
        case 13 ... 24:
            gUnknown_Debug_2038A1C->unk64[a1] = a0;
            debug_80C5EF4();
            break;
    }
}

void debug_80C5C94(void)
{
    u32 ivs = gUnknown_Debug_2038A1C->unk64[13] & 0x1f;
    ivs |= (gUnknown_Debug_2038A1C->unk64[15] & 0x1f) << 5;
    ivs |= (gUnknown_Debug_2038A1C->unk64[17] & 0x1f) << 10;
    ivs |= (gUnknown_Debug_2038A1C->unk64[19] & 0x1f) << 15;
    ivs |= (gUnknown_Debug_2038A1C->unk64[21] & 0x1f) << 20;
    ivs |= (gUnknown_Debug_2038A1C->unk64[23] & 0x1f) << 25;
    CreateMon(&gUnknown_Debug_2038A1C->pokemon, NationalPokedexNumToSpecies(gUnknown_Debug_2038A1C->unk64[0]), gUnknown_Debug_2038A1C->unk64[1], ivs, TRUE, gUnknown_Debug_2038A1C->unk64[4], TRUE, gUnknown_Debug_2038A1C->unk64[3]);
    gUnknown_Debug_2038A1C->unk64[5] = (u8)(GetMonGender(&gUnknown_Debug_2038A1C->pokemon) + 2);
    gUnknown_Debug_2038A1C->unk64[6] = GetNature(&gUnknown_Debug_2038A1C->pokemon);
    gUnknown_Debug_2038A1C->unk64[7] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE1);
    gUnknown_Debug_2038A1C->unk64[8] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE2);
    gUnknown_Debug_2038A1C->unk64[9] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE3);
    gUnknown_Debug_2038A1C->unk64[10] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE4);
    gUnknown_Debug_2038A1C->unk64[2] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_EXP);
    gUnknown_Debug_2038A1C->unk64[35] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MAX_HP);
    gUnknown_Debug_2038A1C->unk64[36] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_ATK);
    gUnknown_Debug_2038A1C->unk64[37] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_DEF);
    gUnknown_Debug_2038A1C->unk64[38] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPEED);
    gUnknown_Debug_2038A1C->unk64[39] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPATK);
    gUnknown_Debug_2038A1C->unk64[40] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPDEF);
}

void debug_80C5DEC(void)
{
    u32 zero = 0;
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_EXP, gUnknown_Debug_2038A1C->unk64 + 2);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE1, &zero);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE2, &zero);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE3, &zero);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE4, &zero);
    CalculateMonStats(&gUnknown_Debug_2038A1C->pokemon);
    GiveMonInitialMoveset(&gUnknown_Debug_2038A1C->pokemon);
    gUnknown_Debug_2038A1C->unk64[1] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_LEVEL);
    gUnknown_Debug_2038A1C->unk64[7] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE1);
    gUnknown_Debug_2038A1C->unk64[8] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE2);
    gUnknown_Debug_2038A1C->unk64[9] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE3);
    gUnknown_Debug_2038A1C->unk64[10] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MOVE4);
    gUnknown_Debug_2038A1C->unk64[35] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MAX_HP);
    gUnknown_Debug_2038A1C->unk64[36] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_ATK);
    gUnknown_Debug_2038A1C->unk64[37] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_DEF);
    gUnknown_Debug_2038A1C->unk64[38] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPEED);
    gUnknown_Debug_2038A1C->unk64[39] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPATK);
    gUnknown_Debug_2038A1C->unk64[40] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPDEF);
}

void debug_80C5EF4(void)
{
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_HP_IV, gUnknown_Debug_2038A1C->unk64 + 13);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_HP_EV, gUnknown_Debug_2038A1C->unk64 + 14);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_ATK_IV, gUnknown_Debug_2038A1C->unk64 + 15);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_ATK_EV, gUnknown_Debug_2038A1C->unk64 + 16);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_DEF_IV, gUnknown_Debug_2038A1C->unk64 + 17);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_DEF_EV, gUnknown_Debug_2038A1C->unk64 + 18);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPEED_IV, gUnknown_Debug_2038A1C->unk64 + 19);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPEED_EV, gUnknown_Debug_2038A1C->unk64 + 20);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPATK_IV, gUnknown_Debug_2038A1C->unk64 + 21);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPATK_EV, gUnknown_Debug_2038A1C->unk64 + 22);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPDEF_IV, gUnknown_Debug_2038A1C->unk64 + 23);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPDEF_EV, gUnknown_Debug_2038A1C->unk64 + 24);
    CalculateMonStats(&gUnknown_Debug_2038A1C->pokemon);
    gUnknown_Debug_2038A1C->unk64[35] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MAX_HP);
    gUnknown_Debug_2038A1C->unk64[36] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_ATK);
    gUnknown_Debug_2038A1C->unk64[37] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_DEF);
    gUnknown_Debug_2038A1C->unk64[38] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPEED);
    gUnknown_Debug_2038A1C->unk64[39] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPATK);
    gUnknown_Debug_2038A1C->unk64[40] = GetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPDEF);
}

void debug_80C5FFC(void)
{
    u32 ivs;
    u8 sp10[] = _("たまご");
    u8 sp14[] = _("DebugーG");
    u8 one;
    u16 ff;

    ivs = gUnknown_Debug_2038A1C->unk64[13] & 0x1f;
    ivs |= (gUnknown_Debug_2038A1C->unk64[15] & 0x1f) << 5;
    ivs |= (gUnknown_Debug_2038A1C->unk64[17] & 0x1f) << 10;
    ivs |= (gUnknown_Debug_2038A1C->unk64[19] & 0x1f) << 15;
    ivs |= (gUnknown_Debug_2038A1C->unk64[21] & 0x1f) << 20;
    ivs |= (gUnknown_Debug_2038A1C->unk64[23] & 0x1f) << 25;

    CreateMon(&gUnknown_Debug_2038A1C->pokemon, NationalPokedexNumToSpecies(gUnknown_Debug_2038A1C->unk64[0]), gUnknown_Debug_2038A1C->unk64[1], ivs, TRUE, gUnknown_Debug_2038A1C->unk64[4], TRUE, gUnknown_Debug_2038A1C->unk64[3]);

    if (gUnknown_Debug_2038A1C->unk64[7] != MOVE_NONE)
        SetMonMoveSlot(&gUnknown_Debug_2038A1C->pokemon, gUnknown_Debug_2038A1C->unk64[7], 0);
    if (gUnknown_Debug_2038A1C->unk64[8] != MOVE_NONE)
        SetMonMoveSlot(&gUnknown_Debug_2038A1C->pokemon, gUnknown_Debug_2038A1C->unk64[8], 1);
    if (gUnknown_Debug_2038A1C->unk64[9] != MOVE_NONE)
        SetMonMoveSlot(&gUnknown_Debug_2038A1C->pokemon, gUnknown_Debug_2038A1C->unk64[9], 2);
    if (gUnknown_Debug_2038A1C->unk64[10] != MOVE_NONE)
        SetMonMoveSlot(&gUnknown_Debug_2038A1C->pokemon, gUnknown_Debug_2038A1C->unk64[10], 3);

    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_EXP, gUnknown_Debug_2038A1C->unk64 + 2);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_HP_IV, gUnknown_Debug_2038A1C->unk64 + 13);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_HP_EV, gUnknown_Debug_2038A1C->unk64 + 14);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_ATK_IV, gUnknown_Debug_2038A1C->unk64 + 15);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_ATK_EV, gUnknown_Debug_2038A1C->unk64 + 16);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_DEF_IV, gUnknown_Debug_2038A1C->unk64 + 17);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_DEF_EV, gUnknown_Debug_2038A1C->unk64 + 18);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPEED_IV, gUnknown_Debug_2038A1C->unk64 + 19);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPEED_EV, gUnknown_Debug_2038A1C->unk64 + 20);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPATK_IV, gUnknown_Debug_2038A1C->unk64 + 21);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPATK_EV, gUnknown_Debug_2038A1C->unk64 + 22);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPDEF_IV, gUnknown_Debug_2038A1C->unk64 + 23);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SPDEF_EV, gUnknown_Debug_2038A1C->unk64 + 24);

    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_COOL, gUnknown_Debug_2038A1C->unk64 + 25);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_BEAUTY, gUnknown_Debug_2038A1C->unk64 + 26);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_CUTE, gUnknown_Debug_2038A1C->unk64 + 27);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SMART, gUnknown_Debug_2038A1C->unk64 + 28);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_TOUGH, gUnknown_Debug_2038A1C->unk64 + 29);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_SHEEN, gUnknown_Debug_2038A1C->unk64 + 30);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_FRIENDSHIP, gUnknown_Debug_2038A1C->unk64 + 31);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_POKERUS, gUnknown_Debug_2038A1C->unk64 + 32);

    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_HELD_ITEM, gUnknown_Debug_2038A1C->unk64 + 11);
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_ALT_ABILITY, gUnknown_Debug_2038A1C->unk64 + 12);

    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_STATUS, &gUnknown_Debug_083F86E8[gUnknown_Debug_2038A1C->unk64[34]].data.type3);

    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_IS_EGG, gUnknown_Debug_2038A1C->unk64 + 33);
    if (gUnknown_Debug_2038A1C->unk64[33])
    {
        SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_NICKNAME, sp10);
        one = LANGUAGE_JAPANESE;
        SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_LANGUAGE, &one);
    }

    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_OT_NAME, sp14);
    ff = 0xff;
    SetMonData(&gUnknown_Debug_2038A1C->pokemon, MON_DATA_MET_LOCATION, &ff);
    CalculateMonStats(&gUnknown_Debug_2038A1C->pokemon);
}

void debug_80C627C(u8 a0)
{
    u8 sp00[] = _("▶");
    u8 sp04[] = _(" ");

    switch (a0)
    {
        case 0:
            Menu_PrintText(sp00, 1, 2 * gUnknown_Debug_2038A1C->unk169 + 5);
            break;
        case 1:
            if (gUnknown_Debug_2038A1C->unk169 < gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].data.type3 - 1)
            {
                Menu_PrintText(sp04, 1, 2 * gUnknown_Debug_2038A1C->unk169 + 5);
                gUnknown_Debug_2038A1C->unk169++;
                Menu_PrintText(sp00, 1, 2 * gUnknown_Debug_2038A1C->unk169 + 5);
            }
            break;
        case 2:
            if (gUnknown_Debug_2038A1C->unk169 > 0)
            {
                Menu_PrintText(sp04, 1, 2 * gUnknown_Debug_2038A1C->unk169 + 5);
                gUnknown_Debug_2038A1C->unk169--;
                Menu_PrintText(sp00, 1, 2 * gUnknown_Debug_2038A1C->unk169 + 5);
            }
            break;
    }
}

void debug_80C6384(void)
{
    u16 i;

    Menu_DrawStdWindowFrame(0, 4, 29, 19);
    for (i = 0; gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[i] != EOS; i++)
    {
        gUnknown_Debug_2038A1C->unk16b[0] = EXT_CTRL_CODE_BEGIN;
        gUnknown_Debug_2038A1C->unk16b[1] = 0x01;
        gUnknown_Debug_2038A1C->unk16b[2] = 0x01;
        debug_80C5738(gUnknown_Debug_2038A1C->unk16b + 3, gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[i], 1);
        Menu_PrintText(gUnknown_Debug_2038A1C->unk16b, 2, 2 * i + 5);
    }
}

void debug_80C643C(void)
{
    u16 i;

    Menu_BlankWindowRect(2, 5, 28, 18);
    for (i = 0; gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[i] != EOS; i++)
    {
        gUnknown_Debug_2038A1C->unk16b[0] = EXT_CTRL_CODE_BEGIN;
        gUnknown_Debug_2038A1C->unk16b[1] = 0x01;
        if (i == gUnknown_Debug_2038A1C->unk169)
        {
            gUnknown_Debug_2038A1C->unk16b[2] = 0x02;
            debug_80C5738(gUnknown_Debug_2038A1C->unk16b + 3, gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[i], 2);
        }
        else
        {
            gUnknown_Debug_2038A1C->unk16b[2] = 0x01;
            debug_80C5738(gUnknown_Debug_2038A1C->unk16b + 3, gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[i], 1);
        }
        Menu_PrintText(gUnknown_Debug_2038A1C->unk16b, 2, 2 * i + 5);
    }
}

const u32 gUnknown_Debug_083F8768[] = {
    1,
    10,
    100,
    1000,
    10000,
    100000,
    1000000,
    10000000,
    100000000,
    1000000000
};

void debug_80C6544(u8 a0)
{
    u32 r7 = debug_80C5B60(gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[gUnknown_Debug_2038A1C->unk169]);
    u32 r5 = gUnknown_Debug_083F8554[gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[gUnknown_Debug_2038A1C->unk169]].data.type4->unk0;
    u32 r4 = gUnknown_Debug_083F8554[gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[gUnknown_Debug_2038A1C->unk169]].data.type4->unk4;
    u32 r3 = gUnknown_Debug_083F8768[gUnknown_Debug_2038A1C->unk16a];

    if (gUnknown_Debug_083F8554[gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[gUnknown_Debug_2038A1C->unk169]].data.type4->unk8 == 0)
    {
        switch (a0)
        {
            case 1:
                if (r7 < r4 - r3)
                    r7 += r3;
                else if (r7 < r4)
                    r7 = r4;
                else
                    r7 = r5;
                break;
            case 2:
                if (r7 > r5 + r3)
                    r7 -= r3;
                else if (r7 > r5)
                    r7 = r5;
                else
                    r7 = r4;
                break;
        }
    }
    debug_80C5B74(r7, gUnknown_Debug_083F8698[gUnknown_Debug_2038A1C->unk168].text[gUnknown_Debug_2038A1C->unk169]);
}

void debug_80C6630(u8 * a0, u8 a1, u8 a2, u8 a3)
{
    *a0++ = EXT_CTRL_CODE_BEGIN;
    *a0++ = 0x01;
    if (a2 == 2)
    {
        if (a3 != gUnknown_Debug_2038A1C->unk16a)
            *a0 = 0x02;
        else
            *a0 = 0x04;
    }
    else
        *a0 = 0x01;
    a0[1] = a1 + CHAR_0;
}

void debug_80C6678(u8 * a0, u32 a1, u8 a2, u8 a3)
{
    u8 r7 = 0;

    switch (a2)
    {
        default:
        case 10:
            debug_80C6630(a0 + r7, a1 / 1000000000, a3, 9);
            a1 %= 1000000000;
            r7 += 4;
        case  9:
            debug_80C6630(a0 + r7, a1 / 100000000, a3, 8);
            a1 %= 100000000;
            r7 += 4;
        case  8:
            debug_80C6630(a0 + r7, a1 / 10000000, a3, 7);
            a1 %= 10000000;
            r7 += 4;
        case  7:
            debug_80C6630(a0 + r7, a1 / 1000000, a3, 6);
            a1 %= 1000000;
            r7 += 4;
        case  6:
            debug_80C6630(a0 + r7, a1 / 100000, a3, 5);
            a1 %= 100000;
            r7 += 4;
        case  5:
            debug_80C6630(a0 + r7, a1 / 10000, a3, 4);
            a1 %= 10000;
            r7 += 4;
        case  4:
            debug_80C6630(a0 + r7, a1 / 1000, a3, 3);
            a1 %= 1000;
            r7 += 4;
        case  3:
            debug_80C6630(a0 + r7, a1 / 100, a3, 2);
            a1 %= 100;
            r7 += 4;
        case  2:
            debug_80C6630(a0 + r7, a1 / 10, a3, 1);
            a1 %= 10;
            r7 += 4;
        case  1:
            debug_80C6630(a0 + r7, a1, a3, 0);
            break;
    }
}

void debug_80C689C(u8 * a0, const u8 * a1, u8 a2)
{
    u8 i;

    for (i = 0; a1[i] != EOS && i < a2; i++)
        a0[i] = a1[i];
}

void debug_80C68CC(u16 a0, u8 a1, u8 a2, u8 a3)
{
    u8 sp00[5];
    u8 i;

    for (i = 0; i < 4; i++)
        sp00[i] = 0;
    sp00[4] = EOS;

    switch (a3)
    {
        default:
            sp00[0] = a0 >> 12;
        case 3:
            sp00[1] = (a0 & 0x0F00) >> 8;
        case 2:
            sp00[2] = (a0 & 0x00F0) >> 4;
        case 1:
            sp00[3] = (a0 & 0x000F);
            break;
    }

    for (i = 0; i < 4; i++)
    {
        if (sp00[i] < 10)
            sp00[i] += CHAR_0;
        else
            sp00[i] += CHAR_A - 10;
    }

    Menu_PrintText(sp00 + (u8)(4 - a3), a1, a2);
}

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

u16 word_83F888C[] = INCBIN_U16("graphics/debug/sprite_browser.gbapal");
u8 byte_83F88EC[] = INCBIN_U8("graphics/debug/sprite_browser.4bpp");

void InitSeePokemonGraphics(void)
{
    u16 pal;
    u8 spriteId;
    debug_80C35DC();
    DmaCopy16Defvars(3, byte_83F88EC, BG_SCREEN_ADDR(28), sizeof(byte_83F88EC));
    LoadPalette(word_83F888C, 0x80, sizeof(word_83F888C));
    pal = RGB(31, 31, 31);
    LoadPalette(&pal, 0, sizeof(pal));
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_WININ = 0x3F;
    REG_WINOUT = 0x1F;
    REG_BLDCNT = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_OBJ | BLDCNT_TGT1_BD | BLDCNT_EFFECT_DARKEN;
    REG_BLDALPHA = 0;
    REG_BLDY = 0x07;
    {
        u16 imeBak = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = imeBak;
    }
    SetVBlankCallback(debug_80C3758);
    SetMainCallback2(debug_80C370C);
    sub_809D51C();
    REG_BG0CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(31);
    REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(30);
    REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON;
    CreateTask(debug_80C6B00, 0);
    gUnknown_Debug_2038A20 = &eWatanabe18000_2;
    gUnknown_Debug_2038A20->unk0 = 0x115;
    gUnknown_Debug_2038A20->unk2 = 0;
    gUnknown_Debug_2038A20->unk3 = 0;
    gUnknown_Debug_2038A20->unk5 = 0;
    gUnknown_Debug_2038A20->unk7 = 0;
    gUnknown_Debug_2038A20->unkA = 0;
    gUnknown_Debug_2038A20->unk8 = 0;
    spriteId = CreateSprite(&gSpriteTemplate_83F8874, 0x6C, 0x74, 0);
    gSprites[spriteId].data[0] = 0;
    StartSpriteAnim(gSprites + spriteId, 0);
    spriteId = CreateSprite(&gSpriteTemplate_83F8874, 0x6C, 0x74, 0);
    gSprites[spriteId].data[0] = 1;
    StartSpriteAnim(gSprites + spriteId, 1);
    spriteId = CreateSprite(&gSpriteTemplate_83F8874, 0x6C, 0x74, 0);
    gSprites[spriteId].data[0] = 2;
    StartSpriteAnim(gSprites + spriteId, 2);
}

const u16 gUnknown_Debug_083F8790[] = {
    0x0000,
    0x0002,
    0x0004,
    0x0006,
    0x0008,
    0x000a,
    0x000c,
    0x000e,
    0x0010,
    0x0012,
    0x0014,
    0x0016,
    0x0018,
    0x001a,
    0x001c,
    0x001e,
    0x001f,
    0x001e,
    0x001c,
    0x001a,
    0x0018,
    0x0016,
    0x0014,
    0x0012,
    0x0010,
    0x000e,
    0x000c,
    0x000a,
    0x0008,
    0x0006,
    0x0004,
    0x0002
};

const u8 gUnknown_Debug_083F87D0[] = _("{COLOR RED}L{ESCAPE}ロ");
const u8 gUnknown_Debug_083F87D8[] = _("{COLOR RED}{ESCAPE}ワR");
const u8 gUnknown_Debug_083F87E0[] = _("かいはつナンバー");
const u8 gUnknown_Debug_083F87E9[] = _("グラフィックナンバー");
const u8 gUnknown_Debug_083F87F4[] = _("{COLOR RED}A:カラーせってい");
const u8 gUnknown_Debug_083F8801[] = _("{COLOR RED}A:けってい　B:キャンセル");
const u8 gUnknown_Debug_083F8813[] = _(":");
void debug_80C6B00(u8 taskId)
{
    u8 sp00[] = {0x00, 0x10, 0x20, 0x20, 0x20, 0x21, 0x20, 0x20, 0x20, 0x21, 0x20, 0x20, 0x20, 0x21, 0x20, 0x20, 0x20, 0x21};
    u8 i;

    Menu_DrawStdWindowFrame(10, 0, 15, 7);
    Menu_DrawStdWindowFrame(0, 0, 9, 9);
    Menu_DrawStdWindowFrame(0, 10, 9, 19);
    Menu_DrawStdWindowFrame(16, 0, 29, 7);
    Menu_PrintText(gUnknown_Debug_083F87D0, 17, 1);
    Menu_PrintText(gUnknown_Debug_083F87D8, 27, 1);
    Menu_PrintText(gUnknown_Debug_083F87E0, 17, 5);

    Menu_DrawStdWindowFrame(10, 8, 29, 12);
    for (i = 0; i < 15; i++)
        ((u16 *)(VRAM + 0xFA56))[i] = 0xA311 + i;
    for (i = 0; i < 15; i++)
        ((u16 *)(VRAM + 0xF256))[i] = 0x8301 + i;

    Menu_PrintText(gUnknown_Debug_083F87F4, 20, 10);
    Menu_DrawStdWindowFrame(10, 13, 29, 19);

    sp00[0] = 0x23;
    for (i = 0; i < 18; i++)
        ((u16 *)(VRAM + 0xF396))[i] = 0x9300 + sp00[i];
    sp00[0] = 0x24;
    for (i = 0; i < 18; i++)
        ((u16 *)(VRAM + 0xF3D6))[i] = 0x9300 + sp00[i];
    sp00[0] = 0x25;
    for (i = 0; i < 18; i++)
        ((u16 *)(VRAM + 0xF416))[i] = 0x9300 + sp00[i];

    Menu_PrintText(gUnknown_Debug_083F8801, 15, 17);

    REG_WIN0H = 0x51EF;
    REG_WIN0V = 0x699F;

    gTasks[taskId].func = debug_80C6CB8;
}

void debug_80C6CB8(u8 taskId)
{
    DecompressPicFromTable_2(gMonFrontPicTable + gUnknown_Debug_2038A20->unk0, gMonFrontPicCoords[gUnknown_Debug_2038A20->unk0].coords, gMonFrontPicCoords[gUnknown_Debug_2038A20->unk0].y_offset, gUnknown_081FAF4C[0], gUnknown_081FAF4C[1], gUnknown_Debug_2038A20->unk0);
    LoadCompressedObjectPalette(gMonPaletteTable + gUnknown_Debug_2038A20->unk0);
    GetMonSpriteTemplate_803C56C(gUnknown_Debug_2038A20->unk0, 1);
    gUnknown_Debug_2038A20->unk2 = CreateSprite(&gUnknown_02024E8C, 0x28, 0x28, 0);
    gSprites[gUnknown_Debug_2038A20->unk2].callback = debug_69;
    gSprites[gUnknown_Debug_2038A20->unk2].oam.priority = 0;

    DecompressPicFromTable_2(gMonBackPicTable + gUnknown_Debug_2038A20->unk0, gMonBackPicCoords[gUnknown_Debug_2038A20->unk0].coords, gMonBackPicCoords[gUnknown_Debug_2038A20->unk0].y_offset, gUnknown_081FAF4C[0], gUnknown_081FAF4C[2], gUnknown_Debug_2038A20->unk0);
    LoadCompressedObjectPalette(gMonPaletteTable + gUnknown_Debug_2038A20->unk0);
    GetMonSpriteTemplate_803C56C(gUnknown_Debug_2038A20->unk0, 2);
    gUnknown_Debug_2038A20->unk3 = CreateSprite(&gUnknown_02024E8C, 0x28, 0x78, 0);
    gSprites[gUnknown_Debug_2038A20->unk3].callback = debug_69;
    gSprites[gUnknown_Debug_2038A20->unk3].oam.priority = 0;

    gUnknown_Debug_2038A20->unk4 = CreateMonIcon(gUnknown_Debug_2038A20->unk0, sub_809D62C, 0x68, 0x2C, 0, 0);

    sub_8091738(SpeciesToNationalPokedexNum(gUnknown_Debug_2038A20->unk0), 2, 0x3fc);

    ((u16 *)(VRAM + 0xF858))[0] = 0xF3FC;
    ((u16 *)(VRAM + 0xF858))[1] = 0xF3FD;
    ((u16 *)(VRAM + 0xF858))[32] = 0xF3FE;
    ((u16 *)(VRAM + 0xF858))[33] = 0xF3FF;

    debug_80C3800(gUnknown_Debug_2038A20->unk0, 17, 3);
    debug_80C376C(gUnknown_Debug_2038A20->unk0, 26, 5);

    gUnknown_Debug_2038A20->unk6 = gSprites[gUnknown_Debug_2038A20->unk2].oam.paletteNum;
    CpuCopy16(gPlttBufferUnfaded + gUnknown_Debug_2038A20->unk6 * 16 + 0x100, gPlttBufferUnfaded + 0x80, 0x20);
    CpuCopy16(gPlttBufferUnfaded + gUnknown_Debug_2038A20->unk6 * 16 + 0x100, gPlttBufferFaded + 0x80, 0x20);

    gTasks[taskId].func = debug_80C6EE8;

    gUnknown_Debug_2038A20->unk9 = 0;
    StopCryAndClearCrySongs();
    PlayCry1(gUnknown_Debug_2038A20->unk0, 0);
}

void debug_80C6EE8(u8 taskId)
{
    u16 hue;
    CpuCopy16(gPlttBufferUnfaded + 0x80, gUnknown_Debug_2038A20->unk10, 32);
    hue = gPlttBufferUnfaded[gUnknown_Debug_2038A20->unk7 + 0x81];
    gUnknown_Debug_2038A20->unkC.r = hue & 0x1f;
    gUnknown_Debug_2038A20->unkC.g = (hue & 0x3e0) >> 5;
    gUnknown_Debug_2038A20->unkC.b = (hue & 0x7c00) >> 10;
    gUnknown_Debug_2038A20->unkC.unused_15 = 0;
    debug_80C68CC(gUnknown_Debug_2038A20->unk7 + 1, 11, 10, 2);
    Menu_PrintText(gUnknown_Debug_083F8813, 13, 10);
    debug_80C68CC(hue, 14, 10, 4);
    gTasks[taskId].func = debug_80C6FA8;
}

#ifdef NONMATCHING
void debug_80C6FA8(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        SetMainCallback2(debug_80C370C);
        gTasks[taskId].func = debug_80C373C;
    }
    else if (gMain.newAndRepeatedKeys & R_BUTTON)
    {
        gUnknown_Debug_2038A20->unk0 = debug_80C3878(0, gUnknown_Debug_2038A20->unk0);
        gTasks[taskId].func = debug_80C71FC;
    }
    else if (gMain.newAndRepeatedKeys & L_BUTTON)
    {
        gUnknown_Debug_2038A20->unk0 = debug_80C3878(1, gUnknown_Debug_2038A20->unk0);
        gTasks[taskId].func = debug_80C71FC;
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        gUnknown_Debug_2038A20->unk5 = 1;
        REG_WIN0H = 0x51EF;
        REG_WIN0V = 0x4167;
        gTasks[taskId].func = debug_80C7294;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT && gUnknown_Debug_2038A20->unk7 < 14)
    {
        ((u16 *)PLTT)[0x81 + gUnknown_Debug_2038A20->unk7] = 0;
        do; while(0);
        gUnknown_Debug_2038A20->unk7++;
        gTasks[taskId].func = debug_80C6EE8;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT && gUnknown_Debug_2038A20->unk7 > 0)
    {
        ((u16 *)PLTT)[0x81 + gUnknown_Debug_2038A20->unk7] = 0;
        do; while(0);
        gUnknown_Debug_2038A20->unk7--;
        gTasks[taskId].func = debug_80C6EE8;
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        gUnknown_Debug_2038A20->unk9 ^= 1;
        if (gUnknown_Debug_2038A20->unk9)
            LoadCompressedPalette(GetMonSpritePalFromOtIdPersonality(gUnknown_Debug_2038A20->unk0, 0, 0), gUnknown_Debug_2038A20->unk6 * 16 + 0x100, 0x20);
        else
            LoadCompressedPalette(GetMonSpritePalFromOtIdPersonality(gUnknown_Debug_2038A20->unk0, 0, 9), gUnknown_Debug_2038A20->unk6 * 16 + 0x100, 0x20);
        CpuCopy16(gPlttBufferUnfaded + gUnknown_Debug_2038A20->unk6 * 16 + 0x100, gPlttBufferUnfaded + 0x80, 32);
        CpuCopy16(gPlttBufferUnfaded + gUnknown_Debug_2038A20->unk6 * 16 + 0x100, gPlttBufferFaded + 0x80, 32);
        gTasks[taskId].func = debug_80C6EE8;
    }
    else
    {
        if (gMain.newKeys & SELECT_BUTTON)
        {
            StopCryAndClearCrySongs();
            PlayCry1(gUnknown_Debug_2038A20->unk0, 0);
        }
        gUnknown_Debug_2038A20->unk8 += 4;
        gUnknown_Debug_2038A20->unk8 &= 0x1f;
        ((u16 *)PLTT)[0xa1 + gUnknown_Debug_2038A20->unk7] = gUnknown_Debug_083F8790[gUnknown_Debug_2038A20->unk8];
    }
}
#else
NAKED void debug_80C6FA8(u8 taskId)
{
    asm(".equiv PLTT, 0x05000000\n"
        "\tpush\t{r4, r5, r6, lr}\n"
        "\tadd\tsp, sp, #0xfffffffc\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr6, r0, #0x18\n"
        "\tldr\tr1, ._674       @ gMain\n"
        "\tldrh\tr2, [r1, #0x2e]\n"
        "\tmov\tr0, #0x2\n"
        "\tand\tr0, r0, r2\n"
        "\tadd\tr4, r1, #0\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._672\t@cond_branch\n"
        "\tmov\tr0, #0x5\n"
        "\tbl\tPlaySE\n"
        "\tmov\tr0, #0x1\n"
        "\tneg\tr0, r0\n"
        "\tmov\tr1, #0x0\n"
        "\tstr\tr1, [sp]\n"
        "\tmov\tr2, #0x0\n"
        "\tmov\tr3, #0x10\n"
        "\tbl\tBeginNormalPaletteFade\n"
        "\tldr\tr0, ._674 + 4   @ debug_80C370C\n"
        "\tbl\tSetMainCallback2\n"
        "\tldr\tr1, ._674 + 8   @ gTasks\n"
        "\tlsl\tr0, r6, #0x2\n"
        "\tadd\tr0, r0, r6\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr0, r0, r1\n"
        "\tldr\tr1, ._674 + 12  @ debug_80C373C\n"
        "\tstr\tr1, [r0]\n"
        "\tb\t._703\n"
        "._675:\n"
        "\t.align\t2, 0\n"
        "._674:\n"
        "\t.word\tgMain\n"
        "\t.word\tdebug_80C370C+1\n"
        "\t.word\tgTasks\n"
        "\t.word\tdebug_80C373C+1\n"
        "._672:\n"
        "\tldrh\tr1, [r4, #0x30]\n"
        "\tmov\tr0, #0x80\n"
        "\tlsl\tr0, r0, #0x1\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._676\t@cond_branch\n"
        "\tldr\tr4, ._678       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr0, [r4]\n"
        "\tldrh\tr1, [r0]\n"
        "\tmov\tr0, #0x0\n"
        "\tb\t._677\n"
        "._679:\n"
        "\t.align\t2, 0\n"
        "._678:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "._676:\n"
        "\tmov\tr0, #0x80\n"
        "\tlsl\tr0, r0, #0x2\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._680\t@cond_branch\n"
        "\tldr\tr4, ._682       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr0, [r4]\n"
        "\tldrh\tr1, [r0]\n"
        "\tmov\tr0, #0x1\n"
        "._677:\n"
        "\tbl\tdebug_80C3878\n"
        "\tldr\tr1, [r4]\n"
        "\tstrh\tr0, [r1]\n"
        "\tldr\tr1, ._682 + 4   @ gTasks\n"
        "\tlsl\tr0, r6, #0x2\n"
        "\tadd\tr0, r0, r6\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr0, r0, r1\n"
        "\tldr\tr1, ._682 + 8   @ debug_80C71FC\n"
        "\tstr\tr1, [r0]\n"
        "\tb\t._703\n"
        "._683:\n"
        "\t.align\t2, 0\n"
        "._682:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\tgTasks\n"
        "\t.word\tdebug_80C71FC+1\n"
        "._680:\n"
        "\tmov\tr3, #0x1\n"
        "\tand\tr3, r3, r2\n"
        "\tcmp\tr3, #0\n"
        "\tbeq\t._684\t@cond_branch\n"
        "\tldr\tr0, ._686       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr1, [r0]\n"
        "\tmov\tr0, #0x1\n"
        "\tstrb\tr0, [r1, #0x5]\n"
        "\tldr\tr1, ._686 + 4   @ 0x4000040\n"
        "\tldr\tr2, ._686 + 8   @ 0x51ef\n"
        "\tadd\tr0, r2, #0\n"
        "\tstrh\tr0, [r1]\n"
        "\tadd\tr1, r1, #0x4\n"
        "\tldr\tr2, ._686 + 12  @ 0x4167\n"
        "\tadd\tr0, r2, #0\n"
        "\tstrh\tr0, [r1]\n"
        "\tldr\tr1, ._686 + 16  @ gTasks\n"
        "\tlsl\tr0, r6, #0x2\n"
        "\tadd\tr0, r0, r6\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr0, r0, r1\n"
        "\tldr\tr1, ._686 + 20  @ debug_80C7294\n"
        "\tstr\tr1, [r0]\n"
        "\tb\t._703\n"
        "._687:\n"
        "\t.align\t2, 0\n"
        "._686:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\t0x4000040\n"
        "\t.word\t0x51ef\n"
        "\t.word\t0x4167\n"
        "\t.word\tgTasks\n"
        "\t.word\tdebug_80C7294+1\n"
        "._684:\n"
        "\tmov\tr0, #0x10\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._689\t@cond_branch\n"
        "\tldr\tr1, ._691       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr2, [r1]\n"
        "\tldrb\tr0, [r2, #0x7]\n"
        "\tcmp\tr0, #0xd\n"
        "\tbhi\t._689\t@cond_branch\n"
        "\tlsl\tr0, r0, #0x1\n"
        "\tldr\tr2, ._691 + 4   @ PLTT + 0x102\n"
        "\tadd\tr0, r0, r2\n"
        "\tstrh\tr3, [r0]\n"
        "\tldr\tr1, [r1]\n"
        "\tldrb\tr0, [r1, #0x7]\n"
        "\tadd\tr0, r0, #0x1\n"
        "\tstrb\tr0, [r1, #0x7]\n"
        "\tb\t._695\n"
        "._692:\n"
        "\t.align\t2, 0\n"
        "._691:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\tPLTT + 0x102\n"
        "._689:\n"
        "\tldrh\tr1, [r4, #0x30]\n"
        "\tmov\tr0, #0x20\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._694\t@cond_branch\n"
        "\tldr\tr2, ._696       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr1, [r2]\n"
        "\tldrb\tr0, [r1, #0x7]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._694\t@cond_branch\n"
        "\tlsl\tr0, r0, #0x1\n"
        "\tldr\tr1, ._696 + 4   @ PLTT + 0x102\n"
        "\tadd\tr0, r0, r1\n"
        "\tmov\tr1, #0x0\n"
        "\tstrh\tr1, [r0]\n"
        "\tldr\tr1, [r2]\n"
        "\tldrb\tr0, [r1, #0x7]\n"
        "\tsub\tr0, r0, #0x1\n"
        "\tstrb\tr0, [r1, #0x7]\n"
        "\tb\t._695\n"
        "._697:\n"
        "\t.align\t2, 0\n"
        "._696:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\tPLTT + 0x102\n"
        "._694:\n"
        "\tldrh\tr1, [r4, #0x2e]\n"
        "\tmov\tr0, #0x8\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._698\t@cond_branch\n"
        "\tldr\tr4, ._701       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr2, [r4]\n"
        "\tldrb\tr0, [r2, #0x9]\n"
        "\tmov\tr1, #0x1\n"
        "\teor\tr0, r0, r1\n"
        "\tstrb\tr0, [r2, #0x9]\n"
        "\tldr\tr1, [r4]\n"
        "\tldrb\tr0, [r1, #0x9]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._699\t@cond_branch\n"
        "\tldrh\tr0, [r1]\n"
        "\tmov\tr1, #0x0\n"
        "\tmov\tr2, #0x0\n"
        "\tbl\tGetMonSpritePalFromOtIdPersonality\n"
        "\tldr\tr1, [r4]\n"
        "\tldrb\tr1, [r1, #0x6]\n"
        "\tlsl\tr1, r1, #0x14\n"
        "\tmov\tr2, #0x80\n"
        "\tlsl\tr2, r2, #0x11\n"
        "\tadd\tr1, r1, r2\n"
        "\tlsr\tr1, r1, #0x10\n"
        "\tmov\tr2, #0x20\n"
        "\tbl\tLoadCompressedPalette\n"
        "\tb\t._700\n"
        "._702:\n"
        "\t.align\t2, 0\n"
        "._701:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "._699:\n"
        "\tldrh\tr0, [r1]\n"
        "\tmov\tr1, #0x0\n"
        "\tmov\tr2, #0x9\n"
        "\tbl\tGetMonSpritePalFromOtIdPersonality\n"
        "\tldr\tr1, [r4]\n"
        "\tldrb\tr1, [r1, #0x6]\n"
        "\tlsl\tr1, r1, #0x14\n"
        "\tmov\tr2, #0x80\n"
        "\tlsl\tr2, r2, #0x11\n"
        "\tadd\tr1, r1, r2\n"
        "\tlsr\tr1, r1, #0x10\n"
        "\tmov\tr2, #0x20\n"
        "\tbl\tLoadCompressedPalette\n"
        "._700:\n"
        "\tldr\tr5, ._704       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr0, [r5]\n"
        "\tldrb\tr0, [r0, #0x6]\n"
        "\tlsl\tr0, r0, #0x5\n"
        "\tldr\tr4, ._704 + 4   @ gPlttBufferUnfaded\n"
        "\tadd\tr0, r0, r4\n"
        "\tldr\tr2, ._704 + 8   @ 0xffffff00\n"
        "\tadd\tr1, r4, r2\n"
        "\tmov\tr2, #0x10\n"
        "\tbl\tCpuSet\n"
        "\tldr\tr0, [r5]\n"
        "\tldrb\tr0, [r0, #0x6]\n"
        "\tlsl\tr0, r0, #0x5\n"
        "\tadd\tr0, r0, r4\n"
        "\tldr\tr1, ._704 + 12  @ gPlttBufferFaded\n"
        "\tmov\tr2, #0x10\n"
        "\tbl\tCpuSet\n"
        "._695:\n"
        "\tldr\tr1, ._704 + 16  @ gTasks\n"
        "\tlsl\tr0, r6, #0x2\n"
        "\tadd\tr0, r0, r6\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr0, r0, r1\n"
        "\tldr\tr1, ._704 + 20  @ debug_80C6EE8\n"
        "\tstr\tr1, [r0]\n"
        "\tb\t._703\n"
        "._705:\n"
        "\t.align\t2, 0\n"
        "._704:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\tgPlttBufferUnfaded+0x200\n"
        "\t.word\t0xffffff00\n"
        "\t.word\tgPlttBufferFaded+0x100\n"
        "\t.word\tgTasks\n"
        "\t.word\tdebug_80C6EE8+1\n"
        "._698:\n"
        "\tmov\tr0, #0x4\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._706\t@cond_branch\n"
        "\tbl\tStopCryAndClearCrySongs\n"
        "\tldr\tr0, ._707       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr0, [r0]\n"
        "\tldrh\tr0, [r0]\n"
        "\tmov\tr1, #0x0\n"
        "\tbl\tPlayCry1\n"
        "._706:\n"
        "\tldr\tr2, ._707       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr1, [r2]\n"
        "\tldrb\tr0, [r1, #0x8]\n"
        "\tadd\tr0, r0, #0x4\n"
        "\tstrb\tr0, [r1, #0x8]\n"
        "\tldr\tr3, [r2]\n"
        "\tldrb\tr1, [r3, #0x8]\n"
        "\tmov\tr0, #0x1f\n"
        "\tand\tr0, r0, r1\n"
        "\tstrb\tr0, [r3, #0x8]\n"
        "\tldr\tr0, [r2]\n"
        "\tldrb\tr1, [r0, #0x7]\n"
        "\tlsl\tr1, r1, #0x1\n"
        "\tldr\tr2, ._707 + 4   @ PLTT + 0x142\n"
        "\tadd\tr1, r1, r2\n"
        "\tldr\tr2, ._707 + 8   @ gUnknown_Debug_083F8790\n"
        "\tldrb\tr0, [r0, #0x8]\n"
        "\tlsl\tr0, r0, #0x1\n"
        "\tadd\tr0, r0, r2\n"
        "\tldrh\tr0, [r0]\n"
        "\tstrh\tr0, [r1]\n"
        "._703:\n"
        "\tadd\tsp, sp, #0x4\n"
        "\tpop\t{r4, r5, r6}\n"
        "\tpop\t{r0}\n"
        "\tbx\tr0\n"
        "._708:\n"
        "\t.align\t2, 0\n"
        "._707:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\tPLTT + 0x142\n"
        "\t.word\tgUnknown_Debug_083F8790");
}
#endif // NONMATCHING

void debug_80C71FC(u8 taskId)
{
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[gUnknown_Debug_2038A20->unk2].oam.paletteNum));
    DestroySprite(gSprites + gUnknown_Debug_2038A20->unk2);
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[gUnknown_Debug_2038A20->unk3].oam.paletteNum));
    DestroySprite(gSprites + gUnknown_Debug_2038A20->unk3);
    sub_809D510(gSprites + gUnknown_Debug_2038A20->unk4);
    gTasks[taskId].func = debug_80C6CB8;
}

void debug_80C7294(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        gUnknown_Debug_2038A20->unk5 = 0;
        REG_WIN0H = 0x51EF;
        REG_WIN0V = 0x699F;
        gTasks[taskId].func = debug_80C6EE8;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gUnknown_Debug_2038A20->unk5 = 0;
        REG_WIN0H = 0x51EF;
        REG_WIN0V = 0x699F;
        CpuCopy16(gUnknown_Debug_2038A20->unk10, gPlttBufferUnfaded + 0x80, 32);
        CpuCopy16(gUnknown_Debug_2038A20->unk10, gPlttBufferFaded + 0x80, 32);
        CpuCopy16(gUnknown_Debug_2038A20->unk10, gPlttBufferUnfaded + 0x100 + gUnknown_Debug_2038A20->unk6 * 16, 32);
        CpuCopy16(gUnknown_Debug_2038A20->unk10, gPlttBufferFaded + 0x100 + gUnknown_Debug_2038A20->unk6 * 16, 32);
        gTasks[taskId].func = debug_80C6EE8;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN && gUnknown_Debug_2038A20->unkA < 2)
    {
        gUnknown_Debug_2038A20->unkA++;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP && gUnknown_Debug_2038A20->unkA > 0)
    {
        gUnknown_Debug_2038A20->unkA--;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        switch (gUnknown_Debug_2038A20->unkA)
        {
            case 0:
                if (gUnknown_Debug_2038A20->unkC.r < 31)
                    gUnknown_Debug_2038A20->unkC.r++;
                gTasks[taskId].func = debug_80C74E4;
                break;
            case 1:
                if (gUnknown_Debug_2038A20->unkC.g < 31)
                    gUnknown_Debug_2038A20->unkC.g++;
                gTasks[taskId].func = debug_80C74E4;
                break;
            case 2:
                if (gUnknown_Debug_2038A20->unkC.b < 31)
                    gUnknown_Debug_2038A20->unkC.b++;
                gTasks[taskId].func = debug_80C74E4;
                break;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        switch (gUnknown_Debug_2038A20->unkA)
        {
            case 0:
                if (gUnknown_Debug_2038A20->unkC.r > 0)
                    gUnknown_Debug_2038A20->unkC.r--;
                gTasks[taskId].func = debug_80C74E4;
                break;
            case 1:
                if (gUnknown_Debug_2038A20->unkC.g > 0)
                    gUnknown_Debug_2038A20->unkC.g--;
                gTasks[taskId].func = debug_80C74E4;
                break;
            case 2:
                if (gUnknown_Debug_2038A20->unkC.b > 0)
                    gUnknown_Debug_2038A20->unkC.b--;
                gTasks[taskId].func = debug_80C74E4;
                break;
        }
    }
}

void debug_80C74E4(u8 taskId)
{
    u16 pal = (gUnknown_Debug_2038A20->unkC.r & 0x001f) + ((gUnknown_Debug_2038A20->unkC.g << 5) & 0x03e0) + ((gUnknown_Debug_2038A20->unkC.b << 10) & 0x7c00);
    gPlttBufferUnfaded[gUnknown_Debug_2038A20->unk7 + 0x81] = pal;
    gPlttBufferFaded[gUnknown_Debug_2038A20->unk7 + 0x81] = pal;
    gPlttBufferUnfaded[0x101 + gUnknown_Debug_2038A20->unk6 * 16 + gUnknown_Debug_2038A20->unk7] = pal;
    gPlttBufferFaded[0x101 + gUnknown_Debug_2038A20->unk6 * 16 + gUnknown_Debug_2038A20->unk7] = pal;
    debug_80C68CC(pal, 14, 10, 4);
    gTasks[taskId].func = debug_80C7294;
}

void debug_80C7584(struct Sprite *sprite)
{
    if (!gUnknown_Debug_2038A20->unk5)
        sprite->invisible = TRUE;
    else
    {
        u8 shade;
        switch (sprite->data[0])
        {
            default:
            case 0:
                shade = gUnknown_Debug_2038A20->unkC.r;
                break;
            case 1:
                shade = gUnknown_Debug_2038A20->unkC.g;
                break;
            case 2:
                shade = gUnknown_Debug_2038A20->unkC.b;
                break;
        }
        sprite->pos2.x = 4 * shade;
        sprite->pos2.y = 8 * sprite->data[0];
        sprite->data[1]++;
        if (sprite->data[0] == gUnknown_Debug_2038A20->unkA && !(sprite->data[1] & 0x08))
            sprite->invisible = TRUE;
        else
            sprite->invisible = FALSE;
    }
}

void InitSeeTrainers(void)
{
    u8 spriteId;
    u16 imeBak;
    debug_80C35DC();
    DmaCopy16Defvars(3, byte_83F88EC, VRAM + 0xe000, 0x800);
    LoadPalette(word_83F888C, 0x80, 0x60);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
    REG_WININ = 0x3F;
    REG_WINOUT = 0x1F;
    REG_BLDCNT = 0xF1;
    REG_BLDALPHA = 0;
    REG_BLDY = 7;
    imeBak = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = imeBak;
    SetVBlankCallback(debug_80C3758);
    SetMainCallback2(debug_80C370C);
    REG_BG0CNT = 0x1F0B;
    REG_BG1CNT = 0x1E0A;
    REG_DISPCNT = 0x3340;
    CreateTask(debug_80C777C, 0);
    gUnknown_Debug_2038A20 = &eWatanabe18000_2;
    gUnknown_Debug_2038A20->unk0 = 0;
    gUnknown_Debug_2038A20->unk2 = 0;
    gUnknown_Debug_2038A20->unk3 = 0;
    gUnknown_Debug_2038A20->unk5 = 0;
    gUnknown_Debug_2038A20->unk7 = 0;
    gUnknown_Debug_2038A20->unkA = 0;
    gUnknown_Debug_2038A20->unk8 = 0;
    spriteId = CreateSprite(&gSpriteTemplate_83F8874, 0x6c, 0x74, 0);
    gSprites[spriteId].data[0] = 0;
    StartSpriteAnim(gSprites + spriteId, 0);
    spriteId = CreateSprite(&gSpriteTemplate_83F8874, 0x6c, 0x74, 0);
    gSprites[spriteId].data[0] = 1;
    StartSpriteAnim(gSprites + spriteId, 1);
    spriteId = CreateSprite(&gSpriteTemplate_83F8874, 0x6c, 0x74, 0);
    gSprites[spriteId].data[0] = 2;
    StartSpriteAnim(gSprites + spriteId, 2);
}

void debug_80C777C(u8 taskId)
{
    u8 sp00[] = {0x00, 0x10, 0x20, 0x20, 0x20, 0x21, 0x20, 0x20, 0x20, 0x21, 0x20, 0x20, 0x20, 0x21, 0x20, 0x20, 0x20, 0x21};
    u8 i;

    Menu_DrawStdWindowFrame(9, 0, 14, 7);
    Menu_DrawStdWindowFrame(0, 0, 9, 9);
    Menu_DrawStdWindowFrame(0, 10, 9, 19);
    Menu_DrawStdWindowFrame(14, 0, 29, 7);
    Menu_PrintText(gUnknown_Debug_083F87D0, 15, 1);
    Menu_PrintText(gUnknown_Debug_083F87D8, 25, 1);
    Menu_PrintText(gUnknown_Debug_083F87E0, 15, 5);

    Menu_DrawStdWindowFrame(10, 8, 29, 12);
    for (i = 0; i < 15; i++)
        ((u16 *)(VRAM + 0xFA56))[i] = 0xA311 + i;
    for (i = 0; i < 15; i++)
        ((u16 *)(VRAM + 0xF256))[i] = 0x8301 + i;

    Menu_PrintText(gUnknown_Debug_083F87F4, 20, 10);
    Menu_DrawStdWindowFrame(10, 13, 29, 19);

    sp00[0] = 0x23;
    for (i = 0; i < 18; i++)
        ((u16 *)(VRAM + 0xF396))[i] = 0x9300 + sp00[i];
    sp00[0] = 0x24;
    for (i = 0; i < 18; i++)
        ((u16 *)(VRAM + 0xF3D6))[i] = 0x9300 + sp00[i];
    sp00[0] = 0x25;
    for (i = 0; i < 18; i++)
        ((u16 *)(VRAM + 0xF416))[i] = 0x9300 + sp00[i];

    Menu_PrintText(gUnknown_Debug_083F8801, 15, 17);

    REG_WIN0H = 0x51EF;
    REG_WIN0V = 0x699F;

    gTasks[taskId].func = debug_80C7934;
}

void debug_80C7934(u8 taskId)
{
    DecompressPicFromTable_2(gTrainerFrontPicTable + gUnknown_Debug_2038A20->unk0, gTrainerFrontPicCoords[gUnknown_Debug_2038A20->unk0].coords, gTrainerFrontPicCoords[gUnknown_Debug_2038A20->unk0].y_offset, gUnknown_081FAF4C[0], gUnknown_081FAF4C[1], gUnknown_Debug_2038A20->unk0);
    LoadCompressedObjectPalette(gTrainerFrontPicPaletteTable + gUnknown_Debug_2038A20->unk0);
    GetMonSpriteTemplate_803C5A0(gUnknown_Debug_2038A20->unk0, 1);
    gUnknown_Debug_2038A20->unk2 = CreateSprite(&gUnknown_02024E8C, 0x28, 0x28, 0);
    gSprites[gUnknown_Debug_2038A20->unk2].callback = debug_69;
    gSprites[gUnknown_Debug_2038A20->unk2].oam.priority = 0;

    debug_80C376C(gUnknown_Debug_2038A20->unk0, 26, 5);

    gUnknown_Debug_2038A20->unk6 = gSprites[gUnknown_Debug_2038A20->unk2].oam.paletteNum;
    CpuCopy16(gPlttBufferUnfaded + gUnknown_Debug_2038A20->unk6 * 16 + 0x100, gPlttBufferUnfaded + 0x80, 0x20);
    CpuCopy16(gPlttBufferUnfaded + gUnknown_Debug_2038A20->unk6 * 16 + 0x100, gPlttBufferFaded + 0x80, 0x20);

    gTasks[taskId].func = debug_80C7A54;

    gUnknown_Debug_2038A20->unk9 = 0;
}

void debug_80C7A54(u8 taskId)
{
    u16 hue;
    CpuCopy16(gPlttBufferUnfaded + 0x80, gUnknown_Debug_2038A20->unk10, 32);
    hue = gPlttBufferUnfaded[gUnknown_Debug_2038A20->unk7 + 0x81];
    gUnknown_Debug_2038A20->unkC.r = hue & 0x1f;
    gUnknown_Debug_2038A20->unkC.g = (hue & 0x3e0) >> 5;
    gUnknown_Debug_2038A20->unkC.b = (hue & 0x7c00) >> 10;
    gUnknown_Debug_2038A20->unkC.unused_15 = 0;
    debug_80C68CC(gUnknown_Debug_2038A20->unk7 + 1, 11, 10, 2);
    Menu_PrintText(gUnknown_Debug_083F8813, 13, 10);
    debug_80C68CC(hue, 14, 10, 4);
    gTasks[taskId].func = debug_80C7B14;
}

#ifdef NONMATCHING
void debug_80C7B14(u8 taskId)
{
    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        SetMainCallback2(debug_80C370C);
        gTasks[taskId].func = debug_80C373C;
    }
    else if (gMain.newAndRepeatedKeys & R_BUTTON)
    {
        gUnknown_Debug_2038A20->unk0 = debug_80C38B4(0, gUnknown_Debug_2038A20->unk0);
        gTasks[taskId].func = debug_80C7D44;
    }
    else if (gMain.newAndRepeatedKeys & L_BUTTON)
    {
        gUnknown_Debug_2038A20->unk0 = debug_80C38B4(1, gUnknown_Debug_2038A20->unk0);
        gTasks[taskId].func = debug_80C7D44;
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        gUnknown_Debug_2038A20->unk5 = 1;
        REG_WIN0H = 0x51EF;
        REG_WIN0V = 0x4167;
        gTasks[taskId].func = debug_80C7DDC;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT && gUnknown_Debug_2038A20->unk7 < 14)
    {
        ((u16 *)PLTT)[0x81 + gUnknown_Debug_2038A20->unk7] = 0;
        do; while (0); // this matches the asm here...
        gUnknown_Debug_2038A20->unk7++;
        gTasks[taskId].func = debug_80C7A54;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT && gUnknown_Debug_2038A20->unk7 > 0)
    {
        ((u16 *)PLTT)[0x81 + gUnknown_Debug_2038A20->unk7] = 0;
        do; while (0); // ... but not here
        gUnknown_Debug_2038A20->unk7--;
        gTasks[taskId].func = debug_80C7A54;
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        gUnknown_Debug_2038A20->unk9 ^= 1;
        if (gUnknown_Debug_2038A20->unk9)
        {
            LoadCompressedPalette(GetMonSpritePalFromOtIdPersonality(gUnknown_Debug_2038A20->unk0, 0, 0), gUnknown_Debug_2038A20->unk6 * 16 + 0x100, 0x20);
        }
        else
        {
            LoadCompressedPalette(GetMonSpritePalFromOtIdPersonality(gUnknown_Debug_2038A20->unk0, 0, 9), gUnknown_Debug_2038A20->unk6 * 16 + 0x100, 0x20);
        }
        CpuCopy16(gPlttBufferUnfaded + gUnknown_Debug_2038A20->unk6 * 16 + 0x100, gPlttBufferUnfaded + 0x80, 32);
        CpuCopy16(gPlttBufferUnfaded + gUnknown_Debug_2038A20->unk6 * 16 + 0x100, gPlttBufferFaded + 0x80, 32);
        gTasks[taskId].func = debug_80C7A54;
    }
    else
    {
        gUnknown_Debug_2038A20->unk8 += 4;
        gUnknown_Debug_2038A20->unk8 &= 0x1f;
        ((u16 *)PLTT)[0xa1 + gUnknown_Debug_2038A20->unk7] = gUnknown_Debug_083F8790[gUnknown_Debug_2038A20->unk8];
    }
}
#else
NAKED void debug_80C7B14(u8 taskId)
{
    asm("\tpush\t{r4, r5, r6, lr}\n"
        "\tadd\tsp, sp, #0xfffffffc\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr6, r0, #0x18\n"
        "\tldr\tr1, ._792       @ gMain\n"
        "\tldrh\tr3, [r1, #0x2e]\n"
        "\tmov\tr0, #0x2\n"
        "\tand\tr0, r0, r3\n"
        "\tadd\tr4, r1, #0\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._790\t@cond_branch\n"
        "\tmov\tr0, #0x5\n"
        "\tbl\tPlaySE\n"
        "\tmov\tr0, #0x1\n"
        "\tneg\tr0, r0\n"
        "\tmov\tr1, #0x0\n"
        "\tstr\tr1, [sp]\n"
        "\tmov\tr2, #0x0\n"
        "\tmov\tr3, #0x10\n"
        "\tbl\tBeginNormalPaletteFade\n"
        "\tldr\tr0, ._792 + 4   @ debug_80C370C\n"
        "\tbl\tSetMainCallback2\n"
        "\tldr\tr1, ._792 + 8   @ gTasks\n"
        "\tlsl\tr0, r6, #0x2\n"
        "\tadd\tr0, r0, r6\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr0, r0, r1\n"
        "\tldr\tr1, ._792 + 12  @ debug_80C373C\n"
        "\tstr\tr1, [r0]\n"
        "\tb\t._821\n"
        "._793:\n"
        "\t.align\t2, 0\n"
        "._792:\n"
        "\t.word\tgMain\n"
        "\t.word\tdebug_80C370C+1\n"
        "\t.word\tgTasks\n"
        "\t.word\tdebug_80C373C+1\n"
        "._790:\n"
        "\tldrh\tr1, [r4, #0x30]\n"
        "\tmov\tr0, #0x80\n"
        "\tlsl\tr0, r0, #0x1\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._794\t@cond_branch\n"
        "\tldr\tr4, ._796       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr0, [r4]\n"
        "\tldrh\tr1, [r0]\n"
        "\tmov\tr0, #0x0\n"
        "\tb\t._795\n"
        "._797:\n"
        "\t.align\t2, 0\n"
        "._796:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "._794:\n"
        "\tmov\tr0, #0x80\n"
        "\tlsl\tr0, r0, #0x2\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._798\t@cond_branch\n"
        "\tldr\tr4, ._800       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr0, [r4]\n"
        "\tldrh\tr1, [r0]\n"
        "\tmov\tr0, #0x1\n"
        "._795:\n"
        "\tbl\tdebug_80C38B4\n"
        "\tldr\tr1, [r4]\n"
        "\tstrh\tr0, [r1]\n"
        "\tldr\tr1, ._800 + 4   @ gTasks\n"
        "\tlsl\tr0, r6, #0x2\n"
        "\tadd\tr0, r0, r6\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr0, r0, r1\n"
        "\tldr\tr1, ._800 + 8   @ debug_80C7D44\n"
        "\tstr\tr1, [r0]\n"
        "\tb\t._821\n"
        "._801:\n"
        "\t.align\t2, 0\n"
        "._800:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\tgTasks\n"
        "\t.word\tdebug_80C7D44+1\n"
        "._798:\n"
        "\tmov\tr2, #0x1\n"
        "\tand\tr2, r2, r3\n"
        "\tcmp\tr2, #0\n"
        "\tbeq\t._802\t@cond_branch\n"
        "\tldr\tr0, ._804       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr1, [r0]\n"
        "\tmov\tr0, #0x1\n"
        "\tstrb\tr0, [r1, #0x5]\n"
        "\tldr\tr1, ._804 + 4   @ 0x4000040\n"
        "\tldr\tr2, ._804 + 8   @ 0x51ef\n"
        "\tadd\tr0, r2, #0\n"
        "\tstrh\tr0, [r1]\n"
        "\tadd\tr1, r1, #0x4\n"
        "\tldr\tr2, ._804 + 12  @ 0x4167\n"
        "\tadd\tr0, r2, #0\n"
        "\tstrh\tr0, [r1]\n"
        "\tldr\tr1, ._804 + 16  @ gTasks\n"
        "\tlsl\tr0, r6, #0x2\n"
        "\tadd\tr0, r0, r6\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr0, r0, r1\n"
        "\tldr\tr1, ._804 + 20  @ debug_80C7DDC\n"
        "\tstr\tr1, [r0]\n"
        "\tb\t._821\n"
        "._805:\n"
        "\t.align\t2, 0\n"
        "._804:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\t0x4000040\n"
        "\t.word\t0x51ef\n"
        "\t.word\t0x4167\n"
        "\t.word\tgTasks\n"
        "\t.word\tdebug_80C7DDC+1\n"
        "._802:\n"
        "\tmov\tr0, #0x10\n"
        "\tand\tr0, r0, r1\n"
        "\tldr\tr3, ._809       @ gUnknown_Debug_2038A20\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._807\t@cond_branch\n"
        "\tldr\tr1, [r3]\n"
        "\tldrb\tr0, [r1, #0x7]\n"
        "\tcmp\tr0, #0xd\n"
        "\tbhi\t._807\t@cond_branch\n"
        "\tlsl\tr0, r0, #0x1\n"
        "\tldr\tr1, ._809 + 4   @ 0x5000102\n"
        "\tadd\tr0, r0, r1\n"
        "\tstrh\tr2, [r0]\n"
        "\tldr\tr1, [r3]\n"
        "\tldrb\tr0, [r1, #0x7]\n"
        "\tadd\tr0, r0, #0x1\n"
        "\tstrb\tr0, [r1, #0x7]\n"
        "\tb\t._813\n"
        "._810:\n"
        "\t.align\t2, 0\n"
        "._809:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\t0x5000102\n"
        "._807:\n"
        "\tldrh\tr1, [r4, #0x30]\n"
        "\tmov\tr0, #0x20\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._812\t@cond_branch\n"
        "\tldr\tr1, [r3]\n"
        "\tldrb\tr0, [r1, #0x7]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._812\t@cond_branch\n"
        "\tlsl\tr0, r0, #0x1\n"
        "\tldr\tr2, ._814       @ 0x5000102\n"
        "\tadd\tr0, r0, r2\n"
        "\tmov\tr1, #0x0\n"
        "\tstrh\tr1, [r0]\n"
        "\tldr\tr1, [r3]\n"
        "\tldrb\tr0, [r1, #0x7]\n"
        "\tsub\tr0, r0, #0x1\n"
        "\tstrb\tr0, [r1, #0x7]\n"
        "\tb\t._813\n"
        "._815:\n"
        "\t.align\t2, 0\n"
        "._814:\n"
        "\t.word\t0x5000102\n"
        "._812:\n"
        "\tldrh\tr1, [r4, #0x2e]\n"
        "\tmov\tr0, #0x8\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._816\t@cond_branch\n"
        "\tldr\tr4, ._819       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr2, [r4]\n"
        "\tldrb\tr0, [r2, #0x9]\n"
        "\tmov\tr1, #0x1\n"
        "\teor\tr0, r0, r1\n"
        "\tstrb\tr0, [r2, #0x9]\n"
        "\tldr\tr1, [r4]\n"
        "\tldrb\tr0, [r1, #0x9]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._817\t@cond_branch\n"
        "\tldrh\tr0, [r1]\n"
        "\tmov\tr1, #0x0\n"
        "\tmov\tr2, #0x0\n"
        "\tbl\tGetMonSpritePalFromOtIdPersonality\n"
        "\tldr\tr1, [r4]\n"
        "\tldrb\tr1, [r1, #0x6]\n"
        "\tlsl\tr1, r1, #0x14\n"
        "\tmov\tr2, #0x80\n"
        "\tlsl\tr2, r2, #0x11\n"
        "\tadd\tr1, r1, r2\n"
        "\tlsr\tr1, r1, #0x10\n"
        "\tmov\tr2, #0x20\n"
        "\tbl\tLoadCompressedPalette\n"
        "\tb\t._818\n"
        "._820:\n"
        "\t.align\t2, 0\n"
        "._819:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "._817:\n"
        "\tldrh\tr0, [r1]\n"
        "\tmov\tr1, #0x0\n"
        "\tmov\tr2, #0x9\n"
        "\tbl\tGetMonSpritePalFromOtIdPersonality\n"
        "\tldr\tr1, [r4]\n"
        "\tldrb\tr1, [r1, #0x6]\n"
        "\tlsl\tr1, r1, #0x14\n"
        "\tmov\tr2, #0x80\n"
        "\tlsl\tr2, r2, #0x11\n"
        "\tadd\tr1, r1, r2\n"
        "\tlsr\tr1, r1, #0x10\n"
        "\tmov\tr2, #0x20\n"
        "\tbl\tLoadCompressedPalette\n"
        "._818:\n"
        "\tldr\tr5, ._822       @ gUnknown_Debug_2038A20\n"
        "\tldr\tr0, [r5]\n"
        "\tldrb\tr0, [r0, #0x6]\n"
        "\tlsl\tr0, r0, #0x5\n"
        "\tldr\tr4, ._822 + 4   @ gPlttBufferUnfaded\n"
        "\tadd\tr0, r0, r4\n"
        "\tldr\tr2, ._822 + 8   @ 0xffffff00\n"
        "\tadd\tr1, r4, r2\n"
        "\tmov\tr2, #0x10\n"
        "\tbl\tCpuSet\n"
        "\tldr\tr0, [r5]\n"
        "\tldrb\tr0, [r0, #0x6]\n"
        "\tlsl\tr0, r0, #0x5\n"
        "\tadd\tr0, r0, r4\n"
        "\tldr\tr1, ._822 + 12  @ gPlttBufferFaded\n"
        "\tmov\tr2, #0x10\n"
        "\tbl\tCpuSet\n"
        "._813:\n"
        "\tldr\tr1, ._822 + 16  @ gTasks\n"
        "\tlsl\tr0, r6, #0x2\n"
        "\tadd\tr0, r0, r6\n"
        "\tlsl\tr0, r0, #0x3\n"
        "\tadd\tr0, r0, r1\n"
        "\tldr\tr1, ._822 + 20  @ debug_80C7A54\n"
        "\tstr\tr1, [r0]\n"
        "\tb\t._821\n"
        "._823:\n"
        "\t.align\t2, 0\n"
        "._822:\n"
        "\t.word\tgUnknown_Debug_2038A20\n"
        "\t.word\tgPlttBufferUnfaded+0x200\n"
        "\t.word\t0xffffff00\n"
        "\t.word\tgPlttBufferFaded+0x100\n"
        "\t.word\tgTasks\n"
        "\t.word\tdebug_80C7A54+1\n"
        "._816:\n"
        "\tldr\tr1, [r3]\n"
        "\tldrb\tr0, [r1, #0x8]\n"
        "\tadd\tr0, r0, #0x4\n"
        "\tstrb\tr0, [r1, #0x8]\n"
        "\tldr\tr2, [r3]\n"
        "\tldrb\tr1, [r2, #0x8]\n"
        "\tmov\tr0, #0x1f\n"
        "\tand\tr0, r0, r1\n"
        "\tstrb\tr0, [r2, #0x8]\n"
        "\tldr\tr0, [r3]\n"
        "\tldrb\tr1, [r0, #0x7]\n"
        "\tlsl\tr1, r1, #0x1\n"
        "\tldr\tr2, ._824       @ 0x5000142\n"
        "\tadd\tr1, r1, r2\n"
        "\tldr\tr2, ._824 + 4   @ gUnknown_Debug_083F8790\n"
        "\tldrb\tr0, [r0, #0x8]\n"
        "\tlsl\tr0, r0, #0x1\n"
        "\tadd\tr0, r0, r2\n"
        "\tldrh\tr0, [r0]\n"
        "\tstrh\tr0, [r1]\n"
        "._821:\n"
        "\tadd\tsp, sp, #0x4\n"
        "\tpop\t{r4, r5, r6}\n"
        "\tpop\t{r0}\n"
        "\tbx\tr0\n"
        "._825:\n"
        "\t.align\t2, 0\n"
        "._824:\n"
        "\t.word\t0x5000142\n"
        "\t.word\tgUnknown_Debug_083F8790");
}
#endif // NONMATCHING

void debug_80C7D44(u8 taskId)
{
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[gUnknown_Debug_2038A20->unk2].oam.paletteNum));
    DestroySprite(gSprites + gUnknown_Debug_2038A20->unk2);
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[gUnknown_Debug_2038A20->unk3].oam.paletteNum));
    DestroySprite(gSprites + gUnknown_Debug_2038A20->unk3);
    sub_809D510(gSprites + gUnknown_Debug_2038A20->unk4);
    gTasks[taskId].func = debug_80C7934;
}

void debug_80C7DDC(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        gUnknown_Debug_2038A20->unk5 = 0;
        REG_WIN0H = 0x51EF;
        REG_WIN0V = 0x699F;
        gTasks[taskId].func = debug_80C7A54;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gUnknown_Debug_2038A20->unk5 = 0;
        REG_WIN0H = 0x51EF;
        REG_WIN0V = 0x699F;
        CpuCopy16(gUnknown_Debug_2038A20->unk10, gPlttBufferUnfaded + 0x80, 32);
        CpuCopy16(gUnknown_Debug_2038A20->unk10, gPlttBufferFaded + 0x80, 32);
        CpuCopy16(gUnknown_Debug_2038A20->unk10, gPlttBufferUnfaded + 0x100 + gUnknown_Debug_2038A20->unk6 * 16, 32);
        CpuCopy16(gUnknown_Debug_2038A20->unk10, gPlttBufferFaded + 0x100 + gUnknown_Debug_2038A20->unk6 * 16, 32);
        gTasks[taskId].func = debug_80C7A54;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN && gUnknown_Debug_2038A20->unkA < 2)
    {
        gUnknown_Debug_2038A20->unkA++;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_UP && gUnknown_Debug_2038A20->unkA > 0)
    {
        gUnknown_Debug_2038A20->unkA--;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        switch (gUnknown_Debug_2038A20->unkA)
        {
            case 0:
                if (gUnknown_Debug_2038A20->unkC.r < 31)
                    gUnknown_Debug_2038A20->unkC.r++;
                gTasks[taskId].func = debug_80C802C;
                break;
            case 1:
                if (gUnknown_Debug_2038A20->unkC.g < 31)
                    gUnknown_Debug_2038A20->unkC.g++;
                gTasks[taskId].func = debug_80C802C;
                break;
            case 2:
                if (gUnknown_Debug_2038A20->unkC.b < 31)
                    gUnknown_Debug_2038A20->unkC.b++;
                gTasks[taskId].func = debug_80C802C;
                break;
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        switch (gUnknown_Debug_2038A20->unkA)
        {
            case 0:
                if (gUnknown_Debug_2038A20->unkC.r > 0)
                    gUnknown_Debug_2038A20->unkC.r--;
                gTasks[taskId].func = debug_80C802C;
                break;
            case 1:
                if (gUnknown_Debug_2038A20->unkC.g > 0)
                    gUnknown_Debug_2038A20->unkC.g--;
                gTasks[taskId].func = debug_80C802C;
                break;
            case 2:
                if (gUnknown_Debug_2038A20->unkC.b > 0)
                    gUnknown_Debug_2038A20->unkC.b--;
                gTasks[taskId].func = debug_80C802C;
                break;
        }
    }
}

void debug_80C802C(u8 taskId)
{
    u16 pal = (gUnknown_Debug_2038A20->unkC.r & 0x001f) + ((gUnknown_Debug_2038A20->unkC.g << 5) & 0x03e0) + ((gUnknown_Debug_2038A20->unkC.b << 10) & 0x7c00);
    gPlttBufferUnfaded[gUnknown_Debug_2038A20->unk7 + 0x81] = pal;
    gPlttBufferFaded[gUnknown_Debug_2038A20->unk7 + 0x81] = pal;
    gPlttBufferUnfaded[0x101 + gUnknown_Debug_2038A20->unk6 * 16 + gUnknown_Debug_2038A20->unk7] = pal;
    gPlttBufferFaded[0x101 + gUnknown_Debug_2038A20->unk6 * 16 + gUnknown_Debug_2038A20->unk7] = pal;
    debug_80C68CC(pal, 14, 10, 4);
    gTasks[taskId].func = debug_80C7DDC;
}

#endif // DEBUG
