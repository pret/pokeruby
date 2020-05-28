//=========================================================================================
//										キューブケース
//									2002/02/25 by nakahiro
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
#include "cube_def.h"
#include "cubecase.h"
#include "cubedemo.h"
#include "mus_tool.h"
#include "safari.h"
#include "fld_task.h"
#include "fight.h"
#include "message.h"
#include "decord.h"
#include "MaDefine.h"
#include "fld_sio.h"
#include "laster.h"

#include "../data/cubelike.h"

//=========================================================================================
//										シンボル
//=========================================================================================
// パラメータ名表示座標
#define	PARAM_MSG_LX	2
#define	PARAM_MSG_RX	8
#define	PARAM_MSG_SY	13

// パラメータ表示座標
#define	PARAM_CUBE_SX		1
#define	PARAM_CUBE_SY		13

// パラメータキャラ番号
#define	PARAM_NORMAL_BG		0xf		// なし
#define	PARAM_CUBE_BG		0x17	// あり

// キューブ名表示座標
#define	CUBE_NAME_SX	16
#define	CUBE_NAME_SY	1
#define	CUBE_NAME_EX	( CUBE_NAME_SX + 12 )
#define	CUBE_NAME_EY	( CUBE_NAME_SY + 17 )
#define	CUBE_LvM_X		( CUBE_NAME_SX + 9 )	// キューブ「Lv」表示座標
#define	CUBE_LvNum_X	( CUBE_NAME_SX + 10 )	// キューブLv表示座標 

#define	POS_MAX			8	// キューブ選択カーソル最大値

// メニューウィンドウ表示座標
#define	MENU_WIN_SX		7
#define	MENU_WIN_SY		4
#define	MENU_WIN_EX		( MENU_WIN_SX + 6 )
#define	MENU_WIN_EY		( MENU_WIN_SY + 7 )

#define	MENU_MAX		3	// メニュー最大数

// はい/いいえ選択ウィンドウ表示位置
#define	YESNO_WIN_SX	7
#define	YESNO_WIN_SY	6
#define	YESNO_WIN_EX	( YESNO_WIN_SX + 6 )
#define	YESNO_WIN_EY	( YESNO_WIN_SY + 5 )

// メッセ－ジウィンドウ表示座標
#define MSG_WIN_SX		1
#define MSG_WIN_SY		14
#define MSG_WIN_EX		( MSG_WIN_SX + 27 )
#define MSG_WIN_EY		( MSG_WIN_SY + 5 )

//「ポロックケース」表示座標
#define	CUBECASE_NAME_X		3
#define	CUBECASE_NAME_Y		1

// スクロールカーソル表示座標
#define	CUBECASE_SCR_CUR_X		176
#define	CUBECASE_SCR_CUR_UY		8
#define	CUBECASE_SCR_CUR_DY		152

// ケース表示座標
#define	CUBECASE_ACT_X	56
#define	CUBECASE_ACT_Y	64

#define	CUBECASE_ID		14800	// ケースのセル/パレットID

// キューブ名ウィンドウのキャラ番号
#define	CUBENAME_NORMAL_BG		5			// 未選択
#define	CUBENAME_SELECT_BG		0x1005		// 選択
#define	CUBENAME_CHANGE_BG		0x2005		// 交換
#define	CUBENAME_NORMAL_LV		0x14		// Lv未選択
#define	CUBENAME_SELECT_LV		0x1014		// Lv選択
#define	CUBENAME_CHANGE_LV		0x2014		// Lv交換

#define	GRAPHIC_CNT		UserWork[0x20000-1]
#define	CUBECASE_ACT_NO	UserWork[0x20000-2]


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void FieldBagPokeListInit(void);
extern void ReturnBagInit(void);

static u8 CubeCaseGraphicSet(void);		// グラフィックセット

static void CubeSortZERO(void);			// キューブソート
static void CubeCaseMainTask(u8);		// キューブ選択
static void CubeSelectBG(u8);
static void CubeCaseReturnInit(u8);		// バッグへ復帰
static void DrawCubeCaseWin(void);		// "キューブケース"と表示
static void DrawCubeParam(void);		// パラメータ表示
static void DrawCubeNameWin(u8);		// キューブ名表示
static void CubeMaxCheck(void);			// 手持ち数をチェック

static void CubePosChangeTask(u8);		// キューブ入れ替え
static void ChangeBarPut( u8, u8 );
static void CubeChange(u8);

static void CubeMenuInit(u8);
static void CubeMenuMain(u8);
static void CubeUse(u8);			// つかう
static void CubeDelInit(u8);		// すてる
static void CubeCancel(u8);			// やめる
static void CubeUseSafariBtl(u8);	// つかう（サファリの戦闘）
static void CubeUseSafariTbl(u8);	// つかう（サファリのキューブ置き場）

// 捨てる処理
static void CubeDelYesNoInit(u8);	// はい・いいえ
static void CubeDelYes(u8);			// はい
static void CubeDelDraw(u8);		// 捨てる終了
static void CubeDelEnd(u8);			// 捨てる終了

static void CubeCaseActMove( actWork * act );

void SetDummyCube(void);		// ダミーデータをセット


//=========================================================================================
//									グローバル変数
//=========================================================================================
extern u16	ReturnItemNo;		// 選択したキューブの配列番号を格納
extern u8	UseFldPokeFlg;		// つかう/もたせる/キューブ

static u8	scene = 0;			// 呼ばれた場所

// 戻り先 ( sys.pReturnProc にセット )
static void (* const ReturnProc[])() = {
	ReturnBagInit,		// バッグ（フィールド）
	FieldMainRecover,	// 便利ボタン
	BtlItemReturn,		// バトル（サファリ）
	FieldMainRecover,	// キューブ置き場
};

const u8 * const cube_name[] = {
	NULL,				// 00:ダミー
	cube_name01,		// 01:あかいキューブ
	cube_name02,		// 02:あおいキューブ
	cube_name03,		// 03:ももいろキューブ
	cube_name04,		// 04:みどりのキューブ
	cube_name05,		// 05:きいろのキューブ
	cube_name06,		// 06:むらさきキューブ
	cube_name07,		// 07:こんいろキューブ
	cube_name08,		// 08:ちゃいろキューブ
	cube_name09,		// 09:そらいろキューブ
	cube_name10,		// 10:きみどりキューブ
	cube_name11,		// 11:はいいろキューブ
	cube_name12,		// 12:くろいキューブ
	cube_name13,		// 13:しろいキューブ
	cube_name14,		// 14:きんいろキューブ
};

static BAG_STATUS	cube = { 0, 0, 0, 0 };

static const MENU_ITEM	menu[] =
{
	{ str_tukau,  CubeUse          },	// 00:つかう
	{ str_suteru, CubeDelInit      },	// 01:すてる
	{ str_yameru, CubeCancel       },	// 02:やめる
	{ str_tukau,  CubeUseSafariBtl },	// 03:つかう（サファリの戦闘）
	{ str_tukau,  CubeUseSafariTbl },	// 04:つかう（サファリのキューブ置き場）
};

static const u8 normal_menu[]  = { 0, 1, 2 };
static const u8 safari_menu[]  = { 3, 2 };
static const u8 cubetbl_menu[] = { 4, 2 };
static u8 * menu_list;
static u8 menu_max = 0;

//はい・いいえ処理
static const SELECT_ITEM	DelYesNoFunc = { CubeDelYes, CubeDelEnd };

// 味で上がるパラメータ
const u8 cude_param_up[] = {
	ID_style,		// かっこよさ（辛い）
	ID_beautiful,	// うつくしさ（渋い）
	ID_cute,		// かわいさ　（甘い）
	ID_clever,		// かしこさ　（苦い）
	ID_strong,		// たくましさ（酸っぱい）
};

// ケースのアクターデータ
static const ActOamData CubeCase_OamData = {
	0,		//u32 VPos:8;			// Ｙ座標
	0,		//u32 AffineMode:2;		// アフィンモード
	0,		//u32 ObjMode:2;		// ＯＢＪモード
	OFF,	//u32 Mosaic:1;			// モザイク
	0,		//u32 ColorMode:1;		// １６色/２５６色 選択
	0,		//u32 Shape:2;			// ＯＢＪ形状

	0,		//u32 HPos:9;			// Ｘ座標
	0,		//u32 AffineParamNo:5;	// アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;			// ＯＢＪサイズ

	0,		//u32 CharNo:10;		// キャラクタＮｏ
	2,		//u32 Priority:2;		// 表示優先
	0,		//u32 Pltt:4;			// パレットＮｏ
	0,
};

static const actAnm CubeCase_Anm00[] =
{
	{ OBJ16_64x64 * 0, 0, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 }
};

static const actAnm * const CubeCase_AnmTbl[] = {
	CubeCase_Anm00,
};

static const actAffAnm CubeCaseAffAnm00[] =
{
	{ 0, 0, -2, 2 },
	{ 0, 0, 2, 4 },
	{ 0, 0, -2, 4 },
	{ 0, 0, 2, 2 },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const CubeCaseAffTbl[] =
{
	CubeCaseAffAnm00,
};


const CellData CubeCase_Cell = {
	(void *)polock_c_pch_ADRS, OBJ_SIZE16_64x64 * 1, CUBECASE_ID
};

const PalData CubeCase_Pal = { (void *)polock_c_pcl_ADRS, CUBECASE_ID };

static const actHeader CubeCase_Header = {
	CUBECASE_ID,
	CUBECASE_ID,
	&CubeCase_OamData,
	CubeCase_AnmTbl,
	0,
	DummyActAffTbl,
	DummyActMove,
};


// ダミーキューブデータ
static const CUBE	dumy_data[] = {
	{  1,20, 0, 0, 0, 0,20 },
	{  2, 0,20, 0, 0, 0,20 },
	{  3, 0, 0,20, 0, 0,20 },
	{  4, 0, 0, 0,20, 0,20 },
	{  5, 0, 0, 0, 0,20,20 },
#ifdef	PM_DEBUG
	{  6,20, 0,20, 0, 0,20 },
	{  7, 0,20, 0,20, 0,20 },
	{  8, 0, 0,20, 0,20,20 },
	{  9,20, 0, 0,20, 0,20 },
	{ 10, 0,20, 0, 0,20,20 },
	{ 11, 0, 2, 0, 2, 2, 0 },
	{ 12, 3, 3, 3, 4, 3, 0 },
	{ 13, 1, 1, 1, 1, 1, 1 },
	{ 14,20, 0, 0, 0, 0,20 },

	{  0, 0, 0, 0, 0, 0, 0 },
#endif	PM_DEBUG
};

//------------------
//		メイン
//------------------
static void CubeCaseMain(void)
{
	JumpActor();
	SetActor();
	MainTask();
	PaletteAnime();
}

//--------------------
//		割り込み
//--------------------
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();

	DIV_DMACOPY( 3, BG2_data, BG_VRAM+0x7800, 0x800, 16 );
}
//--------------------
//		初期設定
//--------------------
static u8 CubeCaseInit2(void)
{
	switch( sys.InitSeqWork ){
	case 0:
		InitHVBlankFunc();				// HVBlank初期化
		ItemToolAGBRegInit();			// レジスタ初期化

		*(vu16 *)REG_BG2CNT = BG_COLOR_16					// 16色選択
							| BG_SCREEN_SIZE_0				// スクリーンサイズ
							| BG_PRIORITY_2					// BG優先順位
							| 15 << BG_SCREEN_BASE_SHIFT	// スクリーンベースブロック
							| 3 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック

		*(vu16 *)REG_BLDCNT = 0;

		sys.InitSeqWork++;
		break;

	case 1:
		LasterInit();
		sys.InitSeqWork++;
		break;

	case 2:
		PaletteAnimeInit();			// ﾊﾟﾚｯﾄｱﾆﾒ 初期化
		FadeData.trans_stop = 1;
		sys.InitSeqWork++;
		break;

	case 3:
		InitActor();				// ｱｸﾀｰ初期化
		sys.InitSeqWork++;
		break;

	case 4:
		if( scene != BTL_CUBECASE_ID )
			InitTask();
		sys.InitSeqWork++;
		break;

	case 5:
		PrintScreenInit( CUBECASE_TYPE );	// ﾒｯｾｰｼﾞ表示領域初期化
		sys.InitSeqWork++;
		break;

	case 6:
		PrintScreenInit( CUBECASE_TYPE2 );	// ﾒｯｾｰｼﾞ表示領域初期化
		sys.InitSeqWork++;
		break;

	case 7:
		NMenuScreenInitStart( CUBECASE_TYPE );
		sys.InitSeqWork++;
		break;

	case 8:
		if ( NMenuScreenInitMain() == FALSE ) break;
		sys.InitSeqWork++;
		break;

	case 9:
		NMenuScreenInitStart( CUBECASE_TYPE2 );
		sys.InitSeqWork++;
		break;

	case 10:
		if ( NMenuScreenInitMain() == FALSE ) break;
		GRAPHIC_CNT = 0;
		sys.InitSeqWork++;
		break;

	case 11:
		if( CubeCaseGraphicSet() == FALSE )	break;
		sys.InitSeqWork++;
		break;

	case 12:
		ScrActInit();	// アクター番号初期化
		AddMarkPal();	// マークパレットセット
		AddScrCurActor( MARK_ACT_U_CURSOR, CUBECASE_SCR_CUR_X, CUBECASE_SCR_CUR_UY );
		AddScrCurActor( MARK_ACT_D_CURSOR, CUBECASE_SCR_CUR_X, CUBECASE_SCR_CUR_DY );
		sys.InitSeqWork++;
		break;

	case 13:
		CUBECASE_ACT_NO = CubeCaseActSet( CUBECASE_ACT_X, CUBECASE_ACT_Y, 0 );
		sys.InitSeqWork++;
		break;

	case 14:
		CubeSortZERO();			// キューブソート
		CubeMaxCheck();			// 手持ち数をチェック
		sys.InitSeqWork++;
		break;

	case 15:
		DrawCubeCaseWin();			// "キューブケース"と表示
		DrawCubeParam();			// パラメータ表示
		DrawCubeNameWin(cube.scr);	// キューブ名表示
		sys.InitSeqWork++;
		break;

	case 16:
		REG_IE_SET( V_BLANK_INTR_FLAG );
	    *(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

		SetVBlankFunc( VInterFunc );			//割込み関数設定(VBLANK)
	
		*(vu16 *)REG_DISPCNT = DISP_MODE_0			// BGモード 
							 | DISP_OBJ_CHAR_1D_MAP	// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							 | DISP_BG2_ON			// BG2有効
							 | DISP_BG1_ON			// BG1有効
							 | DISP_BG0_ON			// BG0有効
							 | DISP_OBJ_ON;
		sys.InitSeqWork++;
		break;

	case 17:
		if( FieldRecvFifoClearWait() == TRUE )	break;
		sys.InitSeqWork++;
		break;

	case 18:
		PaletteFadeReq(0xffffffff,0,16,0,0);
		FadeData.trans_stop = 0;
		MainProcChange( CubeCaseMain );
		return	TRUE;
	}

	return	FALSE;
}

void CubeCaseInit(void)
{
	while(1){
		if( CubeCaseInit2() == TRUE ){
			AddTask( CubeCaseMainTask, 0 );
			break;
		}
		if( ItemToolSioCheck() == TRUE )	break;
	}
}

//----------------------------------------------
//	グラフィックセット
//----------------------------------------------
static u8 CubeCaseGraphicSet(void)
{
	switch( GRAPHIC_CNT ){
	case 0:
		DecordVram( (void*)polock_b_pch_ADRS, (void*)(BG_VRAM+0xc000) );
		GRAPHIC_CNT++;
		break;
	case 1:
		DecordWram( (void*)polock_psc_ADRS, (void *)BG2_data );
		GRAPHIC_CNT++;
		break;
	case 2:
		DecordPaletteWork( (void*)polock_b_pcl_ADRS, PA_BG0+PA_COL0, 0xc0 );
		GRAPHIC_CNT++;
		break;
	case 3:
		DecordCellSet( (CellData*)&CubeCase_Cell );
		GRAPHIC_CNT++;
		break;
	case 4:
		DecordPalSet( (PalData*)&CubeCase_Pal );
		GRAPHIC_CNT = 0;
		return	TRUE;
	}
	return	FALSE;
}

//----------------------------------------------
//	キューブケースOBJセット
//----------------------------------------------
u8 CubeCaseActSet( s16 x, s16 y, u8 pri )
{
	return	AddActor( &CubeCase_Header, x, y, pri );
}


//----------------------------------------------
//		キューブケースのパラメータをセット
//----------------------------------------------
void CubeCaseCall( u8 id )
{
	scene = id;

	switch( scene ){
	case BTL_CUBECASE_ID:
		menu_list = (u8 *)safari_menu;
		menu_max  = 2;
		break;
	case PUT_CUBECASE_ID:
		menu_list = (u8 *)cubetbl_menu;
		menu_max  = 2;
		break;
	default:
		menu_list = (u8 *)normal_menu;
		menu_max  = 3;
	}
}

//--------------------------------------
//		サファリの戦闘から呼び出し
//--------------------------------------
void BtlCubeCaseCall(void)
{
	CubeCaseCall( BTL_CUBECASE_ID );
	MainProcChange( CubeCaseInit );
}

//------------------------------------------------
//		サファリのキューブ置き場から呼び出し
//------------------------------------------------
void SafariTblCubeCaseCall(void)
{
	CubeCaseCall( PUT_CUBECASE_ID );
	MainProcChange( CubeCaseInit );
}

//--------------------------------
//		ダミーデータをセット
//--------------------------------
#ifdef	PM_DEBUG
void SetDummyCube(void)
{
	u8	i;

	for( i=0; i<MY_CUBE_MAX; i++ ){
		if( dumy_data[i].type == 0 )	break;
		Fld.MyCube[i] = dumy_data[i];
	}
}
#endif	PM_DEBUG

//------------------------------------
//		"キューブケース"と表示
//------------------------------------
static void DrawCubeCaseWin(void)
{
	NMenuContextChange( CUBECASE_TYPE );
	NMenuMsgWrite( ItemNameGet( ITEM_POROKKUKEESU ), CUBECASE_NAME_X, CUBECASE_NAME_Y );
}

//---------------------------
//		パラメータ表示
//---------------------------
static void DrawCubeParam(void)
{
	NMenuContextChange( CUBECASE_TYPE );

	NMenuMsgWrite( str_cube_parm00, PARAM_MSG_LX, PARAM_MSG_SY );
	NMenuMsgWrite( str_cube_parm01, PARAM_MSG_LX, PARAM_MSG_SY+2 );
	NMenuMsgWrite( str_cube_parm02, PARAM_MSG_LX, PARAM_MSG_SY+4 );

	NMenuMsgWrite( str_cube_parm03, PARAM_MSG_RX, PARAM_MSG_SY );
	NMenuMsgWrite( str_cube_parm04, PARAM_MSG_RX, PARAM_MSG_SY+2 );

//	NMenuMsgWrite( str_cube_parm06, PARAM_MSG_RX-1, PARAM_MSG_SY+4 );
}

//--------------------------
//		キューブ名表示
//--------------------------
static void DrawCubeName( u8 no )
{
	u8	i, py;

	NMenuContextChange( CUBECASE_TYPE );

	for( i=no; i<=no+POS_MAX; i++ ){
		py = (i-no)<<1;
		NMenuBoxWrite( CUBE_NAME_SX, CUBE_NAME_SY+py, CUBE_NAME_EX, CUBE_NAME_SY+1+py );
		if( i == cube.item_max ){
			NMenuMsgWrite( str_case_toziru, CUBE_NAME_SX, CUBE_NAME_SY+py );
			BG2_data[ ((CUBE_NAME_SY+py)<<5)+CUBE_LvM_X ]   = CUBENAME_NORMAL_BG;
			BG2_data[ ((CUBE_NAME_SY+1+py)<<5)+CUBE_LvM_X ] = CUBENAME_NORMAL_BG;

			if( i != no+POS_MAX )
				NMenuBoxWrite( CUBE_NAME_SX, CUBE_NAME_SY+2+py, CUBE_NAME_EX, CUBE_NAME_EY );

			break;
		}
		NMenuMsgWrite( cube_name[ Fld.MyCube[i].type ], CUBE_NAME_SX, CUBE_NAME_SY+py );
		BG2_data[ ((CUBE_NAME_SY+py)<<5)+CUBE_LvM_X ]   = CUBENAME_NORMAL_LV;
		BG2_data[ ((CUBE_NAME_SY+1+py)<<5)+CUBE_LvM_X ] = CUBENAME_NORMAL_LV+1;


		PM_NumMsgSet( StrTempBuffer0, CubeLevelGet( &Fld.MyCube[i] ), NUM_MODE_LEFT, 3 );
		NMenuMsgWrite( StrTempBuffer0, CUBE_LvNum_X, CUBE_NAME_SY+py );
	}
}
static void DrawCubeNameWin( u8 no )
{
	DrawCubeName(no);
	CubeSelectBG(0);
}

//--------------------------
//		キューブソート
//--------------------------
// スペースをつめる
static void CubeSortZERO(void)
{
	u16	i,j;
	CUBE	copy;

	for( i=0; i<MY_CUBE_MAX-1; i++ ){
		for( j=i+1; j<MY_CUBE_MAX; j++ ){
			if( Fld.MyCube[i].type == 0 ){
				copy = Fld.MyCube[i];
				Fld.MyCube[i] = Fld.MyCube[j];
				Fld.MyCube[j] = copy;
			}
		}
	}
}

//------------------------------
//		手持ち数をチェック
//------------------------------
static void CubeMaxCheck(void)
{
	u8	i;

	cube.item_max = 0;
	for( i=0; i<MY_CUBE_MAX; i++ ){
		if( Fld.MyCube[i].type != 0 )	cube.item_max++;
	}

	if( cube.item_max >= POS_MAX )	cube.pos_max = POS_MAX;
	else							cube.pos_max = cube.item_max;

	// 使い切ったときなどの修正
	if( cube.scr + POS_MAX > cube.item_max && cube.scr != 0 )
		cube.scr--;
}

//-------------------------
//		キューブ選択
//-------------------------
static void SelectBar( u16 chr, u16 lv )
{
	u8	i;

	for( i=0; i<14; i++ ){
		BG2_data[ (((cube.pos<<1)+1)<<5)+0xf+i ] = chr;
		BG2_data[ (((cube.pos<<1)+2)<<5)+0xf+i ] = chr;
	}

	if( cube.scr+cube.pos != cube.item_max ){
		BG2_data[ (((cube.pos<<1)+1)<<5)+CUBE_LvM_X ] = lv;
		BG2_data[ (((cube.pos<<1)+2)<<5)+CUBE_LvM_X ] = lv+1;
	}
}

static void CubeSelectBG( u8 flg )
{
	u8	i;
	u16	pos;

	if( flg == 0 )	SelectBar( CUBENAME_SELECT_BG, CUBENAME_SELECT_LV );
	else			SelectBar( CUBENAME_CHANGE_BG, CUBENAME_CHANGE_LV );


	// 上矢印
	if( cube.scr != 0 )	BanishScrCurActor( MARK_ACT_U_CURSOR, 0 );
	else				BanishScrCurActor( MARK_ACT_U_CURSOR, 1 );

	// 下矢印
	if( cube.item_max > cube.pos_max && cube.scr+cube.pos_max != cube.item_max )
		BanishScrCurActor( MARK_ACT_D_CURSOR, 0 );
	else
		BanishScrCurActor( MARK_ACT_D_CURSOR, 1 );

	// パラメータ
	for( i=0; i<5; i++ ){
		pos = PARAM_CUBE_SY*32+i%3*64 + PARAM_CUBE_SX+i/3*6;
		if( cube.pos+cube.scr != cube.item_max ){
			if( GetCubeParam( &Fld.MyCube[cube.pos+cube.scr], PM_CUBE_KARAI+i ) > 0 ){
				BG2_data[ pos ]    = PARAM_CUBE_BG+(i<<12);
				BG2_data[ pos+32 ] = BG2_data[ pos ]+1;
			}else{
				BG2_data[ pos ]    = PARAM_NORMAL_BG;
				BG2_data[ pos+32 ] = PARAM_NORMAL_BG;
			}
		}else{
			BG2_data[ pos ]    = PARAM_NORMAL_BG;
			BG2_data[ pos+32 ] = PARAM_NORMAL_BG;
		}
	}

	NMenuContextChange( CUBECASE_TYPE );

	if( cube.pos+cube.scr != cube.item_max ){
		PM_NumMsgSet(
			StrTempBuffer0, CubeNamerakasaGet( &Fld.MyCube[cube.pos+cube.scr] ),
			NUM_MODE_SPACE, 2 );
		NMenuMsgWrite( StrTempBuffer0, PARAM_MSG_RX+3, PARAM_MSG_SY+4 );
	}else
		NMenuBoxClear( PARAM_MSG_RX+3, PARAM_MSG_SY+4, PARAM_MSG_RX+4, PARAM_MSG_SY+5 );
}

static void CebeSelect( u8 flg )
{
	SePlay(SE_SELECT);
	ActWork[CUBECASE_ACT_NO].move = CubeCaseActMove;
	CubeSelectBG(flg);
}

static void CubeCaseMainTask( u8 id )
{
	if( FadeData.fade_sw )	return;

	if( sys.Repeat & U_KEY ){
		if( cube.pos != 0 ){
			SelectBar( CUBENAME_NORMAL_BG, CUBENAME_NORMAL_LV );
			cube.pos--;
			CebeSelect(0);
		}else{
			if( cube.scr != 0 ){
				cube.scr--;
				DrawCubeName( cube.scr );
				CebeSelect(0);
			}
		}
		return;
	}

	if( sys.Repeat & D_KEY ){
		if( cube.pos != cube.pos_max ){
			SelectBar( CUBENAME_NORMAL_BG, CUBENAME_NORMAL_LV );
			cube.pos++;
			CebeSelect(0);
		}else{
			if( cube.scr+cube.pos != cube.item_max ){
				cube.scr++;
				DrawCubeName( cube.scr );
				CebeSelect(0);
			}
		}
		return;
	}

	if( sys.Trg & SELECT_BUTTON ){
		if( cube.scr+cube.pos != cube.item_max ){
			SePlay(SE_SELECT);
			CubeSelectBG(1);
			TaskTable[id].work[0]  = cube.scr+cube.pos;
			TaskTable[id].TaskAdrs = CubePosChangeTask;
		}
		return;
	}

	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		if( cube.scr+cube.pos == cube.item_max ){
			AnswerWork = 0xffff;
			CubeCaseReturnInit(id);
		}else	CubeMenuInit(id);
		return;
	}

	if( sys.Trg & B_BUTTON ){
		SePlay(SE_SELECT);
		AnswerWork = 0xffff;
		CubeCaseReturnInit(id);
	}
}

//--------------------------------------
//	キューブ入れ替え
//--------------------------------------
static void CubePosChangeTask( u8 id )
{
	if( sys.Repeat & U_KEY ){
		if( cube.pos != 0 ){
			SelectBar( CUBENAME_NORMAL_BG, CUBENAME_NORMAL_LV );
			cube.pos--;
			CebeSelect(1);
			ChangeBarPut( id, 1 );
		}else{
			if( cube.scr != 0 ){
				ChangeBarPut( id, 0 );
				cube.scr--;
				DrawCubeName( cube.scr );
				CebeSelect(1);
				ChangeBarPut( id, 1 );
			}
		}
		return;
	}

	if( sys.Repeat & D_KEY ){
		if( cube.pos != cube.pos_max ){
			SelectBar( CUBENAME_NORMAL_BG, CUBENAME_NORMAL_LV );
			cube.pos++;
			CebeSelect(1);
			ChangeBarPut( id, 1 );
		}else{
			if( cube.scr+cube.pos != cube.item_max ){
				ChangeBarPut( id, 0 );
				cube.scr++;
				DrawCubeName( cube.scr );
				CebeSelect(1);
				ChangeBarPut( id, 1 );
			}
		}
		return;
	}

	if( ( sys.Trg & A_BUTTON ) || ( sys.Trg & SELECT_BUTTON ) ){
		SePlay(SE_SELECT);
		ChangeBarPut( id, 0 );
		CubeChange(id);
		TaskTable[id].TaskAdrs = CubeCaseMainTask;
		return;
	}

	if( sys.Trg & B_BUTTON ){
		SePlay(SE_SELECT);
		ChangeBarPut( id, 0 );
		CubeSelectBG(0);
		TaskTable[id].TaskAdrs = CubeCaseMainTask;
	}
}

// 最初に選択されたキューブのバーを表示
static void ChangeBarPut( u8 id, u8 flg )
{
	u8	i;
	s16	pos;
	u16	chr, lv;

	if( flg == 0 ){
		chr = 0x5;
		lv  = 0x14;
	}else{
		chr = 0x1005;
		lv  = 0x1014;
	}

	pos = TaskTable[id].work[0] - cube.scr;

	if( pos >= 0 && pos <= 8 && pos != cube.pos ){
		for( i=0; i<14; i++ ){
			BG2_data[ (((pos<<1)+1)<<5)+0xf+i ] = chr;
			BG2_data[ (((pos<<1)+2)<<5)+0xf+i ] = chr;
		}
		BG2_data[ (((pos<<1)+1)<<5)+CUBE_LvM_X ] = lv;
		BG2_data[ (((pos<<1)+2)<<5)+CUBE_LvM_X ] = lv + 1;
	}
}

// キューブ交換
static void CubeChange( u8 id )
{
	CUBE dummy;

	u8 pos = cube.scr+cube.pos;

	if( pos == cube.item_max ){
		CubeSelectBG(0);
		return;
	}

	dummy = Fld.MyCube[ pos ];
	Fld.MyCube[ pos ] = Fld.MyCube[ TaskTable[id].work[0] ];
	Fld.MyCube[ TaskTable[id].work[0] ] = dummy;

	DrawCubeName( cube.scr );
	CubeSelectBG(0);
}


//---------------------------------
//	スクロールカーソル削除
//---------------------------------
static void DelScrCurActPal(void)
{
	DelScrCurActor( MARK_ACT_U_CURSOR );	// スクロールカーソルアクター削除
	DelScrCurActor( MARK_ACT_D_CURSOR );	// スクロールカーソルアクター削除
	DelMarkPal();							// マークパレット削除
}

//------------------------------
//		キューブケース終了
//------------------------------
static void CubeCaseReturnMain( u8 id )
{
	if( FadeData.fade_sw )	return;

	if( scene == PUT_CUBECASE_ID )
		pFieldRecoverFunc = AddScriptFieldInTask;

	DelScrCurActPal();

	MainProcChange( ReturnProc[ scene ] );
	DelTask(id);
}

static void CubeCaseReturnInit( u8 id )
{
	PaletteFadeReq(0xffffffff,0,0,16,0);
	if( scene >= BTL_CUBECASE_ID )	ReturnItemNo = 0;
	TaskTable[id].TaskAdrs = CubeCaseReturnMain;
}

//---------------------------
//		キューブを選択
//---------------------------
static void CubeMenuInit( u8 id )
{
	u8	plus = 0;

	if( scene >= BTL_CUBECASE_ID )	plus = 2;

	ScrCurActAnmStop( MARK_ACT_U_CURSOR );	// スクロールカーソルアニメストップ
	ScrCurActAnmStop( MARK_ACT_D_CURSOR );	// スクロールカーソルアニメストップ

	NMenuContextChange( CUBECASE_TYPE2 );
	NMenuWinBoxWrite( MENU_WIN_SX, MENU_WIN_SY+plus, MENU_WIN_EX, MENU_WIN_EY );
	NMenuFreeListWrite( MENU_WIN_SX+2, MENU_WIN_SY+1+plus, menu_max, menu, menu_list );
	NMenuVCursorInit( MENU_WIN_SX+1, MENU_WIN_SY+1+plus, menu_max, 0 );
	ReturnItemNo = cube.pos + cube.scr;
	TaskTable[id].TaskAdrs = CubeMenuMain;
}

static void CubeMenuMain( u8 id )
{
	MENUFUNC	func;

	if( sys.Repeat & U_KEY ){
		if( NMenuVCursorPosGet() != 0 ){
			SePlay(SE_SELECT);
			NMenuVCursorSet( -1 );
		}
		return;
	}

	if( sys.Repeat & D_KEY ){
		if( NMenuVCursorPosGet() != menu_max-1 ){
			SePlay(SE_SELECT);
			NMenuVCursorSet( 1 );
		}
		return;
	}

	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		func = menu[ menu_list[ NMenuVCursorPosGet() ] ].ptr;
		func(id);
		return;
	}

	if( sys.Trg & B_BUTTON ){
		SePlay(SE_SELECT);
		CubeCancel(id);
	}
}

//------------------
//		つかう
//------------------
static void CubeUseMain( u8 id )
{
	if( FadeData.fade_sw )	return;

	DelScrCurActPal();
	CubeDemoInit( &Fld.MyCube[ ReturnItemNo ], CubeCaseInit );
	DelTask(id);
}
static void CubeUse( u8 id )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	TaskTable[id].TaskAdrs = CubeUseMain;
}

//------------------
//		すてる
//------------------
static void CubeDelInit2( u8 id )
{
	NMenuContextChange( CUBECASE_TYPE2 );
	NMenuBoxClear( MENU_WIN_SX, MENU_WIN_SY, MENU_WIN_EX, MENU_WIN_EY );
	PM_strcpy( StrTempBuffer0, cube_name[ Fld.MyCube[cube.pos+cube.scr].type ] );
	PM_MsgExpand( MsgExpandBuffer, msg_cube_del00 );
	SetTalkMsg( id, MsgExpandBuffer, CubeDelYesNoInit, 0 );
}

static void CubeDelInit( u8 id )
{
	BanishScrCurActor( MARK_ACT_D_CURSOR, 1 );
	TaskTable[id].TaskAdrs = CubeDelInit2;
}

//------------------------
//		はい・いいえ
//------------------------
static void CubeDelYesNoInit( u8 id )
{
	YesNoSelectInit( YESNO_WIN_SX, YESNO_WIN_SY );
	SelectToolInit( id, &DelYesNoFunc );
}
// はい
static void CubeDelYes( u8 id )
{
	NMenuBoxClear( YESNO_WIN_SX, YESNO_WIN_SY, YESNO_WIN_EX, YESNO_WIN_EY );
	DelCube(cube.pos+cube.scr);
	PM_MsgExpand( MsgExpandBuffer, msg_cube_del01 );
	SetTalkMsg( id, MsgExpandBuffer, CubeDelDraw, 0 );

	CubeSortZERO();				// キューブソート
	CubeMaxCheck();				// 手持ち数をチェック
}

//----------------------
//		捨てる終了
//----------------------
static void CubeDelEnd( u8 id )
{
	ScrCurActAnmPlay( MARK_ACT_U_CURSOR );			// アニメ再開
	ScrCurActAnmPlay( MARK_ACT_D_CURSOR );			// アニメ再開

	if( cube.item_max > cube.pos_max && cube.scr+cube.pos_max != cube.item_max )
		BanishScrCurActor( MARK_ACT_D_CURSOR, 0 );

	NMenuContextChange( CUBECASE_TYPE2 );
	NMenuBoxClear( YESNO_WIN_SX, YESNO_WIN_SY, YESNO_WIN_EX, YESNO_WIN_EY );
	NMenuBoxClear( MSG_WIN_SX, MSG_WIN_SY, MSG_WIN_EX, MSG_WIN_EY );
	TaskTable[id].TaskAdrs = CubeCaseMainTask;
}
static void CubeDelEndWait( u8 id )
{
	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON )
		CubeDelEnd(id);
}
static void CubeDelDraw( u8 id )
{
	NMenuContextChange( CUBECASE_TYPE );
//	CubeSortZERO();				// キューブソート
//	CubeMaxCheck();				// 手持ち数をチェック
	DrawCubeNameWin(cube.scr);	// キューブ名表示
	BanishScrCurActor( MARK_ACT_D_CURSOR, 1 );
	TaskTable[id].TaskAdrs = CubeDelEndWait;
}

//------------------
//		やめる
//------------------
static void CubeCancel( u8 id )
{
	ScrCurActAnmPlay( MARK_ACT_U_CURSOR );			// アニメ再開
	ScrCurActAnmPlay( MARK_ACT_D_CURSOR );			// アニメ再開

	NMenuBoxClear( MENU_WIN_SX, MENU_WIN_SY, MENU_WIN_EX, MENU_WIN_EY );
	TaskTable[id].TaskAdrs = CubeCaseMainTask;
}

//-----------------------------------
//		つかう（サファリの戦闘）
//-----------------------------------
static void CubeUseSafariBtl( u8 id )
{
	s16	like;

	like = CheckCubeLike( PokeSeikakuGet(&PokeParaEnemy[0]), &Fld.MyCube[ReturnItemNo] );
	PM_strcpy( EvStrBuf0, cube_name[ Fld.MyCube[ReturnItemNo].type ] );
	DelCube( (u8)ReturnItemNo );

	ReturnItemNo = Fld.MyCube[ ReturnItemNo ].type << 8;

	if( like == 0 )	ReturnItemNo += 1;	// 普通
	if( like > 0 )	ReturnItemNo += 2;	// 好き
	if( like < 0 )	ReturnItemNo += 3;	// 嫌い

	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	TaskTable[id].TaskAdrs = CubeCaseReturnMain;
}

//---------------------------------------------
//		つかう（サファリのキューブ置き場）
//---------------------------------------------
static void CubeUseSafariTbl( u8 id )
{
	SafariCubeTableSet( (u8)ReturnItemNo );
	PM_strcpy( StrTempBuffer0, cube_name[Fld.MyCube[ReturnItemNo].type] );
	AnswerWork = ReturnItemNo;
	DelCube( (u8)ReturnItemNo );
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	TaskTable[id].TaskAdrs = CubeCaseReturnMain;
}


//=========================================================================================
//------------------------------------
//	ケース回転アニメ
//------------------------------------
static void CubeCaseActMove( actWork * act )
{
	if( act->work[0] >= 2 )	act->work[0] = 0 ;

	switch( act->work[0] ){
	case 0:
		act->oamData.AffineMode = 1;
		act->aff_tbl = CubeCaseAffTbl;
		AffineNumSet( act );
		act->work[0] = 1;
		act->work[1] = 0;
		break;
	case 1:
		act->work[1]++;
		if( act->work[1] >= 12 ){
			act->oamData.AffineMode = 0;
			act->work[0] = 0;
			act->work[1] = 0;
			AffineWorkNumDel( act->oamData.AffineParamNo );
			act->move = DummyActMove;
		}
	}
}



//=========================================================================================
//--------------------------------------
//		キューブのパラメータ初期化
//	引数 : 配列番号
//--------------------------------------
void CubeParamInit( u8 no )
{
	Fld.MyCube[no].type   = 0;
	Fld.MyCube[no].karai  = 0;
	Fld.MyCube[no].sibui  = 0;
	Fld.MyCube[no].amai   = 0;
	Fld.MyCube[no].nigai  = 0;
	Fld.MyCube[no].suppai = 0;
	Fld.MyCube[no].umai   = 0;
}
void AllCubeParamInit(void)
{
	u8	i;

	for( i=0; i<MY_CUBE_MAX; i++ )
		CubeParamInit(i);
}

//------------------------------------------
//	キューブのレベル取得
//	引数   : キューブデータのポインタ
//	return : 一番高い数値の味
//------------------------------------------
u8 CubeLevelGet( CUBE * c )
{
	u8	prm, prm2;
	u8	i;

	prm = (u8)GetCubeParam( c, PM_CUBE_KARAI );
	for( i=1; i<5; i++ ){
		prm2 = (u8)GetCubeParam( c, PM_CUBE_KARAI+i );
		if( prm < prm2 )	prm = prm2;
	}

	return	prm;
}

//------------------------------------------
//	キューブのなめらかさ取得
//	引数   : キューブデータのポインタ
//	return : なめらかさ
//------------------------------------------
u8 CubeNamerakasaGet( CUBE * c )
{
	u8	prm;
	
	prm = (u8)GetCubeParam( c, PM_CUBE_UMAI );

	if( prm >= 100 )	return	99;
	return	prm;
}

//-------------------------------------------------
//				手持ちに空きがあるか
//	return : 空きあり = 配列番号	空き無し = -1
//-------------------------------------------------
s8 CheckCube(void)
{
	u8	i;

	for( i=0; i<MY_CUBE_MAX; i++ ){
		if( Fld.MyCube[i].type == 0 )	return	(s8)i;
	}
	return	-1;
}

//----------------------------------------
//			キューブを加える
//	引数   : 加えるデータのポインタ
//	戻り値 : 成功 = TRUE	失敗 = FALSE
//----------------------------------------
u8 AddCube( CUBE * add )
{
	s8	no;

	no = CheckCube();
	if( no == -1 )	return	FALSE;
	Fld.MyCube[no] = *add;
	return	TRUE;
}

//----------------------------------------
//		キューブを減らす（無くす）
//	引数   : 配列番号
//	戻り値 : 成功 = TRUE	失敗 = FALSE
//----------------------------------------
u8 DelCube( u8 no )
{
	if( Fld.MyCube[no].type == 0 )	return	FALSE;
	CubeParamInit(no);
	return	TRUE;
}

//--------------------------------------
//	指定されたパラメータを取得
//--------------------------------------
s16 GetCubeParam( CUBE * c, u8 pm )
{
	if( pm == PM_CUBE_TYPE )	return	(s16)c->type;	// 種類
	if( pm == PM_CUBE_KARAI )	return	(s16)c->karai;	// 辛さ
	if( pm == PM_CUBE_SIBUI )	return	(s16)c->sibui;	// 渋さ
	if( pm == PM_CUBE_AMAI )	return	(s16)c->amai;	// 甘さ
	if( pm == PM_CUBE_NIGAI )	return	(s16)c->nigai;	// 苦さ
	if( pm == PM_CUBE_SUPPAI )	return	(s16)c->suppai;	// 酸っぱさ
	if( pm == PM_CUBE_UMAI )	return	(s16)c->umai;	// 旨さ

	return	0;
};


//------------------------------------------
//	選択キューブをポケモンが好きか
//------------------------------------------
s16	CheckCubeLike( u8 chr, CUBE * cube )
{
	u8	i;
	s16	plus;
	s16	eat = 0;

	for( i=0; i<5; i++ ){
		plus = GetCubeParam( cube, PM_CUBE_KARAI+i );
		if( plus > 0 )
			eat = eat + ( plus * cube_like_tbl[ chr*5+i ] );
	}

	return	eat;
}

//------------------------------------------
//	キューブ名セット
//------------------------------------------
void SetCubeName( CUBE * c, u8 * str )
{
	u8	no;

	no = GetCubeParam( c, PM_CUBE_TYPE );
	PM_strcpy( str, cube_name[no] );
}

//------------------------------------------
//	好きなキューブを調べる（スクリプト用）
//	引数   : u8   chr = 性格
//		     u8 * str = キューブ名格納場所
//	戻り値 : TRUE  = 好きなキューブあり
//		   : FALSE = 好きなキューブなし
//------------------------------------------
u8 GetLikeCubeName( u8 chr, u8 * str )
{
	u8	i;

	for( i=0; i<5; i++ ){
		if( CheckCubeLike( chr, (CUBE *)&dumy_data[i] ) > 0 ){
			PM_strcpy( str, cube_name[i+1] );
			return	TRUE;
		}
	}
	return	FALSE;
}
