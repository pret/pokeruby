#include "global.h"
#include "cute_sketch.h"
#include "contest_painting.h"

extern u16 (*gUnknown_03005DEC)[][32];
extern u8 gUnknown_03005E00;
extern u8 gUnknown_03005DFC;
extern u8 gUnknown_03005DF8;
extern u8 gUnknown_03005DF0;
extern u8 gUnknown_03005E04;
extern u8 gUnknown_03005DF4;

extern u8 gUnknown_03005DE8;

// this file's functions
void sub_80FCAA4(void);
void sub_80FCB5C(void);
void sub_80FCD54(void);
void sub_80FCEA4(void);
void sub_80FCCBC(void);
void sub_80FD06C(void);
void sub_80FD114(void);
void sub_80FCF3C(void);
void sub_80FCAC4(void);
void sub_80FCC18(u8);
void sub_80FC92C(u8);
void sub_80FC9E4(u8);
void sub_80FD1C8(u16);
u16 sub_80FD39C(u16*);
u16 sub_80FD68C(u16*, u16*, u16*);

#if DEBUG

__attribute__((naked))
void debug_sub_8110CCC(void)
{
    asm("\
	push	{r4, r5, r6, r7, lr}\n\
	mov	r7, #0x0\n\
	mov	r1, #0x0\n\
	ldr	r2, ._5\n\
	ldr	r6, ._5 + 4\n\
._7:\n\
	lsl	r0, r1, #0x3\n\
	add	r4, r0, r2\n\
	ldrh	r0, [r6, #0x1c]\n\
	ldrh	r3, [r4, #0x4]\n\
	cmp	r0, r3\n\
	bne	._1	@cond_branch\n\
	ldrh	r0, [r4, #0x6]\n\
	bl	FlagGet\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._4	@cond_branch\n\
	ldrb	r0, [r6, #0x1f]\n\
	ldr	r1, [r4]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	bl	StringLength\n\
	mov	r1, #0xc\n\
	sub	r1, r1, r0\n\
	lsl	r1, r1, #0x10\n\
	lsr	r5, r1, #0x10\n\
	cmp	r1, #0\n\
	bge	._3	@cond_branch\n\
	mov	r5, #0x0\n\
._3:\n\
	mov	r7, #0x1\n\
	mov	r0, #0x10\n\
	mov	r1, #0xe\n\
	mov	r2, #0x1d\n\
	mov	r3, #0x13\n\
	bl	Menu_DrawStdWindowFrame\n\
	add	r0, r6, #0\n\
	add	r0, r0, #0x8\n\
	mov	r1, #0x11\n\
	mov	r2, #0xf\n\
	bl	Menu_PrintText\n\
	ldrb	r0, [r6, #0x1f]\n\
	ldr	r1, [r4]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	add	r1, r5, #0\n\
	add	r1, r1, #0x11\n\
	lsl	r1, r1, #0x18\n\
	lsr	r1, r1, #0x18\n\
	mov	r2, #0x11\n\
	bl	Menu_PrintText\n\
	b	._4\n\
._6:\n\
	.align	2, 0\n\
._5:\n\
	.word	gUnknown_083E79C0\n\
	.word	+0x2000000\n\
._1:\n\
	add	r0, r1, #1\n\
	lsl	r0, r0, #0x10\n\
	lsr	r1, r0, #0x10\n\
	cmp	r1, #0\n\
	beq	._7	@cond_branch\n\
._4:\n\
	cmp	r7, #0\n\
	bne	._8	@cond_branch\n\
	mov	r0, #0x10\n\
	mov	r1, #0x10\n\
	mov	r2, #0x1d\n\
	mov	r3, #0x13\n\
	bl	Menu_DrawStdWindowFrame\n\
	ldr	r0, ._9\n\
	mov	r1, #0x11\n\
	mov	r2, #0x11\n\
	bl	Menu_PrintText\n\
	mov	r0, #0x10\n\
	mov	r1, #0xe\n\
	mov	r2, #0x1d\n\
	mov	r3, #0xf\n\
	bl	Menu_EraseWindowRect\n\
._8:\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r0}\n\
	bx	r0\n\
._10:\n\
	.align	2, 0\n\
._9:\n\
	.word	+0x2000008");
}

__attribute__((naked))
void debug_sub_8110D84(void)
{
    asm("\
	push	{r4, lr}\n\
	add	sp, sp, #0xfffffffc\n\
	ldr	r0, ._13\n\
	ldrh	r0, [r0, #0x4]\n\
	cmp	r0, #0x7\n\
	bls	._11	@cond_branch\n\
	b	._65\n\
._11:\n\
	lsl	r0, r0, #0x2\n\
	ldr	r1, ._13 + 4\n\
	add	r0, r0, r1\n\
	ldr	r0, [r0]\n\
	mov	pc, r0\n\
._14:\n\
	.align	2, 0\n\
._13:\n\
	.word	+0x2000000\n\
	.word	._15\n\
._15:\n\
	.word	._16\n\
	.word	._17\n\
	.word	._18\n\
	.word	._19\n\
	.word	._20\n\
	.word	._21\n\
	.word	._22\n\
	.word	._23\n\
._16:\n\
	mov	r0, #0x1\n\
	neg	r0, r0\n\
	mov	r1, #0x0\n\
	str	r1, [sp]\n\
	mov	r2, #0x10\n\
	mov	r3, #0x0\n\
	bl	BeginNormalPaletteFade\n\
	ldr	r1, ._25\n\
	ldrh	r0, [r1, #0x4]\n\
	add	r0, r0, #0x1\n\
	b	._62\n\
._26:\n\
	.align	2, 0\n\
._25:\n\
	.word	+0x2000000\n\
._17:\n\
	bl	UpdatePaletteFade\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._27	@cond_branch\n\
	b	._65\n\
._27:\n\
	ldr	r1, ._30\n\
	ldrh	r0, [r1, #0x4]\n\
	add	r0, r0, #0x1\n\
	b	._62\n\
._31:\n\
	.align	2, 0\n\
._30:\n\
	.word	+0x2000000\n\
._18:\n\
	bl	sub_80FAB60\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0x3\n\
	beq	._32	@cond_branch\n\
	cmp	r0, #0x3\n\
	bgt	._33	@cond_branch\n\
	b	._65\n\
._33:\n\
	cmp	r0, #0x4\n\
	beq	._35	@cond_branch\n\
	cmp	r0, #0x5\n\
	beq	._36	@cond_branch\n\
	b	._65\n\
._35:\n\
	ldr	r4, ._41\n\
	ldrb	r0, [r4, #0x1e]\n\
	cmp	r0, #0\n\
	bne	._38	@cond_branch\n\
	b	._65\n\
._38:\n\
	mov	r0, #0x5\n\
	bl	gMysteryEventScriptCmdTableEnd+0x13c0\n\
	ldr	r1, ._41 + 4\n\
	add	r0, r4, r1\n\
	mov	r1, #0x1\n\
	strb	r1, [r0]\n\
	ldr	r0, ._41 + 8\n\
	bl	sub_80FC244\n\
	b	._65\n\
._42:\n\
	.align	2, 0\n\
._41:\n\
	.word	+0x2000000\n\
	.word	0xa6e\n\
	.word	sub_80FC69C+1\n\
._36:\n\
	mov	r0, #0x5\n\
	bl	gMysteryEventScriptCmdTableEnd+0x13c0\n\
	mov	r0, #0x1\n\
	neg	r0, r0\n\
	mov	r1, #0x0\n\
	str	r1, [sp]\n\
	mov	r2, #0x0\n\
	mov	r3, #0x10\n\
	bl	BeginNormalPaletteFade\n\
	ldr	r1, ._44\n\
	ldrh	r0, [r1, #0x4]\n\
	add	r0, r0, #0x1\n\
	b	._62\n\
._45:\n\
	.align	2, 0\n\
._44:\n\
	.word	+0x2000000\n\
._19:\n\
	bl	UpdatePaletteFade\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	bne	._65	@cond_branch\n\
	ldr	r0, ._48\n\
	bl	SetMainCallback2\n\
	b	._65\n\
._49:\n\
	.align	2, 0\n\
._48:\n\
	.word	sub_805469C+1\n\
._20:\n\
	bl	sub_80FAB60\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._50	@cond_branch\n\
._32:\n\
	bl	debug_sub_8110CCC\n\
	b	._65\n\
._50:\n\
	ldr	r0, ._54\n\
	ldrh	r1, [r0, #0x2e]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._65	@cond_branch\n\
	bl	sub_80FBCA0\n\
	bl	sub_80FAEC4\n\
	ldr	r1, ._54 + 4\n\
	ldrh	r0, [r1, #0x4]\n\
	add	r0, r0, #0x1\n\
	b	._62\n\
._55:\n\
	.align	2, 0\n\
._54:\n\
	.word	gMain\n\
	.word	+0x2000000\n\
._21:\n\
	bl	sub_80FAFC0\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	bne	._65	@cond_branch\n\
	mov	r0, #0x0\n\
	mov	r1, #0x0\n\
	bl	CreateRegionMapCursor\n\
	ldr	r1, ._58\n\
	ldrh	r0, [r1, #0x4]\n\
	add	r0, r0, #0x1\n\
	b	._62\n\
._59:\n\
	.align	2, 0\n\
._58:\n\
	.word	+0x2000000\n\
._22:\n\
	bl	sub_80FAB60\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	beq	._60	@cond_branch\n\
	bl	debug_sub_8110CCC\n\
._60:\n\
	ldr	r0, ._63\n\
	ldrh	r1, [r0, #0x2e]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._65	@cond_branch\n\
	bl	sub_80FBCA0\n\
	bl	sub_80FAEC4\n\
	ldr	r1, ._63 + 4\n\
	ldrh	r0, [r1, #0x4]\n\
	add	r0, r0, #0x1\n\
	b	._62\n\
._64:\n\
	.align	2, 0\n\
._63:\n\
	.word	gMain\n\
	.word	+0x2000000\n\
._23:\n\
	bl	sub_80FAFC0\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	bne	._65	@cond_branch\n\
	mov	r0, #0x0\n\
	mov	r1, #0x0\n\
	bl	CreateRegionMapCursor\n\
	ldr	r1, ._66\n\
	mov	r0, #0x3\n\
._62:\n\
	strh	r0, [r1, #0x4]\n\
._65:\n\
	add	sp, sp, #0x4\n\
	pop	{r4}\n\
	pop	{r0}\n\
	bx	r0\n\
._67:\n\
	.align	2, 0\n\
._66:\n\
	.word	+0x2000000");
}

__attribute__((naked))
void debug_sub_8110F28(void)
{
    asm("\
	push	{lr}\n\
	bl	CB2_InitFlyRegionMap\n\
	ldr	r0, ._69\n\
	ldr	r1, [r0, #0x4]\n\
	ldr	r0, ._69 + 4\n\
	cmp	r1, r0\n\
	bne	._68	@cond_branch\n\
	bl	sub_80FBF94\n\
	ldr	r0, ._69 + 8\n\
	bl	sub_80FC244\n\
	bl	debug_sub_8110CCC\n\
._68:\n\
	pop	{r0}\n\
	bx	r0\n\
._70:\n\
	.align	2, 0\n\
._69:\n\
	.word	gMain\n\
	.word	CB2_FlyRegionMap+1\n\
	.word	debug_sub_8110D84+1");
}

#endif

void sub_80FC7A0(struct Unk03005E20* info)
{
    gUnknown_03005DEC = info->var_4;
    gUnknown_03005E00 = info->var_1F;
    gUnknown_03005DE8 = info->var_19;
    gUnknown_03005DFC = info->var_1A;
    gUnknown_03005DF8 = info->var_1B;
    gUnknown_03005DF0 = info->var_1C;
    gUnknown_03005E04 = info->var_1D;
    gUnknown_03005DF4 = info->var_1E;
    switch (info->var_0)
    {
    case 2:
        sub_80FCAA4();
        break;
    case 8:
        sub_80FCB5C();
        break;
    case 9:
        sub_80FCD54();
        sub_80FCC18(gUnknown_03005E00);
        break;
    case 10:
        sub_80FCD54();
        sub_80FCEA4();
        sub_80FCCBC();
    case 31:
        sub_80FCEA4();
        break;
    case 11:
        sub_80FCD54();
        sub_80FD06C();
        sub_80FD06C();
        sub_80FD114();
        sub_80FCCBC();
        break;
    case 13:
        sub_80FCF3C();
        break;
    case 30:
        sub_80FCD54();
        break;
    case 32:
        sub_80FD06C();
        break;
    case 33:
        sub_80FD114();
        break;
    case 6:
        sub_80FCAC4();
        sub_80FC92C(3);
        break;
    case 36:
        sub_80FCD54();
        sub_80FD06C();
        sub_80FD114();
        sub_80FCCBC();
        sub_80FCB5C();
        sub_80FCB5C();
        sub_80FC92C(2);
        sub_80FC9E4(4);
        break;
    }
}

#define RGB2(r, g, b) (((b) << 10) | ((g) << 5) | (r))

void sub_80FC92C(u8 a0) // it changes palette someway somehow... .__.
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* pal = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, pal++)
        {
            if (!(0x8000 & *pal))
            {
                u8 val = (31 & *pal);
                val += a0;
                if (val > 31)
                    val = 31;

                *pal = RGB2(val, val, val);
            }
        }
    }
}

void sub_80FC9E4(u8 a0)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* pal = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, pal++)
        {
            if (!(0x8000 & *pal))
            {
                u8 val = (31 & *pal);
                if (val > 31 - a0)
                    val = 31 - (a0 >> 1);

                *pal = RGB2(val, val, val);
            }
        }
    }
}

void sub_80FCAA4(void)
{
    u32 i;
    for (i = 0; i < 3200; i++)
        sub_80FD1C8(i);
}

void sub_80FCAC4(void)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* pal = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, pal++)
        {
            if (!(0x8000 & *pal))
            {
                *pal = sub_80FD39C(pal);
            }
        }
    }
}
