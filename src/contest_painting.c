#include "global.h"
#include "asm.h"
#include "decompress.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "rng.h"
#include "sprite.h"
#include "string_util.h"
#include "text.h"

#define MOSAIC_BIT_BG_HSIZE (0)
#define MOSAIC_BIT_BG_VSIZE (4)
#define MOSAIC_BIT_OBJ_HSIZE (8)
#define MOSAIC_BIT_OBJ_VSIZE (12)

enum {
    CONTEST_COOL,
    CONTEST_BEAUTY,
    CONTEST_CUTE,
    CONTEST_SMART,
    CONTEST_TOUGH,
};

enum {
    CONTESTRESULT_COOL = 9,
    CONTESTRESULT_BEAUTY = 13,
    CONTESTRESULT_CUTE = 2,
    CONTESTRESULT_SMART = 36,
    CONTESTRESULT_TOUGH = 6,
};

struct ContestEntry {
    /* 0x00 */ u8 var0;
    /* 0x04 */ u32 var4;
    /* 0x08 */ u16 var8;
    /* 0x0A */ u8 contestType;
    /* 0x0B */ u8 pokemon_name[POKEMON_NAME_LENGTH];
    /* 0x15 */ u8 pad15;
    /* 0x16 */ u8 trainer_name[OT_NAME_LENGTH];
};

struct Unk3000756 {
    /* 0x00 */ u8 var_0;
};

struct LabelPair {
    u8 (*prefix)[];
    u8 (*suffix)[];
};

struct Unk03005E20 {
    u8 var_0;
    u8 pad1[3];
    u16 (*var_4)[][32];
    u16 (*var_8)[];
    u8 pad0C[4];
    u32 var_10;
    u16 var_14;
    u16 var_16;
    u8 var_18;
    u8 var_19;
    u8 var_1A;
    u8 var_1B;
    u8 var_1C;
    u8 var_1D;
    u8 var_1E;
    u8 var_1F;
};

extern u8 gUnknown_03000750;
extern struct Unk03005E20 gUnknown_03005E20;
extern u8 gUnknown_03005E40[];
extern u16 (*gUnknown_03005E90)[];

extern u8 unk_2000000[];
extern u8 unk_2015de0[];
extern u16 gUnknown_03000752;
extern u16 gUnknown_03000754;
extern struct Unk3000756 gUnknown_03000756;
extern struct ContestEntry *gUnknown_03005E8C;

extern u16 (*gUnknown_03005E10)[32][32];

extern const struct SpriteSheet gMonFrontPicTable[];
extern const struct MonCoords gMonFrontPicCoords[];
extern const struct SpriteSheet gMonBackPicTable[];
extern const struct MonCoords gMonBackPicCoords[];

extern void *gUnknown_081FAF4C[];

extern u16 gPictureFramePalettes[];

extern u8 gPictureFrameTiles_0[];
extern u8 gPictureFrameTiles_1[];
extern u8 gPictureFrameTiles_2[];
extern u8 gPictureFrameTiles_3[];
extern u8 gPictureFrameTiles_4[];
extern u8 gPictureFrameTiles_5[];

extern u8 gPictureFrameTilemap_0[];
extern u8 gPictureFrameTilemap_1[];
extern u8 gPictureFrameTilemap_2[];
extern u8 gPictureFrameTilemap_3[];
extern u8 gPictureFrameTilemap_4[];
extern u8 gPictureFrameTilemap_5[];

extern u8 *gUnknown_083F60AC[];
extern struct LabelPair gUnknown_083F60C0[];
extern struct OamData gOamData_83F6138;
extern u16 gUnknown_083F6140[];

extern u8 gContestText_ContestWinner[];
extern u8 gOtherText_Unknown1[];

void HoldContestPainting(void);
void ShowContestPainting();
void ContestPaintingInitWindow(u8 arg0);
void ContestPaintingInitVars(u8 arg0);
void sub_8107090(u8 arg0, u8 arg1);
void ContestPaintingPrintCaption(u8 arg0, u8 arg1);
void ContestPaintingInitBG(void);
void CB2_HoldContestPainting(void);
void VBlankCB_ContestPainting(void);

void sub_80FC7A0(struct Unk03005E20*);
void sub_80FDA18(struct Unk03005E20*);
void sub_80FD8CC(struct Unk03005E20*);
extern void *species_and_otid_get_pal();
void sub_8106B90();

__attribute__((naked))
void sub_8106630(u32 arg0) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	ldr r2, _0810665C @ =0x02015de0\n\
	subs r4, r2, 0x2\n\
	subs r5, r2, 0x1\n\
	ldr r3, _08106660 @ =gSaveBlock1\n\
	subs r0, 0x1\n\
	lsls r1, r0, 5\n\
	adds r1, r3\n\
	ldr r3, _08106664 @ =0x00002dfc\n\
	adds r1, r3\n\
	ldm r1!, {r3,r6,r7}\n\
	stm r2!, {r3,r6,r7}\n\
	ldm r1!, {r3,r6,r7}\n\
	stm r2!, {r3,r6,r7}\n\
	ldm r1!, {r6,r7}\n\
	stm r2!, {r6,r7}\n\
	strb r0, [r4]\n\
	movs r0, 0\n\
	strb r0, [r5]\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_0810665C: .4byte 0x02015de0\n\
_08106660: .4byte gSaveBlock1\n\
_08106664: .4byte 0x00002dfc\n\
    .syntax divided\n");
}

void CB2_ContestPainting(void)
{
    ShowContestPainting();
}

void ShowContestPainting(void)
{
    switch (gMain.state)
    {
    case 0:
        remove_some_task();
        SetVBlankCallback(NULL);
        gUnknown_03005E8C = (struct ContestEntry *)&unk_2015de0;
        ContestPaintingInitVars(TRUE);
        ContestPaintingInitBG();
        gMain.state++;
        break;
    case 1:
    {
        u8 *addr;
        size_t size;
        
        ResetPaletteFade();
        addr = (void *)VRAM;
        size = 0x18000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        ResetSpriteData();
        gMain.state++;
        break;
    }
    case 2:
        SeedRng(gMain.vblankCounter1);
        InitKeys();
        ContestPaintingInitWindow(unk_2000000[0x15DDF]);
        gMain.state++;
        break;
    case 3:
        sub_8107090(unk_2000000[0x15DDE], unk_2000000[0x15DDF]);
        gMain.state++;
        break;
    case 4:
        ContestPaintingPrintCaption(unk_2000000[0x15DDE], unk_2000000[0x15DDF]);
        LoadPalette(gUnknown_083F6140, 0, 1 * 2);
        DmaClear32(3, PLTT, 0x400);
        BeginFastPaletteFade(2);
        SetVBlankCallback(VBlankCB_ContestPainting);
        gUnknown_03000750 = 0;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_ON;
        SetMainCallback2(CB2_HoldContestPainting);
        break;
    }
}

void CB2_HoldContestPainting(void) {
    HoldContestPainting();
    UpdatePaletteFade();
}

void CB2_QuitContestPainting(void) {
    SetMainCallback2(gMain.savedCallback);
}

__attribute__((naked))
void HoldContestPainting(void) {
    asm(".syntax unified\n\
	push {lr}\n\
	sub sp, 0x4\n\
	ldr r3, _08106844 @ =gUnknown_03000750\n\
	ldrb r1, [r3]\n\
	cmp r1, 0x1\n\
	beq _08106880\n\
	cmp r1, 0x1\n\
	bgt _08106848\n\
	cmp r1, 0\n\
	beq _0810684E\n\
	b _081068E6\n\
	.align 2, 0\n\
_08106844: .4byte gUnknown_03000750\n\
_08106848:\n\
	cmp r1, 0x2\n\
	beq _081068C0\n\
	b _081068E6\n\
_0810684E:\n\
	ldr r0, _08106874 @ =gPaletteFade\n\
	ldrb r1, [r0, 0x7]\n\
	movs r0, 0x80\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _0810685E\n\
	movs r0, 0x1\n\
	strb r0, [r3]\n\
_0810685E:\n\
	ldr r0, _08106878 @ =gUnknown_03000756\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _081068E6\n\
	ldr r1, _0810687C @ =gUnknown_03000754\n\
	ldrh r0, [r1]\n\
	cmp r0, 0\n\
	beq _081068E6\n\
	subs r0, 0x1\n\
	b _081068E4\n\
	.align 2, 0\n\
_08106874: .4byte gPaletteFade\n\
_08106878: .4byte gUnknown_03000756\n\
_0810687C: .4byte gUnknown_03000754\n\
_08106880:\n\
	ldr r0, _081068B4 @ =gMain\n\
	ldrh r2, [r0, 0x2E]\n\
	ands r1, r2\n\
	cmp r1, 0\n\
	bne _08106892\n\
	movs r0, 0x2\n\
	ands r0, r2\n\
	cmp r0, 0\n\
	beq _081068A4\n\
_08106892:\n\
	movs r0, 0x2\n\
	strb r0, [r3]\n\
	subs r0, 0x3\n\
	movs r1, 0\n\
	str r1, [sp]\n\
	movs r2, 0\n\
	movs r3, 0x10\n\
	bl BeginNormalPaletteFade\n\
_081068A4:\n\
	ldr r0, _081068B8 @ =gUnknown_03000756\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _081068E6\n\
	ldr r1, _081068BC @ =gUnknown_03000754\n\
	movs r0, 0\n\
	b _081068E4\n\
	.align 2, 0\n\
_081068B4: .4byte gMain\n\
_081068B8: .4byte gUnknown_03000756\n\
_081068BC: .4byte gUnknown_03000754\n\
_081068C0:\n\
	ldr r0, _081068EC @ =gPaletteFade\n\
	ldrb r1, [r0, 0x7]\n\
	movs r0, 0x80\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _081068D2\n\
	ldr r0, _081068F0 @ =CB2_QuitContestPainting\n\
	bl SetMainCallback2\n\
_081068D2:\n\
	ldr r0, _081068F4 @ =gUnknown_03000756\n\
	ldrb r0, [r0]\n\
	cmp r0, 0\n\
	beq _081068E6\n\
	ldr r1, _081068F8 @ =gUnknown_03000754\n\
	ldrh r0, [r1]\n\
	cmp r0, 0x1D\n\
	bhi _081068E6\n\
	adds r0, 0x1\n\
_081068E4:\n\
	strh r0, [r1]\n\
_081068E6:\n\
	add sp, 0x4\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_081068EC: .4byte gPaletteFade\n\
_081068F0: .4byte CB2_QuitContestPainting\n\
_081068F4: .4byte gUnknown_03000756\n\
_081068F8: .4byte gUnknown_03000754\n\
    .syntax divided\n");
}

void ContestPaintingInitWindow(u8 arg0) {
    InitMenuWindow(&gWindowConfig_81E7160);
    SetUpWindowConfig(&gWindowConfig_81E7160);
}

void ContestPaintingPrintCaption(u8 contestType, u8 arg1) {
    u8 xPos, yPos;
    u8 *ptr;
    u8 type;

    if (arg1 == TRUE) {
        return;
    }

    ptr = gUnknown_03005E40;
    type = gUnknown_03005E8C->contestType;
    if (contestType < 8) {
        ptr = StringCopy(ptr, gUnknown_083F60AC[type]);
        ptr = StringCopy(ptr, gContestText_ContestWinner);
        ptr = StringCopy(ptr, gUnknown_03005E8C->trainer_name);

        // {ENG}
        ptr[0] = 0xFC;
        ptr[1] = 0x16;
        ptr += 2;

        ptr = StringCopy(ptr, gOtherText_Unknown1);
        ptr = StringCopy10(ptr, gUnknown_03005E8C->pokemon_name);

        xPos = 6;
        yPos = 14;
    } else {
        ptr = StringCopy(ptr, *gUnknown_083F60C0[type].prefix);
        ptr = StringCopy10(ptr, gUnknown_03005E8C->pokemon_name);
        ptr = StringCopy(ptr, *gUnknown_083F60C0[type].suffix);

        xPos = 3;
        yPos = 14;
    }

    MenuPrint_PixelCoords(gUnknown_03005E40, xPos * 8 + 1, yPos * 8, 1);
}

void ContestPaintingInitBG(void) {
    REG_DISPCNT = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_BG0CNT = 0x0C42;
    REG_BG1CNT = 0x0A45;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
}

void ContestPaintingInitVars(bool8 arg0) {
    if (arg0 == 0) {
        gUnknown_03000756.var_0 = FALSE;
        gUnknown_03000752 = 0;
        gUnknown_03000754 = 0;
    } else {
        gUnknown_03000756.var_0 = TRUE;
        gUnknown_03000752 = 15;
        gUnknown_03000754 = 30;
    }
}

void ContestPaintingMosaic(void) {
    if (gUnknown_03000756.var_0 == FALSE) {
        REG_MOSAIC = 0;
        return;
    }

    REG_BG1CNT = 0xA45;
    gUnknown_03000752 = gUnknown_03000754 / 2;

    REG_MOSAIC = (gUnknown_03000752 << 12) | (gUnknown_03000752 << 8) | (gUnknown_03000752 << 4) | (gUnknown_03000752 << 0);
}

void VBlankCB_ContestPainting(void) {
    ContestPaintingMosaic();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

struct MonCoords {
    u8 x, y;
};

#ifdef NONMATCHING
void sub_8106AC4(u16 species, u8 arg1) {
    void *pal;

    // Unsure what gUnknown_03005E8C->var0 is supposed to be.
    pal = species_and_otid_get_pal(species, gUnknown_03005E8C->var4, gUnknown_03005E8C->var0);
    LZDecompressVram(pal, gUnknown_03005E90);

    if (arg1 == 1) {
        HandleLoadSpecialPokePic(
                &gMonFrontPicTable[species],
                gMonFrontPicCoords[species].x,
                gMonFrontPicCoords[species].y,
                0x2000000,
                gUnknown_081FAF4C[1],
                species,
                (u32) gUnknown_03005E8C->var0
        );
        sub_8106B90(gUnknown_081FAF4C[1], gUnknown_03005E90, gUnknown_03005E10);
    } else {
        HandleLoadSpecialPokePic(
                &gMonBackPicTable[species],
                gMonBackPicCoords[species].x,
                gMonBackPicCoords[species].y,
                0x2000000,
                gUnknown_081FAF4C[0],
                species,
                (u32) gUnknown_03005E8C->var0
        );
        sub_8106B90(gUnknown_081FAF4C[0], gUnknown_03005E90, gUnknown_03005E10);
    }
}
#else
__attribute__((naked))
void sub_8106AC4(u16 arg0, u8 arg2) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r8\n\
	push {r7}\n\
	sub sp, 0xC\n\
	adds r4, r1, 0\n\
	lsls r0, 16\n\
	lsrs r6, r0, 16\n\
	lsls r4, 24\n\
	lsrs r4, 24\n\
	ldr r7, _08106B28 @ =gUnknown_03005E8C\n\
	ldr r0, [r7]\n\
	ldr r1, [r0, 0x4]\n\
	ldr r2, [r0]\n\
	adds r0, r6, 0\n\
	bl species_and_otid_get_pal\n\
	ldr r1, _08106B2C @ =gUnknown_03005E90\n\
	mov r8, r1\n\
	ldr r1, [r1]\n\
	bl LZDecompressVram\n\
	cmp r4, 0\n\
	bne _08106B40\n\
	lsls r0, r6, 3\n\
	ldr r1, _08106B30 @ =gMonFrontPicTable\n\
	adds r0, r1\n\
	ldr r1, _08106B34 @ =gMonFrontPicCoords\n\
	lsls r2, r6, 2\n\
	adds r2, r1\n\
	ldrb r1, [r2]\n\
	ldrb r2, [r2, 0x1]\n\
	movs r3, 0x80\n\
	lsls r3, 18\n\
	ldr r4, _08106B38 @ =gUnknown_081FAF4C\n\
	ldr r5, [r4, 0x4]\n\
	str r5, [sp]\n\
	str r6, [sp, 0x4]\n\
	ldr r4, [r7]\n\
	ldr r4, [r4]\n\
	str r4, [sp, 0x8]\n\
	bl HandleLoadSpecialPokePic\n\
	mov r2, r8\n\
	ldr r1, [r2]\n\
	ldr r0, _08106B3C @ =gUnknown_03005E10\n\
	ldr r2, [r0]\n\
	adds r0, r5, 0\n\
	bl sub_8106B90\n\
	b _08106B74\n\
	.align 2, 0\n\
_08106B28: .4byte gUnknown_03005E8C\n\
_08106B2C: .4byte gUnknown_03005E90\n\
_08106B30: .4byte gMonFrontPicTable\n\
_08106B34: .4byte gMonFrontPicCoords\n\
_08106B38: .4byte gUnknown_081FAF4C\n\
_08106B3C: .4byte gUnknown_03005E10\n\
_08106B40:\n\
	lsls r0, r6, 3\n\
	ldr r1, _08106B80 @ =gMonBackPicTable\n\
	adds r0, r1\n\
	ldr r1, _08106B84 @ =gMonBackPicCoords\n\
	lsls r2, r6, 2\n\
	adds r2, r1\n\
	ldrb r1, [r2]\n\
	ldrb r2, [r2, 0x1]\n\
	movs r3, 0x80\n\
	lsls r3, 18\n\
	ldr r4, _08106B88 @ =gUnknown_081FAF4C\n\
	ldr r5, [r4]\n\
	str r5, [sp]\n\
	str r6, [sp, 0x4]\n\
	ldr r4, [r7]\n\
	ldr r4, [r4]\n\
	str r4, [sp, 0x8]\n\
	bl HandleLoadSpecialPokePic\n\
	mov r0, r8\n\
	ldr r1, [r0]\n\
	ldr r0, _08106B8C @ =gUnknown_03005E10\n\
	ldr r2, [r0]\n\
	adds r0, r5, 0\n\
	bl sub_8106B90\n\
_08106B74:\n\
	add sp, 0xC\n\
	pop {r3}\n\
	mov r8, r3\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08106B80: .4byte gMonBackPicTable\n\
_08106B84: .4byte gMonBackPicCoords\n\
_08106B88: .4byte gUnknown_081FAF4C\n\
_08106B8C: .4byte gUnknown_03005E10\n\
    .syntax divided\n");
}
#endif

__attribute__((naked))
void sub_8106B90() {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0xC\n\
	mov r10, r0\n\
	mov r9, r1\n\
	str r2, [sp]\n\
	movs r0, 0\n\
_08106BA4:\n\
	movs r3, 0\n\
	adds r1, r0, 0x1\n\
	str r1, [sp, 0x4]\n\
	lsls r0, 3\n\
	str r0, [sp, 0x8]\n\
_08106BAE:\n\
	movs r1, 0\n\
	adds r2, r3, 0x1\n\
	mov r8, r2\n\
	ldr r7, [sp, 0x8]\n\
	adds r0, r7, r3\n\
	lsls r0, 5\n\
	mov r12, r0\n\
	lsls r4, r3, 3\n\
_08106BBE:\n\
	movs r3, 0\n\
	lsls r0, r1, 2\n\
	adds r6, r1, 0x1\n\
	mov r2, r12\n\
	adds r5, r2, r0\n\
	ldr r7, [sp, 0x8]\n\
	adds r0, r7, r1\n\
	lsls r0, 7\n\
	ldr r1, [sp]\n\
	adds r2, r0, r1\n\
_08106BD2:\n\
	lsrs r0, r3, 1\n\
	adds r0, r5, r0\n\
	add r0, r10\n\
	ldrb r1, [r0]\n\
	movs r0, 0x1\n\
	ands r0, r3\n\
	cmp r0, 0\n\
	beq _08106BE6\n\
	lsrs r1, 4\n\
	b _08106BEA\n\
_08106BE6:\n\
	movs r0, 0xF\n\
	ands r1, r0\n\
_08106BEA:\n\
	cmp r1, 0\n\
	bne _08106BFC\n\
	adds r0, r4, r3\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	movs r7, 0x80\n\
	lsls r7, 8\n\
	adds r1, r7, 0\n\
	b _08106C08\n\
_08106BFC:\n\
	adds r0, r4, r3\n\
	lsls r0, 1\n\
	adds r0, r2\n\
	lsls r1, 1\n\
	add r1, r9\n\
	ldrh r1, [r1]\n\
_08106C08:\n\
	strh r1, [r0]\n\
	adds r0, r3, 0x1\n\
	lsls r0, 16\n\
	lsrs r3, r0, 16\n\
	cmp r3, 0x7\n\
	bls _08106BD2\n\
	lsls r0, r6, 16\n\
	lsrs r1, r0, 16\n\
	cmp r1, 0x7\n\
	bls _08106BBE\n\
	mov r1, r8\n\
	lsls r0, r1, 16\n\
	lsrs r3, r0, 16\n\
	cmp r3, 0x7\n\
	bls _08106BAE\n\
	ldr r2, [sp, 0x4]\n\
	lsls r0, r2, 16\n\
	lsrs r0, 16\n\
	cmp r0, 0x7\n\
	bls _08106BA4\n\
	add sp, 0xC\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
    .syntax divided\n");
}

#ifdef NONMATCHING
void sub_8106C40(u8 arg0, u8 arg1) {
    LoadPalette(gPictureFramePalettes, 0, 128 * 2);

    if (arg1 == 1) {
        switch (gUnknown_03005E8C->contestType / 3) {
            case CONTEST_COOL:
                RLUnCompVram(gPictureFrameTiles_0, (void *) VRAM);
                RLUnCompWram(gPictureFrameTilemap_0, gUnknown_03005E10);
                break;

            case CONTEST_BEAUTY:
                RLUnCompVram(gPictureFrameTiles_1, (void *) VRAM);
                RLUnCompWram(gPictureFrameTilemap_1, gUnknown_03005E10);
                break;

            case CONTEST_CUTE:
                RLUnCompVram(gPictureFrameTiles_2, (void *) VRAM);
                RLUnCompWram(gPictureFrameTilemap_2, gUnknown_03005E10);
                break;

            case CONTEST_SMART:
                RLUnCompVram(gPictureFrameTiles_3, (void *) VRAM);
                RLUnCompWram(gPictureFrameTilemap_3, gUnknown_03005E10);
                break;

            case CONTEST_TOUGH:
                RLUnCompVram(gPictureFrameTiles_4, (void *) VRAM);
                RLUnCompWram(gPictureFrameTilemap_4, gUnknown_03005E10);
                break;
        }

        {
            u8 x;
            u8 y;

            u16 (*vram)[32][32] = (void *) (VRAM + 0x6000);

            // Set the background
            for (y = 0; y < 20; y++) {
                for (x = 0; x < 32; x++) {
                    (*vram)[y][x] = 1 << 12 | 21;
                }
            }

            // Copy the image frame
            for (y = 0; y < 10; y++) {
                for (x = 0; x < 18; x++) {
                    (*vram)[y + 2][x + 6] = (*gUnknown_03005E10)[y + 2][x + 6];
                }
            }

            // Re-set the entire top row to the first top frame part
            for (x = 0; x < 16; x++) {
                (*vram)[2][x + 7] = (*gUnknown_03005E10)[2][7];
            }
        }

        // def_8106C7A
    } else {
        if (arg0 < 8) {
            RLUnCompVram(gPictureFrameTiles_5, (void *) VRAM);
            RLUnCompVram(gPictureFrameTilemap_5, (void *) (VRAM + 0x6000));
            return;
        }

        switch (gUnknown_03005E8C->contestType / 3) {
            case CONTEST_COOL:
                RLUnCompVram(gPictureFrameTiles_0, (void *) VRAM);
                RLUnCompVram(gPictureFrameTilemap_0, (void *) (VRAM + 0x6000));
                break;

            case CONTEST_BEAUTY:
                RLUnCompVram(gPictureFrameTiles_1, (void *) VRAM);
                RLUnCompVram(gPictureFrameTilemap_1, (void *) (VRAM + 0x6000));
                break;

            case CONTEST_CUTE:
                RLUnCompVram(gPictureFrameTiles_2, (void *) VRAM);
                RLUnCompVram(gPictureFrameTilemap_2, (void *) (VRAM + 0x6000));
                break;

            case CONTEST_SMART:
                RLUnCompVram(gPictureFrameTiles_3, (void *) VRAM);
                RLUnCompVram(gPictureFrameTilemap_3, (void *) (VRAM + 0x6000));
                break;

            case CONTEST_TOUGH:
                RLUnCompVram(gPictureFrameTiles_4, (void *) VRAM);
                RLUnCompVram(gPictureFrameTilemap_4, (void *) (VRAM + 0x6000));
                break;
        }
    }
}
#else
__attribute__((naked))
void sub_8106C40(u8 arg0, u8 arg1) {
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	adds r4, r1, 0\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	lsls r4, 24\n\
	lsrs r4, 24\n\
	ldr r0, _08106C7C @ =gPictureFramePalettes\n\
	movs r2, 0x80\n\
	lsls r2, 1\n\
	movs r1, 0\n\
	bl LoadPalette\n\
	cmp r4, 0x1\n\
	beq _08106C5E\n\
	b _08106DB4\n\
_08106C5E:\n\
	ldr r0, _08106C80 @ =gUnknown_03005E8C\n\
	ldr r0, [r0]\n\
	ldrb r0, [r0, 0xA]\n\
	movs r1, 0x3\n\
	bl __udivsi3\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x4\n\
	bhi _08106D1C\n\
	lsls r0, 2\n\
	ldr r1, _08106C84 @ =_08106C88\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_08106C7C: .4byte gPictureFramePalettes\n\
_08106C80: .4byte gUnknown_03005E8C\n\
_08106C84: .4byte _08106C88\n\
	.align 2, 0\n\
_08106C88:\n\
	.4byte _08106C9C\n\
	.4byte _08106CB4\n\
	.4byte _08106CCC\n\
	.4byte _08106CE4\n\
	.4byte _08106D08\n\
_08106C9C:\n\
	ldr r0, _08106CAC @ =gPictureFrameTiles_0\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106CB0 @ =gPictureFrameTilemap_0\n\
	b _08106CF0\n\
	.align 2, 0\n\
_08106CAC: .4byte gPictureFrameTiles_0\n\
_08106CB0: .4byte gPictureFrameTilemap_0\n\
_08106CB4:\n\
	ldr r0, _08106CC4 @ =gPictureFrameTiles_1\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106CC8 @ =gPictureFrameTilemap_1\n\
	b _08106CF0\n\
	.align 2, 0\n\
_08106CC4: .4byte gPictureFrameTiles_1\n\
_08106CC8: .4byte gPictureFrameTilemap_1\n\
_08106CCC:\n\
	ldr r0, _08106CDC @ =gPictureFrameTiles_2\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106CE0 @ =gPictureFrameTilemap_2\n\
	b _08106CF0\n\
	.align 2, 0\n\
_08106CDC: .4byte gPictureFrameTiles_2\n\
_08106CE0: .4byte gPictureFrameTilemap_2\n\
_08106CE4:\n\
	ldr r0, _08106CFC @ =gPictureFrameTiles_3\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106D00 @ =gPictureFrameTilemap_3\n\
_08106CF0:\n\
	ldr r1, _08106D04 @ =gUnknown_03005E10\n\
	ldr r1, [r1]\n\
	bl RLUnCompWram\n\
	b _08106D1C\n\
	.align 2, 0\n\
_08106CFC: .4byte gPictureFrameTiles_3\n\
_08106D00: .4byte gPictureFrameTilemap_3\n\
_08106D04: .4byte gUnknown_03005E10\n\
_08106D08:\n\
	ldr r0, _08106D98 @ =gPictureFrameTiles_4\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106D9C @ =gPictureFrameTilemap_4\n\
	ldr r1, _08106DA0 @ =gUnknown_03005E10\n\
	ldr r1, [r1]\n\
	bl RLUnCompWram\n\
_08106D1C:\n\
	movs r1, 0\n\
	ldr r5, _08106DA4 @ =0x06006000\n\
	ldr r0, _08106DA8 @ =0x00001015\n\
	adds r4, r0, 0\n\
_08106D24:\n\
	movs r3, 0\n\
	lsls r2, r1, 5\n\
_08106D28:\n\
	adds r0, r2, r3\n\
	lsls r0, 1\n\
	adds r0, r5\n\
	strh r4, [r0]\n\
	adds r0, r3, 0x1\n\
	lsls r0, 24\n\
	lsrs r3, r0, 24\n\
	cmp r3, 0x1F\n\
	bls _08106D28\n\
	adds r0, r1, 0x1\n\
	lsls r0, 24\n\
	lsrs r1, r0, 24\n\
	cmp r1, 0x13\n\
	bls _08106D24\n\
	movs r1, 0\n\
	ldr r0, _08106DAC @ =0x0600608c\n\
	mov r12, r0\n\
	ldr r7, _08106DA0 @ =gUnknown_03005E10\n\
_08106D4C:\n\
	movs r3, 0\n\
	adds r6, r1, 0x1\n\
	lsls r5, r1, 5\n\
	lsls r4, r1, 6\n\
_08106D54:\n\
	adds r2, r5, r3\n\
	lsls r2, 1\n\
	add r2, r12\n\
	ldr r0, [r7]\n\
	adds r0, r4, r0\n\
	lsls r1, r3, 1\n\
	adds r0, r1\n\
	adds r0, 0x8C\n\
	ldrh r0, [r0]\n\
	strh r0, [r2]\n\
	adds r0, r3, 0x1\n\
	lsls r0, 24\n\
	lsrs r3, r0, 24\n\
	cmp r3, 0x11\n\
	bls _08106D54\n\
	lsls r0, r6, 24\n\
	lsrs r1, r0, 24\n\
	cmp r1, 0x9\n\
	bls _08106D4C\n\
	movs r3, 0\n\
	ldr r4, _08106DB0 @ =0x0600608e\n\
	ldr r2, _08106DA0 @ =gUnknown_03005E10\n\
_08106D80:\n\
	lsls r1, r3, 1\n\
	adds r1, r4\n\
	ldr r0, [r2]\n\
	adds r0, 0x8E\n\
	ldrh r0, [r0]\n\
	strh r0, [r1]\n\
	adds r0, r3, 0x1\n\
	lsls r0, 24\n\
	lsrs r3, r0, 24\n\
	cmp r3, 0xF\n\
	bls _08106D80\n\
	b _08106E86\n\
	.align 2, 0\n\
_08106D98: .4byte gPictureFrameTiles_4\n\
_08106D9C: .4byte gPictureFrameTilemap_4\n\
_08106DA0: .4byte gUnknown_03005E10\n\
_08106DA4: .4byte 0x06006000\n\
_08106DA8: .4byte 0x00001015\n\
_08106DAC: .4byte 0x0600608c\n\
_08106DB0: .4byte 0x0600608e\n\
_08106DB4:\n\
	cmp r5, 0x7\n\
	bhi _08106DD0\n\
	ldr r0, _08106DC8 @ =gPictureFrameTiles_5\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106DCC @ =gPictureFrameTilemap_5\n\
	b _08106E60\n\
	.align 2, 0\n\
_08106DC8: .4byte gPictureFrameTiles_5\n\
_08106DCC: .4byte gPictureFrameTilemap_5\n\
_08106DD0:\n\
	ldr r0, _08106DF0 @ =gUnknown_03005E8C\n\
	ldr r0, [r0]\n\
	ldrb r0, [r0, 0xA]\n\
	movs r1, 0x3\n\
	bl __udivsi3\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x4\n\
	bhi _08106E86\n\
	lsls r0, 2\n\
	ldr r1, _08106DF4 @ =_08106DF8\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_08106DF0: .4byte gUnknown_03005E8C\n\
_08106DF4: .4byte _08106DF8\n\
	.align 2, 0\n\
_08106DF8:\n\
	.4byte _08106E0C\n\
	.4byte _08106E24\n\
	.4byte _08106E3C\n\
	.4byte _08106E54\n\
	.4byte _08106E74\n\
_08106E0C:\n\
	ldr r0, _08106E1C @ =gPictureFrameTiles_0\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106E20 @ =gPictureFrameTilemap_0\n\
	b _08106E60\n\
	.align 2, 0\n\
_08106E1C: .4byte gPictureFrameTiles_0\n\
_08106E20: .4byte gPictureFrameTilemap_0\n\
_08106E24:\n\
	ldr r0, _08106E34 @ =gPictureFrameTiles_1\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106E38 @ =gPictureFrameTilemap_1\n\
	b _08106E60\n\
	.align 2, 0\n\
_08106E34: .4byte gPictureFrameTiles_1\n\
_08106E38: .4byte gPictureFrameTilemap_1\n\
_08106E3C:\n\
	ldr r0, _08106E4C @ =gPictureFrameTiles_2\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106E50 @ =gPictureFrameTilemap_2\n\
	b _08106E60\n\
	.align 2, 0\n\
_08106E4C: .4byte gPictureFrameTiles_2\n\
_08106E50: .4byte gPictureFrameTilemap_2\n\
_08106E54:\n\
	ldr r0, _08106E68 @ =gPictureFrameTiles_3\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106E6C @ =gPictureFrameTilemap_3\n\
_08106E60:\n\
	ldr r1, _08106E70 @ =0x06006000\n\
	bl RLUnCompVram\n\
	b _08106E86\n\
	.align 2, 0\n\
_08106E68: .4byte gPictureFrameTiles_3\n\
_08106E6C: .4byte gPictureFrameTilemap_3\n\
_08106E70: .4byte 0x06006000\n\
_08106E74:\n\
	ldr r0, _08106E8C @ =gPictureFrameTiles_4\n\
	movs r1, 0xC0\n\
	lsls r1, 19\n\
	bl RLUnCompVram\n\
	ldr r0, _08106E90 @ =gPictureFrameTilemap_4\n\
	ldr r1, _08106E94 @ =0x06006000\n\
	bl RLUnCompVram\n\
_08106E86:\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08106E8C: .4byte gPictureFrameTiles_4\n\
_08106E90: .4byte gPictureFrameTilemap_4\n\
_08106E94: .4byte 0x06006000\n\
    .syntax divided\n");
}
#endif

#ifdef NONMATCHING
void sub_8106E98(u8 arg0 ) {
    gMain.oamBuffer[0] = gOamData_83F6138;

    gMain.oamBuffer[0].tileNum = 0;
    gMain.oamBuffer[0].x = 88;
    gMain.oamBuffer[0].y = 24;
}
#else
__attribute__((naked))
void sub_8106E98(u8 arg0) {
    asm(".syntax unified\n\
	push {r4,lr}\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	ldr r4, _08106ED0 @ =gMain\n\
	ldr r1, _08106ED4 @ =gOamData_83F6138\n\
	ldr r2, [r1, 0x4]\n\
	ldr r1, [r1]\n\
	str r1, [r4, 0x3C]\n\
	str r2, [r4, 0x40]\n\
	adds r3, r4, 0\n\
	adds r3, 0x40\n\
	ldrh r2, [r3]\n\
	ldr r1, _08106ED8 @ =0xfffffc00\n\
	ands r1, r2\n\
	strh r1, [r3]\n\
	ldrh r1, [r4, 0x3E]\n\
	ldr r0, _08106EDC @ =0xfffffe00\n\
	ands r0, r1\n\
	movs r1, 0x58\n\
	orrs r0, r1\n\
	strh r0, [r4, 0x3E]\n\
	adds r1, r4, 0\n\
	adds r1, 0x3C\n\
	movs r0, 0x18\n\
	strb r0, [r1]\n\
	pop {r4}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08106ED0: .4byte gMain\n\
_08106ED4: .4byte gOamData_83F6138\n\
_08106ED8: .4byte 0xfffffc00\n\
_08106EDC: .4byte 0xfffffe00\n\
    .syntax divided\n");
}
#endif

u8 sub_8106EE0(u8 arg0) {
    u8 contestType;

    if (arg0 < 8) {
        contestType = gUnknown_03005E8C->contestType;
    } else {
        contestType = gUnknown_03005E8C->contestType / 3;
    }

    switch (contestType) {
        case CONTEST_COOL:
            return CONTESTRESULT_COOL;

        case CONTEST_BEAUTY:
            return CONTESTRESULT_BEAUTY;

        case CONTEST_CUTE:
            return CONTESTRESULT_CUTE;

        case CONTEST_SMART:
            return CONTESTRESULT_SMART;

        case CONTEST_TOUGH:
            return CONTESTRESULT_TOUGH;
    }

    return contestType;
}

#ifdef NONMATCHING
void sub_8106F4C(void) {
    gUnknown_03005E90 = (void *) 0x02017e00;
    gUnknown_03005E10 = (void *) 0x02015e00;
}
#else
__attribute__((naked))
void sub_8106F4C(void) {
    asm(".syntax unified\n\
	ldr r0, _08106F5C @ =gUnknown_03005E90\n\
	ldr r1, _08106F60 @ =0x02017e00\n\
	str r1, [r0]\n\
	ldr r0, _08106F64 @ =gUnknown_03005E10\n\
	ldr r2, _08106F68 @ =0xffffe000\n\
	adds r1, r2\n\
	str r1, [r0]\n\
	bx lr\n\
	.align 2, 0\n\
_08106F5C: .4byte gUnknown_03005E90\n\
_08106F60: .4byte 0x02017e00\n\
_08106F64: .4byte gUnknown_03005E10\n\
_08106F68: .4byte 0xffffe000\n\
    .syntax divided\n");
}
#endif

void sub_8106F6C(u8 arg0) {
    gUnknown_03005E20.var_4 = gUnknown_03005E10;
    gUnknown_03005E20.var_8 = gUnknown_03005E90;
    gUnknown_03005E20.var_18 = 0;
    gUnknown_03005E20.var_1F = gUnknown_03005E8C->var0;
    gUnknown_03005E20.var_19 = 0;
    gUnknown_03005E20.var_1A = 0;
    gUnknown_03005E20.var_1B = 64;
    gUnknown_03005E20.var_1C = 64;
    gUnknown_03005E20.var_1D = 64;
    gUnknown_03005E20.var_1E = 64;

    switch (arg0) {
        case CONTESTRESULT_SMART:
        case CONTESTRESULT_TOUGH:
            gUnknown_03005E20.var_14 = 3;
            break;

        case CONTESTRESULT_COOL:
        case CONTESTRESULT_BEAUTY:
        case CONTESTRESULT_CUTE:
        default:
            gUnknown_03005E20.var_14 = 1;
            break;
    }

    gUnknown_03005E20.var_16 = 2;
    gUnknown_03005E20.var_0 = arg0;
    gUnknown_03005E20.var_10 = 0x6010000;

    sub_80FC7A0(&gUnknown_03005E20);
    sub_80FDA18(&gUnknown_03005E20);
    sub_80FD8CC(&gUnknown_03005E20);

    LoadPalette(gUnknown_03005E90, 256, 256 * 2);
}

void sub_8107090(u8 arg0, u8 arg1) {
    u8 local0;

    sub_8106F4C();
    sub_8106AC4(gUnknown_03005E8C->var8, 0);

    local0 = sub_8106EE0(arg0);
    sub_8106F6C(local0);

    sub_8106E98(arg0);
    sub_8106C40(arg0, arg1);
}
