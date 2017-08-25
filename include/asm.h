#ifndef GUARD_ASM_H
#define GUARD_ASM_H

// Share enumerated constants between C and assembly code
#ifdef __ASSEMBLY__
.macro asm_enum args:vararg
    .set __enumval__, 0
    .irp arg,\args
        .equiv \arg, __enumval__
        .set __enumval__, __enumval__ + 1
    .endr
.endm
#define ASM_ENUM(...) asm_enum __VA_ARGS__
#else
#define ASM_ENUM(...) enum {__VA_ARGS__};
#endif

#endif
