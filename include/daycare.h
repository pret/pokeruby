#ifndef GUARD_DAYCARE_H
#define GUARD_DAYCARE_H

#define EGG_HATCH_LEVEL 5

u8 *GetMonNick(struct Pokemon *, u8 *);
u8 *GetBoxMonNick(struct BoxPokemon *, u8 *);
u8 CountPokemonInDaycare(struct DayCare *);
void InitDaycareMailRecordMixing(struct BoxPokemon *, struct RecordMixingDayCareMail *);
void Debug_AddDaycareSteps(u16 i);
u16 GetEggSpecies(u16);
void TriggerPendingDaycareEgg(void);
void TriggerPendingDaycareMaleEgg(void);
void CreateEgg(struct Pokemon *mon, u16, u8);
u8 ShouldEggHatch(void);
u8 GetDaycareCompatibilityScoreFromSave(void);
bool8 NameHasGenderSymbol(const u8 *, u8);

#endif // GUARD_DAYCARE_H
