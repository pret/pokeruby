#include "global.h"
#include "easy_chat.h"
#include "asm.h"
#include "event_data.h"
#include "field_message_box.h"
#include "pokedex.h"
#include "rng.h"
#include "text.h"

u8 sub_80EB8C0(void);
u8 sub_80EB868(u8);
u16 sub_80EAE88(u8);
void sub_80EB890(u8);
u16 sub_80EB784(u16 group);
u8 sub_80EAD7C(u8 group);
u8 sub_80EB680(u16 *, u16, u16, u16);
static u16 sub_80EB9D8(void);
static u16 sub_80EB960(void);
u16 sub_80EB72C(u16);

extern void *gEasyChatGroupWords[];
extern const u8 gEasyChatGroupSizes[];

extern u16 gSpecialVar_0x8004;

void sub_80EB6FC(u16 *arg0, u16 arg1) {
    for (arg1--; arg1!=0xffff; arg1--)
        *(arg0++) = 0xffff;
}

u16 sub_80EB72C(u16 group) {
    u16 local1;

    local1 = Random() % gEasyChatGroupSizes[group];

    if (group == EC_GROUP_POKEMON ||
        group == EC_GROUP_POKEMON_2 ||
        group == EC_GROUP_MOVE_1 ||
        group == EC_GROUP_MOVE_2)
    {
        local1 = ((u16 *) gEasyChatGroupWords[group])[local1];
    }


    return ((group & 0x7F) << 9) | (local1 & 0x1FF);
}

u16 sub_80EB784(u16 group) {
    if (!sub_80EAD7C(group))
    {
        return -1;
    }

    if (group != EC_GROUP_POKEMON)
    {
        if (group == EC_GROUP_TRENDY_SAYING)
        {
            return sub_80EB960();
        }
    }
    else
    {
        return sub_80EB9D8();
    }

    return sub_80EB72C(group);
}

void sub_80EB7C4(void) {
    u16 *words;
    u16 arg1, arg2;


    switch (gSpecialVar_0x8004)
    {
    case 0:
        words = gSaveBlock1.unk2B1C;
        arg1 = 2;
        arg2 = 2;
        break;

    case 1:
        words = gSaveBlock1.unk2B28;
        if (sub_80EB680(gSaveBlock1.unk2B28, 3, 2, 20))
        {
            arg1 = 2;
            arg2 = 3;
        }
        else
        {
            arg1 = 3;
            arg2 = 2;
        }
        break;

    case 2:
        words = gSaveBlock1.unk2B34;
        arg1 = 3;
        arg2 = 2;
        break;

    case 3:
        words = gSaveBlock1.unk2B40;
        arg1 = 3;
        arg2 = 2;
        break;

    default:
        return;
    }

    ConvertEasyChatWordsToString(gStringVar4, words, arg1, arg2);
    ShowFieldAutoScrollMessage(gStringVar4);
}

void sub_80EB83C(void) {
    u16 group, local2;

    if (Random() & 1)
    {
        group = EC_GROUP_HOBBIES;
    }
    else
    {
        group = EC_GROUP_LIFESTYLE;
    }

    local2 = sub_80EB784(group);
    sub_80EB3FC(gStringVar2, local2);
}

u8 sub_80EB868(u8 arg0) {
    int offset;
    int index;

    index = arg0 / 8;
    offset = arg0 & 7;
    return (gSaveBlock1.unk2D8C[index] >> offset) & 1;
}

void sub_80EB890(u8 arg0) {
    int offset;
    int index;

    if (arg0 > 32)
    {
        return;
    }

    index = arg0 / 8;
    offset = arg0 & 7;
    gSaveBlock1.unk2D8C[index] |= 1 << offset;
}

u8 sub_80EB8C0(void) {
    u8 i, retval;

    i = 0;
    retval = 0;
    for (; i < 33; i++)
    {
        if (sub_80EB868(i))
        {
            retval += 1;
        }
    }

    return retval;
}

u16 sub_80EB8EC(void) {
    u16 i;
    u16 local1, local2;

    local1 = sub_80EB8C0();
    if (local1 == 33)
    {
        return -1;
    }

    local2 = Random() % (33 - local1);

    for (i = 0; i <= 0x20; i++)
    {
        if (sub_80EB868(i) == 0)
        {
            if (local2 == 0)
            {
                sub_80EB890(i);
                return (i & 0x1FF) | 0x2800;
            }

            local2--;
        }
    }

    return -1;
}

static u16 sub_80EB960(void) {
    u16 i;
    u16 local1;

    local1 = sub_80EB8C0();
    if (local1 == 0)
    {
        return -1;
    }

    local1 = Random() % local1;

    for (i = 0; i <= 0x20; i++)
    {
        if (sub_80EB868(i))
        {
            if (local1 == 0)
            {
                return (i & 0x1FF) | 0x2800;
            }

            local1--;
        }
    }

    return -1;
}

u8 sub_80EB9C8(void) {
    return IsNationalPokedexEnabled();
}

static u16 sub_80EB9D8(void) {
    u16 *speciesList;
    u16 local1;
    u16 i;

    local1 = sub_80EAE88(0);

    if (local1 == 0)
    {
        return -1;
    }

    local1 = Random() % local1;
    speciesList = (u16 *) gEasyChatGroupWords[EC_GROUP_POKEMON];

    for (i = 0; i < gEasyChatGroupSizes[EC_GROUP_POKEMON]; i++)
    {
        const u16 dexNum = SpeciesToNationalPokedexNum(*speciesList);

        const u8 local2 = sub_8090D90(dexNum, 0);

        if (local2)
        {
            if (local1 == 0)
            {
                return *speciesList & 0x1FF;
            }

            local1--;
        }

        speciesList++;
    }

    return -1;
}

