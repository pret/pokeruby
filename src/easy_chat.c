#include "global.h"
#include "easy_chat.h"
#include "data2.h"
#include "event_data.h"
#include "field_message_box.h"
#include "pokedex.h"
#include "rng.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "text.h"

static bool8 sub_80EB680(u16 *, u16, u16, u16);
static u16 sub_80EB9D8(void);
static u16 sub_80EB960(void);

extern void *gEasyChatGroupWords[];
extern const u8 gEasyChatGroupSizes[];

extern u16 gSpecialVar_0x8004;

IWRAM_DATA u8 gUnknown_03000740;


u8 *sub_80EB3FC(u8 *dst, u16 word)
{
    u16 group;
    u16 wordIndex;
    u8 *src;
    u16 i;

    if (sub_80EB37C(word))
        return StringCopy(dst, gOtherText_ThreeQuestions);

    if (word == 0xFFFF)
    {
        dst[0] = EOS;
        return dst;
    }
    else
    {
        group = word >> 9;
        wordIndex = word & 0x1FF;
        switch (group)
        {
        case EC_GROUP_POKEMON: // 0
        case EC_GROUP_POKEMON_2: // 21
            dst = StringCopy(dst, gSpeciesNames[wordIndex]);
            break;
        case EC_GROUP_MOVE_1: // 18
        case EC_GROUP_MOVE_2: // 19
            dst = StringCopy(dst, gMoveNames[wordIndex]);
            break;
        default:
            src = gEasyChatGroupWords[group];
            for (i = wordIndex - 1; i != 0xFFFF; i--)
            {
                while (*src++ != EOS)
                    ;
            }
            dst = StringCopy(dst, src);
            break;
        }
        dst[0] = EOS;
        return dst;
    }
}

u8 *ConvertEasyChatWordsToString(u8 *dst, u16 *words, u16 arg2, u16 arg3)
{
    u16 i;
    u16 n;

    const u16 i1 = arg2 - 1;

    for (i = 0; i < arg3; i++)
    {
        u16 word;

        for (n = 0; n < i1; n++)
        {
            dst = sub_80EB3FC(dst, words[0]);

            if (words[0] != 0xFFFF)
            {
                dst[0] = CHAR_SPACE;
                dst++;
            }

            words++;
        }

        word = words[0];
        words++;
        dst = sub_80EB3FC(dst, word);

        dst[0] = CHAR_NEWLINE;
        dst++;
    }

    dst--;
    dst[0] = EOS;

    return dst;
}

u8 *sub_80EB544(u8 *dst, u16 *words, u16 arg2, u16 arg3)
{
    u16 i;
    u16 n;

    const u16 i1 = arg2 - 1;

    for (i = 0; i < arg3; i++)
    {
        u16 word;

        for (n = 0; n < i1; n++)
        {
            dst = sub_80EB3FC(dst, words[0]);

            if (words[0] != 0xFFFF)
            {
                dst[0] = CHAR_SPACE;
                dst++;
            }

            words++;
        }

        word = words[0];
        words++;
        dst = sub_80EB3FC(dst, word);

        // Only difference with ConvertEasyChatWordsToString
        dst[0] = (i == 0) ? CHAR_NEWLINE : CHAR_PROMPT_SCROLL;
        dst++;
    }

    dst--;
    dst[0] = EOS;

    return dst;
}


u16 unref_sub_80EB5E0(u16 arg0)
{
    u8 *chars;
    u16 i;
    u16 length;
    int group, word;


    if (arg0 == 0xFFFF)
        return 0;

    group = arg0 >> 9;
    word = arg0 & 0x1FF;
    switch (group)
    {
    case EC_GROUP_POKEMON: // 0
    case EC_GROUP_POKEMON_2: // 21
        chars = (u8 *) gSpeciesNames[word];
        break;
    case EC_GROUP_MOVE_1: // 18
    case EC_GROUP_MOVE_2: // 19
        chars = gMoveNames[word];
        break;
    default:
        chars = gEasyChatGroupWords[group];
        for (i = word - 1; i != 0xFFFF; i--)
        {
            while (*chars++ != EOS)
                ;
        }
        break;
    }

    length = 0;
    while (*chars != EOS)
    {
        chars++;
        length++;
    }

    return length;
}

static bool8 sub_80EB680(u16 *arg0, u16 arg1, u16 arg2, u16 arg3)
{
    return FALSE;
}

void unref_sub_80EB684(u8 arg0, u16 arg1)
{
    u16 *ptr;
    u16 c;

    // FIXME: find actual tv shows used
    switch (arg0)
    {
    case 5:
        c = 6;
        ptr = (u16*)((void *)&gSaveBlock1.tvShows[arg1] + 0x04);
        break;
    case 7:
        c = 2;
        ptr = (u16*)((void *)&gSaveBlock1.tvShows[arg1] + 0x1C);
        break;
    case 8:
        c = 1;
        ptr = (u16*)((void *)&gSaveBlock1.tvShows[arg1] + 0x02);
        break;
    default:
        return;
    }

    c -= 1;
    while (c != 0xFFFF)
    {
        *ptr = -1;
        ptr++;
        c -= 1;
    }
}

void sub_80EB6FC(u16 *arg0, u16 arg1)
{
    u16 i;

    for (i = arg1 - 1; i != 0xFFFF; i--)
    {
        *arg0 = 0xFFFF;
        arg0++;
    }

}

u16 sub_80EB72C(u16 group)
{
    u16 local1 = Random() % gEasyChatGroupSizes[group];

    if (group == EC_GROUP_POKEMON
     || group == EC_GROUP_POKEMON_2
     || group == EC_GROUP_MOVE_1
     || group == EC_GROUP_MOVE_2)
    {
        local1 = ((u16 *) gEasyChatGroupWords[group])[local1];
    }

    return ((group & 0x7F) << 9) | (local1 & 0x1FF);
}

u16 sub_80EB784(u16 group)
{
    if (!sub_80EAD7C(group))
        return -1;

    if (group != EC_GROUP_POKEMON)
    {
        if (group == EC_GROUP_TRENDY_SAYING)
            return sub_80EB960();
    }
    else
    {
        return sub_80EB9D8();
    }

    return sub_80EB72C(group);
}

void sub_80EB7C4(void)
{
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

void sub_80EB83C(void)
{
    u16 group, local2;

    if (Random() & 1)
        group = EC_GROUP_HOBBIES;
    else
        group = EC_GROUP_LIFESTYLE;

    local2 = sub_80EB784(group);
    sub_80EB3FC(gStringVar2, local2);
}

u8 sub_80EB868(u8 arg0)
{
    int offset;
    int index;

    index = arg0 / 8;
    offset = arg0 % 8;
    return (gSaveBlock1.unk2D8C[index] >> offset) & 1;
}

void sub_80EB890(u8 arg0)
{
    int offset;
    int index;

    if (arg0 < 33)
    {
        index = arg0 / 8;
        offset = arg0 % 8;
        gSaveBlock1.unk2D8C[index] |= 1 << offset;
    }
}

u8 sub_80EB8C0(void)
{
    u8 i, count;

    for (i = 0, count = 0; i < 33; i++)
    {
        if (sub_80EB868(i))
            count++;
    }
    return count;
}

u16 sub_80EB8EC(void)
{
    u16 i;
    u16 local1, local2;

    local1 = sub_80EB8C0();
    if (local1 == 33)
        return -1;

    local2 = Random() % (33 - local1);
    for (i = 0; i < 33; i++)
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

static u16 sub_80EB960(void)
{
    u16 i;
    u16 local1;

    local1 = sub_80EB8C0();
    if (local1 == 0)
        return -1;

    local1 = Random() % local1;
    for (i = 0; i < 33; i++)
    {
        if (sub_80EB868(i))
        {
            if (local1 == 0)
                return (i & 0x1FF) | 0x2800;
            local1--;
        }
    }

    return -1;
}

u8 sub_80EB9C8(void)
{
    return IsNationalPokedexEnabled();
}

static u16 sub_80EB9D8(void)
{
    u16 *speciesList;
    u16 local1;
    u16 i;

    local1 = sub_80EAE88(0);

    if (local1 == 0)
        return -1;

    local1 = Random() % local1;
    speciesList = (u16 *) gEasyChatGroupWords[EC_GROUP_POKEMON];
    for (i = 0; i < gEasyChatGroupSizes[EC_GROUP_POKEMON]; i++)
    {
        const u16 dexNum = SpeciesToNationalPokedexNum(*speciesList);
        const u8 local2 = GetNationalPokedexFlag(dexNum, 0);

        if (local2)
        {
            if (local1 == 0)
                return *speciesList & 0x1FF;
            local1--;
        }
        speciesList++;
    }
    return -1;
}
