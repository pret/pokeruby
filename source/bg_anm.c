//=========================================================================
//
//	マップＢＧアニメーション制御
//
//	2001 GAME FREAK Inc.
//
//	2001.10.22 by tama 全面的に書き直した
//=========================================================================

#include "common.h"

#define BG_ANM_H_GLOBAL
#include "bg_anm.h"

#include "field.h"
#include "map.h"
#include "palanm.h"


extern MapTotalData NowMap;				// 現在のマップの構造体

typedef	void(*pBGanimeFunc)(u16);

#define BGANIME_TRANS_MAX	20
#define CHR_SIZE	0x20			// 16色モードでのキャラデータひとつの大きさ
#define MAPCHR_BASE_ADRS BASE_CHR_ADRS(MAP_LOW_CHR_BASE)	//マップキャラ開始アドレス


//-------------------------------------------------------------
// 変数定義
//-------------------------------------------------------------
static dmaTransTbl BGanimeDMAtransTbl[BGANIME_TRANS_MAX] = {};	//DMA転送用ﾃｰﾌﾞﾙ
static u8 BGanimeDMACount;										//転送回数カウンタ

static u16 fulltime_counter;		//常駐ＢＧアニメ制御カウンタ
static u16 fulltime_max;			//常駐ＢＧアニメ制御カウンタ最大
static u16 parttime_counter;		//非常駐ＢＧアニメ制御カウンタ
static u16 parttime_max;			//非常駐ＢＧアニメ制御カウンタ最大

static pBGanimeFunc BGanimeFullTime;	//常駐ＢＧアニメ用関数ポインタ
static pBGanimeFunc BGanimePartTime;	//非常駐ＢＧアニメ用関数ポインタ





//-------------------------------------------------------------
//-------------------------------------------------------------
static void char_dma_trans_init(void);
static void char_dma_trans_set( u32 src, u32 dest, u16 size);

static void fulltime_anime_init( void );
static void parttime_anime_init( void );
void DefaultBGanimeMain( u16 time );
void DefaultBGanimePartRoom00Main( u16 time );
void DefaultBGanimePartChampMain( u16 time );

static void bg_hana_anime( u16 f );
static void bg_wave_anime( u16 f );
static void bg_ganp_anime( u16 f );
static void bg_suna_anime( u16 f );
static void bg_taki_anime( u16 f );
//static void bg_saka_anime( u16 f );

static void bg_tv_anime( u16 f );


//-------------------------------------------------------------
// データ定義・参照
//-------------------------------------------------------------

#if 0
static const u16 SeaColorData[]= {
	0x7fff,0x7f18,0x7d69,0x7f18,
	//0x7fff,0x7d88,0x7c81,0x7d88,
	//0x7fe0,0x7d88,0x7d88,0x7c81,
	//0x7fff,0x7d88,0x7fff,0x7c81,
	//0x7fff,0x7d88,0x7c81,0x1ce7
};

const PalAnmData SeaPalAnm =
{
	4000,				//ID
	(u16*)SeaColorData,	//転送するｶﾗｰﾊﾟﾚｯﾄｱﾄﾞﾚｽ
//	PA_NON_FADE,		//BEFORE:ｶﾗｰ加減算対象　　AFTER:ｶﾗｰ加減算非対象
	PA_BEFORE,
	16*3+4,				//0～511
	1,					//col_noから いくつまでのﾊﾟﾚｯﾄを対象とするか
	16,					//次のﾊﾟﾚｯﾄｱﾆﾒに移るまでのｳｪｲﾄ
	4,					//何回転送を繰り返すか
	PA_LOOP,			//ｱﾆﾒ終了後の処理
	0					//ｱﾆﾒが全て終了してからPalAnmSeqの動作に移るまでの待ち時間
};
#endif

//=========================================================================
//
//	ＢＧアニメシステム
//
//=========================================================================
//-------------------------------------------------------------
// ＢＧアニメＤＭＡ処理初期化
//-------------------------------------------------------------
static void char_dma_trans_init(void)
{
	BGanimeDMACount = 0;
	CpuArrayClear( 0, BGanimeDMAtransTbl, 32 );
}

//-------------------------------------------------------------
// ＢＧアニメＤＭＡセット
// 
// src		データへのポインタ
// dest		セットする位置
// size		転送サイズ
//-------------------------------------------------------------
static void char_dma_trans_set( u32 src, u32 dest, u16 size)
{
	if(BGanimeDMACount< BGANIME_TRANS_MAX){
		BGanimeDMAtransTbl[BGanimeDMACount].dat	= (const u8 *)src;
		BGanimeDMAtransTbl[BGanimeDMACount].dest = dest;
		BGanimeDMAtransTbl[BGanimeDMACount].size = size;
		BGanimeDMACount++;
	}
}

//-------------------------------------------------------------
// ＢＧアニメＤＭＡ転送処理
// ※VBlank中に呼び出す
//-------------------------------------------------------------
void BGanimeDMAtrans(void)
{
    int i;

    for(i=0;i<BGanimeDMACount;i++){
        DmaCopy(3,
                BGanimeDMAtransTbl[i].dat,		//転送元
                BGanimeDMAtransTbl[i].dest,		//転送先
                BGanimeDMAtransTbl[i].size,		//サイズ
                16);				//転送ｻｲｽﾞ
    }
	BGanimeDMACount = 0;
}

//-------------------------------------------------------------
// マップＢＧアニメ初期化処理
//-------------------------------------------------------------
void MapBGanimeInit(void)
{
	char_dma_trans_init();
	fulltime_anime_init();
	parttime_anime_init();
};

//-------------------------------------------------------------
// マップＢＧアニメ変更処理（非常駐部の切り替え）
//-------------------------------------------------------------
void MapBGanimeChange(void)
{
	parttime_anime_init();
}

//-------------------------------------------------------------
// マップＢＧアニメメイン
// ※メインからループ毎に呼び出す
//-------------------------------------------------------------
void MapBGanimeMain(void)
{
		char_dma_trans_init();	//登録テーブル初期化

		fulltime_counter ++;
		if( fulltime_counter >= fulltime_max ) fulltime_counter = 0;
		parttime_counter ++;
		if( parttime_counter >= parttime_max ) parttime_counter = 0;

		if( BGanimeFullTime != NULL ) BGanimeFullTime( fulltime_counter );
		if( BGanimePartTime != NULL ) BGanimePartTime( parttime_counter );
};

//-------------------------------------------------------------
//	常駐ＢＧアニメ設定初期化
//-------------------------------------------------------------
static void fulltime_anime_init( void )
{
	const MapCharData * p;

	fulltime_counter = 0;
	fulltime_max = 0;
	BGanimeFullTime = NULL;

	p = NowMap.Screen->MainCharData;
	if ( p != NULL && p->BGanime != NULL)  p->BGanime();
}

//-------------------------------------------------------------
//	非常駐ＢＧアニメ設定初期化
//-------------------------------------------------------------
static void parttime_anime_init( void )
{
	const MapCharData * p;

	parttime_counter = 0;
	parttime_max = 0;
	BGanimePartTime = NULL;

	p = NowMap.Screen->SubCharData;
	if( p != NULL && p->BGanime != NULL)  p->BGanime();
}




//=========================================================================
//
//	常駐キャラＢＧアニメ制御
//
//=========================================================================

void BgAnimeInitFieldDefault(void)
{
	fulltime_counter = 0;
	fulltime_max = 256;
	BGanimeFullTime = DefaultBGanimeMain;
}

void BgAnimeInitRoom00(void)
{
	fulltime_counter = 0;
	fulltime_max = 256;
	BGanimeFullTime = DefaultBGanimePartRoom00Main;
}


//=========================================================================
//
//	常駐キャラＢＧアニメ（フィールド常駐）
//
//=========================================================================
void DefaultBGanimeMain( u16 time )
{
	if( time % 16 == 0 ) bg_hana_anime( time / 16 );
	if( time % 16 == 1 ) bg_wave_anime( time / 16 );
	if( time % 16 == 2 ) bg_suna_anime( time / 16 );
	if( time % 16 == 3 ) bg_taki_anime( time / 16 );
	if( time % 16 == 4 ) bg_ganp_anime( time / 16 );
//	if( time % 16 == 5 ) bg_saka_anime( time / 16 );
}

//=========================================================================
//
//	常駐キャラＢＧアニメ（部屋常駐）
//
//=========================================================================
void DefaultBGanimePartRoom00Main( u16 time )
{
	if( time % 8 == 0 ) bg_tv_anime( time / 8 );
}

//-------------------------------------------------------------
//
//	花のアニメーション（フィールド：常駐）
//
//-------------------------------------------------------------
//12.12変更済み
#include "../scaddata/hana.ach"

#define	HANA_POS1	0x1fc
#define	HANA_CHR_SIZE	(CHR_SIZE * 4)
#define HANA_CHR_ADRS1	(MAPCHR_BASE_ADRS + CHR_SIZE * HANA_POS1)

static const u32 hana_data_adrs[]=
{
	(u32)&(hana_Character[HANA_CHR_SIZE * 1]),
	(u32)&(hana_Character[HANA_CHR_SIZE * 0]),
	(u32)&(hana_Character[HANA_CHR_SIZE * 1]),
	(u32)&(hana_Character[HANA_CHR_SIZE * 2]),
};

static void bg_hana_anime( u16 f )
{
	f %= 4;
	char_dma_trans_set( hana_data_adrs[f],HANA_CHR_ADRS1, CHR_SIZE*4 );
}

//-------------------------------------------------------------
//
//	波のアニメーション（フィールド:常駐）
//
//-------------------------------------------------------------
//12.12変更済み
#include "../scaddata/nami.ach"

#define	ALL_WAVE_POS	(0x01b0)
#define	ALL_WAVE_SIZE	(30)
#define	ALL_WAVE_ADRS	(MAPCHR_BASE_ADRS + CHR_SIZE * ALL_WAVE_POS)

static const u32 all_wave_data[] =
{
	(u32)&(nami_Character[CHR_SIZE * (ALL_WAVE_SIZE * 0)]),
	(u32)&(nami_Character[CHR_SIZE * (ALL_WAVE_SIZE * 1)]),
	(u32)&(nami_Character[CHR_SIZE * (ALL_WAVE_SIZE * 2)]),
	(u32)&(nami_Character[CHR_SIZE * (ALL_WAVE_SIZE * 3)]),
	(u32)&(nami_Character[CHR_SIZE * (ALL_WAVE_SIZE * 4)]),
	(u32)&(nami_Character[CHR_SIZE * (ALL_WAVE_SIZE * 5)]),
	(u32)&(nami_Character[CHR_SIZE * (ALL_WAVE_SIZE * 6)]),
	(u32)&(nami_Character[CHR_SIZE * (ALL_WAVE_SIZE * 7)]),
};

static void bg_wave_anime( u16 f )
{
	u8	p;

	p = f % 8;
	char_dma_trans_set( all_wave_data[p],ALL_WAVE_ADRS,ALL_WAVE_SIZE * CHR_SIZE);
}

//-------------------------------------------------------------
//
//	砂浜のアニメーション（フィールド:常駐）
//
//-------------------------------------------------------------
//12.12変更済み
#include "../scaddata/nami2.ach"

#define	SUNA_WAVE_POS1	0x01d0
#define	SUNA_WAVE_ADRS1	(MAPCHR_BASE_ADRS + CHR_SIZE * SUNA_WAVE_POS1)

static const u32 suna_wave_data1[] =
{
	(u32)&(nami2_Character[0 * CHR_SIZE]),
	(u32)&(nami2_Character[10 * CHR_SIZE]),
	(u32)&(nami2_Character[20 * CHR_SIZE]),
	(u32)&(nami2_Character[30 * CHR_SIZE]),
	(u32)&(nami2_Character[40 * CHR_SIZE]),
	(u32)&(nami2_Character[50 * CHR_SIZE]),
	(u32)&(nami2_Character[60 * CHR_SIZE]),
	(u32)&(nami2_Character[0 * CHR_SIZE]),
};

static void bg_suna_anime( u16 f )
{
	f %= 8;
	char_dma_trans_set( suna_wave_data1[f]	,SUNA_WAVE_ADRS1, CHR_SIZE*10 );
}

//-------------------------------------------------------------
//
//	滝のアニメーション（フィールド:常駐）
//
//-------------------------------------------------------------
//12.12変更済み(要確認)
#include "../scaddata/taki.ach"

#define	TAKI_WAVE_POS1	0x01f0
#define	TAKI_WAVE_ADRS1	(MAPCHR_BASE_ADRS + CHR_SIZE * TAKI_WAVE_POS1)

static const u32 taki_wave_data1[] =
{
	(u32)&(taki_Character[ 0 * CHR_SIZE]),
	(u32)&(taki_Character[ 6 * CHR_SIZE]),
	(u32)&(taki_Character[12 * CHR_SIZE]),
	(u32)&(taki_Character[18 * CHR_SIZE]),
};

static void bg_taki_anime( u16 f )
{
	f %= 4;
	char_dma_trans_set( taki_wave_data1[f]	,TAKI_WAVE_ADRS1, CHR_SIZE*6 );
}

//-------------------------------------------------------------
//
//	坂のアニメーション（フィールド:常駐）
//
//-------------------------------------------------------------
#if 0
#include "../scaddata/saka.ach"

#define	SAKA_WAVE_POS1	0x01a6
#define	SAKA_WAVE_ADRS1	(MAPCHR_BASE_ADRS + CHR_SIZE * SAKA_WAVE_POS1)

static const u32 saka_wave_data1[] =
{
	(u32)&(Saka_Character[ 0 * CHR_SIZE]),
	(u32)&(Saka_Character[ 4 * CHR_SIZE]),
	(u32)&(Saka_Character[ 8 * CHR_SIZE]),
	(u32)&(Saka_Character[12 * CHR_SIZE]),
};

static void bg_saka_anime( u16 f )
{
	f %= 4;
	char_dma_trans_set( saka_wave_data1[f]	,SAKA_WAVE_ADRS1, CHR_SIZE*4 );
}
#endif



//=========================================================================
//
//	非常駐キャラＢＧアニメ制御
//
//=========================================================================
void DefaultBGanimePart2Main( u16 time );
//void DefaultBGanimePart4Main( u16 time );
void DefaultBGanimePart5Main( u16 time );
void DefaultBGanimePart6Main( u16 time );
//void DefaultBGanimePart10Main( u16 time );
void DefaultBGanimePart11Main( u16 time );
void DefaultBGanimePart12Main( u16 time );
void DefaultBGanimeSeaMain( u16 time );
void DefaultBGanimeCaveMain( u16 time );
void DefaultBGanimePartGym03Main( u16 time );
void DefaultBGanimePartGym08Main( u16 time );
void DefaultBGanimePartJitenMain( u16 time );

void BgAnimeInitField01(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = NULL;
}

void BgAnimeInitField02(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimePart2Main;
}

void BgAnimeInitField03(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = NULL;
}

void BgAnimeInitField04(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = NULL;
#if 0
	parttime_max = 112;
	BGanimePartTime = DefaultBGanimePart4Main;
#endif
}

void BgAnimeInitField05(void)
{
	parttime_counter = fulltime_counter;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimePart5Main;
}

void BgAnimeInitField06(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimePart6Main;
}

void BgAnimeInitField07(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = NULL;
}

void BgAnimeInitField08(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = NULL;
}

void BgAnimeInitField09(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = NULL;
}

void BgAnimeInitField10(void)
{
#if 0
	parttime_counter = fulltime_counter;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimePart10Main;
#endif
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = NULL;
}

void BgAnimeInitField11(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimePart11Main;
}

void BgAnimeInitField12(void)
{
	parttime_counter = fulltime_counter;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimePart12Main;
}

void BgAnimeInitField13(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = NULL;
}

void BgAnimeInitFieldSea(void)
{
	parttime_counter = 0;
	parttime_max = 128;
	BGanimePartTime = DefaultBGanimeSeaMain;
}

void BgAnimeInitGym08(void)
{
	parttime_counter = 0;
	parttime_max = 240;
	BGanimePartTime = DefaultBGanimePartGym08Main;
}

void BgAnimeInitCave(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimeCaveMain;
}

void BgAnimeInitChamp(void)
{
	parttime_counter = 0;
	parttime_max = 128;
	BGanimePartTime = DefaultBGanimePartChampMain;
}

void BgAnimeInitGym03(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimePartGym03Main;
}

void BgAnimeInitJiten(void)
{
	parttime_counter = 0;
	parttime_max = fulltime_max;
	BGanimePartTime = DefaultBGanimePartJitenMain;
}

//=========================================================================
//
//	非常駐キャラＢＧアニメ（フィールド１）
//
//=========================================================================
//static void bg_deepwave_anime( u16 f );
static void bg_yuge_anime( u8 f );
static void bg_maruta_anime( u8 f );
static void bg_lakeEv_anime(u16 f,u8 cnt);
static void bg_hanaEv_anime(u16 f,u8 cnt);
static void bg_kaisou_anime( u8 f );
//static void bg_toudai_anime( u8 f );
static void bg_suiryu_anime( u8 f );
static void bg_funsui_anime( u16 f );
static void bg_yougan_anime( u16 f );
static void bg_hanaSaiyuuEv_anime(u16 f,u8 cnt);
static void bg_yougancave_anime( u16 f );

void DefaultBGanimePart2Main( u16 time )
{
	if( time % 8 == 0 ){
		bg_lakeEv_anime( time / 8,	0 );
		bg_funsui_anime( time / 8);
	}
	if( time % 8 == 1 ) bg_lakeEv_anime( time / 8,	1 );
	if( time % 8 == 2 ) bg_lakeEv_anime( time / 8,	2 );
	if( time % 8 == 3 ) bg_lakeEv_anime( time / 8,	3 );
	if( time % 8 == 4 ) bg_lakeEv_anime( time / 8,	4 );
	if( time % 8 == 5 ) bg_lakeEv_anime( time / 8,	5 );
	if( time % 8 == 6 ) bg_lakeEv_anime( time / 8,	6 );
	if( time % 8 == 7 ) bg_lakeEv_anime( time / 8,	7 );
}

#if 0
void DefaultBGanimePart4Main( u16 time )
{
	if( time % 16 == 0 ) bg_toudai_anime( time / 8 );
}
#endif

void DefaultBGanimePart5Main( u16 time )
{
	if( time % 8 == 0 ) bg_hanaEv_anime( time / 8,	0 );
	if( time % 8 == 1 ) bg_hanaEv_anime( time / 8,	1 );
	if( time % 8 == 2 ) bg_hanaEv_anime( time / 8,	2 );
	if( time % 8 == 3 ) bg_hanaEv_anime( time / 8,	3 );
	if( time % 8 == 4 ) bg_hanaEv_anime( time / 8,	4 );
	if( time % 8 == 5 ) bg_hanaEv_anime( time / 8,	5 );
	if( time % 8 == 6 ) bg_hanaEv_anime( time / 8,	6 );
	if( time % 8 == 7 ) bg_hanaEv_anime( time / 8,	7 );
}

void DefaultBGanimePart6Main( u16 time )
{
	if( time % 16 == 0 ) bg_yuge_anime( time / 16 );
	if( time % 16 == 1 ) bg_yougan_anime( time / 16 );
}

void DefaultBGanimePart11Main( u16 time )
{
	if( time % 8 == 0 ) bg_hanaSaiyuuEv_anime( time / 8,	0 );
	if( time % 8 == 1 ) bg_hanaSaiyuuEv_anime( time / 8,	1 );
	if( time % 8 == 2 ) bg_hanaSaiyuuEv_anime( time / 8,	2 );
	if( time % 8 == 3 ) bg_hanaSaiyuuEv_anime( time / 8,	3 );
	if( time % 8 == 4 ) bg_hanaSaiyuuEv_anime( time / 8,	4 );
	if( time % 8 == 5 ) bg_hanaSaiyuuEv_anime( time / 8,	5 );
	if( time % 8 == 6 ) bg_hanaSaiyuuEv_anime( time / 8,	6 );
	if( time % 8 == 7 ) bg_hanaSaiyuuEv_anime( time / 8,	7 );
}

void DefaultBGanimePart12Main( u16 time )
{
	if( time % 16 == 0 ) bg_maruta_anime( time / 16 );
	if( time % 16 == 1 ) bg_suiryu_anime( time / 16 );
}

void DefaultBGanimeSeaMain( u16 time )
{
	if( time % 16 == 0 ) bg_kaisou_anime( time / 16 );
}

void DefaultBGanimeCaveMain( u16 time )
{
	if( time % 16 == 1 ) bg_yougancave_anime( time / 16 );
}

//-------------------------------------------------------------
//
//	岸壁のアニメーション（フィールド:非常駐）
//
//-------------------------------------------------------------
//12.12変更済み(要ﾏｯﾌﾟ確認)
#include "../scaddata/nami1.ach"

#define	GANP_WAVE_POS1	0x01e0
#define	GANP_WAVE_ADRS1	(MAPCHR_BASE_ADRS + CHR_SIZE * GANP_WAVE_POS1)

static const u32 ganp_wave_data1[] =
{
	(u32)&(nami1_Character[0  * CHR_SIZE]),
	(u32)&(nami1_Character[10 * CHR_SIZE]),
	(u32)&(nami1_Character[20 * CHR_SIZE]),
	(u32)&(nami1_Character[30 * CHR_SIZE]),
};

static void bg_ganp_anime( u16 f )
{
	f %= 4;
	char_dma_trans_set( ganp_wave_data1[f]	,GANP_WAVE_ADRS1, CHR_SIZE*10 );
}

//-------------------------------------------------------------
//
//	湯気のアニメーション（フィールド:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/yuge.ach"

#define	YUGE1_POS	0x0120
#define	YUGE2_POS	0x0124
#define	YUGE1_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * YUGE1_POS)
#define	YUGE2_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * YUGE2_POS)

static const u32 yuge_data[] =
{
	(u32)&(yuge_Character[CHR_SIZE * 0]),
	(u32)&(yuge_Character[CHR_SIZE * 4]),
	(u32)&(yuge_Character[CHR_SIZE * 8]),
	(u32)&(yuge_Character[CHR_SIZE * 12]),
};

static void bg_yuge_anime( u8 f )
{
	u8	p;

	p = f%4;
	char_dma_trans_set( yuge_data[p],	YUGE1_ADRS, CHR_SIZE*4 );
	p = (f+2)%4;
	char_dma_trans_set( yuge_data[p],	YUGE2_ADRS, CHR_SIZE*4 );
}


//-------------------------------------------------------------
//
//	丸太のアニメーション（フィールド:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/maruta.ach"

#define	MARUTA_POS	0x01D0
#define	MARUTA_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * MARUTA_POS)

static const u32 maruta_data[] =
{
	(u32)&(maruta_Character[CHR_SIZE * 0]),
	(u32)&(maruta_Character[CHR_SIZE * 30]),
	(u32)&(maruta_Character[CHR_SIZE * 60]),
	(u32)&(maruta_Character[CHR_SIZE * 30]),
};

static void bg_maruta_anime( u8 f )
{
	f %= 4;
	char_dma_trans_set( maruta_data[f],	MARUTA_ADRS, CHR_SIZE*30 );
}


//-------------------------------------------------------------
//
//	海草のアニメーション（フィールド:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/kaisou.ach"

#define	KAISOU_POS	0x01F0
#define	KAISOU_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * KAISOU_POS)

static const u32 kaisou_data[] =
{
	(u32)&(kaisou_Character[CHR_SIZE * 0]),
	(u32)&(kaisou_Character[CHR_SIZE * 4]),
	(u32)&(kaisou_Character[CHR_SIZE * 8]),
	(u32)&(kaisou_Character[CHR_SIZE * 12]),
};

static void bg_kaisou_anime( u8 f )
{
	f %= 4;
	char_dma_trans_set( kaisou_data[f],	KAISOU_ADRS, CHR_SIZE*4 );
}


#if 0
//-------------------------------------------------------------
//
//	灯台のアニメーション（フィールド:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/tower.ach"

#define	TOUDAI_POS	0x00E0
#define	TOUDAI_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * TOUDAI_POS)

static const u32 toudai_data[] =
{
	(u32)&(tower_Character[CHR_SIZE * 0]),
	(u32)&(tower_Character[CHR_SIZE * 5]),
	(u32)&(tower_Character[CHR_SIZE * 10]),
	(u32)&(tower_Character[CHR_SIZE * 15]),
	(u32)&(tower_Character[CHR_SIZE * 20]),
	(u32)&(tower_Character[CHR_SIZE * 25]),
	(u32)&(tower_Character[CHR_SIZE * 30]),
};

static void bg_toudai_anime( u8 f )
{
	f %= 7;
	char_dma_trans_set( toudai_data[f],	TOUDAI_ADRS, CHR_SIZE*5);
}

#endif


//-------------------------------------------------------------
//
//	水流のアニメーション（フィールド:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/suiryu.ach"

#define	SUIRYU_POS	0x01F0
#define	SUIRYU_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * SUIRYU_POS)

static const u32 suiryu_data[] =
{
	(u32)&(suiryu_Character[CHR_SIZE * 0]),
	(u32)&(suiryu_Character[CHR_SIZE * 8]),
	(u32)&(suiryu_Character[CHR_SIZE * 16]),
	(u32)&(suiryu_Character[CHR_SIZE * 24]),
	(u32)&(suiryu_Character[CHR_SIZE * 32]),
	(u32)&(suiryu_Character[CHR_SIZE * 40]),
	(u32)&(suiryu_Character[CHR_SIZE * 48]),
	(u32)&(suiryu_Character[CHR_SIZE * 56]),
};

static void bg_suiryu_anime( u8 f )
{
	f %= 8;
	char_dma_trans_set( suiryu_data[f],	SUIRYU_ADRS, CHR_SIZE*8);
}


//=========================================================================
//
//	非常駐キャラＢＧアニメ（フィールド）
//
//=========================================================================
//-------------------------------------------------------------
//
//	花のアニメーション（フィールド）
//
//-------------------------------------------------------------
//12.12変更済み(要ﾊﾟﾚｯﾄ確認)
#include "../scaddata/hana2.ach"

#define	HANA_EV_POS1	0x60
#define	HANA_EV_POS2	0x64
#define	HANA_EV_POS3	0x68
#define	HANA_EV_POS4	0x6c
#define	HANA_EV_POS5	0x70
#define	HANA_EV_POS6	0x74
#define	HANA_EV_POS7	0x78
#define	HANA_EV_POS8	0x7c
#define	HANA_EV2_POS1	0x80
#define	HANA_EV2_POS2	0x84
#define	HANA_EV2_POS3	0x88
#define	HANA_EV2_POS4	0x8c
#define	HANA_EV2_POS5	0x90
#define	HANA_EV2_POS6	0x94
#define	HANA_EV2_POS7	0x98
#define	HANA_EV2_POS8	0x9c
#define HANA_EV_CHR_ADRS1	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV_POS1)
#define HANA_EV_CHR_ADRS2	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV_POS2)
#define HANA_EV_CHR_ADRS3	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV_POS3)
#define HANA_EV_CHR_ADRS4	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV_POS4)
#define HANA_EV_CHR_ADRS5	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV_POS5)
#define HANA_EV_CHR_ADRS6	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV_POS6)
#define HANA_EV_CHR_ADRS7	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV_POS7)
#define HANA_EV_CHR_ADRS8	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV_POS8)
#define HANA_EV2_CHR_ADRS1	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV2_POS1)
#define HANA_EV2_CHR_ADRS2	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV2_POS2)
#define HANA_EV2_CHR_ADRS3	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV2_POS3)
#define HANA_EV2_CHR_ADRS4	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV2_POS4)
#define HANA_EV2_CHR_ADRS5	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV2_POS5)
#define HANA_EV2_CHR_ADRS6	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV2_POS6)
#define HANA_EV2_CHR_ADRS7	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV2_POS7)
#define HANA_EV2_CHR_ADRS8	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_EV2_POS8)

#define	HANA_EV_PAT_NUM		(12)
#define	HANA_EV_PAT_NUM2	(4)

static const u32 hanaEv_pos_tbl[]=
{
	(u32)HANA_EV_CHR_ADRS1,
	(u32)HANA_EV_CHR_ADRS2,
	(u32)HANA_EV_CHR_ADRS3,
	(u32)HANA_EV_CHR_ADRS4,
	(u32)HANA_EV_CHR_ADRS5,
	(u32)HANA_EV_CHR_ADRS6,
	(u32)HANA_EV_CHR_ADRS7,
	(u32)HANA_EV_CHR_ADRS8,
};

static const u32 hanaEv2_pos_tbl[]=
{
	(u32)HANA_EV2_CHR_ADRS1,
	(u32)HANA_EV2_CHR_ADRS2,
	(u32)HANA_EV2_CHR_ADRS3,
	(u32)HANA_EV2_CHR_ADRS4,
	(u32)HANA_EV2_CHR_ADRS5,
	(u32)HANA_EV2_CHR_ADRS6,
	(u32)HANA_EV2_CHR_ADRS7,
	(u32)HANA_EV2_CHR_ADRS8,
};

static const u32 hanaEv_data_adrs[HANA_EV_PAT_NUM]=
{
	(u32)&(hana2_Character[0x0000 * CHR_SIZE]),
	(u32)&(hana2_Character[0x0000 * CHR_SIZE]),
	(u32)&(hana2_Character[0x0004 * CHR_SIZE]),
	(u32)&(hana2_Character[0x0008 * CHR_SIZE]),
	(u32)&(hana2_Character[0x000c * CHR_SIZE]),
	(u32)&(hana2_Character[0x000c * CHR_SIZE]),
	(u32)&(hana2_Character[0x000c * CHR_SIZE]),
	(u32)&(hana2_Character[0x000c * CHR_SIZE]),
	(u32)&(hana2_Character[0x000c * CHR_SIZE]),
	(u32)&(hana2_Character[0x000c * CHR_SIZE]),
	(u32)&(hana2_Character[0x0008 * CHR_SIZE]),
	(u32)&(hana2_Character[0x0004 * CHR_SIZE]),
};

static const u32 hanaEv2_data_adrs[HANA_EV_PAT_NUM]=
{
	(u32)&(hana2_Character[(0x0000+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x0000+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x0004+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x0008+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x000c+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x000c+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x000c+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x000c+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x000c+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x000c+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x0008+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x0004+0x14) * CHR_SIZE]),
};

static const u32 hanaEv_data_adrs2[HANA_EV_PAT_NUM2]=
{
	(u32)&(hana2_Character[0x0000 * CHR_SIZE]),
	(u32)&(hana2_Character[0x0000 * CHR_SIZE]),
	(u32)&(hana2_Character[0x0010 * CHR_SIZE]),
	(u32)&(hana2_Character[0x0010 * CHR_SIZE]),
};

static const u32 hanaEv2_data_adrs2[HANA_EV_PAT_NUM2]=
{
	(u32)&(hana2_Character[(0x0000+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x0000+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x0010+0x14) * CHR_SIZE]),
	(u32)&(hana2_Character[(0x0010+0x14) * CHR_SIZE]),
};

static void bg_hanaEv_anime(u16 f,u8 cnt)
{
	f -= cnt;

	if(f<HANA_EV_PAT_NUM){
		f %= HANA_EV_PAT_NUM;
		char_dma_trans_set( hanaEv_data_adrs[f],hanaEv_pos_tbl[cnt],CHR_SIZE*4);
		char_dma_trans_set( hanaEv2_data_adrs[f],hanaEv2_pos_tbl[cnt],CHR_SIZE*4);
	}else{
		f %= HANA_EV_PAT_NUM2;
		char_dma_trans_set( hanaEv_data_adrs2[f],hanaEv_pos_tbl[cnt],CHR_SIZE*4);
		char_dma_trans_set( hanaEv2_data_adrs2[f],hanaEv2_pos_tbl[cnt],CHR_SIZE*4);
	}
}


//-------------------------------------------------------------
//
//	湖のアニメーション（フィールド）
//
//-------------------------------------------------------------
//12.12変更済み
#include "../scaddata/nami3.ach"

#define	LAKE_EV_POS1	0x80
#define	LAKE_EV_POS2	0x84
#define	LAKE_EV_POS3	0x88
#define	LAKE_EV_POS4	0x8c
#define	LAKE_EV_POS5	0x90
#define	LAKE_EV_POS6	0x94
#define	LAKE_EV_POS7	0x98
#define	LAKE_EV_POS8	0x9c
#define LAKE_EV_CHR_ADRS1	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * LAKE_EV_POS1)
#define LAKE_EV_CHR_ADRS2	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * LAKE_EV_POS2)
#define LAKE_EV_CHR_ADRS3	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * LAKE_EV_POS3)
#define LAKE_EV_CHR_ADRS4	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * LAKE_EV_POS4)
#define LAKE_EV_CHR_ADRS5	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * LAKE_EV_POS5)
#define LAKE_EV_CHR_ADRS6	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * LAKE_EV_POS6)
#define LAKE_EV_CHR_ADRS7	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * LAKE_EV_POS7)
#define LAKE_EV_CHR_ADRS8	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * LAKE_EV_POS8)

#define	LAKE_EV_PAT_NUM		(8)

static const u32 lakeEv_pos_tbl[]={
(u32)LAKE_EV_CHR_ADRS1,(u32)LAKE_EV_CHR_ADRS2,
(u32)LAKE_EV_CHR_ADRS3,(u32)LAKE_EV_CHR_ADRS4,
(u32)LAKE_EV_CHR_ADRS5,(u32)LAKE_EV_CHR_ADRS6,
(u32)LAKE_EV_CHR_ADRS7,(u32)LAKE_EV_CHR_ADRS8,
};

static const u32 lakeEv_data_adrs[]=
{
	(u32)&(nami3_Character[0x0000 * CHR_SIZE]),
	(u32)&(nami3_Character[0x0004 * CHR_SIZE]),
	(u32)&(nami3_Character[0x0008 * CHR_SIZE]),
	(u32)&(nami3_Character[0x000c * CHR_SIZE]),
	(u32)&(nami3_Character[0x0010 * CHR_SIZE]),
	(u32)&(nami3_Character[0x0014 * CHR_SIZE]),
	(u32)&(nami3_Character[0x0018 * CHR_SIZE]),
	(u32)&(nami3_Character[0x001c * CHR_SIZE]),
};

static void bg_lakeEv_anime(u16 f,u8 cnt)
{
	f -= cnt;
	f %= LAKE_EV_PAT_NUM;

	if(lakeEv_data_adrs[f]){
		char_dma_trans_set( lakeEv_data_adrs[f]	,lakeEv_pos_tbl[cnt],CHR_SIZE*4);
	}
}

//-------------------------------------------------------------
//
//	滝のアニメーション（フィールド）
//
//-------------------------------------------------------------
#include "../scaddata/hunsui.ach"
#define	FUNSUI_POS	0x01c0
#define	FUNSUI_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * FUNSUI_POS)

static const u32 funsui_data[] =
{
	(u32)&(hunsui_Character[ 0 * CHR_SIZE]),
	(u32)&(hunsui_Character[ 4 * CHR_SIZE]),
};

static void bg_funsui_anime( u16 f )
{
	f %= 2;
	char_dma_trans_set( funsui_data[f]	,FUNSUI_ADRS, CHR_SIZE*4 );
}

//-------------------------------------------------------------
//
//	溶岩のアニメーション（フィールド）
//
//-------------------------------------------------------------
#include "../scaddata/yougan.ach"
#define	YOUGAN_POS	0x00a0
#define	YOUGAN_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * YOUGAN_POS)

static const u32 yougan_data[] =
{
	(u32)&(yougan_Character[ 0 * CHR_SIZE]),
	(u32)&(yougan_Character[ 4 * CHR_SIZE]),
	(u32)&(yougan_Character[ 8 * CHR_SIZE]),
	(u32)&(yougan_Character[12 * CHR_SIZE]),
};

static void bg_yougan_anime( u16 f )
{
	f %= 4;
	char_dma_trans_set( yougan_data[f]	,YOUGAN_ADRS, CHR_SIZE*4 );
}

//-------------------------------------------------------------
//
//	花のアニメーション（フィールド：サイユウ）
//
//-------------------------------------------------------------
#include "../scaddata/hana3.ach"

#define	HANA_SEV_POS1	0xe0
#define	HANA_SEV_POS2	0xe4
#define	HANA_SEV_POS3	0xe8
#define	HANA_SEV_POS4	0xec
#define	HANA_SEV_POS5	0xf0
#define	HANA_SEV_POS6	0xf4
#define	HANA_SEV_POS7	0xf8
#define	HANA_SEV_POS8	0xfc
#define HANA_SEV_CHR_ADRS1	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_SEV_POS1)
#define HANA_SEV_CHR_ADRS2	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_SEV_POS2)
#define HANA_SEV_CHR_ADRS3	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_SEV_POS3)
#define HANA_SEV_CHR_ADRS4	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_SEV_POS4)
#define HANA_SEV_CHR_ADRS5	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_SEV_POS5)
#define HANA_SEV_CHR_ADRS6	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_SEV_POS6)
#define HANA_SEV_CHR_ADRS7	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_SEV_POS7)
#define HANA_SEV_CHR_ADRS8	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * HANA_SEV_POS8)

#define	HANA_SEV_PAT_NUM	(8)

static const u32 hanaSaiyuuEv_pos_tbl[]=
{
	(u32)HANA_SEV_CHR_ADRS1,
	(u32)HANA_SEV_CHR_ADRS2,
	(u32)HANA_SEV_CHR_ADRS3,
	(u32)HANA_SEV_CHR_ADRS4,
	(u32)HANA_SEV_CHR_ADRS5,
	(u32)HANA_SEV_CHR_ADRS6,
	(u32)HANA_SEV_CHR_ADRS7,
	(u32)HANA_SEV_CHR_ADRS8,
};

static const u32 hanaSaiyuuEv_data_adrs[HANA_SEV_PAT_NUM]=
{
	(u32)&(hana3_Character[0x0000 * CHR_SIZE]),
	(u32)&(hana3_Character[0x0004 * CHR_SIZE]),
	(u32)&(hana3_Character[0x0008 * CHR_SIZE]),
	(u32)&(hana3_Character[0x000c * CHR_SIZE]),
	(u32)&(hana3_Character[0x0010 * CHR_SIZE]),
	(u32)&(hana3_Character[0x0014 * CHR_SIZE]),
	(u32)&(hana3_Character[0x0018 * CHR_SIZE]),
	(u32)&(hana3_Character[0x001c * CHR_SIZE]),
};

static void bg_hanaSaiyuuEv_anime(u16 f,u8 cnt)
{
	f -= cnt;

	f %= HANA_SEV_PAT_NUM;
	char_dma_trans_set( hanaSaiyuuEv_data_adrs[f],hanaSaiyuuEv_pos_tbl[cnt],CHR_SIZE*4);
}

//-------------------------------------------------------------
//
//	溶岩のアニメーション（洞窟）
//
//-------------------------------------------------------------
#define	YOUGANCAVE_POS	0x01a0
#define	YOUGANCAVE_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * YOUGANCAVE_POS)

static void bg_yougancave_anime( u16 f )
{
	f %= 4;
	char_dma_trans_set( yougan_data[f]	,YOUGANCAVE_ADRS, CHR_SIZE*4 );
}



//=========================================================================
//
//	非常駐キャラＢＧアニメ（部屋）
//
//=========================================================================
static void bg_gym_taki_anime( u16 f );
static void bg_gym_lamp_anime( u16 f );
static void bg_gym_spot_anime( u16 f );
static void bg_gym_volt_anime( u16 f );
static void bg_room_hatsuden_anime( u16 f );

void DefaultBGanimePartGym03Main( u16 time )
{
	if( time % 2 == 0 ) bg_gym_volt_anime( time / 2 );
}

void DefaultBGanimePartGym08Main( u16 time )
{
	if( time % 8 == 0 ) bg_gym_taki_anime( time / 8 );
}

void DefaultBGanimePartChampMain( u16 time )
{
	if( time % 2 == 1 ) bg_gym_spot_anime( time / 2 );
	if( time % 8 == 1 ) bg_gym_lamp_anime( time / 8 );
}

void DefaultBGanimePartJitenMain( u16 time )
{
	if( time % 4 == 0 ) bg_room_hatsuden_anime( time / 4 );
}

//-------------------------------------------------------------
//
//	TVのアニメーション（部屋:非常駐）
//
//-------------------------------------------------------------
#define	TV_POS	0x01F0
#define	TV_ADRS	(MAPCHR_BASE_ADRS + CHR_SIZE * TV_POS)

static	const u8 tvanime_Character[256]={
0x91,0x39,0x33,0x33,0x91,0x39,0x33,0x33,0x91,0x39,0x33,0x33,0x21,0x22,0x22,0x22,
0x11,0x11,0x11,0x11,0x11,0x31,0x33,0x33,0x11,0x43,0x94,0x33,0x11,0x43,0x39,0x33,
0x33,0x33,0x33,0x12,0x33,0x33,0x33,0x12,0x33,0x33,0x33,0x12,0x22,0x22,0x22,0x12,
0x11,0x11,0x11,0x11,0x33,0x33,0x13,0x11,0x33,0x33,0x33,0x11,0x33,0x33,0x33,0x11,
0x11,0x93,0x33,0x33,0x11,0x33,0x33,0x33,0x11,0x33,0x33,0x33,0x11,0x33,0x33,0x33,
0x11,0x31,0x33,0x33,0x11,0x11,0x11,0x11,0x10,0x11,0x11,0x19,0x11,0x21,0x22,0x22,
0x33,0x33,0x33,0x11,0x33,0x33,0x33,0x11,0x33,0x33,0x33,0x11,0x33,0x33,0x33,0x11,
0x33,0x33,0x13,0x11,0x11,0x11,0x11,0x11,0x99,0x11,0x11,0x01,0x22,0x22,0x12,0x11,
0x91,0x39,0x33,0x33,0x91,0x39,0x33,0x33,0x91,0x39,0x33,0x33,0x21,0x22,0x22,0x22,
0x11,0x11,0x11,0x11,0x11,0x71,0x77,0x77,0x11,0x47,0x94,0x77,0x11,0x47,0x79,0x77,
0x33,0x33,0x33,0x12,0x33,0x33,0x33,0x12,0x33,0x33,0x33,0x12,0x22,0x22,0x22,0x12,
0x11,0x11,0x11,0x11,0x77,0x77,0x17,0x11,0x77,0x77,0x77,0x11,0x77,0x77,0x77,0x11,
0x11,0x97,0x77,0x77,0x11,0x77,0x77,0x77,0x11,0x77,0x77,0x77,0x11,0x77,0x77,0x77,
0x11,0x71,0x77,0x77,0x11,0x11,0x11,0x11,0x10,0x11,0x11,0x19,0x11,0x21,0x22,0x22,
0x77,0x77,0x77,0x11,0x77,0x77,0x77,0x11,0x77,0x77,0x77,0x11,0x77,0x77,0x77,0x11,
0x77,0x77,0x17,0x11,0x11,0x11,0x11,0x11,0x99,0x11,0x11,0x01,0x22,0x22,0x12,0x11,
};

static const u32 tv_data[] =
{
	(u32)&(tvanime_Character[0x0000 * CHR_SIZE]),
	(u32)&(tvanime_Character[0x0004 * CHR_SIZE]),
};

static void bg_tv_anime( u16 f )
{
	f %= 2;
	char_dma_trans_set( tv_data[f]	,TV_ADRS, CHR_SIZE*4 );
}

//-------------------------------------------------------------
//
//	滝のアニメーション（部屋:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/gym08_1.ach"
#include "../scaddata/gym08_2.ach"
#define	GYM_TAKI1_POS	0x01f0
#define	GYM_TAKI2_POS	0x01d0
#define	GYM_TAKI1_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * GYM_TAKI1_POS)
#define	GYM_TAKI2_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * GYM_TAKI2_POS)

static const u32 gym_taki1_data[] =
{
	(u32)&(gym08_1_Character[ 0 * CHR_SIZE]),
	(u32)&(gym08_1_Character[12 * CHR_SIZE]),
	(u32)&(gym08_1_Character[24 * CHR_SIZE]),
};

static const u32 gym_taki2_data[] =
{
	(u32)&(gym08_2_Character[ 0 * CHR_SIZE]),
	(u32)&(gym08_2_Character[20 * CHR_SIZE]),
	(u32)&(gym08_2_Character[40 * CHR_SIZE]),
};

static void bg_gym_taki_anime( u16 f )
{
	f %= 3;
	char_dma_trans_set( gym_taki1_data[f]	,GYM_TAKI1_ADRS, CHR_SIZE*12 );
	char_dma_trans_set( gym_taki2_data[f]	,GYM_TAKI2_ADRS, CHR_SIZE*20 );
}

//-------------------------------------------------------------
//
//	ライトのアニメーション（四天王部屋:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/light.ach"
#define	GYM_LAMP_POS	0x01f8
#define	GYM_SPOT_POS	0x01e0
#define	GYM_LAMP_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * GYM_LAMP_POS)
#define	GYM_SPOT_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * GYM_SPOT_POS)

static const u32 gym_lamp_data[] =
{
	(u32)&(light_Character[ 8 * CHR_SIZE]),
	(u32)&(light_Character[ 9 * CHR_SIZE]),
	(u32)&(light_Character[10 * CHR_SIZE]),
	(u32)&(light_Character[11 * CHR_SIZE]),
};

static const u32 gym_spot_data[] =
{
	(u32)&(light_Character[ 0 * CHR_SIZE]),
	(u32)&(light_Character[ 4 * CHR_SIZE]),
};

static void bg_gym_lamp_anime( u16 f )
{
	f %= 4;
	char_dma_trans_set( gym_lamp_data[f]	,GYM_LAMP_ADRS, CHR_SIZE*1 );
}

static void bg_gym_spot_anime( u16 f )
{
	f %= 2;
	char_dma_trans_set( gym_spot_data[f]	,GYM_SPOT_ADRS, CHR_SIZE*4 );
}

//-------------------------------------------------------------
//
//	電気のアニメーション（部屋:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/gym03_1.ach"
#define	GYM_VOLT_POS	0x0090
#define	GYM_VOLT_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * GYM_VOLT_POS)

static const u32 gym_volt_data[] =
{
	(u32)&(gym03_1_Character[ 0 * CHR_SIZE]),
	(u32)&(gym03_1_Character[16 * CHR_SIZE]),
};

static void bg_gym_volt_anime( u16 f )
{
	f %= 2;
	char_dma_trans_set( gym_volt_data[f]	,GYM_VOLT_ADRS, CHR_SIZE*16 );
}

//-------------------------------------------------------------
//
//	発電気のアニメーション（部屋:非常駐）
//
//-------------------------------------------------------------
#include "../scaddata/hatsuden.ach"
#define	ROOM_HATSUDEN_POS	0x01F0
#define	ROOM_HATSUDEN_ADRS	(MAPCHR_BASE_ADRS + 0x4000 + CHR_SIZE * ROOM_HATSUDEN_POS)

static const u32 room_hatsuden_data[] =
{
	(u32)&(hatsuden_Character[0 * CHR_SIZE]),
	(u32)&(hatsuden_Character[9 * CHR_SIZE]),
};

static void bg_room_hatsuden_anime( u16 f )
{
	f %= 2;
	char_dma_trans_set( room_hatsuden_data[f]	,ROOM_HATSUDEN_ADRS, CHR_SIZE*9 );
}






