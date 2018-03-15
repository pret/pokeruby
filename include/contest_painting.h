#ifndef GUARD_CONTESTPAINTING_H
#define GUARD_CONTESTPAINTING_H

#define MOSAIC_BIT_BG_HSIZE (0)
#define MOSAIC_BIT_BG_VSIZE (4)
#define MOSAIC_BIT_OBJ_HSIZE (8)
#define MOSAIC_BIT_OBJ_VSIZE (12)

enum
{
    NORMAL_RANK,
    SUPER_RANK,
    HYPER_RANK,
    MASTER_RANK,
};

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
    /*0x00*/ u32 personality;
    /*0x04*/ u32 otId;
    /*0x08*/ u16 species;
    /*0x0A*/ u8 contestType;
    /*0x0B*/ u8 pokemon_name[POKEMON_NAME_LENGTH];
    /*0x15*/ u8 pad15;
    /*0x16*/ u8 trainer_name[OT_NAME_LENGTH];
};

struct LabelPair
{
    const u8 *prefix;
    const u8 *suffix;
};

void sub_8106630(u32);
void CB2_ContestPainting(void);

#endif
