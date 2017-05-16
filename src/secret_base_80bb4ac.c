#include "global.h"
#include "event_data.h"
#include "asm.h"
#include "vars.h"
#include "field_player_avatar.h"

extern u8 gUnknown_020387DC;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8007;
extern u16 gScriptResult;

void sub_80BB4AC(struct SecretBaseRecord *record) { // 080bb4ac
    u16 i;
    u16 j;
    record->sbr_field_0 = 0;
    for (i=0; i<7; i++)
        record->sbr_field_2[i] = 0xff;
    for (i=0; i<4; i++)
        record->trainerId[i] = 0x00;
    record->sbr_field_e = 0;
    record->sbr_field_10 = 0;
    record->sbr_field_11 = 0;
    record->sbr_field_1_0 = 0;
    record->gender = 0;
    record->sbr_field_1_5 = 0;
    record->sbr_field_1_6 = 0;
    for (i=0; i<16; i++) {
        record->decorations[i] = 0;
        record->sbr_field_22[i] = 0;
    }
    for (i=0; i<6; i++) {
        for (j=0; j<4; j++) {
            record->partyMoves[i * 4 + j] = 0;
        }
        record->partyPersonality[i] = 0;
        record->partyEVs[i] = 0;
        record->partySpecies[i] = 0;
        record->partyHeldItems[i] = 0;
        record->partyLevels[i] = 0;
    }
}

void ResetSecretBase(u8 idx) { // 80bb594
    sub_80BB4AC(&(gSaveBlock1.secretBases[idx]));
}

void ResetSecretBases(void) { // 080bb5b4
    u16 i;
    for (i=0; i<20; i++)
        ResetSecretBase(i);
}

void sub_80BB5D0(void) { // 080bb5d0
    gUnknown_020387DC = gSpecialVar_0x8004;
}

void sub_80BB5E4(void) { // 80bb5e4
    u16 idx;
    gScriptResult = 0;
    for (idx=0; idx<20; idx++) {
        if (gUnknown_020387DC != gSaveBlock1.secretBases[idx].sbr_field_0)
            continue;
        gScriptResult = 1;
        VarSet(VAR_0x4054, idx);
        break;
    }
}

void sub_80BB63C(void) { // 80bb63c
    if (gSaveBlock1.secretBases[0].sbr_field_0)
        gScriptResult = 1;
    else
        gScriptResult = 0;
}

u8 sub_80BB66C(void) { // 80bb66c
    s16 x, y;
    s16 v0;
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    v0 = MapGridGetMetatileBehaviorAt(x, y) & 0xFFF;
    if (v0 == 0x90 || v0 == 0x91)
        return 1;
    else if (v0 == 0x92 || v0 == 0x93)
        return 2;
    else if (v0 == 0x9a || v0 == 0x9b)
        return 3;
    else if (v0 == 0x94 || v0 == 0x95)
        return 4;
    else if (v0 == 0x96 || v0 == 0x97 || v0 == 0x9c || v0 == 0x9d)
        return 5;
    else if (v0 == 0x98 || v0 == 0x99)
        return 6;
    return 0;
}

void sub_80BB70C(void) { // 80bb70c
    gSpecialVar_0x8007 = sub_80BB66C();
}

s16 unref_sub_80BB724(u16 *a0, u8 a1) {
    u16 v2;
    for (v2=0; v2<0x200; v2++) {
        if ((a0[v2] & 0xFFF) == a1)
            return (s16)v2;
    }
    return -1;
}

void sub_80BB764(s16 *arg1, s16 *arg2, u16 arg3) {
    s16 x, y;
    for (y=0; y<gMapHeader.mapData->height; y++) {
        for (x=0; x<gMapHeader.mapData->width; x++) {
            if ((gMapHeader.mapData->map[y * gMapHeader.mapData->width + x] & 0x3ff) == arg3) {
                *arg1 = x;
                *arg2 = y;
                return;
            }
        }
    }
}

// void sub_80BB800(void) {
    // s16 x, y;
    // u16 v0, v1;
    // GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    // v1 = MapGridGetMetatileIdAt(x, y);
    // for (v0=0; v0<7; v0++) {
        // if (gUnknown_083D1358[v0] == v1)
    // }
// }
