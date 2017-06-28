//
// Created by scott on 6/27/2017.
//

#include "global.h"
#include "rom4.h"
#include "sprite.h"
#include "script.h"
#include "strings.h"
#include "task.h"
#include "unknown_task.h"
#include "text.h"
#include "main.h"
#include "menu.h"
#include "field_fadetransition.h"
#include "palette.h"
#include "graphics.h"
#include "decompress.h"
#include "menu_helpers.h"
#include "battle.h"
#include "item_menu.h"
#include "item.h"
#include "items.h"
#include "sound.h"
#include "songs.h"
#include "safari_zone.h"
#include "pokeblock.h"

// rodata

const s8 gPokeblockFlavorCompatibilityTable[] = {
    // Cool, Beauty, Cute, Smart, Tough
          0,      0,    0,     0,     0, // Hardy
          1,      0,    0,     0,    -1, // Lonely
          1,      0,   -1,     0,     0, // Brave
          1,     -1,    0,     0,     0, // Adamant
          1,      0,    0,    -1,     0, // Naughty
         -1,      0,    0,     0,     1, // Bold
          0,      0,    0,     0,     0, // Docile
          0,      0,   -1,     0,     1, // Relaxed
          0,     -1,    0,     0,     1, // Impish
          0,      0,    0,    -1,     1, // Lax
         -1,      0,    1,     0,     0, // Timid
          0,      0,    1,     0,    -1, // Hasty
          0,      0,    0,     0,     0, // Serious
          0,     -1,    1,     0,     0, // Jolly
          0,      0,    1,    -1,     0, // Naive
         -1,      1,    0,     0,     0, // Modest
          0,      1,    0,     0,    -1, // Mild
          0,      1,   -1,     0,     0, // Quiet
          0,      0,    0,     0,     0, // Bashful
          0,      1,    0,    -1,     0, // Rash
         -1,      0,    0,     1,     0, // Calm
          0,      0,    0,     1,    -1, // Gentle
          0,      0,   -1,     1,     0, // Sassy
          0,     -1,    0,     1,     0, // Careful
          0,      0,    0,     0,     0  // Quirky
};

void (*const gUnknown_083F7EA8[])(void) = {
    sub_80A5B40,
    c2_exit_to_overworld_2_switch,
    sub_802E424,
    c2_exit_to_overworld_2_switch
};

const u8 *const gPokeblockNames[] = {
    NULL,
    ContestStatsText_RedPokeBlock,
    ContestStatsText_BluePokeBlock,
    ContestStatsText_PinkPokeBlock,
    ContestStatsText_GreenPokeBlock,
    ContestStatsText_YellowPokeBlock,
    ContestStatsText_PurplePokeBlock,
    ContestStatsText_IndigoPokeBlock,
    ContestStatsText_BrownPokeBlock,
    ContestStatsText_LiteBluePokeBlock,
    ContestStatsText_OlivePokeBlock,
    ContestStatsText_GrayPokeBlock,
    ContestStatsText_BlackPokeBlock,
    ContestStatsText_WhitePokeBlock,
    ContestStatsText_GoldPokeBlock
};

void sub_810C508(u8);
void sub_810C5C0(u8);
void sub_810C748(u8);
void sub_810C788(u8);
void sub_810C854(u8);

const struct MenuAction2 gUnknown_083F7EF4[] = {
    OtherText_Use,     sub_810C508,
    OtherText_Toss,    sub_810C5C0,
    gOtherText_CancelNoTerminator, sub_810C748,
    OtherText_Use,     sub_810C788,
    OtherText_Use,     sub_810C854,
};

const u8 gUnknown_083F7F1C[] = {0, 1, 2};
const u8 gUnknown_083F7F1F[] = {3, 2};
const u8 gUnknown_083F7F21[] = {4, 2};

void sub_810C610(u8);
void sub_810C668(u8);

const struct YesNoFuncTable gUnknown_083F7F24[] = {sub_810C610, sub_810C668};

const u8 UnreferencedData_083F7F2C[] = {0x16, 0x17, 0x18, 0x21, 0x2f};

const struct OamData gOamData_83F7F34 = {
    .size = 3,
    .priority = 2
};

const union AnimCmd gSpriteAnim_83F7F3C[] = {
    ANIMCMD_FRAME(.imageValue = 0, .duration = 0),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83F7F44[] = {
    gSpriteAnim_83F7F3C
};

const union AffineAnimCmd gSpriteAffineAnim_83F7F48[] = {
    AFFINEANIMCMD_FRAME(0, 0, -2,  2),
    AFFINEANIMCMD_FRAME(0, 0,  2,  4),
    AFFINEANIMCMD_FRAME(0, 0, -2,  4),
    AFFINEANIMCMD_FRAME(0, 0,  2,  2),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83F7F70[] = {
    gSpriteAffineAnim_83F7F48
};

const struct CompressedSpriteSheet gUnknown_083F7F74 = {
    gMenuPokeblockDevice_Gfx,
    0x800,
    0x39d0
};

const struct CompressedSpritePalette gUnknown_083F7F7C = {
    gMenuPokeblockDevice_Pal,
    0x39d0
};

const struct SpriteTemplate gSpriteTemplate_83F7F84 = {
    0x39d0,
    0x39d0,
    &gOamData_83F7F34,
    gSpriteAnimTable_83F7F44,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

const struct Pokeblock gUnknown_083F7F9C[] = {
    { PBLOCK_CLR_RED,    20,  0,  0,  0,  0, 20},
    { PBLOCK_CLR_BLUE,    0, 20,  0,  0,  0, 20},
    { PBLOCK_CLR_PINK,    0,  0, 20,  0,  0, 20},
    { PBLOCK_CLR_GREEN,   0,  0,  0, 20,  0, 20},
    { PBLOCK_CLR_YELLOW,  0,  0,  0,  0, 20, 20}
};

// text

static void sub_810B674(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

static void sub_810B68C(void)
{
    u16 *src;
    vu16 *dest;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    src = gBGTilemapBuffers[2];
    dest = (vu16 *)(VRAM + 0x7800);
    DmaCopy16(3, src, dest, sizeof gBGTilemapBuffers[2]);
}

static bool8 sub_810B998(void);
u8 sub_810BA50(s16, s16, u8);
void sub_810BC98(void);
void sub_810BD08(void);
void sub_810BB0C(void);
void sub_810BB30(void);
void sub_810BC84(u8);

static bool8 sub_810B6C0(void)
{
    u16 ime;
    switch (gMain.state)
    {
        case  0:
            sub_80F9438();
            sub_80F9368();
            REG_BG2CNT = BGCNT_SCREENBASE(15) | BGCNT_CHARBASE(2) | BGCNT_PRIORITY(2);
            REG_BLDCNT = 0;
            gMain.state++;
            break;
        case  1:
            remove_some_task();
            gMain.state++;
            break;
        case  2:
            ResetPaletteFade();
            gPaletteFade.bufferTransferDisabled = TRUE;
            gMain.state++;
            break;
        case  3:
            ResetSpriteData();
            gMain.state++;
            break;
        case  4:
            if (gUnknown_02039244 != 2)
            {
                ResetTasks();
            }
            gMain.state++;
            break;
        case  5:
            SetUpWindowConfig(&gWindowConfig_81E6E34);
            gMain.state++;
            break;
        case  6:
            SetUpWindowConfig(&gWindowConfig_81E6E50);
            gMain.state++;
            break;
        case  7:
            MultistepInitMenuWindowBegin(&gWindowConfig_81E6E34);
            gMain.state++;
            break;
        case  8:
            if (MultistepInitMenuWindowContinue())
            {
                gMain.state++;
            }
            break;
        case  9:
            MultistepInitMenuWindowBegin(&gWindowConfig_81E6E50);
            gMain.state++;
            break;
        case 10:
            if (MultistepInitMenuWindowContinue())
            {
                ewram[0x1ffff] = 0;
                gMain.state++;
            }
            break;
        case 11:
            if (sub_810B998())
            {
                gMain.state++;
            }
            break;
        case 12:
            sub_80F944C();
            LoadScrollIndicatorPalette();
            CreateVerticalScrollIndicators(0, 0xb0, 0x08);
            CreateVerticalScrollIndicators(1, 0xb0, 0x98);
            gMain.state++;
            break;
        case 13:
            ewram[0x1fffe] = sub_810BA50(0x38, 0x40, 0);
            gMain.state++;
            break;
        case 14:
            sub_810BC98();
            sub_810BD08();
            gMain.state++;
            break;
        case 15:
            sub_810BB0C();
            sub_810BB30();
            sub_810BC84(gUnknown_02039248[1]);
            gMain.state++;
            break;
        case 16:
            ime = REG_IME;
            REG_IME = 0;
            REG_IE |= INTR_FLAG_VBLANK;
            REG_IME = ime;
            REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
            SetVBlankCallback(sub_810B68C);
            REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG2_ON | DISPCNT_BG1_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP;
            gMain.state++;
            break;
        case 17:
            if (sub_8055870() != TRUE)
            {
                gMain.state++;
            }
            break;
        case 18:
            BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
            gPaletteFade.bufferTransferDisabled = FALSE;
            SetMainCallback2(sub_810B674);
            return TRUE;
    }
    return FALSE;
}

void sub_810BF7C(u8);

void sub_810B96C(void)
{
    do {
        if (sub_810B6C0() == TRUE)
        {
            CreateTask(sub_810BF7C, 0);
            break;
        }
    } while (sub_80F9344() != TRUE);
}

static bool8 sub_810B998(void)
{
    switch (ewram[0x1ffff])
    {
        case 0:
            LZDecompressVram(gMenuPokeblock_Gfx, (void *)VRAM + 0x8000);
            ewram[0x1ffff]++;
            break;
        case 1:
            sub_800D238(gMenuPokeblock_Tilemap, gBGTilemapBuffers[2]);
            ewram[0x1ffff]++;
            break;
        case 2:
            LoadCompressedPalette(gMenuPokeblock_Pal, 0, 0xc0);
            ewram[0x1ffff]++;
            break;
        case 3:
            LoadCompressedObjectPic(&gUnknown_083F7F74);
            ewram[0x1ffff]++;
            break;
        case 4:
            LoadCompressedObjectPalette(&gUnknown_083F7F7C);
            ewram[0x1ffff] = 0;
            return TRUE;
    }
    return FALSE;
}

u8 sub_810BA50(s16 x, s16 y, u8 subpriority)
{
    return CreateSprite(&gSpriteTemplate_83F7F84, x, y, subpriority);
}

void sub_810BA7C(u8 a0)
{
    gUnknown_02039244 = a0;
    switch (gUnknown_02039244)
    {
        default:
            gUnknown_03000758 = gUnknown_083F7F1C;
            gUnknown_0203924C = sizeof gUnknown_083F7F1C;
            break;
        case 2:
            gUnknown_03000758 = gUnknown_083F7F1F;
            gUnknown_0203924C = sizeof gUnknown_083F7F1F;
            break;
        case 3:
            gUnknown_03000758 = gUnknown_083F7F21;
            gUnknown_0203924C = sizeof gUnknown_083F7F21;
            break;
    }
}

void sub_810BADC(void)
{
    sub_810BA7C(2);
    SetMainCallback2(sub_810B96C);
}

void sub_810BAF4(void)
{
    sub_810BA7C(3);
    SetMainCallback2(sub_810B96C);
}

void sub_810BB0C(void)
{
    BasicInitMenuWindow(&gWindowConfig_81E6E34);
    sub_8072BD8(ItemId_GetItem(ITEM_POKEBLOCK_CASE)->name, 2, 1, 0x48);
}

void sub_810BB30(void)
{
    BasicInitMenuWindow(&gWindowConfig_81E6E34);
    MenuPrint(gContestStatsText_Spicy,   2, 13);
    MenuPrint(gContestStatsText_Dry,     2, 15);
    MenuPrint(gContestStatsText_Sweet,   2, 17);
    MenuPrint(gContestStatsText_Bitter,  8, 13);
    MenuPrint(gContestStatsText_Sour,    8, 15);
}

u8 sub_810C9B0(struct Pokeblock *);

void sub_810BB88(u8 a0)
{
    u8 i;
    u8 y;
    u8 *buf;
    BasicInitMenuWindow(&gWindowConfig_81E6E34);
    for (i=a0; i<=a0+8; i++)
    {
        y = (i - a0) << 1;
        if (i == gUnknown_02039248[2])
        {
            buf = sub_8072C74(gStringVar1, gContestStatsText_StowCase, 0x78, 0);
            MenuPrint(gStringVar1, 15, y + 1);
            if (i != a0 + 8)
            {
                MenuZeroFillWindowRect(15, y + 3, 29, 18);
            }
            break;
        }
        buf = sub_8072C74(gStringVar1, gPokeblockNames[gSaveBlock1.pokeblocks[i].color], 0x5e, 0);
        buf[0] = EXT_CTRL_CODE_BEGIN;
        buf[1] = 0x14;
        buf[2] = 0x06;
        buf += 3;
        ConvertIntToDecimalStringN(buf, sub_810C9B0(&gSaveBlock1.pokeblocks[i]), STR_CONV_MODE_RIGHT_ALIGN, 3);
        MenuPrint(gStringVar1, 15, y + 1);
    }
}

void sub_810BDAC(bool8);

void sub_810BC84(u8 a0)
{
    sub_810BB88(a0);
    sub_810BDAC(FALSE);
}

void sub_810BC98(void)
{
    u16 i, j;
    struct Pokeblock buf;
    for (i=0; i<39; i++)
    {
        for (j=i+1; j<40; j++)
        {
            if (gSaveBlock1.pokeblocks[i].color == 0)
            {
                buf = gSaveBlock1.pokeblocks[i];
                gSaveBlock1.pokeblocks[i] = gSaveBlock1.pokeblocks[j];
                gSaveBlock1.pokeblocks[j] = buf;
            }
        }
    }
}

void sub_810BD08(void)
{
    u8 i;
    gUnknown_02039248[2] = 0;
    for (i=0; i<40; i++)
    {
        if (gSaveBlock1.pokeblocks[i].color != 0)
            gUnknown_02039248[2]++;
    }
    if (gUnknown_02039248[2] < 8)
    {
        gUnknown_02039248[3] = gUnknown_02039248[2];
    }
    else
    {
        gUnknown_02039248[3] = 8;
    }
    if (gUnknown_02039248[1] + 8 > gUnknown_02039248[2] && gUnknown_02039248[1] != 0)
    {
        gUnknown_02039248[1]--;
    }
}

void sub_810BD64(u16 a0, u16 a1)
{
    u8 i;
    int y;
    for (i=0; i<14; i++)
    {
        gBGTilemapBuffers[2][(2 * gUnknown_02039248[0] + 1) * 32 + (y = i + 15)] = a0;
        gBGTilemapBuffers[2][(2 * gUnknown_02039248[0] + 2) * 32 + y] = a0;
    }
}

s16 sub_810CA9C(const struct Pokeblock *, u8);
u8 sub_810C9E8(struct Pokeblock *);

void sub_810BDAC(bool8 flag)
{
    u8 i;
    u16 v0;
    if (!flag)
    {
        sub_810BD64(0x1005, 0x1014);
    }
    else
    {
        sub_810BD64(0x2005, 0x2014);
    }
    if (gUnknown_02039248[1])
    {
        sub_80F979C(0, 0);
    }
    else
    {
        sub_80F979C(0, 1);
    }
    if (gUnknown_02039248[2] > gUnknown_02039248[3] && gUnknown_02039248[1] + gUnknown_02039248[3] != gUnknown_02039248[2])
    {
        sub_80F979C(1, 0);
    }
    else
    {
        sub_80F979C(1, 1);
    }
    for (i=0; i<5; i++)
    {
        v0 = ((i % 3) << 6) + 0x1a1 + (i / 3) * 6;
        if (gUnknown_02039248[0] + gUnknown_02039248[1] != gUnknown_02039248[2])
        {
            if (sub_810CA9C(&gSaveBlock1.pokeblocks[gUnknown_02039248[0] + gUnknown_02039248[1]], i + 1) > 0)
            {
                gBGTilemapBuffers[2][v0] = (i << 12) + 23;
                gBGTilemapBuffers[2][v0 + 32] = (i << 12) + 24;
            }
            else
            {
                gBGTilemapBuffers[2][v0] = 15;
                gBGTilemapBuffers[2][v0 + 32] = 15;
            }
        }
        else
        {
            gBGTilemapBuffers[2][v0] = 15;
            gBGTilemapBuffers[2][v0 + 32] = 15;
        }
    }
    BasicInitMenuWindow(&gWindowConfig_81E6E34);
    if (gUnknown_02039248[0] + gUnknown_02039248[1] != gUnknown_02039248[2])
    {
        sub_8072C14(gStringVar1, sub_810C9E8(&gSaveBlock1.pokeblocks[gUnknown_02039248[0] + gUnknown_02039248[1]]), 16, 1);
        MenuPrint(gStringVar1, 11, 17);
    }
    else
    {
        MenuZeroFillWindowRect(11, 17, 12, 18);
    }
}

void sub_810C8D4(struct Sprite *);

void sub_810BF38(bool8 flag)
{
    PlaySE(SE_SELECT);
    gSprites[ewram[0x1fffe]].callback = sub_810C8D4;
    sub_810BDAC(flag);
}

void sub_810C0C8(u8);
void sub_810C31C(u8);
void sub_810C368(u8);

void sub_810BF7C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newAndRepeatedKeys & DPAD_UP)
        {
            if (gUnknown_02039248[0] != 0)
            {
                sub_810BD64(5, 20);
                gUnknown_02039248[0]--;
                sub_810BF38(FALSE);
            }
            else if (gUnknown_02039248[1] != 0)
            {
                gUnknown_02039248[1]--;
                sub_810BB88(gUnknown_02039248[1]);
                sub_810BF38(FALSE);
            }
        }
        else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            if (gUnknown_02039248[0] != gUnknown_02039248[3])
            {
                sub_810BD64(5, 20);
                gUnknown_02039248[0]++;
                sub_810BF38(FALSE);
            }
            else if (gUnknown_02039248[1] + gUnknown_02039248[0] != gUnknown_02039248[2])
            {
                gUnknown_02039248[1]++;
                sub_810BB88(gUnknown_02039248[1]);
                sub_810BF38(FALSE);
            }
        }
        else if (gMain.newKeys & SELECT_BUTTON)
        {
            if (gUnknown_02039248[1] + gUnknown_02039248[0] != gUnknown_02039248[2])
            {
                PlaySE(SE_SELECT);
                sub_810BDAC(TRUE);
                gTasks[taskId].data[0] = gUnknown_02039248[1] + gUnknown_02039248[0];
                gTasks[taskId].func = sub_810C0C8;
            }
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            if (gUnknown_02039248[1] + gUnknown_02039248[0] == gUnknown_02039248[2])
            {
                gScriptResult = 0xffff;
                sub_810C31C(taskId);
            }
            else
            {
                sub_810C368(taskId);
            }
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            gScriptResult = 0xffff;
            sub_810C31C(taskId);
        }
    }
}

void sub_810C1C8(u8, u8);
void sub_810C23C(u8);

void sub_810C0C8(u8 taskId)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (gUnknown_02039248[0] != 0)
        {
            sub_810BD64(5, 20);
            gUnknown_02039248[0]--;
            sub_810BF38(TRUE);
            sub_810C1C8(taskId, 1);
        }
        else if (gUnknown_02039248[1] != 0)
        {
            sub_810C1C8(taskId, 0);
            gUnknown_02039248[1]--;
            sub_810BB88(gUnknown_02039248[1]);
            sub_810BF38(TRUE);
            sub_810C1C8(taskId, 1);
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (gUnknown_02039248[0] != gUnknown_02039248[3])
        {
            sub_810BD64(5, 20);
            gUnknown_02039248[0]++;
            sub_810BF38(TRUE);
            sub_810C1C8(taskId, 1);
        }
        else if (gUnknown_02039248[1] + gUnknown_02039248[0] != gUnknown_02039248[2])
        {
            sub_810C1C8(taskId, 0);
            gUnknown_02039248[1]++;
            sub_810BB88(gUnknown_02039248[1]);
            sub_810BF38(TRUE);
            sub_810C1C8(taskId, 1);
        }
    }
    else if (gMain.newKeys & A_BUTTON || gMain.newKeys & SELECT_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_810C1C8(taskId, 0);
        sub_810C23C(taskId);
        gTasks[taskId].func = sub_810BF7C;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_810C1C8(taskId, 0);
        sub_810BDAC(0);
        gTasks[taskId].func = sub_810BF7C;
    }
}

void sub_810C1C8(u8 taskId, u8 flag)
{
    u8 i;
    u32 x;
    s16 y;
    u16 v0 = 0x1005;
    if (!flag)
    {
        v0 = 0x0005;
    }
    y = gTasks[taskId].data[0] - gUnknown_02039248[1];
    if ((u16)y <= 8 && y != gUnknown_02039248[0])
    {
        for (i=0; i<14; i++)
        {
            gBGTilemapBuffers[2][(2 * y + 1) * 32 + (x = i + 15)] = v0;
            gBGTilemapBuffers[2][(2 * y + 2) * 32 + x] = v0;
        }
    }
}

void sub_810C23C(u8 taskId)
{
    struct Pokeblock buf;
    u8 selidx = gUnknown_02039248[1] + gUnknown_02039248[0];
    if (selidx == gUnknown_02039248[2])
    {
        sub_810BDAC(FALSE);
    }
    else
    {
        buf = gSaveBlock1.pokeblocks[selidx];
        gSaveBlock1.pokeblocks[selidx] = gSaveBlock1.pokeblocks[gTasks[taskId].data[0]];
        gSaveBlock1.pokeblocks[gTasks[taskId].data[0]] = buf;
        sub_810BB88(gUnknown_02039248[1]);
        sub_810BDAC(FALSE);
    }
}

void sub_810C2B0(void)
{
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    BuyMenuFreeMemory();
}

void sub_810C2C8(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gUnknown_02039244 == 3)
        {
            gFieldCallback = sub_8080990;
        }
        sub_810C2B0();
        SetMainCallback2(gUnknown_083F7EA8[gUnknown_02039244]);
        DestroyTask(taskId);
    }
}

void sub_810C31C(u8 taskId)
{
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    if (gUnknown_02039244 > 1)
    {
        gScriptItemId = ITEM_NONE;
    }
    gTasks[taskId].func = sub_810C2C8;
}

void sub_810C40C(u8);

void sub_810C368(u8 taskId)
{
    int v0 = 0;
    if (gUnknown_02039244 > 1)
        v0 = 2;
    sub_80F98A4(0);
    sub_80F98A4(1);
    BasicInitMenuWindow(&gWindowConfig_81E6E50);
    MenuDrawTextWindow(7, v0 + 4, 13, 11);
    PrintMenuItemsReordered(8, v0 + 5, gUnknown_0203924C, (const struct MenuAction *)gUnknown_083F7EF4, gUnknown_03000758);
    InitMenu(0, 8, v0 + 5, gUnknown_0203924C, 0, 5);
    gScriptItemId = gUnknown_02039248[0] + gUnknown_02039248[1];
    gTasks[taskId].func = sub_810C40C;
}

void sub_810C40C(u8 taskId)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (GetMenuCursorPos())
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(-1);
        }
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (GetMenuCursorPos() != gUnknown_0203924C - 1)
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(+1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gUnknown_083F7EF4[gUnknown_03000758[GetMenuCursorPos()]].func(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_810C748(taskId);
    }
}

void sub_8136130(struct Pokeblock *, MainCallback);

void sub_810C4C4(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_810C2B0();
        sub_8136130(&gSaveBlock1.pokeblocks[gScriptItemId], sub_810B96C);
        DestroyTask(taskId);
    }
}

void sub_810C508(u8 taskId)
{
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    gTasks[taskId].func = sub_810C4C4;
}

void sub_810C5EC(u8);

void sub_810C540(u8 taskId)
{
    BasicInitMenuWindow(&gWindowConfig_81E6E50);
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(7, 4, 13, 11);
    StringCopy(gStringVar1, gPokeblockNames[gSaveBlock1.pokeblocks[gUnknown_02039248[0] + gUnknown_02039248[1]].color]);
    StringExpandPlaceholders(gStringVar4, gContestStatsText_ThrowAwayPrompt);
    DisplayItemMessageOnField(taskId, gStringVar4, sub_810C5EC, 0);
}

void sub_810C5C0(u8 taskId)
{
    sub_80F979C(1, 1);
    gTasks[taskId].func = sub_810C540;
}

void sub_810C5EC(u8 taskId)
{
    DisplayYesNoMenu(7, 6, 1);
    DoYesNoFuncWithChoice(taskId, gUnknown_083F7F24);
}

void sub_810C704(u8);

void sub_810C610(u8 taskId)
{
    MenuZeroFillWindowRect(7, 6, 13, 11);
    sub_810CA6C((gUnknown_02039248[0] + gUnknown_02039248[1]));
    StringExpandPlaceholders(gStringVar4, gContestStatsText_WasThrownAway);
    DisplayItemMessageOnField(taskId, gStringVar4, sub_810C704, 0);
    sub_810BC98();
    sub_810BD08();
}

void sub_810C668(u8 taskId)
{
    StartVerticalScrollIndicators(0);
    StartVerticalScrollIndicators(1);
    if (gUnknown_02039248[2] > gUnknown_02039248[3] && gUnknown_02039248[1] + gUnknown_02039248[3] != gUnknown_02039248[2])
    {
        sub_80F979C(1, 0);
    }
    BasicInitMenuWindow(&gWindowConfig_81E6E50);
    MenuZeroFillWindowRect(7, 6, 13, 11);
    MenuZeroFillWindowRect(0, 14, 29, 19);
    gTasks[taskId].func = sub_810BF7C;
}

void sub_810C6DC(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        sub_810C668(taskId);
    }
}

void sub_810C704(u8 taskId)
{
    BasicInitMenuWindow(&gWindowConfig_81E6E34);
    sub_810BC84(gUnknown_02039248[1]);
    sub_80F979C(1, 1);
    gTasks[taskId].func = sub_810C6DC;
}

void sub_810C748(u8 taskId)
{
    StartVerticalScrollIndicators(0);
    StartVerticalScrollIndicators(1);
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(7, 4, 13, 11);
    gTasks[taskId].func = sub_810BF7C;
}

void sub_810C788(u8 taskId)
{
    s16 v0 = sub_810CAE4(GetNature(&gEnemyParty[0]), &gSaveBlock1.pokeblocks[gScriptItemId]);
    StringCopy(gBattleTextBuff1, gPokeblockNames[gSaveBlock1.pokeblocks[gScriptItemId].color]);
    sub_810CA6C(gScriptItemId);
    gScriptItemId = gSaveBlock1.pokeblocks[gScriptItemId].color << 8;
    if (v0 == 0)
    {
        gScriptItemId += 1;
    }
    if (v0 > 0)
    {
        gScriptItemId += 2;
    }
    if (v0 < 0)
    {
        gScriptItemId += 3;
    }
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    gTasks[taskId].func = sub_810C2C8;
}

void sub_810C854(u8 taskId)
{
    SafariZoneActivatePokeblockFeeder(gScriptItemId);
    StringCopy(gStringVar1, gPokeblockNames[gSaveBlock1.pokeblocks[gScriptItemId].color]);
    gScriptResult = gScriptItemId;
    sub_810CA6C(gScriptItemId);
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    gTasks[taskId].func = sub_810C2C8;
}

void sub_810C8D4(struct Sprite *sprite)
{
    if (sprite->data0 > 1)
    {
        sprite->data0 = 0;
    }
    switch (sprite->data0)
    {
        case 0:
            sprite->oam.affineMode = 1;
            sprite->affineAnims = gSpriteAffineAnimTable_83F7F70;
            InitSpriteAffineAnim(sprite);
            sprite->data0 = 1;
            sprite->data1 = 0;
            break;
        case 1:
            if (++sprite->data1 > 11)
            {
                sprite->oam.affineMode = 0;
                sprite->data0 = 0;
                sprite->data1 = 0;
                FreeOamMatrix(sprite->oam.matrixNum);
                sprite->callback = SpriteCallbackDummy;
            }
            break;
    }
}

void ClearPokeblock(u8 pokeblockIdx)
{
    gSaveBlock1.pokeblocks[pokeblockIdx].color  = 0;
    gSaveBlock1.pokeblocks[pokeblockIdx].spicy  = 0;
    gSaveBlock1.pokeblocks[pokeblockIdx].dry    = 0;
    gSaveBlock1.pokeblocks[pokeblockIdx].sweet  = 0;
    gSaveBlock1.pokeblocks[pokeblockIdx].bitter = 0;
    gSaveBlock1.pokeblocks[pokeblockIdx].sour   = 0;
    gSaveBlock1.pokeblocks[pokeblockIdx].feel   = 0;
}

void ClearPokeblocks(void)
{
    u8 pokeblockIdx;
    for (pokeblockIdx=0; pokeblockIdx<ARRAY_COUNT(gSaveBlock1.pokeblocks); pokeblockIdx++)
    {
        ClearPokeblock(pokeblockIdx);
    }
}

u8 sub_810C9B0(struct Pokeblock *pokeblock)
{
    u8 contestStat;
    u8 maxRating;
    u8 rating = sub_810CA9C(pokeblock, 1);
    for (contestStat=1; contestStat<5; contestStat++)
    {
        maxRating = sub_810CA9C(pokeblock, contestStat + 1);
        if (rating < maxRating)
        {
            rating = maxRating;
        }
    }
    return rating;
}

u8 sub_810C9E8(struct Pokeblock *pokeblock)
{
    u8 feel = sub_810CA9C(pokeblock, 6);
    if (feel > 99)
        feel = 99;
    return feel;
}

s8 sub_810CA00(void)
{
    u8 i;
    for (i=0; i<ARRAY_COUNT(gSaveBlock1.pokeblocks); i++)
    {
        if (gSaveBlock1.pokeblocks[i].color == 0)
        {
            return i;
        }
    }
    return -1;
}

bool8 sub_810CA34(struct Pokeblock *pokeblock)
{
    s8 idx = sub_810CA00();
    if (idx == -1)
    {
        return FALSE;
    }
    gSaveBlock1.pokeblocks[idx] = *pokeblock;
    return TRUE;
}

bool8 sub_810CA6C(u8 pokeblockIdx)
{
    if (gSaveBlock1.pokeblocks[pokeblockIdx].color == 0)
    {
        return FALSE;
    }
    ClearPokeblock(pokeblockIdx);
    return TRUE;
}

s16 sub_810CA9C(const struct Pokeblock *pokeblock, u8 field)
{
    if (field == 0)
        return pokeblock->color;
    if (field == 1)
        return pokeblock->spicy;
    if (field == 2)
        return pokeblock->dry;
    if (field == 3)
        return pokeblock->sweet;
    if (field == 4)
        return pokeblock->bitter;
    if (field == 5)
        return pokeblock->sour;
    if (field == 6)
        return pokeblock->feel;
    return 0;
}

s16 sub_810CAE4(u8 nature, const struct Pokeblock *pokeblock)
{
    u8 flavor;
    s16 curGain;
    s16 totalGain = 0;
    for (flavor=0; flavor<5; flavor++)
    {
        curGain = sub_810CA9C(pokeblock, flavor + 1);
        if (curGain > 0)
        {
            totalGain += curGain * gPokeblockFlavorCompatibilityTable[5 * nature + flavor];
        }
    }
    return totalGain;
}

void sub_810CB44(struct Pokeblock *pokeblock, u8 *dest)
{
    u8 color = sub_810CA9C(pokeblock, 0);
    StringCopy(dest, gPokeblockNames[color]);
}

bool8 sub_810CB68(u8 nature, u8 *dest)
{
    u8 flavor;
    for (flavor=0; flavor<5; flavor++)
    {
        if (sub_810CAE4(nature, &gUnknown_083F7F9C[flavor]) > 0)
        {
            StringCopy(dest, gPokeblockNames[flavor + 1]);
            return TRUE;
        }
    }
    return FALSE;
}
