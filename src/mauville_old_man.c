#include "global.h"
#include "mauville_old_man.h"
#include "easy_chat.h"
#include "easy_chat_constants.h"
#include "menu.h"
#include "rng.h"
#include "script.h"
#include "string_util.h"
#include "strings.h"
#include "trader.h"

extern u16 gScriptResult;
extern u16 gSpecialVar_0x8004;

extern const u8 *gGiddyAdjectives[];
extern const u8 *gGiddyQuestions[];

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
        StringCopy(gStringVar4, gGiddyQuestions[giddy->mauvilleOldMan_ecArray2[giddy->unk2++]]);
    }

    if (!(Random() % 10))
        giddy->unk1 = 10;
    else
        giddy->unk1++;

    gScriptResult = TRUE;
}
