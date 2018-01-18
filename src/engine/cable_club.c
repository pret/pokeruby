#include "global.h"
#include "battle.h"
#include "battle_records.h"
#include "cable_club.h"
#include "field_message_box.h"
#include "field_weather.h"
#include "link.h"
#include "load_save.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "record_mixing.h"
#include "overworld.h"
#include "script.h"
#include "script_pokemon_80C4.h"
#include "constants/songs.h"
#include "sound.h"
#include "start_menu.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "trainer_card.h"

extern u16 gSpecialVar_Result;
extern struct TrainerCard gTrainerCards[4];
extern u8 gUnknown_03004860;
extern u8 gFieldLinkPlayerCount;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;
extern u16 gBattleTypeFlags;
extern const u8 gUnknown_081A4932[];
extern const u8 gUnknown_081A4975[];
extern const u8 gUnknown_081A49B6[];
extern const u8 gUnknown_081A490C[];
extern struct
{
    u8 field0;
    u8 field1;
} gUnknown_020297D8;

/*static*/ void sub_8082F20(u8 taskId);
static void sub_8082F68(u8 taskId);
static void sub_8082FEC(u8 taskId);
static void sub_808303C(u8 taskId);
static void sub_80830E4(u8 taskId);
static void sub_8083188(u8 taskId);
static void sub_8083288(u8 taskId);
static void sub_8083314(u8 taskId);
static void sub_80833C4(u8 taskId);
static void sub_80833EC(u8 taskId);
static void sub_8083418(u8 taskId);
static bool8 sub_8083444(u8 taskId);
static void sub_808353C(u8 taskId);
static void sub_8083710(u8 taskId);
static void sub_8083760(u8 taskId);
static void sub_80837B4(u8 taskId);
static void sub_80837EC(u8 taskId);
static void sub_808382C(u8 taskId);
static void sub_8083958(void);
static void sub_80839DC(u8 taskId);
static void sub_8083AAC(u8 taskId);
static void sub_8083B44(u8 taskId);
static void sub_8083B6C(void);
static void sub_8083CA4(u8 taskId);

extern void sub_80831F8(u8 taskId);
extern void Overworld_ResetMapMusic(void);
extern void sub_810FEFC(void);
extern void sub_8047CD8(void);
extern void sub_805559C(void);
extern void sub_8055574(void);
extern s32 sub_80554F8(void);
extern void sub_805465C(void);

#ifdef GERMAN
const u8 TrainerCardColorName_Bronze[] = _("BRONZE");
const u8 TrainerCardColorName_Copper[] = _("KUPFER");
const u8 TrainerCardColorName_Silver[] = _("SILBER");
const u8 TrainerCardColorName_Gold[] = _("GOLD");
#else
const u8 TrainerCardColorName_Bronze[] = _("BRONZE");
const u8 TrainerCardColorName_Copper[] = _("COPPER");
const u8 TrainerCardColorName_Silver[] = _("SILVER");
const u8 TrainerCardColorName_Gold[] = _("GOLD");
#endif

const u8 *const gTrainerCardColorNames[] =
{
    TrainerCardColorName_Bronze,
    TrainerCardColorName_Copper,
    TrainerCardColorName_Silver,
    TrainerCardColorName_Gold,
};

#if DEBUG

__attribute__((naked))
int debug_sub_808A4D0()
{
    asm("\
	push	{lr}\n\
	add	r1, r0, #0\n\
	ldr	r0, ._3\n\
	cmp	r1, r0\n\
	bne	._1	@cond_branch\n\
	mov	r0, #0x1\n\
	b	._30\n\
._4:\n\
	.align	2, 0\n\
._3:\n\
	.word	sub_8082F68+1\n\
._1:\n\
	ldr	r0, ._7\n\
	cmp	r1, r0\n\
	bne	._5	@cond_branch\n\
	mov	r0, #0x11\n\
	b	._30\n\
._8:\n\
	.align	2, 0\n\
._7:\n\
	.word	sub_8082FEC+1\n\
._5:\n\
	ldr	r0, ._11\n\
	cmp	r1, r0\n\
	bne	._9	@cond_branch\n\
	mov	r0, #0x12\n\
	b	._30\n\
._12:\n\
	.align	2, 0\n\
._11:\n\
	.word	sub_808303C+1\n\
._9:\n\
	ldr	r0, ._15\n\
	cmp	r1, r0\n\
	bne	._13	@cond_branch\n\
	mov	r0, #0x13\n\
	b	._30\n\
._16:\n\
	.align	2, 0\n\
._15:\n\
	.word	sub_8083188+1\n\
._13:\n\
	ldr	r0, ._19\n\
	cmp	r1, r0\n\
	bne	._17	@cond_branch\n\
	mov	r0, #0x14\n\
	b	._30\n\
._20:\n\
	.align	2, 0\n\
._19:\n\
	.word	sub_80830E4+1\n\
._17:\n\
	ldr	r0, ._23\n\
	cmp	r1, r0\n\
	bne	._21	@cond_branch\n\
	mov	r0, #0x21\n\
	b	._30\n\
._24:\n\
	.align	2, 0\n\
._23:\n\
	.word	sub_80831F8+1\n\
._21:\n\
	ldr	r0, ._27\n\
	cmp	r1, r0\n\
	bne	._25	@cond_branch\n\
	mov	r0, #0x2\n\
	b	._30\n\
._28:\n\
	.align	2, 0\n\
._27:\n\
	.word	sub_8083314+1\n\
._25:\n\
	ldr	r0, ._31\n\
	cmp	r1, r0\n\
	beq	._29	@cond_branch\n\
	mov	r0, #0x0\n\
	b	._30\n\
._32:\n\
	.align	2, 0\n\
._31:\n\
	.word	sub_80833C4+1\n\
._29:\n\
	mov	r0, #0x3\n\
._30:\n\
	pop	{r1}\n\
	bx	r1");
}

__attribute__((naked))
void debug_sub_808A55C()
{
    asm("\
	push	{r4, r5, r6, r7, lr}\n\
	mov	r7, r8\n\
	push	{r7}\n\
	lsl	r0, r0, #0x18\n\
	lsr	r7, r0, #0x18\n\
	ldr	r2, ._37\n\
	lsl	r0, r7, #0x2\n\
	add	r0, r0, r7\n\
	lsl	r0, r0, #0x3\n\
	add	r4, r0, r2\n\
	mov	r0, #0x8\n\
	ldsh	r1, [r4, r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r0, r0, #0x3\n\
	add	r0, r0, r2\n\
	ldrb	r0, [r0, #0x4]\n\
	cmp	r0, #0\n\
	bne	._33	@cond_branch\n\
	mov	r1, #0xa\n\
	ldsh	r0, [r4, r1]\n\
	cmp	r0, #0x5\n\
	bne	._34	@cond_branch\n\
	add	r0, r7, #0\n\
	bl	DestroyTask\n\
._34:\n\
	ldrh	r0, [r4, #0xa]\n\
	add	r0, r0, #0x1\n\
	strh	r0, [r4, #0xa]\n\
._33:\n\
	ldr	r0, ._37 + 4\n\
	ldrb	r0, [r0]\n\
	mov	r1, #0x2\n\
	mov	r2, #0x0\n\
	mov	r3, #0x2\n\
	bl	PrintHex\n\
	ldr	r0, ._37 + 8\n\
	ldrb	r0, [r0]\n\
	mov	r1, #0x16\n\
	mov	r2, #0x5\n\
	mov	r3, #0x4\n\
	bl	PrintHex\n\
	mov	r4, #0x0\n\
	lsl	r3, r7, #0x2\n\
	mov	r8, r3\n\
	mov	r6, #0xc0\n\
	lsl	r6, r6, #0x13\n\
	mov	r5, #0xa0\n\
	lsl	r5, r5, #0x13\n\
._35:\n\
	ldr	r0, ._37 + 12\n\
	add	r0, r4, r0\n\
	ldrb	r0, [r0]\n\
	lsr	r1, r5, #0x18\n\
	mov	r2, #0x0\n\
	mov	r3, #0x1\n\
	bl	PrintHex\n\
	ldr	r1, ._37 + 16\n\
	lsl	r0, r4, #0x8\n\
	add	r0, r0, r1\n\
	ldrh	r0, [r0]\n\
	lsr	r2, r6, #0x18\n\
	mov	r1, #0x16\n\
	mov	r3, #0x4\n\
	bl	PrintHex\n\
	mov	r0, #0x80\n\
	lsl	r0, r0, #0x11\n\
	add	r6, r6, r0\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x12\n\
	add	r5, r5, r1\n\
	add	r4, r4, #0x1\n\
	cmp	r4, #0x3\n\
	ble	._35	@cond_branch\n\
	ldr	r4, ._37 + 20\n\
	ldr	r0, [r4]\n\
	mov	r1, #0xf\n\
	mov	r2, #0x0\n\
	mov	r3, #0x8\n\
	bl	PrintHex\n\
	ldr	r0, ._37 + 24\n\
	ldrb	r0, [r0, #0x1]\n\
	mov	r1, #0x2\n\
	mov	r2, #0xa\n\
	mov	r3, #0x2\n\
	bl	PrintHex\n\
	bl	GetMultiplayerId\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r1, #0x7\n\
	mov	r2, #0xc\n\
	mov	r3, #0x2\n\
	bl	PrintHex\n\
	bl	GetBlockReceivedStatus\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r1, #0x7\n\
	mov	r2, #0xa\n\
	mov	r3, #0x2\n\
	bl	PrintHex\n\
	ldr	r0, ._37 + 28\n\
	ldrb	r0, [r0]\n\
	mov	r1, #0x2\n\
	mov	r2, #0xc\n\
	mov	r3, #0x1\n\
	bl	PrintHex\n\
	ldr	r0, ._37 + 32\n\
	ldrh	r0, [r0]\n\
	mov	r1, #0xb\n\
	mov	r2, #0x8\n\
	mov	r3, #0x2\n\
	bl	PrintHex\n\
	ldr	r0, [r4]\n\
	mov	r1, #0x1c\n\
	and	r0, r0, r1\n\
	lsr	r0, r0, #0x2\n\
	mov	r1, #0xb\n\
	mov	r2, #0xa\n\
	mov	r3, #0x2\n\
	bl	PrintHex\n\
	bl	IsLinkConnectionEstablished\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r1, #0xb\n\
	mov	r2, #0xc\n\
	mov	r3, #0x1\n\
	bl	PrintHex\n\
	bl	sub_8007ECC\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r1, #0xf\n\
	mov	r2, #0xa\n\
	mov	r3, #0x1\n\
	bl	PrintHex\n\
	ldr	r2, ._37\n\
	mov	r3, r8\n\
	add	r0, r3, r7\n\
	lsl	r0, r0, #0x3\n\
	add	r0, r0, r2\n\
	mov	r3, #0x8\n\
	ldsh	r1, [r0, r3]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r0, r0, #0x3\n\
	add	r0, r0, r2\n\
	ldr	r0, [r0]\n\
	bl	debug_sub_808A4D0\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r1, #0xf\n\
	mov	r2, #0xc\n\
	mov	r3, #0x2\n\
	bl	PrintHex\n\
	ldr	r0, ._37 + 36\n\
	ldr	r0, [r0]\n\
	mov	r1, #0x2\n\
	mov	r2, #0xd\n\
	mov	r3, #0x8\n\
	bl	PrintHex\n\
	bl	HasLinkErrorOccurred\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r1, #0x2\n\
	mov	r2, #0x2\n\
	mov	r3, #0x1\n\
	bl	PrintHex\n\
	ldr	r0, ._37 + 40\n\
	mov	r6, #0x80\n\
	lsl	r6, r6, #0x12\n\
	add	r5, r0, #0\n\
	add	r5, r5, #0x14\n\
	mov	r4, #0x3\n\
._36:\n\
	ldr	r0, [r5]\n\
	lsr	r1, r6, #0x18\n\
	mov	r2, #0x3\n\
	mov	r3, #0x4\n\
	bl	PrintHex\n\
	mov	r0, #0xc0\n\
	lsl	r0, r0, #0x13\n\
	add	r6, r6, r0\n\
	add	r5, r5, #0x1c\n\
	sub	r4, r4, #0x1\n\
	cmp	r4, #0\n\
	bge	._36	@cond_branch\n\
	ldr	r0, ._37 + 44\n\
	ldrh	r0, [r0]\n\
	mov	r1, #0x2\n\
	mov	r2, #0x6\n\
	mov	r3, #0x4\n\
	bl	PrintHex\n\
	bl	debug_sub_808B850\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	mov	r1, #0x19\n\
	mov	r2, #0x3\n\
	mov	r3, #0x1\n\
	bl	PrintHex\n\
	pop	{r3}\n\
	mov	r8, r3\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r0}\n\
	bx	r0\n\
._38:\n\
	.align	2, 0\n\
._37:\n\
	.word	gTasks\n\
	.word	gShouldAdvanceLinkState\n\
	.word	gBlockSendBuffer\n\
	.word	gLinkPlayerPending\n\
	.word	gBlockRecvBuffer\n\
	.word	gLinkStatus\n\
	.word	gLink\n\
	.word	gReceivedRemoteLinkPlayers\n\
	.word	gSpecialVar_Result\n\
	.word	gLinkCallback\n\
	.word	gLinkPlayers\n\
	.word	0x4000128");
}
#endif

#if DEBUG
__attribute__((naked))
static void sub_8082CD4(u8 arg0, u8 arg1)
{
    asm("\
	push	{r4, r5, r6, r7, lr}\n\
	lsl	r0, r0, #0x18\n\
	lsr	r7, r0, #0x18\n\
	lsl	r1, r1, #0x18\n\
	lsr	r6, r1, #0x18\n\
	mov	r0, #0xc\n\
	mov	r1, #0x0\n\
	mov	r2, #0x1f\n\
	mov	r3, #0x2\n\
	bl	InitLinkTestBG_Unused\n\
	ldr	r4, ._40\n\
	add	r0, r4, #0\n\
	bl	FindTaskIdByFunc\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0xff\n\
	bne	._39	@cond_branch\n\
	add	r0, r4, #0\n\
	mov	r1, #0x50\n\
	bl	CreateTask\n\
	add	r4, r0, #0\n\
	lsl	r4, r4, #0x18\n\
	lsr	r4, r4, #0x18\n\
	ldr	r5, ._40 + 4\n\
	lsl	r0, r4, #0x2\n\
	add	r0, r0, r4\n\
	lsl	r0, r0, #0x3\n\
	add	r0, r0, r5\n\
	strh	r7, [r0, #0xa]\n\
	strh	r6, [r0, #0xc]\n\
	ldr	r0, ._40 + 8\n\
	mov	r1, #0x50\n\
	bl	CreateTask\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	lsl	r1, r0, #0x2\n\
	add	r1, r1, r0\n\
	lsl	r1, r1, #0x3\n\
	add	r1, r1, r5\n\
	strh	r4, [r1, #0x8]\n\
._39:\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r0}\n\
	bx	r0\n\
._41:\n\
	.align	2, 0\n\
._40:\n\
	.word	sub_8082F20+1\n\
	.word	gTasks\n\
	.word	debug_sub_808A55C+1");
}
#else
static void sub_8082CD4(u8 arg0, u8 arg1)
{
    if (FindTaskIdByFunc(sub_8082F20) == 0xFF)
    {
        u8 taskId = CreateTask(sub_8082F20, 80);

        gTasks[taskId].data[1] = arg0;
        gTasks[taskId].data[2] = arg1;
    }
}
#endif

static void sub_8082D18(u32 value)
{
    ConvertIntToDecimalStringN(gStringVar1, value, STR_CONV_MODE_LEFT_ALIGN, 1);
    Menu_DrawStdWindowFrame(18, 10, 28, 13);
    sub_8072BD8(gOtherText_PLink, 19, 11, 72);
}

static void sub_8082D4C()
{
    Menu_EraseWindowRect(18, 10, 28, 13);
}

static void sub_8082D60(u8 taskId, u8 arg1)
{
    s16 *data = &gTasks[taskId].data[3];

    if (arg1 != *data)
    {
        if (arg1 <= 1)
            sub_8082D4C();
        else
            sub_8082D18(arg1);
        *data = arg1;
    }
}

static u32 sub_8082D9C(u8 minPlayers, u8 maxPlayers)
{
    int playerCount;

    switch (GetLinkPlayerDataExchangeStatusTimed())
    {
    case EXCHANGE_COMPLETE:
        playerCount = GetLinkPlayerCount_2();
        if (minPlayers <= playerCount && playerCount <= maxPlayers)
            return 1;
        ConvertIntToDecimalStringN(gStringVar1, playerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
        return 4;
    case EXCHANGE_TIMED_OUT:
        return 0;
    case EXCHANGE_IN_PROGRESS:
        return 3;
    default:
        return 0;
    }
}

static bool32 sub_8082DF4(u8 taskId)
{
    if (HasLinkErrorOccurred() == TRUE)
    {
        gTasks[taskId].func = sub_8083418;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_8082E28(u8 taskId)
{
    if ((gMain.newKeys & B_BUTTON)
     && IsLinkConnectionEstablished() == FALSE)
    {
        gTasks[taskId].func = sub_80833EC;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_8082E6C(u8 taskId)
{
    if (IsLinkConnectionEstablished())
        SetSuppressLinkErrorMessage(TRUE);

    if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].func = sub_80833EC;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_8082EB8(u8 taskId)
{
    if (GetSioMultiSI() == 1)
    {
        gTasks[taskId].func = sub_8083418;
        return TRUE;
    }
    return FALSE;
}

void unref_sub_8082EEC(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 10)
    {
        sub_8007E9C(2);
        DestroyTask(taskId);
    }
}

/*static*/ void sub_8082F20(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        OpenLinkTimed();
        sub_80082EC();
        ResetLinkPlayers();
    }
    else if (data[0] > 9)
    {
        gTasks[taskId].func = sub_8082F68;
    }
    data[0]++;
}

static void sub_8082F68(u8 taskId)
{
    u32 playerCount = GetLinkPlayerCount_2();

    if (sub_8082E28(taskId) == TRUE
     || sub_8082E6C(taskId) == TRUE
     || playerCount < 2)
        return;

    SetSuppressLinkErrorMessage(TRUE);
    gTasks[taskId].data[3] = 0;
    if (IsLinkMaster() == TRUE)
    {
        PlaySE(SE_PIN);
        ShowFieldAutoScrollMessage(gUnknown_081A4932);
        gTasks[taskId].func = sub_8082FEC;
    }
    else
    {
        PlaySE(SE_BOO);
        ShowFieldAutoScrollMessage(gUnknown_081A49B6);
        gTasks[taskId].func = sub_80831F8;
    }
}

static void sub_8082FEC(u8 taskId)
{
    if (sub_8082E28(taskId) == TRUE
     || sub_8082EB8(taskId) == TRUE
     || sub_8082DF4(taskId) == TRUE)
        return;

    if (GetFieldMessageBoxMode() == FIELD_MESSAGE_BOX_HIDDEN)
    {
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].func = sub_808303C;
    }
}

static void sub_808303C(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;
    s32 linkPlayerCount = GetLinkPlayerCount_2();

    if (sub_8082E28(taskId) == TRUE
     || sub_8082EB8(taskId) == TRUE
     || sub_8082DF4(taskId) == TRUE)
        return;

    sub_8082D60(taskId, linkPlayerCount);

    if (!(gMain.newKeys & A_BUTTON))
        return;

#if ENGLISH
    if (linkPlayerCount < taskData[1])
        return;

    sub_80081C8(linkPlayerCount);
    sub_8082D4C();
    ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
    ShowFieldAutoScrollMessage((u8 *)gUnknown_081A4975);
    gTasks[taskId].func = sub_80830E4;
#elif GERMAN
    if ((gLinkType == 0x2255 && (u32)linkPlayerCount > 1)
     || (gLinkType != 0x2255 && taskData[1] <= linkPlayerCount))
    {
        sub_80081C8(linkPlayerCount);
        sub_8082D4C();
        ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
        ShowFieldAutoScrollMessage((u8 *)gUnknown_081A4975);
        gTasks[taskId].func = sub_80830E4;
    }
#endif
}

static void sub_80830E4(u8 taskId)
{
    if (sub_8082E28(taskId) == TRUE
     || sub_8082EB8(taskId) == TRUE
     || sub_8082DF4(taskId) == TRUE)
        return;

    if (GetFieldMessageBoxMode() == FIELD_MESSAGE_BOX_HIDDEN)
    {
        if (sub_800820C() != GetLinkPlayerCount_2())
        {
            ShowFieldAutoScrollMessage(gUnknown_081A4932);
            gTasks[taskId].func = sub_8082FEC;
        }
        else if (gMain.heldKeys & B_BUTTON)
        {
            ShowFieldAutoScrollMessage(gUnknown_081A4932);
            gTasks[taskId].func = sub_8082FEC;
        }
        else if (gMain.heldKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_8007F4C();
            gTasks[taskId].func = sub_8083188;
        }
    }
}

static void sub_8083188(u8 taskId)
{
    u8 local1 = gTasks[taskId].data[1];
    u8 local2 = gTasks[taskId].data[2];

    if (sub_8082DF4(taskId) == TRUE
     || sub_8083444(taskId) == TRUE)
        return;

    if (GetLinkPlayerCount_2() != sub_800820C())
    {
        gTasks[taskId].func = sub_8083418;
    }
    else
    {
        gSpecialVar_Result = sub_8082D9C(local1, local2);
        if (gSpecialVar_Result != 0)
            gTasks[taskId].func = sub_8083288;
    }
}

void sub_80831F8(u8 taskId)
{
    u8 local1, local2;

    local1 = gTasks[taskId].data[1];
    local2 = gTasks[taskId].data[2];

    if (sub_8082E28(taskId) == TRUE
     || sub_8082DF4(taskId) == TRUE)
        return;

#if DEBUG
    sub_8082D60(taskId, GetLinkPlayerCount_2());
#endif

    gSpecialVar_Result = sub_8082D9C(local1, local2);
    if (gSpecialVar_Result == 0)
        return;
    if (gSpecialVar_Result == 3)
    {
        sub_800832C();
        HideFieldMessageBox();
        gTasks[taskId].func = sub_80833C4;
    }
    else
    {
        gFieldLinkPlayerCount = GetLinkPlayerCount_2();
        gUnknown_03004860 = GetMultiplayerId();
        sub_80081C8(gFieldLinkPlayerCount);
        TrainerCard_GenerateCardForPlayer((struct TrainerCard *)gBlockSendBuffer);
        gTasks[taskId].func = sub_8083314;
    }
}

static void sub_8083288(u8 taskId)
{
    if (sub_8082DF4(taskId) == TRUE)
        return;

    if (gSpecialVar_Result == 3)
    {
        sub_800832C();
        HideFieldMessageBox();
        gTasks[taskId].func = sub_80833C4;
    }
    else
    {
        gFieldLinkPlayerCount = GetLinkPlayerCount_2();
        gUnknown_03004860 = GetMultiplayerId();
        sub_80081C8(gFieldLinkPlayerCount);
        TrainerCard_GenerateCardForPlayer((struct TrainerCard *)gBlockSendBuffer);
        gTasks[taskId].func = sub_8083314;
        sub_8007E9C(2);
    }
}

static void sub_8083314(u8 taskId)
{
    u8 index;
    struct TrainerCard *trainerCards;

    if (sub_8082DF4(taskId) == TRUE)
        return;

    if (GetBlockReceivedStatus() != sub_8008198())
        return;

    index = 0;
    trainerCards = gTrainerCards;
    for (index = 0; index < GetLinkPlayerCount(); index++)
    {
        void *src;
        src = gBlockRecvBuffer[index];
        memcpy(&trainerCards[index], src, sizeof(struct TrainerCard));
    }

    SetSuppressLinkErrorMessage(FALSE);
    ResetBlockReceivedFlags();
    HideFieldMessageBox();

    if (gSpecialVar_Result == 1)
    {
#if ENGLISH
        u16 linkType;
        linkType = gLinkType;
        // FIXME: sub_8082D4C doesn't take any arguments
        sub_8082D4C(0x4411, linkType);
#elif GERMAN
        if (gLinkType != 0x4411)
        {
            if (gLinkType == 0x6601)
                deUnkValue2 = 1;
        }
        sub_8082D4C();
#endif
        EnableBothScriptContexts();
        DestroyTask(taskId);
        return;
    }

    sub_800832C();
    gTasks[taskId].func = sub_80833C4;
}

static void sub_80833C4(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers == FALSE)
    {
        sub_8082D4C();
        EnableBothScriptContexts();
        DestroyTask(taskId);
    }
}

static void sub_80833EC(u8 taskId)
{
    gSpecialVar_Result = 5;
    sub_8082D4C();
    HideFieldMessageBox();
    EnableBothScriptContexts();
    DestroyTask(taskId);
}

static void sub_8083418(u8 taskId)
{
    gSpecialVar_Result = 6;
    sub_8082D4C();
    HideFieldMessageBox();
    EnableBothScriptContexts();
    DestroyTask(taskId);
}

static bool8 sub_8083444(u8 taskId)
{
    gTasks[taskId].data[4]++;
    if (gTasks[taskId].data[4] > 600)
    {
        gTasks[taskId].func = sub_8083418;
        return TRUE;
    }

    return FALSE;
}

void sub_808347C(u8 arg0)
{
    u32 r3 = 2;
    u32 r2 = 2;

    switch (gSpecialVar_0x8004)
    {
    case 1:
        r3 = 2;
        gLinkType = 0x2233;
        break;
    case 2:
        r3 = 2;
        gLinkType = 0x2244;
        break;
    case 5:
        r3 = 4;
        r2 = 4;
        gLinkType = 0x2255;
        break;
    }

    sub_8082CD4(r3, r2);
}

void sub_80834E4(void)
{
    gLinkType = 0x1133;
    gBattleTypeFlags = 0;
    sub_8082CD4(2, 2);
}

void sub_808350C(void)
{
    gSpecialVar_Result = 0;
    gLinkType = 0x3311;
    gBattleTypeFlags = 0;
    sub_8082CD4(2, 4);
}

static void sub_808353C(u8 taskId)
{
    int playerCount;
    int i;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gSpecialVar_Result == 1)
        {
            playerCount = GetLinkPlayerCount();
            for (i = 0; i < playerCount; i++)
            {
                if (gLinkPlayers[i].language == LANGUAGE_JAPANESE)
                {
                    gSpecialVar_Result = 7;
                    sub_8008480();
                    gTasks[taskId].data[0] = 1;
                    return;
                }
            }
        }
        EnableBothScriptContexts();
        DestroyTask(taskId);
        break;
    case 1:
        if (gReceivedRemoteLinkPlayers == FALSE)
        {
            EnableBothScriptContexts();
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_80835D8(void)
{
    int taskId = FindTaskIdByFunc(sub_808353C);

    if (taskId == 0xFF)
    {
        taskId = CreateTask(sub_808353C, 80);
        gTasks[taskId].data[0] = 0;
    }
}

void sub_8083614(void)
{
    gLinkType = 0x4411;
    gBattleTypeFlags = 0;
    sub_8082CD4(2, 4);
}

void sub_808363C(void)
{
    gLinkType = 0x6601;
    gBattleTypeFlags = 0;
    sub_8082CD4(4, 4);
}

u8 sub_8083664(void)
{
    if (FuncIsActiveTask(sub_8083710) != FALSE)
        return 0xFF;

    switch (gSpecialVar_0x8004)
    {
    case 1:
        gLinkType = 0x2233;
        break;
    case 2:
        gLinkType = 0x2244;
        break;
    case 5:
        gLinkType = 0x2255;
        break;
    case 3:
        gLinkType = 0x1111;
        break;
    case 4:
        gLinkType = 0x3322;
        break;
    }

    return CreateTask(sub_8083710, 80);
}

static void sub_8083710(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        OpenLink();
        ResetLinkPlayers();
        CreateTask(sub_8083C50, 80);
    }
    else if (data[0] >= 10)
    {
        gTasks[taskId].func = sub_8083760;
    }
    data[0]++;
}

static void sub_8083760(u8 taskId)
{
    if (GetLinkPlayerCount_2() >= 2)
    {
        if (IsLinkMaster() == TRUE)
            gTasks[taskId].func = sub_80837B4;
        else
            gTasks[taskId].func = sub_80837EC;
    }
}

static void sub_80837B4(u8 taskId)
{
    if (sub_800820C() == GetLinkPlayerCount_2())
    {
        sub_8007F4C();
        gTasks[taskId].func = sub_80837EC;
    }
}

static void sub_80837EC(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers == TRUE
     && IsLinkPlayerDataExchangeComplete() == TRUE)
    {
        sub_800826C();
        sub_8007B14();
        DestroyTask(taskId);
    }
}

void sub_8083820(void)
{
    ScrSpecial_DoSaveDialog();
}

static void sub_808382C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        fade_screen(1, 0);
        gLinkType = 0x2211;
        ClearLinkCallback_2();
        task->data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
            task->data[0]++;
        break;
    case 2:
        task->data[1]++;
        if (task->data[1] > 20)
            task->data[0]++;
        break;
    case 3:
        sub_800832C();
        task->data[0]++;
        break;
    case 4:
        if (!gReceivedRemoteLinkPlayers)
            task->data[0]++;
        break;
    case 5:
        if (gLinkPlayers[0].trainerId & 1)
            current_map_music_set__default_for_battle(BGM_BATTLE32);
        else
            current_map_music_set__default_for_battle(BGM_BATTLE20);

        switch (gSpecialVar_0x8004)
        {
        case 1:
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK;
            break;
        case 2:
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE;
            break;
        case 5:
            ReducePlayerPartyToThree();
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI;
            break;
        }

        SetMainCallback2(sub_800E7C4);
        gMain.savedCallback = sub_8083958;
        DestroyTask(taskId);
        break;
    }
}

static void sub_8083958(void)
{
    Overworld_ResetMapMusic();
    LoadPlayerParty();
    SavePlayerBag();
    sub_810FEFC();

    if (gSpecialVar_0x8004 != 5)
        UpdateLinkBattleRecords(gUnknown_03004860 ^ 1);

    gMain.savedCallback = sub_805465C;
    SetMainCallback2(sub_8071B28);
}

void sub_80839A4(void)
{
    if (gSpecialVar_0x8004 == 1 || gSpecialVar_0x8004 == 2 || gSpecialVar_0x8004 == 5)
    {
        LoadPlayerParty();
        SavePlayerBag();
    }
    copy_saved_warp2_bank_and_enter_x_to_warp1(0x7F);
}

void sub_80839D0(void)
{
    sub_805559C();
}

static void sub_80839DC(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        ShowFieldMessage(gUnknown_081A490C);
        task->data[0] = 1;
        break;
    case 1:
        if (IsFieldMessageBoxHidden())
        {
            sub_8055574();
            sub_8007270(gSpecialVar_0x8005);
            task->data[0] = 2;
        }
        break;
    case 2:
        switch (sub_80554F8())
        {
        case 0:
            break;
        case 1:
            HideFieldMessageBox();
            task->data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        case 2:
            task->data[0] = 3;
            break;
        }
        break;
    case 3:
        sub_8055588();
        HideFieldMessageBox();
        Menu_EraseScreen();
        DestroyTask(taskId);
        EnableBothScriptContexts();
        break;
    }
}

void sub_8083A84(TaskFunc followupFunc)
{
    u8 taskId = CreateTask(sub_80839DC, 80);
    SetTaskFuncWithFollowupFunc(taskId, sub_80839DC, followupFunc);
    ScriptContext1_Stop();
}

static void sub_8083AAC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        ScriptContext2_Enable();
        fade_screen(1, 0);
        ClearLinkCallback_2();
        task->data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
            task->data[0]++;
        break;
    case 2:
        gUnknown_020297D8.field0 = 0;
        gUnknown_020297D8.field1 = 0;
        m4aMPlayAllStop();
        sub_800832C();
        task->data[0]++;
        break;
    case 3:
        if (!gReceivedRemoteLinkPlayers)
        {
            SetMainCallback2(sub_8047CD8);
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_8083B44(u8 taskId)
{
    sub_8083B6C();
    DestroyTask(taskId);
}

void sub_8083B5C(void)
{
    sub_8083A84(sub_8083B44);
}

static void sub_8083B6C(void)
{
    CreateTask(sub_8083AAC, 80);
}

void sub_8083B80(void)
{
    sub_8083B6C();
    ScriptContext1_Stop();
}

void sub_8083B90(void)
{
    gLinkType = 0x2211;
    sub_8083A84(sub_808382C);
}

void unref_sub_8083BB0(void)
{
    u8 taskId = CreateTask(sub_80839DC, 80);
    SetTaskFuncWithFollowupFunc(taskId, sub_80839DC, Task_RecordMixing_Main);
    ScriptContext1_Stop();
}

void sub_8083BDC(void)
{
    TrainerCard_ShowLinkCard(gSpecialVar_0x8006, c2_exit_to_overworld_1_continue_scripts_restart_music);
}

bool32 sub_8083BF4(u8 linkPlayerIndex)
{
    u32 trainerCardColorIndex;

    gSpecialVar_0x8006 = linkPlayerIndex;
    StringCopy(gStringVar1, gLinkPlayers[linkPlayerIndex].name);

    trainerCardColorIndex = sub_80934C4(linkPlayerIndex);
    if (trainerCardColorIndex == 0)
        return FALSE;

    StringCopy(gStringVar2, gTrainerCardColorNames[trainerCardColorIndex - 1]);
    return TRUE;
}

void sub_8083C50(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[0]++;
    if (task->data[0] > 300)
    {
        CloseLink();
        SetMainCallback2(CB2_LinkError);
        DestroyTask(taskId);
    }

    if (gReceivedRemoteLinkPlayers)
        DestroyTask(taskId);
}

#if DEBUG

__attribute__((naked))
void debug_sub_808B778()
{
    asm("\
	push	{r4, lr}\n\
	ldr	r4, ._390\n\
	add	r0, r4, #0\n\
	bl	FuncIsActiveTask\n\
	lsl	r0, r0, #0x18\n\
	cmp	r0, #0\n\
	bne	._389	@cond_branch\n\
	add	r0, r4, #0\n\
	mov	r1, #0x50\n\
	bl	CreateTask\n\
._389:\n\
	ldr	r1, ._390 + 4\n\
	ldr	r0, [r1]\n\
	add	r0, r0, #0x1\n\
	str	r0, [r1]\n\
	pop	{r4}\n\
	pop	{r0}\n\
	bx	r0\n\
._391:\n\
	.align	2, 0\n\
._390:\n\
	.word	debug_sub_808B7A8+1\n\
	.word	unk_3004E98");
}

__attribute__((naked))
void debug_sub_808B7A8()
{
    asm("\
	push	{lr}\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	ldr	r2, ._393\n\
	lsl	r1, r0, #0x2\n\
	add	r1, r1, r0\n\
	lsl	r1, r1, #0x3\n\
	add	r1, r1, r2\n\
	ldrh	r0, [r1, #0x8]\n\
	add	r0, r0, #0x1\n\
	strh	r0, [r1, #0x8]\n\
	lsl	r0, r0, #0x10\n\
	asr	r0, r0, #0x10\n\
	cmp	r0, #0x1e\n\
	bne	._392	@cond_branch\n\
	mov	r0, #0x0\n\
	strh	r0, [r1, #0x8]\n\
	ldr	r2, ._393 + 4\n\
	ldrh	r0, [r2]\n\
	mov	r1, #0x1\n\
	orr	r0, r0, r1\n\
	strh	r0, [r2]\n\
._392:\n\
	pop	{r0}\n\
	bx	r0\n\
._394:\n\
	.align	2, 0\n\
._393:\n\
	.word	gTasks\n\
	.word	unk_3004E94");
}
#endif

static void sub_8083CA4(u8 taskId)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        EnableBothScriptContexts();
        DestroyTask(taskId);
    }
}

void unref_sub_8083CC8(u8 taskId)
{
    sub_800832C();
    gTasks[taskId].func = sub_8083CA4;
}

#if DEBUG

__attribute__((naked))
void debug_sub_808B82C()
{
    asm("\
	ldr	r1, ._400\n\
	mov	r0, #0x0\n\
	strb	r0, [r1]\n\
	bx	lr\n\
._401:\n\
	.align	2, 0\n\
._400:\n\
	.word	unk_2030220");
}

__attribute__((naked))
void debug_sub_808B838(u8 a)
{
    asm("\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	ldr	r2, ._402\n\
	mov	r1, #0x1\n\
	LSL	r1, r0\n\
	ldrb	r0, [r2]\n\
	orr	r1, r1, r0\n\
	strb	r1, [r2]\n\
	bx	lr\n\
._403:\n\
	.align	2, 0\n\
._402:\n\
	.word	unk_2030220");
}

__attribute__((naked))
int debug_sub_808B850()
{
    asm("\
	ldr	r0, ._404\n\
	ldrb	r0, [r0]\n\
	bx	lr\n\
._405:\n\
	.align	2, 0\n\
._404:\n\
	.word	unk_2030220");
}

#endif