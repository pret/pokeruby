#include "global.h"
#include "pokemon.h"

extern struct PokemonStorage gPokemonStorage;
extern u8 IsLinkDoubleBattle(void);
extern u8 IsDoubleBattle(void);
extern u8 battle_get_side_with_given_state(u8);
extern u8 battle_side_get_owner(u8);
void sub_8094998(u8[3], u8);
void sub_8094A74(u8[3], u8, u32);

extern u8 gUnknown_02038470[3];
extern u8 sub_803FBBC(void);
extern u16 gUnknown_02024A6A[];

void unref_sub_8094928(void *ptr)
{
    memcpy(ptr, &gPokemonStorage, 0x83d0);
}

void unref_sub_8094940(void *ptr)
{
    memcpy(&gPokemonStorage, ptr, 0x83d0);
}

void sub_8094958(void)
{
    sub_8094998(gUnknown_02038470, sub_803FBBC());
}

void sub_8094978(u8 arg1, u8 arg2)
{
    sub_8094A74((((u8(*)[3]) 0x0201606c))[arg1], arg2, arg1);
}

void sub_8094998(u8 arg[3], u8 player_number)
{
    int i;
    u32 pos;
    u8 temp[6];
    if (IsLinkDoubleBattle() == TRUE)
    {
        if (player_number)
        {
            *arg = 0x30;
            arg[1] = 0x45;
            arg[2] = 0x12;
        }
        else
        {
            *arg = 0x03;
            arg[1] = 0x12;
            arg[2] = 0x45;
        }
    }
    else
    {
        if (!IsDoubleBattle())
        {
            pos = 1;
            *temp = gUnknown_02024A6A[battle_get_side_with_given_state(0)];
            for (i = 0; i <= 5; i++)
                if (i != *temp)
                    temp[pos++] = i;
        }
        else
        {
            pos = 2;
            *temp = gUnknown_02024A6A[battle_get_side_with_given_state(0)];
            temp[1] = gUnknown_02024A6A[battle_get_side_with_given_state(2)];
            for (i = 0; i <= 5; i++)
                if ((i != *temp) && (i != temp[1]))
                    temp[pos++] = i;
        }
        for (i = 0; i <= 2; i++)
            arg[i] = (temp[i << 1] << 4) | temp[(i << 1) + 1];
    }
}

void sub_8094A74(u8 arg[3], u8 player_number, u32 arg3)
{
    int i, j;
    u8 temp[6];
    if (!battle_side_get_owner(arg3))
    {
        i = battle_get_side_with_given_state(0);
        j = battle_get_side_with_given_state(2);
    }
    else
    {
        i = battle_get_side_with_given_state(1);
        j = battle_get_side_with_given_state(3);
    }
    if (IsLinkDoubleBattle() == TRUE)
    {
        if (player_number)
        {
            *arg = 0x30;
            arg[1] = 0x45;
            arg[2] = 0x12;
        }
        else
        {
            *arg = 0x03;
            arg[1] = 0x12;
            arg[2] = 0x45;
        }
    }
    else
    {
        if (!IsDoubleBattle())
        {
            int pos = 1;
            *temp = gUnknown_02024A6A[i];
            for (i = 0; i <= 5; i++)
                if (i != *temp)
                    temp[pos++] = i;
        }
        else
        {
            int pos = 2;
            *temp = gUnknown_02024A6A[i];
            temp[1] = gUnknown_02024A6A[j];
            for (i = 0; i <= 5; i++)
                if ((i != *temp) && (i != temp[1]))
                    temp[pos++] = i;
        }
        for (i = 0; i <= 2; i++)
            arg[i] = (temp[i << 1] << 4) | temp[(i << 1) + 1];
    }
}
