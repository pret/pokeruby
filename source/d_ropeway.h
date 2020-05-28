//<d_ropeway.h>
///////////////////////////////////////////////////////////////////
//
//	ロープウェイデモ用	ヘッダファイル
//
//
//
///////////////////////////////////////////////////////////////////

#ifndef _DEBUG_ROPEWAY_DEMO_H_
#define _DEBUG_ROPEWAY_DEMO_H_

//依存しているヘッダファイル
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "madefine.h"

#include "mitool.h"

//UserWork使用エリア定義
#define RWD_WORK0_AREA	(0x17000)
#define RWD_WORK1_AREA	(0x19000)
#define RWD_WORK0_ADDR	(&(UserWork[RWD_WORK0_AREA])
#define RWD_WORK1_ADDR	(&(UserWork[RWD_WORK1_AREA]))

//Actor
#define RWD_OBJCELL_NUM		(3)
#define RWD_OBJPAL_NUM		(1)

typedef struct 
{
	u8		uc_subTaskNo;		//サブタスクのタスクナンバー保存
	u8		uc_state;			//現在の状態管理
	u8		uc_weather;			//天候管理のフラグ
	u16		us_weaTime;			//天候チェンジのタイム
	u16		us_time;			//タイマー	
	
	_scroll	scroll[4];			//BGスクロール値の管理
	
	struct{	//山肌のスクロール管理用のパラメータ
		char	cBlockCt;		//ブロックカウンタ
		
		u8		uc_sLine;		//参照している左右端のキャラナンバー
		u8		uc_dLine;		//参照している下端のキャラナンバー
		u8		uc_blockNo;		//使用した、最後のブロックナンバー
		u8		uc_scrScroll;	//スクリーンスクロールのカウント

		u8		uc_dx;			//uc_oldXからのオフセット
		u8		uc_dy;
		u8		uc_oldX;		//古い位置の保存
		u8		uc_oldY;

		u16		us_buf[9][12];	//補間用のスクリーンデータを格納するバッファ
	}MtScrl;
	
	_tMap		map[2];			//BGスクリーンデータの展開場所

}RWDEMO_WORK;

//関数のエクスターン
extern void DemoRopewaySetUp(void);
extern void DemoRopewaySetDown(void);
extern void DemoRopewayCall(void);

#endif //_DEBUG_ROPEWAY_DEMO_H_
