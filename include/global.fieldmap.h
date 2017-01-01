#ifndef GUARD_GLOBAL_FIELDMAP_H
#define GUARD_GLOBAL_FIELDMAP_H

enum
{
    CONNECTION_SOUTH = 1,
    CONNECTION_NORTH,
    CONNECTION_WEST,
    CONNECTION_EAST,
    CONNECTION_DIVE,
    CONNECTION_EMERGE
};

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
    s32 width;
    s32 height;
    u16 *border;
    u16 *map;
    struct Tileset *primaryTileset;
    struct Tileset *secondaryTileset;
};

struct MapObjectTemplate
{
    /*0x00*/ u8 localId;
    /*0x01*/ u8 filler_1[0x3];
    /*0x04*/ s16 x;
    /*0x06*/ s16 y;
    /*0x08*/ u8 elevation;
    /*0x09*/ u8 movementType;
    /*0x0A*/ u8 filler_A[0x6];
    /*0x10*/ u8 *script;
    /*0x14*/ u8 filler_14[0x4];
};  /*size = 0x18*/

struct WarpEvent
{
    s16 x, y;
    s8 warpId;
    s8 mapGroup;
    s8 mapNum;
};

struct CoordEvent
{
    s16 x, y;
    u8 filler_4[0x2];
    u16 trigger;
    u16 index;
    u8 filler_A[0x2];
    u8 *script;
};

struct BgEvent
{
    s16 x, y;
    u8 filler_4;
    u8 kind;
    s16 filler_6;
    u8 *script;
};

struct MapEvents
{
    u32 mapObjectCount;
    u8 warpCount;
    u8 coordEventCount;
    u8 bgEventCount;

    struct MapObjectTemplate *mapObjects;
    struct WarpEvent *warps;
    struct CoordEvent *coordEvents;
    struct BgEvent *bgEvents;
};

struct MapConnection
{
    u8 direction;
    u32 offset;
    u8 mapGroup;
    u8 mapNum;
};

struct MapConnections
{
    s32 count;
    struct MapConnection *connections;
};

struct MapHeader
{
    struct MapData *mapData;
    struct MapEvents *events;
    u8 *mapScripts;
    struct MapConnections *connections;
    u16 music;
    u16 mapDataId;
    u8 name;
    u8 cave;
    u8 weather;
    /* 0x17 */ u8 light;
    u8 filler_18;
    u8 escapeRope;
    u8 flags;
    u8 battleType;
};

struct MapObject
{
    /*0x00*/ u32 active:1;
             u32 mapobj_bit_1:1;
             u32 mapobj_bit_2:1;
             u32 mapobj_bit_3:1;
             u32 mapobj_bit_4:1;
             u32 mapobj_bit_5:1;
             u32 mapobj_bit_6:1;
             u32 mapobj_bit_7:1;
    /*0x01*/ u32 mapobj_bit_8:1;
             u32 mapobj_bit_9:1;
             u32 mapobj_bit_10:1;
             u32 mapobj_bit_11:1;
             u32 mapobj_bit_12:1;
             u32 mapobj_bit_13:1;
             u32 mapobj_bit_14:1;
             u32 mapobj_bit_15:1;
    /*0x02*/ u32 mapobj_bit_16:1;
             u32 mapobj_bit_17:1;
             u32 mapobj_bit_18:1;
             u32 mapobj_bit_19:1;
             u32 mapobj_bit_20:1;
             u32 mapobj_bit_21:1;
             u32 mapobj_bit_22:1;
             u32 mapobj_bit_23:1;
    /*0x03*/ u32 mapobj_bit_24:1;
             u32 mapobj_bit_25:1;
             u32 mapobj_bit_26:1;
             u32 mapobj_bit_27:1;
             u32 mapobj_bit_28:1;
             u32 mapobj_bit_29:1;
             u32 mapobj_bit_30:1;
             u32 mapobj_bit_31:1;
    /*0x04*/ u8 spriteId;
    /*0x05*/ u8 graphicsId;
    /*0x06*/ u8 animPattern;
    /*0x07*/ u8 trainerType;
    /*0x08*/ u8 localId;
    /*0x09*/ u8 mapNum;
    /*0x0A*/ u8 mapGroup;
    /*0x0B*/ u8 mapobj_unk_0B_0:4;
             u8 elevation:4;
    /*0x0C*/ struct Coords16 coords1;
    /*0x10*/ struct Coords16 coords2;
    /*0x14*/ struct Coords16 coords3;
    /*0x18*/ u8 mapobj_unk_18:4;
    /*0x18*/ u8 placeholder18:4;
    /*0x19*/ u8 mapobj_unk_19;
    /*0x1A*/ u8 mapobj_unk_1A;
    /*0x1B*/ u8 mapobj_unk_1B;
    /*0x1C*/ u8 mapobj_unk_1C;
    /*0x1D*/ u8 trainerRange_berryTreeId;
    /*0x1E*/ u8 mapobj_unk_1E;
    /*0x1F*/ u8 mapobj_unk_1F;
    /*0x20*/ u8 mapobj_unk_20;
    /*0x21*/ u8 mapobj_unk_21;
    /*0x22*/ u8 mapobj_unk_22;
    /*size = 0x24*/
};

// THIS IS NEEDED TO MAKE TRAINER_SEE.C MATCH, PLEASE DO NOT REMOVE UNLESS YOU FIX CHECKPATHBETWEENTRAINERANDPLAYER
struct MapObject2
{
    /*0x00*/ u32 active:1;
             u32 mapobj_bit_1:1;
             u32 mapobj_bit_2:1;
             u32 mapobj_bit_3:1;
             u32 mapobj_bit_4:1;
             u32 mapobj_bit_5:1;
             u32 mapobj_bit_6:1;
             u32 mapobj_bit_7:1;
    /*0x01*/ u32 mapobj_bit_8:1;
             u32 mapobj_bit_9:1;
             u32 mapobj_bit_10:1;
             u32 mapobj_bit_11:1;
             u32 mapobj_bit_12:1;
             u32 mapobj_bit_13:1;
             u32 mapobj_bit_14:1;
             u32 mapobj_bit_15:1;
    /*0x02*/ u32 mapobj_bit_16:1;
             u32 mapobj_bit_17:1;
             u32 mapobj_bit_18:1;
             u32 mapobj_bit_19:1;
             u32 mapobj_bit_20:1;
             u32 mapobj_bit_21:1;
             u32 mapobj_bit_22:1;
             u32 mapobj_bit_23:1;
    /*0x03*/ u32 mapobj_bit_24:1;
             u32 mapobj_bit_25:1;
             u32 mapobj_bit_26:1;
             u32 mapobj_bit_27:1;
             u32 mapobj_bit_28:1;
             u32 mapobj_bit_29:1;
             u32 mapobj_bit_30:1;
             u32 mapobj_bit_31:1;
    /*0x04*/ u8 spriteId;
    /*0x05*/ u8 graphicsId;
    /*0x06*/ u8 animPattern;
    /*0x07*/ u8 trainerType;
    /*0x08*/ u8 localId;
    /*0x09*/ u8 mapNum;
    /*0x0A*/ u8 mapGroup;
    /*0x0B*/ u8 mapobj_unk_0B_0:4;
             u8 elevation:4;
    /*0x0C*/ struct Coords16 coords1;
    /*0x10*/ struct Coords16 coords2;
    /*0x14*/ struct Coords16 coords3;
    /*0x18*/ u8 mapobj_unk_18:4;
    /*0x18*/ u8 placeholder18:4;
    /*0x19*/ u8 mapobj_unk_19:4;
    /*0x19*/ u8 mapobj_unk_19b:4;
    /*0x1A*/ u8 mapobj_unk_1A;
    /*0x1B*/ u8 mapobj_unk_1B;
    /*0x1C*/ u8 mapobj_unk_1C;
    /*0x1D*/ u8 trainerRange_berryTreeId;
    /*0x1E*/ u8 mapobj_unk_1E;
    /*0x1F*/ u8 mapobj_unk_1F;
    /*0x20*/ u8 mapobj_unk_20;
    /*0x21*/ u8 mapobj_unk_21;
    /*size = 0x24*/
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

#define PLAYER_AVATAR_FLAG_ON_FOOT   (1 << 0)
#define PLAYER_AVATAR_FLAG_MACH_BIKE (1 << 1)
#define PLAYER_AVATAR_FLAG_ACRO_BIKE (1 << 2)
#define PLAYER_AVATAR_FLAG_SURFING   (1 << 3)
#define PLAYER_AVATAR_FLAG_4         (1 << 4)
#define PLAYER_AVATAR_FLAG_5         (1 << 5)
#define PLAYER_AVATAR_FLAG_6         (1 << 6)
#define PLAYER_AVATAR_FLAG_DASH      (1 << 7)

struct PlayerAvatar
{
    /*0x00*/ u8 flags;
    /*0x01*/ u8 bike;
    /*0x02*/ u8 running2;
    /*0x03*/ u8 running1;
    /*0x04*/ u8 spriteId;
    /*0x05*/ u8 mapObjectId;
    /*0x06*/ u8 unk6;
    /*0x07*/ u8 gender;
    // TODO: rest of struct
};

extern struct MapObject gMapObjects[];
extern u8 gSelectedMapObject;
extern struct MapHeader gMapHeader;
extern struct PlayerAvatar gPlayerAvatar;

#endif // GUARD_GLOBAL_FIELDMAP_H
