/***********************************************************************
**	天候制御タスク
**
**
***********************************************************************/
#ifndef __WEATHER_H__
#define __WEATHER_H__

/*========================================
==	天候状態
========================================*/
#define WEATHER_OFF      (0)      // 天候エフェクトなし
#define WEATHER_SHINE    (1)      // 晴れ
#define WEATHER_SHINE2   (2)      // 晴れ（雲なし）
#define WEATHER_RAIN     (3)      // 雨
#define WEATHER_SNOW     (4)      // 雪
#define WEATHER_THUNDER  (5)      // カミナリ
#define WEATHER_MIST     (6)      // 霧
#define WEATHER_ASH      (7)      // 火山灰
#define WEATHER_STORM    (8)      // 砂嵐
#define WEATHER_MIST2    (9)      // 霧２
#define WEATHER_SEA     (10)      // 海底
#define WEATHER_CLOUD   (11)      // 曇り
#define WEATHER_SHINE3  (12)      // 晴れ（強い日差し）
#define WEATHER_HEAVYRAIN  (13)   // 大雨
#define WEATHER_MARINE  (14)      // 海底
#define WEATHER_MAX     (15)      /* 最大値 */
/* -------------- */

/*========================================
==	フェードモード
========================================*/
#define FIELD_BLACK_IN  (0)
#define FIELD_BLACK_OUT (1)
#define FIELD_WHITE_IN  (2)
#define FIELD_WHITE_OUT (3)


#ifndef ASM_CPP

// ↓以前の仕様との互換のためのマクロ（不要になったら消す）
#define FIELD_FADE_IN  (FIELD_BLACK_IN)
#define FIELD_FADE_OUT (FIELD_BLACK_OUT)


void WeatherInit(void);
void WeatherChangeSmooth(u8 weather);
void WeatherChangeDirect(u8 weather);
void WeatherChangeDemo(u8 weather);
void FieldFadeControl(u8 fade_mode, u8 wait);
u8  FieldFadeinCheck(void);
void FieldWeather_AdjustObjPal(u8 pal_num);
void FieldWeather_AdjustBGPal(u8 pal_num);
u8 GetWeatherNow(void);
void StopRainSound(void);
u8 CheckWeatherAdjustFill(void);
u8 CheckWeatherChange(void);
void WeatherFadeStop(void);
void WeatherFadeStart(void);

void WeatherFadeSkipStart(u8 palno);
void WeatherFadeSkipEnd(void);

#endif /* #ifndef ASM_CPP */
#endif
