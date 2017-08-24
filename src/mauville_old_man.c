#include "global.h"
#include "bard_music.h"
#include "mauville_old_man.h"
#include "easy_chat.h"
#include "easy_chat_constants.h"
#include "event_data.h"
#include "m4a.h"
#include "menu.h"
#include "rom4.h"
#include "rng.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "trader.h"

#define MACRO1(a) (((a) % 4) + (((a) / 8) & 1))

extern struct MusicPlayerInfo gMPlay_SE2;

extern u16 gScriptResult;
extern u16 gSpecialVar_0x8004;
extern struct UnkBard2 gUnknown_03005DA0;

extern u16 gUnknown_020388BC;  // set but not used?

const u16 gDefaultBardSongLyrics[] =
{
#ifdef ENGLISH
    EC_WORD_SISTER,
    EC_WORD_EATS,
    EC_WORD_SWEETS,
    EC_WORD_VORACIOUS,
    EC_WORD_AND,
    EC_WORD_DROOLING,
#else
    EC_WORD_SISTER,
    EC_WORD_MUST_BE,
    EC_WORD_SWEETS,
    EC_WORD_VORACIOUS,
    EC_WORD_DROOLING,
    EC_WORD_THICK,
#endif
};

const u8 *const gGiddyAdjectives[] =
{
    OtherText_SoPretty,
    OtherText_SoDarling,
    OtherText_SoRelaxed,
    OtherText_SoSunny,
    OtherText_SoDesirable,
    OtherText_SoExciting,
    OtherText_SoAmusing,
    OtherText_SoMagical,
};

const u8 *const gGiddyQuestions[] =
{
    OtherText_WantVacationNicePlace,
    OtherText_BoughtCrayonsIsNice,
    OtherText_IfWeCouldFloat,
    OtherText_SandWashesAwayMakeSad,
    OtherText_WhatsBottomSeaLike,
    OtherText_SeeSettingSun,
    OtherText_LyingInGreenGrass,
    OtherText_SecretBasesWonderful,
};

void sub_80F8184(u8);
void sub_80F8428(void);

void SetupBard(void)
{
    u16 i;
    struct MauvilleManBard *bard = &gSaveBlock1.oldMan.bard;

    bard->id = MAUVILLE_MAN_BARD;
    bard->unk_2DBD = 0;
    for (i = 0; i < 6; i++)
        bard->songLyrics[i] = gDefaultBardSongLyrics[i];
}

void SetupHipster(void)
{
    struct MauvilleManHipster *hipster = &gSaveBlock1.oldMan.hipster;

    hipster->id = MAUVILLE_MAN_HIPSTER;
    hipster->unk1 = 0;
}

void SetupStoryteller(void)
{
    StorytellerSetup();
}

void SetupGiddy(void)
{
    struct MauvilleManGiddy *giddy = &gSaveBlock1.oldMan.giddy;

    giddy->id = MAUVILLE_MAN_GIDDY;
    giddy->unk1 = 0;
}

void SetupTrader(void)
{
    TraderSetup();
}

void SetupMauvilleOldMan(void)
{
    u16 trainerId = (gSaveBlock2.playerTrainerId[1] << 8) | gSaveBlock2.playerTrainerId[0];

    // Determine man based on the last digit of the player's trainer ID.
    switch ((trainerId % 10) / 2)
    {
    case MAUVILLE_MAN_BARD:
        SetupBard();
        break;
    case MAUVILLE_MAN_HIPSTER:
        SetupHipster();
        break;
    case MAUVILLE_MAN_TRADER:
        SetupTrader();
        break;
    case MAUVILLE_MAN_STORYTELLER:
        SetupStoryteller();
        break;
    case MAUVILLE_MAN_GIDDY:
        SetupGiddy();
        break;
    }
    sub_80F83D0();
}

/*
// Safely changes man to test functionality
u8 GetCurrentMauvilleOldMan(void)
{
    u8 newMan = MAUVILLE_MAN_GIDDY;
    struct MauvilleManCommon *common = &gSaveBlock1.oldMan.common;

    if (common->id != newMan)
    {
        switch (newMan)
        {
        case MAUVILLE_MAN_BARD:
            SetupBard();
            break;
        case MAUVILLE_MAN_HIPSTER:
            SetupHipster();
            break;
        case MAUVILLE_MAN_TRADER:
            SetupTrader();
            break;
        case MAUVILLE_MAN_STORYTELLER:
            SetupStoryteller();
            break;
        case MAUVILLE_MAN_GIDDY:
            SetupGiddy();
            break;
        }
        sub_80F83D0();
    }
    return common->id;
}
*/

u8 GetCurrentMauvilleOldMan(void)
{
    struct MauvilleManCommon *common = &gSaveBlock1.oldMan.common;

    return common->id;
}

void sub_80F7B14(void)
{
    gScriptResult = GetCurrentMauvilleOldMan();
}

void sub_80F7B2C(void)
{
    u16 *scriptPtr = &gScriptResult; // why??
    OldMan *oldMan = &gSaveBlock1.oldMan;

    *scriptPtr = oldMan->bard.unk_2DBD;
}

void sub_80F7B40(void)
{
    u16 i;
    struct MauvilleManBard *bard = &gSaveBlock1.oldMan.bard;

    StringCopy(bard->playerName, gSaveBlock2.playerName);

    for(i = 0; i < 4; i++)
        bard->playerTrainerId[i] = gSaveBlock2.playerTrainerId[i];

    for(i = 0; i < 6; i++)
        bard->songLyrics[i] = bard->mauvilleOldMan_ecArray2[i];

    bard->unk_2DBD = 1;
}

void sub_80F7BA0(void)
{
    struct MauvilleManBard *oldMan = &gSaveBlock1.oldMan.bard;
    u16 specialVar = gSpecialVar_0x8004;  // It's a bit odd to use this temp variable, but it seems needed to match.
    u16 *r5;
    u16 i;
    u8 *ptr;
    u8 *r4;

    r5 = oldMan->mauvilleOldMan_ecArray2;
    if (specialVar == 0)
        r5 = oldMan->songLyrics;
    ptr = gStringVar4;
    r4 = ptr;
    for (i = 0; i < 2; i++)
    {
        ptr = sub_80EB3FC(ptr, *(r5++));
        while (ptr != r4)
        {
            if (*r4 == 0)
                *r4 = 0x37;
            r4++;
        }
        r4++;
        *(ptr++) = 0;
        ptr = sub_80EB3FC(ptr, *(r5++));
        while (ptr != r4)
        {
            if (*r4 == 0)
                *r4 = 0x37;
            r4++;
        }
        r4++;
        *(ptr++) = 0xFE;
        ptr = sub_80EB3FC(ptr, *(r5++));
        while (ptr != r4)
        {
            if (*r4 == 0)
                *r4 = 0x37;
            r4++;
        }
        //_080F7C2A
        if (i == 0)
        {
            *(ptr++) = EXT_CTRL_CODE_BEGIN;
            *(ptr++) = 0xF;
        }
    }
}

void sub_80F7C54(void)
{
    sub_80F7F80(gSpecialVar_0x8004);
    MenuDisplayMessageBox();
    ScriptContext1_Stop();
}

void sub_80F7C70(void)
{
    u16 *scriptPtr = &gScriptResult; // again??
    OldMan *oldMan = &gSaveBlock1.oldMan;

    *scriptPtr = oldMan->bard.unk_2D95;
}

void sub_80F7C84(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    oldMan->bard.unk_2D95 = 1;
}

void sub_80F7C90(void)
{
    u16 var = sub_80EB8EC();

    if(var == 0xFFFF)
    {
        gScriptResult = FALSE;
    }
    else
    {
        sub_80EB3FC(gStringVar1, var);
        gScriptResult = TRUE;
    }
}

void sub_80F7CC8(void)
{
    OldMan *oldMan = &gSaveBlock1.oldMan;

    if (oldMan->bard.unk_2D95 == 10)
    {
        gScriptResult = FALSE;
        oldMan->bard.unk_2D95 = 0;
    }
    else
    {
        gScriptResult = TRUE;
    }
}

void ScrSpecial_GenerateGiddyLine(void)
{
    struct MauvilleManGiddy *giddy = &gSaveBlock1.oldMan.giddy;

    if (giddy->unk1 == 0)
        sub_80F7DC0();

    if (giddy->mauvilleOldMan_ecArray[giddy->unk1] != 0xFFFF) // is not the last element of the array?
    {
        u8 *stringPtr;
        u32 adjective = Random();

        adjective %= 8;
        stringPtr = sub_80EB3FC(gStringVar4, giddy->mauvilleOldMan_ecArray[giddy->unk1]);
        stringPtr = StringCopy(stringPtr, gOtherText_Is);
        stringPtr = StringCopy(stringPtr, gGiddyAdjectives[adjective]);
        StringCopy(stringPtr, gOtherText_DontYouAgree);
    }
    else
    {
        StringCopy(gStringVar4, gGiddyQuestions[giddy->questionList[giddy->questionNum++]]);
    }

    if (!(Random() % 10))
        giddy->unk1 = 10;
    else
        giddy->unk1++;

    gScriptResult = TRUE;
}

#ifdef NONMATCHING
void sub_80F7DC0(void)
{
    u16 arr[][2] =
    {
        { 0x0, 0},
        { 0xC, 0},
        { 0xD, 0},
        {0x12, 0},
        {0x13, 0},
        {0x15, 0},
    };
    u16 i;
    u16 r10;
    u16 r7;

    for (i = 0; i < 8; i++)
    {
        struct MauvilleManGiddy *giddy = &gSaveBlock1.oldMan.giddy;

        //gSaveBlock1.oldMan.giddy.questionList[i] = i;
        giddy->questionList[i] = i;
    }

    // Scramble questions
    for (i = 0; i < 8; i++)
    {
        struct MauvilleManGiddy *giddy = &gSaveBlock1.oldMan.giddy;

        /*
        u16 r1 = Random() % (i + 1);
        u8 r7 = gSaveBlock1.oldMan.giddy.questionList[i];
        gSaveBlock1.oldMan.giddy.questionList[i] = gSaveBlock1.oldMan.giddy.questionList[r1];
        gSaveBlock1.oldMan.giddy.questionList[r1] = r7;
        */
        u16 r1 = Random() % (i + 1);
        u8 r7 = giddy->questionList[i];
        giddy->questionList[i] = giddy->questionList[r1];
        giddy->questionList[r1] = r7;
    }

    r10 = 0;
    for (i = 0; i < 6; i++)
    {
        arr[i][1] = sub_80EAE88(arr[i][0]);
        r10 += arr[i][1];
    }

    {
        struct MauvilleManGiddy *giddy = &gSaveBlock1.oldMan.giddy;
        giddy->questionNum = 0;
    }
    //gSaveBlock1.oldMan.giddy.questionNum = 0;

    r7 = 0;
    for (i = 0; i < 10; i++)
    {
        struct MauvilleManGiddy *giddy = &gSaveBlock1.oldMan.giddy;

        u16 var = Random() % 10;
        if (var < 3 && r7 < 8)
        {
            //gSaveBlock1.oldMan.giddy.mauvilleOldMan_ecArray[i] = 0xFFFF;
            giddy->mauvilleOldMan_ecArray[i] = 0xFFFF;
            r7++;
        }
        //_080F7E90
        else
        {
            s16 r2 = Random() % r10;

            u16 r1 = 0;

            while (i < 6)  // comparing the wrong variable
            {
                r2 = arr[r1][1] - r2;
                if (r2 <= 0)
                    break;
                r1++;
            }

            if (r1 == 6)
                r1 = 0;
            //gSaveBlock1.oldMan.giddy.mauvilleOldMan_ecArray[i] = sub_80EB784(arr[r1][0]);
            giddy->mauvilleOldMan_ecArray[i] = sub_80EB784(arr[r1][0]);
        }
    }
}
#else

const u16 gUnknown_083E53C8[][2] =
{
    { 0x0, 0},
    { 0xC, 0},
    { 0xD, 0},
    {0x12, 0},
    {0x13, 0},
    {0x15, 0},
};

__attribute__((naked))
void sub_80F7DC0(void)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x18\n\
	ldr r1, _080F7E84 @ =gUnknown_083E53C8\n\
	mov r0, sp\n\
	movs r2, 0x18\n\
	bl memcpy\n\
	movs r5, 0\n\
	movs r0, 0x2\n\
	add r0, sp\n\
	mov r8, r0\n\
	ldr r1, _080F7E88 @ =gSaveBlock1 + 0x2D94\n\
	adds r1, 0x18\n\
	adds r3, r1, 0\n\
_080F7DE4:\n\
	adds r0, r3, r5\n\
	strb r5, [r0]\n\
	adds r0, r5, 0x1\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	cmp r5, 0x7\n\
	bls _080F7DE4\n\
	movs r5, 0\n\
	ldr r2, _080F7E88 @ =gSaveBlock1 + 0x2D94\n\
	adds r2, 0x4\n\
	mov r9, r2\n\
	adds r6, r1, 0\n\
_080F7DFC:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	adds r4, r5, 0x1\n\
	adds r1, r4, 0\n\
	bl __modsi3\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	adds r2, r6, r5\n\
	ldrb r7, [r2]\n\
	adds r1, r6, r1\n\
	ldrb r0, [r1]\n\
	strb r0, [r2]\n\
	strb r7, [r1]\n\
	lsls r4, 16\n\
	lsrs r5, r4, 16\n\
	cmp r5, 0x7\n\
	bls _080F7DFC\n\
	movs r3, 0\n\
	mov r10, r3\n\
	movs r5, 0\n\
_080F7E2A:\n\
	lsls r4, r5, 2\n\
	mov r1, sp\n\
	adds r0, r1, r4\n\
	ldrb r0, [r0]\n\
	bl sub_80EAE88\n\
	add r4, r8\n\
	strh r0, [r4]\n\
	add r0, r10\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	mov r10, r0\n\
	adds r0, r5, 0x1\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	cmp r5, 0x5\n\
	bls _080F7E2A\n\
	movs r0, 0\n\
	ldr r2, _080F7E88 @ =gSaveBlock1 + 0x2D94\n\
	strb r0, [r2, 0x2]\n\
	movs r7, 0\n\
	movs r5, 0\n\
_080F7E56:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0xA\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	cmp r1, 0x2\n\
	bhi _080F7E90\n\
	cmp r7, 0x7\n\
	bhi _080F7E90\n\
	lsls r0, r5, 1\n\
	add r0, r9\n\
	ldr r1, _080F7E8C @ =0x0000ffff\n\
	strh r1, [r0]\n\
	adds r0, r7, 0x1\n\
	lsls r0, 16\n\
	lsrs r7, r0, 16\n\
	adds r4, r5, 0x1\n\
	b _080F7EE2\n\
	.align 2, 0\n\
_080F7E84: .4byte gUnknown_083E53C8\n\
_080F7E88: .4byte gSaveBlock1 + 0x2D94\n\
_080F7E8C: .4byte 0x0000ffff\n\
_080F7E90:\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	mov r1, r10\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	lsrs r2, r0, 16\n\
	movs r1, 0\n\
	adds r4, r5, 0x1\n\
	lsls r6, r5, 1\n\
	cmp r5, 0x5\n\
	bhi _080F7ECC\n\
	mov r3, r8\n\
	ldrh r0, [r3]\n\
	b _080F7EC2\n\
_080F7EB2:\n\
	adds r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	cmp r5, 0x5\n\
	bhi _080F7ECC\n\
	lsls r0, r1, 2\n\
	adds r0, r3, r0\n\
	ldrh r0, [r0]\n\
_080F7EC2:\n\
	subs r0, r2, r0\n\
	lsls r0, 16\n\
	lsrs r2, r0, 16\n\
	cmp r0, 0\n\
	bgt _080F7EB2\n\
_080F7ECC:\n\
	cmp r1, 0x6\n\
	bne _080F7ED2\n\
	movs r1, 0\n\
_080F7ED2:\n\
	lsls r0, r1, 2\n\
	add r0, sp\n\
	ldrh r0, [r0]\n\
	bl sub_80EB784\n\
	mov r2, r9\n\
	adds r1, r2, r6\n\
	strh r0, [r1]\n\
_080F7EE2:\n\
	lsls r0, r4, 16\n\
	lsrs r5, r0, 16\n\
	cmp r5, 0x9\n\
	bls _080F7E56\n\
	add sp, 0x18\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided\n");
}
#endif

void sub_80F7EFC(void)
{
    struct MauvilleManBard *bard = &gSaveBlock1.oldMan.bard;

    bard->unk_2DBD = 0;
}

void sub_80F7F0C(void)
{
    struct MauvilleManHipster *hipster = &gSaveBlock1.oldMan.hipster;

    hipster->unk1 = 0;
}

void sub_80F7F18(void)
{
    sub_8109A20();
}

void sub_80F7F24(void)
{
    sub_80F8428();
}

void sub_80F7F30(void)
{
    switch (GetCurrentMauvilleOldMan())
    {
    case MAUVILLE_MAN_BARD:
        sub_80F7EFC();
        break;
    case MAUVILLE_MAN_HIPSTER:
        sub_80F7F0C();
        break;
    case MAUVILLE_MAN_STORYTELLER:
        sub_80F7F24();
        break;
    case MAUVILLE_MAN_TRADER:
        sub_80F7F18();
        break;
    case MAUVILLE_MAN_GIDDY:
        break;
    }
    sub_80F83D0();
}

void sub_80F7F80(u8 a)
{
    u8 taskId = CreateTask(sub_80F8184, 0x50);

    gTasks[taskId].data[5] = a;
}

void BardSingWord(struct Task *task, struct UnkBard2 *b)
{
    switch (task->data[0])
    {
    case 0:
        {
            struct MauvilleManBard *bard = &gSaveBlock1.oldMan.bard;
            u16 *r2;
            s32 i;

            if (gSpecialVar_0x8004 == 0)
                r2 = bard->songLyrics;
            else
                r2 = bard->mauvilleOldMan_ecArray2;
            for (i = 0; i < 6; i++)
                b->var0C[i] = r2[i];
            for (i = 0; i < 6; i++)
            {
                b->var18[i].var00 = 0xFFFF;
                b->var18[i].var02 = 0;
                b->var18[i].var04 = 0;
                b->var18[i].var06 = 0;
            }
            b->var00 = 0;
            b->var01 = 0;
            b->var04 = 0;
        }
        break;
    case 1:
        break;
    case 2:
        {
            u16 r4 = b->var0C[b->var00];
            // TODO: fix this return type
            struct UnkBard *r1 = (struct UnkBard *)sub_814A2D0(r4 / 0x200, r4 % 0x200);

            b->var04 = 0;
            sub_814A2EC(b, r1, (r4 % 4) + ((r4 / 8) & 1));
        }
        break;
    case 3:
    case 4:
        {
            struct UnkBard3 *r7 = &b->var18[b->var01];

            switch (b->var03)
            {
            case 0:
                if (b->var02 == 0)
                {
                    if (b->var01 == 6 || r7->var00 == 0xFF)
                    {
                        b->var03 = 0xFE;
                        break;
                    }
                    b->var02 = r7->var02;
                    if (r7->var00 <= 50)
                    {
                        u16 r1 = r7->var00 / 3;

                        m4aSongNumStart(249 + r1 * 3);
                    }
                    b->var03 = 1;
                }
                else
                {
                    if (b->var0A > 10)
                        b->volume -= 2;
                    if (b->var0A & 1)
                        b->pitch += 64;
                    else
                        b->pitch -= 64;
                    m4aMPlayVolumeControl(&gMPlay_SE2, 0xFFFF, b->volume);
                    m4aMPlayPitchControl(&gMPlay_SE2, 0xFFFF, b->pitch);
                    b->var0A++;
                }
                b->var02--;
                break;
            case 1:
                b->var01++;
                b->var03 = 0;
                if (r7->var00 <= 50)
                {
                    b->volume = 0x100 + r7->var06 * 16;
                    m4aMPlayVolumeControl(&gMPlay_SE2, 0xFFFF, b->volume);
                    b->pitch = 0x200 + r7->var04;
                    m4aMPlayPitchControl(&gMPlay_SE2, 0xFFFF, b->pitch);
                }
                break;
            case 0xFE:
                m4aMPlayStop(&gMPlay_SE2);
                b->var03 = 0xFF;
                break;
            }
        }
        break;
    case 5:
        break;
    }
}

void sub_80F8184(u8 taskId)
{
    struct Task *task = &gTasks[taskId];  // r5

    BardSingWord(task, &gUnknown_03005DA0);
    switch (task->data[0])
    {
    case 0:
        sub_80F7BA0();
        InitWindowFromConfig(gMenuWindowPtr, &gWindowConfig_81E6CE4);
        sub_8002EB0(gMenuWindowPtr, gStringVar4, 2, 4, 15);
        task->data[1] = 0;
        task->data[2] = 0;
        task->data[3] = 0;
        task->data[4] = 0;
        FadeOutBGMTemporarily(4);
        task->data[0] = 1;
        break;
    case 1:
        if (IsBGMPausedOrStopped())
            task->data[0] = 2;
        break;
    case 2:
        {
            struct MauvilleManBard *bard = &gSaveBlock1.oldMan.bard;
            u8 *string = gStringVar4 + task->data[3];
            u16 wordLen = 0;
            // Can't get it to match without hacking
            u32 temp;
            register s16 zero asm("r1");

            while (*string != CHAR_SPACE
                && *string != CHAR_NEWLINE
                && *string != EXT_CTRL_CODE_BEGIN
                && *string != EOS)
            {
                string++;
                wordLen++;
            }
            if (task->data[5] == 0)
                gUnknown_020388BC = MACRO1(bard->songLyrics[task->data[4]]);
            else
                gUnknown_020388BC = MACRO1(bard->mauvilleOldMan_ecArray2[task->data[4]]);
            temp = gUnknown_03005DA0.var04 / wordLen;
            zero = 0;
            gUnknown_03005DA0.var04 = temp;
            if (gUnknown_03005DA0.var04 <= 0)
                gUnknown_03005DA0.var04 = 1;
            task->data[4]++;
            if (task->data[2] == 0)
                task->data[0] = 3;
            else
                task->data[0] = 5;
            task->data[1] = zero;
        }
        break;
    case 5:
        if (task->data[2] == 0)
            task->data[0] = 3;
        else
            task->data[2]--;
        break;
    case 3:
        if (gStringVar4[task->data[3]] == EOS)
        {
            FadeInNewBGM(BGM_POKECEN, 6);
            m4aMPlayFadeOutTemporarily(&gMPlay_SE2, 2);
            EnableBothScriptContexts();
            DestroyTask(taskId);
        }
        else if (gStringVar4[task->data[3]] == CHAR_SPACE)
        {
            sub_8003418(gMenuWindowPtr);
            task->data[3]++;
            task->data[0] = 2;
            task->data[2] = 0;
        }
        else if (gStringVar4[task->data[3]] == CHAR_NEWLINE)
        {
            task->data[3]++;
            task->data[0] = 2;
            task->data[2] = 0;
        }
        else if (gStringVar4[task->data[3]] == EXT_CTRL_CODE_BEGIN)
        {
            task->data[3] += 2;  // skip over control codes
            task->data[0] = 2;
            task->data[2] = 8;
        }
        else if (gStringVar4[task->data[3]] == 0x37)  // What is 0x37 supposed to be?
        {
            gStringVar4[task->data[3]] = 0;
            sub_8003418(gMenuWindowPtr);
            task->data[3]++;
            task->data[2] = 0;
        }
        else
        {
            switch (task->data[1])
            {
            case 0:
                sub_8003418(gMenuWindowPtr);
                task->data[1]++;
                break;
            case 1:
                task->data[1]++;
                break;
            case 2:
                task->data[3]++;
                task->data[1] = 0;
                task->data[2] = gUnknown_03005DA0.var04;
                task->data[0] = 4;
                break;
            }
        }
        break;
    case 4:
        task->data[2]--;
        if (task->data[2] == 0)
            task->data[0] = 3;
        break;
    }
}

void sub_80F83D0(void)
{
    VarSet(0x4010, 0x45 + GetCurrentMauvilleOldMan());
}

void StorytellerSetup(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.oldMan.storyteller;
    s32 i;

    storyteller->id = MAUVILLE_MAN_STORYTELLER;
    storyteller->unk1 = 0;
    for (i = 0; i < 4; i++)
    {
        storyteller->unk4[i] = 0;
        storyteller->unk8[0][i] = EOS;  // Maybe they meant storyteller->unk8[i][0] instead?
    }
}

void sub_80F8428(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.oldMan.storyteller;

    storyteller->id = MAUVILLE_MAN_STORYTELLER;
    storyteller->unk1 = 0;
}

u32 sub_80F8438(u8 stat)
{
    if (stat == 50)
        stat = 0;
    GetGameStat(stat);
}

struct UnknownStruct1
{
    u8 unk0;
    u8 unk1;
    const u8 *unk4;
    const u8 *unk8;
    const u8 *unkC;
};

extern const struct UnknownStruct1 gUnknown_083E53E0[];

const struct UnknownStruct1 *sub_80F844C(u32 a)
{
    s32 i;

    for (i = 0; i < 36; i++)
    {
        if (gUnknown_083E53E0[i].unk0 == a)
            return &gUnknown_083E53E0[i];
    }
    return &gUnknown_083E53E0[35];
}

const u8 *sub_80F8478(u32 a)
{
    return sub_80F844C(a)->unk4;
}

const u8 *sub_80F8484(u32 a)
{
    return sub_80F844C(a)->unkC;
}

const u8 *sub_80F8490(u32 a)
{
    return sub_80F844C(a)->unk8;
}

u8 sub_80F849C(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        struct MauvilleManStoryteller *storyteller = &gSaveBlock1.oldMan.storyteller;

        if (storyteller->unk4[i] == 0)
            break;
    }
    return i;
}

u32 sub_80F84C8(u32 a)
{
    u8 *ptr = gSaveBlock1.oldMan.storyteller.unk24[a];

    return ptr[0] | (ptr[1] << 8) | (ptr[2] << 16) | (ptr[3] << 24);
}

void sub_80F84EC(u32 a, u32 b)
{
    u8 *ptr = gSaveBlock1.oldMan.storyteller.unk24[a];

    ptr[0] = b;
    ptr[1] = b >> 8;
    ptr[2] = b >> 16;
    ptr[3] = b >> 24;
}

bool8 sub_80F8508(u32 a)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.oldMan.storyteller;

    if (sub_80F8438(storyteller->unk4[a]) > sub_80F84C8(a))
        return TRUE;
    else
        return FALSE;
}

void sub_80F8534(u32 a, void *b)
{
    u8 *ptr = gSaveBlock1.oldMan.storyteller.unk8[a];

    memset(b, 0xFF, 8);
    memcpy(b, ptr, 7);
}

void sub_80F8560(u32 a, const u8 *b)
{
    u8 *ptr = gSaveBlock1.oldMan.storyteller.unk8[a];
    u8 len = StringLength(b);

    memset(ptr, 0xFF, 7);
    StringCopyN(ptr, b, len);
}

void sub_80F8598(u32 a, u32 b)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.oldMan.storyteller;

    storyteller->unk4[a] = b;
    sub_80F8560(a, gSaveBlock2.playerName);
    sub_80F84EC(a, sub_80F8438(b));
    ConvertIntToDecimalStringN(gStringVar1, sub_80F8438(b), 0, 10);
    StringCopy(gStringVar2, sub_80F8490(b));
}
