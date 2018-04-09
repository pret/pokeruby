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
#include "constants/species.h"

extern u16 gSpecialVar_Result;
extern u8 fieldPoisonText_PokemonFainted[];

static bool32 IsMonValidSpecies(struct Pokemon *mon)
{
    // UB: Too few arguments for function 'GetMonData'
    u16 species = GetMonData(mon, MON_DATA_SPECIES2);
    if (species == SPECIES_NONE || species == SPECIES_EGG)
        return FALSE;
    else
        return TRUE;
}

static bool32 AllMonsFainted(void)
{
    int i;
    struct Pokemon *mon = gPlayerParty;

    for (i = 0; i < PARTY_SIZE; i++, mon++)
    {
        // UB: Too few arguments for function 'GetMonData'
        if (IsMonValidSpecies(mon) && GetMonData(mon, MON_DATA_HP) != 0)
            return FALSE;
    }

    return TRUE;
}

static void FaintFromFieldPoison(u8 monIndex)
{
    struct Pokemon *mon = &gPlayerParty[monIndex];
    u32 status = 0;

    AdjustFriendship(mon, FRIENDSHIP_EVENT_FAINT_OUTSIDE_BATTLE);
    SetMonData(mon, MON_DATA_STATUS, &status);
    GetMonData(mon, MON_DATA_NICKNAME, gStringVar1);
    StringGetEnd10(gStringVar1);
}

static bool32 MonFaintedFromPoison(u8 monIndex)
{
    struct Pokemon *mon = &gPlayerParty[monIndex];

    // UB: Too few arguments for function 'GetMonData'
    if (IsMonValidSpecies(mon) && GetMonData(mon, MON_DATA_HP) == 0
     && GetPrimaryStatus(GetMonData(mon, MON_DATA_STATUS)) == STATUS_PRIMARY_POISON)
        return TRUE;
    else
        return FALSE;
}

#define tState       data[0]
#define tPartyMember data[1]

static void Task_WhiteOut(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (tState)
    {
    case 0:
        // Check if any Pokemon have fainted due to poison
        while (tPartyMember < PARTY_SIZE)
        {
            if (MonFaintedFromPoison(tPartyMember))
            {
                // Show message about fainted mon
                FaintFromFieldPoison(tPartyMember);
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
    struct Pokemon *mon = &gPlayerParty[0];
    u32 numPoisoned = 0;
    u32 numFainting = 0;
    int i;

    // count the number of mons that are poisoned and fainting from poison,
    // and decrement HP of all poisoned mons
    for (i = 0; i < PARTY_SIZE; i++)
    {
        u32 hp;

        if (GetMonData(mon, MON_DATA_SANITY_BIT2) != 0
         && GetPrimaryStatus(GetMonData(mon, MON_DATA_STATUS)) == STATUS_PRIMARY_POISON)
        {
            // decrement HP of poisoned mon
            hp = GetMonData(mon, MON_DATA_HP);
            if (hp != 0)
                hp--;
            if (hp == 0)
                numFainting++;
            SetMonData(mon, MON_DATA_HP, &hp);
            numPoisoned++;
        }
        mon++;
    }
    if (numFainting != 0 || numPoisoned != 0)
        FldeffPoison_Start();
    if (numFainting != 0)
        return 2;
    if (numPoisoned != 0)
        return 1;
    return 0;
}
