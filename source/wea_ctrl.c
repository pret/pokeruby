//=========================================================================
//
//
//	天候指定関連
//
//
//=========================================================================

#include "common.h"
#include "weather.h"
#include "map.h"
#include "record.h"

#define __WEA_CTRL_H_GLOBAL__
#include "wea_ctrl.h"

static u8 convert_weather_code( u8 code );
static void count_rain_weather( u8 new, u8 before );

//=========================================================================
//
//	天候制御
//
//=========================================================================

void SetFieldWeatherValue( int type )
{
	u8 before = Fld.WeatherValue;
	Fld.WeatherValue = convert_weather_code(type);
	count_rain_weather( Fld.WeatherValue, before );
}

u8 GetFieldWeatherValue( void )
{
	return Fld.WeatherValue;
}

void InitFieldWeatherValue( void )
{
	u8 before = Fld.WeatherValue;
	Fld.WeatherValue = convert_weather_code(NowMap.weather);
	count_rain_weather( Fld.WeatherValue, before );
}

void ChangeFieldWeatherSmooth( int type )
{
	SetFieldWeatherValue( type );
	WeatherChangeSmooth( GetFieldWeatherValue() );
}

void ChangeFieldWeatherDirect( int type )
{
	SetFieldWeatherValue( type );
	WeatherChangeDirect( GetFieldWeatherValue() );
}

void UpdateFieldWeatherSmooth( void )
{
	WeatherChangeSmooth( GetFieldWeatherValue() );
}

void UpdateFieldWeatherDirect( void )
{
	WeatherChangeDirect( GetFieldWeatherValue() );
}

//==================================================================================
//
//	天候指定コード関連
//
//==================================================================================
static const u8 srtr_table[] =
{
	WEATHER_SHINE2,
	WEATHER_RAIN,
	WEATHER_THUNDER,
	WEATHER_RAIN,
};
static const u8 ssrs_table[] =
{
	WEATHER_SHINE2,
	WEATHER_SHINE2,
	WEATHER_RAIN,
	WEATHER_SHINE2,
};

//-----------------------------------------------------------------------------
//	天候指定コード（wea_ctrl.h）を天候コード（weather.hで定義）に変換
//-----------------------------------------------------------------------------
static u8 convert_weather_code( u8 code )
{
	switch ( code ) {
	case ID_WEATHER_OFF:      return WEATHER_OFF;      // 天候エフェクトなし
	case ID_WEATHER_SHINE:    return WEATHER_SHINE;    // 晴れ
	case ID_WEATHER_SHINE2:   return WEATHER_SHINE2;   // 晴れ（雲なし）
	case ID_WEATHER_RAIN:     return WEATHER_RAIN;     // 雨
	case ID_WEATHER_SNOW:     return WEATHER_SNOW;     // 雪
	case ID_WEATHER_THUNDER:  return WEATHER_THUNDER;  // カミナリ
	case ID_WEATHER_MIST:     return WEATHER_MIST;     // 霧
	case ID_WEATHER_ASH:      return WEATHER_ASH;      // 火山灰
	case ID_WEATHER_STORM:    return WEATHER_STORM;    // 砂嵐
	case ID_WEATHER_MIST2:    return WEATHER_MIST2;    // 霧２
	case ID_WEATHER_SEA:      return WEATHER_SEA;     // 海底
	case ID_WEATHER_CLOUD:    return WEATHER_CLOUD;   // 曇り
	case ID_WEATHER_SHINE3:   return WEATHER_SHINE3;  // 晴れ（強い日差し）
	case ID_WEATHER_HEAVYRAIN:return WEATHER_HEAVYRAIN; // 大雨  2002/06/28 taya
	case ID_WEATHER_MARINE:   return WEATHER_MARINE;  // 海底


	case ID_WEATHER_SRTR:     return srtr_table[Fld.WeatherCycle];
	case ID_WEATHER_SSRS:     return ssrs_table[Fld.WeatherCycle];
	}
	return WEATHER_OFF;
}

//-----------------------------------------------------------------------------
//	天候周期の更新
//-----------------------------------------------------------------------------
void WeatherCycle_Update( u16 diff )
{
	u16 value = Fld.WeatherCycle;
	value += diff;
	value %= WEATHER_CYCLE_MAX;
	Fld.WeatherCycle = value;
}

//-----------------------------------------------------------------------------
//	雨が降った回数をカウント（大雨はカウントしない）
//-----------------------------------------------------------------------------
static void count_rain_weather( u8 new, u8 before )
{
	if ( new == before ) return;
	if ( new == WEATHER_RAIN || new == WEATHER_THUNDER ) {
		IncRecord( CNT_RAIN );
	}
}

