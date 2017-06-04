#include "global.h"
#include "asm.h"
#include "rom4.h"
#include "sound.h"
#include "songs.h"
#include "string_util.h"
#include "menu.h"
#include "menu_helpers.h"
#include "strings.h"
#include "script.h"
#include "palette.h"
#include "field_player_avatar.h"
#include "field_camera.h"
#include "fieldmap.h"
#include "metatile_behavior.h"
#include "event_data.h"
#include "field_weather.h"
#include "decoration.h"

extern Script gUnknown_0815F399;

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

void sub_80FEABC(u8 taskId, u8 dummy1)
{
    u16 i;
    u16 j;
    u8 ni;
    if (gUnknown_020388F4 != 0 || (DestroyVerticalScrollIndicator(0), gUnknown_020388F4 != 0))
    {
        CreateVerticalScrollIndicators(0, 0x3c, 0x08);
    }
    if (gUnknown_020388F4 + 7 == gUnknown_020388D5)
    {
        DestroyVerticalScrollIndicator(1);
    }
    if (gUnknown_020388F4 + 7 < gUnknown_020388D5)
    {
        CreateVerticalScrollIndicators(1, 0x3c, 0x98);
    }
    for (i=gUnknown_020388F4; i<gUnknown_020388F4+8; i++)
    {
        ni = 2 * (i - gUnknown_020388F4) + 2;
        if (gUnknown_020388F7[i - gUnknown_020388F4])
        {
            sub_80F94F8(&gUnknown_020388F7[i - gUnknown_020388F4]);
        }
        if (i == gUnknown_020388D5)
        {
            sub_8072A18(gUnknownText_Exit, 0x08, 8 * ni, 0x68, 1);
            break;
        }
        if (gUnknown_020388D0[i])
        {
            if (ewram_1f000.isPlayerRoom == 1 && gUnknown_020388F6 != DECOCAT_DOLL && gUnknown_020388F6 != DECOCAT_CUSHION && gTasks[taskId].data[11] == 0)
            {
                StringCopy(gStringVar1, gDecorations[gUnknown_020388D0[i]].name);
                sub_8072A18(gUnknown_083EC65A, 0x08, 8 * ni, 0x68, 1);
            } else
            {
                sub_8072A18(gDecorations[gUnknown_020388D0[i]].name, 0x08, 8 * ni, 0x68, 1);
            }
            for (j=0; j<16; j++)
            {
                if (gUnknown_020388D6[j] - 1 == i)
                {
                    sub_80F94A4(4, &gUnknown_020388F7[i - gUnknown_020388F4], 0x6c, (i - gUnknown_020388F4) * 16 + 24);
                    break;
                }
            }
            for (j=0; j<12; j++)
            {
                if (gUnknown_020388E6[j] - 1 == i)
                {
                    sub_80F94A4(5, &gUnknown_020388F7[i - gUnknown_020388F4], 0x6c, (i - gUnknown_020388F4) * 16 + 24);
                    break;
                }
            }
        }
    }
}

void sub_80FEC94(u8 taskId)
{
    MenuDrawTextWindow(0, 0, 14, 19);
    sub_80FEABC(taskId, 0);
}

void sub_80FECB8(u8 decoCat)
{
    MenuDrawTextWindow(15, 0, 29, 3);
    sub_80FE470(decoCat, 16, 1, 0xff);
}

void sub_80FECE0(u8 decoCat)
{
    sub_8072AB0(gDecorations[gUnknown_020388D0[decoCat]].description, 0x80, 0x68, 0x68, 0x30, 0x1);
}

void sub_80FED1C(void)
{
    MenuZeroFillWindowRect(15, 0, 29, 3);
    MenuZeroFillWindowRect(15, 12, 29, 19);
}

void sub_80FED3C(u8 taskId)
{
    LoadScrollIndicatorPalette();
    gTasks[taskId].func = sub_80FE868;
}

bool8 sub_80FED64(u8 a0)
{
    u8 i;
    for (i=0; i<16; i++)
    {
        if (gUnknown_020388D6[i] == a0)
        {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80FED90(u8 taskId)
{
    u16 i;
    u16 j;
    u16 k;
    u16 cnt;
    cnt = 0;
    for (i=0; i<16; i++)
    {
        gUnknown_020388D6[i] = 0;
        if (i < 12)
        {
            gUnknown_020388E6[i] = 0;
        }
    }
    for (i=0; i<16; i++)
    {
        if (gSaveBlock1.secretBases[0].decorations[i] != 0)
        {
            for (j=0; j<gDecorationInventories[gUnknown_020388F6].size; j++)
            {
                if (gUnknown_020388D0[j] == gSaveBlock1.secretBases[0].decorations[i])
                {
                    for (k=0; k<cnt && gUnknown_020388D6[k]!=j+1; k++);
                    if (k == cnt)
                    {
                        gUnknown_020388D6[cnt] = j+1;
                        cnt++;
                        break;
                    }
                }
            }
        }
    }
    cnt = 0;
    for (i=0; i<12; i++)
    {
        if (gSaveBlock1.playerRoomDecor[i] != 0)
        {
            for (j=0; j<gDecorationInventories[gUnknown_020388F6].size; j++)
            {
                if (gUnknown_020388D0[j] == gSaveBlock1.playerRoomDecor[i] && !sub_80FED64(j + 1))
                {
                    for (k=0; k<cnt && gUnknown_020388E6[k]!=j+1; k++);
                    if (k == cnt)
                    {
                        gUnknown_020388E6[cnt] = j+1;
                        cnt++;
                        break;
                    }
                }
            }
        }
    }
}

void sub_80FEF28(void)
{
    if (gUnknown_020388D5 <= 7)
    {
        gUnknown_020388F3 = gUnknown_020388D5;
    } else
    {
        gUnknown_020388F3 = 7;
    }
}

void sub_80FEF50(u8 taskId)
{
    sub_80FED90(taskId);
    sub_80FEF28();
    gUnknown_020388F2 = 0;
    gUnknown_020388F4 = 0;
}

void sub_80FEF74(void)
{
    sub_80F9520(gUnknown_020388F7, 8);
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 14, 19);
}

bool8 sub_80FEFA4(void)
{
    u16 i;
    int v0;
    for (i=0; i<16; i++)
    {
        v0 = gUnknown_020388F4 + gUnknown_020388F2 + 1;
        if (gUnknown_020388D6[i] == v0 || (i < 12 && gUnknown_020388E6[i] == v0))
        {
            return FALSE;
        }
    }
    return TRUE;
}

void sub_80FEFF4(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        LoadScrollIndicatorPalette();
        gTasks[taskId].func = sub_80FE868;
    }
}

void sub_80FF034(u8 taskId)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(0, 0, 14, 19);
    sub_80FE5AC(taskId);
}

void sub_80FF058(u8 taskId)
{
    sub_80F9520(gUnknown_020388F7, 8);
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    BuyMenuFreeMemory();
    gTasks[taskId].func = sub_80FF034;
}

void sub_80FF098(u8 taskId)
{
    gUnknown_020388D5--;
    if (gUnknown_020388F4 + 7 > gUnknown_020388D5 && gUnknown_020388F4 != 0)
    {
        gUnknown_020388F4--;
    }
    sub_8134104(gUnknown_020388F6);
    sub_80FED90(taskId);
    sub_80FEF28();
}

void sub_80FF0E0(u8 taskId)
{
    gTasks[taskId].data[3] = gSaveBlock1.pos.x;
    gTasks[taskId].data[4] = gSaveBlock1.pos.y;
    PlayerGetDestCoords(&gTasks[taskId].data[0], &gTasks[taskId].data[1]);
}

void sub_80FF114(u8 taskId)
{
    DrawWholeMapView();
    warp1_set(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, -1, gTasks[taskId].data[3], gTasks[taskId].data[4]);
    warp_in();
}
void sub_80FF160(u8 taskId)
{
    if (!sub_81341D4())
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_NoDecors, sub_80FE428, 0);
    } else
    {
        gTasks[taskId].data[11] = 0;
        gUnknown_020388F6 = 0;
        sub_80FE5AC(taskId);
    }
}

u16 sub_80FF1B0(u8 decoId, u8 a1)
{
    u16 retval;
    retval = 0xffff;

    switch (decoId)
    {
        case DECOR_STAND:
            retval = gUnknown_083EC97C[a1] << 12;
            return retval;
        case DECOR_SLIDE:
            retval = gUnknown_083EC984[a1] << 12;
            return retval;
        default:
            return retval;
    }
}

void sub_80FF1EC(u16 mapX, u16 mapY, u8 decWidth, u8 decHeight, u16 decIdx)
{
    u16 i;
    u16 j; // r10
    u16 behavior;
    u16 flags; // r8
    u16 v0;
    u16 v1;
    s16 x;
    s16 decBottom;

    for (i=0; i<decHeight; i++)
    {
        decBottom = mapY - decHeight + 1 + i;
        for (j=0; j<decWidth; j++)
        {
            x = mapX + j;
            behavior = GetBehaviorByMetatileId(0x200 + gDecorations[decIdx].tiles[i * decWidth + j]);
            if (sub_8057288(behavior) == 1 || (gDecorations[decIdx].decor_field_11 != 1 && (behavior >> 12)))
            {
                flags = 0xc00;
            } else
            {
                flags = 0x000;
            }
            if (gDecorations[decIdx].decor_field_11 != 3 && sub_80572B0(MapGridGetMetatileBehaviorAt(x, decBottom)) == 1)
            {
                v0 = 1;
            } else
            {
                v0 = 0;
            }
            v1 = sub_80FF1B0(gDecorations[decIdx].id, i * decWidth + j);
            if (v1 != 0xffff)
            {
                MapGridSetMetatileEntryAt(x, decBottom, (gDecorations[decIdx].tiles[i * decWidth + j] + (0x200 | v0)) | flags | v1);
            } else
            {
                MapGridSetMetatileIdAt(x, decBottom, (gDecorations[decIdx].tiles[i * decWidth + j] + (0x200 | v0)) | flags);
            }
        }
    }
}

void sub_80FF394(u16 mapX, u16 mapY, u16 decIdx)
{
    switch (gDecorations[decIdx].decor_field_12)
    {
        case 0:
            sub_80FF1EC(mapX, mapY, 1, 1, decIdx);
            break;
        case 1:
            sub_80FF1EC(mapX, mapY, 2, 1, decIdx);
            break;
        case 2:
            sub_80FF1EC(mapX, mapY, 3, 1, decIdx);
            break;
        case 3:
            sub_80FF1EC(mapX, mapY, 4, 2, decIdx);
            break;
        case 4:
            sub_80FF1EC(mapX, mapY, 2, 2, decIdx);
            break;
        case 5:
            sub_80FF1EC(mapX, mapY, 1, 2, decIdx);
            break;
        case 6:
            sub_80FF1EC(mapX, mapY, 1, 3, decIdx);
            break;
        case 7:
            sub_80FF1EC(mapX, mapY, 2, 4, decIdx);
            break;
        case 8:
            sub_80FF1EC(mapX, mapY, 3, 3, decIdx);
            break;
        case 9:
            sub_80FF1EC(mapX, mapY, 3, 2, decIdx);
            break;
    }
}

void sub_80FF474(void)
{
    u8 i;
    u8 j;
    for (i=0; i<14; i++)
    {
        if (FlagGet(i + 0xae) == 1)
        {
            FlagReset(i + 0xae);
            for (j=0; j<gMapHeader.events->mapObjectCount; j++)
            {
                if (gMapHeader.events->mapObjects[j].flagId == i + 0xae)
                {
                    break;
                }
            }
            VarSet(0x3f20 + gMapHeader.events->mapObjects[j].graphicsId, gUnknown_02038900.decoration->tiles[0]);
            gSpecialVar_0x8005 = gMapHeader.events->mapObjects[j].localId;
            gSpecialVar_0x8006 = gUnknown_020391A4;
            gSpecialVar_0x8007 = gUnknown_020391A6;
            show_sprite(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
            sub_805C0F8(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, gSpecialVar_0x8006, gSpecialVar_0x8007);
            sub_805C78C(gSpecialVar_0x8005, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
            break;
        }
    }
}

bool8 sub_80FF58C/*IsThereRoomForMoreDecorations*/(void)
{
    u16 i;
    for (i=0; i<ewram_1f000.size; i++)
    {
        if (ewram_1f000.items[i] == 0)
        {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80FF5BC(u8 taskId)
{
    if (ewram_1f000.isPlayerRoom == 1 && gUnknown_020388F6 != DECOCAT_DOLL && gUnknown_020388F6 != DECOCAT_CUSHION)
    {
        sub_80FEF74();
        sub_80FED1C();
        DisplayItemMessageOnField(taskId, gSecretBaseText_DecorCantPlace, sub_80FEFF4, 0);
    } else if (sub_80FEFA4() == TRUE)
    {
        if (sub_80FF58C() == TRUE)
        {
            fade_screen(1, 0);
            gTasks[taskId].data[2] = 0;
            gTasks[taskId].func = sub_80FF6AC;
        } else
        {
            sub_80FEF74();
            sub_80FED1C();
            ConvertIntToDecimalStringN(gStringVar1, ewram_1f000.size, STR_CONV_MODE_RIGHT_ALIGN, 2);
            if (!ewram_1f000.isPlayerRoom)
            {
                StringExpandPlaceholders(gStringVar4, gSecretBaseText_NoMoreDecor);
            } else
            {
                StringExpandPlaceholders(gStringVar4, gSecretBaseText_NoMoreDecor2);
            }
            DisplayItemMessageOnField(taskId, gStringVar4, sub_80FEFF4, 0);
        }
    } else
    {
        sub_80FEF74();
        sub_80FED1C();
        DisplayItemMessageOnField(taskId, gSecretBaseText_InUseAlready, sub_80FEFF4, 0);
    }
}

void sub_80FF6AC(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            if (!gPaletteFade.active)
            {
                sub_80FF0E0(taskId);
                DestroyVerticalScrollIndicator(0);
                DestroyVerticalScrollIndicator(1);
                sub_80F9520(gUnknown_020388F7, 8);
                BuyMenuFreeMemory();
                gTasks[taskId].data[2] = 1;
            }
            break;
        case 1:
            gPaletteFade.bufferTransferDisabled = 1;
            AddDecorationIconObjectFromFieldObject(&gUnknown_02038900, gUnknown_020388D0[gUnknown_020388F5]);
            sub_80FF960(taskId);
            SetUpPlacingDecorationPlayerAvatar(taskId, &gUnknown_02038900);
            pal_fill_black();
            gPaletteFade.bufferTransferDisabled = 0;
            gTasks[taskId].data[2] = 2;
            break;
        case 2:
            if (sub_807D770() == 1)
            {
                gTasks[taskId].data[12] = 0;
                sub_810065C(taskId);
            }
            break;
    }
}

void AddDecorationIconObjectFromFieldObject(struct UnkStruct_02038900 * unk_02038900, u8 decoIdx)
{
    sub_80FEF74();
    sub_80FED1C();
    sub_81006D0(unk_02038900);
    unk_02038900->decoration = &gDecorations[decoIdx];
    if (gDecorations[decoIdx].decor_field_11 != 4)
    {
        sub_81008BC(unk_02038900);
        sub_8100930(unk_02038900->decoration->decor_field_12);
        sub_8100874(unk_02038900);
        sub_810070C(unk_02038900->unk_884, ((u16 *)gMapHeader.mapData->secondaryTileset->metatiles + 8 * unk_02038900->decoration->tiles[0])[7] >> 12);
        LoadSpritePalette(&gUnknown_083EC954);
        gUnknown_020391A8 = gSprites[gUnknown_03004880.unk4].data0;
        gUnknown_03004880.unk4 = CreateSprite(&gSpriteTemplate_83EC93C, gUnknown_083EC900[unk_02038900->decoration->decor_field_12].unk_2,  gUnknown_083EC900[unk_02038900->decoration->decor_field_12].unk_3, 0);
    } else
    {
        gUnknown_020391A8 = gSprites[gUnknown_03004880.unk4].data0;
        gUnknown_03004880.unk4 = AddPseudoFieldObject(unk_02038900->decoration->tiles[0], sub_81009A8, gUnknown_083EC900[unk_02038900->decoration->decor_field_12].unk_2,  gUnknown_083EC900[unk_02038900->decoration->decor_field_12].unk_3, 1);
        gSprites[gUnknown_03004880.unk4].oam.priority = 1;
    }
}

void SetUpPlacingDecorationPlayerAvatar(u8 taskId, struct UnkStruct_02038900 *unk_02038900)
{
    u8 v0;
    v0 = 16 * (u8)gTasks[taskId].data[5] + gUnknown_083EC900[unk_02038900->decoration->decor_field_12].unk_2 - 8 * ((u8)gTasks[taskId].data[5] - 1);
    if (unk_02038900->decoration->decor_field_12 == 2 || unk_02038900->decoration->decor_field_12 == 8 || unk_02038900->decoration->decor_field_12 == 9)
    {
        v0 -= 8;
    }
    if (gSaveBlock2.playerGender == MALE)
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc1, SpriteCallbackDummy, v0, 0x48, 0);
    } else
    {
        gUnknown_020391A9 = AddPseudoFieldObject(0xc2, SpriteCallbackDummy, v0, 0x48, 0);
    }
    gSprites[gUnknown_020391A9].oam.priority = 1;
    DestroySprite(&gSprites[gUnknown_020391A8]);
    gUnknown_020391A8 = gUnknown_03004880.unk4;
}

void sub_80FF960(u8 taskId)
{
    switch (gDecorations[gUnknown_020388D0[gUnknown_020388F5]].decor_field_12)
    {
        case 0:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 1;
            break;
        case 1:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 1;
            break;
        case 2:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 1;
            break;
        case 3:
            gTasks[taskId].data[5] = 4;
            gTasks[taskId].data[6] = 2;
            break;
        case 4:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 2;
            break;
        case 5:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 2;
            break;
        case 6:
            gTasks[taskId].data[5] = 1;
            gTasks[taskId].data[6] = 3;
            gTasks[taskId].data[1]++;
            break;
        case 7:
            gTasks[taskId].data[5] = 2;
            gTasks[taskId].data[6] = 4;
            break;
        case 8:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 3;
            break;
        case 9:
            gTasks[taskId].data[5] = 3;
            gTasks[taskId].data[6] = 2;
            break;
    }
}

void sub_80FFAB0(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    gSprites[gUnknown_020391A8].data7 = 1;
    gSprites[gUnknown_020391A9].data7 = 1;
    sub_810045C();
    sub_8100038(taskId);
}

void sub_80FFB08(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    gSprites[gUnknown_020391A8].data7 = 1;
    gSprites[gUnknown_020391A9].data7 = 1;
    sub_810045C();
    DisplayItemMessageOnField(taskId, gSecretBaseText_CancelDecorating, sub_8100248, 0);
}

bool8 sub_80FFB6C(u8 a0, u16 a1)
{
    if (sub_8057274(a0) != 1 || a1 != 0)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 sub_80FFB94(u8 taskId, s16 x, s16 y, u16 decoId)
{
    if (x == gTasks[taskId].data[3] + 7 && y == gTasks[taskId].data[4] + 7 && decoId != 0)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 sub_80FFBDC(u16 a0, struct Decoration *decoration)
{
    if (sub_8057274(a0) != 1)
    {
        if (decoration->id == DECOR_SOLID_BOARD && sub_8057300(a0) == 1)
        {
            return TRUE;
        }
        if (sub_805729C(a0))
        {
            return TRUE;
        }
    }
    return FALSE;
}

#ifdef NONMATCHING
bool8 sub_80FFC24(u8 taskId, struct Decoration *decoration)
{
    u8 i;
    u8 j;
    u8 behaviorAt;
    u16 behaviorBy;
    u8 fieldObjectId;
    u8 mapY;
    u8 mapX;
    s16 curY;
    s16 curX;
    mapY = gTasks[taskId].data[6];
    mapX = gTasks[taskId].data[5];
    switch (decoration->decor_field_11)
    {
        case 0:
        case 1:
            for (i=0; i<mapY; i++)
            {
                curY = gTasks[taskId].data[1] - i;
                for (j=0; j<mapX; j++)
                {
                    curX = gTasks[taskId].data[0] + j;
                    behaviorAt = MapGridGetMetatileBehaviorAt(curX, curY);
                    behaviorBy = 0xf000 & GetBehaviorByMetatileId(0x200 + decoration->tiles[(mapY - 1 - i) * mapX + j]);
                    if (!sub_80FFBDC(behaviorAt, decoration))
                    {
                        return FALSE;
                    }
                    if (!sub_80FFB94(taskId, curX, curY, behaviorBy))
                    {
                        return FALSE;
                    }
                    fieldObjectId = GetFieldObjectIdByXYZ(curX, curY, 0);
                    if (fieldObjectId != 0 && fieldObjectId != 16)
                    {
                        return FALSE;
                    }
                }
            }
            break;
        case 2:
            for (i=0; i<mapY-1; i++)
            {
                curY = gTasks[taskId].data[1] - i;
                for (j=0; j<mapX; j++)
                {
                    curX = gTasks[taskId].data[0] + j;
                    behaviorAt = MapGridGetMetatileBehaviorAt(curX, curY);
                    behaviorBy = 0xf000 & GetBehaviorByMetatileId(0x200 + decoration->tiles[(mapY - i) * mapX + j]);
                    if (!sub_805729C(behaviorAt) && !sub_80FFB6C(behaviorAt, behaviorBy))
                    {
                        return FALSE;
                    }
                    if (!sub_80FFB94(taskId, curX, curY, behaviorBy))
                    {
                        return FALSE;
                    }
                    fieldObjectId = GetFieldObjectIdByXYZ(curX, curY, 0);
                    if (fieldObjectId != 16)
                    {
                        return FALSE;
                    }
                }
            }
            curY = gTasks[taskId].data[1] - mapY + 1;
            for (j=0; j<mapX; j++)
            {
                curX = gTasks[taskId].data[0] + j;
                behaviorAt = MapGridGetMetatileBehaviorAt(curX, curY);
                behaviorBy = 0xf000 & GetBehaviorByMetatileId(0x200 + decoration->tiles[j]);
                if (!sub_805729C(behaviorAt) && !sub_80572B0(behaviorAt))
                {
                    return FALSE;
                }
                if (!sub_80FFB94(taskId, curX, curY, behaviorBy))
                {
                    return FALSE;
                }
                fieldObjectId = GetFieldObjectIdByXYZ(curX, curY, 0);
                if (fieldObjectId != 0 && fieldObjectId != 16)
                {
                    return FALSE;
                }
            }
            break;
        case 3:
            for (i=0; i<mapY; i++)
            {
                curY = gTasks[taskId].data[1] - i;
                for (j=0; j<mapX; j++)
                {
                    curX = gTasks[taskId].data[0] + j;
                    if (!sub_80572B0(MapGridGetMetatileBehaviorAt(curX, curY)) || MapGridGetMetatileIdAt(curX, curY) == 0x28c)
                    {
                        return FALSE;
                    }
                }
            }
            break;
        case 4:
            curY = gTasks[taskId].data[1];
            for (j=0; j<mapX; j++)
            {
                curX = gTasks[taskId].data[0] + j;
                behaviorAt = MapGridGetMetatileBehaviorAt(curX, curY);
                if (decoration->decor_field_12 == 5)
                {
                    if (!sub_80572EC(behaviorAt))
                    {
                        return FALSE;
                    }
                }
                else if (!sub_80572D8(behaviorAt))
                {
                    if (!sub_80572EC(behaviorAt))
                    {
                        return FALSE;
                    }
                }
                fieldObjectId = GetFieldObjectIdByXYZ(curX, curY, 0);
                if (fieldObjectId != 16)
                {
                    return FALSE;
                }
            }
            break;
    }
    return TRUE;
}
#else
__attribute__((naked))
bool8 sub_80FFC24(u8 taskId, struct Decoration *decoration)
{
    asm(".syntax unified\n"
    "\tpush {r4-r7,lr}\n"
    "\tmov r7, r10\n"
    "\tmov r6, r9\n"
    "\tmov r5, r8\n"
    "\tpush {r5-r7}\n"
    "\tsub sp, 0x24\n"
    "\tstr r1, [sp]\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tmov r10, r0\n"
    "\tldr r1, _080FFC60 @ =gTasks\n"
    "\tlsls r0, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r1\n"
    "\tldrb r2, [r0, 0x14]\n"
    "\tstr r2, [sp, 0x4]\n"
    "\tldrb r0, [r0, 0x12]\n"
    "\tstr r0, [sp, 0x8]\n"
    "\tldr r3, [sp]\n"
    "\tldrb r0, [r3, 0x11]\n"
    "\tadds r2, r1, 0\n"
    "\tcmp r0, 0x4\n"
    "\tbls _080FFC56\n"
    "\tb _08100024\n"
    "_080FFC56:\n"
    "\tlsls r0, 2\n"
    "\tldr r1, _080FFC64 @ =_080FFC68\n"
    "\tadds r0, r1\n"
    "\tldr r0, [r0]\n"
    "\tmov pc, r0\n"
    "\t.align 2, 0\n"
    "_080FFC60: .4byte gTasks\n"
    "_080FFC64: .4byte _080FFC68\n"
    "\t.align 2, 0\n"
    "_080FFC68:\n"
    "\t.4byte _080FFC7C\n"
    "\t.4byte _080FFC7C\n"
    "\t.4byte _080FFD68\n"
    "\t.4byte _080FFF1C\n"
    "\t.4byte _080FFFA0\n"
    "_080FFC7C:\n"
    "\tmovs r6, 0\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFC86\n"
    "\tb _08100024\n"
    "_080FFC86:\n"
    "\tmov r1, r10\n"
    "\tlsls r1, 2\n"
    "\tstr r1, [sp, 0x1C]\n"
    "_080FFC8C:\n"
    "\tmov r2, r10\n"
    "\tlsls r0, r2, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r3, _080FFD64 @ =gTasks\n"
    "\tadds r0, r3\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tadds r6, 0x1\n"
    "\tstr r6, [sp, 0x14]\n"
    "\tldr r0, [sp, 0x8]\n"
    "\tcmp r7, r0\n"
    "\tbcs _080FFD56\n"
    "\tmov r1, r9\n"
    "\tlsls r1, 16\n"
    "\tstr r1, [sp, 0xC]\n"
    "\tasrs r1, 16\n"
    "\tmov r9, r1\n"
    "_080FFCB8:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r2, _080FFD64 @ =gTasks\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tadds r0, r6, 0\n"
    "\tmov r1, r9\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp, 0x4]\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tsubs r0, r3, r1\n"
    "\tldr r2, [sp, 0x8]\n"
    "\tadds r1, r0, 0\n"
    "\tmuls r1, r2\n"
    "\tadds r1, r7\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tldr r1, [sp]\n"
    "\tbl sub_80FFBDC\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFD1A\n"
    "\tb _080FFFF4\n"
    "_080FFD1A:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tmov r2, r9\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFD2E\n"
    "\tb _080FFFF4\n"
    "_080FFD2E:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0xC]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tcmp r4, 0\n"
    "\tbeq _080FFD4A\n"
    "\tcmp r4, 0x10\n"
    "\tbeq _080FFD4A\n"
    "\tb _080FFFF4\n"
    "_080FFD4A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFCB8\n"
    "_080FFD56:\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tlsls r0, r1, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r2, [sp, 0x4]\n"
    "\tcmp r6, r2\n"
    "\tbcc _080FFC8C\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFD64: .4byte gTasks\n"
    "_080FFD68:\n"
    "\tmovs r6, 0\n"
    "\tmov r3, r10\n"
    "\tlsls r3, 2\n"
    "\tstr r3, [sp, 0x1C]\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tsubs r0, 0x1\n"
    "\tstr r0, [sp, 0x18]\n"
    "\tcmp r6, r0\n"
    "\tbge _080FFE54\n"
    "\tadds r0, r3, 0\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tstr r0, [sp, 0x10]\n"
    "_080FFD82:\n"
    "\tldr r1, [sp, 0x10]\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tadds r6, 0x1\n"
    "\tstr r6, [sp, 0x14]\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcs _080FFE48\n"
    "\tlsls r0, 16\n"
    "\tstr r0, [sp, 0x20]\n"
    "_080FFDA0:\n"
    "\tldr r1, [sp, 0x10]\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tadds r0, r6, 0\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp, 0x4]\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tsubs r0, r3, r1\n"
    "\tldr r2, [sp, 0x8]\n"
    "\tadds r1, r0, 0\n"
    "\tmuls r1, r2\n"
    "\tadds r1, r7\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_805729C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE0C\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0\n"
    "\tbl sub_80FFB6C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE0C\n"
    "\tb _080FFFF4\n"
    "_080FFE0C:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tldr r3, [sp, 0x20]\n"
    "\tasrs r2, r3, 16\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFE22\n"
    "\tb _080FFFF4\n"
    "_080FFE22:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x10\n"
    "\tbeq _080FFE3A\n"
    "\tb _080FFFF4\n"
    "_080FFE3A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r2, _080FFF18 @ =gTasks\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFDA0\n"
    "_080FFE48:\n"
    "\tldr r1, [sp, 0x14]\n"
    "\tlsls r0, r1, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r3, [sp, 0x18]\n"
    "\tcmp r6, r3\n"
    "\tblt _080FFD82\n"
    "_080FFE54:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tldr r1, [sp, 0x4]\n"
    "\tsubs r0, r1\n"
    "\tadds r0, 0x1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFE74\n"
    "\tb _08100024\n"
    "_080FFE74:\n"
    "\tlsls r0, 16\n"
    "\tstr r0, [sp, 0x20]\n"
    "_080FFE78:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tldr r1, _080FFF18 @ =gTasks\n"
    "\tadds r0, r1\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tmov r8, r0\n"
    "\tasrs r6, r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tadds r0, r6, 0\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp]\n"
    "\tldr r0, [r3, 0x1C]\n"
    "\tlsls r1, r7, 1\n"
    "\tadds r1, r0\n"
    "\tmovs r2, 0x80\n"
    "\tlsls r2, 2\n"
    "\tadds r0, r2, 0\n"
    "\tldrh r1, [r1]\n"
    "\tadds r0, r1\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tbl GetBehaviorByMetatileId\n"
    "\tmovs r3, 0xF0\n"
    "\tlsls r3, 8\n"
    "\tadds r1, r3, 0\n"
    "\tadds r5, r1, 0\n"
    "\tands r5, r0\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_805729C\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEDA\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572B0\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEDA\n"
    "\tb _080FFFF4\n"
    "_080FFEDA:\n"
    "\tmov r0, r10\n"
    "\tadds r1, r6, 0\n"
    "\tldr r3, [sp, 0x20]\n"
    "\tasrs r2, r3, 16\n"
    "\tadds r3, r5, 0\n"
    "\tbl sub_80FFB94\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _080FFEF0\n"
    "\tb _080FFFF4\n"
    "_080FFEF0:\n"
    "\tmov r1, r8\n"
    "\tlsrs r0, r1, 16\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tcmp r4, 0\n"
    "\tbeq _080FFF0A\n"
    "\tcmp r4, 0x10\n"
    "\tbne _080FFFF4\n"
    "_080FFF0A:\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFE78\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFF18: .4byte gTasks\n"
    "_080FFF1C:\n"
    "\tmovs r6, 0\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFF26\n"
    "\tb _08100024\n"
    "_080FFF26:\n"
    "\tmov r1, r10\n"
    "\tlsls r0, r1, 2\n"
    "\tadd r0, r10\n"
    "\tlsls r1, r0, 3\n"
    "\tldr r2, _080FFF9C @ =gTasks\n"
    "\tadds r0, r1, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tsubs r0, r6\n"
    "\tlsls r0, 16\n"
    "\tlsrs r0, 16\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcs _080FFF8C\n"
    "\tadds r0, r2, 0\n"
    "\tadds r1, r0\n"
    "\tmov r8, r1\n"
    "\tmov r1, r9\n"
    "\tlsls r0, r1, 16\n"
    "\tasrs r5, r0, 16\n"
    "_080FFF50:\n"
    "\tmov r2, r8\n"
    "\tldrh r0, [r2, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tasrs r4, r0, 16\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tbl sub_80572B0\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _080FFFF4\n"
    "\tadds r0, r4, 0\n"
    "\tadds r1, r5, 0x1\n"
    "\tbl MapGridGetMetatileIdAt\n"
    "\tmovs r1, 0xA3\n"
    "\tlsls r1, 2\n"
    "\tcmp r0, r1\n"
    "\tbeq _080FFFF4\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFF50\n"
    "_080FFF8C:\n"
    "\tadds r0, r6, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r6, r0, 24\n"
    "\tldr r0, [sp, 0x4]\n"
    "\tcmp r6, r0\n"
    "\tbcc _080FFF26\n"
    "\tb _08100024\n"
    "\t.align 2, 0\n"
    "_080FFF9C: .4byte gTasks\n"
    "_080FFFA0:\n"
    "\tmov r3, r10\n"
    "\tlsls r1, r3, 2\n"
    "\tadds r0, r1, r3\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r2\n"
    "\tldrh r0, [r0, 0xA]\n"
    "\tmov r9, r0\n"
    "\tmovs r7, 0\n"
    "\tstr r1, [sp, 0x1C]\n"
    "\tldr r0, [sp, 0x8]\n"
    "\tcmp r7, r0\n"
    "\tbcs _08100024\n"
    "\tadds r6, r2, 0\n"
    "\tmov r1, r9\n"
    "\tlsls r1, 16\n"
    "\tstr r1, [sp, 0x20]\n"
    "_080FFFC0:\n"
    "\tldr r0, [sp, 0x1C]\n"
    "\tadd r0, r10\n"
    "\tlsls r0, 3\n"
    "\tadds r0, r6\n"
    "\tldrh r0, [r0, 0x8]\n"
    "\tadds r0, r7\n"
    "\tlsls r0, 16\n"
    "\tlsrs r5, r0, 16\n"
    "\tasrs r0, 16\n"
    "\tmov r2, r9\n"
    "\tlsls r1, r2, 16\n"
    "\tasrs r1, 16\n"
    "\tbl MapGridGetMetatileBehaviorAt\n"
    "\tlsls r0, 24\n"
    "\tlsrs r4, r0, 24\n"
    "\tldr r3, [sp]\n"
    "\tldrb r0, [r3, 0x12]\n"
    "\tcmp r0, 0x5\n"
    "\tbne _080FFFF8\n"
    "_080FFFE8:\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572EC\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbne _08100004\n"
    "_080FFFF4:\n"
    "\tmovs r0, 0\n"
    "\tb _08100026\n"
    "_080FFFF8:\n"
    "\tadds r0, r4, 0\n"
    "\tbl sub_80572D8\n"
    "\tlsls r0, 24\n"
    "\tcmp r0, 0\n"
    "\tbeq _080FFFE8\n"
    "_08100004:\n"
    "\tadds r0, r5, 0\n"
    "\tldr r2, [sp, 0x20]\n"
    "\tlsrs r1, r2, 16\n"
    "\tmovs r2, 0\n"
    "\tbl GetFieldObjectIdByXYZ\n"
    "\tlsls r0, 24\n"
    "\tlsrs r0, 24\n"
    "\tcmp r0, 0x10\n"
    "\tbne _080FFFF4\n"
    "\tadds r0, r7, 0x1\n"
    "\tlsls r0, 24\n"
    "\tlsrs r7, r0, 24\n"
    "\tldr r3, [sp, 0x8]\n"
    "\tcmp r7, r3\n"
    "\tbcc _080FFFC0\n"
    "_08100024:\n"
    "\tmovs r0, 0x1\n"
    "_08100026:\n"
    "\tadd sp, 0x24\n"
    "\tpop {r3-r5}\n"
    "\tmov r8, r3\n"
    "\tmov r9, r4\n"
    "\tmov r10, r5\n"
    "\tpop {r4-r7}\n"
    "\tpop {r1}\n"
    "\tbx r1\n"
    ".syntax divided\n");
}
#endif

void sub_8100038(u8 taskId)
{
    if (sub_80FFC24(taskId, &gDecorations[gUnknown_020388D0[gUnknown_020388F5]]) == 1)
    {
        DisplayItemMessageOnField(taskId, gSecretBaseText_PlaceItHere, sub_81000A0, 0);
    } else
    {
        PlaySE(SE_HAZURE);
        DisplayItemMessageOnField(taskId, gSecretBaseText_CantBePlacedHere, sub_81006A8, 0);
    }
}

void sub_81000A0(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    sub_80F914C(taskId, &gUnknown_083EC95C);
}

void sub_81000C4(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_8100174(taskId);
    if (gDecorations[gUnknown_020388D0[gUnknown_020388F5]].decor_field_11 != 4)
    {
        sub_80FF394(gTasks[taskId].data[0], gTasks[taskId].data[1], gUnknown_020388D0[gUnknown_020388F5]);
    } else
    {
        gUnknown_020391A4 = gTasks[taskId].data[0] - 7;
        gUnknown_020391A6 = gTasks[taskId].data[1] - 7;
        ScriptContext1_SetupScript(gUnknown_081A2F7B);
    }
    gSprites[gUnknown_020391A8].pos1.y += 2;
    sub_810028C(taskId);
}

void sub_8100174(u8 taskId)
{
    u16 i;
    for (i=0; i<ewram_1f000.size; i++)
    {
        if (ewram_1f000.items[i] == 0)
        {
            ewram_1f000.items[i] = gUnknown_020388D0[gUnknown_020388F5];
            ewram_1f000.pos[i] = ((gTasks[taskId].data[0] - 7) << 4) + (gTasks[taskId].data[1] - 7);
            break;
        }
    }
    if (!ewram_1f000.isPlayerRoom)
    {
        for (i=0; i<16; i++)
        {
            if (gUnknown_020388D6[i] == 0)
            {
                gUnknown_020388D6[i] = gUnknown_020388F5 + 1;
                break;
            }
        }
    } else
    {
        for (i=0; i<12; i++)
        {
            if (gUnknown_020388E6[i] == 0)
            {
                gUnknown_020388E6[i] = gUnknown_020388F5 + 1;
                break;
            }
        }
    }
}

void sub_8100248(u8 taskId)
{
    DisplayYesNoMenu(20, 8, 1);
    sub_80F914C(taskId, &gUnknown_083EC964);
}

void sub_810026C(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    sub_810028C(taskId);
}

void sub_810028C(u8 taskId)
{
    fade_screen(1, 0);
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].func = c1_overworld_prev_quest;
}

void c1_overworld_prev_quest(u8 taskId)
{
    switch (gTasks[taskId].data[2])
    {
        case 0:
            ScriptContext2_Enable();
            if (!gPaletteFade.active)
            {
                sub_80FF114(taskId);
                gTasks[taskId].data[2] = 1;
            }
            break;
        case 1:
            sub_81016F4();
            FreeSpritePaletteByTag(0xbb8);
            gUnknown_0300485C = &sub_8100364;
            SetMainCallback2(c2_exit_to_overworld_2_switch);
            DestroyTask(taskId);
            break;
    }
}

void sub_8100334(u8 taskId)
{
    if (sub_807D770() == 1)
    {
        gTasks[taskId].func = sub_80FE948;
    }
}

void sub_8100364(void)
{
    ScriptContext2_Enable();
    LoadScrollIndicatorPalette();
    pal_fill_black();
    sub_80FE7EC(CreateTask(sub_8100334, 8));
}

bool8 sub_810038C(u8 taskId)
{
    s16 *data;
    data = gTasks[taskId].data;
    if (gUnknown_020391AA == DIR_SOUTH && data[1] - data[6] - 6 < 0)
    {
        data[1]++;
        return FALSE;
    } else if (gUnknown_020391AA == DIR_NORTH && data[1] - 7 >= gMapHeader.mapData->height)
    {
        data[1]--;
        return FALSE;
    } else if (gUnknown_020391AA == DIR_WEST && data[0] - 7 < 0)
    {
        data[0]++;
        return FALSE;
    } else if (gUnknown_020391AA == DIR_EAST && data[0] + data[5] - 8 >= gMapHeader.mapData->width)
    {
        data[0]--;
        return FALSE;
    }
    return TRUE;
}

bool8 sub_8100430(void)
{
    if ((gMain.heldKeys & DPAD_ANY) != DPAD_UP && (gMain.heldKeys & DPAD_ANY) != DPAD_DOWN && (gMain.heldKeys & DPAD_ANY) != DPAD_LEFT && (gMain.heldKeys & DPAD_ANY) != DPAD_RIGHT)
    {
        return FALSE;
    }
    return TRUE;
}

void sub_810045C(void)
{
    gUnknown_020391AA = 0;
    gSprites[gUnknown_020391A8].data2 = 0;
    gSprites[gUnknown_020391A8].data3 = 0;
}

void sub_8100494(u8 taskId)
{
    if (!gSprites[gUnknown_020391A8].data4)
    {
        if (gTasks[taskId].data[10] == 1)
        {
            gUnknown_083EC96C[gTasks[taskId].data[12]][0](taskId);
            return;
        } else if (gTasks[taskId].data[10] == 2)
        {
            gUnknown_083EC96C[gTasks[taskId].data[12]][1](taskId);
            return;
        }
        if ((gMain.heldKeys & DPAD_ANY) == DPAD_UP)
        {
            gUnknown_020391AA = DIR_SOUTH;
            gSprites[gUnknown_020391A8].data2 =  0;
            gSprites[gUnknown_020391A8].data3 = -2;
            gTasks[taskId].data[1]--;
        }
        if ((gMain.heldKeys & DPAD_ANY) == DPAD_DOWN)
        {
            gUnknown_020391AA = DIR_NORTH;
            gSprites[gUnknown_020391A8].data2 =  0;
            gSprites[gUnknown_020391A8].data3 =  2;
            gTasks[taskId].data[1]++;
        }
        if ((gMain.heldKeys & DPAD_ANY) == DPAD_LEFT)
        {
            gUnknown_020391AA = DIR_WEST;
            gSprites[gUnknown_020391A8].data2 = -2;
            gSprites[gUnknown_020391A8].data3 =  0;
            gTasks[taskId].data[0]--;
        }
        if ((gMain.heldKeys & DPAD_ANY) == DPAD_RIGHT)
        {
            gUnknown_020391AA = DIR_EAST;
            gSprites[gUnknown_020391A8].data2 =  2;
            gSprites[gUnknown_020391A8].data3 =  0;
            gTasks[taskId].data[0]++;
        }
        if (!sub_8100430() || !sub_810038C(taskId))
        {
            sub_810045C();
        }
    }
    if (gUnknown_020391AA)
    {
        gSprites[gUnknown_020391A8].data4++;
        gSprites[gUnknown_020391A8].data4 &= 7;
    }
    if (!gTasks[taskId].data[10])
    {
        if (gMain.newKeys & A_BUTTON)
        {
            gTasks[taskId].data[10] = A_BUTTON;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            gTasks[taskId].data[10] = B_BUTTON;
        }
    }
}

void sub_810065C(u8 taskId)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
    gSprites[gUnknown_020391A8].data7 = 0;
    gTasks[taskId].data[10] = 0;
    gTasks[taskId].func = sub_8100494;
}

void sub_81006A8(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        sub_810065C(taskId);
    }
}

void sub_81006D0(struct UnkStruct_02038900 *unk_02038900)
{
    u16 i;
    for (i=0; i<0x800; i++)
    {
        unk_02038900->unk_084[i] = 0;
    }
    for (i=0; i<0x40; i++)
    {
        unk_02038900->unk_004[i] = 0;
    }
}

void sub_810070C(u16 *a0, u16 a1)
{
    u16 i;
    for (i=0; i<16; i++)
    {
        a0[i] = ((u16 *)gMapHeader.mapData->primaryTileset->palettes)[16 * a1 + i];
    }
}

void sub_8100740(u8 *dest, u16 flags)
{
    u8 buffer[32];
    u16 mode;
    u16 i;
    mode = flags >> 10;
    if (flags != 0)
    {
        flags &= 0x3ff;
    }
    for (i=0; i<32; i++)
    {
        buffer[i] = ((u8 *)gMapHeader.mapData->primaryTileset->tiles)[flags * 32 + i];
    }
    switch (mode)
    {
        case 0:
            for (i=0; i<32; i++)
            {
                dest[i] = buffer[i];
            }
            break;
        case 1:
            for (i=0; i<8; i++)
            {
                dest[4*i] = (buffer[4*(i+1) - 1] >> 4) + ((buffer[4*(i+1) - 1] & 0xf) << 4);
                dest[4*i + 1] = (buffer[4*(i+1) - 2] >> 4) + ((buffer[4*(i+1) - 2] & 0xf) << 4);
                dest[4*i + 2] = (buffer[4*(i+1) - 3] >> 4) + ((buffer[4*(i+1) - 3] & 0xf) << 4);
                dest[4*i + 3] = (buffer[4*(i+1) - 4] >> 4) + ((buffer[4*(i+1) - 4] & 0xf) << 4);
            }
            break;
        case 2:
            for (i=0; i<8; i++)
            {
                dest[4*i] = buffer[4*(7-i)];
                dest[4*i + 1] = buffer[4*(7-i) + 1];
                dest[4*i + 2] = buffer[4*(7-i) + 2];
                dest[4*i + 3] = buffer[4*(7-i) + 3];
            }
            break;
        case 3:
            for (i=0; i<32; i++)
            {
                dest[i] = (buffer[31-i] >> 4) + ((buffer[31-i] & 0xf) << 4);
            }
            break;
    }
}

void sub_8100874(struct UnkStruct_02038900 *unk_02038900)
{
    u16 i;
    for (i=0; i<0x40; i++)
        sub_8100740(&unk_02038900->unk_084[i * 32], unk_02038900->unk_004[i]);
}

u16 sub_810089C(u16 a0)
{
    return ((u16 *)gMapHeader.mapData->secondaryTileset->metatiles)[a0] & 0xfff;
}
