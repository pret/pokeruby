#include "global.h"
#include "roulette_util.h"
#include "roulette.h"

static u8 sub_81249E4(struct UnkStruct3 *);
static u8 sub_8124BEC(struct UnkStruct3 *);
u8 unref_sub_81249B0(struct UnkStruct0 *, u8);

extern u16 gPlttBufferFaded[];
extern u16 gPlttBufferUnfaded[];

void sub_8124918(struct UnkStruct0 *r0)
{
    r0->var00 = 0;
    r0->var02 = 0;
    memset(&r0->var04, 0, sizeof(r0->var04));
}

u8 sub_812492C(struct UnkStruct0 *r0, u8 r1, struct UnkStruct1 *r2)
{
    if (!(r1 < 16) || (r0->var04[r1].var00_7))
        return 0xFF;

    r0->var04[r1].var04.var00 = r2->var00;
    r0->var04[r1].var04.var02 = r2->var02;
    r0->var04[r1].var04.var04 = r2->var04;
    r0->var04[r1].var04.var05 = r2->var05;
    r0->var04[r1].var04.var06 = r2->var06;
    r0->var04[r1].var04.var07_0 = r2->var07_0;
    r0->var04[r1].var04.var07_5 = r2->var07_5;
    r0->var04[r1].var04.var07_7 = r2->var07_7;
    r0->var04[r1].var00_0 = 0;
    r0->var04[r1].var00_7 = 1;
    r0->var04[r1].var02 = 0;
    r0->var04[r1].var01 = 0;
    if (r0->var04[r1].var04.var07_7 < 0)
        r0->var04[r1].var03 = 0xFF;
    else
        r0->var04[r1].var03 = 1;
    return r1;
}

u8 unref_sub_81249B0(struct UnkStruct0 *r0, u8 r1)
{
    if (r1 >= 16)
        return 0xFF;
    if (!r0->var04[r1].var00_7)
        return 0xFF;
    memset(&r0->var04[r1], 0, sizeof(r0->var04[r1]));
    return r1;
}

u8 sub_81249E4(struct UnkStruct3 *r0)
{
    u8 i;
    u8 returnval;

    for (i = 0; i < r0->var04.var04; i++)
    {
        struct PlttData *faded =   (struct PlttData *)&gPlttBufferFaded[r0->var04.var02 + i];
        struct PlttData *unfaded = (struct PlttData *)&gPlttBufferUnfaded[r0->var04.var02 + i];

        switch (r0->var00_0)
        {
        case 1:
            if (faded->r + r0->var03 >= 0 && faded->r + r0->var03 < 32)
                faded->r += r0->var03;
            if (faded->g + r0->var03 >= 0 && faded->g + r0->var03 < 32)
                faded->g += r0->var03;
            if (faded->b + r0->var03 >= 0 && faded->b + r0->var03 < 32)
                faded->b += r0->var03;
            break;
        case 2:
            if (r0->var03 < 0)
            {
                if (faded->r + r0->var03 >= unfaded->r)
                    faded->r += r0->var03;
                if (faded->g + r0->var03 >= unfaded->g)
                    faded->g += r0->var03;
                if (faded->b + r0->var03 >= unfaded->b)
                    faded->b += r0->var03;
            }
            else
            {
                if (faded->r + r0->var03 <= unfaded->r)
                    faded->r += r0->var03;
                if (faded->g + r0->var03 <= unfaded->g)
                    faded->g += r0->var03;
                if (faded->b + r0->var03 <= unfaded->b)
                    faded->b += r0->var03;
            }
            break;
        }
    }
    if ((u32)r0->var02++ != r0->var04.var07_0)
    {
        returnval = 0;
    }
    else
    {
        r0->var02 = 0;
        r0->var03 *= -1;
        if (r0->var00_0 == 1)
            r0->var00_0++;
        else
            r0->var00_0--;
        returnval = 1;
    }
    return returnval;
}

u8 sub_8124BEC(struct UnkStruct3 *r0)
{
    u8 rg2 = 0;

    switch (r0->var00_0)
    {
    case 1:
        for (rg2 = 0; rg2 < r0->var04.var04; rg2++)
            gPlttBufferFaded[r0->var04.var02 + rg2] = r0->var04.var00;
        r0->var00_0++;
        break;
    case 2:
        for (rg2 = 0; rg2 < r0->var04.var04; rg2++)
            gPlttBufferFaded[r0->var04.var02 + rg2] = gPlttBufferUnfaded[r0->var04.var02 + rg2];
        r0->var00_0--;
        break;
    }
    return 1;
}

void task_tutorial_controls_fadein(struct UnkStruct0 *r0)
{
    u8 i = 0;

    if (r0->var00)
    {
        for (i = 0; i < 16; i++)
        {
            if ((r0->var02 >> i) & 1)
            {
                if (--r0->var04[i].var01 == 0xFF) // if underflow ?
                {
                    if (r0->var04[i].var04.var00 & 0x8000) // PlttData->unused_15 ?
                        sub_81249E4(&r0->var04[i]);
                    else
                        sub_8124BEC(&r0->var04[i]);
                    r0->var04[i].var01 = r0->var04[i].var04.var05;
                }
            }
        }
    }
}

void sub_8124CE8(struct UnkStruct0 *r0, u16 r1)
{
    u8 i = 0;

    r0->var00++;
    for (i = 0; i < 16; i++)
    {
        if ((r1 >> i) & 1)
        {
            if (r0->var04[i].var00_7)
            {
                r0->var02 |= 1 << i;
                r0->var04[i].var00_0 = 1;
            }
        }
    }
}

void sub_8124D3C(struct UnkStruct0 *r0, u16 r1)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if ((r0->var02 >> i) & 1)
        {
            if (r0->var04[i].var00_7)
            {
                if ((r1 >> i) & 1)
                {
                    u32 offset = r0->var04[i].var04.var02;
                    u16 *faded = &gPlttBufferFaded[offset];
                    u16 *unfaded = &gPlttBufferUnfaded[offset];
                    memcpy(faded, unfaded, r0->var04[i].var04.var04 * 2);
                    r0->var04[i].var00_0 = 0;
                    r0->var04[i].var02 = 0;
                    r0->var04[i].var01 = 0;
                    if (r0->var04[i].var04.var07_7 < 0)
                        r0->var04[i].var03 = 0xFF;
                    else
                        r0->var04[i].var03 = 0x1;
                }
            }
        }
    }
    if (r1 == 0xFFFF)
    {
        r0->var00 = 0;
        r0->var02 = 0;
    }
    else
    {
        r0->var02 = r0->var02 & ~r1;
    }
}
void sub_8124DDC(u16 *dest, u16 src, u8 left, u8 top, u8 width, u8 height)
{
    u16 *_dest;
    u8 i;
    u8 j;
    i = 0;
    dest = &dest[top * 32 + left];
    for (; i < height; i++)
    {
        _dest = dest + i * 32;
        for (j = 0; j < width; j++)
        {
            *_dest++ = src;
        }
    }
}
void sub_8124E2C(u16 *dest, u16 *src, u8 left, u8 top, u8 width, u8 height)
{
    u16 *_dest;
    u16 *_src = src;
    u8 i;
    u8 j;
    i = 0;
    dest = &dest[top * 32 + left];
    for (; i < height; i++)
    {
        _dest = dest + i * 32;
        for (j = 0; j < width; j++)
        {
            *_dest++ = *_src++;
        }
    }
}
