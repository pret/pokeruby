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

// define register constants for the inline asm
asm(".include \"constants/gba_constants.inc\"\n");

struct UnknownStruct1
{
    u8 var0_0:4;
    u8 var0_4:2;
    u8 var0_6:2;
    u8 var1;
    u8 var2;
    u8 var3;
    u16 var4;
};

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

extern const struct SpriteTemplate gSpriteTemplate_8416B3C;
const extern struct CompressedSpriteSheet gUnknown_08416B54;
const extern struct CompressedSpriteSheet gUnknown_08416BDC;

extern u16 gUnknown_02039358;
extern s16 gUnknown_0203935A;
extern s16 gUnknown_0203935C;
extern u8 gReservedSpritePaletteCount;

void sub_8149248();
void sub_8149264();

void load_intro_part2_graphics(u8 a)
{
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
extern struct UnknownStruct1 gUnknown_08416B94;
extern struct UnknownStruct1 gUnknown_08416C10;
extern struct UnknownStruct1 gUnknown_08416C8C;
const extern union AnimCmd *const gSpriteAnimTable_8416B84;
const extern union AnimCmd *const gSpriteAnimTable_8416C04;
const extern union AnimCmd *const gSpriteAnimTable_8416C88;
const extern struct SpriteTemplate gSpriteTemplate_8416CDC;
const extern struct SpriteTemplate gSpriteTemplate_Brendan;
const extern struct SpriteTemplate gSpriteTemplate_8416CF4;
const extern struct SpriteTemplate gSpriteTemplate_May;
const extern struct SpriteTemplate gSpriteTemplate_8416D7C;
const extern struct SpriteTemplate gSpriteTemplate_8416D94;

void sub_8149280();

void sub_8148CB0(u8 a)
{
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

u8 sub_8148EC0(u8 a, u16 b, u16 c, u16 d)
{
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

#ifdef NONMATCHING
void sub_8148F3C(u8 taskId)
{
    register u32 r4 asm("r4");
    s32 r2;

    r4 = (u16)gTasks[taskId].data[1] << 16;
    if (r4 != 0)
    {
        r2 = (gTasks[taskId].data[2] << 16) + (u16)gTasks[taskId].data[3] - (r4 >> 12);
        gTasks[taskId].data[2] = r2 >> 16;
        gTasks[taskId].data[3] = r2;
        REG_BG1HOFS = gTasks[taskId].data[2];
        REG_BG1VOFS = gUnknown_0203935A + gUnknown_02039358;
    }

    r4 = (u16)gTasks[taskId].data[4] << 16;
    if (r4 != 0)
    {
        r2 = (gTasks[taskId].data[5] << 16) + (u16)gTasks[taskId].data[6] - (r4 >> 12);
        gTasks[taskId].data[5] = r2 >> 16;
        gTasks[taskId].data[3] = r2;
        REG_BG2HOFS = gTasks[taskId].data[5];
        if (gTasks[taskId].data[0] != 0)
            REG_BG2VOFS = gUnknown_0203935A + gUnknown_02039358;
        else
            REG_BG2VOFS = gUnknown_02039358;
    }

    r4 = (u16)gTasks[taskId].data[7] << 16;
    if (r4 != 0)
    {
        r2 = (gTasks[taskId].data[8] << 16) + (u16)gTasks[taskId].data[9] - (r4 >> 12);;
        gTasks[taskId].data[8] = r2 >> 16;
        gTasks[taskId].data[9] = r2;
        REG_BG3HOFS = gTasks[taskId].data[8];
        REG_BG3VOFS = gUnknown_02039358;
    }
}
#else
__attribute__((naked))
void sub_8148F3C(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    ldr r1, _08148FB4 @ =gTasks\n\
    lsls r0, r5, 2\n\
    adds r0, r5\n\
    lsls r0, 3\n\
    adds r3, r0, r1\n\
    ldrh r0, [r3, 0xA]\n\
    lsls r4, r0, 16\n\
    adds r6, r1, 0\n\
    cmp r4, 0\n\
    beq _08148F7C\n\
    movs r1, 0xC\n\
    ldrsh r0, [r3, r1]\n\
    lsls r0, 16\n\
    ldrh r1, [r3, 0xE]\n\
    adds r2, r0, r1\n\
    lsrs r0, r4, 12\n\
    subs r2, r0\n\
    asrs r1, r2, 16\n\
    strh r1, [r3, 0xC]\n\
    strh r2, [r3, 0xE]\n\
    ldr r0, _08148FB8 @ =REG_BG1HOFS\n\
    strh r1, [r0]\n\
    ldr r2, _08148FBC @ =REG_BG1VOFS\n\
    ldr r1, _08148FC0 @ =gUnknown_02039358\n\
    ldr r0, _08148FC4 @ =gUnknown_0203935A\n\
    ldrh r0, [r0]\n\
    ldrh r1, [r1]\n\
    adds r0, r1\n\
    strh r0, [r2]\n\
_08148F7C:\n\
    ldrh r0, [r3, 0x10]\n\
    lsls r4, r0, 16\n\
    cmp r4, 0\n\
    beq _08148FD8\n\
    movs r1, 0x12\n\
    ldrsh r0, [r3, r1]\n\
    lsls r0, 16\n\
    ldrh r1, [r3, 0x14]\n\
    adds r2, r0, r1\n\
    lsrs r0, r4, 12\n\
    subs r2, r0\n\
    asrs r1, r2, 16\n\
    strh r1, [r3, 0x12]\n\
    strh r2, [r3, 0x14]\n\
    ldr r0, _08148FC8 @ =REG_BG2HOFS\n\
    strh r1, [r0]\n\
    movs r1, 0x8\n\
    ldrsh r0, [r3, r1]\n\
    cmp r0, 0\n\
    beq _08148FD0\n\
    ldr r2, _08148FCC @ =REG_BG2VOFS\n\
    ldr r1, _08148FC0 @ =gUnknown_02039358\n\
    ldr r0, _08148FC4 @ =gUnknown_0203935A\n\
    ldrh r0, [r0]\n\
    ldrh r1, [r1]\n\
    adds r0, r1\n\
    strh r0, [r2]\n\
    b _08148FD8\n\
    .align 2, 0\n\
_08148FB4: .4byte gTasks\n\
_08148FB8: .4byte REG_BG1HOFS\n\
_08148FBC: .4byte REG_BG1VOFS\n\
_08148FC0: .4byte gUnknown_02039358\n\
_08148FC4: .4byte gUnknown_0203935A\n\
_08148FC8: .4byte REG_BG2HOFS\n\
_08148FCC: .4byte REG_BG2VOFS\n\
_08148FD0:\n\
    ldr r0, _08149010 @ =REG_BG2VOFS\n\
    ldr r1, _08149014 @ =gUnknown_02039358\n\
    ldrh r1, [r1]\n\
    strh r1, [r0]\n\
_08148FD8:\n\
    lsls r0, r5, 2\n\
    adds r0, r5\n\
    lsls r0, 3\n\
    adds r3, r0, r6\n\
    ldrh r0, [r3, 0x16]\n\
    lsls r4, r0, 16\n\
    cmp r4, 0\n\
    beq _08149008\n\
    movs r1, 0x18\n\
    ldrsh r0, [r3, r1]\n\
    lsls r0, 16\n\
    ldrh r1, [r3, 0x1A]\n\
    adds r2, r0, r1\n\
    lsrs r0, r4, 12\n\
    subs r2, r0\n\
    asrs r1, r2, 16\n\
    strh r1, [r3, 0x18]\n\
    strh r2, [r3, 0x1A]\n\
    ldr r0, _08149018 @ =REG_BG3HOFS\n\
    strh r1, [r0]\n\
    ldr r1, _0814901C @ =REG_BG3VOFS\n\
    ldr r0, _08149014 @ =gUnknown_02039358\n\
    ldrh r0, [r0]\n\
    strh r0, [r1]\n\
_08149008:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08149010: .4byte REG_BG2VOFS\n\
_08149014: .4byte gUnknown_02039358\n\
_08149018: .4byte REG_BG3HOFS\n\
_0814901C: .4byte REG_BG3VOFS\n\
    .syntax divided\n");
}
#endif

void sub_8149020(u8 mode)
{
	u16 var1;
	u16 var2;
    switch (mode)
    {
		case 0:
        default:
            /* stuff */
			if(gMain.vblankCounter1 & 3 || gPaletteFade.active) break;
			if(gMain.vblankCounter1 & 4)
			{
			    var1 = gPlttBufferUnfaded[9];
				var2 = gPlttBufferUnfaded[10];
			}
			else
			{
				var1 = gPlttBufferUnfaded[10];
				var2 = gPlttBufferUnfaded[9];
			}
			LoadPalette(&var1, 9, 2);
			LoadPalette(&var2, 10, 2);
            break;
        case 2:
            /* stuff */
			if(gMain.vblankCounter1 & 3 || gPaletteFade.active) break;
			if(gMain.vblankCounter1 & 4)
			{
			    var1 = 0x3D27;
				var2 = 0x295;
			}
			else
			{
			    var1 = 0x31C;
				var2 = 0x3D27;
			}
			LoadPalette(&var1, 12, 2);
			LoadPalette(&var2, 13, 2);
            break;
        case 1:
            break;
    }
}

void sub_814910C(struct Sprite *sprite)
{
    if(gUnknown_0203935C)
	{
	    DestroySprite(sprite);
	}
	else
	{
	    s32 var = ((sprite->pos1.x << 16) | (u16)sprite->data2) + (u16)sprite->data1;
        sprite->pos1.x = var >> 16;
        sprite->data2 = var;
		if (sprite->pos1.x > 255) sprite->pos1.x = 0xFFE0;
		if (sprite->data0)
		{
			sprite->pos2.y = -(gUnknown_02039358 + gUnknown_0203935A);
		}
		else
		{
			sprite->pos2.y = -gUnknown_02039358;
		}
	}
}

void sub_8149174(u8 a, struct UnknownStruct1 *b, const union AnimCmd *const *c, u8 d)
{
    u8 i;

	for(i = 0; i < d; i++)
	{
		u8 sprite = CreateSprite(&gSpriteTemplate_8416B3C, b[i].var1, b[i].var2, b[i].var3);
		CalcCenterToCornerVec(&gSprites[sprite], b[i].var0_4, b[i].var0_6, 0);
		gSprites[sprite].oam.priority = 3;
        gSprites[sprite].oam.shape = b[i].var0_4;
        gSprites[sprite].oam.size = b[i].var0_6;
        gSprites[sprite].oam.paletteNum = 0;
        gSprites[sprite].anims = c;
        StartSpriteAnim(&gSprites[sprite], b[i].var0_0);
        gSprites[sprite].data0 = a;
        gSprites[sprite].data1 = b[i].var4;
        gSprites[sprite].data2 = 0;
    }
}

void sub_8149248()
{
    sub_8149174(0, &gUnknown_08416B94, &gSpriteAnimTable_8416B84, 9);
}

void sub_8149264()
{
    sub_8149174(1, &gUnknown_08416C10, &gSpriteAnimTable_8416C04, 12);
}

void sub_8149280()
{
    sub_8149174(1, &gUnknown_08416C8C, &gSpriteAnimTable_8416C88, 6);
}

void nullsub_82()
{
}

void sub_81492A0(struct Sprite* sprite)
{
    sprite->invisible = gSprites[sprite->data0].invisible;
	sprite->pos1.x = gSprites[sprite->data0].pos1.x;
	sprite->pos1.y = gSprites[sprite->data0].pos1.y + 8;
	sprite->pos2.x = gSprites[sprite->data0].pos2.x;
	sprite->pos2.y = gSprites[sprite->data0].pos2.y;
}



u8 intro_create_brendan_sprite(s16 a, s16 b)
{
	u8 sprite = CreateSprite(&gSpriteTemplate_8416CDC, a, b, 0);
	u8 brendan = CreateSprite(&gSpriteTemplate_Brendan, a, b + 8, 1);
	gSprites[brendan].data0 = sprite;
	return sprite;
}

u8 intro_create_may_sprite(s16 a, s16 b)
{
	u8 sprite = CreateSprite(&gSpriteTemplate_8416CF4, a, b, 0);
	u8 may = CreateSprite(&gSpriteTemplate_May, a, b + 8, 1);
	gSprites[may].data0 = sprite;
	return sprite;
}

void nullsub_83()
{
}

void sub_81493C4(struct Sprite* sprite)
{
    sprite->invisible = gSprites[sprite->data0].invisible;
	sprite->pos1.y = gSprites[sprite->data0].pos1.y;
	sprite->pos2.x = gSprites[sprite->data0].pos2.x;
	sprite->pos2.y = gSprites[sprite->data0].pos2.y;
}

u8 intro_create_latios_sprite(s16 a, s16 b)
{
    u8 sprite = CreateSprite(&gSpriteTemplate_8416D7C, a - 32, b, 2);
	u8 latios = CreateSprite(&gSpriteTemplate_8416D7C, a + 32, b, 2);
	gSprites[latios].data0 = sprite;
	StartSpriteAnim(&gSprites[latios], 1);
	gSprites[latios].callback = &sub_81493C4;
	return sprite;
}

u8 intro_create_latias_sprite(s16 a, s16 b)
{
    u8 sprite = CreateSprite(&gSpriteTemplate_8416D94, a - 32, b, 2);
	u8 latios = CreateSprite(&gSpriteTemplate_8416D94, a + 32, b, 2);
	gSprites[latios].data0 = sprite;
	StartSpriteAnim(&gSprites[latios], 1);
	gSprites[latios].callback = &sub_81493C4;
	return sprite;
}

/* 	thumb_func_start intro_create_latios_sprite
intro_create_latios_sprite: @ 8149424
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _08149490 @ =gSpriteTemplate_8416D7C
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _08149494 @ =0xffe00000
	adds r2, r0
	asrs r2, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, r8
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r4, 0x20
	lsls r4, 16
	asrs r4, 16
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08149498 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0814949C @ =sub_81493C4
	str r0, [r4]
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08149490: .4byte gSpriteTemplate_8416D7C
_08149494: .4byte 0xffe00000
_08149498: .4byte gSprites
_0814949C: .4byte sub_81493C4
	thumb_func_end intro_create_latios_sprite */