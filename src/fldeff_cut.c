#include "global.h"
#include "asm.h"
#include "metatile_behavior.h"
#include "field_player_avatar.h"
#include "field_effect.h"
#include "rom4.h"
#include "script.h"
#include "rom6.h"

extern void (*gUnknown_0300485C)(void);
extern void (*gUnknown_03005CE4)(void);

extern struct MapPosition gUnknown_0203923C;

extern u8 gUnknown_03005CE0;
extern u32 gUnknown_0202FF84;

extern u8 UseCutScript;

extern void sub_808AB90(void); // unknown args
extern void sub_80A2634(void); // unknown args
extern void sub_80A25E8(void); // unknown args
extern void sub_80A2684(void); // unknown args
extern void sub_80A2B00(void); // unknown args

bool8 SetUpFieldMove_Cut(void)
{
	s16 x, y;
	u8 i, j;
	u8 tileBehavior;

	if(npc_before_player_of_type(0x52) == TRUE) // is in front of tree?
	{
		gUnknown_0300485C = sub_808AB90;
		gUnknown_03005CE4 = sub_80A2634;
		return TRUE;
	}
	else // is in ash or grass to cut?
	{
		PlayerGetDestCoords(&gUnknown_0203923C.x, &gUnknown_0203923C.y);
		for(i = 0; i < 3; i++)
		{
			y = i - 1 + gUnknown_0203923C.y;
			for(j = 0; j < 3; j++)
			{
				x = j - 1 + gUnknown_0203923C.x;
				if(MapGridGetZCoordAt(x, y) == (s8)gUnknown_0203923C.height)
				{
					tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
					if(MetatileBehavior_IsPokeGrass(tileBehavior) == TRUE
					|| MetatileBehavior_IsAsh(tileBehavior) == TRUE)
					{
						gUnknown_0300485C = sub_808AB90;
						gUnknown_03005CE4 = sub_80A25E8;
						return TRUE;
					}
				}
			}
		}
		return FALSE; // do not use cut
	}
}

void sub_80A25E8(void)
{
	FieldEffectStart(1);
	gUnknown_0202FF84 = gUnknown_03005CE0;
}

bool8 FldEff_UseCutOnGrass(void)
{
	u8 taskId = oei_task_add();
	
	gTasks[taskId].data[8] = (u32)sub_80A2684 >> 16;
	gTasks[taskId].data[9] = (u32)sub_80A2684;
	IncrementGameStat(0x12);
	return FALSE;
}

void sub_80A2634(void)
{
	gUnknown_0202FF84 = gUnknown_03005CE0;
	ScriptContext1_SetupScript(&UseCutScript);
}

bool8 FldEff_UseCutOnTree(void)
{
	u8 taskId = oei_task_add();
	
	gTasks[taskId].data[8] = (u32)sub_80A2B00 >> 16;
	gTasks[taskId].data[9] = (u32)sub_80A2B00;
	IncrementGameStat(0x12);
	return FALSE;
}

void sub_80A2684(void)
{
	FieldEffectActiveListRemove(1);
	FieldEffectStart(0x3A);
}

/*
	thumb_func_start sub_80A2684
sub_80A2684: @ 80A2684
	push {lr}
	movs r0, 0x1
	bl FieldEffectActiveListRemove
	movs r0, 0x3A
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80A2684
*/
