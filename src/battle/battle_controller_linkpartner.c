#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_anim_813F0F4.h"
#include "battle_interface.h"
#include "data2.h"
#include "battle_811DA74.h"
#include "battle_anim_813F0F4.h"
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

extern u16 gBattleTypeFlags;
extern u8 gDisplayedStringBattle[];
extern u8 gBattleBufferA[][0x200];
extern u8 gActiveBattler;
extern u32 gBattleExecBuffer;
extern u16 gBattlerPartyIndexes[];
extern u8 gBankSpriteIds[];
extern u8 gBattleOutcome;
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E68[];
extern u8 gDoingBattleAnim;
extern u32 gTransformedPersonalities[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern s32 gAnimMoveDmg;
extern u16 gAnimMovePower;
extern u8 gAnimFriendship;
extern u16 gWeatherMoveAnim;
extern u8 gAnimMoveTurn;
extern struct Window gUnknown_03004210;
extern MainCallback gPreBattleCallback1;
extern void (*gBattleBankFunc[])(void);
extern u8 gHealthboxIDs[];
extern u8 gUnknown_0300434C[];
extern u8 gBattleMonForms[];
extern u8 gAnimScriptActive;
extern void (*gAnimScriptCallback)(void);

extern u8 move_anim_start_t3();
extern u8 IsBankSpritePresent();
extern void sub_8044CA0(u8);
extern void sub_8030E38(struct Sprite *);
extern void StartBattleIntroAnim();
extern void sub_8047858();
extern void move_anim_start_t2_for_situation();
extern void sub_8043D84();
extern void BufferStringBattle();
extern void sub_8031F24(void);
extern void sub_80326EC();
extern void DoMoveAnim();
extern void sub_80324BC();
extern u8 sub_8031720();
extern u8 mplay_80342A4();
extern void oamt_add_pos2_onto_pos1();
extern void StoreSpriteCallbackInData();
extern void StartAnimLinearTranslation(struct Sprite *);
extern void sub_80105EC(struct Sprite *);
extern s32 sub_803FC34(u16);
extern void LoadPlayerTrainerBankSprite();
extern void sub_80313A0(struct Sprite *);
extern u8 StartSendOutMonAnimation();
extern void sub_80312F0(struct Sprite *);
extern u8 CreateInvisibleSpriteWithCallback();
extern void BattleLoadPlayerMonSprite();
extern u8 GetBattlerSpriteCoord();
extern u8 sub_8077F68();
extern u8 sub_8079E90();
extern void nullsub_10();
extern void sub_8045A5C();
extern void sub_804777C();
extern void sub_8043DFC();
//extern s16 sub_8045C78();
extern void sub_80440EC();
extern void HandleLowHpMusicChange();
extern void nullsub_9(u16);
extern void sub_8043DB0();
extern void move_anim_start_t4();
extern void c3_0802FDF4(u8);
extern void sub_8031F88();
extern void c2_8011A1C(void);

// this file's functions

void LinkPartnerBufferRunCommand(void);
void sub_811E0A0(void);
void LinkPartnerBufferExecCompleted(void);
u32 dp01_getattr_by_ch1_for_player_pokemon(u8 a, u8 *b);
void sub_811EC68(u8);
void sub_811F864(u8, u8);
void sub_811FA5C(void);
void sub_811FF30(void);
void sub_812071C(u8);
void sub_81208E0(void);

void LinkPartnerHandleGetAttributes(void);
void LinkPartnerHandlecmd1(void);
void LinkPartnerHandleSetAttributes(void);
void LinkPartnerHandlecmd3(void);
void LinkPartnerHandleLoadPokeSprite(void);
void LinkPartnerHandleSendOutPoke(void);
void LinkPartnerHandleReturnPokeToBall(void);
void LinkPartnerHandleTrainerThrow(void);
void LinkPartnerHandleTrainerSlide(void);
void LinkPartnerHandleTrainerSlideBack(void);
void LinkPartnerHandlecmd10(void);
void LinkPartnerHandlecmd11(void);
void LinkPartnerHandlecmd12(void);
void LinkPartnerHandleBallThrow(void);
void LinkPartnerHandlePuase(void);
void LinkPartnerHandleMoveAnimation(void);
void LinkPartnerHandlePrintString(void);
void LinkPartnerHandlePrintStringPlayerOnly(void);
void LinkPartnerHandlecmd18(void);
void LinkPartnerHandlecmd19(void);
void LinkPartnerHandlecmd20(void);
void LinkPartnerHandleOpenBag(void);
void LinkPartnerHandlecmd22(void);
void LinkPartnerHandlecmd23(void);
void LinkPartnerHandleHealthBarUpdate(void);
void LinkPartnerHandleExpBarUpdate(void);
void LinkPartnerHandleStatusIconUpdate(void);
void LinkPartnerHandleStatusAnimation(void);
void LinkPartnerHandleStatusXor(void);
void LinkPartnerHandlecmd29(void);
void LinkPartnerHandleDMATransfer(void);
void LinkPartnerHandlecmd31(void);
void LinkPartnerHandlecmd32(void);
void LinkPartnerHandlecmd33(void);
void LinkPartnerHandlecmd34(void);
void LinkPartnerHandlecmd35(void);
void LinkPartnerHandlecmd36(void);
void LinkPartnerHandlecmd37(void);
void LinkPartnerHandlecmd38(void);
void LinkPartnerHandlecmd39(void);
void LinkPartnerHandlecmd40(void);
void LinkPartnerHandleHitAnimation(void);
void LinkPartnerHandlecmd42(void);
void LinkPartnerHandleEffectivenessSound(void);
void LinkPartnerHandlecmd44(void);
void LinkPartnerHandleFaintingCry(void);
void LinkPartnerHandleIntroSlide(void);
void LinkPartnerHandleTrainerBallThrow(void);
void LinkPartnerHandlecmd48(void);
void LinkPartnerHandlecmd49(void);
void LinkPartnerHandlecmd50(void);
void LinkPartnerHandleSpriteInvisibility(void);
void LinkPartnerHandleBattleAnimation(void);
void LinkPartnerHandleLinkStandbyMsg(void);
void LinkPartnerHandleResetActionMoveSelection(void);
void LinkPartnerHandlecmd55(void);
void LinkPartnerHandlecmd56(void);

// const data
typedef void (*BattleBufferCmd) (void);
static const BattleBufferCmd gLinkPartnerBufferCommands[] =
{
    LinkPartnerHandleGetAttributes,
    LinkPartnerHandlecmd1,
    LinkPartnerHandleSetAttributes,
    LinkPartnerHandlecmd3,
    LinkPartnerHandleLoadPokeSprite,
    LinkPartnerHandleSendOutPoke,
    LinkPartnerHandleReturnPokeToBall,
    LinkPartnerHandleTrainerThrow,
    LinkPartnerHandleTrainerSlide,
    LinkPartnerHandleTrainerSlideBack,
    LinkPartnerHandlecmd10,
    LinkPartnerHandlecmd11,
    LinkPartnerHandlecmd12,
    LinkPartnerHandleBallThrow,
    LinkPartnerHandlePuase,
    LinkPartnerHandleMoveAnimation,
    LinkPartnerHandlePrintString,
    LinkPartnerHandlePrintStringPlayerOnly,
    LinkPartnerHandlecmd18,
    LinkPartnerHandlecmd19,
    LinkPartnerHandlecmd20,
    LinkPartnerHandleOpenBag,
    LinkPartnerHandlecmd22,
    LinkPartnerHandlecmd23,
    LinkPartnerHandleHealthBarUpdate,
    LinkPartnerHandleExpBarUpdate,
    LinkPartnerHandleStatusIconUpdate,
    LinkPartnerHandleStatusAnimation,
    LinkPartnerHandleStatusXor,
    LinkPartnerHandlecmd29,
    LinkPartnerHandleDMATransfer,
    LinkPartnerHandlecmd31,
    LinkPartnerHandlecmd32,
    LinkPartnerHandlecmd33,
    LinkPartnerHandlecmd34,
    LinkPartnerHandlecmd35,
    LinkPartnerHandlecmd36,
    LinkPartnerHandlecmd37,
    LinkPartnerHandlecmd38,
    LinkPartnerHandlecmd39,
    LinkPartnerHandlecmd40,
    LinkPartnerHandleHitAnimation,
    LinkPartnerHandlecmd42,
    LinkPartnerHandleEffectivenessSound,
    LinkPartnerHandlecmd44,
    LinkPartnerHandleFaintingCry,
    LinkPartnerHandleIntroSlide,
    LinkPartnerHandleTrainerBallThrow,
    LinkPartnerHandlecmd48,
    LinkPartnerHandlecmd49,
    LinkPartnerHandlecmd50,
    LinkPartnerHandleSpriteInvisibility,
    LinkPartnerHandleBattleAnimation,
    LinkPartnerHandleLinkStandbyMsg,
    LinkPartnerHandleResetActionMoveSelection,
    LinkPartnerHandlecmd55,
    LinkPartnerHandlecmd56,
};
// code starts here

void nullsub_74(void)
{
}

void SetBankFuncToLinkPartnerBufferRunCommand(void)
{
    gBattleBankFunc[gActiveBattler] = LinkPartnerBufferRunCommand;
}

void LinkPartnerBufferRunCommand(void)
{
    if (gBattleExecBuffer & gBitTable[gActiveBattler])
    {
        if (gBattleBufferA[gActiveBattler][0] <= 0x38)
            gLinkPartnerBufferCommands[gBattleBufferA[gActiveBattler][0]]();
        else
            LinkPartnerBufferExecCompleted();
    }
}

void sub_811DAE4(void)
{
    if (gSprites[gBankSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
        LinkPartnerBufferExecCompleted();
}

void sub_811DB1C(void)
{
    if (gSprites[gBankSpriteIds[gActiveBattler]].callback == SpriteCallbackDummy)
    {
        nullsub_10(0);
        FreeSpriteOamMatrix(&gSprites[gBankSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBankSpriteIds[gActiveBattler]]);
        LinkPartnerBufferExecCompleted();
    }
}

void sub_811DB84(void)
{
    if ((--ewram17810[gActiveBattler].unk9) == 0xFF)
    {
        ewram17810[gActiveBattler].unk9 = 0;
        LinkPartnerBufferExecCompleted();
    }
}

void sub_811DBC0(void)
{
    bool8 r6 = FALSE;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & 0x40)))
    {
        if (gSprites[gHealthboxIDs[gActiveBattler]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    else
    {
        if (gSprites[gHealthboxIDs[gActiveBattler]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxIDs[gActiveBattler ^ 2]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    if (IsCryPlayingOrClearCrySongs())
        r6 = FALSE;
    if (r6)
    {
        ewram17810[gActiveBattler].unk9 = 3;
        gBattleBankFunc[gActiveBattler] = sub_811DB84;
    }
}

void sub_811DCA0(void)
{
    u8 r2;

    if (!ewram17810[gActiveBattler].unk0_3)
    {
        // I couldn't get it to work as a bitfield here
        r2 = *((u8 *)&ewram17810[gActiveBattler ^ 2]) & 8;
        if (!r2 && (++ewram17810[gActiveBattler].unk9) != 1)
        {
            ewram17810[gActiveBattler].unk9 = r2;
            if (IsDoubleBattle() && !(gBattleTypeFlags & 0x40))
            {
                DestroySprite(&gSprites[gUnknown_0300434C[gActiveBattler ^ 2]]);
                sub_8045A5C(gHealthboxIDs[gActiveBattler ^ 2], &gPlayerParty[gBattlerPartyIndexes[gActiveBattler ^ 2]], 0);
                sub_804777C(gActiveBattler ^ 2);
                sub_8043DFC(gHealthboxIDs[gActiveBattler ^ 2]);
            }
            DestroySprite(&gSprites[gUnknown_0300434C[gActiveBattler]]);
            sub_8045A5C(gHealthboxIDs[gActiveBattler], &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], 0);
            sub_804777C(gActiveBattler);
            sub_8043DFC(gHealthboxIDs[gActiveBattler]);
            (s8)ewram17810[4].unk9 &= ~1;
            gBattleBankFunc[gActiveBattler] = sub_811DBC0;
        }
    }
}

void sub_811DDE8(void)
{
    if (gSprites[gBankSpriteIds[gActiveBattler]].animEnded
     && gSprites[gBankSpriteIds[gActiveBattler]].pos2.x == 0)
        LinkPartnerBufferExecCompleted();
}

void bx_t3_healthbar_update(void)
{
    s16 r4;

    r4 = sub_8045C78(gActiveBattler, gHealthboxIDs[gActiveBattler], 0, 0);
    sub_8043DFC(gHealthboxIDs[gActiveBattler]);
    if (r4 != -1)
    {
        sub_80440EC(gHealthboxIDs[gActiveBattler], r4, 0);
    }
    else
    {
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        LinkPartnerBufferExecCompleted();
    }
}

void sub_811DE98(void)
{
    if (gSprites[gBankSpriteIds[gActiveBattler]].pos1.y + gSprites[gBankSpriteIds[gActiveBattler]].pos2.y > 160)
    {
        nullsub_9(GetMonData(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES));
        FreeOamMatrix(gSprites[gBankSpriteIds[gActiveBattler]].oam.matrixNum);
        DestroySprite(&gSprites[gBankSpriteIds[gActiveBattler]]);
        sub_8043DB0(gHealthboxIDs[gActiveBattler]);
        LinkPartnerBufferExecCompleted();
    }
}

void sub_811DF34(void)
{
    if (!ewram17810[gActiveBattler].unk0_6)
    {
        FreeSpriteOamMatrix(&gSprites[gBankSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBankSpriteIds[gActiveBattler]]);
        sub_8043DB0(gHealthboxIDs[gActiveBattler]);
        LinkPartnerBufferExecCompleted();
    }
}

void sub_811DFA0(void)
{
    if (gUnknown_03004210.state == 0)
        LinkPartnerBufferExecCompleted();
}

void bx_blink_t3(void)
{
    u8 spriteId = gBankSpriteIds[gActiveBattler];
    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = 0;
        LinkPartnerBufferExecCompleted();
    }
    else
    {
        if ((gSprites[spriteId].data[1] % 4) == 0)
        {
            gSprites[spriteId].invisible ^= 1;
        }
        gSprites[spriteId].data[1]++;
    }
}

void sub_811E034(void)
{
    if (gSprites[gHealthboxIDs[gActiveBattler]].callback == SpriteCallbackDummy)
    {
        if (ewram17800[gActiveBattler].substituteSprite)
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 6);
        gBattleBankFunc[gActiveBattler] = sub_811E0A0;
    }
}

void sub_811E0A0(void)
{
    if (!ewram17810[gActiveBattler].unk0_6)
        LinkPartnerBufferExecCompleted();
}

void sub_811E0CC(void)
{
    if (ewram17810[gActiveBattler].unk1_0)
    {
        ewram17810[gActiveBattler].unk0_7 = 0;
        ewram17810[gActiveBattler].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        CreateTask(c3_0802FDF4, 10);
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        StartSpriteAnim(&gSprites[gBankSpriteIds[gActiveBattler]], 0);
        sub_8045A5C(gHealthboxIDs[gActiveBattler], &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], 0);
        sub_804777C(gActiveBattler);
        sub_8043DFC(gHealthboxIDs[gActiveBattler]);
        sub_8031F88(gActiveBattler);
        gBattleBankFunc[gActiveBattler] = sub_811E034;
    }
}

void sub_811E1BC(void)
{
    if (!ewram17810[gActiveBattler].unk0_3 && !ewram17810[gActiveBattler].unk0_7)
        sub_8141828(gActiveBattler, &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]]);
    if (gSprites[gUnknown_0300434C[gActiveBattler]].callback == SpriteCallbackDummy
     && !ewram17810[gActiveBattler].unk0_3)
    {
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBattler]]);
        gBattleBankFunc[gActiveBattler] = sub_811E0CC;
    }
}

void sub_811E258(void)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        m4aSongNumStop(0x5A);
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
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
            gBattleBankFunc[gActiveBattler] = sub_811E258;
        }
        else
        {
            m4aSongNumStop(0x5A);
            gMain.inBattle = FALSE;
            gMain.callback1 = gPreBattleCallback1;
            SetMainCallback2(gMain.savedCallback);
        }
    }
}

void LinkPartnerBufferExecCompleted(void)
{
    u8 multiplayerId;

    gBattleBankFunc[gActiveBattler] = LinkPartnerBufferRunCommand;
    if (gBattleTypeFlags & 2)
    {
        multiplayerId = GetMultiplayerId();
        PrepareBufferDataTransferLink(2, 4, &multiplayerId);
        gBattleBufferA[gActiveBattler][0] = 0x38;
    }
    else
    {
        gBattleExecBuffer &= ~gBitTable[gActiveBattler];
    }
}

void sub_811E38C(void)
{
    if (!ewram17810[gActiveBattler].unk0_4)
        LinkPartnerBufferExecCompleted();
}

void sub_811E3B8(void)
{
    if (!ewram17810[gActiveBattler].unk0_5)
        LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleGetAttributes(void)
{
    u8 unk[256];
    int r6 = 0;
    s32 i;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        r6 = dp01_getattr_by_ch1_for_player_pokemon(gBattlerPartyIndexes[gActiveBattler], unk);
    }
    else
    {
        u8 r4 = gBattleBufferA[gActiveBattler][2];

        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                r6 += dp01_getattr_by_ch1_for_player_pokemon(i, unk + r6);
            r4 >>= 1;
        }
    }
    Emitcmd29(1, r6, unk);
    LinkPartnerBufferExecCompleted();
}

// Duplicate of dp01_getattr_by_ch1_for_player_pokemon_
u32 dp01_getattr_by_ch1_for_player_pokemon(u8 a, u8 *buffer)
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
        battlePokemon.speedIV = GetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV);
        battlePokemon.spAttackIV = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV);
        battlePokemon.spDefenseIV = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV);
        battlePokemon.personality = GetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY);
        battlePokemon.status1 = GetMonData(&gPlayerParty[a], MON_DATA_STATUS);
        battlePokemon.level = GetMonData(&gPlayerParty[a], MON_DATA_LEVEL);
        battlePokemon.hp = GetMonData(&gPlayerParty[a], MON_DATA_HP);
        battlePokemon.maxHP = GetMonData(&gPlayerParty[a], MON_DATA_MAX_HP);
        battlePokemon.attack = GetMonData(&gPlayerParty[a], MON_DATA_ATK);
        battlePokemon.defense = GetMonData(&gPlayerParty[a], MON_DATA_DEF);
        battlePokemon.speed = GetMonData(&gPlayerParty[a], MON_DATA_SPEED);
        battlePokemon.spAttack = GetMonData(&gPlayerParty[a], MON_DATA_SPATK);
        battlePokemon.spDefense = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF);
        battlePokemon.isEgg = GetMonData(&gPlayerParty[a], MON_DATA_IS_EGG);
        battlePokemon.altAbility = GetMonData(&gPlayerParty[a], MON_DATA_ALT_ABILITY);
        battlePokemon.otId = GetMonData(&gPlayerParty[a], MON_DATA_OT_ID);
        GetMonData(&gPlayerParty[a], MON_DATA_NICKNAME, nickname);
        StringCopy10(battlePokemon.nickname, nickname);
        GetMonData(&gPlayerParty[a], MON_DATA_OT_NAME, battlePokemon.otName);
        MEMCPY_ALT(&battlePokemon, buffer, sizeof(battlePokemon), size, src);
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
        MEMCPY_ALT(&moveData, buffer, sizeof(moveData), size, src);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - 4);
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
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - 9);
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
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPEED_EV);
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
        buffer[3] = GetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV);
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
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV);
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
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPEED);
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

void LinkPartnerHandlecmd1(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleSetAttributes(void)
{
    u8 i;
    u8 r4;

    if (gBattleBufferA[gActiveBattler][2] == 0)
    {
        sub_811EC68(gBattlerPartyIndexes[gActiveBattler]);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBattler][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                sub_811EC68(i);
            r4 >>= 1;
        }
    }
    LinkPartnerBufferExecCompleted();
}

// Duplicate of dp01_setattr_by_ch1_for_player_pokemon
void sub_811EC68(u8 a)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBattler][3];
    struct MovePpInfo *moveData = (struct MovePpInfo *)&gBattleBufferA[gActiveBattler][3];
    s32 i;

    switch (gBattleBufferA[gActiveBattler][1])
    {
    case 0:
        {
            u8 iv;

            SetMonData(&gPlayerParty[a], MON_DATA_SPECIES, &battlePokemon->species);
            SetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM, &battlePokemon->item);
            for (i = 0; i < 4; i++)
            {
                SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + i, &battlePokemon->moves[i]);
                SetMonData(&gPlayerParty[a], MON_DATA_PP1 + i, &battlePokemon->pp[i]);
            }
            SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, &battlePokemon->ppBonuses);
            SetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP, &battlePokemon->friendship);
            SetMonData(&gPlayerParty[a], MON_DATA_EXP, &battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, &iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, &iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, &iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV, &iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, &iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, &iv);
            SetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY, &battlePokemon->personality);
            SetMonData(&gPlayerParty[a], MON_DATA_STATUS, &battlePokemon->status1);
            SetMonData(&gPlayerParty[a], MON_DATA_LEVEL, &battlePokemon->level);
            SetMonData(&gPlayerParty[a], MON_DATA_HP, &battlePokemon->hp);
            SetMonData(&gPlayerParty[a], MON_DATA_MAX_HP, &battlePokemon->maxHP);
            SetMonData(&gPlayerParty[a], MON_DATA_ATK, &battlePokemon->attack);
            SetMonData(&gPlayerParty[a], MON_DATA_DEF, &battlePokemon->defense);
            SetMonData(&gPlayerParty[a], MON_DATA_SPEED, &battlePokemon->speed);
            SetMonData(&gPlayerParty[a], MON_DATA_SPATK, &battlePokemon->spAttack);
            SetMonData(&gPlayerParty[a], MON_DATA_SPDEF, &battlePokemon->spDefense);
        }
        break;
    case 1:
        SetMonData(&gPlayerParty[a], MON_DATA_SPECIES, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 2:
        SetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 3:
        for (i = 0; i < 4; i++)
        {
            SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + i, &moveData->moves[i]);
            SetMonData(&gPlayerParty[a], MON_DATA_PP1 + i, &moveData->pp[i]);
        }
        SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBattler][1] - 4, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 8:
        SetMonData(&gPlayerParty[a], MON_DATA_PP1, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP2, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP3, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP4, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBattler][7]);
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        SetMonData(&gPlayerParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBattler][1] - 9, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 17:
        SetMonData(&gPlayerParty[a], MON_DATA_OT_ID, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 18:
        SetMonData(&gPlayerParty[a], MON_DATA_EXP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 19:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 20:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 21:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 22:
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 23:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 24:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 25:
        SetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 26:
        SetMonData(&gPlayerParty[a], MON_DATA_POKERUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 27:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 28:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 29:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_GAME, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 30:
        SetMonData(&gPlayerParty[a], MON_DATA_POKEBALL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 31:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][4]);
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][5]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][6]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][7]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][8]);
        break;
    case 32:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 33:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 34:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 35:
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 36:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 37:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 38:
        SetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 39:
        SetMonData(&gPlayerParty[a], MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 40:
        SetMonData(&gPlayerParty[a], MON_DATA_STATUS, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 41:
        SetMonData(&gPlayerParty[a], MON_DATA_LEVEL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 42:
        SetMonData(&gPlayerParty[a], MON_DATA_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 43:
        SetMonData(&gPlayerParty[a], MON_DATA_MAX_HP, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 44:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 45:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 46:
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 47:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 48:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 49:
        SetMonData(&gPlayerParty[a], MON_DATA_COOL, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 50:
        SetMonData(&gPlayerParty[a], MON_DATA_BEAUTY, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 51:
        SetMonData(&gPlayerParty[a], MON_DATA_CUTE, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 52:
        SetMonData(&gPlayerParty[a], MON_DATA_SMART, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 53:
        SetMonData(&gPlayerParty[a], MON_DATA_TOUGH, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 54:
        SetMonData(&gPlayerParty[a], MON_DATA_SHEEN, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 55:
        SetMonData(&gPlayerParty[a], MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 56:
        SetMonData(&gPlayerParty[a], MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 57:
        SetMonData(&gPlayerParty[a], MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 58:
        SetMonData(&gPlayerParty[a], MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    case 59:
        SetMonData(&gPlayerParty[a], MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBattler][3]);
        break;
    }
    HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
}

void LinkPartnerHandlecmd3(void)
{
    u8 *dst;
    u8 i;

    MEMSET_ALT(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]] + gBattleBufferA[gActiveBattler][1],
        gBattleBufferA[gActiveBattler][3 + i], gBattleBufferA[gActiveBattler][2], i, dst);

    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleLoadPokeSprite(void)
{
    BattleLoadPlayerMonSprite(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
    GetMonSpriteTemplate_803C56C(
      GetMonData(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES),
      GetBattlerPosition(gActiveBattler));
    gBankSpriteIds[gActiveBattler] = CreateSprite(
      &gUnknown_02024E8C,
      GetBattlerSpriteCoord(gActiveBattler, 2),
      sub_8077F68(gActiveBattler),
      sub_8079E90(gActiveBattler));
    gSprites[gBankSpriteIds[gActiveBattler]].pos2.x = -240;
    gSprites[gBankSpriteIds[gActiveBattler]].data[0] = gActiveBattler;
    gSprites[gBankSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
    StartSpriteAnim(&gSprites[gBankSpriteIds[gActiveBattler]], gBattleMonForms[gActiveBattler]);
    gBattleBankFunc[gActiveBattler] = sub_811DDE8;
}

void LinkPartnerHandleSendOutPoke(void)
{
    sub_8032AA8(gActiveBattler, gBattleBufferA[gActiveBattler][2]);
    gBattlerPartyIndexes[gActiveBattler] = gBattleBufferA[gActiveBattler][1];
    BattleLoadPlayerMonSprite(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
    sub_811F864(gActiveBattler, gBattleBufferA[gActiveBattler][2]);
    gBattleBankFunc[gActiveBattler] = sub_811E1BC;
}

void sub_811F864(u8 a, u8 b)
{
    u16 species;

    sub_8032AA8(a, b);
    gBattlerPartyIndexes[a] = gBattleBufferA[a][1];
    species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[a]], MON_DATA_SPECIES);
    gUnknown_0300434C[a] = CreateInvisibleSpriteWithCallback(sub_80312F0);
    GetMonSpriteTemplate_803C56C(species, GetBattlerPosition(a));
    gBankSpriteIds[a] = CreateSprite(
      &gUnknown_02024E8C,
      GetBattlerSpriteCoord(a, 2),
      sub_8077F68(a),
      sub_8079E90(a));
    gSprites[gUnknown_0300434C[a]].data[1] = gBankSpriteIds[a];
    gSprites[gBankSpriteIds[a]].data[0] = a;
    gSprites[gBankSpriteIds[a]].data[2] = species;
    gSprites[gBankSpriteIds[a]].oam.paletteNum = a;
    StartSpriteAnim(&gSprites[gBankSpriteIds[a]], gBattleMonForms[a]);
    gSprites[gBankSpriteIds[a]].invisible = TRUE;
    gSprites[gBankSpriteIds[a]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[a]].data[0] = StartSendOutMonAnimation(0, 0xFF);
}

void LinkPartnerHandleReturnPokeToBall(void)
{
    if (gBattleBufferA[gActiveBattler][1] == 0)
    {
        ewram17810[gActiveBattler].unk4 = 0;
        gBattleBankFunc[gActiveBattler] = sub_811FA5C;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gBankSpriteIds[gActiveBattler]]);
        DestroySprite(&gSprites[gBankSpriteIds[gActiveBattler]]);
        sub_8043DB0(gHealthboxIDs[gActiveBattler]);
        LinkPartnerBufferExecCompleted();
    }
}

void sub_811FA5C(void)
{
    switch (ewram17810[gActiveBattler].unk4)
    {
    case 0:
        if (ewram17800[gActiveBattler].substituteSprite)
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 5);
        ewram17810[gActiveBattler].unk4 = 1;
        break;
    case 1:
        if (!ewram17810[gActiveBattler].unk0_6)
        {
            ewram17810[gActiveBattler].unk4 = 0;
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 1);
            gBattleBankFunc[gActiveBattler] = sub_811DF34;
        }
        break;
    }
}

void LinkPartnerHandleTrainerThrow(void)
{
    s16 xOffset;
    u32 gender;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (GetBattlerPosition(gActiveBattler) & 2)
            xOffset = 16;
        else
            xOffset = -16;
        gender = gLinkPlayers[sub_803FC34(gActiveBattler)].gender;
    }
    else
    {
        xOffset = 0;
        gender = gLinkPlayers[GetMultiplayerId() ^ 1].gender;
    }
    LoadPlayerTrainerBankSprite(gender, gActiveBattler);
    GetMonSpriteTemplate_803C5A0(gender, GetBattlerPosition(gActiveBattler));
    gBankSpriteIds[gActiveBattler] = CreateSprite(
      &gUnknown_02024E8C,
      80 + xOffset, 80 + 4 * (8 - gTrainerBackPicCoords[gender].coords),
      sub_8079E90(gActiveBattler));
    gSprites[gBankSpriteIds[gActiveBattler]].oam.paletteNum = gActiveBattler;
    gSprites[gBankSpriteIds[gActiveBattler]].pos2.x = 240;
    gSprites[gBankSpriteIds[gActiveBattler]].data[0] = -2;
    gSprites[gBankSpriteIds[gActiveBattler]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBattler] = sub_811DAE4;
}

void LinkPartnerHandleTrainerSlide(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleTrainerSlideBack(void)
{
    oamt_add_pos2_onto_pos1(&gSprites[gBankSpriteIds[gActiveBattler]]);
    gSprites[gBankSpriteIds[gActiveBattler]].data[0] = 35;
    gSprites[gBankSpriteIds[gActiveBattler]].data[2] = -40;
    gSprites[gBankSpriteIds[gActiveBattler]].data[4] = gSprites[gBankSpriteIds[gActiveBattler]].pos1.y;
    gSprites[gBankSpriteIds[gActiveBattler]].callback = StartAnimLinearTranslation;
    StoreSpriteCallbackInData(&gSprites[gBankSpriteIds[gActiveBattler]], SpriteCallbackDummy);
    gBattleBankFunc[gActiveBattler] = sub_811DB1C;
}

void LinkPartnerHandlecmd10(void)
{
    if (ewram17810[gActiveBattler].unk4 == 0)
    {
        if (ewram17800[gActiveBattler].substituteSprite)
            move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 5);
        ewram17810[gActiveBattler].unk4++;
    }
    else if (!ewram17810[gActiveBattler].unk0_6)
    {
        ewram17810[gActiveBattler].unk4 = 0;
        HandleLowHpMusicChange(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        PlaySE12WithPanning(SE_POKE_DEAD, -64);
        gSprites[gBankSpriteIds[gActiveBattler]].data[1] = 0;
        gSprites[gBankSpriteIds[gActiveBattler]].data[2] = 5;
        gSprites[gBankSpriteIds[gActiveBattler]].callback = sub_80105EC;
        gBattleBankFunc[gActiveBattler] = sub_811DE98;
    }
}

void LinkPartnerHandlecmd11(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd12(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleBallThrow(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlePuase(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleMoveAnimation(void)
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

        if (sub_8031720(r0, gAnimMoveTurn) != 0)
            LinkPartnerBufferExecCompleted();
        else
        {
            ewram17810[gActiveBattler].unk4 = 0;
            gBattleBankFunc[gActiveBattler] = sub_811FF30;
        }
    }
}

void sub_811FF30(void)
{
    u16 r4 = gBattleBufferA[gActiveBattler][1]
           | (gBattleBufferA[gActiveBattler][2] << 8);
    u8 r7 = gBattleBufferA[gActiveBattler][11];

    switch (ewram17810[gActiveBattler].unk4)
    {
    case 0:
        if (ewram17800[gActiveBattler].substituteSprite && !ewram17800[gActiveBattler].unk0_3)
        {
            ewram17800[gActiveBattler].unk0_3 = 1;
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
            if ((ewram17800[gActiveBattler].substituteSprite) && r7 <= 1)
            {
                move_anim_start_t4(gActiveBattler, gActiveBattler, gActiveBattler, 6);
                ewram17800[gActiveBattler].unk0_3 = 0;
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
            LinkPartnerBufferExecCompleted();
        }
        break;
    }
}

void LinkPartnerHandlePrintString(void)
{
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    BufferStringBattle(*(u16 *)&gBattleBufferA[gActiveBattler][2]);
    Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
    gBattleBankFunc[gActiveBattler] = sub_811DFA0;
}

void LinkPartnerHandlePrintStringPlayerOnly(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd18(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd19(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd20(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleOpenBag(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd22(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd23(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleHealthBarUpdate(void)
{
    s16 r7;

    load_gfxc_health_bar(0);
    r7 = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);
    if (r7 != 0x7FFF)
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_MAX_HP);
        u32 hp = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_HP);

        sub_8043D84(gActiveBattler, gHealthboxIDs[gActiveBattler], maxHP, hp, r7);
    }
    else
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_MAX_HP);

        sub_8043D84(gActiveBattler, gHealthboxIDs[gActiveBattler], maxHP, 0, r7);
    }
    gBattleBankFunc[gActiveBattler] = bx_t3_healthbar_update;
}

void LinkPartnerHandleExpBarUpdate(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleStatusIconUpdate(void)
{
    if (mplay_80342A4(gActiveBattler) == 0)
    {
        sub_8045A5C(gHealthboxIDs[gActiveBattler], &gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], 9);
        ewram17810[gActiveBattler].unk0_4 = 0;
        gBattleBankFunc[gActiveBattler] = sub_811E38C;
    }
}

void LinkPartnerHandleStatusAnimation(void)
{
    if (mplay_80342A4(gActiveBattler) == 0)
    {
        move_anim_start_t2_for_situation(
          gBattleBufferA[gActiveBattler][1],
          gBattleBufferA[gActiveBattler][2]
          | (gBattleBufferA[gActiveBattler][3] << 8)
          | (gBattleBufferA[gActiveBattler][4] << 16)
          | (gBattleBufferA[gActiveBattler][5] << 24));
        gBattleBankFunc[gActiveBattler] = sub_811E38C;
    }
}

void LinkPartnerHandleStatusXor(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd29(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleDMATransfer(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd31(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd32(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd33(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd34(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd35(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd36(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd37(void)
{
    gUnknown_020238C8.unk0_0 = 0;
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd38(void)
{
    gUnknown_020238C8.unk0_0 = gBattleBufferA[gActiveBattler][1];
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd39(void)
{
    gUnknown_020238C8.unk0_7 = 0;
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd40(void)
{
    gUnknown_020238C8.unk0_7 ^= 1;
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleHitAnimation(void)
{
    if (gSprites[gBankSpriteIds[gActiveBattler]].invisible == TRUE)
    {
        LinkPartnerBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gBankSpriteIds[gActiveBattler]].data[1] = 0;
        sub_8047858(gActiveBattler);
        gBattleBankFunc[gActiveBattler] = bx_blink_t3;
    }
}

void LinkPartnerHandlecmd42(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleEffectivenessSound(void)
{
    s8 pan;

    if (GetBattlerSide(gActiveBattler) == 0)
        pan = -64;
    else
        pan = 63;
    PlaySE12WithPanning(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8), pan);
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd44(void)
{
    PlayFanfare(gBattleBufferA[gActiveBattler][1] | (gBattleBufferA[gActiveBattler][2] << 8));
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleFaintingCry(void)
{
    PlayCry3(
      GetMonData(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], MON_DATA_SPECIES),
      -25, 5);
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleIntroSlide(void)
{
    StartBattleIntroAnim(gBattleBufferA[gActiveBattler][1]);
    gUnknown_02024DE8 |= 1;
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleTrainerBallThrow(void)
{
    u8 r4;
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gBankSpriteIds[gActiveBattler]]);
    gSprites[gBankSpriteIds[gActiveBattler]].data[0] = 50;
    gSprites[gBankSpriteIds[gActiveBattler]].data[2] = -40;
    gSprites[gBankSpriteIds[gActiveBattler]].data[4] = gSprites[gBankSpriteIds[gActiveBattler]].pos1.y;
    gSprites[gBankSpriteIds[gActiveBattler]].callback = StartAnimLinearTranslation;
    gSprites[gBankSpriteIds[gActiveBattler]].data[5] = gActiveBattler;
    StoreSpriteCallbackInData(&gSprites[gBankSpriteIds[gActiveBattler]], sub_8030E38);
    StartSpriteAnim(&gSprites[gBankSpriteIds[gActiveBattler]], 1);
    r4 = AllocSpritePalette(0xD6F9);
    LoadCompressedPalette(
      gTrainerBackPicPaletteTable[gLinkPlayers[sub_803FC34(gActiveBattler)].gender].data,
      0x100 + r4 * 16, 0x20);
    gSprites[gBankSpriteIds[gActiveBattler]].oam.paletteNum = r4;
    taskId = CreateTask(sub_812071C, 5);
    gTasks[taskId].data[0] = gActiveBattler;
    if (ewram17810[gActiveBattler].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBattler]].func = sub_8044CA0;
    ewram17840.unk9_0 = 1;
    gBattleBankFunc[gActiveBattler] = nullsub_74;
}

void sub_812071C(u8 taskId)
{
    u8 r9;

    if (gTasks[taskId].data[1] < 24)
    {
        gTasks[taskId].data[1]++;
        return;
    }

    r9 = gActiveBattler;
    gActiveBattler = gTasks[taskId].data[0];
    if (!IsDoubleBattle() || (gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        gBattleBufferA[gActiveBattler][1] = gBattlerPartyIndexes[gActiveBattler];
        sub_811F864(gActiveBattler, 0);
    }
    else
    {
        gBattleBufferA[gActiveBattler][1] = gBattlerPartyIndexes[gActiveBattler];
        sub_811F864(gActiveBattler, 0);
        gActiveBattler ^= 2;
        gBattleBufferA[gActiveBattler][1] = gBattlerPartyIndexes[gActiveBattler];
        BattleLoadPlayerMonSprite(&gPlayerParty[gBattlerPartyIndexes[gActiveBattler]], gActiveBattler);
        sub_811F864(gActiveBattler, 0);
        gActiveBattler ^= 2;
    }
    gBattleBankFunc[gActiveBattler] = sub_811DCA0;
    gActiveBattler = r9;
    DestroyTask(taskId);
}

void LinkPartnerHandlecmd48(void)
{
    if (gBattleBufferA[gActiveBattler][1] != 0 && GetBattlerSide(gActiveBattler) == 0)
    {
        LinkPartnerBufferExecCompleted();
        return;
    }

    ewram17810[gActiveBattler].unk0_0 = 1;
    gUnknown_02024E68[gActiveBattler] = sub_8044804(
      gActiveBattler,
      (struct BattleInterfaceStruct2 *)&gBattleBufferA[gActiveBattler][4],
      gBattleBufferA[gActiveBattler][1],
      gBattleBufferA[gActiveBattler][2]);
    ewram17810[gActiveBattler].unk5 = 0;
    if (gBattleBufferA[gActiveBattler][2] != 0)
        ewram17810[gActiveBattler].unk5 = 0x5D;
    gBattleBankFunc[gActiveBattler] = sub_81208E0;
}

void sub_81208E0(void)
{
    if (ewram17810[gActiveBattler].unk5++ >= 93)
    {
        ewram17810[gActiveBattler].unk5 = 0;
        LinkPartnerBufferExecCompleted();
    }
}

void LinkPartnerHandlecmd49(void)
{
    if (ewram17810[gActiveBattler].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBattler]].func = sub_8044CA0;
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd50(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleSpriteInvisibility(void)
{
    if (IsBankSpritePresent(gActiveBattler) != 0)
    {
        gSprites[gBankSpriteIds[gActiveBattler]].invisible = gBattleBufferA[gActiveBattler][1];
        sub_8031F88(gActiveBattler);
    }
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleBattleAnimation(void)
{
    if (mplay_80342A4(gActiveBattler) == 0)
    {
        u8 r3 = gBattleBufferA[gActiveBattler][1];
        u16 r4 = gBattleBufferA[gActiveBattler][2] | (gBattleBufferA[gActiveBattler][3] << 8);

        if (move_anim_start_t3(gActiveBattler, gActiveBattler, gActiveBattler, r3, r4) != 0)
            LinkPartnerBufferExecCompleted();
        else
            gBattleBankFunc[gActiveBattler] = sub_811E3B8;
    }
}

void LinkPartnerHandleLinkStandbyMsg(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandleResetActionMoveSelection(void)
{
    LinkPartnerBufferExecCompleted();
}

void LinkPartnerHandlecmd55(void)
{
    gBattleOutcome = gBattleBufferA[gActiveBattler][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    LinkPartnerBufferExecCompleted();
    gBattleBankFunc[gActiveBattler] = sub_811E29C;
}

void LinkPartnerHandlecmd56(void)
{
}
