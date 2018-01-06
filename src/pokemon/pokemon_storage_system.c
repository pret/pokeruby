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

void sub_8095C8C(u16 *dest, u16 dest_left, u16 dest_top, const u16 *src, u16 src_left, u16 src_top, u16 dest_width, u16 dest_height, u16 src_width)
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

#ifdef NONMATCHING
void unref_sub_8095D08(u16 *dest, u16 dest_left, u16 dest_top, u16 width, u16 height)
{
    u16 i;

    dest += dest_top * 0x20 + dest_left;
    width *= 2;
    for (i = 0; i < height; dest += 0x20, i++)
    {
        void *_dest = dest;
        size_t _size = width;
        if (_size <= 0x1000)
        {
            DmaFill16(3, 0, _dest, _size);
        }
        else
        {
            while (1)
            {
                DmaFill16(3, 0, _dest, 0x1000);
                _dest += 0x1000;
                _size -= 0x1000;
                if (_size <= 0x1000)
                {
                    DmaFill16(3, 0, _dest, _size);
                    break;
                }
            }
        }
    }
}
#else
__attribute__((naked)) void unref_sub_8095D08(u16 *dest, u16 dest_left, u16 dest_top, u16 width, u16 height)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x8\n"
                    "\tadds r4, r0, 0\n"
                    "\tldr r0, [sp, 0x28]\n"
                    "\tlsls r1, 16\n"
                    "\tlsrs r1, 16\n"
                    "\tlsls r2, 16\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tmov r10, r0\n"
                    "\tlsrs r2, 11\n"
                    "\tadds r2, r1\n"
                    "\tlsls r2, 1\n"
                    "\tadds r4, r2\n"
                    "\tlsls r3, 17\n"
                    "\tlsrs r0, r3, 16\n"
                    "\tstr r0, [sp, 0x4]\n"
                    "\tmovs r0, 0\n"
                    "\tcmp r0, r10\n"
                    "\tbcs _08095DB2\n"
                    "\tmovs r6, 0x80\n"
                    "\tlsls r6, 5\n"
                    "\tmov r5, sp\n"
                    "\tldr r7, _08095D74 @ =0x040000d4\n"
                    "\tlsrs r3, 17\n"
                    "\tmov r9, r3\n"
                    "\tmov r1, r9\n"
                    "\tmovs r2, 0x81\n"
                    "\tlsls r2, 24\n"
                    "\torrs r1, r2\n"
                    "\tmov r9, r1\n"
                    "_08095D4E:\n"
                    "\tadds r3, r4, 0\n"
                    "\tldr r2, [sp, 0x4]\n"
                    "\tmovs r1, 0x40\n"
                    "\tadds r1, r4\n"
                    "\tmov r8, r1\n"
                    "\tadds r0, 0x1\n"
                    "\tmov r12, r0\n"
                    "\tcmp r2, r6\n"
                    "\tbhi _08095D78\n"
                    "\tmovs r0, 0\n"
                    "\tstrh r0, [r5]\n"
                    "\tmov r2, sp\n"
                    "\tstr r2, [r7]\n"
                    "\tstr r4, [r7, 0x4]\n"
                    "\tmov r0, r9\n"
                    "\tstr r0, [r7, 0x8]\n"
                    "\tldr r0, [r7, 0x8]\n"
                    "\tb _08095DA6\n"
                    "\t.align 2, 0\n"
                    "_08095D74: .4byte 0x040000d4\n"
                    "_08095D78:\n"
                    "\tmovs r4, 0\n"
                    "\tstrh r4, [r5]\n"
                    "\tldr r1, _08095DC4 @ =0x040000d4\n"
                    "\tmov r0, sp\n"
                    "\tstr r0, [r1]\n"
                    "\tstr r3, [r1, 0x4]\n"
                    "\tldr r0, _08095DC8 @ =0x81000800\n"
                    "\tstr r0, [r1, 0x8]\n"
                    "\tldr r0, [r1, 0x8]\n"
                    "\tadds r3, r6\n"
                    "\tsubs r2, r6\n"
                    "\tcmp r2, r6\n"
                    "\tbhi _08095D78\n"
                    "\tstrh r4, [r5]\n"
                    "\tmov r0, sp\n"
                    "\tstr r0, [r1]\n"
                    "\tstr r3, [r1, 0x4]\n"
                    "\tlsrs r0, r2, 1\n"
                    "\tmovs r2, 0x81\n"
                    "\tlsls r2, 24\n"
                    "\torrs r0, r2\n"
                    "\tstr r0, [r1, 0x8]\n"
                    "\tldr r0, [r1, 0x8]\n"
                    "_08095DA6:\n"
                    "\tmov r4, r8\n"
                    "\tmov r1, r12\n"
                    "\tlsls r0, r1, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tcmp r0, r10\n"
                    "\tbcc _08095D4E\n"
                    "_08095DB2:\n"
                    "\tadd sp, 0x8\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_08095DC4: .4byte 0x040000d4\n"
                    "_08095DC8: .4byte 0x81000800");
}
#endif

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
