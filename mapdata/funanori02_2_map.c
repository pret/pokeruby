//MapEditNH Ver.3.50 *.map -> C sourse Convert.
//Full Cell File Name (0-511)    : field.cell
//Part Cell File Name (512-1023) : shipyard.cell

#define	MapSizeX_funanori02_2	1
#define	MapSizeY_funanori02_2	1

const u16	funanori02_2_OutRangeCell[4]={
0x0170,0x0170,0x0170,0x0170,
};

const u16	funanori02_2_MapData[MapSizeX_funanori02_2*MapSizeY_funanori02_2]={
0x3234,
};

const MapScreenData	funanori02_2_map_data =
{
	MapSizeX_funanori02_2,
	MapSizeY_funanori02_2,
	funanori02_2_OutRangeCell,
	funanori02_2_MapData,
	&field_char_data,
	&shipyard_char_data
};
