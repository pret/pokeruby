const u16 PetalburgCity_MapBorder[] = INCBIN_U16("maps/PetalburgCity/border.bin");

const u16 PetalburgCity_MapBlockdata[] = INCBIN_U16("maps/PetalburgCity/map.bin");

const struct MapData PetalburgCity_MapAttributes =
{
    .width = 30,
    .height = 30,
    .border = PetalburgCity_MapBorder,
    .map = PetalburgCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Petalburg,
};
