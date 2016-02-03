#include "gba/gba.h"
#include "rtc.h"

#define RTC_CTRL_UNK1          0x02 // unknown
#define RTC_CTRL_IRQ_ENABLE    0x08 // per-minute IRQ enable
#define RTC_CTRL_UNK2          0x20 // unknown
#define RTC_CTRL_24HOUR        0x40 // 0: 12-hour mode, 1: 24-hour mode
#define RTC_CTRL_POWER_FAILURE 0x80 // power failure occurred

#define OFFSET_YEAR        offsetof(struct RtcInfo, year)
#define OFFSET_MONTH       offsetof(struct RtcInfo, month)
#define OFFSET_DAY         offsetof(struct RtcInfo, day)
#define OFFSET_DAY_OF_WEEK offsetof(struct RtcInfo, dayOfWeek)
#define OFFSET_HOUR        offsetof(struct RtcInfo, hour)
#define OFFSET_MINUTE      offsetof(struct RtcInfo, minute)
#define OFFSET_SECOND      offsetof(struct RtcInfo, second)
#define OFFSET_CONTROL     offsetof(struct RtcInfo, control)
#define OFFSET_UNKNOWN1    offsetof(struct RtcInfo, unknown1)
#define OFFSET_UNKNOWN2    offsetof(struct RtcInfo, unknown2)

#define RTC_BUF(info, index) (*((u8 *)(info) + (index)))

#define RTC_DATETIME_BUF(info, index) (*((u8 *)(info) + OFFSET_YEAR + (index)))
#define RTC_DATETIME_BUF_LEN (OFFSET_SECOND - OFFSET_YEAR + 1)

#define RTC_TIME_BUF(info, index) (*((u8 *)(info) + OFFSET_HOUR + (index)))
#define RTC_TIME_BUF_LEN (OFFSET_SECOND - OFFSET_HOUR + 1)

#define RTC_CMD_RESET       0x60
#define RTC_CMD_WR_CONTROL  0x62
#define RTC_CMD_RD_CONTROL  0x63
#define RTC_CMD_WR_DATETIME 0x64
#define RTC_CMD_RD_DATETIME 0x65
#define RTC_CMD_WR_TIME     0x66
#define RTC_CMD_RD_TIME     0x67
#define RTC_CMD_WR_UNKNOWN  0x68

extern vu16 GPIOPortData;
extern vu16 GPIOPortDirection;
extern vu16 GPIOPortReadEnable;

extern bool8 gRtcLocked;

s32 RTC_WriteCommand(u8 value);
s32 RTC_WriteData(u8 value);
u8 RTC_ReadData();
void RTC_EnableGpioPortRead();
void RTC_DisableGpioPortRead();

void RTC_Unprotect()
{
    RTC_EnableGpioPortRead();
    gRtcLocked = FALSE;
}

void RTC_Protect()
{
    RTC_DisableGpioPortRead();
    gRtcLocked = TRUE;
}

u8 RTC_Probe()
{
    u8 errorCode;
    struct RtcInfo rtc;

    if (!RTC_GetControl(&rtc))
        return 0;

    errorCode = 0;

    if ((rtc.control & (RTC_INFO_CTRL_POWER_FAILURE | RTC_INFO_CTRL_24HOUR)) == RTC_INFO_CTRL_POWER_FAILURE
     || (rtc.control & (RTC_INFO_CTRL_POWER_FAILURE | RTC_INFO_CTRL_24HOUR)) == 0)
    {
        if (!RTC_Reset())
            return 0;

        errorCode++;
    }

    RTC_GetTime(&rtc);

    if (rtc.second & 0x80)
    {
        if (!RTC_Reset())
            return (errorCode << 4) & 0xF0;

        errorCode++;
    }

    return (errorCode << 4) | 1;
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

    RTC_WriteCommand(RTC_CMD_RESET);

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    rtc.control = RTC_INFO_CTRL_24HOUR;

    result = RTC_SetControl(&rtc);

    return result;
}

bool8 RTC_GetControl(struct RtcInfo *rtc)
{
    u8 controlData;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteCommand(RTC_CMD_RD_CONTROL);

    GPIOPortDirection = 5;

    controlData = RTC_ReadData();

    rtc->control = (controlData & (RTC_CTRL_POWER_FAILURE | RTC_CTRL_24HOUR))
                 | ((controlData & RTC_CTRL_UNK2) >> 3)
                 | ((controlData & RTC_CTRL_IRQ_ENABLE) >> 2)
                 | ((controlData & RTC_CTRL_UNK1) >> 1);

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

bool8 RTC_SetControl(struct RtcInfo *rtc)
{
    u8 controlData;

    if (gRtcLocked == TRUE)
        return FALSE;

    gRtcLocked = TRUE;

    GPIOPortData = 1;
    GPIOPortData = 5;

    controlData = RTC_CTRL_24HOUR
                | ((rtc->control & RTC_INFO_CTRL_UNK2) << 3)
                | ((rtc->control & RTC_INFO_CTRL_IRQ_ENABLE) << 2)
                | ((rtc->control & RTC_INFO_CTRL_UNK1) << 1);

    GPIOPortDirection = 7;

    RTC_WriteCommand(RTC_CMD_WR_CONTROL);

    RTC_WriteData(controlData);

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

    RTC_WriteCommand(RTC_CMD_RD_DATETIME);

    GPIOPortDirection = 5;

    for (i = 0; i < RTC_DATETIME_BUF_LEN; i++)
        RTC_DATETIME_BUF(rtc, i) = RTC_ReadData();

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

    RTC_WriteCommand(RTC_CMD_WR_DATETIME);

    for (i = 0; i < RTC_DATETIME_BUF_LEN; i++)
        RTC_WriteData(RTC_DATETIME_BUF(rtc, i));

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

    RTC_WriteCommand(RTC_CMD_RD_TIME);

    GPIOPortDirection = 5;

    for (i = 0; i < RTC_TIME_BUF_LEN; i++)
        RTC_TIME_BUF(rtc, i) = RTC_ReadData();

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

    RTC_WriteCommand(RTC_CMD_WR_TIME);

    for (i = 0; i < RTC_TIME_BUF_LEN; i++)
        RTC_WriteData(RTC_TIME_BUF(rtc, i));

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

    // unknown1 appears to be a BCD number in the range 0-11,
    // so it may be an hour in 12-hour format.
    // Months are normally 1-12.

    a[0] = ((rtc->unknown1 & 0xF) + 10 * ((rtc->unknown1 >> 4) & 0xF));

    if (a[0] < 12)
        a[0] = rtc->unknown1;
    else
        a[0] = rtc->unknown1 | 0x80;

    a[1] = rtc->unknown2;

    GPIOPortData = 1;
    GPIOPortData = 5;

    GPIOPortDirection = 7;

    RTC_WriteCommand(RTC_CMD_WR_UNKNOWN);

    for (i = 0; i < 2; i++)
        RTC_WriteData(a[i]);

    GPIOPortData = 1;
    GPIOPortData = 1;

    gRtcLocked = FALSE;

    return TRUE;
}

s32 RTC_WriteCommand(u8 value)
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

s32 RTC_WriteData(u8 value)
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

u8 RTC_ReadData()
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

void RTC_EnableGpioPortRead()
{
    GPIOPortReadEnable = 1;
}

void RTC_DisableGpioPortRead()
{
    GPIOPortReadEnable = 0;
}
