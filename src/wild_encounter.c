#include "gba/gba.h"
#include "fieldmap.h"
#include "global.h"
#include "pokemon.h"
#include "rng.h"
#include "script.h"

struct WildPokemon {
    u8 minLevel;
    u8 maxLevel;
    u16 species;
};

struct WildPokemonInfo {
    u8 encounterRate;
    struct WildPokemon *wildPokemon;
};

struct WildPokemonHeader {
    u8 mapGroup;
    u8 mapNum;
    struct WildPokemonInfo *landMonsInfo;
    struct WildPokemonInfo *waterMonsInfo;
    struct WildPokemonInfo *rockSmashMonsInfo;
    struct WildPokemonInfo *fishingMonsInfo;
};

extern bool8 sub_805759C(u8);
extern void GetXYCoordsOneStepInFrontOfPlayer(void *, void *);
extern u32 sub_80C8448(void);
extern s16 sub_810CAE4(u8, u32);
extern bool32 GetSafariZoneFlag(void);
extern u8 TestPlayerAvatarFlags(u8);
extern u8 sub_8057468(u8);
extern u8 sub_81344CC(void);
extern u8 sub_8057494(u8);
extern void sub_8081A00(void);
extern u8 sub_8057434(u8);

extern u8 gWildEncountersDisabled;
extern u16 gUnknown_0839DC00[];
//extern u16 gUnknown_0839DC00[3][3];
extern u32 gUnknown_0202FF80;   //Feebas rng value
extern struct WildPokemonHeader gWildMonHeaders[];
extern struct Pokemon gEnemyParty[6];
extern struct Pokemon gPlayerParty[6];
extern u16 gScriptResult;

u16 FeebasRandom(void);
void FeebasSeedRng(u16 a);
u8 RepelCheck(u8);

void DisableWildEncounters(u8 a)
{
    gWildEncountersDisabled = a;
}

u16 sub_8084984(s16 x, s16 y, u8 c)
{
    //odd, but needed to match
    u16 *arr = gUnknown_0839DC00;
    u16 *ptr = &arr[c * 3];
    u16 r9 = gUnknown_0839DC00[c * 3 + 1];
    u16 r6 = gUnknown_0839DC00[c * 3 + 2];
    u16 r5 = *ptr;
   
    while(r5 <= r9)
    {
        u16 i;
       
        for(i = 0; i < gMapHeader.mapData->width; i++)
        {
            if(sub_805759C(MapGridGetMetatileBehaviorAt(i + 7, r5 + 7)) == TRUE)
            {
                r6++;
                if(x == i && y == r5)
                    return r6;
            }
            //_08084A14
        }
        r5++;
    }
 
    return r6 + 1;
}

bool32 CheckFeebas(void)
{
    u16 feebasSpots[6];
    s16 x;
    s16 y;
    u8 r7 = 0;
    u8 i;
    u16 foo;
   
    if(gSaveBlock1.location.mapGroup == 0 && gSaveBlock1.location.mapNum == 0x22)
    {
        GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
        x -= 7;
        y -= 7;
        
        // *sigh* whatever gets the code to match!
        {
        register u16 *arr asm("r0");
        if(y >= (arr = gUnknown_0839DC00)[3 * 1 + 0] && y <= arr[3 * 1 + 1])
            r7 = 1;
        if(y >= arr[3 * 2 + 0] && y <= arr[3 * 2 + 1])
            r7 = 2;
        }
        //_08084A8E
 
        if(Random() % 100 > 49) //Why not just do (Random() & 1) to get a 50% chance?
            return FALSE;
        //_08084AC8
        FeebasSeedRng(gSaveBlock1.feebasLocationSeed);
        for(i = 0; i != 6;)
        {
            feebasSpots[i] = FeebasRandom() % 447;
            if(feebasSpots[i] == 0)
                feebasSpots[i] = 447;
            if(feebasSpots[i] < 1 || feebasSpots[i] >= 4)
                i++;
        }
        foo = sub_8084984(x, y, r7);
        for(i = 0; i < 6; i++)
        {
            if(foo == feebasSpots[i])
                return TRUE;
        }        
    }
    //_08084B38
    return FALSE;
}

u16 FeebasRandom(void)
{
    gUnknown_0202FF80 = 12345 + 0x41C64E6D * gUnknown_0202FF80;
    return gUnknown_0202FF80 >> 16;
}

void FeebasSeedRng(u16 seed)
{
    gUnknown_0202FF80 = seed;
}

u8 PickWildMon_Grass(void)
{
    u8 val = Random() % 100;
    
    if(val < 20)
        return 0;
    if(val >= 20 && val < 40)
        return 1;
    if(val >= 40 && val < 50)
        return 2;
    if(val >= 50 && val < 60)
        return 3;
    if(val >= 60 && val < 70)
        return 4;
    if(val >= 70 && val < 80)
        return 5;
    if(val >= 80 && val < 85)
        return 6;
    if(val >= 85 && val < 90)
        return 7;
    if(val >= 90 && val < 94)
        return 8;
    if(val >= 94 && val < 98)
        return 9;
    if(val == 98)
        return 10;
    else
        return 11;
}

u8 PickWildMon_Water(void)
{
    u8 val = Random() % 100;
    
    if(val < 60)
        return 0;
    if(val >= 60 && val < 90)
        return 1;
    if(val >= 90 && val < 95)
        return 2;
    if(val >= 95 && val < 99)
        return 3;
    else
        return 4;
}

u8 PickWildMon_Fishing(u8 rod)
{
    u32 r5 = 0;
    u8 val = Random() % 100;
    
    switch(rod)
    {
        case 0: //old rod?
            if(val < 70)
                r5 = 0;
            else
                r5 = 1;
            return r5;
        case 1: //good rod?
            if(val < 60)
                r5 = 2;
            if(val >= 60 && val < 80)
                r5 = 3;
            if(val >= 80 && val < 100)
                r5 = 4;
            return r5;
        case 2: //super rod?
            if(val < 40)
                r5 = 5;
            if(val >= 40 && val < 80)
                r5 = 6;
            if(val >= 80 && val < 95)
                r5 = 7;
            if(val >= 95 && val < 99)
                r5 = 8;
            if(val == 99)
                r5 = 9;
            return r5;
        default:
            return r5;
    }
    
    return r5;
}

//Chooses level of wild Pokemon
u8 RandomInRange(struct WildPokemon *wildPokemon)
{
    u8 min;
    u8 max;
    u8 range;
    u8 rand;
    
    //Make sure minimum level is less than maximum level
    if(wildPokemon->maxLevel >= wildPokemon->minLevel)
    {
        min = wildPokemon->minLevel;
        max = wildPokemon->maxLevel;
    }
    else
    {
        min = wildPokemon->maxLevel;
        max = wildPokemon->minLevel;
    }
    range = max - min + 1;
    rand = Random() % range;
    return min + rand;
}

u16 GetCurrentMapWildMonHeader(void)
{
    u16 i;
    
    for(i = 0; gWildMonHeaders[i].mapGroup != 0xFF; i++)
    {
        if(gWildMonHeaders[i].mapGroup == gSaveBlock1.location.mapGroup &&
        gWildMonHeaders[i].mapNum == gSaveBlock1.location.mapNum)
            return i;
    }
    return -1;
}

u8 PickWildMonNature(void)
{
    u16 foo;
    u32 r7;
    u8 arr[25];
    
    if(GetSafariZoneFlag() == TRUE && Random() % 100 < 80)
    {
        r7 = sub_80C8448();
        
        if(r7)
        {
            u8 i;
            
            for(i = 0; i < 25; i++)
                arr[i] = i;
            //_08084E04
            for(i = 0; i < 24; i++)
            {
                u8 j;
                
                for(j = i + 1; j < 25; j++)
                {
                    if(Random() & 1)
                    {
                        u8 temp = arr[i];
                        
                        arr[i] = arr[j];
                        arr[j] = temp;
                    }
                }
            }
            //_08084E3E
            for(i = 0; i < 25; i++)
            {
                if(sub_810CAE4(arr[i], r7) > 0)
                    return arr[i];
            }
        }
    }
    //_08084E5E
    return Random() % 25;
}

void CreateWildMon(u16 a, u8 b)
{
    ZeroEnemyPartyMons();
    CreateMonWithNature(&gEnemyParty[0], a, b, 0x20, PickWildMonNature());
}

bool8 GenerateWildMon(struct WildPokemon **a, u8 b, u8 c)
{
    u8 mon = 0;
    u8 level;
    
    switch(b)
    {
        case 0:
            mon = PickWildMon_Grass();
            break;
        case 1:
            mon = PickWildMon_Water();
            break;
        case 2:
            mon = PickWildMon_Water();
            break;
        default:
            break;
    }
    
    level = RandomInRange(&a[1][mon]);
    if(c == 1 && RepelCheck(level) == 0)
    {
        return 0;
    }
    else
    {
        CreateWildMon(a[1][mon].species, level);
        return 1;
    }
}

bool32 GenerateFishingWildMon(struct WildPokemon **a, u8 rod)
{
    u8 mon = PickWildMon_Fishing(rod);
    u8 level = RandomInRange(&a[1][mon]);
    
    CreateWildMon(a[1][mon].species, level);
    return a[1][mon].species;
}

bool8 SetUpMassOutbreakEncounter(u8 a)
{
    u16 i;
    
    if(a == 1 && RepelCheck(gSaveBlock1.outbreak2B00) == 0)
    {
        return 0;
    }
    //_08084F78
    CreateWildMon(gSaveBlock1.outbreak2AFC, gSaveBlock1.outbreak2B00);
    for(i = 0; i < 4; i++)
    {
        SetMonMoveSlot(&gEnemyParty[0], gSaveBlock1.outbreak2B04[i], i);
    }
    return 1;
}

bool8 DoMassOutbreakEncounterTest(void)
{
    if(gSaveBlock1.outbreak2AFC &&
    gSaveBlock1.location.mapNum == gSaveBlock1.outbreak2AFE &&
    gSaveBlock1.location.mapGroup == gSaveBlock1.outbreak2AFF)
    {
        if(Random() % 100 < gSaveBlock1.outbreak2B0D)
            return 1;
    }
    return 0;
}

bool8 DoWildEncounterRateDiceRoll(u16 a)
{
    if(Random() % 2880 < a)
        return TRUE;
    else
        return FALSE;
}

bool8 DoWildEncounterTest(u32 a, u8 b)
{
    a *= 16;
    
    if(TestPlayerAvatarFlags(6))
    {
        a = a * 80 / 100;
    }
    //_0808507E
    ApplyFluteEncounterRateMod(&a);
    ApplyCleanseTagEncounterRateMod(&a);
    
    if(b == 0)
    {
        // UB: Too few arguments to function 'GetMonData'
        if(!GetMonData(&gPlayerParty[0], MON_DATA_SANITY_BIT3))
        {
            u32 ability = GetMonAbility(&gPlayerParty[0]);
            if(ability == 1)
                a /= 2;
            if(ability == 0x23)
                a *= 2;
        }
    }
    //_080850BA
    if(a > 2880)
        a = 2880;
    return DoWildEncounterRateDiceRoll(a);
}

bool8 DoGlobalWildEncounterDiceRoll(void)
{
    if(Random() % 100 >= 60)
        return FALSE;
    else
        return TRUE;
}


bool8 StandardWildEncounter(u16 a, u16 b)
{
    u16 unk;
    
    if(gWildEncountersDisabled != TRUE)
    {
        unk = GetCurrentMapWildMonHeader();
        
        if(unk != 0xFFFF)
        {
            if(sub_8057468(a) == 1)
            {
                if(gWildMonHeaders[unk].landMonsInfo)
                {
                    if(a != b && !DoGlobalWildEncounterDiceRoll())
                        return 0;
                    
                    if(DoWildEncounterTest(gWildMonHeaders[unk].landMonsInfo->encounterRate, 0) == TRUE)
                    {
                        if(sub_81344CC() != TRUE)
                        {
                            if(DoMassOutbreakEncounterTest() == TRUE && SetUpMassOutbreakEncounter(1) == TRUE)
                            {
                                sub_8081A00();
                                return 1;
                            }
                            
                            if(GenerateWildMon(gWildMonHeaders[unk].landMonsInfo, 0, 1) == 1)
                            {
                                sub_8081A00();
                                return 1;
                            }
                        }
                    }
                }
            }
            else
            {
                //_080851D8
                if(sub_8057494(a) == TRUE && TestPlayerAvatarFlags(8) || sub_8057434(a) == TRUE)
                {
                    if(gWildMonHeaders[unk].landMonsInfo)
                    {
                        if(a == b || DoGlobalWildEncounterDiceRoll())
                        {
                            if(DoWildEncounterTest(gWildMonHeaders[unk].waterMonsInfo->encounterRate, 0) == TRUE)
                            {
                                if(sub_81344CC() == TRUE)
                                {
                                    //_0808524A
                                    if(RepelCheck(gSaveBlock1.roamer.level))
                                    {
                                        sub_8081A5C();
                                        return 1;
                                    }
                                    else
                                        return 0;
                                }
                                else
                                {
                                    //_08085268
                                    if(GenerateWildMon(gWildMonHeaders[unk].waterMonsInfo, 1, 1) == 1)
                                    {
                                        sub_8081A00();
                                        return 1;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return 0;
}

/*
bool8 StandardWildEncounter(u16 a, u16 b)
{
    u16 unk;
    
    if(gWildEncountersDisabled == TRUE)
        return 0;
    unk = GetCurrentMapWildMonHeader();
    if(unk == 0xFFFF)
        return 0;
    if(sub_8057468(a) == 1)
    {
        if(gWildMonHeaders[unk].landMonsInfo == NULL)
            return 0;
        if(a != b && !DoGlobalWildEncounterDiceRoll())
            return 0;
        if(DoWildEncounterTest(gWildMonHeaders[unk].landMonsInfo->encounterRate, 0) != TRUE)
            return 0;
        if(sub_81344CC() == TRUE)
            goto _0808524A;
        if(DoMassOutbreakEncounterTest() == TRUE)
        {
            if(SetUpMassOutbreakEncounter(1) == TRUE)
                goto _0808527A;
        }
        //_080851AE
        if(GenerateWildMon(gWildMonHeaders[unk].landMonsInfo, 0, 1) == 1)
            goto _0808527A;
        return 0;
    }
    //_080851D8
    else
    {
        if(sub_8057494(a) != 1)
        {
            if(!TestPlayerAvatarFlags(8))
                return 0;
            if(sub_8057434(a) != 1)
                return 0;
        }
        //_08085200
        if(gWildMonHeaders[unk].waterMonsInfo == NULL)
            return 0;
        if(b != a && !DoGlobalWildEncounterDiceRoll())
            return 0;
        //_08085222
        if(DoWildEncounterTest(gWildMonHeaders[unk].waterMonsInfo->encounterRate, 0) != TRUE)
            return 0;
        if(sub_81344CC() == TRUE)
            goto _08085268;
    }
  _0808524A: //0x3144
    if(!RepelCheck(gSaveBlock1.roamer.level))
        return 0;
    sub_8081A5C();
    return 1;
    
  _08085268:
    if(!GenerateWildMon(gWildMonHeaders[unk].waterMonsInfo, 1, 1))
        return 0;
    
  _0808527A:
    sub_8081A00();
    return 1;
}
*/

void RockSmashWildEncounter(void)
{
    u16 headerNum = GetCurrentMapWildMonHeader();
    
    if(headerNum != 0xFFFF)
    {
        struct WildPokemonInfo *wildPokemonInfo = gWildMonHeaders[headerNum].rockSmashMonsInfo;
        
        if(wildPokemonInfo != NULL)
        {
            if(DoWildEncounterTest(wildPokemonInfo->encounterRate, 1) == TRUE)
            {
                if(GenerateWildMon(wildPokemonInfo, 2, 1) == 1)
                {
                    sub_8081A00();
                    gScriptResult = 1;
                    return;
                }
            }
        }
    }
    gScriptResult = 0;
    return;
}

/*
void FishingWildEncounter(u8 a)
{
    if(CheckFeebas(a) == TRUE)
    {
        CreateWildMon()
    }
    else
    {
        
    }
    sav12_xor_increment();
}
*/