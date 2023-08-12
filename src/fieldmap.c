#include "global.h"
#include "fieldmap.h"
#include "palette.h"
#include "overworld.h"
#include "script.h"
#include "secret_base.h"
#include "tv.h"
#include "constants/metatile_behaviors.h"

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

EWRAM_DATA static u16 gBackupMapData[MAX_MAP_DATA_SIZE] = {0};
EWRAM_DATA struct MapHeader gMapHeader = {0};
EWRAM_DATA struct Camera gCamera = {0};
EWRAM_DATA static struct ConnectionFlags gMapConnectionFlags = {0};

struct BackupMapLayout gBackupMapLayout;

static const struct ConnectionFlags sDummyConnectionFlags = {0};

static void InitMapLayoutData(struct MapHeader *mapHeader);
static void InitBackupMapLayoutData(const u16 *map, u16 width, u16 height);
static void FillSouthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
static void FillNorthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
static void FillWestConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
static void FillEastConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset);
static void InitBackupMapLayoutConnections(struct MapHeader *mapHeader);
static void LoadSavedMapView(void);
static const struct MapConnection *GetIncomingConnection(u8 direction, int x, int y);
static bool8 IsPosInIncomingConnectingMap(u8 direction, int x, int y, const struct MapConnection *connection);
static bool8 IsCoordInIncomingConnectingMap(int coord, int srcMax, int destMax, int offset);

#define GetBorderBlockAt(x, y)({                                                                   \
    u16 block;                                                                                     \
    int i;                                                                                         \
    UNUSED const u16 *border = gMapHeader.mapLayout->border; /* Read again below */                \
                                                                                                   \
    i = (x + 1) & 1;                                                                               \
    i += ((y + 1) & 1) * 2;                                                                        \
                                                                                                   \
    block = gMapHeader.mapLayout->border[i] | MAPGRID_COLLISION_MASK;                              \
})

#define AreCoordsWithinMapGridBounds(x, y) (x >= 0 && x < gBackupMapLayout.width && y >= 0 && y < gBackupMapLayout.height)

#define GetMapGridBlockAt(x, y) (AreCoordsWithinMapGridBounds(x, y) ? gBackupMapLayout.map[x + gBackupMapLayout.width * y] : GetBorderBlockAt(x, y))

const struct MapHeader *const GetMapHeaderFromConnection(const struct MapConnection *connection)
{
    return Overworld_GetMapHeaderByGroupAndId(connection->mapGroup, connection->mapNum);
}

void InitMap(void)
{
    InitMapLayoutData(&gMapHeader);
    SetOccupiedSecretBaseEntranceMetatiles(gMapHeader.events);
    RunOnLoadMapScript();
}

void InitMapFromSavedGame(void)
{
    InitMapLayoutData(&gMapHeader);
    InitSecretBaseAppearance(FALSE);
    SetOccupiedSecretBaseEntranceMetatiles(gMapHeader.events);
    LoadSavedMapView();
    RunOnLoadMapScript();
    UpdateTVScreensOnMap(gBackupMapLayout.width, gBackupMapLayout.height);
}

static void InitMapLayoutData(struct MapHeader *mapHeader)
{
    struct MapLayout const *mapLayout;
    int width;
    int height;
    mapLayout = mapHeader->mapLayout;
    CpuFastFill16(MAPGRID_UNDEFINED, gBackupMapData, sizeof(gBackupMapData));
    gBackupMapLayout.map = gBackupMapData;
    width = mapLayout->width + MAP_OFFSET_W;
    gBackupMapLayout.width = width;
    height = mapLayout->height + MAP_OFFSET_H;
    gBackupMapLayout.height = height;
    if (width * height <= MAX_MAP_DATA_SIZE)
    {
        InitBackupMapLayoutData(mapLayout->map, mapLayout->width, mapLayout->height);
        InitBackupMapLayoutConnections(mapHeader);
    }
}

static void InitBackupMapLayoutData(const u16 *map, u16 width, u16 height)
{
    u16 *dest;
    int y;
    dest = gBackupMapLayout.map;
    dest += gBackupMapLayout.width * 7 + MAP_OFFSET;
    for (y = 0; y < height; y++)
    {
        CpuCopy16(map, dest, width * 2);
        dest += width + MAP_OFFSET_W;
        map += width;
    }
}

static void InitBackupMapLayoutConnections(struct MapHeader *mapHeader)
{
    // BUG: This results in a null pointer dereference when mapHeader->connections
    // is NULL, causing count to be assigned a garbage value. This garbage value
    // just so happens to have the most significant bit set, so it is treated as
    // negative and the loop below thankfully never executes in this scenario.
    int count = mapHeader->connections->count;
    const struct MapConnection *connection = mapHeader->connections->connections;
    int i;

    gMapConnectionFlags = sDummyConnectionFlags;
    for (i = 0; i < count; i++, connection++)
    {
        struct MapHeader const *cMap = GetMapHeaderFromConnection(connection);
        u32 offset = connection->offset;

        switch (connection->direction)
        {
        case CONNECTION_SOUTH:
            FillSouthConnection(mapHeader, cMap, offset);
            gMapConnectionFlags.south = TRUE;
            break;
        case CONNECTION_NORTH:
            FillNorthConnection(mapHeader, cMap, offset);
            gMapConnectionFlags.north = TRUE;
            break;
        case CONNECTION_WEST:
            FillWestConnection(mapHeader, cMap, offset);
            gMapConnectionFlags.west = TRUE;
            break;
        case CONNECTION_EAST:
            FillEastConnection(mapHeader, cMap, offset);
            gMapConnectionFlags.east = TRUE;
            break;
        }
    }
}

static void FillConnection(int x, int y, struct MapHeader const *connectedMapHeader, int x2, int y2, int width, int height)
{
    int i;
    const u16 *src;
    u16 *dest;
    int mapWidth;

    mapWidth = connectedMapHeader->mapLayout->width;
    src = &connectedMapHeader->mapLayout->map[mapWidth * y2 + x2];
    dest = &gBackupMapLayout.map[gBackupMapLayout.width * y + x];

    for (i = 0; i < height; i++)
    {
        CpuCopy16(src, dest, width * 2);
        dest += gBackupMapLayout.width;
        src += mapWidth;
    }
}

static void FillSouthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset)
{
    int x, y;
    int x2;
    int width;
    int cWidth;

    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapLayout->width;
        x = offset + MAP_OFFSET;
        y = mapHeader->mapLayout->height + MAP_OFFSET;
        if (x < 0)
        {
            x2 = -x;
            x += cWidth;
            if (x < gBackupMapLayout.width)
                width = x;
            else
                width = gBackupMapLayout.width;
            x = 0;
        }
        else
        {
            x2 = 0;
            if (x + cWidth < gBackupMapLayout.width)
                width = cWidth;
            else
                width = gBackupMapLayout.width - x;
        }
        FillConnection(
            x, y,
            connectedMapHeader,
            x2, /*y2*/ 0,
            width, /*height*/ MAP_OFFSET);
    }
}

static void FillNorthConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset)
{
    int x;
    int x2, y2;
    int width;
    int cWidth, cHeight;

    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapLayout->width;
        cHeight = connectedMapHeader->mapLayout->height;
        x = offset + MAP_OFFSET;
        y2 = cHeight - MAP_OFFSET;
        if (x < 0)
        {
            x2 = -x;
            x += cWidth;
            if (x < gBackupMapLayout.width)
                width = x;
            else
                width = gBackupMapLayout.width;
            x = 0;
        }
        else
        {
            x2 = 0;
            if (x + cWidth < gBackupMapLayout.width)
                width = cWidth;
            else
                width = gBackupMapLayout.width - x;
        }

        FillConnection(
            x, /*y*/ 0,
            connectedMapHeader,
            x2, y2,
            width, /*height*/ 7);

    }
}


static void FillWestConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset)
{
    int y;
    int x2, y2;
    int height;
    int cWidth, cHeight;
    if (connectedMapHeader)
    {
        cWidth = connectedMapHeader->mapLayout->width;
        cHeight = connectedMapHeader->mapLayout->height;
        y = offset + MAP_OFFSET;
        x2 = cWidth - MAP_OFFSET;
        if (y < 0)
        {
            y2 = -y;
            if (y + cHeight < gBackupMapLayout.height)
                height = y + cHeight;
            else
                height = gBackupMapLayout.height;
            y = 0;
        }
        else
        {
            y2 = 0;
            if (y + cHeight < gBackupMapLayout.height)
                height = cHeight;
            else
                height = gBackupMapLayout.height - y;
        }

        FillConnection(
            /*x*/ 0, y,
            connectedMapHeader,
            x2, y2,
            /*width*/ MAP_OFFSET, height);
    }
}

static void FillEastConnection(struct MapHeader const *mapHeader, struct MapHeader const *connectedMapHeader, s32 offset)
{
    int x, y;
    int y2;
    int height;
    int cHeight;
    if (connectedMapHeader)
    {
        cHeight = connectedMapHeader->mapLayout->height;
        x = mapHeader->mapLayout->width + MAP_OFFSET;
        y = offset + MAP_OFFSET;
        if (y < 0)
        {
            y2 = -y;
            if (y + cHeight < gBackupMapLayout.height)
                height = y + cHeight;
            else
                height = gBackupMapLayout.height;
            y = 0;
        }
        else
        {
            y2 = 0;
            if (y + cHeight < gBackupMapLayout.height)
                height = cHeight;
            else
                height = gBackupMapLayout.height - y;
        }

        FillConnection(
            x, y,
            connectedMapHeader,
            /*x2*/ 0, y2,
            /*width*/ MAP_OFFSET + 1, height);
    }
}

u8 MapGridGetElevationAt(int x, int y)
{
    u16 block = GetMapGridBlockAt(x, y);

    if (block == MAPGRID_UNDEFINED)
        return 0;

    return block >> MAPGRID_ELEVATION_SHIFT;
}

u8 MapGridGetCollisionAt(int x, int y)
{
    u16 block = GetMapGridBlockAt(x, y);

    if (block == MAPGRID_UNDEFINED)
        return TRUE;

    return (block & MAPGRID_COLLISION_MASK) >> MAPGRID_COLLISION_SHIFT;
}

u32 MapGridGetMetatileIdAt(int x, int y)
{
    u16 block = GetMapGridBlockAt(x, y);

    if (block == MAPGRID_UNDEFINED)
        return GetBorderBlockAt(x, y) & MAPGRID_METATILE_ID_MASK;

    return block & MAPGRID_METATILE_ID_MASK;
}

u32 MapGridGetMetatileBehaviorAt(int x, int y)
{
    u16 metatile = MapGridGetMetatileIdAt(x, y);
    return GetMetatileAttributesById(metatile) & METATILE_ATTR_BEHAVIOR_MASK;
}

u8 MapGridGetMetatileLayerTypeAt(int x, int y)
{
    u16 metatile = MapGridGetMetatileIdAt(x, y);
    return (GetMetatileAttributesById(metatile) & METATILE_ATTR_LAYER_MASK) >> METATILE_ATTR_LAYER_SHIFT;
}

void MapGridSetMetatileIdAt(int x, int y, u16 metatile)
{
    int i;
    if (AreCoordsWithinMapGridBounds(x, y))
    {
        i = x + y * gBackupMapLayout.width;
        gBackupMapLayout.map[i] = (gBackupMapLayout.map[i] & MAPGRID_ELEVATION_MASK) | (metatile & ~MAPGRID_ELEVATION_MASK);
    }
}

void MapGridSetMetatileEntryAt(int x, int y, u16 metatile)
{
    int i;
    if (AreCoordsWithinMapGridBounds(x, y))
    {
        i = x + gBackupMapLayout.width * y;
        gBackupMapLayout.map[i] = metatile;
    }
}

u16 GetMetatileAttributesById(u16 metatile)
{
    const u16 *attributes;
    if (metatile < NUM_METATILES_IN_PRIMARY)
    {
        attributes = gMapHeader.mapLayout->primaryTileset->metatileAttributes;
        return attributes[metatile];
    }
    else if (metatile < NUM_METATILES_TOTAL)
    {
        attributes = gMapHeader.mapLayout->secondaryTileset->metatileAttributes;
        return attributes[metatile - NUM_METATILES_IN_PRIMARY];
    }
    else
    {
        return MB_INVALID;
    }
}

void SaveMapView(void)
{
    int i, j;
    int x, y;
    u16 *mapView;
    int width;
    mapView = gSaveBlock1.mapView;
    width = gBackupMapLayout.width;
    x = gSaveBlock1.pos.x;
    y = gSaveBlock1.pos.y;
    for (i = y; i < y + MAP_OFFSET_H; i++)
    {
        for (j = x; j < x + MAP_OFFSET_W; j++)
            *mapView++ = gBackupMapData[width * i + j];
    }
}

static bool32 SavedMapViewIsEmpty(void)
{
    u16 i;
    u32 marker = 0;

#ifndef UBFIX
    // BUG: This loop extends past the bounds of the mapView array. Its size is only 0x100.
    for (i = 0; i < 0x200; i++)
#else
    for (i = 0; i < ARRAY_COUNT(gSaveBlock1.mapView); i++)
#endif
        marker |= gSaveBlock1.mapView[i];

    if (marker == 0)
        return TRUE;

    return FALSE;
}

static void ClearSavedMapView(void)
{
    CpuFill16(0, gSaveBlock1.mapView, sizeof(gSaveBlock1.mapView));
}

static void LoadSavedMapView(void)
{
    int i, j;
    int x, y;
    u16 *mapView;
    int width;
    mapView = gSaveBlock1.mapView;
    if (!SavedMapViewIsEmpty())
    {
        width = gBackupMapLayout.width;
        x = gSaveBlock1.pos.x;
        y = gSaveBlock1.pos.y;
        for (i = y; i < y + MAP_OFFSET_H; i++)
        {
            for (j = x; j < x + MAP_OFFSET_W; j++)
                gBackupMapData[width * i + j] = *mapView++;
        }
        ClearSavedMapView();
    }
}

static void MoveMapViewToBackup(u8 direction)
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
    width = gBackupMapLayout.width;
    r9 = 0;
    r8 = 0;
    x0 = gSaveBlock1.pos.x;
    y0 = gSaveBlock1.pos.y;
    x2 = MAP_OFFSET_W;
    y2 = MAP_OFFSET_H;
    switch (direction)
    {
    case CONNECTION_NORTH:
        y0 += 1;
        y2 = MAP_OFFSET_H - 1;
        break;
    case CONNECTION_SOUTH:
        r8 = 1;
        y2 = MAP_OFFSET_H - 1;
        break;
    case CONNECTION_WEST:
        x0 += 1;
        x2 = MAP_OFFSET_W - 1;
        break;
    case CONNECTION_EAST:
        r9 = 1;
        x2 = MAP_OFFSET_W - 1;
        break;
    }
    for (y = 0; y < y2; y++)
    {
        i = 0;
        j = 0;
        for (x = 0; x < x2; x++)
        {
            desti = width * (y + y0);
            srci = (y + r8) * MAP_OFFSET_W + r9;
            src = &mapView[srci + i];
            dest = &gBackupMapData[x0 + desti + j];
            *dest = *src;
            i++;
            j++;
        }
    }
    ClearSavedMapView();
}

int GetMapBorderIdAt(int x, int y)
{
    if (GetMapGridBlockAt(x, y) == MAPGRID_UNDEFINED)
        return CONNECTION_INVALID;

    if (x >= (gBackupMapLayout.width - (MAP_OFFSET + 1)))
    {
        if (!gMapConnectionFlags.east)
            return CONNECTION_INVALID;

        return CONNECTION_EAST;
    }
    else if (x < MAP_OFFSET)
    {
        if (!gMapConnectionFlags.west)
            return CONNECTION_INVALID;

        return CONNECTION_WEST;
    }
    else if (y >= (gBackupMapLayout.height - MAP_OFFSET))
    {
        if (!gMapConnectionFlags.south)
            return CONNECTION_INVALID;

        return CONNECTION_SOUTH;
    }
    else if (y < MAP_OFFSET)
    {
        if (!gMapConnectionFlags.north)
            return CONNECTION_INVALID;

        return CONNECTION_NORTH;
    }
    else
    {
        return CONNECTION_NONE;
    }
}

int GetPostCameraMoveMapBorderId(int x, int y)
{
    return GetMapBorderIdAt(gSaveBlock1.pos.x + MAP_OFFSET + x, gSaveBlock1.pos.y + MAP_OFFSET + y);
}

bool32 CanCameraMoveInDirection(int direction)
{
    int x, y;
    x = gSaveBlock1.pos.x + MAP_OFFSET + gDirectionToVectors[direction].x;
    y = gSaveBlock1.pos.y + MAP_OFFSET + gDirectionToVectors[direction].y;

    if (GetMapBorderIdAt(x, y) == CONNECTION_INVALID)
        return FALSE;

    return TRUE;
}

static void SetPositionFromConnection(const struct MapConnection *connection, int direction, int x, int y)
{
    const struct MapHeader *mapHeader;
    mapHeader = GetMapHeaderFromConnection(connection);
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
    int direction;
    const struct MapConnection *connection;
    int old_x, old_y;
    gCamera.active = FALSE;
    direction = GetPostCameraMoveMapBorderId(x, y);
    if (direction == CONNECTION_NONE || direction == CONNECTION_INVALID)
    {
        gSaveBlock1.pos.x += x;
        gSaveBlock1.pos.y += y;
    }
    else
    {
        SaveMapView();
        old_x = gSaveBlock1.pos.x;
        old_y = gSaveBlock1.pos.y;
        connection = GetIncomingConnection(direction, gSaveBlock1.pos.x, gSaveBlock1.pos.y);
        SetPositionFromConnection(connection, direction, x, y);
        LoadMapFromCameraTransition(connection->mapGroup, connection->mapNum);
        gCamera.active = TRUE;
        gCamera.x = old_x - gSaveBlock1.pos.x;
        gCamera.y = old_y - gSaveBlock1.pos.y;
        gSaveBlock1.pos.x += x;
        gSaveBlock1.pos.y += y;
        MoveMapViewToBackup(direction);
    }
    return gCamera.active;
}

static const struct MapConnection *GetIncomingConnection(u8 direction, int x, int y)
{
    int count;
    int i;
    const struct MapConnection *connection;
    const struct MapConnections *connections = gMapHeader.connections;

#ifdef UBFIX // UB: Multiple possible null dereferences
    if (connections == NULL || connections->connections == NULL)
        return NULL;
#endif
    count = connections->count;
    connection = connections->connections;
    for (i = 0; i < count; i++, connection++)
    {
        if (connection->direction == direction && IsPosInIncomingConnectingMap(direction, x, y, connection) == TRUE)
            return connection;
    }
    return NULL;
}

static bool8 IsPosInIncomingConnectingMap(u8 direction, int x, int y, const struct MapConnection *connection)
{
    const struct MapHeader *mapHeader;
    mapHeader = GetMapHeaderFromConnection(connection);
    switch (direction)
    {
    case CONNECTION_SOUTH:
    case CONNECTION_NORTH:
        return IsCoordInIncomingConnectingMap(x, gMapHeader.mapLayout->width, mapHeader->mapLayout->width, connection->offset);
    case CONNECTION_WEST:
    case CONNECTION_EAST:
        return IsCoordInIncomingConnectingMap(y, gMapHeader.mapLayout->height, mapHeader->mapLayout->height, connection->offset);
    }
    return FALSE;
}

static bool8 IsCoordInIncomingConnectingMap(int coord, int srcMax, int destMax, int offset)
{
    int offset2;
    offset2 = offset;

    if (offset2 < 0)
        offset2 = 0;

    if (destMax + offset < srcMax)
        srcMax = destMax + offset;

    if (offset2 <= coord && coord <= srcMax)
        return TRUE;

    return FALSE;
}

static int IsCoordInConnectingMap(int coord, int max)
{
    if (coord >= 0 && coord < max)
        return TRUE;

    return FALSE;
}

static int IsPosInConnectingMap(const struct MapConnection *connection, int x, int y)
{
    const struct MapHeader *mapHeader;
    mapHeader = GetMapHeaderFromConnection(connection);
    switch (connection->direction)
    {
    case CONNECTION_SOUTH:
    case CONNECTION_NORTH:
        return IsCoordInConnectingMap(x - connection->offset, mapHeader->mapLayout->width);
    case CONNECTION_WEST:
    case CONNECTION_EAST:
        return IsCoordInConnectingMap(y - connection->offset, mapHeader->mapLayout->height);
    }
    return FALSE;
}

const struct MapConnection *GetMapConnectionAtPos(s16 x, s16 y)
{
    int count;
    const struct MapConnection *connection;
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
             || (direction == CONNECTION_NORTH && y > MAP_OFFSET - 1)
             || (direction == CONNECTION_SOUTH && y < gMapHeader.mapLayout->height + MAP_OFFSET)
             || (direction == CONNECTION_WEST && x > MAP_OFFSET - 1)
             || (direction == CONNECTION_EAST && x < gMapHeader.mapLayout->width + MAP_OFFSET))
            {
                continue;
            }
            if (IsPosInConnectingMap(connection, x - MAP_OFFSET, y - MAP_OFFSET) == TRUE)
            {
                return connection;
            }
        }
    }
    return NULL;
}

void SetCameraFocusCoords(u16 x, u16 y)
{
    gSaveBlock1.pos.x = x - MAP_OFFSET;
    gSaveBlock1.pos.y = y - MAP_OFFSET;
}

void GetCameraFocusCoords(u16 *x, u16 *y)
{
    *x = gSaveBlock1.pos.x + MAP_OFFSET;
    *y = gSaveBlock1.pos.y + MAP_OFFSET;
}

static UNUSED void SetCameraCoords(u16 x, u16 y)
{
    gSaveBlock1.pos.x = x;
    gSaveBlock1.pos.y = y;
}

void GetCameraCoords(u16 *x, u16 *y)
{
    *x = gSaveBlock1.pos.x;
    *y = gSaveBlock1.pos.y;
}

static void CopyTilesetToVram(const struct Tileset *tileset, void *dest)
{
    if (tileset)
    {
        if (!tileset->isCompressed)
            CpuFastCopy(tileset->tiles, dest, 512 * TILE_SIZE_4BPP); // Number of primary and secondary tiles are assumed to be the same
        else
            LZ77UnCompVram(tileset->tiles, dest);
    }
}

static void LoadTilesetPalette(const struct Tileset *tileset, int destOffset, int size)
{
    if (tileset)
    {
        if (tileset->isSecondary == FALSE)
        {
            u16 black = RGB_BLACK;
            LoadPalette(&black, destOffset, PLTT_SIZEOF(1));
            LoadPalette(tileset->palettes[0] + 1, destOffset + 1, size - PLTT_SIZEOF(1));
        }
        else if (tileset->isSecondary == TRUE)
        {
            LoadPalette(tileset->palettes[NUM_PALS_IN_PRIMARY], destOffset, size);
        }
        else
        {
            LZ77UnCompVram(tileset->palettes, (void*)EWRAM);
            LoadPalette((void*)EWRAM, destOffset, size);
        }
    }
}

void CopyPrimaryTilesetToVram(const struct MapLayout *mapLayout)
{
    void *dest = (void*)(BG_VRAM);
    CopyTilesetToVram(mapLayout->primaryTileset, dest);
}

void CopySecondaryTilesetToVram(const struct MapLayout *mapLayout)
{
    void *dest = (void*)(BG_VRAM + NUM_TILES_IN_PRIMARY * TILE_SIZE_4BPP);
    CopyTilesetToVram(mapLayout->secondaryTileset, dest);
}

static void LoadPrimaryTilesetPalette(const struct MapLayout *mapLayout)
{
    LoadTilesetPalette(mapLayout->primaryTileset, BG_PLTT_ID(0), NUM_PALS_IN_PRIMARY * PLTT_SIZE_4BPP);
}

void LoadSecondaryTilesetPalette(const struct MapLayout *mapLayout)
{
    LoadTilesetPalette(mapLayout->secondaryTileset, BG_PLTT_ID(NUM_PALS_IN_PRIMARY), (NUM_PALS_TOTAL - NUM_PALS_IN_PRIMARY) * PLTT_SIZE_4BPP);
}

void CopyMapTilesetsToVram(const struct MapLayout *mapLayout)
{
    if (mapLayout)
    {
        CopyPrimaryTilesetToVram(mapLayout);
        CopySecondaryTilesetToVram(mapLayout);
    }
}

void LoadMapTilesetPalettes(const struct MapLayout *mapLayout)
{
    if (mapLayout)
    {
        LoadPrimaryTilesetPalette(mapLayout);
        LoadSecondaryTilesetPalette(mapLayout);
    }
}
