#include "global.h"
#include "weather.h"
#include "asm.h"
#include "task.h"
#include "sprite.h"
#include "palette.h"

struct Weather {
	u8 filler_000[0x200];
	u8 unknown_200[2][32];
	u8 filler_240[0x480];
	s8 unknown_6C0;
	s8 unknown_6C1;
	u8 unknown_6C2;
	u8 unknown_6C3;
	u16 unknown_6C4;
	u8 unknown_6C6;
	u8 unknown_6C7;
	u8 unknown_6C8;
	u8 unknown_6C9;
	u8 unknown_6CA;
	u8 unknown_6CB;
	u8 filler_6CC[2];
	u16 unknown_6CE;
	u8 unknown_6D0;
	u8 unknown_6D1;
	u8 filler_6D2[1];
	u8 unknown_6D3;
	u8 unknown_6D4;
	u8 unknown_6D5;
	u8 filler_6D6[2];
	u8 unknown_6D8;
	u8 filler_6D9[1];
	u8 unknown_6DA;
	u8 filler_6DB[3];
	u8 unknown_6DE;
	u8 filler_6DF[5];
	u8 unknown_6E4;
	u8 filler_6E5[0x15];
	u8 unknown_6FA;
	u8 unknown_6FB;
	u8 filler_6FC[4];
	u8 unknown_700;
	u8 filler_701[0x15];
	u8 unknown_716;
	u8 unknown_717;
	u8 filler_718[0xc];
	u8 unknown_724;
	u8 filler_725[9];
	u8 unknown_72E;
};

#define gWeather gUnknown_0202F7E8
extern struct Weather gWeather;
extern u8 *gUnknown_083970E8;
extern u8 (*gUnknown_08396FC8[][4])(void);
extern u8 (*gUnknown_083970B8[])(void);
extern u8 *gUnknown_030006DC;
extern u8 gUnknown_083970C8;
extern u8 (*gUnknown_0202FC48)[32];
extern u8 gUnknown_0202F9E8[32];


void sub_807C828(void) {
	u8 index;
	if (!FuncIsActiveTask(&sub_807CA34)) {
		index = AllocSpritePalette(0x1200);
		CpuCopy32(&gUnknown_083970E8, &gPlttBufferUnfaded[0x100 + index * 16], 32);
		sub_807CB10();
		gWeather.unknown_6D5 = index;
		gWeather.unknown_6D4 = AllocSpritePalette(0x1201);
		gWeather.unknown_6DA = 0;
		gWeather.unknown_6D8 = 0;
		gWeather.unknown_6DE = 0;
		gWeather.unknown_6E4 = 0;
		gWeather.unknown_700 = 0;
		gWeather.unknown_6FB = 0;
		gWeather.unknown_724 = 0;
		gWeather.unknown_716 = 0;
		gWeather.unknown_717 = 0;
		gWeather.unknown_72E = 0;
		gWeather.unknown_6FA = 0;
		sub_807DB64(16, 0);
		gWeather.unknown_6D0 = 0;
		gWeather.unknown_6C6 = 3;
		gWeather.unknown_6C8 = 0;
		gWeather.unknown_6D3 = 1;
		gWeather.unknown_6C9 = CreateTask(&sub_807C9E4, 80);
	}
}

void DoWeatherEffect(u8 effect) {
	if (effect != 3 && effect != 5 && effect != 13) {
		PlayRainSoundEffect();
	}
	if (gWeather.unknown_6D1 != effect && gWeather.unknown_6D0 == effect) {
		gUnknown_08396FC8[effect][0]();
	}
	gWeather.unknown_6D3 = 0;
	gWeather.unknown_6D1 = effect;
	gWeather.unknown_6CE = 0;
}

void sub_807C988(u8 effect) {
	PlayRainSoundEffect();
	gWeather.unknown_6D0 = effect;
	gWeather.unknown_6D1 = effect;
}

void sub_807C9B4(u8 effect) {
	PlayRainSoundEffect();
	gWeather.unknown_6D0 = effect;
	gWeather.unknown_6D1 = effect;
	gWeather.unknown_6C8 = 1;
}

void sub_807C9E4(u8 task) {
	if (gWeather.unknown_6C8) {
		gUnknown_08396FC8[gWeather.unknown_6D0][2]();
		gTasks[task].func = &sub_807CA34;
	}
}

void sub_807CA34(u8 task) {
	u8 v1;
	if (gWeather.unknown_6D0 != gWeather.unknown_6D1) {
		v1 = gUnknown_08396FC8[gWeather.unknown_6D0][3]();
		if (!v1) {
			gUnknown_08396FC8[gWeather.unknown_6D1][0]();
			gWeather.unknown_6C3 = 0; // compiler reuses v1
			gWeather.unknown_6C6 = 0; // compiler reuses v1
			gWeather.unknown_6D0 = gWeather.unknown_6D1;
			gWeather.unknown_6D3 = 1;
		}
	} else {
		gUnknown_08396FC8[gWeather.unknown_6D0][1]();
	}
	gUnknown_083970B8[gWeather.unknown_6C6]();
}

void sub_807CAE8(void) {
	gWeather.unknown_6C1 = 0;
	gWeather.unknown_6C2 = 0;
}

void nullsub_38(void) {
}

u32 sub_807CB0C(void) {
	return 0;
}

void sub_807CB10(void) {
	u16 v0;
	u8 (*v1)[32];
	u16 v2;
	u16 v4;
	u16 v5;
	u16 v6;
	u16 v9;
	u32 v10;
	u16 v11;
	s16 dunno;

	gUnknown_030006DC = &gUnknown_083970C8;
	for (v0 = 0; v0 <= 1; v0++) {
		if (v0 == 0) {
			v1 = &gUnknown_0202F9E8;
		} else {
			v1 = &gUnknown_0202F9E8 + 19;
		}
		for (v2 = 0; (u16)v2 <= 0x1f; v2++) {
			v4 = v2 << 8;
			if (v0 == 0) {
				v5 = (v2 << 8) / 16;
			} else {
				v5 = 0;
			}
			v6 = 0;
			for (; v6 <= 2; v6++) {
				v4 = (v4 - v5);
				v1[v6][v2] = v4 >> 8;
			}
			v9 = v4;
			v10 = 0x1f00 - v4;
			if ((0x1f00 - v4) < 0) {
				v10 += 0xf;
			}
			v11 = v10 >> 4;
			if (v2 <= 0xb) {
				for (; v6 <= 0x12; v6++) {
					v4 += v11;
					dunno = v4 - v9;
					if (dunno > 0) {
						v4 -= (dunno + ((u16)dunno >> 15)) >> 1;
					}
					v1[v6][v2] = v4 >> 8;
					if (v1[v6][v2] > 0x1f) {
						v1[v6][v2] = 0x1f;
					}
				}
			} else {
				for (; v6 <= 0x12; v6++) {
					v4 += v11;
					v1[v6][v2] = v4 >> 8;
					if (v1[v6][v2] > 0x1f) {
						v1[v6][v2] = 0x1f;
					}
				}
			}
		}
	}
}

void sub_807CC24(void) {
	if (gWeather.unknown_6C0 == gWeather.unknown_6C1) {
		gWeather.unknown_6C6 = 3;
	} else {
		if (++gWeather.unknown_6C3 >= gWeather.unknown_6C2) {
			gWeather.unknown_6C3 = 0;
			if (gWeather.unknown_6C0 < gWeather.unknown_6C1) {
				gWeather.unknown_6C0++;
			} else {
				gWeather.unknown_6C0--;
			}
			sub_807CEBC(0, 0x20, gWeather.unknown_6C0);
		}
	}
}

void sub_807CCAC(void) {
	if (++gWeather.unknown_6CB > 1) {
		gWeather.unknown_6CA = 0;
	}
	switch (gWeather.unknown_6D0) {
		case 3:
		case 4:
		case 5:
		case 11:
		case 13:
			if (sub_807CDC4() == 0) {
				gWeather.unknown_6C0 = 3;
				gWeather.unknown_6C6 = 3;
			}
			break;
		case 12:
			if (sub_807CE24() == 0) {
				gWeather.unknown_6C0 = -6;
				gWeather.unknown_6C6 = 3;
			}
			break;
		case 6:
			if (sub_807CE7C() == 0) {
				gWeather.unknown_6C0 = 0;
				gWeather.unknown_6C6 = 3;
			}
			break;
		case 7:
		case 8:
		case 9:
		case 10:
		default:
			if (!gPaletteFade.active) {
				gWeather.unknown_6C0 = gWeather.unknown_6C1;
				gWeather.unknown_6C6 = 3;
			}
			break;
	}
}

u8 sub_807CDC4(void) {
	if (gWeather.unknown_6C7 == 0x10) {
		return 0;
	}
	if (++gWeather.unknown_6C7 >= 0x10) {
		sub_807CEBC(0, 0x20, 3);
		gWeather.unknown_6C7 = 0x10;
		return 0;
	}
	sub_807D1BC(0, 0x20, 3, 0x10 - gWeather.unknown_6C7, gWeather.unknown_6C4);
	return 1;
}

u8 sub_807CE24(void) {
	if (gWeather.unknown_6C7 == 0x10) {
		return 0;
	}
	if (++gWeather.unknown_6C7 >= 0x10) {
		sub_807CEBC(0, 0x20, -6);
		gWeather.unknown_6C7 = 0x10;
		return 0;
	}
	sub_807D304(-6, 0x10 - gWeather.unknown_6C7, gWeather.unknown_6C4);
	return 1;
}

u8 sub_807CE7C(void) {
	if (gWeather.unknown_6C7 == 0x10) {
		return 0;
	}
	++gWeather.unknown_6C7;
	sub_807D424(0x10 - gWeather.unknown_6C7, gWeather.unknown_6C4);
	return 1;
}

void nullsub_39(void) {
}
