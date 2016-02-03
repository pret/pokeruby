#ifndef GUARD_RTC_UTIL_H
#define GUARD_RTC_UTIL_H

#include "global.h"

void RtcInit();
u16 RtcGetErrorFlags();
void RtcReset();
void FormatDecimalTime(u8 *dest, s32 hour, s32 minute, s32 second);
void FormatHexTime(u8 *dest, s32 hour, s32 minute, s32 second);
void FormatHexRtcTime(u8 *dest);
void FormatDecimalDate(u8 *dest, s32 year, s32 month, s32 day);
void FormatHexDate(u8 *dest, s32 year, s32 month, s32 day);
void RtcCalcLocalTime();
void RtcInitLocalTimeOffset(s32 hours, s32 minutes);
void RtcCalcLocalTimeOffset(s32 days, s32 hours, s32 minutes, s32 seconds);
void CalcTimeDifference(struct Time *result, struct Time *t1, struct Time *t2);
u32 RtcGetMinuteCount();

#endif // GUARD_RTC_UTIL_H
