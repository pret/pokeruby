#include "global.h"
#include "string_util.h"

#define MAX_PLACEHOLDER_ID 0xD

typedef u8 *(*ExpandPlaceholderFunc)();

extern u8 gDigits[];
extern s32 gPowersOfTen[];
extern u8 gUnknown_081E72EC[];
extern u8 gUnknown_081E72F0[];
extern ExpandPlaceholderFunc gExpandPlaceholderFuncTable[];

extern u8 gExpandedPlaceholder_Empty[];
extern u8 gExpandedPlaceholder_MaleEmpty[];
extern u8 gExpandedPlaceholder_FemaleEmpty[];
extern u8 gExpandedPlaceholder_Sapphire[];
extern u8 gExpandedPlaceholder_Ruby[];
extern u8 gExpandedPlaceholder_Aqua[];
extern u8 gExpandedPlaceholder_Magma[];
extern u8 gExpandedPlaceholder_Archie[];
extern u8 gExpandedPlaceholder_Maxie[];
extern u8 gExpandedPlaceholder_Kyogre[];
extern u8 gExpandedPlaceholder_Groudon[];
extern u8 gExpandedPlaceholder_Brendan[];
extern u8 gExpandedPlaceholder_May[];

extern u8 gUnknownStringVar[];

extern u8 GetExtCtrlCodeLength(u8 code);

u8 *GetExpandedPlaceholder(u32 id);

u8 *StringCopy10(u8 *dest, u8 *src)
{
    u8 i;
    u32 limit = 10;

    for (i = 0; i < limit; i++)
    {
        dest[i] = src[i];

        if (dest[i] == EOS)
            return &dest[i];
    }

    dest[i] = EOS;
    return &dest[i];
}

u8 *StringGetEnd10(u8 *str)
{
    u8 i;
    u32 limit = 10;

    for (i = 0; i < limit; i++)
        if (str[i] == EOS)
            return &str[i];

    str[i] = EOS;
    return &str[i];
}

u8 *StringCopy8(u8 *dest, u8 *src)
{
    s32 i;

    for (i = 0; i < 8; i++)
    {
        dest[i] = src[i];

        if (dest[i] == EOS)
            return &dest[i];
    }

    dest[i] = EOS;
    return &dest[i];
}

u8 *StringCopy(u8 *dest, u8 *src)
{
    while (*src != EOS)
    {
        *dest = *src;
        dest++;
        src++;
    }

    *dest = EOS;
    return dest;
}

u8 *StringAppend(u8 *dest, u8 *src)
{
    while (*dest != EOS)
        dest++;

    return StringCopy(dest, src);
}

u8 *StringCopyN(u8 *dest, u8 *src, u8 n)
{
    u16 i;

    for (i = 0; i < n; i++)
        dest[i] = src[i];

    return &dest[n];
}

u8 *StringAppendN(u8 *dest, u8 *src, u8 n)
{
    while (*dest != EOS)
        dest++;

    return StringCopyN(dest, src, n);
}

u16 StringGetLength(u8 *str)
{
    u16 length = 0;

    while (str[length] != EOS)
    {
        u16 temp = length;
        length++;
        if (str[temp] == EXT_CTRL_CODE_BEGIN)
            length += GetExtCtrlCodeLength(str[length]);
    }

    return length;
}

s32 StringCompare(u8 *str1, u8 *str2)
{
    while (*str1 == *str2)
    {
        if (*str1 == EOS)
            return 0;
        str1++;
        str2++;
    }

    return *str1 - *str2;
}

s32 StringCompareN(u8 *str1, u8 *str2, u32 n)
{
    while (*str1 == *str2)
    {
        if (*str1 == EOS)
            return 0;
        str1++;
        str2++;
        if (--n == 0)
            return 0;
    }

    return *str1 - *str2;
}

u8 *ConvertIntToDecimalStringN(u8 *dest, s32 value, enum StringConvertMode mode, u8 n)
{
    enum { WAITING_FOR_NONZERO_DIGIT, WRITING_DIGITS, WRITING_SPACES } state;
    s32 powerOfTen;
    s32 largestPowerOfTen = gPowersOfTen[n - 1];

    state = WAITING_FOR_NONZERO_DIGIT;

    if (mode == STR_CONV_MODE_RIGHT_ALIGN)
        state = WRITING_SPACES;

    if (mode == STR_CONV_MODE_LEADING_ZEROS)
        state = WRITING_DIGITS;

    for (powerOfTen = largestPowerOfTen; powerOfTen > 0; powerOfTen /= 10)
    {
        char *out;
        u8 c;
        u16 digit = value / powerOfTen;
        s32 temp = value - (powerOfTen * digit);

        if (state == WRITING_DIGITS)
        {
            out = dest++;

            if (digit <= 9)
                c = gDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (digit != 0 || powerOfTen == 1)
        {
            state = WRITING_DIGITS;
            out = dest++;

            if (digit <= 9)
                c = gDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (state == WRITING_SPACES)
        {
            *dest++ = CHAR_SPACE;
        }

        value = temp;
    }

    *dest = EOS;
    return dest;
}

u8 *ConvertIntToDecimalStringN_UnknownExtCtrlCode(u8 *dest, s32 value, enum StringConvertMode mode, u8 n)
{
    enum { WAITING_FOR_NONZERO_DIGIT, WRITING_DIGITS, WRITING_SPACES } state;
    s32 powerOfTen;
    s32 largestPowerOfTen = gPowersOfTen[n - 1];

    *dest++ = EXT_CTRL_CODE_BEGIN;
    *dest++ = 0x14;
    *dest++ = 0x06;

    state = WAITING_FOR_NONZERO_DIGIT;

    if (mode == STR_CONV_MODE_RIGHT_ALIGN)
        state = WRITING_SPACES;

    if (mode == STR_CONV_MODE_LEADING_ZEROS)
        state = WRITING_DIGITS;

    for (powerOfTen = largestPowerOfTen; powerOfTen > 0; powerOfTen /= 10)
    {
        char *out;
        u8 c;
        u16 digit = value / powerOfTen;
        s32 temp = value - (powerOfTen * digit);

        if (state == WRITING_DIGITS)
        {
            out = dest++;

            if (digit <= 9)
                c = gDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (digit != 0 || powerOfTen == 1)
        {
            state = WRITING_DIGITS;
            out = dest++;

            if (digit <= 9)
                c = gDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (state == WRITING_SPACES)
        {
            *dest++ = CHAR_SPACE;
        }

        value = temp;
    }

    *dest++ = EXT_CTRL_CODE_BEGIN;
    *dest++ = 0x14;
    *dest++ = 0x00;

    *dest = EOS;
    return dest;
}

u8 *ConvertIntToHexStringN(u8 *dest, s32 value, enum StringConvertMode mode, u8 n)
{
    enum { WAITING_FOR_NONZERO_DIGIT, WRITING_DIGITS, WRITING_SPACES } state;
    u8 i;
    s32 powerOfSixteen;
    s32 largestPowerOfSixteen = 1;

    for (i = 1; i < n; i++)
        largestPowerOfSixteen *= 16;

    state = WAITING_FOR_NONZERO_DIGIT;

    if (mode == STR_CONV_MODE_RIGHT_ALIGN)
        state = WRITING_SPACES;

    if (mode == STR_CONV_MODE_LEADING_ZEROS)
        state = WRITING_DIGITS;

    for (powerOfSixteen = largestPowerOfSixteen; powerOfSixteen > 0; powerOfSixteen /= 16)
    {
        char *out;
        u8 c;
        u32 digit = value / powerOfSixteen;
        s32 temp = value % powerOfSixteen;

        if (state == WRITING_DIGITS)
        {
            out = dest++;

            if (digit <= 0xF)
                c = gDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (digit != 0 || powerOfSixteen == 1)
        {
            state = 1;
            out = dest++;

            if (digit <= 0xF)
                c = gDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (state == WRITING_SPACES)
        {
            *dest++ = CHAR_SPACE;
        }

        value = temp;
    }

    *dest = EOS;
    return dest;
}

u8 *ConvertIntToDecimalString(u8 *dest, s32 value)
{
    char temp[12];
    s32 length = 0;

    do
    {
        temp[length++] = gDigits[value % 10];
        value /= 10;
    } while (value != 0);

    length--;

    while (length != -1)
    {
        *dest++ = temp[length];
        length--;
    }

    *dest = EOS;
    return dest;
}

u8 *StringExpandPlaceholders(u8 *dest, u8 *src)
{
    for (;;)
    {
        u8 c = *src++;
        u8 placeholderId;
        u8 *expandedString;
        u8 length;

        switch (c)
        {
        case PLACEHOLDER_BEGIN:
            placeholderId = *src++;
            expandedString = GetExpandedPlaceholder(placeholderId);
            dest = StringExpandPlaceholders(dest, expandedString);
            break;
        case EXT_CTRL_CODE_BEGIN:
            *dest++ = c;
            length = GetExtCtrlCodeLength(*src);
            memcpy(dest, src, length);
            dest += length;
            src += length;
            break;
        case EOS:
            *dest = EOS;
            return dest;
        case 0xFA:
        case 0xFB:
        case 0xFE:
        default:
            *dest++ = c;
        }
    }
}

u8 *UnknownStringFunc(u8 *dest, u8 *src)
{
    u8 array1[4];
    u8 array2[5];

    memcpy(array1, gUnknown_081E72EC, 4);
    memcpy(array2, gUnknown_081E72F0, 5);

    dest = StringCopy(dest, array1);

    for (;;)
    {
        u8 c = *src++;

        switch (c)
        {
        case EOS:
            *dest = c;
            return dest;
        case 0xFE:
            dest = StringCopy(dest, array2);
            break;
        default:
            *dest++ = c;
            *dest++ = c + 0x40;
            break;
        }
    }
}

u8 *ExpandPlaceholder_UnknownStringVar()
{
    return gUnknownStringVar;
}

u8 *ExpandPlaceholder_PlayerName()
{
    return gSaveBlock2.playerName;
}

u8 *ExpandPlaceholder_StringVar1()
{
    return gStringVar1;
}

u8 *ExpandPlaceholder_StringVar2()
{
    return gStringVar2;
}

u8 *ExpandPlaceholder_StringVar3()
{
    return gStringVar3;
}

u8 *ExpandPlaceholder_UnknownString()
{
    if (gSaveBlock2.playerGender == MALE)
        return gExpandedPlaceholder_MaleEmpty;
    else
        return gExpandedPlaceholder_FemaleEmpty;
}

u8 *ExpandPlaceholder_RivalName()
{
    if (gSaveBlock2.playerGender == MALE)
        return gExpandedPlaceholder_May;
    else
        return gExpandedPlaceholder_Brendan;
}

#define VERSION_DEPENDENT_PLACEHOLDER_LIST \
    X(Version,          Ruby,    Sapphire) \
    X(EvilTeam,         Magma,   Aqua)     \
    X(GoodTeam,         Aqua,    Magma)    \
    X(EvilTeamLeader,   Maxie,   Archie)   \
    X(GoodTeamLeader,   Archie,  Maxie)    \
    X(CurVersionMascot, Groudon, Kyogre)   \
    X(OppVersionMascot, Kyogre,  Groudon)

#ifdef SAPPHIRE
#define X(ph, r, s) \
u8 *ExpandPlaceholder_##ph() { return gExpandedPlaceholder_##s; }
VERSION_DEPENDENT_PLACEHOLDER_LIST
#else
#define X(ph, r, s) \
u8 *ExpandPlaceholder_##ph() { return gExpandedPlaceholder_##r; }
VERSION_DEPENDENT_PLACEHOLDER_LIST
#endif

#undef X

u8 *GetExpandedPlaceholder(u32 id)
{
    if (id > MAX_PLACEHOLDER_ID)
        return gExpandedPlaceholder_Empty;
    else
        return gExpandPlaceholderFuncTable[id]();
}

u8 *StringFill(u8 *dest, u8 c, u16 n)
{
    u16 i;

    for (i = 0; i < n; i++)
        *dest++ = c;

    *dest = EOS;
    return dest;
}

u8 *StringCopyPadded(u8 *dest, u8 *src, u8 c, u16 n)
{
    while (*src != EOS)
    {
        *dest++ = *src++;

        if (n)
            n--;
    }

    n--;

    while (n != (u16)-1)
    {
        *dest++ = c;
        n--;
    }

    *dest = EOS;
    return dest;
}

u8 *StringFillWithTerminator(u8 *dest, u16 n)
{
    return StringFill(dest, EOS, n);
}
