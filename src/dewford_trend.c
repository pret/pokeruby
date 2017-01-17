#include "global.h"
#include "asm.h"
#include "event_data.h"
#include "link.h"
#include "rng.h"
#include "text.h"

extern u8 unk_2000000[];

#define ARRAY_2007800 ((struct EasyChatPair *)(unk_2000000 + 0x7800))
#define ARRAY_2007900 ((struct EasyChatPair *)(unk_2000000 + 0x7900))

extern u16 gScriptResult;
extern u16 gSpecialVar_0x8004;

static void sub_80FA46C(struct EasyChatPair *s, u16 b, u8 c);
static bool8 sub_80FA670(struct EasyChatPair *a, struct EasyChatPair *b, u8 c);
static void sub_80FA740(struct EasyChatPair *s);
static bool8 SB1ContainsWords(u16 *a);
static bool8 IsEasyChatPairEqual(u16 *words1, u16 *words2);
static s16 sub_80FA828(struct EasyChatPair *a, u16 b);

void sub_80FA17C(void)
{
    u16 i;

    for(i = 0; i < 5; i++)
    {
        gSaveBlock1.easyChatPairs[i].words[0] = sub_80EB72C(10);

        if(Random() & 1)
            gSaveBlock1.easyChatPairs[i].words[1] = sub_80EB72C(12);
        else
            gSaveBlock1.easyChatPairs[i].words[1] = sub_80EB72C(13);

        gSaveBlock1.easyChatPairs[i].unk1_6 = Random() & 1;
        sub_80FA740(&gSaveBlock1.easyChatPairs[i]);
    }
    sub_80FA46C(gSaveBlock1.easyChatPairs, 5, 0);
}

#ifdef NONMATCHING
void sub_80FA220(u16 a)
{
    u16 i;
    u32 sp0;
    u32 sp4;

    if(a != 0)
    {
        sp0 = a * 5;

        for(i = 0; i < 5; i++)
        {
            //_080FA24A
            u32 r2 = sp0;
            u32 r4;

            if(gSaveBlock1.easyChatPairs[i].unk1_6 == 0)
            {
                if(gSaveBlock1.easyChatPairs[i].unk0_0 >= r2)
                {
                    gSaveBlock1.easyChatPairs[i].unk0_0 -= r2;
                    if(gSaveBlock1.easyChatPairs[i].unk0_0 == 0)
                        gSaveBlock1.easyChatPairs[i].unk1_6 = 1;
                    continue;
                }
                //_080FA290
                r2 -= gSaveBlock1.easyChatPairs[i].unk0_0;
                gSaveBlock1.easyChatPairs[i].unk1_6 = 1;
            }
            //_080FA2A0
            r4 = gSaveBlock1.easyChatPairs[i].unk0_0 + r2;
            if(r4 > gSaveBlock1.easyChatPairs[i].unk0_7)
            {
                sp4 = r4 % gSaveBlock1.easyChatPairs[i].unk0_7;
                r4 = r4 / gSaveBlock1.easyChatPairs[i].unk0_7;

                if(r4 == 0)
                    gSaveBlock1.easyChatPairs[i].unk1_6 = 1;
                else
                    gSaveBlock1.easyChatPairs[i].unk1_6 = 0;


                if(gSaveBlock1.easyChatPairs[i].unk1_6)
                {
                    gSaveBlock1.easyChatPairs[i].unk0_0 += sp4;
                    continue;
                }
                //_080FA2FA
                gSaveBlock1.easyChatPairs[i].unk0_7 -= sp4;
                continue;
            }
            //_080FA310
            gSaveBlock1.easyChatPairs[i].unk0_0 = r4;

            if(gSaveBlock1.easyChatPairs[i].unk0_0 == gSaveBlock1.easyChatPairs[i].unk0_7)
                gSaveBlock1.easyChatPairs[i].unk1_6 = 0;
        }
        sub_80FA46C(gSaveBlock1.easyChatPairs, 5, 0);
    }
    //_080FA34E
}

#else
__attribute__((naked))
void sub_80FA220(u16 a)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x8\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	cmp r1, 0\n\
	bne _080FA236\n\
	b _080FA34E\n\
_080FA236:\n\
	lsls r0, r1, 2\n\
	adds r0, r1\n\
	str r0, [sp]\n\
	movs r0, 0\n\
	mov r10, r0\n\
	movs r1, 0x7F\n\
	mov r9, r1\n\
	movs r2, 0x80\n\
	negs r2, r2\n\
	mov r8, r2\n\
_080FA24A:\n\
	ldr r2, [sp]\n\
	mov r4, r10\n\
	lsls r0, r4, 3\n\
	ldr r1, _080FA28C @ =gSaveBlock1 + 0x2DD4\n\
	adds r5, r0, r1\n\
	ldrb r6, [r5, 0x1]\n\
	movs r0, 0x40\n\
	ands r0, r6\n\
	cmp r0, 0\n\
	bne _080FA2A0\n\
	ldrb r4, [r5]\n\
	lsls r3, r4, 25\n\
	lsrs r1, r3, 25\n\
	lsls r0, r2, 16\n\
	lsrs r0, 16\n\
	cmp r1, r0\n\
	bcc _080FA290\n\
	adds r0, r1, 0\n\
	subs r0, r2\n\
	mov r2, r9\n\
	ands r0, r2\n\
	mov r1, r8\n\
	ands r1, r4\n\
	orrs r1, r0\n\
	strb r1, [r5]\n\
	movs r0, 0x7F\n\
	ands r1, r0\n\
	cmp r1, 0\n\
	bne _080FA336\n\
	movs r0, 0x40\n\
	orrs r0, r6\n\
	b _080FA334\n\
	.align 2, 0\n\
_080FA28C: .4byte gSaveBlock1 + 0x2DD4\n\
_080FA290:\n\
	lsrs r0, r3, 25\n\
	subs r2, r0\n\
	mov r0, r8\n\
	ands r0, r4\n\
	strb r0, [r5]\n\
	movs r0, 0x40\n\
	orrs r0, r6\n\
	strb r0, [r5, 0x1]\n\
_080FA2A0:\n\
	ldrb r7, [r5]\n\
	lsls r0, r7, 25\n\
	lsrs r0, 25\n\
	adds r4, r0, r2\n\
	ldrh r0, [r5]\n\
	lsls r6, r0, 18\n\
	lsls r0, r4, 16\n\
	lsrs r0, 16\n\
	lsrs r1, r6, 25\n\
	cmp r0, r1\n\
	bls _080FA310\n\
	adds r0, r4, 0\n\
	bl __umodsi3\n\
	adds r3, r0, 0\n\
	lsrs r1, r6, 25\n\
	adds r0, r4, 0\n\
	str r3, [sp, 0x4]\n\
	bl __udivsi3\n\
	adds r4, r0, 0\n\
	movs r0, 0x1\n\
	eors r4, r0\n\
	ands r4, r0\n\
	lsls r2, r4, 6\n\
	ldrb r0, [r5, 0x1]\n\
	movs r4, 0x41\n\
	negs r4, r4\n\
	adds r1, r4, 0\n\
	ands r0, r1\n\
	orrs r0, r2\n\
	strb r0, [r5, 0x1]\n\
	movs r1, 0x40\n\
	ands r0, r1\n\
	ldr r3, [sp, 0x4]\n\
	cmp r0, 0\n\
	beq _080FA2FA\n\
	adds r1, r3, 0\n\
	mov r0, r9\n\
	ands r1, r0\n\
	mov r0, r8\n\
	ands r0, r7\n\
	orrs r0, r1\n\
	strb r0, [r5]\n\
	b _080FA336\n\
_080FA2FA:\n\
	ldrh r0, [r5]\n\
	lsls r0, 18\n\
	lsrs r0, 25\n\
	subs r0, r3\n\
	mov r1, r9\n\
	ands r0, r1\n\
	mov r1, r8\n\
	ands r1, r7\n\
	orrs r1, r0\n\
	strb r1, [r5]\n\
	b _080FA336\n\
_080FA310:\n\
	mov r2, r9\n\
	ands r4, r2\n\
	mov r0, r8\n\
	ands r0, r7\n\
	orrs r0, r4\n\
	strb r0, [r5]\n\
	lsls r0, 25\n\
	ldrh r1, [r5]\n\
	lsls r1, 18\n\
	lsrs r0, 25\n\
	lsrs r1, 25\n\
	cmp r0, r1\n\
	bne _080FA336\n\
	ldrb r0, [r5, 0x1]\n\
	movs r4, 0x41\n\
	negs r4, r4\n\
	adds r1, r4, 0\n\
	ands r0, r1\n\
_080FA334:\n\
	strb r0, [r5, 0x1]\n\
_080FA336:\n\
	mov r0, r10\n\
	adds r0, 0x1\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	mov r10, r0\n\
	cmp r0, 0x4\n\
	bls _080FA24A\n\
	ldr r0, _080FA360 @ =gSaveBlock1 + 0x2DD4\n\
	movs r1, 0x5\n\
	movs r2, 0\n\
	bl sub_80FA46C\n\
_080FA34E:\n\
	add sp, 0x8\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080FA360: .4byte gSaveBlock1 + 0x2DD4\n\
	.syntax divided\n");
}
#endif

bool8 sub_80FA364(u16 *a)
{
    struct EasyChatPair s = {0};
    u16 i;

    if(!SB1ContainsWords(a))
    {
        if(!FlagGet(SYS_POPWORD_INPUT))
        {
            FlagSet(SYS_POPWORD_INPUT);
            if(!FlagGet(SYS_MIX_RECORD))
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

        for(i = 0; i < 5; i++)
        {
            if(sub_80FA670(&s, &gSaveBlock1.easyChatPairs[i], 0))
            {
                u16 r3 = 4;

                while(r3 > i)
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

    for(h = 0; h < b; h++)
    {
        u16 i;

        for(i = h + 1; i < b; i++)
        {
            if(sub_80FA670(&s[i], &s[h], c))
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

    for(i = 0; i < players; i++)
        memcpy(&ARRAY_2007800[i * 5], (u8 *)a + i * b, 40);
    src = ARRAY_2007800;
    dst = ARRAY_2007900;
    r7 = 0;
    for(i = 0; i < players; i++)
    {
        for(j = 0; j < 5; j++)
        {
            s16 foo = sub_80FA828(src, r7);
            if(foo < 0)
            {
                *(dst++) = *src;
                r7++;
            }
            else
            {
                if(ARRAY_2007900[foo].unk0_0 < src->unk0_0)
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
    for(i = 0; i < 5; i++)
        *(dst++) = *(src++);
}

void sub_80FA5BC(void)
{
    struct EasyChatPair *s = &gSaveBlock1.easyChatPairs[gSpecialVar_0x8004];

    ConvertEasyChatWordsToString(gStringVar1, s->words, 2, 1);
}

void sub_80FA5E4(void)
{
    u16 result = 0;

    if (gSaveBlock1.easyChatPairs[0].unk0_0 - gSaveBlock1.easyChatPairs[1].unk0_0 < 2)
    {
        asm("":::"r2"); //Force the compiler to store address of gSaveBlock1 in r3 instead of r2
        if (!gSaveBlock1.easyChatPairs[0].unk1_6 && gSaveBlock1.easyChatPairs[1].unk1_6)
            result = 1;
    }
    gScriptResult = result;
}

void sub_80FA648(void)
{
    gScriptResult = (gSaveBlock1.easyChatPairs[0].words[0] + gSaveBlock1.easyChatPairs[0].words[1]) & 7;
}

static bool8 sub_80FA670(struct EasyChatPair *a, struct EasyChatPair *b, u8 c)
{
    switch(c)
    {
    case 0:
        if(a->unk0_0 > b->unk0_0)
            return 1;
        if(a->unk0_0 < b->unk0_0)
            return 0;
        if(a->unk0_7 > b->unk0_7)
            return 1;
        if(a->unk0_7 < b->unk0_7)
            return 0;
        break;
    case 1:
        if(a->unk0_7 > b->unk0_7)
            return 1;
        if(a->unk0_7 < b->unk0_7)
            return 0;
        if(a->unk0_0 > b->unk0_0)
            return 1;
        if(a->unk0_0 < b->unk0_0)
            return 0;
        break;
    case 2:
        if(a->unk0_0 > b->unk0_0)
            return 1;
        if(a->unk0_0 < b->unk0_0)
            return 0;
        if(a->unk0_7 > b->unk0_7)
            return 1;
        if(a->unk0_7 < b->unk0_7)
            return 0;
        if(a->unk2 > b->unk2)
            return 1;
        if(a->unk2 < b->unk2)
            return 0;
        if(a->words[0] > b->words[0])
            return 1;
        if(a->words[0] < b->words[0])
            return 0;
        if(a->words[1] > b->words[1])
            return 1;
        if(a->words[1] < b->words[1])
            return 0;
        return 1;
    }
    return Random() & 1;
}

static void sub_80FA740(struct EasyChatPair *s)
{
    u16 r4;

    r4 = Random() % 98;
    if(r4 > 50)
    {
        r4 = Random() % 98;
        if(r4 > 80)
            r4 = Random() % 98;
    }
    s->unk0_7 = r4 + 30;
    s->unk0_0 = (Random() % (r4 + 1)) + 30;
    s->unk2 = Random();
}

static bool8 SB1ContainsWords(u16 *a)
{
    u16 i;

    for(i = 0; i < 5; i++)
    {
        if(IsEasyChatPairEqual(a, gSaveBlock1.easyChatPairs[i].words) != 0)
            return TRUE;
    }
    return FALSE;
}

static bool8 IsEasyChatPairEqual(u16 *words1, u16 *words2)
{
    u16 i;

    for(i = 0; i < 2; i++)
    {
        if(*(words1++) != *(words2++))
            return FALSE;
    }
    return TRUE;
}

static s16 sub_80FA828(struct EasyChatPair *a, u16 b)
{
    s16 i;
    struct EasyChatPair *s = ARRAY_2007900;

    for(i = 0; i < b; i++)
    {
        if(IsEasyChatPairEqual(a->words, s->words))
            return i;
        s++;
    }
    return -1;
}
