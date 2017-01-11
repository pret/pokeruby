#include "global.h"
#include "battle.h"
#include "asm.h"
#include "pokemon.h"
#include "rng.h"
#include "abilities.h"
#include "species.h"
#include "item.h"

#define AIScriptRead32(ptr) ((ptr)[0] | (ptr)[1] << 8 | (ptr)[2] << 16 | (ptr)[3] << 24)
#define AIScriptRead16(ptr) ((ptr)[0] | (ptr)[1] << 8)
#define AIScriptRead8(ptr) ((ptr)[0])
#define AIScriptReadPtr(ptr) (u8*) AIScriptRead32(ptr)

#define AI_THINKING_STRUCT ((struct AI_ThinkingStruct *)(&battle_2000000 + 0x16800))
#define AI_ARRAY_160CC     ((&battle_2000000 + 0x160CC))

extern void sub_801CAF8(u8, u8);

enum
{
    TARGET,
    USER
};

extern void move_effectiveness_something(u16, u8, u8);

extern u16 gBattleTypeFlags;
extern u16 gBattleWeather;
extern u8 gUnknown_02024A60;
extern u8 gUnknown_02024A6A[][2];
extern u16 gUnknown_02024BE6;
extern int gUnknown_02024BEC;
extern u8 gUnknown_02024C07; // something player?
extern u8 gUnknown_02024C08; // something opponent?
extern u8 gUnknown_02024C0C;
extern u8 gUnknown_02024C68;
extern u16 gUnknown_02024DEC;
extern u16 gUnknown_02024C34[];
extern u32 gUnknown_02024ACC[];
extern u32 gUnknown_02024C98[];
extern u16 gUnknown_02024C7A[];
extern struct BattlePokemon gBattleMons[];
extern struct BattlePokemon gUnknown_02024A8C[];
extern u8 gUnknown_030042E0[];
extern u8 gCritMultiplier;
extern u16 gTrainerBattleOpponent;
extern u32 gBitTable[];
extern u8 *BattleAIs[];
extern struct Trainer gTrainers[];
extern struct BattleMove gBattleMoves[];
extern struct BaseStats gBaseStats[];
extern void (*gBattleAICmdTable[])(void);

/*
gAIScriptPtr is a pointer to the next battle AI cmd command to read.
when a command finishes processing, gAIScriptPtr is incremented by
the number of bytes that the current command had reserved for arguments
in order to read the next command correctly. refer to battle_ai_scripts.s for the
AI scripts.
*/
extern u8 *gAIScriptPtr;

struct UnknownStruct1
{
/* 0x00 */ u16 unk0[2][8];
/* 0x20 */ u8 unk20[2];
/* 0x22 */ u8 unk22[2];
/* 0x24 */ u16 items[4];
/* 0x2C */ u8 unk8;
};

struct UnknownStruct3
{
    u8 filler0[0x20];
    u8 unk20;
};

struct UnknownStruct4
{
    u8 filler0[0x3];
    u16 unk4;
    u16 unk6;
    u8 filler8;
    u8 unk9;
    u8 fillerA[0xC];
    u8 unk16;
    u8 filler17[0x4];
};

extern struct UnknownStruct1 unk_2016A00;
extern struct UnknownStruct3 unk_2016C00;
extern struct UnknownStruct4 gUnknown_02024CA8[];

void BattleAI_SetupAIData(void);
void BattleAI_DoAIProcessing(void);
void sub_810745C(void);

// if the AI is a Link battle, safari, battle tower, or ereader, it will ignore considering item uses.
void BattleAI_HandleItemUseBeforeAISetup(void)
{
    s32 i;
    u8 *data = (u8 *)&unk_2016A00;

    for (i = 0; (u32)i < 48; i++)
        data[i] = 0;
    if ((gBattleTypeFlags & BATTLE_TYPE_TRAINER)
     && gTrainerBattleOpponent != 0x400
     && !(gBattleTypeFlags & (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_EREADER_TRAINER)))
    {
        for (i = 0; i < 4; i++)
        {
            if (gTrainers[gTrainerBattleOpponent].items[i] != 0)
            {
                unk_2016A00.items[unk_2016A00.unk8] = gTrainers[gTrainerBattleOpponent].items[i];
                unk_2016A00.unk8++;
            }
        }
    }

    BattleAI_SetupAIData();
}

void BattleAI_SetupAIData(void)
{
    s32 i;
    u8 *data = (u8 *)&gAIThinkingSpace;
    u8 r7;

    // clear AI data and set default move score to 100.
    for(i = 0; (u32)i < 28; i++)
        data[i] = 0;
    for(i = 0; i < 4; i++)
        gAIThinkingSpace.score[i] = 100;

    r7 = sub_8015A98(gUnknown_02024A60, 0, 0xFF);

    for(i = 0; i < 4; i++)
    {
        u16 rand;

        if(gBitTable[i] & r7)
            gAIThinkingSpace.score[i] = 0;
        rand = Random();
        gAIThinkingSpace.unk18[i] = 100 - (rand & 0xF);
    }

    unk_2016C00.unk20 = 0;
    gUnknown_02024C07 = gUnknown_02024A60;

    if(gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        gUnknown_02024C08 = Random() & 2;

        if(gUnknown_02024C0C & gBitTable[gUnknown_02024C08])
            gUnknown_02024C08 ^= 2;
    }
    else
        gUnknown_02024C08 = gUnknown_02024A60 ^ 1;

    // special AI flag cases.
    if(gBattleTypeFlags & BATTLE_TYPE_SAFARI)
        gAIThinkingSpace.aiFlags = 0x40000000;
    else if(gBattleTypeFlags & BATTLE_TYPE_ROAMER)
        gAIThinkingSpace.aiFlags = 0x20000000;
    else if(gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
        gAIThinkingSpace.aiFlags = 0x80000000;
    else // otherwise, just set aiFlags to whatever flags the trainer has set in their data.
        gAIThinkingSpace.aiFlags = gTrainers[gTrainerBattleOpponent].aiFlags;
}

u8 BattleAI_GetAIActionToUse(void)
{
    u8 arr1[4];
    u8 arr2[4];
    u8 r5;
    s32 i;

    sub_810745C();
    while(gAIThinkingSpace.aiFlags != 0)
    {
        if(gAIThinkingSpace.aiFlags & 1)
        {
            gAIThinkingSpace.unk0 = 0;
            BattleAI_DoAIProcessing();
        }
        gAIThinkingSpace.aiFlags >>= 1;
        gAIThinkingSpace.aiLogicId++;
        gAIThinkingSpace.moveConsidered = 0;
    }

    // will KO, need to use item or switch.
    if(gAIThinkingSpace.unk10 & 2)
        return 4;
    if(gAIThinkingSpace.unk10 & 4)
        return 5;

    r5 = 1;
    arr1[0] = gAIThinkingSpace.score[0];
    arr2[0] = 0;

    for(i = 1; i < 4; i++)
    {
        if(arr1[0] < (s8)gAIThinkingSpace.score[i])
        {
            r5 = 1;
            arr1[0] = gAIThinkingSpace.score[i];
            arr2[0] = i;
        }
        if(arr1[0] == (s8)gAIThinkingSpace.score[i])
        {
            arr1[r5] = gAIThinkingSpace.score[i];
            arr2[r5++] = i;
        }
    }

    return arr2[Random() % r5];
}

void BattleAI_DoAIProcessing(void)
{
    while(gAIThinkingSpace.unk0 != 2)
    {
        switch(gAIThinkingSpace.unk0)
        {
        case 3: //Needed to match.
            break;
        case 0:
            gAIScriptPtr = BattleAIs[gAIThinkingSpace.aiLogicId];
            if(gBattleMons[gUnknown_02024C07].pp[gAIThinkingSpace.moveConsidered] == 0)
            {
                gAIThinkingSpace.unk2 = 0;
            }
            else
            {
                gAIThinkingSpace.unk2 = gBattleMons[gUnknown_02024C07].moves[gAIThinkingSpace.moveConsidered];
            }
            gAIThinkingSpace.unk0++;
            break;
        case 1:
            if(gAIThinkingSpace.unk2 != 0)
                gBattleAICmdTable[*(u8 *)gAIScriptPtr](); // run AI command.
            else
            {
                gAIThinkingSpace.score[gAIThinkingSpace.moveConsidered] = 0;
                gAIThinkingSpace.unk10 |= 1;
            }
            if(gAIThinkingSpace.unk10 & 1)
            {
                gAIThinkingSpace.moveConsidered++;
                if(gAIThinkingSpace.moveConsidered < 4 && !(gAIThinkingSpace.unk10 & 8))
                    gAIThinkingSpace.unk0 = 0;
                else
                    gAIThinkingSpace.unk0++;
                gAIThinkingSpace.unk10 &= 0xFE;
            }
            break;
        }
    }
}

void sub_810745C(void)
{
    s32 i;

    for(i = 0; i < 8; i++)
    {
        // this is the same as dividing it by 2, but for some reason, >> 1 is needed to match the asm.
        if(unk_2016A00.unk0[gUnknown_02024C08 >> 1][i] == 0)
        {
            unk_2016A00.unk0[gUnknown_02024C08 >> 1][i] = gUnknown_02024C34[gUnknown_02024C08];
            return;
        }
    }
}

void unref_sub_81074A0(u8 a)
{
    s32 i;

    for(i = 0; i < 8; i++)
        unk_2016A00.unk0[a / 2][i] = 0;
}

void sub_81074C4(u8 a, u8 b)
{
    if(battle_side_get_owner(a) == 0)
        unk_2016A00.unk20[battle_get_per_side_status(a) & 1] = b;
}

void sub_81074F8(u8 a, u8 b)
{
    if(battle_side_get_owner(a) == 0)
        unk_2016A00.unk22[battle_get_per_side_status(a) & 1] = b;
}

void BattleAICmd_if_random(void)
{
    u16 random = Random();

    if (!(random % 256 >= gAIScriptPtr[1])) // roll a random value. is it less than the parameter of the if_random call? (96 on if_random 80 will return true)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_not_random(void)
{
    u16 random = Random();

    if (!(random % 256 <= gAIScriptPtr[1])) // roll a random value. is it greater than the parameter of the if_random call? (96 on if_random 80 will return true)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_random_1(void) // if RNG Value equal to
{
    u16 random = Random();

    if (random % 256 == gAIScriptPtr[1]) // roll a random value. is it greater than the parameter of the if_random call? (96 on if_random 80 will return true)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_not_random_1(void) // if RNG value not equal to
{
    u16 random = Random();

    if (random % 256 != gAIScriptPtr[1]) // roll a random value. is it greater than the parameter of the if_random call? (96 on if_random 80 will return true)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_score(void)
{
    gAIThinkingSpace.score[gAIThinkingSpace.moveConsidered] += gAIScriptPtr[1]; // add the result to the array of the move consider's score.

    if(gAIThinkingSpace.score[gAIThinkingSpace.moveConsidered] < 0) // if the score is negative, flatten it to 0.
        gAIThinkingSpace.score[gAIThinkingSpace.moveConsidered] = 0;

    gAIScriptPtr += 2; // AI return.
}

void BattleAICmd_if_hp_less_than(void)
{
    u16 var;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    if ((u32)(100 * gBattleMons[var].hp / gBattleMons[var].maxHP) < gAIScriptPtr[2])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

void BattleAICmd_if_hp_more_than(void)
{
    u16 var;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    if ((u32)(100 * gBattleMons[var].hp / gBattleMons[var].maxHP) > gAIScriptPtr[2])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

void BattleAICmd_if_hp_equal(void)
{
    u16 var;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    if ((u32)(100 * gBattleMons[var].hp / gBattleMons[var].maxHP) == gAIScriptPtr[2])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

void BattleAICmd_if_hp_not_equal(void)
{
    u16 var;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    if ((u32)(100 * gBattleMons[var].hp / gBattleMons[var].maxHP) != gAIScriptPtr[2])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

void BattleAICmd_if_status(void)
{
    u16 var;
    u32 temp;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    temp = AIScriptRead32(gAIScriptPtr + 2);

    if (gBattleMons[var].status1 & temp)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
    else
        gAIScriptPtr += 10;
}

void BattleAICmd_if_not_status(void)
{
    u16 var;
    u32 temp;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    temp = AIScriptRead32(gAIScriptPtr + 2);

    if (!(gBattleMons[var].status1 & temp))
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
    else
        gAIScriptPtr += 10;
}

void BattleAICmd_if_status2(void)
{
    u8 var;
    u32 temp;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    temp = AIScriptRead32(gAIScriptPtr + 2);

    if (gBattleMons[var].status2 & temp)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
    else
        gAIScriptPtr += 10;
}

void BattleAICmd_if_not_status2(void)
{
    u8 var;
    u32 temp;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    temp = AIScriptRead32(gAIScriptPtr + 2);

    if (!(gBattleMons[var].status2 & temp))
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
    else
        gAIScriptPtr += 10;
}

void BattleAICmd_if_status3(void)
{
    u8 var;
    u32 temp;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    temp = AIScriptRead32(gAIScriptPtr + 2);

    if ( gUnknown_02024C98[var] & temp )
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
    else
        gAIScriptPtr += 10;
}

void BattleAICmd_if_not_status3(void)
{
    u8 var;
    u32 temp;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    temp = AIScriptRead32(gAIScriptPtr + 2);

    if (!(gUnknown_02024C98[var] & temp))
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
    else
        gAIScriptPtr += 10;
}

void BattleAICmd_if_status4(void)
{
    u8 var;
    u32 temp;
    u32 temp2;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    temp = battle_get_per_side_status(var) & 1;
    temp2 = AIScriptRead32(gAIScriptPtr + 2);

    if ( gUnknown_02024C7A[temp] & temp2 )
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
    else
        gAIScriptPtr += 10;
}

void BattleAICmd_if_not_status4(void)
{
    u8 var;
    u32 temp;
    u32 temp2;

    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    temp = battle_get_per_side_status(var) & 1;
    temp2 = AIScriptRead32(gAIScriptPtr + 2);

    if (!(gUnknown_02024C7A[temp] & temp2))
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
    else
        gAIScriptPtr += 10;
}

void BattleAICmd_if_less_than(void)
{
    if (gAIThinkingSpace.funcResult < gAIScriptPtr[1])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_more_than(void)
{
    if (gAIThinkingSpace.funcResult > gAIScriptPtr[1])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_equal(void)
{
    if (gAIThinkingSpace.funcResult == gAIScriptPtr[1])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_not_equal(void)
{
    if (gAIThinkingSpace.funcResult != gAIScriptPtr[1])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_less_than_32(void)
{
    u8 *temp = AIScriptReadPtr(gAIScriptPtr + 1);

    if (gAIThinkingSpace.funcResult < *temp)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
    else
        gAIScriptPtr += 9;
}

void BattleAICmd_if_more_than_32(void)
{
    u8 *temp = AIScriptReadPtr(gAIScriptPtr + 1);

    if (gAIThinkingSpace.funcResult > *temp)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
    else
        gAIScriptPtr += 9;
}

void BattleAICmd_if_equal_32(void)
{
    u8 *temp = AIScriptReadPtr(gAIScriptPtr + 1);

    if (gAIThinkingSpace.funcResult == *temp)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
    else
        gAIScriptPtr += 9;
}

void BattleAICmd_if_not_equal_32(void)
{
    u8 *temp = AIScriptReadPtr(gAIScriptPtr + 1);

    if (gAIThinkingSpace.funcResult != *temp)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
    else
        gAIScriptPtr += 9;
}

void BattleAICmd_if_move(void)
{
    u16 move = AIScriptRead16(gAIScriptPtr + 1);

    if (gAIThinkingSpace.unk2 == move)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

void BattleAICmd_if_not_move(void)
{
    u16 move = AIScriptRead16(gAIScriptPtr + 1);

    if (gAIThinkingSpace.unk2 != move)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
    else
        gAIScriptPtr += 7;
}

void BattleAICmd_if_in_bytes(void)
{
    u8 *ptr = AIScriptReadPtr(gAIScriptPtr + 1);

   while(*ptr != 0xFF)
   {
       if(gAIThinkingSpace.funcResult == *ptr)
       {
           gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
           return;
       }
       ptr++;
   }
   gAIScriptPtr += 9;
}

void BattleAICmd_if_not_in_bytes(void)
{
    u8 *ptr = AIScriptReadPtr(gAIScriptPtr + 1);

   while(*ptr != 0xFF)
   {
       if(gAIThinkingSpace.funcResult == *ptr)
       {
           gAIScriptPtr += 9;
           return;
       }
       ptr++;
   }
   gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
}

void BattleAICmd_if_in_words(void)
{
    u16 *ptr = (u16 *)AIScriptReadPtr(gAIScriptPtr + 1);

   while(*ptr != 0xFFFF)
   {
       if(gAIThinkingSpace.funcResult == *ptr)
       {
           gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
           return;
       }
       ptr++;
   }
   gAIScriptPtr += 9;
}

void BattleAICmd_if_not_in_words(void)
{
    u16 *ptr = (u16 *)AIScriptReadPtr(gAIScriptPtr + 1);

   while(*ptr != 0xFFFF)
   {
       if(gAIThinkingSpace.funcResult == *ptr)
       {
           gAIScriptPtr += 9;
           return;
       }
       ptr++;
   }
   gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
}

void BattleAICmd_if_user_can_damage(void)
{
   s32 i;

   for(i = 0; i < 4; i++)
   {
       if (gBattleMons[gUnknown_02024C07].moves[i] != 0
        && gBattleMoves[gBattleMons[gUnknown_02024C07].moves[i]].power != 0)
           break;
   }
   if(i == 4)
       gAIScriptPtr += 5;
   else
       gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 1);
}

void BattleAICmd_if_user_cant_damage(void)
{
   s32 i;

   for(i = 0; i < 4; i++)
   {
       if (gBattleMons[gUnknown_02024C07].moves[i] != 0
        && gBattleMoves[gBattleMons[gUnknown_02024C07].moves[i]].power != 0)
           break;
   }
   if(i != 4)
       gAIScriptPtr += 5;
   else
       gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 1);
}

void BattleAICmd_unk_21(void)
{
    gAIThinkingSpace.funcResult = gUnknown_030042E0[19];
    gAIScriptPtr += 1;
}

void BattleAICmd_get_type(void)
{
    u8 typeVar = gAIScriptPtr[1];

    switch(typeVar)
    {
        case 1:
            gAIThinkingSpace.funcResult = gBattleMons[gUnknown_02024C07].type1;
            break;
        case 0:
            gAIThinkingSpace.funcResult = gBattleMons[gUnknown_02024C08].type1;
            break;
        case 3:
            gAIThinkingSpace.funcResult = gBattleMons[gUnknown_02024C07].type2;
            break;
        case 2:
            gAIThinkingSpace.funcResult = gBattleMons[gUnknown_02024C08].type2;
            break;
        case 4:
            gAIThinkingSpace.funcResult = gBattleMoves[gAIThinkingSpace.unk2].type;
            break;
    }
    gAIScriptPtr += 2;
}

void BattleAICmd_unk_23(void)
{
    gAIThinkingSpace.funcResult = gBattleMoves[gAIThinkingSpace.unk2].power;
    gAIScriptPtr += 1;
}

__attribute__((naked))
void BattleAICmd_unk_24(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x14\n\
    movs r3, 0\n\
    ldr r0, _08108328 @ =gUnknown_083F62BC\n\
    ldrh r1, [r0]\n\
    ldr r4, _0810832C @ =0x0000ffff\n\
    ldr r6, _08108330 @ =gBattleMoves\n\
    ldr r5, _08108334 @ =0x02016800\n\
    cmp r1, r4\n\
    beq _0810822E\n\
    ldrh r1, [r5, 0x2]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldrb r2, [r0]\n\
    ldr r1, _08108328 @ =gUnknown_083F62BC\n\
_0810821E:\n\
    ldrh r0, [r1]\n\
    cmp r2, r0\n\
    beq _0810822E\n\
    adds r1, 0x2\n\
    adds r3, 0x1\n\
    ldrh r0, [r1]\n\
    cmp r0, r4\n\
    bne _0810821E\n\
_0810822E:\n\
    ldrh r0, [r5, 0x2]\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r6\n\
    ldrb r0, [r1, 0x1]\n\
    cmp r0, 0x1\n\
    bhi _08108240\n\
    b _081083B2\n\
_08108240:\n\
    lsls r0, r3, 1\n\
    ldr r1, _08108328 @ =gUnknown_083F62BC\n\
    adds r0, r1\n\
    ldrh r3, [r0]\n\
    ldr r0, _0810832C @ =0x0000ffff\n\
    cmp r3, r0\n\
    beq _08108250\n\
    b _081083B2\n\
_08108250:\n\
    ldr r0, _08108338 @ =gUnknown_02024DEC\n\
    movs r1, 0\n\
    strh r1, [r0]\n\
    ldr r2, _0810833C @ =0xfffff81c\n\
    adds r0, r5, r2\n\
    strb r1, [r0]\n\
    adds r2, 0x3\n\
    adds r0, r5, r2\n\
    movs r2, 0x1\n\
    strb r2, [r0]\n\
    ldr r0, _08108340 @ =gUnknown_02024C68\n\
    strb r1, [r0]\n\
    ldr r0, _08108344 @ =gCritMultiplier\n\
    strb r2, [r0]\n\
    movs r6, 0\n\
    mov r9, r3\n\
    ldr r0, _08108328 @ =gUnknown_083F62BC\n\
    ldrh r0, [r0]\n\
    str r0, [sp, 0x10]\n\
_08108276:\n\
    movs r3, 0\n\
    ldr r5, _08108348 @ =gBattleMons\n\
    lsls r4, r6, 1\n\
    ldr r7, _0810834C @ =gUnknown_02024C07\n\
    lsls r1, r6, 2\n\
    mov r8, r1\n\
    adds r2, r6, 0x1\n\
    mov r10, r2\n\
    ldr r0, [sp, 0x10]\n\
    cmp r0, r9\n\
    beq _081082BA\n\
    ldr r2, _08108330 @ =gBattleMoves\n\
    ldrb r1, [r7]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r4, r0\n\
    adds r1, r5, 0\n\
    adds r1, 0xC\n\
    adds r0, r1\n\
    ldrh r1, [r0]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    ldrb r2, [r0]\n\
    ldr r1, _08108328 @ =gUnknown_083F62BC\n\
_081082AA:\n\
    ldrh r0, [r1]\n\
    cmp r2, r0\n\
    beq _081082BA\n\
    adds r1, 0x2\n\
    adds r3, 0x1\n\
    ldrh r0, [r1]\n\
    cmp r0, r9\n\
    bne _081082AA\n\
_081082BA:\n\
    ldrb r1, [r7]\n\
    movs r0, 0x58\n\
    muls r0, r1\n\
    adds r0, r4, r0\n\
    adds r1, r5, 0\n\
    adds r1, 0xC\n\
    adds r1, r0, r1\n\
    ldrh r0, [r1]\n\
    cmp r0, 0\n\
    beq _0810835C\n\
    lsls r0, r3, 1\n\
    ldr r2, _08108328 @ =gUnknown_083F62BC\n\
    adds r0, r2\n\
    ldrh r0, [r0]\n\
    cmp r0, r9\n\
    bne _0810835C\n\
    ldr r0, _08108330 @ =gBattleMoves\n\
    ldrh r2, [r1]\n\
    lsls r1, r2, 1\n\
    adds r1, r2\n\
    lsls r1, 2\n\
    adds r1, r0\n\
    ldrb r0, [r1, 0x1]\n\
    cmp r0, 0x1\n\
    bls _0810835C\n\
    ldr r5, _08108350 @ =gUnknown_02024BE6\n\
    strh r2, [r5]\n\
    ldrb r0, [r7]\n\
    ldr r4, _08108354 @ =gUnknown_02024C08\n\
    ldrb r1, [r4]\n\
    bl sub_801CAF8\n\
    ldrh r0, [r5]\n\
    ldrb r1, [r7]\n\
    ldrb r2, [r4]\n\
    bl move_effectiveness_something\n\
    mov r4, sp\n\
    add r4, r8\n\
    ldr r2, _08108358 @ =gUnknown_02024BEC\n\
    ldr r0, _08108334 @ =0x02016800\n\
    adds r0, 0x18\n\
    adds r0, r6, r0\n\
    ldrb r1, [r0]\n\
    ldr r0, [r2]\n\
    muls r0, r1\n\
    movs r1, 0x64\n\
    bl __divsi3\n\
    str r0, [r4]\n\
    cmp r0, 0\n\
    bne _08108364\n\
    movs r0, 0x1\n\
    str r0, [r4]\n\
    b _08108364\n\
    .align 2, 0\n\
_08108328: .4byte gUnknown_083F62BC\n\
_0810832C: .4byte 0x0000ffff\n\
_08108330: .4byte gBattleMoves\n\
_08108334: .4byte 0x02016800\n\
_08108338: .4byte gUnknown_02024DEC\n\
_0810833C: .4byte 0xfffff81c\n\
_08108340: .4byte gUnknown_02024C68\n\
_08108344: .4byte gCritMultiplier\n\
_08108348: .4byte gBattleMons\n\
_0810834C: .4byte gUnknown_02024C07\n\
_08108350: .4byte gUnknown_02024BE6\n\
_08108354: .4byte gUnknown_02024C08\n\
_08108358: .4byte gUnknown_02024BEC\n\
_0810835C:\n\
    mov r1, sp\n\
    add r1, r8\n\
    movs r0, 0\n\
    str r0, [r1]\n\
_08108364:\n\
    mov r6, r10\n\
    cmp r6, 0x3\n\
    ble _08108276\n\
    movs r6, 0\n\
    ldr r1, _081083A4 @ =0x02016800\n\
    ldrb r0, [r1, 0x1]\n\
    lsls r0, 2\n\
    add r0, sp\n\
    ldr r2, [sp]\n\
    ldr r0, [r0]\n\
    adds r5, r1, 0\n\
    ldr r4, _081083A8 @ =gAIScriptPtr\n\
    cmp r2, r0\n\
    bgt _0810839A\n\
    adds r3, r5, 0\n\
    mov r2, sp\n\
_08108384:\n\
    adds r2, 0x4\n\
    adds r6, 0x1\n\
    cmp r6, 0x3\n\
    bgt _0810839A\n\
    ldrb r0, [r3, 0x1]\n\
    lsls r0, 2\n\
    add r0, sp\n\
    ldr r1, [r2]\n\
    ldr r0, [r0]\n\
    cmp r1, r0\n\
    ble _08108384\n\
_0810839A:\n\
    cmp r6, 0x4\n\
    bne _081083AC\n\
    movs r0, 0x2\n\
    str r0, [r5, 0x8]\n\
    b _081083B8\n\
    .align 2, 0\n\
_081083A4: .4byte 0x02016800\n\
_081083A8: .4byte gAIScriptPtr\n\
_081083AC:\n\
    movs r0, 0x1\n\
    str r0, [r5, 0x8]\n\
    b _081083B8\n\
_081083B2:\n\
    movs r0, 0\n\
    str r0, [r5, 0x8]\n\
    ldr r4, _081083D0 @ =gAIScriptPtr\n\
_081083B8:\n\
    ldr r0, [r4]\n\
    adds r0, 0x1\n\
    str r0, [r4]\n\
    add sp, 0x14\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_081083D0: .4byte gAIScriptPtr\n\
    .syntax divided\n");
}

void BattleAICmd_get_move(void)
{
    if (gAIScriptPtr[1] == USER)
        gAIThinkingSpace.funcResult = gUnknown_02024C34[gUnknown_02024C07];
    else
        gAIThinkingSpace.funcResult = gUnknown_02024C34[gUnknown_02024C08];

    gAIScriptPtr += 2;
}

void BattleAICmd_if_type(void)
{
    if ( gAIScriptPtr[1] == gAIThinkingSpace.funcResult )
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_unk_27(void) // if_not_type
{
    if ( gAIScriptPtr[1] != gAIThinkingSpace.funcResult )
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_would_go_first(void)
{
    if ( b_first_side(gUnknown_02024C07, gUnknown_02024C08, 1) == gAIScriptPtr[1] )
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_would_not_go_first(void)
{
    if ( b_first_side(gUnknown_02024C07, gUnknown_02024C08, 1) != gAIScriptPtr[1] )
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_unk_2A(void)
{}

void BattleAICmd_unk_2B(void)
{}

void BattleAICmd_count_alive_pokemon(void)
{
    u8 index;
    struct Pokemon *party;
    struct AI_ThinkingStruct *ai = &battle_2000000.ai;
    int i;
    u8 var, var2;

    ai->funcResult = 0;

    if (gAIScriptPtr[1] == USER)
        index = gUnknown_02024C07;
    else
        index = gUnknown_02024C08;

    if (battle_side_get_owner(index) == 0)
        party = gPlayerParty;
    else
        party = gEnemyParty;

    if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
    {
        u32 status;
        var = gUnknown_02024A6A[index][0];
        status = battle_get_per_side_status(index) ^ 2;
        var2 = gUnknown_02024A6A[battle_get_side_with_given_state(status)][0];
    }
    else
    {
        var = gUnknown_02024A6A[index][0];
        var2 = gUnknown_02024A6A[index][0];
    }

    for (i = 0; i < 6; i++)
    {
        struct AI_ThinkingStruct *ai2 = &battle_2000000.ai;
        if (i != var && i != var2
         && GetMonData(&party[i], MON_DATA_HP) != 0
         && GetMonData(&party[i], MON_DATA_SPECIES2) != SPECIES_NONE
         && GetMonData(&party[i], MON_DATA_SPECIES2) != SPECIES_EGG)
        {
            ai2->funcResult++;
        }
    }

    gAIScriptPtr += 2;
}

void BattleAICmd_unk_2D(void)
{
    gAIThinkingSpace.funcResult = gAIThinkingSpace.unk2;
    gAIScriptPtr += 1;
}

void BattleAICmd_unk_2E(void)
{
    gAIThinkingSpace.funcResult = gBattleMoves[gAIThinkingSpace.unk2].effect;
    gAIScriptPtr += 1;
}

void BattleAICmd_get_ability(void)
{
    u8 var;

    if(gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;

    if(battle_side_get_owner(var) == TARGET)
    {
        u16 unk = battle_get_per_side_status(var) & 1;

        if(unk_2016A00.unk20[unk] != 0)
        {
            ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->funcResult = unk_2016A00.unk20[unk];
            gAIScriptPtr += 2;
            return;
        }

        // abilities that prevent fleeing.
        if(gBattleMons[var].ability == ABILITY_SHADOW_TAG || gBattleMons[var].ability == ABILITY_MAGNET_PULL || gBattleMons[var].ability == ABILITY_ARENA_TRAP)
        {
            gAIThinkingSpace.funcResult = gBattleMons[var].ability;
            gAIScriptPtr += 2;
            return;
        }

        if(gBaseStats[gBattleMons[var].species].ability1 != ABILITY_NONE)
        {
            if(gBaseStats[gBattleMons[var].species].ability2 != ABILITY_NONE)
            {
                // AI is guessing what ability?
                if(Random() & 1)
                {
                    ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->funcResult = gBaseStats[gBattleMons[var].species].ability1;
                    gAIScriptPtr += 2;
                    return;
                }
                else
                {
                    ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->funcResult = gBaseStats[gBattleMons[var].species].ability2;
                    gAIScriptPtr += 2;
                    return;
                }
            }
            else
            {
                ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->funcResult = gBaseStats[gBattleMons[var].species].ability1; // it's definitely ability 1.
                gAIScriptPtr += 2;
                return;
            }
        }
        else
        {
            ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->funcResult = gBaseStats[gBattleMons[var].species].ability2; // AI cant actually reach this part since every mon has at least 1 ability.
            gAIScriptPtr += 2;
            return;
        }
    }
    else
    {
        // The AI knows its own ability.
        gAIThinkingSpace.funcResult = gBattleMons[var].ability;
        gAIScriptPtr += 2;
        return;
    }
}

void BattleAICmd_unk_30(void)
{
    s32 i;
    struct AI_ThinkingStruct *ai;
    struct AI_ThinkingStruct *ai2;

    gUnknown_02024DEC = 0;
    battle_2000000.unk.unk1 = 0;
    battle_2000000.unk.unk4 = 1;
    gUnknown_02024C68 = 0;
    gCritMultiplier = 1;
    ai = &battle_2000000.ai;
    ai->funcResult = 0;

    for(i = 0; i < 4; i++)
    {
        gUnknown_02024BEC = 40;
        gUnknown_02024BE6 = gBattleMons[gUnknown_02024C07].moves[i];

        if (gUnknown_02024BE6)
        {
            move_effectiveness_something(gUnknown_02024BE6, gUnknown_02024C07, gUnknown_02024C08);

            // reduce by 1/3.
            if (gUnknown_02024BEC == 120)
                gUnknown_02024BEC = 80;
            if(gUnknown_02024BEC == 240)
                gUnknown_02024BEC = 160;
            if(gUnknown_02024BEC == 30)
                gUnknown_02024BEC = 20;
            if(gUnknown_02024BEC == 15)
                gUnknown_02024BEC = 10;

            if(gUnknown_02024C68 & 8)
                gUnknown_02024BEC = 0;

            ai2 = &battle_2000000.ai;
            if (ai2->funcResult < gUnknown_02024BEC)
                ai2->funcResult = gUnknown_02024BEC;
        }
    }
    gAIScriptPtr += 1;
}

void BattleAICmd_if_damage_bonus(void)
{
    struct AI_ThinkingStruct *ai;
    u8 damageVar;

    gUnknown_02024DEC = 0;
    battle_2000000.unk.unk1 = 0;
    battle_2000000.unk.unk4 = 1;
    gUnknown_02024C68 = 0;
    gCritMultiplier = 1;

    gUnknown_02024BEC = 40;
    gUnknown_02024BE6 = (ai = &battle_2000000.ai)->unk2;

    move_effectiveness_something(gUnknown_02024BE6, gUnknown_02024C07, gUnknown_02024C08);

    if (gUnknown_02024BEC == 120)
        gUnknown_02024BEC = 80;
    if(gUnknown_02024BEC == 240)
        gUnknown_02024BEC = 160;
    if(gUnknown_02024BEC == 30)
        gUnknown_02024BEC = 20;
    if(gUnknown_02024BEC == 15)
        gUnknown_02024BEC = 10;

    if(gUnknown_02024C68 & 8)
        gUnknown_02024BEC = 0;

    // i have to store 2024BEC in a local variable before the comparison or else it will not match.
    damageVar = gUnknown_02024BEC;
    if(damageVar == gAIScriptPtr[1])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_unk_32(void)
{}

void BattleAICmd_unk_33(void)
{}

void BattleAICmd_if_status_in_party(void)
{
    struct Pokemon *party;
    int i;
    u32 statusToCompareTo;

    if (gAIScriptPtr[1] == USER)
    {
        party = gEnemyParty;
    }
    else if (0)
    {
    // what is going on here?
    follow_jump:
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
        return;
    }
    else
    {
        party = gPlayerParty;
    }

    statusToCompareTo = AIScriptRead32(gAIScriptPtr + 2);

    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&party[i], MON_DATA_SPECIES);
        u16 hp = GetMonData(&party[i], MON_DATA_HP);
        u32 status = GetMonData(&party[i], MON_DATA_STATUS);

        if (species != SPECIES_NONE && species != SPECIES_EGG && hp != 0 && status == statusToCompareTo)
            goto follow_jump;
    }

    gAIScriptPtr += 10;
}

void BattleAICmd_if_status_not_in_party(void)
{
    struct Pokemon *party;
    int i;
    u32 statusToCompareTo;
    u8 *partyPtr;

    // what weird code. needed to match
    switch(gAIScriptPtr[1])
    {
        case 1:
            partyPtr = (u8 *)gEnemyParty;
            party = (struct Pokemon *)partyPtr;
            break;
        default:
            partyPtr = (u8 *)gPlayerParty;
            party = (struct Pokemon *)partyPtr;
            break;
    }

    statusToCompareTo = AIScriptRead32(gAIScriptPtr + 2);

    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&party[i], MON_DATA_SPECIES);
        u16 hp = GetMonData(&party[i], MON_DATA_HP);
        u32 status = GetMonData(&party[i], MON_DATA_STATUS);

        // this jump is seemingly bugged. everytime the status is found, the AI's logic jumps further and further past its intended destination.
        if (species != SPECIES_NONE && species != SPECIES_EGG && hp != 0 && status == statusToCompareTo)
            gAIScriptPtr += 10; // doesnt return?
    }
    gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 6);
}

void BattleAICmd_unk_36(void)
{
    if(gBattleWeather & 7)
        gAIThinkingSpace.funcResult = 1;
    if(gBattleWeather & 0x18)
        gAIThinkingSpace.funcResult = 2;
    if(gBattleWeather & 0x60)
        gAIThinkingSpace.funcResult = 0;
    if(gBattleWeather & 0x80)
        gAIThinkingSpace.funcResult = 3;
    
    gAIScriptPtr += 1;
}

void BattleAICmd_if_effect(void)
{
    if(gBattleMoves[gAIThinkingSpace.unk2].effect == gAIScriptPtr[1])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_not_effect(void)
{
    if(gBattleMoves[gAIThinkingSpace.unk2].effect != gAIScriptPtr[1])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
    else
        gAIScriptPtr += 6;
}

void BattleAICmd_if_stat_level_less_than(void)
{
    u32 party;

    if(gAIScriptPtr[1] == USER)
        party = gUnknown_02024C07;
    else
        party = gUnknown_02024C08;
    
    if(gBattleMons[party].statStages[gAIScriptPtr[2]] < gAIScriptPtr[3])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 4);
    else
        gAIScriptPtr += 8;
}

void BattleAICmd_if_stat_level_more_than(void)
{
    u32 party;

    if(gAIScriptPtr[1] == USER)
        party = gUnknown_02024C07;
    else
        party = gUnknown_02024C08;
    
    if(gBattleMons[party].statStages[gAIScriptPtr[2]] > gAIScriptPtr[3])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 4);
    else
        gAIScriptPtr += 8;
}

void BattleAICmd_if_stat_level_equal(void)
{
    u32 party;

    if(gAIScriptPtr[1] == USER)
        party = gUnknown_02024C07;
    else
        party = gUnknown_02024C08;
    
    if(gBattleMons[party].statStages[gAIScriptPtr[2]] == gAIScriptPtr[3])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 4);
    else
        gAIScriptPtr += 8;
}

void BattleAICmd_if_stat_level_not_equal(void)
{
    u32 party;

    if(gAIScriptPtr[1] == USER)
        party = gUnknown_02024C07;
    else
        party = gUnknown_02024C08;
    
    if(gBattleMons[party].statStages[gAIScriptPtr[2]] != gAIScriptPtr[3])
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 4);
    else
        gAIScriptPtr += 8;
}

void BattleAICmd_if_can_faint(void)
{
    if(gBattleMoves[gAIThinkingSpace.unk2].power < 2)
    {
        gAIScriptPtr += 5;
        return;
    }
    gUnknown_02024DEC = 0;
    ((struct BattleStruct *)((u8 *)&gAIThinkingSpace - 0x16800))->unk.unk1 = 0;
    ((struct BattleStruct *)((u8 *)&gAIThinkingSpace - 0x16800))->unk.unk4 = 1;
    gUnknown_02024C68 = 0;
    gCritMultiplier = 1;
    gUnknown_02024BE6 = gAIThinkingSpace.unk2;
    sub_801CAF8(gUnknown_02024C07, gUnknown_02024C08);
    move_effectiveness_something(gUnknown_02024BE6, gUnknown_02024C07, gUnknown_02024C08);
    
    gUnknown_02024BEC = gUnknown_02024BEC * gAIThinkingSpace.unk18[gAIThinkingSpace.moveConsidered] / 100;
    
    // moves always do at least 1 damage.
    if(gUnknown_02024BEC == 0)
        gUnknown_02024BEC = 1;
    
    if(gBattleMons[gUnknown_02024C08].hp <= gUnknown_02024BEC)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void BattleAICmd_if_cant_faint(void)
{
    if(gBattleMoves[gAIThinkingSpace.unk2].power < 2)
    {
        gAIScriptPtr += 5;
        return;
    }

    gUnknown_02024DEC = 0;
    ((struct BattleStruct *)((u8 *)&gAIThinkingSpace - 0x16800))->unk.unk1 = 0;
    ((struct BattleStruct *)((u8 *)&gAIThinkingSpace - 0x16800))->unk.unk4 = 1;
    gUnknown_02024C68 = 0;
    gCritMultiplier = 1;
    gUnknown_02024BE6 = gAIThinkingSpace.unk2;
    sub_801CAF8(gUnknown_02024C07, gUnknown_02024C08);
    move_effectiveness_something(gUnknown_02024BE6, gUnknown_02024C07, gUnknown_02024C08);
    
    gUnknown_02024BEC = gUnknown_02024BEC * gAIThinkingSpace.unk18[gAIThinkingSpace.moveConsidered] / 100;

    // this macro is missing the damage 0 = 1 assumption.

    if(gBattleMons[gUnknown_02024C08].hp > gUnknown_02024BEC)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void BattleAICmd_unk_3F(void)
{
    int i;
    u16 *temp_ptr = (u16 *)(gAIScriptPtr + 2);
    
    switch(gAIScriptPtr[1])
    {
        case 1:
        case 3:
            for(i = 0; i < 4; i++)
            {
                if(gBattleMons[gUnknown_02024C07].moves[i] == *temp_ptr)
                    break;
            }
            if(i == 4)
            {
                gAIScriptPtr += 8;
                return;
            }
            else
            {
                gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 4);
                return;
            }
        case 0:
        case 2:
            for(i = 0; i < 8; i++)
            {
                if(unk_2016A00.unk0[gUnknown_02024C08 >> 1][i] == *temp_ptr)
                    break;
            }
            if(i == 8)
            {
                gAIScriptPtr += 8;
                return;
            }
            else
            {
                gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 4);
                return;
            }
    }
}

void BattleAICmd_unk_40(void)
{
    int i;
    u16 *temp_ptr = (u16 *)(gAIScriptPtr + 2);
    
    switch(gAIScriptPtr[1])
    {
        case 1:
        case 3:
            for(i = 0; i < 4; i++)
            {
                if(gBattleMons[gUnknown_02024C07].moves[i] == *temp_ptr)
                    break;
            }
            if(i != 4)
            {
                gAIScriptPtr += 8;
                return;
            }
            else
            {
                gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 4);
                return;
            }
        case 0:
        case 2:
            for(i = 0; i < 8; i++)
            {
                if(unk_2016A00.unk0[gUnknown_02024C08 >> 1][i] == *temp_ptr)
                    break;
            }
            if(i != 8)
            {
                gAIScriptPtr += 8;
                return;
            }
            else
            {
                gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 4);
                return;
            }
    }
}

void BattleAICmd_if_move_effect(void)
{
    int i;
    
    switch(gAIScriptPtr[1])
    {
        case 1:
        case 3:
            for(i = 0; i < 4; i++)
            {
                if(gBattleMons[gUnknown_02024C07].moves[i] != 0 && gBattleMoves[gBattleMons[gUnknown_02024C07].moves[i]].effect == gAIScriptPtr[2])
                    break;
            }
            if(i != 4)
                gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
            else
                gAIScriptPtr += 7;
            break;
        case 0:
        case 2:
            for(i = 0; i < 8; i++)
            {
                if(gBattleMons[gUnknown_02024C07].moves[i] != 0 && gBattleMoves[unk_2016A00.unk0[gUnknown_02024C08 >> 1][i]].effect == gAIScriptPtr[2])
                    break;
            }
            gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
    }
}

void BattleAICmd_if_not_move_effect(void)
{
    int i;
    
    switch(gAIScriptPtr[1])
    {
        case 1:
        case 3:
            for(i = 0; i < 4; i++)
            {
                if(gBattleMons[gUnknown_02024C07].moves[i] != 0 && gBattleMoves[gBattleMons[gUnknown_02024C07].moves[i]].effect == gAIScriptPtr[2])
                    break;
            }
            if(i != 4)
                gAIScriptPtr += 7;
            else
                gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
            break;
        case 0:
        case 2:
            for(i = 0; i < 8; i++)
            {
                if(unk_2016A00.unk0[gUnknown_02024C08 >> 1][i] != 0 && gBattleMoves[unk_2016A00.unk0[gUnknown_02024C08 >> 1][i]].effect == gAIScriptPtr[2])
                    break;
            }
            gAIScriptPtr += 7;
    }
}

void BattleAICmd_if_last_move_did_damage(void)
{
    u8 var;
    
    if(gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;
    
    if(gAIScriptPtr[2] == 0)
    {
        if(gUnknown_02024CA8[var].unk4 == 0)
        {
            gAIScriptPtr += 7;
            return;
        }
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
        return;
    }
    else if(gAIScriptPtr[2] != 1)
    {
        gAIScriptPtr += 7;
        return;
    }
    else if(gUnknown_02024CA8[var].unk6 != 0)
    {
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 3);
        return;
    }
    gAIScriptPtr += 7;
}

void BattleAICmd_if_encored(void)
{
    switch(gAIScriptPtr[1])
    {
        case 0: // _08109348
            if(gUnknown_02024CA8[gUnknown_02024A60].unk4 == gAIThinkingSpace.unk2)
            {
                gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
                return;
            }
            gAIScriptPtr += 6;
            return;
        case 1: // _08109370
            if(gUnknown_02024CA8[gUnknown_02024A60].unk6 == gAIThinkingSpace.unk2)
            {
                gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
                return;
            }
            gAIScriptPtr += 6;
            return;
        default:
            gAIScriptPtr += 6;
            return;
    }
}

void BattleAICmd_unk_45(void)
{
    gAIThinkingSpace.unk10 |= 0xB;
}

void BattleAICmd_if_random_2(void)
{
    u8 var = battle_2000000.unk88 * 5;
    
    if((u8)(Random() % 100) < var)
        gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 1);
    else
        gAIScriptPtr += 5;
}

void BattleAICmd_unk_47(void)
{
    gAIThinkingSpace.unk10 |= 0xD;
}

void BattleAICmd_get_hold_effect(void)
{
    u8 var;
    u16 status;
    u8 *aiPtr;
    
    if(gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;
    
    if(battle_side_get_owner(var) == 0)
    {
        // weird pointer arithmetic is needed to match.
        status = (battle_get_per_side_status(var) & 1);
        aiPtr = (u8 *)&gAIThinkingSpace;
        gAIThinkingSpace.funcResult = ((struct UnknownStruct1 *)((u8 *)aiPtr + 0x202))->unk20[status];
    }
    else
        gAIThinkingSpace.funcResult = ItemId_GetHoldEffect(gBattleMons[var].item);
    
    gAIScriptPtr += 2;
}

void BattleAICmd_get_gender(void)
{
    u8 var;
    
    if(gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;
    
    gAIThinkingSpace.funcResult = GetGenderFromSpeciesAndPersonality(gBattleMons[var].species, gBattleMons[var].personality);
    
    gAIScriptPtr += 2;
}

void BattleAICmd_is_first_turn(void)
{
    u8 var;

    if(gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;
    
    gAIThinkingSpace.funcResult = gUnknown_02024CA8[var].unk16;
    
    gAIScriptPtr += 2;
}

void BattleAICmd_get_stockpile_count(void)
{
    u8 var;

    if(gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;
    
    gAIThinkingSpace.funcResult = gUnknown_02024CA8[var].unk9;
    
    gAIScriptPtr += 2;
}

void BattleAICmd_unk_4C(void)
{
    gAIThinkingSpace.funcResult = gBattleTypeFlags & 1;
    
    gAIScriptPtr += 1;
}

// needed to match the hack that is get_item, thanks cam
extern u8 unk_2000000[];

#define AI_THINKING_STRUCT ((struct AI_ThinkingStruct *)(unk_2000000 + 0x16800))

void BattleAICmd_get_item(void)
{
    u8 var;
    
    if (gAIScriptPtr[1] == USER)
        var = gUnknown_02024C07;
    else
        var = gUnknown_02024C08;
   
    // this hack and a half matches. whatever. i dont care. someone else fix this mess later.
    AI_THINKING_STRUCT->funcResult = unk_2000000[0x160CC + var * 2];
    
    gAIScriptPtr += 2;
}
