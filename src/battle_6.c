#include "global.h"
#include "battle.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "data2.h"
#include "menu_cursor.h"
#include "palette.h"
#include "pokemon.h"
#include "rom3.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "util.h"

//Possibly PokemonSubstruct1
struct UnknownStruct3
{
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;
};

extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042A0;

extern struct Window gUnknown_03004210;

extern void (*gBattleBankFunc[])(void);

extern u8 gActiveBank;
extern u8 gActionSelectionCursor[];
extern u8 gDisplayedStringBattle[];
extern u8 gMoveSelectionCursor[];
extern u8 gBattleBufferA[][0x200];
extern u8 gBankInMenu;
extern u16 gBattlePartyID[];
extern u8 gHealthboxIDs[];
extern u8 gDoingBattleAnim;
extern u8 gObjectBankIDs[];
extern u16 gBattleTypeFlags;
extern u8 gBattleOutcome;
extern void (*gAnimScriptCallback)(void);
extern bool8 gAnimScriptActive;
extern u16 gMovePowerMoveAnim;
extern u32 gMoveDmgMoveAnim;
extern u8 gHappinessMoveAnim;
extern u16 gWeatherMoveAnim;
extern u32 *gDisableStructMoveAnim;
extern u32 gPID_perBank[];
extern u8 gBattleMonForms[];
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E68[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern u8 gUnknown_0202F7C4;
extern u8 gUnknown_02038470[];
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030041B8;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042C0;
extern u8 gUnknown_03004344;
extern u8 gUnknown_0300434C[];

extern const u8 gUnknown_08400CA8[];
extern const u8 gUnknown_08400CF3[];
extern const u8 gUnknown_08400D38[];

#if ENGLISH
#define SUB_803037C_TILE_DATA_OFFSET 440
#elif GERMAN
#define SUB_803037C_TILE_DATA_OFFSET 444
#endif

extern void sub_802C68C(void);
extern void sub_802E1B0(void);
extern void sub_802E3B4();
extern void sub_802E220();
extern void sub_802E2D4();
extern void sub_802E004(void);
extern void sub_802DF30(void);
extern void sub_80325B8(void);
extern void PlayerBufferExecCompleted(void);
extern void bx_t1_healthbar_update(void);
extern void nullsub_91(void);
extern void sub_802D924(u8);
extern void sub_802E434(void);
extern bool8 mplay_80342A4(u8);
extern void move_anim_start_t2_for_situation();
extern void bx_blink_t1(void);
extern void sub_8047858();
extern u8 GetBankSide(u8);
extern void sub_80E43C0();
extern void oamt_add_pos2_onto_pos1();
extern void sub_8078B34(struct Sprite *);
extern void oamt_set_x3A_32();
extern void sub_80318FC();
extern bool8 IsDoubleBattle(void);
extern void sub_802D500(void);
extern void dp11b_obj_free();
extern bool8 sub_8078874(u8);
extern bool8 move_anim_start_t3();
extern void sub_802E460(void);
extern void b_link_standby_message(void);
extern void sub_802D18C(void);
extern void sub_802DF18(void);
extern void BufferStringBattle();
extern void sub_80326EC();
extern void ExecuteMoveAnim();
extern void sub_8031F24(void);
extern void sub_80324BC();
extern u8 sub_8031720();
extern void bx_wait_t1(void);
extern u8 GetBankByPlayerAI(u8);
extern void sub_802DE10(void);
extern void sub_80105EC(struct Sprite *);
extern void sub_802D274(void);
extern void sub_802D23C(void);
extern u8 GetBankIdentity(u8);
extern void sub_8031AF4();
extern void sub_80313A0(struct Sprite *);
extern void sub_802D204(void);
extern u8 sub_8079E90();
extern void sub_802DEAC(void);
extern void sub_80312F0(struct Sprite *);
extern u8 sub_8077ABC();
extern u8 sub_8077F68();
extern u8 sub_8046400();
extern void sub_802D798(void);
extern void bx_0802E404(void);

u32 dp01_getattr_by_ch1_for_player_pokemon_(u8, u8 *);
void dp01_setattr_by_ch1_for_player_pokemon(u8);
void sub_802F934(u8, u8);
void sub_802FB2C(void);
void sub_8030190(void);
void sub_80304A8(void);
void sub_8030E38(struct Sprite *);
void task05_08033660(u8);
void sub_8031064(void);

void PlayerHandleGetAttributes(void)
{
    u8 unkData[0x100];
    u32 offset = 0;
    u8 r4;
    s32 i;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        offset += dp01_getattr_by_ch1_for_player_pokemon_(gBattlePartyID[gActiveBank], unkData);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                offset += dp01_getattr_by_ch1_for_player_pokemon_(i, unkData + offset);
            r4 >>= 1;
        }
    }
    dp01_build_cmdbuf_x1D_1D_numargs_varargs(1, offset, unkData);
    PlayerBufferExecCompleted();
}

// Duplicate of dp01_getattr_by_ch1_for_player_pokemon
u32 dp01_getattr_by_ch1_for_player_pokemon_(u8 a, u8 *buffer)
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
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBank][1] - 4);
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
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBank][1] - 9);
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

void sub_802ECF0(void)
{
    struct BattlePokemon battleMon;  // I think this is a BattlePokemon
    u8 *src = (u8 *)&gPlayerParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1];
    u8 *dst = (u8 *)&battleMon + gBattleBufferA[gActiveBank][1];
    u8 i;

    for (i = 0; i < gBattleBufferA[gActiveBank][2]; i++)
        dst[i] = src[i];
    dp01_build_cmdbuf_x1D_1D_numargs_varargs(1, gBattleBufferA[gActiveBank][2], dst);
    PlayerBufferExecCompleted();
}

void PlayerHandleSetAttributes(void)
{
    u8 r4;
    u8 i;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        dp01_setattr_by_ch1_for_player_pokemon(gBattlePartyID[gActiveBank]);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                dp01_setattr_by_ch1_for_player_pokemon(i);
            r4 >>= 1;
        }
    }
    PlayerBufferExecCompleted();
}

// Duplicate of sub_811EC68
void dp01_setattr_by_ch1_for_player_pokemon(u8 a)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBank][3];
    struct UnknownStruct3 *moveData = (struct UnknownStruct3 *)&gBattleBufferA[gActiveBank][3];
    s32 i;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        {
            u8 iv;

            SetMonData(&gPlayerParty[a], MON_DATA_SPECIES, (u8 *)&battlePokemon->species);
            SetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM, (u8 *)&battlePokemon->item);
            for (i = 0; i < 4; i++)
            {
                SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + i, (u8 *)&battlePokemon->moves[i]);
                SetMonData(&gPlayerParty[a], MON_DATA_PP1 + i, (u8 *)&battlePokemon->pp[i]);
            }
            SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, (u8 *)&battlePokemon->ppBonuses);
            SetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP, (u8 *)&battlePokemon->friendship);
            SetMonData(&gPlayerParty[a], MON_DATA_EXP, (u8 *)&battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, (u8 *)&iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, (u8 *)&iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, (u8 *)&iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPD_IV, (u8 *)&iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, (u8 *)&iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, (u8 *)&iv);
            SetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY, (u8 *)&battlePokemon->personality);
            SetMonData(&gPlayerParty[a], MON_DATA_STATUS, (u8 *)&battlePokemon->status1);
            SetMonData(&gPlayerParty[a], MON_DATA_LEVEL, (u8 *)&battlePokemon->level);
            SetMonData(&gPlayerParty[a], MON_DATA_HP, (u8 *)&battlePokemon->hp);
            SetMonData(&gPlayerParty[a], MON_DATA_MAX_HP, (u8 *)&battlePokemon->maxHP);
            SetMonData(&gPlayerParty[a], MON_DATA_ATK, (u8 *)&battlePokemon->attack);
            SetMonData(&gPlayerParty[a], MON_DATA_DEF, (u8 *)&battlePokemon->defense);
            SetMonData(&gPlayerParty[a], MON_DATA_SPD, (u8 *)&battlePokemon->speed);
            SetMonData(&gPlayerParty[a], MON_DATA_SPATK, (u8 *)&battlePokemon->spAttack);
            SetMonData(&gPlayerParty[a], MON_DATA_SPDEF, (u8 *)&battlePokemon->spDefense);
        }
        break;
    case 1:
        SetMonData(&gPlayerParty[a], MON_DATA_SPECIES, &gBattleBufferA[gActiveBank][3]);
        break;
    case 2:
        SetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBank][3]);
        break;
    case 3:
        for (i = 0; i < 4; i++)
        {
            SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + i, (u8 *)&moveData->moves[i]);
            SetMonData(&gPlayerParty[a], MON_DATA_PP1 + i, (u8 *)&moveData->pp[i]);
        }
        SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBank][1] - 4, &gBattleBufferA[gActiveBank][3]);
        break;
    case 8:
        SetMonData(&gPlayerParty[a], MON_DATA_PP1, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP2, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP3, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP4, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBank][7]);
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        SetMonData(&gPlayerParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBank][1] - 9, &gBattleBufferA[gActiveBank][3]);
        break;
    case 17:
        SetMonData(&gPlayerParty[a], MON_DATA_OT_ID, &gBattleBufferA[gActiveBank][3]);
        break;
    case 18:
        SetMonData(&gPlayerParty[a], MON_DATA_EXP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 19:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 20:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 21:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 22:
        SetMonData(&gPlayerParty[a], MON_DATA_SPD_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 23:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 24:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 25:
        SetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 26:
        SetMonData(&gPlayerParty[a], MON_DATA_POKERUS, &gBattleBufferA[gActiveBank][3]);
        break;
    case 27:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBank][3]);
        break;
    case 28:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 29:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_GAME, &gBattleBufferA[gActiveBank][3]);
        break;
    case 30:
        SetMonData(&gPlayerParty[a], MON_DATA_POKEBALL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 31:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPD_IV, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBank][7]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBank][8]);
        break;
    case 32:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 33:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 34:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 35:
        SetMonData(&gPlayerParty[a], MON_DATA_SPD_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 36:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 37:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 38:
        SetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBank][3]);
        break;
    case 39:
        SetMonData(&gPlayerParty[a], MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBank][3]);
        break;
    case 40:
        SetMonData(&gPlayerParty[a], MON_DATA_STATUS, &gBattleBufferA[gActiveBank][3]);
        break;
    case 41:
        SetMonData(&gPlayerParty[a], MON_DATA_LEVEL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 42:
        SetMonData(&gPlayerParty[a], MON_DATA_HP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 43:
        SetMonData(&gPlayerParty[a], MON_DATA_MAX_HP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 44:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK, &gBattleBufferA[gActiveBank][3]);
        break;
    case 45:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF, &gBattleBufferA[gActiveBank][3]);
        break;
    case 46:
        SetMonData(&gPlayerParty[a], MON_DATA_SPD, &gBattleBufferA[gActiveBank][3]);
        break;
    case 47:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK, &gBattleBufferA[gActiveBank][3]);
        break;
    case 48:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF, &gBattleBufferA[gActiveBank][3]);
        break;
    case 49:
        SetMonData(&gPlayerParty[a], MON_DATA_COOL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 50:
        SetMonData(&gPlayerParty[a], MON_DATA_BEAUTY, &gBattleBufferA[gActiveBank][3]);
        break;
    case 51:
        SetMonData(&gPlayerParty[a], MON_DATA_CUTE, &gBattleBufferA[gActiveBank][3]);
        break;
    case 52:
        SetMonData(&gPlayerParty[a], MON_DATA_SMART, &gBattleBufferA[gActiveBank][3]);
        break;
    case 53:
        SetMonData(&gPlayerParty[a], MON_DATA_TOUGH, &gBattleBufferA[gActiveBank][3]);
        break;
    case 54:
        SetMonData(&gPlayerParty[a], MON_DATA_SHEEN, &gBattleBufferA[gActiveBank][3]);
        break;
    case 55:
        SetMonData(&gPlayerParty[a], MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 56:
        SetMonData(&gPlayerParty[a], MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 57:
        SetMonData(&gPlayerParty[a], MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 58:
        SetMonData(&gPlayerParty[a], MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 59:
        SetMonData(&gPlayerParty[a], MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    }
    sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
}

void sub_802F7CC(void)
{
    u8 *dst = (u8 *)&gPlayerParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1];
    u8 i;

    for (i = 0; i < gBattleBufferA[gActiveBank][2]; i++)
        dst[i] = gBattleBufferA[gActiveBank][3 + i];
    PlayerBufferExecCompleted();
}

void PlayerHandleLoadPokeSprite(void)
{
    sub_80318FC(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    gBattleBankFunc[gActiveBank] = bx_0802E404;
}

void PlayerHandleSendOutPoke(void)
{
    sub_8032AA8(gActiveBank, gBattleBufferA[gActiveBank][2]);
    gBattlePartyID[gActiveBank] = gBattleBufferA[gActiveBank][1];
    sub_80318FC(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
    gActionSelectionCursor[gActiveBank] = 0;
    gMoveSelectionCursor[gActiveBank] = 0;
    sub_802F934(gActiveBank, gBattleBufferA[gActiveBank][2]);
    gBattleBankFunc[gActiveBank] = sub_802D798;
}

void sub_802F934(u8 bank, u8 b)
{
    u16 species;

    sub_8032AA8(bank, b);
    gBattlePartyID[bank] = gBattleBufferA[bank][1];
    species = GetMonData(&gPlayerParty[gBattlePartyID[bank]], MON_DATA_SPECIES);
    gUnknown_0300434C[bank] = CreateInvisibleSpriteWithCallback(sub_80312F0);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(bank));
    gObjectBankIDs[bank] = CreateSprite(
      &gUnknown_02024E8C,
      sub_8077ABC(bank, 2),
      sub_8077F68(bank),
      sub_8079E90(bank));
    gSprites[gUnknown_0300434C[bank]].data1 = gObjectBankIDs[bank];
    gSprites[gObjectBankIDs[bank]].data0 = bank;
    gSprites[gObjectBankIDs[bank]].data2 = species;
    gSprites[gObjectBankIDs[bank]].oam.paletteNum = bank;
    StartSpriteAnim(&gSprites[gObjectBankIDs[bank]], gBattleMonForms[bank]);
    gSprites[gObjectBankIDs[bank]].invisible = TRUE;
    gSprites[gObjectBankIDs[bank]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[bank]].data0 = sub_8046400(0, 0xFF);
}

void PlayerHandleReturnPokeToBall(void)
{
    if (gBattleBufferA[gActiveBank][1] == 0)
    {
        ewram17810[gActiveBank].unk4 = 0;
        gBattleBankFunc[gActiveBank] = sub_802FB2C;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        PlayerBufferExecCompleted();
    }
}

void sub_802FB2C(void)
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
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 1);
            gBattleBankFunc[gActiveBank] = sub_802DEAC;
        }
    }
}

void PlayerHandleTrainerThrow(void)
{
    s16 r7;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (GetBankIdentity(gActiveBank) & 2)
            r7 = 16;
        else
            r7 = -16;
    }
    else
    {
        r7 = 0;
    }
    sub_8031AF4(gSaveBlock2.playerGender, gActiveBank);
    GetMonSpriteTemplate_803C5A0(gSaveBlock2.playerGender, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      r7 + 80,
      (8 - gTrainerBackPicCoords[gSaveBlock2.playerGender].coords) * 4 + 80,
      sub_8079E90(gActiveBank));
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = 240;
    gSprites[gObjectBankIDs[gActiveBank]].data0 = -2;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_802D204;
}

void PlayerHandleTrainerSlide(void)
{
    sub_8031AF4(gSaveBlock2.playerGender, gActiveBank);
    GetMonSpriteTemplate_803C5A0(gSaveBlock2.playerGender, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      80,
      (8 - gTrainerBackPicCoords[gSaveBlock2.playerGender].coords) * 4 + 80,
      30);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -96;
    gSprites[gObjectBankIDs[gActiveBank]].data0 = 2;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_802D23C;
}

void PlayerHandleTrainerSlideBack(void)
{
    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data0 = 50;
    gSprites[gObjectBankIDs[gActiveBank]].data2 = -40;
    gSprites[gObjectBankIDs[gActiveBank]].data4 = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    oamt_set_x3A_32(&gSprites[gObjectBankIDs[gActiveBank]], SpriteCallbackDummy);
    StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], 1);
    gBattleBankFunc[gActiveBank] = sub_802D274;
}

void sub_802FE7C(void)
{
    if (ewram17810[gActiveBank].unk4 == 0)
    {
        if (ewram17800[gActiveBank].unk0_2)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ewram17810[gActiveBank].unk4++;
    }
    else
    {
        if (ewram17810[gActiveBank].unk0_6 == 0)
        {
            ewram17810[gActiveBank].unk4 = 0;
            sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
            PlaySE12WithPanning(SE_POKE_DEAD, -64);
            gSprites[gObjectBankIDs[gActiveBank]].data1 = 0;
            gSprites[gObjectBankIDs[gActiveBank]].data2 = 5;
            gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80105EC;
            gBattleBankFunc[gActiveBank] = sub_802DE10;
        }
    }
}

void sub_802FF60(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 2, 0, 16, 0);
    PlayerBufferExecCompleted();
}

void sub_802FF80(void)
{
    ewram17840.unk8 = 4;
    gDoingBattleAnim = 1;
    move_anim_start_t4(gActiveBank, gActiveBank, GetBankByPlayerAI(1), 3);
    gBattleBankFunc[gActiveBank] = bx_wait_t1;
}

void PlayerHandleBallThrow(void)
{
    u8 var = gBattleBufferA[gActiveBank][1];

    ewram17840.unk8 = var;
    gDoingBattleAnim = 1;
    move_anim_start_t4(gActiveBank, gActiveBank, GetBankByPlayerAI(1), 3);
    gBattleBankFunc[gActiveBank] = bx_wait_t1;
}

void PlayerHandlePuase(void)
{
    u8 var = gBattleBufferA[gActiveBank][1];

    // WTF is this??
    while (var != 0)
        var--;

    PlayerBufferExecCompleted();
}

void PlayerHandleMoveAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        u16 r0 = gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8);

        gUnknown_0202F7C4 = gBattleBufferA[gActiveBank][3];
        gMovePowerMoveAnim = gBattleBufferA[gActiveBank][4] | (gBattleBufferA[gActiveBank][5] << 8);
        gMoveDmgMoveAnim = gBattleBufferA[gActiveBank][6] | (gBattleBufferA[gActiveBank][7] << 8) | (gBattleBufferA[gActiveBank][8] << 16) | (gBattleBufferA[gActiveBank][9] << 24);
        gHappinessMoveAnim = gBattleBufferA[gActiveBank][10];
        gWeatherMoveAnim = gBattleBufferA[gActiveBank][12] | (gBattleBufferA[gActiveBank][13] << 8);
        gDisableStructMoveAnim = (u32 *)&gBattleBufferA[gActiveBank][16];
        gPID_perBank[gActiveBank] = *gDisableStructMoveAnim;
        if (sub_8031720(r0, gUnknown_0202F7C4) != 0)
        {
            // Dead code. sub_8031720 always returns 0.
            PlayerBufferExecCompleted();
        }
        else
        {
            ewram17810[gActiveBank].unk4 = 0;
            gBattleBankFunc[gActiveBank] = sub_8030190;
        }
    }
}

void sub_8030190(void)
{
    u16 r4 = gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8);
    u8 r7 = gBattleBufferA[gActiveBank][11];

    switch (ewram17810[gActiveBank].unk4)
    {
    case 0:
        if (ewram17800[gActiveBank].unk0_2 == 1 && ewram17800[gActiveBank].unk0_3 == 0)
        {
            ewram17800[gActiveBank].unk0_3 = 1;
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        }
        ewram17810[gActiveBank].unk4 = 1;
        break;
    case 1:
        if (ewram17810[gActiveBank].unk0_6 == 0)
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
            if (ewram17800[gActiveBank].unk0_2 == 1 && r7 < 2)
            {
                move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
                ewram17800[gActiveBank].unk0_3 = 0;
            }
            ewram17810[gActiveBank].unk4 = 3;
        }
        break;
    case 3:
        if (ewram17810[gActiveBank].unk0_6 == 0)
        {
            sub_8031F24();
            sub_80324BC(gActiveBank, gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
            ewram17810[gActiveBank].unk4 = 0;
            PlayerBufferExecCompleted();
        }
        break;
    }
}

void PlayerHandlePrintString(void)
{
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    BufferStringBattle(*(u16 *)&gBattleBufferA[gActiveBank][2]);
    sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 0x90, 2, 15);
    gBattleBankFunc[gActiveBank] = sub_802DF18;
}

void PlayerHandlePrintStringPlayerOnly(void)
{
    if (GetBankSide(gActiveBank) == 0)
        PlayerHandlePrintString();
    else
        PlayerBufferExecCompleted();
}

void sub_803037C(void)
{
    int r4;

    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 160;
    FillWindowRect(&gUnknown_03004210, 10, 2, 15, 27, 18);
    FillWindowRect(&gUnknown_03004210, 10, 2, 35, 16, 38);

    gBattleBankFunc[gActiveBank] = sub_802C098;

    InitWindow(&gUnknown_03004210, gUnknown_08400CF3, 400, 18, 35);
    sub_8002F44(&gUnknown_03004210);
    sub_814A5C0(0, 0xFFFF, 12, 11679, 0);

    for (r4 = 0; r4 < 4; r4++)
        nullsub_8(r4);

    sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);

    StrCpyDecodeToDisplayedStringBattle((u8 *) gUnknown_08400CA8);
    InitWindow(&gUnknown_03004210, gDisplayedStringBattle, SUB_803037C_TILE_DATA_OFFSET, 2, 35);
    sub_8002F44(&gUnknown_03004210);
}

void nullsub_42()
{
}

void sub_8030468(void)
{
    sub_814A5C0(0, 0xFFFF, 12, 0x2D9F, 0);
    sub_80304A8();
    gBattleBankFunc[gActiveBank] = sub_802C68C;
}

void sub_80304A8(void)
{
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 320;
    sub_802E1B0();
    gUnknown_03004344 = 0xFF;
    sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
    if (gBattleBufferA[gActiveBank][2] != 1)
    {
        InitWindow(&gUnknown_03004210, gUnknown_08400D38, 656, 23, 55);
        sub_8002F44(&gUnknown_03004210);
    }
    sub_802E220();
    sub_802E2D4();
}

void PlayerHandleOpenBag(void)
{
    s32 i;

    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gBattleBankFunc[gActiveBank] = sub_802E004;
    gBankInMenu = gActiveBank;
    for (i = 0; i < 3; i++)
        gUnknown_02038470[i] = gBattleBufferA[gActiveBank][1 + i];
}

void sub_8030594(void)
{
    s32 i;

    gUnknown_0300434C[gActiveBank] = CreateTask(TaskDummy, 0xFF);
    gTasks[gUnknown_0300434C[gActiveBank]].data[0] = gBattleBufferA[gActiveBank][1] & 0xF;
    ewram[0x16054] = gBattleBufferA[gActiveBank][1] >> 4;
    ewram[0x1609D] = gBattleBufferA[gActiveBank][2];
    ewram[0x160C0] = gBattleBufferA[gActiveBank][3];
    for (i = 0; i < 3; i++)
        gUnknown_02038470[i] = gBattleBufferA[gActiveBank][4 + i];
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gBattleBankFunc[gActiveBank] = sub_802DF30;
    gBankInMenu = gActiveBank;
}

void sub_8030674(void)
{
    sub_80325B8();
    BeginNormalPaletteFade(0xFFFFFFFF, 2, 0, 16, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandleHealthBarUpdate(void)
{
    s16 r7;

    load_gfxc_health_bar(0);
    r7 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);
    if (r7 != 0x7FFF)
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);
        u32 curHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, curHP, r7);
    }
    else
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, 0, r7);
        sub_80440EC(gHealthboxIDs[gActiveBank], 0, 0);
    }
    gBattleBankFunc[gActiveBank] = bx_t1_healthbar_update;
}

void PlayerHandleExpBarUpdate(void)
{
    u8 r7 = gBattleBufferA[gActiveBank][1];

    if (GetMonData(&gPlayerParty[r7], MON_DATA_LEVEL) >= 100)
    {
        PlayerBufferExecCompleted();
    }
    else
    {
        u16 r4;
        u8 taskId;

        load_gfxc_health_bar(1);
        GetMonData(&gPlayerParty[r7], MON_DATA_SPECIES);  // unused return value
        r4 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);
        taskId = CreateTask(sub_802D924, 10);
        gTasks[taskId].data[0] = r7;
        gTasks[taskId].data[1] = r4;
        gTasks[taskId].data[2] = gActiveBank;
        gBattleBankFunc[gActiveBank] = nullsub_91;
    }
}

void PlayerHandleStatusIconUpdate(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        sub_8045A5C(gHealthboxIDs[gActiveBank], &gPlayerParty[gBattlePartyID[gActiveBank]], 9);
        ewram17810[gActiveBank].unk0_4 = 0;
        gBattleBankFunc[gActiveBank] = sub_802E434;
    }
}

void PlayerHandleStatusAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        move_anim_start_t2_for_situation(
          gBattleBufferA[gActiveBank][1],
          gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8) | (gBattleBufferA[gActiveBank][4] << 16) | (gBattleBufferA[gActiveBank][5] << 24));
        gBattleBankFunc[gActiveBank] = sub_802E434;
    }
}

void PlayerHandleStatusXor(void)
{
    u8 val = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_STATUS) ^ gBattleBufferA[gActiveBank][1];

    SetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_STATUS, &val);
    PlayerBufferExecCompleted();
}

void sub_803097C(void)
{
    PlayerBufferExecCompleted();
}

void PlayerHandleDMATransfer(void)
{
    u32 val1 = gBattleBufferA[gActiveBank][1]
            | (gBattleBufferA[gActiveBank][2] << 8)
            | (gBattleBufferA[gActiveBank][3] << 16)
            | (gBattleBufferA[gActiveBank][4] << 24);
    u16 val2 = gBattleBufferA[gActiveBank][5] | (gBattleBufferA[gActiveBank][6] << 8);

    const u8 *src = &gBattleBufferA[gActiveBank][7];
    u8 *dst = (u8 *)val1;
    u32 size = val2;

    while (1)
    {
        if (size <= 0x1000)
        {
            DmaCopy16(3, src, dst, size);
            break;
        }
        DmaCopy16(3, src, dst, 0x1000);
        src += 0x1000;
        dst += 0x1000;
        size -= 0x1000;
    }
    PlayerBufferExecCompleted();
}

void sub_8030A3C(void)
{
    PlayBGM(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    PlayerBufferExecCompleted();
}

void sub_8030A6C(void)
{
    PlayerBufferExecCompleted();
}

void sub_8030A78(void)
{
    dp01_build_cmdbuf_x21_a_bb(1, 0, 0);
    PlayerBufferExecCompleted();
}

void sub_8030A8C(void)
{
    dp01_build_cmdbuf_x22_a_three_bytes(1, 0, 0);
    PlayerBufferExecCompleted();
}

void sub_8030AA0(void)
{
    dp01_build_cmdbuf_x23_aa_0(1, 0);
    PlayerBufferExecCompleted();
}

void sub_8030AB4(void)
{
    dp01_build_cmdbuf_x24_aa_0(1, 0);
    PlayerBufferExecCompleted();
}

void sub_8030AC8(void)
{
    gUnknown_020238C8.unk0_0 = 0;
    PlayerBufferExecCompleted();
}

void sub_8030AE4(void)
{
    gUnknown_020238C8.unk0_0 = gBattleBufferA[gActiveBank][1];
    PlayerBufferExecCompleted();
}

void sub_8030B1C(void)
{
    gUnknown_020238C8.unk0_7 = 0;
    PlayerBufferExecCompleted();
}

void sub_8030B34(void)
{
    gUnknown_020238C8.unk0_7 ^= 1;
    PlayerBufferExecCompleted();
}

void PlayerHandleHitAnimation(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].invisible == TRUE)
    {
        PlayerBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = 1;
        gSprites[gObjectBankIDs[gActiveBank]].data1 = 0;
        sub_8047858(gActiveBank);
        gBattleBankFunc[gActiveBank] = bx_blink_t1;
    }
}

void sub_8030BCC(void)
{
    PlayerBufferExecCompleted();
}

void PlayerHandleEffectivenessSound(void)
{
    s8 pan;

    if (GetBankSide(gActiveBank) == 0)
        pan = -64;
    else
        pan = 63;
    PlaySE12WithPanning(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8), pan);
    PlayerBufferExecCompleted();
}

void sub_8030C1C(void)
{
    PlayFanfare(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    PlayerBufferExecCompleted();
}

void PlayerHandleFaintingCry(void)
{
    u16 species = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES);

    PlayCry3(species, -25, 5);
    PlayerBufferExecCompleted();
}

void PlayerHandleIntroSlide(void)
{
    sub_80E43C0(gBattleBufferA[gActiveBank][1]);
    gUnknown_02024DE8 |= 1;
    PlayerBufferExecCompleted();
}

void PlayerHandleTrainerBallThrow(void)
{
    u8 paletteNum;
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data0 = 50;
    gSprites[gObjectBankIDs[gActiveBank]].data2 = -40;
    gSprites[gObjectBankIDs[gActiveBank]].data4 = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    gSprites[gObjectBankIDs[gActiveBank]].data5 = gActiveBank;
    oamt_set_x3A_32(&gSprites[gObjectBankIDs[gActiveBank]], sub_8030E38);
    StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], 1);
    paletteNum = AllocSpritePalette(0xD6F8);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[gSaveBlock2.playerGender].data, 0x100 + paletteNum * 16, 32);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = paletteNum;
    taskId = CreateTask(task05_08033660, 5);
    gTasks[taskId].data[0] = gActiveBank;
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    ewram17810[4].unk9 |= 1;
    gBattleBankFunc[gActiveBank] = nullsub_91;
}

void sub_8030E38(struct Sprite *sprite)
{
    u8 r4 = sprite->data5;

    FreeSpriteOamMatrix(sprite);
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(sprite->oam.paletteNum));
    DestroySprite(sprite);
    sub_80318FC(&gPlayerParty[gBattlePartyID[r4]], r4);
    StartSpriteAnim(&gSprites[gObjectBankIDs[r4]], 0);
}

void task05_08033660(u8 taskId)
{
    if (gTasks[taskId].data[1] < 31)
    {
        gTasks[taskId].data[1]++;
    }
    else
    {
        u8 savedActiveBank = gActiveBank;

        gActiveBank = gTasks[taskId].data[0];
        if (!IsDoubleBattle() || (gBattleTypeFlags & 0x40))
        {
            gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
            sub_802F934(gActiveBank, 0);
        }
        else
        {
            gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
            sub_802F934(gActiveBank, 0);
            gActiveBank ^= 2;
            gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
            sub_80318FC(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
            sub_802F934(gActiveBank, 0);
            gActiveBank ^= 2;
        }
        gBattleBankFunc[gActiveBank] = sub_802D500;
        gActiveBank = savedActiveBank;
        DestroyTask(taskId);
    }
}

void sub_8030FAC(void)
{
    if (gBattleBufferA[gActiveBank][1] != 0 && GetBankSide(gActiveBank) == 0)
    {
        PlayerBufferExecCompleted();
    }
    else
    {
        ewram17810[gActiveBank].unk0_0 = 1;
        gUnknown_02024E68[gActiveBank] = sub_8044804(gActiveBank, (struct BattleInterfaceStruct2 *)&gBattleBufferA[gActiveBank][4], gBattleBufferA[gActiveBank][1], gBattleBufferA[gActiveBank][2]);
        ewram17810[gActiveBank].unk5 = 0;
        if (gBattleBufferA[gActiveBank][2] != 0)
            ewram17810[gActiveBank].unk5 = 0x5D;
        gBattleBankFunc[gActiveBank] = sub_8031064;
    }
}

void sub_8031064(void)
{
    if (ewram17810[gActiveBank].unk5++ > 0x5C)
    {
        ewram17810[gActiveBank].unk5 = 0;
        PlayerBufferExecCompleted();
    }
}

void sub_80310A4(void)
{
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    PlayerBufferExecCompleted();
}

void sub_80310F0(void)
{
    dp11b_obj_free(gActiveBank, 1);
    dp11b_obj_free(gActiveBank, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandleSpriteInvisibility(void)
{
    if (sub_8078874(gActiveBank))
    {
        gSprites[gObjectBankIDs[gActiveBank]].invisible = gBattleBufferA[gActiveBank][1];
        sub_8031F88(gActiveBank);
    }
    PlayerBufferExecCompleted();
}

void PlayerHandleBattleAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        u8 val2 = gBattleBufferA[gActiveBank][1];
        u16 val = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);

        if (move_anim_start_t3(gActiveBank, gActiveBank, gActiveBank, val2, val))
            PlayerBufferExecCompleted();
        else
            gBattleBankFunc[gActiveBank] = sub_802E460;
    }
}

void PlayerHandleLinkStandbyMsg(void)
{
    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        b_link_standby_message();
        // fall through
    case 1:
        dp11b_obj_free(gActiveBank, 1);
        dp11b_obj_free(gActiveBank, 0);
        break;
    case 2:
        b_link_standby_message();
        break;
    }
    PlayerBufferExecCompleted();
}

void PlayerHandleResetActionMoveSelection(void)
{
    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        gActionSelectionCursor[gActiveBank] = 0;
        gMoveSelectionCursor[gActiveBank] = 0;
        break;
    case 1:
        gActionSelectionCursor[gActiveBank] = 0;
        break;
    case 2:
        gMoveSelectionCursor[gActiveBank] = 0;
        break;
    }
    PlayerBufferExecCompleted();
}

void sub_80312A0(void)
{
    gBattleOutcome = gBattleBufferA[gActiveBank][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    PlayerBufferExecCompleted();
    gBattleBankFunc[gActiveBank] = sub_802D18C;
}

void nullsub_43(void)
{
}
