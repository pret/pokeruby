#ifndef GUARD_BATTLE_TRANSITION_H
#define GUARD_BATTLE_TRANSITION_H

void sub_811AABC(u8);
void sub_811AAD8(u8);
bool8 IsBattleTransitionDone(void);

#define TRANSITIONS_NO         17

enum // TRANSITION_MUGSHOT
{
    MUGSHOT_SYDNEY,
    MUGSHOT_PHOEBE,
    MUGSHOT_GLACIA,
    MUGSHOT_DRAKE,
    MUGSHOT_STEVEN,
};

#define MUGSHOTS_NO             5

// credits for the names goes to Dyskinesia

#define B_TRANSITION_BLUR               0
#define B_TRANSITION_SMEAR              1
#define B_TRANSITION_SHUFFLE            2
#define B_TRANSITION_BIG_POKEBALL       3
#define B_TRANSITION_POKEBALLS_WIPEOUT  4
#define B_TRANSITION_RIPPLE             6
#define B_TRANSITION_WAVE               7
#define B_TRANSITION_SLICE              8
#define B_TRANSITION_SHARDS             11
#define B_TRANSITION_SYDNEY             12
#define B_TRANSITION_PHOEBE             13
#define B_TRANSITION_GLACIA             14
#define B_TRANSITION_DRAKE              15
#define B_TRANSITION_STEVEN             16

#endif // GUARD_BATTLE_TRANSITION_H
