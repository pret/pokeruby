#include "global.h"
#include "battle.h"
#include "battle_ai.h"
#include "data2.h"
#include "graphics.h"
#include "pokemon.h"
#include "rng.h"
#include "rom3.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "text.h"
#include "util.h"

struct UnknownStruct3
{
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;
};

extern u8 gActiveBank;
extern u8 gBattleBufferA[][0x200];
extern u16 gBattlePartyID[];
extern u8 gObjectBankIDs[];
extern u8 gBattleMonForms[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern void (*gBattleBankFunc[])(void);
extern u8 gUnknown_0300434C[];
extern u8 gHealthboxIDs[];
extern u16 gBattleTypeFlags;
extern u16 gTrainerBattleOpponent;
extern u32 *gDisableStructMoveAnim;
extern u32 gMoveDmgMoveAnim;
extern u16 gMovePowerMoveAnim;
extern u8 gHappinessMoveAnim;
extern u16 gWeatherMoveAnim;
extern u32 gPID_perBank[];
extern u8 gUnknown_0202F7C4;
extern u8 gAnimScriptActive;
extern void (*gAnimScriptCallback)(void);
extern struct Window gUnknown_03004210;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u8 gDisplayedStringBattle[];
extern u8 gBankTarget;
extern u8 gAbsentBankFlags;

extern u8 sub_8077ABC();
extern u8 sub_8077F68();
extern u8 sub_8079E90();
extern void sub_8033018(void);
extern void sub_8031794();
extern u8 GetBankIdentity(u8);
extern void sub_8032984(u8, u16);
extern void sub_80333D4(void);
extern void sub_80312F0(struct Sprite *);
extern u8 sub_8046400();
extern void sub_8032A08();
extern void sub_8043DB0();
extern void sub_8033160(void);
extern u8 sub_8135FBC(void);
extern u8 get_trainer_class_pic_index(void);
extern void sub_80313A0(struct Sprite *);
extern void sub_8032B4C(void);
extern void sub_8031A6C(u16, u8);
extern void sub_8032B84(void);
extern void sub_8078B34(struct Sprite *);
extern void sub_8032BBC(void);
extern void oamt_add_pos2_onto_pos1();
extern void oamt_set_x3A_32();
extern void sub_803311C(void);
extern void sub_8010384(struct Sprite *);
extern bool8 mplay_80342A4(u8);
extern u8 sub_8031720();
extern void ExecuteMoveAnim();
extern void sub_80326EC();
extern void sub_8031F24(void);
extern void sub_80324BC();
extern void BufferStringBattle();
extern void sub_80331D0(void);
extern void sub_8036B0C(void);
extern u8 GetBankByPlayerAI(u8);

u32 sub_8033598(u8, u8 *);
void sub_8033E24(u8);
void sub_803495C(u8, u8);
void sub_8034B74(void);
void sub_8035238(void);
void OpponentBufferExecCompleted(void);

void OpponentHandleGetAttributes(void)
{
    u8 buffer[256];
    int r6 = 0;
    s32 i;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        r6 = sub_8033598(gBattlePartyID[gActiveBank], buffer);
    }
    else
    {
        u8 r4 = gBattleBufferA[gActiveBank][2];

        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                r6 += sub_8033598(i, buffer + r6);
            r4 >>= 1;
        }
    }
    dp01_build_cmdbuf_x1D_1D_numargs_varargs(1, r6, buffer);
    OpponentBufferExecCompleted();
}

u32 sub_8033598(u8 a, u8 *buffer)
{
    struct BattlePokemon battlePokemon;
    struct UnknownStruct3 moveData;
    u8 nickname[20];
    u8 *src;
    s16 data16;
    u32 data32;
    s32 size = 0;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        battlePokemon.species = GetMonData(&gEnemyParty[a], MON_DATA_SPECIES);
        battlePokemon.item = GetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM);
        for (size = 0; size < 4; size++)
        {
            battlePokemon.moves[size] = GetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + size);
            battlePokemon.pp[size] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + size);
        }
        battlePokemon.ppBonuses = GetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES);
        battlePokemon.friendship = GetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP);
        battlePokemon.experience = GetMonData(&gEnemyParty[a], MON_DATA_EXP);
        battlePokemon.hpIV = GetMonData(&gEnemyParty[a], MON_DATA_HP_IV);
        battlePokemon.attackIV = GetMonData(&gEnemyParty[a], MON_DATA_ATK_IV);
        battlePokemon.defenseIV = GetMonData(&gEnemyParty[a], MON_DATA_DEF_IV);
        battlePokemon.speedIV = GetMonData(&gEnemyParty[a], MON_DATA_SPD_IV);
        battlePokemon.spAttackIV = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV);
        battlePokemon.spDefenseIV = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV);
        battlePokemon.personality = GetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY);
        battlePokemon.status1 = GetMonData(&gEnemyParty[a], MON_DATA_STATUS);
        battlePokemon.level = GetMonData(&gEnemyParty[a], MON_DATA_LEVEL);
        battlePokemon.hp = GetMonData(&gEnemyParty[a], MON_DATA_HP);
        battlePokemon.maxHP = GetMonData(&gEnemyParty[a], MON_DATA_MAX_HP);
        battlePokemon.attack = GetMonData(&gEnemyParty[a], MON_DATA_ATK);
        battlePokemon.defense = GetMonData(&gEnemyParty[a], MON_DATA_DEF);
        battlePokemon.speed = GetMonData(&gEnemyParty[a], MON_DATA_SPD);
        battlePokemon.spAttack = GetMonData(&gEnemyParty[a], MON_DATA_SPATK);
        battlePokemon.spDefense = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF);
        battlePokemon.isEgg = GetMonData(&gEnemyParty[a], MON_DATA_IS_EGG);
        battlePokemon.altAbility = GetMonData(&gEnemyParty[a], MON_DATA_ALT_ABILITY);
        battlePokemon.otId = GetMonData(&gEnemyParty[a], MON_DATA_OT_ID);
        GetMonData(&gEnemyParty[a], MON_DATA_NICKNAME, nickname);
        StringCopy10(battlePokemon.nickname, nickname);
        GetMonData(&gEnemyParty[a], MON_DATA_OT_NAME, battlePokemon.otName);
        src = (u8 *)&battlePokemon;
        for (size = 0; size < sizeof(battlePokemon); size++)
            buffer[size] = src[size];
        break;
    case 1:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPECIES);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 2:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 3:
        for (size = 0; size < 4; size++)
        {
            moveData.moves[size] = GetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + size);
            moveData.pp[size] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + size);
        }
        moveData.ppBonuses = GetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES);
        src = (u8 *)&moveData;
        for (size = 0; size < sizeof(moveData); size++)
            buffer[size] = src[size];
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBank][1] - 4);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 8:
        for (size = 0; size < 4; size++)
            buffer[size] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + size);
        buffer[size] = GetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES);
        size++;
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBank][1] - 9);
        size = 1;
        break;
    case 17:
        data32 = GetMonData(&gEnemyParty[a], MON_DATA_OT_ID);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 18:
        data32 = GetMonData(&gEnemyParty[a], MON_DATA_EXP);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 19:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_HP_EV);
        size = 1;
        break;
    case 20:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_ATK_EV);
        size = 1;
        break;
    case 21:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_DEF_EV);
        size = 1;
        break;
    case 22:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPD_EV);
        size = 1;
        break;
    case 23:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_EV);
        size = 1;
        break;
    case 24:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_EV);
        size = 1;
        break;
    case 25:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP);
        size = 1;
        break;
    case 26:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_POKERUS);
        size = 1;
        break;
    case 27:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_MET_LOCATION);
        size = 1;
        break;
    case 28:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_MET_LEVEL);
        size = 1;
        break;
    case 29:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_MET_GAME);
        size = 1;
        break;
    case 30:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_POKEBALL);
        size = 1;
        break;
    case 31:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_HP_IV);
        buffer[1] = GetMonData(&gEnemyParty[a], MON_DATA_ATK_IV);
        buffer[2] = GetMonData(&gEnemyParty[a], MON_DATA_DEF_IV);
        buffer[3] = GetMonData(&gEnemyParty[a], MON_DATA_SPD_IV);
        buffer[4] = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV);
        buffer[5] = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV);
        size = 6;
        break;
    case 32:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_HP_IV);
        size = 1;
        break;
    case 33:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_ATK_IV);
        size = 1;
        break;
    case 34:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_DEF_IV);
        size = 1;
        break;
    case 35:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPD_IV);
        size = 1;
        break;
    case 36:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV);
        size = 1;
        break;
    case 37:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV);
        size = 1;
        break;
    case 38:
        data32 = GetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 39:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_CHECKSUM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 40:
        data32 = GetMonData(&gEnemyParty[a], MON_DATA_STATUS);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 41:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_LEVEL);
        size = 1;
        break;
    case 42:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_HP);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 43:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_MAX_HP);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 44:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_ATK);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 45:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_DEF);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 46:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPD);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 47:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPATK);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 48:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 49:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_COOL);
        size = 1;
        break;
    case 50:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_BEAUTY);
        size = 1;
        break;
    case 51:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_CUTE);
        size = 1;
        break;
    case 52:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SMART);
        size = 1;
        break;
    case 53:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_TOUGH);
        size = 1;
        break;
    case 54:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SHEEN);
        size = 1;
        break;
    case 55:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_COOL_RIBBON);
        size = 1;
        break;
    case 56:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_BEAUTY_RIBBON);
        size = 1;
        break;
    case 57:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_CUTE_RIBBON);
        size = 1;
        break;
    case 58:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SMART_RIBBON);
        size = 1;
        break;
    case 59:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_TOUGH_RIBBON);
        size = 1;
        break;
    }
    return size;
}

void dp01t_01_2_read_pokmon_data_slice(void)
{
    struct BattlePokemon buffer;
    u8 *src = (u8 *)&gEnemyParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1];
    u8 *dst = (u8 *)&buffer + gBattleBufferA[gActiveBank][1];
    u8 i;

    for (i = 0; i < gBattleBufferA[gActiveBank][2]; i++)
        dst[i] = src[i];
    dp01_build_cmdbuf_x1D_1D_numargs_varargs(1, gBattleBufferA[gActiveBank][2], dst);
    OpponentBufferExecCompleted();
}

void OpponentHandleSetAttributes(void)
{
    u8 i;
    u8 r4;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        sub_8033E24(gBattlePartyID[gActiveBank]);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                sub_8033E24(i);
            r4 >>= 1;
        }
    }
    OpponentBufferExecCompleted();
}

void sub_8033E24(u8 a)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBank][3];
    struct UnknownStruct3 *moveData = (struct UnknownStruct3 *)&gBattleBufferA[gActiveBank][3];
    s32 i;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        {
            u8 iv;

            SetMonData(&gEnemyParty[a], MON_DATA_SPECIES, (u8 *)&battlePokemon->species);
            SetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM, (u8 *)&battlePokemon->item);
            for (i = 0; i < 4; i++)
            {
                SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + i, (u8 *)&battlePokemon->moves[i]);
                SetMonData(&gEnemyParty[a], MON_DATA_PP1 + i, (u8 *)&battlePokemon->pp[i]);
            }
            SetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES, (u8 *)&battlePokemon->ppBonuses);
            SetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP, (u8 *)&battlePokemon->friendship);
            SetMonData(&gEnemyParty[a], MON_DATA_EXP, (u8 *)&battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, (u8 *)&iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, (u8 *)&iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, (u8 *)&iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPD_IV, (u8 *)&iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, (u8 *)&iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, (u8 *)&iv);
            SetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY, (u8 *)&battlePokemon->personality);
            SetMonData(&gEnemyParty[a], MON_DATA_STATUS, (u8 *)&battlePokemon->status1);
            SetMonData(&gEnemyParty[a], MON_DATA_LEVEL, (u8 *)&battlePokemon->level);
            SetMonData(&gEnemyParty[a], MON_DATA_HP, (u8 *)&battlePokemon->hp);
            SetMonData(&gEnemyParty[a], MON_DATA_MAX_HP, (u8 *)&battlePokemon->maxHP);
            SetMonData(&gEnemyParty[a], MON_DATA_ATK, (u8 *)&battlePokemon->attack);
            SetMonData(&gEnemyParty[a], MON_DATA_DEF, (u8 *)&battlePokemon->defense);
            SetMonData(&gEnemyParty[a], MON_DATA_SPD, (u8 *)&battlePokemon->speed);
            SetMonData(&gEnemyParty[a], MON_DATA_SPATK, (u8 *)&battlePokemon->spAttack);
            SetMonData(&gEnemyParty[a], MON_DATA_SPDEF, (u8 *)&battlePokemon->spDefense);
        }
        break;
    case 1:
        SetMonData(&gEnemyParty[a], MON_DATA_SPECIES, &gBattleBufferA[gActiveBank][3]);
        break;
    case 2:
        SetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBank][3]);
        break;
    case 3:
        for (i = 0; i < 4; i++)
        {
            SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + i, (u8 *)&moveData->moves[i]);
            SetMonData(&gEnemyParty[a], MON_DATA_PP1 + i, (u8 *)&moveData->pp[i]);
        }
        SetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBank][1] - 4, &gBattleBufferA[gActiveBank][3]);
        break;
    case 8:
        SetMonData(&gEnemyParty[a], MON_DATA_PP1, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP2, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP3, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP4, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBank][7]);
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        SetMonData(&gEnemyParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBank][1] - 9, &gBattleBufferA[gActiveBank][3]);
        break;
    case 17:
        SetMonData(&gEnemyParty[a], MON_DATA_OT_ID, &gBattleBufferA[gActiveBank][3]);
        break;
    case 18:
        SetMonData(&gEnemyParty[a], MON_DATA_EXP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 19:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 20:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 21:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 22:
        SetMonData(&gEnemyParty[a], MON_DATA_SPD_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 23:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 24:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 25:
        SetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 26:
        SetMonData(&gEnemyParty[a], MON_DATA_POKERUS, &gBattleBufferA[gActiveBank][3]);
        break;
    case 27:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBank][3]);
        break;
    case 28:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 29:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_GAME, &gBattleBufferA[gActiveBank][3]);
        break;
    case 30:
        SetMonData(&gEnemyParty[a], MON_DATA_POKEBALL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 31:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPD_IV, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBank][7]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBank][8]);
        break;
    case 32:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 33:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 34:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 35:
        SetMonData(&gEnemyParty[a], MON_DATA_SPD_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 36:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 37:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 38:
        SetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBank][3]);
        break;
    case 39:
        SetMonData(&gEnemyParty[a], MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBank][3]);
        break;
    case 40:
        SetMonData(&gEnemyParty[a], MON_DATA_STATUS, &gBattleBufferA[gActiveBank][3]);
        break;
    case 41:
        SetMonData(&gEnemyParty[a], MON_DATA_LEVEL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 42:
        SetMonData(&gEnemyParty[a], MON_DATA_HP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 43:
        SetMonData(&gEnemyParty[a], MON_DATA_MAX_HP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 44:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK, &gBattleBufferA[gActiveBank][3]);
        break;
    case 45:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF, &gBattleBufferA[gActiveBank][3]);
        break;
    case 46:
        SetMonData(&gEnemyParty[a], MON_DATA_SPD, &gBattleBufferA[gActiveBank][3]);
        break;
    case 47:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK, &gBattleBufferA[gActiveBank][3]);
        break;
    case 48:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF, &gBattleBufferA[gActiveBank][3]);
        break;
    case 49:
        SetMonData(&gEnemyParty[a], MON_DATA_COOL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 50:
        SetMonData(&gEnemyParty[a], MON_DATA_BEAUTY, &gBattleBufferA[gActiveBank][3]);
        break;
    case 51:
        SetMonData(&gEnemyParty[a], MON_DATA_CUTE, &gBattleBufferA[gActiveBank][3]);
        break;
    case 52:
        SetMonData(&gEnemyParty[a], MON_DATA_SMART, &gBattleBufferA[gActiveBank][3]);
        break;
    case 53:
        SetMonData(&gEnemyParty[a], MON_DATA_TOUGH, &gBattleBufferA[gActiveBank][3]);
        break;
    case 54:
        SetMonData(&gEnemyParty[a], MON_DATA_SHEEN, &gBattleBufferA[gActiveBank][3]);
        break;
    case 55:
        SetMonData(&gEnemyParty[a], MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 56:
        SetMonData(&gEnemyParty[a], MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 57:
        SetMonData(&gEnemyParty[a], MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 58:
        SetMonData(&gEnemyParty[a], MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 59:
        SetMonData(&gEnemyParty[a], MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    }
}

void sub_8034744(void)
{
    u8 *dst;
    u8 i;

    dst = (u8 *)&gEnemyParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1];
    for (i = 0; i < gBattleBufferA[gActiveBank][2]; i++)
        dst[i] = gBattleBufferA[gActiveBank][3 + i];
    OpponentBufferExecCompleted();
}

void OpponentHandleLoadPokeSprite(void)
{
    u16 species = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES);

    sub_8031794(&gEnemyParty[gBattlePartyID[gActiveBank]], gActiveBank);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      sub_8077ABC(gActiveBank, 2),
      sub_8077F68(gActiveBank),
      sub_8079E90(gActiveBank));
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -240;
    gSprites[gObjectBankIDs[gActiveBank]].data0 = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].data2 = species;
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], gBattleMonForms[gActiveBank]);
    sub_8032984(gActiveBank, GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES));
    gBattleBankFunc[gActiveBank] = sub_8033018;
}

void OpponentHandleSendOutPoke(void)
{
    gBattlePartyID[gActiveBank] = gBattleBufferA[gActiveBank][1];
    
    sub_803495C(gActiveBank, gBattleBufferA[gActiveBank][2]);
    gBattleBankFunc[gActiveBank] = sub_80333D4;
}

void sub_803495C(u8 a, u8 b)
{
    u16 species;

    sub_8032AA8(a, b);
    gBattlePartyID[a] = gBattleBufferA[a][1];
    species = GetMonData(&gEnemyParty[gBattlePartyID[a]], MON_DATA_SPECIES);
    gUnknown_0300434C[a] = CreateInvisibleSpriteWithCallback(sub_80312F0);
    sub_8031794(&gEnemyParty[gBattlePartyID[a]], a);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(a));
    gObjectBankIDs[a] = CreateSprite(
      &gUnknown_02024E8C,
      sub_8077ABC(a, 2),
      sub_8077F68(a),
      sub_8079E90(a));
    gSprites[gObjectBankIDs[a]].data0 = a;
    gSprites[gObjectBankIDs[a]].data2 = species;
    gSprites[gUnknown_0300434C[a]].data1 = gObjectBankIDs[a];
    gSprites[gObjectBankIDs[a]].oam.paletteNum = a;
    StartSpriteAnim(&gSprites[gObjectBankIDs[a]], gBattleMonForms[a]);
    gSprites[gObjectBankIDs[a]].invisible = TRUE;
    gSprites[gObjectBankIDs[a]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[a]].data0 = sub_8046400(0, 0xFE);
}

void OpponentHandleReturnPokeToBall(void)
{
    if (gBattleBufferA[gActiveBank][1] == 0)
    {
        ewram17810[gActiveBank].unk4 = 0;
        gBattleBankFunc[gActiveBank] = sub_8034B74;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8032A08(gActiveBank);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        OpponentBufferExecCompleted();
    }
}

void sub_8034B74(void)
{
    switch (ewram17810[gActiveBank].unk4)
    {
    case 0:
        if (ewram17800[gActiveBank].unk0_2)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ewram17810[gActiveBank].unk4 = 1;
        break;
    case 1:
        if (!ewram17810[gActiveBank].unk0_6)
        {
            ewram17810[gActiveBank].unk4 = 0;
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 2);
            gBattleBankFunc[gActiveBank] = sub_8033160;
        }
        break;
    }
}

void OpponentHandleTrainerThrow(void)
{
    u32 trainerPicIndex;

    if (gTrainerBattleOpponent == 0x400)
        trainerPicIndex = GetSecretBaseTrainerPicIndex();
    else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
        trainerPicIndex = get_trainer_class_pic_index();
    else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
        trainerPicIndex = sub_8135FBC();
    else
        trainerPicIndex = gTrainers[gTrainerBattleOpponent].trainerPic;
    
    sub_8031A6C(trainerPicIndex, gActiveBank);
    GetMonSpriteTemplate_803C5A0(trainerPicIndex, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      0xB0,
      40 + 4 * (8 - gTrainerFrontPicCoords[trainerPicIndex].coords),
      sub_8079E90(gActiveBank));
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -240;
    gSprites[gObjectBankIDs[gActiveBank]].data0 = 2;
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[trainerPicIndex].tag);
    gSprites[gObjectBankIDs[gActiveBank]].data5 = gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum;
    gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[trainerPicIndex].tag);
    gSprites[gObjectBankIDs[gActiveBank]].oam.affineParam = trainerPicIndex;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_8032B4C;
}

void OpponentHandleTrainerSlide(void)
{
    u32 trainerPicIndex;

    if (gTrainerBattleOpponent == 0x400)
        trainerPicIndex = GetSecretBaseTrainerPicIndex();
    else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
        trainerPicIndex = get_trainer_class_pic_index();
    else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
        trainerPicIndex = sub_8135FBC();
    else
        trainerPicIndex = gTrainers[gTrainerBattleOpponent].trainerPic;
    
    sub_8031A6C(trainerPicIndex, gActiveBank);
    GetMonSpriteTemplate_803C5A0(trainerPicIndex, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      0xB0,
      40 + 4 * (8 - gTrainerFrontPicCoords[trainerPicIndex].coords),
      0x1E);
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = 96;
    gSprites[gObjectBankIDs[gActiveBank]].pos1.x += 32;
    gSprites[gObjectBankIDs[gActiveBank]].data0 = -2;
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[trainerPicIndex].tag);
    gSprites[gObjectBankIDs[gActiveBank]].data5 = gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum;
    gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[trainerPicIndex].tag);
    gSprites[gObjectBankIDs[gActiveBank]].oam.affineParam = trainerPicIndex;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_8032B84;
}

void OpponentHandleTrainerSlideBack(void)
{
    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data0 = 35;
    gSprites[gObjectBankIDs[gActiveBank]].data2 = 280;
    gSprites[gObjectBankIDs[gActiveBank]].data4 = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    oamt_set_x3A_32(&gSprites[gObjectBankIDs[gActiveBank]], SpriteCallbackDummy);
    gBattleBankFunc[gActiveBank] = sub_8032BBC;
}

void sub_8035030(void)
{
    if (ewram17810[gActiveBank].unk4 == 0)
    {
        if (ewram17800[gActiveBank].unk0_2)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ewram17810[gActiveBank].unk4++;
    }
    else if (!ewram17810[gActiveBank].unk0_6)
    {
        ewram17810[gActiveBank].unk4 = 0;
        PlaySE12WithPanning(SE_POKE_DEAD, 63);
        gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8010384;
        gBattleBankFunc[gActiveBank] = sub_803311C;
    }
}

void sub_80350D4(void)
{
    OpponentBufferExecCompleted();
}

void sub_80350E0(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleBallThrow(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlePause(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleMoveAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        u32 r0 = gBattleBufferA[gActiveBank][1]
               | (gBattleBufferA[gActiveBank][2] << 8);

        gUnknown_0202F7C4 = gBattleBufferA[gActiveBank][3];
        gMovePowerMoveAnim = gBattleBufferA[gActiveBank][4]
                          | (gBattleBufferA[gActiveBank][5] << 8);
        gMoveDmgMoveAnim = gBattleBufferA[gActiveBank][6]
                          | (gBattleBufferA[gActiveBank][7] << 8)
                          | (gBattleBufferA[gActiveBank][8] << 16)
                          | (gBattleBufferA[gActiveBank][9] << 24);
        gHappinessMoveAnim = gBattleBufferA[gActiveBank][10];
        gWeatherMoveAnim = gBattleBufferA[gActiveBank][12]
                          | (gBattleBufferA[gActiveBank][13] << 8);
        gDisableStructMoveAnim = (u32 *)&gBattleBufferA[gActiveBank][16];
        gPID_perBank[gActiveBank] = *gDisableStructMoveAnim;

        // Dead code. sub_8031720 always returns 0.
        if (sub_8031720(r0, gUnknown_0202F7C4) != 0)
        {
            OpponentBufferExecCompleted();
        }
        else
        {
            ewram17810[gActiveBank].unk4 = 0;
            gBattleBankFunc[gActiveBank] = sub_8035238;
        }
    }
}

void sub_8035238(void)
{
    u16 r4 = gBattleBufferA[gActiveBank][1]
           | (gBattleBufferA[gActiveBank][2] << 8);
    u8 r7 = gBattleBufferA[gActiveBank][11];

    switch (ewram17810[gActiveBank].unk4)
    {
    case 0:
        if (ewram17800[gActiveBank].unk0_2 && !ewram17800[gActiveBank].unk0_3)
        {
            ewram17800[gActiveBank].unk0_3 = 1;
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        }
        ewram17810[gActiveBank].unk4 = 1;
        break;
    case 1:
        if (!ewram17810[gActiveBank].unk0_6)
        {
            sub_80326EC(0);
            ExecuteMoveAnim(r4);
            ewram17810[gActiveBank].unk4 = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_80326EC(1);
            if ((ewram17800[gActiveBank].unk0_2) && r7 <= 1)
            {
                move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
                ewram17800[gActiveBank].unk0_3 = 0;
            }
            ewram17810[gActiveBank].unk4 = 3;
        }
        break;
    case 3:
        if (!ewram17810[gActiveBank].unk0_6)
        {
            sub_8031F24();
            sub_80324BC(
              gActiveBank,
              gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
            ewram17810[gActiveBank].unk4 = 0;
            OpponentBufferExecCompleted();
        }
        break;
    }
}

void OpponentHandlePrintString(void)
{
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    BufferStringBattle(*(u16 *)&gBattleBufferA[gActiveBank][2]);
    sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
    gBattleBankFunc[gActiveBank] = sub_80331D0;
}

void OpponentHandlePrintStringPlayerOnly(void)
{
    OpponentBufferExecCompleted();
}

void sub_803540C(void)
{
    sub_8036B0C();
    OpponentBufferExecCompleted();
}

void sub_803541C(void)
{
    OpponentBufferExecCompleted();
}

#ifdef NONMATCHING
void sub_8035428(void)
{
    u16 r4;
    // Needed to match closer
    struct {u16 moves[4];} *r5 = (void *)&gBattleBufferA[gActiveBank][4];
    
    if (gBattleTypeFlags & 0x498)
    {
        BattleAI_SetupAIData();
        r4 = BattleAI_GetAIActionToUse();
        switch (r4)
        {
        case 5:
            dp01_build_cmdbuf_x21_a_bb(1, 4, 0);
            break;
        case 4:
            dp01_build_cmdbuf_x21_a_bb(1, 3, 0);
            break;
        default:
            if (gBattleMoves[r5->moves[r4]].target & 0x12)
                gBankTarget = gActiveBank;
            if (gBattleMoves[r5->moves[r4]].target & 8)
            {
                gBankTarget = GetBankByPlayerAI(0);
                if (gAbsentBankFlags & gBitTable[gBankTarget])
                    gBankTarget = GetBankByPlayerAI(2);
            }
            r4 |= gBankTarget << 8;
            dp01_build_cmdbuf_x21_a_bb(1, 10, r4);
            break;
        }
        OpponentBufferExecCompleted();
    }
    else
    {
        u16 r2;
        
        do
        {
            // Can't for the life of me get this to match.
            r4 = Random() % 4;
            r2 = r5->moves[r4];
        } while (r2 == 0);
        
        if (gBattleMoves[r2].target & 0x12)
        {
            r4 |= gActiveBank << 8;
            dp01_build_cmdbuf_x21_a_bb(1, 10, r4);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            u16 r2 = GetBankByPlayerAI(Random() & 2) << 8;
            
            dp01_build_cmdbuf_x21_a_bb(1, 10, r4 | r2);
        }
        else
        {
            u16 r2 = GetBankByPlayerAI(0) << 8;
            
            dp01_build_cmdbuf_x21_a_bb(1, 10, r4 | r2);
        }
        OpponentBufferExecCompleted();
    }
}
#else
__attribute__((naked))
void sub_8035428(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    ldr r6, _0803545C @ =gActiveBank\n\
    ldrb r0, [r6]\n\
    lsls r0, 9\n\
    ldr r1, _08035460 @ =gUnknown_02023A64\n\
    adds r5, r0, r1\n\
    ldr r0, _08035464 @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x93\n\
    lsls r0, 3\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080354F8\n\
    bl BattleAI_SetupAIData\n\
    bl BattleAI_GetAIActionToUse\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    cmp r4, 0x4\n\
    beq _08035468\n\
    cmp r4, 0x5\n\
    bne _08035474\n\
    movs r0, 0x1\n\
    movs r1, 0x4\n\
    b _0803546C\n\
    .align 2, 0\n\
_0803545C: .4byte gActiveBank\n\
_08035460: .4byte gUnknown_02023A64\n\
_08035464: .4byte gBattleTypeFlags\n\
_08035468:\n\
    movs r0, 0x1\n\
    movs r1, 0x3\n\
_0803546C:\n\
    movs r2, 0\n\
    bl dp01_build_cmdbuf_x21_a_bb\n\
    b _080354E0\n\
_08035474:\n\
    ldr r3, _080354E8 @ =gBattleMoves\n\
    lsls r0, r4, 1\n\
    adds r2, r5, r0\n\
    ldrh r1, [r2]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r3\n\
    ldrb r1, [r0, 0x6]\n\
    movs r0, 0x12\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08035494\n\
    ldr r1, _080354EC @ =gBankTarget\n\
    ldrb r0, [r6]\n\
    strb r0, [r1]\n\
_08035494:\n\
    ldrh r1, [r2]\n\
    lsls r0, r1, 1\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r3\n\
    ldrb r1, [r0, 0x6]\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080354CE\n\
    movs r0, 0\n\
    bl GetBankByPlayerAI\n\
    ldr r5, _080354EC @ =gBankTarget\n\
    strb r0, [r5]\n\
    ldr r0, _080354F0 @ =gAbsentBankFlags\n\
    ldrb r1, [r0]\n\
    ldr r2, _080354F4 @ =gBitTable\n\
    ldrb r0, [r5]\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    ldr r0, [r0]\n\
    ands r1, r0\n\
    cmp r1, 0\n\
    beq _080354CE\n\
    movs r0, 0x2\n\
    bl GetBankByPlayerAI\n\
    strb r0, [r5]\n\
_080354CE:\n\
    ldr r0, _080354EC @ =gBankTarget\n\
    ldrb r0, [r0]\n\
    lsls r0, 8\n\
    orrs r4, r0\n\
    movs r0, 0x1\n\
    movs r1, 0xA\n\
    adds r2, r4, 0\n\
    bl dp01_build_cmdbuf_x21_a_bb\n\
_080354E0:\n\
    bl OpponentBufferExecCompleted\n\
    b _0803558A\n\
    .align 2, 0\n\
_080354E8: .4byte gBattleMoves\n\
_080354EC: .4byte gBankTarget\n\
_080354F0: .4byte gAbsentBankFlags\n\
_080354F4: .4byte gBitTable\n\
_080354F8:\n\
    movs r6, 0x3\n\
_080354FA:\n\
    bl Random\n\
    adds r4, r0, 0\n\
    ands r4, r6\n\
    lsls r0, r4, 1\n\
    adds r0, r5, r0\n\
    ldrh r2, [r0]\n\
    cmp r2, 0\n\
    beq _080354FA\n\
    ldr r1, _08035534 @ =gBattleMoves\n\
    lsls r0, r2, 1\n\
    adds r0, r2\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrb r1, [r0, 0x6]\n\
    movs r0, 0x12\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0803553C\n\
    ldr r0, _08035538 @ =gActiveBank\n\
    ldrb r0, [r0]\n\
    lsls r0, 8\n\
    orrs r4, r0\n\
    movs r0, 0x1\n\
    movs r1, 0xA\n\
    adds r2, r4, 0\n\
    bl dp01_build_cmdbuf_x21_a_bb\n\
    b _08035586\n\
    .align 2, 0\n\
_08035534: .4byte gBattleMoves\n\
_08035538: .4byte gActiveBank\n\
_0803553C:\n\
    ldr r0, _0803556C @ =gBattleTypeFlags\n\
    ldrh r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08035570\n\
    bl Random\n\
    movs r1, 0x2\n\
    ands r1, r0\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r0, r1, 0\n\
    bl GetBankByPlayerAI\n\
    adds r2, r0, 0\n\
    lsls r2, 24\n\
    lsrs r2, 16\n\
    orrs r2, r4\n\
    movs r0, 0x1\n\
    movs r1, 0xA\n\
    bl dp01_build_cmdbuf_x21_a_bb\n\
    b _08035586\n\
    .align 2, 0\n\
_0803556C: .4byte gBattleTypeFlags\n\
_08035570:\n\
    movs r0, 0\n\
    bl GetBankByPlayerAI\n\
    adds r2, r0, 0\n\
    lsls r2, 24\n\
    lsrs r2, 16\n\
    orrs r2, r4\n\
    movs r0, 0x1\n\
    movs r1, 0xA\n\
    bl dp01_build_cmdbuf_x21_a_bb\n\
_08035586:\n\
    bl OpponentBufferExecCompleted\n\
_0803558A:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif
