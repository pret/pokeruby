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
    u8 filler[0x20];
};

extern struct MapObject gMapObjects[];
extern u8 gSelectedMapObject;
extern struct MapHeader gMapHeader;

#endif // GUARD_FIELDMAP_H
