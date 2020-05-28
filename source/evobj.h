//**********************************************************************
//		evobj.h
//**********************************************************************
#ifndef	EVOBJ_H
#define	EVOBJ_H

#include "actor.h"
#include "actanm.h"
#include "evobj.def"
#include "evobjdef.h"
#include "evobjmv.h"
#include "evobjdat.h"
#include "evobjcmd.h"
#include "evobjeff.h"
#include "ev_trai.h"

#undef	EXT
#ifdef 	EVOBJ_H_PROTO
#define	EXT	/**/
#else
#define	EXT extern
#endif

EXT EventOBJ EvObj[];												// ｲﾍﾞﾝﾄ OBJ ﾜｰｸ
EXT MvCmd	MyMoveState;											// 自機動作管理
EXT const u8 EvObjRefPalNoTbl[];									// 映り込みﾊﾟﾚｯﾄNoﾃｰﾌﾞﾙ

EXT void EvObjWorkInit(EventOBJ*);									// ｲﾍﾞﾝﾄ OBJ ﾜｰｸ初期化
EXT void EvObjWorkAllInit(void);									// ｲﾍﾞﾝﾄ OBJ ﾜｰｸ全初期化
EXT void EvObjInit(void);											// ﾜｰｸ全初期化
EXT u8 EvObjEmptyWorkSeek(void);									// 空ﾜｰｸｼｰｸ
EXT u8 EvObjIdSeek(u8,u8,u8);										// ID -> ﾜｰｸﾅﾝﾊﾞ
EXT u8 EvObjIdPosGet(u8,u8,u8,u8*);									// ﾜｰｸﾅﾝﾊﾞ & ﾌﾗｸﾞ
EXT u8 EvObjWorkMapPosGet(s16,s16);									// ﾏｯﾌﾟ座標 -> ﾜｰｸﾅﾝﾊﾞ
EXT u8 EvObjAddWork(const evObjData*,u8,u8);						// ｲﾍﾞﾝﾄ OBJ ﾜｰｸｾｯﾄ
EXT u8 EvObjWorkAdd(u8);											// ｲﾍﾞﾝﾄ OBJ ﾜｰｸ追加
EXT void EvObjDel(EventOBJ*);										// ｲﾍﾞﾝﾄ OBJ 削除
EXT void EvObjDelId(u8,u8,u8);										// ｲﾍﾞﾝﾄ OBJ ID 削除
EXT void EvObjMapDel(void);											// 主人公以外削除
EXT u8 EvObjAdd(const evObjData*,actHeader*,u8,u8,s16,s16);			// ｲﾍﾞﾝﾄ OBJ登録
EXT u8 EvObjSxyAdd(const evObjData*,u8,u8,s16,s16);					// SXYﾃﾞｰﾀ -> ｲﾍﾞﾝﾄOBJ登録
EXT u8 EvObjSxyAddNow(const evObjData*);							// SXYﾃﾞｰﾀ -> ｲﾍﾞﾝﾄOBJ登録
EXT u8 EvObjMakeSxyAdd(u8,u8,u8,s16,s16,u8);						// SXY生成->ｲﾍﾞﾝﾄOBJ登録
EXT u8 EvObjAddId(u8,u8,u8);										// ID -> ｲﾍﾞﾝﾄOBJ登録
EXT void EvMoveMakeHead(u16,void (*)(actWork*),actHeader*,OAMPatSt**);	// ｱｸﾀｰﾍｯﾀﾞ生成
EXT u8 EvObjMakeAddAct(u16,void (*)(actWork*),s16,s16,u8);			// ｱｸﾀｰﾍｯﾀﾞ生成,追加
EXT u8 EvObjDmyAddAct(u8,u8,s16,s16,u8,u8);							// ﾌｨｰﾙﾄﾞOBJﾀﾞﾐｰｱｸﾀｰ追加
EXT void EvMakeHead(u16,u16,actHeader*,OAMPatSt**);					// ｱｸﾀｰﾍｯﾀﾞ生成 ｺｰﾄﾞ
EXT void MakeSxyActHead(const evObjData*,actHeader*,OAMPatSt**);	// SXYﾃﾞｰﾀ -> ｱｸﾀｰﾍｯﾀﾞ
EXT void EvObjRecover(s16,s16);										// ｲﾍﾞﾝﾄ OBJ 復帰
EXT void EvObjAddControl(s16,s16);									// ﾏｯﾌﾟﾃﾞｰﾀ OBJ 登録
EXT void EvObjPosChg(EventOBJ*,s16,s16);							// 座標更新
EXT void EvObjPosInit(EventOBJ*,s16,s16);							// 座標初期化
EXT	void EvObjPosAllChg(EventOBJ*,s16,s16);							// 座標更新
EXT	void EvObjPosAllChgId(u8,u8,u8,s16,s16);						// 座標更新
EXT void EvObjPosMove(EventOBJ*,s16,s16);							// 座標移動, 更新
EXT void EvObjPosRenew(EventOBJ*);									// 現座標更新
EXT void EvObjMapChgCont(void);										// ﾏｯﾌﾟ切り替わり座標修正
EXT u8 EvObjHitCheck(u16,u16,u8);									// ｲﾍﾞﾝﾄ用　OBJ座標判定
EXT void EvObjMainControl(s16,s16);									// ｲﾍﾞﾝﾄ OBJ ｺﾝﾄﾛｰﾙ
EXT u8 SetScrollTaskAct(u8);										// ｱｸﾀｰ同期ｽｸﾛｰﾙﾀｽｸｾｯﾄ
EXT void FldScrollPosInit(void);									// ｽｸﾛｰﾙ初期化
EXT void FldScrollActChg(u8);										// ｽｸﾛｰﾙｱｸﾀｰﾁｪﾝｼﾞ
EXT u8 FldScrollActNo(void);										// ｽｸﾛｰﾙｱｸﾀｰﾅﾝﾊﾞ
EXT void FldScrollActStop(void);									// ｽｸﾛｰﾙｽﾄｯﾌﾟ
EXT void EvObjPalManInit(void);										// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化
EXT void EvObjPalSet(u16);											// ｲﾍﾞﾝﾄ OBJ 用ﾊﾟﾚｯﾄ登録
EXT void EvObjPalSets(u16*);										// ﾊﾟﾚｯﾄ登録 複数
EXT	void EvObjStayPalSet(u16,u8);									// 常駐ﾊﾟﾚｯﾄｾｯﾄ
EXT void EvObjStayPalSets(const u16*,u8,u8);						// 常駐ﾊﾟﾚｯﾄｾｯﾄ 複数
EXT u8 EvObjPalTblSeek(u16);										// ﾊﾟﾚｯﾄﾃｰﾌﾞﾙｼｰｸ
EXT void EvObjHeroPalSet(u16,u8);									// 主人公ﾊﾟﾚｯﾄｾｯﾄ
EXT void EvObjSpPalSet(u16,u8);										// 特殊ﾊﾟﾚｯﾄｾｯﾄ
EXT u8 CopyActPri0(actWork*,s16,s16,u8);							// ｺﾋﾟｰｱｸﾀｰ
EXT u8 CopyActPri1(actWork*,s16,s16,u8);							// ｺﾋﾟｰｱｸﾀｰ
EXT void EvObjSiteSet(EventOBJ*,u8);								// 方向ｾｯﾄ
EXT void EvObjGraphicInit(u8);										// OBJｸﾞﾗﾌｨｯｸ関連初期化
EXT u16 EvObjPalIdGet(u8);											// ﾊﾟﾚｯﾄNo -> ID
EXT	void EvObjChgParam(EventOBJ*,u8);								// ｲﾍﾞﾝﾄOBJﾊﾟﾗﾒﾀ変更
EXT void EvObjChgParamId(u8,u8,u8,u8);								// ｲﾍﾞﾝﾄOBJﾊﾟﾗﾒﾀ変更
EXT	void EvObjChgSite(EventOBJ*,u8);								// ｲﾍﾞﾝﾄOBJ方向変更
EXT	void EvObjChgSiteId(u8,u8,u8,u8);								// ｲﾍﾞﾝﾄOBJ方向変更
EXT void MvCmdChgSite(MvCmd*,u8);									// MvCmd型方向変更
EXT void EvObjSeedSetParam(EventOBJ*,actWork*);						// 種用ﾊﾟﾗﾒﾀ変更
EXT SXYObjHead* SxyObjHeadGet(u8);									// OBJｽﾃｰﾀｽﾍｯﾀﾞ取得
EXT void EvObjCodeWorkChk(EventOBJ*);								// OBJ ｺｰﾄﾞﾜｰｸﾁｪｯｸ
EXT void EvObjBanishSet(u8,u8,u8,u8);								// OBJ ﾊﾞﾆｯｼｭｾｯﾄ
EXT void EvObjIdWorkSet(EventOBJ*,void*,void*,void*);				// ID ﾜｰｸ格納
EXT void EvObjMapPosMvFlagOn(s16,s16);								// ﾏｯﾌﾟ座標OBJﾌﾗｸﾞON
EXT void EvObjPriChg(u8,u8,u8,u8);									// 表示ﾌﾟﾗｲｵﾘﾃｨ変更
EXT void EvObjPriChgOff(u8,u8,u8);									// 表示ﾌﾟﾗｲｵﾘﾃｨﾌﾗｸﾞｵﾌ
EXT void EvObjSetOffset(u8,u8,u8,s16,s16);							// 表示ｵﾌｾｯﾄｾｯﾄ
EXT const VM_CODE* EvObjEvLabelGet(u8,u8,u8);						// ｲﾍﾞﾝﾄﾗﾍﾞﾙ取得
EXT u16	EvObjEvFlagGet(u8,u8,u8);									// ｲﾍﾞﾝﾄﾌﾗｸﾞ取得
EXT u8 EvObjEvTypeGet(u8,u8,u8);									// ｲﾍﾞﾝﾄﾀｲﾌﾟ取得
EXT u8 EvObjEvWorkGet(u8,u8,u8);									// ｲﾍﾞﾝﾄﾜｰｸ取得
EXT const VM_CODE* EvObjNoEvLabelGet(u8);							// ｲﾍﾞﾝﾄﾗﾍﾞﾙ取得 ﾜｰｸﾅﾝﾊﾞ
EXT u16	EvObjNoEvFlagGet(u8);										// ｲﾍﾞﾝﾄﾌﾗｸﾞ取得 ﾜｰｸﾅﾝﾊﾞ
EXT u8 EvObjNoEvTypeGet(u8);										// ｲﾍﾞﾝﾄﾀｲﾌﾟ取得 ﾜｰｸﾅﾝﾊﾞ
EXT u8 EvObjNoEvWorkGet(u8);										// ｲﾍﾞﾝﾄﾜｰｸ取得	ﾜｰｸﾅﾝﾊﾞ

EXT void EvObjSxyIdPosChange( u8 obj_id, u8 map_id, u8 div_id );
EXT void EvObjSxyMvCodeChange( EventOBJ * obj, u8 code );
EXT void EvObjSxyPosChange( EventOBJ * obj );

#define	EvObjId(no)				(EvObj[no].objID)					// ﾜｰｸﾅﾝﾊﾞ -> OBJ ID
#define	EvObjMapId(no)			(EvObj[no].mapID)					// ﾜｰｸﾅﾝﾊﾞ -> MAP ID
#define	EvObjDivId(no)			(EvObj[no].divID)					// ﾜｰｸﾅﾝﾊﾞ -> DIV ID
#define	EvObjWorkAdrs(o,m,d)	(&EvObj[EvObjIdSeek(o,m,d)])		// 各ID -> ﾜｰｸｱﾄﾞﾚｽ取得
#define	EvObjSpWorkAdrs(o)		(&EvObj[EvObjIdSeek(o,0,0)])		// 特別ID -> ﾜｰｸｱﾄﾞﾚｽ
#define EvObjActNo(n)			(EvObj[n].actno)					// 

#define	EvObjDelNo(no)			(EvObjDel(&EvObj[no]))				// ｲﾍﾞﾝﾄOBJ No 削除
#define	EvObjWorkInitNo(no)		(EvObjWorkInit(&EvObj[no]))			// ｲﾍﾞﾝﾄOBJ No ﾜｰｸ初期化

#define	EvObjRefPalNo(no) 		(EvObjRefPalNoTbl[no])				// 映りこみﾊﾟﾚｯﾄ

#define	EvObjNoBanishOn(n)		(EvObj[n].banish_sw = 1)			// ﾊﾞﾆｯｼｭﾌﾗｸﾞ ON
#define	EvObjNoBanishOff(n)		(EvObj[n].banish_sw = 0)			// ﾊﾞﾆｯｼｭﾌﾗｸﾞ OFF
#define	EvObjNoBanishSet(n,b)	(EvObj[n].banish_sw = b)			// ﾊﾞﾆｯｼｭﾌﾗｸﾞｾｯﾄ
#define	EvObjScrSwOn(n)			(EvObj[n].scr_main_sw = 1)			// ｽｸﾛｰﾙｽｲｯﾁ ON

#define	EvObjAnmChgSwSet(n,sw)	(EvObj[n].anm_change_sw = sw)		// ｾﾙｱﾆﾒｽｲｯﾁｾｯﾄ

#undef EXT
#endif // EVOBJ_H
