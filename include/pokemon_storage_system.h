#ifndef GUARD_POKEMON_STORAGE_SYSTEM_H
#define GUARD_POKEMON_STORAGE_SYSTEM_H

#include "pc_screen_effect.h"
#include "mon_markings.h"

enum {
    PC_TEXT_EXIT_BOX,
    PC_TEXT_WHAT_YOU_DO,
    PC_TEXT_PICK_A_THEME,
    PC_TEXT_PICK_A_WALLPAPER,
    PC_TEXT_IS_SELECTED,
    PC_TEXT_JUMP_TO_WHICH_BOX,
    PC_TEXT_DEPOSIT_IN_WHICH_BOX,
    PC_TEXT_WAS_DEPOSITED,
    PC_TEXT_BOX_IS_FULL,
    PC_TEXT_RELEASE_POKE,
    PC_TEXT_WAS_RELEASED,
    PC_TEXT_BYE_BYE,
    PC_TEXT_MARK_POKE,
    PC_TEXT_LAST_POKE,
    PC_TEXT_PARTY_FULL,
    PC_TEXT_HOLDING_POKE,
    PC_TEXT_WHICH_ONE_WILL_TAKE,
    PC_TEXT_CANT_RELEASE_EGG,
    PC_TEXT_CONTINUE_BOX,
    PC_TEXT_CAME_BACK,
    PC_TEXT_WORRIED,
    PC_TEXT_SURPRISE,
    PC_TEXT_PLEASE_REMOVE_MAIL
};

enum {
    PC_TEXT_FMT_NORMAL,
    PC_TEXT_FMT_MON_NAME,
    PC_TEXT_FMT_UNK_02,
    PC_TEXT_FMT_UNK_03,
    PC_TEXT_FMT_MON_NAME_2,
    PC_TEXT_FMT_UNK_05,
    PC_TEXT_FMT_MON_NAME_AFTER_EXCL_MARK
};

struct PokemonStorageSystemFunc
{
    u8 (*func)(void);
    s8 unk4;
};

struct StorageAction {
    const u8 *text;
    u8 format;
};

struct StorageText {
    const u8 *text;
    int textId;
};

struct PSS_MenuStringPtrs {
    const u8 *text;
    const u8 *desc;
};

struct UnkStruct_2000028 {
    const u8 *unk_00;
    u8 *unk_04;
    u16 unk_08;
    u16 unk_0a;
    void (*unk_0c)(struct UnkStruct_2000028 *data);
};

struct UnkStruct_2000020 {
    struct UnkStruct_2000028 *unk_00;
    u8 unk_04;
    u8 unk_05;
};

struct UnkPSSStruct_2002370 {
    struct Sprite *unk_0000;
    struct Sprite *unk_0004[4];
    u32 unk_0014[3];
    struct Sprite *unk_0020[2];
    u8 filler_0028[0x214];
    u8 curBox;
    u8 unk_023d;
    u8 unk_023e;
    u16 unk_0240;
    u16 unk_0242;
}; // 0244

struct PokemonStorageSystemData {
    void (*unk_0000)(void);
    u8 unk_0004;
    u8 unk_0005;
    u8 unk_0006;
    u8 unk_0007;
    u16 unk_0008;
    u16 unk_000a;
    struct PCScreenEffectStruct unk_000c;
    struct UnkStruct_2000020 unk_0020;
    struct UnkStruct_2000028 unk_0028[8];
    u8 unk_00a8[0x800];
    u16 unk_08a8;
    u16 unk_08aa;
    u8 unk_08ac;
    u8 unk_08ad;
    u8 unk_08ae;
    u8 unk_08af;
    u8 unk_08b0;
    bool8 unk_08b1;
    s16 unk_08b2;
    u16 unk_08b4;
    u16 unk_08b6;
    u16 unk_08b8;
    bool8 unk_08ba;
    u8 unk_08bb;
    u16 unk_08bc;
    u16 unk_08be;
    u16 unk_08c0;
    u16 unk_08c2;
    u16 unk_08c4;
    u16 unk_08c6;
    u16 unk_08c8;
    u8 unk_08ca[0x400];
    u8 unk_0cca;
    u16 unk_0ccc[0x10];
    u16 unk_0cec;
    u16 unk_0cee;
    struct Sprite *unk_0cf0[2];
    struct Sprite *unk_0cf8[2];
    struct Sprite *unk_0d00[2];
    u32 unk_0d08;
    u8 filler_0d0c[0x50];
    u16 unk_0d5c;
    s16 unk_0d5e;
    s16 unk_0d60;
    u16 unk_0d62[360];
    u8 unk_1032;
    struct Sprite *unk_1034;
    struct Sprite *unk_1038[6]; // party
    struct Sprite *unk_1050[30]; // box
    struct Sprite **unk_10c8;
    struct Sprite **unk_10cc;
    u16 unk_10d0[40];
    u16 unk_1120[40];
    u8 unk_1170;
    u8 unk_1171;
    u16 unk_1172;
    s16 unk_1174;
    s16 unk_1176;
    u16 unk_1178;
    u8 unk_117a;
    s8 unk_117b;
    u8 unk_117c;
    u8 unk_117d;
    u8 filler_117e[2];
    struct StorageText unk_1180[6];
    u8 filler_11b0[8];
    u8 unk_11b8;
    u8 unk_11b9;
    u16 unk_11ba;
    u16 unk_11bc;
    u8 filler_11be;
    struct Sprite *unk_11c0;
    struct Sprite *unk_11c4;
    s32 unk_11c8;
    s32 unk_11cc;
    s32 unk_11d0;
    s32 unk_11d4;
    s16 unk_11d8;
    s16 unk_11da;
    u16 unk_11dc;
    s8 unk_11de;
    s8 unk_11df;
    u8 unk_11e0;
    u8 unk_11e1;
    u8 unk_11e2;
    u8 unk_11e3;
    u8 unk_11e4[4];
    const u8 *unk_11e8;
    u32 unk_11ec;
    u16 unk_11f0;
    u16 unk_11f2;
    u8 filler_11f4[2];
    u8 unk_11f6;
    u8 unk_11f7;
    u8 unk_11f8;
    u8 unk_11f9;
    u8 unk_11fa[0x15];
    u8 unk_120f[0x25];
    u8 unk_1234[0x25];
    u8 unk_1259[0x21];
    u8 unk_127a[0x2a];
    bool8 (*unk_12a4)(void);
    u8 unk_12a8;
    u8 unk_12a9;
    struct Sprite *unk_12ac;
    struct Sprite *unk_12b0[2];
    u16 *unk_12b8;
    struct PokemonMarkMenu unk_12bc;
    struct UnkPSSStruct_2002370 unk_2370;
    struct Pokemon unk_25b4;
    struct Pokemon unk_2618;
    u8 unk_267c;
    u8 unk_267d;
    u8 unk_267e;
    u8 unk_267f;
    s8 unk_2680;
    s8 unk_2681;
    s8 unk_2682;
    s8 unk_2683;
    u16 unk_2684;
    u16 unk_2686[3];
    u8 unk_268c;
    u8 unk_268d;
    u8 unk_268e;
    union {
        struct Pokemon *pokemon;
        struct BoxPokemon *box;
    } unk_2690;
    u8 unk_2694[18];
    u8 unk_26a6[62];
    u8 unk_26e4[0x16];
    u16 unk_26fa;
    u16 *unk_26fc;
    struct Sprite *unk_2700;
    u16 unk_2704[0x10];
    u8 filler_2724[0x60];
    u8 unk_2784[0x800];
    u8 filler_2f84[0x1800];
    u8 unk_4784[0x800];
};

extern u8 gUnknown_02039760[0xC00];
extern struct UnkPSSStruct_2002370 *gUnknown_02038478;
extern struct PokemonStorageSystemData *const gPokemonStorageSystemPtr;
extern u8 *const gUnknown_083B6DB8;

u8 StorageSystemGetPartySize(void);
s16 GetIndexOfFirstEmptySpaceInBoxN(u8 boxId);
u8 CountAlivePartyMonsExceptOne(u8 toSkip);
u8 CountPokemonInBoxN(u8 boxId);
void sub_8096264(struct UnkPSSStruct_2002370 *a0, u16 tileTag, u16 palTag, u8 a3);
void sub_809634C(u8 curBox);
u8 sub_8096368(void);
void sub_809635C(void);
void sub_8096310(void);
void sub_80961A8(void);
void task_intro_29(u8 whichMenu);
void ResetPokemonStorageSystem(void);
void ResetPSSMonIconSprites(void);
void SpawnBoxIconSprites(u8 boxId);
u8 get_preferred_box(void);
void sub_8098BF0(void);
void sub_8098D20(u8 monId);
bool8 sub_80990AC(void);
void sub_8099200(bool8 a0);
void sub_8099310(void);
bool8 sub_8099374(void);
void sub_8099480(void);
void sub_80994A8(s16 a0);
void sub_8099520(u8 a0);
void sub_809954C(void);
void sub_8099584(u8 a0, u8 a1);
void sub_809960C(u8 a0, u8 a1);
void sub_80996B0(u8 a0, u8 a1);
bool8 sub_809971C(void);
void sub_809981C(u8 mode, u8 idx);
bool8 sub_80998D8(void);
void sub_8099920(void);
void sub_8099958(void);
bool8 sub_8099990(void);
struct Sprite *sub_809A9A0(u16 x, u16 y, u8 animId, u8 priority, u8 subpriority);
void sub_8099BF8(u8 a0);
void sub_8099C70(u8 whichBox);
bool8 sub_8099D34(void);
void sub_8099DCC(u8 a0);
bool8 sub_8099E08(void);
void sub_809A860(bool8 a0);
void sub_809AA24(void);
void sub_809AA98(void);
bool8 sub_809AC00(void);
void sub_809B0C0(u8 a0);
void sub_809B0D4(void);
void sub_809B0E0(void);
u8 sub_809B0F4(void);
void sub_809B068(void);
void sub_809B100(u8 a0);
bool8 sub_809B130(void);
void sub_809B440(void);
bool8 sub_809B62C(u8);
void sub_809B6BC(void);
void sub_809B6DC(void);
bool8 sub_809B734(void);
void sub_809B760(void);
void sub_809B7AC(void);
void sub_809B7D4(void);
s8 sub_809B960(void);
void sub_809BB90(void);
void sub_809BBC0(void);
void sub_809BC18(void);
void sub_809BD14(void);
s16 party_compaction(void);
void sub_809BDD8(u8 markings);
bool8 sub_809BE80(void);
bool8 sub_809BEBC(void);
bool8 sub_809BF20(void);
bool8 sub_809BF48(void);
u8 sub_809CA40(void);
void sub_809CDCC(void);
void sub_809CDEC(u8 a0);
void sub_809CE84(void);
s16 sub_809CF30(void);
void sub_809CFDC(struct UnkStruct_2000020 *a0, struct UnkStruct_2000028 *a1, u8 a2);
void sub_809CFF0(void);
bool8 sub_809D034(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height);
void sub_809D104(u8 *dest, u16 dLeft, u16 dTop, const u8 *src, u16 sLeft, u16 sTop, u16 width, u16 height);
bool8 sub_809D16C(void *dest, u16 dLeft, u16 dTop, u16 width, u16 height);
void ShowPokemonStorageSystem(void);

void debug_sub_80A433C(struct Pokemon *pokemon, void (*func)(void));

#endif // GUARD_POKEMON_STORAGE_SYSTEM_H
