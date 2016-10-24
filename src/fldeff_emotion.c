#include "global.h"
#include "sprite.h"
#include "fieldmap.h"

extern u32 gUnknown_0202FF84[];

extern struct SpriteTemplate gSpriteTemplate_839B510;
extern struct SpriteTemplate gSpriteTemplate_839B528;

bool8 TryGetFieldObjectIdByLocalIdAndMap(u8, u8, u8, u8 *);

void FieldEffectStop(struct Sprite *sprite, u16 a2);
void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3);
void objc_exclamation_mark_probably(struct Sprite *sprite);

u8 FldEff_ExclamationMarkIcon1(void)
{
	u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839B510, 0, 0, 0x53);

	if (spriteId != 64)
		sub_8084894(&gSprites[spriteId], 0, 0);
	
	return 0;
}

u8 FldEff_ExclamationMarkIcon2(void)
{
	u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839B510, 0, 0, 0x52);

	if (spriteId != 64)
		sub_8084894(&gSprites[spriteId], 33, 1);
	
	return 0;
}

u8 FldEff_HeartIcon(void)
{
	u8 spriteId = CreateSpriteAtEnd(&gSpriteTemplate_839B528, 0, 0, 0x52);

	if (spriteId != 64)
		sub_8084894(&gSprites[spriteId], 46, 0);
	
	return 0;
}

void sub_8084894(struct Sprite *sprite, u16 a2, u8 a3)
{
	sprite->oam.priority = 1;
    sprite->coordOffsetEnabled = 1;
	
	sprite->data0 = gUnknown_0202FF84[0];
	sprite->data1 = gUnknown_0202FF84[1];
	sprite->data2 = gUnknown_0202FF84[2];
    sprite->data3 = -5;
    sprite->data7 = a2;
	
	StartSpriteAnim(sprite, a3);
}

void objc_exclamation_mark_probably(struct Sprite *sprite)
{
    u8 mapObjId;

    if (TryGetFieldObjectIdByLocalIdAndMap(sprite->data0, sprite->data1, sprite->data2, &mapObjId) << 24
     || sprite->animEnded)
    {
        FieldEffectStop(sprite, (u8)sprite->data7);
    }
    else
    {
        struct Sprite *mapObjSprite = &gSprites[gMapObjects[mapObjId].spriteId];
        sprite->data4 += sprite->data3;
        sprite->pos1.x = mapObjSprite->pos1.x;
        sprite->pos1.y = mapObjSprite->pos1.y - 16;
        sprite->pos2.x = mapObjSprite->pos2.x;
        sprite->pos2.y = mapObjSprite->pos2.y + sprite->data4;
        if (sprite->data4)
            sprite->data3++;
        else
            sprite->data3 = 0;
    }
}