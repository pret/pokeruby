//========================================================================================
//								ミニゲーム・ルーレットのOBJ
//									2002/03/28 by nakahiro
//									2002/06/11 by iwasawa
//========================================================================================

//=========================================================================================
//									シンボル定義
//=========================================================================================
// アクター番号参照場所
enum {
	//BG2用オブジェ
	RLT_BG2_OBJ = 0,
	RLT_BALL0 = 0,			//ball
	RLT_BALL1,
	RLT_BALL2,
	RLT_BALL3,
	RLT_BALL4,
	RLT_BALL5 = 5,
	RLT_BALL6,
	RLT_BALL7,
	RLT_BALL8,
	RLT_BALL9,
	RLT_BALL10,
	RLT_BALL11 = 5,

	RLT_CTBL = 6,			// センターテーブル

	RLT_RPOKE00,			//回転盤用ポケモン
	RLT_RPOKE01,
	RLT_RPOKE02,
	RLT_RPOKE03,
	RLT_RPOKE04,
	RLT_RPOKE05,
	RLT_RPOKE06,
	RLT_RPOKE07,
	RLT_RPOKE08,
	RLT_RPOKE09,
	RLT_RPOKE10,
	RLT_RPOKE11,

	RLT_BG2_OBJ_MAX = 19,
	RLT_BG1_OBJ = 20,
	
	WIN_COIN = RLT_BG1_OBJ,		//コイン表示用ウィンドウ
	WIN_COIN00,
	WIN_COIN01,
	WIN_COIN02,
	WIN_COIN03,
	
	WIN_ODDS,					//オッズ表示
	
	WIN_BALL00,					//ボールの残数表示
	WIN_BALL01,
	WIN_BALL02,
	
	WIN_POKE00,					// 賭けテーブルのポケモン
	WIN_POKE01,
	WIN_POKE02,
	WIN_POKE03,
	WIN_POKE04,
	WIN_POKE05,
	WIN_POKE06,
	WIN_POKE07,
	WIN_POKE08,
	WIN_POKE09,
	WIN_POKE10,
	WIN_POKE11,
	WIN_POKE12,
	WIN_POKE13,
	WIN_POKE14,
	WIN_POKE15,
	WIN_POKE16,
	WIN_POKE17,
	WIN_POKE18,
	
	RLT_WAKU,			// 枠

	RLT_STCELL00,		//ボールが落ちたセルの表示
	RLT_STCELL01,
	RLT_STCELL02,
	RLT_STCELL03,
	RLT_STCELL04,
	RLT_STCELL05,

	EV_POKE,					// エフェクト用ポケモン
	EV_SHADOW0,					// エフェクト用オブジェクト
	EV_SHADOW1,		 			//
};

//========================================================================================
//									プロトタイプ宣言
//========================================================================================
extern void AddRoulettePokeWinOBJ(void);		// ポケモンマークセット
extern void DelRoulettePokeWinOBJ(void);		// ポケモンマーク削除
extern void BanishRoulettePokeControl(u8,u8);	// ポケモンマーク表示切替
extern void AddRotatePokeOBJ(void);				// ルーレット盤のポケモンセット
extern void RouletteObjPal(u8);					// ルーレットOBJパレット設定
extern void AddRouletteWakuOBJ(void);			// 枠OBJを表示
extern void RouletteWakuOBJBanishControl(u8);	// 表示切替
extern void AddBg1OBJ(void);					// Bg1用オブジェ

extern void AddBallHoleObj(void);				// 穴セット
extern void AddBallObj(void);					// ボールオブジェクトのセット
extern void AddSTCellObj(void);					// テーブル用ボールOBJのセット

//表示コントロール
extern void DrawCoinControl(u16 coin);
extern void DrawOddsControl(u8);
extern void DrawRestballControl(u8);
extern void Bg1_DummyActMove(actWork *);
extern void Bg1_ScrollActMove(actWork *);

//ボールの動き関連
extern void G_BallParamClear(void);				// ボールのパラメータをクリア
extern void BallMoveAct_ST0(actWork *);			// ボールの最初の動作関数
extern void BanishSTCellControl( u8 flg,u8 no);
extern void BanishWakuControl(u8 no);

//========================================================================================
//									グローバル変数
//========================================================================================
extern const BET_PARAM		g_rltBet[];
extern const RLT_CELL_PARAM	g_rltCell[];	//グローバルデータの参照
