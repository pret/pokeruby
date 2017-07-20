#include "global.h"
#include "gba/m4a_internal.h"
#include "intro.h"
#include "data2.h"
#include "decompress.h"
#include "hall_of_fame.h"
#include "intro_credits_graphics.h"
#include "libgncmultiboot.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "new_game.h"
#include "palette.h"
#include "rng.h"
#include "save.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "task.h"
#include "title_screen.h"
#include "trig.h"
#include "unknown_task.h"

extern u8 gUnknown_0841225C;
extern u8 gUnknown_084126DC;
extern u8 gUnknown_084121FC;
extern u8 gUnknown_084128D8;
extern u8 gUnknown_08412EB4;
extern u8 gUnknown_08412818;
extern u8 gUnknown_08413184;
extern u8 gUnknown_08413340;
extern u8 gUnknown_084139C8;
extern u8 gUnknown_08413300;
extern u8 gUnknown_08413CCC;

const extern struct CompressedSpriteSheet gUnknown_08416B54;
const extern struct CompressedSpriteSheet gUnknown_08416BDC;

extern s16 gUnknown_0203935C;

extern u8 gReservedSpritePaletteCount;

void sub_8149248();
void sub_8149264();

void load_intro_part2_graphics(u8 a){
	LZ77UnCompVram(&gUnknown_0841225C, (void *)(VRAM + 0x4000));
	LZ77UnCompVram(&gUnknown_084126DC, (void *)(VRAM + 0x7800));
	LoadPalette(&gUnknown_084121FC, 240, 32);
	switch (a)
	{
		case 0:
		default:
			LZ77UnCompVram(&gUnknown_084128D8, (void *)(VRAM));
			LZ77UnCompVram(&gUnknown_08412EB4, (void *)(VRAM + 0x3000));
			LoadPalette(&gUnknown_08412818, 0, 96);
			LoadCompressedObjectPic(&gUnknown_08416B54);
			LoadPalette(&gUnknown_08413184, 256, 32);
			sub_8149248();
			break;
		case 1:
			LZ77UnCompVram(&gUnknown_08413340, (void *)(VRAM));
			LZ77UnCompVram(&gUnknown_084139C8, (void *)(VRAM + 0x3000));
			LoadPalette(&gUnknown_08413300, 0, 32);
			LoadCompressedObjectPic(&gUnknown_08416BDC);
			LoadPalette(&gUnknown_08413CCC, 256, 32);
			sub_8149264();
			break;
	}
	gUnknown_0203935C = 0;
	gReservedSpritePaletteCount = 8;
}

void sub_8148C78(u8 a)
{
    if (a == 1)
    {
        REG_BG3CNT = 0x603;
        REG_BG2CNT = 0x702;
        REG_BG1CNT = 0xF05;
        REG_DISPCNT = 0x1E40;
    }
    else
    {
        REG_BG3CNT = 0x603;
        REG_BG2CNT = 0x702;
        REG_BG1CNT = 0xF05;
        REG_DISPCNT = 0x1E40;
    }
}

extern u8 gUnknown_084131C4;
extern u8 gUnknown_084131A4;
extern u8 gUnknown_0841221C;
extern u8 gUnknown_08412878;
extern u8 gUnknown_08413320;
extern u8 gUnknown_0841223C;
extern u8 gUnknown_08413E78;
extern u8 gUnknown_08414084;
extern u8 gUnknown_08413E38;
const extern struct CompressedSpriteSheet gUnknown_08416C70;
extern u8 gUnknown_08414064;

void sub_8149280();

void sub_8148CB0(u8 a){
	LZ77UnCompVram(&gUnknown_0841225C, (void *)(VRAM + 0x4000));
	LZ77UnCompVram(&gUnknown_084126DC, (void *)(VRAM + 0x7800));
	switch (a)
	{
		case 0:
		default:
			LoadPalette(&gUnknown_084121FC, 240, 32);
			LZ77UnCompVram(&gUnknown_084128D8, (void *)(VRAM));
			LZ77UnCompVram(&gUnknown_08412EB4, (void *)(VRAM + 0x3000));
			LoadPalette(&gUnknown_08412818, 0, 96);
			LoadCompressedObjectPic(&gUnknown_08416B54);
			LZ77UnCompVram(&gUnknown_084131C4, (void *)(VRAM + 0x10000));
			LoadPalette(&gUnknown_08413184, 256, 32);
			sub_8149248();
			break;
		case 1:
			LoadPalette(&gUnknown_0841221C, 240, 32);
			LZ77UnCompVram(&gUnknown_084128D8, (void *)(VRAM));
			LZ77UnCompVram(&gUnknown_08412EB4, (void *)(VRAM + 0x3000));
			LoadPalette(&gUnknown_08412878, 0, 96);
			LoadCompressedObjectPic(&gUnknown_08416B54);
			LZ77UnCompVram(&gUnknown_084131C4, (void *)(VRAM + 0x10000));
			LoadPalette(&gUnknown_084131A4, 256, 32);
			sub_8149248();
			break;
		case 2:
		case 3:
			LoadPalette(&gUnknown_0841221C, 240, 32);
			LZ77UnCompVram(&gUnknown_08413340, (void *)(VRAM));
			LZ77UnCompVram(&gUnknown_084139C8, (void *)(VRAM + 0x3000));
			LoadPalette(&gUnknown_08413320, 0, 32);
			LoadCompressedObjectPic(&gUnknown_08416BDC);
			LoadPalette(&gUnknown_08413320, 256, 32);
			sub_8149264();
			break;
		case 4:
			LoadPalette(&gUnknown_0841223C, 240, 32);
			LZ77UnCompVram(&gUnknown_08413E78, (void *)(VRAM));
			LZ77UnCompVram(&gUnknown_08414084, (void *)(VRAM + 0x3000));
			LoadPalette(&gUnknown_08413E38, 0, 64);
			LoadCompressedObjectPic(&gUnknown_08416C70);
			LoadPalette(&gUnknown_08414064, 256, 32);
			sub_8149280();
			break;
	}
	gReservedSpritePaletteCount = 8;
	gUnknown_0203935C = 0;
}

void sub_8148E90(u8 a)
{
	REG_BG3CNT = 0x603;
    REG_BG2CNT = 0x702;
    REG_BG1CNT = 0xF05;
    REG_DISPCNT = 0x1F40;
}



u8 sub_8148EC0(u8 a, u16 b, u16 c, u16 d){
	u8 taskId = CreateTask(&sub_8148F3C, 0);
	gTasks[taskId].data[0] = a;
	gTasks[taskId].data[1] = b;
	gTasks[taskId].data[2] = 0;
	gTasks[taskId].data[3] = 0;
	gTasks[taskId].data[4] = c;
	gTasks[taskId].data[5] = 0;
	gTasks[taskId].data[6] = 0;
	gTasks[taskId].data[7] = d;
	gTasks[taskId].data[8] = 8;
	gTasks[taskId].data[9] = 0;
	sub_8148F3C(taskId);
	return taskId;
}
