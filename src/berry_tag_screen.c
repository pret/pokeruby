#include "global.h"
#include "berry_tag_screen.h"
#include "berry.h"
#include "decompress.h"
#include "event_object_movement.h"
#include "item_menu.h"
#include "constants/items.h"
#include "item_use.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "overworld.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text.h"

#define OFFSET_7B (123)
#define FIRST_BERRY ITEM_CHERI_BERRY

struct Struct2000000
{
    /*0x00*/ u8 filler_0[0x1FFFF];
    /*0x1FFFF*/ u8 var_1FFFF;
};

extern struct Struct2000000 gSharedMem;
extern u16 gBattle_BG1_Y;

static EWRAM_DATA u8 gUnknown_0203932C = 0;
static EWRAM_DATA s16 gUnknown_0203932E[5] = {0};

extern const struct CompressedSpriteSheet gUnknown_083C1F74;
extern const struct CompressedSpritePalette gUnknown_083C1F7C;

extern u8 gBerryCheck_Gfx[];
extern u8 gBerryCheck_Pal[];
extern u8 gUnknown_08E788E4[];
extern u8 gUnknown_08E78A84[];

const u8 *const gUnknown_0841192C[] =
{
    ContestStatsText_VerySoft,
    ContestStatsText_Soft,
    ContestStatsText_Hard,
    ContestStatsText_VeryHard,
    ContestStatsText_SuperHard,
};

static void sub_8146014(void);
static void sub_814602C(void);
static bool8 sub_8146058(void);
static void sub_8146288(void);
static bool8 sub_81462B8(void);
static void sub_814640C(u8 taskId);
static void sub_8146440(u8 taskId);
static void sub_8146480(u8 taskid);
static void sub_81464E4(void);
static void sub_8146600(u8 berry);
static void sub_81466A0(void);
static void sub_81466E8(u8 taskId, s8 direction);
static void sub_8146798(u8 berry);
static void sub_8146810(s8 berry);
static void sub_81468BC(void);

static void sub_8146014(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

static void sub_814602C(void)
{
    REG_BG0VOFS = gBattle_BG1_Y;
    REG_BG1VOFS = gBattle_BG1_Y;

    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static bool8 sub_8146058(void)
{
    u8 berry;
    u16 backup;

    switch (gMain.state)
    {
    case 0:
        ClearVideoCallbacks();
        sub_80F9368();
        sub_8146288();
        REG_BLDCNT = 0;
        gMain.state += 1;
        break;
    case 1:
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = 1;
        gMain.state += 1;
        break;
    case 2:
        ResetSpriteData();
        gMain.state += 1;
        break;
    case 3:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6E18);
        gMain.state += 1;
        break;
    case 4:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E6E18);
        gMain.state += 1;
        break;
    case 5:
        if (!MultistepInitMenuWindowContinue())
            break;
        gSharedMem.var_1FFFF = 0;
        gMain.state += 1;
        break;
    case 6:
        if (!sub_81462B8())
            break;
        gSharedMem.var_1FFFF = 0;
        gMain.state += 1;
        break;
    case 7:
        sub_81464E4();
        gMain.state += 1;
        break;
    case 8:
        berry = gSpecialVar_ItemId + OFFSET_7B;
        gUnknown_0203932C = CreateBerrySprite(berry, 56, 64);
        gMain.state += 1;
        break;
    case 9:
        sub_8146600(gSpecialVar_ItemId + OFFSET_7B);
        gMain.state += 1;
        break;
    case 10:
        backup = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = backup;
        REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
        SetVBlankCallback(sub_814602C);
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP;
        gMain.state += 1;
        break;
    case 11:
        if (sub_8055870() == TRUE)
            break;
        gMain.state += 1;
        break;
    case 12:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gPaletteFade.bufferTransferDisabled = 0;
        SetMainCallback2(sub_8146014);
        return TRUE;
    }

    return FALSE;
}

void BerryTagScreen_814625C(u8 taskId)
{
    do
    {
        if (sub_8146058() == TRUE)
        {
            CreateTask(sub_8146480, 0);
            return;
        }
    } while (sub_80F9344() != TRUE);
}

static void sub_8146288(void)
{
    REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(5) | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG2CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(6) | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(7) | BGCNT_16COLOR | BGCNT_TXT256x256;
    gBattle_BG1_Y = 0;
}

bool8 sub_81462B8(void)
{
    u16 i;

    switch (gSharedMem.var_1FFFF)
    {
    case 0:
        LZDecompressVram(gBerryCheck_Gfx, (void *)VRAM);
        gSharedMem.var_1FFFF += 1;
        break;
    case 1:
        LZDecompressVram(gUnknown_08E788E4, (void *)VRAM + 0x2800);
        gSharedMem.var_1FFFF += 1;
        break;
    case 2:
        LZDecompressVram(gUnknown_08E78A84, (void *)VRAM + 0x3000);
        gSharedMem.var_1FFFF += 1;
        break;
    case 3:
        for (i = 0; i < 0x400; i++)
        {
            if (gSaveBlock2.playerGender == MALE)
                gBGTilemapBuffers[2][i] = 0x4042;
            else
                gBGTilemapBuffers[2][i] = 0x5042;
        }
        DmaCopy16Defvars(3, gBGTilemapBuffers[2], (void *)(VRAM + 0x3800), 0x800);
        gSharedMem.var_1FFFF += 1;
        break;
    case 4:
        LoadCompressedPalette(gBerryCheck_Pal, 0, 96 * 2);
        gSharedMem.var_1FFFF += 1;
        break;
    case 5:
        LoadCompressedObjectPic(&gUnknown_083C1F74);
        gSharedMem.var_1FFFF += 1;
        break;
    case 6:
        LoadCompressedObjectPalette(&gUnknown_083C1F7C);
        gSharedMem.var_1FFFF = 0;
        return TRUE;
    }

    return FALSE;
}

static void sub_814640C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sub_80A5B40);
        sub_80A7DD4();
        FreeAndReserveObjectSpritePalettes();
        DestroyTask(taskId);
    }
}

static void sub_8146440(u8 taskId)
{
    PlaySE(SE_SELECT);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = sub_814640C;
}

static void sub_8146480(u8 taskid)
{
    if (!gPaletteFade.active)
    {
        if ((gMain.newAndRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT | DPAD_UP | DPAD_DOWN)) == DPAD_UP)
            sub_81466E8(taskid, -1);
        if ((gMain.newAndRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT | DPAD_UP | DPAD_DOWN)) == DPAD_DOWN)
            sub_81466E8(taskid, 1);
        if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
            sub_8146440(taskid);
    }
}

static void sub_81464E4(void)
{
    const struct Berry *berryInfo;
#ifdef UNITS_IMPERIAL
    u32 size;
    s32 sizeMajor;
    s32 sizeMinor;
#endif
#if GERMAN
    u8 buffer[16];
#endif

    berryInfo = GetBerryInfo(gSpecialVar_ItemId + OFFSET_7B + 1);

    ConvertIntToDecimalStringN(gStringVar1, gSpecialVar_ItemId - FIRST_BERRY + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    Menu_PrintText(gStringVar1, 12, 4);

#if ENGLISH
    Menu_PrintText(berryInfo->name, 14, 4);
#elif GERMAN
    StringCopy(buffer, berryInfo->name);
    StringAppend(buffer, gOtherText_Berry2);
    Menu_PrintText(buffer, 14, 4);
#endif

    Menu_PrintText(berryInfo->description1, 4, 14);
    Menu_PrintText(berryInfo->description2, 4, 16);

#ifdef UNITS_IMPERIAL
    size = (berryInfo->size * 1000) / 254;
    if (size % 10 >= 5)
        size += 10;
    sizeMinor = (size % 100) / 10;
    sizeMajor = size / 100;
#endif

    Menu_PrintText(gOtherText_Size, 11, 7);
    if (berryInfo->size != 0)
    {
#ifdef UNITS_IMPERIAL
        ConvertIntToDecimalStringN(gStringVar1, sizeMajor, STR_CONV_MODE_LEFT_ALIGN, 2);
        ConvertIntToDecimalStringN(gStringVar2, sizeMinor, STR_CONV_MODE_LEFT_ALIGN, 2);
#else
        ConvertIntToDecimalStringN(gStringVar1, berryInfo->size / 10, STR_CONV_MODE_LEFT_ALIGN, 2);
        ConvertIntToDecimalStringN(gStringVar2, berryInfo->size % 10, STR_CONV_MODE_LEFT_ALIGN, 2);
#endif
        Menu_PrintText(gContestStatsText_Unknown1, 16, 7);
    }
    else
    {
        Menu_PrintText(gOtherText_ThreeQuestions2, 16, 7);
    }

    Menu_PrintText(gOtherText_Firm, 11, 9);
    if (berryInfo->firmness != 0)
        Menu_PrintText(gUnknown_0841192C[berryInfo->firmness - 1], 16, 9);
    else
        Menu_PrintText(gOtherText_ThreeQuestions2, 16, 9);
}

static void sub_8146600(u8 berry)
{
    const struct Berry *berryInfo;
    u16 i;

    berryInfo = GetBerryInfo(berry + 1);
    for (i = 0; i < 5; i++)
        gUnknown_0203932E[i] = (u16)gUnknown_0203932E[i] | 0xFFFF;

    // argument is the center of the circle
    if (berryInfo->spicy)
        gUnknown_0203932E[0] = sub_80A7E5C(48);
    if (berryInfo->dry)
        gUnknown_0203932E[1] = sub_80A7E5C(88);
    if (berryInfo->sweet)
        gUnknown_0203932E[2] = sub_80A7E5C(128);
    if (berryInfo->bitter)
        gUnknown_0203932E[3] = sub_80A7E5C(168);
    if (berryInfo->sour)
        gUnknown_0203932E[4] = sub_80A7E5C(208);
}

static void sub_81466A0(void)
{
    u16 i;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_0203932E[i] != -1)
        {
            DestroySprite(&gSprites[gUnknown_0203932E[i]]);
            gUnknown_0203932E[i] = -1;
        }
    }
}

static void sub_81466E8(u8 taskId, s8 direction)
{
    u8 berryPocket = 3;
    s16 *data = gTasks[taskId].data;

    if (gBagPocketScrollStates[berryPocket].scrollTop + gBagPocketScrollStates[berryPocket].cursorPos == 0
     && direction < 0)
        return;
    if (gBagPocketScrollStates[berryPocket].scrollTop + gBagPocketScrollStates[berryPocket].cursorPos + 1 == gBagPocketScrollStates[berryPocket].numSlots
     && direction > 0)
        return;

    PlaySE(SE_SELECT);
    if (gBagPocketScrollStates[berryPocket].scrollTop + gBagPocketScrollStates[berryPocket].cursorPos + direction < 0)
        data[1] = -(gBagPocketScrollStates[berryPocket].scrollTop + gBagPocketScrollStates[berryPocket].cursorPos);
    else if (gBagPocketScrollStates[berryPocket].scrollTop + gBagPocketScrollStates[berryPocket].cursorPos + direction >= gBagPocketScrollStates[berryPocket].numSlots)
        data[1] = gBagPocketScrollStates[berryPocket].numSlots - gBagPocketScrollStates[berryPocket].scrollTop - gBagPocketScrollStates[berryPocket].cursorPos - 1;
    else
        data[1] = direction;

    gTasks[taskId].func = sub_8146798;

    if (direction < 0)
        data[0] = -16;
    else
        data[0] = 16;

}

static void sub_8146798(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    gBattle_BG1_Y = (gBattle_BG1_Y + taskData[0]) & 0xFF;
    if ((taskData[0] > 0 && gBattle_BG1_Y == 144)
     || (taskData[0] < 0 && gBattle_BG1_Y == 112))
    {
        sub_8146810(gTasks[taskId].data[1]);
        sub_81468BC();
    }
    if (gBattle_BG1_Y == 0)
    {
        gTasks[taskId].data[0] = gBattle_BG1_Y;
        gTasks[taskId].data[1] = gBattle_BG1_Y;
        gTasks[taskId].func = sub_8146480;
    }
}

static void sub_8146810(s8 berry)
{
    u8 berryPocket = 3;

    if (berry > 0)
    {
        if (gBagPocketScrollStates[berryPocket].cursorPos + berry > 7)
        {
            gBagPocketScrollStates[berryPocket].scrollTop += gBagPocketScrollStates[berryPocket].cursorPos - 7 + berry;
            gBagPocketScrollStates[berryPocket].cursorPos = 7;
        }
        else
        {
            gBagPocketScrollStates[berryPocket].cursorPos += berry;
        }
    }
    else
    {
        if (gBagPocketScrollStates[berryPocket].cursorPos + berry < 0)
        {
            gBagPocketScrollStates[berryPocket].scrollTop += gBagPocketScrollStates[berryPocket].cursorPos + berry;
            gBagPocketScrollStates[berryPocket].cursorPos = 0;
        }
        else
        {
            gBagPocketScrollStates[berryPocket].cursorPos += berry;
        }
    }
    gSpecialVar_ItemId = gCurrentBagPocketItemSlots[gBagPocketScrollStates[berryPocket].scrollTop + gBagPocketScrollStates[berryPocket].cursorPos].itemId;
    DestroySprite(&gSprites[gUnknown_0203932C]);
    sub_81466A0();
    sub_80A7DD4();
}

static void sub_81468BC(void)
{
    Menu_EraseWindowRect(0, 4, 29, 19);
    sub_81464E4();

    // center of berry sprite
    gUnknown_0203932C = CreateBerrySprite(gSpecialVar_ItemId + OFFSET_7B, 56, 64);

    sub_8146600(gSpecialVar_ItemId + OFFSET_7B);
}
