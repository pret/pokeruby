#include "global.h"
#include "item.h"
#include "main.h"
#include "menu.h"
#include "menu_helpers.h"
#include "palette.h"
#include "rom4.h"
#include "sprite.h"
#include "task.h"
#include "text.h"
#include "unknown_task.h"

extern u8 ewram[];

struct UnknownStruct1
{
    u8 unk0;
    u8 unk1;
};

extern s8 gUnknown_02038559;
extern u8 gUnknown_0203855A;
extern u8 gUnknown_0203855B;
extern u8 gUnknown_0203855C;
extern u8 gUnknown_03000701;
extern struct UnknownStruct1 gUnknown_03005D10[];
extern struct ItemSlot *gUnknown_03005D24;

extern void gpu_pal_allocator_reset__manage_upper_four(void);
extern void sub_80F9020(void);
extern void sub_80F9988();

void sub_80A34E8(void);
u8 sub_80A3520(void);
void sub_80A362C(void);
void sub_80A3740(void);
void sub_80A39B8(u16 *, u8);
void sub_80A3AC0(u16 *, u8);
void sub_80A3C34();
void sub_80A3D08(void);
void sub_80A3D40(void);
void sub_80A48E8();
void ItemListMenu_InitDescription();
void ItemListMenu_InitMenu(void);
void sub_80A740C(void);
void sub_80A751C(void);
void sub_80A7630(void);
void sub_80A770C(void);
void sub_80A7828(void);
void sub_80A78B8(void);
void CreateBagSprite(void);
void CreateBagPokeballSprite();

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
        if (sub_80A3520() == 0)
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
        // What is this?
        sub_80A3C34(gBagPockets[2].itemSlots, *(u32 *)&gBagPockets[2].capacity);
        sub_80A3C34(gBagPockets[3].itemSlots, *(u32 *)&gBagPockets[3].capacity);
        sub_80A3D40();
        gUnknown_03005D24 = gBagPockets[gUnknown_02038559].itemSlots;
        sub_80A362C();
        gMain.state++;
        break;
    case 12:
        sub_80A48E8(0xFFFF, 0, 7);
        val = gUnknown_03005D10[gUnknown_02038559].unk1 + gUnknown_03005D10[gUnknown_02038559].unk0;
        ItemListMenu_InitDescription((s16)gUnknown_03005D24[val].itemId);
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
