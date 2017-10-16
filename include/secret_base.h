#ifndef GUARD_SECRET_BASE_H
#define GUARD_SECRET_BASE_H

void ResetSecretBases(void);
void sub_80BB970(struct MapEvents *);
u8 sub_80BBB24(void);
void sub_80BBCCC(u8);
void sub_80BC038(struct MapPosition *, struct MapEvents *);
u8 sub_80BC050();
u8 *GetSecretBaseMapName(u8 *);
void sub_80BC300();
u8 sub_80BCCA4(u8);
const u8 *sub_80BCCE8(void);
void sub_80BCF1C(u8);
void sub_80BD674(void *, u32, u8);

#endif // GUARD_SECRET_BASE_H
