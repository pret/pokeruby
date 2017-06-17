#include "global.h"
#include "coord_event_weather.h"
#include "field_weather.h"

struct CoordEventWeather
{
    u8 weather;
    void (*func)(void);
};

static void CoordEventWeather_Indoor(void);
static void CoordEventWeather_Sunny(void);
static void CoordEventWeather_Rain(void);
static void CoordEventWeather_Snowflakes(void);
static void CoordEventWeather_Thunderstorm(void);
static void CoordEventWeather_Fog(void);
static void CoordEventWeather_DiagonalFog(void);
static void CoordEventWeather_Snow(void);
static void CoordEventWeather_Sandstorm(void);
static void CoordEventWeather_Cloudy(void);
static void CoordEventWeather_Drought(void);
static void CoordEventWeather_UnderwaterFog(void);
static void CoordEventWeather_UnderwaterBubbles(void);

static const struct CoordEventWeather sCoordEventWeatherFuncs[] =
{
    {  0x1, CoordEventWeather_Indoor },
    {  0x2, CoordEventWeather_Sunny },
    {  0x3, CoordEventWeather_Rain },
    {  0x4, CoordEventWeather_Snowflakes },
    {  0x5, CoordEventWeather_Thunderstorm },
    {  0x6, CoordEventWeather_Fog },
    {  0x7, CoordEventWeather_DiagonalFog },
    {  0x8, CoordEventWeather_Snow },
    {  0x9, CoordEventWeather_Sandstorm },
    {  0xa, CoordEventWeather_Cloudy },
    {  0xb, CoordEventWeather_Drought },
    { 0x14, CoordEventWeather_UnderwaterFog },
    { 0x15, CoordEventWeather_UnderwaterBubbles },
};

static void CoordEventWeather_Indoor(void)
{
    SetWeather(1);
}

static void CoordEventWeather_Sunny(void)
{
    SetWeather(2);
}

static void CoordEventWeather_Rain(void)
{
    SetWeather(3);
}

static void CoordEventWeather_Snowflakes(void)
{
    SetWeather(4);
}

static void CoordEventWeather_Thunderstorm(void)
{
    SetWeather(5);
}

static void CoordEventWeather_Fog(void)
{
    SetWeather(6);
}

static void CoordEventWeather_DiagonalFog(void)
{
    SetWeather(9);
}

static void CoordEventWeather_Snow(void)
{
    SetWeather(7);
}

static void CoordEventWeather_Sandstorm(void)
{
    SetWeather(8);
}

static void CoordEventWeather_Cloudy(void)
{
    SetWeather(11);
}

static void CoordEventWeather_Drought(void)
{
    SetWeather(12);
}

static void CoordEventWeather_UnderwaterFog(void)
{
    SetWeather(20);
}

static void CoordEventWeather_UnderwaterBubbles(void)
{
    SetWeather(21);
}

void DoCoordEventWeather(u8 n)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sCoordEventWeatherFuncs); i++)
    {
        if (sCoordEventWeatherFuncs[i].weather == n)
        {
            sCoordEventWeatherFuncs[i].func();
            return;
        }
    }
}
