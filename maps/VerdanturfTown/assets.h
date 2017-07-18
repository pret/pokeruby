const u16 VerdanturfTown_MapBorder[] = INCBIN_U16("maps/VerdanturfTown/border.bin");

const u16 VerdanturfTown_MapBlockdata[] = INCBIN_U16("maps/VerdanturfTown/map.bin");

const struct MapData VerdanturfTown_MapAttributes =
{
    .width = 20,
    .height = 20,
    .border = VerdanturfTown_MapBorder,
    .map = VerdanturfTown_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Mauville,
};
