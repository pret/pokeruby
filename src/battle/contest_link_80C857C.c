#include "global.h"
#include "link.h"

#if GERMAN

void de_sub_80C9274(bool32 arg0)
{
    if (deUnkValue2 == 1)
    {
        if (arg0)
            deUnkValue2 = 3;
        else
            deUnkValue2 = 2;
    }
}

void de_sub_80C9294(bool32 arg0)
{
    if (deUnkValue2 == 1)
    {
        if (arg0)
            deUnkValue2 = 3;
        else
            deUnkValue2 = 2;
    }
    else if (deUnkValue2 == 2)
    {
        SendBlock(0, sBlockRequestLookupTable[deUnkValue1].address, sBlockRequestLookupTable[deUnkValue1].size);
        if (arg0)
            deUnkValue2 = 0;
        else
            deUnkValue2 = 1;
    }
}

#endif
