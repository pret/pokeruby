#include "global.h"
#include "lottery_corner.h"
#include "event_data.h"
#include "constants/items.h"
#include "random.h"
#include "constants/species.h"
#include "string_util.h"
#include "text.h"

extern u16 gSpecialVar_Result;
extern u16 gSpecialVar_0x8004;
extern struct PokemonStorage gPokemonStorage;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;
static EWRAM_DATA u16 sWinNumberDigit = 0;
static EWRAM_DATA u16 sOtIdDigit = 0;

static const u16 sLotteryPrizes[] =
{
    ITEM_PP_UP,
    ITEM_EXP_SHARE,
    ITEM_MAX_REVIVE,
    ITEM_MASTER_BALL,
};

static u8 GetMatchingDigits(u16, u16);

void ResetLotteryCorner(void)
{
    u16 rand = Random();

    SetLotteryNumber((Random() << 16) | rand);
    VarSet(VAR_LOTTERY_PRIZE, 0);
}

void SetRandomLotteryNumber(u16 i)
{
    u32 var = Random();

    while (--i != 0xFFFF)
        var = var * 1103515245 + 12345;

    SetLotteryNumber(var);
}

void RetrieveLotteryNumber(void)
{
    u16 lottoNumber = GetLotteryNumber();
    gSpecialVar_Result = lottoNumber;
}

void PickLotteryCornerTicket(void)
{
    u16 i;
    u16 j;
    u32 box;
    u32 slot;

    gSpecialVar_0x8004 = 0;
    slot = 0;
    box = 0;
    for (i = 0; i < 6; i++)
    {
        struct Pokemon *pkmn = &gPlayerParty[i];

        // UB: Too few arguments for function GetMonData
        if (GetMonData(pkmn, MON_DATA_SPECIES) != SPECIES_NONE)
        {
            // do not calculate ticket values for eggs.
            if (!GetMonData(pkmn, MON_DATA_IS_EGG))
            {
                u32 otId = GetMonData(pkmn, MON_DATA_OT_ID);
                u8 numMatchingDigits = GetMatchingDigits(gSpecialVar_Result, otId);

                if (numMatchingDigits > gSpecialVar_0x8004 && numMatchingDigits > 1)
                {
                    gSpecialVar_0x8004 = numMatchingDigits - 1;
                    box = 14;
                    slot = i;
                }
            }
        }
        else // pokemon are always arranged from populated spots first to unpopulated, so the moment a NONE species is found, that's the end of the list.
            break;
    }

    // player has 14 boxes.
    for (i = 0; i < 14; i++)
    {
        // player has 30 slots per box.
        for (j = 0; j < 30; j++)
        {
            struct BoxPokemon *pkmn = &gPokemonStorage.boxes[i][j];

            // UB: Too few arguments for function GetMonData
            if (GetBoxMonData(pkmn, MON_DATA_SPECIES) != SPECIES_NONE &&
            !GetBoxMonData(pkmn, MON_DATA_IS_EGG))
            {
                u32 otId = GetBoxMonData(pkmn, MON_DATA_OT_ID);
                u8 numMatchingDigits = GetMatchingDigits(gSpecialVar_Result, otId);

                if (numMatchingDigits > gSpecialVar_0x8004 && numMatchingDigits > 1)
                {
                    gSpecialVar_0x8004 = numMatchingDigits - 1;
                    box = i;
                    slot = j;
                }
            }
        }
    }

    if (gSpecialVar_0x8004 != 0)
    {
        gSpecialVar_0x8005 = sLotteryPrizes[gSpecialVar_0x8004 - 1];

        if (box == 14)
        {
            gSpecialVar_0x8006 = 0;
            GetMonData(&gPlayerParty[slot], MON_DATA_NICKNAME, gStringVar1);
        }
        else
        {
            gSpecialVar_0x8006 = 1;
            GetBoxMonData(&gPokemonStorage.boxes[box][slot], MON_DATA_NICKNAME, gStringVar1);
        }
        StringGetEnd10(gStringVar1);
    }
}

static u8 GetMatchingDigits(u16 winNumber, u16 otId)
{
    u8 i;
    u8 matchingDigits = 0;

    for (i = 0; i < 5; i++)
    {
        sWinNumberDigit = winNumber % 10;
        sOtIdDigit = otId % 10;

        if (sWinNumberDigit == sOtIdDigit)
        {
            winNumber = winNumber / 10;
            otId = otId / 10;
            matchingDigits++;
        }
        else
            break;
    }
    return matchingDigits;
}

// lottery numbers go from 0 to 99999, not 65535 (0xFFFF). interestingly enough, the function that calls GetLotteryNumber shifts to u16, so it cant be anything above 65535 anyway.
void SetLotteryNumber(u32 lotteryNum)
{
    u16 high = lotteryNum >> 16;
    u16 low = lotteryNum;

    VarSet(VAR_LOTTERY_RND_L, low);
    VarSet(VAR_LOTTERY_RND_H, high);
}

u32 GetLotteryNumber(void)
{
    u16 low = VarGet(VAR_LOTTERY_RND_L);
    u16 high = VarGet(VAR_LOTTERY_RND_H);

    return (high << 16) | low;
}

// interestingly, this may have been the original lottery number set function, but GF tried to change it to 32-bit later but didnt finish changing all calls as one GetLotteryNumber still shifts to u16.
void SetLotteryNumber16_Unused(u16 lotteryNum)
{
    SetLotteryNumber(lotteryNum);
}
