#ifndef GUARD_SCRIPTPOKE80C4_H
#define GUARD_SCRIPTPOKE80C4_H

struct MonCoords
{
    u8 x, y;
};

void sub_80C5190(u8);
void sub_80C5580(void);
void SetBattleTowerPlayerParty(void);
void ReducePlayerPartyToThree(void);

u8 sub_80C4D50(void);
void ShowContestWinner(void);
void HealPlayerParty();
u8 ScriptGiveMon(u16, u8, u16, u32, u32, u8);
u8 ScriptGiveEgg(u16);
void ScriptWildBattle(u16, u8, u16);
void ScriptSetMonMoveSlot(u8, u16, u8);

#endif
