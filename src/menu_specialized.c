#include "global.h"
#include "scanline_effect.h"
#include "pokenav.h"

u8 sub_80F5E20(void);
u8 sub_80F5EE4(void);
u8 sub_80F5FB4(void);
u8 sub_80F6010(void);

/* TODO
// emerald: sub_81D2278
void sub_80F5688(u16 * r6, u16 * r5, u16 * sp0, u8 r9, u16 * r7)
{
    u16 sp04;
    u16 r0;
    u16 r4;
    u16 r10;
    if (r5[1] < sp0[1])
    {
        sp04 = r5[1];
        r4 = r5[0] << 10;
        r0 = sp0[1];
        r10 = sp0[0];
    }
}
*/

NAKED
void sub_80F5688(u16 r6[66][2], struct UnkPokenav11 * r5, struct UnkPokenav11 * sp0, u8 r9, u16 r7[66][2])
{
    asm_unified("\tpush {r4-r7,lr}\n"
                "\tmov r7, r10\n"
                "\tmov r6, r9\n"
                "\tmov r5, r8\n"
                "\tpush {r5-r7}\n"
                "\tsub sp, 0x14\n"
                "\tadds r6, r0, 0\n"
                "\tadds r5, r1, 0\n"
                "\tstr r2, [sp]\n"
                "\tldr r7, [sp, 0x34]\n"
                "\tlsls r3, 24\n"
                "\tlsrs r3, 24\n"
                "\tmov r9, r3\n"
                "\tmovs r0, 0\n"
                "\tstr r0, [sp, 0x8]\n"
                "\tldrh r0, [r5, 0x2]\n"
                "\tldrh r1, [r2, 0x2]\n"
                "\tcmp r0, r1\n"
                "\tbcs _080F56D0\n"
                "\tadds r2, r0, 0\n"
                "\tstr r2, [sp, 0x4]\n"
                "\tldr r3, [sp]\n"
                "\tldrh r0, [r3, 0x2]\n"
                "\tldrh r1, [r5]\n"
                "\tlsls r4, r1, 10\n"
                "\tldrh r2, [r3]\n"
                "\tmov r10, r2\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tsubs r0, r3\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmov r8, r0\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F56FC\n"
                "\tsubs r0, r2, r1\n"
                "\tb _080F56F2\n"
                "_080F56D0:\n"
                "\tldrh r0, [r5, 0x2]\n"
                "\tldr r1, [sp]\n"
                "\tldrh r1, [r1, 0x2]\n"
                "\tstr r1, [sp, 0x4]\n"
                "\tldr r2, [sp]\n"
                "\tldrh r1, [r2]\n"
                "\tlsls r4, r1, 10\n"
                "\tldrh r3, [r5]\n"
                "\tmov r10, r3\n"
                "\tldr r2, [sp, 0x4]\n"
                "\tsubs r0, r2\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmov r8, r0\n"
                "\tcmp r0, 0\n"
                "\tbeq _080F56FC\n"
                "\tsubs r0, r3, r1\n"
                "_080F56F2:\n"
                "\tlsls r0, 10\n"
                "\tmov r1, r8\n"
                "\tbl __divsi3\n"
                "\tstr r0, [sp, 0x8]\n"
                "_080F56FC:\n"
                "\tmov r0, r8\n"
                "\tadds r0, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r0, 16\n"
                "\tmov r8, r0\n"
                "\tcmp r7, 0\n"
                "\tbne _080F5746\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r6, r0\n"
                "\tmovs r5, 0\n"
                "\tmov r3, r9\n"
                "\tlsls r3, 1\n"
                "\tmov r12, r3\n"
                "\tmov r0, r10\n"
                "\tadd r0, r9\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tcmp r7, r8\n"
                "\tbcs _080F57D4\n"
                "\tmovs r7, 0x1\n"
                "_080F5726:\n"
                "\tadds r2, r3, r6\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tands r0, r7\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r2]\n"
                "\tldr r1, [sp, 0x8]\n"
                "\tadds r4, r1\n"
                "\tadds r6, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcc _080F5726\n"
                "\tb _080F57D4\n"
                "_080F5746:\n"
                "\tldr r2, [sp, 0x8]\n"
                "\tcmp r2, 0\n"
                "\tble _080F57E4\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r7, r0\n"
                "\tmovs r5, 0\n"
                "\tmov r3, r9\n"
                "\tlsls r3, 1\n"
                "\tmov r12, r3\n"
                "\tmov r0, r10\n"
                "\tadd r0, r9\n"
                "\tstr r0, [sp, 0xC]\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F5798\n"
                "\tldr r0, _080F57D8 @ =0x00026bff\n"
                "\tcmp r4, r0\n"
                "\tbgt _080F5798\n"
                "\tmov r1, r12\n"
                "\tstr r1, [sp, 0x10]\n"
                "\tmov r10, r0\n"
                "_080F5772:\n"
                "\tldr r3, [sp, 0x10]\n"
                "\tadds r2, r3, r7\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tmovs r3, 0x1\n"
                "\tands r0, r3\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r2]\n"
                "\tldr r0, [sp, 0x8]\n"
                "\tadds r4, r0\n"
                "\tadds r7, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F5798\n"
                "\tcmp r4, r10\n"
                "\tble _080F5772\n"
                "_080F5798:\n"
                "\tldr r1, _080F57DC @ =gPokenavStructPtr\n"
                "\tldr r0, [r1]\n"
                "\tldr r2, [sp, 0x4]\n"
                "\tadds r1, r2, r5\n"
                "\tldr r3, _080F57E0 @ =0x00009340\n"
                "\tadds r0, r3\n"
                "\tstrh r1, [r0]\n"
                "\tldrh r0, [r0]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r6, r0\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F57D4\n"
                "\tmov r3, r12\n"
                "\tmovs r7, 0x1\n"
                "_080F57B6:\n"
                "\tadds r2, r3, r6\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tands r0, r7\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r2]\n"
                "\tldr r0, [sp, 0x8]\n"
                "\tadds r4, r0\n"
                "\tadds r6, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcc _080F57B6\n"
                "_080F57D4:\n"
                "\tsubs r0, r6, 0x4\n"
                "\tb _080F58C4\n"
                "\t.align 2, 0\n"
                "_080F57D8: .4byte 0x00026bff\n"
                "_080F57DC: .4byte gPokenavStructPtr\n"
                "_080F57E0: .4byte 0x00009340\n"
                "_080F57E4:\n"
                "\tldr r1, [sp, 0x8]\n"
                "\tcmp r1, 0\n"
                "\tbge _080F5890\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r6, r0\n"
                "\tmovs r5, 0\n"
                "\tmov r2, r9\n"
                "\tlsls r2, 1\n"
                "\tmov r12, r2\n"
                "\tmov r3, r10\n"
                "\tadd r3, r9\n"
                "\tstr r3, [sp, 0xC]\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F5842\n"
                "\tadds r3, r2, r6\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tmovs r2, 0x1\n"
                "\tands r0, r2\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r3]\n"
                "\tb _080F5838\n"
                "_080F5816:\n"
                "\tldr r0, [sp, 0x8]\n"
                "\tadds r4, r0\n"
                "\tadds r6, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F5842\n"
                "\tmov r1, r12\n"
                "\tadds r3, r1, r6\n"
                "\tasrs r2, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tmovs r1, 0x1\n"
                "\tands r0, r1\n"
                "\tadds r2, r0\n"
                "\tadd r2, r9\n"
                "\tstrh r2, [r3]\n"
                "_080F5838:\n"
                "\tldr r0, _080F5884 @ =0x00026bff\n"
                "\tcmp r4, r0\n"
                "\tbgt _080F5816\n"
                "\tmovs r0, 0x9B\n"
                "\tstrh r0, [r3]\n"
                "_080F5842:\n"
                "\tldr r2, _080F5888 @ =gPokenavStructPtr\n"
                "\tldr r0, [r2]\n"
                "\tldr r3, [sp, 0x4]\n"
                "\tadds r1, r3, r5\n"
                "\tldr r2, _080F588C @ =0x00009340\n"
                "\tadds r0, r2\n"
                "\tstrh r1, [r0]\n"
                "\tldrh r0, [r0]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r7, r0\n"
                "\tcmp r5, r8\n"
                "\tbcs _080F587E\n"
                "\tmov r3, r12\n"
                "\tmovs r6, 0x1\n"
                "_080F5860:\n"
                "\tadds r2, r3, r7\n"
                "\tasrs r1, r4, 10\n"
                "\tasrs r0, r4, 9\n"
                "\tands r0, r6\n"
                "\tadds r1, r0\n"
                "\tadd r1, r9\n"
                "\tstrh r1, [r2]\n"
                "\tldr r0, [sp, 0x8]\n"
                "\tadds r4, r0\n"
                "\tadds r7, 0x4\n"
                "\tadds r0, r5, 0x1\n"
                "\tlsls r0, 16\n"
                "\tlsrs r5, r0, 16\n"
                "\tcmp r5, r8\n"
                "\tbcc _080F5860\n"
                "_080F587E:\n"
                "\tsubs r0, r7, 0x4\n"
                "\tb _080F58C4\n"
                "\t.align 2, 0\n"
                "_080F5884: .4byte 0x00026bff\n"
                "_080F5888: .4byte gPokenavStructPtr\n"
                "_080F588C: .4byte 0x00009340\n"
                "_080F5890:\n"
                "\tldr r0, _080F58BC @ =gPokenavStructPtr\n"
                "\tldr r0, [r0]\n"
                "\tldr r1, _080F58C0 @ =0x00009340\n"
                "\tadds r0, r1\n"
                "\tmov r2, sp\n"
                "\tldrh r2, [r2, 0x4]\n"
                "\tstrh r2, [r0]\n"
                "\tldr r0, [sp, 0x4]\n"
                "\tsubs r0, 0x38\n"
                "\tlsls r0, 2\n"
                "\tadds r6, r0\n"
                "\tadds r7, r0\n"
                "\tldrh r0, [r5]\n"
                "\tadds r0, 0x1\n"
                "\tstrh r0, [r6, 0x2]\n"
                "\tldr r3, [sp]\n"
                "\tldrh r0, [r3]\n"
                "\tstrh r0, [r7]\n"
                "\tmovs r0, 0x9B\n"
                "\tstrh r0, [r7, 0x2]\n"
                "\tb _080F58CC\n"
                "\t.align 2, 0\n"
                "_080F58BC: .4byte gPokenavStructPtr\n"
                "_080F58C0: .4byte 0x00009340\n"
                "_080F58C4:\n"
                "\tadd r0, r12\n"
                "\tmov r1, sp\n"
                "\tldrh r1, [r1, 0xC]\n"
                "\tstrh r1, [r0]\n"
                "_080F58CC:\n"
                "\tadd sp, 0x14\n"
                "\tpop {r3-r5}\n"
                "\tmov r8, r3\n"
                "\tmov r9, r4\n"
                "\tmov r10, r5\n"
                "\tpop {r4-r7}\n"
                "\tpop {r0}\n"
                "\tbx r0");
}

void sub_80F58DC(struct UnkPokenav11 * a0)
{
    u16 i, r6, varMax;

    if (a0[0].unk2 < a0[1].unk2)
    {
        r6 = a0[0].unk2;
        sub_80F5688(gPokenavStructPtr->unk9130, &a0[0], &a0[1], 1, NULL);
    }
    else
    {
        r6 = a0[1].unk2;
        sub_80F5688(gPokenavStructPtr->unk9130, &a0[1], &a0[0], 0, NULL);
    }
    sub_80F5688(gPokenavStructPtr->unk9130, &a0[1], &a0[2], 1, NULL);

    i = a0[2].unk2 <= a0[3].unk2;
    sub_80F5688(gPokenavStructPtr->unk9130, &a0[2], &a0[3], i, gPokenavStructPtr->unk9238);
    for (i = 56; i < r6; i++)
    {
        gPokenavStructPtr->unk9130[i - 56][0] = 0;
        gPokenavStructPtr->unk9130[i - 56][1] = 0;
    }

    for (i = a0[0].unk2; i <= gPokenavStructPtr->unk9340; i++)
        gPokenavStructPtr->unk9130[i - 56][0] = 155;

    varMax = max(gPokenavStructPtr->unk9340, a0[2].unk2);
    for (i = varMax + 1; i < 122; i++)
    {
        gPokenavStructPtr->unk9130[i - 56][0] = 0;
        gPokenavStructPtr->unk9130[i - 56][1] = 0;
    }

//    for (i = 56; i < 122; i++)
//    {
//        if (gPokenavStructPtr->unk9130[i - 56][0] == 0 && gPokenavStructPtr->unk9130[i - 56][1] != 0)
//            gPokenavStructPtr->unk9130[i - 56][0] = 155;
//    }
}

void sub_80F5A1C(struct UnkPokenav11 *arg0)
{
    u16 i, r6, varMax;

    if (arg0[0].unk2 < arg0[4].unk2)
    {
        r6 = arg0[0].unk2;
        sub_80F5688(gPokenavStructPtr->unk9238, &arg0[0], &arg0[4], 0, NULL);
    }
    else
    {
        r6 = arg0[4].unk2;
        sub_80F5688(gPokenavStructPtr->unk9238, &arg0[4], &arg0[0], 1, NULL);
    }

    sub_80F5688(gPokenavStructPtr->unk9238, &arg0[4], &arg0[3], 0, NULL);

    for (i = 56; i < r6; i++)
    {
        gPokenavStructPtr->unk9238[i - 56][0] = 0;
        gPokenavStructPtr->unk9238[i - 56][1] = 0;
    }

    for (i = arg0[0].unk2; i <= gPokenavStructPtr->unk9340; i++)
        gPokenavStructPtr->unk9238[i - 56][1] = 155;

    varMax = max(gPokenavStructPtr->unk9340, arg0[3].unk2 + 1);
    for (i = varMax; i < 122; i++)
    {
        gPokenavStructPtr->unk9238[i - 56][0] = 0;
        gPokenavStructPtr->unk9238[i - 56][1] = 0;
    }

//    for (i = 0; i < 66; i++)
//    {
//        if (gPokenavStructPtr->unk9238[i][0] >= gPokenavStructPtr->unk9238[i][1])
//        {
//            gPokenavStructPtr->unk9238[i][1] = 0;
//            gPokenavStructPtr->unk9238[i][0] = 0;
//        }
//    }
}

void sub_80F5B38(void)
{
    gPokenavStructPtr->unk9345 = 0;
}

extern const struct ScanlineEffectParams gUnknown_083E4990;

bool8 sub_80F5B50(void)
{
    s32 i;
    struct ScanlineEffectParams params;

    switch (gPokenavStructPtr->unk9345)
    {
    case 0:
        ScanlineEffect_Clear();
        for (i = 0; i < 16; i++)
        {
            gScanlineEffectRegBuffers[0][16 + 2 * i] = 0xEF;
            gScanlineEffectRegBuffers[0][17 + 2 * i] = 0xEF;
            gScanlineEffectRegBuffers[1][16 + 2 * i] = 0xEF;
            gScanlineEffectRegBuffers[1][17 + 2 * i] = 0xEF;
        }
        gPokenavStructPtr->unk9345++;
        return TRUE;
    case 1:
        params = gUnknown_083E4990;
        ScanlineEffect_SetParams(params);
        gPokenavStructPtr->unk9345++;
        break;
    }
    return FALSE;
}

void sub_80F5BDC(void)
{
    gScanlineEffect.state = 3;
    ScanlineEffect_InitHBlankDmaTransfer();
}

void sub_80F5BF0(void)
{
    u16 i;

    if (gPokenavStructPtr->unk9344)
    {
        sub_80F58DC(gPokenavStructPtr->unk911C);
        sub_80F5A1C(gPokenavStructPtr->unk911C);
        for (i = 0; i < 66; i++)
        {
            gScanlineEffectRegBuffers[1][(i + 55) * 2 + 0] = gScanlineEffectRegBuffers[0][(i + 55) * 2 + 0] = (gPokenavStructPtr->unk9130[i][0] << 8) | (gPokenavStructPtr->unk9130[i][1]);
            gScanlineEffectRegBuffers[1][(i + 55) * 2 + 1] = gScanlineEffectRegBuffers[0][(i + 55) * 2 + 1] = (gPokenavStructPtr->unk9238[i][0] << 8) | (gPokenavStructPtr->unk9238[i][1]);
        }
        gPokenavStructPtr->unk9344 = 0;
    }
}

void sub_80F5CDC(u8 a0)
{
    u16 i, r5;

    if (gPokenavStructPtr->unk9344)
    {
        sub_80F58DC(gPokenavStructPtr->unk911C);
        sub_80F5A1C(gPokenavStructPtr->unk911C);
        r5 = 2 * (55 - a0);
        for (i = 0; i < 66; i ++)
        {
            gScanlineEffectRegBuffers[1][r5 + 0] = gScanlineEffectRegBuffers[0][r5 + 0] = (gPokenavStructPtr->unk9130[i][0] << 8) | (gPokenavStructPtr->unk9130[i][1]);
            gScanlineEffectRegBuffers[1][r5 + 1] = gScanlineEffectRegBuffers[0][r5 + 1] = (gPokenavStructPtr->unk9238[i][0] << 8) | (gPokenavStructPtr->unk9238[i][1]);
            r5 += 2;
        }
        gPokenavStructPtr->unk9344 = 0;
    }
}

u8 sub_80F5DD4(void)
{
    if (({gMain.newAndRepeatedKeys & DPAD_UP;}))
    {
        return sub_80F5E20();
    }
    else if (({gMain.newAndRepeatedKeys & DPAD_DOWN;}))
    {
        return sub_80F5EE4();
    }
    else if (({gMain.newAndRepeatedKeys & DPAD_LEFT;}))
    {
        return sub_80F5FB4();
    }
    else if (({gMain.newAndRepeatedKeys & DPAD_RIGHT;}))
    {
        return sub_80F6010();
    }
    else
    {
        return 0;
    }
}

u8 sub_80F5E20(void)
{
    if (gPokenavStructPtr->unk876E == 0)
    {
        return 0;
    }
    if (gPokenavStructPtr->unk87C9 != 0 && gPokenavStructPtr->unk876C == 0)
    {
        sub_80F063C(-1);
        sub_80F6074(-1);
        return 2;
    }
    gPokenavStructPtr->unk876C--;
    if (gPokenavStructPtr->unk87C9 == 0 && gPokenavStructPtr->unk876C < 0)
    {
        gPokenavStructPtr->unk876C = gPokenavStructPtr->unk8772;
    }
    gPokenavStructPtr->unk876E = gPokenavStructPtr->unk8770 + gPokenavStructPtr->unk876C;
    if (gPokenavStructPtr->unk876E > gPokenavStructPtr->unk8774)
    {
        gPokenavStructPtr->unk876E -= gPokenavStructPtr->unk8774 + 1;
    }
    return 1;
}

