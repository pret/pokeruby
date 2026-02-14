#ifndef GUARD_MYSTERY_EVENT_SCRIPT_H
#define GUARD_MYSTERY_EVENT_SCRIPT_H

enum {
    MEVENT_STATUS_LOAD_OK,
    MEVENT_STATUS_LOAD_ERROR,
    MEVENT_STATUS_SUCCESS,
    MEVENT_STATUS_FAILURE,
    MEVENT_STATUS_FF = 0xFF
};

u32 RunMysteryEventScript(u8 *script);
void SetMysteryEventScriptStatus(u32 status);
u16 GetRecordMixingGift(void);
#if DEBUG
bool8 debug_sub_812620C(u8 *a1, const u8 * _a2);
bool8 debug_sub_81261B4(u8 *a1, const u8 * _a2);
#endif // DEBUG

#endif // GUARD_MYSTERY_EVENT_SCRIPT_H
