//========================================================================================
//									　移動ポケモン
//								　2002/06/24 by nakahiro
//========================================================================================
#include "common.h"
#include "poketool.h"
#include "mv_poke.h"
#include "mv_poke.h"
#include "monsno.def"
#include "map.h"
#include "fight.h"
#include "calctool.h"		//pp_rand
#include "server.def"

#include "../evdata/maparray.h"


//========================================================================================
//										シンボル
//========================================================================================
#define	MV_POKE_LV	40					// Lv.40

#define	DUMMY_MAP_ID	0xff			// ダミーマップID

enum {
	MV_POS_DIVID = 0,
	MV_POS_MAPID,
};


//========================================================================================
//									グローバル変数
//========================================================================================
static u8 mv_poke_hero_pos[3][2] = {};	// 主人公のマップ移動情報
static u8 mv_poke_pos[2] = {};			// 現在の移動ポケモンの位置

static const u8 mv_poke_pos_tbl[][6] =
{
	{ FIELD_R110, FIELD_R111, FIELD_R117, FIELD_R118,   FIELD_R134,   DUMMY_MAP_ID },	// 00 : r110
	{ FIELD_R111, FIELD_R110, FIELD_R117, FIELD_R118,   DUMMY_MAP_ID, DUMMY_MAP_ID },	// 01 : r111
	{ FIELD_R117, FIELD_R111, FIELD_R110, FIELD_R118,   DUMMY_MAP_ID, DUMMY_MAP_ID },	// 02 : r117
	{ FIELD_R118, FIELD_R117, FIELD_R110, FIELD_R111,   FIELD_R119,   FIELD_R123   },	// 03 : r118
	{ FIELD_R119, FIELD_R118, FIELD_R120, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 04 : r119
	{ FIELD_R120, FIELD_R119, FIELD_R121, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 05 : r120
	{ FIELD_R121, FIELD_R120, FIELD_R122, FIELD_R123,   DUMMY_MAP_ID, DUMMY_MAP_ID },	// 06 : r121
	{ FIELD_R122, FIELD_R121, FIELD_R123, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 07 : r122
	{ FIELD_R123, FIELD_R122, FIELD_R118, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 08 : r123
	{ FIELD_R124, FIELD_R121, FIELD_R125, FIELD_R126,   DUMMY_MAP_ID, DUMMY_MAP_ID },	// 09 : r124
	{ FIELD_R125, FIELD_R124, FIELD_R127, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 10 : r125
	{ FIELD_R126, FIELD_R124, FIELD_R127, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 11 : r126
	{ FIELD_R127, FIELD_R125, FIELD_R126, FIELD_R128,   DUMMY_MAP_ID, DUMMY_MAP_ID },	// 12 : r127
	{ FIELD_R128, FIELD_R127, FIELD_R129, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 13 : r128
	{ FIELD_R129, FIELD_R128, FIELD_R130, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 14 : r129
	{ FIELD_R130, FIELD_R129, FIELD_R131, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 15 : r130
	{ FIELD_R131, FIELD_R130, FIELD_R132, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 16 : r131
	{ FIELD_R132, FIELD_R131, FIELD_R133, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 17 : r132
	{ FIELD_R133, FIELD_R132, FIELD_R134, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 18 : r133
	{ FIELD_R134, FIELD_R133, FIELD_R110, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 19 : r134

	{ DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID, DUMMY_MAP_ID },	// 20 : Dummy
};


//---------------------------------------
//	移動ポケモンデータ初期化
//---------------------------------------
void MvPokeDataInit(void)
{
	memset( &Fld.MovingPokemon, 0, sizeof(MOVING_POKEMON) );
}

//---------------------------------------
//	移動データ初期化
//---------------------------------------
void MvPokeMoveDataInit(void)
{
	u8	i;

	for( i=0; i<3; i++ ){
		mv_poke_hero_pos[i][0] = 0;
		mv_poke_hero_pos[i][1] = 0;
	}
	mv_poke_pos[0] = 0;
	mv_poke_pos[1] = 0;
}

//---------------------------------------
//	移動ポケモンセット
//---------------------------------------
void AddMovePokeData(void)
{
#if( PM_VERSION == VERSION_SAPPHIRE )
	PokeParaSet( &PokeParaEnemy[0], MONSNO_RATHIASU, MV_POKE_LV, POW_RND ,RND_NO_SET ,0,ID_NO_SET,0);
	MvPokeData->no = MONSNO_RATHIASU;
#elif( PM_VERSION == VERSION_RUBY )
	PokeParaSet( &PokeParaEnemy[0], MONSNO_RATHIOSU, MV_POKE_LV, POW_RND ,RND_NO_SET ,0,ID_NO_SET,0);
	MvPokeData->no = MONSNO_RATHIOSU;
#endif

	MvPokeData->lv      = MV_POKE_LV;	// Lv
	MvPokeData->cond    = 0;			// 状態異常
	MvPokeData->encount = 1;			// エンカウントフラグ

	MvPokeData->pow_rnd = PokeParaGet( &PokeParaEnemy[0], ID_power_rnd );	// パワー乱数

	// 個性乱数
	MvPokeData->personal_rnd = PokeParaGet( &PokeParaEnemy[0], ID_personal_rnd );

	MvPokeData->hp        = PokeParaGet( &PokeParaEnemy[0], ID_hpmax );		// HP
	MvPokeData->style     = PokeParaGet( &PokeParaEnemy[0], ID_style );		// かっこよさ
	MvPokeData->beautiful = PokeParaGet( &PokeParaEnemy[0], ID_beautiful );	// うつくしさ
	MvPokeData->cute      = PokeParaGet( &PokeParaEnemy[0], ID_cute );		// かわいさ
	MvPokeData->clever    = PokeParaGet( &PokeParaEnemy[0], ID_clever );	// かしこさ
	MvPokeData->strong    = PokeParaGet( &PokeParaEnemy[0], ID_strong );	// たくましさ

	// 現在の移動ポケモンの位置
	mv_poke_pos[MV_POS_DIVID] = FIELD;
	mv_poke_pos[MV_POS_MAPID] = mv_poke_pos_tbl[ pp_rand() % 20 ][0];
}

void AddMvPoke(void)
{
	MvPokeDataInit();
	MvPokeMoveDataInit();
	AddMovePokeData();
}

//---------------------------------------
//	主人公の移動情報セット
//---------------------------------------
void MvPokeHeroPosSet(void)
{
	mv_poke_hero_pos[2][MV_POS_DIVID] = mv_poke_hero_pos[1][MV_POS_DIVID];
	mv_poke_hero_pos[2][MV_POS_MAPID] = mv_poke_hero_pos[1][MV_POS_MAPID];
	mv_poke_hero_pos[1][MV_POS_DIVID] = mv_poke_hero_pos[0][MV_POS_DIVID];
	mv_poke_hero_pos[1][MV_POS_MAPID] = mv_poke_hero_pos[0][MV_POS_MAPID];
	mv_poke_hero_pos[0][MV_POS_DIVID] = Fld.MapID.div_id;
	mv_poke_hero_pos[0][MV_POS_MAPID] = Fld.MapID.map_id;
}

//---------------------------------------
//	ポケモン移動（ランダム）
//---------------------------------------
void MvPokeMoveRnd(void)
{
	u8	pos = 0;

	if( MvPokeData->encount == 0 )	return;

	mv_poke_pos[MV_POS_DIVID] = FIELD;

	while(1){
		pos = mv_poke_pos_tbl[ pp_rand() % 20 ][0];
		if( mv_poke_pos[MV_POS_MAPID] != pos ){
			mv_poke_pos[MV_POS_MAPID] = pos;
			break;
		}
	}
}

//---------------------------------------
//	ポケモン移動（ノーマル）
//---------------------------------------
void MvPokeMove(void)
{
	u8	pos = 0;
	u8	now = 0;

	// 1/16 の確立でランダム移動
	if( ( pp_rand() % 16 ) == 0 ){
		MvPokeMoveRnd();
		return;
	}

	if( MvPokeData->encount == 0 )	return;

	// 隣接するマップへ移動
	for( now=0; now<20; now++ ){
		if( mv_poke_pos[MV_POS_MAPID] == mv_poke_pos_tbl[now][0] ){
			while(1){
				pos = mv_poke_pos_tbl[now][ (pp_rand() % 5)+1 ];
				if( !( mv_poke_hero_pos[2][MV_POS_DIVID] == FIELD &&
					   mv_poke_hero_pos[2][MV_POS_MAPID] == pos ) &&
					 pos != DUMMY_MAP_ID )
				{
					mv_poke_pos[MV_POS_MAPID] = pos;
					break;
				}
			}
			break;
		}
	}
}

//---------------------------------------
//	移動ポケモンの現在地をチェック
//---------------------------------------
static u8 MvPokeCheck( u8 divID, u8 mapID )
{
	if( MvPokeData->encount == 0 )	return	FALSE;

	if( divID == mv_poke_pos[MV_POS_DIVID] && mapID == mv_poke_pos[MV_POS_MAPID] )
		return	TRUE;
	return	FALSE;
}

//---------------------------------------
//	エンカウント時にパラメータセット
//---------------------------------------
static void SetMovePokeParam(void)
{
	PokemonParam * pp = &PokeParaEnemy[0];

	PokeParaSetPowRnd( pp, MvPokeData->no, MvPokeData->lv, MvPokeData->pow_rnd,
		MvPokeData->personal_rnd );

	PokeParaPut( pp, ID_condition, (u8 *)&MvPokeData->cond );		// コンディション
	PokeParaPut( pp, ID_hp,        (u8 *)&MvPokeData->hp );			// HP
	PokeParaPut( pp, ID_style,     (u8 *)&MvPokeData->style );		// かっこよさ
	PokeParaPut( pp, ID_beautiful, (u8 *)&MvPokeData->beautiful ); 	// うつくしさ
	PokeParaPut( pp, ID_cute,      (u8 *)&MvPokeData->cute );		// かわいさ
	PokeParaPut( pp, ID_clever,    (u8 *)&MvPokeData->clever );		// かしこさ
	PokeParaPut( pp, ID_strong,    (u8 *)&MvPokeData->strong );		// たくましさ
}

//---------------------------------------
//	移動ポケモンエンカウントチェック
//	戻り値 : TRUE  = ENCOUNT
//			 FALSE = NOT ENCOUNT
//---------------------------------------
u8	MvPokeEncount(void)
{
	if( MvPokeCheck( Fld.MapID.div_id, Fld.MapID.map_id ) == TRUE ){
		if( ( pp_rand() % 4 ) == 0 ){
			SetMovePokeParam();
			return	TRUE;
		}
	}
	return	FALSE;
}

//---------------------------------------
//	戦闘終了後にパラメータを取得
//	引数 : pp = 敵データ
//---------------------------------------
void GetMovePokeParam( PokemonParam * pp )
{
	MvPokeData->hp   = PokeParaGet( pp, ID_hp );
	MvPokeData->cond = PokeParaGet( pp, ID_condition );
	MvPokeMoveRnd();
}

//---------------------------------------
//	エンカウントフラグを下げる
//---------------------------------------
void MvPokeFlagReset(void)
{
	MvPokeData->encount = 0;
}

//---------------------------------------
//	現在地を取得
//	u8 * div = DIV_ID を保存
//	u8 * map = MAP_ID を保存
//---------------------------------------
void MvPokeNowPosGet( u8 * div, u8 * map )
{
	*div = mv_poke_pos[MV_POS_DIVID];
	*map = mv_poke_pos[MV_POS_MAPID];
}


//========================================================================================
//	デバッグ処理
//========================================================================================
#ifdef	PM_DEBUG

//---------------------------------------
//	現在のマップにセット
//---------------------------------------
void DebugAddMvPoke(void)
{
	if( Fld.MapID.div_id != FIELD )	return;

	AddMovePokeData();

	// 現在の移動ポケモンの位置
	mv_poke_pos[MV_POS_DIVID] = FIELD;
	mv_poke_pos[MV_POS_MAPID] = Fld.MapID.map_id;
}

//---------------------------------------
//	現在のマップ名を取得
//---------------------------------------
extern u8 * CopyMapName( u8 * buf, u16 div, u16 size );

void DebugMvPokePos( u8 * str )
{
	CopyMapName( str, (u16)mv_poke_pos[MV_POS_MAPID], 0 );
}


#endif	PM_DEBUG
