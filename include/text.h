#ifndef GUARD_TEXT_H
#define GUARD_TEXT_H

#include "global.h"

#define CHAR_SPACE          0x00
#define CHAR_QUESTION_MARK  0xAC
#define CHAR_HYPHEN         0xAE
#define CHAR_COLON          0xF0
#define EXT_CTRL_CODE_BEGIN 0xFC // extended control code
#define PLACEHOLDER_BEGIN   0xFD // string placeholder
#define EOS                 0xFF // end of string

u8 GetExtCtrlCodeLength(u8 code);

#endif // GUARD_TEXT_H
