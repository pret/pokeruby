#ifndef GUARD_SCRIPTPOKE80F9_H
#define GUARD_SCRIPTPOKE80F9_H

struct UnknownStruct2018000
{
    u8 filler0[0x8];
    u8 unk8;
};

void OpenPartyMenuFromScriptContext(u8 taskId);
void sub_80F9C00(void);
void sub_80F9E1C(void);
void sub_80F99CC(void);
void HandleSelectPartyMenu(u8 taskId);
bool8 SetupContestPartyMenu(void);
void HandleMoveTutorPartyMenu(u8 taskId);
bool8 SetupMoveTutorPartyMenu(void);

#endif
