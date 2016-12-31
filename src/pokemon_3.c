#include "global.h"
#include "asm.h"
#include "text.h"
#include "string_util.h"
#include "pokemon.h"
#include "rng.h"
#include "species.h"
#include "main.h"
#include "sprite.h"
#include "flag.h"

extern void get_battle_strings_(u8 *);

extern u8 gPlayerPartyCount;
extern struct Pokemon gPlayerParty[6];
extern u8 gEnemyPartyCount;
extern struct Pokemon gEnemyParty[6];
extern struct BattlePokemon gBattleMons[4];
extern u8 * const gItemEffectTable[];
extern u8 gUnknown_02024A60;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern u8 gUnknown_030041C0[];
extern u8 gUnknown_03004290[];
extern u8 gUnknown_02024C08;
extern u8 gUnknown_02024E6C;

extern u8 gUnknown_082082F8[];
extern u8 gUnknown_083FFDB3[];
extern u8 gUnknown_083FFDD3[];
extern u8 *gUnknown_08400F58[];

bool8 HealStatusConditions(struct Pokemon *mon, u32 unused, u32 healMask, u8 battleId)
{
    u32 status = GetMonData(mon, MON_DATA_STATUS, 0);

    if (status & healMask)
    {
        status &= ~healMask;
        SetMonData(mon, MON_DATA_STATUS, (u8 *)&status);
        if (gMain.inBattle && battleId != 4)
            gBattleMons[battleId].status1 &= ~healMask;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

u8 GetItemEffectParamOffset(u16 itemId, u8 effectByte, u8 effectBit)
{
    u8 *temp;
    u8 *itemEffect;
    u8 offset;
    int i;
    u8 j;
    u8 val;

    offset = 6;

    temp = gItemEffectTable[itemId - 13];

    if (!temp && itemId != 175)
        return 0;

    if (itemId == 175)
    {
        temp = gEnigmaBerries[gUnknown_02024A60].itemEffect;
    }

    itemEffect = temp;

    for (i = 0; i < 6; i++)
    {
        switch (i)
        {
        case 0:
        case 1:
        case 2:
        case 3:
            if (i == effectByte)
                return 0;
            break;
        case 4:
            val = itemEffect[4];
            if (val & 0x20)
                val &= 0xDF;
            j = 0;
            while (val)
            {
                if (val & 1)
                {
                    switch (j)
                    {
                        case 2:
                            if (val & 0x10)
                                val &= 0xEF;
                        case 0:
                            if (i == effectByte && (val & effectBit))
                                return offset;
                            offset++;
                            break;
                        case 1:
                            if (i == effectByte && (val & effectBit))
                                return offset;
                            offset++;
                            break;
                        case 3:
                            if (i == effectByte && (val & effectBit))
                                return offset;
                            offset++;
                            break;
                        case 7:
                            if (i == effectByte)
                                return 0;
                            break;
                    }
                }
                j++;
                val >>= 1;
                if (i == effectByte)
                    effectBit >>= 1;
            }
            break;
        case 5:
            val = itemEffect[5];
            j = 0;
            while (val)
            {
                if (val & 1)
                {
                    switch (j)
                    {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                            if (i == effectByte && (val & effectBit))
                                return offset;
                            offset++;
                            break;
                        case 7:
                            if (i == effectByte)
                                return 0;
                            break;
                    }
                }
                j++;
                val >>= 1;
                if (i == effectByte)
                    effectBit >>= 1;
            }
            break;
        }
    }

    return offset;
}

void sub_803F324(int a1)
{
    gUnknown_02024C08 = gUnknown_02024E6C;
    StringCopy(gUnknown_030041C0, gUnknown_08400F58[gUnknown_082082F8[a1]]);
    StringCopy(gUnknown_03004290, gUnknown_083FFDB3);
    get_battle_strings_(gUnknown_083FFDD3);
}
