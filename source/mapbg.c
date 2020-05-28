//=============================================================================
//
//	mapbg.c
//		2001.02.15 by tama
//
//	BG 制御関連
//=============================================================================

#include "common.h"

#define MAPBG_H_GLOBAL
#include "mapbg.h"

#include "screen.h"
#include "field.h"			/* リソース定義 */
#include "fieldmap.h"		/* セル参照 */
#include "evobj.h"
#include "jiki.h"
#include "seed.h"			//CheckSeedInScreen
#include "r_door.h"			//DoorObjControl

#include "map_attr.h"


//-----------------------------------------------------------------------------
//	型定義・定数定義
//-----------------------------------------------------------------------------

enum {
		CELLCHRSIZE			=	2,				//セルの１辺を構成するのに必要なキャラ数
		BG_X_SIZE			=	32,				//ＢＧＸサイズ（キャラ単位）
		BG_Y_SIZE			=	32,				//ＢＧＹサイズ（キャラ単位）

		BGPUTX_DEFAULT		=	0,				//初期表示Ｘ位置（キャラ単位）
		BGPUTY_DEFAULT		=	0,				//初期表示Ｙ位置（キャラ単位）

		/* 画面端のみを描画する場合の修正値 */
		UP_EDGE_OFFSET		=	(0),
		DOWN_EDGE_OFFSET	=	(BG_Y_SIZE - 2 - 2),
		LEFT_EDGE_OFFSET	=	(0),
		RIGHT_EDGE_OFFSET	=	(BG_X_SIZE - 2 - 2),
};

/* ＢＧ制御構造体定義 */
typedef struct {
		u8	dotx;							// BG表示Ｘ位置(ドット単位）
		u8	doty;							// BG表示Ｙ位置(ドット単位）
		u8	chrx;							// BG描画Ｘ位置(キャラ単位)
		u8	chry;							// BG描画Ｙ位置(キャラ単位)
		u8	trans_req;						// BG転送リクエスト
}BGstruct;


//-----------------------------------------------------------------------------
//	変数定義
//-----------------------------------------------------------------------------
static BGstruct MainMapBG;
FieldScrollCtrl scroll;
s16 FieldActOX;
s16 FieldActOY;

#define MapLowBG	(dmy_BG[ MAP_LOW_BG_NO ])
#define MapUpBG		(dmy_BG[ MAP_UP_BG_NO ])
#define MapBtmBG	(dmy_BG[ MAP_BTM_BG_NO])

//-------------------------------------------------------------
//-------------------------------------------------------------

static void MakeDmyScreenDirect(int map_x, int map_y, const MapScreenData * scrn);

static void BGwriteCellSub( const MapScreenData * scrn, u16 offset, int x, int y );


//=============================================================================
//
//	視界制御関連定義
//
//=============================================================================
enum {
		DOT_OFF_Y		= 8,
		BASE_OFF_X		= 0,
		BASE_OFF_Y		= (CELL_SIZE * VIEW_UP_MARGIN),

		CHANGE_SPEED	= 2,						/* 視界変更の速度(dot単位) */
		MOVE_LENGTH		= (CELL_SIZE * 2 + 8),		/* 視界移動の範囲 */
};


u8 MapViewControlFlag = 0;
static s16 offset_x, offset_y;
static u8 TestOffsetFlag;



//=============================================================================
//
//	BG構造体関連ルーチン
//
//=============================================================================

//-----------------------------------------------------------------------------
//	初期化処理
//-----------------------------------------------------------------------------
static void BGinit(BGstruct * bg)
{
	bg->chrx = BGPUTX_DEFAULT;							// 表示位置( ｷｬﾗ単位 )
	bg->chry = BGPUTY_DEFAULT;
	bg->dotx = BGPUTX_DEFAULT*8;						// 表示位置( ﾄﾞｯﾄ単位 )
	bg->doty = BGPUTY_DEFAULT*8;
	bg->trans_req = TRUE;
}

//-----------------------------------------------------------------------------
//	描画位置の変更
//-----------------------------------------------------------------------------
static void BGmoveChrPosition(BGstruct * bg, int dx, int dy)
{
		bg->chrx += dx;
		bg->chrx %= BG_X_SIZE;

		bg->chry += dy;
		bg->chry %= BG_Y_SIZE;
}

static void BGmoveDotPos(BGstruct * bg, int dx, int dy)
{
	bg->dotx += dx;
	bg->doty += dy;
}


//=============================================================================
//
//	フィールドマップＢＧ初期化
//
//=============================================================================
void InitMapBG(void)
{
	BGinit(&MainMapBG);
	CpuClear(0, MapLowBG, sizeof(MapLowBG), 16);	// 仮想 BG RAM ｸﾘｱ
	CpuClear(0, MapUpBG, sizeof(MapUpBG), 16);	// 仮想 BG RAM ｸﾘｱ
	CpuClear(WATER_CHR_CODE, MapBtmBG, sizeof(MapBtmBG), 16);
}

//-----------------------------------------------------------------------------
//	Vsync中のBGデータ処理
//-----------------------------------------------------------------------------
void MapBGVsync(void)
{
		*(RegBGHofs[MAP_UP_BG_NO]) = MainMapBG.dotx + offset_x;
		*(RegBGVofs[MAP_UP_BG_NO]) = MainMapBG.doty + offset_y + DOT_OFF_Y;

		*(RegBGHofs[MAP_LOW_BG_NO]) = MainMapBG.dotx + offset_x;
		*(RegBGVofs[MAP_LOW_BG_NO]) = MainMapBG.doty + offset_y + DOT_OFF_Y; 

		*(RegBGHofs[MAP_BTM_BG_NO]) = MainMapBG.dotx + offset_x; 
		*(RegBGVofs[MAP_BTM_BG_NO]) = MainMapBG.doty + offset_y + DOT_OFF_Y; 

		if( MainMapBG.trans_req == FALSE )return;

		DmaArrayCopy(3 , MapUpBG , BASE_SCRN_ADRS(MAP_UP_SCRN_BASE),16);
		DmaArrayCopy(3 , MapLowBG , BASE_SCRN_ADRS(MAP_LOW_SCRN_BASE),16);
		DmaArrayCopy(3 , MapBtmBG , BASE_SCRN_ADRS(MAP_BTM_SCRN_BASE),16);

		MainMapBG.trans_req = FALSE;
}

//-----------------------------------------------------------------------------
//	ﾚｼﾞｽﾀへｾｯﾄする値を取得
//-----------------------------------------------------------------------------
void GetMapRegPos( s16 *x, s16 *y )
{
	*x = MainMapBG.dotx + offset_x;
	*y = MainMapBG.doty + offset_y + DOT_OFF_Y;
}

//=============================================================================
//
//	全ＢＧ分の描画処理
//
//=============================================================================


void MakeMapBG(void)
{
	MakeDmyScreenDirect(Fld.MapXpos, Fld.MapYpos, NowMap.Screen);
	MainMapBG.trans_req = TRUE;
}

//-----------------------------------------------------------------------------
// 画面サイズ分のマップデータ展開
//-----------------------------------------------------------------------------
static void MakeDmyScreenDirect(int map_x, int map_y, const MapScreenData * scrn )
{
	u16 pos;
	u8	bg_x, bg_y;
	u8	dx, dy;

	for (dy = 0; dy < BG_Y_SIZE ; dy += CELLCHRSIZE) {
		bg_y = MainMapBG.chry + dy;
		if (bg_y >= BG_Y_SIZE) bg_y -= BG_Y_SIZE;
		pos = BG_X_SIZE * bg_y;

		for (dx = 0; dx < BG_X_SIZE; dx += CELLCHRSIZE) {
			bg_x = MainMapBG.chrx + dx;
			if (bg_x >= BG_X_SIZE) bg_x -= BG_X_SIZE;

			BGwriteCellSub(scrn, pos + bg_x,
					map_x + dx/CELLCHRSIZE, map_y + dy/CELLCHRSIZE);
		}
	}
}


//=============================================================================
//
//	スクロール方向の画面端のみの描画処理
//
//=============================================================================


static void	BGwriteRightEdgeBG(BGstruct * bg, const MapScreenData * scrn);
static void BGwriteLeftEdgeBG(BGstruct * bg, const MapScreenData * scrn);
static void BGwriteDownEdgeBG(BGstruct * bg, const MapScreenData * scrn);
static void BGwriteUpEdgeBG(BGstruct * bg, const MapScreenData * scrn);

//-----------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------
static void MakeMapEdgeBG(BGstruct * bg, int mx, int my)
{
	const MapScreenData * scrn = NowMap.Screen;

	if (mx > 0) BGwriteRightEdgeBG(bg, scrn);
	if (mx < 0) BGwriteLeftEdgeBG(bg, scrn);
	if (my > 0) BGwriteDownEdgeBG(bg, scrn);
	if (my < 0) BGwriteUpEdgeBG(bg, scrn);
	bg->trans_req = TRUE;
}

//-----------------------------------------------------------------------------
//	
//-----------------------------------------------------------------------------
void BGwriteDownEdgeBG(BGstruct * bg, const MapScreenData * scrn)
{
	u8 bg_x, bg_y, cx;
	u16 pos;

	bg_y = bg->chry + DOWN_EDGE_OFFSET;
	if (bg_y >= BG_Y_SIZE) bg_y -= BG_Y_SIZE;
	pos = bg_y * BG_X_SIZE;

	for (cx = 0; cx < BG_X_SIZE;cx += CELLCHRSIZE) {
		bg_x = bg->chrx + cx;
		if (bg_x >= BG_X_SIZE) bg_x -= BG_X_SIZE;

		BGwriteCellSub(scrn, pos + bg_x,
				Fld.MapXpos + cx/CELLCHRSIZE,
				Fld.MapYpos + DOWN_EDGE_OFFSET/CELLCHRSIZE);
	}
}

//-----------------------------------------------------------------------------
//	
//-----------------------------------------------------------------------------
void BGwriteUpEdgeBG(BGstruct * bg, const MapScreenData * scrn)
{
	u8 bg_x, bg_y, cx;
	u16 pos;

	bg_y = bg->chry + UP_EDGE_OFFSET;
	pos = bg_y * BG_X_SIZE;

	for (cx = 0; cx < BG_X_SIZE; cx += CELLCHRSIZE) {
		bg_x = bg->chrx + cx;
		if (bg_x >= BG_X_SIZE) bg_x -= BG_X_SIZE;
		BGwriteCellSub(scrn, pos + bg_x,
				Fld.MapXpos + cx/CELLCHRSIZE,
				Fld.MapYpos + UP_EDGE_OFFSET/CELLCHRSIZE);
	}
}

//-----------------------------------------------------------------------------
//	
//-----------------------------------------------------------------------------
void BGwriteLeftEdgeBG(BGstruct * bg, const MapScreenData * scrn)
{
	u8 bg_x, bg_y, cy;
	u16 pos;

	bg_x = bg->chrx + LEFT_EDGE_OFFSET;

	for (cy = 0; cy < BG_Y_SIZE; cy += CELLCHRSIZE) {
		bg_y = bg->chry + cy;
		if (bg_y >= BG_Y_SIZE) bg_y -= BG_Y_SIZE;

		pos = bg_y * BG_X_SIZE + bg_x;
		BGwriteCellSub(scrn, pos,
				Fld.MapXpos + LEFT_EDGE_OFFSET/CELLCHRSIZE,
				Fld.MapYpos + cy/CELLCHRSIZE);
	}
}

//-----------------------------------------------------------------------------
//	
//-----------------------------------------------------------------------------
void BGwriteRightEdgeBG(BGstruct * bg, const MapScreenData * scrn)
{
	u8 bg_x, bg_y, cy;
	u16 pos;

	bg_x = bg->chrx + RIGHT_EDGE_OFFSET;
	if (bg_x >= BG_X_SIZE) bg_x -= BG_X_SIZE;

	for (cy = 0; cy < BG_Y_SIZE; cy += CELLCHRSIZE) {
		bg_y = bg->chry + cy;
		if(bg_y >= BG_Y_SIZE) bg_y -= BG_Y_SIZE;

		pos = bg_y * BG_X_SIZE + bg_x;
		BGwriteCellSub(scrn, pos,
				Fld.MapXpos + RIGHT_EDGE_OFFSET/CELLCHRSIZE,
				Fld.MapYpos + cy/CELLCHRSIZE);
	}
}

//=============================================================================
//	セルひとつ分のＢＧを描画する
//=============================================================================
static void write_dmy_bg( int trans_type, const u16 * cellchr, u16 dst );
static int get_write_pos_offset( BGstruct * bg, int x, int y );
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
void RewriteSingleBG(int map_x, int map_y)
{
	int offset;

	offset = get_write_pos_offset(&MainMapBG,map_x,map_y);
	if (offset < 0) return;
	BGwriteCellSub( NowMap.Screen,  offset, map_x, map_y );
	MainMapBG.trans_req = TRUE;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
void WriteMapBGdirect(int map_x, int map_y, const u16 * celldata)
{
	int offset;

	offset = get_write_pos_offset(&MainMapBG,map_x,map_y);
	if (offset < 0) return;
	write_dmy_bg( 1, celldata, offset );
	MainMapBG.trans_req = TRUE;
}

//-----------------------------------------------------------------------------
//	指定セル位置のＢＧ描画
//	※座標以外にoffsetを引数にとるのはループ内から呼び出される場合に
//	　毎回offsetを計算すると遅くなるので呼び出し元で計算している
//-----------------------------------------------------------------------------
static void BGwriteCellSub( const MapScreenData * scrn, u16 offset, int x, int y )
{
	u16 code;
	const u16 * celldata;

	code = GetCellCode(x,y);
	if (code > MAP_CELL_2ND_NO + MAP_CELL_2ND_SIZE) code = 0;	//エラーデータ処理

	if (code < MAP_CELL_2ND_NO) {
		celldata = scrn->MainCharData->CellCharData;
	} else {
		celldata = scrn->SubCharData->CellCharData;
		code -= MAP_CELL_2ND_NO;
	}

	write_dmy_bg( GetCellLayer(x,y), &(celldata[code*8]), offset );
}


//-----------------------------------------------------------------------------
//	<引数>
//		trans_type	書き込むBGの指定
//					0:上中のBGに描画	1:中下のBGに描画	2:上下のBGに描画
//		cellchr		書き込むデータの先頭アドレス
//		dst			BGの書き込み位置へのオフセット
//-----------------------------------------------------------------------------
static void write_dmy_bg( int trans_type, const u16 * cellchr, u16 dst )
{
	switch (trans_type) {
	case 2:
		MapBtmBG[dst				]	= cellchr[0];
		MapBtmBG[dst+1				]	= cellchr[1];
		MapBtmBG[dst+BG_X_SIZE		]	= cellchr[2];
		MapBtmBG[dst+BG_X_SIZE+1	]	= cellchr[3];

		MapLowBG[dst				]	= 0;
		MapLowBG[dst+1				]	= 0;
		MapLowBG[dst+BG_X_SIZE		] 	= 0;
		MapLowBG[dst+BG_X_SIZE+1	]	= 0;

		MapUpBG[dst					]	= cellchr[4];
		MapUpBG[dst+1				]	= cellchr[5];
		MapUpBG[dst+BG_X_SIZE		] 	= cellchr[6];
		MapUpBG[dst+BG_X_SIZE+1		]	= cellchr[7];
		break;

	case 1:
		MapBtmBG[dst				]	= cellchr[0];
		MapBtmBG[dst+1				]	= cellchr[1];
		MapBtmBG[dst+BG_X_SIZE		]	= cellchr[2];
		MapBtmBG[dst+BG_X_SIZE+1	]	= cellchr[3];

		MapLowBG[dst				]	= cellchr[4];
		MapLowBG[dst+1				]	= cellchr[5];
		MapLowBG[dst+BG_X_SIZE		] 	= cellchr[6];
		MapLowBG[dst+BG_X_SIZE+1	]	= cellchr[7];

		MapUpBG[dst					]	= 0;
		MapUpBG[dst+1				]	= 0;
		MapUpBG[dst+BG_X_SIZE		]	= 0;
		MapUpBG[dst+BG_X_SIZE+1		]	= 0;
		break;

	case 0:
		MapBtmBG[dst				]	= WATER_CHR_CODE;
		MapBtmBG[dst+1				]	= WATER_CHR_CODE;
		MapBtmBG[dst+BG_X_SIZE		]	= WATER_CHR_CODE;
		MapBtmBG[dst+BG_X_SIZE+1	]	= WATER_CHR_CODE;

		MapLowBG[dst				]	= cellchr[0];
		MapLowBG[dst+1				]	= cellchr[1];
		MapLowBG[dst+BG_X_SIZE		]	= cellchr[2];
		MapLowBG[dst+BG_X_SIZE+1	]	= cellchr[3];

		MapUpBG[dst					]	= cellchr[4];
		MapUpBG[dst+1				]	= cellchr[5];
		MapUpBG[dst+BG_X_SIZE		] 	= cellchr[6];
		MapUpBG[dst+BG_X_SIZE+1		]	= cellchr[7];
		break;
	}
}

//-------------------------------------------------------------
//	書き換え位置のオフセット計算
//	<戻り値>	オフセット
//				-1の場合は範囲外エラー
//-------------------------------------------------------------
static int get_write_pos_offset( BGstruct * bg, int x, int y )
{
	int dx,dy;

	dx = (x - Fld.MapXpos) * CELLCHRSIZE;
	if (dx < 0 || dx >= BG_X_SIZE) return -1;
	dx += bg->chrx;
	if (dx >= BG_X_SIZE ) dx -= BG_X_SIZE;
	dy = (y - Fld.MapYpos) * CELLCHRSIZE;
	if (dy < 0 || dy >= BG_Y_SIZE) return -1;
	dy += bg->chry;
	if (dy >= BG_Y_SIZE) dy -= BG_Y_SIZE;
		 
	return BG_X_SIZE * dy + dx;
}



//=============================================================================
//
//	スクロール制御関連ルーチン
//
//=============================================================================
//-------------------------------------------------------------
//-------------------------------------------------------------
static void NormalTraceActor(FieldScrollCtrl * scrl)
{
	if(scrl->work == 0)
	{
		return;										// ｱｸﾀｰのｾｯﾄがされていない
	}

	scrl->dx = ActWork[scrl->work].work[2];			// ｽｸﾛｰﾙ値 X
	scrl->dy = ActWork[scrl->work].work[3];			// Y
}

//-------------------------------------------------------------
//	SCROLLコントロール初期化
//-------------------------------------------------------------
void InitFieldScroll(void)
{
	scroll.dx = 0;
	scroll.dy = 0;
	scroll.xdiff = 0;
	scroll.ydiff = 0;
	scroll.work = 0;
	scroll.controler = NULL;
}

//-------------------------------------------------------------
//	特定アクター同期スクロールセット
//-------------------------------------------------------------
int SetFieldScroll(u8 actno)
{
	if (scroll.work != 0 )								// ｽｸﾛｰﾙﾜｰｸ
	{
		DelActor(&ActWork[scroll.work]);				// 現在使用している同期ｱｸﾀｰ消去
	}

	scroll.work = SetScrollTaskAct( actno );			// work = ｱｸﾀｰﾅﾝﾊﾞ
	scroll.controler = NormalTraceActor;				// ｽｸﾛｰﾙﾀｲﾌﾟ

	return 0;
}

//-------------------------------------------------------------
//	Scroll制御	
//-------------------------------------------------------------
void ControlFieldScroll(void)
{
	int dx,dy;
	int x_chg,y_chg;
	int oldx,oldy;

	if(scroll.controler != NULL)
	{
		scroll.controler(&scroll);						// 制御ルーチン呼び出し
	}
	
	dx = scroll.dx;										// ｽｸﾛｰﾙ座標
	dy = scroll.dy;

	x_chg = 0;
	y_chg = 0;

	oldx = scroll.xdiff;
	oldy = scroll.ydiff;

//　xdiff/ydiffが０から変化した場合、あるいは０に変化した場合のみ
//	差分 x_chg/y_chg を発生させる

	if(oldx == 0 && dx != 0)
	{
		x_chg = dx > 0 ? 1 : -1;
	}

	if(oldy == 0 && dy!=0)
	{
		y_chg = dy > 0 ? 1 : -1;
	}

	if(oldx != 0 && (oldx + dx) == 0)
	{
		x_chg = dx > 0 ? 1 : -1;
	}

	if(oldy != 0 && (oldy + dy) == 0)
	{
		x_chg = dy > 0 ? 1 : -1;
	}

	scroll.xdiff += dx;
	scroll.xdiff %= CELL_SIZE;
	scroll.ydiff += dy;
	scroll.ydiff %= CELL_SIZE;

	if( x_chg != 0 || y_chg != 0 )
	{
		MoveVMapPosition(x_chg,y_chg);
		EvObjMainControl(x_chg, y_chg);
		DoorObjControl( x_chg, y_chg );
		CheckSeedInScreen();							// きのみの成長抑止チェック
		
		BGmoveChrPosition(&MainMapBG, x_chg * CELLCHRSIZE, y_chg * CELLCHRSIZE);
		MakeMapEdgeBG(&MainMapBG, x_chg * CELLCHRSIZE, y_chg * CELLCHRSIZE);		// BG描画
	}

	BGmoveDotPos(&MainMapBG,dx,dy);

	FieldActOX -= dx;
	FieldActOY -= dy;
}

void ChangeFieldScroll( int dx, int dy )
{
	MoveVMapPosition( dx, dy );
	EvObjMainControl( dx, dy );
	
	MakeMapBG();
	FieldActOX -= dx * 16;
	FieldActOY -= dy * 16;
}

//==================================================================================
//
//	自機方向による画面表示位置コントロール
//
//==================================================================================

static pFunc map_view_func;

//-------------------------------------------------------------
//	BG 座標処理ｾｯﾄ
//-------------------------------------------------------------
void SetMapViewFunc( pFunc func )
{
	map_view_func = func;
}

//-------------------------------------------------------------
//	ｵﾌｾｯﾄ値ｾｯﾄ
//-------------------------------------------------------------
void SetMapViewOffset( s16 x, s16 y )
{
	offset_x = BASE_OFF_X + x;
	offset_y = BASE_OFF_Y + y;
}

static void MapViewOffsetCalc(void);

//-------------------------------------------------------------
//-------------------------------------------------------------
void MapViewInit(void)
{
	map_view_func = MapViewOffsetCalc;
	TestOffsetFlag = 0;
	offset_x = BASE_OFF_X;
	offset_y = BASE_OFF_Y;
}

//-------------------------------------------------------------
//-------------------------------------------------------------
void MapViewControl(void)
{
	if( map_view_func != NULL ) map_view_func();

	ActOX = FieldActOX - offset_x;
	ActOY = FieldActOY - offset_y - DOT_OFF_Y;
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static void MapViewOffsetCalc(void)
{
		u8 site;

		if(MapViewControlFlag == 0)
		{
				MapViewInit();
				return ;
		};
#if 1
		if(MyMoveState.mv_state == EV_M_ON)
		{
				TestOffsetFlag ^= 1;
				if(TestOffsetFlag==0)return;
		}else{
				TestOffsetFlag = 0;
		};
#endif

		site = GetHeroMoveSite();

		if(site == SITE_UP)
		{
				if(offset_y > BASE_OFF_Y - MOVE_LENGTH)
				{
						offset_y -= CHANGE_SPEED;
				};
		}
		else if(site == SITE_DOWN)
		{
				if(offset_y < BASE_OFF_Y + MOVE_LENGTH)
				{
						offset_y += CHANGE_SPEED;
				};
		}
		else if(offset_y < BASE_OFF_Y)
		{
				offset_y+= CHANGE_SPEED;
		}
		else if( offset_y > BASE_OFF_Y)
		{
				offset_y -= CHANGE_SPEED;
		};
};

