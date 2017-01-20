#include "global.h"
#include "global.fieldmap.h"
#include "flags.h"
#include "asm.h"
#include "field_player_avatar.h"

extern void (*gUnknown_083DB594[])(u8);
extern void (*gUnknown_083DB5A4[])(u8);

extern void MovePlayerOnAcroBike(u8, u16, u16);
extern void sub_80E6024(void);
extern u8 sub_80E5E70(u8, u8);
extern void PlayerOnBikeCollide(u8);
extern u8 sub_80E5D34(u8);

void MovePlayerOnMachBike(u8, u16, u16);
u8 CheckMovementInputMachBike(u8 *);
void sub_80E5168(u8);
void sub_80E5270(u8);

void MovePlayerOnBike(u8 var1, u16 var2, u16 var3)
{
    if(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
        MovePlayerOnMachBike(var1, var2, var3);
    else
        MovePlayerOnAcroBike(var1, var2, var3);
}

void MovePlayerOnMachBike(u8 var1, u16 var2, u16 var3)
{
    gUnknown_083DB594[CheckMovementInputMachBike(&var1) & 0x3FF](var1); // var2 and var3 arent used?
}

u8 CheckMovementInputMachBike(u8 *ptr)
{
    u8 direction = player_get_direction_upper_nybble();

    if (*ptr == 0)
    {
        *ptr = direction;
        if (gPlayerAvatar.unkB == 0)
        {
            gPlayerAvatar.running2 = 0;
            return 0;
        }
        gPlayerAvatar.running2 = 2;
        return 3;
    }

    if (*ptr != direction && gPlayerAvatar.running2 != 2)
    {
        if (gPlayerAvatar.unkB != 0)
        {
            *ptr = direction;
            gPlayerAvatar.running2 = 2;
            return 3;
        }
        gPlayerAvatar.running2 = 1;
        return 1;
    }
    else
    {
        gPlayerAvatar.running2 = 2;
        return 2;
    }
}

void sub_80E5168(u8 var)
{
    PlayerFaceDirection(var);
    sub_80E6024();
}

void sub_80E517C(u8 var)
{
	struct MapObject *mapPtr = &gMapObjects[gPlayerAvatar.mapObjectId];

	if(sub_80E5E70(var, mapPtr->mapobj_unk_1E))
	{
		PlayerTurnInPlace(var);
		sub_80E6024();
	}
	else
		sub_80E5168(mapPtr->mapobj_unk_18);
}

void sub_80E51C4(u8 var)
{
	struct MapObject *mapPtr = &gMapObjects[gPlayerAvatar.mapObjectId];
	u8 funcVar;
	
    if(sub_80E5E70(var, mapPtr->mapobj_unk_1E) == 0)
    {
        if(gPlayerAvatar.unkB)
            sub_80E5270(mapPtr->placeholder18);
        else
            sub_80E5168(mapPtr->placeholder18);
    }
    else
	{
        funcVar = sub_80E5D34(var);
        if (funcVar > 0 && funcVar < 12)
        {
            if(funcVar == 6)
            {
                PlayerJumpLedge(var);
            }
            else
            {
                sub_80E6024();
                if((u8)(funcVar - 5) > 3)
                    PlayerOnBikeCollide(var);
            }
        }
        else
        {
            gUnknown_083DB5A4[gPlayerAvatar.unkA](var);
            gPlayerAvatar.unkB = gPlayerAvatar.unkA + (gPlayerAvatar.unkA >> 1); // same as dividing by 2, but compiler is insistent on >> 1
			if(gPlayerAvatar.unkA < 2)
				gPlayerAvatar.unkA++;
		}
	}
}

void sub_80E5270(u8 var)
{
	u8 funcVar;

	if(gPlayerAvatar.unkB != 0)
		gPlayerAvatar.unkA = --gPlayerAvatar.unkB;

	funcVar = sub_80E5D34(var);

	if (funcVar > 0 && funcVar < 12)
	{
		if(funcVar == 6)
			PlayerJumpLedge(var);
		else
		{
			sub_80E6024();
			if((u8)(funcVar - 5) > 3)
				PlayerOnBikeCollide(var);
		}
	}
	else
		gUnknown_083DB5A4[gPlayerAvatar.unkA](var);
}
