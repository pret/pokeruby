const u16 MauvilleCity_MapBorder[] = INCBIN_U16("maps/MauvilleCity/border.bin");

const u16 MauvilleCity_MapBlockdata[] = INCBIN_U16("maps/MauvilleCity/map.bin");

const struct MapData MauvilleCity_MapAttributes =
{
    .width = 40,
    .height = 20,
    .border = MauvilleCity_MapBorder,
    .map = MauvilleCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Mauville,
};
