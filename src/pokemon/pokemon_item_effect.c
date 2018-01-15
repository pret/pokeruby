#include "global.h"
#include "constants/items.h"
#include "constants/species.h"
#include "battle.h"
#include "evolution_scene.h"
#include "ewram.h"
#include "item.h"
#include "main.h"
#include "overworld.h"
#include "pokemon.h"
#include "pokemon_item_effect.h"
#include "rom_8077ABC.h"
#include "rom_8094928.h"
#include "util.h"

extern s32 gBattleMoveDamage;
extern u8 gAbsentBankFlags;
extern u8 gBankInMenu;
extern u8 gNoOfAllBanks;
extern u16 gBattlePartyID[];
extern u8 gActiveBank;
extern u8 gStringBank;
extern struct BattlePokemon gBattleMons[];
extern struct BattleEnigmaBerry gEnigmaBerries[];

const u8 gUnknown_082082F2[] =
{
    MON_DATA_HP_EV,
    MON_DATA_ATK_EV,
    MON_DATA_DEF_EV,
    MON_DATA_SPEED_EV,
    MON_DATA_SPDEF_EV,
    MON_DATA_SPATK_EV
};

bool8 sub_803E1B0(struct Pokemon *pkmn, u16 b, u8 c, u8 d, u8 e);

bool8 ExecuteTableBasedItemEffect_(struct Pokemon *pkmn, u16 b, u8 c, u8 d)
{
    return sub_803E1B0(pkmn, b, c, d, 0);
}

extern u8 gUnknown_08208238[];
extern u8 gUnknown_0820823C[];
extern u8 gUnknown_08208240[];

bool8 sub_803E1B0(struct Pokemon *pkmn, u16 b, u8 c, u8 d, u8 e)
{
    u32 sp0;
    s32 sp4;
    s32 sp18;
    bool8 sp1C = TRUE;
    const u8 *sp20;
    u8 sp24 = 6;
    u32 sp28;
    s8 sp2C = 0;
    u8 sp30;
    u8 sp34 = 4;
    u16 item;
    u16 r4;
    u32 r10;

    item = GetMonData(pkmn, MON_DATA_HELD_ITEM);
    if (item == 0xAF)
    {
        if (gMain.inBattle)
            sp30 = gEnigmaBerries[gBankInMenu].holdEffect;
        else
            sp30 = gSaveBlock1.enigmaBerry.holdEffect;
    }
    //_0803E240
    else
    {
        sp30 = ItemId_GetHoldEffect(item);
    }
    //_0803E248

    gStringBank = gBankInMenu;
    if (gMain.inBattle)
    {
        gActiveBank = gBankInMenu;
        sp18 = (GetBankSide(gActiveBank) != 0);
        //r4 = b - 13;
        while (sp18 < gNoOfAllBanks)
        {
            if (gBattlePartyID[sp18] == c)
            {
                sp34 = sp18;
                break;
            }
            sp18 += 2;
        }
        r4 = b - 13;
    }
    //_0803E2E8
    else
    {
        gActiveBank = 0;
        sp34 = 4;
        r4 = b - 13;
    }
    //_0803E2F4

    if (r4 > 0xA5)
        return 1;

    if (gItemEffectTable[r4] == NULL && b != 0xAF)
        return 1;
    if (b == 0xAF)
    {
        //_0803E31E
        if (gMain.inBattle)
            sp20 = gEnigmaBerries[gActiveBank].itemEffect;
        else
            sp20 = gSaveBlock1.enigmaBerry.itemEffect;
    }
    //_0803E372
    else
    {
        sp20 = gItemEffectTable[r4];
    }

    // Now, the HUGE loop!
    for (sp18 = 0; sp18 < 6; sp18++)
    {
        switch (sp18)
        {
        case 0:
        //_0803E3A8
            if ((sp20[sp18] & 0x80) && gMain.inBattle
             && sp34 != 4 && (gBattleMons[sp34].status2 & 0xF0000))
            {
                gBattleMons[sp34].status2 &= 0xFFF0FFFF;
                sp1C = 0;
            }
            //_0803E3F0
            if ((sp20[sp18] & 0x30) && !(gBattleMons[gActiveBank].status2 & 0x4000000))
            {
                gBattleMons[gActiveBank].status2 |= 0x4000000;
                sp1C = 0;
            }
            //_0803E41E
            if ((sp20[sp18] & 0xF) && gBattleMons[gActiveBank].statStages[1] < 12)
            {
                gBattleMons[gActiveBank].statStages[1] += sp20[sp18] & 0xF;
                if (gBattleMons[gActiveBank].statStages[1] > 12)
                    gBattleMons[gActiveBank].statStages[1] = 12;
                sp1C = 0;
            }
            break;
        case 1:
        //_0803E474
            // r3 might be a temporary variable
            if ((sp20[sp18] & 0xF0) && gBattleMons[gActiveBank].statStages[2] < 12)
            {
                gBattleMons[gActiveBank].statStages[2] += (sp20[sp18] & 0xF0) >> 4;
                if (gBattleMons[gActiveBank].statStages[2] > 12)
                    gBattleMons[gActiveBank].statStages[2] = 12;
                sp1C = 0;
            }
            //_0803E4BA
            if ((sp20[sp18] & 0xF) && gBattleMons[gActiveBank].statStages[3] < 12)
            {
                gBattleMons[gActiveBank].statStages[3] += sp20[sp18] & 0xF;
                if (gBattleMons[gActiveBank].statStages[3] > 12)
                    gBattleMons[gActiveBank].statStages[3] = 12;
                sp1C = 0;
                //asm("");
            }
            break;
        case 2:
        //_0803E508
            //asm_comment("case2");
            if ((sp20[sp18] & 0xF0) && gBattleMons[gActiveBank].statStages[6] < 12)
            {
                gBattleMons[gActiveBank].statStages[6] += (sp20[sp18] & 0xF0) >> 4;
                if (gBattleMons[gActiveBank].statStages[6] > 12)
                    gBattleMons[gActiveBank].statStages[6] = 12;
                sp1C = 0;
            }
            //_0803E54E
            if ((sp20[sp18] & 0xF) && gBattleMons[gActiveBank].statStages[4] < 12)
            {
                gBattleMons[gActiveBank].statStages[4] += sp20[sp18] & 0xF;
                if (gBattleMons[gActiveBank].statStages[4] > 12)
                    gBattleMons[gActiveBank].statStages[4] = 12;
                sp1C = 0;
            }
            break;
        case 3:
        //_0803E59C
            if ((sp20[sp18] & 0x80) && gSideTimers[GetBankSide(gActiveBank)].mistTimer == 0)
            {
                gSideTimers[GetBankSide(gActiveBank)].mistTimer = 5;
                sp1C = 0;
            }
            //_0803E5E4
            if ((sp20[sp18] & 0x40) && GetMonData(pkmn, MON_DATA_LEVEL, NULL) != 100)
            {
                sp0 = gExperienceTables[gBaseStats[GetMonData(pkmn, MON_DATA_SPECIES, NULL)].growthRate][GetMonData(pkmn, MON_DATA_LEVEL, NULL) + 1];
                SetMonData(pkmn, MON_DATA_EXP, &sp0);
                CalculateMonStats(pkmn);
                sp1C = 0;
            }
            //_0803E646
            if ((sp20[sp18] & 0x20) && HealStatusConditions(pkmn, c, 7, sp34) == 0)
            {
                if (sp34 != 4)
                    gBattleMons[sp34].status2 &= 0xF7FFFFFF;
                sp1C = 0;
            }
            //_0803E682
            if ((sp20[sp18] & 0x10) && HealStatusConditions(pkmn, c, 0xF88, sp34) == 0)
                sp1C = 0;
            //_0803E6A2
            if ((sp20[sp18] & 8) && HealStatusConditions(pkmn, c, 16, sp34) == 0)
                sp1C = 0;
            //_0803E6C2
            if ((sp20[sp18] & 4) && HealStatusConditions(pkmn, c, 32, sp34) == 0)
                sp1C = 0;
            //_0803E6E2
            if ((sp20[sp18] & 2) && HealStatusConditions(pkmn, c, 64, sp34) == 0)
                sp1C = 0;
            //_0803E702
            if ((sp20[sp18] & 1) && gMain.inBattle
             && sp34 != 4 && (gBattleMons[sp34].status2 & 7))
            {
                gBattleMons[sp34].status2 &= ~7;
                sp1C = 0;
            }
            break;
        case 4:
        //_0803E77C
            r10 = sp20[sp18];
            if (r10 & 0x20)
            {
                //u16 r4;

                r10 &= 0xDF;

                sp0 = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gUnknown_08208238[d]) << (d * 2);
                //r4 = GetMonData(pkmn, MON_DATA_MOVE1 + d, NULL);
                sp28 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + d, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), d);
                if (sp0 <= 2 && sp28 > 4)
                {
                    sp0 = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) + gUnknown_08208240[d];
                    SetMonData(pkmn, MON_DATA_PP_BONUSES, &sp0);

                    sp0 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + d, NULL), sp0, d) - sp28;
                    sp0 += GetMonData(pkmn, MON_DATA_PP1 + d, NULL);
                    SetMonData(pkmn, MON_DATA_PP1 + d, &sp0);
                    sp1C = 0;
                }
            }
            //_0803E854
            sp28 = 0;
            while (r10 != 0)
            {
                if (r10 & 1)
                {
                    s32 r5;
                    u32 r4;
                    u32 r1;

                    switch (sp28)
                    {
                    case 0:
                    case 1:
                    //_0803E8AC
                        r5 = GetMonEVCount(pkmn);
                        if (r5 >= 510)
                            return 1;
                        r1 = GetMonData(pkmn, gUnknown_082082F2[sp28], NULL);
                        sp0 = r1;
                        if (r1 < 100)
                        {
                            r1 += sp20[sp24];
                            if (r1 > 100)
                                r4 = 100 - r1;
                            else
                                r4 = sp20[sp24];
                            //_0803E8F6
                            if (r5 + r4 > 510)
                                r4 = (r4 - 510) - (r5 + r4);
                            sp0 += r4;
                            SetMonData(pkmn, gUnknown_082082F2[sp28], &sp0);
                            CalculateMonStats(pkmn);
                            sp24++;
                            sp1C = 0;
                        }
                        break;
                    case 2:
                    //_0803E934
                        if (r10 & 0x10)
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) != 0)
                            {
                                sp24++;
                                break;
                            }
                            if (gMain.inBattle)
                            {
                                if (sp34 != 4)
                                {
                                    gAbsentBankFlags &= ~gBitTable[sp34];
                                    CopyPlayerPartyMonToBattleData(sp34, pokemon_order_func(gBattlePartyID[sp34]));
                                    // tail merge, possibly?
                                    if (GetBankSide(gActiveBank) == 0 && gBattleResults.unk4 < 255)
                                        gBattleResults.unk4++;
                                }
                                //_0803E9B4
                                else
                                {
                                    gAbsentBankFlags &= ~gBitTable[gActiveBank ^ 2];
                                    if (GetBankSide(gActiveBank) == 0 && gBattleResults.unk4 < 255)
                                        gBattleResults.unk4++;
                                }
                                //_0803E9CC
                            }
                            //to _0803EA0A
                        }
                        //_0803E9F4
                        else
                        {
                            if (GetMonData(pkmn, MON_DATA_HP, NULL) == 0)
                            {
                                sp24++;
                                break;
                            }
                        }
                        //_0803EA0A
                        sp0 = sp20[sp24++];
                        switch (sp0)
                        {
                        case 0xFF:
                        //_0803EA2C
                            if (sp0 == 0xFF)  // wat?
                                sp0 = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) - GetMonData(pkmn, MON_DATA_HP, NULL);
                            break;
                        case 0xFE:
                            sp0 = GetMonData(pkmn, MON_DATA_MAX_HP, NULL) * 2;
                            if (sp0 == 0)
                                sp0 = 1;
                            break;
                        case 0xFD:
                            sp0 = eStatHp;
                            break;
                        }
                        //_0803EA6C
                        if (GetMonData(pkmn, MON_DATA_MAX_HP, NULL) != GetMonData(pkmn, MON_DATA_HP, NULL))
                        {
                            if (e == 0)
                            {
                                sp0 += GetMonData(pkmn, MON_DATA_HP, NULL);
                                if (sp0 > GetMonData(pkmn, MON_DATA_MAX_HP, NULL))
                                    sp0 = GetMonData(pkmn, MON_DATA_MAX_HP, NULL);
                                //_0803EAB8
                                SetMonData(pkmn, MON_DATA_HP, &sp0);
                                if (gMain.inBattle && sp34 != 4)
                                {
                                    gBattleMons[sp34].hp = sp0;
                                    if (!(r10 & 0x10) && GetBankSide(gActiveBank) == 0)
                                    {
                                        u8 r5;

                                        if (gBattleResults.unk3 < 255)
                                            gBattleResults.unk3++;
                                        r5 = gActiveBank;
                                        gActiveBank = sp34;
                                        EmitGetAttributes(0, 0, 0);
                                        MarkBufferBankForExecution(gActiveBank);
                                        gActiveBank = r5;
                                    }
                                }
                                //to _0803EB48
                            }
                            //_0803EB40
                            else
                            {
                                gBattleMoveDamage = -sp0;
                            }
                            //_0803EB48
                            sp1C = 0;
                        }
                        //_0803EB4C
                        r10 &= 0xEF;
                        break;
                    case 3:
                        if (!(r10 & 2))
                        {
                            for (r5 = 0; r5 < 4; r5++)
                            {
                                u16 r4;

                                sp0 = GetMonData(pkmn, MON_DATA_PP1 + r5, NULL);
                                r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                if (sp0 != CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5))
                                {
                                    sp0 += sp20[sp24];
                                    r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                    if (sp0 > CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5))
                                    {
                                        r4 = GetMonData(pkmn, MON_DATA_MOVE1 + r5, NULL);
                                        sp0 = CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), r5);
                                    }
                                    //_0803EC28
                                    SetMonData(pkmn, MON_DATA_PP1 + r5, &sp0);
                                    if (gMain.inBattle
                                     && sp34 != 4 && !(gBattleMons[sp34].status2 & 0x200000)
                                     && !(gDisableStructs[sp34].unk18_b & gBitTable[r5]))
                                        gBattleMons[sp34].pp[r5] = sp0;
                                    //_0803EC8E
                                    sp1C = 0;
                                }
                                //_0803EC92
                            }
                            //_0803EC9A
                            sp24++;
                        }
                        //_0803ECB8
                        else
                        {
                            u16 r4;

                            sp0 = GetMonData(pkmn, MON_DATA_PP1 + d, NULL);
                            r4 = GetMonData(pkmn, MON_DATA_MOVE1 + d, NULL);
                            if (sp0 != CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), d))
                            {
                                //_0803ED00
                                sp0 += sp20[sp24++];
                                r4 = GetMonData(pkmn, MON_DATA_MOVE1 + d, NULL);
                                if (sp0 > CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), d))
                                {
                                    r4 = GetMonData(pkmn, MON_DATA_MOVE1 + d, NULL);
                                    sp0 = CalculatePPWithBonus(r4, GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), d);
                                }
                                //_0803ED74
                                SetMonData(pkmn, MON_DATA_PP1 + d, &sp0);
                                if (gMain.inBattle
                                 && sp34 != 4 && !(gBattleMons[sp34].status2 & 0x200000)
                                 && !(gDisableStructs[sp34].unk18_b & gBitTable[d]))
                                    gBattleMons[sp34].pp[d] = sp0;
                                //_0803EDD8
                                sp1C = 0;
                            }
                        }
                        break;
                    case 7:
                    //_0803EDF4
                        {
                            u16 targetSpecies = GetEvolutionTargetSpecies(pkmn, 2, d);

                            if (targetSpecies != SPECIES_NONE)
                            {
                                BeginEvolutionScene(pkmn, targetSpecies, 0, c);
                                return 0;
                            }
                        }
                        break;
                    }
                }
                //_0803EE0A
                sp28++;
                r10 >>= 1;
            }
            break;
        case 5:
        //_0803EE1E
            r10 = sp20[sp18];
            sp28 = 0;
            while (r10 != 0)
            {
                //_0803EE32
                if (r10 & 1)
                {
                    u16 r5;
                    u32 r4;
                    u32 r1;
                    
                    switch (sp28)
                    {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    //_0803EE74
                        r5 = GetMonEVCount(pkmn);
                        if (r5 >= 510)
                            return 1;
                        r1 = GetMonData(pkmn, gUnknown_082082F2[sp28 + 2], NULL);
                        sp0 = r1;
                        if (r1 < 100)
                        {
                            r1 += sp20[sp24];
                            if (r1 > 100)
                                r4 = 100 - r1;
                            else
                                r4 = sp20[sp24];
                            //_0803EEC6
                            if (r5 + r4 > 510)
                                r4 = (r4 + 510) - (r5 + r4);
                            sp0 += r4;
                            SetMonData(pkmn, gUnknown_082082F2[sp28 + 2], &sp0);
                            CalculateMonStats(pkmn);
                            sp1C = 0;
                            sp24++;
                        }
                        break;
                    case 4:
                    //_0803EEF8
                        sp0 = (GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL) & gUnknown_08208238[d]) << (d * 2);
                        if (sp0 < 3)
                        {
                            //_0803EF18
                            u8 r4 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + d, NULL), GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL), d);
                            sp0 = GetMonData(pkmn, MON_DATA_PP_BONUSES, NULL);
                            sp0 &= gUnknown_0820823C[d];
                            sp0 += gUnknown_08208240[d] * 3;
                            
                            SetMonData(pkmn, MON_DATA_PP_BONUSES, &sp0);
                            sp0 = CalculatePPWithBonus(GetMonData(pkmn, MON_DATA_MOVE1 + d, NULL), sp0, d) - r4;
                            sp0 += GetMonData(pkmn, MON_DATA_PP1 + b, NULL);
                            SetMonData(pkmn, MON_DATA_PP1 + b, &sp0);
                            sp1C = 0;
                        }
                        break;
                    case 5:
                    //_0803EFCC
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 100 && sp1C == 0 && sp2C == 0)
                        {
                            //_0803EFEC
                            sp2C = sp20[sp24];
                            sp4 = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && sp30 == 0x1B)
                            {
                                sp4 += 0x96 * sp2C / 100;
                            }
                            //to _0803F0D0 hmm...
                            else
                            {
                                sp4 += sp2C;
                            }
                            //_0803F0DC (tail merged)
                            
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    sp4++;
                                //_0803F0F4
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == sav1_map_get_name())
                                    sp4++;
                            }
                            //_0803F112
                            if (sp4 < 0)
                                sp4 = 0;
                            if (sp4 > 255)
                                sp4 = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &sp4);
                        }
                        //to _0803F130 hmm...
                        sp24++;
                        break;
                    case 6:
                    //_0803F026
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 100 && GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) < 200
                         && sp1C == 0 && sp2C == 0)
                        {
                            sp2C = sp20[sp24];
                            sp4 = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && sp30 == 0x1B)
                            {
                                //to _0803F0BE
                                sp4 = 0x96 * sp2C / 100;
                            }
                            else
                            {
                                sp4 += sp2C;
                            }
                            //_0803F0DC (tail merged)
                            
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    sp4++;
                                //_0803F0F4
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == sav1_map_get_name())
                                    sp4++;
                            }
                            //_0803F112
                            if (sp4 < 0)
                                sp4 = 0;
                            if (sp4 > 255)
                                sp4 = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &sp4);
                        }
                        //to _0803F130 hmm...
                        sp24++;
                        break;
                    case 7:
                    //_0803F07C
                        if (GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL) >= 200 && sp1C == 0 && sp2C == 0)
                        {
                            sp2C = sp20[sp24];
                            sp4 = GetMonData(pkmn, MON_DATA_FRIENDSHIP, NULL);
                            if (sp2C > 0 && sp30 == 0x1B)
                            {
                                //_0803F0BE
                                sp4 = 0x96 * sp2C / 100;
                            }
                            //_0803F0D0
                            else
                            {
                                sp4 += sp2C;
                            }
                            //_0803F0DC
                            
                            if (sp2C > 0)
                            {
                                if (GetMonData(pkmn, MON_DATA_POKEBALL, NULL) == 11)
                                    sp4++;
                                //_0803F0F4
                                if (GetMonData(pkmn, MON_DATA_MET_LOCATION, NULL) == sav1_map_get_name())
                                    sp4++;
                            }
                            //_0803F112
                            if (sp4 < 0)
                                sp4 = 0;
                            if (sp4 > 255)
                                sp4 = 255;
                            SetMonData(pkmn, MON_DATA_FRIENDSHIP, &sp4);
                        }
                        //to _0803F130
                        sp24++;
                        break;
                    }
                }
                sp28++;
                r10 >>= 1;
            }
            break;
        }
    }
    //_0803F15A
    return sp1C;
}
