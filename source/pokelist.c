//=========================================================================
//
//		ポケモン手持ちリスト
//														by matsuda
//=========================================================================
#include "common.h"
#include "ef_tool.h"
#include "calctool.h"
#include "actor.h"
#include "actanm.h"

#include "poketool.h"
#include "madefine.h"
#include "decord.h"
#include "cli_num.h"
#include "cli_def.h"
#include "gauge.h"
#include "client_t.h"
#include "print.h"
#include "palanm.h"
#include "pokelist.h"

#include "menu.h"
#include "param.h"
#include "bss.h"
#include "task.h"
#include "intr.h"
#include "pokeicon.h"
#include "extanm.h"
#include "window.h"
#include "server.h"
#include "fight.h"
#include "wazatool.h"
#include "itemtool.h"
#include "mus_tool.h"

#include "field.h"
#include "mail.h"
#include "item.h"
#include "bag.h"
#include "b_pmlist.h"
#include "f_pmlist.h"
#include "cubecase.h"
#include "shinka.h"
#include "p_status.h"
#include "my_pc.h"
#include "seed.h"
#include "message.h"
#include "laster.h"

#include "monsno.def"
#include "wazano.def"
#include "waza_mcn.def"


//=========================================================================
//	グローバル変数
//=========================================================================
extern TALK_WIN	FightMsg;
extern TALK_WIN * pWin;
extern u8	UseFldPokeFlg;

u8 ListStatus = 0;	//ﾎﾟｹﾓﾝﾘｽﾄがどの処理を行って終了したか返す
u8 ListBuffer = 0;	//ﾎﾟｹﾓﾝﾘｽﾄの戻り値
u8 ListMsgStatus = 0;	//0:ﾒｯｾｰｼﾞ表示中ではない　　1:ﾒｯｾｰｼﾞ表示中

// アイテム使用処理 2002/02/18 by nakahiro
// id = ﾒｲﾝﾀｽｸのID  itemno = ｱｲﾃﾑ番号  ReturnAdrs = 戻り先のｱﾄﾞﾚｽ
void (*PokeListItemUseFunc)( u8 id, u16 itemno, pTaskFunc ReturnAdrs );


//=========================================================================
//	外部関数宣言
//=========================================================================
extern void MakeMenuWindow(u8 x,u8 y,u8 w,u8 max,const MENU_ITEM *menu,const u8 *List);


//=========================================================================
//	プロトタイプ宣言
//=========================================================================
static void PokeListInit(void);	// 初期化ループ
static u8	DefoListInit(void);	// 共通初期描画処理

static void PokeListRegisterInit(void);
static void PokeListNumberPut(u16 number, u8 TransCharNo, u8 yose, u8 xpos, u8 ypos);
void PokemonSort(u8 taskno);
static u8	GetPataChrActNo(u8 taskno, u8 patachr_no);
static void SetPataChrActNo(u8 taskno, u8 patachr_no, u8 actno);
static u8	GetNowCursorActNo(u8 taskno);
static void SetNowCursorActNo(u8 taskno, u8 actno);
static void PokemonSortEnd(u8 taskno);
void PokemonSortEnd2(u8 taskno);
static void StatusAreaClear(u8 pos);
static void PokeScrMsgPut(u8 id);
static u8	GetItemIconActNo(u8 taskno, u8 get_pos);
static void ItemIconSeq(actWork *Xreg);
static void ScrMsgWait(u8 id);
static void ItemKoukanYesNoInit(u8 id);
static void MailTensouYesNoInit(u8 id);
static void WazaKoukanYesNoInit(u8 id);
static void WazaKoukanYesNoMain(u8 id);
static void WazaAkirameYesNoInit(u8 id);
static void WazaAkirameYesNoMain(u8 id);
static void ListPokeWazaSet2(u8 id);
static void DelWazaSelectInit(u8 id);
static void WazaOboetaSeq(u8 id);
static void WazaAkirameSelectSeq(u8 id);
static void LifeScrMsgWait(u8 id);
static void LifeScrMsgWait2(u8 id);
static void LifeGaugeUpMain(u8 id);
static void WazaPPRecoverSet(u8);
static void WazaPPRecoverCancel(u8);
static void SetAzukaruMsg( u8, u16, u8 );	// "あずかる"メッセージをセット
static void PokeActSelectMove( actWork * );
static void PokeActNotSelectMove( actWork * );
static void PokeActAnmChenge( u8, u8, u8 );
static void PokeSelectCard( const u8 * cp, u8 pos, u8 pal, u8 flg );
static void WazaOboeNextCheck( u8 id );
static u8 VidoroCheck( u16 item );	//	ビードロチェック

static void PokeCardVBlank(void);	// VBlank内でカードを転送

//=========================================================================
//	定数定義
//=========================================================================

//--------- 文字列長 ----------//
#define P_FONT_SIZE		2					// 8x16
#define P_MONS_NAME_LEN	(6 * P_FONT_SIZE)	// EOMを含めたﾎﾟｹﾓﾝの名前の長さ
#define P_POKE_MAX		TEMOTI_POKEMAX		// 手持ちﾎﾟｹﾓﾝMAX
#define P_KETA			(4 * P_FONT_SIZE)	// 数値表示桁数(EOMを含めて4文字(3桁))
#define P_SPACE_LEN		P_FONT_SIZE
#define P_NAME_LEN		(P_MONS_NAME_LEN * P_POKE_MAX)
#define P_LV_LEN		(P_KETA * P_POKE_MAX)
#define P_HP_LEN		(P_KETA * P_POKE_MAX)
#define P_HPMAX_LEN		(P_KETA * P_POKE_MAX)

//--------- 文字ﾃﾞｰﾀ転送位置 ---------//
#define P_NAME_TRANS_CHARNO		(P_SPACE_LEN)
#define P_LV_TRANS_CHARNO		(P_NAME_TRANS_CHARNO + P_NAME_LEN)
#define P_HP_TRANS_CHARNO		(P_LV_TRANS_CHARNO + P_LV_LEN)
#define P_HPMAX_TRANS_CHARNO	(P_HP_TRANS_CHARNO + P_HP_LEN)

// パレット
#define	CARD_MOJI_PAL	0
#define	CARD_B_PAL		3
#define	CARD_Y_PAL		4
#define	CARD_R_PAL		5
#define	CARD_G_PAL		6
#define	CARD_FLASH_PAL	4
#define	MODORU_DEF_PAL	1
#define	MODORU_POS_PAL	2
#define	CONDITION_PAL	0xb

#define	HP_GAUGE_HP_PAL	3
#define	HP_GAUGE_G_PAL	4
#define	HP_GAUGE_Y_PAL	5
#define	HP_GAUGE_R_PAL	6


//=========================================================================
//	ﾃﾞｰﾀ
//=========================================================================
#include "..\scaddata\itemicon.ach"
#include "..\scaddata\itemicon.acl"
#include "pokelist.dat"

//-- 技選択処理 --//
static const SELECT_ITEM waza_select = { WazaPPRecoverSet, WazaPPRecoverCancel };


//==================================================================
//	プログラム
//==================================================================






//========================================================================================
//							全ポケモンリスト共通呼び出し
//========================================================================================
extern void FieldPokeListTask(u8);		// フィールドポケモン選択タスク
extern void CN_PokeListTask(u8);		// コンテスト / 姓名判断 ポケモン選択タスク
extern u8	ContestListInit(void);		// コンテスト初期描画処理
extern void BattlePokeListMain(u8);		// バトルポケモン選択タスク
extern u8	BtlListInit(void);			// バトル初期描画処理
extern void MultiPokeSelectTask(u8);	// マルチバトル参加ポケモン選択タスク
extern u8	MultiListInit(void);		// マルチバトル参加ポケモン選択初期描画処理
extern void ScrollInPokeListTask( u8 id );
extern u8	ScrollInListInit(void);
extern void GrowPokeSelectTask( u8 id );
extern u8	GrowListInit(void);
extern void ManiaPokeListTask(u8);
extern u8	ManiaListInit(void);


// 初期化処理
typedef struct {
	void (* const MainTask)(u8);	// メインタスク
	u8 (* const InitFunc)(void);	// 描画処理

	const u8 msg;		// メッセージ
}POKELIST_INIT;

static const POKELIST_INIT InitTbl[] =
{
	{ FieldPokeListTask,    DefoListInit,     ERANDE_MSG },			// フィールド
	{ BattlePokeListMain,   BtlListInit,      ERANDE_MSG },			// バトル
	{ CN_PokeListTask,      ContestListInit,  ERANDE_MSG },			// コンテスト
	{ CN_PokeListTask,      DefoListInit,     ERANDE_MSG },			// 姓名判断
	{ MultiPokeSelectTask,  MultiListInit,    ERANDE_MSG },			// マルチバトル参加選択
	{ ScrollInPokeListTask, ScrollInListInit, MSG_NOT_PUT },		// マルチバトル前
	{ GrowPokeSelectTask,   DefoListInit,     AZUKERU_POKE_MSG },	// 育て屋
	{ ManiaPokeListTask,    ManiaListInit,    ERANDE_MSG },			// 技教えマニア
};

//----------------------------------------------------------
//	メイン
//----------------------------------------------------------
void PokeListMain(void)
{
	JumpActor();
	SetActor();
	MainTask();
	PaletteAnime();
}

//----------------------------------------------------------
//	VBlank中の処理
//----------------------------------------------------------
static void PokeListVblank(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	PokeCardVBlank();		// VBlank内でカードを転送
}

//----------------------------------------------------------
//	ポケモンリスト呼び出し
//----------------------------------------------------------
// 初期化パラメータ設定
void PokeListCallParamSet( u8 id, u8 type, void * task, u8 msg_no )
{
	if( type != DEFAULT_LIST )	FightType = type;

	P_LIST->init_id	 = id;
	P_LIST->MainTask = task;
	P_LIST->init_msg = msg_no;
}

// タスク、メッセージ指定
void PokeListCallEx( u8 id, u8 type, void * task, u8 msg_no )
{
	PokeListCallParamSet( id, type, task, msg_no );
	MainProcChange( PokeListInit );
}

// ノーマル
void PokeListCall( u8 id, u8 type )
{
	PokeListCallEx( id, type, InitTbl[ id ].MainTask, InitTbl[ id ].msg );
}

//----------------------------------------------------------
//	共通初期描画処理
//----------------------------------------------------------
static u8 DefoListInit(void)
{
	switch( P_LIST->work[0] ){
	case 0:		// ポケモンアイコンセット
		if( P_LIST->work[1] < PokeCountMine ){
			PataChrActorSet( P_LIST->task_id,
							 P_LIST->work[1],
							 &PokeParaMine[ P_LIST->work[1] ] );
			P_LIST->work[1]++;
		}else{
			P_LIST->work[1] = 0;
			P_LIST->work[0]++;
		}
		break;

	case 1:		// アイテムアイコンのセルとパレットをセット
		ItmeIconCellPalSet();
		P_LIST->work[0]++;
		break;

	case 2:		// アイテムアイコンセット
		ItemIconActorSet( P_LIST->task_id );
		P_LIST->work[0]++;
		break;

	case 3:		// カーソルOBJをセット( 非表示 )
		if( PokeCursorSet2( P_LIST->task_id, P_LIST->work[1] ) == 1 ){
			P_LIST->work[1] = 0;
			P_LIST->work[0]++;
		}else	P_LIST->work[1]++;
		break;

	case 4:		// Lv表示
		PokeLvPutAll();
		P_LIST->work[0]++;
		break;

	case 5:		// ニックネーム表示
		PokeNamePutAll();
		P_LIST->work[0]++;
		break;

	case 6:		// HP表示
		PokeHpPutAll();
		P_LIST->work[0]++;
		break;

	case 7:		// 最大HP表示
		PokeMaxHpPutAll();
		P_LIST->work[0]++;
		break;

	case 8:		// HPゲージ表示
		PokeListGaugeSetAll();
		P_LIST->work[0]++;
		break;

	case 9:		// カード表示
		if( PokeListBGCardInit2( P_LIST->work[1] ) == 1 ){
			P_LIST->work[1] = 0;
			P_LIST->work[0] = 0;
			return	TRUE;
		}else	P_LIST->work[1]++;
	}

	return	FALSE;
}

//----------------------------------------------------------
//	初期設定
//----------------------------------------------------------
u8 PokeListInitMain(void)
{
	switch( sys.InitSeqWork ){
	case 0:
		SetVBlankFunc( NULL );
		DIV_DMACLEAR( 3, 0, VRAM, VRAM_SIZE, 16 );	// VRAM   初期化
		DIV_DMACLEAR( 3, 0, OAM,  OAM_SIZE,  32 );	// OAM    初期化
		DIV_DMACLEAR( 3, 0, PLTT, PLTT_SIZE, 16 );	// ﾊﾟﾚｯﾄ  初期化
		FadeData.trans_stop = 1;
		sys.InitSeqWork++;
		break;

	case 1:
		LasterInit();
		sys.InitSeqWork++;
		break;

	case 2:
		PokeListRegisterInit();
		P_LIST->work[0] = 0;
		P_LIST->work[1] = 0;
		P_LIST->work[2] = 0;
		sys.InitSeqWork++;
		break;

	case 3:
		InitActor();
		sys.InitSeqWork++;
		break;

	case 4:
		if( P_LIST->init_id	!= BATTLE_POKELIST_ID &&
			P_LIST->init_id	!= SCROLL_POKELIST_ID )
		{
			InitTask();
		}
		sys.InitSeqWork++;
		break;

	case 5:
		ObjPalManInit();
		sys.InitSeqWork++;
		break;

	case 6:
		P_LIST->task_id = AddTask( P_LIST->MainTask, 0 );
		sys.InitSeqWork++;
		break;

	case 7:
		PrintScreenInit( POKELIST2_TYPE );	// 8x8固定ﾌｫﾝﾄ設定
		sys.InitSeqWork++;
		break;

	case 8:
		MsgControlInit( &FightMsg, POKELIST2_TYPE );	//MSG制御構造体初期化
		PRT_SetSplitFontInit( &FightMsg, POKELIST_FONT_START );
		sys.InitSeqWork++;
		break;

	case 9:
		if ( PRT_SetSplitFontMain() == FALSE )	break;
		P_LIST->work[0] = 1;
		sys.InitSeqWork++;
		break;

	case 10:
		if( PokeListBgSet( P_LIST->work[0] ) == 1 ){	//BGセット BG関連ﾚｼﾞｽﾀ初期化
			P_LIST->work[0] = 0;
			sys.InitSeqWork++;
		}else	P_LIST->work[0]++;
		break;

	case 11:
		PokeIconPaletteAllSet();
		sys.InitSeqWork++;
		break;

	case 12:	// 各リストごとの処理
		if( InitTbl[ P_LIST->init_id ].InitFunc() == TRUE )
			sys.InitSeqWork++;
		break;

	case 13:
		NMenuScreenInitStart( MENUPOKE_TYPE );
		sys.InitSeqWork++;
		break;

	case 14:
		if ( NMenuScreenInitMain() == FALSE )	break;
		sys.InitSeqWork++;
		break;

	case 15:
		PokeListWinFixMsgPut2( P_LIST->init_msg, 0 );
		sys.InitSeqWork++;
		break;

	case 16:
		PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
		FadeData.trans_stop = 0;
		sys.InitSeqWork++;
		break;

	case 17:
		SetVBlankFunc( PokeListVblank );
		return	TRUE;
	}

	return	FALSE;
}

//----------------------------------------------------------
// 初期化ループ
//----------------------------------------------------------
static void PokeListInit(void)
{
	while(1){
		if( PokeListInitMain() == TRUE ){
			if( P_LIST->init_id != SCROLL_POKELIST_ID )
				PokeNowCursorMove2( P_LIST->task_id, 0 );
			MainProcChange( PokeListMain );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}


//----------------------------------------------------------
//	ﾚｼﾞｽﾀ初期設定
//----------------------------------------------------------
static void PokeListRegisterInit(void)
{
	SetHBlankFunc(NULL);
	
	*(vu16 *)REG_DISPCNT =
				DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP | DISP_BG1_ON |
				DISP_BG0_ON | DISP_BG2_ON | DISP_BG3_ON | DISP_OBJ_ON;

	// 8x8フォント
	*(vu16 *)REG_BG0CNT =
				BG_SCREEN_SIZE_0 | BG_PRIORITY_1
				| 30 << BG_SCREEN_BASE_SHIFT | 1 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
	// 背景
	*(vu16 *)REG_BG1CNT =
				BG_SCREEN_SIZE_0 | BG_PRIORITY_3
				| 7 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
	// 8x16フォント
	*(vu16 *)REG_BG2CNT =
				BG_SCREEN_SIZE_0 | BG_PRIORITY_0
				| 15 << BG_SCREEN_BASE_SHIFT | 2 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;
	// カード
	*(vu16 *)REG_BG3CNT =
				BG_SCREEN_SIZE_0 | BG_PRIORITY_2
				| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
				| BG_COLOR_16 | BG_MOS_OFF;

	*(vu16 *)REG_BLDCNT = 0;

	*(vu16 *)REG_BG0HOFS = 0;
	*(vu16 *)REG_BG0VOFS = 0;
	*(vu16 *)REG_BG1HOFS = 0;
	*(vu16 *)REG_BG1VOFS = 0;
	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;
	*(vu16 *)REG_BG3HOFS = 0;
	*(vu16 *)REG_BG3VOFS = 0;
	*(vu16 *)REG_BG3VOFS = -1;
}

//----------------------------------------------------------
//	マルチバトルかチェック
//----------------------------------------------------------
#define	MULTI_BTL_FLG	(FIGHT_TYPE_2vs2 | FIGHT_TYPE_TRAINER | FIGHT_TYPE_TUUSHIN | FIGHT_TYPE_4_2vs2)

u8 MultiCheck(void)
{
	if( ( FightType & MULTI_BTL_FLG ) == MULTI_BTL_FLG )
		return	TRUE;	// マルチバトル
	return	FALSE;		// マルチバトル以外
}

//----------------------------------------------------------
//	VBlank内でカードを転送
//----------------------------------------------------------
static void PokeCardVBlank(void)
{
	if( P_LIST->card_flg != 0 ){
		DIV_DMACOPY( 3, BG2_data, BG_VRAM+0x3000, 0x800, 16 );
		if( P_LIST->card_flg == 2 )	P_LIST->card_flg = 0;
	}
}



//=========================================================================
//	カード関連
//=========================================================================
static void DrawPoke00Card( s16 x, s16 y, u8 pal );
static void DelPoke00Card( s16 x, s16 y );
static void DrawPoke01Card( s16 x, s16 y, u8 flg, u8 pal );
static void DelPoke01Card( s16 x, s16 y );

//----------------------------------------------------------
//	分割初期表示
//----------------------------------------------------------
u8 PokeListBGCardInit2( u8 cnt )
{
	u8 * pos;

	if( FightCheck() == 0 )	pos = (u8 *)&PokeCardPos[0];			// 1 vs 1
	else{
		if( MultiCheck() == TRUE )	pos = (u8 *)&PokeCardPos[24];	// マルチ
		else						pos = (u8 *)&PokeCardPos[12];	// 2 vs 2
	}

	switch( cnt ){
	case 0:
		memset( BG2_data, 0, sizeof(u16)*1024 );
		break;

	// カードセット
	case 1:
		DrawPoke00Card( pos[0], pos[1], CARD_B_PAL );
		PokeSelectCard( &pos[0], 0, CARD_B_PAL, 0 );
		break;
	case 2:
		if( FightCheck() == 0 ){		// 1 vs 1
			if( 1 < PokeCountMine ){
				DrawPoke01Card( pos[2], pos[3], 0, CARD_B_PAL );
				PokeSelectCard( &pos[2], 1, CARD_B_PAL, 0 );
			}else
				DrawPoke01Card( pos[2], pos[3], 1, CARD_B_PAL );
		}else{
			if( MultiCheck() == TRUE ){	// マルチ
				DrawPoke00Card( pos[2], pos[3], CARD_Y_PAL );
				PokeSelectCard( &pos[2], 1, CARD_Y_PAL, 0 );
			}else{						// 2 vs 2
				DrawPoke00Card( pos[2], pos[3], CARD_B_PAL );
				PokeSelectCard( &pos[2], 1, CARD_B_PAL, 0 );
			}
		}
		break;
	case 3:
		if( FightCheck() == 0 ){		// 1 vs 1
			if( 2 < PokeCountMine ){
				DrawPoke01Card( pos[4], pos[5], 0, CARD_B_PAL );
				PokeSelectCard( &pos[4], 2, CARD_B_PAL, 0 );
			}else
				DrawPoke01Card( pos[4], pos[5], 1, CARD_B_PAL );
		}else{
			if( MultiCheck() == TRUE ){	// マルチ
				if( PokeParaGet( &PokeParaMine[2], ID_monsno) != 0 ){
					DrawPoke01Card( pos[4], pos[5], 0, CARD_B_PAL );
					PokeSelectCard( &pos[4], 2, CARD_B_PAL, 0 );
				}else
					DrawPoke01Card( pos[4], pos[5], 1, CARD_B_PAL );
			}else{						// 2 vs 2
				if( 2 < PokeCountMine ){
					DrawPoke01Card( pos[4], pos[5], 0, CARD_B_PAL );
					PokeSelectCard( &pos[4], 2, CARD_B_PAL, 0 );
				}else
					DrawPoke01Card( pos[4], pos[5], 1, CARD_B_PAL );
			}
		}
		break;
	case 4:
		if( FightCheck() == 0 ){		// 1 vs 1
			if( 3 < PokeCountMine ){
				DrawPoke01Card( pos[6], pos[7], 0, CARD_B_PAL );
				PokeSelectCard( &pos[6], 3, CARD_B_PAL, 0 );
			}else
				DrawPoke01Card( pos[6], pos[7], 1, CARD_B_PAL );
		}else{
			if( MultiCheck() == TRUE ){	// マルチ
				if( PokeParaGet( &PokeParaMine[3], ID_monsno) != 0 ){
					DrawPoke01Card( pos[6], pos[7], 0, CARD_B_PAL );
					PokeSelectCard( &pos[6], 3, CARD_B_PAL, 0 );
				}else
					DrawPoke01Card( pos[6], pos[7], 1, CARD_B_PAL );
			}else{						// 2 vs 2
				if( 3 < PokeCountMine ){
					DrawPoke01Card( pos[6], pos[7], 0, CARD_B_PAL );
					PokeSelectCard( &pos[6], 3, CARD_B_PAL, 0 );
				}else
					DrawPoke01Card( pos[6], pos[7], 1, CARD_B_PAL );
			}
		}
		break;
	case 5:
		if( FightCheck() == 0 ){		// 1 vs 1
			if( 4 < PokeCountMine ){
				DrawPoke01Card( pos[8], pos[9], 0, CARD_B_PAL );
				PokeSelectCard( &pos[8], 4, CARD_B_PAL, 0 );
			}else
				DrawPoke01Card( pos[8], pos[9], 1, CARD_B_PAL );
		}else{
			if( MultiCheck() == TRUE ){	// マルチ
				if( PokeParaGet( &PokeParaMine[4], ID_monsno) != 0 ){
					DrawPoke01Card( pos[8], pos[9], 0, CARD_Y_PAL );
					PokeSelectCard( &pos[8], 4, CARD_Y_PAL, 0 );
				}else
					DrawPoke01Card( pos[8], pos[9], 1, CARD_Y_PAL );
			}else{						// 2 vs 2
				if( 4 < PokeCountMine ){
					DrawPoke01Card( pos[8], pos[9], 0, CARD_B_PAL );
					PokeSelectCard( &pos[8], 4, CARD_B_PAL, 0 );
				}else
					DrawPoke01Card( pos[8], pos[9], 1, CARD_B_PAL );
			}
		}
		break;
	case 6:
		if( FightCheck() == 0 ){		// 1 vs 1
			if( 5 < PokeCountMine ){
				DrawPoke01Card( pos[10], pos[11], 0, CARD_B_PAL );
				PokeSelectCard( &pos[10], 5, CARD_B_PAL, 0 );
			}else
				DrawPoke01Card( pos[10], pos[11], 1, CARD_B_PAL );
		}else{
			if( MultiCheck() == TRUE ){	// マルチ
				if( PokeParaGet( &PokeParaMine[5], ID_monsno) != 0 ){
					DrawPoke01Card( pos[10], pos[11], 0, CARD_Y_PAL );
					PokeSelectCard( &pos[10], 5, CARD_Y_PAL, 0 );
				}else
					DrawPoke01Card( pos[10], pos[11], 1, CARD_Y_PAL );
			}else{						// 2 vs 2
				if( 5 < PokeCountMine ){
					DrawPoke01Card( pos[10], pos[11], 0, CARD_B_PAL );
					PokeSelectCard( &pos[10], 5, CARD_B_PAL, 0 );
				}else
					DrawPoke01Card( pos[10], pos[11], 1, CARD_B_PAL );
			}
		}
		break;

	case 7:
		if( P_LIST->init_id == MULTI_POKELIST_ID )
			DrawBG2KETTEI( MODORU_DEF_PAL );
		DrawBG2MODORU( MODORU_DEF_PAL );
		 break;

	case 8:
		P_LIST->card_flg = 2;
		return	1;
	}

	return	0;
}

//----------------------------------------------------------
//	マルチ参加確認時の初期表示
//----------------------------------------------------------
void ScrollInPokeListBGCardInit(void)
{
	PokemonParam * pp;
	u8 * pos;

	memset( BG2_data, 0, sizeof(u16)*1024 );

	pos = (u8 *)&PokeCardPos[24];

//	if( GetTeamPos() == 0 )	pp = &PokeParaMine[2];
//	else					pp = &PokeParaMine[4];

	pp = &PokeParaMine[1];

	DrawPoke00Card( 0x01, 0x01, CARD_B_PAL );

	if( PokeParaGet( &pp[0], ID_monsno) != 0 )
		DrawPoke01Card( pos[4], pos[5], 0, CARD_B_PAL );
	else	DrawPoke01Card( pos[4], pos[5], 1, CARD_B_PAL );

	if( PokeParaGet( &pp[1], ID_monsno) != 0 )
		DrawPoke01Card( pos[6], pos[7], 0, CARD_B_PAL );
	else	DrawPoke01Card( pos[6], pos[7], 1, CARD_B_PAL );

	P_LIST->card_flg = 2;
}

//----------------------------------------------------------
//	先頭のポケモン表示
//----------------------------------------------------------
static void DrawPoke00Card( s16 x, s16 y, u8 pal )
{
	u8	i,j;
	u16	py;

	py = y<<5;

	for( i=0; i<7; i++ ){
		for( j=0; j<10; j++ ){
			if( x + j >= 32 )	break;
			if( x + j >= 0 )
				BG2_data[ x+py+(i<<5)+j ] = (pal<<12)+card_BG02_00[ i*10+j ];
		}
	}
}
static void DelPoke00Card( s16 x, s16 y )
{
	u8	i,j;
	u16	py;

	py = y<<5;

	for( i=0; i<7; i++ ){
		for( j=0; j<10; j++ ){
			if( x + j >= 32 )	break;
			if( x + j >= 0 )	BG2_data[ x+py+(i<<5)+j ] = 0;
		}
	}
}

//----------------------------------------------------------
//	先頭以外のポケモン表示
//----------------------------------------------------------
static void DrawPoke01Card( s16 x, s16 y, u8 flg, u8 pal )
{
	u8   i,j;
	u16  py;
	u8 * chr;

	if( flg == 0 )	chr = (u8 *)card_BG02_01;
	else			chr = (u8 *)card_BG02_02;

	py = y<<5;

	for( i=0; i<3; i++ ){
		for( j=0; j<18; j++ ){
			if( x + j >= 32 )	break;
			if( x + j >= 0 )
				BG2_data[ x+py+(i<<5)+j ] = (pal<<12)+chr[ i*18+j ];
		}
	}
}
static void DelPoke01Card( s16 x, s16 y )
{
	u8	i,j;
	u16	py;

	py = y<<5;

	for( i=0; i<3; i++ ){
		for( j=0; j<18; j++ ){
			if( x + j >= 32 )	break;
			if( x + j >= 0 )	BG2_data[ x+py+(i<<5)+j ] = 0;
		}
	}
}

//----------------------------------------------------------
// "けってい"
//----------------------------------------------------------
void DrawBG2KETTEI( u8 pal )
{
	u8	i;

	u16	chr[] = {
		0x2a,0x2b,0x2c,0x2d,0x2e,0x2f,
		0x3a,0x3b,0x3c,0x3d,0x3e,0x3f,
	};

	u32   trans_pos;
	u16 * ptrans;

	trans_pos = SCREEN_BASE7_ADDR + ( 0x18 << 1 ) + ( 0x10 << 6 );
	ptrans    = (void *)( trans_pos );

	for( i=0; i<6; i++ ){
		ptrans[i]    = ( pal << 12 ) + chr[i];
		ptrans[32+i] = ( pal << 12 ) + chr[6+i];
	}
}

//----------------------------------------------------------
//	"もどる"
//----------------------------------------------------------
void DrawBG2MODORU( u8 pal )
{
	u8	i;

	u16	chr[] = {
		0x2a,0x0b,0x0c,0x0d,0x0e,0x2f,
		0x1a,0x1b,0x1c,0x1d,0x1e,0x1f,
	};

	u32   trans_pos;
	u16 * ptrans;

	trans_pos = SCREEN_BASE7_ADDR + ( 0x18 << 1 ) + ( 0x12 << 6 );
	ptrans    = (void *)( trans_pos );

	for( i=0; i<6; i++ ){
		ptrans[i]    = ( pal << 12 ) + chr[i];
		ptrans[32+i] = ( pal << 12 ) + chr[6+i];
	}
}


//=========================================================================
//	カードの上に文字を表示
//=========================================================================
void ListCardMoji( u8 pos, u8 no )
{
	u32   trans_pos;
	u16 * ptrans;
	u8    i;
	u8    pal;
	u16   chr;

	trans_pos = CardMojiDefaultPos[FightCheck()][pos];
	ptrans    = (void *)( trans_pos );
	pal       = CARD_MOJI_PAL << 12;

	for( i=0; i<CARD_MSG_LEN; i++ ){
		chr = i+no;
		ptrans[i]    = pal | ( LIST_MOJI_TOPCHARNO + card_msg_BG02[chr] );
		ptrans[32+i] = pal | ( LIST_MOJI_TOPCHARNO + card_msg_BG02[chr+CARD_MSG_LEN] );
	}
}

void ListCardMojiAll( u8 no )
{
	u8	i;
	
	for( i=0; i<PokeCountMine; i++ )
		ListCardMoji( i, no );
}

//----------------------------------------------------------
//	性別表示
//----------------------------------------------------------
void ListCardSexPut(void)
{
	u8	i;

	for( i=0; i<PokeCountMine; i++ ){
		if( PokeParaGet( &PokeParaMine[i], ID_tamago_flag ) == 0 ){
			switch( PokeSexGet( &PokeParaMine[i] ) ){
			case MONS_MALE:
				ListCardMoji( i, CARD_OSU );
				break;
			case MONS_FEMALE:
				ListCardMoji( i, CARD_MESU );
				break;
			default:
				ListCardMoji( i, CARD_HUMEI );
			}
		}else	ListCardMoji( i, CARD_HUMEI );
	}
}


//=========================================================================
//	カーソル関連
//=========================================================================
//----------------------------------------------------------
//	カーソルOBJをセット
//----------------------------------------------------------
u8 PokeCursorSet2( u8 taskno, u8 cnt )
{
	u8 actno;

	actno = AddBanishActor( DummyActMove );
	SetNowCursorActNo( taskno, actno );

	return	1;
}

//----------------------------------------------------------
//	ポケモン選択
//	戻り値 : 押されたボタン
//----------------------------------------------------------
u16 PokeCursorSys( u8 taskno )
{
	s8 move = 0;
	
	switch( sys.Repeat ){
	case U_KEY:
		move = -1;
		break;
	case D_KEY:
		move = 1;
		break;
	case L_KEY:
		move = -2;
		break;
	case R_KEY:
		move = 2;
		break;
	}

	// LR Mode
	if( move == 0 ){
		switch( LR_RepeatCheck() ){
		case LRM_L:
			move = -1;
			break;
		case LRM_R:
			move = 1;
		}
	}

	if( move != 0 ){
		PokeNowCursorMove2( taskno, move );
		return sys.Repeat;
	}else{
		if(	sys.Trg & A_BUTTON &&
			ActWork[ GetNowCursorActNo( taskno ) ].work[C_POS] == PL_POS_MODORU )
		{
			return	B_BUTTON;
		}
		return ( sys.Trg & ( A_BUTTON | B_BUTTON ) );
	}
}

//----------------------------------------------------------
//	マルチバトルのポケモン選択処理用
//	戻り値 : 押されたボタン
//----------------------------------------------------------
u16 PokeCursorSys2( u8 taskno )
{
	s8 move = 0;
	
	switch( sys.Repeat ){
	case U_KEY:
		move = -1;
		break;
	case D_KEY:
		move = 1;
		break;
	case L_KEY:
		move = -2;
		break;
	case R_KEY:
		move = 2;
	}

	// LR Mode
	if( move == 0 ){
		switch( LR_RepeatCheck() ){
		case LRM_L:
			move = -1;
			break;
		case LRM_R:
			move = 1;
		}
	}

	if( sys.Trg & START_BUTTON ){
		PokeSelectPosJumpKettei( taskno );
		return	START_BUTTON;
	}

	if(move != 0){
		PokeNowCursorMove3( taskno, move );
		return sys.Repeat;
	}else{
		if(	sys.Trg & A_BUTTON &&
			ActWork[ GetNowCursorActNo( taskno ) ].work[C_POS] == PL_POS_MODORU )
		{
			return	B_BUTTON;
		}
		return ( sys.Trg & ( A_BUTTON | B_BUTTON ) );
	}
}

//----------------------------------------------------------
//	カードの色を変える
//	cp = 表示座標	pal = パレット番号
//----------------------------------------------------------
static void PokeCardColorChange( const u8 * cp, u8 pal )
{
	// 戦闘に出ていないポケモンのカード
	if( cp[0] != 1 )	DrawPoke01Card( (s16)cp[0], (s16)cp[1], 0, pal );
	// 戦闘に出ているポケモンのカード
	else				DrawPoke00Card( (s16)cp[0], (s16)cp[1], pal );
}

//----------------------------------------------------------
// カーソル移動によるカードの色変更
//	cp  = 表示座標
//	pos = ポケモンの位置
//	pal = パレット番号
//	flg = 選択されているか ( 1 = 選択中 )
//----------------------------------------------------------
static void PokeSelectCard( const u8 * cp, u8 pos, u8 pal, u8 flg )
{
	if( PokeParaGet( &PokeParaMine[pos], ID_monsno ) != 0 &&
		PokeParaGet( &PokeParaMine[pos], ID_hp ) == 0 )
	{
		pal = CARD_R_PAL;
	}

	if( flg == 1 )	pal += CARD_FLASH_PAL;

	PokeCardColorChange( cp, pal );
}


//----------------------------------------------------------
//	カーソルを移動させる
// taskno = TaskID
// move = 移動量(-1=上に、+1=下へ、-2=左側の列へ +2=右側の列へ
//               0=現在の座標を改めてセット)
//----------------------------------------------------------
static void PokeCursorMove1vs1( u8 act, u8 pos, s8 move );
static void PokeCursorMove2vs2( u8 act, u8 pos, s8 move );
static void PokeCursorMoveMulti( u8 act, u8 pos, s8 move );

void PokeNowCursorMove2( u8 taskno, s8 move )
{
	u8	act;
	u8	pos;
	u8	type;

	act = GetNowCursorActNo( taskno );	// カーソルのアクター番号取得
	pos = ActWork[act].work[C_POS];		// 現在のカーソル位置を取得

	PokeActAnmChenge( taskno, pos, 0 );	// 選択中のポケモンアニメを切り替える

	// マルチバトル
	if( MultiCheck() == TRUE ){

		// 現在のカーソル位置を暗くする
		if( pos == PL_POS_POKE0 || pos == PL_POS_POKE2 || pos == PL_POS_POKE3 )
			PokeSelectCard( &PokeCardPos[ (2*12) + (pos << 1) ], pos, CARD_B_PAL, 0 );
		if( pos == PL_POS_POKE1 || pos == PL_POS_POKE4 || pos == PL_POS_POKE5 )
			PokeSelectCard( &PokeCardPos[ (2*12) + (pos << 1) ], pos, CARD_Y_PAL, 0 );
		if( pos == PL_POS_MODORU )	DrawBG2MODORU( MODORU_DEF_PAL );

		PokeCursorMoveMulti( act, pos, move );	// 移動

		// 新しい位置を明るくする
		if( ActWork[act].work[C_POS] == PL_POS_POKE0 ||
			ActWork[act].work[C_POS] == PL_POS_POKE2 ||
			ActWork[act].work[C_POS] == PL_POS_POKE3 )
		{
			PokeSelectCard( &PokeCardPos[ (2*12) + (ActWork[act].work[C_POS] << 1) ],
							ActWork[act].work[C_POS], CARD_B_PAL, 1 );
		}
		if( ActWork[act].work[C_POS] == PL_POS_POKE1 ||
			ActWork[act].work[C_POS] == PL_POS_POKE4 ||
			ActWork[act].work[C_POS] == PL_POS_POKE5 )
		{
			PokeSelectCard( &PokeCardPos[ (2*12) + (ActWork[act].work[C_POS] << 1) ],
							ActWork[act].work[C_POS], CARD_Y_PAL, 1 );
		}
		if( ActWork[act].work[C_POS] == PL_POS_MODORU )
			DrawBG2MODORU( MODORU_POS_PAL );

		P_LIST->card_flg = 2;

		// カーソル更新
		ActWork[act].x = PokeCursorPos[ 2 ][ ActWork[act].work[C_POS] ].x;
		ActWork[act].y = PokeCursorPos[ 2 ][ ActWork[act].work[C_POS] ].y;
	}else{
		type = FightCheck();		// 戦闘形態所得

		// 現在のカーソル位置を暗くする
		if( pos <= PL_POS_POKE5 ){
			PokeSelectCard( &PokeCardPos[ (type*12) + (pos << 1) ], pos, CARD_B_PAL, 0 );
		}else	DrawBG2MODORU( MODORU_DEF_PAL );

		// 移動
		if( type == 0 )	PokeCursorMove1vs1( act, pos, move );	// 1 vs 1
		else			PokeCursorMove2vs2( act, pos, move );	// 2 vs 2

		// 新しい位置を明るくする
		if( ActWork[act].work[C_POS] <= PL_POS_POKE5 ){
			PokeSelectCard( &PokeCardPos[ (type*12) + (ActWork[act].work[C_POS] << 1) ],
							ActWork[act].work[C_POS], CARD_B_PAL, 1 );
		}else	DrawBG2MODORU( MODORU_POS_PAL );

		P_LIST->card_flg = 2;

		// カーソル更新
		ActWork[act].x = PokeCursorPos[ type ][ ActWork[act].work[C_POS] ].x;
		ActWork[act].y = PokeCursorPos[ type ][ ActWork[act].work[C_POS] ].y;
	}

	// 選択されたポケモンアニメを切り替える
	PokeActAnmChenge( taskno, (u8)ActWork[act].work[C_POS], 1 );

	if( pos != ActWork[act].work[C_POS] )	SePlay(SE_SELECT);
}

// 1 vs 1
static void PokeCursorMove1vs1( u8 act, u8 pos, s8 move )
{
	switch( move ){
	case 0:		// 初期化
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case -1:	// 上
		if( pos == PL_POS_POKE0 )
			ActWork[act].work[C_POS] = PL_POS_MODORU;
		else if( pos == PL_POS_MODORU )
			ActWork[act].work[C_POS] = PokeCountMine-1;
		else
			ActWork[act].work[C_POS] += move;
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;
	case 1:		// 下
		if( pos == PokeCountMine-1 )
			ActWork[act].work[C_POS] = PL_POS_MODORU;
		else if( pos == PL_POS_MODORU )
			ActWork[act].work[C_POS] = PL_POS_POKE0;
		else
			ActWork[act].work[C_POS] += move;
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case 2:		// 右
		if( PokeCountMine >= 2 ){
			if( pos == PL_POS_POKE0 ){
				if( ActWork[act].work[C_OLDPOS] == PL_POS_POKE0 )
					ActWork[act].work[C_OLDPOS] = PL_POS_POKE1;
				ActWork[act].work[C_POS] = ActWork[act].work[C_OLDPOS];
			}
		}
		break;

	case -2:	// 左
		if( pos >= PL_POS_POKE1 && pos <= PL_POS_POKE5 ){
			ActWork[act].work[C_POS] = PL_POS_POKE0;
			ActWork[act].work[C_OLDPOS] = pos;
		}
	}
}

// 2 vs 2
static void PokeCursorMove2vs2( u8 act, u8 pos, s8 move )
{
	switch( move ){
	case 0:		// 初期化
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case 1:		// 下
		if( pos == PL_POS_MODORU )
			ActWork[act].work[C_POS] = PL_POS_POKE0;
		else if( pos == PokeCountMine-1 )
			ActWork[act].work[C_POS] = PL_POS_MODORU;
		else
			ActWork[act].work[C_POS] += move;
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case -1:	// 上
		if( pos == PL_POS_POKE0 )
			ActWork[act].work[C_POS] = PL_POS_MODORU;
		else if( pos == PL_POS_MODORU )
			ActWork[act].work[C_POS] = PokeCountMine-1;
		else
			ActWork[act].work[C_POS] += move;
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case 2:		// 右
		if( pos == PL_POS_POKE0 ){
			if( PokeCountMine >= 3 ){
				if( ActWork[act].work[C_OLDPOS] == PL_POS_POKE2 ||
					ActWork[act].work[C_OLDPOS] == PL_POS_POKE3 )
				{
					ActWork[act].work[C_POS] = ActWork[act].work[C_OLDPOS];
				}else	ActWork[act].work[C_POS] = PL_POS_POKE2;
			}
		}else if( pos == 1 ){
			if( PokeCountMine >= 5 ){
				if( ActWork[act].work[C_OLDPOS] == PL_POS_POKE4 ||
					ActWork[act].work[C_OLDPOS] == PL_POS_POKE5 )
				{
					ActWork[act].work[C_POS] = ActWork[act].work[C_OLDPOS];
				}else	ActWork[act].work[C_POS] = PL_POS_POKE4;
			}
		}
		break;

	case -2:	// 左
		if( pos == PL_POS_POKE2 || pos == PL_POS_POKE3 ){
			ActWork[act].work[C_POS] = PL_POS_POKE0;
			ActWork[act].work[C_OLDPOS] = pos;
		}else if( pos == PL_POS_POKE4 || pos == PL_POS_POKE5 ){
			ActWork[act].work[C_POS] = PL_POS_POKE1;
			ActWork[act].work[C_OLDPOS] = pos;
		}
	}
}

// マルチ
static void PokeCursorMoveMulti( u8 act, u8 pos, s8 move )
{
	switch( move ){
	case 0:		// 初期化
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case 1:		// 下
		if( pos == PL_POS_MODORU )	ActWork[act].work[C_POS] = PL_POS_POKE0;
		else{
			while(1){
				if( pos == PL_POS_POKE5 ){
					ActWork[act].work[C_POS] = PL_POS_MODORU;
					break;
				}
				pos++;
				if( PokeParaGet( &PokeParaMine[pos], ID_monsno) != 0 ){
					ActWork[act].work[C_POS] = pos;
					break;
				}

			}
		}
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case -1:	// 上
		if( pos == PL_POS_POKE0 )	ActWork[act].work[C_POS] = PL_POS_MODORU;
		else{
			while(1){
				if( pos == PL_POS_POKE0 ){
					ActWork[act].work[C_POS] = PL_POS_MODORU;
					break;
				}
				pos--;
				if( pos != PL_POS_KETTEI ){
					if( PokeParaGet( &PokeParaMine[pos], ID_monsno) != 0 ){
						ActWork[act].work[C_POS] = pos;
						break;
					}
				}
				
			}
		}
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case 2:		// 右
		if( pos == PL_POS_POKE0 ){
			if( ActWork[act].work[C_OLDPOS] == PL_POS_POKE2 ||
				ActWork[act].work[C_OLDPOS] == PL_POS_POKE3 )
			{
				ActWork[act].work[C_POS] = ActWork[act].work[C_OLDPOS];
				break;
			}
			if( PokeParaGet( &PokeParaMine[2], ID_monsno) != 0 ){
				ActWork[act].work[C_POS] = PL_POS_POKE2;
				break;
			}
			if( PokeParaGet( &PokeParaMine[3], ID_monsno) != 0 ){
				ActWork[act].work[C_POS] = PL_POS_POKE3;
				break;
			}
		}else if( pos == PL_POS_POKE1 ){
			if( ActWork[act].work[C_OLDPOS] == PL_POS_POKE4 ||
				ActWork[act].work[C_OLDPOS] == PL_POS_POKE5 )
			{
				ActWork[act].work[C_POS] = ActWork[act].work[C_OLDPOS];
				break;
			}
			if( PokeParaGet( &PokeParaMine[4], ID_monsno ) != 0 ){
				ActWork[act].work[C_POS] = PL_POS_POKE4;
				break;
			}
			if( PokeParaGet( &PokeParaMine[5], ID_monsno ) != 0 ){
				ActWork[act].work[C_POS] = PL_POS_POKE5;
				break;
			}
		}
		break;

	case -2:	// 左
		if( pos == PL_POS_POKE2 || pos == PL_POS_POKE3 ){
			ActWork[act].work[C_POS] = PL_POS_POKE0;
			ActWork[act].work[C_OLDPOS] = pos;
		}else if( pos == PL_POS_POKE4 || pos == PL_POS_POKE5 ){
			ActWork[act].work[C_POS] = PL_POS_POKE1;
			ActWork[act].work[C_OLDPOS] = pos;
		}
	}
}

// マルチバトルへ参加するポケモンを選択
void PokeNowCursorMove3( u8 taskno, s8 move )
{
	u8	act;
	u8	pos;

	act  = GetNowCursorActNo( taskno );	// カーソルのアクター番号取得
	pos  = ActWork[act].work[C_POS];	// 現在のカーソル位置を取得

	PokeActAnmChenge( taskno, pos, 0 );	// 選択中のポケモンのアニメを変更

	// 現在のカーソル位置を暗くする
	if( pos <= PL_POS_POKE5 )
		PokeSelectCard( &PokeCardPos[pos << 1], pos, CARD_B_PAL, 0 );
	else if( pos == PL_POS_KETTEI )
		DrawBG2KETTEI( MODORU_DEF_PAL );
	else
		DrawBG2MODORU( MODORU_DEF_PAL );

	// 移動
	switch( move ){
	case 0:		// 初期化
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case -1:	// 上
		if( pos == PL_POS_POKE0 )
			ActWork[act].work[C_POS] = PL_POS_MODORU;
		else if( pos == PL_POS_KETTEI )
			ActWork[act].work[C_POS] = PokeCountMine-1;
		else
			ActWork[act].work[C_POS] += move;
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;
	case 1:		// 下
		if( pos == PokeCountMine-1 )
			ActWork[act].work[C_POS] = PL_POS_KETTEI;
		else if( pos == PL_POS_MODORU )
			ActWork[act].work[C_POS] = PL_POS_POKE0;
		else
			ActWork[act].work[C_POS] += move;
		ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
		break;

	case 2:		// 右
		if( PokeCountMine >= 2 ){
			if( pos == PL_POS_POKE0 ){
				if( ActWork[act].work[C_OLDPOS] == PL_POS_POKE0 )
					ActWork[act].work[C_OLDPOS] = PL_POS_POKE1;
				ActWork[act].work[C_POS] = ActWork[act].work[C_OLDPOS];
			}
		}
		break;

	case -2:	// 左
		if( pos >= PL_POS_POKE1 && pos <= PL_POS_POKE5 ){
			ActWork[act].work[C_POS] = PL_POS_POKE0;
			ActWork[act].work[C_OLDPOS] = pos;
		}
	}

	// カーソル更新
	ActWork[act].x = PokeCursorPos[ 0 ][ ActWork[act].work[C_POS] ].x;
	ActWork[act].y = PokeCursorPos[ 0 ][ ActWork[act].work[C_POS] ].y;

	// 新しいカーソル位置を明るくする
	if( ActWork[act].work[C_POS] <= PL_POS_POKE5 )
		PokeSelectCard( &PokeCardPos[ActWork[act].work[C_POS] << 1],
						ActWork[act].work[C_POS], CARD_B_PAL, 1 );
	else if( ActWork[act].work[C_POS] == PL_POS_KETTEI )
		DrawBG2KETTEI( MODORU_POS_PAL );
	else
		DrawBG2MODORU( MODORU_POS_PAL );

	P_LIST->card_flg = 2;

	// 選択されたポケモンのアニメを変更
	PokeActAnmChenge( taskno, ActWork[act].work[C_POS], 1 );

	if( pos != ActWork[act].work[C_POS] )	SePlay(SE_SELECT);
}

//-------------------------------------------
//	強制的にカーソルを決定へ
//-------------------------------------------
void PokeSelectPosJumpKettei( u8 taskno )
{
	u8	act;
	u8	pos;

	act = GetNowCursorActNo( taskno );	// カーソルのアクター番号取得
	pos = ActWork[act].work[C_POS];		// 現在のカーソル位置を取得

	if( pos == PL_POS_KETTEI )	return;

	PokeActAnmChenge( taskno, pos, 0 );	// 選択中のポケモンのアニメを変更

	// 現在のカーソル位置を暗くする
	if( pos <= PL_POS_POKE5 )
		PokeSelectCard( &PokeCardPos[pos << 1], pos, CARD_B_PAL, 0 );
	else
		DrawBG2MODORU( MODORU_DEF_PAL );

	ActWork[act].work[C_OLDPOS] = PL_POS_POKE0;
	ActWork[act].work[C_POS]    = PL_POS_KETTEI;

	// カーソル更新
	ActWork[act].x = PokeCursorPos[ 0 ][ ActWork[act].work[C_POS] ].x;
	ActWork[act].y = PokeCursorPos[ 0 ][ ActWork[act].work[C_POS] ].y;

	DrawBG2KETTEI( MODORU_POS_PAL );

	P_LIST->card_flg = 2;

	SePlay(SE_SELECT);
}


//----------------------------------------------------------
//	現在ｶｰｿﾙ位置と旧ｶｰｿﾙ位置が同じﾗｲﾝ上にないかﾁｪｯｸして修正する
// 引数:ｶｰｿﾙのｱｸﾀｰﾅﾝﾊﾞｰ
//----------------------------------------------------------
static void CursorNowOldCheck(u8 actno)
{
	u8 now, old;
	
	now = ActWork[actno].work[C_POS];
	old = ActWork[actno].work[C_OLDPOS];
	
	if( FightCheck() == 0 ){
		if(now == 0 && old == 0)
			old = 1;
		else if(now > 0 && old > 0)
			old = 0;
	}else{	//2vs2
		if(now < 2 && old < 2)
			old = 2;
		else if(now > 1 && old > 1)
			old = 0;
	}
	ActWork[actno].work[C_OLDPOS] = old;
}

//----------------------------------------------------------
//	ｶｰｿﾙ座標ｾｯﾄ
//----------------------------------------------------------
void PokeCursorPosSet(u8 taskno, u8 pos)
{
	u8 actno;
	
	actno = GetNowCursorActNo(taskno);
	ActWork[actno].work[C_POS] = pos;
	
	CursorNowOldCheck(actno);
}

//----------------------------------------------------------
//	ｻﾌﾞｶｰｿﾙの座標をｾｯﾄする
// taskno = ｿｰﾄのtaskno,   actno = ｻﾌﾞｶｰｿﾙのactno
//----------------------------------------------------------
void PokeSubCursorPosSet(u8 taskno, u8 actno)
{
	u8 actno2;
	
	actno2 = GetNowCursorActNo(taskno);

	ActWork[actno].x = ActWork[actno2].x;
	ActWork[actno].y = ActWork[actno2].y;
	ActWork[actno].work[0] = ActWork[actno2].work[0];
}

//----------------------------------------------------------
//	現在のカーソルのactnoを取得する
//----------------------------------------------------------
static u8 GetNowCursorActNo(u8 taskno)
{
	return TaskTable[taskno].work[M_CURSOR] >> 8;
}
//----------------------------------------------------------
//	現在のｶｰｿﾙのactnoをﾀｽｸの所定のﾜｰｸへｾｯﾄする
//----------------------------------------------------------
static void SetNowCursorActNo(u8 taskno, u8 actno)
{
	TaskTable[taskno].work[M_CURSOR] &= 0x00ff;
	TaskTable[taskno].work[M_CURSOR] |= actno << 8;
}

//----------------------------------------------------------
//	現在のｶｰｿﾙ位置を取得する
// taskno = ﾒｲﾝﾀｽｸID
//----------------------------------------------------------
u8 GetNowCursorPos(u8 taskno)
{
	u8 actno;
	
	actno = GetNowCursorActNo(taskno);
	return ActWork[actno].work[C_POS];
}


//========================================================================================
//								並び替え（カードを動かす）
//========================================================================================
#define	ACT_XCNT	0
#define	ACT_XMAX	2
//#define	XMAX_PARAM	152		// 8x18
#define	XMAX_PARAM	168		// 8x18

static void PokeCardChange1X_0(u8);
static void PokeCardChange1X_1(u8);
static void PokeCardChange2X_0(u8);
static void PokeCardChange2X_1(u8);
static void PokeCardChangeParam(u8);
static void PokeIconMove(actWork *);



//------------------------------------------------------
//				２体目のポケモンを選択
//------------------------------------------------------
//---------------------
//		初期設定
//---------------------
void PokemonSortInit( u8 id )
{
	// メインタスク退避
	TaskTable[id].TaskAdrs = DummyTaskSeq;
	P_CARD->main_id = id;
	AddTask( PokemonSort, 0 );

	// 選択済みカーソルセット
	P_CARD->cur[0] = AddBanishActor( DummyActMove );
	PokeSubCursorPosSet( id, P_CARD->cur[0] );		//初期座標位置セット

	// メインカーソル
	P_CARD->cur[1] = GetNowCursorActNo( id );

	// メッセージ表示
//	PokeListWinClear2();
	PokeListWinFixMsgPut2( P_LIST->work[7], 0 );

	// カードの色変更
	PokeSelectCard(
		&PokeCardPos[ ActWork[ P_CARD->cur[0] ].work[C_POS] << 1 ],
		ActWork[ P_CARD->cur[0] ].work[C_POS], CARD_G_PAL, 0 );
	P_LIST->card_flg = 2;
}

//-------------------------
//		キーチェック
//-------------------------
static void PokemonSortMove( u8 id, s8 move )
{
	actWork * p0 = &ActWork[ P_CARD->cur[0] ];
	actWork * p1 = &ActWork[ P_CARD->cur[1] ];

	PokeNowCursorMove2( id, move );

	if( p0->work[C_POS] != p1->work[C_POS] )
		PokeSelectCard( &PokeCardPos[ p0->work[C_POS] << 1 ], p0->work[C_POS], CARD_G_PAL, 1 );
	else
		PokeSelectCard( &PokeCardPos[ p0->work[C_POS] << 1 ], p0->work[C_POS], CARD_G_PAL, 0 );

/*
	if( ActWork[P_CARD->cur[0]].work[C_POS] != ActWork[P_CARD->cur[1]].work[C_POS] )
		PokeSelectCard( &PokeCardPos[ ActWork[ P_CARD->cur[0] ].work[C_POS] << 1 ],
						ActWork[ P_CARD->cur[0] ].work[C_POS], CARD_G_PAL, 1 );
*/
}

void PokemonSort( u8 id )
{
	switch( sys.Repeat ){
	case U_KEY:
		PokemonSortMove( P_CARD->main_id, -1 );
		break;
	case D_KEY:
		PokemonSortMove( P_CARD->main_id, 1 );
		break;
	case L_KEY:
		PokemonSortMove( P_CARD->main_id, -2 );
		break;
	case R_KEY:
		PokemonSortMove( P_CARD->main_id, 2 );
	}

	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		TaskTable[id].TaskAdrs = P_CARD->UseTask;
		TaskTable[id].TaskAdrs(id);
		return;
	}

	if( sys.Trg == B_BUTTON ){
		SePlay(SE_SELECT);
		PokemonSortEnd2(id);
	}
}

//---------------------------
//		並び替え終了
//---------------------------
static void PokeSortEndParam( u8 id )
{
	// カーソル復帰
	DelActor( &ActWork[ P_CARD->cur[0] ] );

	// メッセージ表示
//	PokeListWinClear2();
	PokeListWinFixMsgPut2( ERANDE_MSG, 0 );

	// カード転送終了
	P_LIST->card_flg = 2;

	// メインタスク復帰
	ChangeBackTask( P_CARD->main_id );
	DelTask( id );
}

static void PokemonSortEnd( u8 id )
{
	PokeSelectCard( &PokeCardPos[ ActWork[ P_CARD->cur[1] ].work[C_POS] << 1 ],
					ActWork[ P_CARD->cur[1] ].work[C_POS], CARD_B_PAL, 1 );
	PokeSelectCard( &PokeCardPos[ ActWork[ P_CARD->cur[0] ].work[C_POS] << 1 ],
					ActWork[ P_CARD->cur[0] ].work[C_POS], CARD_B_PAL, 0 );

	PokeSortEndParam(id);
}

void PokeSortEndCancelParam(void)
{
	u8	pos1 = (u8)ActWork[ P_CARD->cur[0] ].work[C_POS];
	u8	pos2 = (u8)ActWork[ P_CARD->cur[1] ].work[C_POS];

	if( pos1 <= PL_POS_POKE5 )
		PokeSelectCard( &PokeCardPos[ pos1 << 1 ], pos1, CARD_B_PAL, 0 );
	if( pos2 <= PL_POS_POKE5 )
		PokeSelectCard( &PokeCardPos[ pos2 << 1 ], pos2, CARD_B_PAL, 1 );

}

void PokemonSortEnd2( u8 id )
{
	PokeSortEndCancelParam();
	PokeSortEndParam(id);
}

//------------------------------------------------------
//					カードを動かす
//------------------------------------------------------
//---------------------
//		初期設定
//---------------------
void PokeCardChangeInit( u8 id )
{
	u8	pos1,pos2;

	// カーソル位置
	pos1 = ActWork[ P_CARD->cur[0] ].work[0];
	pos2 = ActWork[ P_CARD->cur[1] ].work[0];

	// 同じところが選択されたとき
	if( pos1 == pos2 || ( pos1 == PL_POS_MODORU || pos2 == PL_POS_MODORU ) ){
		PokemonSortEnd2(id);
		return;
	}

	// 名前、LV、HP、ｹﾞｰｼﾞ消す
	StatusAreaClear( pos1 );
	StatusAreaClear( pos2 );

	// 動かすカードを指定
	if( pos1 > pos2 ){
		P_CARD->move[0] = pos2;
		P_CARD->move[1] = pos1;
	}else{
		P_CARD->move[0] = pos1;
		P_CARD->move[1] = pos2;
	}

	// アイコンのアクター番号を取得
	P_CARD->act[0] = GetPataChrActNo( P_CARD->main_id, P_CARD->move[0] );
	P_CARD->act[1] = GetPataChrActNo( P_CARD->main_id, P_CARD->move[1] );

	// アイコンアクター設定
	// 先頭と入れ替え
	if( P_CARD->move[0] == 0 ){
		ActWork[ P_CARD->act[0] ].work[ ACT_XCNT ] = -8;
		ActWork[ P_CARD->act[0] ].work[ ACT_XMAX ] = -XMAX_PARAM;

		P_CARD->m_cnt[0] = 1;
		P_CARD->m_cnt[1] = 0x0c;
		TaskTable[id].TaskAdrs = PokeCardChange1X_0;
		P_LIST->card_flg = 1;
	// 先頭以外と入れ替え
	}else{
		ActWork[ P_CARD->act[0] ].work[ ACT_XCNT ] = 8;
		ActWork[ P_CARD->act[0] ].work[ ACT_XMAX ] = XMAX_PARAM;

		P_CARD->m_cnt[0] = 0x0c;
		P_CARD->m_cnt[1] = 0x0c;
		TaskTable[id].TaskAdrs = PokeCardChange2X_0;
		P_LIST->card_flg = 1;
	}
	ActWork[ P_CARD->act[0] ].move = PokeIconMove;

	ActWork[ P_CARD->act[1] ].work[ ACT_XCNT ] = 8;
	ActWork[ P_CARD->act[1] ].work[ ACT_XMAX ] = XMAX_PARAM;
	ActWork[ P_CARD->act[1] ].move = PokeIconMove;
	
	ActWork[ P_CARD->act[0] ].move( &ActWork[ P_CARD->act[0] ] );
	ActWork[ P_CARD->act[1] ].move( &ActWork[ P_CARD->act[1] ] );
}

//----------------------------------
//		アイコンを入れ替える
//----------------------------------
static void ChangeActPos( s16 * p1, s16 * p2 )
{
	s16	copy;

	copy = *p1;
	*p1  = *p2;
	*p2  = copy;
}
static void PokeCardChangeActReverse(void)
{
	ChangeActPos( &ActWork[ P_CARD->act[0] ].x, &ActWork[ P_CARD->act[1] ].x );
	ChangeActPos( &ActWork[ P_CARD->act[0] ].y, &ActWork[ P_CARD->act[1] ].y );
	ChangeActPos( &ActWork[ P_CARD->act[0] ].dx, &ActWork[ P_CARD->act[1] ].dx );
	ChangeActPos(
		&ActWork[ P_CARD->act[0] ].work[ ACT_XCNT ],
		&ActWork[ P_CARD->act[1] ].work[ ACT_XCNT ] );

	ActWork[ P_CARD->act[0] ].move = PokeIconMove;
	ActWork[ P_CARD->act[1] ].move = PokeIconMove;
}

//------------------------------------
//		先頭のポケモンと入れ替え
//------------------------------------
// カードを動かす
static void PokeCardChange1X_X( u8 id, u8 flg )
{
	u8	y;

	y = ( P_CARD->move[1] -1 ) * 3 + 1;

	DelPoke00Card( P_CARD->m_cnt[0], 3 );
	DelPoke01Card( P_CARD->m_cnt[1], y );

	if( flg == 0 ){
		P_CARD->m_cnt[0]--;
		P_CARD->m_cnt[1]++;
	}else{
		P_CARD->m_cnt[0]++;
		P_CARD->m_cnt[1]--;
	}

	DrawPoke00Card( P_CARD->m_cnt[0], 3, CARD_G_PAL+CARD_FLASH_PAL );
	DrawPoke01Card( P_CARD->m_cnt[1], y, 0, CARD_G_PAL+CARD_FLASH_PAL );
}

// カードアウト
static void PokeCardChange1X_0( u8 id )
{
	PokeCardChange1X_X( id, 0 );

	if( P_CARD->m_cnt[0] < -12 && P_CARD->m_cnt[1] > 0x20 ){
		PokeCardChangeActReverse();
		TaskTable[id].TaskAdrs = PokeCardChange1X_1;
	}
}

// カードイン
static void PokeCardChange1X_1( u8 id )
{
	PokeCardChange1X_X( id, 1 );

	if( P_CARD->m_cnt[0] == 1 && P_CARD->m_cnt[1] == 0x0c )
		TaskTable[id].TaskAdrs = PokeCardChangeParam;
}

//-----------------------------------------
//		先頭以外のポケモンを入れ替え
//-----------------------------------------
// カードを動かす
static void PokeCardChange2X_X2( u8 id, u8 flg )
{
	u8	y1,y2;

	y1 = ( P_CARD->move[0] -1 ) * 3 + 1;
	y2 = ( P_CARD->move[1] -1 ) * 3 + 1;

	DelPoke01Card( P_CARD->m_cnt[0], y1 );
	DelPoke01Card( P_CARD->m_cnt[1], y2 );

	if( flg == 0 ){
		P_CARD->m_cnt[0]++;
		P_CARD->m_cnt[1]++;
	}else{
		P_CARD->m_cnt[0]--;
		P_CARD->m_cnt[1]--;
	}

	DrawPoke01Card( P_CARD->m_cnt[0], y1, 0, CARD_G_PAL+CARD_FLASH_PAL );
	DrawPoke01Card( P_CARD->m_cnt[1], y2, 0, CARD_G_PAL+CARD_FLASH_PAL );
}

// カードアウト
static void PokeCardChange2X_0( u8 id )
{
	PokeCardChange2X_X2( id, 0 );

	if( P_CARD->m_cnt[0] > 0x20 && P_CARD->m_cnt[1] > 0x20 ){
		PokeCardChangeActReverse();
		TaskTable[id].TaskAdrs = PokeCardChange2X_1;
	}
}

// カードイン
static void PokeCardChange2X_1( u8 id )
{
	PokeCardChange2X_X2( id, 1 );

	if( P_CARD->m_cnt[0] == 0x0c && P_CARD->m_cnt[1] == 0x0c )
		TaskTable[id].TaskAdrs = PokeCardChangeParam;
}

//-------------------------------
//		データを入れ替える
//-------------------------------
static void PokeCardChangeParam( u8 id )
{
	u8	main_act;

	SetPataChrActNo( P_CARD->main_id, P_CARD->move[0], P_CARD->act[1] );
	SetPataChrActNo( P_CARD->main_id, P_CARD->move[1], P_CARD->act[0] );

	ActWork[ P_CARD->act[0] ].x    = PataChrDefaultPos[ FightCheck() ][ P_CARD->move[1] ].x;
	ActWork[ P_CARD->act[0] ].y    = PataChrDefaultPos[ FightCheck() ][ P_CARD->move[1] ].y;
	ActWork[ P_CARD->act[0] ].dx   = 0;
	ActWork[ P_CARD->act[0] ].dy   = 0;
	ActWork[ P_CARD->act[0] ].move = PokeActNotSelectMove;
	ActWork[ P_CARD->act[1] ].x    = PataChrDefaultPos[ FightCheck() ][ P_CARD->move[0] ].x;
	ActWork[ P_CARD->act[1] ].y    = PataChrDefaultPos[ FightCheck() ][ P_CARD->move[0] ].y;
	ActWork[ P_CARD->act[1] ].dx   = 0;
	ActWork[ P_CARD->act[1] ].dy   = 0;
	ActWork[ P_CARD->act[1] ].move = PokeActNotSelectMove;

	main_act = GetPataChrActNo( P_CARD->main_id, ActWork[ P_CARD->cur[1] ].work[C_POS] );
	ActWork[ main_act ].move = PokeActSelectMove;

	SwapPokemon( &PokeParaMine[ P_CARD->move[0] ], &PokeParaMine[ P_CARD->move[1] ] );

	ListPokeLvPut( P_CARD->move[0], &PokeParaMine[ P_CARD->move[0] ] );
	ListPokeNamePut( P_CARD->move[0], &PokeParaMine[ P_CARD->move[0] ] );
	ListPokeHpPut( P_CARD->move[0], &PokeParaMine[ P_CARD->move[0] ] );
	ListPokeMaxHpPut( P_CARD->move[0], &PokeParaMine[ P_CARD->move[0] ] );

	ListPokeLvPut( P_CARD->move[1], &PokeParaMine[ P_CARD->move[1] ] );
	ListPokeNamePut( P_CARD->move[1], &PokeParaMine[ P_CARD->move[1] ] );
	ListPokeHpPut( P_CARD->move[1], &PokeParaMine[ P_CARD->move[1] ] );
	ListPokeMaxHpPut( P_CARD->move[1], &PokeParaMine[ P_CARD->move[1] ] );

	PokeListGaugeSetAll();
	PokemonSortEnd(id);
}

//-----------------------------
//		アイコンを動かす
//-----------------------------
static void PokeIconMove( actWork * act )
{
	ExtAnm( act );

	if( act->dx == act->work[ ACT_XMAX ]  ){
		act->work[ ACT_XCNT ] *= -1;
		act->work[ ACT_XMAX ] = 0;
		act->move = PokeActNotSelectMove;
		return;
	}
	act->dx += act->work[ ACT_XCNT ];
}



//=======================================================================================
//						マルチバトル前にカードをスクロール
//=======================================================================================
// カード本体のスクロール
void ScrollInPokeListCardMove( u8 id, u16 mons1, u16 mons2 )
{
	u8 * pos = (u8 *)&PokeCardPos[24];

	// 前回の位置のカードを消去
	DelPoke00Card( pos[2] + TaskTable[id].work[0],  pos[3] );
	DelPoke01Card( pos[8] + TaskTable[id].work[0],  pos[9] );
	DelPoke01Card( pos[10] + TaskTable[id].work[0], pos[11] );

	// 位置を更新して表示
	TaskTable[id].work[0]--;

	DrawPoke00Card( pos[2] + TaskTable[id].work[0], pos[3], CARD_Y_PAL );

	if( mons1 != 0 )
		DrawPoke01Card( pos[8] + TaskTable[id].work[0], pos[9], 0, CARD_Y_PAL );
	else	DrawPoke01Card( pos[8] + TaskTable[id].work[0], pos[9], 1, CARD_Y_PAL );

	if( mons2 != 0 )
		DrawPoke01Card( pos[10] + TaskTable[id].work[0], pos[11], 0, CARD_Y_PAL );
	else	DrawPoke01Card( pos[10] + TaskTable[id].work[0], pos[11], 1, CARD_Y_PAL );
}

// ポケモンアイコンをスクロール
void SetPokeIconScroll( u8 id, u16 monsno, u8 no )
{
	u8	act;

	if( monsno != 0 ){
		act = GetPataChrActNo( id, no+3 );
		ActWork[ act ].work[ ACT_XCNT ] = -8;
		ActWork[ act ].work[ ACT_XMAX ] = -8 * TaskTable[id].work[0];
		ActWork[ act ].move = PokeIconMove;
	}
}

void ScrollInActXPosPlus( u8 id, u8 pos )
{
	ActWork[ GetPataChrActNo( id, pos ) ].x += 30 * 8;
}




//=========================================================================
//	定型メッセージ表示ルーチン
//=========================================================================
//----------------------------------------------------------
//	画面下のウィンドウ、定型メッセージ表示ルーチン
//----------------------------------------------------------
void PokeListWinFixMsgPut2( u8 msg_no, u8 flg )
{
	if( msg_no == MSG_NOT_PUT )	return;

	if( flg == 0 )	NMenuWinBoxWrite( 0, 16, 23, 19 );	// ノーマル
	if( flg == 1 )	NMenuWinBoxWrite( 0, 16, 19, 19 );	// メニュー
	if( flg == 2 )	NMenuWinBoxWrite( 0, 16, 22, 19 );	// 持たせる/あずかる
	NMenuMsgWrite( PokeListWinFixMsg[msg_no], 1, 17 );
}

//----------------------------------------------------------
//	画面下のウィンドウ内、メッセージクリア
//----------------------------------------------------------
void PokeListWinClear2(void)
{
	NMenuBoxClear( 0, 16, 29, 19 );
}


//----------------------------------------------------------
//	名前、HP、LVを消す
// pos = 何体目のポケモンのｽﾃｰﾀｽを消すか(0ｵﾘｼﾞﾝ)
//----------------------------------------------------------
static void StatusAreaClear(u8 pos)
{
	u8 s_x, s_y, e_x, e_y;
	
	s_x = StAreaClearPos[FightCheck()][pos].s_x;
	s_y = StAreaClearPos[FightCheck()][pos].s_y;
	e_x = StAreaClearPos[FightCheck()][pos].e_x;
	e_y = StAreaClearPos[FightCheck()][pos].e_y;
	FontScrnAreaClear(&FightMsg, s_x, s_y, e_x, e_y);
}

//----------------------------------------------------------
//	HPを消す
// pos = 何体目のポケモンのｽﾃｰﾀｽを消すか(0ｵﾘｼﾞﾝ)
//----------------------------------------------------------
void StHpAreaClear( u8 pos )
{
	u8 s_x, s_y, e_x, e_y;
	
	s_x = StHPAreaClearPos[FightCheck()][pos].s_x;
	s_y = StHPAreaClearPos[FightCheck()][pos].s_y;
	e_x = StHPAreaClearPos[FightCheck()][pos].e_x;
	e_y = StHPAreaClearPos[FightCheck()][pos].e_y;
	FontScrnAreaClear(&FightMsg, s_x, s_y, e_x, e_y);
}



//=======================================================================================
//=======================================================================================
//=======================================================================================
//=======================================================================================



//----------------------------------------------------------
//	引数: 0=一括全転送	
//		  1～=別Syncに分割しながら転送(1が戻るまで数字を大きくして毎Sync呼びつづける)
//----------------------------------------------------------
u8 PokeListBgSet( u8 trans_type )
{
	u16 white_pal = 0x7fff;
	u8 ret = 0;
	
	// else ifをすると0で全部セットされなくなってしまうので全部普通にifでやる
	if(trans_type == 1 || trans_type == 0)
		DecordVram((void*)p_list_pch_ADRS, (void*)CHAR_BASE0_ADDR);
	if(trans_type == 2 || trans_type == 0)
		DecordVram((void*)p_list03_psc_ADRS, (void*)SCREEN_BASE7_ADDR);
	if(trans_type == 3 || trans_type == 0)
		DecordPaletteWork((void*)p_list_pcl_ADRS, PA_BG0+PA_COL0, 0x160);
	if(trans_type == 4 || trans_type == 0)
		PaletteWorkSet(&white_pal, 0, 2);
	if(trans_type == 5 || trans_type == 0)
		DecordVram((void*)p_listg2_pch_ADRS, LISTGAUGE_TRANS_ADDR);
	if(trans_type == 6 || trans_type == 0)
		DecordVram((void*)p_list_m_pch_ADRS, LIST_MOJI_TRANS_ADDR);
	if(trans_type == 7 || trans_type == 0)
		DecordVram((void*)st_cnd_pch_ADRS, LIST_CONDITION_TRANS_ADDR);
	if(trans_type == 8 || trans_type == 0){
		DecordPaletteWork((void*)st_cnd_pcl_ADRS, PA_BG11+PA_COL0, 0x20);
		ret = 1;
	}
	return ret;
}
//----------------------------------------------------------
//	ﾊﾟﾀﾊﾟﾀｷｬﾗをAddActor
// pos = 何番目に表示するか
//----------------------------------------------------------
static void PokeIconAnmSetParam( u8 act, u16 hp, u16 mhp )
{
	u8	color;
	u8	anmno;
	
	color = GetGaugeDottoColor( hp, mhp );

	if( hp == mhp )		anmno = 0;		// HP Full
	else if(color == 3)	anmno = 1;		// green
	else if(color == 2)	anmno = 2;		// yellow
	else if(color == 1)	anmno = 3;		// red
	else				anmno = 4;		// dead

	ExtAnmChg( &ActWork[act], anmno );
}

static void PokeIconAnmSet( u8 act, PokemonParam * pp )
{
	PokeIconAnmSetParam(
		act,
		PokeParaGet( pp, ID_hp ),
		PokeParaGet( pp, ID_hpmax ) );
}

void PataChrActorSet2( u8 taskno, u8 pos, u8 type, PokemonParam * pp )
{
	u8	xpos, ypos;
	u8	actno;

	xpos = PataChrDefaultPos[ type ][ pos ].x;
	ypos = PataChrDefaultPos[ type ][ pos ].y;

	actno = PokeIconSet2(
			PokeParaGet( pp, ID_monsno_egg ),
			PokeIconDmmyMove, xpos, ypos, POKEPATA_PRI,
			PokeParaGet( pp, ID_personal_rnd ) );
	SetPataChrActNo(taskno, pos, actno);

	PokeIconAnmSet( actno, pp );
}

void PataChrActorSet(u8 taskno, u8 pos, PokemonParam *pp)
{
	if( PokeParaGet(pp, ID_monsno) == 0 )	return;

	if( MultiCheck() == TRUE )	PataChrActorSet2( taskno, pos, 2, pp );
	else						PataChrActorSet2( taskno, pos, FightCheck(), pp );
}

void PataChrActorSetAll(u8 taskno)
{
	u8 i;
	
	for( i=0; i<PokeCountMine; i++ )
		PataChrActorSet( taskno, i, &PokeParaMine[i] );
}

// マルチバトル参加確認用
void PataChrActorSetParam( u8 taskno, u8 pos, u8 type, MultiPokeListData * mpld )
{
	u8	xpos, ypos;
	u8	actno;

	xpos = PataChrDefaultPos[ type ][ pos ].x;
	ypos = PataChrDefaultPos[ type ][ pos ].y;

	actno = PokeIconSet2(
				mpld->monsno, PokeIconDmmyMove,
				xpos, ypos, POKEPATA_PRI, mpld->personal_rnd );
	SetPataChrActNo( taskno, pos, actno );

	PokeIconAnmSetParam( actno, mpld->hp, mpld->hpmax );
}






//---------------------------------------------
//		選択中のポケモンアイコンのアニメ
//---------------------------------------------
static void PokeActSelectMove( actWork * act )
{
	u8	anm;

	anm = ExtAnm( act );

	if( anm != 0 ){
		if( anm & 1 )	act->dy = -3;
		else			act->dy = 1;
	}
}

static void PokeActNotSelectMove( actWork * act )
{
	ExtAnm( act );
}

//-------------------------------------------
//		ポケモンアイコンのアニメを変更
//-------------------------------------------
static void PokeActAnmChenge( u8 task_id, u8 pos, u8 flg )
{
	u8	act;

	if( pos >= TEMOTI_POKEMAX )	return;

	act = GetPataChrActNo( task_id, pos );
	ActWork[ act ].dy      = 0;
	ActWork[ act ].work[0] = 0;
	if( flg == 0 )	ActWork[ act ].move = PokeActNotSelectMove;
	else			ActWork[ act ].move = PokeActSelectMove;

}

//----------------------------------------------------------
//	ｱｲﾃﾑｱｲｺﾝをCellSet&PalSet
//----------------------------------------------------------
void ItmeIconCellPalSet(void)
{
	CellSet((CellData*)&ItemIconCellTbl);
	ObjPalSet((PalData*)&ItemIconPalTbl);
}



// =================================================================
// ItemIconSeq2
// 概要  : 通信こうかん画面用アイテムアイコンシーケンス
// 引数  : Xreg
// 戻り値: none
// =================================================================
static void ItemIconSeq2(actWork *Xreg)
{
	u8 pataact;
	
	pataact = Xreg->work[7];
	if(ActWork[pataact].banish){		//ポケモンが隠されてたらアイテムアイコンも隠す
		Xreg->banish = 1;
	}else{
		Xreg->banish = 0;
		Xreg->x = ActWork[pataact].x + ActWork[pataact].dx;
		Xreg->y = ActWork[pataact].y + ActWork[pataact].dy;
	}
}

// =================================================================
// KoukanPokeItemIconActorSetSub
// 概要  : アイテムアイコン登録（通信こうかん画面用）
// 引数  : actno
//       : item
// 戻り値: none
// =================================================================
static void KoukanPokeItemIconActorSetSub(u8 pokeactno, u8 item)
{
	u8 actno,pri;
	
	pri = ActWork[pokeactno].pri;
	actno = AddActor(&ItemIconHeader, 250,170, pri-1);		//ポケモンアイコンよりも手前に
	ActWork[actno].dx = ITEMICON_OFFSET_X;
	ActWork[actno].dy = ITEMICON_OFFSET_Y;
	ActWork[actno].move = ItemIconSeq2;						//こうかん画面用のシーケンス
	ActWork[actno].work[7] = pokeactno;
	ActAnmChg(&ActWork[actno],item);
	ActWork[actno].move(&ActWork[actno]);
	
}


// =================================================================
// ItemIconActorSetSub
// 概要  : ポケモン一体につきアイテムアイコンを登録する
// 引数  : id		:	
//       : pataact	:
// 戻り値: none
// =================================================================
void KoukanPokeItemIconActorSet(u8 pokenum[2], u8 iconlist[2][6], u8 side)
{
	u16 item,i;

	switch(side){												
		case 0:														//自分用
			for( i=0; i<pokenum[0]; i++ ){
				if((item=PokeParaGet(&PokeParaMine[i], ID_item)) != NON_ITEM){
					KoukanPokeItemIconActorSetSub(iconlist[0][i],MailItemNoCheck(item));		
				}
			}
			break;
		case 1:														//相手用
			for( i=0; i<pokenum[1]; i++){
				if((item=PokeParaGet(&PokeParaEnemy[i], ID_item)) != NON_ITEM){
					KoukanPokeItemIconActorSetSub(iconlist[1][i],MailItemNoCheck(item));
				}
			}
			break;
	}
}



//----------------------------------------------------------
//	ｱｲﾃﾑｱｲｺﾝをAddActor	※先にﾊﾟﾀｷｬﾗをAddActorしておくこと！
//----------------------------------------------------------
void ItemIconActorSet( u8 id )
{
	u8 i;
	u8 actno;
	u8 pataact;
	
	for( i=0; i<TEMOTI_POKEMAX; i++ ){
		if( PokeParaGet( &PokeParaMine[i], ID_monsno ) != 0 ){
			pataact = GetPataChrActNo(id, i);
			actno = AddActor(&ItemIconHeader, 250,170, ITEMICON_PRI);
			ActWork[actno].dx = ITEMICON_OFFSET_X;
			ActWork[actno].dy = ITEMICON_OFFSET_Y;
			ActWork[actno].work[7] = pataact;
			ActWork[pataact].work[7] = actno;
			ItemIconStatusSet(id, i);
			ActWork[actno].move(&ActWork[actno]);
		}
	}
}

void ItemIconActSetParam( u8 id, u8 pos, u16 item )
{
	u8	item_act;
	u8	poke_act;

	poke_act = GetPataChrActNo( id, pos );
	item_act = AddActor( &ItemIconHeader, 250, 170, ITEMICON_PRI );

	ActWork[item_act].dx = ITEMICON_OFFSET_X;
	ActWork[item_act].dy = ITEMICON_OFFSET_Y;
	ActWork[item_act].work[7] = poke_act;
	ActWork[poke_act].work[7] = item_act;

	if( item == 0 )	ActWork[item_act].banish = 1;
	else if( MailItemNoCheck( item ) )
	{
		ActAnmChg( &ActWork[item_act], 1 );
		ActWork[item_act].banish = 0;
	}else{
		ActAnmChg( &ActWork[item_act], 0 );
		ActWork[item_act].banish = 0;
	}

	ActWork[item_act].move( &ActWork[item_act] );
}

//----------------------------------------------------------
//	ｱｲﾃﾑｱｲｺﾝｱｸﾀｰｼｰｹﾝｽ
//----------------------------------------------------------
static void ItemIconSeq(actWork *Xreg)
{
	u8 pataact;
	
	pataact = Xreg->work[7];
	Xreg->x = ActWork[pataact].x + ActWork[pataact].dx;
//	Xreg->y = ActWork[pataact].y + ActWork[pataact].dy;
	Xreg->y = ActWork[pataact].y;
}


//----------------------------------------------------------
//	3桁の数字まで表示
// yose = 0:左寄せ  1:右寄せ
//----------------------------------------------------------
#define NUM_BUF_LEN		4	// 3桁 + EOM_

static void PokeListNumberPut( u16 number, u8 TransCharNo, u8 yose, u8 xpos, u8 ypos )
{
	u8	i;
	u8	MsgBuf[NUM_BUF_LEN];
	u8	put_num;

	u32   trans_pos;
	u16 * ptrans;

	if( yose == 0 )	PM_NumMsgSet( MsgBuf, number, NUM_MODE_LEFT, 3 );
	else			PM_NumMsgSet( MsgBuf, number, NUM_MODE_SPACE, 3 );

	trans_pos = SCREEN_BASE30_ADDR + ( xpos << 1 ) + ( (ypos+1) << 6 );
	ptrans    = (void *)( trans_pos );

	for( i=0; MsgBuf[i] != EOM_; i++ ){

		if( MsgBuf[i] == spc_ )	put_num = spc_8x8;
		else					put_num = n0_8x8 + MsgBuf[i] - n0_;

		ptrans[i] = 0xf000 + POKELIST_FONT_START + put_num;
	}
}













//=========================================================================
//	ツール類
//=========================================================================
//----------------------------------------------------------
//	ﾊﾟﾀｷｬﾗのactnoを取り出す
// get_pos: 先頭からget_pos番目のﾊﾟﾀｷｬﾗのactnoを取り出す(0ｵﾘｼﾞﾝ)
//----------------------------------------------------------
static u8 GetPataChrActNo(u8 taskno, u8 get_pos)
{
	switch(get_pos)
	{
		case 0:
			return TaskTable[taskno].work[M_PATA_ACTNO0_1] >> 8;
		case 1:
			return TaskTable[taskno].work[M_PATA_ACTNO0_1] & 0xff;
		case 2:
			return TaskTable[taskno].work[M_PATA_ACTNO2_3] >> 8;
		case 3:
			return TaskTable[taskno].work[M_PATA_ACTNO2_3] & 0xff;
		case 4:
			return TaskTable[taskno].work[M_PATA_ACTNO4_5] >> 8;
		case 5:
			return TaskTable[taskno].work[M_PATA_ACTNO4_5] & 0xff;
	}
	return TaskTable[taskno].work[0] >> 8;	//error 一応0番目のを返す
}
//----------------------------------------------------------
//	ﾊﾟﾀｷｬﾗのactnoをﾀｽｸﾜｰｸへｾｯﾄする
// set_pos = 先頭から何体目のﾊﾟﾀｷｬﾗか(0ｵﾘｼﾞﾝ)
//----------------------------------------------------------
static void SetPataChrActNo(u8 taskno, u8 set_pos, u8 actno)
{
	switch(set_pos)
	{
		case 0:
			TaskTable[taskno].work[M_PATA_ACTNO0_1] &= 0x00ff;
			TaskTable[taskno].work[M_PATA_ACTNO0_1] |= actno << 8;
			break;
		case 1:
			TaskTable[taskno].work[M_PATA_ACTNO0_1] &= 0xff00;
			TaskTable[taskno].work[M_PATA_ACTNO0_1] |= actno;
			break;
		case 2:
			TaskTable[taskno].work[M_PATA_ACTNO2_3] &= 0x00ff;
			TaskTable[taskno].work[M_PATA_ACTNO2_3] |= actno << 8;
			break;
		case 3:
			TaskTable[taskno].work[M_PATA_ACTNO2_3] &= 0xff00;
			TaskTable[taskno].work[M_PATA_ACTNO2_3] |= actno;
			break;
		case 4:
			TaskTable[taskno].work[M_PATA_ACTNO4_5] &= 0x00ff;
			TaskTable[taskno].work[M_PATA_ACTNO4_5] |= actno << 8;
			break;
		case 5:
			TaskTable[taskno].work[M_PATA_ACTNO4_5] &= 0xff00;
			TaskTable[taskno].work[M_PATA_ACTNO4_5] |= actno;
			break;
	}
}
//----------------------------------------------------------
//	ｱｲﾃﾑｱｲｺﾝのactnoを取り出す
// taskno : ﾒｲﾝﾀｽｸのID
// get_pos: 先頭からget_pos番目のﾊﾟﾀｷｬﾗのactnoを取り出す(0ｵﾘｼﾞﾝ)
//----------------------------------------------------------
static u8 GetItemIconActNo(u8 taskno, u8 get_pos)
{
	u8 actno;
	
	actno = GetPataChrActNo(taskno, get_pos);
	return ActWork[actno].work[7];
}
//----------------------------------------------------------
//	ﾎﾟｹﾓﾝの手持ちｱｲﾃﾑを調べてｱｲｺﾝの状態を変える
// 引数: id = ﾒｲﾝﾀｽｸのID
//       pokepos = 何番目のﾎﾟｹﾓﾝか(0ｵﾘｼﾞﾝ)
// 		 status = ITEM_ICON(ｱｲﾃﾑ)  MAIL_ICON(ﾒｰﾙ)  BANISH_ICON(ﾊﾞﾆｯｼｭする)
//----------------------------------------------------------
void ItemIconStatusSet( u8 id, u8 pokepos )
{
	u8	actno;
	
	actno = GetItemIconActNo(id, pokepos);

	if(PokeParaGet(&PokeParaMine[pokepos], ID_item) == NON_ITEM)
		ActWork[actno].banish = 1;
	else if(PokeMailCheck(&PokeParaMine[pokepos]))
	{
		ActAnmChg(&ActWork[actno], 1);
		ActWork[actno].banish = 0;
	}
	else
	{
		ActAnmChg(&ActWork[actno], 0);
		ActWork[actno].banish = 0;
	}
}


//=========================================================================
//	ニックネーム表示
//	pos = 位置	type = リストタイプ
//=========================================================================
//----------------------------------------------------------
//	文字列指定
//	naem = 文字列のポインタ
//----------------------------------------------------------
void ListPokeNamePutParam( u8 pos, u8 type, u8 * name )
{
	u8 xpos, ypos;

	xpos = NameDefaultPos[ type ][ pos ].x;
	ypos = NameDefaultPos[ type ][ pos ].y;

	MsgPutSet(
		&FightMsg,					// TALK_WIN構造体のｱﾄﾞﾚｽ
		name,						// 表示するﾒｯｾｰｼﾞの先頭ｱﾄﾞﾚｽ
		POKELIST_FONT_START,		// 8x8ｻｲｽﾞ固定ﾌｫﾝﾄﾓｰﾄﾞに変更のため
		xpos, ypos );				// 表示座標

	MsgPut( &FightMsg );
}
//----------------------------------------------------------
//	ポケモンパラメータ指定
//	pp = ポケモンパラメータのポインタ
//----------------------------------------------------------
void ListPokeNamePut2( u8 pos, u8 type, PokemonParam * pp )
{
	u8 name[ MONS_NAME_SIZE + EOM_SIZE ];

	PokeNickNameSet( pp, name );
	ListPokeNamePutParam( pos, type, name );
}

void ListPokeNamePut( u8 pos, PokemonParam * pp )
{
	if( PokeParaGet(pp, ID_monsno) == 0 )	return;

	if( MultiCheck() == TRUE )	ListPokeNamePut2( pos, 2, pp );
	else						ListPokeNamePut2( pos, FightCheck(), pp );
}
//----------------------------------------------------------
//	手持ちポケモンすべてのニックネームを表示
//----------------------------------------------------------
void PokeNamePutAll(void)
{
	u8 i;
	
	for( i=0; i<TEMOTI_POKEMAX; i++ )
		ListPokeNamePut( i, &PokeParaMine[i] );
}

//----------------------------------------------------------
//	ポケモンのニックネームセット
//	戻り値　EOM_アドレス
//----------------------------------------------------------
u8 * PokeNickNameSet( PokemonParam * pp, u8 * str )
{
	PokeParaGet( pp, ID_nickname, str );
	return	NickNameCutOff( str );
}


//----------------------------------------------------------
//		状態異常表示
//----------------------------------------------------------
void PokeConditionPutCardMoji( u8 pos, u8 type, u8 condition )
{
	u32   trans;
	u16 * ptrans;
	u8    i;
	u8	  xpos,ypos;

	xpos = LvDefaultPos[ type ][ pos ].x-1;
	ypos = LvDefaultPos[ type ][ pos ].y+1;

	trans = SCREEN_BASE30_ADDR + ( xpos + ypos * 32 ) * 2;

	ptrans = (void *)( trans );
	condition *= 4;

	for( i=0; i<4; i++ )
		ptrans[i] = ( CONDITION_PAL << 12 ) | ( LIST_CONDITION_TOPCHARNO + condition + i );
}

//----------------------------------------------------------
//		状態異常表示を消す
//----------------------------------------------------------
static void PokeConditionDelCardMoji( u8 pos )
{
	u32   trans;
	u16 * ptrans;
	u8    i;
	u8	  xpos,ypos;
	u8    type;

	if( MultiCheck() == TRUE )	type = 2;
	else						type = FightCheck();

	xpos = LvDefaultPos[ type ][ pos ].x-1;
	ypos = LvDefaultPos[ type ][ pos ].y+1;

	trans = SCREEN_BASE30_ADDR + ( xpos + ypos * 32 ) * 2;

	ptrans = (void *)(trans);

	for( i=0; i<4; i++ )
		ptrans[i] = 0;
}

//=========================================================================
//	レベル表示
//	pos = 位置	type = リストタイプ
//=========================================================================
void ListLvMojiPut( u8 chr, u8 x, u8 y )
{
	u32   trans;
	u16 * ptrans;

	trans  = SCREEN_BASE30_ADDR + ( x + y * 32 ) * 2;
	ptrans = (void *)( trans );

	ptrans[0] = LIST_MOJI_TOPCHARNO + chr;
}
//----------------------------------------------------------
//	数値指定
//	lv = レベル
//----------------------------------------------------------
void ListPokeLvPutParam( u8 pos, u8 type, u8 lv )
{
	u8 xpos, ypos;

	xpos = LvDefaultPos[ type ][ pos ].x;
	ypos = LvDefaultPos[ type ][ pos ].y;
	
	ListLvMojiPut( LV_MOJI_CHAR_NO, xpos-1, ypos+1 );

	PokeListNumberPut( lv, P_LV_TRANS_CHARNO + pos * P_KETA, 0, xpos, ypos );
}
//----------------------------------------------------------
//	ポケモンパラメータ指定
//	pp = ポケモンパラメータのポインタ
//----------------------------------------------------------
void ListPokeLvPut2( u8 pos, u8 type, PokemonParam * pp )
{
	ListPokeLvPutParam( pos, type, (u8)PokeParaGet( pp, ID_level ) );
}

void ListPokeLvPut( u8 pos, PokemonParam * pp )
{
	u8	con, type;

	if( PokeParaGet( pp, ID_monsno ) == 0 )			return;
	if( PokeParaGet( pp, ID_tamago_flag ) != 0 )	return;

	con = GetPokeCondition( pp );

	if( MultiCheck() == TRUE )	type = 2;
	else						type = FightCheck();

	if( con != ST_NORMAL && con != ST_POKERUS )
		PokeConditionPutCardMoji( pos, type, con-1 );
	else
		ListPokeLvPut2( pos, type, pp );

	PokeListSexPut( pos, type, pp );
}
//----------------------------------------------------------
//	手持ちポケモンすべてのLvを表示
//----------------------------------------------------------
void PokeLvPutAll(void)
{
	u8 i;

	for( i=0; i<TEMOTI_POKEMAX; i++ )
		ListPokeLvPut( i, &PokeParaMine[i] );
}

//=========================================================================
//	性別表示
//=========================================================================
void PokeListSexPutParam( u16 mons, u8 sex, u8 type, u8 pos, u8 * name )
{
	u8	x, y;

	if( mons == MONSNO_NIDORAN_M || mons == MONSNO_NIDORAN_F ){
		if( PM_strcmp( name, PokeNameData[mons] ) == 0 )
			return;
	}

	x = LvDefaultPos[ type ][ pos ].x+3;
	y = LvDefaultPos[ type ][ pos ].y+1;

	switch( sex ){
	case MONS_MALE:
		ListLvMojiPut( OSU_MOJI_CHAR_NO, x, y );
		break;
	case MONS_FEMALE:
		ListLvMojiPut( MESU_MOJI_CHAR_NO, x, y );
	}
}

void PokeListSexPut( u8 pos, u8 type, PokemonParam * pp )
{
	PokeNickNameSet( pp, StrTempBuffer0 );

	PokeListSexPutParam(
		PokeParaGet( pp, ID_monsno_egg ), PokeSexGet( pp ),
		type, pos, StrTempBuffer0 );
}

//=========================================================================
//	HP表示
//	pos = 位置	type = リストタイプ
//=========================================================================
//----------------------------------------------------------
//	数値指定
//	hp = HP
//----------------------------------------------------------
void ListPokeHpPutParam( u8 pos, u8 type, u16 hp )
{
	u8 xpos, ypos;
	
	xpos = HpDefaultPos[ type ][ pos ].x;
	ypos = HpDefaultPos[ type ][ pos ].y;

	PokeListNumberPut( hp, P_HP_TRANS_CHARNO + pos * P_KETA, 1, xpos, ypos);
}
//----------------------------------------------------------
//	ポケモンパラメータ指定
//	pp = ポケモンパラメータのポインタ
//----------------------------------------------------------
void ListPokeHpPut2( u8 pos, u8 type, PokemonParam *pp )
{
	ListPokeHpPutParam( pos, type, PokeParaGet(pp, ID_hp) );
}

void ListPokeHpPut( u8 pos, PokemonParam * pp )
{
	if( PokeParaGet( pp, ID_monsno ) == 0 )			return;
	if( PokeParaGet( pp, ID_tamago_flag ) != 0 )	return;

	if( MultiCheck() == TRUE )	ListPokeHpPut2( pos, 2, pp );
	else						ListPokeHpPut2( pos, FightCheck(), pp );
}
//----------------------------------------------------------
//	手持ちポケモンすべてのHPを表示
//----------------------------------------------------------
void PokeHpPutAll(void)
{
	u8 i;

	for( i=0; i<TEMOTI_POKEMAX; i++ )
		ListPokeHpPut( i, &PokeParaMine[i] );
}


//=========================================================================
//	最大HP表示
//	pos = 位置	type = リストタイプ
//=========================================================================
//----------------------------------------------------------
//	数値指定
//	mhp = 最大HP
//----------------------------------------------------------
void ListPokeMaxHpPutParam( u8 pos, u8 type, u16 mhp )
{
	u8 xpos, ypos;
	
	xpos = MaxHpDefaultPos[ type ][ pos ].x;
	ypos = MaxHpDefaultPos[ type ][ pos ].y;

	MsgPutSet( &FightMsg, str_surassyu, POKELIST_FONT_START, xpos-1, ypos );
	MsgPut( &FightMsg );

	PokeListNumberPut(
		mhp, P_HPMAX_TRANS_CHARNO + pos * P_KETA, 1, xpos, ypos );
}
//----------------------------------------------------------
//	ポケモンパラメータ指定
//	pp = ポケモンパラメータのポインタ
//----------------------------------------------------------
void ListPokeMaxHpPut2( u8 pos, u8 type, PokemonParam * pp )
{
	ListPokeMaxHpPutParam( pos, type, PokeParaGet( pp, ID_hpmax ) );
}

void ListPokeMaxHpPut(u8 pos, PokemonParam *pp)
{
	if( PokeParaGet( pp, ID_monsno ) == 0 )			return;
	if( PokeParaGet( pp, ID_tamago_flag ) != 0 )	return;

	if( MultiCheck() == TRUE )	ListPokeMaxHpPut2( pos, 2, pp );
	else						ListPokeMaxHpPut2( pos, FightCheck(), pp );
}
//----------------------------------------------------------
//	手持ちポケモンすべての最大HPを表示
//----------------------------------------------------------
void PokeMaxHpPutAll(void)
{
	u8 i;
	
	for( i=0; i<TEMOTI_POKEMAX; i++ )
		ListPokeMaxHpPut( i, &PokeParaMine[i] );
}


//=========================================================================
//	HPゲージを表示
//	pos = 位置	type = リストタイプ
//=========================================================================
//----------------------------------------------------------
//	数値指定
//	hp = HP		mhp = MAX HP
//----------------------------------------------------------
void ListGaugeScreenSetParam( u8 pos, u8 type, u16 hp, u16 mhp )
{
	GaugeDataBG gdata;
	u32 trans_pos;
	s32 hp_work;
	u16 *ptrans;
	u8	color;

	hp_work = HP_WORK_INIT_VALUE;
	gdata.MaxHP = mhp;
	gdata.NowHP = hp;
	gdata.beHP = 0;
	color = GetGaugeDottoColor( gdata.NowHP, gdata.MaxHP );
	if( color >= 3 )	gdata.color = HP_GAUGE_G_PAL;
	if( color == 2 )	gdata.color = HP_GAUGE_Y_PAL;
	if( color <= 1 )	gdata.color = HP_GAUGE_R_PAL;
	gdata.CharNo = LISTGAUGE_TOPCHRNO;
	trans_pos = GaugeDefaultPos[ type ][ pos ];
	GaugeBG(&gdata, &hp_work, (void*)trans_pos, 0);	

	//-- ｹﾞｰｼﾞの外枠をセット --//
	ptrans = (void*)(trans_pos - 2 * 2);
	ptrans[0] = ( HP_GAUGE_HP_PAL << 12 ) | ( LISTGAUGE_TOPCHRNO + 9 );
	ptrans[1] = ( HP_GAUGE_HP_PAL << 12 ) | ( LISTGAUGE_TOPCHRNO + 10 );
	ptrans[8] = ( HP_GAUGE_HP_PAL << 12 ) | ( LISTGAUGE_TOPCHRNO + 11 );
}
//----------------------------------------------------------
//	ポケモンパラメータ指定
//	pp = ポケモンパラメータのポインタ
//----------------------------------------------------------
void ListGaugeScreenSet2( u8 pos, u8 type, PokemonParam * pp )
{
	ListGaugeScreenSetParam(
		pos, type, PokeParaGet( pp, ID_hp ), PokeParaGet( pp, ID_hpmax ) );
}

void ListGaugeScreenSet( u8 pos, PokemonParam * pp )
{
	if( PokeParaGet( pp, ID_monsno ) == 0 )			return;
	if( PokeParaGet( pp, ID_tamago_flag ) != 0 )	return;

	if( MultiCheck() == TRUE )	ListGaugeScreenSet2( pos, 2, pp );
	else						ListGaugeScreenSet2( pos, FightCheck(), pp );
}
//----------------------------------------------------------
//	手持ちポケモンすべてのHPゲージ表示
//----------------------------------------------------------
void PokeListGaugeSetAll(void)
{
	u8 i;
	
	for( i=0; i<TEMOTI_POKEMAX; i++ )
		ListGaugeScreenSet(i, &PokeParaMine[i]);
}


//=========================================================================
//	手持ちﾎﾟｹﾓﾝのデータを入れかえる
//=========================================================================
void SwapPokemon( PokemonParam * pp1, PokemonParam * pp2 )
{
	PokemonParam temp;
	
	memcpy( &temp, pp1,   sizeof(PokemonParam) );
	memcpy( pp1,   pp2,   sizeof(PokemonParam) );
	memcpy( pp2,   &temp, sizeof(PokemonParam) );
}


//=========================================================================
//	メニューツール
//=========================================================================
//----------------------------------------------------------
//	ﾒﾆｭｰのﾀｲﾌﾟによってｳｨﾝﾄﾞｳの座標(始点X,Y)を取得
//----------------------------------------------------------
static void GetMenuWinPos(u8 menu_type, u8 *xpos, u8 *ypos, const MenuListData *pmd)
{
	u8 x_len, y_len;
	
	y_len = pmd[menu_type].menu_max * 2 + 2;
	x_len = pmd[menu_type].x_len + 1;
	*xpos = MENU_END_X - x_len;
	*ypos = MENU_END_Y - y_len;
}

//----------------------------------------------------------
//	メニューｳｨﾝﾄﾞｳ描画
//----------------------------------------------------------
void PokeListMenuWindowPut( u8 menu_type, const MenuListData * pmd,
							const MENU_ITEM * mi, u8 init_pos )
{
	u8 xpos, ypos;
	
	GetMenuWinPos(menu_type, &xpos, &ypos, pmd);
	MakeMenuWindow(xpos, ypos, pmd[menu_type].x_len,
		 pmd[menu_type].menu_max,
			mi, pmd[menu_type].menu_list);

	//ｶｰｿﾙ初期設定
	NMenuVCursorInit( xpos+1, ypos+1, pmd[menu_type].menu_max, init_pos );
}

//----------------------------------------------------------
//	ﾒﾆｭｰｳｨﾝﾄﾞｳ消去
//----------------------------------------------------------
void PokeListMenuWinClear(u8 menu_type, const MenuListData *pmd)
{
	u8 xpos, ypos;
	
	GetMenuWinPos(menu_type, &xpos, &ypos, pmd);
	NMenuBoxClear(xpos, ypos, xpos + pmd[menu_type].x_len, 
		ypos + pmd[menu_type].menu_max * 2 + 1);
}

//----------------------------------------------------------
//	ｶｰｿﾙ選択位置の関数をｺｰﾙする
//----------------------------------------------------------
pTaskFunc ListMenuCall(u8 menu_type, const MenuListData *pmd, const MENU_ITEM *mi, u8 pos)
{
	pTaskFunc ptask;
	
	ptask = mi[pmd[menu_type].menu_list[pos]].ptr;
	return ptask;
}




//=========================================================================
//	ﾒｯｾｰｼﾞｳｨﾝﾄﾞｳを出してﾒｯｾｰｼﾞを流す
// 引数: msg = ﾒｯｾｰｼﾞﾃﾞｰﾀへのｱﾄﾞﾚｽ    clear_flg = 0:ﾒｯｾｰｼﾞ自動ｸﾘｱ  1:ｸﾘｱｰなし
//=========================================================================
u8 PokeListScrMsgSet(const u8 msg[], u8 clear_flg)
{
	u8 id;
	
	ListMsgStatus = 1;
	NMenuWinBoxWrite( SCR_MSG_WINSX, SCR_MSG_WINSY, SCR_MSG_WINEX, SCR_MSG_WINEY );
	NMenuTalkMsgSet( msg, SCR_MSG_WINSX+1, SCR_MSG_WINSY+1 );
	id = AddTask(PokeScrMsgPut, 1);
	TaskTable[id].work[0] = clear_flg;
	return id;
}
//--  --//
static void PokeScrMsgPut(u8 id)
{
	if(NMenuTalkMsgPut())
	{
		ListMsgStatus = 0;
		if(TaskTable[id].work[0] == 0)
			NMenuBoxClear( SCR_MSG_WINSX, SCR_MSG_WINSY, SCR_MSG_WINEX, SCR_MSG_WINEY );
		DelTask(id);
	}
}



//=======================================================================================
//	アイテム関連
//=======================================================================================
//-------------------------------------
//		アイテム使用データを保存
//-------------------------------------
static void SetItemUseData( u8 id, u16 item, pTaskFunc returnAdrs )
{
	P_ITEM->returnAdrs = returnAdrs;
	P_ITEM->main_id    = id;
	P_ITEM->cursor     = GetNowCursorPos(id);
	P_ITEM->item       = item;
	P_ITEM->pp         = &PokeParaMine[ P_ITEM->cursor ];
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝに道具を持たせる(ﾒｰﾙ処理込み)
// 戻り値: 0 = 正常処理    1 = エラー
//----------------------------------------------------------
u8 PokeAddItem(PokemonParam *pp, u16 itemno)
{
	u8 buffer[2];
	u8 temp;
	
	if(MailItemNoCheck(itemno) == 1)
	{
		temp = PokeAddNewMail(pp, itemno);
		if(temp == 0xff)
			return 1;
		ListStatus = 2;
	}
	else
		ListStatus = 1;
	buffer[0] = itemno & 0xff;
	buffer[1] = itemno >> 8;
	PokeParaPut(pp, ID_item, buffer);
	return 0;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝに道具を持たせるときの処理(ﾒｯｾｰｼﾞ処理付)
// 引数:id = ﾒｲﾝﾀｽｸのID   itemno = 持たせるｱｲﾃﾑのﾅﾝﾊﾞｰ
//		returnAdrs = 処理が終了したらﾒｲﾝﾀｽｸのTaskAdrsにｾｯﾄされる
//
// 道具を持たせられたかどうかの結果がListStatusに入ります。
//	ListStatus = 0:持たせられなかった	1:ﾒｰﾙ以外のｱｲﾃﾑを持たせた   2:ﾒｰﾙを持たせた
//----------------------------------------------------------
void ListPokeAddItem( u8 id, u16 itemno, pTaskFunc returnAdrs )
{
	u16	pokeitem;

	TaskTable[id].TaskAdrs = DummyTaskSeq;
	SetItemUseData( id, itemno, returnAdrs );
	pokeitem = PokeParaGet( P_ITEM->pp, ID_item );
	ListStatus = 0;

	// すでに道具を持っている
	if( pokeitem != NON_ITEM ){

		// メールを持ってたとき
		if( MailItemNoCheck( pokeitem ) == 1 ){
			PokeListScrMsgSet( msg_poke_item00, 1 );
			AddTask( ScrMsgWait, 5 );
		// メール以外
		}else{
			PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
			GetItemName( pokeitem, StrTempBuffer1 );
			PM_MsgExpand( MsgExpandBuffer, msg_poke_item02 );
			PokeListScrMsgSet( MsgExpandBuffer, 1 );
			AddTask( ItemKoukanYesNoInit, 5 );
		}
		return;
	}

	PokeAddItem( P_ITEM->pp, itemno );
	SubItem( itemno, 1 );

	// 持たせる道具がメール
	if( MailItemNoCheck( itemno ) ){
		TaskTable[id].TaskAdrs = returnAdrs;
		return;
	}

	SetMotasetaMsg( P_ITEM->cursor, itemno, 1 );
	AddTask( ScrMsgWait, 5 );
}

static void ScrMsgWait( u8 id )
{
	if( ListMsgStatus == 0 ){
		ItemIconStatusSet( P_ITEM->main_id, P_ITEM->cursor );
		TaskTable[ P_ITEM->main_id ].TaskAdrs = P_ITEM->returnAdrs;
		DelTask(id);
	}
}

static void ItemKoukanYesNoMain( u8 id )
{
	s8	temp;
	u16 hold_itemno;
	
	temp = YesNoSelectMain();
	if( temp == CURSOR_YES_VALUE ){
		NMenuBoxClear( 23, 8, 29, 13 );
		hold_itemno = PokeParaGet( P_ITEM->pp, ID_item );
		SubItem( P_ITEM->item, 1 );
		if( AddItem( hold_itemno, 1 ) == TRUE ){
			PokeAddItem( P_ITEM->pp, P_ITEM->item );
			if( MailItemNoCheck( P_ITEM->item ) )
				SetAzukaruMsg( P_ITEM->cursor, hold_itemno, 1 );
			else{
				GetItemName( P_ITEM->item, StrTempBuffer0 );
				PM_MsgExpand( MsgExpandBuffer, msg_poke_item06 );
				PokeListScrMsgSet( MsgExpandBuffer, 1 );
			}
		}else{
			PokeListScrMsgSet( msg_poke_item09, 0 );
			AddItem( P_ITEM->item, 1 );
		}

		TaskTable[id].TaskAdrs = ScrMsgWait;
		return;
	}

	if( temp == CURSOR_NO_VALUE || temp == CURSOR_CANCEL_VALUE ){
		if( temp == CURSOR_CANCEL_VALUE )	SePlay(SE_SELECT);
		NMenuBoxClear( 23, 8, 29, 13 );
		TaskTable[id].TaskAdrs = ScrMsgWait;
	}
}

static void ItemKoukanYesNoInit( u8 id )
{
	if( ListMsgStatus == 0 ){
		YesNoSelectInit( 23, 8 );
		TaskTable[id].TaskAdrs = ItemKoukanYesNoMain;
	}
}

// "アイテムを持たせた"メッセージをセット
void SetMotasetaMsg( u8 poke, u16 item, u8 clear )
{
	PokeNickNameSet( &PokeParaMine[ poke ], StrTempBuffer0 );
	GetItemName( item, StrTempBuffer1 );
	PM_MsgExpand( MsgExpandBuffer, msg_poke_item01 );
	PokeListScrMsgSet( MsgExpandBuffer, clear );
}


//----------------------------------------------------------
//	メールボックスのメールをセット
//----------------------------------------------------------
void ListPokeAddMailBox( u8 id, pTaskFunc returnAdrs )
{
	u16	pokeitem;
	MAIL_DATA * mail;

	TaskTable[id].TaskAdrs = DummyTaskSeq;
	SetItemUseData( id, 0, returnAdrs );
	pokeitem = PokeParaGet( P_ITEM->pp, ID_item );
	ListStatus = 0;

	mail = &Fld.MailData[ MAIL_TEMOTI_STOCK + MYPC_SYS->scr + MYPC_SYS->pos ];

	// すでに道具を持っている
	if( pokeitem != NON_ITEM ){
		PokeListScrMsgSet( msg_poke_item07, 1 );
		AddTask( ScrMsgWait, 5 );
		return;
	}

	PokeAddWrittenMail( P_ITEM->pp, mail );
	MailDataInit( mail );

	PokeListScrMsgSet( msg_poke_item08, 1 );
	AddTask( ScrMsgWait, 5 );
}



//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが持ってる道具を預かるときの処理
// 引数:id = ﾒｲﾝﾀｽｸのID
//	returnAdrs = 処理が終了したらﾒｲﾝﾀｽｸのTaskAdrsにｾｯﾄされる
//----------------------------------------------------------
void ListPokeDecItem( u8 id, pTaskFunc returnAdrs )
{
	u8	buffer[2];
	u16 pokeitem;
	
	TaskTable[id].TaskAdrs = DummyTaskSeq;
	SetItemUseData( id, 0, returnAdrs );
	pokeitem = PokeParaGet( P_ITEM->pp, ID_item );

	if( pokeitem == NON_ITEM ){
		PM_MsgExpand( MsgExpandBuffer, msg_poke_item03 );
		PokeListScrMsgSet( MsgExpandBuffer, 0 );
		AddTask( ScrMsgWait, 5 );
	}else{
		buffer[0] = 0;	buffer[1] = 0;
		if( AddItem( pokeitem, 1 ) == TRUE ){
			if( MailItemNoCheck( pokeitem ) == 1 )	PokeDelMail( P_ITEM->pp );
			SetAzukaruMsg( P_ITEM->cursor, pokeitem, 0 );
			PokeParaPut( P_ITEM->pp, ID_item, buffer );
		}else
			PokeListScrMsgSet( msg_poke_item09, 0 );
		AddTask( ScrMsgWait, 5 );
	}
}

// "あずかる"メッセージをセット
static void SetAzukaruMsg( u8 poke, u16 item, u8 clear )
{
	PokeNickNameSet( &PokeParaMine[ poke ], StrTempBuffer0 );
	GetItemName( item, StrTempBuffer1 );
	PM_MsgExpand( MsgExpandBuffer, msg_poke_item04 );
	PokeListScrMsgSet( MsgExpandBuffer, clear );
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝが持ってるメールを取る時の処理
// 引数:id = ﾒｲﾝﾀｽｸのID
//	returnAdrs = 処理が終了したらﾒｲﾝﾀｽｸのTaskAdrsにｾｯﾄされる
//----------------------------------------------------------
void ListPokeDecMail( u8 id, pTaskFunc returnAdrs )
{
	TaskTable[id].TaskAdrs = DummyTaskSeq;
	SetItemUseData( id, 0, returnAdrs );
	P_ITEM->item = PokeParaGet( P_ITEM->pp, ID_item );
	PokeListScrMsgSet( msg_poke_pc_tensou00, 1 );
	AddTask( MailTensouYesNoInit, 5 );
}

static void MailDelYesNoMain( u8 id )
{
	s8 temp;
	
	temp = YesNoSelectMain();
	if( temp == CURSOR_YES_VALUE ){

		if( AddItem( P_ITEM->item, 1 ) == TRUE ){
			PokeDelMail( P_ITEM->pp );
			PokeListScrMsgSet( msg_poke_item05, 0 );
		}else
			PokeListScrMsgSet( msg_poke_item09, 0 );

		NMenuBoxClear( 23, 8, 29, 13 );
		TaskTable[id].TaskAdrs = ScrMsgWait;

		return;
	}

	if( temp == CURSOR_NO_VALUE || temp == CURSOR_CANCEL_VALUE ){
		if( temp == CURSOR_CANCEL_VALUE )	SePlay(SE_SELECT);
		NMenuBoxClear( 23, 8, 29, 13 );
		NMenuBoxClear( 0, 14, 29, 19 );
		TaskTable[id].TaskAdrs = ScrMsgWait;
	}
}

static void MailDelYesNoInit( u8 id )
{
	if( ListMsgStatus == 0 ){
		YesNoSelectInit( 23, 8 );
		TaskTable[id].TaskAdrs = MailDelYesNoMain;
	}
}

static void MailTensouYesNoMain( u8 id )
{
	s8	temp;
	
	temp = YesNoSelectMain();
	if( temp == CURSOR_YES_VALUE ){
		NMenuBoxClear( 23, 8, 29, 13 );
		if( MailTrans( P_ITEM->pp ) != 0xff )
			PokeListScrMsgSet( msg_poke_pc_tensou01, 0 );
		else
			PokeListScrMsgSet( msg_poke_pc_tensou02, 0 );
		TaskTable[id].TaskAdrs = ScrMsgWait;
		return;
	}

	if( temp == CURSOR_NO_VALUE || temp == CURSOR_CANCEL_VALUE ){
		if( temp == CURSOR_CANCEL_VALUE )	SePlay(SE_SELECT);
		NMenuBoxClear( 23, 8, 29, 13 );
		PokeListScrMsgSet( msg_poke_pc_tensou03, 1 );
		TaskTable[id].TaskAdrs = MailDelYesNoInit;
	}
}

static void MailTensouYesNoInit( u8 id )
{
	if(ListMsgStatus == 0){
		YesNoSelectInit( 23, 8 );
		TaskTable[id].TaskAdrs = MailTensouYesNoMain;
	}
}



//=======================================================================================
//									技マシン使用処理
//=======================================================================================
static void WazaMachinScrMsgWait( u8 id );
static void WazaMachinJingleWait( u8 id );

extern void ReturnNewWazaSet(void);
extern void NewWazaReturnBag(u8);
static void DelWazaSelectEnd2( u8 id );
extern u16	ReturnItemNo;

//-----------------------------------------------
//	技マシンで覚えられる技を取得
//-----------------------------------------------
u16 GetWazaNoItem( u16 itemno )
{
	itemno -= ITEM_WAZAMASIN01;
	return	MachineNo[itemno];
}

//-----------------------------------------------
//	技の2重登録チェック
//	戻り値 : 1 = すでに覚えている
//		     0 = 覚えていない
//-----------------------------------------------
u8 TemotiNijyuuCheck( PokemonParam * pp, u16 wazano )
{
	u8 i;
	
	for( i=0; i<4; i++ ){
		if( PokeParaGet( pp, ID_waza1+i ) == wazano )
			return	1;
	}
	return	0;
}

//----------------------------------------------------------
//	技マシンを使用
//	引数 : id         = メインタスクのID
//		   itemno     = アイテム番号
//		   returnAdrs = 処理終了後メインタスクにセット
//----------------------------------------------------------
void ListPokeWazaSet( u8 id, u16 itemno, pTaskFunc returnAdrs )
{
	SePlay( SE_SELECT );
	TaskTable[id].TaskAdrs = DummyTaskSeq;
	SetItemUseData( id, itemno, returnAdrs );
	AddTask( ListPokeWazaSet2, 5 );
}

static void ListPokeWazaSet2( u8 id )
{
	PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
	P_ITEM->new_waza = GetWazaNoItem( P_ITEM->item );
	PM_strcpy( StrTempBuffer1, WazaNameData[ P_ITEM->new_waza ] );

	P_LIST->work[15] = 0;

	// 同じ技あり
	if( TemotiNijyuuCheck( P_ITEM->pp, P_ITEM->new_waza ) ){
		PM_MsgExpand( MsgExpandBuffer, msg_poke_waza07 );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );
		TaskTable[id].TaskAdrs = ScrMsgWait;
		return;
	}

	// 相性が悪い
#ifdef	PM_DEBUG
	if( DebugMainFlag == 0 &&
		PokeWazaMachineCheck( P_ITEM->pp, P_ITEM->item-ITEM_SKILL_START ) == 0 )
	{
		PM_MsgExpand( MsgExpandBuffer, msg_poke_waza01 );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );
		TaskTable[id].TaskAdrs = ScrMsgWait;
		return;
	}
#else
	if( PokeWazaMachineCheck( P_ITEM->pp, P_ITEM->item-ITEM_SKILL_START ) == 0 ){
		PM_MsgExpand( MsgExpandBuffer, msg_poke_waza01 );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );
		TaskTable[id].TaskAdrs = ScrMsgWait;
		return;
	}
#endif	PM_DEBUG

	// 技を覚えた
	if( PokeWazaSet( P_ITEM->pp, P_ITEM->new_waza ) != 0xffff ){
		WazaOboetaSeq(id);
		return;
	}

	// 技がいっぱい
	PM_MsgExpand( MsgExpandBuffer, msg_poke_waza02 );
	PokeListScrMsgSet( MsgExpandBuffer, 1 );
	TaskTable[id].TaskAdrs = WazaKoukanYesNoInit;//ScrMsgWait;
}

//-----------------------------------------------
//	技を覚えた
//-----------------------------------------------
static void WazaOboetaSeq( u8 id )
{
	PM_strcpy( StrTempBuffer1, WazaNameData[ P_ITEM->new_waza ] );
	PM_MsgExpand( MsgExpandBuffer, msg_poke_waza00 );
	PokeListScrMsgSet( MsgExpandBuffer, 1 );

	FriendCalc( P_ITEM->pp, FRIEND_WAZA_MACHINE );

	if( P_LIST->work[15] == 0 &&
		P_ITEM->item < ITEM_HIDENMASIN01 )
	{
		SubItem( P_ITEM->item, 1 );
	}

	TaskTable[id].TaskAdrs = WazaMachinScrMsgWait;
}
// メッセージ終了待ち
static void WazaMachinScrMsgWait( u8 id )
{
	if( ListMsgStatus == 0 ){
		JinglePlay( MUS_FANFA1 );
		TaskTable[id].TaskAdrs = WazaMachinJingleWait;
	}
}
// ジングル終了待ち
static void WazaMachinJingleWait( u8 id )
{
	if( JingleWait() == 0 )		return;

	if( ( sys.Trg & A_BUTTON ) || ( sys.Trg & B_BUTTON ) ){
		ItemIconStatusSet( P_ITEM->main_id, P_ITEM->cursor );

		if( P_LIST->work[15] == 1 ){
			WazaOboeNextCheck(id);
			return;
		}

		TaskTable[ P_ITEM->main_id ].TaskAdrs = P_ITEM->returnAdrs;
		DelTask(id);
	}
}

static void ScrWazaOboeMsgWait( u8 id )
{
	if( ListMsgStatus == 0 ){
		ItemIconStatusSet( P_ITEM->main_id, P_ITEM->cursor );

		if( P_LIST->work[15] == 1 ){
			WazaOboeNextCheck(id);
			return;
		}

		TaskTable[ P_ITEM->main_id ].TaskAdrs = P_ITEM->returnAdrs;
		DelTask(id);
	}
}

//-----------------------------------------------
//	技を忘れて新しい技を覚えるか
//-----------------------------------------------
static void WazaKoukanYesNoInit( u8 id )
{
	if( ListMsgStatus == 0 ){
		YesNoSelectInit( 23, 8 );
		TaskTable[id].TaskAdrs = WazaKoukanYesNoMain;
	}
}

static void WazaKoukanYesNoMain( u8 id )
{
	s8 temp;
	
	temp = YesNoSelectMain();
	if( temp == CURSOR_YES_VALUE ){
		NMenuBoxClear( 23, 8, 29, 13 );
		PokeListScrMsgSet( msg_poke_waza05, 1 );
		TaskTable[id].TaskAdrs = DelWazaSelectInit;
		return;
	}

	if( temp == CURSOR_NO_VALUE || temp == CURSOR_CANCEL_VALUE ){
		if( temp == CURSOR_CANCEL_VALUE )	SePlay(SE_SELECT);
		WazaAkirameSelectSeq(id);
	}
}

//-----------------------------------------------
//	ステータス画面へ
//-----------------------------------------------
static void NewWazaSetFade( u8 id )
{
	if( FadeData.fade_sw == 0 ){
		PokeNewWazaSet( PokeParaMine, P_ITEM->cursor,
						PokeCountMine-1, ReturnNewWazaSet, P_ITEM->new_waza );
		DelTask(id);
	}
}

static void DelWazaSelectInit( u8 id )
{
	if( ListMsgStatus == 0 ){
//		LightFadeReq( N_to_B );
		PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
		TaskTable[id].TaskAdrs = NewWazaSetFade;
	}
}

//-----------------------------------------------
//	ステータス画面から復帰
//-----------------------------------------------
// 忘れる技が選択された
void WazaDelSet2( u8 id )
{
	u8	pos;
	u16	waza;

	if( FadeData.fade_sw != 0 )	return;
	
	TaskTable[id].TaskAdrs = DummyTaskSeq;
	SetItemUseData( id, ReturnItemNo, NewWazaReturnBag );
	
	pos  = GetNewWazaSelectPos();
	waza = PokeParaGet( P_ITEM->pp, ID_waza1 + pos );

	PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
	PM_strcpy( StrTempBuffer1, WazaNameData[waza] );
	PM_MsgExpand( MsgExpandBuffer, msg_poke_waza06 );
	PokeListScrMsgSet( MsgExpandBuffer, 1 );
	AddTask( DelWazaSelectEnd2, 5 );
}
// 新しい技をセット
static void DelWazaSelectEnd2( u8 id )
{
	if( ListMsgStatus == 0 ){
		PokePPCountClear( P_ITEM->pp, GetNewWazaSelectPos() );
		PokeWazaSetPos( P_ITEM->pp, P_ITEM->new_waza, GetNewWazaSelectPos() );
		WazaOboetaSeq(id);
	}
}

// 忘れる技が選択されていない
void WazaAkirameSelectSeq2( u8 id )
{
	if( FadeData.fade_sw != 0 )	return;
	
	TaskTable[id].TaskAdrs = DummyTaskSeq;
	SetItemUseData( id, ReturnItemNo, NewWazaReturnBag );
	
	PM_strcpy( StrTempBuffer1, WazaNameData[ P_ITEM->new_waza ] );
	PM_MsgExpand( MsgExpandBuffer, msg_poke_waza03 );
	PokeListScrMsgSet( MsgExpandBuffer, 1 );
	AddTask( WazaAkirameYesNoInit, 5 );
}

//-----------------------------------------------
//	技を覚えるのをあきらめる
//-----------------------------------------------
// メッセージ表示
static void WazaAkirameSelectSeq( u8 id )
{
	NMenuBoxClear( 23, 8, 29, 13 );
	PM_strcpy( StrTempBuffer1, WazaNameData[ P_ITEM->new_waza ] );
	PM_MsgExpand( MsgExpandBuffer, msg_poke_waza03 );
	PokeListScrMsgSet( MsgExpandBuffer, 1 );
	TaskTable[id].TaskAdrs = WazaAkirameYesNoInit;
}
// はい/いいえセット
static void WazaAkirameYesNoInit( u8 id )
{
	if( ListMsgStatus == 0 ){
		YesNoSelectInit( 23, 8 );
		TaskTable[id].TaskAdrs = WazaAkirameYesNoMain;
	}
}
// はい/いいえ処理
static void WazaAkirameYesNoMain( u8 id )
{
	s8	temp;
	
	temp = YesNoSelectMain();
	if( temp == CURSOR_YES_VALUE ){
		NMenuBoxClear( 23, 8, 29, 13 );
		PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
		PM_strcpy( StrTempBuffer1, WazaNameData[ P_ITEM->new_waza ] );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_waza04 );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );

		TaskTable[id].TaskAdrs = ScrWazaOboeMsgWait;
		return;
	}

	if( temp == CURSOR_NO_VALUE || temp == CURSOR_CANCEL_VALUE ){
		if( temp == CURSOR_CANCEL_VALUE )	SePlay(SE_SELECT);
		NMenuBoxClear( 23, 8, 29, 13 );
		PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
		PM_strcpy( StrTempBuffer1, WazaNameData[ P_ITEM->new_waza ] );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_waza02 );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );
		TaskTable[id].TaskAdrs = WazaKoukanYesNoInit;
	}
}

//-----------------------------------------------
//	選択された技が秘伝技かどうか
//-----------------------------------------------
u8 DelWazaHidenCheck( u16 waza )
{
	u8	i;

	for( i=0; i<8; i++ ){
		if( MachineNo[50+i] == waza )
			return	TRUE;
	}
	return	FALSE;
}


//=======================================================================================
//									ステータス回復
//=======================================================================================
extern u8 * ItemPokeParmTbl[];

//-----------------------------------------------
//	HPゲージをセット
//-----------------------------------------------
static s16 HPRecoverGaugeSet( u8 id, GaugeDataBG * data, s8 flg )
{
	u32   trans_pos;
	u8    color;

	s16 * wk = TaskTable[id].work;

	data->MaxHP  = wk[ I_TEMP0 ];
	data->NowHP  = wk[ I_TEMP1 ];
	data->beHP   = wk[ I_TEMP2 ] * flg;
	data->CharNo = LISTGAUGE_TOPCHRNO;

	color = GetGaugeDottoColor( P_LIST->work[15], data->MaxHP );
	if( color >= 3 )	data->color = HP_GAUGE_G_PAL;
	if( color == 2 )	data->color = HP_GAUGE_Y_PAL;
	if( color <= 1 )	data->color = HP_GAUGE_R_PAL;

	trans_pos    = GaugeDefaultPos[ FightCheck() ][ P_ITEM->cursor ];

	return	GaugeBG( data, &P_ITEM->gauge_work, (void *)trans_pos, 0 );
}

//-----------------------------------------------
//	HPゲージを回復する
//-----------------------------------------------
static void LifeGaugeUpMain( u8 id )
{
	GaugeDataBG gdata;
	u16 kaifuku_hp;
	u8	xpos, ypos;

	P_LIST->work[15] = HPRecoverGaugeSet( id, &gdata, -1 );

	if( P_LIST->work[15] == -1 ){

		P_ITEM->gauge_work = 0;	//2002.09.14(土) by matsuda
		
		if( -gdata.beHP + gdata.NowHP > gdata.MaxHP )
			kaifuku_hp = gdata.MaxHP - gdata.NowHP;
		else
			kaifuku_hp = -gdata.beHP;

		WazaDamage = -kaifuku_hp;	//戦闘でこの値を見てPSPの値を変えるので
		
		PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
		PM_NumMsgSet( StrTempBuffer1, kaifuku_hp, NUM_MODE_LEFT, 3 );

		// 2002/02/19 by nakahiro
		if( TaskTable[id].work[I_TEMP4] == 0 )
			PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv00 );
		else	PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv07 );

		PokeIconAnmSet( GetPataChrActNo( P_ITEM->main_id, P_ITEM->cursor ), P_ITEM->pp );
		PokeCardColorChange(
			&PokeCardPos[ FightCheck() * 12 + P_ITEM->cursor * 2 ],
			CARD_B_PAL+CARD_FLASH_PAL );
		P_LIST->card_flg = 2;

		PokeListScrMsgSet( MsgExpandBuffer, 1 );
		kaifuku_hp += gdata.NowHP;
		PokeParaPut( P_ITEM->pp, ID_hp, (u8*)&kaifuku_hp );
		SubItem( P_ITEM->item, 1 );
		
		PinchSeCheckStop();	// add by matsuda 2002.07.17(水)
	
		TaskTable[id].TaskAdrs = LifeScrMsgWait2;
	}else{
		xpos = HpDefaultPos[ FightCheck() ][ P_ITEM->cursor ].x;
		ypos = HpDefaultPos[ FightCheck() ][ P_ITEM->cursor ].y;
		PokeListNumberPut( P_LIST->work[15], P_HP_TRANS_CHARNO+P_ITEM->cursor * P_KETA, 1, xpos, ypos);
	}
}

//-----------------------------------------------
//	HPゲージを減らす
//-----------------------------------------------
void LifeGaugeDownMain( u8 id )
{
	GaugeDataBG gdata;
	u8	xpos, ypos;

	P_LIST->work[15] = HPRecoverGaugeSet( id, &gdata, 1 );

	if( P_LIST->work[15] == -1 ){
		SePlay( SE_KAIFUKU );

		P_ITEM->gauge_work = 0;	//2002.09.14(土) by matsuda

		TaskTable[id].work[I_TEMP1] -= TaskTable[id].work[I_TEMP2];
		PokeParaPut( P_ITEM->pp, ID_hp, (u8*)&TaskTable[id].work[I_TEMP1] );

		PokeIconAnmSet( GetPataChrActNo( P_ITEM->main_id, P_CARD->cur[0] ), P_ITEM->pp );

		P_ITEM->cursor = ActWork[ P_CARD->cur[1] ].work[0];
		P_ITEM->pp     = &PokeParaMine[P_ITEM->cursor];

		TaskTable[id].work[I_TEMP0] = PokeParaGet( P_ITEM->pp, ID_hpmax );
		TaskTable[id].work[I_TEMP1] = PokeParaGet( P_ITEM->pp, ID_hp );

		P_ITEM->gauge_work = HP_WORK_INIT_VALUE;	// TYPE
//		TaskTable[id].work[I_TEMP3] = HP_WORK_INIT_VALUE;	// TYPE

		P_ITEM->SubReturn = P_ITEM->returnAdrs;
		TaskTable[id].TaskAdrs = LifeGaugeUpMain;
//		P_LIST->work[15] = 0;
		P_LIST->work[15] = TaskTable[id].work[I_TEMP1];
	}else{
		xpos = HpDefaultPos[ FightCheck() ][ P_ITEM->cursor ].x;
		ypos = HpDefaultPos[ FightCheck() ][ P_ITEM->cursor ].y;
		PokeListNumberPut( P_LIST->work[15], P_HP_TRANS_CHARNO+P_ITEM->cursor * P_KETA, 1, xpos, ypos);
	}
}

//-----------------------------------------------
//	メッセージ終了を待ってメインへ復帰
//-----------------------------------------------
static void LifeScrMsgWait( u8 id )
{
	if( ListMsgStatus )	return;

	TaskTable[ P_ITEM->main_id ].TaskAdrs = P_ITEM->returnAdrs;
	DelTask(id);
}

// HPゲージ用
static void LifeScrMsgWait2( u8 id )
{
	if( ListMsgStatus )	return;

	TaskTable[ P_ITEM->main_id ].TaskAdrs = P_ITEM->SubReturn;
	DelTask(id);
}

//-----------------------------------------------
//	HPが回復するか
//-----------------------------------------------
static u8 LifeRecoverItemCheck2( u16 itemno )
{
	u8 * param;

	if( itemno == ITEM_NAZONOMI )	param = (u8 *)&Fld.RamSeed.item_param;
	else		param = ItemPokeParmTbl[ itemno - ITEM_NORMAL_START ];

	if( ( param[4] &  0x04 ) != 0 )	return	1;
	return	0;
}

//-----------------------------------------------
//	瀕死回復時のLv再表示
//-----------------------------------------------
static void StRecoverLvPut( PokemonParam * pp, u8 pos )
{
	PokeConditionDelCardMoji( pos );
	ListPokeLvPut( pos, pp );
}

//-----------------------------------------------
//	アイテムごとにメッセージをセット
//-----------------------------------------------
static void SetStatusRecoverMsg( u16 itemno )
{
	switch( ItemRecoverCheck( itemno ) ){
	case ITEM_TYPE_DOKU_RCV:	// 毒回復
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv01 );
		break;
	case ITEM_TYPE_NEMURI_RCV:	// 眠り回復
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv03 );
		break;
	case ITEM_TYPE_YAKEDO_RCV:	// 火傷回復
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv04 );
		break;
	case ITEM_TYPE_KOORI_RCV:	// 氷回復
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv05 );
		break;
	case ITEM_TYPE_MAHI_RCV:	// 麻痺回復
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv02 );
		break;

	case ITEM_TYPE_KONRAN_RCV:	// 混乱回復
		PM_MsgExpand( MsgExpandBuffer, msg_konran_rcv );
		break;
	case ITEM_TYPE_MEROMERO_RCV:	// メロメロ回復
		PM_MsgExpand( MsgExpandBuffer, msg_meromero_rcv );
		break;
	case ITEM_TYPE_ALL_ST_RCV:	// ステータス異常全快
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv08 );
		break;
	case ITEM_TYPE_HP_UP:		// ドーピングアイテム HP努力値UP
		PM_strcpy( StrTempBuffer1, str_tairyoku );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv11 );
		break;
	case ITEM_TYPE_ATC_UP:		// ドーピングアイテム 攻撃努力値UP
		PM_strcpy( StrTempBuffer1, str_pst_kougeki );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv11 );
		break;
	case ITEM_TYPE_DEF_UP:		// ドーピングアイテム 防御努力値UP
		PM_strcpy( StrTempBuffer1, str_pst_bougyo );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv11 );
		break;
	case ITEM_TYPE_AGL_UP:		// ドーピングアイテム 素早さ努力値UP
		PM_strcpy( StrTempBuffer1, str_pst_subayasa );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv11 );
		break;
	case ITEM_TYPE_SPA_UP:		// ドーピングアイテム 特攻努力値UP
		PM_strcpy( StrTempBuffer1, str_tokusyukougeki );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv11 );
		break;
	case ITEM_TYPE_SPD_UP:		// ドーピングアイテム 特防努力値UP
		PM_strcpy( StrTempBuffer1, str_tokusyubougyo );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv11 );
		break;
	case ITEM_TYPE_PP_UP:		// PPUp
	case ITEM_TYPE_PP_3UP:		// PP3Up
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv09 );
		break;
	case ITEM_TYPE_PP_RCV:		// PP回復
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv06 );
		break;
	default:
		PM_MsgExpand( MsgExpandBuffer, msg_poke_use_error00 );
	}
}

//-----------------------------------------------
//	ヌケニンのチェック
//-----------------------------------------------
static u8 StRcvItem_NUKENIN_Check( PokemonParam * pp, u16 item )
{
	if( ItemRecoverCheck( item ) != ITEM_TYPE_HP_UP )		return	FALSE;
	if( PokeParaGet( pp, ID_monsno ) != MONSNO_NUKENIN )	return	FALSE;
	return	TRUE;
}

//-----------------------------------------------
//	StatusRecoverをセット
//-----------------------------------------------
u8 SetStatusRecover( u8 cur, u16 item, u8 menu )
{
	if(sys.FieldBattleFlag == 1)	// 戦闘
		return	StatusRecover( &PokeParaMine[cur], item, GetListRow(cur), menu );
	return	StatusRecover( &PokeParaMine[cur], item, cur, menu );
}

//-----------------------------------------------------------------------
//	ステータス変動アイテムを使用
//	引数 : id         = メインタスクのID
//		   itemno     = アイテム番号
//		   returnAdrs = 処理終了後メインタスクにセット
//  
//	ListStatus：ｱｲﾃﾑが使用出来た場合 = 1;	使用出来なかった場合 = 0
//-----------------------------------------------------------------------
void PokeListStatusRecover( u8 id, u16 itemno, pTaskFunc returnAdrs )
{
	u8	newtask;
	u8	temp = 0, temp2 = 0;
	
	TaskTable[id].TaskAdrs = DummyTaskSeq;
	
	newtask = AddTask( DummyTaskSeq, 5 );

	SetItemUseData( id, itemno, returnAdrs );

	if( StRcvItem_NUKENIN_Check( P_ITEM->pp, itemno ) == FALSE ){

		temp2 = LifeRecoverItemCheck2( itemno );

		if( temp2 == 1 ){
			TaskTable[newtask].work[I_TEMP0] = PokeParaGet( P_ITEM->pp, ID_hpmax );
			TaskTable[newtask].work[I_TEMP1] = PokeParaGet( P_ITEM->pp, ID_hp );
			if( TaskTable[newtask].work[I_TEMP0] == TaskTable[newtask].work[I_TEMP1] ){
				temp2 = 0;
				TaskTable[newtask].work[I_TEMP0] = 0;
				TaskTable[newtask].work[I_TEMP1] = 0;
			}
		}

		temp = SetStatusRecover( P_ITEM->cursor, itemno, 0 );

	}else	temp = 1;

	if( temp != 0 ){
		ListStatus = 0;
		SePlay(SE_SELECT);
		PokeListScrMsgSet( msg_poke_use_error00, 1 );
		TaskTable[newtask].TaskAdrs = LifeScrMsgWait;
	}else{
		ListStatus = 1;

		if( VidoroCheck( itemno ) == FALSE )
			SePlay( SE_KAIFUKU );
		else
			SePlay( SE_BIDORO );

		// 状態異常チェック
		temp = GetPokeCondition( P_ITEM->pp );
		if( temp == ST_POKERUS || temp == ST_NORMAL )
			StRecoverLvPut( P_ITEM->pp, P_ITEM->cursor );

		if( temp2 == 1 ){
			TaskTable[newtask].work[I_TEMP2] =
				PokeParaGet( P_ITEM->pp, ID_hp ) - TaskTable[newtask].work[I_TEMP1];
			P_ITEM->gauge_work = HP_WORK_INIT_VALUE;	// TYPE
//			TaskTable[newtask].work[I_TEMP3] = HP_WORK_INIT_VALUE;
			if( TaskTable[newtask].work[I_TEMP1] == 0 )
				TaskTable[newtask].work[I_TEMP4] = 1;
			else	TaskTable[newtask].work[I_TEMP4] = 0;
			P_ITEM->SubReturn = P_ITEM->returnAdrs;
			TaskTable[newtask].TaskAdrs = LifeGaugeUpMain;
//			P_LIST->work[15] = 0;
			P_LIST->work[15] = TaskTable[newtask].work[I_TEMP1];
			return;
		}

		PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );

		if( VidoroCheck( itemno ) == FALSE )	SubItem( itemno, 1 );

		SetStatusRecoverMsg( itemno );

		PokeListScrMsgSet( MsgExpandBuffer, 1 );

		ListPokeNamePut( P_ITEM->cursor, P_ITEM->pp );

		TaskTable[newtask].TaskAdrs = LifeScrMsgWait;
	}
}

//----------------------------------------
//	ビードロチェック
//----------------------------------------
static u8 VidoroCheck( u16 item )
{
	if( item == ITEM_AOIBIIDORO ||
		item == ITEM_AKAIBIIDORO ||
		item == ITEM_KIIROBIIDORO )
	{
		return	TRUE;
	}
	return	FALSE;
}


//-----------------------------------------------------------------------
//	全員瀕死回復アイテムを使用
//	引数 : id         = メインタスクのID
//		   itemno     = アイテム番号
//		   returnAdrs = 処理終了後メインタスクにセット
//  
//	ListStatus：ｱｲﾃﾑが使用出来た場合 = 1;	使用出来なかった場合 = 0
//-----------------------------------------------------------------------
static void PokeAllDethRcvMain( u8 id );
static void PokeAllDethRcvNext( u8 id );

void PokeListAllDethRecover( u8 id, u16 item, pTaskFunc returnAdrs )
{
	P_ITEM->returnAdrs = returnAdrs;
	P_ITEM->main_id    = id;
	P_ITEM->item       = item;
	P_ITEM->cursor     = 0;
	P_ITEM->SubReturn  = PokeAllDethRcvNext;

	P_LIST->work[13] = 0;
	P_LIST->work[14] = 0;

	PokeAllDethRcvMain(id);
}

static void PokeAllDethRcvMain( u8 id )
{
	u8    newtask;
	u8    temp;
	s16	* wk;

	TaskTable[id].TaskAdrs = DummyTaskSeq;

	if( PokeParaGet( &PokeParaMine[ P_ITEM->cursor ], ID_monsno ) == 0 ){
		TaskTable[id].TaskAdrs = PokeAllDethRcvNext;
		return;
	}

	newtask = AddTask( DummyTaskSeq, 5 );

	wk = TaskTable[newtask].work;

	P_ITEM->pp = &PokeParaMine[ P_ITEM->cursor ];

	wk[I_TEMP0] = PokeParaGet( P_ITEM->pp, ID_hpmax );
	wk[I_TEMP1] = PokeParaGet( P_ITEM->pp, ID_hp );

	temp = SetStatusRecover( P_ITEM->cursor, P_ITEM->item, 0 );

	if( temp != 0 ){
		DelTask( newtask );
		TaskTable[id].TaskAdrs = PokeAllDethRcvNext;
	}else{
		ListStatus = 1;
		NMenuBoxClear( SCR_MSG_WINSX, SCR_MSG_WINSY, SCR_MSG_WINEX, SCR_MSG_WINEY );
		SePlay( SE_KAIFUKU );

		StRecoverLvPut( P_ITEM->pp, P_ITEM->cursor );

		PokeCardColorChange(
			&PokeCardPos[ FightCheck() * 12 + P_ITEM->cursor * 2 ],
			CARD_R_PAL+CARD_FLASH_PAL );
		P_LIST->card_flg = 2;

		wk[I_TEMP2] = PokeParaGet( P_ITEM->pp ,ID_hp ) - wk[I_TEMP1];
//		wk[I_TEMP3] = HP_WORK_INIT_VALUE;
		wk[I_TEMP4] = 1;
		P_LIST->work[13] = 1;	// アイテム使用
		P_LIST->work[14] = 1;	// 回復した
//		P_LIST->work[15] = 0;
		P_LIST->work[15] = wk[I_TEMP1];
		P_ITEM->gauge_work = HP_WORK_INIT_VALUE;	// TYPE
		TaskTable[newtask].TaskAdrs = LifeGaugeUpMain;
	}
}

static void PokeAllDethRcvNext( u8 id )
{
	if( P_LIST->work[13] == 1 ){
		AddItem( P_ITEM->item, 1 );

		if( PokeParaGet( &PokeParaMine[ P_ITEM->cursor ], ID_monsno ) != 0 ){
			PokeCardColorChange(
				&PokeCardPos[ FightCheck() * 12 + P_ITEM->cursor * 2 ],
				CARD_B_PAL );
			P_LIST->card_flg = 2;
		}

		P_LIST->work[13] = 0;
	}

	P_ITEM->cursor += 1;

	if( P_ITEM->cursor == TEMOTI_POKEMAX ){
		ListStatus = 0;
		if( P_LIST->work[14] == 0 ){
			TaskTable[id].TaskAdrs = DummyTaskSeq;
			PokeListScrMsgSet( msg_poke_use_error00, 1 );
			AddTask( LifeScrMsgWait, 8 );
		}else{
			SubItem( P_ITEM->item, 1 );
			TaskTable[id].TaskAdrs = P_ITEM->returnAdrs;
		}
		FPokeNo = 0;
		return;
	}

	PokeAllDethRcvMain(id);
}


//=========================================================================================
//		PP回復処理	2002/02/14 by nakahiro
//=========================================================================================
extern void FieldBagPokeListTask(u8);
extern void BattlePokeListMain(u8);
static void PokeListPPRecover(u8);

//-----------------------------------------------
//	わざウィンドウ表示
//-----------------------------------------------
static void DrawWazaSelectWin( u8 no )
{
	u8	i,j=0;
	u16	waza;

	NMenuWinBoxWrite( 20, 10, 29, 19 );
	for( i=0; i<4; i++ ){
		waza = PokeParaGet( &PokeParaMine[no], ID_waza1+i );
		NMenuMsgWrite( WazaNameData[ waza ], 22, 11+(i<<1) );
		if( waza != 0 )	j++;
	}
	NMenuVCursorInit( 21, 11, j, 0 );
}

//-----------------------------------------------
//	技選択
//-----------------------------------------------
static void WazaSelectMain( u8 id )
{
	if( sys.Trg & U_KEY ){
		SePlay( SE_SELECT );
		NMenuVCursorSet( -1 );
		return;
	}
	if( sys.Trg & D_KEY ){
		SePlay( SE_SELECT );
		NMenuVCursorSet( 1 );
		return;
	}
	if( sys.Trg & A_BUTTON ){
//		SePlay( SE_SELECT );
		waza_select.set_func(id);
		return;
	}
	if( sys.Trg & B_BUTTON ){
		SePlay( SE_SELECT );
		waza_select.cancel_func(id);
	}
}


// 初期設定
void PPRecoverInit( u8 id, u16 itemno, pTaskFunc returnAdrs )
{
	u8   newtask;
	u8 * param;

	if( itemno == ITEM_NAZONOMI )	param = (u8 *)&Fld.RamSeed.item_param;
	else		param = ItemPokeParmTbl[ itemno - ITEM_NORMAL_START ];

	TaskTable[id].TaskAdrs = DummyTaskSeq;

	newtask = AddTask( DummyTaskSeq, 5 );

	SetItemUseData( id, itemno, returnAdrs );

	// すべての技
	if( ( param[4] & 0x10 ) == 0 ){
		TaskTable[newtask].work[I_TEMP1] = 0;
		PokeListPPRecover( newtask );
	}else{
		SePlay( SE_SELECT );
//		PokeListWinClear2();
		PokeListWinFixMsgPut2( WAZARECOVER_MSG, 1 );
		DrawWazaSelectWin( P_ITEM->cursor );
		TaskTable[ newtask ].TaskAdrs = WazaSelectMain;
		sys.Trg = 0;	// ?
	}
}

// 回復する技が選択された
static void WazaPPRecoverSet( u8 id )
{
	NMenuBoxClear( 19, 10, 29, 19 );
	PokeListWinClear2();
	TaskTable[id].work[I_TEMP1] = NMenuVCursorPosGet();
	PokeListPPRecover(id);
}

// キャンセル
static void WazaPPRecoverCancel( u8 id )
{
	NMenuBoxClear( 19, 10, 29, 19 );
	if(sys.FieldBattleFlag == 1)	// 戦闘
		TaskTable[ P_ITEM->main_id ].TaskAdrs = BattlePokeListMain;
	else							// フィールド
		TaskTable[ P_ITEM->main_id ].TaskAdrs = FieldBagPokeListTask;
	PokeListWinFixMsgPut2( TUKAIMASUKA_MSG, 0 );
	DelTask(id);
}

// 回復処理
static void PokeListPPRecover( u8 id )
{
	u8	temp;
	u16	waza=0;

	temp = SetStatusRecover(
				P_ITEM->cursor,
				P_ITEM->item,
				(u8)TaskTable[id].work[I_TEMP1] );

	if( temp != 0 ){
		ListStatus = 0;
		SePlay( SE_SELECT );
		PokeListScrMsgSet( msg_poke_use_error00, 1 );
	}else{
		ListStatus = 1;
		SePlay( SE_KAIFUKU );
		SubItem( P_ITEM->item, 1 );
		waza = PokeParaGet(
					P_ITEM->pp,
					ID_waza1+TaskTable[id].work[I_TEMP1]	);
		PM_strcpy( StrTempBuffer0, WazaNameData[waza] );
		SetStatusRecoverMsg( P_ITEM->item );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );
	}

	TaskTable[id].TaskAdrs = LifeScrMsgWait;
}

//=========================================================================================
//		わざポイントアップ	2002/02/15 by nakahiro
//=========================================================================================
void WazaPointUpInit( u8 id, u16 itemno, pTaskFunc returnAdrs )
{
	TaskTable[id].TaskAdrs = DummyTaskSeq;
	SetItemUseData( id, itemno, returnAdrs );

	SePlay( SE_SELECT );
//	PokeListWinClear2();
	PokeListWinFixMsgPut2( WAZAPOINTUP_MSG, 1 );
	DrawWazaSelectWin( P_ITEM->cursor );
	AddTask( WazaSelectMain, 5 );
	sys.Trg = 0;	// ?
}


//=========================================================================================
//		ふしぎなアメ	2002/02/20 by nakahiro
//=========================================================================================
#define	PARAM_WIN_SX	11
#define	PARAM_WIN_SY	0
#define	PARAM_WIN_EX	( PARAM_WIN_SX + 18 )
#define	PARAM_WIN_EY	( PARAM_WIN_SY + 7 )

enum{
	WK_MHP = 0,		// 最大HP
	WK_POW,			// 攻撃
	WK_DEF,			// 防御
	WK_SPP,			// 特攻
	WK_SPD,			// 特防
	WK_AGL,			// 素早さ

	WK_MHP2,		// 最大HP
	WK_POW2,		// 攻撃
	WK_DEF2,		// 防御
	WK_SPP2,		// 特攻
	WK_SPD2,		// 特防
	WK_AGL2,		// 素早さ
};

extern void FieldMenuBagInit(void);

static void LvUpScrMsgWait(u8);
static void LvUpParamSet(u8,PokemonParam *);
static void StatusWinWait(u8);
static void LvUpEnd(u8);
static void DrawStPlusWindow( u8 id );
static void DrawNewStWindow( u8 id );
static void StatusPlusWinWait( u8 id );



static const u8 * const str_param[] = {
	str_pst_HP,			// HP
	str_pst_kougeki,	// こうげき
	str_pst_bougyo,		// ぼうぎょ
	str_pst_tokukou,	// とくこう
	str_pst_tokubou,	// とくぼう
	str_pst_subayasa	// すばやさ
};
static const u8 param_ID[] = {
	ID_hpmax,
	ID_pow,
	ID_def,
	ID_spepow,
	ID_spedef,
	ID_agi
};


// 初期処理
void PokeListLvUpInit(  u8 id, u16 itemno, pTaskFunc returnAdrs )
{
	u8	temp;
	u8	Lv;
	u8	i;

	TaskTable[id].TaskAdrs = DummyTaskSeq;
	
	SetItemUseData( id, itemno, returnAdrs );

	if( PokeParaGet( P_ITEM->pp, ID_level ) != 100 ){
		for( i=0; i<6; i++ )
			P_LIST->work[ WK_MHP + i ] = PokeParaGet( P_ITEM->pp, param_ID[i] );

		temp = SetStatusRecover( P_ITEM->cursor, itemno, 0 );
	}else	temp = 1;

	if( temp != 0 ){
		ListStatus = 0;
		SePlay( SE_SELECT );
		PokeListScrMsgSet( msg_poke_use_error00, 1 );
		AddTask( LifeScrMsgWait, 5 );
	}else{
		ListStatus = 1;
		MePlay(0);
		LvUpParamSet( P_ITEM->cursor, P_ITEM->pp );
		SubItem( itemno, 1 );
		PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
		Lv = PokeParaGet( P_ITEM->pp, ID_level );
		PM_NumMsgSet( StrTempBuffer1, Lv, NUM_MODE_LEFT, 3);
		PM_MsgExpand( MsgExpandBuffer, msg_poke_rcv10 );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );
		AddTask( LvUpScrMsgWait, 5 );
	}
}

// メッセージウェイト
static void LvUpScrMsgWait( u8 id )
{
	if( MeWait(0) == 0 )	return;
	if( ListMsgStatus )		return;

	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		SePlay( SE_SELECT );
		DrawStPlusWindow( id );
		TaskTable[id].TaskAdrs = StatusPlusWinWait;
	}
}

static void StatusPlusWinWait( u8 id )
{
	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		SePlay( SE_SELECT );
		DrawNewStWindow(id);
		TaskTable[id].TaskAdrs = StatusWinWait;
	}
}

// ステータス表示
static void DrawStPlusWindow( u8 id )
{
	u8	i, x, y;

	NMenuWinBoxWrite( PARAM_WIN_SX, PARAM_WIN_SY, PARAM_WIN_EX, PARAM_WIN_EY );

	for( i=0; i<6; i++ ){
		P_LIST->work[ WK_MHP2+i ] = PokeParaGet( P_ITEM->pp, param_ID[i] );
		P_LIST->work[ WK_MHP+i ]  = P_LIST->work[ WK_MHP2+i ] - P_LIST->work[ WK_MHP+i ];

		x = PARAM_WIN_SX + ( i / 3 * 9 );
		y = PARAM_WIN_SY + 1 + ( ( i % 3 ) << 1 );

		NMenuMsgWrite( str_param[i], x+1, y );	// パラメータ名
		NMenuMsgWrite( str_plus, x+6, y );		// '+'

		// plus param
		PM_NumMsgSet( StrTempBuffer0, P_LIST->work[ WK_MHP+i ], NUM_MODE_SPACE, 2 );
		NMenuMsgWrite( StrTempBuffer0, x+7, y );
	}
}

static void DrawNewStWindow( u8 id )
{
	u8	i, x, y;

	for( i=0; i<6; i++ ){
		P_LIST->work[ WK_MHP2+i ] = PokeParaGet( P_ITEM->pp, param_ID[i] );

		x = PARAM_WIN_SX + ( i / 3 * 9 );
		y = PARAM_WIN_SY + 1 + ( ( i % 3 ) << 1 );

		// new param
		PM_NumMsgSet( StrTempBuffer0, P_LIST->work[ WK_MHP2+i ], NUM_MODE_SPACE, 3 );
		NMenuBoxWrite( x+6, y, x+8, y+1 );
		NMenuMsgWrite( StrTempBuffer0, x+6, y );
	}
}

// Lv,HP,MHP更新
static void LvUpParamSet( u8 pos, PokemonParam * pp )
{
	u8	xpos, ypos;
	u8	cond;

	// Lv
	cond = GetPokeCondition( pp );
	if( cond == ST_NORMAL || cond == ST_POKERUS ){
		StRecoverLvPut( pp, pos );
	}
	// HP
	xpos = HpDefaultPos[FightCheck()][pos].x;
	ypos = HpDefaultPos[FightCheck()][pos].y;
	PokeListNumberPut(
		PokeParaGet( pp, ID_hp ),
		P_HP_TRANS_CHARNO + pos * P_KETA, 1, xpos, ypos );
	// MHP
	xpos = MaxHpDefaultPos[FightCheck()][pos].x;
	ypos = MaxHpDefaultPos[FightCheck()][pos].y;
	PokeListNumberPut(
		PokeParaGet(pp, ID_hpmax),
		P_HPMAX_TRANS_CHARNO + pos * P_KETA, 1, xpos, ypos );

	// HPバー更新
	ListGaugeScreenSet( pos, pp );

	// アイコンアニメ
	PokeIconAnmSet( GetPataChrActNo( P_ITEM->main_id, pos ), pp );

	// カードを青へ
	PokeCardColorChange(
			&PokeCardPos[ FightCheck() * 12 + pos * 2 ],
			CARD_B_PAL+CARD_FLASH_PAL );
	P_LIST->card_flg = 2;
}

// キーウェイト
static void StatusWinWait( u8 id )
{
	u16 waza, aftermons;

	if( MeWait(0) == 0 )	return;

	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		NMenuBoxClear( PARAM_WIN_SX, PARAM_WIN_SY, PARAM_WIN_EX, PARAM_WIN_EY );

		waza = PokeWazaOboeCheck( P_ITEM->pp ,1 );
		P_LIST->work[15] = 1;
		switch( waza ){
		case 0:
			aftermons = PokeShinkaCheck( P_ITEM->pp, LEVELUP_SHINKA, 0 );
			if( aftermons != 0 ){
				ShinkaReturnProc = FieldMenuBagInit;
				InitShinka( P_ITEM->pp, aftermons, SHINKA_CANCEL_ON , P_ITEM->cursor );
				DelTask(id);
				return;
			}

			LvUpEnd(id);
			break;

		case NO_WAZA_SET:
			PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
			PM_strcpy( StrTempBuffer1, WazaNameData[ OboeWazaNo ] );
			PM_MsgExpand( MsgExpandBuffer, msg_poke_waza02 );
			PokeListScrMsgSet( MsgExpandBuffer, 1 );
			P_ITEM->new_waza = OboeWazaNo;
			TaskTable[id].TaskAdrs = WazaKoukanYesNoInit;
			break;

		case SAME_WAZA_SET:
			TaskTable[id].TaskAdrs = WazaOboeNextCheck;
			break;

		default:
			PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
			PM_strcpy( StrTempBuffer1, WazaNameData[waza] );
			PM_MsgExpand( MsgExpandBuffer, msg_poke_waza00 );
			PokeListScrMsgSet( MsgExpandBuffer, 1 );
			TaskTable[id].TaskAdrs = WazaMachinScrMsgWait;
		}
	}
}

// 覚えられる技が無くなるまでチェック
static void WazaOboeNextCheck( u8 id )
{
	u16 waza, aftermons;

	waza = PokeWazaOboeCheck( P_ITEM->pp ,0 );
	switch( waza ){
	case 0:
		aftermons = PokeShinkaCheck( P_ITEM->pp, LEVELUP_SHINKA, 0 );
		if( aftermons != 0 ){
			ShinkaReturnProc = FieldMenuBagInit;
			InitShinka( P_ITEM->pp, aftermons, SHINKA_CANCEL_ON , P_ITEM->cursor );
			DelTask(id);
			return;
		}

		LvUpEnd(id);
		break;

	case NO_WAZA_SET:
		PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
		PM_strcpy( StrTempBuffer1, WazaNameData[ OboeWazaNo ] );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_waza02 );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );
		P_ITEM->new_waza = OboeWazaNo;
		TaskTable[id].TaskAdrs = WazaKoukanYesNoInit;
		break;

	case SAME_WAZA_SET:
		WazaOboeNextCheck(id);
		break;

	default:
		PokeNickNameSet( P_ITEM->pp, StrTempBuffer0 );
		PM_strcpy( StrTempBuffer1, WazaNameData[waza] );
		PM_MsgExpand( MsgExpandBuffer, msg_poke_waza00 );
		PokeListScrMsgSet( MsgExpandBuffer, 1 );
		TaskTable[id].TaskAdrs = WazaMachinScrMsgWait;
	}
}

// 終了
static void LvUpEnd( u8 id )
{
	TaskTable[ P_ITEM->main_id ].TaskAdrs = P_ITEM->returnAdrs;
	DelTask(id);
}


//=========================================================================================
//		進化アイテム	2002/04/24 by nakahiro
//=========================================================================================
// 初期処理
void PokeListEvolutionInit( u8 id, u16 item, pTaskFunc returnAdrs )
{
	u8	temp;

	SePlay( SE_SELECT );

	TaskTable[id].TaskAdrs = DummyTaskSeq;
	
	SetItemUseData( id, item, returnAdrs );
	
	ShinkaReturnProc = FieldMenuBagInit;
	temp = SetStatusRecover( P_ITEM->cursor, item, 0 );

	if( temp != 0 ){
		ListStatus = 0;
		PokeListScrMsgSet( msg_poke_use_error00, 1 );
		AddTask( LifeScrMsgWait, 5 );
	}else{
		SubItem( item, 1 );
	}
}


//=========================================================================================
//	アイテム効果を調べる
//=========================================================================================
//-----------------------------------------------------------------------------------------
// static const u8 ItemParam000[] = { flg1, flg2, flg3, flg4, flg5, flg6, p0, p1, ...... };
//
// flg1 = 1ﾋﾞｯﾄ：ﾒﾛﾒﾛ回復 / 1ﾋﾞｯﾄ：全員瀕死回復 / 2ﾋﾞｯﾄ：ｸﾘﾃｨｶﾙ(0-3) / 4ﾋﾞｯﾄ：攻撃力(0-7)
// flg2 = 上位4ﾋﾞｯﾄ：防御力(0-15) / 下位4ﾋﾞｯﾄ：素早さ  (0-15)
// flg3 = 上位4ﾋﾞｯﾄ：命中  (0-15) / 下位4ﾋﾞｯﾄ：特殊攻撃(0-15)
// flg4 = 能力ガード/LvUP/眠り回復/毒回復/火傷回復/氷回復/麻痺回復/混乱回復
// flg5 = 進化/瀕死回復/pp値UP/pp回復flg/pp回復値/HP回復/攻撃努力値/HP努力値
// flg6 = なつき度3/なつき度2/なつき度1/pp値3UP/特攻努力値/特防努力値/素早さ努力値/防御努力値
//
// p0,p1,...... = 変動値
// 優先度：HP努力値 > 攻撃努力値 > 防御努力値 > 素早さ努力値 > HP回復 > pp回復値 >
//         特防努力値 > 特攻努力値 > なつき度1 > なつき度2 > なつき度3
//-----------------------------------------------------------------------------------------
#ifdef	PM_DEBUG
const u8 debug_ram_item[] = { 0x40, 0x00, 0x00, 0x00, 0x44, 0x00, 0xff, };
/*	0x00,
	0x00,
	0x00,
	0x00,
	0x00,
	0x00,
	0x00,
	0x00, 0x00,	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};
//static const u8 ItemParam045[] = { 0x40, 0x00, 0x00, 0x00, 0x44, 0x00, 0xff, };
*/
#endif	PM_DEBUG

u8 ItemRecoverCheck( u16 item )
{
	u8 * param;
	u8   st;

	if( item == ITEM_NAZONOMI )	param = (u8 *)&Fld.RamSeed.item_param;
	else	param = ItemPokeParmTbl[ item - ITEM_NORMAL_START ];

	// 戦闘用ステータスアップ系
	if( ( param[0] & 0x3f ) != 0 || param[1] != 0 ||
		param[2] != 0 || ( param[3] & 0x80 ) != 0 )
	{
		return	ITEM_TYPE_BTL_ST_UP;
	}
	// 全員瀕死回復
	if( ( param[0] & 0x40 ) != 0 )	return	ITEM_TYPE_ALLDETH_RCV;
	// LvUp系
	if( ( param[3] & 0x40 ) != 0 )	return	ITEM_TYPE_LV_UP;
	// Status回復系
	st = ( param[3] & 0x3f );
	if( st != 0 || ( param[0] >> 7 ) != 0 ){
		if( st == 0x20 )	return	ITEM_TYPE_NEMURI_RCV;	// 眠り
		if( st == 0x10 )	return	ITEM_TYPE_DOKU_RCV;		// 毒
		if( st == 0x08 )	return	ITEM_TYPE_YAKEDO_RCV;	// 火傷
		if( st == 0x04 )	return	ITEM_TYPE_KOORI_RCV;	// 氷
		if( st == 0x02 )	return	ITEM_TYPE_MAHI_RCV;		// 麻痺
		if( st == 0x01 )	return	ITEM_TYPE_KONRAN_RCV;	// 混乱
		if( ( param[0] >> 7 ) != 0 && st == 0 )
			return	ITEM_TYPE_MEROMERO_RCV;		// メロメロ回復
		return	ITEM_TYPE_ALL_ST_RCV;			// 全快
	}
	// HP回復 ( 瀕死も )
	if( ( param[4] & 0x44 ) != 0 )	return	ITEM_TYPE_HP_RCV;
	// ドーピング系
	if( ( param[4] & 0x02 ) != 0 )	return	ITEM_TYPE_ATC_UP;	// 攻撃努力値UP
	if( ( param[4] & 0x01 ) != 0 )	return	ITEM_TYPE_HP_UP;	// HP努力値UP
	if( ( param[5] & 0x08 ) != 0 )	return	ITEM_TYPE_SPA_UP;	// 特攻努力値UP
	if( ( param[5] & 0x04 ) != 0 )	return	ITEM_TYPE_SPD_UP;	// 特防努力値UP
	if( ( param[5] & 0x02 ) != 0 )	return	ITEM_TYPE_AGL_UP;	// 素早さ努力値UP
	if( ( param[5] & 0x01 ) != 0 )	return	ITEM_TYPE_DEF_UP;	// 防御努力値UP
	// 進化系
	if( ( param[4] & 0x80 ) != 0 )	return	ITEM_TYPE_EVO;
	// ppUp系
	if( ( param[4] & 0x20 ) != 0 )	return	ITEM_TYPE_PP_UP;
	// pp3Up系
	if( ( param[5] & 0x10 ) != 0 )	return	ITEM_TYPE_PP_3UP;
	// pp回復系
	if( ( param[4] & 0x18 ) != 0 )	return	ITEM_TYPE_PP_RCV;

	return	ITEM_TYPE_ETC;
}
