//=========================================================================
//
//
//	フィールドＢＧＭ制御関連
//
//	2001.12.27	GAME FREAK Inc.
//
//=========================================================================

#include "common.h"
#include "task.h"

#define __FLD_BGM_H_GLOBAL__
#include "fld_bgm.h"

#include "fieldmap.h"
#include "mapparam.h"
#include "mus_tool.h"
#include "fld_tool.h"
#include "map_attr.h"
#include "script.h"
#include "calctool.h"
#include "sysflag.h"
#include "syswork.h"
#include "weather.h"
#include "wea_ctrl.h"
#include "../evdata/maparray.h"
#include "ev_sub.h"
#include "jiki.h"
#include "ecnt_dat.h"
#include "scr_tool.h"
#include "../script/savework.h"


#if	(PM_VERSION == VERSION_SAPPHIRE)
//サファイアバージョンのとき、大雨のBGM
#define	SP_MUS_WEATHER		MUS_OOAME
#elif	(PM_VERSION == VERSION_RUBY)
//ルビーバージョンのとき、日照りのBGM
#define	SP_MUS_WEATHER		MUS_HIDERI
#endif

enum{
	//天気研究所占拠中のBGM
	SP_MUS_OCCUPATION	=	MUS_TOZAN,

	//R118、左岸側のBGM
	SP_MUS_R118_LEFT	=	MUS_DOORO_X1,

	//R118、右岸側のBGM
	SP_MUS_R118_RIGHT	=	MUS_GRANROAD,
};

//==============================================================
//
//	サウンド呼び出し
//
//==============================================================

//大雨イベントのマップか？
static u16 is_rain_event_map( MapID * id )
{
	if ( EventFlagCheck( SYS_WEATHER_CTRL ) == FALSE ) return FALSE;

	if ( id->div_id != FIELD ) return FALSE;

	switch ( id->map_id ) {
	case FIELD_C106:
	case FIELD_C107:
	case FIELD_C108:
	case FIELD_C109:
	case FIELD_R124:
	case FIELD_R125:
	case FIELD_R126:
	case FIELD_R127:
	case FIELD_R128:
		return TRUE;
	}
	return FALSE;
}

static u16 is_occupation_event_map(MapID * id)
{
	//占拠イベント終了後は通常のBGM
	if (GetEventWorkValue(WK_SCENE_R119_TENKI) != 0)
		return FALSE;

	if (id->div_id != R119)
		return FALSE;

	if (id->map_id == R119_R0101 || id->map_id == R119_R0102)
		return TRUE;

	return FALSE;
}

static u16 get_map_bgm( MapID * id )
{
	const MapTotalData * p;

	if ( is_rain_event_map(id) == TRUE ) {
		return SP_MUS_WEATHER;
	}
	else if (is_occupation_event_map(id) == TRUE) {
		return SP_MUS_OCCUPATION;
	} else {
		p = GetTotalMapData( id->div_id, id->map_id );
		return p->BGMNo;
	}
}


static u16 get_nowmap_bgm( void )
{
	u16 bgm;

	if (Fld.MapID.div_id == FIELD && Fld.MapID.map_id == FIELD_R111 &&
		GetFieldWeatherValue() == WEATHER_STORM) {
		return MUS_ASHROAD;
	}

	bgm = get_map_bgm( &Fld.MapID );
	if ( bgm != SP_MUS_ROAD118 ) return bgm;

	/* 川の左右どちらにいるかを判断してBGMを変更している */
	if ( Fld.MapXpos < 24 ) {
		return SP_MUS_R118_LEFT;
	} else {
		return SP_MUS_R118_RIGHT;
	}
}

static u16 get_nextmap_bgm( void )
{
	u16 bgm;
	bgm = get_map_bgm( &NextMapID );
	if ( bgm != SP_MUS_ROAD118 ) return bgm;

	/* 現在のマップがキンセツの場合のみ、左岸側のBGMを返している */
	if (Fld.MapID.div_id == FIELD && Fld.MapID.map_id == FIELD_C103) {
		return SP_MUS_R118_LEFT;
	} else {
		return SP_MUS_R118_RIGHT;
	}
}

//-------------------------------------------------------------
//	フィールドＢＧＭ初期化
//-------------------------------------------------------------
void MapBGM_Init(void)
{
	BGM_Init();
}

//-------------------------------------------------------------
//	フィールドＢＧＭ開始
//	※マップ・フラグなどを判断して適切なＢＧＭを演奏する
//	※現在のＢＧＭが演奏しようとしているＢＧＭと同じ場合は
//	　何もしない
//-------------------------------------------------------------
void MapBGM_Start(void)
{
	u16 now;
	now = get_nowmap_bgm();

	if ( now != SP_MUS_WEATHER ) {
		if ( Fld.MapMusicNo != 0 ) {
			now = Fld.MapMusicNo;
		}
		else if ( GetNowMapType() == MAPTYPE_WATER ) {
			now = MUS_DEEPDEEP;
		}
		else if (CheckHeroState(MY_MV_BIT_SWIM)) {
			now = MUS_NAMINORI;
		}
	}
	if( now == BGM_GetNowNo() ) return;

	BGM_PlaySet( now );
}

//-------------------------------------------------------------
//	ＢＧＭ指定セット
//	※マップ内限定のＢＧＭ指定がセットされる
//	　自転車ＢＧＭの制御などに使用
//-------------------------------------------------------------
void MapBGM_SetSpecial( u16 music )
{
	Fld.MapMusicNo = music;
}

//-------------------------------------------------------------
//	ＢＧＭ指定クリア
//	※マップ内限定のＢＧＭ指定がクリアされる
//	　自転車ＢＧＭの制御などに使用
//-------------------------------------------------------------
void MapBGM_ClearSpecial( void )
{
	Fld.MapMusicNo = 0;
}

//==============================================================
//
//	BGMフェード制御関連
//
//==============================================================

//-------------------------------------------------------------
//	ＢＧＭフェード→次のＢＧＭへ変更
//	※フィールド上での隣接マップ移動で呼ばれる
//	※次のマップと今のマップでBGMが同じ場合機能しない
//-------------------------------------------------------------
void MapBGM_FadeNextSet(void)
{
	u16 next,now;

	if (EventFlagCheck(CTRL_BGM_CHANGE) == TRUE)
		return;

	next = get_nextmap_bgm();
	now = BGM_GetNowNo();
	if (next != SP_MUS_WEATHER) {
		if (now == MUS_DEEPDEEP)
			return;
		if (now == MUS_NAMINORI)
			return;
		if (CheckHeroState(MY_MV_BIT_SWIM)) {
			next = MUS_NAMINORI;
		}
	}

	if (next == now) return;

	if (CheckHeroState(MY_MV_BIT_CYCLE_AND)) {
		//自転車に乗っている場合はフェードアウト→フェードイン
		BGM_FadeNextFadeSet( next, BGMFADE_1SEC, BGMFADE_1SEC );
	} else {
		//通常時はフェードアウト→開始
		BGM_FadeNextSet( next, BGMFADE_2SEC );
	}
}

//-------------------------------------------------------------
//	ＢＧＭフェード→今のマップのＢＧＭへ変更
//	※同じ曲の場合は機能しない
//-------------------------------------------------------------
void MapBGM_FadeNowSet(void)
{
	u16 now;
	now = BGM_GetNowNo();
	if ( now == get_nowmap_bgm() ) return;

	BGM_FadeNextSet( get_nowmap_bgm(), BGMFADE_2SEC );
}

//-------------------------------------------------------------
//	ＢＧＭフェード→指定ＢＧＭに変更
//	※同じ曲の場合は機能しない
//	<引数>	ＢＧＭの番号
//-------------------------------------------------------------
void MapBGM_FadeChange( u16 music )
{
	u16 now;
	now = BGM_GetNowNo();
	if( now == music ) return;
	if( now == SP_MUS_WEATHER ) return;	//イベント中は曲が変わらない

	BGM_FadeNextSet( music, BGMFADE_2SEC );
}

//-------------------------------------------------------------
//	ＢＧＭフェードアウト
//	※次のマップと今のマップでBGMが同じ場合機能しない
//-------------------------------------------------------------
//	洞窟、フィールドへの遷移は2秒
//	部屋、ポケセンへの遷移は1秒

static u8 get_bgm_fade_len( void )
{
	u8 type;

	type = (GetNextMapData())->type;
	if( MTYPE_IsIndoorCheck(type) == TRUE )
		return BGMFADE_HALF_SEC;
	else
		return BGMFADE_1SEC;
}

void MapBGM_FadeOutSet( void )
{
	u16 next;
	next = get_nextmap_bgm();

	if(EventFlagCheck(CTRL_BGM_CHANGE) == TRUE)return;

	if( next == BGM_GetNowNo() ) return;

	BGM_FadeOutSet( get_bgm_fade_len() );
}

//-------------------------------------------------------------
//	ＢＧＭフェード待ち
//	<戻り値>	TRUE	終了
//				FALSE	フェード中
//-------------------------------------------------------------
u8 MapBGM_FadeWait( void )
{
	return BGM_FadeOutCheck();
}

//-------------------------------------------------------------
//	ＢＧＭフェードアウト→終了セット
//-------------------------------------------------------------
void MapBGM_FadeOutEndSet(void)
{
	BGM_FadeOutSet(BGMFADE_1SEC);
}

//==============================================================
//
//	フィールド鳴き声制御
//
//==============================================================
extern void VoicePlay2(u16 no, s8 pan, s8 vol, u8 pri);
extern u16 GetEncountVoice( u8 * water_flag );

#define	ONE_SECOND	60

// 鳴き声のポケモンナンバー
static u16 FieldVoiceNo = 0;

// エンカウントデータが水だけかどうかのフラグ
// (水だけの場合TRUEが代入されている）
static u8 FieldVoiceType = 0;


static const int VOICE_FIRST_WAIT_MIN = 20 * ONE_SECOND;
static const int VOICE_FIRST_WAIT_MAX = 60 * ONE_SECOND;

static const int VOICE_WAIT_MIN = 20 * ONE_SECOND;
static const int VOICE_WAIT_MAX = 40 * ONE_SECOND;

static const int VOICE_VOLUME_MIN = 50;
static const int VOICE_VOLUME_MAX = 80;

static const int VOICE_PAN_MIN = -44;
static const int VOICE_PAN_MAX = 44;

enum{
	VWK_SEQ = 0,
	VWK_WAIT,
};

enum{
	VSEQ_INIT = 0,
	VSEQ_FIRST_SET,
	VSEQ_SET,
	VSEQ_WAIT,
	VSEQ_SLEEP,
};


//-------------------------------------------------------------
//	鳴き声セット
//-------------------------------------------------------------
static void field_voice_play( void )
{
	s16 x,y;
	s8 pan,vol;
	GetHeroCellPos( &x, &y );
	if ( FieldVoiceType == TRUE &&
			ATR_IsWaterCheck(GetCellAttribute(x,y)) == FALSE ) {
		//水のエンカウントしかない地形で足元が水でない場合は鳴かない
		return;
	}
	pan = VOICE_PAN_MIN + pp_rand() % (VOICE_PAN_MAX-VOICE_PAN_MIN);
	vol = VOICE_VOLUME_MIN + pp_rand() % (VOICE_VOLUME_MAX-VOICE_VOLUME_MIN);
	VoicePlay2(FieldVoiceNo,pan,vol,1);
}

//-------------------------------------------------------------
//	フィールド鳴き声制御本体
//	<引数>	seq		制御シーケンスワーク
//			wait	ウェイトワーク
//-------------------------------------------------------------
void FieldVoiceControl( s16 * seq, s16 * wait )
{
	switch ( *seq ) {

	case VSEQ_INIT:
		if ( FieldVoiceNo == 0 ) {
			*seq = VSEQ_SLEEP;
		} else {
			*seq = VSEQ_FIRST_SET;
		}
		break;

	case VSEQ_FIRST_SET:
		*wait = VOICE_FIRST_WAIT_MIN +
			pp_rand()%(VOICE_FIRST_WAIT_MAX-VOICE_FIRST_WAIT_MIN);
		*seq = VSEQ_WAIT;
		break;

	case VSEQ_SET:
		*wait = VOICE_WAIT_MIN + pp_rand()%(VOICE_WAIT_MAX-VOICE_WAIT_MIN);
		*seq = VSEQ_WAIT;
		break;

	case VSEQ_WAIT:
		(*wait) --;
		if ( *wait == 0 ) {
			field_voice_play();
			*seq = VSEQ_SET;
		}
		break;

	case VSEQ_SLEEP:
		break;
	}
}

//-------------------------------------------------------------
//	鳴き声データの初期化
//-------------------------------------------------------------
void InitFieldVoice(void)
{
	//マボロシ島が出現しているとき以外は水エンカウントのみを参照する
	if (Fld.MapID.div_id == FIELD &&
			Fld.MapID.map_id == FIELD_R130 &&
			Maboroshi_Check() == FALSE)
	{
		FieldVoiceType = TRUE;					//水上エンカウントなので
		FieldVoiceNo = GetWaterEncountVoice();
	} else {
		FieldVoiceNo = GetEncountVoice( &FieldVoiceType );
	}
}

