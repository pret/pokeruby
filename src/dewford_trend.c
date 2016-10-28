#include "gba/gba.h"
#include "global.h"
#include "rng.h"

extern u16 sub_80EB72C(u16);

void sub_80FA740(void *);
void sub_80FA46C(void *, u16, u16);

//FixMe
void sub_80FA17C(void)
{
    u16 i;
    u32 r8;
    
    for(i = 0; i < 5; i++)
    {
        gSaveBlock1.unk2DD4[i].unk4 = sub_80EB72C(10);
        if(Random() & 1)
            gSaveBlock1.unk2DD4[i].unk6 = sub_80EB72C(12);
        else
            gSaveBlock1.unk2DD4[i].unk6 = sub_80EB72C(13);
        gSaveBlock1.unk2DD4[i].unk1_6 = Random() & 1;
        sub_80FA740(&gSaveBlock1.unk2DD4[i]);
    }
    sub_80FA46C(gSaveBlock1.unk2DD4, 5, 0);
}
