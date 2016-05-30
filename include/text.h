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

extern vu16 *const gBGControlRegs[];
extern vu16 *const gBGHOffsetRegs[];
extern vu16 *const gBGVOffsetRegs[];

extern struct WindowConfig gWindowConfig_81E6C3C;
extern struct WindowConfig gWindowConfig_81E6C58;
extern struct WindowConfig gWindowConfig_81E6C74;
extern struct WindowConfig gWindowConfig_81E6C90;
extern struct WindowConfig gWindowConfig_81E6CAC;
extern struct WindowConfig gWindowConfig_81E6CC8;
extern struct WindowConfig gWindowConfig_81E6CE4;
extern struct WindowConfig gWindowConfig_81E6D00;
extern struct WindowConfig gWindowConfig_81E6D1C;
extern struct WindowConfig gWindowConfig_81E6D38;
extern struct WindowConfig gWindowConfig_81E6D54;
extern struct WindowConfig gWindowConfig_81E6D70;
extern struct WindowConfig gWindowConfig_81E6D8C;
extern struct WindowConfig gWindowConfig_81E6DA8;
extern struct WindowConfig gWindowConfig_81E6DC4;
extern struct WindowConfig gWindowConfig_81E6DE0;
extern struct WindowConfig gWindowConfig_81E6DFC;
extern struct WindowConfig gWindowConfig_81E6E18;
extern struct WindowConfig gWindowConfig_81E6E34;
extern struct WindowConfig gWindowConfig_81E6E50;
extern struct WindowConfig gWindowConfig_81E6E6C;
extern struct WindowConfig gWindowConfig_81E6E88;
extern struct WindowConfig gWindowConfig_81E6EA4;
extern struct WindowConfig gWindowConfig_81E6EC0;
extern struct WindowConfig gWindowConfig_81E6EDC;
extern struct WindowConfig gWindowConfig_81E6EF8;
extern struct WindowConfig gWindowConfig_81E6F14;
extern struct WindowConfig gWindowConfig_81E6F30;
extern struct WindowConfig gWindowConfig_81E6F4C;
extern struct WindowConfig gWindowConfig_81E6F68;
extern struct WindowConfig gWindowConfig_81E6F84;
extern struct WindowConfig gWindowConfig_81E6FA0;
extern struct WindowConfig gWindowConfig_81E6FBC;
extern struct WindowConfig gWindowConfig_81E6FD8;
extern struct WindowConfig gWindowConfig_81E6FF4;
extern struct WindowConfig gWindowConfig_81E7010;
extern struct WindowConfig gWindowConfig_81E702C;
extern struct WindowConfig gWindowConfig_81E7048;
extern struct WindowConfig gWindowConfig_81E7064;
extern struct WindowConfig gWindowConfig_81E7080;
extern struct WindowConfig gWindowConfig_81E709C;
extern struct WindowConfig gWindowConfig_81E70B8;
extern struct WindowConfig gWindowConfig_81E70D4;
extern struct WindowConfig gWindowConfig_81E70F0;
extern struct WindowConfig gWindowConfig_81E710C;
extern struct WindowConfig gWindowConfig_81E7128;
extern struct WindowConfig gWindowConfig_81E7144;
extern struct WindowConfig gWindowConfig_81E7160;
extern struct WindowConfig gWindowConfig_81E717C;
extern struct WindowConfig gWindowConfig_81E7198;
extern struct WindowConfig gWindowConfig_81E71B4;
extern struct WindowConfig gWindowConfig_81E71D0;
extern struct WindowConfig gWindowConfig_81E71EC;
extern struct WindowConfig gWindowConfig_81E7208;
extern struct WindowConfig gWindowConfig_81E7224;
extern struct WindowConfig gWindowConfig_81E7240;
extern struct WindowConfig gWindowConfig_81E725C;
extern struct WindowConfig gWindowConfig_81E7278;
extern struct WindowConfig gWindowConfig_81E7294;

u8 GetExtCtrlCodeLength(u8 code);

#endif // GUARD_TEXT_H
