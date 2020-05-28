//**********************************************************************
//		jiki.h
//**********************************************************************
#ifndef	JIKI_H
#define JIKI_H

#include "evobj.h"
#include "cycle.h"

#undef	EXT
#ifdef	JIKI_H_PROTO
#define	EXT	/**/
#else
#define	EXT	extern
#endif

EXT void EvObj_HeroMove(actWork*);								// 自機動作
EXT void HeroMoveControl(u8,u16,u16);							// 動作制御
EXT u8 HeroMoveCheckSite(u8);									// 移動方向ﾁｪｯｸ
EXT u8 HeroMoveCheck(EventOBJ*,s16,s16,u8,u8);					// 移動ﾁｪｯｸ
EXT void SetHeroMoveRequest(u16);								// ﾘｸｴｽﾄｾｯﾄ
EXT void HeroMoveRequest(void);									// ﾘｸｴｽﾄ
EXT void HeroMvStateSet(void);									// 動作状況ｾｯﾄ

EXT u8 HeroAcmdSetChk(void);									// ｺﾏﾝﾄﾞﾁｪｯｸ
EXT u8 HeroAcmdEndChk(void);									// ｺﾏﾝﾄﾞ終了ﾁｪｯｸ
EXT void HeroAcmdModeSet(u8);									// ｺﾏﾝﾄﾞﾓｰﾄﾞｾｯﾄ
EXT u8 HeroAcmdMode(void);										// 状態を返す
EXT void HeroAcmdForceSet(u8);									// 強制ｺﾏﾝﾄﾞｾｯﾄ
EXT void HeroAcmdSet(u8,u8);									// ｺﾏﾝﾄﾞｾｯﾄ
EXT void HeroAcmdWalk1(u8);										// 1ﾄﾞｯﾄ移動
EXT void HeroAcmdWalk2(u8);										// 2ﾄﾞｯﾄ移動
EXT void HeroAcmdWalk3(u8);										// 3ﾄﾞｯﾄ移動
EXT void HeroAcmdWalk4(u8);										// 4ﾄﾞｯﾄ移動
EXT void HeroAcmdDash2(u8);										// 2ﾄﾞｯﾄﾀﾞｯｼｭ移動
EXT void HeroAcmdStopWalk(u8);									// その場歩き
EXT void HeroAcmdStopWalk05(u8);								// その場歩き0.5
EXT void HeroAcmdStop(u8);										// 停止
EXT void HeroAcmdWalkTurn(u8);									// 振り向き
EXT void HeroAcmdJump(u8);										// ｼﾞｬﾝﾌﾟ
EXT void HeroAcmdForceStop(void);								// 強制停止
EXT void HeroAcmdMtbFtUpSite(u8);								// ﾌﾛﾝﾄｱｯﾌﾟ
EXT void HeroAcmdMtbFtUp(u8);									// ﾌﾛﾝﾄｱｯﾌﾟ
EXT void HeroAcmdMtbFtDown(u8);									// ﾌﾛﾝﾄﾀﾞｳﾝ
EXT void HeroAcmdMtbDaniel(u8);									// ﾀﾞﾆｴﾙ
EXT void HeroAcmdMtbDaniel1(u8);								// ﾀﾞﾆｴﾙ1
EXT void HeroAcmdMtbDaniel2(u8);								// ﾀﾞﾆｴﾙ2
EXT void HeroAcmdJumpTurn(u8);									// ｼﾞｬﾝﾌﾟﾀｰﾝ
EXT void HeroAcmdMtbWheelie(u8);								// ｳｲﾘｰ
EXT void HeroAcmdMtbWheelieStart2(u8);							// ｳｲﾘｰ
EXT void HeroAcmdMtbWheelie2(u8);								// ｳｲﾘｰ
EXT void HeroAcmdMtbWheelieEnd2(u8);							// ｳｲﾘｰ

EXT void GetHeroFrontCellPos(s16*,s16*);						// 自機正面座標取得
EXT void GetHeroCellPos(s16*,s16*);								// 座標取得
EXT u8 GetHeroSite(void);										// 方向取得
EXT u8 GetHeroMoveSite(void);									// 移動方向取得
EXT u8 GetHeroHeight(void);										// 高さ取得
EXT void SetHeroMapPos(s16,s16);								// 座標更新
EXT u8 CheckHeroState(u8);										// 自機状態ﾁｪｯｸ
EXT u8 GetHeroState(void);										// 自機状態取得
EXT void ResetHeroForceMove(void);								// 強制移動解除
EXT void SetHeroMoveStateInit(void);							// 動作状況初期化
EXT u8 GetHeroSexObjCode(u8,u8);								// 性別分けOBJｺｰﾄﾞ
EXT u8 GetMainHeroSexObjCode(u8,u8);							// 性別分けOBJｺｰﾄﾞ
EXT u8 GetMainHeroObjCode(u8);									// 性別分けOBJｺｰﾄﾞ
EXT u8 GetHeroObjCodeSex(u8);									// OBJｺｰﾄﾞ->性別
EXT u8 GetMainHeroObjCodeSex(u8);								// OBJｺｰﾄﾞ->性別
EXT u8 CheckHeroNaminoriStart(void);							// 波乗り開始ﾁｪｯｸ
EXT u8 CheckHeroTakinoboriStart(void);							// 滝登り開始ﾁｪｯｸ
EXT u8 CheckHeroAttrNaminoriStart(void);						// 波乗り開始ｱﾄﾘﾋﾞｭｰﾄﾁｪｯｸ
EXT u8 GetHeroActorNumber(void);								// ｱｸﾀｰﾜｰｸﾅﾝﾊﾞ取得

EXT void MyMoveStateInit(void);									// MyMoveState初期化
EXT void MyMoveStateMvFlagSet(u8);								// 動作ﾌﾗｸﾞｾｯﾄ
EXT u8 MyMoveStateObjCodeFlag(u8,u8);							// OBJｺｰﾄﾞ->動作ﾌﾗｸﾞ
EXT u8 MyMoveStateFlagObjCode(void);							// 動作ﾌﾗｸﾞ->OBJｺｰﾄﾞ
EXT void MyMoveStateObjCodeRequest(u8,u8);						// ﾌﾗｸﾞｾｯﾄ&ﾘｸｴｽﾄ

EXT void SetJikiActor(s16,s16,u8,u8);							// 自機ｱｸﾀｰｾｯﾄ
EXT void SetHeroObjVanish(u8);									// 自機OBJ表示ON,OFF
EXT void ChangeHeroActorHiden(void);							// 秘伝技ｱｸﾀｰへ変更
EXT void ChangeHeroActorFishing(u8);							// 釣りｱｸﾀｰへ変更
EXT void ChangeHeroActorCycleFtUp(u8);							// 自転車ﾌﾛﾝﾄｱｯﾌﾟ変更
EXT void ChangeHeroActorJorro(u8);								// 如雨露ｱｸﾀｰへ変更

EXT void SetHeroFishingTask(u8);								// 釣り

#ifdef PM_DEBUG
EXT u8 HeroDebugMove(u8);										// ﾃﾞﾊﾞｯｸ移動
#endif

#undef	EXT
#endif	// JIKI_H
