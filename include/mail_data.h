#ifndef GUARD_MAIL_DATA_H
#define GUARD_MAIL_DATA_H

void ClearMailData(void);
void ClearMailStruct(struct MailStruct *);
void ClearMailStruct(struct MailStruct *);
u8 GiveMailToMon(struct Pokemon *, u16);
u16 SpeciesToMailSpecies(u16, u32);
u16 MailSpeciesToSpecies(u16, u16 *);
u8 GiveMailToMon2(struct Pokemon *, struct MailStruct *);
void TakeMailFromMon(struct Pokemon *);
u8 TakeMailFromMon2(struct Pokemon *);
bool8 ItemIsMail(u16);
bool8 MonHasMail(struct Pokemon *);

#endif // GUARD_MAIL_DATA_H
