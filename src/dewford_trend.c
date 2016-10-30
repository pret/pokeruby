#include "global.h"
#include "link.h"
#include "rng.h"


extern u8 GetLinkPlayerCount(void);
extern u16 sub_80EB72C(u16);
extern u8 ConvertEasyChatWordsToString(u8 *dst, u16 *words, u16, u16);
extern u8 FlagGet(u16);
extern u8 FlagSet(u16);

extern struct EasyChatPair unk_2007800[5];
extern struct EasyChatPair unk_2007900[5];
extern u16 gScriptResult;
extern u16 gUnknown_0202E8CC;

void sub_80FA740(struct EasyChatPair *);
void sub_80FA46C(struct EasyChatPair *, u16, u8);
bool8 sub_80FA670(struct EasyChatPair *, struct EasyChatPair *, u8);
bool8 IsEasyChatPairEqual(u16 *, u16 *);
bool8 SB1ContainsWords(u16 *);

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
        if(!FlagGet(0x833))
        {
            FlagSet(0x833);
            if(!FlagGet(0x834))
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

void sub_80FA46C(struct EasyChatPair *s, u16 b, u8 c)
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

#ifdef NONMATCHING
void sub_80FA4E4(u8 *a, u32 b)
{
    u16 i;
    u16 j;
    u16 r7;
    struct EasyChatPair *src;
    struct EasyChatPair *dst;
    u16 players = GetLinkPlayerCount();
    
    for(i = 0; i < players; i++)
        memcpy(&unk_2007800[i * 5], a + i * b, 40);
    
    //_080FA520
    
    src = unk_2007800;
    //dst = unk_2007900
    dst = (u8 *)src + 0x100;   //ToDo: Get this part to match
    
    r7 = 0;
    //_080FA530
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
            //_080FA558
            else
            {
                if(unk_2007900[foo].unk0_0 < src->unk0_0)
                {
                    unk_2007900[foo] = *src;
                }
            }
            //_080FA572
            src++;
        }
    }
    //_080FA588
    sub_80FA46C(unk_2007900, r7, 2);
    src = unk_2007900;
    dst = gSaveBlock1.easyChatPairs;
    for(i = 0; i < 5; i++)
        *(dst++) = *(src++);
}
#else
__attribute__((naked))
void sub_80FA4E4(u8 *a, u32 b)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r8\n\
	push {r7}\n\
	sub sp, 0x4\n\
	adds r6, r0, 0\n\
	adds r5, r1, 0\n\
	bl GetLinkPlayerCount\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	movs r4, 0\n\
	cmp r4, r8\n\
	bcs _080FA520\n\
_080FA500:\n\
	lsls r0, r4, 2\n\
	adds r0, r4\n\
	lsls r0, 3\n\
	ldr r1, _080FA554 @ =0x02007800\n\
	adds r0, r1\n\
	adds r1, r4, 0\n\
	muls r1, r5\n\
	adds r1, r6, r1\n\
	movs r2, 0x28\n\
	bl memcpy\n\
	adds r0, r4, 0x1\n\
	lsls r0, 16\n\
	lsrs r4, r0, 16\n\
	cmp r4, r8\n\
	bcc _080FA500\n\
_080FA520:\n\
	ldr r5, _080FA554 @ =0x02007800\n\
	movs r0, 0x80\n\
	lsls r0, 1\n\
	adds r3, r5, r0\n\
	movs r7, 0\n\
	movs r4, 0\n\
	cmp r4, r8\n\
	bcs _080FA588\n\
_080FA530:\n\
	movs r6, 0\n\
_080FA532:\n\
	adds r0, r5, 0\n\
	adds r1, r7, 0\n\
	str r3, [sp]\n\
	bl sub_80FA828\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	ldr r3, [sp]\n\
	cmp r0, 0\n\
	bge _080FA558\n\
	ldr r0, [r5]\n\
	ldr r1, [r5, 0x4]\n\
	stm r3!, {r0,r1}\n\
	adds r0, r7, 0x1\n\
	lsls r0, 16\n\
	lsrs r7, r0, 16\n\
	b _080FA572\n\
	.align 2, 0\n\
_080FA554: .4byte 0x02007800\n\
_080FA558:\n\
	lsls r1, r0, 3\n\
	ldr r0, _080FA5B4 @ =0x02007900\n\
	adds r2, r1, r0\n\
	ldrb r1, [r2]\n\
	lsls r1, 25\n\
	ldrb r0, [r5]\n\
	lsls r0, 25\n\
	cmp r1, r0\n\
	bcs _080FA572\n\
	ldr r0, [r5]\n\
	ldr r1, [r5, 0x4]\n\
	str r0, [r2]\n\
	str r1, [r2, 0x4]\n\
_080FA572:\n\
	adds r5, 0x8\n\
	adds r0, r6, 0x1\n\
	lsls r0, 16\n\
	lsrs r6, r0, 16\n\
	cmp r6, 0x4\n\
	bls _080FA532\n\
	adds r0, r4, 0x1\n\
	lsls r0, 16\n\
	lsrs r4, r0, 16\n\
	cmp r4, r8\n\
	bcc _080FA530\n\
_080FA588:\n\
	ldr r4, _080FA5B4 @ =0x02007900\n\
	adds r0, r4, 0\n\
	adds r1, r7, 0\n\
	movs r2, 0x2\n\
	bl sub_80FA46C\n\
	adds r5, r4, 0\n\
	ldr r3, _080FA5B8 @ =gSaveBlock1 + 0x2DD4\n\
	movs r4, 0\n\
_080FA59A:\n\
	ldm r5!, {r0,r1}\n\
	stm r3!, {r0,r1}\n\
	adds r0, r4, 0x1\n\
	lsls r0, 16\n\
	lsrs r4, r0, 16\n\
	cmp r4, 0x4\n\
	bls _080FA59A\n\
	add sp, 0x4\n\
	pop {r3}\n\
	mov r8, r3\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080FA5B4: .4byte 0x02007900\n\
_080FA5B8: .4byte gSaveBlock1 + 0x2DD4\n\
    .syntax divided\n");
}
#endif

void sub_80FA5BC(void)
{
    struct EasyChatPair *s = &gSaveBlock1.easyChatPairs[gUnknown_0202E8CC];
    
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

bool8 sub_80FA670(struct EasyChatPair *a, struct EasyChatPair *b, u8 c)
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

void sub_80FA740(struct EasyChatPair *s)
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

bool8 SB1ContainsWords(u16 *a)
{
    u16 i;
    
    for(i = 0; i < 5; i++)
    {
        if(IsEasyChatPairEqual(a, gSaveBlock1.easyChatPairs[i].words) != 0)
            return TRUE;
    }
    return FALSE;
}

bool8 IsEasyChatPairEqual(u16 *words1, u16 *words2)
{
    u16 i;
    
    for(i = 0; i < 2; i++)
    {
        if(*(words1++) != *(words2++))
            return FALSE;
    }
    return TRUE;
}

s16 sub_80FA828(struct EasyChatPair *a, u16 b)
{
    s16 i;
    struct EasyChatPair *s = unk_2007900;
    
    for(i = 0; i < b; i++)
    {
        if(IsEasyChatPairEqual(a->words, s->words))
            return i;
        s++;
    }
    return -1;
}
