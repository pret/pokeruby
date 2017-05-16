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

#ifdef NONMATCHING
void sub_80BB764(s16 *arg1, s16 *arg2, u16 arg3) {
    s16 height = gMapHeader.mapData->height;
    s16 width = gMapHeader.mapData->width;
    s16 x;
    s16 y;
    u16 *row;
    for (y=0; y<height; y++) {
        row = &(gMapHeader.mapData->map[y * width]);
        for (x=0; x<width; x++) {
            if ((row[x] & 0x3ff) == arg3) {
                *arg1 = x;
                *arg2 = y;
                return;
            }
        }
    }
}
#else
__attribute__((naked))
void sub_80BB764(s16 *arg1, s16 *arg2, u16 arg3) {
    asm(".syntax unified\n\
        push {r4-r7,lr}\n\
        mov r7, r10\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5-r7}\n\
        sub sp, 0x8\n\
        mov r9, r0\n\
        mov r10, r1\n\
        lsls r2, 16\n\
        lsrs r2, 16\n\
        mov r8, r2\n\
        movs r0, 0\n\
        mov r12, r0\n\
        ldr r1, _080BB7C8 @ =gMapHeader\n\
        ldr r0, [r1]\n\
        ldr r3, [r0, 0x4]\n\
        cmp r12, r3\n\
        bge _080BB7EE\n\
        ldr r0, [r0]\n\
        str r0, [sp, 0x4]\n\
        str r3, [sp]\n\
    _080BB78E:\n\
        movs r2, 0\n\
        mov r1, r12\n\
        lsls r7, r1, 16\n\
        ldr r0, [sp, 0x4]\n\
        cmp r2, r0\n\
        bge _080BB7DC\n\
        ldr r0, _080BB7C8 @ =gMapHeader\n\
        ldr r1, [r0]\n\
        asrs r0, r7, 16\n\
        ldr r4, [r1]\n\
        adds r6, r0, 0\n\
        muls r6, r4\n\
        ldr r5, [r1, 0xC]\n\
    _080BB7A8:\n\
        lsls r0, r2, 16\n\
        asrs r3, r0, 16\n\
        adds r0, r6, r3\n\
        lsls r0, 1\n\
        adds r0, r5\n\
        ldrh r1, [r0]\n\
        ldr r0, _080BB7CC @ =0x000003ff\n\
        ands r0, r1\n\
        cmp r0, r8\n\
        bne _080BB7D0\n\
        mov r1, r9\n\
        strh r2, [r1]\n\
        mov r1, r12\n\
        mov r0, r10\n\
        strh r1, [r0]\n\
        b _080BB7EE\n\
        .align 2, 0\n\
    _080BB7C8: .4byte gMapHeader\n\
    _080BB7CC: .4byte 0x000003ff\n\
    _080BB7D0:\n\
        adds r0, r3, 0x1\n\
        lsls r0, 16\n\
        lsrs r2, r0, 16\n\
        asrs r0, 16\n\
        cmp r0, r4\n\
        blt _080BB7A8\n\
    _080BB7DC:\n\
        movs r1, 0x80\n\
        lsls r1, 9\n\
        adds r0, r7, r1\n\
        lsrs r1, r0, 16\n\
        mov r12, r1\n\
        asrs r0, 16\n\
        ldr r1, [sp]\n\
        cmp r0, r1\n\
        blt _080BB78E\n\
    _080BB7EE:\n\
        add sp, 0x8\n\
        pop {r3-r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov r10, r5\n\
        pop {r4-r7}\n\
        pop {r0}\n\
        bx r0\n\
    .syntax divided\n");
}
#endif
