#include "global.h"
#include "event_data.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rtc.h"
#include "save.h"
#include "sprite.h"
#include "constants/songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "scanline_effect.h"

struct ResetRtcStruct
{
    /*0x0*/ u8 dataIndex;
    /*0x2*/ u16 minVal;
    /*0x4*/ u16 maxVal;
    /*0x6*/ u8 left;
    /*0x7*/ u8 right;
    /*0x8*/ u8 unk8;
};

extern u16 gSaveFileStatus;

void CB2_ResetRtcScreen(void);
void VBlankCB_ResetRtcScreen(void);
void Task_ResetRtcScreen(u8);

static const struct ResetRtcStruct gUnknown_08376420[5] =
{
    {
        .dataIndex = 3,
        .minVal = 1,
        .maxVal = 9999,
        .left = 0,
        .right = 2,
        .unk8 = 0,
    },
    {
        .dataIndex = 4,
        .minVal = 0,
        .maxVal = 23,
        .left = 1,
        .right = 3,
        .unk8 = 0,
    },
    {
        .dataIndex = 5,
        .minVal = 0,
        .maxVal = 59,
        .left = 2,
        .right = 4,
        .unk8 = 0,
    },
    {
        .dataIndex = 6,
        .minVal = 0,
        .maxVal = 59,
        .left = 3,
        .right = 5,
        .unk8 = 0,
    },
    {
        .dataIndex = 7,
        .minVal = 0,
        .maxVal = 0,
        .left = 4,
        .right = 0,
        .unk8 = 6,
    },
};

const struct OamData gOamData_837645C =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const u8 gSpriteImage_8376464[] = INCBIN_U8("graphics/unknown_sprites/83764AC/0.4bpp");
const u8 gSpriteImage_8376484[] = INCBIN_U8("graphics/unknown_sprites/83764AC/1.4bpp");

const u16 Palette_3764A4[] = INCBIN_U16("graphics/unknown/83764A4.gbapal");

const struct SpriteFrameImage gSpriteImageTable_83764AC[] =
{
    { gSpriteImage_8376464, 0x20 },
    { gSpriteImage_8376484, 0x20 },
};

const struct SpritePalette gUnknown_083764BC =
{
    .data = Palette_3764A4,
    .tag = 0x1000,
};

const union AnimCmd gSpriteAnim_83764C4[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_83764CC[] =
{
    ANIMCMD_FRAME(0, 158, .vFlip = TRUE),
    ANIMCMD_JUMP(0),
};

const union AnimCmd gSpriteAnim_83764D4[] =
{
    ANIMCMD_FRAME(1, 30),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83764DC[] =
{
    gSpriteAnim_83764C4,
    gSpriteAnim_83764CC,
    gSpriteAnim_83764D4,
};

const struct SpriteTemplate gSpriteTemplate_83764E8 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 0x1000,
    .oam = &gOamData_837645C,
    .anims = gSpriteAnimTable_83764DC,
    .images = gSpriteImageTable_83764AC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const u8 gUnknown_08376500[] = _(" : ");

#if DEBUG
const u8 gUnknown_Debug_0839AE94[] = _("にっすう");
const u8 gUnknown_Debug_0839AE99[] = _("じかん");
const u8 gUnknown_Debug_0839AE9D[] = _("ゲームない　じかん");
const u8 gUnknown_Debug_0839AEA7[] = _("RTC　じかん");
#endif

void SpriteCB_ResetRtcCusor0(struct Sprite *sprite)
{
    int state = gTasks[sprite->data[0]].data[2];
    if (state != sprite->data[1])
    {
        sprite->data[1] = state;
        switch (state)
        {
        case 1:
            sprite->invisible = FALSE;
            sprite->animNum = 1;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 53;
            sprite->pos1.y = 68;
            break;
        case 2:
            sprite->invisible = FALSE;
            sprite->animNum = 1;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 86;
            sprite->pos1.y = 68;
            break;
        case 3:
            sprite->invisible = FALSE;
            sprite->animNum = 1;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 107;
            sprite->pos1.y = 68;
            break;
        case 4:
            sprite->invisible = FALSE;
            sprite->animNum = 1;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 128;
            sprite->pos1.y = 68;
            break;
        case 5:
            sprite->invisible = FALSE;
            sprite->animNum = 2;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 155;
            sprite->pos1.y = 80;
            break;
        case 6:
            DestroySprite(sprite);
            break;
        }
    }
}

void SpriteCB_ResetRtcCusor1(struct Sprite *sprite)
{
    int state = gTasks[sprite->data[0]].data[2];
    if (state != sprite->data[1])
    {
        sprite->data[1] = state;
        switch (state)
        {
        case 1:
            sprite->invisible = FALSE;
            sprite->animNum = 0;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 53;
            sprite->pos1.y = 92;
            break;
        case 2:
            sprite->invisible = FALSE;
            sprite->animNum = 0;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 86;
            sprite->pos1.y = 92;
            break;
        case 3:
            sprite->invisible = FALSE;
            sprite->animNum = 0;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 107;
            sprite->pos1.y = 92;
            break;
        case 4:
            sprite->invisible = FALSE;
            sprite->animNum = 0;
            sprite->animDelayCounter = 0;
            sprite->pos1.x = 128;
            sprite->pos1.y = 92;
            break;
        case 5:
            sprite->invisible = TRUE;
            break;
        case 6:
            DestroySprite(sprite);
            break;
        }
    }
}

void ResetRtcScreen_CreateCursor(u8 taskId)
{
    int spriteId;

    LoadSpritePalette(&gUnknown_083764BC);

    spriteId = CreateSpriteAtEnd(&gSpriteTemplate_83764E8, 53, 68, 0);
    gSprites[spriteId].callback = SpriteCB_ResetRtcCusor0;
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = -1;

    spriteId = CreateSpriteAtEnd(&gSpriteTemplate_83764E8, 53, 68, 0);
    gSprites[spriteId].callback = SpriteCB_ResetRtcCusor1;
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = -1;
}

void ResetRtcScreen_FreeCursorPalette(void)
{
    FreeSpritePaletteByTag(gUnknown_083764BC.tag);
}

void ResetRtcScreen_HideChooseTimeWindow(void)
{
    Menu_EraseWindowRect(3, 8, 25, 11);
}

void ResetRtcScreen_PrintTime(u8 x, u8 y, u16 days, u8 hours, u8 minutes, u8 seconds)
{
    u8 *dest = gStringVar4;
    days %= 10000;
    hours %= 24;
    minutes %= 60;
    seconds %= 60;
    sub_8072C44(gStringVar1, days, 24, 1);
    dest = StringCopy(dest, gStringVar1);
    dest = StringCopy(dest, gOtherText_Day);
    sub_8072C44(gStringVar1, hours, 18, 1);
    dest = StringCopy(dest, gStringVar1);
    dest = StringCopy(dest, gUnknown_08376500);
    dest = ConvertIntToDecimalStringN(dest, minutes, STR_CONV_MODE_LEADING_ZEROS, 2);
    dest = StringCopy(dest, gUnknown_08376500);
    ConvertIntToDecimalStringN(dest, seconds, STR_CONV_MODE_LEADING_ZEROS, 2);
    Menu_PrintText(gStringVar4, x, y);
}

void ResetRtcScreen_ShowChooseTimeWindow(u16 days, u8 hours, u8 minutes, u8 seconds)
{
    Menu_DrawStdWindowFrame(3, 8, 25, 11);
    Menu_PrintText(gOtherText_OK, 20, 9);
    ResetRtcScreen_PrintTime(4, 9, days, hours, minutes, seconds);
}

bool32 ResetRtcScreen_MoveTimeUpDown(s16 *val, int minVal, int maxVal, u16 keys)
{
    if (keys & DPAD_DOWN)
    {
        (*val)--;
        if (*val < minVal)
            *val = maxVal;
    }
    else if (keys & DPAD_UP)
    {
        (*val)++;
        if (*val > maxVal)
            *val = minVal;
    }
    else if (keys & DPAD_LEFT)
    {
        *val -= 10;
        if (*val < minVal)
            *val = maxVal;
    }
    else if (keys & DPAD_RIGHT)
    {
        *val += 10;
        if (*val > maxVal)
            *val = minVal;
    }
    else
    {
        return FALSE;
    }

    return TRUE;
}

void Task_ResetRtc_3(u8 taskId)
{
    gTasks[taskId].data[0] = 1;
}

void Task_ResetRtc_2(u8 taskId)
{
    ResetRtcScreen_HideChooseTimeWindow();
    ResetRtcScreen_FreeCursorPalette();
    gTasks[taskId].func = Task_ResetRtc_3;
}

void Task_ResetRtc_1(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u8 selection = data[2];
    const struct ResetRtcStruct *selectionInfo = &gUnknown_08376420[selection - 1];

    if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].func = Task_ResetRtc_2;
        data[1] = 0;
        data[2] = 6;
        PlaySE(SE_SELECT);
        return;
    }

    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (selectionInfo->right)
        {
            data[2] = selectionInfo->right;
            PlaySE(SE_SELECT);
            return;
        }
    }

    if (gMain.newKeys & DPAD_LEFT)
    {
        if (selectionInfo->left)
        {
            data[2] = selectionInfo->left;
            PlaySE(SE_SELECT);
            return;
        }
    }

    if (selection == 5)
    {
        if (gMain.newKeys & A_BUTTON)
        {
            gLocalTime.days = data[3];
            gLocalTime.hours = data[4];
            gLocalTime.minutes = data[5];
            gLocalTime.seconds = data[6];
            PlaySE(SE_SELECT);
            gTasks[taskId].func = Task_ResetRtc_2;
            data[1] = 1;
            data[2] = 6;
        }
    }
    else if (ResetRtcScreen_MoveTimeUpDown(&data[selectionInfo->dataIndex], selectionInfo->minVal, selectionInfo->maxVal, gMain.newAndRepeatedKeys & (DPAD_UP | DPAD_DOWN)))
    {
        PlaySE(SE_SELECT);
        ResetRtcScreen_PrintTime(4, 9, data[3], data[4], data[5], data[6]);
    }
}

void Task_ResetRtc_0(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    data[0] = 0;
    data[3] = gLocalTime.days;
    data[4] = gLocalTime.hours;
    data[5] = gLocalTime.minutes;
    data[6] = gLocalTime.seconds;
    ResetRtcScreen_ShowChooseTimeWindow(data[3], data[4], data[5], data[6]);
    ResetRtcScreen_CreateCursor(taskId);
    data[2] = 2;
    gTasks[taskId].func = Task_ResetRtc_1;
}

void CB2_InitResetRtcScreen(void)
{
    REG_DISPCNT = 0;
    SetVBlankCallback(NULL);
    DmaClear16(3, PLTT, PLTT_SIZE);
    DmaFill16Large(3, 0, (u8 *)VRAM, 0x18000, 0x1000);
    ResetOamRange(0, 128);
    LoadOam();
    ScanlineEffect_Stop();
    ScanlineEffect_Clear();
    ResetSpriteData();
    ResetTasks();
    ResetPaletteFade();
    Text_LoadWindowTemplate(&gWindowTemplate_81E6CE4);
    InitMenuWindow(&gWindowTemplate_81E6CE4);
    REG_DISPCNT = 4352;
    SetVBlankCallback(VBlankCB_ResetRtcScreen);
    SetMainCallback2(CB2_ResetRtcScreen);
    CreateTask(Task_ResetRtcScreen, 80);
}

void CB2_ResetRtcScreen(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void VBlankCB_ResetRtcScreen(void)
{
    ProcessSpriteCopyRequests();
    LoadOam();
    TransferPlttBuffer();
}

void ResetRtcScreen_ShowMessage(const u8 *str)
{
    Menu_DisplayDialogueFrame();
    Menu_PrintText(str, 2, 15);
}

void Task_ShowResetRtcPrompt(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        Menu_EraseScreen();
        Menu_DrawStdWindowFrame(0, 0, 20, 10);
        Menu_PrintText(gSystemText_PresentTime, 1, 1);
        ResetRtcScreen_PrintTime(
            1,
            3,
            gLocalTime.days,
            gLocalTime.hours,
            gLocalTime.minutes,
            gLocalTime.seconds);
        Menu_PrintText(gSystemText_PreviousTime, 1, 5);
        ResetRtcScreen_PrintTime(
            1,
            7,
            gSaveBlock2.lastBerryTreeUpdate.days,
            gSaveBlock2.lastBerryTreeUpdate.hours,
            gSaveBlock2.lastBerryTreeUpdate.minutes,
            gSaveBlock2.lastBerryTreeUpdate.seconds);
        ResetRtcScreen_ShowMessage(gSystemText_ResetRTCPrompt);
        data[0]++;
    case 1:
        if (gMain.newKeys & B_BUTTON)
        {
            DestroyTask(taskId);
            DoSoftReset();
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            DestroyTask(taskId);
        }
        break;
    }
}

void Task_ResetRtcScreen(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 1, 0x10, 0, 0xFFFF);
        data[0] = 1;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            if (gSaveFileStatus == 0 || gSaveFileStatus == 2)
            {
                ResetRtcScreen_ShowMessage(gSystemText_NoSaveFileNoTime);
                data[0] = 5;
            }
            else
            {
                RtcCalcLocalTime();
                data[1] = CreateTask(Task_ShowResetRtcPrompt, 80);
                data[0] = 2;
            }
        }
        break;
    case 2:
        if (gTasks[data[1]].isActive != TRUE)
        {
            Menu_EraseScreen();
            ResetRtcScreen_ShowMessage(gSystemText_PleaseResetTime);
            gLocalTime = gSaveBlock2.lastBerryTreeUpdate;
            data[1] = CreateTask(Task_ResetRtc_0, 80);
            data[0] = 3;
        }
        break;
    case 3:
        if (gTasks[data[1]].data[0])
        {
            if (!gTasks[data[1]].data[1])
            {
                DestroyTask(data[1]);
                data[0] = 2;
            }
            else
            {
                DestroyTask(data[1]);
                RtcReset();
                RtcCalcLocalTimeOffset(
                    gLocalTime.days,
                    gLocalTime.hours,
                    gLocalTime.minutes,
                    gLocalTime.seconds);
                gSaveBlock2.lastBerryTreeUpdate = gLocalTime;
                VarSet(VAR_DAYS, gLocalTime.days);
                DisableResetRTC();
                ResetRtcScreen_ShowMessage(gSystemText_ClockResetDataSave);
                data[0] = 4;
            }
        }
        break;
    case 4:
        if (Save_WriteData(0) == SAVE_STATUS_OK)
        {
            ResetRtcScreen_ShowMessage(gSystemText_SaveCompleted);
            PlaySE(SE_PINPON);
        }
        else
        {
            ResetRtcScreen_ShowMessage(gSystemText_SaveFailed);
            PlaySE(SE_BOO);
        }
        data[0] = 5;
    case 5:
        if (gMain.newKeys & A_BUTTON)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 1, 0, 0x10, 0xFFFF);
            data[0] = 6;
        }
        else
        {
            break;
        }
    case 6:
        if (!gPaletteFade.active)
        {
            DestroyTask(taskId);
            DoSoftReset();
        }
    }
}

#if DEBUG

__attribute__((naked))
void debug_sub_806F8F8(void)
{
    asm("\
	push	{lr}\n\
	ldr	r0, ._131       @ CB2_InitResetRtcScreen\n\
	bl	SetMainCallback2\n\
	pop	{r0}\n\
	bx	r0\n\
._132:\n\
	.align	2, 0\n\
._131:\n\
	.word	CB2_InitResetRtcScreen+1");
}

__attribute__((naked))
void debug_sub_806F908(u8 a)
{
    asm("\
	push	{r4, r5, lr}\n\
	lsl	r0, r0, #0x18\n\
	lsr	r5, r0, #0x18\n\
	lsl	r0, r5, #0x2\n\
	add	r0, r0, r5\n\
	lsl	r0, r0, #0x3\n\
	ldr	r2, ._136       @ gTasks\n\
	add	r4, r0, r2\n\
	mov	r1, #0x0\n\
	ldsh	r0, [r4, r1]\n\
	cmp	r0, #0\n\
	beq	._133	@cond_branch\n\
	cmp	r0, #0x1\n\
	beq	._134	@cond_branch\n\
	b	._141\n\
._137:\n\
	.align	2, 0\n\
._136:\n\
	.word	gTasks+0x8\n\
._133:\n\
	ldr	r0, ._139       @ Task_ResetRtc_0\n\
	mov	r1, #0x50\n\
	bl	CreateTask\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	strh	r0, [r4, #0x2]\n\
	ldrh	r0, [r4]\n\
	add	r0, r0, #0x1\n\
	strh	r0, [r4]\n\
	b	._141\n\
._140:\n\
	.align	2, 0\n\
._139:\n\
	.word	Task_ResetRtc_0+1\n\
._134:\n\
	sub	r2, r2, #0x8\n\
	mov	r0, #0x2\n\
	ldsh	r1, [r4, r0]\n\
	lsl	r0, r1, #0x2\n\
	add	r0, r0, r1\n\
	lsl	r0, r0, #0x3\n\
	add	r2, r0, r2\n\
	mov	r1, #0x8\n\
	ldsh	r0, [r2, r1]\n\
	cmp	r0, #0\n\
	beq	._141	@cond_branch\n\
	mov	r1, #0xa\n\
	ldsh	r0, [r2, r1]\n\
	cmp	r0, #0x1\n\
	bne	._142	@cond_branch\n\
	ldr	r3, ._143       @ gLocalTime\n\
	mov	r1, #0x0\n\
	ldsh	r0, [r3, r1]\n\
	mov	r1, #0x2\n\
	ldsb	r1, [r3, r1]\n\
	mov	r2, #0x3\n\
	ldsb	r2, [r3, r2]\n\
	ldrb	r3, [r3, #0x4]\n\
	lsl	r3, r3, #0x18\n\
	asr	r3, r3, #0x18\n\
	bl	RtcCalcLocalTimeOffset\n\
._142:\n\
	ldrb	r0, [r4, #0x2]\n\
	bl	DestroyTask\n\
	bl	Menu_EraseScreen\n\
	bl	ScriptContext2_Disable\n\
	add	r0, r5, #0\n\
	bl	DestroyTask\n\
._141:\n\
	pop	{r4, r5}\n\
	pop	{r0}\n\
	bx	r0\n\
._144:\n\
	.align	2, 0\n\
._143:\n\
	.word	gLocalTime");
}

__attribute__((naked))
void debug_sub_806F99C()
{
    asm("\
	push	{lr}\n\
	bl	RtcCalcLocalTime\n\
	ldr	r0, ._145       @ debug_sub_806F908\n\
	mov	r1, #0x50\n\
	bl	CreateTask\n\
	bl	ScriptContext2_Enable\n\
	pop	{r0}\n\
	bx	r0\n\
._146:\n\
	.align	2, 0\n\
._145:\n\
	.word	debug_sub_806F908+1");
}

__attribute__((naked))
void debug_sub_806F9B8()
{
    asm("\
	push	{lr}\n\
	ldr	r2, ._147       @ gLocalTime\n\
	ldr	r0, ._147 + 4   @ gSaveBlock2\n\
	add	r0, r0, #0xa0\n\
	ldr	r1, [r0, #0x4]\n\
	ldr	r0, [r0]\n\
	str	r0, [r2]\n\
	str	r1, [r2, #0x4]\n\
	ldr	r0, ._147 + 8   @ debug_sub_806F908\n\
	mov	r1, #0x50\n\
	bl	CreateTask\n\
	bl	ScriptContext2_Enable\n\
	pop	{r0}\n\
	bx	r0\n\
._148:\n\
	.align	2, 0\n\
._147:\n\
	.word	gLocalTime\n\
	.word	gSaveBlock2\n\
	.word	debug_sub_806F908+1");
}

__attribute__((naked))
void debug_sub_806F9E4()
{
    asm("\
	push	{r4, r5, r6, r7, lr}\n\
	mov	r7, sl\n\
	mov	r6, r9\n\
	mov	r5, r8\n\
	push	{r5, r6, r7}\n\
	lsl	r0, r0, #0x18\n\
	lsr	r7, r0, #0x18\n\
	lsl	r0, r7, #0x2\n\
	add	r0, r0, r7\n\
	lsl	r0, r0, #0x3\n\
	ldr	r1, ._153       @ gTasks\n\
	add	r5, r0, r1\n\
	ldr	r6, ._153 + 4   @ gStringVar4\n\
	mov	r1, #0x0\n\
	ldsh	r0, [r5, r1]\n\
	cmp	r0, #0x1\n\
	beq	._149	@cond_branch\n\
	cmp	r0, #0x1\n\
	bgt	._150	@cond_branch\n\
	cmp	r0, #0\n\
	beq	._151	@cond_branch\n\
	b	._165\n\
._154:\n\
	.align	2, 0\n\
._153:\n\
	.word	gTasks+0x8\n\
	.word	gStringVar4\n\
._150:\n\
	cmp	r0, #0x2\n\
	beq	._155	@cond_branch\n\
	b	._165\n\
._149:\n\
	mov	r0, #0x0\n\
	mov	r1, #0x9\n\
	mov	r2, #0x1d\n\
	mov	r3, #0x13\n\
	bl	Menu_DrawStdWindowFrame\n\
	add	r4, r6, #0\n\
	add	r4, r4, #0x50\n\
	bl	RtcGetErrorStatus\n\
	add	r1, r0, #0\n\
	lsl	r1, r1, #0x10\n\
	lsr	r1, r1, #0x10\n\
	add	r0, r4, #0\n\
	mov	r2, #0x2\n\
	mov	r3, #0x4\n\
	bl	ConvertIntToHexStringN\n\
	add	r0, r4, #0\n\
	mov	r1, #0x2\n\
	mov	r2, #0xa\n\
	bl	Menu_PrintText\n\
	ldr	r0, ._158       @ gUnknown_Debug_0839AE94\n\
	mov	r1, #0xc\n\
	mov	r2, #0xc\n\
	bl	Menu_PrintText\n\
	ldr	r0, ._158 + 4   @ gUnknown_Debug_0839AE99\n\
	mov	r1, #0x14\n\
	mov	r2, #0xc\n\
	bl	Menu_PrintText\n\
	ldr	r0, ._158 + 8   @ gUnknown_Debug_0839AEA7\n\
	mov	r1, #0x1\n\
	mov	r2, #0xe\n\
	bl	Menu_PrintText\n\
	ldr	r0, ._158 + 12  @ gUnknown_Debug_0839AE9D\n\
	mov	r1, #0x1\n\
	mov	r2, #0x10\n\
	bl	Menu_PrintText\n\
._151:\n\
	ldrh	r0, [r5]\n\
	add	r0, r0, #0x1\n\
	strh	r0, [r5]\n\
	b	._165\n\
._159:\n\
	.align	2, 0\n\
._158:\n\
	.word	gUnknown_Debug_0839AE94\n\
	.word	gUnknown_Debug_0839AE99\n\
	.word	gUnknown_Debug_0839AEA7\n\
	.word	gUnknown_Debug_0839AE9D\n\
._155:\n\
	bl	RtcCalcLocalTime\n\
	add	r0, r6, #0\n\
	bl	FormatHexRtcTime\n\
	mov	r2, #0x14\n\
	add	r2, r2, r6\n\
	mov	r9, r2\n\
	mov	r0, r9\n\
	bl	debug_sub_8009894\n\
	mov	r0, #0x28\n\
	add	r0, r0, r6\n\
	mov	sl, r0\n\
	ldr	r4, ._163       @ gLocalTime\n\
	mov	r1, #0x2\n\
	ldsb	r1, [r4, r1]\n\
	mov	r2, #0x3\n\
	ldsb	r2, [r4, r2]\n\
	mov	r3, #0x4\n\
	ldsb	r3, [r4, r3]\n\
	bl	FormatDecimalTime\n\
	mov	r1, #0x3c\n\
	add	r1, r1, r6\n\
	mov	r8, r1\n\
	mov	r2, #0x0\n\
	ldsh	r1, [r4, r2]\n\
	mov	r0, r8\n\
	mov	r2, #0x1\n\
	mov	r3, #0x4\n\
	bl	ConvertIntToDecimalStringN\n\
	ldr	r0, ._163 + 4   @ gSaveBlock2\n\
	ldrb	r0, [r0, #0x12]\n\
	cmp	r0, #0\n\
	bne	._160	@cond_branch\n\
	add	r0, r6, #0\n\
	mov	r1, #0x14\n\
	mov	r2, #0xe\n\
	bl	Menu_PrintText\n\
	mov	r0, r9\n\
	mov	r1, #0xc\n\
	mov	r2, #0xe\n\
	bl	Menu_PrintText\n\
	mov	r0, sl\n\
	mov	r1, #0x14\n\
	mov	r2, #0x10\n\
	bl	Menu_PrintText\n\
	mov	r0, r8\n\
	mov	r1, #0xc\n\
	mov	r2, #0x10\n\
	bl	Menu_PrintText\n\
._160:\n\
	ldrh	r1, [r5, #0x2]\n\
	mov	r2, #0x2\n\
	ldsh	r0, [r5, r2]\n\
	cmp	r0, #0x13\n\
	ble	._161	@cond_branch\n\
	add	r0, r1, #1\n\
	strh	r0, [r5, #0x2]\n\
	b	._165\n\
._164:\n\
	.align	2, 0\n\
._163:\n\
	.word	gLocalTime\n\
	.word	gSaveBlock2\n\
._161:\n\
	ldr	r0, ._166       @ gMain\n\
	ldrh	r1, [r0, #0x2e]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._165	@cond_branch\n\
	bl	Menu_EraseScreen\n\
	add	r0, r7, #0\n\
	bl	DestroyTask\n\
	bl	ScriptContext2_Disable\n\
._165:\n\
	pop	{r3, r4, r5}\n\
	mov	r8, r3\n\
	mov	r9, r4\n\
	mov	sl, r5\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r0}\n\
	bx	r0\n\
._167:\n\
	.align	2, 0\n\
._166:\n\
	.word	gMain");
}

#endif