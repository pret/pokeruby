const u16 MossdeepCity_MapBorder[] = INCBIN_U16("maps/MossdeepCity/border.bin");

const u16 MossdeepCity_MapBlockdata[] = INCBIN_U16("maps/MossdeepCity/map.bin");

const struct MapData MossdeepCity_MapAttributes =
{
    .width = 80,
    .height = 40,
    .border = MossdeepCity_MapBorder,
    .map = MossdeepCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Mossdeep,
};
