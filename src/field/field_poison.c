#include "global.h"
#include "field_poison.h"
#include "field_message_box.h"
#include "fldeff_poison.h"
#include "pokemon.h"
#include "pokemon_summary_screen.h"
#include "script.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

extern u16 gSpecialVar_Result;
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
    SetMonData(pkmn, MON_DATA_STATUS, &val);
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

#define tState       data[0]
#define tPartyMember data[1]

void Task_WhiteOut(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        // Check if any Pokemon have fainted due to poison
        while (tPartyMember < 6)
        {
            if (CheckMonFaintedFromPoison(tPartyMember))
            {
                // Show message about fainted mon
                MonFaintFromPoisonOnField(tPartyMember);
                ShowFieldMessage(fieldPoisonText_PokemonFainted);
                tState++;
                return;
            }
            tPartyMember++;
        }
        tState = 2;
        break;
    case 1:  // Wait for message box to disappear
        if (IsFieldMessageBoxHidden())
            tState--;  // Go to previous step and check next party member
        break;
    case 2:  // done checking all mons
        if (AllMonsFainted())
            gSpecialVar_Result = 1;
        else
            gSpecialVar_Result = 0;
        EnableBothScriptContexts();
        DestroyTask(taskId);
        break;
    }
}

#undef tState
#undef tPartyMember

void ExecuteWhiteOut(void)
{
    CreateTask(Task_WhiteOut, 0x50);
    ScriptContext1_Stop();
}

s32 DoPoisonFieldEffect(void)
{
    struct Pokemon *pkmn = &gPlayerParty[0];
    u32 numPoisoned = 0;
    u32 numFainting = 0;
    int i;

    // count the number of mons that are poisoned and fainting from poison,
    // and decrement HP of all poisoned mons
    for (i = 0; i < 6; i++)
    {
        u32 hp;

        if (GetMonData(pkmn, MON_DATA_SANITY_BIT2) != 0
         && pokemon_ailments_get_primary(GetMonData(pkmn, MON_DATA_STATUS)) == 1)
        {
            // decrement HP of poisoned mon
            hp = GetMonData(pkmn, MON_DATA_HP);
            if (hp != 0)
                hp--;
            if (hp == 0)
                numFainting++;
            SetMonData(pkmn, MON_DATA_HP, &hp);
            numPoisoned++;
        }
        pkmn++;
    }
    if (numFainting != 0 || numPoisoned != 0)
        FldeffPoison_Start();
    if (numFainting != 0)
        return 2;
    if (numPoisoned != 0)
        return 1;
    return 0;
}
