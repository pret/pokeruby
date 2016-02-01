#include "global.h"

struct RtcInfo
{
    u8 year;
    u8 month;
    u8 dayOfMonth;
    u8 dayOfWeek;
    u8 hour;
    u8 minute;
    u8 second;
    u8 control;
    u8 unknown1;
    u8 unknown2;
};

#define OFFSET_YEAR         offsetof(struct RtcInfo, year)
#define OFFSET_MONTH        offsetof(struct RtcInfo, month)
#define OFFSET_DAY_OF_MONTH offsetof(struct RtcInfo, dayOfMonth)
#define OFFSET_DAY_OF_WEEK  offsetof(struct RtcInfo, dayOfWeek)
#define OFFSET_HOUR         offsetof(struct RtcInfo, hour)
#define OFFSET_MINUTE       offsetof(struct RtcInfo, minute)
#define OFFSET_SECOND       offsetof(struct RtcInfo, second)
#define OFFSET_CONTROL      offsetof(struct RtcInfo, control)
#define OFFSET_UNKNOWN1     offsetof(struct RtcInfo, unknown1)
#define OFFSET_UNKNOWN2     offsetof(struct RtcInfo, unknown2)

#define RTC_BUF(info, index) (*((u8 *)(info) + (index)))

#define RTC_DATETIME_BUF(info, index) (*((u8 *)(info) + OFFSET_YEAR + (index)))
#define RTC_DATETIME_BUF_LEN (OFFSET_SECOND - OFFSET_YEAR + 1)

#define RTC_TIME_BUF(info, index) (*((u8 *)(info) + OFFSET_HOUR + (index)))
#define RTC_TIME_BUF_LEN (OFFSET_SECOND - OFFSET_HOUR + 1)

extern vu16 GPIOPortData;
extern vu16 GPIOPortDirection;
extern vu16 GPIOPortReadWrite;

extern bool8 gRtcLocked;

void RTC_SetReadWrite();
void RTC_SetReadOnly();
u8 RTC_Init();
bool8 RTC_Reset();
bool8 RTC_GetControlReg(struct RtcInfo *rtc);
bool8 RTC_SetControlReg(struct RtcInfo *rtc);
bool8 RTC_GetDateTime(struct RtcInfo *rtc);
bool8 RTC_SetDateTime(struct RtcInfo *rtc);
bool8 RTC_GetTime(struct RtcInfo *rtc);
bool8 RTC_SetTime(struct RtcInfo *rtc);
bool8 RTC_SetUnknownData(struct RtcInfo *rtc);
s32 RTC_WriteByte(u8 value);
s32 RTC_WriteByteReversed(u8 value);
u8 RTC_ReadByte();
void RTC_SetReadWriteInternal();
void RTC_SetReadOnlyInternal();

void RTC_SetReadWrite()
{
    RTC_SetReadWriteInternal();
    gRtcLocked = FALSE;
}

void RTC_SetReadOnly()
{
    RTC_SetReadOnlyInternal();
    gRtcLocked = TRUE;
}

u8 RTC_Init()
{
    u8 v2;
    struct RtcInfo rtc;

    if (!RTC_GetControlReg(&rtc))
        return 0;

    v2 = 0;

    if ((rtc.control & 0xC0) == 0x80 || !(rtc.control & 0xC0))
    {
        if (!RTC_Reset())
            return 0;

        v2++;
    }

    RTC_GetTime(&rtc);

    if (rtc.second & 0x80)
    {
        if (!RTC_Reset())
            return (v2 << 4) & 0xF0;

        v2++;
    }

    return (v2 << 4) | 1;
}

bool8 RTC_Reset()
{
    u8 result;
    struct RtcInfo rtc;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteByte(0x60);

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    rtc.control = 0x40;

    result = RTC_SetControlReg(&rtc);

    return result;
}

bool8 RTC_GetControlReg(struct RtcInfo *rtc)
{
    u8 controlData;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteByte(0x63);

    GPIOPortDirection = 5;

    controlData = RTC_ReadByte();

    rtc->control = (controlData & 0xC0) | ((controlData & 0x20) >> 3) | ((controlData & 8) >> 2) | ((controlData & 2) >> 1);

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

bool8 RTC_SetControlReg(struct RtcInfo *rtc)
{
    u8 controlData;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    controlData = ((rtc->control & 4) << 3) | (1 << 6) | ((rtc->control & 2) << 2) | ((rtc->control & 1) << 1);

    GPIOPortDirection = 7;

    RTC_WriteByte(0x62);

    RTC_WriteByteReversed(controlData);

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

bool8 RTC_GetDateTime(struct RtcInfo *rtc)
{
    u8 i;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteByte(0x65);

    GPIOPortDirection = 5;

    for (i = 0; i < RTC_DATETIME_BUF_LEN; i++)
        RTC_DATETIME_BUF(rtc, i) = RTC_ReadByte();

    RTC_BUF(rtc, OFFSET_HOUR) &= 0x7F;

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

bool8 RTC_SetDateTime(struct RtcInfo *rtc)
{
    u8 i;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteByte(0x64);

    for (i = 0; i < RTC_DATETIME_BUF_LEN; i++)
        RTC_WriteByteReversed(RTC_DATETIME_BUF(rtc, i));

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

bool8 RTC_GetTime(struct RtcInfo *rtc)
{
    u8 i;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteByte(0x67);

    GPIOPortDirection = 5;

    for (i = 0; i < RTC_TIME_BUF_LEN; i++)
        RTC_TIME_BUF(rtc, i) = RTC_ReadByte();

    RTC_BUF(rtc, OFFSET_HOUR) &= 0x7F;

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

bool8 RTC_SetTime(struct RtcInfo *rtc)
{
    u8 i;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteByte(0x66);

    for (i = 0; i < RTC_TIME_BUF_LEN; i++)
        RTC_WriteByteReversed(RTC_TIME_BUF(rtc, i));

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

bool8 RTC_SetUnknownData(struct RtcInfo *rtc)
{
    u8 i;
    u8 a[2];

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    a[0] = ((rtc->unknown1 & 0xF) + 10 * ((rtc->unknown1 >> 4) & 0xF));

    if (a[0] <= 0xB)
        a[0] = rtc->unknown1;
    else
        a[0] = rtc->unknown1 | 0x80;

    a[1] = rtc->unknown2;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteByte(0x68);

    for (i = 0; i < 2; i++)
        RTC_WriteByteReversed(a[i]);

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

s32 RTC_WriteByte(u8 value)
{
    u8 i;
    u8 temp;

    for (i = 0; i < 8; i++)
    {
        temp = ((value >> (7 - i)) & 1);
        GPIOPortData = (temp << 1) | 4;
        GPIOPortData = (temp << 1) | 4;
        GPIOPortData = (temp << 1) | 4;
        GPIOPortData = (temp << 1) | 5;
    }

    // control reaches end of non-void function
}

s32 RTC_WriteByteReversed(u8 value)
{
    u8 i;
    u8 temp;

    for (i = 0; i < 8; i++)
    {
        temp = ((value >> i) & 1);
        GPIOPortData = (temp << 1) | 4;
        GPIOPortData = (temp << 1) | 4;
        GPIOPortData = (temp << 1) | 4;
        GPIOPortData = (temp << 1) | 5;
    }

    // control reaches end of non-void function
}

u8 RTC_ReadByte()
{
    u8 i;
    u8 temp;
    u8 value;

    for (i = 0; i < 8; i++)
    {
        GPIOPortData = 4;
        GPIOPortData = 4;
        GPIOPortData = 4;
        GPIOPortData = 4;
        GPIOPortData = 4;
        GPIOPortData = 5;

        temp = ((GPIOPortData & 2) >> 1);
        value = (value >> 1) | (temp << 7); // UB: accessing uninitialized var
    }

    return value;
}

void RTC_SetReadWriteInternal()
{
    GPIOPortReadWrite = 1;
}

void RTC_SetReadOnlyInternal()
{
    GPIOPortReadWrite = 0;
}
