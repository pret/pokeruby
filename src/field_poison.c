#include "pokemon_summary_screen.h"
#include "fldeff_80C5CD4.h"
#include "global.h"
#include "field_poison.h"
#include "field_message_box.h"
#include "pokemon.h"
#include "script.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

extern u16 gScriptResult;
extern u8 fieldPoisonText_PokemonFainted[];

bool32 CheckMonIsValid(struct Pokemon *pkmn)
{
    // UB: Too few arguments for function 'GetMonData'
    u16 species2 = GetMonData(pkmn, MON_DATA_SPECIES2);

    if (species2 == 0 || species2 == 0x19C)
        return FALSE;
    else
        return TRUE;
}

bool32 AllMonsFainted(void)
{
    struct Pokemon *pkmn = &gPlayerParty[0];
    int i;

    for (i = 0; i < 6; i++, pkmn++)
    {
        // UB: Too few arguments for function 'GetMonData'
        if (CheckMonIsValid(pkmn) && GetMonData(pkmn, MON_DATA_HP) != 0)
            return FALSE;
    }
    return TRUE;
}

void MonFaintFromPoisonOnField(u8 partyMember)
{
    struct Pokemon *pkmn = &gPlayerParty[partyMember];
    u32 val = 0;

    AdjustFriendship(pkmn, 7);
    SetMonData(pkmn, MON_DATA_STATUS, (u8*)&val);
    GetMonData(pkmn, MON_DATA_NICKNAME, gStringVar1);
    StringGetEnd10(gStringVar1);
}

bool32 CheckMonFaintedFromPoison(u8 partyMember)
{
    struct Pokemon *pkmn = &gPlayerParty[partyMember];

    // UB: Too few arguments for function 'GetMonData'
    if (CheckMonIsValid(pkmn) && GetMonData(pkmn, MON_DATA_HP) == 0
     && pokemon_ailments_get_primary(GetMonData(pkmn, MON_DATA_STATUS)) == 1)
        return TRUE;
    else
        return FALSE;
}

//Task data
enum
{
    TD_STATE,
    TD_PARTY_MEMBER,
};

void Task_WhiteOut(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    switch (taskData[TD_STATE])
    {
    case 0: //Check if Pokemon have fainted due to poison
        while (taskData[TD_PARTY_MEMBER] < 6)
        {
            if (CheckMonFaintedFromPoison(taskData[TD_PARTY_MEMBER]))
            {
                MonFaintFromPoisonOnField(taskData[TD_PARTY_MEMBER]);
                ShowFieldMessage(fieldPoisonText_PokemonFainted);
                taskData[TD_STATE]++;
                return;
            }
            taskData[TD_PARTY_MEMBER]++;
        }
        taskData[TD_STATE] = 2;
        break;
    case 1: //Wait for message box to disappear
        if (IsFieldMessageBoxHidden())
            taskData[TD_STATE]--; //Check next party member
        break;
    case 2: //Done checking Pokemon
        if (AllMonsFainted())
            gScriptResult = 1;
        else
            gScriptResult = 0;
        EnableBothScriptContexts();
        DestroyTask(taskId);
        break;
    }
}

void ExecuteWhiteOut(void)
{
    CreateTask(Task_WhiteOut, 0x50);
    ScriptContext1_Stop();
}

s32 overworld_poison(void)
{
    struct Pokemon *pkmn = &gPlayerParty[0];
    u32 numPoisoned = 0;
    u32 numFainting = 0;
    int i;

    for (i = 0; i < 6; i++)
    {
        u32 hp;

        // UB: Too few arguments for function 'GetMonData'
        if (GetMonData(pkmn, MON_DATA_SANITY_BIT2) != 0
         && pokemon_ailments_get_primary(GetMonData(pkmn, MON_DATA_STATUS)) == 1)
        {
            hp = GetMonData(pkmn, MON_DATA_HP);
            if (hp != 0)
                hp--;
            if (hp == 0)
                numFainting++; //Pokemon will now faint due to poison
            SetMonData(pkmn, MON_DATA_HP, (u8 *)&hp);
            numPoisoned++;
        }
        pkmn++;
    }
    if (numFainting != 0 || numPoisoned != 0)
        DoFieldPoisonEffect();
    if (numFainting != 0)
        return 2;
    if (numPoisoned != 0)
        return 1;
    return 0;
}
