#include "global.h"
#include "pokemon_storage_system.h"
#include "menu.h"
#include "string_util.h"
#include "event_data.h"
#include "ewram.h"

struct StorageAction {
    u8 *text;
    u8 format;
};

extern const struct StorageAction gUnknown_083B6DF4[];

EWRAM_DATA struct PokemonStorage gPokemonStorage = {0};

u8 sub_8095ADC(u8 boxId)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < 30; i++)
    {
        if (GetBoxMonData(gPokemonStorage.boxes[boxId] + i, MON_DATA_SPECIES) != 0)
            count++;
    }
    return count;
}

s16 sub_8095B24(u8 boxId)
{
    u16 i;

    for (i = 0; i < 30; i++)
    {
        if (GetBoxMonData(gPokemonStorage.boxes[boxId] + i, MON_DATA_SPECIES) == 0)
            return i;
    }
    return -1;
}

u8 GetNumValidDaycarePartyMons(void)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        struct Pokemon *pokemon = gPlayerParty + i;
        if (GetMonData(pokemon, MON_DATA_SPECIES) != 0 && !GetMonData(pokemon, MON_DATA_IS_EGG))
            count++;
    }
    return count;
}

u8 CountAlivePartyMonsExceptOne(u8 toSkip)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (i != toSkip)
        {
            struct Pokemon *pokemon = gPlayerParty + i;
            if (GetMonData(pokemon, MON_DATA_SPECIES) != 0 && !GetMonData(pokemon, MON_DATA_IS_EGG) && GetMonData(pokemon, MON_DATA_HP) != 0)
                count++;
        }
    }
    return count;
}

u8 CountAlivePartyMonsExceptSelectedOne(void)
{
    return CountAlivePartyMonsExceptOne(gSpecialVar_0x8004);
}

u8 StorageSystemGetPartySize(void)
{
    u16 i;
    u16 count;

    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (GetMonData(gPlayerParty + i, MON_DATA_SPECIES) != 0)
            count++;
    }
    return count;
}

u8 *unref_sub_8095C60(u8 *dest, const u8 *src, u16 pad)
{
    u8 *_dest = StringCopy(dest, src);
    while (_dest < dest + pad)
    {
        *_dest++ = CHAR_SPACE;
    }
    *_dest = EOS;
    return _dest;
}

void sub_8095C8C(u16 *dest, u16 dest_left, u16 dest_top, u16 *src, u16 src_left, u16 src_top, u16 dest_width, u16 dest_height, u16 src_width)
{
    u16 i;

    dest_width *= 2;
    dest += dest_top * 0x20 + dest_left;
    src += src_top * src_width + src_left;
    for (i = 0; i < dest_height; i++)
    {
        CpuCopy16(src, dest, dest_width);
        dest += 0x20;
        src += src_width;
    }
}

asm(".section .text.8098898");

void sub_8098898(u8 index) {
    u8 *ptr;

    MenuDrawTextWindow(10, 16, 29, 19);

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
    MenuPrint(gUnk2002694, 11, 17);
}
