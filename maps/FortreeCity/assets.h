const u16 FortreeCity_MapBorder[] = INCBIN_U16("maps/FortreeCity/border.bin");

const u16 FortreeCity_MapBlockdata[] = INCBIN_U16("maps/FortreeCity/map.bin");

const struct MapData FortreeCity_MapAttributes =
{
    .width = 40,
    .height = 20,
    .border = FortreeCity_MapBorder,
    .map = FortreeCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Fortree,
};
