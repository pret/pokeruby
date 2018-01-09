#include "global.h"
#include "name_string_util.h"
#include "string_util.h"
#include "text.h"

void PadNameString(u8 *a1, u8 a2)
{
    u8 i;

    Text_StripExtCtrlCodes(a1);
    i = StringLength(a1);

    if (a2 == 0xFC)
    {
        while (i < 6)
        {
            a1[i] = 0xFC;
            a1[i + 1] = 7;
            i += 2;
        }
    }
    else
    {
        while (i < 6)
        {
            a1[i] = a2;
            i++;
        }
    }

    a1[i] = EOS;
}

void SanitizeNameString(u8 *a1)
{
    if (StringLength(a1) < 6)
        ConvertInternationalString(a1, 1);
    else
        Text_StripExtCtrlCodes(a1);
}
