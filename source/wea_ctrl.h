#ifndef __WEA_CTRL_H__
#define __WEA_CTRL_H__

//=========================================================================
//	
//	天候指定関連
//
//=========================================================================

#undef GLOBAL
#ifdef __WEA_CTRL_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

#define ID_WEATHER_OFF      (0)      // 天候エフェクトなし
#define ID_WEATHER_SHINE    (1)      // 晴れ
#define ID_WEATHER_SHINE2   (2)      // 晴れ（雲なし）
#define ID_WEATHER_RAIN     (3)      // 雨
#define ID_WEATHER_SNOW     (4)      // 雪
#define ID_WEATHER_THUNDER  (5)      // カミナリ
#define ID_WEATHER_MIST     (6)      // 霧
#define ID_WEATHER_ASH      (7)      // 火山灰
#define ID_WEATHER_STORM    (8)      // 砂嵐
#define ID_WEATHER_MIST2    (9)      // 霧２
#define ID_WEATHER_SEA     (10)      // 海底
#define ID_WEATHER_CLOUD   (11)      // 曇り
#define ID_WEATHER_SHINE3  (12)      // 晴れ（強い日差し）
#define ID_WEATHER_HEAVYRAIN (13)    // 大雨
#define ID_WEATHER_MARINE  (14)      // 海底

#define	ID_WEATHER_SRTR		(20)	// 晴れ、雨、雷、雨　で日数変化
#define	ID_WEATHER_SSRS		(21)	// 晴れ、晴れ、雨、晴れ、で日数変化


//天候周期
#define WEATHER_CYCLE_MAX	4

#ifndef	ASM_CPP
//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;


//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

GLOBAL void InitFieldWeatherValue( void );
GLOBAL void SetFieldWeatherValue( int type );
GLOBAL u8 GetFieldWeatherValue( void );
GLOBAL void ChangeFieldWeatherSmooth( int type );
GLOBAL void ChangeFieldWeatherDirect( int type );
GLOBAL void UpdateFieldWeatherSmooth( void );
GLOBAL void UpdateFieldWeatherDirect( void );

//-----------------------------------------------------------------------------
//	天候周期の更新
//-----------------------------------------------------------------------------
GLOBAL void WeatherCycle_Update( u16 diff );

#endif /* ASM_CPP */


#undef GLOBAL
#endif	/*__WEA_CTRL_H__*/

