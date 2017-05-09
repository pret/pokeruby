#include "global.h"
#include "asm.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "pokemon.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "text.h"

struct UnknownStruct1
{
    u8 unk0;
    u8 unk1;
    u8 unk2[0x1FE];
};

struct UnknownStruct2
{
    u8 unk0;
    u8 unk1;
    u8 filler2[7];
    u8 unk9;
    u8 fillerA[2];
};

//Possibly PokemonSubstruct1
struct UnknownStruct3
{
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;
};

extern u32 gBitTable[];
extern u16 gBattleTypeFlags;

extern u8 gUnknown_02023A60[][0x200];
extern u8 gUnknown_02024A60;
extern u32 gUnknown_02024A64;
extern u16 gUnknown_02024A6A[];
extern u8 gUnknown_02024BE0[];
extern u8 gUnknown_02024E6D;
extern struct Window gUnknown_03004210;
extern MainCallback gUnknown_030042D0;
extern void (*gUnknown_03004330[])(void);
extern u8 gUnknown_03004340[];
extern u8 gUnknown_0300434C[];
extern void (*const gUnknown_083FE4F4[])(void);

extern u8 unk_2000000[];

#define EWRAM_17800 ((u8 *)(unk_2000000 + 0x17800))
#define EWRAM_17810 ((struct UnknownStruct2 *)(unk_2000000 + 0x17810))

extern void nullsub_10();
extern void sub_8045A5C();
extern void sub_804777C();
extern void sub_8043DFC();
extern s16 sub_8045C78();
extern void sub_80440EC();
extern void sub_80324F8();
extern void nullsub_9(u16);
extern void sub_8043DB0();
extern void move_anim_start_t4();
extern void c3_0802FDF4(u8);
extern void sub_8031F88();
extern void sub_8141828();
extern void c2_8011A1C(void);
extern void dp01_prepare_buffer_wireless_probably();
extern void dp01_build_cmdbuf_x1D_1D_numargs_varargs(int, u16, void *);

void sub_811DA94(void);
void sub_811E0A0(void);
void dp01_tbl3_exec_completed(void);
u32 dp01_getattr_by_ch1_for_player_pokemon(u8 a, u8 *b);
void sub_811EC68(u8);

void nullsub_74(void)
{
}

void sub_811DA78(void)
{
    gUnknown_03004330[gUnknown_02024A60] = sub_811DA94;
}

void sub_811DA94(void)
{
    if (gUnknown_02024A64 & gBitTable[gUnknown_02024A60])
    {
        if (gUnknown_02023A60[gUnknown_02024A60][0] <= 0x38)
            gUnknown_083FE4F4[gUnknown_02023A60[gUnknown_02024A60][0]]();
        else
            dp01_tbl3_exec_completed();
    }
}

void sub_811DAE4(void)
{
    if (gSprites[gUnknown_02024BE0[gUnknown_02024A60]].callback == SpriteCallbackDummy)
        dp01_tbl3_exec_completed();
}

void sub_811DB1C(void)
{
    if (gSprites[gUnknown_02024BE0[gUnknown_02024A60]].callback == SpriteCallbackDummy)
    {
        nullsub_10(0);
        FreeSpriteOamMatrix(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        DestroySprite(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        dp01_tbl3_exec_completed();
    }
}

void sub_811DB84(void)
{
    if ((--EWRAM_17810[gUnknown_02024A60].unk9) == 0xFF)
    {
        EWRAM_17810[gUnknown_02024A60].unk9 = 0;
        dp01_tbl3_exec_completed();
    }
}

void sub_811DBC0(void)
{
    bool8 r6 = FALSE;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & 0x40)))
    {
        if (gSprites[gUnknown_03004340[gUnknown_02024A60]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    else
    {
        if (gSprites[gUnknown_03004340[gUnknown_02024A60]].callback == SpriteCallbackDummy
         && gSprites[gUnknown_03004340[gUnknown_02024A60 ^ 2]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    if (IsCryPlayingOrClearCrySongs())
        r6 = FALSE;
    if (r6)
    {
        EWRAM_17810[gUnknown_02024A60].unk9 = 3;
        gUnknown_03004330[gUnknown_02024A60] = sub_811DB84;
    }
}

void sub_811DCA0(void)
{
    u8 r2;

    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 8))
    {
        r2 = EWRAM_17810[gUnknown_02024A60 ^ 2].unk0 & 8;
        if (!r2 && (++EWRAM_17810[gUnknown_02024A60].unk9) != 1)
        {
            EWRAM_17810[gUnknown_02024A60].unk9 = r2;
            if (IsDoubleBattle() && !(gBattleTypeFlags & 0x40))
            {
                DestroySprite(&gSprites[gUnknown_0300434C[gUnknown_02024A60 ^ 2]]);
                sub_8045A5C(gUnknown_03004340[gUnknown_02024A60 ^ 2], &gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60 ^ 2]], 0);
                sub_804777C(gUnknown_02024A60 ^ 2);
                sub_8043DFC(gUnknown_03004340[gUnknown_02024A60 ^ 2]);
            }
            DestroySprite(&gSprites[gUnknown_0300434C[gUnknown_02024A60]]);
            sub_8045A5C(gUnknown_03004340[gUnknown_02024A60], &gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], 0);
            sub_804777C(gUnknown_02024A60);
            sub_8043DFC(gUnknown_03004340[gUnknown_02024A60]);
            (s8)EWRAM_17810[4].unk9 &= ~1;
            gUnknown_03004330[gUnknown_02024A60] = sub_811DBC0;
        }
    }
}

void sub_811DDE8(void)
{
    if (gSprites[gUnknown_02024BE0[gUnknown_02024A60]].animEnded
     && gSprites[gUnknown_02024BE0[gUnknown_02024A60]].pos2.x == 0)
        dp01_tbl3_exec_completed();
}

void bx_t3_healthbar_update(void)
{
    s16 r4;

    r4 = sub_8045C78(gUnknown_02024A60, gUnknown_03004340[gUnknown_02024A60], 0, 0);
    sub_8043DFC(gUnknown_03004340[gUnknown_02024A60]);
    if (r4 != -1)
    {
        sub_80440EC(gUnknown_03004340[gUnknown_02024A60], r4, 0);
    }
    else
    {
        sub_80324F8(&gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], gUnknown_02024A60);
        dp01_tbl3_exec_completed();
    }
}

void sub_811DE98(void)
{
    if (gSprites[gUnknown_02024BE0[gUnknown_02024A60]].pos1.y + gSprites[gUnknown_02024BE0[gUnknown_02024A60]].pos2.y > 160)
    {
        nullsub_9(GetMonData(&gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], MON_DATA_SPECIES));
        FreeOamMatrix(gSprites[gUnknown_02024BE0[gUnknown_02024A60]].oam.matrixNum);
        DestroySprite(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        sub_8043DB0(gUnknown_03004340[gUnknown_02024A60]);
        dp01_tbl3_exec_completed();
    }
}

void sub_811DF34(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x40))
    {
        FreeSpriteOamMatrix(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        DestroySprite(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]]);
        sub_8043DB0(gUnknown_03004340[gUnknown_02024A60]);
        dp01_tbl3_exec_completed();
    }
}

void sub_811DFA0(void)
{
    if (gUnknown_03004210.state == 0)
        dp01_tbl3_exec_completed();
}

void bx_blink_t3(void)
{
    u8 spriteId = gUnknown_02024BE0[gUnknown_02024A60];
    if (gSprites[spriteId].data1 == 32)
    {
        gSprites[spriteId].data1 = 0;
        gSprites[spriteId].invisible = FALSE;
        gUnknown_02024E6D = 0;
        dp01_tbl3_exec_completed();
    }
    else
    {
        if ((gSprites[spriteId].data1 % 4) == 0)
        {
            gSprites[spriteId].invisible ^= 1;
        }
        gSprites[spriteId].data1++;
    }
}

void sub_811E034(void)
{
    if (gSprites[gUnknown_03004340[gUnknown_02024A60]].callback == SpriteCallbackDummy)
    {
        if (EWRAM_17800[gUnknown_02024A60 * 4] & 4)
            move_anim_start_t4(gUnknown_02024A60, gUnknown_02024A60, gUnknown_02024A60, 6);
        gUnknown_03004330[gUnknown_02024A60] = sub_811E0A0;
    }
}

void sub_811E0A0(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x40))
        dp01_tbl3_exec_completed();
}

void sub_811E0CC(void)
{
    if (EWRAM_17810[gUnknown_02024A60].unk1 & 1)
    {
        EWRAM_17810[gUnknown_02024A60].unk0 &= 0x7F;
        (s8)EWRAM_17810[gUnknown_02024A60].unk1 &= ~1;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        CreateTask(c3_0802FDF4, 10);
        sub_80324F8(&gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], gUnknown_02024A60);
        StartSpriteAnim(&gSprites[gUnknown_02024BE0[gUnknown_02024A60]], 0);
        sub_8045A5C(gUnknown_03004340[gUnknown_02024A60], &gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]], 0);
        sub_804777C(gUnknown_02024A60);
        sub_8043DFC(gUnknown_03004340[gUnknown_02024A60]);
        sub_8031F88(gUnknown_02024A60);
        gUnknown_03004330[gUnknown_02024A60] = sub_811E034;
    }
}

void sub_811E1BC(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x88))
        sub_8141828(gUnknown_02024A60, &gPlayerParty[gUnknown_02024A6A[gUnknown_02024A60]]);
    if (gSprites[gUnknown_0300434C[gUnknown_02024A60]].callback == SpriteCallbackDummy
     && !(EWRAM_17810[gUnknown_02024A60].unk0 & 8))
    {
        DestroySprite(&gSprites[gUnknown_0300434C[gUnknown_02024A60]]);
        gUnknown_03004330[gUnknown_02024A60] = sub_811E0CC;
    }
}

void sub_811E258(void)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        m4aSongNumStop(0x5A);
        gMain.inBattle = FALSE;
        gMain.callback1 = gUnknown_030042D0;
        SetMainCallback2(c2_8011A1C);
    }
}

void sub_811E29C(void)
{
    if (!gPaletteFade.active)
    {
        if (gBattleTypeFlags & 2)
        {
            sub_800832C();
            gUnknown_03004330[gUnknown_02024A60] = sub_811E258;
        }
        else
        {
            m4aSongNumStop(0x5A);
            gMain.inBattle = FALSE;
            gMain.callback1 = gUnknown_030042D0;
            SetMainCallback2(gMain.savedCallback);
        }
    }
}

void dp01_tbl3_exec_completed(void)
{
    u8 multiplayerId;

    gUnknown_03004330[gUnknown_02024A60] = sub_811DA94;
    if (gBattleTypeFlags & 2)
    {
        multiplayerId = GetMultiplayerId();
        dp01_prepare_buffer_wireless_probably(2, 4, &multiplayerId);
        gUnknown_02023A60[gUnknown_02024A60][0] = 0x38;
    }
    else
    {
        gUnknown_02024A64 &= ~gBitTable[gUnknown_02024A60];
    }
}

void sub_811E38C(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x10))
        dp01_tbl3_exec_completed();
}

void sub_811E3B8(void)
{
    if (!(EWRAM_17810[gUnknown_02024A60].unk0 & 0x20))
        dp01_tbl3_exec_completed();
}

void dp01t_00_3_getattr(void)
{
    u8 unk[256];
    int r6 = 0;
    s32 i;

    if (gUnknown_02023A60[gUnknown_02024A60][2] == 0)
    {
        r6 = dp01_getattr_by_ch1_for_player_pokemon(gUnknown_02024A6A[gUnknown_02024A60], unk);
    }
    else
    {
        u8 r4 = gUnknown_02023A60[gUnknown_02024A60][2];

        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                r6 += dp01_getattr_by_ch1_for_player_pokemon(i, unk + r6);
            r4 >>= 1;
        }
    }
    dp01_build_cmdbuf_x1D_1D_numargs_varargs(1, r6, unk);
    dp01_tbl3_exec_completed();
}

u32 dp01_getattr_by_ch1_for_player_pokemon(u8 a, u8 *buffer)
{
    struct BattlePokemon battlePokemon;
    struct UnknownStruct3 moveData;
    u8 nickname[20];
    u8 *src;
    s16 data16;
    u32 data32;
    s32 size = 0;

    switch (gUnknown_02023A60[gUnknown_02024A60][1])
    {
    case 0:
        battlePokemon.species = GetMonData(&gPlayerParty[a], MON_DATA_SPECIES);
        battlePokemon.item = GetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM);
        for (size = 0; size < 4; size++)
        {
            battlePokemon.moves[size] = GetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + size);
            battlePokemon.pp[size] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + size);
        }
        battlePokemon.ppBonuses = GetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES);
        battlePokemon.friendship = GetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP);
        battlePokemon.experience = GetMonData(&gPlayerParty[a], MON_DATA_EXP);
        battlePokemon.hpIV = GetMonData(&gPlayerParty[a], MON_DATA_HP_IV);
        battlePokemon.attackIV = GetMonData(&gPlayerParty[a], MON_DATA_ATK_IV);
        battlePokemon.defenseIV = GetMonData(&gPlayerParty[a], MON_DATA_DEF_IV);
        battlePokemon.speedIV = GetMonData(&gPlayerParty[a], MON_DATA_SPD_IV);
        battlePokemon.spAttackIV = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV);
        battlePokemon.spDefenseIV = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV);
        battlePokemon.personality = GetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY);
        battlePokemon.status1 = GetMonData(&gPlayerParty[a], MON_DATA_STATUS);
        battlePokemon.level = GetMonData(&gPlayerParty[a], MON_DATA_LEVEL);
        battlePokemon.hp = GetMonData(&gPlayerParty[a], MON_DATA_HP);
        battlePokemon.maxHP = GetMonData(&gPlayerParty[a], MON_DATA_MAX_HP);
        battlePokemon.attack = GetMonData(&gPlayerParty[a], MON_DATA_ATK);
        battlePokemon.defense = GetMonData(&gPlayerParty[a], MON_DATA_DEF);
        battlePokemon.speed = GetMonData(&gPlayerParty[a], MON_DATA_SPD);
        battlePokemon.spAttack = GetMonData(&gPlayerParty[a], MON_DATA_SPATK);
        battlePokemon.spDefense = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF);
        battlePokemon.isEgg = GetMonData(&gPlayerParty[a], MON_DATA_IS_EGG);
        battlePokemon.altAbility = GetMonData(&gPlayerParty[a], MON_DATA_ALT_ABILITY);
        battlePokemon.otId = GetMonData(&gPlayerParty[a], MON_DATA_OT_ID);
        GetMonData(&gPlayerParty[a], MON_DATA_NICKNAME, nickname);
        StringCopy10(battlePokemon.nickname, nickname);
        GetMonData(&gPlayerParty[a], MON_DATA_OT_NAME, battlePokemon.otName);
        src = (u8 *)&battlePokemon;
        for (size = 0; size < sizeof(battlePokemon); size++)
            buffer[size] = src[size];
        break;
    case 1:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPECIES);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 2:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 3:
        for (size = 0; size < 4; size++)
        {
            moveData.moves[size] = GetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + size);
            moveData.pp[size] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + size);
        }
        moveData.ppBonuses = GetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES);
        src = (u8 *)&moveData;
        for (size = 0; size < sizeof(moveData); size++)
            buffer[size] = src[size];
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        data16 = GetMonData(&gPlayerParty[a], gUnknown_02023A60[gUnknown_02024A60][1] + MON_DATA_CHECKSUM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 8:
        for (size = 0; size < 4; size++)
            buffer[size] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + size);
        buffer[size] = GetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES);
        size++;
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        buffer[0] = GetMonData(&gPlayerParty[a], gUnknown_02023A60[gUnknown_02024A60][1] + MON_DATA_MARKINGS);
        size = 1;
        break;
    case 17:
        data32 = GetMonData(&gPlayerParty[a], MON_DATA_OT_ID);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 18:
        data32 = GetMonData(&gPlayerParty[a], MON_DATA_EXP);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 19:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_HP_EV);
        size = 1;
        break;
    case 20:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_ATK_EV);
        size = 1;
        break;
    case 21:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_DEF_EV);
        size = 1;
        break;
    case 22:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPD_EV);
        size = 1;
        break;
    case 23:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_EV);
        size = 1;
        break;
    case 24:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_EV);
        size = 1;
        break;
    case 25:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP);
        size = 1;
        break;
    case 26:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_POKERUS);
        size = 1;
        break;
    case 27:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_MET_LOCATION);
        size = 1;
        break;
    case 28:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_MET_LEVEL);
        size = 1;
        break;
    case 29:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_MET_GAME);
        size = 1;
        break;
    case 30:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_POKEBALL);
        size = 1;
        break;
    case 31:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_HP_IV);
        buffer[1] = GetMonData(&gPlayerParty[a], MON_DATA_ATK_IV);
        buffer[2] = GetMonData(&gPlayerParty[a], MON_DATA_DEF_IV);
        buffer[3] = GetMonData(&gPlayerParty[a], MON_DATA_SPD_IV);
        buffer[4] = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV);
        buffer[5] = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV);
        size = 6;
        break;
    case 32:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_HP_IV);
        size = 1;
        break;
    case 33:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_ATK_IV);
        size = 1;
        break;
    case 34:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_DEF_IV);
        size = 1;
        break;
    case 35:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPD_IV);
        size = 1;
        break;
    case 36:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV);
        size = 1;
        break;
    case 37:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV);
        size = 1;
        break;
    case 38:
        data32 = GetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 39:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_CHECKSUM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 40:
        data32 = GetMonData(&gPlayerParty[a], MON_DATA_STATUS);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 41:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_LEVEL);
        size = 1;
        break;
    case 42:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_HP);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 43:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_MAX_HP);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 44:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_ATK);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 45:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_DEF);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 46:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPD);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 47:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPATK);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 48:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 49:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_COOL);
        size = 1;
        break;
    case 50:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_BEAUTY);
        size = 1;
        break;
    case 51:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_CUTE);
        size = 1;
        break;
    case 52:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SMART);
        size = 1;
        break;
    case 53:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_TOUGH);
        size = 1;
        break;
    case 54:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SHEEN);
        size = 1;
        break;
    case 55:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_COOL_RIBBON);
        size = 1;
        break;
    case 56:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_BEAUTY_RIBBON);
        size = 1;
        break;
    case 57:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_CUTE_RIBBON);
        size = 1;
        break;
    case 58:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SMART_RIBBON);
        size = 1;
        break;
    case 59:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_TOUGH_RIBBON);
        size = 1;
        break;
    }
    return size;
}

void sub_811EC04(void)
{
    dp01_tbl3_exec_completed();
}

void sub_811EC10(void)
{
    u8 i;
    u8 r4;

    if (gUnknown_02023A60[gUnknown_02024A60][2] == 0)
    {
        sub_811EC68(gUnknown_02024A6A[gUnknown_02024A60]);
    }
    else
    {
        r4 = gUnknown_02023A60[gUnknown_02024A60][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                sub_811EC68(i);
            r4 >>= 1;
        }
    }
    dp01_tbl3_exec_completed();
}
