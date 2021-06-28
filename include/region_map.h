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
    /*0x1C*/ struct Sprite *cursorSprite;
    /*0x20*/ struct Sprite *playerIconSprite;
    /*0x24*/ s32 bg2x;
    /*0x28*/ s32 bg2y;
    /*0x2C*/ u32 unk2C;  //
    /*0x30*/ u32 unk30;  //  Map rotation parameters
    /*0x34*/ u32 unk34;  //  Likely a scrapped feature
    /*0x38*/ u32 unk38;  //
    /*0x3C*/ s32 unk3C;
    /*0x40*/ s32 unk40;
    /*0x44*/ s32 unk44;
    /*0x48*/ s32 unk48;
    /*0x4C*/ s32 unk4C;
    /*0x50*/ s32 unk50;
    /*0x54*/ u16 cursorPosX;
    /*0x56*/ u16 cursorPosY;
    /*0x58*/ u16 cursorTileTag;
    /*0x5A*/ u16 cursorPaletteTag;
    /*0x5C*/ s16 scrollX;
    /*0x5E*/ s16 scrollY;
    /*0x60*/ s16 unk60;
    /*0x62*/ s16 unk62;
    /*0x64*/ u16 unk64;
    /*0x66*/ u16 unk66;
    /*0x68*/ u16 unk68;
    /*0x6A*/ u16 unk6A;
    /*0x6C*/ u16 unk6C;
    /*0x6E*/ u16 unk6E;
    /*0x70*/ u16 playerIconTileTag;
    /*0x72*/ u16 playerIconPaletteTag;
    /*0x74*/ u16 unk74;
    /*0x76*/ u16 unk76;
    /*0x78*/ bool8 zoomed;
    /*0x79*/ u8 initStep;
    /*0x7A*/ s8 unk7A;
    /*0x7B*/ s8 cursorDeltaX;
    /*0x7C*/ s8 cursorDeltaY;
    /*0x7D*/ bool8 needUpdateVideoRegs;
    /*0x7E*/ bool8 blinkPlayerIcon;
    /*0x7F*/ bool8 playerIsInCave;
    /*0x080*/ u8 filler80[0x100];
    /*0x180*/ u8 cursorSmallImage[0x100];
    /*0x280*/ u8 cursorLargeImage[0x600];
}; // size: 0x880

// Replaces field_region_map.c:UnkStruct, region_map.c:UnknownStruct3
struct RegionMapState
{
    void (*callback)(void);
    u16 state;
    u16 mapSectionId;
    struct RegionMap regionMap;
    u16 unk_888[0xE0];
    u8 blankMapName[0x26];
    bool8 choseFlyLocation;
};

extern struct RegionMapState *const gRegionMapState;

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

extern const struct RegionMapLocation gRegionMapEntries[];

#endif // GUARD_REGION_MAP_H
