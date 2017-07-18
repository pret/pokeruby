const u16 LittlerootTown_MapBorder[] = INCBIN_U16("maps/LittlerootTown/border.bin");

const u16 LittlerootTown_MapBlockdata[] = INCBIN_U16("maps/LittlerootTown/map.bin");

const struct MapData LittlerootTown_MapAttributes =
{
    .width = 20,
    .height = 20,
    .border = LittlerootTown_MapBorder,
    .map = LittlerootTown_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Petalburg,
};
