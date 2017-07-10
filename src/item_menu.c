#include "global.h"
#include "berry_tag_screen.h"
#include "data2.h"
#include "decompress.h"
#include "field_effect.h"
#include "field_map_obj_helpers.h"
#include "field_player_avatar.h"
#include "graphics.h"
#include "item.h"
#include "items.h"
#include "item_menu.h"
#include "item_use.h"
#include "link.h"
#include "mail_data.h"
#include "main.h"
#include "map_name_popup.h"
#include "menu.h"
#include "menu_cursor.h"
#include "menu_helpers.h"
#include "money.h"
#include "palette.h"
#include "party_menu.h"
#include "player_pc.h"
#include "pokemon_menu.h"
#include "rom4.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "strings.h"
#include "strings2.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "unknown_task.h"

extern u8 ewram[];

struct UnknownStruct1
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
};

struct UnknownStruct2
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
};

struct UnknownStruct3
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
};

struct UnknownStruct4
{
    u8 unk0;
    u8 unk1;
    u16 unk2;
    const u8 *unk4;
    TaskFunc unk8;
};

struct UnknownStruct5
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
};

extern struct UnknownStruct2 gUnknown_0203853C;
extern struct UnknownStruct3 gUnknown_02038540;
extern struct UnknownStruct4 gUnknown_02038544;
extern struct UnknownStruct5 gUnknown_02038550;
extern u8 gUnknown_02038554;
extern u8 gUnknown_02038558;
extern s8 gUnknown_02038559;  // selected pocket
extern u8 gUnknown_0203855A;
extern s8 gUnknown_0203855B;
extern s8 gUnknown_0203855C;
extern u8 gUnknown_02038560;
extern u8 gUnknown_02038561;
extern u8 gUnknown_02038562;
extern u8 gUnknown_02038563;
extern u8 gUnknown_02038564;
extern void (*gUnknown_03005D00)(u8);
extern u8 gUnknown_03000700;
extern u8 gUnknown_03000701;
extern const u8 *gUnknown_03000704;
extern struct UnknownStruct1 gUnknown_03005D10[];
extern struct ItemSlot *gUnknown_03005D24;  // selected pocket item slots
extern const u8 Event_NoRegisteredItem[];

extern void gpu_pal_allocator_reset__manage_upper_four(void);
extern void sub_80F9020(void);
extern void sub_80F9988();
extern void sub_809D104(u16 *, u16, u16, const u8 *, u16, u16, u16, u16);
extern void PauseVerticalScrollIndicator();
extern u8 sub_80F9284(void);
extern void sub_808B5B4();
extern u8 sub_80F92F4();
extern void sub_80C9C7C(u8);
extern void pal_fill_black(void);
extern bool8 sub_807D770(void);
extern u8 sub_80F931C();
extern void sub_808A3F8(u8);
extern void sub_80B3050(void);
extern void sub_80546B8(u8);
extern void sub_804E990(u8);
extern void sub_802E424(u8);

#define ewram1E000 ((struct ItemSlot *)(ewram + 0x1E000))  // saved items pocket (for Wally battle)
#define ewram1F000 ((struct ItemSlot *)(ewram + 0x1F000))  // saved Pokeballs pocket (for Wally battle)

extern const struct CompressedSpriteSheet gUnknown_083C1CC8;
extern const struct CompressedSpriteSheet gUnknown_083C1CD0;
extern const struct CompressedSpritePalette gUnknown_083C1CD8;

const struct BagPocket gBagPockets[NUM_BAG_POCKETS] =
{
    // pointer to items, capacity
    {gSaveBlock1.bagPocket_Items, 20},
    {gSaveBlock1.bagPocket_PokeBalls, 16},
    {gSaveBlock1.bagPocket_TMHM, 64},
    {gSaveBlock1.bagPocket_Berries, 46},
    {gSaveBlock1.bagPocket_KeyItems, 20},
};

void sub_80A5B78(u8);
void sub_80A5F14(u8);
void sub_80A5F80(u8);
void sub_80A5FAC(u8);
void ItemMenu_UseInBattle(u8);
void sub_80A7124(u8);
void ItemMenu_Give(u8);
void sub_80A6178(u8);
void sub_80A69E0(u8);

const struct MenuAction2 gUnknown_083C1640[] =
{
    {OtherText_Use, sub_80A5B78},
    {OtherText_Toss, sub_80A5F14},
    {gOtherText_CancelNoTerminator, sub_80A5F80},
    {OtherText_Register, sub_80A5FAC},
    {OtherText_Use, ItemMenu_UseInBattle},
    {gOtherText_CancelNoTerminator, sub_80A7124},
    {OtherText_Give2, ItemMenu_Give},
    {OtherText_CheckTag, sub_80A6178},
    {gOtherText_CancelWithTerminator, NULL},
    {OtherText_Confirm, sub_80A69E0},
};

const u8 gUnknown_083C1690[][6] =
{
    {0, 1, 6, 2, 0, 0},
    {6, 1, 8, 2, 0, 0},
    {0, 8, 6, 2, 0, 0},
    {7, 0, 1, 8, 6, 2},
    {0, 8, 3, 2, 0, 0},
};

const u8 gUnknown_083C16AE[][2] =
{
    {6, 2},
    {6, 2},
    {6, 2},
    {6, 2},
    {2, 0},
};

const u8 gUnknown_083C16B8[] = {7, 9, 8, 2};

void sub_80A59D0(u8);
void sub_80A599C(u8);
void sub_80A61EC(u8);
void sub_80A6214(u8);
void sub_80A631C(u8);
void sub_80A6354(u8);
void sub_80A68F0(u8);
void sub_80A6918(u8);
void sub_80A69B8(u8);
void sub_80A6A4C(u8);
void sub_80A6C6C(u8);
void sub_80A7024(u8);
void sub_80A70D8(u8);

const TaskFunc gUnknown_083C16BC[][2] =
{
    {sub_80A59D0, sub_80A599C},
    {sub_80A7024, sub_80A70D8},
    {sub_80A6214, sub_80A61EC},
    {sub_80A6354, sub_80A631C},
    {sub_80A6918, sub_80A68F0},
    {sub_80A59D0, sub_80A69B8},
    {sub_80A6C6C, sub_80A6A4C},
};

void sub_80A5E60(u8);
void sub_80A5E90(u8);

const struct YesNoFuncTable gUnknown_083C16F4 = {sub_80A5E60, sub_80A5E90};

void sub_80A65AC(u8);
void sub_80A6618(u8);

const struct YesNoFuncTable gUnknown_083C16FC = {sub_80A65AC, sub_80A6618};

void sub_80A34E8(void);
bool8 sub_80A3520(void);
void sub_80A362C(void);
void sub_80A3740(void);
void sub_80A396C(u16 *, u8, u8, u8);
void sub_80A39B8(u16 *, u8);
void sub_80A39E4(u16 *, u8, u8, s8);
void sub_80A3AC0(u16 *, u8);
void SortItemSlots(struct BagPocket);
void sub_80A3D08(void);
void sub_80A3D24(u8);
void sub_80A3D40(void);
void sub_80A40D0(void);
void sub_80A48E8(u16, int, int);
void ItemListMenu_InitDescription(s16);
void ItemListMenu_ChangeDescription(s16, int);
void sub_80A4F68(u8);
void sub_80A50C8(u8);
void sub_80A5AE4(u8);
void sub_80A5BF8(u8);
void Task_CallItemUseOnFieldCallback(u8);
void HandleItemMenuPaletteFade(u8);
void sub_80A6444(u8);
void sub_80A648C(u8);
void Task_BuyHowManyDialogueHandleInput(u8);
void sub_8064E2C(void);
void BuyMenuPrintItemQuantityAndPrice(u8);
void BuyMenuDisplayMessage(u16, u16);
void sub_80A683C(void);
void sub_80A6870(u16, u8);
void sub_80A699C(void);
void sub_80A7230(u8);
void ItemListMenu_InitMenu(void);
void sub_80A73C0(void);
void sub_80A73F0(void);
void sub_80A73FC(void);
void sub_80A740C(void);
void sub_80A7420(void);
void sub_80A751C(void);
void sub_80A7528(u8);
void sub_80A7590(void);
void sub_80A75E4(void);
void sub_80A7630(void);
void sub_80A763C(void);
void sub_80A76A0(void);
void sub_80A770C(void);
void DisplayCannotUseItemMessage(int, const u8 *, TaskFunc, int);
void sub_80A7768(void);
void sub_80A7828(void);
void sub_80A7834(int, int);
bool32 sub_80A78A0(void);
void sub_80A78B8(void);
bool32 sub_80A78C4(void);
void sub_80A78E8(void);
int sub_80A78F4(void);
void sub_80A7918(void);
int sub_80A7924(void);
int sub_80A7958(void);
void sub_80A7970(void);
void sub_80A797C(void);
int sub_80A7988(void);
void sub_80A79B4(struct Sprite *);
void sub_80A79EC(struct Sprite *);
void sub_80A7A94(struct Sprite *);
void CreateBagSprite(void);
void CreateBagPokeballSprite();
void sub_80A7C64(void);

void sub_80A3118(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    sub_80A740C();
    UpdatePaletteFade();
}

void sub_80A3134(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    {
        const void *src = gBGTilemapBuffers[1];
        void *dst = (void *)(VRAM + 0x2000);

        DmaCopy16(3, src, dst, 0x800);
    }

    {
        const void *src = gBGTilemapBuffers[2];
        void *dst = (void *)(VRAM + 0x6000);

        DmaCopy16(3, src, dst, 0x800);
    }
}

bool8 sub_80A317C(void)
{
    u32 val;
    u16 savedIme;

    switch (gMain.state)
    {
    case 0:
        sub_80F9438();
        sub_80A34E8();
        gMain.state++;
        break;
    case 1:
        remove_some_task();
        gMain.state++;
        break;
    case 2:
        gpu_pal_allocator_reset__manage_upper_four();
        gMain.state++;
        break;
    case 3:
        sub_80F9020();
        ewram[0x1FFFF] = 0;
        gMain.state++;
        break;
    case 4:
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = TRUE;
        gMain.state++;
        break;
    case 5:
        ResetSpriteData();
        gMain.state++;
        break;
    case 6:
        if (sub_80A3520() == FALSE)
            break;
        gMain.state++;
        break;
    case 7:
        SetUpWindowConfig(&gWindowConfig_81E6DFC);
        gMain.state++;
        break;
    case 8:
        MultistepInitMenuWindowBegin(&gWindowConfig_81E6DFC);
        gMain.state++;
        break;
    case 9:
        if (!MultistepInitMenuWindowContinue())
            break;
        gMain.state++;
        break;
    case 10:
        sub_80F944C();
        LoadScrollIndicatorPalette();
        CreateVerticalScrollIndicators(0, 172, 12);
        CreateVerticalScrollIndicators(1, 172, 148);
        CreateVerticalScrollIndicators(2, 28, 88);
        CreateVerticalScrollIndicators(3, 100, 88);
        sub_80F9988(0, 2);
        sub_80F9988(1, 2);
        sub_80F9988(2, 2);
        sub_80F9988(3, 2);
        if (gUnknown_03000701 == 4 || gUnknown_03000701 == 5)
        {
            sub_80F979C(2, 1);
            sub_80F979C(3, 1);
        }
        gMain.state++;
        break;
    case 11:
        gUnknown_0203855A = 16;
        sub_80A39B8(gBGTilemapBuffers[2], gUnknown_02038559 + 1);
        sub_80A3AC0(gBGTilemapBuffers[2], gUnknown_02038559);
        sub_80A3D08();
        SortItemSlots(gBagPockets[2]);
        SortItemSlots(gBagPockets[3]);
        sub_80A3D40();
        gUnknown_03005D24 = gBagPockets[gUnknown_02038559].itemSlots;
        sub_80A362C();
        gMain.state++;
        break;
    case 12:
        sub_80A48E8(0xFFFF, 0, 7);
        val = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0;
        ItemListMenu_InitDescription(gUnknown_03005D24[val].itemId);
        ItemListMenu_InitMenu();
        gUnknown_0203855B = gUnknown_02038559 + 1;
        gUnknown_0203855C = 0;
        gMain.state++;
        break;
    case 13:
        CreateBagSprite();
        CreateBagPokeballSprite(0);
        sub_80A3740();
        gMain.state++;
        break;
    case 14:
        savedIme = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = savedIme;
        REG_DISPSTAT |= 8;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        gPaletteFade.bufferTransferDisabled = FALSE;
        gMain.state++;
        break;
    case 15:
        if (sub_8055870() == TRUE)
            break;
        gMain.state++;
        break;
    case 16:
        SetVBlankCallback(sub_80A3134);
        SetMainCallback2(sub_80A3118);
        sub_80A751C();
        sub_80A7630();
        sub_80A770C();
        sub_80A7828();
        sub_80A78B8();
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80A34B4(void)
{
    while (1)
    {
        if (sub_80A317C() == TRUE)
        {
            gUnknown_03000700 = 0;
            ResetTasks();
            return TRUE;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
    return FALSE;
}


void sub_80A34E8(void)
{
    sub_80F9368();
    REG_BG2CNT = 0x0C06;
    REG_BG1CNT = 0x0405;
    REG_DISPCNT = 0x1740;
    REG_BLDCNT = 0;
}

bool8 sub_80A3520(void)
{
    switch (ewram[0x1FFFF])
    {
    case 0:
        LZDecompressVram(gBagScreen_Gfx, (void *)(VRAM + 0x4000));
        ewram[0x1FFFF]++;
        break;
    case 1:
        CpuCopy16(gUnknown_08E77004, gBGTilemapBuffers[2], 0x800);
        ewram[0x1FFFF]++;
        break;
    case 2:
        if (gSaveBlock2.playerGender == MALE || gUnknown_03000701 == 7)
            LoadCompressedPalette(gBagScreenMale_Pal, 0, 64);
        else
            LoadCompressedPalette(gBagScreenFemale_Pal, 0, 64);
        ewram[0x1FFFF]++;
        break;
    case 3:
        if (gSaveBlock2.playerGender == MALE || gUnknown_03000701 == 7)
            LoadCompressedObjectPic(&gUnknown_083C1CC8);
        else
            LoadCompressedObjectPic(&gUnknown_083C1CD0);
        ewram[0x1FFFF]++;
        break;
    case 4:
        LoadCompressedObjectPalette(&gUnknown_083C1CD8);
        ewram[0x1FFFF] = 0;
        return TRUE;
    }
    return FALSE;
}

void sub_80A362C(void)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        u8 r3;

        if (gUnknown_03000701 == 5)
            r3 = gUnknown_03005D10[i].unk2 - 1;
        else
            r3 = gUnknown_03005D10[i].unk2;

        if (gUnknown_03005D10[i].unk1 != 0)
        {
            if (gUnknown_03005D10[i].unk1 + gUnknown_03005D10[i].unk3 > r3)
                gUnknown_03005D10[i].unk1 = r3 - gUnknown_03005D10[i].unk3;
        }
        else
        {
            if (gUnknown_03005D10[i].unk0 > r3)
                gUnknown_03005D10[i].unk0 = r3;
        }
    }
}

void sub_80A3684(void)
{
    u16 i;

    for (i = 0; i < 5; i++)
    {
        gUnknown_03005D10[i].unk0 = 0;
        gUnknown_03005D10[i].unk1 = 0;
        gUnknown_03005D10[i].unk2 = 0;
        gUnknown_03005D10[i].unk3 = 0;
    }
    gUnknown_02038559 = 0;
}

void sub_80A36B8(u16 *a, u8 b, u8 c, u8 d, u8 e)
{
    u16 i;
    u16 j;

    for (i = c; i <= c + e; i++)
    {
        for (j = b; j <= b + d; j++)
        {
            u32 index = j + i * 32;

            a[index] = 0;
        }
    }
}

void ClearBag(void)
{
    u16 i;

    for (i = 0; i < 5; i++)
        ClearItemSlots(gBagPockets[i].itemSlots, gBagPockets[i].capacity);
    sub_80A3684();
}

void sub_80A3740(void)
{
    const u16 colors[2] = {RGB(14, 15, 16), RGB_WHITE};

    LoadPalette(&colors[1], 0xD1, sizeof(colors[1]));
    LoadPalette(&colors[0], 0xD8, sizeof(colors[0]));
}

void sub_80A3770(void)
{
    if (gUnknown_03000701 == 0)
    {
        gUnknown_03000704 = gUnknown_083C1690[gUnknown_02038559];
        if (gUnknown_02038559 != 3)
            gUnknown_02038564 = 4;
        else
            gUnknown_02038564 = 6;
    }
}

void sub_80A37C0(u8 taskId)
{
    gTasks[taskId].func = sub_80A50C8;
    StartVerticalScrollIndicators(0);
    StartVerticalScrollIndicators(1);
    StartVerticalScrollIndicators(2);
    StartVerticalScrollIndicators(3);
}

void sub_80A37F8(u8 taskId)
{
    u8 r5 = gUnknown_0203855A;

    if (r5 < 16)
    {
        gUnknown_0203855A++;
        sub_80A396C(gBGTilemapBuffers[2], r5, gUnknown_0203855A, 0x4F);
        sub_80A39E4(gBGTilemapBuffers[2], gUnknown_02038559 + 1, gUnknown_0203855A / 2, gTasks[taskId].data[5]);
        gUnknown_02038558 = 1;
        sub_80A48E8(taskId, r5 / 2, gUnknown_0203855A / 2 - 1);
        gUnknown_02038558 = 0;
        return;
    }

    if (gLinkOpen == TRUE)
    {
        u32 val = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0;

        ItemListMenu_ChangeDescription(gUnknown_03005D24[val].itemId, gUnknown_02038562);
        gUnknown_02038562++;
    }
    else
    {
        while (gUnknown_02038562 < 3)
        {
            u32 val = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0;

            ItemListMenu_ChangeDescription(gUnknown_03005D24[val].itemId, gUnknown_02038562);
            gUnknown_02038562++;
        }
    }
    if (gUnknown_02038562 == 3)
    {
        gUnknown_0203855A = 16;
        gUnknown_0203855B = gUnknown_02038559 + 1;
        sub_80A37C0(FindTaskIdByFunc(sub_80A4F68));
        DestroyTask(taskId);
        ItemListMenu_InitMenu();
        sub_80F979C(2, 0);
        sub_80F979C(3, 0);
    }
}

void sub_80A3954(u16 *a)
{
    CpuCopy16(gUnknown_08E77004, a, 0x800);
}

void sub_80A396C(u16 *a, u8 b, u8 c, u8 d)
{
    u16 *dst = a + 14 + (b + 2) * 32;
    u16 i;

    while (c > b++)
    {
        for (i = 0; i < 15; i++)
            dst[i] = d;
        dst += 32;
    }
}

void sub_80A39B8(u16 *a, u8 b)
{
    u8 var = b * 2;

    sub_809D104(a, 4, 10, gUnknown_08E96EC8, 0, var, 8, 2);
}

void sub_80A39E4(u16 *a, u8 b, u8 c, s8 d)
{
    u16 r2 = b * 2;
    u16 r7;

    if (d == -1)
    {
        r7 = (b + 1) * 2;
        if (b == 5)
            r7 = 2;

        sub_809D104(a, 4, 10, gUnknown_08E96EC8, 8 - c, r2, c, 2);
        sub_809D104(a, c + 4, 10, gUnknown_08E96EC8, 0, r7, 8 - c, 2);
    }
    else if (d == 1)
    {
        r7 = (b - 1) * 2;
        if (b == 1)
            r7 = 10;

        sub_809D104(a, 4, 10, gUnknown_08E96EC8, c, r7, 8 - c, 2);
        sub_809D104(a, 12 - c, 10, gUnknown_08E96EC8, 0, r2, c, 2);
    }
}

void sub_80A3AC0(u16 *a, u8 b)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (i == b)
            a[0x125 + i] = 0x107D;
        else
            a[0x125 + i] = 0x107C;
    }
}

void sub_80A3B04(u16 *a, s8 b)
{
    u8 taskId;

    gUnknown_02038559 += b;
    if (gUnknown_02038559 >= NUM_BAG_POCKETS)
        gUnknown_02038559 = 0;
    if (gUnknown_02038559 < 0)
        gUnknown_02038559 = NUM_BAG_POCKETS - 1;
    sub_80A76A0();
    sub_80A7590();
    gUnknown_03005D24 = gBagPockets[gUnknown_02038559].itemSlots;
    sub_80A3D24(gUnknown_02038559);
    gUnknown_0203855A = 0;
    sub_80A3954(a);
    sub_80A396C(a, 0, 16, 3);
    sub_80A39B8(a, 0);
    gUnknown_0203855B = 6;
    gUnknown_02038562 = 0;
    taskId = FindTaskIdByFunc(sub_80A37F8);
    if (taskId == 0xFF)
        taskId = CreateTask(sub_80A37F8, 8);
    gTasks[taskId].data[5] = b;
}

static void SwapItemSlots(struct ItemSlot *a, struct ItemSlot *b)
{
    struct ItemSlot temp = *a;

    *a = *b;
    *b = temp;
}

void RemoveEmptyItemSlots(struct BagPocket pocket)
{
    u16 i;
    u16 j;

    for (i = 0; i < pocket.capacity - 1; i++)
    {
        for (j = i + 1; j < pocket.capacity; j++)
        {
            if (pocket.itemSlots[i].quantity == 0)
                SwapItemSlots(&pocket.itemSlots[i], &pocket.itemSlots[j]);
        }
    }
}

void SortItemSlots(struct BagPocket pocket)
{
    u16 i;
    u16 j;

    for (i = 0; i < pocket.capacity; i++)
    {
        for (j = i + 1; j < pocket.capacity; j++)
        {
            if (pocket.itemSlots[i].quantity != 0 && pocket.itemSlots[j].quantity != 0
             && pocket.itemSlots[i].itemId > pocket.itemSlots[j].itemId)
                SwapItemSlots(&pocket.itemSlots[i], &pocket.itemSlots[j]);
        }
    }
}

void sub_80A3CA8(u8 pocketNum)
{
    u16 i;

    gUnknown_03005D10[pocketNum].unk2 = 0;
    for (i = 0; i < gBagPockets[pocketNum].capacity; i++)
    {
        if (gBagPockets[pocketNum].itemSlots[i].quantity != 0)
            gUnknown_03005D10[pocketNum].unk2++;
    }
    RemoveEmptyItemSlots(gBagPockets[pocketNum]);
}

void sub_80A3D08(void)
{
    u8 i;

    for (i = 0; i < NUM_BAG_POCKETS; i++)
        sub_80A3CA8(i);
}

void sub_80A3D24(u8 pocketNum)
{
    if (gUnknown_03005D10[pocketNum].unk2 >= 7)
        gUnknown_03005D10[pocketNum].unk3 = 7;
    else
        gUnknown_03005D10[pocketNum].unk3 = gUnknown_03005D10[pocketNum].unk2;
}

void sub_80A3D40(void)
{
    u8 i;

    for (i = 0; i < NUM_BAG_POCKETS; i++)
        sub_80A3D24(i);
}

void sub_80A3D5C(u8 taskId)
{
    u32 val = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0;

    gUnknown_03005D24[val].quantity -= gTasks[taskId].data[1];
    if (gUnknown_03005D24[val].quantity == 0)
    {
        if (gSaveBlock1.registeredItem == gUnknown_03005D24[val].itemId)
        {
            sub_80A40D0();
            gSaveBlock1.registeredItem = 0;
        }
        gUnknown_03005D24[val].itemId = 0;
        if (gUnknown_03005D10[gUnknown_02038559].unk1 + 7 == gUnknown_03005D10[gUnknown_02038559].unk2
         && gUnknown_03005D10[gUnknown_02038559].unk1 != 0)
            gUnknown_03005D10[gUnknown_02038559].unk1--;
        sub_80A3CA8(gUnknown_02038559);
    }
    sub_80A3D24(gUnknown_02038559);
}

void sub_80A3E0C(void)
{
    u32 val = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0;

    if (gUnknown_03005D24[val].quantity == 0)
    {
        gUnknown_03005D24[val].itemId = 0;
        if (gUnknown_03005D10[gUnknown_02038559].unk1 + 7 == gUnknown_03005D10[gUnknown_02038559].unk2
         && gUnknown_03005D10[gUnknown_02038559].unk1 != 0)
            gUnknown_03005D10[gUnknown_02038559].unk1--;
        sub_80A3CA8(gUnknown_02038559);
    }
    sub_80A3D24(gUnknown_02038559);
}

void nullsub_16(void)
{
}

void sub_80A3E70(u8 a, u8 b)
{
    struct ItemSlot temp = gUnknown_03005D24[a];

    gUnknown_03005D24[a] = gUnknown_03005D24[b];
    gUnknown_03005D24[b] = temp;
}

void sub_80A3E90(u8 taskId)
{
    PlaySE(SE_SELECT);
    nullsub_16();
    sub_80A3E70(
      gTasks[taskId].data[10] - 1,
      gUnknown_03005D10[gUnknown_02038559].unk0 + gUnknown_03005D10[gUnknown_02038559].unk1);
    gTasks[taskId].data[10] = 0;
    sub_80A763C();
    sub_80A7528(0);
    ItemListMenu_InitMenu();
}

void sub_80A3EF4(u8 taskId)
{
    u8 r2;

    PlaySE(SE_SELECT);
    nullsub_16();
    r2 = gTasks[taskId].data[10] - gUnknown_03005D10[gUnknown_02038559].unk1 - 1;
    gTasks[taskId].data[10] = 0;
    if (r2 < 8)
        sub_80A48E8(taskId, r2, r2);
    sub_80A7528(0);
}

void sub_80A3F50(u8 taskId)
{
    gTasks[taskId].data[10] = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 + 1;
    sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
    sub_80A7528(1);
}

void sub_80A3FA0(u16 *a, u8 b, u8 c, u8 d, u8 e, u16 f)
{
    s16 i;
    s16 j;

    for (i = c; i < c + e; i++)
    {
        for (j = b; j < b + d; j++)
        {
            u32 index = j + i * 32;

            a[index] = f;
        }
    }
}

void sub_80A4008(u16 *a, u8 b, u8 c, u8 d, u8 e)
{
    sub_80A3FA0(a, b, c, d, e, 1);
}

void sub_80A4030(u32 a)
{
    u16 *ptr1 = gBGTilemapBuffers[2] + 0x5A;

    ptr1 += a * 64;
    ptr1[0] = 0x5A;
    ptr1[1] = 0x5B;
    ptr1[2] = 0x5C;
    ptr1[32] = 0x6A;
    ptr1[33] = 0x6B;
    ptr1[34] = 0x6C;
}

void sub_80A405C(u8 a)
{
    u16 i;
    u16 *ptr;

    ptr = gBGTilemapBuffers[2] + 0x5A;
    for (i = 0; i < 16; i++)
    {
        ptr[0] = 0x4F;
        ptr[1] = 0x4F;
        ptr[2] = 0x4F;
        ptr += 32;
    }

    ptr = gBGTilemapBuffers[2] + 0x5A + a * 64;
    ptr[0] = 0x5A;
    ptr[1] = 0x5B;
    ptr[2] = 0x5C;
    ptr[32] = 0x6A;
    ptr[33] = 0x6B;
    ptr[34] = 0x6C;
}

void sub_80A40AC(u8 a)
{
    u16 *ptr = gBGTilemapBuffers[2] + 0x5A;

    ptr += a * 64;
    ptr[0] = 0x4F;
    ptr[1] = 0x4F;
    ptr[2] = 0x4F;
    ptr[32] = 0x4F;
    ptr[33] = 0x4F;
    ptr[34] = 0x4F;
}

void sub_80A40D0(void)
{
    u8 i;

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_03005D10[gUnknown_02038559].unk1 + i == gUnknown_03005D10[gUnknown_02038559].unk2)
            break;
        if (gUnknown_03005D24[gUnknown_03005D10[gUnknown_02038559].unk1 + i].itemId == gSaveBlock1.registeredItem)
        {
            sub_80A40AC(i);
            break;
        }
    }
}

void sub_80A413C(void)
{
    sub_80A40D0();
    sub_80A405C(gUnknown_03005D10[gUnknown_02038559].unk0);
}

void sub_80A4164(u8 *a, u16 b, enum StringConvertMode c, u8 d)
{
    *a++ = CHAR_MULT_SIGN;
    a[0] = EXT_CTRL_CODE_BEGIN;
    a[1] = 0x14;
    a[2] = 6;
    a += 3;
    ConvertIntToDecimalStringN(a, b, c, d);
}

void sub_80A418C(u16 a, enum StringConvertMode b, u8 c, u8 d, u8 e)
{
    sub_80A4164(gStringVar1, a, b, e);
    MenuPrint(gStringVar1, c, d);
}

void sub_80A41D4(u8 taskId)
{
    sub_80A763C();
}

void sub_80A41E0(u8 *a, u16 b, const u8 *c, u16 d, u8 e)
{
    a[0] = EXT_CTRL_CODE_BEGIN;
    a[1] = 0x13;
    a[2] = 8;
    a += 3;
    a = ConvertIntToDecimalStringN(a, b, STR_CONV_MODE_LEADING_ZEROS, 2);
    a[0] = EXT_CTRL_CODE_BEGIN;
    a[1] = 0x13;
    a[2] = 0x18;
    a += 3;
    a = sub_8072C74(a, c, 0x78 - (e + 1) * 6, 0);
    *a++ = CHAR_MULT_SIGN;
    sub_8072C14(a, d, 0x78, 1);
}

u8 *sub_80A425C(u8 taskId, u8 *text, u8 c)
{
    if (gTasks[taskId].data[10] - gUnknown_03005D10[gUnknown_02038559].unk1 - 1 == c)
    {
        text[0] = EXT_CTRL_CODE_BEGIN;
        text[1] = 1;
        text[2] = 2;
        text += 3;
    }
    return text;
}

bool8 sub_80A42B0(u8 a, int b)
{
    u8 r5;
    u16 *ptr;
    struct UnknownStruct3 *r8 = &gUnknown_02038540;

    if (gUnknown_03005D10[gUnknown_02038559].unk1 + a > gUnknown_03005D10[gUnknown_02038559].unk2)
        return TRUE;
    if (gUnknown_03005D10[gUnknown_02038559].unk1 + a == gUnknown_03005D10[gUnknown_02038559].unk2)
    {
        if (gUnknown_03000701 == 5)
            return TRUE;
        r5 = a * 2 + 2;
        sub_8072C74(gStringVar1, gOtherText_CloseBag, 0x78, 0);
        MenuPrint(gStringVar1, 14, r5);
        ptr = gBGTilemapBuffers[2] + 14 + r5 * 32;
        ptr[0] = 0x4F;
        ptr[1] = 0x4F;
        ptr[32] = 0x4F;
        ptr[33] = 0x4F;
        if (a == 7)
            return TRUE;
        if ((b == 1 && r8->unk2 != 0) || b == 2)
            MenuFillWindowRectWithBlankTile(14, r5 + 2, 29, 13);
        else
            MenuFillWindowRectWithBlankTile(14, r5 + 2, 29, 17);
        return TRUE;
    }
    return FALSE;
}

void sub_80A4380(u16 a, int b, int c, int d)
{
    u8 i;

    for (i = b; i <= c; i++)
    {
        u8 r4;
        u8 r5;
        u8 *text;

        if (sub_80A42B0(i, d) == TRUE)
            break;
        r4 = gUnknown_03005D10[gUnknown_02038559].unk1 + i;
        r5 = i * 2 + 2;
        text = gStringVar1;
        text = sub_80A425C(a, text, i);
        text = sub_8072C74(text, ItemId_GetItem(gUnknown_03005D24[r4].itemId)->name, 0x66, 0);
        *text++ = CHAR_MULT_SIGN;
        sub_8072C14(text, gUnknown_03005D24[r4].quantity, 0x78, 1);
        MenuPrint(gStringVar1, 14, r5);
    }
}

void sub_80A444C(u16 a, int b, int c, int d)
{
    u8 i;

    for (i = b; i <= c; i++)
    {
        u8 r4;
        u8 r5;
        u8 *text;

        if (sub_80A42B0(i, d) == TRUE)
            break;
        r4 = gUnknown_03005D10[gUnknown_02038559].unk1 + i;
        r5 = i * 2 + 2;
        text = gStringVar1;
        text = sub_80A425C(a, text, i);
#if ENGLISH
        sub_8072C74(text, ItemId_GetItem(gUnknown_03005D24[r4].itemId)->name, 0x60, 0);
#else
        sub_8072C74(text, ItemId_GetItem(gUnknown_03005D24[r4].itemId)->name, 0x63, 0);
#endif
        MenuPrint(gStringVar1, 14, r5);
        if (gUnknown_02038558 != 0)
        {
            if (gUnknown_03005D24[r4].itemId == gSaveBlock1.registeredItem)
                sub_80A4030(i);
        }
        else
        {
            if (gUnknown_03005D24[r4].itemId == gSaveBlock1.registeredItem)
                sub_80A405C(i);
            else
                sub_80A40AC(i);
        }
    }
}

// more gBGTilemapBuffers shenanigans
#ifdef NONMATCHING
void sub_80A4548(u16 a, int b, int c, int d)
{
    u8 i;

    for (i = b; i <= c; i++)
    {
        u8 r4;
        u8 sp10;
        u32 r5;
        u8 *text;

        if (sub_80A42B0(i, d) == TRUE)
            break;
        r4 = gUnknown_03005D10[gUnknown_02038559].unk1 + i;
        sp10 = i * 2 + 2;
        r5 = sp10 * 32 + 14;
        text = gStringVar1;
        text = sub_80A425C(a, text, i);
        if (gUnknown_03005D24[r4].itemId < 0x153)
        {
            const u8 *r2;

            gBGTilemapBuffers[2][r5 + 0] = 0x59;
            gBGTilemapBuffers[2][r5 + 1] = 0x4F;
            gBGTilemapBuffers[2][r5 + 32] = 0x69;
            gBGTilemapBuffers[2][r5 + 33] = 0x4F;
            r2 = gMoveNames[ItemIdToBattleMoveId(gUnknown_03005D24[r4].itemId)];
            sub_80A41E0(text, gUnknown_03005D24[r4].itemId - 288, r2, gUnknown_03005D24[r4].quantity, 2);
        }
        else
        {
            const u8 *moveName;

            gBGTilemapBuffers[2][r5 + 0] = 0x105D;
            gBGTilemapBuffers[2][r5 + 1] = 0x105E;
            gBGTilemapBuffers[2][r5 + 32] = 0x106D;
            gBGTilemapBuffers[2][r5 + 33] = 0x106E;
            text[0] = EXT_CTRL_CODE_BEGIN;
            text[1] = 0x13;
            text[2] = 0x11;
            text += 3;
            text = ConvertIntToDecimalString(text, gUnknown_03005D24[r4].itemId);
            text[0] = EXT_CTRL_CODE_BEGIN;
            text[1] = 0x13;
            text[2] = 0x18;
            text += 3;
            moveName = gMoveNames[ItemIdToBattleMoveId(gUnknown_03005D24[r4].itemId)];
            sub_8072C74(text, moveName, 0x78, 0);
        }
        MenuPrint(gStringVar1, 14, sp10);
    }
}
#else
__attribute__((naked))
void sub_80A4548(u16 a, int b, int c, int d)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x14\n\
    str r2, [sp, 0x8]\n\
    str r3, [sp, 0xC]\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    str r0, [sp, 0x4]\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    mov r8, r1\n\
    ldr r0, _080A456C @ =gBGTilemapBuffers + 0x1000\n\
    mov r9, r0\n\
    b _080A46C2\n\
    .align 2, 0\n\
_080A456C: .4byte gBGTilemapBuffers + 0x1000\n\
_080A4570:\n\
    ldr r1, _080A461C @ =gUnknown_03005D10\n\
    ldr r0, _080A4620 @ =gUnknown_02038559\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r4, [r0, 0x1]\n\
    add r4, r8\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    mov r1, r8\n\
    lsls r0, r1, 25\n\
    movs r3, 0x80\n\
    lsls r3, 18\n\
    adds r0, r3\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x10]\n\
    lsls r0, 5\n\
    adds r0, 0xE\n\
    adds r5, r0, 0\n\
    ldr r6, _080A4624 @ =gStringVar1\n\
    ldr r1, [sp, 0x4]\n\
    lsls r0, r1, 24\n\
    lsrs r0, 24\n\
    adds r1, r6, 0\n\
    mov r2, r8\n\
    bl sub_80A425C\n\
    adds r6, r0, 0\n\
    ldr r3, _080A4628 @ =gUnknown_03005D24\n\
    mov r10, r3\n\
    ldr r0, [r3]\n\
    lsls r7, r4, 2\n\
    adds r3, r7, r0\n\
    ldrh r1, [r3]\n\
    movs r0, 0xA9\n\
    lsls r0, 1\n\
    cmp r1, r0\n\
    bhi _080A4634\n\
    lsls r0, r5, 1\n\
    add r0, r9\n\
    movs r1, 0x59\n\
    strh r1, [r0]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 1\n\
    add r0, r9\n\
    movs r2, 0x4F\n\
    strh r2, [r0]\n\
    adds r0, r5, 0\n\
    adds r0, 0x20\n\
    lsls r0, 1\n\
    add r0, r9\n\
    movs r1, 0x69\n\
    strh r1, [r0]\n\
    adds r0, r5, 0\n\
    adds r0, 0x21\n\
    lsls r0, 1\n\
    add r0, r9\n\
    strh r2, [r0]\n\
    ldrh r0, [r3]\n\
    bl ItemIdToBattleMoveId\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0xD\n\
    adds r2, r0, 0\n\
    muls r2, r1\n\
    ldr r0, _080A462C @ =gMoveNames\n\
    adds r2, r0\n\
    mov r1, r10\n\
    ldr r0, [r1]\n\
    adds r0, r7, r0\n\
    ldr r3, _080A4630 @ =0xfffffee0\n\
    adds r1, r3, 0\n\
    ldrh r3, [r0]\n\
    adds r1, r3\n\
    lsls r1, 16\n\
    lsrs r1, 16\n\
    ldrh r3, [r0, 0x2]\n\
    movs r0, 0x2\n\
    str r0, [sp]\n\
    adds r0, r6, 0\n\
    bl sub_80A41E0\n\
    b _080A46AE\n\
    .align 2, 0\n\
_080A461C: .4byte gUnknown_03005D10\n\
_080A4620: .4byte gUnknown_02038559\n\
_080A4624: .4byte gStringVar1\n\
_080A4628: .4byte gUnknown_03005D24\n\
_080A462C: .4byte gMoveNames\n\
_080A4630: .4byte 0xfffffee0\n\
_080A4634:\n\
    lsls r0, r5, 1\n\
    add r0, r9\n\
    ldr r1, _080A46EC @ =0x0000105d\n\
    strh r1, [r0]\n\
    adds r0, r5, 0x1\n\
    lsls r0, 1\n\
    add r0, r9\n\
    adds r1, 0x1\n\
    strh r1, [r0]\n\
    adds r0, r5, 0\n\
    adds r0, 0x20\n\
    lsls r0, 1\n\
    add r0, r9\n\
    adds r1, 0xF\n\
    strh r1, [r0]\n\
    adds r0, r5, 0\n\
    adds r0, 0x21\n\
    lsls r0, 1\n\
    add r0, r9\n\
    adds r1, 0x1\n\
    strh r1, [r0]\n\
    movs r0, 0xFC\n\
    strb r0, [r6]\n\
    movs r4, 0x13\n\
    strb r4, [r6, 0x1]\n\
    movs r0, 0x11\n\
    strb r0, [r6, 0x2]\n\
    adds r6, 0x3\n\
    mov r1, r10\n\
    ldr r0, [r1]\n\
    adds r0, r7, r0\n\
    ldrh r1, [r0]\n\
    ldr r3, _080A46F0 @ =0xfffffeae\n\
    adds r1, r3\n\
    adds r0, r6, 0\n\
    bl ConvertIntToDecimalString\n\
    adds r6, r0, 0\n\
    movs r0, 0xFC\n\
    strb r0, [r6]\n\
    strb r4, [r6, 0x1]\n\
    movs r0, 0x18\n\
    strb r0, [r6, 0x2]\n\
    adds r6, 0x3\n\
    mov r1, r10\n\
    ldr r0, [r1]\n\
    adds r0, r7, r0\n\
    ldrh r0, [r0]\n\
    bl ItemIdToBattleMoveId\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0xD\n\
    muls r1, r0\n\
    ldr r0, _080A46F4 @ =gMoveNames\n\
    adds r1, r0\n\
    adds r0, r6, 0\n\
    movs r2, 0x78\n\
    movs r3, 0\n\
    bl sub_8072C74\n\
_080A46AE:\n\
    ldr r0, _080A46F8 @ =gStringVar1\n\
    movs r1, 0xE\n\
    ldr r2, [sp, 0x10]\n\
    bl MenuPrint\n\
    mov r0, r8\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
_080A46C2:\n\
    ldr r3, [sp, 0x8]\n\
    cmp r8, r3\n\
    bgt _080A46DA\n\
    mov r0, r8\n\
    ldr r1, [sp, 0xC]\n\
    bl sub_80A42B0\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    beq _080A46DA\n\
    b _080A4570\n\
_080A46DA:\n\
    add sp, 0x14\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080A46EC: .4byte 0x0000105d\n\
_080A46F0: .4byte 0xfffffeae\n\
_080A46F4: .4byte gMoveNames\n\
_080A46F8: .4byte gStringVar1\n\
    .syntax divided\n");
}
#endif

void sub_80A46FC(u16 a, int b, int c, int d)
{
    u8 i;

    for (i = b; i <= c; i++)
    {
        u8 r4;
        u8 r5;
        u8 *text;
        register int var asm("r0");

        if (sub_80A42B0(i, d) == TRUE)
            break;
        r4 = gUnknown_03005D10[gUnknown_02038559].unk1 + i;
        r5 = i * 2 + 2;

        var = 14 + r5 * 32;
        gBGTilemapBuffers[2][var] = 0x59;
        var += 32;
        gBGTilemapBuffers[2][var] = 0x69;

        text = gStringVar1;
        text = sub_80A425C(a, text, i);
        CopyItemName(gUnknown_03005D24[r4].itemId, gStringVar2);
        sub_80A41E0(text, gUnknown_03005D24[r4].itemId - 0x84, gStringVar2, gUnknown_03005D24[r4].quantity, 3);
        MenuPrint(gStringVar1, 14, r5);
    }
}

void sub_80A47E8(u16 a, int b, int c, int d)
{
    switch (gUnknown_02038559)
    {
    case 0:
    case 1:
        sub_80A4380(a, b, c, d);
        break;
    case 4:
        sub_80A444C(a, b, c, d);
        break;
    case 2:
        sub_80A4548(a, b, c, d);
        break;
    case 3:
        sub_80A46FC(a, b, c, d);
        break;
    }
    if (gUnknown_03005D10[gUnknown_02038559].unk1 != 0)
        sub_80F979C(0, 0);
    else
        sub_80F979C(0, 1);
    if ((gUnknown_03000701 != 5 && gUnknown_03005D10[gUnknown_02038559].unk1 + 8 < gUnknown_03005D10[gUnknown_02038559].unk2 + 1)
     || (gUnknown_03000701 == 5 && gUnknown_03005D10[gUnknown_02038559].unk1 + 8 < gUnknown_03005D10[gUnknown_02038559].unk2))
        sub_80F979C(1, 0);
    else
        sub_80F979C(1, 1);
}

void sub_80A48E8(u16 a, int b, int c)
{
    sub_80A47E8(a, b, c, 0);
}

void sub_80A48F8(u16 a)
{
    sub_80A47E8(a, 0, 5, 2);
}

void ItemListMenu_InitDescription(s16 itemId)
{
    u8 r5;

    if (gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 == gUnknown_03005D10[gUnknown_02038559].unk2)
    {
        r5 = sub_8072A18(gOtherText_ReturnTo, 4, 0x68, 0x68, 1);
        r5 += sub_8072A18(gUnknown_0840E740[gUnknown_03000701], 4, 0x78, 0x68, 1);
    }
    else
    {
        r5 = sub_8072A18(ItemId_GetDescription(itemId), 4, 0x68, 0x68, 1);
    }

    if (r5 < 3)
        MenuZeroFillWindowRect(0, 13 + r5 * 2, 13, 20);
}

void ItemListMenu_ChangeDescription(s16 itemId, int b)
{
    u8 description[100];

    if (gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 == gUnknown_03005D10[gUnknown_02038559].unk2)
    {
        if (b == 0)
        {
            MenuZeroFillWindowRect(0, 13, 13, 20);
            MenuPrint_PixelCoords(gOtherText_ReturnTo, 4, 0x68, 0);
        }
        else if (b == 1)
        {
            MenuPrint_PixelCoords(gUnknown_0840E740[gUnknown_03000701], 4, 0x78, 0);
        }
    }
    else
    {
        if (b == 0)
            MenuZeroFillWindowRect(0, 13, 13, 20);
        if (ItemId_CopyDescription(description, itemId, b))
            MenuPrint_PixelCoords(description, 4, 104 + b * 16, 0);
    }
}

bool32 sub_80A4A54(u8 *a, const u8 *b, u32 c)
{
    u32 r4 = c + 1;
    const u8 *src = b;
    u8 *dst = a;

    while (1)
    {
        if (*src == CHAR_NEWLINE || *src == EOS)
        {
            if (--r4 == 0)
            {
                *dst = EOS;
                return TRUE;
            }
            if (*src == EOS)
                return FALSE;
            dst = a;
            src++;
        }
        else
        {
            *dst++ = *src++;
        }
    }
}

void sub_80A4A98(const u8 *a, u32 b)
{
    u8 text[100];

    if (b == 0)
        MenuZeroFillWindowRect(0, 13, 13, 20);
    if (sub_80A4A54(text, a, b))
        MenuPrint_PixelCoords(text, 4, 104 + b * 16, 0);
}

void sub_80A4ADC(u8 taskId)
{
    if (gTasks[taskId].data[10] == 0)
        sub_80A7528(0);
    PlaySE(SE_SELECT);
    gUnknown_0203855C = 1;
}

void sub_80A4B14(s8 a, u8 b)
{
    gUnknown_03005D10[gUnknown_02038559].unk1 += a;
    MoveMenuCursor(0);
    sub_80A73C0();
    sub_80A763C();
    sub_80A4ADC(b);
}

void sub_80A4B58(s8 a, u8 b)
{
    gUnknown_03005D10[gUnknown_02038559].unk0 = MoveMenuCursor(a);
    sub_80A73C0();
    sub_80A4ADC(b);
}

const u8 *sub_80A4B90(u16 itemId)
{
    if (TestPlayerAvatarFlags(6))
    {
        if (itemId == ITEM_MACH_BIKE || itemId == ITEM_ACRO_BIKE)
            return gOtherText_Walk;
    }
    if (ItemIsMail(itemId) == TRUE)
        return gOtherText_Check;
    return gUnknown_083C1640[gUnknown_03000704[0]].text;
}

void sub_80A4BF0(u16 *a)
{
    u8 i;

    if (gUnknown_02038564 == 4)
    {
        MenuDrawTextWindow(0, 7, 13, 12);
        sub_80A4008(a, 1, 8, 12, 4);
        if (sub_80F9344() == TRUE && gUnknown_03000701 == 5)
        {
            sub_80A7834(1, 0);
        }
        else
        {
            for (i = 0; i < gUnknown_02038564; i++)
            {
                const u8 *text;

                if (i == 0)
                    text = sub_80A4B90(gScriptItemId);
                else
                    text = gUnknown_083C1640[gUnknown_03000704[i]].text;
                MenuPrint(text, 1 + (i / 2) * 6, 8 + (i % 2) * 2);
            }
        }
        if (gUnknown_03000701 == 5)
            InitMenu(0, 1, 8, gUnknown_02038564, gUnknown_03000700, 1);
        else
            InitMenu(0, 1, 8, gUnknown_02038564, 0, 1);
        sub_8072DCC(0x2F);
    }
    else
    {
        MenuDrawTextWindow(0, 5, 13, 12);
        sub_80A4008(a, 1, 6, 12, 6);
        for (i = 0; i < gUnknown_02038564; i++)
            MenuPrint(gUnknown_083C1640[gUnknown_03000704[i]].text, 1 + (i / 3) * 6, 6 + (i % 3) * 2);
        InitMenu(0, 1, 6, gUnknown_02038564, 0, 1);
        sub_8072DCC(0x2F);
    }
    sub_80A7528(2);
}

void sub_80A4DA4(u16 *a)
{
    sub_80A73FC();
    sub_80A36B8(a, 0, 6, 13, 6);
    MenuZeroFillWindowRect(0, 5, 13, 12);
    sub_80A7590();
}

void sub_80A4DD8(u8 taskId, u8 b, u8 c, u8 d, u8 e, u8 f)
{
    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = b + 2;
    gTasks[taskId].data[3] = c + 1;
    MenuDrawTextWindow(b, c, b + d, c + e);
    sub_80A4008(gBGTilemapBuffers[1], b + 1, c + 1, d - 1, e - 1);
    sub_80A418C(1, 1, b + 2, c + 1, f);
}

void sub_80A4E8C(s8 a, u8 b)
{
    PlaySE(SE_SELECT);
    sub_80F979C(0, 1);
    sub_80F979C(1, 1);
    sub_80F979C(2, 1);
    sub_80F979C(3, 1);
    PauseVerticalScrollIndicator(0);
    PauseVerticalScrollIndicator(1);
    PauseVerticalScrollIndicator(2);
    PauseVerticalScrollIndicator(3);
    sub_80A3B04(gBGTilemapBuffers[2], a);
    sub_80A3AC0(gBGTilemapBuffers[2], gUnknown_02038559);
    sub_80A3770();
    sub_80A7C64();
    CreateBagPokeballSprite(b);
}

static bool8 sub_80A4F0C(void)
{
    if (gUnknown_03000701 == 5 || gUnknown_03000701 == 4)
        return FALSE;
    if (gMain.newKeys == DPAD_RIGHT || sub_80F9284() == 2)
    {
        sub_80A4E8C(1, 2);
        return TRUE;
    }
    if (gMain.newKeys == DPAD_LEFT || sub_80F9284() == 1)
    {
        sub_80A4E8C(-1, 1);
        return TRUE;
    }
    return FALSE;
}

void sub_80A4F68(u8 taskId)
{
    sub_80A4F0C();
}

bool8 sub_80A4F74(u8 a)
{
    bool8 retVal = FALSE;

    if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_UP)
    {
        if (gUnknown_03005D10[gUnknown_02038559].unk0 != 0)
            sub_80A4B58(-1, a);
        else if (gUnknown_03005D10[gUnknown_02038559].unk1 != 0)
            sub_80A4B14(-1, a);
        if (gLinkOpen == TRUE && gMain.keyRepeatCounter == 5)
            gMain.keyRepeatCounter = 11;
        retVal = TRUE;
    }
    else if ((gMain.newAndRepeatedKeys & DPAD_ANY) == DPAD_DOWN)
    {
        if (gUnknown_03000701 != 5)
        {
            if (gUnknown_03005D10[gUnknown_02038559].unk0 == gUnknown_03005D10[gUnknown_02038559].unk3)
            {
                if (gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 != gUnknown_03005D10[gUnknown_02038559].unk2)
                    sub_80A4B14(1, a);
            }
            else
            {
                sub_80A4B58(1, a);
            }
        }
        else
        {
            if (gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 != gUnknown_03005D10[gUnknown_02038559].unk2 - 1)
            {
                if (gUnknown_03005D10[gUnknown_02038559].unk0 != gUnknown_03005D10[gUnknown_02038559].unk3)
                    sub_80A4B58(1, a);
                else
                    sub_80A4B14(1, a);
            }
        }
        retVal = TRUE;
        if (gLinkOpen == TRUE && gMain.keyRepeatCounter == 5)
            gMain.keyRepeatCounter = 11;
    }
    else
    {
        if (gTasks[a].data[10] == 0 && sub_80A4F0C() == TRUE)
        {
            sub_80A73F0();
            gTasks[a].func = sub_80A4F68;
            retVal = TRUE;
        }
        else
        {
            sub_80A73C0();
        }
    }
    return retVal;
}

void sub_80A50C8(u8 taskId)
{
    s16 *r5 = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        if (sub_80A4F74(taskId) == TRUE)
        {
            sub_808B5B4(taskId);
            return;
        }

        if ((gMain.newKeys & SELECT_BUTTON)
         && !(gUnknown_02038559 == 3 || gUnknown_02038559 == 2)
         && gUnknown_03000701 < 2)
        {
            if (r5[10] == 0)
            {
                if (gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 != gUnknown_03005D10[gUnknown_02038559].unk2)
                {
                    PlaySE(SE_SELECT);
                    sub_80A3F50(taskId);
                }
                sub_808B5B4(taskId);
            }
            else
            {
                if (gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 != gUnknown_03005D10[gUnknown_02038559].unk2)
                {
                    PlaySE(SE_SELECT);
                    sub_80A3E90(taskId);
                }
                else
                {
                    sub_80A3EF4(taskId);
                }
                sub_808B5B4(taskId);
            }
            return;
        }

        if (gMain.newKeys & A_BUTTON)
        {
            if (gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 == gUnknown_03005D10[gUnknown_02038559].unk2)
            {
                if (r5[10] == 0)
                {
                    gScriptItemId = 0;
                    gUnknown_083C16BC[gUnknown_03000701][1](taskId);
                }
                else
                {
                    sub_80A3EF4(taskId);
                }
                sub_808B5B4(taskId);
            }
            else
            {
                if (r5[10] == 0)
                {
                    PlaySE(SE_SELECT);
                    gUnknown_02038560 = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0;
                    gScriptItemId = gUnknown_03005D24[gUnknown_02038560].itemId;
                    gUnknown_083C16BC[gUnknown_03000701][0](taskId);
                    sub_80F98A4(0);
                    sub_80F98A4(1);
                    sub_80F98A4(2);
                    sub_80F98A4(3);
                    sub_80A797C();
                }
                else
                {
                    sub_80A3E90(taskId);
                }
                sub_808B5B4(taskId);
            }
            return;
        }

        if (gMain.newKeys & B_BUTTON)
        {
            if (r5[10] == 0)
            {
                if (gUnknown_03000701 != 5)
                {
                    gScriptItemId = 0;
                    gUnknown_083C16BC[gUnknown_03000701][1](taskId);
                }
            }
            else
            {
                sub_80A3EF4(taskId);
            }
            sub_808B5B4(taskId);
            return;
        }
    }
}

bool8 sub_80A52C4(u8 taskId, u16 b)
{
    s16 *taskData = gTasks[taskId].data;

    if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x40)
    {
        if (taskData[1] != b)
            taskData[1]++;
        else
            taskData[1] = 1;
        return TRUE;
    }

    if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x80)
    {
        if (taskData[1] != 1)
            taskData[1]--;
        else
            taskData[1] = b;
        return TRUE;
    }

    if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x10)
    {
        if (taskData[1] + 10 < b)
            taskData[1] += 10;
        else
            taskData[1] = b;
        return TRUE;
    }

    if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x20)
    {
        if (taskData[1] > 10)
            taskData[1] -= 10;
        else
            taskData[1] = 1;
        return TRUE;
    }

    return FALSE;
}

bool8 sub_80A5350(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    if (sub_80A52C4(taskId, gUnknown_03005D24[gUnknown_02038560].quantity) == TRUE)
    {
        if (gUnknown_02038559 + 1 == 4)  // if (gUnknown_02038559 == 3)
            sub_80A418C(taskData[1], 1, taskData[2], taskData[3], 3);
        else
            sub_80A418C(taskData[1], 1, taskData[2], taskData[3], 2);
        return TRUE;
    }
    return FALSE;
}

void sub_80A53CC(void)
{
    if (sub_80A34B4() == TRUE)
    {
        sub_80A3770();
        gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
    }
}

void sub_80A53F8(void)
{
    gUnknown_03000701 = 0;
    SetMainCallback2(sub_80A53CC);
}

#ifdef NONMATCHING
void sub_80A5414(u8 taskId)
{
    TaskFunc r5 = NULL;

    if (sub_80A78A0() != 0)
    {
        if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x40)
        {
            if ((gUnknown_03000700 & 1) && gUnknown_03000704[gUnknown_03000700 - 1] == 8)
            {
                PlaySE(SE_SELECT);
                gUnknown_03000700 = MoveMenuCursor3(-1);
            }
        }
        //_080A546C
        else if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x80)
        {
            if (!(gUnknown_03000700 & 1) && gUnknown_03000704[gUnknown_03000700 + 1] != 8)
            {
                PlaySE(SE_SELECT);
                gUnknown_03000700 = MoveMenuCursor3(1);
            }
        }
        //_080A549C
        else if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x20)
        {
            if (gUnknown_03000700 > 1 && gUnknown_03000704[gUnknown_03000700 - 2] != 8)
            {
                PlaySE(SE_SELECT);
                gUnknown_03000700 = MoveMenuCursor3(-2);
            }
        }
        //_080A54CC
        else if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x10)
        {
            if (gUnknown_03000700 <= 1 && gUnknown_03000704[gUnknown_03000700 + 2] != 8)
            {
                PlaySE(SE_SELECT);
                gUnknown_03000700 = MoveMenuCursor3(2);
            }
        }
        //_080A5500
        else if (!(gMain.newKeys & A_BUTTON))
        {
            if (gMain.newKeys & B_BUTTON)
            {
                gTasks[taskId].data[10] = 0;
                sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
                sub_80A4DA4(gBGTilemapBuffers[1]);
                r5 = gUnknown_083C1640[gUnknown_03000704[3]].func;
                r5(taskId);
            }
        }
        else
        {
            //_080A5590
            gTasks[taskId].data[10] = 0;
            sub_80A4DA4(gBGTilemapBuffers[1]);
            r5 = gUnknown_083C1640[gUnknown_03000704[gUnknown_03000700]].func;
            r5(taskId);
        }
    }
    //_080A5552
    if (r5 == NULL)
    {
        if (gUnknown_03000701 == 5)
        {
            if (gUnknown_03000700 == 0)
            {
                sub_8072DDC(12);
                return;
            }
            //_080A55D4
            //else
            //{
                if (gUnknown_03000700 == 0 || gUnknown_03000700 == 1)
                    sub_8072DCC(0x2F);
                else
                    sub_8072DCC(0x30);
            //}
        }
        //_080A55E0
        else
        {
            if (gUnknown_03000700 == 0 || gUnknown_03000700 == 1)
                sub_8072DCC(0x2F);
            else
                sub_8072DCC(0x30);
        }
    }
}
#else
__attribute__((naked))
void sub_80A5414(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    movs r5, 0\n\
    bl sub_80A78A0\n\
    cmp r0, 0\n\
    bne _080A5426\n\
    b _080A5552\n\
_080A5426:\n\
    ldr r2, _080A5460 @ =gMain\n\
    ldrh r0, [r2, 0x30]\n\
    movs r1, 0xF0\n\
    ands r1, r0\n\
    cmp r1, 0x40\n\
    bne _080A546C\n\
    ldr r4, _080A5464 @ =gUnknown_03000700\n\
    ldrb r1, [r4]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080A5440\n\
    b _080A5552\n\
_080A5440:\n\
    ldrb r1, [r4]\n\
    ldr r0, _080A5468 @ =gUnknown_03000704\n\
    ldr r0, [r0]\n\
    adds r1, r0\n\
    subs r1, 0x1\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x8\n\
    bne _080A5452\n\
    b _080A5552\n\
_080A5452:\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    b _080A54EE\n\
    .align 2, 0\n\
_080A5460: .4byte gMain\n\
_080A5464: .4byte gUnknown_03000700\n\
_080A5468: .4byte gUnknown_03000704\n\
_080A546C:\n\
    cmp r1, 0x80\n\
    bne _080A549C\n\
    ldr r4, _080A5494 @ =gUnknown_03000700\n\
    ldrb r1, [r4]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080A5552\n\
    ldrb r1, [r4]\n\
    ldr r0, _080A5498 @ =gUnknown_03000704\n\
    ldr r0, [r0]\n\
    adds r1, r0\n\
    ldrb r0, [r1, 0x1]\n\
    cmp r0, 0x8\n\
    beq _080A5552\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x1\n\
    b _080A54EE\n\
    .align 2, 0\n\
_080A5494: .4byte gUnknown_03000700\n\
_080A5498: .4byte gUnknown_03000704\n\
_080A549C:\n\
    cmp r1, 0x20\n\
    bne _080A54CC\n\
    ldr r4, _080A54C4 @ =gUnknown_03000700\n\
    ldrb r0, [r4]\n\
    cmp r0, 0x1\n\
    bls _080A5552\n\
    adds r1, r0, 0\n\
    ldr r0, _080A54C8 @ =gUnknown_03000704\n\
    ldr r0, [r0]\n\
    adds r1, r0\n\
    subs r1, 0x2\n\
    ldrb r0, [r1]\n\
    cmp r0, 0x8\n\
    beq _080A5552\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x2\n\
    negs r0, r0\n\
    b _080A54EE\n\
    .align 2, 0\n\
_080A54C4: .4byte gUnknown_03000700\n\
_080A54C8: .4byte gUnknown_03000704\n\
_080A54CC:\n\
    cmp r1, 0x10\n\
    bne _080A5500\n\
    ldr r4, _080A54F8 @ =gUnknown_03000700\n\
    ldrb r0, [r4]\n\
    cmp r0, 0x1\n\
    bhi _080A5552\n\
    adds r1, r0, 0\n\
    ldr r0, _080A54FC @ =gUnknown_03000704\n\
    ldr r0, [r0]\n\
    adds r1, r0\n\
    ldrb r0, [r1, 0x2]\n\
    cmp r0, 0x8\n\
    beq _080A5552\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    movs r0, 0x2\n\
_080A54EE:\n\
    bl MoveMenuCursor3\n\
    strb r0, [r4]\n\
    b _080A5552\n\
    .align 2, 0\n\
_080A54F8: .4byte gUnknown_03000700\n\
_080A54FC: .4byte gUnknown_03000704\n\
_080A5500:\n\
    ldrh r1, [r2, 0x2E]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080A5590\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080A5552\n\
    ldr r1, _080A5570 @ =gTasks\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    strh r5, [r0, 0x1C]\n\
    ldr r1, _080A5574 @ =gUnknown_03005D10\n\
    ldr r0, _080A5578 @ =gUnknown_02038559\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r2, [r0]\n\
    adds r0, r4, 0\n\
    adds r1, r2, 0\n\
    bl sub_80A48E8\n\
    ldr r0, _080A557C @ =gBGTilemapBuffers + 0x800\n\
    bl sub_80A4DA4\n\
    ldr r1, _080A5580 @ =gUnknown_083C1640\n\
    ldr r0, _080A5584 @ =gUnknown_03000704\n\
    ldr r0, [r0]\n\
    ldrb r0, [r0, 0x3]\n\
    lsls r0, 3\n\
    adds r1, 0x4\n\
    adds r0, r1\n\
    ldr r5, [r0]\n\
    adds r0, r4, 0\n\
    bl _call_via_r5\n\
_080A5552:\n\
    cmp r5, 0\n\
    bne _080A55FA\n\
    ldr r0, _080A5588 @ =gUnknown_03000701\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x5\n\
    bne _080A55E0\n\
    ldr r0, _080A558C @ =gUnknown_03000700\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    bne _080A55D4\n\
    movs r0, 0xC\n\
    bl sub_8072DDC\n\
    b _080A55FA\n\
    .align 2, 0\n\
_080A5570: .4byte gTasks\n\
_080A5574: .4byte gUnknown_03005D10\n\
_080A5578: .4byte gUnknown_02038559\n\
_080A557C: .4byte gBGTilemapBuffers + 0x800\n\
_080A5580: .4byte gUnknown_083C1640\n\
_080A5584: .4byte gUnknown_03000704\n\
_080A5588: .4byte gUnknown_03000701\n\
_080A558C: .4byte gUnknown_03000700\n\
_080A5590:\n\
    ldr r1, _080A55C0 @ =gTasks\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    strh r5, [r0, 0x1C]\n\
    ldr r0, _080A55C4 @ =gBGTilemapBuffers + 0x800\n\
    bl sub_80A4DA4\n\
    ldr r1, _080A55C8 @ =gUnknown_083C1640\n\
    ldr r0, _080A55CC @ =gUnknown_03000700\n\
    ldrb r2, [r0]\n\
    ldr r0, _080A55D0 @ =gUnknown_03000704\n\
    ldr r0, [r0]\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
    lsls r0, 3\n\
    adds r1, 0x4\n\
    adds r0, r1\n\
    ldr r5, [r0]\n\
    adds r0, r4, 0\n\
    bl _call_via_r5\n\
    b _080A5552\n\
    .align 2, 0\n\
_080A55C0: .4byte gTasks\n\
_080A55C4: .4byte gBGTilemapBuffers + 0x800\n\
_080A55C8: .4byte gUnknown_083C1640\n\
_080A55CC: .4byte gUnknown_03000700\n\
_080A55D0: .4byte gUnknown_03000704\n\
_080A55D4:\n\
    cmp r0, 0x1\n\
    bls _080A55E8\n\
    movs r0, 0x30\n\
    bl sub_8072DCC\n\
    b _080A55FA\n\
_080A55E0:\n\
    ldr r0, _080A55F0 @ =gUnknown_03000700\n\
    ldrb r0, [r0]\n\
    cmp r0, 0x1\n\
    bhi _080A55F4\n\
_080A55E8:\n\
    movs r0, 0x2F\n\
    bl sub_8072DCC\n\
    b _080A55FA\n\
    .align 2, 0\n\
_080A55F0: .4byte gUnknown_03000700\n\
_080A55F4:\n\
    movs r0, 0x30\n\
    bl sub_8072DCC\n\
_080A55FA:\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif

__attribute__((naked))
void sub_80A5600(u8 taskId)
{
    asm(".syntax unified\n\
	push {r4,r5,lr}\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	movs r5, 0\n\
	ldr r2, _080A563C @ =gMain\n\
	ldrh r0, [r2, 0x30]\n\
	movs r1, 0xF0\n\
	ands r1, r0\n\
	cmp r1, 0x40\n\
	bne _080A5648\n\
	ldr r4, _080A5640 @ =gUnknown_03000700\n\
	ldrb r0, [r4]\n\
	cmp r0, 0\n\
	bne _080A561E\n\
	b _080A5736\n\
_080A561E:\n\
	adds r1, r0, 0\n\
	ldr r0, _080A5644 @ =gUnknown_03000704\n\
	ldr r0, [r0]\n\
	adds r1, r0\n\
	subs r1, 0x1\n\
	ldrb r0, [r1]\n\
	cmp r0, 0x8\n\
	bne _080A5630\n\
	b _080A5736\n\
_080A5630:\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	b _080A56D2\n\
	.align 2, 0\n\
_080A563C: .4byte gMain\n\
_080A5640: .4byte gUnknown_03000700\n\
_080A5644: .4byte gUnknown_03000704\n\
_080A5648:\n\
	cmp r1, 0x80\n\
	bne _080A5680\n\
	ldr r4, _080A5674 @ =gUnknown_03000700\n\
	ldrb r1, [r4]\n\
	ldr r0, _080A5678 @ =gUnknown_02038564\n\
	ldrb r0, [r0]\n\
	subs r0, 0x1\n\
	cmp r1, r0\n\
	beq _080A5736\n\
	cmp r1, 0x2\n\
	beq _080A5736\n\
	ldr r0, _080A567C @ =gUnknown_03000704\n\
	ldr r0, [r0]\n\
	adds r0, r1, r0\n\
	ldrb r0, [r0, 0x1]\n\
	cmp r0, 0x8\n\
	beq _080A5736\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r0, 0x1\n\
	b _080A56D2\n\
	.align 2, 0\n\
_080A5674: .4byte gUnknown_03000700\n\
_080A5678: .4byte gUnknown_02038564\n\
_080A567C: .4byte gUnknown_03000704\n\
_080A5680:\n\
	cmp r1, 0x20\n\
	bne _080A56B0\n\
	ldr r4, _080A56A8 @ =gUnknown_03000700\n\
	ldrb r0, [r4]\n\
	cmp r0, 0x2\n\
	bls _080A5736\n\
	adds r1, r0, 0\n\
	ldr r0, _080A56AC @ =gUnknown_03000704\n\
	ldr r0, [r0]\n\
	adds r1, r0\n\
	subs r1, 0x3\n\
	ldrb r0, [r1]\n\
	cmp r0, 0x8\n\
	beq _080A5736\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r0, 0x3\n\
	negs r0, r0\n\
	b _080A56D2\n\
	.align 2, 0\n\
_080A56A8: .4byte gUnknown_03000700\n\
_080A56AC: .4byte gUnknown_03000704\n\
_080A56B0:\n\
	cmp r1, 0x10\n\
	bne _080A56E4\n\
	ldr r4, _080A56DC @ =gUnknown_03000700\n\
	ldrb r0, [r4]\n\
	cmp r0, 0x2\n\
	bhi _080A5736\n\
	adds r1, r0, 0\n\
	ldr r0, _080A56E0 @ =gUnknown_03000704\n\
	ldr r0, [r0]\n\
	adds r1, r0\n\
	ldrb r0, [r1, 0x3]\n\
	cmp r0, 0x8\n\
	beq _080A5736\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r0, 0x3\n\
_080A56D2:\n\
	bl MoveMenuCursor3\n\
	strb r0, [r4]\n\
	b _080A5736\n\
	.align 2, 0\n\
_080A56DC: .4byte gUnknown_03000700\n\
_080A56E0: .4byte gUnknown_03000704\n\
_080A56E4:\n\
	ldrh r1, [r2, 0x2E]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080A5768\n\
	movs r0, 0x2\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080A5736\n\
	ldr r1, _080A574C @ =gTasks\n\
	lsls r0, r4, 2\n\
	adds r0, r4\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	strh r5, [r0, 0x1C]\n\
	ldr r1, _080A5750 @ =gUnknown_03005D10\n\
	ldr r0, _080A5754 @ =gUnknown_02038559\n\
	ldrb r0, [r0]\n\
	lsls r0, 24\n\
	asrs r0, 24\n\
	lsls r0, 2\n\
	adds r0, r1\n\
	ldrb r2, [r0]\n\
	adds r0, r4, 0\n\
	adds r1, r2, 0\n\
	bl sub_80A48E8\n\
	ldr r0, _080A5758 @ =gBGTilemapBuffers + 0x800\n\
	bl sub_80A4DA4\n\
	ldr r1, _080A575C @ =gUnknown_083C1640\n\
	ldr r0, _080A5760 @ =gUnknown_03000704\n\
	ldr r0, [r0]\n\
	ldrb r0, [r0, 0x5]\n\
	lsls r0, 3\n\
	adds r1, 0x4\n\
	adds r0, r1\n\
	ldr r5, [r0]\n\
	adds r0, r4, 0\n\
	bl _call_via_r5\n\
_080A5736:\n\
	cmp r5, 0\n\
	bne _080A57BE\n\
	ldr r0, _080A5764 @ =gUnknown_03000700\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	bne _080A57AC\n\
	movs r0, 0xC\n\
	bl sub_8072DDC\n\
	b _080A57BE\n\
	.align 2, 0\n\
_080A574C: .4byte gTasks\n\
_080A5750: .4byte gUnknown_03005D10\n\
_080A5754: .4byte gUnknown_02038559\n\
_080A5758: .4byte gBGTilemapBuffers + 0x800\n\
_080A575C: .4byte gUnknown_083C1640\n\
_080A5760: .4byte gUnknown_03000704\n\
_080A5764: .4byte gUnknown_03000700\n\
_080A5768:\n\
	ldr r1, _080A5798 @ =gTasks\n\
	lsls r0, r4, 2\n\
	adds r0, r4\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	strh r5, [r0, 0x1C]\n\
	ldr r0, _080A579C @ =gBGTilemapBuffers + 0x800\n\
	bl sub_80A4DA4\n\
	ldr r1, _080A57A0 @ =gUnknown_083C1640\n\
	ldr r0, _080A57A4 @ =gUnknown_03000700\n\
	ldrb r2, [r0]\n\
	ldr r0, _080A57A8 @ =gUnknown_03000704\n\
	ldr r0, [r0]\n\
	adds r0, r2\n\
	ldrb r0, [r0]\n\
	lsls r0, 3\n\
	adds r1, 0x4\n\
	adds r0, r1\n\
	ldr r5, [r0]\n\
	adds r0, r4, 0\n\
	bl _call_via_r5\n\
	b _080A5736\n\
	.align 2, 0\n\
_080A5798: .4byte gTasks\n\
_080A579C: .4byte gBGTilemapBuffers + 0x800\n\
_080A57A0: .4byte gUnknown_083C1640\n\
_080A57A4: .4byte gUnknown_03000700\n\
_080A57A8: .4byte gUnknown_03000704\n\
_080A57AC:\n\
	cmp r0, 0x2\n\
	bhi _080A57B8\n\
	movs r0, 0x2F\n\
	bl sub_8072DCC\n\
	b _080A57BE\n\
_080A57B8:\n\
	movs r0, 0x30\n\
	bl sub_8072DCC\n\
_080A57BE:\n\
	pop {r4,r5}\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided\n");
}

void sub_80A57C4(void)
{
    u8 r5;

    gUnknown_03000704 = gUnknown_083C16AE[gUnknown_02038559];
    if (gUnknown_02038559 == 4)
    {
        gUnknown_02038564 = 1;
        r5 = 9;
    }
    else if (sub_80F92F4(gScriptItemId) == 0)
    {
        gUnknown_03000704 = gUnknown_083C16AE[4];
        gUnknown_02038564 = 1;
        r5 = 9;
    }
    else
    {
        gUnknown_02038564 = 2;
        r5 = 7;
    }
    sub_80A4008(gBGTilemapBuffers[1], 7, r5 + 1, 6, gUnknown_02038564 * 2);
    MenuDrawTextWindow(6, r5, 13, gUnknown_02038564 * 2 + 1 + r5);
    sub_80A7834(0, r5);
    InitMenu(0, 7, r5 + 1, gUnknown_02038564, 0, 6);
}

void sub_80A5888(u8 taskId)
{
    if (sub_80A78A0() != 0)
    {
        if (gMain.newAndRepeatedKeys & DPAD_UP)
        {
            if (gUnknown_03000700 != 0)
            {
                PlaySE(SE_SELECT);
                gUnknown_03000700 = MoveMenuCursor(-1);
            }
        }
        else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            if (gUnknown_03000700 != gUnknown_02038564 - 1)
            {
                PlaySE(SE_SELECT);
                gUnknown_03000700 = MoveMenuCursor(1);
            }
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            gTasks[taskId].data[10] = 0;
            sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
            sub_80A4DA4(gBGTilemapBuffers[1]);
            gUnknown_083C1640[gUnknown_03000704[gUnknown_03000700]].func(taskId);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            gTasks[taskId].data[10] = 0;
            sub_80A4DA4(gBGTilemapBuffers[1]);
            gUnknown_083C1640[2].func(taskId);
        }
    }
}

void sub_80A599C(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)sub_805469C >> 16;
    gTasks[taskId].data[9] = (u32)sub_805469C;
    gLastFieldPokeMenuOpened = 0;
    sub_80A5AE4(taskId);
}

void sub_80A59D0(u8 taskId)
{
    gUnknown_03000700 = 0;
    if (gUnknown_03000701 == 5)
        gUnknown_03000700 = 1;
    gTasks[taskId].data[10] = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 + 1;
    sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
    sub_80A73FC();
    if (sub_80F9344() == TRUE && gUnknown_03000701 != 5)
    {
        sub_80A57C4();
        gTasks[taskId].func = sub_80A5888;
    }
    else
    {
        sub_80A4BF0(gBGTilemapBuffers[1]);
        if (gUnknown_02038559 != 3 || gUnknown_03000701 == 5)
            gTasks[taskId].func = sub_80A5414;
        else
            gTasks[taskId].func = sub_80A5600;
    }
}

void sub_80A5AAC(u8 taskId)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gTasks[taskId].func = HandleItemMenuPaletteFade;
}

void sub_80A5AE4(u8 taskId)
{
    PlaySE(SE_SELECT);
    sub_80A5AAC(taskId);
}

void HandleItemMenuPaletteFade(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        MainCallback cb = (MainCallback)((u16)taskData[8] << 16 | (u16)taskData[9]);

        SetMainCallback2(cb);
        gpu_pal_allocator_reset__manage_upper_four();
        DestroyTask(taskId);
    }
}

void sub_80A5B40(void)
{
    while (1)
    {
        if (sub_80A317C() == TRUE)
        {
            ResetTasks();
            gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_80A5B78(u8 taskId)
{
    if (ItemId_GetFieldFunc(gScriptItemId) != NULL)
    {
        PlaySE(SE_SELECT);
        if (CalculatePlayerPartyCount() == 0 && ItemId_GetType(gScriptItemId) == 1)
        {
            sub_80A5BF8(taskId);
        }
        else
        {
            gTasks[taskId].data[2] = 0;
            if (gUnknown_02038559 != 3)
                ItemId_GetFieldFunc(gScriptItemId)(taskId);
            else
                sub_80C9C7C(taskId);
        }
    }
}

void sub_80A5BF8(u8 taskId)
{
    sub_80A73FC();
    sub_80A7590();
    DisplayCannotUseItemMessage(taskId, gOtherText_NoPokemon, CleanUpItemMenuMessage, 1);
}

void sub_80A5C24(u8 taskId)
{
    sub_80A7528(0);
    sub_80A41D4(taskId);
    ItemListMenu_InitMenu();
    sub_80A37C0(taskId);
}

void CleanUpItemMenuMessage(u8 taskId)
{
    sub_80A36B8(gBGTilemapBuffers[1], 0, 0, 31, 31);
    MenuZeroFillWindowRect(7, 7, 13, 12);
    MenuZeroFillWindowRect(0, 14, 29, 19);
    gTasks[taskId].func = sub_80A5C24;
}

void CleanUpOverworldMessage(u8 taskId)
{
    MenuZeroFillWindowRect(0, 13, 29, 19);
    DestroyTask(taskId);
    sub_8064E2C();
    ScriptContext2_Disable();
}

void ExecuteItemUseFromBlackPalette(void)
{
    pal_fill_black();
    CreateTask(Task_CallItemUseOnFieldCallback, 8);
}

void Task_CallItemUseOnFieldCallback(u8 taskId)
{
    if (sub_807D770() == TRUE)
        gUnknown_03005D00(taskId);
}

void sub_80A5D04(void)
{
    while (1)
    {
        if (sub_80A317C() == TRUE)
        {
            gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_80A5D38(u8 taskId)
{
    gTasks[taskId].data[1] = 0;
    sub_80A4DA4(gBGTilemapBuffers[1]);
    sub_80A7528(0);
    sub_80A41D4(taskId);
    ItemListMenu_InitMenu();
    sub_80A37C0(taskId);
}

void sub_80A5D78(void)
{
    sub_80A4008(gBGTilemapBuffers[1], 8, 8, 5, 4);
    DisplayYesNoMenu(7, 7, 1);
}

void sub_80A5DA0(u16 itemId, u16 quantity)
{
    CopyItemName(itemId, gStringVar1);
    if (quantity >= 100)
        ConvertIntToDecimalStringN(gStringVar2, quantity, 0, 3);
    else
        ConvertIntToDecimalStringN(gStringVar2, quantity, 0, 2);
    sub_80A4DA4(gBGTilemapBuffers[1]);
    sub_80A7528(5);
    sub_80A5D78();
}

void sub_80A5DF8(void)
{
    sub_80A4DA4(gBGTilemapBuffers[1]);
    MenuZeroFillWindowRect(7, 6, 11, 13);
    sub_80A7528(4);
}

void sub_80A5E1C(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        gTasks[taskId].data[10] = 0;
        sub_80A41D4(taskId);
        sub_80A5D38(taskId);
    }
}

void sub_80A5E60(u8 taskId)
{
    sub_80A5DF8();
    sub_80A3D5C(taskId);
    gTasks[taskId].func = sub_80A5E1C;
}

void sub_80A5E90(u8 taskId)
{
    sub_80A5D38(taskId);
}

void sub_80A5EA0(u8 taskId)
{
    if (sub_80A5350(taskId) == TRUE)
        return;
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_80A5DA0(gScriptItemId, gTasks[taskId].data[1]);
        DoYesNoFuncWithChoice(taskId, &gUnknown_083C16F4);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_80A5D38(taskId);
    }
}

void sub_80A5F14(u8 taskId)
{
    PlaySE(SE_SELECT);
    gTasks[taskId].func = sub_80A5EA0;
    sub_80A7528(3);
    if (gUnknown_02038559 + 1 == 4)  // if (gUnknown_02038559 == 3)
        sub_80A4DD8(taskId, 6, 9, 7, 3, 3);
    else
        sub_80A4DD8(taskId, 7, 9, 6, 3, 2);
}

void sub_80A5F80(u8 taskId)
{
    PlaySE(SE_SELECT);
    sub_80A7528(0);
    sub_80A41D4(taskId);
    ItemListMenu_InitMenu();
    sub_80A37C0(taskId);
}

void sub_80A5FAC(u8 taskId)
{
    PlaySE(SE_SELECT);
    if (gSaveBlock1.registeredItem == gScriptItemId)
    {
        sub_80A40D0();
        gSaveBlock1.registeredItem = 0;
    }
    else
    {
        sub_80A413C();
        gSaveBlock1.registeredItem = gScriptItemId;
    }
    sub_80A7528(0);
    sub_80A41D4(taskId);
    ItemListMenu_InitMenu();
    sub_80A37C0(taskId);
}

void sub_80A6000(u8 taskId)
{
    sub_80A7528(0);
    sub_80A41D4(taskId);
    ItemListMenu_InitMenu();
    sub_80A37C0(taskId);
}

void sub_80A6024(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        sub_80A36B8(gBGTilemapBuffers[1], 0, 0, 31, 31);
        MenuZeroFillWindowRect(0, 14, 29, 19);
        gTasks[taskId].func = sub_80A6000;
    }
}

void DisplayCannotBeHeldMessage(u8 taskId)
{
    sub_80A73FC();
    CopyItemName(gScriptItemId, gStringVar1);
    StringExpandPlaceholders(gStringVar4, gOtherText_CantBeHeld);
    sub_80A7590();
    DisplayCannotUseItemMessage(taskId, gStringVar4, sub_80A6024, 1);
}

void ItemMenu_Give(u8 taskId)
{
    PlaySE(SE_SELECT);
    if (sub_80F931C(gScriptItemId) == 0)
    {
        sub_80A73FC();
        sub_80A7590();
        DisplayCannotUseItemMessage(taskId, gOtherText_CantWriteMail, sub_80A6024, 1);
    }
    else if (ItemId_GetImportance(gScriptItemId) == 0)
    {
        if (CalculatePlayerPartyCount() == 0)
        {
            sub_80A5BF8(taskId);
        }
        else
        {
            gTasks[taskId].data[8] = (u32)sub_808B020 >> 16;
            gTasks[taskId].data[9] = (u32)sub_808B020;
            gTasks[taskId].func = HandleItemMenuPaletteFade;
            gUnknown_02038561 = 1;
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        }
    }
    else
    {
        DisplayCannotBeHeldMessage(taskId);
    }
}

void sub_80A6178(u8 taskId)
{
    sub_80A5AE4(taskId);
    gTasks[taskId].data[8] = (u32)BerryTagScreen_814625C >> 16;
    gTasks[taskId].data[9] = (u32)BerryTagScreen_814625C;
}

void sub_80A61A8(void)
{
    if (sub_80A34B4() == TRUE)
        gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
}

void sub_80A61D0(void)
{
    gUnknown_03000701 = 2;
    SetMainCallback2(sub_80A61A8);
}

void sub_80A61EC(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)sub_808A3F8 >> 16;
    gTasks[taskId].data[9] = (u32)sub_808A3F8;
    sub_80A5AE4(taskId);
}

void sub_80A6214(u8 taskId)
{
    u8 r6 = gUnknown_02038559 + 1;

    if (sub_80F931C(gScriptItemId) == 0)
    {
        sub_80A73FC();
        sub_80A7590();
        DisplayCannotUseItemMessage(taskId, gOtherText_CantWriteMail, sub_80A6024, 1);
    }
    else if (sub_80F92F4(gScriptItemId) == 0)
    {
        sub_80A73FC();
        CopyItemName(gScriptItemId, gStringVar1);
        StringExpandPlaceholders(gStringVar4, gOtherText_CantBeHeldHere);
        sub_80A7590();
        DisplayCannotUseItemMessage(taskId, gStringVar4, sub_80A6024, 1);
    }
    else if (r6 != 5 && ItemId_GetImportance(gScriptItemId) == 0)
    {
        gTasks[taskId].data[8] = (u32)sub_808A3F8 >> 16;
        gTasks[taskId].data[9] = (u32)sub_808A3F8;
        sub_80A5AAC(taskId);
    }
    else
    {
        DisplayCannotBeHeldMessage(taskId);
    }
}

void sub_80A62D8(void)
{
    if (sub_80A34B4() == TRUE)
        gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
}

void sub_80A6300(void)
{
    gUnknown_03000701 = 3;
    SetMainCallback2(sub_80A62D8);
}

void sub_80A631C(u8 taskId)
{
    gFieldCallback = sub_80B3050;
    gTasks[taskId].data[8] = (u32)c2_exit_to_overworld_2_switch >> 16;
    gTasks[taskId].data[9] = (u32)c2_exit_to_overworld_2_switch;
    sub_80A5AE4(taskId);
}

void sub_80A6354(u8 taskId)
{
    sub_80A7590();
    gTasks[taskId].data[10] = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 + 1;
    sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
    sub_80A73FC();
    CopyItemName(gScriptItemId, gStringVar2);
    if (ItemId_GetPrice(gScriptItemId) == 0)
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_CantBuyThat);
        DisplayCannotUseItemMessage(taskId, gStringVar4, sub_80A6444, 1);
    }
    else
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_HowManyToSell);
        DisplayCannotUseItemMessage(taskId, gStringVar4, sub_80A648C, 1);
    }
}

void sub_80A640C(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    sub_80A7528(0);
    sub_80A41D4(taskId);
    ItemListMenu_InitMenu();
    sub_80A37C0(taskId);
}

void sub_80A6444(u8 taskId)
{
    sub_80A36B8(gBGTilemapBuffers[1], 0, 0, 31, 31);
    MenuZeroFillWindowRect(0, 14, 29, 19);
    gTasks[taskId].func = sub_80A640C;
}

void sub_80A648C(u8 taskId)
{
    gTasks[taskId].func = Task_BuyHowManyDialogueHandleInput;
    sub_80A4008(gBGTilemapBuffers[1], 1, 11, 12, 2);
    MenuDrawTextWindow(0, 10, 13, 13);
    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = 1;
    gTasks[taskId].data[3] = 11;
    if (gUnknown_02038559 + 1 == 4)  // if (gUnknown_02038559 == 3)
        sub_80A418C(1, 1, 1, 11, 3);
    else
        sub_80A418C(1, 1, 1, 11, 2);
    BuyMenuDisplayMessage(gScriptItemId, 1);
    sub_80A683C();
}

void sub_80A6520(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        BuyMenuPrintItemQuantityAndPrice(taskId);
    }
}

void sub_80A6548(u8 taskId)
{
    sub_80A48F8(taskId);
    gTasks[taskId].func = sub_80A6520;
}

void sub_80A6574(u8 taskId)
{
    PlaySE(SE_REGI);
    sub_80A6870(gScriptItemId, gTasks[taskId].data[1]);
    gTasks[taskId].func = sub_80A6548;
}

void sub_80A65AC(u8 taskId)
{
    MenuZeroFillWindowRect(7, 6, 13, 12);
    sub_80A36B8(gBGTilemapBuffers[1], 7, 6, 6, 6);
    CopyItemName(gScriptItemId, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_SoldItem);
    DisplayCannotUseItemMessage(taskId, gStringVar4, sub_80A6574, 1);
    sub_80A3D5C(taskId);
}

void sub_80A6618(u8 taskId)
{
    MenuZeroFillWindowRect(7, 6, 13, 12);
    sub_80A36B8(gBGTilemapBuffers[1], 7, 6, 6, 6);
    BuyMenuPrintItemQuantityAndPrice(taskId);
}

void sub_80A6650(u8 taskId)
{
    sub_80A5D78();
    DoYesNoFuncWithChoice(taskId, &gUnknown_083C16FC);
}

void Task_BuyHowManyDialogueHandleInput(u8 taskId)
{
    if (sub_80A5350(taskId) == TRUE)
    {
        MenuZeroFillWindowRect(6, 11, 12, 11);
        BuyMenuDisplayMessage(gScriptItemId, gTasks[taskId].data[1]);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(0, 10, 13, 13);
        sub_80A36B8(gBGTilemapBuffers[1], 0, 10, 13, 3);
        ConvertIntToDecimalStringN(gStringVar1, ItemId_GetPrice(gScriptItemId) / 2 * gTasks[taskId].data[1], 0, 6);
        StringExpandPlaceholders(gStringVar4, gOtherText_CanPay);
        DisplayCannotUseItemMessage(taskId, gStringVar4, sub_80A6650, 1);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        BuyMenuPrintItemQuantityAndPrice(taskId);
    }
}

void sub_80A6760(u8 taskId)
{
    gTasks[taskId].data[10] = 0;
    sub_80A7528(0);
    sub_80A41D4(taskId);
    ItemListMenu_InitMenu();
    sub_80A37C0(taskId);
}

void BuyMenuPrintItemQuantityAndPrice(u8 taskId)
{
    sub_80A36B8(gBGTilemapBuffers[1], 0, 0, 31, 31);
    RemoveMoneyLabelObject(0, 0);
    MenuZeroFillWindowRect(0, 4, 13, 13);
    MenuZeroFillWindowRect(0, 14, 29, 19);
    gTasks[taskId].func = sub_80A6760;
}

void BuyMenuDisplayMessage(u16 itemId, u16 quantity)
{
    sub_80B7A94(ItemId_GetPrice(itemId) / 2 * quantity, 6, 6, 11);
    ConvertIntToDecimalStringN(gStringVar1, ItemId_GetPrice(itemId) / 2 * quantity, 0, 6);
}

void sub_80A683C(void)
{
    sub_80B7C14(gSaveBlock1.money, 0, 0);
    sub_80A4008(gBGTilemapBuffers[1], 1, 1, 12, 2);
}

void sub_80A6870(u16 itemId, u8 quantity)
{
    sub_80B79B8(&gSaveBlock1.money, ItemId_GetPrice(itemId) / 2 * quantity);
    sub_80B7BEC(gSaveBlock1.money, 0, 0);
}

void sub_80A68A4(void)
{
    if (sub_80A34B4() == TRUE)
        gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
}

void sub_80A68CC(void)
{
    gUnknown_02038559 = 3;
    gUnknown_03000701 = 4;
    SetMainCallback2(sub_80A68A4);
}

void sub_80A68F0(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)sub_80546B8 >> 16;
    gTasks[taskId].data[9] = (u32)sub_80546B8;
    sub_80A5AE4(taskId);
}

void sub_80A6918(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)sub_80546B8 >> 16;
    gTasks[taskId].data[9] = (u32)sub_80546B8;
    sub_80A5AAC(taskId);
}

void sub_80A6940(void)
{
    while (1)
    {
        if (sub_80A317C() == TRUE)
        {
            gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
            sub_80A699C();
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_80A6978(void)
{
    gUnknown_02038559 = 3;
    gUnknown_03000701 = 5;
    SetMainCallback2(sub_80A6940);
}

void sub_80A699C(void)
{
    gUnknown_03000704 = gUnknown_083C16B8;
    gUnknown_02038564 = 4;
}

void sub_80A69B8(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)sub_804E990 >> 16;
    gTasks[taskId].data[9] = (u32)sub_804E990;
    sub_80A5AE4(taskId);
}

void sub_80A69E0(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)sub_804E990 >> 16;
    gTasks[taskId].data[9] = (u32)sub_804E990;
    sub_80A5AAC(taskId);
}

void sub_80A6A08(void)
{
    if (sub_80A34B4() == TRUE)
        gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
}

void sub_80A6A30(void)
{
    gUnknown_03000701 = 6;
    SetMainCallback2(sub_80A6A08);
}

void sub_80A6A4C(u8 taskId)
{
    gFieldCallback = ItemStorage_ReturnToMenuAfterDeposit;
    gTasks[taskId].data[8] = (u32)c2_exit_to_overworld_2_switch >> 16;
    gTasks[taskId].data[9] = (u32)c2_exit_to_overworld_2_switch;
    sub_80A5AE4(taskId);
}

void sub_80A6A84(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    sub_80A4DA4(gBGTilemapBuffers[1]);
    CopyItemName(gScriptItemId, gStringVar1);
    ConvertIntToDecimalStringN(gStringVar2, taskData[1], 0, 3);
    MenuZeroFillWindowRect(7, 6, 11, 13);
    sub_80A7528(7);
    sub_80A3D5C(taskId);
    gTasks[taskId].func = sub_80A5E1C;
}

void sub_80A6B00(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        gTasks[taskId].data[10] = 0;
        sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
        PlaySE(SE_SELECT);
        sub_80A5D38(taskId);
    }
}

void sub_80A6B64(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    if (ItemId_GetImportance(gScriptItemId) == 2)
    {
        gTasks[taskId].func = sub_80A6B00;
        sub_80A7528(9);
    }
    else
    {
        if (AddPCItem(gScriptItemId, taskData[1]) == TRUE)
        {
            sub_80A6A84(taskId);
        }
        else
        {
            gTasks[taskId].func = sub_80A6B00;
            sub_80A7528(8);
        }
    }
}

void sub_80A6BE0(u8 taskId)
{
    if (sub_80A5350(taskId) == TRUE)
        return;
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_80A4DA4(gBGTilemapBuffers[1]);
        sub_80A6B64(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].data[10] = 0;
        sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
        PlaySE(SE_SELECT);
        sub_80A5D38(taskId);
    }
}

void sub_80A6C6C(u8 taskId)
{
    gTasks[taskId].data[10] = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 + 1;
    sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
    sub_80A73FC();
    PlaySE(SE_SELECT);
    sub_80A7590();
    if (gUnknown_02038559 != 4)
    {
        gTasks[taskId].func = sub_80A6BE0;
        sub_80A7528(6);
        if (gUnknown_02038559 + 1 == 4)  // if (gUnknown_02038559 == 3)
            sub_80A4DD8(taskId, 6, 9, 7, 3, 3);
        else
            sub_80A4DD8(taskId, 7, 9, 6, 3, 2);
    }
    else
    {
        gTasks[taskId].data[1] = 1;
        sub_80A6B64(taskId);
    }
}

bool32 sub_80A6D1C(void)
{
    HideMapNamePopup();
    if (gSaveBlock1.registeredItem != 0)
    {
        if (CheckBagHasItem(gSaveBlock1.registeredItem, 1) == TRUE)
        {
            u8 taskId;

            ScriptContext2_Enable();
            FreezeMapObjects();
            sub_80594C0();
            sub_80597F4();
            gScriptItemId = gSaveBlock1.registeredItem;
            taskId = CreateTask(ItemId_GetFieldFunc(gSaveBlock1.registeredItem), 8);
            gTasks[taskId].data[2] = 1;
            return TRUE;
        }
        gSaveBlock1.registeredItem = 0;
    }
    ScriptContext1_SetupScript(Event_NoRegisteredItem);
    return TRUE;
}

void sub_80A6D98(void)
{
    while (1)
    {
        if (sub_80A317C() == TRUE)
        {
            gUnknown_02038563 = CreateTask(sub_80A50C8, 0);
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void sub_80A6DCC(void)
{
    gUnknown_03000700 = 0;
    gUnknown_03000701 = 1;
    SetMainCallback2(sub_80A6D98);
}

void sub_80A6DF0(u16 *a)
{
    u8 r6 = (gUnknown_02038564 - 1) * 2;

    MenuDrawTextWindow(7, 9 - r6, 13, 12);
    sub_80A4008(a, 8, 10 - r6, 5, r6 + 2);
    if (gUnknown_02038564 == 1)
    {
        MenuPrint(gUnknown_083C1640[gUnknown_03000704[0]].text, 8, 10);
    }
    else
    {
        MenuPrint(gUnknown_083C1640[gUnknown_03000704[0]].text, 8, 8);
        MenuPrint(gUnknown_083C1640[gUnknown_03000704[1]].text, 8, 10);
    }
    InitMenu(0, 8, 10 - r6, gUnknown_02038564, 0, 5);
    sub_80A7528(2);
}

void sub_80A6EB8(u8 taskId)
{
    if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x40)
    {
        if (gUnknown_03000700 == 1)
        {
            PlaySE(SE_SELECT);
            gUnknown_03000700 = MoveMenuCursor(-1);
        }
    }
    else if ((gMain.newAndRepeatedKeys & DPAD_ANY) == 0x80)
    {
        if (gUnknown_03000700 + 1 < gUnknown_02038564)
        {
            PlaySE(SE_SELECT);
            gUnknown_03000700 = MoveMenuCursor(1);
        }
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        gTasks[taskId].data[10] = 0;
        sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
        sub_80A4DA4(gBGTilemapBuffers[1]);
        gUnknown_083C1640[gUnknown_03000704[gUnknown_03000700]].func(taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].data[10] = 0;
        sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
        sub_80A4DA4(gBGTilemapBuffers[1]);
        gUnknown_083C1640[5].func(taskId);
    }
}

const u8 gUnknown_083C1708[] = {4, 5};
const u8 gUnknown_083C170A[] = {5, 0};

void sub_80A6FDC(void)
{
    if (ItemId_GetBattleUsage(gScriptItemId) != 0)
    {
        gUnknown_03000704 = gUnknown_083C1708;
        gUnknown_02038564 = 2;
    }
    else
    {
        gUnknown_03000704 = gUnknown_083C170A;
        gUnknown_02038564 = 1;
    }
}

void sub_80A7024(u8 taskId)
{
    gUnknown_03000700 = 0;
    sub_80A6FDC();
    gTasks[taskId].data[10] = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 + 1;
    sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
    sub_80A73FC();
    sub_80A6DF0(gBGTilemapBuffers[1]);
    gTasks[taskId].func = sub_80A6EB8;
}

void sub_80A7094(u8 taskId)
{
    gTasks[taskId].data[8] = (u32)sub_802E424 >> 16;
    gTasks[taskId].data[9] = (u32)sub_802E424;
    gTasks[taskId].func = HandleItemMenuPaletteFade;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80A70D8(u8 taskId)
{
    PlaySE(SE_SELECT);
    sub_80A7094(taskId);
}

void ItemMenu_UseInBattle(u8 taskId)
{
    if (ItemId_GetBattleFunc(gScriptItemId) != NULL)
    {
        PlaySE(SE_SELECT);
        ItemId_GetBattleFunc(gScriptItemId)(taskId);
    }
}

void sub_80A7124(u8 taskId)
{
    PlaySE(SE_SELECT);
    sub_80A7528(0);
    sub_80A41D4(taskId);
    ItemListMenu_InitMenu();
    sub_80A37C0(taskId);
}

void sub_80A7150(void)
{
    while (1)
    {
        if (sub_80A317C() == TRUE)
        {
            gUnknown_02038563 = CreateTask(sub_80A7230, 0);
            gTasks[gUnknown_02038563].data[15] = 0;
            break;
        }
        if (sub_80F9344() == TRUE)
            break;
    }
}

void PrepareBagForWallyTutorial(void)
{
    u8 i;

    gUnknown_03000700 = 0;
    gUnknown_02038559 = 0;
    for (i = 0; i < 5; i++)
    {
        gUnknown_03005D10[i].unk0 = 0;
        gUnknown_03005D10[i].unk1 = 0;
    }

    // Save player's items
    memcpy(ewram1E000, gSaveBlock1.bagPocket_Items, sizeof(gSaveBlock1.bagPocket_Items));
    memcpy(ewram1F000, gSaveBlock1.bagPocket_PokeBalls, sizeof(gSaveBlock1.bagPocket_PokeBalls));

    // Add Wally's items to the bag
    ClearItemSlots(gSaveBlock1.bagPocket_Items, ARRAY_COUNT(gSaveBlock1.bagPocket_Items));
    ClearItemSlots(gSaveBlock1.bagPocket_PokeBalls, ARRAY_COUNT(gSaveBlock1.bagPocket_PokeBalls));
    AddBagItem(ITEM_POTION, 1);
    AddBagItem(ITEM_POKE_BALL, 1);

    gUnknown_03000701 = 7;
    SetMainCallback2(sub_80A7150);
}

void sub_80A7230(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    switch (taskData[15])
    {
    case 102:
        PlaySE(SE_SELECT);
        sub_80A4E8C(1, 2);
        break;
    case 204:
        PlaySE(SE_SELECT);
        sub_80F98A4(2);
        sub_80F98A4(3);
        gScriptItemId = ITEM_POKE_BALL;
        gUnknown_03000704 = gUnknown_083C1708;
        gUnknown_02038564 = 2;
        gTasks[taskId].data[10] = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0 + 1;
        sub_80A48E8(taskId, gUnknown_03005D10[gUnknown_02038559].unk0, gUnknown_03005D10[gUnknown_02038559].unk0);
        sub_80A73FC();
        sub_80A6DF0(gBGTilemapBuffers[1]);
        break;
    case 306:
        PlaySE(SE_SELECT);
        sub_80A4DA4(gBGTilemapBuffers[1]);

        // Restore player's items
        memcpy(gSaveBlock1.bagPocket_Items, ewram1E000, sizeof(gSaveBlock1.bagPocket_Items));
        memcpy(gSaveBlock1.bagPocket_PokeBalls, ewram1F000, sizeof(gSaveBlock1.bagPocket_PokeBalls));

        taskData[8] = (u32)sub_802E424 >> 16;
        taskData[9] = (u32)sub_802E424;
        gTasks[taskId].func = HandleItemMenuPaletteFade;
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        return;
    }
    taskData[15]++;
}

void ItemListMenu_InitMenu(void)
{
    InitMenu(0, 14, 2, gUnknown_03005D10[gUnknown_02038559].unk3 + 1, gUnknown_03005D10[gUnknown_02038559].unk0, 0);
    CreateBlendedOutlineCursor(16, 0xFFFF, 12, 0x2D9F, 15);
    sub_80A73C0();
}

void sub_80A73C0(void)
{
    sub_814AD7C(0x70, gUnknown_03005D10[gUnknown_02038559].unk0 * 16 + 16);
}

void sub_80A73F0(void)
{
    sub_814ADC8();
}

void sub_80A73FC(void)
{
    HandleDestroyMenuCursors();
    sub_814AD44();
}

void sub_80A740C(void)
{
    sub_80A75E4();
    sub_80A7768();
    sub_80A7420();
}

void sub_80A7420(void)
{
    struct UnknownStruct2 *unkStruct = &gUnknown_0203853C;
    int var;

    switch (unkStruct->unk0)
    {
    case 3:
        unkStruct->unk0 = 2;
        break;
    case 2:
        switch (unkStruct->unk2)
        {
        case 0:
            var = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0;
            ItemListMenu_ChangeDescription(gUnknown_03005D24[var].itemId, unkStruct->unk1);
            break;
        case 1:
            sub_80A4A98(gOtherText_SwitchWhichItem, unkStruct->unk1);
            break;
        case 2:
            sub_80A4A98(gOtherText_WhatWillYouDo2, unkStruct->unk1);
            break;
        case 3:
            sub_80A4A98(gOtherText_HowManyToToss, unkStruct->unk1);
            break;
        case 4:
            sub_80A4A98(gOtherText_ThrewAwayItem, unkStruct->unk1);
            break;
        case 5:
            sub_80A4A98(gOtherText_OkayToThrowAwayPrompt, unkStruct->unk1);
            break;
        case 6:
            sub_80A4A98(gOtherText_HowManyToDeposit, unkStruct->unk1);
            break;
        case 7:
            sub_80A4A98(gOtherText_DepositedItems, unkStruct->unk1);
            break;
        case 8:
            sub_80A4A98(gOtherText_NoRoomForItems, unkStruct->unk1);
            break;
        case 9:
            sub_80A4A98(gOtherText_CantStoreSomeoneItem, unkStruct->unk1);
            break;
        }
        unkStruct->unk1++;
        if (unkStruct->unk1 == 3)
        {
            unkStruct->unk0 = 0;
            sub_80A7918();
        }
        break;
    }
}

void sub_80A751C(void)
{
    gUnknown_0203853C.unk0 = 0;
}

void sub_80A7528(u8 a)
{
    gUnknown_0203853C.unk1 = 0;
    gUnknown_0203853C.unk2 = a;
    switch (sub_80A78F4())
    {
    case 0:
        gUnknown_0203853C.unk0 = 2;
        while (gUnknown_0203853C.unk0 != 0)
            sub_80A7420();
        break;
    case 1:
        gUnknown_0203853C.unk0 = 3;
        break;
    case 2:
        gUnknown_0203853C.unk0 = 1;
        break;
    }
}

void sub_80A756C(void)
{
    if (gUnknown_0203853C.unk0 == 2 || gUnknown_0203853C.unk0 == 3)
        sub_80A7918();
    gUnknown_0203853C.unk0 = 0;
}

void sub_80A7590(void)
{
    MenuZeroFillWindowRect(0, 13, 13, 20);
    sub_80A756C();
}

void sub_80A75A8(void)
{
    if (gUnknown_0203853C.unk0 == 2 || gUnknown_0203853C.unk0 == 3)
        gUnknown_0203853C.unk0 = 1;
}

void sub_80A75C4(void)
{
    switch (gUnknown_0203853C.unk0)
    {
    case 1:
        gUnknown_0203853C.unk0 = 3;
        break;
    case 0:
        sub_80A7918();
        break;
    }
}

void sub_80A75E4(void)
{
    if (gUnknown_02038540.unk0 == 1 && sub_80A7988() == 0)
    {
        int r1;

        sub_80A47E8(gUnknown_02038563, gUnknown_02038540.unk1, gUnknown_02038540.unk1, 1);
        gUnknown_02038540.unk1++;
        if (gUnknown_02038540.unk2 != 0)
            r1 = 5;
        else
            r1 = 7;
        if (r1 < gUnknown_02038540.unk1)
        {
            gUnknown_02038540.unk0 = 0;
            sub_80A78E8();
        }
    }
}

void sub_80A7630(void)
{
    gUnknown_02038540.unk0 = 0;
}

void sub_80A763C(void)
{
    struct UnknownStruct3 *r4 = &gUnknown_02038540;

    switch (sub_80A78C4())
    {
    case FALSE:
        sub_80A48E8(gUnknown_02038563, 0, 7);
        break;
    case TRUE:
        r4->unk0 = 1;
        r4->unk1 = 0;
        r4->unk2 = 0;
        break;
    }
}

void sub_80A7678(void)
{
    if (gUnknown_02038540.unk0 == 1)
        sub_80A78E8();
    gUnknown_02038540.unk0 = 0;
}

void sub_80A7694(void)
{
    gUnknown_02038540.unk2 = 1;
}

void sub_80A76A0(void)
{
    MenuZeroFillWindowRect(14, 2, 29, 18);
    sub_80A7678();
}

bool32 sub_80A76B8(void)
{
    struct UnknownStruct3 *s = &gUnknown_02038540;

    return (s->unk0 == 0);
}

bool32 sub_80A76D0(void)
{
    struct UnknownStruct3 *s = &gUnknown_02038540;

    return (s->unk1 > 5);
}

void sub_80A76E8(void)
{
    if (gUnknown_02038544.unk0 == 1)
    {
        DisplayItemMessageOnField(
          gUnknown_02038544.unk1,
          gUnknown_02038544.unk4,
          gUnknown_02038544.unk8,
          gUnknown_02038544.unk2);
        gUnknown_02038544.unk0 = 0;
    }
}

void sub_80A770C(void)
{
    gUnknown_02038544.unk0 = 0;
}

void DisplayCannotUseItemMessage(int a, const u8 *b, TaskFunc func, int d)
{
    struct UnknownStruct4 *r4 = &gUnknown_02038544;

    switch (sub_80A7924())
    {
    case 0:
        DisplayItemMessageOnField(a, b, func, d);
        break;
    case 2:
        r4->unk0 = 1;
        r4->unk1 = a;
        r4->unk4 = b;
        r4->unk8 = func;
        r4->unk2 = d;
        break;
    }
}

void sub_80A7768(void)
{
    struct UnknownStruct5 *r4 = &gUnknown_02038550;

    if (r4->unk0 == 2)
    {
        if (r4->unk1 != 0)
        {
            if (r4->unk2 != 1)
            {
                const u8 *text = gUnknown_083C1640[gUnknown_03000704[r4->unk1 - 1]].text;
                int var = r4->unk1 - 1;

                MenuPrint(text, 7, var * 2 + 1 + r4->unk3);
            }
            else
            {
                const u8 *text;
                int var;

                if (r4->unk1 == 1)
                    text = sub_80A4B90(gScriptItemId);
                else
                    text = gUnknown_083C1640[gUnknown_03000704[r4->unk1 - 1]].text;
                var = r4->unk1 - 1;
                MenuPrint(text, (var >> 1) * 6 + 1, (var & 1) * 2 + 8);
            }
            if (r4->unk1 == gUnknown_02038564)
            {
                r4->unk0 = 0;
                sub_80A7970();
            }
        }
        r4->unk1++;
    }
}

void sub_80A7828(void)
{
    gUnknown_02038550.unk0 = 0;
}

void sub_80A7834(int a, int b)
{
    struct UnknownStruct5 *r4 = &gUnknown_02038550;

    switch (sub_80A7958())
    {
    case 1:
        r4->unk0 = 2;
        r4->unk1 = 0;
        r4->unk2 = a;
        r4->unk3 = b;
        break;
    case 2:
        r4->unk0 = 1;
        r4->unk1 = 0;
        r4->unk2 = a;
        r4->unk3 = b;
        break;
    }
}

void sub_80A7868(void)
{
    if (gUnknown_02038550.unk0 == 2)
        gUnknown_02038550.unk0 = 1;
}

void sub_80A7880(void)
{
    switch (gUnknown_02038550.unk0)
    {
    case 1:
        gUnknown_02038550.unk0 = 2;
        break;
    case 0:
        sub_80A7970();
        break;
    }
}

bool32 sub_80A78A0(void)
{
    struct UnknownStruct5 *r0 = &gUnknown_02038550;

    return (r0->unk0 == 0);
}

void sub_80A78B8(void)
{
    gUnknown_02038554 = 0;
}

bool32 sub_80A78C4(void)
{
    bool32 retVal;

    if (gLinkOpen == TRUE)
    {
        sub_80A7868();
        sub_80A75A8();
        retVal = TRUE;
    }
    else
    {
        retVal = FALSE;
    }
    return retVal;
}

void sub_80A78E8(void)
{
    sub_80A7880();
}

int sub_80A78F4(void)
{
    int retVal;

    if (gLinkOpen == TRUE)
    {
        if (sub_80A76B8() != 0)
            retVal = 1;
        else
            retVal = 2;
    }
    else
    {
        retVal = 0;
    }
    return retVal;
}

void sub_80A7918(void)
{
    sub_80A76E8();
}

int sub_80A7924(void)
{
    if (gLinkOpen == TRUE && sub_80A76B8() == 0)
    {
        if (sub_80A76D0() != 0)
        {
            sub_80A7678();
            return 0;
        }
    }
    else
    {
        return 0;
    }
    sub_80A7694();
    return 2;
}

int sub_80A7958(void)
{
    if (sub_80A76B8() == 0)
        return 2;
    sub_80A75A8();
    return 1;
}

void sub_80A7970(void)
{
    sub_80A75C4();
}

void sub_80A797C(void)
{
    gUnknown_02038554 = 1;
}

int sub_80A7988(void)
{
    int val = gUnknown_02038554;

    gUnknown_02038554 = 0;
    return val;
}

void sub_80A7998(struct Sprite *sprite)
{
    sprite->animNum = 0;
    sprite->data0 = 0;
    sprite->data1 = 0;
    sprite->data2 = 0;
    sprite->data3 = 0;
    sprite->data4 = 0;
    sprite->callback = sub_80A79B4;
}

void sub_80A79B4(struct Sprite *sprite)
{
    if (gUnknown_0203855B != -1)
        sub_80A79EC(sprite);
    if (gUnknown_0203855C != 0)
        sub_80A7A94(sprite);
}
