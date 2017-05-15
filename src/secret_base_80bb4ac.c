#include "global.h"
#include "event_data.h"
#include "asm.h"
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
        VarSet(0x4054, idx);
        break;
    }
}

void sub_80BB63C(void) { // 80bb63c
    if (gSaveBlock1.secretBases[0].sbr_field_0)
        gScriptResult = 1;
    else
        gScriptResult = 0;
}

#ifdef NONMATCHING
u8 sub_80BB66C(void) { // 80bb66c
    s16 x, y;
    u16 v0;
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
#else
__attribute__((naked))
u8 sub_80BB66C(void) {
    asm(".syntax unified\n\
    	push {r4,lr}\n\
    	sub sp, 0x4\n\
    	mov r4, sp\n\
    	adds r4, 0x2\n\
    	mov r0, sp\n\
    	adds r1, r4, 0\n\
    	bl GetXYCoordsOneStepInFrontOfPlayer\n\
    	mov r0, sp\n\
    	movs r1, 0\n\
    	ldrsh r0, [r0, r1]\n\
    	movs r2, 0\n\
    	ldrsh r1, [r4, r2]\n\
    	bl MapGridGetMetatileBehaviorAt\n\
    	adds r1, r0, 0\n\
    	ldr r2, _080BB6A4 @ =0x00000fff\n\
    	adds r0, r2, 0\n\
    	ands r1, r0\n\
    	adds r0, r1, 0\n\
    	subs r0, 0x90\n\
    	lsls r0, 16\n\
    	lsrs r0, 16\n\
    	cmp r0, 0x1\n\
    	bhi _080BB6A8\n\
    	movs r0, 0x1\n\
    	b _080BB702\n\
    	.align 2, 0\n\
    _080BB6A4: .4byte 0x00000fff\n\
    _080BB6A8:\n\
    	adds r0, r1, 0\n\
    	subs r0, 0x92\n\
    	lsls r0, 16\n\
    	lsrs r0, 16\n\
    	cmp r0, 0x1\n\
    	bhi _080BB6B8\n\
    	movs r0, 0x2\n\
    	b _080BB702\n\
    _080BB6B8:\n\
    	adds r0, r1, 0\n\
    	subs r0, 0x9A\n\
    	lsls r0, 16\n\
    	lsrs r0, 16\n\
    	cmp r0, 0x1\n\
    	bhi _080BB6C8\n\
    	movs r0, 0x3\n\
    	b _080BB702\n\
    _080BB6C8:\n\
    	adds r0, r1, 0\n\
    	subs r0, 0x94\n\
    	lsls r0, 16\n\
    	lsrs r0, 16\n\
    	cmp r0, 0x1\n\
    	bhi _080BB6D8\n\
    	movs r0, 0x4\n\
    	b _080BB702\n\
    _080BB6D8:\n\
    	adds r0, r1, 0\n\
    	subs r0, 0x96\n\
    	lsls r0, 16\n\
    	lsrs r0, 16\n\
    	cmp r0, 0x1\n\
    	bls _080BB6EC\n\
    	cmp r1, 0x9C\n\
    	beq _080BB6EC\n\
    	cmp r1, 0x9D\n\
    	bne _080BB6F0\n\
    _080BB6EC:\n\
    	movs r0, 0x5\n\
    	b _080BB702\n\
    _080BB6F0:\n\
    	adds r0, r1, 0\n\
    	subs r0, 0x98\n\
    	lsls r0, 16\n\
    	lsrs r0, 16\n\
    	cmp r0, 0x1\n\
    	bls _080BB700\n\
    	movs r0, 0\n\
    	b _080BB702\n\
    _080BB700:\n\
    	movs r0, 0x6\n\
    _080BB702:\n\
    	add sp, 0x4\n\
    	pop {r4}\n\
    	pop {r1}\n\
    	bx r1\n\
        .syntax divided\n");
}
#endif

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
