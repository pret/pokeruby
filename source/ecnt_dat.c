//=========================================================================================
//									エンカウントチェック
//									2001/06/11 by nakahiro
//=========================================================================================
#include "ecnt_dat.h"
#include "jiki.h"										// 追加 01/07/17 kaga
#include "fight.h"
#include "poketool.h"
#include "tokusyu.def"
#include "script.h"
#include "syswork.h"		//OBJCHRWORK参照のため
#include "letter.h"			//TVFishingPokeNoSet
#include "calctool.h"		//pp_rand
#include "ev_check.h"
#include "safari.h"
#include "cubecase.h"
#include "mv_poke.h"
#include "sysflag.h"
#include "record.h"


#include "../data/itemsym.h"
#include "../data/encount.dat"	// エンカウントデータ

//=========================================================================================
//									シンボル定義
//=========================================================================================
enum {
	GROUND_ENCOUNT = 0,
	WATER_ENCOUNT,
	ROCK_ENCOUNT,
	FISH_ENCOUNT,
};

//	Ｒ１１９の特殊つり用の定義
#define	R119_FISH_POS_1			131
#define	R119_FISH_POS_2			167
#define	R119_FISH_POS_3			149
#define	R119_FISH_POS_MAX		447

#define	R119_SP_ENCOUNT_MAX		6


//	エンカウント率計算の補正定義
#define	ENCOUNT_PER_MAIN	180
#define	ENCOUNT_PER_SHIFT	4
#define	ENCOUNT_PER			( ENCOUNT_PER_MAIN << ENCOUNT_PER_SHIFT )

//	エンカウントデータがない場合のGetEncountMapの戻り値
#define	NOT_ENCOUNT_MAP			0xffff

enum{
	CHK_TOKUSEI = 0,
	NOT_CHK_TOKUSEI = 1,
};

enum{
	CHK_SPRAY = 1,
	NOT_CHK_SPRAY = 0,
};

//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void StartWildEncountEvent( void );
extern void StartMvPokeEncountEvent( void );

static u8 SprayEncountCheck(u8);			// エンカウントチェック
static void ItemVidroEncountSet( u32 * p );	// ビードロによるエンカウント率変化
static void EquipItemEncountSet( u32 * p );	// 装備アイテムによるエンカウント率変化


//=========================================================================================
//									グローバル変数
//=========================================================================================
extern const VM_CODE item_spray_end[];

u8	encount_flag = 0;	// エンカウントフラグ	0 = ENCOUNT, 1 = NOT ENCOUNT


static const ENCOUNTPOKE sp_encount_poke = { 20, 25, MONSNO_HINBASU };


// sy, ey, psy, 
static const u16 fish_data[] = {
	 0,  45, 0,
	46,  91, R119_FISH_POS_1,
	92, 139, R119_FISH_POS_1+R119_FISH_POS_2
};


//-----------------------------------
//		エンカウントフラグ操作
//-----------------------------------
void EncountFlagSet( u8 flg )
{
	encount_flag = flg;
}

//--------------------------------------
//	特殊エンカウント
//--------------------------------------
static u16 GetFishingHeroPoint( s16 px, s16 py, u8 b )
{
	u16	i,j,p=0,sy,ey;

	sy = fish_data[ b*3 ];
	ey = fish_data[ b*3+1 ];
	p  = fish_data[ b*3+2 ];

	for( i=sy; i<=ey; i++ ){
		for( j=0; j<NowMap.Screen->Xsize; j++ ){
			if( ATR_IsFishingPlace( GetCellAttribute( MAP_LEFT_MARGIN+j, MAP_UP_MARGIN+i ) ) == TRUE ){
				p++;
				if( px == j && py == i )
					return	p;
			}
		}
	}
	return	p+1;
}

static u8 SP_FishingEncountR119(void)
{
	u16	e_pos[R119_SP_ENCOUNT_MAX];
	u16	h_pos;
	s16	px,py;
	u8	b=0,i;

	// r119 以外
	if( !( Fld.MapID.div_id == FIELD && Fld.MapID.map_id == FIELD_R119 ) )
		return	FALSE;

	GetHeroFrontCellPos( &px, &py );	// 釣り位置取得

	px -= MAP_LEFT_MARGIN;
	py -= MAP_UP_MARGIN;

	if( py >= fish_data[0] && py <= fish_data[1] )	b = 0;
	if( py >= fish_data[3] && py <= fish_data[4] )	b = 1;
	if( py >= fish_data[6] && py <= fish_data[7] )	b = 2;

	if( ( pp_rand() % 100 ) >= 50 )	return	FALSE;

	SpFishingSrand( Fld.PopWord[0].random );	// 乱数初期化

	i = 0;
	while(1){
		if( i == R119_SP_ENCOUNT_MAX )	break;

		e_pos[i] = ( SpFishingRand() % R119_FISH_POS_MAX );

		if( e_pos[i] == 0 )	e_pos[i] = R119_FISH_POS_MAX;

		if( !( e_pos[i] >= 1 && e_pos[i] <= 3 ) )	i++;
	}

/*
	for( i=0; i<R119_SP_ENCOUNT_MAX; i++ ){
		e_pos[i] = ( SpFishingRand() % R119_FISH_POS_MAX );
	}
*/

	h_pos = GetFishingHeroPoint( px, py, b );

	for( i=0; i<R119_SP_ENCOUNT_MAX; i++ ){
		if( h_pos == e_pos[i] )	return	TRUE;
	}

	return	FALSE;
}

//---------------------------------------------------
//	r119釣り用乱数制御
//---------------------------------------------------
static unsigned long fr_next = 0;

u16 SpFishingRand(void)
{
	fr_next = fr_next *1103515245L + 12345;
	return (u16)(fr_next / 65536L) ;
}

void SpFishingSrand( u16 seed )
{
	fr_next = seed;
}

// デバッグ用
#ifdef	PM_DEBUG
u16	SP_ENCOUNT_R119ProgramSym( u8 flg )
{
	if( flg == 0 )	return	R119_FISH_POS_1;
	if( flg == 1 )	return	R119_FISH_POS_2;
	if( flg == 2 )	return	R119_FISH_POS_3;

	return	0;
}
#endif	PM_DEBUG

//-----------------------------------
//		ランダムポケモンセット
//-----------------------------------
// 草むら / 砂漠 / 洞窟
static u8 RandamPokeSet(void)
{
	u8	i;

	i = pp_rand() % 100;

	if( i < 20 )			return	0;		// 20%
	if( i >= 20 && i < 40 )	return	1;		// 20%
	if( i >= 40 && i < 50 )	return	2;		// 10%
	if( i >= 50 && i < 60 )	return	3;		// 10%
	if( i >= 60 && i < 70 )	return	4;		// 10%
	if( i >= 70 && i < 80 )	return	5;		// 10%
	if( i >= 80 && i < 85 )	return	6;		//  5%
	if( i >= 85 && i < 90 )	return	7;		//  5%
	if( i >= 90 && i < 94 )	return	8;		//  4%
	if( i >= 94 && i < 98 )	return	9;		//  4%
	if( i == 98 )			return	10;		//  1%
	return	11;								//  1%
}
// 水上 / 海底 / 岩砕き
static u8 RandamPokeSet2(void)
{
	u8	i;

	i = pp_rand() % 100;

	if( i < 60 )			return	0;		// 60%
	if( i >= 60 && i < 90 )	return	1;		// 30%
	if( i >= 90 && i < 95 )	return	2;		//  5%
	if( i >= 95 && i < 99 )	return	3;		//  4%
	return	4;								//  1%
}
// 釣り
static u8 RandamPokeSet3( u8 no )
{
	u8	i;
	u8	p = 0;

	i = pp_rand() % 100;

	switch( no ){
	case 0:		// ボロの釣竿
		if( i < 70 )	p = 0;	// 70%
		else			p = 1;	// 10%
		break;
	case 1:		// 良い釣竿
		if( i < 60 )				p = 2;	// 60%
		if( i >= 60 && i < 80 )		p = 3;	// 20%
		if( i >= 80 && i < 100 )	p = 4;	// 20%
		break;
	case 2:		// 凄い釣竿
		if( i < 40 )				p = 5;	// 40%
		if( i >= 40 && i < 80 )		p = 6;	// 40%
		if( i >= 80 && i < 95 )		p = 7;	// 15%
		if( i >= 95 && i < 99 )		p = 8;	//  4%
		if( i >= 99 && i < 100 )	p = 9;	//  1%
	}

	return	p;
}

//-----------------------
//		レベル設定
//-----------------------
static u8 EncountPokeLvSet( const ENCOUNTPOKE * data )
{
	u8	size;
	u8	plus;
	u8	min, max;

	if( data->MaxLv >= data->MinLv ){
		min = data->MinLv;
		max = data->MaxLv;
	}else{
		min = data->MaxLv;
		max = data->MinLv;
	}

	size = max - min + 1;
	plus = pp_rand() % size;

	return	( min + plus );
}

//----------------------------------------
//		エンカウントマップ番号検索
//----------------------------------------
static u16	GetEncountMap(void)
{
	u16	i=0;

	while(1){
		if( EncountTbl[i].div_id == ENCOUNT_DATA_MAX )	break;
		if( EncountTbl[i].div_id == Fld.MapID.div_id &&
			EncountTbl[i].map_id == Fld.MapID.map_id )
		{
			return	i;
		}
		i++;
	}

	return	NOT_ENCOUNT_MAP;
}

//---------------------
//		性格設定
//---------------------
static u8 GetEncountChar(void)
{
	CUBE * cube;
//	u8	chr=0;
//	u32	chr_tbl=0;
	u8	i, j, k;
	u8	tbl[25];

	if ( IsFieldSafariMode() == TRUE && ( pp_rand() % 100 ) < 80 ){
		cube = SafariCubeTableGet2();
		if( cube != NULL ){

			for( i=0; i<25; i++ )
				tbl[i] = i;

			for( i=0; i<24; i++ ){
				for( j=i+1; j<25; j++ ){
					if( ( pp_rand() & 1 ) == 1 ){
						k = tbl[i];
						tbl[i] = tbl[j];
						tbl[j] = k;
					}
				}
			}

			for( i=0; i<25; i++ ){
				if( CheckCubeLike( tbl[i], cube ) > 0 )
					return	tbl[i];
			}

/*
			while(1){
				chr = pp_rand() % 25;
				if( ( ( chr_tbl >> chr ) & 1 ) == 0 ){
					if( CheckCubeLike( chr, cube ) > 0 )
						return	chr;
					chr_tbl |= ( 1 << chr );
				}

				// 好きな性格なし
				if( chr_tbl == 0x1ffffff )
					break;
			}
*/
		}

	}

	return	pp_rand() % 25;
}

//------------------------------------
//		エンカウントデータセット
//------------------------------------
// 共通
static void EncountParamSet( u16 poke, u8 lv )
{
	PokeParaEnemyInit();
	PokeParaSetChr( &PokeParaEnemy[0], poke, lv, POW_RND, GetEncountChar() );
}

// ノーマル
static u8 SetEncountData( const ENCOUNTDATA * fld, u8 id, u8 sp_check )
{
	u8	no = 0;
	u8	lv = 0;

	switch( id ){
	case GROUND_ENCOUNT:
		no = RandamPokeSet();
		break;
	case WATER_ENCOUNT:
		no = RandamPokeSet2();
		break;
	case ROCK_ENCOUNT:
		no = RandamPokeSet2();
	}

	lv = EncountPokeLvSet( &fld->data[no] );
	if( sp_check == CHK_SPRAY ){
		if( SprayEncountCheck( lv ) == FALSE )	return	FALSE;
	}
	EncountParamSet( fld->data[no].pokeNo, lv );

	return	TRUE;
}
// 釣り
static u16 SetFishingEncountData( const ENCOUNTDATA * fld, u8 type )
{
	u8	no;
	u8	lv;

	no = RandamPokeSet3( type );
	lv = EncountPokeLvSet( &fld->data[no] );
	EncountParamSet( fld->data[no].pokeNo, lv );
	return	fld->data[no].pokeNo;
}
// 大量発生
static u8 SetGenerateData( u8 sp_check )
{
	u16	i;

	if( sp_check == CHK_SPRAY ){
		if( SprayEncountCheck( Fld.tv_encount.level ) == FALSE )
			return	FALSE;
	}

	EncountParamSet( Fld.tv_encount.pokeno, Fld.tv_encount.level );
//	PokeParaPut( &PokeParaEnemy[0], ID_item, &Fld.tv_encount.itemno );

	for( i=0; i<4; i++ )
		PokeWazaSetPos( &PokeParaEnemy[0], Fld.tv_encount.waza[i], i );

	return	TRUE;
}



//-------------------------------------
//		大量発生のイベントチェック
//-------------------------------------
static u8 GenerateCheck(void)
{
	if( Fld.tv_encount.pokeno == 0 )	return	FALSE;

	if( Fld.MapID.map_id == Fld.tv_encount.map_id &&
		Fld.MapID.div_id == Fld.tv_encount.div_id )
	{
		if( pp_rand() % 100 < Fld.tv_encount.appearance )
			return	TRUE;
	}
	return	FALSE;
}


//----------------------------------------
//	エンカウントテスト２ 2002/09/21
//----------------------------------------
/*
static u8	encount0921[200];
static u8	walk_cnt0921;
static u8	test_cnt0921;
static u16	test_avr0921;

void TestEncountDataClear(void)
{
	u8	i;

	for( i=0; i<200; i++ ){
		encount0921[i] = 0;
	}
	walk_cnt0921 = 0;
	test_cnt0921 = 0;
}

static void TestEncountAvr(void)
{
	u8	i;

	test_avr0921 = 0;

	for( i=0; i<200; i++ ){
		test_avr0921 += encount0921[i];
	}
}

static u8 EncountPoint( u16 encount )
{
	walk_cnt0921++;

	if( ( pp_rand() % ENCOUNT_PER ) < encount ){
		encount0921[ test_cnt0921 ] = walk_cnt0921;
		walk_cnt0921 = 0;
		test_cnt0921++;
		if( test_cnt0921 == 200 ){
			test_cnt0921 = 0;
			TestEncountAvr();
		}
		return	TRUE;
	}
	return	FALSE;
}
*/

//--------------------------------
//		エンカウントチェック
//--------------------------------
static u8 EncountPoint( u16 encount )
{
	if( ( pp_rand() % ENCOUNT_PER ) < encount )
		return	TRUE;
	return	FALSE;
}

#ifdef	PM_DEBUG
//--------------------------------
//		エンカウント検証用関数
//--------------------------------
u16 TestEncountPoint( u16 count )
{
	u16 s, i;
	s = 0;
	for (i=0; i<count; i++) {
		if (EncountPoint(20<<ENCOUNT_PER_SHIFT) == TRUE)
			s ++;
	}
	return s;
}
#endif

//----------------------------------------------
//	エンカウント率作成
//----------------------------------------------
static u8 EncountPercent( u32 p, u8 flg )
{
	u8	spa;

	p = p << ENCOUNT_PER_SHIFT;

	// 自転車
	if( CheckHeroState( MY_MV_BIT_CYCLE_R | MY_MV_BIT_CYCLE_S ) )
		p = p * 80 / 100;

	ItemVidroEncountSet( &p );
	EquipItemEncountSet( &p );

	if( flg == CHK_TOKUSEI ){
		if( PokeParaGet( &PokeParaMine[0], ID_egg_exist_flag ) == 0 ){
			spa = SpecialAbirityNoGet( &PokeParaMine[0] );	// 特殊能力取得
			if( spa == TOKUSYU_AKUSYUU )	p = p / 2;		// 悪臭（１／２倍）
			if( spa == TOKUSYU_HAKKOU )		p = p * 2;		// 発酵（２倍）
		}
	}

	if( p > ENCOUNT_PER )	p = ENCOUNT_PER;

	return	EncountPoint( (u16)p );

/*
	p = p >> ENCOUNT_PER_SHIFT;

	if( ( pp_rand()/(RAND_MAX/100) ) < p )
		return	TRUE;
	return	FALSE;
*/
}

//------------------------------------------
//	１歩目のチェック
//------------------------------------------
static u8 OneWalkEncountCheck(void)
{
	if( ( pp_rand() % 100 ) >= 60 )
		return	FALSE;

	return	TRUE;
}

//======================================================================
//						場所別エンカウントチェック
//======================================================================
//-----------------------
//		フィールド
//-----------------------
u8	FieldEncount( u16 attr, u16 old )
{
	u16	map;

	// デバッグメニューでエンカウントOFFの場合はreturn
	if( encount_flag == ENCOUNT_OFF )	return	FALSE;

	map = GetEncountMap();							// 現在のマップ取得
	if( map == NOT_ENCOUNT_MAP ) return	FALSE;		// マップエラー

	// 草むら / 砂漠 / 洞窟
	if( ATR_GroundEncountCheck( attr ) == TRUE ){
		if( EncountTbl[map].ground == NULL )	return	FALSE;

		// １歩目のチェック
		if( old != attr ){
			if( OneWalkEncountCheck() == FALSE )	return	FALSE;
		}

		if( EncountPercent( (u32)EncountTbl[map].ground->percent, CHK_TOKUSEI ) != TRUE )
			return	FALSE;

		if( MvPokeEncount() == TRUE ){
			if( SprayEncountCheck( MvPokeData->lv ) == FALSE )
				return FALSE;
			StartMvPokeEncountEvent();
			return	TRUE;
		}

		if( GenerateCheck() == TRUE && SetGenerateData(CHK_SPRAY) == TRUE ){
			StartWildEncountEvent();
			return TRUE;
		}

		if( SetEncountData( EncountTbl[map].ground, GROUND_ENCOUNT, CHK_SPRAY ) == TRUE ){
			StartWildEncountEvent();
			return TRUE;
		}

		return	FALSE;
	}

	// 水上 / 海底
	// 波乗り状態で､足元が橋アトリビュートの場合も水エンカウントする
	if( ATR_WaterEncountCheck( attr )==TRUE ||
			(CheckHeroState(MY_MV_BIT_SWIM) && ATR_BridgeCheck(attr) == TRUE)){
		if( EncountTbl[map].water == NULL )	return	FALSE;

		// １歩目のチェック
		if( old != attr ){
			if( OneWalkEncountCheck() == FALSE )	return	FALSE;
		}

		if( EncountPercent( (u32)EncountTbl[map].water->percent, CHK_TOKUSEI ) != TRUE )
			return	FALSE;

		if( MvPokeEncount() == TRUE ){
			if( SprayEncountCheck( MvPokeData->lv ) == FALSE )
				return FALSE;
			StartMvPokeEncountEvent();
			return	TRUE;
		}

		if( SetEncountData( EncountTbl[map].water, WATER_ENCOUNT, CHK_SPRAY ) == TRUE ){
			StartWildEncountEvent();
			return TRUE;
		}
	}

	return FALSE;
}


//-------------------
//		岩砕き
//-------------------
void IwakudakiEncount(void)
{
	u16	map;

	map = GetEncountMap();
	if( map == NOT_ENCOUNT_MAP ){
		AnswerWork = 0;
		return;		// マップエラー
	}
	if( EncountTbl[map].rock == NULL ){
		AnswerWork = 0;
		return;
	}

	if( EncountPercent( (u32)EncountTbl[map].rock->percent, NOT_CHK_TOKUSEI ) == TRUE ){
		if( SetEncountData( EncountTbl[map].rock, ROCK_ENCOUNT, CHK_SPRAY ) == TRUE ){
			StartWildEncountEvent();
			AnswerWork = 1;
		}else	AnswerWork = 0;
	}else	AnswerWork = 0;
}

//--------------------
//		甘い香り
//--------------------
u8 AmaikaoriEncount(void)
{
	s16	px,py;
	u16	map;

	GetHeroCellPos( &px, &py );

	map = GetEncountMap();				// 現在のマップ取得
	if( map == NOT_ENCOUNT_MAP ) return	FALSE;	// マップエラー

	// 草むら / 砂漠 / 洞窟
	if( ATR_GroundEncountCheck( GetCellAttribute( px, py ) ) == TRUE ){
		if( EncountTbl[map].ground == NULL )	return	FALSE;

		if( MvPokeEncount() == TRUE ){
			StartMvPokeEncountEvent();
			return	TRUE;
		}
		if( GenerateCheck() == TRUE ){
			SetGenerateData(NOT_CHK_SPRAY);
		}else{
			SetEncountData( EncountTbl[map].ground, GROUND_ENCOUNT, NOT_CHK_SPRAY );
		}
		StartWildEncountEvent();
		return	TRUE;
	}

	// 水上 / 海底
	if( ATR_WaterEncountCheck( GetCellAttribute(px,py) )==TRUE ){
		if( EncountTbl[map].water == NULL )
			return	FALSE;

		if( MvPokeEncount() == TRUE ){
			StartMvPokeEncountEvent();
			return	TRUE;
		}

		SetEncountData( EncountTbl[map].water, WATER_ENCOUNT, NOT_CHK_SPRAY );
		StartWildEncountEvent();
		return	TRUE;
	}

	return	FALSE;
}

//-----------------
//		つり
//-----------------
u8	FishingEncount2(void)	// ( 仮 )
{
	u16	map;

	map = GetEncountMap();
	if( map == NOT_ENCOUNT_MAP ) return	FALSE;		// マップエラー
	if( EncountTbl[map].fish == NULL ) return FALSE;

	return	TRUE;
}

void FishEncountSet( u8 no )
{
	u8	lv;
	u16	poke;

	// ボロの釣竿以外でroad119
//	if( no != 0 && SP_FishingEncountR119() == TRUE ){
	// road119
	if( SP_FishingEncountR119() == TRUE ){
		lv = EncountPokeLvSet( &sp_encount_poke );
		EncountParamSet( sp_encount_poke.pokeNo, lv );
		poke = sp_encount_poke.pokeNo;
	}else{
		poke = SetFishingEncountData( EncountTbl[GetEncountMap()].fish, no );
	}
	
	IncRecord( CNT_TURI );		// ポケモンをつった回数をカウント
	TVFishingPokeNoSet( poke );	// ＴＶ釣ったポケモンナンバー取得
	StartWildEncountEvent();
}

//-------------------------------------------------------------
//	ポケモンナンバー取得（鳴き声用）
//	<引数>	水上エンカウントかどうかを返すためのフラグアドレス
//	<戻り値>	ポケモンナンバー（０の時はデータなし）
//-------------------------------------------------------------
u16 GetEncountVoice(u8 * water_flag)
{
	u16 map;
	u8	no;
	const ENCOUNTDATA * ground;
	const ENCOUNTDATA * water;

	*water_flag = FALSE;

	map = GetEncountMap();
	if ( map == NOT_ENCOUNT_MAP ) return 0;

	ground = EncountTbl[map].ground;
	water = EncountTbl[map].water;

	if ( ground == NULL && water == NULL ) {
		/* エンカウントデータがない場合 */
		return 0;
	}
	else if ( ground != NULL && water == NULL ) {
		/* 陸上エンカウントのみのとき */
		no = RandamPokeSet();
		return ground->data[no].pokeNo;
	}
	else if ( ground == NULL && water != NULL ) {
		/* 水上エンカウントのみのとき */
		*water_flag = TRUE;
		no = RandamPokeSet2();
		return water->data[no].pokeNo;
	}

	if ( pp_rand() % 100 < 80 ) {
		no = RandamPokeSet();
		return ground->data[no].pokeNo;
	} else {
		*water_flag = TRUE;
		no = RandamPokeSet2();
		return water->data[no].pokeNo;
	}
}

//-------------------------------------------------------------
//	ポケモンナンバー取得（鳴き声用）
//	※水エンカウント専用
//	<戻り値>	ポケモンナンバー（０の時はデータなし）
//-------------------------------------------------------------
u16 GetWaterEncountVoice(void)
{
	const ENCOUNTDATA * water;
	u16 map;
	u8	no;

	map = GetEncountMap();
	if (map == NOT_ENCOUNT_MAP) return 0;

	water = EncountTbl[map].water;
	if (water == NULL) return 0;

	no = RandamPokeSet2();
	return water->data[no].pokeNo;
}

//=========================================================================================
//									スプレー処理
//=========================================================================================
//-------------------------------
//		一歩ごとにチェック
//-------------------------------
u8 SprayCheck(void)
{
	u16	p;

	p = GetEventWorkValue( WK_SPRAY_COUNT );

	if( p != 0 ){
		p--;
		SetEventWorkValue( WK_SPRAY_COUNT, p );
		if( p == 0 ){
			StartFieldScript( item_spray_end );
			return	TRUE;
		}
	}

	return	FALSE;
}

//----------------------------------------
//			エンカウントチェック
//	TRUE = ENCOUNT : FALSE = NOT ENCOUNT
//----------------------------------------
static u8 SprayEncountCheck( u8 enmy_Lv )
{
	u8	i;

	if( GetEventWorkValue( WK_SPRAY_COUNT ) == 0 )	return	TRUE;

	for( i=0; i<TEMOTI_POKEMAX; i++ ){
		if( PokeParaGet( &PokeParaMine[i], ID_hp ) != 0 &&
			PokeParaGet( &PokeParaMine[i], ID_tamago_flag ) == 0 )
		{
			if( enmy_Lv >= (u8)PokeParaGet( &PokeParaMine[i], ID_level ) )
				return	TRUE;
			break;
		}
	}
	return	FALSE;
}


//=========================================================================================
//							ビードロによるエンカウント率変化
//=========================================================================================
static void ItemVidroEncountSet( u32 * p )
{
	// しろいビードロ
	if( EventFlagCheck( SYS_ENC_UP_ITEM ) == 1 ){
		*p = *p + ( *p / 2 );
		return;
	}

	// くろいビードロ
	if( EventFlagCheck( SYS_ENC_DOWN_ITEM ) == 1 ){
		*p = *p / 2;
	}
}

//=========================================================================================
//						装備アイテムによるエンカウント率変化
//=========================================================================================
static void EquipItemEncountSet( u32 * p )
{
	if( PokeParaGet( &PokeParaMine[0], ID_item ) == ITEM_KIYOMENOOHUDA )
		*p = ( *p * 2 ) / 3;
}
