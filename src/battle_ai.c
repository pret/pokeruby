#include "global.h"
#include "battle.h"
#include "asm.h"
#include "pokemon.h"
#include "rng.h"
#include "abilities.h"

#define AIScriptRead32(ptr) ((ptr)[0] | (ptr)[1] << 8 | (ptr)[2] << 16 | (ptr)[3] << 24)
#define AIScriptRead16(ptr) ((ptr)[0] | (ptr)[1] << 8)
#define AIScriptRead8(ptr) ((ptr)[0])
#define AIScriptReadPtr(ptr) (u8*) AIScriptRead32(ptr)

enum
{
	TARGET,
	USER
};

extern void move_effectiveness_something(u16, u8, u8);

extern u16 gBattleTypeFlags;
extern u8 gUnknown_02024A60;
extern u16 gUnknown_02024BE6;
extern u32 gUnknown_02024BEC;
extern u8 gUnknown_02024C07; // something player?
extern u8 gUnknown_02024C08; // something opponent?
extern u8 gUnknown_02024C0C; 
extern u8 gUnknown_02024C68;
extern u16 gUnknown_02024DEC;
extern u16 gUnknown_02024C34[];
extern u32 gUnknown_02024ACC[];
extern u32 gUnknown_02024C98[];
extern u16 gUnknown_02024C7A[];
extern struct BattlePokemon gUnknown_02024A8C[];
extern u8 gUnknown_030042E0[];
extern u8 gCritMultiplier;
extern u16 gTrainerBattleOpponent;
extern u32 gBitTable[];
extern u8 *BattleAIs[];
extern struct Trainer gTrainers[];
extern struct BattlePokemon gBattleMons[];
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

struct AI_ThinkingStruct /* 0x2016800 */
{
/* 0x00 */ u8 unk0;
/* 0x01 */ u8 moveConsidered;
/* 0x02 */ u16 unk2;
/* 0x04 */ s8 score[4]; // score?
/* 0x08 */ u32 unk8;
/* 0x0C */ u32 aiFlags;
/* 0x10 */ u8 unk10;
/* 0x11 */ u8 aiLogicId;
/* 0x12 */ u8 filler12[6];
/* 0x18 */ u8 unk18[4];
};

struct UnknownStruct3
{
    u8 filler0[0x20];
    u8 unk20;
};

struct SmallBattleStruct1
{
	u8 unk1;
	u8 unk2;
	u8 unk3;
	u8 unk4;
};

struct BattleStruct /* 0x2000000 */
{
	u8 filler0[0x1601C];
	struct SmallBattleStruct1 unk;
	u8 filler1[0x7E0]; // 0x2016020
	struct AI_ThinkingStruct ai;
};

extern struct BattleStruct unk_2000000;
extern struct AI_ThinkingStruct gAIThinkingSpace;
extern struct UnknownStruct1 unk_2016A00;
extern struct UnknownStruct3 unk_2016C00;

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
	if (gAIThinkingSpace.unk8 < gAIScriptPtr[1])
		gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_more_than(void)
{
	if (gAIThinkingSpace.unk8 > gAIScriptPtr[1])
		gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_equal(void)
{
	if (gAIThinkingSpace.unk8 == gAIScriptPtr[1])
		gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_not_equal(void)
{
	if (gAIThinkingSpace.unk8 != gAIScriptPtr[1])
		gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_less_than_32(void)
{
	u8 *temp = AIScriptReadPtr(gAIScriptPtr + 1);

	if (gAIThinkingSpace.unk8 < *temp)
		gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
	else
		gAIScriptPtr += 9;
}

void BattleAICmd_if_more_than_32(void)
{
	u8 *temp = AIScriptReadPtr(gAIScriptPtr + 1);

	if (gAIThinkingSpace.unk8 > *temp)
		gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
	else
		gAIScriptPtr += 9;
}

void BattleAICmd_if_equal_32(void)
{
	u8 *temp = AIScriptReadPtr(gAIScriptPtr + 1);

	if (gAIThinkingSpace.unk8 == *temp)
		gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 5);
	else
		gAIScriptPtr += 9;
}

void BattleAICmd_if_not_equal_32(void)
{
	u8 *temp = AIScriptReadPtr(gAIScriptPtr + 1);

	if (gAIThinkingSpace.unk8 != *temp)
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
       if(gAIThinkingSpace.unk8 == *ptr)
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
       if(gAIThinkingSpace.unk8 == *ptr)
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
       if(gAIThinkingSpace.unk8 == *ptr)
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
       if(gAIThinkingSpace.unk8 == *ptr)
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
	gAIThinkingSpace.unk8 = gUnknown_030042E0[19];
	gAIScriptPtr += 1;
}

void BattleAICmd_get_type(void)
{
	u8 typeVar = gAIScriptPtr[1];

	switch(typeVar)
	{
		case 1:
			gAIThinkingSpace.unk8 = gBattleMons[gUnknown_02024C07].type1;
			break;
		case 0:
			gAIThinkingSpace.unk8 = gBattleMons[gUnknown_02024C08].type1;
			break;
		case 3:
			gAIThinkingSpace.unk8 = gBattleMons[gUnknown_02024C07].type2;
			break;
		case 2:
			gAIThinkingSpace.unk8 = gBattleMons[gUnknown_02024C08].type2;
			break;
		case 4:
			gAIThinkingSpace.unk8 = gBattleMoves[gAIThinkingSpace.unk2].type;
			break;
	}
	gAIScriptPtr += 2;
}

void BattleAICmd_unk_23(void)
{
	gAIThinkingSpace.unk8 = gBattleMoves[gAIThinkingSpace.unk2].power;
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
		gAIThinkingSpace.unk8 = gUnknown_02024C34[gUnknown_02024C07];
	else
		gAIThinkingSpace.unk8 = gUnknown_02024C34[gUnknown_02024C08];

	gAIScriptPtr += 2;
}

void BattleAICmd_if_type(void)
{
	if ( gAIScriptPtr[1] == gAIThinkingSpace.unk8 )
		gAIScriptPtr = AIScriptReadPtr(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_unk_27(void) // if_not_type
{
	if ( gAIScriptPtr[1] != gAIThinkingSpace.unk8 )
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

__attribute__((naked))
void BattleAICmd_count_alive_pokemon(void)
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	ldr r1, _08108550 @ =0x02016800\n\
	movs r0, 0\n\
	str r0, [r1, 0x8]\n\
	ldr r0, _08108554 @ =gAIScriptPtr\n\
	ldr r0, [r0]\n\
	ldrb r0, [r0, 0x1]\n\
	cmp r0, 0x1\n\
	bne _0810855C\n\
	ldr r0, _08108558 @ =gUnknown_02024C07\n\
	b _0810855E\n\
	.align 2, 0\n\
_08108550: .4byte 0x02016800\n\
_08108554: .4byte gAIScriptPtr\n\
_08108558: .4byte gUnknown_02024C07\n\
_0810855C:\n\
	ldr r0, _081085A8 @ =gUnknown_02024C08\n\
_0810855E:\n\
	ldrb r5, [r0]\n\
	adds r0, r5, 0\n\
	bl battle_side_get_owner\n\
	lsls r0, 24\n\
	ldr r1, _081085AC @ =gEnemyParty\n\
	mov r9, r1\n\
	cmp r0, 0\n\
	bne _08108574\n\
	ldr r0, _081085B0 @ =gPlayerParty\n\
	mov r9, r0\n\
_08108574:\n\
	ldr r0, _081085B4 @ =gBattleTypeFlags\n\
	ldrh r1, [r0]\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _081085BC\n\
	ldr r4, _081085B8 @ =gUnknown_02024A6A\n\
	lsls r0, r5, 1\n\
	adds r0, r4\n\
	ldrb r0, [r0]\n\
	mov r8, r0\n\
	adds r0, r5, 0\n\
	bl battle_get_per_side_status\n\
	movs r1, 0x2\n\
	eors r0, r1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	bl battle_get_side_with_given_state\n\
	lsls r0, 24\n\
	lsrs r0, 23\n\
	adds r0, r4\n\
	ldrb r6, [r0]\n\
	b _081085C6\n\
	.align 2, 0\n\
_081085A8: .4byte gUnknown_02024C08\n\
_081085AC: .4byte gEnemyParty\n\
_081085B0: .4byte gPlayerParty\n\
_081085B4: .4byte gBattleTypeFlags\n\
_081085B8: .4byte gUnknown_02024A6A\n\
_081085BC:\n\
	ldr r1, _08108624 @ =gUnknown_02024A6A\n\
	lsls r0, r5, 1\n\
	adds r0, r1\n\
	ldrb r6, [r0]\n\
	mov r8, r6\n\
_081085C6:\n\
	movs r5, 0\n\
	ldr r7, _08108628 @ =0x02016800\n\
_081085CA:\n\
	cmp r5, r8\n\
	beq _08108608\n\
	cmp r5, r6\n\
	beq _08108608\n\
	movs r0, 0x64\n\
	muls r0, r5\n\
	mov r1, r9\n\
	adds r4, r1, r0\n\
	adds r0, r4, 0\n\
	movs r1, 0x39\n\
	bl GetMonData\n\
	cmp r0, 0\n\
	beq _08108608\n\
	adds r0, r4, 0\n\
	movs r1, 0x41\n\
	bl GetMonData\n\
	cmp r0, 0\n\
	beq _08108608\n\
	adds r0, r4, 0\n\
	movs r1, 0x41\n\
	bl GetMonData\n\
	movs r1, 0xCE\n\
	lsls r1, 1\n\
	cmp r0, r1\n\
	beq _08108608\n\
	ldr r0, [r7, 0x8]\n\
	adds r0, 0x1\n\
	str r0, [r7, 0x8]\n\
_08108608:\n\
	adds r5, 0x1\n\
	cmp r5, 0x5\n\
	ble _081085CA\n\
	ldr r1, _0810862C @ =gAIScriptPtr\n\
	ldr r0, [r1]\n\
	adds r0, 0x2\n\
	str r0, [r1]\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08108624: .4byte gUnknown_02024A6A\n\
_08108628: .4byte 0x02016800\n\
_0810862C: .4byte gAIScriptPtr\n\
	.syntax divided");
}

void BattleAICmd_unk_2D(void)
{
	gAIThinkingSpace.unk8 = gAIThinkingSpace.unk2;
	gAIScriptPtr += 1;
}

void BattleAICmd_unk_2E(void)
{
	gAIThinkingSpace.unk8 = gBattleMoves[gAIThinkingSpace.unk2].effect;
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
            ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 512))->unk8 = unk_2016A00.unk20[unk];
            gAIScriptPtr += 2;
            return;
        }

        // abilities that prevent fleeing.
        if(gBattleMons[var].ability == ABILITY_SHADOW_TAG || gBattleMons[var].ability == ABILITY_MAGNET_PULL || gBattleMons[var].ability == ABILITY_ARENA_TRAP)
        {
            gAIThinkingSpace.unk8 = gBattleMons[var].ability;
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
                    ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->unk8 = gBaseStats[gBattleMons[var].species].ability1;
                    gAIScriptPtr += 2;
                    return;
                }
                else
                {
                    ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->unk8 = gBaseStats[gBattleMons[var].species].ability2;
                    gAIScriptPtr += 2;
                    return;
                }
            }
            else
            {
                ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->unk8 = gBaseStats[gBattleMons[var].species].ability1; // it's definitely ability 1.
                gAIScriptPtr += 2;
                return;
            }
        }
        else
        {
            ((struct AI_ThinkingStruct *)((u8 *)&unk_2016A00 - 0x200))->unk8 = gBaseStats[gBattleMons[var].species].ability2; // AI cant actually reach this part since every mon has at least 1 ability.
            gAIScriptPtr += 2;
            return;
        }
    }
    else
    {
        // The AI knows its own ability.
        gAIThinkingSpace.unk8 = gBattleMons[var].ability;
        gAIScriptPtr += 2;
        return;
    }
}

#ifdef NONMATCHING
void BattleAICmd_unk_30(void)
{
	s32 i;
    
	gUnknown_02024DEC = 0;
    unk_2000000.unk.unk1 = 0;
    unk_2000000.unk.unk4 = 1;
	gUnknown_02024C68 = 0;
	gCritMultiplier = 1;
	unk_2000000.ai.unk0 = 0;
	
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
			
			if (unk_2000000.ai.unk0 < gUnknown_02024BEC)
				unk_2000000.ai.unk0 = gUnknown_02024BEC;
		}
	}
	gAIScriptPtr += 1;
}
#else
__attribute__((naked))
void BattleAICmd_unk_30(void)
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r8\n\
	push {r7}\n\
	ldr r0, _0810885C @ =gUnknown_02024DEC\n\
	movs r2, 0\n\
	strh r2, [r0]\n\
	ldr r1, _08108860 @ =0x02000000\n\
	ldr r3, _08108864 @ =0x0001601c\n\
	adds r0, r1, r3\n\
	movs r4, 0\n\
	strb r2, [r0]\n\
	adds r3, 0x3\n\
	adds r0, r1, r3\n\
	movs r3, 0x1\n\
	strb r3, [r0]\n\
	ldr r0, _08108868 @ =gUnknown_02024C68\n\
	strb r2, [r0]\n\
	ldr r0, _0810886C @ =gCritMultiplier\n\
	strb r3, [r0]\n\
	movs r0, 0xB4\n\
	lsls r0, 9\n\
	adds r1, r0\n\
	str r4, [r1, 0x8]\n\
	movs r5, 0\n\
	ldr r4, _08108870 @ =gUnknown_02024BEC\n\
	ldr r7, _08108874 @ =gUnknown_02024BE6\n\
	ldr r3, _08108878 @ =gUnknown_02024A8C\n\
	mov r8, r3\n\
	ldr r6, _0810887C @ =gUnknown_02024C07\n\
_081087DA:\n\
	movs r0, 0x28\n\
	str r0, [r4]\n\
	lsls r1, r5, 1\n\
	ldrb r2, [r6]\n\
	movs r0, 0x58\n\
	muls r0, r2\n\
	adds r1, r0\n\
	add r1, r8\n\
	ldrh r0, [r1]\n\
	strh r0, [r7]\n\
	lsls r0, 16\n\
	cmp r0, 0\n\
	beq _08108844\n\
	ldrh r0, [r7]\n\
	ldrb r1, [r6]\n\
	ldr r2, _08108880 @ =gUnknown_02024C08\n\
	ldrb r2, [r2]\n\
	bl move_effectiveness_something\n\
	ldr r0, [r4]\n\
	cmp r0, 0x78\n\
	bne _0810880A\n\
	movs r0, 0x50\n\
	str r0, [r4]\n\
_0810880A:\n\
	ldr r0, [r4]\n\
	cmp r0, 0xF0\n\
	bne _08108814\n\
	movs r0, 0xA0\n\
	str r0, [r4]\n\
_08108814:\n\
	ldr r0, [r4]\n\
	cmp r0, 0x1E\n\
	bne _0810881E\n\
	movs r0, 0x14\n\
	str r0, [r4]\n\
_0810881E:\n\
	ldr r0, [r4]\n\
	cmp r0, 0xF\n\
	bne _08108828\n\
	movs r0, 0xA\n\
	str r0, [r4]\n\
_08108828:\n\
	ldr r0, _08108868 @ =gUnknown_02024C68\n\
	ldrb r1, [r0]\n\
	movs r0, 0x8\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08108838\n\
	movs r0, 0\n\
	str r0, [r4]\n\
_08108838:\n\
	ldr r2, _08108884 @ =0x02016800\n\
	ldr r0, [r2, 0x8]\n\
	ldr r1, [r4]\n\
	cmp r0, r1\n\
	bcs _08108844\n\
	str r1, [r2, 0x8]\n\
_08108844:\n\
	adds r5, 0x1\n\
	cmp r5, 0x3\n\
	ble _081087DA\n\
	ldr r1, _08108888 @ =gAIScriptPtr\n\
	ldr r0, [r1]\n\
	adds r0, 0x1\n\
	str r0, [r1]\n\
	pop {r3}\n\
	mov r8, r3\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_0810885C: .4byte gUnknown_02024DEC\n\
_08108860: .4byte 0x02000000\n\
_08108864: .4byte 0x0001601c\n\
_08108868: .4byte gUnknown_02024C68\n\
_0810886C: .4byte gCritMultiplier\n\
_08108870: .4byte gUnknown_02024BEC\n\
_08108874: .4byte gUnknown_02024BE6\n\
_08108878: .4byte gUnknown_02024A8C\n\
_0810887C: .4byte gUnknown_02024C07\n\
_08108880: .4byte gUnknown_02024C08\n\
_08108884: .4byte 0x02016800\n\
_08108888: .4byte gAIScriptPtr\n\
	.syntax divided\n");
}
#endif

// same function as above but no for loop.
__attribute__((naked))
void BattleAICmd_if_damage_bonus(void)
{
	asm(".syntax unified\n\
	push {r4,r5,lr}\n\
	ldr r0, _08108928 @ =gUnknown_02024DEC\n\
	movs r1, 0\n\
	strh r1, [r0]\n\
	ldr r2, _0810892C @ =0x02000000\n\
	ldr r3, _08108930 @ =0x0001601c\n\
	adds r0, r2, r3\n\
	strb r1, [r0]\n\
	adds r3, 0x3\n\
	adds r0, r2, r3\n\
	movs r3, 0x1\n\
	strb r3, [r0]\n\
	ldr r5, _08108934 @ =gUnknown_02024C68\n\
	strb r1, [r5]\n\
	ldr r0, _08108938 @ =gCritMultiplier\n\
	strb r3, [r0]\n\
	ldr r4, _0810893C @ =gUnknown_02024BEC\n\
	movs r0, 0x28\n\
	str r0, [r4]\n\
	ldr r1, _08108940 @ =gUnknown_02024BE6\n\
	movs r0, 0xB4\n\
	lsls r0, 9\n\
	adds r2, r0\n\
	ldrh r0, [r2, 0x2]\n\
	strh r0, [r1]\n\
	ldrh r0, [r1]\n\
	ldr r1, _08108944 @ =gUnknown_02024C07\n\
	ldrb r1, [r1]\n\
	ldr r2, _08108948 @ =gUnknown_02024C08\n\
	ldrb r2, [r2]\n\
	bl move_effectiveness_something\n\
	ldr r0, [r4]\n\
	cmp r0, 0x78\n\
	bne _081088D6\n\
	movs r0, 0x50\n\
	str r0, [r4]\n\
_081088D6:\n\
	ldr r0, [r4]\n\
	cmp r0, 0xF0\n\
	bne _081088E0\n\
	movs r0, 0xA0\n\
	str r0, [r4]\n\
_081088E0:\n\
	ldr r0, [r4]\n\
	cmp r0, 0x1E\n\
	bne _081088EA\n\
	movs r0, 0x14\n\
	str r0, [r4]\n\
_081088EA:\n\
	ldr r0, [r4]\n\
	cmp r0, 0xF\n\
	bne _081088F4\n\
	movs r0, 0xA\n\
	str r0, [r4]\n\
_081088F4:\n\
	ldrb r1, [r5]\n\
	movs r0, 0x8\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _08108902\n\
	movs r0, 0\n\
	str r0, [r4]\n\
_08108902:\n\
	ldrb r0, [r4]\n\
	ldr r3, _0810894C @ =gAIScriptPtr\n\
	ldr r2, [r3]\n\
	ldrb r1, [r2, 0x1]\n\
	cmp r0, r1\n\
	bne _08108950\n\
	ldrb r1, [r2, 0x2]\n\
	ldrb r0, [r2, 0x3]\n\
	lsls r0, 8\n\
	orrs r1, r0\n\
	ldrb r0, [r2, 0x4]\n\
	lsls r0, 16\n\
	orrs r1, r0\n\
	ldrb r0, [r2, 0x5]\n\
	lsls r0, 24\n\
	orrs r1, r0\n\
	str r1, [r3]\n\
	b _08108954\n\
	.align 2, 0\n\
_08108928: .4byte gUnknown_02024DEC\n\
_0810892C: .4byte 0x02000000\n\
_08108930: .4byte 0x0001601c\n\
_08108934: .4byte gUnknown_02024C68\n\
_08108938: .4byte gCritMultiplier\n\
_0810893C: .4byte gUnknown_02024BEC\n\
_08108940: .4byte gUnknown_02024BE6\n\
_08108944: .4byte gUnknown_02024C07\n\
_08108948: .4byte gUnknown_02024C08\n\
_0810894C: .4byte gAIScriptPtr\n\
_08108950:\n\
	adds r0, r2, 0x6\n\
	str r0, [r3]\n\
_08108954:\n\
	pop {r4,r5}\n\
	pop {r0}\n\
	bx r0\n\
	.syntax divided\n");
}

void BattleAICmd_unk_32(void)
{}

void BattleAICmd_unk_33(void)
{}
