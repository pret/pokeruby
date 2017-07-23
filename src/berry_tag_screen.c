#include "global.h"
#include "berry_tag_screen.h"
#include "berry.h"
#include "decompress.h"
#include "field_map_obj.h"
#include "item_menu.h"
#include "items.h"
#include "item_use.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "rom4.h"
#include "songs.h"
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

extern struct Struct2000000 unk_2000000;
extern u16 gUnknown_030041B4;

static EWRAM_DATA u8 gUnknown_0203932C = 0;
static EWRAM_DATA s16 gUnknown_0203932E[5] = {0};

extern const struct CompressedSpriteSheet gUnknown_083C1F74;
extern const struct CompressedSpritePalette gUnknown_083C1F7C;

extern u8 gBerryCheck_Gfx[];
extern u8 gBerryCheck_Pal[];
extern u8 gUnknown_08E788E4[];
extern u8 gUnknown_08E78A84[];

static const u8 *const gUnknown_0841192C[] =
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
// static void sub_81466A0(void);
static void sub_81466E8(u8 taskId, s8 direction);
// static void sub_8146798(u8 berry);
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
    REG_BG0VOFS = gUnknown_030041B4;
    REG_BG1VOFS = gUnknown_030041B4;

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
        sub_80F9438();
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
        SetUpWindowConfig(&gWindowConfig_81E6E18);
        gMain.state += 1;
        break;
    case 4:
        MultistepInitMenuWindowBegin(&gWindowConfig_81E6E18);
        gMain.state += 1;
        break;
    case 5:
        if (!MultistepInitMenuWindowContinue())
            break;
        unk_2000000.var_1FFFF = 0;
        gMain.state += 1;
        break;
    case 6:
        if (!sub_81462B8())
            break;
        unk_2000000.var_1FFFF = 0;
        gMain.state += 1;
        break;
    case 7:
        sub_81464E4();
        gMain.state += 1;
        break;
    case 8:
        berry = gScriptItemId + OFFSET_7B;
        gUnknown_0203932C = CreateBerrySprite(berry, 56, 64);
        gMain.state += 1;
        break;
    case 9:
        sub_8146600(gScriptItemId + OFFSET_7B);
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
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
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
    gUnknown_030041B4 = 0;
}

bool8 sub_81462B8(void)
{
    u16 i;
    void *addr;

    switch (unk_2000000.var_1FFFF)
    {
    case 0:
        LZDecompressVram(gBerryCheck_Gfx, (void *)VRAM);
        unk_2000000.var_1FFFF += 1;
        break;
    case 1:
        LZDecompressVram(gUnknown_08E788E4, (void *)VRAM + 0x2800);
        unk_2000000.var_1FFFF += 1;
        break;
    case 2:
        LZDecompressVram(gUnknown_08E78A84, (void *)VRAM + 0x3000);
        unk_2000000.var_1FFFF += 1;
        break;
    case 3:
        for (i = 0; i < 0x400; i++)
        {
            if (gSaveBlock2.playerGender == MALE)
                gBGTilemapBuffers[2][i] = 0x4042;
            else
                gBGTilemapBuffers[2][i] = 0x5042;
        }
        addr = (void *)(VRAM + 0x3800);
        DmaCopy16(3, gBGTilemapBuffers[2], addr, 0x800);
        unk_2000000.var_1FFFF += 1;
        break;
    case 4:
        LoadCompressedPalette(gBerryCheck_Pal, 0, 96 * 2);
        unk_2000000.var_1FFFF += 1;
        break;
    case 5:
        LoadCompressedObjectPic(&gUnknown_083C1F74);
        unk_2000000.var_1FFFF += 1;
        break;
    case 6:
        LoadCompressedObjectPalette(&gUnknown_083C1F7C);
        unk_2000000.var_1FFFF = 0;
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
        gpu_pal_allocator_reset__manage_upper_four();
        DestroyTask(taskId);
    }
}

static void sub_8146440(u8 taskId)
{
    PlaySE(SE_SELECT);
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
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

    berryInfo = GetBerryInfo(gScriptItemId + OFFSET_7B + 1);

    ConvertIntToDecimalStringN(gStringVar1, gScriptItemId - FIRST_BERRY + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    MenuPrint(gStringVar1, 12, 4);

#if ENGLISH
    MenuPrint(berryInfo->name, 14, 4);
#elif GERMAN
    StringCopy(buffer, berryInfo->name);
    StringAppend(buffer, gOtherText_Berry2);
    MenuPrint(buffer, 14, 4);
#endif

    MenuPrint(berryInfo->description1, 4, 14);
    MenuPrint(berryInfo->description2, 4, 16);

#ifdef UNITS_IMPERIAL
    size = (berryInfo->size * 1000) / 254;
    if (size % 10 >= 5)
        size += 10;
    sizeMinor = (size % 100) / 10;
    sizeMajor = size / 100;
#endif

    MenuPrint(gOtherText_Size, 11, 7);
    if (berryInfo->size != 0)
    {
#ifdef UNITS_IMPERIAL
        ConvertIntToDecimalStringN(gStringVar1, sizeMajor, STR_CONV_MODE_LEFT_ALIGN, 2);
        ConvertIntToDecimalStringN(gStringVar2, sizeMinor, STR_CONV_MODE_LEFT_ALIGN, 2);
#else
        ConvertIntToDecimalStringN(gStringVar1, berryInfo->size / 10, STR_CONV_MODE_LEFT_ALIGN, 2);
        ConvertIntToDecimalStringN(gStringVar2, berryInfo->size % 10, STR_CONV_MODE_LEFT_ALIGN, 2);
#endif
        MenuPrint(gContestStatsText_Unknown1, 16, 7);
    }
    else
    {
        MenuPrint(gOtherText_ThreeQuestions2, 16, 7);
    }

    MenuPrint(gOtherText_Firm, 11, 9);
    if (berryInfo->firmness != 0)
        MenuPrint(gUnknown_0841192C[berryInfo->firmness - 1], 16, 9);
    else
        MenuPrint(gOtherText_ThreeQuestions2, 16, 9);
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

void sub_81466A0(void)
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

__attribute__((naked))
static void sub_81466E8(u8 taskId, s8 direction)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    lsls r1, 24\n\
    lsrs r2, r1, 24\n\
    lsls r0, r7, 2\n\
    adds r0, r7\n\
    lsls r0, 3\n\
    ldr r1, _08146748 @ =gTasks + 0x8\n\
    adds r6, r0, r1\n\
    ldr r4, _0814674C @ =gBagPocketScrollStates\n\
    movs r0, 0xC\n\
    adds r0, r4\n\
    mov r8, r0\n\
    ldrb r1, [r0, 0x1]\n\
    ldrb r0, [r4, 0xC]\n\
    adds r1, r0\n\
    cmp r1, 0\n\
    bne _08146718\n\
    lsls r0, r2, 24\n\
    cmp r0, 0\n\
    blt _0814678C\n\
_08146718:\n\
    adds r0, r1, 0x1\n\
    lsls r5, r2, 24\n\
    mov r1, r8\n\
    ldrb r1, [r1, 0x2]\n\
    cmp r0, r1\n\
    bne _08146728\n\
    cmp r5, 0\n\
    bgt _0814678C\n\
_08146728:\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    mov r2, r8\n\
    ldrb r3, [r2, 0x1]\n\
    ldrb r4, [r4, 0xC]\n\
    mov r12, r4\n\
    adds r0, r3, r4\n\
    asrs r2, r5, 24\n\
    adds r1, r0, r2\n\
    cmp r1, 0\n\
    bge _08146750\n\
    negs r0, r0\n\
    strh r0, [r6, 0x2]\n\
    b _08146766\n\
    .align 2, 0\n\
_08146748: .4byte gTasks + 0x8\n\
_0814674C: .4byte gBagPocketScrollStates\n\
_08146750:\n\
    mov r4, r8\n\
    ldrb r0, [r4, 0x2]\n\
    cmp r1, r0\n\
    blt _08146764\n\
    subs r0, r3\n\
    mov r1, r12\n\
    subs r0, r1\n\
    subs r0, 0x1\n\
    strh r0, [r6, 0x2]\n\
    b _08146766\n\
_08146764:\n\
    strh r2, [r6, 0x2]\n\
_08146766:\n\
    ldr r0, _08146780 @ =gTasks\n\
    lsls r1, r7, 2\n\
    adds r1, r7\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldr r0, _08146784 @ =sub_8146798\n\
    str r0, [r1]\n\
    cmp r5, 0\n\
    bge _08146788\n\
    movs r2, 0x10\n\
    negs r2, r2\n\
    adds r0, r2, 0\n\
    b _0814678A\n\
    .align 2, 0\n\
_08146780: .4byte gTasks\n\
_08146784: .4byte sub_8146798\n\
_08146788:\n\
    movs r0, 0x10\n\
_0814678A:\n\
    strh r0, [r6]\n\
_0814678C:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}

void sub_8146798(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    gUnknown_030041B4 = (gUnknown_030041B4 + taskData[0]) & 0xFF;
    if ((taskData[0] > 0 && gUnknown_030041B4 == 144)
     || (taskData[0] < 0 && gUnknown_030041B4 == 112))
    {
        sub_8146810(gTasks[taskId].data[1]);
        sub_81468BC();
    }
    if (gUnknown_030041B4 == 0)
    {
        gTasks[taskId].data[0] = gUnknown_030041B4;
        gTasks[taskId].data[1] = gUnknown_030041B4;
        gTasks[taskId].func = sub_8146480;
    }
}

__attribute__((naked))
static void sub_8146810(s8 berry)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    adds r4, r3, 0\n\
    lsls r0, r3, 24\n\
    asrs r1, r0, 24\n\
    cmp r1, 0\n\
    ble _08146848\n\
    ldr r0, _08146840 @ =gBagPocketScrollStates\n\
    adds r4, r0, 0\n\
    adds r4, 0xC\n\
    ldrb r2, [r0, 0xC]\n\
    adds r1, r2, r1\n\
    adds r6, r0, 0\n\
    cmp r1, 0x7\n\
    ble _08146844\n\
    adds r0, r3, 0\n\
    adds r0, 0xF9\n\
    adds r0, r2, r0\n\
    ldrb r1, [r4, 0x1]\n\
    adds r0, r1\n\
    strb r0, [r4, 0x1]\n\
    movs r0, 0x7\n\
    b _0814686E\n\
    .align 2, 0\n\
_08146840: .4byte gBagPocketScrollStates\n\
_08146844:\n\
    adds r0, r2, r3\n\
    b _0814686E\n\
_08146848:\n\
    ldr r0, _08146868 @ =gBagPocketScrollStates\n\
    adds r5, r0, 0\n\
    adds r5, 0xC\n\
    ldrb r2, [r0, 0xC]\n\
    adds r1, r2, r1\n\
    adds r6, r0, 0\n\
    cmp r1, 0\n\
    bge _0814686C\n\
    adds r0, r2, r3\n\
    ldrb r1, [r5, 0x1]\n\
    adds r0, r1\n\
    movs r1, 0\n\
    strb r0, [r5, 0x1]\n\
    strb r1, [r6, 0xC]\n\
    b _08146870\n\
    .align 2, 0\n\
_08146868: .4byte gBagPocketScrollStates\n\
_0814686C:\n\
    adds r0, r2, r4\n\
_0814686E:\n\
    strb r0, [r6, 0xC]\n\
_08146870:\n\
    ldr r2, _081468AC @ =gScriptItemId\n\
    movs r0, 0x3\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldrb r1, [r0, 0x1]\n\
    ldrb r0, [r0]\n\
    adds r1, r0\n\
    ldr r0, _081468B0 @ =gCurrentBagPocketItemSlots\n\
    ldr r0, [r0]\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldrh r0, [r1]\n\
    strh r0, [r2]\n\
    ldr r0, _081468B4 @ =gUnknown_0203932C\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _081468B8 @ =gSprites\n\
    adds r0, r1\n\
    bl DestroySprite\n\
    bl sub_81466A0\n\
    bl sub_80A7DD4\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_081468AC: .4byte gScriptItemId\n\
_081468B0: .4byte gCurrentBagPocketItemSlots\n\
_081468B4: .4byte gUnknown_0203932C\n\
_081468B8: .4byte gSprites\n\
    .syntax divided\n");
}

static void sub_81468BC(void)
{
    MenuZeroFillWindowRect(0, 4, 29, 19);
    sub_81464E4();

    // center of berry sprite
    gUnknown_0203932C = CreateBerrySprite(gScriptItemId + OFFSET_7B, 56, 64);

    sub_8146600(gScriptItemId + OFFSET_7B);
}
