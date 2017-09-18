#include "global.h"
#include "party_menu.h"
#include "battle.h"
#include "battle_interface.h"
#include "battle_party_menu.h"
#include "data2.h"
#include "event_data.h"
#include "evolution_scene.h"
#include "item.h"
#include "item_use.h"
#include "item_menu.h"
#include "mail_data.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokemon.h"
#include "pokemon_item_effect.h"
#include "pokemon_menu.h"
#include "pokemon_summary_screen.h"
#include "rom_8077ABC.h"
#include "rom_8094928.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "sprite.h"
#include "palette.h"
#include "event_data.h"
#include "main.h"
#include "item.h"
#include "battle_interface.h"
#include "species.h"
#include "party_menu.h"

struct Unk201C000
{
    /*0x00*/ struct Pokemon *pokemon;
    /*0x04*/ u8 unk4;
    /*0x05*/ u8 unk5;
    /*0x06*/ u16 unk6;
    /*0x08*/ u16 unk8;
    /*0x0A*/ u8 pad_0A[2];
    /*0x0C*/ s32 unkC;
    /*0x10*/ TaskFunc unk10;
    /*0x14*/ TaskFunc unk14;
};

struct Unk201F000
{
    u8 filler0[0xE00];
    u8 unkE00[3];  // not sure if this is an array or struct, or how big it is
};

struct UnknownStruct5
{
    u8 unk0;
    u8 unk1;
    u16 *unk4;
};

#define ewram1C000 (*(struct Unk201C000 *)(ewram + 0x1C000))
#define ewram1F000 (*(struct Unk201F000 *)(ewram + 0x1F000))

extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F6;
extern u16 gUnknown_0202E8F8;
extern u8 gUnknown_0202E8FA;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gPlayerPartyCount;
extern s32 gBattleMoveDamage;
extern u16 gMoveToLearn;

//extern const u16 gUnknown_083769A8[][6];
//extern const u8 gUnknown_083769A8[][12];
extern void *const gUnknown_08376858[][6];
extern const u8 gUnknown_083769A8[];
extern const u8 gUnknown_08376D1C[NUM_STATS];
extern const u16 gUnknown_08376504[];
extern void (*const gUnknown_08376B54[])(u8);
extern const u8 *const gUnknown_08376D04[NUM_STATS];
extern const struct UnknownStruct5 gUnknown_08376BB4[][6];

static void sub_806E884(u8 taskId);
void sub_8070D90(u8 taskId);
void PartyMenuTryDrawHPBar(u8, struct Pokemon *);

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

#if ENGLISH
#define WINDOW_LEFT (3)
#define WINDOW_RIGHT (26)
#elif GERMAN
#define WINDOW_LEFT (0)
#define WINDOW_RIGHT (29)
#endif

u8 sub_806E834(const u8 *message, u8 arg1)
{
    u8 taskId;

    gUnknown_0202E8F6 = 1;

    MenuDrawTextWindow(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
    MenuPrintMessage(message, WINDOW_LEFT + 1, 15);

    taskId = CreateTask(sub_806E884, 1);
    gTasks[taskId].data[0] = arg1;

    return taskId;
}

static void sub_806E884(u8 taskId)
{
    if (MenuUpdateWindowText())
    {
        gUnknown_0202E8F6 = 0;
        if (gTasks[taskId].data[0] == 0)
            MenuZeroFillWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
        DestroyTask(taskId);
    }
}

void sub_806E8D0(u8 taskId, u16 b, TaskFunc c)
{
    ewram1C000.unk10 = c;
    ewram1C000.unk4 = taskId;
    ewram1C000.unk5 = sub_806CA38(taskId);
    ewram1C000.unk6 = b;
    ewram1C000.pokemon = &gPlayerParty[ewram1C000.unk5];
}

bool8 PartyMenuUpdateMonHeldItem(struct Pokemon *pkmn, u16 item)
{
    u8 itemData[2];

    if (ItemIsMail(item) == TRUE)
    {
        if (GiveMailToMon(pkmn, item) == 0xFF)
            return TRUE;
        gUnknown_0202E8F4 = 2;
    }
    else
    {
        gUnknown_0202E8F4 = 1;
    }

    itemData[0] = item;
    itemData[1] = item >> 8;
    SetMonData(pkmn, MON_DATA_HELD_ITEM, itemData);
    return FALSE;
}

void PartyMenuTryGiveMonHeldItem(u8 taskId, u16 newItem, TaskFunc c)
{
    u16 currentItem;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, newItem, c);
    currentItem = GetMonData(ewram1C000.pokemon, MON_DATA_HELD_ITEM);
    gUnknown_0202E8F4 = 0;
    gUnknown_0202E8F8 = 0;
    if (currentItem != 0)
    {
        if (ItemIsMail(currentItem) == TRUE)
        {
            sub_806E834(gOtherText_MailMustBeRemoved, 1);
            CreateTask(party_menu_link_mon_held_item_object, 5);
        }
        else
        {
            GetMonNickname(ewram1C000.pokemon, gStringVar1);
            CopyItemName(currentItem, gStringVar2);
            StringExpandPlaceholders(gStringVar4, gOtherText_AlreadyHolding);
            sub_806E834(gStringVar4, 1);
            CreateTask(Task_ConfirmGiveHeldItem, 5);
            if (ItemIsMail(newItem) == TRUE)
                gUnknown_0202E8F8 = currentItem;
        }
    }
    else
    {
        PartyMenuUpdateMonHeldItem(ewram1C000.pokemon, newItem);
        RemoveBagItem(newItem, 1);
        if (ItemIsMail(newItem))
        {
            gTasks[taskId].func = c;
        }
        else
        {
            DisplayGiveHeldItemMessage(ewram1C000.unk5, newItem, 1);
            CreateTask(party_menu_link_mon_held_item_object, 5);
        }
    }
}

void party_menu_link_mon_held_item_object(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        SetHeldItemIconVisibility(ewram1C000.unk4, ewram1C000.unk5);
        gTasks[ewram1C000.unk4].func = ewram1C000.unk10;
        DestroyTask(taskId);
    }
}

void PartyMenuTryGiveMonHeldItem_806EACC(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        u16 currentItem;

        MenuZeroFillWindowRect(23, 8, 29, 13);
        currentItem = GetMonData(ewram1C000.pokemon, MON_DATA_HELD_ITEM);
        RemoveBagItem(ewram1C000.unk6, 1);
        if (AddBagItem(currentItem, 1) == TRUE)
        {
            PartyMenuUpdateMonHeldItem(ewram1C000.pokemon, ewram1C000.unk6);
            if (ItemIsMail(ewram1C000.unk6))
            {
                DisplayTakeHeldItemMessage(ewram1C000.unk5, currentItem, 1);
            }
            else
            {
                CopyItemName(ewram1C000.unk6, gStringVar1);
                StringExpandPlaceholders(gStringVar4, gOtherText_TakenAndReplaced);
                sub_806E834(gStringVar4, 1);
            }
        }
        else
        {
            sub_806E834(gOtherText_BagFullCannotRemoveItem, 0);
            AddBagItem(ewram1C000.unk6, 1);
        }
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(23, 8, 29, 13);
    }
    gTasks[taskId].func = party_menu_link_mon_held_item_object;
}

void Task_ConfirmGiveHeldItem(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = PartyMenuTryGiveMonHeldItem_806EACC;
    }
}

void DisplayGiveHeldItemMessage(u8 a, u16 b, u8 c)
{
    GetMonNickname(&gPlayerParty[a], gStringVar1);
    CopyItemName(b, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_WasGivenToHold);
    sub_806E834(gStringVar4, c);
}


// Not sure about this one for now.
/*
void PartyMenuTryGiveMonMail(u8 taskId, TaskFunc func)
{
    u16 currentItem;
    struct MailStruct *r4;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    currentItem = GetMonData(ewram1C000.pokemon, MON_DATA_HELD_ITEM);
    gUnknown_0202E8F4 = 0;
    r4 = &gSaveBlock1.mail[ewram1F000.unkE00[0] + ewram1F000.unkE00[2]];
    if (currentItem != 0)
    {
        sub_806E834(gOtherText_PokeHoldingItemCantMail, 1);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
    else
    {
        GiveMailToMon2(ewram1C000.pokemon, r4);
        ClearMailStruct(r4);
        sub_806E834(gOtherText_MailTransferredMailbox, 1);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
}
*/
__attribute__((naked))
void PartyMenuTryGiveMonMail(u8 taskId, TaskFunc func)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    adds r2, r1, 0\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    ldr r3, _0806ECA0 @ =gTasks\n\
    lsls r1, r0, 2\n\
    adds r1, r0\n\
    lsls r1, 3\n\
    adds r1, r3\n\
    ldr r3, _0806ECA4 @ =TaskDummy\n\
    str r3, [r1]\n\
    movs r1, 0\n\
    bl sub_806E8D0\n\
    ldr r5, _0806ECA8 @ =0x0201c000\n\
    ldr r0, [r5]\n\
    movs r1, 0xC\n\
    bl GetMonData\n\
    lsls r0, 16\n\
    ldr r2, _0806ECAC @ =gUnknown_0202E8F4\n\
    movs r1, 0\n\
    strb r1, [r2]\n\
    movs r1, 0xF8\n\
    lsls r1, 6\n\
    adds r2, r5, r1\n\
    ldrb r1, [r2]\n\
    adds r1, 0x6\n\
    ldrb r2, [r2, 0x2]\n\
    adds r1, r2\n\
    lsls r2, r1, 3\n\
    adds r2, r1\n\
    lsls r2, 2\n\
    ldr r1, _0806ECB0 @ =gSaveBlock1 + 0x2B4C\n\
    adds r4, r2, r1\n\
    cmp r0, 0\n\
    beq _0806ECBC\n\
    ldr r0, _0806ECB4 @ =gOtherText_PokeHoldingItemCantMail\n\
    movs r1, 0x1\n\
    bl sub_806E834\n\
    ldr r0, _0806ECB8 @ =party_menu_link_mon_held_item_object\n\
    movs r1, 0x5\n\
    bl CreateTask\n\
    b _0806ECDA\n\
    .align 2, 0\n\
_0806ECA0: .4byte gTasks\n\
_0806ECA4: .4byte TaskDummy\n\
_0806ECA8: .4byte 0x0201c000\n\
_0806ECAC: .4byte gUnknown_0202E8F4\n\
_0806ECB0: .4byte gSaveBlock1 + 0x2B4C\n\
_0806ECB4: .4byte gOtherText_PokeHoldingItemCantMail\n\
_0806ECB8: .4byte party_menu_link_mon_held_item_object\n\
_0806ECBC:\n\
    ldr r0, [r5]\n\
    adds r1, r4, 0\n\
    bl GiveMailToMon2\n\
    adds r0, r4, 0\n\
    bl ClearMailStruct\n\
    ldr r0, _0806ECE0 @ =gOtherText_MailTransferredMailbox\n\
    movs r1, 0x1\n\
    bl sub_806E834\n\
    ldr r0, _0806ECE4 @ =party_menu_link_mon_held_item_object\n\
    movs r1, 0x5\n\
    bl CreateTask\n\
_0806ECDA:\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0806ECE0: .4byte gOtherText_MailTransferredMailbox\n\
_0806ECE4: .4byte party_menu_link_mon_held_item_object\n\
    .syntax divided\n");
}

void PartyMenuTryGiveMonHeldItem_806ECE8(u8 taskId, TaskFunc func)
{
    u16 currentItem;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    currentItem = GetMonData(ewram1C000.pokemon, MON_DATA_HELD_ITEM);
    if (currentItem == 0)
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_NotHoldingAnything);
        sub_806E834(gStringVar4, 0);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
    else
    {
        u8 itemData[2];

        itemData[0] = 0;
        itemData[1] = 0;
        if (AddBagItem(currentItem, 1) == TRUE)
        {
            if (ItemIsMail(currentItem) == TRUE)
                TakeMailFromMon(ewram1C000.pokemon);
            DisplayTakeHeldItemMessage(ewram1C000.unk5, currentItem, 0);
            SetMonData(ewram1C000.pokemon, MON_DATA_HELD_ITEM, itemData);
        }
        else
        {
            sub_806E834(gOtherText_BagFullCannotRemoveItem, 0);
        }
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
}

void DisplayTakeHeldItemMessage(u8 a, u16 b, u8 c)
{
    GetMonNickname(&gPlayerParty[a], gStringVar1);
    CopyItemName(b, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_ReceivedTheThingFrom);
    sub_806E834(gStringVar4, c);
}

void DoTakeMail(u8 taskId, TaskFunc func)
{
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    ewram1C000.unk6 = GetMonData(ewram1C000.pokemon, MON_DATA_HELD_ITEM);
    sub_806E834(gOtherText_SendRemovedMailPrompt, 1);
    CreateTask(Task_ConfirmTakeHeldMail, 5);
}

void Task_LoseMailMessage(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        if (AddBagItem(ewram1C000.unk6, 1) == TRUE)
        {
            TakeMailFromMon(ewram1C000.pokemon);
            sub_806E834(gOtherText_MailTaken, 0);
        }
        else
        {
            sub_806E834(gOtherText_BagFullCannotRemoveItem, 0);
        }
        MenuZeroFillWindowRect(23, 8, 29, 13);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(23, 8, 29, 13);
        MenuZeroFillWindowRect(0, 14, 29, 19);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
}

void Task_ConfirmLoseMailMessage(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = Task_LoseMailMessage;
    }
}

void Task_TakeHeldMail(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        MenuZeroFillWindowRect(23, 8, 29, 13);
        if (TakeMailFromMon2(ewram1C000.pokemon) != 0xFF)
            sub_806E834(gOtherText_MailWasSent, 0);
        else
            sub_806E834(gOtherText_MailboxIsFull, 0);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(23, 8, 29, 13);
        sub_806E834(gOtherText_MailRemovedMessageLost, 1);
        gTasks[taskId].func = Task_ConfirmLoseMailMessage;
    }
}

void Task_ConfirmTakeHeldMail(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = Task_TakeHeldMail;
    }
}

u16 ItemIdToBattleMoveId(u16 item)
{
    u16 moveId = item - 289;

    return gUnknown_08376504[moveId];
}

bool8 pokemon_has_move(struct Pokemon *pkmn, u16 move)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (GetMonData(pkmn, MON_DATA_MOVE1 + i) == move)
            return TRUE;
    }
    return FALSE;
}

void TeachMonTMMove(u8 taskId, u16 move, TaskFunc func)
{
    PlaySE(SE_SELECT);
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, move, func);
    CreateTask(Task_TeamMonTMMove, 5);
}

void Task_TeamMonTMMove(u8 taskId)
{
    GetMonNickname(ewram1C000.pokemon, gStringVar1);
    ewram1C000.unk8 = ItemIdToBattleMoveId(ewram1C000.unk6);
    StringCopy(gStringVar2, gMoveNames[ewram1C000.unk8]);
    ewram1B000.unk282 = 0;
    if (pokemon_has_move(ewram1C000.pokemon, ewram1C000.unk8))
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_AlreadyKnows);
        sub_806E834(gStringVar4, 1);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (!CanMonLearnTMHM(ewram1C000.pokemon, ewram1C000.unk6 - 33))
        {
            StringExpandPlaceholders(gStringVar4, gOtherText_NotCompatible);
            sub_806E834(gStringVar4, 1);
            gTasks[taskId].func = party_menu_link_mon_held_item_object;
        }
        else
        {
            if (GiveMoveToMon(ewram1C000.pokemon, ewram1C000.unk8) != 0xFFFF)
            {
                Task_TeamMonTMMove2(taskId);
            }
            else
            {
                StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
                sub_806E834(gStringVar4, 1);
                gTasks[taskId].func = sub_806F358;
            }
        }
    }
}

void Task_TeamMonTMMove2(u8 taskId)
{
    StringCopy(gStringVar2, gMoveNames[ewram1C000.unk8]);
    StringExpandPlaceholders(gStringVar4, gOtherText_LearnedMove);
    sub_806E834(gStringVar4, 1);
    AdjustFriendship(ewram1C000.pokemon, 4);
    if (ewram1B000.unk282 == 0 && ewram1C000.unk6 <= 0x152)
        RemoveBagItem(ewram1C000.unk6, 1);
    gTasks[taskId].func = Task_TeamMonTMMove3;
}

void Task_TeamMonTMMove3(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        PlayFanfare(BGM_FANFA1);
        gTasks[taskId].func = Task_TeamMonTMMove4;
    }
}

void Task_TeamMonTMMove4(u8 taskId)
{
    if (IsFanfareTaskInactive())
    {
        if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        {
            SetHeldItemIconVisibility(ewram1C000.unk4, ewram1C000.unk5);
            if (ewram1B000.unk282 == 1)
            {
                sub_8070C54(taskId);
            }
            else
            {
                gTasks[ewram1C000.unk4].func = ewram1C000.unk10;
                DestroyTask(taskId);
            }
        }
    }
}

void sub_806F2FC(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        SetHeldItemIconVisibility(ewram1C000.unk4, ewram1C000.unk5);
        if (ewram1B000.unk282 == 1)
        {
            sub_8070C54(taskId);
        }
        else
        {
            gTasks[ewram1C000.unk4].func = ewram1C000.unk10;
            DestroyTask(taskId);
        }
    }
}

void sub_806F358(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = sub_806F390;
    }
}

void sub_806F390(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        MenuZeroFillWindowRect(23, 8, 29, 13);
        sub_806E834(gOtherText_WhichMoveToForget2, 1);
        gTasks[taskId].func = sub_806F44C;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        StopTryingToTeachMove_806F614(taskId);
    }
}

void sub_806F3FC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_809D9F0(gPlayerParty, ewram1C000.unk5, gPlayerPartyCount - 1, sub_808B564, ewram1C000.unk8);
        DestroyTask(taskId);
    }
}

void sub_806F44C(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gTasks[taskId].func = sub_806F3FC;
    }
}

void TaughtMove(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 moveIndex;
        u16 r4;

        gTasks[taskId].func = TaskDummy;
        sub_806E8D0(taskId, gScriptItemId, sub_808B508);
        moveIndex = sub_809FA30();
        r4 = GetMonData(ewram1C000.pokemon, MON_DATA_MOVE1 + moveIndex);
        GetMonNickname(ewram1C000.pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[r4]);
        StringExpandPlaceholders(gStringVar4, gOtherText_ForgetMove123_2);
        sub_806E834(gStringVar4, 1);
        CreateTask(TMMoveUpdateMoveSlot, 5);
    }
}

void TMMoveUpdateMoveSlot(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        RemoveMonPPBonus(ewram1C000.pokemon, sub_809FA30());
        SetMonMoveSlot(ewram1C000.pokemon, ewram1C000.unk8, sub_809FA30());
        Task_TeamMonTMMove2(taskId);
    }
}

void StopTryingToTeachMove_806F588(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gTasks[taskId].func = TaskDummy;
        sub_806E8D0(taskId, gScriptItemId, sub_808B508);
        StringCopy(gStringVar2, gMoveNames[ewram1C000.unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_StopTryingTo);
        sub_806E834(gStringVar4, 1);
        CreateTask(StopTryingToTeachMove_806F67C, 5);
    }
}

void StopTryingToTeachMove_806F614(u8 taskId)
{
    MenuZeroFillWindowRect(23, 8, 29, 13);
    StringCopy(gStringVar2, gMoveNames[ewram1C000.unk8]);
    StringExpandPlaceholders(gStringVar4, gOtherText_StopTryingTo);
    sub_806E834(gStringVar4, 1);
    gTasks[taskId].func = StopTryingToTeachMove_806F67C;
}

void StopTryingToTeachMove_806F67C(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(23, 8, 1);
        gTasks[taskId].func = StopTryingToTeachMove_806F6B4;
    }
}

void StopTryingToTeachMove_806F6B4(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        MenuZeroFillWindowRect(23, 8, 29, 13);
        GetMonNickname(ewram1C000.pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[ewram1C000.unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_DidNotLearnMove2);
        sub_806E834(gStringVar4, 1);
        gTasks[taskId].func = sub_806F2FC;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(23, 8, 29, 13);
        GetMonNickname(ewram1C000.pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[ewram1C000.unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
        sub_806E834(gStringVar4, 1);
        gTasks[taskId].func = sub_806F358;
    }
}

bool8 IsHMMove(u16 move)
{
    u8 i;

    for (i = 0; i < 8; i++)
    {
        if (gUnknown_08376504[50 + i] == move)
            return TRUE;
    }
    return FALSE;
}

s16 sub_806F7E8(u8 taskId, struct BattleInterfaceStruct1 *b, s8 c)
{
    s16 *taskData;
    u8 hpBarLevel;
    void *vramPtr;

    taskData = gTasks[taskId].data;

    b->unk0 = taskData[10];
    b->unk4 = taskData[11];
    b->unk8 = taskData[12] * c;
    b->unk10 = 0x100;
    hpBarLevel = GetHPBarLevel(ewram1B000.unk282, b->unk0);
    if (hpBarLevel > 2)
        b->unkC_0 = 4;
    if (hpBarLevel == 2)
        b->unkC_0 = 5;
    if (hpBarLevel < 2)
        b->unkC_0 = 6;
    vramPtr = gUnknown_08376858[IsDoubleBattle()][ewram1C000.unk5];
    return sub_80460C8(b, &ewram1C000.unkC, vramPtr, 0);
}

void sub_806F8AC(u8 taskId)
{
    struct BattleInterfaceStruct1 sp0;
    u16 sp14;

    ewram1B000.unk282 = sub_806F7E8(taskId, &sp0, -1);
    if (ewram1B000.unk282 == -1)
    {
        ewram1C000.unkC = 0;
        if (-sp0.unk8 + sp0.unk4 > sp0.unk0)
            sp14 = sp0.unk0 - sp0.unk4;
        else
            sp14 = -sp0.unk8;
        gBattleMoveDamage = -sp14;
        GetMonNickname(ewram1C000.pokemon, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, sp14, 0, 3);
        if (gTasks[taskId].data[14] == 0)
            StringExpandPlaceholders(gStringVar4, gOtherText_HPRestoredBy);
        else
            StringExpandPlaceholders(gStringVar4, gOtherText_RegainedHealth);
        SetMonIconAnim(GetMonIconSpriteId_maybe(ewram1C000.unk4, ewram1C000.unk5), ewram1C000.pokemon);
        task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + ewram1C000.unk5 * 2], 7);
        ewram1B000.unk261 = 2;
        sub_806E834(gStringVar4, 1);
        sp14 += sp0.unk4;
        SetMonData(ewram1C000.pokemon, MON_DATA_HP, (u8 *)&sp14);
        RemoveBagItem(ewram1C000.unk6, 1);
        sub_8032638();
        gTasks[taskId].func = sub_806FB44;
    }
    else
    {
        PartyMenuDoPrintHP(ewram1C000.unk5, IsDoubleBattle(), ewram1B000.unk282, sp0.unk0);
    }
}

void sub_806FA18(u8 taskId)
{
    struct BattleInterfaceStruct1 sp0;

    ewram1B000.unk282 = sub_806F7E8(taskId, &sp0, 1);
    if (ewram1B000.unk282 == -1)
    {
        PlaySE(SE_KAIFUKU);
        ewram1C000.unkC = 0;
        gTasks[taskId].data[11] -= gTasks[taskId].data[12];
        SetMonData(ewram1C000.pokemon, MON_DATA_HP, (u8 *)&gTasks[taskId].data[11]);
        SetMonIconAnim(GetMonIconSpriteId_maybe(ewram1C000.unk4, ewram01000.unk1), ewram1C000.pokemon);
        ewram1C000.unk5 = gSprites[ewram01000.unk2].data0;
        ewram1C000.pokemon = &gPlayerParty[ewram1C000.unk5];
        gTasks[taskId].data[10] = GetMonData(ewram1C000.pokemon, MON_DATA_MAX_HP);
        gTasks[taskId].data[11] = GetMonData(ewram1C000.pokemon, MON_DATA_HP);
        ewram1C000.unkC = -32768;
        ewram1C000.unk14 = ewram1C000.unk10;
        gTasks[taskId].func = sub_806F8AC;
        ewram1B000.unk282 = gTasks[taskId].data[11];
    }
    else
    {
        PartyMenuDoPrintHP(ewram1C000.unk5, IsDoubleBattle(), ewram1B000.unk282, sp0.unk0);
    }
}

void sub_806FB0C(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        gTasks[ewram1C000.unk4].func = ewram1C000.unk10;
        DestroyTask(taskId);
    }
}

void sub_806FB44(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        gTasks[ewram1C000.unk4].func = ewram1C000.unk14;
        DestroyTask(taskId);
    }
}

bool8 IsHPRecoveryItem(u16 item)
{
    const u8 *itemEffect;

    if (item == 0xAF)
        itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
    else
        itemEffect = gItemEffectTable[item - 13];

    if (itemEffect[4] & 4)
        return TRUE;
    else
        return FALSE;
}

void PartyMenuUpdateLevelOrStatus(struct Pokemon *pkmn, u8 b)
{
    PartyMenuClearLevelStatusTilemap(b);
    PartyMenuPrintMonLevelOrStatus(b, pkmn);
}

void GetMedicineItemEffectMessage(u16 item)
{
    switch (GetItemEffectType(item))
    {
        case 3:
            StringExpandPlaceholders(gStringVar4, gOtherText_CuredPoisoning);
            break;
        case 4:
            StringExpandPlaceholders(gStringVar4, gOtherText_WokeUp);
            break;
        case 5:
            StringExpandPlaceholders(gStringVar4, gOtherText_BurnHealed);
            break;
        case 6:
            StringExpandPlaceholders(gStringVar4, gOtherText_ThawedOut);
            break;
        case 7:
            StringExpandPlaceholders(gStringVar4, gOtherText_CuredParalysis);
            break;
        case 8:
            StringExpandPlaceholders(gStringVar4, gOtherText_SnapConfusion);
            break;
        case 9:
            StringExpandPlaceholders(gStringVar4, gOtherText_GotOverLove);
            break;
        case 11:
            StringExpandPlaceholders(gStringVar4, gOtherText_BecameHealthy);
            break;
        case 13:
            StringCopy(gStringVar2, gOtherText_Hp2);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 12:
            StringCopy(gStringVar2, gOtherText_Attack);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 17:
            StringCopy(gStringVar2, gOtherText_Defense);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 16:
            StringCopy(gStringVar2, gOtherText_Speed);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 14:
            StringCopy(gStringVar2, gOtherText_SpAtk2);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 15:
            StringCopy(gStringVar2, gOtherText_SpDef2);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 19:
        case 20:
            StringExpandPlaceholders(gStringVar4, gOtherText_PPIncreased);
            break;
        case 21:
            StringExpandPlaceholders(gStringVar4, gOtherText_PPRestored);
            break;
        default:
            StringExpandPlaceholders(gStringVar4, gOtherText_WontHaveAnyEffect);
            break;
    }
}

bool8 IsMedicineIneffective(struct Pokemon *pkmn, u16 item)
{
    if (GetItemEffectType(item) == 13
     && GetMonData(pkmn, MON_DATA_SPECIES) == SPECIES_SHEDINJA)
        return TRUE;
    else
        return FALSE;
}

bool8 ExecuteTableBasedItemEffect__(u8 a, u16 b, u8 c)
{
    if (gMain.inBattle)
        return ExecuteTableBasedItemEffect_(&gPlayerParty[a], b, sub_8094C20(a), c);
    else
        return ExecuteTableBasedItemEffect_(&gPlayerParty[a], b, a, c);
}

void UseMedicine(u8 taskId, u16 item, TaskFunc func)
{
    u8 r7;
    bool8 r9 = FALSE;
    bool8 r0;

    gTasks[taskId].func = TaskDummy;
    r7 = CreateTask(TaskDummy, 5);
    sub_806E8D0(taskId, item, func);
    if (!IsMedicineIneffective(ewram1C000.pokemon, item))
    {
        r9 = IsHPRecoveryItem(item);
        if (r9 == TRUE)
        {
            gTasks[r7].data[10] = GetMonData(ewram1C000.pokemon, MON_DATA_MAX_HP);
            gTasks[r7].data[11] = GetMonData(ewram1C000.pokemon, MON_DATA_HP);
            if (gTasks[r7].data[10] == gTasks[r7].data[11])
            {
                r9 = FALSE;
                gTasks[r7].data[10] = 0;
                gTasks[r7].data[11] = 0;
            }
        }
        r0 = ExecuteTableBasedItemEffect__(ewram1C000.unk5, item, 0);
    }
    else
    {
        r0 = TRUE;
    }

    if (r0)
    {
        gUnknown_0202E8F4 = 0;
        PlaySE(SE_SELECT);
        sub_806E834(gOtherText_WontHaveAnyEffect, 1);
        gTasks[r7].func = sub_806FB0C;
    }
    else
    {
        u8 statusAndPkrs;

        gUnknown_0202E8F4 = 1;
        if (!IsBlueYellowRedFlute(item))
            PlaySE(SE_KAIFUKU);
        else
            PlaySE(SE_BIDORO);
        statusAndPkrs = GetMonStatusAndPokerus(ewram1C000.pokemon);
        if (statusAndPkrs == 6 || statusAndPkrs == 0)
            PartyMenuUpdateLevelOrStatus(ewram1C000.pokemon, ewram1C000.unk5);
        if (r9 == TRUE)
        {
            gTasks[r7].data[12] = GetMonData(ewram1C000.pokemon, MON_DATA_HP) - gTasks[r7].data[11];
            ewram1C000.unkC = -32768;
            if (gTasks[r7].data[11] == 0)
                gTasks[r7].data[14] = 1;
            else
                gTasks[r7].data[14] = 0;
            ewram1C000.unk14 = ewram1C000.unk10;
            gTasks[r7].func = sub_806F8AC;
            ewram1B000.unk282 = gTasks[r7].data[11];
        }
        else
        {
            GetMonNickname(ewram1C000.pokemon, gStringVar1);
            if (!IsBlueYellowRedFlute(item))
                RemoveBagItem(item, 1);
            GetMedicineItemEffectMessage(item);
            TryPrintPartyMenuMonNickname(ewram1C000.unk5, ewram1C000.pokemon);
            sub_806E834(gStringVar4, 1);
            gTasks[r7].func = sub_806FB0C;
        }
    }
}

bool8 IsBlueYellowRedFlute(u16 item)
{
    if (item == 0x27
     || item == 0x29
     || item == 0x28)
        return TRUE;
    else
        return FALSE;
}

void sub_8070048(u8 taskId, u16 item, TaskFunc func)
{
    ewram1C000.unk10 = func;
    ewram1C000.unk4 = taskId;
    ewram1C000.unk6 = item;
    ewram1C000.unk5 = 0;
    ewram1C000.unk14 = sub_80701DC;
    ewram1B000.unk27E = 0;
    ewram1B000.unk280 = 0;
    sub_8070088(taskId);
}

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
            MenuZeroFillWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
            PlaySE(SE_KAIFUKU);
            PartyMenuUpdateLevelOrStatus(ewram1C000.pokemon, ewram1C000.unk5);
            task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + ewram1C000.unk5 * 2], 9);
            ewram1B000.unk261 = 2;
            taskData[12] = GetMonData(ewram1C000.pokemon, MON_DATA_HP) - taskData[11];
            taskData[14] = 1;
            ewram1B000.unk27E = 1;
            ewram1B000.unk280 = 1;
            ewram1B000.unk282 = taskData[11];
            ewram1C000.unkC = -32768;
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
    const u8 *itemEffect;
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
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(19, 10, 29, 19);
    sub_806D5A4();
    gTasks[taskId].data[11] = GetMenuCursorPos();
    DoRecoverPP(taskId);
}

void ItemUseMoveMenu_HandleCancel(u8 taskId)
{
    HandleDestroyMenuCursors();
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

void DoPPUpItemEffect(u8 taskId, u16 b, TaskFunc c)
{
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, b, c);
    PlaySE(SE_SELECT);
    sub_806D538(11, 3);
    CreateItemUseMoveMenu(ewram1C000.unk5);
    CreateTask(Task_HandleItemUseMoveMenuInput, 5);
    gMain.newKeys = 0;
}

void DoRareCandyItemEffect(u8 taskId, u16 b, TaskFunc c)
{
    u8 i;
    bool8 r0;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, b, c);

    if (GetMonData(ewram1C000.pokemon, MON_DATA_LEVEL) != 100)
    {
        for (i = 0; i < 6; i++)
            ewram1B000.statGrowths[i] = GetMonData(ewram1C000.pokemon, gUnknown_08376D1C[i]);
        r0 = ExecuteTableBasedItemEffect__(ewram1C000.unk5, b, 0);
    }
    else
        r0 = TRUE;

    if (r0)
    {
        gUnknown_0202E8F4 = 0;
        PlaySE(SE_SELECT);
        sub_806E834(gOtherText_WontHaveAnyEffect, 1);
        CreateTask(sub_806FB0C, 5);
    }
    else
    {
        u8 level;

        gUnknown_0202E8F4 = 1;
        PlayFanfareByFanfareNum(0);
        RedrawPokemonInfoInMenu(ewram1C000.unk5, ewram1C000.pokemon);
        RemoveBagItem(b, 1);
        GetMonNickname(ewram1C000.pokemon, gStringVar1);
        level = GetMonData(ewram1C000.pokemon, MON_DATA_LEVEL);
        ConvertIntToDecimalStringN(gStringVar2, level, 0, 3);
        StringExpandPlaceholders(gStringVar4, gOtherText_ElevatedTo);
        sub_806E834(gStringVar4, 1);
        CreateTask(Task_RareCandy1, 5);
    }
}

void Task_RareCandy1(u8 taskId)
{
    if (WaitFanfare(0) && gUnknown_0202E8F6 == 0)
    {
        if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        {
            PlaySE(SE_SELECT);
            PrintStatGrowthsInLevelUpWindow(taskId);
            gTasks[taskId].func = Task_RareCandy2;
        }
    }
}

void Task_RareCandy2(u8 taskId)
{
    if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
    {
        PlaySE(SE_SELECT);
        PrintNewStatsInLevelUpWindow(taskId);
        gTasks[taskId].func = Task_RareCandy3;
    }
}

#if ENGLISH
void PrintStatGrowthsInLevelUpWindow(u8 taskId)
{
    u8 i;

    MenuDrawTextWindow(11, 0, 29, 7);

    for (i = 0; i < NUM_STATS; i++)
    {
        u8 x;
        u8 y;
        u32 stat;

        stat = GetMonData(ewram1C000.pokemon, gUnknown_08376D1C[i]);

        ewram1B000.statGrowths[i + NUM_STATS] = stat;
        ewram1B000.statGrowths[i] = stat - ewram1B000.statGrowths[i];

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

        ConvertIntToDecimalStringN(gStringVar1 + 3, ewram1B000.statGrowths[i], 1, 2);

        MenuPrint_PixelCoords(gStringVar1, (x + 6) * 8 + 12, y * 8, 0);
    }
}
#elif GERMAN
__attribute__((naked))
void PrintStatGrowthsInLevelUpWindow(u8 taskId) {
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    movs r0, 0xB\n\
    movs r1, 0\n\
    movs r2, 0x1D\n\
    movs r3, 0x7\n\
    bl MenuDrawTextWindow\n\
    movs r7, 0\n\
    ldr r0, _0807092C @ =gStringVar1\n\
    mov r10, r0\n\
    movs r1, 0xFC\n\
    mov r9, r1\n\
    movs r2, 0x13\n\
    mov r8, r2\n\
_0807086C:\n\
    ldr r1, _08070930 @ =0x0201c000\n\
    ldr r0, [r1]\n\
    ldr r1, _08070934 @ =gUnknown_08376D1C\n\
    adds r1, r7, r1\n\
    ldrb r1, [r1]\n\
    bl GetMonData\n\
    adds r1, r7, 0x6\n\
    lsls r1, 1\n\
    ldr r2, _08070938 @ =0x0201b264\n\
    adds r1, r2, r1\n\
    strh r0, [r1]\n\
    lsls r6, r7, 1\n\
    adds r6, r2, r6\n\
    ldrh r1, [r6]\n\
    subs r0, r1\n\
    strh r0, [r6]\n\
    adds r0, r7, 0\n\
    movs r1, 0x3\n\
    bl __udivsi3\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r4, r0, 3\n\
    adds r4, r0\n\
    adds r4, 0xB\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    adds r0, r7, 0\n\
    movs r1, 0x3\n\
    bl __umodsi3\n\
    adds r5, r0, 0\n\
    lsls r5, 1\n\
    adds r5, 0x1\n\
    lsls r5, 24\n\
    lsrs r5, 24\n\
    ldr r1, _0807093C @ =gUnknown_08376D04\n\
    lsls r0, r7, 2\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    mov r0, r10\n\
    bl StringCopy\n\
    adds r2, r0, 0\n\
    mov r0, r9\n\
    strb r0, [r2]\n\
    adds r2, 0x1\n\
    mov r1, r8\n\
    strb r1, [r2]\n\
    adds r2, 0x1\n\
    movs r0, 0x2E\n\
    strb r0, [r2]\n\
    adds r2, 0x1\n\
    adds r0, r2, 0\n\
    ldr r1, _08070940 @ =gOtherText_TallPlusAndRightArrow\n\
    bl StringCopy\n\
    adds r2, r0, 0\n\
    mov r0, r9\n\
    strb r0, [r2]\n\
    adds r2, 0x1\n\
    mov r1, r8\n\
    strb r1, [r2]\n\
    adds r2, 0x1\n\
    movs r0, 0x34\n\
    strb r0, [r2]\n\
    adds r2, 0x1\n\
    movs r0, 0\n\
    ldrsh r1, [r6, r0]\n\
    adds r0, r2, 0\n\
    movs r2, 0x1\n\
    movs r3, 0x2\n\
    bl ConvertIntToDecimalStringN\n\
    adds r4, 0x1\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    mov r0, r10\n\
    adds r1, r4, 0\n\
    adds r2, r5, 0\n\
    bl MenuPrint\n\
    adds r0, r7, 0x1\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    cmp r7, 0x5\n\
    bls _0807086C\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0807092C: .4byte gStringVar1\n\
_08070930: .4byte 0x0201c000\n\
_08070934: .4byte gUnknown_08376D1C\n\
_08070938: .4byte 0x0201b264\n\
_0807093C: .4byte gUnknown_08376D04\n\
_08070940: .4byte gOtherText_TallPlusAndRightArrow\n\
    .syntax divided\n");
}
#endif

void PrintNewStatsInLevelUpWindow(u8 taskId)
{
    u8 i;

    for (i = 0; i < NUM_STATS; i++)
    {
        u8 x;
        u8 y;
        u32 stat;
        u32 newStatIndex;

        stat = GetMonData(ewram1C000.pokemon, gUnknown_08376D1C[i]);
        newStatIndex = i + 6;
        ewram1B000.statGrowths[newStatIndex] = stat;

        x = ((i / 3) * 9) + 11;
        y = ((i % 3) << 1) + 1;

        gStringVar1[0] = EXT_CTRL_CODE_BEGIN;
        gStringVar1[1] = 0x14;
        gStringVar1[2] = 0x06;

        ConvertIntToDecimalStringN(gStringVar1 + 3, ewram1B000.statGrowths[newStatIndex], 1, 3);
        MenuPrint_PixelCoords(gStringVar1, (x + 6) * 8 + 6, y * 8, 0);
    }
}

void RedrawPokemonInfoInMenu(u8 a, struct Pokemon *pokemon)
{
    u8 statusAndPkrs;
    bool8 isDoubleBattle;
    u16 currentHP;
    u16 maxHP;
    u8 icon;

    statusAndPkrs = GetMonStatusAndPokerus(pokemon);
    if (statusAndPkrs == 0 || statusAndPkrs == 6)
    {
        PartyMenuUpdateLevelOrStatus(pokemon, a);
    }

    isDoubleBattle = IsDoubleBattle();

    currentHP = GetMonData(pokemon, MON_DATA_HP);
    maxHP = GetMonData(pokemon, MON_DATA_MAX_HP);

    PartyMenuDoPrintHP(a, isDoubleBattle, currentHP, maxHP);
    PartyMenuTryDrawHPBar(a, pokemon);

    icon = GetMonIconSpriteId_maybe(ewram1C000.unk4, a);
    SetMonIconAnim(icon, pokemon);

    task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + a * 2], 7);
    ewram1B000.unk261 = 2;
}

void Task_RareCandy3(u8 taskId)
{
    if (WaitFanfare(0))
    {
        if ((gMain.newKeys & A_BUTTON) || (gMain.newKeys & B_BUTTON))
        {
            u16 learnedMove;
            u16 evolutionSpecies;

            MenuZeroFillWindowRect(WINDOW_LEFT + 8, 0, WINDOW_RIGHT + 3, 7);

            learnedMove = MonTryLearningNewMove(ewram1C000.pokemon, 1);
            ewram1B000.unk282 = 1;

            switch (learnedMove)
            {
                case 0:
                    // No move is learned.
                    evolutionSpecies = GetEvolutionTargetSpecies(ewram1C000.pokemon, 0, 0);
                    if (evolutionSpecies != 0)
                    {
                        gCB2_AfterEvolution = sub_80A53F8;
                        BeginEvolutionScene(ewram1C000.pokemon, evolutionSpecies, TRUE, ewram1C000.unk5);
                        DestroyTask(taskId);
                    }
                    else
                    {
                        sub_8070D90(taskId);
                    }
                    break;
                case 0xFFFF:
                    // Mon already knows 4 moves.
                    GetMonNickname(ewram1C000.pokemon, gStringVar1);
                    StringCopy(gStringVar2, gMoveNames[gMoveToLearn]);

                    StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
                    sub_806E834(gStringVar4, 1);

                    ewram1C000.unk8 = gMoveToLearn;
                    gTasks[taskId].func = sub_806F358;
                    break;
                case 0xFFFE:
                    // Move was already known by the mon.
                    gTasks[taskId].func = sub_8070C54;
                    break;
                default:
                    // Mon automatically learned a move because it knew less than four moves.
                    GetMonNickname(ewram1C000.pokemon, gStringVar1);
                    StringCopy(gStringVar2, gMoveNames[learnedMove]);

                    StringExpandPlaceholders(gStringVar4, gOtherText_LearnedMove);
                    sub_806E834(gStringVar4, 1);

                    gTasks[taskId].func = Task_TeamMonTMMove3;
                    break;
            }
        }
    }
}
