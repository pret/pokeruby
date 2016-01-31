#ifndef GUARD_STRING_UTIL_H
#define GUARD_STRING_UTIL_H

enum StringConvertMode
{
    STR_CONV_MODE_LEFT_ALIGN,
    STR_CONV_MODE_RIGHT_ALIGN,
    STR_CONV_MODE_LEADING_ZEROS
};

u8 *StringCopy10(u8 *dest, u8 *src);
u8 *StringGetEnd10(u8 *str);
u8 *StringCopy8(u8 *dest, u8 *src);
u8 *StringCopy(u8 *dest, u8 *src);
u8 *StringAppend(u8 *dest, u8 *src);
u8 *StringCopyN(u8 *dest, u8 *src, u8 n);
u8 *StringAppendN(u8 *dest, u8 *src, u8 n);
u16 StringGetLength(u8 *str);
s32 StringCompare(u8 *str1, u8 *str2);
s32 StringCompareN(u8 *str1, u8 *str2, u32 n);
u8 *ConvertIntToDecimalStringN(u8 *dest, s32 value, enum StringConvertMode mode, u8 n);
u8 *ConvertIntToDecimalStringN_UnknownExtCtrlCode(u8 *dest, s32 value, enum StringConvertMode mode, u8 n);
u8 *ConvertIntToHexStringN(u8 *dest, s32 value, enum StringConvertMode mode, u8 n);
u8 *ConvertIntToDecimalString(u8 *dest, s32 value);
u8 *StringExpandPlaceholders(u8 *dest, u8 *src);
u8 *UnknownStringFunc(u8 *dest, u8 *src);
u8 *StringFill(u8 *dest, u8 c, u16 n);
u8 *StringCopyPadded(u8 *dest, u8 *src, u8 c, u16 n);
u8 *StringFillWithTerminator(u8 *dest, u16 n);

#endif // GUARD_STRING_UTIL_H
