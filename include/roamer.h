#ifndef GUARD_ROAMER_H
#define GUARD_ROAMER_H

void ClearRoamerData(void);
void ClearRoamerLocationData(void);
void UpdateLocationHistoryForRoamer(void);
void RoamerMoveToOtherLocationSet(void);
void RoamerMove();
u8 TryStartRoamerEncounter(void);
void UpdateRoamerHPStatus(struct Pokemon *mon);
void SetRoamerInactive(void);

#if DEBUG
void Debug_CreateRoamer(void);
void Debug_GetRoamerLocation(u8 *);
#endif // DEBUG

void GetRoamerLocation(u8 *mapGroup, u8 *mapNum);

#endif // GUARD_ROAMER_H
