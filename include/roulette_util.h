#ifndef GUARD_ROULETTE_UTIL_H
#define GUARD_ROULETTE_UTIL_H

// Exported type declarations

typedef struct {
    u8 unk_00;
    u16 unk_02;
    u8 unk_04;
    u8 unk_05;
    u16 unk_08;
    u16 unk_0a;
    u8 unk_0c;
    u8 unk_0d;
    u8 unk_0e;
    u8 unk_0f_0:5;
    u8 unk_0f_5:2;
    u8 unk_0f_7:1;
    u8 filler_10[0xb4];
} roulette_util_t;

// Exported RAM declarations

// Exported ROM declarations

void task_tutorial_controls_fadein(roulette_util_t *util);

#endif //GUARD_ROULETTE_UTIL_H
