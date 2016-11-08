#include "global.h"
#include "battle.h"
#include "pokemon.h"
#include "rng.h"

#define AIScriptRead32(ptr) ((ptr)[0] | (ptr)[1] << 8 | (ptr)[2] << 16 | (ptr)[3] << 24)
#define AIScriptRead16(ptr) ((ptr)[0] | (ptr)[1] << 8)
#define AIScriptRead8(ptr) ((ptr)[0])

extern u8 sub_8015A98(u8, u8, u8);
extern u8 battle_side_get_owner(u8);
extern u32 battle_get_per_side_status(u8);

extern u16 gUnknown_020239F8;
extern u8 gUnknown_02024A60;
extern u8 gUnknown_02024C07; 
extern u8 gUnknown_02024C08;
extern u8 gUnknown_02024C0C;
extern u16 gUnknown_02024C34[];
extern u32 gUnknown_02024ACC[];
extern u32 gUnknown_02024C98[];
extern u16 gUnknown_02024C7A[];
extern u16 gUnknown_02024A8C[];
extern u8 gUnknown_030042E0[];
extern u8 *gAIScriptPtr;
extern u16 gTrainerBattleOpponent;
extern struct Trainer gTrainers[];
extern u32 gBitTable[];
extern u8 *BattleAIs[];
extern struct BattlePokemon gBattleMons[];
extern struct BattleMove gBattleMoves[];
extern void (*gBattleAICmdTable[])(void);

struct UnknownStruct1
{
    u16 unk0[2][8];
    u8 unk20[2];
    u8 unk22[2];
    u16 items[4];
    u8 unk8;
};

struct UnknownStruct2 /* 0x2016800 */
{
/* 0x00 */ u8 unk0;
/* 0x01 */ u8 moveConsidered;
/* 0x02 */ u16 unk2;
/* 0x04 */ s8 score[4]; // score?
/* 0x08 */ u32 unk8;
/* 0x0C */ u32 aiFlags;
/* 0x10 */ u8 unk10;
/* 0x11 */ u8 unk11;
/* 0x12 */ u8 filler12[6];
/* 0x18 */ u8 unk18[4];
};

struct UnknownStruct3
{
    u8 filler0[0x20];
    u8 unk20;
};

extern struct UnknownStruct2 unk_2016800;
extern struct UnknownStruct1 unk_2016A00;
extern struct UnknownStruct3 unk_2016C00;

void sub_810715C(void);
void sub_8107374(void);
void sub_810745C(void);

void sub_81070D4(void)
{
    s32 i;
    u8 *data = (u8 *)&unk_2016A00;
    
    for(i = 0; (u32)i < 48; i++)
        data[i] = 0;
    if((gUnknown_020239F8 & 8) && gTrainerBattleOpponent != 0x400 && !(gUnknown_020239F8 & 0x982))
    {
        for(i = 0; i < 4; i++)
        {
            if(gTrainers[gTrainerBattleOpponent].items[i] != 0)
            {
                unk_2016A00.items[unk_2016A00.unk8] = gTrainers[gTrainerBattleOpponent].items[i];
                unk_2016A00.unk8++;
            }
        }
    }
    sub_810715C();
}

void sub_810715C(void)
{
    s32 i;
    u8 *data = (u8 *)&unk_2016800;
    u8 r7;
    
    for(i = 0; (u32)i < 28; i++)
        data[i] = 0;
    for(i = 0; i < 4; i++)
        unk_2016800.score[i] = 100;
    r7 = sub_8015A98(gUnknown_02024A60, 0, 0xFF);
    for(i = 0; i < 4; i++)
    {
        u16 rand;
        
        if(gBitTable[i] & r7)
            unk_2016800.score[i] = 0;
        rand = Random();
        unk_2016800.unk18[i] = 100 - (rand & 0xF);
    }
    unk_2016C00.unk20 = 0;
    gUnknown_02024C07 = gUnknown_02024A60;
    
    if(gUnknown_020239F8 & 1)
    {
        gUnknown_02024C08 = Random() & 2;
        
        if(gUnknown_02024C0C & gBitTable[gUnknown_02024C08])
            gUnknown_02024C08 ^= 2;
    }
    else
        gUnknown_02024C08 = gUnknown_02024A60 ^ 1;
    
    if(gUnknown_020239F8 & 0x80)
        unk_2016800.aiFlags = 0x40000000;
    else if(gUnknown_020239F8 & 0x400)
        unk_2016800.aiFlags = 0x20000000;
    else if(gUnknown_020239F8 & 0x10)
        unk_2016800.aiFlags = 0x80000000;
    else
        unk_2016800.aiFlags = gTrainers[gTrainerBattleOpponent].aiFlags;
}

u8 sub_81072A8(void)
{
    u8 arr1[4];
    u8 arr2[4];
    u8 r5;
    s32 i;
    
    sub_810745C();
    while(unk_2016800.aiFlags != 0)
    {
        if(unk_2016800.aiFlags & 1)
        {
            unk_2016800.unk0 = 0;
            sub_8107374();
        }
        unk_2016800.aiFlags >>= 1;
        unk_2016800.unk11++;
        unk_2016800.moveConsidered = 0;
    }
    if(unk_2016800.unk10 & 2)
        return 4;
    if(unk_2016800.unk10 & 4)
        return 5;
    r5 = 1;
    arr1[0] = unk_2016800.score[0];
    arr2[0] = 0;
    for(i = 1; i < 4; i++)
    {
        if(arr1[0] < (s8)unk_2016800.score[i])
        {
            r5 = 1;
            arr1[0] = unk_2016800.score[i];
            arr2[0] = i;
        }
        if(arr1[0] == (s8)unk_2016800.score[i])
        {
            arr1[r5] = unk_2016800.score[i];
            arr2[r5++] = i;
        }
    }
    return arr2[Random() % r5];
}

void sub_8107374(void)
{
    while(unk_2016800.unk0 != 2)
    {
        switch(unk_2016800.unk0)
        {
        case 3: //Needed to match.
            break;
        case 0:
            gAIScriptPtr = BattleAIs[unk_2016800.unk11];
            if(gBattleMons[gUnknown_02024C07].pp[unk_2016800.moveConsidered] == 0)
            {
                unk_2016800.unk2 = 0;
            }
            else
            {
                unk_2016800.unk2 = gBattleMons[gUnknown_02024C07].moves[unk_2016800.moveConsidered];
            }
            unk_2016800.unk0++;
            break;
        case 1:
            if(unk_2016800.unk2 != 0)
                gBattleAICmdTable[*(u8 *)gAIScriptPtr]();  //weird...
            else
            {
                unk_2016800.score[unk_2016800.moveConsidered] = 0;
                unk_2016800.unk10 |= 1;
            }
            if(unk_2016800.unk10 & 1)
            {
                unk_2016800.moveConsidered++;
                if(unk_2016800.moveConsidered < 4 && !(unk_2016800.unk10 & 8))
                    unk_2016800.unk0 = 0;
                else
                    unk_2016800.unk0++;
                unk_2016800.unk10 &= 0xFE;
            }
            break;
        }
    }
}

#ifdef NONMATCHING
void sub_810745C(void)
{
    s32 i;
    
    for(i = 0; i < 8; i++)
    {
        if(unk_2016A00.unk0[gUnknown_02024C08 / 2][i] == 0)
        {
            //gUnknown_02024C34[gUnknown_02024C08] += 0;
            unk_2016A00.unk0[gUnknown_02024C08 / 2][i] = gUnknown_02024C34[gUnknown_02024C08];
            return;
        }
    }
}
#else
__attribute__((naked))
void sub_810745C(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    movs r2, 0\n\
    ldr r3, _08107488 @ =gUnknown_02024C08\n\
    ldr r5, _0810748C @ =0x02016a00\n\
    ldr r6, _08107490 @ =gUnknown_02024C34\n\
    adds r4, r3, 0\n\
_08107468:\n\
    lsls r0, r2, 1\n\
    ldrb r1, [r4]\n\
    lsrs r1, 1\n\
    lsls r1, 4\n\
    adds r0, r1\n\
    adds r1, r0, r5\n\
    ldrh r0, [r1]\n\
    cmp r0, 0\n\
    bne _08107494\n\
    ldrb r0, [r3]\n\
    lsls r0, 1\n\
    adds r0, r6\n\
    ldrh r0, [r0]\n\
    strh r0, [r1]\n\
    b _0810749A\n\
    .align 2, 0\n\
_08107488: .4byte gUnknown_02024C08\n\
_0810748C: .4byte 0x02016a00\n\
_08107490: .4byte gUnknown_02024C34\n\
_08107494:\n\
    adds r2, 0x1\n\
    cmp r2, 0x7\n\
    ble _08107468\n\
_0810749A:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided");
}
#endif

void unref_sub_81074A0(u8 a)
{
    s32 i;
    
    for(i = 0; i < 8; i++)
        unk_2016A00.unk0[a / 2][i] = 0;
}

void sub_81074C4(u8 a, u8 b)
{
    if(battle_side_get_owner(a) == 0)
        unk_2016A00.unk20[battle_get_per_side_status(a) % 2] = b;
}

void sub_81074F8(u8 a, u8 b)
{
    if(battle_side_get_owner(a) == 0)
        unk_2016A00.unk22[battle_get_per_side_status(a) % 2] = b;
}

void BattleAICmd_if_random(void)
{
	u16 random = Random();
	
	if (!(random % 256 >= gAIScriptPtr[1])) // roll a random value. is it less than the parameter of the if_random call? (96 on if_random 80 will return true)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;	
}

void BattleAICmd_if_not_random(void)
{
	u16 random = Random();
	
	if (!(random % 256 <= gAIScriptPtr[1])) // roll a random value. is it greater than the parameter of the if_random call? (96 on if_random 80 will return true)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_random_1(void) // if RNG Value equal to
{
	u16 random = Random();
	
	if (random % 256 == gAIScriptPtr[1]) // roll a random value. is it greater than the parameter of the if_random call? (96 on if_random 80 will return true)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_not_random_1(void) // if RNG value not equal to
{
	u16 random = Random();
	
	if (random % 256 != gAIScriptPtr[1]) // roll a random value. is it greater than the parameter of the if_random call? (96 on if_random 80 will return true)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_score(void)
{
	unk_2016800.score[unk_2016800.moveConsidered] += gAIScriptPtr[1]; // add the result to the array of the move consider's score.
	
	if(unk_2016800.score[unk_2016800.moveConsidered] < 0) // if the score is negative, flatten it to 0.
		unk_2016800.score[unk_2016800.moveConsidered] = 0;

	gAIScriptPtr += 2; // AI return.
}

void BattleAICmd_if_hp_less_than(void)
{
	u16 var;
	
	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	if ((u32)(100 * gBattleMons[var].hp / gBattleMons[var].maxHP) < gAIScriptPtr[2])
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 3);
	else
		gAIScriptPtr += 7;
}

void BattleAICmd_if_hp_more_than(void)
{
	u16 var;
	
	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	if ((u32)(100 * gBattleMons[var].hp / gBattleMons[var].maxHP) > gAIScriptPtr[2])
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 3);
	else
		gAIScriptPtr += 7;
}

void BattleAICmd_if_hp_equal(void)
{
	u16 var;
	
	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	if ((u32)(100 * gBattleMons[var].hp / gBattleMons[var].maxHP) == gAIScriptPtr[2])
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 3);
	else
		gAIScriptPtr += 7;
}

void BattleAICmd_if_hp_not_equal(void)
{
	u16 var;
	
	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	if ((u32)(100 * gBattleMons[var].hp / gBattleMons[var].maxHP) != gAIScriptPtr[2])
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 3);
	else
		gAIScriptPtr += 7;
}

void BattleAICmd_if_status(void)
{
	u16 var;
	u32 temp;

	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	temp = AIScriptRead32(gAIScriptPtr + 2);
	
	if (gBattleMons[var].status1 & temp)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 6);
	else
		gAIScriptPtr += 10;
}

void BattleAICmd_if_not_status(void)
{
	u16 var;
	u32 temp;

	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	temp = AIScriptRead32(gAIScriptPtr + 2);
	
	if (!(gBattleMons[var].status1 & temp))
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 6);
	else
		gAIScriptPtr += 10;
}

void BattleAICmd_if_status2(void)
{
	u8 var;
	u32 temp;

	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	temp = AIScriptRead32(gAIScriptPtr + 2);
	
	if (gBattleMons[var].status2 & temp)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 6);
	else
		gAIScriptPtr += 10;
}

void BattleAICmd_if_not_status2(void)
{
	u8 var;
	u32 temp;

	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	temp = AIScriptRead32(gAIScriptPtr + 2);
	
	if (!(gBattleMons[var].status2 & temp))
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 6);
	else
		gAIScriptPtr += 10;
}

void BattleAICmd_if_status3(void)
{
	u8 var;
	u32 temp;
	
	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	temp = AIScriptRead32(gAIScriptPtr + 2);
	
	if ( gUnknown_02024C98[var] & temp )
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 6);
	else
		gAIScriptPtr += 10;
}

void BattleAICmd_if_not_status3(void)
{
	u8 var;
	u32 temp;
	
	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	temp = AIScriptRead32(gAIScriptPtr + 2);
	
	if (!(gUnknown_02024C98[var] & temp))
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 6);
	else
		gAIScriptPtr += 10;
}

void BattleAICmd_if_status4(void)
{
	u8 var;
	u32 temp;
	u32 temp2;
	
	if ( gAIScriptPtr[1] == 1 )
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	temp = battle_get_per_side_status(var) & 1;
	temp2 = AIScriptRead32(gAIScriptPtr + 2);
	
	if ( gUnknown_02024C7A[temp] & temp2 )
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 6);
	else
		gAIScriptPtr += 10;
}

void BattleAICmd_if_not_status4(void)
{
	u8 var;
	u32 temp;
	u32 temp2;
	
	if (gAIScriptPtr[1] == 1)
		var = gUnknown_02024C07;
	else
		var = gUnknown_02024C08;
	
	temp = battle_get_per_side_status(var) & 1;
	temp2 = AIScriptRead32(gAIScriptPtr + 2);
	
	if (!(gUnknown_02024C7A[temp] & temp2))
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 6);
	else
		gAIScriptPtr += 10;
}

void BattleAICmd_if_less_than(void)
{
	if (unk_2016800.unk8 < gAIScriptPtr[1])
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_more_than(void)
{
	if (unk_2016800.unk8 > gAIScriptPtr[1])
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_equal(void)
{
	if (unk_2016800.unk8 == gAIScriptPtr[1])
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_not_equal(void)
{
	if (unk_2016800.unk8 != gAIScriptPtr[1])
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 2);
	else
		gAIScriptPtr += 6;
}

void BattleAICmd_if_less_than_32(void)
{
	u8 *temp = AIScriptRead32(gAIScriptPtr + 1);

	if (unk_2016800.unk8 < *temp)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 5);
	else
		gAIScriptPtr += 9;
}

void BattleAICmd_if_more_than_32(void)
{
	u8 *temp = AIScriptRead32(gAIScriptPtr + 1);

	if (unk_2016800.unk8 > *temp)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 5);
	else
		gAIScriptPtr += 9;
}

void BattleAICmd_if_equal_32(void)
{
	u8 *temp = AIScriptRead32(gAIScriptPtr + 1);

	if (unk_2016800.unk8 == *temp)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 5);
	else
		gAIScriptPtr += 9;
}

void BattleAICmd_if_not_equal_32(void)
{
	u8 *temp = AIScriptRead32(gAIScriptPtr + 1);

	if (unk_2016800.unk8 != *temp)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 5);
	else
		gAIScriptPtr += 9;
}

void BattleAICmd_if_move(void)
{
	u16 move = AIScriptRead16(gAIScriptPtr + 1);

	if (unk_2016800.unk2 == move)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 3);
	else
		gAIScriptPtr += 7;
}

void BattleAICmd_if_not_move(void)
{
	u16 move = AIScriptRead16(gAIScriptPtr + 1);

	if (unk_2016800.unk2 != move)
		gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 3);
	else
		gAIScriptPtr += 7;
}

void BattleAICmd_if_in_bytes(void)
{
    u8 *ptr = AIScriptRead32(gAIScriptPtr + 1);
   
   while(*ptr != 0xFF)
   {
       if(unk_2016800.unk8 == *ptr)
       {
           gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 5);
           return;
       }
       ptr++;
   }
   gAIScriptPtr += 9;
}

void BattleAICmd_if_not_in_bytes(void)
{
    u8 *ptr = AIScriptRead32(gAIScriptPtr + 1);
   
   while(*ptr != 0xFF)
   {
       if(unk_2016800.unk8 == *ptr)
       {
           gAIScriptPtr += 9;
           return;
       }
       ptr++;
   }
   gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 5);
}

void BattleAICmd_if_in_words(void)
{
    u16 *ptr = AIScriptRead32(gAIScriptPtr + 1);
   
   while(*ptr != 0xFFFF)
   {
       if(unk_2016800.unk8 == *ptr)
       {
           gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 5);
           return;
       }
       ptr++;
   }
   gAIScriptPtr += 9;
}

void BattleAICmd_if_not_in_words(void)
{
    u16 *ptr = AIScriptRead32(gAIScriptPtr + 1);
   
   while(*ptr != 0xFFFF)
   {
       if(unk_2016800.unk8 == *ptr)
       {
           gAIScriptPtr += 9;
           return;
       }
       ptr++;
   }
   gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 5);
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
       gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 1);
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
       gAIScriptPtr = AIScriptRead32(gAIScriptPtr + 1);
}

void BattleAICmd_unk_21(void)
{
	unk_2016800.unk8 = gUnknown_030042E0[19];
	gAIScriptPtr += 1;
}

void BattleAICmd_get_type(void)
{
	u8 typeVar = gAIScriptPtr[1];

	switch(typeVar)
	{
		case 1:
			unk_2016800.unk8 = gBattleMons[gUnknown_02024C07].type1;
			break;
		case 0:
			unk_2016800.unk8 = gBattleMons[gUnknown_02024C08].type1;
			break;
		case 3:
			unk_2016800.unk8 = gBattleMons[gUnknown_02024C07].type2;
			break;
		case 2:
			unk_2016800.unk8 = gBattleMons[gUnknown_02024C08].type2;
			break;
		case 4:
			unk_2016800.unk8 = gBattleMoves[unk_2016800.unk2].type;
			break;
	}
	gAIScriptPtr += 2;
}

void BattleAICmd_unk_23(void)
{
	unk_2016800.unk8 = gBattleMoves[unk_2016800.unk2].power;
	gAIScriptPtr += 1;
}

/*
	thumb_func_start BattleAICmd_unk_23
BattleAICmd_unk_23: @ 81081CC
	ldr r3, _081081E8 @ =0x02016800
	ldr r2, _081081EC @ =gBattleMoves
	ldrh r1, [r3, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	str r0, [r3, 0x8]
	ldr r1, _081081F0 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081081E8: .4byte 0x02016800
_081081EC: .4byte gBattleMoves
_081081F0: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_unk_23
*/
