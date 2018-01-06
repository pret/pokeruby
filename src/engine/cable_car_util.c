#include "global.h"
#include "cable_car_util.h"

// static types

// static declarations

// rodata

// text

void CableCarUtil_FillWrapped(void *dest, u16 value, u8 x, u8 y, u8 width, u8 height)
{
    u8 i;
    u8 j;
    u8 _x;
    u8 _y;

    for (i = 0, _y = y; i < height; i++)
    {
        for (_x = x, j = 0; j < width; j++)
        {
            *(u16 *)&((u8 *)dest)[_y * 64 + _x * 2] = value;
            _x = (_x + 1) % 32;
        }
        _y = (_y + 1) % 32;
    }
}
void CableCarUtil_CopyWrapped(void *dest, const u16 *src, u8 x, u8 y, u8 width, u8 height)
{
    u8 i;
    u8 j;
    u8 _x;
    u8 _y;
    const u16 *_src;

    for (i = 0, _src = src, _y = y; i < height; i++)
    {
        for (_x = x, j = 0; j < width; j++)
        {
            *(u16 *)&((u8 *)dest)[_y * 64 + _x * 2] = *_src++;
            _x = (_x + 1) % 32;
        }
        _y = (_y + 1) % 32;
    }
}
