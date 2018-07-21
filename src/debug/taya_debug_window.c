#if DEBUG
#include "global.h"
#include "constants/species.h"
#include "constants/opponents.h"
#include "random.h"
#include "palette.h"
#include "ewram.h"
#include "menu.h"
#include "easy_chat.h"
#include "event_data.h"
#include "string_util.h"
#include "main.h"
#include "start_menu.h"
#include "field_weather.h"
#include "mauville_man.h"
#include "pokemon_storage_system.h"
#include "lottery_corner.h"
#include "battle_setup.h"
#include "region_map.h"
#include "overworld.h"

bool8 debug_sub_8090808(void);
bool8 debug_sub_808560C(void);
bool8 TayaDebugMenu_LanettesPC(void);
bool8 TayaDebugMenu_SimpleText(void);
bool8 TayaDebugMenu_OldMan(void);
bool8 TayaDebugMenu_Trend(void);
bool8 TayaDebugMenu_TrendR(void);
bool8 TayaDebugMenu_TownFlags(void);
bool8 TayaDebugMenu_AwardARibbon(void);
bool8 TayaDebugMenu_PKMNLottery(void);
bool8 TayaDebugMenu_Trainer(void);
bool8 TayaDebugMenu_PokenavD(void);
void debug_sub_80915BC(void);
void debug_sub_80916AC(void);

EWRAM_DATA s8 sTayaTopMenuPage = 0;

struct TayaLuckyNumberEwramStruct {
    u8 digit;
    u8 charbuf[7];
    u16 curLuckyId;
    s32 tempLuckyId;
    u16 digitDeltaMagnitude;
};

struct TayaMonDataEwramStruct {
    u8 data[6][3];
    u8 charbuf[0x40];
    u8 state;
    u8 x;
    u8 y;
    u8 redraw;
    u8 maxVal;
};

#define eTayaLuckyNumber (*(struct TayaLuckyNumberEwramStruct *)gSharedMem)
#define eTayaMonData (*(struct TayaMonDataEwramStruct *)gSharedMem)

const u8 gUnknown_Debug_083C4E54[] = _("Profile");
const u8 gUnknown_Debug_083C4E5C[] = _("Battle’s　start");
const u8 gUnknown_Debug_083C4E6B[] = _("Good　saying");
const u8 gUnknown_Debug_083C4E77[] = _("Lose　a　battle");
const u8 gUnknown_Debug_083C4E85[] = _("MAIL");
const u8 gUnknown_Debug_083C4E8A[] = _("MAIL　salutation");
const u8 gUnknown_Debug_083C4E9A[] = _("BARD’s　song");
const u8 gUnknown_Debug_083C4EA6[] = _("Interview");
const u8 gUnknown_Debug_083C4EB0[] = _("InterviewシBTス");

const struct {
    const u8 * text;
    u32 unk4;
} gUnknown_Debug_083C4EC0[] = {
    {gUnknown_Debug_083C4E54, 0x0},
    {gUnknown_Debug_083C4E5C, 0x1},
    {gUnknown_Debug_083C4E6B, 0xD},
    {gUnknown_Debug_083C4E77, 0x3},
    {gUnknown_Debug_083C4E85, 0x4},
    {gUnknown_Debug_083C4E8A, 0x5},
    {gUnknown_Debug_083C4E9A, 0x6},
    {gUnknown_Debug_083C4EA6, 0x7},
    {gUnknown_Debug_083C4EB0, 0xC}
};

const u16 gUnknown_Debug_083C4F08[] = {0x45b, 0x430, 0x20f};

const u8 gUnknown_Debug_083C4F0E[] = _("BARD");
const u8 gUnknown_Debug_083C4F13[] = _("HIPSTER");
const u8 gUnknown_Debug_083C4F1B[] = _("RECYCLE");
const u8 gUnknown_Debug_083C4F23[] = _("STORYTELLER");
const u8 gUnknown_Debug_083C4F2F[] = _("GIDDY　GUY");
const u8 gUnknown_Debug_083C4F39[] = _("Flag　OFF");
const u8 gUnknown_Debug_083C4F42[] = _("21　letters");
const u8 gUnknown_Debug_083C4F4D[] = _("ナウくなる");

const struct {
    const u8 * text;
    u8 filler[4];
} gUnknown_Debug_083C4F54[] = {
    {gUnknown_Debug_083C4F0E},
    {gUnknown_Debug_083C4F13},
    {gUnknown_Debug_083C4F1B},
    {gUnknown_Debug_083C4F23},
    {gUnknown_Debug_083C4F2F},
    {gUnknown_Debug_083C4F39},
    {gUnknown_Debug_083C4F42},
    {gUnknown_Debug_083C4F4D}
};

const u8 gUnknown_Debug_083C4F94[] = _("しょうしょうおまちください！");
const u8 gUnknown_Debug_083C4FA3[] = _("Weather");
const u8 gUnknown_Debug_083C4FAB[] = _("LANETTE’S　PC");
const u8 gUnknown_Debug_083C4FB8[] = _("SimpleText");
const u8 gUnknown_Debug_083C4FC3[] = _("Old　man");
const u8 gUnknown_Debug_083C4FCB[] = _("Trend");
const u8 gUnknown_Debug_083C4FD1[] = _("Trend　R");
const u8 gUnknown_Debug_083C4FD9[] = _("Town　flag");
const u8 gUnknown_Debug_083C4FE3[] = _("Award　a　ribbon");
const u8 gUnknown_Debug_083C4FF2[] = _("{PKMN}LOTTERY");
const u8 gUnknown_Debug_083C4FFC[] = _("Trainer");
const u8 gUnknown_Debug_083C5004[] = _("POKéNAV　D");

const struct MenuAction gUnknown_Debug_083C5010[] = {
    {gUnknown_Debug_083C4FA3, debug_sub_808560C},
    {gUnknown_Debug_083C4FAB, TayaDebugMenu_LanettesPC},
    {gUnknown_Debug_083C4FB8, TayaDebugMenu_SimpleText},
    {gUnknown_Debug_083C4FC3, TayaDebugMenu_OldMan},
    {gUnknown_Debug_083C4FCB, TayaDebugMenu_Trend},
    {gUnknown_Debug_083C4FD1, TayaDebugMenu_TrendR},
    {gUnknown_Debug_083C4FD9, TayaDebugMenu_TownFlags},
    {gUnknown_Debug_083C4FE3, TayaDebugMenu_AwardARibbon},
    {gUnknown_Debug_083C4FF2, TayaDebugMenu_PKMNLottery}
};

const struct MenuAction gUnknown_Debug_083C5058[] = {
    {gUnknown_Debug_083C4FFC, TayaDebugMenu_Trainer},
    {gUnknown_Debug_083C5004, TayaDebugMenu_PokenavD}
};

const struct {
    const struct MenuAction *menuActions;
    u8 nitems;
} gUnknown_Debug_83C5068[] = {
    {gUnknown_Debug_083C5010, 9},
    {gUnknown_Debug_083C5058, 2}
};

const u8 gUnknown_Debug_083C5078[] = _("CHANP");
const u8 gUnknown_Debug_083C507E[] = _("COOL");
const u8 gUnknown_Debug_083C5083[] = _("BEAUTY");
const u8 gUnknown_Debug_083C508A[] = _("CUTE");
const u8 gUnknown_Debug_083C508F[] = _("SMART");
const u8 gUnknown_Debug_083C5095[] = _("TOUGH");
const u8 gUnknown_Debug_083C509B[] = _("WIN");
const u8 gUnknown_Debug_083C509F[] = _("VICTORY");
const u8 gUnknown_Debug_083C50A7[] = _("BROMIDE");
const u8 gUnknown_Debug_083C50AF[] = _("ACCESSIT");
const u8 gUnknown_Debug_083C50B8[] = _("MARINE");
const u8 gUnknown_Debug_083C50BF[] = _("LAND");
const u8 gUnknown_Debug_083C50C4[] = _("SKY");
const u8 gUnknown_Debug_083C50C8[] = _("COUNTRY");
const u8 gUnknown_Debug_083C50D0[] = _("NATIONAL");
const u8 gUnknown_Debug_083C50D9[] = _("EARTH");
const u8 gUnknown_Debug_083C50DF[] = _("WORLD");
const u8 gUnknown_Debug_083C50E5[] = _("　　　　　");

const struct {
    const u8 * text;
    u16 param;
} gUnknown_Debug_083C50EC[][3] = {
    {
        {gUnknown_Debug_083C5078, MON_DATA_CHAMPION_RIBBON},
        {gUnknown_Debug_083C507E, MON_DATA_COOL_RIBBON},
        {gUnknown_Debug_083C5083, MON_DATA_BEAUTY_RIBBON}
    }, {
        {gUnknown_Debug_083C508A, MON_DATA_CUTE_RIBBON},
        {gUnknown_Debug_083C508F, MON_DATA_SMART_RIBBON},
        {gUnknown_Debug_083C5095, MON_DATA_TOUGH_RIBBON}
    }, {
        {gUnknown_Debug_083C509B, MON_DATA_WINNING_RIBBON},
        {gUnknown_Debug_083C509F, MON_DATA_VICTORY_RIBBON},
        {gUnknown_Debug_083C50A7, MON_DATA_ARTIST_RIBBON}
    }, {
        {gUnknown_Debug_083C50AF, MON_DATA_EFFORT_RIBBON},
        {gUnknown_Debug_083C50B8, MON_DATA_GIFT_RIBBON_1},
        {gUnknown_Debug_083C50BF, MON_DATA_GIFT_RIBBON_2}
    }, {
        {gUnknown_Debug_083C50C4, MON_DATA_GIFT_RIBBON_3},
        {gUnknown_Debug_083C50C8, MON_DATA_GIFT_RIBBON_4},
        {gUnknown_Debug_083C50D0, MON_DATA_GIFT_RIBBON_5}
    }, {
        {gUnknown_Debug_083C50D9, MON_DATA_GIFT_RIBBON_6},
        {gUnknown_Debug_083C50DF, MON_DATA_GIFT_RIBBON_7},
        {gUnknown_Debug_083C50E5, 0 /* sentinel */}
    }
};

const u8 gUnknown_Debug_083C517C[] = _("Select　Ribbon");

bool8 TayaDebugMenu_Trend(void)
{
    u8 sp00[32];
    u8 sp20[8];
    u16 i;
    struct EasyChatPair *pair;

    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 30, 11);
    pair = gSaveBlock1.easyChatPairs;

    for (i = 0; i < 5; i++)
    {
        u8 * r4;

        sp00[0] = pair->unk1_6 ? CHAR_0 + 1 : CHAR_0 + 0;
        EasyChat_GetWordText(sp20, pair->words[0]);
        r4 = StringCopyPadded(sp00 + 1, sp20, CHAR_SPACE, 7);
        EasyChat_GetWordText(sp20, pair->words[1]);
        r4 = StringCopyPadded(r4, sp20, CHAR_SPACE, 8);
        r4 = ConvertIntToDecimalStringN(r4, pair->unk0_0, STR_CONV_MODE_RIGHT_ALIGN, 3);
        *r4++ = CHAR_SPACE;
        r4 = ConvertIntToDecimalStringN(r4, pair->unk0_7, STR_CONV_MODE_RIGHT_ALIGN, 3);
        *r4++ = CHAR_SPACE;
        ConvertIntToDecimalStringN(r4, pair->unk2, STR_CONV_MODE_RIGHT_ALIGN, 5);
        Menu_PrintText(sp00, 1, 2 * i + 1);
        pair++;
    }
    gMenuCallback = debug_sub_8090808;
    return FALSE;
}

bool8 debug_sub_8090808(void)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        Menu_EraseScreen();
        CloseMenu();
        return TRUE;
    }

    return FALSE;
}

bool8 TayaDebugMenu_TrendR(void)
{
    u16 i;
    u16 j;

    for (i = 0; i < 5; i++)
    {
        for (j = 0; j < 2; j++)
        {
            gSaveBlock1.easyChatPairs[i].words[j] = sub_80EB72C(Random() % 22);
        }
    }
    Menu_EraseScreen();
    CloseMenu();
    return TRUE;
}

bool8 debug_sub_8090880(void)
{
    if (!UpdatePaletteFade())
    {
        sub_80E60D8();
        return TRUE;
    }

    return FALSE;
}

bool8 debug_sub_809089C(void)
{
    s8 input = Menu_ProcessInput();

    switch (input)
    {
        case -1:
            CloseMenu();
            return TRUE;
        case -2:
            return FALSE;
        default:
            gSpecialVar_0x8004 = gUnknown_Debug_083C4EC0[input].unk4;
            switch (gSpecialVar_0x8004)
            {
                case 5:
                case 7:
                case 8:
                case 11:
                case 12:
                    gSpecialVar_0x8005 = 0;
                    gSpecialVar_0x8006 = 0;
                default:
                    FadeScreen(1, 0);
                    gMenuCallback = debug_sub_8090880;
                    break;
            }
            return FALSE;
    }
}

bool8 TayaDebugMenu_SimpleText(void)
{
    Menu_DrawStdWindowFrame(0, 0, 12, 19);
    Menu_PrintItems(1, 1, ARRAY_COUNT(gUnknown_Debug_083C4EC0), gUnknown_Debug_083C4EC0);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C4EC0), 0, 11);
    gMenuCallback = debug_sub_809089C;
    return FALSE;
}

bool8 debug_sub_8090984(void)
{
    s8 input = Menu_ProcessInput();

    switch (input)
    {
        case -1:
            CloseMenu();
            return TRUE;
        default:
            if (input < 5)
            {
                debug_sub_810B32C(input);
                CloseMenu();
                return TRUE;
            }
            break;
        case -2:
            return FALSE;
    }

    if (input == 5)
    {
        sub_80F7F30();
    }
    else if (input == 6)
    {
        u16 i;

        for (i = 0; i < 3; i++)
        {
            union MauvilleMan *mauvilleMan = &gSaveBlock1.mauvilleMan;
            mauvilleMan->bard.songLyrics[i] = gUnknown_Debug_083C4F08[i];
            mauvilleMan->bard.temporaryLyrics[i] = gUnknown_Debug_083C4F08[i];
            gSaveBlock1.easyChats.unk2B28[i] = gUnknown_Debug_083C4F08[i];
        }
    }
    else if (input == 7)
    {
        u16 i;

        for (i = 0; i < 33; i++)
        {
            sub_80EB890(i);
        }
    }
    CloseMenu();
    return TRUE;
}

bool8 TayaDebugMenu_OldMan(void)
{
    Menu_DrawStdWindowFrame(0, 0, 10, 17);
    Menu_PrintItems(1, 1, ARRAY_COUNT(gUnknown_Debug_083C4F54), gUnknown_Debug_083C4F54);
    InitMenu(0, 1, 1, ARRAY_COUNT(gUnknown_Debug_083C4F54), GetCurrentMauvilleOldMan(), 9);
    gMenuCallback = debug_sub_8090984;
    return FALSE;
}

bool8 TayaDebugMenu_LanettesPC(void)
{
    Menu_EraseScreen();
    ShowPokemonStorageSystem();
    return TRUE;
}

bool8 TayaDebugMenu_TownFlags(void)
{
    FlagSet(FLAG_VISITED_LITTLEROOT_TOWN);
    FlagSet(FLAG_VISITED_OLDALE_TOWN);
    FlagSet(FLAG_VISITED_DEWFORD_TOWN);
    FlagSet(FLAG_VISITED_LAVARIDGE_TOWN);
    FlagSet(FLAG_VISITED_FALLARBOR_TOWN);
    FlagSet(FLAG_VISITED_VERDANTURF_TOWN);
    FlagSet(FLAG_VISITED_PACIFIDLOG_TOWN);
    FlagSet(FLAG_VISITED_PETALBURG_CITY);
    FlagSet(FLAG_VISITED_SLATEPORT_CITY);
    FlagSet(FLAG_VISITED_MAUVILLE_CITY);
    FlagSet(FLAG_VISITED_RUSTBORO_CITY);
    FlagSet(FLAG_VISITED_FORTREE_CITY);
    FlagSet(FLAG_VISITED_LILYCOVE_CITY);
    FlagSet(FLAG_VISITED_MOSSDEEP_CITY);
    FlagSet(FLAG_VISITED_SOOTOPOLIS_CITY);
    FlagSet(FLAG_VISITED_EVER_GRANDE_CITY);
    FlagSet(FLAG_LANDMARK_BATTLE_TOWER);
    FlagSet(FLAG_LANDMARK_SOUTHERN_ISLAND);
    FlagSet(FLAG_LANDMARK_FIERY_PATH);
    FlagSet(FLAG_SYS_POKEMON_LEAGUE_FLY);
    FlagSet(FLAG_LANDMARK_ISLAND_CAVE);
    FlagSet(FLAG_LANDMARK_DESERT_RUINS);
    FlagSet(FLAG_LANDMARK_FOSSIL_MANIACS_HOUSE);
    FlagSet(FLAG_LANDMARK_SCORCHED_SLAB);
    FlagSet(FLAG_LANDMARK_ANCIENT_TOMB);
    FlagSet(FLAG_LANDMARK_TUNNELERS_REST_HOUSE);
    FlagSet(FLAG_LANDMARK_HUNTERS_HOUSE);
    FlagSet(FLAG_LANDMARK_SEALED_CHAMBER);
    FlagSet(FLAG_LANDMARK_FLOWER_SHOP);
    FlagSet(FLAG_LANDMARK_MR_BRINEY_HOUSE);
    FlagSet(FLAG_LANDMARK_ABANDONED_SHIP);
    FlagSet(FLAG_LANDMARK_SEASHORE_HOUSE);
    FlagSet(FLAG_LANDMARK_NEW_MAUVILLE);
    FlagSet(FLAG_LANDMARK_OLD_LADY_REST_SHOP);
    FlagSet(FLAG_LANDMARK_TRICK_HOUSE);
    FlagSet(FLAG_LANDMARK_WINSTRATE_FAMILY);
    FlagSet(FLAG_LANDMARK_GLASS_WORKSHOP);
    FlagSet(FLAG_LANDMARK_LANETTES_HOUSE);
    FlagSet(FLAG_LANDMARK_POKEMON_DAYCARE);
    FlagSet(FLAG_LANDMARK_SEAFLOOR_CAVERN);
    FlagSet(FLAG_SYS_RIBBON_GET);
    CloseMenu();
    return TRUE;
}

bool8 TayaDebugMenu_AwardARibbon(void)
{
    BlendPalettes(0xFFFFFFFF, 16, RGB(0, 0, 0));
    SetMainCallback2(debug_sub_80915BC);
    CloseMenu();
    return TRUE;
}

void debug_sub_8090C44(void)
{
    ConvertIntToDecimalStringN(eTayaLuckyNumber.charbuf, eTayaLuckyNumber.curLuckyId, STR_CONV_MODE_LEADING_ZEROS, 5);
    Menu_PrintText(eTayaLuckyNumber.charbuf, 1, 1);
    StringFill(eTayaLuckyNumber.charbuf, CHAR_SPACE, 5);
    eTayaLuckyNumber.charbuf[eTayaLuckyNumber.digit] = 0x79;
    Menu_PrintText(eTayaLuckyNumber.charbuf, 1, 3);
}

#ifdef NONMATCHING
// mayday mayday
bool8 debug_sub_8090C88(void)
{
    bool8 r8 = TRUE;

    if (gMain.newKeys & DPAD_LEFT && eTayaLuckyNumber.digit != 0)
    {
        eTayaLuckyNumber.digit--;
    }
    else if (gMain.newKeys & DPAD_RIGHT && eTayaLuckyNumber.digit < 4)
    {
        eTayaLuckyNumber.digit++;
    }
    else
    {
        if (gMain.newAndRepeatedKeys & DPAD_UP)
        {
            u8 r4;

            eTayaLuckyNumber.tempLuckyId = eTayaLuckyNumber.curLuckyId;
            eTayaLuckyNumber.charbuf0 = 10000;
            for (r4 = 0; r4 < eTayaLuckyNumber.digit; r4++)
                eTayaLuckyNumber.charbuf0 /= 10;
            eTayaLuckyNumber.tempLuckyId += eTayaLuckyNumber.charbuf0;
            if (eTayaLuckyNumber.tempLuckyId > 0xFFFF)
                eTayaLuckyNumber.tempLuckyId = 0xFFFF;
            if (eTayaLuckyNumber.curLuckyId != eTayaLuckyNumber.tempLuckyId)
            {
                eTayaLuckyNumber.curLuckyId = eTayaLuckyNumber.tempLuckyId;
                goto check;
            }
        }
        if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        {
            u8 r4;

            eTayaLuckyNumber.tempLuckyId = eTayaLuckyNumber.curLuckyId;
            eTayaLuckyNumber.charbuf0 = 10000;
            for (r4 = 0; r4 < eTayaLuckyNumber.digit; r4++)
                eTayaLuckyNumber.charbuf0 /= 10;
            eTayaLuckyNumber.tempLuckyId -= eTayaLuckyNumber.charbuf0;
            if (eTayaLuckyNumber.tempLuckyId < 0)
                eTayaLuckyNumber.tempLuckyId = 0;
            if (eTayaLuckyNumber.curLuckyId != eTayaLuckyNumber.tempLuckyId)
            {
                eTayaLuckyNumber.curLuckyId = eTayaLuckyNumber.tempLuckyId;
                goto check;
            }
        }
        if (gMain.newKeys & B_BUTTON)
        {
            CloseMenu();
            return TRUE;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            SetLotteryNumber16_Unused(eTayaLuckyNumber.curLuckyId);
            CloseMenu();
            return TRUE;
        }
        r8 = FALSE;
    }

check:
    if (r8)
        debug_sub_8090C44();
    return FALSE;
}
#else
NAKED bool8 debug_sub_8090C88(void)
{
    asm("\tpush\t{r4, r5, r6, r7, lr}\n"
        "\tmov\tr7, r8\n"
        "\tpush\t{r7}\n"
        "\tadd\tsp, sp, #0xfffffffc\n"
        "\tmov\tr0, #0x1\n"
        "\tmov\tr8, r0\n"
        "\tldr\tr2, ._59        @ gMain\n"
        "\tldrh\tr1, [r2, #0x2e]\n"
        "\tmov\tr0, #0x20\n"
        "\tand\tr0, r0, r1\n"
        "\tadd\tr3, r2, #0\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._57\t@cond_branch\n"
        "\tldr\tr1, ._59 + 4    @ gSharedMem\n"
        "\tldrb\tr0, [r1]\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._57\t@cond_branch\n"
        "\tsub\tr0, r0, #0x1\n"
        "\tstrb\tr0, [r1]\n"
        "\tb\t._62\n"
        "._60:\n"
        "\t.align\t2, 0\n"
        "._59:\n"
        "\t.word\tgMain\n"
        "\t.word\tgSharedMem\n"
        "._67:\n"
        "\tadd\tr0, r0, #0x1\n"
        "\tstrb\tr0, [r1]\n"
        "\tb\t._62\n"
        "._77:\n"
        "\tstrh\tr1, [r7, #0x8]\n"
        "\tb\t._62\n"
        "._79:\n"
        "\tldr\tr0, ._64        @ gSharedMem\n"
        "\tldrh\tr0, [r0, #0x8]\n"
        "\tbl\tSetLotteryNumber16_Unused\n"
        "._78:\n"
        "\tbl\tCloseMenu\n"
        "\tmov\tr0, #0x1\n"
        "\tb\t._63\n"
        "._65:\n"
        "\t.align\t2, 0\n"
        "._64:\n"
        "\t.word\tgSharedMem\n"
        "._57:\n"
        "\tldrh\tr1, [r3, #0x2e]\n"
        "\tmov\tr0, #0x10\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._66\t@cond_branch\n"
        "\tldr\tr1, ._81        @ gSharedMem\n"
        "\tldrb\tr0, [r1]\n"
        "\tcmp\tr0, #0x3\n"
        "\tbls\t._67\t@cond_branch\n"
        "._66:\n"
        "\tldrh\tr1, [r3, #0x30]\n"
        "\tmov\tr0, #0x40\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._68\t@cond_branch\n"
        "\tldr\tr0, ._81        @ gSharedMem\n"
        "\tldrh\tr1, [r0, #0x8]\n"
        "\tstr\tr1, [r0, #0xc]\n"
        "\tldr\tr1, ._81 + 4    @ 0x2710\n"
        "\tstrh\tr1, [r0, #0x10]\n"
        "\tmov\tr4, #0x0\n"
        "\tldrb\tr1, [r0]\n"
        "\tadd\tr7, r0, #0\n"
        "\tcmp\tr4, r1\n"
        "\tbcs\t._69\t@cond_branch\n"
        "\tadd\tr5, r7, #0\n"
        "\tadd\tr6, r1, #0\n"
        "._70:\n"
        "\tldrh\tr0, [r5, #0x10]\n"
        "\tmov\tr1, #0xa\n"
        "\tstr\tr3, [sp]\n"
        "\tbl\t__udivsi3\n"
        "\tstrh\tr0, [r5, #0x10]\n"
        "\tadd\tr0, r4, #1\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr4, r0, #0x18\n"
        "\tldr\tr3, [sp]\n"
        "\tcmp\tr4, r6\n"
        "\tbcc\t._70\t@cond_branch\n"
        "._69:\n"
        "\tldrh\tr1, [r7, #0x10]\n"
        "\tldr\tr0, [r7, #0xc]\n"
        "\tadd\tr0, r0, r1\n"
        "\tstr\tr0, [r7, #0xc]\n"
        "\tldr\tr1, ._81 + 8    @ 0xffff\n"
        "\tcmp\tr0, r1\n"
        "\tble\t._71\t@cond_branch\n"
        "\tstr\tr1, [r7, #0xc]\n"
        "._71:\n"
        "\tldrh\tr0, [r7, #0x8]\n"
        "\tldr\tr1, [r7, #0xc]\n"
        "\tcmp\tr0, r1\n"
        "\tbne\t._77\t@cond_branch\n"
        "._68:\n"
        "\tldrh\tr1, [r3, #0x30]\n"
        "\tmov\tr0, #0x80\n"
        "\tand\tr0, r0, r1\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._73\t@cond_branch\n"
        "\tldr\tr0, ._81        @ gSharedMem\n"
        "\tldrh\tr1, [r0, #0x8]\n"
        "\tstr\tr1, [r0, #0xc]\n"
        "\tldr\tr1, ._81 + 4    @ 0x2710\n"
        "\tstrh\tr1, [r0, #0x10]\n"
        "\tmov\tr4, #0x0\n"
        "\tldrb\tr1, [r0]\n"
        "\tadd\tr7, r0, #0\n"
        "\tcmp\tr4, r1\n"
        "\tbcs\t._74\t@cond_branch\n"
        "\tadd\tr5, r7, #0\n"
        "\tadd\tr6, r1, #0\n"
        "._75:\n"
        "\tldrh\tr0, [r5, #0x10]\n"
        "\tmov\tr1, #0xa\n"
        "\tstr\tr3, [sp]\n"
        "\tbl\t__udivsi3\n"
        "\tstrh\tr0, [r5, #0x10]\n"
        "\tadd\tr0, r4, #1\n"
        "\tlsl\tr0, r0, #0x18\n"
        "\tlsr\tr4, r0, #0x18\n"
        "\tldr\tr3, [sp]\n"
        "\tcmp\tr4, r6\n"
        "\tbcc\t._75\t@cond_branch\n"
        "._74:\n"
        "\tadd\tr2, r7, #0\n"
        "\tldrh\tr1, [r2, #0x10]\n"
        "\tldr\tr0, [r2, #0xc]\n"
        "\tsub\tr0, r0, r1\n"
        "\tstr\tr0, [r2, #0xc]\n"
        "\tcmp\tr0, #0\n"
        "\tbge\t._76\t@cond_branch\n"
        "\tmov\tr0, #0x0\n"
        "\tstr\tr0, [r2, #0xc]\n"
        "._76:\n"
        "\tldrh\tr0, [r2, #0x8]\n"
        "\tldr\tr1, [r2, #0xc]\n"
        "\tcmp\tr0, r1\n"
        "\tbne\t._77\t@cond_branch\n"
        "._73:\n"
        "\tldrh\tr2, [r3, #0x2e]\n"
        "\tmov\tr0, #0x2\n"
        "\tand\tr0, r0, r2\n"
        "\tcmp\tr0, #0\n"
        "\tbne\t._78\t@cond_branch\n"
        "\tmov\tr0, #0x1\n"
        "\tand\tr0, r0, r2\n"
        "\tcmp\tr0, #0\n"
        "\tbne\t._79\t@cond_branch\n"
        "\tmov\tr0, #0x0\n"
        "\tmov\tr8, r0\n"
        "._62:\n"
        "\tmov\tr0, r8\n"
        "\tcmp\tr0, #0\n"
        "\tbeq\t._80\t@cond_branch\n"
        "\tbl\tdebug_sub_8090C44\n"
        "._80:\n"
        "\tmov\tr0, #0x0\n"
        "._63:\n"
        "\tadd\tsp, sp, #0x4\n"
        "\tpop\t{r3}\n"
        "\tmov\tr8, r3\n"
        "\tpop\t{r4, r5, r6, r7}\n"
        "\tpop\t{r1}\n"
        "\tbx\tr1\n"
        "._82:\n"
        "\t.align\t2, 0\n"
        "._81:\n"
        "\t.word\tgSharedMem\n"
        "\t.word\t0x2710\n"
        "\t.word\t0xffff");
}
#endif // NONMATCHING

bool8 TayaDebugMenu_PKMNLottery(void)
{
    Menu_DrawStdWindowFrame(0, 0, 6, 5);
    RetrieveLotteryNumber();
    eTayaLuckyNumber.curLuckyId = gSpecialVar_Result;
    eTayaLuckyNumber.digit = 0;
    debug_sub_8090C44();
    gMenuCallback = debug_sub_8090C88;
    return FALSE;
}

bool8 TayaDebugMenu_Trainer(void)
{
    u16 i;

    for (i = 0; i < ARRAY_COUNT(gTrainerEyeTrainers); i++)
        SetTrainerFlag(gTrainerEyeTrainers[i].opponentIDs[0]);

    SetTrainerFlag(TRAINER_ROXANNE);
    SetTrainerFlag(TRAINER_BRAWLY);
    SetTrainerFlag(TRAINER_WATTSON);
    SetTrainerFlag(TRAINER_FLANNERY);
    SetTrainerFlag(TRAINER_NORMAN);
    SetTrainerFlag(TRAINER_WINONA);
    SetTrainerFlag(TRAINER_TATE_AND_LIZA);
    SetTrainerFlag(TRAINER_WALLACE);
    SetTrainerFlag(TRAINER_SIDNEY);
    SetTrainerFlag(TRAINER_PHOEBE);
    SetTrainerFlag(TRAINER_GLACIA);
    SetTrainerFlag(TRAINER_DRAKE);
    SetTrainerFlag(TRAINER_STEVEN);
    CloseMenu();
    return TRUE;
}

bool8 TayaDebugMenu_PokenavD(void)
{
    u16 i;
    u16 j;
    
    Menu_DisplayDialogueFrame();
    
    for (i = 0; i < 14; i++)
    {
        StringCopy(gSharedMem, gUnknown_Debug_083C4F94);
        gSharedMem[i + 1] = EOS;
        Menu_PrintText(gSharedMem, 2, 15);
        for (j = 0; j < 30; j++)
        {
            struct BoxPokemon *boxPokemon;
            u32 otId = Random() + 1;
            u16 level = (Random() % 100) + 1;
            u16 species = (Random() % 386) + 1;
            if (species >= SPECIES_OLD_UNOWN_B)
            {
                species += SPECIES_TREECKO - SPECIES_OLD_UNOWN_B;
                if (species >= NUM_SPECIES)
                    species = SPECIES_BULBASAUR;
            }
            boxPokemon = gPokemonStorage.boxes[i] + j;
            CreateBoxMon(boxPokemon, species, level, 32, FALSE, 0, TRUE, otId);

            otId = Random() & 0xff;
            SetBoxMonData(boxPokemon, MON_DATA_COOL, &otId);

            otId = Random() & 0xff;
            SetBoxMonData(boxPokemon, MON_DATA_BEAUTY, &otId);

            otId = Random() & 0xff;
            SetBoxMonData(boxPokemon, MON_DATA_CUTE, &otId);

            otId = Random() & 0xff;
            SetBoxMonData(boxPokemon, MON_DATA_SMART, &otId);

            otId = Random() & 0xff;
            SetBoxMonData(boxPokemon, MON_DATA_TOUGH, &otId);

            otId = Random() & 0xff;
            SetBoxMonData(boxPokemon, MON_DATA_SHEEN, &otId);

            otId = (Random() & 3) + 1;
            SetBoxMonData(boxPokemon, MON_DATA_COOL_RIBBON, &otId);

            otId = (Random() & 3) + 1;
            SetBoxMonData(boxPokemon, MON_DATA_BEAUTY_RIBBON, &otId);

            otId = (Random() & 3) + 1;
            SetBoxMonData(boxPokemon, MON_DATA_CUTE_RIBBON, &otId);

            otId = (Random() & 3) + 1;
            SetBoxMonData(boxPokemon, MON_DATA_TOUGH_RIBBON, &otId);

            otId = (Random() & 3) + 1;
            SetBoxMonData(boxPokemon, MON_DATA_SMART_RIBBON, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_CHAMPION_RIBBON, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_WINNING_RIBBON, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_VICTORY_RIBBON, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_ARTIST_RIBBON, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_EFFORT_RIBBON, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_GIFT_RIBBON_1, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_GIFT_RIBBON_2, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_GIFT_RIBBON_3, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_GIFT_RIBBON_4, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_GIFT_RIBBON_5, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_GIFT_RIBBON_6, &otId);

            otId = Random() & 1;
            SetBoxMonData(boxPokemon, MON_DATA_GIFT_RIBBON_7, &otId);
        }
    }
    TayaDebugMenu_TownFlags();
    TayaDebugMenu_Trainer();
    CloseMenu();
    return TRUE;
}

bool8 TayaDebugMenu_8091190(void)
{
    s8 input = Menu_ProcessInput();
    s8 r4;

    switch (input)
    {
        default:
            gMenuCallback = gUnknown_Debug_83C5068[sTayaTopMenuPage].menuActions[input].func;
            return FALSE;
        case -2:
            r4 = sTayaTopMenuPage;
            if (gMain.newKeys & DPAD_LEFT)
            {
                sTayaTopMenuPage--;
                if (sTayaTopMenuPage < 0)
                    sTayaTopMenuPage = 1;
            }

            if (gMain.newKeys & DPAD_RIGHT)
            {
                sTayaTopMenuPage++;
                if ((u8)sTayaTopMenuPage > 1)
                    sTayaTopMenuPage = 0;
            }
            if (r4 != sTayaTopMenuPage)
            {
                Menu_EraseScreen();
                Menu_DrawStdWindowFrame(0, 0, 11, 19);
                Menu_PrintItems(1, 1, gUnknown_Debug_83C5068[sTayaTopMenuPage].nitems, gUnknown_Debug_83C5068[sTayaTopMenuPage].menuActions);
                InitMenu(0, 1, 1, gUnknown_Debug_83C5068[sTayaTopMenuPage].nitems, 0, 10);
            }
            return FALSE;
        case -1:
            CloseMenu();
            return TRUE;
    }
}

bool8 InitTayaDebugWindow(void)
{
    sTayaTopMenuPage = 0;
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 11, 19);
    Menu_PrintItems(1, 1, 9, gUnknown_Debug_83C5068[0].menuActions);
    InitMenu(0, 1, 1, 9, 0, 10);
    gMenuCallback = TayaDebugMenu_8091190;
    return FALSE;
}

bool8 debug_sub_80912D8(void)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(debug_sub_8110F28);
        return TRUE;
    }
    return FALSE;
}

bool8 debug_sub_8091300(void)
{
    FadeScreen(1, 0);
    gMenuCallback = debug_sub_80912D8;
    return FALSE;
}

void debug_sub_8091320(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void debug_sub_8091334(void)
{
    AnimateSprites();
    BuildOamBuffer();

    switch (eTayaMonData.state)
    {
        case 0:
            eTayaMonData.redraw = 0;
            if (gMain.newKeys & DPAD_UP)
            {
                if (eTayaMonData.y != 0)
                {
                    eTayaMonData.y--;
                    eTayaMonData.redraw = 1;
                }
            }
            if (gMain.newKeys & DPAD_DOWN)
            {
                if (eTayaMonData.x != 2)
                {
                    if (eTayaMonData.y < 5)
                    {
                        eTayaMonData.y++;
                        eTayaMonData.redraw = 1;
                    }
                }
                else
                {
                    if (eTayaMonData.y < 4)
                    {
                        eTayaMonData.y++;
                        eTayaMonData.redraw = 1;
                    }
                }
            }
            if (gMain.newKeys & DPAD_LEFT)
            {
                if (eTayaMonData.x != 0)
                {
                    eTayaMonData.x--;
                    eTayaMonData.redraw = 1;
                }
            }
            if (gMain.newKeys & DPAD_RIGHT)
            {
                if (eTayaMonData.y != 5)
                {
                    if (eTayaMonData.x < 2)
                    {
                        eTayaMonData.x++;
                        eTayaMonData.redraw = 1;
                    }
                }
                else
                {
                    if (eTayaMonData.x < 1)
                    {
                        eTayaMonData.x++;
                        eTayaMonData.redraw = 1;
                    }
                }
            }
            if (eTayaMonData.redraw)
            {
                debug_sub_80916AC();
            }
            else if (gMain.newKeys & A_BUTTON)
            {
                u16 param = gUnknown_Debug_083C50EC[eTayaMonData.y][eTayaMonData.x].param;
                if (param >= MON_DATA_COOL_RIBBON && param <= MON_DATA_TOUGH_RIBBON)
                    eTayaMonData.maxVal = 4;
                else
                    eTayaMonData.maxVal = 1;
                eTayaMonData.state = 1;
            }
            else if (gMain.newKeys & B_BUTTON)
            {
                BlendPalettes(0xFFFFFFFF, 16, RGB(0, 0, 0));
                SetMainCallback2(sub_80546F0);
            }
            break;
        case 1:
            eTayaMonData.redraw = 0;
            if (gMain.newKeys & DPAD_UP)
            {
                if (eTayaMonData.data[eTayaMonData.y][eTayaMonData.x] < eTayaMonData.maxVal)
                {
                    eTayaMonData.data[eTayaMonData.y][eTayaMonData.x]++;
                    eTayaMonData.redraw = 1;
                }
            }
            if (gMain.newKeys & DPAD_DOWN)
            {
                if (eTayaMonData.data[eTayaMonData.y][eTayaMonData.x] != 0)
                {
                    eTayaMonData.data[eTayaMonData.y][eTayaMonData.x]--;
                    eTayaMonData.redraw = 1;
                }
            }
            if (eTayaMonData.redraw)
            {
                debug_sub_80916AC();
            }
            else
            {
                if (gMain.newKeys & B_BUTTON)
                {
                    eTayaMonData.data[eTayaMonData.y][eTayaMonData.x] = GetMonData(gPlayerParty, gUnknown_Debug_083C50EC[eTayaMonData.y][eTayaMonData.x].param);
                    debug_sub_80916AC();
                    eTayaMonData.state = 0;
                }
                if (gMain.newKeys & A_BUTTON)
                {
                    if (gUnknown_Debug_083C50EC[eTayaMonData.y][eTayaMonData.x].param)
                        SetMonData(gPlayerParty, gUnknown_Debug_083C50EC[eTayaMonData.y][eTayaMonData.x].param, &eTayaMonData.data[eTayaMonData.y][eTayaMonData.x]);
                    eTayaMonData.state = 0;
                }
            }
            break;
    }
}

void debug_sub_80915BC(void)
{
    u8 i;
    u8 j;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    for (i = 0; i < 6; i++)
    {
        for (j = 0; j < 3; j++)
        {
            u16 param = gUnknown_Debug_083C50EC[i][j].param;
            if (param)
                eTayaMonData.data[i][j] = GetMonData(gPlayerParty, param);
            else
                eTayaMonData.data[i][j] = 0;
        }
    }
    Text_LoadWindowTemplate(&gWindowTemplate_81E7224);
    InitMenuWindow(&gWindowTemplate_81E7224);
    Menu_EraseScreen();
    Menu_DrawStdWindowFrame(0, 0, 29, 3);
    Menu_PrintText(gUnknown_Debug_083C517C, 1, 1);
    Menu_DrawStdWindowFrame(0, 4, 29, 17);
    Menu_DrawStdWindowFrame(0, 18, 29, 21);
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON;
    eTayaMonData.x = 0;
    eTayaMonData.y = 0;
    eTayaMonData.state = 0;
    debug_sub_80916AC();
    SetVBlankCallback(debug_sub_8091320);
    SetMainCallback2(debug_sub_8091334);
}

void debug_sub_80916AC(void)
{
    u8 i;
    u8 j;

    for (i = 0; i < 6; i++)
    {
        u8 * buffer = eTayaMonData.charbuf;
        for (j = 0; j < 3 && !(i == 5 && j == 2); j++)
        {
            if (eTayaMonData.x == j && eTayaMonData.y == i)
                *buffer++ = 0xEF;
            else
            {
                *buffer++ = CHAR_SPACE;
                *buffer++ = CHAR_SPACE;
            }
            buffer = StringCopy(buffer, gUnknown_Debug_083C50EC[i][j].text);
            *buffer++ = CHAR_SPACE;
            buffer = ConvertIntToDecimalStringN(buffer, eTayaMonData.data[i][j], STR_CONV_MODE_LEFT_ALIGN, 1);
            *buffer++ = CHAR_SPACE;
        }
        buffer[-1] = EOS;
        Menu_PrintText(eTayaMonData.charbuf, 1, i * 2 + 5);
    }
}

#endif // DEBUG
