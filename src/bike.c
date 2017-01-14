#include "global.h"
#include "global.fieldmap.h"
#include "flags.h"
#include "asm.h"
#include "field_player_avatar.h"

extern void (*gUnknown_083DB594[])(u8);

extern void MovePlayerOnAcroBike(u8, u16, u16);
extern void sub_80E6024(void);

void MovePlayerOnMachBike(u8, u16, u16);
u8 CheckMovementInputMachBike(u8 *);

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
