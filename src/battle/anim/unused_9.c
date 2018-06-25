#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "palette.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80CFDFC(struct Sprite* sprite);
static void sub_80CFE2C(struct Sprite* sprite);

// unused_9? (Most likely an unused effect.)
// I cannot find any reference to this sprite template used to call this.

const struct SpriteTemplate gSpriteTemplate_83D75AC =
{
    .tileTag = 10178,
    .paletteTag = 10178,
    .oam = &gOamData_837E05C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CFDFC,
};

void sub_80CFDFC(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 0);
    sprite->data[0] = 0x100 + (IndexOfSpritePaletteTag(gSpriteTemplate_83D75AC.paletteTag) << 4);
    sprite->callback = sub_80CFE2C;
}

#ifdef NONMATCHING
static void sub_80CFE2C(struct Sprite* sprite)
{
    u16 r7;
    u16 r5;
    int i;
    if (++sprite->data[1] == 2)
    {
        sprite->data[1] = 0;
        r5 = sprite->data[0];
        r7 = gPlttBufferFaded[r5 + 8];
        for (i = 0; i < 8; i++)
        {
            gPlttBufferFaded[r5 + i + 8] = gPlttBufferFaded[r5 + i + 9];
        }
        gPlttBufferFaded[r5 + 15] = r7;

        if (++sprite->data[2] == 0x18)
            DestroyAnimSprite(sprite);
    }
}
#else
NAKED
static void sub_80CFE2C(struct Sprite* sprite)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
	adds r4, r0, 0\n\
	ldrh r0, [r4, 0x30]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x30]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x2\n\
	bne _080CFE90\n\
	movs r0, 0\n\
	strh r0, [r4, 0x30]\n\
	ldrh r5, [r4, 0x2E]\n\
	ldr r1, _080CFE98 @ =gPlttBufferFaded\n\
	adds r0, r5, 0\n\
	adds r0, 0x8\n\
	lsls r0, 1\n\
	adds r0, r1\n\
	ldrh r7, [r0]\n\
	adds r6, r1, 0 @puts gPlttBufferFaded in r6\n\
	adds r1, r5, 0\n\
	adds r1, 0x9\n\
	lsls r0, r5, 1\n\
	adds r0, r6 \n\
	adds r2, r0, 0\n\
	adds r2, 0x10\n\
	movs r3, 0x7\n\
	lsls r1, 1\n\
	adds r1, r6 \n\
_080CFE64:\n\
	ldrh r0, [r1]\n\
	strh r0, [r2]\n\
	adds r1, 0x2\n\
	adds r2, 0x2\n\
	subs r3, 0x1\n\
	cmp r3, 0\n\
	bge _080CFE64\n\
	adds r0, r5, 0\n\
	adds r0, 0xF\n\
	lsls r0, 1\n\
	adds r0, r6\n\
	strh r7, [r0]\n\
	ldrh r0, [r4, 0x32]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x32]\n\
	lsls r0, 16\n\
	asrs r0, 16\n\
	cmp r0, 0x18\n\
	bne _080CFE90\n\
	adds r0, r4, 0\n\
	bl DestroyAnimSprite\n\
_080CFE90:\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080CFE98: .4byte gPlttBufferFaded\n\
.syntax divided\n");
}
#endif
