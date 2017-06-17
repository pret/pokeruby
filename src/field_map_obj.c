#include "global.h"
#include "field_map_obj.h"
#include "field_map_obj_helpers.h"
#include "fieldmap.h"
#include "asm.h"
#include "berry.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "field_effect.h"
#include "field_ground_effect.h"
#include "palette.h"
#include "rom4.h"
#include "rng.h"
#include "sprite.h"
#include "field_camera.h"
#include "metatile_behavior.h"
#include "map_constants.h"
#include "map_object_constants.h"
#include "trainer_see.h"
#include "field_effect_helpers.h"

// rodata

const u8 gUnknown_0830FD14[] = {1, 1, 6, 7, 8, 9, 6, 7, 8, 9, 11, 11, 0, 0, 0, 0};

void ObjectCB_CameraObject(struct Sprite *sprite);
const struct SpriteTemplate gSpriteTemplate_830FD24 = {0, 0xFFFF, &gDummyOamData, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, ObjectCB_CameraObject};

void CameraObject_0(struct Sprite *);
void CameraObject_1(struct Sprite *);
void CameraObject_2(struct Sprite *);
void (*const gCameraObjectFuncs[])(struct Sprite *) =
    {
        CameraObject_0,
        CameraObject_1,
        CameraObject_2,
    };

const u32 gMapObjectPic_BrendanNormal_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/00.4bpp");
const u32 gMapObjectPic_BrendanNormal_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/01.4bpp");
const u32 gMapObjectPic_BrendanNormal_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/02.4bpp");
const u32 gMapObjectPic_BrendanNormal_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/03.4bpp");
const u32 gMapObjectPic_BrendanNormal_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/04.4bpp");
const u32 gMapObjectPic_BrendanNormal_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/05.4bpp");
const u32 gMapObjectPic_BrendanNormal_6[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/06.4bpp");
const u32 gMapObjectPic_BrendanNormal_7[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/07.4bpp");
const u32 gMapObjectPic_BrendanNormal_8[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/08.4bpp");
const u32 gMapObjectPic_BrendanNormal_9[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/09.4bpp");
const u32 gMapObjectPic_BrendanNormal_10[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/10.4bpp");
const u32 gMapObjectPic_BrendanNormal_11[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/11.4bpp");
const u32 gMapObjectPic_BrendanNormal_12[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/12.4bpp");
const u32 gMapObjectPic_BrendanNormal_13[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/13.4bpp");
const u32 gMapObjectPic_BrendanNormal_14[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/14.4bpp");
const u32 gMapObjectPic_BrendanNormal_15[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/15.4bpp");
const u32 gMapObjectPic_BrendanNormal_16[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/16.4bpp");
const u32 gMapObjectPic_BrendanNormal_17[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/normal/17.4bpp");
const u16 gMapObjectPalette8[] = INCBIN_U16("graphics/map_objects/palettes/08.gbapal");
const u16 NullPalette_8310F68[16] = {};
const u16 NullPalette_8310F88[16] = {};
const u16 NullPalette_8310FA8[16] = {};
const u16 NullPalette_8310FC8[16] = {};
const u16 NullPalette_8310FE8[16] = {};
const u16 NullPalette_8311008[16] = {};
const u16 NullPalette_8311028[16] = {};
const u16 NullPalette_8311048[16] = {};
const u16 NullPalette_8311068[16] = {};
const u16 NullPalette_8311088[16] = {};
const u16 NullPalette_83110A8[16] = {};
const u16 NullPalette_83110C8[16] = {};
const u16 NullPalette_83110E8[16] = {};
const u16 NullPalette_8311108[16] = {};
const u16 NullPalette_8311128[16] = {};
const u16 gMapObjectPalette9[] = INCBIN_U16("graphics/map_objects/palettes/09.gbapal");
const u16 gMapObjectPalette10[] = INCBIN_U16("graphics/map_objects/palettes/10.gbapal");
const u32 gMapObjectPic_BrendanFieldMove_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/0.4bpp");
const u32 gMapObjectPic_BrendanFieldMove_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/1.4bpp");
const u32 gMapObjectPic_BrendanFieldMove_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/2.4bpp");
const u32 gMapObjectPic_BrendanFieldMove_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/3.4bpp");
const u32 gMapObjectPic_BrendanFieldMove_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/field_move/4.4bpp");
const u32 gMapObjectPic_BrendanSurfing_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/0.4bpp");
const u32 gMapObjectPic_BrendanSurfing_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/3.4bpp");
const u32 gMapObjectPic_BrendanSurfing_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/1.4bpp");
const u32 gMapObjectPic_BrendanSurfing_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/4.4bpp");
const u32 gMapObjectPic_BrendanSurfing_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/2.4bpp");
const u32 gMapObjectPic_BrendanSurfing_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/surfing/5.4bpp");
const u32 gMapObjectPic_BrendanMachBike_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/0.4bpp");
const u32 gMapObjectPic_BrendanMachBike_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/1.4bpp");
const u32 gMapObjectPic_BrendanMachBike_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/2.4bpp");
const u32 gMapObjectPic_BrendanMachBike_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/3.4bpp");
const u32 gMapObjectPic_BrendanMachBike_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/4.4bpp");
const u32 gMapObjectPic_BrendanMachBike_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/5.4bpp");
const u32 gMapObjectPic_BrendanMachBike_6[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/6.4bpp");
const u32 gMapObjectPic_BrendanMachBike_7[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/7.4bpp");
const u32 gMapObjectPic_BrendanMachBike_8[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/mach_bike/8.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/00.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/01.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/02.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/03.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/04.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/05.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_6[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/06.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_7[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/07.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_8[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/08.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_9[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/09.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_10[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/10.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_11[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/11.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_12[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/12.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_13[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/13.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_14[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/14.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_15[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/15.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_16[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/16.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_17[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/17.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_18[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/18.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_19[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/19.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_20[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/20.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_21[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/21.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_22[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/22.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_23[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/23.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_24[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/24.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_25[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/25.4bpp");
const u32 gMapObjectPic_BrendanAcroBike_26[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/acro_bike/26.4bpp");
const u32 gMapObjectPic_BrendanFishing_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/00.4bpp");
const u32 gMapObjectPic_BrendanFishing_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/01.4bpp");
const u32 gMapObjectPic_BrendanFishing_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/02.4bpp");
const u32 gMapObjectPic_BrendanFishing_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/03.4bpp");
const u32 gMapObjectPic_BrendanFishing_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/04.4bpp");
const u32 gMapObjectPic_BrendanFishing_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/05.4bpp");
const u32 gMapObjectPic_BrendanFishing_6[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/06.4bpp");
const u32 gMapObjectPic_BrendanFishing_7[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/07.4bpp");
const u32 gMapObjectPic_BrendanFishing_8[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/08.4bpp");
const u32 gMapObjectPic_BrendanFishing_9[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/09.4bpp");
const u32 gMapObjectPic_BrendanFishing_10[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/10.4bpp");
const u32 gMapObjectPic_BrendanFishing_11[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/fishing/11.4bpp");
const u32 gMapObjectPic_BrendanWatering_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/0.4bpp");
const u32 gMapObjectPic_BrendanWatering_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/3.4bpp");
const u32 gMapObjectPic_BrendanWatering_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/1.4bpp");
const u32 gMapObjectPic_BrendanWatering_4[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/4.4bpp");
const u32 gMapObjectPic_BrendanWatering_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/2.4bpp");
const u32 gMapObjectPic_BrendanWatering_5[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/watering/5.4bpp");
const u32 gMapObjectPic_BrendanDecorating[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/decorating.4bpp");
const u32 gMapObjectPic_MayDecorating[] = INCBIN_U32("graphics/map_objects/pics/people/may/decorating.4bpp");
const u32 gMapObjectPic_BrendanUnderwater_0[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/underwater/0.4bpp");
const u32 gMapObjectPic_BrendanUnderwater_1[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/underwater/1.4bpp");
const u32 gMapObjectPic_BrendanUnderwater_2[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/underwater/2.4bpp");
const u32 gMapObjectPic_BrendanUnderwater_3[] = INCBIN_U32("graphics/map_objects/pics/people/brendan/underwater/3.4bpp");
const u32 gMapObjectPic_MayUnderwater_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/underwater/0.4bpp");
const u32 gMapObjectPic_MayUnderwater_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/underwater/1.4bpp");
const u32 gMapObjectPic_MayUnderwater_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/underwater/2.4bpp");
const u32 gMapObjectPic_MayUnderwater_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/underwater/3.4bpp");
const u16 gMapObjectPalette11[] = INCBIN_U16("graphics/map_objects/palettes/11.gbapal");
const u32 gMapObjectPic_MayNormal_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/00.4bpp");
const u32 gMapObjectPic_MayNormal_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/01.4bpp");
const u32 gMapObjectPic_MayNormal_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/02.4bpp");
const u32 gMapObjectPic_MayNormal_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/03.4bpp");
const u32 gMapObjectPic_MayNormal_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/04.4bpp");
const u32 gMapObjectPic_MayNormal_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/05.4bpp");
const u32 gMapObjectPic_MayNormal_6[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/06.4bpp");
const u32 gMapObjectPic_MayNormal_7[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/07.4bpp");
const u32 gMapObjectPic_MayNormal_8[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/08.4bpp");
const u32 gMapObjectPic_MayNormal_9[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/09.4bpp");
const u32 gMapObjectPic_MayNormal_10[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/10.4bpp");
const u32 gMapObjectPic_MayNormal_11[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/11.4bpp");
const u32 gMapObjectPic_MayNormal_12[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/12.4bpp");
const u32 gMapObjectPic_MayNormal_13[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/13.4bpp");
const u32 gMapObjectPic_MayNormal_14[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/14.4bpp");
const u32 gMapObjectPic_MayNormal_15[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/15.4bpp");
const u32 gMapObjectPic_MayNormal_16[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/16.4bpp");
const u32 gMapObjectPic_MayNormal_17[] = INCBIN_U32("graphics/map_objects/pics/people/may/normal/17.4bpp");
const u16 gMapObjectPalette17[] = INCBIN_U16("graphics/map_objects/palettes/17.gbapal");
const u16 gMapObjectPalette18[] = INCBIN_U16("graphics/map_objects/palettes/18.gbapal");
const u16 NullPalette_831B7E8[16] = {};
const u16 NullPalette_831B808[16] = {};
const u16 NullPalette_831B828[16] = {};
const u16 NullPalette_831B848[16] = {};
const u16 NullPalette_831B868[16] = {};
const u16 NullPalette_831B888[16] = {};
const u16 NullPalette_831B8A8[16] = {};
const u16 NullPalette_831B8C8[16] = {};
const u16 NullPalette_831B8E8[16] = {};
const u16 NullPalette_831B908[16] = {};
const u16 NullPalette_831B928[16] = {};
const u16 NullPalette_831B948[16] = {};
const u16 NullPalette_831B968[16] = {};
const u16 NullPalette_831B988[16] = {};
const u32 gMapObjectPic_MayMachBike_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/0.4bpp");
const u32 gMapObjectPic_MayMachBike_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/1.4bpp");
const u32 gMapObjectPic_MayMachBike_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/2.4bpp");
const u32 gMapObjectPic_MayMachBike_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/3.4bpp");
const u32 gMapObjectPic_MayMachBike_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/4.4bpp");
const u32 gMapObjectPic_MayMachBike_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/5.4bpp");
const u32 gMapObjectPic_MayMachBike_6[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/6.4bpp");
const u32 gMapObjectPic_MayMachBike_7[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/7.4bpp");
const u32 gMapObjectPic_MayMachBike_8[] = INCBIN_U32("graphics/map_objects/pics/people/may/mach_bike/8.4bpp");
const u32 gMapObjectPic_MayAcroBike_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/00.4bpp");
const u32 gMapObjectPic_MayAcroBike_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/01.4bpp");
const u32 gMapObjectPic_MayAcroBike_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/02.4bpp");
const u32 gMapObjectPic_MayAcroBike_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/03.4bpp");
const u32 gMapObjectPic_MayAcroBike_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/04.4bpp");
const u32 gMapObjectPic_MayAcroBike_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/05.4bpp");
const u32 gMapObjectPic_MayAcroBike_6[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/06.4bpp");
const u32 gMapObjectPic_MayAcroBike_7[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/07.4bpp");
const u32 gMapObjectPic_MayAcroBike_8[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/08.4bpp");
const u32 gMapObjectPic_MayAcroBike_9[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/09.4bpp");
const u32 gMapObjectPic_MayAcroBike_10[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/10.4bpp");
const u32 gMapObjectPic_MayAcroBike_11[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/11.4bpp");
const u32 gMapObjectPic_MayAcroBike_12[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/12.4bpp");
const u32 gMapObjectPic_MayAcroBike_13[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/13.4bpp");
const u32 gMapObjectPic_MayAcroBike_14[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/14.4bpp");
const u32 gMapObjectPic_MayAcroBike_15[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/15.4bpp");
const u32 gMapObjectPic_MayAcroBike_16[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/16.4bpp");
const u32 gMapObjectPic_MayAcroBike_17[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/17.4bpp");
const u32 gMapObjectPic_MayAcroBike_18[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/18.4bpp");
const u32 gMapObjectPic_MayAcroBike_19[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/19.4bpp");
const u32 gMapObjectPic_MayAcroBike_20[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/20.4bpp");
const u32 gMapObjectPic_MayAcroBike_21[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/21.4bpp");
const u32 gMapObjectPic_MayAcroBike_22[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/22.4bpp");
const u32 gMapObjectPic_MayAcroBike_23[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/23.4bpp");
const u32 gMapObjectPic_MayAcroBike_24[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/24.4bpp");
const u32 gMapObjectPic_MayAcroBike_25[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/25.4bpp");
const u32 gMapObjectPic_MayAcroBike_26[] = INCBIN_U32("graphics/map_objects/pics/people/may/acro_bike/26.4bpp");
const u32 gMapObjectPic_MaySurfing_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/0.4bpp");
const u32 gMapObjectPic_MaySurfing_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/3.4bpp");
const u32 gMapObjectPic_MaySurfing_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/1.4bpp");
const u32 gMapObjectPic_MaySurfing_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/4.4bpp");
const u32 gMapObjectPic_MaySurfing_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/2.4bpp");
const u32 gMapObjectPic_MaySurfing_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/surfing/5.4bpp");
const u32 gMapObjectPic_MayFieldMove_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/0.4bpp");
const u32 gMapObjectPic_MayFieldMove_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/1.4bpp");
const u32 gMapObjectPic_MayFieldMove_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/2.4bpp");
const u32 gMapObjectPic_MayFieldMove_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/3.4bpp");
const u32 gMapObjectPic_MayFieldMove_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/field_move/4.4bpp");
const u32 gMapObjectPic_MayFishing_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/00.4bpp");
const u32 gMapObjectPic_MayFishing_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/01.4bpp");
const u32 gMapObjectPic_MayFishing_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/02.4bpp");
const u32 gMapObjectPic_MayFishing_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/03.4bpp");
const u32 gMapObjectPic_MayFishing_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/04.4bpp");
const u32 gMapObjectPic_MayFishing_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/05.4bpp");
const u32 gMapObjectPic_MayFishing_6[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/06.4bpp");
const u32 gMapObjectPic_MayFishing_7[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/07.4bpp");
const u32 gMapObjectPic_MayFishing_8[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/08.4bpp");
const u32 gMapObjectPic_MayFishing_9[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/09.4bpp");
const u32 gMapObjectPic_MayFishing_10[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/10.4bpp");
const u32 gMapObjectPic_MayFishing_11[] = INCBIN_U32("graphics/map_objects/pics/people/may/fishing/11.4bpp");
const u32 gMapObjectPic_MayWatering_0[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/0.4bpp");
const u32 gMapObjectPic_MayWatering_3[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/3.4bpp");
const u32 gMapObjectPic_MayWatering_1[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/1.4bpp");
const u32 gMapObjectPic_MayWatering_4[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/4.4bpp");
const u32 gMapObjectPic_MayWatering_2[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/2.4bpp");
const u32 gMapObjectPic_MayWatering_5[] = INCBIN_U32("graphics/map_objects/pics/people/may/watering/5.4bpp");
const u16 gMapObjectPalette0[] = INCBIN_U16("graphics/map_objects/palettes/00.gbapal");
const u16 gMapObjectPalette1[] = INCBIN_U16("graphics/map_objects/palettes/01.gbapal");
const u16 gMapObjectPalette2[] = INCBIN_U16("graphics/map_objects/palettes/02.gbapal");
const u16 gMapObjectPalette3[] = INCBIN_U16("graphics/map_objects/palettes/03.gbapal");
const u16 gMapObjectPalette4[] = INCBIN_U16("graphics/map_objects/palettes/04.gbapal");
const u16 gMapObjectPalette5[] = INCBIN_U16("graphics/map_objects/palettes/05.gbapal");
const u16 gMapObjectPalette6[] = INCBIN_U16("graphics/map_objects/palettes/06.gbapal");
const u16 gMapObjectPalette7[] = INCBIN_U16("graphics/map_objects/palettes/07.gbapal");
const u32 gMapObjectPic_LittleBoy1_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/0.4bpp");
const u32 gMapObjectPic_LittleBoy1_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/1.4bpp");
const u32 gMapObjectPic_LittleBoy1_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/2.4bpp");
const u32 gMapObjectPic_LittleBoy1_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/3.4bpp");
const u32 gMapObjectPic_LittleBoy1_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/4.4bpp");
const u32 gMapObjectPic_LittleBoy1_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/5.4bpp");
const u32 gMapObjectPic_LittleBoy1_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/6.4bpp");
const u32 gMapObjectPic_LittleBoy1_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/7.4bpp");
const u32 gMapObjectPic_LittleBoy1_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_1/8.4bpp");
const u32 gMapObjectPic_LittleGirl1_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/0.4bpp");
const u32 gMapObjectPic_LittleGirl1_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/1.4bpp");
const u32 gMapObjectPic_LittleGirl1_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/2.4bpp");
const u32 gMapObjectPic_LittleGirl1_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/3.4bpp");
const u32 gMapObjectPic_LittleGirl1_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/4.4bpp");
const u32 gMapObjectPic_LittleGirl1_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/5.4bpp");
const u32 gMapObjectPic_LittleGirl1_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/6.4bpp");
const u32 gMapObjectPic_LittleGirl1_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/7.4bpp");
const u32 gMapObjectPic_LittleGirl1_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_1/8.4bpp");
const u32 gMapObjectPic_Boy1_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/0.4bpp");
const u32 gMapObjectPic_Boy1_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/1.4bpp");
const u32 gMapObjectPic_Boy1_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/2.4bpp");
const u32 gMapObjectPic_Boy1_3[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/3.4bpp");
const u32 gMapObjectPic_Boy1_4[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/4.4bpp");
const u32 gMapObjectPic_Boy1_5[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/5.4bpp");
const u32 gMapObjectPic_Boy1_6[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/6.4bpp");
const u32 gMapObjectPic_Boy1_7[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/7.4bpp");
const u32 gMapObjectPic_Boy1_8[] = INCBIN_U32("graphics/map_objects/pics/people/boy_1/8.4bpp");
const u32 gMapObjectPic_Girl1_0[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/0.4bpp");
const u32 gMapObjectPic_Girl1_1[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/1.4bpp");
const u32 gMapObjectPic_Girl1_2[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/2.4bpp");
const u32 gMapObjectPic_Girl1_3[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/3.4bpp");
const u32 gMapObjectPic_Girl1_4[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/4.4bpp");
const u32 gMapObjectPic_Girl1_5[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/5.4bpp");
const u32 gMapObjectPic_Girl1_6[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/6.4bpp");
const u32 gMapObjectPic_Girl1_7[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/7.4bpp");
const u32 gMapObjectPic_Girl1_8[] = INCBIN_U32("graphics/map_objects/pics/people/girl_1/8.4bpp");
const u32 gMapObjectPic_Boy2_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/0.4bpp");
const u32 gMapObjectPic_Boy2_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/1.4bpp");
const u32 gMapObjectPic_Boy2_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/2.4bpp");
const u32 gMapObjectPic_Boy2_3[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/3.4bpp");
const u32 gMapObjectPic_Boy2_4[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/4.4bpp");
const u32 gMapObjectPic_Boy2_5[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/5.4bpp");
const u32 gMapObjectPic_Boy2_6[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/6.4bpp");
const u32 gMapObjectPic_Boy2_7[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/7.4bpp");
const u32 gMapObjectPic_Boy2_8[] = INCBIN_U32("graphics/map_objects/pics/people/boy_2/8.4bpp");
const u32 gMapObjectPic_Girl2_0[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/0.4bpp");
const u32 gMapObjectPic_Girl2_1[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/1.4bpp");
const u32 gMapObjectPic_Girl2_2[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/2.4bpp");
const u32 gMapObjectPic_Girl2_3[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/3.4bpp");
const u32 gMapObjectPic_Girl2_4[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/4.4bpp");
const u32 gMapObjectPic_Girl2_5[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/5.4bpp");
const u32 gMapObjectPic_Girl2_6[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/6.4bpp");
const u32 gMapObjectPic_Girl2_7[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/7.4bpp");
const u32 gMapObjectPic_Girl2_8[] = INCBIN_U32("graphics/map_objects/pics/people/girl_2/8.4bpp");
const u32 gMapObjectPic_LittleBoy2_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/0.4bpp");
const u32 gMapObjectPic_LittleBoy2_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/1.4bpp");
const u32 gMapObjectPic_LittleBoy2_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/2.4bpp");
const u32 gMapObjectPic_LittleBoy2_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/3.4bpp");
const u32 gMapObjectPic_LittleBoy2_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/4.4bpp");
const u32 gMapObjectPic_LittleBoy2_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/5.4bpp");
const u32 gMapObjectPic_LittleBoy2_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/6.4bpp");
const u32 gMapObjectPic_LittleBoy2_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/7.4bpp");
const u32 gMapObjectPic_LittleBoy2_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_2/8.4bpp");
const u32 gMapObjectPic_LittleGirl2_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/0.4bpp");
const u32 gMapObjectPic_LittleGirl2_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/1.4bpp");
const u32 gMapObjectPic_LittleGirl2_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/2.4bpp");
const u32 gMapObjectPic_LittleGirl2_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/3.4bpp");
const u32 gMapObjectPic_LittleGirl2_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/4.4bpp");
const u32 gMapObjectPic_LittleGirl2_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/5.4bpp");
const u32 gMapObjectPic_LittleGirl2_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/6.4bpp");
const u32 gMapObjectPic_LittleGirl2_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/7.4bpp");
const u32 gMapObjectPic_LittleGirl2_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_girl_2/8.4bpp");
const u32 gMapObjectPic_Boy3_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/0.4bpp");
const u32 gMapObjectPic_Boy3_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/1.4bpp");
const u32 gMapObjectPic_Boy3_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/2.4bpp");
const u32 gMapObjectPic_Boy3_3[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/3.4bpp");
const u32 gMapObjectPic_Boy3_4[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/4.4bpp");
const u32 gMapObjectPic_Boy3_5[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/5.4bpp");
const u32 gMapObjectPic_Boy3_6[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/6.4bpp");
const u32 gMapObjectPic_Boy3_7[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/7.4bpp");
const u32 gMapObjectPic_Boy3_8[] = INCBIN_U32("graphics/map_objects/pics/people/boy_3/8.4bpp");
const u32 gMapObjectPic_Girl3_0[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/0.4bpp");
const u32 gMapObjectPic_Girl3_1[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/1.4bpp");
const u32 gMapObjectPic_Girl3_2[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/2.4bpp");
const u32 gMapObjectPic_Girl3_3[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/3.4bpp");
const u32 gMapObjectPic_Girl3_4[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/4.4bpp");
const u32 gMapObjectPic_Girl3_5[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/5.4bpp");
const u32 gMapObjectPic_Girl3_6[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/6.4bpp");
const u32 gMapObjectPic_Girl3_7[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/7.4bpp");
const u32 gMapObjectPic_Girl3_8[] = INCBIN_U32("graphics/map_objects/pics/people/girl_3/8.4bpp");
const u32 gMapObjectPic_Boy4_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/0.4bpp");
const u32 gMapObjectPic_Boy4_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/1.4bpp");
const u32 gMapObjectPic_Boy4_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/2.4bpp");
const u32 gMapObjectPic_Boy4_3[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/3.4bpp");
const u32 gMapObjectPic_Boy4_4[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/4.4bpp");
const u32 gMapObjectPic_Boy4_5[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/5.4bpp");
const u32 gMapObjectPic_Boy4_6[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/6.4bpp");
const u32 gMapObjectPic_Boy4_7[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/7.4bpp");
const u32 gMapObjectPic_Boy4_8[] = INCBIN_U32("graphics/map_objects/pics/people/boy_4/8.4bpp");
const u32 gMapObjectPic_Woman1_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/0.4bpp");
const u32 gMapObjectPic_Woman1_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/1.4bpp");
const u32 gMapObjectPic_Woman1_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/2.4bpp");
const u32 gMapObjectPic_Woman1_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/3.4bpp");
const u32 gMapObjectPic_Woman1_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/4.4bpp");
const u32 gMapObjectPic_Woman1_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/5.4bpp");
const u32 gMapObjectPic_Woman1_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/6.4bpp");
const u32 gMapObjectPic_Woman1_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/7.4bpp");
const u32 gMapObjectPic_Woman1_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_1/8.4bpp");
const u32 gMapObjectPic_FatMan_0[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/0.4bpp");
const u32 gMapObjectPic_FatMan_1[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/1.4bpp");
const u32 gMapObjectPic_FatMan_2[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/2.4bpp");
const u32 gMapObjectPic_FatMan_3[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/3.4bpp");
const u32 gMapObjectPic_FatMan_4[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/4.4bpp");
const u32 gMapObjectPic_FatMan_5[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/5.4bpp");
const u32 gMapObjectPic_FatMan_6[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/6.4bpp");
const u32 gMapObjectPic_FatMan_7[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/7.4bpp");
const u32 gMapObjectPic_FatMan_8[] = INCBIN_U32("graphics/map_objects/pics/people/fat_man/8.4bpp");
const u32 gMapObjectPic_Woman2_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/0.4bpp");
const u32 gMapObjectPic_Woman2_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/1.4bpp");
const u32 gMapObjectPic_Woman2_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/2.4bpp");
const u32 gMapObjectPic_Woman2_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/3.4bpp");
const u32 gMapObjectPic_Woman2_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/4.4bpp");
const u32 gMapObjectPic_Woman2_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/5.4bpp");
const u32 gMapObjectPic_Woman2_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/6.4bpp");
const u32 gMapObjectPic_Woman2_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/7.4bpp");
const u32 gMapObjectPic_Woman2_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_2/8.4bpp");
const u32 gMapObjectPic_Man1_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/0.4bpp");
const u32 gMapObjectPic_Man1_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/1.4bpp");
const u32 gMapObjectPic_Man1_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/2.4bpp");
const u32 gMapObjectPic_Man1_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/3.4bpp");
const u32 gMapObjectPic_Man1_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/4.4bpp");
const u32 gMapObjectPic_Man1_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/5.4bpp");
const u32 gMapObjectPic_Man1_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/6.4bpp");
const u32 gMapObjectPic_Man1_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/7.4bpp");
const u32 gMapObjectPic_Man1_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_1/8.4bpp");
const u32 gMapObjectPic_Woman3_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/0.4bpp");
const u32 gMapObjectPic_Woman3_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/1.4bpp");
const u32 gMapObjectPic_Woman3_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/2.4bpp");
const u32 gMapObjectPic_Woman3_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/3.4bpp");
const u32 gMapObjectPic_Woman3_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/4.4bpp");
const u32 gMapObjectPic_Woman3_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/5.4bpp");
const u32 gMapObjectPic_Woman3_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/6.4bpp");
const u32 gMapObjectPic_Woman3_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/7.4bpp");
const u32 gMapObjectPic_Woman3_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_3/8.4bpp");
const u32 gMapObjectPic_OldMan1_0[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/0.4bpp");
const u32 gMapObjectPic_OldMan1_1[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/1.4bpp");
const u32 gMapObjectPic_OldMan1_2[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/2.4bpp");
const u32 gMapObjectPic_OldMan1_3[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/3.4bpp");
const u32 gMapObjectPic_OldMan1_4[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/4.4bpp");
const u32 gMapObjectPic_OldMan1_5[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/5.4bpp");
const u32 gMapObjectPic_OldMan1_6[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/6.4bpp");
const u32 gMapObjectPic_OldMan1_7[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/7.4bpp");
const u32 gMapObjectPic_OldMan1_8[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_1/8.4bpp");
const u32 gMapObjectPic_OldWoman1_0[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/0.4bpp");
const u32 gMapObjectPic_OldWoman1_1[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/1.4bpp");
const u32 gMapObjectPic_OldWoman1_2[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/2.4bpp");
const u32 gMapObjectPic_OldWoman1_3[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/3.4bpp");
const u32 gMapObjectPic_OldWoman1_4[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/4.4bpp");
const u32 gMapObjectPic_OldWoman1_5[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/5.4bpp");
const u32 gMapObjectPic_OldWoman1_6[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/6.4bpp");
const u32 gMapObjectPic_OldWoman1_7[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/7.4bpp");
const u32 gMapObjectPic_OldWoman1_8[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_1/8.4bpp");
const u32 gMapObjectPic_Man2_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/0.4bpp");
const u32 gMapObjectPic_Man2_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/1.4bpp");
const u32 gMapObjectPic_Man2_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/2.4bpp");
const u32 gMapObjectPic_Man2_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/3.4bpp");
const u32 gMapObjectPic_Man2_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/4.4bpp");
const u32 gMapObjectPic_Man2_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/5.4bpp");
const u32 gMapObjectPic_Man2_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/6.4bpp");
const u32 gMapObjectPic_Man2_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/7.4bpp");
const u32 gMapObjectPic_Man2_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_2/8.4bpp");
const u32 gMapObjectPic_Woman4_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/0.4bpp");
const u32 gMapObjectPic_Woman4_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/1.4bpp");
const u32 gMapObjectPic_Woman4_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/2.4bpp");
const u32 gMapObjectPic_Woman4_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/3.4bpp");
const u32 gMapObjectPic_Woman4_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/4.4bpp");
const u32 gMapObjectPic_Woman4_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/5.4bpp");
const u32 gMapObjectPic_Woman4_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/6.4bpp");
const u32 gMapObjectPic_Woman4_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/7.4bpp");
const u32 gMapObjectPic_Woman4_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_4/8.4bpp");
const u32 gMapObjectPic_Man3_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/0.4bpp");
const u32 gMapObjectPic_Man3_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/1.4bpp");
const u32 gMapObjectPic_Man3_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/2.4bpp");
const u32 gMapObjectPic_Man3_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/3.4bpp");
const u32 gMapObjectPic_Man3_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/4.4bpp");
const u32 gMapObjectPic_Man3_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/5.4bpp");
const u32 gMapObjectPic_Man3_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/6.4bpp");
const u32 gMapObjectPic_Man3_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/7.4bpp");
const u32 gMapObjectPic_Man3_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_3/8.4bpp");
const u32 gMapObjectPic_Woman5_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/0.4bpp");
const u32 gMapObjectPic_Woman5_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/1.4bpp");
const u32 gMapObjectPic_Woman5_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/2.4bpp");
const u32 gMapObjectPic_Woman5_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/3.4bpp");
const u32 gMapObjectPic_Woman5_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/4.4bpp");
const u32 gMapObjectPic_Woman5_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/5.4bpp");
const u32 gMapObjectPic_Woman5_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/6.4bpp");
const u32 gMapObjectPic_Woman5_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/7.4bpp");
const u32 gMapObjectPic_Woman5_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_5/8.4bpp");
const u32 gMapObjectPic_Cook_0[] = INCBIN_U32("graphics/map_objects/pics/people/cook/0.4bpp");
const u32 gMapObjectPic_Cook_1[] = INCBIN_U32("graphics/map_objects/pics/people/cook/1.4bpp");
const u32 gMapObjectPic_Cook_2[] = INCBIN_U32("graphics/map_objects/pics/people/cook/2.4bpp");
const u32 gMapObjectPic_Woman6_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/0.4bpp");
const u32 gMapObjectPic_Woman6_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/1.4bpp");
const u32 gMapObjectPic_Woman6_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/2.4bpp");
const u32 gMapObjectPic_Woman6_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/3.4bpp");
const u32 gMapObjectPic_Woman6_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/4.4bpp");
const u32 gMapObjectPic_Woman6_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/5.4bpp");
const u32 gMapObjectPic_Woman6_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/6.4bpp");
const u32 gMapObjectPic_Woman6_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/7.4bpp");
const u32 gMapObjectPic_Woman6_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_6/8.4bpp");
const u32 gMapObjectPic_OldMan2_0[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_2/0.4bpp");
const u32 gMapObjectPic_OldMan2_1[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_2/1.4bpp");
const u32 gMapObjectPic_OldMan2_2[] = INCBIN_U32("graphics/map_objects/pics/people/old_man_2/2.4bpp");
const u32 gMapObjectPic_OldWoman2_0[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_2/0.4bpp");
const u32 gMapObjectPic_OldWoman2_1[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_2/1.4bpp");
const u32 gMapObjectPic_OldWoman2_2[] = INCBIN_U32("graphics/map_objects/pics/people/old_woman_2/2.4bpp");
const u32 gMapObjectPic_Camper_0[] = INCBIN_U32("graphics/map_objects/pics/people/camper/0.4bpp");
const u32 gMapObjectPic_Camper_1[] = INCBIN_U32("graphics/map_objects/pics/people/camper/1.4bpp");
const u32 gMapObjectPic_Camper_2[] = INCBIN_U32("graphics/map_objects/pics/people/camper/2.4bpp");
const u32 gMapObjectPic_Camper_3[] = INCBIN_U32("graphics/map_objects/pics/people/camper/3.4bpp");
const u32 gMapObjectPic_Camper_4[] = INCBIN_U32("graphics/map_objects/pics/people/camper/4.4bpp");
const u32 gMapObjectPic_Camper_5[] = INCBIN_U32("graphics/map_objects/pics/people/camper/5.4bpp");
const u32 gMapObjectPic_Camper_6[] = INCBIN_U32("graphics/map_objects/pics/people/camper/6.4bpp");
const u32 gMapObjectPic_Camper_7[] = INCBIN_U32("graphics/map_objects/pics/people/camper/7.4bpp");
const u32 gMapObjectPic_Camper_8[] = INCBIN_U32("graphics/map_objects/pics/people/camper/8.4bpp");
const u32 gMapObjectPic_Picnicker_0[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/0.4bpp");
const u32 gMapObjectPic_Picnicker_1[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/1.4bpp");
const u32 gMapObjectPic_Picnicker_2[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/2.4bpp");
const u32 gMapObjectPic_Picnicker_3[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/3.4bpp");
const u32 gMapObjectPic_Picnicker_4[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/4.4bpp");
const u32 gMapObjectPic_Picnicker_5[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/5.4bpp");
const u32 gMapObjectPic_Picnicker_6[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/6.4bpp");
const u32 gMapObjectPic_Picnicker_7[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/7.4bpp");
const u32 gMapObjectPic_Picnicker_8[] = INCBIN_U32("graphics/map_objects/pics/people/picnicker/8.4bpp");
const u32 gMapObjectPic_Man4_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/0.4bpp");
const u32 gMapObjectPic_Man4_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/1.4bpp");
const u32 gMapObjectPic_Man4_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/2.4bpp");
const u32 gMapObjectPic_Man4_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/3.4bpp");
const u32 gMapObjectPic_Man4_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/4.4bpp");
const u32 gMapObjectPic_Man4_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/5.4bpp");
const u32 gMapObjectPic_Man4_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/6.4bpp");
const u32 gMapObjectPic_Man4_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/7.4bpp");
const u32 gMapObjectPic_Man4_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_4/8.4bpp");
const u32 gMapObjectPic_Woman7_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/0.4bpp");
const u32 gMapObjectPic_Woman7_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/1.4bpp");
const u32 gMapObjectPic_Woman7_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/2.4bpp");
const u32 gMapObjectPic_Woman7_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/3.4bpp");
const u32 gMapObjectPic_Woman7_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/4.4bpp");
const u32 gMapObjectPic_Woman7_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/5.4bpp");
const u32 gMapObjectPic_Woman7_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/6.4bpp");
const u32 gMapObjectPic_Woman7_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/7.4bpp");
const u32 gMapObjectPic_Woman7_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_7/8.4bpp");
const u32 gMapObjectPic_Youngster_0[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/0.4bpp");
const u32 gMapObjectPic_Youngster_1[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/1.4bpp");
const u32 gMapObjectPic_Youngster_2[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/2.4bpp");
const u32 gMapObjectPic_Youngster_3[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/3.4bpp");
const u32 gMapObjectPic_Youngster_4[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/4.4bpp");
const u32 gMapObjectPic_Youngster_5[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/5.4bpp");
const u32 gMapObjectPic_Youngster_6[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/6.4bpp");
const u32 gMapObjectPic_Youngster_7[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/7.4bpp");
const u32 gMapObjectPic_Youngster_8[] = INCBIN_U32("graphics/map_objects/pics/people/youngster/8.4bpp");
const u32 gMapObjectPic_BugCatcher_0[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/0.4bpp");
const u32 gMapObjectPic_BugCatcher_1[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/1.4bpp");
const u32 gMapObjectPic_BugCatcher_2[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/2.4bpp");
const u32 gMapObjectPic_BugCatcher_3[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/3.4bpp");
const u32 gMapObjectPic_BugCatcher_4[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/4.4bpp");
const u32 gMapObjectPic_BugCatcher_5[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/5.4bpp");
const u32 gMapObjectPic_BugCatcher_6[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/6.4bpp");
const u32 gMapObjectPic_BugCatcher_7[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/7.4bpp");
const u32 gMapObjectPic_BugCatcher_8[] = INCBIN_U32("graphics/map_objects/pics/people/bug_catcher/8.4bpp");
const u32 gMapObjectPic_PsychicM_0[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/0.4bpp");
const u32 gMapObjectPic_PsychicM_1[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/1.4bpp");
const u32 gMapObjectPic_PsychicM_2[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/2.4bpp");
const u32 gMapObjectPic_PsychicM_3[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/3.4bpp");
const u32 gMapObjectPic_PsychicM_4[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/4.4bpp");
const u32 gMapObjectPic_PsychicM_5[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/5.4bpp");
const u32 gMapObjectPic_PsychicM_6[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/6.4bpp");
const u32 gMapObjectPic_PsychicM_7[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/7.4bpp");
const u32 gMapObjectPic_PsychicM_8[] = INCBIN_U32("graphics/map_objects/pics/people/psychic_m/8.4bpp");
const u32 gMapObjectPic_SchoolKidM_0[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/0.4bpp");
const u32 gMapObjectPic_SchoolKidM_1[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/1.4bpp");
const u32 gMapObjectPic_SchoolKidM_2[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/2.4bpp");
const u32 gMapObjectPic_SchoolKidM_3[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/3.4bpp");
const u32 gMapObjectPic_SchoolKidM_4[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/4.4bpp");
const u32 gMapObjectPic_SchoolKidM_5[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/5.4bpp");
const u32 gMapObjectPic_SchoolKidM_6[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/6.4bpp");
const u32 gMapObjectPic_SchoolKidM_7[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/7.4bpp");
const u32 gMapObjectPic_SchoolKidM_8[] = INCBIN_U32("graphics/map_objects/pics/people/school_kid_m/8.4bpp");
const u32 gMapObjectPic_Maniac_0[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/0.4bpp");
const u32 gMapObjectPic_Maniac_1[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/1.4bpp");
const u32 gMapObjectPic_Maniac_2[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/2.4bpp");
const u32 gMapObjectPic_Maniac_3[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/3.4bpp");
const u32 gMapObjectPic_Maniac_4[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/4.4bpp");
const u32 gMapObjectPic_Maniac_5[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/5.4bpp");
const u32 gMapObjectPic_Maniac_6[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/6.4bpp");
const u32 gMapObjectPic_Maniac_7[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/7.4bpp");
const u32 gMapObjectPic_Maniac_8[] = INCBIN_U32("graphics/map_objects/pics/people/maniac/8.4bpp");
const u32 gMapObjectPic_HexManiac_0[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/0.4bpp");
const u32 gMapObjectPic_HexManiac_1[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/1.4bpp");
const u32 gMapObjectPic_HexManiac_2[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/2.4bpp");
const u32 gMapObjectPic_HexManiac_3[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/3.4bpp");
const u32 gMapObjectPic_HexManiac_4[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/4.4bpp");
const u32 gMapObjectPic_HexManiac_5[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/5.4bpp");
const u32 gMapObjectPic_HexManiac_6[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/6.4bpp");
const u32 gMapObjectPic_HexManiac_7[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/7.4bpp");
const u32 gMapObjectPic_HexManiac_8[] = INCBIN_U32("graphics/map_objects/pics/people/hex_maniac/8.4bpp");
const u32 gMapObjectPic_Woman8_0[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/0.4bpp");
const u32 gMapObjectPic_Woman8_1[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/1.4bpp");
const u32 gMapObjectPic_Woman8_2[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/2.4bpp");
const u32 gMapObjectPic_Woman8_3[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/3.4bpp");
const u32 gMapObjectPic_Woman8_4[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/4.4bpp");
const u32 gMapObjectPic_Woman8_5[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/5.4bpp");
const u32 gMapObjectPic_Woman8_6[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/6.4bpp");
const u32 gMapObjectPic_Woman8_7[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/7.4bpp");
const u32 gMapObjectPic_Woman8_8[] = INCBIN_U32("graphics/map_objects/pics/people/woman_8/8.4bpp");
const u32 gMapObjectPic_SwimmerM_0[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/0.4bpp");
const u32 gMapObjectPic_SwimmerM_1[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/1.4bpp");
const u32 gMapObjectPic_SwimmerM_2[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/2.4bpp");
const u32 gMapObjectPic_SwimmerM_3[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/3.4bpp");
const u32 gMapObjectPic_SwimmerM_4[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/4.4bpp");
const u32 gMapObjectPic_SwimmerM_5[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/5.4bpp");
const u32 gMapObjectPic_SwimmerM_6[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/6.4bpp");
const u32 gMapObjectPic_SwimmerM_7[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/7.4bpp");
const u32 gMapObjectPic_SwimmerM_8[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_m/8.4bpp");
const u32 gMapObjectPic_SwimmerF_0[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/0.4bpp");
const u32 gMapObjectPic_SwimmerF_1[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/1.4bpp");
const u32 gMapObjectPic_SwimmerF_2[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/2.4bpp");
const u32 gMapObjectPic_SwimmerF_3[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/3.4bpp");
const u32 gMapObjectPic_SwimmerF_4[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/4.4bpp");
const u32 gMapObjectPic_SwimmerF_5[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/5.4bpp");
const u32 gMapObjectPic_SwimmerF_6[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/6.4bpp");
const u32 gMapObjectPic_SwimmerF_7[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/7.4bpp");
const u32 gMapObjectPic_SwimmerF_8[] = INCBIN_U32("graphics/map_objects/pics/people/swimmer_f/8.4bpp");
const u32 gMapObjectPic_BlackBelt_0[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/0.4bpp");
const u32 gMapObjectPic_BlackBelt_1[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/1.4bpp");
const u32 gMapObjectPic_BlackBelt_2[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/2.4bpp");
const u32 gMapObjectPic_BlackBelt_3[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/3.4bpp");
const u32 gMapObjectPic_BlackBelt_4[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/4.4bpp");
const u32 gMapObjectPic_BlackBelt_5[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/5.4bpp");
const u32 gMapObjectPic_BlackBelt_6[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/6.4bpp");
const u32 gMapObjectPic_BlackBelt_7[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/7.4bpp");
const u32 gMapObjectPic_BlackBelt_8[] = INCBIN_U32("graphics/map_objects/pics/people/black_belt/8.4bpp");
const u32 gMapObjectPic_Beauty_0[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/0.4bpp");
const u32 gMapObjectPic_Beauty_1[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/1.4bpp");
const u32 gMapObjectPic_Beauty_2[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/2.4bpp");
const u32 gMapObjectPic_Beauty_3[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/3.4bpp");
const u32 gMapObjectPic_Beauty_4[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/4.4bpp");
const u32 gMapObjectPic_Beauty_5[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/5.4bpp");
const u32 gMapObjectPic_Beauty_6[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/6.4bpp");
const u32 gMapObjectPic_Beauty_7[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/7.4bpp");
const u32 gMapObjectPic_Beauty_8[] = INCBIN_U32("graphics/map_objects/pics/people/beauty/8.4bpp");
const u32 gMapObjectPic_Scientist1_0[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/0.4bpp");
const u32 gMapObjectPic_Scientist1_1[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/1.4bpp");
const u32 gMapObjectPic_Scientist1_2[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/2.4bpp");
const u32 gMapObjectPic_Scientist1_3[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/3.4bpp");
const u32 gMapObjectPic_Scientist1_4[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/4.4bpp");
const u32 gMapObjectPic_Scientist1_5[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/5.4bpp");
const u32 gMapObjectPic_Scientist1_6[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/6.4bpp");
const u32 gMapObjectPic_Scientist1_7[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/7.4bpp");
const u32 gMapObjectPic_Scientist1_8[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_1/8.4bpp");
const u32 gMapObjectPic_Lass_0[] = INCBIN_U32("graphics/map_objects/pics/people/lass/0.4bpp");
const u32 gMapObjectPic_Lass_1[] = INCBIN_U32("graphics/map_objects/pics/people/lass/1.4bpp");
const u32 gMapObjectPic_Lass_2[] = INCBIN_U32("graphics/map_objects/pics/people/lass/2.4bpp");
const u32 gMapObjectPic_Lass_3[] = INCBIN_U32("graphics/map_objects/pics/people/lass/3.4bpp");
const u32 gMapObjectPic_Lass_4[] = INCBIN_U32("graphics/map_objects/pics/people/lass/4.4bpp");
const u32 gMapObjectPic_Lass_5[] = INCBIN_U32("graphics/map_objects/pics/people/lass/5.4bpp");
const u32 gMapObjectPic_Lass_6[] = INCBIN_U32("graphics/map_objects/pics/people/lass/6.4bpp");
const u32 gMapObjectPic_Lass_7[] = INCBIN_U32("graphics/map_objects/pics/people/lass/7.4bpp");
const u32 gMapObjectPic_Lass_8[] = INCBIN_U32("graphics/map_objects/pics/people/lass/8.4bpp");
const u32 gMapObjectPic_Gentleman_0[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/0.4bpp");
const u32 gMapObjectPic_Gentleman_1[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/1.4bpp");
const u32 gMapObjectPic_Gentleman_2[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/2.4bpp");
const u32 gMapObjectPic_Gentleman_3[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/3.4bpp");
const u32 gMapObjectPic_Gentleman_4[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/4.4bpp");
const u32 gMapObjectPic_Gentleman_5[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/5.4bpp");
const u32 gMapObjectPic_Gentleman_6[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/6.4bpp");
const u32 gMapObjectPic_Gentleman_7[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/7.4bpp");
const u32 gMapObjectPic_Gentleman_8[] = INCBIN_U32("graphics/map_objects/pics/people/gentleman/8.4bpp");
const u32 gMapObjectPic_Sailor_0[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/0.4bpp");
const u32 gMapObjectPic_Sailor_1[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/1.4bpp");
const u32 gMapObjectPic_Sailor_2[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/2.4bpp");
const u32 gMapObjectPic_Sailor_3[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/3.4bpp");
const u32 gMapObjectPic_Sailor_4[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/4.4bpp");
const u32 gMapObjectPic_Sailor_5[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/5.4bpp");
const u32 gMapObjectPic_Sailor_6[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/6.4bpp");
const u32 gMapObjectPic_Sailor_7[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/7.4bpp");
const u32 gMapObjectPic_Sailor_8[] = INCBIN_U32("graphics/map_objects/pics/people/sailor/8.4bpp");
const u32 gMapObjectPic_Fisherman_0[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/0.4bpp");
const u32 gMapObjectPic_Fisherman_1[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/1.4bpp");
const u32 gMapObjectPic_Fisherman_2[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/2.4bpp");
const u32 gMapObjectPic_Fisherman_3[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/3.4bpp");
const u32 gMapObjectPic_Fisherman_4[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/4.4bpp");
const u32 gMapObjectPic_Fisherman_5[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/5.4bpp");
const u32 gMapObjectPic_Fisherman_6[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/6.4bpp");
const u32 gMapObjectPic_Fisherman_7[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/7.4bpp");
const u32 gMapObjectPic_Fisherman_8[] = INCBIN_U32("graphics/map_objects/pics/people/fisherman/8.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_0[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/0.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_1[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/1.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_2[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/2.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_3[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/3.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_4[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/4.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_5[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/5.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_6[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/6.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_7[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/7.4bpp");
const u32 gMapObjectPic_RunningTriathleteM_8[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_m/8.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_0[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/0.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_1[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/1.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_2[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/2.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_3[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/3.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_4[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/4.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_5[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/5.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_6[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/6.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_7[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/7.4bpp");
const u32 gMapObjectPic_RunningTriathleteF_8[] = INCBIN_U32("graphics/map_objects/pics/people/running_triathlete_f/8.4bpp");
const u32 gMapObjectPic_TuberF_0[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/0.4bpp");
const u32 gMapObjectPic_TuberF_1[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/1.4bpp");
const u32 gMapObjectPic_TuberF_2[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/2.4bpp");
const u32 gMapObjectPic_TuberF_3[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/3.4bpp");
const u32 gMapObjectPic_TuberF_4[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/4.4bpp");
const u32 gMapObjectPic_TuberF_5[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/5.4bpp");
const u32 gMapObjectPic_TuberF_6[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/6.4bpp");
const u32 gMapObjectPic_TuberF_7[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/7.4bpp");
const u32 gMapObjectPic_TuberF_8[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_f/8.4bpp");
const u32 gMapObjectPic_TuberM_0[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/0.4bpp");
const u32 gMapObjectPic_TuberM_1[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/1.4bpp");
const u32 gMapObjectPic_TuberM_2[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/2.4bpp");
const u32 gMapObjectPic_TuberM_3[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/3.4bpp");
const u32 gMapObjectPic_TuberM_4[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/4.4bpp");
const u32 gMapObjectPic_TuberM_5[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/5.4bpp");
const u32 gMapObjectPic_TuberM_6[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/6.4bpp");
const u32 gMapObjectPic_TuberM_7[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/7.4bpp");
const u32 gMapObjectPic_TuberM_8[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m/8.4bpp");
const u32 gMapObjectPic_Hiker_0[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/0.4bpp");
const u32 gMapObjectPic_Hiker_1[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/1.4bpp");
const u32 gMapObjectPic_Hiker_2[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/2.4bpp");
const u32 gMapObjectPic_Hiker_3[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/3.4bpp");
const u32 gMapObjectPic_Hiker_4[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/4.4bpp");
const u32 gMapObjectPic_Hiker_5[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/5.4bpp");
const u32 gMapObjectPic_Hiker_6[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/6.4bpp");
const u32 gMapObjectPic_Hiker_7[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/7.4bpp");
const u32 gMapObjectPic_Hiker_8[] = INCBIN_U32("graphics/map_objects/pics/people/hiker/8.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_0[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/0.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_1[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/1.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_2[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/2.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_3[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/3.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_4[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/4.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_5[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/5.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_6[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/6.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_7[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/7.4bpp");
const u32 gMapObjectPic_CyclingTriathleteM_8[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_m/8.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_0[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/0.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_1[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/1.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_2[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/2.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_3[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/3.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_4[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/4.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_5[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/5.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_6[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/6.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_7[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/7.4bpp");
const u32 gMapObjectPic_CyclingTriathleteF_8[] = INCBIN_U32("graphics/map_objects/pics/people/cycling_triathlete_f/8.4bpp");
const u32 gMapObjectPic_Man5_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/0.4bpp");
const u32 gMapObjectPic_Man5_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/1.4bpp");
const u32 gMapObjectPic_Man5_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/2.4bpp");
const u32 gMapObjectPic_Man5_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/3.4bpp");
const u32 gMapObjectPic_Man5_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/4.4bpp");
const u32 gMapObjectPic_Man5_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/5.4bpp");
const u32 gMapObjectPic_Man5_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/6.4bpp");
const u32 gMapObjectPic_Man5_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/7.4bpp");
const u32 gMapObjectPic_Man5_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_5/8.4bpp");
const u32 gMapObjectPic_Man6_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/0.4bpp");
const u32 gMapObjectPic_Man6_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/1.4bpp");
const u32 gMapObjectPic_Man6_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/2.4bpp");
const u32 gMapObjectPic_Man6_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/3.4bpp");
const u32 gMapObjectPic_Man6_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/4.4bpp");
const u32 gMapObjectPic_Man6_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/5.4bpp");
const u32 gMapObjectPic_Man6_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/6.4bpp");
const u32 gMapObjectPic_Man6_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/7.4bpp");
const u32 gMapObjectPic_Man6_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_6/8.4bpp");
const u32 gMapObjectPic_Nurse_0[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/0.4bpp");
const u32 gMapObjectPic_Nurse_1[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/1.4bpp");
const u32 gMapObjectPic_Nurse_2[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/2.4bpp");
const u32 gMapObjectPic_Nurse_3[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/3.4bpp");
const u32 gMapObjectPic_Nurse_4[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/4.4bpp");
const u32 gMapObjectPic_Nurse_5[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/5.4bpp");
const u32 gMapObjectPic_Nurse_6[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/6.4bpp");
const u32 gMapObjectPic_Nurse_7[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/7.4bpp");
const u32 gMapObjectPic_Nurse_8[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/8.4bpp");
const u32 gMapObjectPic_Nurse_9[] = INCBIN_U32("graphics/map_objects/pics/people/nurse/9.4bpp");
const u32 gMapObjectPic_ItemBall[] = INCBIN_U32("graphics/map_objects/pics/misc/item_ball.4bpp");
const u32 gMapObjectPic_ProfBirch_0[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/0.4bpp");
const u32 gMapObjectPic_ProfBirch_1[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/1.4bpp");
const u32 gMapObjectPic_ProfBirch_2[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/2.4bpp");
const u32 gMapObjectPic_ProfBirch_3[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/3.4bpp");
const u32 gMapObjectPic_ProfBirch_4[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/4.4bpp");
const u32 gMapObjectPic_ProfBirch_5[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/5.4bpp");
const u32 gMapObjectPic_ProfBirch_6[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/6.4bpp");
const u32 gMapObjectPic_ProfBirch_7[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/7.4bpp");
const u32 gMapObjectPic_ProfBirch_8[] = INCBIN_U32("graphics/map_objects/pics/people/prof_birch/8.4bpp");
const u32 gMapObjectPic_ReporterM_0[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/0.4bpp");
const u32 gMapObjectPic_ReporterM_1[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/1.4bpp");
const u32 gMapObjectPic_ReporterM_2[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/2.4bpp");
const u32 gMapObjectPic_ReporterM_3[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/3.4bpp");
const u32 gMapObjectPic_ReporterM_4[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/4.4bpp");
const u32 gMapObjectPic_ReporterM_5[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/5.4bpp");
const u32 gMapObjectPic_ReporterM_6[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/6.4bpp");
const u32 gMapObjectPic_ReporterM_7[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/7.4bpp");
const u32 gMapObjectPic_ReporterM_8[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_m/8.4bpp");
const u32 gMapObjectPic_ReporterF_0[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/0.4bpp");
const u32 gMapObjectPic_ReporterF_1[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/1.4bpp");
const u32 gMapObjectPic_ReporterF_2[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/2.4bpp");
const u32 gMapObjectPic_ReporterF_3[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/3.4bpp");
const u32 gMapObjectPic_ReporterF_4[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/4.4bpp");
const u32 gMapObjectPic_ReporterF_5[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/5.4bpp");
const u32 gMapObjectPic_ReporterF_6[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/6.4bpp");
const u32 gMapObjectPic_ReporterF_7[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/7.4bpp");
const u32 gMapObjectPic_ReporterF_8[] = INCBIN_U32("graphics/map_objects/pics/people/reporter_f/8.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_0[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/0.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_1[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/1.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_2[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/2.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_3[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/3.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_4[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/4.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_5[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/5.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_6[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/6.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_7[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/7.4bpp");
const u32 gMapObjectPic_MauvilleOldMan1_8[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_1/8.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_0[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/0.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_1[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/1.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_2[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/2.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_3[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/3.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_4[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/4.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_5[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/5.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_6[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/6.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_7[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/7.4bpp");
const u32 gMapObjectPic_MauvilleOldMan2_8[] = INCBIN_U32("graphics/map_objects/pics/people/mauville_old_man_2/8.4bpp");
const u32 gMapObjectPic_MartEmployee_0[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/0.4bpp");
const u32 gMapObjectPic_MartEmployee_1[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/1.4bpp");
const u32 gMapObjectPic_MartEmployee_2[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/2.4bpp");
const u32 gMapObjectPic_MartEmployee_3[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/3.4bpp");
const u32 gMapObjectPic_MartEmployee_4[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/4.4bpp");
const u32 gMapObjectPic_MartEmployee_5[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/5.4bpp");
const u32 gMapObjectPic_MartEmployee_6[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/6.4bpp");
const u32 gMapObjectPic_MartEmployee_7[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/7.4bpp");
const u32 gMapObjectPic_MartEmployee_8[] = INCBIN_U32("graphics/map_objects/pics/people/mart_employee/8.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_0[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/0.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_1[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/1.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_2[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/2.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_3[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/3.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_4[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/4.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_5[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/5.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_6[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/6.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_7[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/7.4bpp");
const u32 gMapObjectPic_RooftopSaleWoman_8[] = INCBIN_U32("graphics/map_objects/pics/people/rooftop_sale_woman/8.4bpp");
const u32 gMapObjectPic_Teala_0[] = INCBIN_U32("graphics/map_objects/pics/people/teala/0.4bpp");
const u32 gMapObjectPic_Teala_1[] = INCBIN_U32("graphics/map_objects/pics/people/teala/1.4bpp");
const u32 gMapObjectPic_Teala_2[] = INCBIN_U32("graphics/map_objects/pics/people/teala/2.4bpp");
const u32 gMapObjectPic_Teala_3[] = INCBIN_U32("graphics/map_objects/pics/people/teala/3.4bpp");
const u32 gMapObjectPic_Teala_4[] = INCBIN_U32("graphics/map_objects/pics/people/teala/4.4bpp");
const u32 gMapObjectPic_Teala_5[] = INCBIN_U32("graphics/map_objects/pics/people/teala/5.4bpp");
const u32 gMapObjectPic_Teala_6[] = INCBIN_U32("graphics/map_objects/pics/people/teala/6.4bpp");
const u32 gMapObjectPic_Teala_7[] = INCBIN_U32("graphics/map_objects/pics/people/teala/7.4bpp");
const u32 gMapObjectPic_Teala_8[] = INCBIN_U32("graphics/map_objects/pics/people/teala/8.4bpp");
const u32 gMapObjectPic_Artist_0[] = INCBIN_U32("graphics/map_objects/pics/people/artist/0.4bpp");
const u32 gMapObjectPic_Artist_1[] = INCBIN_U32("graphics/map_objects/pics/people/artist/1.4bpp");
const u32 gMapObjectPic_Artist_2[] = INCBIN_U32("graphics/map_objects/pics/people/artist/2.4bpp");
const u32 gMapObjectPic_Artist_3[] = INCBIN_U32("graphics/map_objects/pics/people/artist/3.4bpp");
const u32 gMapObjectPic_Artist_4[] = INCBIN_U32("graphics/map_objects/pics/people/artist/4.4bpp");
const u32 gMapObjectPic_Artist_5[] = INCBIN_U32("graphics/map_objects/pics/people/artist/5.4bpp");
const u32 gMapObjectPic_Artist_6[] = INCBIN_U32("graphics/map_objects/pics/people/artist/6.4bpp");
const u32 gMapObjectPic_Artist_7[] = INCBIN_U32("graphics/map_objects/pics/people/artist/7.4bpp");
const u32 gMapObjectPic_Artist_8[] = INCBIN_U32("graphics/map_objects/pics/people/artist/8.4bpp");
const u32 gMapObjectPic_Cameraman_0[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/0.4bpp");
const u32 gMapObjectPic_Cameraman_1[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/1.4bpp");
const u32 gMapObjectPic_Cameraman_2[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/2.4bpp");
const u32 gMapObjectPic_Cameraman_3[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/3.4bpp");
const u32 gMapObjectPic_Cameraman_4[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/4.4bpp");
const u32 gMapObjectPic_Cameraman_5[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/5.4bpp");
const u32 gMapObjectPic_Cameraman_6[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/6.4bpp");
const u32 gMapObjectPic_Cameraman_7[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/7.4bpp");
const u32 gMapObjectPic_Cameraman_8[] = INCBIN_U32("graphics/map_objects/pics/people/cameraman/8.4bpp");
const u32 gMapObjectPic_Scientist2_0[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/0.4bpp");
const u32 gMapObjectPic_Scientist2_1[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/1.4bpp");
const u32 gMapObjectPic_Scientist2_2[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/2.4bpp");
const u32 gMapObjectPic_Scientist2_3[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/3.4bpp");
const u32 gMapObjectPic_Scientist2_4[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/4.4bpp");
const u32 gMapObjectPic_Scientist2_5[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/5.4bpp");
const u32 gMapObjectPic_Scientist2_6[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/6.4bpp");
const u32 gMapObjectPic_Scientist2_7[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/7.4bpp");
const u32 gMapObjectPic_Scientist2_8[] = INCBIN_U32("graphics/map_objects/pics/people/scientist_2/8.4bpp");
const u32 gMapObjectPic_Man7_0[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/0.4bpp");
const u32 gMapObjectPic_Man7_1[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/1.4bpp");
const u32 gMapObjectPic_Man7_2[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/2.4bpp");
const u32 gMapObjectPic_Man7_3[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/3.4bpp");
const u32 gMapObjectPic_Man7_4[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/4.4bpp");
const u32 gMapObjectPic_Man7_5[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/5.4bpp");
const u32 gMapObjectPic_Man7_6[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/6.4bpp");
const u32 gMapObjectPic_Man7_7[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/7.4bpp");
const u32 gMapObjectPic_Man7_8[] = INCBIN_U32("graphics/map_objects/pics/people/man_7/8.4bpp");
const u32 gMapObjectPic_AquaMemberM_0[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/0.4bpp");
const u32 gMapObjectPic_AquaMemberM_1[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/1.4bpp");
const u32 gMapObjectPic_AquaMemberM_2[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/2.4bpp");
const u32 gMapObjectPic_AquaMemberM_3[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/3.4bpp");
const u32 gMapObjectPic_AquaMemberM_4[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/4.4bpp");
const u32 gMapObjectPic_AquaMemberM_5[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/5.4bpp");
const u32 gMapObjectPic_AquaMemberM_6[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/6.4bpp");
const u32 gMapObjectPic_AquaMemberM_7[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/7.4bpp");
const u32 gMapObjectPic_AquaMemberM_8[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_m/8.4bpp");
const u32 gMapObjectPic_AquaMemberF_0[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/0.4bpp");
const u32 gMapObjectPic_AquaMemberF_1[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/1.4bpp");
const u32 gMapObjectPic_AquaMemberF_2[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/2.4bpp");
const u32 gMapObjectPic_AquaMemberF_3[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/3.4bpp");
const u32 gMapObjectPic_AquaMemberF_4[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/4.4bpp");
const u32 gMapObjectPic_AquaMemberF_5[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/5.4bpp");
const u32 gMapObjectPic_AquaMemberF_6[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/6.4bpp");
const u32 gMapObjectPic_AquaMemberF_7[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/7.4bpp");
const u32 gMapObjectPic_AquaMemberF_8[] = INCBIN_U32("graphics/map_objects/pics/people/aqua_member_f/8.4bpp");
const u32 gMapObjectPic_MagmaMemberM_0[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/0.4bpp");
const u32 gMapObjectPic_MagmaMemberM_1[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/1.4bpp");
const u32 gMapObjectPic_MagmaMemberM_2[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/2.4bpp");
const u32 gMapObjectPic_MagmaMemberM_3[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/3.4bpp");
const u32 gMapObjectPic_MagmaMemberM_4[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/4.4bpp");
const u32 gMapObjectPic_MagmaMemberM_5[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/5.4bpp");
const u32 gMapObjectPic_MagmaMemberM_6[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/6.4bpp");
const u32 gMapObjectPic_MagmaMemberM_7[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/7.4bpp");
const u32 gMapObjectPic_MagmaMemberM_8[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_m/8.4bpp");
const u32 gMapObjectPic_MagmaMemberF_0[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/0.4bpp");
const u32 gMapObjectPic_MagmaMemberF_1[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/1.4bpp");
const u32 gMapObjectPic_MagmaMemberF_2[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/2.4bpp");
const u32 gMapObjectPic_MagmaMemberF_3[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/3.4bpp");
const u32 gMapObjectPic_MagmaMemberF_4[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/4.4bpp");
const u32 gMapObjectPic_MagmaMemberF_5[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/5.4bpp");
const u32 gMapObjectPic_MagmaMemberF_6[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/6.4bpp");
const u32 gMapObjectPic_MagmaMemberF_7[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/7.4bpp");
const u32 gMapObjectPic_MagmaMemberF_8[] = INCBIN_U32("graphics/map_objects/pics/people/magma_member_f/8.4bpp");
const u32 gMapObjectPic_Sidney_0[] = INCBIN_U32("graphics/map_objects/pics/people/sidney/0.4bpp");
const u32 gMapObjectPic_Sidney_1[] = INCBIN_U32("graphics/map_objects/pics/people/sidney/1.4bpp");
const u32 gMapObjectPic_Sidney_2[] = INCBIN_U32("graphics/map_objects/pics/people/sidney/2.4bpp");
const u32 gMapObjectPic_Phoebe_0[] = INCBIN_U32("graphics/map_objects/pics/people/phoebe/0.4bpp");
const u32 gMapObjectPic_Phoebe_1[] = INCBIN_U32("graphics/map_objects/pics/people/phoebe/1.4bpp");
const u32 gMapObjectPic_Phoebe_2[] = INCBIN_U32("graphics/map_objects/pics/people/phoebe/2.4bpp");
const u32 gMapObjectPic_Glacia_0[] = INCBIN_U32("graphics/map_objects/pics/people/glacia/0.4bpp");
const u32 gMapObjectPic_Glacia_1[] = INCBIN_U32("graphics/map_objects/pics/people/glacia/1.4bpp");
const u32 gMapObjectPic_Glacia_2[] = INCBIN_U32("graphics/map_objects/pics/people/glacia/2.4bpp");
const u32 gMapObjectPic_Drake_0[] = INCBIN_U32("graphics/map_objects/pics/people/drake/0.4bpp");
const u32 gMapObjectPic_Drake_1[] = INCBIN_U32("graphics/map_objects/pics/people/drake/1.4bpp");
const u32 gMapObjectPic_Drake_2[] = INCBIN_U32("graphics/map_objects/pics/people/drake/2.4bpp");
const u32 gMapObjectPic_Roxanne_0[] = INCBIN_U32("graphics/map_objects/pics/people/roxanne/0.4bpp");
const u32 gMapObjectPic_Roxanne_1[] = INCBIN_U32("graphics/map_objects/pics/people/roxanne/1.4bpp");
const u32 gMapObjectPic_Roxanne_2[] = INCBIN_U32("graphics/map_objects/pics/people/roxanne/2.4bpp");
const u32 gMapObjectPic_Brawly_0[] = INCBIN_U32("graphics/map_objects/pics/people/brawly/0.4bpp");
const u32 gMapObjectPic_Brawly_1[] = INCBIN_U32("graphics/map_objects/pics/people/brawly/1.4bpp");
const u32 gMapObjectPic_Brawly_2[] = INCBIN_U32("graphics/map_objects/pics/people/brawly/2.4bpp");
const u32 gMapObjectPic_Wattson_0[] = INCBIN_U32("graphics/map_objects/pics/people/wattson/0.4bpp");
const u32 gMapObjectPic_Wattson_1[] = INCBIN_U32("graphics/map_objects/pics/people/wattson/1.4bpp");
const u32 gMapObjectPic_Wattson_2[] = INCBIN_U32("graphics/map_objects/pics/people/wattson/2.4bpp");
const u32 gMapObjectPic_Flannery_0[] = INCBIN_U32("graphics/map_objects/pics/people/flannery/0.4bpp");
const u32 gMapObjectPic_Flannery_1[] = INCBIN_U32("graphics/map_objects/pics/people/flannery/1.4bpp");
const u32 gMapObjectPic_Flannery_2[] = INCBIN_U32("graphics/map_objects/pics/people/flannery/2.4bpp");
const u32 gMapObjectPic_Norman_0[] = INCBIN_U32("graphics/map_objects/pics/people/norman/0.4bpp");
const u32 gMapObjectPic_Norman_1[] = INCBIN_U32("graphics/map_objects/pics/people/norman/1.4bpp");
const u32 gMapObjectPic_Norman_2[] = INCBIN_U32("graphics/map_objects/pics/people/norman/2.4bpp");
const u32 gMapObjectPic_Norman_3[] = INCBIN_U32("graphics/map_objects/pics/people/norman/3.4bpp");
const u32 gMapObjectPic_Norman_4[] = INCBIN_U32("graphics/map_objects/pics/people/norman/4.4bpp");
const u32 gMapObjectPic_Norman_5[] = INCBIN_U32("graphics/map_objects/pics/people/norman/5.4bpp");
const u32 gMapObjectPic_Norman_6[] = INCBIN_U32("graphics/map_objects/pics/people/norman/6.4bpp");
const u32 gMapObjectPic_Norman_7[] = INCBIN_U32("graphics/map_objects/pics/people/norman/7.4bpp");
const u32 gMapObjectPic_Norman_8[] = INCBIN_U32("graphics/map_objects/pics/people/norman/8.4bpp");
const u32 gMapObjectPic_Winona_0[] = INCBIN_U32("graphics/map_objects/pics/people/winona/0.4bpp");
const u32 gMapObjectPic_Winona_1[] = INCBIN_U32("graphics/map_objects/pics/people/winona/1.4bpp");
const u32 gMapObjectPic_Winona_2[] = INCBIN_U32("graphics/map_objects/pics/people/winona/2.4bpp");
const u32 gMapObjectPic_Liza_0[] = INCBIN_U32("graphics/map_objects/pics/people/liza/0.4bpp");
const u32 gMapObjectPic_Liza_1[] = INCBIN_U32("graphics/map_objects/pics/people/liza/1.4bpp");
const u32 gMapObjectPic_Liza_2[] = INCBIN_U32("graphics/map_objects/pics/people/liza/2.4bpp");
const u32 gMapObjectPic_Tate_0[] = INCBIN_U32("graphics/map_objects/pics/people/tate/0.4bpp");
const u32 gMapObjectPic_Tate_1[] = INCBIN_U32("graphics/map_objects/pics/people/tate/1.4bpp");
const u32 gMapObjectPic_Tate_2[] = INCBIN_U32("graphics/map_objects/pics/people/tate/2.4bpp");
const u32 gMapObjectPic_Wallace_0[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/0.4bpp");
const u32 gMapObjectPic_Wallace_1[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/1.4bpp");
const u32 gMapObjectPic_Wallace_2[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/2.4bpp");
const u32 gMapObjectPic_Wallace_3[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/3.4bpp");
const u32 gMapObjectPic_Wallace_4[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/4.4bpp");
const u32 gMapObjectPic_Wallace_5[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/5.4bpp");
const u32 gMapObjectPic_Wallace_6[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/6.4bpp");
const u32 gMapObjectPic_Wallace_7[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/7.4bpp");
const u32 gMapObjectPic_Wallace_8[] = INCBIN_U32("graphics/map_objects/pics/people/wallace/8.4bpp");
const u32 gMapObjectPic_Steven_0[] = INCBIN_U32("graphics/map_objects/pics/people/steven/0.4bpp");
const u32 gMapObjectPic_Steven_1[] = INCBIN_U32("graphics/map_objects/pics/people/steven/1.4bpp");
const u32 gMapObjectPic_Steven_2[] = INCBIN_U32("graphics/map_objects/pics/people/steven/2.4bpp");
const u32 gMapObjectPic_Steven_3[] = INCBIN_U32("graphics/map_objects/pics/people/steven/3.4bpp");
const u32 gMapObjectPic_Steven_4[] = INCBIN_U32("graphics/map_objects/pics/people/steven/4.4bpp");
const u32 gMapObjectPic_Steven_5[] = INCBIN_U32("graphics/map_objects/pics/people/steven/5.4bpp");
const u32 gMapObjectPic_Steven_6[] = INCBIN_U32("graphics/map_objects/pics/people/steven/6.4bpp");
const u32 gMapObjectPic_Steven_7[] = INCBIN_U32("graphics/map_objects/pics/people/steven/7.4bpp");
const u32 gMapObjectPic_Steven_8[] = INCBIN_U32("graphics/map_objects/pics/people/steven/8.4bpp");
const u32 gMapObjectPic_Wally_0[] = INCBIN_U32("graphics/map_objects/pics/people/wally/0.4bpp");
const u32 gMapObjectPic_Wally_1[] = INCBIN_U32("graphics/map_objects/pics/people/wally/1.4bpp");
const u32 gMapObjectPic_Wally_2[] = INCBIN_U32("graphics/map_objects/pics/people/wally/2.4bpp");
const u32 gMapObjectPic_Wally_3[] = INCBIN_U32("graphics/map_objects/pics/people/wally/3.4bpp");
const u32 gMapObjectPic_Wally_4[] = INCBIN_U32("graphics/map_objects/pics/people/wally/4.4bpp");
const u32 gMapObjectPic_Wally_5[] = INCBIN_U32("graphics/map_objects/pics/people/wally/5.4bpp");
const u32 gMapObjectPic_Wally_6[] = INCBIN_U32("graphics/map_objects/pics/people/wally/6.4bpp");
const u32 gMapObjectPic_Wally_7[] = INCBIN_U32("graphics/map_objects/pics/people/wally/7.4bpp");
const u32 gMapObjectPic_Wally_8[] = INCBIN_U32("graphics/map_objects/pics/people/wally/8.4bpp");
const u32 gMapObjectPic_LittleBoy3_0[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/0.4bpp");
const u32 gMapObjectPic_LittleBoy3_1[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/1.4bpp");
const u32 gMapObjectPic_LittleBoy3_2[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/2.4bpp");
const u32 gMapObjectPic_LittleBoy3_3[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/3.4bpp");
const u32 gMapObjectPic_LittleBoy3_4[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/4.4bpp");
const u32 gMapObjectPic_LittleBoy3_5[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/5.4bpp");
const u32 gMapObjectPic_LittleBoy3_6[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/6.4bpp");
const u32 gMapObjectPic_LittleBoy3_7[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/7.4bpp");
const u32 gMapObjectPic_LittleBoy3_8[] = INCBIN_U32("graphics/map_objects/pics/people/little_boy_3/8.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_0[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/0.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_1[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/1.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_2[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/2.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_3[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/3.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_4[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/4.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_5[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/5.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_6[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/6.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_7[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/7.4bpp");
const u32 gMapObjectPic_HotSpringsOldWoman_8[] = INCBIN_U32("graphics/map_objects/pics/people/hot_springs_old_woman/8.4bpp");
const u32 gMapObjectPic_LatiasLatios_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/latias_latios/0.4bpp");
const u32 gMapObjectPic_LatiasLatios_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/latias_latios/1.4bpp");
const u32 gMapObjectPic_LatiasLatios_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/latias_latios/2.4bpp");
const u32 gMapObjectPic_Boy5_0[] = INCBIN_U32("graphics/map_objects/pics/people/boy_5/0.4bpp");
const u32 gMapObjectPic_Boy5_1[] = INCBIN_U32("graphics/map_objects/pics/people/boy_5/1.4bpp");
const u32 gMapObjectPic_Boy5_2[] = INCBIN_U32("graphics/map_objects/pics/people/boy_5/2.4bpp");
const u32 gMapObjectPic_ContestJudge_0[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/0.4bpp");
const u32 gMapObjectPic_ContestJudge_1[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/1.4bpp");
const u32 gMapObjectPic_ContestJudge_2[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/2.4bpp");
const u32 gMapObjectPic_ContestJudge_3[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/3.4bpp");
const u32 gMapObjectPic_ContestJudge_4[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/4.4bpp");
const u32 gMapObjectPic_ContestJudge_5[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/5.4bpp");
const u32 gMapObjectPic_ContestJudge_6[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/6.4bpp");
const u32 gMapObjectPic_ContestJudge_7[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/7.4bpp");
const u32 gMapObjectPic_ContestJudge_8[] = INCBIN_U32("graphics/map_objects/pics/people/contest_judge/8.4bpp");
const u32 gMapObjectPic_Archie_0[] = INCBIN_U32("graphics/map_objects/pics/people/archie/0.4bpp");
const u32 gMapObjectPic_Archie_1[] = INCBIN_U32("graphics/map_objects/pics/people/archie/1.4bpp");
const u32 gMapObjectPic_Archie_2[] = INCBIN_U32("graphics/map_objects/pics/people/archie/2.4bpp");
const u32 gMapObjectPic_Archie_3[] = INCBIN_U32("graphics/map_objects/pics/people/archie/3.4bpp");
const u32 gMapObjectPic_Archie_4[] = INCBIN_U32("graphics/map_objects/pics/people/archie/4.4bpp");
const u32 gMapObjectPic_Archie_5[] = INCBIN_U32("graphics/map_objects/pics/people/archie/5.4bpp");
const u32 gMapObjectPic_Archie_6[] = INCBIN_U32("graphics/map_objects/pics/people/archie/6.4bpp");
const u32 gMapObjectPic_Archie_7[] = INCBIN_U32("graphics/map_objects/pics/people/archie/7.4bpp");
const u32 gMapObjectPic_Archie_8[] = INCBIN_U32("graphics/map_objects/pics/people/archie/8.4bpp");
const u32 gMapObjectPic_Maxie_0[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/0.4bpp");
const u32 gMapObjectPic_Maxie_1[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/1.4bpp");
const u32 gMapObjectPic_Maxie_2[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/2.4bpp");
const u32 gMapObjectPic_Maxie_3[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/3.4bpp");
const u32 gMapObjectPic_Maxie_4[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/4.4bpp");
const u32 gMapObjectPic_Maxie_5[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/5.4bpp");
const u32 gMapObjectPic_Maxie_6[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/6.4bpp");
const u32 gMapObjectPic_Maxie_7[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/7.4bpp");
const u32 gMapObjectPic_Maxie_8[] = INCBIN_U32("graphics/map_objects/pics/people/maxie/8.4bpp");
const u32 gMapObjectPic_Kyogre_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kyogre/0.4bpp");
const u32 gMapObjectPic_Kyogre_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kyogre/1.4bpp");
const u32 gMapObjectPic_Groudon_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/groudon/0.4bpp");
const u32 gMapObjectPic_Groudon_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/groudon/1.4bpp");
const u32 gMapObjectPic_Regi[] = INCBIN_U32("graphics/map_objects/pics/pokemon/regi.4bpp");
const u32 gMapObjectPic_Skitty_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/skitty/0.4bpp");
const u32 gMapObjectPic_Skitty_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/skitty/1.4bpp");
const u32 gMapObjectPic_Skitty_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/skitty/2.4bpp");
const u32 gMapObjectPic_Kecleon_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kecleon/0.4bpp");
const u32 gMapObjectPic_Kecleon_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kecleon/1.4bpp");
const u32 gMapObjectPic_Kecleon_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/kecleon/2.4bpp");
const u32 gMapObjectPic_Rayquaza_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/rayquaza/0.4bpp");
const u32 gMapObjectPic_Rayquaza_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/rayquaza/1.4bpp");
const u32 gMapObjectPic_Zigzagoon_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/zigzagoon/0.4bpp");
const u32 gMapObjectPic_Zigzagoon_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/zigzagoon/1.4bpp");
const u32 gMapObjectPic_Zigzagoon_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/zigzagoon/2.4bpp");
const u32 gMapObjectPic_Pikachu_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/pikachu/0.4bpp");
const u32 gMapObjectPic_Pikachu_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/pikachu/1.4bpp");
const u32 gMapObjectPic_Pikachu_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/pikachu/2.4bpp");
const u32 gMapObjectPic_Azumarill_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azumarill/0.4bpp");
const u32 gMapObjectPic_Azumarill_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azumarill/1.4bpp");
const u32 gMapObjectPic_Azumarill_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azumarill/2.4bpp");
const u32 gMapObjectPic_Wingull_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/0.4bpp");
const u32 gMapObjectPic_Wingull_3[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/3.4bpp");
const u32 gMapObjectPic_Wingull_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/1.4bpp");
const u32 gMapObjectPic_Wingull_4[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/4.4bpp");
const u32 gMapObjectPic_Wingull_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/2.4bpp");
const u32 gMapObjectPic_Wingull_5[] = INCBIN_U32("graphics/map_objects/pics/pokemon/wingull/5.4bpp");
const u32 gMapObjectPic_TuberMSwimming_0[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/0.4bpp");
const u32 gMapObjectPic_TuberMSwimming_1[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/1.4bpp");
const u32 gMapObjectPic_TuberMSwimming_2[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/2.4bpp");
const u32 gMapObjectPic_TuberMSwimming_3[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/3.4bpp");
const u32 gMapObjectPic_TuberMSwimming_4[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/4.4bpp");
const u32 gMapObjectPic_TuberMSwimming_5[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/5.4bpp");
const u32 gMapObjectPic_TuberMSwimming_6[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/6.4bpp");
const u32 gMapObjectPic_TuberMSwimming_7[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/7.4bpp");
const u32 gMapObjectPic_TuberMSwimming_8[] = INCBIN_U32("graphics/map_objects/pics/people/tuber_m_swimming/8.4bpp");
const u32 gMapObjectPic_Azurill_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azurill/0.4bpp");
const u32 gMapObjectPic_Azurill_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azurill/1.4bpp");
const u32 gMapObjectPic_Azurill_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/azurill/2.4bpp");
const u32 gMapObjectPic_Mom_0[] = INCBIN_U32("graphics/map_objects/pics/people/mom/0.4bpp");
const u32 gMapObjectPic_Mom_1[] = INCBIN_U32("graphics/map_objects/pics/people/mom/1.4bpp");
const u32 gMapObjectPic_Mom_2[] = INCBIN_U32("graphics/map_objects/pics/people/mom/2.4bpp");
const u32 gMapObjectPic_Mom_3[] = INCBIN_U32("graphics/map_objects/pics/people/mom/3.4bpp");
const u32 gMapObjectPic_Mom_4[] = INCBIN_U32("graphics/map_objects/pics/people/mom/4.4bpp");
const u32 gMapObjectPic_Mom_5[] = INCBIN_U32("graphics/map_objects/pics/people/mom/5.4bpp");
const u32 gMapObjectPic_Mom_6[] = INCBIN_U32("graphics/map_objects/pics/people/mom/6.4bpp");
const u32 gMapObjectPic_Mom_7[] = INCBIN_U32("graphics/map_objects/pics/people/mom/7.4bpp");
const u32 gMapObjectPic_Mom_8[] = INCBIN_U32("graphics/map_objects/pics/people/mom/8.4bpp");
const u16 gMapObjectPalette22[] = INCBIN_U16("graphics/map_objects/palettes/22.gbapal");
const u16 gMapObjectPalette23[] = INCBIN_U16("graphics/map_objects/palettes/23.gbapal");
const u16 gMapObjectPalette24[] = INCBIN_U16("graphics/map_objects/palettes/24.gbapal");
const u16 gMapObjectPalette25[] = INCBIN_U16("graphics/map_objects/palettes/25.gbapal");
const u32 gMapObjectPic_UnusedNatuDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_natu_doll.4bpp");
const u32 gMapObjectPic_UnusedMagnemiteDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_magnemite_doll.4bpp");
const u32 gMapObjectPic_UnusedSquirtleDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_squirtle_doll.4bpp");
const u32 gMapObjectPic_UnusedWooperDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_wooper_doll.4bpp");
const u32 gMapObjectPic_UnusedPikachuDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_pikachu_doll.4bpp");
const u32 gMapObjectPic_UnusedPorygon2Doll[] = INCBIN_U32("graphics/map_objects/pics/dolls/unused_porygon2_doll.4bpp");
const u32 gMapObjectPic_PichuDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/pichu_doll.4bpp");
const u32 gMapObjectPic_PikachuDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/pikachu_doll.4bpp");
const u32 gMapObjectPic_MarillDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/marill_doll.4bpp");
const u32 gMapObjectPic_TogepiDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/togepi_doll.4bpp");
const u32 gMapObjectPic_CyndaquilDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/cyndaquil_doll.4bpp");
const u32 gMapObjectPic_ChikoritaDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/chikorita_doll.4bpp");
const u32 gMapObjectPic_TotodileDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/totodile_doll.4bpp");
const u32 gMapObjectPic_JigglypuffDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/jigglypuff_doll.4bpp");
const u32 gMapObjectPic_MeowthDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/meowth_doll.4bpp");
const u32 gMapObjectPic_ClefairyDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/clefairy_doll.4bpp");
const u32 gMapObjectPic_DittoDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/ditto_doll.4bpp");
const u32 gMapObjectPic_SmoochumDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/smoochum_doll.4bpp");
const u32 gMapObjectPic_TreeckoDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/treecko_doll.4bpp");
const u32 gMapObjectPic_TorchicDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/torchic_doll.4bpp");
const u32 gMapObjectPic_MudkipDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/mudkip_doll.4bpp");
const u32 gMapObjectPic_DuskullDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/duskull_doll.4bpp");
const u32 gMapObjectPic_WynautDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/wynaut_doll.4bpp");
const u32 gMapObjectPic_BaltoyDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/baltoy_doll.4bpp");
const u32 gMapObjectPic_KecleonDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/kecleon_doll.4bpp");
const u32 gMapObjectPic_AzurillDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/azurill_doll.4bpp");
const u32 gMapObjectPic_SkittyDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/skitty_doll.4bpp");
const u32 gMapObjectPic_SwabluDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/swablu_doll.4bpp");
const u32 gMapObjectPic_GulpinDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/gulpin_doll.4bpp");
const u32 gMapObjectPic_LotadDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/lotad_doll.4bpp");
const u32 gMapObjectPic_SeedotDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/seedot_doll.4bpp");
const u32 gMapObjectPic_PikaCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/pika_cushion.4bpp");
const u32 gMapObjectPic_RoundCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/round_cushion.4bpp");
const u32 gMapObjectPic_KissCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/kiss_cushion.4bpp");
const u32 gMapObjectPic_ZigzagCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/zigzag_cushion.4bpp");
const u32 gMapObjectPic_SpinCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/spin_cushion.4bpp");
const u32 gMapObjectPic_DiamondCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/diamond_cushion.4bpp");
const u32 gMapObjectPic_BallCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/ball_cushion.4bpp");
const u32 gMapObjectPic_GrassCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/grass_cushion.4bpp");
const u32 gMapObjectPic_FireCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/fire_cushion.4bpp");
const u32 gMapObjectPic_WaterCushion[] = INCBIN_U32("graphics/map_objects/pics/cushions/water_cushion.4bpp");
const u32 gMapObjectPic_BigSnorlaxDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_snorlax_doll.4bpp");
const u32 gMapObjectPic_BigRhydonDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_rhydon_doll.4bpp");
const u32 gMapObjectPic_BigLaprasDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_lapras_doll.4bpp");
const u32 gMapObjectPic_BigVenusaurDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_venusaur_doll.4bpp");
const u32 gMapObjectPic_BigCharizardDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_charizard_doll.4bpp");
const u32 gMapObjectPic_BigBlastoiseDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_blastoise_doll.4bpp");
const u32 gMapObjectPic_BigWailmerDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_wailmer_doll.4bpp");
const u32 gMapObjectPic_BigRegirockDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_regirock_doll.4bpp");
const u32 gMapObjectPic_BigRegiceDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_regice_doll.4bpp");
const u32 gMapObjectPic_BigRegisteelDoll[] = INCBIN_U32("graphics/map_objects/pics/dolls/big_registeel_doll.4bpp");
const u32 gMapObjectPic_CuttableTree_0[] = INCBIN_U32("graphics/map_objects/pics/misc/cuttable_tree/0.4bpp");
const u32 gMapObjectPic_CuttableTree_1[] = INCBIN_U32("graphics/map_objects/pics/misc/cuttable_tree/1.4bpp");
const u32 gMapObjectPic_CuttableTree_2[] = INCBIN_U32("graphics/map_objects/pics/misc/cuttable_tree/2.4bpp");
const u32 gMapObjectPic_CuttableTree_3[] = INCBIN_U32("graphics/map_objects/pics/misc/cuttable_tree/3.4bpp");
const u32 gMapObjectPic_BreakableRock_0[] = INCBIN_U32("graphics/map_objects/pics/misc/breakable_rock/0.4bpp");
const u32 gMapObjectPic_BreakableRock_1[] = INCBIN_U32("graphics/map_objects/pics/misc/breakable_rock/1.4bpp");
const u32 gMapObjectPic_BreakableRock_2[] = INCBIN_U32("graphics/map_objects/pics/misc/breakable_rock/2.4bpp");
const u32 gMapObjectPic_BreakableRock_3[] = INCBIN_U32("graphics/map_objects/pics/misc/breakable_rock/3.4bpp");
const u32 gMapObjectPic_PushableBoulder[] = INCBIN_U32("graphics/map_objects/pics/misc/pushable_boulder.4bpp");
const u32 gMapObjectPic_MrBrineysBoat_0[] = INCBIN_U32("graphics/map_objects/pics/misc/mr_brineys_boat/0.4bpp");
const u32 gMapObjectPic_MrBrineysBoat_1[] = INCBIN_U32("graphics/map_objects/pics/misc/mr_brineys_boat/1.4bpp");
const u32 gMapObjectPic_MrBrineysBoat_2[] = INCBIN_U32("graphics/map_objects/pics/misc/mr_brineys_boat/2.4bpp");
const u32 gMapObjectPic_Fossil[] = INCBIN_U32("graphics/map_objects/pics/misc/fossil.4bpp");
const u32 gMapObjectPic_SubmarineShadow[] = INCBIN_U32("graphics/map_objects/pics/misc/submarine_shadow.4bpp");
const u16 gMapObjectPalette26[] = INCBIN_U16("graphics/map_objects/palettes/26.gbapal");
const u32 gMapObjectPic_Truck[] = INCBIN_U32("graphics/map_objects/pics/misc/truck.4bpp");
const u16 gMapObjectPalette14[] = INCBIN_U16("graphics/map_objects/palettes/14.gbapal");
const u32 gMapObjectPic_MachokeCarryingBox_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_carrying_box/0.4bpp");
const u32 gMapObjectPic_MachokeCarryingBox_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_carrying_box/1.4bpp");
const u32 gMapObjectPic_MachokeCarryingBox_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_carrying_box/2.4bpp");
const u32 gMapObjectPic_MachokeFacingAway_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_facing_away/0.4bpp");
const u32 gMapObjectPic_MachokeFacingAway_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/machoke_facing_away/1.4bpp");
const u16 gMapObjectPalette15[] = INCBIN_U16("graphics/map_objects/palettes/15.gbapal");
const u32 gMapObjectPic_BirchsBag[] = INCBIN_U32("graphics/map_objects/pics/misc/birchs_bag.4bpp");
const u32 gMapObjectPic_Poochyena_0[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/0.4bpp");
const u32 gMapObjectPic_Poochyena_1[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/1.4bpp");
const u32 gMapObjectPic_Poochyena_2[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/2.4bpp");
const u32 gMapObjectPic_Poochyena_3[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/3.4bpp");
const u32 gMapObjectPic_Poochyena_4[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/4.4bpp");
const u32 gMapObjectPic_Poochyena_5[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/5.4bpp");
const u32 gMapObjectPic_Poochyena_6[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/6.4bpp");
const u32 gMapObjectPic_Poochyena_7[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/7.4bpp");
const u32 gMapObjectPic_Poochyena_8[] = INCBIN_U32("graphics/map_objects/pics/pokemon/poochyena/8.4bpp");
const u16 gMapObjectPalette16[] = INCBIN_U16("graphics/map_objects/palettes/16.gbapal");
const u32 gMapObjectPic_CableCar[] = INCBIN_U32("graphics/map_objects/pics/misc/cable_car.4bpp");
const u16 gMapObjectPalette20[] = INCBIN_U16("graphics/map_objects/palettes/20.gbapal");
const u32 gMapObjectPic_SSTidal[] = INCBIN_U32("graphics/map_objects/pics/misc/ss_tidal.4bpp");
const u16 gMapObjectPalette21[] = INCBIN_U16("graphics/map_objects/palettes/21.gbapal");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_0[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/0.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_1[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/1.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_2[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/2.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_3[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/3.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_4[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/4.4bpp");
const u32 gFieldEffectPic_BerryTreeGrowthSparkle_5[] = INCBIN_U32("graphics/field_effect_objects/pics/berry_tree_growth_sparkle/5.4bpp");
const u32 gMapObjectPic_BerryTreeDirtPile[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/dirt_pile.4bpp");
const u32 gMapObjectPic_BerryTreeSprout_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sprout/0.4bpp");
const u32 gMapObjectPic_BerryTreeSprout_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sprout/1.4bpp");
const u32 gMapObjectPic_PechaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/0.4bpp");
const u32 gMapObjectPic_PechaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/1.4bpp");
const u32 gMapObjectPic_PechaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/2.4bpp");
const u32 gMapObjectPic_PechaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/3.4bpp");
const u32 gMapObjectPic_PechaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/4.4bpp");
const u32 gMapObjectPic_PechaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pecha/5.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/0.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/1.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/2.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/3.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/4.4bpp");
const u32 gMapObjectPic_KelpsyBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/kelpsy/5.4bpp");
const u32 gMapObjectPic_WepearBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/0.4bpp");
const u32 gMapObjectPic_WepearBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/1.4bpp");
const u32 gMapObjectPic_WepearBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/2.4bpp");
const u32 gMapObjectPic_WepearBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/3.4bpp");
const u32 gMapObjectPic_WepearBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/4.4bpp");
const u32 gMapObjectPic_WepearBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wepear/5.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/0.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/1.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/2.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/3.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/4.4bpp");
const u32 gMapObjectPic_IapapaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/iapapa/5.4bpp");
const u32 gMapObjectPic_CheriBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/0.4bpp");
const u32 gMapObjectPic_CheriBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/1.4bpp");
const u32 gMapObjectPic_CheriBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/2.4bpp");
const u32 gMapObjectPic_CheriBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/3.4bpp");
const u32 gMapObjectPic_CheriBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/4.4bpp");
const u32 gMapObjectPic_CheriBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cheri/5.4bpp");
const u32 gMapObjectPic_FigyBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/0.4bpp");
const u32 gMapObjectPic_FigyBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/1.4bpp");
const u32 gMapObjectPic_FigyBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/2.4bpp");
const u32 gMapObjectPic_FigyBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/3.4bpp");
const u32 gMapObjectPic_FigyBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/4.4bpp");
const u32 gMapObjectPic_FigyBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/figy/5.4bpp");
const u32 gMapObjectPic_MagoBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/0.4bpp");
const u32 gMapObjectPic_MagoBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/1.4bpp");
const u32 gMapObjectPic_MagoBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/2.4bpp");
const u32 gMapObjectPic_MagoBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/3.4bpp");
const u32 gMapObjectPic_MagoBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/4.4bpp");
const u32 gMapObjectPic_MagoBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/mago/5.4bpp");
const u32 gMapObjectPic_LumBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/0.4bpp");
const u32 gMapObjectPic_LumBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/1.4bpp");
const u32 gMapObjectPic_LumBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/2.4bpp");
const u32 gMapObjectPic_LumBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/3.4bpp");
const u32 gMapObjectPic_LumBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/4.4bpp");
const u32 gMapObjectPic_LumBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lum/5.4bpp");
const u32 gMapObjectPic_RazzBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/0.4bpp");
const u32 gMapObjectPic_RazzBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/1.4bpp");
const u32 gMapObjectPic_RazzBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/2.4bpp");
const u32 gMapObjectPic_RazzBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/3.4bpp");
const u32 gMapObjectPic_RazzBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/4.4bpp");
const u32 gMapObjectPic_RazzBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/razz/5.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/0.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/1.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/2.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/3.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/4.4bpp");
const u32 gMapObjectPic_GrepaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/grepa/5.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/0.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/1.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/2.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/3.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/4.4bpp");
const u32 gMapObjectPic_RabutaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rabuta/5.4bpp");
const u32 gMapObjectPic_NomelBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/0.4bpp");
const u32 gMapObjectPic_NomelBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/1.4bpp");
const u32 gMapObjectPic_NomelBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/2.4bpp");
const u32 gMapObjectPic_NomelBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/3.4bpp");
const u32 gMapObjectPic_NomelBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/4.4bpp");
const u32 gMapObjectPic_NomelBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/nomel/5.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/0.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/1.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/2.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/3.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/4.4bpp");
const u32 gMapObjectPic_LeppaBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/leppa/5.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/0.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/1.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/2.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/3.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/4.4bpp");
const u32 gMapObjectPic_LiechiBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/liechi/5.4bpp");
const u32 gMapObjectPic_HondewBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/0.4bpp");
const u32 gMapObjectPic_HondewBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/1.4bpp");
const u32 gMapObjectPic_HondewBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/2.4bpp");
const u32 gMapObjectPic_HondewBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/3.4bpp");
const u32 gMapObjectPic_HondewBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/4.4bpp");
const u32 gMapObjectPic_HondewBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/hondew/5.4bpp");
const u32 gMapObjectPic_AguavBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/0.4bpp");
const u32 gMapObjectPic_AguavBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/1.4bpp");
const u32 gMapObjectPic_AguavBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/2.4bpp");
const u32 gMapObjectPic_AguavBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/3.4bpp");
const u32 gMapObjectPic_AguavBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/4.4bpp");
const u32 gMapObjectPic_AguavBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aguav/5.4bpp");
const u32 gMapObjectPic_WikiBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/0.4bpp");
const u32 gMapObjectPic_WikiBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/1.4bpp");
const u32 gMapObjectPic_WikiBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/2.4bpp");
const u32 gMapObjectPic_WikiBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/3.4bpp");
const u32 gMapObjectPic_WikiBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/4.4bpp");
const u32 gMapObjectPic_WikiBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/wiki/5.4bpp");
const u32 gMapObjectPic_PomegBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/0.4bpp");
const u32 gMapObjectPic_PomegBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/1.4bpp");
const u32 gMapObjectPic_PomegBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/2.4bpp");
const u32 gMapObjectPic_PomegBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/3.4bpp");
const u32 gMapObjectPic_PomegBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/4.4bpp");
const u32 gMapObjectPic_PomegBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pomeg/5.4bpp");
const u32 gMapObjectPic_RawstBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/0.4bpp");
const u32 gMapObjectPic_RawstBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/1.4bpp");
const u32 gMapObjectPic_RawstBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/2.4bpp");
const u32 gMapObjectPic_RawstBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/3.4bpp");
const u32 gMapObjectPic_RawstBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/4.4bpp");
const u32 gMapObjectPic_RawstBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/rawst/5.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/0.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/1.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/2.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/3.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/4.4bpp");
const u32 gMapObjectPic_SpelonBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/spelon/5.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/0.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/1.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/2.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/3.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/4.4bpp");
const u32 gMapObjectPic_ChestoBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/chesto/5.4bpp");
const u32 gMapObjectPic_OranBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/0.4bpp");
const u32 gMapObjectPic_OranBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/1.4bpp");
const u32 gMapObjectPic_OranBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/2.4bpp");
const u32 gMapObjectPic_OranBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/3.4bpp");
const u32 gMapObjectPic_OranBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/4.4bpp");
const u32 gMapObjectPic_OranBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/oran/5.4bpp");
const u32 gMapObjectPic_PersimBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/0.4bpp");
const u32 gMapObjectPic_PersimBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/1.4bpp");
const u32 gMapObjectPic_PersimBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/2.4bpp");
const u32 gMapObjectPic_PersimBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/3.4bpp");
const u32 gMapObjectPic_PersimBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/4.4bpp");
const u32 gMapObjectPic_PersimBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/persim/5.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/0.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/1.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/2.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/3.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/4.4bpp");
const u32 gMapObjectPic_SitrusBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/sitrus/5.4bpp");
const u32 gMapObjectPic_AspearBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/0.4bpp");
const u32 gMapObjectPic_AspearBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/1.4bpp");
const u32 gMapObjectPic_AspearBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/2.4bpp");
const u32 gMapObjectPic_AspearBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/3.4bpp");
const u32 gMapObjectPic_AspearBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/4.4bpp");
const u32 gMapObjectPic_AspearBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/aspear/5.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/0.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/1.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/2.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/3.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/4.4bpp");
const u32 gMapObjectPic_PamtreBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/pamtre/5.4bpp");
const u32 gMapObjectPic_CornnBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/0.4bpp");
const u32 gMapObjectPic_CornnBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/1.4bpp");
const u32 gMapObjectPic_CornnBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/2.4bpp");
const u32 gMapObjectPic_CornnBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/3.4bpp");
const u32 gMapObjectPic_CornnBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/4.4bpp");
const u32 gMapObjectPic_CornnBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/cornn/5.4bpp");
const u32 gMapObjectPic_LansatBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/0.4bpp");
const u32 gMapObjectPic_LansatBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/1.4bpp");
const u32 gMapObjectPic_LansatBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/2.4bpp");
const u32 gMapObjectPic_LansatBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/3.4bpp");
const u32 gMapObjectPic_LansatBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/4.4bpp");
const u32 gMapObjectPic_LansatBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/lansat/5.4bpp");
const u32 gMapObjectPic_DurinBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/0.4bpp");
const u32 gMapObjectPic_DurinBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/1.4bpp");
const u32 gMapObjectPic_DurinBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/2.4bpp");
const u32 gMapObjectPic_DurinBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/3.4bpp");
const u32 gMapObjectPic_DurinBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/4.4bpp");
const u32 gMapObjectPic_DurinBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/durin/5.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_0[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/0.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_1[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/1.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_2[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/2.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_3[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/3.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_4[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/4.4bpp");
const u32 gMapObjectPic_TamatoBerryTree_5[] = INCBIN_U32("graphics/map_objects/pics/berry_trees/tamato/5.4bpp");
const u32 gFieldEffectPic_SurfBlob_0[] = INCBIN_U32("graphics/field_effect_objects/pics/surf_blob/0.4bpp");
const u32 gFieldEffectPic_SurfBlob_1[] = INCBIN_U32("graphics/field_effect_objects/pics/surf_blob/1.4bpp");
const u32 gFieldEffectPic_SurfBlob_2[] = INCBIN_U32("graphics/field_effect_objects/pics/surf_blob/2.4bpp");
const u32 gMapObjectPic_QuintyPlump_0[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/0.4bpp");
const u32 gMapObjectPic_QuintyPlump_1[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/1.4bpp");
const u32 gMapObjectPic_QuintyPlump_2[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/2.4bpp");
const u32 gMapObjectPic_QuintyPlump_3[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/3.4bpp");
const u32 gMapObjectPic_QuintyPlump_4[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/4.4bpp");
const u32 gMapObjectPic_QuintyPlump_5[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/5.4bpp");
const u32 gMapObjectPic_QuintyPlump_6[] = INCBIN_U32("graphics/map_objects/pics/people/quinty_plump/6.4bpp");
const u16 gMapObjectPalette12[] = INCBIN_U16("graphics/map_objects/palettes/12.gbapal");
const u16 gMapObjectPalette13[] = INCBIN_U16("graphics/map_objects/palettes/13.gbapal");

const u32 gFieldEffectPic_ShadowSmall[] = INCBIN_U32("graphics/field_effect_objects/pics/shadow_small.4bpp");
const u32 gFieldEffectPic_ShadowMedium[] = INCBIN_U32("graphics/field_effect_objects/pics/shadow_medium.4bpp");
const u32 gFieldEffectPic_ShadowLarge[] = INCBIN_U32("graphics/field_effect_objects/pics/shadow_large.4bpp");
const u32 gFieldEffectPic_ShadowExtraLarge[] = INCBIN_U32("graphics/field_effect_objects/pics/shadow_extra_large.4bpp");
const u32 filler_8368A08[0x48] = {};
const u32 gFieldEffectPic_CutGrass[] = INCBIN_U32("graphics/field_effect_objects/pics/cut_grass.4bpp");
const u32 FieldEffectPic_CutGrass_Copy[] = INCBIN_U32("graphics/field_effect_objects/pics/cut_grass.4bpp");
const u16 gFieldEffectObjectPalette6[] = INCBIN_U16("graphics/field_effect_objects/palettes/06.gbapal");
const u32 gFieldEffectPic_Ripple_0[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/0.4bpp");
const u32 gFieldEffectPic_Ripple_1[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/1.4bpp");
const u32 gFieldEffectPic_Ripple_2[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/2.4bpp");
const u32 gFieldEffectPic_Ripple_3[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/3.4bpp");
const u32 gFieldEffectPic_Ripple_4[] = INCBIN_U32("graphics/field_effect_objects/pics/ripple/4.4bpp");
const u32 gFieldEffectPic_Ash_0[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/0.4bpp");
const u32 gFieldEffectPic_Ash_1[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/1.4bpp");
const u32 gFieldEffectPic_Ash_2[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/2.4bpp");
const u32 gFieldEffectPic_Ash_3[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/3.4bpp");
const u32 gFieldEffectPic_Ash_4[] = INCBIN_U32("graphics/field_effect_objects/pics/ash/4.4bpp");
const u32 gFieldEffectPic_Arrow_0[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/0.4bpp");
const u32 gFieldEffectPic_Arrow_1[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/1.4bpp");
const u32 gFieldEffectPic_Arrow_2[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/2.4bpp");
const u32 gFieldEffectPic_Arrow_3[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/3.4bpp");
const u32 gFieldEffectPic_Arrow_4[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/4.4bpp");
const u32 gFieldEffectPic_Arrow_5[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/5.4bpp");
const u32 gFieldEffectPic_Arrow_6[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/6.4bpp");
const u32 gFieldEffectPic_Arrow_7[] = INCBIN_U32("graphics/field_effect_objects/pics/arrow/7.4bpp");
const u16 gFieldEffectObjectPalette0[] = INCBIN_U16("graphics/field_effect_objects/palettes/00.gbapal");
const u16 gFieldEffectObjectPalette1[] = INCBIN_U16("graphics/field_effect_objects/palettes/01.gbapal");
const u32 gFieldEffectPic_Dust_0[] = INCBIN_U32("graphics/field_effect_objects/pics/dust/0.4bpp");
const u32 gFieldEffectPic_Dust_1[] = INCBIN_U32("graphics/field_effect_objects/pics/dust/1.4bpp");
const u32 gFieldEffectPic_Dust_2[] = INCBIN_U32("graphics/field_effect_objects/pics/dust/2.4bpp");
const u32 unknown_8369588[] = INCBIN_U32("graphics/field_effect_objects/unknown.bin");
const u32 gFieldEffectPic_JumpTallGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_tall_grass/0.4bpp");
const u32 gFieldEffectPic_JumpTallGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_tall_grass/1.4bpp");
const u32 gFieldEffectPic_JumpTallGrass_2[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_tall_grass/2.4bpp");
const u32 gFieldEffectPic_JumpTallGrass_3[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_tall_grass/3.4bpp");
const u32 UnusedGrass0[] = INCBIN_U32("graphics/field_effect_objects/pics/unused_grass/0.4bpp");
const u32 UnusedGrass1[] = INCBIN_U32("graphics/field_effect_objects/pics/unused_grass/1.4bpp");
const u32 UnusedGrass2[] = INCBIN_U32("graphics/field_effect_objects/pics/unused_grass/2.4bpp");
const u32 UnusedGrass3[] = INCBIN_U32("graphics/field_effect_objects/pics/unused_grass/3.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/0.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/1.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_2[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/2.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_3[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/3.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_4[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/4.4bpp");
const u32 UnusedGrassLong[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/unused.4bpp");
const u32 gFieldEffectPic_JumpLongGrass_5[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_long_grass/5.4bpp");
const u32 gFieldEffectPic_Unknown17_0[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/0.4bpp");
const u32 gFieldEffectPic_Unknown17_1[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/1.4bpp");
const u32 gFieldEffectPic_Unknown17_2[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/2.4bpp");
const u32 gFieldEffectPic_Unknown17_3[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/3.4bpp");
const u32 gFieldEffectPic_Unknown17_4[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/4.4bpp");
const u32 gFieldEffectPic_Unknown17_5[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/5.4bpp");
const u32 gFieldEffectPic_Unknown17_6[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/6.4bpp");
const u32 gFieldEffectPic_Unknown17_7[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_17/7.4bpp");
const u32 gFieldEffectPic_Unknown18_0[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_18/0.4bpp");
const u32 gFieldEffectPic_Unknown18_1[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_18/1.4bpp");
const u32 gFieldEffectPic_Unknown18_2[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_18/2.4bpp");
const u32 gFieldEffectPic_Unknown18_3[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_18/3.4bpp");
const u32 gFieldEffectPic_LongGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/long_grass/0.4bpp");
const u32 gFieldEffectPic_LongGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/long_grass/1.4bpp");
const u32 gFieldEffectPic_LongGrass_2[] = INCBIN_U32("graphics/field_effect_objects/pics/long_grass/2.4bpp");
const u32 gFieldEffectPic_LongGrass_3[] = INCBIN_U32("graphics/field_effect_objects/pics/long_grass/3.4bpp");
const u32 gFieldEffectPic_TallGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/0.4bpp");
const u32 gFieldEffectPic_TallGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/1.4bpp");
const u32 gFieldEffectPic_TallGrass_2[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/2.4bpp");
const u32 gFieldEffectPic_TallGrass_3[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/3.4bpp");
const u32 gFieldEffectPic_TallGrass_4[] = INCBIN_U32("graphics/field_effect_objects/pics/tall_grass/4.4bpp");
const u32 gFieldEffectPic_ShortGrass_0[] = INCBIN_U32("graphics/field_effect_objects/pics/short_grass/0.4bpp");
const u32 gFieldEffectPic_ShortGrass_1[] = INCBIN_U32("graphics/field_effect_objects/pics/short_grass/1.4bpp");
const u32 gFieldEffectPic_SandFootprints_0[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_footprints/0.4bpp");
const u32 gFieldEffectPic_SandFootprints_1[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_footprints/1.4bpp");
const u32 gFieldEffectPic_DeepSandFootprints_0[] = INCBIN_U32("graphics/field_effect_objects/pics/deep_sand_footprints/0.4bpp");
const u32 gFieldEffectPic_DeepSandFootprints_1[] = INCBIN_U32("graphics/field_effect_objects/pics/deep_sand_footprints/1.4bpp");
const u32 gFieldEffectPic_BikeTireTracks_0[] = INCBIN_U32("graphics/field_effect_objects/pics/bike_tire_tracks/0.4bpp");
const u32 gFieldEffectPic_BikeTireTracks_1[] = INCBIN_U32("graphics/field_effect_objects/pics/bike_tire_tracks/1.4bpp");
const u32 gFieldEffectPic_BikeTireTracks_2[] = INCBIN_U32("graphics/field_effect_objects/pics/bike_tire_tracks/2.4bpp");
const u32 gFieldEffectPic_BikeTireTracks_3[] = INCBIN_U32("graphics/field_effect_objects/pics/bike_tire_tracks/3.4bpp");
const u32 gFieldEffectPic_Unknown19_0[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_19/0.4bpp");
const u32 gFieldEffectPic_Unknown19_1[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_19/1.4bpp");
const u32 gFieldEffectPic_Unknown19_2[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_19/2.4bpp");
const u32 gFieldEffectPic_Unknown19_3[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_19/3.4bpp");
const u32 gFieldEffectPic_SandPile_0[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_pile/0.4bpp");
const u32 gFieldEffectPic_SandPile_1[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_pile/1.4bpp");
const u32 gFieldEffectPic_SandPile_2[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_pile/2.4bpp");
const u32 gFieldEffectPic_JumpBigSplash_0[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_big_splash/0.4bpp");
const u32 gFieldEffectPic_JumpBigSplash_1[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_big_splash/1.4bpp");
const u32 gFieldEffectPic_JumpBigSplash_2[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_big_splash/2.4bpp");
const u32 gFieldEffectPic_JumpBigSplash_3[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_big_splash/3.4bpp");
const u32 gFieldEffectPic_Splash_0[] = INCBIN_U32("graphics/field_effect_objects/pics/splash/0.4bpp");
const u32 gFieldEffectPic_Splash_1[] = INCBIN_U32("graphics/field_effect_objects/pics/splash/1.4bpp");
const u32 gFieldEffectPic_JumpSmallSplash_0[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_small_splash/0.4bpp");
const u32 gFieldEffectPic_JumpSmallSplash_1[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_small_splash/1.4bpp");
const u32 gFieldEffectPic_JumpSmallSplash_2[] = INCBIN_U32("graphics/field_effect_objects/pics/jump_small_splash/2.4bpp");
const u32 gFieldEffectPic_Unknown20_0[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/0.4bpp");
const u32 gFieldEffectPic_Unknown20_1[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/1.4bpp");
const u32 gFieldEffectPic_Unknown20_2[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/2.4bpp");
const u32 gFieldEffectPic_Unknown20_3[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/3.4bpp");
const u32 gFieldEffectPic_Unknown20_4[] = INCBIN_U32("graphics/field_effect_objects/pics/unknown_20/4.4bpp");
const u32 gFieldEffectPic_TreeDisguise_0[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/0.4bpp");
const u32 gFieldEffectPic_TreeDisguise_1[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/1.4bpp");
const u32 gFieldEffectPic_TreeDisguise_2[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/2.4bpp");
const u32 gFieldEffectPic_TreeDisguise_3[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/3.4bpp");
const u32 gFieldEffectPic_TreeDisguise_4[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/4.4bpp");
const u32 gFieldEffectPic_TreeDisguise_5[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/5.4bpp");
const u32 gFieldEffectPic_TreeDisguise_6[] = INCBIN_U32("graphics/field_effect_objects/pics/tree_disguise/6.4bpp");
const u32 gFieldEffectPic_MountainDisguise_0[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/0.4bpp");
const u32 gFieldEffectPic_MountainDisguise_1[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/1.4bpp");
const u32 gFieldEffectPic_MountainDisguise_2[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/2.4bpp");
const u32 gFieldEffectPic_MountainDisguise_3[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/3.4bpp");
const u32 gFieldEffectPic_MountainDisguise_4[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/4.4bpp");
const u32 gFieldEffectPic_MountainDisguise_5[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/5.4bpp");
const u32 gFieldEffectPic_MountainDisguise_6[] = INCBIN_U32("graphics/field_effect_objects/pics/mountain_disguise/6.4bpp");
const u32 gFieldEffectPic_SandDisguise_0[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/0.4bpp");
const u32 gFieldEffectPic_SandDisguise_1[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/1.4bpp");
const u32 gFieldEffectPic_SandDisguise_2[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/2.4bpp");
const u32 gFieldEffectPic_SandDisguise_3[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/3.4bpp");
const u32 gFieldEffectPic_SandDisguise_4[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/4.4bpp");
const u32 gFieldEffectPic_SandDisguise_5[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/5.4bpp");
const u32 gFieldEffectPic_SandDisguise_6[] = INCBIN_U32("graphics/field_effect_objects/pics/sand_disguise/6.4bpp");
const u32 gFieldEffectPic_HotSpringsWater[] = INCBIN_U32("graphics/field_effect_objects/pics/hot_springs_water.4bpp");
const u16 gFieldEffectObjectPalette2[] = INCBIN_U16("graphics/field_effect_objects/palettes/02.gbapal");
const u32 gFieldEffectPic_PopOutOfAsh_0[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/0.4bpp");
const u32 gFieldEffectPic_PopOutOfAsh_1[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/1.4bpp");
const u32 gFieldEffectPic_PopOutOfAsh_2[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/2.4bpp");
const u32 gFieldEffectPic_PopOutOfAsh_3[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/3.4bpp");
const u32 gFieldEffectPic_PopOutOfAsh_4[] = INCBIN_U32("graphics/field_effect_objects/pics/pop_out_of_ash/4.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_0[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/0.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_1[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/1.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_2[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/2.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_3[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/3.4bpp");
const u32 gFieldEffectPic_LavaridgeGymWarp_4[] = INCBIN_U32("graphics/field_effect_objects/pics/lavaridge_gym_warp/4.4bpp");
const u32 gFieldEffectPic_Bubbles_0[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/0.4bpp");
const u32 gFieldEffectPic_Bubbles_1[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/1.4bpp");
const u32 gFieldEffectPic_Bubbles_2[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/2.4bpp");
const u32 gFieldEffectPic_Bubbles_3[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/3.4bpp");
const u32 gFieldEffectPic_Bubbles_4[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/4.4bpp");
const u32 gFieldEffectPic_Bubbles_5[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/5.4bpp");
const u32 gFieldEffectPic_Bubbles_6[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/6.4bpp");
const u32 gFieldEffectPic_Bubbles_7[] = INCBIN_U32("graphics/field_effect_objects/pics/bubbles/7.4bpp");
const u32 gFieldEffectPic_Sparkle_0[] = INCBIN_U32("graphics/field_effect_objects/pics/sparkle/0.4bpp");
const u32 gFieldEffectPic_Sparkle_1[] = INCBIN_U32("graphics/field_effect_objects/pics/sparkle/1.4bpp");
const u16 gFieldEffectObjectPalette3[] = INCBIN_U16("graphics/field_effect_objects/palettes/03.gbapal");
const u32 gFieldEffectPic_Bird[] = INCBIN_U32("graphics/field_effect_objects/pics/bird.4bpp");

void (*const gUnknown_0836DA88[])(struct Sprite *) =
{
    sub_805C884,
    sub_805CDE8,
    sub_805C8AC,
    sub_805CF28,
    sub_805CF28,
    sub_805D0AC,
    sub_805D0AC,
    sub_805D230,
    sub_805D230,
    sub_805D230,
    sub_805D230,
    sub_80587B4,
    FieldObjectCB_BerryTree,
    sub_805D4F4,
    sub_805D634,
    sub_805D774,
    sub_805D8B4,
    sub_805D9F4,
    sub_805DB34,
    sub_805DC74,
    sub_805DDB4,
    sub_805DEF4,
    sub_805E034,
    sub_805E174,
    sub_805E278,
    sub_805E37C,
    sub_805E37C,
    sub_805E37C,
    sub_805E37C,
    sub_805E5DC,
    sub_805E668,
    sub_805E6F4,
    sub_805E780,
    sub_805E80C,
    sub_805E898,
    sub_805E924,
    sub_805E9B0,
    sub_805EA3C,
    sub_805EAC8,
    sub_805EB54,
    sub_805EBE0,
    sub_805EC6C,
    sub_805ECF8,
    sub_805ED84,
    sub_805EE10,
    sub_805EE9C,
    sub_805EF28,
    sub_805EFB4,
    sub_805F040,
    sub_805F0CC,
    sub_805F158,
    sub_805F1E4,
    sub_805F270,
    sub_805F2FC,
    sub_805F2FC,
    sub_805F2FC,
    sub_805F2FC,
    FieldObjectCB_TreeDisguise,
    FieldObjectCB_MountainDisguise,
    sub_805F8E0,
    sub_805F8E0,
    sub_805F8E0,
    sub_805F8E0,
    FieldObjectCB_Hidden1,
    sub_805FB20,
    sub_805FB20,
    sub_805FB20,
    sub_805FB20,
    sub_805FB90,
    sub_805FB90,
    sub_805FB90,
    sub_805FB90,
    sub_805FC00,
    sub_805FC00,
    sub_805FC00,
    sub_805FC00,
    sub_805FC70
};

const u8 gUnknown_0836DBBC[] = {0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
const u8 gUnknown_0836DC09[] = {DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_NORTH, DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_WEST, DIR_NORTH, DIR_WEST, DIR_SOUTH, DIR_EAST, DIR_WEST, DIR_NORTH, DIR_EAST, DIR_SOUTH, DIR_EAST, DIR_NORTH, DIR_WEST, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_SOUTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH, DIR_NORTH, DIR_WEST, DIR_EAST, DIR_SOUTH};


const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanNormal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanMachBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanSurfing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanFieldMove;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_QuintyPlump;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleGirl1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleGirl2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy4;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_FatMan;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldMan1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldWoman1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman4;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman5;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Cook;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman6;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldMan2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldWoman2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Camper;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Picnicker;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man4;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman7;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Youngster;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BugCatcher;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PsychicM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SchoolKidM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Maniac;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_HexManiac;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman8;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwimmerM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwimmerF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BlackBelt;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Beauty;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Scientist1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Lass;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Gentleman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Sailor;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Fisherman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RunningTriathleteM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RunningTriathleteF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Hiker;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyclingTriathleteM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyclingTriathleteF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Nurse;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ItemBall;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTree;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTreeEarlyStages;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTreeLateStages;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanAcroBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ProfBirch;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man5;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man6;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ReporterM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ReporterF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Bard;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Hipster;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Trader;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Storyteller;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Giddy;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMauvilleOldMan1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMauvilleOldMan2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedNatuDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMagnemiteDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedSquirtleDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedWooperDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedPikachuDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedPorygon2Doll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CuttableTree;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MartEmployee;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RooftopSaleWoman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Teala;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BreakableRock;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PushableBoulder;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MrBrineysBoat;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayNormal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayMachBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayAcroBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MaySurfing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayFieldMove;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Truck;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MachokeCarryingBox;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MachokeFacingAway;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BirchsBag;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Poochyena;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Artist;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanNormal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanMachBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanAcroBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanSurfing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanFieldMove;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayNormal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayMachBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayAcroBike;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMaySurfing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayFieldMove;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Cameraman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanUnderwater;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayUnderwater;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MovingBox;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CableCar;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Scientist2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man7;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AquaMemberM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AquaMemberF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MagmaMemberM;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MagmaMemberF;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Sidney;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Phoebe;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Glacia;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Drake;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Roxanne;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Brawly;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wattson;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Flannery;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Norman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Winona;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Liza;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Tate;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wallace;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Steven;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wally;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy3;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanFishing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayFishing;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_HotSpringsOldWoman;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SSTidal;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SubmarineShadow;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PichuDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PikachuDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MarillDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TogepiDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyndaquilDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ChikoritaDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TotodileDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_JigglypuffDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MeowthDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ClefairyDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DittoDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SmoochumDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TreeckoDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TorchicDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MudkipDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DuskullDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_WynautDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BaltoyDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_KecleonDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AzurillDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SkittyDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwabluDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_GulpinDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LotadDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SeedotDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PikaCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RoundCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_KissCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ZigzagCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SpinCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DiamondCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BallCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_GrassCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_FireCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_WaterCushion;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigSnorlaxDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRhydonDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigLaprasDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigVenusaurDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigCharizardDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigBlastoiseDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigWailmerDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegirockDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegiceDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegisteelDoll;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Latias;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Latios;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy5;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ContestJudge;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanWatering;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayWatering;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanDecorating;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayDecorating;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Archie;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Maxie;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kyogre1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Groudon1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Fossil;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Regirock;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Regice;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Registeel;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Skitty;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kecleon1;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kyogre2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Groudon2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Rayquaza;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Zigzagoon;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Pikachu;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Azumarill;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wingull;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kecleon2;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberMSwimming;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Azurill;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Mom;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LinkBrendan;
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LinkMay;

const struct MapObjectGraphicsInfo *const gMapObjectGraphicsInfoPointers[] = {
    &gMapObjectGraphicsInfo_BrendanNormal,
    &gMapObjectGraphicsInfo_BrendanMachBike,
    &gMapObjectGraphicsInfo_BrendanSurfing,
    &gMapObjectGraphicsInfo_BrendanFieldMove,
    &gMapObjectGraphicsInfo_QuintyPlump,
    &gMapObjectGraphicsInfo_LittleBoy1,
    &gMapObjectGraphicsInfo_LittleGirl1,
    &gMapObjectGraphicsInfo_Boy1,
    &gMapObjectGraphicsInfo_Girl1,
    &gMapObjectGraphicsInfo_Boy2,
    &gMapObjectGraphicsInfo_Girl2,
    &gMapObjectGraphicsInfo_LittleBoy2,
    &gMapObjectGraphicsInfo_LittleGirl2,
    &gMapObjectGraphicsInfo_Boy3,
    &gMapObjectGraphicsInfo_Girl3,
    &gMapObjectGraphicsInfo_Boy4,
    &gMapObjectGraphicsInfo_Woman1,
    &gMapObjectGraphicsInfo_FatMan,
    &gMapObjectGraphicsInfo_Woman2,
    &gMapObjectGraphicsInfo_Man1,
    &gMapObjectGraphicsInfo_Woman3,
    &gMapObjectGraphicsInfo_OldMan1,
    &gMapObjectGraphicsInfo_OldWoman1,
    &gMapObjectGraphicsInfo_Man2,
    &gMapObjectGraphicsInfo_Woman4,
    &gMapObjectGraphicsInfo_Man3,
    &gMapObjectGraphicsInfo_Woman5,
    &gMapObjectGraphicsInfo_Cook,
    &gMapObjectGraphicsInfo_Woman6,
    &gMapObjectGraphicsInfo_OldMan2,
    &gMapObjectGraphicsInfo_OldWoman2,
    &gMapObjectGraphicsInfo_Camper,
    &gMapObjectGraphicsInfo_Picnicker,
    &gMapObjectGraphicsInfo_Man4,
    &gMapObjectGraphicsInfo_Woman7,
    &gMapObjectGraphicsInfo_Youngster,
    &gMapObjectGraphicsInfo_BugCatcher,
    &gMapObjectGraphicsInfo_PsychicM,
    &gMapObjectGraphicsInfo_SchoolKidM,
    &gMapObjectGraphicsInfo_Maniac,
    &gMapObjectGraphicsInfo_HexManiac,
    &gMapObjectGraphicsInfo_Woman8,
    &gMapObjectGraphicsInfo_SwimmerM,
    &gMapObjectGraphicsInfo_SwimmerF,
    &gMapObjectGraphicsInfo_BlackBelt,
    &gMapObjectGraphicsInfo_Beauty,
    &gMapObjectGraphicsInfo_Scientist1,
    &gMapObjectGraphicsInfo_Lass,
    &gMapObjectGraphicsInfo_Gentleman,
    &gMapObjectGraphicsInfo_Sailor,
    &gMapObjectGraphicsInfo_Fisherman,
    &gMapObjectGraphicsInfo_RunningTriathleteM,
    &gMapObjectGraphicsInfo_RunningTriathleteF,
    &gMapObjectGraphicsInfo_TuberF,
    &gMapObjectGraphicsInfo_TuberM,
    &gMapObjectGraphicsInfo_Hiker,
    &gMapObjectGraphicsInfo_CyclingTriathleteM,
    &gMapObjectGraphicsInfo_CyclingTriathleteF,
    &gMapObjectGraphicsInfo_Nurse,
    &gMapObjectGraphicsInfo_ItemBall,
    &gMapObjectGraphicsInfo_BerryTree,
    &gMapObjectGraphicsInfo_BerryTreeEarlyStages,
    &gMapObjectGraphicsInfo_BerryTreeLateStages,
    &gMapObjectGraphicsInfo_BrendanAcroBike,
    &gMapObjectGraphicsInfo_ProfBirch,
    &gMapObjectGraphicsInfo_Man5,
    &gMapObjectGraphicsInfo_Man6,
    &gMapObjectGraphicsInfo_ReporterM,
    &gMapObjectGraphicsInfo_ReporterF,
    &gMapObjectGraphicsInfo_Bard,
    &gMapObjectGraphicsInfo_Hipster,
    &gMapObjectGraphicsInfo_Trader,
    &gMapObjectGraphicsInfo_Storyteller,
    &gMapObjectGraphicsInfo_Giddy,
    &gMapObjectGraphicsInfo_UnusedMauvilleOldMan1,
    &gMapObjectGraphicsInfo_UnusedMauvilleOldMan2,
    &gMapObjectGraphicsInfo_UnusedNatuDoll,
    &gMapObjectGraphicsInfo_UnusedMagnemiteDoll,
    &gMapObjectGraphicsInfo_UnusedSquirtleDoll,
    &gMapObjectGraphicsInfo_UnusedWooperDoll,
    &gMapObjectGraphicsInfo_UnusedPikachuDoll,
    &gMapObjectGraphicsInfo_UnusedPorygon2Doll,
    &gMapObjectGraphicsInfo_CuttableTree,
    &gMapObjectGraphicsInfo_MartEmployee,
    &gMapObjectGraphicsInfo_RooftopSaleWoman,
    &gMapObjectGraphicsInfo_Teala,
    &gMapObjectGraphicsInfo_BreakableRock,
    &gMapObjectGraphicsInfo_PushableBoulder,
    &gMapObjectGraphicsInfo_MrBrineysBoat,
    &gMapObjectGraphicsInfo_MayNormal,
    &gMapObjectGraphicsInfo_MayMachBike,
    &gMapObjectGraphicsInfo_MayAcroBike,
    &gMapObjectGraphicsInfo_MaySurfing,
    &gMapObjectGraphicsInfo_MayFieldMove,
    &gMapObjectGraphicsInfo_Truck,
    &gMapObjectGraphicsInfo_MachokeCarryingBox,
    &gMapObjectGraphicsInfo_MachokeFacingAway,
    &gMapObjectGraphicsInfo_BirchsBag,
    &gMapObjectGraphicsInfo_Poochyena,
    &gMapObjectGraphicsInfo_Artist,
    &gMapObjectGraphicsInfo_RivalBrendanNormal,
    &gMapObjectGraphicsInfo_RivalBrendanMachBike,
    &gMapObjectGraphicsInfo_RivalBrendanAcroBike,
    &gMapObjectGraphicsInfo_RivalBrendanSurfing,
    &gMapObjectGraphicsInfo_RivalBrendanFieldMove,
    &gMapObjectGraphicsInfo_RivalMayNormal,
    &gMapObjectGraphicsInfo_RivalMayMachBike,
    &gMapObjectGraphicsInfo_RivalMayAcroBike,
    &gMapObjectGraphicsInfo_RivalMaySurfing,
    &gMapObjectGraphicsInfo_RivalMayFieldMove,
    &gMapObjectGraphicsInfo_Cameraman,
    &gMapObjectGraphicsInfo_BrendanUnderwater,
    &gMapObjectGraphicsInfo_MayUnderwater,
    &gMapObjectGraphicsInfo_MovingBox,
    &gMapObjectGraphicsInfo_CableCar,
    &gMapObjectGraphicsInfo_Scientist2,
    &gMapObjectGraphicsInfo_Man7,
    &gMapObjectGraphicsInfo_AquaMemberM,
    &gMapObjectGraphicsInfo_AquaMemberF,
    &gMapObjectGraphicsInfo_MagmaMemberM,
    &gMapObjectGraphicsInfo_MagmaMemberF,
    &gMapObjectGraphicsInfo_Sidney,
    &gMapObjectGraphicsInfo_Phoebe,
    &gMapObjectGraphicsInfo_Glacia,
    &gMapObjectGraphicsInfo_Drake,
    &gMapObjectGraphicsInfo_Roxanne,
    &gMapObjectGraphicsInfo_Brawly,
    &gMapObjectGraphicsInfo_Wattson,
    &gMapObjectGraphicsInfo_Flannery,
    &gMapObjectGraphicsInfo_Norman,
    &gMapObjectGraphicsInfo_Winona,
    &gMapObjectGraphicsInfo_Liza,
    &gMapObjectGraphicsInfo_Tate,
    &gMapObjectGraphicsInfo_Wallace,
    &gMapObjectGraphicsInfo_Steven,
    &gMapObjectGraphicsInfo_Wally,
    &gMapObjectGraphicsInfo_LittleBoy3,
    &gMapObjectGraphicsInfo_BrendanFishing,
    &gMapObjectGraphicsInfo_MayFishing,
    &gMapObjectGraphicsInfo_HotSpringsOldWoman,
    &gMapObjectGraphicsInfo_SSTidal,
    &gMapObjectGraphicsInfo_SubmarineShadow,
    &gMapObjectGraphicsInfo_PichuDoll,
    &gMapObjectGraphicsInfo_PikachuDoll,
    &gMapObjectGraphicsInfo_MarillDoll,
    &gMapObjectGraphicsInfo_TogepiDoll,
    &gMapObjectGraphicsInfo_CyndaquilDoll,
    &gMapObjectGraphicsInfo_ChikoritaDoll,
    &gMapObjectGraphicsInfo_TotodileDoll,
    &gMapObjectGraphicsInfo_JigglypuffDoll,
    &gMapObjectGraphicsInfo_MeowthDoll,
    &gMapObjectGraphicsInfo_ClefairyDoll,
    &gMapObjectGraphicsInfo_DittoDoll,
    &gMapObjectGraphicsInfo_SmoochumDoll,
    &gMapObjectGraphicsInfo_TreeckoDoll,
    &gMapObjectGraphicsInfo_TorchicDoll,
    &gMapObjectGraphicsInfo_MudkipDoll,
    &gMapObjectGraphicsInfo_DuskullDoll,
    &gMapObjectGraphicsInfo_WynautDoll,
    &gMapObjectGraphicsInfo_BaltoyDoll,
    &gMapObjectGraphicsInfo_KecleonDoll,
    &gMapObjectGraphicsInfo_AzurillDoll,
    &gMapObjectGraphicsInfo_SkittyDoll,
    &gMapObjectGraphicsInfo_SwabluDoll,
    &gMapObjectGraphicsInfo_GulpinDoll,
    &gMapObjectGraphicsInfo_LotadDoll,
    &gMapObjectGraphicsInfo_SeedotDoll,
    &gMapObjectGraphicsInfo_PikaCushion,
    &gMapObjectGraphicsInfo_RoundCushion,
    &gMapObjectGraphicsInfo_KissCushion,
    &gMapObjectGraphicsInfo_ZigzagCushion,
    &gMapObjectGraphicsInfo_SpinCushion,
    &gMapObjectGraphicsInfo_DiamondCushion,
    &gMapObjectGraphicsInfo_BallCushion,
    &gMapObjectGraphicsInfo_GrassCushion,
    &gMapObjectGraphicsInfo_FireCushion,
    &gMapObjectGraphicsInfo_WaterCushion,
    &gMapObjectGraphicsInfo_BigSnorlaxDoll,
    &gMapObjectGraphicsInfo_BigRhydonDoll,
    &gMapObjectGraphicsInfo_BigLaprasDoll,
    &gMapObjectGraphicsInfo_BigVenusaurDoll,
    &gMapObjectGraphicsInfo_BigCharizardDoll,
    &gMapObjectGraphicsInfo_BigBlastoiseDoll,
    &gMapObjectGraphicsInfo_BigWailmerDoll,
    &gMapObjectGraphicsInfo_BigRegirockDoll,
    &gMapObjectGraphicsInfo_BigRegiceDoll,
    &gMapObjectGraphicsInfo_BigRegisteelDoll,
    &gMapObjectGraphicsInfo_Latias,
    &gMapObjectGraphicsInfo_Latios,
    &gMapObjectGraphicsInfo_Boy5,
    &gMapObjectGraphicsInfo_ContestJudge,
    &gMapObjectGraphicsInfo_BrendanWatering,
    &gMapObjectGraphicsInfo_MayWatering,
    &gMapObjectGraphicsInfo_BrendanDecorating,
    &gMapObjectGraphicsInfo_MayDecorating,
    &gMapObjectGraphicsInfo_Archie,
    &gMapObjectGraphicsInfo_Maxie,
    &gMapObjectGraphicsInfo_Kyogre1,
    &gMapObjectGraphicsInfo_Groudon1,
    &gMapObjectGraphicsInfo_Fossil,
    &gMapObjectGraphicsInfo_Regirock,
    &gMapObjectGraphicsInfo_Regice,
    &gMapObjectGraphicsInfo_Registeel,
    &gMapObjectGraphicsInfo_Skitty,
    &gMapObjectGraphicsInfo_Kecleon1,
    &gMapObjectGraphicsInfo_Kyogre2,
    &gMapObjectGraphicsInfo_Groudon2,
    &gMapObjectGraphicsInfo_Rayquaza,
    &gMapObjectGraphicsInfo_Zigzagoon,
    &gMapObjectGraphicsInfo_Pikachu,
    &gMapObjectGraphicsInfo_Azumarill,
    &gMapObjectGraphicsInfo_Wingull,
    &gMapObjectGraphicsInfo_Kecleon2,
    &gMapObjectGraphicsInfo_TuberMSwimming,
    &gMapObjectGraphicsInfo_Azurill,
    &gMapObjectGraphicsInfo_Mom,
    &gMapObjectGraphicsInfo_LinkBrendan,
    &gMapObjectGraphicsInfo_LinkMay
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowSmall;
const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowMedium;
const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowLarge;
const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowExtraLarge;
const struct SpriteTemplate gFieldEffectSpriteTemplate_TallGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Ripple;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Ash;
const struct SpriteTemplate gFieldEffectSpriteTemplate_SurfBlob;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Arrow;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Dust;
const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpTallGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_SandFootprints;
const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpBigSplash;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Splash;
const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpSmallSplash;
const struct SpriteTemplate gFieldEffectSpriteTemplate_LongGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpLongGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown17;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown18;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown19;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown20;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown21;
const struct SpriteTemplate gFieldEffectSpriteTemplate_BerryTreeGrowthSparkle;
const struct SpriteTemplate gFieldEffectSpriteTemplate_DeepSandFootprints;
const struct SpriteTemplate gFieldEffectSpriteTemplate_TreeDisguise;
const struct SpriteTemplate gFieldEffectSpriteTemplate_MountainDisguise;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Bird;
const struct SpriteTemplate gFieldEffectSpriteTemplate_BikeTireTracks;
const struct SpriteTemplate gFieldEffectSpriteTemplate_SandDisguise;
const struct SpriteTemplate gFieldEffectSpriteTemplate_SandPile;
const struct SpriteTemplate gFieldEffectSpriteTemplate_ShortGrass;
const struct SpriteTemplate gFieldEffectSpriteTemplate_HotSpringsWater;
const struct SpriteTemplate gFieldEffectSpriteTemplate_PopOutOfAsh;
const struct SpriteTemplate gFieldEffectSpriteTemplate_LavaridgeGymWarp;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Bubbles;
const struct SpriteTemplate gFieldEffectSpriteTemplate_Sparkle;

const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[] = {
    &gFieldEffectSpriteTemplate_ShadowSmall,
    &gFieldEffectSpriteTemplate_ShadowMedium,
    &gFieldEffectSpriteTemplate_ShadowLarge,
    &gFieldEffectSpriteTemplate_ShadowExtraLarge,
    &gFieldEffectSpriteTemplate_TallGrass,
    &gFieldEffectSpriteTemplate_Ripple,
    &gFieldEffectSpriteTemplate_Ash,
    &gFieldEffectSpriteTemplate_SurfBlob,
    &gFieldEffectSpriteTemplate_Arrow,
    &gFieldEffectSpriteTemplate_Dust,
    &gFieldEffectSpriteTemplate_JumpTallGrass,
    &gFieldEffectSpriteTemplate_SandFootprints,
    &gFieldEffectSpriteTemplate_JumpBigSplash,
    &gFieldEffectSpriteTemplate_Splash,
    &gFieldEffectSpriteTemplate_JumpSmallSplash,
    &gFieldEffectSpriteTemplate_LongGrass,
    &gFieldEffectSpriteTemplate_JumpLongGrass,
    &gFieldEffectSpriteTemplate_Unknown17,
    &gFieldEffectSpriteTemplate_Unknown18,
    &gFieldEffectSpriteTemplate_Unknown19,
    &gFieldEffectSpriteTemplate_Unknown20,
    &gFieldEffectSpriteTemplate_Unknown21,
    &gFieldEffectSpriteTemplate_BerryTreeGrowthSparkle,
    &gFieldEffectSpriteTemplate_DeepSandFootprints,
    &gFieldEffectSpriteTemplate_TreeDisguise,
    &gFieldEffectSpriteTemplate_MountainDisguise,
    &gFieldEffectSpriteTemplate_Bird,
    &gFieldEffectSpriteTemplate_BikeTireTracks,
    &gFieldEffectSpriteTemplate_SandDisguise,
    &gFieldEffectSpriteTemplate_SandPile,
    &gFieldEffectSpriteTemplate_ShortGrass,
    &gFieldEffectSpriteTemplate_HotSpringsWater,
    &gFieldEffectSpriteTemplate_PopOutOfAsh,
    &gFieldEffectSpriteTemplate_LavaridgeGymWarp,
    &gFieldEffectSpriteTemplate_Bubbles,
    &gFieldEffectSpriteTemplate_Sparkle
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanNormal[] = {
    obj_frame_tiles(gMapObjectPic_BrendanNormal_0),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_1),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_2),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_3),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_4),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_5),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_6),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_7),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_8),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_9),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_10),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_11),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_12),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_13),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_14),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_15),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_16),
    obj_frame_tiles(gMapObjectPic_BrendanNormal_17)
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanMachBike[] = {
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_0),
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_1),
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_2),
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_3),
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_4),
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_5),
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_6),
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_7),
    obj_frame_tiles(gMapObjectPic_BrendanMachBike_8)
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanAcroBike[] = {
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_0),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_1),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_2),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_3),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_4),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_5),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_6),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_7),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_8),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_9),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_10),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_11),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_12),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_13),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_14),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_15),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_16),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_17),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_18),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_19),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_20),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_21),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_22),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_23),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_24),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_25),
    obj_frame_tiles(gMapObjectPic_BrendanAcroBike_26)
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanSurfing[] = {
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_0),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_1),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_2),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_0),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_0),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_1),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_1),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_2),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_2),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_3),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_4),
    obj_frame_tiles(gMapObjectPic_BrendanSurfing_5)
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanUnderwater[] = {
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_0),
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_1),
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_2),
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_0),
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_0),
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_1),
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_1),
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_2),
    obj_frame_tiles(gMapObjectPic_BrendanUnderwater_2)
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanFieldMove[] = {
    obj_frame_tiles(gMapObjectPic_BrendanFieldMove_0),
    obj_frame_tiles(gMapObjectPic_BrendanFieldMove_1),
    obj_frame_tiles(gMapObjectPic_BrendanFieldMove_2),
    obj_frame_tiles(gMapObjectPic_BrendanFieldMove_3),
    obj_frame_tiles(gMapObjectPic_BrendanFieldMove_4)
};

const struct SpriteFrameImage gMapObjectPicTable_QuintyPlump[] = {
    obj_frame_tiles(gMapObjectPic_QuintyPlump_0),
    obj_frame_tiles(gMapObjectPic_QuintyPlump_1),
    obj_frame_tiles(gMapObjectPic_QuintyPlump_2),
    obj_frame_tiles(gMapObjectPic_QuintyPlump_3),
    obj_frame_tiles(gMapObjectPic_QuintyPlump_4),
    obj_frame_tiles(gMapObjectPic_QuintyPlump_5),
    obj_frame_tiles(gMapObjectPic_QuintyPlump_6)
};

const struct SpriteFrameImage gMapObjectPicTable_LittleBoy1[] = {
    obj_frame_tiles(gMapObjectPic_LittleBoy1_0),
    obj_frame_tiles(gMapObjectPic_LittleBoy1_1),
    obj_frame_tiles(gMapObjectPic_LittleBoy1_2),
    obj_frame_tiles(gMapObjectPic_LittleBoy1_3),
    obj_frame_tiles(gMapObjectPic_LittleBoy1_4),
    obj_frame_tiles(gMapObjectPic_LittleBoy1_5),
    obj_frame_tiles(gMapObjectPic_LittleBoy1_6),
    obj_frame_tiles(gMapObjectPic_LittleBoy1_7),
    obj_frame_tiles(gMapObjectPic_LittleBoy1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_LittleGirl1[] = {
    obj_frame_tiles(gMapObjectPic_LittleGirl1_0),
    obj_frame_tiles(gMapObjectPic_LittleGirl1_1),
    obj_frame_tiles(gMapObjectPic_LittleGirl1_2),
    obj_frame_tiles(gMapObjectPic_LittleGirl1_3),
    obj_frame_tiles(gMapObjectPic_LittleGirl1_4),
    obj_frame_tiles(gMapObjectPic_LittleGirl1_5),
    obj_frame_tiles(gMapObjectPic_LittleGirl1_6),
    obj_frame_tiles(gMapObjectPic_LittleGirl1_7),
    obj_frame_tiles(gMapObjectPic_LittleGirl1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Boy1[] = {
    obj_frame_tiles(gMapObjectPic_Boy1_0),
    obj_frame_tiles(gMapObjectPic_Boy1_1),
    obj_frame_tiles(gMapObjectPic_Boy1_2),
    obj_frame_tiles(gMapObjectPic_Boy1_3),
    obj_frame_tiles(gMapObjectPic_Boy1_4),
    obj_frame_tiles(gMapObjectPic_Boy1_5),
    obj_frame_tiles(gMapObjectPic_Boy1_6),
    obj_frame_tiles(gMapObjectPic_Boy1_7),
    obj_frame_tiles(gMapObjectPic_Boy1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Girl1[] = {
    obj_frame_tiles(gMapObjectPic_Girl1_0),
    obj_frame_tiles(gMapObjectPic_Girl1_1),
    obj_frame_tiles(gMapObjectPic_Girl1_2),
    obj_frame_tiles(gMapObjectPic_Girl1_3),
    obj_frame_tiles(gMapObjectPic_Girl1_4),
    obj_frame_tiles(gMapObjectPic_Girl1_5),
    obj_frame_tiles(gMapObjectPic_Girl1_6),
    obj_frame_tiles(gMapObjectPic_Girl1_7),
    obj_frame_tiles(gMapObjectPic_Girl1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Boy2[] = {
    obj_frame_tiles(gMapObjectPic_Boy2_0),
    obj_frame_tiles(gMapObjectPic_Boy2_1),
    obj_frame_tiles(gMapObjectPic_Boy2_2),
    obj_frame_tiles(gMapObjectPic_Boy2_3),
    obj_frame_tiles(gMapObjectPic_Boy2_4),
    obj_frame_tiles(gMapObjectPic_Boy2_5),
    obj_frame_tiles(gMapObjectPic_Boy2_6),
    obj_frame_tiles(gMapObjectPic_Boy2_7),
    obj_frame_tiles(gMapObjectPic_Boy2_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Girl2[] = {
    obj_frame_tiles(gMapObjectPic_Girl2_0),
    obj_frame_tiles(gMapObjectPic_Girl2_1),
    obj_frame_tiles(gMapObjectPic_Girl2_2),
    obj_frame_tiles(gMapObjectPic_Girl2_3),
    obj_frame_tiles(gMapObjectPic_Girl2_4),
    obj_frame_tiles(gMapObjectPic_Girl2_5),
    obj_frame_tiles(gMapObjectPic_Girl2_6),
    obj_frame_tiles(gMapObjectPic_Girl2_7),
    obj_frame_tiles(gMapObjectPic_Girl2_8)
};

const struct SpriteFrameImage gMapObjectPicTable_LittleBoy2[] = {
    obj_frame_tiles(gMapObjectPic_LittleBoy2_0),
    obj_frame_tiles(gMapObjectPic_LittleBoy2_1),
    obj_frame_tiles(gMapObjectPic_LittleBoy2_2),
    obj_frame_tiles(gMapObjectPic_LittleBoy2_3),
    obj_frame_tiles(gMapObjectPic_LittleBoy2_4),
    obj_frame_tiles(gMapObjectPic_LittleBoy2_5),
    obj_frame_tiles(gMapObjectPic_LittleBoy2_6),
    obj_frame_tiles(gMapObjectPic_LittleBoy2_7),
    obj_frame_tiles(gMapObjectPic_LittleBoy2_8)
};

const struct SpriteFrameImage gMapObjectPicTable_LittleGirl2[] = {
    obj_frame_tiles(gMapObjectPic_LittleGirl2_0),
    obj_frame_tiles(gMapObjectPic_LittleGirl2_1),
    obj_frame_tiles(gMapObjectPic_LittleGirl2_2),
    obj_frame_tiles(gMapObjectPic_LittleGirl2_3),
    obj_frame_tiles(gMapObjectPic_LittleGirl2_4),
    obj_frame_tiles(gMapObjectPic_LittleGirl2_5),
    obj_frame_tiles(gMapObjectPic_LittleGirl2_6),
    obj_frame_tiles(gMapObjectPic_LittleGirl2_7),
    obj_frame_tiles(gMapObjectPic_LittleGirl2_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Boy3[] = {
    obj_frame_tiles(gMapObjectPic_Boy3_0),
    obj_frame_tiles(gMapObjectPic_Boy3_1),
    obj_frame_tiles(gMapObjectPic_Boy3_2),
    obj_frame_tiles(gMapObjectPic_Boy3_3),
    obj_frame_tiles(gMapObjectPic_Boy3_4),
    obj_frame_tiles(gMapObjectPic_Boy3_5),
    obj_frame_tiles(gMapObjectPic_Boy3_6),
    obj_frame_tiles(gMapObjectPic_Boy3_7),
    obj_frame_tiles(gMapObjectPic_Boy3_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Girl3[] = {
    obj_frame_tiles(gMapObjectPic_Girl3_0),
    obj_frame_tiles(gMapObjectPic_Girl3_1),
    obj_frame_tiles(gMapObjectPic_Girl3_2),
    obj_frame_tiles(gMapObjectPic_Girl3_3),
    obj_frame_tiles(gMapObjectPic_Girl3_4),
    obj_frame_tiles(gMapObjectPic_Girl3_5),
    obj_frame_tiles(gMapObjectPic_Girl3_6),
    obj_frame_tiles(gMapObjectPic_Girl3_7),
    obj_frame_tiles(gMapObjectPic_Girl3_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Boy4[] = {
    obj_frame_tiles(gMapObjectPic_Boy4_0),
    obj_frame_tiles(gMapObjectPic_Boy4_1),
    obj_frame_tiles(gMapObjectPic_Boy4_2),
    obj_frame_tiles(gMapObjectPic_Boy4_3),
    obj_frame_tiles(gMapObjectPic_Boy4_4),
    obj_frame_tiles(gMapObjectPic_Boy4_5),
    obj_frame_tiles(gMapObjectPic_Boy4_6),
    obj_frame_tiles(gMapObjectPic_Boy4_7),
    obj_frame_tiles(gMapObjectPic_Boy4_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Woman1[] = {
    obj_frame_tiles(gMapObjectPic_Woman1_0),
    obj_frame_tiles(gMapObjectPic_Woman1_1),
    obj_frame_tiles(gMapObjectPic_Woman1_2),
    obj_frame_tiles(gMapObjectPic_Woman1_3),
    obj_frame_tiles(gMapObjectPic_Woman1_4),
    obj_frame_tiles(gMapObjectPic_Woman1_5),
    obj_frame_tiles(gMapObjectPic_Woman1_6),
    obj_frame_tiles(gMapObjectPic_Woman1_7),
    obj_frame_tiles(gMapObjectPic_Woman1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_FatMan[] = {
    obj_frame_tiles(gMapObjectPic_FatMan_0),
    obj_frame_tiles(gMapObjectPic_FatMan_1),
    obj_frame_tiles(gMapObjectPic_FatMan_2),
    obj_frame_tiles(gMapObjectPic_FatMan_3),
    obj_frame_tiles(gMapObjectPic_FatMan_4),
    obj_frame_tiles(gMapObjectPic_FatMan_5),
    obj_frame_tiles(gMapObjectPic_FatMan_6),
    obj_frame_tiles(gMapObjectPic_FatMan_7),
    obj_frame_tiles(gMapObjectPic_FatMan_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Woman2[] = {
    obj_frame_tiles(gMapObjectPic_Woman2_0),
    obj_frame_tiles(gMapObjectPic_Woman2_1),
    obj_frame_tiles(gMapObjectPic_Woman2_2),
    obj_frame_tiles(gMapObjectPic_Woman2_3),
    obj_frame_tiles(gMapObjectPic_Woman2_4),
    obj_frame_tiles(gMapObjectPic_Woman2_5),
    obj_frame_tiles(gMapObjectPic_Woman2_6),
    obj_frame_tiles(gMapObjectPic_Woman2_7),
    obj_frame_tiles(gMapObjectPic_Woman2_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Man1[] = {
    obj_frame_tiles(gMapObjectPic_Man1_0),
    obj_frame_tiles(gMapObjectPic_Man1_1),
    obj_frame_tiles(gMapObjectPic_Man1_2),
    obj_frame_tiles(gMapObjectPic_Man1_3),
    obj_frame_tiles(gMapObjectPic_Man1_4),
    obj_frame_tiles(gMapObjectPic_Man1_5),
    obj_frame_tiles(gMapObjectPic_Man1_6),
    obj_frame_tiles(gMapObjectPic_Man1_7),
    obj_frame_tiles(gMapObjectPic_Man1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Woman3[] = {
    obj_frame_tiles(gMapObjectPic_Woman3_0),
    obj_frame_tiles(gMapObjectPic_Woman3_1),
    obj_frame_tiles(gMapObjectPic_Woman3_2),
    obj_frame_tiles(gMapObjectPic_Woman3_3),
    obj_frame_tiles(gMapObjectPic_Woman3_4),
    obj_frame_tiles(gMapObjectPic_Woman3_5),
    obj_frame_tiles(gMapObjectPic_Woman3_6),
    obj_frame_tiles(gMapObjectPic_Woman3_7),
    obj_frame_tiles(gMapObjectPic_Woman3_8)
};

const struct SpriteFrameImage gMapObjectPicTable_OldMan1[] = {
    obj_frame_tiles(gMapObjectPic_OldMan1_0),
    obj_frame_tiles(gMapObjectPic_OldMan1_1),
    obj_frame_tiles(gMapObjectPic_OldMan1_2),
    obj_frame_tiles(gMapObjectPic_OldMan1_3),
    obj_frame_tiles(gMapObjectPic_OldMan1_4),
    obj_frame_tiles(gMapObjectPic_OldMan1_5),
    obj_frame_tiles(gMapObjectPic_OldMan1_6),
    obj_frame_tiles(gMapObjectPic_OldMan1_7),
    obj_frame_tiles(gMapObjectPic_OldMan1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_OldWoman1[] = {
    obj_frame_tiles(gMapObjectPic_OldWoman1_0),
    obj_frame_tiles(gMapObjectPic_OldWoman1_1),
    obj_frame_tiles(gMapObjectPic_OldWoman1_2),
    obj_frame_tiles(gMapObjectPic_OldWoman1_3),
    obj_frame_tiles(gMapObjectPic_OldWoman1_4),
    obj_frame_tiles(gMapObjectPic_OldWoman1_5),
    obj_frame_tiles(gMapObjectPic_OldWoman1_6),
    obj_frame_tiles(gMapObjectPic_OldWoman1_7),
    obj_frame_tiles(gMapObjectPic_OldWoman1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Man2[] = {
    obj_frame_tiles(gMapObjectPic_Man2_0),
    obj_frame_tiles(gMapObjectPic_Man2_1),
    obj_frame_tiles(gMapObjectPic_Man2_2),
    obj_frame_tiles(gMapObjectPic_Man2_3),
    obj_frame_tiles(gMapObjectPic_Man2_4),
    obj_frame_tiles(gMapObjectPic_Man2_5),
    obj_frame_tiles(gMapObjectPic_Man2_6),
    obj_frame_tiles(gMapObjectPic_Man2_7),
    obj_frame_tiles(gMapObjectPic_Man2_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Woman4[] = {
    obj_frame_tiles(gMapObjectPic_Woman4_0),
    obj_frame_tiles(gMapObjectPic_Woman4_1),
    obj_frame_tiles(gMapObjectPic_Woman4_2),
    obj_frame_tiles(gMapObjectPic_Woman4_3),
    obj_frame_tiles(gMapObjectPic_Woman4_4),
    obj_frame_tiles(gMapObjectPic_Woman4_5),
    obj_frame_tiles(gMapObjectPic_Woman4_6),
    obj_frame_tiles(gMapObjectPic_Woman4_7),
    obj_frame_tiles(gMapObjectPic_Woman4_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Man3[] = {
    obj_frame_tiles(gMapObjectPic_Man3_0),
    obj_frame_tiles(gMapObjectPic_Man3_1),
    obj_frame_tiles(gMapObjectPic_Man3_2),
    obj_frame_tiles(gMapObjectPic_Man3_3),
    obj_frame_tiles(gMapObjectPic_Man3_4),
    obj_frame_tiles(gMapObjectPic_Man3_5),
    obj_frame_tiles(gMapObjectPic_Man3_6),
    obj_frame_tiles(gMapObjectPic_Man3_7),
    obj_frame_tiles(gMapObjectPic_Man3_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Woman5[] = {
    obj_frame_tiles(gMapObjectPic_Woman5_0),
    obj_frame_tiles(gMapObjectPic_Woman5_1),
    obj_frame_tiles(gMapObjectPic_Woman5_2),
    obj_frame_tiles(gMapObjectPic_Woman5_3),
    obj_frame_tiles(gMapObjectPic_Woman5_4),
    obj_frame_tiles(gMapObjectPic_Woman5_5),
    obj_frame_tiles(gMapObjectPic_Woman5_6),
    obj_frame_tiles(gMapObjectPic_Woman5_7),
    obj_frame_tiles(gMapObjectPic_Woman5_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Cook[] = {
    obj_frame_tiles(gMapObjectPic_Cook_0),
    obj_frame_tiles(gMapObjectPic_Cook_1),
    obj_frame_tiles(gMapObjectPic_Cook_2),
    obj_frame_tiles(gMapObjectPic_Cook_0),
    obj_frame_tiles(gMapObjectPic_Cook_0),
    obj_frame_tiles(gMapObjectPic_Cook_1),
    obj_frame_tiles(gMapObjectPic_Cook_1),
    obj_frame_tiles(gMapObjectPic_Cook_2),
    obj_frame_tiles(gMapObjectPic_Cook_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Woman6[] = {
    obj_frame_tiles(gMapObjectPic_Woman6_0),
    obj_frame_tiles(gMapObjectPic_Woman6_1),
    obj_frame_tiles(gMapObjectPic_Woman6_2),
    obj_frame_tiles(gMapObjectPic_Woman6_3),
    obj_frame_tiles(gMapObjectPic_Woman6_4),
    obj_frame_tiles(gMapObjectPic_Woman6_5),
    obj_frame_tiles(gMapObjectPic_Woman6_6),
    obj_frame_tiles(gMapObjectPic_Woman6_7),
    obj_frame_tiles(gMapObjectPic_Woman6_8)
};

const struct SpriteFrameImage gMapObjectPicTable_OldMan2[] = {
    obj_frame_tiles(gMapObjectPic_OldMan2_0),
    obj_frame_tiles(gMapObjectPic_OldMan2_1),
    obj_frame_tiles(gMapObjectPic_OldMan2_2),
    obj_frame_tiles(gMapObjectPic_OldMan2_0),
    obj_frame_tiles(gMapObjectPic_OldMan2_0),
    obj_frame_tiles(gMapObjectPic_OldMan2_1),
    obj_frame_tiles(gMapObjectPic_OldMan2_1),
    obj_frame_tiles(gMapObjectPic_OldMan2_2),
    obj_frame_tiles(gMapObjectPic_OldMan2_2)
};

const struct SpriteFrameImage gMapObjectPicTable_OldWoman2[] = {
    obj_frame_tiles(gMapObjectPic_OldWoman2_0),
    obj_frame_tiles(gMapObjectPic_OldWoman2_1),
    obj_frame_tiles(gMapObjectPic_OldWoman2_2),
    obj_frame_tiles(gMapObjectPic_OldWoman2_0),
    obj_frame_tiles(gMapObjectPic_OldWoman2_0),
    obj_frame_tiles(gMapObjectPic_OldWoman2_1),
    obj_frame_tiles(gMapObjectPic_OldWoman2_1),
    obj_frame_tiles(gMapObjectPic_OldWoman2_2),
    obj_frame_tiles(gMapObjectPic_OldWoman2_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Camper[] = {
    obj_frame_tiles(gMapObjectPic_Camper_0),
    obj_frame_tiles(gMapObjectPic_Camper_1),
    obj_frame_tiles(gMapObjectPic_Camper_2),
    obj_frame_tiles(gMapObjectPic_Camper_3),
    obj_frame_tiles(gMapObjectPic_Camper_4),
    obj_frame_tiles(gMapObjectPic_Camper_5),
    obj_frame_tiles(gMapObjectPic_Camper_6),
    obj_frame_tiles(gMapObjectPic_Camper_7),
    obj_frame_tiles(gMapObjectPic_Camper_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Picnicker[] = {
    obj_frame_tiles(gMapObjectPic_Picnicker_0),
    obj_frame_tiles(gMapObjectPic_Picnicker_1),
    obj_frame_tiles(gMapObjectPic_Picnicker_2),
    obj_frame_tiles(gMapObjectPic_Picnicker_3),
    obj_frame_tiles(gMapObjectPic_Picnicker_4),
    obj_frame_tiles(gMapObjectPic_Picnicker_5),
    obj_frame_tiles(gMapObjectPic_Picnicker_6),
    obj_frame_tiles(gMapObjectPic_Picnicker_7),
    obj_frame_tiles(gMapObjectPic_Picnicker_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Man4[] = {
    obj_frame_tiles(gMapObjectPic_Man4_0),
    obj_frame_tiles(gMapObjectPic_Man4_1),
    obj_frame_tiles(gMapObjectPic_Man4_2),
    obj_frame_tiles(gMapObjectPic_Man4_3),
    obj_frame_tiles(gMapObjectPic_Man4_4),
    obj_frame_tiles(gMapObjectPic_Man4_5),
    obj_frame_tiles(gMapObjectPic_Man4_6),
    obj_frame_tiles(gMapObjectPic_Man4_7),
    obj_frame_tiles(gMapObjectPic_Man4_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Woman7[] = {
    obj_frame_tiles(gMapObjectPic_Woman7_0),
    obj_frame_tiles(gMapObjectPic_Woman7_1),
    obj_frame_tiles(gMapObjectPic_Woman7_2),
    obj_frame_tiles(gMapObjectPic_Woman7_3),
    obj_frame_tiles(gMapObjectPic_Woman7_4),
    obj_frame_tiles(gMapObjectPic_Woman7_5),
    obj_frame_tiles(gMapObjectPic_Woman7_6),
    obj_frame_tiles(gMapObjectPic_Woman7_7),
    obj_frame_tiles(gMapObjectPic_Woman7_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Youngster[] = {
    obj_frame_tiles(gMapObjectPic_Youngster_0),
    obj_frame_tiles(gMapObjectPic_Youngster_1),
    obj_frame_tiles(gMapObjectPic_Youngster_2),
    obj_frame_tiles(gMapObjectPic_Youngster_3),
    obj_frame_tiles(gMapObjectPic_Youngster_4),
    obj_frame_tiles(gMapObjectPic_Youngster_5),
    obj_frame_tiles(gMapObjectPic_Youngster_6),
    obj_frame_tiles(gMapObjectPic_Youngster_7),
    obj_frame_tiles(gMapObjectPic_Youngster_8)
};

const struct SpriteFrameImage gMapObjectPicTable_BugCatcher[] = {
    obj_frame_tiles(gMapObjectPic_BugCatcher_0),
    obj_frame_tiles(gMapObjectPic_BugCatcher_1),
    obj_frame_tiles(gMapObjectPic_BugCatcher_2),
    obj_frame_tiles(gMapObjectPic_BugCatcher_3),
    obj_frame_tiles(gMapObjectPic_BugCatcher_4),
    obj_frame_tiles(gMapObjectPic_BugCatcher_5),
    obj_frame_tiles(gMapObjectPic_BugCatcher_6),
    obj_frame_tiles(gMapObjectPic_BugCatcher_7),
    obj_frame_tiles(gMapObjectPic_BugCatcher_8)
};

const struct SpriteFrameImage gMapObjectPicTable_PsychicM[] = {
    obj_frame_tiles(gMapObjectPic_PsychicM_0),
    obj_frame_tiles(gMapObjectPic_PsychicM_1),
    obj_frame_tiles(gMapObjectPic_PsychicM_2),
    obj_frame_tiles(gMapObjectPic_PsychicM_3),
    obj_frame_tiles(gMapObjectPic_PsychicM_4),
    obj_frame_tiles(gMapObjectPic_PsychicM_5),
    obj_frame_tiles(gMapObjectPic_PsychicM_6),
    obj_frame_tiles(gMapObjectPic_PsychicM_7),
    obj_frame_tiles(gMapObjectPic_PsychicM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_SchoolKidM[] = {
    obj_frame_tiles(gMapObjectPic_SchoolKidM_0),
    obj_frame_tiles(gMapObjectPic_SchoolKidM_1),
    obj_frame_tiles(gMapObjectPic_SchoolKidM_2),
    obj_frame_tiles(gMapObjectPic_SchoolKidM_3),
    obj_frame_tiles(gMapObjectPic_SchoolKidM_4),
    obj_frame_tiles(gMapObjectPic_SchoolKidM_5),
    obj_frame_tiles(gMapObjectPic_SchoolKidM_6),
    obj_frame_tiles(gMapObjectPic_SchoolKidM_7),
    obj_frame_tiles(gMapObjectPic_SchoolKidM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Maniac[] = {
    obj_frame_tiles(gMapObjectPic_Maniac_0),
    obj_frame_tiles(gMapObjectPic_Maniac_1),
    obj_frame_tiles(gMapObjectPic_Maniac_2),
    obj_frame_tiles(gMapObjectPic_Maniac_3),
    obj_frame_tiles(gMapObjectPic_Maniac_4),
    obj_frame_tiles(gMapObjectPic_Maniac_5),
    obj_frame_tiles(gMapObjectPic_Maniac_6),
    obj_frame_tiles(gMapObjectPic_Maniac_7),
    obj_frame_tiles(gMapObjectPic_Maniac_8)
};

const struct SpriteFrameImage gMapObjectPicTable_HexManiac[] = {
    obj_frame_tiles(gMapObjectPic_HexManiac_0),
    obj_frame_tiles(gMapObjectPic_HexManiac_1),
    obj_frame_tiles(gMapObjectPic_HexManiac_2),
    obj_frame_tiles(gMapObjectPic_HexManiac_3),
    obj_frame_tiles(gMapObjectPic_HexManiac_4),
    obj_frame_tiles(gMapObjectPic_HexManiac_5),
    obj_frame_tiles(gMapObjectPic_HexManiac_6),
    obj_frame_tiles(gMapObjectPic_HexManiac_7),
    obj_frame_tiles(gMapObjectPic_HexManiac_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Woman8[] = {
    obj_frame_tiles(gMapObjectPic_Woman8_0),
    obj_frame_tiles(gMapObjectPic_Woman8_1),
    obj_frame_tiles(gMapObjectPic_Woman8_2),
    obj_frame_tiles(gMapObjectPic_Woman8_3),
    obj_frame_tiles(gMapObjectPic_Woman8_4),
    obj_frame_tiles(gMapObjectPic_Woman8_5),
    obj_frame_tiles(gMapObjectPic_Woman8_6),
    obj_frame_tiles(gMapObjectPic_Woman8_7),
    obj_frame_tiles(gMapObjectPic_Woman8_8)
};

const struct SpriteFrameImage gMapObjectPicTable_SwimmerM[] = {
    obj_frame_tiles(gMapObjectPic_SwimmerM_0),
    obj_frame_tiles(gMapObjectPic_SwimmerM_1),
    obj_frame_tiles(gMapObjectPic_SwimmerM_2),
    obj_frame_tiles(gMapObjectPic_SwimmerM_3),
    obj_frame_tiles(gMapObjectPic_SwimmerM_4),
    obj_frame_tiles(gMapObjectPic_SwimmerM_5),
    obj_frame_tiles(gMapObjectPic_SwimmerM_6),
    obj_frame_tiles(gMapObjectPic_SwimmerM_7),
    obj_frame_tiles(gMapObjectPic_SwimmerM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_SwimmerF[] = {
    obj_frame_tiles(gMapObjectPic_SwimmerF_0),
    obj_frame_tiles(gMapObjectPic_SwimmerF_1),
    obj_frame_tiles(gMapObjectPic_SwimmerF_2),
    obj_frame_tiles(gMapObjectPic_SwimmerF_3),
    obj_frame_tiles(gMapObjectPic_SwimmerF_4),
    obj_frame_tiles(gMapObjectPic_SwimmerF_5),
    obj_frame_tiles(gMapObjectPic_SwimmerF_6),
    obj_frame_tiles(gMapObjectPic_SwimmerF_7),
    obj_frame_tiles(gMapObjectPic_SwimmerF_8)
};

const struct SpriteFrameImage gMapObjectPicTable_BlackBelt[] = {
    obj_frame_tiles(gMapObjectPic_BlackBelt_0),
    obj_frame_tiles(gMapObjectPic_BlackBelt_1),
    obj_frame_tiles(gMapObjectPic_BlackBelt_2),
    obj_frame_tiles(gMapObjectPic_BlackBelt_3),
    obj_frame_tiles(gMapObjectPic_BlackBelt_4),
    obj_frame_tiles(gMapObjectPic_BlackBelt_5),
    obj_frame_tiles(gMapObjectPic_BlackBelt_6),
    obj_frame_tiles(gMapObjectPic_BlackBelt_7),
    obj_frame_tiles(gMapObjectPic_BlackBelt_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Beauty[] = {
    obj_frame_tiles(gMapObjectPic_Beauty_0),
    obj_frame_tiles(gMapObjectPic_Beauty_1),
    obj_frame_tiles(gMapObjectPic_Beauty_2),
    obj_frame_tiles(gMapObjectPic_Beauty_3),
    obj_frame_tiles(gMapObjectPic_Beauty_4),
    obj_frame_tiles(gMapObjectPic_Beauty_5),
    obj_frame_tiles(gMapObjectPic_Beauty_6),
    obj_frame_tiles(gMapObjectPic_Beauty_7),
    obj_frame_tiles(gMapObjectPic_Beauty_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Scientist1[] = {
    obj_frame_tiles(gMapObjectPic_Scientist1_0),
    obj_frame_tiles(gMapObjectPic_Scientist1_1),
    obj_frame_tiles(gMapObjectPic_Scientist1_2),
    obj_frame_tiles(gMapObjectPic_Scientist1_3),
    obj_frame_tiles(gMapObjectPic_Scientist1_4),
    obj_frame_tiles(gMapObjectPic_Scientist1_5),
    obj_frame_tiles(gMapObjectPic_Scientist1_6),
    obj_frame_tiles(gMapObjectPic_Scientist1_7),
    obj_frame_tiles(gMapObjectPic_Scientist1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Lass[] = {
    obj_frame_tiles(gMapObjectPic_Lass_0),
    obj_frame_tiles(gMapObjectPic_Lass_1),
    obj_frame_tiles(gMapObjectPic_Lass_2),
    obj_frame_tiles(gMapObjectPic_Lass_3),
    obj_frame_tiles(gMapObjectPic_Lass_4),
    obj_frame_tiles(gMapObjectPic_Lass_5),
    obj_frame_tiles(gMapObjectPic_Lass_6),
    obj_frame_tiles(gMapObjectPic_Lass_7),
    obj_frame_tiles(gMapObjectPic_Lass_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Gentleman[] = {
    obj_frame_tiles(gMapObjectPic_Gentleman_0),
    obj_frame_tiles(gMapObjectPic_Gentleman_1),
    obj_frame_tiles(gMapObjectPic_Gentleman_2),
    obj_frame_tiles(gMapObjectPic_Gentleman_3),
    obj_frame_tiles(gMapObjectPic_Gentleman_4),
    obj_frame_tiles(gMapObjectPic_Gentleman_5),
    obj_frame_tiles(gMapObjectPic_Gentleman_6),
    obj_frame_tiles(gMapObjectPic_Gentleman_7),
    obj_frame_tiles(gMapObjectPic_Gentleman_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Sailor[] = {
    obj_frame_tiles(gMapObjectPic_Sailor_0),
    obj_frame_tiles(gMapObjectPic_Sailor_1),
    obj_frame_tiles(gMapObjectPic_Sailor_2),
    obj_frame_tiles(gMapObjectPic_Sailor_3),
    obj_frame_tiles(gMapObjectPic_Sailor_4),
    obj_frame_tiles(gMapObjectPic_Sailor_5),
    obj_frame_tiles(gMapObjectPic_Sailor_6),
    obj_frame_tiles(gMapObjectPic_Sailor_7),
    obj_frame_tiles(gMapObjectPic_Sailor_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Fisherman[] = {
    obj_frame_tiles(gMapObjectPic_Fisherman_0),
    obj_frame_tiles(gMapObjectPic_Fisherman_1),
    obj_frame_tiles(gMapObjectPic_Fisherman_2),
    obj_frame_tiles(gMapObjectPic_Fisherman_3),
    obj_frame_tiles(gMapObjectPic_Fisherman_4),
    obj_frame_tiles(gMapObjectPic_Fisherman_5),
    obj_frame_tiles(gMapObjectPic_Fisherman_6),
    obj_frame_tiles(gMapObjectPic_Fisherman_7),
    obj_frame_tiles(gMapObjectPic_Fisherman_8)
};

const struct SpriteFrameImage gMapObjectPicTable_RunningTriathleteM[] = {
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_0),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_1),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_2),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_3),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_4),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_5),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_6),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_7),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_RunningTriathleteF[] = {
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_0),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_1),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_2),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_3),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_4),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_5),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_6),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_7),
    obj_frame_tiles(gMapObjectPic_RunningTriathleteF_8)
};

const struct SpriteFrameImage gMapObjectPicTable_TuberF[] = {
    obj_frame_tiles(gMapObjectPic_TuberF_0),
    obj_frame_tiles(gMapObjectPic_TuberF_1),
    obj_frame_tiles(gMapObjectPic_TuberF_2),
    obj_frame_tiles(gMapObjectPic_TuberF_3),
    obj_frame_tiles(gMapObjectPic_TuberF_4),
    obj_frame_tiles(gMapObjectPic_TuberF_5),
    obj_frame_tiles(gMapObjectPic_TuberF_6),
    obj_frame_tiles(gMapObjectPic_TuberF_7),
    obj_frame_tiles(gMapObjectPic_TuberF_8)
};

const struct SpriteFrameImage gMapObjectPicTable_TuberM[] = {
    obj_frame_tiles(gMapObjectPic_TuberM_0),
    obj_frame_tiles(gMapObjectPic_TuberM_1),
    obj_frame_tiles(gMapObjectPic_TuberM_2),
    obj_frame_tiles(gMapObjectPic_TuberM_3),
    obj_frame_tiles(gMapObjectPic_TuberM_4),
    obj_frame_tiles(gMapObjectPic_TuberM_5),
    obj_frame_tiles(gMapObjectPic_TuberM_6),
    obj_frame_tiles(gMapObjectPic_TuberM_7),
    obj_frame_tiles(gMapObjectPic_TuberM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Hiker[] = {
    obj_frame_tiles(gMapObjectPic_Hiker_0),
    obj_frame_tiles(gMapObjectPic_Hiker_1),
    obj_frame_tiles(gMapObjectPic_Hiker_2),
    obj_frame_tiles(gMapObjectPic_Hiker_3),
    obj_frame_tiles(gMapObjectPic_Hiker_4),
    obj_frame_tiles(gMapObjectPic_Hiker_5),
    obj_frame_tiles(gMapObjectPic_Hiker_6),
    obj_frame_tiles(gMapObjectPic_Hiker_7),
    obj_frame_tiles(gMapObjectPic_Hiker_8)
};

const struct SpriteFrameImage gMapObjectPicTable_CyclingTriathleteM[] = {
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_0),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_1),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_2),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_3),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_4),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_5),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_6),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_7),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_CyclingTriathleteF[] = {
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_0),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_1),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_2),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_3),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_4),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_5),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_6),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_7),
    obj_frame_tiles(gMapObjectPic_CyclingTriathleteF_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Nurse[] = {
    obj_frame_tiles(gMapObjectPic_Nurse_0),
    obj_frame_tiles(gMapObjectPic_Nurse_1),
    obj_frame_tiles(gMapObjectPic_Nurse_2),
    obj_frame_tiles(gMapObjectPic_Nurse_3),
    obj_frame_tiles(gMapObjectPic_Nurse_4),
    obj_frame_tiles(gMapObjectPic_Nurse_5),
    obj_frame_tiles(gMapObjectPic_Nurse_6),
    obj_frame_tiles(gMapObjectPic_Nurse_7),
    obj_frame_tiles(gMapObjectPic_Nurse_8),
    obj_frame_tiles(gMapObjectPic_Nurse_9)
};

const struct SpriteFrameImage gMapObjectPicTable_ItemBall[] = {
    obj_frame_tiles(gMapObjectPic_ItemBall)
};

const struct SpriteFrameImage gMapObjectPicTable_ProfBirch[] = {
    obj_frame_tiles(gMapObjectPic_ProfBirch_0),
    obj_frame_tiles(gMapObjectPic_ProfBirch_1),
    obj_frame_tiles(gMapObjectPic_ProfBirch_2),
    obj_frame_tiles(gMapObjectPic_ProfBirch_3),
    obj_frame_tiles(gMapObjectPic_ProfBirch_4),
    obj_frame_tiles(gMapObjectPic_ProfBirch_5),
    obj_frame_tiles(gMapObjectPic_ProfBirch_6),
    obj_frame_tiles(gMapObjectPic_ProfBirch_7),
    obj_frame_tiles(gMapObjectPic_ProfBirch_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Man5[] = {
    obj_frame_tiles(gMapObjectPic_Man5_0),
    obj_frame_tiles(gMapObjectPic_Man5_1),
    obj_frame_tiles(gMapObjectPic_Man5_2),
    obj_frame_tiles(gMapObjectPic_Man5_3),
    obj_frame_tiles(gMapObjectPic_Man5_4),
    obj_frame_tiles(gMapObjectPic_Man5_5),
    obj_frame_tiles(gMapObjectPic_Man5_6),
    obj_frame_tiles(gMapObjectPic_Man5_7),
    obj_frame_tiles(gMapObjectPic_Man5_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Man6[] = {
    obj_frame_tiles(gMapObjectPic_Man6_0),
    obj_frame_tiles(gMapObjectPic_Man6_1),
    obj_frame_tiles(gMapObjectPic_Man6_2),
    obj_frame_tiles(gMapObjectPic_Man6_3),
    obj_frame_tiles(gMapObjectPic_Man6_4),
    obj_frame_tiles(gMapObjectPic_Man6_5),
    obj_frame_tiles(gMapObjectPic_Man6_6),
    obj_frame_tiles(gMapObjectPic_Man6_7),
    obj_frame_tiles(gMapObjectPic_Man6_8)
};

const struct SpriteFrameImage gMapObjectPicTable_ReporterM[] = {
    obj_frame_tiles(gMapObjectPic_ReporterM_0),
    obj_frame_tiles(gMapObjectPic_ReporterM_1),
    obj_frame_tiles(gMapObjectPic_ReporterM_2),
    obj_frame_tiles(gMapObjectPic_ReporterM_3),
    obj_frame_tiles(gMapObjectPic_ReporterM_4),
    obj_frame_tiles(gMapObjectPic_ReporterM_5),
    obj_frame_tiles(gMapObjectPic_ReporterM_6),
    obj_frame_tiles(gMapObjectPic_ReporterM_7),
    obj_frame_tiles(gMapObjectPic_ReporterM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_ReporterF[] = {
    obj_frame_tiles(gMapObjectPic_ReporterF_0),
    obj_frame_tiles(gMapObjectPic_ReporterF_1),
    obj_frame_tiles(gMapObjectPic_ReporterF_2),
    obj_frame_tiles(gMapObjectPic_ReporterF_3),
    obj_frame_tiles(gMapObjectPic_ReporterF_4),
    obj_frame_tiles(gMapObjectPic_ReporterF_5),
    obj_frame_tiles(gMapObjectPic_ReporterF_6),
    obj_frame_tiles(gMapObjectPic_ReporterF_7),
    obj_frame_tiles(gMapObjectPic_ReporterF_8)
};

const struct SpriteFrameImage gMapObjectPicTable_MauvilleOldMan1[] = {
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_0),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_1),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_2),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_3),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_4),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_5),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_6),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_7),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan1_8)
};

const struct SpriteFrameImage gMapObjectPicTable_MauvilleOldMan2[] = {
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_0),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_1),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_2),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_3),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_4),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_5),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_6),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_7),
    obj_frame_tiles(gMapObjectPic_MauvilleOldMan2_8)
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedNatuDoll[] = {
    obj_frame_tiles(gMapObjectPic_UnusedNatuDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedMagnemiteDoll[] = {
    obj_frame_tiles(gMapObjectPic_UnusedMagnemiteDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedSquirtleDoll[] = {
    obj_frame_tiles(gMapObjectPic_UnusedSquirtleDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedWooperDoll[] = {
    obj_frame_tiles(gMapObjectPic_UnusedWooperDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedPikachuDoll[] = {
    obj_frame_tiles(gMapObjectPic_UnusedPikachuDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_UnusedPorygon2Doll[] = {
    obj_frame_tiles(gMapObjectPic_UnusedPorygon2Doll)
};

const struct SpriteFrameImage gMapObjectPicTable_CuttableTree[] = {
    obj_frame_tiles(gMapObjectPic_CuttableTree_0),
    obj_frame_tiles(gMapObjectPic_CuttableTree_1),
    obj_frame_tiles(gMapObjectPic_CuttableTree_2),
    obj_frame_tiles(gMapObjectPic_CuttableTree_3)
};

const struct SpriteFrameImage gMapObjectPicTable_MartEmployee[] = {
    obj_frame_tiles(gMapObjectPic_MartEmployee_0),
    obj_frame_tiles(gMapObjectPic_MartEmployee_1),
    obj_frame_tiles(gMapObjectPic_MartEmployee_2),
    obj_frame_tiles(gMapObjectPic_MartEmployee_3),
    obj_frame_tiles(gMapObjectPic_MartEmployee_4),
    obj_frame_tiles(gMapObjectPic_MartEmployee_5),
    obj_frame_tiles(gMapObjectPic_MartEmployee_6),
    obj_frame_tiles(gMapObjectPic_MartEmployee_7),
    obj_frame_tiles(gMapObjectPic_MartEmployee_8)
};

const struct SpriteFrameImage gMapObjectPicTable_RooftopSaleWoman[] = {
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_0),
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_1),
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_2),
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_3),
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_4),
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_5),
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_6),
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_7),
    obj_frame_tiles(gMapObjectPic_RooftopSaleWoman_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Teala[] = {
    obj_frame_tiles(gMapObjectPic_Teala_0),
    obj_frame_tiles(gMapObjectPic_Teala_1),
    obj_frame_tiles(gMapObjectPic_Teala_2),
    obj_frame_tiles(gMapObjectPic_Teala_3),
    obj_frame_tiles(gMapObjectPic_Teala_4),
    obj_frame_tiles(gMapObjectPic_Teala_5),
    obj_frame_tiles(gMapObjectPic_Teala_6),
    obj_frame_tiles(gMapObjectPic_Teala_7),
    obj_frame_tiles(gMapObjectPic_Teala_8)
};

const struct SpriteFrameImage gMapObjectPicTable_BreakableRock[] = {
    obj_frame_tiles(gMapObjectPic_BreakableRock_0),
    obj_frame_tiles(gMapObjectPic_BreakableRock_1),
    obj_frame_tiles(gMapObjectPic_BreakableRock_2),
    obj_frame_tiles(gMapObjectPic_BreakableRock_3)
};

const struct SpriteFrameImage gMapObjectPicTable_PushableBoulder[] = {
    obj_frame_tiles(gMapObjectPic_PushableBoulder)
};

const struct SpriteFrameImage gMapObjectPicTable_MrBrineysBoat[] = {
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_0),
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_1),
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_2),
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_0),
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_0),
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_1),
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_1),
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_2),
    obj_frame_tiles(gMapObjectPic_MrBrineysBoat_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Truck[] = {
    obj_frame_tiles(gMapObjectPic_Truck)
};

const struct SpriteFrameImage gMapObjectPicTable_MachokeCarryingBox[] = {
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_0),
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_0),
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_0),
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_1),
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_2),
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_1),
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_2),
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_1),
    obj_frame_tiles(gMapObjectPic_MachokeCarryingBox_2)
};

const struct SpriteFrameImage gMapObjectPicTable_MachokeFacingAway[] = {
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_0),
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_0),
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_0),
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_1),
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_1),
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_1),
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_1),
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_1),
    obj_frame_tiles(gMapObjectPic_MachokeFacingAway_1)
};

const struct SpriteFrameImage gMapObjectPicTable_BirchsBag[] = {
    obj_frame_tiles(gMapObjectPic_BirchsBag)
};

const struct SpriteFrameImage gMapObjectPicTable_Poochyena[] = {
    obj_frame_tiles(gMapObjectPic_Poochyena_0),
    obj_frame_tiles(gMapObjectPic_Poochyena_1),
    obj_frame_tiles(gMapObjectPic_Poochyena_2),
    obj_frame_tiles(gMapObjectPic_Poochyena_3),
    obj_frame_tiles(gMapObjectPic_Poochyena_4),
    obj_frame_tiles(gMapObjectPic_Poochyena_5),
    obj_frame_tiles(gMapObjectPic_Poochyena_6),
    obj_frame_tiles(gMapObjectPic_Poochyena_7),
    obj_frame_tiles(gMapObjectPic_Poochyena_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Artist[] = {
    obj_frame_tiles(gMapObjectPic_Artist_0),
    obj_frame_tiles(gMapObjectPic_Artist_1),
    obj_frame_tiles(gMapObjectPic_Artist_2),
    obj_frame_tiles(gMapObjectPic_Artist_3),
    obj_frame_tiles(gMapObjectPic_Artist_4),
    obj_frame_tiles(gMapObjectPic_Artist_5),
    obj_frame_tiles(gMapObjectPic_Artist_6),
    obj_frame_tiles(gMapObjectPic_Artist_7),
    obj_frame_tiles(gMapObjectPic_Artist_8)
};

const struct SpriteFrameImage gMapObjectPicTable_MayNormal[] = {
    obj_frame_tiles(gMapObjectPic_MayNormal_0),
    obj_frame_tiles(gMapObjectPic_MayNormal_1),
    obj_frame_tiles(gMapObjectPic_MayNormal_2),
    obj_frame_tiles(gMapObjectPic_MayNormal_3),
    obj_frame_tiles(gMapObjectPic_MayNormal_4),
    obj_frame_tiles(gMapObjectPic_MayNormal_5),
    obj_frame_tiles(gMapObjectPic_MayNormal_6),
    obj_frame_tiles(gMapObjectPic_MayNormal_7),
    obj_frame_tiles(gMapObjectPic_MayNormal_8),
    obj_frame_tiles(gMapObjectPic_MayNormal_9),
    obj_frame_tiles(gMapObjectPic_MayNormal_10),
    obj_frame_tiles(gMapObjectPic_MayNormal_11),
    obj_frame_tiles(gMapObjectPic_MayNormal_12),
    obj_frame_tiles(gMapObjectPic_MayNormal_13),
    obj_frame_tiles(gMapObjectPic_MayNormal_14),
    obj_frame_tiles(gMapObjectPic_MayNormal_15),
    obj_frame_tiles(gMapObjectPic_MayNormal_16),
    obj_frame_tiles(gMapObjectPic_MayNormal_17)
};

const struct SpriteFrameImage gMapObjectPicTable_MayMachBike[] = {
    obj_frame_tiles(gMapObjectPic_MayMachBike_0),
    obj_frame_tiles(gMapObjectPic_MayMachBike_1),
    obj_frame_tiles(gMapObjectPic_MayMachBike_2),
    obj_frame_tiles(gMapObjectPic_MayMachBike_3),
    obj_frame_tiles(gMapObjectPic_MayMachBike_4),
    obj_frame_tiles(gMapObjectPic_MayMachBike_5),
    obj_frame_tiles(gMapObjectPic_MayMachBike_6),
    obj_frame_tiles(gMapObjectPic_MayMachBike_7),
    obj_frame_tiles(gMapObjectPic_MayMachBike_8)
};

const struct SpriteFrameImage gMapObjectPicTable_MayAcroBike[] = {
    obj_frame_tiles(gMapObjectPic_MayAcroBike_0),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_1),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_2),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_3),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_4),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_5),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_6),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_7),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_8),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_9),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_10),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_11),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_12),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_13),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_14),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_15),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_16),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_17),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_18),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_19),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_20),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_21),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_22),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_23),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_24),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_25),
    obj_frame_tiles(gMapObjectPic_MayAcroBike_26)
};

const struct SpriteFrameImage gMapObjectPicTable_MaySurfing[] = {
    obj_frame_tiles(gMapObjectPic_MaySurfing_0),
    obj_frame_tiles(gMapObjectPic_MaySurfing_1),
    obj_frame_tiles(gMapObjectPic_MaySurfing_2),
    obj_frame_tiles(gMapObjectPic_MaySurfing_0),
    obj_frame_tiles(gMapObjectPic_MaySurfing_0),
    obj_frame_tiles(gMapObjectPic_MaySurfing_1),
    obj_frame_tiles(gMapObjectPic_MaySurfing_1),
    obj_frame_tiles(gMapObjectPic_MaySurfing_2),
    obj_frame_tiles(gMapObjectPic_MaySurfing_2),
    obj_frame_tiles(gMapObjectPic_MaySurfing_3),
    obj_frame_tiles(gMapObjectPic_MaySurfing_4),
    obj_frame_tiles(gMapObjectPic_MaySurfing_5)
};

const struct SpriteFrameImage gMapObjectPicTable_MayUnderwater[] = {
    obj_frame_tiles(gMapObjectPic_MayUnderwater_0),
    obj_frame_tiles(gMapObjectPic_MayUnderwater_1),
    obj_frame_tiles(gMapObjectPic_MayUnderwater_2),
    obj_frame_tiles(gMapObjectPic_MayUnderwater_0),
    obj_frame_tiles(gMapObjectPic_MayUnderwater_0),
    obj_frame_tiles(gMapObjectPic_MayUnderwater_1),
    obj_frame_tiles(gMapObjectPic_MayUnderwater_1),
    obj_frame_tiles(gMapObjectPic_MayUnderwater_2),
    obj_frame_tiles(gMapObjectPic_MayUnderwater_2)
};

const struct SpriteFrameImage gMapObjectPicTable_MayFieldMove[] = {
    obj_frame_tiles(gMapObjectPic_MayFieldMove_0),
    obj_frame_tiles(gMapObjectPic_MayFieldMove_1),
    obj_frame_tiles(gMapObjectPic_MayFieldMove_2),
    obj_frame_tiles(gMapObjectPic_MayFieldMove_3),
    obj_frame_tiles(gMapObjectPic_MayFieldMove_4)
};

const struct SpriteFrameImage gMapObjectPicTable_Cameraman[] = {
    obj_frame_tiles(gMapObjectPic_Cameraman_0),
    obj_frame_tiles(gMapObjectPic_Cameraman_1),
    obj_frame_tiles(gMapObjectPic_Cameraman_2),
    obj_frame_tiles(gMapObjectPic_Cameraman_3),
    obj_frame_tiles(gMapObjectPic_Cameraman_4),
    obj_frame_tiles(gMapObjectPic_Cameraman_5),
    obj_frame_tiles(gMapObjectPic_Cameraman_6),
    obj_frame_tiles(gMapObjectPic_Cameraman_7),
    obj_frame_tiles(gMapObjectPic_Cameraman_8)
};

const struct SpriteFrameImage gMapObjectPicTable_MovingBox[] = {
    obj_frame_tiles(gMapObjectPic_MovingBox)
};

const struct SpriteFrameImage gMapObjectPicTable_CableCar[] = {
    obj_frame_tiles(gMapObjectPic_CableCar)
};

const struct SpriteFrameImage gMapObjectPicTable_Scientist2[] = {
    obj_frame_tiles(gMapObjectPic_Scientist2_0),
    obj_frame_tiles(gMapObjectPic_Scientist2_1),
    obj_frame_tiles(gMapObjectPic_Scientist2_2),
    obj_frame_tiles(gMapObjectPic_Scientist2_3),
    obj_frame_tiles(gMapObjectPic_Scientist2_4),
    obj_frame_tiles(gMapObjectPic_Scientist2_5),
    obj_frame_tiles(gMapObjectPic_Scientist2_6),
    obj_frame_tiles(gMapObjectPic_Scientist2_7),
    obj_frame_tiles(gMapObjectPic_Scientist2_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Man7[] = {
    obj_frame_tiles(gMapObjectPic_Man7_0),
    obj_frame_tiles(gMapObjectPic_Man7_1),
    obj_frame_tiles(gMapObjectPic_Man7_2),
    obj_frame_tiles(gMapObjectPic_Man7_3),
    obj_frame_tiles(gMapObjectPic_Man7_4),
    obj_frame_tiles(gMapObjectPic_Man7_5),
    obj_frame_tiles(gMapObjectPic_Man7_6),
    obj_frame_tiles(gMapObjectPic_Man7_7),
    obj_frame_tiles(gMapObjectPic_Man7_8)
};

const struct SpriteFrameImage gMapObjectPicTable_AquaMemberM[] = {
    obj_frame_tiles(gMapObjectPic_AquaMemberM_0),
    obj_frame_tiles(gMapObjectPic_AquaMemberM_1),
    obj_frame_tiles(gMapObjectPic_AquaMemberM_2),
    obj_frame_tiles(gMapObjectPic_AquaMemberM_3),
    obj_frame_tiles(gMapObjectPic_AquaMemberM_4),
    obj_frame_tiles(gMapObjectPic_AquaMemberM_5),
    obj_frame_tiles(gMapObjectPic_AquaMemberM_6),
    obj_frame_tiles(gMapObjectPic_AquaMemberM_7),
    obj_frame_tiles(gMapObjectPic_AquaMemberM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_AquaMemberF[] = {
    obj_frame_tiles(gMapObjectPic_AquaMemberF_0),
    obj_frame_tiles(gMapObjectPic_AquaMemberF_1),
    obj_frame_tiles(gMapObjectPic_AquaMemberF_2),
    obj_frame_tiles(gMapObjectPic_AquaMemberF_3),
    obj_frame_tiles(gMapObjectPic_AquaMemberF_4),
    obj_frame_tiles(gMapObjectPic_AquaMemberF_5),
    obj_frame_tiles(gMapObjectPic_AquaMemberF_6),
    obj_frame_tiles(gMapObjectPic_AquaMemberF_7),
    obj_frame_tiles(gMapObjectPic_AquaMemberF_8)
};

const struct SpriteFrameImage gMapObjectPicTable_MagmaMemberM[] = {
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_0),
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_1),
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_2),
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_3),
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_4),
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_5),
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_6),
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_7),
    obj_frame_tiles(gMapObjectPic_MagmaMemberM_8)
};

const struct SpriteFrameImage gMapObjectPicTable_MagmaMemberF[] = {
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_0),
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_1),
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_2),
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_3),
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_4),
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_5),
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_6),
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_7),
    obj_frame_tiles(gMapObjectPic_MagmaMemberF_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Sidney[] = {
    obj_frame_tiles(gMapObjectPic_Sidney_0),
    obj_frame_tiles(gMapObjectPic_Sidney_1),
    obj_frame_tiles(gMapObjectPic_Sidney_2),
    obj_frame_tiles(gMapObjectPic_Sidney_0),
    obj_frame_tiles(gMapObjectPic_Sidney_0),
    obj_frame_tiles(gMapObjectPic_Sidney_1),
    obj_frame_tiles(gMapObjectPic_Sidney_1),
    obj_frame_tiles(gMapObjectPic_Sidney_2),
    obj_frame_tiles(gMapObjectPic_Sidney_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Phoebe[] = {
    obj_frame_tiles(gMapObjectPic_Phoebe_0),
    obj_frame_tiles(gMapObjectPic_Phoebe_1),
    obj_frame_tiles(gMapObjectPic_Phoebe_2),
    obj_frame_tiles(gMapObjectPic_Phoebe_0),
    obj_frame_tiles(gMapObjectPic_Phoebe_0),
    obj_frame_tiles(gMapObjectPic_Phoebe_1),
    obj_frame_tiles(gMapObjectPic_Phoebe_1),
    obj_frame_tiles(gMapObjectPic_Phoebe_2),
    obj_frame_tiles(gMapObjectPic_Phoebe_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Glacia[] = {
    obj_frame_tiles(gMapObjectPic_Glacia_0),
    obj_frame_tiles(gMapObjectPic_Glacia_1),
    obj_frame_tiles(gMapObjectPic_Glacia_2),
    obj_frame_tiles(gMapObjectPic_Glacia_0),
    obj_frame_tiles(gMapObjectPic_Glacia_0),
    obj_frame_tiles(gMapObjectPic_Glacia_1),
    obj_frame_tiles(gMapObjectPic_Glacia_1),
    obj_frame_tiles(gMapObjectPic_Glacia_2),
    obj_frame_tiles(gMapObjectPic_Glacia_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Drake[] = {
    obj_frame_tiles(gMapObjectPic_Drake_0),
    obj_frame_tiles(gMapObjectPic_Drake_1),
    obj_frame_tiles(gMapObjectPic_Drake_2),
    obj_frame_tiles(gMapObjectPic_Drake_0),
    obj_frame_tiles(gMapObjectPic_Drake_0),
    obj_frame_tiles(gMapObjectPic_Drake_1),
    obj_frame_tiles(gMapObjectPic_Drake_1),
    obj_frame_tiles(gMapObjectPic_Drake_2),
    obj_frame_tiles(gMapObjectPic_Drake_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Roxanne[] = {
    obj_frame_tiles(gMapObjectPic_Roxanne_0),
    obj_frame_tiles(gMapObjectPic_Roxanne_1),
    obj_frame_tiles(gMapObjectPic_Roxanne_2),
    obj_frame_tiles(gMapObjectPic_Roxanne_0),
    obj_frame_tiles(gMapObjectPic_Roxanne_0),
    obj_frame_tiles(gMapObjectPic_Roxanne_1),
    obj_frame_tiles(gMapObjectPic_Roxanne_1),
    obj_frame_tiles(gMapObjectPic_Roxanne_2),
    obj_frame_tiles(gMapObjectPic_Roxanne_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Brawly[] = {
    obj_frame_tiles(gMapObjectPic_Brawly_0),
    obj_frame_tiles(gMapObjectPic_Brawly_1),
    obj_frame_tiles(gMapObjectPic_Brawly_2),
    obj_frame_tiles(gMapObjectPic_Brawly_0),
    obj_frame_tiles(gMapObjectPic_Brawly_0),
    obj_frame_tiles(gMapObjectPic_Brawly_1),
    obj_frame_tiles(gMapObjectPic_Brawly_1),
    obj_frame_tiles(gMapObjectPic_Brawly_2),
    obj_frame_tiles(gMapObjectPic_Brawly_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Wattson[] = {
    obj_frame_tiles(gMapObjectPic_Wattson_0),
    obj_frame_tiles(gMapObjectPic_Wattson_1),
    obj_frame_tiles(gMapObjectPic_Wattson_2),
    obj_frame_tiles(gMapObjectPic_Wattson_0),
    obj_frame_tiles(gMapObjectPic_Wattson_0),
    obj_frame_tiles(gMapObjectPic_Wattson_1),
    obj_frame_tiles(gMapObjectPic_Wattson_1),
    obj_frame_tiles(gMapObjectPic_Wattson_2),
    obj_frame_tiles(gMapObjectPic_Wattson_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Flannery[] = {
    obj_frame_tiles(gMapObjectPic_Flannery_0),
    obj_frame_tiles(gMapObjectPic_Flannery_1),
    obj_frame_tiles(gMapObjectPic_Flannery_2),
    obj_frame_tiles(gMapObjectPic_Flannery_0),
    obj_frame_tiles(gMapObjectPic_Flannery_0),
    obj_frame_tiles(gMapObjectPic_Flannery_1),
    obj_frame_tiles(gMapObjectPic_Flannery_1),
    obj_frame_tiles(gMapObjectPic_Flannery_2),
    obj_frame_tiles(gMapObjectPic_Flannery_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Norman[] = {
    obj_frame_tiles(gMapObjectPic_Norman_0),
    obj_frame_tiles(gMapObjectPic_Norman_1),
    obj_frame_tiles(gMapObjectPic_Norman_2),
    obj_frame_tiles(gMapObjectPic_Norman_3),
    obj_frame_tiles(gMapObjectPic_Norman_4),
    obj_frame_tiles(gMapObjectPic_Norman_5),
    obj_frame_tiles(gMapObjectPic_Norman_6),
    obj_frame_tiles(gMapObjectPic_Norman_7),
    obj_frame_tiles(gMapObjectPic_Norman_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Winona[] = {
    obj_frame_tiles(gMapObjectPic_Winona_0),
    obj_frame_tiles(gMapObjectPic_Winona_1),
    obj_frame_tiles(gMapObjectPic_Winona_2),
    obj_frame_tiles(gMapObjectPic_Winona_0),
    obj_frame_tiles(gMapObjectPic_Winona_0),
    obj_frame_tiles(gMapObjectPic_Winona_1),
    obj_frame_tiles(gMapObjectPic_Winona_1),
    obj_frame_tiles(gMapObjectPic_Winona_2),
    obj_frame_tiles(gMapObjectPic_Winona_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Liza[] = {
    obj_frame_tiles(gMapObjectPic_Liza_0),
    obj_frame_tiles(gMapObjectPic_Liza_1),
    obj_frame_tiles(gMapObjectPic_Liza_2),
    obj_frame_tiles(gMapObjectPic_Liza_0),
    obj_frame_tiles(gMapObjectPic_Liza_0),
    obj_frame_tiles(gMapObjectPic_Liza_1),
    obj_frame_tiles(gMapObjectPic_Liza_1),
    obj_frame_tiles(gMapObjectPic_Liza_2),
    obj_frame_tiles(gMapObjectPic_Liza_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Tate[] = {
    obj_frame_tiles(gMapObjectPic_Tate_0),
    obj_frame_tiles(gMapObjectPic_Tate_1),
    obj_frame_tiles(gMapObjectPic_Tate_2),
    obj_frame_tiles(gMapObjectPic_Tate_0),
    obj_frame_tiles(gMapObjectPic_Tate_0),
    obj_frame_tiles(gMapObjectPic_Tate_1),
    obj_frame_tiles(gMapObjectPic_Tate_1),
    obj_frame_tiles(gMapObjectPic_Tate_2),
    obj_frame_tiles(gMapObjectPic_Tate_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Wallace[] = {
    obj_frame_tiles(gMapObjectPic_Wallace_0),
    obj_frame_tiles(gMapObjectPic_Wallace_1),
    obj_frame_tiles(gMapObjectPic_Wallace_2),
    obj_frame_tiles(gMapObjectPic_Wallace_3),
    obj_frame_tiles(gMapObjectPic_Wallace_4),
    obj_frame_tiles(gMapObjectPic_Wallace_5),
    obj_frame_tiles(gMapObjectPic_Wallace_6),
    obj_frame_tiles(gMapObjectPic_Wallace_7),
    obj_frame_tiles(gMapObjectPic_Wallace_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Steven[] = {
    obj_frame_tiles(gMapObjectPic_Steven_0),
    obj_frame_tiles(gMapObjectPic_Steven_1),
    obj_frame_tiles(gMapObjectPic_Steven_2),
    obj_frame_tiles(gMapObjectPic_Steven_3),
    obj_frame_tiles(gMapObjectPic_Steven_4),
    obj_frame_tiles(gMapObjectPic_Steven_5),
    obj_frame_tiles(gMapObjectPic_Steven_6),
    obj_frame_tiles(gMapObjectPic_Steven_7),
    obj_frame_tiles(gMapObjectPic_Steven_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Wally[] = {
    obj_frame_tiles(gMapObjectPic_Wally_0),
    obj_frame_tiles(gMapObjectPic_Wally_1),
    obj_frame_tiles(gMapObjectPic_Wally_2),
    obj_frame_tiles(gMapObjectPic_Wally_3),
    obj_frame_tiles(gMapObjectPic_Wally_4),
    obj_frame_tiles(gMapObjectPic_Wally_5),
    obj_frame_tiles(gMapObjectPic_Wally_6),
    obj_frame_tiles(gMapObjectPic_Wally_7),
    obj_frame_tiles(gMapObjectPic_Wally_8)
};

const struct SpriteFrameImage gMapObjectPicTable_LittleBoy3[] = {
    obj_frame_tiles(gMapObjectPic_LittleBoy3_0),
    obj_frame_tiles(gMapObjectPic_LittleBoy3_1),
    obj_frame_tiles(gMapObjectPic_LittleBoy3_2),
    obj_frame_tiles(gMapObjectPic_LittleBoy3_3),
    obj_frame_tiles(gMapObjectPic_LittleBoy3_4),
    obj_frame_tiles(gMapObjectPic_LittleBoy3_5),
    obj_frame_tiles(gMapObjectPic_LittleBoy3_6),
    obj_frame_tiles(gMapObjectPic_LittleBoy3_7),
    obj_frame_tiles(gMapObjectPic_LittleBoy3_8)
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanFishing[] = {
    obj_frame_tiles(gMapObjectPic_BrendanFishing_0),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_1),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_2),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_3),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_4),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_5),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_6),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_7),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_8),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_9),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_10),
    obj_frame_tiles(gMapObjectPic_BrendanFishing_11)
};

const struct SpriteFrameImage gMapObjectPicTable_MayFishing[] = {
    obj_frame_tiles(gMapObjectPic_MayFishing_0),
    obj_frame_tiles(gMapObjectPic_MayFishing_1),
    obj_frame_tiles(gMapObjectPic_MayFishing_2),
    obj_frame_tiles(gMapObjectPic_MayFishing_3),
    obj_frame_tiles(gMapObjectPic_MayFishing_4),
    obj_frame_tiles(gMapObjectPic_MayFishing_5),
    obj_frame_tiles(gMapObjectPic_MayFishing_6),
    obj_frame_tiles(gMapObjectPic_MayFishing_7),
    obj_frame_tiles(gMapObjectPic_MayFishing_8),
    obj_frame_tiles(gMapObjectPic_MayFishing_9),
    obj_frame_tiles(gMapObjectPic_MayFishing_10),
    obj_frame_tiles(gMapObjectPic_MayFishing_11)
};

const struct SpriteFrameImage gMapObjectPicTable_HotSpringsOldWoman[] = {
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_0),
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_1),
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_2),
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_3),
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_4),
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_5),
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_6),
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_7),
    obj_frame_tiles(gMapObjectPic_HotSpringsOldWoman_8)
};

const struct SpriteFrameImage gMapObjectPicTable_SSTidal[] = {
    obj_frame_tiles(gMapObjectPic_SSTidal),
    obj_frame_tiles(gMapObjectPic_SSTidal),
    obj_frame_tiles(gMapObjectPic_SSTidal),
    obj_frame_tiles(gMapObjectPic_SSTidal),
    obj_frame_tiles(gMapObjectPic_SSTidal),
    obj_frame_tiles(gMapObjectPic_SSTidal),
    obj_frame_tiles(gMapObjectPic_SSTidal),
    obj_frame_tiles(gMapObjectPic_SSTidal),
    obj_frame_tiles(gMapObjectPic_SSTidal)
};

const struct SpriteFrameImage gMapObjectPicTable_SubmarineShadow[] = {
    obj_frame_tiles(gMapObjectPic_SubmarineShadow),
    obj_frame_tiles(gMapObjectPic_SubmarineShadow),
    obj_frame_tiles(gMapObjectPic_SubmarineShadow),
    obj_frame_tiles(gMapObjectPic_SubmarineShadow),
    obj_frame_tiles(gMapObjectPic_SubmarineShadow),
    obj_frame_tiles(gMapObjectPic_SubmarineShadow),
    obj_frame_tiles(gMapObjectPic_SubmarineShadow),
    obj_frame_tiles(gMapObjectPic_SubmarineShadow),
    obj_frame_tiles(gMapObjectPic_SubmarineShadow)
};

const struct SpriteFrameImage gMapObjectPicTable_PichuDoll[] = {
    obj_frame_tiles(gMapObjectPic_PichuDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_PikachuDoll[] = {
    obj_frame_tiles(gMapObjectPic_PikachuDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_MarillDoll[] = {
    obj_frame_tiles(gMapObjectPic_MarillDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_TogepiDoll[] = {
    obj_frame_tiles(gMapObjectPic_TogepiDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_CyndaquilDoll[] = {
    obj_frame_tiles(gMapObjectPic_CyndaquilDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_ChikoritaDoll[] = {
    obj_frame_tiles(gMapObjectPic_ChikoritaDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_TotodileDoll[] = {
    obj_frame_tiles(gMapObjectPic_TotodileDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_JigglypuffDoll[] = {
    obj_frame_tiles(gMapObjectPic_JigglypuffDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_MeowthDoll[] = {
    obj_frame_tiles(gMapObjectPic_MeowthDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_ClefairyDoll[] = {
    obj_frame_tiles(gMapObjectPic_ClefairyDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_DittoDoll[] = {
    obj_frame_tiles(gMapObjectPic_DittoDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_SmoochumDoll[] = {
    obj_frame_tiles(gMapObjectPic_SmoochumDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_TreeckoDoll[] = {
    obj_frame_tiles(gMapObjectPic_TreeckoDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_TorchicDoll[] = {
    obj_frame_tiles(gMapObjectPic_TorchicDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_MudkipDoll[] = {
    obj_frame_tiles(gMapObjectPic_MudkipDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_DuskullDoll[] = {
    obj_frame_tiles(gMapObjectPic_DuskullDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_WynautDoll[] = {
    obj_frame_tiles(gMapObjectPic_WynautDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BaltoyDoll[] = {
    obj_frame_tiles(gMapObjectPic_BaltoyDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_KecleonDoll[] = {
    obj_frame_tiles(gMapObjectPic_KecleonDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_AzurillDoll[] = {
    obj_frame_tiles(gMapObjectPic_AzurillDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_SkittyDoll[] = {
    obj_frame_tiles(gMapObjectPic_SkittyDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_SwabluDoll[] = {
    obj_frame_tiles(gMapObjectPic_SwabluDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_GulpinDoll[] = {
    obj_frame_tiles(gMapObjectPic_GulpinDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_LotadDoll[] = {
    obj_frame_tiles(gMapObjectPic_LotadDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_SeedotDoll[] = {
    obj_frame_tiles(gMapObjectPic_SeedotDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_PikaCushion[] = {
    obj_frame_tiles(gMapObjectPic_PikaCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_RoundCushion[] = {
    obj_frame_tiles(gMapObjectPic_RoundCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_KissCushion[] = {
    obj_frame_tiles(gMapObjectPic_KissCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_ZigzagCushion[] = {
    obj_frame_tiles(gMapObjectPic_ZigzagCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_SpinCushion[] = {
    obj_frame_tiles(gMapObjectPic_SpinCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_DiamondCushion[] = {
    obj_frame_tiles(gMapObjectPic_DiamondCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_BallCushion[] = {
    obj_frame_tiles(gMapObjectPic_BallCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_GrassCushion[] = {
    obj_frame_tiles(gMapObjectPic_GrassCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_FireCushion[] = {
    obj_frame_tiles(gMapObjectPic_FireCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_WaterCushion[] = {
    obj_frame_tiles(gMapObjectPic_WaterCushion)
};

const struct SpriteFrameImage gMapObjectPicTable_BigSnorlaxDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigSnorlaxDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigRhydonDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigRhydonDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigLaprasDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigLaprasDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigVenusaurDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigVenusaurDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigCharizardDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigCharizardDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigBlastoiseDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigBlastoiseDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigWailmerDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigWailmerDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigRegirockDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigRegirockDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigRegiceDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigRegiceDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_BigRegisteelDoll[] = {
    obj_frame_tiles(gMapObjectPic_BigRegisteelDoll)
};

const struct SpriteFrameImage gMapObjectPicTable_LatiasLatios[] = {
    obj_frame_tiles(gMapObjectPic_LatiasLatios_0),
    obj_frame_tiles(gMapObjectPic_LatiasLatios_0),
    obj_frame_tiles(gMapObjectPic_LatiasLatios_0),
    obj_frame_tiles(gMapObjectPic_LatiasLatios_1),
    obj_frame_tiles(gMapObjectPic_LatiasLatios_2),
    obj_frame_tiles(gMapObjectPic_LatiasLatios_1),
    obj_frame_tiles(gMapObjectPic_LatiasLatios_2),
    obj_frame_tiles(gMapObjectPic_LatiasLatios_1),
    obj_frame_tiles(gMapObjectPic_LatiasLatios_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Boy5[] = {
    obj_frame_tiles(gMapObjectPic_Boy5_0),
    obj_frame_tiles(gMapObjectPic_Boy5_1),
    obj_frame_tiles(gMapObjectPic_Boy5_2),
    obj_frame_tiles(gMapObjectPic_Boy5_0),
    obj_frame_tiles(gMapObjectPic_Boy5_0),
    obj_frame_tiles(gMapObjectPic_Boy5_1),
    obj_frame_tiles(gMapObjectPic_Boy5_1),
    obj_frame_tiles(gMapObjectPic_Boy5_2),
    obj_frame_tiles(gMapObjectPic_Boy5_2)
};

const struct SpriteFrameImage gMapObjectPicTable_ContestJudge[] = {
    obj_frame_tiles(gMapObjectPic_ContestJudge_0),
    obj_frame_tiles(gMapObjectPic_ContestJudge_1),
    obj_frame_tiles(gMapObjectPic_ContestJudge_2),
    obj_frame_tiles(gMapObjectPic_ContestJudge_3),
    obj_frame_tiles(gMapObjectPic_ContestJudge_4),
    obj_frame_tiles(gMapObjectPic_ContestJudge_5),
    obj_frame_tiles(gMapObjectPic_ContestJudge_6),
    obj_frame_tiles(gMapObjectPic_ContestJudge_7),
    obj_frame_tiles(gMapObjectPic_ContestJudge_8)
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanWatering[] = {
    obj_frame_tiles(gMapObjectPic_BrendanWatering_0),
    obj_frame_tiles(gMapObjectPic_BrendanWatering_1),
    obj_frame_tiles(gMapObjectPic_BrendanWatering_2),
    obj_frame_tiles(gMapObjectPic_BrendanWatering_3),
    obj_frame_tiles(gMapObjectPic_BrendanWatering_3),
    obj_frame_tiles(gMapObjectPic_BrendanWatering_4),
    obj_frame_tiles(gMapObjectPic_BrendanWatering_4),
    obj_frame_tiles(gMapObjectPic_BrendanWatering_5),
    obj_frame_tiles(gMapObjectPic_BrendanWatering_5)
};

const struct SpriteFrameImage gMapObjectPicTable_MayWatering[] = {
    obj_frame_tiles(gMapObjectPic_MayWatering_0),
    obj_frame_tiles(gMapObjectPic_MayWatering_1),
    obj_frame_tiles(gMapObjectPic_MayWatering_2),
    obj_frame_tiles(gMapObjectPic_MayWatering_3),
    obj_frame_tiles(gMapObjectPic_MayWatering_3),
    obj_frame_tiles(gMapObjectPic_MayWatering_4),
    obj_frame_tiles(gMapObjectPic_MayWatering_4),
    obj_frame_tiles(gMapObjectPic_MayWatering_5),
    obj_frame_tiles(gMapObjectPic_MayWatering_5)
};

const struct SpriteFrameImage gMapObjectPicTable_BrendanDecorating[] = {
    obj_frame_tiles(gMapObjectPic_BrendanDecorating)
};

const struct SpriteFrameImage gMapObjectPicTable_MayDecorating[] = {
    obj_frame_tiles(gMapObjectPic_MayDecorating)
};

const struct SpriteFrameImage gMapObjectPicTable_Archie[] = {
    obj_frame_tiles(gMapObjectPic_Archie_0),
    obj_frame_tiles(gMapObjectPic_Archie_1),
    obj_frame_tiles(gMapObjectPic_Archie_2),
    obj_frame_tiles(gMapObjectPic_Archie_3),
    obj_frame_tiles(gMapObjectPic_Archie_4),
    obj_frame_tiles(gMapObjectPic_Archie_5),
    obj_frame_tiles(gMapObjectPic_Archie_6),
    obj_frame_tiles(gMapObjectPic_Archie_7),
    obj_frame_tiles(gMapObjectPic_Archie_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Maxie[] = {
    obj_frame_tiles(gMapObjectPic_Maxie_0),
    obj_frame_tiles(gMapObjectPic_Maxie_1),
    obj_frame_tiles(gMapObjectPic_Maxie_2),
    obj_frame_tiles(gMapObjectPic_Maxie_3),
    obj_frame_tiles(gMapObjectPic_Maxie_4),
    obj_frame_tiles(gMapObjectPic_Maxie_5),
    obj_frame_tiles(gMapObjectPic_Maxie_6),
    obj_frame_tiles(gMapObjectPic_Maxie_7),
    obj_frame_tiles(gMapObjectPic_Maxie_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Kyogre[] = {
    obj_frame_tiles(gMapObjectPic_Kyogre_0),
    obj_frame_tiles(gMapObjectPic_Kyogre_0),
    obj_frame_tiles(gMapObjectPic_Kyogre_0),
    obj_frame_tiles(gMapObjectPic_Kyogre_1),
    obj_frame_tiles(gMapObjectPic_Kyogre_1),
    obj_frame_tiles(gMapObjectPic_Kyogre_1),
    obj_frame_tiles(gMapObjectPic_Kyogre_1),
    obj_frame_tiles(gMapObjectPic_Kyogre_1),
    obj_frame_tiles(gMapObjectPic_Kyogre_1)
};

const struct SpriteFrameImage gMapObjectPicTable_Groudon[] = {
    obj_frame_tiles(gMapObjectPic_Groudon_0),
    obj_frame_tiles(gMapObjectPic_Groudon_0),
    obj_frame_tiles(gMapObjectPic_Groudon_0),
    obj_frame_tiles(gMapObjectPic_Groudon_1),
    obj_frame_tiles(gMapObjectPic_Groudon_1),
    obj_frame_tiles(gMapObjectPic_Groudon_1),
    obj_frame_tiles(gMapObjectPic_Groudon_1),
    obj_frame_tiles(gMapObjectPic_Groudon_1),
    obj_frame_tiles(gMapObjectPic_Groudon_1)
};

const struct SpriteFrameImage gMapObjectPicTable_Fossil[] = {
    obj_frame_tiles(gMapObjectPic_Fossil)
};

const struct SpriteFrameImage gMapObjectPicTable_Regi[] = {
    obj_frame_tiles(gMapObjectPic_Regi),
    obj_frame_tiles(gMapObjectPic_Regi),
    obj_frame_tiles(gMapObjectPic_Regi),
    obj_frame_tiles(gMapObjectPic_Regi),
    obj_frame_tiles(gMapObjectPic_Regi),
    obj_frame_tiles(gMapObjectPic_Regi),
    obj_frame_tiles(gMapObjectPic_Regi),
    obj_frame_tiles(gMapObjectPic_Regi),
    obj_frame_tiles(gMapObjectPic_Regi)
};

const struct SpriteFrameImage gMapObjectPicTable_Skitty[] = {
    obj_frame_tiles(gMapObjectPic_Skitty_0),
    obj_frame_tiles(gMapObjectPic_Skitty_1),
    obj_frame_tiles(gMapObjectPic_Skitty_2),
    obj_frame_tiles(gMapObjectPic_Skitty_0),
    obj_frame_tiles(gMapObjectPic_Skitty_0),
    obj_frame_tiles(gMapObjectPic_Skitty_1),
    obj_frame_tiles(gMapObjectPic_Skitty_1),
    obj_frame_tiles(gMapObjectPic_Skitty_2),
    obj_frame_tiles(gMapObjectPic_Skitty_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Kecleon[] = {
    obj_frame_tiles(gMapObjectPic_Kecleon_0),
    obj_frame_tiles(gMapObjectPic_Kecleon_1),
    obj_frame_tiles(gMapObjectPic_Kecleon_2),
    obj_frame_tiles(gMapObjectPic_Kecleon_0),
    obj_frame_tiles(gMapObjectPic_Kecleon_0),
    obj_frame_tiles(gMapObjectPic_Kecleon_1),
    obj_frame_tiles(gMapObjectPic_Kecleon_1),
    obj_frame_tiles(gMapObjectPic_Kecleon_2),
    obj_frame_tiles(gMapObjectPic_Kecleon_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Rayquaza[] = {
    obj_frame_tiles(gMapObjectPic_Rayquaza_0),
    obj_frame_tiles(gMapObjectPic_Rayquaza_0),
    obj_frame_tiles(gMapObjectPic_Rayquaza_0),
    obj_frame_tiles(gMapObjectPic_Rayquaza_1),
    obj_frame_tiles(gMapObjectPic_Rayquaza_1),
    obj_frame_tiles(gMapObjectPic_Rayquaza_1),
    obj_frame_tiles(gMapObjectPic_Rayquaza_1),
    obj_frame_tiles(gMapObjectPic_Rayquaza_1),
    obj_frame_tiles(gMapObjectPic_Rayquaza_1)
};

const struct SpriteFrameImage gMapObjectPicTable_Zigzagoon[] = {
    obj_frame_tiles(gMapObjectPic_Zigzagoon_0),
    obj_frame_tiles(gMapObjectPic_Zigzagoon_1),
    obj_frame_tiles(gMapObjectPic_Zigzagoon_2),
    obj_frame_tiles(gMapObjectPic_Zigzagoon_0),
    obj_frame_tiles(gMapObjectPic_Zigzagoon_0),
    obj_frame_tiles(gMapObjectPic_Zigzagoon_1),
    obj_frame_tiles(gMapObjectPic_Zigzagoon_1),
    obj_frame_tiles(gMapObjectPic_Zigzagoon_2),
    obj_frame_tiles(gMapObjectPic_Zigzagoon_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Pikachu[] = {
    obj_frame_tiles(gMapObjectPic_Pikachu_0),
    obj_frame_tiles(gMapObjectPic_Pikachu_1),
    obj_frame_tiles(gMapObjectPic_Pikachu_2),
    obj_frame_tiles(gMapObjectPic_Pikachu_0),
    obj_frame_tiles(gMapObjectPic_Pikachu_0),
    obj_frame_tiles(gMapObjectPic_Pikachu_1),
    obj_frame_tiles(gMapObjectPic_Pikachu_1),
    obj_frame_tiles(gMapObjectPic_Pikachu_2),
    obj_frame_tiles(gMapObjectPic_Pikachu_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Azumarill[] = {
    obj_frame_tiles(gMapObjectPic_Azumarill_0),
    obj_frame_tiles(gMapObjectPic_Azumarill_1),
    obj_frame_tiles(gMapObjectPic_Azumarill_2),
    obj_frame_tiles(gMapObjectPic_Azumarill_0),
    obj_frame_tiles(gMapObjectPic_Azumarill_0),
    obj_frame_tiles(gMapObjectPic_Azumarill_1),
    obj_frame_tiles(gMapObjectPic_Azumarill_1),
    obj_frame_tiles(gMapObjectPic_Azumarill_2),
    obj_frame_tiles(gMapObjectPic_Azumarill_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Wingull[] = {
    obj_frame_tiles(gMapObjectPic_Wingull_0),
    obj_frame_tiles(gMapObjectPic_Wingull_1),
    obj_frame_tiles(gMapObjectPic_Wingull_2),
    obj_frame_tiles(gMapObjectPic_Wingull_3),
    obj_frame_tiles(gMapObjectPic_Wingull_3),
    obj_frame_tiles(gMapObjectPic_Wingull_4),
    obj_frame_tiles(gMapObjectPic_Wingull_4),
    obj_frame_tiles(gMapObjectPic_Wingull_5),
    obj_frame_tiles(gMapObjectPic_Wingull_5)
};

const struct SpriteFrameImage gMapObjectPicTable_TuberMSwimming[] = {
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_0),
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_1),
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_2),
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_3),
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_4),
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_5),
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_6),
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_7),
    obj_frame_tiles(gMapObjectPic_TuberMSwimming_8)
};

const struct SpriteFrameImage gMapObjectPicTable_Azurill[] = {
    obj_frame_tiles(gMapObjectPic_Azurill_0),
    obj_frame_tiles(gMapObjectPic_Azurill_1),
    obj_frame_tiles(gMapObjectPic_Azurill_2),
    obj_frame_tiles(gMapObjectPic_Azurill_0),
    obj_frame_tiles(gMapObjectPic_Azurill_0),
    obj_frame_tiles(gMapObjectPic_Azurill_1),
    obj_frame_tiles(gMapObjectPic_Azurill_1),
    obj_frame_tiles(gMapObjectPic_Azurill_2),
    obj_frame_tiles(gMapObjectPic_Azurill_2)
};

const struct SpriteFrameImage gMapObjectPicTable_Mom[] = {
    obj_frame_tiles(gMapObjectPic_Mom_0),
    obj_frame_tiles(gMapObjectPic_Mom_1),
    obj_frame_tiles(gMapObjectPic_Mom_2),
    obj_frame_tiles(gMapObjectPic_Mom_3),
    obj_frame_tiles(gMapObjectPic_Mom_4),
    obj_frame_tiles(gMapObjectPic_Mom_5),
    obj_frame_tiles(gMapObjectPic_Mom_6),
    obj_frame_tiles(gMapObjectPic_Mom_7),
    obj_frame_tiles(gMapObjectPic_Mom_8),
};

const union AnimCmd gMapObjectImageAnim_83708C8[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83708DC[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83708E4[] = {
    ANIMCMD_FRAME(1, 16),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83708EC[] = {
    ANIMCMD_FRAME(2, 16),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83708F4[] = {
    ANIMCMD_FRAME(2, 16, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83708FC[] = {
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(3, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370910[] = {
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(4, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370924[] = {
    ANIMCMD_FRAME(5, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(6, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370938[] = {
    ANIMCMD_FRAME(5, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(6, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_837094C[] = {
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(3, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370960[] = {
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(4, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370974[] = {
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370988[] = {
    ANIMCMD_FRAME(5, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(6, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 4, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_837099C[] = {
    ANIMCMD_FRAME(3, 2),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(3, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83709B0[] = {
    ANIMCMD_FRAME(4, 2),
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_FRAME(4, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83709C4[] = {
    ANIMCMD_FRAME(5, 2),
    ANIMCMD_FRAME(2, 2),
    ANIMCMD_FRAME(6, 2),
    ANIMCMD_FRAME(2, 2),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83709D8[] = {
    ANIMCMD_FRAME(5, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(6, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 2, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_83709EC[] = {
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(3, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A00[] = {
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_FRAME(4, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A14[] = {
    ANIMCMD_FRAME(5, 1),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_FRAME(6, 1),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A28[] = {
    ANIMCMD_FRAME(5, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(6, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 1, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A3C[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A44[] = {
    ANIMCMD_FRAME(1, 16),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A4C[] = {
    ANIMCMD_FRAME(2, 16),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A54[] = {
    ANIMCMD_FRAME(2, 16, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A5C[] = {
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A70[] = {
    ANIMCMD_FRAME(5, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(6, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A84[] = {
    ANIMCMD_FRAME(7, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(8, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370A98[] = {
    ANIMCMD_FRAME(7, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370AAC[] = {
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370AC0[] = {
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370AD4[] = {
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370AE8[] = {
    ANIMCMD_FRAME(7, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 4, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370AFC[] = {
    ANIMCMD_FRAME(3, 2),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(4, 2),
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370B10[] = {
    ANIMCMD_FRAME(5, 2),
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_FRAME(6, 2),
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370B24[] = {
    ANIMCMD_FRAME(7, 2),
    ANIMCMD_FRAME(2, 2),
    ANIMCMD_FRAME(8, 2),
    ANIMCMD_FRAME(2, 2),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370B38[] = {
    ANIMCMD_FRAME(7, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 2, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 2, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370B4C[] = {
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370B60[] = {
    ANIMCMD_FRAME(5, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_FRAME(6, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370B74[] = {
    ANIMCMD_FRAME(7, 1),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_FRAME(8, 1),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370B88[] = {
    ANIMCMD_FRAME(7, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(8, 1, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 1, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370B9C[] = {
    ANIMCMD_FRAME(12, 5),
    ANIMCMD_FRAME(9, 3),
    ANIMCMD_FRAME(13, 5),
    ANIMCMD_FRAME(9, 3),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370BB0[] = {
    ANIMCMD_FRAME(14, 5),
    ANIMCMD_FRAME(10, 3),
    ANIMCMD_FRAME(15, 5),
    ANIMCMD_FRAME(10, 3),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370BC4[] = {
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(11, 3),
    ANIMCMD_FRAME(17, 5),
    ANIMCMD_FRAME(11, 3),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370BD8[] = {
    ANIMCMD_FRAME(16, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(11, 3, .hFlip = TRUE),
    ANIMCMD_FRAME(17, 5, .hFlip = TRUE),
    ANIMCMD_FRAME(11, 3, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370BEC[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C04[] = {
    ANIMCMD_FRAME(9, 32),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370C0C[] = {
    ANIMCMD_FRAME(10, 32),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370C14[] = {
    ANIMCMD_FRAME(11, 32),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370C1C[] = {
    ANIMCMD_FRAME(11, 32, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370C24[] = {
    ANIMCMD_FRAME(9, 4),
    ANIMCMD_FRAME(10, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C30[] = {
    ANIMCMD_FRAME(13, 4),
    ANIMCMD_FRAME(14, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C3C[] = {
    ANIMCMD_FRAME(17, 4),
    ANIMCMD_FRAME(18, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C48[] = {
    ANIMCMD_FRAME(17, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(18, 4, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C54[] = {
    ANIMCMD_FRAME(11, 4),
    ANIMCMD_FRAME(12, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C60[] = {
    ANIMCMD_FRAME(15, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C6C[] = {
    ANIMCMD_FRAME(19, 4),
    ANIMCMD_FRAME(20, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C78[] = {
    ANIMCMD_FRAME(19, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(20, 4, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C84[] = {
    ANIMCMD_FRAME(9, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C90[] = {
    ANIMCMD_FRAME(13, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370C9C[] = {
    ANIMCMD_FRAME(17, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370CA8[] = {
    ANIMCMD_FRAME(17, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 4, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370CB4[] = {
    ANIMCMD_FRAME(11, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370CC0[] = {
    ANIMCMD_FRAME(15, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370CCC[] = {
    ANIMCMD_FRAME(19, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370CD8[] = {
    ANIMCMD_FRAME(19, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 4, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370CE4[] = {
    ANIMCMD_FRAME(21, 4),
    ANIMCMD_FRAME(10, 4),
    ANIMCMD_FRAME(22, 4),
    ANIMCMD_FRAME(10, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370CF8[] = {
    ANIMCMD_FRAME(23, 4),
    ANIMCMD_FRAME(14, 4),
    ANIMCMD_FRAME(24, 4),
    ANIMCMD_FRAME(14, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370D0C[] = {
    ANIMCMD_FRAME(25, 4),
    ANIMCMD_FRAME(18, 4),
    ANIMCMD_FRAME(26, 4),
    ANIMCMD_FRAME(18, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370D20[] = {
    ANIMCMD_FRAME(25, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(18, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(26, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(18, 4, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370D34[] = {
    ANIMCMD_FRAME(0, 32),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370D3C[] = {
    ANIMCMD_FRAME(1, 32),
    ANIMCMD_FRAME(2, 32),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370D48[] = {
    ANIMCMD_FRAME(3, 48),
    ANIMCMD_FRAME(4, 48),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370D54[] = {
    ANIMCMD_FRAME(5, 32),
    ANIMCMD_FRAME(5, 32),
    ANIMCMD_FRAME(6, 32),
    ANIMCMD_FRAME(6, 32),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370D68[] = {
    ANIMCMD_FRAME(7, 48),
    ANIMCMD_FRAME(7, 48),
    ANIMCMD_FRAME(8, 48),
    ANIMCMD_FRAME(8, 48),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370D7C[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(9, 32),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370D8C[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370DA0[] = {
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370DB4[] = {
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_FRAME(9, 4),
    ANIMCMD_FRAME(10, 4),
    ANIMCMD_FRAME(11, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370DC8[] = {
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370DDC[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370DF0[] = {
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(3, 4, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370E04[] = {
    ANIMCMD_FRAME(11, 4),
    ANIMCMD_FRAME(10, 6),
    ANIMCMD_FRAME(9, 6),
    ANIMCMD_FRAME(8, 6),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370E18[] = {
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_FRAME(6, 6),
    ANIMCMD_FRAME(5, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370E2C[] = {
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370E40[] = {
    ANIMCMD_FRAME(3, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 4, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 4, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gMapObjectImageAnim_8370E54[] = {
    ANIMCMD_FRAME(10, 6),
    ANIMCMD_FRAME(11, 6),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(11, 30),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370E68[] = {
    ANIMCMD_FRAME(6, 6),
    ANIMCMD_FRAME(7, 6),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(7, 30),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370E7C[] = {
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(3, 30),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gMapObjectImageAnim_8370E90[] = {
    ANIMCMD_FRAME(2, 6, .hFlip = TRUE),
    ANIMCMD_FRAME(3, 6, .hFlip = TRUE),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME(3, 30, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AffineAnimCmd gMapObjectRotScalAnim_8370EA4[] = {
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 1),
    AFFINEANIMCMD_LOOP(7),
    AFFINEANIMCMD_JUMP(0)
};

const union AffineAnimCmd gMapObjectRotScalAnim_8370ED4[] = {
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 1),
    AFFINEANIMCMD_LOOP(15),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 1),
    AFFINEANIMCMD_LOOP(15),
    AFFINEANIMCMD_JUMP(0)
};

const union AnimCmd *const gMapObjectImageAnimTable_Inanimate[] = {
    gMapObjectImageAnim_83708C8
};

const union AnimCmd *const gMapObjectImageAnimTable_QuintyPlump[] = {
    gMapObjectImageAnim_83708DC,
    gMapObjectImageAnim_83708E4,
    gMapObjectImageAnim_83708EC,
    gMapObjectImageAnim_83708F4,
    gMapObjectImageAnim_83708FC,
    gMapObjectImageAnim_8370910,
    gMapObjectImageAnim_8370924,
    gMapObjectImageAnim_8370938,
    gMapObjectImageAnim_837094C,
    gMapObjectImageAnim_8370960,
    gMapObjectImageAnim_8370974,
    gMapObjectImageAnim_8370988,
    gMapObjectImageAnim_837099C,
    gMapObjectImageAnim_83709B0,
    gMapObjectImageAnim_83709C4,
    gMapObjectImageAnim_83709D8,
    gMapObjectImageAnim_83709EC,
    gMapObjectImageAnim_8370A00,
    gMapObjectImageAnim_8370A14,
    gMapObjectImageAnim_8370A28
};

const union AnimCmd *const gMapObjectImageAnimTable_Standard[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88
};

const union AnimCmd *const gMapObjectImageAnimTable_BrendanMayNormal[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88,
    gMapObjectImageAnim_8370B9C,
    gMapObjectImageAnim_8370BB0,
    gMapObjectImageAnim_8370BC4,
    gMapObjectImageAnim_8370BD8
};

const union AnimCmd *const gMapObjectImageAnimTable_AcroBike[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88,
    gMapObjectImageAnim_8370C24,
    gMapObjectImageAnim_8370C30,
    gMapObjectImageAnim_8370C3C,
    gMapObjectImageAnim_8370C48,
    gMapObjectImageAnim_8370C54,
    gMapObjectImageAnim_8370C60,
    gMapObjectImageAnim_8370C6C,
    gMapObjectImageAnim_8370C78,
    gMapObjectImageAnim_8370C84,
    gMapObjectImageAnim_8370C90,
    gMapObjectImageAnim_8370C9C,
    gMapObjectImageAnim_8370CA8,
    gMapObjectImageAnim_8370CB4,
    gMapObjectImageAnim_8370CC0,
    gMapObjectImageAnim_8370CCC,
    gMapObjectImageAnim_8370CD8,
    gMapObjectImageAnim_8370CE4,
    gMapObjectImageAnim_8370CF8,
    gMapObjectImageAnim_8370D0C,
    gMapObjectImageAnim_8370D20
};

const union AnimCmd *const gMapObjectImageAnimTable_Surfing[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88,
    gMapObjectImageAnim_8370C04,
    gMapObjectImageAnim_8370C0C,
    gMapObjectImageAnim_8370C14,
    gMapObjectImageAnim_8370C1C
};

const union AnimCmd *const gMapObjectImageAnimTable_Nurse[] = {
    gMapObjectImageAnim_8370A3C,
    gMapObjectImageAnim_8370A44,
    gMapObjectImageAnim_8370A4C,
    gMapObjectImageAnim_8370A54,
    gMapObjectImageAnim_8370A5C,
    gMapObjectImageAnim_8370A70,
    gMapObjectImageAnim_8370A84,
    gMapObjectImageAnim_8370A98,
    gMapObjectImageAnim_8370AAC,
    gMapObjectImageAnim_8370AC0,
    gMapObjectImageAnim_8370AD4,
    gMapObjectImageAnim_8370AE8,
    gMapObjectImageAnim_8370AFC,
    gMapObjectImageAnim_8370B10,
    gMapObjectImageAnim_8370B24,
    gMapObjectImageAnim_8370B38,
    gMapObjectImageAnim_8370B4C,
    gMapObjectImageAnim_8370B60,
    gMapObjectImageAnim_8370B74,
    gMapObjectImageAnim_8370B88,
    gMapObjectImageAnim_8370D7C
};

const union AnimCmd *const gMapObjectImageAnimTable_FieldMove[] = {
    gMapObjectImageAnim_8370BEC
};

const union AnimCmd *const gMapObjectImageAnimTable_BerryTree[] = {
    gMapObjectImageAnim_8370D34,
    gMapObjectImageAnim_8370D3C,
    gMapObjectImageAnim_8370D48,
    gMapObjectImageAnim_8370D54,
    gMapObjectImageAnim_8370D68
};

const union AnimCmd *const gMapObjectImageAnimTable_BreakableRock[] = {
    gMapObjectImageAnim_83708C8,
    gMapObjectImageAnim_8370D8C
};

const union AnimCmd *const gMapObjectImageAnimTable_CuttableTree[] = {
    gMapObjectImageAnim_83708C8,
    gMapObjectImageAnim_8370DA0
};

const union AnimCmd *const gMapObjectImageAnimTable_Fishing[] = {
    gMapObjectImageAnim_8370DB4,
    gMapObjectImageAnim_8370DC8,
    gMapObjectImageAnim_8370DDC,
    gMapObjectImageAnim_8370DF0,
    gMapObjectImageAnim_8370E04,
    gMapObjectImageAnim_8370E18,
    gMapObjectImageAnim_8370E2C,
    gMapObjectImageAnim_8370E40,
    gMapObjectImageAnim_8370E54,
    gMapObjectImageAnim_8370E68,
    gMapObjectImageAnim_8370E7C,
    gMapObjectImageAnim_8370E90
};

const union AffineAnimCmd *const gMapObjectRotScalAnimTable_KyogreGroudon[] = {
    gMapObjectRotScalAnim_8370EA4,
    gMapObjectRotScalAnim_8370ED4
};

const struct OamData gFieldOamData_8x8 = {
    .shape = 0,
    .size = 0,
    .priority = 2
};

const struct OamData gFieldOamData_16x8 = {
    .shape = 1,
    .size = 0,
    .priority = 2
};

const struct OamData gFieldOamData_16x16 = {
    .shape = 0,
    .size = 1,
    .priority = 2
};

const struct OamData gFieldOamData_32x8 = {
    .shape = 1,
    .size = 1,
    .priority = 2
};

const struct OamData gFieldOamData_64x32 = {
    .shape = 1,
    .size = 3,
    .priority = 2
};

const struct OamData gFieldOamData_16x32 = {
    .shape = 2,
    .size = 2,
    .priority = 2
};

const struct OamData gFieldOamData_32x32 = {
    .shape = 0,
    .size = 2,
    .priority = 2
};

const struct OamData gFieldOamData_64x64 = {
    .shape = 0,
    .size = 3,
    .priority = 2
};

const struct Subsprite gMapObjectSubspriteTable_16x16_0[] = {
    { -8,  -8, 0, 1, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_1[] = {
    { -8,  -8, 0, 1, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_2[] = {
    { -8,  -8, 1, 0, 0, 2},
    { -8,   0, 1, 0, 2, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_3[] = {
    { -8,  -8, 0, 1, 0, 2},
    { -8,  -8, 0, 1, 0, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_4[] = {
    { -8,  -8, 0, 1, 0, 1},
    { -8,  -8, 0, 1, 0, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_16x16[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_16x16_0},
    {1, gMapObjectSubspriteTable_16x16_1},
    {2, gMapObjectSubspriteTable_16x16_2},
    {2, gMapObjectSubspriteTable_16x16_3},
    {2, gMapObjectSubspriteTable_16x16_4}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_0[] = {
    { -8, -16, 2, 2, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_1[] = {
    { -8, -16, 2, 2, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_2[] = {
    { -8, -16, 0, 1, 0, 2},
    { -8,   0, 1, 0, 4, 2},
    { -8,   8, 1, 0, 6, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_3[] = {
    { -8, -16, 0, 1, 0, 2},
    { -8,   0, 0, 1, 4, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_4[] = {
    { -8, -16, 0, 1, 0, 1},
    { -8,   0, 0, 1, 4, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_16x32[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_16x32_0},
    {1, gMapObjectSubspriteTable_16x32_1},
    {3, gMapObjectSubspriteTable_16x32_2},
    {2, gMapObjectSubspriteTable_16x32_3},
    {2, gMapObjectSubspriteTable_16x32_4}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_0[] = {
    {-16, -16, 0, 2, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_1[] = {
    {-16, -16, 0, 2, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_2[] = {
    {-16, -16, 1, 2, 0, 2},
    {-16,   0, 1, 1, 8, 2},
    {-16,   8, 1, 1, 12, 3}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_3[] = {
    {-16, -16, 1, 2, 0, 2},
    {-16,   0, 1, 2, 8, 3}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_4[] = {
    {-16, -16, 1, 2, 0, 1},
    {-16,   0, 1, 2, 8, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_32x32[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_32x32_0},
    {1, gMapObjectSubspriteTable_32x32_1},
    {3, gMapObjectSubspriteTable_32x32_2},
    {2, gMapObjectSubspriteTable_32x32_3},
    {2, gMapObjectSubspriteTable_32x32_4}
};

const struct Subsprite gMapObjectSubspriteTable_Truck_0[] = {
    {-24, -24, 1, 1, 0, 2},
    {  8, -24, 1, 0, 4, 2},
    {-24, -16, 1, 1, 6, 2},
    {  8, -16, 1, 0, 10, 2},
    {-24,  -8, 1, 1, 12, 2},
    {  8,  -8, 1, 0, 16, 2},
    {-24,   0, 1, 1, 18, 2},
    {  8,   0, 1, 0, 22, 2},
    {-24,   8, 1, 1, 24, 2},
    {  8,   8, 1, 0, 28, 2},
    {-24,  16, 1, 1, 30, 2},
    {  8,  16, 1, 0, 34, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_Truck[] = {
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_0[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_1[] = {
    {-32, -16, 1, 3, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_2[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_3[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_Unused[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_Unused_0},
    {1, gMapObjectSubspriteTable_Unused_1},
    {1, gMapObjectSubspriteTable_Unused_2},
    {1, gMapObjectSubspriteTable_Unused_3},
    {1, gMapObjectSubspriteTable_Unused_3}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_0[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_1[] = {
    {-32, -32, 0, 3, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_2[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_3[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_CableCar[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_CableCar_0},
    {1, gMapObjectSubspriteTable_CableCar_1},
    {1, gMapObjectSubspriteTable_CableCar_2},
    {1, gMapObjectSubspriteTable_CableCar_3},
    {1, gMapObjectSubspriteTable_CableCar_3}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_0[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 1, 8, 2},
    {-48, -12, 1, 1, 12, 2},
    {-16, -12, 1, 1, 16, 2},
    { 16, -12, 1, 1, 20, 2},
    {-48,  -4, 1, 1, 24, 2},
    {-16,  -4, 1, 1, 28, 2},
    { 16,  -4, 1, 1, 32, 2},
    {-48,   4, 1, 1, 36, 2},
    {-16,   4, 1, 1, 40, 2},
    { 16,   4, 1, 1, 44, 2},
    {-48,  12, 1, 1, 48, 2},
    {-16,  12, 1, 1, 52, 2},
    { 16,  12, 1, 1, 56, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_1[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 1, 8, 1},
    {-48, -12, 1, 1, 12, 1},
    {-16, -12, 1, 1, 16, 1},
    { 16, -12, 1, 1, 20, 1},
    {-48,  -4, 1, 1, 24, 1},
    {-16,  -4, 1, 1, 28, 1},
    { 16,  -4, 1, 1, 32, 1},
    {-48,   4, 1, 1, 36, 1},
    {-16,   4, 1, 1, 40, 1},
    { 16,   4, 1, 1, 44, 1},
    {-48,  12, 1, 1, 48, 1},
    {-16,  12, 1, 1, 52, 1},
    { 16,  12, 1, 1, 56, 1}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_2[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 1, 8, 2},
    {-48, -12, 1, 1, 12, 2},
    {-16, -12, 1, 1, 16, 2},
    { 16, -12, 1, 1, 20, 2},
    {-48,  -4, 1, 1, 24, 2},
    {-16,  -4, 1, 1, 28, 2},
    { 16,  -4, 1, 1, 32, 2},
    {-48,   4, 1, 1, 36, 2},
    {-16,   4, 1, 1, 40, 2},
    { 16,   4, 1, 1, 44, 2},
    {-48,  12, 1, 1, 48, 2},
    {-16,  12, 1, 1, 52, 2},
    { 16,  12, 1, 1, 56, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_3[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 1, 8, 1},
    {-48, -12, 1, 1, 12, 1},
    {-16, -12, 1, 1, 16, 1},
    { 16, -12, 1, 1, 20, 1},
    {-48,  -4, 1, 1, 24, 2},
    {-16,  -4, 1, 1, 28, 2},
    { 16,  -4, 1, 1, 32, 2},
    {-48,   4, 1, 1, 36, 2},
    {-16,   4, 1, 1, 40, 2},
    { 16,   4, 1, 1, 44, 2},
    {-48,  12, 1, 1, 48, 2},
    {-16,  12, 1, 1, 52, 2},
    { 16,  12, 1, 1, 56, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_SSTidal[] = {
    {15, gMapObjectSubspriteTable_SSTidal_0},
    {15, gMapObjectSubspriteTable_SSTidal_0},
    {15, gMapObjectSubspriteTable_SSTidal_1},
    {15, gMapObjectSubspriteTable_SSTidal_2},
    {15, gMapObjectSubspriteTable_SSTidal_3},
    {15, gMapObjectSubspriteTable_SSTidal_3}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_0[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 0, 8, 2},
    { 32, -20, 0, 0, 10, 2},
    {-48, -12, 1, 1, 11, 2},
    {-16, -12, 1, 1, 15, 2},
    { 16, -12, 1, 0, 19, 2},
    { 32, -12, 0, 0, 21, 2},
    {-48,  -4, 1, 1, 22, 2},
    {-16,  -4, 1, 1, 26, 2},
    { 16,  -4, 1, 0, 30, 2},
    { 32,  -4, 0, 0, 32, 2},
    {-48,   4, 1, 1, 33, 2},
    {-16,   4, 1, 1, 37, 2},
    { 16,   4, 1, 0, 41, 2},
    { 32,   4, 0, 0, 43, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_1[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 0, 8, 1},
    { 32, -20, 0, 0, 10, 1},
    {-48, -12, 1, 1, 11, 1},
    {-16, -12, 1, 1, 15, 1},
    { 16, -12, 1, 0, 19, 1},
    { 32, -12, 0, 0, 21, 1},
    {-48,  -4, 1, 1, 22, 1},
    {-16,  -4, 1, 1, 26, 1},
    { 16,  -4, 1, 0, 30, 1},
    { 32,  -4, 0, 0, 32, 1},
    {-48,   4, 1, 1, 33, 1},
    {-16,   4, 1, 1, 37, 1},
    { 16,   4, 1, 0, 41, 1},
    { 32,   4, 0, 0, 43, 1}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_2[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 0, 8, 2},
    { 32, -20, 0, 0, 10, 2},
    {-48, -12, 1, 1, 11, 2},
    {-16, -12, 1, 1, 15, 2},
    { 16, -12, 1, 0, 19, 2},
    { 32, -12, 0, 0, 21, 2},
    {-48,  -4, 1, 1, 22, 2},
    {-16,  -4, 1, 1, 26, 2},
    { 16,  -4, 1, 0, 30, 2},
    { 32,  -4, 0, 0, 32, 2},
    {-48,   4, 1, 1, 33, 2},
    {-16,   4, 1, 1, 37, 2},
    { 16,   4, 1, 0, 41, 2},
    { 32,   4, 0, 0, 43, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_3[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 0, 8, 1},
    { 32, -20, 0, 0, 10, 1},
    {-48, -12, 1, 1, 11, 1},
    {-16, -12, 1, 1, 15, 1},
    { 16, -12, 1, 0, 19, 1},
    { 32, -12, 0, 0, 21, 1},
    {-48,  -4, 1, 1, 22, 2},
    {-16,  -4, 1, 1, 26, 2},
    { 16,  -4, 1, 0, 30, 2},
    { 32,  -4, 0, 0, 32, 2},
    {-48,   4, 1, 1, 33, 2},
    {-16,   4, 1, 1, 37, 2},
    { 16,   4, 1, 0, 41, 2},
    { 32,   4, 0, 0, 43, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_SubmarineShadow[] = {
    {16, gMapObjectSubspriteTable_SubmarineShadow_0},
    {16, gMapObjectSubspriteTable_SubmarineShadow_0},
    {16, gMapObjectSubspriteTable_SubmarineShadow_1},
    {16, gMapObjectSubspriteTable_SubmarineShadow_2},
    {16, gMapObjectSubspriteTable_SubmarineShadow_3},
    {16, gMapObjectSubspriteTable_SubmarineShadow_3}
};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanNormal = {0xffff, 0x1100, 0x1102, 512, 16, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_BrendanNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanMachBike = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BrendanMachBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanAcroBike = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_BrendanAcroBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanSurfing = {0xffff, 0x1100, 0x11ff, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, TRUE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Surfing, gMapObjectPicTable_BrendanSurfing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanFieldMove = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_FieldMove, gMapObjectPicTable_BrendanFieldMove, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_QuintyPlump = {0xffff, 0x110b, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_L, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_QuintyPlump, gMapObjectPicTable_QuintyPlump, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy1 = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleBoy1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleGirl1 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleGirl1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy1 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl1 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Girl1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy2 = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl2 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Girl2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy2 = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleBoy2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleGirl2 = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleGirl2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy3 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Girl3 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Girl3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy4 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy4, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman1 = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_FatMan = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_FatMan, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman2 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man1 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman3 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldMan1 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_OldMan1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldWoman1 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_OldWoman1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man2 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman4 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman4, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man3 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman5 = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman5, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Cook = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Cook, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman6 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman6, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldMan2 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_OldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_OldWoman2 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_OldWoman2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Camper = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Camper, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Picnicker = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Picnicker, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man4 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man4, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman7 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman7, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Youngster = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Youngster, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BugCatcher = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BugCatcher, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PsychicM = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_PsychicM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SchoolKidM = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SchoolKidM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Maniac = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Maniac, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_HexManiac = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_HexManiac, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Woman8 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Woman8, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwimmerM = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SwimmerM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwimmerF = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SwimmerF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BlackBelt = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BlackBelt, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Beauty = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Beauty, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Scientist1 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Scientist1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Lass = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Lass, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Gentleman = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Gentleman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Sailor = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Sailor, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Fisherman = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Fisherman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RunningTriathleteM = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_RunningTriathleteM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RunningTriathleteF = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_RunningTriathleteF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberF = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_TuberF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberM = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_TuberM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Hiker = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Hiker, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyclingTriathleteM = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_CyclingTriathleteM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyclingTriathleteF = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_CyclingTriathleteF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Nurse = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Nurse, gMapObjectPicTable_Nurse, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ItemBall = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_ItemBall, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTree = {0xffff, 0x1103, 0x11ff, 256, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, NULL, gMapObjectImageAnimTable_BerryTree, gMapObjectPicTable_PechaBerryTree, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTreeEarlyStages = {0xffff, 0x1103, 0x11ff, 256, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_BerryTree, gMapObjectPicTable_PechaBerryTree, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BerryTreeLateStages = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BerryTree, gMapObjectPicTable_PechaBerryTree, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ProfBirch = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_ProfBirch, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man5 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man5, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man6 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man6, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ReporterM = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_ReporterM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ReporterF = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_ReporterF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Bard = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Hipster = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Trader = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan1, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Storyteller = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Giddy = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMauvilleOldMan1 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMauvilleOldMan2 = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MauvilleOldMan2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedNatuDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedNatuDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedMagnemiteDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedMagnemiteDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedSquirtleDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedSquirtleDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedWooperDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedWooperDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedPikachuDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedPikachuDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_UnusedPorygon2Doll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_UnusedPorygon2Doll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CuttableTree = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_CuttableTree, gMapObjectPicTable_CuttableTree, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MartEmployee = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MartEmployee, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RooftopSaleWoman = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_RooftopSaleWoman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Teala = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Teala, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BreakableRock = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_BreakableRock, gMapObjectPicTable_BreakableRock, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PushableBoulder = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_PushableBoulder, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MrBrineysBoat = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MrBrineysBoat, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayNormal = {0xffff, 0x1110, 0x1102, 512, 16, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_MayNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayMachBike = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MayMachBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayAcroBike = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_MayAcroBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MaySurfing = {0xffff, 0x1110, 0x11ff, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, TRUE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Surfing, gMapObjectPicTable_MaySurfing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayFieldMove = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_FieldMove, gMapObjectPicTable_MayFieldMove, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Truck = {0xffff, 0x110d, 0x11ff, 1152, 48, 48, 10, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_Truck, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_Truck, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MachokeCarryingBox = {0xffff, 0x110e, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MachokeCarryingBox, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MachokeFacingAway = {0xffff, 0x110e, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MachokeFacingAway, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BirchsBag = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BirchsBag, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Poochyena = {0xffff, 0x110f, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Poochyena, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Artist = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Artist, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanNormal = {0xffff, 0x1100, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_BrendanNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanMachBike = {0xffff, 0x1100, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BrendanMachBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanAcroBike = {0xffff, 0x1100, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_BrendanAcroBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanSurfing = {0xffff, 0x1100, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, TRUE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Surfing, gMapObjectPicTable_BrendanSurfing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalBrendanFieldMove = {0xffff, 0x1100, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_FieldMove, gMapObjectPicTable_BrendanFieldMove, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayNormal = {0xffff, 0x1110, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_MayNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayMachBike = {0xffff, 0x1110, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MayMachBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayAcroBike = {0xffff, 0x1110, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_BIKE_TIRE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_AcroBike, gMapObjectPicTable_MayAcroBike, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMaySurfing = {0xffff, 0x1110, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, TRUE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Surfing, gMapObjectPicTable_MaySurfing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RivalMayFieldMove = {0xffff, 0x1110, 0x1102, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_FieldMove, gMapObjectPicTable_MayFieldMove, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Cameraman = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Cameraman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanUnderwater = {0xffff, 0x1115, 0x11ff, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, TRUE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BrendanUnderwater, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayUnderwater = {0xffff, 0x1115, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, TRUE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MayUnderwater, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MovingBox = {0xffff, 0x1112, 0x11ff, 128, 16, 16, 10, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MovingBox, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CableCar = {0xffff, 0x1113, 0x11ff, 2048, 64, 64, 10, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_64x64, gMapObjectSubspriteTables_CableCar, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_CableCar, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Scientist2 = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Scientist2, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Man7 = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Man7, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AquaMemberM = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_AquaMemberM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AquaMemberF = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_AquaMemberF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MagmaMemberM = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MagmaMemberM, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MagmaMemberF = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MagmaMemberF, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Sidney = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Sidney, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Phoebe = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Phoebe, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Glacia = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Glacia, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Drake = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Drake, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Roxanne = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Roxanne, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Brawly = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Brawly, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wattson = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Wattson, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Flannery = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Flannery, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Norman = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Norman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Winona = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Winona, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Liza = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Liza, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Tate = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Tate, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wallace = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Wallace, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Steven = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Steven, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wally = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Wally, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LittleBoy3 = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LittleBoy3, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanFishing = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Fishing, gMapObjectPicTable_BrendanFishing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayFishing = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Fishing, gMapObjectPicTable_MayFishing, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_HotSpringsOldWoman = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_HotSpringsOldWoman, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SSTidal = {0xffff, 0x1114, 0x11ff, 1920, 96, 40, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_NONE, &gFieldOamData_8x8, gMapObjectSubspriteTables_SSTidal, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SSTidal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SubmarineShadow = {0xffff, 0x111a, 0x11ff, 1408, 88, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_NONE, &gFieldOamData_8x8, gMapObjectSubspriteTables_SubmarineShadow, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_SubmarineShadow, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PichuDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_PichuDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PikachuDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_PikachuDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MarillDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MarillDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TogepiDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_TogepiDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_CyndaquilDoll = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_CyndaquilDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ChikoritaDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_ChikoritaDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TotodileDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_TotodileDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_JigglypuffDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_JigglypuffDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MeowthDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MeowthDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ClefairyDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_ClefairyDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DittoDoll = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_DittoDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SmoochumDoll = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SmoochumDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TreeckoDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_TreeckoDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TorchicDoll = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_TorchicDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MudkipDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MudkipDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DuskullDoll = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_DuskullDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_WynautDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_WynautDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BaltoyDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BaltoyDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_KecleonDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_KecleonDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_AzurillDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_AzurillDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SkittyDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SkittyDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SwabluDoll = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SwabluDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_GulpinDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_GulpinDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LotadDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_LotadDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SeedotDoll = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SeedotDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_PikaCushion = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_PikaCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_RoundCushion = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_RoundCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_KissCushion = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_KissCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ZigzagCushion = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_ZigzagCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_SpinCushion = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_SpinCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_DiamondCushion = {0xffff, 0x1106, 0x11ff, 128, 16, 16, 5, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_DiamondCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BallCushion = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BallCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_GrassCushion = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_GrassCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_FireCushion = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_FireCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_WaterCushion = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_WaterCushion, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigSnorlaxDoll = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigSnorlaxDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRhydonDoll = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigRhydonDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigLaprasDoll = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigLaprasDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigVenusaurDoll = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigVenusaurDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigCharizardDoll = {0xffff, 0x1104, 0x11ff, 512, 32, 32, 3, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigCharizardDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigBlastoiseDoll = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigBlastoiseDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigWailmerDoll = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigWailmerDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegirockDoll = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigRegirockDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegiceDoll = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigRegiceDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BigRegisteelDoll = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BigRegisteelDoll, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Latias = {0xffff, 0x1104, 0x11ff, 512, 32, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LatiasLatios, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Latios = {0xffff, 0x1103, 0x11ff, 512, 32, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_NONE, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_LatiasLatios, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Boy5 = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Boy5, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_ContestJudge = {0xffff, 0x1105, 0x11ff, 256, 16, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_ContestJudge, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanWatering = {0xffff, 0x1100, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_BrendanWatering, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayWatering = {0xffff, 0x1110, 0x1102, 512, 32, 32, 0, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_MayWatering, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_BrendanDecorating = {0xffff, 0x1100, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_BrendanDecorating, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_MayDecorating = {0xffff, 0x1110, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, TRUE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_MayDecorating, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Archie = {0xffff, 0x1103, 0x11ff, 256, 16, 32, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Archie, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Maxie = {0xffff, 0x1104, 0x11ff, 256, 16, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Maxie, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kyogre1 = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Kyogre, gMapObjectRotScalAnimTable_KyogreGroudon};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Groudon1 = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Groudon, gMapObjectRotScalAnimTable_KyogreGroudon};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Fossil = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_S, TRUE, FALSE, TRACKS_NONE, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Inanimate, gMapObjectPicTable_Fossil, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Regirock = {0xffff, 0x1104, 0x11ff, 512, 32, 32, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Regi, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Regice = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Regi, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Registeel = {0xffff, 0x1106, 0x11ff, 512, 32, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Regi, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Skitty = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Skitty, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kecleon1 = {0xffff, 0x1105, 0x11ff, 128, 16, 16, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Kecleon, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kyogre2 = {0xffff, 0x1116, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Kyogre, gMapObjectRotScalAnimTable_KyogreGroudon};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Groudon2 = {0xffff, 0x1118, 0x11ff, 512, 32, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Groudon, gMapObjectRotScalAnimTable_KyogreGroudon};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Rayquaza = {0xffff, 0x1105, 0x11ff, 512, 32, 32, 4, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_32x32, gMapObjectSubspriteTables_32x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Rayquaza, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Zigzagoon = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Zigzagoon, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Pikachu = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Pikachu, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Azumarill = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Azumarill, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Wingull = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Wingull, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Kecleon2 = {0xffff, 0x1105, 0x1102, 128, 16, 16, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Kecleon, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_TuberMSwimming = {0xffff, 0x1104, 0x11ff, 128, 16, 16, 3, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_TuberMSwimming, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Azurill = {0xffff, 0x1103, 0x11ff, 128, 16, 16, 2, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x16, gMapObjectSubspriteTables_16x16, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Azurill, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_Mom = {0xffff, 0x1106, 0x11ff, 256, 16, 32, 5, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_Standard, gMapObjectPicTable_Mom, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LinkBrendan = {0xffff, 0x1110, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_BrendanNormal, gDummySpriteAffineAnimTable};
const struct MapObjectGraphicsInfo gMapObjectGraphicsInfo_LinkMay = {0xffff, 0x1110, 0x1102, 256, 16, 32, 10, SHADOW_SIZE_M, FALSE, FALSE, TRACKS_FOOT, &gFieldOamData_16x32, gMapObjectSubspriteTables_16x32, gMapObjectImageAnimTable_BrendanMayNormal, gMapObjectPicTable_MayNormal, gDummySpriteAffineAnimTable};

const struct SpritePalette gUnknown_0837377C[] = {
    {gMapObjectPalette0, 0x1103},
    {gMapObjectPalette1, 0x1104},
    {gMapObjectPalette2, 0x1105},
    {gMapObjectPalette3, 0x1106},
    {gMapObjectPalette4, 0x1107},
    {gMapObjectPalette5, 0x1108},
    {gMapObjectPalette6, 0x1109},
    {gMapObjectPalette7, 0x110A},
    {gMapObjectPalette8, 0x1100},
    {gMapObjectPalette9, 0x1101},
    {gMapObjectPalette10, 0x1102},
    {gMapObjectPalette11, 0x1115},
    {gMapObjectPalette12, 0x110B},
    {gMapObjectPalette13, 0x110C},
    {gMapObjectPalette14, 0x110D},
    {gMapObjectPalette15, 0x110E},
    {gMapObjectPalette16, 0x110F},
    {gMapObjectPalette17, 0x1110},
    {gMapObjectPalette18, 0x1111},
    {gMapObjectPalette19, 0x1112},
    {gMapObjectPalette20, 0x1113},
    {gMapObjectPalette21, 0x1114},
    {gMapObjectPalette22, 0x1116},
    {gMapObjectPalette23, 0x1117},
    {gMapObjectPalette24, 0x1118},
    {gMapObjectPalette25, 0x1119},
    {gMapObjectPalette26, 0x111A},
    {NULL,                0x0000}
};

const u16 Palettes_837385C[] = {
    0x1101,
    0x1101,
    0x1101,
    0x1101
};

const u16 Palettes_8373864[] = {
    0x1111,
    0x1111,
    0x1111,
    0x1111
};

const u16 Palettes_837386C[] = {
    0x1115,
    0x1115,
    0x1115,
    0x1115
};

const struct PairedPalettes gUnknown_08373874[] = {
    {0x1100, Palettes_837385C},
    {0x1110, Palettes_837385C},
    {0x1115, Palettes_837386C},
    {0x11FF, NULL}
};

const u16 Palettes_8373894[] = {
    0x110C,
    0x110C,
    0x110C,
    0x110C
};

const u16 Palettes_837389C[] = {
    0x110D,
    0x110D,
    0x110D,
    0x110D
};

const u16 Palettes_83738A4[] = {
    0x110E,
    0x110E,
    0x110E,
    0x110E
};

const u16 Palettes_83738AC[] = {
    0x1112,
    0x1112,
    0x1112,
    0x1112
};

const u16 Palettes_83738B4[] = {
    0x1113,
    0x1113,
    0x1113,
    0x1113
};

const u16 Palettes_83738BC[] = {
    0x1114,
    0x1114,
    0x1114,
    0x1114
};

const u16 Palettes_83738C4[] = {
    0x111A,
    0x111A,
    0x111A,
    0x111A
};

const u16 Palettes_83738CC[] = {
    0x1117,
    0x1117,
    0x1117,
    0x1117
};

const u16 Palettes_83738D4[] = {
    0x1119,
    0x1119,
    0x1119,
    0x1119
};

const u16 Palettes_83738DC[] = {
    0x1109,
    0x1109,
    0x1109,
    0x1109
};

const struct PairedPalettes gUnknown_083738E4[] = {
    {0x1100, Palettes_837385C},
    {0x1110, Palettes_837385C},
    {0x110B, Palettes_8373894},
    {0x110D, Palettes_837389C},
    {0x110E, Palettes_83738A4},
    {0x1112, Palettes_83738AC},
    {0x1113, Palettes_83738B4},
    {0x1114, Palettes_83738BC},
    {0x1116, Palettes_83738CC},
    {0x1118, Palettes_83738D4},
    {0x1105, Palettes_83738DC},
    {0x111A, Palettes_83738C4},
    {0x11FF, NULL}
};

const u16 Unknown_837394C[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 Unknown_8373960[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 Unknown_8373974[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 Unknown_8373988[] = {
    0x1100,
    0x1101,
    0x1103,
    0x1104,
    0x1105,
    0x1106,
    0x1107,
    0x1108,
    0x1109,
    0x110A
};

const u16 *const gUnknown_0837399C[] = {
    Unknown_837394C,
    Unknown_8373960,
    Unknown_8373974,
    Unknown_8373988
};

const struct SpriteFrameImage gMapObjectPicTable_PechaBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_PechaBerryTree_0),
    obj_frame_tiles(gMapObjectPic_PechaBerryTree_1),
    obj_frame_tiles(gMapObjectPic_PechaBerryTree_2),
    obj_frame_tiles(gMapObjectPic_PechaBerryTree_3),
    obj_frame_tiles(gMapObjectPic_PechaBerryTree_4),
    obj_frame_tiles(gMapObjectPic_PechaBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Pecha[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_KelpsyBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_KelpsyBerryTree_0),
    obj_frame_tiles(gMapObjectPic_KelpsyBerryTree_1),
    obj_frame_tiles(gMapObjectPic_KelpsyBerryTree_2),
    obj_frame_tiles(gMapObjectPic_KelpsyBerryTree_3),
    obj_frame_tiles(gMapObjectPic_KelpsyBerryTree_4),
    obj_frame_tiles(gMapObjectPic_KelpsyBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Kelpsy[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_WepearBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_WepearBerryTree_0),
    obj_frame_tiles(gMapObjectPic_WepearBerryTree_1),
    obj_frame_tiles(gMapObjectPic_WepearBerryTree_2),
    obj_frame_tiles(gMapObjectPic_WepearBerryTree_3),
    obj_frame_tiles(gMapObjectPic_WepearBerryTree_4),
    obj_frame_tiles(gMapObjectPic_WepearBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Wepear[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_IapapaBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_IapapaBerryTree_0),
    obj_frame_tiles(gMapObjectPic_IapapaBerryTree_1),
    obj_frame_tiles(gMapObjectPic_IapapaBerryTree_2),
    obj_frame_tiles(gMapObjectPic_IapapaBerryTree_3),
    obj_frame_tiles(gMapObjectPic_IapapaBerryTree_4),
    obj_frame_tiles(gMapObjectPic_IapapaBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Iapapa[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_CheriBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_CheriBerryTree_0),
    obj_frame_tiles(gMapObjectPic_CheriBerryTree_1),
    obj_frame_tiles(gMapObjectPic_CheriBerryTree_2),
    obj_frame_tiles(gMapObjectPic_CheriBerryTree_3),
    obj_frame_tiles(gMapObjectPic_CheriBerryTree_4),
    obj_frame_tiles(gMapObjectPic_CheriBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Cheri[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_FigyBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_FigyBerryTree_0),
    obj_frame_tiles(gMapObjectPic_FigyBerryTree_1),
    obj_frame_tiles(gMapObjectPic_FigyBerryTree_2),
    obj_frame_tiles(gMapObjectPic_FigyBerryTree_3),
    obj_frame_tiles(gMapObjectPic_FigyBerryTree_4),
    obj_frame_tiles(gMapObjectPic_FigyBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Figy[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_MagoBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_MagoBerryTree_0),
    obj_frame_tiles(gMapObjectPic_MagoBerryTree_1),
    obj_frame_tiles(gMapObjectPic_MagoBerryTree_2),
    obj_frame_tiles(gMapObjectPic_MagoBerryTree_3),
    obj_frame_tiles(gMapObjectPic_MagoBerryTree_4),
    obj_frame_tiles(gMapObjectPic_MagoBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Mago[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_LumBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_LumBerryTree_0),
    obj_frame_tiles(gMapObjectPic_LumBerryTree_1),
    obj_frame_tiles(gMapObjectPic_LumBerryTree_2),
    obj_frame_tiles(gMapObjectPic_LumBerryTree_3),
    obj_frame_tiles(gMapObjectPic_LumBerryTree_4),
    obj_frame_tiles(gMapObjectPic_LumBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Lum[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_RazzBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_RazzBerryTree_0),
    obj_frame_tiles(gMapObjectPic_RazzBerryTree_1),
    obj_frame_tiles(gMapObjectPic_RazzBerryTree_2),
    obj_frame_tiles(gMapObjectPic_RazzBerryTree_3),
    obj_frame_tiles(gMapObjectPic_RazzBerryTree_4),
    obj_frame_tiles(gMapObjectPic_RazzBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Razz[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_GrepaBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_GrepaBerryTree_0),
    obj_frame_tiles(gMapObjectPic_GrepaBerryTree_1),
    obj_frame_tiles(gMapObjectPic_GrepaBerryTree_2),
    obj_frame_tiles(gMapObjectPic_GrepaBerryTree_3),
    obj_frame_tiles(gMapObjectPic_GrepaBerryTree_4),
    obj_frame_tiles(gMapObjectPic_GrepaBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Grepa[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_RabutaBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_RabutaBerryTree_0),
    obj_frame_tiles(gMapObjectPic_RabutaBerryTree_1),
    obj_frame_tiles(gMapObjectPic_RabutaBerryTree_2),
    obj_frame_tiles(gMapObjectPic_RabutaBerryTree_3),
    obj_frame_tiles(gMapObjectPic_RabutaBerryTree_4),
    obj_frame_tiles(gMapObjectPic_RabutaBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Rabuta[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_NomelBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_NomelBerryTree_0),
    obj_frame_tiles(gMapObjectPic_NomelBerryTree_1),
    obj_frame_tiles(gMapObjectPic_NomelBerryTree_2),
    obj_frame_tiles(gMapObjectPic_NomelBerryTree_3),
    obj_frame_tiles(gMapObjectPic_NomelBerryTree_4),
    obj_frame_tiles(gMapObjectPic_NomelBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Nomel[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_LeppaBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_LeppaBerryTree_0),
    obj_frame_tiles(gMapObjectPic_LeppaBerryTree_1),
    obj_frame_tiles(gMapObjectPic_LeppaBerryTree_2),
    obj_frame_tiles(gMapObjectPic_LeppaBerryTree_3),
    obj_frame_tiles(gMapObjectPic_LeppaBerryTree_4),
    obj_frame_tiles(gMapObjectPic_LeppaBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Leppa[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_LiechiBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_LiechiBerryTree_0),
    obj_frame_tiles(gMapObjectPic_LiechiBerryTree_1),
    obj_frame_tiles(gMapObjectPic_LiechiBerryTree_2),
    obj_frame_tiles(gMapObjectPic_LiechiBerryTree_3),
    obj_frame_tiles(gMapObjectPic_LiechiBerryTree_4),
    obj_frame_tiles(gMapObjectPic_LiechiBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Liechi[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_HondewBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_HondewBerryTree_0),
    obj_frame_tiles(gMapObjectPic_HondewBerryTree_1),
    obj_frame_tiles(gMapObjectPic_HondewBerryTree_2),
    obj_frame_tiles(gMapObjectPic_HondewBerryTree_3),
    obj_frame_tiles(gMapObjectPic_HondewBerryTree_4),
    obj_frame_tiles(gMapObjectPic_HondewBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Hondew[] = {3, 4, 5, 5, 5};

const struct SpriteFrameImage gMapObjectPicTable_AguavBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_AguavBerryTree_0),
    obj_frame_tiles(gMapObjectPic_AguavBerryTree_1),
    obj_frame_tiles(gMapObjectPic_AguavBerryTree_2),
    obj_frame_tiles(gMapObjectPic_AguavBerryTree_3),
    obj_frame_tiles(gMapObjectPic_AguavBerryTree_4),
    obj_frame_tiles(gMapObjectPic_AguavBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Aguav[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_WikiBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_WikiBerryTree_0),
    obj_frame_tiles(gMapObjectPic_WikiBerryTree_1),
    obj_frame_tiles(gMapObjectPic_WikiBerryTree_2),
    obj_frame_tiles(gMapObjectPic_WikiBerryTree_3),
    obj_frame_tiles(gMapObjectPic_WikiBerryTree_4),
    obj_frame_tiles(gMapObjectPic_WikiBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Wiki[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_PomegBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_PomegBerryTree_0),
    obj_frame_tiles(gMapObjectPic_PomegBerryTree_1),
    obj_frame_tiles(gMapObjectPic_PomegBerryTree_2),
    obj_frame_tiles(gMapObjectPic_PomegBerryTree_3),
    obj_frame_tiles(gMapObjectPic_PomegBerryTree_4),
    obj_frame_tiles(gMapObjectPic_PomegBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Pomeg[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_RawstBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_RawstBerryTree_0),
    obj_frame_tiles(gMapObjectPic_RawstBerryTree_1),
    obj_frame_tiles(gMapObjectPic_RawstBerryTree_2),
    obj_frame_tiles(gMapObjectPic_RawstBerryTree_3),
    obj_frame_tiles(gMapObjectPic_RawstBerryTree_4),
    obj_frame_tiles(gMapObjectPic_RawstBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Rawst[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_SpelonBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_SpelonBerryTree_0),
    obj_frame_tiles(gMapObjectPic_SpelonBerryTree_1),
    obj_frame_tiles(gMapObjectPic_SpelonBerryTree_2),
    obj_frame_tiles(gMapObjectPic_SpelonBerryTree_3),
    obj_frame_tiles(gMapObjectPic_SpelonBerryTree_4),
    obj_frame_tiles(gMapObjectPic_SpelonBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Spelon[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_ChestoBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_ChestoBerryTree_0),
    obj_frame_tiles(gMapObjectPic_ChestoBerryTree_1),
    obj_frame_tiles(gMapObjectPic_ChestoBerryTree_2),
    obj_frame_tiles(gMapObjectPic_ChestoBerryTree_3),
    obj_frame_tiles(gMapObjectPic_ChestoBerryTree_4),
    obj_frame_tiles(gMapObjectPic_ChestoBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Chesto[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_OranBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_OranBerryTree_0),
    obj_frame_tiles(gMapObjectPic_OranBerryTree_1),
    obj_frame_tiles(gMapObjectPic_OranBerryTree_2),
    obj_frame_tiles(gMapObjectPic_OranBerryTree_3),
    obj_frame_tiles(gMapObjectPic_OranBerryTree_4),
    obj_frame_tiles(gMapObjectPic_OranBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Oran[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_PersimBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_PersimBerryTree_0),
    obj_frame_tiles(gMapObjectPic_PersimBerryTree_1),
    obj_frame_tiles(gMapObjectPic_PersimBerryTree_2),
    obj_frame_tiles(gMapObjectPic_PersimBerryTree_3),
    obj_frame_tiles(gMapObjectPic_PersimBerryTree_4),
    obj_frame_tiles(gMapObjectPic_PersimBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Persim[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_SitrusBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_SitrusBerryTree_0),
    obj_frame_tiles(gMapObjectPic_SitrusBerryTree_1),
    obj_frame_tiles(gMapObjectPic_SitrusBerryTree_2),
    obj_frame_tiles(gMapObjectPic_SitrusBerryTree_3),
    obj_frame_tiles(gMapObjectPic_SitrusBerryTree_4),
    obj_frame_tiles(gMapObjectPic_SitrusBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Sitrus[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_AspearBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_AspearBerryTree_0),
    obj_frame_tiles(gMapObjectPic_AspearBerryTree_1),
    obj_frame_tiles(gMapObjectPic_AspearBerryTree_2),
    obj_frame_tiles(gMapObjectPic_AspearBerryTree_3),
    obj_frame_tiles(gMapObjectPic_AspearBerryTree_4),
    obj_frame_tiles(gMapObjectPic_AspearBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Aspear[] = {3, 4, 3, 3, 3};

const struct SpriteFrameImage gMapObjectPicTable_PamtreBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_PamtreBerryTree_0),
    obj_frame_tiles(gMapObjectPic_PamtreBerryTree_1),
    obj_frame_tiles(gMapObjectPic_PamtreBerryTree_2),
    obj_frame_tiles(gMapObjectPic_PamtreBerryTree_3),
    obj_frame_tiles(gMapObjectPic_PamtreBerryTree_4),
    obj_frame_tiles(gMapObjectPic_PamtreBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Pamtre[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_CornnBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_CornnBerryTree_0),
    obj_frame_tiles(gMapObjectPic_CornnBerryTree_1),
    obj_frame_tiles(gMapObjectPic_CornnBerryTree_2),
    obj_frame_tiles(gMapObjectPic_CornnBerryTree_3),
    obj_frame_tiles(gMapObjectPic_CornnBerryTree_4),
    obj_frame_tiles(gMapObjectPic_CornnBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Cornn[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_LansatBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_LansatBerryTree_0),
    obj_frame_tiles(gMapObjectPic_LansatBerryTree_1),
    obj_frame_tiles(gMapObjectPic_LansatBerryTree_2),
    obj_frame_tiles(gMapObjectPic_LansatBerryTree_3),
    obj_frame_tiles(gMapObjectPic_LansatBerryTree_4),
    obj_frame_tiles(gMapObjectPic_LansatBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Lansat[] = {3, 4, 2, 2, 2};

const struct SpriteFrameImage gMapObjectPicTable_DurinBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_DurinBerryTree_0),
    obj_frame_tiles(gMapObjectPic_DurinBerryTree_1),
    obj_frame_tiles(gMapObjectPic_DurinBerryTree_2),
    obj_frame_tiles(gMapObjectPic_DurinBerryTree_3),
    obj_frame_tiles(gMapObjectPic_DurinBerryTree_4),
    obj_frame_tiles(gMapObjectPic_DurinBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Durin[] = {3, 4, 4, 4, 4};

const struct SpriteFrameImage gMapObjectPicTable_TamatoBerryTree[] = {
    obj_frame_tiles(gMapObjectPic_BerryTreeDirtPile),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_0),
    obj_frame_tiles(gMapObjectPic_BerryTreeSprout_1),
    obj_frame_tiles(gMapObjectPic_TamatoBerryTree_0),
    obj_frame_tiles(gMapObjectPic_TamatoBerryTree_1),
    obj_frame_tiles(gMapObjectPic_TamatoBerryTree_2),
    obj_frame_tiles(gMapObjectPic_TamatoBerryTree_3),
    obj_frame_tiles(gMapObjectPic_TamatoBerryTree_4),
    obj_frame_tiles(gMapObjectPic_TamatoBerryTree_5)
};

const u8 gBerryTreePaletteSlotTable_Tamato[] = {3, 4, 2, 2, 2};

const u8 gDeadBerryTreeGraphicsIdTable[] = {MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES};

const u8 gBerryTreeGraphicsIdTable[] = {MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_EARLY_STAGES, MAP_OBJ_GFX_BERRY_TREE_LATE_STAGES, MAP_OBJ_GFX_BERRY_TREE_LATE_STAGES, MAP_OBJ_GFX_BERRY_TREE_LATE_STAGES};

const struct SpriteFrameImage *const gBerryTreePicTablePointers[] = {
    gMapObjectPicTable_CheriBerryTree,
    gMapObjectPicTable_ChestoBerryTree,
    gMapObjectPicTable_PechaBerryTree,
    gMapObjectPicTable_RawstBerryTree,
    gMapObjectPicTable_AspearBerryTree,
    gMapObjectPicTable_LeppaBerryTree,
    gMapObjectPicTable_OranBerryTree,
    gMapObjectPicTable_PersimBerryTree,
    gMapObjectPicTable_LumBerryTree,
    gMapObjectPicTable_SitrusBerryTree,
    gMapObjectPicTable_FigyBerryTree,
    gMapObjectPicTable_WikiBerryTree,
    gMapObjectPicTable_MagoBerryTree,
    gMapObjectPicTable_AguavBerryTree,
    gMapObjectPicTable_IapapaBerryTree,
    gMapObjectPicTable_RazzBerryTree,
    gMapObjectPicTable_RazzBerryTree,
    gMapObjectPicTable_MagoBerryTree,
    gMapObjectPicTable_WepearBerryTree,
    gMapObjectPicTable_IapapaBerryTree,
    gMapObjectPicTable_PomegBerryTree,
    gMapObjectPicTable_KelpsyBerryTree,
    gMapObjectPicTable_WepearBerryTree,
    gMapObjectPicTable_HondewBerryTree,
    gMapObjectPicTable_GrepaBerryTree,
    gMapObjectPicTable_TamatoBerryTree,
    gMapObjectPicTable_CornnBerryTree,
    gMapObjectPicTable_PomegBerryTree,
    gMapObjectPicTable_RabutaBerryTree,
    gMapObjectPicTable_NomelBerryTree,
    gMapObjectPicTable_SpelonBerryTree,
    gMapObjectPicTable_PamtreBerryTree,
    gMapObjectPicTable_RabutaBerryTree,
    gMapObjectPicTable_DurinBerryTree,
    gMapObjectPicTable_HondewBerryTree,
    gMapObjectPicTable_LiechiBerryTree,
    gMapObjectPicTable_HondewBerryTree,
    gMapObjectPicTable_AguavBerryTree,
    gMapObjectPicTable_PomegBerryTree,
    gMapObjectPicTable_GrepaBerryTree,
    gMapObjectPicTable_LansatBerryTree,
    gMapObjectPicTable_CornnBerryTree,
    gMapObjectPicTable_DurinBerryTree
};

const u8 *const gBerryTreePaletteSlotTablePointers[] = {
    gBerryTreePaletteSlotTable_Cheri,
    gBerryTreePaletteSlotTable_Chesto,
    gBerryTreePaletteSlotTable_Pecha,
    gBerryTreePaletteSlotTable_Rawst,
    gBerryTreePaletteSlotTable_Aspear,
    gBerryTreePaletteSlotTable_Leppa,
    gBerryTreePaletteSlotTable_Oran,
    gBerryTreePaletteSlotTable_Persim,
    gBerryTreePaletteSlotTable_Lum,
    gBerryTreePaletteSlotTable_Sitrus,
    gBerryTreePaletteSlotTable_Figy,
    gBerryTreePaletteSlotTable_Wiki,
    gBerryTreePaletteSlotTable_Mago,
    gBerryTreePaletteSlotTable_Aguav,
    gBerryTreePaletteSlotTable_Iapapa,
    gBerryTreePaletteSlotTable_Razz,
    gBerryTreePaletteSlotTable_Razz,
    gBerryTreePaletteSlotTable_Mago,
    gBerryTreePaletteSlotTable_Wepear,
    gBerryTreePaletteSlotTable_Iapapa,
    gBerryTreePaletteSlotTable_Pomeg,
    gBerryTreePaletteSlotTable_Kelpsy,
    gBerryTreePaletteSlotTable_Wepear,
    gBerryTreePaletteSlotTable_Hondew,
    gBerryTreePaletteSlotTable_Grepa,
    gBerryTreePaletteSlotTable_Tamato,
    gBerryTreePaletteSlotTable_Cornn,
    gBerryTreePaletteSlotTable_Pomeg,
    gBerryTreePaletteSlotTable_Rabuta,
    gBerryTreePaletteSlotTable_Nomel,
    gBerryTreePaletteSlotTable_Spelon,
    gBerryTreePaletteSlotTable_Pamtre,
    gBerryTreePaletteSlotTable_Rabuta,
    gBerryTreePaletteSlotTable_Durin,
    gBerryTreePaletteSlotTable_Hondew,
    gBerryTreePaletteSlotTable_Liechi,
    gBerryTreePaletteSlotTable_Hondew,
    gBerryTreePaletteSlotTable_Aguav,
    gBerryTreePaletteSlotTable_Pomeg,
    gBerryTreePaletteSlotTable_Grepa,
    gBerryTreePaletteSlotTable_Lansat,
    gBerryTreePaletteSlotTable_Cornn,
    gBerryTreePaletteSlotTable_Durin
};

const u8 *const gBerryTreeGraphicsIdTablePointers[] = {
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable,
    gBerryTreeGraphicsIdTable
};

const struct SpritePalette gFieldEffectObjectPaletteInfo0 = {gFieldEffectObjectPalette0, 0x1004};

const struct SpritePalette gFieldEffectObjectPaletteInfo1 = {gFieldEffectObjectPalette1, 0x1005};

const union AnimCmd gFieldEffectAnim_8374534[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_Shadow[] = {
    gFieldEffectAnim_8374534
};

const struct SpriteFrameImage gFieldEffectPicTable_ShadowSmall[] = {
    obj_frame_tiles(gFieldEffectPic_ShadowSmall)
};

const struct SpriteFrameImage gFieldEffectPicTable_ShadowMedium[] = {
    obj_frame_tiles(gFieldEffectPic_ShadowMedium)
};

const struct SpriteFrameImage gFieldEffectPicTable_ShadowLarge[] = {
    obj_frame_tiles(gFieldEffectPic_ShadowLarge)
};

const struct SpriteFrameImage gFieldEffectPicTable_ShadowExtraLarge[] = {
    obj_frame_tiles(gFieldEffectPic_ShadowExtraLarge)
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowSmall = {0xFFFF, 0xFFFF, &gFieldOamData_8x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowSmall, gDummySpriteAffineAnimTable, oamc_shadow};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowMedium = {0xFFFF, 0xFFFF, &gFieldOamData_16x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowMedium, gDummySpriteAffineAnimTable, oamc_shadow};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowLarge = {0xFFFF, 0xFFFF, &gFieldOamData_32x8, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowLarge, gDummySpriteAffineAnimTable, oamc_shadow};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShadowExtraLarge = {0xFFFF, 0xFFFF, &gFieldOamData_64x32, gFieldEffectAnimTable_Shadow, gFieldEffectPicTable_ShadowExtraLarge, gDummySpriteAffineAnimTable, oamc_shadow};

const struct SpriteFrameImage gFieldEffectPicTable_TallGrass[] = {
    obj_frame_tiles(gFieldEffectPic_TallGrass_0),
    obj_frame_tiles(gFieldEffectPic_TallGrass_1),
    obj_frame_tiles(gFieldEffectPic_TallGrass_2),
    obj_frame_tiles(gFieldEffectPic_TallGrass_3),
    obj_frame_tiles(gFieldEffectPic_TallGrass_4)
};

const union AnimCmd gFieldEffectAnim_83745E8[] = {
    ANIMCMD_FRAME(1, 10),
    ANIMCMD_FRAME(2, 10),
    ANIMCMD_FRAME(3, 10),
    ANIMCMD_FRAME(4, 10),
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_TallGrass[] = {
    gFieldEffectAnim_83745E8
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_TallGrass = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_TallGrass, gFieldEffectPicTable_TallGrass, gDummySpriteAffineAnimTable, unc_grass_normal};

const struct SpriteFrameImage gFieldEffectPicTable_Ripple[] = {
    obj_frame_tiles(gFieldEffectPic_Ripple_0),
    obj_frame_tiles(gFieldEffectPic_Ripple_1),
    obj_frame_tiles(gFieldEffectPic_Ripple_2),
    obj_frame_tiles(gFieldEffectPic_Ripple_3),
    obj_frame_tiles(gFieldEffectPic_Ripple_4)
};

const union AnimCmd gFieldEffectAnim_8374644[] = {
    ANIMCMD_FRAME(0, 12),
    ANIMCMD_FRAME(1, 9),
    ANIMCMD_FRAME(2, 9),
    ANIMCMD_FRAME(3, 9),
    ANIMCMD_FRAME(0, 9),
    ANIMCMD_FRAME(1, 9),
    ANIMCMD_FRAME(2, 11),
    ANIMCMD_FRAME(4, 11),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_Ripple[] = {
    gFieldEffectAnim_8374644
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Ripple = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_Ripple, gFieldEffectPicTable_Ripple, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_Ash[] = {
    obj_frame_tiles(gFieldEffectPic_Ash_0),
    obj_frame_tiles(gFieldEffectPic_Ash_1),
    obj_frame_tiles(gFieldEffectPic_Ash_2),
    obj_frame_tiles(gFieldEffectPic_Ash_3),
    obj_frame_tiles(gFieldEffectPic_Ash_4)
};

const union AnimCmd gFieldEffectAnim_83746AC[] = {
    ANIMCMD_FRAME(0, 12),
    ANIMCMD_FRAME(1, 12),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 12),
    ANIMCMD_FRAME(4, 12),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_Ash[] = {
    gFieldEffectAnim_83746AC
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Ash = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_Ash, gFieldEffectPicTable_Ash, gDummySpriteAffineAnimTable, sub_8127D84};

const struct SpriteFrameImage gFieldEffectPicTable_SurfBlob[] = {
    obj_frame_tiles(gFieldEffectPic_SurfBlob_0),
    obj_frame_tiles(gFieldEffectPic_SurfBlob_1),
    obj_frame_tiles(gFieldEffectPic_SurfBlob_2)
};

const union AnimCmd gFieldEffectAnim_83746F8[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gFieldEffectAnim_8374700[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gFieldEffectAnim_8374708[] = {
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gFieldEffectAnim_8374710[] = {
    ANIMCMD_FRAME(2, 1, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gFieldEffectAnimTable_SurfBlob[] = {
    gFieldEffectAnim_83746F8,
    gFieldEffectAnim_8374700,
    gFieldEffectAnim_8374708,
    gFieldEffectAnim_8374710
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_SurfBlob = {0xFFFF, 0xFFFF, &gFieldOamData_32x32, gFieldEffectAnimTable_SurfBlob, gFieldEffectPicTable_SurfBlob, gDummySpriteAffineAnimTable, sub_8127F7C};

const struct SpriteFrameImage gFieldEffectPicTable_Arrow[] = {
    obj_frame_tiles(gFieldEffectPic_Arrow_0),
    obj_frame_tiles(gFieldEffectPic_Arrow_1),
    obj_frame_tiles(gFieldEffectPic_Arrow_2),
    obj_frame_tiles(gFieldEffectPic_Arrow_3),
    obj_frame_tiles(gFieldEffectPic_Arrow_4),
    obj_frame_tiles(gFieldEffectPic_Arrow_5),
    obj_frame_tiles(gFieldEffectPic_Arrow_6),
    obj_frame_tiles(gFieldEffectPic_Arrow_7)
};

const union AnimCmd gFieldEffectAnim_8374780[] = {
    ANIMCMD_FRAME(3, 32),
    ANIMCMD_FRAME(7, 32),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gFieldEffectAnim_837478C[] = {
    ANIMCMD_FRAME(0, 32),
    ANIMCMD_FRAME(4, 32),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gFieldEffectAnim_8374798[] = {
    ANIMCMD_FRAME(1, 32),
    ANIMCMD_FRAME(5, 32),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gFieldEffectAnim_83747A4[] = {
    ANIMCMD_FRAME(2, 32),
    ANIMCMD_FRAME(6, 32),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gFieldEffectAnimTable_Arrow[] = {
    gFieldEffectAnim_8374780,
    gFieldEffectAnim_837478C,
    gFieldEffectAnim_8374798,
    gFieldEffectAnim_83747A4
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Arrow = {0xFFFF, 0xFFFF, &gFieldOamData_16x16, gFieldEffectAnimTable_Arrow, gFieldEffectPicTable_Arrow, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct SpriteFrameImage gFieldEffectPicTable_Dust[] = {
    obj_frame_tiles(gFieldEffectPic_Dust_0),
    obj_frame_tiles(gFieldEffectPic_Dust_1),
    obj_frame_tiles(gFieldEffectPic_Dust_2)
};

const union AnimCmd gFieldEffectAnim_83747F0[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_Dust[] = {
    gFieldEffectAnim_83747F0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Dust = {0xFFFF, 0x1004, &gFieldOamData_16x8, gFieldEffectAnimTable_Dust, gFieldEffectPicTable_Dust, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_JumpTallGrass[] = {
    obj_frame_tiles(gFieldEffectPic_JumpTallGrass_0),
    obj_frame_tiles(gFieldEffectPic_JumpTallGrass_1),
    obj_frame_tiles(gFieldEffectPic_JumpTallGrass_2),
    obj_frame_tiles(gFieldEffectPic_JumpTallGrass_3)
};

const union AnimCmd gFieldEffectAnim_837483C[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_JumpTallGrass[] = {
    gFieldEffectAnim_837483C
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpTallGrass = {0xFFFF, 0x1005, &gFieldOamData_16x8, gFieldEffectAnimTable_JumpTallGrass, gFieldEffectPicTable_JumpTallGrass, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_SandFootprints[] = {
    obj_frame_tiles(gFieldEffectPic_SandFootprints_0),
    obj_frame_tiles(gFieldEffectPic_SandFootprints_1)
};

const union AnimCmd gFieldEffectAnim_837487C[] = {
    ANIMCMD_FRAME(0, 1, .vFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_8374884[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_837488C[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_8374894[] = {
    ANIMCMD_FRAME(1, 1, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_SandFootprints[] = {
    gFieldEffectAnim_837487C,
    gFieldEffectAnim_837487C,
    gFieldEffectAnim_8374884,
    gFieldEffectAnim_837488C,
    gFieldEffectAnim_8374894
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_SandFootprints = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_SandFootprints, gFieldEffectPicTable_SandFootprints, gDummySpriteAffineAnimTable, sub_8127584};

const struct SpriteFrameImage gFieldEffectPicTable_DeepSandFootprints[] = {
    obj_frame_tiles(gFieldEffectPic_DeepSandFootprints_0),
    obj_frame_tiles(gFieldEffectPic_DeepSandFootprints_1)
};

const union AnimCmd gFieldEffectAnim_83748D8[] = {
    ANIMCMD_FRAME(0, 1, .vFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_83748E0[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_83748E8[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_83748F0[] = {
    ANIMCMD_FRAME(1, 1, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_DeepSandFootprints[] = {
    gFieldEffectAnim_83748D8,
    gFieldEffectAnim_83748D8,
    gFieldEffectAnim_83748E0,
    gFieldEffectAnim_83748E8,
    gFieldEffectAnim_83748F0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_DeepSandFootprints = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_DeepSandFootprints, gFieldEffectPicTable_DeepSandFootprints, gDummySpriteAffineAnimTable, sub_8127584};

const struct SpriteFrameImage gFieldEffectPicTable_BikeTireTracks[] = {
    obj_frame_tiles(gFieldEffectPic_BikeTireTracks_0),
    obj_frame_tiles(gFieldEffectPic_BikeTireTracks_1),
    obj_frame_tiles(gFieldEffectPic_BikeTireTracks_2),
    obj_frame_tiles(gFieldEffectPic_BikeTireTracks_3)
};

const union AnimCmd gFieldEffectAnim_8374944[] = {
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_837494C[] = {
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_8374954[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_837495C[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_8374964[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_837496C[] = {
    ANIMCMD_FRAME(0, 1, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_8374974[] = {
    ANIMCMD_FRAME(3, 1, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_837497C[] = {
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_BikeTireTracks[] = {
    gFieldEffectAnim_8374944,
    gFieldEffectAnim_8374944,
    gFieldEffectAnim_837494C,
    gFieldEffectAnim_8374954,
    gFieldEffectAnim_837495C,
    gFieldEffectAnim_8374964,
    gFieldEffectAnim_837496C,
    gFieldEffectAnim_8374974,
    gFieldEffectAnim_837497C
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_BikeTireTracks = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_BikeTireTracks, gFieldEffectPicTable_BikeTireTracks, gDummySpriteAffineAnimTable, sub_8127584};

const struct SpriteFrameImage gFieldEffectPicTable_JumpBigSplash[] = {
    obj_frame_tiles(gFieldEffectPic_JumpBigSplash_0),
    obj_frame_tiles(gFieldEffectPic_JumpBigSplash_1),
    obj_frame_tiles(gFieldEffectPic_JumpBigSplash_2),
    obj_frame_tiles(gFieldEffectPic_JumpBigSplash_3)
};

const union AnimCmd gFieldEffectAnim_83749E0[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_JumpBigSplash[] = {
    gFieldEffectAnim_83749E0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpBigSplash = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_JumpBigSplash, gFieldEffectPicTable_JumpBigSplash, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_Splash[] = {
    obj_frame_tiles(gFieldEffectPic_Splash_0),
    obj_frame_tiles(gFieldEffectPic_Splash_1)
};

const union AnimCmd gFieldEffectAnim_8374A20[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_8374A2C[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gFieldEffectAnimTable_Splash[] = {
    gFieldEffectAnim_8374A20,
    gFieldEffectAnim_8374A2C
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Splash = {0xFFFF, 0x1004, &gFieldOamData_16x8, gFieldEffectAnimTable_Splash, gFieldEffectPicTable_Splash, gDummySpriteAffineAnimTable, sub_81276B4};

const struct SpriteFrameImage gFieldEffectPicTable_JumpSmallSplash[] = {
    obj_frame_tiles(gFieldEffectPic_JumpSmallSplash_0),
    obj_frame_tiles(gFieldEffectPic_JumpSmallSplash_1),
    obj_frame_tiles(gFieldEffectPic_JumpSmallSplash_2)
};

const union AnimCmd gFieldEffectAnim_8374A88[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_JumpSmallSplash[] = {
    gFieldEffectAnim_8374A88
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpSmallSplash = {0xFFFF, 0x1004, &gFieldOamData_16x8, gFieldEffectAnimTable_JumpSmallSplash, gFieldEffectPicTable_JumpSmallSplash, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_LongGrass[] = {
    obj_frame_tiles(gFieldEffectPic_LongGrass_0),
    obj_frame_tiles(gFieldEffectPic_LongGrass_1),
    obj_frame_tiles(gFieldEffectPic_LongGrass_2),
    obj_frame_tiles(gFieldEffectPic_LongGrass_3)
};

const union AnimCmd gFieldEffectAnim_8374AD4[] = {
    ANIMCMD_FRAME(1, 3),
    ANIMCMD_FRAME(2, 3),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_LongGrass[] = {
    gFieldEffectAnim_8374AD4
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_LongGrass = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_LongGrass, gFieldEffectPicTable_LongGrass, gDummySpriteAffineAnimTable, unc_grass_tall};

const struct SpriteFrameImage gFieldEffectPicTable_JumpLongGrass[] = {
    obj_frame_tiles(gFieldEffectPic_JumpLongGrass_0),
    obj_frame_tiles(gFieldEffectPic_JumpLongGrass_1),
    obj_frame_tiles(gFieldEffectPic_JumpLongGrass_2),
    obj_frame_tiles(gFieldEffectPic_JumpLongGrass_3),
    obj_frame_tiles(gFieldEffectPic_JumpLongGrass_4),
    obj_frame_tiles(gFieldEffectPic_JumpLongGrass_5)
};

const union AnimCmd gFieldEffectAnim_8374B40[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(5, 8),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_JumpLongGrass[] = {
    gFieldEffectAnim_8374B40
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_JumpLongGrass = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_JumpLongGrass, gFieldEffectPicTable_JumpLongGrass, gDummySpriteAffineAnimTable, sub_81287C4};

const struct SpriteFrameImage gFieldEffectPicTable_Unknown17[] = {
    obj_frame_tiles(gFieldEffectPic_JumpLongGrass_5),
    obj_frame_tiles(gFieldEffectPic_Unknown17_0),
    obj_frame_tiles(gFieldEffectPic_Unknown17_1),
    obj_frame_tiles(gFieldEffectPic_Unknown17_2),
    obj_frame_tiles(gFieldEffectPic_Unknown17_3),
    obj_frame_tiles(gFieldEffectPic_Unknown17_4),
    obj_frame_tiles(gFieldEffectPic_Unknown17_5),
    obj_frame_tiles(gFieldEffectPic_Unknown17_6),
    obj_frame_tiles(gFieldEffectPic_Unknown17_7)
};

const union AnimCmd gFieldEffectAnim_8374BC0[] = {
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_FRAME(8, 4),
    ANIMCMD_JUMP(7)
};

const union AnimCmd *const gFieldEffectAnimTable_Unknown17[] = {
    gFieldEffectAnim_8374BC0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown17 = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_Unknown17, gFieldEffectPicTable_Unknown17, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_Unknown18[] = {
    obj_frame_tiles(gFieldEffectPic_Unknown18_0),
    obj_frame_tiles(gFieldEffectPic_Unknown18_1),
    obj_frame_tiles(gFieldEffectPic_Unknown18_2),
    obj_frame_tiles(gFieldEffectPic_Unknown18_3)
};

const union AnimCmd gFieldEffectAnim_8374C24[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gFieldEffectAnimTable_Unknown18[] = {
    gFieldEffectAnim_8374C24
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown18 = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_Unknown18, gFieldEffectPicTable_Unknown18, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_Unknown19[] = {
    obj_frame_tiles(gFieldEffectPic_Unknown19_0),
    obj_frame_tiles(gFieldEffectPic_Unknown19_1),
    obj_frame_tiles(gFieldEffectPic_Unknown19_2),
    obj_frame_tiles(gFieldEffectPic_Unknown19_3)
};

const union AnimCmd gFieldEffectAnim_8374C7C[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gFieldEffectAnimTable_Unknown19[] = {
    gFieldEffectAnim_8374C7C
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown19 = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_Unknown19, gFieldEffectPicTable_Unknown19, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_SandPile[] = {
    obj_frame_tiles(gFieldEffectPic_SandPile_0),
    obj_frame_tiles(gFieldEffectPic_SandPile_1),
    obj_frame_tiles(gFieldEffectPic_SandPile_2)
};

const union AnimCmd gFieldEffectAnim_8374CC4[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_SandPile[] = {
    gFieldEffectAnim_8374CC4
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_SandPile = {0xFFFF, 0x1004, &gFieldOamData_16x8, gFieldEffectAnimTable_SandPile, gFieldEffectPicTable_SandPile, gDummySpriteAffineAnimTable, sub_81282E0};

const struct SpriteFrameImage gFieldEffectPicTable_Unknown20[] = {
    obj_frame_tiles(gFieldEffectPic_Unknown20_0),
    obj_frame_tiles(gFieldEffectPic_Unknown20_1),
    obj_frame_tiles(gFieldEffectPic_Unknown20_2),
    obj_frame_tiles(gFieldEffectPic_Unknown20_3)
};

const union AnimCmd gFieldEffectAnim_8374D10[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gFieldEffectAnimTable_Unknown20[] = {
    gFieldEffectAnim_8374D10
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown20 = {0xFFFF, 0x1004, &gFieldOamData_16x16, gFieldEffectAnimTable_Unknown20, gFieldEffectPicTable_Unknown20, gDummySpriteAffineAnimTable, sub_8128800};

const union AffineAnimCmd gFieldEffectAffineAnim_8374D48[] = {
    AFFINEANIMCMD_FRAME(0xFF00, 0x100, -128, 0),
    AFFINEANIMCMD_FRAME(0x1, 0x0, 0, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFFF, 0x0, 0, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFFF, 0x0, 0, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_FRAME(0x1, 0x0, 0, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_JUMP(1)
};

const union AffineAnimCmd gFieldEffectAffineAnim_8374D98[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, -128, 0),
    AFFINEANIMCMD_FRAME(0xFFFF, 0x0, 0, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_FRAME(0x1, 0x0, 0, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_FRAME(0x1, 0x0, 0, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_FRAME(0xFFFF, 0x0, 0, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_JUMP(1)
};

const union AffineAnimCmd *const gFieldEffectAffineAnimTable_Unknown21[] = {
    gFieldEffectAffineAnim_8374D48,
    gFieldEffectAffineAnim_8374D98
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Unknown21 = {0x0, 0xFFFF, &gDummyOamData, gDummySpriteAnimTable, NULL, gFieldEffectAffineAnimTable_Unknown21, SpriteCallbackDummy};

const struct SpriteFrameImage gFieldEffectPicTable_BerryTreeGrowthSparkle[] = {
    obj_frame_tiles(gFieldEffectPic_BerryTreeGrowthSparkle_0),
    obj_frame_tiles(gFieldEffectPic_BerryTreeGrowthSparkle_1),
    obj_frame_tiles(gFieldEffectPic_BerryTreeGrowthSparkle_2),
    obj_frame_tiles(gFieldEffectPic_BerryTreeGrowthSparkle_3),
    obj_frame_tiles(gFieldEffectPic_BerryTreeGrowthSparkle_4),
    obj_frame_tiles(gFieldEffectPic_BerryTreeGrowthSparkle_5)
};

const union AnimCmd gFieldEffectAnim_8374E38[] = {
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(5, 8),
    ANIMCMD_LOOP(0),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_LOOP(3),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(5, 8),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_BerryTreeGrowthSparkle[] = {
    gFieldEffectAnim_8374E38
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_BerryTreeGrowthSparkle = {0xFFFF, 0xFFFF, &gFieldOamData_16x16, gFieldEffectAnimTable_BerryTreeGrowthSparkle, gFieldEffectPicTable_BerryTreeGrowthSparkle, gDummySpriteAffineAnimTable, sub_8128800};

const struct SpriteFrameImage gFieldEffectPicTable_TreeDisguise[] = {
    obj_frame_tiles(gFieldEffectPic_TreeDisguise_0),
    obj_frame_tiles(gFieldEffectPic_TreeDisguise_1),
    obj_frame_tiles(gFieldEffectPic_TreeDisguise_2),
    obj_frame_tiles(gFieldEffectPic_TreeDisguise_3),
    obj_frame_tiles(gFieldEffectPic_TreeDisguise_4),
    obj_frame_tiles(gFieldEffectPic_TreeDisguise_5),
    obj_frame_tiles(gFieldEffectPic_TreeDisguise_6)
};

const union AnimCmd gFieldEffectAnim_8374EE0[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_8374EE8[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_TreeDisguise[] = {
    gFieldEffectAnim_8374EE0,
    gFieldEffectAnim_8374EE8
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_TreeDisguise = {0xFFFF, 0xFFFF, &gFieldOamData_16x32, gFieldEffectAnimTable_TreeDisguise, gFieldEffectPicTable_TreeDisguise, gDummySpriteAffineAnimTable, sub_81285AC};

const struct SpriteFrameImage gFieldEffectPicTable_MountainDisguise[] = {
    obj_frame_tiles(gFieldEffectPic_MountainDisguise_0),
    obj_frame_tiles(gFieldEffectPic_MountainDisguise_1),
    obj_frame_tiles(gFieldEffectPic_MountainDisguise_2),
    obj_frame_tiles(gFieldEffectPic_MountainDisguise_3),
    obj_frame_tiles(gFieldEffectPic_MountainDisguise_4),
    obj_frame_tiles(gFieldEffectPic_MountainDisguise_5),
    obj_frame_tiles(gFieldEffectPic_MountainDisguise_6)
};

const union AnimCmd gFieldEffectAnim_8374F60[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END
};

const union AnimCmd gFieldEffectAnim_8374F68[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_FRAME(4, 4),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_MountainDisguise[] = {
    gFieldEffectAnim_8374F60,
    gFieldEffectAnim_8374F68
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_MountainDisguise = {0xFFFF, 0xFFFF, &gFieldOamData_16x32, gFieldEffectAnimTable_MountainDisguise, gFieldEffectPicTable_MountainDisguise, gDummySpriteAffineAnimTable, sub_81285AC};

const struct SpriteFrameImage gFieldEffectPicTable_SandDisguise[] = {
    obj_frame_tiles(gFieldEffectPic_SandDisguise_0),
    obj_frame_tiles(gFieldEffectPic_SandDisguise_1),
    obj_frame_tiles(gFieldEffectPic_SandDisguise_2),
    obj_frame_tiles(gFieldEffectPic_SandDisguise_3),
    obj_frame_tiles(gFieldEffectPic_SandDisguise_4),
    obj_frame_tiles(gFieldEffectPic_SandDisguise_5),
    obj_frame_tiles(gFieldEffectPic_SandDisguise_6)
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_SandDisguise = {0xFFFF, 0xFFFF, &gFieldOamData_16x32, gFieldEffectAnimTable_TreeDisguise, gFieldEffectPicTable_SandDisguise, gDummySpriteAffineAnimTable, sub_81285AC};

const struct SpriteFrameImage gFieldEffectPicTable_Bird[] = {
    obj_frame_tiles(gFieldEffectPic_Bird)
};

const union AnimCmd gFieldEffectAnim_8375000[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_Bird[] = {
    gFieldEffectAnim_8375000
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Bird = {0xFFFF, 0xFFFF, &gFieldOamData_32x32, gFieldEffectAnimTable_Bird, gFieldEffectPicTable_Bird, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct SpriteFrameImage gFieldEffectPicTable_ShortGrass[] = {
    obj_frame_tiles(gFieldEffectPic_ShortGrass_0),
    obj_frame_tiles(gFieldEffectPic_ShortGrass_1)
};

const union AnimCmd gFieldEffectAnim_8375034[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_ShortGrass[] = {
    gFieldEffectAnim_8375034
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_ShortGrass = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_ShortGrass, gFieldEffectPicTable_ShortGrass, gDummySpriteAffineAnimTable, sub_8127334};

const struct SpriteFrameImage gFieldEffectPicTable_HotSpringsWater[] = {
    obj_frame_tiles(gFieldEffectPic_HotSpringsWater)
};

const union AnimCmd gFieldEffectAnim_8375064[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_HotSpringsWater[] = {
    gFieldEffectAnim_8375064
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_HotSpringsWater = {0xFFFF, 0x1005, &gFieldOamData_16x16, gFieldEffectAnimTable_HotSpringsWater, gFieldEffectPicTable_HotSpringsWater, gDummySpriteAffineAnimTable, sub_8127A7C};

const struct SpriteFrameImage gFieldEffectPicTable_PopOutOfAsh[] = {
    obj_frame_tiles(gFieldEffectPic_PopOutOfAsh_0),
    obj_frame_tiles(gFieldEffectPic_PopOutOfAsh_1),
    obj_frame_tiles(gFieldEffectPic_PopOutOfAsh_2),
    obj_frame_tiles(gFieldEffectPic_PopOutOfAsh_3),
    obj_frame_tiles(gFieldEffectPic_PopOutOfAsh_4)
};

const union AnimCmd gFieldEffectAnim_83750B0[] = {
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_PopOutOfAsh[] = {
    gFieldEffectAnim_83750B0
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_PopOutOfAsh = {0xFFFF, 0x100D, &gFieldOamData_16x16, gFieldEffectAnimTable_PopOutOfAsh, gFieldEffectPicTable_PopOutOfAsh, gDummySpriteAffineAnimTable, sub_808788C};

const struct SpritePalette gFieldEffectObjectPaletteInfo2 = {gFieldEffectObjectPalette2, 0x100D};

const struct SpriteFrameImage gFieldEffectPicTable_LavaridgeGymWarp[] = {
    obj_frame_tiles(gFieldEffectPic_LavaridgeGymWarp_0),
    obj_frame_tiles(gFieldEffectPic_LavaridgeGymWarp_1),
    obj_frame_tiles(gFieldEffectPic_LavaridgeGymWarp_2),
    obj_frame_tiles(gFieldEffectPic_LavaridgeGymWarp_3),
    obj_frame_tiles(gFieldEffectPic_LavaridgeGymWarp_4)
};

const union AnimCmd gFieldEffectAnim_8375114[] = {
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_LavaridgeGymWarp[] = {
    gFieldEffectAnim_8375114
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_LavaridgeGymWarp = {0xFFFF, 0x100D, &gFieldOamData_16x16, gFieldEffectAnimTable_LavaridgeGymWarp, gFieldEffectPicTable_LavaridgeGymWarp, gDummySpriteAffineAnimTable, sub_8087638};

const struct SpriteFrameImage gFieldEffectPicTable_Bubbles[] = {
    obj_frame_tiles(gFieldEffectPic_Bubbles_0),
    obj_frame_tiles(gFieldEffectPic_Bubbles_1),
    obj_frame_tiles(gFieldEffectPic_Bubbles_2),
    obj_frame_tiles(gFieldEffectPic_Bubbles_3),
    obj_frame_tiles(gFieldEffectPic_Bubbles_4),
    obj_frame_tiles(gFieldEffectPic_Bubbles_5),
    obj_frame_tiles(gFieldEffectPic_Bubbles_6),
    obj_frame_tiles(gFieldEffectPic_Bubbles_7)
};

const union AnimCmd gFieldEffectAnim_8375188[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_FRAME(5, 4),
    ANIMCMD_FRAME(6, 4),
    ANIMCMD_FRAME(7, 4),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_Bubbles[] = {
    gFieldEffectAnim_8375188
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Bubbles = {0xFFFF, 0x1004, &gFieldOamData_16x32, gFieldEffectAnimTable_Bubbles, gFieldEffectPicTable_Bubbles, gDummySpriteAffineAnimTable, sub_8128410};

const struct SpriteFrameImage gFieldEffectPicTable_Sparkle[] = {
    obj_frame_tiles(gFieldEffectPic_Sparkle_0),
    obj_frame_tiles(gFieldEffectPic_Sparkle_1)
};

const union AnimCmd gFieldEffectAnim_83751D8[] = {
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

const union AnimCmd *const gFieldEffectAnimTable_Sparkle[] = {
    gFieldEffectAnim_83751D8
};

const struct SpriteTemplate gFieldEffectSpriteTemplate_Sparkle = {0xFFFF, 0x100F, &gFieldOamData_16x16, gFieldEffectAnimTable_Sparkle, gFieldEffectPicTable_Sparkle, gDummySpriteAffineAnimTable, sub_8128774};

const struct SpritePalette gFieldEffectObjectPaletteInfo3 = {gFieldEffectObjectPalette3, 0x100F};

// text

extern void strange_npc_table_clear(void);
extern void ClearPlayerAvatarInfo(void);
extern void npc_load_two_palettes__no_record(u16, u8);
extern void npc_load_two_palettes__and_record(u16, u8);
extern void sub_8060388(s16, s16, s16 *, s16 *);
void sub_80634D0(struct MapObject *, struct Sprite *);
extern void pal_patch_for_npc(u16, u16);
extern void CameraObjectReset1(void);

void sub_805AAB0(void);
u8 GetFieldObjectIdByLocalId(u8);
u8 GetFieldObjectIdByLocalIdAndMapInternal(u8, u8, u8);
u8 GetAvailableFieldObjectSlot(u16, u8, u8, u8 *);
void FieldObjectHandleDynamicGraphicsId(struct MapObject *);
void RemoveFieldObjectInternal(struct MapObject *);
u16 GetFieldObjectFlagIdByFieldObjectId(u8);
void MakeObjectTemplateFromFieldObjectTemplate(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables);
struct MapObjectTemplate *GetFieldObjectTemplateByLocalIdAndMap(u8, u8, u8);
void GetFieldObjectMovingCameraOffset(s16 *, s16 *);
void sub_805BDF8(u16);
u8 sub_805BE58(const struct SpritePalette *);
u8 FindFieldObjectPaletteIndexByTag(u16);

extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];
extern u8 gReservedSpritePaletteCount;
extern struct Camera gUnknown_0202E844;
extern u8 gUnknown_030005A4;
extern u16 gUnknown_030005A6;
extern const u8 *const gBerryTreeGraphicsIdTablePointers[];
extern const struct SpriteFrameImage *const gBerryTreePicTablePointers[];
extern const u8 *const gBerryTreePaletteSlotTablePointers[];

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
    const struct SubspriteTable *subspriteTables = NULL;
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

void MakeObjectTemplateFromFieldObjectGraphicsInfo(u16 graphicsId, void (*callback)(struct Sprite *), struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
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

void MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex(u16 graphicsId, u16 callbackIndex, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
{
    MakeObjectTemplateFromFieldObjectGraphicsInfo(graphicsId, gUnknown_0836DA88[callbackIndex], sprTemplate, subspriteTables);
}

void MakeObjectTemplateFromFieldObjectTemplate(struct MapObjectTemplate *mapObjTemplate, struct SpriteTemplate *sprTemplate, const struct SubspriteTable **subspriteTables)
{
    MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex(mapObjTemplate->graphicsId, mapObjTemplate->movementType, sprTemplate, subspriteTables);
}

u8 AddPseudoFieldObject(u16 graphicsId, void (*callback)(struct Sprite *), s16 c, s16 d, u8 subpriority)
{
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
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
extern void sub_8060470(s16 *, s16 *, s16, s16);
extern void InitObjectPriorityByZCoord();

u8 sub_805B410(u8 a, u8 b, s16 c, s16 d, u8 e, u8 f)
{
    const struct MapObjectGraphicsInfo *gfxInfo;
    struct SpriteTemplate spriteTemplate;
    const struct SubspriteTable *subspriteTables;
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
    const struct SubspriteTable *subspriteTables;
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

u8 AddCameraObject(u8 a)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_830FD24, 0, 0, 4);

    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].data0 = a;
    return spriteId;
}

void ObjectCB_CameraObject(struct Sprite *sprite)
{
    void (*cameraObjectFuncs[3])(struct Sprite *);
    memcpy(cameraObjectFuncs, gCameraObjectFuncs, sizeof gCameraObjectFuncs);
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

fieldmap_object_null_cb(sub_805C884, sub_805C8A8);
fieldmap_object_cb(sub_805C8AC, sub_805C8D0, gUnknown_08375224);

u8 sub_805C8F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

extern void FieldObjectSetRegularAnim(struct MapObject *, struct Sprite *, u8);

u8 sub_805C904(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

extern u8 FieldObjectExecRegularAnim(struct MapObject *, struct Sprite *);
extern const s16 gUnknown_0837520C[];
extern const s16 gUnknown_0837521C[];
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

u8 sub_805CAAC(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    if (a2 > a3)
    {
        dirn = DIR_EAST;
        if (a0 < 0)
        {
            dirn = DIR_WEST;
        }
    }
    else
    {
        dirn = DIR_SOUTH;
        if (a1 < 0)
        {
            dirn = DIR_NORTH;
        }
    }
    return dirn;
}

u8 sub_805CADC(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = DIR_SOUTH;
    if (a1 < 0)
    {
        dirn = DIR_NORTH;
    }
    return dirn;
}

u8 sub_805CAEC(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = DIR_EAST;
    if (a0 < 0)
    {
        dirn = DIR_WEST;
    }
    return dirn;
}

u8 sub_805CB00(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_SOUTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
        if (dirn == DIR_EAST)
        {
            dirn = DIR_NORTH;
        }
    }
    else if (dirn == DIR_EAST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
        if (dirn == DIR_SOUTH)
        {
            dirn = DIR_NORTH;
        }
    }
    return dirn;
}

u8 sub_805CB5C(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_SOUTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
        if (dirn == DIR_WEST)
        {
            dirn = DIR_NORTH;
        }
    }
    else if (dirn == DIR_WEST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
        if (dirn == DIR_SOUTH)
        {
            dirn = DIR_NORTH;
        }
    }
    return dirn;
}

u8 sub_805CBB8(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_NORTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
        if (dirn == DIR_EAST)
        {
            dirn = DIR_SOUTH;
        }
    }
    else if (dirn == DIR_EAST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
        if (dirn == DIR_NORTH)
        {
            dirn = DIR_SOUTH;
        }
    }
    return dirn;
}

u8 sub_805CC14(s16 a0, s16 a1, s16 a2, s16 a3) {
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_NORTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
        if (dirn == DIR_WEST)
        {
            dirn = DIR_SOUTH;
        }
    }
    else if (dirn == DIR_WEST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
        if (dirn == DIR_NORTH)
        {
            dirn = DIR_SOUTH;
        }
    }
    return dirn;
}

u8 sub_805CC70(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_EAST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
    }
    return dirn;
}

u8 sub_805CCAC(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_WEST)
    {
        dirn = sub_805CADC(a0, a1, a2, a3);
    }
    return dirn;
}

u8 sub_805CCE8(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_SOUTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
    }
    return dirn;
}

u8 sub_805CD24(s16 a0, s16 a1, s16 a2, s16 a3)
{
    u8 dirn;
    dirn = sub_805CAAC(a0, a1, a2, a3);
    if (dirn == DIR_NORTH)
    {
        dirn = sub_805CAEC(a0, a1, a2, a3);
    }
    return dirn;
}

u8 sub_805CD60(struct MapObject *mapObject, u8 a1)
{
    s16 x;
    s16 y;
    s16 x2;
    s16 y2;
    if (!FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        return 0;
    }
    PlayerGetDestCoords(&x, &y);
    x -= mapObject->coords2.x;
    y -= mapObject->coords2.y;
    x2 = x;
    y2 = y;
    if (x2 < 0)
    {
        x2 = -x2;
    }
    if (y2 < 0)
    {
        y2 = -y2;
    }
    return gUnknown_08375244[a1](x, y, x2, y2);
}

fieldmap_object_cb(sub_805CDE8, sub_805CE0c, gUnknown_08375270);

u8 sub_805CE2C(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805CE40(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805CE6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805CEB0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805CEE0(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_08375240, 4);
    direction = sub_805CD60(mapObject, 0);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805CF28, sub_805CF4C, gUnknown_08375284);

u8 sub_805CF6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805CF80(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805CFAC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) == 0)
    {
        return 0;
    }
    sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
    sprite->data1 = 3;
    return 1;
}

u8 sub_805CFE8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) != 0)
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D008(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_083752A0, 2);
    direction = directions[Random() & 1];
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 5;
    if (sub_805FF20(mapObject, direction) != 0)
    {
        sprite->data1 = 1;
    }
    return 1;
}

u8 sub_805D054(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetGoSpeed0AnimId(mapObject->placeholder18));
    mapObject->mapobj_bit_1 = 1;
    sprite->data1 = 6;
    return 1;
}

u8 sub_805D084(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 1;
    }
    return 0;
}

fieldmap_object_cb(sub_805D0AC, sub_805D0D0, gUnknown_083752A4);

u8 sub_805D0F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805D104(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805D130(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) == 0)
    {
        return 0;
    }
    sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
    sprite->data1 = 3;
    return 1;
}

u8 sub_805D16C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) != 0)
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D18C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_083752C0, 2);
    direction = directions[Random() & 1];
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 5;
    if (sub_805FF20(mapObject, direction) != 0)
    {
        sprite->data1 = 1;
    }
    return 1;
}

u8 sub_805D1D8(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetGoSpeed0AnimId(mapObject->placeholder18));
    mapObject->mapobj_bit_1 = 1;
    sprite->data1 = 6;
    return 1;
}

u8 sub_805D208(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 1;
    }
    return 0;
}

fieldmap_object_cb(sub_805D230, sub_805D254, gUnknown_083752C4);

u8 sub_805D274(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 1;
    return 1;
}

u8 sub_805D2A0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite) != 0)
    {
        sprite->data1 = 2;
        return 1;
    }
    return 0;
}

u8 sub_805D2C0(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_1 = 0;
    return 0;
}

u8 sub_805D314(struct MapObject *mapObject, struct Sprite *sprite);
extern u8 (*const gUnknown_083752D0[])(struct MapObject *mapObject, struct Sprite *sprite);

void FieldObjectCB_BerryTree(struct Sprite *sprite)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[sprite->data0];
    if (!(sprite->data7 & 1))
    {
        get_berry_tree_graphics(mapObject, sprite);
        sprite->data7 |= 1;
    }
    meta_step(mapObject, sprite, sub_805D314);
}

u8 sub_805D314(struct MapObject *mapObject, struct Sprite *sprite)
{
    return gUnknown_083752D0[sprite->data1](mapObject, sprite);
}

extern u32 gUnknown_0202FF84[];

u8 do_berry_tree_growth_sparkle_1(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 berryTreeStage;
    npc_reset(mapObject, sprite);
    mapObject->mapobj_bit_13 = 1;
    sprite->invisible = 1;
    berryTreeStage = GetStageByBerryTreeId(mapObject->trainerRange_berryTreeId);
    if (!berryTreeStage)
    {
        if (!(sprite->data7 & 4) && sprite->animNum == 4)
        {
            gUnknown_0202FF84[0] = mapObject->coords2.x;
            gUnknown_0202FF84[1] = mapObject->coords2.y;
            gUnknown_0202FF84[2] = sprite->subpriority - 1;
            gUnknown_0202FF84[3] = sprite->oam.priority;
            FieldEffectStart(0x17);
            sprite->animNum = 0;
        }
        return 0;
    }
    mapObject->mapobj_bit_13 = 0;
    sprite->invisible = 0;
    berryTreeStage--;
    if (sprite->animNum != berryTreeStage)
    {
        sprite->data1 = 2;
        return 1;
    }
    get_berry_tree_graphics(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, 0x39);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805D3EC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sprite->data1 = 0;
        return 1;
    }
    return 0;
}

u8 do_berry_tree_growth_sparkle_2(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_1 = 1;
    sprite->data1 = 3;
    sprite->data2 = 0;
    sprite->data7 |= 2;
    gUnknown_0202FF84[0] = mapObject->coords2.x;
    gUnknown_0202FF84[1] = mapObject->coords2.y;
    gUnknown_0202FF84[2] = sprite->subpriority - 1;
    gUnknown_0202FF84[3] = sprite->oam.priority;
    FieldEffectStart(0x17);
    return 1;
}

u8 sub_805D458(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->data2++;
    mapObject->mapobj_bit_13 = ((sprite->data2 & 0x2) >> 1);
    sprite->animPaused = 1;
    if (sprite->data2 > 64)
    {
        get_berry_tree_graphics(mapObject, sprite);
        sprite->data1 = 4;
        sprite->data2 = 0;
        return 1;
    }
    return 0;
}

u8 sub_805D4A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->data2++;
    mapObject->mapobj_bit_13 = ((sprite->data2 & 0x2) >> 1);
    sprite->animPaused = 1;
    if (sprite->data2 > 64)
    {
        sprite->data1 = 0;
        sprite->data7 &= (-3);
        return 1;
    }
    return 0;
}

fieldmap_object_cb(sub_805D4F4, sub_805D518, gUnknown_083752E4);

u8 sub_805D538(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805D54C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805D578(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805D5BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D5EC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_083752A0, 2);
    direction = sub_805CD60(mapObject, 1);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805D634, sub_805D658, gUnknown_083752F8);

u8 sub_805D678(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805D68C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805D6B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837520C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805D6FC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D72C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_083752C0, 2);
    direction = sub_805CD60(mapObject, 2);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805D774, sub_805D798, gUnknown_0837530C);

u8 sub_805D7B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805D7CC(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805D7F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805D83C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D86C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_08375320, 2);
    direction = sub_805CD60(mapObject, 3);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805D8B4, sub_805D8D8, gUnknown_08375324);

u8 sub_805D8F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805D90C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805D938(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805D97C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805D9AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_08375338, 2);
    direction = sub_805CD60(mapObject, 4);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805D9F4, sub_805DA18, gUnknown_0837533C);

u8 sub_805DA38(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805DA4C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805DA78(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805DABC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DAEC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_08375350, 2);
    direction = sub_805CD60(mapObject, 5);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805DB34, sub_805DB58, gUnknown_08375354);

u8 sub_805DB78(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805DB8C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805DBB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805DBFC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DC2C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[2];
    memcpy(directions, gUnknown_08375368, 2);
    direction = sub_805CD60(mapObject, 6);
    if (direction == 0)
    {
        direction = directions[Random() & 1];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805DC74, sub_805DC98, gUnknown_0837536C);

u8 sub_805DCB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805DCCC(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805DCF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805DD3C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DD6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_08375380, 4);
    direction = sub_805CD60(mapObject, 7);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805DDB4, sub_805DDD8, gUnknown_08375384);

u8 sub_805DDF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805DE0C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805DE38(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805DE7C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DEAC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_08375398, 4);
    direction = sub_805CD60(mapObject, 8);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805DEF4, sub_805DF18, gUnknown_0837539C);

u8 sub_805DF38(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805DF4C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805DF78(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805DFBC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805DFEC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_083753B0, 4);
    direction = sub_805CD60(mapObject, 9);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805E034, sub_805E058, gUnknown_083753B4);

u8 sub_805E078(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805E08C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 2;
    return 1;
}

u8 sub_805E0B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, gUnknown_0837521C[Random() & 3]);
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805E0FC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 4;
        return 1;
    }
    return 0;
}

u8 sub_805E12C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[4];
    memcpy(directions, gUnknown_083753C8, 4);
    direction = sub_805CD60(mapObject, 10);
    if (direction == 0)
    {
        direction = directions[Random() & 3];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805E174, sub_805E198, gUnknown_083753CC);

u8 sub_805E1B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 1;
    return 1;
}

u8 sub_805E1E4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, 0x30);
        sprite->data1 = 2;
    }
    return 0;
}

u8 sub_805E208(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805E234(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[5];
    memcpy(directions, gUnknown_083753DC, 5);
    direction = sub_805CD60(mapObject, 0);
    if (direction == 0)
    {
        direction = directions[mapObject->mapobj_unk_18];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 0;
    return 1;
}

fieldmap_object_cb(sub_805E278, sub_803E29C, gUnknown_083753E4);

u8 sub_805E2BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 1;
    return 1;
}

u8 sub_805E2E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sub_8064820(sprite, 0x30);
        sprite->data1 = 2;
    }
    return 0;
}

u8 sub_805E30C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064824(sprite) || FieldObjectIsTrainerAndCloseToPlayer(mapObject))
    {
        sprite->data1 = 3;
    }
    return 0;
}

u8 sub_805E338(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    u8 directions[5];
    memcpy(directions, gUnknown_083753F4, 5);
    direction = sub_805CD60(mapObject, 0);
    if (direction == 0)
    {
        direction = directions[mapObject->mapobj_unk_18];
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 0;
    return 1;
}

fieldmap_object_cb(sub_805E37C, sub_805E3A0, gUnknown_083753FC);

u8 sub_805E3C0(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 sub_805E3D4(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 direction;
    direction = gUnknown_0836DC09[mapObject->animPattern];
    if (mapObject->mapobj_unk_21 != 0)
    {
        direction = GetOppositeDirection(direction);
    }
    FieldObjectSetDirection(mapObject, direction);
    sprite->data1 = 2;
    return 1;
}

u8 sub_805E40C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 v0;
    u8 goSpeed0AnimId;
    if (mapObject->mapobj_unk_21 && mapObject->coords1.x == mapObject->coords2.x && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 0;
        FieldObjectSetDirection(mapObject, GetOppositeDirection(mapObject->placeholder18));
    }
    v0 = sub_805FF20(mapObject, mapObject->placeholder18);
    goSpeed0AnimId = GetGoSpeed0AnimId(mapObject->placeholder18);
    if (v0 == 1)
    {
        mapObject->mapobj_unk_21 ++;
        FieldObjectSetDirection(mapObject, GetOppositeDirection(mapObject->placeholder18));
        goSpeed0AnimId = GetGoSpeed0AnimId(mapObject->placeholder18);
        v0 = sub_805FF20(mapObject, mapObject->placeholder18);
    }
    if (v0 != 0)
    {
        goSpeed0AnimId = GetStepInPlaceDelay16AnimId(mapObject->mapobj_unk_18);
    }
    FieldObjectSetRegularAnim(mapObject, sprite, goSpeed0AnimId);
    mapObject->mapobj_bit_1 = 1;
    sprite->data1 = 3;
    return 1;
}

u8 sub_805E4C4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 1;
    }
    return 0;
}

u8 sub_805E4EC(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    sprite->data1 = 1;
    return 1;
}

u8 MoveFieldObjectInNextDirectionInSequence(struct MapObject *mapObject, struct Sprite *sprite, u8 *directionSequence)
{
    u8 v0;
    u8 goSpeed0AnimId;
    if (mapObject->mapobj_unk_21 == 3 && mapObject->coords1.x == mapObject->coords2.x && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 0;
    }
    FieldObjectSetDirection(mapObject, directionSequence[mapObject->mapobj_unk_21]);
    goSpeed0AnimId = GetGoSpeed0AnimId(mapObject->placeholder18);
    v0 = sub_805FF20(mapObject, mapObject->placeholder18);
    if (v0 == 1)
    {
        mapObject->mapobj_unk_21 ++;
        FieldObjectSetDirection(mapObject, directionSequence[mapObject->mapobj_unk_21]);
        goSpeed0AnimId = GetGoSpeed0AnimId(mapObject->placeholder18);
        v0 = sub_805FF20(mapObject, mapObject->placeholder18);
    }
    if (v0 != 0)
    {
        goSpeed0AnimId = GetStepInPlaceDelay16AnimId(mapObject->mapobj_unk_18);
    }
    FieldObjectSetRegularAnim(mapObject, sprite, goSpeed0AnimId);
    mapObject->mapobj_bit_1 = 1;
    sprite->data1 = 2;
    return 1;
}

u8 sub_805E5B4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 1;
    }
    return 0;
}

fieldmap_object_cb(sub_805E5DC, sub_805E600, gUnknown_0837540C);

u8 sub_805E620(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375418, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805E668, sub_805E68C, gUnknown_0837541C);

u8 sub_805E6AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375428, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805E6F4, sub_805E718, gUnknown_0837542C);

u8 sub_805E738(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375438, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805E780, sub_805E7A4, gUnknown_0837543C);

u8 sub_805E7C4(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375448, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}



fieldmap_object_cb(sub_805E80C, sub_805E830, gUnknown_0837544C);

u8 sub_805E850(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375458, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805E898, sub_805E8BC, gUnknown_0837545C);

u8 sub_805E8DC(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375468, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805E924, sub_805E948, gUnknown_0837546C);

u8 sub_805E968(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375240, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805E9B0, sub_805E9D4, gUnknown_08375478);

u8 sub_805E9F4(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375484, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EA3C, sub_805EA60, gUnknown_08375488);

u8 sub_805EA80(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375494, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EAC8, sub_805EAEC, gUnknown_08375498);

u8 sub_805EB0C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754A4, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EB54, sub_805EB78, gUnknown_083754A8);

u8 sub_805EB98(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754B4, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EBE0, sub_805EC04, gUnknown_083754B8);

u8 sub_805EC24(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754C4, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EC6C, sub_805EC90, gUnknown_083754C8);

u8 sub_805ECB0(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754D4, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805ECF8, sub_805ED1C, gUnknown_083754D8);

u8 sub_805ED3C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754E4, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805ED84, sub_805EDA8, gUnknown_083754E8);

u8 sub_805EDC8(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_083754F4, 4);
    if (mapObject->mapobj_unk_21 == 1 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 2;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EE10, sub_805EE34, gUnknown_083754F8);

u8 sub_805EE54(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375504, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EE9C, sub_805EEC0, gUnknown_08375508);

u8 sub_805EEE0(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375514, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EF28, sub_805EF4C, gUnknown_08375518);

u8 sub_805EF6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375524, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805EFB4, sub_805EFD8, gUnknown_08375528);

u8 sub_805EFF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375534, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805F040, sub_805F064, gUnknown_08375538);

u8 sub_805F084(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375544, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805F0CC, sub_805F0F0, gUnknown_08375548);

u8 sub_805F110(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375554, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805F158, sub_805F17C, gUnknown_08375558);

u8 sub_805F19C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375564, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.y == mapObject->coords2.y)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805F1E4, sub_805F208, gUnknown_08375568);

u8 sub_805F228(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375574, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
}

fieldmap_object_cb(sub_805F270, sub_805F294, gUnknown_08375578);

u8 sub_805F2B4(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 directions[4];
    memcpy(directions, gUnknown_08375584, 4);
    if (mapObject->mapobj_unk_21 == 2 && mapObject->coords1.x == mapObject->coords2.x)
    {
        mapObject->mapobj_unk_21 = 3;
    }
    return MoveFieldObjectInNextDirectionInSequence(mapObject, sprite, directions);
};

fieldmap_object_cb(sub_805F2FC, sub_805F320, gUnknown_08375588);

u8 mss_npc_reset_oampriv3_1_unk2_unk3(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    if (mapObject->mapobj_unk_21 == 0)
    {
        mapObject->mapobj_unk_21 = player_get_direction_lower_nybble();
    }
    sprite->data1 = 1;
    return 1;
}

extern u8 (*const gUnknown_08375594[])(struct MapObject *, struct Sprite *, u8, bool8 (*const)(u8));

u8 sub_805F364(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1C == 0xFF || gPlayerAvatar.running1 == 2)
    {
        return 0;
    }
    return gUnknown_08375594[player_get_x22()](mapObject, sprite, player_get_direction_upper_nybble(), NULL);
}

u8 sub_805F3C4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        mapObject->mapobj_bit_1 = 0;
        sprite->data1 = 1;
    }
    return 0;
}

#ifdef NONMATCHING

u8 sub_805F3EC(struct MapObject *mapObject, struct Sprite *sprite, u8 a2, u8 *a3(u8))
{
    return 0;
}

u8 sub_805F3F0(struct MapObject *mapObject, struct Sprite *sprite, u8 a2, u8 *a3(u8))
{
    int direction;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, a2);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(direction));
    mapObject->mapobj_bit_1 = 1;
    sprite->data1 = 2;
    return 1;
}

u8 sub_805F438(struct MapObject *mapObject, struct Sprite *sprite, u8 a2, u8 *a3(u8))
{
    s16 x;
    s16 y;
    int direction;
    direction = state_to_direction(gUnknown_0836DC09[mapObject->animPattern], mapObject->mapobj_unk_21, a2);
    FieldObjectMoveDestCoords(mapObject, direction, &x, &y);
    FieldObjectSetRegularAnim(mapObject, sprite, GetGoSpeed0AnimId(direction));
    if (!npc_block_way(mapObject, x, y, direction) || (a3 != NULL && !a3(MapGridGetMetatileBehaviorAt(x, y))))
    {
        FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(direction));
    }
    mapObject->mapobj_bit_1 = 1;
    sprite->data1 = 2;
    return 1;
}
#endif

asm(".section .text_fmocb2_c\n");

fieldmap_object_cb(sub_805F8E0, sub_805F904, gUnknown_083755C0);

u8 mss_08062EA4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1C == 0xFF || gPlayerAvatar.running1 == 2)
    {
        return 0;
    }
    return gUnknown_08375594[player_get_x22()](mapObject, sprite, player_get_direction_upper_nybble(), MetatileBehavior_IsPokeGrass);
}

u8 sub_805F9F8(struct MapObject *, struct Sprite *);

void FieldObjectCB_TreeDisguise(struct Sprite *sprite)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[sprite->data0];
    if (mapObject->mapobj_unk_21 == 0 || (mapObject->mapobj_unk_21 == 1 && sprite->data7 == 0))
    {
        FieldObjectGetLocalIdAndMap(mapObject, (u8 *)&gUnknown_0202FF84[0], (u8 *)&gUnknown_0202FF84[1], (u8 *)&gUnknown_0202FF84[2]);
        mapObject->mapobj_unk_1A = FieldEffectStart(0x1c);
        mapObject->mapobj_unk_21 = 1;
        sprite->data7 ++;
    }
    meta_step(&gMapObjects[sprite->data0], sprite, sub_805F9F8);
}

u8 sub_805F9F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    return 0;
}

void FieldObjectCB_MountainDisguise(struct Sprite *sprite)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[sprite->data0];
    if (mapObject->mapobj_unk_21 == 0 || (mapObject->mapobj_unk_21 == 1 && sprite->data7 == 0))
    {
        FieldObjectGetLocalIdAndMap(mapObject, (u8 *)&gUnknown_0202FF84[0], (u8 *)&gUnknown_0202FF84[1], (u8 *)&gUnknown_0202FF84[2]);
        mapObject->mapobj_unk_1A = FieldEffectStart(0x1d);
        mapObject->mapobj_unk_21 = 1;
        sprite->data7 ++;
    }
    meta_step(&gMapObjects[sprite->data0], sprite, sub_805F9F8);
}

u8 sub_805FAD8(struct MapObject *mapObject, struct Sprite *sprite);
extern u8 (*const gUnknown_083755CC[])(struct MapObject *, struct Sprite *);

void FieldObjectCB_Hidden1(struct Sprite *sprite)
{
    if (sprite->data7 == 0)
    {
        gMapObjects[sprite->data0].mapobj_bit_26 = 1;
        sprite->subspriteMode = 2;
        sprite->oam.priority = 3;
        sprite->data7 ++;
    }
    meta_step(&gMapObjects[sprite->data0], sprite, sub_805FAD8);
}

u8 sub_805FAD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    return gUnknown_083755CC[sprite->data1](mapObject, sprite);
}

u8 sub_805FAF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    return 0;
}

u8 sub_805FB04(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sprite->data1 = 0;
    }
    return 0;
}

fieldmap_object_cb(sub_805FB20, sub_805FB44, gUnknown_083755D0);

u8 sub_805FB64(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetStepInPlaceDelay16AnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805FB90, sub_805FBB4, gUnknown_083755D8);

u8 sub_805FBD4(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetStepInPlaceDelay8AnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805FC00, sub_805FC24, gUnknown_083755E0);

u8 sub_805FC44(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetStepInPlaceDelay4AnimId(mapObject->mapobj_unk_18));
    sprite->data1 = 1;
    return 1;
}

fieldmap_object_cb(sub_805FC70, sub_805FC94, gUnknown_083755E8);

u8 sub_805FCB4(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_reset(mapObject, sprite);
    FieldObjectSetRegularAnim(mapObject, sprite, GetFaceDirectionAnimId(mapObject->mapobj_unk_18));
    mapObject->mapobj_bit_13 = 1;
    sprite->data1 = 1;
    return 1;
}

u8 sub_805FCE8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectExecRegularAnim(mapObject, sprite))
    {
        sprite->data1 = 2;
        return 1;
    }
    return 0;
}

u8 sub_805FD08(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_1 = 0;
    return 0;
}

void sub_805FC70(struct Sprite *sprite);

void npc_reset(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_1 = 0;
    mapObject->mapobj_bit_6 = 0;
    mapObject->mapobj_bit_7 = 0;
    mapObject->mapobj_unk_1C = 0xff;
    sprite->data1 = 0;
}

extern const u8 gUnknown_083755F4[9];
extern const u8 gUnknown_083755FD[9];
extern const u8 gUnknown_08375606[9];
extern const u8 gUnknown_0837560F[9];
extern const u8 gUnknown_08375618[9];
extern const u8 gUnknown_08375621[9];
extern const u8 gUnknown_0837562A[9];
extern const u8 gUnknown_08375633[9];
extern const u8 gUnknown_0837563C[9];
extern const u8 gUnknown_08375645[9];
extern const u8 gUnknown_0837564E[9];
extern const u8 gUnknown_08375657[9];
extern const u8 gUnknown_08375660[9];
extern const u8 gUnknown_08375669[9];
extern const u8 gUnknown_08375672[9];

u8 FieldObjectDirectionToImageAnimId(u8 direction)
{
    return gUnknown_083755F4[direction];
}

u8 get_go_image_anim_num(u8 direction)
{
    return gUnknown_083755FD[direction];
}

u8 get_go_fast_image_anim_num(u8 direction)
{
    return gUnknown_08375606[direction];
}

u8 get_go_faster_image_anim_num(u8 direction)
{
    return gUnknown_0837560F[direction];
}

u8 sub_805FD78(u8 direction)
{
    return gUnknown_08375618[direction];
}

u8 sub_805FD88(u8 direction)
{
    return gUnknown_08375621[direction];
}

u8 sub_805FD98(u8 direction)
{
    return gUnknown_0837562A[direction];
}

u8 unref_sub_805FDA8(u8 direction)
{
    return gUnknown_08375633[direction];
}

u8 sub_805FDB8(u8 direction)
{
    return gUnknown_0837563C[direction];
}

u8 sub_805FDC8(u8 direction)
{
    return gUnknown_08375645[direction];
}

u8 sub_805FDD8(u8 direction)
{
    return gUnknown_0837564E[direction];
}

u8 sub_805FDE8(u8 direction)
{
    return gUnknown_08375657[direction];
}

u8 sub_805FDF8(u8 direction)
{
    return gUnknown_08375660[direction];
}

u8 sub_805FE08(u8 direction)
{
    return gUnknown_08375669[direction];
}

u8 get_run_image_anim_num(u8 direction)
{
    return gUnknown_08375672[direction];
}

void sub_805FE28(struct MapObject *mapObject, struct Sprite *sprite, u8 animNum)
{
    if (!mapObject->mapobj_bit_12)
    {
        sprite->animNum = animNum;
        if (sprite->animCmdIndex == 1)
        {
            sprite->animCmdIndex = 2;
        } else if (sprite->animCmdIndex == 3)
        {
            sprite->animCmdIndex = 0;
        }
        SeekSpriteAnim(sprite, sprite->animCmdIndex);
    }
}

void sub_805FE64(struct MapObject *mapObject, struct Sprite *sprite, u8 animNum)
{
    u8 animCmdIndex;
    if (!mapObject->mapobj_bit_12)
    {
        sprite->animNum = animNum;
        animCmdIndex = 3;
        if (sprite->animCmdIndex < 2)
        {
            animCmdIndex = 1;
        }
        SeekSpriteAnim(sprite, animCmdIndex);
    }
}

u8 sub_805FE90(s16 a0, s16 a1, s16 a2, s16 a3)
{
    if (a0 > a2)
    {
        return DIR_WEST;
    } else if (a0 < a2)
    {
        return DIR_EAST;
    } else if (a1 > a3)
    {
        return DIR_NORTH;
    } else
    {
        return DIR_SOUTH;
    }
}

void npc_set_running_behaviour_etc(struct MapObject *mapObject, u8 animPattern)
{
    mapObject->animPattern = animPattern;
    mapObject->mapobj_unk_21 = 0;
    mapObject->animId = 0;
    gSprites[mapObject->spriteId].callback = gUnknown_0836DA88[animPattern];
    gSprites[mapObject->spriteId].data1 = 0;
}

u8 npc_running_behaviour_by_direction(u8 direction)
{
    return gUnknown_0837567B[direction];
}

u8 sub_805FF20(struct MapObject *mapObject, u8 direction)
{
    s16 x;
    s16 y;
    x = mapObject->coords2.x;
    y = mapObject->coords2.y;
    MoveCoords(direction, &x, &y);
    return npc_block_way(mapObject, x, y, direction);
}

bool8 IsCoordOutsideFieldObjectMovementRect(struct MapObject2 *mapObject, s16 x, s16 y);
bool8 CheckForCollisionBetweenFieldObjects(struct MapObject *mapObject, s16 x, s16 y);
bool8 IsMetatileDirectionallyImpassable(struct MapObject *mapObject, s16 x, s16 y, u8 direction);

u8 npc_block_way(struct MapObject *mapObject, s16 x, s16 y, u8 direction)
{
    if (IsCoordOutsideFieldObjectMovementRect((struct MapObject2 *)mapObject, x, y))
    {
        return 1;
    }
    if (MapGridIsImpassableAt(x, y) || GetMapBorderIdAt(x, y) == -1 || IsMetatileDirectionallyImpassable(mapObject, x, y, direction))
    {
        return 2;
    } else if (mapObject->mapobj_bit_15 && !CanCameraMoveInDirection(direction))
    {
        return 2;
    }
    if (IsZCoordMismatchAt(mapObject->mapobj_unk_0B_0, x, y))
    {
        return 3;
    }
    if (CheckForCollisionBetweenFieldObjects(mapObject, x, y))
    {
        return 4;
    }
    return 0;
}

u8 sub_8060024(struct MapObject *mapObject, s16 x, s16 y, u8 direction)
{
    u8 flags;
    flags = 0;
    if (IsCoordOutsideFieldObjectMovementRect((struct MapObject2 *)mapObject, x, y))
    {
        flags |= 1;
    }
    if (MapGridIsImpassableAt(x, y) || GetMapBorderIdAt(x, y) == -1 || IsMetatileDirectionallyImpassable(mapObject, x, y, direction) || (mapObject->mapobj_bit_15 && !CanCameraMoveInDirection(direction)))
    {
        flags |= 2;
    }
    if (IsZCoordMismatchAt(mapObject->mapobj_unk_0B_0, x, y))
    {
        flags |= 4;
    }
    if (CheckForCollisionBetweenFieldObjects(mapObject, x, y))
    {
        flags |= 8;
    }
    return flags;
}

bool8 IsCoordOutsideFieldObjectMovementRect(struct MapObject2 *mapObject, s16 x, s16 y)
{
    s16 minv;
    s16 maxv;
    if (mapObject->mapobj_unk_19 != 0)
    {
        minv = mapObject->coords1.x - (mapObject->mapobj_unk_19);
        maxv = mapObject->coords1.x + (mapObject->mapobj_unk_19);
        if (minv > x || maxv < x)
        {
            return 1;
        }
    }
    if (mapObject->mapobj_unk_19b != 0)
    {
        minv = mapObject->coords1.y - (mapObject->mapobj_unk_19b);
        maxv = mapObject->coords1.y + (mapObject->mapobj_unk_19b);
        if (minv > y || maxv < y)
        {
            return 1;
        }
    }
    return 0;
}

bool8 IsMetatileDirectionallyImpassable(struct MapObject *mapObject, s16 x, s16 y, u8 direction)
{
    if (gUnknown_08375684[direction - 1](mapObject->mapobj_unk_1E) || gUnknown_08375694[direction - 1](MapGridGetMetatileBehaviorAt(x, y)))
    {
        return 1;
    }
    return 0;
}

bool8 CheckForCollisionBetweenFieldObjects(struct MapObject *mapObject, s16 x, s16 y)
{
    struct MapObject *mapObject2;
    u8 i;
    for (i=0; i<16; i++)
    {
        mapObject2 = &gMapObjects[i];
        if (mapObject2->active && mapObject2 != mapObject)
        {
            if ((mapObject2->coords2.x != x || mapObject2->coords2.y != y) && (mapObject2->coords3.x != x || mapObject2->coords3.y != y))
            {
                continue;
            }
            if (AreZCoordsCompatible(mapObject->mapobj_unk_0B_0, mapObject2->mapobj_unk_0B_0))
            {
                return 1;
            }
        }
    }
    return 0;
}

bool8 sub_8060234(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;
    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        if (gSprites[gMapObjects[mapObjectId].spriteId].data7 & 2)
        {
            return 1;
        }
    }
    return 0;
}

void sub_8060288(u8 localId, u8 mapNum, u8 mapGroup)
{
    u8 mapObjectId;
    if (!TryGetFieldObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &mapObjectId))
    {
        gSprites[gMapObjects[mapObjectId].spriteId].data7 |= 4;
    }
}

void MoveCoords(u8 direction, s16 *x, s16 *y)
{
    *x += gDirectionToVector[direction].x;
    *y += gDirectionToVector[direction].y;
}

void unref_sub_80602F8(u8 direction, s16 *x, s16 *y)
{
    *x += gDirectionToVector[direction].x << 4;
    *y += gDirectionToVector[direction].y << 4;
}

void sub_8060320(u8 direction, s16 *x, s16 *y, s16 deltaX, s16 deltaY)
{
    if (gDirectionToVector[direction].x > 0)
    {
        *x += deltaX;
    }
    if (gDirectionToVector[direction].x < 0)
    {
        *x -= deltaX;
    }
    if (gDirectionToVector[direction].y > 0)
    {
        *y += deltaY;
    }
    if (gDirectionToVector[direction].y < 0)
    {
        *y -= deltaY;
    }
}

void sub_8060388(s16 x1, s16 y1, s16 *x2, s16 *y2)
{
    *x2 = (x1 - gSaveBlock1.pos.x) << 4;
    *y2 = (y1 - gSaveBlock1.pos.y) << 4;
    *x2 -= gUnknown_0300489C;
    *y2 -= gUnknown_03004898;
}

void sub_80603CC(s16 x1, s16 y1, s16 *x2, s16 *y2)
{
    s16 x3;
    s16 y3;
    x3 = -gUnknown_0300489C - gUnknown_03004880.unk10;
    y3 = -gUnknown_03004898 - gUnknown_03004880.unk14;
    if (gUnknown_03004880.unk10 > 0)
    {
        x3 += 0x10;
    }
    if (gUnknown_03004880.unk10 < 0)
    {
        x3 -= 0x10;
    }
    if (gUnknown_03004880.unk14 > 0)
    {
        y3 += 0x10;
    }
    if (gUnknown_03004880.unk14 < 0)
    {
        y3 -= 0x10;
    }
    *x2 = ((x1 - gSaveBlock1.pos.x) << 4) + x3;
    *y2 = ((y1 - gSaveBlock1.pos.y) << 4) + y3;
}

void sub_8060470(s16 *x, s16 *y, s16 dx, s16 dy)
{
    sub_80603CC(*x, *y, x, y);
    *x += dx;
    *y += dy;
}

void GetFieldObjectMovingCameraOffset(s16 *x, s16 *y)
{
    *x = 0;
    *y = 0;
    if (gUnknown_03004880.unk10 > 0)
    {
        (*x)++;
    }
    if (gUnknown_03004880.unk10 < 0)
    {
        (*x)--;
    }
    if (gUnknown_03004880.unk14 > 0)
    {
        (*y)++;
    }
    if (gUnknown_03004880.unk14 < 0)
    {
        (*y)--;
    }
}

void FieldObjectMoveDestCoords(struct MapObject *mapObject, u8 direction, s16 *x, s16 *y)
{
    *x = mapObject->coords2.x;
    *y = mapObject->coords2.y;
    MoveCoords(direction, x, y);
}

bool8 FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_1 || mapObject->mapobj_bit_6)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 FieldObjectIsSpecialAnimActive(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6 && mapObject->mapobj_unk_1C != 0xff)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 FieldObjectSetSpecialAnim(struct MapObject *mapObject, u8 specialAnimId)
{
    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject))
    {
        return TRUE;
    }
    UnfreezeMapObject(mapObject);
    mapObject->mapobj_unk_1C = specialAnimId;
    mapObject->mapobj_bit_6 = 1;
    mapObject->mapobj_bit_7 = 0;
    gSprites[mapObject->spriteId].data2 = 0;
    return FALSE;
}

void FieldObjectForceSetSpecialAnim(struct MapObject *mapObject, u8 specialAnimId)
{
    FieldObjectClearAnimIfSpecialAnimActive(mapObject);
    FieldObjectSetSpecialAnim(mapObject, specialAnimId);
}

void FieldObjectClearAnimIfSpecialAnimActive(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6)
    {
        FieldObjectClearAnim(mapObject);
    }
}

void FieldObjectClearAnim(struct MapObject *mapObject)
{
    mapObject->mapobj_unk_1C = 0xFF;
    mapObject->mapobj_bit_6 = 0;
    mapObject->mapobj_bit_7 = 0;
    gSprites[mapObject->spriteId].data1 = 0;
    gSprites[mapObject->spriteId].data2 = 0;
}

bool8 FieldObjectCheckIfSpecialAnimFinishedOrInactive(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6)
        return mapObject->mapobj_bit_7;
    return 0x10;
}

bool8 FieldObjectClearAnimIfSpecialAnimFinished(struct MapObject *mapObject)
{
    u8 specialAnimStatus;
    specialAnimStatus = FieldObjectCheckIfSpecialAnimFinishedOrInactive(mapObject);
    if (specialAnimStatus != 0 && specialAnimStatus != 0x10)
    {
        FieldObjectClearAnimIfSpecialAnimActive(mapObject);
    }
    return specialAnimStatus;
}

u8 FieldObjectGetSpecialAnim(struct MapObject *mapObject)
{
    if (mapObject->mapobj_bit_6)
    {
        return mapObject->mapobj_unk_1C;
    }
    return 0xFF;
}

extern void DoGroundEffects_OnSpawn(struct MapObject *mapObject, struct Sprite *sprite);
extern void DoGroundEffects_OnBeginStep(struct MapObject *mapObject, struct Sprite *sprite);
extern void DoGroundEffects_OnFinishStep(struct MapObject *mapObject, struct Sprite *sprite);
void npc_obj_transfer_image_anim_pause_flag(struct MapObject *mapObject, struct Sprite *sprite);
void sub_80634A0(struct MapObject *mapObject, struct Sprite *sprite);
void FieldObjectExecSpecialAnim(struct MapObject *mapObject, struct Sprite *sprite);
void FieldObjectUpdateSubpriority(struct MapObject *mapObject, struct Sprite *sprite);

void meta_step(struct MapObject *mapObject, struct Sprite *sprite, u8 (*callback)(struct MapObject *, struct Sprite *))
{
    DoGroundEffects_OnSpawn(mapObject, sprite);
    sub_80634A0(mapObject, sprite);
    if (FieldObjectIsSpecialAnimActive(mapObject))
    {
        FieldObjectExecSpecialAnim(mapObject, sprite);
    } else
    {
        if (!mapObject->mapobj_bit_8)
        {
            while (callback(mapObject, sprite));
        }
    }
    DoGroundEffects_OnBeginStep(mapObject, sprite);
    DoGroundEffects_OnFinishStep(mapObject, sprite);
    npc_obj_transfer_image_anim_pause_flag(mapObject, sprite);
    sub_80634D0(mapObject, sprite);
    FieldObjectUpdateSubpriority(mapObject, sprite);
}


extern const u8 gUnknown_083756C8[5];

u8 GetFaceDirectionAnimId(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756C8, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756CD[5];

u8 GetSimpleGoAnimId(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756CD, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756D2[5];

u8 GetGoSpeed0AnimId(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756D2, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756D7[5];

u8 sub_8060744(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756D7, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756DC[5];

u8 d2s_08064034(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756DC, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756E1[5];

u8 sub_806079C(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756E1, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756E6[5];

u8 sub_80607C8(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756E6, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756EB[5];

u8 sub_80607F4(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756EB, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756F0[5];

u8 GetJumpLedgeAnimId(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756F0, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756F5[5];

u8 sub_806084C(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756F5, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756FA[5];

u8 sub_8060878(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756FA, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_083756FF[5];

u8 sub_80608A4(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_083756FF, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375704[5];

u8 sub_80608D0(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375704, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375709[5];

u8 GetStepInPlaceDelay32AnimId(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375709, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_0837570E[5];

u8 GetStepInPlaceDelay16AnimId(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837570E, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375713[5];

u8 GetStepInPlaceDelay8AnimId(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375713, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375718[5];

u8 GetStepInPlaceDelay4AnimId(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375718, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 FieldObjectFaceOppositeDirection(struct MapObject *mapObject, u8 direction)
{
    return FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(GetOppositeDirection(direction)));
}

extern const u8 gUnknown_0837571D[5];

u8 sub_80609D8(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837571D, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375722[5];

u8 sub_8060A04(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375722, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375727[5];

u8 sub_8060A30(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375727, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_0837572C[5];

u8 sub_8060A5C(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837572C, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375731[5];

u8 sub_8060A88(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375731, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375736[5];

u8 sub_8060AB4(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375736, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_0837573B[5];

u8 sub_8060AE0(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837573B, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375740[5];

u8 sub_8060B0C(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375740, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_08375745[5];

u8 sub_8060B38(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_08375745, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

extern const u8 gUnknown_0837574A[5];

u8 sub_8060B64(u8 index)
{
    u8 directions[5];
    memcpy(directions, gUnknown_0837574A, 5);
    if (index >= 5)
    {
        index = 0;
    }
    return directions[index];
}

u8 GetOppositeDirection(u8 direction)
{
    u8 directions[8];
    memcpy(directions, gUnknown_0837574F, 8);
    if (direction == 0 || direction > 8)
    {
        return direction;
    }
    return directions[direction - 1];
}

int zffu_offset_calc(u8 a0, u8 a1)
{
    return gUnknown_08375757[a0 - 1][a1 - 1];
}

#ifdef NONMATCHING
int state_to_direction(u8 a0, u8 a1, u8 a2)
{
    int zffuOffset;
    asm_comment("For some reason, r2 is being backed up to r3 and restored ahead of the zffu call.");
    if (a1 == 0 || a2 == 0 || a1 > 4 || a2 > 4)
    {
        return 0;
    }
    zffuOffset = zffu_offset_calc(a1, a2);
    return gUnknown_08375767[a0 - 1][zffuOffset - 1];
}
#else
__attribute__((naked))
int state_to_direction(u8 a0, u8 a1, u8 a2)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r0, r1, 0\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    cmp r1, 0\n\
    beq _08060BFC\n\
    cmp r2, 0\n\
    beq _08060BFC\n\
    cmp r1, 0x4\n\
    bhi _08060BFC\n\
    cmp r2, 0x4\n\
    bls _08060C00\n\
_08060BFC:\n\
    movs r0, 0\n\
    b _08060C12\n\
_08060C00:\n\
    adds r1, r2, 0\n\
    bl zffu_offset_calc\n\
    ldr r2, _08060C18 @ =gUnknown_08375767\n\
    lsls r1, r4, 2\n\
    subs r1, 0x5\n\
    adds r0, r1\n\
    adds r0, r2\n\
    ldrb r0, [r0]\n\
_08060C12:\n\
    pop {r4}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_08060C18: .4byte gUnknown_08375767\n\
.syntax divided\n");
}
#endif

extern u8 (**const gUnknown_08375778[])(struct MapObject *, struct Sprite *);

void FieldObjectExecSpecialAnim(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gUnknown_08375778[mapObject->mapobj_unk_1C][sprite->data2](mapObject, sprite))
    {
        mapObject->mapobj_bit_7 = 1;
    }
}

bool8 FieldObjectExecRegularAnim(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (gUnknown_08375778[mapObject->mapobj_unk_1C][sprite->data2](mapObject, sprite))
    {
        mapObject->mapobj_unk_1C = 0xFF;
        sprite->data2 = 0;
        return 1;
    }
    return 0;
}

void FieldObjectSetRegularAnim(struct MapObject *mapObject, struct Sprite *sprite, u8 animId)
{
    mapObject->mapobj_unk_1C = animId;
    sprite->data2 = 0;
}

void an_look_any(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    FieldObjectSetDirection(mapObject, direction);
    npc_coords_shift_still(mapObject);
    sub_805FE64(mapObject, sprite, get_go_image_anim_num(mapObject->mapobj_unk_18));
    sprite->animPaused = 1;
    sprite->data2 = 1;
}

u8 sub_8060CE0(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, DIR_SOUTH);
    return 1;
}

u8 sub_8060CF0(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, DIR_NORTH);
    return 1;
}

u8 sub_8060D00(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, DIR_WEST);
    return 1;
}

u8 sub_8060D10(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, DIR_EAST);
    return 1;
}

void sub_8060D20(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    s16 x;
    s16 y;
    x = mapObject->coords2.x;
    y = mapObject->coords2.y;
    FieldObjectSetDirection(mapObject, direction);
    MoveCoords(direction, &x, &y);
    npc_coords_shift(mapObject, x, y);
    oamt_npc_ministep_reset(sprite, direction, a3);
    sprite->animPaused = 0;
    mapObject->mapobj_bit_2 = 1;
    sprite->data2 = 1;
}

extern u8 (*const gUnknown_083759C0[5])(u8);

void do_go_anim(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    u8 (*functions[5])(u8);
    memcpy(functions, gUnknown_083759C0, sizeof(gUnknown_083759C0));
    sub_8060D20(mapObject, sprite, direction, a3);
    sub_805FE28(mapObject, sprite, functions[a3](mapObject->mapobj_unk_18));
}

void do_run_anim(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    sub_8060D20(mapObject, sprite, direction, 1);
    sub_805FE28(mapObject, sprite, get_run_image_anim_num(mapObject->mapobj_unk_18));
}

bool8 obj_npc_ministep(struct Sprite *);

bool8 npc_obj_ministep_stop_on_arrival(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (obj_npc_ministep(sprite))
    {
        npc_coords_shift_still(mapObject);
        mapObject->mapobj_bit_3 = 1;
        sprite->animPaused = 1;
        return 1;
    }
    return 0;
}

void sub_8060E68(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    s16 x;
    s16 y;
    x = mapObject->coords2.x;
    y = mapObject->coords2.y;
    FieldObjectSetDirection(mapObject, direction);
    MoveCoords(direction, &x, &y);
    npc_coords_shift(mapObject, x, y);
    sub_806467C(sprite, direction);
    sprite->animPaused = 0;
    mapObject->mapobj_bit_2 = 1;
    sprite->data2 = 1;
}

void sub_8060ED8(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    sub_8060E68(mapObject, sprite, direction);
    sub_805FE28(mapObject, sprite, get_go_image_anim_num(mapObject->mapobj_unk_18));
}

bool8 an_walk_any_2(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_806468C(sprite))
    {
        npc_coords_shift_still(mapObject);
        mapObject->mapobj_bit_3 = 1;
        sprite->animPaused = 1;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8060F5C(struct MapObject *, struct Sprite *);

bool8 sub_8060F3C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_SOUTH);
    return sub_8060F5C(mapObject, sprite);
}

bool8 sub_8060F5C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8060F9C(struct MapObject *, struct Sprite *);

bool8 sub_8060F7C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_NORTH);
    return sub_8060F9C(mapObject, sprite);
}

bool8 sub_8060F9C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8060FDC(struct MapObject *, struct Sprite *);

bool8 sub_8060FBC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_WEST);
    return sub_8060FDC(mapObject, sprite);
}

bool8 sub_8060FDC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806101C(struct MapObject *, struct Sprite *);

bool8 sub_8060FFC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_EAST);
    return sub_806101C(mapObject, sprite);
}

bool8 sub_806101C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806105C(struct MapObject *, struct Sprite *);

bool8 sub_806103C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 0);
    return sub_806105C(mapObject, sprite);
}

bool8 sub_806105C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806109C(struct MapObject *, struct Sprite *);

bool8 sub_806107C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 0);
    return sub_806109C(mapObject, sprite);
}

bool8 sub_806109C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80610DC(struct MapObject *, struct Sprite *);

bool8 sub_80610BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 0);
    return sub_80610DC(mapObject, sprite);
}

bool8 sub_80610DC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806111C(struct MapObject *, struct Sprite *);

bool8 sub_80610FC(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 0);
    return sub_806111C(mapObject, sprite);
}

bool8 sub_806111C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

extern const s16 gUnknown_08375A34[3];
extern const s16 gUnknown_08375A3A[3];

void sub_806113C(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a4, u8 a5)
{
    s16 vSPp4[3];
    s16 x;
    s16 y;
    memcpy(vSPp4, gUnknown_08375A34, sizeof gUnknown_08375A34);
    x = 0;
    y = 0;
    FieldObjectSetDirection(mapObject, direction);
    sub_8060320(direction, &x, &y, vSPp4[a4], vSPp4[a4]);
    npc_coords_shift(mapObject, mapObject->coords2.x + x, mapObject->coords2.y + y);
    sub_80646E4(sprite, direction, a4, a5);
    sprite->data2 = 1;
    sprite->animPaused = 0;
    mapObject->mapobj_bit_2 = 1;
    mapObject->mapobj_bit_4 = 1;
}

void maybe_shadow_1(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a4, u8 a5)
{
    sub_806113C(mapObject, sprite, direction, a4, a5);
    sub_805FE28(mapObject, sprite, get_go_image_anim_num(mapObject->mapobj_unk_18));
    DoShadowFieldEffect(mapObject);
}

u8 sub_806123C(struct MapObject *mapObject, struct Sprite *sprite, u8 (*const callback)(struct Sprite *))
{
    s16 vSPp4[3];
    s16 x;
    s16 y;
    u8 retval;
    memcpy(vSPp4, gUnknown_08375A3A, sizeof gUnknown_08375A3A);
    retval = callback(sprite);
    if (retval == 1 && vSPp4[sprite->data4] != 0)
    {
        x = 0;
        y = 0;
        sub_8060320(mapObject->placeholder18, &x, &y, vSPp4[sprite->data4], vSPp4[sprite->data4]);
        npc_coords_shift(mapObject, mapObject->coords2.x + x, mapObject->coords2.y + y);
        mapObject->mapobj_bit_2 = 1;
        mapObject->mapobj_bit_4 = 1;
    } else if (retval == 0xff)
    {
        npc_coords_shift_still(mapObject);
        mapObject->mapobj_bit_3 = 1;
        mapObject->mapobj_bit_5 = 1;
        sprite->animPaused = 1;
    }
    return retval;
}

u8 sub_8061300(struct MapObject *mapObject, struct Sprite *sprite)
{
    return sub_806123C(mapObject, sprite, sub_8064704);
}

u8 sub_8061314(struct MapObject *mapObject, struct Sprite *sprite)
{
    return sub_806123C(mapObject, sprite, sub_806478C);
}

bool8 sub_8061328(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061300(mapObject, sprite) == 0xFF)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061340(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061314(mapObject, sprite) == 0xFF)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061358(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 retval;

    retval = sub_8061300(mapObject, sprite);
    if (retval != 1)
    {
        if (retval == 0xFF)
        {
            return TRUE;
        }
        return FALSE;
    }
    FieldObjectSetDirection(mapObject, GetOppositeDirection(mapObject->placeholder18));
    sub_805FE64(mapObject, sprite, get_go_image_anim_num(mapObject->mapobj_unk_18));
    return FALSE;
}

bool8 sub_80613D4(struct MapObject *, struct Sprite *);
bool8 sub_806142C(struct MapObject *, struct Sprite *);
bool8 sub_8061484(struct MapObject *, struct Sprite *);
bool8 sub_80614DC(struct MapObject *, struct Sprite *);

bool8 sub_80613A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_SOUTH, 2, 0);
    return sub_80613D4(mapObject, sprite);
}

bool8 sub_80613D4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061400(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_NORTH, 2, 0);
    return sub_806142C(mapObject, sprite);
}

bool8 sub_806142C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061458(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_WEST, 2, 0);
    return sub_8061484(mapObject, sprite);
}

bool8 sub_8061484(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80614B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_EAST, 2, 0);
    return sub_80614DC(mapObject, sprite);
}

bool8 sub_80614DC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_8061508(struct Sprite *sprite, u16 duration)
{
    sprite->data2 = 1;
    sprite->data3 = duration;
}

bool8 sub_8061510(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->data3--;
    if (!sprite->data3)
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806152C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 1);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_806154C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 2);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_806156C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 4);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_806158C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 8);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_80615AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061508(sprite, 16);
    return sub_8061510(mapObject, sprite);
}

bool8 sub_80615EC(struct MapObject *mapObject, struct Sprite *sprite);
bool8 sub_806162C(struct MapObject *mapObject, struct Sprite *sprite);
bool8 sub_806166C(struct MapObject *mapObject, struct Sprite *sprite);
bool8 sub_80616AC(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80615CC(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 1);
    return sub_80615EC(mapObject, sprite);
}

bool8 sub_80615EC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}
bool8 sub_806160C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 1);
    return sub_806162C(mapObject, sprite);
}

bool8 sub_806162C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}
bool8 sub_806164C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 1);
    return sub_806166C(mapObject, sprite);
}

bool8 sub_806166C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}
bool8 sub_806168C(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 1);
    return sub_80616AC(mapObject, sprite);
}

bool8 sub_80616AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_80616CC(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 animId, u16 duration)
{
    FieldObjectSetDirection(mapObject, direction);
    sub_805FE28(mapObject, sprite, animId);
    sprite->animPaused = 0;
    sprite->data2 = 1;
    sprite->data3 = duration;
}

bool8 sub_8061714(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->data3--;
    if (sprite->data3 == 0)
    {
        sprite->data2 = 2;
        sprite->animPaused = 1;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806173C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sprite->data3 & 1)
    {
        sprite->animDelayCounter++;
    }
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061778(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, get_go_image_anim_num(DIR_SOUTH), 32);
    return sub_806173C(mapObject, sprite);
}

bool8 sub_80617B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, get_go_image_anim_num(DIR_NORTH), 32);
    return sub_806173C(mapObject, sprite);
}

bool8 sub_80617E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, get_go_image_anim_num(DIR_WEST), 32);
    return sub_806173C(mapObject, sprite);
}

bool8 sub_8061820(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, get_go_image_anim_num(DIR_EAST), 32);
    return sub_806173C(mapObject, sprite);
}

bool8 sub_8061858(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, get_go_image_anim_num(DIR_SOUTH), 16);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061890(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, get_go_image_anim_num(DIR_NORTH), 16);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_80618C8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, get_go_image_anim_num(DIR_WEST), 16);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061900(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, get_go_image_anim_num(DIR_EAST), 16);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061938(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, get_go_fast_image_anim_num(DIR_SOUTH), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061970(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, get_go_fast_image_anim_num(DIR_NORTH), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_80619A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, get_go_fast_image_anim_num(DIR_WEST), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_80619E0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, get_go_fast_image_anim_num(DIR_EAST), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061A18(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, get_go_faster_image_anim_num(DIR_SOUTH), 4);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061A50(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, get_go_faster_image_anim_num(DIR_NORTH), 4);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061A88(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, get_go_faster_image_anim_num(DIR_WEST), 4);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061AC0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, get_go_faster_image_anim_num(DIR_EAST), 4);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8061B18(struct MapObject *, struct Sprite *);

bool8 sub_8061AF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 2);
    return sub_8061B18(mapObject, sprite);
}

bool8 sub_8061B18(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 sub_8061B58(struct MapObject *, struct Sprite *);

bool8 sub_8061B38(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 2);
    return sub_8061B58(mapObject, sprite);
}

bool8 sub_8061B58(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 sub_8061B98(struct MapObject *, struct Sprite *);

bool8 sub_8061B78(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 2);
    return sub_8061B98(mapObject, sprite);
}

bool8 sub_8061B98(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 sub_8061BD8(struct MapObject *, struct Sprite *);

bool8 sub_8061BB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 2);
    return sub_8061BD8(mapObject, sprite);
}

bool8 sub_8061BD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061C18(struct MapObject *, struct Sprite *);

bool8 sub_8061BF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 3);
    return sub_8061C18(mapObject, sprite);
}

bool8 sub_8061C18(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061C58(struct MapObject *, struct Sprite *);

bool8 sub_8061C38(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 3);
    return sub_8061C58(mapObject, sprite);
}

bool8 sub_8061C58(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 sub_8061C98(struct MapObject *, struct Sprite *);

bool8 sub_8061C78(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 3);
    return sub_8061C98(mapObject, sprite);
}

bool8 sub_8061C98(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 sub_8061CD8(struct MapObject *, struct Sprite *);

bool8 sub_8061CB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 3);
    return sub_8061CD8(mapObject, sprite);
}

bool8 sub_8061CD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061D18(struct MapObject *, struct Sprite *);

bool8 sub_8061CF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_SOUTH, 4);
    return sub_8061D18(mapObject, sprite);
}

bool8 sub_8061D18(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061D58(struct MapObject *, struct Sprite *);

bool8 sub_8061D38(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_NORTH, 4);
    return sub_8061D58(mapObject, sprite);
}

bool8 sub_8061D58(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 sub_8061D98(struct MapObject *, struct Sprite *);

bool8 sub_8061D78(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_WEST, 4);
    return sub_8061D98(mapObject, sprite);
}

bool8 sub_8061D98(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}


bool8 sub_8061DD8(struct MapObject *, struct Sprite *);

bool8 sub_8061DB8(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_go_anim(mapObject, sprite, DIR_EAST, 4);
    return sub_8061DD8(mapObject, sprite);
}

bool8 sub_8061DD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061E18(struct MapObject *, struct Sprite *);

bool8 do_run_south_anim(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_run_anim(mapObject, sprite, DIR_SOUTH);
    return sub_8061E18(mapObject, sprite);
}

bool8 sub_8061E18(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061E58(struct MapObject *, struct Sprite *);

bool8 do_run_north_anim(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_run_anim(mapObject, sprite, DIR_NORTH);
    return sub_8061E58(mapObject, sprite);
}

bool8 sub_8061E58(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061E98(struct MapObject *, struct Sprite *);

bool8 do_run_west_anim(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_run_anim(mapObject, sprite, DIR_WEST);
    return sub_8061E98(mapObject, sprite);
}

bool8 sub_8061E98(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061ED8(struct MapObject *, struct Sprite *);

bool8 do_run_east_anim(struct MapObject *mapObject, struct Sprite *sprite)
{
    do_run_anim(mapObject, sprite, DIR_EAST);
    return sub_8061ED8(mapObject, sprite);
}

bool8 sub_8061ED8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

void npc_set_direction_and_anim__an_proceed(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 animNum)
{
    obj_anim_image_set_and_seek(sprite, animNum, 0);
    FieldObjectSetDirection(mapObject, direction);
    sprite->data2 = 1;
}

bool8 sub_8061F24(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, mapObject->placeholder18, sprite->animNum);
    return FALSE;
}

bool8 sub_8064864(struct Sprite *);

bool8 sub_8061F3C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064864(sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_8061F5C(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    sub_806113C(mapObject, sprite, direction, 1, 0);
    StartSpriteAnim(sprite, sub_805FD88(direction));
}

bool8 sub_8061FB0(struct MapObject *, struct Sprite *);

bool8 sub_8061F90(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061F5C(mapObject, sprite, DIR_SOUTH);
    return sub_8061FB0(mapObject, sprite);
}

bool8 sub_8061FB0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061340(mapObject, sprite))
    {
        sprite->data2 = 2;
        mapObject->mapobj_bit_5 = 0;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8061FF8(struct MapObject *, struct Sprite *);

bool8 sub_8061FD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061F5C(mapObject, sprite, DIR_NORTH);
    return sub_8061FF8(mapObject, sprite);
}

bool8 sub_8061FF8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061340(mapObject, sprite))
    {
        sprite->data2 = 2;
        mapObject->mapobj_bit_5 = 0;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062040(struct MapObject *, struct Sprite *);

bool8 sub_8062020(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061F5C(mapObject, sprite, DIR_WEST);
    return sub_8062040(mapObject, sprite);
}

bool8 sub_8062040(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061340(mapObject, sprite))
    {
        sprite->data2 = 2;
        mapObject->mapobj_bit_5 = 0;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062088(struct MapObject *, struct Sprite *);

bool8 sub_8062068(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8061F5C(mapObject, sprite, DIR_EAST);
    return sub_8062088(mapObject, sprite);
}

bool8 sub_8062088(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061340(mapObject, sprite))
    {
        sprite->data2 = 2;
        mapObject->mapobj_bit_5 = 0;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80620B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 objectId;
    if (!TryGetFieldObjectIdByLocalIdAndMap(0xFF, MAP_GROUP_PETALBURG_CITY, MAP_ID_PETALBURG_CITY, &objectId))
    {
        an_look_any(mapObject, sprite, sub_805FE90(mapObject->coords2.x, mapObject->coords2.y, gMapObjects[objectId].coords2.x, gMapObjects[objectId].coords2.y));
    }
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_806210C(struct MapObject *mapObject, struct Sprite *sprite)
{
    u8 objectId;
    if (!TryGetFieldObjectIdByLocalIdAndMap(0xFF, MAP_GROUP_PETALBURG_CITY, MAP_ID_PETALBURG_CITY, &objectId))
    {
        an_look_any(mapObject, sprite, GetOppositeDirection(sub_805FE90(mapObject->coords2.x, mapObject->coords2.y, gMapObjects[objectId].coords2.x, gMapObjects[objectId].coords2.y)));
    }
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_8062170(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_9 = 1;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_8062180(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_9 = 0;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_80621BC(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062190(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_SOUTH, 1, 2);
    return sub_80621BC(mapObject, sprite);
}

bool8 sub_80621BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062214(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80621E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_NORTH, 1, 2);
    return sub_8062214(mapObject, sprite);
}

bool8 sub_8062214(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806226C(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062240(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_WEST, 1, 2);
    return sub_806226C(mapObject, sprite);
}

bool8 sub_806226C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80622C4(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062298(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_EAST, 1, 2);
    return sub_80622C4(mapObject, sprite);
}

bool8 sub_80622C4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806231C(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80622F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_SOUTH, 0, 0);
    return sub_806231C(mapObject, sprite);
}

bool8 sub_806231C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062374(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062348(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_NORTH, 0, 0);
    return sub_8062374(mapObject, sprite);
}

bool8 sub_8062374(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80623CC(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80623A0(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_WEST, 0, 0);
    return sub_80623CC(mapObject, sprite);
}

bool8 sub_80623CC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062424(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80623F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_EAST, 0, 0);
    return sub_8062424(mapObject, sprite);
}

bool8 sub_8062424(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806247C(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062450(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_SOUTH, 0, 2);
    return sub_806247C(mapObject, sprite);
}

bool8 sub_806247C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061358(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80624D4(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_80624A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_NORTH, 0, 2);
    return sub_80624D4(mapObject, sprite);
}

bool8 sub_80624D4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061358(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_806252C(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062500(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_WEST, 0, 2);
    return sub_806252C(mapObject, sprite);
}

bool8 sub_806252C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061358(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062584(struct MapObject *mapObject, struct Sprite *sprite);

bool8 sub_8062558(struct MapObject *mapObject, struct Sprite *sprite)
{
    maybe_shadow_1(mapObject, sprite, DIR_EAST, 0, 2);
    return sub_8062584(mapObject, sprite);
}

bool8 sub_8062584(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061358(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80625B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    an_look_any(mapObject, sprite, gUnknown_0836DC09[mapObject->animPattern]);
    return TRUE;
}

bool8 sub_80625C8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_SOUTH, 0x14);
    return FALSE;
}

bool8 sub_80625D8(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_25 = 0;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_80625E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_25 = 1;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_80625F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_12 = 1;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_8062608(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_12 = GetFieldObjectGraphicsInfo(mapObject->graphicsId)->inanimate;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_8062634(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_13 = 1;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_8062644(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_13 = 0;
    sprite->data2 = 1;
    return TRUE;
}

bool8 do_exclamation_mark_bubble_1(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectGetLocalIdAndMap(mapObject, (u8 *)&gUnknown_0202FF84[0], (u8 *)&gUnknown_0202FF84[1], (u8 *)&gUnknown_0202FF84[2]);
    FieldEffectStart(0x0);
    sprite->data2 = 1;
    return TRUE;
}

bool8 do_exclamation_mark_bubble_2(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectGetLocalIdAndMap(mapObject, (u8 *)&gUnknown_0202FF84[0], (u8 *)&gUnknown_0202FF84[1], (u8 *)&gUnknown_0202FF84[2]);
    FieldEffectStart(0x21);
    sprite->data2 = 1;
    return TRUE;
}

bool8 do_heart_bubble(struct MapObject *mapObject, struct Sprite *sprite)
{
    FieldObjectGetLocalIdAndMap(mapObject, (u8 *)&gUnknown_0202FF84[0], (u8 *)&gUnknown_0202FF84[1], (u8 *)&gUnknown_0202FF84[2]);
    FieldEffectStart(0x2e);
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_8062704(struct MapObject *, struct Sprite *);

bool8 sub_80626C0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (mapObject->animPattern == 0x3F)
    {
        sub_8084794(mapObject);
        return FALSE;
    }
    else if (mapObject->animPattern != 0x39 && mapObject->animPattern != 0x3A)
    {
        sprite->data2 = 2;
        return TRUE;
    }
    else
    {
        sub_812869C(mapObject);
        sprite->data2 = 1;
        return sub_8062704(mapObject, sprite);
    }
}

bool8 sub_8062704(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_81286C4(mapObject))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062724(struct MapObject *mapObject, struct Sprite *sprite)
{
    obj_anim_image_set_and_seek(sprite, 1, 0);
    sprite->data2 = 1;
    return FALSE;
}

bool8 sub_8062740(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064864(sprite))
    {
        sub_8064820(sprite, 0x20);
        sprite->data2 = 2;
    }
    return FALSE;
}

bool8 sub_8062764(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_13 ^= 1;
    if (sub_8064824(sprite))
    {
        mapObject->mapobj_bit_13 = 1;
        sprite->data2 = 3;
    }
    return FALSE;
}

bool8 sub_80627A0(struct MapObject *mapObject, struct Sprite *sprite)
{
    obj_anim_image_set_and_seek(sprite, 1, 0);
    sprite->data2 = 1;
    return FALSE;
}

bool8 sub_80627BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8064864(sprite))
    {
        sub_8064820(sprite, 0x20);
        sprite->data2 = 2;
    }
    return FALSE;
}

bool8 sub_80627E0(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_13 ^= 1;
    if (sub_8064824(sprite))
    {
        mapObject->mapobj_bit_13 = 1;
        sprite->data2 = 3;
    }
    return FALSE;
}

bool8 sub_806281C(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_26 = 1;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_806282C(struct MapObject *mapObject, struct Sprite *sprite)
{
    mapObject->mapobj_bit_26 = 0;
    sprite->data2 = 1;
    return TRUE;
}

bool8 sub_806283C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->oam.affineMode = 3;
    InitSpriteAffineAnim(sprite);
    sprite->affineAnimPaused = 1;
    sprite->subspriteMode = 0;
    return TRUE;
}

bool8 sub_806286C(struct MapObject *mapObject, struct Sprite *sprite)
{
    FreeOamMatrix(sprite->oam.matrixNum);
    sprite->oam.affineMode = 0;
    CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
    return TRUE;
}

bool8 sub_80628D0(struct MapObject *, struct Sprite *);

bool8 sub_806289C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_SOUTH);
    sprite->affineAnimPaused = 0;
    StartSpriteAffineAnimIfDifferent(sprite, 0);
    return sub_80628D0(mapObject, sprite);
}

bool8 sub_80628D0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->affineAnimPaused = 1;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062930(struct MapObject *, struct Sprite *);

bool8 sub_80628FC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8060ED8(mapObject, sprite, DIR_SOUTH);
    sprite->affineAnimPaused = 0;
    ChangeSpriteAffineAnimIfDifferent(sprite, 1);
    return sub_8062930(mapObject, sprite);
}

bool8 sub_8062930(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (an_walk_any_2(mapObject, sprite))
    {
        sprite->affineAnimPaused = 1;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_806295C(struct MapObject *mapObject, struct Sprite *sprite, u8 direction)
{
    FieldObjectSetDirection(mapObject, direction);
    npc_coords_shift_still(mapObject);
    sub_805FE64(mapObject, sprite, sub_805FDD8(direction));
    sprite->animPaused = 1;
    sprite->data2 = 1;
}

bool8 sub_806299C(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_806295C(mapObject, sprite, DIR_SOUTH);
    return TRUE;
}

bool8 sub_80629AC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_806295C(mapObject, sprite, DIR_NORTH);
    return TRUE;
}

bool8 sub_80629BC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_806295C(mapObject, sprite, DIR_WEST);
    return TRUE;
}

bool8 sub_80629CC(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_806295C(mapObject, sprite, DIR_EAST);
    return TRUE;
}

bool8 sub_80629DC(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_SOUTH, sub_805FD98(DIR_SOUTH));
    return FALSE;
}

bool8 sub_8062A00(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_NORTH, sub_805FD98(DIR_NORTH));
    return FALSE;
}

bool8 sub_8062A24(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_WEST, sub_805FD98(DIR_WEST));
    return FALSE;
}

bool8 sub_8062A48(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_EAST, sub_805FD98(DIR_EAST));
    return FALSE;
}

bool8 sub_8062A6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_SOUTH, sub_805FDB8(DIR_SOUTH));
    return FALSE;
}

bool8 sub_8062A90(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_NORTH, sub_805FDB8(DIR_NORTH));
    return FALSE;
}

bool8 sub_8062AB4(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_WEST, sub_805FDB8(DIR_WEST));
    return FALSE;
}

bool8 sub_8062AD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_EAST, sub_805FDB8(DIR_EAST));
    return FALSE;
}

bool8 sub_8062AFC(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_SOUTH, sub_805FDC8(DIR_SOUTH));
    return FALSE;
}

bool8 sub_8062B20(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_NORTH, sub_805FDC8(DIR_NORTH));
    return FALSE;
}

bool8 sub_8062B44(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_WEST, sub_805FDC8(DIR_WEST));
    return FALSE;
}

bool8 sub_8062B68(struct MapObject *mapObject, struct Sprite *sprite)
{
    npc_set_direction_and_anim__an_proceed(mapObject, sprite, DIR_EAST, sub_805FDC8(DIR_EAST));
    return FALSE;
}

void sub_8062B8C(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3, u8 a4)
{
    sub_806113C(mapObject, sprite, direction, a3, a4);
    StartSpriteAnimIfDifferent(sprite, sub_805FD98(direction));
    DoShadowFieldEffect(mapObject);
}

bool8 sub_8062BFC(struct MapObject *, struct Sprite *);

bool8 sub_8062BD0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_SOUTH, 0, 1);
    return sub_8062BFC(mapObject, sprite);
}

bool8 sub_8062BFC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062C54(struct MapObject *, struct Sprite *);

bool8 sub_8062C28(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_NORTH, 0, 1);
    return sub_8062C54(mapObject, sprite);
}

bool8 sub_8062C54(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062CAC(struct MapObject *, struct Sprite *);

bool8 sub_8062C80(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_WEST, 0, 1);
    return sub_8062CAC(mapObject, sprite);
}

bool8 sub_8062CAC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062D04(struct MapObject *, struct Sprite *);

bool8 sub_8062CD8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_EAST, 0, 1);
    return sub_8062D04(mapObject, sprite);
}

bool8 sub_8062D04(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062D5C(struct MapObject *, struct Sprite *);

bool8 sub_8062D30(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_SOUTH, 1, 1);
    return sub_8062D5C(mapObject, sprite);
}

bool8 sub_8062D5C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062DB4(struct MapObject *, struct Sprite *);

bool8 sub_8062D88(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_NORTH, 1, 1);
    return sub_8062DB4(mapObject, sprite);
}

bool8 sub_8062DB4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062E0C(struct MapObject *, struct Sprite *);

bool8 sub_8062DE0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_WEST, 1, 1);
    return sub_8062E0C(mapObject, sprite);
}

bool8 sub_8062E0C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062E64(struct MapObject *, struct Sprite *);

bool8 sub_8062E38(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_EAST, 1, 1);
    return sub_8062E64(mapObject, sprite);
}

bool8 sub_8062E64(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062EBC(struct MapObject *, struct Sprite *);

bool8 sub_8062E90(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_SOUTH, 2, 0);
    return sub_8062EBC(mapObject, sprite);
}

bool8 sub_8062EBC(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062F14(struct MapObject *, struct Sprite *);

bool8 sub_8062EE8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_NORTH, 2, 0);
    return sub_8062F14(mapObject, sprite);
}

bool8 sub_8062F14(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062F6C(struct MapObject *, struct Sprite *);

bool8 sub_8062F40(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_WEST, 2, 0);
    return sub_8062F6C(mapObject, sprite);
}

bool8 sub_8062F6C(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062FC4(struct MapObject *, struct Sprite *);

bool8 sub_8062F98(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8062B8C(mapObject, sprite, DIR_EAST, 2, 0);
    return sub_8062FC4(mapObject, sprite);
}

bool8 sub_8062FC4(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_8061328(mapObject, sprite))
    {
        mapObject->mapobj_bit_22 = 0;
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8062FF0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_SOUTH, sub_805FDD8(DIR_SOUTH), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8063028(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_NORTH, sub_805FDD8(DIR_NORTH), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8063060(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_WEST, sub_805FDD8(DIR_WEST), 8);
    return sub_8061714(mapObject, sprite);
}

bool8 sub_8063098(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80616CC(mapObject, sprite, DIR_EAST, sub_805FDD8(DIR_EAST), 8);
    return sub_8061714(mapObject, sprite);
}

void sub_80630D0(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(mapObject, sprite, direction, a3);
    StartSpriteAnim(sprite, sub_805FD98(mapObject->mapobj_unk_18));
    SeekSpriteAnim(sprite, 0);
}

bool8 sub_8063128(struct MapObject *, struct Sprite *);

bool8 sub_8063108(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80630D0(mapObject, sprite, DIR_SOUTH, 1);
    return sub_8063128(mapObject, sprite);
}

bool8 sub_8063128(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8063168(struct MapObject *, struct Sprite *);

bool8 sub_8063148(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80630D0(mapObject, sprite, DIR_NORTH, 1);
    return sub_8063168(mapObject, sprite);
}

bool8 sub_8063168(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80631A8(struct MapObject *, struct Sprite *);

bool8 sub_8063188(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80630D0(mapObject, sprite, DIR_WEST, 1);
    return sub_80631A8(mapObject, sprite);
}

bool8 sub_80631A8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80631E8(struct MapObject *, struct Sprite *);

bool8 sub_80631C8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80630D0(mapObject, sprite, DIR_EAST, 1);
    return sub_80631E8(mapObject, sprite);
}

bool8 sub_80631E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_8063208(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(mapObject, sprite, direction, a3);
    sub_805FE28(mapObject, sprite, sub_805FDD8(mapObject->mapobj_unk_18));
}

bool8 sub_8063258(struct MapObject *, struct Sprite *);

bool8 sub_8063238(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063208(mapObject, sprite, DIR_SOUTH, 1);
    return sub_8063258(mapObject, sprite);
}

bool8 sub_8063258(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8063298(struct MapObject *, struct Sprite *);

bool8 sub_8063278(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063208(mapObject, sprite, DIR_NORTH, 1);
    return sub_8063298(mapObject, sprite);
}

bool8 sub_8063298(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80632D8(struct MapObject *, struct Sprite *);

bool8 sub_80632B8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063208(mapObject, sprite, DIR_WEST, 1);
    return sub_80632D8(mapObject, sprite);
}

bool8 sub_80632D8(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8063318(struct MapObject *, struct Sprite *);

bool8 sub_80632F8(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063208(mapObject, sprite, DIR_EAST, 1);
    return sub_8063318(mapObject, sprite);
}

bool8 sub_8063318(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

void sub_8063338(struct MapObject *mapObject, struct Sprite *sprite, u8 direction, u8 a3)
{
    sub_8060D20(mapObject, sprite, direction, a3);
    StartSpriteAnim(sprite, sub_805FDB8(mapObject->mapobj_unk_18));
    SeekSpriteAnim(sprite, 0);
}

bool8 sub_8063390(struct MapObject *, struct Sprite *);

bool8 sub_8063370(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063338(mapObject, sprite, DIR_SOUTH, 1);
    return sub_8063390(mapObject, sprite);
}

bool8 sub_8063390(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80633D0(struct MapObject *, struct Sprite *);

bool8 sub_80633B0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063338(mapObject, sprite, DIR_NORTH, 1);
    return sub_80633D0(mapObject, sprite);
}

bool8 sub_80633D0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8063410(struct MapObject *, struct Sprite *);

bool8 sub_80633F0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063338(mapObject, sprite, DIR_WEST, 1);
    return sub_8063410(mapObject, sprite);
}

bool8 sub_8063410(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8063450(struct MapObject *, struct Sprite *);

bool8 sub_8063430(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8063338(mapObject, sprite, DIR_EAST, 1);
    return sub_8063450(mapObject, sprite);
}

bool8 sub_8063450(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (npc_obj_ministep_stop_on_arrival(mapObject, sprite))
    {
        sprite->data2 = 2;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8063470(struct MapObject *mapObject, struct Sprite *sprite)
{
    return TRUE;
}

bool8 sub_8063474(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->animPaused = 1;
    return TRUE;
}

void npc_obj_transfer_image_anim_pause_flag(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (mapObject->mapobj_bit_10)
    {
        sprite->animPaused = 1;
    }
}

void sub_80634A0(struct MapObject *mapObject, struct Sprite *sprite)
{
    if (mapObject->mapobj_bit_11)
    {
        sprite->animPaused = 0;
        mapObject->mapobj_bit_10 = 0;
        mapObject->mapobj_bit_11 = 0;
    }
}

void sub_80634E8(struct MapObject *, struct Sprite *);
void npc_update_obj_anim_flag(struct MapObject *, struct Sprite *);

void sub_80634D0(struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_80634E8(mapObject, sprite);
    npc_update_obj_anim_flag(mapObject, sprite);
}

#ifdef NONMATCHING
void sub_80634E8(struct MapObject *mapObject, struct Sprite *sprite)
{
    u16 x;
    u16 y;
    s16 x2;
    s16 y2;
    const struct MapObjectGraphicsInfo *graphicsInfo;
    mapObject->mapobj_bit_14 = 0;
    graphicsInfo = GetFieldObjectGraphicsInfo(mapObject->graphicsId);
    if (sprite->coordOffsetEnabled)
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX + gSpriteCoordOffsetX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY;
    } else
    {
        x = sprite->pos1.x + sprite->pos2.x + sprite->centerToCornerVecX;
        y = sprite->pos1.y + sprite->pos2.y + sprite->centerToCornerVecY;
    }
    x2 = graphicsInfo->width + x; // offending line
    y2 = graphicsInfo->height + y; // similarly offending line
    if ((s16)x >= 0x100 || x2 < -0x10)
    {
        mapObject->mapobj_bit_14 = 1;
    }
    if ((s16)y >= 0xB0 || y2 < -0x10)
    {
        mapObject->mapobj_bit_14 = 1;
    }
}
#else
__attribute__((naked))
void sub_80634E8(struct MapObject *mapObject, struct Sprite *sprite) {
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    adds r5, r0, 0\n\
    adds r4, r1, 0\n\
    ldrb r1, [r5, 0x1]\n\
    movs r0, 0x41\n\
    negs r0, r0\n\
    ands r0, r1\n\
    strb r0, [r5, 0x1]\n\
    ldrb r0, [r5, 0x5]\n\
    bl GetFieldObjectGraphicsInfo\n\
    adds r6, r0, 0\n\
    adds r0, r4, 0\n\
    adds r0, 0x3E\n\
    ldrb r1, [r0]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0806354C\n\
    ldrh r1, [r4, 0x24]\n\
    ldrh r0, [r4, 0x20]\n\
    adds r1, r0\n\
    adds r0, r4, 0\n\
    adds r0, 0x28\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    ldr r2, _08063544 @ =gSpriteCoordOffsetX\n\
    adds r0, r1\n\
    ldrh r2, [r2]\n\
    adds r0, r2\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    ldrh r1, [r4, 0x26]\n\
    ldrh r0, [r4, 0x22]\n\
    adds r1, r0\n\
    adds r0, r4, 0\n\
    adds r0, 0x29\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    ldr r2, _08063548 @ =gSpriteCoordOffsetY\n\
    adds r0, r1\n\
    ldrh r2, [r2]\n\
    adds r0, r2\n\
    b _08063574\n\
    .align 2, 0\n\
_08063544: .4byte gSpriteCoordOffsetX\n\
_08063548: .4byte gSpriteCoordOffsetY\n\
_0806354C:\n\
    ldrh r1, [r4, 0x24]\n\
    ldrh r0, [r4, 0x20]\n\
    adds r1, r0\n\
    adds r0, r4, 0\n\
    adds r0, 0x28\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    adds r0, r1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    ldrh r1, [r4, 0x26]\n\
    ldrh r0, [r4, 0x22]\n\
    adds r1, r0\n\
    adds r0, r4, 0\n\
    adds r0, 0x29\n\
    ldrb r0, [r0]\n\
    lsls r0, 24\n\
    asrs r0, 24\n\
    adds r0, r1\n\
_08063574:\n\
    lsls r0, 16\n\
    lsrs r2, r0, 16\n\
    ldrh r0, [r6, 0x8]\n\
    adds r0, r3\n\
    lsls r0, 16\n\
    lsrs r1, r0, 16\n\
    ldrh r0, [r6, 0xA]\n\
    adds r0, r2\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    cmp r0, 0xFF\n\
    bgt _0806359C\n\
    lsls r0, r1, 16\n\
    asrs r0, 16\n\
    movs r1, 0x10\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bge _080635A4\n\
_0806359C:\n\
    ldrb r0, [r5, 0x1]\n\
    movs r1, 0x40\n\
    orrs r0, r1\n\
    strb r0, [r5, 0x1]\n\
_080635A4:\n\
    lsls r0, r2, 16\n\
    asrs r0, 16\n\
    cmp r0, 0xAF\n\
    bgt _080635B8\n\
    lsls r0, r4, 16\n\
    asrs r0, 16\n\
    movs r1, 0x10\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bge _080635C0\n\
_080635B8:\n\
    ldrb r0, [r5, 0x1]\n\
    movs r1, 0x40\n\
    orrs r0, r1\n\
    strb r0, [r5, 0x1]\n\
_080635C0:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
.syntax divided\n");
}
#endif

void npc_update_obj_anim_flag(struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->invisible = 0;
    if (mapObject->mapobj_bit_13 || mapObject->mapobj_bit_14)
    {
        sprite->invisible = 1;
    }
}
