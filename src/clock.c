#include "global.h"
#include "main.h"
#include "rtc.h"
#include "event_data.h"
#include "lottery_corner.h"
#include "berry.h"
#include "rom4.h"
#include "wallclock.h"

extern void sub_80FA220(u16);
extern void sub_80BE8C4(u16);
extern void sub_8080834(u16);
extern void UpdatePartyPokerusTime(u16);
extern void sub_810D2F4(u16);
extern void UpdateBirchState(u16);
extern void sub_810F618(u16);

void sub_806A390(struct Time *time);
void sub_806A3F4(struct Time *time);
void sub_806A328(void);

void sub_806A328(void)
{
    FlagSet(0x835);
    RtcCalcLocalTime();
    gSaveBlock2.lastBerryTreeUpdate = gLocalTime;
    VarSet(0x4040, gLocalTime.days);
}

void DoTimeBasedEvents(void)
{
    if(FlagGet(0x835))
    {
        RtcCalcLocalTime();
        sub_806A390(&gLocalTime);
        sub_806A3F4(&gLocalTime);
    }        
}

void sub_806A390(struct Time *time)
{
    u16 *varPtr = GetVarPointer(0x4040);
    int days = *varPtr;
    u16 newDays;
    
    if(days != time->days && days <= time->days)
    {
        newDays = time->days - days;
        ClearUpperFlags();
        sub_80FA220(newDays);
        sub_80BE8C4(newDays);
        sub_8080834(newDays);
        UpdatePartyPokerusTime(newDays);
        sub_810D2F4(newDays);
        UpdateBirchState(newDays);
        sub_810F618(newDays);
        SetRandomLotteryNumber(newDays);
        *varPtr = time->days;
    }
}

void sub_806A3F4(struct Time *time)
{
    struct Time newTime;
    s32 totalSeconds;

    CalcTimeDifference(&newTime, &gSaveBlock2.lastBerryTreeUpdate, time);
    totalSeconds = 1440 * newTime.days + 60 * newTime.hours + newTime.minutes;

    // there's no way to get the correct assembly other than with this nested if check. so dumb.
    if(totalSeconds != 0)
    {
        if(totalSeconds >= 0)
        {
            BerryTreeTimeUpdate(totalSeconds);
            gSaveBlock2.lastBerryTreeUpdate = *time;
        }
    }
}

void sub_806A44C(void)
{
    sub_806A328();
    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void sub_806A460(void)
{
    SetMainCallback2(Cb2_StartWallClock);
    gMain.field_8 = sub_806A44C;
}
