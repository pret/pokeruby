//
// Created by scott on 9/9/2017.
//


// Includes
#include "global.h"
#include "sprite.h"
#include "metatile_behavior.h"
#include "field_map_obj.h"
#include "field_weather.h"
#include "field_effect.h"
#include "field_effect_helpers.h"

// Static type declarations

// Static RAM declarations

// Static ROM declarations
static void sub_81269E0(struct Sprite *);
static void npc_pal_op(struct MapObject *mapObject, struct Sprite *sprite);
static void npc_pal_op_A(struct MapObject *, u8);
static void npc_pal_op_B(struct MapObject *, u8);
/*static*/ void sub_81275A0(struct Sprite *);
/*static*/ void sub_81275C4(struct Sprite *);
/*static*/ void sub_8127DA0(struct Sprite *);
/*static*/ void sub_8127DD0(struct Sprite *);
/*static*/ void sub_8127E30(struct Sprite *);

// .rodata

const u8 UnusedEggString_8401E28[] = _("タマゴ");

const u16 gUnknown_08401E2C[] = {
    0x0c,
    0x1c,
    0x2c
};

const u8 gUnknown_08401E32[] = {
    0,
    1,
    2,
    3
};

const u16 gUnknown_08401E36[] = {
     4,
     4,
     4,
    16
};

void (*const gUnknown_08401E40[])(struct Sprite *) = {
    sub_81275A0,
    sub_81275C4
};

void (*const gUnknown_08401E48[])(struct Sprite *) = {
    sub_8127DA0,
    sub_8127DD0,
    sub_8127E30
};

const u8 gUnknown_08401E54[] = {
    0,
    0,
    1,
    2,
    3
};

const u16 gUnknown_08401E5A[] = {
    3,
    7
};

// .text

void SetUpReflection(struct MapObject *mapObject, struct Sprite *sprite, bool8 flag)
{
    struct Sprite *newSprite;

    newSprite = &gSprites[obj_unfreeze(sprite, sprite->pos1.x, sprite->pos1.y, 0x98)];
    newSprite->callback = sub_81269E0;
    newSprite->oam.priority = 3;
    newSprite->oam.paletteNum = gUnknown_0830FD14[newSprite->oam.paletteNum];
    newSprite->usingSheet = TRUE;
    newSprite->anims = gDummySpriteAnimTable;
    StartSpriteAnim(newSprite, 0);
    newSprite->affineAnims = gDummySpriteAffineAnimTable;
    newSprite->affineAnimBeginning = TRUE;
    newSprite->subspriteMode = 0;
    newSprite->data0 = sprite->data0;
    newSprite->data1 = mapObject->localId;
    newSprite->data7 = flag;
    npc_pal_op(mapObject, newSprite);
    if (!flag)
    {
        newSprite->oam.affineMode = 1;
    }
}

s16 sub_81268D0(struct MapObject *mapObject)
{
    return GetFieldObjectGraphicsInfo(mapObject->graphicsId)->height - 2;
}

static void npc_pal_op(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 whichElement;
    u16 unk_8041e2c[3];

    memcpy(unk_8041e2c, gUnknown_08401E2C, sizeof gUnknown_08401E2C);
    sprite->data2 = 0;
    if (!GetFieldObjectGraphicsInfo(mapObject->graphicsId)->disableReflectionPaletteLoad && ((whichElement = sub_8057450(mapObject->mapobj_unk_1F)) || (whichElement = sub_8057450(mapObject->mapobj_unk_1E))))
    {
        sprite->data2 = unk_8041e2c[whichElement - 1];
        npc_pal_op_A(mapObject, sprite->oam.paletteNum);
    }
    else
    {
        npc_pal_op_B(mapObject, sprite->oam.paletteNum);
    }
}

static void npc_pal_op_B(struct MapObject *mapObject, u8 paletteNum)
{
    const struct MapObjectGraphicsInfo *graphicsInfo;

    graphicsInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    if (graphicsInfo->paletteTag2 != 0x11ff)
    {
        if (graphicsInfo->paletteSlot == 0)
        {
            npc_load_two_palettes__no_record(graphicsInfo->paletteTag1, paletteNum);
        }
        else if (graphicsInfo->paletteSlot == 10)
        {
            npc_load_two_palettes__and_record(graphicsInfo->paletteTag1, paletteNum);
        }
        else
        {
            pal_patch_for_npc(npc_paltag_by_palslot(paletteNum), paletteNum);
        }
        sub_807D78C(paletteNum);
    }
}

static void npc_pal_op_A(struct MapObject *mapObject, u8 paletteNum)
{
    const struct MapObjectGraphicsInfo *graphicsInfo;

    graphicsInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    if (graphicsInfo->paletteTag2 != 0x11ff)
    {
        pal_patch_for_npc(graphicsInfo->paletteTag2, paletteNum);
        sub_807D78C(paletteNum);
    }
}

static void sub_81269E0(struct Sprite *sprite)
{
    struct MapObject *mapObject;
    struct Sprite *oldSprite;

    mapObject = &gMapObjects[sprite->data0];
    oldSprite = &gSprites[mapObject->spriteId];
    if (!mapObject->active || !mapObject->mapobj_bit_17 || mapObject->localId != sprite->data1)
    {
        sprite->inUse = FALSE;
    }
    else
    {
        sprite->oam.paletteNum = gUnknown_0830FD14[oldSprite->oam.paletteNum];
        sprite->oam.shape = oldSprite->oam.shape;
        sprite->oam.size = oldSprite->oam.size;
        sprite->oam.matrixNum = oldSprite->oam.matrixNum | 0x10;
        sprite->oam.tileNum = oldSprite->oam.tileNum;
        sprite->subspriteTables = oldSprite->subspriteTables;
        sprite->subspriteTableNum = oldSprite->subspriteTableNum;
        sprite->invisible = oldSprite->invisible;
        sprite->pos1.x = oldSprite->pos1.x;
        sprite->pos1.y = oldSprite->pos1.y + sub_81268D0(mapObject) + sprite->data2;
        sprite->centerToCornerVecX = oldSprite->centerToCornerVecX;
        sprite->centerToCornerVecY = oldSprite->centerToCornerVecY;
        sprite->pos2.x = oldSprite->pos2.x;
        sprite->pos2.y = -oldSprite->pos2.y;
        sprite->coordOffsetEnabled = oldSprite->coordOffsetEnabled;
        if (sprite->data7 == FALSE)
        {
            sprite->oam.matrixNum = 0;
            if (oldSprite->oam.matrixNum & 0x8)
            {
                sprite->oam.matrixNum = 1;
            }
        }
    }
}

u8 sub_8126B54(void)
{
    u8 spriteId;
    struct Sprite *sprite;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[8] /*gFieldEffectSpriteTemplate_Arrow*/, 0, 0, 0x52);
    if (spriteId != MAX_SPRITES)
    {
        sprite = &gSprites[spriteId];
        sprite->oam.priority = 1;
        sprite->coordOffsetEnabled = TRUE;
        sprite->invisible = TRUE;
    }
    return spriteId;
}

void objid_set_invisible(u8 spriteId)
{
    gSprites[spriteId].invisible = TRUE;
}

void sub_8126BC4(u8 spriteId, u8 animNum, s16 x, s16 y)
{
    s16 x2;
    s16 y2;
    struct Sprite *sprite;

    sprite = &gSprites[spriteId];
    if (sprite->invisible || sprite->data0 != x || sprite->data1 != y)
    {
        sub_80603CC(x, y, &x2, &y2);
        sprite = &gSprites[spriteId];
        sprite->pos1.x = x2 + 8;
        sprite->pos1.y = y2 + 8;
        sprite->invisible = FALSE;
        sprite->data0 = x;
        sprite->data1 = y;
        StartSpriteAnim(sprite, animNum - 1);
    }
}

bool8 FldEff_Shadow(void)
{
    u8 mapObjectId;
    const struct MapObjectGraphicsInfo *graphicsInfo;
    u8 spriteId;

    mapObjectId = GetFieldObjectIdByLocalIdAndMap(gUnknown_0202FF84[0], gUnknown_0202FF84[1], gUnknown_0202FF84[2]);
    graphicsInfo = GetFieldObjectGraphicsInfo(gMapObjects[mapObjectId].graphicsId);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[gUnknown_08401E32[graphicsInfo->shadowSize]], 0, 0, 0x94);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].coordOffsetEnabled = TRUE;
        gSprites[spriteId].data0 = gUnknown_0202FF84[0];
        gSprites[spriteId].data1 = gUnknown_0202FF84[1];
        gSprites[spriteId].data2 = gUnknown_0202FF84[2];
        gSprites[spriteId].data3 = (graphicsInfo->height >> 1) - gUnknown_08401E36[graphicsInfo->shadowSize];
    }
    return FALSE;
}
