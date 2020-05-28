//========================================================================================
//								ミニゲーム・ルーレット
//								2002/03/28 by nakahiro
//								2002/05/30 iwasawa's job,a job form nakahiro
//========================================================================================

#ifndef _ROULETTE_H_
#define _ROULETTE_H_

//デバッグフラグ
#define	_IF_RLT_DEBUG_
#ifdef	_IF_RLT_DEBUG_
	#define RLT_DEBUG	(1)
#else
	#define RLT_DEBUG	(0)
#endif	//IF_RLT_DEBUG

#include "mitool.h"

//関数のエクスターン
extern void RouletteSet(void);		// ルーレット呼び出し
extern s16 fix_mul( s16, s16 );		// a*b を求める
extern s16 fix_inverse( s16 );		// 1/b を求める

/////////////////////////////////////////////////////////////////////////////
//	シンボル定義
////////////////////////////////////////////////////////////////////////////
//使用するユーザーワークエリア
//#define RLT_UWORK_GPPAL	(0x00000000)
//#define RLT_UWORK_GPBG	(0x00008000)
//#define RLT_UWORK_GROBJ	(0x00012000)
//#define RLT_UWORK_PROG	(0x00016000)
#define RLT_UWORK_GPPAL	(0x00000000)
#define RLT_UWORK_GROBJ	(0x00017000)
#define RLT_UWORK_GPBG	(0x00018800)
#define RLT_UWORK_PROG	(0x00019000)

#define	RLT_ACT_MAX		64			//使用したいアクター数
#define RLT_ACTID_MAX	64			//2次使用したいアクターIDの数
#define RLT_CELL_MAX	12			//テーブルの数
#define RLT_BET_MAX		6			//賭けられる個所の最高数

/////////////////////////////////////////////////////////////////
//	データ型定義
/////////////////////////////////////////////////////////////////
typedef struct {
	u8	cID;		// セルID
	u8	odds:4;		// 倍率
	u8	poke:4;		// ポケモン
	u8	color:4;	// 色
	u8	dummy:4;	// ダミー

	u8	posx;		// セルの表示XPOS 
	u8	posy;		// セルの表示YPOS
	u8	dx;			// セルBGデータのエリアX
	u8	dy;			// セルBGデータのエリアY

	u32	flg;		// ヒットした場所の保持フラグ
	u32 bet_flg;	// 賭けた場所のチェック用フラグ
	u16	canm;		// カラーアニメーションの起動フラグ
}BET_PARAM;

typedef struct{
	u8		uc_no;			//玉のナンバー
	u8		uc_flg;			//フラグエリア
	u8		uc_cell;		//玉がいるセルナンバー
	u8		uc_area;		//玉のいるエリアナンバー
	u16		us_syncMax;		//玉がストップするまでのSync
	u16		us_syncA0;		//玉がストップするまでのSync
	u16		us_syncA1;
	u16		us_syncA2;

	float	fr;				//現在の角度
	float	frv;			//角速度
	float	fra;			//角加速度

	float	fw;				//現在の半径
	float	fwv;			//半径に対する速度
	float	fwa;			//半径に対する加速度
	float	fwo;			//スタックしたときに使う値
}BALL_PARAM;

typedef struct{
	u8		uc_no;		//セルナンバー
	u8		uc_area;	//エリアナンバー
	u8		uc_bit;		//何ビット目をONにするか
	u32		ui_flg;		//実際のフラグ
}RLT_CELL_PARAM;

//テーブルのパラメータ
typedef struct{
	u8		uc_rate;		//レート
	u8		uc_rBase;		//1セルのROT
	u8		uc_rBaseH;		//
	
	u8		uc_rSpd;		//回転のスピード
	u8		uc_rWait;		//回転用のウェイト

	struct{					//イベント用のパラメータ
		u16	prm0;
		u16	prm1;
		u16	prm2;
	}ev[2];
	
	u16		w_v0;			//ボールの初速
	u16		w_t0;			//基本タイム
	float	f_invV;
}RLT_TABLE_PARAM;

typedef struct{
	//ウェイト制御
	u16			us_wait;			//ウェイト
	u16			us_cKey;			//キャンセルキー
	pTaskFunc	wait_ret_adrs;		//ウェイトから戻ってくるタスクアドレス
	pTaskFunc	menu_ret_adrs;		//メニューから戻ってくるタスクアドレス
	pTaskFunc	back_adrs;			//前アドレスの保存	
}TASK_CNT;

typedef struct {

	// ゲーム関連
	u8	time_flg;				// タイムフラグ 1 = カウント中, 0 = 終了
	u8	state_flg;
	u8	mons_flg;				//特定のモンスターを手持ちに入れているかどうか
	
	//イベント用フラグ
	u8	ev_no :5;				//イベントナンバー
	u8	ev_on :1;				//スタックイベントが発生しているかどうか
	u8	ev_end:1;				//イベントの終わりを示すフラグ
	u8	ev_bact:1;				//ボールがアクティブかどうかのフラグ

	//ScriptParameter0の下位1Byteをスクリプトからのフラグで取得
	u8	rlt_ver :2;				//台のレートの識別フラグ
	u8	:5;						//ダミー
	u8	rlt_bonus:1;			//ボーナス期間中かどうか？

	// ヒットしたセル関連
	u32 rlt_hp;					// 入った場所フラグ
	u8	hit_cell[RLT_BET_MAX];	// ヒットしたセルナンバーを順番に保存
	u8  hit_vLine[4];			// 縦のラインがいくつ埋まっているか
	u8	hit_hLine[3];			// 横のラインがいくつうまっているか
	
	// ベットされた場所の記憶
	u8	uc_rate;				//レートはいくつか？
	u8	nBet:4;					//何回目の賭けか？
	u8	betAll:4;				//何箇所に賭けられるか？
	u8	uc_aBet[RLT_BET_MAX];	//どこに賭けたか？
	
	// BG関連
	u8	bg_ct;					// 回転制御カウンタ
	u8	bg_spd;					// 回転のスピード
	u8	bg_wait;				// 回転制御ウェイト
	s16	bg_rotate;				// 回転角度
	s16	bg1_scrX;				// bg1のスクロール制御
	s16 bg0_cnt;
	s16 bg1_cnt;
	s16	bg_sPa;
	s16	bg_sPb;
	s16	bg_sPc;
	s16	bg_sPd;
	u16	w_alpha;

	// OBJ関連
	actWork* pAct;					// 汎用アクターID保存
	u8	act_id[ RLT_ACTID_MAX ];	// アクター番号

	//ボール関連
	BALL_PARAM	ball;

	//タスク制御
	u8			sTask_id[2];	//サブタスクID保存
	TASK_CNT	task;

	//カラーアニメ制御
	ColorAnime	colanm;
}ROULETTE;

#endif //_ROULETTE_H_

