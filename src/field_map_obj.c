#include "global.h"
#include "field_map_obj.h"
#include "sprite.h"

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[36];

extern void strange_npc_table_clear(void);
extern void ClearPlayerAvatarInfo(void);

void sub_805AAB0(void);
u8 GetFieldObjectIdByLocalId(u8);
u8 GetFieldObjectIdByLocalIdAndMapInternal(u8, u8, u8);
u8 GetAvailableFieldObjectSlot(u16, u8, u8, u8 *);
void FieldObjectHandleDynamicGraphicsId();

extern const u8 gUnknown_0836DBBC[];
extern const u8 gUnknown_0836DC09[];

void npc_clear_ids_and_state(struct MapObject *mapObj)
{
    memset(mapObj, 0, sizeof(struct MapObject));
    mapObj->localId = 0xFF;
    mapObj->mapNum = 0xFF;
    mapObj->mapGroup = 0xFF;
    mapObj->mapobj_unk_1C = 0xFF;
}

void npcs_clear_ids_and_state(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
        npc_clear_ids_and_state(&gMapObjects[i]);
}

void sub_805AA98(void)
{
    strange_npc_table_clear();
    npcs_clear_ids_and_state();
    ClearPlayerAvatarInfo();
    sub_805AAB0();
}

void sub_805AAB0(void)
{
    u8 spriteId;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[21], 0, 0, 0x1F);

    gSprites[spriteId].oam.affineMode = 1;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    gSprites[spriteId].invisible = 1;

    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[21], 0, 0, 0x1F);

    gSprites[spriteId].oam.affineMode = 1;
    InitSpriteAffineAnim(&gSprites[spriteId]);
    StartSpriteAffineAnim(&gSprites[spriteId], 1);
    gSprites[spriteId].invisible = 1;
}

int sub_805AB54(void)
{
    u8 i;
    
    for (i = 0; i < 16; i++)
    {
        if (!gMapObjects[i].active)
            break;
    }
    return i;
}

u8 GetFieldObjectIdByLocalIdAndMap(u8 a, u8 b, u8 c)
{
    if (a <= 0xFE)
        return GetFieldObjectIdByLocalIdAndMapInternal(a, b, c);
    else
        return GetFieldObjectIdByLocalId(a);
}

bool8 TryGetFieldObjectIdByLocalIdAndMap(u8 a, u8 b, u8 c, u8 *d)
{
    *d = GetFieldObjectIdByLocalIdAndMap(a, b, c);
    if (*d == 16)
        return TRUE;
    else
        return FALSE;
}

u8 GetFieldObjectIdByXY(s16 x, s16 y)
{
    u8 i;
    
    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].coords2.x == x && gMapObjects[i].coords2.y == y)
            break;
    }
    return i;
}

u8 GetFieldObjectIdByLocalIdAndMapInternal(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 i;
    
    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].localId == localId && gMapObjects[i].mapNum == mapNum && gMapObjects[i].mapGroup == mapGroup)
            return i;
    }
    return 16;
}

u8 GetFieldObjectIdByLocalId(u8 localId)
{
    u8 i;
    
    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].localId == localId)
            return i;
    }
    return 16;
}

u8 InitFieldObjectStateFromTemplate(struct MapObjectTemplate *template, u8 b, s8 c)
{
    struct MapObject2 *mapObj;  //TODO: resolve the mapobj_unk_19b weirdness
    u8 var;
    u16 r3;
    u16 r2;
    
    if (GetAvailableFieldObjectSlot(template->localId, b, c, &var) != 0)
        return 16;
    //_0805ACCE
    mapObj = (struct MapObject2 *)&gMapObjects[var];
    npc_clear_ids_and_state((struct MapObject *)mapObj);
    r3 = template->x + 7;
    r2 = template->y + 7;
    mapObj->active = TRUE;
    mapObj->mapobj_bit_2 = TRUE;
    mapObj->graphicsId = template->graphicsId;
    mapObj->animPattern = template->movementType;
    mapObj->localId = template->localId;
    mapObj->mapNum = b;
    mapObj->mapGroup = c;
    mapObj->coords1.x = r3;
    mapObj->coords1.y = r2;
    mapObj->coords2.x = r3;
    mapObj->coords2.y = r2;
    mapObj->coords3.x = r3;
    mapObj->coords3.y = r2;
    mapObj->mapobj_unk_0B_0 = template->elevation;
    mapObj->elevation = template->elevation;
    mapObj->mapobj_unk_19 = template->unkA_0;
    mapObj->mapobj_unk_19b = template->unkA_4;
    mapObj->trainerType = template->unkC;
    mapObj->trainerRange_berryTreeId = template->unkE;
    mapObj->mapobj_unk_20 = gUnknown_0836DC09[template->movementType];
    FieldObjectSetDirection((struct MapObject *)mapObj, mapObj->mapobj_unk_20);
    FieldObjectHandleDynamicGraphicsId(mapObj);
    //asm("":::"r5","r6");
    if (gUnknown_0836DBBC[mapObj->animPattern] != 0)
    {
        if (mapObj->mapobj_unk_19 == 0)
            mapObj->mapobj_unk_19++;
        if (mapObj->mapobj_unk_19b == 0)
            mapObj->mapobj_unk_19b++;
    }
    return var;
}

/*
u8 InitFieldObjectStateFromTemplate(struct MapObjectTemplate *template, u8 b, s8 c)
{
    struct MapObject2 *mapObj;  //TODO: resolve the mapobj_unk_19b weirdness
    u8 var;
    u16 r3;
    u16 r2;
    
    if (GetAvailableFieldObjectSlot(template->localId, b, c, &var) != 0)
        return 16;
    //_0805ACCE
    mapObj = (struct MapObject2 *)&gMapObjects[var];
    npc_clear_ids_and_state((struct MapObject *)mapObj);
    r3 = template->x + 7;
    r2 = template->y + 7;
    mapObj->active = TRUE;
    mapObj->mapobj_bit_2 = TRUE;
    mapObj->graphicsId = template->graphicsId;
    mapObj->animPattern = template->movementType;
    mapObj->localId = template->localId;
    mapObj->mapNum = b;
    mapObj->mapGroup = c;
    mapObj->coords1.x = r3;
    mapObj->coords1.y = r2;
    mapObj->coords2.x = r3;
    mapObj->coords2.y = r2;
    mapObj->coords3.x = r3;
    mapObj->coords3.y = r2;
    mapObj->mapobj_unk_0B_0 = template->elevation;
    mapObj->elevation = template->elevation;
    mapObj->mapobj_unk_19 = template->unkA_0;
    mapObj->mapobj_unk_19b = template->unkA_4;
    mapObj->trainerType = template->unkC;
    mapObj->trainerRange_berryTreeId = template->unkE;
    mapObj->mapobj_unk_20 = gUnknown_0836DC09[template->movementType];
    FieldObjectSetDirection((struct MapObject *)mapObj, mapObj->mapobj_unk_20);
    FieldObjectHandleDynamicGraphicsId(mapObj);
    //asm("":::"r5","r6");
    if (gUnknown_0836DBBC[mapObj->animPattern] != 0)
    {
        if (mapObj->mapobj_unk_19 == 0)
            mapObj->mapobj_unk_19++;
        if (mapObj->mapobj_unk_19b == 0)
            mapObj->mapobj_unk_19b++;
    }
    return var;
}
*/
