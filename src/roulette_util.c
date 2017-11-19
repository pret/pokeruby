#include "global.h"
#include "roulette_util.h"
#include "roulette.h"

static u8 sub_81249E4(struct UnkStruct3 *);
static u8 sub_8124BEC(struct UnkStruct3 *);

extern u16 gPlttBufferFaded[];
extern u16 gPlttBufferUnfaded[];

void sub_8124918(struct UnkStruct0 *r0)
{
	r0->val0 = 0;
	r0->val2 = 0;
	memset((&r0->val3), 0, 0xC0);
}

u8 sub_812492C(struct UnkStruct0 *r0, u8 r1, struct UnkStruct1 *r2)
{
	if (!(r1 < 0x10) || (r0->val3[r1].field1))
		return 0xFF;

	r0->val3[r1].val4.val0 = r2->val0;
	r0->val3[r1].val4.val1 = r2->val1;
	r0->val3[r1].val4.val2 = r2->val2;
	r0->val3[r1].val4.val3 = r2->val3;
	r0->val3[r1].val4.val4 = r2->val4;
	r0->val3[r1].val4.field0 = r2->field0;
	r0->val3[r1].val4.field1 = r2->field1;
	r0->val3[r1].val4.field2 = r2->field2;

    //Why not r0->val3[r1].val4 = *r2; ?

	r0->val3[r1].field0 = 0x0;
	r0->val3[r1].field1 = 0x1;

	r0->val3[r1].val2 = 0x0;
	r0->val3[r1].val1 = 0x0;
	if (r0->val3[r1].val4.field2 < 0)
		r0->val3[r1].val3 = 0xFF;
	else
		r0->val3[r1].val3 = 0x1;
	return r1;
}

#ifdef NONMATCHING
u8 unref_sub_81249B0(struct UnkStruct0 *r0, u8 r1)
{
	if (!(r1 < 0x10) || (r0->val3[r1].field1))
		return 0xFF;
    r0->val3[r1] = (struct UnkStruct3){0};
	return r1;
}
#else
__attribute__((naked))
u8 unref_sub_81249B0(struct UnkStruct0 *r0 , u8 r1)
{
		asm(".syntax unified\n\
		push {r4,lr}\n\
		adds r2, r0, 0\n\
		lsls r1, 24\n\
		lsrs r1, 24\n\
		adds r4, r1, 0\n\
		cmp r4, 0xF\n\
		bhi _081249DC\n\
		lsls r0, r4, 1\n\
		adds r0, r4\n\
		lsls r0, 2\n\
		adds r1, r2, r0\n\
		ldrb r0, [r1, 0x4]\n\
		lsrs r0, 7\n\
		cmp r0, 0\n\
		beq _081249DC\n\
		adds r0, r1, 0x4\n\
		movs r1, 0\n\
		movs r2, 0xC\n\
		bl memset\n\
		adds r0, r4, 0\n\
		b _081249DE\n\
		_081249DC:\n\
		movs r0, 0xFF\n\
		_081249DE:\n\
		pop {r4}\n\
		pop {r1}\n\
		bx r1\n\
			.syntax divided\n");
}
#endif

u8 sub_81249E4(struct UnkStruct3 *r0)
{
	u8 i;
	u8 returnval;
	for (i = 0; i < r0->val4.val2; i++)
	{
		u32 offset = r0->val4.val1 + i;
		struct PlttData *faded =   (struct PlttData *)&gPlttBufferFaded[offset];
		struct PlttData *unfaded = (struct PlttData *)&gPlttBufferUnfaded[offset];
		switch(r0->field0)
		{
		case 0x1:
			if ((u32)(faded->r + r0->val3) < 0x20)
				faded->r += r0->val3;
			if ((u32)(faded->g + r0->val3) < 0x20)
				faded->g += r0->val3;
			if ((u32)(faded->b + r0->val3) < 0x20)
				faded->b += r0->val3;
		break;
		case 0x2:
			if (r0->val3 < 0)
			{
				if (!(faded->r + r0->val3 < unfaded->r))
					faded->r += r0->val3;
				if (!(faded->g + r0->val3 < unfaded->g))
					faded->g += r0->val3;
				if (!(faded->b + r0->val3 < unfaded->b))
					faded->b += r0->val3;
			}
			else
			{
				if (!(faded->r + r0->val3 > unfaded->r))
					faded->r += r0->val3;
				if (!(faded->g + r0->val3 > unfaded->g))
					faded->g += r0->val3;
				if (!(faded->b + r0->val3 > unfaded->b))
					faded->b += r0->val3;
			}
		break;
		}
	}
	if (((u32)r0->val2++) != r0->val4.field0)
	{
		returnval = 0x0;
	}
	else
	{
		r0->val2 = 0x0;
		r0->val3 = r0->val3 * -1;
		if (r0->field0 == 0x1)
			r0->field0++;
		else
			r0->field0--;
		returnval = 0x1;
	}
	return returnval;
}

u8 sub_8124BEC(struct UnkStruct3 *r0)
{
	u8 rg2 = 0;
	switch (r0->field0)
	{
		case 0x1:
		for (rg2 = 0; rg2 < r0->val4.val2; rg2++)
			gPlttBufferFaded[r0->val4.val1 + rg2] = r0->val4.val0;
		r0->field0++;
		break;
		case 0x2:
		for (rg2 = 0; rg2 < r0->val4.val2; rg2++)
			gPlttBufferFaded[r0->val4.val1 + rg2] = gPlttBufferUnfaded[r0->val4.val1 + rg2];
		r0->field0--;
		break;
	}
	return 0x1;
}

void task_tutorial_controls_fadein(struct UnkStruct0 *r0)
{
	u8 i = 0;
	if (r0->val0)
	{
		for (i = 0; i < 0x10; i++)
		{
			if ((r0->val2 >> i) & 0x1)
			{
				if (((u8)--r0->val3[i].val1) == 0xFF) // if underflow ?
				{
					if (r0->val3[i].val4.val0 & (0x80 << 8)) // PlttData->unused_15 ?
						sub_81249E4(&r0->val3[i]);
					else
						sub_8124BEC(&r0->val3[i]);
					r0->val3[i].val1 = r0->val3[i].val4.val3;
				}
			}
		}
	}
}

void sub_8124CE8(struct UnkStruct0 *r0, u16 r1)
{
	u8 i = 0;
	r0->val0++;
	for (i = 0; i < 0x10; i++)
	{
		if ((r1 >> i) & 0x1)
		{
			if (r0->val3[i].field1)
			{
				r0->val2 |= 0x1 << i;
				r0->val3[i].field0 = 0x1;
			}
		}
	}
}

void sub_8124D3C(struct UnkStruct0 *r0, u16 r1)
{
	u8 i;
	for (i = 0; i < 0x10; i++)
	{
		if ((r0->val2 >> i) & 0x1)
		{
			if (r0->val3[i].field1)
			{
				if ((r1 >> i) & 0x1)
				{
					u32 offset = r0->val3[i].val4.val1;
					u16 *faded = &gPlttBufferFaded[offset];
					u16 *unfaded = &gPlttBufferUnfaded[offset];
					memcpy(faded, unfaded, r0->val3[i].val4.val2 * 2);
					r0->val3[i].field0 = 0x0;
					r0->val3[i].val2 = 0x0;
					r0->val3[i].val1 = 0x0;
					if (r0->val3[i].val4.field2 < 0)
						r0->val3[i].val3 = 0xFF;
					else
						r0->val3[i].val3 = 0x1;
				}
			}
		}
	}
	if (r1 == 0xFFFF)
	{
		r0->val0 = 0x0;
		r0->val2 = 0x0;
	}
	else
	{
		r0->val2 = r0->val2 & ~r1;
	}
}
#ifdef NONMATCHING
void sub_8124DDC(u16 *r0, u16 r1, u8 r2, u8 r3, u8 r4, u8 r5)
{
	u16 *rg0;
	u8 c;
	u8 i = 0;
	u32 offset= r3 * 0x20 + r2;
	rg0 = &r0[offset];
	for (i = 0; i < r5; i++)
	{
		rg0 = &rg0[i * 0x20 ];
		c = 0;
		for (c = 0; c < r4; c++)
		{
			*rg0++ = r1;
		}
	}
}
#else
__attribute__((naked))
void sub_8124DDC(u16 *r0, u16 r1, u8 r2, u8 r3, u8 r4, u8 r5)
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	adds r6, r0, 0\n\
	ldr r0, [sp, 0x14]\n\
	ldr r4, [sp, 0x18]\n\
	lsls r1, 16\n\
	lsrs r7, r1, 16\n\
	lsls r2, 24\n\
	lsrs r2, 24\n\
	lsls r3, 24\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	lsls r4, 24\n\
	lsrs r4, 24\n\
	movs r1, 0\n\
	lsrs r3, 19\n\
	adds r3, r2\n\
	lsls r3, 1\n\
	adds r6, r3\n\
	cmp r1, r4\n\
	bcs _08124E26\n\
_08124E04:\n\
	lsls r0, r1, 6\n\
	adds r2, r6, r0\n\
	movs r0, 0\n\
	adds r3, r1, 0x1\n\
	cmp r0, r5\n\
	bcs _08124E1E\n\
_08124E10:\n\
	strh r7, [r2]\n\
	adds r2, 0x2\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, r5\n\
	bcc _08124E10\n\
_08124E1E:\n\
	lsls r0, r3, 24\n\
	lsrs r1, r0, 24\n\
	cmp r1, r4\n\
	bcc _08124E04\n\
_08124E26:\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.syntax divided\n");
}
#endif
#ifdef NONMATCHING
void sub_8124E2C(u16 *r0, u16 *r1, u8 r2, u8 r3, u8 r4, u8 r5)
{
	u16 *rg0;
	u8 c;
	u8 i = 0;
	u32 offset= r3 * 0x20 + r2;
	//rg0 = &r0[offset];
	for (i = 0; i < r5; i++)
	{
		rg0 = &r0[offset + i * 0x20 ];
		c = 0;
		for (c = 0; c < r4; c++)
		{
			*(rg0++) = *(r1++);
		}
	}
}
#else
__attribute__((naked))
void sub_8124E2C(u16 *r0, u16 *r1, u8 r2, u8 r3, u8 r4, u8 r5)
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	adds r7, r0, 0\n\
	ldr r0, [sp, 0x14]\n\
	ldr r4, [sp, 0x18]\n\
	lsls r2, 24\n\
	lsrs r2, 24\n\
	lsls r3, 24\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	lsls r4, 24\n\
	lsrs r6, r4, 24\n\
	movs r4, 0\n\
	lsrs r3, 19\n\
	adds r3, r2\n\
	lsls r3, 1\n\
	adds r7, r3\n\
	cmp r4, r6\n\
	bcs _08124E76\n\
	_08124E50:\n\
	lsls r0, r4, 6\n\
	adds r2, r7, r0\n\
	movs r3, 0\n\
	adds r4, 0x1\n\
	cmp r3, r5\n\
	bcs _08124E6E\n\
	_08124E5C:\n\
	ldrh r0, [r1]\n\
	strh r0, [r2]\n\
	adds r1, 0x2\n\
	adds r2, 0x2\n\
	adds r0, r3, 0x1\n\
	lsls r0, 24\n\
	lsrs r3, r0, 24\n\
	cmp r3, r5\n\
	bcc _08124E5C\n\
	_08124E6E:\n\
	lsls r0, r4, 24\n\
	lsrs r4, r0, 24\n\
	cmp r4, r6\n\
	bcc _08124E50\n\
	_08124E76:\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.syntax divided\n");
}
#endif
