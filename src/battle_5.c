#include "global.h"
#include "battle.h"
#include "battle_interface.h"
#include "item.h"
#include "link.h"
#include "main.h"
#include "menu_cursor.h"
#include "pokemon.h"
#include "rom3.h"
#include "songs.h"
#include "sound.h"
#include "util.h"

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
extern const struct BattleMove gBattleMoves[];

extern void dp11b_obj_instanciate(u8, u8, s8, s8);
extern u8 GetBankIdentity(u8);
extern u8 GetBankByPlayerAI(u8);
extern void dp11b_obj_free(u8, u8);
extern void sub_8010520(struct Sprite *);
extern void sub_8010574(struct Sprite *);

void PlayerHandleGetAttributes(void);
void sub_802ECF0(void);
void PlayerHandleSetAttributes(void);
void sub_802F7CC(void);
void PlayerHandleLoadPokeSprite(void);
void PlayerHandleSendOutPoke(void);
void PlayerHandleReturnPokeToBall(void);
void PlayerHandleTrainerThrow(void);
void PlayerHandleTrainerSlide(void);
void PlayerHandleTrainerSlideBack(void);
void sub_802FE7C(void);
void sub_802FF60(void);
void sub_802FF80(void);
void PlayerHandleBallThrow(void);
void PlayerHandlePuase(void);
void PlayerHandleMoveAnimation(void);
void PlayerHandlePrintString(void);
void PlayerHandlePrintStringPlayerOnly(void);
void sub_803037C(void);
void nullsub_42(void);
void sub_8030468(void);
void PlayerHandleOpenBag(void);
void sub_8030594(void);
void sub_8030674(void);
void PlayerHandleHealthBarUpdate(void);
void PlayerHandleExpBarUpdate(void);
void PlayerHandleStatusIconUpdate(void);
void PlayerHandleStatusAnimation(void);
void PlayerHandleStatusXor(void);
void sub_803097C(void);
void PlayerHandleDMATransfer(void);
void sub_8030A3C(void);
void sub_8030A6C(void);
void sub_8030A78(void);
void sub_8030A8C(void);
void sub_8030AA0(void);
void sub_8030AB4(void);
void sub_8030AC8(void);
void sub_8030AE4(void);
void sub_8030B1C(void);
void sub_8030B34(void);
void PlayerHandleHitAnimation(void);
void sub_8030BCC(void);
void PlayerHandleEffectivenessSound(void);
void sub_8030C1C(void);
void PlayerHandleFaintingCry(void);
void PlayerHandleIntroSlide(void);
void PlayerHandleTrainerBallThrow(void);
void sub_8030FAC(void);
void sub_80310A4(void);
void sub_80310F0(void);
void PlayerHandleSpriteInvisibility(void);
void PlayerHandleBattleAnimation(void);
void PlayerHandleLinkStandbyMsg(void);
void PlayerHandleResetActionMoveSelection(void);
void sub_80312A0(void);
void nullsub_43(void);

const u8 gString_TurnJP[] = _("ターン");

void (*const gPlayerBufferCommands[])(void) =
{
    PlayerHandleGetAttributes,
    sub_802ECF0,
    PlayerHandleSetAttributes,
    sub_802F7CC,
    PlayerHandleLoadPokeSprite,
    PlayerHandleSendOutPoke,
    PlayerHandleReturnPokeToBall,
    PlayerHandleTrainerThrow,
    PlayerHandleTrainerSlide,
    PlayerHandleTrainerSlideBack,
    sub_802FE7C,
    sub_802FF60,
    sub_802FF80,
    PlayerHandleBallThrow,
    PlayerHandlePuase,
    PlayerHandleMoveAnimation,
    PlayerHandlePrintString,
    PlayerHandlePrintStringPlayerOnly,
    sub_803037C,
    nullsub_42,
    sub_8030468,
    PlayerHandleOpenBag,
    sub_8030594,
    sub_8030674,
    PlayerHandleHealthBarUpdate,
    PlayerHandleExpBarUpdate,
    PlayerHandleStatusIconUpdate,
    PlayerHandleStatusAnimation,
    PlayerHandleStatusXor,
    sub_803097C,
    PlayerHandleDMATransfer,
    sub_8030A3C,
    sub_8030A6C,
    sub_8030A78,
    sub_8030A8C,
    sub_8030AA0,
    sub_8030AB4,
    sub_8030AC8,
    sub_8030AE4,
    sub_8030B1C,
    sub_8030B34,
    PlayerHandleHitAnimation,
    sub_8030BCC,
    PlayerHandleEffectivenessSound,
    sub_8030C1C,
    PlayerHandleFaintingCry,
    PlayerHandleIntroSlide,
    PlayerHandleTrainerBallThrow,
    sub_8030FAC,
    sub_80310A4,
    sub_80310F0,
    PlayerHandleSpriteInvisibility,
    PlayerHandleBattleAnimation,
    PlayerHandleLinkStandbyMsg,
    PlayerHandleResetActionMoveSelection,
    sub_80312A0,
    nullsub_43,
};

void PlayerBufferRunCommand(void);
void sub_802C2EC(void);
void sub_802C68C(void);

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

        dp01_prepare_buffer_wireless_probably(2, 4, &playerId);
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
    u16 r5 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);

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
            dp01_build_cmdbuf_x21_a_bb(1, 0, 0);
            break;
        case 1:
            dp01_build_cmdbuf_x21_a_bb(1, 1, 0);
            break;
        case 2:
            dp01_build_cmdbuf_x21_a_bb(1, 2, 0);
            break;
        case 3:
            dp01_build_cmdbuf_x21_a_bb(1, 3, 0);
            break;
        }
        PlayerBufferExecCompleted();
    }
    else if (gMain.newKeys & 0x20)
    {
        if (gActionSelectionCursor[gActiveBank] & 1)
        {
            PlaySE(SE_SELECT);
            nullsub_8(gActionSelectionCursor[gActiveBank]);
            gActionSelectionCursor[gActiveBank] ^= 1;
            sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
        }
    }
    else if (gMain.newKeys & 0x10)
    {
        if (!(gActionSelectionCursor[gActiveBank] & 1))
        {
            PlaySE(SE_SELECT);
            nullsub_8(gActionSelectionCursor[gActiveBank]);
            gActionSelectionCursor[gActiveBank] ^= 1;
            sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
        }
    }
    else if (gMain.newKeys & 0x40)
    {
        if (gActionSelectionCursor[gActiveBank] & 2)
        {
            PlaySE(SE_SELECT);
            nullsub_8(gActionSelectionCursor[gActiveBank]);
            gActionSelectionCursor[gActiveBank] ^= 2;
            sub_802E3E4(gActionSelectionCursor[gActiveBank], 0);
        }
    }
    else if (gMain.newKeys & 0x80)
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
         && !(gAbsentBankFlags & gBitTable[GetBankByPlayerAI(0)])
         && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            if (gBattleBufferA[gActiveBank][1] == 1)
            {
                if (r5 > 12)
                    return;
                AddBagItem(r5, 1);
            }
            PlaySE(SE_SELECT);
            dp01_build_cmdbuf_x21_a_bb(1, 12, 0);
            PlayerBufferExecCompleted();
            DestroyMenuCursor();
        }
    }
    else if (gMain.newKeys & 8)
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
        dp01_build_cmdbuf_x21_a_bb(1, 10, gMoveSelectionCursor[gActiveBank] | (gUnknown_03004344 << 8));
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
                gUnknown_03004344 = GetBankByPlayerAI(arr[i]);
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
                gUnknown_03004344 = GetBankByPlayerAI(arr[i]);
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
