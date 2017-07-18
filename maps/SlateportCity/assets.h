const u16 SlateportCity_MapBorder[] = INCBIN_U16("maps/SlateportCity/border.bin");

const u16 SlateportCity_MapBlockdata[] = INCBIN_U16("maps/SlateportCity/map.bin");

const struct MapData SlateportCity_MapAttributes =
{
    .width = 40,
    .height = 60,
    .border = SlateportCity_MapBorder,
    .map = SlateportCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Slateport,
};
