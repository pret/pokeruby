#include "global.h"
#include "global.fieldmap.h"
#include "gba/syscall.h"
#include "weather.h"
#include "task.h"
#include "script.h"

void palette_bg_fill_white(void);
void palette_bg_fill_black(void);
void pal_fill_black(void);
void task0A_asap_script_env_2_enable_and_set_ctx_running(u8);

extern u8 get_map_light_from_warp0(void);
extern u8 sav1_map_get_light_level(void);
extern u8 fade_type_for_given_maplight_pair(u8, u8);
extern u16 gPlttBufferFaded[];
extern struct MapHeader * warp1_get_mapheader(void);
extern void sub_8059B88(u8);
extern void sub_8053E90(void);

extern u8 sub_810CDB8(u8, u8);
extern int sub_8080E70(void);

void palette_bg_fill_white (void) {
  u32 source_color = 0x7fff7fff;
  CpuFastSet(&source_color, gPlttBufferFaded, 0x100 | (1 << 24));
}

void palette_bg_fill_black (void) {
  u32 source_color = 0;
  CpuFastSet(&source_color, gPlttBufferFaded, 0x100 | (1 << 24));
}

void pal_fill_for_map_transition (void) {
  u8 map_light = get_map_light_from_warp0();
  switch (fade_type_for_given_maplight_pair(map_light, sav1_map_get_light_level())) {
    case 0:
      fade_screen(0, 0);
      palette_bg_fill_black();
      break;
    case 1:
      fade_screen(2, 0);
      palette_bg_fill_white();
  }
}

void pal_fill_black (void) {
  fade_screen(0, 0);
  palette_bg_fill_black();
}

void fade_8080918 (void) {
  u8 light_level = sav1_map_get_light_level();
  switch (sub_810CDB8(light_level, warp1_get_mapheader() -> mapType)) {
    case 0:
      fade_screen(1, 0);
      break;
    case 1:
      fade_screen(3, 0);
  }
}

void sub_8080958 (u8 arg) {
  sub_8059B88(!arg);
}

void task0A_asap_script_env_2_enable_and_set_ctx_running (u8 taskID) {
  if (sub_8080E70() == 1) {
    DestroyTask(taskID);
    EnableBothScriptContexts();
  }
}

void sub_8080990 (void) {
  ScriptContext2_Enable();
  sub_8053E90();
  pal_fill_black();
  CreateTask(&task0A_asap_script_env_2_enable_and_set_ctx_running, 0x0a);
}

void sub_80809B0 (void) {
  ScriptContext2_Enable();
  pal_fill_black();
  CreateTask(&task0A_asap_script_env_2_enable_and_set_ctx_running, 0x0a);
}
