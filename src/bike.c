#include "global.h"
#include "global.fieldmap.h"
#include "flags.h"
#include "asm.h"
#include "field_map_obj.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "songs.h"
#include "sound.h"

struct UnknownStruct1
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u8 *unk10;
    u8 *unk14;
    u32 unk18;
};

extern u8 gUnknown_0202E86C[];
extern u8 gUnknown_0202E874[];
extern void (*gUnknown_083DB594[])(u8);
extern void (*gUnknown_083DB5A4[])(u8);
extern void (*gUnknown_083DB5B0[])(u8);
extern u8 (*gUnknown_083DB5E4[])(u8 *, u16, u16);
extern const struct UnknownStruct1 gUnknown_083DB608[];

extern void sub_80E6024(void);
extern u8 sub_80E5E70(u8, u8);
extern u8 sub_80E5D34(u8);
extern u8 sub_80608A4(u8);
extern u8 sub_80E5EC0();
extern u8 IsRunningDisallowedByMetatile(u8);

void MovePlayerOnMachBike(u8, u16, u16);
u8 CheckMovementInputMachBike(u8 *);
u8 CheckMovementInputAcroBike(u8 *, u16, u16);
void sub_80E5168(u8);
void sub_80E5270(u8);
void MovePlayerOnAcroBike(u8, u16, u16);
void sub_80E5B60(u16, u16);
u8 sub_80E5CF4(u16);
static void sub_80E5C7C(u8);
static void sub_80E5CB8(u8);
u8 sub_80E5C2C(void);
u8 sub_80E5DA0(struct MapObject *mapObject, s16 x, s16 y, u8 direction, u8 metatitleBehavior);
void sub_80E5E4C();

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
                PlayerJumpLedge(var);
            else
            {
                sub_80E6024();
                if (funcVar < 5 || funcVar > 8)
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
            if (funcVar < 5 || funcVar > 8)
                PlayerOnBikeCollide(var);
        }
    }
    else
        gUnknown_083DB5A4[gPlayerAvatar.unkA](var);
}

void MovePlayerOnAcroBike(u8 var1, u16 var2, u16 var3)
{
    gUnknown_083DB5B0[CheckMovementInputAcroBike(&var1, var2, var3)](var1);
}

u8 CheckMovementInputAcroBike(u8 *ptr, u16 var1, u16 var2)
{
    return gUnknown_083DB5E4[gPlayerAvatar.unk8](ptr, var1, var2);
}

u8 CheckMovementInputAcroBikeNormal(u8 *ptr, u16 var1, u16 var2)
{
    u8 direction = player_get_direction_upper_nybble();
    
    gPlayerAvatar.unkA = 0;
    if (*ptr == 0)
    {
        if (var1 & 2)
        {
            *ptr = direction;
            gPlayerAvatar.running2 = 0;
            gPlayerAvatar.unk8 = 2;
            return 3;
        }
        else
        {
            *ptr = direction;
            gPlayerAvatar.running2 = 0;
            return 0;
        }
    }
    if (*ptr == direction && (var2 & 2) && gPlayerAvatar.unkB == 0)
    {
        gPlayerAvatar.unkB++;
        gPlayerAvatar.unk8 = 4;
        return 11;
    }
    if (*ptr != direction && gPlayerAvatar.running2 != 2)
    {
        gPlayerAvatar.unk8 = 1;
        gPlayerAvatar.unk9 = *ptr;
        gPlayerAvatar.running2 = 0;
        return CheckMovementInputAcroBike(ptr, var1, var2);
    }
    gPlayerAvatar.running2 = 2;
    return 2;
}

u8 CheckMovementInputAcroBikeChangingDirection(u8 *ptr, u16 unused1, u16 unused2)
{
    u8 direction;
    
    *ptr = gPlayerAvatar.unk9;
    gPlayerAvatar.unkA++;
    if (gPlayerAvatar.unkA > 6)
    {
        gPlayerAvatar.running2 = 1;
        gPlayerAvatar.unk8 = 0;
        sub_80E6024();
        return 1;
    }
    direction = player_get_direction_upper_nybble();
    if (*ptr == sub_80E5C2C())
    {
        sub_80E6024();
        gPlayerAvatar.unkB = 1;
        if (*ptr == GetOppositeDirection(direction))
        {
            gPlayerAvatar.unk8 = 6;
            return 9;
        }
        else
        {
            gPlayerAvatar.running2 = 2;
            gPlayerAvatar.unk8 = 5;
            return 8;
        }
    }
    *ptr = direction;
    return 0;
}

u8 CheckMovementInputAcroBikeStandingWheelie(u8 *ptr, u16 unused1, u16 c)
{
    u8 direction;
    struct MapObject *playerMapObj;
    
    direction = player_get_direction_upper_nybble();
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    gPlayerAvatar.running2 = 0;
    if (c & 2)
    {
        gPlayerAvatar.unkA++;
    }
    else
    {
        gPlayerAvatar.unkA = 0;
        if (!MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
        {
            *ptr = direction;
            gPlayerAvatar.unk8 = 0;
            sub_80E6024();
            return 4;
        }
    }
    if (gPlayerAvatar.unkA > 0x27)
    {
        *ptr = direction;
        gPlayerAvatar.unk8 = 3;
        sub_80E6024();
        return 6;
    }
    if (*ptr == direction)
    {
        gPlayerAvatar.running2 = 2;
        gPlayerAvatar.unk8 = 4;
        sub_80E6024();
        return 10;
    }
    if (*ptr == 0)
    {
        *ptr = direction;
        return 5;
    }
    gPlayerAvatar.running2 = 1;
    return 5;
}

u8 CheckMovementInputAcroBikeBunnyHop(u8 *ptr, u16 b, u16 c)
{
    u8 direction;
    struct MapObject *playerMapObj;
    
    direction = player_get_direction_upper_nybble();
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!(c & 2))
    {
        sub_80E6024();
        if (MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
        {
            gPlayerAvatar.unk8 = 2;
            return CheckMovementInputAcroBike(ptr, b, c);
        }
        *ptr = direction;
        gPlayerAvatar.running2 = 0;
        gPlayerAvatar.unk8 = 0;
        return 4;
    }
    if (*ptr == 0)
    {
        *ptr = direction;
        gPlayerAvatar.running2 = 0;
        return 6;
    }
    if (*ptr != direction && gPlayerAvatar.running2 != 2)
    {
        gPlayerAvatar.running2 = 1;
        return 6;
    }
    gPlayerAvatar.running2 = 2;
    return 7;
}

u8 CheckMovementInputAcroBikeMovingWheelie(u8 *ptr, u16 b, u16 c)
{
    u8 direction;
    struct MapObject *playerMapObj;
    
    direction = player_get_direction_lower_nybble();
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!(c & 2))
    {
        sub_80E6024();
        if (!MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
        {
            gPlayerAvatar.unk8 = 0;
            if (*ptr == 0)
            {
                *ptr = direction;
                gPlayerAvatar.running2 = 0;
                return 4;
            }
            if (*ptr != direction && gPlayerAvatar.running2 != 2)
            {
                gPlayerAvatar.running2 = 0;
                return 4;
            }
            gPlayerAvatar.running2 = 2;
            return 12;
        }
        gPlayerAvatar.unk8 = 2;
        return CheckMovementInputAcroBike(ptr, b, c);
    }
    if (*ptr == 0)
    {
        *ptr = direction;
        gPlayerAvatar.unk8 = 2;
        gPlayerAvatar.running2 = 0;
        sub_80E6024();
        return 5;
    }
    if (direction != *ptr && gPlayerAvatar.running2 != 2)
    {
        gPlayerAvatar.running2 = 0;
        return 5;
    }
    gPlayerAvatar.running2 = 2;
    return 10;
}

u8 CheckMovementInputAcroBikeUnknownMode5(u8 *ptr, u16 b, u16 c)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    playerMapObj->mapobj_bit_9 = 0;
    FieldObjectSetDirection(playerMapObj, playerMapObj->mapobj_unk_18);
    gPlayerAvatar.unk8 = 0;
    return CheckMovementInputAcroBike(ptr, b, c);
}

u8 CheckMovementInputAcroBikeUnknownMode6(u8 *ptr, u16 b, u16 c)
{
    gPlayerAvatar.unk8 = 0;
    return CheckMovementInputAcroBike(ptr, b, c);
}

void sub_80E56F8(u8 direction)
{
    PlayerFaceDirection(direction);
}

void sub_80E5708(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    PlayerFaceDirection(direction);
}

void sub_80E5744(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        sub_80E56F8(playerMapObj->placeholder18);
        return;
    }
    var = sub_80E5D34(direction);
    if (var > 0 && var < 12)
    {
        if (var == 6)
            PlayerJumpLedge(direction);
        else if (var < 5 || var > 8)
            PlayerOnBikeCollide(direction);
    }
    else
    {
        npc_use_some_d2s(direction);
    }
}

void sub_80E57BC(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_805951C(direction);
}

void sub_80E57F8(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_8059534(direction);
}

void sub_80E5834(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_8059504(direction);
}

void sub_80E5870(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_805954C(direction);
}

void sub_80E58AC(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        sub_80E5870(playerMapObj->placeholder18);
        return;
    }
    var = sub_80E5D34(direction);
    //TODO: Try to get rid of this goto
    if (var == 0 || var == 9)
        goto derp;
    else if (var == 6)
        sub_8059594(direction);
    else if (var < 5 || var > 8)
    {
        if (var <= 11)
            sub_80E5870(direction);
        else
        {
          derp:
            sub_8059570(direction);
        }
    }
}

void sub_80E5920(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj;
    
    var = sub_80E5D34(direction);
    if (var != 0)
    {
        if (var == 7)
            return;
        if (var < 10)
        {
            sub_80E5708(direction);
            return;
        }
        if (sub_80E5EC0(var, direction) == 0)
        {
            sub_80E5708(direction);
            return;
        }
    }
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    PlaySE(SE_JITE_PYOKO);
    playerMapObj->mapobj_bit_9 = 1;
    player_npc_set_state_and_x22_etc(sub_80608A4(direction), 2);
}

void sub_80E5990(u8 direction)
{
    sub_80595B8(direction);
}

void sub_80E59A0(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        sub_8059504(playerMapObj->placeholder18);
        return;
    }
    var = sub_80E5D34(direction);
    if (var > 0 && var < 12)
    {
        if (var == 6)
            sub_8059594(direction);
        else if (var == 9)
            sub_8059504(direction);
        else if (var <= 4)
        {
            if (MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
                sub_8059504(direction);
            else
                sub_80595DC(direction);  //hit wall?
        }
        return;
    }
    sub_8059618(direction);
    gPlayerAvatar.running2 = 2;
}

void sub_80E5A30(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        sub_805951C(playerMapObj->placeholder18);
        return;
    }
    var = sub_80E5D34(direction);
    if (var > 0 && var < 12)
    {
        if (var == 6)
            sub_8059594(direction);
        else if (var == 9)
            sub_8059504(direction);
        else if (var <= 4)
        {
            if (MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
                sub_8059504(direction);
            else
                sub_80595DC(direction);  //hit wall?
        }
        return;
    }
    sub_8059600(direction);
    gPlayerAvatar.running2 = 2;
}

void sub_80E5AC0(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        sub_8059534(playerMapObj->placeholder18);
        return;
    }
    var = sub_80E5D34(direction);
    if (var > 0 && var < 12)
    {
        if (var == 6)
            PlayerJumpLedge(direction);
        else if (var < 5 || var > 8)
            sub_8059534(direction);
        return;
    }
    sub_8059630(direction);
}

void sub_80E5B38(u16 a, u16 b)
{
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
        sub_80E5B60(a, b);
}

void sub_80E5B60(u16 unused, u16 b)
{
    u8 var;

    var = sub_80E5CF4(b);
    if (var == (gPlayerAvatar.unkC & 0xF))
    {
        if (gPlayerAvatar.unk14[0] < 0xFF)
            gPlayerAvatar.unk14[0]++;
    }
    else
    {
        sub_80E5C7C(var);
        gPlayerAvatar.unkB = 0;
    }
    
    var = b & 0xF;
    if (var == (gPlayerAvatar.unk10 & 0xF))
    {
        if (gPlayerAvatar.unk1C[0] < 0xFF)
            gPlayerAvatar.unk1C[0]++;
    }
    else
    {
        sub_80E5CB8(var);
        gPlayerAvatar.unkB = 0;
    }
}

bool8 sub_80E5BC8(u8 *a, u8 *b)
{
    u8 i;
    
    for (i = 0; a[i] != 0; i++)
    {
        if (gUnknown_0202E86C[i] > a[i])
            return FALSE;
    }
    for (i = 0; b[i] != 0; i++)
    {
        if (gUnknown_0202E874[i] > b[i])
            return FALSE;
    }
    return TRUE;
}

u8 sub_80E5C2C(void)
{
    u32 i;
    
    for (i = 0; i < 4; i++)
    {
        const struct UnknownStruct1 *s = &gUnknown_083DB608[i];
        u32 r1 = gPlayerAvatar.unkC;
        u32 r2 = gPlayerAvatar.unk10;
        
        r1 &= s->unk8;
        r2 &= s->unkC;
        if (r1 == s->unk0 && r2 == s->unk4
         && sub_80E5BC8(s->unk10, s->unk14) != 0)
            return s->unk18;
    }
    return 0;
}

static void sub_80E5C7C(u8 a)
{
    u8 i;
    
    gPlayerAvatar.unkC = (gPlayerAvatar.unkC << 4) | (a & 0xF);
    
    for (i = 7; i != 0; i--)
        gPlayerAvatar.unk14[i] = gPlayerAvatar.unk14[i - 1];
    gPlayerAvatar.unk14[0] = 1;
}

static void sub_80E5CB8(u8 a)
{
    u8 i;
    
    gPlayerAvatar.unk10 = (gPlayerAvatar.unk10 << 4) | (a & 0xF);
    
    for (i = 7; i != 0; i--)
        gPlayerAvatar.unk1C[i] = gPlayerAvatar.unk1C[i - 1];
    gPlayerAvatar.unk1C[0] = 1;
}

u8 sub_80E5CF4(u16 a)
{
    if (a & 0x40)
        return 2;
    if (a & 0x80)
        return 1;
    if (a & 0x20)
        return 3;
    if (a & 0x10)
        return 4;
    return 0;
}

u8 sub_80E5D34(u8 direction)
{
    s16 x;
    s16 y;
    u8 metatitleBehavior;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    x = playerMapObj->coords2.x;
    y = playerMapObj->coords2.y;
    MoveCoords(direction, &x, &y);
    metatitleBehavior = MapGridGetMetatileBehaviorAt(x, y);
    return sub_80E5DA0(playerMapObj, x, y, direction, metatitleBehavior);
}

//Can't get this to match
/*
u8 sub_80E5DA0(struct MapObject *mapObject, s16 x, s16 y, u8 direction, u8 metatitleBehavior)
{
    u8 r4 = CheckForFieldObjectCollision(mapObject, x, y, direction, metatitleBehavior);
    if (r4 <= 4)
    {
        if (r4 == 0 && IsRunningDisallowedByMetatile(metatitleBehavior))
            r4 = 2;
        if (r4 != 0)
            sub_80E5E4C();
    }
    return r4;
}
*/
