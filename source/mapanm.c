//=========================================================================
//
//	マップセル書き換えアニメーション
//
//	2001_05_24  by tama
//=========================================================================
#include "common.h"
#include "map_attr.h"
#include "fieldmap.h"
#include "mapbg.h"
#include "task.h"
#include "evobj.h"
#include "jiki.h"
#include "field.h"
#include "script.h"


#if 0
const u8 field_1_door01_Character[768];
const u8 field_1_door02_Character[768];
const u8 field_1_door03_Character[768];
const u8 field_7_door01_Character[768];
const u8 field_9_door01_Character[768];
const u8 field_9_door02_Character[768];
const u8 field_door01_Character[768];
const u8 field_door02_Character[768];
#endif

#include "../mapdata/field_1_door01.ach"
#include "../mapdata/field_1_door02.ach"
//#include "../mapdata/field_1_door03.ach"
#include "../mapdata/field_7_door01.ach"
#include "../mapdata/field_9_door01.ach"
#include "../mapdata/field_9_door02.ach"
#include "../mapdata/field_door01.ach"
#include "../mapdata/field_door02.ach"
#include "../mapdata/field_door03.ach"
#include "../mapdata/field_door04.ach"		//ショップ
#include "../mapdata/field_2_door01.ach"
#include "../mapdata/field_2_door02.ach"	//カナズミ


//add 02/06/28
#include "../mapdata/field_1_door03.ach"
#include "../mapdata/field_5_door01.ach"
#include "../mapdata/field_5_door02.ach"
#include "../mapdata/field_4_door01.ach"
#include "../mapdata/field_3_door01.ach"
#include "../mapdata/field_door05.ach"
#include "../mapdata/field_10_door01.ach"
#include "../mapdata/field_13_door01.ach"
#include "../mapdata/field_13_door02.ach"
#include "../mapdata/field_11_door01.ach"
#include "../mapdata/field_12_door01.ach"

//add 02/07/04
#include "../mapdata/gym_05_door01.ach"

//add 02/08/01
#include "../mapdata/field_5_door03.ach"
#include "../mapdata/field_9_door03.ach"
#include "../mapdata/field_9_door04.ach"
#include "../mapdata/field_10_door02.ach"
#include "../mapdata/pc_door01.ach"
#include "../mapdata/ship_door01.ach"
#include "../mapdata/field_7_door02.ach"
#include "../mapdata/ship_door02.ach"
#include "../mapdata/fdshop_door01.ach"

//add 02/08/09
#include "../mapdata/field_3_door02.ach"

//add 02/08/16
#include "../mapdata/b_tower_door01.ach"

/* タスク関連マクロ */
#define GET_ADR_H(n) ( ( (u32)n & 0xffff0000)  >> 16 )
#define GET_ADR_L(n) ( (u32)n & 0x0000ffff) 
#define GET_ADR(high,low) ( (u16)(high) << 16 | (u16)(low) )

//=========================================================================
//=========================================================================


//=========================================================================
//=========================================================================

enum{
	/* キャラ転送しない、元のセル描画を示すコード */
	ORG_CELL_USE = 0xffff,

	/* セルアニメに使用するキャラ数 */
	DMY_CHR_NUM = 8,

	/* セルアニメに使用するキャラ開始ナンバー */
	DMY_CHR_START_NO = MAP_CHR_1ST_NO+MAP_CHR_1ST_SIZE+MAP_CHR_2ND_SIZE - DMY_CHR_NUM,

	/* セルアニメに使用するキャラエリアのアドレス */
	DMY_CHR_START_ADRS = BASE_CHR_ADRS(MAP_LOW_CHR_BASE) + DMY_CHR_START_NO * 0x20,
};

//-------------------------------------------------------------------------
// データ構造定義
//-------------------------------------------------------------------------
typedef struct DOOR_ANM_TAG{
	u8 wait;					/* アニメウェイト */
	u16 offset;					/* キャラデータへのオフセット */
}ANM_TBL;

#define	ANM_TBL_END			{0,0}

typedef struct DOOR_ANM_TBL_TAG{
	u16 cellcode;				/* アニメ種類判別用BGセルコード */
	u8	se_flag;				/* 使用するＳＥの指定フラグ */
	const u8 * chr;				/* キャラデータアドレス */
	const u8 * pal_list;		/* 使用するパレットナンバーリスト */
}DOOR_ANM_DATA;

#define	DOOR_ANM_DATA_END	{0,0,NULL,NULL}
//-------------------------------------------------------------------------
//	ドアの開閉アニメデータ定義
//-------------------------------------------------------------------------
static const ANM_TBL normal_open_table[] =
{
	{4,ORG_CELL_USE,},
	{4,0x20 * 8 * 0,},
	{4,0x20 * 8 * 1,},
	{4,0x20 * 8 * 2,},
	ANM_TBL_END,
};

static const ANM_TBL normal_close_table[] =
{
	{4,0x20 * 8 * 2,},
	{4,0x20 * 8 * 1,},
	{4,0x20 * 8 * 0,},
	{4,ORG_CELL_USE,},
	ANM_TBL_END,
};

static const u8 field_door01_palette[] =
{
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
};
static const u8 field_door02_palette[] =
{
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
};
static const u8 field_door03_palette[] =
{
	0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
};
static const u8 field_door04_palette[] =
{
	0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
};
static const u8 field_1_door01_palette[] =
{
	0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
};
static const u8 field_1_door02_palette[] =
{
	0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
};
#if 0
static const u8 field_1_door03_palette[] =
{
	0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09,
};
#endif
static const u8 field_2_door01_palette[] =
{
	0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
};
static const u8 field_2_door02_palette[] =
{
	0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a,
};
static const u8 field_7_door01_palette[] =
{
	0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const u8 field_9_door01_palette[] =
{
	0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
};
static const u8 field_1_door03_palette[] =
{
	0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09,
};
static const u8 field_10_door01_palette[] =
{
	0x09, 0x09, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
};
static const u8 field_11_door01_palette[] =
{
	0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
};
static const u8 field_12_door01_palette[] =
{
	0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09,
};
static const u8 field_13_door01_palette[] =
{
	0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
};
static const u8 field_13_door02_palette[] =
{
	0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
};
static const u8 field_3_door01_palette[] =
{
	0x00, 0x00, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
};
static const u8 field_4_door01_palette[] =
{
	0x06, 0x06, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
};
static const u8 field_5_door01_palette[] =
{
	0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const u8 field_5_door02_palette[] =
{
	0x06, 0x06, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
};
static const u8 field_9_door02_palette[] =
{
	0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
};
static const u8 field_door05_palette[] =
{
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
};
static const u8 gym_05_door01_palette[] =
{
	0x06, 0x06, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const u8 field_5_door03_palette[] =
{
	0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const u8 field_9_door03_palette[] =
{
	0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
};
static const u8 field_9_door04_palette[] =
{
	0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09,
};
static const u8 field_10_door02_palette[] =
{
	0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
};
static const u8 pc_door01_palette[] =
{
	0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
};
static const u8 ship_door01_palette[] =
{
	0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const u8 field_7_door02_palette[] =
{
	0x0b, 0x0b, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const u8 ship_door02_palette[] =
{
	0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const u8 fdshop_door01_palette[] =
{
	0x06, 0x06, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const u8 field_3_door02_palette[] =
{
	0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09,
};
static const u8 b_tower_door01_palette[] =
{
	0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
};
static const DOOR_ANM_DATA total_door_anime_table[] =
{
	{ 33,	0,	field_door01_Character,		field_door01_palette, },
	{ 97,	1,	field_door02_Character,		field_door02_palette, },
	{ 461,	1,	field_door03_Character,		field_door03_palette, },
	{ 65,	1,	field_door04_Character,		field_door04_palette, },

	{ 584,	0,	field_1_door01_Character,	field_1_door01_palette, },
	{ 585,	0,	field_1_door02_Character,	field_1_door02_palette, },

	{ 559,	0,	field_2_door01_Character,	field_2_door01_palette,	},
	{ 543,	0,	field_2_door02_Character,	field_2_door02_palette,	},

	{ 677,	0,	field_7_door01_Character,	field_7_door01_palette, },

	//
	{ 647,	0,	field_1_door03_Character,	field_1_door03_palette, },
	{ 684,	0,	field_5_door01_Character,	field_5_door01_palette, },
	{ 929,	0,	field_5_door02_Character,	field_5_door02_palette, },
	{ 732,	0,	field_4_door01_Character,	field_4_door01_palette, },
	{ 549,	0,	field_3_door01_Character,	field_3_door01_palette, },
	{ 475,	1,	field_door05_Character,		field_door05_palette, },
	{ 582,	0,	field_9_door01_Character,	field_9_door01_palette, },
	{ 654,	0,	field_9_door02_Character,	field_9_door02_palette, },
	{ 673,	0,	field_10_door01_Character,	field_10_door01_palette, },
	{ 540,	0,	field_13_door01_Character,	field_13_door01_palette, },
	{ 542,	0,	field_13_door02_Character,	field_13_door02_palette, },
	{ 541,	1,	field_11_door01_Character,	field_11_door01_palette, },
	{ 538,	0,	field_12_door01_Character,	field_12_door01_palette, },

	//
	{ 548,	0,	gym_05_door01_Character,	gym_05_door01_palette, },

	//
	{ 649,	0,	field_5_door03_Character,	field_5_door03_palette, },
	{ 780,	1,	field_9_door03_Character,	field_9_door03_palette, },
	{ 813,	1,	field_9_door04_Character,	field_9_door04_palette, },
	{ 749,	1,	field_10_door02_Character,	field_10_door02_palette, },
	{ 612,	1,	pc_door01_Character,		pc_door01_palette, },
	{ 555,	0,	ship_door01_Character,		ship_door01_palette, },
	{ 759,	0,	field_7_door02_Character,	field_7_door02_palette, },
	{ 663,	0,	ship_door02_Character,		ship_door02_palette, },
	{ 645,	1,	fdshop_door01_Character,	fdshop_door01_palette, },

	{ 605,	1,	field_3_door02_Character,	field_3_door02_palette, },

	{ 526,	1,	b_tower_door01_Character,	b_tower_door01_palette, },
	DOOR_ANM_DATA_END,
};



//=========================================================================
//
//	マップセルアニメメイン部分
//
//=========================================================================


//-------------------------------------------------------------------------
//	ドアアニメ描画
//-------------------------------------------------------------------------
static void trans_dummy_chr_data( const u8 * data )
{
	CpuFastCopy( data, DMY_CHR_START_ADRS, DMY_CHR_NUM * 0x20 );
}

static void make_dmy_cell( u16 * cell, u16 code, const u8 * pal_list )
{
	int i;
	u16 pal_value;
	for ( i=0; i<4; i++ ) {
		pal_value = *pal_list << BG_SC_PLTT_SHIFT;
		pal_list++;
		cell[i] = pal_value | (code+i);
	}
	for (    ; i<8; i++ ) {
		pal_value = *pal_list << BG_SC_PLTT_SHIFT;
		pal_list++;
		cell[i] = pal_value | 0;
	}
}

static void write_dummy_door_cell( int x, int y, const u8 * pal_list )
{
	u16 cell[8];

	make_dmy_cell( cell, DMY_CHR_START_NO+0, pal_list);
	WriteMapBGdirect( x, y-1, cell );

	make_dmy_cell( cell, DMY_CHR_START_NO+4, pal_list+4);
	WriteMapBGdirect( x, y, cell );
}

static void write_original_door_cell( int x, int y )
{
	RewriteSingleBG( x, y-1 );
	RewriteSingleBG( x, y );
}

static void write_door_cell( const DOOR_ANM_DATA * tbl, const ANM_TBL * p, int x, int y )
{
	if ( p->offset == ORG_CELL_USE ) {
		write_original_door_cell( x, y );
	} else {
		trans_dummy_chr_data( &(tbl->chr[p->offset]) );
		write_dummy_door_cell( x, y, tbl->pal_list );
	}
}

//-------------------------------------------------------------------------
//	ドアアニメ制御タスク
//-------------------------------------------------------------------------
enum{
	DWK_TBL_H = 0,
	DWK_TBL_L,
	DWK_CHR_H,
	DWK_CHR_L,
	DWK_SEQ,
	DWK_WAIT,
	DWK_X,
	DWK_Y,
};

static int ctrl_door_anime( const DOOR_ANM_DATA * data, const ANM_TBL * p, s16 * wk )
{
	s16 *wait;
	s16 *seq;

	wait = &wk[DWK_WAIT];
	seq = &wk[DWK_SEQ];
	
	if ( *wait == 0 ) {
		write_door_cell( data, &(p[*seq]), wk[DWK_X], wk[DWK_Y] );
	}

	if ( *wait == p[*seq].wait ) {
		*wait = 0;
		(*seq) ++;
		if( p[*seq].wait == 0 ) return FALSE;
	} else {
		(*wait) ++;
	}
	return TRUE;
}

static void door_anime_task( u8 no )
{
	ANM_TBL * anm;
	DOOR_ANM_DATA * data;
	s16 * wk;

	wk = TaskTable[no].work;
	anm = (ANM_TBL *) GET_ADR( wk[DWK_TBL_H], wk[DWK_TBL_L] );
	data = (DOOR_ANM_DATA *) GET_ADR( wk[DWK_CHR_H], wk[DWK_CHR_L] );

	if ( ctrl_door_anime( data, anm, wk ) == FALSE ) {
		DelTask(no);
	}
}

//-------------------------------------------------------------------------
//	ドアアニメ呼び出し
//-------------------------------------------------------------------------
/* アニメデータの最後を返す */
static const ANM_TBL * search_last_anime( const ANM_TBL * anm )
{
	while ( anm->wait != 0 ) {
		anm++;
	}
	return anm-1;
}

/* セルから一致するアニメテーブルを返す */
static const DOOR_ANM_DATA * search_data_table( const DOOR_ANM_DATA * tbl, u16 cell )
{
	while ( tbl->chr != NULL ) {
		if ( tbl->cellcode == cell ) return tbl;
		tbl++;
	}
	return NULL;
}

/* ドアアニメをセットする */
static s8 set_door_anime( const DOOR_ANM_DATA * data, const ANM_TBL * table, int x, int y )
{
	u8 no;
	s16 * wk;

	if ( CheckTask( door_anime_task ) == TRUE ) return -1;
	no = AddTask( door_anime_task, 80 );
	wk = TaskTable[no].work;
	wk[DWK_X] = x;
	wk[DWK_Y] = y;
	wk[DWK_TBL_L] = (s16)GET_ADR_L(table);
	wk[DWK_TBL_H] = (s16)GET_ADR_H(table);
	wk[DWK_CHR_L] = (s16)GET_ADR_L(data);
	wk[DWK_CHR_H] = (s16)GET_ADR_H(data);

	return no;
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void set_door_close( const DOOR_ANM_DATA * tbl, int x, int y )
{
	write_original_door_cell( x, y );
#if 0
	const ANM_TBL * anm;
	tbl = search_data_table( tbl, GetCellCode(x,y) );
	if ( tbl == NULL ) return;
	anm = normal_close_table;
	anm = search_last_anime( anm );
	write_door_cell( tbl, anm, x, y );
#endif
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void set_door_open( const DOOR_ANM_DATA * tbl, int x, int y )
{
	const ANM_TBL * anm;
	tbl = search_data_table( tbl, GetCellCode(x,y) );
	if ( tbl == NULL ) return;
	anm = normal_open_table;
	anm = search_last_anime( anm );
	write_door_cell( tbl, anm, x, y );
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static s8 set_door_open_anm_task( const DOOR_ANM_DATA * tbl, int x, int y )
{
	tbl = search_data_table( tbl, GetCellCode(x,y) );
	if ( tbl == NULL ) return -1;
	return set_door_anime( tbl, normal_open_table, x, y );
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static s8 set_door_close_anm_task( const DOOR_ANM_DATA * tbl, int x, int y )
{
	tbl = search_data_table( tbl, GetCellCode(x,y) );
	if ( tbl == NULL ) return -1;
	return set_door_anime( tbl, normal_close_table, x, y );
}


//-------------------------------------------------------------------------
//	ドアＳＥの種類を取得
//-------------------------------------------------------------------------
static s8 get_door_se_type( const DOOR_ANM_DATA * tbl, int x, int y )
{
	tbl = search_data_table( tbl, GetCellCode(x,y) );
	if ( tbl == NULL ) return -1;
	return tbl->se_flag;
}


//-------------------------------------------------------------------------
//	※デバッグ用
//-------------------------------------------------------------------------
void TestDoorWrite( int x, int y )
{
	set_door_open_anm_task( total_door_anime_table, x, y );
}



//=========================================================================
//
//	ドアの開閉アニメーション
//
//=========================================================================


//-------------------------------------------------------------------------
//	ドアセルのセット
//-------------------------------------------------------------------------
//　空いた状態のドアのセルをセット
void OpenDoorCellSet( int px, int py )
{
	if( ATR_DoorEffectCheck( GetCellAttribute(px,py) ) ==FALSE ) return;
	set_door_open( total_door_anime_table, px, py );
}

//　閉まった状態のドアのセルをセット
void CloseDoorCellSet( int px, int py )
{
	if( ATR_DoorEffectCheck( GetCellAttribute(px,py) ) ==FALSE ) return;
	set_door_close( total_door_anime_table, px, py );
}

//-------------------------------------------------------------------------
//	ドアアニメ用タスクの登録
//-------------------------------------------------------------------------

s8 AddCloseDoorAnimeTask(int px, int py)
{
	if( ATR_DoorEffectCheck( GetCellAttribute(px,py) ) ==FALSE ) return -1;
	return set_door_close_anm_task( total_door_anime_table, px, py );
}

s8 AddOpenDoorAnimeTask(int px, int py)
{
	if( ATR_DoorEffectCheck( GetCellAttribute(px,py) ) ==FALSE ) return -1;
	return set_door_open_anm_task( total_door_anime_table, px, py );
}

//ドアアニメ終了チェック
u8 CheckDoorAnime()
{
	return CheckTask( door_anime_task );
}

//-------------------------------------------------------------------------
//	ドアの種類でＳＥのタイプを判別
//-------------------------------------------------------------------------
u16 GetDoorSENumber(int px, int py)
{
	s8 type;
	type = get_door_se_type(total_door_anime_table, px, py);
	if (type == 0) {
		return SE_DOOR;
	} else {
		return SE_JIDO_DOA;
	}
}

