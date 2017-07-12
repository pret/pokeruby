const u16 LavaridgeTown_MapBorder[] = INCBIN_U16("maps/LavaridgeTown/border.bin");

const u16 LavaridgeTown_MapBlockdata[] = INCBIN_U16("maps/LavaridgeTown/map.bin");

const struct MapData LavaridgeTown_MapAttributes =
{
    .width = 20,
    .height = 20,
    .border = LavaridgeTown_MapBorder,
    .map = LavaridgeTown_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Lavaridge,
};
