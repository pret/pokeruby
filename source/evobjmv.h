//**********************************************************************
//		evobjmv.h
//**********************************************************************
#ifndef EVOBJMV_H
#define	EVOBJMV_H

#include "evobj.def"

#undef	EXT
#ifdef 	EVOBJMV_H_PROTO
#define	EXT	/**/
#else
#define	EXT extern
#endif

EXT	void EvObj_DmyMove(actWork*);							// 動作無し
EXT void EvObj_RandomMove(actWork*);						// ﾗﾝﾀﾞﾑ移動
EXT void EvObj_DirectMove(actWork*);						// 向き変え
EXT void EvObj_VMove(actWork*);								// 垂直方向移動
EXT void EvObj_HMove(actWork*);								// 水平方向移動
EXT void EvObj_DirectSite(actWork*);						// 固定方向
EXT void EvObj_Seed(actWork*);								// たね
EXT void EvObj_DirectVSite(actWork*);						// 垂直方向
EXT void EvObj_DirectHSite(actWork*);						// 水平方向
EXT void EvObj_DirectULSite(actWork*);						// 上左方向
EXT void EvObj_DirectURSite(actWork*);						// 上右方向
EXT void EvObj_DirectDLSite(actWork*);						// 下左方向
EXT void EvObj_DirectDRSite(actWork*);						// 下右方向
EXT void EvObj_DirectLVSite(actWork*);						// 上下左方向
EXT void EvObj_DirectRVSite(actWork*);						// 上下右方向
EXT void EvObj_DirectUHSite(actWork*);						// 左右上方向
EXT void EvObj_DirectDHSite(actWork*);						// 左右下方向
EXT void EvObj_DirectSpinL(actWork*);						// 回転方向左周り
EXT void EvObj_DirectSpinR(actWork*);						// 回転方向右回り
EXT void EvObj_Route2Pos(actWork*);							// ﾙｰﾄ2
EXT void EvObj_RouteURLD(actWork*);							// ﾙｰﾄ3 URLD
EXT void EvObj_RouteRLDU(actWork*);							// ﾙｰﾄ3 RLDU
EXT void EvObj_RouteDURL(actWork*);							// ﾙｰﾄ3 RLDU
EXT void EvObj_RouteLDUR(actWork*);							// ﾙｰﾄ3 DURL
EXT void EvObj_RouteULRD(actWork*);							// ﾙｰﾄ3 LDUR
EXT void EvObj_RouteLRDU(actWork*);							// ﾙｰﾄ3 LRDU
EXT void EvObj_RouteDULR(actWork*);							// ﾙｰﾄ3 DULR
EXT void EvObj_RouteRDUL(actWork*);							// ﾙｰﾄ3 RDUL
EXT void EvObj_RouteLUDR(actWork*);							// ﾙｰﾄ3 LUDR
EXT void EvObj_RouteUDRL(actWork*);							// ﾙｰﾄ3 UDRL
EXT void EvObj_RouteRLUD(actWork*);							// ﾙｰﾄ3 RLUD
EXT void EvObj_RouteDRLU(actWork*);							// ﾙｰﾄ3 DRLU
EXT void EvObj_RouteRUDL(actWork*);							// ﾙｰﾄ3 RUDL
EXT void EvObj_RouteUDLR(actWork*);							// ﾙｰﾄ3 UDLR
EXT void EvObj_RouteLRUD(actWork*);							// ﾙｰﾄ3 LRUD
EXT void EvObj_RouteDLRU(actWork*);							// ﾙｰﾄ3 DLRU
EXT void EvObj_RouteUL(actWork*);							// ﾙｰﾄ4 UL
EXT void EvObj_RouteDR(actWork*);							// ﾙｰﾄ4 DR
EXT void EvObj_RouteLD(actWork*);							// ﾙｰﾄ4 LD
EXT void EvObj_RouteRU(actWork*);							// ﾙｰﾄ4 RU
EXT void EvObj_RouteUR(actWork*);							// ﾙｰﾄ4 UR
EXT void EvObj_RouteDL(actWork*);							// ﾙｰﾄ4 DL
EXT void EvObj_RouteLU(actWork*);							// ﾙｰﾄ4 LU
EXT void EvObj_RouteRD(actWork*);							// ﾙｰﾄ4 RD
EXT void EvObj_CopyMove(actWork*);							// 物真似
EXT void EvObj_CopyMoveGrass(actWork*);						// 物真似草
EXT void EvObj_HideWood(actWork*);							// 隠れ蓑木
EXT void EvObj_HideRock(actWork*);							// 隠れ蓑岩
EXT void EvObj_HideSand(actWork*);							// 隠れ蓑砂
EXT void EvObj_StayWalk1(actWork*);							// その場歩き
EXT void EvObj_StayWalk2(actWork*);							// その場歩き
EXT void EvObj_StayWalk4(actWork*);							// その場歩き
EXT void EvObj_Vanish(actWork*);							// 透明

EXT u8 EvActAnmNoStop(u8);									// ｾﾙｱﾆﾒﾅﾝﾊﾞ 停止
EXT u8 EvActAnmNoWalk1(u8);									// ｾﾙｱﾆﾒﾅﾝﾊﾞ 1ﾄﾞｯﾄ
EXT u8 EvActAnmNoWalk2(u8);									// ｾﾙｱﾆﾒﾅﾝﾊﾞ 2ﾄﾞｯﾄ
EXT u8 EvActAnmNoWalk4(u8);									// ｾﾙｱﾆﾒﾅﾝﾊﾞ 4ﾄﾞｯﾄ
EXT u8 EvActAnmNoWalk8(u8);									// ｾﾙｱﾆﾒﾅﾝﾊﾞ 8ﾄﾞｯﾄ
EXT u8 EvActAnmNoSwimJump(u8);								// ｾﾙｱﾆﾒﾅﾝﾊﾞ 波乗りｼﾞｬﾝﾌﾟ
EXT u8 EvActAnmNoFtUp(u8);									// ｾﾙｱﾆﾒﾅﾝﾊﾞ ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟ
EXT u8 EvActAnmNoRtUp(u8);									// ｾﾙｱﾆﾒﾅﾝﾊﾞ ﾘｱﾀｲﾔｱｯﾌﾟ
EXT u8 EvActAnmNoFtDown(u8);								// ｾﾙｱﾆﾒﾅﾝﾊﾞ ﾌﾛﾝﾄﾀｲﾔﾀﾞｳﾝ
EXT u8 EvActAnmNoRtDown(u8);								// ｾﾙｱﾆﾒﾅﾝﾊﾞ ﾘｱﾀｲﾔﾀﾞｳﾝ
EXT u8 EvActAnmNoWheelie(u8);								// ｾﾙｱﾆﾒﾅﾝﾊﾞ ｳｲﾘｰ
EXT u8 EvActAnmNoFishingStart(u8);							// ｾﾙｱﾆﾒﾅﾝﾊﾞ 釣り開始
EXT u8 EvActAnmNoDash(u8);									// ｾﾙｱﾆﾒﾅﾝﾊﾞ ﾀﾞｯｼｭ
EXT u8 EvActAnmNoFishingEnd(u8);							// ｾﾙｱﾆﾒﾅﾝﾊﾞ 釣り終了
EXT u8 EvActAnmNoFishingHit(u8);							// ｾﾙｱﾆﾒﾅﾝﾊﾞ 釣りﾋｯﾄ

EXT void EvObjMvCodeChg(EventOBJ*,u8);						// 動作ｺｰﾄﾞ変更
EXT u8 EvObjMvCodeStopSite(u8);								// 動作ｺｰﾄﾞ	停止

EXT u8 EvObjMoveChkSite(EventOBJ*,u8);						// 移動判定
EXT u8 EvObjMoveChk(EventOBJ*,s16,s16,u8);					// 移動判定
EXT u8 EvObjMoveHitChk(EventOBJ*,s16,s16);					// OBJ 当たり判定
EXT u8 EvObjSeedEffectCheck(u8,u8,u8);						// たねOBJｴﾌｪｸﾄﾁｪｯｸ
EXT void EvObjSeedEffectOff(u8,u8,u8);						// たねOBJｴﾌｪｸﾄｵﾌ

EXT void SitePosMove(u8,s16*,s16*);							// 座標移動
EXT void SitePosMoveFull(u8,s16*,s16*);						// 座標移動 ｾﾙ単位
EXT void SitePosAdd(u8,s16*,s16*,s16,s16);					// 座標移動 方向
EXT void MapCellSizePos(s16,s16,s16*,s16*);					// ﾏｯﾌﾟ->ﾄﾞｯﾄ座標取得
EXT void MapCellSizePosDiff(s16,s16,s16*,s16*);				// ﾏｯﾌﾟ->ﾄﾞｯﾄ座標取得
EXT void MapCellSizePosDiffOffs(s16*,s16*,s16,s16);			// ﾏｯﾌﾟ->ﾄﾞｯﾄ座標取得
EXT void MapCellSizeDiff(s16*,s16*);						// ｾﾙｻｲｽﾞ修正座標取得
EXT void EvObjSitePosMoveWork(EventOBJ*,u8,s16*,s16*);		// 現座標移動ﾜｰｸｾｯﾄ
EXT u8 SiteOpposite(u8);									// 方向 -> 向かい側方向
EXT u8 FrontSite(u8,u8);									// 正面方向
EXT u8 FrontChgSite(u8,u8,u8);								// 正面方向変換

EXT u8 AcmdSetChk(EventOBJ*);								// ｺﾏﾝﾄﾞｾｯﾄﾁｪｯｸ
EXT u8 AcmdActionChk(EventOBJ*);							// ｺﾏﾝﾄﾞ動作ﾁｪｯｸ
EXT u8 AcmdSet(EventOBJ*,u8);								// ｺﾏﾝﾄﾞｾｯﾄ
EXT void AcmdForceSet(EventOBJ*,u8);						// 強制ｺﾏﾝﾄﾞｾｯﾄ
EXT void AcmdFree(EventOBJ*);								// ｺﾏﾝﾄﾞ解除
EXT void AcmdFreeWork(EventOBJ*);							// ｺﾏﾝﾄﾞﾜｰｸｸﾘｱ
EXT u8 AcmdEndChk(EventOBJ*);								// ｺﾏﾝﾄﾞ終了ﾁｪｯｸ
EXT	u8 AcmdEnd(EventOBJ*);									// 終了ﾁｪｯｸ & 解除
EXT u8 AcmdCode(EventOBJ*);									// ｺﾏﾝﾄﾞｺｰﾄﾞ取得
EXT void AcmdBranch(EventOBJ*,actWork*,u8 (*)(EventOBJ*,actWork*));	// ｺﾏﾝﾄﾞﾙｰﾁﾝｼｰｹﾝｽ

EXT u8 AcmdCodeStopSite(u8);								// 方向ｺｰﾄﾞ
EXT u8 AcmdCodeWalk05(u8);									// 0.5ﾄﾞｯﾄ移動ｺｰﾄﾞ
EXT u8 AcmdCodeWalk1(u8);									// 1ﾄﾞｯﾄ移動ｺｰﾄﾞ
EXT u8 AcmdCodeWalk2(u8);									// 2ﾄﾞｯﾄ移動ｺｰﾄﾞ
EXT u8 AcmdCodeWalk3(u8);									// 3ﾄﾞｯﾄ移動ｺｰﾄﾞ
EXT u8 AcmdCodeWalk4(u8);									// 4ﾄﾞｯﾄ移動ｺｰﾄﾞ
EXT u8 AcmdCodeWalk8(u8);									// 8ﾄﾞｯﾄ移動ｺｰﾄﾞ
EXT u8 AcmdCodeDash2(u8);									// 2ﾄﾞｯﾄﾀﾞｯｼｭ移動ｺｰﾄﾞ
EXT u8 AcmdCodeJump2(u8);									// 2ｾﾙｼﾞｬﾝﾌﾟｺｰﾄﾞ
EXT u8 AcmdCodeJump1(u8);									// 1ｾﾙｼﾞｬﾝﾌﾟｺｰﾄﾞ
EXT u8 AcmdCodeStayJump(u8);								// その場ｼﾞｬﾝﾌﾟｺｰﾄﾞ
EXT u8 AcmdCodeStayTurnJump(u8);							// その場ｼﾞｬﾝﾌﾟ振り向きｺｰﾄﾞ
EXT u8 AcmdCodeSwimJump(u8);								// 波乗りｼﾞｬﾝﾌﾟｺﾏﾝﾄﾞ
EXT u8 AcmdCodeStayWalk05(u8);								// 0.5ﾄﾞｯﾄその場歩きｺｰﾄﾞ
EXT u8 AcmdCodeStayWalk1(u8);								// 1ﾄﾞｯﾄその場歩きｺｰﾄﾞ
EXT u8 AcmdCodeStayWalk2(u8);								// 2ﾄﾞｯﾄその場歩きｺｰﾄﾞ
EXT u8 AcmdCodeStayWalk4(u8);								// 4ﾄﾞｯﾄその場歩きｺｰﾄﾞ
EXT u8 AcmdCodeTurnSiteSet(EventOBJ*,u8);					// 振り向き専用ｺｰﾄﾞｾｯﾄ
EXT u8 AcmdCodeMtbFtUpSite(u8);								// ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟｺｰﾄﾞ
EXT u8 AcmdCodeMtbFtUp(u8);									// ﾌﾛﾝﾄﾀｲﾔｱｯﾌﾟｺｰﾄﾞ
EXT u8 AcmdCodeMtbFtDown(u8);								// ﾌﾛﾝﾄﾀｲﾔﾀﾞｳﾝｺｰﾄﾞ
EXT u8 AcmdCodeMtbDaniel(u8);								// ﾀﾞﾆｴﾙｺｰﾄﾞ
EXT u8 AcmdCodeMtbDaniel1(u8);								// ﾀﾞﾆｴﾙ1ｺｰﾄﾞ
EXT u8 AcmdCodeMtbDaniel2(u8);								// ﾀﾞﾆｴﾙ2ｺｰﾄﾞ
EXT u8 AcmdCodeMtbWheelie(u8);								// ｳｲﾘｰｺｰﾄﾞ
EXT u8 AcmdCodeMtbWheelieStart2(u8);						// ｳｲﾘｰ開始移動ｺｰﾄﾞ
EXT u8 AcmdCodeMtbWheelie2(u8);								// ｳｲﾘｰ移動ｺｰﾄﾞ
EXT u8 AcmdCodeMtbWheelieEnd2(u8);							// ｳｲﾘｰ終了移動2ｺｰﾄﾞ

EXT void AcmdAction(EventOBJ*,actWork*);					// ｱﾆﾒｰｼｮﾝｺﾏﾝﾄﾞｱｸｼｮﾝ
EXT u8 CmdAction(EventOBJ*,actWork*);						// ｺﾏﾝﾄﾞｱｸｼｮﾝ
EXT void CmdActionSet(EventOBJ*,actWork*,u8);				// ｺﾏﾝﾄﾞｱｸｼｮﾝｾｯﾄ

EXT void EvObjBanish(EventOBJ*,actWork*);					// OBJ表示判定
EXT u8 EvMapAttrJumpChk(s16,s16,u8);						// ｼﾞｬﾝﾌﾟｱﾄﾘﾋﾞｭｰﾄ
EXT u8 EvObjHeightBgPri(u8);								// 高さ->BGﾌﾟﾗｲｵﾘﾃｨ
EXT void EvObjHeight(EventOBJ*);							// 高さｾｯﾄ
EXT void EvActHeightSet(actWork*,u8);						// 高さﾊﾟﾗﾒﾀｾｯﾄ
EXT void EvActPriControl(u8,actWork*,u8);					// ﾌﾟﾗｲｵﾘﾃｨｾｯﾄ
EXT u8 HeightHitChk(u8,u8);									// 高さﾋｯﾄﾁｪｯｸ

EXT u8 EvObjPause(EventOBJ*);								// ﾎﾟｰｽﾞ
EXT void EvObjPauseAll(void);								// ﾎﾟｰｽﾞ ALL
EXT	void EvObjPauseAlmost(u8);								// ﾎﾟｰｽﾞ 指定以外ALL
EXT void EvObjPauseClr(EventOBJ*);							// ﾎﾟｰｽﾞｸﾘｱ
EXT void EvObjPauseClrAll(void);							// ﾎﾟｰｽﾞｸﾘｱ ALL

EXT void EvActMove1(actWork*,u8);							// ｱｸﾀ 1dot
EXT void EvActMove2(actWork*,u8);							// ｱｸﾀ 2dot
EXT void EvActMove4(actWork*,u8);							// ｱｸﾀ 4dot
EXT void EvActMove8(actWork*,u8);							// ｱｸﾀ 8dot
EXT s16 EvActMoveJumpVoffs(s16,u8);							// ｱｸﾀ ｼﾞｬﾝﾌﾟ
EXT void EvActScrollVanish(actWork*,u8);					// ｱｸﾀｽｸﾛｰﾙﾊﾞﾆｯｼｭ
EXT void EvObjDmyActMove(actWork*);							// ﾌｨｰﾙﾄﾞOBJﾀﾞﾐｰｱｸﾀ動作
EXT void EvObjDmyActSiteChg(u8,u8);							// ﾀﾞﾐｰｱｸﾀｰ方向変更

#undef EXT
#endif // EVOBJMV_H
