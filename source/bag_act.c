//========================================================================================
//							アクター（ バッグ本体 & タグ画面のタネ ）
//========================================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "task.h"
#include "MaDefine.h"
#include "decord.h"
#include "fight.h"
#include "seed.h"

#include "m_bagbg.acl"
#include "../objdata/bag_ball.ach"

#include "../scaddata/kurabo.ach"	// 01:クラボ
#include "../scaddata/kurabo.acl"


//========================================================================================
//										シンボル
//========================================================================================
#define	POCKET_CNT0		0		// ポケット変更カウント0
#define	POCKET_CNT1		1		// ポケット変更カウント1
#define	ITEM_PICK_CNT	2		// アイテム選択カウント
#define	POCKET_SWITCH	3		// ポケット処理番号
#define	ITEM_SWITCH		4		// アイテム処理番号

#define	TEST_BALL_X		5		// ボールの中心X座標格納
#define	TEST_BALL_Y		6		// ボールの中心Y座標格納
#define	BALL_ANM_NO		7		// ボールの回転方向

//========================================================================================
//									プロトタイプ宣言
//========================================================================================
static void BagMainInit(actWork *);			// 初期設定
static void ChangeBagAct(actWork *);		// バッグのポケット交換
static void ItemPickAct(actWork *);			// アイテムを選択
static void BagMainAct(actWork *);			// メイン
static void ItemSelectAffParam(actWork *);	// アイテム選択のバッグを揺らす処理を終了

static void BagBallInit(actWork *);		// 初期設定
static void BagBallAct(actWork *);		// メイン

//========================================================================================
//									グローバル変数
//========================================================================================
extern s8	item_pick_flg;			// アイテム選択フラグ
extern s8	pocket_change_flg;		// ポケット選択フラグ

//========================================================================================
//										バッグ本体
//========================================================================================
#define	MAIN_BAG_ID		30000

static const ActOamData main_bag_oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)

	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	3,		//OBJサイズ設定	64x64

	0,		//ｷｬﾗｸﾀｰ数
	2,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第3優先)
	7,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

	0,		//AffineParam
};

static const actAnm main_bag_anm00[] =
{
	{ OBJ16_64x64 * 0, 4, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};
static const actAnm main_bag_anm01[] =
{
	{ OBJ16_64x64 * 1, 4, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};
static const actAnm main_bag_anm02[] =
{
	{ OBJ16_64x64 * 2, 4, 0, 0},
	{ ACT_ANMEND, 0, 0, 0 },
};
static const actAnm main_bag_anm03[] =
{
	{ OBJ16_64x64 * 3, 4, 0, 0},
	{ ACT_ANMEND, 0, 0, 0 },
};
static const actAnm main_bag_anm04[] =
{
	{ OBJ16_64x64 * 4, 4, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};
static const actAnm main_bag_anm05[] =
{
	{ OBJ16_64x64 * 5, 4, 0, 0},
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm * const MainBagAnmTbl[] = 
{
	main_bag_anm00,
	main_bag_anm01,
	main_bag_anm03,
	main_bag_anm04,
	main_bag_anm05,
	main_bag_anm02,
};

static const actAffAnm BagAffAnm00[] =
{
	{ 0, 0, -2, 2 },
	{ 0, 0, 2, 4 },
	{ 0, 0, -2, 4 },
	{ 0, 0, 2, 2 },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const BagAffTbl[] =
{
	BagAffAnm00,
};

const CellData M_Bag_Cell = {
	(void *)m_bag_pch_ADRS, OBJ_SIZE16_64x64 * 6, MAIN_BAG_ID
};
const CellData F_Bag_Cell = {
	(void *)f_bag_pch_ADRS, OBJ_SIZE16_64x64 * 6, MAIN_BAG_ID
};

const PalData MainBagPal = { (void *)m_bag_pcl_ADRS, MAIN_BAG_ID };

static const actHeader ActMainBagHeader =
{
	MAIN_BAG_ID,
	MAIN_BAG_ID,
	&main_bag_oam,
	MainBagAnmTbl,
	0,
	BagAffTbl,
	BagMainInit,
};


//---------------------
//		初期設定
//---------------------
static void BagMainInit( actWork * act )
{
	act->anm_no = 0;

	act->work[ POCKET_CNT0 ]   = 0;
	act->work[ POCKET_CNT1 ]   = 0;
	act->work[ ITEM_PICK_CNT ] = 0;
	act->work[ POCKET_SWITCH ] = 0;
	act->work[ ITEM_SWITCH ]   = 0;

	act->move = BagMainAct;
}

//------------------
//		メイン
//------------------
static void BagMainAct( actWork * act )
{
	if( pocket_change_flg != -1 )	ChangeBagAct( act );	//ポケット交換
	if( item_pick_flg != 0 )		ItemPickAct( act );		//アイテム選択
}

//-----------------------------
//		ポケット交換処理
//-----------------------------
static void ChangeBagAct( actWork * act )
{
	switch( act->work[ POCKET_SWITCH ] ){
	case 0:
		if( pocket_change_flg != 6 ){
			act->anm_sw = 1;
			act->anm_no = pocket_change_flg;
			pocket_change_flg = -1;
		}else{
			act->anm_sw = 1;
			act->anm_no = 0;
			act->y -= 4;
			act->work[ POCKET_CNT0 ] = 4;
			act->work[ POCKET_SWITCH ] = 1;

			ItemSelectAffParam( act );
		}
		break;

	case 1:
		if( act->work[ POCKET_CNT0 ] != 0 ){
			if( act->work[ POCKET_CNT1 ] != 0 ){
				act->y++;
				act->work[ POCKET_CNT0 ]--;
			}
			act->work[ POCKET_CNT1 ] = ( act->work[ POCKET_CNT1 ] + 1 ) & 1;
		}else{
			pocket_change_flg = -1;
			act->work[ POCKET_CNT1 ] = 0;
			act->work[ POCKET_SWITCH ] = 0;
		}
		break;
	}
}

//-----------------------------
//		アイテム選択処理
//-----------------------------
static void ItemPickAct( actWork * act )
{
	switch( act->work[ ITEM_SWITCH ] ){
	case 0:
		act->oamData.AffineMode = 1;
		act->aff_tbl = BagAffTbl;
		AffineNumSet( act );
		act->work[ ITEM_SWITCH ] = 1;
		break;
	case 1:
		act->work[ ITEM_PICK_CNT ]++;
		if( act->work[ ITEM_PICK_CNT ] == 12 )	ItemSelectAffParam( act );
	}
}

//---------------------------------------------------
//		アイテム選択のバッグを揺らす処理を終了
//---------------------------------------------------
static void ItemSelectAffParam( actWork * act )
{
	item_pick_flg = 0;
	act->oamData.AffineMode = 0;
	act->work[ ITEM_PICK_CNT ] = 0;
	act->work[ ITEM_SWITCH ] = 0;
	AffineWorkNumDel( act->oamData.AffineParamNo );
}

//--------------------------------
//			バッグセット
//--------------------------------
void AddMainBagActor(void)
{
	AddActor( &ActMainBagHeader, 58, 40, 0 );
}


//========================================================================================
//									バッグ切り替え時のボール
//========================================================================================
static const ActOamData bag_ball_oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)

	0,		//Hﾎﾟｼﾞｼｮﾝ
	4,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	1,		//OBJサイズ設定	16x16

	0,		//ｷｬﾗｸﾀｰ数
	2,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第3優先)
	8,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

	0,		//AffineParam
};

static const actAffAnm BagBallAffAnm00[] =
{
	{ 0, 0, 8, 32 },
	{ ACT_AFEND, 0, 0, 0 },
};
static const actAffAnm BagBallAffAnm01[] =
{
	{ 0, 0, -8, 32 },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const BagBallAffTbl[] =
{
	BagBallAffAnm00,
};
static const actAffAnm * const BagBallAffTbl2[] =
{
	BagBallAffAnm01,
};

static const actAnmData bag_ball_celltrans[] =
{
	{ (const u8 *)bag_ball_Character, 0x20 * 4 },
};

static const PalData BagBallPal = { m_bagbg_Palette, 8 };

static const actHeader ActBagBallHeader =
{
	ACT_TMODE,
	8,
	&bag_ball_oam,
	MainBagAnmTbl,
	bag_ball_celltrans,
	BagBallAffTbl,
	BagBallInit,
};

static u8 bag_ball_act_no = 0;

//---------------------
//		初期設定
//---------------------
static void BagBallInit( actWork * act )
{
	act->work[ POCKET_SWITCH ] = 0;
	act->work[ POCKET_CNT0 ] = 0;
	BagBallAct(act);
	act->move = BagBallAct;
}

//------------------
//		メイン
//------------------
static void BagBallActCPosSet( actWork * act )
{
	act->cx = act->work[ TEST_BALL_X ] - ( ( act->work[ POCKET_CNT0 ] + 1 ) & 1 );
	act->cy = act->work[ TEST_BALL_Y ] - ( ( act->work[ POCKET_CNT0 ] + 1 ) & 1 );
}

static void BagBallAct( actWork * act )
{
	if( act->work[ BALL_ANM_NO ] == 0 )	return;

	switch( act->work[ POCKET_SWITCH ] ){
	case 0:
		act->oamData.AffineMode = 1;
		if( act->work[ BALL_ANM_NO ] == 1 )
			act->aff_tbl = BagBallAffTbl;
		else	act->aff_tbl = BagBallAffTbl2;
		AffineNumSet( act );
		act->work[ POCKET_SWITCH ] = 1;
		act->work[ TEST_BALL_X ] = act->cx;
		act->work[ TEST_BALL_Y ] = act->cy;
		BagBallActCPosSet( act );
		break;
	case 1:
		act->work[ POCKET_CNT0 ]++;
		BagBallActCPosSet( act );
		if( act->work[ POCKET_CNT0 ] == 32 ){
			act->work[ POCKET_CNT0 ] = 0;
			act->work[ POCKET_SWITCH ] = 0;
			act->cx = act->work[ TEST_BALL_X ];
			act->cy = act->work[ TEST_BALL_Y ];
			AffineWorkNumDel( act->oamData.AffineParamNo );
			act->oamData.AffineMode = 0;
			act->move = DummyActMove;
		}
	}
}

//----------------------------------------
//			バッグのボールセット
//----------------------------------------
void AddBagBallActor( u8 p )
{
	ObjPalSet( ( PalData * )&BagBallPal );
	bag_ball_act_no = AddActor( &ActBagBallHeader, 16, 88, 0 );
	ActWork[ bag_ball_act_no ].work[ BALL_ANM_NO ] = p;
}

//--------------------------------
//		バッグのボール削除
//--------------------------------
void DelBagBallAct(void)
{
	ObjPalRegNumDel(8);
	AffineWorkNumDel( ActWork[ bag_ball_act_no ].oamData.AffineParamNo );
	DelActor( &ActWork[ bag_ball_act_no ] );
}



//========================================================================================
//										タグ画面のタネ
//========================================================================================
static void TagSeedActMove( actWork * act );

static const ActOamData tag_seed_oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)
	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	3,		//OBJサイズ設定	64x64
	0,		//ｷｬﾗｸﾀｰ数
	1,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第2優先)
	7,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ
	0,		//AffineParam
};

static const ActOamData tag_seed_oam2 =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	3,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)
	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	3,		//OBJサイズ設定	64x64
	0,		//ｷｬﾗｸﾀｰ数
	0,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第3優先)
	7,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ
	0,		//AffineParam
};

static const actAnm tag_seed_anm[] =
{
	{ 0, 0, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm * const TagSeedAnmTbl[] = 
{
	tag_seed_anm,
};

#define	SEED_CELL	( &UserWork[0] )
static const actAnmData tag_seed_celltrans = { (const u8 *)SEED_CELL,  0x20*64 };

#define	DECORD_CHAR	( &UserWork[0x1000] )
#define	SEED_PAL_ID	30020

static const actHeader ActTagSeedHeader =		//たね（図鑑表示用）
{
	ACT_TMODE,
	SEED_PAL_ID,
	&tag_seed_oam,
	TagSeedAnmTbl,
	&tag_seed_celltrans,
	DummyActAffTbl,
	TagSeedActMove,
};

const actAffAnm SeedActAffAnm0[]={				//たね拡縮回転ﾃｰﾌﾞﾙ（ﾀﾈﾌﾞﾚﾝﾀﾞｰ）
	// X拡縮増分,Y拡縮増分,角度増分,ウェイト
	{-0x01,		-0x01,		 -3,	 0x60},
	{ 0   , 		0,		  0 ,	0x10},
	{-0x02,		-0x02, 		-1, 	0x40},
	{-0x08, 	 0x00,  	0, 		0x10},
	{ 0x00,		-0x08,  	0, 	0x10},

	{0x100,0x100,0,ACT_AFSET},
	{ACT_AFLOOP,0,0,0},
};

const actAffAnm SeedActAffAnm1[]={				//たね拡縮回転ﾃｰﾌﾞﾙ（ﾀﾈﾌﾞﾚﾝﾀﾞｰ）
	// X拡縮増分,Y拡縮増分,角度増分,ウェイト
	{-0x01,		-0x01,		3,	0x60},
	{ 0   , 		0,		0,	0x10},
	{-0x02,		-0x02, 		1, 	0x40},
	{-0x08, 	 0x00,  	0, 	0x10},
	{ 0x00,		-0x08,  	0, 	0x10},

	{0x100,0x100,0,ACT_AFSET},
	{ACT_AFLOOP,0,0,0},
};

const actAffAnm * const  SeedActAffTbl[]={
	SeedActAffAnm0,
	SeedActAffAnm1,
};


static const actHeader ActTagSeedHeader2 =		//たね（タネブレンダー用）
{
	ACT_TMODE,
	SEED_PAL_ID,
	&tag_seed_oam2,
	TagSeedAnmTbl,
	&tag_seed_celltrans,
	SeedActAffTbl,
	DummyActMove,
};

static const void * const seed_char[][2] =
{
	{ (void*)kurabo_pch_ADRS,  (void*)kurabo_pcl_ADRS  },	// 01:クラボ
	{ (void*)kago_pch_ADRS,    (void*)kago_pcl_ADRS    },	// 02:カゴ
	{ (void*)momon_pch_ADRS,   (void*)momon_pcl_ADRS   },	// 03:モモン
	{ (void*)chiigo_pch_ADRS,  (void*)chiigo_pcl_ADRS  },	// 04:チーゴ
	{ (void*)nanashi_pch_ADRS, (void*)nanashi_pcl_ADRS },	// 05:ナナシ
	{ (void*)himeri_pch_ADRS,  (void*)himeri_pcl_ADRS  },	// 06:ヒメリ
	{ (void*)oren_pch_ADRS,    (void*)oren_pcl_ADRS    },	// 07:オレン
	{ (void*)kii_pch_ADRS,     (void*)kii_pcl_ADRS     },	// 08:キー
	{ (void*)ramu_pch_ADRS,    (void*)ramu_pcl_ADRS    },	// 09:ラム
	{ (void*)obon_pch_ADRS,    (void*)obon_pcl_ADRS    },	// 10:オボン

	{ (void*)fira_pch_ADRS,    (void*)fira_pcl_ADRS    },	// 11:フィラ
	{ (void*)ui_pch_ADRS,      (void*)ui_pcl_ADRS      },	// 12:ウイ
	{ (void*)mago_pch_ADRS,    (void*)mago_pcl_ADRS    },	// 13:マゴ
	{ (void*)banji_pch_ADRS,   (void*)banji_pcl_ADRS   },	// 14:バンジ
	{ (void*)ia_pch_ADRS,      (void*)ia_pcl_ADRS      },	// 15:イア
	{ (void*)zuri_pch_ADRS,    (void*)zuri_pcl_ADRS    },	// 16:ズリ
	{ (void*)buzuri_pch_ADRS,  (void*)buzuri_pcl_ADRS  },	// 17:ブリー ( ブズリ )
	{ (void*)nana_pch_ADRS,    (void*)nana_pcl_ADRS    },	// 18:ナナ
	{ (void*)nanayo_pch_ADRS,  (void*)nanayo_pcl_ADRS  },	// 19:セシナ ( ナナヨ )
	{ (void*)pailu_pch_ADRS,   (void*)pailu_pcl_ADRS   },	// 20:パイル

	{ (void*)zaroku_pch_ADRS,  (void*)zaroku_pcl_ADRS  },	// 21:ザロク
	{ (void*)nekobu_pch_ADRS,  (void*)nekobu_pcl_ADRS  },	// 22:ネコブ
	{ (void*)taporu_pch_ADRS,  (void*)taporu_pcl_ADRS  },	// 23:タポル
	{ (void*)rome_pch_ADRS,    (void*)rome_pcl_ADRS    },	// 24:ロメ
	{ (void*)ubu_pch_ADRS,     (void*)ubu_pcl_ADRS     },	// 25:ウブ
	{ (void*)matoma_pch_ADRS,  (void*)matoma_pcl_ADRS  },	// 26:マトマ
	{ (void*)mokoshi_pch_ADRS, (void*)mokoshi_pcl_ADRS },	// 27:モコシ
	{ (void*)gosu_pch_ADRS,    (void*)gosu_pcl_ADRS    },	// 28:ゴス
	{ (void*)rabuta_pch_ADRS,  (void*)rabuta_pcl_ADRS  },	// 29:ラブタ
	{ (void*)nomeru_pch_ADRS,  (void*)nomeru_pcl_ADRS  },	// 30:ノメル

	{ (void*)nowaki_pch_ADRS,  (void*)nowaki_pcl_ADRS  },	// 31:ノワキ
	{ (void*)shiiya_pch_ADRS,  (void*)shiiya_pcl_ADRS  },	// 32:シーヤ
	{ (void*)kaisu_pch_ADRS,   (void*)kaisu_pcl_ADRS   },	// 33:カイス
	{ (void*)dori_pch_ADRS,    (void*)dori_pcl_ADRS    },	// 34:ドリ
	{ (void*)beribu_pch_ADRS,  (void*)beribu_pcl_ADRS  },	// 35:ベリブ

	{ (void*)chiira_pch_ADRS,  (void*)chiira_pcl_ADRS  },	// 36:チイラ
	{ (void*)ryuga_pch_ADRS,   (void*)ryuga_pcl_ADRS   },	// 37:リュガ
	{ (void*)kamura_pch_ADRS,  (void*)kamura_pcl_ADRS  },	// 38:カムラ
	{ (void*)yatapi_pch_ADRS,  (void*)yatapi_pcl_ADRS  },	// 39:ヤタピ
	{ (void*)zua_pch_ADRS,     (void*)zua_pcl_ADRS     },	// 40:ズア

	{ (void*)san_pch_ADRS,     (void*)san_pcl_ADRS     },	// 41:サン
	{ (void*)k_star_pch_ADRS,  (void*)k_star_pcl_ADRS  },	// 42:スター
	{ (void*)nazo_pch_ADRS,    (void*)nazo_pcl_ADRS    }	// 43:ナゾ
};

//------------------------------------------------
//	木の実の絵を 48x48->64x64 へ
//------------------------------------------------
static void SeedCellMake( const u8 * chr, u8 * copy )
{
	u8	i, j;

	memset( copy, 0, sizeof(u8)*0x20*64 );

	copy += ( 0x20 * 8 );

	for( i=0; i<6; i++ ){
		copy += 0x20;
		for( j=0; j<6; j++ ){
			memcpy( copy, chr, sizeof(u8)*0x20 );
			copy += 0x20;
			chr += 0x20;
		}
		if( i != 5 )	copy += 0x20;
	}
}

//------------------------------------------------
//	木の実の絵を解凍
//------------------------------------------------
static void SeedDecordSet( u8 no )
{
	PalData	pal;

	if( no == 42 && CheckRamSeedExist() == TRUE ){
		SeedCellMake( Fld.RamSeed.cgx, SEED_CELL );
		pal.pal_data = Fld.RamSeed.pal;
		pal.reg_num  = SEED_PAL_ID;
		ObjPalSet( ( PalData * )&pal );
		return;
	}

	pal.pal_data = (void *)seed_char[no][1];
	pal.reg_num  = SEED_PAL_ID;
	DecordPalSet( (PalData*)&pal );

	DecordWram( (void *)seed_char[no][0], (void *)DECORD_CHAR );
	SeedCellMake( DECORD_CHAR, SEED_CELL );
}

//-----------------------
//		タネを表示
//-----------------------
u8 SetTagSeedAct( u8 no, s16 x, s16 y )
{
	SeedDecordSet(no);
	return	AddActor( &ActTagSeedHeader, x, y, 0 );
}

static void TagSeedActMove( actWork * act )
{
	act->dy = -ScrY1;
}


//--------------------------------
//		タネのパレットを削除
//--------------------------------
void DelSeedObjPal(void)
{
	ObjPalRegNumDel( SEED_PAL_ID );	// タネ
	ObjPalRegNumDel(8);				// 円
}


//------------------------------------------
//		拡大縮小・座標指定のきくたねの表示
//
//		no:たね
//		x :X座標
//		y :Y座標
//    flag:右向き用=0  左向き用=1
//------------------------------------------
u8 SetTagSeedActEx( u8 no , u8 x ,u8 y, u8 flag)
{
	u8 actno;

	ObjPalRegNumDel( SEED_PAL_ID );

	SeedDecordSet(no);
	actno = AddActor( &ActTagSeedHeader2, x, y, 0 );
	if(flag==1) ActAffAnmChg( &ActWork[actno], 1 );
	return	actno;
}





//========================================================================================
//										タグ画面の円
//========================================================================================
#define	TAG_MARU_ID	10000

const CellData TagMaru_Cell = {
	(void *)tag_maru_pch_ADRS, OBJ_SIZE16_64x64 * 1, TAG_MARU_ID
};

const PalData TagMaru_Pal = { (void *)seedtag_pcl_ADRS, TAG_MARU_ID };

static const ActOamData tag_maru_oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	0,		//OBJ形状設定(正方形)
	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	2,		//OBJサイズ設定	32x32
	0,		//ｷｬﾗｸﾀｰ数
	1,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第2優先)
	0,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ
	0,		//AffineParam
};

static const actAnm TagMaru_Anm[] =
{
	{ OBJ16_32x32 * 0, 0, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 }
};

static const actAnm * const TagMaru_AnmTbl[] = {
	TagMaru_Anm,
};

static const actHeader ActTagMaruHeader =
{
	TAG_MARU_ID,
	TAG_MARU_ID,
	&tag_maru_oam,
	TagMaru_AnmTbl,
	0,
	DummyActAffTbl,
	TagSeedActMove,
};

//---------------------------
//		タグの円を表示
//---------------------------
u8 SetTagMaruAct( s16 x )
{
	return	AddActor( &ActTagMaruHeader, x, 99, 0 );
}
