#ifndef GUARD_CONTESTPAINTING_H
#define GUARD_CONTESTPAINTING_H

#define MOSAIC_BIT_BG_HSIZE (0)
#define MOSAIC_BIT_BG_VSIZE (4)
#define MOSAIC_BIT_OBJ_HSIZE (8)
#define MOSAIC_BIT_OBJ_VSIZE (12)

enum
{
    CONTEST_COOL,
    CONTEST_BEAUTY,
    CONTEST_CUTE,
    CONTEST_SMART,
    CONTEST_TOUGH,
};

enum
{
    CONTESTRESULT_COOL = 9,
    CONTESTRESULT_BEAUTY = 13,
    CONTESTRESULT_CUTE = 2,
    CONTESTRESULT_SMART = 36,
    CONTESTRESULT_TOUGH = 6,
};

struct Unk2015E00
{
    u16 unk2015e00[128][32];
    u16 unk2017e00[0];
};

struct ContestEntry
{
    /*0x00*/ u8 var0;
    /*0x04*/ u32 var4;
    /*0x08*/ u16 var8;
    /*0x0A*/ u8 contestType;
    /*0x0B*/ u8 pokemon_name[POKEMON_NAME_LENGTH];
    /*0x15*/ u8 pad15;
    /*0x16*/ u8 trainer_name[OT_NAME_LENGTH];
};

struct Unk3000756
{
    /*0x00*/ u8 var_0;
};

struct LabelPair
{
    const u8 *prefix;
    const u8 *suffix;
};

struct Unk03005E20
{
    u8 var_0;
    u8 pad1[3];
    u16 (*var_4)[][32];
    u16 (*var_8)[];
    u8 pad0C[4];
    u32 var_10;
    u16 var_14;
    u16 var_16;
    u8 var_18;
    u8 var_19;
    u8 var_1A;
    u8 var_1B;
    u8 var_1C;
    u8 var_1D;
    u8 var_1E;
    u8 var_1F;
};

void sub_8106630(u32);

#endif
