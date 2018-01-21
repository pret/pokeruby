#if DEBUG
#include "global.h"
#include "menu.h"

u8 KagayaDebugMenu_TrainerCard();
u8 KagayaDebugMenu_CardToExchange();
u8 KagayaDebugMenu_SlotMachine();

const u8 Str_83EBB34[] = _("Trainer’s card");
const u8 Str_83EBB43[] = _("Card to exchange");
const u8 Str_83EBB54[] = _("Slot machine");

const struct MenuAction _83EBB64[] = {
	{ Str_83EBB34, KagayaDebugMenu_TrainerCard },
	{ Str_83EBB43, KagayaDebugMenu_CardToExchange },
	{ Str_83EBB54, KagayaDebugMenu_SlotMachine },
};

__attribute__((naked))
void InitKagayaDebugMenu_A()
{
    asm(
        "	push	{lr}\n"
        "	bl	InitKagayaDebugMenu_B\n"
        "	mov	r0, #0x0\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void InitKagayaDebugMenu_B()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xfffffff8\n"
        "	bl	Menu_EraseScreen\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x0\n"
        "	mov	r2, #0xe\n"
        "	mov	r3, #0x7\n"
        "	bl	Menu_DrawStdWindowFrame\n"
        "	ldr	r3, ._1\n"
        "	mov	r0, #0x2\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x3\n"
        "	bl	Menu_PrintItems\n"
        "	mov	r0, #0x0\n"
        "	str	r0, [sp]\n"
        "	mov	r0, #0xd\n"
        "	str	r0, [sp, #0x4]\n"
        "	mov	r0, #0x0\n"
        "	mov	r1, #0x1\n"
        "	mov	r2, #0x1\n"
        "	mov	r3, #0x3\n"
        "	bl	InitMenu\n"
        "	ldr	r1, ._1 + 4\n"
        "	ldr	r0, ._1 + 8\n"
        "	str	r0, [r1]\n"
        "	add	sp, sp, #0x8\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "._2:\n"
        "	.align	2, 0\n"
        "._1:\n"
        "	.word	_83EBB64\n"
        "	.word	gMenuCallback\n"
        "	.word	debug_sub_80B061C+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80B061C()
{
    asm(
        "	push	{lr}\n"
        "	bl	Menu_ProcessInput\n"
        "	lsl	r0, r0, #0x18\n"
        "	asr	r1, r0, #0x18\n"
        "	mov	r0, #0x2\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	bne	._3	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._6\n"
        "._3:\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	cmp	r1, r0\n"
        "	beq	._5	@cond_branch\n"
        "	ldr	r2, ._7\n"
        "	ldr	r0, ._7 + 4\n"
        "	lsl	r1, r1, #0x3\n"
        "	add	r0, r0, #0x4\n"
        "	add	r1, r1, r0\n"
        "	ldr	r0, [r1]\n"
        "	str	r0, [r2]\n"
        "	mov	r0, #0x0\n"
        "	b	._6\n"
        "._8:\n"
        "	.align	2, 0\n"
        "._7:\n"
        "	.word	gMenuCallback\n"
        "	.word	_83EBB64\n"
        "._5:\n"
        "	bl	CloseMenu\n"
        "	mov	r0, #0x1\n"
        "._6:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
u8 KagayaDebugMenu_TrainerCard()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [sp]\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x10\n"
        "	bl	BeginNormalPaletteFade\n"
        "	ldr	r1, ._9\n"
        "	ldr	r0, ._9 + 4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._10:\n"
        "	.align	2, 0\n"
        "._9:\n"
        "	.word	gMenuCallback\n"
        "	.word	debug_sub_80B068C+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80B068C()
{
    asm(
        "	push	{lr}\n"
        "	bl	UpdatePaletteFade\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._11	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._12\n"
        "._11:\n"
        "	ldr	r0, ._13\n"
        "	bl	debug_sub_80A0710\n"
        "	bl	CloseMenu\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "._12:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._14:\n"
        "	.align	2, 0\n"
        "._13:\n"
        "	.word	sub_805469C+1\n"
        "\n"
    );
}

__attribute__((naked))
u8 KagayaDebugMenu_CardToExchange()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [sp]\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x10\n"
        "	bl	BeginNormalPaletteFade\n"
        "	ldr	r1, ._15\n"
        "	ldr	r0, ._15 + 4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._16:\n"
        "	.align	2, 0\n"
        "._15:\n"
        "	.word	gMenuCallback\n"
        "	.word	debug_sub_80B06E0+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80B06E0()
{
    asm(
        "	push	{lr}\n"
        "	bl	UpdatePaletteFade\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._17	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._18\n"
        "._17:\n"
        "	ldr	r0, ._19\n"
        "	bl	debug_sub_80A073C\n"
        "	bl	CloseMenu\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "._18:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._20:\n"
        "	.align	2, 0\n"
        "._19:\n"
        "	.word	sub_805469C+1\n"
        "\n"
    );
}

__attribute__((naked))
u8 KagayaDebugMenu_SlotMachine()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [sp]\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x10\n"
        "	bl	BeginNormalPaletteFade\n"
        "	ldr	r1, ._21\n"
        "	ldr	r0, ._21 + 4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._22:\n"
        "	.align	2, 0\n"
        "._21:\n"
        "	.word	gMenuCallback\n"
        "	.word	Kagaya_80B0734+1\n"
        "\n"
    );
}

__attribute__((naked))
void Kagaya_80B0734()
{
    asm(
        "	push	{lr}\n"
        "	bl	UpdatePaletteFade\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._23	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._24\n"
        "._23:\n"
        "	bl	Random\n"
        "	lsl	r0, r0, #0x10\n"
        "	lsr	r0, r0, #0x10\n"
        "	mov	r1, #0x6\n"
        "	bl	__umodsi3\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	ldr	r1, ._25\n"
        "	bl	debug_sub_811609C\n"
        "	bl	CloseMenu\n"
        "	bl	ScriptContext2_Enable\n"
        "	mov	r0, #0x1\n"
        "._24:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._26:\n"
        "	.align	2, 0\n"
        "._25:\n"
        "	.word	sub_805469C+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80B0770()
{
    asm(
        "	push	{r4, lr}\n"
        "	ldr	r0, ._30\n"
        "	ldrb	r1, [r0]\n"
        "	mov	r0, #0x8\n"
        "	and	r0, r0, r1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	cmp	r4, #0\n"
        "	bne	._27	@cond_branch\n"
        "	bl	CloseMenu\n"
        "	bl	IsPlayerFacingSurfableFishableWater\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._29	@cond_branch\n"
        "	ldr	r0, ._30 + 4\n"
        "	str	r4, [r0]\n"
        "	mov	r0, #0x9\n"
        "	bl	FieldEffectStart\n"
        "	b	._29\n"
        "._31:\n"
        "	.align	2, 0\n"
        "._30:\n"
        "	.word	gPlayerAvatar\n"
        "	.word	gFieldEffectArguments\n"
        "._27:\n"
        "	bl	CloseMenu\n"
        "._29:\n"
        "	mov	r0, #0x1\n"
        "	pop	{r4}\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80B07B0()
{
    asm(
        "	push	{lr}\n"
        "	add	sp, sp, #0xfffffffc\n"
        "	mov	r0, #0x1\n"
        "	neg	r0, r0\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [sp]\n"
        "	mov	r2, #0x0\n"
        "	mov	r3, #0x10\n"
        "	bl	BeginNormalPaletteFade\n"
        "	ldr	r1, ._32\n"
        "	ldr	r0, ._32 + 4\n"
        "	str	r0, [r1]\n"
        "	mov	r0, #0x0\n"
        "	add	sp, sp, #0x4\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._33:\n"
        "	.align	2, 0\n"
        "._32:\n"
        "	.word	gMenuCallback\n"
        "	.word	debug_sub_80B07DC+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80B07DC()
{
    asm(
        "	push	{lr}\n"
        "	bl	UpdatePaletteFade\n"
        "	lsl	r0, r0, #0x18\n"
        "	cmp	r0, #0\n"
        "	beq	._34	@cond_branch\n"
        "	mov	r0, #0x0\n"
        "	b	._35\n"
        "._34:\n"
        "	bl	CloseMenu\n"
        "	ldr	r0, ._36\n"
        "	bl	SetMainCallback2\n"
        "	mov	r0, #0x1\n"
        "._35:\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._37:\n"
        "	.align	2, 0\n"
        "._36:\n"
        "	.word	CB2_InitFlyRegionMap+1\n"
        "\n"
    );
}

__attribute__((naked))
void debug_sub_80B0800()
{
    asm(
        "	push	{lr}\n"
        "	bl	CloseMenu\n"
        "	bl	sub_8068F18\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r2, r0, #0x18\n"
        "	cmp	r2, #0\n"
        "	beq	._38	@cond_branch\n"
        "	ldr	r0, ._39\n"
        "	mov	r1, #0x0\n"
        "	str	r1, [r0]\n"
        "	sub	r1, r2, #1\n"
        "	str	r1, [r0, #0x4]\n"
        "	mov	r0, #0x2c\n"
        "	bl	FieldEffectStart\n"
        "._38:\n"
        "	mov	r0, #0x1\n"
        "	pop	{r1}\n"
        "	bx	r1\n"
        "._40:\n"
        "	.align	2, 0\n"
        "._39:\n"
        "	.word	gFieldEffectArguments\n"
        "\n"
    );
}

#endif // DEBUG
