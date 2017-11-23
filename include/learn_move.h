#ifndef GUARD_LEARN_MOVE_H
#define GUARD_LEARN_MOVE_H

struct ContestMove
{
    u8 effect;
    u8 contestCategory:3;
    u8 comboStarterId;
    u8 comboMoves[4];
};

struct ContestEffect
{
    u8 effectType;
    u8 appeal;
    u8 jam;
};

void sub_8132670(void);

#endif // GUARD_LEARN_MOVE_H
