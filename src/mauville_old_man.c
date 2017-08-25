#include "global.h"
#include "bard_music.h"
#include "mauville_old_man.h"
#include "easy_chat.h"
#include "easy_chat_constants.h"
#include "event_data.h"
#include "field_message_box.h"
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

extern const u8 gTextStoryteller_Story1Title[];
extern const u8 gTextStoryteller_Story1Action[];
extern const u8 gTextStoryteller_Story1Text[];
extern const u8 gTextStoryteller_Story2Title[];
extern const u8 gTextStoryteller_Story2Action[];
extern const u8 gTextStoryteller_Story2Text[];
extern const u8 gTextStoryteller_Story3Title[];
extern const u8 gTextStoryteller_Story3Action[];
extern const u8 gTextStoryteller_Story3Text[];
extern const u8 gTextStoryteller_Story4Title[];
extern const u8 gTextStoryteller_Story4Action[];
extern const u8 gTextStoryteller_Story4Text[];
extern const u8 gTextStoryteller_Story5Title[];
extern const u8 gTextStoryteller_Story5Action[];
extern const u8 gTextStoryteller_Story5Text[];
extern const u8 gTextStoryteller_Story6Title[];
extern const u8 gTextStoryteller_Story6Action[];
extern const u8 gTextStoryteller_Story6Text[];
extern const u8 gTextStoryteller_Story7Title[];
extern const u8 gTextStoryteller_Story7Action[];
extern const u8 gTextStoryteller_Story7Text[];
extern const u8 gTextStoryteller_Story8Title[];
extern const u8 gTextStoryteller_Story8Action[];
extern const u8 gTextStoryteller_Story8Text[];
extern const u8 gTextStoryteller_Story9Title[];
extern const u8 gTextStoryteller_Story9Action[];
extern const u8 gTextStoryteller_Story9Text[];
extern const u8 gTextStoryteller_Story10Title[];
extern const u8 gTextStoryteller_Story10Action[];
extern const u8 gTextStoryteller_Story10Text[];
extern const u8 gTextStoryteller_Story11Title[];
extern const u8 gTextStoryteller_Story11Action[];
extern const u8 gTextStoryteller_Story11Text[];
extern const u8 gTextStoryteller_Story12Title[];
extern const u8 gTextStoryteller_Story12Action[];
extern const u8 gTextStoryteller_Story12Text[];
extern const u8 gTextStoryteller_Story13Title[];
extern const u8 gTextStoryteller_Story13Action[];
extern const u8 gTextStoryteller_Story13Text[];
extern const u8 gTextStoryteller_Story14Title[];
extern const u8 gTextStoryteller_Story14Action[];
extern const u8 gTextStoryteller_Story14Text[];
extern const u8 gTextStoryteller_Story15Title[];
extern const u8 gTextStoryteller_Story15Action[];
extern const u8 gTextStoryteller_Story15Text[];
extern const u8 gTextStoryteller_Story16Title[];
extern const u8 gTextStoryteller_Story16Action[];
extern const u8 gTextStoryteller_Story16Text[];
extern const u8 gTextStoryteller_Story17Title[];
extern const u8 gTextStoryteller_Story17Action[];
extern const u8 gTextStoryteller_Story17Text[];
extern const u8 gTextStoryteller_Story18Title[];
extern const u8 gTextStoryteller_Story18Action[];
extern const u8 gTextStoryteller_Story18Text[];
extern const u8 gTextStoryteller_Story19Title[];
extern const u8 gTextStoryteller_Story19Action[];
extern const u8 gTextStoryteller_Story19Text[];
extern const u8 gTextStoryteller_Story20Title[];
extern const u8 gTextStoryteller_Story20Action[];
extern const u8 gTextStoryteller_Story20Text[];
extern const u8 gTextStoryteller_Story21Title[];
extern const u8 gTextStoryteller_Story21Action[];
extern const u8 gTextStoryteller_Story21Text[];
extern const u8 gTextStoryteller_Story22Title[];
extern const u8 gTextStoryteller_Story22Action[];
extern const u8 gTextStoryteller_Story22Text[];
extern const u8 gTextStoryteller_Story23Title[];
extern const u8 gTextStoryteller_Story23Action[];
extern const u8 gTextStoryteller_Story23Text[];
extern const u8 gTextStoryteller_Story24Title[];
extern const u8 gTextStoryteller_Story24Action[];
extern const u8 gTextStoryteller_Story24Text[];
extern const u8 gTextStoryteller_Story25Title[];
extern const u8 gTextStoryteller_Story25Action[];
extern const u8 gTextStoryteller_Story25Text[];
extern const u8 gTextStoryteller_Story26Title[];
extern const u8 gTextStoryteller_Story26Action[];
extern const u8 gTextStoryteller_Story26Text[];
extern const u8 gTextStoryteller_Story27Title[];
extern const u8 gTextStoryteller_Story27Action[];
extern const u8 gTextStoryteller_Story27Text[];
extern const u8 gTextStoryteller_Story28Title[];
extern const u8 gTextStoryteller_Story28Action[];
extern const u8 gTextStoryteller_Story28Text[];
extern const u8 gTextStoryteller_Story29Title[];
extern const u8 gTextStoryteller_Story29Action[];
extern const u8 gTextStoryteller_Story29Text[];
extern const u8 gTextStoryteller_Story30Title[];
extern const u8 gTextStoryteller_Story30Action[];
extern const u8 gTextStoryteller_Story30Text[];
extern const u8 gTextStoryteller_Story31Title[];
extern const u8 gTextStoryteller_Story31Action[];
extern const u8 gTextStoryteller_Story31Text[];
extern const u8 gTextStoryteller_Story32Title[];
extern const u8 gTextStoryteller_Story32Action[];
extern const u8 gTextStoryteller_Story32Text[];
extern const u8 gTextStoryteller_Story33Title[];
extern const u8 gTextStoryteller_Story33Action[];
extern const u8 gTextStoryteller_Story33Text[];
extern const u8 gTextStoryteller_Story34Title[];
extern const u8 gTextStoryteller_Story34Action[];
extern const u8 gTextStoryteller_Story34Text[];
extern const u8 gTextStoryteller_Story35Title[];
extern const u8 gTextStoryteller_Story35Action[];
extern const u8 gTextStoryteller_Story35Text[];
extern const u8 gTextStoryteller_Story36Title[];
extern const u8 gTextStoryteller_Story36Action[];
extern const u8 gTextStoryteller_Story36Text[];

extern struct BardSong gUnknown_03005DA0;

extern u16 gUnknown_020388BC;  // set but not used?

static const u16 gDefaultBardSongLyrics[] =
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

static const u8 *const gGiddyAdjectives[] =
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

static const u8 *const gGiddyQuestions[] =
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

void Task_BardSong(u8);
void StartBardSong(u8);
void StorytellerSetup(void);
void sub_80F8428(void);

void SetupBard(void)
{
    u16 i;
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    bard->id = MAUVILLE_MAN_BARD;
    bard->hasChangedSong = FALSE;
    for (i = 0; i < 6; i++)
        bard->songLyrics[i] = gDefaultBardSongLyrics[i];
}

void SetupHipster(void)
{
    struct MauvilleManHipster *hipster = &gSaveBlock1.mauvilleMan.hipster;

    hipster->id = MAUVILLE_MAN_HIPSTER;
    hipster->unk1 = 0;
}

void SetupStoryteller(void)
{
    StorytellerSetup();
}

void SetupGiddy(void)
{
    struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;

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

//#define TEST MAUVILLE_MAN_BARD

#ifdef TEST
// Safely changes man to test functionality
u8 GetCurrentMauvilleOldMan(void)
{
    u8 newMan = TEST;
    struct MauvilleManCommon *common = &gSaveBlock1.mauvilleMan.common;

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
#else
u8 GetCurrentMauvilleOldMan(void)
{
    struct MauvilleManCommon *common = &gSaveBlock1.mauvilleMan.common;

    return common->id;
}
#endif

void ScrSpecial_GetCurrentMauvilleMan(void)
{
    gScriptResult = GetCurrentMauvilleOldMan();
}

void ScrSpecial_HasBardSongBeenChanged(void)
{
    u16 *scriptResult = &gScriptResult; // why??
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    *scriptResult = bard->hasChangedSong;
}

void ScrSpecial_SaveBardSongLyrics(void)
{
    u16 i;
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    StringCopy(bard->playerName, gSaveBlock2.playerName);

    for (i = 0; i < 4; i++)
        bard->playerTrainerId[i] = gSaveBlock2.playerTrainerId[i];

    for (i = 0; i < 6; i++)
        bard->songLyrics[i] = bard->temporaryLyrics[i];

    bard->hasChangedSong = TRUE;
}

// Copies lyrics into gStringVar4
void PrepareSongText(void)
{
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;
    u16 specialVar = gSpecialVar_0x8004;  // It's a bit odd to use this temp variable, but it seems needed to match.
    u16 *lyrics;
    u16 lineNum;
    u8 *wordEnd;
    u8 *str;

    lyrics = bard->temporaryLyrics;
    if (specialVar == 0)
        lyrics = bard->songLyrics;
    wordEnd = gStringVar4;
    str = wordEnd;
    // Put three words on each line
    for (lineNum = 0; lineNum < 2; lineNum++)
    {
        wordEnd = EasyChat_GetWordText(wordEnd, *(lyrics++));
        while (wordEnd != str)
        {
            if (*str == CHAR_SPACE)
                *str = CHAR_SONG_WORD_SEPARATOR;
            str++;
        }
        
        str++;
        *(wordEnd++) = CHAR_SPACE;
        
        wordEnd = EasyChat_GetWordText(wordEnd, *(lyrics++));
        while (wordEnd != str)
        {
            if (*str == CHAR_SPACE)
                *str = CHAR_SONG_WORD_SEPARATOR;
            str++;
        }
        
        str++;
        *(wordEnd++) = CHAR_NEWLINE;
        
        wordEnd = EasyChat_GetWordText(wordEnd, *(lyrics++));
        while (wordEnd != str)
        {
            if (*str == CHAR_SPACE)
                *str = CHAR_SONG_WORD_SEPARATOR;
            str++;
        }
        
        if (lineNum == 0)
        {
            *(wordEnd++) = EXT_CTRL_CODE_BEGIN;
            *(wordEnd++) = 15;
        }
    }
}

void ScrSpecial_PlayBardSong(void)
{
    StartBardSong(gSpecialVar_0x8004);
    MenuDisplayMessageBox();
    ScriptContext1_Stop();
}

void ScrSpecial_GetHipsterSpokenFlag(void)
{
    u16 *scriptResult = &gScriptResult; // again??
    struct MauvilleManHipster *hipster = &gSaveBlock1.mauvilleMan.hipster;

    *scriptResult = hipster->unk1;
}

void ScrSpecial_SetHipsterSpokenFlag(void)
{
    struct MauvilleManHipster *hipster = &gSaveBlock1.mauvilleMan.hipster;

    hipster->unk1 = 1;
}

void ScrSpecial_HipsterTeachWord(void)
{
    u16 var = sub_80EB8EC();

    if (var == 0xFFFF)
    {
        gScriptResult = FALSE;
    }
    else
    {
        EasyChat_GetWordText(gStringVar1, var);
        gScriptResult = TRUE;
    }
}

void sub_80F7CC8(void)
{
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    if (bard->unk_2D95 == 10)
    {
        gScriptResult = FALSE;
        bard->unk_2D95 = 0;
    }
    else
    {
        gScriptResult = TRUE;
    }
}

void ScrSpecial_GenerateGiddyLine(void)
{
    struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;

    if (giddy->unk1 == 0)
        sub_80F7DC0();

    if (giddy->mauvilleOldMan_ecArray[giddy->unk1] != 0xFFFF) // is not the last element of the array?
    {
        u8 *stringPtr;
        u32 adjective = Random();

        adjective %= 8;
        stringPtr = EasyChat_GetWordText(gStringVar4, giddy->mauvilleOldMan_ecArray[giddy->unk1]);
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
        struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;

        //gSaveBlock1.mauvilleMan.giddy.questionList[i] = i;
        giddy->questionList[i] = i;
    }

    // Scramble questions
    for (i = 0; i < 8; i++)
    {
        struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;

        /*
        u16 r1 = Random() % (i + 1);
        u8 r7 = gSaveBlock1.mauvilleMan.giddy.questionList[i];
        gSaveBlock1.mauvilleMan.giddy.questionList[i] = gSaveBlock1.mauvilleMan.giddy.questionList[r1];
        gSaveBlock1.mauvilleMan.giddy.questionList[r1] = r7;
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
        struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;
        giddy->questionNum = 0;
    }
    //gSaveBlock1.mauvilleMan.giddy.questionNum = 0;

    r7 = 0;
    for (i = 0; i < 10; i++)
    {
        struct MauvilleManGiddy *giddy = &gSaveBlock1.mauvilleMan.giddy;

        u16 var = Random() % 10;
        if (var < 3 && r7 < 8)
        {
            //gSaveBlock1.mauvilleMan.giddy.mauvilleOldMan_ecArray[i] = 0xFFFF;
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
            //gSaveBlock1.mauvilleMan.giddy.mauvilleOldMan_ecArray[i] = sub_80EB784(arr[r1][0]);
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
    struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;

    bard->hasChangedSong = FALSE;
}

void sub_80F7F0C(void)
{
    struct MauvilleManHipster *hipster = &gSaveBlock1.mauvilleMan.hipster;

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

#define tState data[0]
#define tCharIndex data[3]
#define tCurrWord data[4]
#define tUseTemporaryLyrics data[5]

void StartBardSong(bool8 useTemporaryLyrics)
{
    u8 taskId = CreateTask(Task_BardSong, 0x50);

    gTasks[taskId].tUseTemporaryLyrics = useTemporaryLyrics;
}

void BardSingWord(struct Task *task, struct BardSong *song)
{
    switch (task->tState)
    {
    case 0:  // Initialize song
        {
            struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;
            u16 *lyrics;
            s32 i;

            // Copy lyrics
            if (gSpecialVar_0x8004 == 0)
                lyrics = bard->songLyrics;
            else
                lyrics = bard->temporaryLyrics;
            for (i = 0; i < 6; i++)
                song->lyrics[i] = lyrics[i];
            
            for (i = 0; i < 6; i++)
            {
                song->phonemes[i].sound = 0xFFFF;
                song->phonemes[i].length = 0;
                song->phonemes[i].pitch = 0;
                song->phonemes[i].volume = 0;
            }
            song->currWord = 0;
            song->currPhoneme = 0;
            song->var04 = 0;
        }
        break;
    case 1:  // Wait for BGM to end
        break;
    case 2:  // Initialize word
        {
            u16 word = song->lyrics[song->currWord];
            // TODO: fix this return type
            const struct BardSound *sounds = GetWordSounds(EC_GROUP(word), EC_INDEX(word));

            song->var04 = 0;
            GetWordPhonemes(song, sounds, MACRO1(word));
        }
        break;
    case 3:
    case 4:
        {
            struct BardPhoneme *phoneme = &song->phonemes[song->currPhoneme];

            switch (song->state)
            {
            case 0:
                if (song->phonemeTimer == 0)  // Timer has expired. Move to next phoneme
                {
                    if (song->currPhoneme == 6 || phoneme->sound == 0xFF)
                    {
                        song->state = 0xFE;
                        break;
                    }
                    song->phonemeTimer = phoneme->length;
                    if (phoneme->sound <= 50)
                    {
                        u16 num = phoneme->sound / 3;

                        m4aSongNumStart(249 + num * 3);
                    }
                    song->state = 1;
                }
                else
                {
                    if (song->voiceInflection > 10)
                        song->volume -= 2;
                    if (song->voiceInflection & 1)
                        song->pitch += 64;
                    else
                        song->pitch -= 64;
                    m4aMPlayVolumeControl(&gMPlay_SE2, 0xFFFF, song->volume);
                    m4aMPlayPitchControl(&gMPlay_SE2, 0xFFFF, song->pitch);
                    song->voiceInflection++;
                }
                song->phonemeTimer--;
                break;
            case 1:
                song->currPhoneme++;
                song->state = 0;
                if (phoneme->sound <= 50)
                {
                    song->volume = 0x100 + phoneme->volume * 16;
                    m4aMPlayVolumeControl(&gMPlay_SE2, 0xFFFF, song->volume);
                    song->pitch = 0x200 + phoneme->pitch;
                    m4aMPlayPitchControl(&gMPlay_SE2, 0xFFFF, song->pitch);
                }
                break;
            case 0xFE:
                m4aMPlayStop(&gMPlay_SE2);
                song->state = 0xFF;
                break;
            }
        }
        break;
    case 5:
        break;
    }
}

void Task_BardSong(u8 taskId)
{
    struct Task *task = &gTasks[taskId];  // r5

    BardSingWord(task, &gUnknown_03005DA0);
    switch (task->tState)
    {
    case 0:  // Initialize song
        PrepareSongText();
        InitWindowFromConfig(gMenuWindowPtr, &gWindowConfig_81E6CE4);
        sub_8002EB0(gMenuWindowPtr, gStringVar4, 2, 4, 15);
        task->data[1] = 0;
        task->data[2] = 0;
        task->tCharIndex = 0;
        task->tCurrWord = 0;
        FadeOutBGMTemporarily(4);
        task->tState = 1;
        break;
    case 1:  // Wait for BGM to end
        if (IsBGMPausedOrStopped())
            task->tState = 2;
        break;
    case 2:  // Initialize word
        {
            struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;
            u8 *str = gStringVar4 + task->tCharIndex;
            u16 wordLen = 0;
            // Can't get it to match without hacking
            u32 temp;
            register s16 zero asm("r1");

            while (*str != CHAR_SPACE
                && *str != CHAR_NEWLINE
                && *str != EXT_CTRL_CODE_BEGIN
                && *str != EOS)
            {
                str++;
                wordLen++;
            }
            if (!task->tUseTemporaryLyrics)
                gUnknown_020388BC = MACRO1(bard->songLyrics[task->tCurrWord]);
            else
                gUnknown_020388BC = MACRO1(bard->temporaryLyrics[task->tCurrWord]);
            temp = gUnknown_03005DA0.var04 / wordLen;
            zero = 0;
            gUnknown_03005DA0.var04 = temp;
            if (gUnknown_03005DA0.var04 <= 0)
                gUnknown_03005DA0.var04 = 1;
            task->tCurrWord++;
            if (task->data[2] == 0)
                task->tState = 3;
            else
                task->tState = 5;
            task->data[1] = zero;
        }
        break;
    case 5:
        if (task->data[2] == 0)
            task->tState = 3;
        else
            task->data[2]--;
        break;
    case 3:
        if (gStringVar4[task->tCharIndex] == EOS)
        {
            FadeInNewBGM(BGM_POKECEN, 6);
            m4aMPlayFadeOutTemporarily(&gMPlay_SE2, 2);
            EnableBothScriptContexts();
            DestroyTask(taskId);
        }
        else if (gStringVar4[task->tCharIndex] == CHAR_SPACE)
        {
            sub_8003418(gMenuWindowPtr);
            task->tCharIndex++;
            task->tState = 2;
            task->data[2] = 0;
        }
        else if (gStringVar4[task->tCharIndex] == CHAR_NEWLINE)
        {
            task->tCharIndex++;
            task->tState = 2;
            task->data[2] = 0;
        }
        else if (gStringVar4[task->tCharIndex] == EXT_CTRL_CODE_BEGIN)
        {
            task->tCharIndex += 2;  // skip over control codes
            task->tState = 2;
            task->data[2] = 8;
        }
        else if (gStringVar4[task->tCharIndex] == CHAR_SONG_WORD_SEPARATOR)
        {
            gStringVar4[task->tCharIndex] = CHAR_SPACE;
            sub_8003418(gMenuWindowPtr);
            task->tCharIndex++;
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
                task->tCharIndex++;
                task->data[1] = 0;
                task->data[2] = gUnknown_03005DA0.var04;
                task->tState = 4;
                break;
            }
        }
        break;
    case 4:
        task->data[2]--;
        if (task->data[2] == 0)
            task->tState = 3;
        break;
    }
}

void sub_80F83D0(void)
{
    VarSet(0x4010, 0x45 + GetCurrentMauvilleOldMan());
}

struct Story
{
    u8 unk0;
    u8 unk1;
    const u8 *title;
    const u8 *action;
    const u8 *fullText;
};

static const struct Story sStorytellerStories[] =
{
	{0x32, 1, gTextStoryteller_Story1Title,  gTextStoryteller_Story1Action,  gTextStoryteller_Story1Text},
	{0x02, 1, gTextStoryteller_Story2Title,  gTextStoryteller_Story2Action,  gTextStoryteller_Story2Text},
	{0x03, 1, gTextStoryteller_Story3Title,  gTextStoryteller_Story3Action,  gTextStoryteller_Story3Text},
	{0x04, 1, gTextStoryteller_Story4Title,  gTextStoryteller_Story4Action,  gTextStoryteller_Story4Text},
	{0x06, 1, gTextStoryteller_Story5Title,  gTextStoryteller_Story5Action,  gTextStoryteller_Story5Text},
	{0x09, 1, gTextStoryteller_Story6Title,  gTextStoryteller_Story6Action,  gTextStoryteller_Story6Text},
	{0x0B, 1, gTextStoryteller_Story7Title,  gTextStoryteller_Story7Action,  gTextStoryteller_Story7Text},
	{0x0C, 1, gTextStoryteller_Story8Title,  gTextStoryteller_Story8Action,  gTextStoryteller_Story8Text},
	{0x0D, 1, gTextStoryteller_Story9Title,  gTextStoryteller_Story9Action,  gTextStoryteller_Story9Text},
	{0x0E, 1, gTextStoryteller_Story10Title, gTextStoryteller_Story10Action, gTextStoryteller_Story10Text},
	{0x0F, 1, gTextStoryteller_Story11Title, gTextStoryteller_Story11Action, gTextStoryteller_Story11Text},
	{0x10, 1, gTextStoryteller_Story12Title, gTextStoryteller_Story12Action, gTextStoryteller_Story12Text},
	{0x11, 1, gTextStoryteller_Story13Title, gTextStoryteller_Story13Action, gTextStoryteller_Story13Text},
	{0x12, 1, gTextStoryteller_Story14Title, gTextStoryteller_Story14Action, gTextStoryteller_Story14Text},
	{0x13, 1, gTextStoryteller_Story15Title, gTextStoryteller_Story15Action, gTextStoryteller_Story15Text},
	{0x14, 1, gTextStoryteller_Story16Title, gTextStoryteller_Story16Action, gTextStoryteller_Story16Text},
	{0x1A, 1, gTextStoryteller_Story17Title, gTextStoryteller_Story17Action, gTextStoryteller_Story17Text},
	{0x1B, 1, gTextStoryteller_Story18Title, gTextStoryteller_Story18Action, gTextStoryteller_Story18Text},
	{0x1C, 1, gTextStoryteller_Story19Title, gTextStoryteller_Story19Action, gTextStoryteller_Story19Text},
	{0x1D, 2, gTextStoryteller_Story20Title, gTextStoryteller_Story20Action, gTextStoryteller_Story20Text},
	{0x1E, 1, gTextStoryteller_Story21Title, gTextStoryteller_Story21Action, gTextStoryteller_Story21Text},
	{0x21, 1, gTextStoryteller_Story22Title, gTextStoryteller_Story22Action, gTextStoryteller_Story22Text},
	{0x24, 1, gTextStoryteller_Story23Title, gTextStoryteller_Story23Action, gTextStoryteller_Story23Text},
	{0x25, 1, gTextStoryteller_Story24Title, gTextStoryteller_Story24Action, gTextStoryteller_Story24Text},
	{0x26, 1, gTextStoryteller_Story25Title, gTextStoryteller_Story25Action, gTextStoryteller_Story25Text},
	{0x27, 1, gTextStoryteller_Story26Title, gTextStoryteller_Story26Action, gTextStoryteller_Story26Text},
	{0x28, 1, gTextStoryteller_Story27Title, gTextStoryteller_Story27Action, gTextStoryteller_Story27Text},
	{0x29, 1, gTextStoryteller_Story28Title, gTextStoryteller_Story28Action, gTextStoryteller_Story28Text},
	{0x2A, 1, gTextStoryteller_Story29Title, gTextStoryteller_Story29Action, gTextStoryteller_Story29Text},
	{0x2B, 1, gTextStoryteller_Story30Title, gTextStoryteller_Story30Action, gTextStoryteller_Story30Text},
	{0x2C, 1, gTextStoryteller_Story31Title, gTextStoryteller_Story31Action, gTextStoryteller_Story31Text},
	{0x2D, 1, gTextStoryteller_Story32Title, gTextStoryteller_Story32Action, gTextStoryteller_Story32Text},
	{0x2E, 1, gTextStoryteller_Story33Title, gTextStoryteller_Story33Action, gTextStoryteller_Story33Text},
	{0x2F, 1, gTextStoryteller_Story34Title, gTextStoryteller_Story34Action, gTextStoryteller_Story34Text},
	{0x30, 1, gTextStoryteller_Story35Title, gTextStoryteller_Story35Action, gTextStoryteller_Story35Text},
    {0x31, 1, gTextStoryteller_Story36Title, gTextStoryteller_Story36Action, gTextStoryteller_Story36Text},
};

void StorytellerSetup(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;
    s32 i;

    storyteller->id = MAUVILLE_MAN_STORYTELLER;
    storyteller->unk1 = FALSE;
    for (i = 0; i < 4; i++)
    {
        storyteller->unk4[i] = 0;
        storyteller->playerNames[0][i] = EOS;  // Maybe they meant storyteller->playerNames[i][0] instead?
    }
}

void sub_80F8428(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

    storyteller->id = MAUVILLE_MAN_STORYTELLER;
    storyteller->unk1 = FALSE;
}

u32 sub_80F8438(u8 stat)
{
    if (stat == 50)
        stat = 0;
    return GetGameStat(stat);
}

const struct Story *GetStory(u32 a)
{
    s32 i;

    for (i = 0; i < 36; i++)
    {
        if (sStorytellerStories[i].unk0 == a)
            return &sStorytellerStories[i];
    }
    return &sStorytellerStories[35];
}

const u8 *sub_80F8478(u32 a)
{
    return GetStory(a)->title;
}

const u8 *sub_80F8484(u32 a)
{
    return GetStory(a)->fullText;
}

const u8 *sub_80F8490(u32 a)
{
    return GetStory(a)->action;
}

u8 sub_80F849C(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

        if (storyteller->unk4[i] == 0)
            break;
    }
    return i;
}

u32 sub_80F84C8(u32 a)
{
    u8 *ptr = gSaveBlock1.mauvilleMan.storyteller.unk24[a];

    return ptr[0] | (ptr[1] << 8) | (ptr[2] << 16) | (ptr[3] << 24);
}

void sub_80F84EC(u32 a, u32 b)
{
    u8 *ptr = gSaveBlock1.mauvilleMan.storyteller.unk24[a];

    ptr[0] = b;
    ptr[1] = b >> 8;
    ptr[2] = b >> 16;
    ptr[3] = b >> 24;
}

bool32 sub_80F8508(u32 a)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

    if (sub_80F8438(storyteller->unk4[a]) > sub_80F84C8(a))
        return TRUE;
    else
        return FALSE;
}

void GetStorytellerPlayerName(u32 player, void *dst)
{
    u8 *name = gSaveBlock1.mauvilleMan.storyteller.playerNames[player];

    memset(dst, EOS, 8);
    memcpy(dst, name, 7);
}

void SetStorytellerPlayerName(u32 player, const u8 *dst)
{
    u8 *name = gSaveBlock1.mauvilleMan.storyteller.playerNames[player];
    u8 len = StringLength(dst);

    memset(name, EOS, 7);
    StringCopyN(name, dst, len);
}

void sub_80F8598(u32 player, u32 b)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

    storyteller->unk4[player] = b;
    SetStorytellerPlayerName(player, gSaveBlock2.playerName);
    sub_80F84EC(player, sub_80F8438(b));
    ConvertIntToDecimalStringN(gStringVar1, sub_80F8438(b), 0, 10);
    StringCopy(gStringVar2, sub_80F8490(b));
}

void sub_80F85FC(u8 *arr, s32 count)
{
    s32 i;

    for (i = 0; i < count; i++)
        arr[i] = i;
    for (i = 0; i < count; i++)
    {
        u32 a = Random() % count;
        u32 b = Random() % count;
        u8 temp = arr[a];
        arr[a] = arr[b];
        arr[b] = temp;
    }
}

static const struct {u32 length; struct MauvilleManStoryteller *unused1; u32 unused2;} gUnknown_083E5620 =
{
    36,
    &gSaveBlock1.mauvilleMan.storyteller,  // unused
    12,                               // unused
};

bool8 sub_80F8650(void)
{
    u8 arr[gUnknown_083E5620.length];
    s32 i;
    s32 j;

    sub_80F85FC(arr, 36);
    for (i = 0; i < 36; i++)
    {
        u8 r4 = sStorytellerStories[arr[i]].unk0;
        u8 r6 = sStorytellerStories[arr[i]].unk1;
        struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

        for (j = 0; j < 4; j++)
        {
            if (gSaveBlock1.mauvilleMan.storyteller.unk4[j] == r4)
                break;
        }
        if (j == 4 && sub_80F8438(r4) >= r6)
        {
            storyteller->unk1 = TRUE;
            sub_80F8598(sub_80F849C(), r4);
            return TRUE;
        }
    }
    return FALSE;
}

void sub_80F8700(u32 player)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;
    u8 r6 = storyteller->unk4[player];

    ConvertIntToDecimalStringN(gStringVar1, sub_80F84C8(player), 0, 10);
    StringCopy(gStringVar2, sub_80F8490(r6));
    GetStorytellerPlayerName(player, gStringVar3);
    ShowFieldMessage(sub_80F8484(r6));
}

void sub_80F8758(void)
{
    s32 i;

    MenuDrawTextWindow(0, 0, 25, 4 + sub_80F849C() * 2);
    for (i = 0; i < 4; i++)
    {
        struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;
        u8 r0 = storyteller->unk4[i];

        if (r0 == 0)
            break;
        MenuPrint(sub_80F8478(r0), 1, 2 + i * 2);
    }
    MenuPrint(gPCText_Cancel, 1, 2 + i * 2);
}

extern u8 gUnknown_03000748;

void sub_80F87C4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s32 selection;

    switch (task->data[0])
    {
    case 0:
        sub_80F8758();
        InitMenu(0, 1, 2, sub_80F849C() + 1, 0, 24);
        task->data[0]++;
        break;
    case 1:
        selection = ProcessMenuInput();
        if (selection == -2)
            break;
        if (selection == -1 || selection == sub_80F849C())
        {
            gScriptResult = 0;
        }
        else
        {
            gScriptResult = 1;
            gUnknown_03000748 = selection;
        }
        HandleDestroyMenuCursors();
        MenuZeroFillWindowRect(0, 0, 25, 12);
        DestroyTask(taskId);
        EnableBothScriptContexts();
        break;
    }
}

void sub_80F8874(void)
{
    CreateTask(sub_80F87C4, 0x50);
}

void sub_80F8888(void)
{
    sub_80F8700(gUnknown_03000748);
}

u8 sub_80F889C(void)
{
    return sub_80F849C();
}

bool8 sub_80F88AC(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;
    u8 r4 = storyteller->unk4[gUnknown_03000748];

    if (sub_80F8508(gUnknown_03000748) == TRUE)
    {
        sub_80F8598(gUnknown_03000748, r4);
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80F88E0(void)
{
    struct MauvilleManStoryteller *storyteller = &gSaveBlock1.mauvilleMan.storyteller;

    if (storyteller->unk1 == FALSE)
        return FALSE;
    else
        return TRUE;
}

bool8 sub_80F88FC(void)
{
    return sub_80F8650();
}
