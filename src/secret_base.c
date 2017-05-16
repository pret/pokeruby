#include "global.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "event_data.h"
#include "vars.h"

extern u8 gUnknown_020387DC;

u8 sub_80BB8A8(void *);

u8 *sub_80BC190(u8 *dest, u8 arg1) { // 80bc190
    u8 local1;
    u8 *str;

    local1 = sub_80BB8A8(gSaveBlock1.secretBases[arg1].sbr_field_2);

    str = StringCopyN(dest, gSaveBlock1.secretBases[arg1].sbr_field_2, local1);
    str[0] = EOS;

    return StringAppend(dest, gOtherText_PlayersBase);
}

u8 *GetSecretBaseMapName(u8 *dest) {
    gUnknown_020387DC = gSaveBlock1.secretBases[VarGet(VAR_0x4054)].sbr_field_0;
    return sub_80BC190(dest, VarGet(VAR_0x4054));
}

void sub_80BC224(void) {
    u8 *var0 = gSaveBlock1.secretBases[(u8)VarGet(VAR_0x4054)].sbr_field_2;
    u8 *var1 = gStringVar1;
    u8 var2 = sub_80BB8A8(var0);
    u8 *var3 = StringCopyN(var1, var0, var2);
    *var3 = EOS;
}

u8 sub_80BC268(u8 foo) { // 80bc268
    if (gSaveBlock1.secretBases[foo].sbr_field_1_6)
        return 1;
    return 0;
}

u8 sub_80BC298(struct Pokemon *mon) { // 80bc298
    u16 evsum = GetMonData(mon, MON_DATA_HP_EV);
    evsum += GetMonData(mon, MON_DATA_ATK_EV);
    evsum += GetMonData(mon, MON_DATA_DEF_EV);
    evsum += GetMonData(mon, MON_DATA_SPD_EV);
    evsum += GetMonData(mon, MON_DATA_SPATK_EV);
    evsum += GetMonData(mon, MON_DATA_SPDEF_EV);
    return (u8)(evsum / 6);
}
