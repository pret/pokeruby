#include "global.h"
#include "asm.h"
#include "link.h"
#include "menu.h"
#include "pokemon.h"
#include "string_util.h"

extern struct Pokemon *unk_2018000;

extern u8 *(gNatureNames[]);
extern const u8 gOtherText_Terminator4[];
extern const u8 gOtherText_Nature[];

extern const u8 gOtherText_Met[];
extern const u8 gOtherText_Egg2[];
extern const u8 gOtherText_ObtainedInTrade[];
extern const u8 gOtherText_FatefulEncounter[];
extern const u8 gOtherText_Met2[];
extern const u8 gOtherText_EggDayCare[];
extern const u8 gOtherText_EggNicePlace[];
extern const u8 gOtherText_EggObtainedInTrade[];
extern const u8 gOtherText_EggHotSprings[];

u8 *sub_80A1E9C(u8 *dest, u8 *src, u8);
u8 PokemonSummaryScreen_CheckOT(struct Pokemon *pokemon);
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);
u32 GetPlayerTrainerId(void);

bool8 PokemonSummaryScreen_CheckOT(struct Pokemon *mon)
{
    u32 trainerId;

    if (unk_2018000 == gEnemyParty)
    {
        u8 enemyId = GetMultiplayerId() ^ 1;
        trainerId = gLinkPlayers[enemyId].trainerId & 0xFFFF;
        StringCopy(gStringVar1, gLinkPlayers[enemyId].name);
        StripExtCtrlCodes(gStringVar1);
    }
    else
    {
        trainerId = GetPlayerTrainerId() & 0xFFFF;
        StringCopy(gStringVar1, gSaveBlock2.playerName);
    }

    if (trainerId != (GetMonData(mon, MON_DATA_OT_ID) & 0xFFFF))
        return FALSE;

    GetMonData(mon, MON_DATA_OT_NAME, gStringVar2);

    if (!StringCompareWithoutExtCtrlCodes(gStringVar1, gStringVar2))
        return TRUE;

    return FALSE;
}

void PokemonSummaryScreen_PrintEggTrainerMemo(struct Pokemon *mon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet = GetMonData(mon, MON_DATA_MET_GAME);

    if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
    {
        MenuPrint(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);

    if (locationMet == 255)
    {
        MenuPrint(gOtherText_EggNicePlace, left, top);
        return;
    }

    if (!PokemonSummaryScreen_CheckOT(mon))
    {
        MenuPrint(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    asm(""); // needed to match for some reason

    if (locationMet == 253)
    {
        MenuPrint(gOtherText_EggHotSprings, left, top);
        return;
    }

    MenuPrint(gOtherText_EggDayCare, left, top);
}

void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *pokemon, u8 left, u8 top) {
    u8 locationMet;
    u8 gameMet;
    u8 *ptr = gStringVar4;
    u8 nature = GetNature(pokemon);

    ptr = StringCopy(gStringVar4, gOtherText_Nature);

    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);

    ptr = StringCopy(ptr, gOtherText_Terminator4);

    if (PokemonSummaryScreen_CheckOT(pokemon) == TRUE) {
        locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);

        if (GetMonData(pokemon, MON_DATA_MET_LEVEL) == 0) {
            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, 5);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Egg2);
        } else if (locationMet >= 88) {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        } else {
            u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Met);
        }
    } else {
        gameMet = GetMonData(pokemon, MON_DATA_MET_GAME);

        if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD)) {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        } else {
            locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);
            if (locationMet == 0xFF) {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_FatefulEncounter);
            } else if (locationMet >= 88) {
                *ptr = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_ObtainedInTrade);
            } else {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                CopyLocationName(gStringVar1, locationMet);
                ptr = sub_80A1E9C(ptr, gStringVar1, 14);
                StringCopy(ptr, gOtherText_Met2);
            }
        }
    }

    MenuPrint(gStringVar4, left++, top++);
}
