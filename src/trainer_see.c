#include "global.h"
#include "fieldmap.h"
#include "task.h"

extern u8 * GetFieldObjectScriptPointerByFieldObjectId(u8);
extern u8 * GetTrainerFlagFromScriptPointer(u8 *);
extern u8 TrainerCanApproachPlayer(struct MapObject *);
extern u8 sub_8060024(struct MapObject *, s16, s16, u8);
extern u8 npc_block_way(struct MapObject *, s16, s16, u8);
extern void TrainerWantsBattle(u8, u8 *);

extern bool8 (*gIsTrainerInRange[])(struct MapObject *, u16, s16, s16);
extern bool8 (*gTrainerSeeFuncList[])(u8, struct Task *, struct MapObject *);

bool8 CheckTrainer(u8);
bool8 CheckPathBetweenTrainerAndPlayer(struct MapObject *, u8, u8);
void sub_80842C8(struct MapObject *, u8);
void RunTrainerSeeFuncList(u8);

bool8 CheckTrainers(void)
{
	u8 i;
	
	for(i = 0; i < 16; i++)
	{
		if ( gMapObjects[i].active )
			if ( gMapObjects[i].trainerType == 1 ||  gMapObjects[i].trainerType == 3 )
				if ( CheckTrainer(i) )
					return TRUE;
	}
	return FALSE;
}

bool8 CheckTrainer(u8 trainer)
{
   u8 *scriptPtr = GetFieldObjectScriptPointerByFieldObjectId(trainer);

   if(GetTrainerFlagFromScriptPointer(scriptPtr))
       return FALSE;
   else
   {
       struct MapObject *trainerObj = &gMapObjects[trainer];
       u8 canApproach = TrainerCanApproachPlayer(trainerObj);

       if(canApproach != 0)
		{
           TrainerWantsBattle(trainer, scriptPtr);
           sub_80842C8(trainerObj, (canApproach - 1));
           return TRUE;
		}
       else
       {
		   return FALSE;
       }
   }
}

bool8 TrainerCanApproachPlayer(struct MapObject *trainerObj)
{
	s16 x, y;
	u8 i;
	u8 playerCoord;
	
	PlayerGetDestCoords(&x, &y);
	if ( trainerObj->trainerType == 1 ) // trainers that don't spin
	{
		playerCoord = gIsTrainerInRange[trainerObj->mapobj_unk_18 - 1](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
		return CheckPathBetweenTrainerAndPlayer(trainerObj, playerCoord, trainerObj->mapobj_unk_18);
	}
	else // spinners
	{
		for(i = 0; i < 4; i++)
		{
			playerCoord = gIsTrainerInRange[i](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
			if ( CheckPathBetweenTrainerAndPlayer(trainerObj, playerCoord, i + 1) ) // directions are 1-4 instead of 0-3. south north west east
				return playerCoord;
		}
		return FALSE;
	}
}

bool8 IsTrainerInRangeSouth(struct MapObject *trainerObj, s16 vision, s16 x, s16 y)
{
	if ( trainerObj->coords2.x == x
		&& y > trainerObj->coords2.y
		&& y <= trainerObj->coords2.y + vision )
		return (y - trainerObj->coords2.y);
	else
		return FALSE;
}

bool8 IsTrainerInRangeNorth(struct MapObject *trainerObj, s16 vision, s16 x, s16 y)
{
	if ( trainerObj->coords2.x == x
		&& y < trainerObj->coords2.y
		&& y >= trainerObj->coords2.y - vision )
		return (trainerObj->coords2.y - y);
	else
		return FALSE;
}

bool8 IsTrainerInRangeWest(struct MapObject *trainerObj, s16 vision, s16 x, s16 y)
{
	if ( trainerObj->coords2.y == y
		&& x < trainerObj->coords2.x
		&& x >= trainerObj->coords2.x - vision )
		return (trainerObj->coords2.x - x);
	else
		return FALSE;
}

bool8 IsTrainerInRangeEast(struct MapObject *trainerObj, s16 vision, s16 x, s16 y)
{
	if ( trainerObj->coords2.y == y
		&& x > trainerObj->coords2.x
		&& x <= trainerObj->coords2.x + vision )
		return (x - trainerObj->coords2.x);
	else
		return FALSE;
}

bool8 CheckPathBetweenTrainerAndPlayer(struct MapObject *trainerObj, u8 playerCoord, u8 direction)
{
	s16 x, y;
	u8 unk19_temp;
	u8 unk19b_temp;
	u8 i;
	u8 var;

	if ( !playerCoord )
		return FALSE;

	x = trainerObj->coords2.x;
	y = trainerObj->coords2.y;

	for(i = 0; i <= playerCoord - 1;)
	{
		var = sub_8060024(trainerObj, x, y, direction);

		if (var != 0 && (var & 1) != 0 )
			return FALSE;

		i++;
		MoveCoords(direction, &x, &y);
	}

	// preserve mapobj_unk_19 before clearing.
	unk19_temp = trainerObj->mapobj_unk_19;
	unk19b_temp = trainerObj->mapobj_unk_19b;
	trainerObj->mapobj_unk_19 = 0;
	trainerObj->mapobj_unk_19b = 0;

	var = npc_block_way(trainerObj, x, y, direction);

	trainerObj->mapobj_unk_19 = unk19_temp;
	trainerObj->mapobj_unk_19b = unk19b_temp;
	if ( var == 4 )
		return playerCoord;

	return FALSE;
}

void sub_80842C8(struct MapObject *trainerObj, u8 taskId)
{
	struct Task *task = &gTasks[CreateTask(RunTrainerSeeFuncList, 0x50)];

	task->data[1] = (u32)(trainerObj) >> 16;
	task->data[2] = (u32)(trainerObj);
	task->data[3] = taskId;
}

void sub_80842FC(TaskFunc func)
{
	TaskFunc func2 = RunTrainerSeeFuncList;
	u8 taskId = FindTaskIdByFunc(func2);
	
	SetTaskFuncWithFollowupFunc(taskId, RunTrainerSeeFuncList, func);
	gTasks[taskId].data[0] = 1;
	func2(taskId);
}

void RunTrainerSeeFuncList(u8 taskId)
{
	struct Task *task = &gTasks[taskId];
	struct MapObject *trainerObj = (task->data[1] << 16) | (task->data[2]);

	if (!trainerObj->active)
		SwitchTaskToFollowupFunc(taskId);
	else
		while (gTrainerSeeFuncList[task->data[0]](taskId, task, trainerObj));
}

/*
	thumb_func_start RunTrainerSeeFuncList
RunTrainerSeeFuncList: @ 808433C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08084368 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r5, r0, 16
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	orrs r5, r0
	ldrb r0, [r5]
	lsls r0, 31
	cmp r0, 0
	bne _0808436C
	adds r0, r6, 0
	bl SwitchTaskToFollowupFunc
	b _08084388
	.align 2, 0
_08084368: .4byte gTasks
_0808436C:
	ldr r7, _08084390 @ =gTrainerSeeFuncList
_0808436E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r7
	ldr r3, [r0]
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _0808436E
_08084388:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084390: .4byte gTrainerSeeFuncList
	thumb_func_end RunTrainerSeeFuncList
*/