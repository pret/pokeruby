#include "global.h"
#include "contest_painting_effects.h"
#include "contest_painting.h"

extern u16 (*gUnknown_03005DEC)[][32];
extern u8 gUnknown_03005E00;
extern u8 gUnknown_03005DFC;
extern u8 gUnknown_03005DF8;
extern u8 gUnknown_03005DF0;
extern u8 gUnknown_03005E04;
extern u8 gUnknown_03005DF4;

extern u8 gUnknown_03005DE8;

// this file's functions
void sub_80FCAA4(void);
void sub_80FCB5C(void);
void sub_80FCD54(void);
void sub_80FCEA4(void);
void sub_80FCCBC(void);
void sub_80FD06C(void);
void sub_80FD114(void);
void sub_80FCF3C(void);
void sub_80FCAC4(void);
void sub_80FCC18(u8);
void sub_80FC92C(u8);
void sub_80FC9E4(u8);
void sub_80FD1C8(u16);
u16 sub_80FD39C(u16*);
u16 sub_80FD68C(u16*, u16*, u16*);

void sub_80FC7A0(struct Unk03005E20* info)
{
    gUnknown_03005DEC = info->var_4;
    gUnknown_03005E00 = info->var_1F;
    gUnknown_03005DE8 = info->var_19;
    gUnknown_03005DFC = info->var_1A;
    gUnknown_03005DF8 = info->var_1B;
    gUnknown_03005DF0 = info->var_1C;
    gUnknown_03005E04 = info->var_1D;
    gUnknown_03005DF4 = info->var_1E;
    switch (info->var_0)
    {
    case 2:
        sub_80FCAA4();
        break;
    case 8:
        sub_80FCB5C();
        break;
    case 9:
        sub_80FCD54();
        sub_80FCC18(gUnknown_03005E00);
        break;
    case 10:
        sub_80FCD54();
        sub_80FCEA4();
        sub_80FCCBC();
    case 31:
        sub_80FCEA4();
        break;
    case 11:
        sub_80FCD54();
        sub_80FD06C();
        sub_80FD06C();
        sub_80FD114();
        sub_80FCCBC();
        break;
    case 13:
        sub_80FCF3C();
        break;
    case 30:
        sub_80FCD54();
        break;
    case 32:
        sub_80FD06C();
        break;
    case 33:
        sub_80FD114();
        break;
    case 6:
        sub_80FCAC4();
        sub_80FC92C(3);
        break;
    case 36:
        sub_80FCD54();
        sub_80FD06C();
        sub_80FD114();
        sub_80FCCBC();
        sub_80FCB5C();
        sub_80FCB5C();
        sub_80FC92C(2);
        sub_80FC9E4(4);
        break;
    }
}

#define RGB2(r, g, b) (((b) << 10) | ((g) << 5) | (r))

void sub_80FC92C(u8 a0) // it changes palette someway somehow... .__.
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* pal = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, pal++)
        {
            if (!(0x8000 & *pal))
            {
                u8 val = (31 & *pal);
                val += a0;
                if (val > 31)
                    val = 31;

                *pal = RGB2(val, val, val);
            }
        }
    }
}

void sub_80FC9E4(u8 a0)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* pal = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, pal++)
        {
            if (!(0x8000 & *pal))
            {
                u8 val = (31 & *pal);
                if (val > 31 - a0)
                    val = 31 - (a0 >> 1);

                *pal = RGB2(val, val, val);
            }
        }
    }
}

void sub_80FCAA4(void)
{
    u32 i;
    for (i = 0; i < 3200; i++)
        sub_80FD1C8(i);
}

void sub_80FCAC4(void)
{
    u8 i, j;
    for (i = 0; i < gUnknown_03005DF0; i++)
    {
        u16* var2 = &(*gUnknown_03005DEC)[0][(gUnknown_03005DFC + i) * gUnknown_03005E04];
        u16* pal = &var2[gUnknown_03005DE8];
        for (j = 0; j < gUnknown_03005DF8; j++, pal++)
        {
            if (!(0x8000 & *pal))
            {
                *pal = sub_80FD39C(pal);
            }
        }
    }
}
