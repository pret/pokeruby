//=========================================================================================
//										バッグ画面
//								2001/08/23	by nakahiro
//=========================================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "script.h"
#include "fld_main.h"
#include "pokelist.h"
#include "menu.h"
#include "f_pmlist.h"
#include "b_pmlist.h"
#include "map_attr.h"
#include "fieldmap.h"
#include "task.h"
#include "bag.h"
#include "poketool.h"
#include "weather.h"
#include "evobj.h"
#include "jiki.h"
#include "client.h"
#include "gold.h"
#include "item.h"
#include "item_def.h"
#include "pokelist.h"
#include "seed.h"
#include "mapname.h"
#include "screen.h"
#include "itemtool.h"
#include "fld_talk.h"
#include "mus_tool.h"
#include "fld_sio.h"
#include "decord.h"
#include "my_pc.h"
#include "message.h"
#include "laster.h"
#include "fld_task.h"

#include "../data/itemsym.h"

//=========================================================================================
//										シンボル
//=========================================================================================
enum {
	FLD_MENU_MODE = 0,		// フィールドメニュー
	BTL_MODE,				// 戦闘
	FLD_POKELIST_MODE,		// フィールドポケモンリスト
	FD_SHOP_MODE,			// フレンドショップ
	FLD_SEED_MODE,			// たね
	CUBE_BLEND_MODE,		// 通信ブレンド
	MY_PC_MODE,				// 道具あずかり
	POKE_GET_DEMO_MODE,		// 捕獲デモ
};

#define	ITEMWINX	14		//ｱｲﾃﾑｳｨﾝﾄﾞｳX座標
#define	ITEMWINY	0		//ｱｲﾃﾑｳｨﾝﾄﾞｳY座標
#define	ITEMWINH	16		//ｱｲﾃﾑｳｨﾝﾄﾞｳ幅
#define	ITEMWINV	18		//ｱｲﾃﾑｳｨﾝﾄﾞｳ高さ

#define	BAG_SCR_CUR_X		172
#define	BAG_SCR_CUR_UY		12
#define	BAG_SCR_CUR_DY		148

#define	BAG_POKE_CUR_LX		28
#define	BAG_POKE_CUR_RX		100
#define	BAG_POKE_CUR_Y		88

#define	ITEMWINSPD			1	//ｱｲﾃﾑｳｨﾝﾄﾞｳ出現ｽﾋﾟｰﾄﾞ
#define	ITEMWIN_HEIGHT_MAX	16	//ｱｲﾃﾑｳｨﾝﾄﾞｳ高さ最大値

#define	INFOWINX	0		//情報ｳｨﾝﾄﾞｳX座標
#define	INFOWINY	13		//情報ｳｨﾝﾄﾞｳY座標
#define	INFOWINH	13		//情報ｳｨﾝﾄﾞｳ幅
#define	INFOWINV	7		//情報ｳｨﾝﾄﾞｳ高さ

#define	MENUWINX		0		//ﾒﾆｭｰｳｨﾝﾄﾞｳX座標
#define MENUWINY		7		//ﾒﾆｭｰｳｨﾝﾄﾞｳY座標
#define MENUWINH		13		//ﾒﾆｭｰｳｨﾝﾄﾞｳ幅
#define MENUWINV		5		//ﾒﾆｭｰｳｨﾝﾄﾞｳ高さ
#define	BTL_MENUWINX	7		//ﾒﾆｭｰｳｨﾝﾄﾞｳX座標・戦闘用

#define	ROSTWINX	7		//破棄ｱｲﾃﾑ数ｳｨﾝﾄﾞｳX座標
#define	ROSTWINY	9		//破棄ｱｲﾃﾑ数ｳｨﾝﾄﾞｳY座標
#define	ROSTWINH	6		//破棄ｱｲﾃﾑ数ｳｨﾝﾄﾞｳ幅
#define	ROSTWINV	3		//破棄ｱｲﾃﾑ数ｳｨﾝﾄﾞｳ高さ

#define MSGWINX		3		//メッセージウィンドウX座標
#define MSGWINY		15		//メッセージウィンドウY座標
#define MSGWINH		24		//メッセージウィンドウ幅
#define MSGWINV		4		//メッセージウィンドウ高さ

#define SALEWINX	0		//売る数ウィンドウX座標
#define SALEWINY	10		//売る数ウィンドウY座標
#define SALEWINH	13		//売る数ウィンドウ幅
#define SALEWINV	3		//売る数ウィンドウ高さ

#define GOLDWINX	0		//所持金ウィンドウX座標
#define GOLDWINY	0		//所持金ウィンドウY座標
#define GOLDWINH	13		//所持金ウィンドウ幅
#define GOLDWINV	3		//所持金ウィンドウ高さ

#define GET_ADR_H(n) ( ( (u32)n & 0xffff0000)  >> 16 )
#define GET_ADR_L(n) ( (u32)n & 0x0000ffff) 
#define RETURN_ADR(h,l) ( (u16)(h) << 16 | (u16)(l) )

//タスクワーク番号
#define	WIN_CHENGE		5
#define	SHOP_POS_CNT	6
#define	RETURN_ADR_H	8
#define	RETURN_ADR_L	9
#define	MOVE_ITEM		10
#define	ARROW_CNT		11
#define	DEMO_CNT		15

#define CHANCEL_ITEM	0	// キャンセル時に返すアイテム番号
#define	BAG_POCKET_MAX	5	// バッグのポケットの数
#define	FLD_MENU_MAX	4	// フィールドメニューの数
#define	SEED_MENU_MAX	6	// タネのフィールドメニューの数
#define	BTL_MENU_MAX	2	// バトルメニューの数

#define	WHITE_BG		1	//白いBGの番号

#define	DUMMY_PALETTE	13	// メニューを開いたときのカーソルの色

#define	GRAPHIC_CNT		UserWork[0x20000-1]

//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
void BagCountInit(void);						//カウンタ初期化
static void BagRegInit(void);					//レジスタ初期化
static u8 BagGraphicSet(void);					// グラフィック展開
static void ResetScrPos(void);					//使い切ったときなどの修正
static void BagExitInit(u8);					//終了処理
void BagExitTask(u8);
static void BagMainTask(u8);					//アイテム選択
static void SetPocketTitle3(u16 *,u8);			//ポケットタイトル
static void SetPocketTitle4(u16 *,u8,u8,s8);
static void MakeItemWindow3(u16 *);				//アイテムウィンドウ設定
static void ItemWinScr(u16 *,u8,u8);			//ポケット交換時のアイテムウィンドウ表示
static void GetAllPocketItemMax(void);			//所持アイテム数を調べる
static void ItemSortLOW(POCKET);				//昇順ソート
static void MakeDrawItemName(void);				//アイテム名表示
static void CheckItemMax( u8 no );				//現在のポケットのアイテム数を調べる
static void CheckItemMaxAll(void);				//ポケットのアイテム数を調べる
static void DrawInfoMsg2(s16);					//情報表示
//static void DrawScrArrow(u16 *,s16);			//スクロール矢印表示
static void ClearMenuWin(u16 *);				//メニューウィンドウ消去
static void FieldItemUseTask(u8);				//フィールドへ復帰後の処理設定
static void ReDrawItemName(void);				//アイテム再描画
static void BagPaletteMake(void);				//パレット作成
static void DelBENRI(void);
static void SetPocketMark( u16 * BG, u8 page );	//ポケットマーク表示

static void PocketKeyTask(u8);	//ポケットを選択

static void FieldMenuItemSet(u8);		//フィールドメニュー（決定）
static void ReturnFieldMenu(u8);		//フィールドメニュー（キャンセル）
static void BtlItemSet(u8);				//戦闘（決定）
static void SetCancelParam(u8);			//戦闘（キャンセル）
static void FldPokeListItemSet(u8);		//フィールドポケモンリスト（決定）
static void CancelFieldPokeList(u8);	//フィールドポケモンリスト（キャンセル）
static void SaleCheck(u8);				//フレンドショップ（売る）（決定）
static void CancelFdShop(u8);			//フレンドショップ（売る）（キャンセル）
static void FldSeedItemSet(u8);			//たね（決定）
static void CancelSeed(u8);				//たね（キャンセル）
static void CubeBlendItemSet(u8);		//キューブブレンド（決定）
static void CancelBlend(u8);			//キューブブレンド（キャンセル）
static void MyPC_SetInit( u8 id );		//道具あずかり（決定）
static void CancelMyPC( u8 id );		//道具あずかり（キャンセル）

static void FieldItemUse(u8);	//使う　（フィールド用）
static void ItemRost(u8);		//捨てる
static void FieldItemNot(u8);	//やめる（フィールド用）
static void SetEasyButton(u8);	//とうろく
static void BtlItemUse(u8);		//使う　（戦闘用）
static void BtlItemNot(u8);		//やめる（戦闘用）
static void SetPokeItem(u8);	//もたせる
static void SeedTag(u8);		//タグをみる

//はい・いいえ
static void RostPickYes(u8);	//捨てる（はい）
static void RostPickNo(u8);		//捨てる（いいえ）
static void SalePickYes(u8);	//売る（はい）
static void SalePickNo(u8);		//売る（いいえ）

extern void FieldMenuPokeListInit(void);	
extern void FieldBagPokeListInit(void);

extern u8	SetActPocketNameWin(void);	//雫セット
extern u8	FishingEncount(u8);			//釣りエンカウントチェック

extern void AddMainBagActor(void);	// バッグセット
extern void AddBagBallActor(u8);	// バッグのボールセット
extern void DelBagBallAct(void);	// バッグのボール削除

extern void SeedTagInit(void);		// タグ画面初期設定


//=========================================================================================
//										外部変数
//=========================================================================================
extern const CellData M_Bag_Cell;
extern const CellData F_Bag_Cell;
extern const PalData MainBagPal;

static s8 win_no = 0;			// アイテムウィンドウ番号
static u8 ItemWinHeight = 0;	// アイテムウィンドウの高さカウンタ
s8	pocket_change_flg = 0;		// ポケット交換フラグ
s8	item_pick_flg = 0;			// アイテム選択フラグ

// ポケットデータ
const POCKET	pocket[] =
{
	{ Fld.MyNormalItem, MY_NORMAL_ITEM_MAX },
	{ Fld.MyBallItem,   MY_BALL_ITEM_MAX   },
	{ Fld.MySkillItem,  MY_SKILL_ITEM_MAX  },
	{ Fld.MySeedItem,   MY_SEED_ITEM_MAX   },
	{ Fld.MyExtraItem,  MY_EXTRA_ITEM_MAX  },
};

// ポケット名のBG番号のテーブル
static const u8 p_name_bg2[ 6*16 ] = {
	0x3a,0x3a,0x3a,0x3a,0x3a,0x3a,0x3a,0x3a,	// ダミー
	0x3a,0x30,0x3a,0x31,0x3a,0x32,0x3a,0x3a,	// どうぐ
	0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1c,0x1f,	// モンスターボール
	0x3a,0x33,0x34,0x35,0x36,0x19,0x3a,0x3a,	// わざマシン
	0x3a,0x39,0x3a,0x17,0x3a,0x1e,0x3a,0x3a,	// きのみ
	0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x3a,	// たいせつなもの
};

BAG_STATUS	bag[BAG_POCKET_MAX];	// バッグ用カウンタ

static u8	menu_pos;		// メニュー選択カーソルポイント	

static u8	scene;		// どこから呼ばれたか

//--------------------------------- アイテムデータ ----------------------------------------
MINEITEM * PocketItem;			// 参照するアイテムデータ

u16	ReturnItemNo = 0;			// バトルなどに返すアイテム番号
u8	ItemPoint = 0;				// アイテムの場所
u8	UseFldPokeFlg = 0;			// つかう/もたせる/キューブ

//---------------------------------- メニューデータ ---------------------------------------
static const MENU_ITEM	reaction[] =
{
	{ str_tukau,   FieldItemUse },		// 00:つかう（ フィールド用 ）
	{ str_suteru,  ItemRost},			// 01:すてる
	{ str_yameru,  FieldItemNot },		// 02:やめる（ フィールド用 ）
	{ str_touroku, SetEasyButton },		// 03:とうろく
	{ str_tukau,   BtlItemUse },		// 04:つかう（ 戦闘用 ）
	{ str_yameru,  BtlItemNot },		// 05:やめる（ 戦闘用 ）
	{ str_motaseru,SetPokeItem },		// 06:もたせる
	{ str_tag,	   SeedTag },			// 07:タグをみる
	{ str_dummy,   NULL },				// 08:ダミー
	{ str_kettei,  CubeBlendItemSet },	// 09:けってい（ ブレンド用 ）
};

// フィールド用メニュー
static const u8 fld_menu[] =
{
	0, 1, 6, 2,	0, 0,	// どうぐポケット
	6, 1, 8, 2,	0, 0,	// モンスターボールポケット
	0, 8, 6, 2,	0, 0,	// わざマシンポケット
	7, 0, 1, 8, 6, 2,	// タネポケット
	0, 8, 3, 2,	0, 0,	// たいせつなもの
};

// 通信時のフィールド用メニュー
static const u8 sio_fld_menu[] =
{
	6, 2,	// どうぐポケット
	6, 2,	// モンスターボールポケット
	6, 2,	// わざマシンポケット
	6, 2,	// タネポケット
	2, 0,	// たいせつなもの
};

// ブレンド用メニュー
static const u8 blend_menu[] = { 9, 8, 7, 2 };

static u8 * menu_list;	// メニューリスト
static u8 menu_max = 0;	// メニュー数

void (*FieldReturnItemUse)(u8);		// フィールド復帰後の飛び先

// アイテム選択時の処理
static const SELECT_ITEM	PickItemFunc[] =
{
	{ FieldMenuItemSet,   ReturnFieldMenu     },	// 00:フィールドメニュー
	{ BtlItemSet,         SetCancelParam      },	// 01:戦闘
	{ FldPokeListItemSet, CancelFieldPokeList },	// 02:フィールドポケモンリスト
	{ SaleCheck,          CancelFdShop        },	// 03:フレンドショップ（売る）
	{ FldSeedItemSet,	  CancelSeed		  },	// 04:たね
	{ FieldMenuItemSet,   CancelBlend         },	// 05:キューブブレンド
	{ MyPC_SetInit,       CancelMyPC          },	// 06:道具あずかり
};

//はい・いいえ処理
static const SELECT_ITEM	YesNoPickFunc[] =
{
	{ RostPickYes, RostPickNo },	//00:捨てる
	{ SalePickYes, SalePickNo },	//01:売る
};

//----------------------------------- ダミーデータ ----------------------------------------
#ifdef	PM_DEBUG
#define	DUMMY	60
static const MINEITEM	DummyItem[ DUMMY ] =
{
	{ ITEM_MONSUTAABOORU, 10 },
	{ ITEM_HAIPAABOORU,   15 },
	{ ITEM_SUUPAABOORU,   20 },
	{ ITEM_MASUTAABOORU,  25 },
	{ ITEM_DAATOZITENSYA,  1 },
	{ ITEM_BORONOTURIZAO,  1 },
	{ ITEM_IITURIZAO,      1 },
	{ ITEM_SUGOITURIZAO,   1 },
	{ ITEM_POROKKUKEESU,   1 },
	{ ITEM_HOERUKOZYOURO,  1 },
	{ ITEM_DAUZINGUMASIN,  1 },
	{ 0, 1 },
};
#endif	PM_DEBUG

//=========================================================================================
//										メイン処理
//=========================================================================================
static void BagMain(void)
{
	JumpActor();
	SetActor();
	MainTask();
	PaletteAnime();
}

//=========================================================================================
//										割り込み
//=========================================================================================
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
	DIV_DMACOPY(3,BG1_data,BG_VRAM+0x2000,0x800,16);	//BGマップ転送
	DIV_DMACOPY(3,BG2_data,BG_VRAM+0x6000,0x800,16);	//BGマップ転送
}

//=========================================================================================
//										初期化
//=========================================================================================
static u8 BagInit(void)
{
	switch( sys.InitSeqWork ){

	case 0:
		InitHVBlankFunc();		// HVBlank初期化
		BagRegInit();			// レジスタ初期化
		sys.InitSeqWork++;
		break;

	case 1:
		LasterInit();
		sys.InitSeqWork++;
		break;

	case 2:
		EvObjPalManInit();
		sys.InitSeqWork++;
		break;

	case 3:
		BGDataInit();			// BGデータ初期化
		GRAPHIC_CNT = 0;
		sys.InitSeqWork++;
		break;

	case 4:
		PaletteAnimeInit();				// ﾊﾟﾚｯﾄｱﾆﾒ 初期化
		FadeData.trans_stop = 1;
		sys.InitSeqWork++;
		break;

	case 5:
		InitActor();					// ｱｸﾀｰ初期化
		sys.InitSeqWork++;
		break;

	case 6:
		if( BagGraphicSet() == FALSE )	break;
		sys.InitSeqWork++;
		break;

	case 7:
		PrintScreenInit(BAG_TYPE);	// ﾒｯｾｰｼﾞ表示領域初期化
		sys.InitSeqWork++;
		break;

	case 8:
		NMenuScreenInitStart( BAG_TYPE );
		sys.InitSeqWork++;
		break;

	case 9:
		if ( NMenuScreenInitMain() == FALSE ) break;
		sys.InitSeqWork++;
		break;

	case 10:
		ScrActInit();	// アクター番号初期化
		AddMarkPal();	// マークパレットセット
		AddScrCurActor( MARK_ACT_U_CURSOR, BAG_SCR_CUR_X, BAG_SCR_CUR_UY );
		AddScrCurActor( MARK_ACT_D_CURSOR, BAG_SCR_CUR_X, BAG_SCR_CUR_DY );
		AddScrCurActor( MARK_ACT_L_CURSOR, BAG_POKE_CUR_LX, BAG_POKE_CUR_Y );
		AddScrCurActor( MARK_ACT_R_CURSOR, BAG_POKE_CUR_RX, BAG_POKE_CUR_Y );

		ScrCurActPrioritySet( MARK_ACT_U_CURSOR, 2 );
		ScrCurActPrioritySet( MARK_ACT_D_CURSOR, 2 );
		ScrCurActPrioritySet( MARK_ACT_L_CURSOR, 2 );
		ScrCurActPrioritySet( MARK_ACT_R_CURSOR, 2 );

		if( scene == FLD_SEED_MODE || scene == CUBE_BLEND_MODE ){
			BanishScrCurActor( MARK_ACT_L_CURSOR, 1 );
			BanishScrCurActor( MARK_ACT_R_CURSOR, 1 );
		}

		sys.InitSeqWork++;
		break;

	case 11:
		ItemWinHeight = ITEMWINV;					// ｱｲﾃﾑｳｨﾝﾄﾞｳ ｶｳﾝﾀｰ
		SetPocketTitle3( BG2_data, win_no+1 );		// ポケット名表示
		SetPocketMark( BG2_data, win_no );
		GetAllPocketItemMax();						// 所持アイテム数を調べる
		ItemSortLOW( pocket[ SKILL_POCKET-1 ] );	// 技マシンポケットを昇順ソート
		ItemSortLOW( pocket[ SEED_POCKET-1 ] );		// タネポケットを昇順ソート
		CheckItemMaxAll();							// ポケットのアイテム数を調べる
//		CheckItemMax(win_no);						// 現在のポケットのアイテム表示数を調べる
		PocketItem = pocket[win_no].item;			// 現在のポケットを参照
		ResetScrPos();								// 使い切ったときなどの修正
		sys.InitSeqWork++;
		break;

	case 12:
		MakeDrawItemName();			// アイテム名表示
		DrawInfoMsg2( PocketItem[ bag[win_no].scr+bag[win_no].pos ].item );	// 情報表示
		NMenuVCursorInit( ITEMWINX, ITEMWINY+2, bag[win_no].pos_max+1, bag[win_no].pos );
		pocket_change_flg = win_no + 1;
		item_pick_flg = 0;
		sys.InitSeqWork++;
		break;

	case 13:
		AddMainBagActor();		// バッグセット
		AddBagBallActor(0);		// ボールセット
		BagPaletteMake();		// パレット作成
		sys.InitSeqWork++;
		break;

	case 14:
		REG_IE_SET( V_BLANK_INTR_FLAG );
		*(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;
		PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
		FadeData.trans_stop = 0;
		sys.InitSeqWork++;
		break;

	case 15:
		if( FieldRecvFifoClearWait() == TRUE )	break;
		sys.InitSeqWork++;
		break;

	case 16:
		SetVBlankFunc( VInterFunc );	// 割込み関数設定(VBLANK)
		MainProcChange( BagMain );
		return	TRUE;
	}

	return	FALSE;
}

static u8 BagInit2(void)
{
	while(1){
		if( BagInit() == TRUE ){
			menu_pos = 0;	// メニュー選択カーソルポイント
			InitTask();		// タスク初期化
			return	TRUE;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
	return	FALSE;
}

//---------------------------
//		レジスタ初期化
//---------------------------
static void BagRegInit(void)
{
	ItemToolAGBRegInit();

	*(vu16 *)REG_BG2CNT = BG_COLOR_16					// 16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_2					// BG優先順位
						| 12 << BG_SCREEN_BASE_SHIFT	// スクリーンベースブロック
						| 1 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック
	*(vu16 *)REG_BG1CNT = BG_COLOR_16					// 16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_1					// BG優先順位
						| 4 << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
						| 1 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック
	*(vu16 *)REG_DISPCNT = DISP_MODE_0					// BGモード 
						 | DISP_OBJ_CHAR_1D_MAP			// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						 | DISP_BG2_ON					// BG2有効
						 | DISP_BG1_ON					// BG1有効
						 | DISP_BG0_ON					// BG0有効
						 | DISP_OBJ_ON;

	*(vu16 *)REG_BLDCNT = 0;
}

//-----------------------------
//		グラフィック展開
//-----------------------------
static u8 BagGraphicSet(void)
{
	switch( GRAPHIC_CNT ){
	case 0:
		DecordVram( (void*)bagbg_pch_ADRS, (void*)(BG_VRAM+0x4000) );
		GRAPHIC_CNT++;
		break;
	case 1:
		DecordWram( (void*)bag_psc_ADRS, (void *)BG2_data );
		GRAPHIC_CNT++;
		break;
	case 2:
		if( MyData.my_sex == MALE || scene == POKE_GET_DEMO_MODE )
			DecordPaletteWork( (void*)m_bagbg_pcl_ADRS, PA_BG0+PA_COL0, 0x40 );
		else
			DecordPaletteWork( (void*)f_bagbg_pcl_ADRS, PA_BG0+PA_COL0, 0x40 );
		GRAPHIC_CNT++;
		break;
	case 3:
		if( MyData.my_sex == MALE || scene == POKE_GET_DEMO_MODE )
			DecordCellSet( (CellData*)&M_Bag_Cell );
		else	DecordCellSet( (CellData*)&F_Bag_Cell );
		GRAPHIC_CNT++;
		break;
	case 4:
		DecordPalSet( (PalData*)&MainBagPal );
		GRAPHIC_CNT = 0;
		return	TRUE;
	}
	return	FALSE;
}



//-------------------------------------
//		使い切ったときなどの修正
//-------------------------------------
static void ResetScrPos(void)
{
	u8	i;
	u8	max;

	for( i=0; i<5; i++ ){
		if( scene == CUBE_BLEND_MODE )	max = bag[i].item_max-1;
		else							max = bag[i].item_max;

		if( bag[i].scr != 0 ){
			if( bag[i].scr + bag[i].pos_max > max )
				bag[i].scr = max - bag[i].pos_max;
		}else{
			if( bag[i].pos > max )
				bag[i].pos = max;
		}
	}

/*
	if( bag[win_no].scr + 6 >= bag[win_no].item_max ){
		if( bag[win_no].scr != 0 )	bag[win_no].scr--;
		else						bag[win_no].pos--;
	}

	// ブレンド処理の修正
	if( scene == CUBE_BLEND_MODE ){
		if( bag[win_no].scr != 0 ){
			if( bag[win_no].scr + 7 >= bag[win_no].item_max )
				bag[win_no].scr--;
		}else{
			if( bag[win_no].pos == bag[win_no].item_max )
				bag[win_no].pos--;
		}
	}
*/
}

//--------------------------
//		カウンタ初期化
//--------------------------
void BagCountInit(void)
{
	u16	i;

	for( i=0; i<BAG_POCKET_MAX; i++ ){
		bag[i].pos = 0;
		bag[i].scr = 0;
		bag[i].item_max = 0;
		bag[i].pos_max = 0;
	}
	win_no = 0;		// ポケット番号
}

//--------------------------------
//		指定範囲のBGを消去
//--------------------------------
void ClearBGData( u16 * BG, u8 x, u8 y, u8 h, u8 v )
{
	u16	i,j;

	for( i=y; i<=y+v; i++ ){
		for( j=x; j<=x+h; j++ )
			BG[ j+(i<<5) ] = 0;
	}
}

//--------------------------------------------
//		全てのポケットのアイテムを初期化
//--------------------------------------------
void InitPocketItem(void)
{
	u16	i;

	for( i=0; i<BAG_POCKET_MAX; i++ ){
		ItemDataInit( pocket[i].item, pocket[i].max );
	}
	BagCountInit();
}

//--------------------------------------------------
//		ポケット毎にアイテムを分ける（テスト用）
//--------------------------------------------------
#ifdef	PM_DEBUG
void GetPocketItem(void)
{
	u16	i, j[BAG_POCKET_MAX], no;

	for( i=0; i<BAG_POCKET_MAX; i++ )
		j[i] = 0;

	for( i=0; i<DUMMY; i++ ){
		if( DummyItem[i].item == 0 )	break;
		no = ItemPocketGet( DummyItem[i].item ) - 1;	//収納先取得
		pocket[ no ].item[ j[no] ] = DummyItem[i];		//ダミーデータを収納
		j[no] ++;
	}
}
#endif	PM_DEBUG

//------------------------
//		パレット作成
//------------------------
static void BagPaletteMake(void)
{
	u16	pal[] = { 0x41ee, 0x7fff };

	PaletteWorkSet( &pal[1], 13 * 16 + COL_BLACK, 2 );	// 文字
	PaletteWorkSet( &pal[0], 13 * 16 + COL_DGRAY, 2 );	// 影
}


//=========================================================================================
//											設定
//=========================================================================================
//-------------------------------
//		メニューリスト作成
//-------------------------------
static void MakeMenuList( void )
{
	//フィールドメニュー
	if( scene == FLD_MENU_MODE ){
		menu_list = (u8 *)( &fld_menu[ win_no*6 ] );
		if( win_no != SEED_POCKET-1 )	menu_max = FLD_MENU_MAX;	// タネ以外
		else							menu_max = SEED_MENU_MAX;	// タネ
	}
}

//---------------------------------------------
//	アイテム選択へ復帰
//---------------------------------------------
static void ReturnItemSelectTask( u8 id )
{
	TaskTable[id].TaskAdrs = BagMainTask;
	ScrCurActAnmPlay( MARK_ACT_U_CURSOR );
	ScrCurActAnmPlay( MARK_ACT_D_CURSOR );
	ScrCurActAnmPlay( MARK_ACT_L_CURSOR );
	ScrCurActAnmPlay( MARK_ACT_R_CURSOR );
}

//-----------------------------------
//		アイテムウィンドウ設定
//-----------------------------------
static void ItemWinInitTask(u8 id)
{
	ItemWinHeight += ITEMWINSPD;	//ウィンドウ高さ

	ItemWinScr( BG2_data, ItemWinHeight, 0x4f );
	SetPocketTitle4( BG2_data, win_no+1, ItemWinHeight>>1, (s8)TaskTable[id].work[WIN_CHENGE] );

	//ウィンドウ表示終了
	if( ItemWinHeight >= ITEMWIN_HEIGHT_MAX ){
		pocket_change_flg = win_no+1;
		ItemWinHeight = ITEMWIN_HEIGHT_MAX;
		ReturnItemSelectTask( CheckTaskNo( PocketKeyTask ) );
		DelTask(id);
		MakeDrawItemName();
		DrawInfoMsg2( PocketItem[ bag[win_no].scr+bag[win_no].pos ].item );
		NMenuVCursorInit( ITEMWINX, ITEMWINY+2, bag[win_no].pos_max+1, bag[win_no].pos );

		BanishScrCurActor( MARK_ACT_L_CURSOR, 0 );
		BanishScrCurActor( MARK_ACT_R_CURSOR, 0 );
	}
}

//ウィンドウ表示
static void MakeItemWindow3( u16 *BG )
{
	DecordWram( (void*)bag_psc_ADRS, (void *)BG );
}

//ポケット交換時のアイテムウィンドウ表示
static void ItemWinScr( u16 *BG, u8 y, u8 no )
{
	u16	i,j;

	for( i=0; i<y; i++ ){
//		for( j=0; j<14; j++ )
//			BG[ 0x0f+((2+i)<<5)+j ] = no;
		for( j=0; j<15; j++ )
			BG[ 0x0e + ((2+i)<<5)+j ] = no;
	}
}

//-------------------------------
//		ポケットの矢印表示
//-------------------------------
/*
static void SetPocketArrow( u16 * BG, s16 no )
{
	s16	ptn;

	if( scene == FLD_SEED_MODE || scene == CUBE_BLEND_MODE )
		return;

	ptn = no >> 3;

	BG[ 0x143 ] = ptn + 0x070;
	BG[ 0x163 ] = ptn + 0x870;
	BG[ 0x14c ] = ptn + 0x074;
	BG[ 0x16c ] = ptn + 0x874;
}

static void SetArrowCount( s16 * no )
{
	*no = (*no+1) & 0x1f;
}
*/

//---------------------------
//		ポケット名表示
//---------------------------
static void SetPocketTitle3( u16 *BG, u8 no )
{
	u16	i;

	no = no << 3;

	for( i=0; i<8; i++ ){
		BG[ 0x144+i ] = (u16)p_name_bg2[ no+i ];
		BG[ 0x164+i ] = (u16)(p_name_bg2[ no+i ] + 0x10);
	}
}

static void SetPocketTitle4( u16 *BG, u8 no, u8 cnt, s8 chg )
{
	u16	i;
	s16	p;

	if( no == 1 && chg == 1 )	no = 6;
	else	if( no == 6 && chg == -1 )	no = 1;

	p = ( ( no - chg )<<3 ) + cnt * chg;

	for( i=0; i<8; i++ ){
		if( p+i >= 8*6 )	p = 8-i;
		BG[ 0x144+i ] = (u16)p_name_bg2[ p+i ];
		BG[ 0x164+i ] = (u16)(p_name_bg2[ p+i ] + 0x10);
	}
}

//--------------------------------------------
//	ポケットマーク表示
//--------------------------------------------
static void SetPocketMark( u16 * BG, u8 page )
{
	u8	i;

	for( i=0; i<BAG_POCKET_MAX; i++ ){
		if( i == page )	BG[ 293 + i ] = 0x107d;
		else			BG[ 293 + i ] = 0x107c;
	}
}

//-----------------------------------
//		アイテムウィンドウ交換
//-----------------------------------
static void ChangeItemWin( u16 *BG, s8 p )
{
	u8	id;

	win_no = win_no + p;	//ウィンドウ交換

	//ウィンドウループ
	if( win_no > 4 )	win_no = 0;
	if( win_no < 0 )	win_no = 4;

	//文字消去
	NMenuBoxClear( ITEMWINX, ITEMWINY, ITEMWINX+ITEMWINH, ITEMWINY+ITEMWINV );
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	PocketItem = pocket[win_no].item;	//参照アイテム変更
	CheckItemMax(win_no);		//現在のポケットのアイテム数を調べる

	ItemWinHeight = 0;		//ｱｲﾃﾑｳｨﾝﾄﾞｳ 高さ初期化
	MakeItemWindow3( BG );	//ｱｲﾃﾑｳｨﾝﾄﾞｳ 初期化
	ItemWinScr( BG, 16, 3 );

	SetPocketTitle3( BG, 0 );	//ﾎﾟｹｯﾄ名ｳｨﾝﾄﾞｳ 初期化

	pocket_change_flg = 6;

	//タスクの二重登録防止
	id = CheckTaskNo( ItemWinInitTask );
	if( id == NOT_EXIST_TASK_ID )	id = AddTask( ItemWinInitTask, 8 );
	TaskTable[id].work[ WIN_CHENGE ] = (s16)p;
}

//--------------------------
//		アイテムソート
//--------------------------
static void ChengeItem( MINEITEM * p1, MINEITEM * p2 )
{
	MINEITEM	copy;

	copy = *p1;
	*p1  = *p2;
	*p2  = copy;
}

// スペースをつめる
static void ItemSortZERO( POCKET p )
{
	u16	i,j;

	for( i=0; i<p.max-1; i++ ){
		for( j=i+1; j<p.max; j++ ){
			if(p.item[i].no == 0)	ChengeItem( &p.item[i], &p.item[j] );
		}
	}
}

// 昇順ソート
static void ItemSortLOW( POCKET p )
{
	u16	i,j;

	for( i=0; i<p.max; i++ ){
		for( j=i+1; j<p.max; j++ ){
			if( p.item[i].no != 0 && p.item[j].no != 0 &&
				p.item[i].item > p.item[j].item )
			{
				ChengeItem( &p.item[i], &p.item[j] );
			}
		}
	}
}

//----------------------------------
//		所持アイテム数を調べる
//----------------------------------
static void GetPocketItemMax( u8 no )
{
	u16	i;

	bag[no].item_max = 0;

	for( i=0; i<pocket[no].max; i++ ){
		if( pocket[no].item[i].no != 0 )	bag[no].item_max++;
	}

	ItemSortZERO( pocket[no] );
}
// 全ポケット
static void GetAllPocketItemMax(void)
{
	u8	i;

	for( i=0; i<5; i++ )
		GetPocketItemMax(i);
}

//-----------------------------------------------
//		現在のポケットのアイテム数を調べる
//-----------------------------------------------
static void CheckItemMax( u8 no )
{
	//表示できる数を調べる
	if(	bag[no].item_max < 7 )
		bag[no].pos_max = bag[no].item_max;
	else	bag[no].pos_max = 7;
}

static void CheckItemMaxAll(void)
{
	u8	i;

	for( i=0; i<5; i++ )
		CheckItemMax(i);
}

//----------------------------
//		アイテムを減らす
//----------------------------
static void DelItemInit2( u8 id )
{
	u16	pos;

	pos = bag[win_no].scr+bag[win_no].pos;

	PocketItem[ pos ].no -= TaskTable[id].work[1];
	if( PocketItem[ pos ].no==0 ){

		// 便利ボタン削除
		if( Fld.cnv_btn == PocketItem[ pos ].item ){
			DelBENRI();
			Fld.cnv_btn = 0;
		}

		PocketItem[ pos ].item = 0;
		if( bag[win_no].scr+7 == bag[win_no].item_max &&
			bag[win_no].scr != 0 )
		{
			bag[win_no].scr--;
		}
		GetPocketItemMax( win_no );	//所持アイテム数を調べる
	}
	CheckItemMax(win_no);		//現在のポケットのアイテム数を調べる
}

//-------------------------------------------------
//	バッグ画面でアイテムを使用したときの再設定
//-------------------------------------------------
void BagItemUseSubSet(void)
{
	if( PocketItem[ bag[win_no].scr + bag[win_no].pos ].no == 0 ){
		PocketItem[ bag[win_no].scr + bag[win_no].pos ].item = 0;
		if( bag[win_no].scr + 7 == bag[win_no].item_max && bag[win_no].scr != 0 )
			bag[win_no].scr--;
		GetPocketItemMax( win_no );	//所持アイテム数を調べる
	}
	CheckItemMax(win_no);		//現在のポケットのアイテム数を調べる
}

//--------------------------------
//		アイテムを入れ替える
//--------------------------------
static void MoveCursorClear(void)
{
	u8	i;

	for( i=0; i<16; i++ )
		BG2_data[78+(i<<5)] = 0x4f;
}

static void MoveItemSet( u8 p0, u8 p1 )
{
	MINEITEM	dummy;

	dummy = PocketItem[p0];
	PocketItem[p0] = PocketItem[p1];
	PocketItem[p1] = dummy;
}

static void MoveItemMain( u8 id )
{
	SePlay(SE_SELECT);
	MoveCursorClear();
	MoveItemSet(TaskTable[id].work[ MOVE_ITEM ]-1,bag[win_no].pos+bag[win_no].scr);
//	NMenuBoxWrite( ITEMWINX, ITEMWINY, ITEMWINX+ITEMWINH, ITEMWINY+ITEMWINV );
	MakeDrawItemName();		//アイテム名表示
	DrawInfoMsg2( PocketItem[ bag[win_no].scr+bag[win_no].pos ].item );
	NMenuVCursorInit(ITEMWINX,ITEMWINY+2,bag[win_no].pos_max+1,bag[win_no].pos);
	TaskTable[id].work[ MOVE_ITEM ] = 0;
}

static void MoveItemCancel( u8 id )
{
	SePlay(SE_SELECT);
	MoveCursorClear();
	TaskTable[id].work[ MOVE_ITEM ] = 0;
	DrawInfoMsg2( PocketItem[bag[win_no].scr+bag[win_no].pos].item );
}

static void MoveItemCursorSet( u8 id )
{
	s16	point;

	MoveCursorClear();

	point = TaskTable[id].work[MOVE_ITEM]-bag[win_no].scr-1;

	if( point >= 0 && point < 8 ){
		BG2_data[78+(point<<6)] = 0x5f;
		BG2_data[110+(point<<6)] = 0x6f;
	}
}

static void MoveItemInit( u8 id )
{
	TaskTable[id].work[ MOVE_ITEM ] = bag[win_no].scr + bag[win_no].pos + 1;
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
	NMenuMsgWrite( msg_item_move, INFOWINX+1, INFOWINY );	//情報表示
}

//=========================================================================================
//										表示関係
//=========================================================================================
//-----------------------------------------
//		BGを指定のキャラで塗りつぶす
//-----------------------------------------
void ItemBGBoxWrite( u16 *BG, u8 x, u8 y, u8 h, u8 v, u16 p )
{
	s16	i,j;

	for( i=y; i<y+v; i++ ){
		for( j=x; j<x+h; j++ )
			BG[ j + ( i << 5 ) ] = p;
	}
}

//---------------------------------
//		BGに白いキャラを描画
//---------------------------------
static void DrawWhiteBack( u16 *BG, u8 x, u8 y, u8 h, u8 v )
{
	ItemBGBoxWrite( BG, x, y, h, v, WHITE_BG );
}

//---------------------------
//		"べんり"と表示
//---------------------------
static void DrawBENRI( u8 p )
{
	u16	i,j;

	for( i=0; i<16; i++ ){
		for( j=0; j<3; j++ )
			BG2_data[ ITEMWINX+12+j+((ITEMWINY+2+i)<<5) ] = 0x4f;
	}

	BG2_data[ ITEMWINX+12+((ITEMWINY+2+(p<<1))<<5) ] = 0x5a;
	BG2_data[ ITEMWINX+13+((ITEMWINY+2+(p<<1))<<5) ] = 0x5b;
	BG2_data[ ITEMWINX+14+((ITEMWINY+2+(p<<1))<<5) ] = 0x5c;
	BG2_data[ ITEMWINX+12+((ITEMWINY+3+(p<<1))<<5) ] = 0x6a;
	BG2_data[ ITEMWINX+13+((ITEMWINY+3+(p<<1))<<5) ] = 0x6b;
	BG2_data[ ITEMWINX+14+((ITEMWINY+3+(p<<1))<<5) ] = 0x6c;
}

//---------------------------
//		"べんり"削除
//---------------------------
static void DelBENRIMain( u8 pos )
{
	u8	j,k;

	for( j=0; j<2; j++ ){
		for( k=0; k<3; k++ )
			BG2_data[ ITEMWINX+12+k+((ITEMWINY+2+j+(pos<<1))<<5) ] = 0x4f;
	}
}

static void DelBENRI(void)
{
	u8	i;

	for(i=0;i<8;i++){
		if( bag[win_no].scr + i == bag[win_no].item_max )
			break;
		if( PocketItem[ bag[win_no].scr+i ].item == Fld.cnv_btn ){
			DelBENRIMain( i );
			break;
		}
	}
}

//--------------------------------
//		"べんり"表示場所変更
//--------------------------------
static void ReDrawBENRI(void)
{
	DelBENRI();
	DrawBENRI( bag[win_no].pos );
}

//------------------------------
//		( x 99 )個数表示
//------------------------------
void Draw_X_Num( u16 no, NUM_MODE_TYPE type, u8 x, u8 y, u8 keta )
{
	PM_NumMsgSet( StrTempBuffer0, no, type, keta );
	NMenuMsgWrite( str_batu, x, y );
}

//---------------------------
//		アイテム再描画
//---------------------------
static void ReDrawItemName(void)
{
//	NMenuBoxWrite( ITEMWINX, ITEMWINY, ITEMWINX+ITEMWINH, ITEMWINY+ITEMWINV );
	MakeDrawItemName();	//アイテム名表示
}

//----------------------------
//		アイテム名表示
//----------------------------
//No.XX + アイテム名表示
void DrawNumbersItemName( u16 no, const u8 *name, u8 x, u8 y )
{
	PM_NumMsgSet( StrTempBuffer0, no, NUM_MODE_ZERO, 2 );
	PM_strcat( StrTempBuffer0, name );
	NMenuMsgWrite( StrTempBuffer0, x, y );
}

// "バッグをとじる"表示
static u8 DrawItemNameEnd( u8 cnt )
{
	u8	py;

	if( bag[win_no].scr + cnt == bag[win_no].item_max ){
		if( scene == CUBE_BLEND_MODE )	return	TRUE;

		py = ITEMWINY + 2 + ( cnt << 1 );

		NMenuBoxWrite( ITEMWINX+1, py, ITEMWINX+ITEMWINH, py+1 );
		NMenuMsgWrite( str_bag_toziru, ITEMWINX + 1, py );

		BG2_data[ ( ( ITEMWINY + 2 + ( cnt << 1 ) ) << 5 ) + 15 ] = 0x4f;
		BG2_data[ ( ( ITEMWINY + 3 + ( cnt << 1 ) ) << 5 ) + 15 ] = 0x4f;
		BG2_data[ ( ( ITEMWINY + 2 + ( cnt << 1 ) ) << 5 ) + 16 ] = 0x4f;
		BG2_data[ ( ( ITEMWINY + 3 + ( cnt << 1 ) ) << 5 ) + 16 ] = 0x4f;

		if( cnt != 7 )
			NMenuBoxWrite( ITEMWINX+1, py+2, ITEMWINX+ITEMWINH, 19 );

		return	TRUE;
	}
	return	FALSE;
}

// どうぐ/ボールポケット
static void DrawItemNamePoke00(void)
{
	u8	i,no,y;

	for( i=0; i<8; i++ ){
		if( DrawItemNameEnd(i) == TRUE )	break;
		no = bag[win_no].scr + i;
		y  = ITEMWINY + 2 + ( i << 1 );
		NMenuBoxWrite( ITEMWINX+1, y, ITEMWINX+ITEMWINH, y+1 );
		NMenuMsgWrite( ItemNameGet( PocketItem[no].item ), ITEMWINX+1, y );
		Draw_X_Num( PocketItem[no].no, NUM_MODE_SPACE, ITEMWINX+12, y, 2 );
	}
}
// たいせつなものポケット
static void DrawItemNamePoke01(void)
{
	u8	i,no,y;

	for( i=0; i<8; i++ ){
		if( DrawItemNameEnd(i) == TRUE )	break;
		no = bag[win_no].scr+i;
		y  = ITEMWINY + 2 + ( i << 1 );
		NMenuBoxWrite( ITEMWINX+1, y, ITEMWINX+ITEMWINH, y+1 );
		NMenuMsgWrite( ItemNameGet( PocketItem[no].item ), ITEMWINX+1, y );
		if( PocketItem[no].item == Fld.cnv_btn )	DrawBENRI(i);
		else	DelBENRIMain(i);
	}
}
// わざマシンポケット
static void DrawItemNamePoke02(void)
{
	u8	i,no,y;

	for( i=0; i<8; i++ ){
		if( DrawItemNameEnd(i) == TRUE )	break;
		no = bag[win_no].scr+i;
		y  = ITEMWINY + 2 + ( i << 1 );

		NMenuBoxWrite( ITEMWINX+1, y, ITEMWINX+ITEMWINH, y+1 );

		if( PocketItem[ no ].item <= HIDEN_START_NO ){
			BG2_data[ ( ( ITEMWINY + 2 + ( i << 1 ) ) << 5 ) + 15 ] = 0x59;
			BG2_data[ ( ( ITEMWINY + 3 + ( i << 1 ) ) << 5 ) + 15 ] = 0x69;
			BG2_data[ ( ( ITEMWINY + 2 + ( i << 1 ) ) << 5 ) + 16 ] = 0x4f;
			BG2_data[ ( ( ITEMWINY + 3 + ( i << 1 ) ) << 5 ) + 16 ] = 0x4f;
			DrawNumbersItemName(
				PocketItem[no].item-WAZA_START_NO,
				&WazaNameData[ GetWazaNoItem( PocketItem[no].item ) ][0],
				ITEMWINX+2, y );
			Draw_X_Num( PocketItem[no].no, NUM_MODE_SPACE, ITEMWINX+12, y, 2 );
		}else{
			BG2_data[ ( ( ITEMWINY + 2 + ( i << 1 ) ) << 5 ) + 15 ] = 0x105d;
			BG2_data[ ( ( ITEMWINY + 3 + ( i << 1 ) ) << 5 ) + 15 ] = 0x106d;
			BG2_data[ ( ( ITEMWINY + 2 + ( i << 1 ) ) << 5 ) + 16 ] = 0x105e;
			BG2_data[ ( ( ITEMWINY + 3 + ( i << 1 ) ) << 5 ) + 16 ] = 0x106e;
			StrTempBuffer0[0] = n0_ + PocketItem[no].item - HIDEN_START_NO;
			StrTempBuffer0[1] = EOM_;
			PM_strcat(
				StrTempBuffer0,
				&WazaNameData[ GetWazaNoItem( PocketItem[no].item ) ][0] );
			NMenuMsgWrite( StrTempBuffer0, ITEMWINX+3, y );
		}
	}
}
// タネポケット
static void DrawItemNamePoke03(void)
{
	u8	i,no,y;

	for( i=0; i<8; i++ ){
		if( DrawItemNameEnd(i) == TRUE )	break;

		no = bag[win_no].scr + i;
		y  = ITEMWINY + 2 + ( i << 1 );
		BG2_data[ ( ( ITEMWINY + 2 + ( i << 1 ) ) << 5 ) + 15 ] = 0x59;
		BG2_data[ ( ( ITEMWINY + 3 + ( i << 1 ) ) << 5 ) + 15 ] = 0x69;

		GetItemName( PocketItem[no].item, StrTempBuffer1 );

		NMenuBoxWrite( ITEMWINX+1, y, ITEMWINX+ITEMWINH, y+1 );

		DrawNumbersItemName(
			PocketItem[no].item - SEED_START_NO,
			StrTempBuffer1,
			ITEMWINX+2, y );
		Draw_X_Num( PocketItem[no].no, NUM_MODE_SPACE, ITEMWINX+11, y, 3 );
	}
}

//本体
static void MakeDrawItemName(void)
{
	//アイテム名表示
	switch( win_no + 1 ){
	case NORMAL_POCKET:
	case BALL_POCKET:
		DrawItemNamePoke00();
		break;
	case IMPORTANT_POCKET:
		DrawItemNamePoke01();
		break;
	case SKILL_POCKET:
		DrawItemNamePoke02();
		break;
	case SEED_POCKET:
		DrawItemNamePoke03();
	}

	if( bag[win_no].scr != 0 )	BanishScrCurActor( MARK_ACT_U_CURSOR, 0 );
	else						BanishScrCurActor( MARK_ACT_U_CURSOR, 1 );

	if( ( scene != CUBE_BLEND_MODE && bag[win_no].scr+8 < bag[win_no].item_max+1 ) ||
		( scene == CUBE_BLEND_MODE && bag[win_no].scr+8 < bag[win_no].item_max ) )
	{
		BanishScrCurActor( MARK_ACT_D_CURSOR, 0 );
	}else{
		BanishScrCurActor( MARK_ACT_D_CURSOR, 1 );
	}

}

//-----------------------
//		情報表示
//-----------------------
static void DrawInfoMsg2(s16 no)
{
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	if( bag[win_no].scr+bag[win_no].pos == bag[win_no].item_max ){
		NMenuMsgWrite( msg_bag_close00[scene], INFOWINX+1, INFOWINY );	//情報表示
		NMenuMsgWrite( msg_bag_close01, INFOWINX+1, INFOWINY+2 );
		return;
	}

	NMenuMsgWrite( ItemMessageGet( no ), INFOWINX+1, INFOWINY );	//情報表示
}

//---------------------------------
//		スクロール時の再描画
//---------------------------------
static void DrawScrItemFunc( u8 id )
{
	if( TaskTable[id].work[ MOVE_ITEM ] != 0 )	MoveItemCursorSet( id );
	else	DrawInfoMsg2( PocketItem[ bag[win_no].scr+bag[win_no].pos ].item );
	SePlay(SE_SELECT);
	item_pick_flg = 1;
}

static void DrawScrItem2( s8 scr, u8 id )
{
	bag[win_no].scr += scr;
//	NMenuBoxClear(ITEMWINX,ITEMWINY,ITEMWINX+ITEMWINH,ITEMWINY+ITEMWINV);
	NMenuVCursorSet(0);
	MakeDrawItemName();
	DrawScrItemFunc(id);
}

//---------------------------------
//		スクロール外の再描画
//---------------------------------
static void DrawNotScrItem2( s8 cur, u8 id )
{
	bag[win_no].pos = NMenuVCursorSet( cur );
	DrawScrItemFunc(id);
}

//---------------------------------------------------
//	特定のアイテムの"つかう"を変更
//---------------------------------------------------
static const u8 * SpItemMenuUseChange( u16 item )
{
	// 自転車に乗っているとき
	if( CheckHeroState( MY_MV_BIT_CYCLE_R | MY_MV_BIT_CYCLE_S ) &&
		( item == ITEM_MAHHAZITENSYA || item == ITEM_DAATOZITENSYA ) )
	{
		return	str_oriru;
	}

	// メール
	if( MailItemNoCheck( item ) == 1 )
		return	str_miru;

	return	reaction[ menu_list[0] ].msg;
}

//-----------------------------------------
//		メニューウィンドウ表示
//-----------------------------------------
static void DrawUseMenuWin2( u16 *BG )
{
	u8	 i;
	u8 * msg;

//	PalChangeCursorPut( ITEMWINX, ITEMWINY+2+bag[win_no].pos*2, DUMMY_PALETTE );

	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	if( menu_max == FLD_MENU_MAX ){
		NMenuWinBoxWrite( MENUWINX, MENUWINY, MENUWINX+MENUWINH, MENUWINY+MENUWINV );
		DrawWhiteBack( BG, MENUWINX+1, MENUWINY+1, MENUWINH-1, MENUWINV-1 );

		for( i=0; i<menu_max; i++ ){
			if( i == 0 )	msg = (u8 *)SpItemMenuUseChange( ReturnItemNo );
			else			msg = (u8 *)reaction[ menu_list[i] ].msg;
			NMenuMsgWrite(
				msg,
				MENUWINX + 2 + ( ( i >> 1 ) * 6 ),
				MENUWINY + 1 + ( ( i & 1 ) * 2 ) );
		}

		NMenuVCursorInit( MENUWINX+1, MENUWINY+1, menu_max, 0 );	//カーソル初期設定
	}else{
		NMenuWinBoxWrite( MENUWINX, MENUWINY-2, MENUWINX+MENUWINH, MENUWINY+MENUWINV );
		DrawWhiteBack( BG, MENUWINX+1, MENUWINY-1, MENUWINH-1, MENUWINV+1 );
		for( i=0; i<menu_max; i++ ){
			NMenuMsgWrite(
				reaction[ menu_list[i] ].msg,
				MENUWINX + 2 + i / 3 * 6,
				MENUWINY - 1 + i % 3 * 2 );
		}
		NMenuVCursorInit( MENUWINX+1, MENUWINY-1, menu_max, 0 );	//カーソル初期設定
	}

	NMenuMsgWrite( msg_bag_dousuru, INFOWINX+1, INFOWINY );		//メッセージ表示
}

//----------------------------------------
//		メニューウィンドウ消去
//----------------------------------------
static void ClearMenuWin(u16 *BG)
{
	ClearBGData( BG, MENUWINX, MENUWINY-1, MENUWINH, MENUWINV+1 );
	NMenuBoxClear( MENUWINX, MENUWINY-2, MENUWINX+MENUWINH, MENUWINY+MENUWINV );
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
}

//--------------------------------
//		スクロール矢印表示
//--------------------------------
/*
static void DrawScrArrow( u16 * BG, s16 no )
{
	s16	ptn;

	ptn = no >> 3;

	if( bag[win_no].scr != 0){
		BG[ 0x35 ] = 0x078 + ptn;
//		BG[ 0x35 ] = 0x478 + ptn;
	}else{
		BG[ 0x35 ] = 0x03;
//		BG[ 0x35 ] = 0x03;
	}
	if( ( scene != CUBE_BLEND_MODE && bag[win_no].scr+8 < bag[win_no].item_max+1 ) ||
		( scene == CUBE_BLEND_MODE && bag[win_no].scr+8 < bag[win_no].item_max ) )
	{
		BG[ 0x15+0x12*32 ] = 0x878 + ptn;
//		BG[ 0x15+0x12*32 ] = 0xc78 + ptn;
	}else{
//		BG[ 0x14+0x12*32 ] = 0x03;
		BG[ 0x15+0x12*32 ] = 0x03;
	}
}
*/

//------------------------------
//		個数選択ウィンドウ
//------------------------------
static void ItemNumCheckWin( u8 id, u8 x, u8 y, u8 h, u8 v, u8 keta )
{
	TaskTable[id].work[1] = 1;
	TaskTable[id].work[2] = x+2;
	TaskTable[id].work[3] = y+1;
	NMenuWinBoxWrite( x, y, x+h, y+v );
	DrawWhiteBack( BG1_data, x+1, y+1, h-1, v-1 );
	Draw_X_Num( 1, NUM_MODE_ZERO, x+2, y+1, keta );
}

//=========================================================================================
//										キー入力関係
//=========================================================================================
//----------------------------
//		ポケットを選択
//----------------------------
static void PocketKeySet( s8 move, u8 anm )
{
	SePlay(SE_SELECT);

	BanishScrCurActor( MARK_ACT_U_CURSOR, 1 );
	BanishScrCurActor( MARK_ACT_D_CURSOR, 1 );
	BanishScrCurActor( MARK_ACT_L_CURSOR, 1 );
	BanishScrCurActor( MARK_ACT_R_CURSOR, 1 );

	ScrCurActAnmStopInit( MARK_ACT_U_CURSOR );
	ScrCurActAnmStopInit( MARK_ACT_D_CURSOR );
	ScrCurActAnmStopInit( MARK_ACT_L_CURSOR );
	ScrCurActAnmStopInit( MARK_ACT_R_CURSOR );

	ChangeItemWin( BG2_data, move );
	SetPocketMark( BG2_data, win_no );
	MakeMenuList();
	DelBagBallAct();		// バッグのボール削除
	AddBagBallActor(anm);	// バッグのボールセット
}

static u8 PocketKeyCheck(void)
{
	if( scene != FLD_SEED_MODE && scene != CUBE_BLEND_MODE ){
		if( sys.Trg == R_KEY || LR_TrgCheck() == LRM_R ){
			PocketKeySet( 1, 2 );
			return	TRUE;
		}
		if( sys.Trg == L_KEY || LR_TrgCheck() == LRM_L ){
			PocketKeySet( -1, 1 );
			return	TRUE;
		}
	}
	return	FALSE;
}

static void PocketKeyTask( u8 id )
{
	PocketKeyCheck();
}

//----------------------------
//		アイテムを選択
//----------------------------
static u8 ItemKeyCheck(u8 id)
{
	if( ( sys.Repeat & PLUS_KEY_MASK ) == U_KEY ){
		if( bag[win_no].pos != 0 )	DrawNotScrItem2( -1, id );
		else{
			if( bag[win_no].scr != 0 )	DrawScrItem2( -1, id );
		}
		return	TRUE;
	}
	if( ( sys.Repeat & PLUS_KEY_MASK ) == D_KEY){
		if( scene != CUBE_BLEND_MODE ){
			if( bag[win_no].pos != bag[win_no].pos_max)	DrawNotScrItem2( 1, id );
			else{
				if(bag[win_no].scr+bag[win_no].pos != bag[win_no].item_max)
					DrawScrItem2( 1, id );
			}
		}else{
			if( bag[win_no].pos != bag[win_no].pos_max ){
				if( bag[win_no].scr+bag[win_no].pos != bag[win_no].item_max-1 )
					DrawNotScrItem2( 1, id );
			}else{
				if( bag[win_no].scr+bag[win_no].pos != bag[win_no].item_max-1 )
					DrawScrItem2( 1, id );
			}
		}

		return	TRUE;
	}

	if( TaskTable[id].work[ MOVE_ITEM ] == 0 ){
		if( PocketKeyCheck() == TRUE ){
			TaskTable[id].TaskAdrs = PocketKeyTask;
			return	TRUE;
		}
	}

	return	FALSE;
}

static void BagMainTask( u8 id )
{
	s16 * wk = TaskTable[id].work;

//	SetPocketArrow( BG2_data, TaskTable[id].work[ARROW_CNT] );
//	DrawScrArrow( BG2_data, TaskTable[id].work[ARROW_CNT] );
//	SetArrowCount( &TaskTable[id].work[ARROW_CNT] );

	if( FadeData.fade_sw )	return;

	if( ItemKeyCheck(id) == TRUE )	return;

	if( sys.Trg & SELECT_BUTTON ){
		if( win_no+1 != SKILL_POCKET && win_no+1 != SEED_POCKET &&
			( scene == FLD_MENU_MODE || scene == BTL_MODE ) )
		{
			if( wk[ MOVE_ITEM ] == 0 ){
				if( bag[win_no].scr+bag[win_no].pos != bag[win_no].item_max ){
					SePlay(SE_SELECT);
					MoveItemInit(id);
				}
			}else{
				if( bag[win_no].scr+bag[win_no].pos != bag[win_no].item_max ){
					SePlay(SE_SELECT);
					MoveItemMain(id);
				}else	MoveItemCancel(id);
			}
			return;
		}
	}

	if( sys.Trg & A_BUTTON ){
		if( bag[win_no].scr+bag[win_no].pos == bag[win_no].item_max ){
			if( wk[ MOVE_ITEM ] == 0 ){
				ReturnItemNo = CHANCEL_ITEM;
				PickItemFunc[ scene ].cancel_func(id);
			}else	MoveItemCancel(id);
		}else{
			if( wk[ MOVE_ITEM ] == 0 ){
				SePlay(SE_SELECT);
				ItemPoint = bag[win_no].scr+bag[win_no].pos;
				ReturnItemNo = PocketItem[ ItemPoint ].item;
				PickItemFunc[ scene ].set_func(id);

				ScrCurActAnmStop( MARK_ACT_U_CURSOR );
				ScrCurActAnmStop( MARK_ACT_D_CURSOR );
				ScrCurActAnmStop( MARK_ACT_L_CURSOR );
				ScrCurActAnmStop( MARK_ACT_R_CURSOR );

			}else	MoveItemMain(id);
		}
		return;
	}

	if( sys.Trg & B_BUTTON ){
		if( wk[ MOVE_ITEM ] == 0 ){
			if( scene != CUBE_BLEND_MODE ){
				ReturnItemNo = CHANCEL_ITEM;
				PickItemFunc[ scene ].cancel_func(id);
			}
		}else	MoveItemCancel(id);
	}
}

//-----------------------------
//		アイテム数を選択
//-----------------------------
u8 SetItemNoKeyCheck( u8 id, u16 lim )
{
	s16 * wk = TaskTable[id].work;

	if( ( sys.Repeat & PLUS_KEY_MASK ) == U_KEY ){
		if( wk[1] != lim )	wk[1]++;
		else				wk[1] = 1;
		return TRUE;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == D_KEY ){
		if( wk[1] != 1 )	wk[1]--;
		else				wk[1] = lim;
		return TRUE;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == R_KEY ){
		if( wk[1]+10 < lim )	wk[1] += 10;
		else					wk[1] = lim;
		return TRUE;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == L_KEY ){
		if( wk[1] > 10 )	wk[1] -= 10;
		else				wk[1] = 1;
		return TRUE;
	}

	return FALSE;
}

static u8 NumCheckKey(u8 id)
{
	s16 * wk = TaskTable[id].work;

	if( SetItemNoKeyCheck( id, PocketItem[ ItemPoint ].no ) == TRUE ){
		if( win_no + 1 == SEED_POCKET ){
			Draw_X_Num( wk[1], NUM_MODE_ZERO, wk[2], wk[3], 3 );
		}else{		
			Draw_X_Num( wk[1], NUM_MODE_ZERO, wk[2], wk[3], 2 );
		}
		return	TRUE;
	}
	return	FALSE;
}


//=========================================================================================
//								フィールドメニューからの処理
//=========================================================================================
//---------------------
//		初期設定
//---------------------
static void FieldMenuBagInit2(void)
{
	if( BagInit2() == TRUE ){
		MakeMenuList();
		AddTask(BagMainTask,0);
	}
}
void FieldMenuBagInit(void)
{
	scene = FLD_MENU_MODE;
	MainProcChange( FieldMenuBagInit2 );
}

//---------------------------------
//		メニューリストを選択
//---------------------------------
static void BagListMainTask(u8 id)
{
	MENUFUNC	func;

	if( ( sys.Repeat & PLUS_KEY_MASK ) == U_KEY ){
		if( ( menu_pos & 1 ) != 0 && menu_list[ menu_pos-1 ] != 8 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuHVCursorSet(-1);
		}
		return;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == D_KEY ){
		if( ( menu_pos & 1 ) == 0 && menu_list[ menu_pos+1 ] != 8 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuHVCursorSet(1);
		}
		return;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == L_KEY ){
		if( menu_pos >= 2 && menu_list[ menu_pos-2 ] != 8 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuHVCursorSet(-2);
		}
		return;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == R_KEY ){
		if( menu_pos < 2 && menu_list[ menu_pos+2 ] != 8 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuHVCursorSet(2);
		}
		return;
	}

	if( sys.Trg & A_BUTTON ){
		ClearMenuWin( BG1_data );
		func = reaction[ menu_list[menu_pos] ].ptr;
		func(id);
		return;
	}

	if( sys.Trg & B_BUTTON ){
		ClearMenuWin( BG1_data );
		func = reaction[ menu_list[3] ].ptr;
		func(id);
	}
}

// タネポケット用
static void BagListMainTask2(u8 id)
{
	MENUFUNC	func;

	if( ( sys.Repeat & PLUS_KEY_MASK ) == U_KEY ){
		if( menu_pos != 0 && menu_list[ menu_pos-1 ] != 8 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuHVCursorSet(-1);
		}
		return;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == D_KEY ){
		if( menu_pos != menu_max-1 && menu_pos != 2 && menu_list[ menu_pos+1 ] != 8 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuHVCursorSet(1);
		}
		return;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == L_KEY ){
		if( menu_pos >= 3 && menu_list[ menu_pos-3 ] != 8 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuHVCursorSet(-3);
		}
		return;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == R_KEY ){
		if( menu_pos < 3 && menu_list[ menu_pos+3 ] != 8 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuHVCursorSet(3);
		}
		return;
	}

	if( sys.Trg & A_BUTTON ){
		ClearMenuWin( BG1_data );
		func = reaction[ menu_list[menu_pos] ].ptr;
		func(id);
		return;
	}

	if( sys.Trg & B_BUTTON ){
		ClearMenuWin( BG1_data );
		func = reaction[ menu_list[5] ].ptr;
		func(id);
	}
}

//-------------------------------------------------
//	通信時のフィールド用メニュー
//-------------------------------------------------
static void SioFldMenuMake(void)
{
	u8	py;
	u8	i;

	menu_list = (u8 * )( &sio_fld_menu[ win_no * 2 ] );

	switch( win_no + 1 ){
	case IMPORTANT_POCKET:
		menu_max = 1;
		py = MENUWINY+2;
		break;
	default:
		// 交換部屋で「ナゾのみ」は「やめる」のみ
		if( ChangeRoomRAMKinomiCheck( ReturnItemNo ) == FALSE ){
			menu_list = (u8 * )( &sio_fld_menu[ ( IMPORTANT_POCKET-1 ) * 2 ] );
			menu_max = 1;
			py = MENUWINY+2;
		}else{
			menu_max = 2;
			py = MENUWINY;
		}
	}

	DrawWhiteBack( BG1_data, MENUWINX+7, py+1, 6, menu_max*2 );
	NMenuWinBoxWrite( MENUWINX+6, py, MENUWINH, py+1+menu_max*2 );
	for( i=0; i<menu_max; i++ )
		NMenuMsgWrite( reaction[ menu_list[i] ].msg, MENUWINX+8, py+1+i*2 );
	NMenuVCursorInit( MENUWINX+7, py+1, menu_max, 0 );
}

static void SioBagListMainTask( u8 id )
{
	MENUFUNC	func;

	if( sys.Repeat & U_KEY ){
		if( menu_pos != 0  ){
			SePlay(SE_SELECT);
			menu_pos = NMenuVCursorSet(-1);
		}
		return;
	}

	if( sys.Repeat & D_KEY ){
		if( menu_pos != menu_max-1 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuVCursorSet(1);
		}
		return;
	}

	if( sys.Trg & A_BUTTON ){
		ClearMenuWin( BG1_data );
		func = reaction[ menu_list[menu_pos] ].ptr;
		func(id);
		return;
	}

	if( sys.Trg & B_BUTTON ){
		ClearMenuWin( BG1_data );
		func = reaction[ 2 ].ptr;
		func(id);
	}
}




//---------------------------
//		アイテム選択
//---------------------------
//キャンセル
static void ReturnFieldMenu(u8 id)
{
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H(FieldMenuRecover);
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L(FieldMenuRecover);
	FPokeNo = 0;
	BagExitInit(id);
}
//決定
static void FieldMenuItemSet(u8 id)
{
	menu_pos = 0;

	PalChangeCursorPut( ITEMWINX, ITEMWINY+2+bag[win_no].pos*2, DUMMY_PALETTE );

	if( ItemToolSioCheck() == TRUE && scene != CUBE_BLEND_MODE ){
		SioFldMenuMake();
		TaskTable[id].TaskAdrs = SioBagListMainTask;
		return;
	}

	DrawUseMenuWin2( BG1_data );

//	ScrCurActAnmStop( MARK_ACT_U_CURSOR );	// スクロールカーソルアニメストップ
//	ScrCurActAnmStop( MARK_ACT_D_CURSOR );	// スクロールカーソルアニメストップ
//	ScrCurActAnmStop( MARK_ACT_L_CURSOR );	// スクロールカーソルアニメストップ
//	ScrCurActAnmStop( MARK_ACT_R_CURSOR );	// スクロールカーソルアニメストップ

	if( win_no != SEED_POCKET-1 || scene == CUBE_BLEND_MODE )
		TaskTable[id].TaskAdrs = BagListMainTask;
	else	TaskTable[id].TaskAdrs = BagListMainTask2;
}

//---------------------
//		終了処理
//---------------------
static void BagExitInit2( u8 id )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	TaskTable[id].TaskAdrs = BagExitTask;
}
static void BagExitInit( u8 id )
{
	SePlay(SE_SELECT);
	BagExitInit2(id);
}

void BagExitTask( u8 id )
{
	s16 * wk = TaskTable[id].work;

	if( FadeData.fade_sw )	return;

	MainProcChange( (void *)RETURN_ADR(	wk[ RETURN_ADR_H ], wk[ RETURN_ADR_L ] ) );
	EvObjPalManInit();
	DelTask(id);
}

//-------------------------------------
//		ポケモンリストからの復帰
//-------------------------------------
void ReturnBagInit(void)
{
	while(1){
		if( BagInit() == TRUE ){
			InitTask();					//タスク初期化
			AddTask( BagMainTask, 0 );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}


//-----------------------------
//		メニュー　"使う"
//-----------------------------
extern void CheckSeedUse(u8);
static void PokeMineZERO( u8 id );

static void FieldItemUse( u8 id )
{
	if(	ItemFldFuncGet( ReturnItemNo ) != NULL ){
		SePlay(SE_SELECT);

		if( PokeCountMineGet() == 0 && ItemFldSysGet( ReturnItemNo ) == 1 ){
			PokeMineZERO( id );
			return;
		}

		TaskTable[id].work[2] = 0;
		if( win_no != SEED_POCKET - 1 )
			ItemFldFuncGet( ReturnItemNo )(id);
		else	CheckSeedUse(id);
	}
}

//-----------------------------------------
//	手持ちポケモンがいない場合
//-----------------------------------------
static void PokeMineZERO( u8 id )
{
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
	SetTalkMsg( id, msg_poke_mine_zero, EndBagItemError, 1 );
}

//---------------------------------------
//		エラー後の復帰処理（バッグ）
//---------------------------------------
static void EndBagItemError2( u8 id )
{
	ReDrawItemName();
	DrawInfoMsg2( ReturnItemNo );	//情報表示
	NMenuVCursorInit(ITEMWINX,ITEMWINY+2,bag[win_no].pos_max+1,bag[win_no].pos);
	ReturnItemSelectTask(id);
}

void EndBagItemError( u8 id )
{
	ClearBGData( BG1_data, 0, 0, 31, 31 );
//	NMenuBoxClear( 0, 0, 30, 20 );
	NMenuBoxClear( ROSTWINX, ROSTWINY-2, ROSTWINX + ROSTWINH, ROSTWINY + ROSTWINV );
	NMenuBoxClear( 1, 14, 28, 19 );
	TaskTable[id].TaskAdrs = EndBagItemError2;
}

//------------------------------------------
//		エラー後の復帰処理（フィールド）
//------------------------------------------
void EndFldItemError( u8 id )
{
	NMenuBoxClear(0,13,29,19);
	DelTask(id);
	TalkEnd();
	ResetForceEvent();
}

//----------------------------------------
//		フィールドへ復帰後の処理設定
//----------------------------------------
void FieldItemUseInit(void)
{
//	FieldFadeControl( FIELD_BLACK_IN, 0 );
	FieldFadeBlackInSet();
	AddTask(FieldItemUseTask,8);
}

//-------------------------------------
//		フィールドへ復帰後の処理
//-------------------------------------
static void FieldItemUseTask(u8 id)
{
//	if(!(FadeData.fade_sw))
	if( FieldFadeinCheck() == 1 )
		FieldReturnItemUse(id);
}

//-----------------------------------
//		メール使用後の復帰処理
//-----------------------------------
void ReturnMailUseInit(void)
{
	while(1){
		if( BagInit() == TRUE ){
			AddTask( BagMainTask, 0 );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

//-------------------------------
//		メニュー　"捨てる"
//-------------------------------
//キャンセル処理
static void NotItemRost(u8 id)
{
	TaskTable[id].work[1] = 0;
	ClearMenuWin( BG1_data );
	DrawInfoMsg2( PocketItem[bag[win_no].scr+bag[win_no].pos].item );
	NMenuVCursorInit(ITEMWINX,ITEMWINY+2,bag[win_no].pos_max+1,bag[win_no].pos);
	ReturnItemSelectTask(id);
}

//はい・いいえウィンドウと確認メッセージ表示
static void DrawYesNoWin(void)
{
	DrawWhiteBack( BG1_data, ROSTWINX+1, ROSTWINY-1, ROSTWINH-1, ROSTWINV+1 );
	YesNoSelectInit( ROSTWINX, ROSTWINY-2 );
}

static void RostYesNoWin( u16 no, u16 r )
{
	GetItemName( no, StrTempBuffer0 );

	if( r >= 100 )	PM_NumMsgSet( StrTempBuffer1, r, NUM_MODE_LEFT, 3 );
	else			PM_NumMsgSet( StrTempBuffer1, r, NUM_MODE_LEFT, 2 );

	//メッセージ表示
	ClearMenuWin( BG1_data );
	NMenuMsgWrite( msg_item_del03, INFOWINX+1, INFOWINY );
	DrawYesNoWin();
}

//"捨てました"と表示
static void YesRostItemMsg(void)
{
	//メッセージ表示
	ClearMenuWin( BG1_data );
	NMenuBoxClear( ROSTWINX, ROSTWINY-3, ROSTWINX+4, ROSTWINY+4 );
	NMenuMsgWrite( msg_item_del02, INFOWINX+1, INFOWINY );
}

//捨てた後のキー入力待ち
static void YesRostItemTask2(u8 id)
{
	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		ReDrawItemName();
		NotItemRost(id);
	}
}

//捨てる（はい）
static void RostPickYes(u8 id)
{
	YesRostItemMsg();
	DelItemInit2(id);
	TaskTable[id].TaskAdrs = YesRostItemTask2;
}
//捨てる（いいえ）
static void RostPickNo(u8 id)
{
	NotItemRost(id);
}

//捨てる数を設定
static void ItemRostTask(u8 id)
{
	if( NumCheckKey(id) == TRUE	)	return;
	
	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		RostYesNoWin( ReturnItemNo, TaskTable[id].work[1] );
		SelectToolInit( id, &YesNoPickFunc[0] );
		return;
	}

	if( sys.Trg & B_BUTTON ){
		SePlay(SE_SELECT);
		NotItemRost(id);
	}
}

//初期処理
static void ItemRost(u8 id)
{
	SePlay(SE_SELECT);

	TaskTable[id].TaskAdrs = ItemRostTask;
	NMenuMsgWrite( msg_item_del01, INFOWINX+1, INFOWINY );

	if( win_no + 1 == SEED_POCKET )
		ItemNumCheckWin( id, ROSTWINX-1, ROSTWINY, ROSTWINH+1, ROSTWINV, 3 );
	else
		ItemNumCheckWin( id, ROSTWINX, ROSTWINY, ROSTWINH, ROSTWINV, 2 );
}

//-------------------------------
//		メニュー　"やめる"
//-------------------------------
static void FieldItemNot(u8 id)
{
	SePlay(SE_SELECT);
	DrawInfoMsg2( ReturnItemNo );
	NMenuVCursorInit(ITEMWINX,ITEMWINY+2,bag[win_no].pos_max+1,bag[win_no].pos);
	ReturnItemSelectTask(id);
}
//-------------------------------
//		メニュー　"とうろく"
//-------------------------------
static void SetEasyButton(u8 id)
{
	SePlay(SE_SELECT);
	if( Fld.cnv_btn == ReturnItemNo ){
		DelBENRI();
		Fld.cnv_btn = 0;
	}else{
		ReDrawBENRI();
		Fld.cnv_btn = ReturnItemNo;
	}
	DrawInfoMsg2( ReturnItemNo );
	NMenuVCursorInit(ITEMWINX,ITEMWINY+2,bag[win_no].pos_max+1,bag[win_no].pos);
	ReturnItemSelectTask(id);
}

//-------------------------------
//		メニュー　"もたせる"
//-------------------------------
//持てない時のボタン待ち
static void NotItemSetTrgWait2( u8 id )
{
	ReDrawItemName();
	DrawInfoMsg2( ReturnItemNo );
	NMenuVCursorInit(ITEMWINX,ITEMWINY+2,bag[win_no].pos_max+1,bag[win_no].pos);
	ReturnItemSelectTask(id);
}
static void NotItemSetTrgWait( u8 id )
{
	if( sys.Trg & A_BUTTON ){
		ClearBGData( BG1_data, 0, 0, 31, 31 );
		NMenuBoxClear( 1, 14, 28, 19 );
		TaskTable[id].TaskAdrs = NotItemSetTrgWait2;
	}
}

//"持てません"と表示
static void NotPokeItem( u8 id )
{
	GetItemName( ReturnItemNo, StrTempBuffer0 );
	PM_MsgExpand( MsgExpandBuffer, msg_item_motenai );
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
	SetTalkMsg( id, MsgExpandBuffer, NotItemSetTrgWait, WHITE_BG );
}

static void SetPokeItem(u8 id)
{
	SePlay(SE_SELECT);

	// 通信時メールを持てないチェック
	if( SioMailNotCheck( ReturnItemNo ) == FALSE ){
		NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		SetTalkMsg( id, msg_bag_sio_meil, NotItemSetTrgWait, WHITE_BG );
		return;
	}

	if( ItemEventGet( ReturnItemNo ) == 0 ){

		if( PokeCountMineGet() == 0 ){
			PokeMineZERO( id );
			return;
		}

		TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( FieldBagPokeListInit );
		TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( FieldBagPokeListInit );
		TaskTable[id].TaskAdrs = BagExitTask;
		UseFldPokeFlg = PM_ITEM_PUT_MODE;
		PaletteFadeReq(0xffffffff,0,0,16,0);
	}else	NotPokeItem( id );
}

//-------------------------------
//		メニュー　"タグをみる"
//-------------------------------
static void SeedTag(u8 id)
{
	BagExitInit(id);
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( SeedTagInit );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( SeedTagInit );
}


//=========================================================================================
//								ポケモンリストからの処理
//=========================================================================================
extern void ReturnFldPokeItemSet(void);

//----------------------------------------------------
//	初期設定
//----------------------------------------------------
static void FieldPokeListRuckInit2(void)
{
	if( BagInit2() == TRUE )
		AddTask(BagMainTask,0);
}
void FieldPokeListRuckInit(void)
{
	scene = FLD_POKELIST_MODE;
	MainProcChange( FieldPokeListRuckInit2 );
}

//----------------------------------------------------
//	アイテム選択
//----------------------------------------------------
//キャンセル
static void CancelFieldPokeList(u8 id)
{
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( ReturnFldPokeItemSet );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( ReturnFldPokeItemSet );
	BagExitInit(id);
}

//決定
static void FldPokeListItemSet(u8 id)
{
	u8	poke = win_no+1;

	// 通信時メールを持てないチェック
	if( SioMailNotCheck( ReturnItemNo ) == FALSE ){
		NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		SetTalkMsg( id, msg_bag_sio_meil, NotItemSetTrgWait, WHITE_BG );
		return;
	}

	//「ナゾのみ」は交換部屋で持たせられない
	if( ChangeRoomRAMKinomiCheck( ReturnItemNo ) == FALSE ){
		GetItemName( ReturnItemNo, StrTempBuffer0 );
		PM_MsgExpand( MsgExpandBuffer, msg_item_motenai02 );
		NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		SetTalkMsg( id, MsgExpandBuffer, NotItemSetTrgWait, WHITE_BG );
		return;
	}

	// 大切なアイテム以外が選択された
	if( poke != IMPORTANT_POCKET && ItemEventGet( ReturnItemNo ) == 0 ){
		TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( ReturnFldPokeItemSet );
		TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( ReturnFldPokeItemSet );
		BagExitInit2(id);
	}else	NotPokeItem( id );
}


//=========================================================================================
//								フレンドショップからの処理
//=========================================================================================
static void CancelFdShop(u8);			//キャンセル
static void NotSale(u8);
static void SaleNumCheckInit(u8);
static void SaleCheck(u8);				//売れるかチェック
static void ItemSaleTask(u8);			//売る数を設定
static void DrawPrice(u16,u16);			//売値表示
static void SaleCancel(u8);				//売るのをキャンセル
static void DrawMyGold(void);			//所持金表示
static void AddMyGold(u16,u8);			//所持金加算

extern void ReturnShopInit(void);		//ショップメニューへ復帰


//---------------------
//		初期設定
//---------------------
static void ShopSaleBagInit2(void)
{
	if( BagInit2() == TRUE )
		AddTask(BagMainTask,0);
}
void ShopSaleBagInit(void)
{
	scene = FD_SHOP_MODE;
	MainProcChange( ShopSaleBagInit2 );
}

//--------------------------
//		アイテム選択
//--------------------------
//キャンセル
static void CancelFdShop(u8 id)
{
	pFieldRecoverFunc = ReturnShopInit;
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( FieldMainRecover );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( FieldMainRecover );
	BagExitInit(id);
}
//売れるかチェック
static void SaleCheck(u8 id)
{
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	PalChangeCursorPut( ITEMWINX, ITEMWINY+2+bag[win_no].pos*2, DUMMY_PALETTE );

	GetItemName( ReturnItemNo, StrTempBuffer1 );

	if(	ItemPriceGet( ReturnItemNo ) == 0 ){
		PM_MsgExpand( MsgExpandBuffer, msg_shop_sell00 );
		SetTalkMsg( id, MsgExpandBuffer, NotSale, WHITE_BG );
	}else{
		PM_MsgExpand( MsgExpandBuffer, msg_shop_sell01 );
		SetTalkMsg( id, MsgExpandBuffer, SaleNumCheckInit, WHITE_BG );
	}
}

//-------------------------
//		売れないとき
//-------------------------
static void NotSale2( u8 id )
{
	ReDrawItemName();
	DrawInfoMsg2( ReturnItemNo );
	NMenuVCursorInit(ITEMWINX,ITEMWINY+2,bag[win_no].pos_max+1,bag[win_no].pos);
	ReturnItemSelectTask(id);
}
static void NotSale( u8 id )
{
	ClearBGData( BG1_data, 0, 0, 31, 31 );
	NMenuBoxClear( 1, 14, 28, 19 );
	TaskTable[id].TaskAdrs = NotSale2;
}

//-----------------------
//		売れるとき
//-----------------------
static void SaleNumCheckInit(u8 id)
{
	TaskTable[id].TaskAdrs = ItemSaleTask;
	DrawWhiteBack( BG1_data, SALEWINX+1, SALEWINY+1, SALEWINH-1, SALEWINV-1 );
	NMenuWinBoxWrite( SALEWINX, SALEWINY, SALEWINX+SALEWINH, SALEWINY+SALEWINV );
	TaskTable[id].work[1] = 1;
	TaskTable[id].work[2] = SALEWINX+1;
	TaskTable[id].work[3] = SALEWINY+1;

	if( win_no + 1 == SEED_POCKET )
		Draw_X_Num( 1, NUM_MODE_ZERO, SALEWINX+1, SALEWINY+1, 3 );
	else	Draw_X_Num( 1, NUM_MODE_ZERO, SALEWINX+1, SALEWINY+1, 2 );

	DrawPrice( ReturnItemNo, 1 );
	DrawMyGold();
}

static void SaleItemMsgEnd3(u8 id)
{
	if( sys.Trg & A_BUTTON ){
		SePlay( SE_SELECT );
		SaleCancel(id);
	}
}
static void SaleItemMsgEnd2(u8 id)
{
	ReDrawItemName();
	NMenuTalkWinWrite();
	NMenuMsgWrite( MsgExpandBuffer, MSGWINX+1, MSGWINY );
	TaskTable[id].TaskAdrs = SaleItemMsgEnd3;
}
static void SaleItemMsgEnd(u8 id)
{
	SePlay( SE_REGI );
	AddMyGold( ReturnItemNo, TaskTable[id].work[1] );
	TaskTable[id].TaskAdrs = SaleItemMsgEnd2;
}

//売る（はい）
static void SalePickYes(u8 id)
{
	NMenuBoxClear( ROSTWINX, ROSTWINY-3, ROSTWINX+ROSTWINH, ROSTWINY+ROSTWINV );
	ClearBGData( BG1_data, ROSTWINX, ROSTWINY-3, ROSTWINH, ROSTWINV+3 );

	GetItemName( ReturnItemNo, StrTempBuffer1 );
	PM_MsgExpand( MsgExpandBuffer, msg_shop_sell03 );
	SetTalkMsg( id, MsgExpandBuffer, SaleItemMsgEnd, WHITE_BG );
	DelItemInit2(id);
}
//売る（いいえ）
static void SalePickNo(u8 id)
{
	NMenuBoxClear( ROSTWINX, ROSTWINY-3, ROSTWINX+ROSTWINH, ROSTWINY+ROSTWINV );
	ClearBGData( BG1_data, ROSTWINX, ROSTWINY-3, ROSTWINH, ROSTWINV+3 );
	SaleCancel(id);
}

//-------------------------
//		売る数を設定
//-------------------------
static void SaleMsgTask(u8 id)
{
	DrawYesNoWin();
	SelectToolInit( id, &YesNoPickFunc[1] );
}

static void ItemSaleTask(u8 id)
{
	if( NumCheckKey(id) == TRUE ){
		NMenuBoxClear( SALEWINX+6, SALEWINY+1, SALEWINX+SALEWINH-1, SALEWINY+1 );
		DrawPrice( ReturnItemNo, TaskTable[id].work[1] );
		return;
	}

	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		NMenuBoxClear( SALEWINX, SALEWINY, SALEWINX+SALEWINH, SALEWINY+SALEWINV );
		ClearBGData( BG1_data, SALEWINX, SALEWINY, SALEWINH, SALEWINV );
		PM_NumMsgSet(
			StrTempBuffer0,
			(ItemPriceGet(ReturnItemNo) >> 1) * TaskTable[id].work[1],
			NUM_MODE_LEFT, 6 );
		PM_MsgExpand( MsgExpandBuffer, msg_shop_sell02 );
		SetTalkMsg( id, MsgExpandBuffer, SaleMsgTask, WHITE_BG );
		return;
	}

	if( sys.Trg & B_BUTTON ){
		SePlay(SE_SELECT);
		SaleCancel(id);
	}
}

//-----------------------------
//		売るのをキャンセル
//-----------------------------
static void SaleCancel2( u8 id )
{
	ReDrawItemName();
	DrawInfoMsg2( PocketItem[ bag[win_no].scr+bag[win_no].pos ].item );	//情報表示
	NMenuVCursorInit(ITEMWINX,ITEMWINY+2,bag[win_no].pos_max+1,bag[win_no].pos);
	ReturnItemSelectTask(id);
}
static void SaleCancel( u8 id )
{
	ClearBGData( BG1_data, 0, 0, 31, 31 );
	DelOkozukaiWin( GOLDWINX, GOLDWINY );
	NMenuBoxClear( 0, GOLDWINY+4, ITEMWINX-1, 13 );
	NMenuBoxClear( 1, 14, 28, 19 );
	TaskTable[id].TaskAdrs = SaleCancel2;
}

//--------------------
//		売値表示
//--------------------
static void DrawPrice( u16 item, u16 no )
{
	PM_NumMsgSet( StrTempBuffer0, (ItemPriceGet(item) >> 1) * no, NUM_MODE_SPACE, 6 );
	NMenuMsgWrite( str_yen, SALEWINX+6, SALEWINY+1 );
	PM_NumMsgSet( StrTempBuffer0, (ItemPriceGet(item) >> 1) * no, NUM_MODE_LEFT, 6 );
}

//----------------------
//		所持金表示
//----------------------
static void DrawMyGold(void)
{
	DrawGoldWin( Fld.my_gold, GOLDWINX, GOLDWINY );
	DrawWhiteBack( BG1_data, GOLDWINX+1, GOLDWINY+1, GOLDWINH-1, GOLDWINV-1 );
}

//----------------------
//		所持金加算
//----------------------
static void AddMyGold(u16 item,u8 no)
{
	AddGold( &Fld.my_gold, (ItemPriceGet(item) >> 1) * no);
	DrawWinOkozukai( Fld.my_gold, GOLDWINX, GOLDWINY );
}


//=========================================================================================
//										タネの処理
//=========================================================================================
//----------------------------------------------------
//	初期設定
//----------------------------------------------------
static void FieldSeedBagInit2(void)
{
	if( BagInit2() == TRUE )
		AddTask( BagMainTask, 0 );
}
void FieldSeedBagInit(void)
{
	win_no = SEED_POCKET-1;		//ウィンドウ番号
	scene  = FLD_SEED_MODE;
	MainProcChange( FieldSeedBagInit2 );
}

//----------------------------------------------------
//	アイテム選択
//----------------------------------------------------
//キャンセル
static void CancelSeed( u8 id )
{
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( FieldScriptRecoverBGMNotStart );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( FieldScriptRecoverBGMNotStart );
	BagExitInit(id);
}

//決定
static void FldSeedItemSet( u8 id )
{
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( FieldScriptRecoverBGMNotStart );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( FieldScriptRecoverBGMNotStart );
	BagExitInit2(id);
}


//=========================================================================================
//								通信キューブブレンド処理
//=========================================================================================
extern void BlendMachineInit(void);

static void MakeBlendMenu( void );

//----------------------------------------------------
//	初期設定
//----------------------------------------------------
static void CubeBlendBagInit2(void)
{
	while(1){
		if( BagInit() == TRUE ){
			AddTask( BagMainTask, 0 );
			MakeBlendMenu();
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}
void CubeBlendBagInit(void)
{
	win_no = SEED_POCKET-1;		//ウィンドウ番号
	scene  = CUBE_BLEND_MODE;
	MainProcChange( CubeBlendBagInit2 );
}

//----------------------------------------------------
//	メニューリスト作成
//----------------------------------------------------
static void MakeBlendMenu( void )
{
	menu_list = (u8 *)blend_menu;
	menu_max = FLD_MENU_MAX;
}

//----------------------------------------------------
//	アイテム選択
//----------------------------------------------------
//キャンセル
static void CancelBlend( u8 id )
{
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( BlendMachineInit );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( BlendMachineInit );
	BagExitInit(id);
}

//決定
static void CubeBlendItemSet( u8 id )
{
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( BlendMachineInit );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( BlendMachineInit );
	BagExitInit2(id);
}


//=========================================================================================
//									道具あずかり処理
//=========================================================================================
//----------------------------------------------------
//	初期設定
//----------------------------------------------------
static void MyPC_BagInit2(void)
{
	if( BagInit2() == TRUE )
		AddTask( BagMainTask, 0 );
}
void MyPC_BagInit(void)
{
	scene = MY_PC_MODE;
	MainProcChange( MyPC_BagInit2 );
}

//----------------------------------------------------
//	アイテム選択
//----------------------------------------------------
// キャンセル
static void CancelMyPC( u8 id )
{
	pFieldRecoverFunc = MyPC_ItemPutReturn;
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( FieldMainRecover );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( FieldMainRecover );
	BagExitInit(id);
}


// "あずけました"と表示
static void MyPC_ItemPutEnd( u8 id )
{
	s16 * wk = TaskTable[id].work;

	ClearMenuWin( BG1_data );
	GetItemName( ReturnItemNo, StrTempBuffer0 );
	PM_NumMsgSet( StrTempBuffer1, wk[1], NUM_MODE_LEFT, 3 );
	NMenuBoxClear( ROSTWINX, ROSTWINY-3, ROSTWINX+4, ROSTWINY+4 );
	NMenuMsgWrite( msg_item_box_put01, INFOWINX+1, INFOWINY );
	DelItemInit2(id);
	TaskTable[id].TaskAdrs = YesRostItemTask2;
}

// あずけられない
static void MyPC_SetOver( u8 id )
{
	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		SePlay(SE_SELECT);
		NotItemRost(id);
	}
}

// あずけられるか
static void MyPC_SetCheck( u8 id )
{
	s16 * wk = TaskTable[id].work;

	if( ItemEventGet( ReturnItemNo ) == 2 ){
		TaskTable[id].TaskAdrs = MyPC_SetOver;
		NMenuBoxClear( INFOWINX+1, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		NMenuMsgWrite( msg_item_box_put03, INFOWINX+1, INFOWINY );
		return;
	}

	if( AddPCBoxItem( ReturnItemNo, (u16)wk[1] ) == TRUE ){
		MyPC_ItemPutEnd(id);
	}else{
		TaskTable[id].TaskAdrs = MyPC_SetOver;
		NMenuBoxClear( INFOWINX+1, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
		NMenuMsgWrite( msg_item_box_put02, INFOWINX+1, INFOWINY );
	}
}

// あずける数を設定
static void MyPC_SetMain( u8 id )
{
	if( NumCheckKey(id) == TRUE )	return;
	
	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		ClearMenuWin( BG1_data );
		MyPC_SetCheck(id);
		return;
	}

	if( sys.Trg & B_BUTTON ){
		SePlay(SE_SELECT);
		NotItemRost(id);
	}
}

// 初期処理
static void MyPC_SetInit(u8 id)
{
	SePlay(SE_SELECT);

	NMenuBoxClear( INFOWINX+1, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );

	if( win_no + 1 != IMPORTANT_POCKET ){
		TaskTable[id].TaskAdrs = MyPC_SetMain;
		NMenuMsgWrite( msg_item_box_put00, INFOWINX+1, INFOWINY );

		if( win_no + 1 == SEED_POCKET )
			ItemNumCheckWin( id, ROSTWINX-1, ROSTWINY, ROSTWINH+1, ROSTWINV, 3 );
		else
			ItemNumCheckWin( id, ROSTWINX, ROSTWINY, ROSTWINH, ROSTWINV, 2 );
	}else{
		TaskTable[id].work[1] = 1;
		MyPC_SetCheck(id);
	}
}


//=========================================================================================
//									べんりボタン処理
//=========================================================================================
extern const VM_CODE benri_button_no_item[];

int CheckCnvButton(void)
{
	u8	id;

	EraseMapName();

	if( Fld.cnv_btn != 0 ){
		if( ItemCheck( Fld.cnv_btn, 1 ) == TRUE ){
			SetForceEvent();
			EvObjPauseAll();
			HeroAcmdForceStop();
			SetHeroMoveStateInit();		//自機状態（ダニエルとか…）のクリア
			ReturnItemNo = Fld.cnv_btn;
			id = AddTask( ItemFldFuncGet( Fld.cnv_btn ), 8 );
			TaskTable[id].work[2] = 1;
			return TRUE;
		}else	Fld.cnv_btn = 0;
	}

	StartFieldScript( benri_button_no_item );

	return TRUE;
}


//=========================================================================================
//									戦闘からの処理
//=========================================================================================
// バトル用メニュー
static const u8 btl_menu00[] = { 4, 5 };
static const u8 btl_menu01 = 5;

//----------------------------------------------------
//	初期設定
//----------------------------------------------------
static void BtlRuckInit2(void)
{
	while(1){
		if( BagInit() == TRUE ){
			AddTask( BagMainTask, 0 );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}
void BtlRuckInit(void)
{
	menu_pos = 0;	//メニュー選択カーソルポイント
	scene = BTL_MODE;
	MainProcChange( BtlRuckInit2 );
}

//----------------------------------------------------
//	メニューウィンドウ表示
//----------------------------------------------------
static void DrawBtlMenuWin( u16 * BG )
{
	u8	p;

	p = ( menu_max - 1 ) << 1;

	PalChangeCursorPut( ITEMWINX, ITEMWINY+2+bag[win_no].pos*2, DUMMY_PALETTE );
	NMenuBoxClear( INFOWINX, INFOWINY, INFOWINX+INFOWINH, INFOWINY+INFOWINV );
	NMenuWinBoxWrite( BTL_MENUWINX, MENUWINY+2-p, 13, MENUWINY+5 );
	DrawWhiteBack( BG, 8, MENUWINY+3-p, 5, 2+p );
	if( menu_max == 1 ){
		NMenuMsgWrite( reaction[ menu_list[0] ].msg, BTL_MENUWINX+2, MENUWINY+3 );
	}else{
		NMenuMsgWrite( reaction[ menu_list[0] ].msg, BTL_MENUWINX+2, MENUWINY+1 );
		NMenuMsgWrite( reaction[ menu_list[1] ].msg, BTL_MENUWINX+2, MENUWINY+3 );
	}
	NMenuVCursorInit( BTL_MENUWINX+1, MENUWINY+3-p, menu_max, 0 );
	NMenuMsgWrite( msg_bag_dousuru, INFOWINX+1, INFOWINY );
}

//----------------------------------------------------
//	メニューリストを選択
//----------------------------------------------------
static void BtlBagMenuTask(u8 id)
{
	MENUFUNC	func;

	if( ( sys.Repeat & PLUS_KEY_MASK ) == U_KEY ){
		if( menu_pos == 1 ){
			SePlay(SE_SELECT);
			menu_pos = NMenuVCursorSet(-1);
		}
		return;
	}

	if( ( sys.Repeat & PLUS_KEY_MASK ) == D_KEY ){
		if( menu_pos+1 < menu_max ){
			SePlay(SE_SELECT);
			menu_pos = NMenuVCursorSet(1);
		}
		return;
	}

	if( sys.Trg & A_BUTTON ){
		ClearMenuWin( BG1_data );
		func = reaction[ menu_list[menu_pos] ].ptr;
		func(id);
		return;
	}

	if( sys.Trg & B_BUTTON ){
		ClearMenuWin( BG1_data );
		func = reaction[5].ptr;
		func(id);
	}
}

//----------------------------------------------------
//	アイテム選択
//----------------------------------------------------
// メニューリスト作成
static void MakeBtlMenuList( void )
{
	if( ItemBtlSysGet( ReturnItemNo ) != 0 ){
		menu_list = (u8 *)(btl_menu00);
		menu_max = 2;
	}else{
		menu_list = (u8 *)(&btl_menu01);
		menu_max = 1;
	}
}

//決定
static void BtlItemSet(u8 id)
{
	menu_pos = 0;
	MakeBtlMenuList();
	DrawBtlMenuWin( BG1_data );
	TaskTable[id].TaskAdrs = BtlBagMenuTask;
}

//----------------------------------------------------
//	戻り先アドレスをセットしてバッグを終了
//----------------------------------------------------
void SetBattleReturnAddress( u8 id )
{
	TaskTable[id].work[ RETURN_ADR_H ] = GET_ADR_H( BtlItemReturn );
	TaskTable[id].work[ RETURN_ADR_L ] = GET_ADR_L( BtlItemReturn );
	TaskTable[id].TaskAdrs = BagExitTask;
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
}

//----------------------------------------------------
//	キャンセル時のパラメータセット
//----------------------------------------------------
static void SetCancelParam(u8 id)
{
	SePlay( SE_SELECT );
	SetBattleReturnAddress( id );
}

//----------------------------------------------------
//	メニュー　"使う"
//----------------------------------------------------
static void BtlItemUse(u8 id)
{
	if( ItemBtlFuncGet( ReturnItemNo ) != NULL ){
		SePlay(SE_SELECT);
		ItemBtlFuncGet( ReturnItemNo )(id);
	}
}

//----------------------------------------------------
//	メニュー　"やめる"
//----------------------------------------------------
static void BtlItemNot(u8 id)
{
	SePlay(SE_SELECT);
	NMenuVCursorInit( ITEMWINX, ITEMWINY+2, bag[win_no].pos_max+1, bag[win_no].pos );
	DrawInfoMsg2( ReturnItemNo );
	ReturnItemSelectTask(id);
}



//=========================================================================================
//										捕獲デモ
//=========================================================================================
#define	DEMO_NORMAL_POKE	( (MINEITEM *)&UserWork[0x1e000] )
#define	DEMO_BALL_POKE		( (MINEITEM *)&UserWork[0x1f000] )

#define	DEMO_ONE_SYNC	0x66
//#define	DEMO_ONE_SYNC	0x7f
#define	DEMO_NO_1		( DEMO_ONE_SYNC * 1 )
#define	DEMO_NO_2		( DEMO_ONE_SYNC * 2 )
#define	DEMO_NO_3		( DEMO_ONE_SYNC * 3 )

static void DemoMainTask( u8 id );

//----------------------------------------------------
//	初期設定
//----------------------------------------------------
static void PokeGetDemoBagInit2(void)
{
	u8	id = 0;

	while(1){
		if( BagInit() == TRUE ){
			id = AddTask( DemoMainTask, 0 );
			TaskTable[id].work[ DEMO_CNT ] = 0;
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}
void PokeGetDemoBagInit(void)
{
	u8	i;

	menu_pos = 0;				// メニュー選択カーソルポイント
	win_no = NORMAL_POCKET-1;	// ウィンドウ番号

	// カウンタクリア
	for( i=0; i<BAG_POCKET_MAX; i++ ){
		bag[i].pos = 0;
		bag[i].scr = 0;
	}

	// 道具ポケット、ボールポケットのアイテムを退避
	memcpy( DEMO_NORMAL_POKE, Fld.MyNormalItem, sizeof(MINEITEM)*MY_NORMAL_ITEM_MAX );
	memcpy( DEMO_BALL_POKE, Fld.MyBallItem, sizeof(MINEITEM)*MY_BALL_ITEM_MAX );

	// 道具ポケット、ボールポケットのアイテムを初期化
	ItemDataInit( Fld.MyNormalItem, MY_NORMAL_ITEM_MAX );
	ItemDataInit( Fld.MyBallItem, MY_BALL_ITEM_MAX );
	AddItem( ITEM_KIZUGUSURI, 1 );
	AddItem( ITEM_MONSUTAABOORU, 1 );

	scene = POKE_GET_DEMO_MODE;
	MainProcChange( PokeGetDemoBagInit2 );
}

//----------------------------------------------------
//	モンスターボールを選択
//----------------------------------------------------
static void DemoMainTask( u8 id )
{
	s16 * wk = TaskTable[id].work;
/*
	// ポケット矢印のBGアニメ
	if( wk[DEMO_CNT] < DEMO_NO_2 ){
		SetPocketArrow( BG2_data, wk[ARROW_CNT] );
		DrawScrArrow( BG2_data, wk[ARROW_CNT] );
		SetArrowCount( &wk[ARROW_CNT] );
	}
*/
	switch( wk[DEMO_CNT] ){
	// ページ変更
	case DEMO_NO_1:
		SePlay( SE_SELECT );
		PocketKeySet( 1, 2 );
		break;

	// ボール決定 → メニュー表示
	case DEMO_NO_2:
		SePlay( SE_SELECT );
		ScrCurActAnmStop( MARK_ACT_L_CURSOR );
		ScrCurActAnmStop( MARK_ACT_R_CURSOR );
		ReturnItemNo = ITEM_MONSUTAABOORU;
		menu_list = (u8 *)(btl_menu00);
		menu_max = 2;
		DrawBtlMenuWin( BG1_data );
		break;

	// メニュー決定 → バッグを閉じる
	case DEMO_NO_3:
		SePlay( SE_SELECT );
		ClearMenuWin( BG1_data );

		memcpy( Fld.MyNormalItem, DEMO_NORMAL_POKE, sizeof(MINEITEM) * MY_NORMAL_ITEM_MAX );
		memcpy( Fld.MyBallItem, DEMO_BALL_POKE, sizeof(MINEITEM) * MY_BALL_ITEM_MAX );

		wk[ RETURN_ADR_H ] = GET_ADR_H( BtlItemReturn );
		wk[ RETURN_ADR_L ] = GET_ADR_L( BtlItemReturn );
		TaskTable[id].TaskAdrs = BagExitTask;
		PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
		return;
	}

	wk[DEMO_CNT]++;
}
