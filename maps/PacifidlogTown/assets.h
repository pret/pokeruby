const u16 PacifidlogTown_MapBorder[] = INCBIN_U16("maps/PacifidlogTown/border.bin");

const u16 PacifidlogTown_MapBlockdata[] = INCBIN_U16("maps/PacifidlogTown/map.bin");

const struct MapData PacifidlogTown_MapAttributes =
{
    .width = 20,
    .height = 40,
    .border = PacifidlogTown_MapBorder,
    .map = PacifidlogTown_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Pacifidlog,
};
