//=========================================================================
//	
//	fld_tool.c
//
//	フィールド用ツールプログラム
//=========================================================================

#include "common.h"

#include "field.h"

#define FLD_TOOL_H_GLOBAL
#include "fld_tool.h"

#include "fieldmap.h"
#include "mapchr.h"
//#include "weather.h"
#include "wea_ctrl.h"
#include "mapbg.h"
#include "bg_anm.h"
#include "mapname.h"
#include "ev_flag.h"
#include "ev_check.h"
#include "task.h"
#include "fld_task.h"
#include "sxytype.h"
#include "mapparam.h"
#include "warpdata.h"
#include "sysflag.h"
#include "script.h"
#include "map_attr.h"

#include "base.h"				//2001/10/05 by nakahiro
#include "tv.h"					//01/10/18 nohara
#include "ev_time.h"			// UpdateTimeEvent()
#include "ev_fight.h"			// SetRandomRevenger()
#include "jiki.h"				// MyMoveStateMvFlagCheck()
#include "scr_tool.h"			// CyclingRoadEventInit()
#include "mv_poke.h"			// 2001/06/28 by nakahiro
#include "ev_sub.h"
#include "weather.h"

#include "../evdata/maparray.h"



//==================================================================================
//	定数定義
//==================================================================================



//==================================================================================
//	変数定義
//==================================================================================

MapID BeforeMapID = {};
MapID NextMapID = {};
static MapID DivingMapID = {};
static MapID PitfallMapID = {};

static const MapID NULL_MAPID = {-1,-1,-1,-1,-1};




//==================================================================================
//
//	マップデータ設定関連
//		マップ制御全体
//
//==================================================================================

//-----------------------------------------------------------------------------
//	SXYデータのロード処理
//-----------------------------------------------------------------------------
//-------------------------------------------------------------
//	SXYデータをロードする
//-------------------------------------------------------------
void SxyObjDataSet(void)
{
	CpuArrayClear( 0, Fld.SvSxyObj, 32 );
	CpuCopy( NowMap.Sxy->ObjData, Fld.SvSxyObj, sizeof(evObjData) * NowMap.Sxy->ObjMax, 32 );
}

//-------------------------------------------------------------
//	SXYデータを復活させる
//	※コンティニュー時にバージョン変更で不具合が発生しないように
//　　アドレスなどを含むデータを上書きする
//-------------------------------------------------------------
void SxyObjDataRecover(void)
{
	int i;
	const evObjData * src = NowMap.Sxy->ObjData;
	evObjData * dst = Fld.SvSxyObj;

	for( i=0; i<SXY_OBJ_MAX; i++ )
	{
		dst[i].ev_label = src[i].ev_label;
	}

}

//-------------------------------------------------------------
//	SXYの座標データを書き換える
//-------------------------------------------------------------
void SxyObjDataPosChange( u8 id, s16 x, s16 y )
{
	int i;
	evObjData * sxy = Fld.SvSxyObj;

	for ( i=0; i<SXY_OBJ_MAX; i++ ) {
		if ( sxy[i].id == id ) {
			sxy[i].pos_x = x;
			sxy[i].pos_y = y;
			return;
		}
	}
}

//-------------------------------------------------------------
//	SXYの移動属性を書き換える
//-------------------------------------------------------------
void SxyObjDataSiteChange( u8 id, u8 site )
{
	int i;
	evObjData * sxy = Fld.SvSxyObj;

	for ( i=0; i<SXY_OBJ_MAX; i++ ) {
		if ( sxy[i].id == id ) {
			sxy[i].site= site;
			return;
		}
	}
}

//-----------------------------------------------------------------------------
//	表示関連呼び出し
//-----------------------------------------------------------------------------
//-------------------------------------------------------------
//	マップ遷移時のキャラデータなどを初期化
//-------------------------------------------------------------
void InitNowMapVisual(void)
{
	InitMapBG();				// BG 初期化( 座標,ﾀﾞﾐｰVram 初期化 )
	TransMapCharData(NowMap.Screen);
	TransMapPaletteData(NowMap.Screen);
	MakeMapBG();						// ﾀﾞﾐｰVram 展開
	MapBGanimeInit();
}



//==================================================================================
//==================================================================================
//-------------------------------------------------------------
//-------------------------------------------------------------
extern const MapScreenData * const MapScreenTable[];

static const MapScreenData * get_nowmap_screen( void )
{
	u16 id = Fld.MapScreenNo;

	if ( id != 0 ) {
		return MapScreenTable[id-1];
	} else {
		return NULL;
	}
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static void update_now_map_id( void )
{
	BeforeMapID = Fld.MapID;
	Fld.MapID = NextMapID;
	DivingMapID = NULL_MAPID;
	PitfallMapID = NULL_MAPID;
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static void map_id_set( MapID *id, s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y)
{
	id->div_id = div_id;
	id->map_id = map_id;
	id->exit_id = exit_id;
	id->x = x;
	id->y = y;
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static int is_null_mapid( MapID *id )
{
	if ( id->div_id != -1 ) return FALSE;
	if ( id->map_id != -1 ) return FALSE;
	if ( id->exit_id != -1 ) return FALSE;
	if ( id->x != -1 ) return FALSE;
	if ( id->y != -1 ) return FALSE;
	return TRUE;
}

//-----------------------------------------------------------------------------
//	マップデータへのポインタ取得
//-----------------------------------------------------------------------------
const MapTotalData * GetTotalMapData(u16 div_id, u16 map_id)
{
	return (DivisionList[div_id])[map_id];
}

//-----------------------------------------------------------------------------
//	次のマップデータへのポインタ取得
//	※NextMapIDがセットされた直後のみ有効、呼び出す際に注意。
//-----------------------------------------------------------------------------
const MapTotalData * GetNextMapData( void )
{
	return GetTotalMapData( NextMapID.div_id, NextMapID.map_id );
}


//-----------------------------------------------------------------------------
//	マップ構造体をセット(マップ初期化時）
//-----------------------------------------------------------------------------
void SetNowMapData(void)
{
	NowMap = * GetTotalMapData(Fld.MapID.div_id, Fld.MapID.map_id);
	Fld.MapScreenNo = NowMap.screen_id;
	NowMap.Screen = get_nowmap_screen();
}

//-----------------------------------------------------------------------------
//	マップ構造体をセット(コンティニュー時）
//-----------------------------------------------------------------------------
void RecoverNowMapData( void )
{
	NowMap = * GetTotalMapData(Fld.MapID.div_id, Fld.MapID.map_id);
	NowMap.Screen = get_nowmap_screen();
}

//-----------------------------------------------------------------------------
//	出入り口ＩＤから座標を設定
//	　→出入り口ＩＤが正常ならばそれからデータをセット
//	　→座標が正の値ならばそのままセット
//	　→座標が異常な値ならマップの中央の位置にセット
//-----------------------------------------------------------------------------
static void set_now_position(void)
{
	if(Fld.MapID.exit_id >= 0 && Fld.MapID.exit_id < NowMap.Sxy->ConnectMax )
	{
		Fld.MapXpos = NowMap.Sxy->ConnectData[Fld.MapID.exit_id].posX;
		Fld.MapYpos = NowMap.Sxy->ConnectData[Fld.MapID.exit_id].posY;
	}
	else if( Fld.MapID.x >= 0 && Fld.MapID.y >= 0 )
	{
		Fld.MapXpos = Fld.MapID.x;
		Fld.MapYpos = Fld.MapID.y;
	}else{
		Fld.MapXpos = NowMap.Screen->Xsize / 2;
		Fld.MapYpos = NowMap.Screen->Ysize / 2;
	};
}

//-----------------------------------------------------------------------------
//	次のマップへの遷移処理
//-----------------------------------------------------------------------------
void SetNextWorldPosition(void)
{
	update_now_map_id();

	SetNowMapData();
	set_now_position();
}

//-------------------------------------------------------------
//	遷移先をセット
//-------------------------------------------------------------
void NextMapSetDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y)
{
	map_id_set( &NextMapID, div_id, map_id, exit_id, x, y );
}

//-------------------------------------------------------------
//	遷移先をセット（マップＩＤのみ）
//-------------------------------------------------------------
void NextMapSetByID( s8 div_id, s8 map_id, s8 exit_id )
{
	NextMapSetDirect( div_id, map_id, exit_id, -1, -1 );
}

//-------------------------------------------------------------
// 特殊接続指定のセット（マップＩＤ＋現在座標）
//-------------------------------------------------------------
void SetSpecialMapID( u8 sp, s8 div_id, s8 map_id, s8 exit_id )
{
	map_id_set( &Fld.SpMapID, div_id, map_id, exit_id, Fld.MapXpos, Fld.MapYpos );
}

//-------------------------------------------------------------
// 特殊接続指定のセット
//-------------------------------------------------------------
void SetSpecialMapDirect( u8 sp, s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y )
{
	map_id_set( &Fld.SpMapID, div_id, map_id, exit_id, x, y );
}


//-------------------------------------------------------------
// 遷移先を特殊接続指定でセット
//-------------------------------------------------------------
void NextMapSetBySpID( u8 sp_id )
{
	NextMapID = Fld.SpMapID;
}

//-------------------------------------------------------------
// 遷移先をワープＩＤでセット
//-------------------------------------------------------------
void NextMapSetByWarpID( u8 id )
{
	const WARP_POS * wp;
	wp = GetWarpPosByNo( id );
	if ( wp == NULL ) return;
	NextMapSetDirect( wp->div_id, wp->map_id, NO_EXIT_ID, wp->x, wp->y );
}

//-------------------------------------------------------------
//	遷移先をテレポート指定でセット
//-------------------------------------------------------------
void NextMapSetByTelMapID( void )
{
	NextMapID = Fld.TelMapID;
}

//-------------------------------------------------------------
//	テレポート指定をワープＩＤでセット
//-------------------------------------------------------------
void TeleportMapSetByWarpID( u8 id )
{
	const WARP_POS * wp;
	wp = GetWarpPosByNo( id );
	if ( wp == NULL ) return;

	map_id_set( &Fld.TelMapID, wp->div_id, wp->map_id, NO_EXIT_ID, wp->x, wp->y );
}

//-------------------------------------------------------------
//	NextMapID/Fld.MapIDからあなぬけ遷移先をセット
//	※次の遷移先を設定した直後に呼ぶこと
//-------------------------------------------------------------
void NextEscapePosSet(s16 x, s16 y)
{
//	EV_POS p;
	u8 now_type,next_type;
	now_type = GetNowMapType();
	next_type = GetMapTypeByID( NextMapID.div_id, NextMapID.map_id );

	if ( MTYPE_IsFieldCheck(now_type) == FALSE ) return;
	if ( MTYPE_IsFieldCheck(next_type) == TRUE ) return;

//	GetHeroPosition( &p );
	EscapeMapSetDirect(
			Fld.MapID.div_id, Fld.MapID.map_id, -1,
			x - MAP_X_MARGIN,
			y - MAP_Y_MARGIN + 1	/* 一歩下 */
			);
}


//-------------------------------------------------------------
//	あなぬけ指定をセット
//-------------------------------------------------------------
void EscapeMapSetDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y)
{
	map_id_set( &Fld.EscMapID, div_id, map_id, exit_id, x, y );
}

//-------------------------------------------------------------
//	遷移先をあなぬけ指定でセット
//-------------------------------------------------------------
void NextMapSetByEscMapID( void )
{
	NextMapID = Fld.EscMapID;
}

//-------------------------------------------------------------
//	ダイビング遷移先のセット
//-------------------------------------------------------------
void SetDivingMapDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y )
{
	map_id_set( &DivingMapID, div_id, map_id, exit_id, x, y );
}

void NextMapSetByDivingID( void )
{
	NextMapID = DivingMapID;
}

//-------------------------------------------------------------
//	落とし穴接続先のセット
//-------------------------------------------------------------
void SetPitfallMapDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y )
{
	map_id_set( &PitfallMapID, div_id, map_id, exit_id, x, y );
}

void NextMapSetByPitfall( s16 x, s16 y )
{
	if ( is_null_mapid(&PitfallMapID) == TRUE ) {
		NextMapID = BeforeMapID;
		return;
	}
	NextMapSetDirect( PitfallMapID.div_id, PitfallMapID.map_id, NO_EXIT_ID, x, y );
}

//-------------------------------------------------------------
//	コンティニューでの特別マップ遷移関連
//-------------------------------------------------------------
void NextMapSetByContinueMapID( void )
{
	NextMapID = Fld.ContinueMapID;
}

void SetContinueMapDirect( s8 div_id, s8 map_id, s8 exit_id, s8 x, s8 y )
{
	map_id_set( &Fld.ContinueMapID, div_id, map_id, exit_id, x, y );
}

void SetContinueMapByWarpID( u8 id )
{
	const WARP_POS * wp;
	wp = GetWarpPosByNo( id );
	if ( wp == NULL ) return;
	map_id_set( &Fld.ContinueMapID, wp->div_id, wp->map_id, NO_EXIT_ID, wp->x, wp->y );
}

void SetContinueMapBySpID( u8 id )
{
	Fld.ContinueMapID = Fld.SpMapID;
}

//==================================================================================
//
//	天地方向へのリンクによる遷移
//
//==================================================================================
//-------------------------------------------------------------
//-------------------------------------------------------------
static const MLink * search_nextlink_by_site( u8 id )
{
	int i,count;
	const MLink * lnk;

	count = NowMap.Link->count;
	lnk = NowMap.Link->Links;
	
	if( lnk == NULL ) return NULL;
	for( i=0; i<count; i++, lnk++ ){
		if( lnk->direction == id ){
			return lnk;
		}
	}
	return NULL;
}

//-------------------------------------------------------------
//-------------------------------------------------------------
static u8 set_nextlink_by_site( u8 id, u16 x, u16 y )
{
	const MLink * lnk;
	
	lnk = search_nextlink_by_site( id );
	if ( lnk != NULL ) {
		NextMapSetDirect( lnk->div_id, lnk->map_id, NO_EXIT_ID, x, y );
		return TRUE;
	}

	LinkControlScriptCheck();	//ダイビング接続の変更チェック
	if ( is_null_mapid(&DivingMapID) == FALSE ) {
		NextMapSetByDivingID();
		return TRUE;
	}

	return FALSE;
}

//-------------------------------------------------------------
//	天（上）方向へのマップ遷移セット
//-------------------------------------------------------------
u8 NextMapSetAbove( u16 x, u16 y )
{
	return set_nextlink_by_site( SITE_ABOVE, x, y );
}

//-------------------------------------------------------------
//	地（下）方向へのマップ遷移セット
//-------------------------------------------------------------
u8 NextMapSetBelow( u16 x, u16 y )
{
	return set_nextlink_by_site( SITE_BELOW, x, y );
}


//==================================================================================
//
//	マップ遷移の初期化処理
//
//==================================================================================
//-----------------------------------------------------------------------------
//	フィールドでの隣接マップ移動時の処理
//-----------------------------------------------------------------------------
void ChangeMapData(u8 div_id, u8 map_id)
{
	NextMapSetDirect( div_id, map_id, NO_EXIT_ID, -1, -1 );
	MapBGM_FadeNextSet();
	update_now_map_id();

	SetNowMapData();
	SxyObjDataSet();

	LocalEventFlagClear();
	CyclingRoadEventInit();
	InitEncountStep();
	SetRandomRevenger( div_id, map_id );
	UpdateTimeEvent();
	InitFieldWeatherValue();
	InitFieldVoice();
	InitBright();
	MapBGM_ClearSpecial();
	FlagControlScriptCheck();

	MakeNowVirtualMap();

	TransMapChar2ndData(NowMap.Screen);
	TransMapPalette2ndData(NowMap.Screen);
	{
		int i;
		for (i=MAP_PLTT_2ND_NO;i<MAP_PLTT_2ND_NO+MAP_PLTT_2ND_SIZE;i++)
			FieldWeather_AdjustBGPal(i);
	}
	MapBGanimeChange();

	MvPokeHeroPosSet();
	MvPokeMove();

	UpdateFieldWeatherSmooth();
	UpdateMapEffectControl();
	InitControlScriptCheck();
	DispMapName();
}

//-----------------------------------------------------------------------------
//	マップ遷移時のデータ初期化
//-----------------------------------------------------------------------------
void FieldInitData(int is_comm_mode)
{
	u8 is_field,is_indoor;
	SetNowMapData();
	SxyObjDataSet();

	is_field = MTYPE_IsFieldCheck(NowMap.type);
	is_indoor = MTYPE_IsIndoorCheck(NowMap.type);

	LocalEventFlagClear();				// マップ内限定のフラグを初期化
	CyclingRoadEventInit();
	InitEncountStep();
	SetRandomRevenger( Fld.MapID.div_id, Fld.MapID.map_id );
	if (is_comm_mode != TRUE) {
		UpdateTimeEvent();
	}
	InitFieldWeatherValue();			// 天候チェンジ
	InitFieldVoice();					// 鳴き声チェンジ
	if ( is_field ) EventFlagReset( SYS_USE_WAZA_FLASH );
	InitBright();
	MapBGM_ClearSpecial();
	FlagControlScriptCheck();

	MvPokeHeroPosSet();
	MvPokeMoveRnd();

	MakeNowVirtualMap();
	if (is_comm_mode != TRUE) {
		if( is_indoor ) ChangeTVCell(VMap.Xsize,VMap.Ysize);
		if( is_indoor ) SetBaseGoods(1);
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------




//==================================================================================
//
//	マップ出現時の自機の状態設定
//
//	SetHeroLastStatus()			マップ遷移前の自機の形態を保存
//		↓
//	マップ遷移処理
//		↓
//	GetHeroFirstStatus()		出現時の状況や以前の形態から最新の形態を決定
//==================================================================================

static HERO_INIT_INFO last_info = {};


static u8 get_hero_first_form(HERO_INIT_INFO * last, u16 attr, u8 map_type);
static u8 get_hero_first_site(HERO_INIT_INFO * last, u8 new_form, u16 attr, u8 map_type);

//-------------------------------------------------------------
//	自機形態情報を初期化
//-------------------------------------------------------------
void InitHeroLastStatus(void)
{
	last_info.site = SITE_DOWN;
	last_info.form = MY_MV_BIT_NORMAL;
}

//-------------------------------------------------------------
//	現在の自機形態情報を保存
//-------------------------------------------------------------
void SetHeroLastStatus( void )
{
	last_info.site = GetHeroSite();

	if (CheckHeroState(MY_MV_BIT_CYCLE_R)) {
		last_info.form = MY_MV_BIT_CYCLE_R;

	} else if (CheckHeroState(MY_MV_BIT_CYCLE_S)) {
		last_info.form = MY_MV_BIT_CYCLE_S;

	} else if (CheckHeroState(MY_MV_BIT_SWIM)) {
		last_info.form = MY_MV_BIT_SWIM;

	} else if (CheckHeroState(MY_MV_BIT_DIVING)) {
		last_info.form = MY_MV_BIT_DIVING;

	} else {
		last_info.form = MY_MV_BIT_NORMAL;
	}
}

//-------------------------------------------------------------
//マップ出現時の自機状態情報を取得
//	※マップ座標系のルーチンに依存しているのでそれらの変更には注意！！
//	※戻り値がconstへのポインタなのは書き換えを防ぐため
//-------------------------------------------------------------
const HERO_INIT_INFO * GetHeroFirstStatus(void)
{
	HERO_INIT_INFO new;
	u8 map_type;
	u16 attr;

	map_type = GetNowMapType();
	attr = GetFirstAttr();

	new.form = get_hero_first_form(&last_info, attr, map_type);
	new.site = get_hero_first_site(&last_info, new.form, attr, map_type);

	last_info = new;

	return &last_info;
}

//-------------------------------------------------------------
//	マップ出現時の形態を指定
//※指定コードの定義はevobj.defを参照
//-------------------------------------------------------------
static u8 get_hero_first_form(HERO_INIT_INFO * last, u16 attr, u8 map_type)
{
	/* 船内モードでフィールドにいる場合は通常形態にしておく */
	if (map_type != MAPTYPE_ROOM && EventFlagCheck(SYS_CRUISE_MODE)) {
			return MY_MV_BIT_NORMAL;
	}

	if (map_type == MAPTYPE_WATER) return MY_MV_BIT_DIVING;
	if (ATR_IsWaterCheck(attr) == TRUE) return MY_MV_BIT_SWIM;

	if (IsEnableCycleNowMap() == TRUE) {
		if (last->form == MY_MV_BIT_CYCLE_R) return MY_MV_BIT_CYCLE_R;
		if (last->form == MY_MV_BIT_CYCLE_S) return MY_MV_BIT_CYCLE_S;
	}
	return MY_MV_BIT_NORMAL;
}

//-------------------------------------------------------------
//
//	マップ出現時の向きの制御
//
//-------------------------------------------------------------
static u8 get_hero_first_site(HERO_INIT_INFO * last, u8 new_form, u16 attr, u8 map_type)
{
	if ( EventFlagCheck(SYS_CRUISE_MODE) && map_type == MAPTYPE_SEA ) {
		return SITE_RIGHT;
	}
	
	if (ATR_IsWallExitUpCheck(attr) == TRUE) return SITE_UP;
	if (ATR_IsWallExitCheck(attr) == TRUE) return SITE_DOWN;
	if (ATR_DoorEffectCheck(attr) == TRUE) return SITE_DOWN;

	if (ATR_ExitMatDownEnableCheck(attr) == TRUE) return SITE_UP;
	if (ATR_ExitMatUpEnableCheck(attr) == TRUE) return SITE_DOWN;
	if (ATR_ExitMatLeftEnableCheck(attr) == TRUE) return SITE_RIGHT;
	if (ATR_ExitMatRightEnableCheck(attr) == TRUE) return SITE_LEFT;

	/* 水中→水上、水上→水中の場合は向きを変えない */
	if (last->form == MY_MV_BIT_DIVING && new_form == MY_MV_BIT_SWIM)
		return last->site;
	if (last->form == MY_MV_BIT_SWIM && new_form == MY_MV_BIT_DIVING)
		return last->site;

	/* はしごの上では向きをかえない */
	if (ATR_IsLadderCheck(attr) == TRUE)
		return last->site;

	return SITE_DOWN;	/* default */
}

//-------------------------------------------------------------
//	マップ出現時のアトリビュートを取得する
//-------------------------------------------------------------
u16 GetFirstAttr( void )
{
	return GetCellAttribute( Fld.MapXpos+MAP_LEFT_MARGIN, Fld.MapYpos+MAP_UP_MARGIN );
}

//-------------------------------------------------------------
//	自転車に乗れるマップかどうかのチェック
//-------------------------------------------------------------
int IsEnableCycleNowMap(void)
{
	//サイクリングロードのゲートは自転車に乗ることができる
	if (Fld.MapID.div_id == R110 &&
			(Fld.MapID.map_id == R110_R0201 || Fld.MapID.map_id == R110_R0301))
			return TRUE;

	if (NowMap.type == MAPTYPE_ROOM) return FALSE;
	if (NowMap.type == MAPTYPE_BASE) return FALSE;
	if (NowMap.type == MAPTYPE_WATER) return FALSE;
	//海底洞窟最下層、超古代ポケモンが目覚める場所では自転車に乗れない
	if (Fld.MapID.div_id == CAVE &&
			Fld.MapID.map_id == CAVE_D1111) return FALSE;
	//祭壇の洞窟最下層も自転車に乗れない
	if (Fld.MapID.div_id == CAVE &&
			Fld.MapID.map_id == CAVE_D1206) return FALSE;
	return TRUE;
}

//==================================================================================
//
//	フィールド視界制限指定関連
//
//==================================================================================

//-------------------------------------------------------------
//	明るさの初期化
//-------------------------------------------------------------
void InitBright(void)
{
	if ( NowMap.lighting == 0 ) {
		//明るさ最大（視界制限なし）
		Fld.Brightness = 0;
	} else if ( EventFlagCheck( SYS_USE_WAZA_FLASH ) ) {
		//視界制限ありでフラッシュを使っている場合は視界最大
		Fld.Brightness = 1;
	} else {
		//視界制限ありでフラッシュ未使用なので視界最小
		Fld.Brightness = FIELD_BRIGHT_MAX;
	}
}

//-------------------------------------------------------------
//	明るさのセット
//-------------------------------------------------------------
void SetBright( int r )
{
	if ( r < 0 || r > FIELD_BRIGHT_MAX ) r = 0;
	Fld.Brightness = r;
}

//-------------------------------------------------------------
//	明るさの取得
//-------------------------------------------------------------
u8 GetBright(void)
{
	return Fld.Brightness;
}


//==================================================================================
//==================================================================================

//-------------------------------------------------------------
//	マップスクリーンを変更
//-------------------------------------------------------------
void ChangeNowMapScreen( u16 id )
{
	Fld.MapScreenNo = id;
	NowMap.Screen = get_nowmap_screen();
}

