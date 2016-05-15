#ifndef GUARD_GBA_GBA_H
#define GUARD_GBA_GBA_H

#include <stddef.h>

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;
typedef signed char    s8;
typedef signed short   s16;
typedef signed int     s32;

typedef volatile u8  vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile s8  vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;

typedef float  f32;
typedef double f64;

typedef u8  bool8;
typedef u16 bool16;
typedef u32 bool32;

#define TRUE  1
#define FALSE 0

#define IWRAM_DATA __attribute__((section("iwram_data")))
#define EWRAM_DATA __attribute__((section("ewram_data")))

#define ALIGNED(n) __attribute__((aligned(n)))

// The original build process placed COMMON data (i.e. uninitialized globals)
// in IWRAM after the static variables.
// When ld places COMMON variables in the output, it aligns the variable
// according to the size of the variable, with a maximum alignment of 16. This
// results in large alignment values.
// Initialized variables are aligned according to the size of the largest
// primitive type in the object, so their alignment will often be smaller.
// However, we cannot use COMMON data in pokeruby because the order of COMMON
// data in the output is not reliable. Instead, we need to initialize the
// variables so that their order in the source file is preserved in the output.
// But using initialized variables brings us into conflict with those large
// alignment values.
// These macros allow us to get around this by manually specifying what the
// alignment would be if the variable were uninitialized.
#define COMM(decl, n) IWRAM_DATA ALIGNED(1 << n) decl = {0};
#define COMM_0(decl) COMM(decl, 0)
#define COMM_1(decl) COMM(decl, 1)
#define COMM_2(decl) COMM(decl, 2)
#define COMM_4(decl) COMM(decl, 4)

#include "gba/io_reg.h"
#include "gba/syscall.h"
#include "gba/macro.h"

#define SOUND_INFO_PTR (*(struct SoundInfo **)0x3007FF0)
#define INTR_CHECK     (*(u16 *)0x3007FF8)
#define INTR_VECTOR    (*(void **)0x3007FFC)

#endif // GUARD_GBA_GBA_H
