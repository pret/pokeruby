#ifndef __SYSTEM_H__
#define __SYSTEM_H__

//******************************************************************
//          system.h
//
//          Copyright (C) 2001 GAME FREAK inc.
//******************************************************************

#include "actor.h"

//------------------- 定義 -----------------------------------------

typedef	struct {
	pFunc pFirstProc;		// 特殊プロセス呼び出し関数ポインタ
	pFunc pMainProc;		// メインプロセス呼び出し関数ポインタ
	pFunc pReturnProc;		// 特定処理後に復帰する先の関数ポインタ
	pFunc pVBlank;			// Ｖブランク割込み内呼び出し関数ポインタ
	pFunc pHBlank;			// Ｈブランク割込み内呼び出し関数ポインタ
	pFunc pVCount;			// Ｖカウント割込み内呼び出し関数ポインタ
  //#ifdef GCDOWNLOAD
	pFunc pSio;			// ＳＩＯ割込み内呼び出し関数ポインタ
  //#endif GCDOWNLOAD

	vu16 IntrCheck;			// 割込み終了ステータス

	u32 main_timer;			// メインルーチン用カウント
	u32 vsync_counter;		// Ｖブランク用カウンタ

	u16 RealCont;			// キー状態
	u16 RealTrg;			// キートリガー
	u16 Cont;				// キー状態(ゲーム設定により変換処理が入る)
	u16 Trg;				// キートリガー(ゲーム設定により変換処理が入る)
	u16 Repeat;				// キーリピート
	u16 RepeatWait;			// キーリピートウェイト
	u16 TrgFlag;			// 最初のトリガー実行フラグ
	u16 TrgFlagMask;		// 最初のトリガー実行マスク

	SysOamData OAMbuf[128];	//add matsuda
	u8 InitSeqWork;			//初期化シーケンス用ワーク

	u8 OAMTransFlag	:1;		//OAM転送許可ﾌﾗｸﾞ(0:許可 1:不許可)	//add matsuda
	u8 FieldBattleFlag:1;	//今、フィールドなのか戦闘なのか(0:Field 1:Battle)
							//add soga
	u8				:6;
}SystemArea;

#endif //__SYSTEM_H__

