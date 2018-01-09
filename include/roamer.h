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

#endif
