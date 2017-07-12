const u16 FallarborTown_MapBorder[] = INCBIN_U16("maps/FallarborTown/border.bin");

const u16 FallarborTown_MapBlockdata[] = INCBIN_U16("maps/FallarborTown/map.bin");

const struct MapData FallarborTown_MapAttributes =
{
    .width = 20,
    .height = 20,
    .border = FallarborTown_MapBorder,
    .map = FallarborTown_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Fallarbor,
};
