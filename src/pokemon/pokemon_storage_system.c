#include "global.h"
#include "palette.h"
#include "constants/songs.h"
#include "sound.h"
#include "field_weather.h"
#include "mon_markings.h"
#include "overworld.h"
#include "mail_data.h"
#include "field_fadetransition.h"
#include "menu.h"
#include "main.h"
#include "strings.h"
#include "string_util.h"
#include "event_data.h"
#include "ewram.h"
#include "script.h"
#include "pokemon_summary_screen.h"
#include "pc_screen_effect.h"
#include "naming_screen.h"
#include "pokemon_storage_system.h"

enum {
    PC_TEXT_EXIT_BOX,
    PC_TEXT_WHAT_YOU_DO,
    PC_TEXT_PICK_A_THEME,
    PC_TEXT_PICK_A_WALLPAPER,
    PC_TEXT_IS_SELECTED,
    PC_TEXT_JUMP_TO_WHICH_BOX,
    PC_TEXT_DEPOSIT_IN_WHICH_BOX,
    PC_TEXT_WAS_DEPOSITED,
    PC_TEXT_BOX_IS_FULL,
    PC_TEXT_RELEASE_POKE,
    PC_TEXT_WAS_RELEASED,
    PC_TEXT_BYE_BYE,
    PC_TEXT_MARK_POKE,
    PC_TEXT_LAST_POKE,
    PC_TEXT_PARTY_FULL,
    PC_TEXT_HOLDING_POKE,
    PC_TEXT_WHICH_ONE_WILL_TAKE,
    PC_TEXT_CANT_RELEASE_EGG,
    PC_TEXT_CONTINUE_BOX,
    PC_TEXT_CAME_BACK,
    PC_TEXT_WORRIED,
    PC_TEXT_SURPRISE,
    PC_TEXT_PLEASE_REMOVE_MAIL
};

enum {
    PC_TEXT_FMT_NORMAL,
    PC_TEXT_FMT_MON_NAME,
    PC_TEXT_FMT_UNK_02,
    PC_TEXT_FMT_UNK_03,
    PC_TEXT_FMT_MON_NAME_2,
    PC_TEXT_FMT_UNK_05,
    PC_TEXT_FMT_MON_NAME_AFTER_EXCL_MARK
};

struct StorageAction {
    u8 *text;
    u8 format;
};

struct PSS_MenuStringPtrs {
    const u8 *text;
    const u8 *desc;
};

struct UnkStruct_2000020 {
    struct UnkStruct_2000020 *unk_00;
    u8 unk_04;
    u8 unk_05;
};

struct UnkPSSStruct_2002370 {
    struct Sprite *unk_0000;
    struct Sprite *unk_0004[4];
    u32 unk_0014[3];
    struct Sprite *unk_0020[2];
    u8 filler_0028[0x214];
    u8 curBox;
    u8 unk_023d;
    u8 unk_023e;
    u16 unk_0240;
    u16 unk_0242;
}; // 0244

struct PokemonStorageSystemData {
    void (*unk_0000)(void);
    u8 unk_0004;
    u8 unk_0005;
    u8 unk_0006;
    u16 unk_0008;
    u16 unk_000a;
    struct PCScreenEffectStruct unk_000c;
    struct UnkStruct_2000020 unk_0020[274]; // refine size later
    u8 filler_08b0[2];
    s16 unk_08b2;
    u16 unk_08b4;
    u8 filler_08b6[0x4a8];
    s16 unk_0d5e;
    s16 unk_0d60;
    u8 filler_0d62[0x490];
    u16 unk_11f2;
    u8 filler_11f4[2];
    u8 unk_11f6;
    u8 unk_11f7;
    u8 unk_11f8;
    u8 unk_11f9;
    u8 unk_11fa[0xc2];
    struct PokemonMarkMenu unk_12bc;
    struct UnkPSSStruct_2002370 unk_2370;
    u8 filler_25b4[0xd8];
    u8 unk_268c;
    u8 unk_268d;
    u8 unk_268e;
    struct Pokemon *unk_2690;
    u8 unk_2694[18];
    u8 unk_26a6[62];
    u8 unk_26e4[80];
};

void StorageSystemCreatePrimaryMenu(u8 whichMenu);
void sub_80963D0(u8 curBox);
void sub_809658C(void);
void sub_80965F8(void);
void sub_809662C(void);
void sub_809665C(void);
void sub_80966F4(const u8 *sourceString, u16 x, u16 y);
void sub_8096784(struct Sprite *sprite);
void task_intro_29(u8 whichMenu);
void sub_8096884(void);
void sub_8096AFC(void);
void sub_8096B38(void);
void SetPSSCallback(void (*func)(void));
void sub_8096BF0(void);
void sub_8096C68(void);
void sub_8096C84(void);
void sub_8096FC8(void);
void sub_8097004(void);
void sub_8097078(void);
void sub_80972A8(void);
void sub_80972FC(void);
void c3_0808DC50(void);
void sub_8097390(void);
void sub_809746C(void);
void sub_8097594(void);
void sub_8097788(void);
void sub_80977E4(void);
void sub_8097858(void);
void sub_809789C(void);
void sub_8097974(void);
void sub_8097A64(void);
void sub_8097B44(void);
void sub_8097BA0(void);
void sub_8097CC0(void);
void sub_8097DE0(void);
void sub_8097E44(void);
void sub_8097E70(void);
void BoxSetMosaic(void);
void sub_809801C(void);
void sub_8098400(void);
void add_to_c3_somehow(void);
bool8 sub_80985CC(void);
void sub_80986E8(void);
void sub_8098710(void);
void sub_8098734(void);
void sub_80987DC(void);
void sub_809880C(void);
bool8 sub_8098830(void);
void PrintStorageActionText(u8 index);
void sub_8098A38(u8);
void sub_8098A5C(void);
void sub_8098A80(void);
void sub_8098AA8(u8 a0);
void sub_8098B48(void);
void sub_8099310(void);
bool8 sub_8099374(void);
void sub_8099958(void);
bool8 sub_8099990(void);
void sub_809BB90(void);
void sub_8099BF8(u8 a0);
void sub_8099C70(u8 whichBox);
bool8 sub_8099D34(void);
void sub_8099DCC(u8 a0);
bool8 sub_8099E08(void);
void sub_809A860(u8 a0);
struct Sprite *sub_809A9A0(u16 a0, u16 a1, u8 a2, u8 a3, u8 a4);
void sub_809AA24(void);
void sub_809AA98(void);
bool8 sub_809AC00(void);
void sub_809B0C0(u8 a0);
void sub_809B0D4(void);
void sub_809B0E0(void);
u8 sub_809B0F4(void);
void sub_809B100(u8 a0);
bool8 sub_809B130(void);
void sub_809B440(void);
bool8 sub_809B62C(u8);
void sub_809B6BC(void);
void sub_809B6DC(void);
bool8 sub_809B734(void);
void sub_809B760(void);
void sub_809B7AC(void);
void sub_809B7D4(void);
s8 sub_809B960(void);
void sub_809BBC0(void);
void sub_809BC18(void);
void sub_809BD14(void);
void sub_809BDD8(u8 markings);
bool8 sub_809BE80(void);
bool8 sub_809BEBC(void);
bool8 sub_809BF20(void);
bool8 sub_809BF48(void);
u8 sub_809CA40(void);
void sub_809CE84(void);
s16 sub_809CF30(void);
void sub_809CFDC(struct UnkStruct_2000020 *a0, struct UnkStruct_2000020 *a1, u8 a2);
void sub_809CFF0(void);

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

extern const struct StorageAction gPCStorageActionTexts[];
extern const struct PokemonStorageSystemData *gPokemonStorageSystemPtr;
extern u8 *const gUnknown_083B6DB8;

EWRAM_DATA struct PokemonStorage gPokemonStorage = {0};
EWRAM_DATA u8 gUnknown_02038470[3] = {};
EWRAM_DATA u8 gUnknown_02038473 = 0;
EWRAM_DATA u8 gUnknown_02038474 = 0;
EWRAM_DATA struct UnkPSSStruct_2002370 *gUnknown_02038478 = NULL;
EWRAM_DATA u8 gUnknown_0203847C = 0;
EWRAM_DATA u8 gUnknown_0203847D = 0;
EWRAM_DATA u8 gUnknown_0203847E = 0;
EWRAM_DATA u8 gUnknown_0203847F = 0;
EWRAM_DATA struct Pokemon gUnknown_02038480 = {};
EWRAM_DATA u8 gUnknown_020384E4 = 0;
EWRAM_DATA u8 gUnknown_020384E5 = 0;
EWRAM_DATA u8 gUnknown_020384E6 = 0;
EWRAM_DATA u8 gUnknown_020384E7 = 0;
EWRAM_DATA u8 gUnknown_020384E8 = 0;
EWRAM_DATA u8 gUnknown_020384E9 = 0;
EWRAM_DATA u16 gUnknown_020384EA = 0;
EWRAM_DATA u32 gUnknown_020384EC = 0;

static u8 CountPokemonInBoxN(u8 boxId)
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

s16 GetIndexOfFirstEmptySpaceInBoxN(u8 boxId)
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

void FieldCB_ReturnToOverworld(void)
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
    gUnknown_02038474 = gPokemonStorageSystemPtr->unk_0005;
    gFieldCallback = FieldCB_ReturnToOverworld;
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

void sub_809634C(u8 curBox)
{
    sub_80963D0(curBox);
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
        return gUnknown_02038478->curBox;
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

void sub_80963D0(u8 curBox)
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

    gUnknown_02038478->curBox = curBox;
    template.tileTag = gUnknown_02038478->unk_0240;
    template.paletteTag = gUnknown_02038478->unk_0242;

    spriteId = CreateSprite(&template, 0xA0, 0x60, 0);
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

void sub_809658C(void)
{
    u16 i;
    if (gUnknown_02038478->unk_0000)
    {
        DestroySprite(gUnknown_02038478->unk_0000);
        gUnknown_02038478->unk_0000 = NULL;
    }
    for (i = 0; i < 4; i++)
    {
        if (gUnknown_02038478->unk_0004[i])
        {
            DestroySprite(gUnknown_02038478->unk_0004[i]);
            gUnknown_02038478->unk_0004[i] = NULL;
        }
    }
    for (i = 0; i < 2; i++)
    {
        if (gUnknown_02038478->unk_0020[i])
            DestroySprite(gUnknown_02038478->unk_0020[i]);
    }
}

void sub_80965F8(void)
{
    if (++gUnknown_02038478->curBox > 13)
        gUnknown_02038478->curBox = 0;
    sub_809665C();
}

void sub_809662C(void)
{
    gUnknown_02038478->curBox = (gUnknown_02038478->curBox == 0 ? 13 : gUnknown_02038478->curBox - 1);
    sub_809665C();
}

void sub_809665C(void)
{
    u8 nPokemonInBox = CountPokemonInBoxN(gUnknown_02038478->curBox);
    u8 *stringVar = gStringVar1;

    stringVar[0] = EXT_CTRL_CODE_BEGIN;
    stringVar[1] = 0x04; // EXT_CTRL_CODE_COLOR_HIGHLIGHT_SHADOW
    stringVar[2] = 0x0F; // TEXT_COLOR_WHITE2
    stringVar[3] = 0x01; // TEXT_COLOR_DARK_GREY
    stringVar[4] = 0x0E; // TEXT_COLOR_LIGHT_BLUE
    stringVar += 5;

    stringVar = StringCopy(stringVar, gPokemonStorage.boxNames[gUnknown_02038478->curBox]);

    stringVar[0] = CHAR_NEWLINE;
    stringVar[1] = EXT_CTRL_CODE_BEGIN;
    stringVar[2] = 0x11; // EXT_CTRL_CODE_CLEAR
    if (nPokemonInBox < 10)
        stringVar[3] = 0x28;
    else
        stringVar[3] = 0x22;
    stringVar += 4;

    stringVar = ConvertIntToDecimalString(stringVar, nPokemonInBox);

    stringVar[0] = CHAR_SLASH;
    stringVar[1] = CHAR_0 + 3;
    stringVar[2] = CHAR_0 + 0;
    stringVar[3] = EOS;
    sub_80966F4(gStringVar1, 0, 1);
}

void sub_80966F4(const u8 *sourceString, u16 x, u16 y)
{
    u16 *vdest = (u16 *)(BG_CHAR_ADDR(4) + (GetSpriteTileStartByTag(gUnknown_02038478->unk_0240) * 32) + y * 256 + x * 32);
    u8 *tileBuff = gUnknown_083B6DB8;
    DmaFill16(3, 0x1111, tileBuff, 0x400);
    sub_8004E3C(&gWindowConfig_81E6D38, tileBuff, sourceString);
    DmaCopy16(3, tileBuff, vdest, 0x400);
}

void sub_8096784(struct Sprite *sprite)
{
    if (++sprite->data[1] > 3)
    {
        sprite->data[1] = 0;
        sprite->pos2.x += sprite->data[0];
        if (++sprite->data[2] > 5)
        {
            sprite->data[2] = 0;
            sprite->pos2.x = 0;
        }
    }
}

void task_intro_29(u8 whichMenu)
{
    gUnknown_0203847D = whichMenu;
    ePokemonStorageSystem.unk_0005 = whichMenu;
    SetMainCallback2(sub_8096884);
}

void sub_80967DC(void)
{
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
}

void sub_8096804(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeSpriteTileRanges();
    FreeAllSpritePalettes();
    ResetTasks();
    gReservedSpriteTileCount = 0x280;
    sub_809CFDC(ePokemonStorageSystem.unk_0020, ePokemonStorageSystem.unk_0020 + 1, 8);
    gKeyRepeatStartDelay = 20;
}

void sub_8096848(void)
{
    sub_809B0D4();
    gUnknown_0203847C = (ePokemonStorageSystem.unk_0005 == 1 ? 1 : 0);
    gUnknown_0203847E = 0;
}

void sub_8096874(void)
{
    REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
}

void sub_8096884(void)
{
    switch (gMain.state)
    {
        case 0:
            SetVBlankCallback(NULL);
            REG_DISPCNT = 0;
            sub_8096804();
            gMain.state++;
            break;
        case 1:
            SetUpWindowConfig(&gWindowConfig_81E6D00);
            gMain.state++;
            break;
        case 2:
            InitMenuWindow(&gWindowConfig_81E6D00);
            MenuZeroFillScreen();
            gMain.state++;
            break;
        case 3:
            sub_80967DC();
            sub_8096848();
            gMain.state++;
            break;
        case 4:
            sub_8098B48();
            sub_809AA24();
            gMain.state++;
            break;
        case 5:
            sub_8097DE0();
            gMain.state++;
            break;
        case 6:
            sub_8097E70();
            gMain.state++;
            break;
        case 7:
            sub_8098400();
            gMain.state++;
            break;
        case 8:
            sub_8099BF8(gPokemonStorage.currentBox);
            ePokemonStorageSystem.unk_12bc.baseTileTag = 0x000a;
            ePokemonStorageSystem.unk_12bc.basePaletteTag = 0xdacb;
            sub_80F727C(&ePokemonStorageSystem.unk_12bc);
            sub_80F7404();
            gMain.state++;
            break;
        case 9:
            sub_8096874();
            SetPSSCallback(sub_8096BF0);
            SetMainCallback2(sub_8096B38);
            SetVBlankCallback(sub_8096AFC);
            gMain.state++;
            break;
    }
}

void sub_80969A0(void)
{
    switch (gMain.state)
    {
        case 0:
            SetVBlankCallback(NULL);
            REG_DISPCNT = 0x0000;
            ePokemonStorageSystem.unk_0005 = gUnknown_0203847D;
            sub_8096804();
            if (gUnknown_0203847F == 1)
                sub_809BBC0();
            if (gUnknown_0203847F == 0)
                sub_809BD14();
            gMain.state++;
            break;
        case 1:
            SetUpWindowConfig(&gWindowConfig_81E6D00);
            gMain.state++;
            break;
        case 2:
            InitMenuWindow(&gWindowConfig_81E6D00);
            MenuZeroFillScreen();
            gMain.state++;
            break;
        case 3:
            sub_80967DC();
            gMain.state++;
            break;
        case 4:
            sub_8098B48();
            sub_809AA98();
            gMain.state++;
            break;
        case 5:
            sub_8097DE0();
            gMain.state++;
            break;
        case 6:
            sub_8097E70();
            gMain.state++;
            break;
        case 7:
            sub_8098400();
            gMain.state++;
            break;
        case 8:
            sub_8099BF8(gPokemonStorage.currentBox);
            ePokemonStorageSystem.unk_12bc.baseTileTag = 0x000a;
            ePokemonStorageSystem.unk_12bc.basePaletteTag = 0xdacb;
            sub_80F727C(&ePokemonStorageSystem.unk_12bc);
            sub_80F7404();
            gMain.state++;
            break;
        case 9:
            BeginNormalPaletteFade(0xffffffff, 0, 16, 0, 0);
            SetVBlankCallback(sub_8096AFC);
            gMain.state++;
            break;
        case 10:
            sub_8096874();
            SetPSSCallback(sub_8096C68);
            SetMainCallback2(sub_8096B38);
            gMain.state++;
            break;
    }
}

void sub_8096AFC(void)
{
    REG_BG2HOFS = ePokemonStorageSystem.unk_08b4;
    REG_BG3HOFS = ePokemonStorageSystem.unk_000a;
    REG_BG3VOFS = ePokemonStorageSystem.unk_0008;
    LoadOam();
    ProcessSpriteCopyRequests();
    sub_809CFF0();
    TransferPlttBuffer();
}

void sub_8096B38(void)
{
    ePokemonStorageSystem.unk_0000();
    sub_8097E44();
    sub_8098734();
    AnimateSprites();
    BuildOamBuffer();
}

void sub_8096B5C(void)
{
    switch (ePokemonStorageSystem.unk_0006)
    {
        case 0:
            ShowPokemonSummaryScreen(ePokemonStorageSystem.unk_2690, ePokemonStorageSystem.unk_268d, ePokemonStorageSystem.unk_268c, sub_80969A0, ePokemonStorageSystem.unk_268e);
            break;
        case 1:
            DoNamingScreen(1, gPokemonStorage.boxNames[gPokemonStorage.currentBox], 0, 0, 0, sub_80969A0);
            break;
    }
}

void SetPSSCallback(void (*func)(void))
{
    ePokemonStorageSystem.unk_0000 = func;
    ePokemonStorageSystem.unk_0004 = 0;
}

void sub_8096BF0(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            BlendPalettes(0xffffffff, 16, 0);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            PlaySE(SE_PC_LOGON);
            ePokemonStorageSystem.unk_000c.tileTag = 14;
            ePokemonStorageSystem.unk_000c.paletteTag = 0xdad0;
            ePokemonStorageSystem.unk_000c.unk04 = 0;
            ePokemonStorageSystem.unk_000c.unk06 = 0;
            sub_80C5CD4(&ePokemonStorageSystem.unk_000c);
            BlendPalettes(0xffffffff, 0, 0);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 2:
            if (sub_80C5DCC())
                SetPSSCallback(sub_8096C84);
            break;
    }
}

void sub_8096C68(void)
{
    if (!UpdatePaletteFade())
        SetPSSCallback(sub_8096C84);
}

void sub_8096C84(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            switch (sub_809CA40())
            {
                case 1:
                    PlaySE(SE_SELECT);
                    ePokemonStorageSystem.unk_0004 = 1;
                    break;
                case 5:
                    if (ePokemonStorageSystem.unk_0005 != 2)
                    {
                        PrintStorageActionText(PC_TEXT_WHICH_ONE_WILL_TAKE);
                        ePokemonStorageSystem.unk_0004 = 3;
                    }
                    else
                    {
                        sub_809B0D4();
                        SetPSSCallback(sub_8096FC8);
                    }
                    break;
                case 6:
                    if (ePokemonStorageSystem.unk_0005 == 2)
                    {
                        if (sub_809BF20() && ItemIsMail(ePokemonStorageSystem.unk_11f2))
                        {
                            ePokemonStorageSystem.unk_0004 = 5;
                        }
                        else
                        {
                            SetPSSCallback(sub_8097004);
                        }
                    }
                    break;
                case 4:
                    SetPSSCallback(sub_8097BA0);
                    break;
                case 16:
                    SetPSSCallback(sub_8097CC0);
                    break;
                case 7:
                    PlaySE(SE_SELECT);
                    SetPSSCallback(sub_809789C);
                    break;
                case 8:
                    PlaySE(SE_SELECT);
                    SetPSSCallback(sub_8097078);
                    break;
                case 9:
                    PlaySE(SE_SELECT);
                    ePokemonStorageSystem.unk_08b2 = gPokemonStorage.currentBox + 1;
                    if (ePokemonStorageSystem.unk_08b2 > 13)
                        ePokemonStorageSystem.unk_08b2 = 0;
                    sub_8099C70(ePokemonStorageSystem.unk_08b2);
                    ePokemonStorageSystem.unk_0004 = 2;
                    break;
                case 10:
                    PlaySE(SE_SELECT);
                    ePokemonStorageSystem.unk_08b2 = gPokemonStorage.currentBox - 1;
                    if (ePokemonStorageSystem.unk_08b2 < 0)
                        ePokemonStorageSystem.unk_08b2 = 13;
                    sub_8099C70(ePokemonStorageSystem.unk_08b2);
                    ePokemonStorageSystem.unk_0004 = 2;
                    break;
                case 11:
                    if (!sub_809BE80())
                    {
                        if (ItemIsMail(ePokemonStorageSystem.unk_11f2))
                        {
                            ePokemonStorageSystem.unk_0004 = 5;
                        }
                        else
                        {
                            PlaySE(SE_SELECT);
                            SetPSSCallback(sub_809746C);
                        }
                    }
                    else
                    {
                        ePokemonStorageSystem.unk_0004 = 4;
                    }
                    break;
                case 13:
                    if (sub_809BE80())
                    {
                        ePokemonStorageSystem.unk_0004 = 4;
                    }
                    else
                    {
                        PlaySE(SE_SELECT);
                        SetPSSCallback(sub_80972A8);
                    }
                    break;
                case 14:
                    if (!sub_809BEBC())
                    {
                        ePokemonStorageSystem.unk_0004 = 4;
                    }
                    else
                    {
                        PlaySE(SE_SELECT);
                        SetPSSCallback(c3_0808DC50);
                    }
                    break;
                case 12:
                    PlaySE(SE_SELECT);
                    SetPSSCallback(sub_8097390);
                    break;
                case 15:
                    PlaySE(SE_SELECT);
                    SetPSSCallback(sub_80972FC);
                    break;
            }
            break;
        case 1:
            if (!sub_809AC00())
            {
                if (sub_809BF48())
                    sub_80986E8();
                else
                    sub_8098710();
                if (ePokemonStorageSystem.unk_11f6)
                    BoxSetMosaic();
                ePokemonStorageSystem.unk_0004 = 0;
            }
            break;
        case 2:
            if (!sub_8099D34())
            {
                gPokemonStorage.currentBox = ePokemonStorageSystem.unk_08b2;
                if (!gUnknown_0203847C && !sub_809BF20())
                {
                    sub_809B440();
                    BoxSetMosaic();
                }
                ePokemonStorageSystem.unk_0004 = 0;
            }
            break;
        case 3:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
            {
                sub_8098A5C();
                ePokemonStorageSystem.unk_0004 = 0;
            }
            break;
        case 4:
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_LAST_POKE);
            ePokemonStorageSystem.unk_0004 = 6;
            break;
        case 5:
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_PLEASE_REMOVE_MAIL);
            ePokemonStorageSystem.unk_0004 = 6;
            break;
        case 6:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
            {
                sub_8098A5C();
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_8096FC8(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            sub_809880C();
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!sub_8098830())
                SetPSSCallback(sub_8096C84);
            break;
    }
}

void sub_8097004(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            PlaySE(SE_SELECT);
            add_to_c3_somehow();
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!sub_80985CC())
            {
                sub_809B0C0(sub_809B0F4());
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 2:
            if (!sub_809AC00())
            {
                if (ePokemonStorageSystem.unk_11f6)
                    BoxSetMosaic();
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_8097078(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            PrintStorageActionText(PC_TEXT_IS_SELECTED);
            sub_809CE84();
            ePokemonStorageSystem.unk_0004 = 1;
            break;
        case 1:
            switch (sub_809CF30())
            {
                case -1:
                case  0:
                    sub_8098A5C();
                    SetPSSCallback(sub_8096C84);
                    break;
                case 3:
                    if (sub_809BE80())
                    {
                        ePokemonStorageSystem.unk_0004 = 2;
                    }
                    else
                    {
                        PlaySE(SE_SELECT);
                        sub_8098A5C();
                        SetPSSCallback(sub_80972A8);
                    }
                    break;
                case 5:
                    PlaySE(SE_SELECT);
                    sub_8098A5C();
                    SetPSSCallback(sub_80972FC);
                    break;
                case 4:
                    if (!sub_809BEBC())
                    {
                        ePokemonStorageSystem.unk_0004 = 2;
                    }
                    else
                    {
                        PlaySE(SE_SELECT);
                        sub_8098A5C();
                        SetPSSCallback(c3_0808DC50);
                    }
                    break;
                case 2:
                    PlaySE(SE_SELECT);
                    sub_8098A5C();
                    SetPSSCallback(sub_8097390);
                    break;
                case 1:
                    if (sub_809BE80())
                    {
                        ePokemonStorageSystem.unk_0004 = 2;
                    }
                    else if (ItemIsMail(ePokemonStorageSystem.unk_11f2))
                    {
                        ePokemonStorageSystem.unk_0004 = 3;
                    }
                    else
                    {
                        PlaySE(SE_SELECT);
                        sub_8098A5C();
                        SetPSSCallback(sub_809746C);
                    }
                    break;
                case 7:
                    if (sub_809BE80())
                    {
                        ePokemonStorageSystem.unk_0004 = 2;
                    }
                    else if (ePokemonStorageSystem.unk_11f9)
                    {
                        ePokemonStorageSystem.unk_0004 = 4;
                    }
                    else if (ItemIsMail(ePokemonStorageSystem.unk_11f2))
                    {
                        ePokemonStorageSystem.unk_0004 = 3;
                    }
                    else
                    {
                        PlaySE(SE_SELECT);
                        SetPSSCallback(sub_8097594);
                    }
                    break;
                case 6:
                    PlaySE(SE_SELECT);
                    SetPSSCallback(sub_8097788);
                    break;
                case 8:
                    PlaySE(SE_SELECT);
                    SetPSSCallback(sub_80977E4);
                    break;
            }
            break;
        case 2:
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_LAST_POKE);
            ePokemonStorageSystem.unk_0004 = 5;
            break;
        case 4:
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_CANT_RELEASE_EGG);
            ePokemonStorageSystem.unk_0004 = 5;
            break;
        case 3:
            PlaySE(SE_HAZURE);
            PrintStorageActionText(PC_TEXT_PLEASE_REMOVE_MAIL);
            ePokemonStorageSystem.unk_0004 = 5;
            break;
        case 5:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
            {
                sub_8098A5C();
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_80972A8(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            sub_809B100(0);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!sub_809B130())
            {
                if (gUnknown_0203847C)
                    SetPSSCallback(sub_8097858);
                else
                    SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_80972FC(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            sub_809B100(1);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!sub_809B130())
            {
                if (gUnknown_0203847C)
                    SetPSSCallback(sub_8097858);
                else
                    SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void c3_0808DC50(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            sub_809B100(2);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!sub_809B130())
            {
                BoxSetMosaic();
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_8097390(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            if (CalculatePlayerPartyCount() == 6)
            {
                PrintStorageActionText(PC_TEXT_PARTY_FULL);
                ePokemonStorageSystem.unk_0004 = 1;
            }
            else
            {
                sub_809B0E0();
                sub_809B100(0);
                ePokemonStorageSystem.unk_0004 = 2;
            }
            break;
        case 1:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
            {
                sub_8098A5C();
                SetPSSCallback(sub_8096C84);
            }
            break;
        case 2:
            if (!sub_809B130())
            {
                sub_809880C();
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 3:
            if (!sub_8098830())
            {
                sub_809B100(1);
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 4:
            if (!sub_809B130())
            {
                sub_80987DC();
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 5:
            SetPSSCallback(sub_8097004);
            break;
    }
}

void sub_809746C(void)
{
    u8 r4;

    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            PrintStorageActionText(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
            sub_8096264(&ePokemonStorageSystem.unk_2370, 0x0007, 0xdaca, 3);
            sub_809634C(gUnknown_0203847E);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            r4 = sub_8096368();
            if (r4 == 200);
            else if (r4 == 201)
            {
                sub_8098A5C();
                sub_809635C();
                sub_8096310();
                SetPSSCallback(sub_8096C84);
            }
            else
            {
                if (sub_809B62C(r4))
                {
                    sub_8098A5C();
                    sub_809635C();
                    sub_8096310();
                    ePokemonStorageSystem.unk_0004 = 2;
                }
                else
                {
                    PrintStorageActionText(PC_TEXT_BOX_IS_FULL);
                    ePokemonStorageSystem.unk_0004 = 4;
                }
                gUnknown_0203847E = r4;
            }
            break;
        case 2:
            party_compaction();
            sub_8099310();
            ePokemonStorageSystem.unk_0004++;
            break;
        case 3:
            if (!sub_8099374())
            {
                sub_809B6BC();
                BoxSetMosaic();
                sub_80987DC();
                SetPSSCallback(sub_8096C84);
            }
            break;
        case 4:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                PrintStorageActionText(PC_TEXT_DEPOSIT_IN_WHICH_BOX);
                ePokemonStorageSystem.unk_0004 = 1;
            }
            break;
    }
}

void sub_8097594(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            PrintStorageActionText(PC_TEXT_RELEASE_POKE);
            sub_8098A38(1);
            ePokemonStorageSystem.unk_0004++;
            // fallthrough
        case 1:
            switch (ProcessMenuInputNoWrap())
            {
                case -1:
                case  1:
                    sub_8098A5C();
                    SetPSSCallback(sub_8096C84);
                    break;
                case  0:
                    sub_8098A5C();
                    sub_809B7D4();
                    sub_809B6DC();
                    ePokemonStorageSystem.unk_0004++;
                    break;
            }
            break;
        case 2:
            sub_809B960();
            if (!sub_809B734())
            {
                while (1)
                {
                    s8 r0 = sub_809B960();
                    if (r0 == 1)
                    {
                        ePokemonStorageSystem.unk_0004++;
                        break;
                    }
                    if (r0 == 0)
                    {
                        ePokemonStorageSystem.unk_0004 = 8;
                        break;
                    }
                }
            }
            break;
        case 3:
            sub_809B760();
            sub_809801C();
            PrintStorageActionText(PC_TEXT_WAS_RELEASED);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 4:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                PrintStorageActionText(PC_TEXT_BYE_BYE);
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 5:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                sub_8098A5C();
                if (gUnknown_0203847C)
                {
                    party_compaction();
                    sub_8099310();
                    ePokemonStorageSystem.unk_0004++;
                }
                else
                {
                    ePokemonStorageSystem.unk_0004 = 7;
                }
            }
            break;
        case 6:
            if (!sub_8099374())
            {
                sub_809B440();
                BoxSetMosaic();
                sub_80987DC();
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 7:
            SetPSSCallback(sub_8096C84);
            break;
        case 8:
            PrintStorageActionText(PC_TEXT_WAS_RELEASED);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 9:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                PrintStorageActionText(PC_TEXT_SURPRISE);
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 10:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                sub_8098A5C();
                sub_8099958();
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 11:
            if (!sub_8099990())
            {
                sub_809B7AC();
                PrintStorageActionText(PC_TEXT_CAME_BACK);
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 12:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                PrintStorageActionText(PC_TEXT_WORRIED);
                ePokemonStorageSystem.unk_0004++;
            }
            break;
        case 13:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                sub_8098A5C();
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_8097788(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            sub_809BC18();
            BeginNormalPaletteFade(0xffffffff, 0, 0, 16, 0);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                gUnknown_0203847F = 0;
                ePokemonStorageSystem.unk_0006 = 0;
                SetMainCallback2(sub_8096B5C);
            }
            break;
    }
}

void sub_80977E4(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            PrintStorageActionText(PC_TEXT_MARK_POKE);
            ePokemonStorageSystem.unk_12bc.markings = ePokemonStorageSystem.unk_11f7;
            sub_80F7418(ePokemonStorageSystem.unk_11f7, 0xb0, 0x10);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!sub_80F7500())
            {
                sub_80F7470();
                sub_8098A5C();
                sub_809BDD8(ePokemonStorageSystem.unk_12bc.markings);
                sub_809801C();
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_8097858(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            party_compaction();
            sub_8099310();
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!sub_8099374())
            {
                sub_80987DC();
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_809789C(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            PrintStorageActionText(PC_TEXT_WHAT_YOU_DO);
            sub_809CE84();
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            switch (sub_809CF30())
            {
                case -1:
                case  0:
                    sub_809A860(1);
                    sub_8098A5C();
                    SetPSSCallback(sub_8096C84);
                    break;
                case 11:
                    PlaySE(SE_SELECT);
                    SetPSSCallback(sub_8097B44);
                    break;
                case 10:
                    PlaySE(SE_SELECT);
                    sub_8098A5C();
                    SetPSSCallback(sub_8097974);
                    break;
                case 9:
                    PlaySE(SE_SELECT);
                    sub_8098A5C();
                    SetPSSCallback(sub_8097A64);
                    break;
            }
            break;
    }
}

void sub_8097974(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            sub_8098A80();
            PrintStorageActionText(PC_TEXT_PICK_A_THEME);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            ePokemonStorageSystem.unk_0d5e = sub_809CF30();
            switch (ePokemonStorageSystem.unk_0d5e)
            {
                case -1:
                    sub_809A860(1);
                    sub_8098A5C();
                    SetPSSCallback(sub_8096C84);
                    break;
                case 12 ... 15:
                    PlaySE(SE_SELECT);
                    ePokemonStorageSystem.unk_0d5e -= 12;
                    sub_8098AA8(ePokemonStorageSystem.unk_0d5e);
                    PrintStorageActionText(PC_TEXT_PICK_A_WALLPAPER);
                    ePokemonStorageSystem.unk_0004++;
                    break;
            }
            break;
        case 2:
            ePokemonStorageSystem.unk_0d60 = sub_809CF30();
            switch (ePokemonStorageSystem.unk_0d60)
            {
                case -1:
                    sub_8098A5C();
                    ePokemonStorageSystem.unk_0004 = 0;
                    break;
                case -2:
                    break;
                default:
                    PlaySE(SE_SELECT);
                    sub_8098A5C();
                    ePokemonStorageSystem.unk_0d60 -= 16;
                    sub_8099DCC(ePokemonStorageSystem.unk_0d60);
                    ePokemonStorageSystem.unk_0004++;
                    break;
            }
            break;
        case 3:
            if (!sub_8099E08())
            {
                sub_809A860(1);
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_8097A64(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            PrintStorageActionText(PC_TEXT_JUMP_TO_WHICH_BOX);
            sub_8096264(&ePokemonStorageSystem.unk_2370, 0x0007, 0xdaca, 3);
            sub_809634C(gPokemonStorage.currentBox);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            ePokemonStorageSystem.unk_08b2 = sub_8096368();
            switch (ePokemonStorageSystem.unk_08b2)
            {
                case 200:
                    break;
                default:
                    sub_8098A5C();
                    sub_809635C();
                    sub_8096310();
                    if (ePokemonStorageSystem.unk_08b2 == 201 || ePokemonStorageSystem.unk_08b2 == gPokemonStorage.currentBox)
                    {
                        sub_809A860(1);
                        SetPSSCallback(sub_8096C84);
                    }
                    else
                    {
                        ePokemonStorageSystem.unk_0004++;
                    }
                    break;
            }
            break;
        case 2:
            sub_8099C70(ePokemonStorageSystem.unk_08b2);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 3:
            if (!sub_8099D34())
            {
                gPokemonStorage.currentBox = ePokemonStorageSystem.unk_08b2;
                SetPSSCallback(sub_8096C84);
            }
            break;
    }
}

void sub_8097B44(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            sub_809BB90();
            BeginNormalPaletteFade(0xffffffff, 0, 0, 16, 0);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 1:
            if (!UpdatePaletteFade())
            {
                gUnknown_0203847F = 1;
                ePokemonStorageSystem.unk_0006 = 1;
                SetMainCallback2(sub_8096B5C);
            }
            break;
    }
}

void sub_8097BA0(void)
{
    switch (ePokemonStorageSystem.unk_0004)
    {
        case 0:
            if (sub_809BF20())
            {
                PlaySE(SE_HAZURE);
                PrintStorageActionText(PC_TEXT_HOLDING_POKE);
                ePokemonStorageSystem.unk_0004 = 1;
            }
            else
            {
                PlaySE(SE_SELECT);
                PrintStorageActionText(PC_TEXT_EXIT_BOX);
                sub_8098A38(0);
                ePokemonStorageSystem.unk_0004 = 2;
            }
            break;
        case 1:
            if (gMain.newKeys & (A_BUTTON | B_BUTTON | DPAD_ANY))
            {
                sub_8098A5C();
                SetPSSCallback(sub_8096C84);
            }
            break;
        case 2:
            switch (ProcessMenuInputNoWrap())
            {
                case 1:
                case -1:
                    sub_8098A5C();
                    SetPSSCallback(sub_8096C84);
                    break;
                case 0:
                    PlaySE(SE_PC_OFF);
                    sub_8098A5C();
                    ePokemonStorageSystem.unk_0004++;
                    break;
            }
            break;
        case 3:
            ePokemonStorageSystem.unk_000c.tileTag = 0x000e;
            ePokemonStorageSystem.unk_000c.paletteTag = 0xdad0;
            ePokemonStorageSystem.unk_000c.unk04 = 20;
            ePokemonStorageSystem.unk_000c.unk06 = 0;
            sub_80C5E38(&ePokemonStorageSystem.unk_000c);
            ePokemonStorageSystem.unk_0004++;
            break;
        case 4:
            if (sub_80C5F98())
            {
                gPlayerPartyCount = CalculatePlayerPartyCount();
                SetMainCallback2(sub_80961A8);
            }
            break;
    }
}

asm(".section .text.8098898");

void PrintStorageActionText(u8 index) {
    u8 *ptr;

    MenuDrawTextWindow(10, 16, 29, 19);

    switch (gPCStorageActionTexts[index].format)
    {

    case PC_TEXT_FMT_UNK_02:
        ptr = StringCopy(ePokemonStorageSystem.unk_2694, gPCStorageActionTexts[index].text);
        ptr = StringCopy(ptr, ePokemonStorageSystem.unk_11fa);
        break;

    case PC_TEXT_FMT_UNK_05:
        ptr = StringCopy(ePokemonStorageSystem.unk_2694, gPCStorageActionTexts[index].text);
        ptr = StringCopy(ptr, ePokemonStorageSystem.unk_26e4);
        break;

    case PC_TEXT_FMT_MON_NAME:
        // {var} + " is selected."
        ptr = StringCopy(ePokemonStorageSystem.unk_2694, ePokemonStorageSystem.unk_11fa);
        ptr = StringCopy(ptr, gPCStorageActionTexts[index].text);
        break;

    case PC_TEXT_FMT_MON_NAME_2:
        // {var} + " was released."
        ptr = StringCopy(ePokemonStorageSystem.unk_2694, ePokemonStorageSystem.unk_26e4);
#if ENGLISH
        ptr = StringCopy(ptr, gPCStorageActionTexts[index].text);
#elif GERMAN
        ptr = de_sub_8073174(ePokemonStorageSystem.unk_2694, gPCStorageActionTexts[index].text);
#endif
        break;

    case PC_TEXT_FMT_UNK_03:
    {
        u8 *stringLength;
        u8 *text;

        text = gPCStorageActionTexts[index].text;
        stringLength = &text[StringLength(text)] + 1;

        ptr = StringCopy(ePokemonStorageSystem.unk_2694, gPCStorageActionTexts[index].text);
        ptr = StringCopy(ptr, ePokemonStorageSystem.unk_11fa);
        ptr = StringCopy(ptr, stringLength);
    }
        break;

    case PC_TEXT_FMT_MON_NAME_AFTER_EXCL_MARK:
        // "Bye-bye, ".substr(0, -1) + {var} + "Bye-bye, !".substr(-1, 1)
    {
        u8 *stringLength;
        u8 *text;

        text = gPCStorageActionTexts[index].text;
        stringLength = &text[StringLength(text)] - 1;

        ptr = StringCopy(ePokemonStorageSystem.unk_2694, gPCStorageActionTexts[index].text);
        ptr = StringCopy(ptr - 1, ePokemonStorageSystem.unk_26e4);
        ptr = StringCopy(ptr, stringLength);
    }
        break;

    case PC_TEXT_FMT_NORMAL:
    default:
        ptr = StringCopy(ePokemonStorageSystem.unk_2694, gPCStorageActionTexts[index].text);
        break;
    }

    while (ptr < ePokemonStorageSystem.unk_26a6)
    {
            ptr[0] = CHAR_SPACE;
            ptr++;
    }

    ptr[0] = EOS;
    MenuPrint(ePokemonStorageSystem.unk_2694, 11, 17);
}
