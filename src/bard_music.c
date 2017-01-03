#include "global.h"
#include "asm.h"

typedef struct BardSound {
    u8 pad_00[48];
} BardSound;

typedef struct UnkBard {
    /* 0x00 */ u8 var00;
    /* 0x01 */ s8 var01;
    /* 0x02 */ u16 var02;
    /* 0x04 */ u16 var04;
    /* 0x06 */ u16 var06;
} UnkBard;

typedef struct UnkBard3 {
    /* 0x00 */ u16 var00;
    /* 0x02 */ u16 var02;
    /* 0x04 */ s16 var04;
    /* 0x06 */ u16 var06;
} UnkBard3;

typedef struct UnkBard2 {
    /* 0x00 */ u8 var00;
    /* 0x01 */ u8 var01;
    /* 0x02 */ u8 var02;
    /* 0x03 */ u8 var03;
    /* 0x04 */ u16 var04;
               u8 pad06[4];
    /* 0x0A */ u16 var0A;
               u8 pad0C[18];
    /* 0x18 */ UnkBard3 var18[7]; // The size of this array likely is wrong
} UnkBard2;

extern BardSound *gBardMusicTable[];
extern s16 *gUnknown_08417068[];
extern u32 gUnknown_084170F4[];

s16 sub_814A2B8(u32 arg0, u32 arg1) {
    return gUnknown_08417068[arg0][arg1];
}

BardSound *sub_814A2D0(u16 arg0, u16 arg1) {
    BardSound *sounds;

    sounds = gBardMusicTable[arg0];

    return &sounds[arg1];
}

#ifdef NONMATCHING
void sub_814A2EC(UnkBard2 *dest, UnkBard (*src)[], u16 arg2) {
    u32 i;
    s32 n;

    for (i = 0; i < 5; i++) {
        s8 var01;
        u32 i1;

        dest->var18[i].var00 = src[i]->var00;
        if (src[i]->var00 == 0xFF) {
            continue;
        }

        var01 = src[i]->var01;
        i1 = gUnknown_084170F4[src[i]->var00];
        dest->var18[i].var02 = i1 + var01;
        dest->var18[i].var06 = src[i]->var04;
        dest->var04 += 1;
    }


    for (n = 0; n < 6; n++) {
        dest->var18[n + 1].var04 = sub_814A2B8(30 + arg2, n);
    }

    dest->var00 += 1;
    dest->var01 = 0;
    dest->var02 = 0;
    dest->var03 = 0;
    dest->var0A = 0;
}
#else
__attribute__((naked))
void sub_814A2EC(void) {
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    adds r6, r0, 0\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    mov r9, r2\n\
    ldr r4, _0814A370 @ =gUnknown_084170F4\n\
    adds r2, r1, 0\n\
    adds r3, r6, 0\n\
    adds r3, 0x18\n\
    movs r7, 0x5\n\
_0814A306:\n\
    ldrb r0, [r2]\n\
    strh r0, [r3]\n\
    ldrb r0, [r2]\n\
    cmp r0, 0xFF\n\
    beq _0814A328\n\
    movs r1, 0x1\n\
    ldrsb r1, [r2, r1]\n\
    lsls r0, 2\n\
    adds r0, r4\n\
    ldr r0, [r0]\n\
    adds r1, r0\n\
    strh r1, [r3, 0x2]\n\
    ldrh r0, [r2, 0x4]\n\
    strh r0, [r3, 0x6]\n\
    ldrh r0, [r6, 0x4]\n\
    adds r0, r1\n\
    strh r0, [r6, 0x4]\n\
_0814A328:\n\
    adds r2, 0x8\n\
    adds r3, 0x8\n\
    subs r7, 0x1\n\
    cmp r7, 0\n\
    bge _0814A306\n\
    movs r7, 0x6\n\
    movs r5, 0\n\
    movs r0, 0x1E\n\
    mov r8, r0\n\
    adds r4, r6, 0\n\
_0814A33C:\n\
    mov r0, r8\n\
    add r0, r9\n\
    adds r1, r5, 0\n\
    bl sub_814A2B8\n\
    adds r1, r0, 0\n\
    strh r1, [r4, 0x1C]\n\
    adds r4, 0x8\n\
    adds r5, 0x1\n\
    cmp r5, r7\n\
    blt _0814A33C\n\
    ldrb r1, [r6]\n\
    adds r1, 0x1\n\
    movs r2, 0\n\
    strb r1, [r6]\n\
    strb r2, [r6, 0x1]\n\
    strb r2, [r6, 0x2]\n\
    strb r2, [r6, 0x3]\n\
    strh r2, [r6, 0xA]\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_0814A370: .4byte gUnknown_084170F4\n\
    .syntax divided\n");
}
#endif
