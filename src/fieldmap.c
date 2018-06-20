#include "global.h"
#include "fieldmap.h"
#include "palette.h"
#include "overworld.h"
#include "script.h"
#include "secret_base.h"
#include "tv.h"

struct ConnectionFlags
{
    u8 south:1;
    u8 north:1;
    u8 west:1;
    u8 east:1;
};

struct Coords32
{
    s32 x;
    s32 y;
};

EWRAM_DATA static u16 gUnknown_02029828[0x2800] = {0};
EWRAM_DATA struct MapHeader gMapHeader = {0};
EWRAM_DATA struct Camera gCamera = {0};
EWRAM_DATA static struct ConnectionFlags gUnknown_0202E850 = {0};

struct BackupMapLayout gUnknown_03004870;

static const struct ConnectionFlags sDummyConnectionFlags = {0};

struct MapHeader *mapconnection_get_mapheader(struct MapConnection *connection)
{
    return Overworld_GetMapHeaderByGroupAndId(connection->mapGroup, connection->mapNum);
}

void not_trainer_hill_battle_pyramid(void)
{
    mapheader_copy_mapdata_with_padding(&gMapHeader);
    sub_80BB970(gMapHeader.events);
    mapheader_run_script_with_tag_x1();
}

void sub_8055FC0(void)
{
    mapheader_copy_mapdata_with_padding(&gMapHeader);
    sub_80BBCCC(0);
    sub_80BB970(gMapHeader.events);
    sub_8056670();
    mapheader_run_script_with_tag_x1();
    UpdateTVScreensOnMap(gUnknown_03004870.width, gUnknown_03004870.height);
}

void mapheader_copy_mapdata_with_padding(struct MapHeader *mapHeader)
{
    struct MapLayout *mapLayout;
    int width;
    int height;
    mapLayout = mapHeader->mapLayout;
    CpuFastFill16(0x03ff, gUnknown_02029828, sizeof(gUnknown_02029828));
    gUnknown_03004870.map = gUnknown_02029828;
    width = mapLayout->width + 15;
    gUnknown_03004870.width = width;
    height = mapLayout->height + 14;
    gUnknown_03004870.height = height;
    if (width * height <= 0x2800)
    {
        map_copy_with_padding(mapLayout->map, mapLayout->width, mapLayout->height);
        sub_80560AC(mapHeader);
    }
}

void map_copy_with_padding(u16 *map, u16 width, u16 height)
{
    u16 *dest;
    int y;
    dest = gUnknown_03004870.map;
    dest += gUnknown_03004870.width * 7 + 7;
    for (y = 0; y < height; y++)
    {
        CpuCopy16(map, dest, width * 2);
        dest += width + 0xf;
        map += width;
    }
}

void sub_80560AC(struct MapHeader *mapHeader)
{
    // BUG: This results in a null pointer dereference when mapHeader->connections
    // is NULL, causing count to be assigned a garbage value. This garbage value
    // just so happens to have the most significant bit set, so it is treated as
    // negative and the loop below thankfully never executes in this scenario.
    int count = mapHeader->connections->count;
    struct MapConnection *connection = mapHeader->connections->connections;
    int i;

    gUnknown_0202E850 = sDummyConnectionFlags;
    for (i = 0; i < count; i++, connection++)
    {
        struct MapHeader *cMap = mapconnection_get_mapheader(connection);
        u32 offset = connection->offset;

        switch (connection->direction)
        {
        case CONNECTION_SOUTH:
            fillSouthConnection(mapHeader, cMap, offset);
            gUnknown_0202E850.south = 1;
            break;
        case CONNECTION_NORTH:
            fillNorthConnection(mapHeader, cMap, offset);
            gUnknown_0202E850.north = 1;
            break;
        case CONNECTION_WEST:
            fillWestConnection(mapHeader, cMap, offset);
            gUnknown_0202E850.west = 1;
            break;
        case CONNECTION_EAST:
            fillEastConnection(mapHeader, cMap, offset);
            gUnknown_0202E850.east = 1;
            break;
        }
    }
}

void sub_8056134(int x, int y, struct MapHeader *mapHeader, int x2, int y2, int width, int height)
{
    int i;
    u16 *src;
    u16 *dest;
    int mapWidth;

    mapWidth = mapHeader->mapLayout->width;
    src = &mapHeader->mapLayout->map[mapWidth * y2 + x2];
    dest = &gUnknown_03004870.map[gUnknown_03004870.width * y + x];

    for (i = 0; i < height; i++)
    {
        CpuCopy16(src, dest, width * 2);
        dest += gUnknown_03004870.width;
        src += mapWidth;
    }
}

void fillSouthConnection(struct MapHeader *mapHeader, struct MapHeader *connectedMapHeader, s32 offset)
{
    int x, y;
    int x2;
    int width;
    int cWidth;

    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapLayout->width;
        x = offset + 7;
        y = mapHeader->mapLayout->height + 7;
        if (x < 0)
        {
            x2 = -x;
            x += cWidth;
            if (x < gUnknown_03004870.width)
            {
                width = x;
            }
            else
            {
                width = gUnknown_03004870.width;
            }
            x = 0;
        }
        else
        {
            x2 = 0;
            if (x + cWidth < gUnknown_03004870.width)
            {
                width = cWidth;
            }
            else
            {
                width = gUnknown_03004870.width - x;
            }
        }
        sub_8056134(
            x, y,
            connectedMapHeader,
            x2, /*y2*/ 0,
            width, /*height*/ 7);
    }
}

void fillNorthConnection(struct MapHeader *mapHeader, struct MapHeader *connectedMapHeader, s32 offset)
{
    int x;
    int x2, y2;
    int width;
    int cWidth, cHeight;

    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapLayout->width;
        cHeight = connectedMapHeader->mapLayout->height;
        x = offset + 7;
        y2 = cHeight - 7;
        if (x < 0)
        {
            x2 = -x;
            x += cWidth;
            if (x < gUnknown_03004870.width)
            {
                width = x;
            }
            else
            {
                width = gUnknown_03004870.width;
            }
            x = 0;
        }
        else
        {
            x2 = 0;
            if (x + cWidth < gUnknown_03004870.width)
            {
                width = cWidth;
            }
            else
            {
                width = gUnknown_03004870.width - x;
            }
        }

        sub_8056134(
            x, /*y*/ 0,
            connectedMapHeader,
            x2, y2,
            width, /*height*/ 7);

    }
}


void fillWestConnection(struct MapHeader *mapHeader, struct MapHeader *connectedMapHeader, s32 offset)
{
    int y;
    int x2, y2;
    int height;
    int cWidth, cHeight;
    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapLayout->width;
        cHeight = connectedMapHeader->mapLayout->height;
        y = offset + 7;
        x2 = cWidth - 7;
        if (y < 0)
        {
            y2 = -y;
            if (y + cHeight < gUnknown_03004870.height)
            {
                height = y + cHeight;
            }
            else
            {
                height = gUnknown_03004870.height;
            }
            y = 0;
        }
        else
        {
            y2 = 0;
            if (y + cHeight < gUnknown_03004870.height)
            {
                height = cHeight;
            }
            else
            {
                height = gUnknown_03004870.height - y;
            }
        }

        sub_8056134(
            /*x*/ 0, y,
            connectedMapHeader,
            x2, y2,
            /*width*/ 7, height);
    }
}

void fillEastConnection(struct MapHeader *mapHeader, struct MapHeader *connectedMapHeader, s32 offset)
{
    int x, y;
    int y2;
    int height;
    int cHeight;
    if (connectedMapHeader)
    {
        cHeight = connectedMapHeader->mapLayout->height;
        x = mapHeader->mapLayout->width + 7;
        y = offset + 7;
        if (y < 0)
        {
            y2 = -y;
            if (y + cHeight < gUnknown_03004870.height)
            {
                height = y + cHeight;
            }
            else
            {
                height = gUnknown_03004870.height;
            }
            y = 0;
        }
        else
        {
            y2 = 0;
            if (y + cHeight < gUnknown_03004870.height)
            {
                height = cHeight;
            }
            else
            {
                height = gUnknown_03004870.height - y;
            }
        }

        sub_8056134(
            x, y,
            connectedMapHeader,
            /*x2*/ 0, y2,
            /*width*/ 8, height);
    }
}

union Block
{
    struct
    {
        u16 block:10;
        u16 collision:2;
        u16 elevation:4;
    } block;
    u16 value;
};

u8 MapGridGetZCoordAt(int x, int y)
{
    u16 block;
    int i;
    u16 *border;

    if (x >= 0 && x < gUnknown_03004870.width
     && y >= 0 && y < gUnknown_03004870.height)
    {
        block = gUnknown_03004870.map[x + gUnknown_03004870.width * y];
    }
    else
    {
        border = gMapHeader.mapLayout->border;
        i = (x + 1) & 1;
        i += ((y + 1) & 1) * 2;
        block = gMapHeader.mapLayout->border[i];
        block |= 0xc00;
    }
    if (block == 0x3ff)
    {
        return 0;
    }
    return block >> 12;
}

u8 MapGridIsImpassableAt(int x, int y)
{
    u16 block;
    int i;
    u16 *border;

    if (x >= 0 && x < gUnknown_03004870.width
     && y >= 0 && y < gUnknown_03004870.height)
    {
        block = gUnknown_03004870.map[x + gUnknown_03004870.width * y];
    }
    else
    {
        border = gMapHeader.mapLayout->border;
        i = (x + 1) & 1;
        i += ((y + 1) & 1) * 2;
        block = gMapHeader.mapLayout->border[i];
        block |= 0xc00;
    }
    if (block == 0x3ff)
    {
        return 1;
    }
    return (block & 0xc00) >> 10;
}

u32 MapGridGetMetatileIdAt(int x, int y)
{
    u16 block;
    int i;
    int j;
    struct MapLayout *mapLayout;
    u16 *border;
    u16 block2;

    if (x >= 0 && x < gUnknown_03004870.width
     && y >= 0 && y < gUnknown_03004870.height)
    {
        block = gUnknown_03004870.map[x + gUnknown_03004870.width * y];
    }
    else
    {
        mapLayout = gMapHeader.mapLayout;
        i = (x + 1) & 1;
        i += ((y + 1) & 1) * 2;
        block = mapLayout->border[i] | 0xc00;
    }
    if (block == 0x3ff)
    {
        border = gMapHeader.mapLayout->border;
        j = (x + 1) & 1;
        j += ((y + 1) & 1) * 2;
        block2 = gMapHeader.mapLayout->border[j];
        block2 |= 0xc00;
        return block2 & block;
    }
    return block & 0x3ff;
}

u32 MapGridGetMetatileBehaviorAt(int x, int y)
{
    u16 metatile;
    metatile = MapGridGetMetatileIdAt(x, y);
    return GetBehaviorByMetatileId(metatile) & 0xff;
}

u8 MapGridGetMetatileLayerTypeAt(int x, int y)
{
    u16 metatile;
    metatile = MapGridGetMetatileIdAt(x, y);
    return (GetBehaviorByMetatileId(metatile) & 0xf000) >> 12;
}

void MapGridSetMetatileIdAt(int x, int y, u16 metatile)
{
    int i;
    if (x >= 0 && x < gUnknown_03004870.width
     && y >= 0 && y < gUnknown_03004870.height)
    {
        i = x + y * gUnknown_03004870.width;
        gUnknown_03004870.map[i] = (gUnknown_03004870.map[i] & 0xf000) | (metatile & 0xfff);
    }
}

void MapGridSetMetatileEntryAt(int x, int y, u16 metatile)
{
    int i;
    if (x >= 0 && x < gUnknown_03004870.width
     && y >= 0 && y < gUnknown_03004870.height)
    {
        i = x + gUnknown_03004870.width * y;
        gUnknown_03004870.map[i] = metatile;
    }
}

u32 GetBehaviorByMetatileId(u16 metatile)
{
    u16 *attributes;
    if (metatile <= 0x1ff)
    {
        attributes = gMapHeader.mapLayout->primaryTileset->metatileAttributes;
        return attributes[metatile];
    }
    else if (metatile <= 0x3ff)
    {
        attributes = gMapHeader.mapLayout->secondaryTileset->metatileAttributes;
        return attributes[metatile - 0x200];
    }
    else
    {
        return 0xff;
    }
}

void save_serialize_map(void)
{
    int i, j;
    int x, y;
    u16 *mapView;
    int width;
    mapView = gSaveBlock1.mapView;
    width = gUnknown_03004870.width;
    x = gSaveBlock1.pos.x;
    y = gSaveBlock1.pos.y;
    for (i = y; i < y + 14; i++)
    {
        for (j = x; j < x + 15; j++)
        {
            *mapView++ = gUnknown_02029828[width * i + j];
        }
    }
}

int sub_8056618(void)
{
    u16 i;
    u32 r2;
    r2 = 0;
    for (i = 0; i < 0x200; i++)
    {
        r2 |= gSaveBlock1.mapView[i];
    }
    if (r2 == 0)
    {
        return 1;
    }
    return 0;
}

void sav2_mapdata_clear(void)
{
    CpuFill16(0, gSaveBlock1.mapView, sizeof(gSaveBlock1.mapView));
}

void sub_8056670(void)
{
    int i, j;
    int x, y;
    u16 *mapView;
    int width;
    mapView = gSaveBlock1.mapView;
    if (!sub_8056618())
    {
        width = gUnknown_03004870.width;
        x = gSaveBlock1.pos.x;
        y = gSaveBlock1.pos.y;
        for (i = y; i < y + 14; i++)
        {
            for (j = x; j < x + 15; j++)
            {
                gUnknown_02029828[width * i + j] = *mapView++;
            }
        }
        sav2_mapdata_clear();
    }
}

void sub_80566F0(u8 a1)
{
    u16 *mapView;
    int width;
    int x0, y0;
    int x2, y2;
    u16 *src, *dest;
    int srci, desti;
    int r9, r8;
    int x, y;
    int i, j;
    mapView = gSaveBlock1.mapView;
    width = gUnknown_03004870.width;
    r9 = 0;
    r8 = 0;
    x0 = gSaveBlock1.pos.x;
    y0 = gSaveBlock1.pos.y;
    x2 = 15;
    y2 = 14;
    switch (a1)
    {
    case CONNECTION_NORTH:
        y0 += 1;
        y2 = 13;
        break;
    case CONNECTION_SOUTH:
        r8 = 1;
        y2 = 13;
        break;
    case CONNECTION_WEST:
        x0 += 1;
        x2 = 14;
        break;
    case CONNECTION_EAST:
        r9 = 1;
        x2 = 14;
        break;
    }
    for (y = 0; y < y2; y++)
    {
        i = 0;
        j = 0;
        for (x = 0; x < x2; x++)
        {
            desti = width * (y + y0);
            srci = (y + r8) * 15 + r9;
            src = &mapView[srci + i];
            dest = &gUnknown_02029828[x0 + desti + j];
            *dest = *src;
            i++;
            j++;
        }
    }
    sav2_mapdata_clear();
}

int GetMapBorderIdAt(int x, int y)
{
    struct MapLayout *mapLayout;
    u16 block, block2;
    int i, j;
    if (x >= 0 && x < gUnknown_03004870.width
     && y >= 0 && y < gUnknown_03004870.height)
    {
        i = gUnknown_03004870.width;
        i *= y;
        block = gUnknown_03004870.map[x + i];
        if (block == 0x3ff)
        {
            goto fail;
        }
    }
    else
    {
        mapLayout = gMapHeader.mapLayout;
        j = (x + 1) & 1;
        j += ((y + 1) & 1) * 2;
        block2 = 0xc00 | mapLayout->border[j];
        if (block2 == 0x3ff)
        {
            goto fail;
        }
    }
    goto success;
fail:
    return -1;
success:

    if (x >= (gUnknown_03004870.width - 8))
    {
        if (!gUnknown_0202E850.east)
        {
            return -1;
        }
        return CONNECTION_EAST;
    }
    else if (x < 7)
    {
        if (!gUnknown_0202E850.west)
        {
            return -1;
        }
        return CONNECTION_WEST;
    }
    else if (y >= (gUnknown_03004870.height - 7))
    {
        if (!gUnknown_0202E850.south)
        {
            return -1;
        }
        return CONNECTION_SOUTH;
    }
    else if (y < 7)
    {
        if (!gUnknown_0202E850.north)
        {
            return -1;
        }
        return CONNECTION_NORTH;
    }
    else
    {
        return 0;
    }
}

int GetPostCameraMoveMapBorderId(int x, int y)
{
    return GetMapBorderIdAt(gSaveBlock1.pos.x + 7 + x, gSaveBlock1.pos.y + 7 + y);
}

int CanCameraMoveInDirection(int direction)
{
    int x, y;
    x = gSaveBlock1.pos.x + 7 + gDirectionToVectors[direction].x;
    y = gSaveBlock1.pos.y + 7 + gDirectionToVectors[direction].y;
    if (GetMapBorderIdAt(x, y) == -1)
    {
        return 0;
    }
    return 1;
}

void sub_8056918(struct MapConnection *connection, int direction, int x, int y)
{
    struct MapHeader *mapHeader;
    mapHeader = mapconnection_get_mapheader(connection);
    switch (direction)
    {
    case CONNECTION_EAST:
        gSaveBlock1.pos.x = -x;
        gSaveBlock1.pos.y -= connection->offset;
        break;
    case CONNECTION_WEST:
        gSaveBlock1.pos.x = mapHeader->mapLayout->width;
        gSaveBlock1.pos.y -= connection->offset;
        break;
    case CONNECTION_SOUTH:
        gSaveBlock1.pos.x -= connection->offset;
        gSaveBlock1.pos.y = -y;
        break;
    case CONNECTION_NORTH:
        gSaveBlock1.pos.x -= connection->offset;
        gSaveBlock1.pos.y = mapHeader->mapLayout->height;
        break;
    }
}

bool8 CameraMove(int x, int y)
{
    unsigned int direction;
    struct MapConnection *connection;
    int old_x, old_y;
    gCamera.field_0 = FALSE;
    direction = GetPostCameraMoveMapBorderId(x, y);
    if (direction + 1 <= 1)
    {
        gSaveBlock1.pos.x += x;
        gSaveBlock1.pos.y += y;
    }
    else
    {
        save_serialize_map();
        old_x = gSaveBlock1.pos.x;
        old_y = gSaveBlock1.pos.y;
        connection = sub_8056A64(direction, gSaveBlock1.pos.x, gSaveBlock1.pos.y);
        sub_8056918(connection, direction, x, y);
        sub_80538F0(connection->mapGroup, connection->mapNum);
        gCamera.field_0 = TRUE;
        gCamera.x = old_x - gSaveBlock1.pos.x;
        gCamera.y = old_y - gSaveBlock1.pos.y;
        gSaveBlock1.pos.x += x;
        gSaveBlock1.pos.y += y;
        sub_80566F0(direction);
    }
    return gCamera.field_0;
}

struct MapConnection *sub_8056A64(u8 direction, int x, int y)
{
    int count;
    struct MapConnection *connection;
    int i;
    count = gMapHeader.connections->count;
    connection = gMapHeader.connections->connections;
    for (i = 0; i < count; i++, connection++)
    {
        if (connection->direction == direction)
        {
            if (sub_8056ABC(direction, x, y, connection) == TRUE)
            {
                return connection;
            }
        }
    }
    return NULL;
}

bool8 sub_8056ABC(u8 direction, int x, int y, struct MapConnection *connection)
{
    struct MapHeader *mapHeader;
    mapHeader = mapconnection_get_mapheader(connection);
    switch (direction)
    {
    case CONNECTION_SOUTH:
    case CONNECTION_NORTH:
        return sub_8056B20(x, gMapHeader.mapLayout->width, mapHeader->mapLayout->width, connection->offset);
    case CONNECTION_WEST:
    case CONNECTION_EAST:
        return sub_8056B20(y, gMapHeader.mapLayout->height, mapHeader->mapLayout->height, connection->offset);
    }
    return FALSE;
}

bool8 sub_8056B20(int x, int src_width, int dest_width, int offset)
{
    int offset2;
    offset2 = offset;
    if (offset2 < 0)
    {
        offset2 = 0;
    }
    if (dest_width + offset < src_width)
    {
        src_width = dest_width + offset;
    }
    if (offset2 <= x && x <= src_width)
    {
        return TRUE;
    }
    return FALSE;
}

int sub_8056B4C(int x, int width)
{
    if (x >= 0 && x < width)
    {
        return TRUE;
    }
    return FALSE;
}

int sub_8056B60(struct MapConnection *connection, int x, int y)
{
    struct MapHeader *mapHeader;
    mapHeader = mapconnection_get_mapheader(connection);
    switch (connection->direction)
    {
    case CONNECTION_SOUTH:
    case CONNECTION_NORTH:
        return sub_8056B4C(x - connection->offset, mapHeader->mapLayout->width);
    case CONNECTION_WEST:
    case CONNECTION_EAST:
        return sub_8056B4C(y - connection->offset, mapHeader->mapLayout->height);
    }
    return FALSE;
}

struct MapConnection *sub_8056BA0(s16 x, s16 y)
{
    int count;
    struct MapConnection *connection;
    int i;
    u8 direction;
    if (!gMapHeader.connections)
    {
        return NULL;
    }
    else
    {
        count = gMapHeader.connections->count;
        connection = gMapHeader.connections->connections;
        for (i = 0; i < count; i++, connection++)
        {
            direction = connection->direction;
            if ((direction == CONNECTION_DIVE || direction == CONNECTION_EMERGE)
             || (direction == CONNECTION_NORTH && y > 6)
             || (direction == CONNECTION_SOUTH && y < gMapHeader.mapLayout->height + 7)
             || (direction == CONNECTION_WEST && x > 6)
             || (direction == CONNECTION_EAST && x < gMapHeader.mapLayout->width + 7))
            {
                continue;
            }
            if (sub_8056B60(connection, x - 7, y - 7) == TRUE)
            {
                return connection;
            }
        }
    }
    return NULL;
}

void sub_8056C50(u16 x, u16 y)
{
    gSaveBlock1.pos.x = x - 7;
    gSaveBlock1.pos.y = y - 7;
}

void sav1_camera_get_focus_coords(u16 *x, u16 *y)
{
    *x = gSaveBlock1.pos.x + 7;
    *y = gSaveBlock1.pos.y + 7;
}

void unref_sub_8056C7C(u16 x, u16 y)
{
    gSaveBlock1.pos.x = x;
    gSaveBlock1.pos.y = y;
}

void GetCameraCoords(u16 *x, u16 *y)
{
    *x = gSaveBlock1.pos.x;
    *y = gSaveBlock1.pos.y;
}

void sub_8056C98(struct Tileset *tileset, void *src)
{
    if (tileset)
    {
        if (!tileset->isCompressed)
        {
            CpuFastSet(tileset->tiles, src, 0x1000);
        }
        else
        {
            LZ77UnCompVram(tileset->tiles, src);
        }
    }
}

void sub_8056CBC(struct Tileset *tileset, int offset, int size)
{
    u16 black;
    if (tileset)
    {
        if (tileset->isSecondary == FALSE)
        {
            black = 0;
            LoadPalette(&black, offset, 2);
            LoadPalette(tileset->palettes + 2, offset + 1, size - 2);
        }
        else if (tileset->isSecondary == TRUE)
        {
            LoadPalette(tileset->palettes + 0xc0, offset, size);
        }
        else
        {
            LZ77UnCompVram(tileset->palettes, (void*)0x2000000);
            LoadPalette((void*)0x2000000, offset, size);
        }
    }
}

void sub_8056D28(struct MapLayout *mapLayout)
{
    void *src = (void*)(BG_VRAM);
    sub_8056C98(mapLayout->primaryTileset, src);
}

void sub_8056D38(struct MapLayout *mapLayout)
{
    void *src = (void*)(BG_VRAM + 0x4000);
    sub_8056C98(mapLayout->secondaryTileset, src);
}

void apply_map_tileset1_palette(struct MapLayout *mapLayout)
{
    sub_8056CBC(mapLayout->primaryTileset, 0, 0xc0);
}

void apply_map_tileset2_palette(struct MapLayout *mapLayout)
{
    sub_8056CBC(mapLayout->secondaryTileset, 0x60, 0xc0);
}

void copy_map_tileset1_tileset2_to_vram(struct MapLayout *mapLayout)
{
    if (mapLayout)
    {
        sub_8056D28(mapLayout);
        sub_8056D38(mapLayout);
    }
}

void apply_map_tileset1_tileset2_palette(struct MapLayout *mapLayout)
{
    if (mapLayout)
    {
        apply_map_tileset1_palette(mapLayout);
        apply_map_tileset2_palette(mapLayout);
    }
}
