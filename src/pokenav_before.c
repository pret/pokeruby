#include "global.h"
#include "main.h"
#include "pokenav.h"
#include "ewram.h"
#include "battle.h"
#include "data2.h"
#include "de_rom_8040FE0.h"
#include "decompress.h"
#include "event_data.h"
#include "constants/flags.h"
#include "landmark.h"
#include "link.h"
#include "menu.h"
#include "overworld.h"
#include "palette.h"
#include "region_map.h"
#include "constants/songs.h"
#include "string_util.h"
#include "strings.h"
#include "sound.h"
#include "task.h"
#include "text.h"
#include "trig.h"
#include "scanline_effect.h"
#include "pokemon_storage_system.h"
#include "pokemon_summary_screen.h"
#include "use_pokeblock.h"
#include "constants/game_stat.h"

struct UnknownPokenav0
{
    /* 0x0000 */ u8 var0[0x0300];
    /* 0x0300 */ void (*var300)(void);
    /* 0x0304 */ u16 var304;
    /* 0x0306 */ u16 var306;
    /* 0x0308 */ u32 var308;
    /* 0x030C */ u8 fill030C[0x6a9f];
    /* 0x6dab */ u8 var6dab;
    /* 0x6dac */ u8 var6dac;
    /* 0x6dad */ u8 var6dad;
    /* 0x6dae */ u8 var6dae;
    /* 0x6daf */ u8 fill6daf[0x3];
    /* 0x6db2 */ u8 var6db2[5];
    /* 0x6db7 */ u8 fill6db7[0x25];
    /* 0x6ddc */ s8 var6ddc;
    /* 0x6ddd */ u8 fill6ddd[0x13];
    /* 0x6df0 */ s8 var6df0;
    /* 0x6df1 */ u8 fill6df1[0xB];
    /* 0x6dfc */ u8 var6dfc;
    /* 0x6dfd */ u8 fill6dfd[0x17];
    /* 0x6e14 */ u8 var6e14;
    /* 0x6e15 */ u8 var6e15;
    /* 0x6e16 */ u8 var6e16;
    /* 0x6e17 */ u8 var6e17;
    /* 0x6e18 */ u8 fill6e18[0x78];
    /* 0x6e90 */ u8 var6e90;
    /* 0x6e91 */ u8 fill6e91[0x4];
    /* 0x6e95 */ u8 var6e95;
    /* 0x6e96 */ u8 var6e96[0x814];
    /* 0x76AA */ u8 var76aa;
    /* 0x76AB */ u8 fill76AB[0x10BD];
    /* 0x8768 */ u32 var8768;
    /* 0x876C */ u8 fill876C[0x2];
    /* 0x876E */ u8 var876E;
    /* 0x876F */ u8 fill876F[0x5];
    /* 0x8774 */ s16 var8774;
    /* 0x8776 */ u8 fill8776[0x55];
    /* 0x87CB */ u8 var87CB;
    /* 0x87CC */ u8 fill87CC[0xC];
    /* 0x87D8 */ u8 var87D8;
    /* 0x87D9 */ u8 fill87D9[0x1];
    /* 0x87DA */ s16 var87DA;
    /* 0x87DC */ s16 var87DC;
    /* 0x87DE */ u8 fill87DE[0x4a];
    /* 0x8828 */ u8 playerPartyCount;
    /* 0x8829 */ u8 fill8829[0x07bf];
    /* 0x8FE8 */ s8 var8fe8;
    /* 0x8FE9 */ u8 fill8FE9[0x16];
    /* 0x8FFF */ u8 var8fff[5];
    /* 0x9004 */ u8 fill9004[0x340];
    /* 0x9344 */ u8 var9344;
    /* 0x9345 */ u8 fill9345[0x3b8b];
    /* 0xced0 */ u32 varCED0;
    /* 0xced4 */ u8 fillCED4[0x284];
    /* 0xD158 */ u16 varD158;
    /* 0xD15A */ u8 fillD15A[0x8];
    /* 0xD162 */ u8 varD162;
};

struct UnknownPokenav0_1 {
    u8 fill6dad[0x6dad];
    s8 var6dad;
    s8 var6dae;
};

struct PokenavRibbonIconGfx {
    u16 baseTile;
    u8 paletteNum;
};

IWRAM_DATA void (*gUnknown_03000744)(void);

extern const u8 gUnknown_083E0314[];
extern const u16 gUnknown_08E9F9E8[];
extern const u16 gUnknown_083E0274[];
extern const u8 gUnknown_08E9FC64[];
extern const u8 gUnknown_083E0354[];
extern const u8 gUnknown_08E9FD64[];
extern const u8 gUnknown_08E9FE54[];
extern const u8 gUnknown_08E9FD1C[];
extern const u16 gPokenavConditionSearch2_Pal[];
extern const u8 gUnknown_083E0334[];
extern const u16 gUnknown_083E02B4[];
extern const u8 gPokenavConditionSearch2_Gfx[];
extern const u8 gUnknown_083E0254[];
extern const u8 gUnknown_08E9FEB4[];
extern const u8 gUnknown_083E01AC[];
extern const u8 gUnknown_08E9AC4C[];
extern const u8 gPokenavConditionMenu2_Pal[];
extern const u8 gPokenavConditionView_Gfx[];
extern const u8 gUnknown_08E9ABB4[];
extern const u8 gUnknown_08E9AC2C[];
extern const u8 *const gPokenavCityMaps[][2];
extern const u8 gPokenavHoennMapSquares_Pal[];
extern const u8 gPokenavHoennMapSquares_Gfx[];
extern const u16 gUnknown_083E003C[];
extern const u8 *const gUnknown_083E31B0[];
extern const u8 *const gUnknown_083E31CC[];
extern const u8 *const gUnknown_083E31D8[];
extern u8 *gUnknown_083DFEC8;
extern const u8 gUnknown_083DFEEC[];
extern const u8 gUnknown_083E005C[];
extern const u8 gUnknown_083E007C[];
extern const u8 gPokenavOutlineTilemap[];
extern const u8 gPokenavOutlineTiles[];
extern const u8 gPokenavOutlinePalette[];
extern const u8 gUnknown_083DFECC[];
extern const u8 gUnknown_083DFF8C[];
extern const u8 gPokenavHoennMapMisc_Gfx[];
extern const u8 gUnknown_08E99FB0[];
extern const u8 gUnknown_08E9A100[];
extern const u16 gPokenavHoennMap1_Pal[];
extern void (*const gUnknown_083E3270[])(u16, u16);
extern const u8 gUnknown_083E039C[];
extern const u8 gUnknown_083E03A0[];
extern const u8 gUnknown_083E01F4[];
extern const u8 *const gTrainerEyeDescriptions[];
extern const u8 gUnknown_08E9FBA0[];
extern const u8 gPokenavRibbonView_Gfx[];
extern const u8 gUnknown_083E040C[];
extern const u16 gPokenavRibbonView_Pal[];
extern const u16 gUnknown_083E03A8[];
extern const u16 gUnknown_083E3C60[][16];
extern const u16 gPokenavRibbonsIconGfx[][2];
extern const u8 *const gRibbonDescriptions[][2];
extern const u8 *const gGiftRibbonDescriptions[][2];
extern const u8 gUnknown_08E9FF58[];
extern const u8 gPokenavRibbonPokeView_Gfx[];
extern const u16 gUnknown_083E0124[];
extern const u16 gUnknown_083E0144[];
extern const u8 gPokenavMenuOptions_Gfx[];
extern const u8 gPokenavConditionMenu_Gfx[];
extern const u8 gPokenavConditionSearch_Gfx[];
extern const struct SpriteTemplate gSpriteTemplate_83E4454;
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_83E4450[];
extern const u16 gUnknown_083E42F8[];
extern const u16 gPokenavMenuOptions1_Pal[];
extern const u16 gPokenavMenuOptions2_Pal[];
extern const u16 gPokenavConditionMenu_Pal[];
extern const u16 gPokenavCondition6_Pal[];
extern const u16 gPokenavCondition7_Pal[];
extern const struct SpriteSheet gSpriteSheet_PokenavBlueLight;
extern const struct SpritePalette gSpritePalette_PokenavBlueLight;
extern const struct SpriteTemplate gSpriteTemplate_83E4484;
extern const u8 gPokenavMainMenu_Gfx[];
extern const u8 gPokenavConditionMenuHeader_Gfx[];
extern const u8 gPokenavRibbonsHeader_Gfx[];
extern const u8 gPokenavHoennMapHeader_Gfx[];
extern const u8 gPokenavConditionMenuOptions_Gfx[];
extern const u8 gPokenavConditionMenuOptions2_Gfx[];
extern const u8 gPokenavTrainersEyesHeader_Gfx[];
extern const struct SpritePalette gUnknown_083E449C[];
extern const struct SpriteTemplate gSpriteTemplate_83E4530;
extern const struct SpriteTemplate gSpriteTemplate_83E4548;
extern const struct SpriteTemplate gSpriteTemplate_83E44E0;
extern const struct SpriteTemplate gSpriteTemplate_83E44F8;
extern const struct SpriteSheet gUnknown_083E4568;
extern const struct SpriteTemplate gSpriteTemplate_83E4570;
extern const struct SpritePalette gUnknown_083E4588;
extern const struct SpriteSheet gUnknown_083E4590[3];
extern const struct SpritePalette gUnknown_083E45A8;
extern const u16 gUnknown_08E9F988[];
extern const struct SpriteTemplate gSpriteTemplate_83E45B8;
extern const struct SpriteTemplate gSpriteTemplate_83E45F0;
extern const struct SpriteSheet gUnknown_083E4628[4];
extern const struct SpritePalette gUnknown_083E4648[3];
extern const struct SpriteTemplate gSpriteTemplate_83E4660;
extern const u16 gUnknown_083E4678[];
extern const u8 gUnknown_083E3D00[];
extern const struct SpriteTemplate gSpriteTemplate_83E476C;
extern const struct SpriteSheet gUnknown_083E4784;
extern const struct SpritePalette gUnknown_083E478C;
extern const struct SpriteTemplate gSpriteTemplate_83E4800;
extern const s16 gUnknown_083E4794[][2];
extern const u8 gUnknown_083E329C[];
extern const struct SpritePalette gUnknown_083E4818;
extern const struct SpriteTemplate gSpriteTemplate_83E4850;
extern const struct SpritePalette gUnknown_083E4868;
extern const struct SpriteTemplate gSpriteTemplate_83E4878;

extern u16 gUnknown_020388B4;
extern u8 gUnknown_020388B0[];


// TODO: decompile the debug code so the compiler doesn't complain about
// unused static functions
#define static

static void sub_80EBCA8();
static void sub_80EEE20();
static bool8 sub_80EEE54();
static void sub_80EEE08();
static void sub_80EED2C(u8);
static void sub_80EC268();
static void sub_80EED1C();
static void sub_80EE9C0(u8, u8, u8);
static bool8 sub_80EEA0C();
static bool8 sub_80EEC10();
static void sub_80EED9C();
static void sub_80EDB88();
static void sub_80EC4A0();
static void sub_80EC81C();
static void sub_80EE96C();
static void sub_80EE3D8();
static bool8 sub_80EEF34();
static void sub_80EED0C();
static void sub_80EC67C();
static void sub_80EC86C();
static bool8 sub_80EEC90();
static void sub_80ED620();
static void sub_80EC960();
static void sub_80ED01C();
static void sub_80ECC08();
static void sub_80ED31C();
static void sub_80ED4D8();
static void sub_80ED858();
static void sub_80EDDBC();
static void sub_80EDE70();
static void sub_80EDEE4();
static void sub_80EE06C();
static void sub_80EE294();
static void sub_80EE58C();
static void sub_80EE658();
static void sub_80EE8F4();
static void sub_80EEDC4();
static void ShowMapNamePopUpWindow(void);
static void sub_80F0954(u16, u16, u16);
static bool8 sub_80F098C(void);
static u8 *sub_80F445C(u8*, u16);
static void sub_80F081C(u8);
bool8 sub_80F0944(void);
static u8 *sub_80F4428(u8*, u16, u8);
void sub_80F700C(u8*, u16);
static void sub_80F0B24(void);
static bool8 sub_80F0B44(void);
static void sub_80F0C28(void);
static bool8 sub_80F0C48(void);
void LoadTrainerEyesDescriptionLines(void);
bool8 sub_80F0D5C(void);
static void sub_80F0EC0(void);
static bool8 sub_80F0EF4(void);
static void sub_80F0F64(void);
static void sub_80F0FA0(void);
static bool8 sub_80F0FEC(void);
static bool8 sub_80F0718(void);
void sub_80F0FFC(u8);
static void sub_80F19DC(u8*);
static bool8 sub_80F1080(void);
void sub_80F1614(void);
void DrawMonRibbonIcons(void);
void sub_80F13FC(void);
void sub_80F1438(void);
static void sub_80F1494(void);
bool8 sub_80F162C(u8);
static void sub_80F01E0(u16);
static void sub_80F19FC(void);
static void sub_80F1A74(void);
static void sub_80F1A80(void);
static void sub_80F1A90(void);
static bool8 sub_80F1AC4(void);
static void sub_80F1B8C(u8);
static bool8 sub_80F1BC8(u8);
static void sub_80F2458(u8);
static void sub_80F2514(u8);
static void sub_80F1DF0(void);
static void sub_80F2218(struct Sprite *sprite);
static bool8 sub_80F1E50(void);
static bool8 sub_80F22F8(void);
static void sub_80F2108(void);
static bool8 sub_80F1E6C(void);
static void sub_80F1E84(void);
static void sub_80F2148(void);
static void sub_80F2240(struct Sprite *sprite);
static bool8 sub_80F1F10(void);
static bool8 sub_80F2360(void);
static void sub_80F2170(void);
static bool8 sub_80F23C8(void);
static void sub_80F21F8(void);
static void sub_80F1FF0(void);
static void sub_80F208C(void);
static void sub_80F22B0(struct Sprite *sprite);
static void sub_80F240C(struct Sprite *sprite);
static void sub_80F2598(void);
static void sub_80F2620(void);
static bool8 sub_80F26BC(void);
static void sub_80F2C58(struct Sprite *sprite);
static void sub_80F2D04(u8);
static void sub_80F2D6C(u8);
static void sub_80F2DD8(void);
static void sub_80F2DF4(void);
static void sub_80F2FEC(struct Sprite *sprite);
static void sub_80F2FB0(void);
static void sub_80F3008(u8);
static void sub_80F3130(void);
static void sub_80F3264(void);
static void sub_80F3294(u8);
static void sub_80F35B4(void);
static void sub_80F363C(struct Sprite *sprite);
static void SetMonMarkings(u16, u16, u8);
static void sub_80F36F0(void);
static bool8 sub_80F3724(void);
static void sub_80F379C(void);
static bool8 sub_80F37D0(void);
static void sub_80F38B8(void);
static bool8 sub_80F38EC(void);
static void sub_80F3970(void);
static bool8 sub_80F39A4(void);
static void sub_80F3B00(void);
static bool8 sub_80F3B58(void);
static void sub_80F3B94(void);
static bool8 sub_80F3BD4(void);
static void sub_80F3C2C(void);
static void sub_80F3F20(u8, u8);
static void sub_80F3FAC(void);
static void sub_80F3FF0(void);
static bool8 sub_80F4024(void);
static void sub_80F42C4(u8*);
static void sub_80F4394(void);
u8 *sub_80F6514(u8*, u16, u8);
static u8 *sub_80F443C(u8 *, u16);
void sub_80F55AC(u8*, struct UnkPokenav11 *);
static void sub_80F4CF0(void);
static void sub_80F4D44(void);
static bool8 sub_80F4D88(void);
static void sub_80F53EC(struct UnkPokenav11*, struct UnkPokenav11*);
static bool8 sub_80F5504(void);
static bool8 sub_80F5264(void);
static bool8 sub_80F52F8(void);
static bool8 sub_80F5364(void);

extern void sub_80F0900(void);
extern void sub_80F01A4(void);
extern void sub_80EFD3C(void);
extern void sub_8095C8C();
extern void sub_80EFDA0(void);
extern void sub_80EFD74(void);
extern bool8 sub_80EFC64(void);
extern void sub_80EFC3C(void);
extern void sub_80EF624(const u16 *, const u16 *, u8, u8, u16 *);
extern void sub_80EF7D4(void);
extern void sub_80EF54C(u8);
extern void sub_80EF58C(u8);
extern void sub_80F6FFC();
extern void sub_80F6FB8();
extern void sub_80F6DB8();
extern bool8 sub_80F6E9C();
extern bool8 sub_80F6ED4();
extern bool8 sub_80F70FC();
extern void sub_80F708C(u32);
extern void sub_80F6F10();
static extern void sub_80F15A8(void);
extern void sub_80F6A4C();
extern bool8 sub_80F6AF0();
extern u8 sub_80F68E8();
extern void sub_80F66E0();
extern void sub_80F638C();
extern bool8 sub_80F63D0();
extern void sub_80EFF34();
extern bool8 sub_80EFF68();
extern void sub_80F6134();
extern u8 sub_80F5DD4();
extern void sub_80F0264(u8);
extern bool8 sub_80F02A0();
extern void sub_80EF9F8(void);
extern bool8 sub_80EFBDC(bool8);
extern void sub_80EFBB0(void);
extern void sub_80EEFBC(u8);
extern void sub_80EF814(void);
extern void sub_80EF840(void);
extern bool8 sub_80EF874(void);
extern bool8 sub_80F6250();
extern void sub_80F6208();
extern void sub_80F6C20();
extern void sub_80EF248(u8);
extern bool8 sub_80EF284(u8);
extern void sub_80EF428(u8, u8);
extern bool8 sub_80EEF78();
extern void sub_80EBC10();
extern void sub_80EBDBC(void (*func)(void));
extern void sub_80EBBE8();
extern void sub_80EBDD8();
extern void sub_80EBD90();
extern void sub_80EBD18();
extern void sub_80FB260();
extern void sub_80EFE7C(void);
extern void sub_80F5BF0();
extern void sub_80F6F64();

extern u16 gKeyRepeatStartDelay;

void sub_80EBA5C()
{
    switch (gMain.state)
    {
    default:
        gMain.state = 0;
    case 0:
        ewram0_10.var6dac = is_c1_link_related_active();
        if (!ewram0_10.var6dac)
        {
            ewram0_10.var6dab = 0;
            gMain.state++;
            SetMainCallback2(&sub_80EBBE8);
        }
        break;
    case 1:
        SetVBlankCallback(NULL);
        break;
    case 2:
        ResetPaletteFade();
        break;
    case 3:
        ResetSpriteData();
        break;
    case 4:
        FreeAllSpritePalettes();
        break;
    case 5:
        ResetTasks();
        break;
    case 6:
        ScanlineEffect_Stop();
        break;
    case 7:
        sub_80F1A90();
        gMain.state++;
    case 8:
        if (sub_80F1AC4())
            return;
        break;
    case 9:
        sub_80F2688();
        gMain.state++;
        // fall through
    case 10:
        if (sub_80F26BC())
            return;
        break;
    case 11:
        sub_80F36F0();
        gMain.state++;
    case 12:
        if (sub_80F3724())
            return;
        break;
    case 13:
        sub_80EBC10();
        sub_80EBDBC(&sub_80EBDD8);
        break;
    case 14:
        ewram0_10.var6dab = 1;
        PlaySE(SE_PN_ON);
        SetMainCallback2(&sub_80EBD90);
        SetVBlankCallback(&sub_80EBD18);
        sub_80F1A74();
        break;
    }

    gMain.state++;
}

void sub_80EBBE8()
{
    while (!ewram0_10.var6dab)
        sub_80EBA5C();
}

void sub_80EBC10()
{
    u16 i;
    u16 *var1;

    gKeyRepeatStartDelay = 0x14;
    ewram0_10.playerPartyCount = CalculatePlayerPartyCount();
    ewram0_10.var6ddc = 0;
    ewram0_10.var9344 = 0;
    ewram0_10.var8768 = 0;
    ewram0_10.varCED0 = 0;

    for (i = 0; i < 5; ++i)
    {
        ewram0_10.var8fff[i] = 0;
        var1 = (u16 *)ewram0_10.var0;
        var1[i*2 + 0x4820] = 0x9B;
        var1[i*2 + 0x4821] = 0x5B;
    }

    ewram0_10.var6e95 = 0;
    sub_80EBCA8();
}

void sub_80EBCA8()
{
    ewram0_10.var6db2[0] = 1;
    ewram0_10.var6db2[1] = 2;
    ewram0_10.var6db2[2] = 3;

    if (FlagGet(FLAG_SYS_RIBBON_GET))
        ewram0_10.var6db2[3] = 4;
    else
        ewram0_10.var6db2[3] = 0;

    ewram0_10.var6db2[4] = 5;
}

void sub_80EBD18()
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_80F1FF0();
}

void sub_80EBD30()
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    UpdateRegionMapVideoRegs();
    sub_80EFE7C();
}

void sub_80EBD4C()
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_80F5BF0();
    ScanlineEffect_InitHBlankDmaTransfer();
}

void sub_80EBD68()
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_80F6F64();
}

void sub_80EBD80()
{
    LoadOam();
    ProcessSpriteCopyRequests();
}

void sub_80EBD90()
{
    ewram0_10.var300();
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
    sub_80F19FC();
}

void sub_80EBDBC(void (*func)(void))
{
    ewram0_10.var300 = func;
    ewram0_10.var304 = 0;
}

void sub_80EBDD8()
{
    switch (ewram0_10.var304)
    {
    case 0:
        SetVBlankCallback(NULL);
        REG_DISPCNT = 0;
        ewram0_10.var6dad = ewram0_10.var6ddc;
        ewram0_10.var6dae = 5;
        ewram0_10.var304++;
        break;
    case 1:
        sub_80F3FF0();
        ewram0_10.var304++;
        // fall through
    case 2:
        if (!sub_80F4024())
			ewram0_10.var304++;
        break;
    case 3:
        sub_80F2598();
        ewram0_10.var304++;
        break;
    case 4:
        sub_80EEE20();
        ewram0_10.var304++;
        // fall through
    case 5:
        if (!sub_80EEE54())
		{
			sub_80EEE08();
			ewram0_10.var304++;
		}
        break;
    case 6:
        sub_80EF248(0);
        ewram0_10.var304++;
        // fall through
    case 7:
        if (!sub_80EF284(0))
			ewram0_10.var304++;
        break;
    case 8:
        sub_80F1B8C(0);
        ewram0_10.var304++;
		// fall through
    case 9:
        if (!sub_80F1BC8(0))
			ewram0_10.var304++;
        break;
    case 10:
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 11:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 12:
        sub_80EED2C(0);
        ewram0_10.var304++;
        break;
    case 13:
        if (!gPaletteFade.active)
			ewram0_10.var304++;
        break;
    case 14:
        sub_80F2C80(0);
        ewram0_10.var304++;
        // fall through
    case 15:
        if (!sub_80F2CBC(0))
			ewram0_10.var304++;
        break;
    case 16:
        sub_80F1DF0();
        ewram0_10.var304++;
        break;
    case 17:
        if (!sub_80F1E50())
        {
            sub_80EF428(0, 0);
            sub_80EBDBC(&sub_80EC268);
#if DEBUG
			if (gLinkOpen == TRUE)
				debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
        }
        break;
    }
}

void sub_80EC00C()
{
    switch (ewram0_10.var304)
    {
    case 0:
        if (!sub_80EEF78())
        {
            SetVBlankCallback(&sub_80EBD80);
            sub_80EED1C();
            ewram0_10.var6dad = ewram0_10.var6ddc;
            ewram0_10.var6dae = 5;
            sub_80EEE08();
            ewram0_10.var304++;
        }
        break;
    case 1:
        sub_80EF248(0);
        ewram0_10.var304++;
        // fall through
    case 2:
        if (!sub_80EF284(0))
			ewram0_10.var304++;
        break;
    case 3:
        sub_80F1B8C(0);
        ewram0_10.var304++;
        // fall through
    case 4:
        if (!sub_80F1BC8(0))
			ewram0_10.var304++;
        break;
    case 5:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 6:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EED2C(0);
        ewram0_10.var304++;
        break;
    case 8:
        if (!gPaletteFade.active)
			ewram0_10.var304++;
        break;
    case 9:
        sub_80F2598();
        ewram0_10.var304++;
        break;
    case 10:
        sub_80F2C80(0);
        ewram0_10.var304++;
        // fall through
    case 11:
        if (!sub_80F2CBC(0))
			ewram0_10.var304++;
        break;
    case 12:
        sub_80F1DF0();
        ewram0_10.var304++;
        break;
    case 13:
        if (!sub_80F1E50())
        {
            sub_80EF428(0, ewram0_10.var6dad);
			sub_80EBDBC(&sub_80EC268);
#if DEBUG
			if (gLinkOpen == TRUE)
				debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
		}
		break;
    }
}

void sub_80EC210()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F2D04(1);
        sub_80EE9C0(0, ewram0_10.var6ddc, 0);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80EEA0C())
			sub_80EBDBC(&sub_80EC268);
		break;
    }
}

void sub_80EC268()
{
    u8 var1;

    switch (ewram0_10.var304)
    {
    case 0:
        if (sub_80EEC10() != 0)
        {
            PlaySE(SE_SELECT);
            sub_80EF428(0, ewram0_10.var6dad);
            sub_80EED9C();
        }
        else
        {
            if (gMain.newKeys & A_BUTTON)
            {
                ewram0_10.var6ddc = ewram0_10.var6dad;
                switch (ewram0_10.var6db2[ewram0_10.var6ddc] - 1)
                {
                case 0:
                    PlaySE(SE_SELECT);
                    sub_80EBDBC(&sub_80EC4A0);
                    break;
                case 1:
                    PlaySE(SE_SELECT);
                    sub_80EBDBC(&sub_80EC81C);
                    break;
                case 4:
                    ewram0_10.var304 = 1;
                    break;
                case 3:
                    ewram0_10.var304 = 2;
                    break;
                case 2:
                    ewram0_10.var304 = 6;
                    break;
                }
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                ewram0_10.var304 = 1;
            }
        }
        break;
    case 1:
        sub_80F208C();
        sub_80EBDBC(&sub_80EE96C);
        break;
    case 2:
        sub_80F6208();
        ewram0_10.var304++;
        // fall through
    case 3:
        if (!sub_80F6250())
			ewram0_10.var304++;
        break;
    case 4:
        if (!sub_8055870())
        {
			if (ewram0_10.var8fe8 != 0)
			{
				PlaySE(SE_SELECT);
				sub_80EBDBC(&sub_80EDB88);
			}
			else
			{
				PlaySE(0x20);
				sub_80EF428(0, 5);
				ewram0_10.var304 = 0xFF;
			}
		}
		break;
    case 6:
        sub_80F6C20();
        if (ewram0_10.varD158 != 0)
        {
            PlaySE(SE_SELECT);
            sub_80EBDBC(&sub_80EE3D8);
        }
        else
        {
            PlaySE(0x20);
            sub_80EF428(0, 6);
            ewram0_10.var304 = 0xFF;
        }
        break;
    case 0xFF:
        if ((var1 = sub_80EEC10()) != 0)
        {
            PlaySE(SE_SELECT);
            sub_80EF428(0, ewram0_10.var6dad);
            ewram0_10.var304 = 0;
            sub_80EED9C();
        }
        else if (gMain.newKeys & (A_BUTTON | B_BUTTON))
		{
			sub_80EF428(0, ewram0_10.var6dad);
			ewram0_10.var304 = var1;
		}
        break;
    }
}

void sub_80EC4A0()
{
    u32 var1;

    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F1E84();
        sub_80F2D04(0);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80F1F10())
        {
            if (gSaveBlock2.regionMapZoom)
                var1 = 0x7;
            else
				var1 = 0x8;
            sub_80EEFBC(var1);
            ewram0_10.var304++;
        }
        break;
    case 2:
        if (!sub_80EEF34())
        {
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
            ewram0_10.var304++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
			SetVBlankCallback(NULL);
			sub_80EED0C();
			ewram0_10.var304++;
		}
        break;
    case 4:
        sub_80F2620();
        ewram0_10.var304++;
        break;
    case 5:
        sub_80EF814();
        ewram0_10.var304++;
        break;
    case 6:
        sub_80EF840();
        ewram0_10.var304++;
        // fall through
    case 7:
        if (!sub_80EF874())
			ewram0_10.var304++;
        break;
    case 8:
        sub_80F2C80(0x4);
        ewram0_10.var304++;
        // fall through
    case 9:
        if (!sub_80F2CBC(0x4))
			ewram0_10.var304++;
        break;
    case 0xA:
        sub_80F2DD8();
        SetVBlankCallback(&sub_80EBD30);
        ewram0_10.var304++;
        break;
    case 0xB:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 0xC:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 0xD:
        sub_80EED2C(0x1);
#if DEBUG
		if (gLinkOpen == TRUE)
			debug_sub_8008218((void *)(VRAM + 0x75E0), 0, (void *)(VRAM + 0xF800), 4);
#endif
        ewram0_10.var304++;
        break;
    case 0xE:
        if (!gPaletteFade.active)
			sub_80EBDBC(&sub_80EC67C);
		break;
    }
}

void sub_80EC67C()
{
    switch (ewram0_10.var304)
    {
    case 0:
        switch (sub_80FAB60())
        {
        case 1:
            sub_80EED9C();
            break;
        case 3:
            sub_80EF9F8();
            break;
        case 4:
            PlaySE(SE_SELECT);
            ewram0_10.var304 = 1;
            break;
        case 5:
            PlaySE(SE_SELECT);
            ewram0_10.var304 = 4;
            break;
        }
        break;
    case 1:
        if (!ewram0_10.var6e90)
        {
            sub_80FAEC4();
            ewram0_10.var304++;
        }
        else if (!sub_80EFBDC(1))
        {
			sub_80FAEC4();
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_80FAFC0())
        {
			if (!ewram0_10.var6e90)
			{
				sub_80EFBB0();
				ewram0_10.var304 = 0;
			}
			else
			{
				ewram0_10.var304++;
			}
		}
        break;
    case 3:
        if (!sub_80EFBDC(0))
        {
			sub_80EFBB0();
			ewram0_10.var304 = 0;
		}
        break;
    case 4:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 5:
        if (!gPaletteFade.active)
        {
			sub_80F2DF4();
			sub_80F2D04(0x4);
			gSaveBlock2.regionMapZoom = (ewram0_10.var6e90 == 1) ? 1 : 0;
			sub_80EBDBC(&sub_80EC00C);
		}
		break;
    }
#if DEBUG
	if (gLinkOpen == TRUE)
		debug_sub_8008264(gLink.recvQueue.count, 1, 1, 2, 4);
#endif
}

void sub_80EC81C()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F2D04(0);
        sub_80EE9C0(1, 0, 1);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80EEA0C())
			sub_80EBDBC(&sub_80EC86C);
		break;
    }
}

void sub_80EC86C()
{
    switch (ewram0_10.var304)
    {
    case 0:
        if (sub_80EEC90())
        {
            PlaySE(SE_SELECT);
            sub_80EF428(1, ewram0_10.var6dad);
            sub_80EED9C();
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            ewram0_10.var6df0 = ewram0_10.var6dad;
            switch (ewram0_10.var6df0)
            {
            case 0:
                sub_80EBDBC(&sub_80ED620);
                break;
            case 1:
                sub_80EBDBC(&sub_80EC960);
                break;
            case 2:
                sub_80EBDBC(&sub_80EC210);
                break;
            }
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            ewram0_10.var6df0 = 0x2;
            ewram0_10.var6dad = 0x2;
            ewram0_10.var304++;
        }
        break;
    case 1:
        if (!sub_80F1E6C())
			sub_80EBDBC(&sub_80EC210);
		break;
    }
}

void sub_80EC960()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80EE9C0(2, 0, 5);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80EEA0C())
			sub_80EBDBC(&sub_80ECC08);
		break;
    }
}

void sub_80EC9A8()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F2D04(5);
        sub_80EE9C0(1, ewram0_10.var6df0, 0xC);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80EEA0C())
        {
			sub_80EBDBC(&sub_80EC86C);
			sub_80EF428(1, ewram0_10.var6dad);
		}
		break;
    }
}

void sub_80ECA10()
{
    switch (ewram0_10.var304)
    {
    case 0:
        if (!sub_80EEF78())
        {
			SetVBlankCallback(&sub_80EBD80);
			sub_80EED1C();
			ewram0_10.var6dad = ewram0_10.var6df0;
			ewram0_10.var6dae = 3;
			sub_80EEE08();
			ewram0_10.var304++;
		}
        break;
    case 1:
        sub_80EF248(1);
        ewram0_10.var304++;
    case 2:
        if (!sub_80EF284(1))
			ewram0_10.var304++;
        break;
    case 3:
        sub_80F1B8C(1);
        ewram0_10.var304++;
    case 4:
        if (!sub_80F1BC8(1))
			ewram0_10.var304++;
        break;
    case 5:
        if (sub_8055870()) return;
        ewram0_10.var304++;
        break;
    case 6:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EED2C(0);
        ewram0_10.var304++;
        break;
    case 8:
        sub_80F2598();
        ewram0_10.var304++;
        break;
    case 9:
        if (!gPaletteFade.active)
			ewram0_10.var304++;
        break;
    case 10:
        sub_80F2C80(1);
        ewram0_10.var304++;
		// fall through
    case 11:
        if (!sub_80F2CBC(1))
			ewram0_10.var304++;
        break;
    case 12:
        sub_80F1DF0();
        ewram0_10.var304++;
        break;
    case 13:
        if (!sub_80F1E50())
        {
			sub_80EF428(1, ewram0_10.var6dad);
			sub_80EBDBC(&sub_80EC86C);
#if DEBUG
			if (gLinkOpen == TRUE)
				debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
		}
		break;
    }
}

void sub_80ECC08()
{
    switch (ewram0_10.var304)
    {
    case 0:
        if (sub_80EEC90())
        {
            PlaySE(SE_SELECT);
            sub_80EF428(2, ewram0_10.var6dad);
            sub_80EED9C();
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            switch ((s8)ewram0_10.var6dad)
            {
            case 0:
                ewram0_10.var87D8 = 22;
                break;
            case 1:
                ewram0_10.var87D8 = 23;
                break;
            case 2:
                ewram0_10.var87D8 = 24;
                break;
            case 3:
                ewram0_10.var87D8 = 33;
                break;
            case 4:
                ewram0_10.var87D8 = 47;
                break;
            case 5:
                sub_80EBDBC(&sub_80EC9A8);
                return;
            }

            ewram0_10.var6dfc = ewram0_10.var6dad;
            ewram0_10.var76aa = 1;
            sub_80EBDBC(&sub_80ED01C);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            ewram0_10.var6dad = 0x5;
            ewram0_10.var304++;
        }
        break;
    case 1:
        if (!sub_80F1E6C())
			sub_80EBDBC(&sub_80EC9A8);
        break;
    }
}

void sub_80ECD80()
{
    switch (ewram0_10.var304)
    {
    case 0:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 1:
        if (!gPaletteFade.active)
			ewram0_10.var304++;
        break;
    case 2:
        if (!sub_80EEF78())
        {
			SetVBlankCallback(&sub_80EBD80);
			ewram0_10.var304++;
		}
        break;
    case 3:
        sub_80EED1C();
        sub_80F3130();
        ewram0_10.var304++;
        break;
    case 4:
        sub_80F2D6C(0x1);
        ewram0_10.var304++;
        break;
    case 5:
        sub_80F2D6C(0x5);
        ewram0_10.var304++;
        break;
    case 6:
        ewram0_10.var6dad = ewram0_10.var6dfc;
        ewram0_10.var6dae = 0x6;
        sub_80EEE08();
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EF248(0x2);
        ewram0_10.var304++;
        // fall through
    case 8:
        if (!sub_80EF284(0x2))
			ewram0_10.var304++;
        break;
    case 9:
        sub_80F1B8C(2);
        ewram0_10.var304++;
        // fall through
    case 10:
        if (!sub_80F1BC8(2))
			ewram0_10.var304++;
        break;
    case 11:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 12:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 13:
        sub_80EED2C(0);
        ewram0_10.var304++;
        break;
    case 14:
        sub_80F2598();
        ewram0_10.var304++;
        break;
    case 15:
        if (!gPaletteFade.active)
			ewram0_10.var304++;
        break;
    case 16:
        sub_80F2C80(0x1);
        ewram0_10.var304++;
        // fall through
    case 17:
        if (!sub_80F2CBC(0x1))
        {
			ewram0_10.var306 = 0;
			ewram0_10.var304++;
		}
        break;
    case 18:
        sub_80F2C80(0x5);
        ewram0_10.var304++;
        // fall through
    case 19:
        if (!sub_80F2CBC(0x5))
        {
			sub_80F1DF0();
			ewram0_10.var304++;
		}
        break;
    case 20:
        if (!sub_80F1E50())
		{
			sub_80EF428(2, ewram0_10.var6dad);
			sub_80EBDBC(&sub_80ECC08);
#if DEBUG
			if (gLinkOpen == TRUE)
				debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
		}
		break;
    }
}

void sub_80ED01C()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F1E84();
        sub_80F2D04(0x1);
        sub_80F2D04(0x5);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80F1F10())
        {
			sub_80EEFBC(0);
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_80EEF34())
        {
			BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
			ewram0_10.var304++;
		}
        break;
    case 3:
        if (!gPaletteFade.active)
        {
			SetVBlankCallback(NULL);
			sub_80EED0C();
			sub_80EF814();
			ewram0_10.var304++;
		}
        break;
    case 4:
        sub_80F2620();
        ewram0_10.var304++;
        break;
    case 5:
        sub_80F4D44();
        ewram0_10.var304++;
        // fall through
    case 6:
        if (!sub_80F4D88())
            ewram0_10.var304 += 2;
        else
			ewram0_10.var304 += 1;
        break;
    case 7:
        if (!sub_8055870())
			ewram0_10.var304--;
        break;
    case 8:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 9:
        sub_80F0264(0);
        ewram0_10.var304++;
        // fall through
    case 10:
        if (!sub_80F02A0())
			ewram0_10.var304++;
        break;
    case 11:
        sub_80F3008(0);
        ewram0_10.var304++;
        break;
    case 12:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 13:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 14:
        sub_80EED2C(0x4);
        ewram0_10.var304++;
        break;
    case 15:
        if (!gPaletteFade.active)
        {
			ewram0_10.var306 = 0;
			ewram0_10.var304++;
		}
        break;
    case 16:
        sub_80F2C80(0x1);
        ewram0_10.var304++;
        // fall through
    case 17:
        if (!sub_80F2CBC(0x1))
        {
			ewram0_10.var306 = 0;
			ewram0_10.var304++;
		}
        break;
    case 18:
        sub_80F2C80(ewram0_10.var6dfc + 7);
        ewram0_10.var304++;
        // fall through
    case 19:
        if (!sub_80F2CBC(ewram0_10.var6dfc + 7))
		{
			sub_80EBDBC(&sub_80ED31C);
#if DEBUG
			if (gLinkOpen == TRUE)
				debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
		}
        break;
    }
}

void sub_80ED31C()
{
    switch (ewram0_10.var304)
    {
    case 0:
        switch (sub_80F5DD4())
        {
        case 1:
            PlaySE(SE_SELECT);
            ShowMapNamePopUpWindow();
            return;
        case 2:
            PlaySE(SE_SELECT);
            ewram0_10.var304++;
            return;
        default:
            if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80ED4D8);
				return;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80ECD80);
				return;
            }
            break;
        }
        break;
    case 1:
        if (!sub_80F0718())
        {
			ShowMapNamePopUpWindow();
			sub_80F3264();
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_8055870())
			ewram0_10.var304 = 0;
        break;
    }
#if DEBUG
	if (gLinkOpen == TRUE)
		debug_sub_8008264(gLink.recvQueue.count, 1, 8, 2, 4);
#endif
}

void sub_80ED3D0()
{
    switch (ewram0_10.var304)
    {
    case 0:
        SetVBlankCallback(NULL);
        ewram0_10.var304++;
        break;
    case 1:
        sub_80EED0C();
        sub_80F6134();
        ewram0_10.var304++;
        break;
    case 2:
        sub_80EEFBC(0);
        ewram0_10.var304++;
        break;
    case 3:
        sub_80F0264(0);
        ewram0_10.var304++;
        // fall through
    case 4:
        if (!sub_80F02A0())
			ewram0_10.var304++;
        break;
    case 5:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 6:
        sub_80F3008(0);
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EED2C(0x4);
        ewram0_10.var304++;
#if DEBUG
		if (gLinkOpen == TRUE)
			debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
        break;
    case 8:
        if (!gPaletteFade.active)
			sub_80EBDBC(&sub_80ED31C);
		break;
    }
}

void sub_80ED4D8()
{
    switch (ewram0_10.var304)
    {
    case 0:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
			SetVBlankCallback(NULL);
			sub_80EED0C();
			sub_80F3130();
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 3:
        sub_80F4CF0();
        ewram0_10.var304++;
        break;
    case 4:
        sub_80EFF34();
        ewram0_10.var304++;
        // fall through
    case 5:
        if (!sub_80EFF68())
			ewram0_10.var304++;
        break;
    case 6:
        sub_80F35B4();
        sub_80EEFBC(0x2);
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(sub_80EBD4C);
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EED2C(0x2);
        ewram0_10.var304++;
#if DEBUG
		if (gLinkOpen == TRUE)
			debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF000), 4);
#endif
        break;
    case 8:
        if (!gPaletteFade.active)
			sub_80EBDBC(&sub_80ED858);
        break;
    }
}

void sub_80ED620()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F1E84();
        sub_80F2D04(0x1);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80F1F10())
        {
			sub_80EEFBC(0x1);
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_80EEF34())
        {
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0x0, 16, RGB(0, 0, 0));
            ewram0_10.var304++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
			SetVBlankCallback(NULL);
			sub_80EED0C();
			sub_80EF814();
			ewram0_10.var76aa = 0;
			ewram0_10.var304++;
		}
        break;
    case 4:
        sub_80F2620();
        ewram0_10.var304++;
        break;
    case 5:
        ewram0_10.varD162 = 0x2;
        sub_80F4BD0();
        ewram0_10.var304++;
        break;
    case 6:
        sub_80EFF34();
        ewram0_10.var304++;
        // fall through
    case 7:
        if (!sub_80EFF68())
			ewram0_10.var304++;
        break;
    case 8:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 9:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 10:
        sub_80F33A8();
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD4C);
        ewram0_10.var304++;
        break;
    case 11:
        sub_80EED2C(0x2);
        ewram0_10.var304++;
        break;
    case 12:
        if (!gPaletteFade.active)
			ewram0_10.var304++;
        break;
    case 13:
        sub_80F2C80(0x1);
        ewram0_10.var304++;
    case 14:
        if (!sub_80F2CBC(0x1))
			ewram0_10.var304++;
        break;
    case 15:
        sub_80F2C80(0x6);
        ewram0_10.var304++;
        // fall through
    case 16:
        if (!sub_80F2CBC(0x6))
		{
			sub_80EBDBC(&sub_80ED858);
#if DEBUG
			if (gLinkOpen == TRUE)
				debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF000), 4);
#endif
		}
        break;
    }
}

#if 0
void sub_80F4F78();
void sub_80F0174(u32);
bool8 sub_80F4FB4();
void sub_80F3668();
bool8 sub_80F7500();
void sub_80F3698();
bool8 sub_80F5038();
void sub_80F2F48();
void sub_80F3CE8();
void sub_80F3614();
void sub_80F357C();
void sub_80F4FDC();

void sub_80ED858() {
    u8 var1;
    switch (ewram0_10.var304) {
    case 0:
        sub_80F4F78();
        sub_80F5B38();
        ewram0_10.var304 = 0x1;
        break;
    case 1:
        if (sub_80F5B50()) return;
        ewram0_10.var304 = 0x2;
        break;
    case 2:
        sub_80F0174(0x1);
        ewram0_10.var304 = 0x3;
        break;
    case 3:
        if (sub_80F4FB4()) return;
        sub_80F3C94();
        sub_80F3D00();
        ewram0_10.var304 = 0x4;
        break;
    case 4:
        if ( (gMain.heldKeys & 0x40) && (ewram0_10.var87CB) && (!(ewram0_10.var76aa) || (ewram0_10.var87DC)) ) {
            PlaySE(SE_SELECT);
            sub_80F5060(0x1);
            move_anim_execute();
            ewram0_10.var304 = 0x5;
        }
        else if ( (gMain.heldKeys & 0x80) && (ewram0_10.var87CB) && (!(ewram0_10.var76aa) || (ewram0_10.var76aa >= ewram0_10.var87DC)) ) {
            PlaySE(SE_SELECT);
            sub_80F5060(0);
            move_anim_execute();
            ewram0_10.var304 = 0x5;
        }
        if (gMain.newKeys & B_BUTTON) {
            PlaySE(SE_SELECT);
            sub_80F4FDC();
            move_anim_execute();
            ewram0_10.var304 = 0x9;
        }
        else if (gMain.newKeys & A_BUTTON) {
            if (ewram0_10.var76aa) {
                if (ewram0_10.var6dac) {
                    PlaySE(SE_SELECT);
                    ewram0_10.var304 = 0x7;
                }
            }
            else if ((ewram0_10.var87DC == ewram0_10.var87DA - 1)) {
                PlaySE(SE_SELECT);
                ewram0_10.var304 = 0x9;
            }
        }

/*
        if (gMain.heldKeys & 0x40) {
            if (ewram0_10.var87CB) {
                if (ewram0_10.var76aa) {
                    if (!ewram0_10.var87DC) goto label1;
                }
                PlaySE(SE_SELECT);
                sub_80F5060(0x1);
                move_anim_execute();
                ewram0_10.var304 = 0x5;

            }
            else goto label1;
        }
        else goto label1;
        break;
label1:
        if (gMain.heldKeys & 0x80) {
            if (ewram0_10.var87CB) {
                if (ewram0_10.var76aa) {
                    if (!(ewram0_10.var76aa < ewram0_10.var87DC)) goto label2;
                }
                PlaySE(SE_SELECT);
                sub_80F5060(0x1);
                move_anim_execute();
                ewram0_10.var304 = 0x5;
            }
            else goto label2;
        }
        else goto label2;
        break;
label2:
        if (gMain.newKeys & B_BUTTON) {
            PlaySE(SE_SELECT);
            sub_80F4FDC();
            move_anim_execute();
            ewram0_10.var304 = 0x9;
        }
        else if (gMain.newKeys & A_BUTTON) {
            if (!ewram0_10.var76aa) {
                if ((ewram0_10.var87DC == ewram0_10.var87DA - 1)) {
                    PlaySE(SE_SELECT);
                    ewram0_10.var304 = 0x9;
                }
            }
            else {
                PlaySE(SE_SELECT);
                ewram0_10.var304 = 0x9;
            }
        }
*/
        break;

    case 5:
        if (gpu_sync_bg_show()) return;
        sub_80F3D00();
        ewram0_10.var304 = 0x6;
        break;
    case 6:
        if (sub_8055870()) return;
        ewram0_10.var304 = 0x4;
        break;
    case 7:
        sub_80EEFBC(0x3);
        sub_80F3668();
        ewram0_10.var304 = 0x8;
        break;
    case 8:
        if (sub_80F7500()) return;
        sub_80EEFBC(0x2);
        sub_80F3698();
        ewram0_10.var304 = 0x4;
        break;
    case 9:
        if (!(var1 = sub_80F5038())) {
            sub_80F0174(0);
            sub_80F2F48();
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0x0, 0x10, var1);
            ewram0_10.var304 = 0xB;
        }
        break;
    case 0xA:
        if (gPaletteFade.active) return;
        sub_80F3CE8();
        sub_80F5BDC();
        if (!ewram0_10.var76aa) {
            sub_80F357C();
            sub_80F2D6C(0x1);
            sub_80F2D6C(0x6);
            sub_80EBDBC(&sub_80ECA10);
        }
        else {
            sub_80F3614();
            sub_80EBDBC(&sub_80ED3D0);
        }
        break;
    }

}
#else
#if DEBUG
NAKED
void sub_80ED858()
{
    asm("\
	push	{r4, r5, lr}\n\
	add	sp, sp, #0xfffffffc\n\
	ldr	r1, ._917       @ gSharedMem\n\
	mov	r2, #0xc1\n\
	lsl	r2, r2, #0x2\n\
	add	r0, r1, r2\n\
	ldrh	r0, [r0]\n\
	add	r5, r1, #0\n\
	cmp	r0, #0xb\n\
	bls	._915	@cond_branch\n\
	b	._999\n\
._915:\n\
	lsl	r0, r0, #0x2\n\
	ldr	r1, ._917 + 4   @ \n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	pc, r0\n\
._918:\n\
	.align	2, 0\n\
._917:\n\
	.word	gSharedMem\n\
	.word	._919\n\
._919:\n\
	.word	._920\n\
	.word	._921\n\
	.word	._922\n\
	.word	._923\n\
	.word	._924\n\
	.word	._925\n\
	.word	._926\n\
	.word	._927\n\
	.word	._928\n\
	.word	._929\n\
	.word	._999\n\
	.word	._931\n\
._920:\n\
	bl	sub_80F4F78\n\
	bl	sub_80F5B38\n\
	ldr	r0, ._933       @ gSharedMem\n\
	mov	r4, #0xc1\n\
	lsl	r4, r4, #0x2\n\
	add	r0, r0, r4\n\
	mov	r1, #0x1\n\
	strh	r1, [r0]\n\
	b	._999\n\
._934:\n\
	.align	2, 0\n\
._933:\n\
	.word	gSharedMem\n\
._921:\n\
	bl	sub_80F5B50\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._935	@cond_branch\n\
	b	._999\n\
._935:\n\
	ldr	r0, ._938       @ gSharedMem\n\
	mov	r1, #0xc1\n\
	lsl	r1, r1, #0x2\n\
	add	r0, r0, r1\n\
	mov	r1, #0x2\n\
	strh	r1, [r0]\n\
	b	._999\n\
._939:\n\
	.align	2, 0\n\
._938:\n\
	.word	gSharedMem\n\
._922:\n\
	mov	r0, #0x1\n\
	bl	sub_80F0174\n\
	ldr	r0, ._941       @ gSharedMem\n\
	mov	r2, #0xc1\n\
	lsl	r2, r2, #0x2\n\
	add	r0, r0, r2\n\
	mov	r1, #0x3\n\
	strh	r1, [r0]\n\
	b	._999\n\
._942:\n\
	.align	2, 0\n\
._941:\n\
	.word	gSharedMem\n\
._923:\n\
	bl	sub_80F4FB4\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._943	@cond_branch\n\
	b	._999\n\
._943:\n\
	bl	sub_80F3C94\n\
	bl	sub_80F3D00\n\
	b	._945\n\
._924:\n\
	ldr	r2, ._951       @ gMain\n\
	ldrh	r1, [r2, #0x2c]\n\
	mov	r0, #0x40\n\
	and	r0, r0, r1\n\
	add	r3, r2, #0\n\
	cmp	r0, #0\n\
	beq	._949	@cond_branch\n\
	ldr	r1, ._951 + 4   @ 0x87cb\n\
	add	r0, r5, r1\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._949	@cond_branch\n\
	ldr	r2, ._951 + 8   @ 0x76aa\n\
	add	r0, r5, r2\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._948	@cond_branch\n\
	ldr	r4, ._951 + 12  @ 0x87dc\n\
	add	r0, r5, r4\n\
	mov	r1, #0x0\n\
	ldsh	r0, [r0, r1]\n\
	cmp	r0, #0\n\
	beq	._949	@cond_branch\n\
._948:\n\
	mov	r0, #0x5\n\
	bl	PlaySE\n\
	mov	r0, #0x1\n\
	bl	sub_80F5060\n\
	bl	move_anim_execute\n\
	mov	r2, #0xc1\n\
	lsl	r2, r2, #0x2\n\
	add	r1, r5, r2\n\
	b	._950\n\
._952:\n\
	.align	2, 0\n\
._951:\n\
	.word	gMain\n\
	.word	0x87cb\n\
	.word	0x76aa\n\
	.word	0x87dc\n\
._949:\n\
	ldrh	r1, [r3, #0x2c]\n\
	mov	r0, #0x80\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._956	@cond_branch\n\
	ldr	r4, ._958       @ 0x87cb\n\
	add	r0, r5, r4\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._956	@cond_branch\n\
	ldr	r1, ._958 + 4   @ 0x76aa\n\
	add	r0, r5, r1\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._955	@cond_branch\n\
	ldr	r2, ._958 + 8   @ 0x87dc\n\
	add	r0, r5, r2\n\
	sub	r4, r4, #0x57\n\
	add	r1, r5, r4\n\
	mov	r4, #0x0\n\
	ldsh	r2, [r0, r4]\n\
	mov	r4, #0x0\n\
	ldsh	r0, [r1, r4]\n\
	cmp	r2, r0\n\
	bge	._956	@cond_branch\n\
._955:\n\
	mov	r0, #0x5\n\
	bl	PlaySE\n\
	mov	r0, #0x0\n\
	bl	sub_80F5060\n\
	bl	move_anim_execute\n\
	mov	r0, #0xc1\n\
	lsl	r0, r0, #0x2\n\
	add	r1, r5, r0\n\
._950:\n\
	mov	r0, #0x5\n\
	strh	r0, [r1]\n\
	b	._999\n\
._959:\n\
	.align	2, 0\n\
._958:\n\
	.word	0x87cb\n\
	.word	0x76aa\n\
	.word	0x87dc\n\
._956:\n\
	ldrh	r2, [r3, #0x2e]\n\
	mov	r0, #0x2\n\
	and	r0, r0, r2\n\
	cmp	r0, #0\n\
	beq	._960	@cond_branch\n\
	mov	r0, #0x5\n\
	bl	PlaySE\n\
	bl	sub_80F4FDC\n\
	bl	move_anim_execute\n\
	ldr	r0, ._962       @ gSharedMem\n\
	mov	r1, #0xc1\n\
	lsl	r1, r1, #0x2\n\
	add	r0, r0, r1\n\
	mov	r1, #0x9\n\
	strh	r1, [r0]\n\
	b	._999\n\
._963:\n\
	.align	2, 0\n\
._962:\n\
	.word	gSharedMem\n\
._960:\n\
	mov	r0, #0x1\n\
	and	r0, r0, r2\n\
	cmp	r0, #0\n\
	bne	._964	@cond_branch\n\
	b	._999\n\
._964:\n\
	add	r4, r5, #0\n\
	ldr	r2, ._970       @ 0x76aa\n\
	add	r0, r4, r2\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._966	@cond_branch\n\
	ldr	r1, ._970 + 4   @ 0x87dc\n\
	add	r0, r4, r1\n\
	mov	r2, #0x0\n\
	ldsh	r1, [r0, r2]\n\
	ldr	r2, ._970 + 8   @ 0x87da\n\
	add	r0, r4, r2\n\
	mov	r2, #0x0\n\
	ldsh	r0, [r0, r2]\n\
	sub	r0, r0, #0x1\n\
	cmp	r1, r0\n\
	beq	._967	@cond_branch\n\
	b	._999\n\
._967:\n\
	mov	r0, #0x5\n\
	bl	PlaySE\n\
	mov	r0, #0xc1\n\
	lsl	r0, r0, #0x2\n\
	add	r1, r4, r0\n\
	mov	r0, #0x9\n\
	strh	r0, [r1]\n\
	b	._999\n\
._971:\n\
	.align	2, 0\n\
._970:\n\
	.word	0x76aa\n\
	.word	0x87dc\n\
	.word	0x87da\n\
._966:\n\
	ldr	r1, ._975       @ 0x6dac\n\
	add	r0, r5, r1\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	beq	._972	@cond_branch\n\
	b	._999\n\
._972:\n\
	mov	r0, #0x5\n\
	bl	PlaySE\n\
	mov	r2, #0xc1\n\
	lsl	r2, r2, #0x2\n\
	add	r1, r5, r2\n\
	mov	r0, #0x7\n\
	strh	r0, [r1]\n\
	b	._999\n\
._976:\n\
	.align	2, 0\n\
._975:\n\
	.word	0x6dac\n\
._925:\n\
	bl	gpu_sync_bg_show\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._977	@cond_branch\n\
	b	._999\n\
._977:\n\
	bl	sub_80F3D00\n\
	ldr	r0, ._980       @ gSharedMem\n\
	mov	r4, #0xc1\n\
	lsl	r4, r4, #0x2\n\
	add	r0, r0, r4\n\
	mov	r1, #0x6\n\
	strh	r1, [r0]\n\
	b	._999\n\
._981:\n\
	.align	2, 0\n\
._980:\n\
	.word	gSharedMem\n\
._926:\n\
	bl	sub_8055870\n\
	cmp	r0, #0\n\
	bne	._999	@cond_branch\n\
	ldr	r0, ._984       @ gSharedMem\n\
	mov	r1, #0xc1\n\
	lsl	r1, r1, #0x2\n\
	add	r0, r0, r1\n\
	b	._983\n\
._985:\n\
	.align	2, 0\n\
._984:\n\
	.word	gSharedMem\n\
._927:\n\
	mov	r0, #0x3\n\
	bl	sub_80EEFBC\n\
	bl	sub_80F3668\n\
	ldr	r0, ._987       @ gSharedMem\n\
	mov	r2, #0xc1\n\
	lsl	r2, r2, #0x2\n\
	add	r0, r0, r2\n\
	mov	r1, #0x8\n\
	strh	r1, [r0]\n\
	b	._999\n\
._988:\n\
	.align	2, 0\n\
._987:\n\
	.word	gSharedMem\n\
._928:\n\
	bl	sub_80F7500\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	bne	._999	@cond_branch\n\
	mov	r0, #0x2\n\
	bl	sub_80EEFBC\n\
	bl	sub_80F3698\n\
._945:\n\
	ldr	r0, ._991       @ gSharedMem\n\
	mov	r4, #0xc1\n\
	lsl	r4, r4, #0x2\n\
	add	r0, r0, r4\n\
._983:\n\
	mov	r1, #0x4\n\
	strh	r1, [r0]\n\
	b	._999\n\
._992:\n\
	.align	2, 0\n\
._991:\n\
	.word	gSharedMem\n\
._929:\n\
	bl	sub_80F5038\n\
	lsl	r0, r0, #0x18\n\
	lsr	r4, r0, #0x18\n\
	cmp	r4, #0\n\
	bne	._999	@cond_branch\n\
	mov	r0, #0x0\n\
	bl	sub_80F0174\n\
	bl	sub_80F2F48\n\
	ldr	r5, ._995       @ gSharedMem\n\
	mov	r1, #0xc2\n\
	lsl	r1, r1, #0x2\n\
	add	r0, r5, r1\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x1\n\
	neg	r1, r1\n\
	str	r4, [sp]\n\
	mov	r2, #0x0\n\
	mov	r3, #0x10\n\
	bl	BeginNormalPaletteFade\n\
	mov	r2, #0xc1\n\
	lsl	r2, r2, #0x2\n\
	add	r1, r5, r2\n\
	mov	r0, #0xb\n\
	strh	r0, [r1]\n\
	b	._999\n\
._996:\n\
	.align	2, 0\n\
._995:\n\
	.word	gSharedMem\n\
._931:\n\
	ldr	r0, ._1000      @ gPaletteFade\n\
	ldrb	r1, [r0, #0x7]\n\
	mov	r0, #0x80\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	bne	._999	@cond_branch\n\
	bl	sub_80F3CE8\n\
	bl	sub_80F5BDC\n\
	ldr	r0, ._1000 + 4  @ gSharedMem\n\
	ldr	r4, ._1000 + 8  @ 0x76aa\n\
	add	r0, r0, r4\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._998	@cond_branch\n\
	bl	sub_80F357C\n\
	mov	r0, #0x1\n\
	bl	sub_80F2D6C\n\
	mov	r0, #0x6\n\
	bl	sub_80F2D6C\n\
	ldr	r0, ._1000 + 12 @ sub_80ECA10\n\
	bl	sub_80EBDBC\n\
	b	._999\n\
._1001:\n\
	.align	2, 0\n\
._1000:\n\
	.word	gPaletteFade\n\
	.word	gSharedMem\n\
	.word	0x76aa\n\
	.word	sub_80ECA10+1\n\
._998:\n\
	bl	sub_80F3614\n\
	ldr	r0, ._1003      @ sub_80ED3D0\n\
	bl	sub_80EBDBC\n\
._999:\n\
	ldr	r0, ._1003 + 4  @ gLinkOpen\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0x1\n\
	bne	._1002	@cond_branch\n\
	ldr	r0, ._1003 + 8  @ gLink\n\
	ldr	r1, ._1003 + 12 @ 0xfbd\n\
	add	r0, r0, r1\n\
	ldrb	r0, [r0]\n\
	mov	r1, #0x4\n\
	str	r1, [sp]\n\
	mov	r1, #0x9\n\
	mov	r2, #0x6\n\
	mov	r3, #0x2\n\
	bl	debug_sub_8008264\n\
._1002:\n\
	add	sp, sp, #0x4\n\
	pop	{r4, r5}\n\
	pop	{r0}\n\
	bx	r0\n\
._1004:\n\
	.align	2, 0\n\
._1003:\n\
	.word	sub_80ED3D0+1\n\
	.word	gLinkOpen\n\
	.word	gLink\n\
	.word	0xfbd");
}
#else
NAKED
void sub_80ED858()
{
    asm_unified("push {r4,r5,lr}\n\
    sub sp, 0x4\n\
    ldr r1, _080ED878 @ =gSharedMem\n\
    movs r2, 0xC1\n\
    lsls r2, 2\n\
    adds r0, r1, r2\n\
    ldrh r0, [r0]\n\
    adds r5, r1, 0\n\
    cmp r0, 0xB\n\
    bls _080ED86E\n\
    b _080EDB7A\n\
_080ED86E:\n\
    lsls r0, 2\n\
    ldr r1, _080ED87C @ =_080ED880\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080ED878: .4byte gSharedMem\n\
_080ED87C: .4byte _080ED880\n\
    .align 2, 0\n\
_080ED880:\n\
    .4byte _080ED8B0\n\
    .4byte _080ED8CC\n\
    .4byte _080ED8EC\n\
    .4byte _080ED904\n\
    .4byte _080ED91A\n\
    .4byte _080EDA68\n\
    .4byte _080EDA8C\n\
    .4byte _080EDAA4\n\
    .4byte _080EDAC0\n\
    .4byte _080EDAE8\n\
    .4byte _080EDB7A\n\
    .4byte _080EDB28\n\
_080ED8B0:\n\
    bl sub_80F4F78\n\
    bl sub_80F5B38\n\
    ldr r0, _080ED8C8 @ =gSharedMem\n\
    movs r4, 0xC1\n\
    lsls r4, 2\n\
    adds r0, r4\n\
    movs r1, 0x1\n\
    strh r1, [r0]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080ED8C8: .4byte gSharedMem\n\
_080ED8CC:\n\
    bl sub_80F5B50\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080ED8D8\n\
    b _080EDB7A\n\
_080ED8D8:\n\
    ldr r0, _080ED8E8 @ =gSharedMem\n\
    movs r1, 0xC1\n\
    lsls r1, 2\n\
    adds r0, r1\n\
    movs r1, 0x2\n\
    strh r1, [r0]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080ED8E8: .4byte gSharedMem\n\
_080ED8EC:\n\
    movs r0, 0x1\n\
    bl sub_80F0174\n\
    ldr r0, _080ED900 @ =gSharedMem\n\
    movs r2, 0xC1\n\
    lsls r2, 2\n\
    adds r0, r2\n\
    movs r1, 0x3\n\
    strh r1, [r0]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080ED900: .4byte gSharedMem\n\
_080ED904:\n\
    bl sub_80F4FB4\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080ED910\n\
    b _080EDB7A\n\
_080ED910:\n\
    bl sub_80F3C94\n\
    bl sub_80F3D00\n\
    b _080EDAD4\n\
_080ED91A:\n\
    ldr r2, _080ED960 @ =gMain\n\
    ldrh r1, [r2, 0x2C]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    adds r3, r2, 0\n\
    cmp r0, 0\n\
    beq _080ED970\n\
    ldr r1, _080ED964 @ =0x000087cb\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    beq _080ED970\n\
    ldr r2, _080ED968 @ =0x000076aa\n\
    adds r0, r5, r2\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    beq _080ED948\n\
    ldr r4, _080ED96C @ =0x000087dc\n\
    adds r0, r5, r4\n\
    movs r1, 0\n\
    ldrsh r0, [r0, r1]\n\
    cmp r0, 0\n\
    beq _080ED970\n\
_080ED948:\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x1\n\
    bl sub_80F5060\n\
    bl move_anim_execute\n\
    movs r2, 0xC1\n\
    lsls r2, 2\n\
    adds r1, r5, r2\n\
    b _080ED9B8\n\
    .align 2, 0\n\
_080ED960: .4byte gMain\n\
_080ED964: .4byte 0x000087cb\n\
_080ED968: .4byte 0x000076aa\n\
_080ED96C: .4byte 0x000087dc\n\
_080ED970:\n\
    ldrh r1, [r3, 0x2C]\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080ED9CC\n\
    ldr r4, _080ED9C0 @ =0x000087cb\n\
    adds r0, r5, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    beq _080ED9CC\n\
    ldr r1, _080ED9C4 @ =0x000076aa\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    beq _080ED9A2\n\
    ldr r2, _080ED9C8 @ =0x000087dc\n\
    adds r0, r5, r2\n\
    subs r4, 0x57\n\
    adds r1, r5, r4\n\
    movs r4, 0\n\
    ldrsh r2, [r0, r4]\n\
    movs r4, 0\n\
    ldrsh r0, [r1, r4]\n\
    cmp r2, r0\n\
    bge _080ED9CC\n\
_080ED9A2:\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0\n\
    bl sub_80F5060\n\
    bl move_anim_execute\n\
    movs r0, 0xC1\n\
    lsls r0, 2\n\
    adds r1, r5, r0\n\
_080ED9B8:\n\
    movs r0, 0x5\n\
    strh r0, [r1]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080ED9C0: .4byte 0x000087cb\n\
_080ED9C4: .4byte 0x000076aa\n\
_080ED9C8: .4byte 0x000087dc\n\
_080ED9CC:\n\
    ldrh r2, [r3, 0x2E]\n\
    movs r0, 0x2\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    beq _080ED9F8\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    bl sub_80F4FDC\n\
    bl move_anim_execute\n\
    ldr r0, _080ED9F4 @ =gSharedMem\n\
    movs r1, 0xC1\n\
    lsls r1, 2\n\
    adds r0, r1\n\
    movs r1, 0x9\n\
    strh r1, [r0]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080ED9F4: .4byte gSharedMem\n\
_080ED9F8:\n\
    movs r0, 0x1\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    bne _080EDA02\n\
    b _080EDB7A\n\
_080EDA02:\n\
    adds r4, r5, 0\n\
    ldr r2, _080EDA38 @ =0x000076aa\n\
    adds r0, r4, r2\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _080EDA44\n\
    ldr r1, _080EDA3C @ =0x000087dc\n\
    adds r0, r4, r1\n\
    movs r2, 0\n\
    ldrsh r1, [r0, r2]\n\
    ldr r2, _080EDA40 @ =0x000087da\n\
    adds r0, r4, r2\n\
    movs r2, 0\n\
    ldrsh r0, [r0, r2]\n\
    subs r0, 0x1\n\
    cmp r1, r0\n\
    beq _080EDA26\n\
    b _080EDB7A\n\
_080EDA26:\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0xC1\n\
    lsls r0, 2\n\
    adds r1, r4, r0\n\
    movs r0, 0x9\n\
    strh r0, [r1]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080EDA38: .4byte 0x000076aa\n\
_080EDA3C: .4byte 0x000087dc\n\
_080EDA40: .4byte 0x000087da\n\
_080EDA44:\n\
    ldr r1, _080EDA64 @ =0x00006dac\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    beq _080EDA50\n\
    b _080EDB7A\n\
_080EDA50:\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r2, 0xC1\n\
    lsls r2, 2\n\
    adds r1, r5, r2\n\
    movs r0, 0x7\n\
    strh r0, [r1]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080EDA64: .4byte 0x00006dac\n\
_080EDA68:\n\
    bl gpu_sync_bg_show\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080EDA74\n\
    b _080EDB7A\n\
_080EDA74:\n\
    bl sub_80F3D00\n\
    ldr r0, _080EDA88 @ =gSharedMem\n\
    movs r4, 0xC1\n\
    lsls r4, 2\n\
    adds r0, r4\n\
    movs r1, 0x6\n\
    strh r1, [r0]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080EDA88: .4byte gSharedMem\n\
_080EDA8C:\n\
    bl sub_8055870\n\
    cmp r0, 0\n\
    bne _080EDB7A\n\
    ldr r0, _080EDAA0 @ =gSharedMem\n\
    movs r1, 0xC1\n\
    lsls r1, 2\n\
    adds r0, r1\n\
    b _080EDADC\n\
    .align 2, 0\n\
_080EDAA0: .4byte gSharedMem\n\
_080EDAA4:\n\
    movs r0, 0x3\n\
    bl sub_80EEFBC\n\
    bl sub_80F3668\n\
    ldr r0, _080EDABC @ =gSharedMem\n\
    movs r2, 0xC1\n\
    lsls r2, 2\n\
    adds r0, r2\n\
    movs r1, 0x8\n\
    strh r1, [r0]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080EDABC: .4byte gSharedMem\n\
_080EDAC0:\n\
    bl sub_80F7500\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _080EDB7A\n\
    movs r0, 0x2\n\
    bl sub_80EEFBC\n\
    bl sub_80F3698\n\
_080EDAD4:\n\
    ldr r0, _080EDAE4 @ =gSharedMem\n\
    movs r4, 0xC1\n\
    lsls r4, 2\n\
    adds r0, r4\n\
_080EDADC:\n\
    movs r1, 0x4\n\
    strh r1, [r0]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080EDAE4: .4byte gSharedMem\n\
_080EDAE8:\n\
    bl sub_80F5038\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0\n\
    bne _080EDB7A\n\
    movs r0, 0\n\
    bl sub_80F0174\n\
    bl sub_80F2F48\n\
    ldr r5, _080EDB24 @ =gSharedMem\n\
    movs r1, 0xC2\n\
    lsls r1, 2\n\
    adds r0, r5, r1\n\
    ldr r0, [r0]\n\
    movs r1, 0x1\n\
    negs r1, r1\n\
    str r4, [sp]\n\
    movs r2, 0\n\
    movs r3, 0x10\n\
    bl BeginNormalPaletteFade\n\
    movs r2, 0xC1\n\
    lsls r2, 2\n\
    adds r1, r5, r2\n\
    movs r0, 0xB\n\
    strh r0, [r1]\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080EDB24: .4byte gSharedMem\n\
_080EDB28:\n\
    ldr r0, _080EDB60 @ =gPaletteFade\n\
    ldrb r1, [r0, 0x7]\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080EDB7A\n\
    bl sub_80F3CE8\n\
    bl sub_80F5BDC\n\
    ldr r0, _080EDB64 @ =gSharedMem\n\
    ldr r4, _080EDB68 @ =0x000076aa\n\
    adds r0, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _080EDB70\n\
    bl sub_80F357C\n\
    movs r0, 0x1\n\
    bl sub_80F2D6C\n\
    movs r0, 0x6\n\
    bl sub_80F2D6C\n\
    ldr r0, _080EDB6C @ =sub_80ECA10\n\
    bl sub_80EBDBC\n\
    b _080EDB7A\n\
    .align 2, 0\n\
_080EDB60: .4byte gPaletteFade\n\
_080EDB64: .4byte gSharedMem\n\
_080EDB68: .4byte 0x000076aa\n\
_080EDB6C: .4byte sub_80ECA10\n\
_080EDB70:\n\
    bl sub_80F3614\n\
    ldr r0, _080EDB84 @ =sub_80ED3D0\n\
    bl sub_80EBDBC\n\
_080EDB7A:\n\
    add sp, 0x4\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080EDB84: .4byte sub_80ED3D0\n");
}
#endif
#endif

void sub_80EDB88()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F1E84();
        sub_80F2D04(0);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80F1F10())
        {
			sub_80EEFBC(0x4);
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_80EEF34())
        {
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
            ewram0_10.var304++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
			SetVBlankCallback(NULL);
			sub_80EED0C();
			sub_80EF814();
			ewram0_10.var304++;
		}
        break;
    case 4:
        sub_80F2620();
        ewram0_10.var304++;
        break;
    case 5:
        sub_80F638C();
        ewram0_10.var304++;
    case 6:
        if (!sub_80F63D0())
            ewram0_10.var304 += 2;
        else
			ewram0_10.var304 += 1;
        break;
    case 7:
        if (!sub_8055870())
			ewram0_10.var304--;
        break;
    case 8:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 9:
        sub_80F0264(0x1);
        ewram0_10.var304++;
    case 10:
        if (!sub_80F02A0())
			ewram0_10.var304++;
        break;
    case 11:
        sub_80F2C80(0x2);
        ewram0_10.var304++;
    case 12:
        if (!sub_80F2CBC(0x2))
			ewram0_10.var304++;
        break;
    case 13:
        sub_80F3008(0x1);
        ewram0_10.var304++;
        break;
    case 14:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 15:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 16:
        sub_80EED2C(0x4);
        ewram0_10.var304++;
#if DEBUG
		if (gLinkOpen == TRUE)
			debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
        break;
    case 17:
        if (!gPaletteFade.active)
			sub_80EBDBC(&sub_80EDDBC);
        break;
    }
}

void sub_80EDDBC()
{
    switch (ewram0_10.var304)
    {
    case 0:
        switch (sub_80F5DD4())
        {
        case 1:
            PlaySE(SE_SELECT);
            ShowMapNamePopUpWindow();
            return;
        case 2:
            PlaySE(SE_SELECT);
            ewram0_10.var304++;
            return;
        default:
            if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80EDEE4);
				return;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80EDE70);
				return;
            }
            break;
        }
        break;
    case 1:
        if (!sub_80F0718())
        {
			ShowMapNamePopUpWindow();
			sub_80F3264();
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_8055870())
			ewram0_10.var304 = 0;
        break;
    }
#if DEBUG
	if (gLinkOpen == TRUE)
		debug_sub_8008264(gLink.recvQueue.count, 1, 8, 2, 4);
#endif
}

void sub_80EDE70()
{
    switch (ewram0_10.var304)
    {
    case 0:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
			sub_80F3130();
			sub_80F2D6C(0x2);
			ewram0_10.var304++;
		}
        break;
    case 2:
        sub_80EBDBC(&sub_80EC00C);
        break;
    }

}

void sub_80EDEE4()
{
    switch (ewram0_10.var304)
    {
    case 0:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
			SetVBlankCallback(NULL);
			sub_80EED0C();
			sub_80F3130();
			ewram0_10.var304++;
		}
        break;
    case 2:
        sub_80F66E0();
        sub_80EEE08();
        ewram0_10.var304++;
        break;
    case 3:
        if (!sub_80F1080())
			ewram0_10.var304++;
        break;
    case 4:
        sub_80EEFBC(0x5);
        sub_80F38B8();
        ewram0_10.var304++;
    case 5:
        if (!sub_80F38EC())
			ewram0_10.var304++;
        break;
    case 6:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 7:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 8:
        sub_80EED2C(0x3);
        ewram0_10.var304++;
#if DEBUG
		if (gLinkOpen == TRUE)
			debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF000), 4);
#endif
        break;
    case 9:
        if (!gPaletteFade.active)
			ewram0_10.var304++;
        break;
    case 10:
        if (!sub_80F170C())
			sub_80EBDBC(&sub_80EE06C);
        break;
    }
}

void sub_80EE06C()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F15A8();
        ewram0_10.var304++;
        break;
    case 1:
        if ((gMain.newAndRepeatedKeys & 0x40) && (ewram0_10.var87DC))
        {
			PlaySE(SE_SELECT);
			sub_80F6A4C(-1);
			ewram0_10.var304++;
        }
		else if ((gMain.newAndRepeatedKeys & 0x80) && ewram0_10.var87DC < ewram0_10.var8774)
		{
            PlaySE(SE_SELECT);
            sub_80F6A4C(1);
            ewram0_10.var304++;
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_80EEFBC(0xB);
            ewram0_10.var304 = 0x4;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_80EBDBC(&sub_80EE294);
        }
        break;
    case 2:
        if (!sub_80F6AF0())
			ewram0_10.var304++;
        break;
    case 3:
        if (!sub_8055870())
			ewram0_10.var304 = 0;
        break;
    case 4:
        sub_80F3B00();
        ewram0_10.var304++;
        break;
    case 5:
        if (!sub_80F3B58())
		{
			sub_80F1494();
			ewram0_10.var304++;
			sub_80EED9C();
		}
        break;
    case 6:
        switch (sub_80F68E8())
        {
        case 1:
            PlaySE(SE_SELECT);
            sub_80F3B94();
            ewram0_10.var304 = 0x7;
            return;
        default:
        case 0:
            if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80F3B94();
                ewram0_10.var304 = 0x8;
            }
            break;
        }
        break;
    case 7:
        if (!sub_80F3BD4())
			ewram0_10.var304 = 0x4;
        break;
    case 8:
        if (!sub_80F3BD4())
		{
			sub_80EEFBC(0x5);
			ewram0_10.var304 = 0;
		}
        break;
    }
#if DEBUG
	if (gLinkOpen == TRUE)
		debug_sub_8008264(gLink.recvQueue.count, 1, 4, 2, 4);
#endif
}

void sub_80EE294()
{
    switch (ewram0_10.var304)
    {
    case 0:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
			SetVBlankCallback(NULL);
			sub_80EED0C();
			sub_80F3C2C();
			sub_80EEE08();
			ewram0_10.var304++;
		}
        break;
    case 2:
        sub_80F6134();
        sub_80F0264(0x1);
        ewram0_10.var304++;
    case 3:
        if (!sub_80F02A0())
			ewram0_10.var304++;
        break;
    case 4:
        sub_80EEFBC(0x4);
        sub_80F3008(0x1);
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 5:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 6:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EED2C(0x4);
        ewram0_10.var304++;
#if DEBUG
		if (gLinkOpen == TRUE)
			debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
        break;
    case 8:
        if (!gPaletteFade.active)
			sub_80EBDBC(&sub_80EDDBC);
        break;
    }
}

void sub_80EE3D8()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F1E84();
        sub_80F2D04(0);
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80F1F10())
        {
			sub_80EEFBC(0x9);
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_80EEF34())
        {
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
            ewram0_10.var304++;
        }
        break;
    case 3:
        if (!gPaletteFade.active)
        {
			SetVBlankCallback(NULL);
			sub_80EED0C();
			sub_80EF814();
			sub_80EEE08();
			ewram0_10.var304++;
		}
        break;
    case 4:
        sub_80F2620();
        ewram0_10.var304++;
        break;
    case 5:
        sub_80F0264(0x2);
        ewram0_10.var304++;
    case 6:
        if (!sub_80F02A0())
			ewram0_10.var304++;
        break;
    case 7:
        sub_80F2C80(0x3);
        ewram0_10.var304++;
    case 8:
        if (!sub_80F2CBC(0x3))
			ewram0_10.var304++;
        break;
    case 9:
        sub_80F3008(0x2);
        ewram0_10.var304++;
        break;
    case 10:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 11:
        sub_80F6F10();
        BeginNormalPaletteFade(ewram0_10.var308, -1, 16, 0, RGB(0, 0, 0));
        SetVBlankCallback(&sub_80EBD68);
        ewram0_10.var304++;
        break;
    case 12:
        sub_80EED2C(0x5);
        ewram0_10.var304++;
#if DEBUG
		if (gLinkOpen == TRUE)
			debug_sub_8008218((void *)(VRAM + 0x7DE0), 0, (void *)(VRAM + 0xF800), 4);
#endif
        break;
    case 13:
        if (!gPaletteFade.active)
			sub_80EBDBC(&sub_80EE58C);
        break;
    }
}

void sub_80EE58C()
{
    switch (ewram0_10.var304)
    {
    case 0:
        switch (sub_80F5DD4())
        {
        case 1:
            PlaySE(SE_SELECT);
            sub_80F0FFC(ewram0_10.var876E);
            return;
        case 2:
            PlaySE(SE_SELECT);
            ewram0_10.var304++;
            return;
        default:
            if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80EE658);
				return;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80EE8F4);
				return;
            }
            break;
        }
        break;
    case 1:
        if (!sub_80F0718())
        {
			sub_80F0FFC(ewram0_10.var876E);
			sub_80F3264();
			ewram0_10.var304++;
		}
        break;
    case 2:
        if (!sub_8055870())
			ewram0_10.var304 = 0;
        break;
    }
#if DEBUG
	if (gLinkOpen == TRUE)
		debug_sub_8008264(gLink.recvQueue.count, 1, 3, 2, 4);
#endif
}

void sub_80EE658()
{
    switch (ewram0_10.var304)
    {
    case 0:
        sub_80F3294(0x1);
        sub_80EEFBC(0xA);
        sub_80F0B24();
        ewram0_10.var304++;
        break;
    case 1:
        if (!sub_80F0B44())
			ewram0_10.var304++;
        break;
    case 2:
        sub_80F0F64();
        ewram0_10.var304++;
        break;
    case 3:
        if (!sub_80F0FEC())
        {
			sub_80F6FB8(0x1);
			ewram0_10.var304++;
		}
        break;
    case 4:
        sub_80F6DB8();
        ewram0_10.var304++;
        break;
    case 5:
        sub_80F700C((u8 *)(gSharedMem + 0x8788), *(u16 *)(gSharedMem + 0x8788 - 0x1A));
        sub_80F42C4((u8 *)(gSharedMem + 0x8788));
        ewram0_10.var304++;
        break;
    case 6:
        LoadTrainerEyesDescriptionLines();
        ewram0_10.var304++;
    case 7:
        if (!sub_80F6E9C() && !sub_80F0D5C())
			ewram0_10.var304++;
        break;
    case 8:
        if ((gMain.heldKeys & 0x40) && ewram0_10.var87DC)
        {
			PlaySE(SE_SELECT);
			sub_80F708C(-1);
			ewram0_10.var304 = 0x10;
        }
        else if ((gMain.heldKeys & 0x80) && ewram0_10.var87DC < ewram0_10.var8774)
        {
			PlaySE(SE_SELECT);
			sub_80F708C(1);
			ewram0_10.var304 = 0x10;
        }
		else if (gMain.newKeys & B_BUTTON)
		{
            PlaySE(SE_SELECT);
            sub_80F4394();
            sub_80F0EC0();
            ewram0_10.var304++;
        }
        break;
    case 9:
        if (!sub_80F6ED4() && !sub_80F0EF4())
        {
			sub_80F6FB8(0);
			sub_80F2FB0();
			ewram0_10.var304++;
		}
        break;
    case 10:
        sub_80F6134();
        ewram0_10.var304++;
        break;
    case 11:
        sub_80F0FA0();
        ewram0_10.var304++;
        break;
    case 12:
        if (!sub_80F0FEC())
			ewram0_10.var304++;
        break;
    case 13:
        sub_80F0C28();
        ewram0_10.var304++;
        break;
    case 14:
        if (!sub_80F0C48())
			ewram0_10.var304++;
        break;
    case 15:
        sub_80EEFBC(0x9);
        sub_80F3294(0);
        sub_80EBDBC(&sub_80EE58C);
        sub_80EED9C();
        break;
    case 16:
        if (!sub_80F70FC())
			ewram0_10.var304++;
        break;
    case 17:
        if (!sub_8055870())
			ewram0_10.var304 = 0x8;
        break;
    }
}

void sub_80EE8F4()
{
    switch (ewram0_10.var304)
    {
    case 0:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 16, RGB(0, 0, 0));
        ewram0_10.var304++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
			sub_80F3130();
			sub_80F2D6C(0x2);
			sub_80F6FFC();
			ewram0_10.var304++;
		}
        break;
    case 2:
        sub_80EBDBC(&sub_80EC00C);
        break;
    }
}

void sub_80EE96C()
{
    if (!ewram0_10.var304)
    {
        PlaySE(0x6F);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        ewram0_10.var304++;
    }
    else
    {
        if (!gPaletteFade.active)
        {
			sub_80F5BDC();
			c2_exit_to_overworld_1_sub_8080DEC();
		}
    }
}

void sub_80EE9C0(u8 param1, u8 param2, u8 param3)
{
    sub_80F1E84();
    ewram0_10.var6e14 = param1;
    ewram0_10.var6e15 = param2;
    ewram0_10.var6e16 = 0;
    ewram0_10.var6e17 = param3;
}

#if 0
bool8 sub_80EEA0C() {
    switch (ewram0_10.var6e16) {
    case 0:
        if (sub_80F1F10()) return 1;
        if (ewram0_10.var6e17 != 0xC) {
            ewram0_10.var6e16 = 0x1;
            return 1;
        }
        else {
            ewram0_10.var6e16 = 0x3;
            return 1;
        }
    case 1:
        sub_80F2C80(ewram0_10.var6e17);
        ewram0_10.var6e16++;
    case 2:
        if (sub_80F2CBC(ewram0_10.var6e17)) return 1;
        ewram0_10.var6e16++;
    case 3:

    }
}
#else
NAKED
bool8 sub_80EEA0C() {
    asm_unified(
    "push {r4,lr}\n\
    ldr r1, _080EEA28 @ =gSharedMem\n\
    ldr r2, _080EEA2C @ =0x00006e16\n\
    adds r0, r1, r2\n\
    ldrb r0, [r0]\n\
    adds r3, r1, 0\n\
    cmp r0, 0x8\n\
    bls _080EEA1E\n\
    b _080EEBFA\n\
_080EEA1E:\n\
    lsls r0, 2\n\
    ldr r1, _080EEA30 @ =_080EEA34\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080EEA28: .4byte gSharedMem\n\
_080EEA2C: .4byte 0x00006e16\n\
_080EEA30: .4byte _080EEA34\n\
    .align 2, 0\n\
_080EEA34:\n\
    .4byte _080EEA58\n\
    .4byte _080EEA98\n\
    .4byte _080EEAAE\n\
    .4byte _080EEAD4\n\
    .4byte _080EEB3E\n\
    .4byte _080EEB68\n\
    .4byte _080EEB88\n\
    .4byte _080EEBAC\n\
    .4byte _080EEBE4\n\
_080EEA58:\n\
    bl sub_80F1F10\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080EEA64\n\
    b _080EEC08\n\
_080EEA64:\n\
    ldr r1, _080EEA7C @ =gSharedMem\n\
    ldr r4, _080EEA80 @ =0x00006e17\n\
    adds r0, r1, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, 0xC\n\
    beq _080EEA88\n\
    ldr r0, _080EEA84 @ =0x00006e16\n\
    adds r1, r0\n\
    movs r0, 0x1\n\
    strb r0, [r1]\n\
    b _080EEC08\n\
    .align 2, 0\n\
_080EEA7C: .4byte gSharedMem\n\
_080EEA80: .4byte 0x00006e17\n\
_080EEA84: .4byte 0x00006e16\n\
_080EEA88:\n\
    ldr r2, _080EEA94 @ =0x00006e16\n\
    adds r1, r2\n\
    movs r0, 0x3\n\
    strb r0, [r1]\n\
    b _080EEC08\n\
    .align 2, 0\n\
_080EEA94: .4byte 0x00006e16\n\
_080EEA98:\n\
    ldr r4, _080EEAC8 @ =gSharedMem\n\
    ldr r1, _080EEACC @ =0x00006e17\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    bl sub_80F2C80\n\
    ldr r2, _080EEAD0 @ =0x00006e16\n\
    adds r4, r2\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
_080EEAAE:\n\
    ldr r4, _080EEAC8 @ =gSharedMem\n\
    ldr r1, _080EEACC @ =0x00006e17\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    bl sub_80F2CBC\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080EEAC2\n\
    b _080EEC08\n\
_080EEAC2:\n\
    ldr r2, _080EEAD0 @ =0x00006e16\n\
    adds r1, r4, r2\n\
    b _080EEB76\n\
    .align 2, 0\n\
_080EEAC8: .4byte gSharedMem\n\
_080EEACC: .4byte 0x00006e17\n\
_080EEAD0: .4byte 0x00006e16\n\
_080EEAD4:\n\
    adds r2, r3, 0\n\
    ldr r4, _080EEAF8 @ =0x00006e15\n\
    adds r0, r2, r4\n\
    ldrb r1, [r0]\n\
    subs r4, 0x68\n\
    adds r0, r2, r4\n\
    strb r1, [r0]\n\
    ldr r1, _080EEAFC @ =0x00006e14\n\
    adds r0, r2, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1\n\
    beq _080EEB14\n\
    cmp r0, 0x1\n\
    bgt _080EEB00\n\
    cmp r0, 0\n\
    beq _080EEB06\n\
    b _080EEB28\n\
    .align 2, 0\n\
_080EEAF8: .4byte 0x00006e15\n\
_080EEAFC: .4byte 0x00006e14\n\
_080EEB00:\n\
    cmp r0, 0x2\n\
    beq _080EEB20\n\
    b _080EEB28\n\
_080EEB06:\n\
    ldr r4, _080EEB10 @ =0x00006dae\n\
    adds r1, r2, r4\n\
    movs r0, 0x5\n\
    b _080EEB26\n\
    .align 2, 0\n\
_080EEB10: .4byte 0x00006dae\n\
_080EEB14:\n\
    ldr r0, _080EEB1C @ =0x00006dae\n\
    adds r1, r2, r0\n\
    movs r0, 0x3\n\
    b _080EEB26\n\
    .align 2, 0\n\
_080EEB1C: .4byte 0x00006dae\n\
_080EEB20:\n\
    ldr r2, _080EEB58 @ =0x00006dae\n\
    adds r1, r3, r2\n\
    movs r0, 0x6\n\
_080EEB26:\n\
    strb r0, [r1]\n\
_080EEB28:\n\
    ldr r4, _080EEB5C @ =gSharedMem\n\
    ldr r1, _080EEB60 @ =0x00006e14\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    bl sub_80F1B8C\n\
    ldr r2, _080EEB64 @ =0x00006e16\n\
    adds r4, r2\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
_080EEB3E:\n\
    ldr r4, _080EEB5C @ =gSharedMem\n\
    ldr r1, _080EEB60 @ =0x00006e14\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    bl sub_80F1BC8\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _080EEC08\n\
    ldr r2, _080EEB64 @ =0x00006e16\n\
    adds r1, r4, r2\n\
    b _080EEB76\n\
    .align 2, 0\n\
_080EEB58: .4byte 0x00006dae\n\
_080EEB5C: .4byte gSharedMem\n\
_080EEB60: .4byte 0x00006e14\n\
_080EEB64: .4byte 0x00006e16\n\
_080EEB68:\n\
    bl sub_8055870\n\
    cmp r0, 0\n\
    bne _080EEC08\n\
    ldr r1, _080EEB80 @ =gSharedMem\n\
    ldr r4, _080EEB84 @ =0x00006e16\n\
    adds r1, r4\n\
_080EEB76:\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    b _080EEC08\n\
    .align 2, 0\n\
_080EEB80: .4byte gSharedMem\n\
_080EEB84: .4byte 0x00006e16\n\
_080EEB88:\n\
    bl sub_80F1DF0\n\
    ldr r4, _080EEBA0 @ =gSharedMem\n\
    ldr r1, _080EEBA4 @ =0x00006e14\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    bl sub_80EF490\n\
    ldr r2, _080EEBA8 @ =0x00006e16\n\
    adds r4, r2\n\
    b _080EEBCC\n\
    .align 2, 0\n\
_080EEBA0: .4byte gSharedMem\n\
_080EEBA4: .4byte 0x00006e14\n\
_080EEBA8: .4byte 0x00006e16\n\
_080EEBAC:\n\
    bl sub_80F1E50\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _080EEC08\n\
    ldr r4, _080EEBD4 @ =gSharedMem\n\
    ldr r1, _080EEBD8 @ =0x00006e14\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    ldr r2, _080EEBDC @ =0x00006dad\n\
    adds r1, r4, r2\n\
    ldrb r1, [r1]\n\
    bl sub_80EF428\n\
    ldr r0, _080EEBE0 @ =0x00006e16\n\
    adds r4, r0\n\
_080EEBCC:\n\
    ldrb r0, [r4]\n\
    adds r0, 0x1\n\
    strb r0, [r4]\n\
    b _080EEC08\n\
    .align 2, 0\n\
_080EEBD4: .4byte gSharedMem\n\
_080EEBD8: .4byte 0x00006e14\n\
_080EEBDC: .4byte 0x00006dad\n\
_080EEBE0: .4byte 0x00006e16\n\
_080EEBE4:\n\
    bl sub_80EF4F8\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _080EEC08\n\
    ldr r1, _080EEC00 @ =gSharedMem\n\
    ldr r2, _080EEC04 @ =0x00006e16\n\
    adds r1, r2\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
_080EEBFA:\n\
    movs r0, 0\n\
    b _080EEC0A\n\
    .align 2, 0\n\
_080EEC00: .4byte gSharedMem\n\
_080EEC04: .4byte 0x00006e16\n\
_080EEC08:\n\
    movs r0, 0x1\n\
_080EEC0A:\n\
    pop {r4}\n\
    pop {r1}\n\
    bx r1\n"

    );
}
#endif

// var6dad and var6dae must be s8 in this func
bool8 sub_80EEC10()
{
    if (gMain.newKeys & 0x40)
    {
        do
        {
            if (--ewram0_11.var6dad < 0)
                ewram0_11.var6dad = ewram0_11.var6dae - 1;
        } while (!ewram0_10.var6db2[ewram0_11.var6dad]);
        return TRUE;
    }
    if (gMain.newKeys & 0x80)
    {
        do
        {
            if (++ewram0_11.var6dad >= ewram0_11.var6dae)
                ewram0_11.var6dad = 0;
        } while (!ewram0_10.var6db2[ewram0_11.var6dad]);
        return TRUE;
    }
#if DEBUG
	if (gLinkOpen == TRUE)
		debug_sub_8008264(gLink.recvQueue.count, 6, 10, 2, 4);
#endif
    return FALSE;
}

bool8 sub_80EEC90()
{
    if (gMain.newKeys & 0x40)
    {
        if (--ewram0_11.var6dad < 0)
            ewram0_11.var6dad = ewram0_11.var6dae - 1;
        return TRUE;
    }
    if (gMain.newKeys & 0x80)
    {
        if (++ewram0_11.var6dad >= ewram0_11.var6dae)
            ewram0_11.var6dad = 0;
        return TRUE;
    }
#if DEBUG
	if (gLinkOpen == TRUE)
		debug_sub_8008264(gLink.recvQueue.count, 6, 10, 2, 4);
#endif
    return FALSE;
}

void sub_80EED0C()
{
    REG_DISPCNT = 512;
}

void sub_80EED1C()
{
    REG_DISPCNT = 0x92 << 5;
}

void sub_80EED2C(u8 param1)
{
    switch (param1) {
    case 0:
        REG_DISPCNT = 0xFA << 5;
        break;
    case 1:
        REG_DISPCNT = 0x1741;
        break;
    case 3:
    case 4:
        REG_DISPCNT = 0xFA << 5;
        break;
    case 2:
        REG_DISPCNT = 0x7b40;
        break;
    case 5:
        REG_DISPCNT = 0xFD << 6;
        break;
    }
}

void sub_80EED9C(void)
{
    gUnknown_03000744 = ewram0_10.var300;
    ewram0_10.var300 = &sub_80EEDC4;
    ewram0_10.var300();
}

void sub_80EEDC4(void)
{
    if (sub_8055870() != 0x1)
        ewram0_10.var300 = gUnknown_03000744;
}

void sub_80EEDE8(void)
{
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
}

void sub_80EEE08(void)
{
    gUnknown_083DFEC4->unkD160 = 0;
}

void sub_80EEE20(void)
{
    gUnknown_083DFEC4->unkD160 = 0;
    if (!gUnknown_083DFEC4->unk6DAC)
    {
        while (sub_80EEE54())
			;
    }
}

bool8 sub_80EEE54(void)
{
    switch (gUnknown_083DFEC4->unkD160)
    {
    case 0:
        LZ77UnCompVram(gPokenavHoennMapMisc_Gfx, (void *)VRAM + 0xC000);
        break;
    case 1:
        LZ77UnCompVram(gUnknown_08E99FB0, (void *)VRAM + 0xD800);
        break;
    case 2:
        LoadPalette(gPokenavHoennMap1_Pal, 0x10, 0x20);
        break;
    case 3:
        sub_80EF58C(0);
        sub_80EF58C(1);
        sub_80EF58C(2);
        break;
    case 4:
        gUnknown_083DFEC4->unk030C = 0;
        REG_BG1HOFS = 0;
        REG_BG1VOFS = 0;
        REG_BG1CNT = 0x1B0C;
        gUnknown_083DFEC4->unkD160++;
    default:
        return FALSE;
    }
    gUnknown_083DFEC4->unkD160++;
    return TRUE;
}

bool8 sub_80EEF34(void)
{
    bool8 retVal = TRUE;

    if (gUnknown_083DFEC4->unk030C == 32)
        return FALSE;

    gUnknown_083DFEC4->unk030C += 2;
    if (gUnknown_083DFEC4->unk030C > 31)
    {
        gUnknown_083DFEC4->unk030C = 32;
        retVal = FALSE;
    }

    REG_BG1VOFS = gUnknown_083DFEC4->unk030C;
    return retVal;
}

bool8 sub_80EEF78(void)
{
    bool8 retVal = TRUE;

    if (gUnknown_083DFEC4->unk030C == 0)
        return FALSE;

    gUnknown_083DFEC4->unk030C -= 2;
    if (gUnknown_083DFEC4->unk030C <= 0)
    {
        gUnknown_083DFEC4->unk030C = 0;
        retVal = FALSE;
    }

    REG_BG1VOFS = gUnknown_083DFEC4->unk030C;
    return retVal;
}

void sub_80EEFBC(u8 a)
{
    u8 var1;

    sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 0, 0, 17, 2);

    switch (a)
    {
    case 0:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 17, 0, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 11:
        sub_809D104((void *)VRAM + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 2:
        var1 = gUnknown_083DFEC4->unk6DAC;
        if (!var1)
        {
            sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 10, 2, 10, 2);
            sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, var1, 6, 7, 2);
        }
        else
        {
            sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        }
        break;
    case 3:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 0, 4, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 4:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 20, 2, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 10, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 7:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 10, 4, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 7, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 8:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 20, 4, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 7, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 5:
    case 9:
        sub_809D104((void *)VRAM + 0xD800, 0, 22, gUnknown_08E9A100, 0, 2, 10, 2);
        sub_809D104((void *)VRAM + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    case 10:
        sub_809D104((void *)VRAM + 0xD800, 8, 22, gUnknown_08E9A100, 0, 6, 7, 2);
        break;
    }
}

void sub_80EF248(u8 a)
{
    gUnknown_083DFEC4->unkD160 = 0;

    if (!gUnknown_083DFEC4->unk6DAC)
    {
        while (sub_80EF284(a))
			;
    }
}

bool8 sub_80EF284(u8 a)
{
    switch (gUnknown_083DFEC4->unkD160)
    {
    case 0:
        sub_80EEDE8();
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7224);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E7224);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
            return TRUE;
        break;
    case 4:
        DmaCopy16Defvars(3, gUnknown_083DFEEC, (void *)VRAM + 0x5000, 0xA0);
        break;
    case 5:
        LZ77UnCompVram(gUnknown_083DFF8C, (void *)VRAM + 0xF800);
        break;
    case 6:
        DmaCopy16Defvars(3, gUnknown_083E005C, (void *)VRAM + 0x8000, 0x20);
        break;
    case 7:
        LZ77UnCompVram(gUnknown_083E007C, (void *)VRAM + 0xE000);
        break;
    case 8:
        LZ77UnCompVram(gPokenavOutlineTilemap, (void *)VRAM + 0xE800);
        break;
    case 9:
        LZ77UnCompVram(gPokenavOutlineTiles, (void *)VRAM + 0x8020);
        break;
    case 10:
        sub_80EF54C(a);
        LoadPalette(gUnknown_083DFECC, 0xF0, 0x20);
        LoadPalette(gPokenavOutlinePalette, 0x40, 0x20);
        sub_80EF7D4();
        break;
    case 11:
        REG_BG0CNT = 0x1F01;
        REG_BG2CNT = 0x1D0A;
        REG_BG3CNT = 0x1C0B;
        REG_BLDCNT = 0;

        gUnknown_083DFEC4->unkD160++;
        return FALSE;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unkD160++;
    return TRUE;
}

void sub_80EF428(u8 a, u8 b)
{
    u8 *tileBuffer;
    const u8 *pcText = 0;

    switch (a)
    {
    case 0:
        pcText = gUnknown_083E31B0[b];
        break;
    case 1:
        pcText = gUnknown_083E31CC[b];
        break;
    case 2:
        pcText = gUnknown_083E31D8[b];
        break;
    }

    tileBuffer = gUnknown_083DFEC8;
    AlignStringInMenuWindow(&tileBuffer[0x800], pcText, 0xC0, 2);
    Menu_PrintText(&tileBuffer[0x800], 3, 17);
}

void sub_80EF490(u8 a)
{
    u16 var1, var2;

    if (a == 2)
        a = 1;

    gUnknown_083DFEC4->unkCE4E = a * 30;
    var1 = gUnknown_083DFEC4->unkCE4C;
    var2 = a * 30;
    if (var1 < var2)
        gUnknown_083DFEC4->unkCE50 = 2;
    else if (var1 > var2)
        gUnknown_083DFEC4->unkCE50 = -2;
    else
        gUnknown_083DFEC4->unkCE50 = 0;
}

bool8 sub_80EF4F8(void)
{
    u16 *palettes;

    if (gUnknown_083DFEC4->unkCE4C == gUnknown_083DFEC4->unkCE4E)
    {
        return FALSE;
    }
    else
    {
        gUnknown_083DFEC4->unkCE4C = gUnknown_083DFEC4->unkCE50 + gUnknown_083DFEC4->unkCE4C;

        palettes = gUnknown_083DFEC4->palettesCE52;
        LoadPalette(&palettes[gUnknown_083DFEC4->unkCE4C], 0x31, 4);
        return TRUE;
    }

}

void sub_80EF54C(u8 a)
{
    if (a == 2)
        a = 1;

    gUnknown_083DFEC4->unkCE4C = a * 30;
    LoadPalette(&gUnknown_083DFEC4->palettesCE52[gUnknown_083DFEC4->unkCE4C], 0x31, 4);
}

void sub_80EF58C(u8 a)
{
    u16 i;
    u16 * palettes;
    const u16 *var1;

    switch (a)
    {
    case 0:
        for (i = 0; i < 62; i++)
            gUnknown_083DFEC4->palettesCE52[i] = 0;
        break;
    case 1:
        palettes = gUnknown_083DFEC4->palettesCE52;
        var1 = gUnknown_083E003C;
        sub_80EF624(&var1[1], &var1[3], 16, 2, palettes);
        break;
    case 2:
        palettes = gUnknown_083DFEC4->palettesCE8E;
        var1 = gUnknown_083E003C;
        sub_80EF624(&var1[3], &var1[7], 16, 2, palettes);
        break;
    }
}

#ifdef NONMATCHING
void sub_80EF624(const u16 *a, const u16 *b, u8 c, u8 d, u16 *palettes)
{
    u16 red1, green1, blue1;
    u16 red2, green2, blue2;
    s32 redDiv, greenDiv, blueDiv;
    u16 *palettes2;
    u16 i, j;

    i = 0;
    while (i < d)
    {
        red1 = (*a & 0x1F) << 8;
        green1 = ((*a >> 5) & 0x1F) << 8;
        blue1 = ((*a >> 10) & 0x1F) << 8;

        red2 = (*b & 0x1F) << 8;
        green2 = ((*b >> 5) & 0x1F) << 8;
        blue2 = ((*b >> 10) & 0x1F) << 8;

        redDiv = (red2 - red1) / c;
        greenDiv = (green2 - green1) / c;
        blueDiv = (blue2 - blue1) / c;

        palettes2 = palettes;
        for (j = 0; j < c - 1; j++)
        {
            *palettes2 = (((blue1 << 8) >> 16) << 10) | (((green1 << 8) >> 16) << 5) | ((red1 << 8) >> 16);
            palettes2 += d;
            red1 += redDiv;
            green1 += greenDiv;
            blue1 += blueDiv;
        }

        *palettes2 = (red2 >> 8) | (blue2 << 2) | (green2 >> 3);
        palettes++;

        a++;
        b++;
        i++;
    }
}
#else
NAKED
void sub_80EF624(const u16 *a, const u16 *b, u8 c, u8 d, u16 *palettes)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x38\n\
    str r0, [sp]\n\
    str r1, [sp, 0x4]\n\
    ldr r4, [sp, 0x58]\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    str r2, [sp, 0x8]\n\
    lsls r3, 24\n\
    lsrs r3, 24\n\
    str r3, [sp, 0xC]\n\
    movs r0, 0\n\
    str r0, [sp, 0x10]\n\
    lsls r0, r3, 16\n\
    ldr r1, [sp, 0x10]\n\
    cmp r1, r3\n\
    bcs _080EF72E\n\
    subs r2, 0x1\n\
    str r2, [sp, 0x20]\n\
    str r0, [sp, 0x2C]\n\
_080EF654:\n\
    ldr r2, [sp]\n\
    ldrh r1, [r2]\n\
    movs r0, 0x1F\n\
    ands r0, r1\n\
    lsls r7, r0, 8\n\
    lsls r1, 16\n\
    lsrs r0, r1, 21\n\
    movs r2, 0x1F\n\
    ands r0, r2\n\
    lsls r6, r0, 8\n\
    lsrs r1, 26\n\
    ands r1, r2\n\
    lsls r5, r1, 8\n\
    ldr r0, [sp, 0x4]\n\
    ldrh r1, [r0]\n\
    movs r0, 0x1F\n\
    ands r0, r1\n\
    lsls r0, 8\n\
    str r0, [sp, 0x14]\n\
    lsls r1, 16\n\
    lsrs r0, r1, 21\n\
    ands r0, r2\n\
    lsls r0, 8\n\
    str r0, [sp, 0x18]\n\
    lsrs r1, 26\n\
    ands r1, r2\n\
    lsls r1, 8\n\
    str r1, [sp, 0x1C]\n\
    ldr r1, [sp, 0x14]\n\
    subs r0, r1, r7\n\
    ldr r1, [sp, 0x8]\n\
    bl __divsi3\n\
    mov r10, r0\n\
    ldr r2, [sp, 0x18]\n\
    subs r0, r2, r6\n\
    ldr r1, [sp, 0x8]\n\
    bl __divsi3\n\
    mov r9, r0\n\
    ldr r1, [sp, 0x1C]\n\
    subs r0, r1, r5\n\
    ldr r1, [sp, 0x8]\n\
    bl __divsi3\n\
    mov r8, r0\n\
    adds r3, r4, 0\n\
    movs r4, 0\n\
    ldr r2, [sp]\n\
    adds r2, 0x2\n\
    str r2, [sp, 0x30]\n\
    ldr r0, [sp, 0x4]\n\
    adds r0, 0x2\n\
    str r0, [sp, 0x34]\n\
    adds r1, r3, 0x2\n\
    str r1, [sp, 0x24]\n\
    ldr r2, [sp, 0x10]\n\
    adds r2, 0x1\n\
    str r2, [sp, 0x28]\n\
    ldr r0, [sp, 0x20]\n\
    cmp r4, r0\n\
    bge _080EF700\n\
    ldr r1, [sp, 0xC]\n\
    lsls r1, 1\n\
    mov r12, r1\n\
_080EF6D6:\n\
    lsls r0, r7, 8\n\
    lsrs r2, r0, 16\n\
    lsls r0, r6, 8\n\
    lsrs r1, r0, 16\n\
    lsls r0, r5, 8\n\
    lsrs r0, 16\n\
    lsls r0, 10\n\
    lsls r1, 5\n\
    orrs r0, r1\n\
    orrs r2, r0\n\
    strh r2, [r3]\n\
    add r3, r12\n\
    add r7, r10\n\
    add r6, r9\n\
    add r5, r8\n\
    adds r0, r4, 0x1\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    ldr r2, [sp, 0x20]\n\
    cmp r4, r2\n\
    blt _080EF6D6\n\
_080EF700:\n\
    ldr r4, [sp, 0x14]\n\
    lsrs r2, r4, 8\n\
    ldr r1, [sp, 0x1C]\n\
    lsls r0, r1, 2\n\
    ldr r4, [sp, 0x18]\n\
    lsrs r1, r4, 3\n\
    orrs r0, r1\n\
    orrs r2, r0\n\
    strh r2, [r3]\n\
    ldr r0, [sp, 0x30]\n\
    str r0, [sp]\n\
    ldr r1, [sp, 0x34]\n\
    str r1, [sp, 0x4]\n\
    ldr r4, [sp, 0x24]\n\
    ldr r2, [sp, 0x28]\n\
    lsls r0, r2, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x10]\n\
    ldr r1, [sp, 0x2C]\n\
    lsrs r0, r1, 16\n\
    ldr r2, [sp, 0x10]\n\
    cmp r2, r0\n\
    bcc _080EF654\n\
_080EF72E:\n\
    add sp, 0x38\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80EF740(void)
{
    gUnknown_083DFEC4->unk6DA0 = (gUnknown_083DFEC4->unk6DA0 + 1) & 1;
    if (gUnknown_083DFEC4->unk6DA0)
        gUnknown_083DFEC4->unk6DA2++;

    REG_BG3HOFS = gUnknown_083DFEC4->unk6DA2;
}

void sub_80EF780(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0 || (gUnknown_083DFEC4->unk6DA2 & 0x7) != 0)
    {
        sub_80EF740();
    }
    else
    {
        u16 value = gUnknown_083DFEC4->unk6DA2 & 0x7;
        gUnknown_083DFEC4->unk6DA2 = value;
        gUnknown_083DFEC4->unk6DA0 = value;
        REG_BG3HOFS = value;
    }
}

void sub_80EF7D4(void)
{
    gUnknown_083DFEC4->unk6DA2 = 0;
    gUnknown_083DFEC4->unk6DA0 = 0;
    gUnknown_083DFEC4->taskId6DA4 = CreateTask(sub_80EF780, 80);
}

void sub_80EF814(void)
{
    if (FuncIsActiveTask(sub_80EF780))
        DestroyTask(gUnknown_083DFEC4->taskId6DA4);
}

void sub_80EF840(void)
{
    gUnknown_083DFEC4->unkD160 = 0;

    if (gUnknown_083DFEC4->unk6DAC == 0)
    {
        while (sub_80EF874() != 0)
			;
    }
}

bool8 sub_80EF874(void)
{
    switch (gUnknown_083DFEC4->unkD160)
    {
    case 0:
        sub_80EEDE8();
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7224);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E7224);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
            return TRUE;
        break;
    case 4:
        Menu_EraseScreen();
        break;
    case 5:
        sub_80FA904(&gUnknown_083DFEC4->regionMap, gSaveBlock2.regionMapZoom ? TRUE : FALSE);
        break;
    case 6:
        if (sub_80FA940())
            return TRUE;
        break;
    case 7:
        LZ77UnCompVram(gPokenavHoennMapSquares_Gfx, (void *)VRAM + 0x5000);
        break;
    case 8:
        LoadPalette(gPokenavHoennMapSquares_Pal, 0x30, 0x20);
        sub_80EFC3C();
        break;
    case 9:
        if (sub_80EFC64())
            return TRUE;
        break;
    case 10:
        Menu_DrawStdWindowFrame(13, 3, 29, 17);
        sub_80EF9F8();
        break;
    case 11:
        if (!gUnknown_083DFEC4->regionMap.zoomed)
        {
            gUnknown_083DFEC4->unk7698 = 160;
            REG_BG0VOFS = 160;
        }
        else
        {
            gUnknown_083DFEC4->unk7698 = 256;
            REG_BG0VOFS = 0;
        }

        REG_BG0CNT = REG_BG0CNT;
        REG_BG0CNT |= 1;
        REG_BLDCNT = 0;
        break;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unkD160++;
    return TRUE;
}

asm(".include \"constants/gba_constants.inc\"\n");

void sub_80EF9F8(void)
{
    bool8 someBool = FALSE;
    u16 top = 4;
    u16 mapSectionId;
    u8 b;

    switch (gUnknown_083DFEC4->regionMap.unk16)
    {
    case 0:
        break;
    case 1:
    case 4:
        sub_8072A18(gUnknown_083DFEC4->regionMap.mapSectionName, 0x70, top * 8, 0x78, 1);
        top += 2;
        if (gLinkOpen == TRUE)
        {
            sub_80F1A80();
            someBool = TRUE;
        }
        else
        {
            u16 i;

            for (i = 0; i < 4; i++)
            {
                const u8 *secName = GetLandmarkName(
                  gUnknown_083DFEC4->regionMap.mapSectionId,
                  gUnknown_083DFEC4->regionMap.everGrandeCityArea,
                  i);

                if (secName == NULL)
                    break;
                sub_8072A18(secName, 0x70, top * 8, 0x78, 1);
                top += 2;
            }
        }
        break;
    case 2:
        sub_8072A18(gUnknown_083DFEC4->regionMap.mapSectionName, 0x70, top * 8, 0x78, 1);
        top += 2;
        mapSectionId = gUnknown_083DFEC4->regionMap.mapSectionId;
        b = gUnknown_083DFEC4->regionMap.everGrandeCityArea;
        if (gUnknown_083DFEC4->unkCDCC[mapSectionId][b] != NULL)
        {
            Menu_BlankWindowRect(14, top, 15, 15);
            Menu_BlankWindowRect(26, top, 28, 15);
            sub_8095C8C((void *)(VRAM + 0xF800), 16, 6, gUnknown_083DFEC4->unkCDCC[mapSectionId][b], 0, 0, 10, 10, 10);
            top += 11;
        }
        break;
    case 3:
        sub_8072A18(gUnknown_083DFEC4->regionMap.mapSectionName, 0x70, top * 8, 0x78, 1);
        top += 2;
        break;
    }

    // Epic fail by the compiler at optimizing this.
    if (!someBool && top < 16)
        Menu_BlankWindowRect(14, top, 28, 15);

    if (gUnknown_083DFEC4->regionMap.unk16 == 2)
        sub_80EFD74();
    else
        sub_80EFDA0();
}

void sub_80EFBB0(void)
{
    if (!gUnknown_083DFEC4->regionMap.zoomed)
        sub_80EEFBC(8);
    else
        sub_80EEFBC(7);
}

bool8 sub_80EFBDC(bool8 a)
{
    bool8 retVal = TRUE;
    u16 var1 = gUnknown_083DFEC4->unk7698;

    if (a)
    {
        if (var1 > 168)
        {
            var1 = var1 - 8;
        }
        else
        {
            var1 = 160;
            retVal = FALSE;
        }
    }
    else
    {
        if (var1 < 248)
        {
            var1 = var1 + 8;
        }
        else
        {
            var1 = 256;
            retVal = FALSE;
        }
    }

    gUnknown_083DFEC4->unk7698 = var1;
    REG_BG0VOFS = var1 & 0xFF;

    return retVal;
}

void sub_80EFC3C(void)
{
    gUnknown_083DFEC4->unkBC9A = 0;
    gUnknown_083DFEC4->unkBC9B = 0;
    sub_80EFD3C();
}

bool8 sub_80EFC64(void)
{
    u16 i;
    u8 var1;
    u16 var2;

    if (gUnknown_083DFEC4->unkBC9A >= 16)
        return FALSE;

    var1 = gUnknown_083DFEC4->unkBC9A;
    var2 = gUnknown_083DFEC4->unkBC9B;
    for (i = 0; i < 2; i++)
    {
        if (gPokenavCityMaps[var1][i] != 0)
        {
            LZ77UnCompVram(gPokenavCityMaps[var1][i], gUnknown_083DFEC4->unkBC9C[var2]);
            gUnknown_083DFEC4->unkCDCC[var1][i] = gUnknown_083DFEC4->unkBC9C[var2];
            var2++;
        }
        else
        {
            gUnknown_083DFEC4->unkCDCC[var1][i] = NULL;
        }
    }

    if (++gUnknown_083DFEC4->unkBC9A >= 16)
        return FALSE;

    gUnknown_083DFEC4->unkBC9B = var2;
    return TRUE;
}

void sub_80EFD3C(void)
{
    gUnknown_083DFEC4->unk769E = 0;
    gUnknown_083DFEC4->unk769C = 47;
    gUnknown_083DFEC4->unk769D = 0;
    gUnknown_083DFEC4->unk769A = 0;
}

void sub_80EFD74(void)
{
    gUnknown_083DFEC4->unk769E = 1;
    if (gUnknown_083DFEC4->unk769D == 1)
        gUnknown_083DFEC4->unk769D = 2;
}

void sub_80EFDA0(void)
{
    sub_8095C8C((void *)VRAM + 0xF800, 14, 16, gUnknown_08E9AC2C, 0, 0, 15, 1, 15);
    gUnknown_083DFEC4->unk769E = 0;
}

void sub_80EFDE4(u8 param0)
{
    u16 var1 = 60 - gUnknown_083DFEC4->unk769C;

    if (var1 > 15)
        var1 = 15;

    if (gUnknown_083DFEC4->unk769E != 0)
    {
        sub_8095C8C((void *)VRAM + 0xF800, 14, 16, gUnknown_08E9ABB4, gUnknown_083DFEC4->unk769C, 0, var1, 1, 60);

        if (var1 < 15)
        {
            u16 var2 = var1 + 14;

            sub_8095C8C((void *)VRAM + 0xF800, var2, 16, gUnknown_08E9ABB4, 0, 0, (u16)(15 - var1), 1, 60);
        }
    }
}

void sub_80EFE7C(void)
{
    u16 var1;
    u8 var2 = gUnknown_083DFEC4->unk769D;

    switch (var2)
    {
    case 0:
        var1 = ++gUnknown_083DFEC4->unk769C;

        if (var1 > 59)
            gUnknown_083DFEC4->unk769C = var2;

        sub_80EFDE4(gUnknown_083DFEC4->unk769E);

        switch (gUnknown_083DFEC4->unk769C)
        {
        case 0:
        case 15:
        case 30:
        case 45:
            gUnknown_083DFEC4->unk769D = 1;
            gUnknown_083DFEC4->unk769A = 0;
            break;
        }
        break;
    case 1:
        var1 = ++gUnknown_083DFEC4->unk769A;
        if (var1 > 120)
        {
            gUnknown_083DFEC4->unk769A = 0;
            gUnknown_083DFEC4->unk769D = 0;
        }
        break;
    case 2:
        sub_80EFDE4(1);
        gUnknown_083DFEC4->unk769D = 1;
        break;
    }
}

void sub_80EFF34(void)
{
    gUnknown_083DFEC4->unkD160 = 0;

    if (gUnknown_083DFEC4->unk6DAC == 0)
    {
        while (sub_80EFF68())
			;
    }
}

bool8 sub_80EFF68(void)
{
    switch (gUnknown_083DFEC4->unkD160)
    {
    case 0:
        sub_80EEDE8();
        gUnknown_083DFEC4->unkD162 = 11;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E7080);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E7080);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
            return TRUE;
        break;
    case 4:
        Menu_EraseScreen();
        break;
    case 5:
        sub_80F1614();
        break;
    case 6:
        if (sub_80F162C(0))
            return TRUE;
        break;
    case 7:
        LZ77UnCompVram(gPokenavConditionView_Gfx, (void *)VRAM + 0x5000);
        break;
    case 8:
        LZ77UnCompVram(gUnknown_08E9AC4C, (void *)VRAM + 0xF000);
        LoadPalette(gPokenavConditionMenu2_Pal, 0x20, 0x20);
        break;
    case 9:
        if (gUnknown_083DFEC4->unk76AA == 1)
            sub_8095C8C((void *)VRAM + 0xF000, 0, 5, gUnknown_083E01AC, 0, 0, 9, 4, 9);
        break;
    case 10:
        LZ77UnCompVram(gUnknown_08E9FEB4, (void *)VRAM + 0xB800);
        break;
    case 11:
        LoadPalette(gUnknown_083E0254, 0x30, 0x20);
        LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
        LoadPalette(&gPokenavConditionMenu2_Pal[2], 0xB1, 0x2);
        LoadPalette(&gPokenavConditionMenu2_Pal[16], 0xB5, 0x2);
        LoadPalette(&gPokenavConditionMenu2_Pal[30], 0xBF, 0x2);
        sub_80F01A4();
        break;
    case 12:
        sub_80F01E0(gUnknown_083DFEC4->unk8fe9);
        break;
    case 13:
        REG_BG3CNT = 0x1E03;
        REG_BG2CNT = 0x1702;
        REG_BLDCNT = 0x844;
        REG_BLDALPHA = 0x40B;
        break;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unkD160++;
    return TRUE;
}

void sub_80F0174(bool8 bg2on)
{
    if (bg2on)
        REG_DISPCNT |= DISPCNT_BG2_ON;
    else
        REG_DISPCNT &= ~DISPCNT_BG2_ON;
}

void sub_80F01A4(void)
{
    REG_WIN0H = WIN_RANGE(0, 240);
    REG_WIN1H = WIN_RANGE(0, 155);
    REG_WIN0V = WIN_RANGE(56, 121);
    REG_WIN1V = WIN_RANGE(56, 121);
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x001B;
}

static void sub_80F01E0(u16 a)
{
    Menu_PrintText(gUnknown_083DFEC4->unk8829[a], 13, 1);

    if (gUnknown_083DFEC4->unk76AA == 1)
    {
        Menu_PrintText(gUnknown_083DFEC4->unk88E9[a], 13, 3);
        sub_80F443C(gUnknown_083DFEC4->unk8788, gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].unk2);
        Menu_PrintText(gUnknown_083DFEC4->unk8788, 1, 6);
    }
}

void sub_80F0264(u8 a)
{
    gUnknown_083DFEC4->unk306 = 0;
    gUnknown_083DFEC4->unk87CA = a;

    if (gUnknown_083DFEC4->unk6DAC == 0)
    {
        while (sub_80F02A0())
			;
    }
}

bool8 sub_80F02A0(void)
{
    const u16 *pointer;

    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        sub_80EEDE8();

        gUnknown_083DFEC4->unk87C8 = gUnknown_083DFEC4->unk87CA == 1;
        gUnknown_083DFEC4->unkD162 = 11;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E70D4);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E70D4);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
        {
            return TRUE;
        }
        break;
    case 4:
        Menu_EraseScreen();
        break;
    case 5:
        LZ77UnCompVram(gUnknown_08E9FC64, (void *)VRAM + 0xE800);
        break;
    case 6:
        LZ77UnCompVram(gPokenavConditionSearch2_Gfx, (void *)VRAM + 0x8000);
        break;
    case 7:
        LoadPalette(gUnknown_083E02B4, 0xB0, 0x20);
        LoadPalette(gUnknown_083E02B4, 0xF0, 0x20);
        LoadPalette(gUnknown_083E0334, 0x40, 0x20);

        if (gUnknown_083DFEC4->unk87CA == 0)
        {
            LoadPalette(gPokenavConditionSearch2_Pal, 0x30, 0x20);
            gPlttBufferUnfaded[0] = gPokenavConditionSearch2_Pal[5];
            LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
            LoadPalette(&gUnknown_083E02B4[1], 0xB1, 0x2);
            LoadPalette(&gUnknown_083E02B4[8], 0xB5, 0x2);
            LoadPalette(&gPokenavConditionSearch2_Pal[5], 0xBF, 0x2);
        }
        else if (gUnknown_083DFEC4->unk87CA == 1)
        {
            LoadPalette(gUnknown_083E0274, 0x30, 0x20);
            gPlttBufferUnfaded[0] = gUnknown_083E0274[5];
            LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
            LoadPalette(&gUnknown_083E02B4[1], 0xB1, 0x2);
            LoadPalette(&gUnknown_083E02B4[8], 0xB5, 0x2);
            LoadPalette(&gUnknown_083E0274[5], 0xBF, 0x2);
        }
        else
        {
            LoadPalette(gUnknown_08E9F9E8, 0x30, 0x20);
            gPlttBufferUnfaded[0] = *(pointer = &gUnknown_08E9F9E8[5]);
            LoadPalette(gUnknown_083E0314, 0x50, 0x20);
            LoadPalette(&gUnknown_083E02B4[1], 0xB1, 0x2);
            LoadPalette(&gUnknown_083E02B4[8], 0xB5, 0x2);
            LoadPalette(pointer, 0xBF, 0x2);
            LoadPalette(pointer, 0x5F, 0x2);
        }
        break;
    case 8:
        if (gUnknown_083DFEC4->unk87CA != 2)
        {
            sub_8095C8C((void *)VRAM + 0xE800, 0, 5, gUnknown_08E9FD1C, 0, 0, 9, 4, 9);
        }
        else
        {
            sub_8095C8C((void *)VRAM + 0xE800, 0, 4, gUnknown_08E9FE54, 0, 0, 12, 10, 12);
            sub_8095C8C((void *)VRAM + 0xE800, 0, 8, gUnknown_08E9FD64, 0, 0, 12, 10, 12);
        }
        break;
    case 9:
        LZ77UnCompVram(gUnknown_083E0354, (void *)VRAM + 0x5000);
        break;
    case 10:
        DmaClear16(3, (void *)VRAM + 0xF800, 0x800);
        break;
    case 11:
        sub_80F0900();
        break;
    case 12:
        if (sub_80F0944())
        {
            return TRUE;
        }
        break;
    case 13:
        if (gUnknown_083DFEC4->unk87CA != 2)
        {
            ShowMapNamePopUpWindow();
        }
        else
        {
            sub_80F081C(0);
            sub_80F0FFC((u8)gUnknown_083DFEC4->unk876E);
        }
        break;
    case 14:
        REG_BG2CNT = 0x1D0A;
        REG_BG3CNT = 0x1E03;
        REG_BG0CNT = 0x1F01;
        REG_BG3VOFS = 0xF8;

        gUnknown_083DFEC4->unk8776 = 0xF8;
        gUnknown_083DFEC4->unk8778 = 0;

        REG_BLDCNT = 0;
        gUnknown_083DFEC4->unkD160++;
        return FALSE;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unk306++;
    return TRUE;
}

void sub_80F063C(s16 arg0)
{
    s16 var0;
    s16 var1;
    s16 var2;

    gUnknown_083DFEC4->unk877C = arg0 * 16;
    gUnknown_083DFEC4->unk877A = (arg0 == 1 || arg0 == -1) ? 4 : 8;
    if (arg0 < 0)
    {
        gUnknown_083DFEC4->unk877A *= -1;
        var0 = arg0 * 2 + gUnknown_083DFEC4->unk8778;
        var1 = arg0 + gUnknown_083DFEC4->unk8770;
        if (var1 < 0)
            var1 += gUnknown_083DFEC4->unk8774 + 1;

        arg0 *= -1;
    }
    else
    {
        var0 = gUnknown_083DFEC4->unk8778 + 16;
        var1 = gUnknown_083DFEC4->unk8772 + 1;
    }

    if (var1 > gUnknown_083DFEC4->unk8774)
        var1 = 0;

    var2 = var0 & 0x1F;
    sub_80F0954(var1, var2, arg0);
}

static bool8 sub_80F0718(void)
{
    if (!sub_80F098C())
    {
        if (gUnknown_083DFEC4->unk877C == 0)
            return FALSE;

        gUnknown_083DFEC4->unk877C -= gUnknown_083DFEC4->unk877A;
        gUnknown_083DFEC4->unk8776 += gUnknown_083DFEC4->unk877A;
        gUnknown_083DFEC4->unk8776 &= 0xFF;
        REG_BG3VOFS = gUnknown_083DFEC4->unk8776;
        if (gUnknown_083DFEC4->unk877C == 0)
        {
            gUnknown_083DFEC4->unk8778 = ((8 + gUnknown_083DFEC4->unk8776) & 0xFF) / 8;
            return FALSE;
        }
    }

    return TRUE;
}

static void ShowMapNamePopUpWindow(void)
{
    switch (gUnknown_083DFEC4->unk87CA)
    {
    case 0:
        sub_80F443C(gUnknown_083DFEC4->unk8788, gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk876E].unk2);
        break;
    case 1:
        sub_80F445C(gUnknown_083DFEC4->unk8788, gUnknown_083DFEC4->unk876E + 1);
        break;
    default:
        return;
    }

    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    Menu_PrintText(gUnknown_083DFEC4->unk8788, 1, 6);
}

void sub_80F081C(u8 arg0)
{
    u32 numTrainerBattles;

    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    switch (arg0)
    {
    case 0:
    case 1:
        MenuPrint_RightAligned(gOtherText_NumberRegistered, 10, 9);
        if (arg0 != 0)
            break;
        // fall through
    case 2:
        ConvertIntToDecimalStringN(
            gUnknown_083DFEC4->unk8788,
            gUnknown_083DFEC4->unk8774 + 1,
            STR_CONV_MODE_RIGHT_ALIGN,
            5);
        MenuPrint_RightAligned(gUnknown_083DFEC4->unk8788, 10, 11);
        if (arg0 != 0)
            break;
        // fall through
    case 3:
        MenuPrint_RightAligned(gOtherText_NumberBattles, 10, 13);
        if (arg0 != 0)
            break;
        // fall through
    case 4:
        numTrainerBattles = GetGameStat(GAME_STAT_TRAINER_BATTLES);
        if (numTrainerBattles > 99999)
            numTrainerBattles = 99999;

        ConvertIntToDecimalStringN(
            gUnknown_083DFEC4->unk8788,
            numTrainerBattles,
            STR_CONV_MODE_RIGHT_ALIGN,
            5);
        MenuPrint_RightAligned(gUnknown_083DFEC4->unk8788, 10, 15);
        break;
    }
}

static void sub_80F08E4(void)
{
    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    Menu_EraseWindowRect(0, 9, 11, 16);
}

void sub_80F0900(void)
{
    s16 var0 = (gUnknown_083DFEC4->unk8772 - gUnknown_083DFEC4->unk8770) + 1;
    if (var0 < 8)
        Menu_EraseWindowRect(12, 1, 31, 15);

    sub_80F0954(gUnknown_083DFEC4->unk8770, 0, var0);
}

bool8 sub_80F0944(void)
{
    return sub_80F098C();
}

static void sub_80F0954(u16 arg0, u16 arg1, u16 arg2)
{
    gUnknown_083DFEC4->unk877E = arg0;
    gUnknown_083DFEC4->unk8780 = arg1;
    gUnknown_083DFEC4->unk8784 = arg2;
    gUnknown_083DFEC4->unk8786 = 0;
}

#ifdef NONMATCHING
static bool8 sub_80F098C(void)
{
    register u16 zero asm("r8");
    if (!gUnknown_083DFEC4->unk8784)
    {
        DONE:
        return FALSE;
    }

    zero = 0;
    gUnknown_083E3270[gUnknown_083DFEC4->unk87CA](gUnknown_083DFEC4->unk877E, gUnknown_083DFEC4->unk8780);
    if (!--gUnknown_083DFEC4->unk8784)
        goto DONE;

    if ((++gUnknown_083DFEC4->unk877E & 0xFFFF) > gUnknown_083DFEC4->unk8774)
        gUnknown_083DFEC4->unk877E = zero;

    gUnknown_083DFEC4->unk8780 += 2;
    gUnknown_083DFEC4->unk8780 &= 0x1F;
    return TRUE;
}
#else
NAKED
static bool8 sub_80F098C(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    ldr r0, _080F09A4 @ =gUnknown_083DFEC4\n\
    ldr r6, [r0]\n\
    ldr r0, _080F09A8 @ =0x00008784\n\
    adds r7, r6, r0\n\
    ldrh r0, [r7]\n\
    cmp r0, 0\n\
    bne _080F09AC\n\
_080F09A0:\n\
    movs r0, 0\n\
    b _080F0A02\n\
    .align 2, 0\n\
_080F09A4: .4byte gUnknown_083DFEC4\n\
_080F09A8: .4byte 0x00008784\n\
_080F09AC:\n\
    movs r1, 0\n\
    mov r8, r1\n\
    ldr r1, _080F0A0C @ =gUnknown_083E3270\n\
    ldr r2, _080F0A10 @ =0x000087ca\n\
    adds r0, r6, r2\n\
    ldrb r2, [r0]\n\
    lsls r2, 2\n\
    adds r2, r1\n\
    ldr r0, _080F0A14 @ =0x0000877e\n\
    adds r4, r6, r0\n\
    ldrh r0, [r4]\n\
    ldr r1, _080F0A18 @ =0x00008780\n\
    adds r5, r6, r1\n\
    ldrh r1, [r5]\n\
    ldr r2, [r2]\n\
    bl _call_via_r2\n\
    ldrh r0, [r7]\n\
    subs r0, 0x1\n\
    strh r0, [r7]\n\
    ldr r2, _080F0A1C @ =0x0000ffff\n\
    adds r1, r2, 0\n\
    lsls r0, 16\n\
    cmp r0, 0\n\
    beq _080F09A0\n\
    ldrh r0, [r4]\n\
    adds r0, 0x1\n\
    strh r0, [r4]\n\
    ands r0, r1\n\
    ldr r2, _080F0A20 @ =0x00008774\n\
    adds r1, r6, r2\n\
    movs r2, 0\n\
    ldrsh r1, [r1, r2]\n\
    cmp r0, r1\n\
    ble _080F09F6\n\
    mov r0, r8\n\
    strh r0, [r4]\n\
_080F09F6:\n\
    ldrh r0, [r5]\n\
    adds r0, 0x2\n\
    movs r1, 0x1F\n\
    ands r0, r1\n\
    strh r0, [r5]\n\
    movs r0, 0x1\n\
_080F0A02:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080F0A0C: .4byte gUnknown_083E3270\n\
_080F0A10: .4byte 0x000087ca\n\
_080F0A14: .4byte 0x0000877e\n\
_080F0A18: .4byte 0x00008780\n\
_080F0A1C: .4byte 0x0000ffff\n\
_080F0A20: .4byte 0x00008774\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80F0A24(u16 arg0, u16 arg1)
{
    u8 var0 = gUnknown_083DFEC4->unk87C8 == 0 ? 2 : 1;
    sub_80F4428(gUnknown_083DFEC4->unk8788, arg0, var0);
    BasicInitMenuWindow(&gWindowTemplate_81E70D4);
    Menu_PrintText(gUnknown_083DFEC4->unk8788, 13, arg1);
}

static void sub_80F0A74(u16 arg0, u16 arg1)
{
    sub_80F700C(gUnknown_083DFEC4->unk8788, arg0);
    arg1 &= 0x1F;
    BasicInitMenuWindow(&gWindowTemplate_81E70D4);
    Menu_PrintTextPixelCoords(gUnknown_083DFEC4->unk8788, 97, arg1 * 8, 0);
    if (arg0 < gUnknown_083DFEC4->unkD158 && gUnknown_083DFEC4->unkCEE8[arg0].unk5)
        sub_8095C8C((void *)VRAM + 0xF000, 29, arg1, gUnknown_083E039C, 0, 0, 1, 2, 1);
    else
        sub_8095C8C((void *)VRAM + 0xF000, 29, arg1, gUnknown_083E03A0, 0, 0, 1, 2, 1);
}

static void sub_80F0B24(void)
{
    gUnknown_083DFEC4->unkD15C = 0;
    gUnknown_083DFEC4->unk306 = 0;
}

static bool8 sub_80F0B44(void)
{
    int top;
    if (gUnknown_083DFEC4->unkD15C > 8)
    {
        return FALSE;
    }

    if (++gUnknown_083DFEC4->unk306 > 1)
    {
        gUnknown_083DFEC4->unk306 = 0;
        if (gUnknown_083DFEC4->unkD15C < 8)
        {
            top = (gUnknown_083DFEC4->unk8778 + (gUnknown_083DFEC4->unkD15C * 2)) & 0x1F;
            if (gUnknown_083DFEC4->unkD15C != gUnknown_083DFEC4->unk876C)
            {
                BasicInitMenuWindow(&gWindowTemplate_81E70D4);
                Menu_EraseWindowRect(12, top, 31, top + 1);
            }

            if (!gUnknown_083DFEC4->unkD15C)
                sub_80F08E4();

            gUnknown_083DFEC4->unkD15C++;
            return TRUE;
        }
        else
        {
            u16 i;
            BasicInitMenuWindow(&gWindowTemplate_81E70D4);
            top = (gUnknown_083DFEC4->unk8778 + 16) & 0x1F;
            for (i = 0; i < 8; i++)
            {
                Menu_EraseWindowRect(12, top, 31, top + 1);
                top = (top + 2) & 0x1F;
            }

            gUnknown_083DFEC4->unkD15C++;
            return FALSE;
        }
    }
    else
    {
        return TRUE;
    }
}

static void sub_80F0C28(void)
{
    gUnknown_083DFEC4->unkD15C = 0;
    gUnknown_083DFEC4->unk306 = 0;
}

static bool8 sub_80F0C48(void)
{
    if (gUnknown_083DFEC4->unkD15C > 7)
        return FALSE;

    if (++gUnknown_083DFEC4->unk306 > 1)
    {
        gUnknown_083DFEC4->unk306 = 0;
        BasicInitMenuWindow(&gWindowTemplate_81E70D4);
        sub_80F0A74(gUnknown_083DFEC4->unk8770 + gUnknown_083DFEC4->unkD15C,
                    gUnknown_083DFEC4->unk8778 + gUnknown_083DFEC4->unkD15C * 2);

        if ((++gUnknown_083DFEC4->unkD15C) > 7)
        {
            sub_80F081C(0);
            return FALSE;
        }
    }
    
    return TRUE;
}

void LoadTrainerEyesDescriptionLines(void)
{
    u16 i;
    int trainerEyesId;
    const u8 *curChar;

    gUnknown_083DFEC4->unk306 = 0;
    gUnknown_083DFEC4->unkD15C = 0;
    trainerEyesId = gUnknown_083DFEC4->unkCEE8[gUnknown_083DFEC4->unk876E].unk4;
    gUnknown_083DFEC4->trainerEyeDescriptionLines[0] = gTrainerEyeDescriptions[trainerEyesId];

    // Find the start of the 3 other lines in the Trainer's Eyes description.
    curChar = gUnknown_083DFEC4->trainerEyeDescriptionLines[0];
    for (i = 0; i < 3; i++)
    {
        while (*curChar != EOS)
            curChar++;
        gUnknown_083DFEC4->trainerEyeDescriptionLines[i + 1] = ++curChar;
    }
}

#ifdef NONMATCHING
// small register mismatch (r2/r3) on the line where var0 is set.
bool8 sub_80F0D5C(void)
{
    int var0;
    if (gUnknown_083DFEC4->unkD15C == 7)
        return FALSE;

    if (++gUnknown_083DFEC4->unk306 > 1)
    {
        gUnknown_083DFEC4->unk306 = 0;
        BasicInitMenuWindow(&gWindowTemplate_81E70D4);
        var0 = (gUnknown_083DFEC4->unk8778 + 2 + gUnknown_083DFEC4->unkD15C * 2) & 0x1F;
        switch (gUnknown_083DFEC4->unkD15C)
        {
        case 0:
            Menu_PrintTextPixelCoords(gOtherText_Strategy, 97, var0 * 8, 0);
            break;
        case 1:
            AlignStringInMenuWindow(
                gUnknown_083DFEC4->unk8788,
                gUnknown_083DFEC4->trainerEyeDescriptionLines[0],
                136,
                0);
            Menu_PrintTextPixelCoords(gUnknown_083DFEC4->unk8788, 97, var0 * 8, 0);
            break;
        case 2:
            Menu_PrintTextPixelCoords(gOtherText_TrainersPokemon, 97, var0 * 8, 0);
            break;
        case 3:
            AlignStringInMenuWindow(
                gUnknown_083DFEC4->unk8788,
                gUnknown_083DFEC4->trainerEyeDescriptionLines[1],
                136,
                0);
            Menu_PrintTextPixelCoords(gUnknown_083DFEC4->unk8788, 97, var0 * 8, 0);
            break;
        case 4:
            Menu_PrintTextPixelCoords(gOtherText_SelfIntroduction, 97, var0 * 8, 0);
            break;
        case 5:
            AlignStringInMenuWindow(
                gUnknown_083DFEC4->unk8788,
                gUnknown_083DFEC4->trainerEyeDescriptionLines[2],
                136,
                0);
            Menu_PrintTextPixelCoords(gUnknown_083DFEC4->unk8788, 97, var0 * 8, 0);
            break;
        case 6:
            AlignStringInMenuWindow(
                gUnknown_083DFEC4->unk8788,
                gUnknown_083DFEC4->trainerEyeDescriptionLines[3],
                136,
                0);
            Menu_PrintTextPixelCoords(gUnknown_083DFEC4->unk8788, 97, var0 * 8, 0);
        default:
            return FALSE;
        }

        gUnknown_083DFEC4->unkD15C++;
        return TRUE;
    }
    else
    {
        return TRUE;
    }
}
#else
NAKED
bool8 sub_80F0D5C(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    ldr r0, _080F0D70 @ =gUnknown_083DFEC4\n\
    ldr r4, [r0]\n\
    ldr r0, _080F0D74 @ =0x0000d15c\n\
    adds r5, r4, r0\n\
    ldrh r0, [r5]\n\
    cmp r0, 0x7\n\
    bne _080F0D78\n\
_080F0D6C:\n\
    movs r0, 0\n\
    b _080F0EB0\n\
    .align 2, 0\n\
_080F0D70: .4byte gUnknown_083DFEC4\n\
_080F0D74: .4byte 0x0000d15c\n\
_080F0D78:\n\
    ldr r0, _080F0DB8 @ =0x00000306\n\
    adds r1, r4, r0\n\
    ldrh r0, [r1]\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    cmp r0, 0x1\n\
    bhi _080F0D8C\n\
    b _080F0EAE\n\
_080F0D8C:\n\
    movs r0, 0\n\
    strh r0, [r1]\n\
    ldr r0, _080F0DBC @ =gWindowTemplate_81E70D4\n\
    bl BasicInitMenuWindow\n\
    ldr r0, _080F0DC0 @ =0x00008778\n\
    adds r1, r4, r0\n\
    ldrh r3, [r5]\n\
    lsls r0, r3, 1\n\
    adds r0, 0x2\n\
    ldrh r1, [r1]\n\
    adds r5, r0, r1\n\
    movs r0, 0x1F\n\
    ands r5, r0\n\
    cmp r3, 0x6\n\
    bhi _080F0D6C\n\
    lsls r0, r3, 2\n\
    ldr r1, _080F0DC4 @ =_080F0DC8\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080F0DB8: .4byte 0x00000306\n\
_080F0DBC: .4byte gWindowTemplate_81E70D4\n\
_080F0DC0: .4byte 0x00008778\n\
_080F0DC4: .4byte _080F0DC8\n\
    .align 2, 0\n\
_080F0DC8:\n\
    .4byte _080F0DE4\n\
    .4byte _080F0DF0\n\
    .4byte _080F0E08\n\
    .4byte _080F0E14\n\
    .4byte _080F0E2C\n\
    .4byte _080F0E38\n\
    .4byte _080F0E6C\n\
_080F0DE4:\n\
    ldr r0, _080F0DEC @ =gOtherText_Strategy\n\
    lsls r2, r5, 3\n\
    b _080F0E54\n\
    .align 2, 0\n\
_080F0DEC: .4byte gOtherText_Strategy\n\
_080F0DF0:\n\
    ldr r0, _080F0DFC @ =gUnknown_083DFEC4\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0E00 @ =0x00008788\n\
    adds r4, r0, r1\n\
    ldr r1, _080F0E04 @ =0x0000d110\n\
    b _080F0E42\n\
    .align 2, 0\n\
_080F0DFC: .4byte gUnknown_083DFEC4\n\
_080F0E00: .4byte 0x00008788\n\
_080F0E04: .4byte 0x0000d110\n\
_080F0E08:\n\
    ldr r0, _080F0E10 @ =gOtherText_TrainersPokemon\n\
    lsls r2, r5, 3\n\
    b _080F0E54\n\
    .align 2, 0\n\
_080F0E10: .4byte gOtherText_TrainersPokemon\n\
_080F0E14:\n\
    ldr r0, _080F0E20 @ =gUnknown_083DFEC4\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0E24 @ =0x00008788\n\
    adds r4, r0, r1\n\
    ldr r1, _080F0E28 @ =0x0000d114\n\
    b _080F0E42\n\
    .align 2, 0\n\
_080F0E20: .4byte gUnknown_083DFEC4\n\
_080F0E24: .4byte 0x00008788\n\
_080F0E28: .4byte 0x0000d114\n\
_080F0E2C:\n\
    ldr r0, _080F0E34 @ =gOtherText_SelfIntroduction\n\
    lsls r2, r5, 3\n\
    b _080F0E54\n\
    .align 2, 0\n\
_080F0E34: .4byte gOtherText_SelfIntroduction\n\
_080F0E38:\n\
    ldr r0, _080F0E60 @ =gUnknown_083DFEC4\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0E64 @ =0x00008788\n\
    adds r4, r0, r1\n\
    ldr r1, _080F0E68 @ =0x0000d118\n\
_080F0E42:\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x88\n\
    movs r3, 0\n\
    bl AlignStringInMenuWindow\n\
    lsls r2, r5, 3\n\
    adds r0, r4, 0\n\
_080F0E54:\n\
    movs r1, 0x61\n\
    movs r3, 0\n\
    bl Menu_PrintTextPixelCoords\n\
    b _080F0EA0\n\
    .align 2, 0\n\
_080F0E60: .4byte gUnknown_083DFEC4\n\
_080F0E64: .4byte 0x00008788\n\
_080F0E68: .4byte 0x0000d118\n\
_080F0E6C:\n\
    ldr r0, _080F0E94 @ =gUnknown_083DFEC4\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0E98 @ =0x00008788\n\
    adds r4, r0, r1\n\
    ldr r1, _080F0E9C @ =0x0000d11c\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    movs r2, 0x88\n\
    movs r3, 0\n\
    bl AlignStringInMenuWindow\n\
    lsls r2, r5, 3\n\
    adds r0, r4, 0\n\
    movs r1, 0x61\n\
    movs r3, 0\n\
    bl Menu_PrintTextPixelCoords\n\
    b _080F0D6C\n\
    .align 2, 0\n\
_080F0E94: .4byte gUnknown_083DFEC4\n\
_080F0E98: .4byte 0x00008788\n\
_080F0E9C: .4byte 0x0000d11c\n\
_080F0EA0:\n\
    ldr r0, _080F0EB8 @ =gUnknown_083DFEC4\n\
    ldr r1, [r0]\n\
    ldr r0, _080F0EBC @ =0x0000d15c\n\
    adds r1, r0\n\
    ldrh r0, [r1]\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080F0EAE:\n\
    movs r0, 0x1\n\
_080F0EB0:\n\
    pop {r4,r5}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080F0EB8: .4byte gUnknown_083DFEC4\n\
_080F0EBC: .4byte 0x0000d15c\n\
    .syntax divided\n");
}
#endif

static void sub_80F0EC0(void)
{
    gUnknown_083DFEC4->unk306 = 0;
    gUnknown_083DFEC4->unkD15C = 0;
    StringFill(gUnknown_083DFEC4->unk8788, CHAR_SPACE, 16);
}

static bool8 sub_80F0EF4(void)
{
    int top;
    if (gUnknown_083DFEC4->unkD15C > 6)
        return FALSE;

    if (++gUnknown_083DFEC4->unk306 > 1)
    {
        gUnknown_083DFEC4->unk306 = 0;
        top = (gUnknown_083DFEC4->unk8778 + 2 + gUnknown_083DFEC4->unkD15C * 2) & 0x1F;
        BasicInitMenuWindow(&gWindowTemplate_81E70D4);
        Menu_EraseWindowRect(12, top, 31, top + 1);
        gUnknown_083DFEC4->unkD15C++;
    }

    return TRUE;
}

static void sub_80F0F64(void)
{
    s16 var0 = gUnknown_083DFEC4->unk876C;
    gUnknown_083DFEC4->unk877C = var0 * 16;
    gUnknown_083DFEC4->unk877A = var0 == 1 ? 4 : 8;
}

static void sub_80F0FA0(void)
{
    s16 var0 = gUnknown_083DFEC4->unk876C * -1;
    gUnknown_083DFEC4->unk877C = var0 * 16;
    gUnknown_083DFEC4->unk877A = var0 == -1 ? -4 : -8;
}

static bool8 sub_80F0FEC(void)
{
    return sub_80F0718();
}

void sub_80F0FFC(u8 arg0)
{
    GetMapSectionName(gUnknown_083DFEC4->unk8788, gUnknown_083DFEC4->unkCEE8[arg0].unk2, 0);
    BasicInitMenuWindow(&gWindowTemplate_81E710C);
    sub_80F19DC(gUnknown_083DFEC4->unk8788);
    AlignStringInMenuWindow(gUnknown_083DFEC4->unkD138, gUnknown_083DFEC4->unk8788, 88, 2);
    Menu_PrintText(gUnknown_083DFEC4->unkD138, 0, 5);
}

void sub_80F105C(void)
{
    sub_80F0A74(gUnknown_083DFEC4->unk876E, gUnknown_083DFEC4->unk8778);
}

static bool8 sub_80F1080(void)
{
    switch (gUnknown_083DFEC4->unkD160)
    {
    case 0:
        sub_80EEDE8();
        gUnknown_083DFEC4->unkD162 = 11;
        break;
    case 1:
        Text_LoadWindowTemplate(&gWindowTemplate_81E70B8);
        break;
    case 2:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E70B8);
        break;
    case 3:
        if (!MultistepInitMenuWindowContinue())
            return TRUE;
        break;
    case 4:
        Menu_EraseScreen();
        break;
    case 5:
        sub_80F1614();
        break;
    case 6:
        if (sub_80F162C(1))
            return TRUE;
        break;
    case 7:
        LZ77UnCompWram(gUnknown_08E9FBA0, gUnknown_083DFEC4->unk934C);
        break;
    case 8:
        DrawMonRibbonIcons();
        break;
    case 9:
        sub_80F13FC();
        break;
    case 10:
        LZ77UnCompVram(gPokenavRibbonView_Gfx, (void *)(VRAM + 0x8000));
        break;
    case 11:
        LZ77UnCompVram(gUnknown_083E040C, (void *)(VRAM + 0x8200));
        break;
    case 12:
        LoadPalette(gPokenavRibbonView_Pal, 0x20, 0x20);
        LoadPalette(gUnknown_083E03A8, 0xF0, 0x20);
        LoadPalette(gUnknown_083E3C60[0], 0x30, 0xA0);
        LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
        LoadPalette(gUnknown_083E03A8 + 0xF, 0xBF, 0x2);
        break;
    case 13:
        sub_80F1438();
        break;
    case 14:
        REG_BG2CNT = 0x1E02;
        REG_BG3CNT = 0x170B;
        REG_BLDCNT = 0;
        gUnknown_083DFEC4->unkD160++;
        return FALSE;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unkD160++;
    return TRUE;
}

void DrawMonRibbonIcons(void)
{
    u16 i;
    u16 offset;
    u8 index, palette, tile;
    u8 var0;
    
    offset = 0x8B;
    var0 = gUnknown_083DFEC4->unkBC8E - gUnknown_083DFEC4->unkBC8F;

    for (i = 0; i < 8; i++)
        CpuFill16(0x2000, &gUnknown_083DFEC4->unk934C[offset + i * 32], 0x24);

    for (i = 0; i < var0; i++)
    {
        index = gUnknown_083DFEC4->unkBC4C[i];
        palette = gPokenavRibbonsIconGfx[index][1] + 3;
        tile = gPokenavRibbonsIconGfx[index][0] * 2 + 0x10;
        gUnknown_083DFEC4->unk934C[offset] = (palette << 12) | tile;
        gUnknown_083DFEC4->unk934C[offset + 1] = ((palette << 12) | 0x400) | tile;
        gUnknown_083DFEC4->unk934C[offset + 0x20] = (palette << 12) | (tile + 1);
        gUnknown_083DFEC4->unk934C[offset + 0x21] = (palette << 12) | 0x400 | (tile + 1);

        if ((i + 1) % 9 == 0)
            offset += 0x30;
        else
            offset += 2;
    }

    offset = 0x14B;
    for (i = 0; i < gUnknown_083DFEC4->unkBC8F; i++)
    {
        index = gUnknown_083DFEC4->unkBC4C[var0 + i];
        palette = gPokenavRibbonsIconGfx[index][1] + 3;
        tile = gPokenavRibbonsIconGfx[index][0] * 2 + 0x10;
        gUnknown_083DFEC4->unk934C[offset] = (palette << 12) | tile;
        gUnknown_083DFEC4->unk934C[offset + 1] = ((palette << 12) | 0x400) | tile;
        gUnknown_083DFEC4->unk934C[offset + 0x20] = (palette << 12) | (tile + 1);
        gUnknown_083DFEC4->unk934C[offset + 0x21] = (palette << 12) | 0x400 | (tile + 1);

        offset += 2;
    }
}

void sub_80F13FC(void)
{
    u16 *src = gUnknown_083DFEC4->unk934C;
    u16 *dest = (u16 *)(VRAM + 0xB800);
    DmaCopy32(3, src, dest, 0x500);
    gPlttBufferUnfaded[0] = *(gPokenavRibbonView_Pal + 14);
}

void sub_80F1438(void)
{
    Menu_PrintText(gUnknown_083DFEC4->unk8829[0], 13, 1);
    sub_80F445C(gUnknown_083DFEC4->unk8788, gUnknown_083DFEC4->unk876E + 1);
    Menu_PrintText(gUnknown_083DFEC4->unk8788, 1, 5);
}

void sub_80F1480(void)
{
    Menu_EraseWindowRect(12, 13, 27, 16);
}

// This is a fakematching function, due to a hardcoded access of gSaveBlock1.
// Due to this hardcoded address access, gift ribbons do not properly display
// their descriptions, since the hardcoded access is inside of the LinkBattleRecords
// save data, rather than the giftRibbons array, which is almost certainly what the
// intended access is.
static void sub_80F1494(void)
{
    u8 *arr;
    u8 *tileBuffer1 = &gUnknown_083DFEC8[0x800];
    u8 *tileBuffer2 = &gUnknown_083DFEC8[0xA98];

    if (gUnknown_083DFEC4->unkBC91 < 3)
    {
        gUnknown_020388B4 = gUnknown_083DFEC4->unkBC91 * 9 + gUnknown_083DFEC4->unkBC90;
        gUnknown_020388B4 = gUnknown_083DFEC4->unkBC4C[gUnknown_020388B4];
        AlignStringInMenuWindow(tileBuffer1, gRibbonDescriptions[gUnknown_020388B4][0], 128, 0);
        AlignStringInMenuWindow(tileBuffer2, gRibbonDescriptions[gUnknown_020388B4][1], 128, 0);
    }
    else
    {
        gUnknown_020388B4 = gUnknown_083DFEC4->unkBC8E - gUnknown_083DFEC4->unkBC8F;
        gUnknown_020388B4 = gUnknown_083DFEC4->unkBC4C[gUnknown_020388B4 + gUnknown_083DFEC4->unkBC90];

        // FIXME!
        arr = ((u8*)&gSaveBlock1);
        asm("ldrh r1, [r5]\n\
            add r0, r0, r1");
        gUnknown_020388B4 = arr[0x30F7];
        // The bug fix for this code is the following:
        // gUnknown_020388B4 = gSaveBlock1.externalReservedData.giftRibbons[gUnknown_020388B4];
        if (gUnknown_020388B4)
        {
            gUnknown_020388B4--;
            AlignStringInMenuWindow(tileBuffer1, gGiftRibbonDescriptions[gUnknown_020388B4][0], 128, 0);
            AlignStringInMenuWindow(tileBuffer2, gGiftRibbonDescriptions[gUnknown_020388B4][1], 128, 0);
        }
        else
        {
            AlignStringInMenuWindow(tileBuffer1, gEmptyString_81E72B0, 128, 0);
            AlignStringInMenuWindow(tileBuffer2, gEmptyString_81E72B0, 128, 0);
        }
    }

    Menu_PrintText(tileBuffer1, 12, 13);
    Menu_PrintText(tileBuffer2, 12, 15);
}

static void sub_80F15A8(void)
{
    u8 *buffer;
    Menu_EraseWindowRect(12, 13, 27, 16);
    buffer = StringCopy(gUnknown_083DFEC4->unk8788, gOtherText_Ribbons);
    buffer[0] = CHAR_SPACE;
    buffer++;
    buffer = ConvertIntToDecimalStringN(
            buffer,
            gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].unk0,
            STR_CONV_MODE_LEFT_ALIGN,
            2);
    buffer[0] = EOS;
    Menu_PrintText(gUnknown_083DFEC4->unk8788, 12, 13);
}

void sub_80F1614(void)
{
    gUnknown_083DFEC4->unk8764 = 0;
}

bool8 sub_80F162C(u8 arg0)
{
    switch (gUnknown_083DFEC4->unk8764)
    {
    case 0:
        break;
    case 1:
        LZ77UnCompVram(gUnknown_08E9FF58, (void *)(VRAM + 0xE800));
        break;
    case 2:
        DmaCopy16Defvars(3, gPokenavRibbonPokeView_Gfx, (void *)(VRAM + 0xE000), 0xE0);
        break;
    case 3:
        if (!arg0)
            LoadPalette(gUnknown_083E0124, 0xD0, 0x20);
        else
            LoadPalette(gUnknown_083E0144, 0xD0, 0x20);

        gUnknown_083DFEC4->unk8766 = -80;
        REG_BG0CNT = 0x1D0D;
        gUnknown_083DFEC4->unk8764++;
        return FALSE;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unk8764++;
    return TRUE;
}

bool8 sub_80F170C(void)
{
    gUnknown_083DFEC4->unk8766 += 0x10;
    if (gUnknown_083DFEC4->unk8766 > 0)
        gUnknown_083DFEC4->unk8766 = 0;

    return gUnknown_083DFEC4->unk8766 != 0;
}

bool8 sub_80F173C(void)
{
    gUnknown_083DFEC4->unk8766 -= 0x10;
    if (gUnknown_083DFEC4->unk8766 < -0x50)
        gUnknown_083DFEC4->unk8766 = -0x50;

    return gUnknown_083DFEC4->unk8766 != -0x50;
}

bool8 sub_80F1778(void)
{
    switch (gUnknown_083DFEC4->unkD160)
    {
    case 0:
        sub_80EEDE8();
        gUnknown_083DFEC4->unkD162 = 2;
        break;
    case 1:
        sub_80F1614();
        break;
    case 2:
        if (sub_80F162C(0))
            return TRUE;
        break;
    case 3:
        LZ77UnCompVram(gPokenavConditionView_Gfx, (void *)(VRAM + 0x5000));
        break;
    case 4:
        LZ77UnCompVram(gUnknown_08E9AC4C, (void *)(VRAM + 0xF000));
        LoadPalette(gPokenavConditionMenu2_Pal, 0x20, 0x20);
        break;
    case 5:
        sub_8095C8C((void *)VRAM + 0xF000, 0, 13, gUnknown_083E01F4, 0, 0, 12, 4, 12);
        break;
    case 6:
        LZ77UnCompVram(gUnknown_08E9FEB4, (void *)(VRAM + 0xB800));
        break;
    case 7:
        LoadPalette(gUnknown_083E0254, 0x30, 0x20);
        LoadPalette(gUnknownPalette_81E6692, 0xB0, 0x20);
        LoadPalette(&gPokenavConditionMenu2_Pal[2], 0xB1, 0x2);
        LoadPalette(&gPokenavConditionMenu2_Pal[16], 0xB5, 0x2);
        LoadPalette(&gPokenavConditionMenu2_Pal[30], 0xBF, 0x2);
        sub_80F01A4();
        break;
    case 8:
        sub_80F01E0(gUnknown_083DFEC4->unk8fe9);
        break;
    case 9:
        REG_BG3CNT = 0x1E03;
        REG_BG2CNT = 0x1702;
        REG_BLDCNT = 0x844;
        REG_BLDALPHA = 0x40B;
        break;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unkD160++;
    return TRUE;
}

void sub_80F1934(void)
{
    u8 *buffer = gUnknown_083DFEC4->unk8788;
    if (gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].unk4)
    {
        u8 nature = GetNature(&gPlayerParty[sub_8137124(gUnknown_083DFEC4->unk87DC)]);
        buffer = StringCopy(buffer, gOtherText_Nature2);
        AlignStringInMenuWindow(buffer, gNatureNames[nature], 87, 0);
    }
    else
    {
        AlignStringInMenuWindow(buffer, gEmptyString_81E72B0, 87, 0);
    }

    Menu_PrintTextPixelCoords(gUnknown_083DFEC4->unk8788, 1, 112, 1);
}

static void sub_80F19DC(u8 *text)
{
    while (text[0] != EOS)
    {
        if (text[0] == EXT_CTRL_CODE_BEGIN && text[1] == CHAR_SPACE)
        {
            text[0] = EOS;
            break;
        }

        text++;
    }
}

static void sub_80F19FC(void)
{
    // FIXME r4/r5 swapped
    register u8 *ptr asm("r5") = gUnknown_020388B0;
    if (ptr[0] == 1)
    {
        const u8 *landmarkName = GetLandmarkName(
            gUnknown_083DFEC4->regionMap.mapSectionId,
            gUnknown_083DFEC4->regionMap.everGrandeCityArea,
            ptr[1]);

        if (landmarkName)
        {
            sub_8072A18(landmarkName, 0x70, 4 * (ptr[1] * 4 + 12), 0x78, 1);
            if (++ptr[1] != 4)
                return;
        }

        Menu_BlankWindowRect(14, ptr[1] * 2 + 6, 28, 15);
        ptr[0] = 0;
    }
}

static void sub_80F1A74(void)
{
    gUnknown_020388B0[0] = 0;
}

static void sub_80F1A80(void)
{
    gUnknown_020388B0[0] = 1;
    gUnknown_020388B0[1] = 0;
}

static void sub_80F1A90(void)
{
    gUnknown_083DFEC4->unk306 = 0;
    if (gUnknown_083DFEC4->unk6DAC == 0)
        while (sub_80F1AC4());
}

static bool8 sub_80F1AC4(void)
{
    u16 i, j;

    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        for (i = 0; i < 6; i++)
        {
            for (j = 0; j < 4; j++)
                gUnknown_083DFEC4->unk320[i][j] = NULL;
        }

        gUnknown_083DFEC4->unk311 = 0;
        break;
    case 1:
        LZ77UnCompWram(gPokenavMenuOptions_Gfx, gUnknown_083DFEC4->unk388);
        break;
    case 2:
        LZ77UnCompWram(gPokenavConditionMenu_Gfx, gUnknown_083DFEC4->unk1788);
        break;
    case 3:
        LZ77UnCompWram(gPokenavConditionSearch_Gfx, gUnknown_083DFEC4->unk2388);
        return FALSE;
    }

    gUnknown_083DFEC4->unk306++;
    return TRUE;
}

static void sub_80F1B8C(u8 arg0)
{
    gUnknown_083DFEC4->unk306 = 0;
    if (gUnknown_083DFEC4->unk6DAC == 0)
        while (sub_80F1BC8(arg0));
}

#ifdef NONMATCHING
// very close, but for some reason, (i + 1) is being stored in sp[0x10]
static bool8 sub_80F1BC8(u8 arg0)
{
    u16 i, j;
    u16 animNum;
    u16 topOffset;
    u16 height;
    u16 middle;
    u8 spriteId;

    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        sub_80F2458(arg0);
        break;
    case 1:
        sub_80F2514(arg0);
        break;
    case 2:
        switch (arg0)
        {
        case 0:
            topOffset = 42;
            height = 20;
            gUnknown_083DFEC4->unk30E = 5;
            break;
        case 1:
            topOffset = 56;
            height = 20;
            gUnknown_083DFEC4->unk30E = 3;
            break;
        case 2:
            topOffset = 40;
            height = 16;
            gUnknown_083DFEC4->unk30E = 6;
            break;
        default:
            return FALSE;
        }

        animNum = 0;
        for (i = 0; i < gUnknown_083DFEC4->unk30E; i++)
        {
            middle = (height * i) + topOffset - 8;
            gUnknown_083DFEC4->unk314[i] = (middle << 8) | (middle + 0x11);
            if (!arg0)
            {
                if (gUnknown_083DFEC4->unk6DB2[i] == 0)
                {
                    for (j = 0; j < 4; j++)
                        gUnknown_083DFEC4->unk320[i][j] = NULL;
                    continue;
                }
                else
                {
                    animNum = (gUnknown_083DFEC4->unk6DB2[i] - 1) * 4;
                }
            }

            for (j = 0; j < 4; j++)
            {
                spriteId = CreateSprite(&gSpriteTemplate_83E4454, j * 32 + 256, (height * i) + topOffset, 0);
                if (spriteId != MAX_SPRITES)
                {
                    gUnknown_083DFEC4->unk320[i][j] = &gSprites[spriteId];
                    gUnknown_083DFEC4->unk320[i][j]->data[0] = i;
                    gUnknown_083DFEC4->unk320[i][j]->data[1] = j;
                    gUnknown_083DFEC4->unk320[i][j]->data[2] = j * 32 + 152;
                    gUnknown_083DFEC4->unk320[i][j]->data[3] = j * 32 + 256;
                    StartSpriteAnim(gUnknown_083DFEC4->unk320[i][j], animNum++);

                    if ((arg0 == 2 || arg0 == 0) && i > 2)
                        gUnknown_083DFEC4->unk320[i][j]->oam.paletteNum = IndexOfSpritePaletteTag(0x1);
                }
            }
        }
        break;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unk306++;
    return TRUE;
}
#else
NAKED
static bool8 sub_80F1BC8(u8 arg0)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0xC\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r9, r0\n\
    ldr r1, _080F1BF4 @ =gUnknown_083DFEC4\n\
    ldr r2, [r1]\n\
    ldr r3, _080F1BF8 @ =0x00000306\n\
    adds r0, r2, r3\n\
    ldrh r0, [r0]\n\
    adds r3, r1, 0\n\
    cmp r0, 0x1\n\
    beq _080F1C0A\n\
    cmp r0, 0x1\n\
    bgt _080F1BFC\n\
    cmp r0, 0\n\
    beq _080F1C02\n\
    b _080F1DC4\n\
    .align 2, 0\n\
_080F1BF4: .4byte gUnknown_083DFEC4\n\
_080F1BF8: .4byte 0x00000306\n\
_080F1BFC:\n\
    cmp r0, 0x2\n\
    beq _080F1C12\n\
    b _080F1DC4\n\
_080F1C02:\n\
    mov r0, r9\n\
    bl sub_80F2458\n\
    b _080F1DC8\n\
_080F1C0A:\n\
    mov r0, r9\n\
    bl sub_80F2514\n\
    b _080F1DC8\n\
_080F1C12:\n\
    mov r4, r9\n\
    cmp r4, 0x1\n\
    beq _080F1C40\n\
    cmp r4, 0x1\n\
    bgt _080F1C22\n\
    cmp r4, 0\n\
    beq _080F1C2A\n\
    b _080F1DC4\n\
_080F1C22:\n\
    mov r5, r9\n\
    cmp r5, 0x2\n\
    beq _080F1C54\n\
    b _080F1DC4\n\
_080F1C2A:\n\
    movs r0, 0x2A\n\
    str r0, [sp, 0x4]\n\
    movs r1, 0x14\n\
    str r1, [sp, 0x8]\n\
    ldr r4, _080F1C3C @ =0x0000030e\n\
    adds r1, r2, r4\n\
    movs r0, 0x5\n\
    b _080F1C62\n\
    .align 2, 0\n\
_080F1C3C: .4byte 0x0000030e\n\
_080F1C40:\n\
    movs r5, 0x38\n\
    str r5, [sp, 0x4]\n\
    movs r0, 0x14\n\
    str r0, [sp, 0x8]\n\
    ldr r4, _080F1C50 @ =0x0000030e\n\
    adds r1, r2, r4\n\
    movs r0, 0x3\n\
    b _080F1C62\n\
    .align 2, 0\n\
_080F1C50: .4byte 0x0000030e\n\
_080F1C54:\n\
    movs r5, 0x28\n\
    str r5, [sp, 0x4]\n\
    movs r0, 0x10\n\
    str r0, [sp, 0x8]\n\
    ldr r4, _080F1CDC @ =0x0000030e\n\
    adds r1, r2, r4\n\
    movs r0, 0x6\n\
_080F1C62:\n\
    strb r0, [r1]\n\
    movs r5, 0\n\
    str r5, [sp]\n\
    mov r8, r5\n\
    adds r1, r3, 0\n\
    ldr r0, [r1]\n\
    ldr r2, _080F1CDC @ =0x0000030e\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r8, r0\n\
    blt _080F1C7E\n\
    b _080F1DC8\n\
_080F1C7E:\n\
    ldr r4, [sp, 0x8]\n\
    mov r3, r8\n\
    muls r3, r4\n\
    ldr r5, [sp, 0x4]\n\
    adds r0, r5, r3\n\
    subs r0, 0x8\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    ldr r4, [r1]\n\
    mov r2, r8\n\
    lsls r1, r2, 1\n\
    movs r5, 0xC5\n\
    lsls r5, 2\n\
    adds r2, r4, r5\n\
    adds r2, r1\n\
    lsls r1, r0, 8\n\
    adds r0, 0x11\n\
    orrs r1, r0\n\
    strh r1, [r2]\n\
    mov r0, r9\n\
    cmp r0, 0\n\
    bne _080F1CF2\n\
    ldr r1, _080F1CE0 @ =0x00006db2\n\
    adds r0, r4, r1\n\
    mov r2, r8\n\
    adds r1, r0, r2\n\
    ldrb r0, [r1]\n\
    cmp r0, 0\n\
    bne _080F1CE8\n\
    movs r5, 0\n\
    ldr r0, _080F1CE4 @ =gUnknown_083DFEC4\n\
    ldr r0, [r0]\n\
    lsls r2, 4\n\
    movs r3, 0xC8\n\
    lsls r3, 2\n\
    adds r1, r0, r3\n\
    movs r3, 0\n\
_080F1CC8:\n\
    lsls r0, r5, 2\n\
    adds r0, r2\n\
    adds r0, r1, r0\n\
    str r3, [r0]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    cmp r5, 0x3\n\
    bls _080F1CC8\n\
    b _080F1D92\n\
    .align 2, 0\n\
_080F1CDC: .4byte 0x0000030e\n\
_080F1CE0: .4byte 0x00006db2\n\
_080F1CE4: .4byte gUnknown_083DFEC4\n\
_080F1CE8:\n\
    ldrb r0, [r1]\n\
    subs r0, 0x1\n\
    lsls r0, 18\n\
    lsrs r0, 16\n\
    str r0, [sp]\n\
_080F1CF2:\n\
    movs r5, 0\n\
    ldr r4, [sp, 0x4]\n\
    adds r0, r4, r3\n\
    lsls r0, 16\n\
    mov r10, r0\n\
_080F1CFC:\n\
    lsls r6, r5, 5\n\
    movs r0, 0x80\n\
    lsls r0, 1\n\
    adds r7, r6, r0\n\
    lsls r1, r7, 16\n\
    asrs r1, 16\n\
    ldr r0, _080F1DB4 @ =gSpriteTemplate_83E4454\n\
    mov r3, r10\n\
    asrs r2, r3, 16\n\
    movs r3, 0\n\
    bl CreateSprite\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    cmp r3, 0x40\n\
    beq _080F1DC4\n\
    ldr r0, _080F1DB8 @ =gUnknown_083DFEC4\n\
    ldr r2, [r0]\n\
    lsls r1, r5, 2\n\
    mov r4, r8\n\
    lsls r0, r4, 4\n\
    adds r1, r0\n\
    movs r0, 0xC8\n\
    lsls r0, 2\n\
    adds r2, r0\n\
    adds r4, r2, r1\n\
    lsls r0, r3, 4\n\
    adds r0, r3\n\
    lsls r0, 2\n\
    ldr r1, _080F1DBC @ =gSprites\n\
    adds r0, r1\n\
    str r0, [r4]\n\
    mov r1, r8\n\
    strh r1, [r0, 0x2E]\n\
    ldr r0, [r4]\n\
    strh r5, [r0, 0x30]\n\
    ldr r1, [r4]\n\
    adds r0, r6, 0\n\
    adds r0, 0x98\n\
    strh r0, [r1, 0x32]\n\
    ldr r0, [r4]\n\
    strh r7, [r0, 0x34]\n\
    ldr r0, [r4]\n\
    ldr r1, [sp]\n\
    adds r2, r1, 0x1\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    str r2, [sp]\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    bl StartSpriteAnim\n\
    mov r2, r9\n\
    cmp r2, 0x2\n\
    beq _080F1D6E\n\
    cmp r2, 0\n\
    bne _080F1D88\n\
_080F1D6E:\n\
    mov r3, r8\n\
    cmp r3, 0x2\n\
    bls _080F1D88\n\
    movs r0, 0x1\n\
    bl IndexOfSpritePaletteTag\n\
    ldr r3, [r4]\n\
    lsls r0, 4\n\
    ldrb r2, [r3, 0x5]\n\
    movs r1, 0xF\n\
    ands r1, r2\n\
    orrs r1, r0\n\
    strb r1, [r3, 0x5]\n\
_080F1D88:\n\
    adds r0, r5, 0x1\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    cmp r5, 0x3\n\
    bls _080F1CFC\n\
_080F1D92:\n\
    mov r0, r8\n\
    adds r0, 0x1\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
    ldr r1, _080F1DB8 @ =gUnknown_083DFEC4\n\
    ldr r0, [r1]\n\
    ldr r4, _080F1DC0 @ =0x0000030e\n\
    adds r0, r4\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    cmp r8, r0\n\
    bge _080F1DB0\n\
    b _080F1C7E\n\
_080F1DB0:\n\
    b _080F1DC8\n\
    .align 2, 0\n\
_080F1DB4: .4byte gSpriteTemplate_83E4454\n\
_080F1DB8: .4byte gUnknown_083DFEC4\n\
_080F1DBC: .4byte gSprites\n\
_080F1DC0: .4byte 0x0000030e\n\
_080F1DC4:\n\
    movs r0, 0\n\
    b _080F1DD8\n\
_080F1DC8:\n\
    ldr r0, _080F1DE8 @ =gUnknown_083DFEC4\n\
    ldr r1, [r0]\n\
    ldr r5, _080F1DEC @ =0x00000306\n\
    adds r1, r5\n\
    ldrh r0, [r1]\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
    movs r0, 0x1\n\
_080F1DD8:\n\
    add sp, 0xC\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080F1DE8: .4byte gUnknown_083DFEC4\n\
_080F1DEC: .4byte 0x00000306\n\
    .syntax divided\n");
}
#endif // NONMATCHING

static void sub_80F1DF0(void)
{
    u16 i, j;
    for (i = 0; i < gUnknown_083DFEC4->unk30E; i++)
    {
        for (j = 0; j < 4; j++)
        {
            if (gUnknown_083DFEC4->unk320[i][j])
                gUnknown_083DFEC4->unk320[i][j]->callback = sub_80F2218;
        }
    }

    PlaySE(SE_WIN_OPEN);
}

static bool8 sub_80F1E50(void)
{
    if (sub_80F22F8())
    {
        sub_80F2108();
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

static bool8 sub_80F1E6C(void)
{
    return !sub_80F22F8();
}

static void sub_80F1E84(void)
{
    u16 i, j;

    gUnknown_083DFEC4->unk30F = 0;
    sub_80F2148();
    for (i = 0; i < gUnknown_083DFEC4->unk30E; i++)
    {
        if (i != gUnknown_083DFEC4->unk6DAD)
        {
            for (j = 0; j < 4; j++)
            {
                if (gUnknown_083DFEC4->unk320[i][j])
                    gUnknown_083DFEC4->unk320[i][j]->callback = sub_80F2240;
            }
        }
    }
}

static bool8 sub_80F1F10(void)
{
    u16 j;

    switch (gUnknown_083DFEC4->unk30F)
    {
    case 0:
        if (sub_80F2360())
        {
            for (j = 0; j < 4; j++)
            {
                struct Sprite *sprite = gUnknown_083DFEC4->unk320[gUnknown_083DFEC4->unk6DAD][j];
                sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
                sprite->affineAnims = gSpriteAffineAnimTable_83E4450;
                InitSpriteAffineAnim(sprite);
                sprite->data[4] = j * 4 - 6;
                sprite->data[4] /= 2;
                sprite->data[5] = sprite->data[4] * 8;
                sprite->callback = sub_80F2240;
            }

            sub_80F2170();
            gUnknown_083DFEC4->unk30F++;
        }
        break;
    case 1:
        if (sub_80F23C8())
        {
            sub_80F21F8();
            FreeSpriteTilesByTag(0x0);
            FreeSpritePaletteByTag(0x0);
            FreeSpritePaletteByTag(0x1);
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static void sub_80F1FF0(void)
{
    if (gUnknown_083DFEC4->unk311 == 1)
    {
        REG_WIN0V = gUnknown_083DFEC4->unk314[gUnknown_083DFEC4->unk6DAD];
        REG_BLDY = gSineTable[gUnknown_083DFEC4->unk312] >> 5;
        gUnknown_083DFEC4->unk312 += 3;
        gUnknown_083DFEC4->unk312 &= 0x7F;
    }
    else if (gUnknown_083DFEC4->unk311 == 2)
    {
        REG_BLDALPHA = gUnknown_083E42F8[gUnknown_083DFEC4->unk312];
        if (gUnknown_083DFEC4->unk312 < 15)
            gUnknown_083DFEC4->unk312++;
    }
}

static void sub_80F208C(void)
{
    sub_80F2148();
}

static void sub_80F2098(void)
{
    REG_WIN0H = 0x77F0;
    REG_WIN0V = gUnknown_083DFEC4->unk314[gUnknown_083DFEC4->unk6DAD];
    REG_WININ = 0x3F;
    REG_WINOUT = 0x1F;
    REG_DISPCNT |= DISPCNT_WIN0_ON;
}

static void sub_80F20F4(void)
{
    REG_DISPCNT &= ~DISPCNT_WIN0_ON;
}

static void sub_80F2108(void)
{
    if (!gUnknown_083DFEC4->unk311)
    {
        gUnknown_083DFEC4->unk311 = 1;
        gUnknown_083DFEC4->unk312 = 0;
        REG_BLDCNT = 0x90;
        REG_BLDY = 0;
        sub_80F2098();
    }
}

static void sub_80F2148(void)
{
    gUnknown_083DFEC4->unk311 = 0;
    REG_BLDCNT = 0;
    sub_80F20F4();
}

static void sub_80F2170(void)
{
    u16 j;

    if (!gUnknown_083DFEC4->unk311)
    {
        sub_80F20F4();
        for (j = 0; j < 4; j++)
        {
            struct Sprite *sprite = gUnknown_083DFEC4->unk320[gUnknown_083DFEC4->unk6DAD][j];
            sprite->oam.objMode = ST_OAM_OBJ_BLEND;
        }

        gUnknown_083DFEC4->unk311 = 2;
        gUnknown_083DFEC4->unk312 = 0;
        REG_BLDCNT = 0x3F40;
        REG_BLDALPHA = 0x10;
    }
}

static void sub_80F21F8()
{
    gUnknown_083DFEC4->unk311 = 0;
    REG_BLDCNT = 0;
}

static void sub_80F2218(struct Sprite *sprite)
{
    sprite->pos1.x -= 8;
    if (sprite->pos1.x <= sprite->data[2])
    {
        sprite->pos1.x = sprite->data[2];
        sprite->callback = sub_80F22B0;
    }
}

static void sub_80F2240(struct Sprite *sprite)
{
    if (sprite->data[0] == gUnknown_083DFEC4->unk6DAD)
    {
        if (sprite->data[5])
        {
            sprite->pos1.x += sprite->data[4];
            sprite->data[5] -= sprite->data[4];
        }

        if (sprite->affineAnimEnded)
            sub_80F240C(sprite);
    }
    else
    {
        sprite->pos1.x += 8;
        if (sprite->pos1.x >= sprite->data[3])
            sub_80F240C(sprite);
    }
}

static void sub_80F22B0(struct Sprite *sprite)
{
    if (sprite->data[0] == gUnknown_083DFEC4->unk6DAD)
    {
        if (sprite->pos2.x > -16)
            sprite->pos2.x -= 4;
    }
    else
    {
        if (sprite->pos2.x < 0)
            sprite->pos2.x += 4;
    }
}

static bool8 sub_80F22F8(void)
{
    u16 i, j;

    for (i = 0; i < gUnknown_083DFEC4->unk6DAE; i++)
    {
        for (j = 0; j < 4; j++)
        {
            struct Sprite *sprite = gUnknown_083DFEC4->unk320[i][j];
            if (!sprite)
                return TRUE;

            if (sprite->pos2.x != 0 && sprite->pos2.x != -16)
                return FALSE;
        }
    }

    return TRUE;
}

static bool8 sub_80F2360(void)
{
    u16 i, j;

    for (i = 0; i < gUnknown_083DFEC4->unk30E; i++)
    {
        if (i != gUnknown_083DFEC4->unk6DAD)
        {
            for (j = 0; j < 4; j++)
            {
                struct Sprite *sprite = gUnknown_083DFEC4->unk320[i][j];
                if (sprite)
                    return FALSE;
            }
        }
    }

    return TRUE;
}

static bool8 sub_80F23C8(void)
{
    u16 j;

    for (j = 0; j < 4; j++)
    {
        struct Sprite *sprite = gUnknown_083DFEC4->unk320[gUnknown_083DFEC4->unk6DAD][j];
        if (sprite)
            return FALSE;
    }

    return TRUE;
}

static void sub_80F240C(struct Sprite *sprite)
{
    gUnknown_083DFEC4->unk320[sprite->data[0]][sprite->data[1]] = NULL;
    if (sprite->affineAnimEnded)
        FreeOamMatrix(sprite->oam.matrixNum);

    DestroySprite(sprite);
}

static void sub_80F2458(u8 arg0)
{
    switch (arg0)
    {
    case 0:
        gUnknown_083DFEC4->unk380.data = gUnknown_083DFEC4->unk388;
        gUnknown_083DFEC4->unk380.size = sizeof(gUnknown_083DFEC4->unk388);
        gUnknown_083DFEC4->unk380.tag = 0x0;
        break;
    case 1:
        gUnknown_083DFEC4->unk380.data = gUnknown_083DFEC4->unk1788;
        gUnknown_083DFEC4->unk380.size = sizeof(gUnknown_083DFEC4->unk1788);
        gUnknown_083DFEC4->unk380.tag = 0x0;
        break;
    case 2:
        gUnknown_083DFEC4->unk380.data = gUnknown_083DFEC4->unk2388;
        gUnknown_083DFEC4->unk380.size = sizeof(gUnknown_083DFEC4->unk2388);
        gUnknown_083DFEC4->unk380.tag = 0x0;
        break;
    default:
        return;
    }

    LoadSpriteSheet(&gUnknown_083DFEC4->unk380);
}

static void sub_80F2514(u8 arg0)
{
    struct SpritePalette spritePalette;

    switch (arg0)
    {
    case 0:
        spritePalette.data = gPokenavMenuOptions1_Pal;
        spritePalette.tag = 0;
        LoadSpritePalette(&spritePalette);
        spritePalette.data = gPokenavMenuOptions2_Pal;
        spritePalette.tag = 0x1;
        break;
    case 1:
        spritePalette.data = gPokenavConditionMenu_Pal;
        spritePalette.tag = 0x0;
        break;
    case 2:
        spritePalette.data = gPokenavCondition6_Pal;
        spritePalette.tag = 0;
        LoadSpritePalette(&spritePalette);
        spritePalette.data = gPokenavCondition7_Pal;
        spritePalette.tag = 0x1;
        break;
    default:
        return;
    }

    LoadSpritePalette(&spritePalette);
}

static void sub_80F2598(void)
{
    u8 spriteId;

    gUnknown_083DFEC4->unk6D9C = NULL;
    if (DoesSomeoneWantRematchIn(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum) == TRUE)
    {
        LoadSpriteSheet(&gSpriteSheet_PokenavBlueLight);
        LoadSpritePalette(&gSpritePalette_PokenavBlueLight);
        spriteId = CreateSprite(&gSpriteTemplate_83E4484, 12, 96, 0);
        if (spriteId != MAX_SPRITES)
        {
            gUnknown_083DFEC4->unk6D9C = &gSprites[spriteId];
        }
        else
        {
            FreeSpriteTilesByTag(0x19);
            FreeSpritePaletteByTag(0x11);
        }
    }
}

static void sub_80F2620(void)
{
    if (gUnknown_083DFEC4->unk6D9C)
    {
        DestroySprite(gUnknown_083DFEC4->unk6D9C);
        FreeSpriteTilesByTag(0x19);
        FreeSpritePaletteByTag(0x11);
        gUnknown_083DFEC4->unk6D9C = NULL;
    }
}

void sub_80F2654(struct Sprite *sprite)
{
    if (++sprite->data[0] > 6)
    {
        sprite->data[0] = 0;
        sprite->invisible = !sprite->invisible;
    }
}

void sub_80F2688(void)
{
    gUnknown_083DFEC4->unk306 = 0;
    if (!gUnknown_083DFEC4->unk6DAC)
        while(sub_80F26BC());
}

static bool8 sub_80F26BC(void)
{
    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        LZ77UnCompWram(gPokenavMainMenu_Gfx, gUnknown_083DFEC4->unk3B98);
        break;
    case 1:
        LZ77UnCompWram(gPokenavConditionMenuHeader_Gfx, gUnknown_083DFEC4->unk4198);
        break;
    case 2:
        LZ77UnCompWram(gPokenavRibbonsHeader_Gfx, gUnknown_083DFEC4->unk4D98);
        break;
    case 3:
        LZ77UnCompWram(gPokenavHoennMapHeader_Gfx, gUnknown_083DFEC4->unk5398);
        break;
    case 4:
        LZ77UnCompWram(gPokenavConditionMenuOptions_Gfx, gUnknown_083DFEC4->unk5F98);
        break;
    case 5:
        LZ77UnCompWram(gPokenavConditionMenuOptions2_Gfx, gUnknown_083DFEC4->unk6798);
        break;
    case 6:
        LZ77UnCompWram(gPokenavTrainersEyesHeader_Gfx, gUnknown_083DFEC4->unk4798);
        break;
    case 7:
        LoadSpritePalettes(gUnknown_083E449C);
        break;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unk306++;
    return TRUE;
}

static void sub_80F27DC(u8 arg0)
{
    struct SpriteSheet spriteSheet;

    switch (arg0)
    {
    case 0:
        spriteSheet.data = gUnknown_083DFEC4->unk3B98;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk3B98);
        spriteSheet.tag = 0x1;
        break;
    case 1:
        spriteSheet.data = gUnknown_083DFEC4->unk4198;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk4198);
        spriteSheet.tag = 0x1;
        break;
    case 3:
        spriteSheet.data = gUnknown_083DFEC4->unk4798;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk4798);
        spriteSheet.tag = 0x1;
        break;
    case 2:
        spriteSheet.data = gUnknown_083DFEC4->unk4D98;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk4D98);
        spriteSheet.tag = 0x1;
        break;
    case 4:
        spriteSheet.data = gUnknown_083DFEC4->unk5398;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk5398);
        spriteSheet.tag = 0x1;
        break;
    case 5:
        spriteSheet.data = gUnknown_083DFEC4->unk5F98;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk5F98);
        spriteSheet.tag = 0x2;
        break;
    case 6:
        spriteSheet.data = gUnknown_083DFEC4->unk6198;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk6198);
        spriteSheet.tag = 0x2;
        break;
    case 8:
        spriteSheet.data = gUnknown_083DFEC4->unk6398;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk6398);
        spriteSheet.tag = 0x2;
        break;
    case 9:
        spriteSheet.data = gUnknown_083DFEC4->unk6598;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk6598);
        spriteSheet.tag = 0x2;
        break;
    case 11:
        spriteSheet.data = gUnknown_083DFEC4->unk6998;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk6998);
        spriteSheet.tag = 0x2;
        break;
    case 10:
        spriteSheet.data = gUnknown_083DFEC4->unk6798;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk6798);
        spriteSheet.tag = 0x2;
        break;
    case 7:
        spriteSheet.data = gUnknown_083DFEC4->unk6B98;
        spriteSheet.size = sizeof(gUnknown_083DFEC4->unk6B98);
        spriteSheet.tag = 0x2;
        break;
    default:
        return;
    }

    LoadSpriteSheet(&spriteSheet);
}

void sub_80F29B8(u8 arg0)
{
    u16 i;
    s16 deltaX, endX, initialX;
    u16 y;
    s16 width;
    struct Sprite **sprites;
    const struct SpriteTemplate *spriteTemplate;
    u8 spriteId;

    spriteTemplate = NULL;
    switch (arg0)
    {
    case 0:
    case 1:
    case 2:
    case 3:
        initialX = -96;
        y = 49 - gUnknown_083DFEC4->unk030C;
        deltaX = 8;
        endX = 32;
        width = 64;
        sprites = gUnknown_083DFEC4->unk3B88;
        spriteTemplate = arg0 != 3 ? &gSpriteTemplate_83E44E0 : &gSpriteTemplate_83E44F8;
        break;
    case 4:
        initialX = 272;
        y = 49 - gUnknown_083DFEC4->unk030C;
        deltaX = -8;
        endX = 152;
        width = 64;
        spriteTemplate = &gSpriteTemplate_83E44E0;
        sprites = gUnknown_083DFEC4->unk3B88;
        break;
    case 5:
    case 6:
    case 8:
    case 9:
        spriteTemplate = &gSpriteTemplate_83E4530;
        // fall through
    case 7:
    case 10:
    case 11:
        if (spriteTemplate == NULL)
            spriteTemplate = &gSpriteTemplate_83E4548;

        initialX = -96;
        y = 68 - gUnknown_083DFEC4->unk030C;
        deltaX = 8;
        endX = 16;
        width = 32;
        sprites = gUnknown_083DFEC4->unk3B90;
        break;
    default:
        return;
    }

    for (i = 0; i < 2; i++)
    {
        spriteId = CreateSprite(spriteTemplate, i * width + initialX, y, 0);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].data[0] = deltaX;
            gSprites[spriteId].data[1] =  endX + i * width;
            gSprites[spriteId].data[2] = i;
            gSprites[spriteId].data[3] = arg0;
            if (arg0 == 4 && i == 1)
            {
                int anim = !gUnknown_083DFEC4->regionMap.zoomed ? 1 : 2;
                StartSpriteAnim(&gSprites[spriteId], anim);
            }
            else
            {
                StartSpriteAnim(&gSprites[spriteId], i);
            }

            if (arg0 < 4 && i == 1)
            {
                gSprites[spriteId].oam.shape = ST_OAM_SQUARE;
                gSprites[spriteId].oam.size = 2;
            }

            sprites[i] = &gSprites[spriteId];
        }
    }
}

#define sEndX sprite->data[1]
void sub_80F2BBC(struct Sprite *sprite)
{
    s16 x = sprite->pos1.x;
    sprite->pos1.x += sprite->data[0];
    if ((x <= sEndX && sprite->pos1.x >= sEndX) || (x >= sEndX && sprite->pos1.x <= sEndX))
    {
        sprite->pos1.x = sEndX;
        if (sprite->data[3] == 4 && sprite->data[2] == 1)
            sprite->callback = sub_80F2C58;
        else
            sprite->callback = SpriteCallbackDummy;
    }
}
#undef sEndX

static void sub_80F2C14(struct Sprite *sprite)
{
    u16 right;

    sprite->pos1.x -= sprite->data[0];
    right = sprite->pos1.x + 32;
    if (right > 304)
    {
        if (sprite->data[2] == 1)
        {
            if (sprite->data[3] < 5)
                FreeSpriteTilesByTag(0x1);
            else
                FreeSpriteTilesByTag(0x2);
        }

        DestroySprite(sprite);
    }
}

static void sub_80F2C58(struct Sprite *sprite)
{
    int anim = !gUnknown_083DFEC4->regionMap.zoomed ? 1 : 2;
    StartSpriteAnim(sprite, anim);
}

void sub_80F2C80(u8 arg0)
{
    gUnknown_083DFEC4->unk306 = 0;
    if (!gUnknown_083DFEC4->unk6DAC)
        while (sub_80F2CBC(arg0));
}

bool8 sub_80F2CBC(u8 arg0)
{
    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        sub_80F27DC(arg0);
        gUnknown_083DFEC4->unk306++;
        return TRUE;
    case 1:
        sub_80F29B8(arg0);
        gUnknown_083DFEC4->unk306++;
        return FALSE;
    default:
        return FALSE;
    }
}

static void sub_80F2D04(u8 arg0)
{
    u16 i;

    if (arg0 < 5)
    {
        for (i = 0; i < 2; i++)
            gUnknown_083DFEC4->unk3B88[i]->callback = sub_80F2C14;
    }
    else
    {
        for (i = 0; i < 2; i++)
            gUnknown_083DFEC4->unk3B90[i]->callback = sub_80F2C14;
    }
}

static void sub_80F2D6C(u8 arg0)
{
    u16 i;

    if (arg0 < 5)
    {
        FreeSpriteTilesByTag(0x1);
        for (i = 0; i < 2; i++)
            DestroySprite(gUnknown_083DFEC4->unk3B88[i]);
    }
    else
    {
        FreeSpriteTilesByTag(0x2);
        for (i = 0; i < 2; i++)
            DestroySprite(gUnknown_083DFEC4->unk3B90[i]);
    }
}

static void sub_80F2DD8(void)
{
    CreateRegionMapCursor(7, 7);
    CreateRegionMapPlayerIcon(8, 8);
    sub_80FBF94();
}

static void sub_80F2DF4(void)
{
    FreeRegionMapIconResources();
}

void sub_80F2E00(struct Sprite *sprite)
{
    sprite->pos1.x = gUnknown_083DFEC4->unk8766 + 38;
}

static void sub_80F2E18(u8 arg0)
{
    u8 spriteId;
    struct SpriteTemplate spriteTemplate;
    struct SpritePalette spritePalette;
    struct SpriteSheet spriteSheet;

    if (!gUnknown_083DFEC4->unk8768)
    {
        spriteSheet = gUnknown_083E4568;
        spriteTemplate = gSpriteTemplate_83E4570;
        spritePalette = gUnknown_083E4588;

        spriteSheet.data = gUnknown_083DFEC4->unkD1E4[arg0];
        spritePalette.data = gUnknown_083DFEC4->unk0[arg0];
        gUnknown_083DFEC4->unkD1DC = LoadSpritePalette(&spritePalette);
        gUnknown_083DFEC4->unkD1DE = LoadSpriteSheet(&spriteSheet);

        spriteId = CreateSprite(&spriteTemplate, 38, 104, 0);
        if (spriteId == MAX_SPRITES)
        {
            FreeSpriteTilesByTag(0x6);
            FreeSpritePaletteByTag(0x6);
            gUnknown_083DFEC4->unk8768 = NULL;
        }
        else
        {
            gUnknown_083DFEC4->unk8768 = &gSprites[spriteId];
            gUnknown_083DFEC4->unkD1E0 = (void *)(VRAM + 0x10000) + gUnknown_083DFEC4->unkD1DE * 32;
            gUnknown_083DFEC4->unkD1DC = gUnknown_083DFEC4->unkD1DC * 16 + 0x100;
        }
    }
    else
    {
        DmaCopy16Defvars(3, gUnknown_083DFEC4->unkD1E4[arg0], gUnknown_083DFEC4->unkD1E0, 0x800);
        LoadPalette(gUnknown_083DFEC4->unk0[arg0], gUnknown_083DFEC4->unkD1DC, 0x20);
    }
}

void sub_80F2F48(void)
{
    if (gUnknown_083DFEC4->unk8768)
    {
        DestroySprite(gUnknown_083DFEC4->unk8768);
        FreeSpriteTilesByTag(0x6);
        FreeSpritePaletteByTag(0x6);
        gUnknown_083DFEC4->unk8768 = NULL;
    }
}

void sub_80F2F7C(u8 arg0)
{
    sub_80F2E18(arg0);
    gUnknown_083DFEC4->unkCED0 = gUnknown_083DFEC4->unk8768;
    gUnknown_083DFEC4->unkCED0->callback = sub_80F2FEC;
}

static void sub_80F2FB0(void)
{
    if (gUnknown_083DFEC4->unkCED0)
    {
        DestroySprite(gUnknown_083DFEC4->unkCED0);
        FreeSpriteTilesByTag(0x6);
        FreeSpritePaletteByTag(0x6);
        gUnknown_083DFEC4->unkCED0 = NULL;
        gUnknown_083DFEC4->unk8768 = NULL;
    }
}

static void sub_80F2FEC(struct Sprite *sprite)
{
    sprite->pos1.x = gUnknown_083DFEC4->unkD15A + 40;
    sprite->pos1.y = 104;
}

static void sub_80F3008(u8 arg0)
{
    u16 i;
    u8 spriteId;
    struct SpritePalette spritePalette;
    struct SpriteSheet spriteSheets[3];

    memcpy(spriteSheets, gUnknown_083E4590, sizeof(gUnknown_083E4590));
    spritePalette = gUnknown_083E45A8;
    switch (arg0)
    {
    case 1:
    case 2:
        spritePalette.data = gUnknown_08E9F988;
        break;
    }

    LoadSpriteSheets(spriteSheets);
    LoadSpritePalette(&spritePalette);
    spriteId = CreateSprite(&gSpriteTemplate_83E45B8, 95, 0, 0);
    if (spriteId == MAX_SPRITES)
    {
        gUnknown_083DFEC4->unk87CC = NULL;
    }
    else
    {
        gUnknown_083DFEC4->unk87CC = &gSprites[spriteId];
        for (i = 0; i < 2; i++)
        {
            spriteId = CreateSprite(&gSpriteTemplate_83E45F0, 168, i * 128 + 8, 0);
            if (spriteId != MAX_SPRITES)
            {
                gUnknown_083DFEC4->unk87D0[i] = &gSprites[spriteId];
                gSprites[spriteId].invisible = 1;
                gSprites[spriteId].data[0] = 0;
                gSprites[spriteId].data[1] = 0;
                gSprites[spriteId].data[2] = i == 0 ? -1 : 1;
                gSprites[spriteId].data[3] = i;
                gSprites[spriteId].data[4] = 1;
                StartSpriteAnim(&gSprites[spriteId], i);
            }
            else
            {
                gUnknown_083DFEC4->unk87D0[i] = NULL;
            }
        }
    }
}

static void sub_80F3130(void)
{
    u16 i;

    if (gUnknown_083DFEC4->unk87CC)
    {
        DestroySprite(gUnknown_083DFEC4->unk87CC);
        FreeSpriteTilesByTag(0x9);
        FreeSpritePaletteByTag(0x9);
        gUnknown_083DFEC4->unk87CC = NULL;
    }

    for (i = 0; i < 2; i++)
    {
        if (gUnknown_083DFEC4->unk87D0[i])
        {
            DestroySprite(gUnknown_083DFEC4->unk87D0[i]);
            gUnknown_083DFEC4->unk87D0[i] = NULL;
        }
    }

    FreeSpriteTilesByTag(0xA);
}

void sub_80F3190(struct Sprite *sprite)
{
    sprite->pos1.y = gUnknown_083DFEC4->unk876C * 16 + 16;
}

void sub_80F31AC(struct Sprite *sprite)
{
    if (gUnknown_083DFEC4->unk87C9)
    {
        if (sprite->data[4])
        {
            if (!sprite->data[3])
                sprite->invisible = gUnknown_083DFEC4->unk8770 == 0;
            else
                sprite->invisible = gUnknown_083DFEC4->unk8772 == gUnknown_083DFEC4->unk8774;

            sprite->data[4] = 0;
        }

        if (++sprite->data[0] > 4)
        {
            sprite->data[0] = 0;
            if (++sprite->data[1] < 5)
            {
                sprite->pos2.y += sprite->data[2];
            }
            else
            {
                sprite->data[1] = 0;
                sprite->pos2.y = 0;
            }
        }
    }
}

static void sub_80F3264(void)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        if (gUnknown_083DFEC4->unk87D0[i])
            gUnknown_083DFEC4->unk87D0[i]->data[4] = 1;
    }
}

static void sub_80F3294(u8 arg0)
{
    gUnknown_083DFEC4->unk87CC->invisible = arg0;
    if (gUnknown_083DFEC4->unk87C9)
    {
        if (arg0 == 1)
        {
            gUnknown_083DFEC4->unk87D0[0]->invisible = arg0;
            gUnknown_083DFEC4->unk87D0[1]->invisible = arg0;
        }
        else
        {
            gUnknown_083DFEC4->unk87D0[0]->data[4] = 1;
            gUnknown_083DFEC4->unk87D0[1]->data[4] = 1;
        }
    }
}

void sub_80F3328(struct Sprite *sprite)
{
    if (sprite->data[0] == gUnknown_083DFEC4->unk87DC)
        StartSpriteAnim(sprite, 0);
    else
        StartSpriteAnim(sprite, 1);
}

static void sub_80F3360(struct Sprite *sprite)
{
    if (gUnknown_083DFEC4->unk87DC == gUnknown_083DFEC4->unk87DA - 1)
        sprite->oam.paletteNum = IndexOfSpritePaletteTag(0x4);
    else
        sprite->oam.paletteNum = IndexOfSpritePaletteTag(0x5);
}

void sub_80F33A8(void)
{
    u16 i;
    u8 spriteId;
    struct SpriteSheet spriteSheets[4];
    struct SpritePalette spritePalettes[3];
    struct SpriteTemplate spriteTemplate;

    memcpy(spriteSheets, gUnknown_083E4628, sizeof(gUnknown_083E4628));
    memcpy(spritePalettes, gUnknown_083E4648, sizeof(gUnknown_083E4648));
    spriteTemplate = gSpriteTemplate_83E4660;
    LoadSpriteSheets(spriteSheets);
    LoadSpritePalettes(spritePalettes);

    for (i = 0; i < gUnknown_083DFEC4->unk87DA - 1; i++)
    {
        spriteId = CreateSprite(&spriteTemplate, 226, i * 20 + 8, 0);
        if (spriteId != MAX_SPRITES)
        {
            gUnknown_083DFEC4->unk87E4[i] = &gSprites[spriteId];
            gUnknown_083DFEC4->unk87E4[i]->data[0] = i;
        }
        else
        {
            gUnknown_083DFEC4->unk87E4[i] = NULL;   
        }
    }

    spriteTemplate.tileTag = 0x4;
    spriteTemplate.callback = SpriteCallbackDummy;
    for (; i < 6; i++)
    {
        spriteId = CreateSprite(&spriteTemplate, 230, i * 20 + 8, 0);
        if (spriteId != MAX_SPRITES)
        {
            gUnknown_083DFEC4->unk87E4[i] = &gSprites[spriteId];
            gUnknown_083DFEC4->unk87E4[i]->oam.size = 0;
        }
        else
        {
            gUnknown_083DFEC4->unk87E4[i] = NULL;
        }
    }

    spriteTemplate.tileTag = 0x5;
    spriteTemplate.callback = sub_80F3360;
    spriteId = CreateSprite(&spriteTemplate, 222, i * 20 + 8, 0);
    if (spriteId != MAX_SPRITES)
    {
        gUnknown_083DFEC4->unk87E4[i] = &gSprites[spriteId];
        gUnknown_083DFEC4->unk87E4[i]->oam.shape = ST_OAM_H_RECTANGLE;
        gUnknown_083DFEC4->unk87E4[i]->oam.size = 2;
    }
    else
    {
        gUnknown_083DFEC4->unk87E4[i] = NULL;
    }
}

void sub_80F357C(void)
{
    u16 i;

    for (i = 0; i < 7; i++)
    {
        if (gUnknown_083DFEC4->unk87E4[i])
        {
            DestroySprite(gUnknown_083DFEC4->unk87E4[i]);
            gUnknown_083DFEC4->unk87E4[i] = NULL;
        }
    }
}

static void sub_80F35B4(void)
{
    struct Sprite *sprite;

    gUnknown_083DFEC4->unk76B0.baseTileTag = 0x1C;
    gUnknown_083DFEC4->unk76B0.basePaletteTag = 0x13;
    sub_80F727C(&gUnknown_083DFEC4->unk76B0);
    sub_80F7404();
    sprite = sub_80F7920(27, 21, gUnknown_083E4678);
    sprite->oam.priority = 3;
    sprite->pos1.x = 192;
    sprite->pos1.y = 32;
    sprite->callback = sub_80F363C;
    gUnknown_083DFEC4->unk76AC = sprite;
}

void sub_80F3614(void)
{
    DestroySprite(gUnknown_083DFEC4->unk76AC);
    FreeSpriteTilesByTag(0x1B);
    FreeSpritePaletteByTag(0x15);
}

static void sub_80F363C(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, gUnknown_083DFEC4->unk8934[gUnknown_083DFEC4->unk8fe9]);
}

void sub_80F3668(void)
{
    sub_80F7418(gUnknown_083DFEC4->unk8934[gUnknown_083DFEC4->unk8fe9], 176, 32);
}

void sub_80F3698(void)
{
    struct UnkUsePokeblockSub *var0 = &gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC];
    gUnknown_083DFEC4->unk8934[gUnknown_083DFEC4->unk8fe9] = gUnknown_083DFEC4->unk76B0.markings;
    SetMonMarkings(var0->unk1, var0->partyIdx, gUnknown_083DFEC4->unk76B0.markings);
    sub_80F7470();
}

static void sub_80F36F0(void)
{
    gUnknown_083DFEC4->unk306 = 0;
    if (!gUnknown_083DFEC4->unk6DAC)
        while (sub_80F3724());
}

static bool8 sub_80F3724(void)
{
    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        LZ77UnCompWram(gUnknown_083E3D00, gUnknown_083DFEC4->unk984C);
        break;
    case 1:
        sub_80F379C();
        gUnknown_083DFEC4->unk306++;
        // fall through
    case 2:
        if (sub_80F37D0())
            return TRUE;
        break;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unk306++;
    return TRUE;
}

static void sub_80F379C(void)
{
    gUnknown_083DFEC4->unkBC93 = 0;
    if (!gUnknown_083DFEC4->unk6DAC)
        while (sub_80F37D0());
}

static bool8 sub_80F37D0(void)
{
    u16 i;
    u8 j, k, l, m;

    if (gUnknown_083DFEC4->unkBC93 > 11)
        return FALSE;

    for (i = 0; i < 2; i++)
    {
        u8 *r4 = &gUnknown_083DFEC4->unk984C[gUnknown_083DFEC4->unkBC93][0];
        u8 *r5 = &gUnknown_083DFEC4->unkA44C[gUnknown_083DFEC4->unkBC93][0];
        for (j = 0; j < 4; j++)
        {
            CpuFastSet(r4, r5, 0x10);
            r5 += 0x40;
            r4 += 0x20;
            for (k = 0; k < 2; k++)
            {
                for (l = 0; l < 8; l++)
                {
                    r4 += 4;
                    for (m = 0; m < 4; m++)
                    {
                        r4 -= 1;
                        *r5 = (*r4 << 4) | ((*r4 >> 4) & 0xF);
                        r5++;
                    }

                    r4 += 4;
                }

                r4 -= 0x40;
            }
            
            r4 += 0x60;
        }

        if (++gUnknown_083DFEC4->unkBC93 > 11)
            return FALSE;
    }

    if (gUnknown_083DFEC4->unkBC93 > 11)
        return FALSE;

    return TRUE;
}

static void sub_80F38B8(void)
{
    gUnknown_083DFEC4->unk306 = 0;
    if (!gUnknown_083DFEC4->unk6DAC)
        while (sub_80F38EC());
}

static bool8 sub_80F38EC(void)
{
    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        gUnknown_083DFEC4->unk9348 = NULL;
        gUnknown_083DFEC4->unkBC92 = 0;
        break;
    case 1:
        sub_80F2E18(0);
        break;
    case 2:
        sub_80F3970();
        gUnknown_083DFEC4->unk306++;
        // fall through
    case 3:
        if (sub_80F39A4())
            return TRUE;
        break;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unk306++;
    return TRUE;
}

static void sub_80F3970(void)
{
    gUnknown_083DFEC4->unkBC93 = 0;
    if (!gUnknown_083DFEC4->unk6DAC)
        while (sub_80F39A4());
}

static bool8 sub_80F39A4(void)
{
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette;
    if (gUnknown_083DFEC4->unkBC93 > 11)
        return FALSE;

    spriteSheet.data = &gUnknown_083DFEC4->unkA44C[gUnknown_083DFEC4->unkBC93][0];
    spriteSheet.size = 0x200;
    spriteSheet.tag = gUnknown_083DFEC4->unkBC93 + 11;
    LoadSpriteSheet(&spriteSheet);
    if (gUnknown_083DFEC4->unkBC93 < 5)
    {
        spritePalette.data = gUnknown_083E3C60[gUnknown_083DFEC4->unkBC93];
        spritePalette.tag = gUnknown_083DFEC4->unkBC93 + 10;
        LoadSpritePalette(&spritePalette);
    }

    if (++gUnknown_083DFEC4->unkBC93 > 11)
        return FALSE;

    return TRUE;
}

static struct Sprite *sub_80F3A3C(u16 arg0, u16 arg1)
{
    struct SpriteTemplate spriteTemplate;
    u16 var0;
    u8 ribbon;
    u8 spriteId;

    if (arg1 < 3)
        var0 = arg0 + arg1 * 9;
    else
        var0 = arg0 + (gUnknown_083DFEC4->unkBC8E - gUnknown_083DFEC4->unkBC8F);

    ribbon = gUnknown_083DFEC4->unkBC4C[var0];
    spriteTemplate = gSpriteTemplate_83E476C;
    spriteTemplate.tileTag = gPokenavRibbonsIconGfx[ribbon][0] + 11;
    spriteTemplate.paletteTag = gPokenavRibbonsIconGfx[ribbon][1] + 10;
    spriteId = CreateSprite(&spriteTemplate, arg0 * 16 + 96, arg1 * 16 + 40, 2);
    if (spriteId != MAX_SPRITES)
        return &gSprites[spriteId];
    else
        return NULL;
}

static void sub_80F3B00(void)
{
    gUnknown_083DFEC4->unk9348 = sub_80F3A3C(gUnknown_083DFEC4->unkBC90, gUnknown_083DFEC4->unkBC91);
    if (gUnknown_083DFEC4->unk9348)
    {
        StartSpriteAffineAnim(gUnknown_083DFEC4->unk9348, 1);
        gUnknown_083DFEC4->unkBC92 = 1;
    }
    else
    {
        gUnknown_083DFEC4->unkBC92 = 0;
    }
}

static bool8 sub_80F3B58(void)
{
    if (gUnknown_083DFEC4->unkBC92)
    {
        gUnknown_083DFEC4->unkBC92 = !gUnknown_083DFEC4->unk9348->affineAnimEnded;
        return gUnknown_083DFEC4->unkBC92;
    }
    else
    {
        return FALSE;
    }
}

static void sub_80F3B94(void)
{
    if (gUnknown_083DFEC4->unk9348)
    {
        StartSpriteAffineAnim(gUnknown_083DFEC4->unk9348, 2);
        gUnknown_083DFEC4->unkBC92 = 1;
    }
    else
    {
        gUnknown_083DFEC4->unkBC92 = 0;
    }
}

static bool8 sub_80F3BD4(void)
{
    if (gUnknown_083DFEC4->unkBC92)
    {
        gUnknown_083DFEC4->unkBC92 = !gUnknown_083DFEC4->unk9348->affineAnimEnded;
        if (!gUnknown_083DFEC4->unkBC92)
        {
            FreeOamMatrix(gUnknown_083DFEC4->unk9348->oam.matrixNum);
            DestroySprite(gUnknown_083DFEC4->unk9348);
            gUnknown_083DFEC4->unk9348 = NULL;
        }

        return gUnknown_083DFEC4->unkBC92;
    }
    else
    {
        return FALSE;
    }
}

static void sub_80F3C2C(void)
{
    u16 i;

    if (gUnknown_083DFEC4->unk9348)
    {
        FreeOamMatrix(gUnknown_083DFEC4->unk9348->oam.matrixNum);
        DestroySprite(gUnknown_083DFEC4->unk9348);
        gUnknown_083DFEC4->unk9348 = NULL;
    }

    for (i = 0; i < 12; i++)
        FreeSpriteTilesByTag(i + 0xB);
    
    for (i = 0; i < 5; i++)
        FreeSpritePaletteByTag(i + 0xA);
    
    sub_80F2F48();
}

void sub_80F3C94(void)
{
    u16 i;
    struct SpriteSheet spriteSheet;
    struct SpritePalette spritePalette;

    spriteSheet = gUnknown_083E4784;
    spritePalette = gUnknown_083E478C;
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&spritePalette);
    for (i = 0; i < 10; i++)
        gUnknown_083DFEC4->unk8800[i] = NULL;
}

void sub_80F3CE8(void)
{
    move_anim_execute();
    FreeSpriteTilesByTag(0x17);
    FreeSpritePaletteByTag(0xF);
}

void sub_80F3D00(void)
{
    u8 spriteId;
    u16 i;
    u8 var1;
    struct UnkUsePokeblockSub *var0 = &gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC];

    if (!var0->unk4)
        return;

    var1 = gUnknown_083DFEC4->unk8931[gUnknown_083DFEC4->unk8fe9];
    for (i = 0; i < var1 + 1; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83E4800, 0, 0, 0);
        if (spriteId != MAX_SPRITES)
        {
            gUnknown_083DFEC4->unk8800[i] = &gSprites[spriteId];
            gUnknown_083DFEC4->unk8800[i]->invisible = 1;
        }
        else
        {
            break;
        }
    }

    sub_80F3F20(var1, 1);
}

void move_anim_execute(void)
{
    u16 i;

    for (i = 0; i < 10; i++)
    {
        if (!gUnknown_083DFEC4->unk8800[i])
            return;
        
        DestroySprite(gUnknown_083DFEC4->unk8800[i]);
        gUnknown_083DFEC4->unk8800[i] = NULL;
    }
}

void sub_80F3DDC(struct Sprite *sprite)
{
    if (++sprite->data[1] > 60)
    {
        sprite->data[1] = 0;
        sub_80F3F20(sprite->data[2], 0);
    }
}

static void sub_80F3E04(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        sprite->data[1] = 0;
        sprite->callback = sub_80F3DDC;
    }
}

static void sub_80F3E24(struct Sprite *sprite)
{
    if (gUnknown_083DFEC4->unk8768)
    {
        sprite->pos1.x = gUnknown_083DFEC4->unk8768->pos1.x
                       + gUnknown_083DFEC4->unk8768->pos2.x
                       + gUnknown_083E4794[sprite->data[0]][0];
        sprite->pos1.y = gUnknown_083DFEC4->unk8768->pos1.y
                       + gUnknown_083DFEC4->unk8768->pos2.y
                       + gUnknown_083E4794[sprite->data[0]][1];
    }
    else
    {
        sprite->pos1.x = gUnknown_083E4794[sprite->data[0]][0] + 40;
        sprite->pos1.y = gUnknown_083E4794[sprite->data[0]][1] + 104;
    }
}

static void sub_80F3E9C(struct Sprite *sprite)
{
    if (sprite->data[1])
    {
        if (--sprite->data[1])
            return;

        SeekSpriteAnim(sprite, 0);
        sprite->invisible = 0;
    }

    sub_80F3E24(sprite);
    if (sprite->animEnded)
    {
        sprite->invisible = 1;
        if (sprite->data[3] == sprite->data[2])
        {
            if (sprite->data[3] == 9)
            {
                sub_80F3FAC();
                sprite->callback = sub_80F3E04;
            }
            else
            {
                sprite->callback = sub_80F3DDC;
            }
        }
        else
        {
            sprite->callback = SpriteCallbackDummy;
        }
    }
}

static void sub_80F3F20(u8 arg0, u8 arg1)
{
    u16 i;

    for (i = 0; i < 10; i++)
    {
        if (gUnknown_083DFEC4->unk8800[i])
        {
            gUnknown_083DFEC4->unk8800[i]->data[0] = i;
            gUnknown_083DFEC4->unk8800[i]->data[1] = i * 16 + 1;
            gUnknown_083DFEC4->unk8800[i]->data[2] = arg0;
            gUnknown_083DFEC4->unk8800[i]->data[3] = i;

            if (!arg1 || arg0 != 9)
            {
                gUnknown_083DFEC4->unk8800[i]->callback = sub_80F3E9C;
            }
            else
            {
                sub_80F3E24(gUnknown_083DFEC4->unk8800[i]);
                sub_80F3FAC();
                gUnknown_083DFEC4->unk8800[i]->callback = sub_80F3E04;
                gUnknown_083DFEC4->unk8800[i]->invisible = 0;
            }
        }
    }
}

static void sub_80F3FAC(void)
{
    u16 i;

    for (i = 0; i < 10; i++)
    {
        if (gUnknown_083DFEC4->unk8800[i])
        {
            SeekSpriteAnim(gUnknown_083DFEC4->unk8800[i], 0);
            gUnknown_083DFEC4->unk8800[i]->invisible = 0;
        }
    }
}

static void sub_80F3FF0(void)
{
    gUnknown_083DFEC4->unk306 = 0;
    if (!gUnknown_083DFEC4->unk6DAC)
        while (sub_80F4024());
}

static bool8 sub_80F4024(void)
{
    u8 paletteIndex;
    u8 spriteId;
    struct SpritePalette spritePalette;

    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        LZ77UnCompWram(gUnknown_083E329C, gUnknown_083DFEC4->unk131E4);
        break;
    case 1:
    {
        struct SpriteSheet spriteSheet = {
            .data = gUnknown_083DFEC4->unk131E4,
            .size = sizeof(gUnknown_083DFEC4->unk131E4),
            .tag = 0x18,
        };
        LoadSpriteSheet(&spriteSheet);
        break;
    }
    case 2:
        spritePalette = gUnknown_083E4818;
        LoadSpritePalette(&spritePalette);
        paletteIndex = IndexOfSpritePaletteTag(0x10);
        gUnknown_083DFEC4->unk308 = -3 & ~(1 << (paletteIndex + 0x10));
        break;
    case 3:
        spriteId = CreateSprite(&gSpriteTemplate_83E4850, 218, 14, 0);
        if (spriteId != MAX_SPRITES)
        {
            gUnknown_083DFEC4->unk6D98 = &gSprites[spriteId];
            gUnknown_083DFEC4->unk6D98->data[0] = 0;
        }
        else
        {
            gUnknown_083DFEC4->unk6D98 = NULL;
        }

        gUnknown_083DFEC4->unk306++;
        return FALSE;
    default:
        return FALSE;
    }

    gUnknown_083DFEC4->unk306++;
    return TRUE;
}

void sub_80F4138(struct Sprite *sprite)
{
    sprite->pos2.y = -gUnknown_083DFEC4->unk030C;
    if (sprite->pos2.y <= -32)
    {
        if (sprite->data[0] == 0)
        {
            sprite->invisible = 1;
            sprite->data[0] = 1;
        }
    }
    else
    {
        if (sprite->data[0] == 1)
        {
            sprite->invisible = 0;
            sprite->data[0] = 0;
        }
    }
}

#ifdef NONMATCHING
// close, but the last DmaCopy16 is sharing the 0x400 value from the beginning of the function.
void sub_80F4194(u8 *arg0, u8 *text)
{
    u8 i;
    u8 *tileBuffer;
    u32 *tileBuf2;

    tileBuffer = gUnknown_083DFEC8;
    DmaFill16(3, 0x1111, tileBuffer, 0x280);
    DmaFill16Defvars(3, 0x1111, 0x400 + tileBuffer, 0x280);
    Text_InitWindow8004E3C(&gWindowTemplate_81E70F0, tileBuffer, text);

    DmaClear16(3, tileBuffer + 0x220, 0x60);
    DmaClear16(3, tileBuffer + 0x620, 0x60);

    tileBuf2 = (int *)tileBuffer + 0x80;
    tileBuf2[0] &= 0x0FFFFFFF;
    tileBuf2[1] &= 0x0FFFFFFF;
    tileBuf2[2] &= 0x0FFFFFFF;
    tileBuf2[3] &= 0x0FFFFFFF;
    tileBuf2[4] &= 0x0FFFFFFF;
    tileBuf2[5] &= 0x0FFFFFFF;
    tileBuf2[6] &= 0x0FFFFFFF;
    tileBuf2[7] &= 0x0FFFFFFF;

    tileBuf2 = (int *)tileBuffer + 0x180;
    tileBuf2[0] &= 0x0FFFFFFF;
    tileBuf2[1] &= 0x0FFFFFFF;
    tileBuf2[2] &= 0x0FFFFFFF;
    tileBuf2[3] &= 0x0FFFFFFF;
    tileBuf2[4] &= 0x0FFFFFFF;
    tileBuf2[5] &= 0x0FFFFFFF;
    tileBuf2[6] &= 0x0FFFFFFF;
    tileBuf2[7] &= 0x0FFFFFFF;

    for (i = 0; i < 5; i++)
    {
        DmaCopy16(3, &tileBuffer[128 * i], &arg0[i * 256], 128);
        DmaCopy16(3, &tileBuffer[128 * i + 0x400], &arg0[32 * ((i * 8) + 4)], 128);
    }
}
#else
NAKED
void sub_80F4194(u8 *arg0, u8 *text)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x4\n\
    adds r7, r0, 0\n\
    adds r2, r1, 0\n\
    ldr r0, _080F42A4 @ =gUnknown_083DFEC8\n\
    ldr r6, [r0]      @ r6 = tileBuffer\n\
    mov r0, sp        \n\
    ldr r1, _080F42A8 @ =0x00001111\n\
    adds r5, r1, 0\n\
    strh r5, [r0]\n\
    ldr r4, _080F42AC @ =0x040000d4\n\
    str r0, [r4]\n\
    str r6, [r4, 0x4]\n\
    ldr r3, _080F42B0 @ =0x81000140\n\
    str r3, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 3\n\
    adds r1, r6, r0\n\
    mov r0, sp\n\
    strh r5, [r0]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    str r3, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    ldr r0, _080F42B4 @ =gWindowTemplate_81E70F0\n\
    adds r1, r6, 0\n\
    bl Text_InitWindow8004E3C\n\
    movs r3, 0x88\n\
    lsls r3, 2\n\
    adds r1, r6, r3\n\
    mov r0, sp\n\
    movs r3, 0\n\
    strh r3, [r0]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    ldr r2, _080F42B8 @ =0x81000030\n\
    str r2, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    movs r0, 0xC4\n\
    lsls r0, 3\n\
    adds r1, r6, r0\n\
    mov r0, sp\n\
    strh r3, [r0]\n\
    str r0, [r4]\n\
    str r1, [r4, 0x4]\n\
    str r2, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    movs r1, 0x80\n\
    lsls r1, 2\n\
    adds r2, r6, r1\n\
    ldr r0, [r2]\n\
    ldr r1, _080F42BC @ =0x0fffffff\n\
    ands r0, r1\n\
    str r0, [r2]\n\
    ldr r0, [r2, 0x4]\n\
    ands r0, r1\n\
    str r0, [r2, 0x4]\n\
    ldr r0, [r2, 0x8]\n\
    ands r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0xC]\n\
    ands r0, r1\n\
    str r0, [r2, 0xC]\n\
    ldr r0, [r2, 0x10]\n\
    ands r0, r1\n\
    str r0, [r2, 0x10]\n\
    ldr r0, [r2, 0x14]\n\
    ands r0, r1\n\
    str r0, [r2, 0x14]\n\
    ldr r0, [r2, 0x18]\n\
    ands r0, r1\n\
    str r0, [r2, 0x18]\n\
    ldr r0, [r2, 0x1C]\n\
    ands r0, r1\n\
    str r0, [r2, 0x1C]\n\
    movs r3, 0xC0\n\
    lsls r3, 3\n\
    adds r2, r6, r3\n\
    ldr r0, [r2]\n\
    ands r0, r1\n\
    str r0, [r2]\n\
    ldr r0, [r2, 0x4]\n\
    ands r0, r1\n\
    str r0, [r2, 0x4]\n\
    ldr r0, [r2, 0x8]\n\
    ands r0, r1\n\
    str r0, [r2, 0x8]\n\
    ldr r0, [r2, 0xC]\n\
    ands r0, r1\n\
    str r0, [r2, 0xC]\n\
    ldr r0, [r2, 0x10]\n\
    ands r0, r1\n\
    str r0, [r2, 0x10]\n\
    ldr r0, [r2, 0x14]\n\
    ands r0, r1\n\
    str r0, [r2, 0x14]\n\
    ldr r0, [r2, 0x18]\n\
    ands r0, r1\n\
    str r0, [r2, 0x18]\n\
    ldr r0, [r2, 0x1C]\n\
    ands r0, r1\n\
    str r0, [r2, 0x1C]\n\
    movs r1, 0\n\
    ldr r2, _080F42C0 @ =0x80000040\n\
_080F4268:\n\
    lsls r0, r1, 7\n\
    adds r0, r6, r0\n\
    str r0, [r4]\n\
    lsls r0, r1, 8\n\
    adds r0, r7, r0\n\
    str r0, [r4, 0x4]\n\
    str r2, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    lsls r0, r1, 7\n\
    movs r3, 0x80\n\
    lsls r3, 3\n\
    adds r0, r3\n\
    adds r0, r6, r0\n\
    str r0, [r4]\n\
    lsls r0, r1, 3\n\
    adds r0, 0x4\n\
    lsls r0, 5\n\
    adds r0, r7, r0\n\
    str r0, [r4, 0x4]\n\
    str r2, [r4, 0x8]\n\
    ldr r0, [r4, 0x8]\n\
    adds r0, r1, 0x1\n\
    lsls r0, 24\n\
    lsrs r1, r0, 24\n\
    cmp r1, 0x4\n\
    bls _080F4268\n\
    add sp, 0x4\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080F42A4: .4byte gUnknown_083DFEC8\n\
_080F42A8: .4byte 0x00001111\n\
_080F42AC: .4byte 0x040000d4\n\
_080F42B0: .4byte 0x81000140\n\
_080F42B4: .4byte gWindowTemplate_81E70F0\n\
_080F42B8: .4byte 0x81000030\n\
_080F42BC: .4byte 0x0fffffff\n\
_080F42C0: .4byte 0x80000040\n\
    .syntax divided\n");
}
#endif // NONMATCHING

static void sub_80F42C4(u8 *arg0)
{
    u16 i, tileOffset;
    u8 spriteId;
    struct SpriteSheet spriteSheet = {
        .data = gUnknown_083DFEC4->unkD1E4[0],
        .size = 0x500,
        .tag = 0x1A,
    };

    sub_80F4194(gUnknown_083DFEC4->unkD1E4[0], arg0);
    LoadSpriteSheet(&spriteSheet);
    LoadSpritePalette(&gUnknown_083E4868);

    tileOffset = 0;
    for (i = 0; i < 5; i++)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83E4878, i * 32 + 113, 16, 0);
        if (spriteId != MAX_SPRITES)
        {
            gSprites[spriteId].oam.tileNum += tileOffset;
            gUnknown_083DFEC4->unkCED4[i] = &gSprites[spriteId];
        }
        else
        {
            gUnknown_083DFEC4->unkCED4[i] = NULL;
        }

        tileOffset += 8;
    }
}

static void sub_80F4394(void)
{
    u16 i;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_083DFEC4->unkCED4[i])
            DestroySprite(gUnknown_083DFEC4->unkCED4[i]);
    }

    FreeSpriteTilesByTag(0x1A);
    FreeSpritePaletteByTag(0x12);
}

void sub_80F43D4(u8 *arg0)
{
    u16 tile;

    sub_80F4194(gUnknown_083DFEC4->unkD1E4[0], arg0);
    tile = GetSpriteTileStartByTag(0x1A);
    if (tile != 0xFFFF)
        DmaCopy32Defvars(3, gUnknown_083DFEC4->unkD1E4[0], (void *)(VRAM + 0x10000 + (tile * 32)), 0x500);
}

static u8 *sub_80F4428(u8 *arg0, u16 arg1, u8 arg2)
{
    return sub_80F6514(arg0, arg1, arg2);
}

static u8 *sub_80F443C(u8 *arg0, u16 arg1)
{
    return AlignInt1InMenuWindow(StringCopy(arg0, gOtherText_Number), arg1, 56, 1);
}

static u8 *sub_80F445C(u8 *arg0, u16 arg1)
{
    u8 *buffer = AlignInt1InMenuWindow(arg0, arg1, 23, 1);
    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x11;
    buffer[2] = 1;
    buffer += 3;
    buffer[0] = CHAR_SLASH;
    buffer += 1;
    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x11;
    buffer[2] = 1;
    buffer += 3;
    buffer = AlignInt1InMenuWindow(buffer, gUnknown_083DFEC4->unk8774 + 1, 50, 1);
    return buffer;
}

u32 sub_80F44B0(u16 box, u16 monIndex, int monDataField, int *text)
{
    if (box == 14)
    {
        if (monDataField == MON_DATA_NICKNAME || monDataField == MON_DATA_OT_NAME)
            return GetMonData(&gPlayerParty[monIndex], monDataField, text);
        else
            return GetMonData(&gPlayerParty[monIndex], monDataField);
    }
    else
    {
        if (monDataField == MON_DATA_NICKNAME || monDataField == MON_DATA_OT_NAME)
            return GetBoxMonData(&gPokemonStorage.boxes[box][monIndex], monDataField, text);
        else
            return GetBoxMonData(&gPokemonStorage.boxes[box][monIndex], monDataField);
    }
}

static void SetMonMarkings(u16 box, u16 monIndex, u8 markings)
{
    if (box == 14)
        SetMonData(&gPlayerParty[monIndex], MON_DATA_MARKINGS, &markings);
    else
        SetBoxMonData(&gPokemonStorage.boxes[box][monIndex], MON_DATA_MARKINGS, &markings);
}

static void sub_80F45A0(s16 arg0, u8 arg1)
{
    u8 box;
    u8 var0 = gUnknown_083DFEC4->unk893c[arg0].unk4;
    if (var0)
    {
        sub_80F4428(gUnknown_083DFEC4->unk8829[arg1], arg0, 0);
        box = gUnknown_083DFEC4->unk893c[arg0].unk1;
        if (box == 14)
            AlignStringInMenuWindow(gUnknown_083DFEC4->unk88E9[arg1], gOtherText_InParty, 64, 0);
        else
            AlignStringInMenuWindow(gUnknown_083DFEC4->unk88E9[arg1], gPokemonStorage.boxNames[box], 64, 0);

        gUnknown_083DFEC4->unk8937[arg1] = 1;
    }
    else
    {
        AlignStringInMenuWindow(gUnknown_083DFEC4->unk8829[arg1], gEmptyString_81E72B0, 104, 0);
        AlignStringInMenuWindow(gUnknown_083DFEC4->unk88E9[arg1], gEmptyString_81E72B0, 64, 0);
        gUnknown_083DFEC4->unk8937[arg1] = var0;
    }
}

static void sub_80F468C(s16 arg0, u8 arg1)
{
    u16 i;
    u16 box;
    u16 monIndex;

    if (gUnknown_083DFEC4->unk893c[arg0].unk4)
    {
        box = gUnknown_083DFEC4->unk893c[arg0].unk1;
        monIndex = gUnknown_083DFEC4->unk893c[arg0].partyIdx;
        gUnknown_083DFEC4->unk8ff0[arg1][0] = sub_80F44B0(box, monIndex, MON_DATA_COOL, NULL);
        gUnknown_083DFEC4->unk8ff0[arg1][1] = sub_80F44B0(box, monIndex, MON_DATA_TOUGH, NULL);
        gUnknown_083DFEC4->unk8ff0[arg1][2] = sub_80F44B0(box, monIndex, MON_DATA_SMART, NULL);
        gUnknown_083DFEC4->unk8ff0[arg1][3] = sub_80F44B0(box, monIndex, MON_DATA_CUTE, NULL);
        gUnknown_083DFEC4->unk8ff0[arg1][4] = sub_80F44B0(box, monIndex, MON_DATA_BEAUTY, NULL);

        gUnknown_083DFEC4->unk8931[arg1] = sub_80F44B0(box, monIndex, MON_DATA_SHEEN, NULL) != 255
            ? sub_80F44B0(box, monIndex, MON_DATA_SHEEN, NULL) / 29
            : 9;

        gUnknown_083DFEC4->unk8934[arg1] = sub_80F44B0(box, monIndex, MON_DATA_MARKINGS, NULL);
        sub_80F55AC(gUnknown_083DFEC4->unk8ff0[arg1], gUnknown_083DFEC4->unk9004[arg1]);
    }
    else
    {
        for (i = 0; i < 5; i++)
        {
            gUnknown_083DFEC4->unk8ff0[arg1][i] = 0;
            gUnknown_083DFEC4->unk9004[arg1][i].unk0 = 0x9B;
            gUnknown_083DFEC4->unk9004[arg1][i].unk2 = 0x5B;
        }
    }
}

static void sub_80F4824(s16 arg0, u8 arg1)
{
    u16 species;
    u32 otId;
    u32 personality;
    u16 box;
    u16 monIndex;

    if (gUnknown_083DFEC4->unk893c[arg0].unk4)
    {
        box = gUnknown_083DFEC4->unk893c[arg0].unk1;
        monIndex = gUnknown_083DFEC4->unk893c[arg0].partyIdx;
        species = sub_80F44B0(box, monIndex, MON_DATA_SPECIES2, NULL);
        otId = sub_80F44B0(box, monIndex, MON_DATA_OT_ID, NULL);
        personality = sub_80F44B0(box, monIndex, MON_DATA_PERSONALITY, NULL);

        HandleLoadSpecialPokePic(
            &gMonFrontPicTable[species],
            gMonFrontPicCoords[species].coords,
            1,
            (intptr_t)gUnknown_083DFEC4->unk131E4,
            gUnknown_083DFEC4->unkD1E4[arg1],
            species,
            personality);

        LZ77UnCompWram(GetMonSpritePalFromOtIdPersonality(species, otId, personality), gUnknown_083DFEC4->unk0[arg1]);
        gUnknown_083DFEC4->unkD1D6[arg1] = species;
    }
}

void sub_80F4900(s16 arg0, u8 arg1)
{
    sub_80F45A0(arg0, arg1);
    sub_80F468C(arg0, arg1);
    sub_80F4824(arg0, arg1);
}

void sub_80F492C(void)
{
    gUnknown_083DFEC4->unk8FE4 = 0;
}

#ifdef NONMATCHING
// registers r3/r4 are swapped
void sub_80F4944(struct UnkUsePokeblockSub *arg0)
{
    u16 i;
    u16 r3;
    u16 r4;

    i = 0;
    r4 = gUnknown_083DFEC4->unk8FE4;
    r3 = r4 / 2;
    while (r3 != r4)
    {
        if (arg0->unk0 > gUnknown_083DFEC4->unk893c[r3].unk0)
            r4 = r3;
        else
            i = r3 + 1;

        r3 = ((r4 - i) / 2) + i;
    }

    r4 = gUnknown_083DFEC4->unk8FE4;
    while (r4 > r3)
    {
        gUnknown_083DFEC4->unk893c[r4] = gUnknown_083DFEC4->unk893c[r4 - 1];
        r4--;
    }

    gUnknown_083DFEC4->unk893c[r3] = *arg0;
    gUnknown_083DFEC4->unk8FE4++;
}
#else
NAKED
void sub_80F4944(struct UnkUsePokeblockSub *arg0)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    mov r12, r0\n\
    movs r2, 0\n\
    ldr r1, _080F4978 @ =gUnknown_083DFEC4\n\
    ldr r5, [r1]\n\
    ldr r3, _080F497C @ =0x00008fe4\n\
    adds r0, r5, r3\n\
    ldrh r4, [r0]\n\
    lsrs r3, r4, 1\n\
    mov r8, r1\n\
    cmp r4, r3\n\
    beq _080F499C\n\
    adds r6, r5, 0\n\
    mov r0, r12\n\
    ldrb r5, [r0]\n\
    ldr r7, _080F4980 @ =0x0000893c\n\
_080F4968:\n\
    lsls r0, r3, 2\n\
    adds r0, r6, r0\n\
    adds r0, r7\n\
    ldrb r0, [r0]\n\
    cmp r5, r0\n\
    bls _080F4984\n\
    adds r4, r3, 0\n\
    b _080F498A\n\
    .align 2, 0\n\
_080F4978: .4byte gUnknown_083DFEC4\n\
_080F497C: .4byte 0x00008fe4\n\
_080F4980: .4byte 0x0000893c\n\
_080F4984:\n\
    adds r0, r3, 0x1\n\
    lsls r0, 16\n\
    lsrs r2, r0, 16\n\
_080F498A:\n\
    subs r0, r4, r2\n\
    lsrs r1, r0, 31\n\
    adds r0, r1\n\
    asrs r0, 1\n\
    adds r0, r2, r0\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r4, r3\n\
    bne _080F4968\n\
_080F499C:\n\
    mov r1, r8\n\
    ldr r2, [r1]\n\
    ldr r1, _080F49EC @ =0x00008fe4\n\
    adds r0, r2, r1\n\
    ldrh r4, [r0]\n\
    lsls r6, r3, 2\n\
    cmp r4, r3\n\
    bls _080F49C6\n\
    ldr r0, _080F49F0 @ =0x0000893c\n\
    adds r5, r2, r0\n\
_080F49B0:\n\
    lsls r2, r4, 2\n\
    adds r2, r5, r2\n\
    subs r1, r4, 0x1\n\
    lsls r0, r1, 2\n\
    adds r0, r5, r0\n\
    ldr r0, [r0]\n\
    str r0, [r2]\n\
    lsls r1, 16\n\
    lsrs r4, r1, 16\n\
    cmp r4, r3\n\
    bhi _080F49B0\n\
_080F49C6:\n\
    mov r1, r8\n\
    ldr r2, [r1]\n\
    ldr r3, _080F49F0 @ =0x0000893c\n\
    adds r0, r2, r3\n\
    adds r0, r6\n\
    mov r3, r12\n\
    ldr r1, [r3]\n\
    str r1, [r0]\n\
    ldr r0, _080F49EC @ =0x00008fe4\n\
    adds r2, r0\n\
    ldrh r0, [r2]\n\
    adds r0, 0x1\n\
    strh r0, [r2]\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080F49EC: .4byte 0x00008fe4\n\
_080F49F0: .4byte 0x0000893c\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_80F49F4(void)
{
    u16 i;

    gUnknown_083DFEC4->unk893c[0].unk2 = 1;
    for (i = 1; i < gUnknown_083DFEC4->unk8FE4; i++)
    {
        if (gUnknown_083DFEC4->unk893c[i].unk0 == gUnknown_083DFEC4->unk893c[i - 1].unk0)
            gUnknown_083DFEC4->unk893c[i].unk2 = gUnknown_083DFEC4->unk893c[i - 1].unk2;
        else
            gUnknown_083DFEC4->unk893c[i].unk2 = i + 1;
    }

    gUnknown_083DFEC4->unk876C = 0;
    gUnknown_083DFEC4->unk8770 = 0;
    gUnknown_083DFEC4->unk876E = 0;
    gUnknown_083DFEC4->unk8772 = gUnknown_083DFEC4->unk8FE4 < 9 ? (gUnknown_083DFEC4->unk8FE4 - 1) : 7;
    gUnknown_083DFEC4->unk8774 = gUnknown_083DFEC4->unk8FE4 - 1;
    gUnknown_083DFEC4->unk87C9 = gUnknown_083DFEC4->unk8774 > 7;
}

void sub_80F4B20(void)
{
    s16 var0;
    s16 var1;

    sub_80F4900(gUnknown_083DFEC4->unk87DC, 0);
    sub_80F2E18(0);
    if (gUnknown_083DFEC4->unk87DA == 1)
    {
        gUnknown_083DFEC4->unk8fe9 = 0;
        gUnknown_083DFEC4->unk8FEA = 0;
        gUnknown_083DFEC4->unk8FEB = 0;
    }
    else
    {
        gUnknown_083DFEC4->unk8fe9 = 0;
        gUnknown_083DFEC4->unk8FEA = 1;
        gUnknown_083DFEC4->unk8FEB = 2;

        var0 = gUnknown_083DFEC4->unk87DC + 1;
        if (var0 >= gUnknown_083DFEC4->unk87DA)
            var0 = 0;

        var1 = gUnknown_083DFEC4->unk87DC - 1;
        if (var1 < 0)
            var1 = gUnknown_083DFEC4->unk87DA - 1;

        sub_80F4900(var0, 1);
        sub_80F4900(var1, 2);
    }
}

void sub_80F4BD0(void)
{
    u16 i, j;

    for (i = 0, j = 0; i < gUnknown_083DFEC4->unk8828; i++)
    {
        if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
        {
            gUnknown_083DFEC4->unk893c[j].unk1 = 14;
            gUnknown_083DFEC4->unk893c[j].partyIdx = i;
            gUnknown_083DFEC4->unk893c[j].unk2 = j + 1;
            gUnknown_083DFEC4->unk893c[j].unk4 = 1;
            j++;
        }
    }

    gUnknown_083DFEC4->unk893c[j].unk1 = 0;
    gUnknown_083DFEC4->unk893c[j].partyIdx = 0;
    gUnknown_083DFEC4->unk893c[j].unk2 = 0;
    gUnknown_083DFEC4->unk893c[j].unk4 = 0;
    gUnknown_083DFEC4->unk87DC = 0;
    gUnknown_083DFEC4->unk87DA = j + 1;
    sub_80F4B20();
    gUnknown_083DFEC4->unk87CB = 1;
}

static void sub_80F4CF0(void)
{
    gUnknown_083DFEC4->unk87DC = gUnknown_083DFEC4->unk876E;
    sub_80F4B20();

    if (gUnknown_083DFEC4->unk8774 == 0)
        gUnknown_083DFEC4->unk87CB = 0;
    else
        gUnknown_083DFEC4->unk87CB = 1;
}

static void sub_80F4D44(void)
{
    gUnknown_083DFEC4->unk8FE6 = 0;
    gUnknown_083DFEC4->unk8FE7 = 0;
    sub_80F492C();

    if (!gUnknown_083DFEC4->unk6DAC)
        while (sub_80F4D88());
}

static bool8 sub_80F4D88(void)
{
    u16 i;
    register int mask asm("r3"); // FIXME
    int nextValue;
    struct UnkUsePokeblockSub var0;

    switch (gUnknown_083DFEC4->unk8FE6)
    {
    default:
        var0.unk4 = 1;
        for (i = 0; i < 15; i++)
        {

            if (GetBoxMonData(&gPokemonStorage.boxes[gUnknown_083DFEC4->unk8FE6][gUnknown_083DFEC4->unk8FE7], MON_DATA_SPECIES)
             && !GetBoxMonData(&gPokemonStorage.boxes[gUnknown_083DFEC4->unk8FE6][gUnknown_083DFEC4->unk8FE7], MON_DATA_IS_EGG))
            {
                var0.unk1 = gUnknown_083DFEC4->unk8FE6;
                var0.partyIdx = gUnknown_083DFEC4->unk8FE7;
                var0.unk0 = GetBoxMonData(
                    &gPokemonStorage.boxes[gUnknown_083DFEC4->unk8FE6][gUnknown_083DFEC4->unk8FE7],
                    gUnknown_083DFEC4->unk87D8);
                sub_80F4944(&var0);
            }

            gUnknown_083DFEC4->unk8FE7++;
            mask = 0xFF;
            if (gUnknown_083DFEC4->unk8FE7 == 30)
            {
                gUnknown_083DFEC4->unk8FE7 = 0;
                nextValue = gUnknown_083DFEC4->unk8FE6 + 1;
                gUnknown_083DFEC4->unk8FE6 = nextValue;
                if ((nextValue & mask) == 14)
                    break;
            }
        }
        break;
    case 14:
        var0.unk4 = 1;
        var0.unk1 = 14;
        for (i = 0; i < gUnknown_083DFEC4->unk8828; i++)
        {
            if (!GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
            {
                var0.partyIdx = i;
                var0.unk0 = GetMonData(&gPlayerParty[i], gUnknown_083DFEC4->unk87D8);
                sub_80F4944(&var0);
            }
        }

        sub_80F49F4();
        gUnknown_083DFEC4->unk87DA = gUnknown_083DFEC4->unk8FE4;
        gUnknown_083DFEC4->unk8FE6++;
        break;
    case 15:
        return FALSE;
    }

    return TRUE;
}

void sub_80F4F78(void)
{
    sub_80F53EC(gUnknown_083DFEC4->unk9040, gUnknown_083DFEC4->unk9004[gUnknown_083DFEC4->unk8fe9]);
    sub_80F5504();
}

bool8 sub_80F4FB4(void)
{
    bool8 var0 = sub_80F5504();
    bool8 var1 = sub_80F170C();
    return var0 || var1;
}

void sub_80F4FDC(void)
{
    if (gUnknown_083DFEC4->unk76AA || gUnknown_083DFEC4->unk87DC != gUnknown_083DFEC4->unk8828)
        sub_80F53EC(gUnknown_083DFEC4->unk9004[gUnknown_083DFEC4->unk8fe9], gUnknown_083DFEC4->unk9040);
}

bool8 sub_80F5038(void)
{
    bool8 var0 = sub_80F5504();
    bool8 var1 = sub_80F173C();
    return var0 || var1;
}

void sub_80F5060(u8 arg0)
{
    u16 var0;
    u8 var1;
    u8 var2;

    if (arg0)
        var0 = gUnknown_083DFEC4->unk8FEB;
    else
        var0 = gUnknown_083DFEC4->unk8FEA;

    sub_80F53EC(gUnknown_083DFEC4->unk9004[gUnknown_083DFEC4->unk8fe9], gUnknown_083DFEC4->unk9004[var0]);
    var1 = gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].unk4;
    if (arg0)
    {
        gUnknown_083DFEC4->unk8FEB = gUnknown_083DFEC4->unk8FEA;
        gUnknown_083DFEC4->unk8FEA = gUnknown_083DFEC4->unk8fe9;
        gUnknown_083DFEC4->unk8fe9 = var0;
        gUnknown_083DFEC4->unk8FEC = gUnknown_083DFEC4->unk8FEB;

        gUnknown_083DFEC4->unk87DC = gUnknown_083DFEC4->unk87DC
            ? gUnknown_083DFEC4->unk87DC - 1
            : gUnknown_083DFEC4->unk87DA - 1;
        gUnknown_083DFEC4->unk8FEE = gUnknown_083DFEC4->unk87DC
            ? gUnknown_083DFEC4->unk87DC - 1
            : gUnknown_083DFEC4->unk87DA - 1;
    }
    else
    {
        gUnknown_083DFEC4->unk8FEA = gUnknown_083DFEC4->unk8FEB;
        gUnknown_083DFEC4->unk8FEB = gUnknown_083DFEC4->unk8fe9;
        gUnknown_083DFEC4->unk8fe9 = var0;
        gUnknown_083DFEC4->unk8FEC = gUnknown_083DFEC4->unk8FEA;

        gUnknown_083DFEC4->unk87DC = (gUnknown_083DFEC4->unk87DC < gUnknown_083DFEC4->unk87DA - 1)
            ? gUnknown_083DFEC4->unk87DC + 1
            : 0;
        gUnknown_083DFEC4->unk8FEE = (gUnknown_083DFEC4->unk87DC < gUnknown_083DFEC4->unk87DA - 1)
            ? gUnknown_083DFEC4->unk87DC + 1
            : 0;
    }

    var2 = gUnknown_083DFEC4->unk893c[gUnknown_083DFEC4->unk87DC].unk4;
    if (!var1)
        gUnknown_083DFEC4->unk87E0 = sub_80F5264;
    else if (!var2)
        gUnknown_083DFEC4->unk87E0 = sub_80F52F8;
    else
        gUnknown_083DFEC4->unk87E0 = sub_80F5364;

    gUnknown_083DFEC4->unk87DE = 0;
}

bool8 gpu_sync_bg_show(void)
{
    return gUnknown_083DFEC4->unk87E0();
}

static bool8 sub_80F5264(void)
{
    switch (gUnknown_083DFEC4->unk87DE)
    {
    case 0:
        sub_80F2E18(gUnknown_083DFEC4->unk8fe9);
        sub_80F01E0(gUnknown_083DFEC4->unk8fe9);
        gUnknown_083DFEC4->unk87DE++;
        // fall through
    case 1:
        if (!sub_80F4FB4())
        {
            sub_80F4900(gUnknown_083DFEC4->unk8FEE, gUnknown_083DFEC4->unk8FEC);
            gUnknown_083DFEC4->unk87DE++;
        }
        break;
    case 2:
        return FALSE;
    }

    return TRUE;
}

static bool8 sub_80F52F8(void)
{
    switch (gUnknown_083DFEC4->unk87DE)
    {
    case 0:
        if (!sub_80F5038())
        {
            sub_80F01E0(gUnknown_083DFEC4->unk8fe9);
            sub_80F4900(gUnknown_083DFEC4->unk8FEE, gUnknown_083DFEC4->unk8FEC);
            gUnknown_083DFEC4->unk87DE++;
        }
        break;
    case 1:
        return FALSE;
    }

    return TRUE;
}

static bool8 sub_80F5364(void)
{
    switch (gUnknown_083DFEC4->unk87DE)
    {
    case 0:
        sub_80F5504();
        if (!sub_80F173C())
        {
            sub_80F2E18(gUnknown_083DFEC4->unk8fe9);
            sub_80F01E0(gUnknown_083DFEC4->unk8fe9);
            gUnknown_083DFEC4->unk87DE++;
        }
        break;
    case 1:
        if (!sub_80F4FB4())
            gUnknown_083DFEC4->unk87DE++;
        break;
    case 2:
        sub_80F4900(gUnknown_083DFEC4->unk8FEE, gUnknown_083DFEC4->unk8FEC);
        return FALSE;
    }

    return TRUE;
}

static void sub_80F53EC(struct UnkPokenav11 *arg0, struct UnkPokenav11 *arg1)
{
    u16 i, j;
    int r5;
    int r6;

    for (i = 0; i < 5; i++)
    {
        r5 = arg0[i].unk0 << 8;
        r6 = ((arg1[i].unk0 - arg0[i].unk0) << 8) / 10;
        for (j = 0; j < 9; j++)
        {
            gUnknown_083DFEC4->unk9054[j][i].unk0 = (r5 >> 8) + ((r5 >> 7) & 1);
            r5 += r6;
        }

        gUnknown_083DFEC4->unk9054[j][i].unk0 = arg1[i].unk0;
        r5 = arg0[i].unk2 << 8;
        r6 = ((arg1[i].unk2 - arg0[i].unk2) << 8) / 10;
        for (j = 0; j < 9; j++)
        {
            gUnknown_083DFEC4->unk9054[j][i].unk2 = (r5 >> 8) + ((r5 >> 7) & 1);
            r5 += r6;
        }

        gUnknown_083DFEC4->unk9054[j][i].unk2 = arg1[i].unk2;
    }

    gUnknown_083DFEC4->unk9342 = 0;
}

static bool8 sub_80F5504(void)
{
    if (gUnknown_083DFEC4->unk9342 < 10)
    {
        sub_80F556C(gUnknown_083DFEC4->unk9054[gUnknown_083DFEC4->unk9342++]);
        return gUnknown_083DFEC4->unk9342 != 10;
    }
    else
    {
        return FALSE;
    }
}

void sub_80F5550(struct UnkPokenav11 *arg0, struct UnkPokenav11 *arg1)
{
    sub_80F53EC(arg0, arg1);
}

bool8 sub_80F555C(void)
{
    return sub_80F5504();
}

void sub_80F556C(struct UnkPokenav11 *arg0)
{
    u16 i;

    for (i = 0; i < 5; i++)
        gUnknown_083DFEC4->unk911C[i] = arg0[i];

    gUnknown_083DFEC4->unk9344 = 1;
}
