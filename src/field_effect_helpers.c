//
// Created by scott on 9/9/2017.
//


// Includes
#include "global.h"
#include "sprite.h"
#include "field_map_obj.h"
#include "field_effect_helpers.h"

// Static type declarations

// Static RAM declarations

// Static ROM declarations
/*static*/ void sub_81269E0(struct Sprite *);
/*static*/ void npc_pal_op(struct MapObject *mapObject, struct Sprite *sprite);

// .rodata

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
