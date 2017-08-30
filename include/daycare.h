#ifndef GUARD_DAYCARE_H
#define GUARD_DAYCARE_H

u8 Daycare_CountPokemon(struct DayCareData *);
void sub_8041324(struct BoxPokemon *, struct DayCareMailEtc *);
void sub_8041790(u16 i);
u16 sub_8041870(u16);
void sub_8041940(void);
void sub_8041950(void);
void sub_8042044(struct Pokemon *mon, u16, u8);
u8 sub_80422A0(void);
u8 daycare_relationship_score_from_savegame(void);

#endif // GUARD_DAYCARE_H
