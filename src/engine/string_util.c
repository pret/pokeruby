#include "global.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"

u8 gUnknownStringVar[16];

const u8 gEmptyString_81E72B0[] = _("");
const u8 gRightPointingTriangleString[] = _("▶");

static const u8 sDigits[] = __("0123456789ABCDEF");

static const s32 sPowersOfTen[] =
{
             1,
            10,
           100,
          1000,
         10000,
        100000,
       1000000,
      10000000,
     100000000,
    1000000000,
};

u8 *StringCopy10(u8 *dest, const u8 *src)
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

u8 *StringCopy8(u8 *dest, const u8 *src)
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

u8 *StringCopy(u8 *dest, const u8 *src)
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

u8 *StringAppend(u8 *dest, const u8 *src)
{
    while (*dest != EOS)
        dest++;

    return StringCopy(dest, src);
}

u8 *StringCopyN(u8 *dest, const u8 *src, u8 n)
{
    u16 i;

    for (i = 0; i < n; i++)
        dest[i] = src[i];

    return &dest[n];
}

u8 *StringAppendN(u8 *dest, const u8 *src, u8 n)
{
    while (*dest != EOS)
        dest++;

    return StringCopyN(dest, src, n);
}

u16 StringLength(const u8 *str)
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

#ifdef GERMAN
s32 StringLengthN(const u8 *str, s32 n)
{
    s32 i;

    for (i = 0; i < n && str[i] != EOS; i++)
        ;

    if (i == n)
        i = 0;

    return i;
}
#endif

s32 StringCompare(const u8 *str1, const u8 *str2)
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

s32 StringCompareN(const u8 *str1, const u8 *str2, u32 n)
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
    s32 largestPowerOfTen = sPowersOfTen[n - 1];

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
                c = sDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (digit != 0 || powerOfTen == 1)
        {
            state = WRITING_DIGITS;
            out = dest++;

            if (digit <= 9)
                c = sDigits[digit];
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

u8 *ConvertIntToDecimalStringN_DigitWidth6(u8 *dest, s32 value, enum StringConvertMode mode, u8 n)
{
    enum { WAITING_FOR_NONZERO_DIGIT, WRITING_DIGITS, WRITING_SPACES } state;
    s32 powerOfTen;
    s32 largestPowerOfTen = sPowersOfTen[n - 1];

    *dest++ = EXT_CTRL_CODE_BEGIN;
    *dest++ = 0x14;
    *dest++ = 6;

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
                c = sDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (digit != 0 || powerOfTen == 1)
        {
            state = WRITING_DIGITS;
            out = dest++;

            if (digit <= 9)
                c = sDigits[digit];
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
                c = sDigits[digit];
            else
                c = CHAR_QUESTION_MARK;

            *out = c;
        }
        else if (digit != 0 || powerOfSixteen == 1)
        {
            state = WRITING_DIGITS;
            out = dest++;

            if (digit <= 0xF)
                c = sDigits[digit];
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
        temp[length++] = sDigits[value % 10];
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

u8 *StringExpandPlaceholders(u8 *dest, const u8 *src)
{
    for (;;)
    {
        u8 c = *src++;
        u8 placeholderId;
        const u8 *expandedString;
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

u8 *StringBraille(u8 *dest, const u8 *src)
{
    u8 setBrailleFont[] = { 0xFC, 0x06, 0x06, 0xFF };
    u8 gotoLine2[] = { 0xFE, 0xFC, 0x0E, 0x02, 0xFF };

    dest = StringCopy(dest, setBrailleFont);

    for (;;)
    {
        u8 c = *src++;

        switch (c)
        {
        case EOS:
            *dest = c;
            return dest;
        case 0xFE:
            dest = StringCopy(dest, gotoLine2);
            break;
        default:
            *dest++ = c;
            *dest++ = c + 0x40;
            break;
        }
    }
}

static const u8 *ExpandPlaceholder_UnknownStringVar(void)
{
    return gUnknownStringVar;
}

static const u8 *ExpandPlaceholder_PlayerName(void)
{
    return gSaveBlock2.playerName;
}

static const u8 *ExpandPlaceholder_StringVar1(void)
{
    return gStringVar1;
}

static const u8 *ExpandPlaceholder_StringVar2(void)
{
    return gStringVar2;
}

static const u8 *ExpandPlaceholder_StringVar3(void)
{
    return gStringVar3;
}

static const u8 *ExpandPlaceholder_KunChan(void)
{
    if (gSaveBlock2.playerGender == MALE)
        return gExpandedPlaceholder_Kun;
    else
        return gExpandedPlaceholder_Chan;
}

static const u8 *ExpandPlaceholder_RivalName(void)
{
    if (gSaveBlock2.playerGender == MALE)
        return gExpandedPlaceholder_May;
    else
        return gExpandedPlaceholder_Brendan;
}

#define VERSION_DEPENDENT_PLACEHOLDER_LIST \
    X(Version,       Ruby,    Sapphire)    \
    X(EvilTeam,      Magma,   Aqua)        \
    X(GoodTeam,      Aqua,    Magma)       \
    X(EvilLeader,    Maxie,   Archie)      \
    X(GoodLeader,    Archie,  Maxie)       \
    X(EvilLegendary, Groudon, Kyogre)      \
    X(GoodLegendary, Kyogre,  Groudon)

#ifdef SAPPHIRE
#define X(ph, r, s) \
static const u8 *ExpandPlaceholder_##ph(void) { return gExpandedPlaceholder_##s; }
VERSION_DEPENDENT_PLACEHOLDER_LIST
#else
#define X(ph, r, s) \
static const u8 *ExpandPlaceholder_##ph(void) { return gExpandedPlaceholder_##r; }
VERSION_DEPENDENT_PLACEHOLDER_LIST
#endif

#undef X

const u8 *GetExpandedPlaceholder(u32 id)
{
    typedef const u8 *(*ExpandPlaceholderFunc)(void);

    static const ExpandPlaceholderFunc funcs[] =
    {
        ExpandPlaceholder_UnknownStringVar,
        ExpandPlaceholder_PlayerName,
        ExpandPlaceholder_StringVar1,
        ExpandPlaceholder_StringVar2,
        ExpandPlaceholder_StringVar3,
        ExpandPlaceholder_KunChan,
        ExpandPlaceholder_RivalName,
        ExpandPlaceholder_Version,
        ExpandPlaceholder_EvilTeam,
        ExpandPlaceholder_GoodTeam,
        ExpandPlaceholder_EvilLeader,
        ExpandPlaceholder_GoodLeader,
        ExpandPlaceholder_EvilLegendary,
        ExpandPlaceholder_GoodLegendary,
    };

    if (id >= ARRAY_COUNT(funcs))
        return gExpandedPlaceholder_Empty;
    else
        return funcs[id]();
}

u8 *StringFill(u8 *dest, u8 c, u16 n)
{
    u16 i;

    for (i = 0; i < n; i++)
        *dest++ = c;

    *dest = EOS;
    return dest;
}

u8 *StringCopyPadded(u8 *dest, const u8 *src, u8 c, u16 n)
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
