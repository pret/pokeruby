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
	/* 0x0306 */ u16 var306;
	/* 0x0308 */ u32 var308;
	/* 0x030C */ u8 fill030C[0x6a9f];
	/* 0x6dab */ u8 var6dab;
	/* 0x6dac */ u8 var6dac;
	/* 0x6dad */ u8 var6dad;
	/* 0x6dae */ u8 var6dae;
	/* 0x6daf */ u8 fill6daf[0x3];
	/* 0x6db2 */ u8 var6db2[5];
	/* 0x6db7 */ u8 fill6db7[0x25];
	/* 0x6ddc */ s8 var6ddc;
	/* 0x6ddd */ u8 fill6ddd[0x13];
	/* 0x6df0 */ s8 var6df0;
	/* 0x6df1 */ u8 fill6df1[0xB];
	/* 0x6dfc */ u8 var6dfc;
	/* 0x6dfd */ u8 fill6dfd[0x93];
	/* 0x6e90 */ u8 var6e90;
	/* 0x6e91 */ u8 fill6e91[0x4];
	/* 0x6e95 */ u8 var6e95;
	/* 0x6e96 */ u8 var6e96[0x814];
	/* 0x76AA */ u8 var76aa;
	/* 0x76AB */ u8 fill76AB[0x10BD];
	/* 0x8768 */ u32 var8768;
	/* 0x876C */ u8 fill876B[0x6C];
	/* 0x87D8 */ u8 var87D8;
	/* 0x87D9 */ u8 fill87D9[0x4F];
	/* 0x8828 */ u8 var8828;
	/* 0x8829 */ u8 fill8829[0x07bf];
	/* 0x8FE8 */ s8 var8fe8;
	/* 0x8FE9 */ u8 fill8FE9[0x16];
	/* 0x8FFF */ u8 var8fff[5];
	/* 0x9004 */ u8 fill9004[0x340];
	/* 0x9344 */ u8 var9344;
	/* 0x9345 */ u8 fill9345[0x3b8b];
	/* 0xced0 */ u32 varCED0;
	/* 0xced4 */ u8 fillCED4[0x284];
	/* 0xD158 */ u16 varD158;
};


extern u8 ewram[];
#define ewram0 (*(struct UnknownPokenav0*)(ewram + 0))

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

u16 gKeyRepeatStartDelay;
void sub_80EBCA8();

void sub_80EBC10() {
	u16 i;
	u16 *var1;
	gKeyRepeatStartDelay = 0x14;
	ewram0.var8828 = CalculatePlayerPartyCount();
	ewram0.var6ddc = 0;
	ewram0.var9344 = 0;
	ewram0.var8768 = 0;
	ewram0.varCED0 = 0;
	for (i = 0; i <= 4; ++i) {
		ewram0.var8fff[i] = 0;
		var1 = (u16 *)ewram;
		var1[i*2 + 0x4820] = 0x9B;
		var1[i*2 + 0x4821] = 0x5B;
	}
	ewram0.var6e95 = 0;
	sub_80EBCA8();
}

void sub_80EBCA8() {
	ewram0.var6db2[0] = 1;
	ewram0.var6db2[1] = 2;
	ewram0.var6db2[2] = 3;
	if (FlagGet(SYS_RIBBON_GET)) {
		ewram0.var6db2[3] = 4;
	}
	else {
		ewram0.var6db2[3] = 0;
	}
	ewram0.var6db2[4] = 5;
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

bool8 sub_80EEC10();
bool8 sub_80F6250();
void sub_80EED9C();
void sub_80F6208();
void sub_80EDB88();
void sub_80EC4A0();
void sub_80EC81C();
void sub_80F208C();
void sub_80EE96C();
void sub_80F6C20();
void sub_80EE3D8();

void sub_80EC268() {
	u8 var1;
	switch (ewram0.var304) {
	case 0:
		if (sub_80EEC10() != 0) {
			PlaySE(0x5);
			sub_80EF428(0, ewram0.var6dad);
			sub_80EED9C();
			break;
		}
		else {
			if (gMain.newKeys & A_BUTTON) {
				ewram0.var6ddc = ewram0.var6dad;
				switch (ewram0.var6db2[ewram0.var6ddc] - 1) {
				case 0:
					PlaySE(5);
					sub_80EBDBC(&sub_80EC4A0);
					break;
				case 1:
					PlaySE(5);
					sub_80EBDBC(&sub_80EC81C);
					break;
				case 4:
					ewram0.var304 = 1;
					break;
				case 3:
					ewram0.var304 = 2;
					break;
				case 2:
					ewram0.var304 = 6;
					break;
				}
			}
			else if (gMain.newKeys & B_BUTTON) {
				ewram0.var304 = 1;
			}
			break;
		}
	case 1:
		sub_80F208C();
		sub_80EBDBC(&sub_80EE96C);
		break;
	case 2:
		sub_80F6208();
		ewram0.var304++;
	case 3:
		if (sub_80F6250()) return;
		ewram0.var304++;
		break;
	case 4:
		if (sub_8055870()) return;
		if (ewram0.var8fe8 != 0) {
			PlaySE(0x5);
			sub_80EBDBC(&sub_80EDB88);
			break;
		}
		else {
			PlaySE(0x20);
			sub_80EF428(0, 5);
			ewram0.var304 = 0xFF;
			break;
		}
	case 6:
		sub_80F6C20();
		if (ewram0.varD158 != 0) {
			PlaySE(0x5);
			sub_80EBDBC(&sub_80EE3D8);
			break;
		}
		else {
			PlaySE(0x20);
			sub_80EF428(0, 6);
			ewram0.var304 = 0xFF;
			break;
		}
	case 0xFF:
		if ((var1 = sub_80EEC10()) != 0) {
			PlaySE(0x5);
			sub_80EF428(0, ewram0.var6dad);
			ewram0.var304 = 0;
			sub_80EED9C();
		}
		else {
			if (!(gMain.newKeys & (A_BUTTON | B_BUTTON))) return;
			sub_80EF428(0, ewram0.var6dad);
			ewram0.var304 = var1;
			break;
		}
	}
}

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

void sub_80EF9F8();
void sub_80EED9C();
bool8 sub_80EFBDC(u32);
void sub_80EFBB0();
void sub_80F2DF4();

void sub_80EC67C() {
	u32 var1;
	u32 var2;
	switch (ewram0.var304) {
	case 0:
		switch (sub_80FAB60()) {
		case 1:
			sub_80EED9C();
			break;
		case 3:
			sub_80EF9F8();
			break;
		case 4:
			PlaySE(0x5);
			ewram0.var304 = 1;
			break;
		case 5:
			PlaySE(0x5);
			ewram0.var304 = 4;
			break;
		}
		break;
	case 1:
		if (!ewram0.var6e90) {
			sub_80FAEC4();
			ewram0.var304++;
			break;
		}
		if (sub_80EFBDC(1)) return;
		sub_80FAEC4();
		ewram0.var304++;
		break;
	case 2:
		if ((var2 = sub_80FAFC0())) return;
		if (!ewram0.var6e90) {
			sub_80EFBB0();
			ewram0.var304 = var2;
			break;
		}
		ewram0.var304++;
		break;
	case 3:
		if ((var1 = sub_80EFBDC(0))) return;
		sub_80EFBB0();
		ewram0.var304 = var1;
		break;
	case 4:
		BeginNormalPaletteFade(ewram0.var308, -1, 0, 0x10, 0);
		ewram0.var304++;
		break;
	case 5:
		if (gPaletteFade.active) return;
		sub_80F2DF4();
		sub_80F2D04(0x4);
		gSaveBlock2.regionMapZoom = (ewram0.var6e90 == 1) ? 1 : 0;
		sub_80EBDBC(&sub_80EC00C);
	}
}

void sub_80EC86C();

void sub_80EC81C() {
	switch (ewram0.var304) {
	case 0:
		sub_80F2D04(0);
		sub_80EE9C0(1, 0, 1);
		ewram0.var304++;
		break;
	case 1:
		if (sub_80EEA0C()) return;
		sub_80EBDBC(&sub_80EC86C);
	}
}

bool8 sub_80EEC90();
void sub_80ED620();
void sub_80EC960();
bool8 sub_80F1E6C();

void sub_80EC86C() {
	switch (ewram0.var304) {
	case 0:
		if (sub_80EEC90()) {
			PlaySE(0x5);
			sub_80EF428(1, ewram0.var6dad);
			sub_80EED9C();
			break;
		}
		if (gMain.newKeys & A_BUTTON) {
			PlaySE(0x5);
			ewram0.var6df0 = ewram0.var6dad;
			switch (ewram0.var6df0) {
			case 0:
				sub_80EBDBC(&sub_80ED620);
				break;
			case 1:
				sub_80EBDBC(&sub_80EC960);
				break;
			case 2:
				sub_80EBDBC(&sub_80EC210);
				break;
			}
			break;
		}
		else if (gMain.newKeys & B_BUTTON) {
			PlaySE(0x5);
			ewram0.var6df0 = 0x2;
			ewram0.var6dad = 0x2;
			ewram0.var304++;
			break;
		}
		break;
	case 1:
		if (sub_80F1E6C()) return;
		sub_80EBDBC(&sub_80EC210);
	}
}

void sub_80ECC08();

void sub_80EC960() {
	switch (ewram0.var304) {
	case 0:
		sub_80EE9C0(2, 0, 5);
		ewram0.var304++;
		break;
	case 1:
		if (sub_80EEA0C()) return;
		sub_80EBDBC(&sub_80ECC08);
	}
}

void sub_80EC9A8() {
	switch (ewram0.var304) {
	case 0:
		sub_80F2D04(5);
		sub_80EE9C0(1, ewram0.var6df0, 0xC);
		ewram0.var304++;
		break;
	case 1:
		if (sub_80EEA0C()) return;
		sub_80EBDBC(&sub_80EC86C);
		sub_80EF428(1, ewram0.var6dad);
	}
}

void sub_80ECA10() {
	switch (ewram0.var304) {
	case 0:
		if (sub_80EEF78()) return;
		SetVBlankCallback(&sub_80EBD80);
		sub_80EED1C();
		ewram0.var6dad = ewram0.var6df0;
		ewram0.var6dae = 0x3;
		sub_80EEE08();
		ewram0.var304++;
		break;
	case 1:
		sub_80EF248(0x1);
		ewram0.var304++;
	case 2:
		if (sub_80EF284(0x1)) return;
		ewram0.var304++;
		break;
	case 3:
		sub_80F1B8C(0x1);
		ewram0.var304++;
	case 4:
		if (sub_80F1BC8(0x1)) return;
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
		sub_80F2598();
		ewram0.var304++;
		break;
	case 9:
		if (gPaletteFade.active) return;
		ewram0.var304++;
		break;
	case 0xA:
		sub_80F2C80(0x1);
		ewram0.var304++;

	case 0xB:
		if (sub_80F2CBC(0x1)) return;
		ewram0.var304++;
		break;
	case 0xC:
		sub_80F1DF0();
		ewram0.var304++;
		break;
	case 0xD:
		if (sub_80F1E50()) return;
		sub_80EF428(1, ewram0.var6dad);
		sub_80EBDBC(&sub_80EC86C);
	}
}

void sub_80ED01C();

void sub_80ECC08() {
	switch (ewram0.var304) {
	case 0:
		if (sub_80EEC90()) {
			PlaySE(0x5);
	                sub_80EF428(2, ewram0.var6dad);
			sub_80EED9C();
			break;
		}
		if (gMain.newKeys & A_BUTTON) {
			PlaySE(0x5);
			switch ((s8)ewram0.var6dad) {
			case 0:
				ewram0.var87D8 = 22;
				break;
			case 1:
				ewram0.var87D8 = 23;
				break;
			case 2:
				ewram0.var87D8 = 24;
				break;
			case 3:
				ewram0.var87D8 = 33;
				break;
			case 4:
				ewram0.var87D8 = 47;
				break;
			case 5:
				sub_80EBDBC(&sub_80EC9A8);
				return;
			}
			ewram0.var6dfc = ewram0.var6dad;
			ewram0.var76aa = 1;
			sub_80EBDBC(&sub_80ED01C);
		}
		else if (gMain.newKeys & B_BUTTON) {
			PlaySE(0x5);
			ewram0.var6dad = 0x5;
			ewram0.var304++;
		}
                break;
	case 1:
		if (sub_80F1E6C()) return;;
		sub_80EBDBC(&sub_80EC9A8);
		break;
	}
}

void sub_80F3130();
void sub_80F2D6C(u32);

void sub_80ECD80() {
	u16 var1;
	switch (ewram0.var304) {
	case 0:
		BeginNormalPaletteFade(ewram0.var308, -1, 0, 0x10, 0);
		ewram0.var304++;
		break;
	case 1:
		if (gPaletteFade.active) return;
		ewram0.var304++;
		break;
	case 2:
		if (sub_80EEF78()) return;
		SetVBlankCallback(&sub_80EBD80);
		ewram0.var304++;
		break;
	case 3:
		sub_80EED1C();
		sub_80F3130();
		ewram0.var304++;
		break;
	case 4:
		sub_80F2D6C(0x1);
		ewram0.var304++;
		break;
	case 5:
		sub_80F2D6C(0x5);
		ewram0.var304++;
		break;
	case 6:
		ewram0.var6dad = ewram0.var6dfc;
		ewram0.var6dae = 0x6;
		sub_80EEE08();
		ewram0.var304++;
		break;
	case 7:
		sub_80EF248(0x2);
		ewram0.var304++;
	case 8:
		if (sub_80EF284(0x2)) return;
		ewram0.var304++;
		break;
	case 9:
		sub_80F1B8C(0x2);
		ewram0.var304++;
	case 0xA:
		if (sub_80F1BC8(0x2)) return;
		ewram0.var304++;
		break;
	case 0xB:
		if (sub_8055870()) return;
		ewram0.var304++;
		break;
	case 0xC:
		BeginNormalPaletteFade(ewram0.var308, -1, 0x10, 0, 0);
		SetVBlankCallback(&sub_80EBD18);
		ewram0.var304++;
		break;
	case 0xD:
		sub_80EED2C(0);
		ewram0.var304++;
		break;
	case 0xE:
		sub_80F2598();
		ewram0.var304++;
		break;
	case 0xF:
		if (gPaletteFade.active) return;
		ewram0.var304++;
		break;
	case 0x10:
		sub_80F2C80(0x1);
		ewram0.var304++;
	case 0x11:
		if ((var1 = sub_80F2CBC(0x1))) return;
		ewram0.var306 = var1;
		ewram0.var304++;
		break;
	case 0x12:
		sub_80F2C80(0x5);
		ewram0.var304++;
	case 0x13:
		if (sub_80F2CBC(0x5)) return;
		sub_80F1DF0();
		ewram0.var304++;
		break;
	case 0x14:
		if (sub_80F1E50()) return;
		sub_80EF428(2, ewram0.var6dad);
		sub_80EBDBC(&sub_80ECC08);
	}
}

void sub_80F4D44();
bool8 sub_80F4D88();
void sub_80F0264();
bool8 sub_80F02A0();
void sub_80F3008();
void sub_80ED31C();

void sub_80ED01C() {
	u16 var1;
	u16 var3;
	switch (ewram0.var304) {
	case 0:
		sub_80F1E84();
		sub_80F2D04(0x1);
		sub_80F2D04(0x5);
		ewram0.var304++;
		break;
	case 1:
		if (sub_80F1F10()) return;
		sub_80EEFBC(0);
		ewram0.var304++;
		break;
	case 2:
		if ((var1 = sub_80EEF34())) return;
		BeginNormalPaletteFade(ewram0.var308, -1, 0x0, 0x10, var1);
		ewram0.var304++;
		break;
	case 3:
		if (gPaletteFade.active) return;
		SetVBlankCallback(NULL);
		sub_80EED0C();
		sub_80EF814();
		ewram0.var304++;
		break;
	case 4:
		sub_80F2620();
		ewram0.var304++;
		break;
	case 5:
		sub_80F4D44();
		ewram0.var304++;
	case 6:
		if (!sub_80F4D88()) {
			ewram0.var304 += 2;
			break;
		}
		ewram0.var304++;
		break;
	case 7:
		if (sub_8055870()) return;
		ewram0.var304--;
		break;
	case 8:
		if (sub_8055870()) return;
		ewram0.var304++;
		break;
	case 9:
		sub_80F0264(0);
		ewram0.var304++;
	case 0xA:
		if (sub_80F02A0()) return;
		ewram0.var304++;
		break;
	case 0xB:
		sub_80F3008(0);
		ewram0.var304++;
		break;
	case 0xC:
		if (sub_8055870()) return;
		ewram0.var304++;
		break;
	case 0xD:
		BeginNormalPaletteFade(ewram0.var308, -1, 0x10, 0, 0);
		SetVBlankCallback(&sub_80EBD18);
		ewram0.var304++;
		break;
	case 0xE:
		sub_80EED2C(0x4);
		ewram0.var304++;
		break;
	case 0xF:
		if (gPaletteFade.active) return;
		ewram0.var306 = (u8)(gPaletteFade.active << 24);
		ewram0.var304++;
		break;
	case 0x10:
		sub_80F2C80(0x1);
		ewram0.var304++;
	case 0x11:
		if ((var3 = sub_80F2CBC(0x1))) return;
		ewram0.var306 = var3;
		ewram0.var304++;
		break;
	case 0x12:
		sub_80F2C80(ewram0.var6dfc + 7);
		ewram0.var304++;
	case 0x13:
		if (sub_80F2CBC(ewram0.var6dfc + 7)) return;
		sub_80EBDBC(&sub_80ED31C);
		break;
	}
}

u8 sub_80F5DD4();
void ShowMapNamePopUpWindow();
void sub_80ED4D8();
bool8 sub_80F0718();
bool8 sub_80F3264();

void sub_80ED31C() {
	switch (ewram0.var304) {
	case 0:
		switch (sub_80F5DD4()) {
		case 1:
			PlaySE(0x5);
			ShowMapNamePopUpWindow();
			break;
		case 2:
			PlaySE(0x5);
			ewram0.var304++;
			break;
		default:
			if (gMain.newKeys & A_BUTTON) {
				PlaySE(0x5);
				sub_80EBDBC(&sub_80ED4D8);
			}
			else if (gMain.newKeys & B_BUTTON) {
				PlaySE(0x5);
				sub_80EBDBC(&sub_80ECD80);
			}
			break;
		}
		break;
	case 1:
		if (sub_80F0718()) return;
		ShowMapNamePopUpWindow();
		sub_80F3264();
		ewram0.var304++;
		break;
	case 2:
		if (sub_8055870()) return;
		ewram0.var304 = 0;
		break;
	}
}

void sub_80F6134();

void sub_80ED3D0() {
	switch (ewram0.var304) {
	case 0:
		SetVBlankCallback(NULL);
		ewram0.var304++;
		break;
	case 1:
		sub_80EED0C();
		sub_80F6134();
		ewram0.var304++;
		break;
	case 2:
		sub_80EEFBC(0);
		ewram0.var304++;
		break;
	case 3:
		sub_80F0264(0);
		ewram0.var304++;
	case 4:
		if (sub_80F02A0()) return;
		ewram0.var304++;
		break;
	case 5:
		if (sub_8055870()) return;
		ewram0.var304++;
		break;
	case 6:
		sub_80F3008(0);
		BeginNormalPaletteFade(ewram0.var308, -1, 0x10, 0, 0);
		SetVBlankCallback(&sub_80EBD18);
		ewram0.var304++;
		break;
	case 7:
		sub_80EED2C(0x4);
		ewram0.var304++;
		break;
	case 8:
		if (gPaletteFade.active) return;
		sub_80EBDBC(&sub_80ED31C);
	}
}