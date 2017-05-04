#ifndef GUARD_ROM4_H
#define GUARD_ROM4_H

#include "sprite.h"

struct UnkPlayerStruct
{
    u8 player_field_0;
    u8 player_field_1;
};

struct LinkPlayerMapObject
{
    u8 active;
    u8 linkPlayerId;
    u8 mapObjId;
    u8 mode;
};

// sub_8052F5C
// flag_var_implications_of_teleport_
void new_game(void);
void sub_8053014(void);
void sub_8053050(void);
// sub_805308C
void ResetGameStats(void);
void IncrementGameStat(u8 index);
u32 GetGameStat(u8 index);
void SetGameStat(u8, u32);
// sub_8053154
// sub_8053198
void update_saveblock1_field_object_coords(u8, s16, s16);
void update_saveblock1_field_object_movement_behavior(u8, u8);
// mapdata_load_assets_to_gpu_and_full_redraw
// get_mapdata_header
// warp_shift
// warp_set
// warp_data_is_not_neg_1
struct MapHeader * const get_mapheader_by_bank_and_number(u16 mapGroup, u16 mapNum);
// warp1_get_mapheader
// set_current_map_header_from_sav1_save_old_name
// sub_805338C
// sub_80533CC
void warp_in(void);
void warp1_set(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void warp1_set_2(s8 mapGroup, s8 mapNum, s8 warpId);
void saved_warp2_set(int unused, s8 mapGroup, s8 mapNum, s8 warpId);
void saved_warp2_set_2(int unused, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void copy_saved_warp2_bank_and_enter_x_to_warp1(u8 unused);
// sub_8053538
void sub_8053570(void);
void sub_8053588(u8);
void sub_80535C4(s16 a1, s16 a2);
void sub_805363C(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
// sub_8053678
void sub_8053690(s8, s8, s8, s8, s8);
// warp1_set_to_warp2
void sub_80536E4(s8, s8, s8, s8, s8);
void sub_8053720(s16, s16);
// sub_8053778
// unref_sub_8053790
void sub_80537CC(u8);
void gpu_sync_bg_hide();
// sub_8053818
// sub_8053850
bool8 sub_80538B0(u16 x, u16 y);
bool8 sub_80538D0(u16 x, u16 y);
// sub_80538F0
// sub_8053994
void player_avatar_init_params_reset(void);
// walkrun_find_lowest_active_bit_in_bitfield
// sub_8053AA8
u8 sub_8053B00(struct UnkPlayerStruct *playerStruct, u16 a2, u8 a3);
u8 sub_8053B60(struct UnkPlayerStruct *playerStruct, u8, u16, u8);
u16 cur_mapdata_block_role_at_screen_center_acc_to_sav1(void);
bool32 IsBikingAllowedByMap(void);
void sub_8053C98(void);
void sub_8053CE4(s32 a1);
u8 sav1_get_flash_used_on_map(void);
void sub_8053D14(u16);
// sub_8053D30
// sub_8053D6C
// sub_8053D9C
// sav1_map_get_music
// warp1_target_get_music
// call_map_music_set_to_zero
void sub_8053E90(void);
void sav1_set_battle_music_maybe(u16);
void sav1_reset_battle_music_maybe(void);
void sub_8053F0C(void);
void sub_8053F84(void);
void sub_8053FB0(u16);
// is_warp1_light_level_8_or_9
// sub_8053FF8
// sub_8054034
// sub_8054044
// sub_8054050
// sub_80540D0
void sub_8054164(void);
u8 get_map_light_level_by_bank_and_number(s8 mapGroup, s8 mapNum);
// get_map_light_level_from_warp
u8 sav1_map_get_light_level(void);
u8 get_map_light_from_warp0(void);
bool8 is_light_level_1_2_3_5_or_6(u8 a1);
bool8 is_light_level_1_2_3_or_6(u8 a1);
u8 is_light_level_8_or_9(u8);
// unref_sub_8054260
u8 sav1_map_get_name();
// sav1_map_get_battletype
// ResetSafariZoneFlag_
bool32 is_c1_link_related_active(void);
// c1_overworld_normal
// c1_overworld
// c2_overworld_basic
// sub_8054398
void c2_overworld(void);
// set_callback1
// sub_80543DC
// sub_80543E8
void CB2_NewGame(void);
void CB2_WhiteOut(void);
void CB2_LoadMap(void);
void CB2_LoadMap2(void);
// sub_8054534
// sub_8054588
void c2_80567AC(void);
void c2_exit_to_overworld_2_switch(void);
void c2_exit_to_overworld_2_local(void);
void c2_exit_to_overworld_2_link(void);
// sub_805465C
void sub_805469C(void);
// sub_80546B8
void c2_exit_to_overworld_1_continue_scripts_restart_music(void);
void sub_80546F0(void);
// sub_805470C
void CB2_ContinueSavedGame(void);
void FieldClearVBlankHBlankCallbacks(void);
void SetFieldVBlankCallback(void);
void VBlankCB_Field(void);
// sub_8054814
bool32 sub_805483C(u8 *);
bool32 sub_805493C(u8 *, u32);
bool32 sub_8054A4C(u8 *);
bool32 sub_8054A9C(u8 *a1);
void do_load_map_stuff_loop(u8 *a1);
void sub_8054BA8(void);
void sub_8054C2C(void);
void sub_8054C54(void);
void sub_8054D4C(u32 a1);
void sub_8054D90(void);
void mli4_mapscripts_and_other(void);
void sub_8054E20(void);
void sub_8054E34(void);
void sub_8054E60(void);
void sub_8054E7C(void);
void sub_8054E98(void);
void sub_8054EC8(void);
void sub_8054F48(void);
void sub_8054F70(void);
// sub_8054F88
// sub_8054FC0
// sub_8054FF8
// sub_8055218
// sub_8055280
// sub_80552B0
u16 sub_805530C(u16);
void sub_8055340(u16 *);
void sub_8055354(void);
u16 sub_8055390(u32);
// sub_80553E0
u16 sub_80553E4(u32);
u16 sub_8055408(u32);
u16 sub_8055438(u32);
// sub_8055468
// sub_805546C
// sub_80554A4
// sub_80554B8
// sub_80554BC
// sub_80554E4
// sub_80554F8
// unref_sub_8055568
// sub_8055574
u16 sub_8055588(void);
// sub_805559C
void sub_80555B0(int linkPlayerId, int a2, struct UnkStruct_8054FF8 *a3);
bool32 sub_8055618(struct UnkStruct_8054FF8 *);
bool32 sub_8055630(struct UnkStruct_8054FF8 *);
u8 *sub_8055648(struct UnkStruct_8054FF8 *);
bool32 sub_8055660(struct UnkStruct_8054FF8 *);
u8 *sub_805568C(struct UnkStruct_8054FF8 *);
u16 sub_8055758(u8 *);
void sub_80557E8(void);
void sub_80557F4(void);
void sub_8055808(u8 *);
void sub_8055824(void);
void sub_8055840(u8 *);
void sub_805585C(void);
bool32 sub_8055870(void);
u32 sub_80558AC(void);
u32 sub_8055910(void);
u32 sub_8055940(void);
// ZeroLinkPlayerMapObject
// strange_npc_table_clear
// ZeroMapObject
void SpawnLinkPlayerMapObject(u8, s16, s16, u8);
void InitLinkPlayerMapObjectPos(struct MapObject *, s16, s16);
// unref_sub_8055A6C
// unref_sub_8055A9C
u8 sub_8055AE8(u8);
void sub_8055B08(u8, u16 *, u16 *);
u8 sub_8055B30(u8);
u8 sub_8055B50(u8);
// unref_sub_8055B74
u8 GetLinkPlayerIdAt(s16, s16);
void sub_8055BFC(u8, u8);
// sub_8055C68
// sub_8055C88
// sub_8055C8C
// sub_8055CAC
// sub_8055CB0
// sub_8055D18
// sub_8055D30
// sub_8055D38
u8 npc_something3(u8, u8);
u8 LinkPlayerDetectCollision(u8, u8, s16, s16);
void CreateLinkPlayerSprite(u8);
void SpriteCB_LinkPlayer(struct Sprite *);

#endif // GUARD_ROM4_H
