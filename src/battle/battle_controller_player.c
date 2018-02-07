#include "global.h"
#include "data2.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "item.h"
#include "constants/items.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu_cursor.h"
#include "constants/moves.h"
#include "palette.h"
#include "pokemon.h"
#include "rom3.h"
#include "constants/songs.h"
#include "sound.h"
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

#if ENGLISH
#define SUB_803037C_TILE_DATA_OFFSET 440
#elif GERMAN
#define SUB_803037C_TILE_DATA_OFFSET 444
#endif

extern u16 gBattle_BG0_X;
extern u16 gBattle_BG0_Y;

extern struct Window gUnknown_03004210;

extern void (*gBattleBankFunc[])(void);

extern u32 gOamMatrixAllocBitmap;
extern u8 gUnknown_020297ED;
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
extern u16 gAnimMovePower;
extern u32 gAnimMoveDmg;
extern u8 gAnimFriendship;
extern u16 gWeatherMoveAnim;
extern u32 gTransformedPersonalities[];
extern u8 gBattleMonForms[];
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E68[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern u8 gAnimMoveTurn;
extern u8 gUnknown_02038470[];
extern u16 gBattle_BG3_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG3_Y;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG0_X;
extern u16 gBattle_BG1_X;
extern u8 gUnknown_03004344;
extern u8 gUnknown_0300434C[];

extern const u8 BattleText_OtherMenu[];
extern const u8 BattleText_MenuOptions[];
extern const u8 BattleText_PP[];

extern void sub_802C68C(void);
extern void sub_802E1B0(void);
extern void sub_802E220();
extern void sub_802E2D4();
extern void sub_802E004(void);
extern void sub_802DF30(void);
extern void BattleStopLowHpSound(void);
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
extern void StartBattleIntroAnim();
extern void oamt_add_pos2_onto_pos1();
extern void sub_8078B34(struct Sprite *);
extern void StoreSpriteCallbackInData();
extern void BattleLoadPlayerMonSprite();
extern bool8 IsDoubleBattle(void);
extern void sub_802D500(void);
extern bool8 IsBankSpritePresent(u8);
extern bool8 move_anim_start_t3();
extern void sub_802E460(void);
extern void b_link_standby_message(void);
extern void sub_802D18C(void);
extern void sub_802DF18(void);
extern void BufferStringBattle();
extern void sub_80326EC();
extern void DoMoveAnim();
extern void sub_8031F24(void);
extern void sub_80324BC();
extern u8 sub_8031720();
extern void bx_wait_t1(void);
extern u8 GetBankByIdentity(u8);
extern void sub_802DE10(void);
extern void sub_80105EC(struct Sprite *);
extern void sub_802D274(void);
extern void sub_802D23C(void);
extern u8 GetBankIdentity(u8);
extern void LoadPlayerTrainerBankSprite();
extern void sub_80313A0(struct Sprite *);
extern void sub_802D204(void);
extern u8 sub_8079E90();
extern void sub_802DEAC(void);
extern void sub_80312F0(struct Sprite *);
extern u8 GetBankPosition();
extern u8 sub_8077F68();
extern u8 sub_8046400();
extern void sub_802D798(void);
extern void bx_0802E404(void);
extern u8 gActiveBank;
extern void (*gBattleBankFunc[])(void);
extern bool8 gDoingBattleAnim;
extern u16 gBattleTypeFlags;
extern u32 gBattleExecBuffer;
extern u8 gBattleBufferA[][0x200];
extern u8 gObjectBankIDs[];
extern u8 gActionSelectionCursor[];
extern u8 gMoveSelectionCursor[];
extern u8 gAbsentBankFlags;
extern u8 gUnknown_03004344;
extern u8 gNoOfAllBanks;
extern u16 gBattlePartyID[];
extern u16 gBattle_BG0_Y;
extern u16 gBattle_BG0_X;
extern struct Window gUnknown_03004210;
extern const u8 BattleText_SwitchWhich[];
extern u8 gUnknown_03004348;
extern struct BattlePokemon gBattleMons[];
extern MainCallback gPreBattleCallback1;
extern u8 gHealthboxIDs[];
extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gUnknown_0300434C[];
extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F5;
extern u8 gUnknown_02038470[];
extern u16 gSpecialVar_ItemId;
extern u8 gDisplayedStringBattle[];
extern const u8 BattleText_LinkStandby[];

extern void dp11b_obj_instanciate(u8, u8, s8, s8);
extern u8 GetBankIdentity(u8);
extern u8 GetBankByIdentity(u8);
extern void dp11b_obj_free(u8, u8);
extern void sub_8010520(struct Sprite *);
extern void sub_8010574(struct Sprite *);
extern bool8 IsDoubleBattle();
extern void sub_804777C();
extern void sub_8141828();
extern void sub_8094E20(u8);
extern void nullsub_14(void);
extern void sub_80A6DCC(void);
extern void ReshowBattleScreenAfterMenu(void);

void PlayerHandleGetAttributes(void);
void PlayerHandlecmd1(void);
void PlayerHandleSetAttributes(void);
void PlayerHandlecmd3(void);
void PlayerHandleLoadPokeSprite(void);
void PlayerHandleSendOutPoke(void);
void PlayerHandleReturnPokeToBall(void);
void PlayerHandleTrainerThrow(void);
void PlayerHandleTrainerSlide(void);
void PlayerHandleTrainerSlideBack(void);
void PlayerHandlecmd10(void);
void PlayerHandlecmd11(void);
void PlayerHandlecmd12(void);
void PlayerHandleBallThrow(void);
void PlayerHandlePuase(void);
void PlayerHandleMoveAnimation(void);
void PlayerHandlePrintString(void);
void PlayerHandlePrintStringPlayerOnly(void);
void PlayerHandlecmd18(void);
void PlayerHandlecmd19(void);
void PlayerHandlecmd20(void);
void PlayerHandleOpenBag(void);
void PlayerHandlecmd22(void);
void PlayerHandlecmd23(void);
void PlayerHandleHealthBarUpdate(void);
void PlayerHandleExpBarUpdate(void);
void PlayerHandleStatusIconUpdate(void);
void PlayerHandleStatusAnimation(void);
void PlayerHandleStatusXor(void);
void PlayerHandlecmd29(void);
void PlayerHandleDMATransfer(void);
void PlayerHandlecmd31(void);
void PlayerHandlecmd32(void);
void PlayerHandlecmd33(void);
void PlayerHandlecmd34(void);
void PlayerHandlecmd35(void);
void PlayerHandlecmd36(void);
void PlayerHandlecmd37(void);
void PlayerHandlecmd38(void);
void PlayerHandlecmd39(void);
void PlayerHandlecmd40(void);
void PlayerHandleHitAnimation(void);
void PlayerHandlecmd42(void);
void PlayerHandleEffectivenessSound(void);
void PlayerHandlecmd44(void);
void PlayerHandleFaintingCry(void);
void PlayerHandleIntroSlide(void);
void PlayerHandleTrainerBallThrow(void);
void PlayerHandlecmd48(void);
void PlayerHandlecmd49(void);
void PlayerHandlecmd50(void);
void PlayerHandleSpriteInvisibility(void);
void PlayerHandleBattleAnimation(void);
void PlayerHandleLinkStandbyMsg(void);
void PlayerHandleResetActionMoveSelection(void);
void PlayerHandlecmd55(void);
void PlayerHandlecmd56(void);

const u8 gString_TurnJP[] = _("ターン");

void (*const gPlayerBufferCommands[])(void) =
{
    PlayerHandleGetAttributes,
    PlayerHandlecmd1,
    PlayerHandleSetAttributes,
    PlayerHandlecmd3,
    PlayerHandleLoadPokeSprite,
    PlayerHandleSendOutPoke,
    PlayerHandleReturnPokeToBall,
    PlayerHandleTrainerThrow,
    PlayerHandleTrainerSlide,
    PlayerHandleTrainerSlideBack,
    PlayerHandlecmd10,
    PlayerHandlecmd11,
    PlayerHandlecmd12,
    PlayerHandleBallThrow,
    PlayerHandlePuase,
    PlayerHandleMoveAnimation,
    PlayerHandlePrintString,
    PlayerHandlePrintStringPlayerOnly,
    PlayerHandlecmd18,
    PlayerHandlecmd19,
    PlayerHandlecmd20,
    PlayerHandleOpenBag,
    PlayerHandlecmd22,
    PlayerHandlecmd23,
    PlayerHandleHealthBarUpdate,
    PlayerHandleExpBarUpdate,
    PlayerHandleStatusIconUpdate,
    PlayerHandleStatusAnimation,
    PlayerHandleStatusXor,
    PlayerHandlecmd29,
    PlayerHandleDMATransfer,
    PlayerHandlecmd31,
    PlayerHandlecmd32,
    PlayerHandlecmd33,
    PlayerHandlecmd34,
    PlayerHandlecmd35,
    PlayerHandlecmd36,
    PlayerHandlecmd37,
    PlayerHandlecmd38,
    PlayerHandlecmd39,
    PlayerHandlecmd40,
    PlayerHandleHitAnimation,
    PlayerHandlecmd42,
    PlayerHandleEffectivenessSound,
    PlayerHandlecmd44,
    PlayerHandleFaintingCry,
    PlayerHandleIntroSlide,
    PlayerHandleTrainerBallThrow,
    PlayerHandlecmd48,
    PlayerHandlecmd49,
    PlayerHandlecmd50,
    PlayerHandleSpriteInvisibility,
    PlayerHandleBattleAnimation,
    PlayerHandleLinkStandbyMsg,
    PlayerHandleResetActionMoveSelection,
    PlayerHandlecmd55,
    PlayerHandlecmd56,
};

void PlayerBufferRunCommand(void);
void sub_802C2EC(void);
void sub_802C68C(void);
void sub_802CA60(void);
void sub_802D730(void);
void sub_802DA9C(u8);
void sub_802DB6C(u8);
void sub_802DCB0(u8);
void sub_802DD10(u8);
void sub_802DDC4(u8);
void sub_802DF88(void);
void sub_802E03C(void);
void sub_802E12C(s32, const u8 *);
void sub_802E1B0(void);
void sub_802E220(void);
void sub_802E2D4(void);
void sub_802E3B4(u8, int);
void nullsub_7(u8);
void b_link_standby_message(void);
u32 dp01_getattr_by_ch1_for_player_pokemon_(u8, u8 *);
void dp01_setattr_by_ch1_for_player_pokemon(u8);
void sub_802F934(u8, u8);
void sub_802FB2C(void);
void sub_8030190(void);
void sub_80304A8(void);
void sub_8030E38(struct Sprite *);
void task05_08033660(u8);
void sub_8031064(void);

void nullsub_91(void)
{
}

void SetBankFuncToPlayerBufferRunCommand(void)
{
    gBattleBankFunc[gActiveBank] = PlayerBufferRunCommand;
    gDoingBattleAnim = FALSE;
}

void PlayerBufferExecCompleted(void)
{
    gBattleBankFunc[gActiveBank] = PlayerBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(2, 4, &playerId);
        gBattleBufferA[gActiveBank][0] = 0x38;
    }
    else
    {
        gBattleExecBuffer &= ~gBitTable[gActiveBank];
    }
}

void PlayerBufferRunCommand(void)
{
    if (gBattleExecBuffer & gBitTable[gActiveBank])
    {
        if (gBattleBufferA[gActiveBank][0] < 0x39)
            gPlayerBufferCommands[gBattleBufferA[gActiveBank][0]]();
        else
            PlayerBufferExecCompleted();
    }
}

void bx_0802E404(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].pos2.x == 0)
        PlayerBufferExecCompleted();
}

void sub_802C098(void)
{
    u16 itemId = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);

    dp11b_obj_instanciate(gActiveBank, 1, 7, 1);
    dp11b_obj_instanciate(gActiveBank, 0, 7, 1);
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        DestroyMenuCursor();

        // Useless switch statement.
        switch (gActionSelectionCursor[gActiveBank])
        {
        case 0:
            Emitcmd33(1, 0, 0);
            break;
        case 1:
            Emitcmd33(1, 1, 0);
            break;
        case 2:
            Emitcmd33(1, 2, 0);
            break;
        case 3:
            Emitcmd33(1, 3, 0);
            break;
        }
        PlayerBufferExecCompleted();
    }
    else if (gMain.newKeys & DPAD_LEFT)
    {
        if (gActionSelectionCursor[gActiveBank] & 1)
        {
            PlaySE(SE_SELECT);
            nullsub_8(gActionSelectionCursor[gActiveBank]);
            gActionSelectionCursor[gActiveBank] ^= 1;
            sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
        }
    }
    else if (gMain.newKeys & DPAD_RIGHT)
    {
        if (!(gActionSelectionCursor[gActiveBank] & 1))
        {
            PlaySE(SE_SELECT);
            nullsub_8(gActionSelectionCursor[gActiveBank]);
            gActionSelectionCursor[gActiveBank] ^= 1;
            sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
        }
    }
    else if (gMain.newKeys & DPAD_UP)
    {
        if (gActionSelectionCursor[gActiveBank] & 2)
        {
            PlaySE(SE_SELECT);
            nullsub_8(gActionSelectionCursor[gActiveBank]);
            gActionSelectionCursor[gActiveBank] ^= 2;
            sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
        }
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        if (!(gActionSelectionCursor[gActiveBank] & 2))
        {
            PlaySE(SE_SELECT);
            nullsub_8(gActionSelectionCursor[gActiveBank]);
            gActionSelectionCursor[gActiveBank] ^= 2;
            sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
         && GetBankIdentity(gActiveBank) == 2
         && !(gAbsentBankFlags & gBitTable[GetBankByIdentity(0)])
         && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (gBattleBufferA[gActiveBank][1] == 1)
            {
                // Add item to bag if it is a ball
                if (itemId <= ITEM_PREMIER_BALL)
                    AddBagItem(itemId, 1);
                else
                    return;
            }
            PlaySE(SE_SELECT);
            Emitcmd33(1, 12, 0);
            PlayerBufferExecCompleted();
            DestroyMenuCursor();
        }
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        sub_804454C();
    }
}

void unref_sub_802C2B8(void)
{
    dp11b_obj_free(gActiveBank, 1);
    dp11b_obj_free(gActiveBank, 0);
    gBattleBankFunc[gActiveBank] = sub_802C2EC;
}

// TODO: fix this function
void sub_802C2EC(void)
{
    u8 arr[4] = {0, 2, 3, 1};
    s32 i;

    dp11b_obj_instanciate(gUnknown_03004344, 1, 15, 1);
    i = 0;
    if (gNoOfAllBanks != 0)
    {
        do
        {
            if (i != gUnknown_03004344)
                dp11b_obj_free(i, 1);
            i++;
        } while (i < gNoOfAllBanks);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        DestroyMenuCursor();
        PlaySE(SE_SELECT);
        gSprites[gObjectBankIDs[gUnknown_03004344]].callback = sub_8010574;
        Emitcmd33(1, 10, gMoveSelectionCursor[gActiveBank] | (gUnknown_03004344 << 8));
        dp11b_obj_free(gUnknown_03004344, 1);
        PlayerBufferExecCompleted();
    }
    //_0802C3A8
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        gSprites[gObjectBankIDs[gUnknown_03004344]].callback = sub_8010574;
        gBattleBankFunc[gActiveBank] = sub_802C68C;
        dp11b_obj_instanciate(gActiveBank, 1, 7, 1);
        dp11b_obj_instanciate(gActiveBank, 0, 7, 1);
        dp11b_obj_free(gUnknown_03004344, 1);
    }
    else if (gMain.newKeys & 0x60)
    {
        PlaySE(SE_SELECT);
        gSprites[gObjectBankIDs[gUnknown_03004344]].callback = sub_8010574;
        do
        {
            u8 var = GetBankIdentity(gUnknown_03004344);

            for (i = 0; i < 4; i++)
            {
                if (var == arr[i])
                    break;
            }
            do
            {
                i--;
                if (i < 0)
                    i = 3;
                gUnknown_03004344 = GetBankByIdentity(arr[i]);
            } while(gUnknown_03004344 == gNoOfAllBanks);
            i = 0;
            switch (GetBankIdentity(gUnknown_03004344))
            {
            case 0:
            case 2:
                if (gActiveBank == gUnknown_03004344)
                {
                    u32 moveId;

                    asm("":::"memory");
                    moveId = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MOVE1 + gMoveSelectionCursor[gActiveBank]);
                    if (!(gBattleMoves[moveId].target & 2))
                        break;
                }
                i++;
                break;
            case 1:
            case 3:
                i++;
            }
            //_0802C500
            if (gAbsentBankFlags & gBitTable[gUnknown_03004344])
                i = 0;
        } while (i == 0);
        gSprites[gObjectBankIDs[gUnknown_03004344]].callback = sub_8010520;
    }
    //_0802C540
    else if (gMain.newKeys & 0x90)
    {
        PlaySE(SE_SELECT);
        gSprites[gObjectBankIDs[gUnknown_03004344]].callback = sub_8010574;
        do
        {
            u8 var = GetBankIdentity(gUnknown_03004344);

            for (i = 0; i < 4; i++)
            {
                if (var == arr[i])
                    break;
            }
            do
            {
                i++;
                if (i > 3)
                    i = 0;
                gUnknown_03004344 = GetBankByIdentity(arr[i]);
            } while (gUnknown_03004344 == gNoOfAllBanks);
            i = 0;
            switch (GetBankIdentity(gUnknown_03004344))
            {
            case 0:
            case 2:
                if (gActiveBank == gUnknown_03004344)
                {
                    u32 moveId;

                    asm("":::"memory");
                    moveId = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MOVE1 + gMoveSelectionCursor[gActiveBank]);
                    if (!(gBattleMoves[moveId].target & 2))
                        break;
                }
                i++;
                break;
            case 1:
            case 3:
                i++;
            }
            if (gAbsentBankFlags & gBitTable[gUnknown_03004344])
                i = 0;
        } while (i == 0);
        gSprites[gObjectBankIDs[gUnknown_03004344]].callback = sub_8010520;
    }
}

struct ChooseMoveStruct
{
    u16 moves[4];
    u8 pp[4];
    u8 unkC[0x12-0xC];
    u8 unk12;
    u8 unk13;
    u8 filler14[0x20-0x14];
};

const u8 gUnknown_081FAE80[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW WHITE LIGHT_BLUE WHITE2}");

void debug_sub_8030C24(void);

void sub_802C68C(void)
{
    u32 r8 = 0;
#if DEBUG
    u8 count = 0;
#endif
    struct ChooseMoveStruct *r6 = (struct ChooseMoveStruct *)(gBattleBufferA[gActiveBank] + 4);

    if (gMain.newKeys & A_BUTTON)
    {
        u32 r4;

        PlaySE(SE_SELECT);

        if (r6->moves[gMoveSelectionCursor[gActiveBank]] == MOVE_CURSE)
            r4 = (r6->unk12 != TYPE_GHOST && (r6->unk13 ^ 7)) ? 0x10 : 0;
        else
            r4 = gBattleMoves[r6->moves[gMoveSelectionCursor[gActiveBank]]].target;

        if (r4 & 0x10)
            gUnknown_03004344 = gActiveBank;
        else
            gUnknown_03004344 = GetBankByIdentity((GetBankIdentity(gActiveBank) & 1) ^ 1);

        if (gBattleBufferA[gActiveBank][1] == 0)
        {
            if ((r4 & 2) && gBattleBufferA[gActiveBank][2] == 0)
                r8++;
        }
        else
        {
            if (!(r4 & 0x7D))
                r8++;
            if (r6->pp[gMoveSelectionCursor[gActiveBank]] == 0)
            {
                r8 = 0;
            }
            else if (!(r4 & 0x12) && CountAliveMons(0) <= 1)
            {
                gUnknown_03004344 = sub_803C434(gActiveBank);
                r8 = 0;
            }
        }
        if (r8 == 0)
        {
            DestroyMenuCursor();
            Emitcmd33(1, 10, gMoveSelectionCursor[gActiveBank] | (gUnknown_03004344 << 8));
            PlayerBufferExecCompleted();
        }
        else
        {
            gBattleBankFunc[gActiveBank] = sub_802C2EC;
            if (r4 & 0x12)
                gUnknown_03004344 = gActiveBank;
            else if (gAbsentBankFlags & gBitTable[GetBankByIdentity(1)])
                gUnknown_03004344 = GetBankByIdentity(3);
            else
                gUnknown_03004344 = GetBankByIdentity(1);
            gSprites[gObjectBankIDs[gUnknown_03004344]].callback = sub_8010520;
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        DestroyMenuCursor();
        PlaySE(SE_SELECT);
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 320;
        Emitcmd33(1, 10, 0xFFFF);
        PlayerBufferExecCompleted();
    }
    else if (gMain.newKeys & DPAD_LEFT)
    {
        if (gMoveSelectionCursor[gActiveBank] & 1)
        {
            nullsub_7(gMoveSelectionCursor[gActiveBank]);
            gMoveSelectionCursor[gActiveBank] ^= 1;
            PlaySE(SE_SELECT);
            sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
            sub_802E220();
            sub_802E2D4();
        }
    }
    else if (gMain.newKeys & DPAD_RIGHT)
    {
        if (!(gMoveSelectionCursor[gActiveBank] & 1)
         && (gMoveSelectionCursor[gActiveBank] ^ 1) < gUnknown_03004348)
        {
            nullsub_7(gMoveSelectionCursor[gActiveBank]);
            gMoveSelectionCursor[gActiveBank] ^= 1;
            PlaySE(SE_SELECT);
            sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
            sub_802E220();
            sub_802E2D4();
        }
    }
    else if (gMain.newKeys & DPAD_UP)
    {
        if (gMoveSelectionCursor[gActiveBank] & 2)
        {
            nullsub_7(gMoveSelectionCursor[gActiveBank]);
            gMoveSelectionCursor[gActiveBank] ^= 2;
            PlaySE(SE_SELECT);
            sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
            sub_802E220();
            sub_802E2D4();
        }
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        if (!(gMoveSelectionCursor[gActiveBank] & 2)
         && (gMoveSelectionCursor[gActiveBank] ^ 2) < gUnknown_03004348)
        {
            nullsub_7(gMoveSelectionCursor[gActiveBank]);
            gMoveSelectionCursor[gActiveBank] ^= 2;
            PlaySE(SE_SELECT);
            sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
            sub_802E220();
            sub_802E2D4();
        }
    }
    else if (gMain.newKeys & SELECT_BUTTON)
    {
        if (gUnknown_03004348 > 1 && !(gBattleTypeFlags & BATTLE_TYPE_LINK))
        {
            sub_802E12C(gMoveSelectionCursor[gActiveBank], gUnknown_081FAE80);
            if (gMoveSelectionCursor[gActiveBank] != 0)
                gUnknown_03004344 = 0;
            else
                gUnknown_03004344 = gMoveSelectionCursor[gActiveBank] + 1;
            sub_802E3B4(gUnknown_03004344, 27);
            Text_FillWindowRect(&gUnknown_03004210, 0x1016, 0x17, 0x37, 0x1C, 0x3A);
            Text_InitWindow(&gUnknown_03004210, BattleText_SwitchWhich, 0x290, 0x17, 0x37);
            Text_PrintWindow8002F44(&gUnknown_03004210);
            gBattleBankFunc[gActiveBank] = sub_802CA60;
        }
    }
#if DEBUG
    else if (gUnknown_020297ED == 1 && (gMain.newKeys & START_BUTTON))
    {
	const u8 *moveName;
	s32 i;
	
	Text_FillWindowRect(&gUnknown_03004210, 0x1016, 1, 0x37, 16, 0x3A);
	moveName = gMoveNames[GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MOVE1)];
	Text_InitWindowAndPrintText(&gUnknown_03004210, moveName, 0x100, 2, 0x37);
	ConvertIntToDecimalStringN(
	  gDisplayedStringBattle,
	  GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MOVE1),
	  2, 3);
	Text_InitWindowAndPrintText(&gUnknown_03004210, gDisplayedStringBattle, 0x110, 10, 0x37);
	Text_InitWindowAndPrintText(&gUnknown_03004210, gString_TurnJP, 0x116, 1, 0x39);
	ConvertIntToDecimalStringN(gDisplayedStringBattle, gAnimMoveTurn, 2, 3);
	Text_InitWindowAndPrintText(&gUnknown_03004210, gDisplayedStringBattle, 0x11C, 4, 0x39);
	for (i = 0; i < 64; i++)
	{
	    if (gSprites[i].inUse)
		count++;
	}
	ConvertIntToDecimalStringN(gDisplayedStringBattle, count, 2, 2);
	Text_InitWindowAndPrintText(&gUnknown_03004210, gDisplayedStringBattle, 0x122, 8, 0x39);
	count = GetTaskCount();
	ConvertIntToDecimalStringN(gDisplayedStringBattle, count, 2, 2);
	Text_InitWindowAndPrintText(&gUnknown_03004210, gDisplayedStringBattle, 0x126, 11, 0x39);
	for (i = 0, count = 0; i < 32; i++)
	{
	    if (gOamMatrixAllocBitmap & (1 << i))
		count++;
	}
	ConvertIntToDecimalStringN(gDisplayedStringBattle, count, 2, 2);
	Text_InitWindowAndPrintText(&gUnknown_03004210, gDisplayedStringBattle, 0x12A, 14, 0x39);
	gBattleBankFunc[gActiveBank] = debug_sub_8030C24;
    }
#endif
}

extern const u8 BattleText_Format[];

void sub_802CA60(void)
{
    u8 perMovePPBonuses[4];
    struct
    {
        u16 moves[4];
        u8 pp[4];
        u8 filler18[8];  // what is this?
    } sp0;
    //struct ChooseMoveStruct sp0;
    u8 totalPPBonuses;

    if (gMain.newKeys & (A_BUTTON | SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);
        if (gMoveSelectionCursor[gActiveBank] != gUnknown_03004344)
        {
            struct ChooseMoveStruct *r9 = (struct ChooseMoveStruct *)&gBattleBufferA[gActiveBank][4];
            s32 i;

            i = r9->moves[gMoveSelectionCursor[gActiveBank]];
            r9->moves[gMoveSelectionCursor[gActiveBank]] = r9->moves[gUnknown_03004344];
            r9->moves[gUnknown_03004344] = i;

            i = r9->pp[gMoveSelectionCursor[gActiveBank]];
            r9->pp[gMoveSelectionCursor[gActiveBank]] = r9->pp[gUnknown_03004344];
            r9->pp[gUnknown_03004344] = i;

            i = r9->unkC[gMoveSelectionCursor[gActiveBank]];
            r9->unkC[gMoveSelectionCursor[gActiveBank]] = r9->unkC[gUnknown_03004344];
            r9->unkC[gUnknown_03004344] = i;

            if (gDisableStructs[gActiveBank].unk18_b & gBitTable[gMoveSelectionCursor[gActiveBank]])
            {
                gDisableStructs[gActiveBank].unk18_b &= ~gBitTable[gMoveSelectionCursor[gActiveBank]];
                gDisableStructs[gActiveBank].unk18_b |= gBitTable[gUnknown_03004344];
            }

            sub_802E1B0();

            for (i = 0; i < 4; i++)
                perMovePPBonuses[i] = (gBattleMons[gActiveBank].ppBonuses & (3 << (i * 2))) >> (i * 2);
            totalPPBonuses = perMovePPBonuses[gMoveSelectionCursor[gActiveBank]];
            perMovePPBonuses[gMoveSelectionCursor[gActiveBank]] = perMovePPBonuses[gUnknown_03004344];
            perMovePPBonuses[gUnknown_03004344] = totalPPBonuses;

            totalPPBonuses = 0;
            for (i = 0; i < 4; i++)
                totalPPBonuses |= perMovePPBonuses[i] << (i * 2);
            gBattleMons[gActiveBank].ppBonuses = totalPPBonuses;

            for (i = 0; i < 4; i++)
            {
                gBattleMons[gActiveBank].moves[i] = r9->moves[i];
                gBattleMons[gActiveBank].pp[i] = r9->pp[i];
            }
            if (!(gBattleMons[gActiveBank].status2 & 0x200000))
            {
                for (i = 0; i < 4; i++)
                {
                    sp0.moves[i] = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MOVE1 + i);
                    sp0.pp[i] = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_PP1 + i);
                }

                totalPPBonuses = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_PP_BONUSES);
                for (i = 0; i < 4; i++)
                    perMovePPBonuses[i] = (totalPPBonuses & (3 << (i * 2))) >> (i * 2);

                i = sp0.moves[gMoveSelectionCursor[gActiveBank]];
                sp0.moves[gMoveSelectionCursor[gActiveBank]] = sp0.moves[gUnknown_03004344];
                sp0.moves[gUnknown_03004344] = i;

                i = sp0.pp[gMoveSelectionCursor[gActiveBank]];
                sp0.pp[gMoveSelectionCursor[gActiveBank]] = sp0.pp[gUnknown_03004344];
                sp0.pp[gUnknown_03004344] = i;

                totalPPBonuses = perMovePPBonuses[gMoveSelectionCursor[gActiveBank]];
                perMovePPBonuses[gMoveSelectionCursor[gActiveBank]] = perMovePPBonuses[gUnknown_03004344];
                perMovePPBonuses[gUnknown_03004344] = totalPPBonuses;

                totalPPBonuses = 0;
                for (i = 0; i < 4; i++)
                    totalPPBonuses |= perMovePPBonuses[i] << (i * 2);

                for (i = 0; i < 4; i++)
                {
                    SetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MOVE1 + i, &sp0.moves[i]);
                    SetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_PP1 + i, &sp0.pp[i]);
                }
                SetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_PP_BONUSES, &totalPPBonuses);
            }
        }
        else
        {
            sub_802E12C(gUnknown_03004344, BattleText_Format);
        }
        gBattleBankFunc[gActiveBank] = sub_802C68C;
        gMoveSelectionCursor[gActiveBank] = gUnknown_03004344;
        sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
        Text_FillWindowRect(&gUnknown_03004210, 0x1016, 0x17, 0x37, 0x1C, 0x3A);
        Text_InitWindow(&gUnknown_03004210, BattleText_PP, 0x290, 0x17, 0x37);
        Text_PrintWindow8002F44(&gUnknown_03004210);
        sub_802E220();
        sub_802E2D4();
    }
    if (gMain.newKeys & (B_BUTTON | SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);
        nullsub_7(gUnknown_03004344);
        sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
        sub_802E12C(gMoveSelectionCursor[gActiveBank], BattleText_Format);
        gBattleBankFunc[gActiveBank] = sub_802C68C;
        Text_FillWindowRect(&gUnknown_03004210, 0x1016, 0x17, 0x37, 0x1C, 0x3A);
        Text_InitWindow(&gUnknown_03004210, BattleText_PP, 0x290, 0x17, 0x37);
        Text_PrintWindow8002F44(&gUnknown_03004210);
        sub_802E220();
        sub_802E2D4();
    }
    if ((gMain.newKeys & DPAD_LEFT) && (gUnknown_03004344 & 1))
    {
        if (gUnknown_03004344 == gMoveSelectionCursor[gActiveBank])
            sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0x1D);
        else
            nullsub_7(gUnknown_03004344);
        gUnknown_03004344 ^= 1;
        PlaySE(SE_SELECT);
        if (gUnknown_03004344 == gMoveSelectionCursor[gActiveBank])
            sub_802E3B4(gUnknown_03004344, 0);
        else
            sub_802E3B4(gUnknown_03004344, 0x1B);
    }
    if ((gMain.newKeys & DPAD_RIGHT) && !(gUnknown_03004344 & 1) && (gUnknown_03004344 ^ 1) < gUnknown_03004348)
    {
        if (gUnknown_03004344 == gMoveSelectionCursor[gActiveBank])
            sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0x1D);
        else
            nullsub_7(gUnknown_03004344);
        gUnknown_03004344 ^= 1;
        PlaySE(SE_SELECT);
        if (gUnknown_03004344 == gMoveSelectionCursor[gActiveBank])
            sub_802E3B4(gUnknown_03004344, 0);
        else
            sub_802E3B4(gUnknown_03004344, 0x1B);
    }
    if ((gMain.newKeys & DPAD_UP) && (gUnknown_03004344 & 2))
    {
        if (gUnknown_03004344 == gMoveSelectionCursor[gActiveBank])
            sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0x1D);
        else
            nullsub_7(gUnknown_03004344);
        gUnknown_03004344 ^= 2;
        PlaySE(SE_SELECT);
        if (gUnknown_03004344 == gMoveSelectionCursor[gActiveBank])
            sub_802E3B4(gUnknown_03004344, 0);
        else
            sub_802E3B4(gUnknown_03004344, 0x1B);
    }
    if ((gMain.newKeys & DPAD_DOWN) && !(gUnknown_03004344 & 2) && (gUnknown_03004344 ^ 2) < gUnknown_03004348)
    {
        if (gUnknown_03004344 == gMoveSelectionCursor[gActiveBank])
            sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0x1D);
        else
            nullsub_7(gUnknown_03004344);
        gUnknown_03004344 ^= 2;
        PlaySE(SE_SELECT);
        if (gUnknown_03004344 == gMoveSelectionCursor[gActiveBank])
            sub_802E3B4(gUnknown_03004344, 0);
        else
            sub_802E3B4(gUnknown_03004344, 0x1B);
    }
}

void sub_802D148(void)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        m4aSongNumStop(SE_HINSI);
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(c2_8011A1C);
    }
}

void sub_802D18C(void)
{
    if (!gPaletteFade.active)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            sub_800832C();
            gBattleBankFunc[gActiveBank] = sub_802D148;
        }
        else
        {
            m4aSongNumStop(SE_HINSI);
            gMain.inBattle = FALSE;
            gMain.callback1 = gPreBattleCallback1;
            SetMainCallback2(gMain.savedCallback);
        }
    }
}

#if DEBUG
__attribute__((naked))
void debug_sub_8030C24(void)
{
    asm("\
	push	{r4, r5, r6, lr}\n\
	add	sp, sp, #0xfffffff4\n\
	ldr	r1, ._293       @ gBattlePartyID\n\
	ldr	r4, ._293 + 4   @ gActiveBank\n\
	ldrb	r0, [r4]\n\
	lsl	r0, r0, #0x1\n\
	add	r0, r0, r1\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x64\n\
	mul	r0, r0, r1\n\
	ldr	r1, ._293 + 8   @ gPlayerParty\n\
	add	r0, r0, r1\n\
	mov	r1, #0xd\n\
	bl	GetMonData\n\
	add	r1, sp, #0x8\n\
	strh	r0, [r1]\n\
	ldr	r5, ._293 + 12  @ gMain\n\
	ldrh	r1, [r5, #0x30]\n\
	cmp	r1, #0x20\n\
	bne	._286	@cond_branch\n\
	b	._287\n\
._286:\n\
	cmp	r1, #0x20\n\
	bgt	._288	@cond_branch\n\
	cmp	r1, #0x8\n\
	beq	._289	@cond_branch\n\
	cmp	r1, #0x8\n\
	bgt	._290	@cond_branch\n\
	cmp	r1, #0x4\n\
	beq	._291	@cond_branch\n\
	b	._348\n\
._294:\n\
	.align	2, 0\n\
._293:\n\
	.word	gBattlePartyID\n\
	.word	gActiveBank\n\
	.word	gPlayerParty\n\
	.word	gMain\n\
._290:\n\
	cmp	r1, #0x10\n\
	bne	._295	@cond_branch\n\
	b	._296\n\
._295:\n\
	b	._348\n\
._288:\n\
	cmp	r1, #0x80\n\
	bne	._298	@cond_branch\n\
	b	._302\n\
._298:\n\
	cmp	r1, #0x80\n\
	bgt	._300	@cond_branch\n\
	cmp	r1, #0x40\n\
	bne	._301	@cond_branch\n\
	b	._302\n\
._301:\n\
	b	._348\n\
._300:\n\
	mov	r0, #0x80\n\
	lsl	r0, r0, #0x1\n\
	cmp	r1, r0\n\
	bne	._304	@cond_branch\n\
	b	._305\n\
._304:\n\
	mov	r0, #0x80\n\
	lsl	r0, r0, #0x2\n\
	cmp	r1, r0\n\
	bne	._306	@cond_branch\n\
	b	._307\n\
._306:\n\
	b	._348\n\
._289:\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x1\n\
	bl	dp11b_obj_free\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x0\n\
	bl	dp11b_obj_free\n\
	ldr	r0, ._312       @ gBankAttacker\n\
	ldrb	r2, [r4]\n\
	strb	r2, [r0]\n\
	ldrh	r1, [r5, #0x28]\n\
	mov	r0, #0x2\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._310	@cond_branch\n\
	ldr	r0, ._312 + 4   @ gBattleTypeFlags\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._310	@cond_branch\n\
	ldr	r0, ._312 + 8   @ gBankTarget\n\
	mov	r1, #0x2\n\
	eor	r1, r1, r2\n\
	strb	r1, [r0]\n\
	b	._311\n\
._313:\n\
	.align	2, 0\n\
._312:\n\
	.word	gBankAttacker\n\
	.word	gBattleTypeFlags\n\
	.word	gBankTarget\n\
._310:\n\
	ldr	r0, ._317       @ gMain\n\
	ldrh	r1, [r0, #0x28]\n\
	mov	r2, #0x1\n\
	add	r0, r2, #0\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._315	@cond_branch\n\
	ldr	r0, ._317 + 4   @ gBattleTypeFlags\n\
	ldrh	r1, [r0]\n\
	add	r0, r2, #0\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._315	@cond_branch\n\
	mov	r0, #0x3\n\
	b	._316\n\
._318:\n\
	.align	2, 0\n\
._317:\n\
	.word	gMain\n\
	.word	gBattleTypeFlags\n\
._315:\n\
	mov	r0, #0x1\n\
._316:\n\
	bl	GetBankByIdentity\n\
	ldr	r1, ._320       @ gBankTarget\n\
	strb	r0, [r1]\n\
._311:\n\
	mov	r0, #0x0\n\
	bl	sub_80326EC\n\
	add	r0, sp, #0x8\n\
	ldrh	r0, [r0]\n\
	bl	DoMoveAnim\n\
	ldr	r1, ._320 + 4   @ gBattleBankFunc\n\
	ldr	r0, ._320 + 8   @ gActiveBank\n\
	ldrb	r0, [r0]\n\
	b	._332\n\
._321:\n\
	.align	2, 0\n\
._320:\n\
	.word	gBankTarget\n\
	.word	gBattleBankFunc\n\
	.word	gActiveBank\n\
._291:\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x1\n\
	bl	dp11b_obj_free\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x0\n\
	bl	dp11b_obj_free\n\
	ldr	r0, ._325       @ gBankTarget\n\
	ldrb	r2, [r4]\n\
	strb	r2, [r0]\n\
	ldrh	r1, [r5, #0x28]\n\
	mov	r0, #0x2\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._323	@cond_branch\n\
	ldr	r0, ._325 + 4   @ gBattleTypeFlags\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._323	@cond_branch\n\
	ldr	r0, ._325 + 8   @ gBankAttacker\n\
	mov	r1, #0x2\n\
	eor	r1, r1, r2\n\
	strb	r1, [r0]\n\
	b	._324\n\
._326:\n\
	.align	2, 0\n\
._325:\n\
	.word	gBankTarget\n\
	.word	gBattleTypeFlags\n\
	.word	gBankAttacker\n\
._323:\n\
	ldr	r0, ._330       @ gMain\n\
	ldrh	r1, [r0, #0x28]\n\
	mov	r2, #0x1\n\
	add	r0, r2, #0\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._328	@cond_branch\n\
	ldr	r0, ._330 + 4   @ gBattleTypeFlags\n\
	ldrh	r1, [r0]\n\
	add	r0, r2, #0\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._328	@cond_branch\n\
	mov	r0, #0x3\n\
	b	._329\n\
._331:\n\
	.align	2, 0\n\
._330:\n\
	.word	gMain\n\
	.word	gBattleTypeFlags\n\
._328:\n\
	mov	r0, #0x1\n\
._329:\n\
	bl	GetBankByIdentity\n\
	ldr	r1, ._333       @ gBankAttacker\n\
	strb	r0, [r1]\n\
._324:\n\
	mov	r0, #0x0\n\
	bl	sub_80326EC\n\
	add	r0, sp, #0x8\n\
	ldrh	r0, [r0]\n\
	bl	DoMoveAnim\n\
	ldr	r1, ._333 + 4   @ gBattleBankFunc\n\
	ldr	r0, ._333 + 8   @ gActiveBank\n\
	ldrb	r0, [r0]\n\
	b	._332\n\
._334:\n\
	.align	2, 0\n\
._333:\n\
	.word	gBankAttacker\n\
	.word	gBattleBankFunc\n\
	.word	gActiveBank\n\
._305:\n\
	ldrh	r1, [r5, #0x28]\n\
	mov	r0, #0x2\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._336	@cond_branch\n\
	ldr	r0, ._338       @ gBattleTypeFlags\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._336	@cond_branch\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x1\n\
	bl	dp11b_obj_free\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x0\n\
	bl	dp11b_obj_free\n\
	mov	r0, #0x3\n\
	bl	GetBankByIdentity\n\
	ldr	r1, ._338 + 4   @ gBankAttacker\n\
	strb	r0, [r1]\n\
	mov	r0, #0x1\n\
	b	._337\n\
._339:\n\
	.align	2, 0\n\
._338:\n\
	.word	gBattleTypeFlags\n\
	.word	gBankAttacker\n\
._336:\n\
	add	r0, sp, #0x8\n\
	mov	r1, #0x0\n\
	ldsh	r0, [r0, r1]\n\
	add	r0, r0, #0x9\n\
	add	r1, sp, #0x8\n\
	strh	r0, [r1]\n\
._296:\n\
	add	r0, sp, #0x8\n\
	mov	r2, #0x0\n\
	ldsh	r0, [r0, r2]\n\
	add	r0, r0, #0x1\n\
	lsl	r2, r0, #0x10\n\
	add	r1, sp, #0x8\n\
	strh	r0, [r1]\n\
	mov	r0, #0xb1\n\
	lsl	r0, r0, #0x11\n\
	cmp	r2, r0\n\
	ble	._347	@cond_branch\n\
	mov	r1, #0x1\n\
	add	r0, sp, #0x8\n\
	strh	r1, [r0]\n\
	b	._347\n\
._307:\n\
	ldrh	r1, [r5, #0x28]\n\
	mov	r0, #0x2\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._343	@cond_branch\n\
	ldr	r0, ._345       @ gBattleTypeFlags\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x1\n\
	and	r0, r0, r1\n\
	cmp	r0, #0\n\
	beq	._343	@cond_branch\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x1\n\
	bl	dp11b_obj_free\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x0\n\
	bl	dp11b_obj_free\n\
	mov	r0, #0x1\n\
	bl	GetBankByIdentity\n\
	ldr	r1, ._345 + 4   @ gBankAttacker\n\
	strb	r0, [r1]\n\
	mov	r0, #0x3\n\
._337:\n\
	bl	GetBankByIdentity\n\
	ldr	r1, ._345 + 8   @ gBankTarget\n\
	strb	r0, [r1]\n\
	mov	r0, #0x0\n\
	bl	sub_80326EC\n\
	add	r0, sp, #0x8\n\
	ldrh	r0, [r0]\n\
	bl	DoMoveAnim\n\
	ldr	r1, ._345 + 12  @ gBattleBankFunc\n\
	ldrb	r0, [r4]\n\
._332:\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldr	r1, ._345 + 16  @ debug_sub_803107C\n\
	str	r1, [r0]\n\
	b	._348\n\
._346:\n\
	.align	2, 0\n\
._345:\n\
	.word	gBattleTypeFlags\n\
	.word	gBankAttacker\n\
	.word	gBankTarget\n\
	.word	gBattleBankFunc\n\
	.word	debug_sub_803107C+1\n\
._343:\n\
	add	r1, sp, #0x8\n\
	add	r0, r1, #0\n\
	ldrh	r0, [r0]\n\
	sub	r0, r0, #0x9\n\
	strh	r0, [r1]\n\
._287:\n\
	add	r1, sp, #0x8\n\
	add	r0, r1, #0\n\
	ldrh	r0, [r0]\n\
	sub	r0, r0, #0x1\n\
	strh	r0, [r1]\n\
	lsl	r0, r0, #0x10\n\
	cmp	r0, #0\n\
	bgt	._347	@cond_branch\n\
	mov	r2, #0xb1\n\
	lsl	r2, r2, #0x1\n\
	add	r0, r2, #0\n\
	strh	r0, [r1]\n\
._347:\n\
	ldr	r1, ._349       @ gBattlePartyID\n\
	ldr	r4, ._349 + 4   @ gActiveBank\n\
	ldrb	r0, [r4]\n\
	lsl	r0, r0, #0x1\n\
	add	r0, r0, r1\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x64\n\
	mul	r0, r0, r1\n\
	ldr	r1, ._349 + 8   @ gPlayerParty\n\
	add	r0, r0, r1\n\
	mov	r1, #0xd\n\
	add	r2, sp, #0x8\n\
	bl	SetMonData\n\
	ldr	r2, ._349 + 12  @ gBattleMons\n\
	ldrb	r1, [r4]\n\
	mov	r0, #0x58\n\
	mul	r0, r0, r1\n\
	add	r0, r0, r2\n\
	add	r1, sp, #0x8\n\
	ldrh	r1, [r1]\n\
	strh	r1, [r0, #0xc]\n\
	ldr	r5, ._349 + 16  @ gUnknown_03004210\n\
	ldr	r1, ._349 + 20  @ 0x1016\n\
	mov	r0, #0x10\n\
	str	r0, [sp]\n\
	mov	r0, #0x38\n\
	str	r0, [sp, #0x4]\n\
	add	r0, r5, #0\n\
	mov	r2, #0x1\n\
	mov	r3, #0x37\n\
	bl	Text_FillWindowRect\n\
	add	r0, sp, #0x8\n\
	mov	r2, #0x0\n\
	ldsh	r1, [r0, r2]\n\
	mov	r0, #0xd\n\
	mul	r1, r1, r0\n\
	ldr	r0, ._349 + 24  @ gMoveNames\n\
	add	r1, r1, r0\n\
	mov	r2, #0x80\n\
	lsl	r2, r2, #0x1\n\
	mov	r6, #0x37\n\
	str	r6, [sp]\n\
	add	r0, r5, #0\n\
	mov	r3, #0x2\n\
	bl	Text_InitWindowAndPrintText\n\
	ldr	r4, ._349 + 28  @ gDisplayedStringBattle\n\
	add	r0, sp, #0x8\n\
	mov	r2, #0x0\n\
	ldsh	r1, [r0, r2]\n\
	add	r0, r4, #0\n\
	mov	r2, #0x2\n\
	mov	r3, #0x3\n\
	bl	ConvertIntToDecimalStringN\n\
	mov	r2, #0x88\n\
	lsl	r2, r2, #0x1\n\
	str	r6, [sp]\n\
	add	r0, r5, #0\n\
	add	r1, r4, #0\n\
	mov	r3, #0xa\n\
	bl	Text_InitWindowAndPrintText\n\
	b	._348\n\
._350:\n\
	.align	2, 0\n\
._349:\n\
	.word	gBattlePartyID\n\
	.word	gActiveBank\n\
	.word	gPlayerParty\n\
	.word	gBattleMons\n\
	.word	gUnknown_03004210\n\
	.word	0x1016\n\
	.word	gMoveNames\n\
	.word	gDisplayedStringBattle\n\
._302:\n\
	ldr	r0, ._353       @ gMain\n\
	ldrh	r0, [r0, #0x30]\n\
	cmp	r0, #0x40\n\
	bne	._351	@cond_branch\n\
	ldr	r1, ._353 + 4   @ gAnimMoveTurn\n\
	ldrb	r0, [r1]\n\
	sub	r0, r0, #0x1\n\
	b	._352\n\
._354:\n\
	.align	2, 0\n\
._353:\n\
	.word	gMain\n\
	.word	gAnimMoveTurn\n\
._351:\n\
	ldr	r1, ._359       @ gAnimMoveTurn\n\
	ldrb	r0, [r1]\n\
	add	r0, r0, #0x1\n\
._352:\n\
	strb	r0, [r1]\n\
	ldr	r4, ._359 + 4   @ gDisplayedStringBattle\n\
	ldrb	r1, [r1]\n\
	add	r0, r4, #0\n\
	mov	r2, #0x2\n\
	mov	r3, #0x3\n\
	bl	ConvertIntToDecimalStringN\n\
	ldr	r0, ._359 + 8   @ gUnknown_03004210\n\
	mov	r2, #0x8e\n\
	lsl	r2, r2, #0x1\n\
	mov	r1, #0x39\n\
	str	r1, [sp]\n\
	add	r1, r4, #0\n\
	mov	r3, #0x4\n\
	bl	Text_InitWindowAndPrintText\n\
._348:\n\
	ldr	r0, ._359 + 12  @ gMain\n\
	ldrh	r2, [r0, #0x28]\n\
	mov	r1, #0xc0\n\
	lsl	r1, r1, #0x2\n\
	add	r0, r1, #0\n\
	and	r0, r0, r2\n\
	cmp	r0, r1\n\
	bne	._355	@cond_branch\n\
	mov	r4, #0x0\n\
	ldr	r5, ._359 + 4   @ gDisplayedStringBattle\n\
	ldr	r6, ._359 + 8   @ gUnknown_03004210\n\
._361:\n\
	add	r0, r5, #0\n\
	ldr	r1, ._359 + 16  @ BattleText_Format\n\
	bl	StringCopy\n\
	ldr	r1, ._359 + 20  @ gBattlePartyID\n\
	ldr	r0, ._359 + 24  @ gActiveBank\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x1\n\
	add	r0, r0, r1\n\
	ldrh	r1, [r0]\n\
	mov	r0, #0x64\n\
	mul	r0, r0, r1\n\
	ldr	r1, ._359 + 28  @ gPlayerParty\n\
	add	r0, r0, r1\n\
	add	r1, r4, #0\n\
	add	r1, r1, #0xd\n\
	bl	GetMonData\n\
	mov	r1, #0xd\n\
	mul	r1, r1, r0\n\
	ldr	r0, ._359 + 32  @ gMoveNames\n\
	add	r1, r1, r0\n\
	add	r0, r5, #0\n\
	bl	StringAppend\n\
	lsl	r0, r4, #0x14\n\
	mov	r1, #0x80\n\
	lsl	r1, r1, #0x11\n\
	add	r0, r0, r1\n\
	lsr	r2, r0, #0x10\n\
	mov	r0, #0x1\n\
	and	r0, r0, r4\n\
	mov	r3, #0x2\n\
	cmp	r0, #0\n\
	beq	._356	@cond_branch\n\
	mov	r3, #0xa\n\
._356:\n\
	cmp	r4, #0x1\n\
	bhi	._357	@cond_branch\n\
	mov	r0, #0x37\n\
	b	._358\n\
._360:\n\
	.align	2, 0\n\
._359:\n\
	.word	gAnimMoveTurn\n\
	.word	gDisplayedStringBattle\n\
	.word	gUnknown_03004210\n\
	.word	gMain\n\
	.word	BattleText_Format\n\
	.word	gBattlePartyID\n\
	.word	gActiveBank\n\
	.word	gPlayerParty\n\
	.word	gMoveNames\n\
._357:\n\
	mov	r0, #0x39\n\
._358:\n\
	str	r0, [sp]\n\
	add	r0, r6, #0\n\
	add	r1, r5, #0\n\
	bl	Text_InitWindow\n\
	ldr	r0, ._362       @ gUnknown_03004210\n\
	bl	Text_PrintWindow8002F44\n\
	add	r0, r4, #1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r4, r0, #0x18\n\
	cmp	r4, #0x3\n\
	bls	._361	@cond_branch\n\
	ldr	r1, ._362 + 4   @ gBattleBankFunc\n\
	ldr	r0, ._362 + 8   @ gActiveBank\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldr	r1, ._362 + 12  @ sub_802C68C\n\
	str	r1, [r0]\n\
._355:\n\
	add	sp, sp, #0xc\n\
	pop	{r4, r5, r6}\n\
	pop	{r0}\n\
	bx	r0\n\
._363:\n\
	.align	2, 0\n\
._362:\n\
	.word	gUnknown_03004210\n\
	.word	gBattleBankFunc\n\
	.word	gActiveBank\n\
	.word	sub_802C68C+1");
}

__attribute__((naked))
void debug_sub_803107C(void)
{
    asm("\
	push	{r4, r5, r6, r7, lr}\n\
	add	sp, sp, #0xfffffffc\n\
	mov	r7, #0x0\n\
	ldr	r0, ._369       @ gAnimScriptCallback\n\
	ldr	r0, [r0]\n\
	bl	_call_via_r0\n\
	ldr	r0, ._369 + 4   @ gAnimScriptActive\n\
	ldrb	r0, [r0]\n\
	cmp	r0, #0\n\
	bne	._364	@cond_branch\n\
	mov	r0, #0x1\n\
	bl	sub_80326EC\n\
	ldr	r4, ._369 + 8   @ gActiveBank\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x1\n\
	mov	r2, #0x7\n\
	mov	r3, #0x1\n\
	bl	dp11b_obj_instanciate\n\
	ldrb	r0, [r4]\n\
	mov	r1, #0x0\n\
	mov	r2, #0x7\n\
	mov	r3, #0x1\n\
	bl	dp11b_obj_instanciate\n\
	ldr	r0, ._369 + 12  @ gSprites\n\
	add	r2, r0, #0\n\
	add	r2, r2, #0x3e\n\
	mov	r1, #0x3f\n\
._366:\n\
	ldrb	r0, [r2]\n\
	lsl	r0, r0, #0x1f\n\
	cmp	r0, #0\n\
	beq	._365	@cond_branch\n\
	add	r0, r7, #1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r7, r0, #0x18\n\
._365:\n\
	add	r2, r2, #0x44\n\
	sub	r1, r1, #0x1\n\
	cmp	r1, #0\n\
	bge	._366	@cond_branch\n\
	ldr	r4, ._369 + 16  @ gDisplayedStringBattle\n\
	add	r0, r4, #0\n\
	add	r1, r7, #0\n\
	mov	r2, #0x2\n\
	mov	r3, #0x2\n\
	bl	ConvertIntToDecimalStringN\n\
	ldr	r6, ._369 + 20  @ gUnknown_03004210\n\
	mov	r2, #0x91\n\
	lsl	r2, r2, #0x1\n\
	mov	r5, #0x39\n\
	str	r5, [sp]\n\
	add	r0, r6, #0\n\
	add	r1, r4, #0\n\
	mov	r3, #0x8\n\
	bl	Text_InitWindowAndPrintText\n\
	bl	GetTaskCount\n\
	lsl	r0, r0, #0x18\n\
	lsr	r7, r0, #0x18\n\
	add	r0, r4, #0\n\
	add	r1, r7, #0\n\
	mov	r2, #0x2\n\
	mov	r3, #0x2\n\
	bl	ConvertIntToDecimalStringN\n\
	mov	r2, #0x93\n\
	lsl	r2, r2, #0x1\n\
	str	r5, [sp]\n\
	add	r0, r6, #0\n\
	add	r1, r4, #0\n\
	mov	r3, #0xb\n\
	bl	Text_InitWindowAndPrintText\n\
	mov	r1, #0x0\n\
	mov	r7, #0x0\n\
	ldr	r0, ._369 + 24  @ gOamMatrixAllocBitmap\n\
	mov	r3, #0x1\n\
	ldr	r2, [r0]\n\
._368:\n\
	add	r0, r3, #0\n\
	LSL	r0, r1\n\
	and	r0, r0, r2\n\
	cmp	r0, #0\n\
	beq	._367	@cond_branch\n\
	add	r0, r7, #1\n\
	lsl	r0, r0, #0x18\n\
	lsr	r7, r0, #0x18\n\
._367:\n\
	add	r1, r1, #0x1\n\
	cmp	r1, #0x1f\n\
	ble	._368	@cond_branch\n\
	ldr	r4, ._369 + 16  @ gDisplayedStringBattle\n\
	add	r0, r4, #0\n\
	add	r1, r7, #0\n\
	mov	r2, #0x2\n\
	mov	r3, #0x2\n\
	bl	ConvertIntToDecimalStringN\n\
	ldr	r0, ._369 + 20  @ gUnknown_03004210\n\
	mov	r2, #0x95\n\
	lsl	r2, r2, #0x1\n\
	mov	r1, #0x39\n\
	str	r1, [sp]\n\
	add	r1, r4, #0\n\
	mov	r3, #0xe\n\
	bl	Text_InitWindowAndPrintText\n\
	ldr	r1, ._369 + 28  @ gBattleBankFunc\n\
	ldr	r0, ._369 + 8   @ gActiveBank\n\
	ldrb	r0, [r0]\n\
	lsl	r0, r0, #0x2\n\
	add	r0, r0, r1\n\
	ldr	r1, ._369 + 32  @ debug_sub_8030C24\n\
	str	r1, [r0]\n\
._364:\n\
	add	sp, sp, #0x4\n\
	pop	{r4, r5, r6, r7}\n\
	pop	{r0}\n\
	bx	r0\n\
._370:\n\
	.align	2, 0\n\
._369:\n\
	.word	gAnimScriptCallback\n\
	.word	gAnimScriptActive\n\
	.word	gActiveBank\n\
	.word	gSprites\n\
	.word	gDisplayedStringBattle\n\
	.word	gUnknown_03004210\n\
	.word	gOamMatrixAllocBitmap\n\
	.word	gBattleBankFunc\n\
	.word	debug_sub_8030C24+1");
}
#endif

void sub_802D204(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
        PlayerBufferExecCompleted();
}

// duplicate of sub_802D204
void sub_802D23C(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
        PlayerBufferExecCompleted();
}

void sub_802D274(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
    {
        nullsub_10(gSaveBlock2.playerGender);
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        PlayerBufferExecCompleted();
    }
}

void sub_802D2E0(void)
{
    if (--ewram17810[gActiveBank].unk9 == 0xFF)
    {
        ewram17810[gActiveBank].unk9 = 0;
        PlayerBufferExecCompleted();
    }
}

void sub_802D31C(void)
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
        HandleLowHpMusicChange(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
        if (IsDoubleBattle())
            HandleLowHpMusicChange(&gPlayerParty[gBattlePartyID[gActiveBank ^ 2]], gActiveBank ^ 2);
        ewram17810[gActiveBank].unk9 = 3;
        gBattleBankFunc[gActiveBank] = sub_802D2E0;
    }
}

void sub_802D500(void)
{
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gPlayerParty[gBattlePartyID[gActiveBank]]);
    if (!ewram17810[gActiveBank ^ 2].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_7)
        sub_8141828(gActiveBank ^ 2, &gPlayerParty[gBattlePartyID[gActiveBank ^ 2]]);
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_3)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank ^ 2]]);
            sub_8045A5C(
              gHealthboxIDs[gActiveBank ^ 2],
              &gPlayerParty[gBattlePartyID[gActiveBank ^ 2]],
              0);
            sub_804777C(gActiveBank ^ 2);
            sub_8043DFC(gHealthboxIDs[gActiveBank ^ 2]);
        }
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8045A5C(
          gHealthboxIDs[gActiveBank],
          &gPlayerParty[gBattlePartyID[gActiveBank]],
          0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        ewram17840.unk9_0 = 0;
        gBattleBankFunc[gActiveBank] = sub_802D31C;
    }
}

void sub_802D680(void)
{
    if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy
     && ewram17810[gActiveBank].unk1_0)
    {
        ewram17810[gActiveBank].unk0_7 = 0;
        ewram17810[gActiveBank].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        if (ewram17800[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
        gBattleBankFunc[gActiveBank] = sub_802D730;
    }
}

void sub_802D730(void)
{
    if (!ewram17810[gActiveBank].unk0_6 && !IsCryPlayingOrClearCrySongs())
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
        HandleLowHpMusicChange(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
        PlayerBufferExecCompleted();
    }
}

void sub_802D798(void)
{
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gPlayerParty[gBattlePartyID[gActiveBank]]);
    if (gSprites[gUnknown_0300434C[gActiveBank]].callback == SpriteCallbackDummy
     && !ewram17810[gActiveBank].unk0_3)
    {
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8045A5C(gHealthboxIDs[gActiveBank], &gPlayerParty[gBattlePartyID[gActiveBank]], 0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        sub_8031F88(gActiveBank);
        gBattleBankFunc[gActiveBank] = sub_802D680;
    }
}

void c3_0802FDF4(u8 taskId)
{
    if (!IsCryPlayingOrClearCrySongs())
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
        DestroyTask(taskId);
    }
}

void bx_t1_healthbar_update(void)
{
    s16 r4 = sub_8045C78(gActiveBank, gHealthboxIDs[gActiveBank], 0, 0);

    sub_8043DFC(gHealthboxIDs[gActiveBank]);
    if (r4 != -1)
    {
        sub_80440EC(gHealthboxIDs[gActiveBank], r4, 0);
    }
    else
    {
        HandleLowHpMusicChange(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
        PlayerBufferExecCompleted();
    }
}

void sub_802D90C(void)
{
    if (gUnknown_03004210.state == 0)
        PlayerBufferExecCompleted();
}

// Rare Candy usage, maybe?
void sub_802D924(u8 taskId)
{
    u32 pkmnIndex = (u8)gTasks[taskId].data[0];
    u8 bank = gTasks[taskId].data[2];
    s16 gainedExp = gTasks[taskId].data[1];

    if (IsDoubleBattle() == TRUE || pkmnIndex != gBattlePartyID[bank])
    {
        struct Pokemon *pkmn = &gPlayerParty[pkmnIndex];
        u16 species = GetMonData(pkmn, MON_DATA_SPECIES);
        u8 level = GetMonData(pkmn, MON_DATA_LEVEL);
        u32 currExp = GetMonData(pkmn, MON_DATA_EXP);
        u32 nextLvlExp = gExperienceTables[gBaseStats[species].growthRate][level + 1];

        if (currExp + gainedExp >= nextLvlExp)
        {
            u8 savedActiveBank;

            SetMonData(pkmn, MON_DATA_EXP, &nextLvlExp);
            CalculateMonStats(pkmn);
            gainedExp -= nextLvlExp - currExp;
            savedActiveBank = gActiveBank;
            gActiveBank = bank;
            Emitcmd33(1, 11, gainedExp);
            gActiveBank = savedActiveBank;

            if (IsDoubleBattle() == TRUE
             && ((u16)pkmnIndex == gBattlePartyID[bank] || (u16)pkmnIndex == gBattlePartyID[bank ^ 2]))
                gTasks[taskId].func = sub_802DCB0;
            else
                gTasks[taskId].func = sub_802DDC4;
        }
        else
        {
            currExp += gainedExp;
            SetMonData(pkmn, MON_DATA_EXP, &currExp);
            gBattleBankFunc[bank] = sub_802D90C;
            DestroyTask(taskId);
        }
    }
    else
    {
        gTasks[taskId].func = sub_802DA9C;
    }
}

void sub_802DA9C(u8 taskId)
{
    u8 pkmnIndex = gTasks[taskId].data[0];
    s32 r9 = gTasks[taskId].data[1];
    u8 bank = gTasks[taskId].data[2];
    struct Pokemon *pkmn = &gPlayerParty[pkmnIndex];
    u8 level = GetMonData(pkmn, MON_DATA_LEVEL);
    u16 species = GetMonData(pkmn, MON_DATA_SPECIES);
    u32 exp = GetMonData(pkmn, MON_DATA_EXP);
    u32 currLvlExp = gExperienceTables[gBaseStats[species].growthRate][level];
    u32 expToNextLvl;

    exp -= currLvlExp;
    expToNextLvl = gExperienceTables[gBaseStats[species].growthRate][level + 1] - currLvlExp;
    sub_8043D84(bank, gHealthboxIDs[bank], expToNextLvl, exp, -r9);
    PlaySE(SE_EXP);
    gTasks[taskId].func = sub_802DB6C;
}

#ifdef NONMATCHING
void sub_802DB6C(u8 taskId)
{
    if (gTasks[taskId].data[10] < 13)
    {
        gTasks[taskId].data[10]++;
    }
    else
    {
        u8 r9 = gTasks[taskId].data[0];
        s32 r10 = gTasks[taskId].data[1];  //s16?
        u8 r7 = gTasks[taskId].data[2];
        s16 r4;

        r4 = sub_8045C78(r7, gHealthboxIDs[r7], 1, 0);
        sub_8043DFC(gHealthboxIDs[r7]);
        if (r4 == -1)
        {
            struct Pokemon *pkmn;
            u8 r4;
            u32 sp4;
            u16 r0;
            u32 sp0;

            m4aSongNumStop(SE_EXP);
            pkmn = &gPlayerParty[r9];
            r4 = GetMonData(pkmn, MON_DATA_LEVEL);
            sp4 = GetMonData(pkmn, MON_DATA_EXP);
            r0 = GetMonData(pkmn, MON_DATA_SPECIES);
            sp0 = gExperienceTables[gBaseStats[r0].growthRate][r4 + 1];
            if (sp4 + r10 >= sp0)
            {
                u8 r5;
                u32 asdf;

                SetMonData(pkmn, MON_DATA_EXP, &sp0);
                CalculateMonStats(pkmn);
                //r10 -= sp0 - sp4;
                asdf = sp0 - sp4;
                //asdf = r10 - (sp0 - sp4);
                r10 -= asdf;
                r5 = gActiveBank;
                gActiveBank = r7;
                Emitcmd33(1, 11, r10);
                gActiveBank = r5;
                gTasks[taskId].func = sub_802DCB0;
            }
            else
            {
                //u32 asdf = sp4 + r10;
                sp4 += r10;
                SetMonData(pkmn, MON_DATA_EXP, &sp4);
                gBattleBankFunc[r7] = sub_802D90C;
                DestroyTask(taskId);
            }
        }
    }
}
#else
__attribute__((naked))
void sub_802DB6C(u8 taskId)
{
    asm_unified("push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x8\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r8, r0\n\
    ldr r1, _0802DB98 @ =gTasks\n\
    lsls r0, 2\n\
    add r0, r8\n\
    lsls r0, 3\n\
    adds r6, r0, r1\n\
    ldrh r1, [r6, 0x1C]\n\
    movs r2, 0x1C\n\
    ldrsh r0, [r6, r2]\n\
    cmp r0, 0xC\n\
    bgt _0802DB9C\n\
    adds r0, r1, 0x1\n\
    strh r0, [r6, 0x1C]\n\
    b _0802DC98\n\
    .align 2, 0\n\
_0802DB98: .4byte gTasks\n\
_0802DB9C:\n\
    ldrb r0, [r6, 0x8]\n\
    mov r9, r0\n\
    ldrh r2, [r6, 0xA]\n\
    mov r10, r2\n\
    ldrb r7, [r6, 0xC]\n\
    ldr r5, _0802DC64 @ =gHealthboxIDs\n\
    adds r5, r7, r5\n\
    ldrb r1, [r5]\n\
    adds r0, r7, 0\n\
    movs r2, 0x1\n\
    movs r3, 0\n\
    bl sub_8045C78\n\
    adds r4, r0, 0\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    ldrb r0, [r5]\n\
    bl sub_8043DFC\n\
    lsls r4, 16\n\
    asrs r4, 16\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    cmp r4, r0\n\
    bne _0802DC98\n\
    movs r0, 0x21\n\
    bl m4aSongNumStop\n\
    movs r0, 0x64\n\
    mov r1, r9\n\
    muls r1, r0\n\
    ldr r0, _0802DC68 @ =gPlayerParty\n\
    adds r5, r1, r0\n\
    adds r0, r5, 0\n\
    movs r1, 0x38\n\
    bl GetMonData\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    adds r0, r5, 0\n\
    movs r1, 0x19\n\
    bl GetMonData\n\
    str r0, [sp, 0x4]\n\
    adds r0, r5, 0\n\
    movs r1, 0xB\n\
    bl GetMonData\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    ldr r3, _0802DC6C @ =gExperienceTables\n\
    adds r4, 0x1\n\
    lsls r4, 2\n\
    ldr r2, _0802DC70 @ =gBaseStats\n\
    lsls r1, r0, 3\n\
    subs r1, r0\n\
    lsls r1, 2\n\
    adds r1, r2\n\
    ldrb r1, [r1, 0x13]\n\
    movs r0, 0xCA\n\
    lsls r0, 1\n\
    muls r0, r1\n\
    adds r4, r0\n\
    adds r4, r3\n\
    ldr r1, [r4]\n\
    str r1, [sp]\n\
    mov r2, r10\n\
    lsls r0, r2, 16\n\
    asrs r4, r0, 16\n\
    ldr r0, [sp, 0x4]\n\
    adds r0, r4\n\
    cmp r0, r1\n\
    blt _0802DC7C\n\
    adds r0, r5, 0\n\
    movs r1, 0x19\n\
    mov r2, sp\n\
    bl SetMonData\n\
    adds r0, r5, 0\n\
    bl CalculateMonStats\n\
    ldr r2, [sp]\n\
    add r0, sp, 0x4\n\
    ldrh r0, [r0]\n\
    subs r2, r0\n\
    subs r2, r4, r2\n\
    ldr r4, _0802DC74 @ =gActiveBank\n\
    ldrb r5, [r4]\n\
    strb r7, [r4]\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    movs r0, 0x1\n\
    movs r1, 0xB\n\
    bl Emitcmd33\n\
    strb r5, [r4]\n\
    ldr r0, _0802DC78 @ =sub_802DCB0\n\
    str r0, [r6]\n\
    b _0802DC98\n\
    .align 2, 0\n\
_0802DC64: .4byte gHealthboxIDs\n\
_0802DC68: .4byte gPlayerParty\n\
_0802DC6C: .4byte gExperienceTables\n\
_0802DC70: .4byte gBaseStats\n\
_0802DC74: .4byte gActiveBank\n\
_0802DC78: .4byte sub_802DCB0\n\
_0802DC7C:\n\
    str r0, [sp, 0x4]\n\
    add r2, sp, 0x4\n\
    adds r0, r5, 0\n\
    movs r1, 0x19\n\
    bl SetMonData\n\
    ldr r1, _0802DCA8 @ =gBattleBankFunc\n\
    lsls r0, r7, 2\n\
    adds r0, r1\n\
    ldr r1, _0802DCAC @ =sub_802D90C\n\
    str r1, [r0]\n\
    mov r0, r8\n\
    bl DestroyTask\n\
_0802DC98:\n\
    add sp, 0x8\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0802DCA8: .4byte gBattleBankFunc\n\
_0802DCAC: .4byte sub_802D90C\n");
}
#endif

void sub_802DCB0(u8 taskId)
{
    u8 bank = gTasks[taskId].data[2];
    u8 pkmnIndex = gTasks[taskId].data[0];

    if (IsDoubleBattle() == TRUE && pkmnIndex == gBattlePartyID[bank ^ 2])
        bank ^= 2;
    move_anim_start_t4(bank, bank, bank, 0);
    gTasks[taskId].func = sub_802DD10;
}

void sub_802DD10(u8 taskId)
{
    u8 bank = gTasks[taskId].data[2];

    if (!ewram17810[bank].unk0_6)
    {
        u8 pkmnIndex = gTasks[taskId].data[0];

        GetMonData(&gPlayerParty[pkmnIndex], MON_DATA_LEVEL);  // Unused return value
        if (IsDoubleBattle() == TRUE && pkmnIndex == gBattlePartyID[bank ^ 2])
            sub_8045A5C(gHealthboxIDs[bank ^ 2], &gPlayerParty[pkmnIndex], 0);
        else
            sub_8045A5C(gHealthboxIDs[bank], &gPlayerParty[pkmnIndex], 0);
        gTasks[taskId].func = sub_802DDC4;
    }
}

void sub_802DDC4(u8 taskId)
{
    u8 pkmnIndex;
    u8 bank;

    pkmnIndex = gTasks[taskId].data[0];
    GetMonData(&gPlayerParty[pkmnIndex], MON_DATA_LEVEL);  // Unused return value
    bank = gTasks[taskId].data[2];
    gBattleBankFunc[bank] = sub_802D90C;
    DestroyTask(taskId);
}

void sub_802DE10(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].pos1.y + gSprites[gObjectBankIDs[gActiveBank]].pos2.y > DISPLAY_HEIGHT)
    {
        u16 species = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES);

        nullsub_9(species);
        FreeOamMatrix(gSprites[gObjectBankIDs[gActiveBank]].oam.matrixNum);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        PlayerBufferExecCompleted();
    }
}

void sub_802DEAC(void)
{
    if (!ewram17810[gActiveBank].unk0_6)
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        PlayerBufferExecCompleted();
    }
}

// Duplicate of sub_802D90C
void sub_802DF18(void)
{
    if (gUnknown_03004210.state == 0)
        PlayerBufferExecCompleted();
}

void sub_802DF30(void)
{
    if (!gPaletteFade.active)
    {
        u8 r4;

        gBattleBankFunc[gActiveBank] = sub_802DF88;
        r4 = gTasks[gUnknown_0300434C[gActiveBank]].data[0];
        DestroyTask(gUnknown_0300434C[gActiveBank]);
        sub_8094E20(r4);
    }
}

void sub_802DF88(void)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        if (gUnknown_0202E8F4 == 1)
            Emitcmd34(1, gUnknown_0202E8F5, gUnknown_02038470);
        else
            Emitcmd34(1, 6, NULL);
        if ((gBattleBufferA[gActiveBank][1] & 0xF) == 1)
            b_link_standby_message();
        PlayerBufferExecCompleted();
    }
}

void sub_802E004(void)
{
    if (!gPaletteFade.active)
    {
        gBattleBankFunc[gActiveBank] = sub_802E03C;
        nullsub_14();
        sub_80A6DCC();
    }
}

void sub_802E03C(void)
{
    if (gMain.callback2 == BattleMainCB2 && !gPaletteFade.active)
    {
        Emitcmd35(1, gSpecialVar_ItemId);
        PlayerBufferExecCompleted();
    }
}

void bx_wait_t1(void)
{
    if (!gDoingBattleAnim || !ewram17810[gActiveBank].unk0_6)
        PlayerBufferExecCompleted();
}

void bx_blink_t1(void)
{
    u8 spriteId = gObjectBankIDs[gActiveBank];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = 0;
        PlayerBufferExecCompleted();
    }
    else
    {
        if (((u16)gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        gSprites[spriteId].data[1]++;
    }
}

void sub_802E12C(s32 a, const u8 *b)
{
    struct ChooseMoveStruct *r4 = (struct ChooseMoveStruct *)&gBattleBufferA[gActiveBank][4];

    StringCopy(gDisplayedStringBattle, b);
    StringAppend(gDisplayedStringBattle, gMoveNames[r4->moves[a]]);
    Text_InitWindow(
      &gUnknown_03004210,
      gDisplayedStringBattle,
      0x300 + a * 20,
      (a & 1) ? 11 : 1,
      (a < 2) ? 0x37 : 0x39);
    Text_PrintWindow8002F44(&gUnknown_03004210);
}

void sub_802E1B0(void)
{
    struct ChooseMoveStruct *r4 = (struct ChooseMoveStruct *)&gBattleBufferA[gActiveBank][4];
    s32 i;

    gUnknown_03004348 = 0;
    Text_FillWindowRect(&gUnknown_03004210, 0x1016, 1, 0x37, 0x14, 0x3A);
    for (i = 0; i < 4; i++)
    {
        nullsub_7(i);
        sub_802E12C(i, BattleText_Format);
        if (r4->moves[i] != 0)
            gUnknown_03004348++;
    }
}

void sub_802E220(void)
{
    if (gBattleBufferA[gActiveBank][2] != 1)
    {
        struct ChooseMoveStruct *r4 = (struct ChooseMoveStruct *)&gBattleBufferA[gActiveBank][4];
        u8 *str = gDisplayedStringBattle;

        str = StringCopy(str, BattleText_Format);
        str[0] = EXT_CTRL_CODE_BEGIN;
        str[1] = 0x11;
        str[2] = 2;
        str += 3;
        str[0] = EXT_CTRL_CODE_BEGIN;
        str[1] = 0x14;
        str[2] = 6;
        str += 3;
        str = ConvertIntToDecimalStringN(str, r4->pp[gMoveSelectionCursor[gActiveBank]], 1, 2);
        *str++ = CHAR_SLASH;
        ConvertIntToDecimalStringN(str, r4->unkC[gMoveSelectionCursor[gActiveBank]], 1, 2);
        Text_InitWindow(&gUnknown_03004210, gDisplayedStringBattle, 0x2A2, 0x19, 0x37);
        Text_PrintWindow8002F44(&gUnknown_03004210);
    }
}

extern const u8 BattleText_ForgetMove[];
extern const u8 gTypeNames[][7];

void sub_802E2D4(void)
{
    if (gBattleBufferA[gActiveBank][2] == 1)
    {
        Text_FillWindowRect(&gUnknown_03004210, 0x1016, 0x17, 0x37, 0x1C, 0x3A);
        Text_InitWindow(&gUnknown_03004210, BattleText_ForgetMove, 0x290, 0x13, 0x37);
    }
    else
    {
        struct ChooseMoveStruct *r4 = (struct ChooseMoveStruct *)&gBattleBufferA[gActiveBank][4];
        u8 *str = gDisplayedStringBattle;

        str = StringCopy(str, BattleText_Format);
        StringCopy(str, gTypeNames[gBattleMoves[r4->moves[gMoveSelectionCursor[gActiveBank]]].type]);
        Text_FillWindowRect(&gUnknown_03004210, 0x1016, 0x17, 0x39, 0x1C, 0x3A);
        Text_InitWindow(&gUnknown_03004210, gDisplayedStringBattle, 0x2C0, 0x17, 0x39);
    }
    Text_PrintWindow8002F44(&gUnknown_03004210);
}

const u8 gUnknown_081FAE89[][2] =
{
    { 8, 120},
    {88, 120},
    { 8, 136},
    {88, 136},
};

const u8 gUnknown_081FAE91[][2] =
{
    {144, 120},
    {190, 120},
    {144, 136},
    {190, 136},
    { 72,  72},
    { 32,  90},
    { 80,  80},
    { 80,  88},
};

void sub_802E3B4(u8 a, int unused)
{
    sub_814A958(0x48);
    MenuCursor_SetPos814A880(gUnknown_081FAE89[a][0], gUnknown_081FAE89[a][1]);
}

void nullsub_7(u8 a)
{
}

void sub_802E3E4(u8 a, int unused)
{
    sub_814A958(0x2A);
    MenuCursor_SetPos814A880(gUnknown_081FAE91[a][0], gUnknown_081FAE91[a][1]);
}

void nullsub_8(u8 a)
{
}

void sub_802E414(void)
{
    SetMainCallback2(ReshowBattleScreenAfterMenu);
}

void sub_802E424(void)
{
    SetMainCallback2(ReshowBattleScreenAfterMenu);
}

void sub_802E434(void)
{
    if (!ewram17810[gActiveBank].unk0_4)
        PlayerBufferExecCompleted();
}

void sub_802E460(void)
{
    if (!ewram17810[gActiveBank].unk0_5)
        PlayerBufferExecCompleted();
}

void b_link_standby_message(void)
{
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        gBattle_BG0_X = 0;
        gBattle_BG0_Y = 0;
        Text_InitWindow8002EB0(&gUnknown_03004210, BattleText_LinkStandby, 0x90, 2, 15);
    }
}

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
    Emitcmd29(1, offset, unkData);
    PlayerBufferExecCompleted();
}

// Duplicate of dp01_getattr_by_ch1_for_player_pokemon
u32 dp01_getattr_by_ch1_for_player_pokemon_(u8 a, u8 *buffer)
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

void PlayerHandlecmd1(void)
{
    struct BattlePokemon battleMon;
    u8 i;
    // TODO: Maybe fix this. Integrating this into MEMSET_ALT is too hard.
    u8 *src = (u8 *)&gPlayerParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1];
    u8 *dst;

    MEMSET_ALT(&battleMon + gBattleBufferA[gActiveBank][1], src[i], gBattleBufferA[gActiveBank][2], i, dst);
    Emitcmd29(1, gBattleBufferA[gActiveBank][2], dst);
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
    struct MovePpInfo *moveData = (struct MovePpInfo *)&gBattleBufferA[gActiveBank][3];
    s32 i;

    switch (gBattleBufferA[gActiveBank][1])
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
        SetMonData(&gPlayerParty[a], MON_DATA_SPECIES, &gBattleBufferA[gActiveBank][3]);
        break;
    case 2:
        SetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBank][3]);
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
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBank][3]);
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
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBank][6]);
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
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBank][3]);
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
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED, &gBattleBufferA[gActiveBank][3]);
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
    HandleLowHpMusicChange(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
}

void PlayerHandlecmd3(void)
{
    u8 i;
    u8 *dst;

    MEMSET_ALT(&gPlayerParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1], gBattleBufferA[gActiveBank][3 + i], 
        gBattleBufferA[gActiveBank][2], i, dst);
    PlayerBufferExecCompleted();
}

void PlayerHandleLoadPokeSprite(void)
{
    BattleLoadPlayerMonSprite(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    gBattleBankFunc[gActiveBank] = bx_0802E404;
}

void PlayerHandleSendOutPoke(void)
{
    sub_8032AA8(gActiveBank, gBattleBufferA[gActiveBank][2]);
    gBattlePartyID[gActiveBank] = gBattleBufferA[gActiveBank][1];
    BattleLoadPlayerMonSprite(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
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
      GetBankPosition(bank, 2),
      sub_8077F68(bank),
      sub_8079E90(bank));
    gSprites[gUnknown_0300434C[bank]].data[1] = gObjectBankIDs[bank];
    gSprites[gObjectBankIDs[bank]].data[0] = bank;
    gSprites[gObjectBankIDs[bank]].data[2] = species;
    gSprites[gObjectBankIDs[bank]].oam.paletteNum = bank;
    StartSpriteAnim(&gSprites[gObjectBankIDs[bank]], gBattleMonForms[bank]);
    gSprites[gObjectBankIDs[bank]].invisible = TRUE;
    gSprites[gObjectBankIDs[bank]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[bank]].data[0] = sub_8046400(0, 0xFF);
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
        if (ewram17800[gActiveBank].substituteSprite)
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
    LoadPlayerTrainerBankSprite(gSaveBlock2.playerGender, gActiveBank);
    GetMonSpriteTemplate_803C5A0(gSaveBlock2.playerGender, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      r7 + 80,
      (8 - gTrainerBackPicCoords[gSaveBlock2.playerGender].coords) * 4 + 80,
      sub_8079E90(gActiveBank));
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = 240;
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = -2;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_802D204;
}

void PlayerHandleTrainerSlide(void)
{
    LoadPlayerTrainerBankSprite(gSaveBlock2.playerGender, gActiveBank);
    GetMonSpriteTemplate_803C5A0(gSaveBlock2.playerGender, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      80,
      (8 - gTrainerBackPicCoords[gSaveBlock2.playerGender].coords) * 4 + 80,
      30);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -96;
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 2;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_802D23C;
}

void PlayerHandleTrainerSlideBack(void)
{
    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 50;
    gSprites[gObjectBankIDs[gActiveBank]].data[2] = -40;
    gSprites[gObjectBankIDs[gActiveBank]].data[4] = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    StoreSpriteCallbackInData(&gSprites[gObjectBankIDs[gActiveBank]], SpriteCallbackDummy);
    StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], 1);
    gBattleBankFunc[gActiveBank] = sub_802D274;
}

void PlayerHandlecmd10(void)
{
    if (ewram17810[gActiveBank].unk4 == 0)
    {
        if (ewram17800[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ewram17810[gActiveBank].unk4++;
    }
    else
    {
        if (ewram17810[gActiveBank].unk0_6 == 0)
        {
            ewram17810[gActiveBank].unk4 = 0;
            HandleLowHpMusicChange(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
            PlaySE12WithPanning(SE_POKE_DEAD, -64);
            gSprites[gObjectBankIDs[gActiveBank]].data[1] = 0;
            gSprites[gObjectBankIDs[gActiveBank]].data[2] = 5;
            gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80105EC;
            gBattleBankFunc[gActiveBank] = sub_802DE10;
        }
    }
}

void PlayerHandlecmd11(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 2, 0, 16, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd12(void)
{
    ewram17840.unk8 = 4;
    gDoingBattleAnim = 1;
    move_anim_start_t4(gActiveBank, gActiveBank, GetBankByIdentity(1), 3);
    gBattleBankFunc[gActiveBank] = bx_wait_t1;
}

void PlayerHandleBallThrow(void)
{
    u8 var = gBattleBufferA[gActiveBank][1];

    ewram17840.unk8 = var;
    gDoingBattleAnim = 1;
    move_anim_start_t4(gActiveBank, gActiveBank, GetBankByIdentity(1), 3);
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

        gAnimMoveTurn = gBattleBufferA[gActiveBank][3];
        gAnimMovePower = gBattleBufferA[gActiveBank][4] | (gBattleBufferA[gActiveBank][5] << 8);
        gAnimMoveDmg = gBattleBufferA[gActiveBank][6] | (gBattleBufferA[gActiveBank][7] << 8) | (gBattleBufferA[gActiveBank][8] << 16) | (gBattleBufferA[gActiveBank][9] << 24);
        gAnimFriendship = gBattleBufferA[gActiveBank][10];
        gWeatherMoveAnim = gBattleBufferA[gActiveBank][12] | (gBattleBufferA[gActiveBank][13] << 8);
        gAnimDisableStructPtr = (struct DisableStruct *)&gBattleBufferA[gActiveBank][16];
        gTransformedPersonalities[gActiveBank] = gAnimDisableStructPtr->transformedMonPersonality;
        if (sub_8031720(r0, gAnimMoveTurn) != 0)
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
        if (ewram17800[gActiveBank].substituteSprite == 1 && ewram17800[gActiveBank].unk0_3 == 0)
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
            DoMoveAnim(r4);
            ewram17810[gActiveBank].unk4 = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_80326EC(1);
            if (ewram17800[gActiveBank].substituteSprite == 1 && r7 < 2)
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
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 0;
    BufferStringBattle(*(u16 *)&gBattleBufferA[gActiveBank][2]);
    Text_InitWindow8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 0x90, 2, 15);
    gBattleBankFunc[gActiveBank] = sub_802DF18;
}

void PlayerHandlePrintStringPlayerOnly(void)
{
    if (GetBankSide(gActiveBank) == 0)
        PlayerHandlePrintString();
    else
        PlayerBufferExecCompleted();
}

void PlayerHandlecmd18(void)
{
    int r4;

    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 160;
    Text_FillWindowRect(&gUnknown_03004210, 10, 2, 15, 27, 18);
    Text_FillWindowRect(&gUnknown_03004210, 10, 2, 35, 16, 38);

    gBattleBankFunc[gActiveBank] = sub_802C098;

    Text_InitWindow(&gUnknown_03004210, BattleText_MenuOptions, 400, 18, 35);
    Text_PrintWindow8002F44(&gUnknown_03004210);
    MenuCursor_Create814A5C0(0, 0xFFFF, 12, 11679, 0);

    for (r4 = 0; r4 < 4; r4++)
        nullsub_8(r4);

    sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);

    StrCpyDecodeToDisplayedStringBattle(BattleText_OtherMenu);
    Text_InitWindow(&gUnknown_03004210, gDisplayedStringBattle, SUB_803037C_TILE_DATA_OFFSET, 2, 35);
    Text_PrintWindow8002F44(&gUnknown_03004210);
}

void PlayerHandlecmd19()
{
}

void PlayerHandlecmd20(void)
{
    MenuCursor_Create814A5C0(0, 0xFFFF, 12, 0x2D9F, 0);
    sub_80304A8();
    gBattleBankFunc[gActiveBank] = sub_802C68C;
}

void sub_80304A8(void)
{
    gBattle_BG0_X = 0;
    gBattle_BG0_Y = 320;
    sub_802E1B0();
    gUnknown_03004344 = 0xFF;
    sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
    if (gBattleBufferA[gActiveBank][2] != 1)
    {
        Text_InitWindow(&gUnknown_03004210, BattleText_PP, 656, 23, 55);
        Text_PrintWindow8002F44(&gUnknown_03004210);
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

void PlayerHandlecmd22(void)
{
    s32 i;

    gUnknown_0300434C[gActiveBank] = CreateTask(TaskDummy, 0xFF);
    gTasks[gUnknown_0300434C[gActiveBank]].data[0] = gBattleBufferA[gActiveBank][1] & 0xF;
    ewram16054 = gBattleBufferA[gActiveBank][1] >> 4;
    EWRAM_1609D = gBattleBufferA[gActiveBank][2];
    ewram160C0 = gBattleBufferA[gActiveBank][3];
    for (i = 0; i < 3; i++)
        gUnknown_02038470[i] = gBattleBufferA[gActiveBank][4 + i];
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gBattleBankFunc[gActiveBank] = sub_802DF30;
    gBankInMenu = gActiveBank;
}

void PlayerHandlecmd23(void)
{
    BattleStopLowHpSound();
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

void PlayerHandlecmd29(void)
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

    Dma3CopyLarge16_(&gBattleBufferA[gActiveBank][7], (u8 *)val1, val2);
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd31(void)
{
    PlayBGM(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd32(void)
{
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd33(void)
{
    Emitcmd33(1, 0, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd34(void)
{
    Emitcmd34(1, 0, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd35(void)
{
    Emitcmd35(1, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd36(void)
{
    Emitcmd36(1, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd37(void)
{
    gUnknown_020238C8.unk0_0 = 0;
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd38(void)
{
    gUnknown_020238C8.unk0_0 = gBattleBufferA[gActiveBank][1];
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd39(void)
{
    gUnknown_020238C8.unk0_7 = 0;
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd40(void)
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
        gSprites[gObjectBankIDs[gActiveBank]].data[1] = 0;
        sub_8047858(gActiveBank);
        gBattleBankFunc[gActiveBank] = bx_blink_t1;
    }
}

void PlayerHandlecmd42(void)
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

void PlayerHandlecmd44(void)
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
    StartBattleIntroAnim(gBattleBufferA[gActiveBank][1]);
    gUnknown_02024DE8 |= 1;
    PlayerBufferExecCompleted();
}

void PlayerHandleTrainerBallThrow(void)
{
    u8 paletteNum;
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 50;
    gSprites[gObjectBankIDs[gActiveBank]].data[2] = -40;
    gSprites[gObjectBankIDs[gActiveBank]].data[4] = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    gSprites[gObjectBankIDs[gActiveBank]].data[5] = gActiveBank;
    StoreSpriteCallbackInData(&gSprites[gObjectBankIDs[gActiveBank]], sub_8030E38);
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
    u8 r4 = sprite->data[5];

    FreeSpriteOamMatrix(sprite);
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(sprite->oam.paletteNum));
    DestroySprite(sprite);
    BattleLoadPlayerMonSprite(&gPlayerParty[gBattlePartyID[r4]], r4);
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
            BattleLoadPlayerMonSprite(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
            sub_802F934(gActiveBank, 0);
            gActiveBank ^= 2;
        }
        gBattleBankFunc[gActiveBank] = sub_802D500;
        gActiveBank = savedActiveBank;
        DestroyTask(taskId);
    }
}

void PlayerHandlecmd48(void)
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

void PlayerHandlecmd49(void)
{
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    PlayerBufferExecCompleted();
}

void PlayerHandlecmd50(void)
{
    dp11b_obj_free(gActiveBank, 1);
    dp11b_obj_free(gActiveBank, 0);
    PlayerBufferExecCompleted();
}

void PlayerHandleSpriteInvisibility(void)
{
    if (IsBankSpritePresent(gActiveBank))
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

void PlayerHandlecmd55(void)
{
    gBattleOutcome = gBattleBufferA[gActiveBank][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    PlayerBufferExecCompleted();
    gBattleBankFunc[gActiveBank] = sub_802D18C;
}

void PlayerHandlecmd56(void)
{
}
