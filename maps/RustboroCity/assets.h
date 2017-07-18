const u16 RustboroCity_MapBorder[] = INCBIN_U16("maps/RustboroCity/border.bin");

const u16 RustboroCity_MapBlockdata[] = INCBIN_U16("maps/RustboroCity/map.bin");

const struct MapData RustboroCity_MapAttributes =
{
    .width = 40,
    .height = 60,
    .border = RustboroCity_MapBorder,
    .map = RustboroCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Rustboro,
};
