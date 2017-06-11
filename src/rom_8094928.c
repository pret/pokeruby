#include "global.h"
#include "palette.h"
#include "pokemon.h"

extern u8 ewram[];

#define DATA_COUNT (6)

struct Unk201B000
{
    //u8 filler0[0x260];
    struct Pokemon unk0[6];
    u8 filler258[8];
    u8 unk260;
    u8 unk261;
    u8 filler262[2];
    s16 unk264[DATA_COUNT * 2];
    u8 filler27C[2];
    s16 unk27E;
    s16 unk280;
    s16 unk282;
};

#define ewram1B000 (*(struct Unk201B000 *)(ewram + 0x1B000))

#define UNK_201606C_ARRAY (ewram + 0x1606C) // lazy define but whatever.

extern struct PokemonStorage gPokemonStorage;
extern u8 IsLinkDoubleBattle(void);
extern u8 IsDoubleBattle(void);
extern u8 battle_get_side_with_given_state(u8);
extern u8 battle_side_get_owner(u8);
void sub_8094998(u8[3], u8);
void sub_8094A74(u8[3], u8, u32);
extern void nullsub_14();
extern void OpenPartyMenu();
extern void sub_806E6F0();

extern u8 gUnknown_02038470[3];
extern u8 gUnknown_02038473;
extern u8 sub_803FBBC(void);
extern u16 gUnknown_02024A6A[];

void unref_sub_8094928(struct PokemonStorage *ptr)
{
    *ptr = gPokemonStorage;
}

void unref_sub_8094940(struct PokemonStorage *ptr)
{
    gPokemonStorage = *ptr;
}

void sub_8094958(void)
{
    sub_8094998(gUnknown_02038470, sub_803FBBC());
}

void sub_8094978(u8 arg1, u8 arg2)
{
    sub_8094A74((UNK_201606C_ARRAY) + arg1 * 3, arg2, arg1);
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

void sub_8094B6C(u8 a, u8 b, u8 c)
{
    s32 i;
    s32 j;
    u8 temp[6];
    u8 r3;
    u8 r7 = 0;

    if (IsLinkDoubleBattle())
    {
        u8 *arr = ewram + 0x1606C + a * 3;

        for (i = 0, j = 0; i < 3; i++)
        {
            temp[j++] = arr[i] >> 4;
            temp[j++] = arr[i] & 0xF;
        }
        r3 = temp[c];
        for (i = 0; i < 6; i++)
        {
            if (temp[i] == b)
            {
                r7 = temp[i];
                temp[i] = r3;
                break;
            }
        }
        if (i != 6)
        {
            temp[c] = r7;

            arr[0] = (temp[0] << 4) | temp[1];
            arr[1] = (temp[2] << 4) | temp[3];
            arr[2] = (temp[4] << 4) | temp[5];
        }
    }
}

u8 sub_8094C20(u8 a)
{
    u8 retVal;
    u8 val = a & 1;

    a /= 2;
    if (val)
        retVal = gUnknown_02038470[a] & 0xF;
    else
        retVal = gUnknown_02038470[a] >> 4;
    return retVal;
}

void sub_8094C54(u8 a, u8 b)
{
    u8 val = a & 1;

    a /= 2;
    if (val)
        gUnknown_02038470[a] = (gUnknown_02038470[a] & 0xF0) | b;
    else
        gUnknown_02038470[a] = (gUnknown_02038470[a] & 0xF) | (b << 4);
}

void sub_8094C98(u8 a, u8 b)
{
    u8 r4 = sub_8094C20(a);
    u8 r1 = sub_8094C20(b);

    sub_8094C54(a, r1);
    sub_8094C54(b, r4);
}

u8 pokemon_order_func(u8 a)
{
    u8 i;
    u8 r2;

    for (i = 0, r2 = 0; i < 3; i++)
    {
        if ((gUnknown_02038470[i] >> 4) == a)
            return r2;
        r2++;
        if ((gUnknown_02038470[i] & 0xF) == a)
            return r2;
        r2++;
    }
    return 0;
}

void pokemon_change_order(void)
{
    u8 i;

    memcpy(ewram1B000.unk0, gPlayerParty, sizeof(gPlayerParty));
    for (i = 0; i < 6; i++)
    {
        u8 n = pokemon_order_func(i);

        memcpy(&gPlayerParty[n], &ewram1B000.unk0[i], sizeof(struct Pokemon));
    }
}

void sub_8094D60(void)
{
    struct Pokemon temp[6];
    u8 i;

    memcpy(temp, gPlayerParty, sizeof(gPlayerParty));
    for (i = 0; i < 6; i++)
    {
        u8 n = sub_8094C20(i);

        memcpy(&gPlayerParty[n], &temp[i], sizeof(struct Pokemon));
    }
}

void unref_sub_8094DB0(void)
{
    u8 i;
    u8 r4;

    for (i = 1; i < 6; i++)
    {
        u8 n = sub_8094C20(i);

        if (GetMonData(&gPlayerParty[n], MON_DATA_SPECIES) != 0
         && GetMonData(&gPlayerParty[n], MON_DATA_HP) != 0)
        {
            r4 = sub_8094C20(0);
            sub_8094C98(0, i);
            sub_806E6F0(&gPlayerParty[r4], &gPlayerParty[n]);
            break;
        }
    }
}

void sub_8094E20(u8 a)
{
    gPaletteFade.bufferTransferDisabled = TRUE;
    gUnknown_02038473 = a;
    nullsub_14();
    pokemon_change_order();
    OpenPartyMenu(1, 0xFF);
}

void sub_8094E4C(void)
{
    sub_8094E20(3);
}
