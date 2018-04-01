#ifndef GUARD_SECRET_BASE_H
#define GUARD_SECRET_BASE_H

// Maximum number of secret bases the game can store. This include 1 for the player, and up to 19 others from linked players.
#define MAX_SECRET_BASES 20

void ResetSecretBases(void);
void sub_80BB5E4(void);
void sub_80BB63C(void);
void sub_80BB800(void);
void sub_80BB970(struct MapEvents *events);
u8 sub_80BBB24(void);
void sub_80BBCCC(u8 flagIn);
void sub_80BBFD8(struct MapPosition *, struct MapEvents *);
void sub_80BC038(struct MapPosition *, struct MapEvents *);
u8 sub_80BC050();
u8 *GetSecretBaseMapName(u8 *dest);
void sub_80BC300();
u8 sub_80BCCA4(u8 secretBaseIndex);
const u8 *GetSecretBaseTrainerLoseText(void);
void sub_80BCF1C(u8 taskId);
void sub_80BD674(void *playerRecords, u32 size, u8 c);
#if DEBUG
void unref_sub_80BCD7C(u8 secretBaseIndex);
#endif

#endif // GUARD_SECRET_BASE_H
