#ifndef GUARD_MAIL_H
#define GUARD_MAIL_H

#include "main.h"

struct MailStruct {
    /*  0x00 */ u16 words[9];
    /*  0x12 */ u8 var12[12];
    /*  0x1E */ u16 var1E;
    /*  0x20 */ u16 var20;
};

void HandleReadMail(struct MailStruct *arg0, MainCallback arg1, bool8 arg2);

#endif // GUARD_MAIL_H
