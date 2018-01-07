#include "global.h"
#include "palette.h"
#include "constants/songs.h"
#include "sound.h"
#include "field_weather.h"
#include "overworld.h"
#include "field_fadetransition.h"
#include "menu.h"
#include "main.h"
#include "strings.h"
#include "string_util.h"
#include "event_data.h"
#include "ewram.h"
#include "script.h"
#include "pokemon_storage_system.h"

struct StorageAction {
    u8 *text;
    u8 format;
};

struct PSS_MenuStringPtrs {
    const u8 *text;
    const u8 *desc;
};

struct PokemonStorageSystemData {
    u8 filler_0000[5];
    u8 unk_0005;
};

struct UnkPSSStruct_2002370 {
    struct Sprite *unk_0000;
    struct Sprite *unk_0004[4];
    u32 unk_0014[3];
    struct Sprite *unk_0020[2];
    u8 filler_0028[0x214];
    u8 unk_023c;
    u8 unk_023d;
    u8 unk_023e;
    u16 unk_0240;
    u16 unk_0242;
};

void StorageSystemCreatePrimaryMenu(u8 whichMenu);
void task_intro_29(u8 whichMenu);
void sub_80963D0(u8 a0);
void sub_809658C(void);
void sub_80965F8(void);
void sub_809662C(void);
void sub_809665C(void);
void sub_8096784(struct Sprite *sprite);
struct Sprite *sub_809A9A0(u16 a0, u16 a1, u8 a2, u8 a3, u8 a4);

const struct PSS_MenuStringPtrs gUnknown_083B600C[] = {
    {PCText_WithdrawPoke, PCText_MovePokeToParty},
    {PCText_DepositPoke,  PCText_StorePokeInBox},
    {PCText_MovePoke,     PCText_OrganizeBoxesParty},
    {PCText_SeeYa,        PCText_ReturnToPrevMenu}
};

const union AnimCmd gSpriteAnim_83B602C[] = {
    ANIMCMD_FRAME( 0, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83B6034[] = {
    ANIMCMD_FRAME( 4, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83B603C[] = {
    ANIMCMD_FRAME( 6, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83B6044[] = {
    ANIMCMD_FRAME(10, 5),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83B604C[] = {
    gSpriteAnim_83B602C,
    gSpriteAnim_83B6034,
    gSpriteAnim_83B603C,
    gSpriteAnim_83B6044
};

const union AffineAnimCmd gSpriteAffineAnim_83B605C[] = {
    AFFINEANIMCMD_FRAME(0xe0, 0xe0, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83B606C[] = {
    gSpriteAffineAnim_83B605C
};

const u16 gBoxSelectionPopupPalette[] = INCBIN_U16("graphics/pokemon_storage/box_selection_popup.gbapal");

const u8 gBoxSelectionPopupCenterTiles[] = INCBIN_U8("graphics/pokemon_storage/box_selection_popup_center.4bpp");

const u8 gBoxSelectionPopupSidesTiles[] = INCBIN_U8("graphics/pokemon_storage/box_selection_popup_sides.4bpp");

extern const struct StorageAction gUnknown_083B6DF4[];
extern const struct PokemonStorageSystemData *gUnknown_083B6DB4;

EWRAM_DATA struct PokemonStorage gPokemonStorage = {0};
EWRAM_DATA u8 gUnknown_02038474;
EWRAM_DATA struct UnkPSSStruct_2002370 *gUnknown_02038478;

u8 sub_8095ADC(u8 boxId)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < 30; i++)
    {
        if (GetBoxMonData(gPokemonStorage.boxes[boxId] + i, MON_DATA_SPECIES) != 0)
            count++;
    }
    return count;
}

s16 sub_8095B24(u8 boxId)
{
    u16 i;

    for (i = 0; i < 30; i++)
    {
        if (GetBoxMonData(gPokemonStorage.boxes[boxId] + i, MON_DATA_SPECIES) == 0)
            return i;
    }
    return -1;
}

u8 GetNumValidDaycarePartyMons(void)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        struct Pokemon *pokemon = gPlayerParty + i;
        if (GetMonData(pokemon, MON_DATA_SPECIES) != 0 && !GetMonData(pokemon, MON_DATA_IS_EGG))
            count++;
    }
    return count;
}

u8 CountAlivePartyMonsExceptOne(u8 toSkip)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (i != toSkip)
        {
            struct Pokemon *pokemon = gPlayerParty + i;
            if (GetMonData(pokemon, MON_DATA_SPECIES) != 0 && !GetMonData(pokemon, MON_DATA_IS_EGG) && GetMonData(pokemon, MON_DATA_HP) != 0)
                count++;
        }
    }
    return count;
}

u8 CountAlivePartyMonsExceptSelectedOne(void)
{
    return CountAlivePartyMonsExceptOne(gSpecialVar_0x8004);
}

u8 StorageSystemGetPartySize(void)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(gPlayerParty + i, MON_DATA_SPECIES) != 0)
            count++;
    }
    return count;
}

u8 *unref_sub_8095C60(u8 *dest, const u8 *src, u16 pad)
{
    u8 *_dest = StringCopy(dest, src);
    while (_dest < dest + pad)
    {
        *_dest++ = CHAR_SPACE;
    }
    *_dest = EOS;
    return _dest;
}

void sub_8095C8C(u16 *dest, u16 dest_left, u16 dest_top, const u16 *src, u16 src_left, u16 src_top, u16 dest_width, u16 dest_height, u16 src_width)
{
    u16 i;

    dest_width *= 2;
    dest += dest_top * 0x20 + dest_left;
    src += src_top * src_width + src_left;
    for (i = 0; i < dest_height; i++)
    {
        CpuCopy16(src, dest, dest_width);
        dest += 0x20;
        src += src_width;
    }
}

#ifdef NONMATCHING
void unref_sub_8095D08(u16 *dest, u16 dest_left, u16 dest_top, u16 width, u16 height)
{
    u16 i;

    dest += dest_top * 0x20 + dest_left;
    width *= 2;
    for (i = 0; i < height; dest += 0x20, i++)
    {
        void *_dest = dest;
        size_t _size = width;
        if (_size <= 0x1000)
        {
            DmaFill16(3, 0, _dest, _size);
        }
        else
        {
            while (1)
            {
                DmaFill16(3, 0, _dest, 0x1000);
                _dest += 0x1000;
                _size -= 0x1000;
                if (_size <= 0x1000)
                {
                    DmaFill16(3, 0, _dest, _size);
                    break;
                }
            }
        }
    }
}
#else
__attribute__((naked)) void unref_sub_8095D08(u16 *dest, u16 dest_left, u16 dest_top, u16 width, u16 height)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x8\n"
                    "\tadds r4, r0, 0\n"
                    "\tldr r0, [sp, 0x28]\n"
                    "\tlsls r1, 16\n"
                    "\tlsrs r1, 16\n"
                    "\tlsls r2, 16\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tmov r10, r0\n"
                    "\tlsrs r2, 11\n"
                    "\tadds r2, r1\n"
                    "\tlsls r2, 1\n"
                    "\tadds r4, r2\n"
                    "\tlsls r3, 17\n"
                    "\tlsrs r0, r3, 16\n"
                    "\tstr r0, [sp, 0x4]\n"
                    "\tmovs r0, 0\n"
                    "\tcmp r0, r10\n"
                    "\tbcs _08095DB2\n"
                    "\tmovs r6, 0x80\n"
                    "\tlsls r6, 5\n"
                    "\tmov r5, sp\n"
                    "\tldr r7, _08095D74 @ =0x040000d4\n"
                    "\tlsrs r3, 17\n"
                    "\tmov r9, r3\n"
                    "\tmov r1, r9\n"
                    "\tmovs r2, 0x81\n"
                    "\tlsls r2, 24\n"
                    "\torrs r1, r2\n"
                    "\tmov r9, r1\n"
                    "_08095D4E:\n"
                    "\tadds r3, r4, 0\n"
                    "\tldr r2, [sp, 0x4]\n"
                    "\tmovs r1, 0x40\n"
                    "\tadds r1, r4\n"
                    "\tmov r8, r1\n"
                    "\tadds r0, 0x1\n"
                    "\tmov r12, r0\n"
                    "\tcmp r2, r6\n"
                    "\tbhi _08095D78\n"
                    "\tmovs r0, 0\n"
                    "\tstrh r0, [r5]\n"
                    "\tmov r2, sp\n"
                    "\tstr r2, [r7]\n"
                    "\tstr r4, [r7, 0x4]\n"
                    "\tmov r0, r9\n"
                    "\tstr r0, [r7, 0x8]\n"
                    "\tldr r0, [r7, 0x8]\n"
                    "\tb _08095DA6\n"
                    "\t.align 2, 0\n"
                    "_08095D74: .4byte 0x040000d4\n"
                    "_08095D78:\n"
                    "\tmovs r4, 0\n"
                    "\tstrh r4, [r5]\n"
                    "\tldr r1, _08095DC4 @ =0x040000d4\n"
                    "\tmov r0, sp\n"
                    "\tstr r0, [r1]\n"
                    "\tstr r3, [r1, 0x4]\n"
                    "\tldr r0, _08095DC8 @ =0x81000800\n"
                    "\tstr r0, [r1, 0x8]\n"
                    "\tldr r0, [r1, 0x8]\n"
                    "\tadds r3, r6\n"
                    "\tsubs r2, r6\n"
                    "\tcmp r2, r6\n"
                    "\tbhi _08095D78\n"
                    "\tstrh r4, [r5]\n"
                    "\tmov r0, sp\n"
                    "\tstr r0, [r1]\n"
                    "\tstr r3, [r1, 0x4]\n"
                    "\tlsrs r0, r2, 1\n"
                    "\tmovs r2, 0x81\n"
                    "\tlsls r2, 24\n"
                    "\torrs r0, r2\n"
                    "\tstr r0, [r1, 0x8]\n"
                    "\tldr r0, [r1, 0x8]\n"
                    "_08095DA6:\n"
                    "\tmov r4, r8\n"
                    "\tmov r1, r12\n"
                    "\tlsls r0, r1, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tcmp r0, r10\n"
                    "\tbcc _08095D4E\n"
                    "_08095DB2:\n"
                    "\tadd sp, 0x8\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_08095DC4: .4byte 0x040000d4\n"
                    "_08095DC8: .4byte 0x81000800");
}
#endif

s16 StorageSystemGetNextMonIndex(struct BoxPokemon *box, s8 startIdx, u8 stopIdx, u8 mode)
{
    s16 i;
    s16 direction;
    if (mode == 0 || mode == 2)
    {
        direction = 1;
    }
    else
    {
        direction = -1;
    }
    if (mode == 2 || mode == 3)
    {
        for (i = startIdx + direction; i >= 0 && i <= stopIdx; i += direction)
        {
            if (GetBoxMonData(box + i, MON_DATA_SPECIES) != 0)
                return i;
        }
    }
    else
    {
        for (i = startIdx + direction; i >= 0 && i <= stopIdx; i += direction)
        {
            if (GetBoxMonData(box + i, MON_DATA_SPECIES) != 0 && !GetBoxMonData(box + i, MON_DATA_IS_EGG))
                return i;
        }
    }
    return -1;
}

void StorageSystemClearMessageWindow(void)
{
    MenuFillWindowRectWithBlankTile(2, 15, 27, 18);
}

void Task_PokemonStorageSystem(u8 taskId)
{
    struct Task *task = gTasks + taskId;
    switch (task->data[0])
    {
        case 0:
            StorageSystemCreatePrimaryMenu(task->data[1]);
            MenuDisplayMessageBox();
            MenuPrint(gUnknown_083B600C[task->data[1]].desc, 2, 15);
            task->data[0]++;
            break;
        case 1:
            if (sub_807D770())
            {
                task->data[0]++;
            }
            break;
        case 2:
            task->data[2] = ProcessMenuInput();
            switch(task->data[2])
            {
                case -2:
                    task->data[3] = task->data[1];
                    if (gMain.newKeys & DPAD_UP && --task->data[3] < 0)
                        task->data[3] = 3;

                    if (gMain.newKeys & DPAD_DOWN && ++task->data[3] > 3)
                        task->data[3] = 0;
                    if (task->data[1] != task->data[3])
                    {
                        task->data[1] = task->data[3];
                        StorageSystemClearMessageWindow();
                        MenuPrint(gUnknown_083B600C[task->data[1]].desc, 2, 15);
                    }
                    break;
                case -1:
                case  3:
                    HandleDestroyMenuCursors();
                    MenuZeroFillWindowRect(0, 0, 13, 9);
                    ScriptContext2_Disable();
                    EnableBothScriptContexts();
                    DestroyTask(taskId);
                    break;
                default:
                    if (task->data[2] == 0 && StorageSystemGetPartySize() == PARTY_SIZE)
                    {
                        StorageSystemClearMessageWindow();
                        MenuPrint(gPCText_PartyFull2, 2, 15);
                        task->data[0] = 3;
                    }
                    else if (task->data[2] == 1 && StorageSystemGetPartySize() == 1)
                    {
                        StorageSystemClearMessageWindow();
                        MenuPrint(gPCText_OnlyOne, 2, 15);
                        task->data[0] = 3;
                    }
                    else
                    {
                        fade_screen(1, 0);
                        task->data[0] = 4;
                    }
                    break;
            }
            break;
        case 3:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                StorageSystemClearMessageWindow();
                MenuPrint(gUnknown_083B600C[task->data[1]].desc, 2, 15);
                task->data[0] = 2;
            }
            else if (gMain.newKeys & DPAD_UP)
            {
                if (--task->data[1] < 0)
                    task->data[1] = 3;
                MoveMenuCursor(-1);
                task->data[1] = GetMenuCursorPos();
                StorageSystemClearMessageWindow();
                MenuPrint(gUnknown_083B600C[task->data[1]].desc, 2, 15);
                task->data[0] = 2;
            }
            else if (gMain.newKeys & DPAD_DOWN)
            {
                if (++task->data[1] > 3)
                    task->data[1] = 0;
                MoveMenuCursor(1);
                task->data[1] = GetMenuCursorPos();
                StorageSystemClearMessageWindow();
                MenuPrint(gUnknown_083B600C[task->data[1]].desc, 2, 15);
                task->data[0] = 2;
            }
            break;
        case 4:
            if (!gPaletteFade.active)
            {
                task_intro_29(task->data[2]);
                DestroyTask(taskId);
            }
            break;
    }
}

void ShowPokemonStorageSystem(void)
{
    u8 taskId = CreateTask(Task_PokemonStorageSystem, 80);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = 0;
    ScriptContext2_Enable();
}

void sub_8096130(void)
{
    u8 taskId = CreateTask(Task_PokemonStorageSystem, 80);
    gTasks[taskId].data[0] = 0;
    gTasks[taskId].data[1] = gUnknown_02038474;
    pal_fill_black();
}

void StorageSystemCreatePrimaryMenu(u8 whichMenu)
{
    MenuDrawTextWindow(0, 0, 13, 9);
    PrintMenuItems(1, 1, 4, (const struct MenuAction *)gUnknown_083B600C);
    InitMenu(0, 1, 1, 4, whichMenu, 12);
}

void sub_80961A8(void)
{
    gUnknown_02038474 = gUnknown_083B6DB4->unk_0005;
    gFieldCallback = sub_8096130;
    SetMainCallback2(c2_exit_to_overworld_2_switch);
}

void ResetPokemonStorageSystem(void)
{
    u16 boxId;
    u16 boxMon;

    gPokemonStorage.currentBox = 0;
    for (boxId = 0; boxId < 14; boxId++)
    {
        for (boxMon = 0; boxMon < 30; boxMon++)
        {
            ZeroBoxMonData(gPokemonStorage.boxes[boxId] + boxMon);
        }
    }
    for (boxId = 0; boxId < 14; boxId++)
    {
        u8 *dest = StringCopy(gPokemonStorage.boxNames[boxId], gPCText_BOX);
        ConvertIntToDecimalStringN(dest, boxId + 1, STR_CONV_MODE_LEFT_ALIGN, 2);
    }
    for (boxId = 0; boxId < 14; boxId++)
    {
        gPokemonStorage.wallpaper[boxId] = boxId & 0x03;
    }
}

void sub_8096264(struct UnkPSSStruct_2002370 *a0, u16 tileTag, u16 palTag, u8 a3)
{
    struct SpritePalette palette = {
        gBoxSelectionPopupPalette, palTag
    };
    struct SpriteSheet sheets[] = {
        {gBoxSelectionPopupCenterTiles, 0x800, tileTag},
        {gBoxSelectionPopupSidesTiles,  0x180, tileTag + 1},
        {}
    };
    LoadSpritePalette(&palette);
    LoadSpriteSheets(sheets);
    gUnknown_02038478 = a0;
    a0->unk_0240 = tileTag;
    a0->unk_0242 = palTag;
    a0->unk_023e = a3;
}

void sub_8096310(void)
{
    FreeSpritePaletteByTag(gUnknown_02038478->unk_0242);
    FreeSpriteTilesByTag(gUnknown_02038478->unk_0240);
    FreeSpriteTilesByTag(gUnknown_02038478->unk_0240 + 1);
}

void sub_809634C(u8 a0)
{
    sub_80963D0(a0);
}

void sub_809635C(void)
{
    sub_809658C();
}

u8 sub_8096368(void)
{
    if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        return 201;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return gUnknown_02038478->unk_023c;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        PlaySE(SE_SELECT);
        sub_809662C();
    }
    else if (gMain.newKeys & DPAD_RIGHT)
    {
        PlaySE(SE_SELECT);
        sub_80965F8();
    }
    return 200;
}

void sub_80963D0(u8 a0)
{
    u16 i;
    u8 spriteId;
    struct SpriteTemplate template;
    struct OamData oamData = {};
    oamData.size = 3;
    oamData.paletteNum = 1;
    template = (struct SpriteTemplate){
        0, 0, &oamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
    };

    gUnknown_02038478->unk_023c = a0;
    template.tileTag = gUnknown_02038478->unk_0240;
    template.paletteTag = gUnknown_02038478->unk_0242;

    spriteId = CreateSprite(&template, 0xa0, 0x60, 0);
    gUnknown_02038478->unk_0000 = gSprites + spriteId;

    oamData.shape = ST_OAM_V_RECTANGLE;
    oamData.size = 1;
    template.tileTag = gUnknown_02038478->unk_0240 + 1;
    template.anims = gSpriteAnimTable_83B604C;
    for (i = 0; i < 4; i++)
    {
        u16 r5;
        spriteId = CreateSprite(&template, 0x7c, 0x50, gUnknown_02038478->unk_023e);
        gUnknown_02038478->unk_0004[i] = gSprites + spriteId;
        r5 = 0;
        if (i & 2)
        {
            gUnknown_02038478->unk_0004[i]->pos1.x = 0xc4;
            r5 = 2;
        }
        if (i & 1)
        {
            gUnknown_02038478->unk_0004[i]->pos1.y = 0x70;
            gUnknown_02038478->unk_0004[i]->oam.size = 0;
            r5++;
        }
        StartSpriteAnim(gUnknown_02038478->unk_0004[i], r5);
    }
    for (i = 0; i < 2; i++)
    {
        gUnknown_02038478->unk_0020[i] = sub_809A9A0(72 * i + 0x7c, 0x58, i, 0, gUnknown_02038478->unk_023e);
        if (gUnknown_02038478->unk_0020[i])
        {
            gUnknown_02038478->unk_0020[i]->data[0] = (i == 0 ? -1 : 1);
            gUnknown_02038478->unk_0020[i]->callback = sub_8096784;
        }
    }
    sub_809665C();
}

asm(".section .text.8098898");

void sub_8098898(u8 index) {
    u8 *ptr;

    MenuDrawTextWindow(10, 16, 29, 19);

    switch (gUnknown_083B6DF4[index].format)
    {

    case 2:
        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        ptr = StringCopy(ptr, gUnk20011fa);
        break;

    case 5:
        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        ptr = StringCopy(ptr, gUnk20026e4);
        break;

    case 1:
        // {var} + " is selected."
        ptr = StringCopy(gUnk2002694, gUnk20011fa);
        ptr = StringCopy(ptr, gUnknown_083B6DF4[index].text);
        break;

    case 4:
        // {var} + " was released."
        ptr = StringCopy(gUnk2002694, gUnk20026e4);
#if ENGLISH
        ptr = StringCopy(ptr, gUnknown_083B6DF4[index].text);
#elif GERMAN
        ptr = de_sub_8073174(gUnk2002694, gUnknown_083B6DF4[index].text);
#endif
        break;

    case 3:
    {
        u8 *stringLength;
        u8 *text;

        text = gUnknown_083B6DF4[index].text;
        stringLength = &text[StringLength(text)] + 1;

        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        ptr = StringCopy(ptr, gUnk20011fa);
        ptr = StringCopy(ptr, stringLength);
    }
        break;

    case 6:
        // "Bye-bye, ".substr(0, -1) + {var} + "Bye-bye, !".substr(-1, 1)
    {
        u8 *stringLength;
        u8 *text;

        text = gUnknown_083B6DF4[index].text;
        stringLength = &text[StringLength(text)] - 1;

        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        ptr = StringCopy(ptr - 1, gUnk20026e4);
        ptr = StringCopy(ptr, stringLength);
    }
        break;

    case 0:
    default:
        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        break;
    }

    while (ptr < gUnk20026A6)
    {
            ptr[0] = CHAR_SPACE;
            ptr++;
    }

    ptr[0] = EOS;
    MenuPrint(gUnk2002694, 11, 17);
}
