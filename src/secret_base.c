#include "global.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "event_data.h"

extern u8 gUnknown_020387DC;

u8 sub_80BB8A8(void *);

u8 *sub_80BC190(u8 *dest, u8 arg1) {
    u8 local1;
    u8 *str;

    local1 = sub_80BB8A8(gSaveBlock1.secretBases[arg1].sbr_field_2);

    str = StringCopyN(dest, gSaveBlock1.secretBases[arg1].sbr_field_2, local1);
    str[0] = EOS;

    return StringAppend(dest, gOtherText_PlayersBase);
}

u8 *GetSecretBaseMapName(u8 *dest) {
    gUnknown_020387DC = gSaveBlock1.secretBases[VarGet(0x4054)].sbr_field_0;
    return sub_80BC190(dest, VarGet(0x4054));
}

void sub_80BC224(void) {
    u8 *var0 = gSaveBlock1.secretBases[(u8)VarGet(0x4054)].sbr_field_2;
    u8 *var1 = gStringVar1;
    u8 var2 = sub_80BB8A8(var0);
    u8 *var3 = StringCopyN(var1, var0, var2);
    *var3 = EOS;
}
