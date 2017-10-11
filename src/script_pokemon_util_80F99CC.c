#include "global.h"
#include "battle_party_menu.h"
#include "choose_party.h"
#include "contest.h"
#include "data2.h"
#include "party_menu.h"
#include "field_fadetransition.h"
#include "palette.h"
#include "party_menu.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "overworld.h"
#include "script.h"
#include "script_pokemon_80F9.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

extern u8 gPlayerPartyCount;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u8 gUnknown_02038694;
extern u16 gScriptResult;

extern void (*gFieldCallback)(void);

void sub_80F99CC(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)OpenPartyMenuFromScriptContext, 0xA);
    gTasks[taskId].data[0] = PARTY_MENU_TYPE_CONTEST;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A0C(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)OpenPartyMenuFromScriptContext, 0xA);
    gTasks[taskId].data[0] = PARTY_MENU_TYPE_IN_GAME_TRADE;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void sub_80F9A4C(void)
{
    u8 taskId;

    ScriptContext2_Enable();
    taskId = CreateTask((void *)OpenPartyMenuFromScriptContext, 0xA);
    gTasks[taskId].data[0] = PARTY_MENU_TYPE_MOVE_TUTOR;
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
}

void OpenPartyMenuFromScriptContext(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gPaletteFade.bufferTransferDisabled = 1;
        OpenPartyMenu((u8) gTasks[taskId].data[0], 0);
        DestroyTask(taskId);
    }
}

bool8 SetupContestPartyMenu(void)
{
    switch (EWRAM_1B000.setupState)
    {
    case 0:
        if (EWRAM_1B000.monIndex < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex, &gPlayerParty[EWRAM_1B000.monIndex]);
            EWRAM_1B000.monIndex++;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        EWRAM_1B000.setupState++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(EWRAM_1B000.menuHandlerTaskId);
        EWRAM_1B000.setupState++;
        break;
    case 3:
        if (sub_806BD58(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex) != 1)
        {
            EWRAM_1B000.monIndex++;
            break;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
            break;
        }
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        EWRAM_1B000.setupState++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        EWRAM_1B000.setupState++;
        break;
    case 6:
        sub_80F9C00();
        EWRAM_1B000.setupState++;
        break;
    case 7: // the only case that can return true.
        if (DrawPartyMonBackground(EWRAM_1B000.monIndex) != 1)
        {
            EWRAM_1B000.monIndex++;
            break;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState = 0;
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80F9C00(void)
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        switch (sub_80AE47C(&gPlayerParty[i]))
        {
        case 0:
        case 3:
        case 4:
            sub_806BC3C(i, 0x7E);
            break;
        case 1:
        case 2:
            sub_806BC3C(i, 0x70);
            break;
        }
    }
}

void HandleSelectPartyMenu(u8 var)
{
    if (!gPaletteFade.active)
    {
        switch (HandleDefaultPartyMenuInput(var))
        {
        case A_BUTTON:
            PlaySE(SE_SELECT);
            gUnknown_02038694 = sub_806CA38(var);
            gSpecialVar_0x8004 = gUnknown_02038694;
            sub_8123138(var);
            break;
        case B_BUTTON:
            PlaySE(SE_SELECT);
            gUnknown_02038694 = 0xFF;
            gSpecialVar_0x8004 = 0xFF;
            sub_8123138(var);
            break;
        }
    }
}

bool8 SetupMoveTutorPartyMenu(void)
{
    switch (EWRAM_1B000.setupState)
    {
    case 0:
        if (EWRAM_1B000.monIndex < gPlayerPartyCount)
        {
            TryCreatePartyMenuMonIcon(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex, &gPlayerParty[EWRAM_1B000.monIndex]);
            EWRAM_1B000.monIndex++;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
        }
        break;
    case 1:
        LoadHeldItemIconGraphics();
        EWRAM_1B000.setupState++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34(EWRAM_1B000.menuHandlerTaskId);
        EWRAM_1B000.setupState++;
        break;
    case 3:
        if (sub_806BD58(EWRAM_1B000.menuHandlerTaskId, EWRAM_1B000.monIndex) != 1)
        {
            EWRAM_1B000.monIndex++;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState++;
        }
        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        EWRAM_1B000.setupState++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        EWRAM_1B000.setupState++;
        break;
    case 6:
        sub_80F9E1C();
        EWRAM_1B000.setupState++;
        break;
    case 7: // the only case that can return true.
        if (DrawPartyMonBackground(EWRAM_1B000.monIndex) != 1)
        {
            EWRAM_1B000.monIndex++;
        }
        else
        {
            EWRAM_1B000.monIndex = 0;
            EWRAM_1B000.setupState = 0;
            return TRUE;
        }
    }

    return FALSE;
}

void sub_80F9E1C(void)
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        if (!sub_8040574(&gPlayerParty[i]))
            sub_806BC3C(i, 0x9A);
        else
            sub_806BC3C(i, 0x8C);
    }
}

void HandleMoveTutorPartyMenu(u8 var)
{
    if (!gPaletteFade.active)
    {
        switch (HandleDefaultPartyMenuInput(var))
        {
        case A_BUTTON:
            PlaySE(SE_SELECT);
            gSpecialVar_0x8004 = sub_806CA38(var);
            gSpecialVar_0x8005 = sub_8040574(&gPlayerParty[gSpecialVar_0x8004]);
            sub_8123138(var);
            break;
        case B_BUTTON:
            PlaySE(SE_SELECT);
            gSpecialVar_0x8004 = 0xFF;
            sub_8123138(var);
        }
    }
}

void sub_80F9EEC(void)
{
    sub_809D9F0(&gPlayerParty[0], gSpecialVar_0x8004, gPlayerPartyCount - 1, c2_exit_to_overworld_2_switch, 0);
    unk_2018000.unk8 = 3;
    gFieldCallback = sub_8080990;
}

void ScrSpecial_CountPokemonMoves(void) // count pokemon moves
{
    u8 i;

    gScriptResult = 0;

    for (i = 0; i < 4; i++) // checks MOVE1-MOVE4
        if (GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_MOVE1 + i))
            gScriptResult++;
}

void ScrSpecial_GetPokemonNicknameAndMoveName(void)
{
    struct Pokemon *pkmn = &gPlayerParty[gSpecialVar_0x8004];
    u16 data = GetMonData(pkmn, MON_DATA_MOVE1 + gSpecialVar_0x8005);

    GetMonNickname(pkmn, gStringVar1);
    StringCopy(gStringVar2, gMoveNames[data]);
}

// no. hard
__attribute__((naked))
void sub_80F9FDC(struct Pokemon *party, u8 var, u8 var2)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x20\n\
    mov r8, r0\n\
    adds r5, r1, 0\n\
    adds r4, r2, 0\n\
    lsls r5, 24\n\
    lsrs r5, 24\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    adds r0, r5, 0\n\
    adds r0, 0xD\n\
    str r0, [sp, 0x8]\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x8]\n\
    bl GetMonData\n\
    mov r1, sp\n\
    adds r1, 0x2\n\
    str r1, [sp, 0x14]\n\
    strh r0, [r1]\n\
    adds r3, r4, 0\n\
    adds r3, 0xD\n\
    str r3, [sp, 0xC]\n\
    mov r0, r8\n\
    adds r1, r3, 0\n\
    bl GetMonData\n\
    mov r1, sp\n\
    strh r0, [r1]\n\
    adds r7, r5, 0\n\
    adds r7, 0x11\n\
    str r7, [sp, 0x10]\n\
    mov r0, r8\n\
    adds r1, r7, 0\n\
    bl GetMonData\n\
    mov r1, sp\n\
    adds r1, 0x5\n\
    str r1, [sp, 0x18]\n\
    strb r0, [r1]\n\
    adds r3, r4, 0\n\
    adds r3, 0x11\n\
    str r3, [sp, 0x1C]\n\
    mov r0, r8\n\
    adds r1, r3, 0\n\
    bl GetMonData\n\
    add r7, sp, 0x4\n\
    mov r10, r7\n\
    strb r0, [r7]\n\
    mov r0, r8\n\
    movs r1, 0x15\n\
    bl GetMonData\n\
    mov r6, sp\n\
    adds r6, 0x6\n\
    strb r0, [r6]\n\
    ldr r1, _080FA0D8 @ =gUnknown_08208238\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    mov r9, r0\n\
    ldrb r0, [r6]\n\
    adds r2, r0, 0\n\
    mov r3, r9\n\
    ands r2, r3\n\
    lsls r5, 1\n\
    asrs r2, r5\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    adds r1, r4, r1\n\
    ldrb r3, [r1]\n\
    adds r1, r0, 0\n\
    ands r1, r3\n\
    lsls r4, 1\n\
    asrs r1, r4\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    mov r7, r9\n\
    bics r0, r7\n\
    strb r0, [r6]\n\
    ldrb r0, [r6]\n\
    bics r0, r3\n\
    strb r0, [r6]\n\
    lsls r2, r4\n\
    lsls r1, r5\n\
    adds r2, r1\n\
    ldrb r0, [r6]\n\
    orrs r0, r2\n\
    strb r0, [r6]\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x8]\n\
    mov r2, sp\n\
    bl SetMonData\n\
    mov r0, r8\n\
    ldr r1, [sp, 0xC]\n\
    ldr r2, [sp, 0x14]\n\
    bl SetMonData\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x10]\n\
    mov r2, r10\n\
    bl SetMonData\n\
    mov r0, r8\n\
    ldr r1, [sp, 0x1C]\n\
    ldr r2, [sp, 0x18]\n\
    bl SetMonData\n\
    mov r0, r8\n\
    movs r1, 0x15\n\
    adds r2, r6, 0\n\
    bl SetMonData\n\
    add sp, 0x20\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080FA0D8: .4byte gUnknown_08208238\n\
    .syntax divided");
}

void sub_80FA0DC(void)
{
    u16 i;

    SetMonMoveSlot(&gPlayerParty[gSpecialVar_0x8004], 0, gSpecialVar_0x8005);
    RemoveMonPPBonus(&gPlayerParty[gSpecialVar_0x8004], gSpecialVar_0x8005);

    for (i = gSpecialVar_0x8005; i < 3; i++)
        sub_80F9FDC(&gPlayerParty[gSpecialVar_0x8004], i, i + 1);
}

void sub_80FA148(void)
{
    struct Pokemon *party = &gPlayerParty[gSpecialVar_0x8004];
    gScriptResult = 0;

    if (GetMonData(party, MON_DATA_IS_EGG))
        gScriptResult = 1;
}
