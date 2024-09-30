#ifndef GUARD_SECRET_BASE_H
#define GUARD_SECRET_BASE_H

// Maximum number of secret bases the game can store. This include 1 for the player, and up to 19 others from linked players.
#define MAX_SECRET_BASES 20

void ResetSecretBases(void);
void SetCurrentSecretBaseVar(void);
void CheckPlayerHasSecretBase(void);
void SetOpenedSecretBaseMetatile(void);
void SetOccupiedSecretBaseEntranceMetatiles(const struct MapEvents *events);
u8 sub_80BBB24(void);
void InitSecretBaseAppearance(u8 flagIn);
void SetCurrentSecretBaseFromPosition(struct MapPosition *, const struct MapEvents *);
void sub_80BC038(struct MapPosition *, const struct MapEvents *);
u8 sub_80BC050();
u8 *GetSecretBaseMapName(u8 *dest);
void SetPlayerSecretBaseRecordMixingParty();
const u8 *GetSecretBaseTrainerLoseText(void);
void sub_80BCF1C(u8 taskId);
void ReceiveSecretBasesData(void *playerRecords, u32 size, u8 c);
#if DEBUG
void unref_sub_80BCD7C(u8 secretBaseIndex);
u8 *sub_80BC190(u8 *dest, u8 arg1);
#endif

#endif // GUARD_SECRET_BASE_H
