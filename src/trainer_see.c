#include "global.h"
#include "fieldmap.h"

extern u8 * GetFieldObjectScriptPointerByFieldObjectId(u8);
extern u8 * GetTrainerFlagFromScriptPointer(u8 *);
extern u8 TrainerCanApproachPlayer(struct MapObject *);
extern bool8 CheckPathBetweenTrainerAndPlayer(struct MapObject *, bool8, u8);
extern void TrainerWantsBattle(u8, u8 *);
extern void sub_80842C8(struct MapObject *, u8);

extern bool8 (*gIsTrainerInRange[])(struct MapObject *, u16, s16, s16);

bool8 CheckTrainer(u8);

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
	bool8 isInRange;
	
	PlayerGetDestCoords(&x, &y);
	if ( trainerObj->trainerType == 1 ) // trainers that don't spin
	{
		isInRange = gIsTrainerInRange[trainerObj->mapobj_unk_18 - 1](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
		return CheckPathBetweenTrainerAndPlayer(trainerObj, isInRange, trainerObj->mapobj_unk_18);
	}
	else // spinners
	{
		for(i = 0; i < 4; i++)
		{
			isInRange = gIsTrainerInRange[i](trainerObj, trainerObj->trainerRange_berryTreeId, x, y);
			if ( CheckPathBetweenTrainerAndPlayer(trainerObj, isInRange, i + 1) )
				return isInRange;
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

/*
	thumb_func_start IsTrainerInRangeEast
IsTrainerInRangeEast: @ 80841D4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _0808420E
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _0808420E
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	cmp r3, r1
	bgt _0808420E
	subs r0, r5, r2
	lsls r0, 24
	lsrs r0, 24
	b _08084210
_0808420E:
	movs r0, 0
_08084210:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeEast
*/