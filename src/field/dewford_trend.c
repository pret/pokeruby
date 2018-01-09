#include "global.h"
#include "dewford_trend.h"
#include "easy_chat.h"
#include "constants/easy_chat.h"
#include "event_data.h"
#include "link.h"
#include "random.h"
#include "text.h"
#include "ewram.h"

extern u16 gSpecialVar_Result;
extern u16 gSpecialVar_0x8004;

static void sub_80FA46C(struct EasyChatPair *s, u16 b, u8 c);
static bool8 sub_80FA670(struct EasyChatPair *a, struct EasyChatPair *b, u8 c);
static void sub_80FA740(struct EasyChatPair *s);
static bool8 SB1ContainsWords(u16 *a);
static bool8 IsEasyChatPairEqual(u16 *words1, u16 *words2);
static s16 sub_80FA828(struct EasyChatPair *a, u16 b);

void InitDewfordTrend(void)
{
    u16 i;

    for (i = 0; i < 5; i++)
    {
        gSaveBlock1.easyChatPairs[i].words[0] = sub_80EB72C(EC_GROUP_CONDITIONS);

        if (Random() & 1)
            gSaveBlock1.easyChatPairs[i].words[1] = sub_80EB72C(EC_GROUP_LIFESTYLE);
        else
            gSaveBlock1.easyChatPairs[i].words[1] = sub_80EB72C(EC_GROUP_HOBBIES);

        gSaveBlock1.easyChatPairs[i].unk1_6 = Random() & 1;
        sub_80FA740(&gSaveBlock1.easyChatPairs[i]);
    }
    sub_80FA46C(gSaveBlock1.easyChatPairs, 5, 0);
}

void UpdateDewfordTrendPerDay(u16 a)
{
    u16 i;

    if (a != 0)
    {
        u32 sp0 = a * 5;

        for (i = 0; i < 5; i++)
        {
            //_080FA24A
            u32 r4;
            u32 r2 = sp0;
            struct EasyChatPair *r5 = &gSaveBlock1.easyChatPairs[i];

            if (r5->unk1_6 == 0)
            {
                if (r5->unk0_0 >= (u16)r2)
                {
                    r5->unk0_0 -= r2;
                    if (r5->unk0_0 == 0)
                        r5->unk1_6 = 1;
                    continue;
                }
                //_080FA290
                r2 -= r5->unk0_0;
                r5->unk0_0 = 0;
                r5->unk1_6 = 1;
            }
            //_080FA2A0
            r4 = r5->unk0_0 + r2;
            if ((u16)r4 > r5->unk0_7)
            {
                u32 sp4 = r4 % r5->unk0_7;
                r4 = r4 / r5->unk0_7;

                r5->unk1_6 = r4 ^ 1;
                if (r5->unk1_6)
                    r5->unk0_0 = sp4;
                else
                //_080FA2FA
                    r5->unk0_0 = r5->unk0_7 - sp4;
            }
            else
            {
                //_080FA310
                r5->unk0_0 = r4;

                if (r5->unk0_0 == r5->unk0_7)
                    r5->unk1_6 = 0;
            }
        }
        sub_80FA46C(gSaveBlock1.easyChatPairs, 5, 0);
    }
    //_080FA34E
}

bool8 sub_80FA364(u16 *a)
{
    struct EasyChatPair s = {0};
    u16 i;

    if (!SB1ContainsWords(a))
    {
        if (!FlagGet(FLAG_SYS_POPWORD_INPUT))
        {
            FlagSet(FLAG_SYS_POPWORD_INPUT);
            if (!FlagGet(FLAG_SYS_MIX_RECORD))
            {
                gSaveBlock1.easyChatPairs[0].words[0] = a[0];
                gSaveBlock1.easyChatPairs[0].words[1] = a[1];
                return 1;
            }
        }

        //_080FA3C8
        s.words[0] = a[0];
        s.words[1] = a[1];
        s.unk1_6 = 1;
        sub_80FA740(&s);

        for (i = 0; i < 5; i++)
        {
            if (sub_80FA670(&s, &gSaveBlock1.easyChatPairs[i], 0))
            {
                u16 r3 = 4;

                while (r3 > i)
                {
                    gSaveBlock1.easyChatPairs[r3] = gSaveBlock1.easyChatPairs[r3 - 1];
                    r3--;
                }
                gSaveBlock1.easyChatPairs[i] = s;
                return (i == 0);
            }
            //_080FA450
        }
        gSaveBlock1.easyChatPairs[4] = s;
    }
    return 0;
}

static void sub_80FA46C(struct EasyChatPair *s, u16 b, u8 c)
{
    u16 h;

    for (h = 0; h < b; h++)
    {
        u16 i;

        for (i = h + 1; i < b; i++)
        {
            if (sub_80FA670(&s[i], &s[h], c))
            {
                struct EasyChatPair temp;

                temp = s[i];
                s[i] = s[h];
                s[h] = temp;
            }
        }
    }
}

void sub_80FA4E4(void *a, u32 b, u8 unused)
{
    u16 i;
    u16 j;
    u16 r7;
    struct EasyChatPair *src;
    struct EasyChatPair *dst;
    u16 players = GetLinkPlayerCount();

    for (i = 0; i < players; i++)
        memcpy(&ARRAY_2007800[i * 5], (u8 *)a + i * b, 40);
    src = ARRAY_2007800;
    dst = ARRAY_2007900;
    r7 = 0;
    for (i = 0; i < players; i++)
    {
        for (j = 0; j < 5; j++)
        {
            s16 foo = sub_80FA828(src, r7);
            if (foo < 0)
            {
                *(dst++) = *src;
                r7++;
            }
            else
            {
                if (ARRAY_2007900[foo].unk0_0 < src->unk0_0)
                {
                    ARRAY_2007900[foo] = *src;
                }
            }
            src++;
        }
    }
    sub_80FA46C(ARRAY_2007900, r7, 2);
    src = ARRAY_2007900;
    dst = gSaveBlock1.easyChatPairs;
    for (i = 0; i < 5; i++)
        *(dst++) = *(src++);
}

void BufferTrendyPhraseString(void)
{
    struct EasyChatPair *s = &gSaveBlock1.easyChatPairs[gSpecialVar_0x8004];

    ConvertEasyChatWordsToString(gStringVar1, s->words, 2, 1);
}

void TrendyPhraseIsOld(void)
{
    u16 result = 0;

    if (gSaveBlock1.easyChatPairs[0].unk0_0 - gSaveBlock1.easyChatPairs[1].unk0_0 < 2)
    {
        asm("":::"r2"); //Force the compiler to store address of gSaveBlock1 in r3 instead of r2
        if (!gSaveBlock1.easyChatPairs[0].unk1_6 && gSaveBlock1.easyChatPairs[1].unk1_6)
            result = 1;
    }
    gSpecialVar_Result = result;
}

void GetDewfordHallPaintingNameIndex(void)
{
    gSpecialVar_Result = (gSaveBlock1.easyChatPairs[0].words[0] + gSaveBlock1.easyChatPairs[0].words[1]) & 7;
}

static bool8 sub_80FA670(struct EasyChatPair *a, struct EasyChatPair *b, u8 c)
{
    switch (c)
    {
    case 0:
        if (a->unk0_0 > b->unk0_0)
            return 1;
        if (a->unk0_0 < b->unk0_0)
            return 0;
        if (a->unk0_7 > b->unk0_7)
            return 1;
        if (a->unk0_7 < b->unk0_7)
            return 0;
        break;
    case 1:
        if (a->unk0_7 > b->unk0_7)
            return 1;
        if (a->unk0_7 < b->unk0_7)
            return 0;
        if (a->unk0_0 > b->unk0_0)
            return 1;
        if (a->unk0_0 < b->unk0_0)
            return 0;
        break;
    case 2:
        if (a->unk0_0 > b->unk0_0)
            return 1;
        if (a->unk0_0 < b->unk0_0)
            return 0;
        if (a->unk0_7 > b->unk0_7)
            return 1;
        if (a->unk0_7 < b->unk0_7)
            return 0;
        if (a->unk2 > b->unk2)
            return 1;
        if (a->unk2 < b->unk2)
            return 0;
        if (a->words[0] > b->words[0])
            return 1;
        if (a->words[0] < b->words[0])
            return 0;
        if (a->words[1] > b->words[1])
            return 1;
        if (a->words[1] < b->words[1])
            return 0;
        return 1;
    }
    return Random() & 1;
}

static void sub_80FA740(struct EasyChatPair *s)
{
    u16 r4;

    r4 = Random() % 98;
    if (r4 > 50)
    {
        r4 = Random() % 98;
        if (r4 > 80)
            r4 = Random() % 98;
    }
    s->unk0_7 = r4 + 30;
    s->unk0_0 = (Random() % (r4 + 1)) + 30;
    s->unk2 = Random();
}

static bool8 SB1ContainsWords(u16 *a)
{
    u16 i;

    for (i = 0; i < 5; i++)
    {
        if (IsEasyChatPairEqual(a, gSaveBlock1.easyChatPairs[i].words) != 0)
            return TRUE;
    }
    return FALSE;
}

static bool8 IsEasyChatPairEqual(u16 *words1, u16 *words2)
{
    u16 i;

    for (i = 0; i < 2; i++)
    {
        if (*(words1++) != *(words2++))
            return FALSE;
    }
    return TRUE;
}

static s16 sub_80FA828(struct EasyChatPair *a, u16 b)
{
    s16 i;
    struct EasyChatPair *s = ARRAY_2007900;

    for (i = 0; i < b; i++)
    {
        if (IsEasyChatPairEqual(a->words, s->words))
            return i;
        s++;
    }
    return -1;
}
