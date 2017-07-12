const u16 SootopolisCity_MapBorder[] = INCBIN_U16("maps/SootopolisCity/border.bin");

const u16 SootopolisCity_MapBlockdata[] = INCBIN_U16("maps/SootopolisCity/map.bin");

const struct MapData SootopolisCity_MapAttributes =
{
    .width = 60,
    .height = 60,
    .border = SootopolisCity_MapBorder,
    .map = SootopolisCity_MapBlockdata,
    .primaryTileset = &gTileset_General,
    .secondaryTileset = &gTileset_Sootopolis,
};
