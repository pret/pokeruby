#ifndef GUARD_RTC_H
#define GUARD_RTC_H

#include "gba/gba.h"

#define RTC_INFO_CTRL_UNK1          0x01 // unknown
#define RTC_INFO_CTRL_IRQ_ENABLE    0x02 // per-minute IRQ enable
#define RTC_INFO_CTRL_UNK2          0x04 // unknown
#define RTC_INFO_CTRL_24HOUR        0x40 // 0: 12-hour mode, 1: 24-hour mode
#define RTC_INFO_CTRL_POWER_FAILURE 0x80 // power failure occurred

enum
{
    MONTH_JAN = 1,
    MONTH_FEB,
    MONTH_MAR,
    MONTH_APR,
    MONTH_MAY,
    MONTH_JUN,
    MONTH_JUL,
    MONTH_AUG,
    MONTH_SEP,
    MONTH_OCT,
    MONTH_NOV,
    MONTH_DEC
};

struct RtcInfo
{
    u8 year;
    u8 month;
    u8 day;
    u8 dayOfWeek;
    u8 hour;
    u8 minute;
    u8 second;
    u8 control;
    u8 unknown1;
    u8 unknown2;
};

void RTC_Unprotect();
void RTC_Protect();
u8 RTC_Probe();
bool8 RTC_Reset();
bool8 RTC_GetControl(struct RtcInfo *rtc);
bool8 RTC_SetControl(struct RtcInfo *rtc);
bool8 RTC_GetDateTime(struct RtcInfo *rtc);
bool8 RTC_SetDateTime(struct RtcInfo *rtc);
bool8 RTC_GetTime(struct RtcInfo *rtc);
bool8 RTC_SetTime(struct RtcInfo *rtc);
bool8 RTC_SetUnknownData(struct RtcInfo *rtc);

#endif // GUARD_RTC_H
