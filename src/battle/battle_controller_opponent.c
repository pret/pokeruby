#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "data2.h"
#include "battle_811DA74.h"
#include "battle_anim_813F0F4.h"
#include "battle_tower.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "pokeball.h"
#include "pokemon.h"
#include "rom3.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "constants/songs.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "util.h"
#include "ewram.h"

struct MovePpInfo
{
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;
};

extern u8 gUnknown_02023A14_50;
extern u8 gActiveBank;
extern u8 gBattleBufferA[][0x200];
extern u16 gBattlePartyID[];
extern u8 gBankSpriteIds[];
extern u8 gBattleMonForms[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern void (*gBattleBankFunc[])(void);
extern u8 gUnknown_0300434C[];
extern u8 gHealthboxIDs[];
extern u16 gBattleTypeFlags;
extern u16 gTrainerBattleOpponent;
extern u32 gAnimMoveDmg;
extern u16 gAnimMovePower;
extern u8 gAnimFriendship;
extern u16 gWeatherMoveAnim;
extern u32 gTransformedPersonalities[];
extern u8 gAnimMoveTurn;
extern u8 gAnimScriptActive;
extern void (*gAnimScriptCallback)(void);
extern struct Window gUnknown_03004210;
extern u8 gDisplayedStringBattle[];
extern u8 gBankTarget;
extern u8 gAbsentBankFlags;
extern bool8 gDoingBattleAnim;
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E68[];
extern MainCallback gPreBattleCallback1;
extern void (*const gOpponentBufferCommands[])(void);
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;
extern struct MusicPlayerInfo gMPlay_BGM;
extern u32 gBattleExecBuffer;

extern u8 GetBankPosition();
extern u8 sub_8077F68();
extern u8 sub_8079E90();
extern void sub_8033018(void);
extern void BattleLoadOpponentMonSprite();
extern u8 GetBankIdentity(u8);
extern void sub_8032984(u8, u16);
extern void sub_80333D4(void);
extern void sub_80312F0(struct Sprite *);
extern u8 sub_8046400();
extern void sub_8032A08();
extern void sub_8043DB0();
extern void sub_8033160(void);
extern u8 get_trainer_class_pic_index(void);
extern void sub_80313A0(struct Sprite *);
extern void sub_8032B4C(void);
extern void sub_8031A6C(u16, u8);
extern void sub_8032B84(void);
extern void StartTranslateAnimSpriteByDeltas(struct Sprite *);
extern void sub_8032BBC(void);
extern void oamt_add_pos2_onto_pos1();
extern void StoreSpriteCallbackInData();
extern void sub_803311C(void);
extern void sub_8010384(struct Sprite *);
extern bool8 mplay_80342A4(u8);
extern u8 sub_8031720();
extern void DoMoveAnim();
extern void sub_80326EC();
extern void sub_8031F24(void);
extern void sub_80324BC();
extern void BufferStringBattle();
extern void sub_80331D0(void);
extern void sub_8036B0C(void);
extern u8 GetBankByIdentity(u8);
extern u8 sub_8036CD4(void);
extern void sub_80330C8(void);
extern void sub_8043D84();
extern void sub_8045A5C();
void sub_8033494(void);
extern void move_anim_start_t2_for_situation();
extern void bx_blink_t7(void);
extern void sub_8047858();
extern u8 GetBankSide(u8);
extern void StartBattleIntroAnim();
extern void sub_8044CA0(u8);
extern void nullsub_45(void);
extern void sub_8031B74();
extern bool8 IsDoubleBattle(void);
extern void sub_8032E2C(void);
extern u8 IsBankSpritePresent();
extern u8 move_anim_start_t3();
extern void sub_80334C0(void);

// this file's functions

void OpponentBufferExecCompleted(void);
void OpponentBufferRunCommand(void);
u32 sub_8033598(u8, u8 *);
void sub_8033E24(u8);
void sub_803495C(u8, u8);
void sub_8034B74(void);
void sub_8035238(void);
void sub_8035C10(struct Sprite *);
void sub_8035C44(u8);
void sub_8035E2C(void);
void sub_80332D0(void);

void OpponentHandleGetAttributes(void);
void OpponentHandlecmd1(void);
void OpponentHandleSetAttributes(void);
void OpponentHandlecmd3(void);
void OpponentHandleLoadPokeSprite(void);
void OpponentHandleSendOutPoke(void);
void OpponentHandleReturnPokeToBall(void);
void OpponentHandleTrainerThrow(void);
void OpponentHandleTrainerSlide(void);
void OpponentHandleTrainerSlideBack(void);
void OpponentHandlecmd10(void);
void OpponentHandlecmd11(void);
void OpponentHandlecmd12(void);
void OpponentHandleBallThrow(void);
void OpponentHandlePuase(void);
void OpponentHandleMoveAnimation(void);
void OpponentHandlePrintString(void);
void OpponentHandlePrintStringPlayerOnly(void);
void OpponentHandlecmd18(void);
void OpponentHandlecmd19(void);
void OpponentHandlecmd20(void);
void OpponentHandleOpenBag(void);
void OpponentHandlecmd22(void);
void OpponentHandlecmd23(void);
void OpponentHandleHealthBarUpdate(void);
void OpponentHandleExpBarUpdate(void);
void OpponentHandleStatusIconUpdate(void);
void OpponentHandleStatusAnimation(void);
void OpponentHandleStatusXor(void);
void OpponentHandlecmd29(void);
void OpponentHandleDMATransfer(void);
void OpponentHandlecmd31(void);
void OpponentHandlecmd32(void);
void OpponentHandlecmd33(void);
void OpponentHandlecmd34(void);
void OpponentHandlecmd35(void);
void OpponentHandlecmd36(void);
void OpponentHandlecmd37(void);
void OpponentHandlecmd38(void);
void OpponentHandlecmd39(void);
void OpponentHandlecmd40(void);
void OpponentHandleHitAnimation(void);
void OpponentHandlecmd42(void);
void OpponentHandleEffectivenessSound(void);
void OpponentHandlecmd44(void);
void OpponentHandleFaintingCry(void);
void OpponentHandleIntroSlide(void);
void OpponentHandleTrainerBallThrow(void);
void OpponentHandlecmd48(void);
void OpponentHandlecmd49(void);
void OpponentHandlecmd50(void);
void OpponentHandleSpriteInvisibility(void);
void OpponentHandleBattleAnimation(void);
void OpponentHandleLinkStandbyMsg(void);
void OpponentHandleResetActionMoveSelection(void);
void OpponentHandlecmd55(void);
void OpponentHandlecmd56(void);

// const data
typedef void (*BattleBufferCmd) (void);
static const BattleBufferCmd gOpponentBufferCommands[] =
{
    OpponentHandleGetAttributes,
    OpponentHandlecmd1,
    OpponentHandleSetAttributes,
    OpponentHandlecmd3,
    OpponentHandleLoadPokeSprite,
    OpponentHandleSendOutPoke,
    OpponentHandleReturnPokeToBall,
    OpponentHandleTrainerThrow,
    OpponentHandleTrainerSlide,
    OpponentHandleTrainerSlideBack,
    OpponentHandlecmd10,
    OpponentHandlecmd11,
    OpponentHandlecmd12,
    OpponentHandleBallThrow,
    OpponentHandlePuase,
    OpponentHandleMoveAnimation,
    OpponentHandlePrintString,
    OpponentHandlePrintStringPlayerOnly,
    OpponentHandlecmd18,
    OpponentHandlecmd19,
    OpponentHandlecmd20,
    OpponentHandleOpenBag,
    OpponentHandlecmd22,
    OpponentHandlecmd23,
    OpponentHandleHealthBarUpdate,
    OpponentHandleExpBarUpdate,
    OpponentHandleStatusIconUpdate,
    OpponentHandleStatusAnimation,
    OpponentHandleStatusXor,
    OpponentHandlecmd29,
    OpponentHandleDMATransfer,
    OpponentHandlecmd31,
    OpponentHandlecmd32,
    OpponentHandlecmd33,
    OpponentHandlecmd34,
    OpponentHandlecmd35,
    OpponentHandlecmd36,
    OpponentHandlecmd37,
    OpponentHandlecmd38,
    OpponentHandlecmd39,
    OpponentHandlecmd40,
    OpponentHandleHitAnimation,
    OpponentHandlecmd42,
    OpponentHandleEffectivenessSound,
    OpponentHandlecmd44,
    OpponentHandleFaintingCry,
    OpponentHandleIntroSlide,
    OpponentHandleTrainerBallThrow,
    OpponentHandlecmd48,
    OpponentHandlecmd49,
    OpponentHandlecmd50,
    OpponentHandleSpriteInvisibility,
    OpponentHandleBattleAnimation,
    OpponentHandleLinkStandbyMsg,
    OpponentHandleResetActionMoveSelection,
    OpponentHandlecmd55,
    OpponentHandlecmd56,
};

static const u8 sUnknownBytes[] = {0xB0, 0xB0, 0xC8, 0x98, 0x28, 0x28, 0x28, 0x20};

// code

void nullsub_45(void)
{
}

void SetBankFuncToOpponentBufferRunCommand(void)
{
    gBattleBankFunc[gActiveBank] = OpponentBufferRunCommand;
}

void OpponentBufferRunCommand(void)
{
    if (gBattleExecBuffer & gBitTable[gActiveBank])
    {
        if (gBattleBufferA[gActiveBank][0] <= 0x38)
            gOpponentBufferCommands[gBattleBufferA[gActiveBank][0]]();
        else
            OpponentBufferExecCompleted();
    }
}

void sub_8032B4C(void)
{
    if (gSprites[gBankSpriteIds[gActiveBank]].callback == SpriteCallbackDummy)
        OpponentBufferExecCompleted();
}

// Duplicate of sub_8032B4C
void sub_8032B84(void)
{
    if (gSprites[gBankSpriteIds[gActiveBank]].callback == SpriteCallbackDummy)
        OpponentBufferExecCompleted();
}

void sub_8032BBC(void)
{
    if (gSprites[gBankSpriteIds[gActiveBank]].callback == SpriteCallbackDummy)
    {
        sub_8031B74(gSprites[gBankSpriteIds[gActiveBank]].oam.affineParam);
        gSprites[gBankSpriteIds[gActiveBank]].oam.tileNum = gSprites[gBankSpriteIds[gActiveBank]].data[5];
        FreeSpriteOamMatrix(&gSprites[gBankSpriteIds[gActiveBank]]);
        DestroySprite(&gSprites[gBankSpriteIds[gActiveBank]]);
        OpponentBufferExecCompleted();
    }
}

void sub_8032C4C(void)
{
    if ((--ewram17810[gActiveBank].unk9) == 0xFF)
    {
        ewram17810[gActiveBank].unk9 = 0;
        OpponentBufferExecCompleted();
    }
}

void sub_8032C88(void)
{
    bool8 r6 = FALSE;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & BATTLE_TYPE_MULTI)))
    {
        if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    else
    {
        if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxIDs[gActiveBank ^ 2]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    if (IsCryPlayingOrClearCrySongs())
        r6 = FALSE;

    if (r6 && ewram17810[gActiveBank].unk1_0 && ewram17810[gActiveBank ^ 2].unk1_0)
    {
        ewram17810[gActiveBank].unk0_7 = 0;
        ewram17810[gActiveBank].unk1_0 = 0;
        ewram17810[gActiveBank ^ 2].unk0_7 = 0;
        ewram17810[gActiveBank ^ 2].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            m4aMPlayContinue(&gMPlay_BGM);
        else
            m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 256);
        ewram17810[gActiveBank].unk9 = 3;
        gBattleBankFunc[gActiveBank] = sub_8032C4C;
    }
}

void sub_8032E2C(void)
{
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
    if (!ewram17810[gActiveBank ^ 2].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_7)
        sub_8141828(gActiveBank ^ 2, &gEnemyParty[gBattlePartyID[gActiveBank ^ 2]]);
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_3)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank ^ 2]]);
            sub_8045A5C(
              gHealthboxIDs[gActiveBank ^ 2],
              &gEnemyParty[gBattlePartyID[gActiveBank ^ 2]],
              0);
            sub_804777C(gActiveBank ^ 2);
            sub_8043DFC(gHealthboxIDs[gActiveBank ^ 2]);
            sub_8032984(
              gActiveBank ^ 2,
              GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank ^ 2]], MON_DATA_SPECIES));
        }
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8045A5C(
          gHealthboxIDs[gActiveBank],
          &gEnemyParty[gBattlePartyID[gActiveBank]],
          0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        sub_8032984(
          gActiveBank,
          GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES));

        ewram17840.unk9_0 = 0;
        gBattleBankFunc[gActiveBank] = sub_8032C88;
    }
}

void sub_8033018(void)
{
    if (gSprites[gBankSpriteIds[gActiveBank]].animEnded == TRUE
     && gSprites[gBankSpriteIds[gActiveBank]].pos2.x == 0)
    {
        if (!ewram17810[gActiveBank].unk0_7)
        {
            sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
            return;
        }
        if (ewram17810[gActiveBank].unk1_0)
        {
            ewram17810[gActiveBank].unk0_7 = 0;
            ewram17810[gActiveBank].unk1_0 = 0;
            FreeSpriteTilesByTag(0x27F9);
            FreeSpritePaletteByTag(0x27F9);
            OpponentBufferExecCompleted();
            return;
        }
    }
}

void sub_80330C8(void)
{
    s16 r4 = sub_8045C78(gActiveBank, gHealthboxIDs[gActiveBank], 0, 0);

    sub_8043DFC(gHealthboxIDs[gActiveBank]);
    if (r4 != -1)
        sub_80440EC(gHealthboxIDs[gActiveBank], r4, 0);
    else
        OpponentBufferExecCompleted();
}

void sub_803311C(void)
{
    if (!gSprites[gBankSpriteIds[gActiveBank]].inUse)
    {
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        OpponentBufferExecCompleted();
    }
}

void sub_8033160(void)
{
    if (!ewram17810[gActiveBank].unk0_6)
    {
        FreeSpriteOamMatrix(&gSprites[gBankSpriteIds[gActiveBank]]);
        DestroySprite(&gSprites[gBankSpriteIds[gActiveBank]]);
        sub_8032A08(gActiveBank);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        OpponentBufferExecCompleted();
    }
}

void sub_80331D0(void)
{
    if (gUnknown_03004210.state == 0)
        OpponentBufferExecCompleted();
}

void bx_blink_t7(void)
{
    u8 spriteId = gBankSpriteIds[gActiveBank];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = 0;
        OpponentBufferExecCompleted();
    }
    else
    {
        if (((u16)gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        gSprites[spriteId].data[1]++;
    }
}

void sub_8033264(void)
{
    if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy)
    {
        if (ewram17800[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
        gBattleBankFunc[gActiveBank] = sub_80332D0;
    }
}

void sub_80332D0(void)
{
    if (!ewram17810[gActiveBank].unk0_6)
    {
        CreateTask(c3_0802FDF4, 10);
        OpponentBufferExecCompleted();
    }
}

void sub_8033308(void)
{
    if (ewram17810[gActiveBank].unk1_0)
    {
        ewram17810[gActiveBank].unk0_7 = 0;
        ewram17810[gActiveBank].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        StartSpriteAnim(&gSprites[gBankSpriteIds[gActiveBank]], 0);
        sub_8045A5C(
          gHealthboxIDs[gActiveBank],
          &gEnemyParty[gBattlePartyID[gActiveBank]],
          0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        sub_8031F88(gActiveBank);
        gBattleBankFunc[gActiveBank] = sub_8033264;
    }
}

void sub_80333D4(void)
{
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
    if (gSprites[gUnknown_0300434C[gActiveBank]].callback == SpriteCallbackDummy
     && !ewram17810[gActiveBank].unk0_3)
    {
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8032984(gActiveBank, GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES));
        gBattleBankFunc[gActiveBank] = sub_8033308;
    }
}

void sub_8033494(void)
{
    if (!ewram17810[gActiveBank].unk0_4)
        OpponentBufferExecCompleted();
}

void sub_80334C0(void)
{
    if (!ewram17810[gActiveBank].unk0_5)
        OpponentBufferExecCompleted();
}

void OpponentBufferExecCompleted(void)
{
    gBattleBankFunc[gActiveBank] = OpponentBufferRunCommand;
    gBattleExecBuffer &= ~gBitTable[gActiveBank];
}

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
    Emitcmd29(1, r6, buffer);
    OpponentBufferExecCompleted();
}

u32 sub_8033598(u8 a, u8 *buffer)
{
    struct BattlePokemon battlePokemon;
    struct MovePpInfo moveData;
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
        battlePokemon.speedIV = GetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV);
        battlePokemon.spAttackIV = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV);
        battlePokemon.spDefenseIV = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV);
        battlePokemon.personality = GetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY);
        battlePokemon.status1 = GetMonData(&gEnemyParty[a], MON_DATA_STATUS);
        battlePokemon.level = GetMonData(&gEnemyParty[a], MON_DATA_LEVEL);
        battlePokemon.hp = GetMonData(&gEnemyParty[a], MON_DATA_HP);
        battlePokemon.maxHP = GetMonData(&gEnemyParty[a], MON_DATA_MAX_HP);
        battlePokemon.attack = GetMonData(&gEnemyParty[a], MON_DATA_ATK);
        battlePokemon.defense = GetMonData(&gEnemyParty[a], MON_DATA_DEF);
        battlePokemon.speed = GetMonData(&gEnemyParty[a], MON_DATA_SPEED);
        battlePokemon.spAttack = GetMonData(&gEnemyParty[a], MON_DATA_SPATK);
        battlePokemon.spDefense = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF);
        battlePokemon.isEgg = GetMonData(&gEnemyParty[a], MON_DATA_IS_EGG);
        battlePokemon.altAbility = GetMonData(&gEnemyParty[a], MON_DATA_ALT_ABILITY);
        battlePokemon.otId = GetMonData(&gEnemyParty[a], MON_DATA_OT_ID);
        GetMonData(&gEnemyParty[a], MON_DATA_NICKNAME, nickname);
        StringCopy10(battlePokemon.nickname, nickname);
        GetMonData(&gEnemyParty[a], MON_DATA_OT_NAME, battlePokemon.otName);
        MEMCPY_ALT(&battlePokemon, buffer, sizeof(battlePokemon), size, src);
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
        MEMCPY_ALT(&moveData, buffer, sizeof(moveData), size, src);
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
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPEED_EV);
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
        buffer[3] = GetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV);
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
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV);
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
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPEED);
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

void OpponentHandlecmd1(void)
{
    struct BattlePokemon buffer;
    u8 i;
    // TODO: Maybe fix this. Integrating this into MEMSET_ALT is too hard.
    u8 *src = (u8 *)&gEnemyParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1];
    u8 *dst;

    MEMSET_ALT(&buffer + gBattleBufferA[gActiveBank][1], src[i], gBattleBufferA[gActiveBank][2], i, dst);
    Emitcmd29(1, gBattleBufferA[gActiveBank][2], dst);
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
    struct MovePpInfo *moveData = (struct MovePpInfo *)&gBattleBufferA[gActiveBank][3];
    s32 i;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        {
            u8 iv;

            SetMonData(&gEnemyParty[a], MON_DATA_SPECIES, &battlePokemon->species);
            SetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM, &battlePokemon->item);
            for (i = 0; i < 4; i++)
            {
                SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + i, &battlePokemon->moves[i]);
                SetMonData(&gEnemyParty[a], MON_DATA_PP1 + i, &battlePokemon->pp[i]);
            }
            SetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES, &battlePokemon->ppBonuses);
            SetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP, &battlePokemon->friendship);
            SetMonData(&gEnemyParty[a], MON_DATA_EXP, &battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, &iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, &iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, &iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV, &iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, &iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, &iv);
            SetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY, &battlePokemon->personality);
            SetMonData(&gEnemyParty[a], MON_DATA_STATUS, &battlePokemon->status1);
            SetMonData(&gEnemyParty[a], MON_DATA_LEVEL, &battlePokemon->level);
            SetMonData(&gEnemyParty[a], MON_DATA_HP, &battlePokemon->hp);
            SetMonData(&gEnemyParty[a], MON_DATA_MAX_HP, &battlePokemon->maxHP);
            SetMonData(&gEnemyParty[a], MON_DATA_ATK, &battlePokemon->attack);
            SetMonData(&gEnemyParty[a], MON_DATA_DEF, &battlePokemon->defense);
            SetMonData(&gEnemyParty[a], MON_DATA_SPEED, &battlePokemon->speed);
            SetMonData(&gEnemyParty[a], MON_DATA_SPATK, &battlePokemon->spAttack);
            SetMonData(&gEnemyParty[a], MON_DATA_SPDEF, &battlePokemon->spDefense);
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
            SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + i, &moveData->moves[i]);
            SetMonData(&gEnemyParty[a], MON_DATA_PP1 + i, &moveData->pp[i]);
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
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBank][3]);
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
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBank][6]);
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
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBank][3]);
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
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED, &gBattleBufferA[gActiveBank][3]);
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

void OpponentHandlecmd3(void)
{
    u8 *dst;
    u8 i;

    MEMSET_ALT(&gEnemyParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1], gBattleBufferA[gActiveBank][3 + i],
        gBattleBufferA[gActiveBank][2], i, dst);
    OpponentBufferExecCompleted();
}

void OpponentHandleLoadPokeSprite(void)
{
    u16 species = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES);

    BattleLoadOpponentMonSprite(&gEnemyParty[gBattlePartyID[gActiveBank]], gActiveBank);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(gActiveBank));
    gBankSpriteIds[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      GetBankPosition(gActiveBank, 2),
      sub_8077F68(gActiveBank),
      sub_8079E90(gActiveBank));
    gSprites[gBankSpriteIds[gActiveBank]].pos2.x = -240;
    gSprites[gBankSpriteIds[gActiveBank]].data[0] = gActiveBank;
    gSprites[gBankSpriteIds[gActiveBank]].data[2] = species;
    gSprites[gBankSpriteIds[gActiveBank]].oam.paletteNum = gActiveBank;
    StartSpriteAnim(&gSprites[gBankSpriteIds[gActiveBank]], gBattleMonForms[gActiveBank]);
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
    BattleLoadOpponentMonSprite(&gEnemyParty[gBattlePartyID[a]], a);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(a));
    gBankSpriteIds[a] = CreateSprite(
      &gUnknown_02024E8C,
      GetBankPosition(a, 2),
      sub_8077F68(a),
      sub_8079E90(a));
    gSprites[gBankSpriteIds[a]].data[0] = a;
    gSprites[gBankSpriteIds[a]].data[2] = species;
    gSprites[gUnknown_0300434C[a]].data[1] = gBankSpriteIds[a];
    gSprites[gBankSpriteIds[a]].oam.paletteNum = a;
    StartSpriteAnim(&gSprites[gBankSpriteIds[a]], gBattleMonForms[a]);
    gSprites[gBankSpriteIds[a]].invisible = TRUE;
    gSprites[gBankSpriteIds[a]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[a]].data[0] = sub_8046400(0, 0xFE);
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
        FreeSpriteOamMatrix(&gSprites[gBankSpriteIds[gActiveBank]]);
        DestroySprite(&gSprites[gBankSpriteIds[gActiveBank]]);
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
        if (ewram17800[gActiveBank].substituteSprite)
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

#if DEBUG
    if (gUnknown_02023A14_50 & 0x10)
    {
        trainerPicIndex = gSharedMem[0x160A3];
    }
    else
#endif
    {
        if (gTrainerBattleOpponent == 0x400)
            trainerPicIndex = GetSecretBaseTrainerPicIndex();
        else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
            trainerPicIndex = get_trainer_class_pic_index();
        else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
            trainerPicIndex = GetEReaderTrainerPicIndex();
        else
            trainerPicIndex = gTrainers[gTrainerBattleOpponent].trainerPic;
    }

    sub_8031A6C(trainerPicIndex, gActiveBank);
    GetMonSpriteTemplate_803C5A0(trainerPicIndex, GetBankIdentity(gActiveBank));
    gBankSpriteIds[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      0xB0,
      40 + 4 * (8 - gTrainerFrontPicCoords[trainerPicIndex].coords),
      sub_8079E90(gActiveBank));
    gSprites[gBankSpriteIds[gActiveBank]].pos2.x = -240;
    gSprites[gBankSpriteIds[gActiveBank]].data[0] = 2;
    gSprites[gBankSpriteIds[gActiveBank]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[trainerPicIndex].tag);
    gSprites[gBankSpriteIds[gActiveBank]].data[5] = gSprites[gBankSpriteIds[gActiveBank]].oam.tileNum;
    gSprites[gBankSpriteIds[gActiveBank]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[trainerPicIndex].tag);
    gSprites[gBankSpriteIds[gActiveBank]].oam.affineParam = trainerPicIndex;
    gSprites[gBankSpriteIds[gActiveBank]].callback = sub_80313A0;
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
        trainerPicIndex = GetEReaderTrainerPicIndex();
    else
        trainerPicIndex = gTrainers[gTrainerBattleOpponent].trainerPic;

    sub_8031A6C(trainerPicIndex, gActiveBank);
    GetMonSpriteTemplate_803C5A0(trainerPicIndex, GetBankIdentity(gActiveBank));
    gBankSpriteIds[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      0xB0,
      40 + 4 * (8 - gTrainerFrontPicCoords[trainerPicIndex].coords),
      0x1E);
    gSprites[gBankSpriteIds[gActiveBank]].pos2.x = 96;
    gSprites[gBankSpriteIds[gActiveBank]].pos1.x += 32;
    gSprites[gBankSpriteIds[gActiveBank]].data[0] = -2;
    gSprites[gBankSpriteIds[gActiveBank]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[trainerPicIndex].tag);
    gSprites[gBankSpriteIds[gActiveBank]].data[5] = gSprites[gBankSpriteIds[gActiveBank]].oam.tileNum;
    gSprites[gBankSpriteIds[gActiveBank]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[trainerPicIndex].tag);
    gSprites[gBankSpriteIds[gActiveBank]].oam.affineParam = trainerPicIndex;
    gSprites[gBankSpriteIds[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_8032B84;
}

void OpponentHandleTrainerSlideBack(void)
{
    oamt_add_pos2_onto_pos1(&gSprites[gBankSpriteIds[gActiveBank]]);
    gSprites[gBankSpriteIds[gActiveBank]].data[0] = 35;
    gSprites[gBankSpriteIds[gActiveBank]].data[2] = 280;
    gSprites[gBankSpriteIds[gActiveBank]].data[4] = gSprites[gBankSpriteIds[gActiveBank]].pos1.y;
    gSprites[gBankSpriteIds[gActiveBank]].callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(&gSprites[gBankSpriteIds[gActiveBank]], SpriteCallbackDummy);
    gBattleBankFunc[gActiveBank] = sub_8032BBC;
}

void OpponentHandlecmd10(void)
{
    if (ewram17810[gActiveBank].unk4 == 0)
    {
        if (ewram17800[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ewram17810[gActiveBank].unk4++;
    }
    else if (!ewram17810[gActiveBank].unk0_6)
    {
        ewram17810[gActiveBank].unk4 = 0;
        PlaySE12WithPanning(SE_POKE_DEAD, 63);
        gSprites[gBankSpriteIds[gActiveBank]].callback = sub_8010384;
        gBattleBankFunc[gActiveBank] = sub_803311C;
    }
}

void OpponentHandlecmd11(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd12(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleBallThrow(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlePuase(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleMoveAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        u32 r0 = gBattleBufferA[gActiveBank][1]
               | (gBattleBufferA[gActiveBank][2] << 8);

        gAnimMoveTurn = gBattleBufferA[gActiveBank][3];
        gAnimMovePower = gBattleBufferA[gActiveBank][4]
                          | (gBattleBufferA[gActiveBank][5] << 8);
        gAnimMoveDmg = gBattleBufferA[gActiveBank][6]
                          | (gBattleBufferA[gActiveBank][7] << 8)
                          | (gBattleBufferA[gActiveBank][8] << 16)
                          | (gBattleBufferA[gActiveBank][9] << 24);
        gAnimFriendship = gBattleBufferA[gActiveBank][10];
        gWeatherMoveAnim = gBattleBufferA[gActiveBank][12]
                          | (gBattleBufferA[gActiveBank][13] << 8);
        gAnimDisableStructPtr = (struct DisableStruct *)&gBattleBufferA[gActiveBank][16];
        gTransformedPersonalities[gActiveBank] = gAnimDisableStructPtr->transformedMonPersonality;

        // Dead code. sub_8031720 always returns 0.
        if (sub_8031720(r0, gAnimMoveTurn) != 0)
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
        if (ewram17800[gActiveBank].substituteSprite && !ewram17800[gActiveBank].unk0_3)
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
            DoMoveAnim(r4);
            ewram17810[gActiveBank].unk4 = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_80326EC(1);
            if ((ewram17800[gActiveBank].substituteSprite) && r7 <= 1)
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
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    BufferStringBattle(*(u16 *)&gBattleBufferA[gActiveBank][2]);
    Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
    gBattleBankFunc[gActiveBank] = sub_80331D0;
}

void OpponentHandlePrintStringPlayerOnly(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd18(void)
{
    sub_8036B0C();
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd19(void)
{
    OpponentBufferExecCompleted();
}

#if DEBUG
__attribute__((naked))
void OpponentHandlecmd20(void)
{
    asm("\
    push    {r4, r5, r6, r7, lr}\n\
    mov r7, sl\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push    {r5, r6, r7}\n\
    ldr r6, ._549       @ gActiveBank\n\
    ldrb    r0, [r6]\n\
    lsl r0, r0, #0x9\n\
    ldr r1, ._549 + 4   @ gBattleBufferA\n\
    add r5, r0, r1\n\
    ldr r2, ._549 + 8   @ gUnknown_02023A14_50\n\
    ldrb    r1, [r2]\n\
    mov r0, #0x4\n\
    and r0, r0, r1\n\
    mov sl, r6\n\
    cmp r0, #0\n\
    beq ._546   @cond_branch\n\
    ldr r0, ._549 + 12  @ gBattleMoves\n\
    mov r9, r0\n\
    ldr r1, ._549 + 16  @ \n\
    mov ip, r1\n\
    add r7, r6, #0\n\
    mov r0, #0x2\n\
    mov r8, r0\n\
    ldr r6, ._549 + 20  @ \n\
._552:\n\
    ldrb    r1, [r7]\n\
    mov r0, r8\n\
    and r0, r0, r1\n\
    lsl r0, r0, #0x18\n\
    lsr r0, r0, #0x19\n\
    add r0, r0, r6\n\
    mov r1, ip\n\
    add r3, r0, r1\n\
    ldrb    r1, [r3]\n\
    lsl r0, r1, #0x1\n\
    add r0, r5, r0\n\
    ldrh    r2, [r0]\n\
    add r4, r1, #0\n\
    cmp r2, #0\n\
    beq ._547   @cond_branch\n\
    add r0, r4, #1\n\
    strb    r0, [r3]\n\
    b   ._548\n\
._550:\n\
    .align  2, 0\n\
._549:\n\
    .word   gActiveBank\n\
    .word   gBattleBufferA+4\n\
    .word   gUnknown_02023A14_50\n\
    .word   gBattleMoves\n\
    .word   +0x2000000\n\
    .word   0x1609e\n\
._547:\n\
    strb    r2, [r3]\n\
._548:\n\
    ldrb    r0, [r7]\n\
    mov r1, r8\n\
    and r1, r1, r0\n\
    lsl r1, r1, #0x18\n\
    lsr r1, r1, #0x19\n\
    add r1, r1, r6\n\
    add r1, r1, ip\n\
    ldrb    r0, [r1]\n\
    cmp r0, #0x3\n\
    bls ._551   @cond_branch\n\
    mov r0, #0x0\n\
    strb    r0, [r1]\n\
._551:\n\
    cmp r2, #0\n\
    beq ._552   @cond_branch\n\
    lsl r0, r2, #0x1\n\
    add r0, r0, r2\n\
    lsl r0, r0, #0x2\n\
    add r0, r0, r9\n\
    ldrb    r3, [r0, #0x6]\n\
    mov r0, #0x12\n\
    and r0, r0, r3\n\
    cmp r0, #0\n\
    beq ._553   @cond_branch\n\
    mov r1, sl\n\
    ldrb    r0, [r1]\n\
    b   ._561\n\
._553:\n\
    ldr r0, ._559       @ gBattleTypeFlags\n\
    ldrh    r1, [r0]\n\
    mov r0, #0x1\n\
    and r0, r0, r1\n\
    cmp r0, #0\n\
    beq ._557   @cond_branch\n\
    ldr r0, ._559 + 4   @ gUnknown_02023A14_50\n\
    ldrb    r1, [r0]\n\
    mov r5, #0x2\n\
    add r0, r5, #0\n\
    and r0, r0, r1\n\
    cmp r0, #0\n\
    beq ._556   @cond_branch\n\
    cmp r3, #0\n\
    bne ._557   @cond_branch\n\
    mov r1, sl\n\
    ldrb    r0, [r1]\n\
    bl  GetBankIdentity\n\
    mov r1, #0x2\n\
    eor r0, r0, r1\n\
    lsl r0, r0, #0x18\n\
    lsr r0, r0, #0x18\n\
    b   ._558\n\
._560:\n\
    .align  2, 0\n\
._559:\n\
    .word   gBattleTypeFlags\n\
    .word   gUnknown_02023A14_50\n\
._556:\n\
    bl  Random\n\
    add r1, r5, #0\n\
    and r1, r1, r0\n\
    lsl r1, r1, #0x10\n\
    lsr r0, r1, #0x10\n\
    b   ._561\n\
._557:\n\
    mov r0, #0x0\n\
._558:\n\
    bl  GetBankByIdentity\n\
    lsl r0, r0, #0x18\n\
    lsr r0, r0, #0x18\n\
._561:\n\
    lsl r2, r0, #0x8\n\
    orr r2, r2, r4\n\
    mov r0, #0x1\n\
    mov r1, #0xa\n\
._569:\n\
    bl  Emitcmd33\n\
._573:\n\
    bl  OpponentBufferExecCompleted\n\
    b   ._562\n\
._546:\n\
    ldr r0, ._567       @ gBattleTypeFlags\n\
    ldrh    r1, [r0]\n\
    mov r0, #0x93\n\
    lsl r0, r0, #0x3\n\
    and r0, r0, r1\n\
    cmp r0, #0\n\
    beq ._563   @cond_branch\n\
    bl  BattleAI_SetupAIData\n\
    bl  BattleAI_GetAIActionToUse\n\
    lsl r0, r0, #0x18\n\
    lsr r4, r0, #0x18\n\
    cmp r4, #0x4\n\
    beq ._564   @cond_branch\n\
    cmp r4, #0x5\n\
    bne ._565   @cond_branch\n\
    mov r0, #0x1\n\
    mov r1, #0x4\n\
    b   ._566\n\
._568:\n\
    .align  2, 0\n\
._567:\n\
    .word   gBattleTypeFlags\n\
._564:\n\
    mov r0, #0x1\n\
    mov r1, #0x3\n\
._566:\n\
    mov r2, #0x0\n\
    b   ._569\n\
._565:\n\
    ldr r3, ._574       @ gBattleMoves\n\
    lsl r0, r4, #0x1\n\
    add r2, r5, r0\n\
    ldrh    r1, [r2]\n\
    lsl r0, r1, #0x1\n\
    add r0, r0, r1\n\
    lsl r0, r0, #0x2\n\
    add r0, r0, r3\n\
    ldrb    r1, [r0, #0x6]\n\
    mov r0, #0x12\n\
    and r0, r0, r1\n\
    cmp r0, #0\n\
    beq ._570   @cond_branch\n\
    ldr r1, ._574 + 4   @ gBankTarget\n\
    ldrb    r0, [r6]\n\
    strb    r0, [r1]\n\
._570:\n\
    ldrh    r1, [r2]\n\
    lsl r0, r1, #0x1\n\
    add r0, r0, r1\n\
    lsl r0, r0, #0x2\n\
    add r0, r0, r3\n\
    ldrb    r1, [r0, #0x6]\n\
    mov r0, #0x8\n\
    and r0, r0, r1\n\
    cmp r0, #0\n\
    beq ._572   @cond_branch\n\
    mov r0, #0x0\n\
    bl  GetBankByIdentity\n\
    ldr r5, ._574 + 4   @ gBankTarget\n\
    strb    r0, [r5]\n\
    ldr r0, ._574 + 8   @ gAbsentBankFlags\n\
    ldrb    r1, [r0]\n\
    ldr r2, ._574 + 12  @ gBitTable\n\
    ldrb    r0, [r5]\n\
    lsl r0, r0, #0x2\n\
    add r0, r0, r2\n\
    ldr r0, [r0]\n\
    and r1, r1, r0\n\
    cmp r1, #0\n\
    beq ._572   @cond_branch\n\
    mov r0, #0x2\n\
    bl  GetBankByIdentity\n\
    strb    r0, [r5]\n\
._572:\n\
    ldr r0, ._574 + 4   @ gBankTarget\n\
    ldrb    r2, [r0]\n\
    lsl r2, r2, #0x8\n\
    orr r2, r2, r4\n\
    mov r0, #0x1\n\
    mov r1, #0xa\n\
    bl  Emitcmd33\n\
    b   ._573\n\
._575:\n\
    .align  2, 0\n\
._574:\n\
    .word   gBattleMoves\n\
    .word   gBankTarget\n\
    .word   gAbsentBankFlags\n\
    .word   gBitTable\n\
._563:\n\
    mov r6, #0x3\n\
._576:\n\
    bl  Random\n\
    add r4, r0, #0\n\
    and r4, r4, r6\n\
    lsl r0, r4, #0x1\n\
    add r0, r5, r0\n\
    ldrh    r2, [r0]\n\
    cmp r2, #0\n\
    beq ._576   @cond_branch\n\
    ldr r1, ._579       @ gBattleMoves\n\
    lsl r0, r2, #0x1\n\
    add r0, r0, r2\n\
    lsl r0, r0, #0x2\n\
    add r0, r0, r1\n\
    ldrb    r1, [r0, #0x6]\n\
    mov r0, #0x12\n\
    and r0, r0, r1\n\
    cmp r0, #0\n\
    beq ._577   @cond_branch\n\
    ldr r0, ._579 + 4   @ gActiveBank\n\
    ldrb    r2, [r0]\n\
    lsl r2, r2, #0x8\n\
    b   ._578\n\
._580:\n\
    .align  2, 0\n\
._579:\n\
    .word   gBattleMoves\n\
    .word   gActiveBank\n\
._577:\n\
    ldr r0, ._583       @ gBattleTypeFlags\n\
    ldrh    r1, [r0]\n\
    mov r0, #0x1\n\
    and r0, r0, r1\n\
    cmp r0, #0\n\
    beq ._581   @cond_branch\n\
    bl  Random\n\
    mov r1, #0x2\n\
    and r1, r1, r0\n\
    lsl r1, r1, #0x18\n\
    lsr r1, r1, #0x18\n\
    add r0, r1, #0\n\
    bl  GetBankByIdentity\n\
    add r2, r0, #0\n\
    lsl r2, r2, #0x18\n\
    lsr r2, r2, #0x10\n\
._578:\n\
    orr r2, r2, r4\n\
    mov r0, #0x1\n\
    mov r1, #0xa\n\
    bl  Emitcmd33\n\
    b   ._582\n\
._584:\n\
    .align  2, 0\n\
._583:\n\
    .word   gBattleTypeFlags\n\
._581:\n\
    mov r0, #0x0\n\
    bl  GetBankByIdentity\n\
    add r2, r0, #0\n\
    lsl r2, r2, #0x18\n\
    lsr r2, r2, #0x10\n\
    orr r2, r2, r4\n\
    mov r0, #0x1\n\
    mov r1, #0xa\n\
    bl  Emitcmd33\n\
._582:\n\
    bl  OpponentBufferExecCompleted\n\
._562:\n\
    pop {r3, r4, r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov sl, r5\n\
    pop {r4, r5, r6, r7}\n\
    pop {r0}\n\
    bx  r0");
}
#else
#ifdef NONMATCHING
void OpponentHandlecmd20(void)
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
            Emitcmd33(1, 4, 0);
            break;
        case 4:
            Emitcmd33(1, 3, 0);
            break;
        default:
            if (gBattleMoves[r5->moves[r4]].target & 0x12)
                gBankTarget = gActiveBank;
            if (gBattleMoves[r5->moves[r4]].target & 8)
            {
                gBankTarget = GetBankByIdentity(0);
                if (gAbsentBankFlags & gBitTable[gBankTarget])
                    gBankTarget = GetBankByIdentity(2);
            }
            r4 |= gBankTarget << 8;
            Emitcmd33(1, 10, r4);
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
            Emitcmd33(1, 10, r4);
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            u16 r2 = GetBankByIdentity(Random() & 2) << 8;

            Emitcmd33(1, 10, r4 | r2);
        }
        else
        {
            u16 r2 = GetBankByIdentity(0) << 8;

            Emitcmd33(1, 10, r4 | r2);
        }
        OpponentBufferExecCompleted();
    }
}
#else
__attribute__((naked))
void OpponentHandlecmd20(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    ldr r6, _0803545C @ =gActiveBank\n\
    ldrb r0, [r6]\n\
    lsls r0, 9\n\
    ldr r1, _08035460 @ =gBattleBufferA+4\n\
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
_08035460: .4byte gBattleBufferA+4\n\
_08035464: .4byte gBattleTypeFlags\n\
_08035468:\n\
    movs r0, 0x1\n\
    movs r1, 0x3\n\
_0803546C:\n\
    movs r2, 0\n\
    bl Emitcmd33\n\
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
    bl GetBankByIdentity\n\
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
    bl GetBankByIdentity\n\
    strb r0, [r5]\n\
_080354CE:\n\
    ldr r0, _080354EC @ =gBankTarget\n\
    ldrb r0, [r0]\n\
    lsls r0, 8\n\
    orrs r4, r0\n\
    movs r0, 0x1\n\
    movs r1, 0xA\n\
    adds r2, r4, 0\n\
    bl Emitcmd33\n\
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
    bl Emitcmd33\n\
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
    bl GetBankByIdentity\n\
    adds r2, r0, 0\n\
    lsls r2, 24\n\
    lsrs r2, 16\n\
    orrs r2, r4\n\
    movs r0, 0x1\n\
    movs r1, 0xA\n\
    bl Emitcmd33\n\
    b _08035586\n\
    .align 2, 0\n\
_0803556C: .4byte gBattleTypeFlags\n\
_08035570:\n\
    movs r0, 0\n\
    bl GetBankByIdentity\n\
    adds r2, r0, 0\n\
    lsls r2, 24\n\
    lsrs r2, 16\n\
    orrs r2, r4\n\
    movs r0, 0x1\n\
    movs r1, 0xA\n\
    bl Emitcmd33\n\
_08035586:\n\
    bl OpponentBufferExecCompleted\n\
_0803558A:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif
#endif

void OpponentHandleOpenBag(void)
{
    // What is this?
    Emitcmd35(1, ewram160D4(gActiveBank));
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd22(void)
{
    s32 r4;

    if (ewram160C8arr(GetBankIdentity(gActiveBank)) == 6)
    {
        u8 r6;
        u8 r5;

        r4 = sub_8036CD4();
        if (r4 == 6)
        {
            if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
            {
                r5 = GetBankByIdentity(1);
                r6 = r5;
            }
            else
            {
                r6 = GetBankByIdentity(1);
                r5 = GetBankByIdentity(3);
            }
            for (r4 = 0; r4 < 6; r4++)
            {
                if (GetMonData(&gEnemyParty[r4], MON_DATA_HP) != 0
                 && r4 != gBattlePartyID[r6]
                 && r4 != gBattlePartyID[r5])
                    break;
            }
        }
    }
    else
    {
        r4 = ewram160C8arr(GetBankIdentity(gActiveBank));
        ewram160C8arr(GetBankIdentity(gActiveBank)) = 6;
    }
    ewram16068arr(gActiveBank) = r4;
    Emitcmd34(1, r4, 0);
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd23(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleHealthBarUpdate(void)
{
    s16 r7;

    load_gfxc_health_bar(0);
    r7 = (gBattleBufferA[gActiveBank][3] << 8) | gBattleBufferA[gActiveBank][2];
    if (r7 != 0x7FFF)
    {
        u32 maxHP = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);
        u32 hp = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, hp, r7);
    }
    else
    {
        u32 maxHP = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, 0, r7);
    }
    gBattleBankFunc[gActiveBank] = sub_80330C8;
}

void OpponentHandleExpBarUpdate(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleStatusIconUpdate(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        sub_8045A5C(gHealthboxIDs[gActiveBank], &gEnemyParty[gBattlePartyID[gActiveBank]], 9);
        ewram17810[gActiveBank].unk0_4 = 0;
        gBattleBankFunc[gActiveBank] = sub_8033494;
    }
}

void OpponentHandleStatusAnimation(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        move_anim_start_t2_for_situation(
          gBattleBufferA[gActiveBank][1],
          gBattleBufferA[gActiveBank][2]
          | (gBattleBufferA[gActiveBank][3] << 8)
          | (gBattleBufferA[gActiveBank][4] << 16)
          | (gBattleBufferA[gActiveBank][5] << 24));
        gBattleBankFunc[gActiveBank] = sub_8033494;
    }
}

void OpponentHandleStatusXor(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd29(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleDMATransfer(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd31(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd32(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd33(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd34(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd35(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd36(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd37(void)
{
    gUnknown_020238C8.unk0_0 = 0;
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd38(void)
{
    gUnknown_020238C8.unk0_0 = gBattleBufferA[gActiveBank][1];
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd39(void)
{
    gUnknown_020238C8.unk0_7 = 0;
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd40(void)
{
    gUnknown_020238C8.unk0_7 ^= 1;
    OpponentBufferExecCompleted();
}

void OpponentHandleHitAnimation(void)
{
    if (gSprites[gBankSpriteIds[gActiveBank]].invisible == TRUE)
    {
        OpponentBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBankSpriteIds[gActiveBank]].data[1] = 0;
        sub_8047858(gActiveBank);
        gBattleBankFunc[gActiveBank] = bx_blink_t7;
    }
}

void OpponentHandlecmd42(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleEffectivenessSound(void)
{
    s8 pan;

    if (GetBankSide(gActiveBank) == 0)
        pan = -64;
    else
        pan = 63;
    PlaySE12WithPanning(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8), pan);
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd44(void)
{
    PlayFanfare(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    OpponentBufferExecCompleted();
}

void OpponentHandleFaintingCry(void)
{
    PlayCry3(
      GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES),
      25, 5);
    OpponentBufferExecCompleted();
}

void OpponentHandleIntroSlide(void)
{
    StartBattleIntroAnim(gBattleBufferA[gActiveBank][1]);
    gUnknown_02024DE8 |= 1;
    OpponentBufferExecCompleted();
}

void OpponentHandleTrainerBallThrow(void)
{
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gBankSpriteIds[gActiveBank]]);
    gSprites[gBankSpriteIds[gActiveBank]].data[0] = 35;
    gSprites[gBankSpriteIds[gActiveBank]].data[2] = 280;
    gSprites[gBankSpriteIds[gActiveBank]].data[4] = gSprites[gBankSpriteIds[gActiveBank]].pos1.y;
    gSprites[gBankSpriteIds[gActiveBank]].callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(&gSprites[gBankSpriteIds[gActiveBank]], sub_8035C10);
    taskId = CreateTask(sub_8035C44, 5);
    gTasks[taskId].data[0] = gActiveBank;
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    ewram17840.unk9_0 = 1;
    gBattleBankFunc[gActiveBank] = nullsub_45;
}

void sub_8035C10(struct Sprite *sprite)
{
    sub_8031B74(sprite->oam.affineParam);
    sprite->oam.tileNum = sprite->data[5];
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
}

void sub_8035C44(u8 taskId)
{
    u8 r9;

    r9 = gActiveBank;
    gActiveBank = gTasks[taskId].data[0];
    if (!IsDoubleBattle() || (gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_803495C(gActiveBank, 0);
    }
    else
    {
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_803495C(gActiveBank, 0);
        gActiveBank ^= 2;
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_803495C(gActiveBank, 0);
        gActiveBank ^= 2;
    }
    gBattleBankFunc[gActiveBank] = sub_8032E2C;
    gActiveBank = r9;
    DestroyTask(taskId);
}

void OpponentHandlecmd48(void)
{
    if (gBattleBufferA[gActiveBank][1] != 0 && GetBankSide(gActiveBank) == 0)
    {
        OpponentBufferExecCompleted();
        return;
    }

    ewram17810[gActiveBank].unk0_0 = 1;
    if (gBattleBufferA[gActiveBank][2] != 0)
    {
        if (ewram17810[gActiveBank].unk1_1 < 2)
        {
            ewram17810[gActiveBank].unk1_1++;
            return;
        }
        else
        {
            ewram17810[gActiveBank].unk1_1 = 0;
        }
    }
    gUnknown_02024E68[gActiveBank] = sub_8044804(
      gActiveBank,
      (struct BattleInterfaceStruct2 *)&gBattleBufferA[gActiveBank][4],
      gBattleBufferA[gActiveBank][1],
      gBattleBufferA[gActiveBank][2]);
    ewram17810[gActiveBank].unk5 = 0;
    if (gBattleBufferA[gActiveBank][2] != 0)
        ewram17810[gActiveBank].unk5 = 0x5D;
    gBattleBankFunc[gActiveBank] = sub_8035E2C;
}

void sub_8035E2C(void)
{
    if (ewram17810[gActiveBank].unk5++ >= 93)
    {
        ewram17810[gActiveBank].unk5 = 0;
        OpponentBufferExecCompleted();
    }
}

void OpponentHandlecmd49(void)
{
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd50(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleSpriteInvisibility(void)
{
    if (IsBankSpritePresent(gActiveBank) != 0)
    {
        gSprites[gBankSpriteIds[gActiveBank]].invisible = gBattleBufferA[gActiveBank][1];
        sub_8031F88(gActiveBank);
    }
    OpponentBufferExecCompleted();
}

void OpponentHandleBattleAnimation(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        u8 r3 = gBattleBufferA[gActiveBank][1];
        u16 r4 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);

        if (move_anim_start_t3(gActiveBank, gActiveBank, gActiveBank, r3, r4) != 0)
            OpponentBufferExecCompleted();
        else
            gBattleBankFunc[gActiveBank] = sub_80334C0;
    }
}

void OpponentHandleLinkStandbyMsg(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleResetActionMoveSelection(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd55(void)
{
    if ((gBattleTypeFlags & BATTLE_TYPE_LINK) && !(gBattleTypeFlags & BATTLE_TYPE_WILD))
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd56(void)
{
}
