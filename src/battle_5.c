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
extern const struct BattleMove gBattleMoves[];
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern struct Window gUnknown_03004210;
extern const u8 gUnknown_08400D89[];
extern u8 gUnknown_03004348;
extern struct BattlePokemon gBattleMons[];

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
extern void sub_802E12C();
extern void sub_802E1B0(void);

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
