#ifndef GUARD_REGION_MAP_H
#define GUARD_REGION_MAP_H

struct RegionMap
{
    u8 mapSecName[0x14];
    u16 mapSecId;
    u8 unk16;
    u8 everGrandeCityArea;
    u8 (*inputCallback)(void);
    struct Sprite *cursorIconSprite;
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
    u16 cursorIconTileTag;
    u16 cursorIconPaletteTag;
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
    u8 filler80[0x100];
    u8 unk180[0x100];
    u8 unk280[0x600];
};

void InitRegionMap(struct RegionMap *regionMap, bool8 b);
void FreeRegionMapIconResources(void);
u8 sub_80FAB60(void);
void CreateRegionMapCursorIcon(u16, u16);
void CreateRegionMapPlayerIcon(u16, u16);
const u8 *GetMapSectionName(u8 *dest, u16 mapSecId, u16 length);
const u8 *CopyMapName(u8 *dest, u16 b);
const u8 *CopyLocationName(u8 *dest, u16 b);

#endif // GUARD_REGION_MAP_H
