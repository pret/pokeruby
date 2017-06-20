#ifndef GUARD_FIELD_SPECIALS_H
#define GUARD_FIELD_SPECIALS_H

struct ElevatorMenu {
    u8 var0;
    s8 var1;
    s8 var2;
    u8 var3;
};

extern struct ElevatorMenu gUnknown_03000760[20];
extern struct WarpData gUnknown_020297F0;
extern u8 gUnknown_02024D26;

extern u16 gScriptResult;
extern u8 gUnknown_02039250;
extern u8 gUnknown_02039251;
extern u32 gUnknown_02039254;
extern u8 gUnknown_02039258;
extern u8 gUnknown_02039259;
extern u8 gUnknown_0203925A;
extern u8 gUnknown_0203925B;
extern u8 gUnknown_0203925C;

extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;

void ResetCyclingRoadChallengeData(void);
bool32 CountSSTidalStep(u16);
u8 GetSSTidalLocation(s8 *, s8 *, s16 *, s16 *);
void ScriptAddElevatorMenuItem(u8, u8, u8, u8);
void ScriptShowElevatorMenu(void);
void SetShoalItemFlag(u16);
u8 GetLeadMonIndex(void);
void ResetFanClub(void);

#endif // GUARD_FIELD_SPECIALS_H
