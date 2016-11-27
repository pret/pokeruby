#include "tileset_anim.h"
#include "global.h"

extern u8 *gTilesetAnimTable_General_0[];
extern u8 *gTilesetAnimTable_General_1[];
extern u8 *gTilesetAnimTable_General_2[];
extern u8 *gTilesetAnimTable_General_3[];
extern u8 *gTilesetAnimTable_General_4[];
extern u8 *gTilesetAnimTable_Lavaridge[];
extern u8 *gTilesetAnimTable_Pacifidlog_0[];
extern u8 *gTilesetAnimTable_Underwater[];
extern u8 *gTilesetAnimTable_Pacifidlog_1[];
extern u8 *gUnknown_0837BAE4[];
extern u8 *gUnknown_0837BB04[];
extern u8 *gTilesetAnimTable_Mauville_0A[];
extern u8 *gTilesetAnimTable_Mauville_1A[];
extern u8 *gTilesetAnimTable_Mauville_0B[];
extern u8 *gTilesetAnimTable_Mauville_1B[];
extern u8 *gUnknown_0837BFA4[];
extern u8 *gTilesetAnimTable_Rustboro_0[];
extern u8 *gTilesetAnimTable_Rustboro_1[];
extern u8 *gTilesetAnimTable_Cave[];
extern u8 *gUnknown_0837C93C[];
extern u8 *gTilesetAnimTable_EverGrande[];
extern u8 *gTilesetAnimTable_Building[];
extern u8 *gTilesetAnimTable_SootopolisGym_0[];
extern u8 *gTilesetAnimTable_SootopolisGym_1[];
extern u8 *gTilesetAnimTable_EliteFour_0[];
extern u8 *gTilesetAnimTable_EliteFour_1[];
extern u8 *gTilesetAnimTable_MauvilleGym[];
extern u8 *gTilesetAnimTable_BikeShop[];

struct Dma {
	u8 *src;
	u8 *dest;
	u16 size;
};

EWRAM_DATA static struct Dma gTilesetAnimDmas[20] = {0};

static u8 gNumTilesetAnimDmas;
static u16 gTileset1AnimFrame;
static u16 gTileset1AnimLength;
static u16 gTileset2AnimFrame;
static u16 gTileset2AnimLength;
static void (*gTileset1AnimCallback)(u16);
static void (*gTileset2AnimCallback)(u16);

static void StartTileset1Animation(void);
static void StartTileset2Animation(void);

static void sub_8073014(u16);
static void sub_8073058(u16);

static void sub_8073070(u16);
static void sub_8073098(u16);
static void sub_80730C0(u16);
static void sub_80730E8(u16);
static void sub_807361C(u16);

static void sub_8073424(u16);
static void sub_80734A0(u16);
static void sub_8073514(u16);
static void sub_8073540(u16);
static void sub_80735B4(u16);
static void sub_80735E4(u16);
static void sub_80738A8(u16);
static void sub_8073600(u16);
static void sub_80738C0(u16);
static void sub_8073890(u16);
static void sub_80738EC(u16);

static void sub_80737A4(u16, u8);
static void sub_80737E0(u16);
static void sub_8073704(u16, u8);
static void sub_8073644(u8);
static void sub_8073808(u16);
static void sub_8073830(u16, u8);
static void sub_807368C(u8);
static void sub_80736DC(u8);
static void sub_80736B4(u8);
static void sub_8073868(u16);

static void sub_8073904(u16);
static void sub_80739C4(u16);
static void sub_807392C(u16);
static void sub_807399C(u16);
static void sub_8073974(u16);
static void sub_80739EC(u16);

static void ClearTilesetAnimDmas(void) {
	gNumTilesetAnimDmas = 0;
	CpuFill32(0, &gTilesetAnimDmas, sizeof(gTilesetAnimDmas));
}

static void QueueTilesetAnimDma(u8 *src, u8 *dest, u16 size) {
	if (gNumTilesetAnimDmas < 20) {
		gTilesetAnimDmas[gNumTilesetAnimDmas].src = src;
		gTilesetAnimDmas[gNumTilesetAnimDmas].dest = dest;
		gTilesetAnimDmas[gNumTilesetAnimDmas].size = size;
		gNumTilesetAnimDmas++;
	}
}

void sub_8072E74(void) {
	int i;
	for (i = 0; i < gNumTilesetAnimDmas; i++) {
		DmaCopy16(3,
		          gTilesetAnimDmas[i].src,
		          gTilesetAnimDmas[i].dest,
		          gTilesetAnimDmas[i].size);
	}
	gNumTilesetAnimDmas = 0;
}

void cur_mapheader_run_tileset_funcs_after_some_cpuset(void) {
	ClearTilesetAnimDmas();
	StartTileset1Animation();
	StartTileset2Animation();
}

void sub_8072ED0(void) {
	StartTileset2Animation();
}

void sub_8072EDC(void) {
	ClearTilesetAnimDmas();
	if (++gTileset1AnimFrame >= gTileset1AnimLength) {
		gTileset1AnimFrame = 0;
	}
	if (++gTileset2AnimFrame >= gTileset2AnimLength) {
		gTileset2AnimFrame = 0;
	}
	if (gTileset1AnimCallback) {
		gTileset1AnimCallback(gTileset1AnimFrame);
	}
	if (gTileset2AnimCallback) {
		gTileset2AnimCallback(gTileset2AnimFrame);
	}
}

static void StartTileset1Animation(void) {
	gTileset1AnimFrame = 0;
	gTileset1AnimLength = 0;
	gTileset1AnimCallback = 0;
	if (gMapHeader.mapData->primaryTileset) {
		if (gMapHeader.mapData->primaryTileset->callback) {
			gMapHeader.mapData->primaryTileset->callback();
		}
	}
}

static void StartTileset2Animation(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = 0;
	gTileset2AnimCallback = 0;
	if (gMapHeader.mapData->secondaryTileset) {
		if (gMapHeader.mapData->secondaryTileset->callback) {
			gMapHeader.mapData->secondaryTileset->callback();
		}
	}
}

void TilesetCB_General(void) {
	gTileset1AnimFrame = 0;
	gTileset1AnimLength = 0x100;
	gTileset1AnimCallback = sub_8073014;
}

void TilesetCB_Building(void) {
	gTileset1AnimFrame = 0;
	gTileset1AnimLength = 0x100;
	gTileset1AnimCallback = sub_8073058;
}

static void sub_8073014(u16 a1) {
	int v1;
	v1 = a1 % 0x10;
	if (v1 == 0) sub_8073070(a1 / 0x10);
	if (v1 == 1) sub_8073098(a1 / 0x10);
	if (v1 == 2) sub_80730C0(a1 / 0x10);
	if (v1 == 3) sub_80730E8(a1 / 0x10);
	if (v1 == 4) sub_807361C(a1 / 0x10);
}

static void sub_8073058(u16 a1) {
	if (a1 % 8 == 0) {
		sub_8073904(a1 / 8);
	}
}

static void sub_8073070(u16 a1) {
	int v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_General_0[v1],
	            (u8 *)(BG_VRAM + 0x3f80),
	            0x80);
}

static void sub_8073098(u16 a1) {
	u8 v1;
	v1 = a1 % 8;
	QueueTilesetAnimDma(gTilesetAnimTable_General_1[v1],
	            (u8 *)(BG_VRAM + 0x3600),
	            0x3c0);
}

static void sub_80730C0(u16 a1) {
	int v1;
	v1 = a1 % 8;
	QueueTilesetAnimDma(gTilesetAnimTable_General_2[v1],
	            (u8 *)(BG_VRAM + 0x3a00),
	            0x140);
}

static void sub_80730E8(u16 a1) {
	int v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_General_3[v1],
	            (u8 *)(BG_VRAM + 0x3e00),
	            0xc0);
}

void TilesetCB_Petalburg(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = 0;
}

void TilesetCB_Rustboro(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = sub_8073424;
}

void TilesetCB_Dewford(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = 0;
}

void TilesetCB_Slateport(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = 0;
}

void TilesetCB_Mauville(void) {
	gTileset2AnimFrame = gTileset1AnimFrame;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = sub_80734A0;
}

void TilesetCB_Lavaridge(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = sub_8073514;
}

void TilesetCB_Fallarbor(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = 0;
}

void TilesetCB_Fortree(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = 0;
}

void TilesetCB_Lilycove(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = 0;
}

void TilesetCB_Mossdeep(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = 0;
}

void TilesetCB_EverGrande(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = sub_8073540;
}

void TilesetCB_Pacifidlog(void) {
	gTileset2AnimFrame = gTileset1AnimFrame;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = sub_80735B4;
}

void TilesetCB_Sootopolis(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = 0;
}

void TilesetCB_Underwater(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = 0x80;
	gTileset2AnimCallback = sub_80735E4;
}

void TilesetCB_SootopolisGym(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = 0xf0;
	gTileset2AnimCallback = sub_80738A8;
}

void TilesetCB_Cave(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = sub_8073600;
}

void TilesetCB_EliteFour(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = 0x80;
	gTileset2AnimCallback = sub_80738C0;
}

void TilesetCB_MauvilleGym(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = sub_8073890;
}

void TilesetCB_BikeShop(void) {
	gTileset2AnimFrame = 0;
	gTileset2AnimLength = gTileset1AnimLength;
	gTileset2AnimCallback = sub_80738EC;
}

static void sub_8073424(u16 a1) {
	int v1;
	v1 = a1 % 8;
	if (v1 == 0) {
		sub_80737A4(a1 / 8, 0);
		sub_80737E0(a1 / 8);
	}
	if (v1 == 1) sub_80737A4(a1 / 8, 1);
	if (v1 == 2) sub_80737A4(a1 / 8, 2);
	if (v1 == 3) sub_80737A4(a1 / 8, 3);
	if (v1 == 4) sub_80737A4(a1 / 8, 4);
	if (v1 == 5) sub_80737A4(a1 / 8, 5);
	if (v1 == 6) sub_80737A4(a1 / 8, 6);
	if (v1 == 7) sub_80737A4(a1 / 8, 7);
}

static void sub_80734A0(u16 a1) {
	int v1;
	v1 = a1 % 8;
	if (v1 == 0) sub_8073704(a1 / 8, 0);
	if (v1 == 1) sub_8073704(a1 / 8, 1);
	if (v1 == 2) sub_8073704(a1 / 8, 2);
	if (v1 == 3) sub_8073704(a1 / 8, 3);
	if (v1 == 4) sub_8073704(a1 / 8, 4);
	if (v1 == 5) sub_8073704(a1 / 8, 5);
	if (v1 == 6) sub_8073704(a1 / 8, 6);
	if (v1 == 7) sub_8073704(a1 / 8, 7);
}

static void sub_8073514(u16 a1) {
	int v1;
	v1 = a1 % 0x10;
	if (v1 == 0) sub_8073644(a1 / 0x10);
	if (v1 == 1) sub_8073808(a1 / 0x10);
}

static void sub_8073540(u16 a1) {
	int v1;
	v1 = a1 % 8;
	if (v1 == 0) sub_8073830(a1 / 8, 0);
	if (v1 == 1) sub_8073830(a1 / 8, 1);
	if (v1 == 2) sub_8073830(a1 / 8, 2);
	if (v1 == 3) sub_8073830(a1 / 8, 3);
	if (v1 == 4) sub_8073830(a1 / 8, 4);
	if (v1 == 5) sub_8073830(a1 / 8, 5);
	if (v1 == 6) sub_8073830(a1 / 8, 6);
	if (v1 == 7) sub_8073830(a1 / 8, 7);
}

static void sub_80735B4(u16 a1) {
	int v1;
	v1 = a1 % 0x10;
	if (v1 == 0) sub_807368C(a1 / 0x10);
	if (v1 == 1) sub_80736DC(a1 / 0x10);
}

static void sub_80735E4(u16 a1) {
	int v1;
	v1 = a1 % 0x10;
	if (v1 == 0) sub_80736B4(a1 / 0x10);
}

static void sub_8073600(u16 a1) {
	int v1;
	v1 = a1 % 0x10;
	if (v1 == 1) sub_8073868(a1 / 0x10);
}

static void sub_807361C(u16 a1) {
	int v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_General_4[v1],
	            (u8 *)(BG_VRAM + 0x3c00),
	            0x140);
}

static void sub_8073644(u8 a1) {
	u8 v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_Lavaridge[v1],
	            (u8 *)(BG_VRAM + 0x6400),
	            0x80);
	v1 = (a1 + 2) % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_Lavaridge[v1],
	            (u8 *)(BG_VRAM + 0x6480),
	            0x80);
}

static void sub_807368C(u8 a1) {
	int v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_Pacifidlog_0[v1],
	            (u8 *)(BG_VRAM + 0x7a00),
	            0x3c0);
}

static void sub_80736B4(u8 a1) {
	int v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_Underwater[v1],
	            (u8 *)(BG_VRAM + 0x7e00),
	            0x80);
}

static void sub_80736DC(u8 a1) {
	int v1;
	v1 = a1 % 8;
	QueueTilesetAnimDma(gTilesetAnimTable_Pacifidlog_1[v1],
	            (u8 *)(BG_VRAM + 0x7e00),
	            0x100);
}

static void sub_8073704(u16 a1, u8 a2) {
	int v1;
	a1 -= a2;
	if (a1 < 12) {
		v1 = a1 % 12;
		QueueTilesetAnimDma(gTilesetAnimTable_Mauville_0A[v1],
		            gUnknown_0837BAE4[a2],
		            0x80);
		QueueTilesetAnimDma(gTilesetAnimTable_Mauville_1A[v1],
		            gUnknown_0837BB04[a2],
		            0x80);
	} else {
		v1 = a1 % 4;
		QueueTilesetAnimDma(gTilesetAnimTable_Mauville_0B[v1],
			    gUnknown_0837BAE4[a2],
			    0x80);
		QueueTilesetAnimDma(gTilesetAnimTable_Mauville_1B[v1],
			    gUnknown_0837BB04[a2],
			    0x80);
	}
}

static void sub_80737A4(u16 a1, u8 a2) {
	int v1;
	a1 -= a2;

	v1 = a1 % 8;
	if (gTilesetAnimTable_Rustboro_0[v1]) {
		QueueTilesetAnimDma(gTilesetAnimTable_Rustboro_0[v1],
			    gUnknown_0837BFA4[a2],
			    0x80);
	}
}

static void sub_80737E0(u16 a1) {
	int v1;
	v1 = a1 % 2;
	QueueTilesetAnimDma(gTilesetAnimTable_Rustboro_1[v1],
	            (u8 *)(BG_VRAM + 0x7800),
	            0x80);
}

static void sub_8073808(u16 a1) {
	int v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_Cave[v1],
	            (u8 *)(BG_VRAM + 0x5400),
	            0x80);
}

static void sub_8073830(u16 a1, u8 a2) {
	int v1;
	a1 -= a2;
	v1 = a1 % 8;
	QueueTilesetAnimDma(gTilesetAnimTable_EverGrande[v1],
	            gUnknown_0837C93C[a2],
	            0x80);
}

static void sub_8073868(u16 a1) {
	int v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_Cave[v1],
	            (u8 *)(BG_VRAM + 0x7400),
	            0x80);
}

static void sub_8073890(u16 a1) {
	int v1;
	v1 = a1 % 2;
	if (!v1) {
		sub_80739C4(a1 / 2);
	}
}

static void sub_80738A8(u16 a1) {
	int v1;
	v1 = a1 % 8;
	if (!v1) {
		sub_807392C(a1 / 8);
	}
}

static void sub_80738C0(u16 a1) {
	if (a1 % 0x40 == 0) {
		sub_807399C(a1 / 0x40);
	}
	if (a1 % 8 == 1) {
		sub_8073974(a1 / 8);
	}
}

static void sub_80738EC(u16 a1) {
	if (a1 % 4 == 0) {
		sub_80739EC(a1 / 4);
	}
}

static void sub_8073904(u16 a1) {
	int v1;
	v1 = a1 % 2;
	QueueTilesetAnimDma(gTilesetAnimTable_Building[v1],
	            (u8 *)(BG_VRAM + 0x3e00),
	            0x80);
}

static void sub_807392C(u16 a1) {
	int v1;
	v1 = a1 % 3;
	QueueTilesetAnimDma(gTilesetAnimTable_SootopolisGym_0[v1],
	            (u8 *)(BG_VRAM + 0x7e00),
	            0x180);
	QueueTilesetAnimDma(gTilesetAnimTable_SootopolisGym_1[v1],
	            (u8 *)(BG_VRAM + 0x7a00),
	            0x280);
}

static void sub_8073974(u16 a1) {
	int v1;
	v1 = a1 % 4;
	QueueTilesetAnimDma(gTilesetAnimTable_EliteFour_0[v1],
	            (u8 *)(BG_VRAM + 0x7f00),
	            0x20);
}

static void sub_807399C(u16 a1) {
	int v1;
	v1 = a1 % 2;
	QueueTilesetAnimDma(gTilesetAnimTable_EliteFour_1[v1],
	            (u8 *)(BG_VRAM + 0x7c00),
	            0x80);
}

static void sub_80739C4(u16 a1) {
	int v1;
	v1 = a1 % 2;
	QueueTilesetAnimDma(gTilesetAnimTable_MauvilleGym[v1],
	            (u8 *)(BG_VRAM + 0x5200),
	            0x200);
}

static void sub_80739EC(u16 a1) {
	int v1;
	v1 = a1 % 2;
	QueueTilesetAnimDma(gTilesetAnimTable_BikeShop[v1],
	            (u8 *)(BG_VRAM + 0x7e00),
	            0x120);
}
