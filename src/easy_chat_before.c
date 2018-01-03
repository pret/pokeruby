#include "global.h"
#include "constants/easy_chat.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "dewford_trend.h"
#include "easy_chat.h"
#include "event_data.h"
#include "ewram.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "unknown_task.h"

extern const struct WindowConfig gWindowConfig_81E6D54;
extern const struct WindowConfig gWindowConfig_81E6DA8;

extern void sub_80546B8(void);

struct Shared1000
{
    void (*unk0)(void);  // main cb 2
    u16 *unk4;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB;
    u16 unkC[(0x20-0xC)/2];   // unknown length
    void (*unk20)(void);
    u16 unk24;
    u8 unk26;
    u8 unk27;
    u16 unk28;
    u8 unk2A[11][2];  // unknown length
    u8 unk40[4][14];
    u8 unk78[0x7D - 0x78];  // unknown length
    u8 unk7D;
    u8 unk7E[0x83-0x7E];
    s8 unk83;   // s8?
    //u8 unk83;   // s8?
    s8 unk84;
    s8 unk85;
    s8 unk86;
    bool8 unk87;
    u16 unk88;
    u16 unk8A;
    u8 unk8C[(0x96-0x8C)/2][2];
    u8 unk96;
    u8 filler97[0x1A8-0x97];
    s8 unk1A8;
    s8 unk1A9;
    s8 unk1AA[0xB5-0xAA];  // unknown length
    s8 unk1B5;
    s8 unk1B6;
    s8 unk1B7;
    u8 unk1B8;
    u8 unk1B9;
    u16 unk1BA;
    u8 filler1BC[0xBE - 0xBC];
    u8 unk1BE;
    u8 filler1BF;
    s8 unk1C0;
    u8 filler1C1[3];
    void (*unk1C4)(void);
    u8 filler1C8[0x4142-0x1C8];
#if GERMAN
    u8 filler4142_de[0x32A];
#endif
    u16 unk4142[(0x78-0x42)/2];
    u16 unk4178[(0x99A4-0x4178)/2]; // unknown length
#if GERMAN
    u8 filler99A4_de[2];
#endif
    s8 unk99A4;
    s8 unk99A5;
    s8 unk99A6[0xA28-0x9A6];
    s8 unk9A28;
    s8 unk9A29;
    //u8 filler9A2A[0xC7C-0xA2A];
    u16 unk9A2A[0x94][2];  // unknown length
    u8 filler9C7A[2];
    u16 unk9C7C;  // this is at 0x9FA8 in German
    s16 unk9C7E;
    u8 unk9C80[0xC9-0x80];
    u8 unk9CC9[0xD12-0xCC9];
    u8 unk9D12[0x5B-0x12];
    u8 unk9D5B[0xA4-0x5B];
    u8 unk9DA4[0xC8-0xA4];
    u8 filler9DC8[0xE14 - 0xDC8];
    u8 unk9E14[0xE41 - 0xE14];
    u8 unk9E41[0xF6E - 0xE41];
    u8 unk9F6E[1];  // unknown length
};

#define static_assert(cond) \
  typedef char test_[(cond) ? 1 : -1]

//static_assert(offsetof(struct Shared1000, unk9DA4) == 0x9DA4);

#define shared1000 (*(struct Shared1000 *)(gSharedMem + 0x1000))

const u16 gMysteryEventPhrase[] = {EC_WORD_MYSTERY, EC_WORD_EVENT, EC_WORD_IS, EC_WORD_EXCITING};

const u16 gBerryMasterWifePhrases[][2] =
{
#if ENGLISH
    {EC_WORD_GREAT, EC_WORD_BATTLE},
    {EC_WORD_CHALLENGE, EC_WORD_CONTEST},
    {EC_WORD_OVERWHELMING, EC_POKEMON(LATIAS)},
    {EC_WORD_COOL, EC_POKEMON(LATIOS)},
    {EC_WORD_SUPER, EC_WORD_HUSTLE},
#else
    {EC_WORD_GREAT, EC_WORD_FIGHT},
    {EC_WORD_CONTEST, EC_WORD_CHALLENGE},
    {EC_POKEMON(LATIAS), EC_WORD_OVERWHELMING},
    {EC_POKEMON(LATIOS), EC_WORD_COOL},
    {EC_WORD_SUPER, 0xFFFF},
#endif
};

// const pointer to shared1000. easy_chat might be two separate files.
struct Shared1000 *const gUnknown_083DB694 = &shared1000;

const struct UnknownTaskStruct gUnknown_083DB698 =
{
    &REG_BG3VOFS,
    ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1,
    1
};

const u8 gUnknown_083DB6A4[] = {4, 0, 0, 0, 1, 5, 0, 2, 2, 3, 2, 2, 2, 3};

// choose by alphabet keyboard
const u8 gUnknown_083DB6B2[][16] =
{
    _("ABCDEF "),
    _("GHIJKL"),
    _("MNOPQRS"),
    _("TUVWXYZ"),
};

struct EasyChatPrompt
{
    const u8 *text1;
    const u8 *text2;
    bool8 unk8;
};

const struct EasyChatPrompt gUnknown_083DB6F4[] =
{
    {OtherText_MakeProfilePage1, OtherText_MakeProfilePage2, TRUE},
    {OtherText_MakeMessagePage1, OtherText_MakeMessagePage2, TRUE},
    {OtherText_CombineNinePhrasesPage1, OtherText_CombineNinePhrasesPage2, TRUE},
    {OtherText_DescribeFeelingsPage1, OtherText_DescribeFeelingsPage2, TRUE},
    {OtherText_ImproveBardSongPage1, OtherText_ImproveBardSongPage2, TRUE},
    {OtherText_CombineTwoPhrasesPage1, OtherText_CombineTwoPhrasesPage2, TRUE},
    {OtherText_YourProfile, OtherText_ConfirmTrendyPage2, FALSE},
    {OtherText_YourFeelingBattle, OtherText_ConfirmTrendyPage2, TRUE},
    {OtherText_SetWinMessage, OtherText_ConfirmTrendyPage2, TRUE},
    {OtherText_SetLossMessage, OtherText_ConfirmTrendyPage2, TRUE},
    {OtherText_MailMessage, OtherText_ConfirmTrendyPage2, TRUE},
    {OtherText_MailSalutation, OtherText_ConfirmTrendyPage2, TRUE},
    {OtherText_NewSong, OtherText_ConfirmTrendyPage2, FALSE},
    {OtherText_TheAnswer, OtherText_ConfirmTrendyPage2, FALSE},
    {OtherText_ConfirmTrendyPage1, OtherText_ConfirmTrendyPage2, TRUE},
    {OtherText_HipsterPage1, OtherText_HipsterPage2, TRUE},
    {OtherText_WithFourPhrases, OtherText_CombineNinePhrasesPage2, TRUE},
};

const u8 gUnknown_083DB7C0[][2] =
{
	{ 0,  6},
	{ 1,  7},
	{ 1,  8},
	{ 1,  9},
	{ 2, 10},
	{16, 13},
	{ 4, 12},
	{ 3, 13},
	{ 3, 13},
	{ 5, 14},
	{ 3, 13},
	{ 3, 13},
	{ 3, 13},
    {15, 13},
};

void sub_80E62F8(void);
void sub_80E6424(void);
void sub_80E6554(void);
void sub_80E6630(void);
void sub_80E6690(void);
void sub_80E682C(void (*)(void));
void sub_80E69F8(void);
void sub_80E6A6C(void);
void sub_80E6A88(void);
void sub_80E6AA8(void);
void sub_80E6AC4(void);
void sub_80E6AE4(void);
void sub_80E6BC0(void);
void sub_80E6C84(void);
void sub_80E6D7C(void);
void sub_80E6F68(void);
void sub_80E6FC8(void);
void sub_80E7114(void);
void sub_80E718C(void);
void sub_80E7218(void);
void sub_80E7294(void);
void sub_80E7324(void);
void sub_80E73D0(void);
void sub_80E7458(void);
void sub_80E752C(void);
void sub_80E7574(void);
bool8 sub_80E75D8(void);
bool8 sub_80E77C8(void);
void sub_80E7A98(void);
void sub_80E7AD4(void);
bool8 sub_80E7B40(void);
void sub_80E7D30(void);
void sub_80E7D6C(void);
void sub_80E7D9C(void);
bool8 sub_80E7DD0(void);
void sub_80E7E50(void);
void sub_80E7F00(u16, u16);
u8 sub_80E7FA8(void);
bool8 sub_80E8054(void);
u8 sub_80E8094(void);
u8 sub_80E810C(void);
void sub_80E81C0(void);
void sub_80E81FC(void);
void sub_80E8218(void);
void sub_80E8398();
void sub_80E8420(void);
void sub_80E8504(void);
void sub_80E87CC();
void sub_80E88F0(void);
void sub_80E8958();
void sub_80E8BF4();
void sub_80E8CEC(void);
void sub_80E8D54(void);
void sub_80E8D8C();
void sub_80E8DD8(void);
void sub_80E91D4();
void sub_80E9368();
void sub_80E95A4(void);
void sub_80E9744(void);
void sub_80E98C4(void);
void sub_80E9974(void);
void sub_80E9A14(void);
void sub_80E9A4C(void);
void sub_80E9AD4(void);
void sub_80E9C94(void);
void sub_80E9D00(void);
void sub_80E9D7C(void);
void sub_80E9E08();
u8 sub_80E9E54(void);
void sub_80E9E98(void);
u8 sub_80E9EA8(void);
u8 sub_80E9F50(void);
u8 sub_80E9FD4(void);
u8 sub_80EA014(void);
u8 sub_80EA050(void);
u8 sub_80EA0E4(void);
u8 sub_80EA184(void);
void sub_80EAC5C(void);
void sub_80EAD08(void);
u8 sub_80EAD7C(u8);
void sub_80EAECC(void);
void sub_80EB040(void);
void sub_80EB0B0(void);
void sub_80EB218();
u16 sub_80EB2D4();
bool8 sub_80EB680(u16 *, u16, u16, u16);

void sub_80E60D8(void)
{
    u8 r4 = 3;
    u16 *r1;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        r1 = gSaveBlock1.easyChats.unk2B1C;
        break;
    case 1:
        r1 = gSaveBlock1.easyChats.unk2B28;
        break;
    case 2:
        r1 = gSaveBlock1.easyChats.unk2B34;
        break;
    case 3:
        r1 = gSaveBlock1.easyChats.unk2B40;
        break;
    case 4:
        r1 = gSaveBlock1.mail[gSpecialVar_0x8005].words;
        break;
    case 6:
        {
            struct MauvilleManBard *bard = &gSaveBlock1.mauvilleMan.bard;
            u16 i;
            for (i = 0; i < 6; i++)
                bard->temporaryLyrics[i] = bard->songLyrics[i];
            r1 = bard->temporaryLyrics;
        }
        break;
    case 5:
        // TODO: Is this the right TV show?
        r1 = gSaveBlock1.tvShows[gSpecialVar_0x8005].fanclubLetter.pad04;
        r4 = gSpecialVar_0x8006;
        break;
    case 7:
        // TODO: Is this the right TV show?
        r1 = &gSaveBlock1.tvShows[gSpecialVar_0x8005].fanclubOpinions.var1C[gSpecialVar_0x8006];
        r4 = 1;
        break;
    case 8:
        // TODO: Is this the right TV show?
        r1 = &gSaveBlock1.tvShows[gSpecialVar_0x8005].fanclubOpinions.var02;
        r4 = 0;
        break;
    case 9:
        r1 = NULL;
        break;
    case 10:
        r1 = &gSaveBlock1.gabbyAndTyData.quote;
        *r1 = 0xFFFF;
        r4 = 1;
        break;
    case 11:
        // TODO: Is this the right TV show?
        r1 = &gSaveBlock1.tvShows[gSpecialVar_0x8005].bravoTrainer.var04[gSpecialVar_0x8006];
        r4 = 0;
        break;
    case 12:
        // TODO: Is this the right TV show?
        r1 = gSaveBlock1.tvShows[gSpecialVar_0x8005].bravoTrainerTower.var18;
        r4 = 1;
        break;
    case 13:
        shared1000.unk9C7C = 0xFFFF;
        shared1000.unk9C7E = -1;
        r1 = &shared1000.unk9C7C;
        break;
    default:
        return;
    }
    sub_80E62A0(gSpecialVar_0x8004, r1, sub_80546B8, r4);
}

void sub_80E62A0(u8 a, u16 *b, void (*c)(void), u8 d)
{
    shared1000.unk0 = c;
    shared1000.unk4 = b;
    shared1000.unk8 = a;
    shared1000.unkB = d;
    if (a == 9)
    {
        shared1000.unk4 = &shared1000.unk9C7C;
        shared1000.unk9C7C = gSaveBlock1.easyChatPairs[0].words[0];
        shared1000.unk9C7E = gSaveBlock1.easyChatPairs[0].words[1];
    }
    SetMainCallback2(sub_80E62F8);
}

void sub_80E62F8(void)
{
    switch (gMain.state)
    {
    case 0:
    default:
        REG_DISPCNT = 0;
        SetVBlankCallback(0);
        ResetPaletteFade();
        ResetSpriteData();
        dp12_8087EA4();
        remove_some_task();
        sub_80EAD08();
        sub_80895F8(gUnknown_083DB698);
        FreeSpriteTileRanges();
        FreeAllSpritePalettes();
        break;
    case 1:
        SetUpWindowConfig(&gWindowConfig_81E6DA8);
        break;
    case 2:
        InitMenuWindow(&gWindowConfig_81E6D54);
        InitMenuWindow(&gWindowConfig_81E6DA8);
        MenuZeroFillScreen();
        break;
    case 3:
        sub_80E6424();
        break;
    case 4:
        sub_80E8DD8();
        break;
    case 5:
        sub_80E8218();
        sub_80E8CEC();
        break;
    case 6:
        sub_80E69F8();
        sub_80E682C(sub_80E6AA8);
        SetVBlankCallback(sub_80E6A6C);
        break;
    case 7:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        break;
    case 8:
        REG_DISPCNT = 0x1F40;
        SetMainCallback2(sub_80E6A88);
        FlagSet(FLAG_SYS_CHAT_USED);
        break;
    }
    gMain.state++;
}

void sub_80E6424(void)
{
    shared1000.unk9 = gUnknown_083DB6A4[shared1000.unk8];
    switch (shared1000.unk9)
    {
    case 4:
        shared1000.unkA = 4;
        shared1000.unk83 = 2;
        shared1000.unk84 = 2;
        shared1000.unk88 = 5;
        shared1000.unk8A = 4;
        break;
    case 5:
        shared1000.unkA = 4;
        shared1000.unk83 = 1;
        shared1000.unk84 = 4;
        shared1000.unk88 = 16;
        shared1000.unk8A = 2;
        break;
    case 0:
        shared1000.unkA = 6;
        shared1000.unk83 = 2;
        shared1000.unk84 = 3;
        shared1000.unk88 = 4;
        shared1000.unk8A = 3;
        break;
    case 1:
        shared1000.unkA = 9;
        shared1000.unk83 = 2;
        shared1000.unk84 = 5;
        shared1000.unk88 = 4;
        shared1000.unk8A = 0;
        break;
    case 2:
        shared1000.unkA = 1;
        shared1000.unk83 = 1;
        shared1000.unk84 = 1;
        shared1000.unk88 = 16;
        shared1000.unk8A = 4;
        break;
    case 3:
        shared1000.unkA = 2;
        shared1000.unk83 = 2;
        shared1000.unk84 = 1;
        shared1000.unk88 = 5;
        shared1000.unk8A = 3;
        break;
    }
    shared1000.unk86 = 0;
    shared1000.unk85 = 0;
    shared1000.unk87 = 0;
    shared1000.unk26 = 0;
    shared1000.unk1BA = 0;
    shared1000.unk1BE = 2;
    sub_80E6554();
    sub_80EAECC();
    sub_80EB040();
    sub_80E7E50();
    sub_80E6630();
    sub_80E6690();
}

void sub_80E6554(void)
{
    u16 r4 = 0;
    u16 r7;
    u16 r5;

    for (r7 = 0; ; r7++)
    {
        for (r5 = 0; r5 < 2; r5++)
        {
            shared1000.unk2A[r7][r5] = r4++;
            if (r4 == 17)
                break;
        }
        if (r4 == 17)
            break;
    }
    shared1000.unk28 = 17;
    while (r4 < 22)
    {
        if (sub_80EAD7C(r4) != 0)
        {
            r5++;
            if (r5 > 1)
            {
                r7++;
                r5 = 0;
            }
            shared1000.unk2A[r7][r5] = r4;
            shared1000.unk78[r4 - 17] = 1;  // hmm...
            shared1000.unk28++;
        }
        else
        {
            shared1000.unk78[r4 - 17] = 0;
        }
        r4++;
    }
    shared1000.unk1B6 = (shared1000.unk28 + 1) / 2;
}

void sub_80E6630(void)
{
    u8 i;
    u8 r3;

    for (i = 0; i < 4; i++)
    {
        const u8 *row = gUnknown_083DB6B2[i];

        for (r3 = 0; row[r3] != EOS; r3++)
        {
            if (row[r3] != CHAR_SPACE)
                shared1000.unk40[i][r3] = row[r3] + 0x46;
            else
                shared1000.unk40[i][r3] = CHAR_SPACE;
        }
    }
}

void sub_80E6690(void)
{
    u8 *pointers[] =
    {
        shared1000.unk9C80, shared1000.unk9CC9,
        shared1000.unk9D12, shared1000.unk9D5B,
    };
    u8 *r3;
    u16 i;

    for (i = 0; i < 2; i++)
    {
        const struct EasyChatPrompt *prompt = &gUnknown_083DB6F4[gUnknown_083DB7C0[shared1000.unk8][i]];

        r3 = StringCopy(pointers[i * 2 + 0], prompt->text1);
        if (prompt->unk8)
        {
            StringCopy(pointers[i * 2 + 1], prompt->text2);
        }
        else
        {
            *r3++ = CHAR_SPACE;
            StringCopy(r3, prompt->text2);
            *pointers[i * 2 + 1] = EOS;
        }
    }

    for (i = 0; i < 0x24; i++)
        shared1000.unk9DA4[i] = 0;
    shared1000.unk9DA4[i] = 0xFF;

    r3 = shared1000.unk9F6E;
    r3[0] = EXT_CTRL_CODE_BEGIN;
    r3[1] = 0x11;
    r3[2] = 0xE0;
    r3[3] = 0xFF;
}

// Default profile phrase
const u16 gUnknown_083DB7EC[] =
{
#if ENGLISH
    EC_WORD_I_AM,
    EC_WORD_A,
    EC_WORD_POKEMON,
    EC_WORD_GREAT,
#else
    EC_WORD_I_AM,
    EC_WORD_BIG,
    EC_WORD_IN,
    EC_WORD_POKEMON,
#endif
};

const u16 gUnknown_083DB7F4[] =
{
    EC_WORD_ARE,
    EC_WORD_YOU,
    EC_WORD_READY,
    EC_WORD_QUES,
    EC_WORD_HERE_I_COME,
    EC_WORD_EXCL,
};

const u16 InterviewPalette_0[] = INCBIN_U16("graphics/misc/interview_pal0.gbapal");

// ResetDefaultEasyChatPhrases
void InitEasyChatPhrases(void)
{
    u16 i;
    u16 j;

    for (i = 0; i < 4; i++)
        gSaveBlock1.easyChats.unk2B1C[i] = gUnknown_083DB7EC[i];

    for (i = 0; i < 6; i++)
        gSaveBlock1.easyChats.unk2B28[i] = gUnknown_083DB7F4[i];

    for (i = 0; i < 6; i++)
    {
        gSaveBlock1.easyChats.unk2B34[i] = 0xFFFF;
        gSaveBlock1.easyChats.unk2B40[i] = 0xFFFF;
    }

    for (i = 0; i < 16; i++)
    {
        for (j = 0; j < 9; j++)
            gSaveBlock1.mail[i].words[j] = 0xFFFF;
    }

    for (i = 0; i < 64; i++)
        gSaveBlock1.unk2D8C[i] = 0;
}

void sub_80E682C(void (*func)(void))
{
    shared1000.unk20 = func;
    shared1000.unk24 = 0;
}

void sub_80E683C(void)
{
    u16 i;

    if (shared1000.unk26 == 0)
    {
        for (i = 0; i < shared1000.unk1B6; i++)
            shared1000.unk1AA[i] = 2;
        shared1000.unk1AA[i - 1] = shared1000.unk28 % 2;
        if (shared1000.unk1AA[i - 1] == 0)
            shared1000.unk1AA[i - 1] = 2;
    }
    else
    {
        shared1000.unk1AA[0] = 7;
        shared1000.unk1AA[1] = 6;
        shared1000.unk1AA[2] = 7;
        shared1000.unk1AA[3] = 7;
    }
    shared1000.unk1A8 = 0;
    shared1000.unk1A9 = 0;
    shared1000.unk1B5 = 0;
    shared1000.unk1B7 = 0;
    sub_80E9A4C();
}

void sub_80E68E8(void)
{
    sub_80EB0B0();
    if (shared1000.unk26 == 0)
    {
        u16 i;
        u8 r6;

        r6 = shared1000.unk1B8;
        shared1000.unk9A28 = (shared1000.unk4178[r6] + 1) / 2;
        for (i = 0; i < shared1000.unk9A28; i++)
            shared1000.unk99A6[i] = 2;
        i--;
        shared1000.unk99A6[i] = shared1000.unk4178[r6] % 2;
        if (shared1000.unk99A6[i] == 0)
            shared1000.unk99A6[i] = 2;
    }
    else
    {
        u16 i;
        u8 r6;

        r6 = shared1000.unk1B8;
        shared1000.unk9A28 = (shared1000.unk4142[r6] + 1) / 2;
        for (i = 0; i < shared1000.unk9A28; i++)
            shared1000.unk99A6[i] = 2;
        i--;
        shared1000.unk99A6[i] = shared1000.unk4142[r6] % 2;
        if (shared1000.unk99A6[i] == 0)
            shared1000.unk99A6[i] = 2;
    }
    shared1000.unk99A4 = 0;
    shared1000.unk99A5 = 0;
    shared1000.unk9A29 = 0;
    sub_80E9A4C();
}

void sub_80E69F8(void)
{
    switch (shared1000.unk8)
    {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 9:
    case 13:
    default:
        sub_80E9368(shared1000.unk8);
        break;
    case 5:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
        sub_80E9368(shared1000.unk8);
        sub_80E8BF4(shared1000.unkB, shared1000.unk9);
        break;
    }
}

void sub_80E6A6C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    sub_80EAC5C();
    TransferPlttBuffer();
    sub_8089668();
}

void sub_80E6A88(void)
{
    shared1000.unk20();
    AnimateSprites();
    BuildOamBuffer();
    sub_80EAD08();
}

void sub_80E6AA8(void)
{
    if (!UpdatePaletteFade())
        sub_80E682C(sub_80E6AC4);
}

void sub_80E6AC4(void)
{
    sub_80E88F0();
    sub_80E8398(0);
    sub_80E91D4(0);
    sub_80E682C(sub_80E6AE4);
}

void sub_80E6AE4(void)
{
    shared1000.unk87 = sub_80E75D8();
    if (shared1000.unk87)
        PlaySE(SE_SELECT);
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (shared1000.unk86 == shared1000.unk84)
        {
            switch (shared1000.unk85)
            {
            case 0:
                sub_80E682C(sub_80E6BC0);
                return;
            case 1:
                sub_80E682C(sub_80E6C84);
                return;
            case 2:
                sub_80E682C(sub_80E6D7C);
                return;
            }
        }
        else
        {
            shared1000.unk27 = shared1000.unk86 * shared1000.unk83 + shared1000.unk85;
            sub_80E7574();
            sub_80E682C(sub_80E6F68);
            return;
        }
    }
    if (gMain.newKeys & B_BUTTON)
    {
        sub_80E682C(sub_80E6C84);
    }
}

void sub_80E6BC0(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        sub_80E8398(2);
        if (shared1000.unk8 == 6)
        {
            sub_80E91D4(6);
            shared1000.unk24 = 100;
        }
        else
        {
            sub_80E91D4(2);
            DisplayYesNoMenu(23, 8, 1);
            MoveMenuCursor(1);
            shared1000.unk24++;
        }
        break;
    case 1:
        switch (ProcessMenuInputNoWrap_())
        {
        case 0:
            sub_80E7D6C();
            sub_80E98C4();
            sub_80E95A4();
            shared1000.unk24++;
            break;
        case -1:
        case 1:
            shared1000.unk24++;
            break;
        }
        break;
    case 2:
        sub_80E81FC();
        sub_80E682C(sub_80E6AC4);
        break;
    case 100:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            sub_80E682C(sub_80E6AC4);
        break;
    }
}

void sub_80E6C84(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        sub_80E8398(2);
        sub_80E91D4(3);
        DisplayYesNoMenu(23, 8, 0);
        MoveMenuCursor(1);
        if (shared1000.unk8 == 9
         || shared1000.unk8 == 4
         || shared1000.unk8 == 7
         || shared1000.unk8 == 8
         || shared1000.unk8 == 10
         || shared1000.unk8 == 11
         || shared1000.unk8 == 12
         || shared1000.unk8 == 5
         || shared1000.unk8 == 13)
            shared1000.unk24 = 2;
        else
            shared1000.unk24++;
        break;
    case 1:
        switch (ProcessMenuInputNoWrap_())
        {
        case 0:
            sub_80E91D4(4);
            DisplayYesNoMenu(23, 8, 0);
            MoveMenuCursor(1);
            shared1000.unk24++;
            break;
        case -1:
        case 1:
            shared1000.unk24 = 0xFF;
            break;
        }
        break;
    case 2:
        switch (ProcessMenuInputNoWrap_())
        {
        case 0:
            gSpecialVar_Result = 0;
            sub_80E682C(sub_80E752C);
            break;
        case -1:
        case 1:
            shared1000.unk24 = 0xFF;
            break;
        }
        break;
    case 0xFF:
        HandleDestroyMenuCursors();
        sub_80E81FC();
        sub_80E682C(sub_80E6AC4);
        break;
    }
}

void sub_80E6D7C(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        sub_80E8398(2);
        if (sub_80E8054())
        {
            sub_80E91D4(5);
            shared1000.unk24 = 10;
            break;
        }
        if (shared1000.unk8 == 9)
        {
            if (sub_80E7FA8() == 0)
            {
                sub_80E91D4(8);
                shared1000.unk24 = 10;
                break;
            }
            if (shared1000.unkC[0] == 0xFFFF || shared1000.unkC[1] == 0xFFFF)
            {
                sub_80E91D4(9);
                shared1000.unk24 = 10;
                break;
            }
        }
        if (shared1000.unk8 == 4 && sub_80E7FA8() == 0)
        {
            sub_80E682C(sub_80E6C84);
        }
        else
        {
            sub_80E91D4(1);
            sub_80E9744();
            DisplayYesNoMenu(23, 8, 0);
            MoveMenuCursor(0);
            shared1000.unk24++;
        }
        break;
    case 1:
        switch (ProcessMenuInputNoWrap_())
        {
        case 0:
            gSpecialVar_Result = (sub_80E7FA8() != 0);
            sub_80E7D9C();
            if (shared1000.unk8 == 0)
                gSpecialVar_0x8004 = sub_80E8094();
            if (shared1000.unk8 == 9)  // dewford trend?
            {
                sub_80E81C0();
                gSpecialVar_0x8004 = sub_80FA364(&shared1000.unk9C7C);
            }
            if (shared1000.unk8 == 13)
            {
                if (shared1000.unkC[0] == 0xFFFF || shared1000.unkC[1] == 0xFFFF)
                    gSpecialVar_Result = 0;
                gSpecialVar_0x8004 = sub_80E810C();
            }
            sub_80E682C(sub_80E752C);
            break;
        case -1:
        case 1:
            HandleDestroyMenuCursors();
            sub_80E81FC();
            if (shared1000.unk8 == 6 && sub_80E7FA8() != 0)
            {
                shared1000.unk24 = 100;
            }
            else
            {
                sub_80E95A4();
                sub_80E682C(sub_80E6AC4);
            }
            break;
        }
        break;
    case 10:
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            sub_80E682C(sub_80E6AC4);
        break;
    case 100:
        sub_80E91D4(7);
        shared1000.unk24++;
        // fall through
    case 101:
        if (gMain.newKeys & A_BUTTON)
            shared1000.unk24++;
        break;
    case 102:
        sub_80E7E50();
        sub_80E95A4();
        sub_80E682C(sub_80E6AC4);
        break;
    }
}

void sub_80E6F68(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        sub_80E8398(1);
        sub_80E91D4(10);
        sub_80E683C();
        sub_80E9974();
        sub_80E9E98();
        shared1000.unk24++;
        break;
    case 1:
        if (sub_80E9EA8() != 0)
        {
            sub_80E8D8C(1);
            sub_80E8420();
            sub_80E8958(0);
            sub_80E682C(sub_80E6FC8);
        }
        break;
    }
}

void sub_80E6FC8(void)
{
    shared1000.unk96 = sub_80E77C8();
    if (shared1000.unk1C0 != 0)
    {
        PlaySE(SE_SELECT);
        shared1000.unk1C4 = sub_80E6FC8;
        sub_80E682C(sub_80E7458);
    }
    else
    {
        if (shared1000.unk96)
            PlaySE(SE_SELECT);
        if (gMain.newKeys & A_BUTTON)
        {
            if (shared1000.unk1B7 != 0)
            {
                PlaySE(SE_SELECT);
                switch (shared1000.unk1A8)
                {
                case 1:
                    sub_80E682C(sub_80E718C);
                    break;
                case 2:
                    if (shared1000.unk8 != 6)
                    {
                        sub_80E7F00(shared1000.unk27, 0xFFFF);
                        sub_80E7574();
                        sub_80E95A4();
                    }
                    break;
                case 3:
                    sub_80E682C(sub_80E7114);
                    break;
                }
            }
            else
            {
                if (shared1000.unk26 == 0
                 || shared1000.unk4142[shared1000.unk40[shared1000.unk1A8][shared1000.unk1A9]] != 0)
                {
                    PlaySE(SE_SELECT);
                    sub_80E7AD4();
                    sub_80E682C(sub_80E7218);
                }
            }
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            sub_80E682C(sub_80E7114);
        }
        else if (gMain.newKeys & SELECT_BUTTON)
        {
            sub_80E682C(sub_80E718C);
        }
    }
}

void sub_80E7114(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        sub_80E8504();
        sub_80E9E98();
        sub_80E88F0();
        sub_80E8D8C(0);
        shared1000.unk24++;
        break;
    case 1:
    case 2:
        shared1000.unk24++;
        break;
    case 3:
        if (sub_80E9F50() != 0)
            shared1000.unk24++;
        break;
    case 4:
        sub_80E682C(sub_80E6AC4);
        break;
    }
}

void sub_80E718C(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        sub_80E8504();
        sub_80E9E98();
        sub_80E88F0();
        shared1000.unk24++;
        sub_80E8D54();
        break;
    case 1:
        if (sub_80E9FD4() != 0)
        {
            shared1000.unk26 = !shared1000.unk26;
            sub_80E683C();
            sub_80E9974();
            sub_80E9E98();
            shared1000.unk24++;
        }
        break;
    default:
        shared1000.unk24++;
        break;
    case 8:
        if (sub_80EA014() != 0)
        {
            sub_80E8420();
            sub_80E8958(0);
            sub_80E682C(sub_80E6FC8);
        }
        break;
    }
}

void sub_80E7218(void)
{
    switch (shared1000.unk24)
    {
    default:
        shared1000.unk24++;
        break;
    case 8:
        sub_80E8D8C(0);
        sub_80E8504();
        sub_80E9AD4();
        sub_80E68E8();
        sub_80E88F0();
        sub_80E9E98();
        shared1000.unk24++;
        break;
    case 9:
        if (sub_80EA050() != 0)
        {
            sub_80E9C94();
            shared1000.unk24++;
        }
        break;
    case 10:
        sub_80E87CC(1);
        sub_80E8958(1);
        sub_80E682C(sub_80E7294);
        break;
    case 11:
        break;
    }
}

void sub_80E7294(void)
{
    shared1000.unk1B9 = sub_80E7B40();
    if (shared1000.unk1C0 != 0)
    {
        PlaySE(SE_SELECT);
        shared1000.unk1C4 = sub_80E7294;
        sub_80E682C(sub_80E7458);
    }
    else
    {
        if (shared1000.unk1B9)
            PlaySE(SE_SELECT);
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_80E682C(sub_80E7324);
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            sub_80E682C(sub_80E73D0);
        }
    }
}

void sub_80E7324(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        if (!sub_80E7DD0())
        {
            sub_80E682C(sub_80E7294);
        }
        else
        {
            sub_80E88F0();
            sub_80E87CC(0);
            shared1000.unk24++;
        }
        break;
    case 1:
        shared1000.unk24++;
        break;
    case 2:
        sub_80E9E98();
        shared1000.unk24++;
        break;
    case 3:
        if (sub_80EA184() != 0)
            shared1000.unk24++;
        break;
    case 4:
        if (shared1000.unk8 == 6 && sub_80E7FA8() != 0)
            sub_80E682C(sub_80E6D7C);
        else
            sub_80E682C(sub_80E6AC4);
        break;
    }
}

void sub_80E73D0(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        sub_80E87CC(0);
        sub_80E88F0();
        shared1000.unk24++;
        break;
    case 1:
        sub_80E9AD4();
        sub_80E9E98();
        shared1000.unk24++;
        break;
    case 2:
        if (sub_80EA0E4() != 0)
        {
            sub_80E8D8C(1);
            sub_80E9A14();
            shared1000.unk24++;
        }
        break;
    case 3:
        sub_80E8420();
        sub_80E8958(0);
        shared1000.unk24++;
        break;
    case 4:
        sub_80E9974();
        sub_80E682C(sub_80E6FC8);
        break;
    }
}

void sub_80E7458(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        if (shared1000.unk1C4 == sub_80E6FC8)
            sub_80E9D7C();
        else
            sub_80E9D00();
        sub_80E9E08(shared1000.unk1BE);
        shared1000.unk24++;
        break;
    case 1:
        if (sub_80E9E54() != 0)
        {
            if (shared1000.unk1C4 == sub_80E6FC8)
            {
                sub_80E9D7C();
                shared1000.unk1B5 += shared1000.unk1C0;
                sub_80E7A98();
                shared1000.unk96 = TRUE;
            }
            else
            {
                shared1000.unk9A29 += shared1000.unk1C0;
                sub_80E7D30();
                shared1000.unk1B9 = 1;
            }
            shared1000.unk1BE = 2;
            sub_80E682C(shared1000.unk1C4);
        }
        break;
    }
}

void sub_80E752C(void)
{
    switch (shared1000.unk24)
    {
    case 0:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        shared1000.unk24++;
        break;
    case 1:
        if (!UpdatePaletteFade())
            SetMainCallback2(shared1000.unk0);
        break;
    }
}

void sub_80E7574(void)
{
    if (shared1000.unk8 == 1
     && shared1000.unk7E[shared1000.unk86] == 2
     && sub_80EB2D4(shared1000.unkC[shared1000.unk27]) != 7)
        shared1000.unk7D = 1;
    else
        shared1000.unk7D = 0;
    shared1000.unk7D = 0;  // What the hell?
}

bool8 sub_80E75D8(void)
{
    bool8 pressedUpDown = FALSE;
    u8 r0;

    if (gMain.newKeys & START_BUTTON)
    {
        shared1000.unk86 = shared1000.unk84;
        shared1000.unk85 = 2;
        return TRUE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        shared1000.unk86--;
        if (shared1000.unk86 < 0)
            shared1000.unk86 = shared1000.unk84;
        pressedUpDown = TRUE;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        shared1000.unk86++;
        if (shared1000.unk86 > shared1000.unk84)
            shared1000.unk86 = 0;
        pressedUpDown = TRUE;
    }

    if (pressedUpDown)
    {
        if (shared1000.unk9 == 2)
        {
            if (shared1000.unk86 == shared1000.unk84)
                shared1000.unk85 = 2;
            else
                shared1000.unk85 = 0;
            return TRUE;
        }
        else
        {
            if (shared1000.unk85 >= shared1000.unk83)
                shared1000.unk85 = shared1000.unk83 - 1;
            if (shared1000.unk86 != shared1000.unk84)
            {
                r0 = shared1000.unk86 * shared1000.unk83 + shared1000.unk85;
                if (r0 >= shared1000.unkA)
                    shared1000.unk85 = r0 - shared1000.unkA;
            }
            return TRUE;
        }
    }
    else
    {
        if (gMain.newAndRepeatedKeys & DPAD_LEFT)
        {
            if (--shared1000.unk85 < 0)
            {
                if (shared1000.unk86 == shared1000.unk84)
                {
                    shared1000.unk85 = 2;
                }
                else
                {
                    shared1000.unk85 = shared1000.unk83 - 1;
                    r0 = shared1000.unk86 * shared1000.unk83 + shared1000.unk85;
                    if (r0 >= shared1000.unkA)
                        shared1000.unk85 = r0 - shared1000.unkA;
                }
            }
            return TRUE;
        }
        if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
        {
            if (shared1000.unk86 == shared1000.unk84)
            {
                if (++shared1000.unk85 > 2)
                    shared1000.unk85 = 0;
            }
            else
            {
                if (++shared1000.unk85 >= shared1000.unk83)
                    shared1000.unk85 = 0;
                r0 = shared1000.unk86 * shared1000.unk83 + shared1000.unk85;
                if (r0 >= shared1000.unkA)
                    shared1000.unk85 = r0 - shared1000.unkA;
            }
            return TRUE;
        }
    }
    return FALSE;
}

bool8 sub_80E77C8(void)
{
    bool8 pressedLeftRight = FALSE;
    bool8 pressedUpDown;

    if (shared1000.unk1B7 != 0)
    {
        if (gMain.newAndRepeatedKeys & DPAD_UP)
        {
            shared1000.unk1A8--;
            if (shared1000.unk1A8 < 1)
                shared1000.unk1A8 = 3;
            return TRUE;
        }
        else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            shared1000.unk1A8++;
            if (shared1000.unk1A8 > 3)
                shared1000.unk1A8 = 1;
            return TRUE;
        }
    }
    else
    {
        if (shared1000.unk26 == 1)
        {
            pressedUpDown = FALSE;

            if (gMain.newAndRepeatedKeys & DPAD_UP)
            {
                shared1000.unk1A8--;
                if (shared1000.unk1A8 < 0)
                    shared1000.unk1A8 = 3;
                pressedUpDown = TRUE;
            }
            else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
            {
                shared1000.unk1A8++;
                if (shared1000.unk1A8 > 3)
                    shared1000.unk1A8 = 0;
                pressedUpDown = TRUE;
            }

            if (pressedUpDown)
            {
                sub_80E7A98();
                return TRUE;
            }
        }
        else
        {
            pressedUpDown = FALSE;
            shared1000.unk1C0 = 0;

            if (gMain.newAndRepeatedKeys & DPAD_UP)
            {
                if (shared1000.unk1A8 == 0)
                    return FALSE;
                shared1000.unk1A8--;
                if (shared1000.unk1A8 < shared1000.unk1B5)
                    shared1000.unk1C0 = -1;
                pressedUpDown = TRUE;
            }
            else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
            {
                if (shared1000.unk1A8 >= shared1000.unk1B6 - 1)
                    return FALSE;
                shared1000.unk1A8++;
                if (shared1000.unk1A8 > shared1000.unk1B5 + 3)
                    shared1000.unk1C0 = 1;
                pressedUpDown = TRUE;
            }

            if (pressedUpDown)
            {
                if (shared1000.unk1C0 == 0)
                {
                    sub_80E7A98();
                    return TRUE;
                }
                return FALSE;
            }
        }
    }

    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if (shared1000.unk1A9 != 0)
            shared1000.unk1A9--;
        else
            shared1000.unk1A9 = shared1000.unk1AA[shared1000.unk1A8];
        pressedLeftRight = TRUE;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        if (shared1000.unk1B7 != 0
         || shared1000.unk1A9 == shared1000.unk1AA[shared1000.unk1A8])
            shared1000.unk1A9 = 0;
        else
            shared1000.unk1A9++;
        pressedLeftRight = TRUE;
    }

    if (pressedLeftRight)
    {
        s8 r9 = shared1000.unk1B7;

        shared1000.unk1B7 = (shared1000.unk1A9 == shared1000.unk1AA[shared1000.unk1A8]);
        if (shared1000.unk1B7 != 0)
        {
            shared1000.unk1A8 -= shared1000.unk1B5;
            if (shared1000.unk1A8 == 0)
            {
                shared1000.unk1A8 = 1;
                shared1000.unk1A9 = shared1000.unk1AA[shared1000.unk1A8];
            }
        }
        else if (r9 != 0)
        {
            shared1000.unk1A8 += shared1000.unk1B5;
            if (shared1000.unk1A9 != 0)
                shared1000.unk1A9 = shared1000.unk1AA[shared1000.unk1A8] - 1;
        }
        return TRUE;
    }

    return FALSE;
}

void sub_80E7A98(void)
{
    if (shared1000.unk1A9 >= shared1000.unk1AA[shared1000.unk1A8])
        shared1000.unk1A9 = shared1000.unk1AA[shared1000.unk1A8] - 1;
}

void sub_80E7AD4(void)
{
    if (shared1000.unk26 == 0)
        shared1000.unk1B8 = shared1000.unk2A[shared1000.unk1A8][shared1000.unk1A9];
    else
        shared1000.unk1B8 = shared1000.unk40[shared1000.unk1A8][shared1000.unk1A9];
}

bool8 sub_80E7B40(void)
{
    bool8 pressedUpDown = FALSE;

    shared1000.unk1C0 = 0;
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if (shared1000.unk99A4 == 0)
            return FALSE;
        shared1000.unk99A4--;
        if (shared1000.unk99A4 < shared1000.unk9A29)
        {
            shared1000.unk1C0 = -1;
            return FALSE;
        }
        pressedUpDown = TRUE;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if (shared1000.unk99A4 >= shared1000.unk9A28 - 1)
            return FALSE;
        shared1000.unk99A4++;
        if (shared1000.unk99A4 >= shared1000.unk9A29 + 4)
        {
            shared1000.unk1C0 = 1;
            return FALSE;
        }
        pressedUpDown = TRUE;
    }

    if (pressedUpDown)
    {
        sub_80E7D30();
        return TRUE;
    }

    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        shared1000.unk99A5--;
        if (shared1000.unk99A5 < 0)
            shared1000.unk99A5 = shared1000.unk99A6[shared1000.unk99A4] - 1;
        return TRUE;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        shared1000.unk99A5++;
        if (shared1000.unk99A5 >= shared1000.unk99A6[shared1000.unk99A4])
            shared1000.unk99A5 = 0;
        return TRUE;
    }

    if (gMain.newKeys & START_BUTTON)
    {
        if (shared1000.unk9A29 != 0)
        {
            shared1000.unk1C0 = -shared1000.unk9A29;
            if (shared1000.unk1C0 < -4)
                shared1000.unk1C0 = -4;
        }
        shared1000.unk99A4 += shared1000.unk1C0;
        shared1000.unk1BE = 4;
    }
    else if (gMain.newKeys & SELECT_BUTTON)
    {
        if (shared1000.unk9A29 < shared1000.unk9A28 - 4)
        {
            shared1000.unk1C0 = shared1000.unk9A28 - 4 - shared1000.unk9A29;
            if (shared1000.unk1C0 > 4)
                shared1000.unk1C0 = 4;
        }
        shared1000.unk99A4 += shared1000.unk1C0;
        shared1000.unk1BE = 4;
    }

    return FALSE;
}

void sub_80E7D30(void)
{
    if (shared1000.unk99A5 >= shared1000.unk99A6[shared1000.unk99A4])
        shared1000.unk99A5 = shared1000.unk99A6[shared1000.unk99A4] - 1;
}

void sub_80E7D6C(void)
{
    u16 i;

    for (i = 0; i < shared1000.unkA; i++)
        sub_80E7F00(i, 0xFFFF);
}

void sub_80E7D9C(void)
{
    u16 i;

    for (i = 0; i < shared1000.unkA; i++)
        shared1000.unk4[i] = shared1000.unkC[i];
}

bool8 sub_80E7DD0(void)
{
    u16 r4 = shared1000.unk9A2A[shared1000.unk99A4][shared1000.unk99A5];

    if (shared1000.unk7D != 0
     && shared1000.unk7E[shared1000.unk86] > 1
     && sub_80EB2D4(r4) == 7)
        return FALSE;

    sub_80E7F00(shared1000.unk27, r4);
    sub_80E95A4();
    return TRUE;
}

void sub_80E7E50(void)
{
    u16 r5 = 0;
    u16 i;
    u16 j;

    for (i = 0; i < shared1000.unk84; i++)
    {
        shared1000.unk7E[i] = 0;
        for (j = 0; j < shared1000.unk83; j++)
        {
            shared1000.unkC[r5] = shared1000.unk4[r5];
            shared1000.unk8C[i][j] = 0;
            r5++;
        }
    }
}

void sub_80E7F00(u16 a, u16 b)
{
    u16 r5 = a / shared1000.unk83;
    u16 r8 = a % shared1000.unk83;
    u16 r4 = sub_80EB2D4(shared1000.unkC[a]);
    u16 r3 = sub_80EB2D4(b);

    if (r4 == 7)
    {
        if (r3 != 7)
            shared1000.unk7E[r5]--;
    }
    else
    {
        if (r3 == 7)
            shared1000.unk7E[r5]++;
    }
    r3 = 0;
    shared1000.unk8C[r5][r8] = r3;
    shared1000.unkC[a] = b;
}

u8 sub_80E7FA8(void)
{
    u16 r8 = 0;
    u16 i;
    u8 *r1;
    u8 *r2;

    for (i = 0; i < shared1000.unkA; i++)
    {
        sub_80EB218(shared1000.unk9E14, shared1000.unk4[i], 0);
        sub_80EB218(shared1000.unk9E41, shared1000.unkC[i], 0);
        r1 = shared1000.unk9E14;
        r2 = shared1000.unk9E41;
        while (*r1 == *r2 && *r1 != 0xFF)
        {
            r1++;
            r2++;
        }
        if (*r1 != *r2)
            r8++;
    }
    return r8;
}

bool8 sub_80E8054(void)
{
    u16 i;

    for (i = 0; i < shared1000.unkA; i++)
    {
        if (shared1000.unkC[i] != 0xFFFF)
            return FALSE;
    }
    return TRUE;
}

// CheckMysteryEventPhrase
bool8 sub_80E8094(void)
{
    u16 i;
    u8 *r3;
    u8 *r4;

    for (i = 0; i < 4; i++)
    {
        sub_80EB218(shared1000.unk9E14, shared1000.unkC[i], 0);
        sub_80EB218(shared1000.unk9E41, gMysteryEventPhrase[i], 0);
        r3 = shared1000.unk9E14;
        r4 = shared1000.unk9E41;
        while (*r3 != 0xFF && *r4 != 0xFF)
        {
            if (*r3++ != *r4++)
                return FALSE;
        }
        if (*r3 != 0xFF || *r4 != 0xFF)
            return FALSE;
    }
    return TRUE;
}
