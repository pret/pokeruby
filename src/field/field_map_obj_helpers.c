#include "global.h"
#include "field_map_obj_helpers.h"
#include "field_effect.h"
#include "field_ground_effect.h"
#include "field_map_obj.h"
#include "sprite.h"

typedef void (*SpriteStepFunc)(struct Sprite *sprite, u8 dir);

void Step1(struct Sprite *sprite, u8 dir);
void Step2(struct Sprite *sprite, u8 dir);
void Step3(struct Sprite *sprite, u8 dir);
void Step4(struct Sprite *sprite, u8 dir);
void Step8(struct Sprite *sprite, u8 dir);

const SpriteStepFunc Unknown_83760F0[] = {
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1,
    Step1
};

const SpriteStepFunc Unknown_8376130[] = {
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2,
    Step2
};

const SpriteStepFunc Unknown_8376150[] = {
    Step2,
    Step3,
    Step3,
    Step2,
    Step3,
    Step3
};

const SpriteStepFunc Unknown_8376168[] = {
    Step4,
    Step4,
    Step4,
    Step4
};

const SpriteStepFunc Unknown_8376178[] = {
    Step8,
    Step8
};

const SpriteStepFunc *const gUnknown_08376180[] = {
    Unknown_83760F0,
    Unknown_8376130,
    Unknown_8376150,
    Unknown_8376168,
    Unknown_8376178
};

const s16 gUnknown_08376194[] = {
    16, 8, 6, 4, 2
};

const s8 Unknown_837619E[] = {
     -4,  -6,  -8, -10, -11, -12, -12, -12, -11, -10,  -9,  -8,  -6,  -4,   0,   0
};

const s8 Unknown_83761AE[] = {
      0,  -2,  -3,  -4,  -5,  -6,  -6,  -6,  -5,  -5,  -4,  -3,  -2,   0,   0,   0
};

const s8 Unknown_83761BE[] = {
     -2,  -4,  -6,  -8,  -9, -10, -10, -10,  -9,  -8,  -6,  -5,  -3,  -2,   0,   0
};

const s8 *const gUnknown_083761D0[] = {
    Unknown_837619E,
    Unknown_83761AE,
    Unknown_83761BE
};

bool8 FreezeMapObject(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6 || mapObject->mapobj_bit_8)
    {
        return TRUE;
    }
    else
    {
        mapObject->mapobj_bit_8 = 1;
        mapObject->mapobj_bit_23 = gSprites[mapObject->spriteId].animPaused;
        mapObject->mapobj_bit_24 = gSprites[mapObject->spriteId].affineAnimPaused;
        gSprites[mapObject->spriteId].animPaused = 1;
        gSprites[mapObject->spriteId].affineAnimPaused = 1;
        return FALSE;
    }
}

void FreezeMapObjects(void)
{
    u8 i;
    for (i = 0; i < 16; i++)
        if (gMapObjects[i].active && i != gPlayerAvatar.mapObjectId)
            FreezeMapObject(&gMapObjects[i]);
}

void FreezeMapObjectsExceptOne(u8 a1)
{
    u8 i;
    for (i = 0; i < 16; i++)
        if (i != a1 && gMapObjects[i].active && i != gPlayerAvatar.mapObjectId)
            FreezeMapObject(&gMapObjects[i]);
}

void UnfreezeMapObject(struct MapObject *mapObject)
{
    if (mapObject->active && mapObject->mapobj_bit_8)
    {
        mapObject->mapobj_bit_8 = 0;
        gSprites[mapObject->spriteId].animPaused = mapObject->mapobj_bit_23;
        gSprites[mapObject->spriteId].affineAnimPaused = mapObject->mapobj_bit_24;
    }
}

void UnfreezeMapObjects(void)
{
    u8 i;
    for (i = 0; i < 16; i++)
        if (gMapObjects[i].active)
            UnfreezeMapObject(&gMapObjects[i]);
}

void Step1(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += gDirectionToVector[dir].x;
    sprite->pos1.y += gDirectionToVector[dir].y;
}

void Step2(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 2 * (u16) gDirectionToVector[dir].x;
    sprite->pos1.y += 2 * (u16) gDirectionToVector[dir].y;
}

void Step3(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 2 * (u16) gDirectionToVector[dir].x + (u16) gDirectionToVector[dir].x;
    sprite->pos1.y += 2 * (u16) gDirectionToVector[dir].y + (u16) gDirectionToVector[dir].y;
}

void Step4(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 4 * (u16) gDirectionToVector[dir].x;
    sprite->pos1.y += 4 * (u16) gDirectionToVector[dir].y;
}

void Step8(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 8 * (u16) gDirectionToVector[dir].x;
    sprite->pos1.y += 8 * (u16) gDirectionToVector[dir].y;
}

void oamt_npc_ministep_reset(struct Sprite *sprite, u8 a2, u8 a3)
{
    sprite->data[3] = a2;
    sprite->data[4] = a3;
    sprite->data[5] = 0;
}

bool8 obj_npc_ministep(struct Sprite *sprite)
{
    if (sprite->data[5] >= gUnknown_08376194[sprite->data[4]])
        return FALSE;

    gUnknown_08376180[sprite->data[4]][sprite->data[5]](sprite, sprite->data[3]);

    sprite->data[5]++;

    if (sprite->data[5] < gUnknown_08376194[sprite->data[4]])
        return FALSE;

    return TRUE;
}

void sub_806467C(struct Sprite *sprite, u8 a2)
{
    sprite->data[3] = a2;
    sprite->data[4] = 0;
    sprite->data[5] = 0;
}

bool8 sub_806468C(struct Sprite *sprite)
{
    if (!(sprite->data[4] & 1))
    {
        Step1(sprite, sprite->data[3]);
        sprite->data[5]++;
    }

    sprite->data[4]++;

    if (sprite->data[5] > 15)
        return TRUE;
    else
        return FALSE;
}

s16 sub_80646C8(s16 a1, u8 a2)
{
    return gUnknown_083761D0[a2][a1];
}

void sub_80646E4(struct Sprite *sprite, u8 a2, u8 a3, u8 a4)
{
    sprite->data[3] = a2;
    sprite->data[4] = a3;
    sprite->data[5] = a4;
    sprite->data[6] = 0;
}

u8 sub_8064704(struct Sprite *sprite)
{
    s16 v5[3] = {0x10, 0x10, 0x20};
    u8 v6[3] = {0, 0, 1};
    u8 v2 = 0;

    if (sprite->data[4])
        Step1(sprite, sprite->data[3]);

    sprite->pos2.y = sub_80646C8(sprite->data[6] >> v6[sprite->data[4]], sprite->data[5]);

    sprite->data[6]++;

    if (sprite->data[6] == (v5[sprite->data[4]] >> 1))
        v2 = 1;

    if (sprite->data[6] >= v5[sprite->data[4]])
    {
        sprite->pos2.y = 0;
        v2 = -1;
    }

    return v2;
}

u8 sub_806478C(struct Sprite *sprite)
{
    s16 v5[3] = {0x20, 0x20, 0x40};
    u8 v6[3] = {1, 1, 2};
    u8 v2 = 0;

    if (sprite->data[4] && !(sprite->data[6] & 1))
        Step1(sprite, sprite->data[3]);

    sprite->pos2.y = sub_80646C8(sprite->data[6] >> v6[sprite->data[4]], sprite->data[5]);

    sprite->data[6]++;

    if (sprite->data[6] == (v5[sprite->data[4]] >> 1))
        v2 = 1;

    if (sprite->data[6] >= v5[sprite->data[4]])
    {
        sprite->pos2.y = 0;
        v2 = -1;
    }

    return v2;
}

void sub_8064820(struct Sprite *sprite, u16 a2)
{
    sprite->data[3] = a2;
}

bool8 sub_8064824(struct Sprite *sprite)
{
    sprite->data[3]--;

    if (sprite->data[3] == 0)
        return TRUE;
    else
        return FALSE;
}

void obj_anim_image_set_and_seek(struct Sprite *sprite, u8 a2, u8 a3)
{
    sprite->animNum = a2;
    sprite->animPaused = 0 ;
    SeekSpriteAnim(sprite, a3);
}

bool8 sub_8064864(struct Sprite *sprite)
{
    if (sprite->animEnded)
        return TRUE;
    else
        return FALSE;
}

void sub_806487C(struct Sprite *sprite, bool8 invisible)
{
    u16 x, y;
    s16 x2, y2;

    sprite->invisible = invisible;

    if (sprite->coordOffsetEnabled)
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY;
    }
    else
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY;
    }

    x2 = x - (sprite->centerToCornerVecX >> 1);
    y2 = y - (sprite->centerToCornerVecY >> 1);

    if ((s16)x > 255 || x2 < -16)
        sprite->invisible = 1;
    if ((s16)y > 175 || y2 < -16)
        sprite->invisible = 1;
}

void sub_8064970(struct Sprite *sprite)
{
    SetObjectSubpriorityByZCoord(sprite->data[1], sprite, 1);
    sub_806487C(sprite, 0);
}

void sub_8064990(u8 a1, u8 dir)
{
    u8 i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == sub_8064970 && (u8)sprite->data[0] == a1)
        {
            u8 animNum = FieldObjectDirectionToImageAnimId(dir);
            StartSpriteAnim(sprite, animNum);
            break;
        }
    }
}

u32 oe_exec_and_other_stuff(u8 fieldEffectId, struct MapObject *mapObject)
{
    FieldObjectGetLocalIdAndMap(mapObject, &gFieldEffectArguments[0], &gFieldEffectArguments[1], &gFieldEffectArguments[2]);
    return FieldEffectStart(fieldEffectId);
}

void DoShadowFieldEffect(struct MapObject *mapObject)
{
    if (!mapObject->mapobj_bit_22)
    {
        mapObject->mapobj_bit_22 = 1;
        oe_exec_and_other_stuff(FLDEFF_SHADOW, mapObject);
    }
}

void DoRippleFieldEffect(struct MapObject *mapObject, struct Sprite *sprite)
{
    const struct MapObjectGraphicsInfo *gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    gFieldEffectArguments[0] = sprite->pos1.x;
    gFieldEffectArguments[1] = sprite->pos1.y + (gfxInfo->height >> 1) - 2;
    gFieldEffectArguments[2] = 151;
    gFieldEffectArguments[3] = 3;
    FieldEffectStart(FLDEFF_RIPPLE);
}
