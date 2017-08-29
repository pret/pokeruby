#include "global.h"
#include "pokemon.h"
#include "pokemon_menu.h"
#include "party_menu.h"
#include "palette.h"
#include "menu.h"
#include "mail_data.h"

/*
Pokemon menu:
    The menu that appears when you
    click on a pokemon in
    overworld 'pokemon' menu
*/

extern u8 gLastFieldPokeMenuOpened;

EWRAM_DATA u8 sPokeMenuCursorPos = 0;
EWRAM_DATA u8 sPokeMenuOptionsNo = 0;
EWRAM_DATA u8 sPokeMenuOptionsIDs[8] = {0}; // 4 possible field moves and 4 default options

#define sFieldMovesTerminator 0xFF // note: should be changed to 0xFFFF, because currently it makes it impossible to add a field move with 0xFF index

extern const u16 sPokeMenuFieldMoves[];
extern const struct MenuAction sPokemonMenuActions[];

void sub_8089A70(void)
{
    gPaletteFade.bufferTransferDisabled = 1;
    OpenPartyMenu(0, 0);
}

void sub_8089A8C(void)
{
    sPokeMenuOptionsNo = 0;
    // if checking pokemon is an egg, we can't give it an item and it doesn't know any move
    if (GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_IS_EGG))
    {
        AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, POKEMENU_SUMMARY);
        AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, POKEMENU_SWITCH);
        AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, POKEMENU_CANCEL);
    }
    else
    {
        u16 moveID, tableID;
        for (moveID = 0; moveID < 4; moveID++) // 4, max number of possible field moves
        {
            for (tableID = 0; sPokeMenuFieldMoves[tableID] != sFieldMovesTerminator; tableID++)
            {
                if (GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_MOVE1 + moveID) == sPokeMenuFieldMoves[tableID])
                {
                    u8 fieldID = tableID + POKEMENU_FIRST_FIELD_MOVE_ID;
                    AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, fieldID);
                    break;
                }
            }
        }
        AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, POKEMENU_SUMMARY);

        // can't switch a pokemon if it's the only one in the party
        if (GetMonData(&gPlayerParty[1], MON_DATA_SPECIES) != 0)
            AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, POKEMENU_SWITCH);

        if (ItemIsMail(GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_HELD_ITEM)))
            AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, POKEMENU_MAIL);
        else
            AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, POKEMENU_ITEM);

        AppendToList(sPokeMenuOptionsIDs, &sPokeMenuOptionsNo, POKEMENU_CANCEL);
    }
}

void sub_8089BDC(u8 arg0, u8 arg1, u8 arg2, u8 arg3, const struct MenuAction* arg4, const u8* arg5, u8 arg6)
{
    sub_806D538(5, arg6);
    MenuDrawTextWindow(arg0, arg1, arg0 + arg2, (arg3 * 2) + arg1 + 1);
    PrintMenuItemsReordered(arg0 + 1, arg1 + 1, arg3, arg4, arg5);
}

void sub_8089C50(u8 arg0, u8 arg1, u8 arg2, u8 arg3, const struct MenuAction* arg4, const u8* arg5)
{
    sub_8089BDC(arg0, arg1, arg2, arg3, arg4, arg5, 1);
}

void sub_8089C7C(u8 arg0)
{
    u32 r4 = (u8)(18 - (sPokeMenuOptionsNo << 1));

    sub_8089BDC(19, r4, 10, sPokeMenuOptionsNo, sPokemonMenuActions, sPokeMenuOptionsIDs, 3);
    r4 |= 1;
    InitMenu(0, 20, r4, sPokeMenuOptionsNo, arg0, 9);
}
