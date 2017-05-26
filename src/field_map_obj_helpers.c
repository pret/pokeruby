#include "field_map_obj.h"
#include "field_ground_effect.h"
#include "global.h"
#include "field_map_obj_helpers.h"
#include "field_effect.h"
#include "sprite.h"

typedef void (*SpriteStepFunc)(struct Sprite *sprite, u8 dir);

extern u32 gUnknown_0202FF84[];

extern struct UCoords16 gDirectionToVector[];
extern s16 gUnknown_08376194[];
extern SpriteStepFunc *gUnknown_08376180[];
extern s8 *gUnknown_083761D0[];
extern s16 gUnknown_083761DC[];
extern u8 gUnknown_083761E2[];
extern s16 gUnknown_083761E6[];
extern u8 gUnknown_083761EC[];

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

void FreezeMapObjects()
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
    sprite->pos1.x += 2 * gDirectionToVector[dir].x;
    sprite->pos1.y += 2 * gDirectionToVector[dir].y;
}

void Step3(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 2 * gDirectionToVector[dir].x + gDirectionToVector[dir].x;
    sprite->pos1.y += 2 * gDirectionToVector[dir].y + gDirectionToVector[dir].y;
}

void Step4(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 4 * gDirectionToVector[dir].x;
    sprite->pos1.y += 4 * gDirectionToVector[dir].y;
}

void Step8(struct Sprite *sprite, u8 dir)
{
    sprite->pos1.x += 8 * gDirectionToVector[dir].x;
    sprite->pos1.y += 8 * gDirectionToVector[dir].y;
}

void oamt_npc_ministep_reset(struct Sprite *sprite, u8 a2, u8 a3)
{
    sprite->data3 = a2;
    sprite->data4 = a3;
    sprite->data5 = 0;
}

bool8 obj_npc_ministep(struct Sprite *sprite)
{
    if (sprite->data5 >= gUnknown_08376194[sprite->data4])
        return FALSE;

    gUnknown_08376180[sprite->data4][sprite->data5](sprite, sprite->data3);

    sprite->data5++;

    if (sprite->data5 < gUnknown_08376194[sprite->data4])
        return FALSE;

    return TRUE;
}

void sub_806467C(struct Sprite *sprite, u8 a2)
{
    sprite->data3 = a2;
    sprite->data4 = 0;
    sprite->data5 = 0;
}

bool8 sub_806468C(struct Sprite *sprite)
{
    if (!(sprite->data4 & 1))
    {
        Step1(sprite, sprite->data3);
        sprite->data5++;
    }

    sprite->data4++;

    if (sprite->data5 > 15)
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
    sprite->data3 = a2;
    sprite->data4 = a3;
    sprite->data5 = a4;
    sprite->data6 = 0;
}

u8 sub_8064704(struct Sprite *sprite)
{
    u8 v2;
    s16 v5[3];
    u8 v6[3];

    memcpy(v5, gUnknown_083761DC, 6);
    memcpy(v6, gUnknown_083761E2, 3);

    v2 = 0;

    if (sprite->data4)
        Step1(sprite, sprite->data3);

    sprite->pos2.y = sub_80646C8(sprite->data6 >> v6[sprite->data4], sprite->data5);

    sprite->data6++;

    if (sprite->data6 == (v5[sprite->data4] >> 1))
        v2 = 1;

    if (sprite->data6 >= v5[sprite->data4])
    {
        sprite->pos2.y = 0;
        v2 = -1;
    }

    return v2;
}

u8 sub_806478C(struct Sprite *sprite)
{
    u8 v2;
    s16 v5[3];
    u8 v6[3];

    memcpy(v5, gUnknown_083761E6, 6);
    memcpy(v6, gUnknown_083761EC, 3);

    v2 = 0;

    if (sprite->data4 && !(sprite->data6 & 1))
        Step1(sprite, sprite->data3);

    sprite->pos2.y = sub_80646C8(sprite->data6 >> v6[sprite->data4], sprite->data5);

    sprite->data6++;

    if (sprite->data6 == (v5[sprite->data4] >> 1))
        v2 = 1;

    if (sprite->data6 >= v5[sprite->data4])
    {
        sprite->pos2.y = 0;
        v2 = -1;
    }

    return v2;
}

void sub_8064820(struct Sprite *sprite, u16 a2)
{
    sprite->data3 = a2;
}

bool8 sub_8064824(struct Sprite *sprite)
{
    sprite->data3--;

    if (sprite->data3 == 0)
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
    SetObjectSubpriorityByZCoord(sprite->data1, sprite, 1);
    sub_806487C(sprite, 0);
}

void sub_8064990(u8 a1, u8 dir)
{
    u8 i;
    for (i = 0; i < MAX_SPRITES; i++)
    {
        struct Sprite *sprite = &gSprites[i];
        if (sprite->inUse && sprite->callback == sub_8064970 && (u8)sprite->data0 == a1)
        {
            u8 animNum = FieldObjectDirectionToImageAnimId(dir);
            StartSpriteAnim(sprite, animNum);
            break;
        }
    }
}

u32 oe_exec_and_other_stuff(u8 fieldEffectId, struct MapObject *mapObject)
{
    FieldObjectGetLocalIdAndMap(mapObject, (u8 *)&gUnknown_0202FF84[0], (u8 *)&gUnknown_0202FF84[1], (u8 *)&gUnknown_0202FF84[2]);
    return FieldEffectStart(fieldEffectId);
}

void DoShadowFieldEffect(struct MapObject *mapObject)
{
    if (!mapObject->mapobj_bit_22)
    {
        mapObject->mapobj_bit_22 = 1;
        oe_exec_and_other_stuff(3, mapObject);
    }
}

void DoRippleFieldEffect(struct MapObject *mapObject, struct Sprite *sprite)
{
    const struct MapObjectGraphicsInfo *gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    gUnknown_0202FF84[0] = sprite->pos1.x;
    gUnknown_0202FF84[1] = sprite->pos1.y + (gfxInfo->height >> 1) - 2;
    gUnknown_0202FF84[2] = 151;
    gUnknown_0202FF84[3] = 3;
    FieldEffectStart(5);
}
