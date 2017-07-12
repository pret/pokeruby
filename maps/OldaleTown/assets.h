const u16 OldaleTown_MapBorder[] = INCBIN_U16("maps/OldaleTown/border.bin");

const u16 OldaleTown_MapBlockdata[] = INCBIN_U16("maps/OldaleTown/map.bin");

const struct MapData OldaleTown_MapAttributes =
{
    .width = 20,
    .height = 20,
    .border = OldaleTown_MapBorder,
    .map = OldaleTown_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Petalburg,
};
