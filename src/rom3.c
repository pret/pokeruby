#include "global.h"
#include "asm.h"
#include "items.h"
#include "link.h"
#include "pokemon.h"
#include "species.h"
#include "task.h"

extern u16 gBattleTypeFlags;

extern u32 gUnknown_020239FC;
extern u32 gUnknown_02024A64;
extern u8 gUnknown_02024A68;
extern u16 gUnknown_02024A6A[];
extern u8 gUnknown_02024A72[];
extern u8 gUnknown_02024C78;
extern u8 gUnknown_02024E60[];
extern u8 gUnknown_02024E64[];
extern void (*gUnknown_030042D4)(void);
extern void (*gUnknown_03004330[])(void);

extern void sub_800BF28(void);
extern void sub_8083C50(u8);
extern void nullsub_41(void);
extern void nullsub_91(void);
extern void battle_anim_clear_some_data(void);
extern void sub_8040710(void);
extern void BattleAI_HandleItemUseBeforeAISetup(void);
extern void sub_8094978(u8, int);
extern void sub_800BA78(void);
extern void sub_800B9A8(void);
extern void sub_800BD54(void);
extern void sub_8010800(void);
extern void sub_812B468(void);
extern void sub_8137224(void);
extern void sub_802BF74(void);
extern void sub_8032AE0(void);
extern void sub_8037510(void);
extern void sub_811DA78(void);

void sub_800B858(void)
{
    if (gBattleTypeFlags & 2)
    {
        OpenLink();
        CreateTask(sub_8083C50, 0);
        sub_800BF28();
    }
}

void setup_poochyena_battle(void)
{
    s32 i;
    
    gUnknown_030042D4 = nullsub_41;
    for (i = 0; i < 4; i++)
    {
        gUnknown_03004330[i] = nullsub_91;
        gUnknown_02024A72[i] = 0xFF;
        gUnknown_02024E60[i] = 0;
        gUnknown_02024E64[i] = 0;
    }
    sub_800B858();
    gUnknown_02024A64 = 0;
    battle_anim_clear_some_data();
    sub_8040710();
    BattleAI_HandleItemUseBeforeAISetup();
    if (gBattleTypeFlags & 0x10)
    {
        ZeroEnemyPartyMons();
        CreateMon(&gEnemyParty[0], SPECIES_POOCHYENA, 2, 32, 0, 0, 0, 0);
        i = ITEM_NONE;
        SetMonData(&gEnemyParty[0], MON_DATA_HELD_ITEM, (u8 *)&i);
    }
    gUnknown_020239FC = 0;
    gUnknown_02024C78 = 0;
}

void sub_800B950(void)
{
    s32 i;
    
    if (gBattleTypeFlags & 2)
        sub_800BA78();
    else
        sub_800B9A8();
    sub_800BD54();
    if (!(gBattleTypeFlags & 0x40))
    {
        for (i = 0; i < gUnknown_02024A68; i++)
            sub_8094978(i, 0);
    }
}

void sub_800B9A8(void)
{
    if (!(gBattleTypeFlags & 1))
    {
        gUnknown_030042D4 = sub_8010800;
        if (gBattleTypeFlags & 0x80)
            gUnknown_03004330[0] = sub_812B468;
        else if (gBattleTypeFlags & 0x200)
            gUnknown_03004330[0] = sub_8137224;
        else
            gUnknown_03004330[0] = sub_802BF74;
        gUnknown_02024A72[0] = 0;
        gUnknown_03004330[1] = sub_8032AE0;
        gUnknown_02024A72[1] = 1;
        gUnknown_02024A68 = 2;
    }
    else
    {
        gUnknown_030042D4 = sub_8010800;
        gUnknown_03004330[0] = sub_802BF74;
        gUnknown_02024A72[0] = 0;
        gUnknown_03004330[1] = sub_8032AE0;
        gUnknown_02024A72[1] = 1;
        gUnknown_03004330[2] = sub_802BF74;
        gUnknown_02024A72[2] = 2;
        gUnknown_03004330[3] = sub_8032AE0;
        gUnknown_02024A72[3] = 3;
        gUnknown_02024A68 = 4;
    }
}

#if 0
void sub_800BA78(void)
{
    u8 r5;
    int i;
    
    if (!(gBattleTypeFlags & 1))
    {
        if (gBattleTypeFlags & 4)
        {
            gUnknown_030042D4 = sub_8010800;
            gUnknown_03004330[0] = sub_802BF74;
            gUnknown_02024A72[0] = 0;
            gUnknown_03004330[1] = sub_8037510;
            gUnknown_02024A72[1] = 1;
            gUnknown_02024A68 = 2;
            return;
        }
        //_0800BAD8
        else
        {
            gUnknown_03004330[1] = sub_802BF74;
            gUnknown_02024A72[1] = 0;
            gUnknown_03004330[0] = sub_8037510;
            gUnknown_02024A68 = 2;
            return;
        }
    }
    //_0800BB04
    if ((gBattleTypeFlags & 0x41) == 1)
    {
        if (gBattleTypeFlags & 4)
        {
            gUnknown_030042D4 = sub_8010800;
            gUnknown_03004330[0] = sub_802BF74;
            gUnknown_02024A72[0] = 0;
            gUnknown_03004330[1] = sub_8037510;
            gUnknown_02024A72[1] = 1;
            gUnknown_03004330[2] = sub_802BF74;
            gUnknown_02024A72[2] = 2;
            gUnknown_03004330[3] = sub_8037510;
            gUnknown_02024A72[3] = 3;
            gUnknown_02024A68 = 4;
        }
        else
        {
            gUnknown_03004330[1] = sub_802BF74;
            gUnknown_02024A72[1] = 0;
            gUnknown_03004330[0] = sub_8037510;
            gUnknown_02024A72[0] = 1;
            gUnknown_03004330[3] = sub_802BF74;
            gUnknown_02024A72[3] = 2;
            gUnknown_03004330[2] = sub_8037510;
            gUnknown_02024A72[2] = 3;
            gUnknown_02024A68 = 4;
            
        }
        //_0800BB74
        return;
    }
    //_0800BB90
    r5 = GetMultiplayerId();
    if (gBattleTypeFlags & 4)
        gUnknown_030042D4 = sub_8010800;
    //_0800BBBC  one HUGE loop
    for (i = 0; i < 4; i++)
    {
        switch (gLinkPlayers[i].lp_field_18)
        {
            case 0:
            case 3:
                sub_8094978(gLinkPlayers[i].lp_field_18, 0);
                break;
            case 1:
            case 2:
                sub_8094978(gLinkPlayers[i].lp_field_18, 1);
                break;
        }
        //_0800BC06
        if (i == r5)
        {
            gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_802BF74;
            switch (gLinkPlayers[i].lp_field_18)
            {
                case 0:
                case 3:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 0;
                    //goto _0800BD12
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                    continue;
                    //break;
                case 1:
                case 2:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 2;
                    //goto _0800BD24
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                    continue;
                    //break;
            }
        }
        //_0800BC56
        else
        {
            if ((!(gLinkPlayers[i].lp_field_18 & 1) && !(gLinkPlayers[r5].lp_field_18 & 1))
             || ((gLinkPlayers[i].lp_field_18 & 1) && !(gLinkPlayers[r5].lp_field_18 & 1)))
            {
                
            //_0800BC92
            gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_811DA78;
            switch (gLinkPlayers[i].lp_field_18)
            {
                case 0:
                case 3:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 0;
                    //goto _0800BD12
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                    continue;
                    //break;
                case 1:
                case 2:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 2;
                    //goto _0800BD22
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                    continue;
                    //break;
            }
            
            }
            
            gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_8037510;
            switch (gLinkPlayers[i].lp_field_18)
            {
                case 0:
                case 3:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 1;
                    //_0800BD12
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                    break;
                case 1:
                case 2:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 3;
                    //_0800BD22
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                    break;
            }
        }
        //_0800BD12 or _0800BD24 ?
        
    }
}

/*
void sub_800BA78(void)
{
    u8 r5;
    int i;
    
    if (!(gBattleTypeFlags & 1))
    {
        if (gBattleTypeFlags & 4)
        {
            gUnknown_030042D4 = sub_8010800;
            gUnknown_03004330[0] = sub_802BF74;
            gUnknown_02024A72[0] = 0;
            gUnknown_03004330[1] = sub_8037510;
            gUnknown_02024A72[1] = 1;
            gUnknown_02024A68 = 2;
            asm("");
            return;
        }
        //_0800BAD8
        else
        {
            gUnknown_03004330[1] = sub_802BF74;
            gUnknown_02024A72[1] = 0;
            gUnknown_03004330[0] = sub_8037510;
            gUnknown_02024A68 = 2;
            return;
        }
    }
    //_0800BB04
    if ((gBattleTypeFlags & 0x41) == 1)
    {
        if (gBattleTypeFlags & 4)
        {
            gUnknown_030042D4 = sub_8010800;
            gUnknown_03004330[0] = sub_802BF74;
            gUnknown_02024A72[0] = 0;
            gUnknown_03004330[1] = sub_8037510;
            gUnknown_02024A72[1] = 1;
            gUnknown_03004330[2] = sub_802BF74;
            gUnknown_02024A72[2] = 2;
            gUnknown_03004330[3] = sub_8037510;
            gUnknown_02024A72[3] = 3;
            gUnknown_02024A68 = 4;
        }
        else
        {
            gUnknown_03004330[1] = sub_802BF74;
            gUnknown_02024A72[1] = 0;
            gUnknown_03004330[0] = sub_8037510;
            gUnknown_02024A72[0] = 1;
            gUnknown_03004330[3] = sub_802BF74;
            gUnknown_02024A72[3] = 2;
            gUnknown_03004330[2] = sub_8037510;
            gUnknown_02024A72[2] = 3;
            gUnknown_02024A68 = 4;
            
        }
        //_0800BB74
        return;
    }
    //_0800BB90
    r5 = GetMultiplayerId();
    if (gBattleTypeFlags & 4)
        gUnknown_030042D4 = sub_8010800;
    //_0800BBBC  one HUGE loop
    for (i = 0; i < 4; i++)
    {
        switch (gLinkPlayers[i].lp_field_18)
        {
            case 0:
            case 3:
                sub_8094978(gLinkPlayers[i].lp_field_18, 0);
                break;
            case 1:
            case 2:
                sub_8094978(gLinkPlayers[i].lp_field_18, 1);
                break;
        }
        //_0800BC06
        if (i == r5)
        {
            gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_802BF74;
            switch (gLinkPlayers[i].lp_field_18)
            {
                case 0:
                case 3:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 0;
                    //goto _0800BD12
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                    continue;
                    //break;
                case 1:
                case 2:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 2;
                    //goto _0800BD24
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                    continue;
                    //break;
            }
        }
        //_0800BC56
        else
        {
            if (!(gLinkPlayers[i].lp_field_18 & 1))
            {
                if (gLinkPlayers[r5].lp_field_18 & 1)
                    goto _0800BCD8;
            }
            //_0800BC80
            else
            {
                if (!(gLinkPlayers[r5].lp_field_18 & 1))
                    goto _0800BCD8;
            }
            //_0800BC92
            gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_811DA78;
            switch (gLinkPlayers[i].lp_field_18)
            {
                case 0:
                case 3:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 0;
                    //goto _0800BD12
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                    continue;
                    //break;
                case 1:
                case 2:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 2;
                    //goto _0800BD22
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                    continue;
                    //break;
            }
            
          _0800BCD8:
            gUnknown_03004330[gLinkPlayers[i].lp_field_18] = sub_8037510;
            switch (gLinkPlayers[i].lp_field_18)
            {
                case 0:
                case 3:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 1;
                    //_0800BD12
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 0;
                    break;
                case 1:
                case 2:
                    gUnknown_02024A72[gLinkPlayers[i].lp_field_18] = 3;
                    //_0800BD22
                    gUnknown_02024A6A[gLinkPlayers[i].lp_field_18] = 3;
                    break;
            }
        }
        //_0800BD12 or _0800BD24 ?
        
    }
}
*/
#endif
