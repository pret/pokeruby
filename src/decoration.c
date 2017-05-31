#include "global.h"
#include "asm.h"
#include "sound.h"
#include "songs.h"
#include "string_util.h"
#include "menu.h"
#include "strings.h"
#include "script.h"
#include "palette.h"
#include "decoration.h"

void sub_80FE1DC(void)
{
    sub_80FE2B4();
    MenuDrawTextWindow(0, 0, 10, 9);
    PrintMenuItems(1, 1, 4, (const struct MenuAction *)gUnknown_083EC604);
    InitMenu(0, 1, 1, 4, gUnknown_020388D4, 9);
}

void sub_80FE220(void)
{
    gUnknown_020388D4 = 0;
    ScriptContext2_Enable();
    sub_80FE1DC();
    sub_80FE394();
}

void DecorationPC(u8 taskId)
{
    sub_80FE220();
    gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
}

void Task_SecretBasePC_Decoration(u8 taskId)
{
    DecorationPC(taskId);
    ewram_1f000.items = gSaveBlock1.secretBases[0].decorations;
    ewram_1f000.pos = gSaveBlock1.secretBases[0].decorationPos;
    ewram_1f000.size = sizeof gSaveBlock1.secretBases[0].decorations;
    ewram_1f000.isPlayerRoom = 0;
}

void DoPlayerPCDecoration(u8 taskId)
{
    DecorationPC(taskId);
    ewram_1f000.items = gSaveBlock1.playerRoomDecor;
    ewram_1f000.pos = gSaveBlock1.playerRoomDecorPos;
    ewram_1f000.size = sizeof gSaveBlock1.playerRoomDecor;
    ewram_1f000.isPlayerRoom = 1;
}

void sub_80FE2B4(void)
{
    u16 palettes[3];
    memcpy(palettes, gUnknown_083EC654, sizeof gUnknown_083EC654);
    LoadPalette(&palettes[2], 0xdf, 2);
    LoadPalette(&palettes[1], 0xd1, 2);
    LoadPalette(&palettes[0], 0xd8, 2);
}

void Task_DecorationPCProcessMenuInput(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388D4 = MoveMenuCursor(-1);
            sub_80FE394();
        }
        if (gMain.newKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388D4 = MoveMenuCursor(1);
            sub_80FE394();
        }
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gUnknown_083EC604[gUnknown_020388D4].func(taskId);
        } else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            gpu_pal_decompress_alloc_tag_and_upload(taskId);
        }
    }
}

void sub_80FE394(void)
{
    MenuFillWindowRectWithBlankTile(2, 15, 27, 18);
    MenuPrint(gUnknown_083EC624[gUnknown_020388D4], 2, 15);
}

void gpu_pal_decompress_alloc_tag_and_upload(u8 taskId)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 10, 9);
    MenuFillWindowRectWithBlankTile(2, 15, 27, 18);
    FreeSpritePaletteByTag(6);
    if (ewram_1f000.isPlayerRoom == 0)
    {
        ScriptContext1_SetupScript(gUnknown_0815F399);
        DestroyTask(taskId);
    } else
    {
        ReshowPlayerPC(taskId);
    }
}

void sub_80FE418(u8 taskId)
{
    sub_80FE5AC(taskId);
}

void sub_80FE428(u8 taskId)
{
    InitMenu(0, 1, 1, 4, gUnknown_020388D4, 9);
    sub_80FE394();
    gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
}

void sub_80FE470(u8 decoCat, u8 a1, u8 a2, u8 palIdx)
{
    u8 *strptr;
    u8 v0;
    v0 = sub_8072CBC();
    // PALETTE {palIdx}
    strptr = gStringVar4;
    strptr[0] = EXT_CTRL_CODE_BEGIN;
    strptr[1] = 5;
    strptr[2] = palIdx;
    strptr += 3;
    strptr = StringCopy(strptr, gUnknown_083EC5E4[decoCat]);
    strptr = sub_8072C14(strptr, sub_8134194(decoCat), 0x56, 1);
    *strptr++ = 0xba;
    strptr = sub_8072C14(strptr, gDecorationInventories[decoCat].size, 0x68, 1);
    strptr[0] = EXT_CTRL_CODE_BEGIN;
    strptr[1] = 5;
    strptr[2] = v0;
    strptr[3] = EOS;
    MenuPrint(gStringVar4, a1, a2);
}

void sub_80FE528(u8 taskId)
{
    u8 decoCat;
    MenuDrawTextWindow(0, 0, 14, 19);
    for (decoCat=0; decoCat<8; decoCat++)
    {
        if (ewram_1f000.isPlayerRoom == 1 && gTasks[taskId].data[11] == 0 && decoCat != DECOCAT_DOLL && decoCat != DECOCAT_CUSHION)
        {
            sub_80FE470(decoCat, 1, 2 * decoCat + 1, 13);
        } else
        {
            sub_80FE470(decoCat, 1, 2 * decoCat + 1, 255);
        }
    }
    MenuPrint(gUnknownText_Exit, 1, 17);
}

void sub_80FE5AC(u8 taskId)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_80FE528(taskId);
    InitMenu(0, 1, 1, 9, gUnknown_020388F6, 13);
    gTasks[taskId].func = sub_80FE604;
}

void sub_80FE604(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if (gMain.newAndRepeatedKeys & DPAD_UP)
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(-1);
        } else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            PlaySE(SE_SELECT);
            MoveMenuCursor(1);
        } else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gUnknown_020388F6 = GetMenuCursorPos();
            if (gUnknown_020388F6 != 8)
            {
                gUnknown_020388D5 = sub_8134194(gUnknown_020388F6);
                if (gUnknown_020388D5)
                {
                    sub_8134104(gUnknown_020388F6);
                    gUnknown_020388D0 = gDecorationInventories[gUnknown_020388F6].items;
                    sub_80FEF50(taskId);
                    sub_80F944C();
                    sub_80F9480(gUnknown_020388F7, 8);
                    LoadScrollIndicatorPalette();
                    gTasks[taskId].func = sub_80FE868;
                } else
                {
                    sub_8072DEC();
                    MenuZeroFillWindowRect(0, 0, 14, 19);
                    DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE418, 0);
                }
            } else
            {
                sub_80FE728(taskId);
            }
        } else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_80FE728(taskId);
        }
    }
}

void sub_80FE728(u8 taskId)
{
    if (gTasks[taskId].data[11] != 3)
    {
        sub_80FE758(taskId);
    } else
    {
        sub_8109DAC(taskId);
    }
}

void sub_80FE758(u8 taskId)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 14, 19);
    if (gTasks[taskId].data[11] != 2)
    {
        sub_80FE1DC();
        MenuDisplayMessageBox();
        sub_80FE394();
        gTasks[taskId].func = Task_DecorationPCProcessMenuInput;
    } else
    {
        sub_80B3068(taskId);
    }
}

void sub_80FE7A8(u8 taskId)
{
    gTasks[taskId].data[11] = 3;
    gUnknown_020388F6 = 0;
    sub_80FE5AC(taskId);
}

void sub_80FE7D4(u8 *dest, u8 decClass)
{
    StringCopy(dest, gUnknown_083EC5E4[decClass]);
}

void sub_80FE7EC(u8 taskId)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 29, 19);

    sub_80FEC94(taskId);
    sub_80FECB8(gUnknown_020388F6);

    MenuDrawTextWindow(15, 12, 29, 19);

    sub_80FECE0(gUnknown_020388F2 + gUnknown_020388F4);
    InitMenu(0, 1, 2, gUnknown_020388F3 + 1, gUnknown_020388F2, 13);
}

void sub_80FE868(u8 taskId)
{
    sub_80FE7EC(taskId);
    gTasks[taskId].func = sub_80FE948;
}

void sub_80FE894(u8 taskId /*r8*/, s8 cursorVector /*r5*/, s8 bgVector /*r7*/)
{
    int v0 /*r10*/;
    u8 v1;
    v0 = gUnknown_020388F2 + gUnknown_020388F4 == gUnknown_020388D5;
    PlaySE(SE_SELECT);
    if (cursorVector != 0)
    {
        gUnknown_020388F2 = MoveMenuCursor(cursorVector);
    }
    if (bgVector != 0)
    {
        v1 = gUnknown_020388F4;
        gUnknown_020388F4 = v1 + bgVector;
        sub_80FEABC(taskId, 1);
    }
    if (gUnknown_020388F2 + gUnknown_020388F4 != gUnknown_020388D5)
    {
        if (v0)
        {
            MenuDrawTextWindow(15, 12, 29, 19);
        }
        sub_80FECE0(gUnknown_020388F2 + gUnknown_020388F4);
    } else
    {
        MenuZeroFillWindowRect(15, 12, 29, 19);
    }
}

void sub_80FE948(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_UP)
        {
            if (gUnknown_020388F2 != 0)
            {
                sub_80FE894(taskId, -1, 0);
            } else if (gUnknown_020388F4 != 0)
            {
                sub_80FE894(taskId, 0, -1);
            }
        }
        if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_DOWN)
        {
            if (gUnknown_020388F2 != gUnknown_020388F3)
            {
                sub_80FE894(taskId, 1, 0);
            } else if (gUnknown_020388F4 + gUnknown_020388F2 != gUnknown_020388D5)
            {
                sub_80FE894(taskId, 0, 1);
            }
        }
        if (gMain.newKeys & A_BUTTON)
        {
            sub_8072DEC();
            PlaySE(SE_SELECT);
            gUnknown_020388F5 = gUnknown_020388F2 + gUnknown_020388F4;
            if (gUnknown_020388F5 == gUnknown_020388D5)
            {
                gUnknown_083EC634[gTasks[taskId].data[11]].func2(taskId);
            } else
            {
                gUnknown_083EC634[gTasks[taskId].data[11]].func1(taskId);
            }
        } else if (gMain.newKeys & B_BUTTON)
        {
            sub_8072DEC();
            PlaySE(SE_SELECT);
            gUnknown_083EC634[gTasks[taskId].data[11]].func2(taskId);
        }
    }
}
