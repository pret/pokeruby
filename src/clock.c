#include "global.h"
#include "clock.h"
#include "berry.h"
#include "event_data.h"
#include "lottery_corner.h"
#include "main.h"
#include "rom4.h"
#include "rtc.h"
#include "wallclock.h"

extern void UpdateDewfordTrendPerDay(u16);
extern void UpdateTVShowsPerDay(u16);
extern void UpdateWeatherPerDay(u16);
extern void UpdatePartyPokerusTime(u16);
extern void UpdateMirageRnd(u16);
extern void UpdateBirchState(u16);
extern void SetShoalItemFlag(u16);

static void InitTimeBasedEvents(void);
static void UpdatePerDay(struct Time *time);
static void UpdatePerMinute(struct Time *time);
static void ReturnFromStartWallClock(void);

static void InitTimeBasedEvents(void)
{
    FlagSet(SYS_CLOCK_SET);
    RtcCalcLocalTime();
    gSaveBlock2.lastBerryTreeUpdate = gLocalTime;
    VarSet(VAR_DAYS, gLocalTime.days);
}

void DoTimeBasedEvents(void)
{
    if (FlagGet(SYS_CLOCK_SET))
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
        ClearUpperFlags();
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
    s32 minutes;

    CalcTimeDifference(&newTime, &gSaveBlock2.lastBerryTreeUpdate, time);
    minutes = 1440 * newTime.days + 60 * newTime.hours + newTime.minutes;

    // there's no way to get the correct assembly other than with this nested if check. so dumb.
    if (minutes != 0)
    {
        if (minutes >= 0)
        {
            BerryTreeTimeUpdate(minutes);
            gSaveBlock2.lastBerryTreeUpdate = *time;
        }
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
