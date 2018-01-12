#include "global.h"
#include "main.h"
#include "pokenav.h"
#include "ewram.h"
#include "battle.h"
#include "data2.h"
#include "de_rom_8040FE0.h"
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
#include "sound.h"
#include "task.h"
#include "text.h"
#include "scanline_effect.h"

extern u8 ewram[];

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

extern bool8 sub_80F0944(void);
extern void sub_80F081C();
extern void sub_80F0900(void);
extern void sub_80F443C(u8 *, u16);
extern bool8 sub_80F162C(u8);
extern void sub_80F01E0(u16);
extern void sub_80F01A4(void);
extern void sub_80F1614(void);
extern void sub_80EFD3C(void);
extern void sub_8095C8C();
extern void sub_80EFDA0(void);
extern void sub_80EFD74(void);
extern void sub_80F1A80(void);
extern bool8 sub_80EFC64(void);
extern void sub_80EFC3C(void);
extern void sub_80EF624(const u16 *, const u16 *, u8, u8, u16 *);
extern void sub_80EF7D4(void);
extern void sub_80EF54C(u8);
extern void sub_809D104(u16 *, u16, u16, const u8 *, u16, u16, u16, u16);
extern void sub_80EF58C(u8);
extern void sub_80F6FFC();
extern void sub_80F3294();
extern void sub_80F0B24();
extern bool8 sub_80F0B44();
extern void sub_80F0F64();
extern bool8 sub_80F0FEC();
extern void sub_80F6FB8();
extern void sub_80F6DB8();
extern void sub_80F0CD8();
extern bool8 sub_80F6E9C();
extern bool8 sub_80F0D5C();
extern bool8 sub_80F6ED4();
extern bool8 sub_80F0EF4();
extern void sub_80F2FB0();
extern void sub_80F0FA0();
extern void sub_80F0C28();
extern bool8 sub_80F0C48();
extern bool8 sub_80F70FC();
extern void sub_80F708C(u32);
extern void sub_80F4394();
extern void sub_80F0EC0();
extern void sub_80F700C();
extern void sub_80F42C4();
extern void sub_80F0FFC();
extern void sub_80F6F10();
extern void sub_80F3C2C();
extern void sub_80F15A8();
extern void sub_80F6A4C();
extern bool8 sub_80F6AF0();
extern void sub_80F3B00();
extern bool8 sub_80F3B58();
extern void sub_80F1494();
extern u8 sub_80F68E8();
extern void sub_80F3B94();
extern bool8 sub_80F3BD4();
extern void sub_80F66E0();
extern bool8 sub_80F1080();
extern void sub_80F38B8();
extern bool8 sub_80F38EC();
extern void sub_80F638C();
extern bool8 sub_80F63D0();
extern void sub_80F4CF0();
extern void sub_80EFF34();
extern bool8 sub_80EFF68();
extern void sub_80F35B4();
extern void sub_80F6134();
extern u8 sub_80F5DD4();
extern void ShowMapNamePopUpWindow();
extern bool8 sub_80F0718();
extern bool8 sub_80F3264();
extern void sub_80F4D44();
extern bool8 sub_80F4D88();
extern void sub_80F0264(u8);
extern bool8 sub_80F02A0();
extern void sub_80F3008();
extern void sub_80F3130();
extern void sub_80F2D6C(u32);
extern bool8 sub_80F1E6C();
extern void sub_80EF9F8(void);
extern bool8 sub_80EFBDC(bool8);
extern void sub_80EFBB0(void);
extern void sub_80F2DF4();
extern void sub_80F1E84();
extern bool8 sub_80F1F10();
extern void sub_80EEFBC(u8);
extern void sub_80F2620();
extern void sub_80EF814(void);
extern void sub_80EF840(void);
extern bool8 sub_80EF874(void);
extern void sub_80F2DD8();
extern bool8 sub_80F6250();
extern void sub_80F6208();
extern void sub_80F208C();
extern void sub_80F6C20();
extern void sub_80F3FF0();
extern bool8 sub_80F4024();
extern void sub_80F2598();
extern void sub_80EF248(u8);
extern bool8 sub_80EF284(u8);
extern void sub_80F1B8C();
extern bool8 sub_80F1BC8(u32 unk);
extern void sub_80F1DF0();
extern bool8 sub_80F1E50();
extern void sub_80EF428(u8, u8);
extern bool8 sub_80EEF78();
extern void sub_80F1A90();
extern void sub_80F2D04(u32);
extern bool8 sub_80F1AC4();
extern void sub_80F36F0();
extern bool8 sub_80F3724();
extern void sub_80EBC10();
extern void sub_80EBDBC(void (*func)(void));
extern void sub_80EBBE8();
extern bool8 sub_80F26BC(void);
extern void sub_80EBDD8();
extern void sub_80EBD90();
extern void sub_80EBD18();
extern void sub_80F1A74();
extern void sub_80F1FF0();
extern void sub_80FB260();
extern void sub_80EFE7C(void);
extern void sub_80F5BF0();
extern void sub_80F6F64();
extern void sub_80F19FC();

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
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
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
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0x0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
        ewram0_10.var304++;
        break;
    case 0xD:
        sub_80EED2C(0x1);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 0x10, 0);
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
			ewram0_10.var6dae = 0x3;
			sub_80EEE08();
			ewram0_10.var304++;
		}
        break;
    case 1:
        sub_80EF248(0x1);
        ewram0_10.var304++;
    case 2:
        if (!sub_80EF284(0x1))
			ewram0_10.var304++;
        break;
    case 3:
        sub_80F1B8C(0x1);
        ewram0_10.var304++;
    case 4:
        if (!sub_80F1BC8(0x1))
			ewram0_10.var304++;
        break;
    case 5:
        if (sub_8055870()) return;
        ewram0_10.var304++;
        break;
    case 6:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
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
    case 0xA:
        sub_80F2C80(0x1);
        ewram0_10.var304++;
		// fall through
    case 0xB:
        if (!sub_80F2CBC(0x1))
			ewram0_10.var304++;
        break;
    case 0xC:
        sub_80F1DF0();
        ewram0_10.var304++;
        break;
    case 0xD:
        if (!sub_80F1E50())
        {
			sub_80EF428(1, ewram0_10.var6dad);
			sub_80EBDBC(&sub_80EC86C);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 0x10, 0);
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
        sub_80F1B8C(0x2);
        ewram0_10.var304++;
        // fall through
    case 10:
        if (!sub_80F1BC8(0x2))
			ewram0_10.var304++;
        break;
    case 11:
        if (!sub_8055870())
			ewram0_10.var304++;
        break;
    case 12:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
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
			BeginNormalPaletteFade(ewram0_10.var308, -1, 0x0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
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
			sub_80EBDBC(&sub_80ED31C);
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
            break;
        case 2:
            PlaySE(SE_SELECT);
            ewram0_10.var304++;
            break;
        default:
            if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80ED4D8);
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80ECD80);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EED2C(0x4);
        ewram0_10.var304++;
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
        SetVBlankCallback(sub_80EBD4C);
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EED2C(0x2);
        ewram0_10.var304++;
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
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0x0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
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
			sub_80EBDBC(&sub_80ED858);
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
__attribute__((naked))
void sub_80ED858() {
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
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0x0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 16:
        sub_80EED2C(0x4);
        ewram0_10.var304++;
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
            break;
        case 2:
            PlaySE(SE_SELECT);
            ewram0_10.var304++;
            break;
        default:
            if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80EDEE4);
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80EDE70);
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
}

void sub_80EDE70()
{
    switch (ewram0_10.var304)
    {
    case 0:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
        SetVBlankCallback(&sub_80EBD18);
        ewram0_10.var304++;
        break;
    case 8:
        sub_80EED2C(0x3);
        ewram0_10.var304++;
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
            break;
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
}

void sub_80EE294()
{
    switch (ewram0_10.var304)
    {
    case 0:
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
        ewram0_10.var304++;
        break;
    case 7:
        sub_80EED2C(0x4);
        ewram0_10.var304++;
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
            BeginNormalPaletteFade(ewram0_10.var308, -1, 0x0, 0x10, 0);
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0x10, 0, 0);
        SetVBlankCallback(&sub_80EBD68);
        ewram0_10.var304++;
        break;
    case 12:
        sub_80EED2C(0x5);
        ewram0_10.var304++;
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
            break;
        case 2:
            PlaySE(SE_SELECT);
            ewram0_10.var304++;
            break;
        default:
            if (gMain.newKeys & A_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80EE658);
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                PlaySE(SE_SELECT);
                sub_80EBDBC(&sub_80EE8F4);
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
        sub_80F0CD8();
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
        BeginNormalPaletteFade(ewram0_10.var308, -1, 0, 0x10, 0);
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
        BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        ewram0_10.var304++;
    }
    else
    {
        if (!gPaletteFade.active)
        {
			sub_80F5BDC();
			sub_805469C();
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
__attribute__((naked))
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
        gUnknown_083DFEC4->unk030C.unk030C.unk0 = 0;
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

    if (gUnknown_083DFEC4->unk030C.unk030C.unk0 == 32)
        return FALSE;

    gUnknown_083DFEC4->unk030C.unk030C.unk0 += 2;
    if (gUnknown_083DFEC4->unk030C.unk030C.unk0 > 31)
    {
        gUnknown_083DFEC4->unk030C.unk030C.unk0 = 32;
        retVal = FALSE;
    }

    REG_BG1VOFS = gUnknown_083DFEC4->unk030C.unk030C.unk0;
    return retVal;
}

bool8 sub_80EEF78(void)
{
    bool8 retVal = TRUE;

    if (gUnknown_083DFEC4->unk030C.unk030C.unk0 == 0)
        return FALSE;

    gUnknown_083DFEC4->unk030C.unk030C.unk0 -= 2;
    if (gUnknown_083DFEC4->unk030C.unk030C.unk0 <= 0)
    {
        gUnknown_083DFEC4->unk030C.unk030C.unk0 = 0;
        retVal = FALSE;
    }

    REG_BG1VOFS = gUnknown_083DFEC4->unk030C.unk030C.unk0;
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
    sub_8072C74(&tileBuffer[0x800], pcText, 0xC0, 2);
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
__attribute__((naked))
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
        gUnknown_083DFEC4->unkD162[0] = 11;
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
        sub_80F01E0((u16)gUnknown_083DFEC4->unk8fe9);
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

void sub_80F01E0(u16 a)
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

#ifdef NONMATCHING // small nonmatching part is in the third else clause in case 7.
bool8 sub_80F02A0(void)
{
    const u16 *pointer;

    switch (gUnknown_083DFEC4->unk306)
    {
    case 0:
        sub_80EEDE8();

        gUnknown_083DFEC4->unk87C8 = gUnknown_083DFEC4->unk87CA == 1;
        gUnknown_083DFEC4->unkD162[0] = 11;
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
            pointer = &gUnknown_08E9F9E8[5];
            gPlttBufferUnfaded[0] = gUnknown_08E9F9E8[5];
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
            sub_80F0FFC(gUnknown_083DFEC4->unk876E);
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
#else
__attribute__((naked))
bool8 sub_80F02A0(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    mov r6, r8\n\
    push {r6}\n\
    sub sp, 0x18\n\
    ldr r1, _080F02C4 @ =gUnknown_083DFEC4\n\
    ldr r0, [r1]\n\
    ldr r2, _080F02C8 @ =0x00000306\n\
    adds r0, r2\n\
    ldrh r0, [r0]\n\
    adds r2, r1, 0\n\
    cmp r0, 0xE\n\
    bls _080F02BA\n\
    b _080F05FA\n\
_080F02BA:\n\
    lsls r0, 2\n\
    ldr r1, _080F02CC @ =_080F02D0\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080F02C4: .4byte gUnknown_083DFEC4\n\
_080F02C8: .4byte 0x00000306\n\
_080F02CC: .4byte _080F02D0\n\
    .align 2, 0\n\
_080F02D0:\n\
    .4byte _080F030C\n\
    .4byte _080F0344\n\
    .4byte _080F0350\n\
    .4byte _080F035C\n\
    .4byte _080F0368\n\
    .4byte _080F036E\n\
    .4byte _080F0380\n\
    .4byte _080F0394\n\
    .4byte _080F04BC\n\
    .4byte _080F053C\n\
    .4byte _080F0550\n\
    .4byte _080F0574\n\
    .4byte _080F057A\n\
    .4byte _080F0586\n\
    .4byte _080F05BC\n\
_080F030C:\n\
    bl sub_80EEDE8\n\
    ldr r0, _080F0334 @ =gUnknown_083DFEC4\n\
    ldr r1, [r0]\n\
    movs r2, 0\n\
    ldr r3, _080F0338 @ =0x000087ca\n\
    adds r0, r1, r3\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1\n\
    bne _080F0322\n\
    movs r2, 0x1\n\
_080F0322:\n\
    ldr r3, _080F033C @ =0x000087c8\n\
    adds r0, r1, r3\n\
    strb r2, [r0]\n\
    ldr r0, _080F0340 @ =0x0000d162\n\
    adds r1, r0\n\
    movs r0, 0xB\n\
    strb r0, [r1]\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F0334: .4byte gUnknown_083DFEC4\n\
_080F0338: .4byte 0x000087ca\n\
_080F033C: .4byte 0x000087c8\n\
_080F0340: .4byte 0x0000d162\n\
_080F0344:\n\
    ldr r0, _080F034C @ =gWindowTemplate_81E70D4\n\
    bl Text_LoadWindowTemplate\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F034C: .4byte gWindowTemplate_81E70D4\n\
_080F0350:\n\
    ldr r0, _080F0358 @ =gWindowTemplate_81E70D4\n\
    bl MultistepInitMenuWindowBegin\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F0358: .4byte gWindowTemplate_81E70D4\n\
_080F035C:\n\
    bl MultistepInitMenuWindowContinue\n\
    cmp r0, 0\n\
    beq _080F0366\n\
    b _080F0618\n\
_080F0366:\n\
    b _080F0626\n\
_080F0368:\n\
    bl Menu_EraseScreen\n\
    b _080F0618\n\
_080F036E:\n\
    ldr r0, _080F0378 @ =gUnknown_08E9FC64\n\
    ldr r1, _080F037C @ =0x0600e800\n\
    bl LZ77UnCompVram\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F0378: .4byte gUnknown_08E9FC64\n\
_080F037C: .4byte 0x0600e800\n\
_080F0380:\n\
    ldr r0, _080F038C @ =gPokenavConditionSearch2_Gfx\n\
    ldr r1, _080F0390 @ =0x06008000\n\
    bl LZ77UnCompVram\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F038C: .4byte gPokenavConditionSearch2_Gfx\n\
_080F0390: .4byte 0x06008000\n\
_080F0394:\n\
    ldr r6, _080F03FC @ =gUnknown_083E02B4\n\
    adds r0, r6, 0\n\
    movs r1, 0xB0\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    adds r0, r6, 0\n\
    movs r1, 0xF0\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    ldr r0, _080F0400 @ =gUnknown_083E0334\n\
    movs r1, 0x40\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    ldr r0, _080F0404 @ =gUnknown_083DFEC4\n\
    ldr r0, [r0]\n\
    ldr r1, _080F0408 @ =0x000087ca\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _080F0418\n\
    ldr r4, _080F040C @ =gPokenavConditionSearch2_Pal\n\
    adds r0, r4, 0\n\
    movs r1, 0x30\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    ldr r1, _080F0410 @ =gPlttBufferUnfaded\n\
    ldrh r0, [r4, 0xA]\n\
    strh r0, [r1]\n\
    ldr r0, _080F0414 @ =gUnknownPalette_81E6692\n\
    movs r1, 0xB0\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    adds r0, r6, 0x2\n\
    movs r1, 0xB1\n\
    movs r2, 0x2\n\
    bl LoadPalette\n\
    adds r0, r6, 0\n\
    adds r0, 0x10\n\
    movs r1, 0xB5\n\
    movs r2, 0x2\n\
    bl LoadPalette\n\
    adds r4, 0xA\n\
    adds r0, r4, 0\n\
    movs r1, 0xBF\n\
    b _080F04A8\n\
    .align 2, 0\n\
_080F03FC: .4byte gUnknown_083E02B4\n\
_080F0400: .4byte gUnknown_083E0334\n\
_080F0404: .4byte gUnknown_083DFEC4\n\
_080F0408: .4byte 0x000087ca\n\
_080F040C: .4byte gPokenavConditionSearch2_Pal\n\
_080F0410: .4byte gPlttBufferUnfaded\n\
_080F0414: .4byte gUnknownPalette_81E6692\n\
_080F0418:\n\
    cmp r0, 0x1\n\
    bne _080F0464\n\
    ldr r4, _080F0458 @ =gUnknown_083E0274\n\
    adds r0, r4, 0\n\
    movs r1, 0x30\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    ldr r1, _080F045C @ =gPlttBufferUnfaded\n\
    ldrh r0, [r4, 0xA]\n\
    strh r0, [r1]\n\
    ldr r0, _080F0460 @ =gUnknownPalette_81E6692\n\
    movs r1, 0xB0\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    adds r0, r6, 0x2\n\
    movs r1, 0xB1\n\
    movs r2, 0x2\n\
    bl LoadPalette\n\
    adds r0, r6, 0\n\
    adds r0, 0x10\n\
    movs r1, 0xB5\n\
    movs r2, 0x2\n\
    bl LoadPalette\n\
    adds r4, 0xA\n\
    adds r0, r4, 0\n\
    movs r1, 0xBF\n\
    b _080F04A8\n\
    .align 2, 0\n\
_080F0458: .4byte gUnknown_083E0274\n\
_080F045C: .4byte gPlttBufferUnfaded\n\
_080F0460: .4byte gUnknownPalette_81E6692\n\
_080F0464:\n\
    ldr r4, _080F04B0 @ =gUnknown_08E9F9E8\n\
    adds r0, r4, 0\n\
    movs r1, 0x30\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    ldr r1, _080F04B4 @ =gPlttBufferUnfaded\n\
    adds r5, r4, 0\n\
    adds r5, 0xA\n\
    ldrh r0, [r4, 0xA]\n\
    strh r0, [r1]\n\
    ldr r0, _080F04B8 @ =gUnknown_083E0314\n\
    movs r1, 0x50\n\
    movs r2, 0x20\n\
    bl LoadPalette\n\
    adds r0, r6, 0x2\n\
    movs r1, 0xB1\n\
    movs r2, 0x2\n\
    bl LoadPalette\n\
    adds r0, r6, 0\n\
    adds r0, 0x10\n\
    movs r1, 0xB5\n\
    movs r2, 0x2\n\
    bl LoadPalette\n\
    adds r0, r5, 0\n\
    movs r1, 0xBF\n\
    movs r2, 0x2\n\
    bl LoadPalette\n\
    adds r0, r5, 0\n\
    movs r1, 0x5F\n\
_080F04A8:\n\
    movs r2, 0x2\n\
    bl LoadPalette\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F04B0: .4byte gUnknown_08E9F9E8\n\
_080F04B4: .4byte gPlttBufferUnfaded\n\
_080F04B8: .4byte gUnknown_083E0314\n\
_080F04BC:\n\
    ldr r0, _080F04E8 @ =gUnknown_083DFEC4\n\
    ldr r0, [r0]\n\
    ldr r2, _080F04EC @ =0x000087ca\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x2\n\
    beq _080F04F8\n\
    ldr r0, _080F04F0 @ =0x0600e800\n\
    ldr r3, _080F04F4 @ =gUnknown_08E9FD1C\n\
    movs r1, 0\n\
    str r1, [sp]\n\
    str r1, [sp, 0x4]\n\
    movs r2, 0x9\n\
    str r2, [sp, 0x8]\n\
    movs r1, 0x4\n\
    str r1, [sp, 0xC]\n\
    str r2, [sp, 0x10]\n\
    movs r1, 0\n\
    movs r2, 0x5\n\
    bl sub_8095C8C\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F04E8: .4byte gUnknown_083DFEC4\n\
_080F04EC: .4byte 0x000087ca\n\
_080F04F0: .4byte 0x0600e800\n\
_080F04F4: .4byte gUnknown_08E9FD1C\n\
_080F04F8:\n\
    ldr r3, _080F0530 @ =0x0600e800\n\
    mov r8, r3\n\
    ldr r3, _080F0534 @ =gUnknown_08E9FE54\n\
    movs r4, 0\n\
    str r4, [sp]\n\
    str r4, [sp, 0x4]\n\
    movs r5, 0xC\n\
    str r5, [sp, 0x8]\n\
    movs r6, 0xA\n\
    str r6, [sp, 0xC]\n\
    str r5, [sp, 0x10]\n\
    mov r0, r8\n\
    movs r1, 0\n\
    movs r2, 0x4\n\
    bl sub_8095C8C\n\
    ldr r3, _080F0538 @ =gUnknown_08E9FD64\n\
    str r4, [sp]\n\
    str r4, [sp, 0x4]\n\
    str r5, [sp, 0x8]\n\
    str r6, [sp, 0xC]\n\
    str r5, [sp, 0x10]\n\
    mov r0, r8\n\
    movs r1, 0\n\
    movs r2, 0x8\n\
    bl sub_8095C8C\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F0530: .4byte 0x0600e800\n\
_080F0534: .4byte gUnknown_08E9FE54\n\
_080F0538: .4byte gUnknown_08E9FD64\n\
_080F053C:\n\
    ldr r0, _080F0548 @ =gUnknown_083E0354\n\
    ldr r1, _080F054C @ =0x06005000\n\
    bl LZ77UnCompVram\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F0548: .4byte gUnknown_083E0354\n\
_080F054C: .4byte 0x06005000\n\
_080F0550:\n\
    ldr r2, _080F0568 @ =0x0600f800\n\
    add r1, sp, 0x14\n\
    movs r0, 0\n\
    strh r0, [r1]\n\
    ldr r0, _080F056C @ =0x040000d4\n\
    str r1, [r0]\n\
    str r2, [r0, 0x4]\n\
    ldr r1, _080F0570 @ =0x81000400\n\
    str r1, [r0, 0x8]\n\
    ldr r0, [r0, 0x8]\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F0568: .4byte 0x0600f800\n\
_080F056C: .4byte 0x040000d4\n\
_080F0570: .4byte 0x81000400\n\
_080F0574:\n\
    bl sub_80F0900\n\
    b _080F0618\n\
_080F057A:\n\
    bl sub_80F0944\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _080F0618\n\
    b _080F0626\n\
_080F0586:\n\
    ldr r0, _080F059C @ =gUnknown_083DFEC4\n\
    ldr r4, [r0]\n\
    ldr r1, _080F05A0 @ =0x000087ca\n\
    adds r0, r4, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x2\n\
    beq _080F05A4\n\
    bl ShowMapNamePopUpWindow\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F059C: .4byte gUnknown_083DFEC4\n\
_080F05A0: .4byte 0x000087ca\n\
_080F05A4:\n\
    movs r0, 0\n\
    bl sub_80F081C\n\
    ldr r2, _080F05B8 @ =0x0000876e\n\
    adds r0, r4, r2\n\
    ldrb r0, [r0]\n\
    bl sub_80F0FFC\n\
    b _080F0618\n\
    .align 2, 0\n\
_080F05B8: .4byte 0x0000876e\n\
_080F05BC:\n\
    ldr r1, _080F0600 @ =REG_BG2CNT\n\
    ldr r3, _080F0604 @ =0x00001d0a\n\
    adds r0, r3, 0\n\
    strh r0, [r1]\n\
    adds r1, 0x2\n\
    adds r3, 0xF9\n\
    adds r0, r3, 0\n\
    strh r0, [r1]\n\
    subs r1, 0x6\n\
    adds r3, 0xFE\n\
    adds r0, r3, 0\n\
    strh r0, [r1]\n\
    adds r1, 0x16\n\
    movs r0, 0xF8\n\
    strh r0, [r1]\n\
    ldr r1, [r2]\n\
    ldr r0, _080F0608 @ =0x00008776\n\
    adds r2, r1, r0\n\
    movs r3, 0\n\
    movs r0, 0xF8\n\
    strh r0, [r2]\n\
    ldr r2, _080F060C @ =0x00008778\n\
    adds r0, r1, r2\n\
    strh r3, [r0]\n\
    ldr r0, _080F0610 @ =REG_BLDCNT\n\
    strh r3, [r0]\n\
    ldr r3, _080F0614 @ =0x0000d160\n\
    adds r1, r3\n\
    ldrh r0, [r1]\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080F05FA:\n\
    movs r0, 0\n\
    b _080F0628\n\
    .align 2, 0\n\
_080F0600: .4byte REG_BG2CNT\n\
_080F0604: .4byte 0x00001d0a\n\
_080F0608: .4byte 0x00008776\n\
_080F060C: .4byte 0x00008778\n\
_080F0610: .4byte REG_BLDCNT\n\
_080F0614: .4byte 0x0000d160\n\
_080F0618:\n\
    ldr r0, _080F0634 @ =gUnknown_083DFEC4\n\
    ldr r1, [r0]\n\
    ldr r0, _080F0638 @ =0x00000306\n\
    adds r1, r0\n\
    ldrh r0, [r1]\n\
    adds r0, 0x1\n\
    strh r0, [r1]\n\
_080F0626:\n\
    movs r0, 0x1\n\
_080F0628:\n\
    add sp, 0x18\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r6}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080F0634: .4byte gUnknown_083DFEC4\n\
_080F0638: .4byte 0x00000306\n\
    .syntax divided\n");
}
#endif // NONMATCHING
