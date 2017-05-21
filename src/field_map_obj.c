#include "global.h"
#include "field_map_obj.h"
#include "asm.h"
#include "berry.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "palette.h"
#include "rom4.h"
#include "rng.h"
#include "sprite.h"

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[36];

extern void strange_npc_table_clear(void);
extern void ClearPlayerAvatarInfo(void);
extern void npc_load_two_palettes__no_record(u16, u8);
extern void npc_load_two_palettes__and_record(u16, u8);
extern void sub_8060388(s16, s16, s16 *, s16 *);
extern void sub_80634D0();
extern void pal_patch_for_npc(u16, u16);
extern void sub_80603CC();
extern void CameraObjectReset1(void);

void sub_805AAB0(void);
u8 GetFieldObjectIdByLocalId(u8);
u8 GetFieldObjectIdByLocalIdAndMapInternal(u8, u8, u8);
u8 GetAvailableFieldObjectSlot(u16, u8, u8, u8 *);
void FieldObjectHandleDynamicGraphicsId();
void RemoveFieldObjectInternal(struct MapObject *);
u16 GetFieldObjectFlagIdByFieldObjectId(u8);
void MakeObjectTemplateFromFieldObjectTemplate(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, struct SubspriteTable **subspriteTables);
struct MapObjectTemplate *GetFieldObjectTemplateByLocalIdAndMap(u8, u8, u8);
void GetFieldObjectMovingCameraOffset(s16 *, s16 *);
void sub_805BDF8(u16);
u8 sub_805BE58(const struct SpritePalette *);
u8 FindFieldObjectPaletteIndexByTag(u16);

struct PairedPalettes
{
    u16 tag;
    u16 *data;
};

extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];
extern u8 gReservedSpritePaletteCount;
extern struct Camera gUnknown_0202E844;
extern u8 gUnknown_030005A4;
extern u16 gUnknown_030005A6;
extern const u8 gUnknown_0836DBBC[];
extern const u8 gUnknown_0836DC09[];
extern void (*const gUnknown_0836DA88[])(struct Sprite *);
extern const u8 *const gBerryTreeGraphicsIdTablePointers[];
extern const struct SpriteFrameImage *const gBerryTreePicTablePointers[];
extern const u8 *const gBerryTreePaletteSlotTablePointers[];
extern const struct MapObjectGraphicsInfo *const gMapObjectGraphicsInfoPointers[];
extern const struct SpritePalette gUnknown_0837377C[];
extern const struct PairedPalettes gUnknown_08373874[];
extern const struct PairedPalettes gUnknown_083738E4[];
extern const struct SpriteTemplate gSpriteTemplate_830FD24;
extern const u16 *const gUnknown_0837399C[];

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

u8 sub_805AB54(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (!gMapObjects[i].active)
            break;
    }
    return i;
}

u8 GetFieldObjectIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    if (localId <= 0xFE)
        return GetFieldObjectIdByLocalIdAndMapInternal(localId, mapNum, mapGroup);
    else
        return GetFieldObjectIdByLocalId(localId);
}

bool8 TryGetFieldObjectIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, u8 *mapObjectId)
{
    *mapObjectId = GetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup);
    if (*mapObjectId == 16)
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

#ifdef NONMATCHING
u8 InitFieldObjectStateFromTemplate(struct MapObjectTemplate *template, u8 b, u8 c)
{
    struct MapObject2 *mapObj;  //TODO: resolve the mapobj_unk_19b weirdness
    u8 var;
    u16 r3;
    u16 r2;

    //asm("nop"::"r"(b));
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
#else
__attribute__((naked))
u8 InitFieldObjectStateFromTemplate(struct MapObjectTemplate *template, u8 b, u8 c)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r9\n\
    mov r6, r8\n\
    push {r6,r7}\n\
    sub sp, 0x4\n\
    adds r5, r0, 0\n\
    lsls r1, 24\n\
    lsrs r6, r1, 24\n\
    lsls r2, 24\n\
    lsrs r7, r2, 24\n\
    ldrb r0, [r5]\n\
    adds r1, r6, 0\n\
    adds r2, r7, 0\n\
    mov r3, sp\n\
    bl GetAvailableFieldObjectSlot\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0805ACCE\n\
    movs r0, 0x10\n\
    b _0805ADC2\n\
_0805ACCE:\n\
    mov r0, sp\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 3\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    ldr r1, _0805ADD0 @ =gMapObjects\n\
    adds r4, r0, r1\n\
    adds r0, r4, 0\n\
    bl npc_clear_ids_and_state\n\
    ldrh r3, [r5, 0x4]\n\
    adds r3, 0x7\n\
    lsls r3, 16\n\
    lsrs r3, 16\n\
    ldrh r2, [r5, 0x6]\n\
    adds r2, 0x7\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    ldrb r0, [r4]\n\
    movs r1, 0x1\n\
    orrs r0, r1\n\
    movs r1, 0x4\n\
    orrs r0, r1\n\
    strb r0, [r4]\n\
    ldrb r0, [r5, 0x1]\n\
    strb r0, [r4, 0x5]\n\
    ldrb r0, [r5, 0x9]\n\
    strb r0, [r4, 0x6]\n\
    ldrb r0, [r5]\n\
    strb r0, [r4, 0x8]\n\
    strb r6, [r4, 0x9]\n\
    strb r7, [r4, 0xA]\n\
    strh r3, [r4, 0xC]\n\
    strh r2, [r4, 0xE]\n\
    strh r3, [r4, 0x10]\n\
    strh r2, [r4, 0x12]\n\
    strh r3, [r4, 0x14]\n\
    strh r2, [r4, 0x16]\n\
    ldrb r0, [r5, 0x8]\n\
    movs r7, 0xF\n\
    adds r1, r7, 0\n\
    ands r1, r0\n\
    ldrb r2, [r4, 0xB]\n\
    movs r0, 0x10\n\
    negs r0, r0\n\
    mov r8, r0\n\
    ands r0, r2\n\
    orrs r0, r1\n\
    strb r0, [r4, 0xB]\n\
    ldrb r1, [r5, 0x8]\n\
    lsls r1, 4\n\
    ands r0, r7\n\
    orrs r0, r1\n\
    strb r0, [r4, 0xB]\n\
    ldrb r1, [r5, 0xA]\n\
    lsls r1, 28\n\
    movs r0, 0xF\n\
    mov r9, r0\n\
    lsrs r1, 28\n\
    ldrb r2, [r4, 0x19]\n\
    mov r0, r8\n\
    ands r0, r2\n\
    orrs r0, r1\n\
    strb r0, [r4, 0x19]\n\
    ldrb r1, [r5, 0xA]\n\
    lsrs r1, 4\n\
    lsls r1, 4\n\
    ands r0, r7\n\
    orrs r0, r1\n\
    strb r0, [r4, 0x19]\n\
    ldrh r0, [r5, 0xC]\n\
    strb r0, [r4, 0x7]\n\
    ldrh r0, [r5, 0xE]\n\
    strb r0, [r4, 0x1D]\n\
    ldr r1, _0805ADD4 @ =gUnknown_0836DC09\n\
    ldrb r0, [r5, 0x9]\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    adds r0, r4, 0\n\
    adds r0, 0x20\n\
    strb r1, [r0]\n\
    ldrb r1, [r0]\n\
    adds r0, r4, 0\n\
    bl FieldObjectSetDirection\n\
    adds r0, r4, 0\n\
    bl FieldObjectHandleDynamicGraphicsId\n\
    ldr r1, _0805ADD8 @ =gUnknown_0836DBBC\n\
    ldrb r0, [r4, 0x6]\n\
    adds r0, r1\n\
    ldrb r0, [r0]\n\
    cmp r0, 0\n\
    beq _0805ADBE\n\
    ldrb r2, [r4, 0x19]\n\
    adds r0, r7, 0\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    bne _0805ADA6\n\
    lsls r0, r2, 28\n\
    lsrs r0, 28\n\
    adds r0, 0x1\n\
    mov r1, r9\n\
    ands r0, r1\n\
    mov r1, r8\n\
    ands r1, r2\n\
    orrs r1, r0\n\
    strb r1, [r4, 0x19]\n\
_0805ADA6:\n\
    ldrb r2, [r4, 0x19]\n\
    movs r0, 0xF0\n\
    ands r0, r2\n\
    cmp r0, 0\n\
    bne _0805ADBE\n\
    lsrs r1, r2, 4\n\
    adds r1, 0x1\n\
    lsls r1, 4\n\
    adds r0, r7, 0\n\
    ands r0, r2\n\
    orrs r0, r1\n\
    strb r0, [r4, 0x19]\n\
_0805ADBE:\n\
    mov r0, sp\n\
    ldrb r0, [r0]\n\
_0805ADC2:\n\
    add sp, 0x4\n\
    pop {r3,r4}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_0805ADD0: .4byte gMapObjects\n\
_0805ADD4: .4byte gUnknown_0836DC09\n\
_0805ADD8: .4byte gUnknown_0836DBBC\n\
    .syntax divided\n");
}
#endif

u8 sub_805ADDC(u8 localId)
{
    u8 objectCount;
    u8 i;

    if (gMapHeader.events == NULL)
        return 16;
    objectCount = gMapHeader.events->mapObjectCount;
    for (i = 0; i < objectCount; i++)
    {
        struct MapObjectTemplate *template = &gSaveBlock1.mapObjectTemplates[i];

        if (template->localId == localId && !FlagGet(template->flagId))
            return InitFieldObjectStateFromTemplate(template, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
    }
    return 16;
}

u8 GetAvailableFieldObjectSlot(u16 a, u8 b, u8 c, u8 *d)
{
    u8 i = 0;

    for (i = 0; i < 16 && gMapObjects[i].active; i++)
    {
        if (gMapObjects[i].localId == a && gMapObjects[i].mapNum == b && gMapObjects[i].mapGroup == c)
            return 1;
    }
    if (i >= 16)
        return 1;
    *d = i;
    for (; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].localId == a && gMapObjects[i].mapNum == b && gMapObjects[i].mapGroup == c)
            return 1;
    }
    return 0;
}

void RemoveFieldObject(struct MapObject *mapObject)
{
    mapObject->active = FALSE;
    RemoveFieldObjectInternal(mapObject);
}

void RemoveFieldObjectByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        return;
    FlagSet(GetFieldObjectFlagIdByFieldObjectId(mapObjectId));
    RemoveFieldObject(&gMapObjects[mapObjectId]);
}

void RemoveFieldObjectInternal(struct MapObject *mapObject)
{
    struct SpriteFrameImage image;
    const struct MapObjectGraphicsInfo *gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);

    image.size = gfxInfo->size;
    gSprites[mapObject->spriteId].images = &image;
    DestroySprite(&gSprites[mapObject->spriteId]);
}

void npc_hide_all_but_player(void)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (i != gPlayerAvatar.mapObjectId)
            RemoveFieldObject(&gMapObjects[i]);
    }
}

u8 sub_805AFCC(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, u8 c, u8 d, s16 e, s16 f)
{
    u8 mapObjectId;
    u8 spriteId;
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct MapObject *mapObject;
    struct Sprite *sprite;

    mapObjectId = InitFieldObjectStateFromTemplate(mapObjTemplate, c, d);
    if (mapObjectId == 16)
        return 16;

    mapObject = &gMapObjects[mapObjectId];
    gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    if (gfxInfo->paletteSlot == 0)
        npc_load_two_palettes__no_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    else if (gfxInfo->paletteSlot == 10)
        npc_load_two_palettes__and_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    if (mapObject->animPattern == 0x4C)
        mapObject->mapobj_bit_13 = TRUE;

#ifdef NONMATCHING
    sprTemplate->paletteTag = 0xFFFF;
#else
    *(u16 *)&sprTemplate->paletteTag = 0xFFFF;
#endif
    spriteId = CreateSprite(sprTemplate, 0, 0, 0);
    if (spriteId == 64)
    {
        gMapObjects[mapObjectId].active = FALSE;
        return 16;
    }
    sprite = &gSprites[spriteId];
    sub_8060388(e + mapObject->coords2.x, f + mapObject->coords2.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    sprite->oam.paletteNum = gfxInfo->paletteSlot;
    sprite->coordOffsetEnabled = TRUE;
    sprite->data0 = mapObjectId;
    mapObject->spriteId = spriteId;
    mapObject->mapobj_bit_12 = gfxInfo->inanimate;
    if (!mapObject->mapobj_bit_12)
        StartSpriteAnim(sprite, FieldObjectDirectionToImageAnimId(mapObject->mapobj_unk_18));
    SetObjectSubpriorityByZCoord(mapObject->elevation, sprite, 1);
    sub_80634D0(mapObject, sprite);
    return mapObjectId;
}

u8 SpawnFieldObject(struct MapObjectTemplate *mapObjTemplate, u8 b, u8 c, s16 d, s16 e)
{
    struct SpriteTemplate spriteTemplate;
    struct SubspriteTable *subspriteTables = NULL;
    struct SpriteFrameImage spriteFrameImage;
    const struct MapObjectGraphicsInfo *gfxInfo;
    u8 mapObjectId;

    gfxInfo = GetFieldObjectGraphicsInfo(mapObjTemplate->graphicsId);
    MakeObjectTemplateFromFieldObjectTemplate(mapObjTemplate, &spriteTemplate, &subspriteTables);
    spriteFrameImage.size = gfxInfo->size;
    spriteTemplate.images = &spriteFrameImage;
    mapObjectId = sub_805AFCC(mapObjTemplate, &spriteTemplate, b, c, d, e);
    if (mapObjectId == 16)
        return 16;
    gSprites[gMapObjects[mapObjectId].spriteId].images = gfxInfo->images;
    if (subspriteTables != NULL)
        SetSubspriteTables(&gSprites[gMapObjects[mapObjectId].spriteId], subspriteTables);
    return mapObjectId;
}

u8 SpawnSpecialFieldObject(struct MapObjectTemplate *mapObjTemplate)
{
    s16 x;
    s16 y;

    GetFieldObjectMovingCameraOffset(&x, &y);
    return SpawnFieldObject(mapObjTemplate, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, x, y);
}

u8 SpawnSpecialFieldObjectParametrized(u8 a, u8 b, u8 c, s16 d, s16 e, u8 f)
{
    struct MapObjectTemplate mapObjTemplate;

    d -= 7;
    e -= 7;
    mapObjTemplate.localId = c;
    mapObjTemplate.graphicsId = a;
    mapObjTemplate.unk2 = 0;
    mapObjTemplate.x = d;
    mapObjTemplate.y = e;
    mapObjTemplate.elevation = f;
    mapObjTemplate.movementType = b;
    mapObjTemplate.unkA_0 = 0;
    mapObjTemplate.unkA_4 = 0;
    mapObjTemplate.unkC = 0;
    mapObjTemplate.unkE = 0;
    return SpawnSpecialFieldObject(&mapObjTemplate);
}

u8 show_sprite(u8 a, u8 b, u8 c)
{
    struct MapObjectTemplate *r5;
    s16 x;
    s16 y;

    r5 = GetFieldObjectTemplateByLocalIdAndMap(a, b, c);
    if (r5 == NULL)
        return 16;
    GetFieldObjectMovingCameraOffset(&x, &y);
    return SpawnFieldObject(r5, b, c, x, y);
}

void MakeObjectTemplateFromFieldObjectGraphicsInfo(u16 graphicsId, void (*callback)(struct Sprite *), struct SpriteTemplate *sprTemplate, struct SubspriteTable **subspriteTables)
{
    const struct MapObjectGraphicsInfo *gfxInfo = GetFieldObjectGraphicsInfo(graphicsId);

    sprTemplate->tileTag = gfxInfo->tileTag;
    sprTemplate->paletteTag = gfxInfo->paletteTag1;
    sprTemplate->oam = gfxInfo->oam;
    sprTemplate->anims = gfxInfo->anims;
    sprTemplate->images = gfxInfo->images;
    sprTemplate->affineAnims = gfxInfo->affineAnims;
    sprTemplate->callback = callback;
    *subspriteTables = gfxInfo->subspriteTables;
}

void MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex(u16 graphicsId, u16 callbackIndex, struct SpriteTemplate *sprTemplate, struct SubspriteTable **subspriteTables)
{
    MakeObjectTemplateFromFieldObjectGraphicsInfo(graphicsId, gUnknown_0836DA88[callbackIndex], sprTemplate, subspriteTables);
}

void MakeObjectTemplateFromFieldObjectTemplate(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, struct SubspriteTable **subspriteTables)
{
    MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex(mapObjTemplate->graphicsId, mapObjTemplate->movementType, sprTemplate, subspriteTables);
}

u8 AddPseudoFieldObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 c, s16 d, u8 subpriority)
{
    struct SpriteTemplate spriteTemplate;
    struct SubspriteTable *subspriteTables;
    u8 spriteId;

    MakeObjectTemplateFromFieldObjectGraphicsInfo(graphicsId, callback, &spriteTemplate, &subspriteTables);
    if (spriteTemplate.paletteTag != 0xFFFF)
        sub_805BDF8(spriteTemplate.paletteTag);
    spriteId = CreateSprite(&spriteTemplate, c, d, subpriority);
    if (spriteId != 64 && subspriteTables != NULL)
    {
        SetSubspriteTables(&gSprites[spriteId], subspriteTables);
        gSprites[spriteId].subspriteMode = 2;
    }
    return spriteId;
}

extern void sub_8064970(struct Sprite *);
extern void sub_8060470();
extern void InitObjectPriorityByZCoord();

u8 sub_805B410(u8 a, u8 b, s16 c, s16 d, u8 e, u8 f)
{
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct SpriteTemplate spriteTemplate;
    struct SubspriteTable *subspriteTables;
    u8 spriteId;

    gfxInfo = GetFieldObjectGraphicsInfo(a);
    MakeObjectTemplateFromFieldObjectGraphicsInfo(a, sub_8064970, &spriteTemplate, &subspriteTables);
#ifdef NONMATCHING
    spriteTemplate.paletteTag = 0xFFFF;
#else
    *(u16 *)&spriteTemplate.paletteTag = 0xFFFF;
#endif
    c += 7;
    d += 7;
    sub_8060470(&c, &d, 8, 16);
    spriteId = CreateSpriteAtEnd(&spriteTemplate, c, d, 0);
    if (spriteId != 64)
    {
        struct Sprite *sprite = &gSprites[spriteId];

        sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
        sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
        sprite->pos1.y += sprite->centerToCornerVecY;
        sprite->oam.paletteNum = gfxInfo->paletteSlot;
        sprite->coordOffsetEnabled = TRUE;
        sprite->data0 = b;
        sprite->data1 = e;
        if (gfxInfo->paletteSlot == 10)
            npc_load_two_palettes__and_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
        if (subspriteTables != NULL)
        {
            SetSubspriteTables(sprite, subspriteTables);
            sprite->subspriteMode = 2;
        }
        InitObjectPriorityByZCoord(sprite, e);
        SetObjectSubpriorityByZCoord(e, sprite, 1);
        StartSpriteAnim(sprite, FieldObjectDirectionToImageAnimId(f));
    }
    return spriteId;
}

void sub_805B55C(s16 a, s16 b)
{
    u8 i;

    if (gMapHeader.events != NULL)
    {
        s16 r9 = gSaveBlock1.pos.x - 2;
        s16 sp8 = gSaveBlock1.pos.x + 17;
        s16 r10 = gSaveBlock1.pos.y;
        s16 spC = gSaveBlock1.pos.y + 16;
        u8 objectCount = gMapHeader.events->mapObjectCount;

        for (i = 0; i < objectCount; i++)
        {
            struct MapObjectTemplate *template = &gSaveBlock1.mapObjectTemplates[i];
            s16 foo = template->x + 7;
            s16 bar = template->y + 7;

            if (r10 <= bar && spC >= bar && r9 <= foo && sp8 >= foo
             && !FlagGet(template->flagId))
                SpawnFieldObject(template, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, a, b);
        }
    }
}

void RemoveFieldObjectIfOutsideView(struct MapObject *mapObject);

void RemoveFieldObjectsOutsideView(void)
{
    u8 i;
    u8 j;

    for (i = 0; i < 16; i++)
    {
        bool8 isActiveLinkPlayer;

        for (j = 0, isActiveLinkPlayer = 0; j < 4; j++)
        {
            if (gLinkPlayerMapObjects[j].active && i == gLinkPlayerMapObjects[j].mapObjId)
                isActiveLinkPlayer = TRUE;
        }
        if (!isActiveLinkPlayer)
        {
            struct MapObject *mapObject = &gMapObjects[i];

            if (mapObject->active && !mapObject->mapobj_bit_16)
            RemoveFieldObjectIfOutsideView(mapObject);
        }
    }
}

void RemoveFieldObjectIfOutsideView(struct MapObject *mapObject)
{
    s16 r7 = gSaveBlock1.pos.x - 2;
    s16 r5 = gSaveBlock1.pos.x + 17;
    s16 r4 = gSaveBlock1.pos.y;
    s16 r6 = gSaveBlock1.pos.y + 16;

    if (mapObject->coords2.x >= r7 && mapObject->coords2.x <= r5
     && mapObject->coords2.y >= r4 && mapObject->coords2.y <= r6)
        return;
    if (mapObject->coords1.x >= r7 && mapObject->coords1.x <= r5
     && mapObject->coords1.y >= r4 && mapObject->coords1.y <= r6)
        return;
    RemoveFieldObject(mapObject);
}

void sub_805B75C(u8, s16, s16);

void sub_805B710(u16 a, u16 b)
{
    u8 i;

    ClearPlayerAvatarInfo();
    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active)
            sub_805B75C(i, a, b);
    }
    sub_805AAB0();
}

extern void SetPlayerAvatarFieldObjectIdAndObjectId(u8, u8);
extern void sub_805B914(struct MapObject *);

void sub_805B75C(u8 a, s16 b, s16 c)
{
    struct SpriteTemplate sp0;
    struct SpriteFrameImage sp18;
    struct SubspriteTable *subspriteTables;
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct MapObject *mapObject;
    u8 spriteId;

    #define i spriteId
    for (i = 0; i < 4; i++)
    {
        if (gLinkPlayerMapObjects[i].active && a == gLinkPlayerMapObjects[i].mapObjId)
            return;
    }
    #undef i

    mapObject = &gMapObjects[a];
    asm("":::"r5");
    subspriteTables = NULL;
    gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    sp18.size = gfxInfo->size;
    MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex(mapObject->graphicsId, mapObject->animPattern, &sp0, &subspriteTables);
    sp0.images = &sp18;
    *(u16 *)&sp0.paletteTag = 0xFFFF;
    if (gfxInfo->paletteSlot == 0)
        npc_load_two_palettes__no_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    if (gfxInfo->paletteSlot > 9)
        npc_load_two_palettes__and_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    *(u16 *)&sp0.paletteTag = 0xFFFF;
    spriteId = CreateSprite(&sp0, 0, 0, 0);
    if (spriteId != 64)
    {
        struct Sprite *sprite = &gSprites[spriteId];

        sub_8060388(b + mapObject->coords2.x, c + mapObject->coords2.y, &sprite->pos1.x, &sprite->pos1.y);
        sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
        sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
        sprite->pos1.x += 8;
        sprite->pos1.y += 16 + sprite->centerToCornerVecY;
        sprite->images = gfxInfo->images;
        if (mapObject->animPattern == 11)
        {
            SetPlayerAvatarFieldObjectIdAndObjectId(a, spriteId);
            mapObject->mapobj_unk_1B = sub_8126B54();
        }
        if (subspriteTables != NULL)
            SetSubspriteTables(sprite, subspriteTables);
        sprite->oam.paletteNum = gfxInfo->paletteSlot;
        sprite->coordOffsetEnabled = TRUE;
        sprite->data0 = a;
        mapObject->spriteId = spriteId;
        if (!mapObject->mapobj_bit_12 && mapObject->animPattern != 11)
            StartSpriteAnim(sprite, FieldObjectDirectionToImageAnimId(mapObject->mapobj_unk_18));
        sub_805B914(mapObject);
        SetObjectSubpriorityByZCoord(mapObject->elevation, sprite, 1);
    }
}

void sub_805B914(struct MapObject *mapObject)
{
    mapObject->mapobj_bit_1 = FALSE;
    mapObject->mapobj_bit_2 = TRUE;
    mapObject->mapobj_bit_22 = FALSE;
    mapObject->mapobj_bit_17 = FALSE;
    mapObject->mapobj_bit_18 = FALSE;
    mapObject->mapobj_bit_19 = FALSE;
    mapObject->mapobj_bit_20 = FALSE;
    mapObject->mapobj_bit_21 = FALSE;
    FieldObjectClearAnim(mapObject);
}

void SetPlayerAvatarFieldObjectIdAndObjectId(u8 mapObjectId, u8 spriteId)
{
    gPlayerAvatar.mapObjectId = mapObjectId;
    gPlayerAvatar.spriteId = spriteId;
    gPlayerAvatar.gender = GetPlayerAvatarGenderByGraphicsId(gMapObjects[mapObjectId].graphicsId);
    SetPlayerAvatarExtraStateTransition(gMapObjects[mapObjectId].graphicsId, 0x20);
}

void sub_805B980(struct MapObject *mapObject, u8 graphicsId)
{
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct Sprite *sprite;

    gfxInfo = GetFieldObjectGraphicsInfo(graphicsId);
    sprite = &gSprites[mapObject->spriteId];
    if (gfxInfo->paletteSlot == 0)
        pal_patch_for_npc(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    if (gfxInfo->paletteSlot == 10)
        npc_load_two_palettes__and_record(gfxInfo->paletteTag1, gfxInfo->paletteSlot);
    sprite->oam.shape = gfxInfo->oam->shape;
    sprite->oam.size = gfxInfo->oam->size;
    sprite->images = gfxInfo->images;
    sprite->anims = gfxInfo->anims;
    sprite->subspriteTables = gfxInfo->subspriteTables;
    sprite->oam.paletteNum = gfxInfo->paletteSlot;
    mapObject->mapobj_bit_12 = gfxInfo->inanimate;
    mapObject->graphicsId = graphicsId;
    sub_80603CC(mapObject->coords2.x, mapObject->coords2.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    if (mapObject->mapobj_bit_15)
        CameraObjectReset1();
}

void unref_sub_805BA80(u8 localId, u8 mapNum, u8 mapGroup, u8 graphicsId)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        sub_805B980(&gMapObjects[mapObjectId], graphicsId);
}

void FieldObjectTurn(struct MapObject *mapObject, u8 direction)
{
    FieldObjectSetDirection(mapObject, direction);
    if (!mapObject->mapobj_bit_12)
    {
        StartSpriteAnim(&gSprites[mapObject->spriteId], FieldObjectDirectionToImageAnimId(mapObject->mapobj_unk_18));
        SeekSpriteAnim(&gSprites[mapObject->spriteId], 0);
    }
}

void FieldObjectTurnByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup, u8 direction)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        FieldObjectTurn(&gMapObjects[mapObjectId], direction);
}

void unref_TurnPlayer(struct PlayerAvatar *player, u8 direction)
{
    FieldObjectTurn(&gMapObjects[player->mapObjectId], direction);
}

void get_berry_tree_graphics(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 treeStage;
    u8 treeId;

    mapObject->mapobj_bit_13 = TRUE;
    sprite->invisible = TRUE;
    treeStage = GetStageByBerryTreeId(mapObject->trainerRange_berryTreeId);
    if (treeStage != 0)
    {
        mapObject->mapobj_bit_13 = FALSE;
        sprite->invisible = FALSE;
        treeId = GetBerryTypeByBerryTreeId(mapObject->trainerRange_berryTreeId) - 1;
        treeStage--;
        if (treeId > 0x2B)
            treeId = 0;
        sub_805B980(mapObject, gBerryTreeGraphicsIdTablePointers[treeId][treeStage]);
        sprite->images = gBerryTreePicTablePointers[treeId];
        sprite->oam.paletteNum = gBerryTreePaletteSlotTablePointers[treeId][treeStage];
        StartSpriteAnim(sprite, treeStage);
    }
}

const struct MapObjectGraphicsInfo *GetFieldObjectGraphicsInfo(u8 graphicsId)
{
    if (graphicsId > 0xEF)
        graphicsId = VarGetFieldObjectGraphicsId(graphicsId + 16);
    if (graphicsId > 0xD9)
        graphicsId = 5;
    return gMapObjectGraphicsInfoPointers[graphicsId];
}

void FieldObjectHandleDynamicGraphicsId(struct MapObject *mapObject)
{
    if (mapObject->graphicsId > 0xEF)
        mapObject->graphicsId = VarGetFieldObjectGraphicsId(mapObject->graphicsId + 16);
}

void npc_by_local_id_and_map_set_field_1_bit_x20(u8 localId, u8 mapNum, u8 mapGroup, u8 d)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        gMapObjects[mapObjectId].mapobj_bit_13 = d;
}

void FieldObjectGetLocalIdAndMap(struct MapObject *mapObject, u8 *localId, u8 *mapNum, u8 *mapGroup)
{
    *localId = mapObject->localId;
    *mapNum = mapObject->mapNum;
    *mapGroup = mapObject->mapGroup;
}

void sub_805BCC0(s16 x, s16 y)
{
    u8 mapObjectId;
    struct MapObject *mapObject;

    mapObjectId = GetFieldObjectIdByXY(x, y);
    if (mapObjectId != 16)
    {
        mapObject = &gMapObjects[mapObjectId];
        mapObject->mapobj_bit_2 = TRUE;
    }
}

void sub_805BCF0(u8 localId, u8 mapNum, u8 mapGroup, u8 subpriority)
{
    u8 mapObjectId;
    struct MapObject *mapObject;
    struct Sprite *sprite;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        mapObject = &gMapObjects[mapObjectId];
        sprite = &gSprites[mapObject->spriteId];
        mapObject->mapobj_bit_26 = TRUE;
        sprite->subpriority = subpriority;
    }
}

void sub_805BD48(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;
    struct MapObject *mapObject;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        mapObject = &gMapObjects[mapObjectId];
        mapObject->mapobj_bit_26 = FALSE;
        mapObject->mapobj_bit_2 = TRUE;
    }
}

void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    u8 mapObjectId;
    struct Sprite *sprite;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        sprite = &gSprites[gMapObjects[mapObjectId].spriteId];
        sprite->pos2.x = x;
        sprite->pos2.y = y;
    }
}

void gpu_pal_allocator_reset__manage_upper_four(void)
{
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 12;
}

void sub_805BDF8(u16 tag)
{
    u16 paletteIndex = FindFieldObjectPaletteIndexByTag(tag);

    if (paletteIndex != 0x11FF)  //always happens. FindFieldObjectPaletteIndexByTag returns u8
        sub_805BE58(&gUnknown_0837377C[paletteIndex]);
}

void unref_sub_805BE24(u16 *arr)
{
    u8 i;

    for (i = 0; arr[i] != 0x11FF; i++)
        sub_805BDF8(arr[i]);
}

u8 sub_805BE58(const struct SpritePalette *palette)
{
    if (IndexOfSpritePaletteTag(palette->tag) != 0xFF)
        return 0xFF;
    else
        return LoadSpritePalette(palette);
}

void pal_patch_for_npc(u16 a, u16 b)
{
    u8 var = b;
    u8 paletteIndex = FindFieldObjectPaletteIndexByTag(a);

    LoadPalette(gUnknown_0837377C[paletteIndex].data, var * 16 + 0x100, 0x20);
}

void pal_patch_for_npc_range(const u16 *arr, u8 b, u8 c)
{
    for (; b < c; arr++, b++)
        pal_patch_for_npc(*arr, b);
}

u8 FindFieldObjectPaletteIndexByTag(u16 tag)
{
    u8 i;

    for (i = 0; gUnknown_0837377C[i].tag != 0x11FF; i++)
    {
        if (gUnknown_0837377C[i].tag == tag)
            return i;
    }
    return 0xFF;
}

const u8 gUnknown_0830FD14[] = {1, 1, 6, 7, 8, 9, 6, 7, 8, 9, 11, 11, 0, 0, 0, 0};

void npc_load_two_palettes__no_record(u16 a, u8 b)
{
    u8 i;

    pal_patch_for_npc(a, b);
    for (i = 0; gUnknown_08373874[i].tag != 0x11FF; i++)
    {
        if (gUnknown_08373874[i].tag == a)
        {
            pal_patch_for_npc(gUnknown_08373874[i].data[gUnknown_030005A4], gUnknown_0830FD14[b]);
            break;
        }
    }
}

void npc_load_two_palettes__and_record(u16 a, u8 b)
{
    u8 i;

    gUnknown_030005A6 = a;
    pal_patch_for_npc(a, b);
    for (i = 0; gUnknown_083738E4[i].tag != 0x11FF; i++)
    {
        if (gUnknown_083738E4[i].tag == a)
        {
            pal_patch_for_npc(gUnknown_083738E4[i].data[gUnknown_030005A4], gUnknown_0830FD14[b]);
            break;
        }
    }
}

void unref_sub_805C014(struct MapObject *mapObject, s16 x, s16 y)
{
    mapObject->coords3.x = mapObject->coords2.x;
    mapObject->coords3.y = mapObject->coords2.y;
    mapObject->coords2.x += x;
    mapObject->coords2.y += y;
}

void npc_coords_shift(struct MapObject *mapObject, s16 x, s16 y)
{
    mapObject->coords3.x = mapObject->coords2.x;
    mapObject->coords3.y = mapObject->coords2.y;
    mapObject->coords2.x = x;
    mapObject->coords2.y = y;
}

void npc_coords_set(struct MapObject *mapObject, s16 x, s16 y)
{
    mapObject->coords3.x = x;
    mapObject->coords3.y = y;
    mapObject->coords2.x = x;
    mapObject->coords2.y = y;
}

void sub_805C058(struct MapObject *mapObject, s16 x, s16 y)
{
    struct Sprite *sprite = &gSprites[mapObject->spriteId];
    const struct MapObjectGraphicsInfo *gfxInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);

    npc_coords_set(mapObject, x, y);
    sub_80603CC(mapObject->coords2.x, mapObject->coords2.y, &sprite->pos1.x, &sprite->pos1.y);
    sprite->centerToCornerVecX = -(gfxInfo->width >> 1);
    sprite->centerToCornerVecY = -(gfxInfo->height >> 1);
    sprite->pos1.x += 8;
    sprite->pos1.y += 16 + sprite->centerToCornerVecY;
    sub_805B914(mapObject);
    if (mapObject->mapobj_bit_15)
        CameraObjectReset1();
}

void sub_805C0F8(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        x += 7;
        y += 7;
        sub_805C058(&gMapObjects[mapObjectId], x, y);
    }
}

void npc_coords_shift_still(struct MapObject *mapObject)
{
    npc_coords_shift(mapObject, mapObject->coords2.x, mapObject->coords2.y);
}

void UpdateFieldObjectCoordsForCameraUpdate(void)
{
    u8 i;
    s16 deltaX;
    s16 deltaY;

#ifndef NONMATCHING
    asm(""::"r"(i));  //makes the compiler store i in r3
#endif

    if (gUnknown_0202E844.field_0)
    {
        for (i = 0, deltaX = gUnknown_0202E844.x, deltaY = gUnknown_0202E844.y; i < 16; i++)
        {
            struct MapObject *mapObject = &gMapObjects[i];

            if (mapObject->active)
            {
                mapObject->coords1.x -= deltaX;
                mapObject->coords1.y -= deltaY;
                mapObject->coords2.x -= deltaX;
                mapObject->coords2.y -= deltaY;
                mapObject->coords3.x -= deltaX;
                mapObject->coords3.y -= deltaY;
            }
        }
    }
}

bool8 FieldObjectDoesZCoordMatch(struct MapObject *, u8);

u8 GetFieldObjectIdByXYZ(u16 x, u16 y, u8 z)
{
    u8 i;

    for (i = 0; i < 16; i++)
    {
        if (gMapObjects[i].active && gMapObjects[i].coords2.x == x && gMapObjects[i].coords2.y == y
         && FieldObjectDoesZCoordMatch(&gMapObjects[i], z))
            return i;
    }
    return 16;
}

bool8 FieldObjectDoesZCoordMatch(struct MapObject *mapObject, u8 z)
{
    if (mapObject->mapobj_unk_0B_0 != 0 && z != 0
     && mapObject->mapobj_unk_0B_0 != z)
        return FALSE;
    else
        return TRUE;
}

void UpdateFieldObjectsForCameraUpdate(s16 x, s16 y)
{
    UpdateFieldObjectCoordsForCameraUpdate();
    sub_805B55C(x, y);
    RemoveFieldObjectsOutsideView();
}

void ObjectCB_CameraObject(struct Sprite *sprite);
const struct SpriteTemplate gSpriteTemplate_830FD24 =
{
    .tileTag = 0,
    .paletteTag = 0xFFFF,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = ObjectCB_CameraObject,
};

u8 AddCameraObject(u8 a)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_830FD24, 0, 0, 4);

    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].data0 = a;
    return spriteId;
}

void CameraObject_0(struct Sprite *);
void CameraObject_1(struct Sprite *);
void CameraObject_2(struct Sprite *);

void ObjectCB_CameraObject(struct Sprite *sprite)
{
    void (*const cameraObjectFuncs[])(struct Sprite *) =
    {
        CameraObject_0,
        CameraObject_1,
        CameraObject_2,
    };

    cameraObjectFuncs[sprite->data1](sprite);
}

void CameraObject_0(struct Sprite *sprite)
{
    sprite->pos1.x = gSprites[sprite->data0].pos1.x;
    sprite->pos1.y = gSprites[sprite->data0].pos1.y;
    sprite->invisible = TRUE;
    sprite->data1 = 1;
    CameraObject_1(sprite);
}

void CameraObject_1(struct Sprite *sprite)
{
    s16 x = gSprites[sprite->data0].pos1.x;
    s16 y = gSprites[sprite->data0].pos1.y;

    sprite->data2 = x - sprite->pos1.x;
    sprite->data3 = y - sprite->pos1.y;
    sprite->pos1.x = x;
    sprite->pos1.y = y;
}

void CameraObject_2(struct Sprite *sprite)
{
    sprite->pos1.x = gSprites[sprite->data0].pos1.x;
    sprite->pos1.y = gSprites[sprite->data0].pos1.y;
    sprite->data2 = 0;
    sprite->data3 = 0;
}

struct Sprite *FindCameraObject(void)
{
    u8 i;

    for (i = 0; i < 64; i++)
    {
        if (gSprites[i].inUse && gSprites[i].callback == ObjectCB_CameraObject)
            return &gSprites[i];
    }
    return NULL;
}

void CameraObjectReset1(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite != NULL)
    {
        cameraSprite->data1 = 0;
        cameraSprite->callback(cameraSprite);
    }
}

void CameraObjectSetFollowedObjectId(u8 state)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite != NULL)
    {
        cameraSprite->data0 = state;
        CameraObjectReset1();
    }
}

u8 CameraObjectGetFollowedObjectId(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    if (cameraSprite == NULL)
        return 64;
    else
        return cameraSprite->data0;
}

void CameraObjectReset2(void)
{
    struct Sprite *cameraSprite = FindCameraObject();

    cameraSprite->data1 = 2;
}

u8 unref_sub_805C43C(struct Sprite *src, s16 x, s16 y, u8 subpriority)
{
    u8 i;

    for (i = 0; i < 64; i++)
    {
        if (!gSprites[i].inUse)
        {
            gSprites[i] = *src;
            gSprites[i].pos1.x = x;
            gSprites[i].pos1.y = y;
            gSprites[i].subpriority = subpriority;
            break;
        }
    }
    return i;
}

u8 obj_unfreeze(struct Sprite *src, s16 x, s16 y, u8 subpriority)
{
    s16 i;

    for (i = 63; i > -1; i--)
    {
        if (!gSprites[i].inUse)
        {
            gSprites[i] = *src;
            gSprites[i].pos1.x = x;
            gSprites[i].pos1.y = y;
            gSprites[i].subpriority = subpriority;
            return i;
        }
    }
    return 64;
}

void FieldObjectSetDirection(struct MapObject *mapObject, u8 direction)
{
    mapObject->mapobj_unk_20 = mapObject->mapobj_unk_18;
    if (!mapObject->mapobj_bit_9)
    {
        s8 _direction = direction;  //needed for the asm to match
        mapObject->mapobj_unk_18 = _direction;
    }
    mapObject->placeholder18 = direction;
}

u8 *GetFieldObjectScriptPointerByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    struct MapObjectTemplate *template = GetFieldObjectTemplateByLocalIdAndMap(localId, mapNum, mapGroup);

    return template->script;
}

u8 *GetFieldObjectScriptPointerByFieldObjectId(u8 mapObjectId)
{
    return GetFieldObjectScriptPointerByLocalIdAndMap(gMapObjects[mapObjectId].localId, gMapObjects[mapObjectId].mapNum, gMapObjects[mapObjectId].mapGroup);
}

u16 GetFieldObjectFlagIdByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    struct MapObjectTemplate *template = GetFieldObjectTemplateByLocalIdAndMap(localId, mapNum, mapGroup);

    return template->flagId;
}

u16 GetFieldObjectFlagIdByFieldObjectId(u8 mapObjectId)
{
    return GetFieldObjectFlagIdByLocalIdAndMap(gMapObjects[mapObjectId].localId, gMapObjects[mapObjectId].mapNum, gMapObjects[mapObjectId].mapGroup);
}

u8 unref_sub_805C5D0(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        return 0xFF;
    else
        return gMapObjects[mapObjectId].trainerType;
}

u8 unref_sub_805C60C(u8 mapObjectId)
{
    return gMapObjects[mapObjectId].trainerType;
}

u8 unref_sub_805C624(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        return 0xFF;
    else
        return gMapObjects[mapObjectId].trainerRange_berryTreeId;
}

u8 FieldObjectGetBerryTreeId(u8 mapObjectId)
{
    return gMapObjects[mapObjectId].trainerRange_berryTreeId;
}

struct MapObjectTemplate *FindFieldObjectTemplateInArrayByLocalId(u8, struct MapObjectTemplate *, u8);

struct MapObjectTemplate *GetFieldObjectTemplateByLocalIdAndMap(u8 localId, u8 mapNum, u8 mapGroup)
{
    if (gSaveBlock1.location.mapNum == mapNum && gSaveBlock1.location.mapGroup == mapGroup)
        return FindFieldObjectTemplateInArrayByLocalId(localId, gSaveBlock1.mapObjectTemplates, gMapHeader.events->mapObjectCount);
    else
    {
        struct MapHeader *mapHeader = get_mapheader_by_bank_and_number(mapGroup, mapNum);

        return FindFieldObjectTemplateInArrayByLocalId(localId, mapHeader->events->mapObjects, mapHeader->events->mapObjectCount);
    }
}

struct MapObjectTemplate *FindFieldObjectTemplateInArrayByLocalId(u8 localId, struct MapObjectTemplate *templates, u8 count)
{
    u8 i;

    for (i = 0; i < count; i++)
    {
        if (templates[i].localId == localId)
            return &templates[i];
    }
    return NULL;
}

struct MapObjectTemplate *sub_805C700(struct MapObject *mapObject)
{
    s32 i;

    if (mapObject->mapNum != gSaveBlock1.location.mapNum
     || mapObject->mapGroup != gSaveBlock1.location.mapGroup)
        return NULL;

    for (i = 0; i < 64; i++)
    {
        if (mapObject->localId == gSaveBlock1.mapObjectTemplates[i].localId)
            return &gSaveBlock1.mapObjectTemplates[i];
    }
    return NULL;
}

void sub_805C754(struct MapObject *mapObject)
{
    struct MapObjectTemplate *template = sub_805C700(mapObject);

    if (template != NULL)
    {
        template->x = mapObject->coords2.x - 7;
        template->y = mapObject->coords2.y - 7;
    }
}

void sub_805C774(struct MapObject *mapObject, u8 movementType)
{
    struct MapObjectTemplate *template = sub_805C700(mapObject);

    if (template != NULL)
        template->movementType = movementType;
}

void sub_805C78C(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;

    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
        sub_805C754(&gMapObjects[mapObjectId]);
}

void sub_805C7C4(u8 a)
{
    gpu_pal_allocator_reset__manage_upper_four();
    gUnknown_030005A6 = 0x11FF;
    gUnknown_030005A4 = a;
    pal_patch_for_npc_range(gUnknown_0837399C[gUnknown_030005A4], 0, 10);
}

u16 npc_paltag_by_palslot(u8 a)
{
    u8 i;

    if (a < 10)
        return gUnknown_0837399C[gUnknown_030005A4][a];

    for (i = 0; gUnknown_083738E4[i].tag != 0x11FF; i++)
    {
        if (gUnknown_083738E4[i].tag == gUnknown_030005A6)
        {
            return gUnknown_083738E4[i].data[gUnknown_030005A4];
        }
    }
    return 0x11FF;
}

u32 sub_805C8A8(void);

void sub_805C884(struct Sprite *sprite)
{
    meta_step(&gMapObjects[sprite->data0], sprite, sub_805C8A8);
}

u32 sub_805C8A8(void)
{
    return 0;
}

u32 sub_805C8D0(struct MapObject *, struct Sprite *);

void sub_805C8AC(struct Sprite *sprite)
{
    meta_step(&gMapObjects[sprite->data0], sprite, sub_805C8D0);
}

extern u8 (*const gUnknown_08375224[])();

u32 sub_805C8D0(struct MapObject *mapObject, struct Sprite *sprite)
{
    return gUnknown_08375224[sprite->data1](mapObject, sprite);
}

void npc_reset();

u8 sub_805C8F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject);
    sprite->data1 = 1;
    return 1;
}

extern void FieldObjectSetRegularAnim();

u8 sub_805C904(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

extern u8 FieldObjectExecRegularAnim(struct MapObject *, struct Sprite *);
extern const s16 gUnknown_0837520C[];
extern void sub_8064820(struct Sprite *, s16);

u8 sub_805C930(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) == 0)
    {
        return 0;
    }
    sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
    sprite->data1 = 3;
    return 1;
}

extern u8 sub_8064824(struct Sprite *);

u8 sub_805C96C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) != 0)
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

extern const u8 gUnknown_08375240[4];
extern u8 sub_805FF20(struct MapObject *, u8);

u8 sub_805C98C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_08375240, 4);
    direction = directions[Random() & 3];
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 5;
    if (sub_805FF20(mapObject, direction) != 0)
    {
        sprite->data1 = 1;
    }
    return 1;
}

u8 sub_805C9D8(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetGoSpeed0AnimId(mapObject->placeholder18));
    mapObject->mapobj_bit_1 = 1;
    sprite->data1 = 6;
    return 1;
}

u8 sub_805CA08(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 1;
    }
    return 0;
}

u8 FieldObjectIsTrainerAndCloseToPlayer(struct MapObject *mapObject)
{
    s16 x;
    s16 y;
    s16 objx;
    s16 objy;
    s16 minx;
    s16 maxx;
    s16 miny;
    s16 maxy;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_DASH) == 0)
    {
        return 0;
    }
    if (mapObject->trainerType != 1 && mapObject->trainerType != 3)
    {
        return 0;
    }
    PlayerGetDestCoords(&x, &y);
    objx = mapObject->coords2.x;
    objy = mapObject->coords2.y;
    minx = objx - mapObject->trainerRange_berryTreeId;
    miny = objy - mapObject->trainerRange_berryTreeId;
    maxx = objx + mapObject->trainerRange_berryTreeId;
    maxy = objy + mapObject->trainerRange_berryTreeId;
    if (minx > x || maxx < x || miny > y || maxy < y)
    {
        return 0;
    }
    return 1;
}
