const u16 DewfordTown_MapBorder[] = INCBIN_U16("maps/DewfordTown/border.bin");

const u16 DewfordTown_MapBlockdata[] = INCBIN_U16("maps/DewfordTown/map.bin");

const struct MapData DewfordTown_MapAttributes =
{
    .width = 20,
    .height = 20,
    .border = DewfordTown_MapBorder,
    .map = DewfordTown_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Dewford,
};
