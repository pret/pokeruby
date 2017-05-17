#include "global.h"
#include "menu.h"
#include "pokemon.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "sprite.h"
#include "palette.h"
#include "event_data.h"
#include "main.h"

#define DATA_COUNT (6)

struct Unk201C000
{
    /*0x00*/ struct Pokemon *pokemon;
    /*0x04*/ u8 unk4;
    /*0x05*/ u8 unk5;
    /*0x06*/ u16 unk6;
    /*0x08*/ u8 pad_08[4];
    /*0x0C*/ s32 var0C;
    /*0x10*/ TaskFunc unk10;
};

struct Unk201B000
{
    u8 filler0[0x260];
    u8 unk260;
    u8 unk261;
    u8 filler262[2];
    s16 unk264[DATA_COUNT * 2];
    u8 filler27C[2];
    s16 unk27E;
    s16 unk280;
    u16 unk282;
};

struct UnknownStruct5
{
    u8 unk0;
    u8 unk1;
    u16 *unk4;
};

extern u8 ewram[];
#define ewram1B000 (*(struct Unk201B000 *)(ewram + 0x1B000))
#define ewram1C000 (*(struct Unk201C000 *)(ewram + 0x1C000))

extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F6;
extern u8 gUnknown_0202E8FA;
extern u8 gLastFieldPokeMenuOpened;

//extern const u16 gUnknown_083769A8[][6];
//extern const u8 gUnknown_083769A8[][12];
extern const u8 gUnknown_083769A8[];
extern u8 gUnknown_08376D1C[DATA_COUNT];
extern u8 *gUnknown_08376D04[DATA_COUNT];
extern void (*const gUnknown_08376B54[])(u8);
extern const struct UnknownStruct5 gUnknown_08376BB4[][6];
extern u8 gOtherText_TallPlusAndRightArrow[];
extern u8 gOtherText_WontHaveAnyEffect[];
extern const u8 gMoveNames[][13];
extern u8 *const gItemEffectTable[];

extern bool8 IsDoubleBattle(void);
extern void AddBagItem();
extern void RemoveBagItem();
extern void SetUpBattlePokemonMenu(u8);
extern void sub_808B0C0(u8);

void task_pc_turn_off();
static void sub_806E884(u8 taskId);
void sub_806F8AC(u8 taskId);
void sub_806FB0C(u8 taskId);
void PartyMenuUpdateLevelOrStatus(struct Pokemon *, u8);
u8 ExecuteTableBasedItemEffect__(u8, u16, u8);
void sub_80701DC(u8 taskId);
void DoRecoverPP(u8);
void sub_806D538();
void sub_806D5A4(void);
void sub_806E8D0();
void GetMedicineItemEffectMessage();

/*
void sub_806AEDC(void)
{
    const struct UnknownStruct5 *r5;
    s32 i;

    AnimateSprites();
    BuildOamBuffer();
    r5 = gUnknown_08376BB4[gUnknown_0202E8FA];
    for (i = 0; i < 6; i++)
        sub_800142C(r5[i].unk0 * 8, r5[i].unk1 * 8, r5[i].unk4, 0, (i << 5) | 0x200);
    RunTasks();
    UpdatePaletteFade();
}
*/

u8 sub_806E834(u8 *message, u8 arg1)
{
    u8 taskId;

    gUnknown_0202E8F6 = 1;

    MenuDrawTextWindow(3, 14, 26, 19);
    MenuPrintMessage(message, 4, 15);

    taskId = CreateTask(sub_806E884, 1);
    gTasks[taskId].data[0] = arg1;

    return taskId;
}

static void sub_806E884(u8 taskId)
{
    if (MenuUpdateWindowText() == 0)
    {
        return;
    }

    gUnknown_0202E8F6 = 0;

    if (gTasks[taskId].data[0] == 0)
    {
        MenuZeroFillWindowRect(3, 14, 26, 19);
    }

    DestroyTask(taskId);
}

asm(".section .text_b");

void sub_8070088(u8 taskId)
{
    u8 taskId2;

    gTasks[taskId].func = TaskDummy;
    if (GetMonData(&gPlayerParty[ewram1C000.unk5], MON_DATA_SPECIES) == 0)
    {
        gTasks[taskId].func = sub_80701DC;
    }
    else
    {
        s16 *taskData;

        taskId2 = CreateTask(TaskDummy, 5);
        taskData = gTasks[taskId2].data;
        ewram1C000.pokemon = &gPlayerParty[ewram1C000.unk5];
        taskData[10] = GetMonData(ewram1C000.pokemon, MON_DATA_MAX_HP);
        taskData[11] = GetMonData(ewram1C000.pokemon, MON_DATA_HP);
        if (ExecuteTableBasedItemEffect__(ewram1C000.unk5, ewram1C000.unk6, 0))
        {
            DestroyTask(taskId2);
            gTasks[taskId].func = sub_80701DC;
        }
        else
        {
            gUnknown_0202E8F4 = 1;
            MenuZeroFillWindowRect(3, 14, 26, 19);
            PlaySE(SE_KAIFUKU);
            PartyMenuUpdateLevelOrStatus(ewram1C000.pokemon, ewram1C000.unk5);
            task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + ewram1C000.unk5 * 2], 9);
            ewram1B000.unk261 = 2;
            taskData[12] = GetMonData(ewram1C000.pokemon, MON_DATA_HP) - taskData[11];
            taskData[14] = 1;
            ewram1B000.unk27E = 1;
            ewram1B000.unk280 = 1;
            ewram1B000.unk282 = taskData[11];
            ewram1C000.var0C = -32768;
            gTasks[taskId2].func = sub_806F8AC;
        }
    }
}

void sub_80701DC(u8 taskId)
{
    if (ewram1B000.unk27E == 1)
    {
        AddBagItem(ewram1C000.unk6, 1);
        if (GetMonData(&gPlayerParty[ewram1C000.unk5], MON_DATA_SPECIES) != 0)
        {
            task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + ewram1C000.unk5 * 2], 3);
            ewram1B000.unk261 = 2;
        }
        ewram1B000.unk27E = 0;
    }
    ewram1C000.unk5++;
    if (ewram1C000.unk5 == 6)
    {
        gUnknown_0202E8F4 = 0;
        if (ewram1B000.unk280 == 0)
        {
            gTasks[taskId].func = TaskDummy;
            sub_806E834(gOtherText_WontHaveAnyEffect, 1);
            CreateTask(sub_806FB0C, 8);
        }
        else
        {
            RemoveBagItem(ewram1C000.unk6, 1);
            gTasks[taskId].func = ewram1C000.unk10;
        }
        gLastFieldPokeMenuOpened = 0;
    }
    else
    {
        sub_8070088(taskId);
    }
}

void CreateItemUseMoveMenu(u8 partyMonIndex)
{
    u8 r6;
    u8 i;

    r6 = 0;
    MenuDrawTextWindow(19, 10, 29, 19);
    for (i = 0; i < 4; i++)
    {
        u16 move = GetMonData(&gPlayerParty[partyMonIndex], MON_DATA_MOVE1 + i);

        MenuPrint(gMoveNames[move], 20, i * 2 + 11);
        if (move != 0)
            r6++;
    }
    InitMenu(0, 20, 11, r6, 0, 9);
}

void Task_HandleItemUseMoveMenuInput(u8 taskId)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(-1);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(1);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        gUnknown_08376B54[0](taskId);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        gUnknown_08376B54[1](taskId);
    }
}

void DoPPRecoveryItemEffect(u8 taskId, u16 b, TaskFunc c)
{
    u8 *itemEffect;
    u8 taskId2;

    if (b == 0xAF)
        itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
    else
        itemEffect = gItemEffectTable[b - 13];
    gTasks[taskId].func = TaskDummy;
    taskId2 = CreateTask(TaskDummy, 5);
    sub_806E8D0(taskId, b, c);
    if (!(itemEffect[4] & 0x10))
    {
        gTasks[taskId2].data[11] = 0;
        DoRecoverPP(taskId2);
    }
    else
    {
        PlaySE(SE_SELECT);
        sub_806D538(10, 3);
        CreateItemUseMoveMenu(ewram1C000.unk5);
        gTasks[taskId2].func = Task_HandleItemUseMoveMenuInput;
        gMain.newKeys = 0;
    }
}

void ItemUseMoveMenu_HandleMoveSelection(u8 taskId)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(19, 10, 29, 19);
    sub_806D5A4();
    gTasks[taskId].data[11] = GetMenuCursorPos();
    DoRecoverPP(taskId);
}

void ItemUseMoveMenu_HandleCancel(u8 taskId)
{
    sub_8072DEC();
    MenuZeroFillWindowRect(19, 10, 29, 19);
    if (gMain.inBattle)
        gTasks[ewram1C000.unk4].func = SetUpBattlePokemonMenu;
    else
        gTasks[ewram1C000.unk4].func = sub_808B0C0;
    sub_806D538(3, 0);
    DestroyTask(taskId);
}

void DoRecoverPP(u8 taskId)
{
    u16 r5 = 0;

    if (ExecuteTableBasedItemEffect__(ewram1C000.unk5, ewram1C000.unk6, gTasks[taskId].data[11]))
    {
        gUnknown_0202E8F4 = r5;
        PlaySE(SE_SELECT);
        sub_806E834(gOtherText_WontHaveAnyEffect, 1);
    }
    else
    {
        gUnknown_0202E8F4 = 1;
        PlaySE(SE_KAIFUKU);
        RemoveBagItem(ewram1C000.unk6, 1);
        r5 = GetMonData(ewram1C000.pokemon, MON_DATA_MOVE1 + gTasks[taskId].data[11]);
        StringCopy(gStringVar1, gMoveNames[r5]);
        GetMedicineItemEffectMessage(ewram1C000.unk6);
        sub_806E834(gStringVar4, 1);
    }
    gTasks[taskId].func = sub_806FB0C;
}

asm(".section .text_c");

void sub_8070848(u8 taskId)
{
    u8 i;

    MenuDrawTextWindow(11, 0, 29, 7);

    for (i = 0; i < DATA_COUNT; i++)
    {
        u8 x;
        u8 y;
        u32 stat;

        stat = GetMonData(ewram1C000.pokemon, gUnknown_08376D1C[i]);

        ewram1B000.unk264[i + DATA_COUNT] = stat;
        ewram1B000.unk264[i] = stat - ewram1B000.unk264[i];

        x = (i / 3) * 9 + 11;
        y = ((i % 3) << 1) + 1;

        MenuPrint_PixelCoords(gUnknown_08376D04[i], (x + 1) * 8, y * 8, 1);

        if (i == 2)
            MenuPrint_PixelCoords(gOtherText_TallPlusAndRightArrow, (x + 6) * 8 + 6, y * 8, 0);
        else
            MenuPrint_PixelCoords(gOtherText_TallPlusAndRightArrow, (x + 6) * 8 + 6, y * 8, 1);

        gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
        gStringVar1[1] = 0x14;
        gStringVar1[2] = 0x06;

        ConvertIntToDecimalStringN(gStringVar1 + 3, ewram1B000.unk264[i], 1, 2);

        MenuPrint_PixelCoords(gStringVar1, (x + 6) * 8 + 12, y * 8, 0);
    }
}
