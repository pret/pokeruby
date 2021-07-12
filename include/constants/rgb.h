#ifndef POKERUBY_CONSTANTS_RGB_H
#define POKERUBY_CONSTANTS_RGB_H

#define GET_R(color) ((color) & 0x1F)
#define GET_G(color) (((color) >> 5) & 0x1F)
#define GET_B(color) (((color) >> 10) & 0x1F)

#define RGB_ALPHA       (1 << 15)
#define IS_ALPHA(color) ((color) & RGB_ALPHA)

#define RGB2(r, g, b) (((b) << 10) | ((g) << 5) | (r))

#endif // POKERUBY_CONSTANTS_RGB_H
