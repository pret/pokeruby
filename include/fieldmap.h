#ifndef GUARD_FIELDMAP_H
#define GUARD_FIELDMAP_H

typedef void (*TilesetCB)(void);

struct Tileset
{
    bool8 isCompressed;
    bool8 isSecondary;
    void *tiles;
    void *palettes;
    void *metatiles;
    void *metatileAttributes;
    TilesetCB callback;
};

struct MapData
{
    u32 width;
    u32 height;
    void *border;
    void *map;
    struct Tileset *primaryTileset;
    struct Tileset *secondaryTileset;
};

struct MapHeader
{
    struct MapData *mapData;
    void *events;
    u8 *mapScripts;
    // TODO: rest of struct
};

struct MapObject
{
    u32 active:1;
    u32 mapobj_bit_1:1;
    u32 mapobj_bit_2:1;
    u32 mapobj_bit_3:1;
    u32 mapobj_bit_4:1;
    u32 mapobj_bit_5:1;
    u32 mapobj_bit_6:1;
    u32 mapobj_bit_7:1;
    u32 mapobj_bit_8:1;
    u32 mapobj_bit_9:1;
    u32 mapobj_bit_10:1;
    u32 mapobj_bit_11:1;
    u32 mapobj_bit_12:1;
    u32 mapobj_bit_13:1;
    u32 mapobj_bit_14:1;
    u32 mapobj_bit_15:1;
    u32 mapobj_bit_16:1;
    u32 mapobj_bit_17:1;
    u32 mapobj_bit_18:1;
    u32 mapobj_bit_19:1;
    u32 mapobj_bit_20:1;
    u32 mapobj_bit_21:1;
    u32 mapobj_bit_22:1;
    u32 mapobj_bit_23:1;
    u32 mapobj_bit_24:1;
    u32 mapobj_bit_25:1;
    u32 mapobj_bit_26:1;
    u32 mapobj_bit_27:1;
    u32 mapobj_bit_28:1;
    u32 mapobj_bit_29:1;
    u32 mapobj_bit_30:1;
    u32 mapobj_bit_31:1;
    u8 spriteId;
    u8 graphicsId;
    u8 filler[0x1E];
};

struct MapObjectGraphicsInfo
{
    u16 tileTag;
    u16 paletteTag1;
    u16 paletteTag2;
    u16 size;
    s16 width;
    s16 height;
    u8 paletteSlot:4;
    u8 shadowSize:2;
    u8 inanimate:1;
    u8 disableReflectionPaletteLoad:1;
    u8 tracks;
    struct OamData *oam;
    struct SubspriteTable *subspriteTables;
    union AnimCmd **anims;
    struct SpriteFrameImage *images;
    union AffineAnimCmd **affineAnims;
};

struct PlayerAvatar
{
    u8 bitfield;
    u8 bike;
    u8 running2;
    u8 running1;
    u8 spriteId;
    u8 mapObjectId;
    // TODO: rest of struct
};

extern struct MapObject gMapObjects[];
extern u8 gSelectedMapObject;
extern struct MapHeader gMapHeader;
extern struct PlayerAvatar gPlayerAvatar;

#endif // GUARD_FIELDMAP_H
