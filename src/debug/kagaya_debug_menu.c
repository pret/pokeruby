#if DEBUG

#include "global.h"
#include "field_effect.h"
#include "field_control_avatar.h"
#include "field_player_avatar.h"
#include "main.h"
#include "menu.h"
#include "overworld.h"
#include "palette.h"
#include "random.h"
#include "region_map.h"
#include "script.h"
#include "slot_machine.h"
#include "trainer_card.h"

extern u8 (*gMenuCallback)(void);

void InitKagayaDebugMenu_B(void);
u8 debug_sub_80B061C(void);
u8 KagayaDebugMenu_TrainerCard(void);
u8 debug_sub_80B068C(void);
u8 KagayaDebugMenu_CardToExchange(void);
u8 debug_sub_80B06E0(void);
u8 KagayaDebugMenu_SlotMachine(void);
u8 Kagaya_80B0734(void);
u8 debug_sub_80B07DC(void);

const u8 Str_83EBB34[] = _("Trainer’s card");
const u8 Str_83EBB43[] = _("Card to exchange");
const u8 Str_83EBB54[] = _("Slot machine");

const struct MenuAction _83EBB64[] =
{
	{ Str_83EBB34, KagayaDebugMenu_TrainerCard },
	{ Str_83EBB43, KagayaDebugMenu_CardToExchange },
	{ Str_83EBB54, KagayaDebugMenu_SlotMachine },
};

u8 InitKagayaDebugMenu_A(void)
{
    InitKagayaDebugMenu_B();
    return 0;
}

void InitKagayaDebugMenu_B(void)
{
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 14, 7);
    Menu_PrintItems(2, 1, 3, _83EBB64);
    InitMenu(0, 1, 1, 3, 0, 13);
    gMenuCallback = debug_sub_80B061C;
}

u8 debug_sub_80B061C(void)
{
    s8 input = Menu_ProcessInput();

    if (input == -2)
    {
        return 0;
    }
    else if (input == -1)
    {
        CloseMenu();
        return 1;
    }
    else
    {
        gMenuCallback = _83EBB64[input].func;
        return 0;
    }
}

u8 KagayaDebugMenu_TrainerCard(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gMenuCallback = debug_sub_80B068C;
    return 0;
}

u8 debug_sub_80B068C(void)
{
    if (!UpdatePaletteFade())
    {
        debug_sub_80A0710(c2_exit_to_overworld_1_sub_8080DEC);
        CloseMenu();
        ScriptContext2_Enable();
        return 1;
    }
    return 0;
}

u8 KagayaDebugMenu_CardToExchange(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gMenuCallback = debug_sub_80B06E0;
    return 0;
}

u8 debug_sub_80B06E0(void)
{
    if (!UpdatePaletteFade())
    {
        debug_sub_80A073C(c2_exit_to_overworld_1_sub_8080DEC);
        CloseMenu();
        ScriptContext2_Enable();
        return 1;
    }
    return 0;
}

u8 KagayaDebugMenu_SlotMachine(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gMenuCallback = Kagaya_80B0734;
    return 0;
}

u8 Kagaya_80B0734(void)
{
    if (!UpdatePaletteFade())
    {
        debug_sub_811609C(Random() % 6, c2_exit_to_overworld_1_sub_8080DEC);
        CloseMenu();
        ScriptContext2_Enable();
        return 1;
    }
    return 0;
}

u8 debug_sub_80B0770(void)
{
    if (!(gPlayerAvatar.flags & 8))
    {
        CloseMenu();
        if (IsPlayerFacingSurfableFishableWater())
        {
            gFieldEffectArguments[0] = 0;
            FieldEffectStart(9);
        }
    }
    else
    {
        CloseMenu();
    }
    return 1;
}

u8 debug_sub_80B07B0(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gMenuCallback = debug_sub_80B07DC;
    return 0;
}

u8 debug_sub_80B07DC(void)
{
    if (!UpdatePaletteFade())
    {
        CloseMenu();
        SetMainCallback2(CB2_InitFlyRegionMap);
        return 1;
    }
    return 0;
}

u8 debug_sub_80B0800(void)
{
    u8 r2;

    CloseMenu();
    r2 = TrySetDiveWarp();
    if (r2 != 0)
    {
        gFieldEffectArguments[0] = 0;
        gFieldEffectArguments[1] = r2 - 1;
        FieldEffectStart(0x2C);
    }
    return 1;
}

#endif // DEBUG
