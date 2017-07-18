const u16 LilycoveCity_MapBorder[] = INCBIN_U16("maps/LilycoveCity/border.bin");

const u16 LilycoveCity_MapBlockdata[] = INCBIN_U16("maps/LilycoveCity/map.bin");

const struct MapData LilycoveCity_MapAttributes =
{
    .width = 80,
    .height = 40,
    .border = LilycoveCity_MapBorder,
    .map = LilycoveCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Lilycove,
};
