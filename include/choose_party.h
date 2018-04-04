#ifndef GUARD_CHOOSE_PARTY_H
#define GUARD_CHOOSE_PARTY_H

void sub_8121E10(void);
void sub_8121E34(void);
bool8 SetupBattleTowerPartyMenu(void);
void HandleBattleTowerPartyMenu(u8 taskId);
bool8 SetupLinkMultiBattlePartyMenu(void);
void HandleLinkMultiBattlePartyMenu(u8 taskId);
void HandleDaycarePartyMenu(u8 taskId);
void sub_8123138(u8 taskId);
#if DEBUG
void Debug_CopyLastThreePartyMonsToMultiPartnerParty(void);
#endif

#endif // GUARD_CHOOSE_PARTY_H
