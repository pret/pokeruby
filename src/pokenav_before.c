#include "global.h"
#include "main.h"
#include "pokenav.h"
#include "battle.h"
#include "data2.h"
#include "de_rom_8040FE0.h"
#include "string_util.h"
#include "rom4.h"
#include "palette.h"
#include "task.h"
#include "unknown_task.h"
#include "sound.h"
#include "region_map.h"
#include "songs.h"
#include "flags.h"

struct UnknownPokenav0 {
	/* 0x0000 */ u8 fill0000[0x0300];
	/* 0x0300 */ void (*var300)(void);
	/* 0x0304 */ u16 var304;
	/* 0x0306 */ u8 fill0306;
	/* 0x0308 */ u32 var308;
	/* 0x030C */ u8 fill030C[0x6a9f];
	/* 0x6dab */ u8 var6dab;
	/* 0x6dac */ u8 var6dac;
	/* 0x6dad */ u8 var6dad;
	/* 0x6dae */ u8 var6dae;
	/* 0x6daf */ u8 fill6daf[0x3];
	/* 0x6db2 */ u8 var6db2;
	/* 0x6db3 */ u8 fill6db3[0x29];
	/* 0x6ddc */ u8 var6ddc;
	/* 0x6ddd */ u8 fill6ddd[0x198b];
	/* 0x8768 */ u32 var8768;
	/* 0x876C */ u8 fill876B[0x00bc];
	/* 0x8828 */ u8 var8828;
	/* 0x8829 */ u8 fill8829[0x07c0];
	/* 0x8FE8 */ u8 var8fe8;
	/* 0x8FE9 */ u8 fill8FE9[0x035B];
	/* 0x9344 */ u8 var9344;
	/* 0x9345 */ u8 fill9345[0x3b8b];
	/* 0xced0 */ u32 varCED0;
};

struct UnknownPokenav8fff {
	/* 0x8fff */ u8 var8fff[5];
	/* 0x9004 */ u8 fill9004[0x6e90];
	/* 0x6e95 */ u8 var6e95;
};


extern u8 ewram[];
#define ewram0 (*(struct UnknownPokenav0*)(ewram + 0))
#define ewram8fff (*(struct UnknownPokenav8fff*)(ewram + 0x8fff))
extern u8 unk_2000000[];

extern void sub_80F1A90();
extern bool8 sub_80F1AC4();
extern void sub_80F36F0();
extern bool8 sub_80F3724();
extern void sub_80EBC10();
extern void sub_80EBDBC(void (*func)(void));
extern void sub_80EBBE8();
extern bool8 sub_80F26BC(void);
extern void sub_80EBDD8();
extern void sub_80EBD90();
extern void sub_80EBD18();
extern void sub_80F1A74();
extern void sub_80F1FF0();
extern void sub_80FB260();
extern void sub_80EFE7C();
extern void sub_80F5BF0();
extern void sub_80F6F64();
extern void _call_via_r0(void (*func)(void));
extern void sub_80F19FC();

void sub_80EBA5C() {
	switch (gMain.state) {
		default:
			gMain.state = 0;
		case 0:
			ewram0.var6dac = is_c1_link_related_active();
			if (!ewram0.var6dac) {
				ewram0.var6dab = 0;
				gMain.state++;
				SetMainCallback2(&sub_80EBBE8);
				break;
			} 
			break;
		case 1:
			SetVBlankCallback(NULL);
			break;
		case 2:
			ResetPaletteFade();
			break;
		case 3:
			ResetSpriteData();
			break;
		case 4:
			FreeAllSpritePalettes();
			break;
		case 5:
			ResetTasks();
			break;
		case 6:
			remove_some_task();
			break;
		case 7:
			sub_80F1A90();
			gMain.state++;
		case 8: 
			if (sub_80F1AC4()) return;
			break;
		case 9:
			sub_80F2688();
			gMain.state++;

		case 0xA:
			if (sub_80F26BC()) return;
			break;
		case 0xB:
			sub_80F36F0();
			gMain.state++;
		case 0xC:
			if (sub_80F3724()) return;
			break;
		case 0xD:
			sub_80EBC10();
			sub_80EBDBC(&sub_80EBDD8);
			break;
		case 0xE:
			ewram0.var6dab = 1;
			PlaySE(SE_PN_ON);
			SetMainCallback2(&sub_80EBD90);
			SetVBlankCallback(&sub_80EBD18);
			sub_80F1A74();
			break;
	}
	gMain.state++;
}

void sub_80EBBE8() {
	u8 var1;
	if (!ewram0.var6dab) {
		var1 = ewram0.var6dab;
		do {
			sub_80EBA5C();
			var1 = ewram0.var6dab;
		} while (!var1);
	}
}

// Falla el acceso a 0x8fff
#if 0

u16 gKeyRepeatStartDelay;
void sub_80EBCA8();

//void sub_80EBC10() {
//	u16 i;
//	u16 *unk2;
//	gKeyRepeatStartDelay = 0x14;
//	unk_2000000[0x8828] = CalculatePlayerPartyCount();
//	unk_2000000[0x6ddc] = unk_2000000[0x9344] = 0;
//	*(u32 *)&unk_2000000[0x8768] = 0;
//	*(u32 *)&unk_2000000[0xced0] = 0;
//	for (i = 0; i <= 4; ++i) {
//		unk_2000000[0x8fff + i] = 0;
//		unk2 = (u16 *)unk_2000000;
//		unk2[i*2 + 0x4820] = 0x9B;
//		unk2[i*2 + 0x4821] = 0x5B;
//	}
//	unk_2000000[0x8fff + 0x6e95] = 0;
//	sub_80EBCA8();
//}
void sub_80EBC10() {
	u16 i;
	u16 *unk2;
	gKeyRepeatStartDelay = 0x14;
	ewram0.var8828 = CalculatePlayerPartyCount();
	ewram0.var6ddc = 0; 
	ewram0.var9344 = 0;
	ewram0.var8768 = 0;
	ewram0.varCED0 = 0;
	for (i = 0; i <= 4; ++i) {
		ewram8fff.var8fff[i] = 0;
		unk2 = (u16 *)ewram;
		unk2[i*2 + 0x4820] = 0x9B;
		unk2[i*2 + 0x4821] = 0x5B;
	}
	ewram8fff.var6e95 = 0;
	sub_80EBCA8();
}

#else

__attribute__((naked))
void sub_80EBC10() {
	asm_unified("push {r4-r7,lr}\n\
	ldr r1, _080EBC7C @ =gKeyRepeatStartDelay\n\
	movs r0, 0x14\n\
	strh r0, [r1]\n\
	bl CalculatePlayerPartyCount\n\
	ldr r2, _080EBC80 @ =0x02000000\n\
	ldr r1, _080EBC84 @ =0x00008828\n\
	adds r3, r2, r1\n\
	movs r1, 0\n\
	strb r0, [r3]\n\
	ldr r3, _080EBC88 @ =0x00006ddc\n\
	adds r0, r2, r3\n\
	strb r1, [r0]\n\
	ldr r3, _080EBC8C @ =0x00009344\n\
	adds r0, r2, r3\n\
	strb r1, [r0]\n\
	ldr r3, _080EBC90 @ =0x00008768\n\
	adds r0, r2, r3\n\
	str r1, [r0]\n\
	ldr r3, _080EBC94 @ =0x0000ced0\n\
	adds r0, r2, r3\n\
	str r1, [r0]\n\
	movs r3, 0\n\
	ldr r0, _080EBC98 @ =0x00008fff\n\
	adds r7, r2, r0\n\
	mov r12, r2\n\
	movs r6, 0\n\
	ldr r5, _080EBC9C @ =0x00009040\n\
	movs r4, 0x9B\n\
_080EBC4C:\n\
	adds r0, r3, r7\n\
	strb r6, [r0]\n\
	lsls r1, r3, 2\n\
	adds r1, r2\n\
	adds r0, r1, r5\n\
	strh r4, [r0]\n\
	ldr r0, _080EBCA0 @ =0x00009042\n\
	adds r1, r0\n\
	movs r0, 0x5B\n\
	strh r0, [r1]\n\
	adds r0, r3, 0x1\n\
	lsls r0, 16\n\
	lsrs r3, r0, 16\n\
	cmp r3, 0x4\n\
	bls _080EBC4C\n\
	ldr r1, _080EBCA4 @ =0x00006e95\n\
	add r1, r12\n\
	movs r0, 0\n\
	strb r0, [r1]\n\
	bl sub_80EBCA8\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080EBC7C: .4byte gKeyRepeatStartDelay\n\
_080EBC80: .4byte 0x02000000\n\
_080EBC84: .4byte 0x00008828\n\
_080EBC88: .4byte 0x00006ddc\n\
_080EBC8C: .4byte 0x00009344\n\
_080EBC90: .4byte 0x00008768\n\
_080EBC94: .4byte 0x0000ced0\n\
_080EBC98: .4byte 0x00008fff\n\
_080EBC9C: .4byte 0x00009040\n\
_080EBCA0: .4byte 0x00009042\n\
_080EBCA4: .4byte 0x00006e95\n");
}
#endif

void sub_80EBCA8() {
	unk_2000000[0x6db2] = 1;
	unk_2000000[0x6db3] = 2;
	unk_2000000[0x6db4] = 3;
	if (FlagGet(SYS_RIBBON_GET)) {
		unk_2000000[0x6db5] = 4;
	}
	else {
		unk_2000000[0x6db5] = 0;
	}
		unk_2000000[0x6db6] = 5;
}

void sub_80EBD18() {
	LoadOam();
	ProcessSpriteCopyRequests();
	TransferPlttBuffer();
	sub_80F1FF0();
}

void sub_80EBD30() {
	LoadOam();
	ProcessSpriteCopyRequests();
	TransferPlttBuffer();
	UpdateRegionMapVideoRegs();
	sub_80EFE7C();
}

void sub_80EBD4C() {
	LoadOam();
	ProcessSpriteCopyRequests();
	TransferPlttBuffer();
	sub_80F5BF0();
	sub_8089668();
}

void sub_80EBD68() {
	LoadOam();
	ProcessSpriteCopyRequests();
	TransferPlttBuffer();
	sub_80F6F64();
}

void sub_80EBD80() {
	LoadOam();
	ProcessSpriteCopyRequests();
}

void sub_80EBD90() {
	_call_via_r0(ewram0.var300);
	AnimateSprites();
	BuildOamBuffer();
	RunTasks();
	UpdatePaletteFade();
	sub_80F19FC();
}

void sub_80EBDBC(void (*func)(void)) {
	ewram0.var300 = func;
	ewram0.var304 = 0;
}

void sub_80F3FF0();
bool8 sub_80F4024();
void sub_80F2598();
void sub_80EEE20();
bool8 sub_80EEE54();
void sub_80EEE08();
void sub_80EF248();
bool8 sub_80EF284();
void sub_80F1B8C();
bool8 sub_80F1BC8(u32 unk);
void sub_80EED2C();
void sub_80F1DF0();
bool8 sub_80F1E50();
void sub_80EF428();
void sub_80EC268();

void sub_80EBDD8() {
	switch (ewram0.var304) {
	case 0:
		SetVBlankCallback(NULL);
		REG_DISPCNT = 0;
		ewram0.var6dad = ewram0.var6ddc;
		ewram0.var6dae = 5;
		ewram0.var304++;
		break;
	case 1:
		sub_80F3FF0();
		ewram0.var304++;
	case 2:
		if (sub_80F4024()) return;
		ewram0.var304++;
		break;
	case 3:
		sub_80F2598();
		ewram0.var304++;
		break;
	case 4:
		sub_80EEE20();
		ewram0.var304++;
	case 5:
		if (sub_80EEE54()) return;
		sub_80EEE08();
		ewram0.var304++;
		return;
	case 6:
		sub_80EF248(0);
		ewram0.var304++;
	case 7:
		if (sub_80EF284(0)) return;
		ewram0.var304++;
		break;
	case 8:
		sub_80F1B8C(0);
		ewram0.var304++;
	case 9:
		if (sub_80F1BC8(0)) return;
		ewram0.var304++;
		break;
	case 10:
		SetVBlankCallback(&sub_80EBD18);
		ewram0.var304++;
		break;
	case 11:
		BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
		ewram0.var304++;
		return;
	case 12:
		sub_80EED2C(0);
		ewram0.var304++;
		return;
	case 13:
		if (gPaletteFade.active) return;
		ewram0.var304++;
		return;
	case 14:
		sub_80F2C80(0);
		ewram0.var304++;
	case 15:
		if (sub_80F2CBC(0)) return;
		ewram0.var304++;
		break;
	case 16:
		sub_80F1DF0();
		ewram0.var304++;
		return;
	case 17:
		if (!sub_80F1E50()) {
			sub_80EF428(0, 0);
			sub_80EBDBC(&sub_80EC268);
		}
		return;
		
	}

}

bool8 sub_80EEF78();
void sub_80EED1C();

void sub_80EC00C() {
	switch (ewram0.var304) {
	case 0:
		if (!sub_80EEF78()) {
			SetVBlankCallback(&sub_80EBD80);
			sub_80EED1C();
			ewram0.var6dad = ewram0.var6ddc;
			ewram0.var6dae = 5;
			sub_80EEE08();
			ewram0.var304++;
		}
		break;
	case 1:
		sub_80EF248(0);
		ewram0.var304++;
	case 2:
		if (sub_80EF284(0)) return;
		ewram0.var304++;
		break;
	case 3:
		sub_80F1B8C(0);
		ewram0.var304++;
	case 4:
		if (sub_80F1BC8(0)) return;
		ewram0.var304++;
		break;
	case 5:
		if (sub_8055870()) return;
		ewram0.var304++;
		break;
	case 6:
		BeginNormalPaletteFade(ewram0.var308, -1, 0x10, 0, 0);
	        SetVBlankCallback(&sub_80EBD18);
		ewram0.var304++;
		break;
	case 7:
		sub_80EED2C(0);
		ewram0.var304++;
		break;
	case 8:
		if (gPaletteFade.active) return;
		ewram0.var304++;
		return;
	case 9:
		sub_80F2598(); 
		ewram0.var304++;
		break;
	case 10:
		sub_80F2C80(0);
		ewram0.var304++;
	case 11:
		if (sub_80F2CBC(0)) return;
		ewram0.var304++;
		return;
	case 12:
		sub_80F1DF0();
		ewram0.var304++;
		return;
        case 13:
		if (sub_80F1E50()) return;
                sub_80EF428(0, ewram0.var6dad);
		sub_80EBDBC(&sub_80EC268);
	}
}

void sub_80F2D04(u32);
void sub_80EE9C0(u32, u8, u32);
bool8 sub_80EEA0C();

void sub_80EC210() {
	switch (ewram0.var304) {
		case 0:
			sub_80F2D04(1);
			sub_80EE9C0(0, ewram0.var6ddc, 0);
			ewram0.var304++;
			break;
		case 1:
			if (sub_80EEA0C()) return;
			sub_80EBDBC(&sub_80EC268);
	}
}

#if 0
bool8 sub_80EEC10();
bool8 sub_80F6250();
void sub_80EED9C();
void sub_80F6208();
void sub_80EDB88();
void sub_80EC4A0();
void sub_80EC81C();
void sub_80F208C();
void sub_80EE96C();

void sub_80EC268() {
	if (ewram0.var304 != 3) {
		// bls -> bgt
		if (ewram0.var304 > 3) {
			if (ewram0.var304 != 6) {
				if (ewram0.var304 > 6) {
					if (ewram0.var304 != 0xFF) return;
					if (sub_80EEC10() == 0) {
						if (gMain.newKeys == (A_BUTTON | B_BUTTON)) return;
				                sub_80EF428(0, ewram0.var6dad);
				                return;
					}
					PlaySE(0x5);
			                sub_80EF428(0, ewram0.var6dad);
					sub_80EED9C();
					return;

				} 
				if (ewram0.var304 != 4) return;
				if (sub_8055870() != 0) return;
				if (ewram0.var8fe8 == 0) {
					PlaySE(0x20);
					sub_80EF428(0, 5);
					ewram0.var304 = 0xFF;
					return;
				}
				PlaySE(0x5);
				sub_80EBDBC(&sub_80EDB88);
				return;
			}
			if (ewram0.var304 != 4) return;
			if (sub_8055870()) return;
			if (!ewram0.var8fe8) {
				PlaySE(0x20);
				sub_80EF428(0, 5);
				ewram0.var304 = 0xFF;
				return;
			}
			PlaySE(5);
			sub_80EBDBC(&sub_80EDB88);
			return;
		}
		if (ewram0.var304 != 1) {
			if (ewram0.var304 < 1) {
				if (ewram0.var304 == 0) {
					if (sub_80EEC10() == 0) {
						if (gMain.newKeys != A_BUTTON) {

						}
						ewram0.var6ddc = ewram0.var6dad;
						// TODO arreglar esto
						switch (ewram0.var6db2) {
						case 1:
							PlaySE(5);
							sub_80EBDBC(&sub_80EC4A0);
							return;
						case 2:
							PlaySE(5);
							sub_80EBDBC(&sub_80EC81C);
							return;
						case 3:
							ewram0.var304 = 6;
							return;
						case 4:
							ewram0.var304 = 2;
							return;
						case 5:
							ewram0.var304 = 1;
							return;
						}
					}
					PlaySE(0x5);
			                sub_80EF428(0, ewram0.var6dad);
					sub_80EED9C();
					return;
				}
			}
			sub_80F6208();
			ewram0.var304++;
			if (sub_80F6250() != 0) return;
			ewram0.var304++;
			return;
		}
		sub_80F208C();
		sub_80EBDBC(&sub_80EE96C);
		return;
	}
	if (sub_80F6250() != 0) return;
	ewram0.var304++;
	return;
}
#else
__attribute__((naked))
void sub_80EC268() {
	asm_unified("push {r4-r6,lr}\n\
	ldr r4, _080EC290 @ =0x02000000\n\
	movs r0, 0xC1\n\
	lsls r0, 2\n\
	adds r6, r4, r0\n\
	ldrh r0, [r6]\n\
	cmp r0, 0x3\n\
	bne _080EC27A\n\
	b _080EC3BE\n\
_080EC27A:\n\
	cmp r0, 0x3\n\
	bgt _080EC294\n\
	cmp r0, 0x1\n\
	bne _080EC284\n\
	b _080EC3A2\n\
_080EC284:\n\
	cmp r0, 0x1\n\
	ble _080EC28A\n\
	b _080EC3B4\n\
_080EC28A:\n\
	cmp r0, 0\n\
	beq _080EC2AE\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC290: .4byte 0x02000000\n\
_080EC294:\n\
	cmp r0, 0x6\n\
	bne _080EC29A\n\
	b _080EC414\n\
_080EC29A:\n\
	cmp r0, 0x6\n\
	bgt _080EC2A6\n\
	cmp r0, 0x4\n\
	bne _080EC2A4\n\
	b _080EC3DC\n\
_080EC2A4:\n\
	b _080EC492\n\
_080EC2A6:\n\
	cmp r0, 0xFF\n\
	bne _080EC2AC\n\
	b _080EC44C\n\
_080EC2AC:\n\
	b _080EC492\n\
_080EC2AE:\n\
	bl sub_80EEC10\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	beq _080EC2D4\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	ldr r1, _080EC2D0 @ =0x00006dad\n\
	adds r0, r4, r1\n\
	ldrb r1, [r0]\n\
	movs r0, 0\n\
	bl sub_80EF428\n\
	bl sub_80EED9C\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC2D0: .4byte 0x00006dad\n\
_080EC2D4:\n\
	ldr r0, _080EC310 @ =gMain\n\
	ldrh r1, [r0, 0x2E]\n\
	movs r2, 0x1\n\
	adds r0, r2, 0\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080EC394\n\
	ldr r2, _080EC314 @ =0x00006dad\n\
	adds r0, r4, r2\n\
	ldrb r1, [r0]\n\
	adds r2, 0x2F\n\
	adds r0, r4, r2\n\
	strb r1, [r0]\n\
	ldrb r0, [r0]\n\
	lsls r0, 24\n\
	asrs r0, 24\n\
	subs r2, 0x2A\n\
	adds r1, r4, r2\n\
	adds r0, r1\n\
	ldrb r0, [r0]\n\
	subs r0, 0x1\n\
	cmp r0, 0x4\n\
	bls _080EC304\n\
	b _080EC492\n\
_080EC304:\n\
	lsls r0, 2\n\
	ldr r1, _080EC318 @ =_080EC31C\n\
	adds r0, r1\n\
	ldr r0, [r0]\n\
	mov pc, r0\n\
	.align 2, 0\n\
_080EC310: .4byte gMain\n\
_080EC314: .4byte 0x00006dad\n\
_080EC318: .4byte _080EC31C\n\
	.align 2, 0\n\
_080EC31C:\n\
	.4byte _080EC330\n\
	.4byte _080EC344\n\
	.4byte _080EC380\n\
	.4byte _080EC36C\n\
	.4byte _080EC358\n\
_080EC330:\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	ldr r0, _080EC340 @ =sub_80EC4A0\n\
	bl sub_80EBDBC\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC340: .4byte sub_80EC4A0\n\
_080EC344:\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	ldr r0, _080EC354 @ =sub_80EC81C\n\
	bl sub_80EBDBC\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC354: .4byte sub_80EC81C\n\
_080EC358:\n\
	ldr r0, _080EC368 @ =0x02000000\n\
	movs r1, 0xC1\n\
	lsls r1, 2\n\
	adds r0, r1\n\
	movs r1, 0x1\n\
	strh r1, [r0]\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC368: .4byte 0x02000000\n\
_080EC36C:\n\
	ldr r0, _080EC37C @ =0x02000000\n\
	movs r2, 0xC1\n\
	lsls r2, 2\n\
	adds r0, r2\n\
	movs r1, 0x2\n\
	strh r1, [r0]\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC37C: .4byte 0x02000000\n\
_080EC380:\n\
	ldr r0, _080EC390 @ =0x02000000\n\
	movs r1, 0xC1\n\
	lsls r1, 2\n\
	adds r0, r1\n\
	movs r1, 0x6\n\
	strh r1, [r0]\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC390: .4byte 0x02000000\n\
_080EC394:\n\
	movs r0, 0x2\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	bne _080EC39E\n\
	b _080EC492\n\
_080EC39E:\n\
	strh r2, [r6]\n\
	b _080EC492\n\
_080EC3A2:\n\
	bl sub_80F208C\n\
	ldr r0, _080EC3B0 @ =sub_80EE96C\n\
	bl sub_80EBDBC\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC3B0: .4byte sub_80EE96C\n\
_080EC3B4:\n\
	bl sub_80F6208\n\
	ldrh r0, [r6]\n\
	adds r0, 0x1\n\
	strh r0, [r6]\n\
_080EC3BE:\n\
	bl sub_80F6250\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080EC492\n\
	ldr r1, _080EC3D8 @ =0x02000000\n\
	movs r2, 0xC1\n\
	lsls r2, 2\n\
	adds r1, r2\n\
	ldrh r0, [r1]\n\
	adds r0, 0x1\n\
	strh r0, [r1]\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC3D8: .4byte 0x02000000\n\
_080EC3DC:\n\
	bl sub_8055870\n\
	cmp r0, 0\n\
	bne _080EC492\n\
	ldr r1, _080EC400 @ =0x00008fe8\n\
	adds r0, r4, r1\n\
	ldrb r0, [r0]\n\
	lsls r0, 24\n\
	asrs r0, 24\n\
	cmp r0, 0\n\
	beq _080EC408\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	ldr r0, _080EC404 @ =sub_80EDB88\n\
	bl sub_80EBDBC\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC400: .4byte 0x00008fe8\n\
_080EC404: .4byte sub_80EDB88\n\
_080EC408:\n\
	movs r0, 0x20\n\
	bl PlaySE\n\
	movs r0, 0\n\
	movs r1, 0x5\n\
	b _080EC442\n\
_080EC414:\n\
	bl sub_80F6C20\n\
	ldr r2, _080EC430 @ =0x0000d158\n\
	adds r0, r4, r2\n\
	ldrh r0, [r0]\n\
	cmp r0, 0\n\
	beq _080EC438\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	ldr r0, _080EC434 @ =sub_80EE3D8\n\
	bl sub_80EBDBC\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC430: .4byte 0x0000d158\n\
_080EC434: .4byte sub_80EE3D8\n\
_080EC438:\n\
	movs r0, 0x20\n\
	bl PlaySE\n\
	movs r0, 0\n\
	movs r1, 0x6\n\
_080EC442:\n\
	bl sub_80EF428\n\
	movs r0, 0xFF\n\
	strh r0, [r6]\n\
	b _080EC492\n\
_080EC44C:\n\
	bl sub_80EEC10\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0\n\
	beq _080EC478\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	ldr r1, _080EC474 @ =0x00006dad\n\
	adds r0, r4, r1\n\
	ldrb r1, [r0]\n\
	movs r0, 0\n\
	bl sub_80EF428\n\
	movs r0, 0\n\
	strh r0, [r6]\n\
	bl sub_80EED9C\n\
	b _080EC492\n\
	.align 2, 0\n\
_080EC474: .4byte 0x00006dad\n\
_080EC478:\n\
	ldr r0, _080EC498 @ =gMain\n\
	ldrh r1, [r0, 0x2E]\n\
	movs r0, 0x3\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _080EC492\n\
	ldr r2, _080EC49C @ =0x00006dad\n\
	adds r0, r4, r2\n\
	ldrb r1, [r0]\n\
	movs r0, 0\n\
	bl sub_80EF428\n\
	strh r5, [r6]\n\
_080EC492:\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080EC498: .4byte gMain\n\
_080EC49C: .4byte 0x00006dad\n\
	");
}
#endif

void sub_80F1E84();
bool8 sub_80F1F10();
void sub_80EEFBC(u32);
bool8 sub_80EEF34();
void sub_80EED0C();
void sub_80F2620();
void sub_80EF814();
void sub_80EF840();
bool8 sub_80EF874();
void sub_80F2DD8();
void sub_80EC67C();

void sub_80EC4A0() {
	u32 var1;
	u32 var2;
	switch (ewram0.var304) {
	case 0:
		sub_80F1E84();
		sub_80F2D04(0);
		ewram0.var304++;
		break;
	case 1:
		if (!sub_80F1F10()) {
			if (gSaveBlock2.regionMapZoom) {
				var1 = 0x7;
			}
			else var1 = 0x8;
			sub_80EEFBC(var1);
			ewram0.var304++;
		}
		break;
	case 2:
		if (!(var2 = sub_80EEF34())) {
			BeginNormalPaletteFade(ewram0.var308, -1, 0x0, 0x10, var2);
			ewram0.var304++;
		}
		break;
	case 3:
		if (gPaletteFade.active) return;
		SetVBlankCallback(NULL);
		sub_80EED0C();
		ewram0.var304++;
		break;
	case 4:
		sub_80F2620();
		ewram0.var304++;
		break;
	case 5:
		sub_80EF814();
		ewram0.var304++;
		break;
	case 6:
		sub_80EF840();
		ewram0.var304++;
	case 7:
		if (sub_80EF874()) return;
		ewram0.var304++;
		break;
	case 8:
		sub_80F2C80(0x4);
		ewram0.var304++;
	case 9:
		if (sub_80F2CBC(0x4)) return;
		ewram0.var304++;
		break;
	case 0xA:
		sub_80F2DD8();
		SetVBlankCallback(&sub_80EBD30);
		ewram0.var304++;
		break;
	case 0xB:
		if (sub_8055870()) return;
		ewram0.var304++;
		break;
	case 0xC:
		BeginNormalPaletteFade(ewram0.var308, -1, 0x10, 0, 0);
		ewram0.var304++;
		break;
        case 0xD:
		sub_80EED2C(0x1);
		ewram0.var304++;
		break;
	case 0xE:
		if (gPaletteFade.active) return;
		sub_80EBDBC(&sub_80EC67C);
	}
}
