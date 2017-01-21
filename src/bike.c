#include "global.h"
#include "global.fieldmap.h"
#include "flags.h"
#include "asm.h"
#include "field_map_obj.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "songs.h"
#include "sound.h"
#include "rom4.h"

struct UnknownStruct1
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    const u8 *unk10;
    const u8 *unk14;
    u32 unk18;
};

extern u8 gUnknown_02039250;
extern u8 gUnknown_02039251;
extern u8 gUnknown_0202E854;

extern u8 gUnknown_0202E86C[];
extern u8 gUnknown_0202E874[];

static void MovePlayerOnMachBike(u8, u16, u16);
static u8 CheckMovementInputMachBike(u8 *);
static void sub_80E5168(u8);
static void sub_80E517C(u8);
static void sub_80E51C4(u8);
static void sub_80E5270(u8);
static void MovePlayerOnAcroBike(u8, u16, u16);
static u8 CheckMovementInputAcroBike(u8 *, u16, u16);
static u8 CheckMovementInputAcroBikeNormal(u8 *, u16, u16);
static u8 CheckMovementInputAcroBikeChangingDirection(u8 *, u16, u16);
static u8 CheckMovementInputAcroBikeStandingWheelie(u8 *, u16, u16);
static u8 CheckMovementInputAcroBikeBunnyHop(u8 *, u16, u16);
static u8 CheckMovementInputAcroBikeMovingWheelie(u8 *, u16, u16);
static u8 CheckMovementInputAcroBikeUnknownMode5(u8 *, u16, u16);
static u8 CheckMovementInputAcroBikeUnknownMode6(u8 *, u16, u16);
static void sub_80E56F8(u8);
static void sub_80E5708(u8);
static void sub_80E5744(u8);
static void sub_80E57BC(u8);
static void sub_80E57F8(u8);
static void sub_80E5834(u8);
static void sub_80E5870(u8);
static void sub_80E58AC(u8);
static void sub_80E5920(u8);
static void sub_80E5990(u8);
static void sub_80E59A0(u8);
static void sub_80E5A30(u8);
static void sub_80E5AC0(u8);
static void sub_80E5B60(u16, u16);
static u8 sub_80E5C2C(void);
static void sub_80E5C7C(u8);
static void sub_80E5CB8(u8);
static u8 sub_80E5CF4(u16);
static u8 sub_80E5D34(u8);
u8 sub_80E5DA0(struct MapObject *, s16, s16, u8, u8);

extern void sub_80E5E4C();
extern u8 sub_80E5E70(u8, u8);
extern void sub_80E6024(void);
extern u8 IsRunningDisallowedByMetatile(u8);
extern u8 sub_80608A4(u8);

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
u8 sub_80E5E70(u8, u8);
u8 sub_80E5EC0(u8, u8);

static void (*const gUnknown_083DB594[])(u8) = 
{
    sub_80E5168,
    sub_80E517C,
    sub_80E51C4,
    sub_80E5270,
};

static void (*const gUnknown_083DB5A4[])(u8) =
{
    PlayerGoSpeed0,
    sub_80593C4,
    sub_80593F4,
};

static void (*const gUnknown_083DB5B0[])(u8) =
{
    sub_80E56F8,
    sub_80E5708,
    sub_80E5744,
    sub_80E57BC,
    sub_80E57F8,
    sub_80E5834,
    sub_80E5870,
    sub_80E58AC,
    sub_80E5920,
    sub_80E5990,
    sub_80E59A0,
    sub_80E5A30,
    sub_80E5AC0,
};

static u8 (*const gUnknown_083DB5E4[])(u8 *, u16, u16) =
{
    CheckMovementInputAcroBikeNormal,
    CheckMovementInputAcroBikeChangingDirection,
    CheckMovementInputAcroBikeStandingWheelie,
    CheckMovementInputAcroBikeBunnyHop,
    CheckMovementInputAcroBikeMovingWheelie,
    CheckMovementInputAcroBikeUnknownMode5,
    CheckMovementInputAcroBikeUnknownMode6,
};

const u16 gUnknown_083DB600[] = {1, 2, 4};
static const u8 Unknown_3DB606[] = {4, 0};

static const struct UnknownStruct1 gUnknown_083DB608[] =
{
    {1, 2, 15, 15, Unknown_3DB606, Unknown_3DB606, 1},
    {2, 2, 15, 15, Unknown_3DB606, Unknown_3DB606, 2},
    {3, 2, 15, 15, Unknown_3DB606, Unknown_3DB606, 3},
    {4, 2, 15, 15, Unknown_3DB606, Unknown_3DB606, 4},
};

void MovePlayerOnBike(u8 var1, u16 var2, u16 var3)
{
    if(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
        MovePlayerOnMachBike(var1, var2, var3);
    else
        MovePlayerOnAcroBike(var1, var2, var3);
}

static void MovePlayerOnMachBike(u8 var1, u16 var2, u16 var3)
{
    gUnknown_083DB594[CheckMovementInputMachBike(&var1) & 0x3FF](var1); // var2 and var3 arent used?
}

static u8 CheckMovementInputMachBike(u8 *ptr)
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

static void sub_80E5168(u8 var)
{
    PlayerFaceDirection(var);
    sub_80E6024();
}

static void sub_80E517C(u8 var)
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

static void sub_80E51C4(u8 var)
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

static void sub_80E5270(u8 var)
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

static void MovePlayerOnAcroBike(u8 var1, u16 var2, u16 var3)
{
    gUnknown_083DB5B0[CheckMovementInputAcroBike(&var1, var2, var3)](var1);
}

static u8 CheckMovementInputAcroBike(u8 *ptr, u16 var1, u16 var2)
{
    return gUnknown_083DB5E4[gPlayerAvatar.unk8](ptr, var1, var2);
}

static u8 CheckMovementInputAcroBikeNormal(u8 *ptr, u16 var1, u16 var2)
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

static u8 CheckMovementInputAcroBikeChangingDirection(u8 *ptr, u16 unused1, u16 unused2)
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

static u8 CheckMovementInputAcroBikeStandingWheelie(u8 *ptr, u16 unused1, u16 c)
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

static u8 CheckMovementInputAcroBikeBunnyHop(u8 *ptr, u16 b, u16 c)
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

static u8 CheckMovementInputAcroBikeMovingWheelie(u8 *ptr, u16 b, u16 c)
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

static u8 CheckMovementInputAcroBikeUnknownMode5(u8 *ptr, u16 b, u16 c)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    playerMapObj->mapobj_bit_9 = 0;
    FieldObjectSetDirection(playerMapObj, playerMapObj->mapobj_unk_18);
    gPlayerAvatar.unk8 = 0;
    return CheckMovementInputAcroBike(ptr, b, c);
}

static u8 CheckMovementInputAcroBikeUnknownMode6(u8 *ptr, u16 b, u16 c)
{
    gPlayerAvatar.unk8 = 0;
    return CheckMovementInputAcroBike(ptr, b, c);
}

static void sub_80E56F8(u8 direction)
{
    PlayerFaceDirection(direction);
}

static void sub_80E5708(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    PlayerFaceDirection(direction);
}

static void sub_80E5744(u8 direction)
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

static void sub_80E57BC(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_805951C(direction);
}

static void sub_80E57F8(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_8059534(direction);
}

static void sub_80E5834(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_8059504(direction);
}

static void sub_80E5870(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (sub_80E5E70(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_805954C(direction);
}

static void sub_80E58AC(u8 direction)
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

static void sub_80E5920(u8 direction)
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

static void sub_80E5990(u8 direction)
{
    sub_80595B8(direction);
}

static void sub_80E59A0(u8 direction)
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

static void sub_80E5A30(u8 direction)
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

static void sub_80E5AC0(u8 direction)
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

static void sub_80E5B60(u16 unused, u16 b)
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

static bool8 sub_80E5BC8(const u8 *a, const u8 *b)
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

static u8 sub_80E5C2C(void)
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

static u8 sub_80E5CF4(u16 a)
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

static u8 sub_80E5D34(u8 direction)
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

u8 sub_80E5DA0(struct MapObject *mapObject, s16 x, s16 y, u8 direction, u8 metatitleBehavior)
{
    u8 r4 = CheckForFieldObjectCollision(mapObject, x, y, direction, metatitleBehavior);

    if (r4 > 4)
        return r4;

    if (r4 == 0 && IsRunningDisallowedByMetatile(metatitleBehavior))
        r4 = 2;

    if (r4 != 0)
        sub_80E5E4C();

    return r4;
}

bool8 sub_80E5DEC(u8 tile)
{
    if(IsRunningDisallowedByMetatile(tile) != FALSE || gMapHeader.mapType == MAP_TYPE_INDOOR)
        return TRUE;
    else
        return FALSE;
}

bool8 IsRunningDisallowedByMetatile(u8 tile)
{
    if(MetatileBehavior_IsRunningDisallowed(tile) != FALSE)
        return TRUE;
    else if(MetatileBehavior_IsFortreeBridge(tile) == FALSE)
        return FALSE;
    else if((PlayerGetZCoord() & 1) != 0)
        return FALSE;
    else
        return TRUE;
}

void sub_80E5E4C(void)
{
    if(gUnknown_02039250 != 0 && gUnknown_02039251 < 100)
        gUnknown_02039251++;
}

bool8 sub_80E5E70(u8 var1, u8 var2)
{
    if (var1 > 2 && var1 < 5)
    {
        if (MetatileBehavior_IsIsolatedVerticalRail(var2)
         || MetatileBehavior_IsVerticalRail(var2))
            return FALSE;
    }
    else
    {
        if (MetatileBehavior_IsIsolatedHorizontalRail(var2)
         || MetatileBehavior_IsHorizontalRail(var2))
            return FALSE;
        
    }
    return TRUE;
}

bool8 sub_80E5EC0(u8 var1, u8 var2)
{
    if((u8)(var2 - 1) < 2)
    {
        if(var1 == 10 || var1 == 12)
            return FALSE;
    }
    else if(var1 == 11 || var1 == 13)
        return FALSE;

    return TRUE;
}

bool8 IsBikingDisallowedByPlayer(void)
{
    s16 x, y;
    u8 tileBehavior;
    
    if(!(gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_4)))
    {
        PlayerGetDestCoords(&x, &y);
        tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
        if(IsRunningDisallowedByMetatile(tileBehavior) == FALSE)
            return FALSE;
    }
    return TRUE;
}

bool8 player_should_look_direction_be_enforced_upon_movement(void)
{
    if(TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE) != FALSE && MetatileBehavior_IsBumpySlope(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E) != FALSE)
        return FALSE;
    else
        return TRUE;
}

void GetOnOffBike(u8 var)
{
    gUnknown_0202E854 = 0;
    
    if(gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
    {
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
        sav1_reset_battle_music_maybe();
        sub_8053E90();
    }
    else
    {
        SetPlayerAvatarTransitionFlags(var);
        sav1_set_battle_music_maybe(0x193);
        sub_8053FB0(0x193);
    }
}

void sub_80E5FCC(int var1, int var2)
{
    u8 i;

    gPlayerAvatar.unk8 = 0;
    gPlayerAvatar.unk9 = 0;
    gPlayerAvatar.unkA = 0;
    gPlayerAvatar.unkB = 0;
    gPlayerAvatar.unkC = var1;
    gPlayerAvatar.unk10 = var2;
    
    for(i = 0; i < 8; i++)
        gPlayerAvatar.unk14[i] = 0;
    
    for(i = 0; i < 8; i++)
        gPlayerAvatar.unk1C[i] = 0;
}

void sub_80E6010(u8 var)
{
    gPlayerAvatar.unkA = var;
    gPlayerAvatar.unkB = gPlayerAvatar.unkA + (gPlayerAvatar.unkA >> 1); // lazy way of multiplying by 1.5.
}

void sub_80E6024(void)
{
    gPlayerAvatar.unkA = 0;
    gPlayerAvatar.unkB = 0;
}

s16 sub_80E6034(void)
{
    s16 arr[3];

    memcpy(arr, gUnknown_083DB600, sizeof(arr));

    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
        return arr[gPlayerAvatar.unkA];
    else if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
        return 3;
    else if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_DASH))
        return 2;
    else
        return 1;
}

void sub_80E6084(void)
{
    s16 x, y;
    u8 tileBehavior;

    if(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
    {
        PlayerGetDestCoords(&x, &y);
        tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
        if(MetatileBehavior_IsBumpySlope(tileBehavior) != FALSE)
        {
            gPlayerAvatar.unk8 = 2;
            sub_8059C94(player_get_direction_upper_nybble());
        }
    }
}
