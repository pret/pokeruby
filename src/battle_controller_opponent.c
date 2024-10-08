#include "global.h"
#include "battle.h"
#include "battle_ai_script_commands.h"
#include "battle_ai_switch_items.h"
#include "battle_anim.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "data2.h"
#include "battle_811DA74.h"
#include "battle_anim_special.h"
#include "battle_tower.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "pokeball.h"
#include "pokemon.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "constants/songs.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "util.h"
#include "ewram.h"
#include "constants/moves.h"

struct MovePpInfo
{
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;
};

extern u8 gUnknown_02023A14_50;
extern u8 gActiveBattler;
extern u8 gBattleBufferA[][0x200];
extern u16 gBattlerPartyIndexes[];
extern u8 gBattlerSpriteIds[];
extern u8 gBattleMonForms[];
extern struct SpriteTemplate gCreatingSpriteTemplate;
extern void (*gBattlerControllerFuncs[])(void);
extern u8 gUnknown_0300434C[];
extern u8 gHealthboxSpriteIds[];
extern u16 gBattleTypeFlags;
extern u16 gTrainerBattleOpponent;
extern s32 gAnimMoveDmg;
extern u16 gAnimMovePower;
extern u8 gAnimFriendship;
extern u16 gWeatherMoveAnim;
extern u32 gTransformedPersonalities[];
extern u8 gAnimMoveTurn;
extern u8 gAnimScriptActive;
extern void (*gAnimScriptCallback)(void);
extern struct Window gWindowTemplate_Contest_MoveDescription;
extern u8 gDisplayedStringBattle[];
extern u8 gBattlerTarget;
extern u8 gAbsentBattlerFlags;
extern bool8 gDoingBattleAnim;
extern u16 gIntroSlideFlags;
extern u8 gUnknown_02024E68[];
extern MainCallback gPreBattleCallback1;
extern struct MusicPlayerInfo gMPlayInfo_SE1;
extern struct MusicPlayerInfo gMPlayInfo_SE2;
extern struct MusicPlayerInfo gMPlayInfo_BGM;
extern u32 gBattleControllerExecFlags;

extern u8 sub_8077F68();
extern void sub_8033018(void);
extern void BattleLoadOpponentMonSprite();
extern u8 GetBattlerPosition(u8);
extern void sub_8032984(u8, u16);
extern void sub_80333D4(void);
extern void sub_80312F0(struct Sprite *);
extern u8 StartSendOutMonAnimation();
extern void sub_8032A08();
extern void sub_8033160(void);
extern u8 get_trainer_class_pic_index(void);
extern void sub_80313A0(struct Sprite *);
extern void sub_8032B4C(void);
extern void sub_8031A6C(u16, u8);
extern void sub_8032B84(void);
extern void StartAnimLinearTranslation(struct Sprite *);
extern void sub_8032BBC(void);
extern void oamt_add_pos2_onto_pos1();
extern void StoreSpriteCallbackInData();
extern void sub_803311C(void);
extern void sub_8010384(struct Sprite *);
extern bool8 mplay_80342A4(u8);
extern u8 IsMoveWithoutAnimation();
extern void sub_80326EC();
extern void sub_8031F24(void);
extern void sub_80324BC();
extern void BufferStringBattle();
extern void sub_80331D0(void);
extern void AI_TrySwitchOrUseItem(void);
extern u8 GetBattlerAtPosition(u8);
extern void sub_80330C8(void);
void sub_8033494(void);
extern void move_anim_start_t2_for_situation();
extern void bx_blink_t7(void);
extern void sub_8047858();
extern u8 GetBattlerSide(u8);
extern void StartBattleIntroAnim();
extern void sub_8044CA0(u8);
extern void nullsub_45(void);
extern void sub_8031B74();
extern bool8 IsDoubleBattle(void);
extern void sub_8032E2C(void);
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
    gBattlerControllerFuncs[gActiveBattler] = OpponentBufferRunCommand;
}

void OpponentBufferRunCommand(void)
{
    if (gBattleControllerExecFlags & gBitTable[gActiveBattler])
    {
        if (gBattleBufferA[gActiveBattler][0] <= 0x38)
            gOpponentBufferCommands[gBattleBufferA[gActiveBattler][0]]();
        else
            OpponentBufferExecCompleted();
    }
}

void sub_8032B4C(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        OpponentBufferExecCompleted();
}

// Duplicate of sub_8032B4C
void sub_8032B84(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        OpponentBufferExecCompleted();
}

void sub_8032BBC(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
    {
        sub_8031B74(gSprites[gBattlerSpriteIds[gActiveBattler]].oam.affineParam);
        gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum = gSprites[gBattlerSpriteIds[gActiveBattler]].data[5];
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        OpponentBufferExecCompleted();
    }
}

void sub_8032C4C(void)
{
    if ((--ewram17810[gActiveBattler].unk9) == 0xFF)
    {
        ewram17810[gActiveBattler].unk9 = 0;
        OpponentBufferExecCompleted();
    }
}

void sub_8032C88(void)
{
    bool8 r6 = FALSE;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & BATTLE_TYPE_MULTI)))
    {
        if (gSprites[gHealthboxSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    else
    {
        if (gSprites[gHealthboxSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxSpriteIds[gActiveBattler ^ 2]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    if (IsCryPlayingOrClearCrySongs())
        r6 = FALSE;

    if (r6 && ewram17810[gActiveBattler].unk1_0 && ewram17810[gActiveBattler ^ 2].unk1_0)
    {
        ewram17810[gActiveBattler].unk0_7 = 0;
        ewram17810[gActiveBattler].unk1_0 = 0;
        ewram17810[gActiveBattler ^ 2].unk0_7 = 0;
        ewram17810[gActiveBattler ^ 2].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            m4aMPlayContinue(&gMPlayInfo_BGM);
        else
            m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 256);
        ewram17810[gActiveBattler].unk9 = 3;
        gBattlerControllerFuncs[gActiveBattler] = sub_8032C4C;
    }
}

void sub_8032E2C(void)
{
    if (!ewram17810[gActiveBattler].unk0_3 && !ewram17810[gActiveBattler].unk0_7)
        sub_8141828(gActiveBattler, &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]]);
    if (!ewram17810[gActiveBattler ^ 2].unk0_3 && !ewram17810[gActiveBattler ^ 2].unk0_7)
        sub_8141828(gActiveBattler ^ 2, &gEnemyParty[gBattlerPartyIndexes[gActiveBattler ^ 2]]);
    if (!ewram17810[gActiveBattler].unk0_3 && !ewram17810[gActiveBattler ^ 2].unk0_3)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gUnknown_0300434C[gActiveBattler ^ 2]]);
            sub_8045A5C(
              gHealthboxSpriteIds[gActiveBattler ^ 2],
              &gEnemyParty[gBattlerPartyIndexes[gActiveBattler ^ 2]],
              0);
            sub_804777C(gActiveBattler ^ 2);
            sub_8043DFC(gHealthboxSpriteIds[gActiveBattler ^ 2]);
            sub_8032984(
              gActiveBattler ^ 2,
              GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler ^ 2]], MON_DATA_SPECIES));
        }
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBattler]]);
        sub_8045A5C(
          gHealthboxSpriteIds[gActiveBattler],
          &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]],
          0);
        sub_804777C(gActiveBattler);
        sub_8043DFC(gHealthboxSpriteIds[gActiveBattler]);
        sub_8032984(
          gActiveBattler,
          GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES));

        ewram17840.unk9_0 = 0;
        gBattlerControllerFuncs[gActiveBattler] = sub_8032C88;
    }
}

void sub_8033018(void)
{
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].animEnded == TRUE
     && gSprites[gBattlerSpriteIds[gActiveBattler]].x2 == 0)
    {
        if (!ewram17810[gActiveBattler].unk0_7)
        {
            sub_8141828(gActiveBattler, &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]]);
            return;
        }
        if (ewram17810[gActiveBattler].unk1_0)
        {
            ewram17810[gActiveBattler].unk0_7 = 0;
            ewram17810[gActiveBattler].unk1_0 = 0;
            FreeSpriteTilesByTag(0x27F9);
            FreeSpritePaletteByTag(0x27F9);
            OpponentBufferExecCompleted();
            return;
        }
    }
}

void sub_80330C8(void)
{
    s16 r4 = sub_8045C78(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], 0, 0);

    sub_8043DFC(gHealthboxSpriteIds[gActiveBattler]);
    if (r4 != -1)
        sub_80440EC(gHealthboxSpriteIds[gActiveBattler], r4, 0);
    else
        OpponentBufferExecCompleted();
}

void sub_803311C(void)
{
    if (!gSprites[gBattlerSpriteIds[gActiveBattler]].inUse)
    {
        sub_8043DB0(gHealthboxSpriteIds[gActiveBattler]);
        OpponentBufferExecCompleted();
    }
}

void sub_8033160(void)
{
    if (!ewram17810[gActiveBattler].unk0_6)
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        sub_8032A08(gActiveBattler);
        sub_8043DB0(gHealthboxSpriteIds[gActiveBattler]);
        OpponentBufferExecCompleted();
    }
}

void sub_80331D0(void)
{
    if (gWindowTemplate_Contest_MoveDescription.state == 0)
        OpponentBufferExecCompleted();
}

void bx_blink_t7(void)
{
    u8 spriteId = gBattlerSpriteIds[gActiveBattler];

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
    if (gSprites[gHealthboxSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
    {
        if (gBattleSpriteInfo[gActiveBattler].substituteSprite)
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 6);
        gBattlerControllerFuncs[gActiveBattler] = sub_80332D0;
    }
}

void sub_80332D0(void)
{
    if (!ewram17810[gActiveBattler].unk0_6)
    {
        CreateTask(c3_0802FDF4, 10);
        OpponentBufferExecCompleted();
    }
}

void sub_8033308(void)
{
    if (ewram17810[gActiveBattler].unk1_0)
    {
        ewram17810[gActiveBattler].unk0_7 = 0;
        ewram17810[gActiveBattler].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        StartSpriteAnim(&gSprites[gBattlerSpriteIds[gActiveBattler]], 0);
        sub_8045A5C(
          gHealthboxSpriteIds[gActiveBattler],
          &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]],
          0);
        sub_804777C(gActiveBattler);
        sub_8043DFC(gHealthboxSpriteIds[gActiveBattler]);
        sub_8031F88(gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = sub_8033264;
    }
}

void sub_80333D4(void)
{
    if (!ewram17810[gActiveBattler].unk0_3 && !ewram17810[gActiveBattler].unk0_7)
        sub_8141828(gActiveBattler, &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]]);
    if (gSprites[gUnknown_0300434C[gActiveBattler]].callback == SpriteCallbackDummy
     && !ewram17810[gActiveBattler].unk0_3)
    {
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBattler]]);
        sub_8032984(gActiveBattler, GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES));
        gBattlerControllerFuncs[gActiveBattler] = sub_8033308;
    }
}

void sub_8033494(void)
{
    if (!ewram17810[gActiveBattler].unk0_4)
        OpponentBufferExecCompleted();
}

void sub_80334C0(void)
{
    if (!ewram17810[gActiveBattler].unk0_5)
        OpponentBufferExecCompleted();
}

void OpponentBufferExecCompleted(void)
{
    gBattlerControllerFuncs[gActiveBattler] = OpponentBufferRunCommand;
    gBattleControllerExecFlags &= ~gBitTable[gActiveBattler];
}

void OpponentHandleGetAttributes(void)
{
    u8 buffer[256];
    int r6 = 0;
    s32 i;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        r6 = sub_8033598(gBattlerPartyIndexes[gActiveBattler], buffer);
    }
    else
    {
        u8 r4 = gBattleBufferA[gActiveBattler][2];

        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                r6 += sub_8033598(i, buffer + r6);
            r4 >>= 1;
        }
    }
    BtlController_EmitDataTransfer(1, r6, buffer);
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

    switch (gBattleBufferA[gActiveBattler][1])
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
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - 4);
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
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - 9);
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
    u8 *src = (u8 *)&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]] + gBattleBufferA[gActiveBattler][1];
    u8 *dst;

    MEMSET_ALT(&buffer + gBattleBufferA[gActiveBattler][1], src[i], gBattleBufferA[gActiveBattler][2], i, dst);
    BtlController_EmitDataTransfer(1, gBattleBufferA[gActiveBattler][2], dst);
    OpponentBufferExecCompleted();
}

void OpponentHandleSetAttributes(void)
{
    u8 i;
    u8 r4;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        sub_8033E24(gBattlerPartyIndexes[gActiveBattler]);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBattler][2];
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
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBattler][3];
    struct MovePpInfo *moveData = (struct MovePpInfo *)&gBattleBufferA[gActiveBattler][3];
    s32 i;

    switch (gBattleBufferA[gActiveBattler][1])
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
        SetMonData(&gEnemyParty[a], MON_DATA_SPECIES, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 2:
        SetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBattler][3]);
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
        SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - 4, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 8:
        SetMonData(&gEnemyParty[a], MON_DATA_PP1, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP2, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP3, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP4, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBattler][7]);
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        SetMonData(&gEnemyParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - 9, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 17:
        SetMonData(&gEnemyParty[a], MON_DATA_OT_ID, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 18:
        SetMonData(&gEnemyParty[a], MON_DATA_EXP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 19:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 20:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 21:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 22:
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 23:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 24:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 25:
        SetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 26:
        SetMonData(&gEnemyParty[a], MON_DATA_POKERUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 27:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 28:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 29:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_GAME, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 30:
        SetMonData(&gEnemyParty[a], MON_DATA_POKEBALL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 31:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][7]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][8]);
        break;
    case 32:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 33:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 34:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 35:
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 36:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 37:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 38:
        SetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 39:
        SetMonData(&gEnemyParty[a], MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 40:
        SetMonData(&gEnemyParty[a], MON_DATA_STATUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 41:
        SetMonData(&gEnemyParty[a], MON_DATA_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 42:
        SetMonData(&gEnemyParty[a], MON_DATA_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 43:
        SetMonData(&gEnemyParty[a], MON_DATA_MAX_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 44:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 45:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 46:
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 47:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 48:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 49:
        SetMonData(&gEnemyParty[a], MON_DATA_COOL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 50:
        SetMonData(&gEnemyParty[a], MON_DATA_BEAUTY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 51:
        SetMonData(&gEnemyParty[a], MON_DATA_CUTE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 52:
        SetMonData(&gEnemyParty[a], MON_DATA_SMART, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 53:
        SetMonData(&gEnemyParty[a], MON_DATA_TOUGH, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 54:
        SetMonData(&gEnemyParty[a], MON_DATA_SHEEN, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 55:
        SetMonData(&gEnemyParty[a], MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 56:
        SetMonData(&gEnemyParty[a], MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 57:
        SetMonData(&gEnemyParty[a], MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 58:
        SetMonData(&gEnemyParty[a], MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 59:
        SetMonData(&gEnemyParty[a], MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    }
}

void OpponentHandlecmd3(void)
{
    u8 *dst;
    u8 i;

    MEMSET_ALT(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]] + gBattleBufferA[gActiveBattler][1], gBattleBufferA[gActiveBattler][3 + i],
        gBattleBufferA[gActiveBattler][2], i, dst);
    OpponentBufferExecCompleted();
}

void OpponentHandleLoadPokeSprite(void)
{
    u16 species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES);

    BattleLoadOpponentMonSprite(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
    GetMonSpriteTemplate_803C56C(species, GetBattlerPosition(gActiveBattler));
    gBattlerSpriteIds[gActiveBattler] = CreateSprite(
      &gCreatingSpriteTemplate,
      GetBattlerSpriteCoord(gActiveBattler, 2),
      sub_8077F68(gActiveBattler),
      GetBattlerSubpriority(gActiveBattler));
    gSprites[gBattlerSpriteIds[gActiveBattler]].x2 = -240;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = gActiveBattler;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = species;
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[gActiveBattler]], gBattleMonForms[gActiveBattler]);
    sub_8032984(gActiveBattler, GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES));
    gBattlerControllerFuncs[gActiveBattler] = sub_8033018;
}

void OpponentHandleSendOutPoke(void)
{
    gBattlerPartyIndexes[gActiveBattler] = gBattleBufferA[gActiveBattler][1];

    sub_803495C(gActiveBattler, gBattleBufferA[gActiveBattler][2]);
    gBattlerControllerFuncs[gActiveBattler] = sub_80333D4;
}

void sub_803495C(u8 a, u8 b)
{
    u16 species;

    sub_8032AA8(a, b);
    gBattlerPartyIndexes[a] = gBattleBufferA[a][1];
    species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[a]], MON_DATA_SPECIES);
    gUnknown_0300434C[a] = CreateInvisibleSpriteWithCallback(sub_80312F0);
    BattleLoadOpponentMonSprite(&gEnemyParty[gBattlerPartyIndexes[a]], a);
    GetMonSpriteTemplate_803C56C(species, GetBattlerPosition(a));
    gBattlerSpriteIds[a] = CreateSprite(
      &gCreatingSpriteTemplate,
      GetBattlerSpriteCoord(a, 2),
      sub_8077F68(a),
      GetBattlerSubpriority(a));
    gSprites[gBattlerSpriteIds[a]].data[0] = a;
    gSprites[gBattlerSpriteIds[a]].data[2] = species;
    gSprites[gUnknown_0300434C[a]].data[1] = gBattlerSpriteIds[a];
    gSprites[gBattlerSpriteIds[a]].oam.paletteNum = a;
    StartSpriteAnim(&gSprites[gBattlerSpriteIds[a]], gBattleMonForms[a]);
    gSprites[gBattlerSpriteIds[a]].invisible = TRUE;
    gSprites[gBattlerSpriteIds[a]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[a]].data[0] = StartSendOutMonAnimation(0, 0xFE);
}

void OpponentHandleReturnPokeToBall(void)
{
    if (gBattleBufferA[gActiveBattler][1] == 0)
    {
        ewram17810[gActiveBattler].unk4 = 0;
        gBattlerControllerFuncs[gActiveBattler] = sub_8034B74;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
        sub_8032A08(gActiveBattler);
        sub_8043DB0(gHealthboxSpriteIds[gActiveBattler]);
        OpponentBufferExecCompleted();
    }
}

void sub_8034B74(void)
{
    switch (ewram17810[gActiveBattler].unk4)
    {
    case 0:
        if (gBattleSpriteInfo[gActiveBattler].substituteSprite)
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 5);
        ewram17810[gActiveBattler].unk4 = 1;
        break;
    case 1:
        if (!ewram17810[gActiveBattler].unk0_6)
        {
            ewram17810[gActiveBattler].unk4 = 0;
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 2);
            gBattlerControllerFuncs[gActiveBattler] = sub_8033160;
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
        trainerPicIndex = gSharedMem[BSTRUCT_OFF(unk160A3)];
    }
    else
#endif
    {
        if (gTrainerBattleOpponent == SECRET_BASE_OPPONENT)
            trainerPicIndex = GetSecretBaseTrainerPicIndex();
        else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
            trainerPicIndex = get_trainer_class_pic_index();
        else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
            trainerPicIndex = GetEReaderTrainerPicIndex();
        else
            trainerPicIndex = gTrainers[gTrainerBattleOpponent].trainerPic;
    }

    sub_8031A6C(trainerPicIndex, gActiveBattler);
    GetMonSpriteTemplate_803C5A0(trainerPicIndex, GetBattlerPosition(gActiveBattler));
    gBattlerSpriteIds[gActiveBattler] = CreateSprite(
      &gCreatingSpriteTemplate,
      0xB0,
      40 + 4 * (8 - gTrainerFrontPicCoords[trainerPicIndex].coords),
      GetBattlerSubpriority(gActiveBattler));
    gSprites[gBattlerSpriteIds[gActiveBattler]].x2 = -240;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 2;
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[trainerPicIndex].tag);
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[5] = gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum;
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[trainerPicIndex].tag);
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.affineParam = trainerPicIndex;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = sub_80313A0;
    gBattlerControllerFuncs[gActiveBattler] = sub_8032B4C;
}

void OpponentHandleTrainerSlide(void)
{
    u32 trainerPicIndex;

    if (gTrainerBattleOpponent == SECRET_BASE_OPPONENT)
        trainerPicIndex = GetSecretBaseTrainerPicIndex();
    else if (gBattleTypeFlags & BATTLE_TYPE_BATTLE_TOWER)
        trainerPicIndex = get_trainer_class_pic_index();
    else if (gBattleTypeFlags & BATTLE_TYPE_EREADER_TRAINER)
        trainerPicIndex = GetEReaderTrainerPicIndex();
    else
        trainerPicIndex = gTrainers[gTrainerBattleOpponent].trainerPic;

    sub_8031A6C(trainerPicIndex, gActiveBattler);
    GetMonSpriteTemplate_803C5A0(trainerPicIndex, GetBattlerPosition(gActiveBattler));
    gBattlerSpriteIds[gActiveBattler] = CreateSprite(
      &gCreatingSpriteTemplate,
      0xB0,
      40 + 4 * (8 - gTrainerFrontPicCoords[trainerPicIndex].coords),
      0x1E);
    gSprites[gBattlerSpriteIds[gActiveBattler]].x2 = 96;
    gSprites[gBattlerSpriteIds[gActiveBattler]].x += 32;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = -2;
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[trainerPicIndex].tag);
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[5] = gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum;
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[trainerPicIndex].tag);
    gSprites[gBattlerSpriteIds[gActiveBattler]].oam.affineParam = trainerPicIndex;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = sub_80313A0;
    gBattlerControllerFuncs[gActiveBattler] = sub_8032B84;
}

void OpponentHandleTrainerSlideBack(void)
{
    oamt_add_pos2_onto_pos1(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 35;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = 280;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[4] = gSprites[gBattlerSpriteIds[gActiveBattler]].y;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(&gSprites[gBattlerSpriteIds[gActiveBattler]], SpriteCallbackDummy);
    gBattlerControllerFuncs[gActiveBattler] = sub_8032BBC;
}

void OpponentHandlecmd10(void)
{
    if (ewram17810[gActiveBattler].unk4 == 0)
    {
        if (gBattleSpriteInfo[gActiveBattler].substituteSprite)
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 5);
        ewram17810[gActiveBattler].unk4++;
    }
    else if (!ewram17810[gActiveBattler].unk0_6)
    {
        ewram17810[gActiveBattler].unk4 = 0;
        PlaySE12WithPanning(SE_FAINT, 63);
        gSprites[gBattlerSpriteIds[gActiveBattler]].callback = sub_8010384;
        gBattlerControllerFuncs[gActiveBattler] = sub_803311C;
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
    if (!mplay_80342A4(gActiveBattler))
    {
        u32 r0 = gBattleBufferA[gActiveBattler][1]
               | (gBattleBufferA[gActiveBattler][2] << 8);

        gAnimMoveTurn = gBattleBufferA[gActiveBattler][3];
        gAnimMovePower = gBattleBufferA[gActiveBattler][4]
                          | (gBattleBufferA[gActiveBattler][5] << 8);
        gAnimMoveDmg = gBattleBufferA[gActiveBattler][6]
                          | (gBattleBufferA[gActiveBattler][7] << 8)
                          | (gBattleBufferA[gActiveBattler][8] << 16)
                          | (gBattleBufferA[gActiveBattler][9] << 24);
        gAnimFriendship = gBattleBufferA[gActiveBattler][10];
        gWeatherMoveAnim = gBattleBufferA[gActiveBattler][12]
                          | (gBattleBufferA[gActiveBattler][13] << 8);
        gAnimDisableStructPtr = (struct DisableStruct *)&gBattleBufferA[gActiveBattler][16];
        gTransformedPersonalities[gActiveBattler] = gAnimDisableStructPtr->transformedMonPersonality;

        // Dead code. IsMoveWithoutAnimation always returns 0.
        if (IsMoveWithoutAnimation(r0, gAnimMoveTurn) != 0)
        {
            OpponentBufferExecCompleted();
        }
        else
        {
            ewram17810[gActiveBattler].unk4 = 0;
            gBattlerControllerFuncs[gActiveBattler] = sub_8035238;
        }
    }
}

void sub_8035238(void)
{
    u16 r4 = gBattleBufferA[gActiveBattler][1]
           | (gBattleBufferA[gActiveBattler][2] << 8);
    u8 r7 = gBattleBufferA[gActiveBattler][11];

    switch (ewram17810[gActiveBattler].unk4)
    {
    case 0:
        if (gBattleSpriteInfo[gActiveBattler].substituteSprite && !gBattleSpriteInfo[gActiveBattler].flag_x8)
        {
            gBattleSpriteInfo[gActiveBattler].flag_x8 = 1;
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 5);
        }
        ewram17810[gActiveBattler].unk4 = 1;
        break;
    case 1:
        if (!ewram17810[gActiveBattler].unk0_6)
        {
            sub_80326EC(0);
            DoMoveAnim(r4);
            ewram17810[gActiveBattler].unk4 = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_80326EC(1);
            if ((gBattleSpriteInfo[gActiveBattler].substituteSprite) && r7 <= 1)
            {
                move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 6);
                gBattleSpriteInfo[gActiveBattler].flag_x8 = 0;
            }
            ewram17810[gActiveBattler].unk4 = 3;
        }
        break;
    case 3:
        if (!ewram17810[gActiveBattler].unk0_6)
        {
            sub_8031F24();
            sub_80324BC(
              gActiveBattler,
              gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
            ewram17810[gActiveBattler].unk4 = 0;
            OpponentBufferExecCompleted();
        }
        break;
    }
}

void OpponentHandlePrintString(void)
{
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    BufferStringBattle(*(u16 *)&gBattleBufferA[gActiveBattler][2]);
    Contest_StartTextPrinter(&gWindowTemplate_Contest_MoveDescription, gDisplayedStringBattle, 144, 2, 15);
    gBattlerControllerFuncs[gActiveBattler] = sub_80331D0;
}

void OpponentHandlePrintStringPlayerOnly(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd18(void)
{
    AI_TrySwitchOrUseItem();
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd19(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd20(void)
{
    u8 chosenMoveId;
    u16 move;
    struct ChooseMoveStruct *moveInfo = (struct ChooseMoveStruct *)&gBattleBufferA[gActiveBattler][4];
#if DEBUG
    u16 battler;
    if (gUnknown_02023A14_50 & 4)
    {
        // Move selection cycle
        move = MOVE_NONE;
        while (move == MOVE_NONE)
        {
            move = moveInfo->moves[gSharedMem[BSTRUCT_OFF(dbgAICycleMoveTracker) + ((gActiveBattler & BIT_FLANK) >> 1)]];
            chosenMoveId = gSharedMem[BSTRUCT_OFF(dbgAICycleMoveTracker) + ((gActiveBattler & BIT_FLANK) >> 1)];
            if (move != MOVE_NONE)
            {
                gSharedMem[BSTRUCT_OFF(dbgAICycleMoveTracker) +  ((gActiveBattler & BIT_FLANK) >> 1)]++;
            }
            else
            {
                gSharedMem[BSTRUCT_OFF(dbgAICycleMoveTracker) +  ((gActiveBattler & BIT_FLANK) >> 1)] = 0;
            }
            if (gSharedMem[BSTRUCT_OFF(dbgAICycleMoveTracker) +  ((gActiveBattler & BIT_FLANK) >> 1)] >= 4)
            {
                gSharedMem[BSTRUCT_OFF(dbgAICycleMoveTracker) +  ((gActiveBattler & BIT_FLANK) >> 1)] = 0;
            }
        }
        if (gBattleMoves[move].target & (MOVE_TARGET_USER_OR_SELECTED | MOVE_TARGET_USER))
        {
            battler = gActiveBattler;
        }
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        {
            if (gUnknown_02023A14_50 & 2)
            {
                if (gBattleMoves[move].target == MOVE_TARGET_SELECTED)
                {
                    battler = GetBattlerAtPosition(GetBattlerPosition(gActiveBattler) ^ BIT_FLANK);
                }
                else
                {
                    battler = GetBattlerAtPosition(0);
                }
            }
            else
            {
                battler = (Random() & BIT_FLANK);
            }
        }
        else
        {
            battler = GetBattlerAtPosition(0);
        }
        BtlController_EmitTwoReturnValues(1, B_ACTION_EXEC_SCRIPT, (battler << 8) | chosenMoveId);
        OpponentBufferExecCompleted();
    }
    else
#endif //DEBUG
    if (gBattleTypeFlags & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_FIRST_BATTLE | BATTLE_TYPE_SAFARI | BATTLE_TYPE_ROAMER))
    {
        BattleAI_SetupAIData();
        chosenMoveId = BattleAI_GetAIActionToUse();

        switch (chosenMoveId)
        {
        case 5: // AI_CHOICE_WATCH
            BtlController_EmitTwoReturnValues(1, B_ACTION_SAFARI_WATCH_CAREFULLY, 0);
            break;
        case 4: // AI_CHOICE_FLEE
            BtlController_EmitTwoReturnValues(1, B_ACTION_RUN, 0);
            break;
        default:
            if (gBattleMoves[moveInfo->moves[chosenMoveId]].target & (MOVE_TARGET_USER_OR_SELECTED | MOVE_TARGET_USER))
                gBattlerTarget = gActiveBattler;
            if (gBattleMoves[moveInfo->moves[chosenMoveId]].target & MOVE_TARGET_BOTH)
            {
                gBattlerTarget = GetBattlerAtPosition(0);
                if (gAbsentBattlerFlags & gBitTable[gBattlerTarget])
                    gBattlerTarget = GetBattlerAtPosition(2);
            }
            BtlController_EmitTwoReturnValues(1, B_ACTION_EXEC_SCRIPT, chosenMoveId | (gBattlerTarget << 8));
            break;
        }
        OpponentBufferExecCompleted();
    }
    else
    {
        while (1)
        {
            chosenMoveId = Random() & 3;
            move = moveInfo->moves[chosenMoveId];
            if (move != MOVE_NONE)
            {
                break;
            }
        }

        if (gBattleMoves[move].target & (MOVE_TARGET_USER_OR_SELECTED | MOVE_TARGET_USER))
            BtlController_EmitTwoReturnValues(1, B_ACTION_EXEC_SCRIPT, chosenMoveId | (gActiveBattler << 8));
        else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
            BtlController_EmitTwoReturnValues(1, B_ACTION_EXEC_SCRIPT, chosenMoveId | (GetBattlerAtPosition(Random() & BIT_FLANK) << 8));
        else
            BtlController_EmitTwoReturnValues(1, B_ACTION_EXEC_SCRIPT, chosenMoveId | (GetBattlerAtPosition(0) << 8));
        OpponentBufferExecCompleted();
    }
}

void OpponentHandleOpenBag(void)
{
    // The AI will only ever use an item whose ID fits in 8 bits.
    // If you want the AI to use an item with a higher ID, uncomment the code
    // in the line below.
    BtlController_EmitOneReturnValue(1, gSharedMem[BSTRUCT_OFF(AI_usedItemId) + (gActiveBattler / 2) * 2]/* | (gSharedMem[BSTRUCT_OFF(AI_usedItemId) + (gActiveBattler / 2) * 2 + 1] */);
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd22(void)
{
    s32 r4;

    if (gSharedMem[BSTRUCT_OFF(AI_monToSwitchIntoId) + (GetBattlerPosition(gActiveBattler) / 2)] == PARTY_SIZE)
    {
        u8 r6;
        u8 r5;

        r4 = GetMostSuitableMonToSwitchInto();
        if (r4 == 6)
        {
            if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE))
            {
                r5 = GetBattlerAtPosition(1);
                r6 = r5;
            }
            else
            {
                r6 = GetBattlerAtPosition(1);
                r5 = GetBattlerAtPosition(3);
            }
            for (r4 = 0; r4 < 6; r4++)
            {
                if (GetMonData(&gEnemyParty[r4], MON_DATA_HP) != 0
                 && r4 != gBattlerPartyIndexes[r6]
                 && r4 != gBattlerPartyIndexes[r5])
                    break;
            }
        }
    }
    else
    {
        r4 = gSharedMem[BSTRUCT_OFF(AI_monToSwitchIntoId) + (GetBattlerPosition(gActiveBattler) / 2)];
        gSharedMem[BSTRUCT_OFF(AI_monToSwitchIntoId) + (GetBattlerPosition(gActiveBattler) / 2)] = PARTY_SIZE;
    }
    gSharedMem[BSTRUCT_OFF(monToSwitchIntoId) + gActiveBattler] = r4;
    BtlController_EmitChosenMonReturnValue(1, r4, 0);
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
    r7 = (gBattleBufferA[gActiveBattler][3] << 8) | gBattleBufferA[gActiveBattler][2];
    if (r7 != 0x7FFF)
    {
        u32 maxHP = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_MAX_HP);
        u32 hp = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_HP);

        sub_8043D84(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], maxHP, hp, r7);
    }
    else
    {
        u32 maxHP = GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_MAX_HP);

        sub_8043D84(gActiveBattler, gHealthboxSpriteIds[gActiveBattler], maxHP, 0, r7);
    }
    gBattlerControllerFuncs[gActiveBattler] = sub_80330C8;
}

void OpponentHandleExpBarUpdate(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleStatusIconUpdate(void)
{
    if (mplay_80342A4(gActiveBattler) == 0)
    {
        sub_8045A5C(gHealthboxSpriteIds[gActiveBattler], &gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], 9);
        ewram17810[gActiveBattler].unk0_4 = 0;
        gBattlerControllerFuncs[gActiveBattler] = sub_8033494;
    }
}

void OpponentHandleStatusAnimation(void)
{
    if (mplay_80342A4(gActiveBattler) == 0)
    {
        move_anim_start_t2_for_situation(
          gBattleBufferA[gActiveBattler][1],
          gBattleBufferA[gActiveBattler][2]
          | (gBattleBufferA[gActiveBattler][3] << 8)
          | (gBattleBufferA[gActiveBattler][4] << 16)
          | (gBattleBufferA[gActiveBattler][5] << 24));
        gBattlerControllerFuncs[gActiveBattler] = sub_8033494;
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
    gUnknown_020238C8.unk0_0 = gBattleBufferA[gActiveBattler][1];
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
    if (gSprites[gBattlerSpriteIds[gActiveBattler]].invisible == TRUE)
    {
        OpponentBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBattlerSpriteIds[gActiveBattler]].data[1] = 0;
        sub_8047858(gActiveBattler);
        gBattlerControllerFuncs[gActiveBattler] = bx_blink_t7;
    }
}

void OpponentHandlecmd42(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleEffectivenessSound(void)
{
    s8 pan;

    if (GetBattlerSide(gActiveBattler) == 0)
        pan = -64;
    else
        pan = 63;
    PlaySE12WithPanning(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8), pan);
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd44(void)
{
    PlayFanfare(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
    OpponentBufferExecCompleted();
}

void OpponentHandleFaintingCry(void)
{
    PlayCry3(
      GetMonData(&gEnemyParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES),
      25, 5);
    OpponentBufferExecCompleted();
}

void OpponentHandleIntroSlide(void)
{
    StartBattleIntroAnim(gBattleBufferA[gActiveBattler][1]);
    gIntroSlideFlags |= 1;
    OpponentBufferExecCompleted();
}

void OpponentHandleTrainerBallThrow(void)
{
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gBattlerSpriteIds[gActiveBattler]]);
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[0] = 35;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[2] = 280;
    gSprites[gBattlerSpriteIds[gActiveBattler]].data[4] = gSprites[gBattlerSpriteIds[gActiveBattler]].y;
    gSprites[gBattlerSpriteIds[gActiveBattler]].callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(&gSprites[gBattlerSpriteIds[gActiveBattler]], sub_8035C10);
    taskId = CreateTask(sub_8035C44, 5);
    gTasks[taskId].data[0] = gActiveBattler;
    if (ewram17810[gActiveBattler].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBattler]].func = sub_8044CA0;
    ewram17840.unk9_0 = 1;
    gBattlerControllerFuncs[gActiveBattler] = nullsub_45;
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

    r9 = gActiveBattler;
    gActiveBattler = gTasks[taskId].data[0];
    if (!IsDoubleBattle() || (gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        gBattleBufferA[gActiveBattler][1] = gBattlerPartyIndexes[gActiveBattler];
        sub_803495C(gActiveBattler, 0);
    }
    else
    {
        gBattleBufferA[gActiveBattler][1] = gBattlerPartyIndexes[gActiveBattler];
        sub_803495C(gActiveBattler, 0);
        gActiveBattler ^= 2;
        gBattleBufferA[gActiveBattler][1] = gBattlerPartyIndexes[gActiveBattler];
        sub_803495C(gActiveBattler, 0);
        gActiveBattler ^= 2;
    }
    gBattlerControllerFuncs[gActiveBattler] = sub_8032E2C;
    gActiveBattler = r9;
    DestroyTask(taskId);
}

void OpponentHandlecmd48(void)
{
    if (gBattleBufferA[gActiveBattler][1] != 0 && GetBattlerSide(gActiveBattler) == 0)
    {
        OpponentBufferExecCompleted();
        return;
    }

    ewram17810[gActiveBattler].unk0_0 = 1;
    if (gBattleBufferA[gActiveBattler][2] != 0)
    {
        if (ewram17810[gActiveBattler].unk1_1 < 2)
        {
            ewram17810[gActiveBattler].unk1_1++;
            return;
        }
        else
        {
            ewram17810[gActiveBattler].unk1_1 = 0;
        }
    }
    gUnknown_02024E68[gActiveBattler] = CreatePartyStatusSummarySprites(
      gActiveBattler,
      (struct HpAndStatus *)&gBattleBufferA[gActiveBattler][4],
      gBattleBufferA[gActiveBattler][1],
      gBattleBufferA[gActiveBattler][2]);
    ewram17810[gActiveBattler].unk5 = 0;
    if (gBattleBufferA[gActiveBattler][2] != 0)
        ewram17810[gActiveBattler].unk5 = 0x5D;
    gBattlerControllerFuncs[gActiveBattler] = sub_8035E2C;
}

void sub_8035E2C(void)
{
    if (ewram17810[gActiveBattler].unk5++ >= 93)
    {
        ewram17810[gActiveBattler].unk5 = 0;
        OpponentBufferExecCompleted();
    }
}

void OpponentHandlecmd49(void)
{
    if (ewram17810[gActiveBattler].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBattler]].func = sub_8044CA0;
    OpponentBufferExecCompleted();
}

void OpponentHandlecmd50(void)
{
    OpponentBufferExecCompleted();
}

void OpponentHandleSpriteInvisibility(void)
{
    if (IsBankSpritePresent(gActiveBattler) != 0)
    {
        gSprites[gBattlerSpriteIds[gActiveBattler]].invisible = gBattleBufferA[gActiveBattler][1];
        sub_8031F88(gActiveBattler);
    }
    OpponentBufferExecCompleted();
}

void OpponentHandleBattleAnimation(void)
{
    if (mplay_80342A4(gActiveBattler) == 0)
    {
        u8 r3 = gBattleBufferA[gActiveBattler][1];
        u16 r4 = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);

        if (move_anim_start_t3(gActiveBattler, gActiveBattler, gActiveBattler, r3, r4) != 0)
            OpponentBufferExecCompleted();
        else
            gBattlerControllerFuncs[gActiveBattler] = sub_80334C0;
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
