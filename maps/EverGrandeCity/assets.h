const u16 EverGrandeCity_MapBorder[] = INCBIN_U16("maps/EverGrandeCity/border.bin");

const u16 EverGrandeCity_MapBlockdata[] = INCBIN_U16("maps/EverGrandeCity/map.bin");

const struct MapData EverGrandeCity_MapAttributes =
{
    .width = 40,
    .height = 80,
    .border = EverGrandeCity_MapBorder,
    .map = EverGrandeCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_EverGrande,
};
