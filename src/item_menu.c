#include "global.h"
#include "data2.h"
#include "decompress.h"
#include "field_player_avatar.h"
#include "graphics.h"
#include "item.h"
#include "items.h"
#include "item_use.h"
#include "mail_data.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "party_menu.h"
#include "rom4.h"
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

extern u8 gUnknown_02038540[];
extern u8 gUnknown_02038558;
extern s8 gUnknown_02038559;  // selected pocket
extern u8 gUnknown_0203855A;
extern u8 gUnknown_0203855B;
extern u8 gUnknown_0203855C;
extern u8 gUnknown_02038560;
extern u8 gUnknown_02038562;
extern u8 gUnknown_02038564;
extern u8 gUnknown_03000700;
extern u8 gUnknown_03000701;
extern const u8 *gUnknown_03000704;
extern struct UnknownStruct1 gUnknown_03005D10[];
extern struct ItemSlot *gUnknown_03005D24;  // selected pocket item slots
extern bool8 gLinkOpen;

extern void gpu_pal_allocator_reset__manage_upper_four(void);
extern void sub_80F9020(void);
extern void sub_80F9988();
extern void sub_809D104(u16 *, u16, u16, const u8 *, u16, u16, u16, u16);
extern void PauseVerticalScrollIndicator();
extern u8 sub_80F9284(void);
extern void sub_808B5B4();

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

extern const u8 gUnknown_083C1690[][6];
/*
const u8 gUnknown_083C1690[][6] =
{
    {0, 1, 6, 2, 0, 0},
    {6, 1, 8, 2, 0, 0},
    {0, 8, 6, 2, 0, 0},
    {7, 0, 1, 8, 6, 2},
    {0, 8, 3, 2, 0, 0},
};
*/
extern const TaskFunc gUnknown_083C16BC[][2];

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
void ItemListMenu_InitMenu(void);
void sub_80A73C0(void);
void sub_80A73F0(void);
void sub_80A73FC(void);
void sub_80A740C(void);
void sub_80A751C(void);
void sub_80A7528();
void sub_80A7590(void);
void sub_80A7630(void);
void sub_80A763C(void);
void sub_80A76A0(void);
void sub_80A770C(void);
void sub_80A7828(void);
void sub_80A7834();
void sub_80A78B8(void);
void sub_80A797C(void);
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
    do
    {
        if (sub_80A317C() == TRUE)
        {
            gUnknown_03000700 = 0;
            ResetTasks();
            return TRUE;
        }
    } while (sub_80F9344() != 1);
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

extern const u16 gUnknown_083C1704[];

void sub_80A3740(void)
{
    u16 arr[2];

    // TODO: This is a local array
    memcpy(arr, gUnknown_083C1704, 4);
    LoadPalette(&arr[1], 0xD1, sizeof(arr[1]));
    LoadPalette(&arr[0], 0xD8, sizeof(arr[0]));
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

void sub_80A4164(u8 *a, u16 b, int c, u8 d)
{
    *a++ = CHAR_MULT_SIGN;
    a[0] = EXT_CTRL_CODE_BEGIN;
    a[1] = 0x14;
    a[2] = 6;
    a += 3;
    ConvertIntToDecimalStringN(a, b, c, d);
}

void sub_80A418C(u16 a, int b, u8 c, u8 d, u8 e)
{
    sub_80A4164(gStringVar1, a, b, e);
    MenuPrint(gStringVar1, c, d);
}

void sub_80A41D4(void)
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
    u8 *r8 = gUnknown_02038540;

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
        if ((b == 1 && r8[2] != 0) || b == 2)
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

void sub_80A4A98(u8 *a, u32 b)
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
        if (sub_80F9344() == 1 && gUnknown_03000701 == 5)
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
