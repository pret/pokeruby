#ifndef GUARD_FIELDMAP_H
#define GUARD_FIELDMAP_H

void not_trainer_hill_battle_pyramid(void);
void sub_8055FC0(void);
u8 MapGridGetZCoordAt();
bool8 MapGridIsImpassableAt(s16, s16);
int MapGridGetMetatileIdAt(int, int);
u32 MapGridGetMetatileBehaviorAt(int x, int y); // return: (u8|u16|int) args: (int|s16|s32)
u8 MapGridGetMetatileLayerTypeAt(/*TODO: arg types*/);
void MapGridSetMetatileIdAt(u32, u32, u16);
void save_serialize_map(void);
int CameraMove(int, int);
void sub_8056C50(u16, u16);
void sav1_camera_get_focus_coords(s16 *x, s16 *y);
void GetCameraCoords(s16*, s16*);
void sub_8056D28(struct MapData *pData);
void sub_8056D38(struct MapData *pData);
void apply_map_tileset2_palette(struct MapData *pData);
void copy_map_tileset1_tileset2_to_vram(/*TODO: arg types*/);
void apply_map_tileset1_tileset2_palette(/*TODO: arg types*/);

#endif // GUARD_FIELDMAP_H
