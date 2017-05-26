#ifndef GUARD_FIELDMAP2_H
#define GUARD_FIELDMAP2_H
#include "field_map_obj.h"

struct MapHeader *mapconnection_get_mapheader(struct MapConnection *connection);
int GetMapBorderIdAt(int x, int y);
extern bool8 IsMetatileDirectionallyImpassable(struct MapObject *mapObject, s16 x, s16 y, u8 direction);
int CanCameraMoveInDirection(int direction);

void not_trainer_hill_battle_pyramid(void);
void sub_8055FC0(void);
void mapheader_copy_mapdata_with_padding(struct MapHeader *mapHeader);
void map_copy_with_padding(u16 *map, u16 width, u16 height);
void sub_80560AC(struct MapHeader *);
void fillSouthConnection(struct MapHeader *, struct MapHeader *, s32);
void fillNorthConnection(struct MapHeader *, struct MapHeader *, s32);
void fillWestConnection(struct MapHeader *, struct MapHeader *, s32);
void fillEastConnection(struct MapHeader *, struct MapHeader *, s32);
u8 MapGridGetZCoordAt();
bool8 MapGridIsImpassableAt(s16, s16);
int MapGridGetMetatileIdAt(int, int);
u32 MapGridGetMetatileBehaviorAt(int x, int y); // return: (u8|u16|int) args: (int|s16|s32)
u8 MapGridGetMetatileLayerTypeAt(/*TODO: arg types*/);
void MapGridSetMetatileIdAt(u32, u32, u16);
u32 GetBehaviorByMetatileId(u16 metatile);
void save_serialize_map(void);
void sub_8056670();
int CameraMove(int, int);
struct MapConnection *sub_8056A64(u8 direction, int x, int y);
bool8 sub_8056ABC(u8 direction, int x, int y, struct MapConnection *connection);
bool8 sub_8056B20(int x, int src_width, int dest_width, int offset);
struct MapConnection *sub_8056BA0(s16 x, s16 y); // fieldmap.c
void sub_8056C50(u16, u16);
void sav1_camera_get_focus_coords(s16 *x, s16 *y);
void GetCameraCoords(s16*, s16*);
void sub_8056D28(struct MapData *pData);
void sub_8056D38(struct MapData *pData);
void apply_map_tileset2_palette(struct MapData *pData);
void copy_map_tileset1_tileset2_to_vram(/*TODO: arg types*/);
void apply_map_tileset1_tileset2_palette(/*TODO: arg types*/);

#endif
