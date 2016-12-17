#include "global.h"
#include "berry_tag_screen.h"
#include "asm.h"
#include "berry.h"
#include "decompress.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rom4.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

#define OFFSET_7B (123)
#define FIRST_BERRY (0x85) // ITEM_CHERI_BERRY

struct Struct2000000 {
    /*0x00*/ u8 filler_0[0x1FFFF];
    /*0x1FFFF*/ bool8 var_1FFFF;
};

struct BerryTagStatus {
    s16 circles[5];
};

extern struct Struct2000000 unk_2000000;
extern u16 gBGTilemapBuffers[4][0x400];
extern u8 gUnknown_0203932C;
extern struct BerryTagStatus gUnknown_0203932E;
extern u16 gScriptItemId;
extern u16 gUnknown_030041B4;

extern const struct SpriteSheet gUnknown_083C1F74;
extern const struct SpritePalette gUnknown_083C1F7C;

extern u8 gOtherText_ThreeQuestions2[];
extern u8 gOtherText_Size[];
extern u8 gOtherText_Firm[];
extern u8 gContestStatsText_Unknown1[];
extern u8 *gUnknown_0841192C[];

extern u8 gBerryCheck_Gfx[];
extern u8 gBerryCheck_Pal[];
extern u8 gUnknown_08E788E4[];
extern u8 gUnknown_08E78A84[];

static void sub_8146014(void);
static void sub_814602C(void);
static bool8 sub_8146058(void);
static void sub_8146288(void);
static bool8 sub_81462B8(void);
static void sub_814640C(u8 taskId);
static void sub_8146440(u8 taskId);
static void sub_8146480(u8 taskid);
static void sub_81464E4(void);
static void sub_8146600(u8 berry);
// static void sub_81466A0(void);
static void sub_81466E8(u8 taskId, s32 direction);
// static void sub_8146798(u8 berry);
// static void sub_8146810(u8 berry);
// static void sub_81468BC(void);

static void sub_8146014(void) {
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

static void sub_814602C(void) {
    REG_BG0VOFS = gUnknown_030041B4;
    REG_BG1VOFS = gUnknown_030041B4;

    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static bool8 sub_8146058(void) {
    u8 berry;
    u16 backup;

    switch (gMain.state) {
        case 0:
            sub_80F9438();
            sub_80F9368();
            sub_8146288();
            REG_BLDCNT = 0;
            gMain.state += 1;
            break;

        case 1:
            ResetPaletteFade();
            gPaletteFade.bufferTransferDisabled = 1;
            gMain.state += 1;
            break;

        case 2:
            ResetSpriteData();
            gMain.state += 1;
            break;

        case 3:
            SetUpWindowConfig(&gWindowConfig_81E6E18);
            gMain.state += 1;
            break;

        case 4:
            MultistepInitMenuWindowBegin(&gWindowConfig_81E6E18);
            gMain.state += 1;
            break;

        case 5:
            if (!MultistepInitMenuWindowContinue()) {
                return FALSE;
            }
            unk_2000000.var_1FFFF = 0;
            gMain.state += 1;
            break;

        case 6:
            if (!sub_81462B8()) {
                break;
            }

            unk_2000000.var_1FFFF = 0;
            gMain.state += 1;
            break;

        case 7:
            sub_81464E4();
            gMain.state += 1;
            break;

        case 8:
            berry = gScriptItemId + OFFSET_7B;
            gUnknown_0203932C = sub_80A7D8C(berry, 56, 64);
            gMain.state += 1;
            break;

        case 9:
            sub_8146600(gScriptItemId + OFFSET_7B);
            gMain.state += 1;
            break;

        case 10:
            backup = REG_IME;
            REG_IME = 0;
            REG_IE |= INTR_FLAG_VBLANK;
            REG_IME = backup;

            REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
            SetVBlankCallback(sub_814602C);
            REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_1D_MAP;
            gMain.state += 1;
            break;

        case 11:
            if (sub_8055870() == TRUE) {
                break;
            }
            gMain.state += 1;
            break;

        case 12:
            BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
            gPaletteFade.bufferTransferDisabled = 0;
            SetMainCallback2(sub_8146014);
            return TRUE;

    }

    return FALSE;
}

void BerryTagScreen_814625C(u8 taskId) {
    do {
        if (sub_8146058() == TRUE) {
            CreateTask(sub_8146480, 0);
            return;
        }

    } while (sub_80F9344() != TRUE);
}

static void sub_8146288(void) {
    REG_BG1CNT = 0x502;
    REG_BG2CNT = 0x600;
    REG_BG3CNT = 0x703;
    gUnknown_030041B4 = 0;
}

#ifdef NONMATCHING
bool8 sub_81462B8(void) {
    u16 i;

    switch (unk_2000000.var_1FFFF) {
        case 0:
            LZDecompressVram(gBerryCheck_Gfx, (void *) VRAM);
            unk_2000000.var_1FFFF += 1;
            break;

        case 1:
            LZDecompressVram(gUnknown_08E788E4, (void *) VRAM + 0x2800);
            unk_2000000.var_1FFFF += 1;
            break;

        case 2:
            LZDecompressVram(gUnknown_08E78A84, (void *) VRAM + 0x3000);
            unk_2000000.var_1FFFF += 1;
            break;

        case 3:
            for (i = 0; i < 0x400; i++) {
                u16 (*buffer)[0x400] = &gBGTilemapBuffers[3];
                if (gSaveBlock2.playerGender == MALE) {
                    (*buffer)[i] = 0x4042;
                } else {
                    (*buffer)[i] = 0x5042;
                }
            }
            unk_2000000.var_1FFFF += 1;
            break;

        case 4:
            LoadCompressedPalette(gBerryCheck_Pal, 0, 96 * 2);
            unk_2000000.var_1FFFF += 1;
            break;

        case 5:
            LoadCompressedObjectPic(&gUnknown_083C1F74);
            unk_2000000.var_1FFFF += 1;
            break;

        case 6:
            LoadCompressedObjectPalette(&gUnknown_083C1F7C);
            unk_2000000.var_1FFFF = 0;
            return TRUE;
    }

    return FALSE;
}
#else
__attribute__((naked))
static bool8 sub_81462B8(void) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	ldr r1, _081462D4 @ =0x02000000\n\
	ldr r2, _081462D8 @ =0x0001ffff\n\
	adds r0, r1, r2\n\
	ldrb r0, [r0]\n\
	mov r12, r1\n\
	cmp r0, 0x6\n\
	bls _081462CA\n\
	b _08146404\n\
_081462CA:\n\
	lsls r0, 2\n\
	ldr r1, _081462DC @ =_081462E0\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_081462D4: .4byte 0x02000000\n\
_081462D8: .4byte 0x0001ffff\n\
_081462DC: .4byte _081462E0\n\
	.align 2, 0\n\
_081462E0:\n\
	.4byte _081462FC\n\
	.4byte _0814630C\n\
	.4byte _0814632C\n\
	.4byte _08146340\n\
	.4byte _081463A4\n\
	.4byte _081463C4\n\
	.4byte _081463E4\n\
_081462FC:\n\
	ldr r0, _08146308 @ =gBerryCheck_Gfx\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl LZDecompressVram\n\
	b _081463CA\n\
	.align 2, 0\n\
_08146308: .4byte gBerryCheck_Gfx\n\
_0814630C:\n\
	ldr r0, _0814631C @ =gUnknown_08E788E4\n\
	ldr r1, _08146320 @ =0x06002800\n\
	bl LZDecompressVram\n\
	ldr r1, _08146324 @ =0x02000000\n\
	ldr r2, _08146328 @ =0x0001ffff\n\
	adds r1, r2\n\
	b _081463D0\n\
	.align 2, 0\n\
_0814631C: .4byte gUnknown_08E788E4\n\
_08146320: .4byte 0x06002800\n\
_08146324: .4byte 0x02000000\n\
_08146328: .4byte 0x0001ffff\n\
_0814632C:\n\
	ldr r0, _08146338 @ =gUnknown_08E78A84\n\
	ldr r1, _0814633C @ =0x06003000\n\
	bl LZDecompressVram\n\
	b _081463CA\n\
	.align 2, 0\n\
_08146338: .4byte gUnknown_08E78A84\n\
_0814633C: .4byte 0x06003000\n\
_08146340:\n\
	movs r1, 0\n\
	ldr r7, _0814635C @ =gBGTilemapBuffers + 0x1000\n\
	adds r2, r7, 0\n\
	ldr r6, _08146360 @ =0x00004042\n\
	ldr r5, _08146364 @ =gSaveBlock2\n\
	ldr r4, _08146368 @ =0x00005042\n\
	ldr r3, _0814636C @ =0x000003ff\n\
_0814634E:\n\
	ldrb r0, [r5, 0x8]\n\
	cmp r0, 0\n\
	bne _08146370\n\
	lsls r0, r1, 1\n\
	adds r0, r2\n\
	strh r6, [r0]\n\
	b _08146376\n\
	.align 2, 0\n\
_0814635C: .4byte gBGTilemapBuffers + 0x1000\n\
_08146360: .4byte 0x00004042\n\
_08146364: .4byte gSaveBlock2\n\
_08146368: .4byte 0x00005042\n\
_0814636C: .4byte 0x000003ff\n\
_08146370:\n\
	lsls r0, r1, 1\n\
	adds r0, r2\n\
	strh r4, [r0]\n\
_08146376:\n\
	adds r0, r1, 0x1\n\
	lsls r0, 16\n\
	lsrs r1, r0, 16\n\
	cmp r1, r3\n\
	bls _0814634E\n\
	ldr r1, _08146394 @ =0x06003800\n\
	ldr r0, _08146398 @ =0x040000d4\n\
	str r7, [r0]\n\
	str r1, [r0, 0x4]\n\
	ldr r1, _0814639C @ =0x80000400\n\
	str r1, [r0, 0x8]\n\
	ldr r0, [r0, 0x8]\n\
	ldr r1, _081463A0 @ =0x0001ffff\n\
	add r1, r12\n\
	b _081463D0\n\
	.align 2, 0\n\
_08146394: .4byte 0x06003800\n\
_08146398: .4byte 0x040000d4\n\
_0814639C: .4byte 0x80000400\n\
_081463A0: .4byte 0x0001ffff\n\
_081463A4:\n\
	ldr r0, _081463B8 @ =gBerryCheck_Pal\n\
	movs r1, 0\n\
	movs r2, 0xC0\n\
	bl LoadCompressedPalette\n\
	ldr r1, _081463BC @ =0x02000000\n\
	ldr r2, _081463C0 @ =0x0001ffff\n\
	adds r1, r2\n\
	b _081463D0\n\
	.align 2, 0\n\
_081463B8: .4byte gBerryCheck_Pal\n\
_081463BC: .4byte 0x02000000\n\
_081463C0: .4byte 0x0001ffff\n\
_081463C4:\n\
	ldr r0, _081463D8 @ =gUnknown_083C1F74\n\
	bl LoadCompressedObjectPic\n\
_081463CA:\n\
	ldr r1, _081463DC @ =0x02000000\n\
	ldr r0, _081463E0 @ =0x0001ffff\n\
	adds r1, r0\n\
_081463D0:\n\
	ldrb r0, [r1]\n\
	adds r0, 0x1\n\
	strb r0, [r1]\n\
	b _08146404\n\
	.align 2, 0\n\
_081463D8: .4byte gUnknown_083C1F74\n\
_081463DC: .4byte 0x02000000\n\
_081463E0: .4byte 0x0001ffff\n\
_081463E4:\n\
	ldr r0, _081463F8 @ =gUnknown_083C1F7C\n\
	bl LoadCompressedObjectPalette\n\
	ldr r0, _081463FC @ =0x02000000\n\
	ldr r1, _08146400 @ =0x0001ffff\n\
	adds r0, r1\n\
	movs r1, 0\n\
	strb r1, [r0]\n\
	movs r0, 0x1\n\
	b _08146406\n\
	.align 2, 0\n\
_081463F8: .4byte gUnknown_083C1F7C\n\
_081463FC: .4byte 0x02000000\n\
_08146400: .4byte 0x0001ffff\n\
_08146404:\n\
	movs r0, 0\n\
_08146406:\n\
	pop {r4-r7}\n\
	pop {r1}\n\
	bx r1\n\
	.syntax divided\n");
}
#endif

static void sub_814640C(u8 taskId) {
    if (gPaletteFade.active) {
        return;
    }

    SetMainCallback2(sub_80A5B40);
    sub_80A7DD4();
    gpu_pal_allocator_reset__manage_upper_four();
    DestroyTask(taskId);
}

static void sub_8146440(u8 taskId) {
    PlaySE(SE_SELECT);
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);

    gTasks[taskId].func = sub_814640C;
}

static void sub_8146480(u8 taskid) {
    register u16 keys asm("r1");

    if (gPaletteFade.active) {
        return;
    }

    keys = gMain.newAndRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT | DPAD_UP | DPAD_DOWN);
    if (keys == DPAD_UP) {
        sub_81466E8(taskid, -1);
    }

    keys = gMain.newAndRepeatedKeys & (DPAD_RIGHT | DPAD_LEFT | DPAD_UP | DPAD_DOWN);
    if (keys == DPAD_DOWN) {
        sub_81466E8(taskid, 1);
    }

    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON) {
        sub_8146440(taskid);
    }
}

static void sub_81464E4(void) {
    struct Berry *berryInfo;
    u32 size;
    s32 sizeMajor;
    s32 sizeMinor;

    berryInfo = GetBerryInfo(gScriptItemId + OFFSET_7B + 1);

    ConvertIntToDecimalStringN(gStringVar1, gScriptItemId - FIRST_BERRY + 1, STR_CONV_MODE_LEADING_ZEROS, 2);
    MenuPrint(gStringVar1, 12, 4);

    MenuPrint(berryInfo->name, 14, 4);
    MenuPrint(berryInfo->description1, 4, 14);
    MenuPrint(berryInfo->description2, 4, 16);

    size = (berryInfo->size * 1000) / 254;
    if (size % 10 >= 5) {
        size += 10;
    }
    sizeMinor = (size % 100) / 10;
    sizeMajor = size / 100;

    MenuPrint(gOtherText_Size, 11, 7);
    if (berryInfo->size != 0) {
        ConvertIntToDecimalStringN(gStringVar1, sizeMajor, STR_CONV_MODE_LEFT_ALIGN, 2);
        ConvertIntToDecimalStringN(gStringVar2, sizeMinor, STR_CONV_MODE_LEFT_ALIGN, 2);
        MenuPrint(gContestStatsText_Unknown1, 16, 7);
    } else {
        MenuPrint(gOtherText_ThreeQuestions2, 16, 7);
    }

    MenuPrint(gOtherText_Firm, 11, 9);
    if (berryInfo->firmness != 0) {
        MenuPrint(gUnknown_0841192C[berryInfo->firmness - 1], 16, 9);
    } else {
        MenuPrint(gOtherText_ThreeQuestions2, 16, 9);
    }
}

#ifdef NONMATCHING
static void sub_8146600(u8 berry) {
    struct Berry *berryInfo;
    u16 i;

    berryInfo = GetBerryInfo(berry +1);

    for (i = 0; i < 5; i++) {
        gUnknown_0203932E.circles[i] |= 0xFFFF;
    }

    if (berryInfo->spicy) {
        // argument is the center of the circle
        gUnknown_0203932E.circles[0] = sub_80A7E5C(48);
    }

    if (berryInfo->dry) {
        gUnknown_0203932E.circles[1] = sub_80A7E5C(88);
    }

    if (berryInfo->sweet) {
        gUnknown_0203932E.circles[2] = sub_80A7E5C(128);
    }

    if (berryInfo->bitter) {
        gUnknown_0203932E.circles[3] = sub_80A7E5C(168);
    }

    if (berryInfo->sour) {
        gUnknown_0203932E.circles[4] = sub_80A7E5C(208);
    }
}
#else
__attribute__((naked))
static void sub_8146600(u8 berry) {
    asm(".syntax unified\n\
	push {r4,r5,lr}\n\
	lsls r0, 24\n\
	movs r1, 0x80\n\
	lsls r1, 17\n\
	adds r0, r1\n\
	lsrs r0, 24\n\
	bl GetBerryInfo\n\
	adds r4, r0, 0\n\
	movs r2, 0\n\
	ldr r5, _08146698 @ =gUnknown_0203932E\n\
	ldr r0, _0814669C @ =0x0000ffff\n\
	adds r3, r0, 0\n\
_0814661A:\n\
	lsls r0, r2, 1\n\
	adds r0, r5\n\
	ldrh r1, [r0]\n\
	orrs r1, r3\n\
	strh r1, [r0]\n\
	adds r0, r2, 0x1\n\
	lsls r0, 16\n\
	lsrs r2, r0, 16\n\
	cmp r2, 0x4\n\
	bls _0814661A\n\
	ldrb r0, [r4, 0x15]\n\
	cmp r0, 0\n\
	beq _08146642\n\
	movs r0, 0x30\n\
	bl sub_80A7E5C\n\
	ldr r1, _08146698 @ =gUnknown_0203932E\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r1]\n\
_08146642:\n\
	ldrb r0, [r4, 0x16]\n\
	cmp r0, 0\n\
	beq _08146656\n\
	movs r0, 0x58\n\
	bl sub_80A7E5C\n\
	ldr r1, _08146698 @ =gUnknown_0203932E\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r1, 0x2]\n\
_08146656:\n\
	ldrb r0, [r4, 0x17]\n\
	cmp r0, 0\n\
	beq _0814666A\n\
	movs r0, 0x80\n\
	bl sub_80A7E5C\n\
	ldr r1, _08146698 @ =gUnknown_0203932E\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r1, 0x4]\n\
_0814666A:\n\
	ldrb r0, [r4, 0x18]\n\
	cmp r0, 0\n\
	beq _0814667E\n\
	movs r0, 0xA8\n\
	bl sub_80A7E5C\n\
	ldr r1, _08146698 @ =gUnknown_0203932E\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r1, 0x6]\n\
_0814667E:\n\
	ldrb r0, [r4, 0x19]\n\
	cmp r0, 0\n\
	beq _08146692\n\
	movs r0, 0xD0\n\
	bl sub_80A7E5C\n\
	ldr r1, _08146698 @ =gUnknown_0203932E\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r1, 0x8]\n\
_08146692:\n\
	pop {r4,r5}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08146698: .4byte gUnknown_0203932E\n\
_0814669C: .4byte 0x0000ffff\n\
	.syntax divided\n");
}
#endif


void sub_81466A0(void) {
    u16 i;

    for (i = 0; i < 5; i++) {
        if (gUnknown_0203932E.circles[i] != -1) {
            DestroySprite(&gSprites[gUnknown_0203932E.circles[i]]);
            gUnknown_0203932E.circles[i] = -1;
        }
    }
}


__attribute__((naked))
static void sub_81466E8(u8 taskId, s32 direction) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r8\n\
	push {r7}\n\
	lsls r0, 24\n\
	lsrs r7, r0, 24\n\
	lsls r1, 24\n\
	lsrs r2, r1, 24\n\
	lsls r0, r7, 2\n\
	adds r0, r7\n\
	lsls r0, 3\n\
	ldr r1, _08146748 @ =gTasks + 0x8\n\
	adds r6, r0, r1\n\
	ldr r4, _0814674C @ =gUnknown_03005D10\n\
	movs r0, 0xC\n\
	adds r0, r4\n\
	mov r8, r0\n\
	ldrb r1, [r0, 0x1]\n\
	ldrb r0, [r4, 0xC]\n\
	adds r1, r0\n\
	cmp r1, 0\n\
	bne _08146718\n\
	lsls r0, r2, 24\n\
	cmp r0, 0\n\
	blt _0814678C\n\
_08146718:\n\
	adds r0, r1, 0x1\n\
	lsls r5, r2, 24\n\
	mov r1, r8\n\
	ldrb r1, [r1, 0x2]\n\
	cmp r0, r1\n\
	bne _08146728\n\
	cmp r5, 0\n\
	bgt _0814678C\n\
_08146728:\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	mov r2, r8\n\
	ldrb r3, [r2, 0x1]\n\
	ldrb r4, [r4, 0xC]\n\
	mov r12, r4\n\
	adds r0, r3, r4\n\
	asrs r2, r5, 24\n\
	adds r1, r0, r2\n\
	cmp r1, 0\n\
	bge _08146750\n\
	negs r0, r0\n\
	strh r0, [r6, 0x2]\n\
	b _08146766\n\
	.align 2, 0\n\
_08146748: .4byte gTasks + 0x8\n\
_0814674C: .4byte gUnknown_03005D10\n\
_08146750:\n\
	mov r4, r8\n\
	ldrb r0, [r4, 0x2]\n\
	cmp r1, r0\n\
	blt _08146764\n\
	subs r0, r3\n\
	mov r1, r12\n\
	subs r0, r1\n\
	subs r0, 0x1\n\
	strh r0, [r6, 0x2]\n\
	b _08146766\n\
_08146764:\n\
	strh r2, [r6, 0x2]\n\
_08146766:\n\
	ldr r0, _08146780 @ =gTasks\n\
	lsls r1, r7, 2\n\
	adds r1, r7\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	ldr r0, _08146784 @ =sub_8146798\n\
	str r0, [r1]\n\
	cmp r5, 0\n\
	bge _08146788\n\
	movs r2, 0x10\n\
	negs r2, r2\n\
	adds r0, r2, 0\n\
	b _0814678A\n\
	.align 2, 0\n\
_08146780: .4byte gTasks\n\
_08146784: .4byte sub_8146798\n\
_08146788:\n\
	movs r0, 0x10\n\
_0814678A:\n\
	strh r0, [r6]\n\
_0814678C:\n\
	pop {r3}\n\
	mov r8, r3\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.syntax divided\n");
}

__attribute__((naked))
void sub_8146798(u8 berry) {
    asm(".syntax unified\n\
	push {r4,r5,lr}\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	lsls r0, r4, 2\n\
	adds r0, r4\n\
	lsls r0, 3\n\
	ldr r1, _08146800 @ =gTasks + 0x8\n\
	adds r0, r1\n\
	ldr r2, _08146804 @ =gUnknown_030041B4\n\
	ldrh r1, [r0]\n\
	ldrh r5, [r2]\n\
	adds r3, r1, r5\n\
	movs r1, 0xFF\n\
	ands r3, r1\n\
	strh r3, [r2]\n\
	movs r1, 0\n\
	ldrsh r0, [r0, r1]\n\
	cmp r0, 0\n\
	ble _081467C2\n\
	cmp r3, 0x90\n\
	beq _081467CA\n\
_081467C2:\n\
	cmp r0, 0\n\
	bge _081467E0\n\
	cmp r3, 0x70\n\
	bne _081467E0\n\
_081467CA:\n\
	ldr r0, _08146808 @ =gTasks\n\
	lsls r1, r4, 2\n\
	adds r1, r4\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	movs r0, 0xA\n\
	ldrsb r0, [r1, r0]\n\
	bl sub_8146810\n\
	bl sub_81468BC\n\
_081467E0:\n\
	ldr r0, _08146804 @ =gUnknown_030041B4\n\
	ldrh r2, [r0]\n\
	cmp r2, 0\n\
	bne _081467FA\n\
	ldr r0, _08146808 @ =gTasks\n\
	lsls r1, r4, 2\n\
	adds r1, r4\n\
	lsls r1, 3\n\
	adds r1, r0\n\
	strh r2, [r1, 0x8]\n\
	strh r2, [r1, 0xA]\n\
	ldr r0, _0814680C @ =sub_8146480\n\
	str r0, [r1]\n\
_081467FA:\n\
	pop {r4,r5}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08146800: .4byte gTasks + 0x8\n\
_08146804: .4byte gUnknown_030041B4\n\
_08146808: .4byte gTasks\n\
_0814680C: .4byte sub_8146480\n\
	.syntax divided\n");
}

__attribute__((naked))
void sub_8146810(u8 berry) {
    asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	lsls r0, 24\n\
	lsrs r3, r0, 24\n\
	adds r4, r3, 0\n\
	lsls r0, r3, 24\n\
	asrs r1, r0, 24\n\
	cmp r1, 0\n\
	ble _08146848\n\
	ldr r0, _08146840 @ =gUnknown_03005D10\n\
	adds r4, r0, 0\n\
	adds r4, 0xC\n\
	ldrb r2, [r0, 0xC]\n\
	adds r1, r2, r1\n\
	adds r6, r0, 0\n\
	cmp r1, 0x7\n\
	ble _08146844\n\
	adds r0, r3, 0\n\
	adds r0, 0xF9\n\
	adds r0, r2, r0\n\
	ldrb r1, [r4, 0x1]\n\
	adds r0, r1\n\
	strb r0, [r4, 0x1]\n\
	movs r0, 0x7\n\
	b _0814686E\n\
	.align 2, 0\n\
_08146840: .4byte gUnknown_03005D10\n\
_08146844:\n\
	adds r0, r2, r3\n\
	b _0814686E\n\
_08146848:\n\
	ldr r0, _08146868 @ =gUnknown_03005D10\n\
	adds r5, r0, 0\n\
	adds r5, 0xC\n\
	ldrb r2, [r0, 0xC]\n\
	adds r1, r2, r1\n\
	adds r6, r0, 0\n\
	cmp r1, 0\n\
	bge _0814686C\n\
	adds r0, r2, r3\n\
	ldrb r1, [r5, 0x1]\n\
	adds r0, r1\n\
	movs r1, 0\n\
	strb r0, [r5, 0x1]\n\
	strb r1, [r6, 0xC]\n\
	b _08146870\n\
	.align 2, 0\n\
_08146868: .4byte gUnknown_03005D10\n\
_0814686C:\n\
	adds r0, r2, r4\n\
_0814686E:\n\
	strb r0, [r6, 0xC]\n\
_08146870:\n\
	ldr r2, _081468AC @ =gScriptItemId\n\
	movs r0, 0x3\n\
	lsls r0, 2\n\
	adds r0, r6\n\
	ldrb r1, [r0, 0x1]\n\
	ldrb r0, [r0]\n\
	adds r1, r0\n\
	ldr r0, _081468B0 @ =gUnknown_03005D24\n\
	ldr r0, [r0]\n\
	lsls r1, 2\n\
	adds r1, r0\n\
	ldrh r0, [r1]\n\
	strh r0, [r2]\n\
	ldr r0, _081468B4 @ =gUnknown_0203932C\n\
	ldrb r1, [r0]\n\
	lsls r0, r1, 4\n\
	adds r0, r1\n\
	lsls r0, 2\n\
	ldr r1, _081468B8 @ =gSprites\n\
	adds r0, r1\n\
	bl DestroySprite\n\
	bl sub_81466A0\n\
	bl sub_80A7DD4\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_081468AC: .4byte gScriptItemId\n\
_081468B0: .4byte gUnknown_03005D24\n\
_081468B4: .4byte gUnknown_0203932C\n\
_081468B8: .4byte gSprites\n\
	.syntax divided\n");
}

void sub_81468BC(void) {
    MenuZeroFillWindowRect(0, 4, 29, 19);
    sub_81464E4();

    // center of berry sprite
    gUnknown_0203932C = sub_80A7D8C(gScriptItemId + OFFSET_7B, 56, 64);

    sub_8146600(gScriptItemId + OFFSET_7B);
}
