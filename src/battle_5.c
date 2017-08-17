#include "global.h"
#include "data2.h"
#include "battle.h"
#include "battle_interface.h"
#include "item.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "menu_cursor.h"
#include "palette.h"
#include "pokemon.h"
#include "rom3.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
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
//extern const struct BattleMove gBattleMoves[];
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern struct Window gUnknown_03004210;
extern const u8 gUnknown_08400D89[];
extern u8 gUnknown_03004348;
extern struct BattlePokemon gBattleMons[];
extern MainCallback gPreBattleCallback1;
extern u8 gHealthboxIDs[];
extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gUnknown_0300434C[];
extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F5;
extern u8 gUnknown_02038470[];
extern u16 gScriptItemId;
extern u8 gDisplayedStringBattle[];

extern void dp11b_obj_instanciate(u8, u8, s8, s8);
extern u8 GetBankIdentity(u8);
extern u8 GetBankByPlayerAI(u8);
extern void dp11b_obj_free(u8, u8);
extern void sub_8010520(struct Sprite *);
extern void sub_8010574(struct Sprite *);
extern void nullsub_7(u8);
extern void sub_802E3B4();
extern void sub_802E220();
extern void sub_802E2D4();
extern void sub_802E12C(s32, const u8 *);
extern void sub_802E1B0(void);
extern bool8 IsDoubleBattle();
extern void sub_804777C();
extern void sub_8141828();
extern void sub_8094E20(u8);
extern void b_link_standby_message(void);
extern void nullsub_14(void);
extern void sub_80A6DCC(void);

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

extern const u8 gUnknown_081FAE80[];

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

struct UnknownStruct1
{
    u16 moves[4];
    u8 pp[4];
    u8 unkC[0x12-0xC];
    u8 unk12;
    u8 unk13;
    u8 filler14[0x20-0x14];
};

void sub_802C68C(void)
{
    u32 r8 = 0;
    struct UnknownStruct1 *r6 = (struct UnknownStruct1 *)(gBattleBufferA[gActiveBank] + 4);

    if (gMain.newKeys & A_BUTTON)
    {
        u32 r4;

        PlaySE(SE_SELECT);

        if (r6->moves[gMoveSelectionCursor[gActiveBank]] == 0xAE)
            r4 = (r6->unk12 != 7 && (r6->unk13 ^ 7)) ? 0x10 : 0;
        else
            r4 = gBattleMoves[r6->moves[gMoveSelectionCursor[gActiveBank]]].target;

        if (r4 & 0x10)
            gUnknown_03004344 = gActiveBank;
        else
            gUnknown_03004344 = GetBankByPlayerAI((GetBankIdentity(gActiveBank) & 1) ^ 1);

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
            dp01_build_cmdbuf_x21_a_bb(1, 10, gMoveSelectionCursor[gActiveBank] | (gUnknown_03004344 << 8));
            PlayerBufferExecCompleted();
        }
        else
        {
            gBattleBankFunc[gActiveBank] = sub_802C2EC;
            if (r4 & 0x12)
                gUnknown_03004344 = gActiveBank;
            else if (gAbsentBankFlags & gBitTable[GetBankByPlayerAI(1)])
                gUnknown_03004344 = GetBankByPlayerAI(3);
            else
                gUnknown_03004344 = GetBankByPlayerAI(1);
            gSprites[gObjectBankIDs[gUnknown_03004344]].callback = sub_8010520;
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        DestroyMenuCursor();
        PlaySE(SE_SELECT);
        gUnknown_030042A4 = 0;
        gUnknown_030042A0 = 320;
        dp01_build_cmdbuf_x21_a_bb(1, 10, 0xFFFF);
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
            FillWindowRect(&gUnknown_03004210, 0x1016, 0x17, 0x37, 0x1C, 0x3A);
            InitWindow(&gUnknown_03004210, gUnknown_08400D89, 0x290, 0x17, 0x37);
            sub_8002F44(&gUnknown_03004210);
            gBattleBankFunc[gActiveBank] = sub_802CA60;
        }
    }
}

extern const u8 gUnknown_08400D49[];
extern const u8 gUnknown_08400D38[];

void sub_802CA60(void)
{
    u8 perMovePPBonuses[4];
    struct
    {
        u16 moves[4];
        u8 pp[4];
        u8 filler18[8];  // what is this?
    } sp0;
    //struct UnknownStruct1 sp0;
    u8 totalPPBonuses;

    if (gMain.newKeys & (A_BUTTON | SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);
        if (gMoveSelectionCursor[gActiveBank] != gUnknown_03004344)
        {
            struct UnknownStruct1 *r9 = (struct UnknownStruct1 *)&gBattleBufferA[gActiveBank][4];
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
                    SetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MOVE1 + i, (u8 *)&sp0.moves[i]);
                    SetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_PP1 + i, &sp0.pp[i]);
                }
                SetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_PP_BONUSES, &totalPPBonuses);
            }
        }
        else
        {
            sub_802E12C(gUnknown_03004344, gUnknown_08400D49);
        }
        gBattleBankFunc[gActiveBank] = sub_802C68C;
        gMoveSelectionCursor[gActiveBank] = gUnknown_03004344;
        sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
        FillWindowRect(&gUnknown_03004210, 0x1016, 0x17, 0x37, 0x1C, 0x3A);
        InitWindow(&gUnknown_03004210, gUnknown_08400D38, 0x290, 0x17, 0x37);
        sub_8002F44(&gUnknown_03004210);
        sub_802E220();
        sub_802E2D4();
    }
    if (gMain.newKeys & (B_BUTTON | SELECT_BUTTON))
    {
        PlaySE(SE_SELECT);
        nullsub_7(gUnknown_03004344);
        sub_802E3B4(gMoveSelectionCursor[gActiveBank], 0);
        sub_802E12C(gMoveSelectionCursor[gActiveBank], gUnknown_08400D49);
        gBattleBankFunc[gActiveBank] = sub_802C68C;
        FillWindowRect(&gUnknown_03004210, 0x1016, 0x17, 0x37, 0x1C, 0x3A);
        InitWindow(&gUnknown_03004210, gUnknown_08400D38, 0x290, 0x17, 0x37);
        sub_8002F44(&gUnknown_03004210);
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
        sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
        if (IsDoubleBattle())
            sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank ^ 2]], gActiveBank ^ 2);
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
        if (ewram17800[gActiveBank].unk0_2)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
        gBattleBankFunc[gActiveBank] = sub_802D730;
    }
}

void sub_802D730(void)
{
    if (!ewram17810[gActiveBank].unk0_6 && !IsCryPlayingOrClearCrySongs())
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
        sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
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
        sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
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

            SetMonData(pkmn, MON_DATA_EXP, (u8 *)&nextLvlExp);
            CalculateMonStats(pkmn);
            gainedExp -= nextLvlExp - currExp;
            savedActiveBank = gActiveBank;
            gActiveBank = bank;
            dp01_build_cmdbuf_x21_a_bb(1, 11, gainedExp);
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
            SetMonData(pkmn, MON_DATA_EXP, (u8 *)&currExp);
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
                
                SetMonData(pkmn, MON_DATA_EXP, (u8 *)&sp0);
                CalculateMonStats(pkmn);
                //r10 -= sp0 - sp4;
                asdf = sp0 - sp4;
                //asdf = r10 - (sp0 - sp4);
                r10 -= asdf;
                r5 = gActiveBank;
                gActiveBank = r7;
                dp01_build_cmdbuf_x21_a_bb(1, 11, r10);
                gActiveBank = r5;
                gTasks[taskId].func = sub_802DCB0;
            }
            else
            {
                //u32 asdf = sp4 + r10;
                sp4 += r10;
                SetMonData(pkmn, MON_DATA_EXP, (u8 *)&sp4);
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
    bl dp01_build_cmdbuf_x21_a_bb\n\
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
    if (gMain.callback2 == sub_800F808 && !gPaletteFade.active)
    {
        if (gUnknown_0202E8F4 == 1)
            dp01_build_cmdbuf_x22_a_three_bytes(1, gUnknown_0202E8F5, gUnknown_02038470);
        else
            dp01_build_cmdbuf_x22_a_three_bytes(1, 6, NULL);
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
    if (gMain.callback2 == sub_800F808 && !gPaletteFade.active)
    {
        dp01_build_cmdbuf_x23_aa_0(1, gScriptItemId);
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

    if (gSprites[spriteId].data1 == 32)
    {
        gSprites[spriteId].data1 = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = 0;
        PlayerBufferExecCompleted();
    }
    else
    {
        if (((u16)gSprites[spriteId].data1 % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        gSprites[spriteId].data1++;
    }
}

void sub_802E12C(s32 a, const u8 *b)
{
    struct UnknownStruct1 *r4 = (struct UnknownStruct1 *)&gBattleBufferA[gActiveBank][4];
    
    StringCopy(gDisplayedStringBattle, b);
    StringAppend(gDisplayedStringBattle, gMoveNames[r4->moves[a]]);
    InitWindow(
      &gUnknown_03004210,
      gDisplayedStringBattle,
      0x300 + a * 20,
      (a & 1) ? 11 : 1,
      (a < 2) ? 0x37 : 0x39);
    sub_8002F44(&gUnknown_03004210);
}

void sub_802E1B0(void)
{
    struct UnknownStruct1 *r4 = (struct UnknownStruct1 *)&gBattleBufferA[gActiveBank][4];
    s32 i;
    
    gUnknown_03004348 = 0;
    FillWindowRect(&gUnknown_03004210, 0x1016, 1, 0x37, 0x14, 0x3A);
    for (i = 0; i < 4; i++)
    {
        nullsub_7(i);
        sub_802E12C(i, gUnknown_08400D49);
        if (r4->moves[i] != 0)
            gUnknown_03004348++;
    }
}
