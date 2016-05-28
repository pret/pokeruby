#ifndef GUARD_GBA_DEFINES
#define GUARD_GBA_DEFINES

#include <stddef.h>

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
#define COMM_2(decl) COMM(decl, 2)
#define COMM_3(decl) COMM(decl, 3)
#define COMM_4(decl) COMM(decl, 4)

#define SOUND_INFO_PTR (*(struct SoundInfo **)0x3007FF0)
#define INTR_CHECK     (*(u16 *)0x3007FF8)
#define INTR_VECTOR    (*(void **)0x3007FFC)

#define OBJ_VRAM0 0x6010000 // when BG is in tiled mode
#define OBJ_VRAM1 0x6014000 // when BG is in bitmap mode

#define OAM 0x7000000

#define DISPLAY_WIDTH  240
#define DISPLAY_HEIGHT 160

#define TILE_SIZE_4BPP 32
#define TILE_SIZE_8BPP 64

#define TOTAL_OBJ_TILE_COUNT 1024

#endif // GUARD_GBA_DEFINES
