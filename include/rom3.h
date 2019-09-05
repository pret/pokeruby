#ifndef GUARD_ROM3_H
#define GUARD_ROM3_H

struct HpAndStatus
{
    u16 hp;
    u32 status;
};

struct DisableStruct;

void sub_800B858(void);
void SetUpBattleVarsAndBirchPoochyena();
void sub_800B950(void);
void sub_800B9A8(void);
void sub_800BA78(void);
void sub_800BD54(void);
void CreateTasksForSendRecvLinkBuffers(void);
void PrepareBufferDataTransferLink(u8 a, u16, u8 *c);
void Task_HandleSendLinkBuffersData(u8);
void sub_800C35C(void);
void Task_HandleCopyReceivedLinkBuffersData(u8);
void BtlController_EmitGetMonData(u8 a, u8 b, u8 c);
void BtlController_EmitGetRawMonData(u8 a, u8 b, u8 c);
void BtlController_EmitLoadMonSprite(u8 a);
void BtlController_EmitSwitchInAnim(u8, u8, u8);
void BtlController_EmitReturnMonToBall(u8 a, u8 b);
void BtlController_EmitDrawTrainerPic(u8 a);
void BtlController_EmitTrainerSlide(u8 a);
void BtlController_EmitTrainerSlideBack(u8 a);
void BtlController_EmitFaintAnimation(u8 a);
void BtlController_EmitPaletteFade(u8 a);
void BtlController_EmitSuccessBallThrowAnim(u8 a);
void BtlController_EmitBallThrowAnim(u8 a, u8 b);
void BtlController_EmitMoveAnimation(u8 a, u16 b, u8 c, u16 d, s32 e, u8 f, struct DisableStruct *g);
void BtlController_EmitPrintString(u8 a, u16 b);
void BtlController_EmitPrintSelectionString(u8 a, u16 stringID);
void BtlController_EmitChooseAction(u8 a, u8 b, u16 c);
void BtlController_EmitChooseMove(u8 a, u8 b, u8 c, u8 *d);
void BtlController_EmitChooseItem(u8 a, u8 *b);
void BtlController_EmitChoosePokemon(u8 a, u8 b, u8 c, u8 d, u8 *e);
void BtlController_EmitCmd23(u8 a);
void BtlController_EmitHealthBarUpdate(u8 a, u16 b);
void BtlController_EmitExpUpdate(u8 a, u8 b, u16 c);
void BtlController_EmitStatusIconUpdate(u8 a, u32 b, u32 c);
void BtlController_EmitStatusAnimation(u8 a, u8 b, u32 c);
void BtlController_EmitStatusXor(u8 a, u8 b);
void BtlController_EmitDataTransfer(u8, u16, u8 *);
void BtlController_EmitTwoReturnValues(u8 a, u8 b, u16 c);
void BtlController_EmitChosenMonReturnValue(u8 a, u8 b, u8 *c);
void BtlController_EmitOneReturnValue(u8 a, u16 b);
void BtlController_EmitOneReturnValue_Duplicate(u8 a, u16 b);
void BtlController_EmitCmd37(u8 a);
void BtlController_EmitCmd38(u8 a, u8 b);
void BtlController_EmitCmd39(u8 a);
void BtlController_EmitCmd40(u8 a);
void BtlController_EmitHitAnimation(u8 a);
void BtlController_EmitCmd42(u8 a);
void BtlController_EmitPlaySE(u8 a, u16 b);
void BtlController_EmitPlayFanfareOrBGM(u8 a, u16 b);
void BtlController_EmitFaintingCry(u8 a);
void BtlController_EmitIntroSlide(u8 a, u8 b);
void BtlController_EmitIntroTrainerBallThrow(u8 a);
void BtlController_EmitDrawPartyStatusSummary(u8 a, struct HpAndStatus *hpAndStatus, u8 c); //0x30
void BtlController_EmitHidePartyStatusSummary(u8 a);
void BtlController_EmitEndBounceEffect(u8 a);
void BtlController_EmitSpriteInvisibility(u8 a, u8 b);
void BtlController_EmitBattleAnimation(u8 a, u8 b, u16 c);
void BtlController_EmitLinkStandbyMsg(u8 a, u8 b);
void BtlController_EmitResetActionMoveSelection(u8 a, u8 b);
void BtlController_EmitCmd55(u8 a, u8 b);

#endif // GUARD_ROM3_H
