#include "global.h"
#include "pokemon_storage_system.h"
#include "menu.h"
#include "string_util.h"
#include "ewram.h"

struct StorageAction {
    u8 *text;
    u8 format;
};

extern const struct StorageAction gUnknown_083B6DF4[];

EWRAM_DATA struct PokemonStorage gPokemonStorage = {0};

void sub_8098898(u8 index) {
    u8 *ptr;

    Menu_DrawStdWindowFrame(10, 16, 29, 19);

    switch (gUnknown_083B6DF4[index].format)
    {

    case 2:
        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        ptr = StringCopy(ptr, gUnk20011fa);
        break;

    case 5:
        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        ptr = StringCopy(ptr, gUnk20026e4);
        break;

    case 1:
        // {var} + " is selected."
        ptr = StringCopy(gUnk2002694, gUnk20011fa);
        ptr = StringCopy(ptr, gUnknown_083B6DF4[index].text);
        break;

    case 4:
        // {var} + " was released."
        ptr = StringCopy(gUnk2002694, gUnk20026e4);
#if ENGLISH
        ptr = StringCopy(ptr, gUnknown_083B6DF4[index].text);
#elif GERMAN
        ptr = de_sub_8073174(gUnk2002694, gUnknown_083B6DF4[index].text);
#endif
        break;

    case 3:
    {
        u8 *stringLength;
        u8 *text;

        text = gUnknown_083B6DF4[index].text;
        stringLength = &text[StringLength(text)] + 1;

        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        ptr = StringCopy(ptr, gUnk20011fa);
        ptr = StringCopy(ptr, stringLength);
    }
        break;

    case 6:
        // "Bye-bye, ".substr(0, -1) + {var} + "Bye-bye, !".substr(-1, 1)
    {
        u8 *stringLength;
        u8 *text;

        text = gUnknown_083B6DF4[index].text;
        stringLength = &text[StringLength(text)] - 1;

        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        ptr = StringCopy(ptr - 1, gUnk20026e4);
        ptr = StringCopy(ptr, stringLength);
    }
        break;

    case 0:
    default:
        ptr = StringCopy(gUnk2002694, gUnknown_083B6DF4[index].text);
        break;
    }

    while (ptr < gUnk20026A6)
    {
            ptr[0] = CHAR_SPACE;
            ptr++;
    }

    ptr[0] = EOS;
    Menu_PrintText(gUnk2002694, 11, 17);
}
