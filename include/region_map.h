#ifndef GUARD_REGION_MAP_H
#define GUARD_REGION_MAP_H

struct RegionMapLocation
{
    u8 x, y;
    u8 width, height;
    const u8 *regionMapSectionId;
};

struct RegionMap
{
    u8 mapSectionName[20];
    /*0x14*/ u16 mapSectionId;
    /*0x16*/ u8 unk16;
    /*0x17*/ u8 everGrandeCityArea;
    /*0x18*/ u8 (*inputCallback)(void);
    struct Sprite *cursorSprite;
    struct Sprite *playerIconSprite;
    s32 bg2x;
    s32 bg2y;
    u32 unk2C;  //
    u32 unk30;  //  Map rotation parameters
    u32 unk34;  //  Likely a scrapped feature
    u32 unk38;  //
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    u16 cursorPosX;
    u16 cursorPosY;
    u16 cursorTileTag;
    u16 cursorPaletteTag;
    s16 scrollX;
    s16 scrollY;
    s16 unk60;
    s16 unk62;
    u16 unk64;
    u16 unk66;
    u16 unk68;
    u16 unk6A;
    u16 unk6C;
    u16 unk6E;
    u16 playerIconTileTag;
    u16 playerIconPaletteTag;
    u16 unk74;
    u16 unk76;
    bool8 zoomed;
    u8 initStep;
    s8 unk7A;
    s8 cursorDeltaX;
    s8 cursorDeltaY;
    bool8 needUpdateVideoRegs;
    bool8 blinkPlayerIcon;
    bool8 playerIsInCave;
    /*0x080*/ u8 filler80[0x100];
    /*0x180*/ u8 cursorSmallImage[0x100];
    /*0x280*/ u8 cursorLargeImage[0x600];
}; // size: 0x880

void InitRegionMap(struct RegionMap *regionMap, bool8 zoomed);
void sub_80FA904(struct RegionMap *regionMap, bool8 zoomed);
bool8 sub_80FA940(void);
void FreeRegionMapIconResources(void);
u8 sub_80FAB60(void);
void sub_80FAEC4(void);
u8 sub_80FAFC0(void);
void UpdateRegionMapVideoRegs(void);
void RegionMapDefaultZoomOffsetPlayerSprite(s16, s16);
u16 GetOverworldMapFromUnderwaterMap(u16 mapSectionId);
void CreateRegionMapCursor(u16, u16);
void CreateRegionMapPlayerIcon(u16, u16);
const u8 *GetMapSectionName(u8 *dest, u16 mapSectionId, u16 length);
const u8 *CopyMapName(u8 *dest, u16 b);
const u8 *CopyLocationName(u8 *dest, u16 b);
void CB2_InitFlyRegionMap(void);
void debug_sub_8110F28(void);
u16 GetRegionMapSectionAt_(u16 x, u16 y);
void sub_80FBF94(void);

extern const struct RegionMapLocation gRegionMapLocations[];

#endif // GUARD_REGION_MAP_H
