#include "global.h"
#include "main.h"
#include "species.h"
#include "pokemon.h"
#include "songs.h"
#include "task.h"

extern void prev_quest_postbuffer_cursor_backup_reset(void);
extern void overworld_poison_timer_set(void);
extern void current_map_music_set__default_for_battle(u16);
extern void c2_exit_to_overworld_1_continue_scripts_restart_music(void);
extern void c2_exit_to_overworld_2_switch(void);
extern bool32 battle_exit_is_player_defeat(u8);
extern void c2_whiteout(void);
extern void sub_800E7C4(void);
extern void sub_8081AA4(void);
extern void sub_8081A18(void);
extern void sub_8081C8C(void);
extern void sub_80C824C(void);
extern void sub_8081CEC(void);
extern void sub_8080E44(void);
extern void sub_811AABC(u8);
extern u8 sub_811AAE8(void);
extern u32 GetMonData(struct Pokemon *mon, s32 field);

struct Trainer
{
/* 0x00 */ u8 partyFlags;
/* 0x01 */ u8 trainerClass;
/* 0x02 */ u8 encounterMusic:7;
/* 0x02 */ u8 gender:1;
/* 0x03 */ u8 trainerPic;
/* 0x04 */ u8 trainerName[12];
/* 0x10 */ u16 items[4];
/* 0x18 */ u32 doubleBattle;
/* 0x1C */ u32 aiFlags;
/* 0x20 */ u8 partySize;
/* 0x24 */ struct TrainerPartyMember *party;
};

struct TrainerPartyMember
{
    u16 iv;
    u8 level;
    u16 species;
};

extern u16 MapGridGetMetatileBehaviorAt(s16, s16);
extern bool8 MetatileBehavior_IsTallGrass(char);
extern bool8 MetatileBehavior_IsLongGrass(char);
extern bool8 MetatileBehavior_IsSandOrDeepSand(char);
extern bool8 MetatileBehavior_IsSurfableWaterOrUnderwater(char);
extern bool8 MetatileBehavior_IsBridge(char);
extern bool8 sub_80574C4(char);
extern bool8 sub_80574D8(char);
extern bool8 sub_8057568(char);
extern u8 TestPlayerAvatarFlags(u8);
extern u8 sub_8057450(u8);
extern u8 GetSav1Weather(void);

extern void (*gUnknown_0300485C)(void);

extern struct Pokemon gEnemyParty[];
extern struct Pokemon gPlayerParty[];
extern struct Trainer gTrainers[];

extern u16 gUnknown_020239F8;
extern u8 gUnknown_02024D26;

extern u8 gBattleTransitionTable_Wild[][2];

void task01_battle_start(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

	switch(data[0])
	{
		case 0:
			if ( !FieldPoisonEffectIsRunning() ) // is poison not active?
			{
				sub_811AABC(data[1]);
				++data[0]; // go to case 1.
			}
			break;
		case 1:
			if ( sub_811AAE8() == 1 )
			{
				SetMainCallback2(sub_800E7C4);
				prev_quest_postbuffer_cursor_backup_reset();
				overworld_poison_timer_set();
				DestroyTask(taskId);
			}
			break;
	}
}

void task_add_01_battle_start(u8 transition, u16 song)
{
	u8 taskId = CreateTask(task01_battle_start, 1);

	gTasks[taskId].data[1] = transition;
	current_map_music_set__default_for_battle(song);
}

void CheckForSafariZoneAndProceed(void)
{
	if ( GetSafariZoneFlag() )
		sub_8081AA4();
	else
		sub_8081A18();
}

void sub_8081A18(void)
{
	u8 transition;
	
	ScriptContext2_Enable();
    player_bitmagic();
    sub_80597F4();
	gMain.field_8 = sub_8081C8C;
	gUnknown_020239F8 = 0;
	transition = GetHigherOrLowerLevelTransitionForWild();
	task_add_01_battle_start(transition, 0);
	sav12_xor_increment(7);
	sav12_xor_increment(8);
}

void sub_8081A5C(void)
{
	u8 transition;
	
	ScriptContext2_Enable();
	player_bitmagic();
	sub_80597F4();
	gMain.field_8 = sub_8081C8C;
	gUnknown_020239F8 = 1024;
	transition = GetHigherOrLowerLevelTransitionForWild();
	task_add_01_battle_start(transition, 0);
	sav12_xor_increment(7);
	sav12_xor_increment(8);
}

void sub_8081AA4(void)
{
	u8 transition;
	
	ScriptContext2_Enable();
	player_bitmagic();
	sub_80597F4();
	gMain.field_8 = sub_80C824C;
	gUnknown_020239F8 = 128;
	transition = GetHigherOrLowerLevelTransitionForWild();
	task_add_01_battle_start(transition, 0);
}

void task_add_01_battle_start_with_music_and_stats(void)
{
	u8 transition;
	
	transition = sub_8082080();
	task_add_01_battle_start(transition, 0);
	sav12_xor_increment(7);
    sav12_xor_increment(9);
}

void sub_8081AFC(void)
{
	CreateMaleMon(&gEnemyParty, SPECIES_RALTS, 5);
	ScriptContext2_Enable();
	gMain.field_8 = c2_exit_to_overworld_1_continue_scripts_restart_music;
	gUnknown_020239F8 = 512;
	task_add_01_battle_start(8, 0);
}

void sub_8081B3C(void)
{
	u8 transition;
	
	ScriptContext2_Enable();
	gMain.field_8 = sub_8081CEC;
	gUnknown_020239F8 = 0;
	transition = GetHigherOrLowerLevelTransitionForWild();
	task_add_01_battle_start(transition, 0);
	sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081B78(void)
{
	u8 transition;

	ScriptContext2_Enable();
	gMain.field_8 = sub_8081CEC;
	gUnknown_020239F8 = 0x2000;
	transition = GetHigherOrLowerLevelTransitionForWild();
	task_add_01_battle_start(transition, 0);
    sav12_xor_increment(7);
    sav12_xor_increment(8);
}

void sub_8081BB8(void)
{
	ScriptContext2_Enable();
	gMain.field_8 = sub_8081CEC;
	gUnknown_020239F8 = 0x2000;
	task_add_01_battle_start(0, BGM_BATTLE34);
	sav12_xor_increment(7);
	sav12_xor_increment(8);
}

void sub_8081BF8(void)
{
	ScriptContext2_Enable();
	gMain.field_8 = sub_8081CEC;
	gUnknown_020239F8 = 12288;
	if ( gGameVersion == 2 )
		task_add_01_battle_start(0xB, BGM_BATTLE34); // KYOGRE
	else
		task_add_01_battle_start(0x6, BGM_BATTLE34); // GROUDON
	sav12_xor_increment(7);
	sav12_xor_increment(8);
}

void sub_8081C50(void)
{
	ScriptContext2_Enable();
	gMain.field_8 = sub_8081CEC;
	gUnknown_020239F8 = 24576;
	task_add_01_battle_start(0xA, BGM_BATTLE36);
	sav12_xor_increment(7);
	sav12_xor_increment(8);
}

void sub_8081C8C(void)
{
	CpuFill16(0, 0x5000000, 0x1000200);
	ResetOamRange(0, 0x80);

	if ( battle_exit_is_player_defeat(gUnknown_02024D26) == 1 )
	{
		SetMainCallback2(c2_whiteout);
	}
	else
	{
		SetMainCallback2(c2_exit_to_overworld_2_switch);
		gUnknown_0300485C = sub_8080E44;
	}
}

void sub_8081CEC(void)
{
	CpuFill16(0, 0x5000000, 0x1000200);
	ResetOamRange(0, 0x80);
	
	if ( battle_exit_is_player_defeat(gUnknown_02024D26) == 1 )
		SetMainCallback2(c2_whiteout);
	else
		SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

s8 sub_8081D3C(void)
{
	u16 tileBehavior;
	s16 x, y;
	
	PlayerGetDestCoords(&x, &y);
	tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
	
	if ( MetatileBehavior_IsTallGrass(tileBehavior) )
		return 0;
	if ( MetatileBehavior_IsLongGrass(tileBehavior) )
		return 1;
	if ( MetatileBehavior_IsSandOrDeepSand(tileBehavior) )
    	return 2;
	switch(gMapHeader.light)
	{
		case 1:
		case 2:
		case 3:
			break;
		case 4:
			if ( sub_80574C4(tileBehavior) )
				return 8;
			if ( MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior) )
				return 5;
			return 7;
		case 8:
		case 9:
			return 8;
		case 5:
			return 3;
		case 6:
			if ( MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior) )
				return 4;
			return 9;
	}
	if ( sub_8057568(tileBehavior) )
		return 4;
	if ( MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior) )
		return 5;
	if ( sub_80574D8(tileBehavior) )
		return 6;
	if ( TestPlayerAvatarFlags(8) )
	{
		if ( sub_8057450(tileBehavior) )
			return 5;
		if ( MetatileBehavior_IsBridge(tileBehavior) == 1 )
			return 4;
	}
	if ( !(gSaveBlock1.location.mapGroup == 0 && gSaveBlock1.location.mapNum == 28) && GetSav1Weather() != 8 )
		return 9;
	else
		return 2;
}

s8 sub_8081E90(void)
{
	u8 flashUsed;
	u16 tileBehavior;
	s16 x, y;
	
	PlayerGetDestCoords(&x, &y);
	tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
	
	flashUsed = sav1_get_flash_used_on_map();
	
	if(flashUsed)
		return 2;
	
	if( !(MetatileBehavior_IsSurfableWaterOrUnderwater(tileBehavior)) )
	{
		switch (gMapHeader.light)
		{
			case 4:
				return 1;
			case 5:
				return 3;
			default:
				return 0;
		}
	}
	return 3;
}

u16 GetSumOfPartyMonLevel(u8 fixCount)
{
	u32 monData;
	u8 returnThis = 0;
	int loopCounter;
	
	for (loopCounter = 0; loopCounter <= 5; loopCounter++)
	{
		monData = GetMonData(&gPlayerParty[loopCounter], MON_DATA_SPECIES2);
		if ( monData != 412 && monData ) // if the pokemon in question is either NOT Ten question marks or an egg, proceed
		// note that it actually considers the 26 glitch mons to be "valid".
		{
			if ( GetMonData(&gPlayerParty[loopCounter], MON_DATA_HP))
			{
				returnThis += GetMonData(&gPlayerParty[loopCounter], MON_DATA_LEVEL);

				fixCount--;
				if ( !fixCount ) // has it reached 0?
					break;
			}
		}
	}
	return returnThis;
}

u8 GetSumOfEnemyPartyLevel(u16 trainerNum, u8 partyCount)
{
	// TODO: Clean this up.
    u8 i;
    u8 returnThis; // v4
    u32 _partyCount = partyCount;
    struct TrainerPartyMember *party;
   
    if ( gTrainers[trainerNum].partySize < _partyCount ) // is the actual party size smaller than the specified size?
        _partyCount = gTrainers[trainerNum].partySize; // if so, set the specified size to the actual size. seems to be error correction?
   
    returnThis = 0;
    switch(gTrainers[trainerNum].partyFlags)
    {
        case 0:
            party = gTrainers[trainerNum].party;
            for(i = 0; i < _partyCount; i++)
                returnThis += party[i].level;
            break;
        case 1:
            party = gTrainers[trainerNum].party;
            for(i = 0; i < _partyCount; i++)
                returnThis += party[i * 2].level;
            break;
        case 2:
            party = gTrainers[trainerNum].party;
            for(i = 0; i < _partyCount; i++)
                returnThis += party[i].level;
            break;
        case 3:
            party = gTrainers[trainerNum].party;
            for(i = 0; i < _partyCount; i++)
                returnThis += party[i * 2].level;
            break;
    }
    return returnThis;
}

u8 GetHigherOrLowerLevelTransitionForWild(void)
{
    u8 flashVar = sub_8081E90();
    u8 level = GetMonData(&gEnemyParty, MON_DATA_LEVEL);
   
    if ( level < (u8)GetSumOfPartyMonLevel(1) ) // is wild mon level than the player's mon level?
        return gBattleTransitionTable_Wild[flashVar][0];
    else
        return gBattleTransitionTable_Wild[flashVar][1]; // use a white fade in instead of normal transition.
}

/*
	thumb_func_start GetHigherOrLowerLevelTransitionForWild
GetHigherOrLowerLevelTransitionForWild: @ 8082034
	push {r4,r5,lr}
	bl sub_8081E90
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08082064 @ =gEnemyParty
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetSumOfPartyMonLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0808206C
	ldr r0, _08082068 @ =gBattleTransitionTable_Wild
	lsls r1, r5, 1
	adds r0, 0x1
	b _08082070
	.align 2, 0
_08082064: .4byte gEnemyParty
_08082068: .4byte gBattleTransitionTable_Wild
_0808206C:
	ldr r0, _0808207C @ =gBattleTransitionTable_Wild
	lsls r1, r5, 1
_08082070:
	adds r1, r0
	ldrb r0, [r1]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808207C: .4byte gBattleTransitionTable_Wild
	thumb_func_end GetHigherOrLowerLevelTransitionForWild
*/