#ifndef GUARD_DEWFORDTREND_H
#define GUARD_DEWFORDTREND_H

void InitDewfordTrend(void);
bool8 sub_80FA364(u16 *a);
void ReceiveDewfordTrendData(void *, u32, u8);
void UpdateDewfordTrendPerDay(u16);

#endif
