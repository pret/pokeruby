#ifndef GUARD_CONTEST_INTERNAL_H
#define GUARD_CONTEST_INTERNAL_H

void InitContestResources(void);
void Task_StartContestWaitFade(u8 taskId);
void Task_TryStartLinkContest(u8 taskId);
void Task_CommunicateMonIdxs(u8 taskId);
void Task_EndCommunicateMonIdxs(u8 taskId);
void Task_ReadyStartLinkContest(u8 taskId);
u8 SetupContestGraphics(u8 *a);
void Task_WaitToRaiseCurtainAtStart(u8 taskId);
void Task_RaiseCurtainAtStart(u8 taskId);
void ContestMainCallback2(void);
void ContestVBlankCallback(void);
void Task_DisplayAppealNumberText(u8 taskId);
void sub_80ABC3C(u8);
void Task_TryShowMoveSelectScreen(u8 taskId);
void Task_ShowMoveSelectScreen(u8 taskId);
void Task_HandleMoveSelectInput(u8 taskId);
void DrawMoveSelectArrow(s8 a);
void EraseMoveSelectArrow(s8 a); // nullsub
void Task_SelectedMove(u8 taskId);
void Task_EndCommunicateMoveSelections(u8 taskId);
void Task_HideMoveSelectScreen(u8 taskId);
void Task_HideApplauseMeterForAppealStart(u8 taskId);
void Task_WaitHideApplauseMeterForAppealStart(u8 taskId);
void Task_AppealSetup(u8 taskId);
void Task_DoAppeals(u8 taskId);
void Task_EndWaitForLink(u8 taskId);
void SpriteCB_MonSlideIn(struct Sprite *sprite);
void SpriteCB_MonSlideOut(struct Sprite *sprite);
void Task_FinishRoundOfAppeals(u8 taskId);
void Task_ReadyUpdateHeartSliders(u8 taskId);
void Task_UpdateHeartSliders(u8 taskId);
void Task_WaitForHeartSliders(u8 taskId);
void sub_80ADB04(u8 taskId);
void Task_WaitBeforePrintRoundResult(u8 taskId);
void Task_PrintRoundResultText(u8 taskId);
void Task_WaitPrintRoundResultText(u8 taskId);
void Task_ReUpdateHeartSliders(u8 taskId);
void Task_WaitForHeartSlidersAgain(u8 taskId);
void Task_DropCurtainAtRoundEnd(u8 taskId);
void Task_TryStartNextRoundOfAppeals(u8 taskId);
void Task_StartNewRoundOfAppeals(u8 taskId);
void Task_EndAppeals(u8 taskId);
void Task_WaitForOutOfTimeMsg(u8 taskId);
void Task_DropCurtainAtAppealsEnd(u8 taskId);
void Task_TryCommunicateFinalStandings(u8 taskId);
void Task_CommunicateFinalStandings(u8 taskId);
void Task_EndCommunicateFinalStandings(u8 taskId);
void Task_ContestReturnToField(u8 taskId);
void FieldCB_ContestReturnToField(void);
void InsertStringDigit(u8 *, s32);
bool8 IsPlayerLinkLeader(void);
void __copy_tilemap(void *);
void PrintContestantTrainerName(u8 contestant);
void PrintContestantTrainerNameWithColor(u8 contestant, u8 color);
void PrintContestantMonName(u8 contestant);
void PrintContestantMonNameWithColor(u8 contestant, u8 color);
u8 CreateJudgeSprite(void);
u8 CreateJudgeSpeechBubbleSprite(void);
u8 CreateContestantSprite(u16, u32, u32);
void SwapMoveDescAndContestTilemaps(void);
void PrintContestMoveDescription(u16);
void Contest_ClearMoveDescriptionBox(void);
bool8 UpdateConditionStars(u8, u8);
bool8 DrawStatusSymbol(u8);
void DrawStatusSymbols(void);
void ContestClearGeneralTextWindow(void);
u16 GetChosenMove(u8);
void GetAllChosenMoves(void);
void sub_80AF2A0(u8);
void RankContestants(void);
void SetAttentionLevels(void);
s16 GetContestantRound2Points(u8 a);
void DetermineFinalStandings(void);
bool8 DidContestantPlaceHigher(s32 a, s32 b, struct ContestFinalStandings *c);
void ContestPrintLinkStandby(void);
void sub_80AF94C(u8);
void FillContestantWindowBgs(void);
u16 GetAppealHeartTileOffset(u8 a);
s8 GetNumHeartsFromAppealPoints(s16 a);
u8 UpdateAppealHearts(s16 startAppeal, s16 appealDelta, u8 contestant);
void Task_UpdateAppealHearts(u8 taskId);
void CreateSliderHeartSprites(void);
void UpdateHeartSliders(void);
bool8 SlidersDoneUpdating(void);
void sub_80AFF60(struct Sprite *);
void SetBottomSliderHeartsInvisibility(bool8);
void CreateNextTurnSprites(void);
void CreateApplauseMeterSprite(void);
void nullsub_18(s8);
void sub_80B0238(struct Sprite *);
void sub_80B0280(struct Sprite *);
void sub_80B02A8(struct Sprite *);
void sub_80B02F4(struct Sprite *);
void CreateJudgeAttentionEyeTask(void);
void sub_80B03A8(u8);
void sub_80B03D8(u8);
void sub_80B0458(u8);
void CreateUnusedBlendTask(void);
void InitUnusedBlendTaskData(u8 contestant);
void UpdateBlendTaskContestantData(u8 contestant);
void nullsub_19(int);
void Task_UnusedBlend(u8 taskId);
void Task_UnusedBrokenBlend(u8 taskId);
void StartStopFlashJudgeAttentionEye(u8);
u8 CreateContestantBoxBlinkSprites(u8);
void BlinkContestantBox(u8, bool8);
void SpriteCB_BlinkContestantBox(struct Sprite *);
void SpriteCB_EndBlinkContestantBox(struct Sprite *);
void Unused_EndBlinkingState(u8 a, int unused);
void ContestDebugTogglePointTotal(void);
void ContestDebugDoPrint(void);
void DrawContestantWindows(void);
void CalculateAppealMoveImpact(u8 contestant);
void PrintAppealMoveResultText(u8, u8);
void ApplyNextTurnOrder(void);
void DoJudgeSpeechBubble(u8);
void UpdateApplauseMeter(void);
u8 StartApplauseOverflowAnimation(void);
void Task_ApplauseOverflowAnimation(u8);
void SlideApplauseMeterIn(void);
void Task_SlideApplauseMeterIn(u8);
void SlideApplauseMeterOut(void);
void Task_SlideApplauseMeterOut(u8);
void ShowAndUpdateApplauseMeter(s8);
void Task_ShowAndUpdateApplauseMeter(u8);
void AnimateAudience(void);
void Task_AnimateAudience(u8);
void BlendAudienceBackground(s8 excitementDir, s8 blendDir);
void Task_BlendAudienceBackground(u8 taskId);
void ShowHideNextTurnGfx(bool8 a);
const u8 *GetTurnOrderNumberGfx(u8);
void DrawUnnervedSymbols(void);
void SetBgForCurtainDrop(void);
void UpdateContestantBoxOrder(void);
void Task_StartDropCurtainAtRoundEnd(u8 taskId);
void Task_UpdateCurtainDropAtRoundEnd(u8 taskId);
void Task_ResetForNextRound(u8 taskId);
void Task_WaitRaiseCurtainAtRoundEnd(u8 taskId);
void Task_StartRaiseCurtainAtRoundEnd(u8 taskId);
void AnimateSliderHearts(u8 animId);
void Task_WaitForSliderHeartAnim(u8 taskId);
u16 SanitizeMove(u16 move);
u16 SanitizeSpecies(u16 species);
void SetMoveSpecificAnimData(u8 contestant);
void ClearMoveAnimData(u8 contestant);
void SetMoveAnimAttackerData(u8 contestant);
void CreateInvisibleBattleTargetSprite(void);
void SetBattleTargetSpritePosition(void);
void SelectContestMoveBankTarget(u16);

#endif //GUARD_CONTEST_INTERNAL_H