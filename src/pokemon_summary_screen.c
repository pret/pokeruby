#include "global.h"
#include "asm.h"
#include "menu.h"
#include "pokemon.h"
#include "string_util.h"

extern u8 gStringVar1[];
extern u8 gStringVar4[];

extern u8 *(gNatureNames[]);
extern const u8 gOtherText_Terminator4[];
extern const u8 gOtherText_Nature[];

extern const u8 gOtherText_Met[];
extern const u8 gOtherText_Egg2[];
extern const u8 gOtherText_ObtainedInTrade[];
extern const u8 gOtherText_FatefulEncounter[];
extern const u8 gOtherText_Met2[];

u8 *sub_80A1E9C(u8 *dest, u8 *src, u8);
u8 sub_80A0664(struct Pokemon *pokemon);
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);

void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *pokemon, u8 left, u8 top) {
    u8 locationMet;
    u8 gameMet;
    u8 *ptr = gStringVar4;
    u8 nature = GetNature(pokemon);

    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);

    if (nature != NATURE_BOLD && nature != NATURE_GENTLE) {
        ptr = StringCopy(ptr, gOtherText_Terminator4);
    }

    ptr = StringCopy(ptr, gOtherText_Nature);

    if (sub_80A0664(pokemon) == TRUE) {
        locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);

        if (GetMonData(pokemon, MON_DATA_MET_LEVEL) == 0) {
            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, 5);
            ptr[0] = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Egg2);
        } else if (locationMet >= 88) {
            ptr[0] = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        } else {
            u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
            ptr[0] = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Met);
        }
    } else {
        gameMet = GetMonData(pokemon, MON_DATA_MET_GAME);

        if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == 3)) {
            ptr[0] = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        } else {
            locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);
            if (locationMet == 0xFF) {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                ptr[0] = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_FatefulEncounter);
            } else if (locationMet >= 88) {
                ptr[0] = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_ObtainedInTrade);
            } else {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                ptr[0] = CHAR_NEWLINE;
                ptr++;

                CopyLocationName(gStringVar1, locationMet);
                ptr = sub_80A1E9C(ptr, gStringVar1, 14);
                StringCopy(ptr, gOtherText_Met2);
            }
        }
    }

    MenuPrint(gStringVar4, left++, top++);
}
