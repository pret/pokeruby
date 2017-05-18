#include "global.h"
#include "asm.h"
#include "battle.h"
#include "main.h"
#include "text.h"
#include "palette.h"
#include "sprite.h"
#include "task.h"
#include "pokemon.h"
#include "species.h"
#include "link.h"
#include "name_string_util.h"
#include "battle_setup.h"
#include "rng.h"
#include "sound.h"
#include "songs.h"
#include "trig.h"
#include "abilities.h"

struct MonCoords
{
    u8 x, y;
};

struct UnknownStruct5
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
};

struct UnknownStruct6
{
    u16 unk0[0xA0];
    u8 fillerA0[0x640];
    u16 unk780[0xA0];
};

struct UnknownStruct7
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
};

struct UnknownStruct8
{
    u8 unk0[7];
    u8 unk7;
    u8 unk8[18];
    u8 unk1A;
};

struct UnknownPokemonStruct2
{
    /*0x00*/ u16 species;
    /*0x02*/ u16 heldItem;
    /*0x04*/ u8 nickname[11];
    /*0x0F*/ u8 level;
    /*0x10*/ u16 hp;
    /*0x12*/ u16 maxhp;
    /*0x14*/ u32 status;
    /*0x18*/ u32 personality;
    /*0x1C*/ u8 gender;
    /*0x1D*/ u8 language;
};

struct UnknownStruct9
{
    u8 unk0;
    u16 unk2;
};

struct UnknownStruct10
{
    u8 unk0_0:1;
    u8 unk0_1:1;
    u8 unk0_2:1;
    u8 filler1[1];
    u8 unk2;
    u8 unk3;
    u8 filler4[8];
};

struct UnknownStruct11
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5_0:1;
    u8 unk5_1:1;
    u16 unk6;
    u8 unk8[10];
    u8 unk12;
    u8 unk13;
    u8 unk14[10];
    u8 filler1E[2];
    u16 unk20;
    u16 unk22;
    u16 unk24;
    u16 unk26;
    u16 unk28;
    u8 unk2A[10];
    u8 filler34[2];
    u8 unk36[10];
};

struct UnknownStruct12
{
    u32 unk0;
    u8 filler4[0x54];
};

struct UnknownStruct13
{
    u32 unk0_0:1;
    u32 unk0_1:1;
    u32 unk0_2:1;
    u32 unk0_3:1;
    u32 unk0_4:1;
    u32 unk0_5:1;
    u32 unk0_6:1;
    u32 unk0_7:1;
    u32 unk1_0:1;
    u32 unk1_1:1;
    u32 unk1_2:1;
    u32 unk1_3:2;
    u32 unk1_5:1;
    u32 unk1_6:1;
    u32 unk1_7:1;
    u32 unk2_0:1;
    u32 unk2_1:1;
    u32 unk2_2:1;
    u32 unk2_3:1;
    u8 filler4[12];
};

extern const struct UnknownStruct5 gUnknown_081F9674;
extern const u8 gUnknown_081F96C8[];
extern void *const gUnknown_081FAF4C[];
extern const u16 gUnknown_08D004E0[];
extern const struct Trainer gTrainers[];
extern const u8 gSpeciesNames[][11];
extern const struct BattleMove gBattleMoves[];
extern const struct MonCoords gMonFrontPicCoords[];
extern const struct MonCoords gCastformFrontSpriteCoords[];
extern const struct BaseStats gBaseStats[];
extern const u32 gBitTable[];

extern u8 ewram[];
#define ewram0 (*(struct UnknownStruct7 *)(ewram + 0x0))
#define ewram4 (*(struct UnknownStruct8 *)(ewram + 0x4))
#define ewram16000 (ewram[0x16000])
#define ewram16001 (ewram[0x16001])
#define ewram16002 (ewram[0x16002])
#define ewram16003 (ewram[0x16003])
#define ewram1600C (ewram[0x1600C])
#define ewram1600E (ewram[0x1600E])
#define ewram1601B (ewram[0x1601B])
#define ewram16020 ((u8 *)(ewram + 0x16020))
#define ewram16056 (ewram[0x16056])
#define ewram16058 (ewram[0x16058])
#define ewram16059 (ewram[0x16059])
#define ewram16078 (ewram[0x16078])
#define ewram16084 (ewram[0x16084])
#define ewram16086 (ewram[0x16086])
#define ewram16087 (ewram[0x16087])
#define ewram16088 (ewram[0x16088])
#define ewram16089 (ewram[0x16089])
#define ewram160A1 (ewram[0x160A1])
#define ewram160A6 (ewram[0x160A6])
#define ewram160AC ((u8 *)(ewram + 0x160AC))
#define ewram160BC ((u16 *)(ewram + 0x160BC))  // hp
#define ewram160C8 (ewram[0x160C8])
#define ewram160C9 (ewram[0x160C9])
#define ewram160CB (ewram[0x160CB])
#define ewram160CC ((u8 *)(ewram + 0x160CC))
#define ewram160E6 (ewram[0x160E6])
#define ewram160E8 ((u8 *)(ewram + 0x160E8))
#define ewram160F0 ((u8 *)(ewram + 0x160F0))
#define ewram160F9 (ewram[0x160F9])
#define ewram16100 ((u8 *)(ewram + 0x16100))
#define ewram16108 ((u8 *)(ewram + 0x16108))
#define ewram16110 (ewram[0x16110])
#define ewram16111 (ewram[0x16111])
#define ewram16113 (ewram[0x16113])
#define ewram17100 ((u32 *)(ewram + 0x17100))
#define ewram17130 (ewram[0x17130])
#define ewram17160 (ewram[0x17160])
#define ewram17800 ((struct UnknownStruct9 *)(ewram + 0x17800))
#define ewram17810 ((struct UnknownStruct10 *)(ewram + 0x17810))
#define ewram1D000 ((struct Pokemon *)(ewram + 0x1D000))

extern struct UnknownPokemonStruct2 gUnknown_02023A00[];
extern u8 gUnknown_02024260[][0x200];
extern u8 gUnknown_02024A60;
extern u32 gUnknown_02024A64;
extern u8 gUnknown_02024A68;
extern u16 gUnknown_02024A6A[];
extern u8 gUnknown_02024A7F;
extern u8 gUnknown_02024A7A[];
extern struct UnknownStruct12 gUnknown_02024AD0[];
extern u8 gUnknown_02024BE0[];
extern u16 gUnknown_02024BE6;
extern u8 byte_2024C06;
extern u8 gUnknown_02024C0B;
extern u8 gUnknown_02024C0C;
extern u8 gUnknown_02024C0E;
extern u8 gUnknown_02024C18[];
extern u16 gUnknown_02024C2C[];
extern u16 gUnknown_02024C34[];
extern u16 gUnknown_02024C3C[];
extern u16 gUnknown_02024C44[];
extern u16 gUnknown_02024C4C[];
extern u16 gUnknown_02024C54[];
extern u8 gUnknown_02024C5C[];
extern u16 gUnknown_02024C60[];
extern u32 gUnknown_02024C6C;
extern u8 gUnknown_02024C70[];
extern u16 gUnknown_02024C7A[];
extern u8 gUnknown_02024C80[][12];
extern u32 gUnknown_02024C98[];
//extern u8 gUnknown_02024CA8[][0x1C];
extern u16 gUnknown_02024D18;
extern u16 gUnknown_02024D1A;
extern u16 gUnknown_02024D1C;
extern u8 gUnknown_02024D1E[];
extern u8 gUnknown_02024D1F[];  // I don't actually know what type this is.
extern u8 gUnknown_02024D26;
extern struct UnknownStruct13 gUnknown_02024D28[];
extern u8 gUnknown_02024DBC[];
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E60[];
extern u8 gUnknown_02024E64[];
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030041B8;
extern struct Window gUnknown_030041D0;
extern u16 gUnknown_03004200;
extern struct Window gUnknown_03004210;
extern u16 gUnknown_03004244;
extern struct Window gUnknown_03004250;
extern u16 gUnknown_03004240;
extern u16 gUnknown_03004280;
extern u32 gUnknown_03004284;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030042C4;
extern MainCallback gUnknown_030042D0;
extern void (*gUnknown_030042D4)(void);
extern struct UnknownStruct11 gUnknown_030042E0;
extern u8 gUnknown_03004324;
extern void (*gUnknown_03004330[])(void);
extern u8 gUnknown_03004340[];
extern struct UnknownStruct6 gUnknown_03004DE0;
//extern u16 gUnknown_03004DE0[][0xA0];  // possibly?
extern u16 gBattleTypeFlags;
extern s8 gBattleTerrain;  // I'm not sure if this is supposed to be s8 or u8. Regardless, it must have the same type as the return value of GetBattleTerrain.
extern u8 gReservedSpritePaletteCount;
extern u16 gTrainerBattleOpponent;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];
extern u8 gBattleMonForms[];
extern u8 gPlayerMonIndex;
extern u8 gEnemyMonIndex;
extern u16 gBattleWeather;
extern u32 gBattleMoveDamage;
extern struct BattlePokemon gBattleMons[];
extern u8 gBattleMoveFlags;

extern void sub_800B858(void);
extern void dp12_8087EA4(void);
extern void sub_80895F8();
extern void sub_800D6D4();
extern void sub_800DAB8();
extern void sub_800E23C();
extern void setup_poochyena_battle();
extern void SetWildMonHeldItem(void);
extern void AdjustFriendship(struct Pokemon *, u8);
extern void sub_800DE30(u8);
extern void sub_800B950(void);
extern u8 battle_load_something();
extern void OpenPartyMenu();
extern void sub_8089668();
extern void sub_800D74C();
extern void sub_804777C(u8);
extern void sub_8043DFC();
extern u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
extern void dp01_build_cmdbuf_x00_a_b_0(u8 a, u8 b, u8 c);
extern void dp01_build_cmdbuf_x04_4_4_4(u8 a);
extern void dp01_build_cmdbuf_x07_7_7_7(u8 a);
extern void dp01_build_cmdbuf_x2E_a(u8 a, u8 b);
extern void dp01_build_cmdbuf_x2F_2F_2F_2F(u8 a);
extern void dp01_build_cmdbuf_x30_TODO(u8 a, u8 *b, u8 c);
extern void dp01_battle_side_mark_buffer_for_execution();
extern u8 sub_8090D90();
extern void sub_800C704(u8, u8, u8);
extern u8 sub_8018324();
extern u8 sub_801A02C();
extern u8 sub_8015DFC();
extern u8 sub_8016558();
extern u8 sub_80173A4();
extern u8 sub_80170DC();
extern u8 ItemId_GetHoldEffect(u16);

void sub_800E7F8(void);
void sub_800EC9C(void);
void sub_800F104(void);
void sub_800F298(void);
void sub_800F808(void);
void sub_800F838(struct Sprite *);
u8 CreateNPCTrainerParty(struct Pokemon *, u16);
void sub_800FCFC(void);
void sub_8010824(void);
void sub_80101B8(void);
void c2_081284E0(void);
void sub_8010278(struct Sprite *);
void sub_80102AC(struct Sprite *);
void nullsub_37(struct Sprite *);
void sub_8010320(struct Sprite *);
void sub_8010494(struct Sprite *);
void sub_801053C(struct Sprite *);
void oac_poke_ally_(struct Sprite *);
void nullsub_86(struct Sprite *);
void objc_dp11b_pingpong(struct Sprite *);
void sub_8010874(void);
void bc_8012FAC(void);
void bc_load_battlefield(void);
void sub_8011384(void);
void bc_801333C(void);
void bc_battle_begin_message(void);
void bc_8013568(void);
void sub_8011800(void);
void sub_8011834(void);
void bc_801362C(void);
void sub_8011970(void);
void sub_80119B4(void);
void sub_8011B00(void);
void sub_8011E8C(void);
void sub_8012324(void);
void sub_8012FBC(u8, u8);
u8 b_first_side();
void sub_801365C(u8);
void sub_801377C(void);
void sub_80138F0(void);
void b_cancel_multi_turn_move_maybe(u8);
void b_std_message();
void sub_80156DC();

void sub_800E7C4(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        sub_800B858();
        SetMainCallback2(sub_800F104);
        gUnknown_02024D1E[0] = 0;
    }
    else
    {
        sub_800E7F8();
    }
}

void sub_800E7F8(void)
{
    s32 i;

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);

    CpuFill32(0, (void *)VRAM, VRAM_SIZE);

    REG_MOSAIC = 0;
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0x5051;
    REG_WININ = 0;
    REG_WINOUT = 0;
    gUnknown_030042C4 = 0xF0;
    gUnknown_03004240 = 0x5051;
    dp12_8087EA4();

    for (i = 0; i < 80; i++)
    {
        gUnknown_03004DE0.unk0[i] = 0xF0;
        gUnknown_03004DE0.unk780[i] = 0xF0;
    }
    for (i = 80; i < 160; i++)
    {
        asm(""::"r"(i));  // Needed to stop the compiler from optimizing out the loop counter
        gUnknown_03004DE0.unk0[i] = 0xFF10;
        gUnknown_03004DE0.unk780[i] = 0xFF10;
    }
    sub_80895F8(gUnknown_081F9674.unk0, gUnknown_081F9674.unk4, gUnknown_081F9674.unk8);
    SetUpWindowConfig(&gWindowConfig_81E6C58);
    ResetPaletteFade();
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 0;
    gUnknown_030041B8 = 0;
    gBattleTerrain = GetBattleTerrain();
    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C58);
    InitWindowFromConfig(&gUnknown_030041D0, &gWindowConfig_81E71D0);
    InitWindowFromConfig(&gUnknown_03004250, &gWindowConfig_81E71EC);
    sub_800D6D4();
    sub_800DAB8();
    ResetSpriteData();
    ResetTasks();
    sub_800E23C();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;
    SetVBlankCallback(sub_800FCFC);
    setup_poochyena_battle();
    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        SetMainCallback2(sub_800F298);
    else
        SetMainCallback2(sub_800EC9C);
    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        CreateNPCTrainerParty(gEnemyParty, gTrainerBattleOpponent);
        SetWildMonHeldItem();
    }
    gMain.inBattle = TRUE;
    for (i = 0; i < 6; i++)
        AdjustFriendship(&gPlayerParty[i], 3);
    gUnknown_02024D1E[0] = 0;
}

void sub_800E9EC(void)
{
    u16 r6 = 0;
    u16 species;
    u16 hp;
    u32 status;
    s32 i;

    for (i = 0; i < 6; i++)
    {
        species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
        status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r6 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r6 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r6 |= 3 << i * 2;
    }
    ewram0.unk2 = r6;
    ewram0.unk3 = r6 >> 8;
}

void sub_800EAAC(void)
{
    s32 i;
    struct UnknownStruct8 *_ewram4 = &ewram4;

    for (i = 0; i < 7; i++)
        _ewram4->unk0[i] = gSaveBlock1.enigmaBerry.berry.name[i];
    for (i = 0; i < 18; i++)
        _ewram4->unk8[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
    _ewram4->unk7 = gSaveBlock1.enigmaBerry.holdEffect;
    _ewram4->unk1A = gSaveBlock1.enigmaBerry.holdEffectParam;
}

void sub_800EB08(void)
{
    s32 i;
    s32 j;

    if (!(gBattleTypeFlags & BATTLE_TYPE_LINK))
    {
        for (i = 0; i < 7; i++)
        {
            gEnigmaBerries[0].name[i] = gSaveBlock1.enigmaBerry.berry.name[i];
            gEnigmaBerries[2].name[i] = gSaveBlock1.enigmaBerry.berry.name[i];
        }
        for (i = 0; i < 18; i++)
        {
            gEnigmaBerries[0].itemEffect[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
            gEnigmaBerries[2].itemEffect[i] = gSaveBlock1.enigmaBerry.itemEffect[i];
        }
        gEnigmaBerries[0].holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
        gEnigmaBerries[2].holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
        gEnigmaBerries[0].holdEffectParam = gSaveBlock1.enigmaBerry.holdEffectParam;
        gEnigmaBerries[2].holdEffectParam = gSaveBlock1.enigmaBerry.holdEffectParam;
    }
    else
    {
        s32 numPlayers;
        struct BattleEnigmaBerry *src;
        u8 r4;

        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            numPlayers = 4;
        else
            numPlayers = 2;
        for (i = 0; i < numPlayers; i++)
        {
            src = (struct BattleEnigmaBerry *)(gBlockRecvBuffer[i] + 2);
            r4 = gLinkPlayers[i].lp_field_18;

            for (j = 0; j < 7; j++)
                gEnigmaBerries[r4].name[j] = src->name[j];
            for (j = 0; j < 18; j++)
                gEnigmaBerries[r4].itemEffect[j] = src->itemEffect[j];
            gEnigmaBerries[r4].holdEffect = src->holdEffect;
            gEnigmaBerries[r4].holdEffectParam = src->holdEffectParam;
        }
    }
}

void shedinja_something(struct Pokemon *pkmn)
{
    u8 nickname[POKEMON_NAME_LENGTH + 1];
    u8 language = 1;

    if (GetMonData(pkmn, MON_DATA_SPECIES) == SPECIES_SHEDINJA
     && GetMonData(pkmn, MON_DATA_LANGUAGE) != language)
    {
        GetMonData(pkmn, MON_DATA_NICKNAME, nickname);
        if (StringCompareWithoutExtCtrlCodes(nickname, gUnknown_081F96C8) == 0)
            SetMonData(pkmn, MON_DATA_LANGUAGE, &language);
    }
}

void sub_800EC9C(void)
{
    u8 playerId;
    u8 enemyId;

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    enemyId = playerId ^ 1;

    switch (gUnknown_02024D1E[0])
    {
    case 0:
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
            {
                ewram0.unk0 = 1;
                ewram0.unk1 = 1;
                sub_800E9EC();
                sub_800EAAC();
                SendBlock(bitmask_all_link_players_but_self(), &ewram0, 32);
                gUnknown_02024D1E[0] = 1;
            }
        }
        else
        {
            gBattleTypeFlags |= BATTLE_TYPE_WILD;
            gUnknown_02024D1E[0] = 8;
            sub_800EB08();
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            s32 id;
            u8 taskId;

            ResetBlockReceivedFlags();
            id = 0;
            if (gBlockRecvBuffer[0][0] == 0x100)
            {
                if (playerId == 0)
                    gBattleTypeFlags |= 12;
                else
                    gBattleTypeFlags |= 8;
                id++;
            }
            if (id == 0)
            {
                if (gBlockRecvBuffer[0][0] == gBlockRecvBuffer[1][0])
                {
                    if (playerId == 0)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                    id++;
                }
                if (id == 0)
                {
                    while (id < 2)
                    {
                        if (gBlockRecvBuffer[id][0] > 0x0101 && id != playerId)
                            break;
                        id++;
                    }
                    if (id == 2)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                }
            }
            sub_800EB08();
            taskId = CreateTask(sub_800DE30, 0);
            gTasks[taskId].data[1] = 0x10E;
            gTasks[taskId].data[2] = 0x5A;
            gTasks[taskId].data[5] = 0;
            gTasks[taskId].data[3] = ewram0.unk2 | (ewram0.unk3 << 8);
            gTasks[taskId].data[4] = gBlockRecvBuffer[enemyId][1];
            gUnknown_02024D1E[0]++;
        }
        break;
    case 2:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty, sizeof(*gPlayerParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 3:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 4:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty + 2, sizeof(*gPlayerParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 5:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty + 2, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 6:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), gPlayerParty + 4, sizeof(*gPlayerParty) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 7:
        if ((GetBlockReceivedStatus() & 3) == 3)
        {
            ResetBlockReceivedFlags();
            memcpy(gEnemyParty + 4, gBlockRecvBuffer[enemyId], sizeof(*gEnemyParty) * 2);
            shedinja_something(&gEnemyParty[0]);
            shedinja_something(&gEnemyParty[1]);
            shedinja_something(&gEnemyParty[2]);
            shedinja_something(&gEnemyParty[3]);
            shedinja_something(&gEnemyParty[4]);
            shedinja_something(&gEnemyParty[5]);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 8:
        sub_800B950();
        gUnknown_02024D1E[0]++;
        gUnknown_02024D1E[1] = 0;
        gUnknown_02024D1E[2] = 0;
        break;
    case 9:
        if (battle_load_something(gUnknown_02024D1F, gUnknown_02024D1F + 1) != 0)
        {
            gUnknown_030042D0 = gMain.callback1;
            gMain.callback1 = sub_8010824;
            SetMainCallback2(sub_800F808);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                gTrainerBattleOpponent = 0x800;
                gBattleTypeFlags |= BATTLE_TYPE_20;
            }
        }
        break;
    }
}

void sub_800F02C(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
    {
        u8 *nickname = gUnknown_02023A00[i].nickname;

        gUnknown_02023A00[i].species     = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES);
        gUnknown_02023A00[i].heldItem    = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        GetMonData(&gPlayerParty[i], MON_DATA_NICKNAME, nickname);
        gUnknown_02023A00[i].level       = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
        gUnknown_02023A00[i].hp          = GetMonData(&gPlayerParty[i], MON_DATA_HP);
        gUnknown_02023A00[i].maxhp       = GetMonData(&gPlayerParty[i], MON_DATA_MAX_HP);
        gUnknown_02023A00[i].status      = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
        gUnknown_02023A00[i].personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
        gUnknown_02023A00[i].gender      = GetMonGender(&gPlayerParty[i]);
        StripExtCtrlCodes(nickname);
        gUnknown_02023A00[i].language    = GetMonData(&gPlayerParty[i], MON_DATA_LANGUAGE);
        if (gUnknown_02023A00[i].language != 1)
            PadNameString(nickname, 0);
    }
    memcpy(ewram, gUnknown_02023A00, 0x60);
}

void sub_800F104(void)
{
    u8 playerId;
    MainCallback *pSavedCallback;
    u16 *pSavedBattleTypeFlags;

    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    // Seriously, Game Freak?
    pSavedCallback = (MainCallback *)(ewram + 0x160C4);
    pSavedBattleTypeFlags = (u16 *)(ewram + 0x160C2);
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();

    switch (gUnknown_02024D1E[0])
    {
    case 0:
        if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
        {
            sub_800F02C();
            SendBlock(bitmask_all_link_players_but_self(), ewram, 0x60);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            s32 i;

            ResetBlockReceivedFlags();
            for (i = 0; i < 4; i++)
            {
                if (i != playerId)
                {
                    if ((!(gLinkPlayers[i].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[i].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                        memcpy(gUnknown_02023A00, gBlockRecvBuffer[i], 0x60);
                }
            }
            gUnknown_02024D1E[0]++;
            *pSavedCallback = gMain.savedCallback;
            *pSavedBattleTypeFlags = gBattleTypeFlags;
            gMain.savedCallback = sub_800F104;
            OpenPartyMenu(5, 0);
        }
        break;
    case 2:
        if (!gPaletteFade.active)
        {
            gUnknown_02024D1E[0] = 3;
            sub_800832C();
        }
        break;
    case 3:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            gBattleTypeFlags = *pSavedBattleTypeFlags;
            gMain.savedCallback = *pSavedCallback;
            SetMainCallback2(sub_800E7F8);
        }
        break;
    }
}

void sub_800F298(void)
{
    u8 playerId;
    s32 id;

    playerId = GetMultiplayerId();
    ewram160CB = playerId;
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    switch (gUnknown_02024D1E[0])
    {
    case 0:
        if (gReceivedRemoteLinkPlayers != 0 && sub_8007ECC())
        {
            ewram0.unk0 = 1;
            ewram0.unk1 = 1;
            sub_800E9EC();
            sub_800EAAC();
            SendBlock(bitmask_all_link_players_but_self(), ewram, 0x20);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 1:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            u8 taskId;

            ResetBlockReceivedFlags();
            id = 0;
            if (gBlockRecvBuffer[0][0] == 0x100)
            {
                if (playerId == 0)
                    gBattleTypeFlags |= 12;
                else
                    gBattleTypeFlags |= 8;
                id++;
            }
            if (id == 0)
            {
                s32 i;

                for (i = 0; i < MAX_LINK_PLAYERS; i++)
                {
                    if (gBlockRecvBuffer[0][0] != gBlockRecvBuffer[i][0])
                        break;
                }
                if (i == MAX_LINK_PLAYERS)
                {
                    if (playerId == 0)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                    id++;
                }
                if (id == 0)
                {
                    while (id < MAX_LINK_PLAYERS)
                    {
                        if (gBlockRecvBuffer[id][0] == 0x0101 && id != playerId)
                            if (id < playerId)
                                break;
                        if (gBlockRecvBuffer[id][0] > 0x0101 && id != playerId)
                            break;
                        id++;
                    }
                    if (id == MAX_LINK_PLAYERS)
                        gBattleTypeFlags |= 12;
                    else
                        gBattleTypeFlags |= 8;
                }
            }
            sub_800EB08();
            memcpy(ewram1D000, gPlayerParty, sizeof(struct Pokemon) * 3);
            taskId = CreateTask(sub_800DE30, 0);
            gTasks[taskId].data[1] = 0x10E;
            gTasks[taskId].data[2] = 0x5A;
            gTasks[taskId].data[5] = 0;
            gTasks[taskId].data[3] = 0;
            gTasks[taskId].data[4] = 0;
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                switch (gLinkPlayers[id].lp_field_18)
                {
                case 0:
                    gTasks[taskId].data[3] |= gBlockRecvBuffer[id][1] & 0x3F;
                    break;
                case 1:
                    gTasks[taskId].data[4] |= gBlockRecvBuffer[id][1] & 0x3F;
                    break;
                case 2:
                    gTasks[taskId].data[3] |= (gBlockRecvBuffer[id][1] & 0x3F) << 6;
                    break;
                case 3:
                    gTasks[taskId].data[4] |= (gBlockRecvBuffer[id][1] & 0x3F) << 6;
                    break;
                }
            }
            ZeroPlayerPartyMons();
            ZeroEnemyPartyMons();
            gUnknown_02024D1E[0]++;
            goto step_2;
        }
        break;
    case 2:
      step_2:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), ewram1D000, sizeof(struct Pokemon) * 2);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 3:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                if (id == playerId)
                {
                    switch (gLinkPlayers[id].lp_field_18)
                    {
                    case 0:
                    case 3:
                        memcpy(gPlayerParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                        break;
                    case 1:
                    case 2:
                        memcpy(gPlayerParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                        break;
                    }
                }
                else
                {
                    if ((!(gLinkPlayers[id].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[id].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gPlayerParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        case 1:
                        case 2:
                            memcpy(gPlayerParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        }
                    }
                    else
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gEnemyParty, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        case 1:
                        case 2:
                            memcpy(gEnemyParty + 3, gBlockRecvBuffer[id], sizeof(struct Pokemon) * 2);
                            break;
                        }
                    }
                }
            }
            gUnknown_02024D1E[0]++;
        }
        break;
    case 4:
        if (sub_8007ECC())
        {
            SendBlock(bitmask_all_link_players_but_self(), ewram1D000 + 2, sizeof(struct Pokemon));
            gUnknown_02024D1E[0]++;
        }
        break;
    case 5:
        if ((GetBlockReceivedStatus() & 0xF) == 0xF)
        {
            ResetBlockReceivedFlags();
            for (id = 0; id < MAX_LINK_PLAYERS; id++)
            {
                if (id == playerId)
                {
                    switch (gLinkPlayers[id].lp_field_18)
                    {
                    case 0:
                    case 3:
                        memcpy(gPlayerParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                        break;
                    case 1:
                    case 2:
                        memcpy(gPlayerParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                        break;
                    }
                }
                else
                {
                    if ((!(gLinkPlayers[id].lp_field_18 & 1) && !(gLinkPlayers[playerId].lp_field_18 & 1))
                     || ((gLinkPlayers[id].lp_field_18 & 1) && (gLinkPlayers[playerId].lp_field_18 & 1)))
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gPlayerParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        case 1:
                        case 2:
                            memcpy(gPlayerParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        }
                    }
                    else
                    {
                        switch (gLinkPlayers[id].lp_field_18)
                        {
                        case 0:
                        case 3:
                            memcpy(gEnemyParty + 2, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        case 1:
                        case 2:
                            memcpy(gEnemyParty + 5, gBlockRecvBuffer[id], sizeof(struct Pokemon));
                            break;
                        }
                    }
                }
            }

            shedinja_something(&gPlayerParty[0]);
            shedinja_something(&gPlayerParty[1]);
            shedinja_something(&gPlayerParty[2]);
            shedinja_something(&gPlayerParty[3]);
            shedinja_something(&gPlayerParty[4]);
            shedinja_something(&gPlayerParty[5]);

            shedinja_something(&gEnemyParty[0]);
            shedinja_something(&gEnemyParty[1]);
            shedinja_something(&gEnemyParty[2]);
            shedinja_something(&gEnemyParty[3]);
            shedinja_something(&gEnemyParty[4]);
            shedinja_something(&gEnemyParty[5]);

            gUnknown_02024D1E[0]++;
        }
        break;
    case 6:
        sub_800B950();
        gUnknown_02024D1E[0]++;
        gUnknown_02024D1E[1] = 0;
        gUnknown_02024D1E[2] = 0;
        break;
    case 7:
        if (battle_load_something(gUnknown_02024D1F, gUnknown_02024D1F + 1) != 0)
        {
            gUnknown_030042D0 = gMain.callback1;
            gMain.callback1 = sub_8010824;
            SetMainCallback2(sub_800F808);
            if (gBattleTypeFlags & BATTLE_TYPE_LINK)
            {
                gTrainerBattleOpponent = 0x800;
                gBattleTypeFlags |= BATTLE_TYPE_20;
            }
        }
        break;
    }
}

void sub_800F808(void)
{
    AnimateSprites();
    BuildOamBuffer();
    sub_800374C(&gUnknown_03004210);
    UpdatePaletteFade();
    RunTasks();
}

void sub_800F828(struct Sprite *sprite)
{
    sprite->data0 = 0;
    sprite->callback = sub_800F838;
}

void sub_800F838(struct Sprite *sprite)
{
    u16 *arr = (u16 *)ewram;

    switch (sprite->data0)
    {
    case 0:
        sprite->data0++;
        sprite->data1 = 0;
        sprite->data2 = 0x281;
        sprite->data3 = 0;
        sprite->data4 = 1;
        // fall through
    case 1:
        sprite->data4--;
        if (sprite->data4 == 0)
        {
            s32 i;
            s32 r2;
            s32 r0;

            sprite->data4 = 2;
            r2 = sprite->data1 + sprite->data3 * 32;
            r0 = sprite->data2 - sprite->data3 * 32;
            for (i = 0; i < 29; i += 2)
            {
                arr[r2 + i] = 0x3D;
                arr[r0 + i] = 0x3D;
            }
            sprite->data3++;
            if (sprite->data3 == 21)
            {
                sprite->data0++;
                sprite->data1 = 32;
            }
        }
        break;
    case 2:
        sprite->data1--;
        if (sprite->data1 == 20)
            SetMainCallback2(sub_800E7C4);
        break;
    }
}

u8 CreateNPCTrainerParty(struct Pokemon *party, u16 trainerNum)
{
    u32 nameHash = 0;
    s32 i;

    if (trainerNum == 0x400)
        return 0;

    if ((gBattleTypeFlags & 0x908) == 8)
    {
        ZeroEnemyPartyMons();
        for (i = 0; i < gTrainers[trainerNum].partySize; i++)
        {
            u32 personalityValue;
            s32 j;
            u8 fixedIV;

            if (gTrainers[trainerNum].doubleBattle == TRUE)
                personalityValue = 0x80;
            else if (gTrainers[trainerNum].encounterMusic_gender & 0x80)
                personalityValue = 0x78;
            else
                personalityValue = 0x88;

            for (j = 0; gTrainers[trainerNum].trainerName[j] != 0xFF; j++)
                nameHash += gTrainers[trainerNum].trainerName[j];

            switch (gTrainers[trainerNum].partyFlags)
            {
            case 0:
            {
                struct TrainerPartyMember0 *partyData = gTrainers[trainerNum].party;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);
                break;
            }
            case 1:
            {
                struct TrainerPartyMember1 *partyData = gTrainers[trainerNum].party;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                for (j = 0; j < 4; j++)
                {
                    SetMonData(&party[i], MON_DATA_MOVE1 + j, (u8 *)&partyData[i].moves[j]);
                    SetMonData(&party[i], MON_DATA_PP1 + j, &gBattleMoves[partyData[i].moves[j]].pp);
                }
                break;
            }
            case 2:
            {
                struct TrainerPartyMember2 *partyData = gTrainers[trainerNum].party;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                SetMonData(&party[i], MON_DATA_HELD_ITEM, (u8 *)&partyData[i].heldItem);
                break;
            }
            case 3:
            {
                struct TrainerPartyMember3 *partyData = gTrainers[trainerNum].party;

                for (j = 0; gSpeciesNames[partyData[i].species][j] != 0xFF; j++)
                    nameHash += gSpeciesNames[partyData[i].species][j];
                personalityValue += nameHash << 8;
                fixedIV = partyData[i].iv * 31 / 255;
                CreateMon(&party[i], partyData[i].species, partyData[i].level, fixedIV, TRUE, personalityValue, 2, 0);

                SetMonData(&party[i], MON_DATA_HELD_ITEM, (u8 *)&partyData[i].heldItem);
                for (j = 0; j < 4; j++)
                {
                    SetMonData(&party[i], MON_DATA_MOVE1 + j, (u8 *)&partyData[i].moves[j]);
                    SetMonData(&party[i], MON_DATA_PP1 + j, &gBattleMoves[partyData[i].moves[j]].pp);
                }
                break;
            }
            }
        }
        gBattleTypeFlags |= gTrainers[trainerNum].doubleBattle;
    }
    return gTrainers[trainerNum].partySize;
}

void sub_800FCD4(void)
{
    if (REG_VCOUNT < 0xA0 && REG_VCOUNT >= 0x6F )
        REG_BG0CNT = 0x9800;
}

void sub_800FCFC(void)
{
    Random();  // unused return value
    REG_BG0HOFS = gUnknown_030042A4;
    REG_BG0VOFS = gUnknown_030042A0;
    REG_BG1HOFS = gUnknown_030042C0;
    REG_BG1VOFS = gUnknown_030041B4;
    REG_BG2HOFS = gUnknown_03004288;
    REG_BG2VOFS = gUnknown_03004280;
    REG_BG3HOFS = gUnknown_030041B0;
    REG_BG3VOFS = gUnknown_030041B8;
    REG_WIN0H = gUnknown_030042C4;
    REG_WIN0V = gUnknown_03004240;
    REG_WIN1H = gUnknown_03004200;
    REG_WIN1V = gUnknown_03004244;
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_8089668();
}

void nullsub_36(struct Sprite *sprite)
{
}

void sub_800FDB0(struct Sprite *sprite)
{
    if (sprite->data0 != 0)
        sprite->pos1.x = sprite->data1 + ((sprite->data2 & 0xFF00) >> 8);
    else
        sprite->pos1.x = sprite->data1 - ((sprite->data2 & 0xFF00) >> 8);
    sprite->data2 += 0x180;
    if (sprite->affineAnimEnded)
    {
        FreeSpriteTilesByTag(0x2710);
        FreeSpritePaletteByTag(0x2710);
        FreeSpriteOamMatrix(sprite);
        DestroySprite(sprite);
    }
}

void sub_800FE20(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 1);
    sprite->callback = sub_800FDB0;
    PlaySE(SE_BT_START);
}

void sub_800FE40(u8 taskId)
{
    struct Pokemon *sp4 = NULL;
    struct Pokemon *sp8 = NULL;
    u8 r2 = ewram160CB;
    u32 r7;
    s32 i;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        switch (gLinkPlayers[r2].lp_field_18)
        {
        case 0:
        case 2:
            sp4 = gPlayerParty;
            sp8 = gEnemyParty;
            break;
        case 1:
        case 3:
            sp4 = gEnemyParty;
            sp8 = gPlayerParty;
            break;
        }
    }
    else
    {
        sp4 = gPlayerParty;
        sp8 = gEnemyParty;
    }

    r7 = 0;
    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&sp4[i], MON_DATA_SPECIES2);
        u16 hp = GetMonData(&sp4[i], MON_DATA_HP);
        u32 status = GetMonData(&sp4[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r7 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r7 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r7 |= 3 << i * 2;
    }
    gTasks[taskId].data[3] = r7;

    r7 = 0;
    for (i = 0; i < 6; i++)
    {
        u16 species = GetMonData(&sp8[i], MON_DATA_SPECIES2);
        u16 hp = GetMonData(&sp8[i], MON_DATA_HP);
        u32 status = GetMonData(&sp8[i], MON_DATA_STATUS);

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp != 0 && status == 0)
            r7 |= 1 << i * 2;

        if (species == 0)
            continue;
        if (hp != 0 && (species == SPECIES_EGG || status != 0))
            r7 |= 2 << i * 2;

        if (species == 0)
            continue;
        if (species != SPECIES_EGG && hp == 0)
            r7 |= 3 << i * 2;
    }
    gTasks[taskId].data[4] = r7;
}

void c2_8011A1C(void)
{
    s32 i;
    u8 taskId;

    SetHBlankCallback(NULL);
    SetVBlankCallback(NULL);
    CpuFill32(0, (void *)VRAM, VRAM_SIZE);
    REG_MOSAIC = 0;
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0x5051;
    REG_WININ = 0;
    REG_WINOUT = 0;
    gUnknown_030042C4 = 0xF0;
    gUnknown_03004240 = 0x5051;
    dp12_8087EA4();

    for (i = 0; i < 80; i++)
    {
        gUnknown_03004DE0.unk0[i] = 0xF0;
        gUnknown_03004DE0.unk780[i] = 0xF0;
    }
    for (i = 80; i < 160; i++)
    {
        asm(""::"r"(i));  // Needed to stop the compiler from optimizing out the loop counter
        gUnknown_03004DE0.unk0[i] = 0xFF10;
        gUnknown_03004DE0.unk780[i] = 0xFF10;
    }
    SetUpWindowConfig(&gWindowConfig_81E6C58);
    ResetPaletteFade();
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    gUnknown_030042C0 = 0;
    gUnknown_030041B4 = 0;
    gUnknown_03004288 = 0;
    gUnknown_03004280 = 0;
    gUnknown_030041B0 = 0;
    gUnknown_030041B8 = 0;

    InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C58);
    InitWindowFromConfig(&gUnknown_030041D0, &gWindowConfig_81E71D0);
    InitWindowFromConfig(&gUnknown_03004250, &gWindowConfig_81E71EC);
    sub_800D6D4();
    LoadCompressedPalette(gUnknown_08D004E0, 0, 64);
    sub_800D74C();
    ResetSpriteData();
    ResetTasks();
    sub_800E23C();
    REG_WINOUT = 0x37;
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 4;
    SetVBlankCallback(sub_800FCFC);
    taskId = CreateTask(sub_800DE30, 0);
    gTasks[taskId].data[1] = 0x10E;
    gTasks[taskId].data[2] = 0x5A;
    gTasks[taskId].data[5] = 1;
    sub_800FE40(taskId);
    SetMainCallback2(sub_80101B8);
    gUnknown_02024D1E[0] = 0;
}

void sub_80101B8(void)
{
    c2_081284E0();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    RunTasks();
}

void c2_081284E0(void)
{
    switch (gUnknown_02024D1E[0])
    {
    case 0:
        gUnknown_02024D1E[1] = 0xFF;
        gUnknown_02024D1E[0]++;
        break;
    case 1:
        gUnknown_02024D1E[1]--;
        if (gUnknown_02024D1E[1] == 0)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
            gUnknown_02024D1E[0]++;
        }
        break;
    case 2:
        if (!gPaletteFade.active)
            SetMainCallback2(gMain.savedCallback);
        break;
    }
}

void oac_poke_opponent(struct Sprite *sprite)
{
    sprite->callback = sub_8010278;
    StartSpriteAnimIfDifferent(sprite, 0);
    BeginNormalPaletteFade(0x00020000, 0, 10, 10, 0x3DEF);
}

void sub_8010278(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x += 2;
        if (sprite->pos2.x == 0)
        {
            sprite->callback = sub_80102AC;
            PlayCry1(sprite->data2, 25);
        }
    }
}

void sub_80102AC(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        sub_804777C(sprite->data0);
        sub_8043DFC(gUnknown_03004340[sprite->data0]);
        sprite->callback = nullsub_37;
        StartSpriteAnimIfDifferent(sprite, 0);
        BeginNormalPaletteFade(0x00020000, 0, 10, 0, 0x3DEF);
    }
}

void nullsub_37(struct Sprite *sprite)
{
}

void unref_sub_801030C(struct Sprite *sprite)
{
    sprite->data3 = 6;
    sprite->data4 = 1;
    sprite->callback = sub_8010320;
}

void sub_8010320(struct Sprite *sprite)
{
    sprite->data4--;
    if (sprite->data4 == 0)
    {
        sprite->data4 = 8;
        sprite->invisible ^= 1;
        sprite->data3--;
        if (sprite->data3 == 0)
        {
            sprite->invisible = FALSE;
            sprite->callback = nullsub_37;
            gUnknown_03004284 = 0;
        }
    }
}

void sub_8010384(struct Sprite *sprite)
{
    u8 r6 = sprite->data0;
    u16 species;
    u8 yOffset;

    if (ewram17800[r6].unk2 != 0)
        species = ewram17800[r6].unk2;
    else
        species = sprite->data2;

    GetMonData(&gEnemyParty[gUnknown_02024A6A[r6]], MON_DATA_PERSONALITY);  // Unused return value

    if (species == SPECIES_UNOWN)
    {
        u32 personalityValue = GetMonData(&gEnemyParty[gUnknown_02024A6A[r6]], MON_DATA_PERSONALITY);
        u16 unownForm = ((((personalityValue & 0x3000000) >> 18) | ((personalityValue & 0x30000) >> 12) | ((personalityValue & 0x300) >> 6) | (personalityValue & 3)) % 0x1C);
        u16 unownSpecies;

        if (unownForm == 0)
            unownSpecies = SPECIES_UNOWN;  // Use the A Unown form
        else
            unownSpecies = NUM_SPECIES + unownForm;  // Use one of the other Unown letters

        yOffset = gMonFrontPicCoords[unownSpecies].y;
    }
    else if (species == SPECIES_CASTFORM)
    {
        yOffset = gCastformFrontSpriteCoords[gBattleMonForms[r6]].y;
    }
    else if (species > NUM_SPECIES)
    {
        yOffset = gMonFrontPicCoords[SPECIES_NONE].y;
    }
    else
    {
        yOffset = gMonFrontPicCoords[species].y;
    }

    sprite->data3 = 8 - yOffset / 8;
    sprite->data4 = 1;
    sprite->callback = sub_8010494;
}

void sub_8010494(struct Sprite *sprite)
{
    s32 i;

    sprite->data4--;
    if (sprite->data4 == 0)
    {
        sprite->data4 = 2;
        sprite->pos2.y += 8;
        sprite->data3--;
        if (sprite->data3 < 0)
        {
            FreeSpriteOamMatrix(sprite);
            DestroySprite(sprite);
        }
        else
        {
            u8 *dst = (u8 *)gUnknown_081FAF4C[battle_get_per_side_status(sprite->data0)] + (gBattleMonForms[sprite->data0] << 11) + (sprite->data3 << 8);

            for (i = 0; i < 0x100; i++)
                *(dst++) = 0;
            StartSpriteAnim(sprite, gBattleMonForms[sprite->data0]);
        }
    }
}

void sub_8010520(struct Sprite *sprite)
{
    sprite->data3 = 8;
    sprite->data4 = sprite->invisible;
    sprite->callback = sub_801053C;
}

void sub_801053C(struct Sprite *sprite)
{
    sprite->data3--;
    if (sprite->data3 == 0)
    {
        sprite->invisible ^= 1;
        sprite->data3 = 8;
    }
}

void sub_8010574(struct Sprite *sprite)
{
    sprite->invisible = sprite->data4;
    sprite->data4 = FALSE;
    sprite->callback = nullsub_37;
}

void sub_80105A0(struct Sprite *sprite)
{
    sprite->callback = oac_poke_ally_;
}

void oac_poke_ally_(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x -= 2;
        if (sprite->pos2.x == 0)
        {
            sprite->callback = nullsub_86;
            sprite->data1 = 0;
        }
    }
}

void sub_80105DC(struct Sprite *sprite)
{
    sprite->callback = nullsub_86;
}

void nullsub_86(struct Sprite *sprite)
{
}

void sub_80105EC(struct Sprite *sprite)
{
    if ((gUnknown_02024DE8 & 1) == 0)
    {
        sprite->pos2.x += sprite->data1;
        sprite->pos2.y += sprite->data2;
    }
}

void dp11b_obj_instanciate(u8 a, u8 b, s8 c, s8 d)
{
    u8 spriteId;
    u8 r7;

    if (b)
    {
        if (ewram17810[a].unk0_1)
            return;
    }
    else
    {
        if (ewram17810[a].unk0_2)
            return;
    }

    spriteId = CreateInvisibleSpriteWithCallback(objc_dp11b_pingpong);
    if (b == TRUE)
    {
        r7 = gUnknown_03004340[a];
        ewram17810[a].unk2 = spriteId;
        ewram17810[a].unk0_1 = 1;
        gSprites[spriteId].data0 = 0x80;
    }
    else
    {
        r7 = gUnknown_02024BE0[a];
        ewram17810[a].unk3 = spriteId;
        ewram17810[a].unk0_2 = 1;
        gSprites[spriteId].data0 = 0xC0;
    }
    gSprites[spriteId].data1 = c;
    gSprites[spriteId].data2 = d;
    gSprites[spriteId].data3 = r7;
    gSprites[spriteId].data4 = b;
    gSprites[r7].pos2.x = 0;
    gSprites[r7].pos2.y = 0;
}

void dp11b_obj_free(u8 a, u8 b)
{
    u8 r4;

    if (b == TRUE)
    {
        if (!ewram17810[a].unk0_1)
            return;
        r4 = gSprites[ewram17810[a].unk2].data3;
        DestroySprite(&gSprites[ewram17810[a].unk2]);
        ewram17810[a].unk0_1 = 0;
    }
    else
    {
        if (!ewram17810[a].unk0_2)
            return;
        r4 = gSprites[ewram17810[a].unk3].data3;
        DestroySprite(&gSprites[ewram17810[a].unk3]);
        ewram17810[a].unk0_2 = 0;
    }
    gSprites[r4].pos2.x = 0;
    gSprites[r4].pos2.y = 0;
}

void objc_dp11b_pingpong(struct Sprite *sprite)
{
    u8 spriteId = sprite->data3;
    s32 var;

    if (sprite->data4 == 1)
        var = sprite->data0;
    else
        var = sprite->data0;

    gSprites[spriteId].pos2.y = Sin(var, sprite->data2) + sprite->data2;
    sprite->data0 = (sprite->data0 + sprite->data1) & 0xFF;
}

void nullsub_41(void)
{
}

void sub_8010800(void)
{
    sub_8010874();
    gUnknown_02024D1E[1] = 0;
    gUnknown_030042D4 = bc_8012FAC;
}

void sub_8010824(void)
{
    gUnknown_030042D4();
    gUnknown_02024A60 = 0;

    for (gUnknown_02024A60 = 0; gUnknown_02024A60 < gUnknown_02024A68; gUnknown_02024A60++)
        gUnknown_03004330[gUnknown_02024A60]();
}

void sub_8010874(void)
{
    s32 i;
    s32 j;
    u8 *r4;

    sub_801365C(0);
    sub_801377C();

    for (i = 0; i < 4; i++)
    {
        gUnknown_02024C98[i] = 0;

        r4 = (u8 *)&gUnknown_02024CA8[i];
        for (j = 0; j < (u32)0x1C; j++)
            r4[j] = 0;

        gUnknown_02024CA8[i].unk16 = 2;
        gUnknown_02024C70[i] = 0;
        gUnknown_02024C34[i] = 0;
        gUnknown_02024C3C[i] = 0;
        gUnknown_02024C44[i] = 0;
        gUnknown_02024C4C[i] = 0;
        gUnknown_02024C5C[i] = 0xFF;
        gUnknown_02024C54[i] = 0;
        gUnknown_02024C2C[i] = 0;
        ewram17100[i] = 0;
    }

    for (i = 0; i < 2; i++)
    {
        gUnknown_02024C7A[i] = 0;

        r4 = (u8 *)&gUnknown_02024C80[i];
        for (j = 0; j < (u32)12; j++)
            r4[j] = 0;
    }

    gPlayerMonIndex = 0;
    gEnemyMonIndex = 0;
    gBattleWeather = 0;

    r4 = (u8 *)&gUnknown_02024DBC;
    for (i = 0; i < (u32)0x2C; i++)
        r4[i] = 0;

    gUnknown_02024C6C = 0;
    if ((gBattleTypeFlags & 2) == 0 && gSaveBlock2.optionsBattleSceneOff == TRUE)
        gUnknown_02024C6C = 0x80;
    ewram16084 = gSaveBlock2.optionsBattleStyle;
    gUnknown_02024C0E = 0;
    gUnknown_02024D26 = 0;
    gUnknown_02024A64 = 0;
    gUnknown_02024D1A = 0;
    ewram17130 = 0;
    ewram17160 = 0;
    for (i = 0; i < 8; i++)
        gUnknown_02024D1E[i] = 0;
    gUnknown_02024D18 = 0;
    gBattleMoveDamage = 0;
    gUnknown_02024DE8 = 0;
    ewram16002 = 0;
    ewram160A1 = 0;
    gUnknown_03004324 = 0;
    gUnknown_02024C0C = 0;
    ewram16078 = 0;
    ewram16086 = 0;
    ewram16087 = 0;
    ewram16089 = gBaseStats[GetMonData(&gEnemyParty[0], MON_DATA_SPECIES)].catchRate * 100 / 1275;
    ewram16088 = 3;
    ewram1601B = 0;
    ewram16056 = 1;

    for (i = 0; i < 8; i++)
    {
        ewram[i + 0x160AC] = 0;
        ewram[i + 0x160CC] = 0;
        ewram[i + 0x160E8] = 0;
        ewram[i + 0x160F0] = 0;
        ewram[i + 0x16100] = 0;
        ewram[i + 0x16108] = 0;
    }

    ewram160C8 = 6;
    ewram160C9 = 6;
    ewram16113 = 0;
    for (i = 0; i < 11; i++)
        gUnknown_030042E0.unk36[i] = 0;
    gUnknown_030042E0.unk13 = 0;
    gUnknown_030042E0.unk0 = 0;
    gUnknown_030042E0.unk1 = 0;
    gUnknown_030042E0.unk2 = 0;
    gUnknown_030042E0.unk3 = 0;
    gUnknown_030042E0.unk4 = 0;
    gUnknown_030042E0.unk5_0 = 0;
    gUnknown_030042E0.unk5_1 = 0;
    gUnknown_030042E0.unk20 = 0;
    gUnknown_030042E0.unk22 = 0;
    gUnknown_030042E0.unk24 = 0;
    gUnknown_030042E0.unk6 = 0;
    gUnknown_030042E0.unk26 = 0;
    gUnknown_030042E0.unk28 = 0;
    for (i = 0; i < 10; i++)
    {
        gUnknown_030042E0.unk8[i] = 0;
        gUnknown_030042E0.unk14[i] = 0;
        gUnknown_030042E0.unk2A[i] = 0;
    }
}

void sub_8010B88(void)
{
    struct UnknownStruct4 sp0 = gUnknown_02024CA8[gUnknown_02024A60];
    s32 i;
    u8 *ptr;
    u32 *ptr2;

    if (gBattleMoves[gUnknown_02024BE6].effect != 0x7F)
    {
        for (i = 0; i < 8; i++)
            gBattleMons[gUnknown_02024A60].statStages[i] = 6;
        for (i = 0; i < gUnknown_02024A68; i++)
        {
            struct UnknownStruct12 *sp20 = &gUnknown_02024AD0[i];

            if ((sp20->unk0 & 0x04000000) && gUnknown_02024CA8[i].unk14 == gUnknown_02024A60)
                sp20->unk0 &= ~0x04000000;
            if ((gUnknown_02024C98[i] & 0x18) && gUnknown_02024CA8[i].unk15 == gUnknown_02024A60)
            {
                gUnknown_02024C98[i] &= ~0x18;
                gUnknown_02024CA8[i].unk15 = 0;
            }
        }
    }
    if (gBattleMoves[gUnknown_02024BE6].effect == 0x7F)
    {
        gBattleMons[gUnknown_02024A60].status2 &= 0x15100007;
        gUnknown_02024C98[gUnknown_02024A60] &= 0x3043F;

        for (i = 0; i < gUnknown_02024A68; i++)
        {
            if (battle_side_get_owner(gUnknown_02024A60) != battle_side_get_owner(i)
             && (gUnknown_02024C98[i] & 0x18) != 0
             && (gUnknown_02024CA8[i].unk15 == gUnknown_02024A60))
            {
                gUnknown_02024C98[i] &= ~0x18;
                gUnknown_02024C98[i] |= 0x10;
            }
        }
    }
    else
    {
        gBattleMons[gUnknown_02024A60].status2 = 0;
        gUnknown_02024C98[gUnknown_02024A60] = 0;
    }

    for (i = 0; i < gUnknown_02024A68; i++)
    {
        if (gUnknown_02024AD0[i].unk0 & (gBitTable[gUnknown_02024A60] << 16))
            gUnknown_02024AD0[i].unk0 &= ~(gBitTable[gUnknown_02024A60] << 16);
        if ((gUnknown_02024AD0[i].unk0 & 0xE000) && ewram[0x16020 + i] == gUnknown_02024A60)
            gUnknown_02024AD0[i].unk0 &= ~0xE000;
    }

    gUnknown_02024E60[gUnknown_02024A60] = 0;
    gUnknown_02024E64[gUnknown_02024A60] = 0;

    ptr = (u8 *)&gUnknown_02024CA8[gUnknown_02024A60];
    for (i = 0; i < (u32)0x1C; i++)
        ptr[i] = 0;

    if (gBattleMoves[gUnknown_02024BE6].effect == 0x7F)
    {
        gUnknown_02024CA8[gUnknown_02024A60].unkA = sp0.unkA;
        gUnknown_02024CA8[gUnknown_02024A60].unk15 = sp0.unk15;
        gUnknown_02024CA8[gUnknown_02024A60].unkF_0 = sp0.unkF_0;
        gUnknown_02024CA8[gUnknown_02024A60].unkF_4 = sp0.unkF_4;
    }

    gUnknown_02024CA8[gUnknown_02024A60].unk16 = 2;
    gUnknown_02024C34[gUnknown_02024A60] = 0;
    gUnknown_02024C3C[gUnknown_02024A60] = 0;
    gUnknown_02024C44[gUnknown_02024A60] = 0;
    gUnknown_02024C4C[gUnknown_02024A60] = 0;
    gUnknown_02024C2C[gUnknown_02024A60] = 0;
    gUnknown_02024C5C[gUnknown_02024A60] = 0xFF;

    ewram[0x160AC + gUnknown_02024A60 * 2 + 0] = 0;
    ewram[0x160AC + gUnknown_02024A60 * 2 + 1] = 0;
    ewram[0x16100 + gUnknown_02024A60 * 4 + 0] = 0;
    ewram[0x16100 + gUnknown_02024A60 * 4 + 1] = 0;
    ewram[0x16100 + gUnknown_02024A60 * 4 + 2] = 0;
    ewram[0x16100 + gUnknown_02024A60 * 4 + 3] = 0;
    ewram[0x160E8 + gUnknown_02024A60 * 2 + 0] = 0;
    ewram[0x160E8 + gUnknown_02024A60 * 2 + 1] = 0;

    ptr2 = (u32 *)(ewram + 0x17100);
    ptr2[gUnknown_02024A60] = 0;

    gUnknown_02024BE6 = 0;
}

void sub_8010F48(void)
{
    s32 i;
    u8 *ptr;
    u32 *ptr2;

    for (i = 0; i < 8; i++)
        gBattleMons[gUnknown_02024A60].statStages[i] = 6;
    gBattleMons[gUnknown_02024A60].status2 = 0;
    gUnknown_02024C98[gUnknown_02024A60] = 0;
    for (i = 0; i < gUnknown_02024A68; i++)
    {
        if ((gBattleMons[i].status2 & 0x4000000) && gUnknown_02024CA8[i].unk14 == gUnknown_02024A60)
            gBattleMons[i].status2 &= ~0x4000000;
        if (gBattleMons[i].status2 & (gBitTable[gUnknown_02024A60] << 16))
            gBattleMons[i].status2 &= ~(gBitTable[gUnknown_02024A60] << 16);
        if ((gBattleMons[i].status2 & 0xE000) && ewram[0x16020 + i] == gUnknown_02024A60)
            gBattleMons[i].status2 &= ~0xE000;
    }
    gUnknown_02024E60[gUnknown_02024A60] = 0;
    gUnknown_02024E64[gUnknown_02024A60] = 0;

    ptr = (u8 *)&gUnknown_02024CA8[gUnknown_02024A60];
    for (i = 0; i < (u32)0x1C; i++)
        ptr[i] = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk0_0 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk0_1 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk0_2 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk0_3 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk0_4 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk0_5 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk0_6 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk0_7 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk1_0 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk1_1 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk1_2 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk1_3 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk1_5 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk1_6 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk1_7 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk2_0 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk2_1 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk2_2 = 0;
    gUnknown_02024D28[gUnknown_02024A60].unk2_3 = 0;

    gUnknown_02024CA8[gUnknown_02024A60].unk16 = 2;
    gUnknown_02024C34[gUnknown_02024A60] = 0;
    gUnknown_02024C3C[gUnknown_02024A60] = 0;
    gUnknown_02024C44[gUnknown_02024A60] = 0;
    gUnknown_02024C4C[gUnknown_02024A60] = 0;
    gUnknown_02024C2C[gUnknown_02024A60] = 0;
    gUnknown_02024C5C[gUnknown_02024A60] = 0xFF;

    ewram[0x160E8 + gUnknown_02024A60 * 2 + 0] = 0;
    ewram[0x160E8 + gUnknown_02024A60 * 2 + 1] = 0;
    ewram[0x160AC + gUnknown_02024A60 * 2 + 0] = 0;
    ewram[0x160AC + gUnknown_02024A60 * 2 + 1] = 0;
    ewram[0x16100 + gUnknown_02024A60 * 4 + 0] = 0;
    ewram[0x16100 + gUnknown_02024A60 * 4 + 1] = 0;
    ewram[0x16100 + gUnknown_02024A60 * 4 + 2] = 0;
    ewram[0x16100 + gUnknown_02024A60 * 4 + 3] = 0;

    ptr2 = (u32 *)(ewram + 0x17100);
    ptr2[gUnknown_02024A60] = 0;

    gBattleMons[gUnknown_02024A60].type1 = gBaseStats[gBattleMons[gUnknown_02024A60].species].type1;
    gBattleMons[gUnknown_02024A60].type2 = gBaseStats[gBattleMons[gUnknown_02024A60].species].type2;
}

void bc_8012FAC(void)
{
    switch (gUnknown_02024D1E[0])
    {
    case 0:
        gUnknown_02024A60 = gUnknown_02024D1E[1];
        dp01_build_cmdbuf_x00_a_b_0(0, 0, 0);
        dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
        gUnknown_02024D1E[0]++;
        break;
    case 1:
        if (gUnknown_02024A64 == 0)
        {
            gUnknown_02024D1E[1]++;
            if (gUnknown_02024D1E[1] == gUnknown_02024A68)
                gUnknown_030042D4 = bc_load_battlefield;
            else
                gUnknown_02024D1E[0] = 0;
        }
        break;
    }
}

void bc_load_battlefield(void)
{
    if (gUnknown_02024A64 == 0)
    {
        gUnknown_02024A60 = battle_get_side_with_given_state(0);
        dp01_build_cmdbuf_x2E_a(0, gBattleTerrain);
        dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
        gUnknown_030042D4 = sub_8011384;
        gUnknown_02024D1E[0] = 0;
        gUnknown_02024D1E[1] = 0;
    }
}

void sub_8011384(void)
{
    u8 *ptr;
    s32 i;

    if (gUnknown_02024A64 == 0)
    {
        for (gUnknown_02024A60 = 0; gUnknown_02024A60 < gUnknown_02024A68; gUnknown_02024A60++)
        {
            if ((gBattleTypeFlags & BATTLE_TYPE_SAFARI)
             && battle_side_get_owner(gUnknown_02024A60) == 0)
            {
                ptr = (u8 *)&gBattleMons[gUnknown_02024A60];
                for (i = 0; i < (u32)0x58; i++)
                    ptr[i] = 0;
            }
            else
            {
                u8 r0;

                ptr = (u8 *)&gBattleMons[gUnknown_02024A60];
                for (i = 0; i < (u32)0x58; i++)
                    ptr[i] = gUnknown_02024260[gUnknown_02024A60][4 + i];

                gBattleMons[gUnknown_02024A60].type1 = gBaseStats[gBattleMons[gUnknown_02024A60].species].type1;
                gBattleMons[gUnknown_02024A60].type2 = gBaseStats[gBattleMons[gUnknown_02024A60].species].type2;
                gBattleMons[gUnknown_02024A60].ability = GetAbilityBySpecies(gBattleMons[gUnknown_02024A60].species, gBattleMons[gUnknown_02024A60].altAbility);
                r0 = battle_side_get_owner(gUnknown_02024A60);
                ewram160BC[r0] = gBattleMons[gUnknown_02024A60].hp;
                for (i = 0; i < 8; i++)
                    gBattleMons[gUnknown_02024A60].statStages[i] = 6;
                gBattleMons[gUnknown_02024A60].status2 = 0;
            }

            if (battle_get_per_side_status(gUnknown_02024A60) == 0)
            {
                dp01_build_cmdbuf_x07_7_7_7(0);
                dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
            }

            if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
            {
                if (battle_get_per_side_status(gUnknown_02024A60) == 1)
                {
                    dp01_build_cmdbuf_x07_7_7_7(0);
                    dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
                }
                if (battle_side_get_owner(gUnknown_02024A60) == 1
                 && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                    sub_8090D90(SpeciesToNationalPokedexNum(gBattleMons[gUnknown_02024A60].species), 2);
            }
            else
            {
                if (battle_side_get_owner(gUnknown_02024A60) == 1
                 && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                {
                    sub_8090D90(SpeciesToNationalPokedexNum(gBattleMons[gUnknown_02024A60].species), 2);
                    dp01_build_cmdbuf_x04_4_4_4(0);
                    dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
                }
            }

            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (battle_get_per_side_status(gUnknown_02024A60) == 2
                 || battle_get_per_side_status(gUnknown_02024A60) == 3)
                {
                    dp01_build_cmdbuf_x07_7_7_7(0);
                    dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
                }
            }
        }
        gUnknown_030042D4 = bc_801333C;
    }
}

void bc_801333C(void)
{
    s32 i;

    if (gUnknown_02024A64 == 0)
    {
        struct
        {
            u16 hp;
            u32 status;
        } sp0[6];

        if (gBattleTypeFlags & BATTLE_TYPE_TRAINER)
        {
            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    sp0[i].hp = 0xFFFF;
                    sp0[i].status = 0;
                }
                else
                {
                    sp0[i].hp = GetMonData(&gEnemyParty[i], MON_DATA_HP);
                    sp0[i].status = GetMonData(&gEnemyParty[i], MON_DATA_STATUS);
                }
            }
            gUnknown_02024A60 = battle_get_side_with_given_state(1);
            dp01_build_cmdbuf_x30_TODO(0, (u8 *)sp0, 0x80);
            dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);

            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    sp0[i].hp = 0xFFFF;
                    sp0[i].status = 0;
                }
                else
                {
                    sp0[i].hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
                    sp0[i].status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
                }
            }
            gUnknown_02024A60 = battle_get_side_with_given_state(0);
            dp01_build_cmdbuf_x30_TODO(0, (u8 *)sp0, 0x80);
            dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);

            gUnknown_030042D4 = bc_battle_begin_message;
        }
        else
        {
            // The array gets set here, but nothing is ever done with it.
            // Likely unfinished code.

            for (i = 0; i < 6; i++)
            {
                if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == 0
                 || GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2) == SPECIES_EGG)
                {
                    sp0[i].hp = 0xFFFF;
                    sp0[i].status = 0;
                }
                else
                {
                    sp0[i].hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);
                    sp0[i].status = GetMonData(&gPlayerParty[i], MON_DATA_STATUS);
                }
            }

            gUnknown_030042D4 = bc_8013568;
        }
    }
}

void bc_battle_begin_message(void)
{
    if (gUnknown_02024A64 == 0)
    {
        gUnknown_02024A60 = battle_get_side_with_given_state(1);
        b_std_message(0, gUnknown_02024A60);
        gUnknown_030042D4 = sub_8011800;
    }
}

void bc_8013568(void)
{
    if (gUnknown_02024A64 == 0)
    {
        gUnknown_030042D4 = sub_8011970;
        b_std_message(0, 0);
    }
}

void sub_8011800(void)
{
    if (gUnknown_02024A64 == 0)
    {
        b_std_message(1, battle_get_side_with_given_state(1));
        gUnknown_030042D4 = sub_8011834;
    }
}

void sub_8011834(void)
{
    if (gUnknown_02024A64 == 0)
    {
        for (gUnknown_02024A60 = 0; gUnknown_02024A60 < gUnknown_02024A68; gUnknown_02024A60++)
        {
            if (battle_get_per_side_status(gUnknown_02024A60) == 1)
            {
                dp01_build_cmdbuf_x2F_2F_2F_2F(0);
                dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
            }
            if ((gBattleTypeFlags & BATTLE_TYPE_MULTI)
             && battle_get_per_side_status(gUnknown_02024A60) == 3)
            {
                dp01_build_cmdbuf_x2F_2F_2F_2F(0);
                dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
            }
        }
        gUnknown_030042D4 = bc_801362C;
    }
}

void bc_801362C(void)
{
    if (gUnknown_02024A64 == 0)
    {
        for (gUnknown_02024A60 = 0; gUnknown_02024A60 < gUnknown_02024A68; gUnknown_02024A60++)
        {
            if (battle_side_get_owner(gUnknown_02024A60) == 1
             && !(gBattleTypeFlags & (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_LINK)))
                sub_8090D90(SpeciesToNationalPokedexNum(gBattleMons[gUnknown_02024A60].species), 2);
        }
        gUnknown_030042D4 = sub_8011970;
    }
}

void unref_sub_8011950(void)
{
    if (gUnknown_02024A64 == 0)
        gUnknown_030042D4 = sub_8011970;
}

void sub_8011970(void)
{
    if (gUnknown_02024A64 == 0)
    {
        if (!(gBattleTypeFlags & BATTLE_TYPE_SAFARI))
            b_std_message(1, battle_get_side_with_given_state(0));
        gUnknown_030042D4 = sub_80119B4;
    }
}

void sub_80119B4(void)
{
    if (gUnknown_02024A64 == 0)
    {
        for (gUnknown_02024A60 = 0; gUnknown_02024A60 < gUnknown_02024A68; gUnknown_02024A60++)
        {
            if (battle_get_per_side_status(gUnknown_02024A60) == 0)
            {
                dp01_build_cmdbuf_x2F_2F_2F_2F(0);
                dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
            }
            if ((gBattleTypeFlags & BATTLE_TYPE_MULTI)
             && battle_get_per_side_status(gUnknown_02024A60) == 2)
            {
                dp01_build_cmdbuf_x2F_2F_2F_2F(0);
                dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
            }
        }
        ewram16058 = 0;
        ewram160F9 = 0;
        ewram160E6 = 0;
        gUnknown_030042D4 = sub_8011B00;
    }
}

void unref_sub_8011A68(void)
{
    if (gUnknown_02024A64 == 0)
    {
        for (gUnknown_02024A60 = 0; gUnknown_02024A60 < gUnknown_02024A68; gUnknown_02024A60++)
        {
            if (battle_side_get_owner(gUnknown_02024A60) == 0)
            {
                sub_800C704(0, gUnknown_02024A6A[gUnknown_02024A60], 0);
                dp01_battle_side_mark_buffer_for_execution(gUnknown_02024A60);
            }
        }
        ewram16058 = 0;
        ewram160F9 = 0;
        ewram160E6 = 0;
        gUnknown_030042D4 = sub_8011B00;
    }
}

void sub_8011B00(void)
{
    s32 i;
    s32 j;
    u8 r9 = 0;
    
    if (gUnknown_02024A64 == 0)
    {
        if (ewram16058 == 0)
        {
            for (i = 0; i < gUnknown_02024A68; i++)
                gUnknown_02024A7A[i] = i;
            for (i = 0; i < gUnknown_02024A68 - 1; i++)
            {
                for (j = i + 1; j < gUnknown_02024A68; j++)
                {
                    if (b_first_side(gUnknown_02024A7A[i], gUnknown_02024A7A[j], 1) != 0)
                        sub_8012FBC(i, j);
                }
            }
        }
        if (ewram160E6 == 0 && sub_8018324(0, 0, 0, 0xFF, 0) != 0)
        {
            ewram160E6 = 1;
            return;
        }
        while (ewram16058 < gUnknown_02024A68)
        {
            if (sub_8018324(0, gUnknown_02024A7A[ewram16058], 0, 0, 0) != 0)
                r9++;
            ewram16058++;
            if (r9 != 0)
                return;
        }
        if (sub_8018324(9, 0, 0, 0, 0) != 0)
            return;
        if (sub_8018324(11, 0, 0, 0, 0) != 0)
            return;
        while (ewram160F9 < gUnknown_02024A68)
        {
            if (sub_801A02C(0, gUnknown_02024A7A[ewram160F9], 0) != 0)
                r9++;
            ewram160F9++;
            if (r9 != 0)
                return;
        }
        // Absolutely pointless for-loop that somehow doesn't get optimized out
        for (i = 0; i < gUnknown_02024A68; i++)
            ;
        for (i = 0; i < 4; i++)
        {
            ewram[0x16068 + i] = 6;
            gUnknown_02024C18[i] = 0xFF;
            gUnknown_02024C60[i] = 0;
        }
        sub_801365C(0);
        sub_801377C();
        ewram160A6 = gUnknown_02024C0C;
        gUnknown_030042D4 = sub_8012324;
        sub_80156DC();
        for (i = 0; i < 8; i++)
            gUnknown_02024D1E[i] = 0;
        for (i = 0; i < gUnknown_02024A68; i++)
            gBattleMons[i].status2 &= ~8;
        ewram16000 = 0;
        ewram16001 = 0;
        ewram16110 = 0;
        ewram16111 = 0;
        ewram1600C = 0;
        ewram16059 = 0;
        ewram1600E = 0;
        gBattleMoveFlags = 0;
        gUnknown_02024D1C = Random();
    }
}

void bc_8013B1C(void)
{
    s32 i;
    
    if (gUnknown_02024A64 == 0)
    {
        gUnknown_030042D4 = sub_8011E8C;
        for (i = 0; i < 8; i++)
            gUnknown_02024D1E[i] = 0;
        for (i = 0; i < gUnknown_02024A68; i++)
        {
            gBattleMons[i].status2 &= ~8;
            if ((gBattleMons[i].status1 & 7) && (gBattleMons[i].status2 & 0x1000))
                b_cancel_multi_turn_move_maybe(i);
        }
        ewram16000 = 0;
        ewram16001 = 0;
        ewram16110 = 0;
        ewram16111 = 0;
        ewram1600E = 0;
        gBattleMoveFlags = 0;
    }
}

void sub_8011E8C(void)
{
    s32 i;
    
    sub_801365C(1);
    if (gUnknown_02024D26 == 0)
    {
        if (sub_8015DFC() != 0)
            return;
        if (sub_8016558() != 0)
            return;
    }
    if (sub_80173A4() != 0)
        return;
    ewram16059 = 0;
    if (sub_80170DC() != 0)
        return;
    sub_801365C(0);
    gUnknown_02024C6C &= ~0x200;
    gUnknown_02024C6C &= ~0x80000;
    gUnknown_02024C6C &= ~0x400000;
    gUnknown_02024C6C &= ~0x100000;
    ewram16002 = 0;
    ewram160A1 = 0;
    ewram1600C = 0;
    gBattleMoveDamage = 0;
    gBattleMoveFlags = 0;
    for (i = 0; i < 5; i++)
        gUnknown_02024D1E[i] = 0;
    if (gUnknown_02024D26 != 0)
    {
        gUnknown_02024A7F = 12;
        gUnknown_030042D4 = sub_80138F0;
        return;
    }
    if (gUnknown_030042E0.unk13 < 0xFF)
        gUnknown_030042E0.unk13++;
    for (i = 0; i < gUnknown_02024A68; i++)
    {
        gUnknown_02024C18[i] = 0xFF;
        gUnknown_02024C60[i] = 0;
    }
    for (i = 0; i < 4; i++)
        ewram[0x16068 + i] = 6;
    ewram160A6 = gUnknown_02024C0C;
    gUnknown_030042D4 = sub_8012324;
    gUnknown_02024D1C = Random();
}

u8 sub_8012028(void)
{
    u8 r2;
    u8 r6;
    s32 i;
    
    if (gBattleMons[gUnknown_02024A60].item == 0xAF)
        r2 = gEnigmaBerries[gUnknown_02024A60].holdEffect;
    else
        r2 = ItemId_GetHoldEffect(gBattleMons[gUnknown_02024A60].item);
    gUnknown_02024C0B = gUnknown_02024A60;
    if (r2 == 0x25)
        return 0;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        return 0;
    if (gBattleMons[gUnknown_02024A60].ability == ABILITY_RUN_AWAY)
        return 0;
    r6 = battle_side_get_owner(gUnknown_02024A60);
    for (i = 0; i < gUnknown_02024A68; i++)
    {
        if (r6 != battle_side_get_owner(i)
         && gBattleMons[i].ability == 0x17)
        {
            ewram16003 = i;
            byte_2024C06 = gBattleMons[i].ability;
            gUnknown_02024D1E[5] = 2;
            return 2;
        }
        if (r6 != battle_side_get_owner(i)
         && gBattleMons[gUnknown_02024A60].ability != ABILITY_LEVITATE
         && gBattleMons[gUnknown_02024A60].type1 != 2
         && gBattleMons[gUnknown_02024A60].type2 != 2
         && gBattleMons[i].ability == 0x47)
        {
            ewram16003 = i;
            byte_2024C06 = gBattleMons[i].ability;
            gUnknown_02024D1E[5] = 2;
            return 2;
        }
    }
    i = sub_8018324(15, gUnknown_02024A60, 0x2A, 0, 0);
    if (i != 0 && (gBattleMons[gUnknown_02024A60].type1 == 8 || gBattleMons[gUnknown_02024A60].type2 == 8))
    {
        ewram16003 = i - 1;
        byte_2024C06 = gBattleMons[i - 1].ability;
        gUnknown_02024D1E[5] = 2;
        return 2;
    }
    if ((gBattleMons[gUnknown_02024A60].status2 & 0x0400E000) || (gUnknown_02024C98[gUnknown_02024A60] & 0x400))
    {
        gUnknown_02024D1E[5] = 0;
        return 1;
    }
    if (gBattleTypeFlags & BATTLE_TYPE_FIRST_BATTLE)
    {
        gUnknown_02024D1E[5] = 1;
        return 1;
    }
    return 0;
}
