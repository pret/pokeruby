#ifndef GUARD_ROULETTE_UTIL_H
#define GUARD_ROULETTE_UTIL_H

// Exported type declarations

struct RouletteUtilSubstruct {
    u8 unk_00;
    u16 unk_02;
    u8 unk_04;
    u8 unk_05;
    u16 unk_08;
    u8 filler_0a[2];
    u8 unk_0c;
    u8 unk_0d;
    u8 filler_0e[0xb2];
};

// Exported RAM declarations

// Exported ROM declarations

void task_tutorial_controls_fadein(struct RouletteUtilSubstruct *util);

#endif //GUARD_ROULETTE_UTIL_H
