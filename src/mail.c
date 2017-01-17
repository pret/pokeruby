#include "global.h"
#include "mail.h"
#include "asm.h"
#include "items.h"
#include "menu.h"
#include "palette.h"
#include "rom4.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

struct UnkMailStruct
{
    u8 unk_0_0:2;
    u8 unk_0_2:2;
    u8 unk_0_4:4;
};

struct MailLayout {
    u8 var0;
    u8 var1;
    u8 var2;
    u8 var3_0:4;
    u8 var3_4:4;
    struct UnkMailStruct *var4;
};

struct Unk2000000 {
    /*  0x00 */ u8 words[8][27];
    /*  0xEC */ u8 varD8[20];
    /*  0xEC */ MainCallback varEC;
    /*  0xF0 */ MainCallback varF0;
    /*  0xFF */ struct MailStruct *varF4;
    /*  0xF8 */ u8 varF8;
    /*  0xF9 */ u8 varF9;
    /*  0xFA */ u8 varFA;
    /*  0xFB */ u8 varFB;
    /*  0xFC */ u8 varFC;
    u8 padFD[1];
    /*  0xFE */ u8 varFE;
    /*  0xFF */ u8 varFF;
    /* 0x100 */ u8 var100;
    u8 pad101[3];
    /* 0x104 */ MainCallback var104;
    /* 0x108 */ MainCallback var108;
    /* 0x10C */ struct MailLayout *var10C;
};

struct MailGraphics {
    u16 (*palette)[];
    u8 (*tiles)[];
    u8 (*tileMap)[];
    u16 var0C;
    u16 var0E;
    u16 color10;
    u16 color12;
};

extern struct Unk2000000 unk_2000000;
extern struct MailGraphics gMailGraphicsTable[];
extern u16 gUnknown_083E562C[][2];

extern struct MailLayout gUnknown_083E5730[];
extern struct MailLayout gUnknown_083E57A4[];

extern u8 gOtherText_From[];

static u8 sub_80F8A28(void);
// static void sub_80F8D50(void);
// static u8 *sub_80F8D7C(u8 *dest, u8 *src);
static void sub_80F8DA0(void);
static void sub_80F8E80(void);
static void sub_80F8F18(void);
static void sub_80F8F2C(void);
static void sub_80F8F58(void);
static void sub_80F8F78(void);
static void sub_80F8FB4(void);

#ifdef NONMATCHING
void HandleReadMail(struct MailStruct *arg0, MainCallback arg1, bool8 arg2) {
    u16 mailDesign;
    u8 buffer[4];
    u8 local1;

    unk_2000000.varFF = GAME_LANGUAGE;

    // Compiler uses [sub 1], while asm uses [ptr + FE]
    unk_2000000.varFE = 1;
    unk_2000000.var104 = (MainCallback) sub_80EB3FC;
    unk_2000000.var108 = (MainCallback) ConvertEasyChatWordsToString;

    mailDesign = arg0->itemId - ITEM_ORANGE_MAIL;

    if (mailDesign <= 11) {
        unk_2000000.varFA = arg0->itemId - ITEM_ORANGE_MAIL;
    } else {
        unk_2000000.varFA = 0;
        arg2 = FALSE;
    }

    switch (unk_2000000.var100) {
        case 0:
        default:
            unk_2000000.var10C = &gUnknown_083E5730[unk_2000000.varFA];
            break;

        case 1:
            unk_2000000.var10C = &gUnknown_083E57A4[unk_2000000.varFA];
            break;
    }

    if (((sub_80A2D64(arg0->species, buffer) << 16) +0xFFFF0000) <= (410 << 16)) {
        switch (unk_2000000.varFA) {
            case 6:
                unk_2000000.varFB = 1;
                break;

            case 9:
                unk_2000000.varFB = 2;
                break;

            default:
                unk_2000000.varFB = 0;
                break;
        }
    } else {
        unk_2000000.varFB = 0;
    }


    unk_2000000.varF4 = arg0;
    unk_2000000.varEC = arg1;
    unk_2000000.varF8 = arg2;

    SetMainCallback2(sub_80F8D50);
}
#else
__attribute__((naked))
void HandleReadMail(struct MailStruct *arg0, MainCallback arg1, bool8 arg2) {
    asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	sub sp, 0x4\n\
	adds r4, r0, 0\n\
	adds r6, r1, 0\n\
	lsls r2, 24\n\
	lsrs r5, r2, 24\n\
	ldr r2, _080F8958 @ =0x02000000\n\
	adds r1, r2, 0\n\
	adds r1, 0xFF\n\
	movs r0, 0x5\n\
	strb r0, [r1]\n\
	adds r0, 0xFB\n\
	adds r1, r2, r0\n\
	movs r0, 0x1\n\
	strb r0, [r1]\n\
	movs r0, 0x82\n\
	lsls r0, 1\n\
	adds r1, r2, r0\n\
	ldr r0, _080F895C @ =sub_80EB3FC\n\
	str r0, [r1]\n\
	movs r0, 0x84\n\
	lsls r0, 1\n\
	adds r1, r2, r0\n\
	ldr r0, _080F8960 @ =ConvertEasyChatWordsToString\n\
	str r0, [r1]\n\
	ldrh r1, [r4, 0x20]\n\
	adds r0, r1, 0\n\
	subs r0, 0x79\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	cmp r0, 0xB\n\
	bhi _080F8964\n\
	subs r1, 0x79\n\
	adds r0, r2, 0\n\
	adds r0, 0xFA\n\
	strb r1, [r0]\n\
	b _080F896E\n\
	.align 2, 0\n\
_080F8958: .4byte 0x02000000\n\
_080F895C: .4byte sub_80EB3FC\n\
_080F8960: .4byte ConvertEasyChatWordsToString\n\
_080F8964:\n\
	adds r1, r2, 0\n\
	adds r1, 0xFA\n\
	movs r0, 0\n\
	strb r0, [r1]\n\
	movs r5, 0\n\
_080F896E:\n\
	ldr r1, _080F8994 @ =0x02000000\n\
	movs r2, 0x80\n\
	lsls r2, 1\n\
	adds r0, r1, r2\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _080F8980\n\
	cmp r0, 0x1\n\
	beq _080F899C\n\
_080F8980:\n\
	movs r0, 0x86\n\
	lsls r0, 1\n\
	adds r2, r1, r0\n\
	adds r0, r1, 0\n\
	adds r0, 0xFA\n\
	ldrb r0, [r0]\n\
	lsls r0, 3\n\
	ldr r1, _080F8998 @ =gUnknown_083E5730\n\
	b _080F89AC\n\
	.align 2, 0\n\
_080F8994: .4byte 0x02000000\n\
_080F8998: .4byte gUnknown_083E5730\n\
_080F899C:\n\
	movs r0, 0x86\n\
	lsls r0, 1\n\
	adds r2, r1, r0\n\
	adds r0, r1, 0\n\
	adds r0, 0xFA\n\
	ldrb r0, [r0]\n\
	lsls r0, 3\n\
	ldr r1, _080F89DC @ =gUnknown_083E57A4\n\
_080F89AC:\n\
	adds r0, r1\n\
	str r0, [r2]\n\
	ldrh r0, [r4, 0x1E]\n\
	mov r1, sp\n\
	bl sub_80A2D64\n\
	lsls r0, 16\n\
	ldr r1, _080F89E0 @ =0xffff0000\n\
	adds r0, r1\n\
	movs r1, 0xCD\n\
	lsls r1, 17\n\
	cmp r0, r1\n\
	bhi _080F89F8\n\
	ldr r0, _080F89E4 @ =0x02000000\n\
	adds r1, r0, 0\n\
	adds r1, 0xFA\n\
	ldrb r2, [r1]\n\
	adds r1, r0, 0\n\
	cmp r2, 0x6\n\
	beq _080F89E8\n\
	cmp r2, 0x9\n\
	beq _080F89F0\n\
	b _080F89FA\n\
	.align 2, 0\n\
_080F89DC: .4byte gUnknown_083E57A4\n\
_080F89E0: .4byte 0xffff0000\n\
_080F89E4: .4byte 0x02000000\n\
_080F89E8:\n\
	adds r2, r1, 0\n\
	adds r2, 0xFB\n\
	movs r0, 0x1\n\
	b _080F8A00\n\
_080F89F0:\n\
	adds r2, r1, 0\n\
	adds r2, 0xFB\n\
	movs r0, 0x2\n\
	b _080F8A00\n\
_080F89F8:\n\
	ldr r1, _080F8A20 @ =0x02000000\n\
_080F89FA:\n\
	adds r2, r1, 0\n\
	adds r2, 0xFB\n\
	movs r0, 0\n\
_080F8A00:\n\
	strb r0, [r2]\n\
	adds r0, r1, 0\n\
	adds r0, 0xF4\n\
	str r4, [r0]\n\
	subs r0, 0x8\n\
	str r6, [r0]\n\
	adds r0, 0xC\n\
	strb r5, [r0]\n\
	ldr r0, _080F8A24 @ =sub_80F8D50\n\
	bl SetMainCallback2\n\
	add sp, 0x4\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080F8A20: .4byte 0x02000000\n\
_080F8A24: .4byte sub_80F8D50\n\
    .syntax divided\n");
}

#endif

#define RETURN_UP_STATE break
#define RETURN_SKIP_STATE return FALSE

static u8 sub_80F8A28(void) {
    switch (gMain.state) {
        case 0:
            SetVBlankCallback(NULL);
            remove_some_task();
            REG_DISPCNT = 0;
            RETURN_UP_STATE;

        case 1: CpuFill16(0, (void *) OAM, OAM_SIZE);
            RETURN_UP_STATE;

        case 2:
            ResetPaletteFade();
            RETURN_UP_STATE;

        case 3:
            ResetTasks();
            RETURN_UP_STATE;

        case 4:
            ResetSpriteData();
            RETURN_UP_STATE;

        case 5:
            FreeAllSpritePalettes();
            REG_BG0HOFS = 0;
            REG_BG0VOFS = 0;
            REG_BG1HOFS = 0;
            REG_BG1VOFS = 0;
            REG_BG2VOFS = 0;
            REG_BG2HOFS = 0;
            REG_BG3HOFS = 0;
            REG_BG3VOFS = 0;
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            RETURN_UP_STATE;

        case 6:
            SetUpWindowConfig(&gWindowConfig_81E6DFC);
            RETURN_UP_STATE;

        case 7:
            MultistepInitMenuWindowBegin(&gWindowConfig_81E6DFC);
            RETURN_UP_STATE;

        case 8:
            if (MultistepInitMenuWindowContinue() == 0) {
                return FALSE;
            }
            RETURN_UP_STATE;

        case 9:
            MenuZeroFillScreen();
            RETURN_UP_STATE;

        case 10: CpuFill16(1, (void *) (VRAM + 0x4800), 0x800);
            RETURN_UP_STATE;

        case 11:
            LoadPalette(gMailGraphicsTable[unk_2000000.varFA].palette, 0, 16 * 2);
            RETURN_UP_STATE;

        case 12:
            LZ77UnCompVram(gMailGraphicsTable[unk_2000000.varFA].tileMap, (void *) (VRAM + 0x4000));
            RETURN_UP_STATE;

        case 13:
            LZ77UnCompVram(gMailGraphicsTable[unk_2000000.varFA].tiles, (void *) (VRAM));

            gPlttBufferUnfaded[241] = gMailGraphicsTable[unk_2000000.varFA].color10;
            gPlttBufferUnfaded[248] = gMailGraphicsTable[unk_2000000.varFA].color12;
            gPlttBufferUnfaded[10] = gUnknown_083E562C[gSaveBlock2.playerGender][0];
            gPlttBufferUnfaded[11] = gUnknown_083E562C[gSaveBlock2.playerGender][1];
            RETURN_UP_STATE;

        case 14:
            if (unk_2000000.varF8 != 0) {
                sub_80F8DA0();
            }
            RETURN_UP_STATE;

        case 15:
            if (unk_2000000.varF8 != 0) {
                sub_80F8E80();
            }

            SetVBlankCallback(sub_80F8F18);
            gPaletteFade.bufferTransferDisabled = 1;
            RETURN_UP_STATE;

        case 16: {
            u16 local1;

            local1 = sub_809D4A8(unk_2000000.varF4->species);

            switch (unk_2000000.varFB) {
                case 1:
                    sub_809D580(local1);
                    unk_2000000.varFC = sub_809D3A4(local1, SpriteCallbackDummy, 96, 128, 0);
                    break;

                case 2:
                    sub_809D580(local1);
                    unk_2000000.varFC = sub_809D3A4(local1, SpriteCallbackDummy, 40, 128, 0);
                    break;
            }
            RETURN_UP_STATE;
        }

        case 17:
            if (sub_8055870() != TRUE) {
                RETURN_UP_STATE;
            }
            RETURN_SKIP_STATE;

        case 18:
            REG_BG0CNT = 0x9F08;
            REG_BG1CNT = 0x0801;
            REG_BG2CNT = 0x0902;
            REG_BLDCNT = 0;
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gPaletteFade.bufferTransferDisabled = 0;
            unk_2000000.varF0 = sub_80F8F58;
            return TRUE;

        default:
            return FALSE;
    }

    gMain.state += 1;
    return FALSE;
}

void sub_80F8D50(void) {
    do {
        if (sub_80F8A28() == 1) {
            SetMainCallback2(sub_80F8F2C);
            return;
        }
    } while (sub_80F9344() != 1);
}

u8 *sub_80F8D7C(u8 *dest, u8 *src) {
    u16 length;

    StringCopy(dest, src);
    SanitizeNameString(dest);

    length = StringLength(dest);

    return dest + length;
}

#ifdef NONMATCHING
static void sub_80F8DA0(void) {
    u8 local0;

    local0 = unk_2000000.var10C->var0;

    // No idea what's happening in this loop.
    if (local0 <= 0) {
        u8 i;
        u8 i2 = 0;

        for (i = 0; i < unk_2000000.var10C->var0; i++) {
            ConvertEasyChatWordsToString(unk_2000000.words[i], &unk_2000000.varF4->words[i2],
                                         ((*unk_2000000.var10C->var4)[i] << 28) >> 30, 1);
            i2 += ((*unk_2000000.var10C->var4)[i] << 28) >> 30;
        }
    }

    if (unk_2000000.var100 == 0) {
        u8 *ptr;
        u16 length;

        ptr = sub_80F8D7C(unk_2000000.varD8, unk_2000000.varF4->playerName);
        StringCopy(ptr, gOtherText_From);

        length = StringLength(unk_2000000.varD8);

        unk_2000000.varF9 = unk_2000000.var10C->var2 - length;
    } else {
        u8 *ptr;

        ptr = StringCopy(unk_2000000.varD8, gOtherText_From);
        sub_80F8D7C(ptr, unk_2000000.varF4->playerName);

        unk_2000000.varF9 = unk_2000000.var10C->var2;
    }
}
#else
__attribute__((naked))
static void sub_80F8DA0(void) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r8\n\
	push {r7}\n\
	movs r6, 0\n\
	movs r5, 0\n\
	ldr r2, _080F91EC @ =0x02000000\n\
	movs r0, 0x86\n\
	lsls r0, 1\n\
	adds r1, r2, r0\n\
	ldr r0, [r1]\n\
	ldrb r0, [r0]\n\
	cmp r5, r0\n\
	bcs _080F91B4\n\
	mov r8, r2\n\
	adds r7, r1, 0\n\
_080F916E:\n\
	lsls r0, r5, 3\n\
	subs r0, r5\n\
	lsls r0, 2\n\
	subs r0, r5\n\
	add r0, r8\n\
	mov r1, r8\n\
	adds r1, 0xF4\n\
	lsls r2, r6, 1\n\
	ldr r1, [r1]\n\
	adds r1, r2\n\
	ldr r2, [r7]\n\
	ldr r2, [r2, 0x4]\n\
	lsls r4, r5, 2\n\
	adds r2, r4, r2\n\
	ldr r2, [r2]\n\
	lsls r2, 28\n\
	lsrs r2, 30\n\
	movs r3, 0x1\n\
	bl ConvertEasyChatWordsToString\n\
	ldr r1, [r7]\n\
	ldr r0, [r1, 0x4]\n\
	adds r4, r0\n\
	ldr r0, [r4]\n\
	lsls r0, 28\n\
	lsrs r0, 30\n\
	adds r0, r6, r0\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	adds r0, r5, 0x1\n\
	lsls r0, 16\n\
	lsrs r5, r0, 16\n\
	ldrb r1, [r1]\n\
	cmp r5, r1\n\
	bcc _080F916E\n\
_080F91B4:\n\
	ldr r2, _080F91F0 @ =0x020000d8\n\
	adds r4, r2, 0\n\
	subs r4, 0xD8\n\
	adds r0, r2, 0\n\
	adds r0, 0x28\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	bne _080F91F8\n\
	ldr r1, [r2, 0x1C]\n\
	adds r1, 0x12\n\
	adds r0, r2, 0\n\
	bl sub_80F8D7C\n\
	adds r2, r0, 0\n\
	ldr r1, _080F91F4 @ =gOtherText_From\n\
	bl StringCopy\n\
	ldr r0, _080F91F0 @ =0x020000d8\n\
	bl StringLength\n\
	movs r2, 0x86\n\
	lsls r2, 1\n\
	adds r1, r4, r2\n\
	ldr r1, [r1]\n\
	ldrb r1, [r1, 0x2]\n\
	subs r1, r0\n\
	b _080F921A\n\
	.align 2, 0\n\
_080F91EC: .4byte 0x02000000\n\
_080F91F0: .4byte 0x020000d8\n\
_080F91F4: .4byte gOtherText_From\n\
_080F91F8:\n\
	ldr r1, _080F922C @ =gOtherText_From\n\
	adds r0, r2, 0\n\
	bl StringCopy\n\
	adds r2, r0, 0\n\
	adds r0, r4, 0\n\
	adds r0, 0xF4\n\
	ldr r1, [r0]\n\
	adds r1, 0x12\n\
	adds r0, r2, 0\n\
	bl sub_80F8D7C\n\
	movs r1, 0x86\n\
	lsls r1, 1\n\
	adds r0, r4, r1\n\
	ldr r0, [r0]\n\
	ldrb r1, [r0, 0x2]\n\
_080F921A:\n\
	adds r0, r4, 0\n\
	adds r0, 0xF9\n\
	strb r1, [r0]\n\
	pop {r3}\n\
	mov r8, r3\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080F922C: .4byte gOtherText_From\n\
    .syntax divided\n");
}
#endif

static void sub_80F8E80(void) {
    u16 pos;
    u8 x;
    u8 y = 0;

    for (pos = 0; pos < unk_2000000.var10C->var0; pos++) {
        if (unk_2000000.words[pos][0] == 0xFF) {
            continue;
        }

        if (unk_2000000.words[pos][0] == 0x00) {
            continue;
        }

        x = unk_2000000.var10C->var4[pos].unk_0_4;
        y += unk_2000000.var10C->var4[pos].unk_0_0;
        MenuPrint(unk_2000000.words[pos], unk_2000000.var10C->var3_4 + x, unk_2000000.var10C->var3_0 + y);
        y += 2;
    }

    MenuPrint(unk_2000000.varD8, unk_2000000.varF9, unk_2000000.var10C->var1);
}

static void sub_80F8F18(void) {
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void sub_80F8F2C(void) {
    if(unk_2000000.varFB != 0) {
        AnimateSprites();
        BuildOamBuffer();
    }

    unk_2000000.varF0();
}

static void sub_80F8F58(void) {
    u8 local0;

    local0 = UpdatePaletteFade();
    if(local0 == 0) {
        unk_2000000.varF0 = sub_80F8F78;
    }
}

static void sub_80F8F78(void) {
    if (gMain.newKeys & (A_BUTTON | B_BUTTON)) {
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        unk_2000000.varF0 = sub_80F8FB4;
    }
}

static void sub_80F8FB4(void) {
    u16 local1;

    if (UpdatePaletteFade()) {
        return;
    }

    SetMainCallback2(unk_2000000.varEC);
    switch (unk_2000000.varFB) {
        case 2:
        case 1:
            local1 = sub_809D4A8(unk_2000000.varF4->species);
            sub_809D608(local1);

            sub_809D510(&gSprites[unk_2000000.varFC]);
            break;
    }

    memset(&unk_2000000, 0, 0x110);
    ResetPaletteFade();
}
