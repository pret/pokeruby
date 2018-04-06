#include "global.h"
#include "clock.h"
#include "berry.h"
#include "dewford_trend.h"
#include "event_data.h"
#include "field_specials.h"
#include "field_weather.h"
#include "lottery_corner.h"
#include "main.h"
#include "overworld.h"
#include "rtc.h"
#include "time_events.h"
#include "tv.h"
#include "wallclock.h"

static void UpdatePerDay(struct Time *time);
static void UpdatePerMinute(struct Time *time);
static void ReturnFromStartWallClock(void);

void InitTimeBasedEvents(void)
{
    FlagSet(FLAG_SYS_CLOCK_SET);
    RtcCalcLocalTime();
    gSaveBlock2.lastBerryTreeUpdate = gLocalTime;
    VarSet(VAR_DAYS, gLocalTime.days);
}

void DoTimeBasedEvents(void)
{
    if (FlagGet(FLAG_SYS_CLOCK_SET))
    {
        RtcCalcLocalTime();
        UpdatePerDay(&gLocalTime);
        UpdatePerMinute(&gLocalTime);
    }
}

static void UpdatePerDay(struct Time *time)
{
    u16 *varPtr = GetVarPointer(VAR_DAYS);
    int days = *varPtr;
    u16 newDays;

    if (days != time->days && days <= time->days)
    {
        newDays = time->days - days;
        ClearDailyFlags();
        UpdateDewfordTrendPerDay(newDays);
        UpdateTVShowsPerDay(newDays);
        UpdateWeatherPerDay(newDays);
        UpdatePartyPokerusTime(newDays);
        UpdateMirageRnd(newDays);
        UpdateBirchState(newDays);
        SetShoalItemFlag(newDays);
        SetRandomLotteryNumber(newDays);
        *varPtr = time->days;
    }
}

static void UpdatePerMinute(struct Time *time)
{
    struct Time newTime;
    s32 minutesPassed;

    CalcTimeDifference(&newTime, &gSaveBlock2.lastBerryTreeUpdate, time);
    minutesPassed = 1440 * newTime.days + 60 * newTime.hours + newTime.minutes;

    if (minutesPassed == 0) // do not do the update for the first minute.
        return;

    if (minutesPassed > -1) // do not perform an update on invalid minutesPassed.
    {
        BerryTreeTimeUpdate(minutesPassed);
        gSaveBlock2.lastBerryTreeUpdate = *time;
    }
}

static void ReturnFromStartWallClock(void)
{
    InitTimeBasedEvents();
    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void StartWallClock(void)
{
    SetMainCallback2(CB2_StartWallClock);
    gMain.savedCallback = ReturnFromStartWallClock;
}
