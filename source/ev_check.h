
//=========================================================================
//	
//=========================================================================

#ifndef EV_CHECK_H
#define EV_CHECK_H

#include "evobj.def"

#undef GLOBAL
#ifdef EV_CHECK_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

/* イベントチェックに使う座標系の構造体 */
typedef struct {
		s16 x;
		s16 y;
		s8	z;
}EV_POS;

/* イベントリクエスト構造体 */
typedef struct {
		u16		TalkCheck:1;
		u16		StepCheck:1;
		u16		MenuOpen:1;
		u16		CnvButton:1;
		u16		MatCheck:1;
		u16		PushCheck:1;
		u16		MoveCheck:1;
		u16		FloatCheck:1;

		u16		DebugMapChange:1;
		u16		DebugHook:1;
		u16		DebugMenu:1;
		u16		DebugDiving:1;
		u16		:4;

		u8		Site;
}EV_REQUEST;


//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

extern u8 TargetObjNo;

//=========================================================================
//	関数プロトタイプ
//=========================================================================



GLOBAL void ClearRequest(EV_REQUEST * req);
GLOBAL void SetRequest( EV_REQUEST * req, u16 trg, u16 cont );
GLOBAL int CheckRequest( EV_REQUEST * req );


// イベント起動チェック関連
GLOBAL u8 DivingMapMoveCheck( EV_POS * pos, u16 attr );	//「もぐる」のマップ移動チェック
GLOBAL u8 DivingMapCheck( void );

// 簡易ＯＢＪ話しかけチェック
GLOBAL const VM_CODE * EvObjEasyTalkCheck( EV_POS * p, u8 attr, u8 site );
// 簡易POSイベントチェック
GLOBAL const VM_CODE * EventPosEasyCheck( const EV_POS * p );


GLOBAL void GetHeroPosition( EV_POS * p );

//エンカウント制御初期化
GLOBAL void InitEncountStep(void);

//毒ダメージ制御の歩数初期化
GLOBAL void PoisonStepInit(void);

//--------------------------------------------------------------
//	自分の前にいるＯＢＪのチェック
//	※どうぐ使用のチェックなどに使う
//	※戻り値はそのＯＢＪのスクリプトアドレス（仮）
//	※同時にTargetObjNoも設定される
//--------------------------------------------------------------
GLOBAL const VM_CODE * FrontObjCheck(void);

#undef GLOBAL
#endif	/*EV_CHECK_H*/

