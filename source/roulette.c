//========================================================================================
//								ミニゲーム・ルーレット
//								2002/03/28 by nakahiro
//								2002/05/30 iwasawa's job,a job from nakahiro
//								2002/06/28 renewal
//========================================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "script.h"
#include "fld_main.h"
#include "menu.h"
#include "task.h"
#include "bag.h"
#include "calctool.h"
#include "fld_task.h"
#include "itemtool.h"
#include "roulette.h"
#include "rlt_obj.h"
#include "coin.h"
#include "calctool.h"
#include "mitool.h"
#include "mus_tool.h"
#include "poketool.h"
#include "record.h"
#include "item.h"
#include "laster.h"
#include "rtctool.h"

#include "../scaddata/minig_r.acl"		//bg用パレット
#include "../scaddata/rlt_bg01.asc"		//bg用圧縮スクリーンデータ

#include "rlt_com.dat"
#include "roulette.dat"
#include "monsno.def"
//========================================================================================
//										シンボル
//========================================================================================
// タスクワーク
#define BET_WORK		0	// 賭けた枚数
#define CNT_WORK		1	// カウント
#define ODDS_WORK		2	// オッズ
#define BONUS_WORK		3	// ボーナスオッズ
#define BET_POS_WORK	4	// 賭けた場所
#define WIN_WORK		5	// 勝敗
#define	LOOP_WORK		6	// ゲーム回数
#define WAIT_WORK		7	// ウェイト管理
#define NPLAY_WORK		8	// 連続プレイ回数

#define BET_ALL_WORK	9	// 現在賭けている総合枚数
#define BETPOS_OLD_WORK	10	// 過去のカーソル位置
#define NWIN_WORK		11	// 連続勝利数の保存
#define LASTHIT_WORK	12	// 最後にHITしたPosition
#define COIN_WORK		13	// コインの数
#define	DEBUG_WORK		15	// デバッグ用

#ifdef PM_DEBUG
	ROULETTE*	gp_rlt;		//デバッグ用の変数
	u8			g_rlt_debug_sw = 0;
#endif //ifdef PM_DEBUG
//========================================================================================
//									プロトタイプ宣言
//========================================================================================

//ゲーム全体を通しての、キー取得
static void TS_RouletteKeyIn(u8 id);

//一番初めに台に話し掛けてから、ゲームを実際にはじめるまでの処理
static void TS_FirstPlayFadeWait(u8 id);	//フェードインを待つ
static void TS_FirstPlaySelectInit(u8);		// プレイする？
static void TS_FirstPlaySelectMain(u8);		// はい/いいえセット
static void TS_NextPlaySelectInit(u8 id);
static void TS_NextPlaySelectMain(u8);

static void TS_PlayYes_1st( u8 id );	// Yes
static void TS_PlayNo_1st( u8 id );		// No

static void TS_PlayYes(u8);				// YES
static void TS_PlayNo(u8);				// NO

//ベットテーブルにかける処理
static void TS_BetInit(u8);				// 賭ける
static void TS_BetMain_1st(u8);			// どこに賭けるか決める(ボールを入れる前)
static void TS_BetMain(u8);				// どこに賭けるか決める(ボールを入れる前)
static void TS_BallParamInit(u8);		// カレントボールのパラメータを初期化
static void TS_BallStart(u8);			// スタート、ボールを入れる処理
static void TS_ResultWait(u8);			// 結果待ちのウェイトの処理
static void TS_ResultDemo(u8);			// 結果を表示するデモ 
static void TS_ResultSet(u8);			// 結果を画面にセット
static void TS_ReturnBetFunc(u8);		// 結果を開示
static void TS_ReturnBetFunc2(u8);		// 次のゲームへの準備
static void TS_GameStateReset(u8);		// ゲームの状態をリセット
static void RouletteEndInit(u8);		// 終了してフィールドへ復帰
static void TS_RouletteEnd(u8);

static void TS_WinSlide_1st(u8 id);		// 画面のスライド処理
static void TS_WinSlide_2nd(u8 id);
////////////////////////////////////////////
//補助系

//タスク制御関連
static void TS_WaitNextTask(u8 id);
static void SetWaitNextTask(u8 id,pTaskFunc pAdrs,u16 wait,u16 key);

//ゲーム関連
static void OneGameStateClear(u8 id);		//1ゲームの状態をクリア
static u8 GetOddsPreCell(u8 no);			//指定セルのオッズを求める

// ヒットしたセルのチェック
static void HitCellClear(void);				// セルのヒット状態をクリアする
static u8 ResultFlgSet(u8 id,u8 hit_cell );	// ヒットしたセルの状態を保存
static u8 WinCheck( u8 hit_bitNo, u8 bet );	// 予想があたったかどうかチェック

//その他
static void RouletteBGRotate(void);		// ルーレット盤回転処理

//描画補助系
static void RltColorChange(u8 pos);		//カラーアニメ制御
static void DrawWakuWindow(u8);
static void DrawBetWindow(u8);			// 賭ける場所ウィンドウ表示

//メッセージ表示補助
#define MsgWrite(msg){									\
	NMenuWinBoxWrite( 0, 14, 29, 19 );					\
	NMenuMsgWrite((msg), 2, 15);						\
}
#define MsgMiniWrite(msg){								\
	NMenuWinBoxWrite( 0, 14, 18, 19 );					\
	NMenuMsgWrite((msg), 2, 15);						\
}
#define MsgReWrite(msg){								\
	NMenuTalkMsgClr();									\
	NMenuMsgWrite((msg), MWIN_MSGXPOS, MWIN_MSGYPOS);	\
}
#define SetMsgWrite(id,msg,nextadrs){					\
	NMenuWinBoxWrite( 0, 14, 29, 19 );					\
	NMenuMsgWrite((msg), 2, 15);						\
	TaskTable[(id)].TaskAdrs = (nextadrs);				\
}
#define MsgBoxWrite(){									\
	NMenuTalkWinWrite();								\
}

/*--------------------------------------------
	1セット終了後のゲームのステートをクリアする
------------------------------------------------*/
#define GameSetClear(id)	{					\
	TaskTable[(id)].work[ LOOP_WORK ] = 0;		\
												\
	OneGameStateClear((id));					\
	HitCellClear();								\
	G_BallParamClear();							\
												\
	DrawBetWindow(0);							\
	DrawRestballControl(6);						\
}

//========================================================================================
//									グローバル変数
//========================================================================================
static const u8	msg_str_bet[] = { I_MSG_,STR_TEMP_BUF0,ma_,i_,EOM_ };

static const SELECT_ITEM sg_yes_no_1st = {TS_PlayYes_1st, TS_PlayNo_1st};
static const SELECT_ITEM sg_yes_no = { TS_PlayYes, TS_PlayNo };	// はい/いいえ処理

//=========================================================================================
//										メイン処理
//=========================================================================================
/*--------------------------------------------
	ルーレットメインタスク

	MainTask
	staitc void TM_RouletteMain(void);
----------------------------------------------*/
static void TM_RouletteMain(void)
{
	MainTask();
	JumpActor();
	SetActor();

	//カラーアニメ
	if(MG_RLT->colanm.uc_flg){
		ColorAnimeLum(&MG_RLT->colanm);
	}
}

//=========================================================================================
//										割り込み
//=========================================================================================
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();

	RouletteBGRotate();

	//BG1スクリーンスクロール制御
	*(vu16 *)REG_BG1HOFS = 512 - MG_RLT->bg1_scrX;

	//アルファブレンディング係数設定
	if(MG_RLT->state_flg){
		*(vu16 *)REG_BLDALPHA = MG_RLT->w_alpha;
	}

	if(MG_RLT->bg1_cnt){
		DmaCopy(3,&(BG1_data[0x00E0]),BG_VRAM+0x21C0,0x340,16);	//BGマップ転送
		MG_RLT->bg1_cnt = 0;
	}
	
	switch(MG_RLT->bg0_cnt){
	case 0:
		return;
	case 1:
		*(vu16 *)REG_BG0CNT = BG_COLOR_16					// 16色選択
							| BG_SCREEN_SIZE_0				// スクリーンサイズ
							| BG_PRIORITY_0					// BG優先順位
							| 31 << BG_SCREEN_BASE_SHIFT	// スクリーンベースブロック
							| 0 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック
		DmaCopy(3,&(BG2_data[0x00E0]),BG_VRAM+0xf9c0,0x340,16);
		MG_RLT->bg0_cnt = 2;
		return;
	case 2:
		DmaCopy(3,&(BG2_data[0x00E0]),BG_VRAM+0xf9c0,0x340,16);
		return;
	case 0xFF:
		*(vu16 *)REG_BG0CNT = BG_COLOR_16					// 16色選択
							| BG_SCREEN_SIZE_0				// スクリーンサイズ
							| BG_PRIORITY_0					// BG優先順位
							| 31 << BG_SCREEN_BASE_SHIFT	// スクリーンベースブロック
							| 2 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック
		DmaClear(3,0x0000,BG_VRAM+0xf9c0,0x340,16);
		MG_RLT->bg0_cnt = 0;
		return;
	}

}

//=========================================================================================
//										初期化
//=========================================================================================
/*--------------------------------------------------
	ルーレットで使用する総合パラメータの初期化

	static void InitRouletteParam(void);
----------------------------------------------------*/
static void InitRouletteParam(void)
{
	u8	ct;
	u16	betPal[3] = {0x2898,0x1A6A,0x2898};
	
	memset(MG_RLT,0,sizeof(ROULETTE));

	//スクリプトパラメータの引継ぎ
	MG_RLT->rlt_ver	  =	(ScriptParameter0 & RLT_CHECK_RATE);	//レート
	if(ScriptParameter0 & RLT_IF_BONUS)	MG_RLT->rlt_bonus =	1;							//ボーナスフラグ

	//台のパラメータ
	MG_RLT->bg_spd	= g_table[MG_RLT->rlt_ver].uc_rSpd;
	MG_RLT->bg_wait	= g_table[MG_RLT->rlt_ver].uc_rWait;
	MG_RLT->uc_rate = g_rltRate[MG_RLT->rlt_bonus][MG_RLT->rlt_ver];
	
	MG_RLT->betAll = 1;									//何箇所に賭けられるか

	//背景色を変更（仮）
	if(MG_RLT->uc_rate == 1){
		PaletteWork[PA_BG0] = 
		PaletteWork[PA_BG5+PA_COL1] = 
		PaletteWorkTrans[PA_BG0] = 
		PaletteWorkTrans[PA_BG5+PA_COL1] = betPal[0];
	}
	else{
		PaletteWork[PA_BG0] = 
		PaletteWork[PA_BG5+PA_COL1] = 
		PaletteWorkTrans[PA_BG0] = 
		PaletteWorkTrans[PA_BG5+PA_COL1] = betPal[1];
	}

	//カラーアニメーション用のパラメータを登録
	ColorAnimeInit(&MG_RLT->colanm);
	for(ct = 0;ct < 13;ct++)
	{
		AddColorAnime(&MG_RLT->colanm,ct,(ColAnmData *)&(g_colanm[ct]));
	}

	//特定のモンスターを連れているかどうか検索
	for(ct = 0;ct < 6;ct++)
	{
		//ID_monsno_eggはタマゴのときはキノココとかスバメは返さない設定
		switch(PokeParaGet(&PokeParaMine[ct],ID_monsno_egg)){
		case MONSNO_KINOKOKO:	//キノココ
			MG_RLT->mons_flg |= 1;
			break;
		case MONSNO_SUBAME:	//スバメ
			MG_RLT->mons_flg |= 2;
			break;
		default:
			break;
		}
	}
	GetGameTime();	//今が何時かGET
}

static void TM_RouletteInit(void)
{
	u8	id;

#ifdef PM_DEBUG	
	gp_rlt = (ROULETTE *)&UserWork[RLT_UWORK_PROG];
#endif	//ifdef PM_DEBUG

	switch( sys.InitSeqWork ){
	case 0:
		SetVBlankFunc(NULL);	// 割込み関数設定(VBLANK)
		LasterInit();			//HDMA初期化
		InitHVBlankFunc();		// HVBlank初期化
		ItemToolAGBRegInit();	// レジスタ・VRAM・OAM・PALRAM初期化

		*(vu16 *)REG_BG2CNT = BG_COLOR_256				// 256色選択
							| BG_SCREEN_SIZE_1			// スクリーンサイズ
							| BG_PRIORITY_2				// BG優先順位
							| 6 << BG_SCREEN_BASE_SHIFT	// スクリーンベースブロック
							| 1 << BG_CHAR_BASE_SHIFT	// キャラクタベースブロック
							| BG_LOOP_OFF;		
		*(vu16 *)REG_BG1CNT = BG_COLOR_16					// 16色選択
							| BG_SCREEN_SIZE_1				// スクリーンサイズ
							| BG_PRIORITY_1					// BG優先順位
							| 4 << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
							| 0 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック

		//ブレンディング対象の設定
	    *(vu16 *)REG_BLDCNT =  BLD_BG2_2ND | BLD_BD_2ND;
	    *(vu16 *)REG_BLDALPHA = 0x060A;		//ブレンディングパラメータ
	
		//対象BGにデータをセット
		LZ77UnCompVram((void *)rlt_bg01_pch_ADRS,(void *)BG_VRAM);
		LZ77UnCompVram((void *)rlt_bg02_pch_ADRS,(void *)(BG_VRAM+0x4000));

		sys.InitSeqWork++;
		break;

	case 1:
		PaletteAnimeInit();			// ﾊﾟﾚｯﾄｱﾆﾒ 初期化
		InitActor();				// ｱｸﾀｰ初期化
		InitTask();					// タスク初期化

		sys.InitSeqWork++;
		break;

	case 2:
		PrintScreenInit(DEFAULT_TYPE);		// ﾒｯｾｰｼﾞ表示領域初期化
		NMenuScreenInit(FIELD_MENU_TYPE);	// 文字データ初期化
		PaletteWorkSet( minig_r_Palette, PA_BG0, 0x1C0);			// 256_1パレット
		
		sys.InitSeqWork++;
		break;
	case 3:
		//初期パラメーターセット
		InitRouletteParam();
		
		//初期画面を作る
		BGDataInit();						// BG展開用バッファ初期化

		//圧縮データを展開
		LZ77UnCompWram((void *)rlt_bg01_LZ,(void *)BG01_MAP);
		LZ77UnCompVram((void *)rlt_bg02_LZ,(void *)(BG_VRAM+0x3000));
		
		sys.InitSeqWork++;
		break;
	case 4:
		RouletteObjPal(0);			// ルーレットOBJパレット設定
		AddBallObj();				// ボールのオブジェクト追加
		AddBallHoleObj();			// ホール(センターテーブルオブジェクト)を追加

		AddBg1OBJ();				// Bg1用オブジェクト追加
		AddRoulettePokeWinOBJ();	// ポケモンマークOBJ追加
		AddSTCellObj();				// ベットテーブル用ボールオブジェクトを追加
		
		AddRotatePokeOBJ();			// ルーレット盤のポケモンOBJ追加
		
		sys.InitSeqWork++;
		break;
	case 5:
		JumpActor();
		SetActor();
		DrawCoinControl(Fld.my_coin);	//現在持っているコインの枚数
		DrawRestballControl(6);			//残りの玉の数
		DrawOddsControl(0);				//オッズ
		DrawBetWindow(0);				//ベットテーブルを表示
		MsgWrite(MSG_PANEL);
		
		ActOX = -60;
		ActOY = 0;
	
		sys.InitSeqWork++;
		break;
	case 6:
		*(vu16 *)REG_DISPCNT = DISP_MODE_1			// BGモード
							 | DISP_OBJ_CHAR_1D_MAP	// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							 | DISP_BG2_ON			// BG2有効
							 | DISP_BG1_ON			// BG1有効
							 | DISP_BG0_ON			// BG0有効
							 | DISP_OBJ_ON
							 ;

		sys.InitSeqWork++;
		break;
	case 7:
		REG_IE_SET( V_BLANK_INTR_FLAG );
		*(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;
		SetVBlankFunc(VInterFunc);			// 割込み関数設定(VBLANK)
		
		//フェードインリクエスト
		HardFadeReq(0xFF,0,16,0,1);
		
		//サブタスクセット
		id = MG_RLT->sTask_id[RLT_STASK_MAIN] = AddTask( TS_FirstPlayFadeWait, 0 );
		TaskTable[id].work[ LOOP_WORK ] = RLT_GAME_MAX;	//ゲーム数をセット
		TaskTable[id].work[ COIN_WORK ] = Fld.my_coin;	//コイン数セット
		
		//共通キー取得用、サブタスクセット
		MG_RLT->sTask_id[RLT_STASK_KEY] = AddTask(TS_RouletteKeyIn,1);

		//メインタスクチェンジ
		MainProcChange( TM_RouletteMain );
	}
}

//===========================================
//	ゲーム中、すべてを通しての、共通キー取得
//===========================================
static void TS_RouletteKeyIn(u8 id)
{
	s16	sin,cos;

	//回転制御
	if(MG_RLT->bg_ct++ == MG_RLT->bg_wait){
		MG_RLT->bg_ct = 0;
		MG_RLT->bg_rotate -= (u16)MG_RLT->bg_spd;
		if( MG_RLT->bg_rotate < 0 )	MG_RLT->bg_rotate = THETA_360_DEF - MG_RLT->bg_spd;
	}

	sin = Sin_360_Get( MG_RLT->bg_rotate );
	cos = Cos_360_Get( MG_RLT->bg_rotate );
	
	//拡大率（１/１= 0x1000 ）で回転
	sin = (s16)(((s32)sin * FF_MAG1000)/0x100);
	MG_RLT->bg_sPa =  
	MG_RLT->bg_sPd = (s16)(((s32)cos * FF_MAG1000)/0x100);
	MG_RLT->bg_sPb =  sin;
	MG_RLT->bg_sPc = -sin;

#ifdef PM_DEBUG	
	if(!g_rlt_debug_sw) return;
	if(!(sys.Trg & START_BUTTON)) return;

	//スタートボタンが押されたら、ゲームを強制終了
	TaskTable[MG_RLT->sTask_id[RLT_STASK_MAIN]].TaskAdrs = TS_PlayNo;
	m4aMPlayStop(&m4a_mplay001);
	m4aMPlayStop(&m4a_mplay002);
	m4aMPlayStop(&m4a_mplay003);
#endif	//PM_DEBUG	
}

//=====================================
//	ルーレット画面に入ってきたとき、
//=====================================
/*---------------------------------------------------
	ルーレット画面に入ってきたとき、フェードインを待つ

	SubTask	
		staitc void TS_FirstPlayFadeWait(u8 id);

	Depend
		itemtool.c
------------------------------------------------------*/
static void TS_FirstPlayFadeWait(u8 id)
{
	if(PaletteAnime()) return;
	
	//ブレンディング対象の設定
	*(vu16 *)REG_BLDCNT |=  BLD_BG2_2ND | BLD_BD_2ND;
	*(vu16 *)REG_BLDALPHA = 0x0808;		//ブレンディングパラメータ

	//フェードインが終了してから
	//操作説明メッセージ
	GameSetClear(id);
	SetWaitNextTask(id,TS_BetInit,0xFFFF,A_BUTTON|B_BUTTON);
	return;
}

/*-----------------------------------------------------------
	連続プレイをする、しないを選択するタスクとして機能する
	１プレイが終わった後、このタスクに戻ってくる

	SubTask
	static void TS_NextPlaySelectMain(u8 id);

	depend	
		menutool.c
		itemtool.c
---------------------------------------------------------------*/
static void TS_NextPlaySelectMain( u8 id )
{
	//表示位置を指定して、YesOrNoのメニューboxを表示する
	YesNoSelectInit( YESNO_WINX, YESNO_WINY );	//menutool.c
	MsgWrite(MSG_REPLAY);

	//TS_PlayYes または TS_PlayNo にサブタスクチェンジ
	SelectToolInit( id, &sg_yes_no );
}

// YES
/*----------------------------------------------
	プレイするを選んだときの処理（一番初め）
	SelectToolInit(id,&sg_yes_no); より

	SubTask
	static void TS_PlayYes(u8 id)

	Depend
		menutool.c
		itemtool.c
------------------------------------------------*/
static void TS_PlayYes( u8 id )
{
	//YesNoメッセージBoxを消去
	NMenuBoxClear( YESNO_WINX, YESNO_WINY, YESNO_WINX+6, YESNO_WINY+5 );

	TaskTable[id].TaskAdrs = TS_BetInit;
	return;
}

// NO
/*--------------------------------------------
	プレイを終了をリクエストする

	SubTask
	static void TS_PlayNo(u8 id);
----------------------------------------------*/
static void TS_PlayNo( u8 id )
{
	//キー取得用のタスクを削除
	DelTask(MG_RLT->sTask_id[RLT_STASK_KEY]);
	RouletteEndInit(id);
}

////////////////////////////////////////////////////////////
//	ベッドエントリー
//////////////////////////////////////////////////////////////

//------------------
//		賭ける
//------------------
/*---------------------------------------
	賭けた場所に応じたベッドテーブルの描画
	ベッドOBJ・選択枠の選択枠表示・非表示コントロール

	FileRocal
	static void DrawBetTable(u8 id,u8 flg)

	u8	id	呼び出されるサブタスクのID
	u8	flg	0 :CURSOL_POS : 現在賭けている場所と、カーソル位置の倍率を表示
			1 : BET_POS   : 賭けた場所とその倍率を表示
			
	Depend
		task.h
--------------------------------------------*/
#define CURSOL_POS	0
#define BET_POS		1
/*-------------------------------------------
	選択枠の表示
----------------------------------------------*/
static void DrawWakuWindow(u8 pos)
{
	u8	dx = 0,dy = 0;

	switch(pos)
	{
	case 0:
		FillChar16(BG2_data,0x0000,14,7,16,13);
		return;
	case 1:
	case 2:
	case 3:
	case 4:
		dx = 14+pos*3;
		dy = 7;
		FillChar16(BG2_data,0x0000,14,7,16,13);
		SetChar16(BG2_data,WAKU01_MAP,dx,7,3,13);
		return;
	case 5:
	case 10:
	case 15:
		dx = 14;
		dy = 10+((pos-1)/5)*3;
		FillChar16(BG2_data,0x0000,14,7,16,13);
		SetChar16(BG2_data,WAKU02_MAP,dx,dy,16,3);
		return;
	default:
		dx = 14+(pos%5)*3;
		dy = 7+((pos-1)/5)*3;
		FillChar16(BG2_data,0x0000,14,7,16,13);
		SetChar16(BG2_data,WAKU00_MAP,dx,dy,3,3);
		return;
	}
}
static void DrawBetTable( u8 id ,u8 flg)
{
	if(flg == CURSOL_POS){
		//現在のカーソル位置の場所と倍率を表示
		DrawOddsControl((u8)TaskTable[id].work[BET_POS_WORK]);
	}
	else{
		//賭けた場所と、その倍率を表示
		DrawOddsControl(MG_RLT->uc_aBet[MG_RLT->nBet]);
	}
	DrawWakuWindow((u8)TaskTable[id].work[BET_POS_WORK]);
}

/*-------------------------------------------
	ベッドウィンドウの描画、初期化処理

	SubTask
	static void TS_BetInit(u8 id);
----------------------------------------------*/
static void TS_BetMain_1st(u8 id)
{
	//枠ウィンドウの表示開始
	MG_RLT->bg0_cnt = 1;
	DrawWakuWindow(TaskTable[id].work[BET_POS_WORK]);

	MG_RLT->bg_wait = 2;
	MG_RLT->bg_ct = 0;
	TaskTable[id].TaskAdrs = TS_BetMain;		//タスクチェンジ
}
static void TS_BetInit( u8 id )
{
	short i;
	
	//選択カーソルを最初にどこに持っていくか？
	if((MG_RLT->rlt_hp & BET_FLG05)){	//1列目が全部埋まっているとき
		for(i = 11;i < 14;i++){
			if((MG_RLT->rlt_hp & g_rltBet[i].flg) == 0) break;
		}
	}
	else{	//1列目に空きがあるとき
		for(i = 6;i < 10;i++){
			if((MG_RLT->rlt_hp & g_rltBet[i].flg) == 0) break;
		}
	}
	TaskTable[id].work[BET_POS_WORK] = i;

	//1ゲームの状態をクリアします
	OneGameStateClear(id);

	DrawBetWindow(TaskTable[id].work[BET_POS_WORK]);	//ベッドコインウィンドウを描画します
	DrawOddsControl(TaskTable[id].work[BET_POS_WORK]);	//オッズの表示
	RltColorChange(TaskTable[id].work[BET_POS_WORK]);
	TaskTable[id].work[CNT_WORK] = 0;
	TaskTable[id].TaskAdrs = TS_BetMain_1st;		//タスクチェンジ
}

/*----------------------------------------------------
	ベッドにどこにコインをかけるか選ばせる処理
	キー入力依存

	FileRocal
	static u8 BetMainSelect(s16 *pos,u8 key);

	io	s16		現在どのセルにカーソルがいるかを格納した変数へのポインタ
	i	u8		どのキーがおされたか？
				0:	Up
				1:	Down
				2:	Left
				3:	Right

	戻り値：現在未使用
------------------------------------------------------*/
static u8 BetMainSelect( s16 * pos, u8 key )
{
	s8	min=0,now=0,max=0;
	s8	cnt_tbl[] = { -5, 5, -1, 1 };

	now = (s8)*pos;		//今どこにいるか？

	switch( key ){
	case 0:
	case 1:
		min = *pos % 5;
		max = 15 + min;
		if( min == 0 )	min = 5;
		break;
	case 2:
	case 3:
		min = (*pos / 5) * 5;
		max = min + 4;
		if( min == 0 )	min = 1;
	}

	while(1){		//すでにヒットしているセルは飛ばす
		*pos += (s16)cnt_tbl[ key ];
		if( *pos < min )	*pos = (s16)max;
		if( *pos > max )	*pos = (s16)min;
		if( *pos == now )	break;
		return TRUE;
	}
	return FALSE;
}

/*-----------------------------------------------------------------
	どこにかけるか選ぶときのキー入力を処理し、
	テーブルを描画しなおす

	FileLocal
	static void BetMainSelectKeyIn(u8 id);
------------------------------------------------------------------*/
static void BetMainSelectKeyIn(u8 id)
{
	u8	i = 0,ofs = 0,flg = 0;

	if( sys.Trg & U_KEY ){
		flg = 1;
		if( BetMainSelect( &TaskTable[id].work[ BET_POS_WORK ], 0 ) == FALSE ) return;
	}
	if( sys.Trg & D_KEY ){
		flg = 1;
		if( BetMainSelect( &TaskTable[id].work[ BET_POS_WORK ], 1 ) == FALSE ) return;
	}
	if( sys.Trg & L_KEY ){
		flg = 1;
		if( BetMainSelect( &TaskTable[id].work[ BET_POS_WORK ], 2 ) == FALSE ) return;
	}
	if( sys.Trg & R_KEY ){
		flg = 1;
		if( BetMainSelect( &TaskTable[id].work[ BET_POS_WORK ], 3 ) == FALSE ) return;
	}
	if(!flg) return;

	DrawBetWindow(TaskTable[id].work[BET_POS_WORK]);
	DrawBetTable(id,CURSOL_POS);
	TaskTable[id].work[CNT_WORK] = 0;
	SePlay(SE_SELECT);

	//カラーアニメーションチェンジ
	ColorAnimeEnd(&MG_RLT->colanm,0xFFFF);
	MG_RLT->colanm.work[13].live_sw = 
	MG_RLT->colanm.work[14].live_sw = 
	MG_RLT->colanm.work[15].live_sw = 0;
	RltColorChange(TaskTable[id].work[BET_POS_WORK]);

	//ウィンドウオブジェクトチェンジ
	for(i = 0;i < 4;i++)
	{
		ActWork[ MG_RLT->act_id[ WIN_POKE12+i]].oamData.CharNo =
			ActWork[ MG_RLT->act_id[WIN_POKE12+i]].char_num + 
			(u16)(ActWork[ MG_RLT->act_id[WIN_POKE12+i]].anm_tbl)[0][0].pat;		
	}
	if(TaskTable[id].work[BET_POS_WORK] > 0 && 5 >TaskTable[id].work[BET_POS_WORK]){
		//縦の列が埋まっているときは、変えない
		if(MG_RLT->rlt_hp & g_rltBet[TaskTable[id].work[BET_POS_WORK]].flg) return;
		
		ofs = TaskTable[id].work[BET_POS_WORK]-1;
		ActWork[ MG_RLT->act_id[ WIN_POKE12+ofs]].oamData.CharNo =
			ActWork[ MG_RLT->act_id[WIN_POKE12+ofs]].char_num + 
			(u16)(ActWork[ MG_RLT->act_id[WIN_POKE12+ofs]].anm_tbl)[0][1].pat;		
	}
	return;
}

/*-----------------------------------------------------------------
	ベッドテーブルを表示した上で、
	どこにかけるか選ばせる処理です

	SubTask
	static void TS_BetMain(u8 id);

	Depend
		rlt_obj.c
		menutool.c
------------------------------------------------------------------*/
static void TS_BetMainEnd(u8 id)
{
	//枠ウィンドウ消去
	MG_RLT->bg0_cnt = 0xFF;

	if(MG_RLT->uc_rate == 1)	MG_RLT->bg_wait = 1;
	else						MG_RLT->bg_wait = 0;
	MG_RLT->bg_ct = 0;
	
	TaskTable[id].work[CNT_WORK] = 32;			//タイマーセット
	TaskTable[id].TaskAdrs = TS_WinSlide_1st;	//タスクチェンジ
	return;
}
static void TS_BetMainEndInit(u8 id)
{
	//賭けた場所を保存
	MG_RLT->uc_aBet[MG_RLT->nBet] = (u8)TaskTable[id].work[BET_POS_WORK];
	//今選択されている場所から、掛け率を求める
	TaskTable[id].work[ODDS_WORK] = GetOddsPreCell(MG_RLT->uc_aBet[MG_RLT->nBet]);
	//現在のオッズの描画
	DrawOddsControl(MG_RLT->uc_aBet[MG_RLT->nBet]);
	
	TaskTable[id].work[COIN_WORK] -= MG_RLT->uc_rate;	//手持ちコインを減らす処理
	if(TaskTable[id].work[COIN_WORK] < 0) TaskTable[id].work[COIN_WORK] = 0;
	DrawCoinControl(TaskTable[id].work[COIN_WORK]);
	
	TaskTable[id].TaskAdrs = TS_BetMainEnd;	//タスクチェンジ
	return;
}
static void TS_BetMain( u8 id )
{
	//キーを入力処理し、適切なベッドテーブルの状態を描画する
	BetMainSelectKeyIn(id);

	//選択枠の点滅処理
	switch(TaskTable[id].work[CNT_WORK])
	{
	case 0:
		DrawWakuWindow((u8)TaskTable[id].work[BET_POS_WORK]);
		TaskTable[id].work[CNT_WORK]++;
		break;
	case 30:
		DrawWakuWindow(0);
		TaskTable[id].work[CNT_WORK]++;
		break;
	case 59:
		TaskTable[id].work[CNT_WORK] = 0;
		break;
	default:
		TaskTable[id].work[CNT_WORK]++;
		break;
	}
	
	if(!(sys.Trg & A_BUTTON)) return;
	
	//選択されたセルに、すでにヒットしていた場合は、選択されない
	if(MG_RLT->rlt_hp & g_rltBet[TaskTable[id].work[BET_POS_WORK]].flg){
		//SEを鳴らす
		SePlay(SE_BOO);
		return;
	}
	
	//決定音を鳴らす
	m4aSongNumStart(SE_REGI);
	TaskTable[id].TaskAdrs = TS_BetMainEndInit;	//タスクチェンジ
	return;
}

/*------------------------------------------------
	画面をスライドさせる１
	スライドが終了したら、ボールを入れる

	static void TS_WinSlide_1st(u8 id)
--------------------------------------------------*/
static void TS_WinSlide_1st(u8 id)
{
	if(TaskTable[id].work[CNT_WORK]-- > 0)
	{
		if(TaskTable[id].work[CNT_WORK] > 2) ActOX += 2;
		MG_RLT->bg1_scrX += 4;

		if(MG_RLT->bg1_scrX == 104){
			ActWork[MG_RLT->act_id[WIN_ODDS]].move = DummyActMove;
		}
		return;
	}

	BanishRoulettePokeControl(1,0xFF);
	BanishSTCellControl(1,0xFF);

	TaskTable[id].TaskAdrs = TS_BallParamInit;	//タスクチェンジ
	TaskTable[id].work[CNT_WORK] = 0;		//タイマークリア
}
/*-----------------------------------------------------
	ボールの初速のランダム幅を返す

	u8 get_range(u16 play_num,u16 rand)
-------------------------------------------------------*/
static u8 get_range(u16 play_num,u16 rand)
{
	switch(MG_RLT->mons_flg){
	case 1:
	case 2:
		if(GameTime.hour < 10 && GameTime.hour >= 4 ){
			if(play_num < 12 || (rand&1)) return g_table[MG_RLT->rlt_ver].uc_rBaseH/2;
			return 1;
		}
		if((rand & 3)==0){
			return g_table[MG_RLT->rlt_ver].uc_rBaseH/2;
		}
		return g_table[MG_RLT->rlt_ver].uc_rBaseH;		
	case 3:
		if(GameTime.hour < 11 && GameTime.hour >= 4){
			if(play_num < 6 || (rand&1)) return g_table[MG_RLT->rlt_ver].uc_rBaseH/2;
			return 1;
		}
		if((rand&1) && play_num > 6) return g_table[MG_RLT->rlt_ver].uc_rBaseH/4;
		return g_table[MG_RLT->rlt_ver].uc_rBaseH/2;
	case 0:
	default:
		if(GameTime.hour < 10 && GameTime.hour >= 4){
			if((rand & 3) == 0) return 1;
			return g_table[MG_RLT->rlt_ver].uc_rBaseH/2;
		}
		else if((rand & 3) == 0){
			if(play_num > 12) return g_table[MG_RLT->rlt_ver].uc_rBaseH/2;
			else			  return g_table[MG_RLT->rlt_ver].uc_rBaseH;
		}
		else if(rand & 0x8000){
			if(play_num > 12) return g_table[MG_RLT->rlt_ver].uc_rBaseH;
			else			  return g_table[MG_RLT->rlt_ver].uc_rBase;
		}
		else{
			return g_table[MG_RLT->rlt_ver].uc_rBase*2;
		}
		return 0;
	}
}
/*------------------------------------------------------
	カレントボールの初期パラメータをセット

	static void TS_BallParamInit(u8 id);
--------------------------------------------------------*/
static void TS_BallParamInit(u8 id)
{
	u16		t = 0;
	u16		aRot[4] = {0,180,90,270};
	u16		r_seed = pp_rand();
	u16		r_seed100 = r_seed % 100;
	s8		rand,ofs;
	u8		range;
	
	MG_RLT->ball.uc_no = GetPreBallNo(id);		//カレントの玉のナンバーを記憶
	MG_RLT->ball.uc_flg =
	MG_RLT->ball.uc_cell =
	MG_RLT->ball.uc_area = 0;

	//初期パラメータの決定
	range = get_range(TaskTable[id].work[NPLAY_WORK],r_seed);
	rand =	r_seed%range - (range/2);

	if(GameTime.hour < 13)	ofs = 0;
	else					ofs = 1;
	if(r_seed100 < 80)	ofs = ofs*2;
	else				ofs = (1-ofs)*2;
	
	//玉がstopするまでの時間を決定
	MG_RLT->ball.us_syncMax = g_table[MG_RLT->rlt_ver].w_t0 + rand;

	t = (u16)((float)MG_RLT->ball.us_syncMax / 5);
	MG_RLT->ball.us_syncA0 = t * 3;
	MG_RLT->ball.us_syncA1 = t;
	MG_RLT->ball.us_syncA2 = t;

	//角速度
	MG_RLT->ball.fr =  (float)aRot[(r_seed&0x0001)+ofs];
	MG_RLT->ball.frv = (float)g_table[MG_RLT->rlt_ver].w_v0;
	MG_RLT->ball.fra = (((MG_RLT->ball.frv/2.0f) - MG_RLT->ball.frv) / (float)MG_RLT->ball.us_syncA0);

	//半径に対する速度
	MG_RLT->ball.fw  = RLT_AREA1_OFS;
	MG_RLT->ball.fwa = 0.0f;
	MG_RLT->ball.fwv = -(RLT_AREA1_SIZ / (float)MG_RLT->ball.us_syncA0);
	MG_RLT->ball.fwo = 36;

	TaskTable[id].TaskAdrs = TS_BallStart;	//タスクチェンジ
}
/*------------------------------------------------------
	ボールをスタートさせる

	static void TS_BallStart(u8 id);
--------------------------------------------------------*/
static void TS_BallStart(u8 id)
{
	//ボールがアクティブになったフラグを立てる
	MG_RLT->ev_bact = 1;

	//ボールをコントロール開始
	GetPreActwork(RLT_BALL0 + MG_RLT->ball.uc_no);
	MG_RLT->pAct->move = BallMoveAct_ST0;
	
	//ゲーム数をプラス
	TaskTable[id].work[LOOP_WORK]++;	//1ゲームのプレイ回数
	TaskTable[id].work[NPLAY_WORK]++;	//連続プレイ回数

	DrawRestballControl(RLT_BALL_MAX - (u8)TaskTable[id].work[LOOP_WORK]);
	
	//玉が転がる音開始
	m4aSongNumStart(SE_TAMAKORO);
	
	TaskTable[id].TaskAdrs = TS_ResultWait;	//タスクチェンジ
}
/*
//--------------------
//		ゲームスタート
//--------------------
*/
//--------------------------
//		賭けた後の処理
//--------------------------

/*------------------------------------------------------
	ルーレットが回っている間の処理です。
	玉を転がし、結果を出します。

	SubTask
	static void ResulutWait(u8 id);

	Depend
		pm_str.h
-----------------------------------------------------*/
static void TS_ResultWait( u8 id )
{
	//玉がとまるまで待って
	if(!(MG_RLT->ball.uc_flg & 0xFF )) return;

	//イベント終了までは帰る
	if(MG_RLT->ev_on){
		//イベント終了チェック
		if(MG_RLT->ev_end){
			MG_RLT->ev_end = 0;	//フラグリセット
			MG_RLT->ev_on = 0;
		}
		return;
	}
	if(TaskTable[id].work[CNT_WORK] == 0){
		//結果をチェック
		TaskTable[id].work[WIN_WORK] = 
			WinCheck(ResultFlgSet(id,MG_RLT->ball.uc_cell),MG_RLT->uc_aBet[MG_RLT->nBet]);

		//当たっていたら、カラーアニメ起動
		if(TaskTable[id].work[WIN_WORK] == RLT_RET_WIN){
			ColorAnimeStart(&MG_RLT->colanm,COLANM_SW12);
		}
	}
	
	// タイムがくるまでウェイトをおく
	if(TaskTable[id].work[ CNT_WORK ] <= 60)
	{
		if(sys.Trg & A_BUTTON) TaskTable[id].work[CNT_WORK] = 60;
		TaskTable[id].work[ CNT_WORK ]++;
		return;
	}

	DrawBetWindow(MG_RLT->uc_aBet[MG_RLT->nBet]);	//テーブルを再表示
	
	//ボールが落ちるデモの準備
	BanishRoulettePokeControl(0,(u8)TaskTable[id].work[LASTHIT_WORK]);	
	BanishSTCellControl(0,TaskTable[id].work[LOOP_WORK]-1);	//ボールが落ちたセルに、ボールを表示

	TaskTable[id].work[ CNT_WORK ] = 32;	//カウンタセット
	TaskTable[id].TaskAdrs = TS_WinSlide_2nd;

	return;
}

/*--------------------------------------------------
	画面をスライドさせる２
	ボールが落ちたあと、画面を元に戻す

	static void TS_WinSlide_2nd(u8 id);
----------------------------------------------------*/
static void TS_WinSlide_2nd(u8 id)
{
	if(TaskTable[id].work[CNT_WORK]-- > 0)
	{
		if(TaskTable[id].work[CNT_WORK] > 2) ActOX -= 2;
		MG_RLT->bg1_scrX -= 4;

		if(MG_RLT->bg1_scrX == 104){
			ActWork[MG_RLT->act_id[WIN_ODDS]].move = Bg1_ScrollActMove;
		}
		return;
	}
	//選択枠の準備
	BanishWakuControl(TaskTable[id].work[LASTHIT_WORK]);	

	if(TaskTable[id].work[WIN_WORK] == RLT_RET_WIN)
		TaskTable[id].work[ CNT_WORK ] = 121;		//カウンタセット
	else
		TaskTable[id].work[ CNT_WORK ] = 61;		//カウンタセット
	TaskTable[id].TaskAdrs = TS_ResultDemo;
}

/*-----------------------------------------------
	結果を表示するデモ

	static void TS_ResultDemo(u8 id);
--------------------------------------------------*/
static void TS_ResultDemo(u8 id)
{
	//デモ中
	if(TaskTable[id].work[CNT_WORK]-- > 1)
	{
		//あたった場所の点滅表示
		switch(TaskTable[id].work[CNT_WORK]%16)
		{
		case 8:
			BanishRoulettePokeControl(0,0xFF);	
			BanishSTCellControl(0,0xFF);
			break;
		case 0:
			BanishRoulettePokeControl(0,(u8)TaskTable[id].work[LASTHIT_WORK]);	
			BanishSTCellControl(0,TaskTable[id].work[LOOP_WORK]-1);
			break;
		default:
			break;
		}
		return;	
	}
	//デモ終わり
	SetWaitNextTask(id,TS_ResultSet,30,0);
}

/*-------------------------------------------
	結果をメッセージで開示
----------------------------------------------*/
//SEがなり終わるまで待つ
static void TS_ResultSetEnd(u8 id)
{
	switch(TaskTable[id].work[WIN_WORK])
	{
	case RLT_RET_WIN:
	case RLT_BONUS_WIN:
		if(JingleWait()==0)return;
		
		//連続勝利数をカウント
		if(GetRecord(CNT_ROULETTE) < ++TaskTable[id].work[NWIN_WORK]){
			SetRecord(CNT_ROULETTE,TaskTable[id].work[NWIN_WORK]);
		}
		SetWaitNextTask(id,TS_ReturnBetFunc,0xFFFF,A_BUTTON|B_BUTTON);
		break;
	case RLT_RET_ROSE:
	default:
		if(SeEndCheck()) return;
		//連続勝利数をリセット
		TaskTable[id].work[NWIN_WORK] = 0;
		SetWaitNextTask(id,TS_ReturnBetFunc2,0xFFFF,A_BUTTON|B_BUTTON);
		break;
	}
	return;
}
//結果メッセージの表示
static void TS_ResultSet(u8 id)
{
	//勝ち負けメッセージの表示
	switch(TaskTable[id].work[WIN_WORK])
	{
	case RLT_RET_WIN:	//勝ち
	case RLT_BONUS_WIN:	//ボーナス時に勝った
		if(TaskTable[id].work[ODDS_WORK] == 12){
			JinglePlay(MUS_ME_B_BIG);
			MsgWrite(MSG_WIN2);
		}
		else{
			JinglePlay(MUS_ME_B_SMALL);
			MsgWrite(MSG_WIN);	
		}
		break;
	case RLT_RET_ROSE:	//負け
	default:
		m4aSongNumStart(SE_HAZURE);
		MsgWrite(MSG_ROST);
		break;
	}
	TaskTable[id].work[CNT_WORK] = 0;
	TaskTable[id].TaskAdrs = TS_ResultSetEnd;
	return;
}

/*--------------------------------------------
	コインの増減

	SubTask
	static void TS_AddCoin(u8 id);
----------------------------------------------*/
static void TS_AddCoin(u8 id)
{
	//効果音を鳴らす
	switch(TaskTable[id].work[WAIT_WORK]){
	case 0:
		TaskTable[id].work[COIN_WORK] += 1;
		m4aSongNumStart(SE_PIN);
		DrawCoinControl(TaskTable[id].work[COIN_WORK]);
		
		if(TaskTable[id].work[COIN_WORK] >= MY_COIN_MAX){
			TaskTable[id].work[CNT_WORK] = MY_COIN_MAX;
			TaskTable[id].work[CNT_WORK] = 0;
			break;
		}
		TaskTable[id].work[CNT_WORK]--;
		TaskTable[id].work[WAIT_WORK]++;
		break;
	case 3:
		m4aSongNumStop(SE_PIN);
		TaskTable[id].work[WAIT_WORK] = 0;
		break;
	default:
		TaskTable[id].work[WAIT_WORK]++;
		break;
	}
	
	if(TaskTable[id].work[CNT_WORK] != 0) return;
	SetWaitNextTask(id,TS_ReturnBetFunc2,0xFFFF,A_BUTTON|B_BUTTON);
}
/*-------------------------------------------
	メッセージ表示後、勝ち負けによりコインの増減

	SebTask
	static void TS_ReturnBetFunc(u8 id);

	Depend
		task.h
		coin.c
-----------------------------------------------*/
static void TS_ReturnBetFunc( u8 id )
{
	//勝ったときには、勝った分のコインを足す
	PM_NumMsgSet(
		StrTempBuffer0,
		MG_RLT->uc_rate*TaskTable[id].work[ODDS_WORK],
		NUM_MODE_LEFT, 2 );
	PM_MsgExpand( MsgExpandBuffer,MSG_GETCOIN);

	//コインＮまい ＧＥＴ
	MsgWrite(MsgExpandBuffer);
		
	TaskTable[id].work[CNT_WORK] = 
		MG_RLT->uc_rate*TaskTable[id].work[ODDS_WORK];
	
	TaskTable[id].work[WAIT_WORK] = 0;
	TaskTable[id].TaskAdrs = TS_AddCoin;	//タスクチェンジ
}

/*----------------------------------------------
	結果が出た後、A・Bボタンが押されるまで待機

	SubTask
	static void TS_ReturnBetFunc2(u8 id);

	Depend
		common.h / system.h
		menutool.c
------------------------------------------------*/
static void TS_ReturnBetFunc2( u8 id )
{
	//カラーアニメーション終わり
	ColorAnimeEnd(&MG_RLT->colanm,0xFFFF);
	MG_RLT->colanm.work[13].live_sw = 
	MG_RLT->colanm.work[14].live_sw = 
	MG_RLT->colanm.work[15].live_sw = 0;

	//ヒットしたポケモンのオブジェクトをBanish
	ActWork[MG_RLT->act_id[RLT_RPOKE00+g_rltBet[TaskTable[id].work[LASTHIT_WORK]].cID]].banish = 1;

	TaskTable[id].TaskAdrs = TS_NextPlaySelectInit;
	return;
}
static void TS_NextPlaySelectInit(u8 id)
{
	u8 i = 0;

	//次へ進む
	TaskTable[id].work[ BET_POS_WORK ] = 0;	//さっき賭けた場所をクリア
	MG_RLT->uc_aBet[MG_RLT->nBet] = 0;

	DrawBetWindow(0);		//ベッドとテーブルを書き直してから
	ActWork[MG_RLT->act_id[RLT_WAKU]].banish = 1;
	
	//ウィンドウオブジェクトチェンジ
	for(i = 0;i < 4;i++)
	{
		ActWork[ MG_RLT->act_id[ WIN_POKE12+i]].oamData.CharNo =
			ActWork[ MG_RLT->act_id[WIN_POKE12+i]].char_num + 
			(u16)(ActWork[ MG_RLT->act_id[WIN_POKE12+i]].anm_tbl)[0][0].pat;		
	}

	//コインがあればもう一度プレイするかのメッセージを出して、タスクチェンジ
	if(TaskTable[id].work[COIN_WORK] >= MG_RLT->uc_rate){
		
		//6回プレイしていたらリセット
		if(TaskTable[id].work[LOOP_WORK] == RLT_GAME_MAX)
		{
			//ゲームリセットメッセージを出す
			MsgWrite(MSG_GCLEAR);
			
			//タスクチェンジ
			SetWaitNextTask(id,TS_GameStateReset,0xFFFF,A_BUTTON|B_BUTTON);
			return;
		}
		
		//リセットしないとき
		if(TaskTable[id].work[COIN_WORK] == MY_COIN_MAX){
			MsgWrite(MSG_FULLCOIN);
			SetWaitNextTask(id,TS_NextPlaySelectMain,0xFFFF,A_BUTTON|B_BUTTON);
		}else{
			TaskTable[id].TaskAdrs = TS_NextPlaySelectMain;
		}
	}
	else{	//コインはもう足りない/プレイ強制終了
		MsgWrite(MSG_SPEND);
		SetWaitNextTask(id,TS_PlayNo,60,A_BUTTON|B_BUTTON);
	}
	return;
}

/*------------------------------------------------
	1セット分のゲームの状態をリセット

	SubTask
	static void TS_GameStateReset(u8 id);
---------------------------------------------------*/
static void TS_GameStateReset(u8 id)
{
	u8	i = 0;
	
	//ゲームのステートをクリア
	GameSetClear(id);

	//盤のポケモンオブジェクトを復帰
	for(i = 0;i < 12;i++){
		ActWork[MG_RLT->act_id[RLT_RPOKE00+i]].banish = 0;
	}
	
	if(TaskTable[id].work[COIN_WORK] == MY_COIN_MAX){
		MsgWrite(MSG_FULLCOIN);
		SetWaitNextTask(id,TS_NextPlaySelectMain,0xFFFF,A_BUTTON|B_BUTTON);
	}else{
		TaskTable[id].TaskAdrs = TS_NextPlaySelectMain;
	}
	return;
}

//=========================================
//		終了してフィールドへ復帰
//=========================================
/*----------------------------------------
	ゲームを終了する前に、フェードアウトをかける

	FileLocal
	static void RouletteEndInit(u8 id);

	u8	id	呼び出すサブタスクナンバー

	Depend
		task.h
		palanm.h/palanm.c
------------------------------------------*/
static void RouletteEndInit( u8 id )
{
	//カラーアニメ強制停止
	ColorAnimeEnd(&MG_RLT->colanm,0xFFFF);
	ColorAnimeInit(&MG_RLT->colanm);
	
	//コインの残量でフラグを立てておく
	//フィールド復帰したときのメッセージ変更用
	Fld.my_coin = TaskTable[id].work[COIN_WORK];
	if(Fld.my_coin < MG_RLT->uc_rate)	ScriptParameter0 = 1;
	else								ScriptParameter0 = 0;
	
	//フェードアウトリクエスト
	HardFadeReq(0xFF,0,0,16,0);
	
	//タスクチェンジ
	TaskTable[id].TaskAdrs = TS_RouletteEnd;
}

/*-------------------------------------------
	ゲームを終了し、フィールドへメインタスクを復帰する

	SubTask
	static void TS_RouletteEnd(u8 id);

	Depend
		task.h
		palanm.h
		rlt_obj.h
		fld_main.h
		fld_task.h
------------------------------------------------*/
static void TS_RouletteEnd( u8 id )
{
	if(PaletteAnime()) return;

	SetVBlankFunc(NULL);	// 割込み関数設定(VBLANK)

	//使用したワークエリア初期化
	memset(MG_RLT,0,sizeof(ROULETTE));
	
	//アクター用スクリーンスクロールグローバル値を初期化
	ActOX = ActOY = 0;
	
	ItemToolAGBRegInit();		// レジスタ・VRAM・OAM・PALRAM初期化
	
	ObjPalManInit();			// オブジェクトパレットマネージャ初期化
	PaletteAnimeInit();			// ﾊﾟﾚｯﾄｱﾆﾒ 初期化
	InitActor();				// ｱｸﾀｰ初期化
	BGDataInit();				// BG展開用バッファ初期化
	
	//ブレンディングパラメータをリセット
	*(vu16 *)REG_BLDCNT = 0;
	*(vu16 *)REG_BLDALPHA = 0;
	*(vu16 *)REG_BLDY = 0;
		
	pFieldRecoverFunc = AddScriptFieldInTask;	//fld_main.h / fld_task.h
	MainProcChange( FieldMainRecover );			//メインタスクチェンジ
	DelTask(id);	//ルーレットサブタスク削除

#ifdef PM_DEBUG
	//デバッグ用のフラグを切る
	g_rlt_debug_sw = 0;
#endif	//PM_DEBUG	
	return;
}

//=======================================================
//	ローカル関数
//=======================================================

////////////////////////////////////////////////////////
//	タスク制御関連
////////////////////////////////////////////////////////
/*----------------------------------------------
	ウェイト待ちのサブタスク

	static void TS_WaitNextTask(u8 id);
------------------------------------------------*/
static void TS_WaitNextTask(u8 id)
{
	//ウェイト終了か、キャンセルキーが押されていたら次
	if(	(MG_RLT->task.us_wait == 0) ||
		(sys.Trg & MG_RLT->task.us_cKey) ){
		TaskTable[id].TaskAdrs = MG_RLT->task.wait_ret_adrs;
	
		//キーをとった場合、SEを鳴らす
		if(MG_RLT->task.us_cKey != 0){
			SePlay(SE_SELECT);
		}

		//使用したパラメータクリア
		MG_RLT->task.wait_ret_adrs = NULL;
		MG_RLT->task.us_wait = MG_RLT->task.us_cKey = 0;
	}
	//キャンセルされるまで、無限ループでなければ、ウェイト値をマイナス
	if(MG_RLT->task.us_wait != 0xFFFF) MG_RLT->task.us_wait--;
}

/*----------------------------------------------
	一定のウェイトをおいて、次のタスクに切り替える

	io	u8			現在のサブタスクID
	i	pTaskFunc	ウェイト後に飛ぶタスク
	i	u16			ウェイト値(Sync)--0xFFFFの場合はキーをとるまで無限にウェイト
	i	u16			キーキャンセルできる場合のキーフラグ
------------------------------------------------*/
static void SetWaitNextTask(u8 id,pTaskFunc pAdrs,u16 wait,u16 key)
{
	//現在のアドレスを保存
	MG_RLT->task.back_adrs = TaskTable[id].TaskAdrs;

	//次に飛ぶアドレスを保存
	if(pAdrs == NULL) pAdrs = MG_RLT->task.back_adrs;
	MG_RLT->task.wait_ret_adrs = pAdrs;
	
	//ウェイトの保存
	MG_RLT->task.us_wait = wait;

	//キャンセルキーの保存
	if(wait == 0xFFFF && key == 0){		//無限ループ指定のときに、キー指定がなかったら
		MG_RLT->task.us_cKey = 0xFFFF;	//なんか押されたら抜ける
	}
	else{
		MG_RLT->task.us_cKey = key;
	}

	//タスクチェンジ
	TaskTable[id].TaskAdrs = TS_WaitNextTask;
}

////////////////////////////////////////////////////////
//	ゲームの状態をクリアする
////////////////////////////////////////////////////////
/*--------------------------------------------
	1ゲームの状態をクリア
----------------------------------------------*/
static void OneGameStateClear(u8 id)
{
	u8	ct = 0;

	MG_RLT->time_flg = 0;

	//イベント関連のフラグクリア
	MG_RLT->ev_bact = 0;		//ボールのアクティブ解除
	MG_RLT->ev_on = 0;			//スタックイベントフラグクリア
	MG_RLT->ev_end = 0;
	MG_RLT->ev_no = 0;

	//ベットする場所をクリア
	for(ct = 0;ct < RLT_BET_MAX;ct++)
		MG_RLT->uc_aBet[ct] = 0;

	//現在賭けている枚数をクリア
	MG_RLT->nBet = 0;
	
	//タイマークリア
	TaskTable[id].work[CNT_WORK] = 0;
}

////////////////////////////////////////////////////////
//	セルのヒット状態管理
////////////////////////////////////////////////////////
/*-----------------------------
	セルのヒット状態をクリアする
	
	FileLocal
	static void HitCellClear(void);
--------------------------------*/
static void HitCellClear(void)
{
	u8 i;
		
	MG_RLT->rlt_hp = 0;

	for(i = 0;i < RLT_BET_MAX;i++)
	{
		MG_RLT->hit_cell[i] = 0;
	}
	//縦ラインクリア
	for(i = 0;i < 4;i++)
		MG_RLT->hit_vLine[i] = 0;
	for(i = 0;i < 3;i++)
		MG_RLT->hit_hLine[i] = 0;

	//テーブル用ボール表示オブジェクトをクリア
	BanishSTCellControl(1,0xFF);
	return;
}

/*---------------------------------------------------
	ヒットしたセルナンバーから、結果をフラグに保存する
	ヒットしたセルのフラグナンバーを返す

	FileLocal
	static u8 ResultFlgSet(u8 id,u8 hit);

	i	u8	サブタスクのメインID
	i	u8	ヒットしたセルナンバー(0-11)

	return u8	ヒットしたセルのフラグナンバー

	ビット対応表					// エリアナンバー対応表
		x  | 01 | 02 | 03 | 04		x  | XX | XX | XX | XX
		05 | 06 | 07 | 08 | 09		x  | 01 | 03 | 05 | 07
		10 | 11 | 12 | 13 | 14		x  | 09 | 11 | 13 | 15
		15 | 16 | 17 | 18 | 19		x  | 17 | 19 | 21 | 23
------------------------------------------------------*/
static u8 ResultFlgSet(u8 id, u8 hit )
{
	u32 vflg[4] = {BET_FLG_VP1,BET_FLG_VP2,BET_FLG_VP3,BET_FLG_VP4};
	u32 hflg[3] = {BET_FLG_HR,BET_FLG_HG,BET_FLG_HB};
	u8	i,j;
	
	//変な数値が入ってきたらはじく
	if(hit >= RLT_CELL_MAX){
		
		return 0;
	}

	//ヒットしたセルを順番に覚えておく
	MG_RLT->hit_cell[TaskTable[id].work[LOOP_WORK]-1] = g_rltCell[hit].uc_bit;

	//最後にHITした場所を保存
	TaskTable[id].work[LASTHIT_WORK] = (u16)g_rltCell[hit].uc_bit;

	//全体管理のフラグを立てる
	MG_RLT->rlt_hp |= g_rltCell[hit].ui_flg;

	//縦
	for(j = 0;j < 4;j++){
		if(g_rltCell[hit].ui_flg & vflg[j]) MG_RLT->hit_vLine[j]++;

		//そろったのでフラグを立てる
		if(MG_RLT->hit_vLine[j] >= 3) MG_RLT->rlt_hp |= vflg[j];
	}
	//横
	for(i = 0;i < 3;i++){
		if(g_rltCell[hit].ui_flg & hflg[i]) MG_RLT->hit_hLine[i]++;

		//そろったのでフラグを立てる
		if(MG_RLT->hit_hLine[i] >= 4) MG_RLT->rlt_hp |= hflg[i];
	}

	return	g_rltCell[hit].uc_bit;
}

/*-----------------------------------------------
	勝ち・負け判定

	FileLocal
	static u8 WinCheck(u8 bitNo, u8 bet);

	i	u8	hit		ヒットしたセルのフラグビットナンバー
	i	u8	bet		賭けていた場所のナンバー(1-19)

	return	u8		0: RLT_RET_ROSE		負け
					1: RLT_RET_WIN		勝ち
					2: RLT_BONUS_WIN	ボーナス時の勝ち
					3: RLT_NO_BET		賭けていない

	フラグビット対応表				// エリアナンバー対応表
		x  | 01 | 02 | 03 | 04		x  | XX | XX | XX | XX
		05 | 06 | 07 | 08 | 09		x  | 01 | 03 | 05 | 07
		10 | 11 | 12 | 13 | 14		x  | 09 | 11 | 13 | 15
		15 | 16 | 17 | 18 | 19		x  | 17 | 19 | 21 | 23	
-------------------------------------------------*/
static u8 WinCheck( u8 bitNo, u8 bet )
{
	//変な数値が入ってきたら問答無用で外れ(仮)
	if(bitNo == 0 || bitNo > 19) return RLT_RET_ROSE;
	
	switch( bet ){
	case 0:	//賭けていないとき
		return RLT_NO_BET;
	case 1:
	case 2:
	case 3:
	case 4:
		//ポケモンの種類に賭けたとき
		if( bitNo == 5+bet || bitNo == 10+bet || bitNo == 15+bet )
			return	RLT_RET_WIN;//+(u8)MG_RLT->rlt_bonus;
		break;
	case 5:
	case 10:
	case 15:
		//色に賭けたとき
		if( bitNo >= bet+1 && bitNo <= bet+4 )
			return	RLT_RET_WIN;// + (u8)MG_RLT->rlt_bonus;
		break;
	default:
		//単体に賭けたとき
		if( bitNo == bet )	return	RLT_RET_WIN;// + (u8) MG_RLT->rlt_bonus;
	}

	//外れたとき
	return	RLT_RET_ROSE;
}

//////////////////////////////////////////////////////////////////
//	描画系補助
///////////////////////////////////////////////////////////////////
/*----------------------------------------------------
	どこにかけたかで、カラーアニメーションを起動

	staic void RltColorChange(u8 pos)
	
	u8 pos 賭けた場所のセルナンバー(0-19)
------------------------------------------------------*/
static void RltColorChange(u8 pos)
{
	u8	num = 0,i = 0,no = 0;
	u16	ofs = 0,flg = 0;
	ColAnmData	dat[3];
	
	switch(pos)
	{
	case 5:
	case 10:
	case 15:
		for(i = pos+1;i < pos+5;i++){
			if(MG_RLT->rlt_hp & g_rltBet[i].flg) continue;
			flg |= g_rltBet[i].canm;
		}
		ColorAnimeStart(&MG_RLT->colanm,(flg & (COLANM_SW13^0xFFFF)));
		return;
	default:
		break;
	}
	
	memcpy(&dat,&(g_colanm[13]),sizeof(ColAnmData)*3);
	
	//オブジェ用パレットのカラー数
	if(pos > 0 && pos < 5){
		num = 3;
	}
	else{
		num = 1;
	}
	ofs = (pos / 5) - 1;
	//カラーナンバー
	switch(pos%5)
	{
	case 1:
		ofs = ActWork[MG_RLT->act_id[RLT_RPOKE00]].oamData.Pltt*16;
		break;
	case 2:
		ofs = ActWork[MG_RLT->act_id[RLT_RPOKE01]].oamData.Pltt*16;
		break;
	case 3:
		ofs = ActWork[MG_RLT->act_id[RLT_RPOKE02]].oamData.Pltt*16;
		break;
	case 4:
		ofs = ActWork[MG_RLT->act_id[RLT_RPOKE03]].oamData.Pltt*16;
		break;
	}
	if(num == 1){
		if(MG_RLT->rlt_hp & g_rltBet[pos].flg) return;
		dat[(pos/5)-1].w_colNo += ofs;
		AddColorAnime(&MG_RLT->colanm,13,&(dat[pos/5-1]));
	}
	else{
		for(i = 0;i < 3;i++){
			no = 5*i+pos+5;
			if(MG_RLT->rlt_hp & g_rltBet[no].flg) continue;
			dat[(no/5)-1].w_colNo += ofs;
			AddColorAnime(&MG_RLT->colanm,13+i,&(dat[(no/5)-1]));
			
			if(num == 3) flg = g_rltBet[no].canm;
			num--;
		}

		if(num != 2) flg = 0;
	}
	
	ColorAnimeStart(&MG_RLT->colanm,g_rltBet[pos].canm | flg);
	return;
}

/*------------------------------------
	現在のヒット状態をチェックしてベッドウィンドウを表示

	FileLocal
	static void DrawBetWindow(u8 pos);

	Depend
		rlt_obj.c
		itemtool.h / screen.h / screen.c
------------------------------------*/
static void DrawBetWindow(u8 pos)
{
	vu8		i,j;
	vu16	x,y;
	vu8		dy;
	u8		no,tbl[5];

	//Bg1の書き直しフラグを立てておく
	MG_RLT->bg1_cnt = 1;

	//ヒットしているかいないかチェックして、ヒットしている場所のポケモンOBJは消す
	BanishRoulettePokeControl(0,0);

	//まずは全体のウィンドウを描いてしまう
	SetChar16(BG1_data,BG01_MAP,14,7,16,13);
	
	//現在選択されているセルを、明るく表示
	switch(pos){
	case 0:
		return;
	case 1:
	case 2:
	case 3:
	case 4:
		no = 4;
		for(i = 0;i < no;i++){
			tbl[i] = pos+i*5;
		}
		break;
	case 5:
	case 10:
	case 15:
		no = 5;
		for(i = 0;i < no;i++){
			tbl[i] = pos+i;
		}
		break;
	default:
		no = 1;
		tbl[0] = pos;
		break;
	}
	for(i = 0;i < no;i++)
	{
		//埋めるボックスデータのキャラクタ番号
		dy	= g_rltBet[tbl[i]].dy;
		x	= g_rltBet[tbl[i]].posx;
		for( j=0; j<3; j++ ){	//明色のボックスを描く
			y = (g_rltBet[tbl[i]].posy+j)<<5;
			BG1_data[ x+y ]   = BG01_SMAP[(dy+j)*3 + 0];
			BG1_data[ x+y+1 ] = BG01_SMAP[(dy+j)*3 + 1];
			BG1_data[ x+y+2 ] = BG01_SMAP[(dy+j)*3 + 2];
		}
	}
	return;
}

/*-----------------------------------------------
	指定セルのオッズを返す

	static u8 GetOddsPreCell(u8 no);

	u8	no	指定するテーブルセルナンバー
--------------------------------------------------*/
static u8 GetOddsPreCell(u8 no)
{
	u8	oddsTbl[5] = {0,3,4,6,12};

	if(no > 19) no = 0;
	
	switch(g_rltBet[no].odds)
	{
	case 3:		//色賭けのセル場合
		no = no /5-1;
		if(MG_RLT->hit_hLine[no] >= 4) return 0;	//横が埋まっている
		
		return oddsTbl[MG_RLT->hit_hLine[no]+1];
	case 4:		//種類賭けのセルの場合
		no = no-1;
		if(MG_RLT->hit_vLine[no] >= 3) return 0;
		return oddsTbl[MG_RLT->hit_vLine[no]+2];
		break;
	case 12:	//単体に賭けた場合
		if(MG_RLT->rlt_hp & g_rltBet[no].flg) return 0;
		return oddsTbl[4];
	default:
		return 0;
	}
}

//----------------------------------
//		ルーレット盤回転処理
//----------------------------------
static void RouletteBGRotate(void)
{
	s32	bg_start_x,bg_start_y;

	*(vu16*)REG_BG2PA = MG_RLT->bg_sPa;
	*(vu16*)REG_BG2PB = MG_RLT->bg_sPb;
	*(vu16*)REG_BG2PC = MG_RLT->bg_sPc;
	*(vu16*)REG_BG2PD = MG_RLT->bg_sPd;

	//BG回転の参照開始点
	bg_start_x = 
		( CENTER_X << 8 )-( MG_RLT->bg_sPa * (CENTER_X+ActOX) )-( MG_RLT->bg_sPb * (CENTER_Y+BG2_DISP_OFSY+ActOY) );
	bg_start_y = 
		( CENTER_Y << 8 )-( MG_RLT->bg_sPc * (CENTER_X+ActOX) )-( MG_RLT->bg_sPd * (CENTER_Y+BG2_DISP_OFSY+ActOY) );

    *(vu16 *)REG_BG2X_L = (u16)(bg_start_x & 0xffff);
    *(vu16 *)REG_BG2X_H = (u16)(u32)( ( bg_start_x & 0x0fff0000 ) >> 16 );
    *(vu16 *)REG_BG2Y_L = (u16)(bg_start_y & 0xffff);
    *(vu16 *)REG_BG2Y_H = (u16)(u32)( ( bg_start_y & 0x0fff0000 ) >> 16 );
	return;
}

//--------------------------------------------------------------
//                     a*b を求める
//--------------------------------------------------------------
s16 fix_mul( s16 a, s16 b )
{
    s32 tmp;
    tmp = a;
    tmp *= b;
    tmp /= 0x100;
    return (s16)tmp;
}

//--------------------------------------------------------------
//                     1/b を求める
//--------------------------------------------------------------
s16 fix_inverse( s16 b )
{
    s32 tmp;
    tmp = 0x10000;
    tmp /= b;
    return (s16)tmp;
}


//========================================================================================
//										話しかけから
//========================================================================================
//////////////////////////////////////////////////////
//	コインが足りているときに、プレイするかしないか
//////////////////////////////////////////////////////
/*-----------------------------------------------------------
	初回にプレイする、しないを選択するタスクとして機能する

	SubTask
	static void TS_FirstPlaySelectMain(u8 id);

	depend	
		menutool.c
		itemtool.c
---------------------------------------------------------------*/
static void TS_FirstPlaySelectMain( u8 id )
{
	//表示位置を指定して、YesOrNoのメニューboxを表示する
	YesNoSelectInit( YESNO_WINX, YESNO_WINY );	//menutool.c

	//TS_PlayYes または TS_PlayNo にサブタスクチェンジ
	SelectToolInit( id, &sg_yes_no_1st );
}

//////////////////////////////////////////////
// YES
static void TS_SetRoulettePlay( u8 id )
{
	//フェードアウトが終わるまで待つ
	if( !(FadeData.fade_sw) ){
		SetVBlankFunc(NULL);	// 割込み関数設定(VBLANK)
		MainProcChange( TM_RouletteInit );
		DelTask(id);
	}
}
/*----------------------------------------------
	プレイするを選んだときの処理（一番初め）
	SelectToolInit(id,&sg_yes_no); より

	SubTask
	static void TS_PlayYes_1st(u8 id)

	Depend
		menutool.c
		itemtool.c
------------------------------------------------*/
static void TS_PlayYes_1st( u8 id )
{
	//YesNoメッセージBoxを消去
	NMenuBoxClear( YESNO_WINX, YESNO_WINY, YESNO_WINX+6, YESNO_WINY+5 );
	NMenuScreenClear();
	
	//フェードアウトリクエスト
	PaletteFadeReq(0xFFFFFFFF,0,0,16,0x0000);
	FadeData.wait = FadeData.wait_def;
	PaletteAnime();

	//タスクチェンジ
	TaskTable[id].TaskAdrs = TS_SetRoulettePlay;
	return;
}

//////////////////////////////////////////////
// NO
/*--------------------------------------------
	プレイを終了をリクエストする

	SubTask
	static void TS_PlayNo_1st(u8 id);
----------------------------------------------*/
static void TS_PlayNo_1st( u8 id )
{
#ifdef PM_DEBUG	
	//デバッグ用フラグ解除
	g_rlt_debug_sw = 0;
#endif	//PM_DEBUG

	//強制イベントを解除して、フィールドに戻る
	NMenuScreenClear();		//スクリーンメッセージクリア
	ResetForceEvent();
	DelTask(id);
}

//////////////////////////////////////////////////////
//コインがなくてプレイできないとき
//////////////////////////////////////////////////////
static void TS_FirstPlayNoCoinEnd(u8 id)
{
	TaskTable[id].work[0]++;

	//60sync経過するか、ボタンが押されたらメッセージを消して終わり
	if( ((sys.Trg & (A_BUTTON | B_BUTTON)) != 0) || (TaskTable[id].work[0] > 60))
	{
		ScriptParameter0 = 1;
		NMenuScreenClear();
		ResetForceEvent();
		DelTask(id);
	}
}

//=====================================
//		プレイする？	初回
//=====================================

/*---------------------------------------------------
	ボーナスタイムかどうかを表示する

	TS_FirstPlayIfBonus(u8 id);
-------------------------------------------------------*/
static void TS_FirstPlayIfBonus(u8 id)
{
	u8	rate;
	
	rate = g_rltRate[ScriptParameter0 >> 7][ScriptParameter0 & RLT_CHECK_RATE];	
	PM_NumMsgSet(StrTempBuffer0,rate,NUM_MODE_ZERO,1);
	PM_MsgExpand(MsgExpandBuffer,MSG_START);
	SetMsgWrite( id,MsgExpandBuffer, TS_FirstPlaySelectMain);
}
/*---------------------------------------------------
	初期プレイ時に遊ぶか遊ばないかのメッセージを表示

	SubTask	
		staitc void TS_FirstPlaySelectInit(u8 id);

	Depend
		itemtool.c
------------------------------------------------------*/
static void TS_FirstPlaySelectInit( u8 id )
{
	u8	rate;
	
	//メッセージ表示が終了次第このサブタスクのアドレスを変更する
	//この台のレートは？？です、あそびますか？

	//自分が今もっているコインの枚数を表示
	//数値→文字列変換(バッファ、数値、変換モード、表示桁数)
	PM_NumMsgSet( StrTempBuffer0,TaskTable[id].work[COIN_WORK], NUM_MODE_SPACE, 4 );	//pm_str.c
	//I_MSG_をバッファに展開
	PM_MsgExpand( MsgExpandBuffer, msg_str_bet );
	//矩形領域にウィンドウ描画
	NMenuWinBoxWrite( 0, 0, 9, 3 );	//menutool.c
	//指定位置にメッセージ描画
	NMenuMsgWrite( MsgExpandBuffer, 2, 1 );

	//台のバージョンによって、賭け枚数の単位が決まる
	//レートに応じて、コインが足りるか足りないか？
	rate = g_rltRate[ScriptParameter0 >> 7][ScriptParameter0 & RLT_CHECK_RATE];	
	
	PM_NumMsgSet(StrTempBuffer0,rate,NUM_MODE_ZERO,1);
	if(TaskTable[id].work[COIN_WORK] >= rate)		//コインが足りるので遊べます
	{
		if((ScriptParameter0 & RLT_IF_BONUS) && (ScriptParameter0 & RLT_CHECK_RATE)){
			MsgWrite(MSG_BONUS);
			SetWaitNextTask( id,TS_FirstPlayIfBonus,0xFFFF,A_BUTTON|B_BUTTON);
		}
		else{
			PM_MsgExpand(MsgExpandBuffer,MSG_START);
			SetMsgWrite( id,MsgExpandBuffer, TS_FirstPlaySelectMain);
		}
	}
	else{	//レートに対して、コインが足りません
		PM_MsgExpand(MsgExpandBuffer,MSG_NOCOIN);
		SetMsgWrite( id,MsgExpandBuffer, TS_FirstPlayNoCoinEnd);
		TaskTable[id].work[COIN_WORK] = 0;
		TaskTable[id].work[0] = 0;
	}
}

//////////////////////////////////////////////////
//デバッグ用にコインの枚数を選ばせる
#ifdef PM_DEBUG
static const u8 msg_selectcoin[] = {
	KO_,I_,N_,no_,spc_,ka_,zu_,spc_,S__,T__,A__,R__,T__,de_,spc_,ki_,me_,te_,CR_,
	A__,bou_,p__,n1_,spc_,B__,bou_,m__,n1_,spc_,R__,colon_,L__,bou_,batu_,n1_,n0_,EOM_,
};
extern u8 g_stackFlg;
static void TS_DmyRltCoinSet(u8 id)
{
	u8	msg_coin[] = {I_MSG_,STR_TEMP_BUF0,EOM_};
	
	if(sys.Trg & A_BUTTON)	
	{
		TaskTable[id].work[COIN_WORK]++;
		if(TaskTable[id].work[COIN_WORK] == 10000) TaskTable[id].work[COIN_WORK] = 0;

		//数値→文字列変換(バッファ、数値、変換モード、表示桁数)
		PM_NumMsgSet( StrTempBuffer0,TaskTable[id].work[COIN_WORK], NUM_MODE_SPACE, 4 );	//pm_str.c
		//I_MSG_をバッファに展開
		PM_MsgExpand( MsgExpandBuffer, msg_coin );
		
		//指定位置にメッセージ描画
		NMenuMsgWrite( MsgExpandBuffer, 2, 1 );
		return;
	}
	if(sys.Trg & B_BUTTON)
	{
		TaskTable[id].work[COIN_WORK]--;
		if(TaskTable[id].work[COIN_WORK] == -1) TaskTable[id].work[COIN_WORK] = MY_COIN_MAX;
		
		//数値→文字列変換(バッファ、数値、変換モード、表示桁数)
		PM_NumMsgSet( StrTempBuffer0,TaskTable[id].work[COIN_WORK], NUM_MODE_SPACE, 4 );	//pm_str.c
		//I_MSG_をバッファに展開
		PM_MsgExpand( MsgExpandBuffer, msg_coin );
		
		//指定位置にメッセージ描画
		NMenuMsgWrite( MsgExpandBuffer, 2, 1 );	
		return;
	}
	if(sys.Trg & R_BUTTON)
	{
		TaskTable[id].work[COIN_WORK] += 10;
		if(TaskTable[id].work[COIN_WORK]  >= 10000) TaskTable[id].work[COIN_WORK] -= MY_COIN_MAX;
		
		//数値→文字列変換(バッファ、数値、変換モード、表示桁数)
		PM_NumMsgSet( StrTempBuffer0,TaskTable[id].work[COIN_WORK], NUM_MODE_SPACE, 4 );	//pm_str.c
		//I_MSG_をバッファに展開
		PM_MsgExpand( MsgExpandBuffer, msg_coin );
	
		//指定位置にメッセージ描画
		NMenuMsgWrite( MsgExpandBuffer, 2, 1 );	
		return;
	}
	if(sys.Trg & L_BUTTON)
	{
		TaskTable[id].work[COIN_WORK] -= 10;
		if(TaskTable[id].work[COIN_WORK] <= -1) TaskTable[id].work[COIN_WORK] += MY_COIN_MAX;
		
		//数値→文字列変換(バッファ、数値、変換モード、表示桁数)
		PM_NumMsgSet( StrTempBuffer0,TaskTable[id].work[COIN_WORK], NUM_MODE_SPACE, 4 );	//pm_str.c
		//I_MSG_をバッファに展開
		PM_MsgExpand( MsgExpandBuffer, msg_coin );
		
		//指定位置にメッセージ描画
		NMenuMsgWrite( MsgExpandBuffer, 2, 1 );	
		return;
	}
	
	//決定
	if(sys.Trg & START_BUTTON)
	{
		Fld.my_coin = TaskTable[id].work[COIN_WORK];
		TaskTable[id].TaskAdrs = TS_FirstPlaySelectInit;
		
		//数値→文字列変換(バッファ、数値、変換モード、表示桁数)
		PM_NumMsgSet( StrTempBuffer0,TaskTable[id].work[COIN_WORK], NUM_MODE_SPACE, 4 );	//pm_str.c
		//I_MSG_をバッファに展開
		PM_MsgExpand( MsgExpandBuffer, msg_coin );
		
		//指定位置にメッセージ描画
		NMenuMsgWrite( MsgExpandBuffer, 2, 1 );	

		g_stackFlg = 0;	
		return;
	}
	if(sys.Trg & SELECT_BUTTON)
	{
		Fld.my_coin = TaskTable[id].work[COIN_WORK];
		TaskTable[id].TaskAdrs = TS_FirstPlaySelectInit;
		
		//数値→文字列変換(バッファ、数値、変換モード、表示桁数)
		PM_NumMsgSet( StrTempBuffer0,TaskTable[id].work[COIN_WORK], NUM_MODE_SPACE, 4 );	//pm_str.c
		//I_MSG_をバッファに展開
		PM_MsgExpand( MsgExpandBuffer, msg_coin );
		
		//指定位置にメッセージ描画
		NMenuMsgWrite( MsgExpandBuffer, 2, 1 );	

		g_stackFlg = 1;	
		return;
	}	
}

static void TS_DmyRltCoinSetInit(u8 id)
{
	TaskTable[id].work[COIN_WORK] = Fld.my_coin;
	
	//1/2の確率でボーナス
	if(pp_rand()&0x0001) ScriptParameter0 |= RLT_IF_BONUS;

	//数値→文字列変換(バッファ、数値、変換モード、表示桁数)
	PM_NumMsgSet( StrTempBuffer0,TaskTable[id].work[COIN_WORK], NUM_MODE_SPACE, 4 );	//pm_str.c
	//I_MSG_をバッファに展開
	PM_MsgExpand( MsgExpandBuffer, msg_str_bet );
	//矩形領域にウィンドウ描画
	NMenuWinBoxWrite( 0, 0, 9, 3 );	//menutool.c
	//指定位置にメッセージ描画
	NMenuMsgWrite( MsgExpandBuffer, 2, 1 );

	SetMsgWrite(id,msg_selectcoin,TS_DmyRltCoinSet);
	return;
}
#endif	//ifdef PM_DEBUG

void RouletteSet(void)
{
	u8	id;

	SetForceEvent();

#ifdef PM_DEBUG
	g_stackFlg = 0;
	if(g_rlt_debug_sw){
		//ダミールーチン-使用するコインの枚数を選ばせる
		id = AddTask(TS_DmyRltCoinSetInit,0);
		return;
	}
#endif	//PM_DEBUG	

	//非デバッグ時
	id = AddTask(TS_FirstPlaySelectInit,0);
	TaskTable[id].work[COIN_WORK] = Fld.my_coin;		
}
